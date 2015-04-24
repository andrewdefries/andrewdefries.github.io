---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.562302, -2.455328, -1.020773, 1, 0, 0, 1,
-3.369931, 0.2391184, -1.047586, 1, 0.007843138, 0, 1,
-2.8235, -0.5530181, -1.105928, 1, 0.01176471, 0, 1,
-2.817849, 0.7236691, 0.1107733, 1, 0.01960784, 0, 1,
-2.807833, 0.3870381, -2.394437, 1, 0.02352941, 0, 1,
-2.642953, -0.03350548, -1.159156, 1, 0.03137255, 0, 1,
-2.474125, -1.319439, -0.2722186, 1, 0.03529412, 0, 1,
-2.332766, 0.126987, 1.088958, 1, 0.04313726, 0, 1,
-2.314388, -0.09455562, -0.5334032, 1, 0.04705882, 0, 1,
-2.252593, -1.715979, -2.762883, 1, 0.05490196, 0, 1,
-2.216742, -0.6465247, -3.223306, 1, 0.05882353, 0, 1,
-2.19065, -0.4717284, -1.622187, 1, 0.06666667, 0, 1,
-2.147394, -0.5400031, -1.364947, 1, 0.07058824, 0, 1,
-2.102595, 0.1779917, 0.4167051, 1, 0.07843138, 0, 1,
-2.082911, -0.670747, 0.07975264, 1, 0.08235294, 0, 1,
-2.082749, -0.5934094, -1.160212, 1, 0.09019608, 0, 1,
-2.04626, 1.202501, -1.074806, 1, 0.09411765, 0, 1,
-1.998336, -1.158131, -2.606648, 1, 0.1019608, 0, 1,
-1.982424, -0.9132674, -0.9056637, 1, 0.1098039, 0, 1,
-1.949576, 0.09062654, -2.499936, 1, 0.1137255, 0, 1,
-1.948472, 0.12889, -1.877676, 1, 0.1215686, 0, 1,
-1.894932, 1.618261, 0.3158366, 1, 0.1254902, 0, 1,
-1.887375, -0.03149241, -1.572695, 1, 0.1333333, 0, 1,
-1.859324, -0.01100136, -1.765368, 1, 0.1372549, 0, 1,
-1.853918, 0.1759758, -0.1343586, 1, 0.145098, 0, 1,
-1.846317, 0.07857102, -2.86285, 1, 0.1490196, 0, 1,
-1.839512, -1.609864, -1.31087, 1, 0.1568628, 0, 1,
-1.821529, -0.444401, -3.197607, 1, 0.1607843, 0, 1,
-1.808834, -0.01174059, -0.06274642, 1, 0.1686275, 0, 1,
-1.802214, 0.9292986, -2.280968, 1, 0.172549, 0, 1,
-1.769034, 0.391585, -1.235871, 1, 0.1803922, 0, 1,
-1.742721, -1.563068, -2.679021, 1, 0.1843137, 0, 1,
-1.734489, 1.478385, 0.7304406, 1, 0.1921569, 0, 1,
-1.73363, -1.62851, -4.222998, 1, 0.1960784, 0, 1,
-1.711262, 0.09629412, -1.967393, 1, 0.2039216, 0, 1,
-1.705972, -0.1337142, -1.514789, 1, 0.2117647, 0, 1,
-1.697351, -0.5350298, -1.68826, 1, 0.2156863, 0, 1,
-1.670227, -0.06503446, 0.2520301, 1, 0.2235294, 0, 1,
-1.665189, -0.4384414, -0.2313787, 1, 0.227451, 0, 1,
-1.636114, 0.2540902, 0.1956863, 1, 0.2352941, 0, 1,
-1.635882, 1.521944, -1.048255, 1, 0.2392157, 0, 1,
-1.632048, 0.6640377, -1.440116, 1, 0.2470588, 0, 1,
-1.624699, -0.216525, -3.032171, 1, 0.2509804, 0, 1,
-1.608836, -0.194609, -1.14051, 1, 0.2588235, 0, 1,
-1.603002, -0.4351975, -1.580361, 1, 0.2627451, 0, 1,
-1.602229, 0.6975923, -0.4620098, 1, 0.2705882, 0, 1,
-1.593078, 1.427676, -0.9282938, 1, 0.2745098, 0, 1,
-1.588131, 0.8994738, -0.7999008, 1, 0.282353, 0, 1,
-1.567966, 0.01293756, -1.214593, 1, 0.2862745, 0, 1,
-1.555219, -0.6136063, -2.399953, 1, 0.2941177, 0, 1,
-1.552836, 0.3239677, -2.136699, 1, 0.3019608, 0, 1,
-1.548134, 0.8936899, -0.8705615, 1, 0.3058824, 0, 1,
-1.540272, 1.636517, -2.540588, 1, 0.3137255, 0, 1,
-1.518208, -0.2105469, -1.426073, 1, 0.3176471, 0, 1,
-1.502956, -0.6417212, -2.730795, 1, 0.3254902, 0, 1,
-1.499254, -0.2671544, -1.814613, 1, 0.3294118, 0, 1,
-1.494556, -0.1085997, -1.501678, 1, 0.3372549, 0, 1,
-1.49384, 0.8774173, -0.2760272, 1, 0.3411765, 0, 1,
-1.482725, -0.3276525, -2.698746, 1, 0.3490196, 0, 1,
-1.478585, 0.3790581, -1.138233, 1, 0.3529412, 0, 1,
-1.47809, 1.633896, -0.4646317, 1, 0.3607843, 0, 1,
-1.473694, 1.519103, -0.6739997, 1, 0.3647059, 0, 1,
-1.471733, 1.01158, 1.271722, 1, 0.372549, 0, 1,
-1.471583, -0.1998639, -1.413335, 1, 0.3764706, 0, 1,
-1.462865, -0.5472738, -1.686216, 1, 0.3843137, 0, 1,
-1.459972, -1.011746, -0.3000083, 1, 0.3882353, 0, 1,
-1.44801, -2.947763, -2.104034, 1, 0.3960784, 0, 1,
-1.432377, -2.019524, -2.807043, 1, 0.4039216, 0, 1,
-1.414398, -0.6623193, -0.8422214, 1, 0.4078431, 0, 1,
-1.407007, 1.885375, 0.8556744, 1, 0.4156863, 0, 1,
-1.379802, -1.352691, -2.699805, 1, 0.4196078, 0, 1,
-1.374364, 0.5704183, -0.8005708, 1, 0.427451, 0, 1,
-1.369874, 0.8949583, -1.714904, 1, 0.4313726, 0, 1,
-1.369674, 0.9141919, -0.8192363, 1, 0.4392157, 0, 1,
-1.347132, 0.7853301, -0.296723, 1, 0.4431373, 0, 1,
-1.342439, -1.455291, -2.624145, 1, 0.4509804, 0, 1,
-1.341406, -0.7949172, -2.66967, 1, 0.454902, 0, 1,
-1.340737, -1.682286, -1.270288, 1, 0.4627451, 0, 1,
-1.32876, 1.176452, -0.07364419, 1, 0.4666667, 0, 1,
-1.323478, 1.640606, -1.267289, 1, 0.4745098, 0, 1,
-1.322247, 0.2897246, -2.116496, 1, 0.4784314, 0, 1,
-1.318905, -0.5242735, -1.344725, 1, 0.4862745, 0, 1,
-1.310444, 0.5811234, -1.37475, 1, 0.4901961, 0, 1,
-1.300523, 0.01449622, -1.820532, 1, 0.4980392, 0, 1,
-1.300316, 0.3724945, -2.532616, 1, 0.5058824, 0, 1,
-1.29613, 1.016458, -2.828741, 1, 0.509804, 0, 1,
-1.288881, 0.04839908, 0.1841284, 1, 0.5176471, 0, 1,
-1.288854, 1.214571, 1.21525, 1, 0.5215687, 0, 1,
-1.282066, 2.598731, 1.209401, 1, 0.5294118, 0, 1,
-1.271427, -0.7505213, -2.791226, 1, 0.5333334, 0, 1,
-1.267746, 0.8093181, -1.440399, 1, 0.5411765, 0, 1,
-1.256722, -1.617965, -2.532296, 1, 0.5450981, 0, 1,
-1.255337, -0.8213724, -2.347579, 1, 0.5529412, 0, 1,
-1.250489, -1.799604, -0.9991216, 1, 0.5568628, 0, 1,
-1.243317, 2.187662, 0.2515734, 1, 0.5647059, 0, 1,
-1.225285, 0.4087907, -0.9711909, 1, 0.5686275, 0, 1,
-1.219682, -0.3778594, -1.86858, 1, 0.5764706, 0, 1,
-1.216949, -1.715568, -1.163496, 1, 0.5803922, 0, 1,
-1.215942, 0.7483954, 0.02601546, 1, 0.5882353, 0, 1,
-1.211958, -1.231286, -2.764308, 1, 0.5921569, 0, 1,
-1.210133, 0.03469272, -0.8448754, 1, 0.6, 0, 1,
-1.208017, 2.020627, -1.819245, 1, 0.6078432, 0, 1,
-1.205939, -1.468843, -2.1522, 1, 0.6117647, 0, 1,
-1.203512, 0.04134247, -2.332081, 1, 0.6196079, 0, 1,
-1.200697, -0.9114384, -5.010264, 1, 0.6235294, 0, 1,
-1.1998, 1.481246, 0.04438538, 1, 0.6313726, 0, 1,
-1.192211, -0.8798874, 0.1758857, 1, 0.6352941, 0, 1,
-1.185228, -0.02835644, -1.16427, 1, 0.6431373, 0, 1,
-1.182666, -1.387314, -2.218651, 1, 0.6470588, 0, 1,
-1.181644, 0.2576323, -1.349933, 1, 0.654902, 0, 1,
-1.171761, -1.251217, -1.114301, 1, 0.6588235, 0, 1,
-1.170512, 1.059211, -2.231795, 1, 0.6666667, 0, 1,
-1.166363, 0.2289857, -0.1000022, 1, 0.6705883, 0, 1,
-1.161857, -0.2484694, -2.49904, 1, 0.6784314, 0, 1,
-1.160951, -1.503339, -2.083067, 1, 0.682353, 0, 1,
-1.157031, -2.76217, -3.211806, 1, 0.6901961, 0, 1,
-1.13112, -0.30473, -1.926565, 1, 0.6941177, 0, 1,
-1.128674, 1.307882, -0.1456014, 1, 0.7019608, 0, 1,
-1.12753, 0.270841, -1.484047, 1, 0.7098039, 0, 1,
-1.122165, 0.4423599, -0.3271554, 1, 0.7137255, 0, 1,
-1.12171, 1.184957, -2.289719, 1, 0.7215686, 0, 1,
-1.11688, 1.892313, 0.3682412, 1, 0.7254902, 0, 1,
-1.108256, 0.5887283, 0.9817445, 1, 0.7333333, 0, 1,
-1.10485, 1.373768, -0.534307, 1, 0.7372549, 0, 1,
-1.103001, -1.469077, -1.91013, 1, 0.7450981, 0, 1,
-1.096053, 1.566533, -0.03460887, 1, 0.7490196, 0, 1,
-1.095813, 1.024032, -0.2576389, 1, 0.7568628, 0, 1,
-1.095369, 0.3957792, -2.333069, 1, 0.7607843, 0, 1,
-1.094621, 0.354166, 0.3635062, 1, 0.7686275, 0, 1,
-1.09331, 3.200625, -0.3991961, 1, 0.772549, 0, 1,
-1.091622, -1.363178, -2.23106, 1, 0.7803922, 0, 1,
-1.087001, 0.1064986, -0.007894138, 1, 0.7843137, 0, 1,
-1.086655, -1.124144, -3.493835, 1, 0.7921569, 0, 1,
-1.077, 0.1950012, 0.2422153, 1, 0.7960784, 0, 1,
-1.074702, -1.062425, -1.408146, 1, 0.8039216, 0, 1,
-1.070514, -1.096434, -2.571207, 1, 0.8117647, 0, 1,
-1.069717, 1.27934, -0.3014484, 1, 0.8156863, 0, 1,
-1.068314, -1.213061, -1.121526, 1, 0.8235294, 0, 1,
-1.06387, 0.1745421, 0.2056537, 1, 0.827451, 0, 1,
-1.063296, -0.6526036, -3.055048, 1, 0.8352941, 0, 1,
-1.061922, 0.3400829, -1.505824, 1, 0.8392157, 0, 1,
-1.058923, -0.5591222, -1.200161, 1, 0.8470588, 0, 1,
-1.056093, -0.866221, -2.368309, 1, 0.8509804, 0, 1,
-1.054988, 0.2270948, -1.116844, 1, 0.8588235, 0, 1,
-1.054175, 0.7607638, 0.5039586, 1, 0.8627451, 0, 1,
-1.052029, 0.2631446, -1.027705, 1, 0.8705882, 0, 1,
-1.046295, 0.07710743, -0.9380697, 1, 0.8745098, 0, 1,
-1.032826, 0.4072093, 0.1428143, 1, 0.8823529, 0, 1,
-1.031394, -0.9501801, -3.065909, 1, 0.8862745, 0, 1,
-1.030528, -0.9820371, -1.7746, 1, 0.8941177, 0, 1,
-1.027979, 0.8328382, -1.471777, 1, 0.8980392, 0, 1,
-1.016159, -0.5392615, -3.093384, 1, 0.9058824, 0, 1,
-1.015711, 1.253453, 0.3565161, 1, 0.9137255, 0, 1,
-1.013465, 0.8953649, -0.6900762, 1, 0.9176471, 0, 1,
-1.007725, -1.776763, -2.924169, 1, 0.9254902, 0, 1,
-1.004421, 0.8938051, 0.177589, 1, 0.9294118, 0, 1,
-0.9960926, 0.6719418, -0.6679882, 1, 0.9372549, 0, 1,
-0.9926686, -0.3740049, -1.637609, 1, 0.9411765, 0, 1,
-0.9918463, -1.357727, -4.053702, 1, 0.9490196, 0, 1,
-0.9896504, -0.9059128, -2.641742, 1, 0.9529412, 0, 1,
-0.9802212, 1.60488, -1.410382, 1, 0.9607843, 0, 1,
-0.9739644, 2.268492, -1.335213, 1, 0.9647059, 0, 1,
-0.973632, -1.344059, -2.767749, 1, 0.972549, 0, 1,
-0.9719805, 0.1021723, -2.088444, 1, 0.9764706, 0, 1,
-0.9715112, 0.5330107, -0.886547, 1, 0.9843137, 0, 1,
-0.9708786, 0.06772172, -0.7253238, 1, 0.9882353, 0, 1,
-0.9680896, 0.611726, -2.937514, 1, 0.9960784, 0, 1,
-0.9627516, 1.148175, 0.09423401, 0.9960784, 1, 0, 1,
-0.9621442, -1.092034, -1.744497, 0.9921569, 1, 0, 1,
-0.9608778, 0.1616824, -2.17115, 0.9843137, 1, 0, 1,
-0.9583938, -0.8625088, -1.9909, 0.9803922, 1, 0, 1,
-0.9484587, -0.3401851, -1.574482, 0.972549, 1, 0, 1,
-0.942771, 0.7615697, 0.7619088, 0.9686275, 1, 0, 1,
-0.9407686, -0.2008377, -2.551414, 0.9607843, 1, 0, 1,
-0.938167, -0.08113718, -1.690874, 0.9568627, 1, 0, 1,
-0.93254, -0.7131909, -3.097544, 0.9490196, 1, 0, 1,
-0.9316093, 0.5022686, -1.576952, 0.945098, 1, 0, 1,
-0.9265116, 0.07790192, -2.423555, 0.9372549, 1, 0, 1,
-0.919903, 0.2357697, -0.6433977, 0.9333333, 1, 0, 1,
-0.916751, -0.03458418, -1.320443, 0.9254902, 1, 0, 1,
-0.911689, 0.6644197, 0.5084116, 0.9215686, 1, 0, 1,
-0.8990664, -1.647793, -4.27521, 0.9137255, 1, 0, 1,
-0.8982417, 0.9099189, -0.5096461, 0.9098039, 1, 0, 1,
-0.8964881, -0.4774817, -1.512318, 0.9019608, 1, 0, 1,
-0.89352, -0.819851, -0.9197901, 0.8941177, 1, 0, 1,
-0.892756, -1.891023, -2.567374, 0.8901961, 1, 0, 1,
-0.8866991, 0.9344363, -0.8587021, 0.8823529, 1, 0, 1,
-0.8846497, -0.1313904, -1.774173, 0.8784314, 1, 0, 1,
-0.8754537, 2.003123, -0.5534702, 0.8705882, 1, 0, 1,
-0.8712893, 0.9863036, -1.007102, 0.8666667, 1, 0, 1,
-0.865438, -1.444748, -3.710569, 0.8588235, 1, 0, 1,
-0.8609828, 1.871338, -0.8086151, 0.854902, 1, 0, 1,
-0.8569341, -0.5532634, -0.3977658, 0.8470588, 1, 0, 1,
-0.8534923, -1.288394, -2.540153, 0.8431373, 1, 0, 1,
-0.8490732, -0.8099775, -4.223043, 0.8352941, 1, 0, 1,
-0.847243, -0.8940109, -2.48873, 0.8313726, 1, 0, 1,
-0.8416215, -1.042918, -2.474977, 0.8235294, 1, 0, 1,
-0.833193, -0.3126329, -2.008616, 0.8196079, 1, 0, 1,
-0.8303, -1.860564, -3.484246, 0.8117647, 1, 0, 1,
-0.8230145, 0.9092416, -0.7050506, 0.8078431, 1, 0, 1,
-0.8185434, -0.446432, -1.30622, 0.8, 1, 0, 1,
-0.8172514, -1.192932, -2.945524, 0.7921569, 1, 0, 1,
-0.8162486, -1.366228, -3.175347, 0.7882353, 1, 0, 1,
-0.8093135, 0.4790959, -3.723106, 0.7803922, 1, 0, 1,
-0.8091097, 0.3489817, -0.3936684, 0.7764706, 1, 0, 1,
-0.8059176, 1.655106, 0.3316089, 0.7686275, 1, 0, 1,
-0.7933206, 0.6081547, -0.586836, 0.7647059, 1, 0, 1,
-0.7914447, -0.3539344, -2.092364, 0.7568628, 1, 0, 1,
-0.7878014, -0.7391946, -3.555808, 0.7529412, 1, 0, 1,
-0.7876888, 0.6902109, 0.1324572, 0.7450981, 1, 0, 1,
-0.7825138, -0.3065485, -0.8841017, 0.7411765, 1, 0, 1,
-0.7821603, -0.5958371, -1.929348, 0.7333333, 1, 0, 1,
-0.7744577, 0.03490138, -2.615446, 0.7294118, 1, 0, 1,
-0.7728258, 2.232818, -0.2074983, 0.7215686, 1, 0, 1,
-0.7704879, -0.5746151, -2.563916, 0.7176471, 1, 0, 1,
-0.7630022, -0.9320341, -4.21344, 0.7098039, 1, 0, 1,
-0.759863, 0.01004381, -0.6754101, 0.7058824, 1, 0, 1,
-0.7594521, -1.038982, -3.275689, 0.6980392, 1, 0, 1,
-0.7528473, 0.6254947, -1.641103, 0.6901961, 1, 0, 1,
-0.7486534, 0.07977674, -0.5252523, 0.6862745, 1, 0, 1,
-0.7347729, -0.6570273, -1.903999, 0.6784314, 1, 0, 1,
-0.7346687, -0.2473879, -2.682811, 0.6745098, 1, 0, 1,
-0.730339, 0.4130391, -0.002910514, 0.6666667, 1, 0, 1,
-0.7252976, 0.7413257, -1.5324, 0.6627451, 1, 0, 1,
-0.7242372, -1.79167, -2.968829, 0.654902, 1, 0, 1,
-0.7224208, -0.2621583, -1.389952, 0.6509804, 1, 0, 1,
-0.7218872, -0.6993732, -0.9054106, 0.6431373, 1, 0, 1,
-0.7165989, -0.1514757, -0.944486, 0.6392157, 1, 0, 1,
-0.7130936, 0.01363302, -1.461655, 0.6313726, 1, 0, 1,
-0.7085794, 0.7952775, -0.5410979, 0.627451, 1, 0, 1,
-0.7031741, -0.07290209, -3.474072, 0.6196079, 1, 0, 1,
-0.7023125, 0.1229479, -1.858545, 0.6156863, 1, 0, 1,
-0.698212, -0.8067689, -0.2112483, 0.6078432, 1, 0, 1,
-0.6974364, -0.2195143, -2.189429, 0.6039216, 1, 0, 1,
-0.6973553, -0.1159872, -1.189225, 0.5960785, 1, 0, 1,
-0.6906638, 0.591951, -0.5953898, 0.5882353, 1, 0, 1,
-0.6858272, -0.1049649, -1.872634, 0.5843138, 1, 0, 1,
-0.6836087, -0.7383143, -2.180716, 0.5764706, 1, 0, 1,
-0.6835796, 1.018148, -0.1011497, 0.572549, 1, 0, 1,
-0.6835582, -0.6710739, -2.085913, 0.5647059, 1, 0, 1,
-0.6833912, -0.07351005, -3.12183, 0.5607843, 1, 0, 1,
-0.6726875, -0.5201829, -2.260379, 0.5529412, 1, 0, 1,
-0.6708108, -0.4181701, -1.965272, 0.5490196, 1, 0, 1,
-0.6650525, 0.08783811, -2.070925, 0.5411765, 1, 0, 1,
-0.6586247, 0.2848705, -1.171316, 0.5372549, 1, 0, 1,
-0.6571329, -0.3774735, -2.514162, 0.5294118, 1, 0, 1,
-0.6549132, 0.9001634, 0.06734001, 0.5254902, 1, 0, 1,
-0.6543774, -1.317334, -1.45924, 0.5176471, 1, 0, 1,
-0.6498464, 1.375957, -0.8130939, 0.5137255, 1, 0, 1,
-0.6491061, 1.869757, -0.1982192, 0.5058824, 1, 0, 1,
-0.6466584, -1.745733, -3.17493, 0.5019608, 1, 0, 1,
-0.6460027, -0.2519912, -2.922451, 0.4941176, 1, 0, 1,
-0.6436654, 0.189476, -0.8063431, 0.4862745, 1, 0, 1,
-0.6422053, 1.368939, -0.6190847, 0.4823529, 1, 0, 1,
-0.6386122, 0.3847982, -1.828939, 0.4745098, 1, 0, 1,
-0.6280004, 0.5257796, -0.7710767, 0.4705882, 1, 0, 1,
-0.6260152, 0.06827904, -1.966456, 0.4627451, 1, 0, 1,
-0.6220771, 0.9371143, 0.5560927, 0.4588235, 1, 0, 1,
-0.6137515, 1.160285, -0.2113087, 0.4509804, 1, 0, 1,
-0.6127672, 0.2913327, -1.486252, 0.4470588, 1, 0, 1,
-0.6118563, 0.1082555, -0.4611736, 0.4392157, 1, 0, 1,
-0.6104975, -0.9839434, -2.927899, 0.4352941, 1, 0, 1,
-0.605652, 1.369588, -0.4321858, 0.427451, 1, 0, 1,
-0.6021315, 1.469419, -1.645842, 0.4235294, 1, 0, 1,
-0.5990251, -0.06769248, -2.916616, 0.4156863, 1, 0, 1,
-0.5976582, 0.8510129, -0.2811782, 0.4117647, 1, 0, 1,
-0.5906776, 0.6497813, -0.06762188, 0.4039216, 1, 0, 1,
-0.5897393, -0.4898852, -0.4436704, 0.3960784, 1, 0, 1,
-0.586571, -0.6132588, -1.940282, 0.3921569, 1, 0, 1,
-0.5862606, 0.99076, 1.417744, 0.3843137, 1, 0, 1,
-0.5826863, 1.284899, 0.08629962, 0.3803922, 1, 0, 1,
-0.579554, -0.6576201, -1.955713, 0.372549, 1, 0, 1,
-0.5782411, -0.583061, -3.232864, 0.3686275, 1, 0, 1,
-0.5743903, -0.8249292, -1.815337, 0.3607843, 1, 0, 1,
-0.5729195, 0.5499566, -0.4018428, 0.3568628, 1, 0, 1,
-0.5690219, 0.649735, -1.026782, 0.3490196, 1, 0, 1,
-0.5681802, 0.4953446, -1.943652, 0.345098, 1, 0, 1,
-0.563879, 0.8502715, 1.525254, 0.3372549, 1, 0, 1,
-0.5587416, 1.500297, -0.6952341, 0.3333333, 1, 0, 1,
-0.5564256, -0.0217039, -0.6674818, 0.3254902, 1, 0, 1,
-0.5514897, -1.691688, -2.322811, 0.3215686, 1, 0, 1,
-0.5460061, 0.6840968, -1.263485, 0.3137255, 1, 0, 1,
-0.5400666, -0.08999857, -3.620381, 0.3098039, 1, 0, 1,
-0.5394208, -2.26515, -2.777122, 0.3019608, 1, 0, 1,
-0.5374379, 1.306654, -1.734341, 0.2941177, 1, 0, 1,
-0.5352497, -1.314265, -1.285122, 0.2901961, 1, 0, 1,
-0.5326883, -0.05675533, -2.633047, 0.282353, 1, 0, 1,
-0.5320996, 0.5168141, -1.999122, 0.2784314, 1, 0, 1,
-0.5286479, -0.8514722, -1.9756, 0.2705882, 1, 0, 1,
-0.5216199, -0.4291567, -2.554483, 0.2666667, 1, 0, 1,
-0.5183823, 1.497842, -0.4832965, 0.2588235, 1, 0, 1,
-0.51738, -1.613207, -3.746569, 0.254902, 1, 0, 1,
-0.5125622, -0.3965875, -1.323233, 0.2470588, 1, 0, 1,
-0.5087118, -0.1654557, -0.850262, 0.2431373, 1, 0, 1,
-0.5086454, -1.946475, -4.060919, 0.2352941, 1, 0, 1,
-0.5027785, 0.5111923, -0.4975477, 0.2313726, 1, 0, 1,
-0.5004186, 0.7491181, 0.2670308, 0.2235294, 1, 0, 1,
-0.4987993, -1.235221, -4.775683, 0.2196078, 1, 0, 1,
-0.4986785, 0.6505699, 1.766119, 0.2117647, 1, 0, 1,
-0.4957598, -1.450251, -1.750684, 0.2078431, 1, 0, 1,
-0.4953364, 2.709606, -1.001212, 0.2, 1, 0, 1,
-0.495284, -1.061552, -2.604156, 0.1921569, 1, 0, 1,
-0.4925137, -2.132764, -2.110142, 0.1882353, 1, 0, 1,
-0.4857392, -0.693592, -3.046182, 0.1803922, 1, 0, 1,
-0.4845937, -0.4791959, -2.508532, 0.1764706, 1, 0, 1,
-0.4726187, 0.677688, -0.8639709, 0.1686275, 1, 0, 1,
-0.4651175, 0.5358512, 0.4036979, 0.1647059, 1, 0, 1,
-0.4615854, -1.823544, -2.750838, 0.1568628, 1, 0, 1,
-0.461578, 0.8506958, 0.450177, 0.1529412, 1, 0, 1,
-0.4591489, -1.021977, -4.581994, 0.145098, 1, 0, 1,
-0.4554936, 0.3713087, 1.544976, 0.1411765, 1, 0, 1,
-0.449414, 2.355083, -1.115221, 0.1333333, 1, 0, 1,
-0.44709, 0.9504713, -0.197204, 0.1294118, 1, 0, 1,
-0.4465742, 1.530768, -1.335056, 0.1215686, 1, 0, 1,
-0.4432914, 0.2060832, -0.9010276, 0.1176471, 1, 0, 1,
-0.4405689, 1.943762, -0.9355584, 0.1098039, 1, 0, 1,
-0.4401467, -0.2039475, -1.803103, 0.1058824, 1, 0, 1,
-0.4391367, 0.6948719, -0.8601757, 0.09803922, 1, 0, 1,
-0.4362614, -1.208725, -2.745575, 0.09019608, 1, 0, 1,
-0.4339314, 0.2647514, -1.934234, 0.08627451, 1, 0, 1,
-0.433851, -0.5914563, -3.352398, 0.07843138, 1, 0, 1,
-0.4283165, 0.4451735, 0.7171252, 0.07450981, 1, 0, 1,
-0.428095, -2.99797, -4.329837, 0.06666667, 1, 0, 1,
-0.4273796, 1.702737, 0.4146346, 0.0627451, 1, 0, 1,
-0.4257486, 0.7797151, -0.6579598, 0.05490196, 1, 0, 1,
-0.4247845, 0.312348, 0.1204928, 0.05098039, 1, 0, 1,
-0.418063, 0.2325937, -0.267133, 0.04313726, 1, 0, 1,
-0.4165693, -0.2341735, -0.2160871, 0.03921569, 1, 0, 1,
-0.4150053, -1.369597, -2.787867, 0.03137255, 1, 0, 1,
-0.4149536, 0.2025917, -1.069843, 0.02745098, 1, 0, 1,
-0.4114833, -0.4353415, -3.120502, 0.01960784, 1, 0, 1,
-0.4084736, 0.3270424, -0.7780232, 0.01568628, 1, 0, 1,
-0.406541, -0.4727954, -3.140855, 0.007843138, 1, 0, 1,
-0.4063351, -0.1886589, -2.864182, 0.003921569, 1, 0, 1,
-0.4062333, -2.129788, -3.685848, 0, 1, 0.003921569, 1,
-0.4056391, 0.8358477, 0.1211634, 0, 1, 0.01176471, 1,
-0.3970064, -0.8194903, -3.499476, 0, 1, 0.01568628, 1,
-0.3962721, 1.713074, -1.212204, 0, 1, 0.02352941, 1,
-0.3940243, 1.741297, -0.6716139, 0, 1, 0.02745098, 1,
-0.3916801, 0.06894316, -1.438464, 0, 1, 0.03529412, 1,
-0.3908009, 0.9188372, -0.7769378, 0, 1, 0.03921569, 1,
-0.3875046, 0.4337696, -1.390768, 0, 1, 0.04705882, 1,
-0.3867573, 0.5600021, -1.521849, 0, 1, 0.05098039, 1,
-0.3867409, -0.1622252, -0.9549537, 0, 1, 0.05882353, 1,
-0.386028, -0.1567804, -1.00884, 0, 1, 0.0627451, 1,
-0.3825311, 0.3163305, -1.626771, 0, 1, 0.07058824, 1,
-0.3804491, -0.9073685, -4.433221, 0, 1, 0.07450981, 1,
-0.3801548, 0.2687134, -1.652225, 0, 1, 0.08235294, 1,
-0.3786061, 0.06119529, -0.8247184, 0, 1, 0.08627451, 1,
-0.3736827, -0.1751977, -1.76624, 0, 1, 0.09411765, 1,
-0.3727302, -0.6633405, -2.106646, 0, 1, 0.1019608, 1,
-0.3709045, 0.7399285, -0.3243562, 0, 1, 0.1058824, 1,
-0.3657007, -0.2123811, -1.371801, 0, 1, 0.1137255, 1,
-0.3625349, 0.8396128, -0.7489774, 0, 1, 0.1176471, 1,
-0.3589857, 0.5962322, -2.069536, 0, 1, 0.1254902, 1,
-0.3550679, 1.049782, 0.9997753, 0, 1, 0.1294118, 1,
-0.3475265, -1.247833, -2.843145, 0, 1, 0.1372549, 1,
-0.339079, 1.187781, -1.065496, 0, 1, 0.1411765, 1,
-0.3384373, -1.677577, -2.307791, 0, 1, 0.1490196, 1,
-0.3296807, 0.2808164, -1.28569, 0, 1, 0.1529412, 1,
-0.3296259, 1.779902, -0.4098773, 0, 1, 0.1607843, 1,
-0.3293341, 0.4701609, 0.3205546, 0, 1, 0.1647059, 1,
-0.3272829, -0.2791745, -3.771162, 0, 1, 0.172549, 1,
-0.3264616, 1.826374, 0.638833, 0, 1, 0.1764706, 1,
-0.3188865, -0.7904426, -1.66142, 0, 1, 0.1843137, 1,
-0.3177859, 0.676156, -0.5231211, 0, 1, 0.1882353, 1,
-0.3177603, 0.159376, -1.063703, 0, 1, 0.1960784, 1,
-0.3118259, -0.0802264, -1.20122, 0, 1, 0.2039216, 1,
-0.3101363, 1.086225, 2.161684, 0, 1, 0.2078431, 1,
-0.3099742, -0.7137766, -2.393087, 0, 1, 0.2156863, 1,
-0.3098493, 1.90917, -1.263827, 0, 1, 0.2196078, 1,
-0.3061629, -1.531663, -3.193745, 0, 1, 0.227451, 1,
-0.301643, 0.2747431, -0.1009451, 0, 1, 0.2313726, 1,
-0.2962322, 0.6027425, -0.5602285, 0, 1, 0.2392157, 1,
-0.2884979, 0.5863714, -0.3381919, 0, 1, 0.2431373, 1,
-0.2877066, 1.262658, 1.897139, 0, 1, 0.2509804, 1,
-0.2856458, -0.2302732, -2.270663, 0, 1, 0.254902, 1,
-0.2847584, 0.5082426, -0.4909176, 0, 1, 0.2627451, 1,
-0.2845985, -1.078841, -2.313364, 0, 1, 0.2666667, 1,
-0.2787812, -0.1486854, 0.7282537, 0, 1, 0.2745098, 1,
-0.2764591, 0.5253498, 1.558066, 0, 1, 0.2784314, 1,
-0.2704849, 0.002708542, -2.382549, 0, 1, 0.2862745, 1,
-0.265607, 0.241009, 1.243601, 0, 1, 0.2901961, 1,
-0.2569294, 0.8133104, -0.469905, 0, 1, 0.2980392, 1,
-0.2546388, 1.957767, -0.8731641, 0, 1, 0.3058824, 1,
-0.2530117, 1.783632, 0.8085068, 0, 1, 0.3098039, 1,
-0.2527022, 0.3989972, -1.847516, 0, 1, 0.3176471, 1,
-0.2526559, -0.7446417, -2.795066, 0, 1, 0.3215686, 1,
-0.2505922, 0.1163014, -2.342068, 0, 1, 0.3294118, 1,
-0.2501657, -0.5464404, -2.679003, 0, 1, 0.3333333, 1,
-0.2475994, 0.2571016, 0.6318565, 0, 1, 0.3411765, 1,
-0.2454529, 1.312851, 0.1625723, 0, 1, 0.345098, 1,
-0.2403232, 0.9091948, -1.280719, 0, 1, 0.3529412, 1,
-0.2382803, 1.623894, -0.5454161, 0, 1, 0.3568628, 1,
-0.2352696, 0.8581631, -0.9988126, 0, 1, 0.3647059, 1,
-0.2336502, -0.2464215, -1.624699, 0, 1, 0.3686275, 1,
-0.2331306, 1.17783, -0.7791682, 0, 1, 0.3764706, 1,
-0.2323923, 0.4570197, -0.0005092577, 0, 1, 0.3803922, 1,
-0.2310506, 0.04186641, -2.87262, 0, 1, 0.3882353, 1,
-0.2261157, -0.3941365, -2.775031, 0, 1, 0.3921569, 1,
-0.2246532, -0.3460537, -2.172205, 0, 1, 0.4, 1,
-0.2233429, 1.096236, 1.595058, 0, 1, 0.4078431, 1,
-0.2227674, -0.08164068, -2.403165, 0, 1, 0.4117647, 1,
-0.2219618, 0.2204869, -1.526506, 0, 1, 0.4196078, 1,
-0.2189696, 0.4703624, -1.167565, 0, 1, 0.4235294, 1,
-0.2176163, 1.169123, -0.3962059, 0, 1, 0.4313726, 1,
-0.2173721, 0.1535925, -0.145474, 0, 1, 0.4352941, 1,
-0.2167523, 1.339043, 1.507774, 0, 1, 0.4431373, 1,
-0.216034, -0.3950661, -3.402181, 0, 1, 0.4470588, 1,
-0.2118366, 0.9825824, -0.200412, 0, 1, 0.454902, 1,
-0.2046405, -0.724861, -3.392237, 0, 1, 0.4588235, 1,
-0.2042949, 0.9542915, -2.202376, 0, 1, 0.4666667, 1,
-0.1999753, 0.4982961, -0.1213006, 0, 1, 0.4705882, 1,
-0.194083, 0.2982811, 1.2902, 0, 1, 0.4784314, 1,
-0.1915514, 1.286223, -0.5206659, 0, 1, 0.4823529, 1,
-0.1871532, 0.4307934, 0.9764413, 0, 1, 0.4901961, 1,
-0.184901, 1.279724, 0.09388964, 0, 1, 0.4941176, 1,
-0.1771301, -0.3750264, -2.087672, 0, 1, 0.5019608, 1,
-0.1762532, 0.369, -0.8363134, 0, 1, 0.509804, 1,
-0.1746904, -0.7746091, -3.106681, 0, 1, 0.5137255, 1,
-0.1740679, 0.80479, -0.3267009, 0, 1, 0.5215687, 1,
-0.1687055, -0.8923692, -2.166084, 0, 1, 0.5254902, 1,
-0.1678237, -0.3408231, -0.8988715, 0, 1, 0.5333334, 1,
-0.1640539, -0.7630777, -2.717666, 0, 1, 0.5372549, 1,
-0.161009, 1.714823, -0.9343067, 0, 1, 0.5450981, 1,
-0.1597537, -1.646864, -2.676361, 0, 1, 0.5490196, 1,
-0.1592104, -0.3803642, -4.204453, 0, 1, 0.5568628, 1,
-0.1533388, 0.03204098, -0.1603106, 0, 1, 0.5607843, 1,
-0.1528721, -0.07575393, -0.4508776, 0, 1, 0.5686275, 1,
-0.1524139, 1.283952, -0.1451602, 0, 1, 0.572549, 1,
-0.15043, 0.2947455, -0.1798785, 0, 1, 0.5803922, 1,
-0.146937, -2.024421, -4.319283, 0, 1, 0.5843138, 1,
-0.1425064, 1.448438, 0.6975078, 0, 1, 0.5921569, 1,
-0.1399342, -0.4783635, -2.1723, 0, 1, 0.5960785, 1,
-0.1384184, -0.278986, -4.093979, 0, 1, 0.6039216, 1,
-0.1364491, 0.2762989, -1.086288, 0, 1, 0.6117647, 1,
-0.1312496, 3.615489, 0.4413003, 0, 1, 0.6156863, 1,
-0.1308731, 0.696495, 0.3472872, 0, 1, 0.6235294, 1,
-0.1274524, 1.226819, 0.6837939, 0, 1, 0.627451, 1,
-0.1252969, -1.049683, -2.743487, 0, 1, 0.6352941, 1,
-0.1235387, -0.5963762, -2.127247, 0, 1, 0.6392157, 1,
-0.1233125, -1.751055, -1.42535, 0, 1, 0.6470588, 1,
-0.1185004, -0.08529805, -1.920506, 0, 1, 0.6509804, 1,
-0.1127521, 0.2560186, -2.310125, 0, 1, 0.6588235, 1,
-0.103701, -0.6473562, -3.593938, 0, 1, 0.6627451, 1,
-0.1026458, 0.354741, -0.7083099, 0, 1, 0.6705883, 1,
-0.09765258, 1.574271, -0.3020829, 0, 1, 0.6745098, 1,
-0.09623928, 1.524758, 0.2783749, 0, 1, 0.682353, 1,
-0.09397757, 1.073455, -0.2827599, 0, 1, 0.6862745, 1,
-0.09148737, -0.570883, -2.261538, 0, 1, 0.6941177, 1,
-0.08962974, 0.5893126, 0.7856438, 0, 1, 0.7019608, 1,
-0.08891579, 0.1351799, 0.1438113, 0, 1, 0.7058824, 1,
-0.08783025, 0.07170162, 0.0561266, 0, 1, 0.7137255, 1,
-0.08699074, -0.6034614, -2.902783, 0, 1, 0.7176471, 1,
-0.08561692, -0.5422866, -2.204282, 0, 1, 0.7254902, 1,
-0.08498949, 0.4779426, 0.7134767, 0, 1, 0.7294118, 1,
-0.0801902, 1.850805, -0.8731323, 0, 1, 0.7372549, 1,
-0.07840175, 2.003863, 0.0550258, 0, 1, 0.7411765, 1,
-0.07710932, -0.6729615, -2.465991, 0, 1, 0.7490196, 1,
-0.06937794, -1.030908, -2.727022, 0, 1, 0.7529412, 1,
-0.06886382, -0.2366526, -3.60798, 0, 1, 0.7607843, 1,
-0.06537066, 0.7751859, 1.044423, 0, 1, 0.7647059, 1,
-0.05786623, 0.3194435, -0.5636166, 0, 1, 0.772549, 1,
-0.05723402, -1.274557, -3.808811, 0, 1, 0.7764706, 1,
-0.05374271, -0.05075213, -3.5893, 0, 1, 0.7843137, 1,
-0.04902447, -0.2218562, -3.608818, 0, 1, 0.7882353, 1,
-0.04795352, -0.05223297, -2.614128, 0, 1, 0.7960784, 1,
-0.04522177, 0.4662145, -1.662809, 0, 1, 0.8039216, 1,
-0.04014815, -0.9444634, -2.103011, 0, 1, 0.8078431, 1,
-0.03553581, -0.8125048, -4.449156, 0, 1, 0.8156863, 1,
-0.03162343, 0.7808071, -0.4107338, 0, 1, 0.8196079, 1,
-0.03129393, -0.2134449, -2.21109, 0, 1, 0.827451, 1,
-0.03095124, 1.029543, 1.933692, 0, 1, 0.8313726, 1,
-0.03041406, -0.2130145, -1.382398, 0, 1, 0.8392157, 1,
-0.03006845, 0.9689627, -0.4904769, 0, 1, 0.8431373, 1,
-0.02771765, 0.7912951, -0.0001724401, 0, 1, 0.8509804, 1,
-0.02746745, -0.7231546, -2.365894, 0, 1, 0.854902, 1,
-0.02472577, 1.315572, 0.440472, 0, 1, 0.8627451, 1,
-0.02073918, -0.3876271, -1.954153, 0, 1, 0.8666667, 1,
-0.02017979, 0.8067349, 0.3177358, 0, 1, 0.8745098, 1,
-0.01999459, -0.9045606, -3.681086, 0, 1, 0.8784314, 1,
-0.01831018, -0.6348022, -4.479306, 0, 1, 0.8862745, 1,
-0.01582979, -0.6963288, -2.43702, 0, 1, 0.8901961, 1,
-0.01274118, -0.1140633, -4.977984, 0, 1, 0.8980392, 1,
-0.01033503, -1.506599, -1.744783, 0, 1, 0.9058824, 1,
-0.00964776, 0.8957677, 1.021029, 0, 1, 0.9098039, 1,
-0.008938797, -0.3845724, -3.748863, 0, 1, 0.9176471, 1,
-0.00811785, 1.403973, -0.1959615, 0, 1, 0.9215686, 1,
-0.006513077, -0.3499655, -3.400812, 0, 1, 0.9294118, 1,
-0.006401301, -0.4572291, -3.477867, 0, 1, 0.9333333, 1,
-0.004755755, -0.4847057, -3.322194, 0, 1, 0.9411765, 1,
-0.004081628, 2.493088, -0.8437571, 0, 1, 0.945098, 1,
-0.001198699, 0.2463997, 0.2285816, 0, 1, 0.9529412, 1,
0.0008567781, -0.9838678, 2.525054, 0, 1, 0.9568627, 1,
0.003269295, 0.3791109, -0.3373337, 0, 1, 0.9647059, 1,
0.005489983, 0.06038756, -1.1362, 0, 1, 0.9686275, 1,
0.005863407, 0.5365294, -1.391251, 0, 1, 0.9764706, 1,
0.007536765, 0.8553561, 1.008273, 0, 1, 0.9803922, 1,
0.008383359, 0.3604205, -1.163265, 0, 1, 0.9882353, 1,
0.01085018, -0.7192029, 2.426054, 0, 1, 0.9921569, 1,
0.0109041, -0.9739132, 3.951193, 0, 1, 1, 1,
0.01095481, -0.1463591, 3.597266, 0, 0.9921569, 1, 1,
0.01230258, 1.893156, -0.8853961, 0, 0.9882353, 1, 1,
0.01555359, 0.4300603, -0.8447295, 0, 0.9803922, 1, 1,
0.01733019, 0.521453, -1.155209, 0, 0.9764706, 1, 1,
0.01959987, 0.1546472, -1.588029, 0, 0.9686275, 1, 1,
0.02303597, -1.132593, 1.420065, 0, 0.9647059, 1, 1,
0.02360981, -0.8884421, 3.678598, 0, 0.9568627, 1, 1,
0.02549004, -0.2656687, 4.489982, 0, 0.9529412, 1, 1,
0.02610495, -1.373091, 1.5112, 0, 0.945098, 1, 1,
0.02716359, 0.085086, 1.305933, 0, 0.9411765, 1, 1,
0.02750497, -1.948499, 3.547482, 0, 0.9333333, 1, 1,
0.03015983, 0.4921169, 0.9332822, 0, 0.9294118, 1, 1,
0.03683037, -0.2844548, 3.297156, 0, 0.9215686, 1, 1,
0.03884769, -0.3758748, 2.706569, 0, 0.9176471, 1, 1,
0.04013946, 0.6391133, 0.8034467, 0, 0.9098039, 1, 1,
0.04034999, 0.3310802, 1.571906, 0, 0.9058824, 1, 1,
0.04514758, -1.425195, 4.273986, 0, 0.8980392, 1, 1,
0.04872663, -0.7122303, 3.532992, 0, 0.8901961, 1, 1,
0.05232036, -1.741542, 3.03968, 0, 0.8862745, 1, 1,
0.0558865, 0.6808347, -0.986675, 0, 0.8784314, 1, 1,
0.05612879, 0.2201188, 1.445584, 0, 0.8745098, 1, 1,
0.05718779, -0.973183, 1.608474, 0, 0.8666667, 1, 1,
0.06197751, 0.2717747, -0.1649827, 0, 0.8627451, 1, 1,
0.06507755, 1.402989, 0.6030292, 0, 0.854902, 1, 1,
0.06759671, 0.8120072, -0.6308247, 0, 0.8509804, 1, 1,
0.06798579, -2.208833, 4.341186, 0, 0.8431373, 1, 1,
0.07056788, -0.8639882, 3.972733, 0, 0.8392157, 1, 1,
0.07261303, -0.2994998, 1.210861, 0, 0.8313726, 1, 1,
0.07530768, -0.7770454, 2.51993, 0, 0.827451, 1, 1,
0.07778083, -0.1720256, 3.135586, 0, 0.8196079, 1, 1,
0.08024674, -1.610131, 0.7019051, 0, 0.8156863, 1, 1,
0.08125151, -1.305473, 4.095688, 0, 0.8078431, 1, 1,
0.08345866, 0.7632144, 0.2986818, 0, 0.8039216, 1, 1,
0.08427796, 1.417711, 0.6642768, 0, 0.7960784, 1, 1,
0.08512076, -0.4366684, 2.839034, 0, 0.7882353, 1, 1,
0.08764087, -0.6191553, 2.211387, 0, 0.7843137, 1, 1,
0.09040226, 1.616447, 0.2707233, 0, 0.7764706, 1, 1,
0.09049777, -0.353424, 4.299665, 0, 0.772549, 1, 1,
0.09288339, 0.8463025, 2.428499, 0, 0.7647059, 1, 1,
0.09368817, 0.09482352, 1.226737, 0, 0.7607843, 1, 1,
0.09721359, -0.09414462, 1.410863, 0, 0.7529412, 1, 1,
0.09986987, -0.9711773, 0.5511519, 0, 0.7490196, 1, 1,
0.1025457, -0.4146794, 2.89563, 0, 0.7411765, 1, 1,
0.1136156, 0.1031578, 0.3474689, 0, 0.7372549, 1, 1,
0.1138606, -1.257193, 2.949469, 0, 0.7294118, 1, 1,
0.1139309, -0.7914855, 3.750855, 0, 0.7254902, 1, 1,
0.1150762, -0.8598275, 2.24308, 0, 0.7176471, 1, 1,
0.1233103, 1.218673, 1.435406, 0, 0.7137255, 1, 1,
0.1253901, -0.5007935, 3.25738, 0, 0.7058824, 1, 1,
0.1286983, -1.920138, 2.965691, 0, 0.6980392, 1, 1,
0.1324768, 0.5267196, 0.1850991, 0, 0.6941177, 1, 1,
0.1372879, 0.2483448, -2.008225, 0, 0.6862745, 1, 1,
0.1400646, -0.1067974, 2.596386, 0, 0.682353, 1, 1,
0.1521221, 0.7088531, -0.4717545, 0, 0.6745098, 1, 1,
0.1553364, -0.5477521, 3.100104, 0, 0.6705883, 1, 1,
0.1558723, -0.2071399, 0.8624457, 0, 0.6627451, 1, 1,
0.1562385, 0.8476837, -0.2292284, 0, 0.6588235, 1, 1,
0.1609411, 0.4615576, -0.8928381, 0, 0.6509804, 1, 1,
0.1611992, -0.8115484, 3.282558, 0, 0.6470588, 1, 1,
0.1646503, -0.7832559, 4.336111, 0, 0.6392157, 1, 1,
0.1646841, -1.043348, 4.510498, 0, 0.6352941, 1, 1,
0.1665009, -0.2195054, 0.8919712, 0, 0.627451, 1, 1,
0.1713992, -1.294538, 3.006592, 0, 0.6235294, 1, 1,
0.1731807, 1.701584, -1.673067, 0, 0.6156863, 1, 1,
0.1752811, -0.282255, 0.3198436, 0, 0.6117647, 1, 1,
0.1780213, -0.6119291, 1.625856, 0, 0.6039216, 1, 1,
0.1785444, -1.017454, 1.1762, 0, 0.5960785, 1, 1,
0.1932643, 0.003030259, 2.733551, 0, 0.5921569, 1, 1,
0.1953237, -0.4642673, 2.7126, 0, 0.5843138, 1, 1,
0.2047808, -0.5251409, 2.784671, 0, 0.5803922, 1, 1,
0.20967, -1.019516, 3.302758, 0, 0.572549, 1, 1,
0.2140635, -1.000916, 3.599282, 0, 0.5686275, 1, 1,
0.2150118, 0.8188479, 0.007685842, 0, 0.5607843, 1, 1,
0.2185891, 0.5956231, 1.502723, 0, 0.5568628, 1, 1,
0.2220849, -0.4931311, 2.981472, 0, 0.5490196, 1, 1,
0.227633, -1.477775, 1.180473, 0, 0.5450981, 1, 1,
0.2302908, -0.22041, 1.926739, 0, 0.5372549, 1, 1,
0.2327629, -0.4224351, 2.936282, 0, 0.5333334, 1, 1,
0.2356715, -2.028268, 3.11454, 0, 0.5254902, 1, 1,
0.2412956, -0.07569452, 2.719127, 0, 0.5215687, 1, 1,
0.2500856, 2.265439, -1.490985, 0, 0.5137255, 1, 1,
0.2533489, -0.5741416, 2.664843, 0, 0.509804, 1, 1,
0.2542046, 2.108647, -0.1127588, 0, 0.5019608, 1, 1,
0.2598831, -0.9017627, 1.899088, 0, 0.4941176, 1, 1,
0.268311, -0.4271104, 3.164237, 0, 0.4901961, 1, 1,
0.2691486, 1.566669, 1.392062, 0, 0.4823529, 1, 1,
0.2693307, 0.2607711, 1.790411, 0, 0.4784314, 1, 1,
0.272495, -0.8133929, 2.492466, 0, 0.4705882, 1, 1,
0.2739314, -0.3736355, 1.568405, 0, 0.4666667, 1, 1,
0.2745675, -1.350752, 3.947312, 0, 0.4588235, 1, 1,
0.2765248, -1.625844, 1.909028, 0, 0.454902, 1, 1,
0.2793486, -0.3228899, 1.723149, 0, 0.4470588, 1, 1,
0.2795616, 1.451202, 0.1754695, 0, 0.4431373, 1, 1,
0.2819686, 1.794557, -0.6312274, 0, 0.4352941, 1, 1,
0.2822291, -2.238061, 3.880721, 0, 0.4313726, 1, 1,
0.2836823, 2.436895, -1.981275, 0, 0.4235294, 1, 1,
0.2874567, -0.2521752, 1.180226, 0, 0.4196078, 1, 1,
0.2899666, -0.5821865, 4.244287, 0, 0.4117647, 1, 1,
0.295437, -0.653331, 3.354443, 0, 0.4078431, 1, 1,
0.3068175, 2.618095, -0.4040168, 0, 0.4, 1, 1,
0.3077437, 1.672605, 0.9869843, 0, 0.3921569, 1, 1,
0.3106503, -0.5553092, 4.121563, 0, 0.3882353, 1, 1,
0.3121519, 2.14427, -0.3585729, 0, 0.3803922, 1, 1,
0.315328, -0.6856326, 3.353888, 0, 0.3764706, 1, 1,
0.3167773, 0.1521315, 1.058778, 0, 0.3686275, 1, 1,
0.3193746, 0.9635855, 0.1971529, 0, 0.3647059, 1, 1,
0.3229132, 1.072693, 1.041848, 0, 0.3568628, 1, 1,
0.3271648, 0.7089505, 0.2978908, 0, 0.3529412, 1, 1,
0.330274, 0.8606797, 2.152291, 0, 0.345098, 1, 1,
0.332404, 0.1802997, 2.205089, 0, 0.3411765, 1, 1,
0.3354741, -1.481755, 2.28338, 0, 0.3333333, 1, 1,
0.3357168, 0.1142229, -0.5508766, 0, 0.3294118, 1, 1,
0.3375055, -0.8575407, 3.974853, 0, 0.3215686, 1, 1,
0.3392706, 0.6881635, 2.001522, 0, 0.3176471, 1, 1,
0.340344, 0.9588386, 0.993905, 0, 0.3098039, 1, 1,
0.3407605, -0.02748217, 2.279459, 0, 0.3058824, 1, 1,
0.341191, 0.9305269, 0.449372, 0, 0.2980392, 1, 1,
0.3413427, 0.1759529, -0.2012711, 0, 0.2901961, 1, 1,
0.341796, 0.01886565, 1.325582, 0, 0.2862745, 1, 1,
0.3450507, 2.360922, -0.6371143, 0, 0.2784314, 1, 1,
0.3495426, 0.6235966, -0.3493457, 0, 0.2745098, 1, 1,
0.3499638, -0.6670606, 4.718415, 0, 0.2666667, 1, 1,
0.3501625, -0.902456, 3.068194, 0, 0.2627451, 1, 1,
0.3521959, -1.356203, 2.033165, 0, 0.254902, 1, 1,
0.3545145, 0.3988885, 1.447023, 0, 0.2509804, 1, 1,
0.35684, -2.983803, 3.429201, 0, 0.2431373, 1, 1,
0.3671113, 0.1783833, -0.5805241, 0, 0.2392157, 1, 1,
0.3726153, -0.5464635, 3.676718, 0, 0.2313726, 1, 1,
0.3729258, 0.4137331, 1.898713, 0, 0.227451, 1, 1,
0.3746197, -0.2029255, 3.306526, 0, 0.2196078, 1, 1,
0.3770637, -0.08493625, 2.543521, 0, 0.2156863, 1, 1,
0.3770857, -0.4579235, 1.697231, 0, 0.2078431, 1, 1,
0.3778187, -0.103957, 0.7169344, 0, 0.2039216, 1, 1,
0.3794002, -0.2165392, 1.739438, 0, 0.1960784, 1, 1,
0.3845083, -0.4901105, 4.040091, 0, 0.1882353, 1, 1,
0.3848838, -0.8848118, 2.985867, 0, 0.1843137, 1, 1,
0.3849096, 0.562202, -0.07588153, 0, 0.1764706, 1, 1,
0.3857643, 1.434971, -0.1544779, 0, 0.172549, 1, 1,
0.386524, -1.159905, 1.512666, 0, 0.1647059, 1, 1,
0.3880083, -0.1721756, 3.290053, 0, 0.1607843, 1, 1,
0.3885615, 1.310019, -0.2940095, 0, 0.1529412, 1, 1,
0.3943868, -0.2908509, 2.565359, 0, 0.1490196, 1, 1,
0.3977115, -2.05831, 1.301479, 0, 0.1411765, 1, 1,
0.3991192, -0.4276415, 2.037459, 0, 0.1372549, 1, 1,
0.4003408, 0.7283172, 1.022235, 0, 0.1294118, 1, 1,
0.400809, 0.04909191, 1.033683, 0, 0.1254902, 1, 1,
0.4021027, 0.4296509, 0.7489837, 0, 0.1176471, 1, 1,
0.4088857, -0.5784839, 1.596664, 0, 0.1137255, 1, 1,
0.4116422, 0.6870412, 0.3290914, 0, 0.1058824, 1, 1,
0.4241205, 1.549187, -1.108143, 0, 0.09803922, 1, 1,
0.4263219, -0.9038447, 2.292671, 0, 0.09411765, 1, 1,
0.4300909, 0.02845743, -0.599988, 0, 0.08627451, 1, 1,
0.4357625, 0.6477273, -0.3501425, 0, 0.08235294, 1, 1,
0.4385563, -0.1445228, 1.03481, 0, 0.07450981, 1, 1,
0.4394612, 0.6888296, 3.465289, 0, 0.07058824, 1, 1,
0.4413853, 1.316261, -0.6646884, 0, 0.0627451, 1, 1,
0.4419981, 0.3311769, 3.548171, 0, 0.05882353, 1, 1,
0.4450588, 0.6983476, 2.315273, 0, 0.05098039, 1, 1,
0.4490738, 0.4109276, 1.809592, 0, 0.04705882, 1, 1,
0.4563795, 1.002863, 1.415513, 0, 0.03921569, 1, 1,
0.4648941, 1.001089, 0.7380105, 0, 0.03529412, 1, 1,
0.4666059, -0.8984818, 3.535394, 0, 0.02745098, 1, 1,
0.4680255, 0.2642505, 3.620948, 0, 0.02352941, 1, 1,
0.4793623, 0.032905, 1.653159, 0, 0.01568628, 1, 1,
0.4806423, -1.236167, 2.880569, 0, 0.01176471, 1, 1,
0.4873851, -0.04220416, -0.06198031, 0, 0.003921569, 1, 1,
0.4913778, 1.214881, 0.8123186, 0.003921569, 0, 1, 1,
0.5003993, -1.083411, 1.113264, 0.007843138, 0, 1, 1,
0.504797, 1.305789, -0.1506498, 0.01568628, 0, 1, 1,
0.50568, 0.1600607, 0.9994714, 0.01960784, 0, 1, 1,
0.513882, 0.0948732, 1.171531, 0.02745098, 0, 1, 1,
0.5153694, -1.808897, 1.890262, 0.03137255, 0, 1, 1,
0.5156667, 1.217952, 0.5067038, 0.03921569, 0, 1, 1,
0.5158348, 0.9002123, 0.107288, 0.04313726, 0, 1, 1,
0.5184252, 0.7748047, 1.069464, 0.05098039, 0, 1, 1,
0.5202677, -0.9932856, 1.777175, 0.05490196, 0, 1, 1,
0.5203319, -0.4456367, 2.922682, 0.0627451, 0, 1, 1,
0.5210128, -2.08073, 3.289588, 0.06666667, 0, 1, 1,
0.5230739, 0.6857624, -0.5246081, 0.07450981, 0, 1, 1,
0.5320872, 0.8406341, -0.06349202, 0.07843138, 0, 1, 1,
0.5364692, 0.1076799, 0.8493183, 0.08627451, 0, 1, 1,
0.5397335, -0.663769, 3.256654, 0.09019608, 0, 1, 1,
0.540029, 0.04363651, 0.7542585, 0.09803922, 0, 1, 1,
0.553065, -1.492886, 2.199062, 0.1058824, 0, 1, 1,
0.5566754, -0.2193334, 2.778157, 0.1098039, 0, 1, 1,
0.5575544, 1.184733, 0.7225998, 0.1176471, 0, 1, 1,
0.566766, -0.6158593, 1.589106, 0.1215686, 0, 1, 1,
0.5670284, 0.8050905, 1.029601, 0.1294118, 0, 1, 1,
0.5701749, 1.010475, 1.694124, 0.1333333, 0, 1, 1,
0.5711457, -1.582848, 0.7666522, 0.1411765, 0, 1, 1,
0.5761538, 1.17227, 0.05588496, 0.145098, 0, 1, 1,
0.5768668, -1.034572, 1.391948, 0.1529412, 0, 1, 1,
0.5827922, -1.017044, 3.81715, 0.1568628, 0, 1, 1,
0.5848253, -1.168579, 4.697072, 0.1647059, 0, 1, 1,
0.5925677, -1.308043, 3.939644, 0.1686275, 0, 1, 1,
0.59292, 0.03677867, 2.496647, 0.1764706, 0, 1, 1,
0.5948257, 0.7028455, -0.05695288, 0.1803922, 0, 1, 1,
0.5953271, 0.6984655, 0.868379, 0.1882353, 0, 1, 1,
0.597176, 0.5293838, 1.788123, 0.1921569, 0, 1, 1,
0.597285, -1.3545, 3.267267, 0.2, 0, 1, 1,
0.5975735, -0.3336244, 1.924417, 0.2078431, 0, 1, 1,
0.6003593, 0.8120136, 0.8127939, 0.2117647, 0, 1, 1,
0.6035743, 0.2798132, 2.476561, 0.2196078, 0, 1, 1,
0.6053625, 0.5537199, -0.1817705, 0.2235294, 0, 1, 1,
0.6078021, 0.7978498, 0.5645742, 0.2313726, 0, 1, 1,
0.608147, 1.645409, -1.396749, 0.2352941, 0, 1, 1,
0.6082667, 0.02101324, 1.038502, 0.2431373, 0, 1, 1,
0.6155705, -2.294196, 2.483088, 0.2470588, 0, 1, 1,
0.615876, -0.4248528, 3.442822, 0.254902, 0, 1, 1,
0.6181469, 0.1169229, 2.814844, 0.2588235, 0, 1, 1,
0.6195583, -0.2414031, 2.555451, 0.2666667, 0, 1, 1,
0.6266388, 0.2383752, -0.1984229, 0.2705882, 0, 1, 1,
0.6291434, 0.3503576, 0.0301103, 0.2784314, 0, 1, 1,
0.6323299, 0.2239974, 1.536301, 0.282353, 0, 1, 1,
0.6343338, -0.3889757, 1.149994, 0.2901961, 0, 1, 1,
0.6347997, 0.4217524, -1.135557, 0.2941177, 0, 1, 1,
0.6355981, -0.1098405, 0.5414134, 0.3019608, 0, 1, 1,
0.6563819, 0.8228381, 0.6140922, 0.3098039, 0, 1, 1,
0.6611083, 1.442737, 0.8297165, 0.3137255, 0, 1, 1,
0.6612046, 0.666517, -1.664973, 0.3215686, 0, 1, 1,
0.6710667, 0.4556044, 0.7173256, 0.3254902, 0, 1, 1,
0.6716849, -1.89627, 2.012491, 0.3333333, 0, 1, 1,
0.6815214, 0.1138928, 2.415842, 0.3372549, 0, 1, 1,
0.6841474, 1.355746, 2.210179, 0.345098, 0, 1, 1,
0.6868708, -1.142986, 0.799763, 0.3490196, 0, 1, 1,
0.6910153, 0.3673735, 0.4246173, 0.3568628, 0, 1, 1,
0.6923569, -2.115024, 3.490971, 0.3607843, 0, 1, 1,
0.6941548, 0.4500519, 1.270759, 0.3686275, 0, 1, 1,
0.7040473, -0.7460515, 1.332258, 0.372549, 0, 1, 1,
0.706401, -1.56613, 0.2755424, 0.3803922, 0, 1, 1,
0.7074428, 0.044401, 0.6137123, 0.3843137, 0, 1, 1,
0.724407, -0.7166765, 2.482123, 0.3921569, 0, 1, 1,
0.7262973, -0.1492271, -0.06507713, 0.3960784, 0, 1, 1,
0.7344241, 0.07800807, 1.313934, 0.4039216, 0, 1, 1,
0.7376711, 0.8025355, 1.6969, 0.4117647, 0, 1, 1,
0.7378756, -1.14978, 2.672102, 0.4156863, 0, 1, 1,
0.7383047, -0.7447999, 2.647052, 0.4235294, 0, 1, 1,
0.7523649, -0.1703635, 1.353112, 0.427451, 0, 1, 1,
0.7534838, -0.8224061, 0.7001551, 0.4352941, 0, 1, 1,
0.7570692, 0.3764548, 2.914099, 0.4392157, 0, 1, 1,
0.7593842, 0.8565544, -0.4133822, 0.4470588, 0, 1, 1,
0.7651795, -1.247432, 3.790659, 0.4509804, 0, 1, 1,
0.7686405, 1.034285, 1.314279, 0.4588235, 0, 1, 1,
0.769847, -0.8453606, 0.2913087, 0.4627451, 0, 1, 1,
0.7798957, 0.8676627, 0.108921, 0.4705882, 0, 1, 1,
0.7878915, 0.2541765, -0.1674221, 0.4745098, 0, 1, 1,
0.7881566, -0.113839, -0.01187925, 0.4823529, 0, 1, 1,
0.7932477, -0.175473, 1.48053, 0.4862745, 0, 1, 1,
0.7936364, 0.05836607, 0.03224774, 0.4941176, 0, 1, 1,
0.7992383, 0.4800512, 0.805574, 0.5019608, 0, 1, 1,
0.7996984, 1.862976, 0.8767383, 0.5058824, 0, 1, 1,
0.8007292, -1.149177, 2.439376, 0.5137255, 0, 1, 1,
0.811764, 0.6175321, 0.9708804, 0.5176471, 0, 1, 1,
0.8170848, -0.5684692, 0.09902751, 0.5254902, 0, 1, 1,
0.819203, -0.8742546, 4.978574, 0.5294118, 0, 1, 1,
0.8214615, 0.6536543, 1.775067, 0.5372549, 0, 1, 1,
0.8245185, -0.4800514, 1.805894, 0.5411765, 0, 1, 1,
0.8248546, 1.60803, 1.325758, 0.5490196, 0, 1, 1,
0.8289145, -1.153128, -0.06266063, 0.5529412, 0, 1, 1,
0.8310965, -0.3428639, 1.120906, 0.5607843, 0, 1, 1,
0.8313411, -0.0195915, 0.3775391, 0.5647059, 0, 1, 1,
0.8320636, 1.139927, 1.396946, 0.572549, 0, 1, 1,
0.832902, -0.4356317, 1.221346, 0.5764706, 0, 1, 1,
0.8369047, 0.7891811, 0.9442367, 0.5843138, 0, 1, 1,
0.8419831, 0.8530561, 0.1140033, 0.5882353, 0, 1, 1,
0.8433717, -0.4737115, 0.451484, 0.5960785, 0, 1, 1,
0.8435841, -0.4655103, 2.698766, 0.6039216, 0, 1, 1,
0.8441623, -2.346811, 3.090637, 0.6078432, 0, 1, 1,
0.8441651, 0.3011457, 2.092546, 0.6156863, 0, 1, 1,
0.8444421, 1.623735, -1.03847, 0.6196079, 0, 1, 1,
0.8452291, -0.2010219, 1.609682, 0.627451, 0, 1, 1,
0.8480251, 0.5518004, -1.16659, 0.6313726, 0, 1, 1,
0.8504233, -1.041955, 4.530393, 0.6392157, 0, 1, 1,
0.852227, 0.1688486, 1.945296, 0.6431373, 0, 1, 1,
0.8535826, 0.3381777, -1.682492, 0.6509804, 0, 1, 1,
0.8594127, 1.066895, 1.411675, 0.654902, 0, 1, 1,
0.8663108, 0.7296674, 0.7203701, 0.6627451, 0, 1, 1,
0.8705322, -1.522056, 2.810913, 0.6666667, 0, 1, 1,
0.8734866, -1.13873, 2.514255, 0.6745098, 0, 1, 1,
0.8774768, -0.3072743, 2.575049, 0.6784314, 0, 1, 1,
0.8800341, -1.499108, 2.359612, 0.6862745, 0, 1, 1,
0.8883925, -0.5414394, 1.001123, 0.6901961, 0, 1, 1,
0.8940917, -1.922007, 2.185699, 0.6980392, 0, 1, 1,
0.9014173, 1.537832, -0.6363929, 0.7058824, 0, 1, 1,
0.9077706, 0.6685403, 1.310199, 0.7098039, 0, 1, 1,
0.9096835, -0.3657045, 2.667226, 0.7176471, 0, 1, 1,
0.910094, -0.7795112, 1.863322, 0.7215686, 0, 1, 1,
0.9171155, 1.43211, 1.242068, 0.7294118, 0, 1, 1,
0.9243861, -1.265008, 2.26315, 0.7333333, 0, 1, 1,
0.9296584, 1.37088, -0.4667262, 0.7411765, 0, 1, 1,
0.9340723, -0.4565423, 1.401167, 0.7450981, 0, 1, 1,
0.9347857, -1.883321, 3.080432, 0.7529412, 0, 1, 1,
0.9372492, -0.8579766, 1.452345, 0.7568628, 0, 1, 1,
0.9441723, -0.7409577, 1.529312, 0.7647059, 0, 1, 1,
0.9449717, 1.089773, 1.789674, 0.7686275, 0, 1, 1,
0.945023, 0.4526664, 0.1305445, 0.7764706, 0, 1, 1,
0.9496306, 1.093798, 0.2069845, 0.7803922, 0, 1, 1,
0.9503477, 0.4866624, 0.8986455, 0.7882353, 0, 1, 1,
0.9516044, -1.57293, 2.238956, 0.7921569, 0, 1, 1,
0.9516678, 0.04237461, 3.408949, 0.8, 0, 1, 1,
0.9523959, -0.2766072, 1.631074, 0.8078431, 0, 1, 1,
0.9563308, -1.69427, 2.08768, 0.8117647, 0, 1, 1,
0.9635861, -1.139767, 1.408119, 0.8196079, 0, 1, 1,
0.963873, 1.095453, 0.6587344, 0.8235294, 0, 1, 1,
0.9687554, -0.3286861, 1.722192, 0.8313726, 0, 1, 1,
0.9692567, -1.894773, 3.021267, 0.8352941, 0, 1, 1,
0.9725847, -0.07234076, 2.003443, 0.8431373, 0, 1, 1,
0.9745525, 1.270624, 0.8274186, 0.8470588, 0, 1, 1,
0.9774967, 0.7969378, 1.250093, 0.854902, 0, 1, 1,
0.9779945, 0.2840009, 2.0104, 0.8588235, 0, 1, 1,
0.9783704, -1.129919, 2.692518, 0.8666667, 0, 1, 1,
0.9839709, 2.880261, 0.1244062, 0.8705882, 0, 1, 1,
0.9885477, -0.7402261, 2.191091, 0.8784314, 0, 1, 1,
0.9899579, -0.9857931, 1.315131, 0.8823529, 0, 1, 1,
0.9912693, 0.1206672, 2.091875, 0.8901961, 0, 1, 1,
0.99325, -1.053099, 3.659928, 0.8941177, 0, 1, 1,
1.00507, -0.4212934, 1.902392, 0.9019608, 0, 1, 1,
1.010169, -1.090209, 1.43452, 0.9098039, 0, 1, 1,
1.025035, 1.334134, 2.598845, 0.9137255, 0, 1, 1,
1.025115, -1.104177, 1.641519, 0.9215686, 0, 1, 1,
1.025731, -0.6236092, 1.979583, 0.9254902, 0, 1, 1,
1.034118, -0.9122902, 3.13887, 0.9333333, 0, 1, 1,
1.039857, -0.8316454, 1.052029, 0.9372549, 0, 1, 1,
1.041139, 0.1554823, 1.111699, 0.945098, 0, 1, 1,
1.041603, -1.156531, 2.499529, 0.9490196, 0, 1, 1,
1.046935, -0.8282235, 3.008672, 0.9568627, 0, 1, 1,
1.054693, 0.3176877, 0.9129866, 0.9607843, 0, 1, 1,
1.057844, 2.045518, 1.253288, 0.9686275, 0, 1, 1,
1.058791, 0.7446842, 0.3549776, 0.972549, 0, 1, 1,
1.059378, -0.5218892, 2.537588, 0.9803922, 0, 1, 1,
1.069865, 1.229712, -0.1913588, 0.9843137, 0, 1, 1,
1.072481, -0.273778, 1.575245, 0.9921569, 0, 1, 1,
1.076365, -0.7829481, 1.862001, 0.9960784, 0, 1, 1,
1.080551, 0.7698996, 2.223485, 1, 0, 0.9960784, 1,
1.084092, 1.206743, 1.09442, 1, 0, 0.9882353, 1,
1.08596, -1.296039, 1.79889, 1, 0, 0.9843137, 1,
1.103968, -0.4454321, 2.628477, 1, 0, 0.9764706, 1,
1.1115, 0.759007, 2.672704, 1, 0, 0.972549, 1,
1.114272, 0.2856542, 0.1220722, 1, 0, 0.9647059, 1,
1.118986, -0.02244464, 3.279243, 1, 0, 0.9607843, 1,
1.120921, -0.1971432, 5.186586, 1, 0, 0.9529412, 1,
1.123878, -0.4529553, 2.495984, 1, 0, 0.9490196, 1,
1.12447, -0.2632543, 1.810661, 1, 0, 0.9411765, 1,
1.125288, 1.688612, 0.462475, 1, 0, 0.9372549, 1,
1.127045, -1.106791, 2.528385, 1, 0, 0.9294118, 1,
1.134771, -0.4010539, 2.651883, 1, 0, 0.9254902, 1,
1.134874, 0.6658798, 0.4030531, 1, 0, 0.9176471, 1,
1.134886, 0.3631521, 1.552988, 1, 0, 0.9137255, 1,
1.137109, -0.7929255, 1.655407, 1, 0, 0.9058824, 1,
1.140128, 0.5602059, 1.331489, 1, 0, 0.9019608, 1,
1.141084, -0.7826005, 0.006966507, 1, 0, 0.8941177, 1,
1.170888, -0.9063093, 3.149807, 1, 0, 0.8862745, 1,
1.174615, 0.03240615, 2.233132, 1, 0, 0.8823529, 1,
1.178048, -0.00922305, 1.12402, 1, 0, 0.8745098, 1,
1.178097, 0.289727, 2.693985, 1, 0, 0.8705882, 1,
1.1811, 0.0959922, 2.975348, 1, 0, 0.8627451, 1,
1.183148, -1.739717, 1.434119, 1, 0, 0.8588235, 1,
1.183775, 0.08896621, 2.969387, 1, 0, 0.8509804, 1,
1.185153, -0.1273944, 1.758088, 1, 0, 0.8470588, 1,
1.185239, -0.9010507, 2.18432, 1, 0, 0.8392157, 1,
1.186973, 0.706586, -0.0289124, 1, 0, 0.8352941, 1,
1.187414, 1.361548, 0.3008532, 1, 0, 0.827451, 1,
1.194124, -1.449538, 2.944543, 1, 0, 0.8235294, 1,
1.194811, 1.295699, -0.4366688, 1, 0, 0.8156863, 1,
1.203481, 0.8053691, 2.277703, 1, 0, 0.8117647, 1,
1.208207, 1.556022, 0.6269055, 1, 0, 0.8039216, 1,
1.208512, 2.110683, 1.472388, 1, 0, 0.7960784, 1,
1.22157, 0.1436778, 0.6261338, 1, 0, 0.7921569, 1,
1.222306, 0.3990999, 2.506739, 1, 0, 0.7843137, 1,
1.232952, 0.6010371, 0.6754767, 1, 0, 0.7803922, 1,
1.23363, -0.05676063, 2.165577, 1, 0, 0.772549, 1,
1.240251, 1.880278, 0.4793699, 1, 0, 0.7686275, 1,
1.24223, -0.06741636, 1.320653, 1, 0, 0.7607843, 1,
1.249147, 0.1994267, -0.5633556, 1, 0, 0.7568628, 1,
1.249249, 2.078772, -0.05780618, 1, 0, 0.7490196, 1,
1.251372, -0.927343, 3.046932, 1, 0, 0.7450981, 1,
1.251392, -1.642482, 3.285616, 1, 0, 0.7372549, 1,
1.275893, -0.5985215, 2.144975, 1, 0, 0.7333333, 1,
1.277177, 0.1636278, 1.159655, 1, 0, 0.7254902, 1,
1.277232, 0.6958842, 1.9934, 1, 0, 0.7215686, 1,
1.278043, -1.372938, 1.977812, 1, 0, 0.7137255, 1,
1.280277, 0.3959789, 0.1747562, 1, 0, 0.7098039, 1,
1.303482, 0.2950516, 0.8398888, 1, 0, 0.7019608, 1,
1.317331, 2.855925, 0.7825639, 1, 0, 0.6941177, 1,
1.329079, -0.0909259, 1.385634, 1, 0, 0.6901961, 1,
1.329576, -0.08735061, 3.573916, 1, 0, 0.682353, 1,
1.33039, 0.6909123, 1.118819, 1, 0, 0.6784314, 1,
1.331424, 0.4079583, -0.2018655, 1, 0, 0.6705883, 1,
1.33683, 0.2930861, -0.3680259, 1, 0, 0.6666667, 1,
1.337403, 0.1280134, -0.1093239, 1, 0, 0.6588235, 1,
1.345135, 0.9069749, 1.054233, 1, 0, 0.654902, 1,
1.355908, 1.278251, 0.5889989, 1, 0, 0.6470588, 1,
1.356629, -1.321907, 4.791202, 1, 0, 0.6431373, 1,
1.357026, -2.97495, 2.835858, 1, 0, 0.6352941, 1,
1.357454, -1.623801, 3.170326, 1, 0, 0.6313726, 1,
1.376564, -0.1612606, 1.466225, 1, 0, 0.6235294, 1,
1.388042, 1.178432, -0.3650734, 1, 0, 0.6196079, 1,
1.39988, -0.2076219, 2.478363, 1, 0, 0.6117647, 1,
1.404348, -1.19433, 2.375654, 1, 0, 0.6078432, 1,
1.416193, -1.744674, 3.937131, 1, 0, 0.6, 1,
1.417909, -0.8430172, 1.960635, 1, 0, 0.5921569, 1,
1.420814, -0.262725, 2.690199, 1, 0, 0.5882353, 1,
1.424661, -0.4672451, 1.728966, 1, 0, 0.5803922, 1,
1.42512, 0.2574939, 0.3448024, 1, 0, 0.5764706, 1,
1.426036, 1.596042, 0.04645974, 1, 0, 0.5686275, 1,
1.429016, 0.9129142, 1.648066, 1, 0, 0.5647059, 1,
1.43283, -0.2528786, -0.8398158, 1, 0, 0.5568628, 1,
1.438546, 0.3422736, 2.527468, 1, 0, 0.5529412, 1,
1.442748, -1.261245, 2.235774, 1, 0, 0.5450981, 1,
1.453457, -0.1459998, 1.523957, 1, 0, 0.5411765, 1,
1.457823, 1.958729, 2.836944, 1, 0, 0.5333334, 1,
1.464225, 0.955781, 2.668158, 1, 0, 0.5294118, 1,
1.474825, 1.449813, -0.08293653, 1, 0, 0.5215687, 1,
1.480809, -0.5051969, 2.074545, 1, 0, 0.5176471, 1,
1.482401, -0.7222273, 2.912513, 1, 0, 0.509804, 1,
1.486037, 1.049502, 2.382576, 1, 0, 0.5058824, 1,
1.489535, 0.7367133, 2.770429, 1, 0, 0.4980392, 1,
1.498401, 0.0936961, 1.382199, 1, 0, 0.4901961, 1,
1.507998, 1.319643, 1.026993, 1, 0, 0.4862745, 1,
1.510822, -1.408851, 2.28494, 1, 0, 0.4784314, 1,
1.514206, -0.7810825, 0.9929186, 1, 0, 0.4745098, 1,
1.523122, -0.526347, 1.730142, 1, 0, 0.4666667, 1,
1.524726, 0.7239809, 1.29244, 1, 0, 0.4627451, 1,
1.526381, 0.1583836, 2.581428, 1, 0, 0.454902, 1,
1.539218, 0.08440471, 2.844596, 1, 0, 0.4509804, 1,
1.543323, 1.093086, 1.156438, 1, 0, 0.4431373, 1,
1.554589, -0.5302739, 1.80353, 1, 0, 0.4392157, 1,
1.557961, -0.05228081, 2.143082, 1, 0, 0.4313726, 1,
1.558603, -1.265518, 1.019157, 1, 0, 0.427451, 1,
1.560907, -0.2074813, 2.763594, 1, 0, 0.4196078, 1,
1.561742, 1.304855, 0.3065041, 1, 0, 0.4156863, 1,
1.566351, -0.7517547, 2.541096, 1, 0, 0.4078431, 1,
1.578311, -2.178946, 1.680504, 1, 0, 0.4039216, 1,
1.587162, -1.689101, 2.56615, 1, 0, 0.3960784, 1,
1.589676, 0.003964588, 2.197529, 1, 0, 0.3882353, 1,
1.592194, 0.02151248, 1.766401, 1, 0, 0.3843137, 1,
1.597884, -1.162198, 2.111398, 1, 0, 0.3764706, 1,
1.599887, 0.1064285, 0.9035114, 1, 0, 0.372549, 1,
1.610334, -2.419823, 2.198618, 1, 0, 0.3647059, 1,
1.616187, 1.075691, 0.7399167, 1, 0, 0.3607843, 1,
1.618655, -0.09912876, 2.582227, 1, 0, 0.3529412, 1,
1.628896, -0.375289, 1.400684, 1, 0, 0.3490196, 1,
1.634198, 0.1975712, 2.2875, 1, 0, 0.3411765, 1,
1.635053, -2.11892, 4.146388, 1, 0, 0.3372549, 1,
1.635897, -0.9167262, 1.539534, 1, 0, 0.3294118, 1,
1.637584, -1.410094, 1.38605, 1, 0, 0.3254902, 1,
1.643178, 0.5891232, -1.163735, 1, 0, 0.3176471, 1,
1.648917, -2.316722, 2.185993, 1, 0, 0.3137255, 1,
1.686289, 0.01772025, 2.113385, 1, 0, 0.3058824, 1,
1.695531, 0.7253152, 2.100256, 1, 0, 0.2980392, 1,
1.710528, -0.6393297, 1.073125, 1, 0, 0.2941177, 1,
1.727699, 0.55615, 0.8893658, 1, 0, 0.2862745, 1,
1.742018, -0.257407, 2.91906, 1, 0, 0.282353, 1,
1.742934, 1.590247, -0.8803611, 1, 0, 0.2745098, 1,
1.751019, 0.2783522, 2.393083, 1, 0, 0.2705882, 1,
1.762208, 1.260484, 1.454814, 1, 0, 0.2627451, 1,
1.76747, 1.808191, -0.1172975, 1, 0, 0.2588235, 1,
1.805277, 0.9431867, 1.804881, 1, 0, 0.2509804, 1,
1.821619, 0.6657476, 1.78757, 1, 0, 0.2470588, 1,
1.823487, 0.4208625, 1.361768, 1, 0, 0.2392157, 1,
1.823669, -0.7215449, 2.071338, 1, 0, 0.2352941, 1,
1.82502, 2.294382, 0.3654521, 1, 0, 0.227451, 1,
1.848576, 0.3579483, -0.262428, 1, 0, 0.2235294, 1,
1.848956, -1.706866, 3.000485, 1, 0, 0.2156863, 1,
1.890729, -0.1825065, 1.435889, 1, 0, 0.2117647, 1,
1.899383, 0.6512958, 1.553214, 1, 0, 0.2039216, 1,
1.905566, 1.396099, 1.835444, 1, 0, 0.1960784, 1,
1.922455, -1.199858, 4.498197, 1, 0, 0.1921569, 1,
1.928857, -0.5873781, 1.843799, 1, 0, 0.1843137, 1,
1.957964, -0.5753179, 2.464066, 1, 0, 0.1803922, 1,
1.959844, -0.8455045, 1.236792, 1, 0, 0.172549, 1,
1.97797, 2.019577, 0.4228058, 1, 0, 0.1686275, 1,
1.982801, 0.1793489, 1.857, 1, 0, 0.1607843, 1,
1.985042, 0.4540337, 1.954694, 1, 0, 0.1568628, 1,
1.995625, -0.3067391, 0.2056908, 1, 0, 0.1490196, 1,
2.00873, 0.7886788, 0.8976982, 1, 0, 0.145098, 1,
2.009238, -1.228637, 1.965613, 1, 0, 0.1372549, 1,
2.057163, -0.3679117, 2.122581, 1, 0, 0.1333333, 1,
2.124681, 1.741589, 0.4117107, 1, 0, 0.1254902, 1,
2.155384, 0.1152366, 2.312438, 1, 0, 0.1215686, 1,
2.170562, -2.085812, 3.016681, 1, 0, 0.1137255, 1,
2.190107, 1.799931, 1.250745, 1, 0, 0.1098039, 1,
2.205265, -0.31164, 2.675676, 1, 0, 0.1019608, 1,
2.22246, 1.488257, 1.573629, 1, 0, 0.09411765, 1,
2.263843, -1.81762, 2.415234, 1, 0, 0.09019608, 1,
2.281767, -1.041882, 1.693878, 1, 0, 0.08235294, 1,
2.330839, -0.5282961, 1.981706, 1, 0, 0.07843138, 1,
2.336158, 0.357777, 2.373331, 1, 0, 0.07058824, 1,
2.343747, 0.8440091, 1.531382, 1, 0, 0.06666667, 1,
2.348253, -0.5158877, 3.171687, 1, 0, 0.05882353, 1,
2.351578, 0.5667153, 2.384699, 1, 0, 0.05490196, 1,
2.457556, 0.4108244, 0.1022087, 1, 0, 0.04705882, 1,
2.553581, 2.351243, 1.062729, 1, 0, 0.04313726, 1,
2.664962, -0.1721122, 1.679939, 1, 0, 0.03529412, 1,
2.949105, -0.5311803, -0.1963028, 1, 0, 0.03137255, 1,
2.959227, 0.3228799, 1.800339, 1, 0, 0.02352941, 1,
3.050685, 1.115532, 0.2518556, 1, 0, 0.01960784, 1,
3.116852, -0.4836977, 0.6789146, 1, 0, 0.01176471, 1,
3.61399, -1.079558, 2.35924, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.02584374, -4.118951, -6.73863, 0, -0.5, 0.5, 0.5,
0.02584374, -4.118951, -6.73863, 1, -0.5, 0.5, 0.5,
0.02584374, -4.118951, -6.73863, 1, 1.5, 0.5, 0.5,
0.02584374, -4.118951, -6.73863, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.778684, 0.3087597, -6.73863, 0, -0.5, 0.5, 0.5,
-4.778684, 0.3087597, -6.73863, 1, -0.5, 0.5, 0.5,
-4.778684, 0.3087597, -6.73863, 1, 1.5, 0.5, 0.5,
-4.778684, 0.3087597, -6.73863, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.778684, -4.118951, 0.08816123, 0, -0.5, 0.5, 0.5,
-4.778684, -4.118951, 0.08816123, 1, -0.5, 0.5, 0.5,
-4.778684, -4.118951, 0.08816123, 1, 1.5, 0.5, 0.5,
-4.778684, -4.118951, 0.08816123, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.097172, -5.163217,
2, -3.097172, -5.163217,
-2, -3.097172, -5.163217,
-2, -3.267469, -5.425786,
0, -3.097172, -5.163217,
0, -3.267469, -5.425786,
2, -3.097172, -5.163217,
2, -3.267469, -5.425786
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.608062, -5.950923, 0, -0.5, 0.5, 0.5,
-2, -3.608062, -5.950923, 1, -0.5, 0.5, 0.5,
-2, -3.608062, -5.950923, 1, 1.5, 0.5, 0.5,
-2, -3.608062, -5.950923, 0, 1.5, 0.5, 0.5,
0, -3.608062, -5.950923, 0, -0.5, 0.5, 0.5,
0, -3.608062, -5.950923, 1, -0.5, 0.5, 0.5,
0, -3.608062, -5.950923, 1, 1.5, 0.5, 0.5,
0, -3.608062, -5.950923, 0, 1.5, 0.5, 0.5,
2, -3.608062, -5.950923, 0, -0.5, 0.5, 0.5,
2, -3.608062, -5.950923, 1, -0.5, 0.5, 0.5,
2, -3.608062, -5.950923, 1, 1.5, 0.5, 0.5,
2, -3.608062, -5.950923, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.669947, -2, -5.163217,
-3.669947, 3, -5.163217,
-3.669947, -2, -5.163217,
-3.854736, -2, -5.425786,
-3.669947, -1, -5.163217,
-3.854736, -1, -5.425786,
-3.669947, 0, -5.163217,
-3.854736, 0, -5.425786,
-3.669947, 1, -5.163217,
-3.854736, 1, -5.425786,
-3.669947, 2, -5.163217,
-3.854736, 2, -5.425786,
-3.669947, 3, -5.163217,
-3.854736, 3, -5.425786
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.224315, -2, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, -2, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, -2, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, -2, -5.950923, 0, 1.5, 0.5, 0.5,
-4.224315, -1, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, -1, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, -1, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, -1, -5.950923, 0, 1.5, 0.5, 0.5,
-4.224315, 0, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, 0, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, 0, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, 0, -5.950923, 0, 1.5, 0.5, 0.5,
-4.224315, 1, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, 1, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, 1, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, 1, -5.950923, 0, 1.5, 0.5, 0.5,
-4.224315, 2, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, 2, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, 2, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, 2, -5.950923, 0, 1.5, 0.5, 0.5,
-4.224315, 3, -5.950923, 0, -0.5, 0.5, 0.5,
-4.224315, 3, -5.950923, 1, -0.5, 0.5, 0.5,
-4.224315, 3, -5.950923, 1, 1.5, 0.5, 0.5,
-4.224315, 3, -5.950923, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.669947, -3.097172, -4,
-3.669947, -3.097172, 4,
-3.669947, -3.097172, -4,
-3.854736, -3.267469, -4,
-3.669947, -3.097172, -2,
-3.854736, -3.267469, -2,
-3.669947, -3.097172, 0,
-3.854736, -3.267469, 0,
-3.669947, -3.097172, 2,
-3.854736, -3.267469, 2,
-3.669947, -3.097172, 4,
-3.854736, -3.267469, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.224315, -3.608062, -4, 0, -0.5, 0.5, 0.5,
-4.224315, -3.608062, -4, 1, -0.5, 0.5, 0.5,
-4.224315, -3.608062, -4, 1, 1.5, 0.5, 0.5,
-4.224315, -3.608062, -4, 0, 1.5, 0.5, 0.5,
-4.224315, -3.608062, -2, 0, -0.5, 0.5, 0.5,
-4.224315, -3.608062, -2, 1, -0.5, 0.5, 0.5,
-4.224315, -3.608062, -2, 1, 1.5, 0.5, 0.5,
-4.224315, -3.608062, -2, 0, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 0, 0, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 0, 1, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 0, 1, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 0, 0, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 2, 0, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 2, 1, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 2, 1, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 2, 0, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 4, 0, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 4, 1, -0.5, 0.5, 0.5,
-4.224315, -3.608062, 4, 1, 1.5, 0.5, 0.5,
-4.224315, -3.608062, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.669947, -3.097172, -5.163217,
-3.669947, 3.714691, -5.163217,
-3.669947, -3.097172, 5.339539,
-3.669947, 3.714691, 5.339539,
-3.669947, -3.097172, -5.163217,
-3.669947, -3.097172, 5.339539,
-3.669947, 3.714691, -5.163217,
-3.669947, 3.714691, 5.339539,
-3.669947, -3.097172, -5.163217,
3.721634, -3.097172, -5.163217,
-3.669947, -3.097172, 5.339539,
3.721634, -3.097172, 5.339539,
-3.669947, 3.714691, -5.163217,
3.721634, 3.714691, -5.163217,
-3.669947, 3.714691, 5.339539,
3.721634, 3.714691, 5.339539,
3.721634, -3.097172, -5.163217,
3.721634, 3.714691, -5.163217,
3.721634, -3.097172, 5.339539,
3.721634, 3.714691, 5.339539,
3.721634, -3.097172, -5.163217,
3.721634, -3.097172, 5.339539,
3.721634, 3.714691, -5.163217,
3.721634, 3.714691, 5.339539
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.762851;
var distance = 34.5378;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02584374, -0.3087597, -0.08816123 );
mvMatrix.scale( 1.135528, 1.232166, 0.7991567 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.5378);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
formal<-read.table("formal.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-formal$V2
```

```
## Error in eval(expr, envir, enclos): object 'formal' not found
```

```r
y<-formal$V3
```

```
## Error in eval(expr, envir, enclos): object 'formal' not found
```

```r
z<-formal$V4
```

```
## Error in eval(expr, envir, enclos): object 'formal' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.562302, -2.455328, -1.020773, 0, 0, 1, 1, 1,
-3.369931, 0.2391184, -1.047586, 1, 0, 0, 1, 1,
-2.8235, -0.5530181, -1.105928, 1, 0, 0, 1, 1,
-2.817849, 0.7236691, 0.1107733, 1, 0, 0, 1, 1,
-2.807833, 0.3870381, -2.394437, 1, 0, 0, 1, 1,
-2.642953, -0.03350548, -1.159156, 1, 0, 0, 1, 1,
-2.474125, -1.319439, -0.2722186, 0, 0, 0, 1, 1,
-2.332766, 0.126987, 1.088958, 0, 0, 0, 1, 1,
-2.314388, -0.09455562, -0.5334032, 0, 0, 0, 1, 1,
-2.252593, -1.715979, -2.762883, 0, 0, 0, 1, 1,
-2.216742, -0.6465247, -3.223306, 0, 0, 0, 1, 1,
-2.19065, -0.4717284, -1.622187, 0, 0, 0, 1, 1,
-2.147394, -0.5400031, -1.364947, 0, 0, 0, 1, 1,
-2.102595, 0.1779917, 0.4167051, 1, 1, 1, 1, 1,
-2.082911, -0.670747, 0.07975264, 1, 1, 1, 1, 1,
-2.082749, -0.5934094, -1.160212, 1, 1, 1, 1, 1,
-2.04626, 1.202501, -1.074806, 1, 1, 1, 1, 1,
-1.998336, -1.158131, -2.606648, 1, 1, 1, 1, 1,
-1.982424, -0.9132674, -0.9056637, 1, 1, 1, 1, 1,
-1.949576, 0.09062654, -2.499936, 1, 1, 1, 1, 1,
-1.948472, 0.12889, -1.877676, 1, 1, 1, 1, 1,
-1.894932, 1.618261, 0.3158366, 1, 1, 1, 1, 1,
-1.887375, -0.03149241, -1.572695, 1, 1, 1, 1, 1,
-1.859324, -0.01100136, -1.765368, 1, 1, 1, 1, 1,
-1.853918, 0.1759758, -0.1343586, 1, 1, 1, 1, 1,
-1.846317, 0.07857102, -2.86285, 1, 1, 1, 1, 1,
-1.839512, -1.609864, -1.31087, 1, 1, 1, 1, 1,
-1.821529, -0.444401, -3.197607, 1, 1, 1, 1, 1,
-1.808834, -0.01174059, -0.06274642, 0, 0, 1, 1, 1,
-1.802214, 0.9292986, -2.280968, 1, 0, 0, 1, 1,
-1.769034, 0.391585, -1.235871, 1, 0, 0, 1, 1,
-1.742721, -1.563068, -2.679021, 1, 0, 0, 1, 1,
-1.734489, 1.478385, 0.7304406, 1, 0, 0, 1, 1,
-1.73363, -1.62851, -4.222998, 1, 0, 0, 1, 1,
-1.711262, 0.09629412, -1.967393, 0, 0, 0, 1, 1,
-1.705972, -0.1337142, -1.514789, 0, 0, 0, 1, 1,
-1.697351, -0.5350298, -1.68826, 0, 0, 0, 1, 1,
-1.670227, -0.06503446, 0.2520301, 0, 0, 0, 1, 1,
-1.665189, -0.4384414, -0.2313787, 0, 0, 0, 1, 1,
-1.636114, 0.2540902, 0.1956863, 0, 0, 0, 1, 1,
-1.635882, 1.521944, -1.048255, 0, 0, 0, 1, 1,
-1.632048, 0.6640377, -1.440116, 1, 1, 1, 1, 1,
-1.624699, -0.216525, -3.032171, 1, 1, 1, 1, 1,
-1.608836, -0.194609, -1.14051, 1, 1, 1, 1, 1,
-1.603002, -0.4351975, -1.580361, 1, 1, 1, 1, 1,
-1.602229, 0.6975923, -0.4620098, 1, 1, 1, 1, 1,
-1.593078, 1.427676, -0.9282938, 1, 1, 1, 1, 1,
-1.588131, 0.8994738, -0.7999008, 1, 1, 1, 1, 1,
-1.567966, 0.01293756, -1.214593, 1, 1, 1, 1, 1,
-1.555219, -0.6136063, -2.399953, 1, 1, 1, 1, 1,
-1.552836, 0.3239677, -2.136699, 1, 1, 1, 1, 1,
-1.548134, 0.8936899, -0.8705615, 1, 1, 1, 1, 1,
-1.540272, 1.636517, -2.540588, 1, 1, 1, 1, 1,
-1.518208, -0.2105469, -1.426073, 1, 1, 1, 1, 1,
-1.502956, -0.6417212, -2.730795, 1, 1, 1, 1, 1,
-1.499254, -0.2671544, -1.814613, 1, 1, 1, 1, 1,
-1.494556, -0.1085997, -1.501678, 0, 0, 1, 1, 1,
-1.49384, 0.8774173, -0.2760272, 1, 0, 0, 1, 1,
-1.482725, -0.3276525, -2.698746, 1, 0, 0, 1, 1,
-1.478585, 0.3790581, -1.138233, 1, 0, 0, 1, 1,
-1.47809, 1.633896, -0.4646317, 1, 0, 0, 1, 1,
-1.473694, 1.519103, -0.6739997, 1, 0, 0, 1, 1,
-1.471733, 1.01158, 1.271722, 0, 0, 0, 1, 1,
-1.471583, -0.1998639, -1.413335, 0, 0, 0, 1, 1,
-1.462865, -0.5472738, -1.686216, 0, 0, 0, 1, 1,
-1.459972, -1.011746, -0.3000083, 0, 0, 0, 1, 1,
-1.44801, -2.947763, -2.104034, 0, 0, 0, 1, 1,
-1.432377, -2.019524, -2.807043, 0, 0, 0, 1, 1,
-1.414398, -0.6623193, -0.8422214, 0, 0, 0, 1, 1,
-1.407007, 1.885375, 0.8556744, 1, 1, 1, 1, 1,
-1.379802, -1.352691, -2.699805, 1, 1, 1, 1, 1,
-1.374364, 0.5704183, -0.8005708, 1, 1, 1, 1, 1,
-1.369874, 0.8949583, -1.714904, 1, 1, 1, 1, 1,
-1.369674, 0.9141919, -0.8192363, 1, 1, 1, 1, 1,
-1.347132, 0.7853301, -0.296723, 1, 1, 1, 1, 1,
-1.342439, -1.455291, -2.624145, 1, 1, 1, 1, 1,
-1.341406, -0.7949172, -2.66967, 1, 1, 1, 1, 1,
-1.340737, -1.682286, -1.270288, 1, 1, 1, 1, 1,
-1.32876, 1.176452, -0.07364419, 1, 1, 1, 1, 1,
-1.323478, 1.640606, -1.267289, 1, 1, 1, 1, 1,
-1.322247, 0.2897246, -2.116496, 1, 1, 1, 1, 1,
-1.318905, -0.5242735, -1.344725, 1, 1, 1, 1, 1,
-1.310444, 0.5811234, -1.37475, 1, 1, 1, 1, 1,
-1.300523, 0.01449622, -1.820532, 1, 1, 1, 1, 1,
-1.300316, 0.3724945, -2.532616, 0, 0, 1, 1, 1,
-1.29613, 1.016458, -2.828741, 1, 0, 0, 1, 1,
-1.288881, 0.04839908, 0.1841284, 1, 0, 0, 1, 1,
-1.288854, 1.214571, 1.21525, 1, 0, 0, 1, 1,
-1.282066, 2.598731, 1.209401, 1, 0, 0, 1, 1,
-1.271427, -0.7505213, -2.791226, 1, 0, 0, 1, 1,
-1.267746, 0.8093181, -1.440399, 0, 0, 0, 1, 1,
-1.256722, -1.617965, -2.532296, 0, 0, 0, 1, 1,
-1.255337, -0.8213724, -2.347579, 0, 0, 0, 1, 1,
-1.250489, -1.799604, -0.9991216, 0, 0, 0, 1, 1,
-1.243317, 2.187662, 0.2515734, 0, 0, 0, 1, 1,
-1.225285, 0.4087907, -0.9711909, 0, 0, 0, 1, 1,
-1.219682, -0.3778594, -1.86858, 0, 0, 0, 1, 1,
-1.216949, -1.715568, -1.163496, 1, 1, 1, 1, 1,
-1.215942, 0.7483954, 0.02601546, 1, 1, 1, 1, 1,
-1.211958, -1.231286, -2.764308, 1, 1, 1, 1, 1,
-1.210133, 0.03469272, -0.8448754, 1, 1, 1, 1, 1,
-1.208017, 2.020627, -1.819245, 1, 1, 1, 1, 1,
-1.205939, -1.468843, -2.1522, 1, 1, 1, 1, 1,
-1.203512, 0.04134247, -2.332081, 1, 1, 1, 1, 1,
-1.200697, -0.9114384, -5.010264, 1, 1, 1, 1, 1,
-1.1998, 1.481246, 0.04438538, 1, 1, 1, 1, 1,
-1.192211, -0.8798874, 0.1758857, 1, 1, 1, 1, 1,
-1.185228, -0.02835644, -1.16427, 1, 1, 1, 1, 1,
-1.182666, -1.387314, -2.218651, 1, 1, 1, 1, 1,
-1.181644, 0.2576323, -1.349933, 1, 1, 1, 1, 1,
-1.171761, -1.251217, -1.114301, 1, 1, 1, 1, 1,
-1.170512, 1.059211, -2.231795, 1, 1, 1, 1, 1,
-1.166363, 0.2289857, -0.1000022, 0, 0, 1, 1, 1,
-1.161857, -0.2484694, -2.49904, 1, 0, 0, 1, 1,
-1.160951, -1.503339, -2.083067, 1, 0, 0, 1, 1,
-1.157031, -2.76217, -3.211806, 1, 0, 0, 1, 1,
-1.13112, -0.30473, -1.926565, 1, 0, 0, 1, 1,
-1.128674, 1.307882, -0.1456014, 1, 0, 0, 1, 1,
-1.12753, 0.270841, -1.484047, 0, 0, 0, 1, 1,
-1.122165, 0.4423599, -0.3271554, 0, 0, 0, 1, 1,
-1.12171, 1.184957, -2.289719, 0, 0, 0, 1, 1,
-1.11688, 1.892313, 0.3682412, 0, 0, 0, 1, 1,
-1.108256, 0.5887283, 0.9817445, 0, 0, 0, 1, 1,
-1.10485, 1.373768, -0.534307, 0, 0, 0, 1, 1,
-1.103001, -1.469077, -1.91013, 0, 0, 0, 1, 1,
-1.096053, 1.566533, -0.03460887, 1, 1, 1, 1, 1,
-1.095813, 1.024032, -0.2576389, 1, 1, 1, 1, 1,
-1.095369, 0.3957792, -2.333069, 1, 1, 1, 1, 1,
-1.094621, 0.354166, 0.3635062, 1, 1, 1, 1, 1,
-1.09331, 3.200625, -0.3991961, 1, 1, 1, 1, 1,
-1.091622, -1.363178, -2.23106, 1, 1, 1, 1, 1,
-1.087001, 0.1064986, -0.007894138, 1, 1, 1, 1, 1,
-1.086655, -1.124144, -3.493835, 1, 1, 1, 1, 1,
-1.077, 0.1950012, 0.2422153, 1, 1, 1, 1, 1,
-1.074702, -1.062425, -1.408146, 1, 1, 1, 1, 1,
-1.070514, -1.096434, -2.571207, 1, 1, 1, 1, 1,
-1.069717, 1.27934, -0.3014484, 1, 1, 1, 1, 1,
-1.068314, -1.213061, -1.121526, 1, 1, 1, 1, 1,
-1.06387, 0.1745421, 0.2056537, 1, 1, 1, 1, 1,
-1.063296, -0.6526036, -3.055048, 1, 1, 1, 1, 1,
-1.061922, 0.3400829, -1.505824, 0, 0, 1, 1, 1,
-1.058923, -0.5591222, -1.200161, 1, 0, 0, 1, 1,
-1.056093, -0.866221, -2.368309, 1, 0, 0, 1, 1,
-1.054988, 0.2270948, -1.116844, 1, 0, 0, 1, 1,
-1.054175, 0.7607638, 0.5039586, 1, 0, 0, 1, 1,
-1.052029, 0.2631446, -1.027705, 1, 0, 0, 1, 1,
-1.046295, 0.07710743, -0.9380697, 0, 0, 0, 1, 1,
-1.032826, 0.4072093, 0.1428143, 0, 0, 0, 1, 1,
-1.031394, -0.9501801, -3.065909, 0, 0, 0, 1, 1,
-1.030528, -0.9820371, -1.7746, 0, 0, 0, 1, 1,
-1.027979, 0.8328382, -1.471777, 0, 0, 0, 1, 1,
-1.016159, -0.5392615, -3.093384, 0, 0, 0, 1, 1,
-1.015711, 1.253453, 0.3565161, 0, 0, 0, 1, 1,
-1.013465, 0.8953649, -0.6900762, 1, 1, 1, 1, 1,
-1.007725, -1.776763, -2.924169, 1, 1, 1, 1, 1,
-1.004421, 0.8938051, 0.177589, 1, 1, 1, 1, 1,
-0.9960926, 0.6719418, -0.6679882, 1, 1, 1, 1, 1,
-0.9926686, -0.3740049, -1.637609, 1, 1, 1, 1, 1,
-0.9918463, -1.357727, -4.053702, 1, 1, 1, 1, 1,
-0.9896504, -0.9059128, -2.641742, 1, 1, 1, 1, 1,
-0.9802212, 1.60488, -1.410382, 1, 1, 1, 1, 1,
-0.9739644, 2.268492, -1.335213, 1, 1, 1, 1, 1,
-0.973632, -1.344059, -2.767749, 1, 1, 1, 1, 1,
-0.9719805, 0.1021723, -2.088444, 1, 1, 1, 1, 1,
-0.9715112, 0.5330107, -0.886547, 1, 1, 1, 1, 1,
-0.9708786, 0.06772172, -0.7253238, 1, 1, 1, 1, 1,
-0.9680896, 0.611726, -2.937514, 1, 1, 1, 1, 1,
-0.9627516, 1.148175, 0.09423401, 1, 1, 1, 1, 1,
-0.9621442, -1.092034, -1.744497, 0, 0, 1, 1, 1,
-0.9608778, 0.1616824, -2.17115, 1, 0, 0, 1, 1,
-0.9583938, -0.8625088, -1.9909, 1, 0, 0, 1, 1,
-0.9484587, -0.3401851, -1.574482, 1, 0, 0, 1, 1,
-0.942771, 0.7615697, 0.7619088, 1, 0, 0, 1, 1,
-0.9407686, -0.2008377, -2.551414, 1, 0, 0, 1, 1,
-0.938167, -0.08113718, -1.690874, 0, 0, 0, 1, 1,
-0.93254, -0.7131909, -3.097544, 0, 0, 0, 1, 1,
-0.9316093, 0.5022686, -1.576952, 0, 0, 0, 1, 1,
-0.9265116, 0.07790192, -2.423555, 0, 0, 0, 1, 1,
-0.919903, 0.2357697, -0.6433977, 0, 0, 0, 1, 1,
-0.916751, -0.03458418, -1.320443, 0, 0, 0, 1, 1,
-0.911689, 0.6644197, 0.5084116, 0, 0, 0, 1, 1,
-0.8990664, -1.647793, -4.27521, 1, 1, 1, 1, 1,
-0.8982417, 0.9099189, -0.5096461, 1, 1, 1, 1, 1,
-0.8964881, -0.4774817, -1.512318, 1, 1, 1, 1, 1,
-0.89352, -0.819851, -0.9197901, 1, 1, 1, 1, 1,
-0.892756, -1.891023, -2.567374, 1, 1, 1, 1, 1,
-0.8866991, 0.9344363, -0.8587021, 1, 1, 1, 1, 1,
-0.8846497, -0.1313904, -1.774173, 1, 1, 1, 1, 1,
-0.8754537, 2.003123, -0.5534702, 1, 1, 1, 1, 1,
-0.8712893, 0.9863036, -1.007102, 1, 1, 1, 1, 1,
-0.865438, -1.444748, -3.710569, 1, 1, 1, 1, 1,
-0.8609828, 1.871338, -0.8086151, 1, 1, 1, 1, 1,
-0.8569341, -0.5532634, -0.3977658, 1, 1, 1, 1, 1,
-0.8534923, -1.288394, -2.540153, 1, 1, 1, 1, 1,
-0.8490732, -0.8099775, -4.223043, 1, 1, 1, 1, 1,
-0.847243, -0.8940109, -2.48873, 1, 1, 1, 1, 1,
-0.8416215, -1.042918, -2.474977, 0, 0, 1, 1, 1,
-0.833193, -0.3126329, -2.008616, 1, 0, 0, 1, 1,
-0.8303, -1.860564, -3.484246, 1, 0, 0, 1, 1,
-0.8230145, 0.9092416, -0.7050506, 1, 0, 0, 1, 1,
-0.8185434, -0.446432, -1.30622, 1, 0, 0, 1, 1,
-0.8172514, -1.192932, -2.945524, 1, 0, 0, 1, 1,
-0.8162486, -1.366228, -3.175347, 0, 0, 0, 1, 1,
-0.8093135, 0.4790959, -3.723106, 0, 0, 0, 1, 1,
-0.8091097, 0.3489817, -0.3936684, 0, 0, 0, 1, 1,
-0.8059176, 1.655106, 0.3316089, 0, 0, 0, 1, 1,
-0.7933206, 0.6081547, -0.586836, 0, 0, 0, 1, 1,
-0.7914447, -0.3539344, -2.092364, 0, 0, 0, 1, 1,
-0.7878014, -0.7391946, -3.555808, 0, 0, 0, 1, 1,
-0.7876888, 0.6902109, 0.1324572, 1, 1, 1, 1, 1,
-0.7825138, -0.3065485, -0.8841017, 1, 1, 1, 1, 1,
-0.7821603, -0.5958371, -1.929348, 1, 1, 1, 1, 1,
-0.7744577, 0.03490138, -2.615446, 1, 1, 1, 1, 1,
-0.7728258, 2.232818, -0.2074983, 1, 1, 1, 1, 1,
-0.7704879, -0.5746151, -2.563916, 1, 1, 1, 1, 1,
-0.7630022, -0.9320341, -4.21344, 1, 1, 1, 1, 1,
-0.759863, 0.01004381, -0.6754101, 1, 1, 1, 1, 1,
-0.7594521, -1.038982, -3.275689, 1, 1, 1, 1, 1,
-0.7528473, 0.6254947, -1.641103, 1, 1, 1, 1, 1,
-0.7486534, 0.07977674, -0.5252523, 1, 1, 1, 1, 1,
-0.7347729, -0.6570273, -1.903999, 1, 1, 1, 1, 1,
-0.7346687, -0.2473879, -2.682811, 1, 1, 1, 1, 1,
-0.730339, 0.4130391, -0.002910514, 1, 1, 1, 1, 1,
-0.7252976, 0.7413257, -1.5324, 1, 1, 1, 1, 1,
-0.7242372, -1.79167, -2.968829, 0, 0, 1, 1, 1,
-0.7224208, -0.2621583, -1.389952, 1, 0, 0, 1, 1,
-0.7218872, -0.6993732, -0.9054106, 1, 0, 0, 1, 1,
-0.7165989, -0.1514757, -0.944486, 1, 0, 0, 1, 1,
-0.7130936, 0.01363302, -1.461655, 1, 0, 0, 1, 1,
-0.7085794, 0.7952775, -0.5410979, 1, 0, 0, 1, 1,
-0.7031741, -0.07290209, -3.474072, 0, 0, 0, 1, 1,
-0.7023125, 0.1229479, -1.858545, 0, 0, 0, 1, 1,
-0.698212, -0.8067689, -0.2112483, 0, 0, 0, 1, 1,
-0.6974364, -0.2195143, -2.189429, 0, 0, 0, 1, 1,
-0.6973553, -0.1159872, -1.189225, 0, 0, 0, 1, 1,
-0.6906638, 0.591951, -0.5953898, 0, 0, 0, 1, 1,
-0.6858272, -0.1049649, -1.872634, 0, 0, 0, 1, 1,
-0.6836087, -0.7383143, -2.180716, 1, 1, 1, 1, 1,
-0.6835796, 1.018148, -0.1011497, 1, 1, 1, 1, 1,
-0.6835582, -0.6710739, -2.085913, 1, 1, 1, 1, 1,
-0.6833912, -0.07351005, -3.12183, 1, 1, 1, 1, 1,
-0.6726875, -0.5201829, -2.260379, 1, 1, 1, 1, 1,
-0.6708108, -0.4181701, -1.965272, 1, 1, 1, 1, 1,
-0.6650525, 0.08783811, -2.070925, 1, 1, 1, 1, 1,
-0.6586247, 0.2848705, -1.171316, 1, 1, 1, 1, 1,
-0.6571329, -0.3774735, -2.514162, 1, 1, 1, 1, 1,
-0.6549132, 0.9001634, 0.06734001, 1, 1, 1, 1, 1,
-0.6543774, -1.317334, -1.45924, 1, 1, 1, 1, 1,
-0.6498464, 1.375957, -0.8130939, 1, 1, 1, 1, 1,
-0.6491061, 1.869757, -0.1982192, 1, 1, 1, 1, 1,
-0.6466584, -1.745733, -3.17493, 1, 1, 1, 1, 1,
-0.6460027, -0.2519912, -2.922451, 1, 1, 1, 1, 1,
-0.6436654, 0.189476, -0.8063431, 0, 0, 1, 1, 1,
-0.6422053, 1.368939, -0.6190847, 1, 0, 0, 1, 1,
-0.6386122, 0.3847982, -1.828939, 1, 0, 0, 1, 1,
-0.6280004, 0.5257796, -0.7710767, 1, 0, 0, 1, 1,
-0.6260152, 0.06827904, -1.966456, 1, 0, 0, 1, 1,
-0.6220771, 0.9371143, 0.5560927, 1, 0, 0, 1, 1,
-0.6137515, 1.160285, -0.2113087, 0, 0, 0, 1, 1,
-0.6127672, 0.2913327, -1.486252, 0, 0, 0, 1, 1,
-0.6118563, 0.1082555, -0.4611736, 0, 0, 0, 1, 1,
-0.6104975, -0.9839434, -2.927899, 0, 0, 0, 1, 1,
-0.605652, 1.369588, -0.4321858, 0, 0, 0, 1, 1,
-0.6021315, 1.469419, -1.645842, 0, 0, 0, 1, 1,
-0.5990251, -0.06769248, -2.916616, 0, 0, 0, 1, 1,
-0.5976582, 0.8510129, -0.2811782, 1, 1, 1, 1, 1,
-0.5906776, 0.6497813, -0.06762188, 1, 1, 1, 1, 1,
-0.5897393, -0.4898852, -0.4436704, 1, 1, 1, 1, 1,
-0.586571, -0.6132588, -1.940282, 1, 1, 1, 1, 1,
-0.5862606, 0.99076, 1.417744, 1, 1, 1, 1, 1,
-0.5826863, 1.284899, 0.08629962, 1, 1, 1, 1, 1,
-0.579554, -0.6576201, -1.955713, 1, 1, 1, 1, 1,
-0.5782411, -0.583061, -3.232864, 1, 1, 1, 1, 1,
-0.5743903, -0.8249292, -1.815337, 1, 1, 1, 1, 1,
-0.5729195, 0.5499566, -0.4018428, 1, 1, 1, 1, 1,
-0.5690219, 0.649735, -1.026782, 1, 1, 1, 1, 1,
-0.5681802, 0.4953446, -1.943652, 1, 1, 1, 1, 1,
-0.563879, 0.8502715, 1.525254, 1, 1, 1, 1, 1,
-0.5587416, 1.500297, -0.6952341, 1, 1, 1, 1, 1,
-0.5564256, -0.0217039, -0.6674818, 1, 1, 1, 1, 1,
-0.5514897, -1.691688, -2.322811, 0, 0, 1, 1, 1,
-0.5460061, 0.6840968, -1.263485, 1, 0, 0, 1, 1,
-0.5400666, -0.08999857, -3.620381, 1, 0, 0, 1, 1,
-0.5394208, -2.26515, -2.777122, 1, 0, 0, 1, 1,
-0.5374379, 1.306654, -1.734341, 1, 0, 0, 1, 1,
-0.5352497, -1.314265, -1.285122, 1, 0, 0, 1, 1,
-0.5326883, -0.05675533, -2.633047, 0, 0, 0, 1, 1,
-0.5320996, 0.5168141, -1.999122, 0, 0, 0, 1, 1,
-0.5286479, -0.8514722, -1.9756, 0, 0, 0, 1, 1,
-0.5216199, -0.4291567, -2.554483, 0, 0, 0, 1, 1,
-0.5183823, 1.497842, -0.4832965, 0, 0, 0, 1, 1,
-0.51738, -1.613207, -3.746569, 0, 0, 0, 1, 1,
-0.5125622, -0.3965875, -1.323233, 0, 0, 0, 1, 1,
-0.5087118, -0.1654557, -0.850262, 1, 1, 1, 1, 1,
-0.5086454, -1.946475, -4.060919, 1, 1, 1, 1, 1,
-0.5027785, 0.5111923, -0.4975477, 1, 1, 1, 1, 1,
-0.5004186, 0.7491181, 0.2670308, 1, 1, 1, 1, 1,
-0.4987993, -1.235221, -4.775683, 1, 1, 1, 1, 1,
-0.4986785, 0.6505699, 1.766119, 1, 1, 1, 1, 1,
-0.4957598, -1.450251, -1.750684, 1, 1, 1, 1, 1,
-0.4953364, 2.709606, -1.001212, 1, 1, 1, 1, 1,
-0.495284, -1.061552, -2.604156, 1, 1, 1, 1, 1,
-0.4925137, -2.132764, -2.110142, 1, 1, 1, 1, 1,
-0.4857392, -0.693592, -3.046182, 1, 1, 1, 1, 1,
-0.4845937, -0.4791959, -2.508532, 1, 1, 1, 1, 1,
-0.4726187, 0.677688, -0.8639709, 1, 1, 1, 1, 1,
-0.4651175, 0.5358512, 0.4036979, 1, 1, 1, 1, 1,
-0.4615854, -1.823544, -2.750838, 1, 1, 1, 1, 1,
-0.461578, 0.8506958, 0.450177, 0, 0, 1, 1, 1,
-0.4591489, -1.021977, -4.581994, 1, 0, 0, 1, 1,
-0.4554936, 0.3713087, 1.544976, 1, 0, 0, 1, 1,
-0.449414, 2.355083, -1.115221, 1, 0, 0, 1, 1,
-0.44709, 0.9504713, -0.197204, 1, 0, 0, 1, 1,
-0.4465742, 1.530768, -1.335056, 1, 0, 0, 1, 1,
-0.4432914, 0.2060832, -0.9010276, 0, 0, 0, 1, 1,
-0.4405689, 1.943762, -0.9355584, 0, 0, 0, 1, 1,
-0.4401467, -0.2039475, -1.803103, 0, 0, 0, 1, 1,
-0.4391367, 0.6948719, -0.8601757, 0, 0, 0, 1, 1,
-0.4362614, -1.208725, -2.745575, 0, 0, 0, 1, 1,
-0.4339314, 0.2647514, -1.934234, 0, 0, 0, 1, 1,
-0.433851, -0.5914563, -3.352398, 0, 0, 0, 1, 1,
-0.4283165, 0.4451735, 0.7171252, 1, 1, 1, 1, 1,
-0.428095, -2.99797, -4.329837, 1, 1, 1, 1, 1,
-0.4273796, 1.702737, 0.4146346, 1, 1, 1, 1, 1,
-0.4257486, 0.7797151, -0.6579598, 1, 1, 1, 1, 1,
-0.4247845, 0.312348, 0.1204928, 1, 1, 1, 1, 1,
-0.418063, 0.2325937, -0.267133, 1, 1, 1, 1, 1,
-0.4165693, -0.2341735, -0.2160871, 1, 1, 1, 1, 1,
-0.4150053, -1.369597, -2.787867, 1, 1, 1, 1, 1,
-0.4149536, 0.2025917, -1.069843, 1, 1, 1, 1, 1,
-0.4114833, -0.4353415, -3.120502, 1, 1, 1, 1, 1,
-0.4084736, 0.3270424, -0.7780232, 1, 1, 1, 1, 1,
-0.406541, -0.4727954, -3.140855, 1, 1, 1, 1, 1,
-0.4063351, -0.1886589, -2.864182, 1, 1, 1, 1, 1,
-0.4062333, -2.129788, -3.685848, 1, 1, 1, 1, 1,
-0.4056391, 0.8358477, 0.1211634, 1, 1, 1, 1, 1,
-0.3970064, -0.8194903, -3.499476, 0, 0, 1, 1, 1,
-0.3962721, 1.713074, -1.212204, 1, 0, 0, 1, 1,
-0.3940243, 1.741297, -0.6716139, 1, 0, 0, 1, 1,
-0.3916801, 0.06894316, -1.438464, 1, 0, 0, 1, 1,
-0.3908009, 0.9188372, -0.7769378, 1, 0, 0, 1, 1,
-0.3875046, 0.4337696, -1.390768, 1, 0, 0, 1, 1,
-0.3867573, 0.5600021, -1.521849, 0, 0, 0, 1, 1,
-0.3867409, -0.1622252, -0.9549537, 0, 0, 0, 1, 1,
-0.386028, -0.1567804, -1.00884, 0, 0, 0, 1, 1,
-0.3825311, 0.3163305, -1.626771, 0, 0, 0, 1, 1,
-0.3804491, -0.9073685, -4.433221, 0, 0, 0, 1, 1,
-0.3801548, 0.2687134, -1.652225, 0, 0, 0, 1, 1,
-0.3786061, 0.06119529, -0.8247184, 0, 0, 0, 1, 1,
-0.3736827, -0.1751977, -1.76624, 1, 1, 1, 1, 1,
-0.3727302, -0.6633405, -2.106646, 1, 1, 1, 1, 1,
-0.3709045, 0.7399285, -0.3243562, 1, 1, 1, 1, 1,
-0.3657007, -0.2123811, -1.371801, 1, 1, 1, 1, 1,
-0.3625349, 0.8396128, -0.7489774, 1, 1, 1, 1, 1,
-0.3589857, 0.5962322, -2.069536, 1, 1, 1, 1, 1,
-0.3550679, 1.049782, 0.9997753, 1, 1, 1, 1, 1,
-0.3475265, -1.247833, -2.843145, 1, 1, 1, 1, 1,
-0.339079, 1.187781, -1.065496, 1, 1, 1, 1, 1,
-0.3384373, -1.677577, -2.307791, 1, 1, 1, 1, 1,
-0.3296807, 0.2808164, -1.28569, 1, 1, 1, 1, 1,
-0.3296259, 1.779902, -0.4098773, 1, 1, 1, 1, 1,
-0.3293341, 0.4701609, 0.3205546, 1, 1, 1, 1, 1,
-0.3272829, -0.2791745, -3.771162, 1, 1, 1, 1, 1,
-0.3264616, 1.826374, 0.638833, 1, 1, 1, 1, 1,
-0.3188865, -0.7904426, -1.66142, 0, 0, 1, 1, 1,
-0.3177859, 0.676156, -0.5231211, 1, 0, 0, 1, 1,
-0.3177603, 0.159376, -1.063703, 1, 0, 0, 1, 1,
-0.3118259, -0.0802264, -1.20122, 1, 0, 0, 1, 1,
-0.3101363, 1.086225, 2.161684, 1, 0, 0, 1, 1,
-0.3099742, -0.7137766, -2.393087, 1, 0, 0, 1, 1,
-0.3098493, 1.90917, -1.263827, 0, 0, 0, 1, 1,
-0.3061629, -1.531663, -3.193745, 0, 0, 0, 1, 1,
-0.301643, 0.2747431, -0.1009451, 0, 0, 0, 1, 1,
-0.2962322, 0.6027425, -0.5602285, 0, 0, 0, 1, 1,
-0.2884979, 0.5863714, -0.3381919, 0, 0, 0, 1, 1,
-0.2877066, 1.262658, 1.897139, 0, 0, 0, 1, 1,
-0.2856458, -0.2302732, -2.270663, 0, 0, 0, 1, 1,
-0.2847584, 0.5082426, -0.4909176, 1, 1, 1, 1, 1,
-0.2845985, -1.078841, -2.313364, 1, 1, 1, 1, 1,
-0.2787812, -0.1486854, 0.7282537, 1, 1, 1, 1, 1,
-0.2764591, 0.5253498, 1.558066, 1, 1, 1, 1, 1,
-0.2704849, 0.002708542, -2.382549, 1, 1, 1, 1, 1,
-0.265607, 0.241009, 1.243601, 1, 1, 1, 1, 1,
-0.2569294, 0.8133104, -0.469905, 1, 1, 1, 1, 1,
-0.2546388, 1.957767, -0.8731641, 1, 1, 1, 1, 1,
-0.2530117, 1.783632, 0.8085068, 1, 1, 1, 1, 1,
-0.2527022, 0.3989972, -1.847516, 1, 1, 1, 1, 1,
-0.2526559, -0.7446417, -2.795066, 1, 1, 1, 1, 1,
-0.2505922, 0.1163014, -2.342068, 1, 1, 1, 1, 1,
-0.2501657, -0.5464404, -2.679003, 1, 1, 1, 1, 1,
-0.2475994, 0.2571016, 0.6318565, 1, 1, 1, 1, 1,
-0.2454529, 1.312851, 0.1625723, 1, 1, 1, 1, 1,
-0.2403232, 0.9091948, -1.280719, 0, 0, 1, 1, 1,
-0.2382803, 1.623894, -0.5454161, 1, 0, 0, 1, 1,
-0.2352696, 0.8581631, -0.9988126, 1, 0, 0, 1, 1,
-0.2336502, -0.2464215, -1.624699, 1, 0, 0, 1, 1,
-0.2331306, 1.17783, -0.7791682, 1, 0, 0, 1, 1,
-0.2323923, 0.4570197, -0.0005092577, 1, 0, 0, 1, 1,
-0.2310506, 0.04186641, -2.87262, 0, 0, 0, 1, 1,
-0.2261157, -0.3941365, -2.775031, 0, 0, 0, 1, 1,
-0.2246532, -0.3460537, -2.172205, 0, 0, 0, 1, 1,
-0.2233429, 1.096236, 1.595058, 0, 0, 0, 1, 1,
-0.2227674, -0.08164068, -2.403165, 0, 0, 0, 1, 1,
-0.2219618, 0.2204869, -1.526506, 0, 0, 0, 1, 1,
-0.2189696, 0.4703624, -1.167565, 0, 0, 0, 1, 1,
-0.2176163, 1.169123, -0.3962059, 1, 1, 1, 1, 1,
-0.2173721, 0.1535925, -0.145474, 1, 1, 1, 1, 1,
-0.2167523, 1.339043, 1.507774, 1, 1, 1, 1, 1,
-0.216034, -0.3950661, -3.402181, 1, 1, 1, 1, 1,
-0.2118366, 0.9825824, -0.200412, 1, 1, 1, 1, 1,
-0.2046405, -0.724861, -3.392237, 1, 1, 1, 1, 1,
-0.2042949, 0.9542915, -2.202376, 1, 1, 1, 1, 1,
-0.1999753, 0.4982961, -0.1213006, 1, 1, 1, 1, 1,
-0.194083, 0.2982811, 1.2902, 1, 1, 1, 1, 1,
-0.1915514, 1.286223, -0.5206659, 1, 1, 1, 1, 1,
-0.1871532, 0.4307934, 0.9764413, 1, 1, 1, 1, 1,
-0.184901, 1.279724, 0.09388964, 1, 1, 1, 1, 1,
-0.1771301, -0.3750264, -2.087672, 1, 1, 1, 1, 1,
-0.1762532, 0.369, -0.8363134, 1, 1, 1, 1, 1,
-0.1746904, -0.7746091, -3.106681, 1, 1, 1, 1, 1,
-0.1740679, 0.80479, -0.3267009, 0, 0, 1, 1, 1,
-0.1687055, -0.8923692, -2.166084, 1, 0, 0, 1, 1,
-0.1678237, -0.3408231, -0.8988715, 1, 0, 0, 1, 1,
-0.1640539, -0.7630777, -2.717666, 1, 0, 0, 1, 1,
-0.161009, 1.714823, -0.9343067, 1, 0, 0, 1, 1,
-0.1597537, -1.646864, -2.676361, 1, 0, 0, 1, 1,
-0.1592104, -0.3803642, -4.204453, 0, 0, 0, 1, 1,
-0.1533388, 0.03204098, -0.1603106, 0, 0, 0, 1, 1,
-0.1528721, -0.07575393, -0.4508776, 0, 0, 0, 1, 1,
-0.1524139, 1.283952, -0.1451602, 0, 0, 0, 1, 1,
-0.15043, 0.2947455, -0.1798785, 0, 0, 0, 1, 1,
-0.146937, -2.024421, -4.319283, 0, 0, 0, 1, 1,
-0.1425064, 1.448438, 0.6975078, 0, 0, 0, 1, 1,
-0.1399342, -0.4783635, -2.1723, 1, 1, 1, 1, 1,
-0.1384184, -0.278986, -4.093979, 1, 1, 1, 1, 1,
-0.1364491, 0.2762989, -1.086288, 1, 1, 1, 1, 1,
-0.1312496, 3.615489, 0.4413003, 1, 1, 1, 1, 1,
-0.1308731, 0.696495, 0.3472872, 1, 1, 1, 1, 1,
-0.1274524, 1.226819, 0.6837939, 1, 1, 1, 1, 1,
-0.1252969, -1.049683, -2.743487, 1, 1, 1, 1, 1,
-0.1235387, -0.5963762, -2.127247, 1, 1, 1, 1, 1,
-0.1233125, -1.751055, -1.42535, 1, 1, 1, 1, 1,
-0.1185004, -0.08529805, -1.920506, 1, 1, 1, 1, 1,
-0.1127521, 0.2560186, -2.310125, 1, 1, 1, 1, 1,
-0.103701, -0.6473562, -3.593938, 1, 1, 1, 1, 1,
-0.1026458, 0.354741, -0.7083099, 1, 1, 1, 1, 1,
-0.09765258, 1.574271, -0.3020829, 1, 1, 1, 1, 1,
-0.09623928, 1.524758, 0.2783749, 1, 1, 1, 1, 1,
-0.09397757, 1.073455, -0.2827599, 0, 0, 1, 1, 1,
-0.09148737, -0.570883, -2.261538, 1, 0, 0, 1, 1,
-0.08962974, 0.5893126, 0.7856438, 1, 0, 0, 1, 1,
-0.08891579, 0.1351799, 0.1438113, 1, 0, 0, 1, 1,
-0.08783025, 0.07170162, 0.0561266, 1, 0, 0, 1, 1,
-0.08699074, -0.6034614, -2.902783, 1, 0, 0, 1, 1,
-0.08561692, -0.5422866, -2.204282, 0, 0, 0, 1, 1,
-0.08498949, 0.4779426, 0.7134767, 0, 0, 0, 1, 1,
-0.0801902, 1.850805, -0.8731323, 0, 0, 0, 1, 1,
-0.07840175, 2.003863, 0.0550258, 0, 0, 0, 1, 1,
-0.07710932, -0.6729615, -2.465991, 0, 0, 0, 1, 1,
-0.06937794, -1.030908, -2.727022, 0, 0, 0, 1, 1,
-0.06886382, -0.2366526, -3.60798, 0, 0, 0, 1, 1,
-0.06537066, 0.7751859, 1.044423, 1, 1, 1, 1, 1,
-0.05786623, 0.3194435, -0.5636166, 1, 1, 1, 1, 1,
-0.05723402, -1.274557, -3.808811, 1, 1, 1, 1, 1,
-0.05374271, -0.05075213, -3.5893, 1, 1, 1, 1, 1,
-0.04902447, -0.2218562, -3.608818, 1, 1, 1, 1, 1,
-0.04795352, -0.05223297, -2.614128, 1, 1, 1, 1, 1,
-0.04522177, 0.4662145, -1.662809, 1, 1, 1, 1, 1,
-0.04014815, -0.9444634, -2.103011, 1, 1, 1, 1, 1,
-0.03553581, -0.8125048, -4.449156, 1, 1, 1, 1, 1,
-0.03162343, 0.7808071, -0.4107338, 1, 1, 1, 1, 1,
-0.03129393, -0.2134449, -2.21109, 1, 1, 1, 1, 1,
-0.03095124, 1.029543, 1.933692, 1, 1, 1, 1, 1,
-0.03041406, -0.2130145, -1.382398, 1, 1, 1, 1, 1,
-0.03006845, 0.9689627, -0.4904769, 1, 1, 1, 1, 1,
-0.02771765, 0.7912951, -0.0001724401, 1, 1, 1, 1, 1,
-0.02746745, -0.7231546, -2.365894, 0, 0, 1, 1, 1,
-0.02472577, 1.315572, 0.440472, 1, 0, 0, 1, 1,
-0.02073918, -0.3876271, -1.954153, 1, 0, 0, 1, 1,
-0.02017979, 0.8067349, 0.3177358, 1, 0, 0, 1, 1,
-0.01999459, -0.9045606, -3.681086, 1, 0, 0, 1, 1,
-0.01831018, -0.6348022, -4.479306, 1, 0, 0, 1, 1,
-0.01582979, -0.6963288, -2.43702, 0, 0, 0, 1, 1,
-0.01274118, -0.1140633, -4.977984, 0, 0, 0, 1, 1,
-0.01033503, -1.506599, -1.744783, 0, 0, 0, 1, 1,
-0.00964776, 0.8957677, 1.021029, 0, 0, 0, 1, 1,
-0.008938797, -0.3845724, -3.748863, 0, 0, 0, 1, 1,
-0.00811785, 1.403973, -0.1959615, 0, 0, 0, 1, 1,
-0.006513077, -0.3499655, -3.400812, 0, 0, 0, 1, 1,
-0.006401301, -0.4572291, -3.477867, 1, 1, 1, 1, 1,
-0.004755755, -0.4847057, -3.322194, 1, 1, 1, 1, 1,
-0.004081628, 2.493088, -0.8437571, 1, 1, 1, 1, 1,
-0.001198699, 0.2463997, 0.2285816, 1, 1, 1, 1, 1,
0.0008567781, -0.9838678, 2.525054, 1, 1, 1, 1, 1,
0.003269295, 0.3791109, -0.3373337, 1, 1, 1, 1, 1,
0.005489983, 0.06038756, -1.1362, 1, 1, 1, 1, 1,
0.005863407, 0.5365294, -1.391251, 1, 1, 1, 1, 1,
0.007536765, 0.8553561, 1.008273, 1, 1, 1, 1, 1,
0.008383359, 0.3604205, -1.163265, 1, 1, 1, 1, 1,
0.01085018, -0.7192029, 2.426054, 1, 1, 1, 1, 1,
0.0109041, -0.9739132, 3.951193, 1, 1, 1, 1, 1,
0.01095481, -0.1463591, 3.597266, 1, 1, 1, 1, 1,
0.01230258, 1.893156, -0.8853961, 1, 1, 1, 1, 1,
0.01555359, 0.4300603, -0.8447295, 1, 1, 1, 1, 1,
0.01733019, 0.521453, -1.155209, 0, 0, 1, 1, 1,
0.01959987, 0.1546472, -1.588029, 1, 0, 0, 1, 1,
0.02303597, -1.132593, 1.420065, 1, 0, 0, 1, 1,
0.02360981, -0.8884421, 3.678598, 1, 0, 0, 1, 1,
0.02549004, -0.2656687, 4.489982, 1, 0, 0, 1, 1,
0.02610495, -1.373091, 1.5112, 1, 0, 0, 1, 1,
0.02716359, 0.085086, 1.305933, 0, 0, 0, 1, 1,
0.02750497, -1.948499, 3.547482, 0, 0, 0, 1, 1,
0.03015983, 0.4921169, 0.9332822, 0, 0, 0, 1, 1,
0.03683037, -0.2844548, 3.297156, 0, 0, 0, 1, 1,
0.03884769, -0.3758748, 2.706569, 0, 0, 0, 1, 1,
0.04013946, 0.6391133, 0.8034467, 0, 0, 0, 1, 1,
0.04034999, 0.3310802, 1.571906, 0, 0, 0, 1, 1,
0.04514758, -1.425195, 4.273986, 1, 1, 1, 1, 1,
0.04872663, -0.7122303, 3.532992, 1, 1, 1, 1, 1,
0.05232036, -1.741542, 3.03968, 1, 1, 1, 1, 1,
0.0558865, 0.6808347, -0.986675, 1, 1, 1, 1, 1,
0.05612879, 0.2201188, 1.445584, 1, 1, 1, 1, 1,
0.05718779, -0.973183, 1.608474, 1, 1, 1, 1, 1,
0.06197751, 0.2717747, -0.1649827, 1, 1, 1, 1, 1,
0.06507755, 1.402989, 0.6030292, 1, 1, 1, 1, 1,
0.06759671, 0.8120072, -0.6308247, 1, 1, 1, 1, 1,
0.06798579, -2.208833, 4.341186, 1, 1, 1, 1, 1,
0.07056788, -0.8639882, 3.972733, 1, 1, 1, 1, 1,
0.07261303, -0.2994998, 1.210861, 1, 1, 1, 1, 1,
0.07530768, -0.7770454, 2.51993, 1, 1, 1, 1, 1,
0.07778083, -0.1720256, 3.135586, 1, 1, 1, 1, 1,
0.08024674, -1.610131, 0.7019051, 1, 1, 1, 1, 1,
0.08125151, -1.305473, 4.095688, 0, 0, 1, 1, 1,
0.08345866, 0.7632144, 0.2986818, 1, 0, 0, 1, 1,
0.08427796, 1.417711, 0.6642768, 1, 0, 0, 1, 1,
0.08512076, -0.4366684, 2.839034, 1, 0, 0, 1, 1,
0.08764087, -0.6191553, 2.211387, 1, 0, 0, 1, 1,
0.09040226, 1.616447, 0.2707233, 1, 0, 0, 1, 1,
0.09049777, -0.353424, 4.299665, 0, 0, 0, 1, 1,
0.09288339, 0.8463025, 2.428499, 0, 0, 0, 1, 1,
0.09368817, 0.09482352, 1.226737, 0, 0, 0, 1, 1,
0.09721359, -0.09414462, 1.410863, 0, 0, 0, 1, 1,
0.09986987, -0.9711773, 0.5511519, 0, 0, 0, 1, 1,
0.1025457, -0.4146794, 2.89563, 0, 0, 0, 1, 1,
0.1136156, 0.1031578, 0.3474689, 0, 0, 0, 1, 1,
0.1138606, -1.257193, 2.949469, 1, 1, 1, 1, 1,
0.1139309, -0.7914855, 3.750855, 1, 1, 1, 1, 1,
0.1150762, -0.8598275, 2.24308, 1, 1, 1, 1, 1,
0.1233103, 1.218673, 1.435406, 1, 1, 1, 1, 1,
0.1253901, -0.5007935, 3.25738, 1, 1, 1, 1, 1,
0.1286983, -1.920138, 2.965691, 1, 1, 1, 1, 1,
0.1324768, 0.5267196, 0.1850991, 1, 1, 1, 1, 1,
0.1372879, 0.2483448, -2.008225, 1, 1, 1, 1, 1,
0.1400646, -0.1067974, 2.596386, 1, 1, 1, 1, 1,
0.1521221, 0.7088531, -0.4717545, 1, 1, 1, 1, 1,
0.1553364, -0.5477521, 3.100104, 1, 1, 1, 1, 1,
0.1558723, -0.2071399, 0.8624457, 1, 1, 1, 1, 1,
0.1562385, 0.8476837, -0.2292284, 1, 1, 1, 1, 1,
0.1609411, 0.4615576, -0.8928381, 1, 1, 1, 1, 1,
0.1611992, -0.8115484, 3.282558, 1, 1, 1, 1, 1,
0.1646503, -0.7832559, 4.336111, 0, 0, 1, 1, 1,
0.1646841, -1.043348, 4.510498, 1, 0, 0, 1, 1,
0.1665009, -0.2195054, 0.8919712, 1, 0, 0, 1, 1,
0.1713992, -1.294538, 3.006592, 1, 0, 0, 1, 1,
0.1731807, 1.701584, -1.673067, 1, 0, 0, 1, 1,
0.1752811, -0.282255, 0.3198436, 1, 0, 0, 1, 1,
0.1780213, -0.6119291, 1.625856, 0, 0, 0, 1, 1,
0.1785444, -1.017454, 1.1762, 0, 0, 0, 1, 1,
0.1932643, 0.003030259, 2.733551, 0, 0, 0, 1, 1,
0.1953237, -0.4642673, 2.7126, 0, 0, 0, 1, 1,
0.2047808, -0.5251409, 2.784671, 0, 0, 0, 1, 1,
0.20967, -1.019516, 3.302758, 0, 0, 0, 1, 1,
0.2140635, -1.000916, 3.599282, 0, 0, 0, 1, 1,
0.2150118, 0.8188479, 0.007685842, 1, 1, 1, 1, 1,
0.2185891, 0.5956231, 1.502723, 1, 1, 1, 1, 1,
0.2220849, -0.4931311, 2.981472, 1, 1, 1, 1, 1,
0.227633, -1.477775, 1.180473, 1, 1, 1, 1, 1,
0.2302908, -0.22041, 1.926739, 1, 1, 1, 1, 1,
0.2327629, -0.4224351, 2.936282, 1, 1, 1, 1, 1,
0.2356715, -2.028268, 3.11454, 1, 1, 1, 1, 1,
0.2412956, -0.07569452, 2.719127, 1, 1, 1, 1, 1,
0.2500856, 2.265439, -1.490985, 1, 1, 1, 1, 1,
0.2533489, -0.5741416, 2.664843, 1, 1, 1, 1, 1,
0.2542046, 2.108647, -0.1127588, 1, 1, 1, 1, 1,
0.2598831, -0.9017627, 1.899088, 1, 1, 1, 1, 1,
0.268311, -0.4271104, 3.164237, 1, 1, 1, 1, 1,
0.2691486, 1.566669, 1.392062, 1, 1, 1, 1, 1,
0.2693307, 0.2607711, 1.790411, 1, 1, 1, 1, 1,
0.272495, -0.8133929, 2.492466, 0, 0, 1, 1, 1,
0.2739314, -0.3736355, 1.568405, 1, 0, 0, 1, 1,
0.2745675, -1.350752, 3.947312, 1, 0, 0, 1, 1,
0.2765248, -1.625844, 1.909028, 1, 0, 0, 1, 1,
0.2793486, -0.3228899, 1.723149, 1, 0, 0, 1, 1,
0.2795616, 1.451202, 0.1754695, 1, 0, 0, 1, 1,
0.2819686, 1.794557, -0.6312274, 0, 0, 0, 1, 1,
0.2822291, -2.238061, 3.880721, 0, 0, 0, 1, 1,
0.2836823, 2.436895, -1.981275, 0, 0, 0, 1, 1,
0.2874567, -0.2521752, 1.180226, 0, 0, 0, 1, 1,
0.2899666, -0.5821865, 4.244287, 0, 0, 0, 1, 1,
0.295437, -0.653331, 3.354443, 0, 0, 0, 1, 1,
0.3068175, 2.618095, -0.4040168, 0, 0, 0, 1, 1,
0.3077437, 1.672605, 0.9869843, 1, 1, 1, 1, 1,
0.3106503, -0.5553092, 4.121563, 1, 1, 1, 1, 1,
0.3121519, 2.14427, -0.3585729, 1, 1, 1, 1, 1,
0.315328, -0.6856326, 3.353888, 1, 1, 1, 1, 1,
0.3167773, 0.1521315, 1.058778, 1, 1, 1, 1, 1,
0.3193746, 0.9635855, 0.1971529, 1, 1, 1, 1, 1,
0.3229132, 1.072693, 1.041848, 1, 1, 1, 1, 1,
0.3271648, 0.7089505, 0.2978908, 1, 1, 1, 1, 1,
0.330274, 0.8606797, 2.152291, 1, 1, 1, 1, 1,
0.332404, 0.1802997, 2.205089, 1, 1, 1, 1, 1,
0.3354741, -1.481755, 2.28338, 1, 1, 1, 1, 1,
0.3357168, 0.1142229, -0.5508766, 1, 1, 1, 1, 1,
0.3375055, -0.8575407, 3.974853, 1, 1, 1, 1, 1,
0.3392706, 0.6881635, 2.001522, 1, 1, 1, 1, 1,
0.340344, 0.9588386, 0.993905, 1, 1, 1, 1, 1,
0.3407605, -0.02748217, 2.279459, 0, 0, 1, 1, 1,
0.341191, 0.9305269, 0.449372, 1, 0, 0, 1, 1,
0.3413427, 0.1759529, -0.2012711, 1, 0, 0, 1, 1,
0.341796, 0.01886565, 1.325582, 1, 0, 0, 1, 1,
0.3450507, 2.360922, -0.6371143, 1, 0, 0, 1, 1,
0.3495426, 0.6235966, -0.3493457, 1, 0, 0, 1, 1,
0.3499638, -0.6670606, 4.718415, 0, 0, 0, 1, 1,
0.3501625, -0.902456, 3.068194, 0, 0, 0, 1, 1,
0.3521959, -1.356203, 2.033165, 0, 0, 0, 1, 1,
0.3545145, 0.3988885, 1.447023, 0, 0, 0, 1, 1,
0.35684, -2.983803, 3.429201, 0, 0, 0, 1, 1,
0.3671113, 0.1783833, -0.5805241, 0, 0, 0, 1, 1,
0.3726153, -0.5464635, 3.676718, 0, 0, 0, 1, 1,
0.3729258, 0.4137331, 1.898713, 1, 1, 1, 1, 1,
0.3746197, -0.2029255, 3.306526, 1, 1, 1, 1, 1,
0.3770637, -0.08493625, 2.543521, 1, 1, 1, 1, 1,
0.3770857, -0.4579235, 1.697231, 1, 1, 1, 1, 1,
0.3778187, -0.103957, 0.7169344, 1, 1, 1, 1, 1,
0.3794002, -0.2165392, 1.739438, 1, 1, 1, 1, 1,
0.3845083, -0.4901105, 4.040091, 1, 1, 1, 1, 1,
0.3848838, -0.8848118, 2.985867, 1, 1, 1, 1, 1,
0.3849096, 0.562202, -0.07588153, 1, 1, 1, 1, 1,
0.3857643, 1.434971, -0.1544779, 1, 1, 1, 1, 1,
0.386524, -1.159905, 1.512666, 1, 1, 1, 1, 1,
0.3880083, -0.1721756, 3.290053, 1, 1, 1, 1, 1,
0.3885615, 1.310019, -0.2940095, 1, 1, 1, 1, 1,
0.3943868, -0.2908509, 2.565359, 1, 1, 1, 1, 1,
0.3977115, -2.05831, 1.301479, 1, 1, 1, 1, 1,
0.3991192, -0.4276415, 2.037459, 0, 0, 1, 1, 1,
0.4003408, 0.7283172, 1.022235, 1, 0, 0, 1, 1,
0.400809, 0.04909191, 1.033683, 1, 0, 0, 1, 1,
0.4021027, 0.4296509, 0.7489837, 1, 0, 0, 1, 1,
0.4088857, -0.5784839, 1.596664, 1, 0, 0, 1, 1,
0.4116422, 0.6870412, 0.3290914, 1, 0, 0, 1, 1,
0.4241205, 1.549187, -1.108143, 0, 0, 0, 1, 1,
0.4263219, -0.9038447, 2.292671, 0, 0, 0, 1, 1,
0.4300909, 0.02845743, -0.599988, 0, 0, 0, 1, 1,
0.4357625, 0.6477273, -0.3501425, 0, 0, 0, 1, 1,
0.4385563, -0.1445228, 1.03481, 0, 0, 0, 1, 1,
0.4394612, 0.6888296, 3.465289, 0, 0, 0, 1, 1,
0.4413853, 1.316261, -0.6646884, 0, 0, 0, 1, 1,
0.4419981, 0.3311769, 3.548171, 1, 1, 1, 1, 1,
0.4450588, 0.6983476, 2.315273, 1, 1, 1, 1, 1,
0.4490738, 0.4109276, 1.809592, 1, 1, 1, 1, 1,
0.4563795, 1.002863, 1.415513, 1, 1, 1, 1, 1,
0.4648941, 1.001089, 0.7380105, 1, 1, 1, 1, 1,
0.4666059, -0.8984818, 3.535394, 1, 1, 1, 1, 1,
0.4680255, 0.2642505, 3.620948, 1, 1, 1, 1, 1,
0.4793623, 0.032905, 1.653159, 1, 1, 1, 1, 1,
0.4806423, -1.236167, 2.880569, 1, 1, 1, 1, 1,
0.4873851, -0.04220416, -0.06198031, 1, 1, 1, 1, 1,
0.4913778, 1.214881, 0.8123186, 1, 1, 1, 1, 1,
0.5003993, -1.083411, 1.113264, 1, 1, 1, 1, 1,
0.504797, 1.305789, -0.1506498, 1, 1, 1, 1, 1,
0.50568, 0.1600607, 0.9994714, 1, 1, 1, 1, 1,
0.513882, 0.0948732, 1.171531, 1, 1, 1, 1, 1,
0.5153694, -1.808897, 1.890262, 0, 0, 1, 1, 1,
0.5156667, 1.217952, 0.5067038, 1, 0, 0, 1, 1,
0.5158348, 0.9002123, 0.107288, 1, 0, 0, 1, 1,
0.5184252, 0.7748047, 1.069464, 1, 0, 0, 1, 1,
0.5202677, -0.9932856, 1.777175, 1, 0, 0, 1, 1,
0.5203319, -0.4456367, 2.922682, 1, 0, 0, 1, 1,
0.5210128, -2.08073, 3.289588, 0, 0, 0, 1, 1,
0.5230739, 0.6857624, -0.5246081, 0, 0, 0, 1, 1,
0.5320872, 0.8406341, -0.06349202, 0, 0, 0, 1, 1,
0.5364692, 0.1076799, 0.8493183, 0, 0, 0, 1, 1,
0.5397335, -0.663769, 3.256654, 0, 0, 0, 1, 1,
0.540029, 0.04363651, 0.7542585, 0, 0, 0, 1, 1,
0.553065, -1.492886, 2.199062, 0, 0, 0, 1, 1,
0.5566754, -0.2193334, 2.778157, 1, 1, 1, 1, 1,
0.5575544, 1.184733, 0.7225998, 1, 1, 1, 1, 1,
0.566766, -0.6158593, 1.589106, 1, 1, 1, 1, 1,
0.5670284, 0.8050905, 1.029601, 1, 1, 1, 1, 1,
0.5701749, 1.010475, 1.694124, 1, 1, 1, 1, 1,
0.5711457, -1.582848, 0.7666522, 1, 1, 1, 1, 1,
0.5761538, 1.17227, 0.05588496, 1, 1, 1, 1, 1,
0.5768668, -1.034572, 1.391948, 1, 1, 1, 1, 1,
0.5827922, -1.017044, 3.81715, 1, 1, 1, 1, 1,
0.5848253, -1.168579, 4.697072, 1, 1, 1, 1, 1,
0.5925677, -1.308043, 3.939644, 1, 1, 1, 1, 1,
0.59292, 0.03677867, 2.496647, 1, 1, 1, 1, 1,
0.5948257, 0.7028455, -0.05695288, 1, 1, 1, 1, 1,
0.5953271, 0.6984655, 0.868379, 1, 1, 1, 1, 1,
0.597176, 0.5293838, 1.788123, 1, 1, 1, 1, 1,
0.597285, -1.3545, 3.267267, 0, 0, 1, 1, 1,
0.5975735, -0.3336244, 1.924417, 1, 0, 0, 1, 1,
0.6003593, 0.8120136, 0.8127939, 1, 0, 0, 1, 1,
0.6035743, 0.2798132, 2.476561, 1, 0, 0, 1, 1,
0.6053625, 0.5537199, -0.1817705, 1, 0, 0, 1, 1,
0.6078021, 0.7978498, 0.5645742, 1, 0, 0, 1, 1,
0.608147, 1.645409, -1.396749, 0, 0, 0, 1, 1,
0.6082667, 0.02101324, 1.038502, 0, 0, 0, 1, 1,
0.6155705, -2.294196, 2.483088, 0, 0, 0, 1, 1,
0.615876, -0.4248528, 3.442822, 0, 0, 0, 1, 1,
0.6181469, 0.1169229, 2.814844, 0, 0, 0, 1, 1,
0.6195583, -0.2414031, 2.555451, 0, 0, 0, 1, 1,
0.6266388, 0.2383752, -0.1984229, 0, 0, 0, 1, 1,
0.6291434, 0.3503576, 0.0301103, 1, 1, 1, 1, 1,
0.6323299, 0.2239974, 1.536301, 1, 1, 1, 1, 1,
0.6343338, -0.3889757, 1.149994, 1, 1, 1, 1, 1,
0.6347997, 0.4217524, -1.135557, 1, 1, 1, 1, 1,
0.6355981, -0.1098405, 0.5414134, 1, 1, 1, 1, 1,
0.6563819, 0.8228381, 0.6140922, 1, 1, 1, 1, 1,
0.6611083, 1.442737, 0.8297165, 1, 1, 1, 1, 1,
0.6612046, 0.666517, -1.664973, 1, 1, 1, 1, 1,
0.6710667, 0.4556044, 0.7173256, 1, 1, 1, 1, 1,
0.6716849, -1.89627, 2.012491, 1, 1, 1, 1, 1,
0.6815214, 0.1138928, 2.415842, 1, 1, 1, 1, 1,
0.6841474, 1.355746, 2.210179, 1, 1, 1, 1, 1,
0.6868708, -1.142986, 0.799763, 1, 1, 1, 1, 1,
0.6910153, 0.3673735, 0.4246173, 1, 1, 1, 1, 1,
0.6923569, -2.115024, 3.490971, 1, 1, 1, 1, 1,
0.6941548, 0.4500519, 1.270759, 0, 0, 1, 1, 1,
0.7040473, -0.7460515, 1.332258, 1, 0, 0, 1, 1,
0.706401, -1.56613, 0.2755424, 1, 0, 0, 1, 1,
0.7074428, 0.044401, 0.6137123, 1, 0, 0, 1, 1,
0.724407, -0.7166765, 2.482123, 1, 0, 0, 1, 1,
0.7262973, -0.1492271, -0.06507713, 1, 0, 0, 1, 1,
0.7344241, 0.07800807, 1.313934, 0, 0, 0, 1, 1,
0.7376711, 0.8025355, 1.6969, 0, 0, 0, 1, 1,
0.7378756, -1.14978, 2.672102, 0, 0, 0, 1, 1,
0.7383047, -0.7447999, 2.647052, 0, 0, 0, 1, 1,
0.7523649, -0.1703635, 1.353112, 0, 0, 0, 1, 1,
0.7534838, -0.8224061, 0.7001551, 0, 0, 0, 1, 1,
0.7570692, 0.3764548, 2.914099, 0, 0, 0, 1, 1,
0.7593842, 0.8565544, -0.4133822, 1, 1, 1, 1, 1,
0.7651795, -1.247432, 3.790659, 1, 1, 1, 1, 1,
0.7686405, 1.034285, 1.314279, 1, 1, 1, 1, 1,
0.769847, -0.8453606, 0.2913087, 1, 1, 1, 1, 1,
0.7798957, 0.8676627, 0.108921, 1, 1, 1, 1, 1,
0.7878915, 0.2541765, -0.1674221, 1, 1, 1, 1, 1,
0.7881566, -0.113839, -0.01187925, 1, 1, 1, 1, 1,
0.7932477, -0.175473, 1.48053, 1, 1, 1, 1, 1,
0.7936364, 0.05836607, 0.03224774, 1, 1, 1, 1, 1,
0.7992383, 0.4800512, 0.805574, 1, 1, 1, 1, 1,
0.7996984, 1.862976, 0.8767383, 1, 1, 1, 1, 1,
0.8007292, -1.149177, 2.439376, 1, 1, 1, 1, 1,
0.811764, 0.6175321, 0.9708804, 1, 1, 1, 1, 1,
0.8170848, -0.5684692, 0.09902751, 1, 1, 1, 1, 1,
0.819203, -0.8742546, 4.978574, 1, 1, 1, 1, 1,
0.8214615, 0.6536543, 1.775067, 0, 0, 1, 1, 1,
0.8245185, -0.4800514, 1.805894, 1, 0, 0, 1, 1,
0.8248546, 1.60803, 1.325758, 1, 0, 0, 1, 1,
0.8289145, -1.153128, -0.06266063, 1, 0, 0, 1, 1,
0.8310965, -0.3428639, 1.120906, 1, 0, 0, 1, 1,
0.8313411, -0.0195915, 0.3775391, 1, 0, 0, 1, 1,
0.8320636, 1.139927, 1.396946, 0, 0, 0, 1, 1,
0.832902, -0.4356317, 1.221346, 0, 0, 0, 1, 1,
0.8369047, 0.7891811, 0.9442367, 0, 0, 0, 1, 1,
0.8419831, 0.8530561, 0.1140033, 0, 0, 0, 1, 1,
0.8433717, -0.4737115, 0.451484, 0, 0, 0, 1, 1,
0.8435841, -0.4655103, 2.698766, 0, 0, 0, 1, 1,
0.8441623, -2.346811, 3.090637, 0, 0, 0, 1, 1,
0.8441651, 0.3011457, 2.092546, 1, 1, 1, 1, 1,
0.8444421, 1.623735, -1.03847, 1, 1, 1, 1, 1,
0.8452291, -0.2010219, 1.609682, 1, 1, 1, 1, 1,
0.8480251, 0.5518004, -1.16659, 1, 1, 1, 1, 1,
0.8504233, -1.041955, 4.530393, 1, 1, 1, 1, 1,
0.852227, 0.1688486, 1.945296, 1, 1, 1, 1, 1,
0.8535826, 0.3381777, -1.682492, 1, 1, 1, 1, 1,
0.8594127, 1.066895, 1.411675, 1, 1, 1, 1, 1,
0.8663108, 0.7296674, 0.7203701, 1, 1, 1, 1, 1,
0.8705322, -1.522056, 2.810913, 1, 1, 1, 1, 1,
0.8734866, -1.13873, 2.514255, 1, 1, 1, 1, 1,
0.8774768, -0.3072743, 2.575049, 1, 1, 1, 1, 1,
0.8800341, -1.499108, 2.359612, 1, 1, 1, 1, 1,
0.8883925, -0.5414394, 1.001123, 1, 1, 1, 1, 1,
0.8940917, -1.922007, 2.185699, 1, 1, 1, 1, 1,
0.9014173, 1.537832, -0.6363929, 0, 0, 1, 1, 1,
0.9077706, 0.6685403, 1.310199, 1, 0, 0, 1, 1,
0.9096835, -0.3657045, 2.667226, 1, 0, 0, 1, 1,
0.910094, -0.7795112, 1.863322, 1, 0, 0, 1, 1,
0.9171155, 1.43211, 1.242068, 1, 0, 0, 1, 1,
0.9243861, -1.265008, 2.26315, 1, 0, 0, 1, 1,
0.9296584, 1.37088, -0.4667262, 0, 0, 0, 1, 1,
0.9340723, -0.4565423, 1.401167, 0, 0, 0, 1, 1,
0.9347857, -1.883321, 3.080432, 0, 0, 0, 1, 1,
0.9372492, -0.8579766, 1.452345, 0, 0, 0, 1, 1,
0.9441723, -0.7409577, 1.529312, 0, 0, 0, 1, 1,
0.9449717, 1.089773, 1.789674, 0, 0, 0, 1, 1,
0.945023, 0.4526664, 0.1305445, 0, 0, 0, 1, 1,
0.9496306, 1.093798, 0.2069845, 1, 1, 1, 1, 1,
0.9503477, 0.4866624, 0.8986455, 1, 1, 1, 1, 1,
0.9516044, -1.57293, 2.238956, 1, 1, 1, 1, 1,
0.9516678, 0.04237461, 3.408949, 1, 1, 1, 1, 1,
0.9523959, -0.2766072, 1.631074, 1, 1, 1, 1, 1,
0.9563308, -1.69427, 2.08768, 1, 1, 1, 1, 1,
0.9635861, -1.139767, 1.408119, 1, 1, 1, 1, 1,
0.963873, 1.095453, 0.6587344, 1, 1, 1, 1, 1,
0.9687554, -0.3286861, 1.722192, 1, 1, 1, 1, 1,
0.9692567, -1.894773, 3.021267, 1, 1, 1, 1, 1,
0.9725847, -0.07234076, 2.003443, 1, 1, 1, 1, 1,
0.9745525, 1.270624, 0.8274186, 1, 1, 1, 1, 1,
0.9774967, 0.7969378, 1.250093, 1, 1, 1, 1, 1,
0.9779945, 0.2840009, 2.0104, 1, 1, 1, 1, 1,
0.9783704, -1.129919, 2.692518, 1, 1, 1, 1, 1,
0.9839709, 2.880261, 0.1244062, 0, 0, 1, 1, 1,
0.9885477, -0.7402261, 2.191091, 1, 0, 0, 1, 1,
0.9899579, -0.9857931, 1.315131, 1, 0, 0, 1, 1,
0.9912693, 0.1206672, 2.091875, 1, 0, 0, 1, 1,
0.99325, -1.053099, 3.659928, 1, 0, 0, 1, 1,
1.00507, -0.4212934, 1.902392, 1, 0, 0, 1, 1,
1.010169, -1.090209, 1.43452, 0, 0, 0, 1, 1,
1.025035, 1.334134, 2.598845, 0, 0, 0, 1, 1,
1.025115, -1.104177, 1.641519, 0, 0, 0, 1, 1,
1.025731, -0.6236092, 1.979583, 0, 0, 0, 1, 1,
1.034118, -0.9122902, 3.13887, 0, 0, 0, 1, 1,
1.039857, -0.8316454, 1.052029, 0, 0, 0, 1, 1,
1.041139, 0.1554823, 1.111699, 0, 0, 0, 1, 1,
1.041603, -1.156531, 2.499529, 1, 1, 1, 1, 1,
1.046935, -0.8282235, 3.008672, 1, 1, 1, 1, 1,
1.054693, 0.3176877, 0.9129866, 1, 1, 1, 1, 1,
1.057844, 2.045518, 1.253288, 1, 1, 1, 1, 1,
1.058791, 0.7446842, 0.3549776, 1, 1, 1, 1, 1,
1.059378, -0.5218892, 2.537588, 1, 1, 1, 1, 1,
1.069865, 1.229712, -0.1913588, 1, 1, 1, 1, 1,
1.072481, -0.273778, 1.575245, 1, 1, 1, 1, 1,
1.076365, -0.7829481, 1.862001, 1, 1, 1, 1, 1,
1.080551, 0.7698996, 2.223485, 1, 1, 1, 1, 1,
1.084092, 1.206743, 1.09442, 1, 1, 1, 1, 1,
1.08596, -1.296039, 1.79889, 1, 1, 1, 1, 1,
1.103968, -0.4454321, 2.628477, 1, 1, 1, 1, 1,
1.1115, 0.759007, 2.672704, 1, 1, 1, 1, 1,
1.114272, 0.2856542, 0.1220722, 1, 1, 1, 1, 1,
1.118986, -0.02244464, 3.279243, 0, 0, 1, 1, 1,
1.120921, -0.1971432, 5.186586, 1, 0, 0, 1, 1,
1.123878, -0.4529553, 2.495984, 1, 0, 0, 1, 1,
1.12447, -0.2632543, 1.810661, 1, 0, 0, 1, 1,
1.125288, 1.688612, 0.462475, 1, 0, 0, 1, 1,
1.127045, -1.106791, 2.528385, 1, 0, 0, 1, 1,
1.134771, -0.4010539, 2.651883, 0, 0, 0, 1, 1,
1.134874, 0.6658798, 0.4030531, 0, 0, 0, 1, 1,
1.134886, 0.3631521, 1.552988, 0, 0, 0, 1, 1,
1.137109, -0.7929255, 1.655407, 0, 0, 0, 1, 1,
1.140128, 0.5602059, 1.331489, 0, 0, 0, 1, 1,
1.141084, -0.7826005, 0.006966507, 0, 0, 0, 1, 1,
1.170888, -0.9063093, 3.149807, 0, 0, 0, 1, 1,
1.174615, 0.03240615, 2.233132, 1, 1, 1, 1, 1,
1.178048, -0.00922305, 1.12402, 1, 1, 1, 1, 1,
1.178097, 0.289727, 2.693985, 1, 1, 1, 1, 1,
1.1811, 0.0959922, 2.975348, 1, 1, 1, 1, 1,
1.183148, -1.739717, 1.434119, 1, 1, 1, 1, 1,
1.183775, 0.08896621, 2.969387, 1, 1, 1, 1, 1,
1.185153, -0.1273944, 1.758088, 1, 1, 1, 1, 1,
1.185239, -0.9010507, 2.18432, 1, 1, 1, 1, 1,
1.186973, 0.706586, -0.0289124, 1, 1, 1, 1, 1,
1.187414, 1.361548, 0.3008532, 1, 1, 1, 1, 1,
1.194124, -1.449538, 2.944543, 1, 1, 1, 1, 1,
1.194811, 1.295699, -0.4366688, 1, 1, 1, 1, 1,
1.203481, 0.8053691, 2.277703, 1, 1, 1, 1, 1,
1.208207, 1.556022, 0.6269055, 1, 1, 1, 1, 1,
1.208512, 2.110683, 1.472388, 1, 1, 1, 1, 1,
1.22157, 0.1436778, 0.6261338, 0, 0, 1, 1, 1,
1.222306, 0.3990999, 2.506739, 1, 0, 0, 1, 1,
1.232952, 0.6010371, 0.6754767, 1, 0, 0, 1, 1,
1.23363, -0.05676063, 2.165577, 1, 0, 0, 1, 1,
1.240251, 1.880278, 0.4793699, 1, 0, 0, 1, 1,
1.24223, -0.06741636, 1.320653, 1, 0, 0, 1, 1,
1.249147, 0.1994267, -0.5633556, 0, 0, 0, 1, 1,
1.249249, 2.078772, -0.05780618, 0, 0, 0, 1, 1,
1.251372, -0.927343, 3.046932, 0, 0, 0, 1, 1,
1.251392, -1.642482, 3.285616, 0, 0, 0, 1, 1,
1.275893, -0.5985215, 2.144975, 0, 0, 0, 1, 1,
1.277177, 0.1636278, 1.159655, 0, 0, 0, 1, 1,
1.277232, 0.6958842, 1.9934, 0, 0, 0, 1, 1,
1.278043, -1.372938, 1.977812, 1, 1, 1, 1, 1,
1.280277, 0.3959789, 0.1747562, 1, 1, 1, 1, 1,
1.303482, 0.2950516, 0.8398888, 1, 1, 1, 1, 1,
1.317331, 2.855925, 0.7825639, 1, 1, 1, 1, 1,
1.329079, -0.0909259, 1.385634, 1, 1, 1, 1, 1,
1.329576, -0.08735061, 3.573916, 1, 1, 1, 1, 1,
1.33039, 0.6909123, 1.118819, 1, 1, 1, 1, 1,
1.331424, 0.4079583, -0.2018655, 1, 1, 1, 1, 1,
1.33683, 0.2930861, -0.3680259, 1, 1, 1, 1, 1,
1.337403, 0.1280134, -0.1093239, 1, 1, 1, 1, 1,
1.345135, 0.9069749, 1.054233, 1, 1, 1, 1, 1,
1.355908, 1.278251, 0.5889989, 1, 1, 1, 1, 1,
1.356629, -1.321907, 4.791202, 1, 1, 1, 1, 1,
1.357026, -2.97495, 2.835858, 1, 1, 1, 1, 1,
1.357454, -1.623801, 3.170326, 1, 1, 1, 1, 1,
1.376564, -0.1612606, 1.466225, 0, 0, 1, 1, 1,
1.388042, 1.178432, -0.3650734, 1, 0, 0, 1, 1,
1.39988, -0.2076219, 2.478363, 1, 0, 0, 1, 1,
1.404348, -1.19433, 2.375654, 1, 0, 0, 1, 1,
1.416193, -1.744674, 3.937131, 1, 0, 0, 1, 1,
1.417909, -0.8430172, 1.960635, 1, 0, 0, 1, 1,
1.420814, -0.262725, 2.690199, 0, 0, 0, 1, 1,
1.424661, -0.4672451, 1.728966, 0, 0, 0, 1, 1,
1.42512, 0.2574939, 0.3448024, 0, 0, 0, 1, 1,
1.426036, 1.596042, 0.04645974, 0, 0, 0, 1, 1,
1.429016, 0.9129142, 1.648066, 0, 0, 0, 1, 1,
1.43283, -0.2528786, -0.8398158, 0, 0, 0, 1, 1,
1.438546, 0.3422736, 2.527468, 0, 0, 0, 1, 1,
1.442748, -1.261245, 2.235774, 1, 1, 1, 1, 1,
1.453457, -0.1459998, 1.523957, 1, 1, 1, 1, 1,
1.457823, 1.958729, 2.836944, 1, 1, 1, 1, 1,
1.464225, 0.955781, 2.668158, 1, 1, 1, 1, 1,
1.474825, 1.449813, -0.08293653, 1, 1, 1, 1, 1,
1.480809, -0.5051969, 2.074545, 1, 1, 1, 1, 1,
1.482401, -0.7222273, 2.912513, 1, 1, 1, 1, 1,
1.486037, 1.049502, 2.382576, 1, 1, 1, 1, 1,
1.489535, 0.7367133, 2.770429, 1, 1, 1, 1, 1,
1.498401, 0.0936961, 1.382199, 1, 1, 1, 1, 1,
1.507998, 1.319643, 1.026993, 1, 1, 1, 1, 1,
1.510822, -1.408851, 2.28494, 1, 1, 1, 1, 1,
1.514206, -0.7810825, 0.9929186, 1, 1, 1, 1, 1,
1.523122, -0.526347, 1.730142, 1, 1, 1, 1, 1,
1.524726, 0.7239809, 1.29244, 1, 1, 1, 1, 1,
1.526381, 0.1583836, 2.581428, 0, 0, 1, 1, 1,
1.539218, 0.08440471, 2.844596, 1, 0, 0, 1, 1,
1.543323, 1.093086, 1.156438, 1, 0, 0, 1, 1,
1.554589, -0.5302739, 1.80353, 1, 0, 0, 1, 1,
1.557961, -0.05228081, 2.143082, 1, 0, 0, 1, 1,
1.558603, -1.265518, 1.019157, 1, 0, 0, 1, 1,
1.560907, -0.2074813, 2.763594, 0, 0, 0, 1, 1,
1.561742, 1.304855, 0.3065041, 0, 0, 0, 1, 1,
1.566351, -0.7517547, 2.541096, 0, 0, 0, 1, 1,
1.578311, -2.178946, 1.680504, 0, 0, 0, 1, 1,
1.587162, -1.689101, 2.56615, 0, 0, 0, 1, 1,
1.589676, 0.003964588, 2.197529, 0, 0, 0, 1, 1,
1.592194, 0.02151248, 1.766401, 0, 0, 0, 1, 1,
1.597884, -1.162198, 2.111398, 1, 1, 1, 1, 1,
1.599887, 0.1064285, 0.9035114, 1, 1, 1, 1, 1,
1.610334, -2.419823, 2.198618, 1, 1, 1, 1, 1,
1.616187, 1.075691, 0.7399167, 1, 1, 1, 1, 1,
1.618655, -0.09912876, 2.582227, 1, 1, 1, 1, 1,
1.628896, -0.375289, 1.400684, 1, 1, 1, 1, 1,
1.634198, 0.1975712, 2.2875, 1, 1, 1, 1, 1,
1.635053, -2.11892, 4.146388, 1, 1, 1, 1, 1,
1.635897, -0.9167262, 1.539534, 1, 1, 1, 1, 1,
1.637584, -1.410094, 1.38605, 1, 1, 1, 1, 1,
1.643178, 0.5891232, -1.163735, 1, 1, 1, 1, 1,
1.648917, -2.316722, 2.185993, 1, 1, 1, 1, 1,
1.686289, 0.01772025, 2.113385, 1, 1, 1, 1, 1,
1.695531, 0.7253152, 2.100256, 1, 1, 1, 1, 1,
1.710528, -0.6393297, 1.073125, 1, 1, 1, 1, 1,
1.727699, 0.55615, 0.8893658, 0, 0, 1, 1, 1,
1.742018, -0.257407, 2.91906, 1, 0, 0, 1, 1,
1.742934, 1.590247, -0.8803611, 1, 0, 0, 1, 1,
1.751019, 0.2783522, 2.393083, 1, 0, 0, 1, 1,
1.762208, 1.260484, 1.454814, 1, 0, 0, 1, 1,
1.76747, 1.808191, -0.1172975, 1, 0, 0, 1, 1,
1.805277, 0.9431867, 1.804881, 0, 0, 0, 1, 1,
1.821619, 0.6657476, 1.78757, 0, 0, 0, 1, 1,
1.823487, 0.4208625, 1.361768, 0, 0, 0, 1, 1,
1.823669, -0.7215449, 2.071338, 0, 0, 0, 1, 1,
1.82502, 2.294382, 0.3654521, 0, 0, 0, 1, 1,
1.848576, 0.3579483, -0.262428, 0, 0, 0, 1, 1,
1.848956, -1.706866, 3.000485, 0, 0, 0, 1, 1,
1.890729, -0.1825065, 1.435889, 1, 1, 1, 1, 1,
1.899383, 0.6512958, 1.553214, 1, 1, 1, 1, 1,
1.905566, 1.396099, 1.835444, 1, 1, 1, 1, 1,
1.922455, -1.199858, 4.498197, 1, 1, 1, 1, 1,
1.928857, -0.5873781, 1.843799, 1, 1, 1, 1, 1,
1.957964, -0.5753179, 2.464066, 1, 1, 1, 1, 1,
1.959844, -0.8455045, 1.236792, 1, 1, 1, 1, 1,
1.97797, 2.019577, 0.4228058, 1, 1, 1, 1, 1,
1.982801, 0.1793489, 1.857, 1, 1, 1, 1, 1,
1.985042, 0.4540337, 1.954694, 1, 1, 1, 1, 1,
1.995625, -0.3067391, 0.2056908, 1, 1, 1, 1, 1,
2.00873, 0.7886788, 0.8976982, 1, 1, 1, 1, 1,
2.009238, -1.228637, 1.965613, 1, 1, 1, 1, 1,
2.057163, -0.3679117, 2.122581, 1, 1, 1, 1, 1,
2.124681, 1.741589, 0.4117107, 1, 1, 1, 1, 1,
2.155384, 0.1152366, 2.312438, 0, 0, 1, 1, 1,
2.170562, -2.085812, 3.016681, 1, 0, 0, 1, 1,
2.190107, 1.799931, 1.250745, 1, 0, 0, 1, 1,
2.205265, -0.31164, 2.675676, 1, 0, 0, 1, 1,
2.22246, 1.488257, 1.573629, 1, 0, 0, 1, 1,
2.263843, -1.81762, 2.415234, 1, 0, 0, 1, 1,
2.281767, -1.041882, 1.693878, 0, 0, 0, 1, 1,
2.330839, -0.5282961, 1.981706, 0, 0, 0, 1, 1,
2.336158, 0.357777, 2.373331, 0, 0, 0, 1, 1,
2.343747, 0.8440091, 1.531382, 0, 0, 0, 1, 1,
2.348253, -0.5158877, 3.171687, 0, 0, 0, 1, 1,
2.351578, 0.5667153, 2.384699, 0, 0, 0, 1, 1,
2.457556, 0.4108244, 0.1022087, 0, 0, 0, 1, 1,
2.553581, 2.351243, 1.062729, 1, 1, 1, 1, 1,
2.664962, -0.1721122, 1.679939, 1, 1, 1, 1, 1,
2.949105, -0.5311803, -0.1963028, 1, 1, 1, 1, 1,
2.959227, 0.3228799, 1.800339, 1, 1, 1, 1, 1,
3.050685, 1.115532, 0.2518556, 1, 1, 1, 1, 1,
3.116852, -0.4836977, 0.6789146, 1, 1, 1, 1, 1,
3.61399, -1.079558, 2.35924, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.639277;
var distance = 33.85755;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02584362, -0.3087597, -0.08816123 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.85755);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>