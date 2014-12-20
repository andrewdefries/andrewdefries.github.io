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
-3.623436, -0.7273208, -3.638877, 1, 0, 0, 1,
-3.017918, -0.7485546, -1.761037, 1, 0.007843138, 0, 1,
-2.688524, 1.703168, 0.02102277, 1, 0.01176471, 0, 1,
-2.646428, 0.1873572, -2.872181, 1, 0.01960784, 0, 1,
-2.578997, 0.6755927, -2.192413, 1, 0.02352941, 0, 1,
-2.569184, 1.275, -1.830912, 1, 0.03137255, 0, 1,
-2.556479, 0.6179942, -0.6040783, 1, 0.03529412, 0, 1,
-2.533105, -1.714712, -2.85521, 1, 0.04313726, 0, 1,
-2.531043, 0.2165917, -1.315506, 1, 0.04705882, 0, 1,
-2.52995, 0.7940264, -0.7190784, 1, 0.05490196, 0, 1,
-2.489411, -0.6777331, -1.659015, 1, 0.05882353, 0, 1,
-2.411347, -0.6596847, -1.227396, 1, 0.06666667, 0, 1,
-2.408865, 1.712809, -1.337948, 1, 0.07058824, 0, 1,
-2.383162, -0.6391506, -2.221873, 1, 0.07843138, 0, 1,
-2.371572, -0.5033528, -2.58227, 1, 0.08235294, 0, 1,
-2.364652, -0.9990909, -2.25877, 1, 0.09019608, 0, 1,
-2.359385, 0.2978581, -1.555841, 1, 0.09411765, 0, 1,
-2.357509, -0.07940862, -2.881579, 1, 0.1019608, 0, 1,
-2.326997, -0.5595651, -1.88852, 1, 0.1098039, 0, 1,
-2.273279, -0.8569741, -0.6461021, 1, 0.1137255, 0, 1,
-2.205933, 0.967077, -1.356339, 1, 0.1215686, 0, 1,
-2.193315, -0.1656943, -1.740372, 1, 0.1254902, 0, 1,
-2.168106, -0.7991015, -1.522492, 1, 0.1333333, 0, 1,
-2.160792, -0.5135478, -0.5146846, 1, 0.1372549, 0, 1,
-2.150622, 0.4870474, -0.5978063, 1, 0.145098, 0, 1,
-2.130044, -1.864769, -3.502785, 1, 0.1490196, 0, 1,
-2.098458, 1.363275, -0.1690877, 1, 0.1568628, 0, 1,
-2.02067, -0.02741445, -1.052616, 1, 0.1607843, 0, 1,
-1.991606, 0.05705984, -2.24205, 1, 0.1686275, 0, 1,
-1.982432, -1.171205, -0.2898515, 1, 0.172549, 0, 1,
-1.937016, 0.2077435, -0.2938927, 1, 0.1803922, 0, 1,
-1.892121, -1.674237, -2.389207, 1, 0.1843137, 0, 1,
-1.872442, -1.924742, -2.896706, 1, 0.1921569, 0, 1,
-1.868261, -0.1990714, -3.247187, 1, 0.1960784, 0, 1,
-1.844359, -0.1803697, -0.7230498, 1, 0.2039216, 0, 1,
-1.826851, -0.9236814, -1.737782, 1, 0.2117647, 0, 1,
-1.819156, 0.2426171, 0.1630426, 1, 0.2156863, 0, 1,
-1.815427, -0.7649208, -2.761394, 1, 0.2235294, 0, 1,
-1.804142, -0.5502835, -0.8631772, 1, 0.227451, 0, 1,
-1.793924, -1.113584, -2.641177, 1, 0.2352941, 0, 1,
-1.791411, 0.06073855, -1.951604, 1, 0.2392157, 0, 1,
-1.790014, 0.2544972, -0.8780109, 1, 0.2470588, 0, 1,
-1.788773, -1.569807, -3.383886, 1, 0.2509804, 0, 1,
-1.774119, 1.714467, -0.07484994, 1, 0.2588235, 0, 1,
-1.77303, 2.016418, -0.6591706, 1, 0.2627451, 0, 1,
-1.768082, 0.05643037, -3.224658, 1, 0.2705882, 0, 1,
-1.767524, 0.7216747, -0.05184909, 1, 0.2745098, 0, 1,
-1.765859, -0.274911, -2.432688, 1, 0.282353, 0, 1,
-1.758113, -0.2058129, -1.29674, 1, 0.2862745, 0, 1,
-1.744185, 0.4074592, -3.818089, 1, 0.2941177, 0, 1,
-1.735381, -1.284716, -2.322258, 1, 0.3019608, 0, 1,
-1.732411, -0.2088546, -1.83048, 1, 0.3058824, 0, 1,
-1.730778, -0.9217892, -2.381743, 1, 0.3137255, 0, 1,
-1.718828, -0.3120265, -2.097574, 1, 0.3176471, 0, 1,
-1.697534, 1.842986, 0.2443698, 1, 0.3254902, 0, 1,
-1.680737, 1.772679, 1.13757, 1, 0.3294118, 0, 1,
-1.647791, 0.297799, -3.127795, 1, 0.3372549, 0, 1,
-1.609665, 2.419081, -0.1863655, 1, 0.3411765, 0, 1,
-1.605063, 1.187628, -1.60933, 1, 0.3490196, 0, 1,
-1.595664, 1.921452, -0.1167755, 1, 0.3529412, 0, 1,
-1.584346, 0.3245821, -1.053865, 1, 0.3607843, 0, 1,
-1.580423, -0.02825207, -1.41854, 1, 0.3647059, 0, 1,
-1.576781, 0.7811609, -0.5870894, 1, 0.372549, 0, 1,
-1.570829, -0.1605513, 0.08260424, 1, 0.3764706, 0, 1,
-1.555057, 1.509152, 1.37466, 1, 0.3843137, 0, 1,
-1.547094, -0.7912183, -4.414544, 1, 0.3882353, 0, 1,
-1.538595, -0.6449671, -4.001748, 1, 0.3960784, 0, 1,
-1.518302, 0.4436825, -1.426877, 1, 0.4039216, 0, 1,
-1.517414, 0.8262342, -0.4019431, 1, 0.4078431, 0, 1,
-1.501893, 1.021487, -0.6509887, 1, 0.4156863, 0, 1,
-1.489562, 1.641586, 0.3889396, 1, 0.4196078, 0, 1,
-1.476571, 1.104919, -0.7191269, 1, 0.427451, 0, 1,
-1.471657, -0.06749939, -2.156003, 1, 0.4313726, 0, 1,
-1.463795, 0.8786699, -2.640134, 1, 0.4392157, 0, 1,
-1.44843, 0.7528008, -1.19886, 1, 0.4431373, 0, 1,
-1.436988, 1.102372, -1.300205, 1, 0.4509804, 0, 1,
-1.430961, -1.864429, -2.445619, 1, 0.454902, 0, 1,
-1.426725, 0.4873416, -1.71005, 1, 0.4627451, 0, 1,
-1.425857, -0.03243691, -1.101225, 1, 0.4666667, 0, 1,
-1.415597, 1.223871, -0.3032674, 1, 0.4745098, 0, 1,
-1.41515, 0.3468837, -1.591238, 1, 0.4784314, 0, 1,
-1.398497, 0.4252493, -2.021086, 1, 0.4862745, 0, 1,
-1.381875, 1.143547, -1.214938, 1, 0.4901961, 0, 1,
-1.371663, 0.0596595, -1.329644, 1, 0.4980392, 0, 1,
-1.370823, 0.01289636, -1.927627, 1, 0.5058824, 0, 1,
-1.370777, -1.481224, -1.849191, 1, 0.509804, 0, 1,
-1.37003, -0.87514, -1.623674, 1, 0.5176471, 0, 1,
-1.368135, -0.6767008, -2.716055, 1, 0.5215687, 0, 1,
-1.353361, -0.3155463, -2.785891, 1, 0.5294118, 0, 1,
-1.351872, 0.1419917, -2.753129, 1, 0.5333334, 0, 1,
-1.340407, -2.005911, -2.926247, 1, 0.5411765, 0, 1,
-1.339098, 0.6624388, -0.7584795, 1, 0.5450981, 0, 1,
-1.336162, 0.9724637, 1.125268, 1, 0.5529412, 0, 1,
-1.326038, 0.5185644, 1.882021, 1, 0.5568628, 0, 1,
-1.321201, -0.3732701, -3.600769, 1, 0.5647059, 0, 1,
-1.312134, 0.09772441, -0.8961751, 1, 0.5686275, 0, 1,
-1.305179, -0.1632203, -3.932992, 1, 0.5764706, 0, 1,
-1.30035, -0.582166, -0.6376039, 1, 0.5803922, 0, 1,
-1.288294, 0.2433946, -1.836045, 1, 0.5882353, 0, 1,
-1.284802, -0.8765009, -0.7814396, 1, 0.5921569, 0, 1,
-1.272554, 1.911949, 0.7340424, 1, 0.6, 0, 1,
-1.264068, -0.7551941, -1.030413, 1, 0.6078432, 0, 1,
-1.263016, -0.3366277, -2.269322, 1, 0.6117647, 0, 1,
-1.254482, 0.8498486, -0.927708, 1, 0.6196079, 0, 1,
-1.244826, -0.221506, -0.09733332, 1, 0.6235294, 0, 1,
-1.242635, -0.6374362, -3.539152, 1, 0.6313726, 0, 1,
-1.242455, -0.1110502, -0.9216177, 1, 0.6352941, 0, 1,
-1.230957, -0.1991266, -3.772717, 1, 0.6431373, 0, 1,
-1.224347, -0.7412466, -3.006068, 1, 0.6470588, 0, 1,
-1.222704, 0.6247325, -2.700763, 1, 0.654902, 0, 1,
-1.22047, -0.6543726, -2.180804, 1, 0.6588235, 0, 1,
-1.214138, 0.1104153, -1.220397, 1, 0.6666667, 0, 1,
-1.210662, 1.772194, -0.5667385, 1, 0.6705883, 0, 1,
-1.190161, -0.0971459, -2.745885, 1, 0.6784314, 0, 1,
-1.180318, -0.6211034, -1.706712, 1, 0.682353, 0, 1,
-1.177837, 0.4808834, -2.601962, 1, 0.6901961, 0, 1,
-1.174885, 0.519936, -2.094126, 1, 0.6941177, 0, 1,
-1.17462, 1.183664, -0.7151572, 1, 0.7019608, 0, 1,
-1.17315, 1.306014, 0.3924292, 1, 0.7098039, 0, 1,
-1.173012, 0.5505878, -0.1640401, 1, 0.7137255, 0, 1,
-1.1718, 0.4998626, -1.523294, 1, 0.7215686, 0, 1,
-1.15795, -0.03075988, -3.322985, 1, 0.7254902, 0, 1,
-1.155529, -1.415121, -2.239685, 1, 0.7333333, 0, 1,
-1.149094, 0.4290848, -1.951214, 1, 0.7372549, 0, 1,
-1.147443, -0.6821729, -1.294775, 1, 0.7450981, 0, 1,
-1.141703, -1.45314, -3.585424, 1, 0.7490196, 0, 1,
-1.139777, 0.7879135, 0.1097943, 1, 0.7568628, 0, 1,
-1.136804, -0.2940168, -0.994782, 1, 0.7607843, 0, 1,
-1.132746, -0.3282157, -0.9689541, 1, 0.7686275, 0, 1,
-1.128743, -0.748304, -2.374007, 1, 0.772549, 0, 1,
-1.127484, 0.7476268, -1.672282, 1, 0.7803922, 0, 1,
-1.117628, -0.06967594, -2.405709, 1, 0.7843137, 0, 1,
-1.117399, 0.2159908, -1.642774, 1, 0.7921569, 0, 1,
-1.115223, 0.4454521, -1.675664, 1, 0.7960784, 0, 1,
-1.113476, -1.616812, -1.760851, 1, 0.8039216, 0, 1,
-1.106904, 0.02245521, -0.7696275, 1, 0.8117647, 0, 1,
-1.103137, 0.6338516, -1.506046, 1, 0.8156863, 0, 1,
-1.099453, -0.2137794, -1.406821, 1, 0.8235294, 0, 1,
-1.098178, 0.3048627, -1.479365, 1, 0.827451, 0, 1,
-1.083935, 1.28036, -1.969041, 1, 0.8352941, 0, 1,
-1.081014, -0.0661079, -0.8573878, 1, 0.8392157, 0, 1,
-1.064043, 0.886822, 0.1211046, 1, 0.8470588, 0, 1,
-1.055093, -0.6202809, -1.308178, 1, 0.8509804, 0, 1,
-1.050614, -0.01528526, -0.8917537, 1, 0.8588235, 0, 1,
-1.048627, 1.161495, 0.6377533, 1, 0.8627451, 0, 1,
-1.047823, -0.866953, -3.130313, 1, 0.8705882, 0, 1,
-1.044724, -0.8796777, -2.234491, 1, 0.8745098, 0, 1,
-1.039582, 0.401909, -1.379288, 1, 0.8823529, 0, 1,
-1.020698, -0.1933156, -1.818774, 1, 0.8862745, 0, 1,
-1.01867, 0.9868647, 0.1089278, 1, 0.8941177, 0, 1,
-1.011601, -0.5117365, -2.316093, 1, 0.8980392, 0, 1,
-1.003477, -0.6641549, -2.863047, 1, 0.9058824, 0, 1,
-0.9835918, -0.9401179, -1.231505, 1, 0.9137255, 0, 1,
-0.9826793, -0.4641179, -2.356418, 1, 0.9176471, 0, 1,
-0.9822424, 1.974096, -0.5219114, 1, 0.9254902, 0, 1,
-0.9801842, 1.639341, 0.4409625, 1, 0.9294118, 0, 1,
-0.9779758, -0.09804286, -1.106606, 1, 0.9372549, 0, 1,
-0.9718156, 1.119714, 0.6091722, 1, 0.9411765, 0, 1,
-0.971065, -0.2199246, -2.259403, 1, 0.9490196, 0, 1,
-0.970255, -0.9742815, -4.554798, 1, 0.9529412, 0, 1,
-0.9683303, -0.5949981, -2.785159, 1, 0.9607843, 0, 1,
-0.9593318, 0.2684321, -1.769639, 1, 0.9647059, 0, 1,
-0.9561578, 0.5320877, -1.934822, 1, 0.972549, 0, 1,
-0.9537902, -0.357892, -1.016591, 1, 0.9764706, 0, 1,
-0.9495195, -0.04229365, -0.6704333, 1, 0.9843137, 0, 1,
-0.9386971, -0.5584745, -3.550144, 1, 0.9882353, 0, 1,
-0.9328968, 0.1972957, -2.739177, 1, 0.9960784, 0, 1,
-0.9312598, -0.4490409, -3.144005, 0.9960784, 1, 0, 1,
-0.9283698, -0.2054952, -2.65462, 0.9921569, 1, 0, 1,
-0.9246181, 1.32691, -1.093443, 0.9843137, 1, 0, 1,
-0.9176535, 0.6108571, 0.1818777, 0.9803922, 1, 0, 1,
-0.9156713, 1.410616, -1.463566, 0.972549, 1, 0, 1,
-0.9097736, -0.04973945, -0.5410193, 0.9686275, 1, 0, 1,
-0.9028347, -1.821416, -1.444185, 0.9607843, 1, 0, 1,
-0.8981012, -0.5498585, -1.487106, 0.9568627, 1, 0, 1,
-0.8979647, 1.524409, -0.8655201, 0.9490196, 1, 0, 1,
-0.8963233, 2.21622, 0.3156996, 0.945098, 1, 0, 1,
-0.8950569, 1.195018, -0.3471167, 0.9372549, 1, 0, 1,
-0.8913299, 1.525461, 0.1557998, 0.9333333, 1, 0, 1,
-0.8910807, 0.5194605, -0.5097188, 0.9254902, 1, 0, 1,
-0.8858896, -1.481119, -2.015844, 0.9215686, 1, 0, 1,
-0.8857944, -0.3146089, -2.562993, 0.9137255, 1, 0, 1,
-0.885528, 0.2306753, -2.528824, 0.9098039, 1, 0, 1,
-0.8783347, 1.290508, 0.9212649, 0.9019608, 1, 0, 1,
-0.8636041, -0.6556177, -1.642666, 0.8941177, 1, 0, 1,
-0.8591921, -0.5323555, -1.498904, 0.8901961, 1, 0, 1,
-0.8568243, -0.4509918, -0.2779928, 0.8823529, 1, 0, 1,
-0.8431867, 2.261504, -3.087479, 0.8784314, 1, 0, 1,
-0.8375741, -0.6364501, -2.598962, 0.8705882, 1, 0, 1,
-0.8352737, 0.6297461, -1.602539, 0.8666667, 1, 0, 1,
-0.8319127, 0.3630238, -2.971655, 0.8588235, 1, 0, 1,
-0.8311014, 0.7057135, -0.784938, 0.854902, 1, 0, 1,
-0.8242761, -0.1184345, -2.675712, 0.8470588, 1, 0, 1,
-0.8239456, -0.4046753, -1.987332, 0.8431373, 1, 0, 1,
-0.8148701, -0.7652403, -4.566758, 0.8352941, 1, 0, 1,
-0.8131828, -0.358611, -1.513834, 0.8313726, 1, 0, 1,
-0.8125321, 0.3012362, -2.690114, 0.8235294, 1, 0, 1,
-0.8118644, -0.858071, -2.857867, 0.8196079, 1, 0, 1,
-0.8105871, 1.128688, -0.6094173, 0.8117647, 1, 0, 1,
-0.809916, 1.3456, -2.21875, 0.8078431, 1, 0, 1,
-0.807469, -0.08353092, -0.3204869, 0.8, 1, 0, 1,
-0.8073452, -0.3744124, -1.292409, 0.7921569, 1, 0, 1,
-0.8069708, -0.1406374, -2.251005, 0.7882353, 1, 0, 1,
-0.804193, 1.083048, -1.20566, 0.7803922, 1, 0, 1,
-0.8032622, 0.355417, -0.1366793, 0.7764706, 1, 0, 1,
-0.8027389, 0.2961977, -1.053068, 0.7686275, 1, 0, 1,
-0.8022074, 0.5414212, -1.261106, 0.7647059, 1, 0, 1,
-0.8018323, -0.7551454, -2.096318, 0.7568628, 1, 0, 1,
-0.801703, -0.2804554, -1.427353, 0.7529412, 1, 0, 1,
-0.796822, -0.2874736, -1.337344, 0.7450981, 1, 0, 1,
-0.7937472, 0.9063115, -0.9302148, 0.7411765, 1, 0, 1,
-0.79277, 0.2498844, -0.5682061, 0.7333333, 1, 0, 1,
-0.7870998, 0.1153794, -0.9650521, 0.7294118, 1, 0, 1,
-0.7838168, -1.091558, -2.491651, 0.7215686, 1, 0, 1,
-0.7835039, -2.558731, -5.407283, 0.7176471, 1, 0, 1,
-0.780637, -1.074585, -1.307115, 0.7098039, 1, 0, 1,
-0.7751427, 2.124591, -0.9522777, 0.7058824, 1, 0, 1,
-0.7749236, 0.3950368, 0.1721862, 0.6980392, 1, 0, 1,
-0.7741253, 0.8041317, -0.7985124, 0.6901961, 1, 0, 1,
-0.7718364, 1.209792, -0.9332718, 0.6862745, 1, 0, 1,
-0.7651167, -0.7958906, -4.263481, 0.6784314, 1, 0, 1,
-0.7612813, 1.992494, 0.6914466, 0.6745098, 1, 0, 1,
-0.760973, 0.8798078, -0.8253243, 0.6666667, 1, 0, 1,
-0.7570398, 0.6368672, 0.07901045, 0.6627451, 1, 0, 1,
-0.7567516, 0.855349, -0.6410285, 0.654902, 1, 0, 1,
-0.7538358, 0.9267786, -3.421486, 0.6509804, 1, 0, 1,
-0.750761, -0.9701297, -1.496014, 0.6431373, 1, 0, 1,
-0.7496921, 1.958652, -1.396162, 0.6392157, 1, 0, 1,
-0.749559, 1.574484, -2.139266, 0.6313726, 1, 0, 1,
-0.7494689, -0.06469787, -1.900373, 0.627451, 1, 0, 1,
-0.7473882, 1.093609, -1.360601, 0.6196079, 1, 0, 1,
-0.7455462, 0.07929716, -2.561316, 0.6156863, 1, 0, 1,
-0.7408639, -1.067055, -3.634502, 0.6078432, 1, 0, 1,
-0.740738, -2.415058, -2.525187, 0.6039216, 1, 0, 1,
-0.7399784, -0.5835721, -0.02391948, 0.5960785, 1, 0, 1,
-0.7378038, 0.9069207, -0.5106236, 0.5882353, 1, 0, 1,
-0.7348675, 0.8101256, -1.714877, 0.5843138, 1, 0, 1,
-0.7334216, -0.7737808, -1.93134, 0.5764706, 1, 0, 1,
-0.7286917, 0.0469683, -3.863741, 0.572549, 1, 0, 1,
-0.7149347, -0.4283021, -1.967537, 0.5647059, 1, 0, 1,
-0.709121, -0.4208301, -1.89481, 0.5607843, 1, 0, 1,
-0.7072911, 0.157969, -1.054154, 0.5529412, 1, 0, 1,
-0.705772, 1.234229, -1.213449, 0.5490196, 1, 0, 1,
-0.7047421, -0.3287597, -1.932196, 0.5411765, 1, 0, 1,
-0.703806, 2.472767, -0.4915251, 0.5372549, 1, 0, 1,
-0.6968399, 1.988821, 0.1637581, 0.5294118, 1, 0, 1,
-0.6968084, 0.681911, -1.12014, 0.5254902, 1, 0, 1,
-0.6931665, -1.930271, -0.993041, 0.5176471, 1, 0, 1,
-0.6866236, 0.05608549, -1.120327, 0.5137255, 1, 0, 1,
-0.6861994, 0.2363556, -0.9089993, 0.5058824, 1, 0, 1,
-0.6845325, 0.375394, -1.00654, 0.5019608, 1, 0, 1,
-0.6780112, 0.04061912, -1.754712, 0.4941176, 1, 0, 1,
-0.6779175, 0.1459455, -1.727548, 0.4862745, 1, 0, 1,
-0.6754811, -0.7829325, -2.251421, 0.4823529, 1, 0, 1,
-0.6612571, 1.42802, -0.1104111, 0.4745098, 1, 0, 1,
-0.6603003, -0.2408258, -1.577148, 0.4705882, 1, 0, 1,
-0.6577534, -0.4163473, -0.644908, 0.4627451, 1, 0, 1,
-0.6553056, -0.2612121, -2.759536, 0.4588235, 1, 0, 1,
-0.6471632, -0.6432984, -4.539168, 0.4509804, 1, 0, 1,
-0.6360502, 0.07432099, -3.135454, 0.4470588, 1, 0, 1,
-0.636046, -0.1836326, -1.252192, 0.4392157, 1, 0, 1,
-0.6351748, 0.5940038, -0.420441, 0.4352941, 1, 0, 1,
-0.6291586, 0.5044246, -2.762518, 0.427451, 1, 0, 1,
-0.6277812, -1.294437, -2.78509, 0.4235294, 1, 0, 1,
-0.6188728, -0.904714, -3.429849, 0.4156863, 1, 0, 1,
-0.612533, 1.283338, -0.4641589, 0.4117647, 1, 0, 1,
-0.6113405, -0.2130427, -1.427223, 0.4039216, 1, 0, 1,
-0.6102225, -0.3656854, -2.069452, 0.3960784, 1, 0, 1,
-0.6082281, 0.5313647, -1.720368, 0.3921569, 1, 0, 1,
-0.6050916, -0.2398461, -3.762074, 0.3843137, 1, 0, 1,
-0.6035164, -0.5362505, -2.220654, 0.3803922, 1, 0, 1,
-0.6022238, -0.5045433, -2.648331, 0.372549, 1, 0, 1,
-0.5952703, 0.6176553, -1.026544, 0.3686275, 1, 0, 1,
-0.5847056, 0.821321, -1.203504, 0.3607843, 1, 0, 1,
-0.5841293, 0.2138629, -3.640798, 0.3568628, 1, 0, 1,
-0.5821204, -0.009734628, -2.442999, 0.3490196, 1, 0, 1,
-0.5795196, 0.4642788, -0.2254408, 0.345098, 1, 0, 1,
-0.5728745, 0.8871689, -2.369994, 0.3372549, 1, 0, 1,
-0.5679427, -1.98452, -4.139704, 0.3333333, 1, 0, 1,
-0.567843, -0.0584374, -1.53226, 0.3254902, 1, 0, 1,
-0.5632938, -1.855002, -2.060345, 0.3215686, 1, 0, 1,
-0.5574586, -2.404036, -3.291875, 0.3137255, 1, 0, 1,
-0.5514677, -0.5399491, -5.107538, 0.3098039, 1, 0, 1,
-0.5459605, -0.8239077, -4.781777, 0.3019608, 1, 0, 1,
-0.5456941, -0.1438882, -2.118503, 0.2941177, 1, 0, 1,
-0.5426903, -0.4346839, -0.7482169, 0.2901961, 1, 0, 1,
-0.5426288, 0.8735802, -1.763348, 0.282353, 1, 0, 1,
-0.5413951, -0.4657706, -1.193582, 0.2784314, 1, 0, 1,
-0.5412778, -0.2574143, -1.652356, 0.2705882, 1, 0, 1,
-0.5382807, -1.211912, -4.061435, 0.2666667, 1, 0, 1,
-0.5370442, 0.3239852, -0.3132268, 0.2588235, 1, 0, 1,
-0.5349539, 1.475464, 2.086506, 0.254902, 1, 0, 1,
-0.5298296, 0.5230894, -1.515038, 0.2470588, 1, 0, 1,
-0.5287272, 0.1610739, -1.151296, 0.2431373, 1, 0, 1,
-0.5190145, -0.01279162, -0.5446304, 0.2352941, 1, 0, 1,
-0.5127373, -0.7596123, -2.666888, 0.2313726, 1, 0, 1,
-0.5115908, -0.6998183, -1.630711, 0.2235294, 1, 0, 1,
-0.5065638, 1.11865, -1.610116, 0.2196078, 1, 0, 1,
-0.5059067, 0.3326631, -1.83892, 0.2117647, 1, 0, 1,
-0.5046199, 0.8098601, -0.2207367, 0.2078431, 1, 0, 1,
-0.5042713, 1.834451, -0.09075083, 0.2, 1, 0, 1,
-0.502565, 0.2402604, -2.787525, 0.1921569, 1, 0, 1,
-0.5023221, 0.7276371, -0.9345827, 0.1882353, 1, 0, 1,
-0.5007612, -0.09653959, -2.481833, 0.1803922, 1, 0, 1,
-0.4957072, -1.911855, -1.866983, 0.1764706, 1, 0, 1,
-0.4932732, -0.3987658, -3.675888, 0.1686275, 1, 0, 1,
-0.4929537, 0.06647132, -0.9407807, 0.1647059, 1, 0, 1,
-0.491396, 0.4854507, 2.083679, 0.1568628, 1, 0, 1,
-0.4868939, 1.217635, 0.1156291, 0.1529412, 1, 0, 1,
-0.4835444, 0.4282887, 0.2055768, 0.145098, 1, 0, 1,
-0.480272, -0.1164079, -0.9182956, 0.1411765, 1, 0, 1,
-0.4774824, -0.8499206, -3.467648, 0.1333333, 1, 0, 1,
-0.4769414, -1.177692, -3.324311, 0.1294118, 1, 0, 1,
-0.4744932, 0.3331742, -0.4924486, 0.1215686, 1, 0, 1,
-0.4742914, -1.61331, -2.757918, 0.1176471, 1, 0, 1,
-0.4740553, -0.3490522, -1.467795, 0.1098039, 1, 0, 1,
-0.4692486, 0.1401247, -2.092272, 0.1058824, 1, 0, 1,
-0.4680697, 0.7204397, 0.07156941, 0.09803922, 1, 0, 1,
-0.4678216, 0.9209688, -0.6500473, 0.09019608, 1, 0, 1,
-0.4670685, 0.06751788, -1.050318, 0.08627451, 1, 0, 1,
-0.460041, -0.6137203, 0.0117563, 0.07843138, 1, 0, 1,
-0.4579733, 0.3064277, -0.4473529, 0.07450981, 1, 0, 1,
-0.4545662, 2.787285, -0.2825806, 0.06666667, 1, 0, 1,
-0.4542101, -2.136165, -2.401318, 0.0627451, 1, 0, 1,
-0.4538077, 0.5879747, -0.3236813, 0.05490196, 1, 0, 1,
-0.4518194, -0.05150522, -2.950023, 0.05098039, 1, 0, 1,
-0.4457528, -1.593675, -1.88378, 0.04313726, 1, 0, 1,
-0.441395, 0.211173, -1.026489, 0.03921569, 1, 0, 1,
-0.4409715, 0.6880354, 0.5925725, 0.03137255, 1, 0, 1,
-0.4397062, -1.287284, -2.617296, 0.02745098, 1, 0, 1,
-0.4344795, -1.43712, -3.80905, 0.01960784, 1, 0, 1,
-0.4306676, -0.6146643, -4.202094, 0.01568628, 1, 0, 1,
-0.4300378, 0.8116324, -1.949225, 0.007843138, 1, 0, 1,
-0.4291115, 1.678945, -0.1389826, 0.003921569, 1, 0, 1,
-0.4281314, -0.5268214, -2.714111, 0, 1, 0.003921569, 1,
-0.4260246, 1.991975, -0.6457773, 0, 1, 0.01176471, 1,
-0.4230794, 2.141672, -0.009165589, 0, 1, 0.01568628, 1,
-0.4223301, -0.6016869, -2.871084, 0, 1, 0.02352941, 1,
-0.4222635, 0.1676331, -0.5465437, 0, 1, 0.02745098, 1,
-0.4188706, 0.9739367, -1.671765, 0, 1, 0.03529412, 1,
-0.4172056, 0.3205864, -0.6289044, 0, 1, 0.03921569, 1,
-0.4117838, -0.6608403, -2.431642, 0, 1, 0.04705882, 1,
-0.4097403, 0.2234267, -0.9328846, 0, 1, 0.05098039, 1,
-0.4056472, -0.008971121, -1.344698, 0, 1, 0.05882353, 1,
-0.4018193, -1.406897, -3.957851, 0, 1, 0.0627451, 1,
-0.3985351, -0.5465745, -2.763304, 0, 1, 0.07058824, 1,
-0.396921, -0.8419366, -3.061277, 0, 1, 0.07450981, 1,
-0.3900395, -0.9974787, -2.569694, 0, 1, 0.08235294, 1,
-0.3846602, -1.250402, -3.046447, 0, 1, 0.08627451, 1,
-0.3814956, 0.3830853, -0.6514188, 0, 1, 0.09411765, 1,
-0.3774096, 1.148009, -0.2180061, 0, 1, 0.1019608, 1,
-0.377269, 0.2223431, -2.507364, 0, 1, 0.1058824, 1,
-0.3760741, 0.4740492, -1.455133, 0, 1, 0.1137255, 1,
-0.3723643, -1.859369, -4.606511, 0, 1, 0.1176471, 1,
-0.371864, -1.888552, -2.993042, 0, 1, 0.1254902, 1,
-0.3708318, 0.1686564, -1.032865, 0, 1, 0.1294118, 1,
-0.3700409, -1.022798, -3.307024, 0, 1, 0.1372549, 1,
-0.3695307, -1.478138, -1.636794, 0, 1, 0.1411765, 1,
-0.3659684, -0.7323192, -4.247534, 0, 1, 0.1490196, 1,
-0.3656144, 0.2032288, -0.9199702, 0, 1, 0.1529412, 1,
-0.3643272, 0.5241426, 0.1474743, 0, 1, 0.1607843, 1,
-0.3638086, 0.06659032, -1.381274, 0, 1, 0.1647059, 1,
-0.3492789, -0.6892091, -3.193928, 0, 1, 0.172549, 1,
-0.3481269, 0.6363472, -1.176045, 0, 1, 0.1764706, 1,
-0.3476509, -0.2513312, -1.540841, 0, 1, 0.1843137, 1,
-0.3439377, -0.1838795, -3.782596, 0, 1, 0.1882353, 1,
-0.3418005, -1.097544, -3.524133, 0, 1, 0.1960784, 1,
-0.3406305, -2.407194, -3.771022, 0, 1, 0.2039216, 1,
-0.3383735, 1.387808, -0.9658204, 0, 1, 0.2078431, 1,
-0.3382508, 1.02506, 0.2023076, 0, 1, 0.2156863, 1,
-0.3367446, 0.7847816, 2.250515, 0, 1, 0.2196078, 1,
-0.3275769, -0.9453494, -3.379141, 0, 1, 0.227451, 1,
-0.3271464, 0.7061754, -0.7090414, 0, 1, 0.2313726, 1,
-0.3270115, -0.07312249, -0.5324934, 0, 1, 0.2392157, 1,
-0.3257618, -0.5668662, -4.075844, 0, 1, 0.2431373, 1,
-0.3247658, 0.09954974, -1.288017, 0, 1, 0.2509804, 1,
-0.323242, -0.5455726, -2.876517, 0, 1, 0.254902, 1,
-0.321835, -0.285338, -2.807303, 0, 1, 0.2627451, 1,
-0.3191766, 1.644158, -0.1147027, 0, 1, 0.2666667, 1,
-0.3174178, 0.3936392, -0.2360197, 0, 1, 0.2745098, 1,
-0.3169862, 0.6800171, -0.6986116, 0, 1, 0.2784314, 1,
-0.3164884, 0.4703333, -0.9961918, 0, 1, 0.2862745, 1,
-0.3108759, 1.696155, 0.03066519, 0, 1, 0.2901961, 1,
-0.3085197, 0.257185, -0.1956401, 0, 1, 0.2980392, 1,
-0.3077814, 1.056135, -1.478232, 0, 1, 0.3058824, 1,
-0.3001263, 1.033075, -3.472925, 0, 1, 0.3098039, 1,
-0.2988855, 0.3953527, -0.590334, 0, 1, 0.3176471, 1,
-0.2986268, 0.06283758, -1.914596, 0, 1, 0.3215686, 1,
-0.298614, -0.636723, -1.532137, 0, 1, 0.3294118, 1,
-0.2956515, 1.53486, -1.539768, 0, 1, 0.3333333, 1,
-0.2949284, 0.7427757, -0.2811094, 0, 1, 0.3411765, 1,
-0.290368, -0.1409092, -3.064715, 0, 1, 0.345098, 1,
-0.2874385, 0.3995622, 0.4406062, 0, 1, 0.3529412, 1,
-0.2850308, -0.4257265, -2.132714, 0, 1, 0.3568628, 1,
-0.2812595, -0.2006701, -1.54451, 0, 1, 0.3647059, 1,
-0.2811452, 0.6295339, -1.451415, 0, 1, 0.3686275, 1,
-0.2803462, -0.7185768, -3.22485, 0, 1, 0.3764706, 1,
-0.276181, -0.5378575, -2.892619, 0, 1, 0.3803922, 1,
-0.2730019, -0.08062052, -1.013062, 0, 1, 0.3882353, 1,
-0.2724857, 1.837295, 0.03065445, 0, 1, 0.3921569, 1,
-0.265462, -0.7173972, -1.704186, 0, 1, 0.4, 1,
-0.262427, -0.5721286, -3.517249, 0, 1, 0.4078431, 1,
-0.2610579, -0.1542411, -2.323906, 0, 1, 0.4117647, 1,
-0.250437, -1.249238, -3.590191, 0, 1, 0.4196078, 1,
-0.244793, -0.02421167, -1.825129, 0, 1, 0.4235294, 1,
-0.2429048, 0.8137798, 0.3092185, 0, 1, 0.4313726, 1,
-0.2423776, -0.5520561, -2.683785, 0, 1, 0.4352941, 1,
-0.2374726, -0.2809931, -3.485882, 0, 1, 0.4431373, 1,
-0.2347787, -0.5212308, -3.720645, 0, 1, 0.4470588, 1,
-0.2334529, -0.3967519, -4.046959, 0, 1, 0.454902, 1,
-0.2332628, -1.229127, -4.656463, 0, 1, 0.4588235, 1,
-0.2313951, 1.78912, 1.516921, 0, 1, 0.4666667, 1,
-0.231137, -0.251944, -1.937544, 0, 1, 0.4705882, 1,
-0.2298347, 2.10544, -2.759153, 0, 1, 0.4784314, 1,
-0.2262138, 0.6576818, -0.7461848, 0, 1, 0.4823529, 1,
-0.2241011, -0.2561354, -1.923499, 0, 1, 0.4901961, 1,
-0.218109, 0.02105538, -0.8233585, 0, 1, 0.4941176, 1,
-0.2179766, 1.973828, 0.8382856, 0, 1, 0.5019608, 1,
-0.215487, 1.721437, 1.007843, 0, 1, 0.509804, 1,
-0.2124335, 1.166784, -0.4326492, 0, 1, 0.5137255, 1,
-0.2041029, 1.304482, 2.041789, 0, 1, 0.5215687, 1,
-0.2013011, -0.03284338, -2.262748, 0, 1, 0.5254902, 1,
-0.2007372, 0.08284342, -1.83528, 0, 1, 0.5333334, 1,
-0.1824352, -1.144289, -3.246152, 0, 1, 0.5372549, 1,
-0.1797654, 0.3272119, -0.513157, 0, 1, 0.5450981, 1,
-0.1772267, 1.047804, 0.1212308, 0, 1, 0.5490196, 1,
-0.1747868, -1.059154, -2.982612, 0, 1, 0.5568628, 1,
-0.1744571, -0.08260069, -2.422423, 0, 1, 0.5607843, 1,
-0.1737679, 1.25917, -0.9816191, 0, 1, 0.5686275, 1,
-0.1733418, 0.1101423, -1.471426, 0, 1, 0.572549, 1,
-0.1653903, -0.7203583, -4.134058, 0, 1, 0.5803922, 1,
-0.1629054, 0.4880282, 0.2455732, 0, 1, 0.5843138, 1,
-0.1609829, -0.8032145, -3.320293, 0, 1, 0.5921569, 1,
-0.1598862, -1.534163, -4.35056, 0, 1, 0.5960785, 1,
-0.1553585, 1.717985, -0.4024391, 0, 1, 0.6039216, 1,
-0.149815, -0.4349812, -1.515217, 0, 1, 0.6117647, 1,
-0.1497241, 0.1793194, 0.3997889, 0, 1, 0.6156863, 1,
-0.1495232, 0.92269, -1.274112, 0, 1, 0.6235294, 1,
-0.1464966, -0.9279803, -3.597942, 0, 1, 0.627451, 1,
-0.1458418, 0.8339023, -1.790241, 0, 1, 0.6352941, 1,
-0.1438736, 0.7074613, -0.1565408, 0, 1, 0.6392157, 1,
-0.1399504, -0.6836694, -4.790059, 0, 1, 0.6470588, 1,
-0.1392262, -1.995757, -3.972503, 0, 1, 0.6509804, 1,
-0.1356204, 0.7192808, 0.5744028, 0, 1, 0.6588235, 1,
-0.1347986, 1.2282, -0.3001394, 0, 1, 0.6627451, 1,
-0.1343686, 0.8231559, 0.7661671, 0, 1, 0.6705883, 1,
-0.1305871, -1.602934, -3.092383, 0, 1, 0.6745098, 1,
-0.1272527, -0.9363292, -2.934979, 0, 1, 0.682353, 1,
-0.1254146, -1.09284, -1.73298, 0, 1, 0.6862745, 1,
-0.1247879, -0.4031005, -3.585633, 0, 1, 0.6941177, 1,
-0.1238019, 0.6114156, 0.8694425, 0, 1, 0.7019608, 1,
-0.122668, -0.157271, -4.333312, 0, 1, 0.7058824, 1,
-0.1185247, -1.579898, -2.437662, 0, 1, 0.7137255, 1,
-0.1166105, -0.1432355, -2.916537, 0, 1, 0.7176471, 1,
-0.1147838, -0.2092638, -0.6730574, 0, 1, 0.7254902, 1,
-0.114687, -0.021142, -2.594249, 0, 1, 0.7294118, 1,
-0.1099665, 0.6287105, -1.494049, 0, 1, 0.7372549, 1,
-0.1056417, 0.8686676, -0.2815717, 0, 1, 0.7411765, 1,
-0.1056086, -0.9219206, -1.093617, 0, 1, 0.7490196, 1,
-0.1032878, -1.249727, -1.829, 0, 1, 0.7529412, 1,
-0.1032502, -0.7477621, -2.097328, 0, 1, 0.7607843, 1,
-0.09650617, 0.6008, -0.8659276, 0, 1, 0.7647059, 1,
-0.09572497, -0.6226693, -2.710983, 0, 1, 0.772549, 1,
-0.09285715, -0.09432149, -1.802114, 0, 1, 0.7764706, 1,
-0.09186603, 0.1642257, -0.438953, 0, 1, 0.7843137, 1,
-0.08971952, -0.620093, -2.303926, 0, 1, 0.7882353, 1,
-0.08669124, -0.2559936, -3.243282, 0, 1, 0.7960784, 1,
-0.085589, 0.3740872, 0.1151481, 0, 1, 0.8039216, 1,
-0.08383999, 1.349467, -0.3935215, 0, 1, 0.8078431, 1,
-0.07973404, -1.665947, -4.314874, 0, 1, 0.8156863, 1,
-0.07595295, 1.035451, 1.438844, 0, 1, 0.8196079, 1,
-0.07567245, 0.3445531, 1.052616, 0, 1, 0.827451, 1,
-0.07360233, 0.5261508, -0.3631642, 0, 1, 0.8313726, 1,
-0.07294817, 1.408863, 0.3548618, 0, 1, 0.8392157, 1,
-0.06775561, -0.03824838, -2.502291, 0, 1, 0.8431373, 1,
-0.06435937, -0.7633347, -1.076415, 0, 1, 0.8509804, 1,
-0.06064232, 0.2289755, -0.2048864, 0, 1, 0.854902, 1,
-0.0571605, 1.295771, -0.7317715, 0, 1, 0.8627451, 1,
-0.05438985, -0.9530413, -3.811098, 0, 1, 0.8666667, 1,
-0.05430996, -0.9290175, -5.913744, 0, 1, 0.8745098, 1,
-0.05257505, 0.6402324, -0.9729313, 0, 1, 0.8784314, 1,
-0.0509649, -0.6552056, -3.39055, 0, 1, 0.8862745, 1,
-0.04961434, -0.5681611, -2.889244, 0, 1, 0.8901961, 1,
-0.04486541, 0.2275129, 0.09350519, 0, 1, 0.8980392, 1,
-0.04450305, 0.3558969, 0.3509286, 0, 1, 0.9058824, 1,
-0.04357076, -0.2473, -2.962617, 0, 1, 0.9098039, 1,
-0.03392127, 1.105415, 0.1893875, 0, 1, 0.9176471, 1,
-0.03359967, 0.6140409, -0.9706897, 0, 1, 0.9215686, 1,
-0.03211519, 1.007161, 0.06361522, 0, 1, 0.9294118, 1,
-0.02715234, -0.4879944, -2.730554, 0, 1, 0.9333333, 1,
-0.02445121, 0.1069509, -0.2868139, 0, 1, 0.9411765, 1,
-0.02187141, 0.1552188, 1.207146, 0, 1, 0.945098, 1,
-0.01969761, -1.182492, -3.465193, 0, 1, 0.9529412, 1,
-0.01927929, 0.4915203, 1.396561, 0, 1, 0.9568627, 1,
-0.017126, 1.45724, -0.605156, 0, 1, 0.9647059, 1,
-0.01579404, -0.7912799, -2.954089, 0, 1, 0.9686275, 1,
-0.01317815, -2.325651, -4.128045, 0, 1, 0.9764706, 1,
-0.01050042, 0.1381973, -1.408153, 0, 1, 0.9803922, 1,
-0.009639148, 0.974314, -0.4079421, 0, 1, 0.9882353, 1,
-0.004496349, -0.3650292, -2.440316, 0, 1, 0.9921569, 1,
-0.0004480167, 0.1698108, 0.5395339, 0, 1, 1, 1,
0.004337339, 0.6192506, 0.9031708, 0, 0.9921569, 1, 1,
0.004418775, 1.398838, -0.3012629, 0, 0.9882353, 1, 1,
0.005009497, 1.942724, 0.663368, 0, 0.9803922, 1, 1,
0.006381095, 0.3701487, 0.5936561, 0, 0.9764706, 1, 1,
0.006524168, -0.9619299, 3.735223, 0, 0.9686275, 1, 1,
0.00783289, 1.383344, 0.3705902, 0, 0.9647059, 1, 1,
0.01008806, 0.4467706, -1.286661, 0, 0.9568627, 1, 1,
0.01099934, 1.409292, 0.05930841, 0, 0.9529412, 1, 1,
0.01144069, 0.7421283, -1.311655, 0, 0.945098, 1, 1,
0.0123231, -2.650377, 3.892282, 0, 0.9411765, 1, 1,
0.01391995, -2.387576, 2.565425, 0, 0.9333333, 1, 1,
0.02155083, -0.5090178, 2.527173, 0, 0.9294118, 1, 1,
0.02945493, 1.661253, 1.633406, 0, 0.9215686, 1, 1,
0.03428653, 0.9877255, -0.5048569, 0, 0.9176471, 1, 1,
0.03984311, -0.7855355, 1.876509, 0, 0.9098039, 1, 1,
0.040602, 1.059617, -0.9556121, 0, 0.9058824, 1, 1,
0.04244725, 0.8440681, -0.01740638, 0, 0.8980392, 1, 1,
0.04724382, 1.778224, 1.189854, 0, 0.8901961, 1, 1,
0.0484693, -0.517333, 1.221046, 0, 0.8862745, 1, 1,
0.04950227, 0.9459974, 0.06160443, 0, 0.8784314, 1, 1,
0.04983903, -1.458318, 3.780225, 0, 0.8745098, 1, 1,
0.05293272, 0.8632005, -1.132034, 0, 0.8666667, 1, 1,
0.05487045, -2.286007, 3.245314, 0, 0.8627451, 1, 1,
0.06032005, -0.9101517, 5.532282, 0, 0.854902, 1, 1,
0.06570531, -0.04873376, 2.670899, 0, 0.8509804, 1, 1,
0.06664482, 0.7798718, 0.1915772, 0, 0.8431373, 1, 1,
0.07206685, 0.4372461, 1.377178, 0, 0.8392157, 1, 1,
0.07583758, -0.1173403, 1.762404, 0, 0.8313726, 1, 1,
0.07658534, 0.5172126, -1.233597, 0, 0.827451, 1, 1,
0.08012082, 1.297545, 1.037019, 0, 0.8196079, 1, 1,
0.08614162, 0.7429708, 1.568809, 0, 0.8156863, 1, 1,
0.0871852, -1.598209, 3.337373, 0, 0.8078431, 1, 1,
0.09087472, -2.412385, 4.259559, 0, 0.8039216, 1, 1,
0.09128381, -0.7966774, 4.62989, 0, 0.7960784, 1, 1,
0.09148688, -0.01770553, 1.116184, 0, 0.7882353, 1, 1,
0.09315489, -1.511633, 3.163144, 0, 0.7843137, 1, 1,
0.09406424, 0.9030715, -0.1612804, 0, 0.7764706, 1, 1,
0.09590995, 0.04111239, 1.233066, 0, 0.772549, 1, 1,
0.1017452, 0.6057252, -0.2340035, 0, 0.7647059, 1, 1,
0.1070847, 0.117805, 3.204269, 0, 0.7607843, 1, 1,
0.1082518, 0.4718217, 0.7988585, 0, 0.7529412, 1, 1,
0.1214642, 0.5025914, -1.061801, 0, 0.7490196, 1, 1,
0.1236561, 0.09984205, 0.2835564, 0, 0.7411765, 1, 1,
0.1242027, 0.2881666, -0.6028084, 0, 0.7372549, 1, 1,
0.1280643, -0.624819, 3.708218, 0, 0.7294118, 1, 1,
0.1280971, 1.096541, 1.270707, 0, 0.7254902, 1, 1,
0.1329693, 0.9197051, -0.420722, 0, 0.7176471, 1, 1,
0.1367297, 1.297207, 0.1030129, 0, 0.7137255, 1, 1,
0.1499932, -0.2161382, 2.239457, 0, 0.7058824, 1, 1,
0.1500099, -0.545043, 2.580435, 0, 0.6980392, 1, 1,
0.151114, 0.2716824, 0.9788154, 0, 0.6941177, 1, 1,
0.1564248, -1.512302, 2.90238, 0, 0.6862745, 1, 1,
0.1593948, 0.337872, -0.179676, 0, 0.682353, 1, 1,
0.1603825, -0.1155628, 5.023612, 0, 0.6745098, 1, 1,
0.1642425, -2.243416, 2.620555, 0, 0.6705883, 1, 1,
0.16477, -0.9706843, 3.373344, 0, 0.6627451, 1, 1,
0.1648736, 0.276815, -0.1672132, 0, 0.6588235, 1, 1,
0.17368, -0.09511692, 2.025422, 0, 0.6509804, 1, 1,
0.1738987, -0.2322693, 1.131533, 0, 0.6470588, 1, 1,
0.175257, 0.2724735, 1.277933, 0, 0.6392157, 1, 1,
0.1767109, -0.6318212, 1.759531, 0, 0.6352941, 1, 1,
0.1792032, -1.33687, 2.506881, 0, 0.627451, 1, 1,
0.1797968, -0.3540968, 2.570611, 0, 0.6235294, 1, 1,
0.1819416, 1.236292, 0.3017495, 0, 0.6156863, 1, 1,
0.1851068, -0.4768967, 4.853343, 0, 0.6117647, 1, 1,
0.1865517, 0.1329223, 1.214242, 0, 0.6039216, 1, 1,
0.1891004, 0.3829944, -0.5531778, 0, 0.5960785, 1, 1,
0.189233, -1.539585, 5.103859, 0, 0.5921569, 1, 1,
0.1909908, 0.2793134, 2.571242, 0, 0.5843138, 1, 1,
0.1942731, 1.128463, -1.075867, 0, 0.5803922, 1, 1,
0.1984607, 0.1675479, 2.039603, 0, 0.572549, 1, 1,
0.2002666, -0.9534761, 2.958659, 0, 0.5686275, 1, 1,
0.2103739, 0.8693183, 1.043714, 0, 0.5607843, 1, 1,
0.2149489, 0.4751901, 0.506661, 0, 0.5568628, 1, 1,
0.2149684, 0.9988067, 0.3012724, 0, 0.5490196, 1, 1,
0.2163869, -0.4808067, 4.778485, 0, 0.5450981, 1, 1,
0.2181469, 1.130187, -0.4136071, 0, 0.5372549, 1, 1,
0.2205447, 0.01492264, 0.9039961, 0, 0.5333334, 1, 1,
0.2275506, 0.1814958, -1.232272, 0, 0.5254902, 1, 1,
0.2311786, -0.1280962, 1.042355, 0, 0.5215687, 1, 1,
0.2316883, -0.3712462, 2.707095, 0, 0.5137255, 1, 1,
0.232555, 0.7113303, -2.216972, 0, 0.509804, 1, 1,
0.2420638, -0.7307727, 2.177864, 0, 0.5019608, 1, 1,
0.2430202, 1.728876, 0.8833652, 0, 0.4941176, 1, 1,
0.2432889, -0.2661946, 1.055647, 0, 0.4901961, 1, 1,
0.244043, -0.762557, 3.310893, 0, 0.4823529, 1, 1,
0.2471186, 0.6948828, 0.6652904, 0, 0.4784314, 1, 1,
0.2481948, 0.8059967, -0.5194516, 0, 0.4705882, 1, 1,
0.2500358, -0.8510889, 3.988405, 0, 0.4666667, 1, 1,
0.2532059, -0.4798261, 3.405384, 0, 0.4588235, 1, 1,
0.253756, -0.8222913, 4.120518, 0, 0.454902, 1, 1,
0.254579, -0.2355045, 2.081387, 0, 0.4470588, 1, 1,
0.2556891, 0.1577898, -0.3922481, 0, 0.4431373, 1, 1,
0.2562467, -0.07376874, 3.427791, 0, 0.4352941, 1, 1,
0.2599494, -0.5400044, 2.21734, 0, 0.4313726, 1, 1,
0.2630388, 0.3623366, 1.412329, 0, 0.4235294, 1, 1,
0.2656306, 0.6715953, -0.6440115, 0, 0.4196078, 1, 1,
0.266713, 0.09965754, 1.07553, 0, 0.4117647, 1, 1,
0.2707599, 0.6441605, -0.8032799, 0, 0.4078431, 1, 1,
0.2724248, -0.467688, 3.160188, 0, 0.4, 1, 1,
0.2729955, 1.100633, -1.236616, 0, 0.3921569, 1, 1,
0.2755372, -0.668559, 2.021127, 0, 0.3882353, 1, 1,
0.2813621, -0.3818919, 3.190008, 0, 0.3803922, 1, 1,
0.2898285, 0.0968314, 1.700642, 0, 0.3764706, 1, 1,
0.290058, 1.478575, 0.09455383, 0, 0.3686275, 1, 1,
0.2926135, -0.04226482, 1.940693, 0, 0.3647059, 1, 1,
0.293362, -0.06115454, 1.109964, 0, 0.3568628, 1, 1,
0.2946692, -0.5055807, 1.216437, 0, 0.3529412, 1, 1,
0.2979044, 0.2695587, 1.929886, 0, 0.345098, 1, 1,
0.2984755, -1.411829, 2.274204, 0, 0.3411765, 1, 1,
0.3024407, 1.269363, -0.469256, 0, 0.3333333, 1, 1,
0.3062471, -1.505709, 1.784479, 0, 0.3294118, 1, 1,
0.3095089, -0.4923235, 0.5518634, 0, 0.3215686, 1, 1,
0.3108352, 0.7399743, 0.862354, 0, 0.3176471, 1, 1,
0.3214753, 0.2715385, 1.150462, 0, 0.3098039, 1, 1,
0.3247046, -0.699436, 1.521946, 0, 0.3058824, 1, 1,
0.3249669, 1.183749, 0.7432789, 0, 0.2980392, 1, 1,
0.3310016, -0.8129056, 1.966896, 0, 0.2901961, 1, 1,
0.3322927, 0.1762426, 1.316547, 0, 0.2862745, 1, 1,
0.3349772, -0.2999482, 2.023512, 0, 0.2784314, 1, 1,
0.3377064, -1.177989, 2.112126, 0, 0.2745098, 1, 1,
0.3412823, -0.256593, 2.31038, 0, 0.2666667, 1, 1,
0.3418431, 0.6365972, 0.4278935, 0, 0.2627451, 1, 1,
0.3428092, 0.2153267, 1.150015, 0, 0.254902, 1, 1,
0.3429889, -0.1366336, -0.1847189, 0, 0.2509804, 1, 1,
0.3467053, 1.671588, 0.7618622, 0, 0.2431373, 1, 1,
0.3470033, -0.603178, 3.43229, 0, 0.2392157, 1, 1,
0.3484317, 0.4157842, 1.490541, 0, 0.2313726, 1, 1,
0.3531035, -0.697012, 2.627424, 0, 0.227451, 1, 1,
0.3539013, 1.073119, 0.8429479, 0, 0.2196078, 1, 1,
0.3550926, 0.9196386, 0.884146, 0, 0.2156863, 1, 1,
0.3563738, -1.822353, 2.516673, 0, 0.2078431, 1, 1,
0.3619744, 1.519044, -2.646891, 0, 0.2039216, 1, 1,
0.3638984, 0.7251822, 1.268117, 0, 0.1960784, 1, 1,
0.3705714, -0.03650372, 1.115504, 0, 0.1882353, 1, 1,
0.3705891, -0.6521236, 3.091031, 0, 0.1843137, 1, 1,
0.3785775, -0.324996, 1.632887, 0, 0.1764706, 1, 1,
0.3786099, 0.8302639, 0.1481144, 0, 0.172549, 1, 1,
0.3845755, 1.952347, 0.6083131, 0, 0.1647059, 1, 1,
0.3934882, 0.1498833, 0.9013699, 0, 0.1607843, 1, 1,
0.3942055, 0.311874, 2.138091, 0, 0.1529412, 1, 1,
0.395594, 1.282183, -0.5017219, 0, 0.1490196, 1, 1,
0.3958404, 0.5226701, 0.6070351, 0, 0.1411765, 1, 1,
0.4010428, 0.7155489, 0.4650785, 0, 0.1372549, 1, 1,
0.4016932, -1.468516, 3.46463, 0, 0.1294118, 1, 1,
0.4017961, 0.3271732, 1.044227, 0, 0.1254902, 1, 1,
0.4050812, -1.234146, 2.952429, 0, 0.1176471, 1, 1,
0.4061812, -0.2436171, 0.6855899, 0, 0.1137255, 1, 1,
0.4065281, 2.025507, 0.9375813, 0, 0.1058824, 1, 1,
0.4173703, 0.1349049, 1.427122, 0, 0.09803922, 1, 1,
0.4187162, 1.392519, 0.09697275, 0, 0.09411765, 1, 1,
0.422955, -0.1563825, 3.280195, 0, 0.08627451, 1, 1,
0.4229881, -2.697874, 5.055779, 0, 0.08235294, 1, 1,
0.4262364, 0.2241736, 1.402594, 0, 0.07450981, 1, 1,
0.428828, 1.661906, -0.06713419, 0, 0.07058824, 1, 1,
0.4340826, -0.6263672, 3.316426, 0, 0.0627451, 1, 1,
0.4342747, -0.1954574, 1.850043, 0, 0.05882353, 1, 1,
0.4357022, -0.7830421, 1.851233, 0, 0.05098039, 1, 1,
0.4387708, -1.054305, 2.283904, 0, 0.04705882, 1, 1,
0.4390638, 0.4702232, -0.722384, 0, 0.03921569, 1, 1,
0.4411356, 2.231736, 0.3441089, 0, 0.03529412, 1, 1,
0.4414125, -0.1065714, 1.371894, 0, 0.02745098, 1, 1,
0.4418691, -0.5483347, 4.329076, 0, 0.02352941, 1, 1,
0.447644, 0.3566818, 2.315345, 0, 0.01568628, 1, 1,
0.4497763, -1.149287, 2.786089, 0, 0.01176471, 1, 1,
0.4522433, -1.54559, 2.131592, 0, 0.003921569, 1, 1,
0.4587933, 0.04378873, 0.5996314, 0.003921569, 0, 1, 1,
0.4593891, -0.6402205, 3.456665, 0.007843138, 0, 1, 1,
0.4623107, 0.1089079, 2.163955, 0.01568628, 0, 1, 1,
0.465353, -0.7469851, 1.716387, 0.01960784, 0, 1, 1,
0.4669289, -0.1416865, 0.880706, 0.02745098, 0, 1, 1,
0.4695838, 0.1146793, 1.665571, 0.03137255, 0, 1, 1,
0.473331, -0.3672761, 3.098516, 0.03921569, 0, 1, 1,
0.4747298, 0.3080401, 2.603136, 0.04313726, 0, 1, 1,
0.4767365, -1.28835, 3.04624, 0.05098039, 0, 1, 1,
0.4853178, -0.9383707, 3.156498, 0.05490196, 0, 1, 1,
0.4859345, -0.6379218, 1.500821, 0.0627451, 0, 1, 1,
0.4889611, -2.122921, 3.837879, 0.06666667, 0, 1, 1,
0.4905739, 0.1959545, -0.4163624, 0.07450981, 0, 1, 1,
0.496037, -1.218948, 2.654416, 0.07843138, 0, 1, 1,
0.5007266, 0.1701038, -0.2202943, 0.08627451, 0, 1, 1,
0.5028149, 0.1339507, 2.921135, 0.09019608, 0, 1, 1,
0.5077259, -1.060495, 3.130131, 0.09803922, 0, 1, 1,
0.5104699, -2.268625, 1.706913, 0.1058824, 0, 1, 1,
0.5108949, 0.8186188, 0.6944296, 0.1098039, 0, 1, 1,
0.517553, -0.5235952, 0.6874844, 0.1176471, 0, 1, 1,
0.5183828, -0.7596464, 1.052499, 0.1215686, 0, 1, 1,
0.5214201, 0.8638921, -0.5589142, 0.1294118, 0, 1, 1,
0.5218111, -0.5904785, 2.776664, 0.1333333, 0, 1, 1,
0.5219563, 0.2502348, 1.098203, 0.1411765, 0, 1, 1,
0.5220651, 1.130308, 3.113135, 0.145098, 0, 1, 1,
0.5232433, 0.03696474, 0.9201621, 0.1529412, 0, 1, 1,
0.526531, 0.3236768, 1.430293, 0.1568628, 0, 1, 1,
0.5281687, 2.257568, -0.7188002, 0.1647059, 0, 1, 1,
0.5368025, -2.306328, 1.706825, 0.1686275, 0, 1, 1,
0.5373794, 1.027219, 1.023383, 0.1764706, 0, 1, 1,
0.5419693, 0.09621422, 2.523345, 0.1803922, 0, 1, 1,
0.5451404, -0.8740085, 1.524847, 0.1882353, 0, 1, 1,
0.5499715, 0.2613994, -0.5037084, 0.1921569, 0, 1, 1,
0.5511559, -0.3158543, 2.383404, 0.2, 0, 1, 1,
0.5554689, -1.398581, 3.098593, 0.2078431, 0, 1, 1,
0.5561466, -0.9408448, 2.136906, 0.2117647, 0, 1, 1,
0.556299, -0.1450978, 2.781918, 0.2196078, 0, 1, 1,
0.5636093, 0.5797682, 0.9000648, 0.2235294, 0, 1, 1,
0.5653055, -1.746285, 1.788391, 0.2313726, 0, 1, 1,
0.5711321, -0.4400743, 1.415006, 0.2352941, 0, 1, 1,
0.5724257, -1.063232, 2.031139, 0.2431373, 0, 1, 1,
0.5744297, -0.2790809, 2.46061, 0.2470588, 0, 1, 1,
0.5760047, 0.3074771, 0.3594614, 0.254902, 0, 1, 1,
0.5787163, -0.2948169, 1.100817, 0.2588235, 0, 1, 1,
0.5795305, -0.1775422, 4.044719, 0.2666667, 0, 1, 1,
0.5844274, -0.3968267, 2.767321, 0.2705882, 0, 1, 1,
0.5872175, 1.490302, 0.8580188, 0.2784314, 0, 1, 1,
0.5896032, -1.864291, 1.809282, 0.282353, 0, 1, 1,
0.5919114, -2.168768, 1.887658, 0.2901961, 0, 1, 1,
0.5925096, -0.8236071, 2.632411, 0.2941177, 0, 1, 1,
0.5959778, 0.9231447, 0.5877194, 0.3019608, 0, 1, 1,
0.5968055, -1.125381, 1.537682, 0.3098039, 0, 1, 1,
0.5985892, -1.100297, 4.358185, 0.3137255, 0, 1, 1,
0.6001734, 0.0007996025, 1.118217, 0.3215686, 0, 1, 1,
0.609843, 0.2706386, 1.29637, 0.3254902, 0, 1, 1,
0.6186688, 0.6970031, 1.585166, 0.3333333, 0, 1, 1,
0.6204383, -1.110729, 2.639325, 0.3372549, 0, 1, 1,
0.6226276, 0.987071, -0.1545454, 0.345098, 0, 1, 1,
0.6271734, -0.6257303, 1.733376, 0.3490196, 0, 1, 1,
0.635639, -0.0388405, 0.8782794, 0.3568628, 0, 1, 1,
0.6393592, -0.971155, 4.03774, 0.3607843, 0, 1, 1,
0.640585, 1.44242, -1.359376, 0.3686275, 0, 1, 1,
0.6411372, 1.292406, -0.02409273, 0.372549, 0, 1, 1,
0.6419857, 0.3889516, -0.01113043, 0.3803922, 0, 1, 1,
0.6475334, 1.589222, -0.5067917, 0.3843137, 0, 1, 1,
0.6485828, 0.6076534, -0.40937, 0.3921569, 0, 1, 1,
0.6495278, 0.32111, 1.448825, 0.3960784, 0, 1, 1,
0.6498105, -0.3236655, -0.8629562, 0.4039216, 0, 1, 1,
0.6501215, -0.6316681, 2.432191, 0.4117647, 0, 1, 1,
0.6510794, -0.7057282, 2.210366, 0.4156863, 0, 1, 1,
0.6517516, -0.6584616, 1.979146, 0.4235294, 0, 1, 1,
0.6528496, -1.148786, 1.015973, 0.427451, 0, 1, 1,
0.6583119, 0.8210458, 1.145771, 0.4352941, 0, 1, 1,
0.6586237, -1.097811, 4.342196, 0.4392157, 0, 1, 1,
0.6589488, 1.702877, 0.9345595, 0.4470588, 0, 1, 1,
0.6606777, -1.522135, 3.139089, 0.4509804, 0, 1, 1,
0.6637458, 1.428293, -0.1286398, 0.4588235, 0, 1, 1,
0.6650648, -0.2220755, 1.74714, 0.4627451, 0, 1, 1,
0.6685391, -0.2637528, 1.647455, 0.4705882, 0, 1, 1,
0.6704698, -0.4582672, 1.150373, 0.4745098, 0, 1, 1,
0.671866, 0.1960027, 2.401011, 0.4823529, 0, 1, 1,
0.6719465, -1.246916, 3.430607, 0.4862745, 0, 1, 1,
0.6794842, 0.6679791, 0.6644841, 0.4941176, 0, 1, 1,
0.6795666, 0.8407605, 0.9337633, 0.5019608, 0, 1, 1,
0.6805261, -0.1562354, 1.484624, 0.5058824, 0, 1, 1,
0.6859162, -0.5128129, 2.630999, 0.5137255, 0, 1, 1,
0.6864717, -0.9601467, 2.000471, 0.5176471, 0, 1, 1,
0.6874889, -0.7200534, 2.151818, 0.5254902, 0, 1, 1,
0.6877565, 1.417747, 0.712433, 0.5294118, 0, 1, 1,
0.6895992, -1.21167, 2.591979, 0.5372549, 0, 1, 1,
0.6954547, 1.176408, -0.3802327, 0.5411765, 0, 1, 1,
0.7003598, -0.8254177, 1.699661, 0.5490196, 0, 1, 1,
0.7017334, -1.191057, 2.738587, 0.5529412, 0, 1, 1,
0.7060366, 0.9212807, 2.954156, 0.5607843, 0, 1, 1,
0.7068132, 0.381931, -0.3873535, 0.5647059, 0, 1, 1,
0.7084597, 0.5984775, 1.011959, 0.572549, 0, 1, 1,
0.7134082, -0.6646047, 2.825161, 0.5764706, 0, 1, 1,
0.7136696, 2.079197, 1.218951, 0.5843138, 0, 1, 1,
0.7153062, 1.30599, 0.1121227, 0.5882353, 0, 1, 1,
0.7175802, -0.4776359, 3.534136, 0.5960785, 0, 1, 1,
0.7194979, 2.005068, -0.4254388, 0.6039216, 0, 1, 1,
0.720432, -0.4293816, 4.72099, 0.6078432, 0, 1, 1,
0.7226697, -0.07501523, 0.7771348, 0.6156863, 0, 1, 1,
0.7230775, -0.2838272, 3.274973, 0.6196079, 0, 1, 1,
0.725186, 1.191746, 0.4191773, 0.627451, 0, 1, 1,
0.7253845, -0.4955871, 3.952355, 0.6313726, 0, 1, 1,
0.7289031, -2.093476, 3.20235, 0.6392157, 0, 1, 1,
0.7356358, 1.178888, 0.8859074, 0.6431373, 0, 1, 1,
0.737546, 0.4178215, 0.810416, 0.6509804, 0, 1, 1,
0.7457637, -1.713881, 3.028889, 0.654902, 0, 1, 1,
0.746108, -0.6276752, 3.672404, 0.6627451, 0, 1, 1,
0.7477518, 0.4999819, -0.1215405, 0.6666667, 0, 1, 1,
0.7499273, 0.4447, 1.786853, 0.6745098, 0, 1, 1,
0.7504783, 0.9217303, -0.2662997, 0.6784314, 0, 1, 1,
0.7559536, -0.6902738, 3.007845, 0.6862745, 0, 1, 1,
0.7561589, -0.8378597, 2.464586, 0.6901961, 0, 1, 1,
0.761, 0.4624824, 1.290672, 0.6980392, 0, 1, 1,
0.7631762, -0.5398934, 0.8395545, 0.7058824, 0, 1, 1,
0.769363, -1.366799, 1.665727, 0.7098039, 0, 1, 1,
0.7720153, -2.052756, 1.965017, 0.7176471, 0, 1, 1,
0.7764348, 1.15234, -0.02941814, 0.7215686, 0, 1, 1,
0.777546, 0.1397157, 1.580927, 0.7294118, 0, 1, 1,
0.7827044, -2.209423, 3.579142, 0.7333333, 0, 1, 1,
0.7849324, -0.1357838, 2.233723, 0.7411765, 0, 1, 1,
0.7888352, 0.8771186, -0.109005, 0.7450981, 0, 1, 1,
0.7909239, 0.8671059, -0.7901691, 0.7529412, 0, 1, 1,
0.7933114, -1.286874, 3.115937, 0.7568628, 0, 1, 1,
0.7962688, -0.2715849, 1.205235, 0.7647059, 0, 1, 1,
0.8003456, -1.067255, 2.27388, 0.7686275, 0, 1, 1,
0.8039257, 0.1229846, 2.123172, 0.7764706, 0, 1, 1,
0.8058412, -1.494276, 2.548816, 0.7803922, 0, 1, 1,
0.8064468, 0.7197179, 0.3506089, 0.7882353, 0, 1, 1,
0.8077928, -0.304719, 2.079353, 0.7921569, 0, 1, 1,
0.809336, 0.1114692, 2.458284, 0.8, 0, 1, 1,
0.8099846, -0.5762775, 3.145878, 0.8078431, 0, 1, 1,
0.8100967, 0.6146415, 3.263131, 0.8117647, 0, 1, 1,
0.8106686, -1.095586, 4.495127, 0.8196079, 0, 1, 1,
0.812375, -0.8352999, 3.837354, 0.8235294, 0, 1, 1,
0.8149199, -1.083299, 1.683451, 0.8313726, 0, 1, 1,
0.8201797, -0.004529413, 2.844672, 0.8352941, 0, 1, 1,
0.8236693, 0.6522325, 3.070289, 0.8431373, 0, 1, 1,
0.8238006, -1.46122, 4.882788, 0.8470588, 0, 1, 1,
0.8250431, -0.3099875, 2.45433, 0.854902, 0, 1, 1,
0.828114, -0.3958738, 3.158978, 0.8588235, 0, 1, 1,
0.830568, -0.7607918, 1.026548, 0.8666667, 0, 1, 1,
0.8385748, 2.422459, -0.4479172, 0.8705882, 0, 1, 1,
0.8385928, 0.2660857, 2.743643, 0.8784314, 0, 1, 1,
0.8410643, -1.085791, 3.580897, 0.8823529, 0, 1, 1,
0.846211, -1.171647, 2.732753, 0.8901961, 0, 1, 1,
0.8503528, -0.4580126, 2.640863, 0.8941177, 0, 1, 1,
0.8531361, -0.3816268, 1.05786, 0.9019608, 0, 1, 1,
0.8566304, -0.1215875, 1.788394, 0.9098039, 0, 1, 1,
0.8670837, 1.280088, 0.2527618, 0.9137255, 0, 1, 1,
0.8766273, -0.6446266, 1.571668, 0.9215686, 0, 1, 1,
0.8788041, 1.090106, -0.9468988, 0.9254902, 0, 1, 1,
0.8788545, -1.18526, 2.772366, 0.9333333, 0, 1, 1,
0.8804315, 0.1433455, 1.259341, 0.9372549, 0, 1, 1,
0.880904, -0.04131294, 1.666363, 0.945098, 0, 1, 1,
0.8844303, 0.02970971, 1.796475, 0.9490196, 0, 1, 1,
0.8863747, -1.203521, 3.754488, 0.9568627, 0, 1, 1,
0.8876364, 1.084407, -0.7058743, 0.9607843, 0, 1, 1,
0.8903809, -0.2283714, 2.080505, 0.9686275, 0, 1, 1,
0.8924642, 0.235303, 0.6733572, 0.972549, 0, 1, 1,
0.8929185, 0.4735079, -0.8034969, 0.9803922, 0, 1, 1,
0.8965443, -0.2116062, 1.37137, 0.9843137, 0, 1, 1,
0.9030234, -1.585559, 2.731848, 0.9921569, 0, 1, 1,
0.9053509, 0.9916545, 1.65618, 0.9960784, 0, 1, 1,
0.913359, 0.2217221, 3.051844, 1, 0, 0.9960784, 1,
0.9149809, -3.751353, 3.852527, 1, 0, 0.9882353, 1,
0.9150776, 0.6457976, -0.5466773, 1, 0, 0.9843137, 1,
0.9151087, -0.1253681, 3.216497, 1, 0, 0.9764706, 1,
0.9246275, -0.8435907, 0.3565995, 1, 0, 0.972549, 1,
0.9351349, 1.299785, 1.470494, 1, 0, 0.9647059, 1,
0.9362342, 0.7944772, 2.204801, 1, 0, 0.9607843, 1,
0.9377403, -0.3336626, 1.85089, 1, 0, 0.9529412, 1,
0.9381819, -0.6407396, 3.325772, 1, 0, 0.9490196, 1,
0.9385406, -1.351228, 3.82185, 1, 0, 0.9411765, 1,
0.9447821, 0.835008, 1.920585, 1, 0, 0.9372549, 1,
0.9534537, -1.724089, 3.52661, 1, 0, 0.9294118, 1,
0.9562832, 0.8293277, -0.03248869, 1, 0, 0.9254902, 1,
0.9638689, -0.9948904, 2.957704, 1, 0, 0.9176471, 1,
0.9651803, -0.5553123, 1.458303, 1, 0, 0.9137255, 1,
0.9725681, 0.8441088, 0.9435557, 1, 0, 0.9058824, 1,
0.9725975, -0.8300823, 1.531294, 1, 0, 0.9019608, 1,
0.9781562, -0.6739502, 1.15533, 1, 0, 0.8941177, 1,
0.9835913, -0.5576479, 1.470984, 1, 0, 0.8862745, 1,
0.9837251, 1.40708, 0.07909796, 1, 0, 0.8823529, 1,
0.9868498, -0.9770803, 3.542788, 1, 0, 0.8745098, 1,
0.9882353, 2.014328, -1.121578, 1, 0, 0.8705882, 1,
0.9891469, 0.2332151, 0.2352296, 1, 0, 0.8627451, 1,
0.9909998, -1.057082, 1.463621, 1, 0, 0.8588235, 1,
0.9927031, 1.541285, -0.7895606, 1, 0, 0.8509804, 1,
0.9962322, 0.8451941, -0.227339, 1, 0, 0.8470588, 1,
1.001572, -0.3090684, 0.2959256, 1, 0, 0.8392157, 1,
1.003995, 1.163124, 1.630919, 1, 0, 0.8352941, 1,
1.013254, -1.269582, 2.539066, 1, 0, 0.827451, 1,
1.01552, 0.8606031, -0.4674388, 1, 0, 0.8235294, 1,
1.022114, -1.366977, 2.048999, 1, 0, 0.8156863, 1,
1.027732, 0.1353693, 2.286679, 1, 0, 0.8117647, 1,
1.028707, 0.9611332, 0.3148209, 1, 0, 0.8039216, 1,
1.037754, -0.7088093, 1.087247, 1, 0, 0.7960784, 1,
1.04632, -0.185831, 0.1706302, 1, 0, 0.7921569, 1,
1.052664, 1.16972, -0.8009474, 1, 0, 0.7843137, 1,
1.060729, -0.9452277, 3.913793, 1, 0, 0.7803922, 1,
1.067441, -0.04101176, 0.9695017, 1, 0, 0.772549, 1,
1.067632, -0.04052691, -0.4061851, 1, 0, 0.7686275, 1,
1.071382, -0.09166274, 2.344832, 1, 0, 0.7607843, 1,
1.071633, 0.4562562, 1.37416, 1, 0, 0.7568628, 1,
1.082685, -0.8168957, 3.299583, 1, 0, 0.7490196, 1,
1.091313, 1.050572, 1.870136, 1, 0, 0.7450981, 1,
1.103684, 1.04172, 2.562667, 1, 0, 0.7372549, 1,
1.104205, 0.03361123, 2.895155, 1, 0, 0.7333333, 1,
1.12285, 1.229499, 1.237816, 1, 0, 0.7254902, 1,
1.12436, -0.368642, 3.16768, 1, 0, 0.7215686, 1,
1.125085, -0.02054493, 3.67979, 1, 0, 0.7137255, 1,
1.129128, -0.1312246, 0.732717, 1, 0, 0.7098039, 1,
1.136289, -0.9450548, 1.934645, 1, 0, 0.7019608, 1,
1.142467, 0.1860537, 2.618139, 1, 0, 0.6941177, 1,
1.15719, 0.4222592, 2.086358, 1, 0, 0.6901961, 1,
1.16741, 0.1030891, -0.548574, 1, 0, 0.682353, 1,
1.169656, 0.3852821, 1.236211, 1, 0, 0.6784314, 1,
1.169765, -0.7303417, 1.047207, 1, 0, 0.6705883, 1,
1.176434, 0.8375771, 1.975492, 1, 0, 0.6666667, 1,
1.178834, -0.6658742, 2.741738, 1, 0, 0.6588235, 1,
1.180549, 0.07465399, 2.784486, 1, 0, 0.654902, 1,
1.182669, 0.3340025, 2.761508, 1, 0, 0.6470588, 1,
1.183239, -1.616848, 2.119749, 1, 0, 0.6431373, 1,
1.197457, -0.1168079, 2.249958, 1, 0, 0.6352941, 1,
1.198313, 0.8199279, 1.693462, 1, 0, 0.6313726, 1,
1.208348, -0.3132526, 2.519295, 1, 0, 0.6235294, 1,
1.210417, -0.9118627, 3.547296, 1, 0, 0.6196079, 1,
1.210531, 0.9471146, 0.4140967, 1, 0, 0.6117647, 1,
1.214938, 0.02485215, 1.274844, 1, 0, 0.6078432, 1,
1.215588, -0.0005351743, 2.480333, 1, 0, 0.6, 1,
1.226336, 0.3172433, 2.165659, 1, 0, 0.5921569, 1,
1.235196, -2.31665, 2.095645, 1, 0, 0.5882353, 1,
1.235266, -0.2144591, 1.536639, 1, 0, 0.5803922, 1,
1.237278, 0.336889, 2.662674, 1, 0, 0.5764706, 1,
1.237509, -0.09106069, 1.519551, 1, 0, 0.5686275, 1,
1.23963, -0.5511665, 2.028742, 1, 0, 0.5647059, 1,
1.242697, 0.9958932, 1.470684, 1, 0, 0.5568628, 1,
1.243927, 0.9845369, 0.8273302, 1, 0, 0.5529412, 1,
1.244379, 0.2612981, 1.242573, 1, 0, 0.5450981, 1,
1.255026, -1.221994, 1.951915, 1, 0, 0.5411765, 1,
1.257233, -2.063059, 3.718155, 1, 0, 0.5333334, 1,
1.257864, 0.4426601, 0.7669442, 1, 0, 0.5294118, 1,
1.258221, 0.1870037, 1.828809, 1, 0, 0.5215687, 1,
1.2602, 0.8331795, -0.01068428, 1, 0, 0.5176471, 1,
1.260507, -3.215791, 4.343935, 1, 0, 0.509804, 1,
1.261876, -0.5877755, 2.107777, 1, 0, 0.5058824, 1,
1.268538, 1.298808, -0.5994552, 1, 0, 0.4980392, 1,
1.273021, -0.7342764, 2.437781, 1, 0, 0.4901961, 1,
1.275917, 0.2413807, -0.09970842, 1, 0, 0.4862745, 1,
1.284184, -0.005915597, 1.122993, 1, 0, 0.4784314, 1,
1.28872, -0.6572002, 0.1759474, 1, 0, 0.4745098, 1,
1.292145, 0.2944485, 1.159293, 1, 0, 0.4666667, 1,
1.295367, -0.3212245, 1.566575, 1, 0, 0.4627451, 1,
1.301802, -0.8362238, 3.573026, 1, 0, 0.454902, 1,
1.323812, 2.030529, 2.152297, 1, 0, 0.4509804, 1,
1.324859, 0.3040144, 0.09912256, 1, 0, 0.4431373, 1,
1.329602, 0.2123797, 2.273012, 1, 0, 0.4392157, 1,
1.334435, -1.930277, 3.390309, 1, 0, 0.4313726, 1,
1.381068, -1.376331, 2.219083, 1, 0, 0.427451, 1,
1.384394, -0.4489518, 1.599624, 1, 0, 0.4196078, 1,
1.387835, -0.008604651, 1.8114, 1, 0, 0.4156863, 1,
1.395355, -0.2704978, 2.293472, 1, 0, 0.4078431, 1,
1.398651, -2.041819, 3.997957, 1, 0, 0.4039216, 1,
1.40061, 0.1508075, 2.414142, 1, 0, 0.3960784, 1,
1.401718, -0.8360901, 1.623836, 1, 0, 0.3882353, 1,
1.405373, 1.390207, 0.01319894, 1, 0, 0.3843137, 1,
1.411629, -0.7338791, 1.394648, 1, 0, 0.3764706, 1,
1.421667, -0.6197446, 3.591913, 1, 0, 0.372549, 1,
1.424932, 0.005666246, 1.742049, 1, 0, 0.3647059, 1,
1.445806, -0.6096601, 1.814907, 1, 0, 0.3607843, 1,
1.483453, 0.5757589, 2.774343, 1, 0, 0.3529412, 1,
1.495677, 0.8961397, 0.8738744, 1, 0, 0.3490196, 1,
1.504342, 1.593888, 1.273185, 1, 0, 0.3411765, 1,
1.534312, -1.04126, 2.6282, 1, 0, 0.3372549, 1,
1.558646, -0.4622448, 1.100082, 1, 0, 0.3294118, 1,
1.587837, -0.1306606, 1.747091, 1, 0, 0.3254902, 1,
1.600527, 0.1987474, 3.356161, 1, 0, 0.3176471, 1,
1.603495, -0.3903991, 1.665088, 1, 0, 0.3137255, 1,
1.620682, 1.255329, 2.156301, 1, 0, 0.3058824, 1,
1.624427, 0.1697637, 0.8314459, 1, 0, 0.2980392, 1,
1.624745, -0.2129247, 0.8739645, 1, 0, 0.2941177, 1,
1.632314, 0.3815122, 0.2674344, 1, 0, 0.2862745, 1,
1.64021, -0.283323, 1.425653, 1, 0, 0.282353, 1,
1.65227, 0.7400271, 1.244416, 1, 0, 0.2745098, 1,
1.686739, -2.172793, 4.843652, 1, 0, 0.2705882, 1,
1.706895, 0.4196028, 1.790677, 1, 0, 0.2627451, 1,
1.718178, 0.7593737, 1.530828, 1, 0, 0.2588235, 1,
1.730497, -1.77912, 3.639879, 1, 0, 0.2509804, 1,
1.735926, 0.4847087, 1.112593, 1, 0, 0.2470588, 1,
1.739138, 0.2565005, 3.081642, 1, 0, 0.2392157, 1,
1.739959, -0.1554446, 1.942571, 1, 0, 0.2352941, 1,
1.740179, 0.8952416, 0.8682166, 1, 0, 0.227451, 1,
1.744348, 0.0240391, 1.987158, 1, 0, 0.2235294, 1,
1.753542, 0.7750316, 1.788497, 1, 0, 0.2156863, 1,
1.756998, 0.3571894, 1.224894, 1, 0, 0.2117647, 1,
1.764907, 0.5643709, 2.209839, 1, 0, 0.2039216, 1,
1.768603, -0.204192, 1.043103, 1, 0, 0.1960784, 1,
1.769867, 0.1324446, 1.232221, 1, 0, 0.1921569, 1,
1.804059, 0.1596001, 1.785699, 1, 0, 0.1843137, 1,
1.804945, -1.430514, 0.2175451, 1, 0, 0.1803922, 1,
1.808959, 0.2095589, 0.6396646, 1, 0, 0.172549, 1,
1.811454, -0.7791495, 1.40912, 1, 0, 0.1686275, 1,
1.851799, -0.5326443, 2.448441, 1, 0, 0.1607843, 1,
1.859272, 0.4717179, 0.6492076, 1, 0, 0.1568628, 1,
1.907594, 1.716763, -0.5343077, 1, 0, 0.1490196, 1,
1.919778, 0.9708723, 2.772155, 1, 0, 0.145098, 1,
1.939209, -1.33471, 2.387018, 1, 0, 0.1372549, 1,
1.949308, 2.301978, -0.6562329, 1, 0, 0.1333333, 1,
1.956522, -0.07199053, 1.727717, 1, 0, 0.1254902, 1,
1.997263, 1.250921, 0.07580712, 1, 0, 0.1215686, 1,
1.999336, 0.4336063, 1.235853, 1, 0, 0.1137255, 1,
2.017115, 1.28735, 0.8509158, 1, 0, 0.1098039, 1,
2.023977, -0.8093837, 2.128783, 1, 0, 0.1019608, 1,
2.051122, 0.301168, 1.752285, 1, 0, 0.09411765, 1,
2.053064, 1.377656, 1.623092, 1, 0, 0.09019608, 1,
2.055236, -0.842289, 1.155452, 1, 0, 0.08235294, 1,
2.140291, 0.5754129, 1.980827, 1, 0, 0.07843138, 1,
2.161685, 0.7909865, 3.202517, 1, 0, 0.07058824, 1,
2.17838, 1.592699, 1.576926, 1, 0, 0.06666667, 1,
2.180928, 0.07286063, 1.112241, 1, 0, 0.05882353, 1,
2.213883, 0.8759136, -1.067132, 1, 0, 0.05490196, 1,
2.252652, 0.483756, 2.566126, 1, 0, 0.04705882, 1,
2.315847, -1.461692, 1.048495, 1, 0, 0.04313726, 1,
2.409583, 0.0787982, 1.759326, 1, 0, 0.03529412, 1,
2.452866, 1.041345, -0.20005, 1, 0, 0.03137255, 1,
2.519427, -0.8254212, 1.576253, 1, 0, 0.02352941, 1,
2.597847, 0.7889271, -1.43065, 1, 0, 0.01960784, 1,
3.281217, 1.584713, 2.013466, 1, 0, 0.01176471, 1,
3.53557, -0.4303544, 2.074231, 1, 0, 0.007843138, 1
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
-0.0439328, -4.859652, -7.853845, 0, -0.5, 0.5, 0.5,
-0.0439328, -4.859652, -7.853845, 1, -0.5, 0.5, 0.5,
-0.0439328, -4.859652, -7.853845, 1, 1.5, 0.5, 0.5,
-0.0439328, -4.859652, -7.853845, 0, 1.5, 0.5, 0.5
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
-4.836887, -0.4820342, -7.853845, 0, -0.5, 0.5, 0.5,
-4.836887, -0.4820342, -7.853845, 1, -0.5, 0.5, 0.5,
-4.836887, -0.4820342, -7.853845, 1, 1.5, 0.5, 0.5,
-4.836887, -0.4820342, -7.853845, 0, 1.5, 0.5, 0.5
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
-4.836887, -4.859652, -0.190731, 0, -0.5, 0.5, 0.5,
-4.836887, -4.859652, -0.190731, 1, -0.5, 0.5, 0.5,
-4.836887, -4.859652, -0.190731, 1, 1.5, 0.5, 0.5,
-4.836887, -4.859652, -0.190731, 0, 1.5, 0.5, 0.5
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
-2, -3.849433, -6.085434,
2, -3.849433, -6.085434,
-2, -3.849433, -6.085434,
-2, -4.017803, -6.380169,
0, -3.849433, -6.085434,
0, -4.017803, -6.380169,
2, -3.849433, -6.085434,
2, -4.017803, -6.380169
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
-2, -4.354542, -6.96964, 0, -0.5, 0.5, 0.5,
-2, -4.354542, -6.96964, 1, -0.5, 0.5, 0.5,
-2, -4.354542, -6.96964, 1, 1.5, 0.5, 0.5,
-2, -4.354542, -6.96964, 0, 1.5, 0.5, 0.5,
0, -4.354542, -6.96964, 0, -0.5, 0.5, 0.5,
0, -4.354542, -6.96964, 1, -0.5, 0.5, 0.5,
0, -4.354542, -6.96964, 1, 1.5, 0.5, 0.5,
0, -4.354542, -6.96964, 0, 1.5, 0.5, 0.5,
2, -4.354542, -6.96964, 0, -0.5, 0.5, 0.5,
2, -4.354542, -6.96964, 1, -0.5, 0.5, 0.5,
2, -4.354542, -6.96964, 1, 1.5, 0.5, 0.5,
2, -4.354542, -6.96964, 0, 1.5, 0.5, 0.5
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
-3.730821, -3, -6.085434,
-3.730821, 2, -6.085434,
-3.730821, -3, -6.085434,
-3.915165, -3, -6.380169,
-3.730821, -2, -6.085434,
-3.915165, -2, -6.380169,
-3.730821, -1, -6.085434,
-3.915165, -1, -6.380169,
-3.730821, 0, -6.085434,
-3.915165, 0, -6.380169,
-3.730821, 1, -6.085434,
-3.915165, 1, -6.380169,
-3.730821, 2, -6.085434,
-3.915165, 2, -6.380169
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
"2"
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
-4.283854, -3, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, -3, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, -3, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, -3, -6.96964, 0, 1.5, 0.5, 0.5,
-4.283854, -2, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, -2, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, -2, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, -2, -6.96964, 0, 1.5, 0.5, 0.5,
-4.283854, -1, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, -1, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, -1, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, -1, -6.96964, 0, 1.5, 0.5, 0.5,
-4.283854, 0, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, 0, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, 0, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, 0, -6.96964, 0, 1.5, 0.5, 0.5,
-4.283854, 1, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, 1, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, 1, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, 1, -6.96964, 0, 1.5, 0.5, 0.5,
-4.283854, 2, -6.96964, 0, -0.5, 0.5, 0.5,
-4.283854, 2, -6.96964, 1, -0.5, 0.5, 0.5,
-4.283854, 2, -6.96964, 1, 1.5, 0.5, 0.5,
-4.283854, 2, -6.96964, 0, 1.5, 0.5, 0.5
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
-3.730821, -3.849433, -4,
-3.730821, -3.849433, 4,
-3.730821, -3.849433, -4,
-3.915165, -4.017803, -4,
-3.730821, -3.849433, -2,
-3.915165, -4.017803, -2,
-3.730821, -3.849433, 0,
-3.915165, -4.017803, 0,
-3.730821, -3.849433, 2,
-3.915165, -4.017803, 2,
-3.730821, -3.849433, 4,
-3.915165, -4.017803, 4
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
-4.283854, -4.354542, -4, 0, -0.5, 0.5, 0.5,
-4.283854, -4.354542, -4, 1, -0.5, 0.5, 0.5,
-4.283854, -4.354542, -4, 1, 1.5, 0.5, 0.5,
-4.283854, -4.354542, -4, 0, 1.5, 0.5, 0.5,
-4.283854, -4.354542, -2, 0, -0.5, 0.5, 0.5,
-4.283854, -4.354542, -2, 1, -0.5, 0.5, 0.5,
-4.283854, -4.354542, -2, 1, 1.5, 0.5, 0.5,
-4.283854, -4.354542, -2, 0, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 0, 0, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 0, 1, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 0, 1, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 0, 0, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 2, 0, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 2, 1, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 2, 1, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 2, 0, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 4, 0, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 4, 1, -0.5, 0.5, 0.5,
-4.283854, -4.354542, 4, 1, 1.5, 0.5, 0.5,
-4.283854, -4.354542, 4, 0, 1.5, 0.5, 0.5
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
-3.730821, -3.849433, -6.085434,
-3.730821, 2.885364, -6.085434,
-3.730821, -3.849433, 5.703972,
-3.730821, 2.885364, 5.703972,
-3.730821, -3.849433, -6.085434,
-3.730821, -3.849433, 5.703972,
-3.730821, 2.885364, -6.085434,
-3.730821, 2.885364, 5.703972,
-3.730821, -3.849433, -6.085434,
3.642956, -3.849433, -6.085434,
-3.730821, -3.849433, 5.703972,
3.642956, -3.849433, 5.703972,
-3.730821, 2.885364, -6.085434,
3.642956, 2.885364, -6.085434,
-3.730821, 2.885364, 5.703972,
3.642956, 2.885364, 5.703972,
3.642956, -3.849433, -6.085434,
3.642956, 2.885364, -6.085434,
3.642956, -3.849433, 5.703972,
3.642956, 2.885364, 5.703972,
3.642956, -3.849433, -6.085434,
3.642956, -3.849433, 5.703972,
3.642956, 2.885364, -6.085434,
3.642956, 2.885364, 5.703972
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
var radius = 8.250306;
var distance = 36.70654;
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
mvMatrix.translate( 0.0439328, 0.4820342, 0.190731 );
mvMatrix.scale( 1.209745, 1.324523, 0.7566447 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.70654);
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
O-ethyl_phenylphosph<-read.table("O-ethyl_phenylphosph.xyz")
```

```
## Error in read.table("O-ethyl_phenylphosph.xyz"): no lines available in input
```

```r
x<-O-ethyl_phenylphosph$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_phenylphosph$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_phenylphosph$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.623436, -0.7273208, -3.638877, 0, 0, 1, 1, 1,
-3.017918, -0.7485546, -1.761037, 1, 0, 0, 1, 1,
-2.688524, 1.703168, 0.02102277, 1, 0, 0, 1, 1,
-2.646428, 0.1873572, -2.872181, 1, 0, 0, 1, 1,
-2.578997, 0.6755927, -2.192413, 1, 0, 0, 1, 1,
-2.569184, 1.275, -1.830912, 1, 0, 0, 1, 1,
-2.556479, 0.6179942, -0.6040783, 0, 0, 0, 1, 1,
-2.533105, -1.714712, -2.85521, 0, 0, 0, 1, 1,
-2.531043, 0.2165917, -1.315506, 0, 0, 0, 1, 1,
-2.52995, 0.7940264, -0.7190784, 0, 0, 0, 1, 1,
-2.489411, -0.6777331, -1.659015, 0, 0, 0, 1, 1,
-2.411347, -0.6596847, -1.227396, 0, 0, 0, 1, 1,
-2.408865, 1.712809, -1.337948, 0, 0, 0, 1, 1,
-2.383162, -0.6391506, -2.221873, 1, 1, 1, 1, 1,
-2.371572, -0.5033528, -2.58227, 1, 1, 1, 1, 1,
-2.364652, -0.9990909, -2.25877, 1, 1, 1, 1, 1,
-2.359385, 0.2978581, -1.555841, 1, 1, 1, 1, 1,
-2.357509, -0.07940862, -2.881579, 1, 1, 1, 1, 1,
-2.326997, -0.5595651, -1.88852, 1, 1, 1, 1, 1,
-2.273279, -0.8569741, -0.6461021, 1, 1, 1, 1, 1,
-2.205933, 0.967077, -1.356339, 1, 1, 1, 1, 1,
-2.193315, -0.1656943, -1.740372, 1, 1, 1, 1, 1,
-2.168106, -0.7991015, -1.522492, 1, 1, 1, 1, 1,
-2.160792, -0.5135478, -0.5146846, 1, 1, 1, 1, 1,
-2.150622, 0.4870474, -0.5978063, 1, 1, 1, 1, 1,
-2.130044, -1.864769, -3.502785, 1, 1, 1, 1, 1,
-2.098458, 1.363275, -0.1690877, 1, 1, 1, 1, 1,
-2.02067, -0.02741445, -1.052616, 1, 1, 1, 1, 1,
-1.991606, 0.05705984, -2.24205, 0, 0, 1, 1, 1,
-1.982432, -1.171205, -0.2898515, 1, 0, 0, 1, 1,
-1.937016, 0.2077435, -0.2938927, 1, 0, 0, 1, 1,
-1.892121, -1.674237, -2.389207, 1, 0, 0, 1, 1,
-1.872442, -1.924742, -2.896706, 1, 0, 0, 1, 1,
-1.868261, -0.1990714, -3.247187, 1, 0, 0, 1, 1,
-1.844359, -0.1803697, -0.7230498, 0, 0, 0, 1, 1,
-1.826851, -0.9236814, -1.737782, 0, 0, 0, 1, 1,
-1.819156, 0.2426171, 0.1630426, 0, 0, 0, 1, 1,
-1.815427, -0.7649208, -2.761394, 0, 0, 0, 1, 1,
-1.804142, -0.5502835, -0.8631772, 0, 0, 0, 1, 1,
-1.793924, -1.113584, -2.641177, 0, 0, 0, 1, 1,
-1.791411, 0.06073855, -1.951604, 0, 0, 0, 1, 1,
-1.790014, 0.2544972, -0.8780109, 1, 1, 1, 1, 1,
-1.788773, -1.569807, -3.383886, 1, 1, 1, 1, 1,
-1.774119, 1.714467, -0.07484994, 1, 1, 1, 1, 1,
-1.77303, 2.016418, -0.6591706, 1, 1, 1, 1, 1,
-1.768082, 0.05643037, -3.224658, 1, 1, 1, 1, 1,
-1.767524, 0.7216747, -0.05184909, 1, 1, 1, 1, 1,
-1.765859, -0.274911, -2.432688, 1, 1, 1, 1, 1,
-1.758113, -0.2058129, -1.29674, 1, 1, 1, 1, 1,
-1.744185, 0.4074592, -3.818089, 1, 1, 1, 1, 1,
-1.735381, -1.284716, -2.322258, 1, 1, 1, 1, 1,
-1.732411, -0.2088546, -1.83048, 1, 1, 1, 1, 1,
-1.730778, -0.9217892, -2.381743, 1, 1, 1, 1, 1,
-1.718828, -0.3120265, -2.097574, 1, 1, 1, 1, 1,
-1.697534, 1.842986, 0.2443698, 1, 1, 1, 1, 1,
-1.680737, 1.772679, 1.13757, 1, 1, 1, 1, 1,
-1.647791, 0.297799, -3.127795, 0, 0, 1, 1, 1,
-1.609665, 2.419081, -0.1863655, 1, 0, 0, 1, 1,
-1.605063, 1.187628, -1.60933, 1, 0, 0, 1, 1,
-1.595664, 1.921452, -0.1167755, 1, 0, 0, 1, 1,
-1.584346, 0.3245821, -1.053865, 1, 0, 0, 1, 1,
-1.580423, -0.02825207, -1.41854, 1, 0, 0, 1, 1,
-1.576781, 0.7811609, -0.5870894, 0, 0, 0, 1, 1,
-1.570829, -0.1605513, 0.08260424, 0, 0, 0, 1, 1,
-1.555057, 1.509152, 1.37466, 0, 0, 0, 1, 1,
-1.547094, -0.7912183, -4.414544, 0, 0, 0, 1, 1,
-1.538595, -0.6449671, -4.001748, 0, 0, 0, 1, 1,
-1.518302, 0.4436825, -1.426877, 0, 0, 0, 1, 1,
-1.517414, 0.8262342, -0.4019431, 0, 0, 0, 1, 1,
-1.501893, 1.021487, -0.6509887, 1, 1, 1, 1, 1,
-1.489562, 1.641586, 0.3889396, 1, 1, 1, 1, 1,
-1.476571, 1.104919, -0.7191269, 1, 1, 1, 1, 1,
-1.471657, -0.06749939, -2.156003, 1, 1, 1, 1, 1,
-1.463795, 0.8786699, -2.640134, 1, 1, 1, 1, 1,
-1.44843, 0.7528008, -1.19886, 1, 1, 1, 1, 1,
-1.436988, 1.102372, -1.300205, 1, 1, 1, 1, 1,
-1.430961, -1.864429, -2.445619, 1, 1, 1, 1, 1,
-1.426725, 0.4873416, -1.71005, 1, 1, 1, 1, 1,
-1.425857, -0.03243691, -1.101225, 1, 1, 1, 1, 1,
-1.415597, 1.223871, -0.3032674, 1, 1, 1, 1, 1,
-1.41515, 0.3468837, -1.591238, 1, 1, 1, 1, 1,
-1.398497, 0.4252493, -2.021086, 1, 1, 1, 1, 1,
-1.381875, 1.143547, -1.214938, 1, 1, 1, 1, 1,
-1.371663, 0.0596595, -1.329644, 1, 1, 1, 1, 1,
-1.370823, 0.01289636, -1.927627, 0, 0, 1, 1, 1,
-1.370777, -1.481224, -1.849191, 1, 0, 0, 1, 1,
-1.37003, -0.87514, -1.623674, 1, 0, 0, 1, 1,
-1.368135, -0.6767008, -2.716055, 1, 0, 0, 1, 1,
-1.353361, -0.3155463, -2.785891, 1, 0, 0, 1, 1,
-1.351872, 0.1419917, -2.753129, 1, 0, 0, 1, 1,
-1.340407, -2.005911, -2.926247, 0, 0, 0, 1, 1,
-1.339098, 0.6624388, -0.7584795, 0, 0, 0, 1, 1,
-1.336162, 0.9724637, 1.125268, 0, 0, 0, 1, 1,
-1.326038, 0.5185644, 1.882021, 0, 0, 0, 1, 1,
-1.321201, -0.3732701, -3.600769, 0, 0, 0, 1, 1,
-1.312134, 0.09772441, -0.8961751, 0, 0, 0, 1, 1,
-1.305179, -0.1632203, -3.932992, 0, 0, 0, 1, 1,
-1.30035, -0.582166, -0.6376039, 1, 1, 1, 1, 1,
-1.288294, 0.2433946, -1.836045, 1, 1, 1, 1, 1,
-1.284802, -0.8765009, -0.7814396, 1, 1, 1, 1, 1,
-1.272554, 1.911949, 0.7340424, 1, 1, 1, 1, 1,
-1.264068, -0.7551941, -1.030413, 1, 1, 1, 1, 1,
-1.263016, -0.3366277, -2.269322, 1, 1, 1, 1, 1,
-1.254482, 0.8498486, -0.927708, 1, 1, 1, 1, 1,
-1.244826, -0.221506, -0.09733332, 1, 1, 1, 1, 1,
-1.242635, -0.6374362, -3.539152, 1, 1, 1, 1, 1,
-1.242455, -0.1110502, -0.9216177, 1, 1, 1, 1, 1,
-1.230957, -0.1991266, -3.772717, 1, 1, 1, 1, 1,
-1.224347, -0.7412466, -3.006068, 1, 1, 1, 1, 1,
-1.222704, 0.6247325, -2.700763, 1, 1, 1, 1, 1,
-1.22047, -0.6543726, -2.180804, 1, 1, 1, 1, 1,
-1.214138, 0.1104153, -1.220397, 1, 1, 1, 1, 1,
-1.210662, 1.772194, -0.5667385, 0, 0, 1, 1, 1,
-1.190161, -0.0971459, -2.745885, 1, 0, 0, 1, 1,
-1.180318, -0.6211034, -1.706712, 1, 0, 0, 1, 1,
-1.177837, 0.4808834, -2.601962, 1, 0, 0, 1, 1,
-1.174885, 0.519936, -2.094126, 1, 0, 0, 1, 1,
-1.17462, 1.183664, -0.7151572, 1, 0, 0, 1, 1,
-1.17315, 1.306014, 0.3924292, 0, 0, 0, 1, 1,
-1.173012, 0.5505878, -0.1640401, 0, 0, 0, 1, 1,
-1.1718, 0.4998626, -1.523294, 0, 0, 0, 1, 1,
-1.15795, -0.03075988, -3.322985, 0, 0, 0, 1, 1,
-1.155529, -1.415121, -2.239685, 0, 0, 0, 1, 1,
-1.149094, 0.4290848, -1.951214, 0, 0, 0, 1, 1,
-1.147443, -0.6821729, -1.294775, 0, 0, 0, 1, 1,
-1.141703, -1.45314, -3.585424, 1, 1, 1, 1, 1,
-1.139777, 0.7879135, 0.1097943, 1, 1, 1, 1, 1,
-1.136804, -0.2940168, -0.994782, 1, 1, 1, 1, 1,
-1.132746, -0.3282157, -0.9689541, 1, 1, 1, 1, 1,
-1.128743, -0.748304, -2.374007, 1, 1, 1, 1, 1,
-1.127484, 0.7476268, -1.672282, 1, 1, 1, 1, 1,
-1.117628, -0.06967594, -2.405709, 1, 1, 1, 1, 1,
-1.117399, 0.2159908, -1.642774, 1, 1, 1, 1, 1,
-1.115223, 0.4454521, -1.675664, 1, 1, 1, 1, 1,
-1.113476, -1.616812, -1.760851, 1, 1, 1, 1, 1,
-1.106904, 0.02245521, -0.7696275, 1, 1, 1, 1, 1,
-1.103137, 0.6338516, -1.506046, 1, 1, 1, 1, 1,
-1.099453, -0.2137794, -1.406821, 1, 1, 1, 1, 1,
-1.098178, 0.3048627, -1.479365, 1, 1, 1, 1, 1,
-1.083935, 1.28036, -1.969041, 1, 1, 1, 1, 1,
-1.081014, -0.0661079, -0.8573878, 0, 0, 1, 1, 1,
-1.064043, 0.886822, 0.1211046, 1, 0, 0, 1, 1,
-1.055093, -0.6202809, -1.308178, 1, 0, 0, 1, 1,
-1.050614, -0.01528526, -0.8917537, 1, 0, 0, 1, 1,
-1.048627, 1.161495, 0.6377533, 1, 0, 0, 1, 1,
-1.047823, -0.866953, -3.130313, 1, 0, 0, 1, 1,
-1.044724, -0.8796777, -2.234491, 0, 0, 0, 1, 1,
-1.039582, 0.401909, -1.379288, 0, 0, 0, 1, 1,
-1.020698, -0.1933156, -1.818774, 0, 0, 0, 1, 1,
-1.01867, 0.9868647, 0.1089278, 0, 0, 0, 1, 1,
-1.011601, -0.5117365, -2.316093, 0, 0, 0, 1, 1,
-1.003477, -0.6641549, -2.863047, 0, 0, 0, 1, 1,
-0.9835918, -0.9401179, -1.231505, 0, 0, 0, 1, 1,
-0.9826793, -0.4641179, -2.356418, 1, 1, 1, 1, 1,
-0.9822424, 1.974096, -0.5219114, 1, 1, 1, 1, 1,
-0.9801842, 1.639341, 0.4409625, 1, 1, 1, 1, 1,
-0.9779758, -0.09804286, -1.106606, 1, 1, 1, 1, 1,
-0.9718156, 1.119714, 0.6091722, 1, 1, 1, 1, 1,
-0.971065, -0.2199246, -2.259403, 1, 1, 1, 1, 1,
-0.970255, -0.9742815, -4.554798, 1, 1, 1, 1, 1,
-0.9683303, -0.5949981, -2.785159, 1, 1, 1, 1, 1,
-0.9593318, 0.2684321, -1.769639, 1, 1, 1, 1, 1,
-0.9561578, 0.5320877, -1.934822, 1, 1, 1, 1, 1,
-0.9537902, -0.357892, -1.016591, 1, 1, 1, 1, 1,
-0.9495195, -0.04229365, -0.6704333, 1, 1, 1, 1, 1,
-0.9386971, -0.5584745, -3.550144, 1, 1, 1, 1, 1,
-0.9328968, 0.1972957, -2.739177, 1, 1, 1, 1, 1,
-0.9312598, -0.4490409, -3.144005, 1, 1, 1, 1, 1,
-0.9283698, -0.2054952, -2.65462, 0, 0, 1, 1, 1,
-0.9246181, 1.32691, -1.093443, 1, 0, 0, 1, 1,
-0.9176535, 0.6108571, 0.1818777, 1, 0, 0, 1, 1,
-0.9156713, 1.410616, -1.463566, 1, 0, 0, 1, 1,
-0.9097736, -0.04973945, -0.5410193, 1, 0, 0, 1, 1,
-0.9028347, -1.821416, -1.444185, 1, 0, 0, 1, 1,
-0.8981012, -0.5498585, -1.487106, 0, 0, 0, 1, 1,
-0.8979647, 1.524409, -0.8655201, 0, 0, 0, 1, 1,
-0.8963233, 2.21622, 0.3156996, 0, 0, 0, 1, 1,
-0.8950569, 1.195018, -0.3471167, 0, 0, 0, 1, 1,
-0.8913299, 1.525461, 0.1557998, 0, 0, 0, 1, 1,
-0.8910807, 0.5194605, -0.5097188, 0, 0, 0, 1, 1,
-0.8858896, -1.481119, -2.015844, 0, 0, 0, 1, 1,
-0.8857944, -0.3146089, -2.562993, 1, 1, 1, 1, 1,
-0.885528, 0.2306753, -2.528824, 1, 1, 1, 1, 1,
-0.8783347, 1.290508, 0.9212649, 1, 1, 1, 1, 1,
-0.8636041, -0.6556177, -1.642666, 1, 1, 1, 1, 1,
-0.8591921, -0.5323555, -1.498904, 1, 1, 1, 1, 1,
-0.8568243, -0.4509918, -0.2779928, 1, 1, 1, 1, 1,
-0.8431867, 2.261504, -3.087479, 1, 1, 1, 1, 1,
-0.8375741, -0.6364501, -2.598962, 1, 1, 1, 1, 1,
-0.8352737, 0.6297461, -1.602539, 1, 1, 1, 1, 1,
-0.8319127, 0.3630238, -2.971655, 1, 1, 1, 1, 1,
-0.8311014, 0.7057135, -0.784938, 1, 1, 1, 1, 1,
-0.8242761, -0.1184345, -2.675712, 1, 1, 1, 1, 1,
-0.8239456, -0.4046753, -1.987332, 1, 1, 1, 1, 1,
-0.8148701, -0.7652403, -4.566758, 1, 1, 1, 1, 1,
-0.8131828, -0.358611, -1.513834, 1, 1, 1, 1, 1,
-0.8125321, 0.3012362, -2.690114, 0, 0, 1, 1, 1,
-0.8118644, -0.858071, -2.857867, 1, 0, 0, 1, 1,
-0.8105871, 1.128688, -0.6094173, 1, 0, 0, 1, 1,
-0.809916, 1.3456, -2.21875, 1, 0, 0, 1, 1,
-0.807469, -0.08353092, -0.3204869, 1, 0, 0, 1, 1,
-0.8073452, -0.3744124, -1.292409, 1, 0, 0, 1, 1,
-0.8069708, -0.1406374, -2.251005, 0, 0, 0, 1, 1,
-0.804193, 1.083048, -1.20566, 0, 0, 0, 1, 1,
-0.8032622, 0.355417, -0.1366793, 0, 0, 0, 1, 1,
-0.8027389, 0.2961977, -1.053068, 0, 0, 0, 1, 1,
-0.8022074, 0.5414212, -1.261106, 0, 0, 0, 1, 1,
-0.8018323, -0.7551454, -2.096318, 0, 0, 0, 1, 1,
-0.801703, -0.2804554, -1.427353, 0, 0, 0, 1, 1,
-0.796822, -0.2874736, -1.337344, 1, 1, 1, 1, 1,
-0.7937472, 0.9063115, -0.9302148, 1, 1, 1, 1, 1,
-0.79277, 0.2498844, -0.5682061, 1, 1, 1, 1, 1,
-0.7870998, 0.1153794, -0.9650521, 1, 1, 1, 1, 1,
-0.7838168, -1.091558, -2.491651, 1, 1, 1, 1, 1,
-0.7835039, -2.558731, -5.407283, 1, 1, 1, 1, 1,
-0.780637, -1.074585, -1.307115, 1, 1, 1, 1, 1,
-0.7751427, 2.124591, -0.9522777, 1, 1, 1, 1, 1,
-0.7749236, 0.3950368, 0.1721862, 1, 1, 1, 1, 1,
-0.7741253, 0.8041317, -0.7985124, 1, 1, 1, 1, 1,
-0.7718364, 1.209792, -0.9332718, 1, 1, 1, 1, 1,
-0.7651167, -0.7958906, -4.263481, 1, 1, 1, 1, 1,
-0.7612813, 1.992494, 0.6914466, 1, 1, 1, 1, 1,
-0.760973, 0.8798078, -0.8253243, 1, 1, 1, 1, 1,
-0.7570398, 0.6368672, 0.07901045, 1, 1, 1, 1, 1,
-0.7567516, 0.855349, -0.6410285, 0, 0, 1, 1, 1,
-0.7538358, 0.9267786, -3.421486, 1, 0, 0, 1, 1,
-0.750761, -0.9701297, -1.496014, 1, 0, 0, 1, 1,
-0.7496921, 1.958652, -1.396162, 1, 0, 0, 1, 1,
-0.749559, 1.574484, -2.139266, 1, 0, 0, 1, 1,
-0.7494689, -0.06469787, -1.900373, 1, 0, 0, 1, 1,
-0.7473882, 1.093609, -1.360601, 0, 0, 0, 1, 1,
-0.7455462, 0.07929716, -2.561316, 0, 0, 0, 1, 1,
-0.7408639, -1.067055, -3.634502, 0, 0, 0, 1, 1,
-0.740738, -2.415058, -2.525187, 0, 0, 0, 1, 1,
-0.7399784, -0.5835721, -0.02391948, 0, 0, 0, 1, 1,
-0.7378038, 0.9069207, -0.5106236, 0, 0, 0, 1, 1,
-0.7348675, 0.8101256, -1.714877, 0, 0, 0, 1, 1,
-0.7334216, -0.7737808, -1.93134, 1, 1, 1, 1, 1,
-0.7286917, 0.0469683, -3.863741, 1, 1, 1, 1, 1,
-0.7149347, -0.4283021, -1.967537, 1, 1, 1, 1, 1,
-0.709121, -0.4208301, -1.89481, 1, 1, 1, 1, 1,
-0.7072911, 0.157969, -1.054154, 1, 1, 1, 1, 1,
-0.705772, 1.234229, -1.213449, 1, 1, 1, 1, 1,
-0.7047421, -0.3287597, -1.932196, 1, 1, 1, 1, 1,
-0.703806, 2.472767, -0.4915251, 1, 1, 1, 1, 1,
-0.6968399, 1.988821, 0.1637581, 1, 1, 1, 1, 1,
-0.6968084, 0.681911, -1.12014, 1, 1, 1, 1, 1,
-0.6931665, -1.930271, -0.993041, 1, 1, 1, 1, 1,
-0.6866236, 0.05608549, -1.120327, 1, 1, 1, 1, 1,
-0.6861994, 0.2363556, -0.9089993, 1, 1, 1, 1, 1,
-0.6845325, 0.375394, -1.00654, 1, 1, 1, 1, 1,
-0.6780112, 0.04061912, -1.754712, 1, 1, 1, 1, 1,
-0.6779175, 0.1459455, -1.727548, 0, 0, 1, 1, 1,
-0.6754811, -0.7829325, -2.251421, 1, 0, 0, 1, 1,
-0.6612571, 1.42802, -0.1104111, 1, 0, 0, 1, 1,
-0.6603003, -0.2408258, -1.577148, 1, 0, 0, 1, 1,
-0.6577534, -0.4163473, -0.644908, 1, 0, 0, 1, 1,
-0.6553056, -0.2612121, -2.759536, 1, 0, 0, 1, 1,
-0.6471632, -0.6432984, -4.539168, 0, 0, 0, 1, 1,
-0.6360502, 0.07432099, -3.135454, 0, 0, 0, 1, 1,
-0.636046, -0.1836326, -1.252192, 0, 0, 0, 1, 1,
-0.6351748, 0.5940038, -0.420441, 0, 0, 0, 1, 1,
-0.6291586, 0.5044246, -2.762518, 0, 0, 0, 1, 1,
-0.6277812, -1.294437, -2.78509, 0, 0, 0, 1, 1,
-0.6188728, -0.904714, -3.429849, 0, 0, 0, 1, 1,
-0.612533, 1.283338, -0.4641589, 1, 1, 1, 1, 1,
-0.6113405, -0.2130427, -1.427223, 1, 1, 1, 1, 1,
-0.6102225, -0.3656854, -2.069452, 1, 1, 1, 1, 1,
-0.6082281, 0.5313647, -1.720368, 1, 1, 1, 1, 1,
-0.6050916, -0.2398461, -3.762074, 1, 1, 1, 1, 1,
-0.6035164, -0.5362505, -2.220654, 1, 1, 1, 1, 1,
-0.6022238, -0.5045433, -2.648331, 1, 1, 1, 1, 1,
-0.5952703, 0.6176553, -1.026544, 1, 1, 1, 1, 1,
-0.5847056, 0.821321, -1.203504, 1, 1, 1, 1, 1,
-0.5841293, 0.2138629, -3.640798, 1, 1, 1, 1, 1,
-0.5821204, -0.009734628, -2.442999, 1, 1, 1, 1, 1,
-0.5795196, 0.4642788, -0.2254408, 1, 1, 1, 1, 1,
-0.5728745, 0.8871689, -2.369994, 1, 1, 1, 1, 1,
-0.5679427, -1.98452, -4.139704, 1, 1, 1, 1, 1,
-0.567843, -0.0584374, -1.53226, 1, 1, 1, 1, 1,
-0.5632938, -1.855002, -2.060345, 0, 0, 1, 1, 1,
-0.5574586, -2.404036, -3.291875, 1, 0, 0, 1, 1,
-0.5514677, -0.5399491, -5.107538, 1, 0, 0, 1, 1,
-0.5459605, -0.8239077, -4.781777, 1, 0, 0, 1, 1,
-0.5456941, -0.1438882, -2.118503, 1, 0, 0, 1, 1,
-0.5426903, -0.4346839, -0.7482169, 1, 0, 0, 1, 1,
-0.5426288, 0.8735802, -1.763348, 0, 0, 0, 1, 1,
-0.5413951, -0.4657706, -1.193582, 0, 0, 0, 1, 1,
-0.5412778, -0.2574143, -1.652356, 0, 0, 0, 1, 1,
-0.5382807, -1.211912, -4.061435, 0, 0, 0, 1, 1,
-0.5370442, 0.3239852, -0.3132268, 0, 0, 0, 1, 1,
-0.5349539, 1.475464, 2.086506, 0, 0, 0, 1, 1,
-0.5298296, 0.5230894, -1.515038, 0, 0, 0, 1, 1,
-0.5287272, 0.1610739, -1.151296, 1, 1, 1, 1, 1,
-0.5190145, -0.01279162, -0.5446304, 1, 1, 1, 1, 1,
-0.5127373, -0.7596123, -2.666888, 1, 1, 1, 1, 1,
-0.5115908, -0.6998183, -1.630711, 1, 1, 1, 1, 1,
-0.5065638, 1.11865, -1.610116, 1, 1, 1, 1, 1,
-0.5059067, 0.3326631, -1.83892, 1, 1, 1, 1, 1,
-0.5046199, 0.8098601, -0.2207367, 1, 1, 1, 1, 1,
-0.5042713, 1.834451, -0.09075083, 1, 1, 1, 1, 1,
-0.502565, 0.2402604, -2.787525, 1, 1, 1, 1, 1,
-0.5023221, 0.7276371, -0.9345827, 1, 1, 1, 1, 1,
-0.5007612, -0.09653959, -2.481833, 1, 1, 1, 1, 1,
-0.4957072, -1.911855, -1.866983, 1, 1, 1, 1, 1,
-0.4932732, -0.3987658, -3.675888, 1, 1, 1, 1, 1,
-0.4929537, 0.06647132, -0.9407807, 1, 1, 1, 1, 1,
-0.491396, 0.4854507, 2.083679, 1, 1, 1, 1, 1,
-0.4868939, 1.217635, 0.1156291, 0, 0, 1, 1, 1,
-0.4835444, 0.4282887, 0.2055768, 1, 0, 0, 1, 1,
-0.480272, -0.1164079, -0.9182956, 1, 0, 0, 1, 1,
-0.4774824, -0.8499206, -3.467648, 1, 0, 0, 1, 1,
-0.4769414, -1.177692, -3.324311, 1, 0, 0, 1, 1,
-0.4744932, 0.3331742, -0.4924486, 1, 0, 0, 1, 1,
-0.4742914, -1.61331, -2.757918, 0, 0, 0, 1, 1,
-0.4740553, -0.3490522, -1.467795, 0, 0, 0, 1, 1,
-0.4692486, 0.1401247, -2.092272, 0, 0, 0, 1, 1,
-0.4680697, 0.7204397, 0.07156941, 0, 0, 0, 1, 1,
-0.4678216, 0.9209688, -0.6500473, 0, 0, 0, 1, 1,
-0.4670685, 0.06751788, -1.050318, 0, 0, 0, 1, 1,
-0.460041, -0.6137203, 0.0117563, 0, 0, 0, 1, 1,
-0.4579733, 0.3064277, -0.4473529, 1, 1, 1, 1, 1,
-0.4545662, 2.787285, -0.2825806, 1, 1, 1, 1, 1,
-0.4542101, -2.136165, -2.401318, 1, 1, 1, 1, 1,
-0.4538077, 0.5879747, -0.3236813, 1, 1, 1, 1, 1,
-0.4518194, -0.05150522, -2.950023, 1, 1, 1, 1, 1,
-0.4457528, -1.593675, -1.88378, 1, 1, 1, 1, 1,
-0.441395, 0.211173, -1.026489, 1, 1, 1, 1, 1,
-0.4409715, 0.6880354, 0.5925725, 1, 1, 1, 1, 1,
-0.4397062, -1.287284, -2.617296, 1, 1, 1, 1, 1,
-0.4344795, -1.43712, -3.80905, 1, 1, 1, 1, 1,
-0.4306676, -0.6146643, -4.202094, 1, 1, 1, 1, 1,
-0.4300378, 0.8116324, -1.949225, 1, 1, 1, 1, 1,
-0.4291115, 1.678945, -0.1389826, 1, 1, 1, 1, 1,
-0.4281314, -0.5268214, -2.714111, 1, 1, 1, 1, 1,
-0.4260246, 1.991975, -0.6457773, 1, 1, 1, 1, 1,
-0.4230794, 2.141672, -0.009165589, 0, 0, 1, 1, 1,
-0.4223301, -0.6016869, -2.871084, 1, 0, 0, 1, 1,
-0.4222635, 0.1676331, -0.5465437, 1, 0, 0, 1, 1,
-0.4188706, 0.9739367, -1.671765, 1, 0, 0, 1, 1,
-0.4172056, 0.3205864, -0.6289044, 1, 0, 0, 1, 1,
-0.4117838, -0.6608403, -2.431642, 1, 0, 0, 1, 1,
-0.4097403, 0.2234267, -0.9328846, 0, 0, 0, 1, 1,
-0.4056472, -0.008971121, -1.344698, 0, 0, 0, 1, 1,
-0.4018193, -1.406897, -3.957851, 0, 0, 0, 1, 1,
-0.3985351, -0.5465745, -2.763304, 0, 0, 0, 1, 1,
-0.396921, -0.8419366, -3.061277, 0, 0, 0, 1, 1,
-0.3900395, -0.9974787, -2.569694, 0, 0, 0, 1, 1,
-0.3846602, -1.250402, -3.046447, 0, 0, 0, 1, 1,
-0.3814956, 0.3830853, -0.6514188, 1, 1, 1, 1, 1,
-0.3774096, 1.148009, -0.2180061, 1, 1, 1, 1, 1,
-0.377269, 0.2223431, -2.507364, 1, 1, 1, 1, 1,
-0.3760741, 0.4740492, -1.455133, 1, 1, 1, 1, 1,
-0.3723643, -1.859369, -4.606511, 1, 1, 1, 1, 1,
-0.371864, -1.888552, -2.993042, 1, 1, 1, 1, 1,
-0.3708318, 0.1686564, -1.032865, 1, 1, 1, 1, 1,
-0.3700409, -1.022798, -3.307024, 1, 1, 1, 1, 1,
-0.3695307, -1.478138, -1.636794, 1, 1, 1, 1, 1,
-0.3659684, -0.7323192, -4.247534, 1, 1, 1, 1, 1,
-0.3656144, 0.2032288, -0.9199702, 1, 1, 1, 1, 1,
-0.3643272, 0.5241426, 0.1474743, 1, 1, 1, 1, 1,
-0.3638086, 0.06659032, -1.381274, 1, 1, 1, 1, 1,
-0.3492789, -0.6892091, -3.193928, 1, 1, 1, 1, 1,
-0.3481269, 0.6363472, -1.176045, 1, 1, 1, 1, 1,
-0.3476509, -0.2513312, -1.540841, 0, 0, 1, 1, 1,
-0.3439377, -0.1838795, -3.782596, 1, 0, 0, 1, 1,
-0.3418005, -1.097544, -3.524133, 1, 0, 0, 1, 1,
-0.3406305, -2.407194, -3.771022, 1, 0, 0, 1, 1,
-0.3383735, 1.387808, -0.9658204, 1, 0, 0, 1, 1,
-0.3382508, 1.02506, 0.2023076, 1, 0, 0, 1, 1,
-0.3367446, 0.7847816, 2.250515, 0, 0, 0, 1, 1,
-0.3275769, -0.9453494, -3.379141, 0, 0, 0, 1, 1,
-0.3271464, 0.7061754, -0.7090414, 0, 0, 0, 1, 1,
-0.3270115, -0.07312249, -0.5324934, 0, 0, 0, 1, 1,
-0.3257618, -0.5668662, -4.075844, 0, 0, 0, 1, 1,
-0.3247658, 0.09954974, -1.288017, 0, 0, 0, 1, 1,
-0.323242, -0.5455726, -2.876517, 0, 0, 0, 1, 1,
-0.321835, -0.285338, -2.807303, 1, 1, 1, 1, 1,
-0.3191766, 1.644158, -0.1147027, 1, 1, 1, 1, 1,
-0.3174178, 0.3936392, -0.2360197, 1, 1, 1, 1, 1,
-0.3169862, 0.6800171, -0.6986116, 1, 1, 1, 1, 1,
-0.3164884, 0.4703333, -0.9961918, 1, 1, 1, 1, 1,
-0.3108759, 1.696155, 0.03066519, 1, 1, 1, 1, 1,
-0.3085197, 0.257185, -0.1956401, 1, 1, 1, 1, 1,
-0.3077814, 1.056135, -1.478232, 1, 1, 1, 1, 1,
-0.3001263, 1.033075, -3.472925, 1, 1, 1, 1, 1,
-0.2988855, 0.3953527, -0.590334, 1, 1, 1, 1, 1,
-0.2986268, 0.06283758, -1.914596, 1, 1, 1, 1, 1,
-0.298614, -0.636723, -1.532137, 1, 1, 1, 1, 1,
-0.2956515, 1.53486, -1.539768, 1, 1, 1, 1, 1,
-0.2949284, 0.7427757, -0.2811094, 1, 1, 1, 1, 1,
-0.290368, -0.1409092, -3.064715, 1, 1, 1, 1, 1,
-0.2874385, 0.3995622, 0.4406062, 0, 0, 1, 1, 1,
-0.2850308, -0.4257265, -2.132714, 1, 0, 0, 1, 1,
-0.2812595, -0.2006701, -1.54451, 1, 0, 0, 1, 1,
-0.2811452, 0.6295339, -1.451415, 1, 0, 0, 1, 1,
-0.2803462, -0.7185768, -3.22485, 1, 0, 0, 1, 1,
-0.276181, -0.5378575, -2.892619, 1, 0, 0, 1, 1,
-0.2730019, -0.08062052, -1.013062, 0, 0, 0, 1, 1,
-0.2724857, 1.837295, 0.03065445, 0, 0, 0, 1, 1,
-0.265462, -0.7173972, -1.704186, 0, 0, 0, 1, 1,
-0.262427, -0.5721286, -3.517249, 0, 0, 0, 1, 1,
-0.2610579, -0.1542411, -2.323906, 0, 0, 0, 1, 1,
-0.250437, -1.249238, -3.590191, 0, 0, 0, 1, 1,
-0.244793, -0.02421167, -1.825129, 0, 0, 0, 1, 1,
-0.2429048, 0.8137798, 0.3092185, 1, 1, 1, 1, 1,
-0.2423776, -0.5520561, -2.683785, 1, 1, 1, 1, 1,
-0.2374726, -0.2809931, -3.485882, 1, 1, 1, 1, 1,
-0.2347787, -0.5212308, -3.720645, 1, 1, 1, 1, 1,
-0.2334529, -0.3967519, -4.046959, 1, 1, 1, 1, 1,
-0.2332628, -1.229127, -4.656463, 1, 1, 1, 1, 1,
-0.2313951, 1.78912, 1.516921, 1, 1, 1, 1, 1,
-0.231137, -0.251944, -1.937544, 1, 1, 1, 1, 1,
-0.2298347, 2.10544, -2.759153, 1, 1, 1, 1, 1,
-0.2262138, 0.6576818, -0.7461848, 1, 1, 1, 1, 1,
-0.2241011, -0.2561354, -1.923499, 1, 1, 1, 1, 1,
-0.218109, 0.02105538, -0.8233585, 1, 1, 1, 1, 1,
-0.2179766, 1.973828, 0.8382856, 1, 1, 1, 1, 1,
-0.215487, 1.721437, 1.007843, 1, 1, 1, 1, 1,
-0.2124335, 1.166784, -0.4326492, 1, 1, 1, 1, 1,
-0.2041029, 1.304482, 2.041789, 0, 0, 1, 1, 1,
-0.2013011, -0.03284338, -2.262748, 1, 0, 0, 1, 1,
-0.2007372, 0.08284342, -1.83528, 1, 0, 0, 1, 1,
-0.1824352, -1.144289, -3.246152, 1, 0, 0, 1, 1,
-0.1797654, 0.3272119, -0.513157, 1, 0, 0, 1, 1,
-0.1772267, 1.047804, 0.1212308, 1, 0, 0, 1, 1,
-0.1747868, -1.059154, -2.982612, 0, 0, 0, 1, 1,
-0.1744571, -0.08260069, -2.422423, 0, 0, 0, 1, 1,
-0.1737679, 1.25917, -0.9816191, 0, 0, 0, 1, 1,
-0.1733418, 0.1101423, -1.471426, 0, 0, 0, 1, 1,
-0.1653903, -0.7203583, -4.134058, 0, 0, 0, 1, 1,
-0.1629054, 0.4880282, 0.2455732, 0, 0, 0, 1, 1,
-0.1609829, -0.8032145, -3.320293, 0, 0, 0, 1, 1,
-0.1598862, -1.534163, -4.35056, 1, 1, 1, 1, 1,
-0.1553585, 1.717985, -0.4024391, 1, 1, 1, 1, 1,
-0.149815, -0.4349812, -1.515217, 1, 1, 1, 1, 1,
-0.1497241, 0.1793194, 0.3997889, 1, 1, 1, 1, 1,
-0.1495232, 0.92269, -1.274112, 1, 1, 1, 1, 1,
-0.1464966, -0.9279803, -3.597942, 1, 1, 1, 1, 1,
-0.1458418, 0.8339023, -1.790241, 1, 1, 1, 1, 1,
-0.1438736, 0.7074613, -0.1565408, 1, 1, 1, 1, 1,
-0.1399504, -0.6836694, -4.790059, 1, 1, 1, 1, 1,
-0.1392262, -1.995757, -3.972503, 1, 1, 1, 1, 1,
-0.1356204, 0.7192808, 0.5744028, 1, 1, 1, 1, 1,
-0.1347986, 1.2282, -0.3001394, 1, 1, 1, 1, 1,
-0.1343686, 0.8231559, 0.7661671, 1, 1, 1, 1, 1,
-0.1305871, -1.602934, -3.092383, 1, 1, 1, 1, 1,
-0.1272527, -0.9363292, -2.934979, 1, 1, 1, 1, 1,
-0.1254146, -1.09284, -1.73298, 0, 0, 1, 1, 1,
-0.1247879, -0.4031005, -3.585633, 1, 0, 0, 1, 1,
-0.1238019, 0.6114156, 0.8694425, 1, 0, 0, 1, 1,
-0.122668, -0.157271, -4.333312, 1, 0, 0, 1, 1,
-0.1185247, -1.579898, -2.437662, 1, 0, 0, 1, 1,
-0.1166105, -0.1432355, -2.916537, 1, 0, 0, 1, 1,
-0.1147838, -0.2092638, -0.6730574, 0, 0, 0, 1, 1,
-0.114687, -0.021142, -2.594249, 0, 0, 0, 1, 1,
-0.1099665, 0.6287105, -1.494049, 0, 0, 0, 1, 1,
-0.1056417, 0.8686676, -0.2815717, 0, 0, 0, 1, 1,
-0.1056086, -0.9219206, -1.093617, 0, 0, 0, 1, 1,
-0.1032878, -1.249727, -1.829, 0, 0, 0, 1, 1,
-0.1032502, -0.7477621, -2.097328, 0, 0, 0, 1, 1,
-0.09650617, 0.6008, -0.8659276, 1, 1, 1, 1, 1,
-0.09572497, -0.6226693, -2.710983, 1, 1, 1, 1, 1,
-0.09285715, -0.09432149, -1.802114, 1, 1, 1, 1, 1,
-0.09186603, 0.1642257, -0.438953, 1, 1, 1, 1, 1,
-0.08971952, -0.620093, -2.303926, 1, 1, 1, 1, 1,
-0.08669124, -0.2559936, -3.243282, 1, 1, 1, 1, 1,
-0.085589, 0.3740872, 0.1151481, 1, 1, 1, 1, 1,
-0.08383999, 1.349467, -0.3935215, 1, 1, 1, 1, 1,
-0.07973404, -1.665947, -4.314874, 1, 1, 1, 1, 1,
-0.07595295, 1.035451, 1.438844, 1, 1, 1, 1, 1,
-0.07567245, 0.3445531, 1.052616, 1, 1, 1, 1, 1,
-0.07360233, 0.5261508, -0.3631642, 1, 1, 1, 1, 1,
-0.07294817, 1.408863, 0.3548618, 1, 1, 1, 1, 1,
-0.06775561, -0.03824838, -2.502291, 1, 1, 1, 1, 1,
-0.06435937, -0.7633347, -1.076415, 1, 1, 1, 1, 1,
-0.06064232, 0.2289755, -0.2048864, 0, 0, 1, 1, 1,
-0.0571605, 1.295771, -0.7317715, 1, 0, 0, 1, 1,
-0.05438985, -0.9530413, -3.811098, 1, 0, 0, 1, 1,
-0.05430996, -0.9290175, -5.913744, 1, 0, 0, 1, 1,
-0.05257505, 0.6402324, -0.9729313, 1, 0, 0, 1, 1,
-0.0509649, -0.6552056, -3.39055, 1, 0, 0, 1, 1,
-0.04961434, -0.5681611, -2.889244, 0, 0, 0, 1, 1,
-0.04486541, 0.2275129, 0.09350519, 0, 0, 0, 1, 1,
-0.04450305, 0.3558969, 0.3509286, 0, 0, 0, 1, 1,
-0.04357076, -0.2473, -2.962617, 0, 0, 0, 1, 1,
-0.03392127, 1.105415, 0.1893875, 0, 0, 0, 1, 1,
-0.03359967, 0.6140409, -0.9706897, 0, 0, 0, 1, 1,
-0.03211519, 1.007161, 0.06361522, 0, 0, 0, 1, 1,
-0.02715234, -0.4879944, -2.730554, 1, 1, 1, 1, 1,
-0.02445121, 0.1069509, -0.2868139, 1, 1, 1, 1, 1,
-0.02187141, 0.1552188, 1.207146, 1, 1, 1, 1, 1,
-0.01969761, -1.182492, -3.465193, 1, 1, 1, 1, 1,
-0.01927929, 0.4915203, 1.396561, 1, 1, 1, 1, 1,
-0.017126, 1.45724, -0.605156, 1, 1, 1, 1, 1,
-0.01579404, -0.7912799, -2.954089, 1, 1, 1, 1, 1,
-0.01317815, -2.325651, -4.128045, 1, 1, 1, 1, 1,
-0.01050042, 0.1381973, -1.408153, 1, 1, 1, 1, 1,
-0.009639148, 0.974314, -0.4079421, 1, 1, 1, 1, 1,
-0.004496349, -0.3650292, -2.440316, 1, 1, 1, 1, 1,
-0.0004480167, 0.1698108, 0.5395339, 1, 1, 1, 1, 1,
0.004337339, 0.6192506, 0.9031708, 1, 1, 1, 1, 1,
0.004418775, 1.398838, -0.3012629, 1, 1, 1, 1, 1,
0.005009497, 1.942724, 0.663368, 1, 1, 1, 1, 1,
0.006381095, 0.3701487, 0.5936561, 0, 0, 1, 1, 1,
0.006524168, -0.9619299, 3.735223, 1, 0, 0, 1, 1,
0.00783289, 1.383344, 0.3705902, 1, 0, 0, 1, 1,
0.01008806, 0.4467706, -1.286661, 1, 0, 0, 1, 1,
0.01099934, 1.409292, 0.05930841, 1, 0, 0, 1, 1,
0.01144069, 0.7421283, -1.311655, 1, 0, 0, 1, 1,
0.0123231, -2.650377, 3.892282, 0, 0, 0, 1, 1,
0.01391995, -2.387576, 2.565425, 0, 0, 0, 1, 1,
0.02155083, -0.5090178, 2.527173, 0, 0, 0, 1, 1,
0.02945493, 1.661253, 1.633406, 0, 0, 0, 1, 1,
0.03428653, 0.9877255, -0.5048569, 0, 0, 0, 1, 1,
0.03984311, -0.7855355, 1.876509, 0, 0, 0, 1, 1,
0.040602, 1.059617, -0.9556121, 0, 0, 0, 1, 1,
0.04244725, 0.8440681, -0.01740638, 1, 1, 1, 1, 1,
0.04724382, 1.778224, 1.189854, 1, 1, 1, 1, 1,
0.0484693, -0.517333, 1.221046, 1, 1, 1, 1, 1,
0.04950227, 0.9459974, 0.06160443, 1, 1, 1, 1, 1,
0.04983903, -1.458318, 3.780225, 1, 1, 1, 1, 1,
0.05293272, 0.8632005, -1.132034, 1, 1, 1, 1, 1,
0.05487045, -2.286007, 3.245314, 1, 1, 1, 1, 1,
0.06032005, -0.9101517, 5.532282, 1, 1, 1, 1, 1,
0.06570531, -0.04873376, 2.670899, 1, 1, 1, 1, 1,
0.06664482, 0.7798718, 0.1915772, 1, 1, 1, 1, 1,
0.07206685, 0.4372461, 1.377178, 1, 1, 1, 1, 1,
0.07583758, -0.1173403, 1.762404, 1, 1, 1, 1, 1,
0.07658534, 0.5172126, -1.233597, 1, 1, 1, 1, 1,
0.08012082, 1.297545, 1.037019, 1, 1, 1, 1, 1,
0.08614162, 0.7429708, 1.568809, 1, 1, 1, 1, 1,
0.0871852, -1.598209, 3.337373, 0, 0, 1, 1, 1,
0.09087472, -2.412385, 4.259559, 1, 0, 0, 1, 1,
0.09128381, -0.7966774, 4.62989, 1, 0, 0, 1, 1,
0.09148688, -0.01770553, 1.116184, 1, 0, 0, 1, 1,
0.09315489, -1.511633, 3.163144, 1, 0, 0, 1, 1,
0.09406424, 0.9030715, -0.1612804, 1, 0, 0, 1, 1,
0.09590995, 0.04111239, 1.233066, 0, 0, 0, 1, 1,
0.1017452, 0.6057252, -0.2340035, 0, 0, 0, 1, 1,
0.1070847, 0.117805, 3.204269, 0, 0, 0, 1, 1,
0.1082518, 0.4718217, 0.7988585, 0, 0, 0, 1, 1,
0.1214642, 0.5025914, -1.061801, 0, 0, 0, 1, 1,
0.1236561, 0.09984205, 0.2835564, 0, 0, 0, 1, 1,
0.1242027, 0.2881666, -0.6028084, 0, 0, 0, 1, 1,
0.1280643, -0.624819, 3.708218, 1, 1, 1, 1, 1,
0.1280971, 1.096541, 1.270707, 1, 1, 1, 1, 1,
0.1329693, 0.9197051, -0.420722, 1, 1, 1, 1, 1,
0.1367297, 1.297207, 0.1030129, 1, 1, 1, 1, 1,
0.1499932, -0.2161382, 2.239457, 1, 1, 1, 1, 1,
0.1500099, -0.545043, 2.580435, 1, 1, 1, 1, 1,
0.151114, 0.2716824, 0.9788154, 1, 1, 1, 1, 1,
0.1564248, -1.512302, 2.90238, 1, 1, 1, 1, 1,
0.1593948, 0.337872, -0.179676, 1, 1, 1, 1, 1,
0.1603825, -0.1155628, 5.023612, 1, 1, 1, 1, 1,
0.1642425, -2.243416, 2.620555, 1, 1, 1, 1, 1,
0.16477, -0.9706843, 3.373344, 1, 1, 1, 1, 1,
0.1648736, 0.276815, -0.1672132, 1, 1, 1, 1, 1,
0.17368, -0.09511692, 2.025422, 1, 1, 1, 1, 1,
0.1738987, -0.2322693, 1.131533, 1, 1, 1, 1, 1,
0.175257, 0.2724735, 1.277933, 0, 0, 1, 1, 1,
0.1767109, -0.6318212, 1.759531, 1, 0, 0, 1, 1,
0.1792032, -1.33687, 2.506881, 1, 0, 0, 1, 1,
0.1797968, -0.3540968, 2.570611, 1, 0, 0, 1, 1,
0.1819416, 1.236292, 0.3017495, 1, 0, 0, 1, 1,
0.1851068, -0.4768967, 4.853343, 1, 0, 0, 1, 1,
0.1865517, 0.1329223, 1.214242, 0, 0, 0, 1, 1,
0.1891004, 0.3829944, -0.5531778, 0, 0, 0, 1, 1,
0.189233, -1.539585, 5.103859, 0, 0, 0, 1, 1,
0.1909908, 0.2793134, 2.571242, 0, 0, 0, 1, 1,
0.1942731, 1.128463, -1.075867, 0, 0, 0, 1, 1,
0.1984607, 0.1675479, 2.039603, 0, 0, 0, 1, 1,
0.2002666, -0.9534761, 2.958659, 0, 0, 0, 1, 1,
0.2103739, 0.8693183, 1.043714, 1, 1, 1, 1, 1,
0.2149489, 0.4751901, 0.506661, 1, 1, 1, 1, 1,
0.2149684, 0.9988067, 0.3012724, 1, 1, 1, 1, 1,
0.2163869, -0.4808067, 4.778485, 1, 1, 1, 1, 1,
0.2181469, 1.130187, -0.4136071, 1, 1, 1, 1, 1,
0.2205447, 0.01492264, 0.9039961, 1, 1, 1, 1, 1,
0.2275506, 0.1814958, -1.232272, 1, 1, 1, 1, 1,
0.2311786, -0.1280962, 1.042355, 1, 1, 1, 1, 1,
0.2316883, -0.3712462, 2.707095, 1, 1, 1, 1, 1,
0.232555, 0.7113303, -2.216972, 1, 1, 1, 1, 1,
0.2420638, -0.7307727, 2.177864, 1, 1, 1, 1, 1,
0.2430202, 1.728876, 0.8833652, 1, 1, 1, 1, 1,
0.2432889, -0.2661946, 1.055647, 1, 1, 1, 1, 1,
0.244043, -0.762557, 3.310893, 1, 1, 1, 1, 1,
0.2471186, 0.6948828, 0.6652904, 1, 1, 1, 1, 1,
0.2481948, 0.8059967, -0.5194516, 0, 0, 1, 1, 1,
0.2500358, -0.8510889, 3.988405, 1, 0, 0, 1, 1,
0.2532059, -0.4798261, 3.405384, 1, 0, 0, 1, 1,
0.253756, -0.8222913, 4.120518, 1, 0, 0, 1, 1,
0.254579, -0.2355045, 2.081387, 1, 0, 0, 1, 1,
0.2556891, 0.1577898, -0.3922481, 1, 0, 0, 1, 1,
0.2562467, -0.07376874, 3.427791, 0, 0, 0, 1, 1,
0.2599494, -0.5400044, 2.21734, 0, 0, 0, 1, 1,
0.2630388, 0.3623366, 1.412329, 0, 0, 0, 1, 1,
0.2656306, 0.6715953, -0.6440115, 0, 0, 0, 1, 1,
0.266713, 0.09965754, 1.07553, 0, 0, 0, 1, 1,
0.2707599, 0.6441605, -0.8032799, 0, 0, 0, 1, 1,
0.2724248, -0.467688, 3.160188, 0, 0, 0, 1, 1,
0.2729955, 1.100633, -1.236616, 1, 1, 1, 1, 1,
0.2755372, -0.668559, 2.021127, 1, 1, 1, 1, 1,
0.2813621, -0.3818919, 3.190008, 1, 1, 1, 1, 1,
0.2898285, 0.0968314, 1.700642, 1, 1, 1, 1, 1,
0.290058, 1.478575, 0.09455383, 1, 1, 1, 1, 1,
0.2926135, -0.04226482, 1.940693, 1, 1, 1, 1, 1,
0.293362, -0.06115454, 1.109964, 1, 1, 1, 1, 1,
0.2946692, -0.5055807, 1.216437, 1, 1, 1, 1, 1,
0.2979044, 0.2695587, 1.929886, 1, 1, 1, 1, 1,
0.2984755, -1.411829, 2.274204, 1, 1, 1, 1, 1,
0.3024407, 1.269363, -0.469256, 1, 1, 1, 1, 1,
0.3062471, -1.505709, 1.784479, 1, 1, 1, 1, 1,
0.3095089, -0.4923235, 0.5518634, 1, 1, 1, 1, 1,
0.3108352, 0.7399743, 0.862354, 1, 1, 1, 1, 1,
0.3214753, 0.2715385, 1.150462, 1, 1, 1, 1, 1,
0.3247046, -0.699436, 1.521946, 0, 0, 1, 1, 1,
0.3249669, 1.183749, 0.7432789, 1, 0, 0, 1, 1,
0.3310016, -0.8129056, 1.966896, 1, 0, 0, 1, 1,
0.3322927, 0.1762426, 1.316547, 1, 0, 0, 1, 1,
0.3349772, -0.2999482, 2.023512, 1, 0, 0, 1, 1,
0.3377064, -1.177989, 2.112126, 1, 0, 0, 1, 1,
0.3412823, -0.256593, 2.31038, 0, 0, 0, 1, 1,
0.3418431, 0.6365972, 0.4278935, 0, 0, 0, 1, 1,
0.3428092, 0.2153267, 1.150015, 0, 0, 0, 1, 1,
0.3429889, -0.1366336, -0.1847189, 0, 0, 0, 1, 1,
0.3467053, 1.671588, 0.7618622, 0, 0, 0, 1, 1,
0.3470033, -0.603178, 3.43229, 0, 0, 0, 1, 1,
0.3484317, 0.4157842, 1.490541, 0, 0, 0, 1, 1,
0.3531035, -0.697012, 2.627424, 1, 1, 1, 1, 1,
0.3539013, 1.073119, 0.8429479, 1, 1, 1, 1, 1,
0.3550926, 0.9196386, 0.884146, 1, 1, 1, 1, 1,
0.3563738, -1.822353, 2.516673, 1, 1, 1, 1, 1,
0.3619744, 1.519044, -2.646891, 1, 1, 1, 1, 1,
0.3638984, 0.7251822, 1.268117, 1, 1, 1, 1, 1,
0.3705714, -0.03650372, 1.115504, 1, 1, 1, 1, 1,
0.3705891, -0.6521236, 3.091031, 1, 1, 1, 1, 1,
0.3785775, -0.324996, 1.632887, 1, 1, 1, 1, 1,
0.3786099, 0.8302639, 0.1481144, 1, 1, 1, 1, 1,
0.3845755, 1.952347, 0.6083131, 1, 1, 1, 1, 1,
0.3934882, 0.1498833, 0.9013699, 1, 1, 1, 1, 1,
0.3942055, 0.311874, 2.138091, 1, 1, 1, 1, 1,
0.395594, 1.282183, -0.5017219, 1, 1, 1, 1, 1,
0.3958404, 0.5226701, 0.6070351, 1, 1, 1, 1, 1,
0.4010428, 0.7155489, 0.4650785, 0, 0, 1, 1, 1,
0.4016932, -1.468516, 3.46463, 1, 0, 0, 1, 1,
0.4017961, 0.3271732, 1.044227, 1, 0, 0, 1, 1,
0.4050812, -1.234146, 2.952429, 1, 0, 0, 1, 1,
0.4061812, -0.2436171, 0.6855899, 1, 0, 0, 1, 1,
0.4065281, 2.025507, 0.9375813, 1, 0, 0, 1, 1,
0.4173703, 0.1349049, 1.427122, 0, 0, 0, 1, 1,
0.4187162, 1.392519, 0.09697275, 0, 0, 0, 1, 1,
0.422955, -0.1563825, 3.280195, 0, 0, 0, 1, 1,
0.4229881, -2.697874, 5.055779, 0, 0, 0, 1, 1,
0.4262364, 0.2241736, 1.402594, 0, 0, 0, 1, 1,
0.428828, 1.661906, -0.06713419, 0, 0, 0, 1, 1,
0.4340826, -0.6263672, 3.316426, 0, 0, 0, 1, 1,
0.4342747, -0.1954574, 1.850043, 1, 1, 1, 1, 1,
0.4357022, -0.7830421, 1.851233, 1, 1, 1, 1, 1,
0.4387708, -1.054305, 2.283904, 1, 1, 1, 1, 1,
0.4390638, 0.4702232, -0.722384, 1, 1, 1, 1, 1,
0.4411356, 2.231736, 0.3441089, 1, 1, 1, 1, 1,
0.4414125, -0.1065714, 1.371894, 1, 1, 1, 1, 1,
0.4418691, -0.5483347, 4.329076, 1, 1, 1, 1, 1,
0.447644, 0.3566818, 2.315345, 1, 1, 1, 1, 1,
0.4497763, -1.149287, 2.786089, 1, 1, 1, 1, 1,
0.4522433, -1.54559, 2.131592, 1, 1, 1, 1, 1,
0.4587933, 0.04378873, 0.5996314, 1, 1, 1, 1, 1,
0.4593891, -0.6402205, 3.456665, 1, 1, 1, 1, 1,
0.4623107, 0.1089079, 2.163955, 1, 1, 1, 1, 1,
0.465353, -0.7469851, 1.716387, 1, 1, 1, 1, 1,
0.4669289, -0.1416865, 0.880706, 1, 1, 1, 1, 1,
0.4695838, 0.1146793, 1.665571, 0, 0, 1, 1, 1,
0.473331, -0.3672761, 3.098516, 1, 0, 0, 1, 1,
0.4747298, 0.3080401, 2.603136, 1, 0, 0, 1, 1,
0.4767365, -1.28835, 3.04624, 1, 0, 0, 1, 1,
0.4853178, -0.9383707, 3.156498, 1, 0, 0, 1, 1,
0.4859345, -0.6379218, 1.500821, 1, 0, 0, 1, 1,
0.4889611, -2.122921, 3.837879, 0, 0, 0, 1, 1,
0.4905739, 0.1959545, -0.4163624, 0, 0, 0, 1, 1,
0.496037, -1.218948, 2.654416, 0, 0, 0, 1, 1,
0.5007266, 0.1701038, -0.2202943, 0, 0, 0, 1, 1,
0.5028149, 0.1339507, 2.921135, 0, 0, 0, 1, 1,
0.5077259, -1.060495, 3.130131, 0, 0, 0, 1, 1,
0.5104699, -2.268625, 1.706913, 0, 0, 0, 1, 1,
0.5108949, 0.8186188, 0.6944296, 1, 1, 1, 1, 1,
0.517553, -0.5235952, 0.6874844, 1, 1, 1, 1, 1,
0.5183828, -0.7596464, 1.052499, 1, 1, 1, 1, 1,
0.5214201, 0.8638921, -0.5589142, 1, 1, 1, 1, 1,
0.5218111, -0.5904785, 2.776664, 1, 1, 1, 1, 1,
0.5219563, 0.2502348, 1.098203, 1, 1, 1, 1, 1,
0.5220651, 1.130308, 3.113135, 1, 1, 1, 1, 1,
0.5232433, 0.03696474, 0.9201621, 1, 1, 1, 1, 1,
0.526531, 0.3236768, 1.430293, 1, 1, 1, 1, 1,
0.5281687, 2.257568, -0.7188002, 1, 1, 1, 1, 1,
0.5368025, -2.306328, 1.706825, 1, 1, 1, 1, 1,
0.5373794, 1.027219, 1.023383, 1, 1, 1, 1, 1,
0.5419693, 0.09621422, 2.523345, 1, 1, 1, 1, 1,
0.5451404, -0.8740085, 1.524847, 1, 1, 1, 1, 1,
0.5499715, 0.2613994, -0.5037084, 1, 1, 1, 1, 1,
0.5511559, -0.3158543, 2.383404, 0, 0, 1, 1, 1,
0.5554689, -1.398581, 3.098593, 1, 0, 0, 1, 1,
0.5561466, -0.9408448, 2.136906, 1, 0, 0, 1, 1,
0.556299, -0.1450978, 2.781918, 1, 0, 0, 1, 1,
0.5636093, 0.5797682, 0.9000648, 1, 0, 0, 1, 1,
0.5653055, -1.746285, 1.788391, 1, 0, 0, 1, 1,
0.5711321, -0.4400743, 1.415006, 0, 0, 0, 1, 1,
0.5724257, -1.063232, 2.031139, 0, 0, 0, 1, 1,
0.5744297, -0.2790809, 2.46061, 0, 0, 0, 1, 1,
0.5760047, 0.3074771, 0.3594614, 0, 0, 0, 1, 1,
0.5787163, -0.2948169, 1.100817, 0, 0, 0, 1, 1,
0.5795305, -0.1775422, 4.044719, 0, 0, 0, 1, 1,
0.5844274, -0.3968267, 2.767321, 0, 0, 0, 1, 1,
0.5872175, 1.490302, 0.8580188, 1, 1, 1, 1, 1,
0.5896032, -1.864291, 1.809282, 1, 1, 1, 1, 1,
0.5919114, -2.168768, 1.887658, 1, 1, 1, 1, 1,
0.5925096, -0.8236071, 2.632411, 1, 1, 1, 1, 1,
0.5959778, 0.9231447, 0.5877194, 1, 1, 1, 1, 1,
0.5968055, -1.125381, 1.537682, 1, 1, 1, 1, 1,
0.5985892, -1.100297, 4.358185, 1, 1, 1, 1, 1,
0.6001734, 0.0007996025, 1.118217, 1, 1, 1, 1, 1,
0.609843, 0.2706386, 1.29637, 1, 1, 1, 1, 1,
0.6186688, 0.6970031, 1.585166, 1, 1, 1, 1, 1,
0.6204383, -1.110729, 2.639325, 1, 1, 1, 1, 1,
0.6226276, 0.987071, -0.1545454, 1, 1, 1, 1, 1,
0.6271734, -0.6257303, 1.733376, 1, 1, 1, 1, 1,
0.635639, -0.0388405, 0.8782794, 1, 1, 1, 1, 1,
0.6393592, -0.971155, 4.03774, 1, 1, 1, 1, 1,
0.640585, 1.44242, -1.359376, 0, 0, 1, 1, 1,
0.6411372, 1.292406, -0.02409273, 1, 0, 0, 1, 1,
0.6419857, 0.3889516, -0.01113043, 1, 0, 0, 1, 1,
0.6475334, 1.589222, -0.5067917, 1, 0, 0, 1, 1,
0.6485828, 0.6076534, -0.40937, 1, 0, 0, 1, 1,
0.6495278, 0.32111, 1.448825, 1, 0, 0, 1, 1,
0.6498105, -0.3236655, -0.8629562, 0, 0, 0, 1, 1,
0.6501215, -0.6316681, 2.432191, 0, 0, 0, 1, 1,
0.6510794, -0.7057282, 2.210366, 0, 0, 0, 1, 1,
0.6517516, -0.6584616, 1.979146, 0, 0, 0, 1, 1,
0.6528496, -1.148786, 1.015973, 0, 0, 0, 1, 1,
0.6583119, 0.8210458, 1.145771, 0, 0, 0, 1, 1,
0.6586237, -1.097811, 4.342196, 0, 0, 0, 1, 1,
0.6589488, 1.702877, 0.9345595, 1, 1, 1, 1, 1,
0.6606777, -1.522135, 3.139089, 1, 1, 1, 1, 1,
0.6637458, 1.428293, -0.1286398, 1, 1, 1, 1, 1,
0.6650648, -0.2220755, 1.74714, 1, 1, 1, 1, 1,
0.6685391, -0.2637528, 1.647455, 1, 1, 1, 1, 1,
0.6704698, -0.4582672, 1.150373, 1, 1, 1, 1, 1,
0.671866, 0.1960027, 2.401011, 1, 1, 1, 1, 1,
0.6719465, -1.246916, 3.430607, 1, 1, 1, 1, 1,
0.6794842, 0.6679791, 0.6644841, 1, 1, 1, 1, 1,
0.6795666, 0.8407605, 0.9337633, 1, 1, 1, 1, 1,
0.6805261, -0.1562354, 1.484624, 1, 1, 1, 1, 1,
0.6859162, -0.5128129, 2.630999, 1, 1, 1, 1, 1,
0.6864717, -0.9601467, 2.000471, 1, 1, 1, 1, 1,
0.6874889, -0.7200534, 2.151818, 1, 1, 1, 1, 1,
0.6877565, 1.417747, 0.712433, 1, 1, 1, 1, 1,
0.6895992, -1.21167, 2.591979, 0, 0, 1, 1, 1,
0.6954547, 1.176408, -0.3802327, 1, 0, 0, 1, 1,
0.7003598, -0.8254177, 1.699661, 1, 0, 0, 1, 1,
0.7017334, -1.191057, 2.738587, 1, 0, 0, 1, 1,
0.7060366, 0.9212807, 2.954156, 1, 0, 0, 1, 1,
0.7068132, 0.381931, -0.3873535, 1, 0, 0, 1, 1,
0.7084597, 0.5984775, 1.011959, 0, 0, 0, 1, 1,
0.7134082, -0.6646047, 2.825161, 0, 0, 0, 1, 1,
0.7136696, 2.079197, 1.218951, 0, 0, 0, 1, 1,
0.7153062, 1.30599, 0.1121227, 0, 0, 0, 1, 1,
0.7175802, -0.4776359, 3.534136, 0, 0, 0, 1, 1,
0.7194979, 2.005068, -0.4254388, 0, 0, 0, 1, 1,
0.720432, -0.4293816, 4.72099, 0, 0, 0, 1, 1,
0.7226697, -0.07501523, 0.7771348, 1, 1, 1, 1, 1,
0.7230775, -0.2838272, 3.274973, 1, 1, 1, 1, 1,
0.725186, 1.191746, 0.4191773, 1, 1, 1, 1, 1,
0.7253845, -0.4955871, 3.952355, 1, 1, 1, 1, 1,
0.7289031, -2.093476, 3.20235, 1, 1, 1, 1, 1,
0.7356358, 1.178888, 0.8859074, 1, 1, 1, 1, 1,
0.737546, 0.4178215, 0.810416, 1, 1, 1, 1, 1,
0.7457637, -1.713881, 3.028889, 1, 1, 1, 1, 1,
0.746108, -0.6276752, 3.672404, 1, 1, 1, 1, 1,
0.7477518, 0.4999819, -0.1215405, 1, 1, 1, 1, 1,
0.7499273, 0.4447, 1.786853, 1, 1, 1, 1, 1,
0.7504783, 0.9217303, -0.2662997, 1, 1, 1, 1, 1,
0.7559536, -0.6902738, 3.007845, 1, 1, 1, 1, 1,
0.7561589, -0.8378597, 2.464586, 1, 1, 1, 1, 1,
0.761, 0.4624824, 1.290672, 1, 1, 1, 1, 1,
0.7631762, -0.5398934, 0.8395545, 0, 0, 1, 1, 1,
0.769363, -1.366799, 1.665727, 1, 0, 0, 1, 1,
0.7720153, -2.052756, 1.965017, 1, 0, 0, 1, 1,
0.7764348, 1.15234, -0.02941814, 1, 0, 0, 1, 1,
0.777546, 0.1397157, 1.580927, 1, 0, 0, 1, 1,
0.7827044, -2.209423, 3.579142, 1, 0, 0, 1, 1,
0.7849324, -0.1357838, 2.233723, 0, 0, 0, 1, 1,
0.7888352, 0.8771186, -0.109005, 0, 0, 0, 1, 1,
0.7909239, 0.8671059, -0.7901691, 0, 0, 0, 1, 1,
0.7933114, -1.286874, 3.115937, 0, 0, 0, 1, 1,
0.7962688, -0.2715849, 1.205235, 0, 0, 0, 1, 1,
0.8003456, -1.067255, 2.27388, 0, 0, 0, 1, 1,
0.8039257, 0.1229846, 2.123172, 0, 0, 0, 1, 1,
0.8058412, -1.494276, 2.548816, 1, 1, 1, 1, 1,
0.8064468, 0.7197179, 0.3506089, 1, 1, 1, 1, 1,
0.8077928, -0.304719, 2.079353, 1, 1, 1, 1, 1,
0.809336, 0.1114692, 2.458284, 1, 1, 1, 1, 1,
0.8099846, -0.5762775, 3.145878, 1, 1, 1, 1, 1,
0.8100967, 0.6146415, 3.263131, 1, 1, 1, 1, 1,
0.8106686, -1.095586, 4.495127, 1, 1, 1, 1, 1,
0.812375, -0.8352999, 3.837354, 1, 1, 1, 1, 1,
0.8149199, -1.083299, 1.683451, 1, 1, 1, 1, 1,
0.8201797, -0.004529413, 2.844672, 1, 1, 1, 1, 1,
0.8236693, 0.6522325, 3.070289, 1, 1, 1, 1, 1,
0.8238006, -1.46122, 4.882788, 1, 1, 1, 1, 1,
0.8250431, -0.3099875, 2.45433, 1, 1, 1, 1, 1,
0.828114, -0.3958738, 3.158978, 1, 1, 1, 1, 1,
0.830568, -0.7607918, 1.026548, 1, 1, 1, 1, 1,
0.8385748, 2.422459, -0.4479172, 0, 0, 1, 1, 1,
0.8385928, 0.2660857, 2.743643, 1, 0, 0, 1, 1,
0.8410643, -1.085791, 3.580897, 1, 0, 0, 1, 1,
0.846211, -1.171647, 2.732753, 1, 0, 0, 1, 1,
0.8503528, -0.4580126, 2.640863, 1, 0, 0, 1, 1,
0.8531361, -0.3816268, 1.05786, 1, 0, 0, 1, 1,
0.8566304, -0.1215875, 1.788394, 0, 0, 0, 1, 1,
0.8670837, 1.280088, 0.2527618, 0, 0, 0, 1, 1,
0.8766273, -0.6446266, 1.571668, 0, 0, 0, 1, 1,
0.8788041, 1.090106, -0.9468988, 0, 0, 0, 1, 1,
0.8788545, -1.18526, 2.772366, 0, 0, 0, 1, 1,
0.8804315, 0.1433455, 1.259341, 0, 0, 0, 1, 1,
0.880904, -0.04131294, 1.666363, 0, 0, 0, 1, 1,
0.8844303, 0.02970971, 1.796475, 1, 1, 1, 1, 1,
0.8863747, -1.203521, 3.754488, 1, 1, 1, 1, 1,
0.8876364, 1.084407, -0.7058743, 1, 1, 1, 1, 1,
0.8903809, -0.2283714, 2.080505, 1, 1, 1, 1, 1,
0.8924642, 0.235303, 0.6733572, 1, 1, 1, 1, 1,
0.8929185, 0.4735079, -0.8034969, 1, 1, 1, 1, 1,
0.8965443, -0.2116062, 1.37137, 1, 1, 1, 1, 1,
0.9030234, -1.585559, 2.731848, 1, 1, 1, 1, 1,
0.9053509, 0.9916545, 1.65618, 1, 1, 1, 1, 1,
0.913359, 0.2217221, 3.051844, 1, 1, 1, 1, 1,
0.9149809, -3.751353, 3.852527, 1, 1, 1, 1, 1,
0.9150776, 0.6457976, -0.5466773, 1, 1, 1, 1, 1,
0.9151087, -0.1253681, 3.216497, 1, 1, 1, 1, 1,
0.9246275, -0.8435907, 0.3565995, 1, 1, 1, 1, 1,
0.9351349, 1.299785, 1.470494, 1, 1, 1, 1, 1,
0.9362342, 0.7944772, 2.204801, 0, 0, 1, 1, 1,
0.9377403, -0.3336626, 1.85089, 1, 0, 0, 1, 1,
0.9381819, -0.6407396, 3.325772, 1, 0, 0, 1, 1,
0.9385406, -1.351228, 3.82185, 1, 0, 0, 1, 1,
0.9447821, 0.835008, 1.920585, 1, 0, 0, 1, 1,
0.9534537, -1.724089, 3.52661, 1, 0, 0, 1, 1,
0.9562832, 0.8293277, -0.03248869, 0, 0, 0, 1, 1,
0.9638689, -0.9948904, 2.957704, 0, 0, 0, 1, 1,
0.9651803, -0.5553123, 1.458303, 0, 0, 0, 1, 1,
0.9725681, 0.8441088, 0.9435557, 0, 0, 0, 1, 1,
0.9725975, -0.8300823, 1.531294, 0, 0, 0, 1, 1,
0.9781562, -0.6739502, 1.15533, 0, 0, 0, 1, 1,
0.9835913, -0.5576479, 1.470984, 0, 0, 0, 1, 1,
0.9837251, 1.40708, 0.07909796, 1, 1, 1, 1, 1,
0.9868498, -0.9770803, 3.542788, 1, 1, 1, 1, 1,
0.9882353, 2.014328, -1.121578, 1, 1, 1, 1, 1,
0.9891469, 0.2332151, 0.2352296, 1, 1, 1, 1, 1,
0.9909998, -1.057082, 1.463621, 1, 1, 1, 1, 1,
0.9927031, 1.541285, -0.7895606, 1, 1, 1, 1, 1,
0.9962322, 0.8451941, -0.227339, 1, 1, 1, 1, 1,
1.001572, -0.3090684, 0.2959256, 1, 1, 1, 1, 1,
1.003995, 1.163124, 1.630919, 1, 1, 1, 1, 1,
1.013254, -1.269582, 2.539066, 1, 1, 1, 1, 1,
1.01552, 0.8606031, -0.4674388, 1, 1, 1, 1, 1,
1.022114, -1.366977, 2.048999, 1, 1, 1, 1, 1,
1.027732, 0.1353693, 2.286679, 1, 1, 1, 1, 1,
1.028707, 0.9611332, 0.3148209, 1, 1, 1, 1, 1,
1.037754, -0.7088093, 1.087247, 1, 1, 1, 1, 1,
1.04632, -0.185831, 0.1706302, 0, 0, 1, 1, 1,
1.052664, 1.16972, -0.8009474, 1, 0, 0, 1, 1,
1.060729, -0.9452277, 3.913793, 1, 0, 0, 1, 1,
1.067441, -0.04101176, 0.9695017, 1, 0, 0, 1, 1,
1.067632, -0.04052691, -0.4061851, 1, 0, 0, 1, 1,
1.071382, -0.09166274, 2.344832, 1, 0, 0, 1, 1,
1.071633, 0.4562562, 1.37416, 0, 0, 0, 1, 1,
1.082685, -0.8168957, 3.299583, 0, 0, 0, 1, 1,
1.091313, 1.050572, 1.870136, 0, 0, 0, 1, 1,
1.103684, 1.04172, 2.562667, 0, 0, 0, 1, 1,
1.104205, 0.03361123, 2.895155, 0, 0, 0, 1, 1,
1.12285, 1.229499, 1.237816, 0, 0, 0, 1, 1,
1.12436, -0.368642, 3.16768, 0, 0, 0, 1, 1,
1.125085, -0.02054493, 3.67979, 1, 1, 1, 1, 1,
1.129128, -0.1312246, 0.732717, 1, 1, 1, 1, 1,
1.136289, -0.9450548, 1.934645, 1, 1, 1, 1, 1,
1.142467, 0.1860537, 2.618139, 1, 1, 1, 1, 1,
1.15719, 0.4222592, 2.086358, 1, 1, 1, 1, 1,
1.16741, 0.1030891, -0.548574, 1, 1, 1, 1, 1,
1.169656, 0.3852821, 1.236211, 1, 1, 1, 1, 1,
1.169765, -0.7303417, 1.047207, 1, 1, 1, 1, 1,
1.176434, 0.8375771, 1.975492, 1, 1, 1, 1, 1,
1.178834, -0.6658742, 2.741738, 1, 1, 1, 1, 1,
1.180549, 0.07465399, 2.784486, 1, 1, 1, 1, 1,
1.182669, 0.3340025, 2.761508, 1, 1, 1, 1, 1,
1.183239, -1.616848, 2.119749, 1, 1, 1, 1, 1,
1.197457, -0.1168079, 2.249958, 1, 1, 1, 1, 1,
1.198313, 0.8199279, 1.693462, 1, 1, 1, 1, 1,
1.208348, -0.3132526, 2.519295, 0, 0, 1, 1, 1,
1.210417, -0.9118627, 3.547296, 1, 0, 0, 1, 1,
1.210531, 0.9471146, 0.4140967, 1, 0, 0, 1, 1,
1.214938, 0.02485215, 1.274844, 1, 0, 0, 1, 1,
1.215588, -0.0005351743, 2.480333, 1, 0, 0, 1, 1,
1.226336, 0.3172433, 2.165659, 1, 0, 0, 1, 1,
1.235196, -2.31665, 2.095645, 0, 0, 0, 1, 1,
1.235266, -0.2144591, 1.536639, 0, 0, 0, 1, 1,
1.237278, 0.336889, 2.662674, 0, 0, 0, 1, 1,
1.237509, -0.09106069, 1.519551, 0, 0, 0, 1, 1,
1.23963, -0.5511665, 2.028742, 0, 0, 0, 1, 1,
1.242697, 0.9958932, 1.470684, 0, 0, 0, 1, 1,
1.243927, 0.9845369, 0.8273302, 0, 0, 0, 1, 1,
1.244379, 0.2612981, 1.242573, 1, 1, 1, 1, 1,
1.255026, -1.221994, 1.951915, 1, 1, 1, 1, 1,
1.257233, -2.063059, 3.718155, 1, 1, 1, 1, 1,
1.257864, 0.4426601, 0.7669442, 1, 1, 1, 1, 1,
1.258221, 0.1870037, 1.828809, 1, 1, 1, 1, 1,
1.2602, 0.8331795, -0.01068428, 1, 1, 1, 1, 1,
1.260507, -3.215791, 4.343935, 1, 1, 1, 1, 1,
1.261876, -0.5877755, 2.107777, 1, 1, 1, 1, 1,
1.268538, 1.298808, -0.5994552, 1, 1, 1, 1, 1,
1.273021, -0.7342764, 2.437781, 1, 1, 1, 1, 1,
1.275917, 0.2413807, -0.09970842, 1, 1, 1, 1, 1,
1.284184, -0.005915597, 1.122993, 1, 1, 1, 1, 1,
1.28872, -0.6572002, 0.1759474, 1, 1, 1, 1, 1,
1.292145, 0.2944485, 1.159293, 1, 1, 1, 1, 1,
1.295367, -0.3212245, 1.566575, 1, 1, 1, 1, 1,
1.301802, -0.8362238, 3.573026, 0, 0, 1, 1, 1,
1.323812, 2.030529, 2.152297, 1, 0, 0, 1, 1,
1.324859, 0.3040144, 0.09912256, 1, 0, 0, 1, 1,
1.329602, 0.2123797, 2.273012, 1, 0, 0, 1, 1,
1.334435, -1.930277, 3.390309, 1, 0, 0, 1, 1,
1.381068, -1.376331, 2.219083, 1, 0, 0, 1, 1,
1.384394, -0.4489518, 1.599624, 0, 0, 0, 1, 1,
1.387835, -0.008604651, 1.8114, 0, 0, 0, 1, 1,
1.395355, -0.2704978, 2.293472, 0, 0, 0, 1, 1,
1.398651, -2.041819, 3.997957, 0, 0, 0, 1, 1,
1.40061, 0.1508075, 2.414142, 0, 0, 0, 1, 1,
1.401718, -0.8360901, 1.623836, 0, 0, 0, 1, 1,
1.405373, 1.390207, 0.01319894, 0, 0, 0, 1, 1,
1.411629, -0.7338791, 1.394648, 1, 1, 1, 1, 1,
1.421667, -0.6197446, 3.591913, 1, 1, 1, 1, 1,
1.424932, 0.005666246, 1.742049, 1, 1, 1, 1, 1,
1.445806, -0.6096601, 1.814907, 1, 1, 1, 1, 1,
1.483453, 0.5757589, 2.774343, 1, 1, 1, 1, 1,
1.495677, 0.8961397, 0.8738744, 1, 1, 1, 1, 1,
1.504342, 1.593888, 1.273185, 1, 1, 1, 1, 1,
1.534312, -1.04126, 2.6282, 1, 1, 1, 1, 1,
1.558646, -0.4622448, 1.100082, 1, 1, 1, 1, 1,
1.587837, -0.1306606, 1.747091, 1, 1, 1, 1, 1,
1.600527, 0.1987474, 3.356161, 1, 1, 1, 1, 1,
1.603495, -0.3903991, 1.665088, 1, 1, 1, 1, 1,
1.620682, 1.255329, 2.156301, 1, 1, 1, 1, 1,
1.624427, 0.1697637, 0.8314459, 1, 1, 1, 1, 1,
1.624745, -0.2129247, 0.8739645, 1, 1, 1, 1, 1,
1.632314, 0.3815122, 0.2674344, 0, 0, 1, 1, 1,
1.64021, -0.283323, 1.425653, 1, 0, 0, 1, 1,
1.65227, 0.7400271, 1.244416, 1, 0, 0, 1, 1,
1.686739, -2.172793, 4.843652, 1, 0, 0, 1, 1,
1.706895, 0.4196028, 1.790677, 1, 0, 0, 1, 1,
1.718178, 0.7593737, 1.530828, 1, 0, 0, 1, 1,
1.730497, -1.77912, 3.639879, 0, 0, 0, 1, 1,
1.735926, 0.4847087, 1.112593, 0, 0, 0, 1, 1,
1.739138, 0.2565005, 3.081642, 0, 0, 0, 1, 1,
1.739959, -0.1554446, 1.942571, 0, 0, 0, 1, 1,
1.740179, 0.8952416, 0.8682166, 0, 0, 0, 1, 1,
1.744348, 0.0240391, 1.987158, 0, 0, 0, 1, 1,
1.753542, 0.7750316, 1.788497, 0, 0, 0, 1, 1,
1.756998, 0.3571894, 1.224894, 1, 1, 1, 1, 1,
1.764907, 0.5643709, 2.209839, 1, 1, 1, 1, 1,
1.768603, -0.204192, 1.043103, 1, 1, 1, 1, 1,
1.769867, 0.1324446, 1.232221, 1, 1, 1, 1, 1,
1.804059, 0.1596001, 1.785699, 1, 1, 1, 1, 1,
1.804945, -1.430514, 0.2175451, 1, 1, 1, 1, 1,
1.808959, 0.2095589, 0.6396646, 1, 1, 1, 1, 1,
1.811454, -0.7791495, 1.40912, 1, 1, 1, 1, 1,
1.851799, -0.5326443, 2.448441, 1, 1, 1, 1, 1,
1.859272, 0.4717179, 0.6492076, 1, 1, 1, 1, 1,
1.907594, 1.716763, -0.5343077, 1, 1, 1, 1, 1,
1.919778, 0.9708723, 2.772155, 1, 1, 1, 1, 1,
1.939209, -1.33471, 2.387018, 1, 1, 1, 1, 1,
1.949308, 2.301978, -0.6562329, 1, 1, 1, 1, 1,
1.956522, -0.07199053, 1.727717, 1, 1, 1, 1, 1,
1.997263, 1.250921, 0.07580712, 0, 0, 1, 1, 1,
1.999336, 0.4336063, 1.235853, 1, 0, 0, 1, 1,
2.017115, 1.28735, 0.8509158, 1, 0, 0, 1, 1,
2.023977, -0.8093837, 2.128783, 1, 0, 0, 1, 1,
2.051122, 0.301168, 1.752285, 1, 0, 0, 1, 1,
2.053064, 1.377656, 1.623092, 1, 0, 0, 1, 1,
2.055236, -0.842289, 1.155452, 0, 0, 0, 1, 1,
2.140291, 0.5754129, 1.980827, 0, 0, 0, 1, 1,
2.161685, 0.7909865, 3.202517, 0, 0, 0, 1, 1,
2.17838, 1.592699, 1.576926, 0, 0, 0, 1, 1,
2.180928, 0.07286063, 1.112241, 0, 0, 0, 1, 1,
2.213883, 0.8759136, -1.067132, 0, 0, 0, 1, 1,
2.252652, 0.483756, 2.566126, 0, 0, 0, 1, 1,
2.315847, -1.461692, 1.048495, 1, 1, 1, 1, 1,
2.409583, 0.0787982, 1.759326, 1, 1, 1, 1, 1,
2.452866, 1.041345, -0.20005, 1, 1, 1, 1, 1,
2.519427, -0.8254212, 1.576253, 1, 1, 1, 1, 1,
2.597847, 0.7889271, -1.43065, 1, 1, 1, 1, 1,
3.281217, 1.584713, 2.013466, 1, 1, 1, 1, 1,
3.53557, -0.4303544, 2.074231, 1, 1, 1, 1, 1
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
var radius = 10.10551;
var distance = 35.49519;
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
mvMatrix.translate( 0.04393291, 0.4820343, 0.190731 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.49519);
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
