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
-3.227641, -0.8695247, -2.028042, 1, 0, 0, 1,
-2.879692, -1.113201, -1.887801, 1, 0.007843138, 0, 1,
-2.68155, 0.2599906, -2.688786, 1, 0.01176471, 0, 1,
-2.633942, -0.6678287, -1.04514, 1, 0.01960784, 0, 1,
-2.590737, 1.459363, -2.506897, 1, 0.02352941, 0, 1,
-2.505445, 0.9486765, -1.65673, 1, 0.03137255, 0, 1,
-2.418828, 1.194782, -0.5105413, 1, 0.03529412, 0, 1,
-2.365313, -1.008381, -1.959897, 1, 0.04313726, 0, 1,
-2.355494, -0.9877135, -2.421251, 1, 0.04705882, 0, 1,
-2.342644, -0.3020528, -1.696029, 1, 0.05490196, 0, 1,
-2.314138, -0.9851198, -2.150872, 1, 0.05882353, 0, 1,
-2.304039, -2.420981, -3.736978, 1, 0.06666667, 0, 1,
-2.233374, -1.15094, -3.052096, 1, 0.07058824, 0, 1,
-2.222778, 0.5297029, -0.9768983, 1, 0.07843138, 0, 1,
-2.111967, -1.303508, -1.352818, 1, 0.08235294, 0, 1,
-2.105014, -0.2448998, -2.018624, 1, 0.09019608, 0, 1,
-2.099514, 0.08887825, -1.221947, 1, 0.09411765, 0, 1,
-2.091036, 2.351959, -1.902956, 1, 0.1019608, 0, 1,
-2.085027, 0.1322133, -1.921897, 1, 0.1098039, 0, 1,
-2.073761, -1.229321, -1.41836, 1, 0.1137255, 0, 1,
-2.073584, -0.503897, -2.564024, 1, 0.1215686, 0, 1,
-2.021008, 0.8089137, -2.106537, 1, 0.1254902, 0, 1,
-2.001607, -1.997791, -2.928315, 1, 0.1333333, 0, 1,
-1.992946, 0.2798326, 1.162112, 1, 0.1372549, 0, 1,
-1.9868, -1.512402, -2.918511, 1, 0.145098, 0, 1,
-1.972809, -1.271424, -3.504002, 1, 0.1490196, 0, 1,
-1.9364, 0.3576907, -2.162536, 1, 0.1568628, 0, 1,
-1.9354, 0.2075495, -0.4010165, 1, 0.1607843, 0, 1,
-1.934024, -1.142016, -1.056088, 1, 0.1686275, 0, 1,
-1.922524, -1.946921, -2.225555, 1, 0.172549, 0, 1,
-1.876378, -0.8594192, -1.44163, 1, 0.1803922, 0, 1,
-1.855407, 0.1274461, -1.187042, 1, 0.1843137, 0, 1,
-1.841686, 0.4153074, -3.926547, 1, 0.1921569, 0, 1,
-1.835374, -0.087535, -1.658047, 1, 0.1960784, 0, 1,
-1.812406, 1.308969, -0.5938776, 1, 0.2039216, 0, 1,
-1.806461, -0.9317648, -3.501908, 1, 0.2117647, 0, 1,
-1.787463, 0.8117363, -1.46306, 1, 0.2156863, 0, 1,
-1.786699, 0.7339355, -1.222906, 1, 0.2235294, 0, 1,
-1.779459, 1.464908, -2.576057, 1, 0.227451, 0, 1,
-1.765152, -0.9536858, -1.966949, 1, 0.2352941, 0, 1,
-1.749231, -0.342896, -0.3524752, 1, 0.2392157, 0, 1,
-1.747835, 0.9322809, -0.07835016, 1, 0.2470588, 0, 1,
-1.740792, -0.302266, -1.187509, 1, 0.2509804, 0, 1,
-1.733471, -1.879345, -2.026752, 1, 0.2588235, 0, 1,
-1.725703, 1.510411, -2.222543, 1, 0.2627451, 0, 1,
-1.702625, 0.7580714, -1.649383, 1, 0.2705882, 0, 1,
-1.698732, 0.503644, -2.129247, 1, 0.2745098, 0, 1,
-1.689828, -0.1771158, -1.550271, 1, 0.282353, 0, 1,
-1.677737, -0.9642853, -1.927711, 1, 0.2862745, 0, 1,
-1.662466, 0.7891883, -1.303705, 1, 0.2941177, 0, 1,
-1.641772, 0.6184308, -2.360424, 1, 0.3019608, 0, 1,
-1.636316, 0.2579732, -0.2025715, 1, 0.3058824, 0, 1,
-1.62672, -0.5226766, -4.137633, 1, 0.3137255, 0, 1,
-1.605591, -2.524419, -1.326562, 1, 0.3176471, 0, 1,
-1.58468, 1.928445, -0.7199987, 1, 0.3254902, 0, 1,
-1.575018, 1.704592, -1.346349, 1, 0.3294118, 0, 1,
-1.540076, 0.7910166, -2.722728, 1, 0.3372549, 0, 1,
-1.528036, -0.8340336, -1.682788, 1, 0.3411765, 0, 1,
-1.506778, 1.267149, -0.753379, 1, 0.3490196, 0, 1,
-1.504718, 0.2289678, -0.2805674, 1, 0.3529412, 0, 1,
-1.479275, 1.237456, -3.206578, 1, 0.3607843, 0, 1,
-1.478202, -1.268676, -2.891033, 1, 0.3647059, 0, 1,
-1.474669, 0.3065941, -1.07677, 1, 0.372549, 0, 1,
-1.456048, -0.3798154, -1.379992, 1, 0.3764706, 0, 1,
-1.45588, 0.1093883, -2.808951, 1, 0.3843137, 0, 1,
-1.453812, 0.1973514, -1.565346, 1, 0.3882353, 0, 1,
-1.443904, -0.1341648, -1.613725, 1, 0.3960784, 0, 1,
-1.442497, -0.4422939, -2.623397, 1, 0.4039216, 0, 1,
-1.442147, 1.549086, -0.0751299, 1, 0.4078431, 0, 1,
-1.440578, 1.894313, -1.45339, 1, 0.4156863, 0, 1,
-1.439073, -0.293776, -0.4256648, 1, 0.4196078, 0, 1,
-1.433146, 1.885352, 0.3025775, 1, 0.427451, 0, 1,
-1.432483, -1.64119, -2.292887, 1, 0.4313726, 0, 1,
-1.431655, 0.3749483, -0.8660924, 1, 0.4392157, 0, 1,
-1.419667, -1.291002, -3.774492, 1, 0.4431373, 0, 1,
-1.405385, -1.120138, -2.803131, 1, 0.4509804, 0, 1,
-1.399035, 1.171664, 0.03616792, 1, 0.454902, 0, 1,
-1.396729, 1.213611, -2.026855, 1, 0.4627451, 0, 1,
-1.387887, -0.5174705, -0.864858, 1, 0.4666667, 0, 1,
-1.374893, -0.0007033555, -1.636456, 1, 0.4745098, 0, 1,
-1.366148, 0.01677363, -3.573637, 1, 0.4784314, 0, 1,
-1.363925, -1.169529, -2.925374, 1, 0.4862745, 0, 1,
-1.355697, 0.5092893, 0.5505229, 1, 0.4901961, 0, 1,
-1.354986, 0.4374495, -1.070343, 1, 0.4980392, 0, 1,
-1.349804, -0.6794155, -1.568529, 1, 0.5058824, 0, 1,
-1.347378, -0.6902899, -2.216139, 1, 0.509804, 0, 1,
-1.344632, -1.093858, -1.993084, 1, 0.5176471, 0, 1,
-1.343727, -0.6096618, -1.391737, 1, 0.5215687, 0, 1,
-1.342507, -0.722402, -1.015309, 1, 0.5294118, 0, 1,
-1.339724, 0.3628829, -1.779897, 1, 0.5333334, 0, 1,
-1.337686, -0.8001314, -1.839475, 1, 0.5411765, 0, 1,
-1.330731, 1.116925, -0.8237345, 1, 0.5450981, 0, 1,
-1.324154, -1.061216, -2.598702, 1, 0.5529412, 0, 1,
-1.321471, -0.4144485, -2.298397, 1, 0.5568628, 0, 1,
-1.317309, -0.1322691, -1.073265, 1, 0.5647059, 0, 1,
-1.31388, 0.4877736, -0.1997179, 1, 0.5686275, 0, 1,
-1.311243, 1.656116, -0.8667562, 1, 0.5764706, 0, 1,
-1.307853, 0.3292883, -3.535144, 1, 0.5803922, 0, 1,
-1.301788, 1.30367, 0.4577916, 1, 0.5882353, 0, 1,
-1.291613, 0.5913821, -2.21754, 1, 0.5921569, 0, 1,
-1.290371, -1.646362, -1.868903, 1, 0.6, 0, 1,
-1.287066, -0.7329315, -2.621613, 1, 0.6078432, 0, 1,
-1.278279, -0.6727619, -1.662348, 1, 0.6117647, 0, 1,
-1.272594, -1.885912, -2.940922, 1, 0.6196079, 0, 1,
-1.268157, -0.9795619, -1.109968, 1, 0.6235294, 0, 1,
-1.26746, -1.998699, -2.837211, 1, 0.6313726, 0, 1,
-1.266428, 0.06099061, -1.418853, 1, 0.6352941, 0, 1,
-1.257102, -0.2077502, -1.362662, 1, 0.6431373, 0, 1,
-1.256326, 0.4334313, -1.453424, 1, 0.6470588, 0, 1,
-1.255047, -0.6089985, -2.907505, 1, 0.654902, 0, 1,
-1.249861, 0.9699095, -1.335624, 1, 0.6588235, 0, 1,
-1.231456, 0.3121682, -0.9339191, 1, 0.6666667, 0, 1,
-1.229358, -0.2774088, -0.6303565, 1, 0.6705883, 0, 1,
-1.228928, 1.392568, -2.009236, 1, 0.6784314, 0, 1,
-1.22705, 0.2336692, 1.225448, 1, 0.682353, 0, 1,
-1.220027, -1.884808, -3.124242, 1, 0.6901961, 0, 1,
-1.216321, -0.7488445, -0.3841212, 1, 0.6941177, 0, 1,
-1.209518, -1.166413, -2.468012, 1, 0.7019608, 0, 1,
-1.204918, -1.684147, -1.494505, 1, 0.7098039, 0, 1,
-1.203881, 1.452618, -1.319342, 1, 0.7137255, 0, 1,
-1.199966, -0.3552618, -1.872787, 1, 0.7215686, 0, 1,
-1.199125, -0.2117197, -1.527477, 1, 0.7254902, 0, 1,
-1.193742, -1.056475, -3.415173, 1, 0.7333333, 0, 1,
-1.183561, 1.521158, -0.5574906, 1, 0.7372549, 0, 1,
-1.168713, 0.588309, -1.810352, 1, 0.7450981, 0, 1,
-1.162236, -0.510159, -0.8908328, 1, 0.7490196, 0, 1,
-1.148657, 0.1833804, -1.771895, 1, 0.7568628, 0, 1,
-1.147092, 0.2094252, -2.282064, 1, 0.7607843, 0, 1,
-1.131212, 0.5719754, -2.099868, 1, 0.7686275, 0, 1,
-1.127433, -0.6609059, -1.803751, 1, 0.772549, 0, 1,
-1.127372, 1.796582, -0.6296082, 1, 0.7803922, 0, 1,
-1.120316, -0.5979403, -1.266559, 1, 0.7843137, 0, 1,
-1.114908, -0.7435303, -2.827478, 1, 0.7921569, 0, 1,
-1.111179, 0.2556234, -1.948809, 1, 0.7960784, 0, 1,
-1.108229, 1.765241, -1.503063, 1, 0.8039216, 0, 1,
-1.097686, -0.259246, -0.4849225, 1, 0.8117647, 0, 1,
-1.089951, -0.1459114, -1.853699, 1, 0.8156863, 0, 1,
-1.083343, 0.9957324, -0.1250031, 1, 0.8235294, 0, 1,
-1.082008, 0.1082267, -2.803886, 1, 0.827451, 0, 1,
-1.080181, 0.7629659, 0.3195008, 1, 0.8352941, 0, 1,
-1.078092, 0.00494727, -1.868674, 1, 0.8392157, 0, 1,
-1.071678, 1.710798, 0.675043, 1, 0.8470588, 0, 1,
-1.065964, -0.4814937, -3.339175, 1, 0.8509804, 0, 1,
-1.056986, -0.4237714, -2.586271, 1, 0.8588235, 0, 1,
-1.056182, 1.740361, 0.9538172, 1, 0.8627451, 0, 1,
-1.044129, 1.42052, -1.148455, 1, 0.8705882, 0, 1,
-1.043126, 0.7307903, -0.967485, 1, 0.8745098, 0, 1,
-1.03388, 0.00990303, -0.2420006, 1, 0.8823529, 0, 1,
-1.033702, 0.2412821, -1.890386, 1, 0.8862745, 0, 1,
-1.031039, 0.6140976, 0.2150905, 1, 0.8941177, 0, 1,
-1.020948, -0.3355451, -2.332933, 1, 0.8980392, 0, 1,
-1.019123, 0.8968684, -0.662877, 1, 0.9058824, 0, 1,
-1.015034, 0.8818527, -1.632526, 1, 0.9137255, 0, 1,
-1.01376, -1.622421, -4.40893, 1, 0.9176471, 0, 1,
-1.012787, 0.8131968, 1.11376, 1, 0.9254902, 0, 1,
-1.010493, -0.3663762, -1.038656, 1, 0.9294118, 0, 1,
-1.010102, -0.8769338, -3.815994, 1, 0.9372549, 0, 1,
-1.003869, -0.6069577, -1.214188, 1, 0.9411765, 0, 1,
-1.00088, 0.1382984, -2.091165, 1, 0.9490196, 0, 1,
-0.9983141, -0.9541087, -3.528611, 1, 0.9529412, 0, 1,
-0.9971976, 0.1027438, -1.405611, 1, 0.9607843, 0, 1,
-0.9940025, -0.2984853, -3.478516, 1, 0.9647059, 0, 1,
-0.9928614, 0.4469725, -0.1181387, 1, 0.972549, 0, 1,
-0.9907564, 0.5402601, 0.7375838, 1, 0.9764706, 0, 1,
-0.9905595, -0.2454741, -0.757982, 1, 0.9843137, 0, 1,
-0.99011, -0.4748431, -0.6555774, 1, 0.9882353, 0, 1,
-0.9870848, -0.01261479, -1.866874, 1, 0.9960784, 0, 1,
-0.9817291, 1.31567, -0.204682, 0.9960784, 1, 0, 1,
-0.9816682, 0.3347498, -1.83173, 0.9921569, 1, 0, 1,
-0.979269, -1.425683, -3.805122, 0.9843137, 1, 0, 1,
-0.9778247, -0.3716913, -1.77136, 0.9803922, 1, 0, 1,
-0.9757105, 1.842005, -1.979879, 0.972549, 1, 0, 1,
-0.9740318, -0.07838876, -0.7877672, 0.9686275, 1, 0, 1,
-0.9721882, -0.7480799, -3.419686, 0.9607843, 1, 0, 1,
-0.9670284, -1.927217, -2.028558, 0.9568627, 1, 0, 1,
-0.9592984, -1.52015, -1.171187, 0.9490196, 1, 0, 1,
-0.9526112, -0.805145, -2.667919, 0.945098, 1, 0, 1,
-0.9522949, 0.0226659, -0.9224023, 0.9372549, 1, 0, 1,
-0.9428809, 0.2450303, -1.343591, 0.9333333, 1, 0, 1,
-0.9427216, 0.05363136, -0.1332077, 0.9254902, 1, 0, 1,
-0.9417064, 0.5733978, -1.409116, 0.9215686, 1, 0, 1,
-0.9410474, 2.238494, -1.761688, 0.9137255, 1, 0, 1,
-0.9369236, 2.104301, -1.040217, 0.9098039, 1, 0, 1,
-0.9330248, -0.680492, -2.237642, 0.9019608, 1, 0, 1,
-0.9306972, -0.7306581, -1.945889, 0.8941177, 1, 0, 1,
-0.9278954, -1.32356, -3.460122, 0.8901961, 1, 0, 1,
-0.9261301, 0.06846397, -3.397609, 0.8823529, 1, 0, 1,
-0.9151007, 0.8907319, -0.8010035, 0.8784314, 1, 0, 1,
-0.909447, 1.018845, -0.8807918, 0.8705882, 1, 0, 1,
-0.9041536, -1.314251, -3.073273, 0.8666667, 1, 0, 1,
-0.9035867, 0.8222088, -0.4775553, 0.8588235, 1, 0, 1,
-0.9033952, -2.339521, -2.916671, 0.854902, 1, 0, 1,
-0.897406, -0.2392504, -2.202574, 0.8470588, 1, 0, 1,
-0.8963894, -1.741283, -2.277535, 0.8431373, 1, 0, 1,
-0.8878766, 0.0276723, -2.794736, 0.8352941, 1, 0, 1,
-0.8870956, -0.3408577, -4.211167, 0.8313726, 1, 0, 1,
-0.8860704, -0.8587619, -4.479709, 0.8235294, 1, 0, 1,
-0.876367, -0.3427614, -3.246796, 0.8196079, 1, 0, 1,
-0.8763094, 0.2522346, -2.572142, 0.8117647, 1, 0, 1,
-0.8734258, -1.146776, -2.190504, 0.8078431, 1, 0, 1,
-0.8718781, 0.6992251, 1.033055, 0.8, 1, 0, 1,
-0.8682814, 0.4560848, -0.4024931, 0.7921569, 1, 0, 1,
-0.8680194, -0.9319737, -1.40028, 0.7882353, 1, 0, 1,
-0.8637232, 0.03183334, -2.167201, 0.7803922, 1, 0, 1,
-0.8612604, 2.412401, -0.3508975, 0.7764706, 1, 0, 1,
-0.8596608, 0.04872927, -1.243568, 0.7686275, 1, 0, 1,
-0.8583863, -0.9363557, -2.753986, 0.7647059, 1, 0, 1,
-0.8535007, 1.79818, 0.6565474, 0.7568628, 1, 0, 1,
-0.8500715, 1.29256, 0.6881348, 0.7529412, 1, 0, 1,
-0.8356876, -0.9325848, -0.4379811, 0.7450981, 1, 0, 1,
-0.8327584, 1.072968, -0.6864763, 0.7411765, 1, 0, 1,
-0.8273835, 0.7157957, -1.775512, 0.7333333, 1, 0, 1,
-0.8218864, 1.292169, 0.5863723, 0.7294118, 1, 0, 1,
-0.8155454, -1.000985, -2.025355, 0.7215686, 1, 0, 1,
-0.8001877, 1.309832, -1.562106, 0.7176471, 1, 0, 1,
-0.7950572, 0.416311, -1.496738, 0.7098039, 1, 0, 1,
-0.7867876, -1.963672, -4.014066, 0.7058824, 1, 0, 1,
-0.78611, 0.1150374, -1.67599, 0.6980392, 1, 0, 1,
-0.7794323, -1.098694, -0.9801825, 0.6901961, 1, 0, 1,
-0.77933, 1.339258, 0.9428725, 0.6862745, 1, 0, 1,
-0.7780361, 1.016251, -0.5161444, 0.6784314, 1, 0, 1,
-0.7770771, 0.6347879, 0.2000842, 0.6745098, 1, 0, 1,
-0.7757819, 0.5545495, 1.580547, 0.6666667, 1, 0, 1,
-0.7644891, -2.194383, -3.3758, 0.6627451, 1, 0, 1,
-0.762238, 0.3014522, -1.933468, 0.654902, 1, 0, 1,
-0.7551351, -0.09362742, -1.442693, 0.6509804, 1, 0, 1,
-0.7521595, -0.2047472, -3.524347, 0.6431373, 1, 0, 1,
-0.750536, -0.4635913, -1.909127, 0.6392157, 1, 0, 1,
-0.7465857, 1.165166, -1.735725, 0.6313726, 1, 0, 1,
-0.7445728, -0.6717427, -1.546652, 0.627451, 1, 0, 1,
-0.7394934, -0.9491469, -1.315395, 0.6196079, 1, 0, 1,
-0.7390273, 0.7095219, -0.2393908, 0.6156863, 1, 0, 1,
-0.7347247, -0.008567756, -1.575891, 0.6078432, 1, 0, 1,
-0.7316511, 0.6128574, -1.973545, 0.6039216, 1, 0, 1,
-0.7260144, -0.5528048, -1.645078, 0.5960785, 1, 0, 1,
-0.7242945, 0.5000703, -2.222068, 0.5882353, 1, 0, 1,
-0.7077535, 0.3347239, -0.1824387, 0.5843138, 1, 0, 1,
-0.703446, 0.4765567, -1.712402, 0.5764706, 1, 0, 1,
-0.7013406, 0.6293708, -1.154297, 0.572549, 1, 0, 1,
-0.7001483, 0.5783092, -1.452854, 0.5647059, 1, 0, 1,
-0.6998566, -0.01148795, -2.054698, 0.5607843, 1, 0, 1,
-0.6994646, -0.7287911, -1.944737, 0.5529412, 1, 0, 1,
-0.6985194, -1.088739, -2.827291, 0.5490196, 1, 0, 1,
-0.6968469, 1.164378, 0.8618726, 0.5411765, 1, 0, 1,
-0.6827475, -0.3562952, -4.357694, 0.5372549, 1, 0, 1,
-0.6825157, 1.191293, -0.1238502, 0.5294118, 1, 0, 1,
-0.6825072, -1.390911, -5.105009, 0.5254902, 1, 0, 1,
-0.6822661, 0.6525568, -1.599329, 0.5176471, 1, 0, 1,
-0.6757292, -0.360113, -2.995349, 0.5137255, 1, 0, 1,
-0.6731414, 1.097603, -0.2336394, 0.5058824, 1, 0, 1,
-0.6612393, 1.125118, 0.4806277, 0.5019608, 1, 0, 1,
-0.660014, -1.171693, -4.591027, 0.4941176, 1, 0, 1,
-0.6598203, -1.008082, -0.5531143, 0.4862745, 1, 0, 1,
-0.6564171, -0.940036, -3.061126, 0.4823529, 1, 0, 1,
-0.6532903, 0.4344683, -0.8815745, 0.4745098, 1, 0, 1,
-0.6525615, 1.978205, -0.4851918, 0.4705882, 1, 0, 1,
-0.6524564, -1.265975, -1.920656, 0.4627451, 1, 0, 1,
-0.6494598, 0.1249978, -1.375888, 0.4588235, 1, 0, 1,
-0.6491496, 0.1017876, -1.349055, 0.4509804, 1, 0, 1,
-0.6470213, 1.89136, -1.481304, 0.4470588, 1, 0, 1,
-0.6434, -0.5620128, -1.285303, 0.4392157, 1, 0, 1,
-0.6423521, -0.9665043, -3.9174, 0.4352941, 1, 0, 1,
-0.6420351, -1.381358, -3.210674, 0.427451, 1, 0, 1,
-0.6394951, 0.4626097, -0.05155517, 0.4235294, 1, 0, 1,
-0.6374712, -0.622571, -2.853715, 0.4156863, 1, 0, 1,
-0.6354985, 0.220571, -3.345616, 0.4117647, 1, 0, 1,
-0.6346741, -1.131612, -2.165355, 0.4039216, 1, 0, 1,
-0.6344838, 1.271831, -3.305433, 0.3960784, 1, 0, 1,
-0.6310556, 2.125752, -0.6273701, 0.3921569, 1, 0, 1,
-0.630017, -0.5190856, -2.470995, 0.3843137, 1, 0, 1,
-0.6279841, 1.044771, 0.1513154, 0.3803922, 1, 0, 1,
-0.6275412, 0.3359917, -1.632842, 0.372549, 1, 0, 1,
-0.626799, -1.602658, -3.66066, 0.3686275, 1, 0, 1,
-0.6251354, 0.9656667, -0.05853874, 0.3607843, 1, 0, 1,
-0.6140224, -1.662754, -2.61345, 0.3568628, 1, 0, 1,
-0.6105865, 0.9550994, -1.858775, 0.3490196, 1, 0, 1,
-0.607845, 0.05411423, -2.328848, 0.345098, 1, 0, 1,
-0.5977591, 1.462002, -0.2991583, 0.3372549, 1, 0, 1,
-0.5962155, -0.1571489, -2.465016, 0.3333333, 1, 0, 1,
-0.5946981, -1.170623, -2.772589, 0.3254902, 1, 0, 1,
-0.59159, -1.433093, -5.626452, 0.3215686, 1, 0, 1,
-0.5890603, 0.5210867, -1.805778, 0.3137255, 1, 0, 1,
-0.5880038, -0.4435079, -0.9364975, 0.3098039, 1, 0, 1,
-0.5855496, 1.274162, 0.1179009, 0.3019608, 1, 0, 1,
-0.5837843, 0.4170606, -1.446038, 0.2941177, 1, 0, 1,
-0.5828156, 0.3173262, 0.2412959, 0.2901961, 1, 0, 1,
-0.5810729, 1.132928, -1.602612, 0.282353, 1, 0, 1,
-0.5735652, -0.6214475, -1.836691, 0.2784314, 1, 0, 1,
-0.5699683, -0.3095276, -1.241295, 0.2705882, 1, 0, 1,
-0.5651788, -0.6354571, -3.379947, 0.2666667, 1, 0, 1,
-0.5633051, 0.377018, -1.160561, 0.2588235, 1, 0, 1,
-0.5630582, -0.01474946, -1.566101, 0.254902, 1, 0, 1,
-0.5615942, -1.108593, -2.708703, 0.2470588, 1, 0, 1,
-0.55893, -0.8644674, -3.023392, 0.2431373, 1, 0, 1,
-0.5538193, 1.278669, -0.8862682, 0.2352941, 1, 0, 1,
-0.5527545, -0.9609483, -1.885195, 0.2313726, 1, 0, 1,
-0.5518934, -0.02892159, -0.01899175, 0.2235294, 1, 0, 1,
-0.5463757, 0.6849052, -0.305089, 0.2196078, 1, 0, 1,
-0.5451121, 1.384563, -1.886606, 0.2117647, 1, 0, 1,
-0.5435138, -0.7964792, -3.183995, 0.2078431, 1, 0, 1,
-0.5411195, -0.7848665, -1.733609, 0.2, 1, 0, 1,
-0.5386929, 0.1340397, -2.857717, 0.1921569, 1, 0, 1,
-0.5371132, -0.8587962, -1.181425, 0.1882353, 1, 0, 1,
-0.5307125, -1.498239, -0.7469452, 0.1803922, 1, 0, 1,
-0.527801, 0.3330787, -0.2722534, 0.1764706, 1, 0, 1,
-0.5272167, 0.3677766, -1.366109, 0.1686275, 1, 0, 1,
-0.5253773, 0.6654565, -0.8811517, 0.1647059, 1, 0, 1,
-0.52454, -0.03039114, -1.787909, 0.1568628, 1, 0, 1,
-0.5078413, -1.753948, -3.707703, 0.1529412, 1, 0, 1,
-0.506062, 0.1285012, -2.137071, 0.145098, 1, 0, 1,
-0.5042847, -0.2941333, -1.501001, 0.1411765, 1, 0, 1,
-0.4898852, 0.6783504, 1.278552, 0.1333333, 1, 0, 1,
-0.4874322, 1.163545, 2.424458, 0.1294118, 1, 0, 1,
-0.4869543, -0.9842265, -5.207966, 0.1215686, 1, 0, 1,
-0.4857553, 0.6115084, -0.6448912, 0.1176471, 1, 0, 1,
-0.4855123, -0.2323481, -1.02385, 0.1098039, 1, 0, 1,
-0.4815095, 0.5600693, -1.525245, 0.1058824, 1, 0, 1,
-0.4814661, 0.699425, -1.553615, 0.09803922, 1, 0, 1,
-0.4734809, -0.4841833, -1.803881, 0.09019608, 1, 0, 1,
-0.4688016, -0.3643617, -2.099138, 0.08627451, 1, 0, 1,
-0.4683254, 0.5723346, -0.7106838, 0.07843138, 1, 0, 1,
-0.4646218, -1.282867, -3.991661, 0.07450981, 1, 0, 1,
-0.4634058, 0.6559483, 1.067766, 0.06666667, 1, 0, 1,
-0.4619017, -1.78177, -2.85883, 0.0627451, 1, 0, 1,
-0.4618084, 0.3106374, -1.3349, 0.05490196, 1, 0, 1,
-0.4589616, 0.8509335, 0.7971942, 0.05098039, 1, 0, 1,
-0.4567094, 0.306541, -0.3009932, 0.04313726, 1, 0, 1,
-0.4468229, -1.19527, -4.284042, 0.03921569, 1, 0, 1,
-0.44151, -1.036447, -2.352681, 0.03137255, 1, 0, 1,
-0.4387307, 0.252288, -0.5977749, 0.02745098, 1, 0, 1,
-0.4370147, 0.2448392, -0.1211605, 0.01960784, 1, 0, 1,
-0.4362421, -1.017109, -3.211167, 0.01568628, 1, 0, 1,
-0.4340222, -0.4162543, -1.293564, 0.007843138, 1, 0, 1,
-0.4240291, 0.4327973, -1.889146, 0.003921569, 1, 0, 1,
-0.422617, -1.118992, -3.041602, 0, 1, 0.003921569, 1,
-0.4210542, 0.1314353, -1.122069, 0, 1, 0.01176471, 1,
-0.4198624, 0.4776337, -1.180942, 0, 1, 0.01568628, 1,
-0.4121803, 1.260786, -0.4748411, 0, 1, 0.02352941, 1,
-0.4099591, 0.3829774, -1.320097, 0, 1, 0.02745098, 1,
-0.4087527, 1.104881, -1.938961, 0, 1, 0.03529412, 1,
-0.4066084, 0.6155303, -0.9278606, 0, 1, 0.03921569, 1,
-0.4059171, 2.621238, -1.398404, 0, 1, 0.04705882, 1,
-0.4046604, -1.771265, -6.173945, 0, 1, 0.05098039, 1,
-0.4021631, -0.9615173, -3.928333, 0, 1, 0.05882353, 1,
-0.4016323, 0.2504644, -1.748076, 0, 1, 0.0627451, 1,
-0.4006056, -0.973262, -2.167994, 0, 1, 0.07058824, 1,
-0.4004756, -0.4659823, -2.193655, 0, 1, 0.07450981, 1,
-0.400149, 0.3273007, 0.94047, 0, 1, 0.08235294, 1,
-0.3956384, 0.6254658, -0.3947327, 0, 1, 0.08627451, 1,
-0.3954732, 1.793655, 1.649277, 0, 1, 0.09411765, 1,
-0.3920218, 0.7981501, 0.5470108, 0, 1, 0.1019608, 1,
-0.3906436, -0.2832333, -1.514343, 0, 1, 0.1058824, 1,
-0.3875719, -1.328985, -2.003627, 0, 1, 0.1137255, 1,
-0.3847716, 0.2875018, -0.8494641, 0, 1, 0.1176471, 1,
-0.3844142, -0.8217264, -3.653893, 0, 1, 0.1254902, 1,
-0.3762257, -0.5921215, -1.394248, 0, 1, 0.1294118, 1,
-0.3728348, -1.212431, -3.204552, 0, 1, 0.1372549, 1,
-0.3687264, 0.5633028, -0.1976605, 0, 1, 0.1411765, 1,
-0.3663187, -0.02544611, -1.415729, 0, 1, 0.1490196, 1,
-0.3622849, -0.3390143, -3.561083, 0, 1, 0.1529412, 1,
-0.3549634, -0.1582947, -2.272833, 0, 1, 0.1607843, 1,
-0.3507665, -0.7705516, -3.519426, 0, 1, 0.1647059, 1,
-0.3486439, 0.3753222, -1.219997, 0, 1, 0.172549, 1,
-0.3470757, 1.587682, 1.100818, 0, 1, 0.1764706, 1,
-0.3406456, -0.216589, -2.307668, 0, 1, 0.1843137, 1,
-0.3351918, 0.3401239, -1.361288, 0, 1, 0.1882353, 1,
-0.3339717, 0.1115639, -2.588835, 0, 1, 0.1960784, 1,
-0.332562, 1.640556, -2.357656, 0, 1, 0.2039216, 1,
-0.3273653, -0.7339329, -2.086806, 0, 1, 0.2078431, 1,
-0.31997, -0.5126966, -1.457124, 0, 1, 0.2156863, 1,
-0.319691, 0.3496257, -0.1734122, 0, 1, 0.2196078, 1,
-0.317865, -3.063415, -2.624875, 0, 1, 0.227451, 1,
-0.3162061, 0.6655609, 1.544858, 0, 1, 0.2313726, 1,
-0.3157741, -0.1388955, -1.988037, 0, 1, 0.2392157, 1,
-0.315185, 0.4619745, -0.7294174, 0, 1, 0.2431373, 1,
-0.3146607, -2.109721, -2.666024, 0, 1, 0.2509804, 1,
-0.3097138, -0.9516708, -4.308327, 0, 1, 0.254902, 1,
-0.308567, 0.5098135, 0.2936805, 0, 1, 0.2627451, 1,
-0.3075257, 0.8769373, -0.4245794, 0, 1, 0.2666667, 1,
-0.3031461, -0.1266819, -1.724523, 0, 1, 0.2745098, 1,
-0.2995198, 1.222629, -3.425242, 0, 1, 0.2784314, 1,
-0.285996, 0.3568557, -1.28023, 0, 1, 0.2862745, 1,
-0.2859405, 0.8146638, 0.2360714, 0, 1, 0.2901961, 1,
-0.2858315, 0.3662828, -1.135478, 0, 1, 0.2980392, 1,
-0.2825053, 1.231509, -0.04316531, 0, 1, 0.3058824, 1,
-0.2816902, 1.006089, -1.176222, 0, 1, 0.3098039, 1,
-0.2742568, 0.7154276, -0.9145682, 0, 1, 0.3176471, 1,
-0.2738408, -0.3524547, -3.279214, 0, 1, 0.3215686, 1,
-0.2728451, 0.3302073, 0.3944358, 0, 1, 0.3294118, 1,
-0.2710959, -1.647926, -3.894944, 0, 1, 0.3333333, 1,
-0.2657775, 0.4496068, -0.1817866, 0, 1, 0.3411765, 1,
-0.2642894, -0.7313833, -2.788939, 0, 1, 0.345098, 1,
-0.2613316, 0.2935081, -0.8900626, 0, 1, 0.3529412, 1,
-0.2575403, -0.2559411, -0.982051, 0, 1, 0.3568628, 1,
-0.2571849, 2.692019, 0.5716833, 0, 1, 0.3647059, 1,
-0.2559992, 1.505888, -0.1050233, 0, 1, 0.3686275, 1,
-0.254815, 1.224204, -1.457662, 0, 1, 0.3764706, 1,
-0.2531866, 0.3374148, 1.701074, 0, 1, 0.3803922, 1,
-0.2520749, 0.8255876, 0.9783887, 0, 1, 0.3882353, 1,
-0.2515943, -0.779308, -2.273662, 0, 1, 0.3921569, 1,
-0.2484346, 0.384524, -1.138441, 0, 1, 0.4, 1,
-0.2461146, -0.2778454, -3.25855, 0, 1, 0.4078431, 1,
-0.2457467, -0.05171016, -2.712726, 0, 1, 0.4117647, 1,
-0.2428001, 1.409846, -1.727182, 0, 1, 0.4196078, 1,
-0.2418277, -1.163304, -2.893987, 0, 1, 0.4235294, 1,
-0.2402279, -0.6102162, -3.717545, 0, 1, 0.4313726, 1,
-0.2339878, -0.7097033, -2.304602, 0, 1, 0.4352941, 1,
-0.2334723, -0.1509575, -1.929403, 0, 1, 0.4431373, 1,
-0.2314276, -1.991444, -3.277756, 0, 1, 0.4470588, 1,
-0.2306764, -0.5726926, -1.31142, 0, 1, 0.454902, 1,
-0.2287917, -0.2459317, -2.726162, 0, 1, 0.4588235, 1,
-0.2287224, -1.167163, -2.574189, 0, 1, 0.4666667, 1,
-0.2287122, -0.5827075, -2.402354, 0, 1, 0.4705882, 1,
-0.2255243, 0.3343422, 1.567654, 0, 1, 0.4784314, 1,
-0.222311, 1.204719, 0.367666, 0, 1, 0.4823529, 1,
-0.2210888, 1.214999, 1.031099, 0, 1, 0.4901961, 1,
-0.2190011, -1.797155, -2.477458, 0, 1, 0.4941176, 1,
-0.2166158, -0.9628842, -2.194611, 0, 1, 0.5019608, 1,
-0.2130768, -0.08836442, -2.868531, 0, 1, 0.509804, 1,
-0.2099975, 0.5245255, -0.8988521, 0, 1, 0.5137255, 1,
-0.205146, 0.08083684, -2.181822, 0, 1, 0.5215687, 1,
-0.2045645, 0.9198319, -1.298366, 0, 1, 0.5254902, 1,
-0.2041433, 0.424333, -1.297898, 0, 1, 0.5333334, 1,
-0.2036056, 0.5685369, -1.545833, 0, 1, 0.5372549, 1,
-0.1969634, -0.4940031, -2.364264, 0, 1, 0.5450981, 1,
-0.1943938, -0.0515935, -2.741515, 0, 1, 0.5490196, 1,
-0.1931176, -0.01366133, -1.325285, 0, 1, 0.5568628, 1,
-0.1885616, -0.3099824, -4.274154, 0, 1, 0.5607843, 1,
-0.1875936, 0.8776, -1.674226, 0, 1, 0.5686275, 1,
-0.1875665, 1.868749, -1.052397, 0, 1, 0.572549, 1,
-0.1866513, -1.561098, -3.216228, 0, 1, 0.5803922, 1,
-0.1854726, 1.471942, -0.1367398, 0, 1, 0.5843138, 1,
-0.184697, -0.08979903, -2.047597, 0, 1, 0.5921569, 1,
-0.182542, 0.01683125, -1.155558, 0, 1, 0.5960785, 1,
-0.1803604, 1.277082, 1.516101, 0, 1, 0.6039216, 1,
-0.1788875, 0.8286149, -1.285771, 0, 1, 0.6117647, 1,
-0.1777819, -0.5623721, -2.24562, 0, 1, 0.6156863, 1,
-0.1759703, 1.381675, -0.1061227, 0, 1, 0.6235294, 1,
-0.1721519, -0.7949687, -2.474229, 0, 1, 0.627451, 1,
-0.1703007, 0.8822889, -0.8667898, 0, 1, 0.6352941, 1,
-0.1690726, -1.046676, -4.084896, 0, 1, 0.6392157, 1,
-0.1663305, 0.3221718, 0.7489163, 0, 1, 0.6470588, 1,
-0.1641015, 1.238179, 0.1018196, 0, 1, 0.6509804, 1,
-0.1632718, 1.261541, -0.2761309, 0, 1, 0.6588235, 1,
-0.1612833, -0.6738605, -2.78537, 0, 1, 0.6627451, 1,
-0.1612432, 0.2131898, 0.3465054, 0, 1, 0.6705883, 1,
-0.1607169, -0.3462351, -2.838434, 0, 1, 0.6745098, 1,
-0.1587633, -0.207927, -3.700033, 0, 1, 0.682353, 1,
-0.1551622, 0.5911349, 0.008929782, 0, 1, 0.6862745, 1,
-0.1524389, -0.5029039, -3.808384, 0, 1, 0.6941177, 1,
-0.1456149, 0.8766204, -0.1025887, 0, 1, 0.7019608, 1,
-0.1330979, 1.138436, -0.3821851, 0, 1, 0.7058824, 1,
-0.1318906, -0.5172595, -2.915973, 0, 1, 0.7137255, 1,
-0.1318045, -0.1729373, -3.360621, 0, 1, 0.7176471, 1,
-0.1305525, -1.003515, -2.890165, 0, 1, 0.7254902, 1,
-0.1297742, 0.108034, -0.8625314, 0, 1, 0.7294118, 1,
-0.1295194, 0.5913184, 2.737737, 0, 1, 0.7372549, 1,
-0.1213991, 0.7039499, -0.379073, 0, 1, 0.7411765, 1,
-0.1148447, -0.7300405, -3.418527, 0, 1, 0.7490196, 1,
-0.1137141, -1.198351, -2.43405, 0, 1, 0.7529412, 1,
-0.1087461, 1.528635, -0.7073129, 0, 1, 0.7607843, 1,
-0.1082434, -1.760417, -3.669526, 0, 1, 0.7647059, 1,
-0.1029844, -0.2877315, -2.781713, 0, 1, 0.772549, 1,
-0.1015662, -0.7664101, -1.15128, 0, 1, 0.7764706, 1,
-0.09819482, 1.155348, 2.370108, 0, 1, 0.7843137, 1,
-0.0931863, 0.5728672, -0.04684099, 0, 1, 0.7882353, 1,
-0.09045731, 0.1401312, 0.03757453, 0, 1, 0.7960784, 1,
-0.09003177, 0.1935239, -0.8474647, 0, 1, 0.8039216, 1,
-0.08935585, 0.03193415, -2.635769, 0, 1, 0.8078431, 1,
-0.08702412, -0.8564829, -4.141672, 0, 1, 0.8156863, 1,
-0.08346245, -0.2845579, -3.075712, 0, 1, 0.8196079, 1,
-0.08235151, 0.4670992, 0.634933, 0, 1, 0.827451, 1,
-0.0806822, 1.736083, -0.4688256, 0, 1, 0.8313726, 1,
-0.07883229, -0.1740621, -0.7567928, 0, 1, 0.8392157, 1,
-0.07844419, 0.5749995, -0.1277899, 0, 1, 0.8431373, 1,
-0.07646544, 2.313774, -1.812813, 0, 1, 0.8509804, 1,
-0.07126767, -2.362287, -3.226377, 0, 1, 0.854902, 1,
-0.07093653, 0.3506212, -0.7412425, 0, 1, 0.8627451, 1,
-0.06968964, 0.4936498, -0.9995339, 0, 1, 0.8666667, 1,
-0.06930555, -1.057424, -2.530406, 0, 1, 0.8745098, 1,
-0.06826995, 1.679635, -0.6948331, 0, 1, 0.8784314, 1,
-0.06721963, -0.6775908, -1.285528, 0, 1, 0.8862745, 1,
-0.06431574, -0.682569, -4.750452, 0, 1, 0.8901961, 1,
-0.0636313, -0.4417628, -3.955336, 0, 1, 0.8980392, 1,
-0.06289008, -0.8353884, -2.022995, 0, 1, 0.9058824, 1,
-0.05725144, 1.151511, -1.403649, 0, 1, 0.9098039, 1,
-0.05304869, -2.056728, -3.66739, 0, 1, 0.9176471, 1,
-0.05168466, 0.3914197, -1.258303, 0, 1, 0.9215686, 1,
-0.04776666, 0.7901756, 0.6920473, 0, 1, 0.9294118, 1,
-0.04495987, -0.8202453, -4.422011, 0, 1, 0.9333333, 1,
-0.04269093, 0.5903844, 1.239786, 0, 1, 0.9411765, 1,
-0.04237176, -0.1495021, -4.408148, 0, 1, 0.945098, 1,
-0.04059707, 1.883422, -2.267164, 0, 1, 0.9529412, 1,
-0.0380066, 0.3223118, 0.2385223, 0, 1, 0.9568627, 1,
-0.03673262, -0.2257186, -4.114371, 0, 1, 0.9647059, 1,
-0.03666685, -0.3173025, -2.602869, 0, 1, 0.9686275, 1,
-0.03378952, 0.7148924, 0.5136428, 0, 1, 0.9764706, 1,
-0.02969959, -1.300401, -2.303623, 0, 1, 0.9803922, 1,
-0.02814425, 1.28995, 0.390466, 0, 1, 0.9882353, 1,
-0.02060934, -1.039577, -4.084783, 0, 1, 0.9921569, 1,
-0.02017182, -0.674643, -2.1373, 0, 1, 1, 1,
-0.01665306, -1.334086, -3.945393, 0, 0.9921569, 1, 1,
-0.01601116, -0.6081473, -2.36099, 0, 0.9882353, 1, 1,
-0.007277555, -0.8668038, -3.533849, 0, 0.9803922, 1, 1,
-0.005539653, 0.4862164, 0.6980995, 0, 0.9764706, 1, 1,
-0.000111275, -0.9795195, -2.402253, 0, 0.9686275, 1, 1,
0.001404207, 1.098387, -0.2461284, 0, 0.9647059, 1, 1,
0.008111537, 0.1042466, 0.7587091, 0, 0.9568627, 1, 1,
0.008360626, 0.3509981, -1.12727, 0, 0.9529412, 1, 1,
0.008409211, 0.2949994, 0.2203587, 0, 0.945098, 1, 1,
0.009584029, 0.619897, -1.515997, 0, 0.9411765, 1, 1,
0.0134913, 0.03600793, -1.843998, 0, 0.9333333, 1, 1,
0.01370184, -0.01507056, 1.887035, 0, 0.9294118, 1, 1,
0.01469559, 1.868165, -0.6113143, 0, 0.9215686, 1, 1,
0.01516105, -1.771224, 3.39756, 0, 0.9176471, 1, 1,
0.01908561, -1.112407, 3.311344, 0, 0.9098039, 1, 1,
0.02377698, 0.4294693, -0.3023351, 0, 0.9058824, 1, 1,
0.03467891, -0.1063127, 3.71187, 0, 0.8980392, 1, 1,
0.0378079, -2.113915, 2.916951, 0, 0.8901961, 1, 1,
0.03855794, 1.110318, -0.7149458, 0, 0.8862745, 1, 1,
0.04123296, 0.3713001, 0.1113701, 0, 0.8784314, 1, 1,
0.04261203, 0.9164487, 0.6155027, 0, 0.8745098, 1, 1,
0.04532656, 0.4657797, 0.2236474, 0, 0.8666667, 1, 1,
0.04772449, -0.7033031, 4.193041, 0, 0.8627451, 1, 1,
0.04821923, -0.7230962, 2.99031, 0, 0.854902, 1, 1,
0.0534855, -0.7745417, 2.307804, 0, 0.8509804, 1, 1,
0.06188841, -0.1728753, 1.718499, 0, 0.8431373, 1, 1,
0.06312206, 1.022343, 0.286408, 0, 0.8392157, 1, 1,
0.06341437, -0.2387159, 2.150079, 0, 0.8313726, 1, 1,
0.06788804, 0.7428446, 0.7651684, 0, 0.827451, 1, 1,
0.07236043, -1.031758, 3.820837, 0, 0.8196079, 1, 1,
0.08114728, -1.104208, 4.24164, 0, 0.8156863, 1, 1,
0.08205713, -1.250111, 3.597045, 0, 0.8078431, 1, 1,
0.08321737, 1.195972, 0.8670354, 0, 0.8039216, 1, 1,
0.08379626, 1.042279, -0.9114039, 0, 0.7960784, 1, 1,
0.08615792, 0.5819444, 1.293079, 0, 0.7882353, 1, 1,
0.09386314, -0.35065, 2.960892, 0, 0.7843137, 1, 1,
0.09712049, -0.6651468, 1.046026, 0, 0.7764706, 1, 1,
0.09734595, -0.5529138, 3.821938, 0, 0.772549, 1, 1,
0.09874567, 1.021205, -1.148707, 0, 0.7647059, 1, 1,
0.1002812, -0.9207803, 3.477559, 0, 0.7607843, 1, 1,
0.103013, -0.9063289, 1.552616, 0, 0.7529412, 1, 1,
0.1049136, 0.9984739, -0.2699729, 0, 0.7490196, 1, 1,
0.1053158, 1.587135, -0.02068386, 0, 0.7411765, 1, 1,
0.1141422, 0.008380925, 0.1298037, 0, 0.7372549, 1, 1,
0.1147835, 0.8354638, -0.6397325, 0, 0.7294118, 1, 1,
0.1181555, 0.2890902, 0.3867677, 0, 0.7254902, 1, 1,
0.1184635, -0.6152585, 2.613781, 0, 0.7176471, 1, 1,
0.1224661, -1.820847, 1.975298, 0, 0.7137255, 1, 1,
0.1229264, -0.6540616, 5.016941, 0, 0.7058824, 1, 1,
0.1288524, 0.1614979, 1.366775, 0, 0.6980392, 1, 1,
0.1296282, -0.6175463, 1.461551, 0, 0.6941177, 1, 1,
0.1319879, -1.569103, 0.5832247, 0, 0.6862745, 1, 1,
0.1367655, 0.2016924, -0.9232991, 0, 0.682353, 1, 1,
0.1371571, 0.3245091, 0.9583695, 0, 0.6745098, 1, 1,
0.1427786, 0.4508994, 0.130817, 0, 0.6705883, 1, 1,
0.1435402, -1.984225, 4.747266, 0, 0.6627451, 1, 1,
0.1455126, -0.2545461, 1.288422, 0, 0.6588235, 1, 1,
0.1458703, 2.126283, -0.991511, 0, 0.6509804, 1, 1,
0.1468682, 1.190879, 1.560992, 0, 0.6470588, 1, 1,
0.155414, -0.4897082, 3.078516, 0, 0.6392157, 1, 1,
0.1554983, 0.4745674, 0.2672688, 0, 0.6352941, 1, 1,
0.1570293, -0.6499919, 2.499308, 0, 0.627451, 1, 1,
0.1571001, -0.1982331, 2.534669, 0, 0.6235294, 1, 1,
0.1582606, 1.460394, 2.619819, 0, 0.6156863, 1, 1,
0.1637988, 0.9892071, -0.3349153, 0, 0.6117647, 1, 1,
0.1642115, -0.134641, 1.456935, 0, 0.6039216, 1, 1,
0.1666207, 0.2458122, 1.242982, 0, 0.5960785, 1, 1,
0.1690952, 2.406273, 0.06500294, 0, 0.5921569, 1, 1,
0.169672, 0.7033719, -0.5487022, 0, 0.5843138, 1, 1,
0.1710226, -0.2162316, 1.311129, 0, 0.5803922, 1, 1,
0.1726333, -0.03241894, 2.251684, 0, 0.572549, 1, 1,
0.1736012, 0.3405333, 1.411532, 0, 0.5686275, 1, 1,
0.1757236, 1.848289, -0.2965913, 0, 0.5607843, 1, 1,
0.1782554, -1.00372, 3.052815, 0, 0.5568628, 1, 1,
0.1782639, 0.03774962, 2.063188, 0, 0.5490196, 1, 1,
0.178338, 0.07867017, 1.065126, 0, 0.5450981, 1, 1,
0.186263, -0.08398238, 2.427468, 0, 0.5372549, 1, 1,
0.1865361, 0.2615057, 1.082624, 0, 0.5333334, 1, 1,
0.1906823, -1.204285, 5.024072, 0, 0.5254902, 1, 1,
0.1911473, 0.4685124, 0.1501469, 0, 0.5215687, 1, 1,
0.1915156, 0.519968, -0.5199632, 0, 0.5137255, 1, 1,
0.1919458, 0.1177808, 0.06591179, 0, 0.509804, 1, 1,
0.1960649, -1.609551, 4.847876, 0, 0.5019608, 1, 1,
0.1976782, -0.6239982, 2.234096, 0, 0.4941176, 1, 1,
0.1998431, 1.728982, 0.9146817, 0, 0.4901961, 1, 1,
0.2005319, -0.1201054, 2.494921, 0, 0.4823529, 1, 1,
0.2030448, 0.8123437, 0.2753844, 0, 0.4784314, 1, 1,
0.2035542, -0.02482881, 3.087636, 0, 0.4705882, 1, 1,
0.2064454, 0.4472736, -0.7772478, 0, 0.4666667, 1, 1,
0.2140424, 0.6173379, 1.476492, 0, 0.4588235, 1, 1,
0.2229797, -1.421714, 2.583955, 0, 0.454902, 1, 1,
0.2328867, 0.3272787, 0.1147795, 0, 0.4470588, 1, 1,
0.233459, -0.1713286, 1.508518, 0, 0.4431373, 1, 1,
0.2370768, -1.212061, 3.550362, 0, 0.4352941, 1, 1,
0.2380839, 0.6691474, -0.4635758, 0, 0.4313726, 1, 1,
0.238562, 0.797101, 0.1330808, 0, 0.4235294, 1, 1,
0.2445297, -0.6700572, 2.511133, 0, 0.4196078, 1, 1,
0.2456527, -0.1955296, 2.310519, 0, 0.4117647, 1, 1,
0.2482598, -0.8079563, 1.68161, 0, 0.4078431, 1, 1,
0.2484054, 2.366532, 1.31161, 0, 0.4, 1, 1,
0.2495758, -0.6070327, 2.702094, 0, 0.3921569, 1, 1,
0.2497652, -0.4297062, 2.728153, 0, 0.3882353, 1, 1,
0.2514776, -1.626116, 2.781915, 0, 0.3803922, 1, 1,
0.2519853, -0.789678, 0.859619, 0, 0.3764706, 1, 1,
0.2542746, -0.4260717, 1.895746, 0, 0.3686275, 1, 1,
0.2556374, 0.6341662, -0.2477693, 0, 0.3647059, 1, 1,
0.2641028, -1.291181, 5.403323, 0, 0.3568628, 1, 1,
0.2643497, -0.8504239, 3.427759, 0, 0.3529412, 1, 1,
0.2663535, 1.859188, -0.2203196, 0, 0.345098, 1, 1,
0.2666106, 0.2695455, -0.3421824, 0, 0.3411765, 1, 1,
0.2709657, -1.327807, 4.113802, 0, 0.3333333, 1, 1,
0.2752195, -0.4460433, 1.497812, 0, 0.3294118, 1, 1,
0.275785, -0.9269065, 2.19611, 0, 0.3215686, 1, 1,
0.2774642, 2.156861, -1.042909, 0, 0.3176471, 1, 1,
0.2790016, -0.169074, 3.570757, 0, 0.3098039, 1, 1,
0.2811781, -0.1684407, 3.351252, 0, 0.3058824, 1, 1,
0.2837313, 0.8820982, -0.0905299, 0, 0.2980392, 1, 1,
0.2877832, 0.06725638, -0.1531926, 0, 0.2901961, 1, 1,
0.2920807, 0.4722584, 0.5553388, 0, 0.2862745, 1, 1,
0.2921988, 0.09891748, 1.779109, 0, 0.2784314, 1, 1,
0.2922188, -0.3779383, 2.745403, 0, 0.2745098, 1, 1,
0.3007885, 0.2023744, 1.76483, 0, 0.2666667, 1, 1,
0.3012086, -0.07731146, 0.798375, 0, 0.2627451, 1, 1,
0.3014938, 0.9185557, 0.2580343, 0, 0.254902, 1, 1,
0.3035468, -2.379884, 3.384707, 0, 0.2509804, 1, 1,
0.3044675, 0.2312383, 0.5548527, 0, 0.2431373, 1, 1,
0.3090858, -0.07233296, 2.378824, 0, 0.2392157, 1, 1,
0.312048, 0.2739659, 0.02221248, 0, 0.2313726, 1, 1,
0.3153165, 0.1753761, 1.539358, 0, 0.227451, 1, 1,
0.3166672, -0.5864409, 1.406338, 0, 0.2196078, 1, 1,
0.3176511, 0.159745, 1.466248, 0, 0.2156863, 1, 1,
0.3179912, -0.9412106, 1.985503, 0, 0.2078431, 1, 1,
0.3188859, -0.8965269, 0.6281083, 0, 0.2039216, 1, 1,
0.3223397, 1.019997, 0.8660919, 0, 0.1960784, 1, 1,
0.3230578, -0.9756343, 4.325354, 0, 0.1882353, 1, 1,
0.3249258, -0.8579962, 4.20779, 0, 0.1843137, 1, 1,
0.3297652, 0.4391637, 0.3952413, 0, 0.1764706, 1, 1,
0.3310479, -1.367261, 2.045395, 0, 0.172549, 1, 1,
0.3419465, 0.09564468, 0.8366324, 0, 0.1647059, 1, 1,
0.3426597, 0.7211929, -0.3337589, 0, 0.1607843, 1, 1,
0.3433057, -0.7525123, 3.007152, 0, 0.1529412, 1, 1,
0.3490083, 0.8796363, -0.4120457, 0, 0.1490196, 1, 1,
0.3493308, 0.07819278, 2.935403, 0, 0.1411765, 1, 1,
0.3521557, 0.7670344, -0.6062431, 0, 0.1372549, 1, 1,
0.3588042, -1.035504, 2.347446, 0, 0.1294118, 1, 1,
0.3613925, 0.7726631, -0.1412133, 0, 0.1254902, 1, 1,
0.3639638, -0.05051167, 1.115882, 0, 0.1176471, 1, 1,
0.3649785, 1.492518, -0.2754865, 0, 0.1137255, 1, 1,
0.3699359, -0.7339234, 3.071497, 0, 0.1058824, 1, 1,
0.3700958, 0.3087519, 0.6299615, 0, 0.09803922, 1, 1,
0.3737864, 0.5567585, 1.693384, 0, 0.09411765, 1, 1,
0.3833923, -0.9549738, 3.138615, 0, 0.08627451, 1, 1,
0.3843158, 0.465597, 1.106643, 0, 0.08235294, 1, 1,
0.3848054, 1.129518, 0.6354326, 0, 0.07450981, 1, 1,
0.3858605, -1.669578, 3.858535, 0, 0.07058824, 1, 1,
0.3886944, 0.1669643, 0.8268822, 0, 0.0627451, 1, 1,
0.3921606, 0.8026518, -0.321345, 0, 0.05882353, 1, 1,
0.3976899, 0.2501112, -0.07889901, 0, 0.05098039, 1, 1,
0.4022419, 1.231211, 0.2229297, 0, 0.04705882, 1, 1,
0.4068576, -1.579031, 1.438949, 0, 0.03921569, 1, 1,
0.4119993, -1.424438, 3.669748, 0, 0.03529412, 1, 1,
0.4131894, -0.8748883, 4.026644, 0, 0.02745098, 1, 1,
0.4155654, 0.3893768, 0.02886922, 0, 0.02352941, 1, 1,
0.4179517, -1.205354, 4.278789, 0, 0.01568628, 1, 1,
0.4191203, 0.918571, 1.755902, 0, 0.01176471, 1, 1,
0.4254541, -0.03032849, 1.370353, 0, 0.003921569, 1, 1,
0.4258883, 2.192863, 0.6986584, 0.003921569, 0, 1, 1,
0.4295907, 0.2858211, 0.667748, 0.007843138, 0, 1, 1,
0.4304734, -1.022376, 3.457513, 0.01568628, 0, 1, 1,
0.4316068, 1.254794, -1.00472, 0.01960784, 0, 1, 1,
0.43286, 1.470155, -0.1112512, 0.02745098, 0, 1, 1,
0.4333788, 0.7987843, 1.003256, 0.03137255, 0, 1, 1,
0.4342158, -1.954766, 3.602736, 0.03921569, 0, 1, 1,
0.4428265, 0.05508557, 2.172233, 0.04313726, 0, 1, 1,
0.4429364, -1.714801, 2.495032, 0.05098039, 0, 1, 1,
0.4430274, 1.243901, -0.06982104, 0.05490196, 0, 1, 1,
0.4430678, 0.9229782, 0.9447461, 0.0627451, 0, 1, 1,
0.4465999, 0.6641698, 1.899307, 0.06666667, 0, 1, 1,
0.4559804, 0.1895424, -0.02936032, 0.07450981, 0, 1, 1,
0.4586174, -0.2008734, 1.367323, 0.07843138, 0, 1, 1,
0.4594108, -0.6239985, 1.234742, 0.08627451, 0, 1, 1,
0.4595534, -0.9621666, 2.046351, 0.09019608, 0, 1, 1,
0.4607627, -0.244224, 1.572569, 0.09803922, 0, 1, 1,
0.4612038, 0.7244071, 1.084565, 0.1058824, 0, 1, 1,
0.4673752, 0.3185948, 1.411211, 0.1098039, 0, 1, 1,
0.4778171, -0.3830821, 3.117111, 0.1176471, 0, 1, 1,
0.4789362, 1.267473, 0.06357066, 0.1215686, 0, 1, 1,
0.4798439, 2.028112, 0.8652557, 0.1294118, 0, 1, 1,
0.4868186, -2.672899, 4.090525, 0.1333333, 0, 1, 1,
0.4870547, -0.9893453, 1.071827, 0.1411765, 0, 1, 1,
0.4876721, -0.7529616, 1.625716, 0.145098, 0, 1, 1,
0.4893433, 1.779959, 0.7826154, 0.1529412, 0, 1, 1,
0.4980651, -0.7363914, 3.7607, 0.1568628, 0, 1, 1,
0.5002424, 1.732909, 0.3187355, 0.1647059, 0, 1, 1,
0.5032081, -0.9188567, 2.505317, 0.1686275, 0, 1, 1,
0.5041278, 0.528634, -0.6913167, 0.1764706, 0, 1, 1,
0.5050243, -0.6818395, -0.6532779, 0.1803922, 0, 1, 1,
0.5075005, -0.6683249, 2.434502, 0.1882353, 0, 1, 1,
0.5089589, 0.2666081, 0.3429783, 0.1921569, 0, 1, 1,
0.515047, -1.492338, 2.193961, 0.2, 0, 1, 1,
0.5170078, -0.3116725, 4.817695, 0.2078431, 0, 1, 1,
0.5292684, -1.636335, 3.849892, 0.2117647, 0, 1, 1,
0.5317219, -0.5443425, 3.585382, 0.2196078, 0, 1, 1,
0.5343679, -0.9348735, 3.429595, 0.2235294, 0, 1, 1,
0.5396086, 0.2047817, 1.069775, 0.2313726, 0, 1, 1,
0.541645, -1.947238, 3.439197, 0.2352941, 0, 1, 1,
0.5417563, -1.471917, 3.024294, 0.2431373, 0, 1, 1,
0.5452126, 1.783519, 0.9101197, 0.2470588, 0, 1, 1,
0.5460361, -0.1059403, 1.139401, 0.254902, 0, 1, 1,
0.5488641, 0.3682775, -0.9140795, 0.2588235, 0, 1, 1,
0.5507002, 0.1183788, 2.606708, 0.2666667, 0, 1, 1,
0.5516053, -0.400517, 2.333183, 0.2705882, 0, 1, 1,
0.5516235, 0.8108568, 1.590372, 0.2784314, 0, 1, 1,
0.5548896, 0.7762316, -0.1293436, 0.282353, 0, 1, 1,
0.5575833, 0.7558627, 2.674669, 0.2901961, 0, 1, 1,
0.5628112, -1.693726, 2.846769, 0.2941177, 0, 1, 1,
0.5728408, 0.2541169, 1.739264, 0.3019608, 0, 1, 1,
0.5732807, -0.8939151, -0.1143977, 0.3098039, 0, 1, 1,
0.581587, 0.3610876, 0.16865, 0.3137255, 0, 1, 1,
0.5870434, 0.3734548, 1.577234, 0.3215686, 0, 1, 1,
0.5913312, 0.7813168, 2.460636, 0.3254902, 0, 1, 1,
0.5929083, 0.09497679, 0.8935481, 0.3333333, 0, 1, 1,
0.5930009, 0.276644, 2.849348, 0.3372549, 0, 1, 1,
0.593586, 0.4338911, 1.621771, 0.345098, 0, 1, 1,
0.5958196, -0.6303114, 2.207619, 0.3490196, 0, 1, 1,
0.5997202, 0.8662549, 1.399534, 0.3568628, 0, 1, 1,
0.6123181, 1.486153, 0.03577685, 0.3607843, 0, 1, 1,
0.6222293, -1.50376, 3.805261, 0.3686275, 0, 1, 1,
0.6228077, -0.1773439, 1.803108, 0.372549, 0, 1, 1,
0.623931, 1.06504, 0.07816695, 0.3803922, 0, 1, 1,
0.6253957, -1.52114, 3.260166, 0.3843137, 0, 1, 1,
0.6258136, -0.5613931, 1.07812, 0.3921569, 0, 1, 1,
0.6266932, -1.583473, 3.05555, 0.3960784, 0, 1, 1,
0.6308966, -0.1894458, 1.527643, 0.4039216, 0, 1, 1,
0.6339155, 0.5225719, -1.081743, 0.4117647, 0, 1, 1,
0.6350695, -1.019177, 3.845366, 0.4156863, 0, 1, 1,
0.6371124, -0.840187, 3.950597, 0.4235294, 0, 1, 1,
0.6397971, -0.3653756, 3.132537, 0.427451, 0, 1, 1,
0.6428272, -1.261739, 2.562088, 0.4352941, 0, 1, 1,
0.6436138, -1.882754, 3.74629, 0.4392157, 0, 1, 1,
0.6461991, -0.8730655, 3.696331, 0.4470588, 0, 1, 1,
0.6484556, -0.8035896, 2.102565, 0.4509804, 0, 1, 1,
0.6511213, 0.3312355, 2.397412, 0.4588235, 0, 1, 1,
0.6602419, -0.6487071, 0.9452178, 0.4627451, 0, 1, 1,
0.6632938, -1.4487, 3.347122, 0.4705882, 0, 1, 1,
0.6663223, 1.067076, 1.801114, 0.4745098, 0, 1, 1,
0.6680901, 0.9418925, -0.07322777, 0.4823529, 0, 1, 1,
0.6682177, 1.417882, -0.190967, 0.4862745, 0, 1, 1,
0.6683376, 0.2908533, 0.963374, 0.4941176, 0, 1, 1,
0.669411, -0.5613734, 2.455301, 0.5019608, 0, 1, 1,
0.6711158, -1.244472, 3.540388, 0.5058824, 0, 1, 1,
0.6719726, 0.7999966, -0.1414105, 0.5137255, 0, 1, 1,
0.6788295, 1.585665, -0.1045329, 0.5176471, 0, 1, 1,
0.6798713, -1.104405, 1.172867, 0.5254902, 0, 1, 1,
0.6985886, 1.359181, 0.8178627, 0.5294118, 0, 1, 1,
0.7011889, 0.6064048, -0.3540627, 0.5372549, 0, 1, 1,
0.7046404, 0.8289483, 2.018923, 0.5411765, 0, 1, 1,
0.7079868, -0.4832557, 3.209953, 0.5490196, 0, 1, 1,
0.7109907, 1.293242, 0.495782, 0.5529412, 0, 1, 1,
0.7152215, -1.508376, 1.565441, 0.5607843, 0, 1, 1,
0.7309471, 0.02494025, 1.779046, 0.5647059, 0, 1, 1,
0.7348254, -0.2611634, 3.406229, 0.572549, 0, 1, 1,
0.737749, -0.7499802, 0.178453, 0.5764706, 0, 1, 1,
0.7410174, 1.228801, 2.550898, 0.5843138, 0, 1, 1,
0.7449691, -0.2540593, -0.2487348, 0.5882353, 0, 1, 1,
0.7459452, 1.782267, 1.580362, 0.5960785, 0, 1, 1,
0.746147, 0.9993066, 0.879924, 0.6039216, 0, 1, 1,
0.7469665, -0.2463046, 2.953336, 0.6078432, 0, 1, 1,
0.7483089, 0.2520205, -1.287301, 0.6156863, 0, 1, 1,
0.748657, -0.1766193, 1.334164, 0.6196079, 0, 1, 1,
0.7494873, 1.749028, -0.7091903, 0.627451, 0, 1, 1,
0.7559294, 0.282785, 0.6476819, 0.6313726, 0, 1, 1,
0.7589504, 1.522301, 1.522588, 0.6392157, 0, 1, 1,
0.7604924, 0.8023689, 2.372235, 0.6431373, 0, 1, 1,
0.7617338, 0.9815381, 1.682849, 0.6509804, 0, 1, 1,
0.7628778, -0.01625606, 1.247445, 0.654902, 0, 1, 1,
0.7636633, 0.34472, 0.2899735, 0.6627451, 0, 1, 1,
0.7652036, -1.481551, 3.194226, 0.6666667, 0, 1, 1,
0.7703287, 0.5222779, 1.705848, 0.6745098, 0, 1, 1,
0.7723945, 0.1704435, 3.169019, 0.6784314, 0, 1, 1,
0.773472, -0.07305997, 1.054899, 0.6862745, 0, 1, 1,
0.7745565, 1.004885, 0.02891366, 0.6901961, 0, 1, 1,
0.7788981, -2.482846, 2.456366, 0.6980392, 0, 1, 1,
0.7873021, -0.7952343, 2.761951, 0.7058824, 0, 1, 1,
0.7875465, 0.5341884, 1.961098, 0.7098039, 0, 1, 1,
0.7883366, 0.1076966, 1.217588, 0.7176471, 0, 1, 1,
0.7939752, -0.636508, 3.596927, 0.7215686, 0, 1, 1,
0.8013169, 0.02219193, 2.049467, 0.7294118, 0, 1, 1,
0.8077521, -0.1093745, 0.4537575, 0.7333333, 0, 1, 1,
0.8103135, -0.153102, 2.930698, 0.7411765, 0, 1, 1,
0.8131298, -0.6334307, 1.20848, 0.7450981, 0, 1, 1,
0.8142442, 1.379594, 1.459169, 0.7529412, 0, 1, 1,
0.8222581, 0.7121021, 1.883949, 0.7568628, 0, 1, 1,
0.8333948, 1.503523, 0.4250798, 0.7647059, 0, 1, 1,
0.8338019, -0.824573, 2.189273, 0.7686275, 0, 1, 1,
0.8411689, 0.2924607, 1.735958, 0.7764706, 0, 1, 1,
0.8446059, -0.8872225, 2.626721, 0.7803922, 0, 1, 1,
0.8505404, 0.443462, 0.7990851, 0.7882353, 0, 1, 1,
0.8518915, 3.247386, 1.072503, 0.7921569, 0, 1, 1,
0.8524206, 0.1708611, 1.118549, 0.8, 0, 1, 1,
0.8566582, -0.3195289, 0.9006037, 0.8078431, 0, 1, 1,
0.8570455, 0.09120756, 1.598865, 0.8117647, 0, 1, 1,
0.857891, -1.050631, 2.490502, 0.8196079, 0, 1, 1,
0.8635451, 1.863879, -0.08264081, 0.8235294, 0, 1, 1,
0.8735507, 0.1214605, 3.881416, 0.8313726, 0, 1, 1,
0.8737968, 0.7433479, 2.012026, 0.8352941, 0, 1, 1,
0.874169, -1.708958, 2.324694, 0.8431373, 0, 1, 1,
0.8776448, 1.968127, 0.4988373, 0.8470588, 0, 1, 1,
0.8776911, -1.557635, 1.121859, 0.854902, 0, 1, 1,
0.8780166, 0.1970721, 0.8618767, 0.8588235, 0, 1, 1,
0.8784262, 1.708274, 0.705473, 0.8666667, 0, 1, 1,
0.8805914, 0.6038366, 2.590854, 0.8705882, 0, 1, 1,
0.8905329, 0.08324174, 0.1899068, 0.8784314, 0, 1, 1,
0.8906987, 0.8019583, 1.015558, 0.8823529, 0, 1, 1,
0.8980427, -0.9654142, 2.479632, 0.8901961, 0, 1, 1,
0.9037098, 0.2809189, 0.8065773, 0.8941177, 0, 1, 1,
0.9105631, 1.129544, 1.9162, 0.9019608, 0, 1, 1,
0.9146527, 0.284256, 2.57003, 0.9098039, 0, 1, 1,
0.914775, 0.01000315, 1.506343, 0.9137255, 0, 1, 1,
0.9212031, 1.055793, 0.6234086, 0.9215686, 0, 1, 1,
0.9262425, 0.7891222, 1.4034, 0.9254902, 0, 1, 1,
0.9302524, -0.1303257, 2.272999, 0.9333333, 0, 1, 1,
0.9391398, -0.3805611, 1.25852, 0.9372549, 0, 1, 1,
0.9401673, 0.4243455, 1.57329, 0.945098, 0, 1, 1,
0.9417439, 1.629097, 0.6430912, 0.9490196, 0, 1, 1,
0.9444658, -1.149214, 0.4452812, 0.9568627, 0, 1, 1,
0.9527084, 1.398321, 0.1172491, 0.9607843, 0, 1, 1,
0.9643168, 0.7987937, 0.4182699, 0.9686275, 0, 1, 1,
0.9778408, 0.930954, -0.3201555, 0.972549, 0, 1, 1,
0.9782363, 0.7872459, 1.28883, 0.9803922, 0, 1, 1,
0.9826789, 0.627741, 0.4460182, 0.9843137, 0, 1, 1,
0.9884639, -0.6249347, 2.69636, 0.9921569, 0, 1, 1,
0.993551, -0.138999, 1.447853, 0.9960784, 0, 1, 1,
0.9956884, 0.2258354, 1.578225, 1, 0, 0.9960784, 1,
0.9966139, 1.54296, 0.7539861, 1, 0, 0.9882353, 1,
0.9977706, -0.8137575, 0.0812607, 1, 0, 0.9843137, 1,
1.001174, -0.1820855, 0.3188453, 1, 0, 0.9764706, 1,
1.003029, 0.4377294, 0.8622482, 1, 0, 0.972549, 1,
1.005862, 0.5409713, 2.349253, 1, 0, 0.9647059, 1,
1.013431, -1.084612, 2.042874, 1, 0, 0.9607843, 1,
1.015473, -0.09424017, 1.32898, 1, 0, 0.9529412, 1,
1.01628, 0.03136071, 2.845716, 1, 0, 0.9490196, 1,
1.023621, -1.660159, 0.6629351, 1, 0, 0.9411765, 1,
1.025126, -1.27383, 1.916569, 1, 0, 0.9372549, 1,
1.028849, -0.3969544, 0.6862658, 1, 0, 0.9294118, 1,
1.038609, 1.200009, 0.3159953, 1, 0, 0.9254902, 1,
1.04549, 1.1722, 1.75823, 1, 0, 0.9176471, 1,
1.049363, -0.129487, 0.9161782, 1, 0, 0.9137255, 1,
1.049911, 0.1451622, 2.610598, 1, 0, 0.9058824, 1,
1.050027, 0.3435149, 0.1333311, 1, 0, 0.9019608, 1,
1.060127, 0.3821043, 2.958672, 1, 0, 0.8941177, 1,
1.064171, 2.015564, 2.063424, 1, 0, 0.8862745, 1,
1.072166, -0.1592163, 0.06022928, 1, 0, 0.8823529, 1,
1.075583, 0.4595507, 0.513653, 1, 0, 0.8745098, 1,
1.076862, 0.9903386, 0.965701, 1, 0, 0.8705882, 1,
1.084266, -1.331654, 4.420639, 1, 0, 0.8627451, 1,
1.08461, 0.5286055, 0.8641732, 1, 0, 0.8588235, 1,
1.085502, -0.239399, 2.732604, 1, 0, 0.8509804, 1,
1.093916, 0.08212516, 1.118219, 1, 0, 0.8470588, 1,
1.099544, -0.2981795, 3.987372, 1, 0, 0.8392157, 1,
1.102825, 0.1504419, 1.634888, 1, 0, 0.8352941, 1,
1.114607, 1.202392, 0.8705015, 1, 0, 0.827451, 1,
1.12027, 0.8728809, 2.795729, 1, 0, 0.8235294, 1,
1.125196, -0.657683, 0.8457551, 1, 0, 0.8156863, 1,
1.127687, 0.6948422, 1.62033, 1, 0, 0.8117647, 1,
1.136988, -1.576672, 0.4265308, 1, 0, 0.8039216, 1,
1.139658, -0.3097987, 2.81115, 1, 0, 0.7960784, 1,
1.142738, 0.6234376, 1.531047, 1, 0, 0.7921569, 1,
1.145994, -0.7139423, 2.181818, 1, 0, 0.7843137, 1,
1.15517, -0.1701221, 0.408063, 1, 0, 0.7803922, 1,
1.156345, -0.6680035, 2.390439, 1, 0, 0.772549, 1,
1.160188, -1.392529, 1.477857, 1, 0, 0.7686275, 1,
1.161142, -0.5008598, 0.504431, 1, 0, 0.7607843, 1,
1.170079, 0.9747336, -0.4425783, 1, 0, 0.7568628, 1,
1.173054, 0.734332, 1.068586, 1, 0, 0.7490196, 1,
1.17762, -0.6918805, 2.750871, 1, 0, 0.7450981, 1,
1.177955, -0.6890074, 3.443464, 1, 0, 0.7372549, 1,
1.183179, 2.199624, 2.04794, 1, 0, 0.7333333, 1,
1.192073, 1.560161, 0.8775503, 1, 0, 0.7254902, 1,
1.199461, -1.907846, 2.287401, 1, 0, 0.7215686, 1,
1.208389, 0.4104644, 0.1432655, 1, 0, 0.7137255, 1,
1.208906, 1.0701, 1.023221, 1, 0, 0.7098039, 1,
1.213894, -1.200963, 3.08977, 1, 0, 0.7019608, 1,
1.216419, -1.973982, 2.511516, 1, 0, 0.6941177, 1,
1.217563, -0.4148612, 0.9556543, 1, 0, 0.6901961, 1,
1.225215, 0.9569533, 0.644011, 1, 0, 0.682353, 1,
1.236739, 0.8942732, 2.087487, 1, 0, 0.6784314, 1,
1.257185, 1.793797, 1.363145, 1, 0, 0.6705883, 1,
1.259116, 0.1399433, 0.9465048, 1, 0, 0.6666667, 1,
1.261115, 1.161893, 0.2771226, 1, 0, 0.6588235, 1,
1.270844, 0.1954878, 0.5467092, 1, 0, 0.654902, 1,
1.272725, 2.050938, 0.1024548, 1, 0, 0.6470588, 1,
1.275356, -0.1378936, 2.377429, 1, 0, 0.6431373, 1,
1.278635, 0.01758778, 5.049072, 1, 0, 0.6352941, 1,
1.282261, -1.039348, 4.04923, 1, 0, 0.6313726, 1,
1.289156, 0.5911279, -0.7346554, 1, 0, 0.6235294, 1,
1.296841, -0.8952106, 3.334721, 1, 0, 0.6196079, 1,
1.296872, 0.8360665, 2.165628, 1, 0, 0.6117647, 1,
1.299236, 0.6489599, 1.111238, 1, 0, 0.6078432, 1,
1.300311, 1.248669, 1.046327, 1, 0, 0.6, 1,
1.301984, -0.2644446, 1.236328, 1, 0, 0.5921569, 1,
1.31065, 0.2529418, 0.4932787, 1, 0, 0.5882353, 1,
1.311112, -0.2393867, -1.390964, 1, 0, 0.5803922, 1,
1.317973, 0.7533125, 1.550693, 1, 0, 0.5764706, 1,
1.31816, 0.05490909, 1.583867, 1, 0, 0.5686275, 1,
1.341064, -1.697487, 2.987004, 1, 0, 0.5647059, 1,
1.348538, 0.437327, 3.301463, 1, 0, 0.5568628, 1,
1.358243, -2.048652, 3.619626, 1, 0, 0.5529412, 1,
1.370457, 0.2702624, 0.6971365, 1, 0, 0.5450981, 1,
1.394188, 0.3618383, 0.828981, 1, 0, 0.5411765, 1,
1.402473, 0.05271065, 2.171579, 1, 0, 0.5333334, 1,
1.40807, 0.08889017, 2.117345, 1, 0, 0.5294118, 1,
1.425103, -0.540861, 2.57497, 1, 0, 0.5215687, 1,
1.429411, 0.02809959, 0.5724435, 1, 0, 0.5176471, 1,
1.430272, 0.8214302, 0.5358506, 1, 0, 0.509804, 1,
1.436427, 0.8844725, 2.18889, 1, 0, 0.5058824, 1,
1.436451, -0.8299761, 4.033049, 1, 0, 0.4980392, 1,
1.456352, 0.4124467, 1.158663, 1, 0, 0.4901961, 1,
1.4569, -0.7484714, 3.440588, 1, 0, 0.4862745, 1,
1.458751, 0.5707399, 0.05228499, 1, 0, 0.4784314, 1,
1.4698, 1.209721, 1.651365, 1, 0, 0.4745098, 1,
1.471569, -0.1095564, 2.552117, 1, 0, 0.4666667, 1,
1.475109, 0.8424973, 0.715165, 1, 0, 0.4627451, 1,
1.480743, 0.4146564, 0.6727192, 1, 0, 0.454902, 1,
1.483166, -0.6609271, 2.497764, 1, 0, 0.4509804, 1,
1.49442, 0.8003122, 1.367962, 1, 0, 0.4431373, 1,
1.498148, -0.7779984, 1.245654, 1, 0, 0.4392157, 1,
1.50065, -0.4839498, 3.111227, 1, 0, 0.4313726, 1,
1.502305, 0.8828679, 2.151592, 1, 0, 0.427451, 1,
1.505032, -1.965936, 1.082265, 1, 0, 0.4196078, 1,
1.505513, -0.5514937, 1.561493, 1, 0, 0.4156863, 1,
1.51301, -0.3501432, 3.691084, 1, 0, 0.4078431, 1,
1.515921, -0.6962283, 3.534279, 1, 0, 0.4039216, 1,
1.522771, -0.4892974, 1.650337, 1, 0, 0.3960784, 1,
1.52919, 0.9111614, 0.6545912, 1, 0, 0.3882353, 1,
1.539372, 0.8614358, 2.339035, 1, 0, 0.3843137, 1,
1.541322, 0.5203766, 2.375598, 1, 0, 0.3764706, 1,
1.566101, 0.9781653, 1.36856, 1, 0, 0.372549, 1,
1.56662, -0.08775403, 1.158926, 1, 0, 0.3647059, 1,
1.570115, -0.8982404, 2.310407, 1, 0, 0.3607843, 1,
1.572723, 0.08220656, 2.676193, 1, 0, 0.3529412, 1,
1.573545, 1.91299, -0.8323053, 1, 0, 0.3490196, 1,
1.574187, 0.4368975, -0.4377648, 1, 0, 0.3411765, 1,
1.574432, 1.082986, 1.803931, 1, 0, 0.3372549, 1,
1.576677, 0.3999328, 1.050591, 1, 0, 0.3294118, 1,
1.577501, -0.1870095, 0.9173962, 1, 0, 0.3254902, 1,
1.581496, 2.576569, 1.051633, 1, 0, 0.3176471, 1,
1.586125, -1.081267, 0.3046191, 1, 0, 0.3137255, 1,
1.592694, 0.301117, -0.5279886, 1, 0, 0.3058824, 1,
1.603362, -0.3176643, 1.350233, 1, 0, 0.2980392, 1,
1.615716, -0.3716969, 1.669529, 1, 0, 0.2941177, 1,
1.623863, 2.370906, -0.5077568, 1, 0, 0.2862745, 1,
1.625314, -1.432436, 2.746231, 1, 0, 0.282353, 1,
1.642022, -0.3409665, 3.233152, 1, 0, 0.2745098, 1,
1.659206, 1.66863, -0.3893493, 1, 0, 0.2705882, 1,
1.666491, -2.095965, 2.825108, 1, 0, 0.2627451, 1,
1.695218, 2.690209, 1.947996, 1, 0, 0.2588235, 1,
1.699963, 0.08278383, 0.7637843, 1, 0, 0.2509804, 1,
1.716385, -0.1698869, 1.106699, 1, 0, 0.2470588, 1,
1.731846, 0.01498377, 2.827202, 1, 0, 0.2392157, 1,
1.743883, 2.115823, 1.078283, 1, 0, 0.2352941, 1,
1.769416, 0.5170667, 2.323943, 1, 0, 0.227451, 1,
1.784378, 0.4918101, 1.689348, 1, 0, 0.2235294, 1,
1.841375, 1.277594, 1.506495, 1, 0, 0.2156863, 1,
1.842856, -2.541134, 2.135062, 1, 0, 0.2117647, 1,
1.868748, 2.04319, 2.241959, 1, 0, 0.2039216, 1,
1.868828, 0.7519705, 1.482891, 1, 0, 0.1960784, 1,
1.878988, -3.065744, 0.594054, 1, 0, 0.1921569, 1,
1.881018, 1.221893, 1.901897, 1, 0, 0.1843137, 1,
1.905722, -1.858259, 4.383337, 1, 0, 0.1803922, 1,
1.916875, -0.2913781, 2.849103, 1, 0, 0.172549, 1,
1.920664, 0.2023907, 2.400882, 1, 0, 0.1686275, 1,
1.924641, 0.009630637, 2.944726, 1, 0, 0.1607843, 1,
1.945771, -1.839573, 2.449472, 1, 0, 0.1568628, 1,
1.946343, 1.53177, 0.2454975, 1, 0, 0.1490196, 1,
1.979049, 0.2080338, 2.168337, 1, 0, 0.145098, 1,
2.00439, 0.9007811, 1.125067, 1, 0, 0.1372549, 1,
2.030647, 1.674854, 0.3818494, 1, 0, 0.1333333, 1,
2.039399, -1.236509, 1.984385, 1, 0, 0.1254902, 1,
2.054412, 0.3196093, 1.334552, 1, 0, 0.1215686, 1,
2.081266, 0.786337, 1.778688, 1, 0, 0.1137255, 1,
2.110996, -0.2134723, -0.2750162, 1, 0, 0.1098039, 1,
2.133883, 0.3739526, 0.5241093, 1, 0, 0.1019608, 1,
2.173432, 0.2573037, 1.981109, 1, 0, 0.09411765, 1,
2.19174, 1.256131, 0.2947633, 1, 0, 0.09019608, 1,
2.22037, 0.3673451, 0.9184684, 1, 0, 0.08235294, 1,
2.338954, -0.299093, 2.972901, 1, 0, 0.07843138, 1,
2.414008, -0.2816278, 2.448359, 1, 0, 0.07058824, 1,
2.472059, -1.161063, 1.79891, 1, 0, 0.06666667, 1,
2.489106, -1.951865, 2.105251, 1, 0, 0.05882353, 1,
2.523189, 0.0928294, 2.043663, 1, 0, 0.05490196, 1,
2.630921, 1.970192, 1.751622, 1, 0, 0.04705882, 1,
2.764569, 2.128888, 1.833233, 1, 0, 0.04313726, 1,
2.789797, 0.8805854, 0.3965901, 1, 0, 0.03529412, 1,
2.82048, -0.7409336, 2.202006, 1, 0, 0.03137255, 1,
2.847647, 0.9084399, 0.3088739, 1, 0, 0.02352941, 1,
2.875175, 0.557569, 2.09168, 1, 0, 0.01960784, 1,
3.029717, 0.3559755, 1.952708, 1, 0, 0.01176471, 1,
3.560405, -0.7139727, 1.336152, 1, 0, 0.007843138, 1
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
0.1663823, -4.135819, -8.136292, 0, -0.5, 0.5, 0.5,
0.1663823, -4.135819, -8.136292, 1, -0.5, 0.5, 0.5,
0.1663823, -4.135819, -8.136292, 1, 1.5, 0.5, 0.5,
0.1663823, -4.135819, -8.136292, 0, 1.5, 0.5, 0.5
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
-4.378214, 0.09082127, -8.136292, 0, -0.5, 0.5, 0.5,
-4.378214, 0.09082127, -8.136292, 1, -0.5, 0.5, 0.5,
-4.378214, 0.09082127, -8.136292, 1, 1.5, 0.5, 0.5,
-4.378214, 0.09082127, -8.136292, 0, 1.5, 0.5, 0.5
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
-4.378214, -4.135819, -0.3853114, 0, -0.5, 0.5, 0.5,
-4.378214, -4.135819, -0.3853114, 1, -0.5, 0.5, 0.5,
-4.378214, -4.135819, -0.3853114, 1, 1.5, 0.5, 0.5,
-4.378214, -4.135819, -0.3853114, 0, 1.5, 0.5, 0.5
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
-3, -3.160441, -6.347604,
3, -3.160441, -6.347604,
-3, -3.160441, -6.347604,
-3, -3.323004, -6.645719,
-2, -3.160441, -6.347604,
-2, -3.323004, -6.645719,
-1, -3.160441, -6.347604,
-1, -3.323004, -6.645719,
0, -3.160441, -6.347604,
0, -3.323004, -6.645719,
1, -3.160441, -6.347604,
1, -3.323004, -6.645719,
2, -3.160441, -6.347604,
2, -3.323004, -6.645719,
3, -3.160441, -6.347604,
3, -3.323004, -6.645719
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
"-3",
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
-3, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
-3, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
-3, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
-3, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
-2, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
-2, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
-2, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
-2, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
-1, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
-1, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
-1, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
-1, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
0, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
0, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
0, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
0, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
1, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
1, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
1, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
1, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
2, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
2, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
2, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
2, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5,
3, -3.64813, -7.241949, 0, -0.5, 0.5, 0.5,
3, -3.64813, -7.241949, 1, -0.5, 0.5, 0.5,
3, -3.64813, -7.241949, 1, 1.5, 0.5, 0.5,
3, -3.64813, -7.241949, 0, 1.5, 0.5, 0.5
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
-3.329461, -3, -6.347604,
-3.329461, 3, -6.347604,
-3.329461, -3, -6.347604,
-3.504253, -3, -6.645719,
-3.329461, -2, -6.347604,
-3.504253, -2, -6.645719,
-3.329461, -1, -6.347604,
-3.504253, -1, -6.645719,
-3.329461, 0, -6.347604,
-3.504253, 0, -6.645719,
-3.329461, 1, -6.347604,
-3.504253, 1, -6.645719,
-3.329461, 2, -6.347604,
-3.504253, 2, -6.645719,
-3.329461, 3, -6.347604,
-3.504253, 3, -6.645719
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
-3.853838, -3, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, -3, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, -3, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, -3, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, -2, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, -2, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, -2, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, -2, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, -1, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, -1, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, -1, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, -1, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, 0, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, 0, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, 0, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, 0, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, 1, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, 1, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, 1, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, 1, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, 2, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, 2, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, 2, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, 2, -7.241949, 0, 1.5, 0.5, 0.5,
-3.853838, 3, -7.241949, 0, -0.5, 0.5, 0.5,
-3.853838, 3, -7.241949, 1, -0.5, 0.5, 0.5,
-3.853838, 3, -7.241949, 1, 1.5, 0.5, 0.5,
-3.853838, 3, -7.241949, 0, 1.5, 0.5, 0.5
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
-3.329461, -3.160441, -6,
-3.329461, -3.160441, 4,
-3.329461, -3.160441, -6,
-3.504253, -3.323004, -6,
-3.329461, -3.160441, -4,
-3.504253, -3.323004, -4,
-3.329461, -3.160441, -2,
-3.504253, -3.323004, -2,
-3.329461, -3.160441, 0,
-3.504253, -3.323004, 0,
-3.329461, -3.160441, 2,
-3.504253, -3.323004, 2,
-3.329461, -3.160441, 4,
-3.504253, -3.323004, 4
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
-3.853838, -3.64813, -6, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -6, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -6, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, -6, 0, 1.5, 0.5, 0.5,
-3.853838, -3.64813, -4, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -4, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -4, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, -4, 0, 1.5, 0.5, 0.5,
-3.853838, -3.64813, -2, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -2, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, -2, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, -2, 0, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 0, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 0, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 0, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 0, 0, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 2, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 2, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 2, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 2, 0, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 4, 0, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 4, 1, -0.5, 0.5, 0.5,
-3.853838, -3.64813, 4, 1, 1.5, 0.5, 0.5,
-3.853838, -3.64813, 4, 0, 1.5, 0.5, 0.5
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
-3.329461, -3.160441, -6.347604,
-3.329461, 3.342083, -6.347604,
-3.329461, -3.160441, 5.576982,
-3.329461, 3.342083, 5.576982,
-3.329461, -3.160441, -6.347604,
-3.329461, -3.160441, 5.576982,
-3.329461, 3.342083, -6.347604,
-3.329461, 3.342083, 5.576982,
-3.329461, -3.160441, -6.347604,
3.662226, -3.160441, -6.347604,
-3.329461, -3.160441, 5.576982,
3.662226, -3.160441, 5.576982,
-3.329461, 3.342083, -6.347604,
3.662226, 3.342083, -6.347604,
-3.329461, 3.342083, 5.576982,
3.662226, 3.342083, 5.576982,
3.662226, -3.160441, -6.347604,
3.662226, 3.342083, -6.347604,
3.662226, -3.160441, 5.576982,
3.662226, 3.342083, 5.576982,
3.662226, -3.160441, -6.347604,
3.662226, -3.160441, 5.576982,
3.662226, 3.342083, -6.347604,
3.662226, 3.342083, 5.576982
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
var radius = 8.157194;
var distance = 36.29227;
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
mvMatrix.translate( -0.1663823, -0.09082127, 0.3853114 );
mvMatrix.scale( 1.261458, 1.356353, 0.7396246 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.29227);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Milbemectin_A4<-read.table("Milbemectin_A4.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Milbemectin_A4$V2
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A4' not found
```

```r
y<-Milbemectin_A4$V3
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A4' not found
```

```r
z<-Milbemectin_A4$V4
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A4' not found
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
-3.227641, -0.8695247, -2.028042, 0, 0, 1, 1, 1,
-2.879692, -1.113201, -1.887801, 1, 0, 0, 1, 1,
-2.68155, 0.2599906, -2.688786, 1, 0, 0, 1, 1,
-2.633942, -0.6678287, -1.04514, 1, 0, 0, 1, 1,
-2.590737, 1.459363, -2.506897, 1, 0, 0, 1, 1,
-2.505445, 0.9486765, -1.65673, 1, 0, 0, 1, 1,
-2.418828, 1.194782, -0.5105413, 0, 0, 0, 1, 1,
-2.365313, -1.008381, -1.959897, 0, 0, 0, 1, 1,
-2.355494, -0.9877135, -2.421251, 0, 0, 0, 1, 1,
-2.342644, -0.3020528, -1.696029, 0, 0, 0, 1, 1,
-2.314138, -0.9851198, -2.150872, 0, 0, 0, 1, 1,
-2.304039, -2.420981, -3.736978, 0, 0, 0, 1, 1,
-2.233374, -1.15094, -3.052096, 0, 0, 0, 1, 1,
-2.222778, 0.5297029, -0.9768983, 1, 1, 1, 1, 1,
-2.111967, -1.303508, -1.352818, 1, 1, 1, 1, 1,
-2.105014, -0.2448998, -2.018624, 1, 1, 1, 1, 1,
-2.099514, 0.08887825, -1.221947, 1, 1, 1, 1, 1,
-2.091036, 2.351959, -1.902956, 1, 1, 1, 1, 1,
-2.085027, 0.1322133, -1.921897, 1, 1, 1, 1, 1,
-2.073761, -1.229321, -1.41836, 1, 1, 1, 1, 1,
-2.073584, -0.503897, -2.564024, 1, 1, 1, 1, 1,
-2.021008, 0.8089137, -2.106537, 1, 1, 1, 1, 1,
-2.001607, -1.997791, -2.928315, 1, 1, 1, 1, 1,
-1.992946, 0.2798326, 1.162112, 1, 1, 1, 1, 1,
-1.9868, -1.512402, -2.918511, 1, 1, 1, 1, 1,
-1.972809, -1.271424, -3.504002, 1, 1, 1, 1, 1,
-1.9364, 0.3576907, -2.162536, 1, 1, 1, 1, 1,
-1.9354, 0.2075495, -0.4010165, 1, 1, 1, 1, 1,
-1.934024, -1.142016, -1.056088, 0, 0, 1, 1, 1,
-1.922524, -1.946921, -2.225555, 1, 0, 0, 1, 1,
-1.876378, -0.8594192, -1.44163, 1, 0, 0, 1, 1,
-1.855407, 0.1274461, -1.187042, 1, 0, 0, 1, 1,
-1.841686, 0.4153074, -3.926547, 1, 0, 0, 1, 1,
-1.835374, -0.087535, -1.658047, 1, 0, 0, 1, 1,
-1.812406, 1.308969, -0.5938776, 0, 0, 0, 1, 1,
-1.806461, -0.9317648, -3.501908, 0, 0, 0, 1, 1,
-1.787463, 0.8117363, -1.46306, 0, 0, 0, 1, 1,
-1.786699, 0.7339355, -1.222906, 0, 0, 0, 1, 1,
-1.779459, 1.464908, -2.576057, 0, 0, 0, 1, 1,
-1.765152, -0.9536858, -1.966949, 0, 0, 0, 1, 1,
-1.749231, -0.342896, -0.3524752, 0, 0, 0, 1, 1,
-1.747835, 0.9322809, -0.07835016, 1, 1, 1, 1, 1,
-1.740792, -0.302266, -1.187509, 1, 1, 1, 1, 1,
-1.733471, -1.879345, -2.026752, 1, 1, 1, 1, 1,
-1.725703, 1.510411, -2.222543, 1, 1, 1, 1, 1,
-1.702625, 0.7580714, -1.649383, 1, 1, 1, 1, 1,
-1.698732, 0.503644, -2.129247, 1, 1, 1, 1, 1,
-1.689828, -0.1771158, -1.550271, 1, 1, 1, 1, 1,
-1.677737, -0.9642853, -1.927711, 1, 1, 1, 1, 1,
-1.662466, 0.7891883, -1.303705, 1, 1, 1, 1, 1,
-1.641772, 0.6184308, -2.360424, 1, 1, 1, 1, 1,
-1.636316, 0.2579732, -0.2025715, 1, 1, 1, 1, 1,
-1.62672, -0.5226766, -4.137633, 1, 1, 1, 1, 1,
-1.605591, -2.524419, -1.326562, 1, 1, 1, 1, 1,
-1.58468, 1.928445, -0.7199987, 1, 1, 1, 1, 1,
-1.575018, 1.704592, -1.346349, 1, 1, 1, 1, 1,
-1.540076, 0.7910166, -2.722728, 0, 0, 1, 1, 1,
-1.528036, -0.8340336, -1.682788, 1, 0, 0, 1, 1,
-1.506778, 1.267149, -0.753379, 1, 0, 0, 1, 1,
-1.504718, 0.2289678, -0.2805674, 1, 0, 0, 1, 1,
-1.479275, 1.237456, -3.206578, 1, 0, 0, 1, 1,
-1.478202, -1.268676, -2.891033, 1, 0, 0, 1, 1,
-1.474669, 0.3065941, -1.07677, 0, 0, 0, 1, 1,
-1.456048, -0.3798154, -1.379992, 0, 0, 0, 1, 1,
-1.45588, 0.1093883, -2.808951, 0, 0, 0, 1, 1,
-1.453812, 0.1973514, -1.565346, 0, 0, 0, 1, 1,
-1.443904, -0.1341648, -1.613725, 0, 0, 0, 1, 1,
-1.442497, -0.4422939, -2.623397, 0, 0, 0, 1, 1,
-1.442147, 1.549086, -0.0751299, 0, 0, 0, 1, 1,
-1.440578, 1.894313, -1.45339, 1, 1, 1, 1, 1,
-1.439073, -0.293776, -0.4256648, 1, 1, 1, 1, 1,
-1.433146, 1.885352, 0.3025775, 1, 1, 1, 1, 1,
-1.432483, -1.64119, -2.292887, 1, 1, 1, 1, 1,
-1.431655, 0.3749483, -0.8660924, 1, 1, 1, 1, 1,
-1.419667, -1.291002, -3.774492, 1, 1, 1, 1, 1,
-1.405385, -1.120138, -2.803131, 1, 1, 1, 1, 1,
-1.399035, 1.171664, 0.03616792, 1, 1, 1, 1, 1,
-1.396729, 1.213611, -2.026855, 1, 1, 1, 1, 1,
-1.387887, -0.5174705, -0.864858, 1, 1, 1, 1, 1,
-1.374893, -0.0007033555, -1.636456, 1, 1, 1, 1, 1,
-1.366148, 0.01677363, -3.573637, 1, 1, 1, 1, 1,
-1.363925, -1.169529, -2.925374, 1, 1, 1, 1, 1,
-1.355697, 0.5092893, 0.5505229, 1, 1, 1, 1, 1,
-1.354986, 0.4374495, -1.070343, 1, 1, 1, 1, 1,
-1.349804, -0.6794155, -1.568529, 0, 0, 1, 1, 1,
-1.347378, -0.6902899, -2.216139, 1, 0, 0, 1, 1,
-1.344632, -1.093858, -1.993084, 1, 0, 0, 1, 1,
-1.343727, -0.6096618, -1.391737, 1, 0, 0, 1, 1,
-1.342507, -0.722402, -1.015309, 1, 0, 0, 1, 1,
-1.339724, 0.3628829, -1.779897, 1, 0, 0, 1, 1,
-1.337686, -0.8001314, -1.839475, 0, 0, 0, 1, 1,
-1.330731, 1.116925, -0.8237345, 0, 0, 0, 1, 1,
-1.324154, -1.061216, -2.598702, 0, 0, 0, 1, 1,
-1.321471, -0.4144485, -2.298397, 0, 0, 0, 1, 1,
-1.317309, -0.1322691, -1.073265, 0, 0, 0, 1, 1,
-1.31388, 0.4877736, -0.1997179, 0, 0, 0, 1, 1,
-1.311243, 1.656116, -0.8667562, 0, 0, 0, 1, 1,
-1.307853, 0.3292883, -3.535144, 1, 1, 1, 1, 1,
-1.301788, 1.30367, 0.4577916, 1, 1, 1, 1, 1,
-1.291613, 0.5913821, -2.21754, 1, 1, 1, 1, 1,
-1.290371, -1.646362, -1.868903, 1, 1, 1, 1, 1,
-1.287066, -0.7329315, -2.621613, 1, 1, 1, 1, 1,
-1.278279, -0.6727619, -1.662348, 1, 1, 1, 1, 1,
-1.272594, -1.885912, -2.940922, 1, 1, 1, 1, 1,
-1.268157, -0.9795619, -1.109968, 1, 1, 1, 1, 1,
-1.26746, -1.998699, -2.837211, 1, 1, 1, 1, 1,
-1.266428, 0.06099061, -1.418853, 1, 1, 1, 1, 1,
-1.257102, -0.2077502, -1.362662, 1, 1, 1, 1, 1,
-1.256326, 0.4334313, -1.453424, 1, 1, 1, 1, 1,
-1.255047, -0.6089985, -2.907505, 1, 1, 1, 1, 1,
-1.249861, 0.9699095, -1.335624, 1, 1, 1, 1, 1,
-1.231456, 0.3121682, -0.9339191, 1, 1, 1, 1, 1,
-1.229358, -0.2774088, -0.6303565, 0, 0, 1, 1, 1,
-1.228928, 1.392568, -2.009236, 1, 0, 0, 1, 1,
-1.22705, 0.2336692, 1.225448, 1, 0, 0, 1, 1,
-1.220027, -1.884808, -3.124242, 1, 0, 0, 1, 1,
-1.216321, -0.7488445, -0.3841212, 1, 0, 0, 1, 1,
-1.209518, -1.166413, -2.468012, 1, 0, 0, 1, 1,
-1.204918, -1.684147, -1.494505, 0, 0, 0, 1, 1,
-1.203881, 1.452618, -1.319342, 0, 0, 0, 1, 1,
-1.199966, -0.3552618, -1.872787, 0, 0, 0, 1, 1,
-1.199125, -0.2117197, -1.527477, 0, 0, 0, 1, 1,
-1.193742, -1.056475, -3.415173, 0, 0, 0, 1, 1,
-1.183561, 1.521158, -0.5574906, 0, 0, 0, 1, 1,
-1.168713, 0.588309, -1.810352, 0, 0, 0, 1, 1,
-1.162236, -0.510159, -0.8908328, 1, 1, 1, 1, 1,
-1.148657, 0.1833804, -1.771895, 1, 1, 1, 1, 1,
-1.147092, 0.2094252, -2.282064, 1, 1, 1, 1, 1,
-1.131212, 0.5719754, -2.099868, 1, 1, 1, 1, 1,
-1.127433, -0.6609059, -1.803751, 1, 1, 1, 1, 1,
-1.127372, 1.796582, -0.6296082, 1, 1, 1, 1, 1,
-1.120316, -0.5979403, -1.266559, 1, 1, 1, 1, 1,
-1.114908, -0.7435303, -2.827478, 1, 1, 1, 1, 1,
-1.111179, 0.2556234, -1.948809, 1, 1, 1, 1, 1,
-1.108229, 1.765241, -1.503063, 1, 1, 1, 1, 1,
-1.097686, -0.259246, -0.4849225, 1, 1, 1, 1, 1,
-1.089951, -0.1459114, -1.853699, 1, 1, 1, 1, 1,
-1.083343, 0.9957324, -0.1250031, 1, 1, 1, 1, 1,
-1.082008, 0.1082267, -2.803886, 1, 1, 1, 1, 1,
-1.080181, 0.7629659, 0.3195008, 1, 1, 1, 1, 1,
-1.078092, 0.00494727, -1.868674, 0, 0, 1, 1, 1,
-1.071678, 1.710798, 0.675043, 1, 0, 0, 1, 1,
-1.065964, -0.4814937, -3.339175, 1, 0, 0, 1, 1,
-1.056986, -0.4237714, -2.586271, 1, 0, 0, 1, 1,
-1.056182, 1.740361, 0.9538172, 1, 0, 0, 1, 1,
-1.044129, 1.42052, -1.148455, 1, 0, 0, 1, 1,
-1.043126, 0.7307903, -0.967485, 0, 0, 0, 1, 1,
-1.03388, 0.00990303, -0.2420006, 0, 0, 0, 1, 1,
-1.033702, 0.2412821, -1.890386, 0, 0, 0, 1, 1,
-1.031039, 0.6140976, 0.2150905, 0, 0, 0, 1, 1,
-1.020948, -0.3355451, -2.332933, 0, 0, 0, 1, 1,
-1.019123, 0.8968684, -0.662877, 0, 0, 0, 1, 1,
-1.015034, 0.8818527, -1.632526, 0, 0, 0, 1, 1,
-1.01376, -1.622421, -4.40893, 1, 1, 1, 1, 1,
-1.012787, 0.8131968, 1.11376, 1, 1, 1, 1, 1,
-1.010493, -0.3663762, -1.038656, 1, 1, 1, 1, 1,
-1.010102, -0.8769338, -3.815994, 1, 1, 1, 1, 1,
-1.003869, -0.6069577, -1.214188, 1, 1, 1, 1, 1,
-1.00088, 0.1382984, -2.091165, 1, 1, 1, 1, 1,
-0.9983141, -0.9541087, -3.528611, 1, 1, 1, 1, 1,
-0.9971976, 0.1027438, -1.405611, 1, 1, 1, 1, 1,
-0.9940025, -0.2984853, -3.478516, 1, 1, 1, 1, 1,
-0.9928614, 0.4469725, -0.1181387, 1, 1, 1, 1, 1,
-0.9907564, 0.5402601, 0.7375838, 1, 1, 1, 1, 1,
-0.9905595, -0.2454741, -0.757982, 1, 1, 1, 1, 1,
-0.99011, -0.4748431, -0.6555774, 1, 1, 1, 1, 1,
-0.9870848, -0.01261479, -1.866874, 1, 1, 1, 1, 1,
-0.9817291, 1.31567, -0.204682, 1, 1, 1, 1, 1,
-0.9816682, 0.3347498, -1.83173, 0, 0, 1, 1, 1,
-0.979269, -1.425683, -3.805122, 1, 0, 0, 1, 1,
-0.9778247, -0.3716913, -1.77136, 1, 0, 0, 1, 1,
-0.9757105, 1.842005, -1.979879, 1, 0, 0, 1, 1,
-0.9740318, -0.07838876, -0.7877672, 1, 0, 0, 1, 1,
-0.9721882, -0.7480799, -3.419686, 1, 0, 0, 1, 1,
-0.9670284, -1.927217, -2.028558, 0, 0, 0, 1, 1,
-0.9592984, -1.52015, -1.171187, 0, 0, 0, 1, 1,
-0.9526112, -0.805145, -2.667919, 0, 0, 0, 1, 1,
-0.9522949, 0.0226659, -0.9224023, 0, 0, 0, 1, 1,
-0.9428809, 0.2450303, -1.343591, 0, 0, 0, 1, 1,
-0.9427216, 0.05363136, -0.1332077, 0, 0, 0, 1, 1,
-0.9417064, 0.5733978, -1.409116, 0, 0, 0, 1, 1,
-0.9410474, 2.238494, -1.761688, 1, 1, 1, 1, 1,
-0.9369236, 2.104301, -1.040217, 1, 1, 1, 1, 1,
-0.9330248, -0.680492, -2.237642, 1, 1, 1, 1, 1,
-0.9306972, -0.7306581, -1.945889, 1, 1, 1, 1, 1,
-0.9278954, -1.32356, -3.460122, 1, 1, 1, 1, 1,
-0.9261301, 0.06846397, -3.397609, 1, 1, 1, 1, 1,
-0.9151007, 0.8907319, -0.8010035, 1, 1, 1, 1, 1,
-0.909447, 1.018845, -0.8807918, 1, 1, 1, 1, 1,
-0.9041536, -1.314251, -3.073273, 1, 1, 1, 1, 1,
-0.9035867, 0.8222088, -0.4775553, 1, 1, 1, 1, 1,
-0.9033952, -2.339521, -2.916671, 1, 1, 1, 1, 1,
-0.897406, -0.2392504, -2.202574, 1, 1, 1, 1, 1,
-0.8963894, -1.741283, -2.277535, 1, 1, 1, 1, 1,
-0.8878766, 0.0276723, -2.794736, 1, 1, 1, 1, 1,
-0.8870956, -0.3408577, -4.211167, 1, 1, 1, 1, 1,
-0.8860704, -0.8587619, -4.479709, 0, 0, 1, 1, 1,
-0.876367, -0.3427614, -3.246796, 1, 0, 0, 1, 1,
-0.8763094, 0.2522346, -2.572142, 1, 0, 0, 1, 1,
-0.8734258, -1.146776, -2.190504, 1, 0, 0, 1, 1,
-0.8718781, 0.6992251, 1.033055, 1, 0, 0, 1, 1,
-0.8682814, 0.4560848, -0.4024931, 1, 0, 0, 1, 1,
-0.8680194, -0.9319737, -1.40028, 0, 0, 0, 1, 1,
-0.8637232, 0.03183334, -2.167201, 0, 0, 0, 1, 1,
-0.8612604, 2.412401, -0.3508975, 0, 0, 0, 1, 1,
-0.8596608, 0.04872927, -1.243568, 0, 0, 0, 1, 1,
-0.8583863, -0.9363557, -2.753986, 0, 0, 0, 1, 1,
-0.8535007, 1.79818, 0.6565474, 0, 0, 0, 1, 1,
-0.8500715, 1.29256, 0.6881348, 0, 0, 0, 1, 1,
-0.8356876, -0.9325848, -0.4379811, 1, 1, 1, 1, 1,
-0.8327584, 1.072968, -0.6864763, 1, 1, 1, 1, 1,
-0.8273835, 0.7157957, -1.775512, 1, 1, 1, 1, 1,
-0.8218864, 1.292169, 0.5863723, 1, 1, 1, 1, 1,
-0.8155454, -1.000985, -2.025355, 1, 1, 1, 1, 1,
-0.8001877, 1.309832, -1.562106, 1, 1, 1, 1, 1,
-0.7950572, 0.416311, -1.496738, 1, 1, 1, 1, 1,
-0.7867876, -1.963672, -4.014066, 1, 1, 1, 1, 1,
-0.78611, 0.1150374, -1.67599, 1, 1, 1, 1, 1,
-0.7794323, -1.098694, -0.9801825, 1, 1, 1, 1, 1,
-0.77933, 1.339258, 0.9428725, 1, 1, 1, 1, 1,
-0.7780361, 1.016251, -0.5161444, 1, 1, 1, 1, 1,
-0.7770771, 0.6347879, 0.2000842, 1, 1, 1, 1, 1,
-0.7757819, 0.5545495, 1.580547, 1, 1, 1, 1, 1,
-0.7644891, -2.194383, -3.3758, 1, 1, 1, 1, 1,
-0.762238, 0.3014522, -1.933468, 0, 0, 1, 1, 1,
-0.7551351, -0.09362742, -1.442693, 1, 0, 0, 1, 1,
-0.7521595, -0.2047472, -3.524347, 1, 0, 0, 1, 1,
-0.750536, -0.4635913, -1.909127, 1, 0, 0, 1, 1,
-0.7465857, 1.165166, -1.735725, 1, 0, 0, 1, 1,
-0.7445728, -0.6717427, -1.546652, 1, 0, 0, 1, 1,
-0.7394934, -0.9491469, -1.315395, 0, 0, 0, 1, 1,
-0.7390273, 0.7095219, -0.2393908, 0, 0, 0, 1, 1,
-0.7347247, -0.008567756, -1.575891, 0, 0, 0, 1, 1,
-0.7316511, 0.6128574, -1.973545, 0, 0, 0, 1, 1,
-0.7260144, -0.5528048, -1.645078, 0, 0, 0, 1, 1,
-0.7242945, 0.5000703, -2.222068, 0, 0, 0, 1, 1,
-0.7077535, 0.3347239, -0.1824387, 0, 0, 0, 1, 1,
-0.703446, 0.4765567, -1.712402, 1, 1, 1, 1, 1,
-0.7013406, 0.6293708, -1.154297, 1, 1, 1, 1, 1,
-0.7001483, 0.5783092, -1.452854, 1, 1, 1, 1, 1,
-0.6998566, -0.01148795, -2.054698, 1, 1, 1, 1, 1,
-0.6994646, -0.7287911, -1.944737, 1, 1, 1, 1, 1,
-0.6985194, -1.088739, -2.827291, 1, 1, 1, 1, 1,
-0.6968469, 1.164378, 0.8618726, 1, 1, 1, 1, 1,
-0.6827475, -0.3562952, -4.357694, 1, 1, 1, 1, 1,
-0.6825157, 1.191293, -0.1238502, 1, 1, 1, 1, 1,
-0.6825072, -1.390911, -5.105009, 1, 1, 1, 1, 1,
-0.6822661, 0.6525568, -1.599329, 1, 1, 1, 1, 1,
-0.6757292, -0.360113, -2.995349, 1, 1, 1, 1, 1,
-0.6731414, 1.097603, -0.2336394, 1, 1, 1, 1, 1,
-0.6612393, 1.125118, 0.4806277, 1, 1, 1, 1, 1,
-0.660014, -1.171693, -4.591027, 1, 1, 1, 1, 1,
-0.6598203, -1.008082, -0.5531143, 0, 0, 1, 1, 1,
-0.6564171, -0.940036, -3.061126, 1, 0, 0, 1, 1,
-0.6532903, 0.4344683, -0.8815745, 1, 0, 0, 1, 1,
-0.6525615, 1.978205, -0.4851918, 1, 0, 0, 1, 1,
-0.6524564, -1.265975, -1.920656, 1, 0, 0, 1, 1,
-0.6494598, 0.1249978, -1.375888, 1, 0, 0, 1, 1,
-0.6491496, 0.1017876, -1.349055, 0, 0, 0, 1, 1,
-0.6470213, 1.89136, -1.481304, 0, 0, 0, 1, 1,
-0.6434, -0.5620128, -1.285303, 0, 0, 0, 1, 1,
-0.6423521, -0.9665043, -3.9174, 0, 0, 0, 1, 1,
-0.6420351, -1.381358, -3.210674, 0, 0, 0, 1, 1,
-0.6394951, 0.4626097, -0.05155517, 0, 0, 0, 1, 1,
-0.6374712, -0.622571, -2.853715, 0, 0, 0, 1, 1,
-0.6354985, 0.220571, -3.345616, 1, 1, 1, 1, 1,
-0.6346741, -1.131612, -2.165355, 1, 1, 1, 1, 1,
-0.6344838, 1.271831, -3.305433, 1, 1, 1, 1, 1,
-0.6310556, 2.125752, -0.6273701, 1, 1, 1, 1, 1,
-0.630017, -0.5190856, -2.470995, 1, 1, 1, 1, 1,
-0.6279841, 1.044771, 0.1513154, 1, 1, 1, 1, 1,
-0.6275412, 0.3359917, -1.632842, 1, 1, 1, 1, 1,
-0.626799, -1.602658, -3.66066, 1, 1, 1, 1, 1,
-0.6251354, 0.9656667, -0.05853874, 1, 1, 1, 1, 1,
-0.6140224, -1.662754, -2.61345, 1, 1, 1, 1, 1,
-0.6105865, 0.9550994, -1.858775, 1, 1, 1, 1, 1,
-0.607845, 0.05411423, -2.328848, 1, 1, 1, 1, 1,
-0.5977591, 1.462002, -0.2991583, 1, 1, 1, 1, 1,
-0.5962155, -0.1571489, -2.465016, 1, 1, 1, 1, 1,
-0.5946981, -1.170623, -2.772589, 1, 1, 1, 1, 1,
-0.59159, -1.433093, -5.626452, 0, 0, 1, 1, 1,
-0.5890603, 0.5210867, -1.805778, 1, 0, 0, 1, 1,
-0.5880038, -0.4435079, -0.9364975, 1, 0, 0, 1, 1,
-0.5855496, 1.274162, 0.1179009, 1, 0, 0, 1, 1,
-0.5837843, 0.4170606, -1.446038, 1, 0, 0, 1, 1,
-0.5828156, 0.3173262, 0.2412959, 1, 0, 0, 1, 1,
-0.5810729, 1.132928, -1.602612, 0, 0, 0, 1, 1,
-0.5735652, -0.6214475, -1.836691, 0, 0, 0, 1, 1,
-0.5699683, -0.3095276, -1.241295, 0, 0, 0, 1, 1,
-0.5651788, -0.6354571, -3.379947, 0, 0, 0, 1, 1,
-0.5633051, 0.377018, -1.160561, 0, 0, 0, 1, 1,
-0.5630582, -0.01474946, -1.566101, 0, 0, 0, 1, 1,
-0.5615942, -1.108593, -2.708703, 0, 0, 0, 1, 1,
-0.55893, -0.8644674, -3.023392, 1, 1, 1, 1, 1,
-0.5538193, 1.278669, -0.8862682, 1, 1, 1, 1, 1,
-0.5527545, -0.9609483, -1.885195, 1, 1, 1, 1, 1,
-0.5518934, -0.02892159, -0.01899175, 1, 1, 1, 1, 1,
-0.5463757, 0.6849052, -0.305089, 1, 1, 1, 1, 1,
-0.5451121, 1.384563, -1.886606, 1, 1, 1, 1, 1,
-0.5435138, -0.7964792, -3.183995, 1, 1, 1, 1, 1,
-0.5411195, -0.7848665, -1.733609, 1, 1, 1, 1, 1,
-0.5386929, 0.1340397, -2.857717, 1, 1, 1, 1, 1,
-0.5371132, -0.8587962, -1.181425, 1, 1, 1, 1, 1,
-0.5307125, -1.498239, -0.7469452, 1, 1, 1, 1, 1,
-0.527801, 0.3330787, -0.2722534, 1, 1, 1, 1, 1,
-0.5272167, 0.3677766, -1.366109, 1, 1, 1, 1, 1,
-0.5253773, 0.6654565, -0.8811517, 1, 1, 1, 1, 1,
-0.52454, -0.03039114, -1.787909, 1, 1, 1, 1, 1,
-0.5078413, -1.753948, -3.707703, 0, 0, 1, 1, 1,
-0.506062, 0.1285012, -2.137071, 1, 0, 0, 1, 1,
-0.5042847, -0.2941333, -1.501001, 1, 0, 0, 1, 1,
-0.4898852, 0.6783504, 1.278552, 1, 0, 0, 1, 1,
-0.4874322, 1.163545, 2.424458, 1, 0, 0, 1, 1,
-0.4869543, -0.9842265, -5.207966, 1, 0, 0, 1, 1,
-0.4857553, 0.6115084, -0.6448912, 0, 0, 0, 1, 1,
-0.4855123, -0.2323481, -1.02385, 0, 0, 0, 1, 1,
-0.4815095, 0.5600693, -1.525245, 0, 0, 0, 1, 1,
-0.4814661, 0.699425, -1.553615, 0, 0, 0, 1, 1,
-0.4734809, -0.4841833, -1.803881, 0, 0, 0, 1, 1,
-0.4688016, -0.3643617, -2.099138, 0, 0, 0, 1, 1,
-0.4683254, 0.5723346, -0.7106838, 0, 0, 0, 1, 1,
-0.4646218, -1.282867, -3.991661, 1, 1, 1, 1, 1,
-0.4634058, 0.6559483, 1.067766, 1, 1, 1, 1, 1,
-0.4619017, -1.78177, -2.85883, 1, 1, 1, 1, 1,
-0.4618084, 0.3106374, -1.3349, 1, 1, 1, 1, 1,
-0.4589616, 0.8509335, 0.7971942, 1, 1, 1, 1, 1,
-0.4567094, 0.306541, -0.3009932, 1, 1, 1, 1, 1,
-0.4468229, -1.19527, -4.284042, 1, 1, 1, 1, 1,
-0.44151, -1.036447, -2.352681, 1, 1, 1, 1, 1,
-0.4387307, 0.252288, -0.5977749, 1, 1, 1, 1, 1,
-0.4370147, 0.2448392, -0.1211605, 1, 1, 1, 1, 1,
-0.4362421, -1.017109, -3.211167, 1, 1, 1, 1, 1,
-0.4340222, -0.4162543, -1.293564, 1, 1, 1, 1, 1,
-0.4240291, 0.4327973, -1.889146, 1, 1, 1, 1, 1,
-0.422617, -1.118992, -3.041602, 1, 1, 1, 1, 1,
-0.4210542, 0.1314353, -1.122069, 1, 1, 1, 1, 1,
-0.4198624, 0.4776337, -1.180942, 0, 0, 1, 1, 1,
-0.4121803, 1.260786, -0.4748411, 1, 0, 0, 1, 1,
-0.4099591, 0.3829774, -1.320097, 1, 0, 0, 1, 1,
-0.4087527, 1.104881, -1.938961, 1, 0, 0, 1, 1,
-0.4066084, 0.6155303, -0.9278606, 1, 0, 0, 1, 1,
-0.4059171, 2.621238, -1.398404, 1, 0, 0, 1, 1,
-0.4046604, -1.771265, -6.173945, 0, 0, 0, 1, 1,
-0.4021631, -0.9615173, -3.928333, 0, 0, 0, 1, 1,
-0.4016323, 0.2504644, -1.748076, 0, 0, 0, 1, 1,
-0.4006056, -0.973262, -2.167994, 0, 0, 0, 1, 1,
-0.4004756, -0.4659823, -2.193655, 0, 0, 0, 1, 1,
-0.400149, 0.3273007, 0.94047, 0, 0, 0, 1, 1,
-0.3956384, 0.6254658, -0.3947327, 0, 0, 0, 1, 1,
-0.3954732, 1.793655, 1.649277, 1, 1, 1, 1, 1,
-0.3920218, 0.7981501, 0.5470108, 1, 1, 1, 1, 1,
-0.3906436, -0.2832333, -1.514343, 1, 1, 1, 1, 1,
-0.3875719, -1.328985, -2.003627, 1, 1, 1, 1, 1,
-0.3847716, 0.2875018, -0.8494641, 1, 1, 1, 1, 1,
-0.3844142, -0.8217264, -3.653893, 1, 1, 1, 1, 1,
-0.3762257, -0.5921215, -1.394248, 1, 1, 1, 1, 1,
-0.3728348, -1.212431, -3.204552, 1, 1, 1, 1, 1,
-0.3687264, 0.5633028, -0.1976605, 1, 1, 1, 1, 1,
-0.3663187, -0.02544611, -1.415729, 1, 1, 1, 1, 1,
-0.3622849, -0.3390143, -3.561083, 1, 1, 1, 1, 1,
-0.3549634, -0.1582947, -2.272833, 1, 1, 1, 1, 1,
-0.3507665, -0.7705516, -3.519426, 1, 1, 1, 1, 1,
-0.3486439, 0.3753222, -1.219997, 1, 1, 1, 1, 1,
-0.3470757, 1.587682, 1.100818, 1, 1, 1, 1, 1,
-0.3406456, -0.216589, -2.307668, 0, 0, 1, 1, 1,
-0.3351918, 0.3401239, -1.361288, 1, 0, 0, 1, 1,
-0.3339717, 0.1115639, -2.588835, 1, 0, 0, 1, 1,
-0.332562, 1.640556, -2.357656, 1, 0, 0, 1, 1,
-0.3273653, -0.7339329, -2.086806, 1, 0, 0, 1, 1,
-0.31997, -0.5126966, -1.457124, 1, 0, 0, 1, 1,
-0.319691, 0.3496257, -0.1734122, 0, 0, 0, 1, 1,
-0.317865, -3.063415, -2.624875, 0, 0, 0, 1, 1,
-0.3162061, 0.6655609, 1.544858, 0, 0, 0, 1, 1,
-0.3157741, -0.1388955, -1.988037, 0, 0, 0, 1, 1,
-0.315185, 0.4619745, -0.7294174, 0, 0, 0, 1, 1,
-0.3146607, -2.109721, -2.666024, 0, 0, 0, 1, 1,
-0.3097138, -0.9516708, -4.308327, 0, 0, 0, 1, 1,
-0.308567, 0.5098135, 0.2936805, 1, 1, 1, 1, 1,
-0.3075257, 0.8769373, -0.4245794, 1, 1, 1, 1, 1,
-0.3031461, -0.1266819, -1.724523, 1, 1, 1, 1, 1,
-0.2995198, 1.222629, -3.425242, 1, 1, 1, 1, 1,
-0.285996, 0.3568557, -1.28023, 1, 1, 1, 1, 1,
-0.2859405, 0.8146638, 0.2360714, 1, 1, 1, 1, 1,
-0.2858315, 0.3662828, -1.135478, 1, 1, 1, 1, 1,
-0.2825053, 1.231509, -0.04316531, 1, 1, 1, 1, 1,
-0.2816902, 1.006089, -1.176222, 1, 1, 1, 1, 1,
-0.2742568, 0.7154276, -0.9145682, 1, 1, 1, 1, 1,
-0.2738408, -0.3524547, -3.279214, 1, 1, 1, 1, 1,
-0.2728451, 0.3302073, 0.3944358, 1, 1, 1, 1, 1,
-0.2710959, -1.647926, -3.894944, 1, 1, 1, 1, 1,
-0.2657775, 0.4496068, -0.1817866, 1, 1, 1, 1, 1,
-0.2642894, -0.7313833, -2.788939, 1, 1, 1, 1, 1,
-0.2613316, 0.2935081, -0.8900626, 0, 0, 1, 1, 1,
-0.2575403, -0.2559411, -0.982051, 1, 0, 0, 1, 1,
-0.2571849, 2.692019, 0.5716833, 1, 0, 0, 1, 1,
-0.2559992, 1.505888, -0.1050233, 1, 0, 0, 1, 1,
-0.254815, 1.224204, -1.457662, 1, 0, 0, 1, 1,
-0.2531866, 0.3374148, 1.701074, 1, 0, 0, 1, 1,
-0.2520749, 0.8255876, 0.9783887, 0, 0, 0, 1, 1,
-0.2515943, -0.779308, -2.273662, 0, 0, 0, 1, 1,
-0.2484346, 0.384524, -1.138441, 0, 0, 0, 1, 1,
-0.2461146, -0.2778454, -3.25855, 0, 0, 0, 1, 1,
-0.2457467, -0.05171016, -2.712726, 0, 0, 0, 1, 1,
-0.2428001, 1.409846, -1.727182, 0, 0, 0, 1, 1,
-0.2418277, -1.163304, -2.893987, 0, 0, 0, 1, 1,
-0.2402279, -0.6102162, -3.717545, 1, 1, 1, 1, 1,
-0.2339878, -0.7097033, -2.304602, 1, 1, 1, 1, 1,
-0.2334723, -0.1509575, -1.929403, 1, 1, 1, 1, 1,
-0.2314276, -1.991444, -3.277756, 1, 1, 1, 1, 1,
-0.2306764, -0.5726926, -1.31142, 1, 1, 1, 1, 1,
-0.2287917, -0.2459317, -2.726162, 1, 1, 1, 1, 1,
-0.2287224, -1.167163, -2.574189, 1, 1, 1, 1, 1,
-0.2287122, -0.5827075, -2.402354, 1, 1, 1, 1, 1,
-0.2255243, 0.3343422, 1.567654, 1, 1, 1, 1, 1,
-0.222311, 1.204719, 0.367666, 1, 1, 1, 1, 1,
-0.2210888, 1.214999, 1.031099, 1, 1, 1, 1, 1,
-0.2190011, -1.797155, -2.477458, 1, 1, 1, 1, 1,
-0.2166158, -0.9628842, -2.194611, 1, 1, 1, 1, 1,
-0.2130768, -0.08836442, -2.868531, 1, 1, 1, 1, 1,
-0.2099975, 0.5245255, -0.8988521, 1, 1, 1, 1, 1,
-0.205146, 0.08083684, -2.181822, 0, 0, 1, 1, 1,
-0.2045645, 0.9198319, -1.298366, 1, 0, 0, 1, 1,
-0.2041433, 0.424333, -1.297898, 1, 0, 0, 1, 1,
-0.2036056, 0.5685369, -1.545833, 1, 0, 0, 1, 1,
-0.1969634, -0.4940031, -2.364264, 1, 0, 0, 1, 1,
-0.1943938, -0.0515935, -2.741515, 1, 0, 0, 1, 1,
-0.1931176, -0.01366133, -1.325285, 0, 0, 0, 1, 1,
-0.1885616, -0.3099824, -4.274154, 0, 0, 0, 1, 1,
-0.1875936, 0.8776, -1.674226, 0, 0, 0, 1, 1,
-0.1875665, 1.868749, -1.052397, 0, 0, 0, 1, 1,
-0.1866513, -1.561098, -3.216228, 0, 0, 0, 1, 1,
-0.1854726, 1.471942, -0.1367398, 0, 0, 0, 1, 1,
-0.184697, -0.08979903, -2.047597, 0, 0, 0, 1, 1,
-0.182542, 0.01683125, -1.155558, 1, 1, 1, 1, 1,
-0.1803604, 1.277082, 1.516101, 1, 1, 1, 1, 1,
-0.1788875, 0.8286149, -1.285771, 1, 1, 1, 1, 1,
-0.1777819, -0.5623721, -2.24562, 1, 1, 1, 1, 1,
-0.1759703, 1.381675, -0.1061227, 1, 1, 1, 1, 1,
-0.1721519, -0.7949687, -2.474229, 1, 1, 1, 1, 1,
-0.1703007, 0.8822889, -0.8667898, 1, 1, 1, 1, 1,
-0.1690726, -1.046676, -4.084896, 1, 1, 1, 1, 1,
-0.1663305, 0.3221718, 0.7489163, 1, 1, 1, 1, 1,
-0.1641015, 1.238179, 0.1018196, 1, 1, 1, 1, 1,
-0.1632718, 1.261541, -0.2761309, 1, 1, 1, 1, 1,
-0.1612833, -0.6738605, -2.78537, 1, 1, 1, 1, 1,
-0.1612432, 0.2131898, 0.3465054, 1, 1, 1, 1, 1,
-0.1607169, -0.3462351, -2.838434, 1, 1, 1, 1, 1,
-0.1587633, -0.207927, -3.700033, 1, 1, 1, 1, 1,
-0.1551622, 0.5911349, 0.008929782, 0, 0, 1, 1, 1,
-0.1524389, -0.5029039, -3.808384, 1, 0, 0, 1, 1,
-0.1456149, 0.8766204, -0.1025887, 1, 0, 0, 1, 1,
-0.1330979, 1.138436, -0.3821851, 1, 0, 0, 1, 1,
-0.1318906, -0.5172595, -2.915973, 1, 0, 0, 1, 1,
-0.1318045, -0.1729373, -3.360621, 1, 0, 0, 1, 1,
-0.1305525, -1.003515, -2.890165, 0, 0, 0, 1, 1,
-0.1297742, 0.108034, -0.8625314, 0, 0, 0, 1, 1,
-0.1295194, 0.5913184, 2.737737, 0, 0, 0, 1, 1,
-0.1213991, 0.7039499, -0.379073, 0, 0, 0, 1, 1,
-0.1148447, -0.7300405, -3.418527, 0, 0, 0, 1, 1,
-0.1137141, -1.198351, -2.43405, 0, 0, 0, 1, 1,
-0.1087461, 1.528635, -0.7073129, 0, 0, 0, 1, 1,
-0.1082434, -1.760417, -3.669526, 1, 1, 1, 1, 1,
-0.1029844, -0.2877315, -2.781713, 1, 1, 1, 1, 1,
-0.1015662, -0.7664101, -1.15128, 1, 1, 1, 1, 1,
-0.09819482, 1.155348, 2.370108, 1, 1, 1, 1, 1,
-0.0931863, 0.5728672, -0.04684099, 1, 1, 1, 1, 1,
-0.09045731, 0.1401312, 0.03757453, 1, 1, 1, 1, 1,
-0.09003177, 0.1935239, -0.8474647, 1, 1, 1, 1, 1,
-0.08935585, 0.03193415, -2.635769, 1, 1, 1, 1, 1,
-0.08702412, -0.8564829, -4.141672, 1, 1, 1, 1, 1,
-0.08346245, -0.2845579, -3.075712, 1, 1, 1, 1, 1,
-0.08235151, 0.4670992, 0.634933, 1, 1, 1, 1, 1,
-0.0806822, 1.736083, -0.4688256, 1, 1, 1, 1, 1,
-0.07883229, -0.1740621, -0.7567928, 1, 1, 1, 1, 1,
-0.07844419, 0.5749995, -0.1277899, 1, 1, 1, 1, 1,
-0.07646544, 2.313774, -1.812813, 1, 1, 1, 1, 1,
-0.07126767, -2.362287, -3.226377, 0, 0, 1, 1, 1,
-0.07093653, 0.3506212, -0.7412425, 1, 0, 0, 1, 1,
-0.06968964, 0.4936498, -0.9995339, 1, 0, 0, 1, 1,
-0.06930555, -1.057424, -2.530406, 1, 0, 0, 1, 1,
-0.06826995, 1.679635, -0.6948331, 1, 0, 0, 1, 1,
-0.06721963, -0.6775908, -1.285528, 1, 0, 0, 1, 1,
-0.06431574, -0.682569, -4.750452, 0, 0, 0, 1, 1,
-0.0636313, -0.4417628, -3.955336, 0, 0, 0, 1, 1,
-0.06289008, -0.8353884, -2.022995, 0, 0, 0, 1, 1,
-0.05725144, 1.151511, -1.403649, 0, 0, 0, 1, 1,
-0.05304869, -2.056728, -3.66739, 0, 0, 0, 1, 1,
-0.05168466, 0.3914197, -1.258303, 0, 0, 0, 1, 1,
-0.04776666, 0.7901756, 0.6920473, 0, 0, 0, 1, 1,
-0.04495987, -0.8202453, -4.422011, 1, 1, 1, 1, 1,
-0.04269093, 0.5903844, 1.239786, 1, 1, 1, 1, 1,
-0.04237176, -0.1495021, -4.408148, 1, 1, 1, 1, 1,
-0.04059707, 1.883422, -2.267164, 1, 1, 1, 1, 1,
-0.0380066, 0.3223118, 0.2385223, 1, 1, 1, 1, 1,
-0.03673262, -0.2257186, -4.114371, 1, 1, 1, 1, 1,
-0.03666685, -0.3173025, -2.602869, 1, 1, 1, 1, 1,
-0.03378952, 0.7148924, 0.5136428, 1, 1, 1, 1, 1,
-0.02969959, -1.300401, -2.303623, 1, 1, 1, 1, 1,
-0.02814425, 1.28995, 0.390466, 1, 1, 1, 1, 1,
-0.02060934, -1.039577, -4.084783, 1, 1, 1, 1, 1,
-0.02017182, -0.674643, -2.1373, 1, 1, 1, 1, 1,
-0.01665306, -1.334086, -3.945393, 1, 1, 1, 1, 1,
-0.01601116, -0.6081473, -2.36099, 1, 1, 1, 1, 1,
-0.007277555, -0.8668038, -3.533849, 1, 1, 1, 1, 1,
-0.005539653, 0.4862164, 0.6980995, 0, 0, 1, 1, 1,
-0.000111275, -0.9795195, -2.402253, 1, 0, 0, 1, 1,
0.001404207, 1.098387, -0.2461284, 1, 0, 0, 1, 1,
0.008111537, 0.1042466, 0.7587091, 1, 0, 0, 1, 1,
0.008360626, 0.3509981, -1.12727, 1, 0, 0, 1, 1,
0.008409211, 0.2949994, 0.2203587, 1, 0, 0, 1, 1,
0.009584029, 0.619897, -1.515997, 0, 0, 0, 1, 1,
0.0134913, 0.03600793, -1.843998, 0, 0, 0, 1, 1,
0.01370184, -0.01507056, 1.887035, 0, 0, 0, 1, 1,
0.01469559, 1.868165, -0.6113143, 0, 0, 0, 1, 1,
0.01516105, -1.771224, 3.39756, 0, 0, 0, 1, 1,
0.01908561, -1.112407, 3.311344, 0, 0, 0, 1, 1,
0.02377698, 0.4294693, -0.3023351, 0, 0, 0, 1, 1,
0.03467891, -0.1063127, 3.71187, 1, 1, 1, 1, 1,
0.0378079, -2.113915, 2.916951, 1, 1, 1, 1, 1,
0.03855794, 1.110318, -0.7149458, 1, 1, 1, 1, 1,
0.04123296, 0.3713001, 0.1113701, 1, 1, 1, 1, 1,
0.04261203, 0.9164487, 0.6155027, 1, 1, 1, 1, 1,
0.04532656, 0.4657797, 0.2236474, 1, 1, 1, 1, 1,
0.04772449, -0.7033031, 4.193041, 1, 1, 1, 1, 1,
0.04821923, -0.7230962, 2.99031, 1, 1, 1, 1, 1,
0.0534855, -0.7745417, 2.307804, 1, 1, 1, 1, 1,
0.06188841, -0.1728753, 1.718499, 1, 1, 1, 1, 1,
0.06312206, 1.022343, 0.286408, 1, 1, 1, 1, 1,
0.06341437, -0.2387159, 2.150079, 1, 1, 1, 1, 1,
0.06788804, 0.7428446, 0.7651684, 1, 1, 1, 1, 1,
0.07236043, -1.031758, 3.820837, 1, 1, 1, 1, 1,
0.08114728, -1.104208, 4.24164, 1, 1, 1, 1, 1,
0.08205713, -1.250111, 3.597045, 0, 0, 1, 1, 1,
0.08321737, 1.195972, 0.8670354, 1, 0, 0, 1, 1,
0.08379626, 1.042279, -0.9114039, 1, 0, 0, 1, 1,
0.08615792, 0.5819444, 1.293079, 1, 0, 0, 1, 1,
0.09386314, -0.35065, 2.960892, 1, 0, 0, 1, 1,
0.09712049, -0.6651468, 1.046026, 1, 0, 0, 1, 1,
0.09734595, -0.5529138, 3.821938, 0, 0, 0, 1, 1,
0.09874567, 1.021205, -1.148707, 0, 0, 0, 1, 1,
0.1002812, -0.9207803, 3.477559, 0, 0, 0, 1, 1,
0.103013, -0.9063289, 1.552616, 0, 0, 0, 1, 1,
0.1049136, 0.9984739, -0.2699729, 0, 0, 0, 1, 1,
0.1053158, 1.587135, -0.02068386, 0, 0, 0, 1, 1,
0.1141422, 0.008380925, 0.1298037, 0, 0, 0, 1, 1,
0.1147835, 0.8354638, -0.6397325, 1, 1, 1, 1, 1,
0.1181555, 0.2890902, 0.3867677, 1, 1, 1, 1, 1,
0.1184635, -0.6152585, 2.613781, 1, 1, 1, 1, 1,
0.1224661, -1.820847, 1.975298, 1, 1, 1, 1, 1,
0.1229264, -0.6540616, 5.016941, 1, 1, 1, 1, 1,
0.1288524, 0.1614979, 1.366775, 1, 1, 1, 1, 1,
0.1296282, -0.6175463, 1.461551, 1, 1, 1, 1, 1,
0.1319879, -1.569103, 0.5832247, 1, 1, 1, 1, 1,
0.1367655, 0.2016924, -0.9232991, 1, 1, 1, 1, 1,
0.1371571, 0.3245091, 0.9583695, 1, 1, 1, 1, 1,
0.1427786, 0.4508994, 0.130817, 1, 1, 1, 1, 1,
0.1435402, -1.984225, 4.747266, 1, 1, 1, 1, 1,
0.1455126, -0.2545461, 1.288422, 1, 1, 1, 1, 1,
0.1458703, 2.126283, -0.991511, 1, 1, 1, 1, 1,
0.1468682, 1.190879, 1.560992, 1, 1, 1, 1, 1,
0.155414, -0.4897082, 3.078516, 0, 0, 1, 1, 1,
0.1554983, 0.4745674, 0.2672688, 1, 0, 0, 1, 1,
0.1570293, -0.6499919, 2.499308, 1, 0, 0, 1, 1,
0.1571001, -0.1982331, 2.534669, 1, 0, 0, 1, 1,
0.1582606, 1.460394, 2.619819, 1, 0, 0, 1, 1,
0.1637988, 0.9892071, -0.3349153, 1, 0, 0, 1, 1,
0.1642115, -0.134641, 1.456935, 0, 0, 0, 1, 1,
0.1666207, 0.2458122, 1.242982, 0, 0, 0, 1, 1,
0.1690952, 2.406273, 0.06500294, 0, 0, 0, 1, 1,
0.169672, 0.7033719, -0.5487022, 0, 0, 0, 1, 1,
0.1710226, -0.2162316, 1.311129, 0, 0, 0, 1, 1,
0.1726333, -0.03241894, 2.251684, 0, 0, 0, 1, 1,
0.1736012, 0.3405333, 1.411532, 0, 0, 0, 1, 1,
0.1757236, 1.848289, -0.2965913, 1, 1, 1, 1, 1,
0.1782554, -1.00372, 3.052815, 1, 1, 1, 1, 1,
0.1782639, 0.03774962, 2.063188, 1, 1, 1, 1, 1,
0.178338, 0.07867017, 1.065126, 1, 1, 1, 1, 1,
0.186263, -0.08398238, 2.427468, 1, 1, 1, 1, 1,
0.1865361, 0.2615057, 1.082624, 1, 1, 1, 1, 1,
0.1906823, -1.204285, 5.024072, 1, 1, 1, 1, 1,
0.1911473, 0.4685124, 0.1501469, 1, 1, 1, 1, 1,
0.1915156, 0.519968, -0.5199632, 1, 1, 1, 1, 1,
0.1919458, 0.1177808, 0.06591179, 1, 1, 1, 1, 1,
0.1960649, -1.609551, 4.847876, 1, 1, 1, 1, 1,
0.1976782, -0.6239982, 2.234096, 1, 1, 1, 1, 1,
0.1998431, 1.728982, 0.9146817, 1, 1, 1, 1, 1,
0.2005319, -0.1201054, 2.494921, 1, 1, 1, 1, 1,
0.2030448, 0.8123437, 0.2753844, 1, 1, 1, 1, 1,
0.2035542, -0.02482881, 3.087636, 0, 0, 1, 1, 1,
0.2064454, 0.4472736, -0.7772478, 1, 0, 0, 1, 1,
0.2140424, 0.6173379, 1.476492, 1, 0, 0, 1, 1,
0.2229797, -1.421714, 2.583955, 1, 0, 0, 1, 1,
0.2328867, 0.3272787, 0.1147795, 1, 0, 0, 1, 1,
0.233459, -0.1713286, 1.508518, 1, 0, 0, 1, 1,
0.2370768, -1.212061, 3.550362, 0, 0, 0, 1, 1,
0.2380839, 0.6691474, -0.4635758, 0, 0, 0, 1, 1,
0.238562, 0.797101, 0.1330808, 0, 0, 0, 1, 1,
0.2445297, -0.6700572, 2.511133, 0, 0, 0, 1, 1,
0.2456527, -0.1955296, 2.310519, 0, 0, 0, 1, 1,
0.2482598, -0.8079563, 1.68161, 0, 0, 0, 1, 1,
0.2484054, 2.366532, 1.31161, 0, 0, 0, 1, 1,
0.2495758, -0.6070327, 2.702094, 1, 1, 1, 1, 1,
0.2497652, -0.4297062, 2.728153, 1, 1, 1, 1, 1,
0.2514776, -1.626116, 2.781915, 1, 1, 1, 1, 1,
0.2519853, -0.789678, 0.859619, 1, 1, 1, 1, 1,
0.2542746, -0.4260717, 1.895746, 1, 1, 1, 1, 1,
0.2556374, 0.6341662, -0.2477693, 1, 1, 1, 1, 1,
0.2641028, -1.291181, 5.403323, 1, 1, 1, 1, 1,
0.2643497, -0.8504239, 3.427759, 1, 1, 1, 1, 1,
0.2663535, 1.859188, -0.2203196, 1, 1, 1, 1, 1,
0.2666106, 0.2695455, -0.3421824, 1, 1, 1, 1, 1,
0.2709657, -1.327807, 4.113802, 1, 1, 1, 1, 1,
0.2752195, -0.4460433, 1.497812, 1, 1, 1, 1, 1,
0.275785, -0.9269065, 2.19611, 1, 1, 1, 1, 1,
0.2774642, 2.156861, -1.042909, 1, 1, 1, 1, 1,
0.2790016, -0.169074, 3.570757, 1, 1, 1, 1, 1,
0.2811781, -0.1684407, 3.351252, 0, 0, 1, 1, 1,
0.2837313, 0.8820982, -0.0905299, 1, 0, 0, 1, 1,
0.2877832, 0.06725638, -0.1531926, 1, 0, 0, 1, 1,
0.2920807, 0.4722584, 0.5553388, 1, 0, 0, 1, 1,
0.2921988, 0.09891748, 1.779109, 1, 0, 0, 1, 1,
0.2922188, -0.3779383, 2.745403, 1, 0, 0, 1, 1,
0.3007885, 0.2023744, 1.76483, 0, 0, 0, 1, 1,
0.3012086, -0.07731146, 0.798375, 0, 0, 0, 1, 1,
0.3014938, 0.9185557, 0.2580343, 0, 0, 0, 1, 1,
0.3035468, -2.379884, 3.384707, 0, 0, 0, 1, 1,
0.3044675, 0.2312383, 0.5548527, 0, 0, 0, 1, 1,
0.3090858, -0.07233296, 2.378824, 0, 0, 0, 1, 1,
0.312048, 0.2739659, 0.02221248, 0, 0, 0, 1, 1,
0.3153165, 0.1753761, 1.539358, 1, 1, 1, 1, 1,
0.3166672, -0.5864409, 1.406338, 1, 1, 1, 1, 1,
0.3176511, 0.159745, 1.466248, 1, 1, 1, 1, 1,
0.3179912, -0.9412106, 1.985503, 1, 1, 1, 1, 1,
0.3188859, -0.8965269, 0.6281083, 1, 1, 1, 1, 1,
0.3223397, 1.019997, 0.8660919, 1, 1, 1, 1, 1,
0.3230578, -0.9756343, 4.325354, 1, 1, 1, 1, 1,
0.3249258, -0.8579962, 4.20779, 1, 1, 1, 1, 1,
0.3297652, 0.4391637, 0.3952413, 1, 1, 1, 1, 1,
0.3310479, -1.367261, 2.045395, 1, 1, 1, 1, 1,
0.3419465, 0.09564468, 0.8366324, 1, 1, 1, 1, 1,
0.3426597, 0.7211929, -0.3337589, 1, 1, 1, 1, 1,
0.3433057, -0.7525123, 3.007152, 1, 1, 1, 1, 1,
0.3490083, 0.8796363, -0.4120457, 1, 1, 1, 1, 1,
0.3493308, 0.07819278, 2.935403, 1, 1, 1, 1, 1,
0.3521557, 0.7670344, -0.6062431, 0, 0, 1, 1, 1,
0.3588042, -1.035504, 2.347446, 1, 0, 0, 1, 1,
0.3613925, 0.7726631, -0.1412133, 1, 0, 0, 1, 1,
0.3639638, -0.05051167, 1.115882, 1, 0, 0, 1, 1,
0.3649785, 1.492518, -0.2754865, 1, 0, 0, 1, 1,
0.3699359, -0.7339234, 3.071497, 1, 0, 0, 1, 1,
0.3700958, 0.3087519, 0.6299615, 0, 0, 0, 1, 1,
0.3737864, 0.5567585, 1.693384, 0, 0, 0, 1, 1,
0.3833923, -0.9549738, 3.138615, 0, 0, 0, 1, 1,
0.3843158, 0.465597, 1.106643, 0, 0, 0, 1, 1,
0.3848054, 1.129518, 0.6354326, 0, 0, 0, 1, 1,
0.3858605, -1.669578, 3.858535, 0, 0, 0, 1, 1,
0.3886944, 0.1669643, 0.8268822, 0, 0, 0, 1, 1,
0.3921606, 0.8026518, -0.321345, 1, 1, 1, 1, 1,
0.3976899, 0.2501112, -0.07889901, 1, 1, 1, 1, 1,
0.4022419, 1.231211, 0.2229297, 1, 1, 1, 1, 1,
0.4068576, -1.579031, 1.438949, 1, 1, 1, 1, 1,
0.4119993, -1.424438, 3.669748, 1, 1, 1, 1, 1,
0.4131894, -0.8748883, 4.026644, 1, 1, 1, 1, 1,
0.4155654, 0.3893768, 0.02886922, 1, 1, 1, 1, 1,
0.4179517, -1.205354, 4.278789, 1, 1, 1, 1, 1,
0.4191203, 0.918571, 1.755902, 1, 1, 1, 1, 1,
0.4254541, -0.03032849, 1.370353, 1, 1, 1, 1, 1,
0.4258883, 2.192863, 0.6986584, 1, 1, 1, 1, 1,
0.4295907, 0.2858211, 0.667748, 1, 1, 1, 1, 1,
0.4304734, -1.022376, 3.457513, 1, 1, 1, 1, 1,
0.4316068, 1.254794, -1.00472, 1, 1, 1, 1, 1,
0.43286, 1.470155, -0.1112512, 1, 1, 1, 1, 1,
0.4333788, 0.7987843, 1.003256, 0, 0, 1, 1, 1,
0.4342158, -1.954766, 3.602736, 1, 0, 0, 1, 1,
0.4428265, 0.05508557, 2.172233, 1, 0, 0, 1, 1,
0.4429364, -1.714801, 2.495032, 1, 0, 0, 1, 1,
0.4430274, 1.243901, -0.06982104, 1, 0, 0, 1, 1,
0.4430678, 0.9229782, 0.9447461, 1, 0, 0, 1, 1,
0.4465999, 0.6641698, 1.899307, 0, 0, 0, 1, 1,
0.4559804, 0.1895424, -0.02936032, 0, 0, 0, 1, 1,
0.4586174, -0.2008734, 1.367323, 0, 0, 0, 1, 1,
0.4594108, -0.6239985, 1.234742, 0, 0, 0, 1, 1,
0.4595534, -0.9621666, 2.046351, 0, 0, 0, 1, 1,
0.4607627, -0.244224, 1.572569, 0, 0, 0, 1, 1,
0.4612038, 0.7244071, 1.084565, 0, 0, 0, 1, 1,
0.4673752, 0.3185948, 1.411211, 1, 1, 1, 1, 1,
0.4778171, -0.3830821, 3.117111, 1, 1, 1, 1, 1,
0.4789362, 1.267473, 0.06357066, 1, 1, 1, 1, 1,
0.4798439, 2.028112, 0.8652557, 1, 1, 1, 1, 1,
0.4868186, -2.672899, 4.090525, 1, 1, 1, 1, 1,
0.4870547, -0.9893453, 1.071827, 1, 1, 1, 1, 1,
0.4876721, -0.7529616, 1.625716, 1, 1, 1, 1, 1,
0.4893433, 1.779959, 0.7826154, 1, 1, 1, 1, 1,
0.4980651, -0.7363914, 3.7607, 1, 1, 1, 1, 1,
0.5002424, 1.732909, 0.3187355, 1, 1, 1, 1, 1,
0.5032081, -0.9188567, 2.505317, 1, 1, 1, 1, 1,
0.5041278, 0.528634, -0.6913167, 1, 1, 1, 1, 1,
0.5050243, -0.6818395, -0.6532779, 1, 1, 1, 1, 1,
0.5075005, -0.6683249, 2.434502, 1, 1, 1, 1, 1,
0.5089589, 0.2666081, 0.3429783, 1, 1, 1, 1, 1,
0.515047, -1.492338, 2.193961, 0, 0, 1, 1, 1,
0.5170078, -0.3116725, 4.817695, 1, 0, 0, 1, 1,
0.5292684, -1.636335, 3.849892, 1, 0, 0, 1, 1,
0.5317219, -0.5443425, 3.585382, 1, 0, 0, 1, 1,
0.5343679, -0.9348735, 3.429595, 1, 0, 0, 1, 1,
0.5396086, 0.2047817, 1.069775, 1, 0, 0, 1, 1,
0.541645, -1.947238, 3.439197, 0, 0, 0, 1, 1,
0.5417563, -1.471917, 3.024294, 0, 0, 0, 1, 1,
0.5452126, 1.783519, 0.9101197, 0, 0, 0, 1, 1,
0.5460361, -0.1059403, 1.139401, 0, 0, 0, 1, 1,
0.5488641, 0.3682775, -0.9140795, 0, 0, 0, 1, 1,
0.5507002, 0.1183788, 2.606708, 0, 0, 0, 1, 1,
0.5516053, -0.400517, 2.333183, 0, 0, 0, 1, 1,
0.5516235, 0.8108568, 1.590372, 1, 1, 1, 1, 1,
0.5548896, 0.7762316, -0.1293436, 1, 1, 1, 1, 1,
0.5575833, 0.7558627, 2.674669, 1, 1, 1, 1, 1,
0.5628112, -1.693726, 2.846769, 1, 1, 1, 1, 1,
0.5728408, 0.2541169, 1.739264, 1, 1, 1, 1, 1,
0.5732807, -0.8939151, -0.1143977, 1, 1, 1, 1, 1,
0.581587, 0.3610876, 0.16865, 1, 1, 1, 1, 1,
0.5870434, 0.3734548, 1.577234, 1, 1, 1, 1, 1,
0.5913312, 0.7813168, 2.460636, 1, 1, 1, 1, 1,
0.5929083, 0.09497679, 0.8935481, 1, 1, 1, 1, 1,
0.5930009, 0.276644, 2.849348, 1, 1, 1, 1, 1,
0.593586, 0.4338911, 1.621771, 1, 1, 1, 1, 1,
0.5958196, -0.6303114, 2.207619, 1, 1, 1, 1, 1,
0.5997202, 0.8662549, 1.399534, 1, 1, 1, 1, 1,
0.6123181, 1.486153, 0.03577685, 1, 1, 1, 1, 1,
0.6222293, -1.50376, 3.805261, 0, 0, 1, 1, 1,
0.6228077, -0.1773439, 1.803108, 1, 0, 0, 1, 1,
0.623931, 1.06504, 0.07816695, 1, 0, 0, 1, 1,
0.6253957, -1.52114, 3.260166, 1, 0, 0, 1, 1,
0.6258136, -0.5613931, 1.07812, 1, 0, 0, 1, 1,
0.6266932, -1.583473, 3.05555, 1, 0, 0, 1, 1,
0.6308966, -0.1894458, 1.527643, 0, 0, 0, 1, 1,
0.6339155, 0.5225719, -1.081743, 0, 0, 0, 1, 1,
0.6350695, -1.019177, 3.845366, 0, 0, 0, 1, 1,
0.6371124, -0.840187, 3.950597, 0, 0, 0, 1, 1,
0.6397971, -0.3653756, 3.132537, 0, 0, 0, 1, 1,
0.6428272, -1.261739, 2.562088, 0, 0, 0, 1, 1,
0.6436138, -1.882754, 3.74629, 0, 0, 0, 1, 1,
0.6461991, -0.8730655, 3.696331, 1, 1, 1, 1, 1,
0.6484556, -0.8035896, 2.102565, 1, 1, 1, 1, 1,
0.6511213, 0.3312355, 2.397412, 1, 1, 1, 1, 1,
0.6602419, -0.6487071, 0.9452178, 1, 1, 1, 1, 1,
0.6632938, -1.4487, 3.347122, 1, 1, 1, 1, 1,
0.6663223, 1.067076, 1.801114, 1, 1, 1, 1, 1,
0.6680901, 0.9418925, -0.07322777, 1, 1, 1, 1, 1,
0.6682177, 1.417882, -0.190967, 1, 1, 1, 1, 1,
0.6683376, 0.2908533, 0.963374, 1, 1, 1, 1, 1,
0.669411, -0.5613734, 2.455301, 1, 1, 1, 1, 1,
0.6711158, -1.244472, 3.540388, 1, 1, 1, 1, 1,
0.6719726, 0.7999966, -0.1414105, 1, 1, 1, 1, 1,
0.6788295, 1.585665, -0.1045329, 1, 1, 1, 1, 1,
0.6798713, -1.104405, 1.172867, 1, 1, 1, 1, 1,
0.6985886, 1.359181, 0.8178627, 1, 1, 1, 1, 1,
0.7011889, 0.6064048, -0.3540627, 0, 0, 1, 1, 1,
0.7046404, 0.8289483, 2.018923, 1, 0, 0, 1, 1,
0.7079868, -0.4832557, 3.209953, 1, 0, 0, 1, 1,
0.7109907, 1.293242, 0.495782, 1, 0, 0, 1, 1,
0.7152215, -1.508376, 1.565441, 1, 0, 0, 1, 1,
0.7309471, 0.02494025, 1.779046, 1, 0, 0, 1, 1,
0.7348254, -0.2611634, 3.406229, 0, 0, 0, 1, 1,
0.737749, -0.7499802, 0.178453, 0, 0, 0, 1, 1,
0.7410174, 1.228801, 2.550898, 0, 0, 0, 1, 1,
0.7449691, -0.2540593, -0.2487348, 0, 0, 0, 1, 1,
0.7459452, 1.782267, 1.580362, 0, 0, 0, 1, 1,
0.746147, 0.9993066, 0.879924, 0, 0, 0, 1, 1,
0.7469665, -0.2463046, 2.953336, 0, 0, 0, 1, 1,
0.7483089, 0.2520205, -1.287301, 1, 1, 1, 1, 1,
0.748657, -0.1766193, 1.334164, 1, 1, 1, 1, 1,
0.7494873, 1.749028, -0.7091903, 1, 1, 1, 1, 1,
0.7559294, 0.282785, 0.6476819, 1, 1, 1, 1, 1,
0.7589504, 1.522301, 1.522588, 1, 1, 1, 1, 1,
0.7604924, 0.8023689, 2.372235, 1, 1, 1, 1, 1,
0.7617338, 0.9815381, 1.682849, 1, 1, 1, 1, 1,
0.7628778, -0.01625606, 1.247445, 1, 1, 1, 1, 1,
0.7636633, 0.34472, 0.2899735, 1, 1, 1, 1, 1,
0.7652036, -1.481551, 3.194226, 1, 1, 1, 1, 1,
0.7703287, 0.5222779, 1.705848, 1, 1, 1, 1, 1,
0.7723945, 0.1704435, 3.169019, 1, 1, 1, 1, 1,
0.773472, -0.07305997, 1.054899, 1, 1, 1, 1, 1,
0.7745565, 1.004885, 0.02891366, 1, 1, 1, 1, 1,
0.7788981, -2.482846, 2.456366, 1, 1, 1, 1, 1,
0.7873021, -0.7952343, 2.761951, 0, 0, 1, 1, 1,
0.7875465, 0.5341884, 1.961098, 1, 0, 0, 1, 1,
0.7883366, 0.1076966, 1.217588, 1, 0, 0, 1, 1,
0.7939752, -0.636508, 3.596927, 1, 0, 0, 1, 1,
0.8013169, 0.02219193, 2.049467, 1, 0, 0, 1, 1,
0.8077521, -0.1093745, 0.4537575, 1, 0, 0, 1, 1,
0.8103135, -0.153102, 2.930698, 0, 0, 0, 1, 1,
0.8131298, -0.6334307, 1.20848, 0, 0, 0, 1, 1,
0.8142442, 1.379594, 1.459169, 0, 0, 0, 1, 1,
0.8222581, 0.7121021, 1.883949, 0, 0, 0, 1, 1,
0.8333948, 1.503523, 0.4250798, 0, 0, 0, 1, 1,
0.8338019, -0.824573, 2.189273, 0, 0, 0, 1, 1,
0.8411689, 0.2924607, 1.735958, 0, 0, 0, 1, 1,
0.8446059, -0.8872225, 2.626721, 1, 1, 1, 1, 1,
0.8505404, 0.443462, 0.7990851, 1, 1, 1, 1, 1,
0.8518915, 3.247386, 1.072503, 1, 1, 1, 1, 1,
0.8524206, 0.1708611, 1.118549, 1, 1, 1, 1, 1,
0.8566582, -0.3195289, 0.9006037, 1, 1, 1, 1, 1,
0.8570455, 0.09120756, 1.598865, 1, 1, 1, 1, 1,
0.857891, -1.050631, 2.490502, 1, 1, 1, 1, 1,
0.8635451, 1.863879, -0.08264081, 1, 1, 1, 1, 1,
0.8735507, 0.1214605, 3.881416, 1, 1, 1, 1, 1,
0.8737968, 0.7433479, 2.012026, 1, 1, 1, 1, 1,
0.874169, -1.708958, 2.324694, 1, 1, 1, 1, 1,
0.8776448, 1.968127, 0.4988373, 1, 1, 1, 1, 1,
0.8776911, -1.557635, 1.121859, 1, 1, 1, 1, 1,
0.8780166, 0.1970721, 0.8618767, 1, 1, 1, 1, 1,
0.8784262, 1.708274, 0.705473, 1, 1, 1, 1, 1,
0.8805914, 0.6038366, 2.590854, 0, 0, 1, 1, 1,
0.8905329, 0.08324174, 0.1899068, 1, 0, 0, 1, 1,
0.8906987, 0.8019583, 1.015558, 1, 0, 0, 1, 1,
0.8980427, -0.9654142, 2.479632, 1, 0, 0, 1, 1,
0.9037098, 0.2809189, 0.8065773, 1, 0, 0, 1, 1,
0.9105631, 1.129544, 1.9162, 1, 0, 0, 1, 1,
0.9146527, 0.284256, 2.57003, 0, 0, 0, 1, 1,
0.914775, 0.01000315, 1.506343, 0, 0, 0, 1, 1,
0.9212031, 1.055793, 0.6234086, 0, 0, 0, 1, 1,
0.9262425, 0.7891222, 1.4034, 0, 0, 0, 1, 1,
0.9302524, -0.1303257, 2.272999, 0, 0, 0, 1, 1,
0.9391398, -0.3805611, 1.25852, 0, 0, 0, 1, 1,
0.9401673, 0.4243455, 1.57329, 0, 0, 0, 1, 1,
0.9417439, 1.629097, 0.6430912, 1, 1, 1, 1, 1,
0.9444658, -1.149214, 0.4452812, 1, 1, 1, 1, 1,
0.9527084, 1.398321, 0.1172491, 1, 1, 1, 1, 1,
0.9643168, 0.7987937, 0.4182699, 1, 1, 1, 1, 1,
0.9778408, 0.930954, -0.3201555, 1, 1, 1, 1, 1,
0.9782363, 0.7872459, 1.28883, 1, 1, 1, 1, 1,
0.9826789, 0.627741, 0.4460182, 1, 1, 1, 1, 1,
0.9884639, -0.6249347, 2.69636, 1, 1, 1, 1, 1,
0.993551, -0.138999, 1.447853, 1, 1, 1, 1, 1,
0.9956884, 0.2258354, 1.578225, 1, 1, 1, 1, 1,
0.9966139, 1.54296, 0.7539861, 1, 1, 1, 1, 1,
0.9977706, -0.8137575, 0.0812607, 1, 1, 1, 1, 1,
1.001174, -0.1820855, 0.3188453, 1, 1, 1, 1, 1,
1.003029, 0.4377294, 0.8622482, 1, 1, 1, 1, 1,
1.005862, 0.5409713, 2.349253, 1, 1, 1, 1, 1,
1.013431, -1.084612, 2.042874, 0, 0, 1, 1, 1,
1.015473, -0.09424017, 1.32898, 1, 0, 0, 1, 1,
1.01628, 0.03136071, 2.845716, 1, 0, 0, 1, 1,
1.023621, -1.660159, 0.6629351, 1, 0, 0, 1, 1,
1.025126, -1.27383, 1.916569, 1, 0, 0, 1, 1,
1.028849, -0.3969544, 0.6862658, 1, 0, 0, 1, 1,
1.038609, 1.200009, 0.3159953, 0, 0, 0, 1, 1,
1.04549, 1.1722, 1.75823, 0, 0, 0, 1, 1,
1.049363, -0.129487, 0.9161782, 0, 0, 0, 1, 1,
1.049911, 0.1451622, 2.610598, 0, 0, 0, 1, 1,
1.050027, 0.3435149, 0.1333311, 0, 0, 0, 1, 1,
1.060127, 0.3821043, 2.958672, 0, 0, 0, 1, 1,
1.064171, 2.015564, 2.063424, 0, 0, 0, 1, 1,
1.072166, -0.1592163, 0.06022928, 1, 1, 1, 1, 1,
1.075583, 0.4595507, 0.513653, 1, 1, 1, 1, 1,
1.076862, 0.9903386, 0.965701, 1, 1, 1, 1, 1,
1.084266, -1.331654, 4.420639, 1, 1, 1, 1, 1,
1.08461, 0.5286055, 0.8641732, 1, 1, 1, 1, 1,
1.085502, -0.239399, 2.732604, 1, 1, 1, 1, 1,
1.093916, 0.08212516, 1.118219, 1, 1, 1, 1, 1,
1.099544, -0.2981795, 3.987372, 1, 1, 1, 1, 1,
1.102825, 0.1504419, 1.634888, 1, 1, 1, 1, 1,
1.114607, 1.202392, 0.8705015, 1, 1, 1, 1, 1,
1.12027, 0.8728809, 2.795729, 1, 1, 1, 1, 1,
1.125196, -0.657683, 0.8457551, 1, 1, 1, 1, 1,
1.127687, 0.6948422, 1.62033, 1, 1, 1, 1, 1,
1.136988, -1.576672, 0.4265308, 1, 1, 1, 1, 1,
1.139658, -0.3097987, 2.81115, 1, 1, 1, 1, 1,
1.142738, 0.6234376, 1.531047, 0, 0, 1, 1, 1,
1.145994, -0.7139423, 2.181818, 1, 0, 0, 1, 1,
1.15517, -0.1701221, 0.408063, 1, 0, 0, 1, 1,
1.156345, -0.6680035, 2.390439, 1, 0, 0, 1, 1,
1.160188, -1.392529, 1.477857, 1, 0, 0, 1, 1,
1.161142, -0.5008598, 0.504431, 1, 0, 0, 1, 1,
1.170079, 0.9747336, -0.4425783, 0, 0, 0, 1, 1,
1.173054, 0.734332, 1.068586, 0, 0, 0, 1, 1,
1.17762, -0.6918805, 2.750871, 0, 0, 0, 1, 1,
1.177955, -0.6890074, 3.443464, 0, 0, 0, 1, 1,
1.183179, 2.199624, 2.04794, 0, 0, 0, 1, 1,
1.192073, 1.560161, 0.8775503, 0, 0, 0, 1, 1,
1.199461, -1.907846, 2.287401, 0, 0, 0, 1, 1,
1.208389, 0.4104644, 0.1432655, 1, 1, 1, 1, 1,
1.208906, 1.0701, 1.023221, 1, 1, 1, 1, 1,
1.213894, -1.200963, 3.08977, 1, 1, 1, 1, 1,
1.216419, -1.973982, 2.511516, 1, 1, 1, 1, 1,
1.217563, -0.4148612, 0.9556543, 1, 1, 1, 1, 1,
1.225215, 0.9569533, 0.644011, 1, 1, 1, 1, 1,
1.236739, 0.8942732, 2.087487, 1, 1, 1, 1, 1,
1.257185, 1.793797, 1.363145, 1, 1, 1, 1, 1,
1.259116, 0.1399433, 0.9465048, 1, 1, 1, 1, 1,
1.261115, 1.161893, 0.2771226, 1, 1, 1, 1, 1,
1.270844, 0.1954878, 0.5467092, 1, 1, 1, 1, 1,
1.272725, 2.050938, 0.1024548, 1, 1, 1, 1, 1,
1.275356, -0.1378936, 2.377429, 1, 1, 1, 1, 1,
1.278635, 0.01758778, 5.049072, 1, 1, 1, 1, 1,
1.282261, -1.039348, 4.04923, 1, 1, 1, 1, 1,
1.289156, 0.5911279, -0.7346554, 0, 0, 1, 1, 1,
1.296841, -0.8952106, 3.334721, 1, 0, 0, 1, 1,
1.296872, 0.8360665, 2.165628, 1, 0, 0, 1, 1,
1.299236, 0.6489599, 1.111238, 1, 0, 0, 1, 1,
1.300311, 1.248669, 1.046327, 1, 0, 0, 1, 1,
1.301984, -0.2644446, 1.236328, 1, 0, 0, 1, 1,
1.31065, 0.2529418, 0.4932787, 0, 0, 0, 1, 1,
1.311112, -0.2393867, -1.390964, 0, 0, 0, 1, 1,
1.317973, 0.7533125, 1.550693, 0, 0, 0, 1, 1,
1.31816, 0.05490909, 1.583867, 0, 0, 0, 1, 1,
1.341064, -1.697487, 2.987004, 0, 0, 0, 1, 1,
1.348538, 0.437327, 3.301463, 0, 0, 0, 1, 1,
1.358243, -2.048652, 3.619626, 0, 0, 0, 1, 1,
1.370457, 0.2702624, 0.6971365, 1, 1, 1, 1, 1,
1.394188, 0.3618383, 0.828981, 1, 1, 1, 1, 1,
1.402473, 0.05271065, 2.171579, 1, 1, 1, 1, 1,
1.40807, 0.08889017, 2.117345, 1, 1, 1, 1, 1,
1.425103, -0.540861, 2.57497, 1, 1, 1, 1, 1,
1.429411, 0.02809959, 0.5724435, 1, 1, 1, 1, 1,
1.430272, 0.8214302, 0.5358506, 1, 1, 1, 1, 1,
1.436427, 0.8844725, 2.18889, 1, 1, 1, 1, 1,
1.436451, -0.8299761, 4.033049, 1, 1, 1, 1, 1,
1.456352, 0.4124467, 1.158663, 1, 1, 1, 1, 1,
1.4569, -0.7484714, 3.440588, 1, 1, 1, 1, 1,
1.458751, 0.5707399, 0.05228499, 1, 1, 1, 1, 1,
1.4698, 1.209721, 1.651365, 1, 1, 1, 1, 1,
1.471569, -0.1095564, 2.552117, 1, 1, 1, 1, 1,
1.475109, 0.8424973, 0.715165, 1, 1, 1, 1, 1,
1.480743, 0.4146564, 0.6727192, 0, 0, 1, 1, 1,
1.483166, -0.6609271, 2.497764, 1, 0, 0, 1, 1,
1.49442, 0.8003122, 1.367962, 1, 0, 0, 1, 1,
1.498148, -0.7779984, 1.245654, 1, 0, 0, 1, 1,
1.50065, -0.4839498, 3.111227, 1, 0, 0, 1, 1,
1.502305, 0.8828679, 2.151592, 1, 0, 0, 1, 1,
1.505032, -1.965936, 1.082265, 0, 0, 0, 1, 1,
1.505513, -0.5514937, 1.561493, 0, 0, 0, 1, 1,
1.51301, -0.3501432, 3.691084, 0, 0, 0, 1, 1,
1.515921, -0.6962283, 3.534279, 0, 0, 0, 1, 1,
1.522771, -0.4892974, 1.650337, 0, 0, 0, 1, 1,
1.52919, 0.9111614, 0.6545912, 0, 0, 0, 1, 1,
1.539372, 0.8614358, 2.339035, 0, 0, 0, 1, 1,
1.541322, 0.5203766, 2.375598, 1, 1, 1, 1, 1,
1.566101, 0.9781653, 1.36856, 1, 1, 1, 1, 1,
1.56662, -0.08775403, 1.158926, 1, 1, 1, 1, 1,
1.570115, -0.8982404, 2.310407, 1, 1, 1, 1, 1,
1.572723, 0.08220656, 2.676193, 1, 1, 1, 1, 1,
1.573545, 1.91299, -0.8323053, 1, 1, 1, 1, 1,
1.574187, 0.4368975, -0.4377648, 1, 1, 1, 1, 1,
1.574432, 1.082986, 1.803931, 1, 1, 1, 1, 1,
1.576677, 0.3999328, 1.050591, 1, 1, 1, 1, 1,
1.577501, -0.1870095, 0.9173962, 1, 1, 1, 1, 1,
1.581496, 2.576569, 1.051633, 1, 1, 1, 1, 1,
1.586125, -1.081267, 0.3046191, 1, 1, 1, 1, 1,
1.592694, 0.301117, -0.5279886, 1, 1, 1, 1, 1,
1.603362, -0.3176643, 1.350233, 1, 1, 1, 1, 1,
1.615716, -0.3716969, 1.669529, 1, 1, 1, 1, 1,
1.623863, 2.370906, -0.5077568, 0, 0, 1, 1, 1,
1.625314, -1.432436, 2.746231, 1, 0, 0, 1, 1,
1.642022, -0.3409665, 3.233152, 1, 0, 0, 1, 1,
1.659206, 1.66863, -0.3893493, 1, 0, 0, 1, 1,
1.666491, -2.095965, 2.825108, 1, 0, 0, 1, 1,
1.695218, 2.690209, 1.947996, 1, 0, 0, 1, 1,
1.699963, 0.08278383, 0.7637843, 0, 0, 0, 1, 1,
1.716385, -0.1698869, 1.106699, 0, 0, 0, 1, 1,
1.731846, 0.01498377, 2.827202, 0, 0, 0, 1, 1,
1.743883, 2.115823, 1.078283, 0, 0, 0, 1, 1,
1.769416, 0.5170667, 2.323943, 0, 0, 0, 1, 1,
1.784378, 0.4918101, 1.689348, 0, 0, 0, 1, 1,
1.841375, 1.277594, 1.506495, 0, 0, 0, 1, 1,
1.842856, -2.541134, 2.135062, 1, 1, 1, 1, 1,
1.868748, 2.04319, 2.241959, 1, 1, 1, 1, 1,
1.868828, 0.7519705, 1.482891, 1, 1, 1, 1, 1,
1.878988, -3.065744, 0.594054, 1, 1, 1, 1, 1,
1.881018, 1.221893, 1.901897, 1, 1, 1, 1, 1,
1.905722, -1.858259, 4.383337, 1, 1, 1, 1, 1,
1.916875, -0.2913781, 2.849103, 1, 1, 1, 1, 1,
1.920664, 0.2023907, 2.400882, 1, 1, 1, 1, 1,
1.924641, 0.009630637, 2.944726, 1, 1, 1, 1, 1,
1.945771, -1.839573, 2.449472, 1, 1, 1, 1, 1,
1.946343, 1.53177, 0.2454975, 1, 1, 1, 1, 1,
1.979049, 0.2080338, 2.168337, 1, 1, 1, 1, 1,
2.00439, 0.9007811, 1.125067, 1, 1, 1, 1, 1,
2.030647, 1.674854, 0.3818494, 1, 1, 1, 1, 1,
2.039399, -1.236509, 1.984385, 1, 1, 1, 1, 1,
2.054412, 0.3196093, 1.334552, 0, 0, 1, 1, 1,
2.081266, 0.786337, 1.778688, 1, 0, 0, 1, 1,
2.110996, -0.2134723, -0.2750162, 1, 0, 0, 1, 1,
2.133883, 0.3739526, 0.5241093, 1, 0, 0, 1, 1,
2.173432, 0.2573037, 1.981109, 1, 0, 0, 1, 1,
2.19174, 1.256131, 0.2947633, 1, 0, 0, 1, 1,
2.22037, 0.3673451, 0.9184684, 0, 0, 0, 1, 1,
2.338954, -0.299093, 2.972901, 0, 0, 0, 1, 1,
2.414008, -0.2816278, 2.448359, 0, 0, 0, 1, 1,
2.472059, -1.161063, 1.79891, 0, 0, 0, 1, 1,
2.489106, -1.951865, 2.105251, 0, 0, 0, 1, 1,
2.523189, 0.0928294, 2.043663, 0, 0, 0, 1, 1,
2.630921, 1.970192, 1.751622, 0, 0, 0, 1, 1,
2.764569, 2.128888, 1.833233, 1, 1, 1, 1, 1,
2.789797, 0.8805854, 0.3965901, 1, 1, 1, 1, 1,
2.82048, -0.7409336, 2.202006, 1, 1, 1, 1, 1,
2.847647, 0.9084399, 0.3088739, 1, 1, 1, 1, 1,
2.875175, 0.557569, 2.09168, 1, 1, 1, 1, 1,
3.029717, 0.3559755, 1.952708, 1, 1, 1, 1, 1,
3.560405, -0.7139727, 1.336152, 1, 1, 1, 1, 1
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
var radius = 10.00154;
var distance = 35.12997;
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
mvMatrix.translate( -0.1663823, -0.09082127, 0.3853114 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.12997);
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
