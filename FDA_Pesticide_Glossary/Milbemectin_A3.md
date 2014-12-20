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
-2.912655, -1.193006, -1.021655, 1, 0, 0, 1,
-2.893257, -0.04100626, -1.908005, 1, 0.007843138, 0, 1,
-2.781518, 0.9991088, -1.726113, 1, 0.01176471, 0, 1,
-2.768818, 0.2360255, -2.220975, 1, 0.01960784, 0, 1,
-2.755167, -0.8002202, -2.419785, 1, 0.02352941, 0, 1,
-2.699314, -1.618772, -4.118945, 1, 0.03137255, 0, 1,
-2.659106, -1.111571, -1.407023, 1, 0.03529412, 0, 1,
-2.632761, 1.147118, -1.814468, 1, 0.04313726, 0, 1,
-2.61692, -0.3389178, -0.7520295, 1, 0.04705882, 0, 1,
-2.577002, -0.52621, -1.742113, 1, 0.05490196, 0, 1,
-2.521506, -1.547553, -2.447729, 1, 0.05882353, 0, 1,
-2.433845, -0.7535891, -0.6074838, 1, 0.06666667, 0, 1,
-2.395102, 0.2774436, -1.175963, 1, 0.07058824, 0, 1,
-2.316325, -0.1176532, -3.105553, 1, 0.07843138, 0, 1,
-2.286664, 1.279486, -1.399292, 1, 0.08235294, 0, 1,
-2.236131, 1.246105, -0.2447615, 1, 0.09019608, 0, 1,
-2.196745, -0.6978698, -2.21358, 1, 0.09411765, 0, 1,
-2.133737, -0.816401, -1.219252, 1, 0.1019608, 0, 1,
-2.129638, 0.3284797, -2.983284, 1, 0.1098039, 0, 1,
-2.100635, -0.7654876, -1.423071, 1, 0.1137255, 0, 1,
-2.056808, 1.790589, -0.351264, 1, 0.1215686, 0, 1,
-2.056059, -0.09528957, -1.869209, 1, 0.1254902, 0, 1,
-2.012118, -0.1566605, -0.001705628, 1, 0.1333333, 0, 1,
-1.997532, 1.079837, -1.961757, 1, 0.1372549, 0, 1,
-1.9927, 0.1137705, -3.171483, 1, 0.145098, 0, 1,
-1.958839, 0.1341621, -1.104931, 1, 0.1490196, 0, 1,
-1.928452, -1.322026, -2.146452, 1, 0.1568628, 0, 1,
-1.88394, 0.04677704, -2.822247, 1, 0.1607843, 0, 1,
-1.863962, -1.568206, -1.926683, 1, 0.1686275, 0, 1,
-1.832299, 2.20225, -0.6709961, 1, 0.172549, 0, 1,
-1.829616, -0.9064851, -2.233065, 1, 0.1803922, 0, 1,
-1.827352, -0.6796041, -3.080787, 1, 0.1843137, 0, 1,
-1.798884, -0.8005055, -0.6191596, 1, 0.1921569, 0, 1,
-1.786487, 0.02358971, -2.494996, 1, 0.1960784, 0, 1,
-1.78249, -1.135994, -1.45325, 1, 0.2039216, 0, 1,
-1.743588, 0.7236766, 0.6013981, 1, 0.2117647, 0, 1,
-1.731115, -0.405102, -2.941033, 1, 0.2156863, 0, 1,
-1.704996, 1.188695, -0.05323818, 1, 0.2235294, 0, 1,
-1.682003, -0.2788596, -1.891388, 1, 0.227451, 0, 1,
-1.669992, -0.2831377, -0.8488052, 1, 0.2352941, 0, 1,
-1.668576, -0.4053935, 0.3921419, 1, 0.2392157, 0, 1,
-1.667957, 1.83657, -0.2880073, 1, 0.2470588, 0, 1,
-1.666753, 0.6054872, -1.484783, 1, 0.2509804, 0, 1,
-1.659385, 0.6861205, -2.327408, 1, 0.2588235, 0, 1,
-1.658071, 0.5799475, -1.553915, 1, 0.2627451, 0, 1,
-1.65521, -0.2338408, -3.015959, 1, 0.2705882, 0, 1,
-1.654363, 1.046985, -0.7456575, 1, 0.2745098, 0, 1,
-1.643968, -1.568069, -1.713904, 1, 0.282353, 0, 1,
-1.61938, 0.563157, 0.106329, 1, 0.2862745, 0, 1,
-1.602991, -0.5472119, -2.823682, 1, 0.2941177, 0, 1,
-1.597347, 0.2069895, -1.435295, 1, 0.3019608, 0, 1,
-1.590472, -0.3846567, -1.662061, 1, 0.3058824, 0, 1,
-1.576939, -0.1602117, -1.845255, 1, 0.3137255, 0, 1,
-1.57499, -0.4456568, -2.620223, 1, 0.3176471, 0, 1,
-1.574628, 1.363351, -3.22037, 1, 0.3254902, 0, 1,
-1.566364, -1.296492, -1.266204, 1, 0.3294118, 0, 1,
-1.566319, 0.282212, -2.821288, 1, 0.3372549, 0, 1,
-1.565958, -0.8162421, -1.82562, 1, 0.3411765, 0, 1,
-1.558408, -1.264105, -1.931454, 1, 0.3490196, 0, 1,
-1.550003, 0.7490951, -2.919617, 1, 0.3529412, 0, 1,
-1.547248, -0.7021019, -3.43811, 1, 0.3607843, 0, 1,
-1.532371, 0.04853019, -3.11178, 1, 0.3647059, 0, 1,
-1.511585, 0.3669046, -2.884069, 1, 0.372549, 0, 1,
-1.5066, 0.3933626, -1.959991, 1, 0.3764706, 0, 1,
-1.506597, -2.094795, -3.402203, 1, 0.3843137, 0, 1,
-1.5007, 0.5757201, -2.063325, 1, 0.3882353, 0, 1,
-1.494408, 0.06722201, -2.797771, 1, 0.3960784, 0, 1,
-1.490999, 0.3998067, -2.946374, 1, 0.4039216, 0, 1,
-1.489089, 0.8234856, -1.083988, 1, 0.4078431, 0, 1,
-1.487089, 0.2718626, -2.659509, 1, 0.4156863, 0, 1,
-1.48536, -0.3506966, -1.249531, 1, 0.4196078, 0, 1,
-1.461842, -0.02108524, -1.340465, 1, 0.427451, 0, 1,
-1.457839, 0.3038476, -0.7891203, 1, 0.4313726, 0, 1,
-1.455871, 0.03848298, -0.1735279, 1, 0.4392157, 0, 1,
-1.453397, -0.9829106, -0.3659998, 1, 0.4431373, 0, 1,
-1.450057, -0.1457938, -1.282915, 1, 0.4509804, 0, 1,
-1.447163, -0.471966, -2.985256, 1, 0.454902, 0, 1,
-1.445794, 0.7514011, -1.095754, 1, 0.4627451, 0, 1,
-1.445151, -1.265819, -3.247705, 1, 0.4666667, 0, 1,
-1.438111, -0.3608513, -1.919214, 1, 0.4745098, 0, 1,
-1.429884, -0.9936854, -1.781581, 1, 0.4784314, 0, 1,
-1.429772, -0.7134011, -1.14615, 1, 0.4862745, 0, 1,
-1.426322, 1.727721, -1.495141, 1, 0.4901961, 0, 1,
-1.421854, 0.6080175, -2.666798, 1, 0.4980392, 0, 1,
-1.408153, 1.347394, -1.198888, 1, 0.5058824, 0, 1,
-1.396373, -0.0881286, -0.3236254, 1, 0.509804, 0, 1,
-1.395834, -2.466053, -3.338919, 1, 0.5176471, 0, 1,
-1.39336, -0.2321067, -2.096152, 1, 0.5215687, 0, 1,
-1.384258, -0.3831262, -3.257184, 1, 0.5294118, 0, 1,
-1.381069, -1.074985, -3.16843, 1, 0.5333334, 0, 1,
-1.376027, 0.06813189, -2.962123, 1, 0.5411765, 0, 1,
-1.373632, -0.6337064, -2.71856, 1, 0.5450981, 0, 1,
-1.364266, -0.2473307, -0.537163, 1, 0.5529412, 0, 1,
-1.353463, -0.3827448, -2.249286, 1, 0.5568628, 0, 1,
-1.353018, 0.7171044, -0.8733406, 1, 0.5647059, 0, 1,
-1.348943, 1.434992, -1.189335, 1, 0.5686275, 0, 1,
-1.347566, -1.323805, -2.680525, 1, 0.5764706, 0, 1,
-1.340044, -0.3218226, -2.342144, 1, 0.5803922, 0, 1,
-1.339947, 0.8261737, -1.110631, 1, 0.5882353, 0, 1,
-1.331109, -0.1306656, -2.134049, 1, 0.5921569, 0, 1,
-1.322558, -0.5265871, -2.277369, 1, 0.6, 0, 1,
-1.32213, -0.02196054, -2.262337, 1, 0.6078432, 0, 1,
-1.312948, 0.7993886, 0.4800105, 1, 0.6117647, 0, 1,
-1.307549, 2.24957, -0.9496478, 1, 0.6196079, 0, 1,
-1.292012, -0.08234309, -0.2465665, 1, 0.6235294, 0, 1,
-1.281525, -0.8693771, -0.6173472, 1, 0.6313726, 0, 1,
-1.28022, 1.013233, -0.8975145, 1, 0.6352941, 0, 1,
-1.27515, -0.7878091, -2.221578, 1, 0.6431373, 0, 1,
-1.273112, -0.389645, -1.030124, 1, 0.6470588, 0, 1,
-1.273105, -3.004334, -5.317602, 1, 0.654902, 0, 1,
-1.257971, -0.1499338, -0.9547403, 1, 0.6588235, 0, 1,
-1.254433, 0.162366, -0.3903119, 1, 0.6666667, 0, 1,
-1.250409, -1.537054, -3.044649, 1, 0.6705883, 0, 1,
-1.241141, 1.41745, -0.7241502, 1, 0.6784314, 0, 1,
-1.233062, 0.826552, -2.69051, 1, 0.682353, 0, 1,
-1.227915, -0.6058215, -1.812339, 1, 0.6901961, 0, 1,
-1.227735, -0.3686541, -2.339771, 1, 0.6941177, 0, 1,
-1.219226, -0.6952011, -2.344308, 1, 0.7019608, 0, 1,
-1.216369, -0.2615918, -1.265875, 1, 0.7098039, 0, 1,
-1.213939, 0.5119073, 0.1312544, 1, 0.7137255, 0, 1,
-1.210657, -0.2287379, -2.113062, 1, 0.7215686, 0, 1,
-1.198683, 1.462589, -1.593945, 1, 0.7254902, 0, 1,
-1.197166, 1.27622, 1.217147, 1, 0.7333333, 0, 1,
-1.185454, 0.6040671, -0.009299949, 1, 0.7372549, 0, 1,
-1.170934, -0.1649514, -2.303392, 1, 0.7450981, 0, 1,
-1.170332, 0.05585549, -1.915237, 1, 0.7490196, 0, 1,
-1.15986, -1.208202, -2.427684, 1, 0.7568628, 0, 1,
-1.157316, 1.060108, -1.020688, 1, 0.7607843, 0, 1,
-1.150743, 0.1807697, -1.102353, 1, 0.7686275, 0, 1,
-1.149693, 1.536201, 0.004666192, 1, 0.772549, 0, 1,
-1.13174, -1.422114, -3.113209, 1, 0.7803922, 0, 1,
-1.129682, -0.5116576, -1.688133, 1, 0.7843137, 0, 1,
-1.126185, 2.033143, -1.038859, 1, 0.7921569, 0, 1,
-1.120022, 0.9420093, 0.2127691, 1, 0.7960784, 0, 1,
-1.117086, 0.1345437, -3.191552, 1, 0.8039216, 0, 1,
-1.114935, 0.3141547, -0.09787272, 1, 0.8117647, 0, 1,
-1.106497, -0.5094613, -1.831027, 1, 0.8156863, 0, 1,
-1.101719, 0.4287604, -0.8827574, 1, 0.8235294, 0, 1,
-1.094437, -1.008814, -0.2064189, 1, 0.827451, 0, 1,
-1.081148, 0.6088378, -4.740372, 1, 0.8352941, 0, 1,
-1.078931, 0.3429671, 0.1966165, 1, 0.8392157, 0, 1,
-1.07372, -1.59931, -2.497406, 1, 0.8470588, 0, 1,
-1.071306, -0.7894603, -2.102884, 1, 0.8509804, 0, 1,
-1.06702, -0.6379865, -0.3402915, 1, 0.8588235, 0, 1,
-1.060066, -0.8379431, -3.813435, 1, 0.8627451, 0, 1,
-1.055116, -1.122622, -1.514399, 1, 0.8705882, 0, 1,
-1.053311, -0.3241937, -2.349608, 1, 0.8745098, 0, 1,
-1.049528, 1.446432, -0.4595983, 1, 0.8823529, 0, 1,
-1.048482, -0.09762909, -1.875059, 1, 0.8862745, 0, 1,
-1.047392, -0.06082029, 0.1188239, 1, 0.8941177, 0, 1,
-1.046948, -0.4161497, -1.040802, 1, 0.8980392, 0, 1,
-1.043947, 0.4856806, 0.7602941, 1, 0.9058824, 0, 1,
-1.042387, 0.6568316, -0.5960727, 1, 0.9137255, 0, 1,
-1.039314, -0.00506368, -2.425515, 1, 0.9176471, 0, 1,
-1.029285, 1.374318, -0.2342094, 1, 0.9254902, 0, 1,
-1.029242, -0.4361348, -0.6170769, 1, 0.9294118, 0, 1,
-1.024579, -1.129851, -2.100933, 1, 0.9372549, 0, 1,
-1.02283, -1.333158, -3.732124, 1, 0.9411765, 0, 1,
-1.01667, -0.2097134, -1.064913, 1, 0.9490196, 0, 1,
-1.009584, -0.6413127, -1.384889, 1, 0.9529412, 0, 1,
-1.005839, -0.09247198, -1.362068, 1, 0.9607843, 0, 1,
-0.9982732, 1.01747, -0.9195955, 1, 0.9647059, 0, 1,
-0.9946629, -0.4382989, -2.721181, 1, 0.972549, 0, 1,
-0.9916632, 2.46043, -1.132688, 1, 0.9764706, 0, 1,
-0.9899338, 2.572988, 0.616642, 1, 0.9843137, 0, 1,
-0.9897491, 1.081502, 0.1642514, 1, 0.9882353, 0, 1,
-0.9877967, 0.6832007, -1.193737, 1, 0.9960784, 0, 1,
-0.9831721, 0.06606126, -2.403606, 0.9960784, 1, 0, 1,
-0.9800041, -0.3751099, -1.040168, 0.9921569, 1, 0, 1,
-0.9726073, 1.004814, -0.3011851, 0.9843137, 1, 0, 1,
-0.9696653, -0.2884719, -2.81224, 0.9803922, 1, 0, 1,
-0.9654961, 0.6390627, -1.840859, 0.972549, 1, 0, 1,
-0.9652307, -1.437902, -1.590981, 0.9686275, 1, 0, 1,
-0.9560083, -1.011721, -2.408688, 0.9607843, 1, 0, 1,
-0.9554247, -0.6418342, -0.2179535, 0.9568627, 1, 0, 1,
-0.9547973, 0.7776639, -0.9837815, 0.9490196, 1, 0, 1,
-0.9525421, 0.5340036, -0.9671665, 0.945098, 1, 0, 1,
-0.9516401, 0.4859942, -1.687865, 0.9372549, 1, 0, 1,
-0.9444768, 0.7234858, -1.196806, 0.9333333, 1, 0, 1,
-0.9394723, -1.283396, -1.70474, 0.9254902, 1, 0, 1,
-0.9380849, 0.6414585, -4.45534, 0.9215686, 1, 0, 1,
-0.9359249, -0.7127542, -0.4750843, 0.9137255, 1, 0, 1,
-0.9267811, -1.008027, -2.982534, 0.9098039, 1, 0, 1,
-0.9202276, -0.1425823, -0.9941963, 0.9019608, 1, 0, 1,
-0.9196379, 1.155722, -1.480516, 0.8941177, 1, 0, 1,
-0.9120806, -0.03602809, -1.539017, 0.8901961, 1, 0, 1,
-0.9089221, -0.5475102, -2.821178, 0.8823529, 1, 0, 1,
-0.9074777, -0.8330521, -2.506467, 0.8784314, 1, 0, 1,
-0.9055645, -0.7800072, -2.366344, 0.8705882, 1, 0, 1,
-0.902438, 1.826123, -1.187877, 0.8666667, 1, 0, 1,
-0.9021188, -0.3166229, 0.02274601, 0.8588235, 1, 0, 1,
-0.9009658, 0.02689847, -0.9679191, 0.854902, 1, 0, 1,
-0.8979833, 0.6171131, -1.535653, 0.8470588, 1, 0, 1,
-0.8960493, -1.428942, -2.64037, 0.8431373, 1, 0, 1,
-0.8955541, -0.8256961, -1.711893, 0.8352941, 1, 0, 1,
-0.8952009, 1.035961, -2.79034, 0.8313726, 1, 0, 1,
-0.8947218, -0.1907831, -3.444463, 0.8235294, 1, 0, 1,
-0.8886257, 1.517839, -0.9241493, 0.8196079, 1, 0, 1,
-0.8835122, 1.442987, 0.283518, 0.8117647, 1, 0, 1,
-0.8830886, 1.439723, -0.1413376, 0.8078431, 1, 0, 1,
-0.8715808, -0.6493384, -3.325942, 0.8, 1, 0, 1,
-0.8690872, -1.355143, -2.044699, 0.7921569, 1, 0, 1,
-0.8537114, 0.08236872, 0.2984753, 0.7882353, 1, 0, 1,
-0.852192, 0.2862465, -1.408393, 0.7803922, 1, 0, 1,
-0.8501524, 1.397327, 0.1453702, 0.7764706, 1, 0, 1,
-0.8401719, -0.6265523, -1.119724, 0.7686275, 1, 0, 1,
-0.8371254, 0.5093403, -0.4550211, 0.7647059, 1, 0, 1,
-0.8322612, -0.9121485, -3.43014, 0.7568628, 1, 0, 1,
-0.8301519, -0.07636415, -1.955179, 0.7529412, 1, 0, 1,
-0.828439, 0.1583527, -0.686296, 0.7450981, 1, 0, 1,
-0.8266595, -1.016154, -1.656883, 0.7411765, 1, 0, 1,
-0.826337, 0.3763351, -1.621347, 0.7333333, 1, 0, 1,
-0.8258479, 0.7075214, -0.4473161, 0.7294118, 1, 0, 1,
-0.8188244, 0.2953216, -2.460515, 0.7215686, 1, 0, 1,
-0.8055135, -0.625614, -3.536236, 0.7176471, 1, 0, 1,
-0.8012893, -1.728708, -3.862533, 0.7098039, 1, 0, 1,
-0.7901342, -0.04421571, -0.8536877, 0.7058824, 1, 0, 1,
-0.7817876, 0.9806355, -1.374982, 0.6980392, 1, 0, 1,
-0.7812778, 1.879721, -2.225543, 0.6901961, 1, 0, 1,
-0.7789746, -1.246731, -1.5019, 0.6862745, 1, 0, 1,
-0.7752604, -0.8946286, -2.858169, 0.6784314, 1, 0, 1,
-0.7738083, -0.4584333, -2.823287, 0.6745098, 1, 0, 1,
-0.7626148, -0.5616248, -1.908103, 0.6666667, 1, 0, 1,
-0.7610627, -0.7024485, -2.034524, 0.6627451, 1, 0, 1,
-0.7598889, -0.1048763, -2.268705, 0.654902, 1, 0, 1,
-0.7594933, -0.696933, -2.162719, 0.6509804, 1, 0, 1,
-0.7520781, 1.56182, -1.10799, 0.6431373, 1, 0, 1,
-0.7447886, 0.1100498, 0.529925, 0.6392157, 1, 0, 1,
-0.7437937, 1.12578, -0.4282684, 0.6313726, 1, 0, 1,
-0.7413071, 0.07610139, -0.348971, 0.627451, 1, 0, 1,
-0.7390506, 0.4430238, -0.6551037, 0.6196079, 1, 0, 1,
-0.7341904, 0.7598304, -1.893047, 0.6156863, 1, 0, 1,
-0.7270624, -1.526488, -5.255986, 0.6078432, 1, 0, 1,
-0.7254015, 0.1173487, -0.2502935, 0.6039216, 1, 0, 1,
-0.7246206, 0.4717259, -0.3810845, 0.5960785, 1, 0, 1,
-0.7168239, 0.8500763, -0.6460165, 0.5882353, 1, 0, 1,
-0.7139609, 0.2060716, -3.138144, 0.5843138, 1, 0, 1,
-0.7103001, 1.933094, 1.228915, 0.5764706, 1, 0, 1,
-0.7093717, -0.2736047, -2.883239, 0.572549, 1, 0, 1,
-0.7076134, 0.7795107, 0.9663822, 0.5647059, 1, 0, 1,
-0.7067428, -0.9832152, -3.079388, 0.5607843, 1, 0, 1,
-0.7057762, 0.7509996, 0.2377271, 0.5529412, 1, 0, 1,
-0.6990729, 1.020838, -1.383714, 0.5490196, 1, 0, 1,
-0.6933063, -0.0697305, -0.977017, 0.5411765, 1, 0, 1,
-0.6927125, 0.17269, -1.856516, 0.5372549, 1, 0, 1,
-0.6914813, 0.03908178, -2.185208, 0.5294118, 1, 0, 1,
-0.6812663, -1.265443, -2.953766, 0.5254902, 1, 0, 1,
-0.6784468, -2.421952, -3.385954, 0.5176471, 1, 0, 1,
-0.6685209, 0.1937327, -2.658653, 0.5137255, 1, 0, 1,
-0.6660466, 0.2460198, -2.91848, 0.5058824, 1, 0, 1,
-0.6643474, -0.02108715, -2.652524, 0.5019608, 1, 0, 1,
-0.6605881, 0.1858505, -0.007111122, 0.4941176, 1, 0, 1,
-0.6573837, 1.092206, -1.120857, 0.4862745, 1, 0, 1,
-0.6562023, 0.4965242, -1.113373, 0.4823529, 1, 0, 1,
-0.6506825, 0.0489215, -1.731254, 0.4745098, 1, 0, 1,
-0.6487869, 1.336343, -0.5113859, 0.4705882, 1, 0, 1,
-0.6446559, 0.3397564, -1.571174, 0.4627451, 1, 0, 1,
-0.641337, -0.3379234, -2.164511, 0.4588235, 1, 0, 1,
-0.6343341, -1.931362, -3.174625, 0.4509804, 1, 0, 1,
-0.6273995, 0.2121746, -1.651598, 0.4470588, 1, 0, 1,
-0.6247694, -0.9061648, -3.140805, 0.4392157, 1, 0, 1,
-0.6228049, 0.2700446, -1.872409, 0.4352941, 1, 0, 1,
-0.6205025, 0.8326488, -1.413905, 0.427451, 1, 0, 1,
-0.6191501, 0.5695142, -0.1851421, 0.4235294, 1, 0, 1,
-0.6186697, -1.767883, -0.9780656, 0.4156863, 1, 0, 1,
-0.6180527, -1.339179, -2.791944, 0.4117647, 1, 0, 1,
-0.6172819, 1.743726, -1.129827, 0.4039216, 1, 0, 1,
-0.6168406, -0.1930844, -3.374333, 0.3960784, 1, 0, 1,
-0.6089651, 0.7341608, -0.7673447, 0.3921569, 1, 0, 1,
-0.6057947, 1.153295, -1.99946, 0.3843137, 1, 0, 1,
-0.6055425, -0.8077096, -2.849447, 0.3803922, 1, 0, 1,
-0.6032967, 0.06364158, -3.621082, 0.372549, 1, 0, 1,
-0.6007197, -0.6514302, -0.08351918, 0.3686275, 1, 0, 1,
-0.5989851, 0.3162321, -1.302142, 0.3607843, 1, 0, 1,
-0.5970381, -0.4866005, -2.699464, 0.3568628, 1, 0, 1,
-0.5918261, 0.2585565, -2.801574, 0.3490196, 1, 0, 1,
-0.5830405, -0.393975, -2.166576, 0.345098, 1, 0, 1,
-0.5829805, 1.005339, -2.407693, 0.3372549, 1, 0, 1,
-0.5823925, 0.4536028, -1.802148, 0.3333333, 1, 0, 1,
-0.5821041, 1.16223, 0.0005923384, 0.3254902, 1, 0, 1,
-0.5808529, -0.6049718, -4.309304, 0.3215686, 1, 0, 1,
-0.5789278, 0.8649269, -0.2654916, 0.3137255, 1, 0, 1,
-0.5768551, 0.1451906, -1.534182, 0.3098039, 1, 0, 1,
-0.5646783, -0.9276006, -2.969798, 0.3019608, 1, 0, 1,
-0.5596579, -0.4424324, -3.154753, 0.2941177, 1, 0, 1,
-0.558573, 0.9155025, -0.8760261, 0.2901961, 1, 0, 1,
-0.5556769, 0.6223374, -1.245542, 0.282353, 1, 0, 1,
-0.5495334, -1.527388, -2.737711, 0.2784314, 1, 0, 1,
-0.548972, -0.0500297, -2.782389, 0.2705882, 1, 0, 1,
-0.5474285, -0.1857527, -1.571663, 0.2666667, 1, 0, 1,
-0.5383934, -1.289715, -2.754464, 0.2588235, 1, 0, 1,
-0.533594, 0.7079368, -0.8765427, 0.254902, 1, 0, 1,
-0.5308442, -0.3643827, -4.472987, 0.2470588, 1, 0, 1,
-0.5128097, -0.2988926, -1.829472, 0.2431373, 1, 0, 1,
-0.5109537, 0.6573963, -1.036657, 0.2352941, 1, 0, 1,
-0.5094109, -0.7353338, -4.234951, 0.2313726, 1, 0, 1,
-0.5084749, 0.3188563, -1.245693, 0.2235294, 1, 0, 1,
-0.5071766, -0.08120604, -1.604023, 0.2196078, 1, 0, 1,
-0.504587, 2.184655, -0.5909081, 0.2117647, 1, 0, 1,
-0.503889, -1.166319, -1.682226, 0.2078431, 1, 0, 1,
-0.4988535, -1.735968, -5.057125, 0.2, 1, 0, 1,
-0.4969223, -0.2352932, -2.990937, 0.1921569, 1, 0, 1,
-0.4935374, 0.6591703, -1.505501, 0.1882353, 1, 0, 1,
-0.4918799, -3.003262, -3.915111, 0.1803922, 1, 0, 1,
-0.488167, -1.906859, -4.143477, 0.1764706, 1, 0, 1,
-0.4879433, -0.4900277, -3.434501, 0.1686275, 1, 0, 1,
-0.4862839, -0.3375096, -0.7602455, 0.1647059, 1, 0, 1,
-0.4835433, 0.05355557, -1.663109, 0.1568628, 1, 0, 1,
-0.4777192, 0.3455167, -0.3372157, 0.1529412, 1, 0, 1,
-0.4768772, 1.540458, -0.6226065, 0.145098, 1, 0, 1,
-0.4763718, -0.2014465, -4.573922, 0.1411765, 1, 0, 1,
-0.4727302, -0.06211779, -4.367251, 0.1333333, 1, 0, 1,
-0.4715447, 0.2111794, 0.5007807, 0.1294118, 1, 0, 1,
-0.4670133, 0.665845, 0.09146167, 0.1215686, 1, 0, 1,
-0.4666114, 0.7854561, 0.07049302, 0.1176471, 1, 0, 1,
-0.4662764, -0.6568558, -4.157366, 0.1098039, 1, 0, 1,
-0.4659555, -1.70444, -1.704023, 0.1058824, 1, 0, 1,
-0.4649313, -0.6067029, -1.906544, 0.09803922, 1, 0, 1,
-0.4647072, 1.157579, -1.159086, 0.09019608, 1, 0, 1,
-0.4632222, 0.8400838, -0.6864225, 0.08627451, 1, 0, 1,
-0.4603309, 1.655172, -1.268155, 0.07843138, 1, 0, 1,
-0.4554067, -1.322078, -5.283192, 0.07450981, 1, 0, 1,
-0.4544816, -2.858007, -2.308257, 0.06666667, 1, 0, 1,
-0.4540168, -0.6114701, -2.149376, 0.0627451, 1, 0, 1,
-0.4537885, 0.1458999, -3.413286, 0.05490196, 1, 0, 1,
-0.4491212, -0.4481733, -3.379802, 0.05098039, 1, 0, 1,
-0.4438546, 2.645467, -0.7663618, 0.04313726, 1, 0, 1,
-0.4412939, 0.139878, -1.849842, 0.03921569, 1, 0, 1,
-0.4412869, 0.1474762, -0.887375, 0.03137255, 1, 0, 1,
-0.4367651, -0.1854438, -2.570349, 0.02745098, 1, 0, 1,
-0.434713, 1.409121, 0.9938163, 0.01960784, 1, 0, 1,
-0.4299972, -1.371284, -3.820231, 0.01568628, 1, 0, 1,
-0.4261845, 0.2469854, -0.4806247, 0.007843138, 1, 0, 1,
-0.4242977, 0.5163579, -2.159995, 0.003921569, 1, 0, 1,
-0.4141184, 1.059386, -1.491682, 0, 1, 0.003921569, 1,
-0.4101305, -0.9423414, -0.9026103, 0, 1, 0.01176471, 1,
-0.4080612, -1.547742, -3.721364, 0, 1, 0.01568628, 1,
-0.4031934, -0.6856892, -2.8518, 0, 1, 0.02352941, 1,
-0.397915, -1.273191, -2.829372, 0, 1, 0.02745098, 1,
-0.3960962, 0.2638715, -0.7481701, 0, 1, 0.03529412, 1,
-0.3960845, -1.174417, -3.233322, 0, 1, 0.03921569, 1,
-0.3929717, -1.586682, -3.181216, 0, 1, 0.04705882, 1,
-0.3871419, -1.0276, -2.777739, 0, 1, 0.05098039, 1,
-0.3861021, 1.135257, 1.738586, 0, 1, 0.05882353, 1,
-0.3824714, -1.550572, -3.757448, 0, 1, 0.0627451, 1,
-0.3758479, -0.1836223, 0.1302209, 0, 1, 0.07058824, 1,
-0.3722298, -0.07566506, -1.269341, 0, 1, 0.07450981, 1,
-0.3717183, -1.074554, -1.738505, 0, 1, 0.08235294, 1,
-0.3696728, 1.071104, -1.718356, 0, 1, 0.08627451, 1,
-0.3668653, -1.328764, -3.642311, 0, 1, 0.09411765, 1,
-0.3654196, -0.8790041, -3.0481, 0, 1, 0.1019608, 1,
-0.3647726, -0.795287, -2.745281, 0, 1, 0.1058824, 1,
-0.3627899, 0.6769355, 1.396186, 0, 1, 0.1137255, 1,
-0.3621989, -0.07311461, -0.09723794, 0, 1, 0.1176471, 1,
-0.354153, 1.061031, -0.3275161, 0, 1, 0.1254902, 1,
-0.3530042, 0.4801562, 0.6407534, 0, 1, 0.1294118, 1,
-0.3523072, -0.1274432, -2.443573, 0, 1, 0.1372549, 1,
-0.3490257, -0.8235354, -4.436369, 0, 1, 0.1411765, 1,
-0.3487382, -0.9443686, -2.499171, 0, 1, 0.1490196, 1,
-0.3471381, 0.3041574, 0.2535283, 0, 1, 0.1529412, 1,
-0.3454432, 0.7403292, -0.639587, 0, 1, 0.1607843, 1,
-0.3453408, 1.383454, -0.8208212, 0, 1, 0.1647059, 1,
-0.3383554, -0.6197423, -2.199049, 0, 1, 0.172549, 1,
-0.3365852, 2.804189, -0.5079595, 0, 1, 0.1764706, 1,
-0.3341676, -1.618414, -4.312908, 0, 1, 0.1843137, 1,
-0.3258872, -0.1427705, -1.934313, 0, 1, 0.1882353, 1,
-0.3228552, -0.7399081, -3.178853, 0, 1, 0.1960784, 1,
-0.3213181, 0.3426377, -0.2768478, 0, 1, 0.2039216, 1,
-0.3193826, 0.4982049, -0.6176867, 0, 1, 0.2078431, 1,
-0.309657, 1.151422, -1.97698, 0, 1, 0.2156863, 1,
-0.3086267, 0.243773, -1.980594, 0, 1, 0.2196078, 1,
-0.3024778, -1.718818, -2.552123, 0, 1, 0.227451, 1,
-0.2940673, -0.1885834, 0.3526534, 0, 1, 0.2313726, 1,
-0.2932528, -1.21831, -1.680508, 0, 1, 0.2392157, 1,
-0.2881098, -0.7476758, -3.833833, 0, 1, 0.2431373, 1,
-0.287724, -0.7099769, -2.461583, 0, 1, 0.2509804, 1,
-0.2844592, -1.045481, -3.737101, 0, 1, 0.254902, 1,
-0.2772498, -0.1674256, -0.679514, 0, 1, 0.2627451, 1,
-0.2695267, 0.4678357, -1.37992, 0, 1, 0.2666667, 1,
-0.2690168, -0.4430968, -0.4504961, 0, 1, 0.2745098, 1,
-0.2685785, -1.211747, -2.210357, 0, 1, 0.2784314, 1,
-0.2685426, 0.8591034, 0.6663961, 0, 1, 0.2862745, 1,
-0.2679728, -1.661623, -3.319655, 0, 1, 0.2901961, 1,
-0.2657691, 0.3378909, -0.5240021, 0, 1, 0.2980392, 1,
-0.2648947, 0.7212368, -2.166154, 0, 1, 0.3058824, 1,
-0.2614327, -0.590565, -2.029803, 0, 1, 0.3098039, 1,
-0.2605309, -1.797779, -3.642558, 0, 1, 0.3176471, 1,
-0.256512, -0.2164138, -1.93209, 0, 1, 0.3215686, 1,
-0.2549789, 1.098665, 0.6453415, 0, 1, 0.3294118, 1,
-0.2533097, 0.0220061, -1.886215, 0, 1, 0.3333333, 1,
-0.2530139, -1.077167, -2.219662, 0, 1, 0.3411765, 1,
-0.2501279, -0.2006595, -2.315133, 0, 1, 0.345098, 1,
-0.2489278, 0.7039607, 1.29698, 0, 1, 0.3529412, 1,
-0.2485884, -0.3535803, -1.302994, 0, 1, 0.3568628, 1,
-0.2473456, -1.159884, -4.135012, 0, 1, 0.3647059, 1,
-0.2472294, -0.4258526, -2.703511, 0, 1, 0.3686275, 1,
-0.2419242, 0.7074672, -0.4221426, 0, 1, 0.3764706, 1,
-0.2385822, -0.06303304, -2.281595, 0, 1, 0.3803922, 1,
-0.2370213, -0.3808395, -3.309153, 0, 1, 0.3882353, 1,
-0.2367197, -0.3564132, -3.095744, 0, 1, 0.3921569, 1,
-0.2359158, 1.406513, -0.7212489, 0, 1, 0.4, 1,
-0.2336048, -0.8835077, -3.675263, 0, 1, 0.4078431, 1,
-0.2331883, -0.5141951, -1.618863, 0, 1, 0.4117647, 1,
-0.2331192, -1.311568, -3.657241, 0, 1, 0.4196078, 1,
-0.2330583, 0.86862, -0.9067692, 0, 1, 0.4235294, 1,
-0.2318578, 0.2370297, -1.531595, 0, 1, 0.4313726, 1,
-0.2314468, 0.2988648, -1.356264, 0, 1, 0.4352941, 1,
-0.2299645, 1.888117, 1.095479, 0, 1, 0.4431373, 1,
-0.2258495, 1.289215, -0.5096571, 0, 1, 0.4470588, 1,
-0.2179441, 0.5388991, -0.2319527, 0, 1, 0.454902, 1,
-0.2170946, -0.7439587, -3.164429, 0, 1, 0.4588235, 1,
-0.2166274, -1.267903, -3.501541, 0, 1, 0.4666667, 1,
-0.216403, -0.06718572, -2.192408, 0, 1, 0.4705882, 1,
-0.2162619, -0.8594458, -1.270977, 0, 1, 0.4784314, 1,
-0.213781, -0.7821489, -2.726805, 0, 1, 0.4823529, 1,
-0.2134023, -2.166005, -3.224587, 0, 1, 0.4901961, 1,
-0.2109445, -0.6801279, -2.921786, 0, 1, 0.4941176, 1,
-0.2065374, 0.5296626, -1.367769, 0, 1, 0.5019608, 1,
-0.205713, 0.9728276, 1.171606, 0, 1, 0.509804, 1,
-0.2052373, -0.6223075, -3.106219, 0, 1, 0.5137255, 1,
-0.2012533, 0.5616323, 0.4366109, 0, 1, 0.5215687, 1,
-0.1974733, -0.7179636, -4.568256, 0, 1, 0.5254902, 1,
-0.1957746, -0.8077316, -3.027592, 0, 1, 0.5333334, 1,
-0.1925931, -1.267323, -2.195603, 0, 1, 0.5372549, 1,
-0.1924149, 0.1070038, -0.3175131, 0, 1, 0.5450981, 1,
-0.182556, -0.2430269, -1.829667, 0, 1, 0.5490196, 1,
-0.1803326, -0.4071522, -5.362585, 0, 1, 0.5568628, 1,
-0.1801676, -0.1407931, -3.81756, 0, 1, 0.5607843, 1,
-0.1790922, -0.1882845, -1.567598, 0, 1, 0.5686275, 1,
-0.1764736, -0.5686756, -2.672511, 0, 1, 0.572549, 1,
-0.1733644, 0.06735647, -4.188511, 0, 1, 0.5803922, 1,
-0.1706035, -0.935684, -3.479537, 0, 1, 0.5843138, 1,
-0.1698129, -2.208781, -3.358099, 0, 1, 0.5921569, 1,
-0.1695811, -1.420147, -3.835, 0, 1, 0.5960785, 1,
-0.1657729, 0.6852846, 0.01000237, 0, 1, 0.6039216, 1,
-0.1648529, 0.9425071, -1.333117, 0, 1, 0.6117647, 1,
-0.1613916, 0.6029403, -1.972592, 0, 1, 0.6156863, 1,
-0.1611532, 0.2511158, 1.588809, 0, 1, 0.6235294, 1,
-0.1603327, 0.4992616, -1.279721, 0, 1, 0.627451, 1,
-0.1592719, -1.654828, -2.847071, 0, 1, 0.6352941, 1,
-0.1586103, 0.4989393, 0.5153821, 0, 1, 0.6392157, 1,
-0.1573563, 0.9304051, -0.6567752, 0, 1, 0.6470588, 1,
-0.1567898, 0.4210171, 0.1117125, 0, 1, 0.6509804, 1,
-0.1548761, -1.025048, -5.645555, 0, 1, 0.6588235, 1,
-0.1496704, 1.079299, -0.3615272, 0, 1, 0.6627451, 1,
-0.1486239, -0.6345143, -3.778849, 0, 1, 0.6705883, 1,
-0.1432762, -0.02394653, -2.243415, 0, 1, 0.6745098, 1,
-0.1429283, -0.7083352, -1.503746, 0, 1, 0.682353, 1,
-0.1408916, -1.106827, -2.153939, 0, 1, 0.6862745, 1,
-0.1404237, 0.5918852, 1.168912, 0, 1, 0.6941177, 1,
-0.1398698, 0.2191562, -2.863793, 0, 1, 0.7019608, 1,
-0.1396201, 0.5587907, 0.3050551, 0, 1, 0.7058824, 1,
-0.1394611, 1.39335, -0.007558077, 0, 1, 0.7137255, 1,
-0.1379638, 0.494956, -0.8232278, 0, 1, 0.7176471, 1,
-0.1365465, -0.5723894, -3.750463, 0, 1, 0.7254902, 1,
-0.1355797, 1.036384, 1.014816, 0, 1, 0.7294118, 1,
-0.1316152, -0.1396889, -3.664063, 0, 1, 0.7372549, 1,
-0.1289462, 1.134814, -0.455017, 0, 1, 0.7411765, 1,
-0.1272302, -0.8006876, -1.862555, 0, 1, 0.7490196, 1,
-0.1224995, -0.8160222, -2.070283, 0, 1, 0.7529412, 1,
-0.1211253, 0.6872512, 0.9877073, 0, 1, 0.7607843, 1,
-0.1165712, 2.000224, -1.538426, 0, 1, 0.7647059, 1,
-0.115364, -1.256354, -3.625658, 0, 1, 0.772549, 1,
-0.1142318, -0.687311, -5.464444, 0, 1, 0.7764706, 1,
-0.1115445, 1.351332, 0.5773133, 0, 1, 0.7843137, 1,
-0.1105108, 0.752663, 2.133334, 0, 1, 0.7882353, 1,
-0.1095123, -0.1497281, -2.340386, 0, 1, 0.7960784, 1,
-0.1084253, 0.4948638, 0.2948728, 0, 1, 0.8039216, 1,
-0.1074572, 3.20564, 0.423587, 0, 1, 0.8078431, 1,
-0.1006642, -0.9783576, -2.737, 0, 1, 0.8156863, 1,
-0.1002799, 0.8074468, 0.6617394, 0, 1, 0.8196079, 1,
-0.09997719, 0.596675, -0.6938419, 0, 1, 0.827451, 1,
-0.09759381, -0.9311391, -4.812274, 0, 1, 0.8313726, 1,
-0.09722365, 0.3701056, 0.7529899, 0, 1, 0.8392157, 1,
-0.09347823, -0.09598339, -2.492682, 0, 1, 0.8431373, 1,
-0.09099253, -0.5912019, -2.510072, 0, 1, 0.8509804, 1,
-0.09047622, -0.07573462, -1.693678, 0, 1, 0.854902, 1,
-0.07713301, 1.637339, -0.5964895, 0, 1, 0.8627451, 1,
-0.0686595, -0.7825234, -3.089354, 0, 1, 0.8666667, 1,
-0.06752116, -2.681831, -3.603766, 0, 1, 0.8745098, 1,
-0.06279332, -0.09975252, -0.7004709, 0, 1, 0.8784314, 1,
-0.06070807, 0.2580769, -1.506378, 0, 1, 0.8862745, 1,
-0.05353811, 1.187017, 0.1851778, 0, 1, 0.8901961, 1,
-0.05328653, -0.3653358, -3.404785, 0, 1, 0.8980392, 1,
-0.04942721, 0.22737, -2.111917, 0, 1, 0.9058824, 1,
-0.04504685, 0.7074347, 0.4066036, 0, 1, 0.9098039, 1,
-0.03964349, 0.2109261, -0.8785167, 0, 1, 0.9176471, 1,
-0.03834331, 0.8372284, -1.371338, 0, 1, 0.9215686, 1,
-0.03753217, -0.7662332, -2.936668, 0, 1, 0.9294118, 1,
-0.03629058, 1.105426, 0.5472685, 0, 1, 0.9333333, 1,
-0.03390234, 0.01530929, -0.8516727, 0, 1, 0.9411765, 1,
-0.03280314, -0.4822739, -4.14392, 0, 1, 0.945098, 1,
-0.03046854, -0.8945492, -3.408285, 0, 1, 0.9529412, 1,
-0.02775173, -0.9686964, -0.30268, 0, 1, 0.9568627, 1,
-0.02689696, -0.8341664, -3.587704, 0, 1, 0.9647059, 1,
-0.02615233, 0.8057896, -0.6623293, 0, 1, 0.9686275, 1,
-0.02391405, 0.8825303, 0.9328398, 0, 1, 0.9764706, 1,
-0.02248161, -3.009988, -1.925634, 0, 1, 0.9803922, 1,
-0.02235674, -0.1040129, -2.775882, 0, 1, 0.9882353, 1,
-0.02159437, -1.609953, -3.279747, 0, 1, 0.9921569, 1,
-0.0208075, -0.6909435, -3.67189, 0, 1, 1, 1,
-0.01972772, -0.5625825, -2.858046, 0, 0.9921569, 1, 1,
-0.01752205, 1.188262, 1.35618, 0, 0.9882353, 1, 1,
-0.0174115, -0.02205782, -2.083246, 0, 0.9803922, 1, 1,
-0.01688846, 0.6147777, -0.2767445, 0, 0.9764706, 1, 1,
-0.01519311, 2.161129, 0.4990311, 0, 0.9686275, 1, 1,
-0.01279055, -1.30693, -5.580816, 0, 0.9647059, 1, 1,
-0.01129267, -1.419142, -6.10813, 0, 0.9568627, 1, 1,
-0.007810432, -0.4266777, -3.54152, 0, 0.9529412, 1, 1,
-0.007668134, -1.932554, -2.79319, 0, 0.945098, 1, 1,
-0.007572623, -1.690642, -2.364262, 0, 0.9411765, 1, 1,
-0.003880173, -0.9327557, -3.521376, 0, 0.9333333, 1, 1,
-0.002820619, -0.152824, -2.516075, 0, 0.9294118, 1, 1,
0.00575753, 0.4398915, -0.7416815, 0, 0.9215686, 1, 1,
0.00920057, -0.03103352, 2.407331, 0, 0.9176471, 1, 1,
0.01012741, -0.6764023, 2.491656, 0, 0.9098039, 1, 1,
0.01216132, 0.8321652, -0.3058483, 0, 0.9058824, 1, 1,
0.01282419, 0.8632478, 0.1237329, 0, 0.8980392, 1, 1,
0.01562612, -2.479118, 1.981402, 0, 0.8901961, 1, 1,
0.01600469, 0.1014518, 0.4736094, 0, 0.8862745, 1, 1,
0.0161743, 0.1958627, -1.207641, 0, 0.8784314, 1, 1,
0.03373794, 1.597315, 0.3447679, 0, 0.8745098, 1, 1,
0.03478638, 0.6049079, -0.641321, 0, 0.8666667, 1, 1,
0.03805029, -0.4718359, 2.871693, 0, 0.8627451, 1, 1,
0.0389181, -0.6668736, 3.743799, 0, 0.854902, 1, 1,
0.04510306, 0.31688, 1.347127, 0, 0.8509804, 1, 1,
0.04698037, -0.8026658, 2.769599, 0, 0.8431373, 1, 1,
0.05330545, 1.55127, -1.442936, 0, 0.8392157, 1, 1,
0.05657459, -0.3838756, 2.364311, 0, 0.8313726, 1, 1,
0.05683152, 1.967228, 0.4230347, 0, 0.827451, 1, 1,
0.05696126, -0.6104116, 0.9244406, 0, 0.8196079, 1, 1,
0.06149482, 3.795196, -0.9889148, 0, 0.8156863, 1, 1,
0.06161167, 1.030701, 0.6804731, 0, 0.8078431, 1, 1,
0.06291823, -0.05977586, 2.240043, 0, 0.8039216, 1, 1,
0.08869973, 0.6540192, 0.4799017, 0, 0.7960784, 1, 1,
0.0928595, -0.55304, 2.81279, 0, 0.7882353, 1, 1,
0.0939777, -0.02418599, 1.331324, 0, 0.7843137, 1, 1,
0.09415751, 0.06598561, 1.872436, 0, 0.7764706, 1, 1,
0.09480722, 0.8505797, 1.720216, 0, 0.772549, 1, 1,
0.09487917, 0.00377018, 3.344007, 0, 0.7647059, 1, 1,
0.09489385, -2.00207, 2.357048, 0, 0.7607843, 1, 1,
0.09795982, 0.8483405, -0.3872938, 0, 0.7529412, 1, 1,
0.09798253, -0.1463253, 2.61074, 0, 0.7490196, 1, 1,
0.09862955, 0.1158626, 0.1609391, 0, 0.7411765, 1, 1,
0.09949441, -0.09060967, 3.604699, 0, 0.7372549, 1, 1,
0.1031805, -1.458792, 3.523087, 0, 0.7294118, 1, 1,
0.104964, 0.009467643, 2.328895, 0, 0.7254902, 1, 1,
0.1050117, 1.123508, 0.6008745, 0, 0.7176471, 1, 1,
0.1096827, 0.4497686, 1.167853, 0, 0.7137255, 1, 1,
0.110919, -0.8164284, 1.440162, 0, 0.7058824, 1, 1,
0.1125057, 0.5359922, 0.7655831, 0, 0.6980392, 1, 1,
0.1128654, 0.1818538, 1.167961, 0, 0.6941177, 1, 1,
0.1157347, 0.3964165, 0.2264566, 0, 0.6862745, 1, 1,
0.1210294, 0.01407406, 2.865046, 0, 0.682353, 1, 1,
0.1215683, 0.4807467, 0.1407647, 0, 0.6745098, 1, 1,
0.1242513, -2.077853, 3.490648, 0, 0.6705883, 1, 1,
0.1268405, -1.657049, 2.676627, 0, 0.6627451, 1, 1,
0.1343706, 0.4742737, -0.6610663, 0, 0.6588235, 1, 1,
0.1408058, -0.4106925, 1.711552, 0, 0.6509804, 1, 1,
0.1416734, 0.1320841, 1.101639, 0, 0.6470588, 1, 1,
0.1436852, -0.2708902, 2.765596, 0, 0.6392157, 1, 1,
0.148297, 0.0553414, 0.298255, 0, 0.6352941, 1, 1,
0.1486861, 0.1183799, 0.9854794, 0, 0.627451, 1, 1,
0.1487633, 1.307767, 1.549491, 0, 0.6235294, 1, 1,
0.1527162, 0.6579363, -0.4534776, 0, 0.6156863, 1, 1,
0.1572029, -0.3079618, 2.146333, 0, 0.6117647, 1, 1,
0.1586523, -0.6066115, 1.525975, 0, 0.6039216, 1, 1,
0.1623198, 1.669785, 0.5434343, 0, 0.5960785, 1, 1,
0.16422, -1.246222, 3.507802, 0, 0.5921569, 1, 1,
0.1695378, -1.038512, 2.935245, 0, 0.5843138, 1, 1,
0.1704969, 0.3492661, 0.1724784, 0, 0.5803922, 1, 1,
0.174392, 0.7107497, 0.8030061, 0, 0.572549, 1, 1,
0.1752453, 0.4859309, -0.8403451, 0, 0.5686275, 1, 1,
0.1765174, 0.2663069, 1.266548, 0, 0.5607843, 1, 1,
0.1788721, -0.3827678, 2.770166, 0, 0.5568628, 1, 1,
0.1819772, 0.1404209, 0.3892822, 0, 0.5490196, 1, 1,
0.1880952, 0.5338858, 2.238328, 0, 0.5450981, 1, 1,
0.1904106, -0.4410697, 2.446345, 0, 0.5372549, 1, 1,
0.1936572, -0.447989, 3.588372, 0, 0.5333334, 1, 1,
0.2064747, -0.2545739, 3.003475, 0, 0.5254902, 1, 1,
0.2122331, -1.5634, 2.1061, 0, 0.5215687, 1, 1,
0.2129573, -0.6175935, 2.737617, 0, 0.5137255, 1, 1,
0.2133103, -1.414984, 3.219454, 0, 0.509804, 1, 1,
0.217097, -1.737997, 2.793576, 0, 0.5019608, 1, 1,
0.2180145, -0.2336914, 3.17698, 0, 0.4941176, 1, 1,
0.222572, -0.8259845, 4.429331, 0, 0.4901961, 1, 1,
0.2234672, -0.4991097, 3.287635, 0, 0.4823529, 1, 1,
0.2287196, -0.3061747, 1.916554, 0, 0.4784314, 1, 1,
0.2340687, -0.2057553, 2.670391, 0, 0.4705882, 1, 1,
0.23482, 0.1635778, 0.1010591, 0, 0.4666667, 1, 1,
0.2348364, 0.2502032, 1.7715, 0, 0.4588235, 1, 1,
0.2361075, 0.4835762, -0.8989628, 0, 0.454902, 1, 1,
0.2366294, -0.02055929, -1.189703, 0, 0.4470588, 1, 1,
0.2377407, -0.4915079, 2.300333, 0, 0.4431373, 1, 1,
0.2408772, -0.5985117, 0.3979553, 0, 0.4352941, 1, 1,
0.2440441, -2.164124, 0.9673663, 0, 0.4313726, 1, 1,
0.25686, 0.1069854, 1.548276, 0, 0.4235294, 1, 1,
0.2596328, 1.205722, 1.998867, 0, 0.4196078, 1, 1,
0.2634749, -1.325242, 4.281788, 0, 0.4117647, 1, 1,
0.2664214, 1.223064, 0.1285155, 0, 0.4078431, 1, 1,
0.2691416, -0.4250096, 1.177324, 0, 0.4, 1, 1,
0.2745508, -0.8546689, 3.064928, 0, 0.3921569, 1, 1,
0.2748835, 0.1459984, -0.1633004, 0, 0.3882353, 1, 1,
0.276555, 1.45485, 1.243353, 0, 0.3803922, 1, 1,
0.277983, -0.2559228, 2.404917, 0, 0.3764706, 1, 1,
0.2814194, 0.215587, 1.85173, 0, 0.3686275, 1, 1,
0.2823503, -1.542091, 5.935576, 0, 0.3647059, 1, 1,
0.2832141, 0.1259963, -0.1779269, 0, 0.3568628, 1, 1,
0.2876767, 0.5831996, 0.6274487, 0, 0.3529412, 1, 1,
0.2881431, 0.03822894, 2.467341, 0, 0.345098, 1, 1,
0.2913503, 1.229043, -1.467212, 0, 0.3411765, 1, 1,
0.2982538, 0.1578745, 1.392967, 0, 0.3333333, 1, 1,
0.2996158, 0.4765219, -0.2255402, 0, 0.3294118, 1, 1,
0.3047895, 0.000603664, 0.2670272, 0, 0.3215686, 1, 1,
0.3062592, -2.407694, 3.018187, 0, 0.3176471, 1, 1,
0.3071929, -1.254197, 1.719147, 0, 0.3098039, 1, 1,
0.3081183, 0.4443865, 1.285246, 0, 0.3058824, 1, 1,
0.3088221, -1.256088, 3.057557, 0, 0.2980392, 1, 1,
0.3107127, -0.6452933, 3.149983, 0, 0.2901961, 1, 1,
0.3107448, 1.638766, 1.075973, 0, 0.2862745, 1, 1,
0.3161967, -1.331345, 1.55791, 0, 0.2784314, 1, 1,
0.3164083, -0.3045037, 2.763424, 0, 0.2745098, 1, 1,
0.3170427, -1.095034, 2.207461, 0, 0.2666667, 1, 1,
0.3193974, -0.7265738, 2.513498, 0, 0.2627451, 1, 1,
0.320801, -0.8697875, 0.953676, 0, 0.254902, 1, 1,
0.3309929, -0.9581209, 3.26909, 0, 0.2509804, 1, 1,
0.3318273, 0.02478004, 1.051512, 0, 0.2431373, 1, 1,
0.3326623, -0.141476, 2.335671, 0, 0.2392157, 1, 1,
0.3343304, -0.4033423, 1.725381, 0, 0.2313726, 1, 1,
0.3359254, 1.232156, 0.676587, 0, 0.227451, 1, 1,
0.3364265, 0.131883, 1.119855, 0, 0.2196078, 1, 1,
0.3380406, -0.8131917, 2.611245, 0, 0.2156863, 1, 1,
0.3381965, 2.167391, -0.1694257, 0, 0.2078431, 1, 1,
0.33922, 1.611871, 0.3955046, 0, 0.2039216, 1, 1,
0.3406624, 0.1831548, -0.9924013, 0, 0.1960784, 1, 1,
0.3419692, -1.504461, 2.54552, 0, 0.1882353, 1, 1,
0.343028, 0.5264343, -1.138909, 0, 0.1843137, 1, 1,
0.3479122, -0.776702, 4.716557, 0, 0.1764706, 1, 1,
0.359304, -1.138852, 2.168632, 0, 0.172549, 1, 1,
0.3635913, -0.7215568, 1.458342, 0, 0.1647059, 1, 1,
0.3661827, 0.260471, 2.215108, 0, 0.1607843, 1, 1,
0.3750838, -1.952326, 4.683382, 0, 0.1529412, 1, 1,
0.3766397, 1.152301, -1.21177, 0, 0.1490196, 1, 1,
0.3782448, -0.9686685, 2.508684, 0, 0.1411765, 1, 1,
0.3786316, -0.8187157, 3.51556, 0, 0.1372549, 1, 1,
0.384034, -0.6802853, 1.898353, 0, 0.1294118, 1, 1,
0.3905865, -1.052149, 4.244837, 0, 0.1254902, 1, 1,
0.3941959, 1.537969, 0.7105494, 0, 0.1176471, 1, 1,
0.3943839, 1.106908, 1.655573, 0, 0.1137255, 1, 1,
0.3953506, 0.1988425, 0.9221232, 0, 0.1058824, 1, 1,
0.4027405, 0.4528474, -0.7470337, 0, 0.09803922, 1, 1,
0.4046923, 0.6799645, 1.425637, 0, 0.09411765, 1, 1,
0.4065717, 0.632552, 1.422452, 0, 0.08627451, 1, 1,
0.4134101, 0.5299497, 0.8472691, 0, 0.08235294, 1, 1,
0.4143144, 0.08012391, 2.568334, 0, 0.07450981, 1, 1,
0.4162565, -0.4636601, 1.665939, 0, 0.07058824, 1, 1,
0.4179004, -0.2043184, 2.520496, 0, 0.0627451, 1, 1,
0.4220723, -0.213681, 1.998073, 0, 0.05882353, 1, 1,
0.4231783, 1.6822, -0.1095777, 0, 0.05098039, 1, 1,
0.4236853, -0.4549376, 4.824551, 0, 0.04705882, 1, 1,
0.4243131, 1.749279, 0.3893759, 0, 0.03921569, 1, 1,
0.4273303, -0.7326459, 3.40328, 0, 0.03529412, 1, 1,
0.4290509, -0.7343829, 1.84241, 0, 0.02745098, 1, 1,
0.4362088, 0.7463253, 2.542871, 0, 0.02352941, 1, 1,
0.4378595, 0.4652412, -0.009944384, 0, 0.01568628, 1, 1,
0.4381893, -1.140799, 3.16365, 0, 0.01176471, 1, 1,
0.4405295, 2.207167, -1.299034, 0, 0.003921569, 1, 1,
0.4418362, -1.15687, 2.354664, 0.003921569, 0, 1, 1,
0.4474077, 0.240311, -0.342379, 0.007843138, 0, 1, 1,
0.4490569, 0.1644073, 1.524547, 0.01568628, 0, 1, 1,
0.4529172, 0.1833536, -1.380192, 0.01960784, 0, 1, 1,
0.4536872, 0.9202501, 0.4092719, 0.02745098, 0, 1, 1,
0.4606063, 0.2234432, 2.080956, 0.03137255, 0, 1, 1,
0.4660943, -0.862834, 2.554787, 0.03921569, 0, 1, 1,
0.4678843, 0.003415279, 1.50621, 0.04313726, 0, 1, 1,
0.4688206, -1.005957, 3.750533, 0.05098039, 0, 1, 1,
0.4695571, -0.0790397, 0.6928276, 0.05490196, 0, 1, 1,
0.4720512, -0.5604254, 2.049842, 0.0627451, 0, 1, 1,
0.4772617, -0.3651833, 2.410915, 0.06666667, 0, 1, 1,
0.4804866, 0.6436213, 0.03373025, 0.07450981, 0, 1, 1,
0.4805702, -0.6070423, 1.212913, 0.07843138, 0, 1, 1,
0.4826176, 1.740342, -0.2411168, 0.08627451, 0, 1, 1,
0.4846003, 0.8096952, -0.1283658, 0.09019608, 0, 1, 1,
0.4857659, -0.3531039, 0.8987189, 0.09803922, 0, 1, 1,
0.4858826, -0.09477098, 2.587236, 0.1058824, 0, 1, 1,
0.4891856, -0.7483727, 1.517638, 0.1098039, 0, 1, 1,
0.4914856, -0.3302442, 2.162086, 0.1176471, 0, 1, 1,
0.4966943, -0.005449049, 2.236031, 0.1215686, 0, 1, 1,
0.4992566, 0.1858929, 1.533685, 0.1294118, 0, 1, 1,
0.500872, -0.7317182, 3.6732, 0.1333333, 0, 1, 1,
0.503667, -1.691026, 3.786381, 0.1411765, 0, 1, 1,
0.5037103, 0.7243506, -2.255589, 0.145098, 0, 1, 1,
0.5050026, 0.1870279, 1.278676, 0.1529412, 0, 1, 1,
0.5083985, -1.20523, 3.512351, 0.1568628, 0, 1, 1,
0.5138795, 0.4497979, 2.231023, 0.1647059, 0, 1, 1,
0.5157794, -0.3343323, 1.935246, 0.1686275, 0, 1, 1,
0.5185164, -1.356169, 4.418805, 0.1764706, 0, 1, 1,
0.5206817, 0.27441, 1.533208, 0.1803922, 0, 1, 1,
0.5225415, -0.08415665, 1.364197, 0.1882353, 0, 1, 1,
0.5270566, 0.1009916, 0.2381137, 0.1921569, 0, 1, 1,
0.5294349, -0.03382455, 1.298837, 0.2, 0, 1, 1,
0.5295579, -0.03750908, 1.759091, 0.2078431, 0, 1, 1,
0.5311642, -1.503746, 1.562175, 0.2117647, 0, 1, 1,
0.5336593, -0.2431048, 2.538435, 0.2196078, 0, 1, 1,
0.53368, -1.003027, 0.7419807, 0.2235294, 0, 1, 1,
0.5338315, -0.9017369, 1.727329, 0.2313726, 0, 1, 1,
0.535831, 2.096842, 0.8363617, 0.2352941, 0, 1, 1,
0.5413716, 0.8776863, 1.045025, 0.2431373, 0, 1, 1,
0.542191, 0.9948769, -0.8856429, 0.2470588, 0, 1, 1,
0.5425286, -0.7300279, 1.567963, 0.254902, 0, 1, 1,
0.5454829, -0.6478615, 2.429702, 0.2588235, 0, 1, 1,
0.5455964, 1.978058, 0.4792223, 0.2666667, 0, 1, 1,
0.5465266, 1.018369, 0.7522932, 0.2705882, 0, 1, 1,
0.5514053, 0.6744636, 0.452392, 0.2784314, 0, 1, 1,
0.5538707, -2.439981, 2.644398, 0.282353, 0, 1, 1,
0.5553948, 1.046857, 0.6632221, 0.2901961, 0, 1, 1,
0.5618817, -0.6094675, 1.986828, 0.2941177, 0, 1, 1,
0.562479, -1.139448, 2.317068, 0.3019608, 0, 1, 1,
0.5645429, 0.4722397, -0.1517068, 0.3098039, 0, 1, 1,
0.5724249, -2.093911, 1.860186, 0.3137255, 0, 1, 1,
0.5734391, -0.9221746, 3.383312, 0.3215686, 0, 1, 1,
0.5759255, 2.337551, 1.022625, 0.3254902, 0, 1, 1,
0.5780498, 0.371452, 0.839414, 0.3333333, 0, 1, 1,
0.5792799, -1.627897, 1.167134, 0.3372549, 0, 1, 1,
0.5839611, -1.688232, 3.753499, 0.345098, 0, 1, 1,
0.589168, 0.494605, 0.2734007, 0.3490196, 0, 1, 1,
0.5934256, -0.8435327, 3.499988, 0.3568628, 0, 1, 1,
0.5934908, 0.06420127, 2.882516, 0.3607843, 0, 1, 1,
0.5964315, -1.400828, 2.686748, 0.3686275, 0, 1, 1,
0.6010269, -0.6685807, 2.854314, 0.372549, 0, 1, 1,
0.6011702, 1.303276, -0.638226, 0.3803922, 0, 1, 1,
0.604392, -1.253628, 2.506123, 0.3843137, 0, 1, 1,
0.6053815, 0.06904745, 0.8375289, 0.3921569, 0, 1, 1,
0.6054043, 0.189527, 1.104118, 0.3960784, 0, 1, 1,
0.6054711, -0.06462162, 1.591693, 0.4039216, 0, 1, 1,
0.6055672, -0.4740708, 2.008179, 0.4117647, 0, 1, 1,
0.6067101, 0.1060972, 2.240248, 0.4156863, 0, 1, 1,
0.6096249, 0.04374303, 0.9205475, 0.4235294, 0, 1, 1,
0.6107975, -0.2727361, 2.120642, 0.427451, 0, 1, 1,
0.6152613, -0.3649218, 3.231795, 0.4352941, 0, 1, 1,
0.6267123, 1.450685, -0.5803776, 0.4392157, 0, 1, 1,
0.6289133, -1.249764, 3.159238, 0.4470588, 0, 1, 1,
0.6300081, -0.06464298, 2.358, 0.4509804, 0, 1, 1,
0.6302543, -1.964277, 2.944921, 0.4588235, 0, 1, 1,
0.6330649, -1.834639, 3.012182, 0.4627451, 0, 1, 1,
0.6346566, 0.4727224, 0.6540418, 0.4705882, 0, 1, 1,
0.6361116, -1.347881, 4.525895, 0.4745098, 0, 1, 1,
0.6395359, 2.046386, 1.887891, 0.4823529, 0, 1, 1,
0.6415818, 0.3446398, 2.32596, 0.4862745, 0, 1, 1,
0.6437849, -1.638692, 3.205544, 0.4941176, 0, 1, 1,
0.6449846, 0.9062575, 0.6533744, 0.5019608, 0, 1, 1,
0.648544, 1.754502, 1.453515, 0.5058824, 0, 1, 1,
0.6492037, -1.278046, 3.093163, 0.5137255, 0, 1, 1,
0.6545125, -0.2915141, 2.031202, 0.5176471, 0, 1, 1,
0.6547793, 0.5962796, 1.831338, 0.5254902, 0, 1, 1,
0.6559551, -0.1756358, 1.174414, 0.5294118, 0, 1, 1,
0.6574291, 0.486859, 1.645176, 0.5372549, 0, 1, 1,
0.6577036, -0.6534258, 3.049731, 0.5411765, 0, 1, 1,
0.6593428, 0.336847, 0.6909183, 0.5490196, 0, 1, 1,
0.6664971, 0.8294786, 1.175281, 0.5529412, 0, 1, 1,
0.678893, 0.4230012, 1.266765, 0.5607843, 0, 1, 1,
0.6949887, -0.3810892, 2.358116, 0.5647059, 0, 1, 1,
0.6992238, -0.4060079, 1.707623, 0.572549, 0, 1, 1,
0.7003323, 0.4353982, 0.4079678, 0.5764706, 0, 1, 1,
0.7020139, 0.2603474, 1.842788, 0.5843138, 0, 1, 1,
0.7059166, -1.398015, 2.330092, 0.5882353, 0, 1, 1,
0.7169753, 0.208601, 2.287305, 0.5960785, 0, 1, 1,
0.7277603, 0.3177208, 1.406581, 0.6039216, 0, 1, 1,
0.7287339, -1.146921, 2.171781, 0.6078432, 0, 1, 1,
0.7327685, 0.7853513, 0.585627, 0.6156863, 0, 1, 1,
0.7338727, -0.7014572, 2.036484, 0.6196079, 0, 1, 1,
0.735652, -1.605355, 3.980848, 0.627451, 0, 1, 1,
0.7366372, 1.255033, 0.3248881, 0.6313726, 0, 1, 1,
0.7455925, 0.9559194, 1.661442, 0.6392157, 0, 1, 1,
0.7472642, 0.05738596, 1.846639, 0.6431373, 0, 1, 1,
0.7514635, 1.610991, -0.6330239, 0.6509804, 0, 1, 1,
0.7703594, -0.4077449, 2.845065, 0.654902, 0, 1, 1,
0.7752433, 0.4380969, 1.062617, 0.6627451, 0, 1, 1,
0.7759418, -0.1033163, 2.156406, 0.6666667, 0, 1, 1,
0.7793656, -0.3553297, 2.23484, 0.6745098, 0, 1, 1,
0.7807294, -1.225782, 3.812469, 0.6784314, 0, 1, 1,
0.789032, 0.322544, 1.804905, 0.6862745, 0, 1, 1,
0.7921166, -0.4322467, 3.277757, 0.6901961, 0, 1, 1,
0.7943966, -1.939374, 2.969836, 0.6980392, 0, 1, 1,
0.7982818, 0.7269877, -0.9544197, 0.7058824, 0, 1, 1,
0.8050986, -0.993182, 1.662887, 0.7098039, 0, 1, 1,
0.8095713, 2.896487, 1.951547, 0.7176471, 0, 1, 1,
0.8126094, 0.3197011, 2.229334, 0.7215686, 0, 1, 1,
0.8147596, 0.214717, 0.6950343, 0.7294118, 0, 1, 1,
0.8156876, 1.453019, -1.548665, 0.7333333, 0, 1, 1,
0.821709, 0.6607212, -0.3238818, 0.7411765, 0, 1, 1,
0.8237137, -1.489122, 3.761117, 0.7450981, 0, 1, 1,
0.8258639, 0.7329987, -1.226401, 0.7529412, 0, 1, 1,
0.8330699, 0.2895144, -0.8604782, 0.7568628, 0, 1, 1,
0.8333567, 1.261927, -0.6010284, 0.7647059, 0, 1, 1,
0.8340899, 0.6842992, 1.426029, 0.7686275, 0, 1, 1,
0.8355183, 1.118336, 1.236858, 0.7764706, 0, 1, 1,
0.8378474, 0.6817689, 0.1562563, 0.7803922, 0, 1, 1,
0.8412481, -0.1139771, 1.59473, 0.7882353, 0, 1, 1,
0.8465076, -1.035788, 1.954001, 0.7921569, 0, 1, 1,
0.8478384, -0.2571822, 2.139048, 0.8, 0, 1, 1,
0.8527743, 0.1139636, 0.6840428, 0.8078431, 0, 1, 1,
0.8553784, 1.269678, 0.1473597, 0.8117647, 0, 1, 1,
0.8583974, -0.7543362, 1.764586, 0.8196079, 0, 1, 1,
0.8628729, -1.089749, 1.604262, 0.8235294, 0, 1, 1,
0.8633159, 1.752514, -0.4646894, 0.8313726, 0, 1, 1,
0.8636777, 0.01321836, 1.176965, 0.8352941, 0, 1, 1,
0.8739036, 0.8748782, 0.9594866, 0.8431373, 0, 1, 1,
0.8859591, -1.551214, 3.120746, 0.8470588, 0, 1, 1,
0.8864724, -0.08731732, 0.3206137, 0.854902, 0, 1, 1,
0.8893229, 1.410383, 0.2664058, 0.8588235, 0, 1, 1,
0.8941116, -0.7162022, 2.058028, 0.8666667, 0, 1, 1,
0.9005686, 0.2519648, 1.641869, 0.8705882, 0, 1, 1,
0.9035428, 1.020938, 1.491323, 0.8784314, 0, 1, 1,
0.9129269, -1.2085, 3.903654, 0.8823529, 0, 1, 1,
0.9142276, 0.4204132, 0.5155298, 0.8901961, 0, 1, 1,
0.91839, -2.73505, 3.92888, 0.8941177, 0, 1, 1,
0.9271091, -1.440955, 1.867648, 0.9019608, 0, 1, 1,
0.9273543, -0.7902446, 1.734226, 0.9098039, 0, 1, 1,
0.9281834, 0.279914, 0.1796138, 0.9137255, 0, 1, 1,
0.9356617, -1.095044, 2.411004, 0.9215686, 0, 1, 1,
0.9380914, -1.103677, 2.924628, 0.9254902, 0, 1, 1,
0.9392698, -0.5345996, 1.455872, 0.9333333, 0, 1, 1,
0.9402081, 0.07899167, 1.369147, 0.9372549, 0, 1, 1,
0.9407582, -0.3634374, 1.257805, 0.945098, 0, 1, 1,
0.9410018, -0.4429736, 1.867318, 0.9490196, 0, 1, 1,
0.9499754, 1.419652, 0.0160717, 0.9568627, 0, 1, 1,
0.9527884, 0.3488002, 2.090322, 0.9607843, 0, 1, 1,
0.9544231, -0.8964106, 1.885154, 0.9686275, 0, 1, 1,
0.9646996, 1.545684, 0.2101201, 0.972549, 0, 1, 1,
0.9720232, 1.024662, 1.151983, 0.9803922, 0, 1, 1,
0.9729815, 1.143878, -2.267162, 0.9843137, 0, 1, 1,
0.9753498, 0.279562, 1.534514, 0.9921569, 0, 1, 1,
0.979743, 1.503033, 0.3201593, 0.9960784, 0, 1, 1,
0.9878433, -0.3912376, 4.188924, 1, 0, 0.9960784, 1,
0.9947019, 1.220527, 0.2825994, 1, 0, 0.9882353, 1,
1.000675, -0.7824079, 3.235107, 1, 0, 0.9843137, 1,
1.001241, 0.504927, 1.846728, 1, 0, 0.9764706, 1,
1.004459, -1.747275, 2.401277, 1, 0, 0.972549, 1,
1.006676, -1.335586, 2.996281, 1, 0, 0.9647059, 1,
1.012202, -0.02815684, 2.179257, 1, 0, 0.9607843, 1,
1.012414, 1.332873, -0.8034313, 1, 0, 0.9529412, 1,
1.01705, -0.85247, 3.234538, 1, 0, 0.9490196, 1,
1.018256, -0.2913013, 2.415373, 1, 0, 0.9411765, 1,
1.026454, -0.1464724, 1.947038, 1, 0, 0.9372549, 1,
1.031633, -1.450319, 3.960367, 1, 0, 0.9294118, 1,
1.043956, 1.044021, 0.9771539, 1, 0, 0.9254902, 1,
1.045507, 0.3123637, 0.3618145, 1, 0, 0.9176471, 1,
1.054381, 1.972891, -0.4635362, 1, 0, 0.9137255, 1,
1.061423, 0.3006747, 0.5526345, 1, 0, 0.9058824, 1,
1.062036, 0.2312028, 2.163222, 1, 0, 0.9019608, 1,
1.062732, 0.9142161, 1.063594, 1, 0, 0.8941177, 1,
1.067333, 0.6074198, -0.007409431, 1, 0, 0.8862745, 1,
1.068854, 0.2563114, 0.6928301, 1, 0, 0.8823529, 1,
1.075547, -0.85687, 3.922705, 1, 0, 0.8745098, 1,
1.076827, -0.868838, 3.065029, 1, 0, 0.8705882, 1,
1.080733, 0.3858278, 2.324194, 1, 0, 0.8627451, 1,
1.08088, -1.73992, 3.673096, 1, 0, 0.8588235, 1,
1.097901, -0.4044271, 0.1980152, 1, 0, 0.8509804, 1,
1.099969, 1.185586, 0.9278902, 1, 0, 0.8470588, 1,
1.10411, 1.159706, 1.82226, 1, 0, 0.8392157, 1,
1.10554, -1.82355, 2.883738, 1, 0, 0.8352941, 1,
1.115917, -1.743829, 0.5122681, 1, 0, 0.827451, 1,
1.118585, -1.026646, 1.755818, 1, 0, 0.8235294, 1,
1.121912, -1.069598, 2.065187, 1, 0, 0.8156863, 1,
1.133298, 0.7256485, 0.3918275, 1, 0, 0.8117647, 1,
1.134404, 0.296929, 0.7914509, 1, 0, 0.8039216, 1,
1.137291, -1.561125, 2.320508, 1, 0, 0.7960784, 1,
1.14957, -0.8739285, -0.6122819, 1, 0, 0.7921569, 1,
1.15578, 0.6030752, 1.948238, 1, 0, 0.7843137, 1,
1.159883, -2.023498, 2.603768, 1, 0, 0.7803922, 1,
1.162366, 1.087038, -0.0599552, 1, 0, 0.772549, 1,
1.165797, 0.1879354, 2.177855, 1, 0, 0.7686275, 1,
1.172132, 0.896395, 2.714799, 1, 0, 0.7607843, 1,
1.175441, 2.563719, 0.1173464, 1, 0, 0.7568628, 1,
1.175669, 0.04527874, 2.485394, 1, 0, 0.7490196, 1,
1.175677, -1.100364, 2.226975, 1, 0, 0.7450981, 1,
1.177629, -0.5350907, 2.119915, 1, 0, 0.7372549, 1,
1.179252, -0.3264522, 1.214892, 1, 0, 0.7333333, 1,
1.184573, -1.419553, 2.788426, 1, 0, 0.7254902, 1,
1.186597, -0.744787, 0.4618419, 1, 0, 0.7215686, 1,
1.186697, 0.05374676, 0.1397435, 1, 0, 0.7137255, 1,
1.191728, 0.8383402, 2.105333, 1, 0, 0.7098039, 1,
1.19173, 0.4943516, 0.02748796, 1, 0, 0.7019608, 1,
1.193977, -0.9609112, 1.643191, 1, 0, 0.6941177, 1,
1.214725, 1.192726, -0.7941735, 1, 0, 0.6901961, 1,
1.218295, -0.2936536, 0.5627484, 1, 0, 0.682353, 1,
1.236778, -0.2855363, 2.054964, 1, 0, 0.6784314, 1,
1.238486, -1.365993, 1.885813, 1, 0, 0.6705883, 1,
1.245283, -0.2266777, 1.450159, 1, 0, 0.6666667, 1,
1.250018, -0.8620193, 2.092432, 1, 0, 0.6588235, 1,
1.26044, 0.589003, -0.006019988, 1, 0, 0.654902, 1,
1.276511, 0.3752324, 0.4998053, 1, 0, 0.6470588, 1,
1.279096, 0.6200998, 0.871473, 1, 0, 0.6431373, 1,
1.280073, -0.2042636, 1.849141, 1, 0, 0.6352941, 1,
1.282529, -0.06694626, 0.8090397, 1, 0, 0.6313726, 1,
1.282928, -0.9124879, 2.953969, 1, 0, 0.6235294, 1,
1.297379, -0.02188709, 1.96161, 1, 0, 0.6196079, 1,
1.299672, -1.035235, 2.221618, 1, 0, 0.6117647, 1,
1.301487, 0.05668021, 2.044505, 1, 0, 0.6078432, 1,
1.30685, -0.7598889, 1.302856, 1, 0, 0.6, 1,
1.313468, 1.919609, 1.544955, 1, 0, 0.5921569, 1,
1.330256, 0.2120213, 1.03193, 1, 0, 0.5882353, 1,
1.339297, -0.09143022, 1.907428, 1, 0, 0.5803922, 1,
1.341723, 0.2840554, 0.1376506, 1, 0, 0.5764706, 1,
1.35263, -1.088776, 3.739201, 1, 0, 0.5686275, 1,
1.354846, 0.9366708, 1.807668, 1, 0, 0.5647059, 1,
1.357017, -0.5772151, 3.91789, 1, 0, 0.5568628, 1,
1.36039, -0.4529087, 1.464745, 1, 0, 0.5529412, 1,
1.363335, -2.054909, 2.72809, 1, 0, 0.5450981, 1,
1.363706, 0.2453237, -0.04306244, 1, 0, 0.5411765, 1,
1.367216, -1.384439, 3.352854, 1, 0, 0.5333334, 1,
1.370194, -0.6903131, 2.003245, 1, 0, 0.5294118, 1,
1.384921, -2.12149, 3.59607, 1, 0, 0.5215687, 1,
1.391408, 0.9189191, -0.20894, 1, 0, 0.5176471, 1,
1.397078, 1.137452, 2.292049, 1, 0, 0.509804, 1,
1.397762, -0.8687713, 1.287619, 1, 0, 0.5058824, 1,
1.400239, 0.5678822, -0.5393891, 1, 0, 0.4980392, 1,
1.414007, -1.0275, 1.843824, 1, 0, 0.4901961, 1,
1.426826, -1.184955, 3.954299, 1, 0, 0.4862745, 1,
1.429001, 0.6734812, 1.779863, 1, 0, 0.4784314, 1,
1.429963, -0.1813193, 2.105128, 1, 0, 0.4745098, 1,
1.439146, 0.6633715, 2.312158, 1, 0, 0.4666667, 1,
1.442624, 1.189356, 1.836531, 1, 0, 0.4627451, 1,
1.445088, 0.005416576, 0.4599378, 1, 0, 0.454902, 1,
1.453253, -0.09950877, -0.04865418, 1, 0, 0.4509804, 1,
1.459194, 0.8769908, -0.373838, 1, 0, 0.4431373, 1,
1.459342, 0.1634643, 0.2287425, 1, 0, 0.4392157, 1,
1.461137, 0.07821353, 1.923987, 1, 0, 0.4313726, 1,
1.466481, -1.134387, 1.391883, 1, 0, 0.427451, 1,
1.468219, 1.571155, 0.8927222, 1, 0, 0.4196078, 1,
1.482963, 0.398333, 0.8316703, 1, 0, 0.4156863, 1,
1.502546, -0.1050799, 2.771562, 1, 0, 0.4078431, 1,
1.503826, -0.09032112, 3.45501, 1, 0, 0.4039216, 1,
1.509953, 0.4809579, 1.77566, 1, 0, 0.3960784, 1,
1.514596, 0.5839034, 1.530133, 1, 0, 0.3882353, 1,
1.515006, 0.7531652, 1.692095, 1, 0, 0.3843137, 1,
1.520733, -0.1759384, 1.260341, 1, 0, 0.3764706, 1,
1.522065, -2.186696, 2.449219, 1, 0, 0.372549, 1,
1.526211, 0.1919522, 2.205387, 1, 0, 0.3647059, 1,
1.527061, -0.537997, 3.32595, 1, 0, 0.3607843, 1,
1.544538, 0.4687638, -0.2214957, 1, 0, 0.3529412, 1,
1.549238, 0.1002394, 0.5093711, 1, 0, 0.3490196, 1,
1.553926, -1.282946, 2.261752, 1, 0, 0.3411765, 1,
1.559177, -0.5398754, 1.812374, 1, 0, 0.3372549, 1,
1.565496, 1.008439, 0.2494603, 1, 0, 0.3294118, 1,
1.584716, -0.6932727, 1.660192, 1, 0, 0.3254902, 1,
1.59084, -0.6125731, 2.205409, 1, 0, 0.3176471, 1,
1.596446, 0.1529547, 2.385385, 1, 0, 0.3137255, 1,
1.597369, -0.3592885, -0.136487, 1, 0, 0.3058824, 1,
1.60291, -0.7746217, 1.371935, 1, 0, 0.2980392, 1,
1.60636, 0.4100252, 0.579493, 1, 0, 0.2941177, 1,
1.613655, -0.359907, 1.734714, 1, 0, 0.2862745, 1,
1.616019, -0.009986367, 1.527967, 1, 0, 0.282353, 1,
1.628596, -1.757943, 3.533445, 1, 0, 0.2745098, 1,
1.652324, -0.9113709, 2.383128, 1, 0, 0.2705882, 1,
1.65501, 0.7639116, 1.25941, 1, 0, 0.2627451, 1,
1.66451, -0.3483621, 2.752386, 1, 0, 0.2588235, 1,
1.66544, 0.5677994, 1.484935, 1, 0, 0.2509804, 1,
1.666741, 0.5725215, 1.533338, 1, 0, 0.2470588, 1,
1.670061, 1.212794, 0.952511, 1, 0, 0.2392157, 1,
1.677048, 0.5922776, 2.373905, 1, 0, 0.2352941, 1,
1.704615, -0.3690471, 1.664456, 1, 0, 0.227451, 1,
1.719306, -0.5141091, 3.589644, 1, 0, 0.2235294, 1,
1.724503, -0.07219026, 2.187487, 1, 0, 0.2156863, 1,
1.728394, 1.593297, 1.351096, 1, 0, 0.2117647, 1,
1.765662, 0.5105039, 2.576834, 1, 0, 0.2039216, 1,
1.775818, 1.588014, 0.8666654, 1, 0, 0.1960784, 1,
1.800714, 1.013167, 1.41098, 1, 0, 0.1921569, 1,
1.803088, 0.3490211, 0.1278382, 1, 0, 0.1843137, 1,
1.810056, 0.3040778, -0.7589092, 1, 0, 0.1803922, 1,
1.814373, -1.478019, 2.198123, 1, 0, 0.172549, 1,
1.821776, -0.2551562, 2.260877, 1, 0, 0.1686275, 1,
1.829237, 0.1482711, 0.7115439, 1, 0, 0.1607843, 1,
1.841413, 0.6453449, 1.68083, 1, 0, 0.1568628, 1,
1.849462, -0.747748, 1.893683, 1, 0, 0.1490196, 1,
1.849768, 0.9997097, -1.011925, 1, 0, 0.145098, 1,
1.881169, 0.8317826, 0.4240945, 1, 0, 0.1372549, 1,
1.941098, 0.3436192, 1.667266, 1, 0, 0.1333333, 1,
1.950023, 1.042405, 1.087532, 1, 0, 0.1254902, 1,
1.957415, -0.5470359, 1.804271, 1, 0, 0.1215686, 1,
1.963395, 0.505392, 1.427105, 1, 0, 0.1137255, 1,
1.995042, -1.482364, 4.307515, 1, 0, 0.1098039, 1,
2.026805, -1.491191, 3.267345, 1, 0, 0.1019608, 1,
2.031949, -1.211987, 3.432409, 1, 0, 0.09411765, 1,
2.05183, -1.856545, 2.40223, 1, 0, 0.09019608, 1,
2.06322, 2.292478, 0.07616233, 1, 0, 0.08235294, 1,
2.076515, 0.01855226, -0.2964115, 1, 0, 0.07843138, 1,
2.079743, 1.341641, 2.86167, 1, 0, 0.07058824, 1,
2.248961, 0.4357654, 1.037337, 1, 0, 0.06666667, 1,
2.364809, -0.5673815, 1.517796, 1, 0, 0.05882353, 1,
2.434688, 0.4945332, -1.306381, 1, 0, 0.05490196, 1,
2.434723, 1.359002, 0.867475, 1, 0, 0.04705882, 1,
2.459777, -1.45793, 2.235709, 1, 0, 0.04313726, 1,
2.462974, 1.923651, -1.232749, 1, 0, 0.03529412, 1,
2.4638, -0.9258559, 1.49779, 1, 0, 0.03137255, 1,
2.491494, -0.4006915, 2.000713, 1, 0, 0.02352941, 1,
2.532606, -1.515736, 3.046245, 1, 0, 0.01960784, 1,
2.551306, -1.476109, 1.757359, 1, 0, 0.01176471, 1,
3.698199, -0.1136917, 1.653945, 1, 0, 0.007843138, 1
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
0.3927718, -4.163466, -8.149538, 0, -0.5, 0.5, 0.5,
0.3927718, -4.163466, -8.149538, 1, -0.5, 0.5, 0.5,
0.3927718, -4.163466, -8.149538, 1, 1.5, 0.5, 0.5,
0.3927718, -4.163466, -8.149538, 0, 1.5, 0.5, 0.5
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
-4.033195, 0.392604, -8.149538, 0, -0.5, 0.5, 0.5,
-4.033195, 0.392604, -8.149538, 1, -0.5, 0.5, 0.5,
-4.033195, 0.392604, -8.149538, 1, 1.5, 0.5, 0.5,
-4.033195, 0.392604, -8.149538, 0, 1.5, 0.5, 0.5
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
-4.033195, -4.163466, -0.08627677, 0, -0.5, 0.5, 0.5,
-4.033195, -4.163466, -0.08627677, 1, -0.5, 0.5, 0.5,
-4.033195, -4.163466, -0.08627677, 1, 1.5, 0.5, 0.5,
-4.033195, -4.163466, -0.08627677, 0, 1.5, 0.5, 0.5
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
-2, -3.112065, -6.288785,
3, -3.112065, -6.288785,
-2, -3.112065, -6.288785,
-2, -3.287299, -6.598911,
-1, -3.112065, -6.288785,
-1, -3.287299, -6.598911,
0, -3.112065, -6.288785,
0, -3.287299, -6.598911,
1, -3.112065, -6.288785,
1, -3.287299, -6.598911,
2, -3.112065, -6.288785,
2, -3.287299, -6.598911,
3, -3.112065, -6.288785,
3, -3.287299, -6.598911
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
"-1",
"0",
"1",
"2",
"3"
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
-2, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
-2, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
-2, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
-2, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5,
-1, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
-1, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
-1, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
-1, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5,
0, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
0, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
0, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
0, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5,
1, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
1, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
1, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
1, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5,
2, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
2, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
2, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
2, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5,
3, -3.637766, -7.219162, 0, -0.5, 0.5, 0.5,
3, -3.637766, -7.219162, 1, -0.5, 0.5, 0.5,
3, -3.637766, -7.219162, 1, 1.5, 0.5, 0.5,
3, -3.637766, -7.219162, 0, 1.5, 0.5, 0.5
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
-3.011818, -3, -6.288785,
-3.011818, 3, -6.288785,
-3.011818, -3, -6.288785,
-3.182047, -3, -6.598911,
-3.011818, -2, -6.288785,
-3.182047, -2, -6.598911,
-3.011818, -1, -6.288785,
-3.182047, -1, -6.598911,
-3.011818, 0, -6.288785,
-3.182047, 0, -6.598911,
-3.011818, 1, -6.288785,
-3.182047, 1, -6.598911,
-3.011818, 2, -6.288785,
-3.182047, 2, -6.598911,
-3.011818, 3, -6.288785,
-3.182047, 3, -6.598911
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
"-3",
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
-3.522506, -3, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, -3, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, -3, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, -3, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, -2, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, -2, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, -2, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, -2, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, -1, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, -1, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, -1, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, -1, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, 0, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, 0, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, 0, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, 0, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, 1, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, 1, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, 1, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, 1, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, 2, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, 2, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, 2, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, 2, -7.219162, 0, 1.5, 0.5, 0.5,
-3.522506, 3, -7.219162, 0, -0.5, 0.5, 0.5,
-3.522506, 3, -7.219162, 1, -0.5, 0.5, 0.5,
-3.522506, 3, -7.219162, 1, 1.5, 0.5, 0.5,
-3.522506, 3, -7.219162, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.011818, -3.112065, -6,
-3.011818, -3.112065, 4,
-3.011818, -3.112065, -6,
-3.182047, -3.287299, -6,
-3.011818, -3.112065, -4,
-3.182047, -3.287299, -4,
-3.011818, -3.112065, -2,
-3.182047, -3.287299, -2,
-3.011818, -3.112065, 0,
-3.182047, -3.287299, 0,
-3.011818, -3.112065, 2,
-3.182047, -3.287299, 2,
-3.011818, -3.112065, 4,
-3.182047, -3.287299, 4
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
"-6",
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
-3.522506, -3.637766, -6, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -6, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -6, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, -6, 0, 1.5, 0.5, 0.5,
-3.522506, -3.637766, -4, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -4, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -4, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, -4, 0, 1.5, 0.5, 0.5,
-3.522506, -3.637766, -2, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -2, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, -2, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, -2, 0, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 0, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 0, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 0, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 0, 0, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 2, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 2, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 2, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 2, 0, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 4, 0, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 4, 1, -0.5, 0.5, 0.5,
-3.522506, -3.637766, 4, 1, 1.5, 0.5, 0.5,
-3.522506, -3.637766, 4, 0, 1.5, 0.5, 0.5
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
-3.011818, -3.112065, -6.288785,
-3.011818, 3.897273, -6.288785,
-3.011818, -3.112065, 6.116232,
-3.011818, 3.897273, 6.116232,
-3.011818, -3.112065, -6.288785,
-3.011818, -3.112065, 6.116232,
-3.011818, 3.897273, -6.288785,
-3.011818, 3.897273, 6.116232,
-3.011818, -3.112065, -6.288785,
3.797362, -3.112065, -6.288785,
-3.011818, -3.112065, 6.116232,
3.797362, -3.112065, 6.116232,
-3.011818, 3.897273, -6.288785,
3.797362, 3.897273, -6.288785,
-3.011818, 3.897273, 6.116232,
3.797362, 3.897273, 6.116232,
3.797362, -3.112065, -6.288785,
3.797362, 3.897273, -6.288785,
3.797362, -3.112065, 6.116232,
3.797362, 3.897273, 6.116232,
3.797362, -3.112065, -6.288785,
3.797362, -3.112065, 6.116232,
3.797362, 3.897273, -6.288785,
3.797362, 3.897273, 6.116232
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
var radius = 8.432502;
var distance = 37.51715;
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
mvMatrix.translate( -0.3927718, -0.392604, 0.08627677 );
mvMatrix.scale( 1.338985, 1.300748, 0.7349757 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.51715);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Milbemectin_A3<-read.table("Milbemectin_A3.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Milbemectin_A3$V2
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
```

```r
y<-Milbemectin_A3$V3
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
```

```r
z<-Milbemectin_A3$V4
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
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
-2.912655, -1.193006, -1.021655, 0, 0, 1, 1, 1,
-2.893257, -0.04100626, -1.908005, 1, 0, 0, 1, 1,
-2.781518, 0.9991088, -1.726113, 1, 0, 0, 1, 1,
-2.768818, 0.2360255, -2.220975, 1, 0, 0, 1, 1,
-2.755167, -0.8002202, -2.419785, 1, 0, 0, 1, 1,
-2.699314, -1.618772, -4.118945, 1, 0, 0, 1, 1,
-2.659106, -1.111571, -1.407023, 0, 0, 0, 1, 1,
-2.632761, 1.147118, -1.814468, 0, 0, 0, 1, 1,
-2.61692, -0.3389178, -0.7520295, 0, 0, 0, 1, 1,
-2.577002, -0.52621, -1.742113, 0, 0, 0, 1, 1,
-2.521506, -1.547553, -2.447729, 0, 0, 0, 1, 1,
-2.433845, -0.7535891, -0.6074838, 0, 0, 0, 1, 1,
-2.395102, 0.2774436, -1.175963, 0, 0, 0, 1, 1,
-2.316325, -0.1176532, -3.105553, 1, 1, 1, 1, 1,
-2.286664, 1.279486, -1.399292, 1, 1, 1, 1, 1,
-2.236131, 1.246105, -0.2447615, 1, 1, 1, 1, 1,
-2.196745, -0.6978698, -2.21358, 1, 1, 1, 1, 1,
-2.133737, -0.816401, -1.219252, 1, 1, 1, 1, 1,
-2.129638, 0.3284797, -2.983284, 1, 1, 1, 1, 1,
-2.100635, -0.7654876, -1.423071, 1, 1, 1, 1, 1,
-2.056808, 1.790589, -0.351264, 1, 1, 1, 1, 1,
-2.056059, -0.09528957, -1.869209, 1, 1, 1, 1, 1,
-2.012118, -0.1566605, -0.001705628, 1, 1, 1, 1, 1,
-1.997532, 1.079837, -1.961757, 1, 1, 1, 1, 1,
-1.9927, 0.1137705, -3.171483, 1, 1, 1, 1, 1,
-1.958839, 0.1341621, -1.104931, 1, 1, 1, 1, 1,
-1.928452, -1.322026, -2.146452, 1, 1, 1, 1, 1,
-1.88394, 0.04677704, -2.822247, 1, 1, 1, 1, 1,
-1.863962, -1.568206, -1.926683, 0, 0, 1, 1, 1,
-1.832299, 2.20225, -0.6709961, 1, 0, 0, 1, 1,
-1.829616, -0.9064851, -2.233065, 1, 0, 0, 1, 1,
-1.827352, -0.6796041, -3.080787, 1, 0, 0, 1, 1,
-1.798884, -0.8005055, -0.6191596, 1, 0, 0, 1, 1,
-1.786487, 0.02358971, -2.494996, 1, 0, 0, 1, 1,
-1.78249, -1.135994, -1.45325, 0, 0, 0, 1, 1,
-1.743588, 0.7236766, 0.6013981, 0, 0, 0, 1, 1,
-1.731115, -0.405102, -2.941033, 0, 0, 0, 1, 1,
-1.704996, 1.188695, -0.05323818, 0, 0, 0, 1, 1,
-1.682003, -0.2788596, -1.891388, 0, 0, 0, 1, 1,
-1.669992, -0.2831377, -0.8488052, 0, 0, 0, 1, 1,
-1.668576, -0.4053935, 0.3921419, 0, 0, 0, 1, 1,
-1.667957, 1.83657, -0.2880073, 1, 1, 1, 1, 1,
-1.666753, 0.6054872, -1.484783, 1, 1, 1, 1, 1,
-1.659385, 0.6861205, -2.327408, 1, 1, 1, 1, 1,
-1.658071, 0.5799475, -1.553915, 1, 1, 1, 1, 1,
-1.65521, -0.2338408, -3.015959, 1, 1, 1, 1, 1,
-1.654363, 1.046985, -0.7456575, 1, 1, 1, 1, 1,
-1.643968, -1.568069, -1.713904, 1, 1, 1, 1, 1,
-1.61938, 0.563157, 0.106329, 1, 1, 1, 1, 1,
-1.602991, -0.5472119, -2.823682, 1, 1, 1, 1, 1,
-1.597347, 0.2069895, -1.435295, 1, 1, 1, 1, 1,
-1.590472, -0.3846567, -1.662061, 1, 1, 1, 1, 1,
-1.576939, -0.1602117, -1.845255, 1, 1, 1, 1, 1,
-1.57499, -0.4456568, -2.620223, 1, 1, 1, 1, 1,
-1.574628, 1.363351, -3.22037, 1, 1, 1, 1, 1,
-1.566364, -1.296492, -1.266204, 1, 1, 1, 1, 1,
-1.566319, 0.282212, -2.821288, 0, 0, 1, 1, 1,
-1.565958, -0.8162421, -1.82562, 1, 0, 0, 1, 1,
-1.558408, -1.264105, -1.931454, 1, 0, 0, 1, 1,
-1.550003, 0.7490951, -2.919617, 1, 0, 0, 1, 1,
-1.547248, -0.7021019, -3.43811, 1, 0, 0, 1, 1,
-1.532371, 0.04853019, -3.11178, 1, 0, 0, 1, 1,
-1.511585, 0.3669046, -2.884069, 0, 0, 0, 1, 1,
-1.5066, 0.3933626, -1.959991, 0, 0, 0, 1, 1,
-1.506597, -2.094795, -3.402203, 0, 0, 0, 1, 1,
-1.5007, 0.5757201, -2.063325, 0, 0, 0, 1, 1,
-1.494408, 0.06722201, -2.797771, 0, 0, 0, 1, 1,
-1.490999, 0.3998067, -2.946374, 0, 0, 0, 1, 1,
-1.489089, 0.8234856, -1.083988, 0, 0, 0, 1, 1,
-1.487089, 0.2718626, -2.659509, 1, 1, 1, 1, 1,
-1.48536, -0.3506966, -1.249531, 1, 1, 1, 1, 1,
-1.461842, -0.02108524, -1.340465, 1, 1, 1, 1, 1,
-1.457839, 0.3038476, -0.7891203, 1, 1, 1, 1, 1,
-1.455871, 0.03848298, -0.1735279, 1, 1, 1, 1, 1,
-1.453397, -0.9829106, -0.3659998, 1, 1, 1, 1, 1,
-1.450057, -0.1457938, -1.282915, 1, 1, 1, 1, 1,
-1.447163, -0.471966, -2.985256, 1, 1, 1, 1, 1,
-1.445794, 0.7514011, -1.095754, 1, 1, 1, 1, 1,
-1.445151, -1.265819, -3.247705, 1, 1, 1, 1, 1,
-1.438111, -0.3608513, -1.919214, 1, 1, 1, 1, 1,
-1.429884, -0.9936854, -1.781581, 1, 1, 1, 1, 1,
-1.429772, -0.7134011, -1.14615, 1, 1, 1, 1, 1,
-1.426322, 1.727721, -1.495141, 1, 1, 1, 1, 1,
-1.421854, 0.6080175, -2.666798, 1, 1, 1, 1, 1,
-1.408153, 1.347394, -1.198888, 0, 0, 1, 1, 1,
-1.396373, -0.0881286, -0.3236254, 1, 0, 0, 1, 1,
-1.395834, -2.466053, -3.338919, 1, 0, 0, 1, 1,
-1.39336, -0.2321067, -2.096152, 1, 0, 0, 1, 1,
-1.384258, -0.3831262, -3.257184, 1, 0, 0, 1, 1,
-1.381069, -1.074985, -3.16843, 1, 0, 0, 1, 1,
-1.376027, 0.06813189, -2.962123, 0, 0, 0, 1, 1,
-1.373632, -0.6337064, -2.71856, 0, 0, 0, 1, 1,
-1.364266, -0.2473307, -0.537163, 0, 0, 0, 1, 1,
-1.353463, -0.3827448, -2.249286, 0, 0, 0, 1, 1,
-1.353018, 0.7171044, -0.8733406, 0, 0, 0, 1, 1,
-1.348943, 1.434992, -1.189335, 0, 0, 0, 1, 1,
-1.347566, -1.323805, -2.680525, 0, 0, 0, 1, 1,
-1.340044, -0.3218226, -2.342144, 1, 1, 1, 1, 1,
-1.339947, 0.8261737, -1.110631, 1, 1, 1, 1, 1,
-1.331109, -0.1306656, -2.134049, 1, 1, 1, 1, 1,
-1.322558, -0.5265871, -2.277369, 1, 1, 1, 1, 1,
-1.32213, -0.02196054, -2.262337, 1, 1, 1, 1, 1,
-1.312948, 0.7993886, 0.4800105, 1, 1, 1, 1, 1,
-1.307549, 2.24957, -0.9496478, 1, 1, 1, 1, 1,
-1.292012, -0.08234309, -0.2465665, 1, 1, 1, 1, 1,
-1.281525, -0.8693771, -0.6173472, 1, 1, 1, 1, 1,
-1.28022, 1.013233, -0.8975145, 1, 1, 1, 1, 1,
-1.27515, -0.7878091, -2.221578, 1, 1, 1, 1, 1,
-1.273112, -0.389645, -1.030124, 1, 1, 1, 1, 1,
-1.273105, -3.004334, -5.317602, 1, 1, 1, 1, 1,
-1.257971, -0.1499338, -0.9547403, 1, 1, 1, 1, 1,
-1.254433, 0.162366, -0.3903119, 1, 1, 1, 1, 1,
-1.250409, -1.537054, -3.044649, 0, 0, 1, 1, 1,
-1.241141, 1.41745, -0.7241502, 1, 0, 0, 1, 1,
-1.233062, 0.826552, -2.69051, 1, 0, 0, 1, 1,
-1.227915, -0.6058215, -1.812339, 1, 0, 0, 1, 1,
-1.227735, -0.3686541, -2.339771, 1, 0, 0, 1, 1,
-1.219226, -0.6952011, -2.344308, 1, 0, 0, 1, 1,
-1.216369, -0.2615918, -1.265875, 0, 0, 0, 1, 1,
-1.213939, 0.5119073, 0.1312544, 0, 0, 0, 1, 1,
-1.210657, -0.2287379, -2.113062, 0, 0, 0, 1, 1,
-1.198683, 1.462589, -1.593945, 0, 0, 0, 1, 1,
-1.197166, 1.27622, 1.217147, 0, 0, 0, 1, 1,
-1.185454, 0.6040671, -0.009299949, 0, 0, 0, 1, 1,
-1.170934, -0.1649514, -2.303392, 0, 0, 0, 1, 1,
-1.170332, 0.05585549, -1.915237, 1, 1, 1, 1, 1,
-1.15986, -1.208202, -2.427684, 1, 1, 1, 1, 1,
-1.157316, 1.060108, -1.020688, 1, 1, 1, 1, 1,
-1.150743, 0.1807697, -1.102353, 1, 1, 1, 1, 1,
-1.149693, 1.536201, 0.004666192, 1, 1, 1, 1, 1,
-1.13174, -1.422114, -3.113209, 1, 1, 1, 1, 1,
-1.129682, -0.5116576, -1.688133, 1, 1, 1, 1, 1,
-1.126185, 2.033143, -1.038859, 1, 1, 1, 1, 1,
-1.120022, 0.9420093, 0.2127691, 1, 1, 1, 1, 1,
-1.117086, 0.1345437, -3.191552, 1, 1, 1, 1, 1,
-1.114935, 0.3141547, -0.09787272, 1, 1, 1, 1, 1,
-1.106497, -0.5094613, -1.831027, 1, 1, 1, 1, 1,
-1.101719, 0.4287604, -0.8827574, 1, 1, 1, 1, 1,
-1.094437, -1.008814, -0.2064189, 1, 1, 1, 1, 1,
-1.081148, 0.6088378, -4.740372, 1, 1, 1, 1, 1,
-1.078931, 0.3429671, 0.1966165, 0, 0, 1, 1, 1,
-1.07372, -1.59931, -2.497406, 1, 0, 0, 1, 1,
-1.071306, -0.7894603, -2.102884, 1, 0, 0, 1, 1,
-1.06702, -0.6379865, -0.3402915, 1, 0, 0, 1, 1,
-1.060066, -0.8379431, -3.813435, 1, 0, 0, 1, 1,
-1.055116, -1.122622, -1.514399, 1, 0, 0, 1, 1,
-1.053311, -0.3241937, -2.349608, 0, 0, 0, 1, 1,
-1.049528, 1.446432, -0.4595983, 0, 0, 0, 1, 1,
-1.048482, -0.09762909, -1.875059, 0, 0, 0, 1, 1,
-1.047392, -0.06082029, 0.1188239, 0, 0, 0, 1, 1,
-1.046948, -0.4161497, -1.040802, 0, 0, 0, 1, 1,
-1.043947, 0.4856806, 0.7602941, 0, 0, 0, 1, 1,
-1.042387, 0.6568316, -0.5960727, 0, 0, 0, 1, 1,
-1.039314, -0.00506368, -2.425515, 1, 1, 1, 1, 1,
-1.029285, 1.374318, -0.2342094, 1, 1, 1, 1, 1,
-1.029242, -0.4361348, -0.6170769, 1, 1, 1, 1, 1,
-1.024579, -1.129851, -2.100933, 1, 1, 1, 1, 1,
-1.02283, -1.333158, -3.732124, 1, 1, 1, 1, 1,
-1.01667, -0.2097134, -1.064913, 1, 1, 1, 1, 1,
-1.009584, -0.6413127, -1.384889, 1, 1, 1, 1, 1,
-1.005839, -0.09247198, -1.362068, 1, 1, 1, 1, 1,
-0.9982732, 1.01747, -0.9195955, 1, 1, 1, 1, 1,
-0.9946629, -0.4382989, -2.721181, 1, 1, 1, 1, 1,
-0.9916632, 2.46043, -1.132688, 1, 1, 1, 1, 1,
-0.9899338, 2.572988, 0.616642, 1, 1, 1, 1, 1,
-0.9897491, 1.081502, 0.1642514, 1, 1, 1, 1, 1,
-0.9877967, 0.6832007, -1.193737, 1, 1, 1, 1, 1,
-0.9831721, 0.06606126, -2.403606, 1, 1, 1, 1, 1,
-0.9800041, -0.3751099, -1.040168, 0, 0, 1, 1, 1,
-0.9726073, 1.004814, -0.3011851, 1, 0, 0, 1, 1,
-0.9696653, -0.2884719, -2.81224, 1, 0, 0, 1, 1,
-0.9654961, 0.6390627, -1.840859, 1, 0, 0, 1, 1,
-0.9652307, -1.437902, -1.590981, 1, 0, 0, 1, 1,
-0.9560083, -1.011721, -2.408688, 1, 0, 0, 1, 1,
-0.9554247, -0.6418342, -0.2179535, 0, 0, 0, 1, 1,
-0.9547973, 0.7776639, -0.9837815, 0, 0, 0, 1, 1,
-0.9525421, 0.5340036, -0.9671665, 0, 0, 0, 1, 1,
-0.9516401, 0.4859942, -1.687865, 0, 0, 0, 1, 1,
-0.9444768, 0.7234858, -1.196806, 0, 0, 0, 1, 1,
-0.9394723, -1.283396, -1.70474, 0, 0, 0, 1, 1,
-0.9380849, 0.6414585, -4.45534, 0, 0, 0, 1, 1,
-0.9359249, -0.7127542, -0.4750843, 1, 1, 1, 1, 1,
-0.9267811, -1.008027, -2.982534, 1, 1, 1, 1, 1,
-0.9202276, -0.1425823, -0.9941963, 1, 1, 1, 1, 1,
-0.9196379, 1.155722, -1.480516, 1, 1, 1, 1, 1,
-0.9120806, -0.03602809, -1.539017, 1, 1, 1, 1, 1,
-0.9089221, -0.5475102, -2.821178, 1, 1, 1, 1, 1,
-0.9074777, -0.8330521, -2.506467, 1, 1, 1, 1, 1,
-0.9055645, -0.7800072, -2.366344, 1, 1, 1, 1, 1,
-0.902438, 1.826123, -1.187877, 1, 1, 1, 1, 1,
-0.9021188, -0.3166229, 0.02274601, 1, 1, 1, 1, 1,
-0.9009658, 0.02689847, -0.9679191, 1, 1, 1, 1, 1,
-0.8979833, 0.6171131, -1.535653, 1, 1, 1, 1, 1,
-0.8960493, -1.428942, -2.64037, 1, 1, 1, 1, 1,
-0.8955541, -0.8256961, -1.711893, 1, 1, 1, 1, 1,
-0.8952009, 1.035961, -2.79034, 1, 1, 1, 1, 1,
-0.8947218, -0.1907831, -3.444463, 0, 0, 1, 1, 1,
-0.8886257, 1.517839, -0.9241493, 1, 0, 0, 1, 1,
-0.8835122, 1.442987, 0.283518, 1, 0, 0, 1, 1,
-0.8830886, 1.439723, -0.1413376, 1, 0, 0, 1, 1,
-0.8715808, -0.6493384, -3.325942, 1, 0, 0, 1, 1,
-0.8690872, -1.355143, -2.044699, 1, 0, 0, 1, 1,
-0.8537114, 0.08236872, 0.2984753, 0, 0, 0, 1, 1,
-0.852192, 0.2862465, -1.408393, 0, 0, 0, 1, 1,
-0.8501524, 1.397327, 0.1453702, 0, 0, 0, 1, 1,
-0.8401719, -0.6265523, -1.119724, 0, 0, 0, 1, 1,
-0.8371254, 0.5093403, -0.4550211, 0, 0, 0, 1, 1,
-0.8322612, -0.9121485, -3.43014, 0, 0, 0, 1, 1,
-0.8301519, -0.07636415, -1.955179, 0, 0, 0, 1, 1,
-0.828439, 0.1583527, -0.686296, 1, 1, 1, 1, 1,
-0.8266595, -1.016154, -1.656883, 1, 1, 1, 1, 1,
-0.826337, 0.3763351, -1.621347, 1, 1, 1, 1, 1,
-0.8258479, 0.7075214, -0.4473161, 1, 1, 1, 1, 1,
-0.8188244, 0.2953216, -2.460515, 1, 1, 1, 1, 1,
-0.8055135, -0.625614, -3.536236, 1, 1, 1, 1, 1,
-0.8012893, -1.728708, -3.862533, 1, 1, 1, 1, 1,
-0.7901342, -0.04421571, -0.8536877, 1, 1, 1, 1, 1,
-0.7817876, 0.9806355, -1.374982, 1, 1, 1, 1, 1,
-0.7812778, 1.879721, -2.225543, 1, 1, 1, 1, 1,
-0.7789746, -1.246731, -1.5019, 1, 1, 1, 1, 1,
-0.7752604, -0.8946286, -2.858169, 1, 1, 1, 1, 1,
-0.7738083, -0.4584333, -2.823287, 1, 1, 1, 1, 1,
-0.7626148, -0.5616248, -1.908103, 1, 1, 1, 1, 1,
-0.7610627, -0.7024485, -2.034524, 1, 1, 1, 1, 1,
-0.7598889, -0.1048763, -2.268705, 0, 0, 1, 1, 1,
-0.7594933, -0.696933, -2.162719, 1, 0, 0, 1, 1,
-0.7520781, 1.56182, -1.10799, 1, 0, 0, 1, 1,
-0.7447886, 0.1100498, 0.529925, 1, 0, 0, 1, 1,
-0.7437937, 1.12578, -0.4282684, 1, 0, 0, 1, 1,
-0.7413071, 0.07610139, -0.348971, 1, 0, 0, 1, 1,
-0.7390506, 0.4430238, -0.6551037, 0, 0, 0, 1, 1,
-0.7341904, 0.7598304, -1.893047, 0, 0, 0, 1, 1,
-0.7270624, -1.526488, -5.255986, 0, 0, 0, 1, 1,
-0.7254015, 0.1173487, -0.2502935, 0, 0, 0, 1, 1,
-0.7246206, 0.4717259, -0.3810845, 0, 0, 0, 1, 1,
-0.7168239, 0.8500763, -0.6460165, 0, 0, 0, 1, 1,
-0.7139609, 0.2060716, -3.138144, 0, 0, 0, 1, 1,
-0.7103001, 1.933094, 1.228915, 1, 1, 1, 1, 1,
-0.7093717, -0.2736047, -2.883239, 1, 1, 1, 1, 1,
-0.7076134, 0.7795107, 0.9663822, 1, 1, 1, 1, 1,
-0.7067428, -0.9832152, -3.079388, 1, 1, 1, 1, 1,
-0.7057762, 0.7509996, 0.2377271, 1, 1, 1, 1, 1,
-0.6990729, 1.020838, -1.383714, 1, 1, 1, 1, 1,
-0.6933063, -0.0697305, -0.977017, 1, 1, 1, 1, 1,
-0.6927125, 0.17269, -1.856516, 1, 1, 1, 1, 1,
-0.6914813, 0.03908178, -2.185208, 1, 1, 1, 1, 1,
-0.6812663, -1.265443, -2.953766, 1, 1, 1, 1, 1,
-0.6784468, -2.421952, -3.385954, 1, 1, 1, 1, 1,
-0.6685209, 0.1937327, -2.658653, 1, 1, 1, 1, 1,
-0.6660466, 0.2460198, -2.91848, 1, 1, 1, 1, 1,
-0.6643474, -0.02108715, -2.652524, 1, 1, 1, 1, 1,
-0.6605881, 0.1858505, -0.007111122, 1, 1, 1, 1, 1,
-0.6573837, 1.092206, -1.120857, 0, 0, 1, 1, 1,
-0.6562023, 0.4965242, -1.113373, 1, 0, 0, 1, 1,
-0.6506825, 0.0489215, -1.731254, 1, 0, 0, 1, 1,
-0.6487869, 1.336343, -0.5113859, 1, 0, 0, 1, 1,
-0.6446559, 0.3397564, -1.571174, 1, 0, 0, 1, 1,
-0.641337, -0.3379234, -2.164511, 1, 0, 0, 1, 1,
-0.6343341, -1.931362, -3.174625, 0, 0, 0, 1, 1,
-0.6273995, 0.2121746, -1.651598, 0, 0, 0, 1, 1,
-0.6247694, -0.9061648, -3.140805, 0, 0, 0, 1, 1,
-0.6228049, 0.2700446, -1.872409, 0, 0, 0, 1, 1,
-0.6205025, 0.8326488, -1.413905, 0, 0, 0, 1, 1,
-0.6191501, 0.5695142, -0.1851421, 0, 0, 0, 1, 1,
-0.6186697, -1.767883, -0.9780656, 0, 0, 0, 1, 1,
-0.6180527, -1.339179, -2.791944, 1, 1, 1, 1, 1,
-0.6172819, 1.743726, -1.129827, 1, 1, 1, 1, 1,
-0.6168406, -0.1930844, -3.374333, 1, 1, 1, 1, 1,
-0.6089651, 0.7341608, -0.7673447, 1, 1, 1, 1, 1,
-0.6057947, 1.153295, -1.99946, 1, 1, 1, 1, 1,
-0.6055425, -0.8077096, -2.849447, 1, 1, 1, 1, 1,
-0.6032967, 0.06364158, -3.621082, 1, 1, 1, 1, 1,
-0.6007197, -0.6514302, -0.08351918, 1, 1, 1, 1, 1,
-0.5989851, 0.3162321, -1.302142, 1, 1, 1, 1, 1,
-0.5970381, -0.4866005, -2.699464, 1, 1, 1, 1, 1,
-0.5918261, 0.2585565, -2.801574, 1, 1, 1, 1, 1,
-0.5830405, -0.393975, -2.166576, 1, 1, 1, 1, 1,
-0.5829805, 1.005339, -2.407693, 1, 1, 1, 1, 1,
-0.5823925, 0.4536028, -1.802148, 1, 1, 1, 1, 1,
-0.5821041, 1.16223, 0.0005923384, 1, 1, 1, 1, 1,
-0.5808529, -0.6049718, -4.309304, 0, 0, 1, 1, 1,
-0.5789278, 0.8649269, -0.2654916, 1, 0, 0, 1, 1,
-0.5768551, 0.1451906, -1.534182, 1, 0, 0, 1, 1,
-0.5646783, -0.9276006, -2.969798, 1, 0, 0, 1, 1,
-0.5596579, -0.4424324, -3.154753, 1, 0, 0, 1, 1,
-0.558573, 0.9155025, -0.8760261, 1, 0, 0, 1, 1,
-0.5556769, 0.6223374, -1.245542, 0, 0, 0, 1, 1,
-0.5495334, -1.527388, -2.737711, 0, 0, 0, 1, 1,
-0.548972, -0.0500297, -2.782389, 0, 0, 0, 1, 1,
-0.5474285, -0.1857527, -1.571663, 0, 0, 0, 1, 1,
-0.5383934, -1.289715, -2.754464, 0, 0, 0, 1, 1,
-0.533594, 0.7079368, -0.8765427, 0, 0, 0, 1, 1,
-0.5308442, -0.3643827, -4.472987, 0, 0, 0, 1, 1,
-0.5128097, -0.2988926, -1.829472, 1, 1, 1, 1, 1,
-0.5109537, 0.6573963, -1.036657, 1, 1, 1, 1, 1,
-0.5094109, -0.7353338, -4.234951, 1, 1, 1, 1, 1,
-0.5084749, 0.3188563, -1.245693, 1, 1, 1, 1, 1,
-0.5071766, -0.08120604, -1.604023, 1, 1, 1, 1, 1,
-0.504587, 2.184655, -0.5909081, 1, 1, 1, 1, 1,
-0.503889, -1.166319, -1.682226, 1, 1, 1, 1, 1,
-0.4988535, -1.735968, -5.057125, 1, 1, 1, 1, 1,
-0.4969223, -0.2352932, -2.990937, 1, 1, 1, 1, 1,
-0.4935374, 0.6591703, -1.505501, 1, 1, 1, 1, 1,
-0.4918799, -3.003262, -3.915111, 1, 1, 1, 1, 1,
-0.488167, -1.906859, -4.143477, 1, 1, 1, 1, 1,
-0.4879433, -0.4900277, -3.434501, 1, 1, 1, 1, 1,
-0.4862839, -0.3375096, -0.7602455, 1, 1, 1, 1, 1,
-0.4835433, 0.05355557, -1.663109, 1, 1, 1, 1, 1,
-0.4777192, 0.3455167, -0.3372157, 0, 0, 1, 1, 1,
-0.4768772, 1.540458, -0.6226065, 1, 0, 0, 1, 1,
-0.4763718, -0.2014465, -4.573922, 1, 0, 0, 1, 1,
-0.4727302, -0.06211779, -4.367251, 1, 0, 0, 1, 1,
-0.4715447, 0.2111794, 0.5007807, 1, 0, 0, 1, 1,
-0.4670133, 0.665845, 0.09146167, 1, 0, 0, 1, 1,
-0.4666114, 0.7854561, 0.07049302, 0, 0, 0, 1, 1,
-0.4662764, -0.6568558, -4.157366, 0, 0, 0, 1, 1,
-0.4659555, -1.70444, -1.704023, 0, 0, 0, 1, 1,
-0.4649313, -0.6067029, -1.906544, 0, 0, 0, 1, 1,
-0.4647072, 1.157579, -1.159086, 0, 0, 0, 1, 1,
-0.4632222, 0.8400838, -0.6864225, 0, 0, 0, 1, 1,
-0.4603309, 1.655172, -1.268155, 0, 0, 0, 1, 1,
-0.4554067, -1.322078, -5.283192, 1, 1, 1, 1, 1,
-0.4544816, -2.858007, -2.308257, 1, 1, 1, 1, 1,
-0.4540168, -0.6114701, -2.149376, 1, 1, 1, 1, 1,
-0.4537885, 0.1458999, -3.413286, 1, 1, 1, 1, 1,
-0.4491212, -0.4481733, -3.379802, 1, 1, 1, 1, 1,
-0.4438546, 2.645467, -0.7663618, 1, 1, 1, 1, 1,
-0.4412939, 0.139878, -1.849842, 1, 1, 1, 1, 1,
-0.4412869, 0.1474762, -0.887375, 1, 1, 1, 1, 1,
-0.4367651, -0.1854438, -2.570349, 1, 1, 1, 1, 1,
-0.434713, 1.409121, 0.9938163, 1, 1, 1, 1, 1,
-0.4299972, -1.371284, -3.820231, 1, 1, 1, 1, 1,
-0.4261845, 0.2469854, -0.4806247, 1, 1, 1, 1, 1,
-0.4242977, 0.5163579, -2.159995, 1, 1, 1, 1, 1,
-0.4141184, 1.059386, -1.491682, 1, 1, 1, 1, 1,
-0.4101305, -0.9423414, -0.9026103, 1, 1, 1, 1, 1,
-0.4080612, -1.547742, -3.721364, 0, 0, 1, 1, 1,
-0.4031934, -0.6856892, -2.8518, 1, 0, 0, 1, 1,
-0.397915, -1.273191, -2.829372, 1, 0, 0, 1, 1,
-0.3960962, 0.2638715, -0.7481701, 1, 0, 0, 1, 1,
-0.3960845, -1.174417, -3.233322, 1, 0, 0, 1, 1,
-0.3929717, -1.586682, -3.181216, 1, 0, 0, 1, 1,
-0.3871419, -1.0276, -2.777739, 0, 0, 0, 1, 1,
-0.3861021, 1.135257, 1.738586, 0, 0, 0, 1, 1,
-0.3824714, -1.550572, -3.757448, 0, 0, 0, 1, 1,
-0.3758479, -0.1836223, 0.1302209, 0, 0, 0, 1, 1,
-0.3722298, -0.07566506, -1.269341, 0, 0, 0, 1, 1,
-0.3717183, -1.074554, -1.738505, 0, 0, 0, 1, 1,
-0.3696728, 1.071104, -1.718356, 0, 0, 0, 1, 1,
-0.3668653, -1.328764, -3.642311, 1, 1, 1, 1, 1,
-0.3654196, -0.8790041, -3.0481, 1, 1, 1, 1, 1,
-0.3647726, -0.795287, -2.745281, 1, 1, 1, 1, 1,
-0.3627899, 0.6769355, 1.396186, 1, 1, 1, 1, 1,
-0.3621989, -0.07311461, -0.09723794, 1, 1, 1, 1, 1,
-0.354153, 1.061031, -0.3275161, 1, 1, 1, 1, 1,
-0.3530042, 0.4801562, 0.6407534, 1, 1, 1, 1, 1,
-0.3523072, -0.1274432, -2.443573, 1, 1, 1, 1, 1,
-0.3490257, -0.8235354, -4.436369, 1, 1, 1, 1, 1,
-0.3487382, -0.9443686, -2.499171, 1, 1, 1, 1, 1,
-0.3471381, 0.3041574, 0.2535283, 1, 1, 1, 1, 1,
-0.3454432, 0.7403292, -0.639587, 1, 1, 1, 1, 1,
-0.3453408, 1.383454, -0.8208212, 1, 1, 1, 1, 1,
-0.3383554, -0.6197423, -2.199049, 1, 1, 1, 1, 1,
-0.3365852, 2.804189, -0.5079595, 1, 1, 1, 1, 1,
-0.3341676, -1.618414, -4.312908, 0, 0, 1, 1, 1,
-0.3258872, -0.1427705, -1.934313, 1, 0, 0, 1, 1,
-0.3228552, -0.7399081, -3.178853, 1, 0, 0, 1, 1,
-0.3213181, 0.3426377, -0.2768478, 1, 0, 0, 1, 1,
-0.3193826, 0.4982049, -0.6176867, 1, 0, 0, 1, 1,
-0.309657, 1.151422, -1.97698, 1, 0, 0, 1, 1,
-0.3086267, 0.243773, -1.980594, 0, 0, 0, 1, 1,
-0.3024778, -1.718818, -2.552123, 0, 0, 0, 1, 1,
-0.2940673, -0.1885834, 0.3526534, 0, 0, 0, 1, 1,
-0.2932528, -1.21831, -1.680508, 0, 0, 0, 1, 1,
-0.2881098, -0.7476758, -3.833833, 0, 0, 0, 1, 1,
-0.287724, -0.7099769, -2.461583, 0, 0, 0, 1, 1,
-0.2844592, -1.045481, -3.737101, 0, 0, 0, 1, 1,
-0.2772498, -0.1674256, -0.679514, 1, 1, 1, 1, 1,
-0.2695267, 0.4678357, -1.37992, 1, 1, 1, 1, 1,
-0.2690168, -0.4430968, -0.4504961, 1, 1, 1, 1, 1,
-0.2685785, -1.211747, -2.210357, 1, 1, 1, 1, 1,
-0.2685426, 0.8591034, 0.6663961, 1, 1, 1, 1, 1,
-0.2679728, -1.661623, -3.319655, 1, 1, 1, 1, 1,
-0.2657691, 0.3378909, -0.5240021, 1, 1, 1, 1, 1,
-0.2648947, 0.7212368, -2.166154, 1, 1, 1, 1, 1,
-0.2614327, -0.590565, -2.029803, 1, 1, 1, 1, 1,
-0.2605309, -1.797779, -3.642558, 1, 1, 1, 1, 1,
-0.256512, -0.2164138, -1.93209, 1, 1, 1, 1, 1,
-0.2549789, 1.098665, 0.6453415, 1, 1, 1, 1, 1,
-0.2533097, 0.0220061, -1.886215, 1, 1, 1, 1, 1,
-0.2530139, -1.077167, -2.219662, 1, 1, 1, 1, 1,
-0.2501279, -0.2006595, -2.315133, 1, 1, 1, 1, 1,
-0.2489278, 0.7039607, 1.29698, 0, 0, 1, 1, 1,
-0.2485884, -0.3535803, -1.302994, 1, 0, 0, 1, 1,
-0.2473456, -1.159884, -4.135012, 1, 0, 0, 1, 1,
-0.2472294, -0.4258526, -2.703511, 1, 0, 0, 1, 1,
-0.2419242, 0.7074672, -0.4221426, 1, 0, 0, 1, 1,
-0.2385822, -0.06303304, -2.281595, 1, 0, 0, 1, 1,
-0.2370213, -0.3808395, -3.309153, 0, 0, 0, 1, 1,
-0.2367197, -0.3564132, -3.095744, 0, 0, 0, 1, 1,
-0.2359158, 1.406513, -0.7212489, 0, 0, 0, 1, 1,
-0.2336048, -0.8835077, -3.675263, 0, 0, 0, 1, 1,
-0.2331883, -0.5141951, -1.618863, 0, 0, 0, 1, 1,
-0.2331192, -1.311568, -3.657241, 0, 0, 0, 1, 1,
-0.2330583, 0.86862, -0.9067692, 0, 0, 0, 1, 1,
-0.2318578, 0.2370297, -1.531595, 1, 1, 1, 1, 1,
-0.2314468, 0.2988648, -1.356264, 1, 1, 1, 1, 1,
-0.2299645, 1.888117, 1.095479, 1, 1, 1, 1, 1,
-0.2258495, 1.289215, -0.5096571, 1, 1, 1, 1, 1,
-0.2179441, 0.5388991, -0.2319527, 1, 1, 1, 1, 1,
-0.2170946, -0.7439587, -3.164429, 1, 1, 1, 1, 1,
-0.2166274, -1.267903, -3.501541, 1, 1, 1, 1, 1,
-0.216403, -0.06718572, -2.192408, 1, 1, 1, 1, 1,
-0.2162619, -0.8594458, -1.270977, 1, 1, 1, 1, 1,
-0.213781, -0.7821489, -2.726805, 1, 1, 1, 1, 1,
-0.2134023, -2.166005, -3.224587, 1, 1, 1, 1, 1,
-0.2109445, -0.6801279, -2.921786, 1, 1, 1, 1, 1,
-0.2065374, 0.5296626, -1.367769, 1, 1, 1, 1, 1,
-0.205713, 0.9728276, 1.171606, 1, 1, 1, 1, 1,
-0.2052373, -0.6223075, -3.106219, 1, 1, 1, 1, 1,
-0.2012533, 0.5616323, 0.4366109, 0, 0, 1, 1, 1,
-0.1974733, -0.7179636, -4.568256, 1, 0, 0, 1, 1,
-0.1957746, -0.8077316, -3.027592, 1, 0, 0, 1, 1,
-0.1925931, -1.267323, -2.195603, 1, 0, 0, 1, 1,
-0.1924149, 0.1070038, -0.3175131, 1, 0, 0, 1, 1,
-0.182556, -0.2430269, -1.829667, 1, 0, 0, 1, 1,
-0.1803326, -0.4071522, -5.362585, 0, 0, 0, 1, 1,
-0.1801676, -0.1407931, -3.81756, 0, 0, 0, 1, 1,
-0.1790922, -0.1882845, -1.567598, 0, 0, 0, 1, 1,
-0.1764736, -0.5686756, -2.672511, 0, 0, 0, 1, 1,
-0.1733644, 0.06735647, -4.188511, 0, 0, 0, 1, 1,
-0.1706035, -0.935684, -3.479537, 0, 0, 0, 1, 1,
-0.1698129, -2.208781, -3.358099, 0, 0, 0, 1, 1,
-0.1695811, -1.420147, -3.835, 1, 1, 1, 1, 1,
-0.1657729, 0.6852846, 0.01000237, 1, 1, 1, 1, 1,
-0.1648529, 0.9425071, -1.333117, 1, 1, 1, 1, 1,
-0.1613916, 0.6029403, -1.972592, 1, 1, 1, 1, 1,
-0.1611532, 0.2511158, 1.588809, 1, 1, 1, 1, 1,
-0.1603327, 0.4992616, -1.279721, 1, 1, 1, 1, 1,
-0.1592719, -1.654828, -2.847071, 1, 1, 1, 1, 1,
-0.1586103, 0.4989393, 0.5153821, 1, 1, 1, 1, 1,
-0.1573563, 0.9304051, -0.6567752, 1, 1, 1, 1, 1,
-0.1567898, 0.4210171, 0.1117125, 1, 1, 1, 1, 1,
-0.1548761, -1.025048, -5.645555, 1, 1, 1, 1, 1,
-0.1496704, 1.079299, -0.3615272, 1, 1, 1, 1, 1,
-0.1486239, -0.6345143, -3.778849, 1, 1, 1, 1, 1,
-0.1432762, -0.02394653, -2.243415, 1, 1, 1, 1, 1,
-0.1429283, -0.7083352, -1.503746, 1, 1, 1, 1, 1,
-0.1408916, -1.106827, -2.153939, 0, 0, 1, 1, 1,
-0.1404237, 0.5918852, 1.168912, 1, 0, 0, 1, 1,
-0.1398698, 0.2191562, -2.863793, 1, 0, 0, 1, 1,
-0.1396201, 0.5587907, 0.3050551, 1, 0, 0, 1, 1,
-0.1394611, 1.39335, -0.007558077, 1, 0, 0, 1, 1,
-0.1379638, 0.494956, -0.8232278, 1, 0, 0, 1, 1,
-0.1365465, -0.5723894, -3.750463, 0, 0, 0, 1, 1,
-0.1355797, 1.036384, 1.014816, 0, 0, 0, 1, 1,
-0.1316152, -0.1396889, -3.664063, 0, 0, 0, 1, 1,
-0.1289462, 1.134814, -0.455017, 0, 0, 0, 1, 1,
-0.1272302, -0.8006876, -1.862555, 0, 0, 0, 1, 1,
-0.1224995, -0.8160222, -2.070283, 0, 0, 0, 1, 1,
-0.1211253, 0.6872512, 0.9877073, 0, 0, 0, 1, 1,
-0.1165712, 2.000224, -1.538426, 1, 1, 1, 1, 1,
-0.115364, -1.256354, -3.625658, 1, 1, 1, 1, 1,
-0.1142318, -0.687311, -5.464444, 1, 1, 1, 1, 1,
-0.1115445, 1.351332, 0.5773133, 1, 1, 1, 1, 1,
-0.1105108, 0.752663, 2.133334, 1, 1, 1, 1, 1,
-0.1095123, -0.1497281, -2.340386, 1, 1, 1, 1, 1,
-0.1084253, 0.4948638, 0.2948728, 1, 1, 1, 1, 1,
-0.1074572, 3.20564, 0.423587, 1, 1, 1, 1, 1,
-0.1006642, -0.9783576, -2.737, 1, 1, 1, 1, 1,
-0.1002799, 0.8074468, 0.6617394, 1, 1, 1, 1, 1,
-0.09997719, 0.596675, -0.6938419, 1, 1, 1, 1, 1,
-0.09759381, -0.9311391, -4.812274, 1, 1, 1, 1, 1,
-0.09722365, 0.3701056, 0.7529899, 1, 1, 1, 1, 1,
-0.09347823, -0.09598339, -2.492682, 1, 1, 1, 1, 1,
-0.09099253, -0.5912019, -2.510072, 1, 1, 1, 1, 1,
-0.09047622, -0.07573462, -1.693678, 0, 0, 1, 1, 1,
-0.07713301, 1.637339, -0.5964895, 1, 0, 0, 1, 1,
-0.0686595, -0.7825234, -3.089354, 1, 0, 0, 1, 1,
-0.06752116, -2.681831, -3.603766, 1, 0, 0, 1, 1,
-0.06279332, -0.09975252, -0.7004709, 1, 0, 0, 1, 1,
-0.06070807, 0.2580769, -1.506378, 1, 0, 0, 1, 1,
-0.05353811, 1.187017, 0.1851778, 0, 0, 0, 1, 1,
-0.05328653, -0.3653358, -3.404785, 0, 0, 0, 1, 1,
-0.04942721, 0.22737, -2.111917, 0, 0, 0, 1, 1,
-0.04504685, 0.7074347, 0.4066036, 0, 0, 0, 1, 1,
-0.03964349, 0.2109261, -0.8785167, 0, 0, 0, 1, 1,
-0.03834331, 0.8372284, -1.371338, 0, 0, 0, 1, 1,
-0.03753217, -0.7662332, -2.936668, 0, 0, 0, 1, 1,
-0.03629058, 1.105426, 0.5472685, 1, 1, 1, 1, 1,
-0.03390234, 0.01530929, -0.8516727, 1, 1, 1, 1, 1,
-0.03280314, -0.4822739, -4.14392, 1, 1, 1, 1, 1,
-0.03046854, -0.8945492, -3.408285, 1, 1, 1, 1, 1,
-0.02775173, -0.9686964, -0.30268, 1, 1, 1, 1, 1,
-0.02689696, -0.8341664, -3.587704, 1, 1, 1, 1, 1,
-0.02615233, 0.8057896, -0.6623293, 1, 1, 1, 1, 1,
-0.02391405, 0.8825303, 0.9328398, 1, 1, 1, 1, 1,
-0.02248161, -3.009988, -1.925634, 1, 1, 1, 1, 1,
-0.02235674, -0.1040129, -2.775882, 1, 1, 1, 1, 1,
-0.02159437, -1.609953, -3.279747, 1, 1, 1, 1, 1,
-0.0208075, -0.6909435, -3.67189, 1, 1, 1, 1, 1,
-0.01972772, -0.5625825, -2.858046, 1, 1, 1, 1, 1,
-0.01752205, 1.188262, 1.35618, 1, 1, 1, 1, 1,
-0.0174115, -0.02205782, -2.083246, 1, 1, 1, 1, 1,
-0.01688846, 0.6147777, -0.2767445, 0, 0, 1, 1, 1,
-0.01519311, 2.161129, 0.4990311, 1, 0, 0, 1, 1,
-0.01279055, -1.30693, -5.580816, 1, 0, 0, 1, 1,
-0.01129267, -1.419142, -6.10813, 1, 0, 0, 1, 1,
-0.007810432, -0.4266777, -3.54152, 1, 0, 0, 1, 1,
-0.007668134, -1.932554, -2.79319, 1, 0, 0, 1, 1,
-0.007572623, -1.690642, -2.364262, 0, 0, 0, 1, 1,
-0.003880173, -0.9327557, -3.521376, 0, 0, 0, 1, 1,
-0.002820619, -0.152824, -2.516075, 0, 0, 0, 1, 1,
0.00575753, 0.4398915, -0.7416815, 0, 0, 0, 1, 1,
0.00920057, -0.03103352, 2.407331, 0, 0, 0, 1, 1,
0.01012741, -0.6764023, 2.491656, 0, 0, 0, 1, 1,
0.01216132, 0.8321652, -0.3058483, 0, 0, 0, 1, 1,
0.01282419, 0.8632478, 0.1237329, 1, 1, 1, 1, 1,
0.01562612, -2.479118, 1.981402, 1, 1, 1, 1, 1,
0.01600469, 0.1014518, 0.4736094, 1, 1, 1, 1, 1,
0.0161743, 0.1958627, -1.207641, 1, 1, 1, 1, 1,
0.03373794, 1.597315, 0.3447679, 1, 1, 1, 1, 1,
0.03478638, 0.6049079, -0.641321, 1, 1, 1, 1, 1,
0.03805029, -0.4718359, 2.871693, 1, 1, 1, 1, 1,
0.0389181, -0.6668736, 3.743799, 1, 1, 1, 1, 1,
0.04510306, 0.31688, 1.347127, 1, 1, 1, 1, 1,
0.04698037, -0.8026658, 2.769599, 1, 1, 1, 1, 1,
0.05330545, 1.55127, -1.442936, 1, 1, 1, 1, 1,
0.05657459, -0.3838756, 2.364311, 1, 1, 1, 1, 1,
0.05683152, 1.967228, 0.4230347, 1, 1, 1, 1, 1,
0.05696126, -0.6104116, 0.9244406, 1, 1, 1, 1, 1,
0.06149482, 3.795196, -0.9889148, 1, 1, 1, 1, 1,
0.06161167, 1.030701, 0.6804731, 0, 0, 1, 1, 1,
0.06291823, -0.05977586, 2.240043, 1, 0, 0, 1, 1,
0.08869973, 0.6540192, 0.4799017, 1, 0, 0, 1, 1,
0.0928595, -0.55304, 2.81279, 1, 0, 0, 1, 1,
0.0939777, -0.02418599, 1.331324, 1, 0, 0, 1, 1,
0.09415751, 0.06598561, 1.872436, 1, 0, 0, 1, 1,
0.09480722, 0.8505797, 1.720216, 0, 0, 0, 1, 1,
0.09487917, 0.00377018, 3.344007, 0, 0, 0, 1, 1,
0.09489385, -2.00207, 2.357048, 0, 0, 0, 1, 1,
0.09795982, 0.8483405, -0.3872938, 0, 0, 0, 1, 1,
0.09798253, -0.1463253, 2.61074, 0, 0, 0, 1, 1,
0.09862955, 0.1158626, 0.1609391, 0, 0, 0, 1, 1,
0.09949441, -0.09060967, 3.604699, 0, 0, 0, 1, 1,
0.1031805, -1.458792, 3.523087, 1, 1, 1, 1, 1,
0.104964, 0.009467643, 2.328895, 1, 1, 1, 1, 1,
0.1050117, 1.123508, 0.6008745, 1, 1, 1, 1, 1,
0.1096827, 0.4497686, 1.167853, 1, 1, 1, 1, 1,
0.110919, -0.8164284, 1.440162, 1, 1, 1, 1, 1,
0.1125057, 0.5359922, 0.7655831, 1, 1, 1, 1, 1,
0.1128654, 0.1818538, 1.167961, 1, 1, 1, 1, 1,
0.1157347, 0.3964165, 0.2264566, 1, 1, 1, 1, 1,
0.1210294, 0.01407406, 2.865046, 1, 1, 1, 1, 1,
0.1215683, 0.4807467, 0.1407647, 1, 1, 1, 1, 1,
0.1242513, -2.077853, 3.490648, 1, 1, 1, 1, 1,
0.1268405, -1.657049, 2.676627, 1, 1, 1, 1, 1,
0.1343706, 0.4742737, -0.6610663, 1, 1, 1, 1, 1,
0.1408058, -0.4106925, 1.711552, 1, 1, 1, 1, 1,
0.1416734, 0.1320841, 1.101639, 1, 1, 1, 1, 1,
0.1436852, -0.2708902, 2.765596, 0, 0, 1, 1, 1,
0.148297, 0.0553414, 0.298255, 1, 0, 0, 1, 1,
0.1486861, 0.1183799, 0.9854794, 1, 0, 0, 1, 1,
0.1487633, 1.307767, 1.549491, 1, 0, 0, 1, 1,
0.1527162, 0.6579363, -0.4534776, 1, 0, 0, 1, 1,
0.1572029, -0.3079618, 2.146333, 1, 0, 0, 1, 1,
0.1586523, -0.6066115, 1.525975, 0, 0, 0, 1, 1,
0.1623198, 1.669785, 0.5434343, 0, 0, 0, 1, 1,
0.16422, -1.246222, 3.507802, 0, 0, 0, 1, 1,
0.1695378, -1.038512, 2.935245, 0, 0, 0, 1, 1,
0.1704969, 0.3492661, 0.1724784, 0, 0, 0, 1, 1,
0.174392, 0.7107497, 0.8030061, 0, 0, 0, 1, 1,
0.1752453, 0.4859309, -0.8403451, 0, 0, 0, 1, 1,
0.1765174, 0.2663069, 1.266548, 1, 1, 1, 1, 1,
0.1788721, -0.3827678, 2.770166, 1, 1, 1, 1, 1,
0.1819772, 0.1404209, 0.3892822, 1, 1, 1, 1, 1,
0.1880952, 0.5338858, 2.238328, 1, 1, 1, 1, 1,
0.1904106, -0.4410697, 2.446345, 1, 1, 1, 1, 1,
0.1936572, -0.447989, 3.588372, 1, 1, 1, 1, 1,
0.2064747, -0.2545739, 3.003475, 1, 1, 1, 1, 1,
0.2122331, -1.5634, 2.1061, 1, 1, 1, 1, 1,
0.2129573, -0.6175935, 2.737617, 1, 1, 1, 1, 1,
0.2133103, -1.414984, 3.219454, 1, 1, 1, 1, 1,
0.217097, -1.737997, 2.793576, 1, 1, 1, 1, 1,
0.2180145, -0.2336914, 3.17698, 1, 1, 1, 1, 1,
0.222572, -0.8259845, 4.429331, 1, 1, 1, 1, 1,
0.2234672, -0.4991097, 3.287635, 1, 1, 1, 1, 1,
0.2287196, -0.3061747, 1.916554, 1, 1, 1, 1, 1,
0.2340687, -0.2057553, 2.670391, 0, 0, 1, 1, 1,
0.23482, 0.1635778, 0.1010591, 1, 0, 0, 1, 1,
0.2348364, 0.2502032, 1.7715, 1, 0, 0, 1, 1,
0.2361075, 0.4835762, -0.8989628, 1, 0, 0, 1, 1,
0.2366294, -0.02055929, -1.189703, 1, 0, 0, 1, 1,
0.2377407, -0.4915079, 2.300333, 1, 0, 0, 1, 1,
0.2408772, -0.5985117, 0.3979553, 0, 0, 0, 1, 1,
0.2440441, -2.164124, 0.9673663, 0, 0, 0, 1, 1,
0.25686, 0.1069854, 1.548276, 0, 0, 0, 1, 1,
0.2596328, 1.205722, 1.998867, 0, 0, 0, 1, 1,
0.2634749, -1.325242, 4.281788, 0, 0, 0, 1, 1,
0.2664214, 1.223064, 0.1285155, 0, 0, 0, 1, 1,
0.2691416, -0.4250096, 1.177324, 0, 0, 0, 1, 1,
0.2745508, -0.8546689, 3.064928, 1, 1, 1, 1, 1,
0.2748835, 0.1459984, -0.1633004, 1, 1, 1, 1, 1,
0.276555, 1.45485, 1.243353, 1, 1, 1, 1, 1,
0.277983, -0.2559228, 2.404917, 1, 1, 1, 1, 1,
0.2814194, 0.215587, 1.85173, 1, 1, 1, 1, 1,
0.2823503, -1.542091, 5.935576, 1, 1, 1, 1, 1,
0.2832141, 0.1259963, -0.1779269, 1, 1, 1, 1, 1,
0.2876767, 0.5831996, 0.6274487, 1, 1, 1, 1, 1,
0.2881431, 0.03822894, 2.467341, 1, 1, 1, 1, 1,
0.2913503, 1.229043, -1.467212, 1, 1, 1, 1, 1,
0.2982538, 0.1578745, 1.392967, 1, 1, 1, 1, 1,
0.2996158, 0.4765219, -0.2255402, 1, 1, 1, 1, 1,
0.3047895, 0.000603664, 0.2670272, 1, 1, 1, 1, 1,
0.3062592, -2.407694, 3.018187, 1, 1, 1, 1, 1,
0.3071929, -1.254197, 1.719147, 1, 1, 1, 1, 1,
0.3081183, 0.4443865, 1.285246, 0, 0, 1, 1, 1,
0.3088221, -1.256088, 3.057557, 1, 0, 0, 1, 1,
0.3107127, -0.6452933, 3.149983, 1, 0, 0, 1, 1,
0.3107448, 1.638766, 1.075973, 1, 0, 0, 1, 1,
0.3161967, -1.331345, 1.55791, 1, 0, 0, 1, 1,
0.3164083, -0.3045037, 2.763424, 1, 0, 0, 1, 1,
0.3170427, -1.095034, 2.207461, 0, 0, 0, 1, 1,
0.3193974, -0.7265738, 2.513498, 0, 0, 0, 1, 1,
0.320801, -0.8697875, 0.953676, 0, 0, 0, 1, 1,
0.3309929, -0.9581209, 3.26909, 0, 0, 0, 1, 1,
0.3318273, 0.02478004, 1.051512, 0, 0, 0, 1, 1,
0.3326623, -0.141476, 2.335671, 0, 0, 0, 1, 1,
0.3343304, -0.4033423, 1.725381, 0, 0, 0, 1, 1,
0.3359254, 1.232156, 0.676587, 1, 1, 1, 1, 1,
0.3364265, 0.131883, 1.119855, 1, 1, 1, 1, 1,
0.3380406, -0.8131917, 2.611245, 1, 1, 1, 1, 1,
0.3381965, 2.167391, -0.1694257, 1, 1, 1, 1, 1,
0.33922, 1.611871, 0.3955046, 1, 1, 1, 1, 1,
0.3406624, 0.1831548, -0.9924013, 1, 1, 1, 1, 1,
0.3419692, -1.504461, 2.54552, 1, 1, 1, 1, 1,
0.343028, 0.5264343, -1.138909, 1, 1, 1, 1, 1,
0.3479122, -0.776702, 4.716557, 1, 1, 1, 1, 1,
0.359304, -1.138852, 2.168632, 1, 1, 1, 1, 1,
0.3635913, -0.7215568, 1.458342, 1, 1, 1, 1, 1,
0.3661827, 0.260471, 2.215108, 1, 1, 1, 1, 1,
0.3750838, -1.952326, 4.683382, 1, 1, 1, 1, 1,
0.3766397, 1.152301, -1.21177, 1, 1, 1, 1, 1,
0.3782448, -0.9686685, 2.508684, 1, 1, 1, 1, 1,
0.3786316, -0.8187157, 3.51556, 0, 0, 1, 1, 1,
0.384034, -0.6802853, 1.898353, 1, 0, 0, 1, 1,
0.3905865, -1.052149, 4.244837, 1, 0, 0, 1, 1,
0.3941959, 1.537969, 0.7105494, 1, 0, 0, 1, 1,
0.3943839, 1.106908, 1.655573, 1, 0, 0, 1, 1,
0.3953506, 0.1988425, 0.9221232, 1, 0, 0, 1, 1,
0.4027405, 0.4528474, -0.7470337, 0, 0, 0, 1, 1,
0.4046923, 0.6799645, 1.425637, 0, 0, 0, 1, 1,
0.4065717, 0.632552, 1.422452, 0, 0, 0, 1, 1,
0.4134101, 0.5299497, 0.8472691, 0, 0, 0, 1, 1,
0.4143144, 0.08012391, 2.568334, 0, 0, 0, 1, 1,
0.4162565, -0.4636601, 1.665939, 0, 0, 0, 1, 1,
0.4179004, -0.2043184, 2.520496, 0, 0, 0, 1, 1,
0.4220723, -0.213681, 1.998073, 1, 1, 1, 1, 1,
0.4231783, 1.6822, -0.1095777, 1, 1, 1, 1, 1,
0.4236853, -0.4549376, 4.824551, 1, 1, 1, 1, 1,
0.4243131, 1.749279, 0.3893759, 1, 1, 1, 1, 1,
0.4273303, -0.7326459, 3.40328, 1, 1, 1, 1, 1,
0.4290509, -0.7343829, 1.84241, 1, 1, 1, 1, 1,
0.4362088, 0.7463253, 2.542871, 1, 1, 1, 1, 1,
0.4378595, 0.4652412, -0.009944384, 1, 1, 1, 1, 1,
0.4381893, -1.140799, 3.16365, 1, 1, 1, 1, 1,
0.4405295, 2.207167, -1.299034, 1, 1, 1, 1, 1,
0.4418362, -1.15687, 2.354664, 1, 1, 1, 1, 1,
0.4474077, 0.240311, -0.342379, 1, 1, 1, 1, 1,
0.4490569, 0.1644073, 1.524547, 1, 1, 1, 1, 1,
0.4529172, 0.1833536, -1.380192, 1, 1, 1, 1, 1,
0.4536872, 0.9202501, 0.4092719, 1, 1, 1, 1, 1,
0.4606063, 0.2234432, 2.080956, 0, 0, 1, 1, 1,
0.4660943, -0.862834, 2.554787, 1, 0, 0, 1, 1,
0.4678843, 0.003415279, 1.50621, 1, 0, 0, 1, 1,
0.4688206, -1.005957, 3.750533, 1, 0, 0, 1, 1,
0.4695571, -0.0790397, 0.6928276, 1, 0, 0, 1, 1,
0.4720512, -0.5604254, 2.049842, 1, 0, 0, 1, 1,
0.4772617, -0.3651833, 2.410915, 0, 0, 0, 1, 1,
0.4804866, 0.6436213, 0.03373025, 0, 0, 0, 1, 1,
0.4805702, -0.6070423, 1.212913, 0, 0, 0, 1, 1,
0.4826176, 1.740342, -0.2411168, 0, 0, 0, 1, 1,
0.4846003, 0.8096952, -0.1283658, 0, 0, 0, 1, 1,
0.4857659, -0.3531039, 0.8987189, 0, 0, 0, 1, 1,
0.4858826, -0.09477098, 2.587236, 0, 0, 0, 1, 1,
0.4891856, -0.7483727, 1.517638, 1, 1, 1, 1, 1,
0.4914856, -0.3302442, 2.162086, 1, 1, 1, 1, 1,
0.4966943, -0.005449049, 2.236031, 1, 1, 1, 1, 1,
0.4992566, 0.1858929, 1.533685, 1, 1, 1, 1, 1,
0.500872, -0.7317182, 3.6732, 1, 1, 1, 1, 1,
0.503667, -1.691026, 3.786381, 1, 1, 1, 1, 1,
0.5037103, 0.7243506, -2.255589, 1, 1, 1, 1, 1,
0.5050026, 0.1870279, 1.278676, 1, 1, 1, 1, 1,
0.5083985, -1.20523, 3.512351, 1, 1, 1, 1, 1,
0.5138795, 0.4497979, 2.231023, 1, 1, 1, 1, 1,
0.5157794, -0.3343323, 1.935246, 1, 1, 1, 1, 1,
0.5185164, -1.356169, 4.418805, 1, 1, 1, 1, 1,
0.5206817, 0.27441, 1.533208, 1, 1, 1, 1, 1,
0.5225415, -0.08415665, 1.364197, 1, 1, 1, 1, 1,
0.5270566, 0.1009916, 0.2381137, 1, 1, 1, 1, 1,
0.5294349, -0.03382455, 1.298837, 0, 0, 1, 1, 1,
0.5295579, -0.03750908, 1.759091, 1, 0, 0, 1, 1,
0.5311642, -1.503746, 1.562175, 1, 0, 0, 1, 1,
0.5336593, -0.2431048, 2.538435, 1, 0, 0, 1, 1,
0.53368, -1.003027, 0.7419807, 1, 0, 0, 1, 1,
0.5338315, -0.9017369, 1.727329, 1, 0, 0, 1, 1,
0.535831, 2.096842, 0.8363617, 0, 0, 0, 1, 1,
0.5413716, 0.8776863, 1.045025, 0, 0, 0, 1, 1,
0.542191, 0.9948769, -0.8856429, 0, 0, 0, 1, 1,
0.5425286, -0.7300279, 1.567963, 0, 0, 0, 1, 1,
0.5454829, -0.6478615, 2.429702, 0, 0, 0, 1, 1,
0.5455964, 1.978058, 0.4792223, 0, 0, 0, 1, 1,
0.5465266, 1.018369, 0.7522932, 0, 0, 0, 1, 1,
0.5514053, 0.6744636, 0.452392, 1, 1, 1, 1, 1,
0.5538707, -2.439981, 2.644398, 1, 1, 1, 1, 1,
0.5553948, 1.046857, 0.6632221, 1, 1, 1, 1, 1,
0.5618817, -0.6094675, 1.986828, 1, 1, 1, 1, 1,
0.562479, -1.139448, 2.317068, 1, 1, 1, 1, 1,
0.5645429, 0.4722397, -0.1517068, 1, 1, 1, 1, 1,
0.5724249, -2.093911, 1.860186, 1, 1, 1, 1, 1,
0.5734391, -0.9221746, 3.383312, 1, 1, 1, 1, 1,
0.5759255, 2.337551, 1.022625, 1, 1, 1, 1, 1,
0.5780498, 0.371452, 0.839414, 1, 1, 1, 1, 1,
0.5792799, -1.627897, 1.167134, 1, 1, 1, 1, 1,
0.5839611, -1.688232, 3.753499, 1, 1, 1, 1, 1,
0.589168, 0.494605, 0.2734007, 1, 1, 1, 1, 1,
0.5934256, -0.8435327, 3.499988, 1, 1, 1, 1, 1,
0.5934908, 0.06420127, 2.882516, 1, 1, 1, 1, 1,
0.5964315, -1.400828, 2.686748, 0, 0, 1, 1, 1,
0.6010269, -0.6685807, 2.854314, 1, 0, 0, 1, 1,
0.6011702, 1.303276, -0.638226, 1, 0, 0, 1, 1,
0.604392, -1.253628, 2.506123, 1, 0, 0, 1, 1,
0.6053815, 0.06904745, 0.8375289, 1, 0, 0, 1, 1,
0.6054043, 0.189527, 1.104118, 1, 0, 0, 1, 1,
0.6054711, -0.06462162, 1.591693, 0, 0, 0, 1, 1,
0.6055672, -0.4740708, 2.008179, 0, 0, 0, 1, 1,
0.6067101, 0.1060972, 2.240248, 0, 0, 0, 1, 1,
0.6096249, 0.04374303, 0.9205475, 0, 0, 0, 1, 1,
0.6107975, -0.2727361, 2.120642, 0, 0, 0, 1, 1,
0.6152613, -0.3649218, 3.231795, 0, 0, 0, 1, 1,
0.6267123, 1.450685, -0.5803776, 0, 0, 0, 1, 1,
0.6289133, -1.249764, 3.159238, 1, 1, 1, 1, 1,
0.6300081, -0.06464298, 2.358, 1, 1, 1, 1, 1,
0.6302543, -1.964277, 2.944921, 1, 1, 1, 1, 1,
0.6330649, -1.834639, 3.012182, 1, 1, 1, 1, 1,
0.6346566, 0.4727224, 0.6540418, 1, 1, 1, 1, 1,
0.6361116, -1.347881, 4.525895, 1, 1, 1, 1, 1,
0.6395359, 2.046386, 1.887891, 1, 1, 1, 1, 1,
0.6415818, 0.3446398, 2.32596, 1, 1, 1, 1, 1,
0.6437849, -1.638692, 3.205544, 1, 1, 1, 1, 1,
0.6449846, 0.9062575, 0.6533744, 1, 1, 1, 1, 1,
0.648544, 1.754502, 1.453515, 1, 1, 1, 1, 1,
0.6492037, -1.278046, 3.093163, 1, 1, 1, 1, 1,
0.6545125, -0.2915141, 2.031202, 1, 1, 1, 1, 1,
0.6547793, 0.5962796, 1.831338, 1, 1, 1, 1, 1,
0.6559551, -0.1756358, 1.174414, 1, 1, 1, 1, 1,
0.6574291, 0.486859, 1.645176, 0, 0, 1, 1, 1,
0.6577036, -0.6534258, 3.049731, 1, 0, 0, 1, 1,
0.6593428, 0.336847, 0.6909183, 1, 0, 0, 1, 1,
0.6664971, 0.8294786, 1.175281, 1, 0, 0, 1, 1,
0.678893, 0.4230012, 1.266765, 1, 0, 0, 1, 1,
0.6949887, -0.3810892, 2.358116, 1, 0, 0, 1, 1,
0.6992238, -0.4060079, 1.707623, 0, 0, 0, 1, 1,
0.7003323, 0.4353982, 0.4079678, 0, 0, 0, 1, 1,
0.7020139, 0.2603474, 1.842788, 0, 0, 0, 1, 1,
0.7059166, -1.398015, 2.330092, 0, 0, 0, 1, 1,
0.7169753, 0.208601, 2.287305, 0, 0, 0, 1, 1,
0.7277603, 0.3177208, 1.406581, 0, 0, 0, 1, 1,
0.7287339, -1.146921, 2.171781, 0, 0, 0, 1, 1,
0.7327685, 0.7853513, 0.585627, 1, 1, 1, 1, 1,
0.7338727, -0.7014572, 2.036484, 1, 1, 1, 1, 1,
0.735652, -1.605355, 3.980848, 1, 1, 1, 1, 1,
0.7366372, 1.255033, 0.3248881, 1, 1, 1, 1, 1,
0.7455925, 0.9559194, 1.661442, 1, 1, 1, 1, 1,
0.7472642, 0.05738596, 1.846639, 1, 1, 1, 1, 1,
0.7514635, 1.610991, -0.6330239, 1, 1, 1, 1, 1,
0.7703594, -0.4077449, 2.845065, 1, 1, 1, 1, 1,
0.7752433, 0.4380969, 1.062617, 1, 1, 1, 1, 1,
0.7759418, -0.1033163, 2.156406, 1, 1, 1, 1, 1,
0.7793656, -0.3553297, 2.23484, 1, 1, 1, 1, 1,
0.7807294, -1.225782, 3.812469, 1, 1, 1, 1, 1,
0.789032, 0.322544, 1.804905, 1, 1, 1, 1, 1,
0.7921166, -0.4322467, 3.277757, 1, 1, 1, 1, 1,
0.7943966, -1.939374, 2.969836, 1, 1, 1, 1, 1,
0.7982818, 0.7269877, -0.9544197, 0, 0, 1, 1, 1,
0.8050986, -0.993182, 1.662887, 1, 0, 0, 1, 1,
0.8095713, 2.896487, 1.951547, 1, 0, 0, 1, 1,
0.8126094, 0.3197011, 2.229334, 1, 0, 0, 1, 1,
0.8147596, 0.214717, 0.6950343, 1, 0, 0, 1, 1,
0.8156876, 1.453019, -1.548665, 1, 0, 0, 1, 1,
0.821709, 0.6607212, -0.3238818, 0, 0, 0, 1, 1,
0.8237137, -1.489122, 3.761117, 0, 0, 0, 1, 1,
0.8258639, 0.7329987, -1.226401, 0, 0, 0, 1, 1,
0.8330699, 0.2895144, -0.8604782, 0, 0, 0, 1, 1,
0.8333567, 1.261927, -0.6010284, 0, 0, 0, 1, 1,
0.8340899, 0.6842992, 1.426029, 0, 0, 0, 1, 1,
0.8355183, 1.118336, 1.236858, 0, 0, 0, 1, 1,
0.8378474, 0.6817689, 0.1562563, 1, 1, 1, 1, 1,
0.8412481, -0.1139771, 1.59473, 1, 1, 1, 1, 1,
0.8465076, -1.035788, 1.954001, 1, 1, 1, 1, 1,
0.8478384, -0.2571822, 2.139048, 1, 1, 1, 1, 1,
0.8527743, 0.1139636, 0.6840428, 1, 1, 1, 1, 1,
0.8553784, 1.269678, 0.1473597, 1, 1, 1, 1, 1,
0.8583974, -0.7543362, 1.764586, 1, 1, 1, 1, 1,
0.8628729, -1.089749, 1.604262, 1, 1, 1, 1, 1,
0.8633159, 1.752514, -0.4646894, 1, 1, 1, 1, 1,
0.8636777, 0.01321836, 1.176965, 1, 1, 1, 1, 1,
0.8739036, 0.8748782, 0.9594866, 1, 1, 1, 1, 1,
0.8859591, -1.551214, 3.120746, 1, 1, 1, 1, 1,
0.8864724, -0.08731732, 0.3206137, 1, 1, 1, 1, 1,
0.8893229, 1.410383, 0.2664058, 1, 1, 1, 1, 1,
0.8941116, -0.7162022, 2.058028, 1, 1, 1, 1, 1,
0.9005686, 0.2519648, 1.641869, 0, 0, 1, 1, 1,
0.9035428, 1.020938, 1.491323, 1, 0, 0, 1, 1,
0.9129269, -1.2085, 3.903654, 1, 0, 0, 1, 1,
0.9142276, 0.4204132, 0.5155298, 1, 0, 0, 1, 1,
0.91839, -2.73505, 3.92888, 1, 0, 0, 1, 1,
0.9271091, -1.440955, 1.867648, 1, 0, 0, 1, 1,
0.9273543, -0.7902446, 1.734226, 0, 0, 0, 1, 1,
0.9281834, 0.279914, 0.1796138, 0, 0, 0, 1, 1,
0.9356617, -1.095044, 2.411004, 0, 0, 0, 1, 1,
0.9380914, -1.103677, 2.924628, 0, 0, 0, 1, 1,
0.9392698, -0.5345996, 1.455872, 0, 0, 0, 1, 1,
0.9402081, 0.07899167, 1.369147, 0, 0, 0, 1, 1,
0.9407582, -0.3634374, 1.257805, 0, 0, 0, 1, 1,
0.9410018, -0.4429736, 1.867318, 1, 1, 1, 1, 1,
0.9499754, 1.419652, 0.0160717, 1, 1, 1, 1, 1,
0.9527884, 0.3488002, 2.090322, 1, 1, 1, 1, 1,
0.9544231, -0.8964106, 1.885154, 1, 1, 1, 1, 1,
0.9646996, 1.545684, 0.2101201, 1, 1, 1, 1, 1,
0.9720232, 1.024662, 1.151983, 1, 1, 1, 1, 1,
0.9729815, 1.143878, -2.267162, 1, 1, 1, 1, 1,
0.9753498, 0.279562, 1.534514, 1, 1, 1, 1, 1,
0.979743, 1.503033, 0.3201593, 1, 1, 1, 1, 1,
0.9878433, -0.3912376, 4.188924, 1, 1, 1, 1, 1,
0.9947019, 1.220527, 0.2825994, 1, 1, 1, 1, 1,
1.000675, -0.7824079, 3.235107, 1, 1, 1, 1, 1,
1.001241, 0.504927, 1.846728, 1, 1, 1, 1, 1,
1.004459, -1.747275, 2.401277, 1, 1, 1, 1, 1,
1.006676, -1.335586, 2.996281, 1, 1, 1, 1, 1,
1.012202, -0.02815684, 2.179257, 0, 0, 1, 1, 1,
1.012414, 1.332873, -0.8034313, 1, 0, 0, 1, 1,
1.01705, -0.85247, 3.234538, 1, 0, 0, 1, 1,
1.018256, -0.2913013, 2.415373, 1, 0, 0, 1, 1,
1.026454, -0.1464724, 1.947038, 1, 0, 0, 1, 1,
1.031633, -1.450319, 3.960367, 1, 0, 0, 1, 1,
1.043956, 1.044021, 0.9771539, 0, 0, 0, 1, 1,
1.045507, 0.3123637, 0.3618145, 0, 0, 0, 1, 1,
1.054381, 1.972891, -0.4635362, 0, 0, 0, 1, 1,
1.061423, 0.3006747, 0.5526345, 0, 0, 0, 1, 1,
1.062036, 0.2312028, 2.163222, 0, 0, 0, 1, 1,
1.062732, 0.9142161, 1.063594, 0, 0, 0, 1, 1,
1.067333, 0.6074198, -0.007409431, 0, 0, 0, 1, 1,
1.068854, 0.2563114, 0.6928301, 1, 1, 1, 1, 1,
1.075547, -0.85687, 3.922705, 1, 1, 1, 1, 1,
1.076827, -0.868838, 3.065029, 1, 1, 1, 1, 1,
1.080733, 0.3858278, 2.324194, 1, 1, 1, 1, 1,
1.08088, -1.73992, 3.673096, 1, 1, 1, 1, 1,
1.097901, -0.4044271, 0.1980152, 1, 1, 1, 1, 1,
1.099969, 1.185586, 0.9278902, 1, 1, 1, 1, 1,
1.10411, 1.159706, 1.82226, 1, 1, 1, 1, 1,
1.10554, -1.82355, 2.883738, 1, 1, 1, 1, 1,
1.115917, -1.743829, 0.5122681, 1, 1, 1, 1, 1,
1.118585, -1.026646, 1.755818, 1, 1, 1, 1, 1,
1.121912, -1.069598, 2.065187, 1, 1, 1, 1, 1,
1.133298, 0.7256485, 0.3918275, 1, 1, 1, 1, 1,
1.134404, 0.296929, 0.7914509, 1, 1, 1, 1, 1,
1.137291, -1.561125, 2.320508, 1, 1, 1, 1, 1,
1.14957, -0.8739285, -0.6122819, 0, 0, 1, 1, 1,
1.15578, 0.6030752, 1.948238, 1, 0, 0, 1, 1,
1.159883, -2.023498, 2.603768, 1, 0, 0, 1, 1,
1.162366, 1.087038, -0.0599552, 1, 0, 0, 1, 1,
1.165797, 0.1879354, 2.177855, 1, 0, 0, 1, 1,
1.172132, 0.896395, 2.714799, 1, 0, 0, 1, 1,
1.175441, 2.563719, 0.1173464, 0, 0, 0, 1, 1,
1.175669, 0.04527874, 2.485394, 0, 0, 0, 1, 1,
1.175677, -1.100364, 2.226975, 0, 0, 0, 1, 1,
1.177629, -0.5350907, 2.119915, 0, 0, 0, 1, 1,
1.179252, -0.3264522, 1.214892, 0, 0, 0, 1, 1,
1.184573, -1.419553, 2.788426, 0, 0, 0, 1, 1,
1.186597, -0.744787, 0.4618419, 0, 0, 0, 1, 1,
1.186697, 0.05374676, 0.1397435, 1, 1, 1, 1, 1,
1.191728, 0.8383402, 2.105333, 1, 1, 1, 1, 1,
1.19173, 0.4943516, 0.02748796, 1, 1, 1, 1, 1,
1.193977, -0.9609112, 1.643191, 1, 1, 1, 1, 1,
1.214725, 1.192726, -0.7941735, 1, 1, 1, 1, 1,
1.218295, -0.2936536, 0.5627484, 1, 1, 1, 1, 1,
1.236778, -0.2855363, 2.054964, 1, 1, 1, 1, 1,
1.238486, -1.365993, 1.885813, 1, 1, 1, 1, 1,
1.245283, -0.2266777, 1.450159, 1, 1, 1, 1, 1,
1.250018, -0.8620193, 2.092432, 1, 1, 1, 1, 1,
1.26044, 0.589003, -0.006019988, 1, 1, 1, 1, 1,
1.276511, 0.3752324, 0.4998053, 1, 1, 1, 1, 1,
1.279096, 0.6200998, 0.871473, 1, 1, 1, 1, 1,
1.280073, -0.2042636, 1.849141, 1, 1, 1, 1, 1,
1.282529, -0.06694626, 0.8090397, 1, 1, 1, 1, 1,
1.282928, -0.9124879, 2.953969, 0, 0, 1, 1, 1,
1.297379, -0.02188709, 1.96161, 1, 0, 0, 1, 1,
1.299672, -1.035235, 2.221618, 1, 0, 0, 1, 1,
1.301487, 0.05668021, 2.044505, 1, 0, 0, 1, 1,
1.30685, -0.7598889, 1.302856, 1, 0, 0, 1, 1,
1.313468, 1.919609, 1.544955, 1, 0, 0, 1, 1,
1.330256, 0.2120213, 1.03193, 0, 0, 0, 1, 1,
1.339297, -0.09143022, 1.907428, 0, 0, 0, 1, 1,
1.341723, 0.2840554, 0.1376506, 0, 0, 0, 1, 1,
1.35263, -1.088776, 3.739201, 0, 0, 0, 1, 1,
1.354846, 0.9366708, 1.807668, 0, 0, 0, 1, 1,
1.357017, -0.5772151, 3.91789, 0, 0, 0, 1, 1,
1.36039, -0.4529087, 1.464745, 0, 0, 0, 1, 1,
1.363335, -2.054909, 2.72809, 1, 1, 1, 1, 1,
1.363706, 0.2453237, -0.04306244, 1, 1, 1, 1, 1,
1.367216, -1.384439, 3.352854, 1, 1, 1, 1, 1,
1.370194, -0.6903131, 2.003245, 1, 1, 1, 1, 1,
1.384921, -2.12149, 3.59607, 1, 1, 1, 1, 1,
1.391408, 0.9189191, -0.20894, 1, 1, 1, 1, 1,
1.397078, 1.137452, 2.292049, 1, 1, 1, 1, 1,
1.397762, -0.8687713, 1.287619, 1, 1, 1, 1, 1,
1.400239, 0.5678822, -0.5393891, 1, 1, 1, 1, 1,
1.414007, -1.0275, 1.843824, 1, 1, 1, 1, 1,
1.426826, -1.184955, 3.954299, 1, 1, 1, 1, 1,
1.429001, 0.6734812, 1.779863, 1, 1, 1, 1, 1,
1.429963, -0.1813193, 2.105128, 1, 1, 1, 1, 1,
1.439146, 0.6633715, 2.312158, 1, 1, 1, 1, 1,
1.442624, 1.189356, 1.836531, 1, 1, 1, 1, 1,
1.445088, 0.005416576, 0.4599378, 0, 0, 1, 1, 1,
1.453253, -0.09950877, -0.04865418, 1, 0, 0, 1, 1,
1.459194, 0.8769908, -0.373838, 1, 0, 0, 1, 1,
1.459342, 0.1634643, 0.2287425, 1, 0, 0, 1, 1,
1.461137, 0.07821353, 1.923987, 1, 0, 0, 1, 1,
1.466481, -1.134387, 1.391883, 1, 0, 0, 1, 1,
1.468219, 1.571155, 0.8927222, 0, 0, 0, 1, 1,
1.482963, 0.398333, 0.8316703, 0, 0, 0, 1, 1,
1.502546, -0.1050799, 2.771562, 0, 0, 0, 1, 1,
1.503826, -0.09032112, 3.45501, 0, 0, 0, 1, 1,
1.509953, 0.4809579, 1.77566, 0, 0, 0, 1, 1,
1.514596, 0.5839034, 1.530133, 0, 0, 0, 1, 1,
1.515006, 0.7531652, 1.692095, 0, 0, 0, 1, 1,
1.520733, -0.1759384, 1.260341, 1, 1, 1, 1, 1,
1.522065, -2.186696, 2.449219, 1, 1, 1, 1, 1,
1.526211, 0.1919522, 2.205387, 1, 1, 1, 1, 1,
1.527061, -0.537997, 3.32595, 1, 1, 1, 1, 1,
1.544538, 0.4687638, -0.2214957, 1, 1, 1, 1, 1,
1.549238, 0.1002394, 0.5093711, 1, 1, 1, 1, 1,
1.553926, -1.282946, 2.261752, 1, 1, 1, 1, 1,
1.559177, -0.5398754, 1.812374, 1, 1, 1, 1, 1,
1.565496, 1.008439, 0.2494603, 1, 1, 1, 1, 1,
1.584716, -0.6932727, 1.660192, 1, 1, 1, 1, 1,
1.59084, -0.6125731, 2.205409, 1, 1, 1, 1, 1,
1.596446, 0.1529547, 2.385385, 1, 1, 1, 1, 1,
1.597369, -0.3592885, -0.136487, 1, 1, 1, 1, 1,
1.60291, -0.7746217, 1.371935, 1, 1, 1, 1, 1,
1.60636, 0.4100252, 0.579493, 1, 1, 1, 1, 1,
1.613655, -0.359907, 1.734714, 0, 0, 1, 1, 1,
1.616019, -0.009986367, 1.527967, 1, 0, 0, 1, 1,
1.628596, -1.757943, 3.533445, 1, 0, 0, 1, 1,
1.652324, -0.9113709, 2.383128, 1, 0, 0, 1, 1,
1.65501, 0.7639116, 1.25941, 1, 0, 0, 1, 1,
1.66451, -0.3483621, 2.752386, 1, 0, 0, 1, 1,
1.66544, 0.5677994, 1.484935, 0, 0, 0, 1, 1,
1.666741, 0.5725215, 1.533338, 0, 0, 0, 1, 1,
1.670061, 1.212794, 0.952511, 0, 0, 0, 1, 1,
1.677048, 0.5922776, 2.373905, 0, 0, 0, 1, 1,
1.704615, -0.3690471, 1.664456, 0, 0, 0, 1, 1,
1.719306, -0.5141091, 3.589644, 0, 0, 0, 1, 1,
1.724503, -0.07219026, 2.187487, 0, 0, 0, 1, 1,
1.728394, 1.593297, 1.351096, 1, 1, 1, 1, 1,
1.765662, 0.5105039, 2.576834, 1, 1, 1, 1, 1,
1.775818, 1.588014, 0.8666654, 1, 1, 1, 1, 1,
1.800714, 1.013167, 1.41098, 1, 1, 1, 1, 1,
1.803088, 0.3490211, 0.1278382, 1, 1, 1, 1, 1,
1.810056, 0.3040778, -0.7589092, 1, 1, 1, 1, 1,
1.814373, -1.478019, 2.198123, 1, 1, 1, 1, 1,
1.821776, -0.2551562, 2.260877, 1, 1, 1, 1, 1,
1.829237, 0.1482711, 0.7115439, 1, 1, 1, 1, 1,
1.841413, 0.6453449, 1.68083, 1, 1, 1, 1, 1,
1.849462, -0.747748, 1.893683, 1, 1, 1, 1, 1,
1.849768, 0.9997097, -1.011925, 1, 1, 1, 1, 1,
1.881169, 0.8317826, 0.4240945, 1, 1, 1, 1, 1,
1.941098, 0.3436192, 1.667266, 1, 1, 1, 1, 1,
1.950023, 1.042405, 1.087532, 1, 1, 1, 1, 1,
1.957415, -0.5470359, 1.804271, 0, 0, 1, 1, 1,
1.963395, 0.505392, 1.427105, 1, 0, 0, 1, 1,
1.995042, -1.482364, 4.307515, 1, 0, 0, 1, 1,
2.026805, -1.491191, 3.267345, 1, 0, 0, 1, 1,
2.031949, -1.211987, 3.432409, 1, 0, 0, 1, 1,
2.05183, -1.856545, 2.40223, 1, 0, 0, 1, 1,
2.06322, 2.292478, 0.07616233, 0, 0, 0, 1, 1,
2.076515, 0.01855226, -0.2964115, 0, 0, 0, 1, 1,
2.079743, 1.341641, 2.86167, 0, 0, 0, 1, 1,
2.248961, 0.4357654, 1.037337, 0, 0, 0, 1, 1,
2.364809, -0.5673815, 1.517796, 0, 0, 0, 1, 1,
2.434688, 0.4945332, -1.306381, 0, 0, 0, 1, 1,
2.434723, 1.359002, 0.867475, 0, 0, 0, 1, 1,
2.459777, -1.45793, 2.235709, 1, 1, 1, 1, 1,
2.462974, 1.923651, -1.232749, 1, 1, 1, 1, 1,
2.4638, -0.9258559, 1.49779, 1, 1, 1, 1, 1,
2.491494, -0.4006915, 2.000713, 1, 1, 1, 1, 1,
2.532606, -1.515736, 3.046245, 1, 1, 1, 1, 1,
2.551306, -1.476109, 1.757359, 1, 1, 1, 1, 1,
3.698199, -0.1136917, 1.653945, 1, 1, 1, 1, 1
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
var radius = 10.27343;
var distance = 36.08499;
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
mvMatrix.translate( -0.3927718, -0.3926039, 0.08627677 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.08499);
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
