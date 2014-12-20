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
-3.545289, -1.484835, -3.696504, 1, 0, 0, 1,
-3.194783, -0.8740129, -1.84752, 1, 0.007843138, 0, 1,
-2.968202, -0.323133, -0.1686204, 1, 0.01176471, 0, 1,
-2.571783, 1.649146, -0.9398877, 1, 0.01960784, 0, 1,
-2.547923, -0.2213562, -2.046843, 1, 0.02352941, 0, 1,
-2.471785, -0.6943457, -1.247734, 1, 0.03137255, 0, 1,
-2.438271, -0.2153755, -2.886138, 1, 0.03529412, 0, 1,
-2.429946, 0.222528, 0.5331668, 1, 0.04313726, 0, 1,
-2.41583, 0.2748545, -1.058164, 1, 0.04705882, 0, 1,
-2.411682, -1.924401, -2.436319, 1, 0.05490196, 0, 1,
-2.398509, 1.46661, -1.384474, 1, 0.05882353, 0, 1,
-2.392726, -0.4773966, -2.363724, 1, 0.06666667, 0, 1,
-2.376021, 0.152173, -0.3278928, 1, 0.07058824, 0, 1,
-2.173032, 1.746637, -2.624769, 1, 0.07843138, 0, 1,
-2.059698, -0.9428378, -1.131198, 1, 0.08235294, 0, 1,
-2.040453, -0.5474916, -0.5092946, 1, 0.09019608, 0, 1,
-2.038227, 0.2872926, -0.506134, 1, 0.09411765, 0, 1,
-2.019447, 0.8963432, -0.5777436, 1, 0.1019608, 0, 1,
-1.991373, 0.02959745, -2.844104, 1, 0.1098039, 0, 1,
-1.970157, 0.6489881, -2.313893, 1, 0.1137255, 0, 1,
-1.949696, -0.3456829, -3.327969, 1, 0.1215686, 0, 1,
-1.913669, -1.8495, -1.415022, 1, 0.1254902, 0, 1,
-1.898406, 1.053555, -1.363767, 1, 0.1333333, 0, 1,
-1.876887, 0.09139559, -2.610683, 1, 0.1372549, 0, 1,
-1.870146, -0.7011604, -2.386264, 1, 0.145098, 0, 1,
-1.854519, 1.20107, -1.31338, 1, 0.1490196, 0, 1,
-1.85292, -1.817062, -4.516598, 1, 0.1568628, 0, 1,
-1.847697, 0.7095325, -1.817618, 1, 0.1607843, 0, 1,
-1.826778, -0.04922593, -1.190044, 1, 0.1686275, 0, 1,
-1.81863, 0.4052405, -0.2525171, 1, 0.172549, 0, 1,
-1.815377, -0.432631, -0.5602723, 1, 0.1803922, 0, 1,
-1.808538, -1.505545, -0.2530773, 1, 0.1843137, 0, 1,
-1.788176, 0.5755135, 0.2540046, 1, 0.1921569, 0, 1,
-1.757173, 0.08661989, -0.1076304, 1, 0.1960784, 0, 1,
-1.753185, -1.864992, -1.70649, 1, 0.2039216, 0, 1,
-1.746615, 0.291265, -0.58166, 1, 0.2117647, 0, 1,
-1.732021, -2.370519, 0.3911968, 1, 0.2156863, 0, 1,
-1.724682, 0.7544827, 0.5158392, 1, 0.2235294, 0, 1,
-1.702854, 1.152552, 0.0106979, 1, 0.227451, 0, 1,
-1.690884, 0.4544713, 0.4228525, 1, 0.2352941, 0, 1,
-1.678684, 1.933258, -1.642506, 1, 0.2392157, 0, 1,
-1.677068, 1.30175, 0.02682215, 1, 0.2470588, 0, 1,
-1.664056, -1.467374, -2.582383, 1, 0.2509804, 0, 1,
-1.659807, -1.066301, -2.777344, 1, 0.2588235, 0, 1,
-1.646757, 1.130113, -1.683974, 1, 0.2627451, 0, 1,
-1.642387, -1.29769, -3.78979, 1, 0.2705882, 0, 1,
-1.612318, -1.240983, -2.463437, 1, 0.2745098, 0, 1,
-1.591027, 1.495616, 0.7307321, 1, 0.282353, 0, 1,
-1.570954, 0.967696, -1.537705, 1, 0.2862745, 0, 1,
-1.568826, -0.178247, 0.491671, 1, 0.2941177, 0, 1,
-1.567107, -0.5439385, -1.869088, 1, 0.3019608, 0, 1,
-1.557124, -0.5980389, -1.073923, 1, 0.3058824, 0, 1,
-1.548796, -0.218208, -2.453882, 1, 0.3137255, 0, 1,
-1.528731, -0.3654142, -0.6596348, 1, 0.3176471, 0, 1,
-1.52318, -0.1280199, 0.6039187, 1, 0.3254902, 0, 1,
-1.522436, -0.2521912, -1.997912, 1, 0.3294118, 0, 1,
-1.514673, 0.2954625, -0.4935803, 1, 0.3372549, 0, 1,
-1.504029, -0.2208136, -1.537949, 1, 0.3411765, 0, 1,
-1.491887, 1.322757, 0.175284, 1, 0.3490196, 0, 1,
-1.472624, 0.2021618, -2.287693, 1, 0.3529412, 0, 1,
-1.470635, 2.032804, -1.014306, 1, 0.3607843, 0, 1,
-1.47034, -1.769577, -3.369657, 1, 0.3647059, 0, 1,
-1.469432, 0.2517048, -2.759231, 1, 0.372549, 0, 1,
-1.466096, -0.04939418, -2.343666, 1, 0.3764706, 0, 1,
-1.464144, -0.5550434, -1.180713, 1, 0.3843137, 0, 1,
-1.453226, -1.559989, -3.785222, 1, 0.3882353, 0, 1,
-1.450779, 0.9006366, -1.622669, 1, 0.3960784, 0, 1,
-1.442946, -1.861469, -2.813943, 1, 0.4039216, 0, 1,
-1.438064, 0.4115967, -2.775886, 1, 0.4078431, 0, 1,
-1.413468, -2.09105, -1.675592, 1, 0.4156863, 0, 1,
-1.408033, 0.1687644, -0.9673654, 1, 0.4196078, 0, 1,
-1.403576, -0.09119905, -2.346954, 1, 0.427451, 0, 1,
-1.401909, -1.173195, -3.638938, 1, 0.4313726, 0, 1,
-1.391795, -0.4629652, -2.549432, 1, 0.4392157, 0, 1,
-1.388816, -0.3592716, -2.121055, 1, 0.4431373, 0, 1,
-1.378802, -0.08450694, -0.9556851, 1, 0.4509804, 0, 1,
-1.377919, -1.118694, -2.709559, 1, 0.454902, 0, 1,
-1.37376, 0.1140531, -0.2634082, 1, 0.4627451, 0, 1,
-1.364095, 0.2468589, -2.991444, 1, 0.4666667, 0, 1,
-1.359123, -0.09004782, -0.5166726, 1, 0.4745098, 0, 1,
-1.354445, -0.6629825, -2.303836, 1, 0.4784314, 0, 1,
-1.347237, -1.790007, -2.139189, 1, 0.4862745, 0, 1,
-1.346152, 0.9202223, 0.6062735, 1, 0.4901961, 0, 1,
-1.339893, -1.927384, -1.679467, 1, 0.4980392, 0, 1,
-1.336843, -1.166673, -1.738848, 1, 0.5058824, 0, 1,
-1.332985, 0.6030207, -0.1068774, 1, 0.509804, 0, 1,
-1.327269, -0.03286694, -0.4135707, 1, 0.5176471, 0, 1,
-1.325674, -2.185464, -2.820523, 1, 0.5215687, 0, 1,
-1.322698, -2.454907, -1.444971, 1, 0.5294118, 0, 1,
-1.317496, -0.08355957, -0.242954, 1, 0.5333334, 0, 1,
-1.315288, 0.7551295, -0.1978451, 1, 0.5411765, 0, 1,
-1.311575, 1.666464, -2.467231, 1, 0.5450981, 0, 1,
-1.30873, 0.491598, -2.006469, 1, 0.5529412, 0, 1,
-1.282618, -0.1923999, -1.834141, 1, 0.5568628, 0, 1,
-1.28234, -1.583066, -3.139584, 1, 0.5647059, 0, 1,
-1.282111, -0.5037816, -1.782478, 1, 0.5686275, 0, 1,
-1.270939, 3.112166, -1.532233, 1, 0.5764706, 0, 1,
-1.261668, -2.106556, -2.102065, 1, 0.5803922, 0, 1,
-1.26124, -0.03770798, -2.172821, 1, 0.5882353, 0, 1,
-1.257969, 0.4855363, -1.932863, 1, 0.5921569, 0, 1,
-1.245586, 0.7770203, -0.9864517, 1, 0.6, 0, 1,
-1.228489, 0.9013866, 0.3926371, 1, 0.6078432, 0, 1,
-1.225572, 0.05831705, -1.56701, 1, 0.6117647, 0, 1,
-1.224569, 1.009817, -2.62957, 1, 0.6196079, 0, 1,
-1.222127, -1.642687, -3.949722, 1, 0.6235294, 0, 1,
-1.213652, -1.911604, -2.72432, 1, 0.6313726, 0, 1,
-1.213017, -0.1521816, -1.409128, 1, 0.6352941, 0, 1,
-1.209957, -1.136759, -4.103875, 1, 0.6431373, 0, 1,
-1.20943, 0.616993, -0.2327071, 1, 0.6470588, 0, 1,
-1.209197, -0.1935836, -3.472199, 1, 0.654902, 0, 1,
-1.207445, 0.2912131, -0.5101141, 1, 0.6588235, 0, 1,
-1.204008, 0.3856547, -1.277005, 1, 0.6666667, 0, 1,
-1.197575, 0.4328195, -1.084448, 1, 0.6705883, 0, 1,
-1.193764, -0.6854165, -2.317014, 1, 0.6784314, 0, 1,
-1.193234, 0.5604699, -1.338902, 1, 0.682353, 0, 1,
-1.185001, 0.6030245, 0.007928004, 1, 0.6901961, 0, 1,
-1.18043, -2.564023, -4.330782, 1, 0.6941177, 0, 1,
-1.179892, -1.065239, -3.62387, 1, 0.7019608, 0, 1,
-1.16902, 1.287965, -0.8844182, 1, 0.7098039, 0, 1,
-1.165744, -2.07142, -2.937021, 1, 0.7137255, 0, 1,
-1.1585, -0.2231928, -3.426491, 1, 0.7215686, 0, 1,
-1.156242, 0.346714, -2.014138, 1, 0.7254902, 0, 1,
-1.15478, 0.6729154, -0.9077453, 1, 0.7333333, 0, 1,
-1.145976, -0.3312064, -1.526195, 1, 0.7372549, 0, 1,
-1.145673, -1.74272, -1.431616, 1, 0.7450981, 0, 1,
-1.137002, -0.456986, -1.155127, 1, 0.7490196, 0, 1,
-1.131247, -0.01890875, -1.523166, 1, 0.7568628, 0, 1,
-1.126774, 0.1533986, 0.7609587, 1, 0.7607843, 0, 1,
-1.119035, -0.7883081, -3.539514, 1, 0.7686275, 0, 1,
-1.10908, 0.1391803, -0.81103, 1, 0.772549, 0, 1,
-1.108494, -0.8455129, -4.27967, 1, 0.7803922, 0, 1,
-1.108365, 0.7641776, 1.756906, 1, 0.7843137, 0, 1,
-1.108297, 0.6479447, -3.183017, 1, 0.7921569, 0, 1,
-1.098511, 0.20123, -1.543577, 1, 0.7960784, 0, 1,
-1.098446, -1.536055, -1.926043, 1, 0.8039216, 0, 1,
-1.094418, -1.295529, -1.333652, 1, 0.8117647, 0, 1,
-1.093784, 0.1023499, -2.093722, 1, 0.8156863, 0, 1,
-1.087291, -0.4208356, 0.1781817, 1, 0.8235294, 0, 1,
-1.075164, -0.9938826, -1.966512, 1, 0.827451, 0, 1,
-1.062071, -1.170648, -3.962839, 1, 0.8352941, 0, 1,
-1.055741, 0.0188268, -1.413759, 1, 0.8392157, 0, 1,
-1.04836, -0.3643852, -1.680545, 1, 0.8470588, 0, 1,
-1.045334, 0.7344621, -2.249549, 1, 0.8509804, 0, 1,
-1.037027, -0.1462038, -0.9321481, 1, 0.8588235, 0, 1,
-1.03101, 0.6261922, -0.6419555, 1, 0.8627451, 0, 1,
-1.028215, -1.223809, -2.943663, 1, 0.8705882, 0, 1,
-1.023996, 1.203813, 0.4654971, 1, 0.8745098, 0, 1,
-1.023005, 2.070324, 0.8652879, 1, 0.8823529, 0, 1,
-1.021984, 0.7320722, 0.2980568, 1, 0.8862745, 0, 1,
-1.01621, 1.020851, -1.438965, 1, 0.8941177, 0, 1,
-1.013069, -0.3843642, -2.039774, 1, 0.8980392, 0, 1,
-1.007966, -1.803481, -2.597918, 1, 0.9058824, 0, 1,
-1.007774, 1.271548, 0.0862787, 1, 0.9137255, 0, 1,
-0.9940932, 1.495646, -2.448854, 1, 0.9176471, 0, 1,
-0.9928748, -0.1802814, 0.2219958, 1, 0.9254902, 0, 1,
-0.9906754, 0.6463671, -0.5056584, 1, 0.9294118, 0, 1,
-0.9853441, -1.176148, -1.185317, 1, 0.9372549, 0, 1,
-0.981576, -0.5925208, -1.588275, 1, 0.9411765, 0, 1,
-0.9814471, 1.247963, 0.3344792, 1, 0.9490196, 0, 1,
-0.9782645, -1.452453, -4.040566, 1, 0.9529412, 0, 1,
-0.9720842, -0.1726451, -3.254401, 1, 0.9607843, 0, 1,
-0.9708992, -0.6991892, -1.741983, 1, 0.9647059, 0, 1,
-0.9613556, -0.01423973, -3.132855, 1, 0.972549, 0, 1,
-0.9599029, 1.392058, 0.2771948, 1, 0.9764706, 0, 1,
-0.9583909, 1.761073, -1.989968, 1, 0.9843137, 0, 1,
-0.9578555, -1.497472, -3.955825, 1, 0.9882353, 0, 1,
-0.9487013, 0.09900595, -2.184889, 1, 0.9960784, 0, 1,
-0.9461774, 0.6695313, -1.323309, 0.9960784, 1, 0, 1,
-0.9418376, -0.3684454, -1.072471, 0.9921569, 1, 0, 1,
-0.936289, -0.3428508, -1.270534, 0.9843137, 1, 0, 1,
-0.9361726, 0.4487752, -1.61839, 0.9803922, 1, 0, 1,
-0.929219, 1.301204, -0.4917526, 0.972549, 1, 0, 1,
-0.9119555, 0.9941879, -3.167748, 0.9686275, 1, 0, 1,
-0.9118415, 0.201798, 0.05339227, 0.9607843, 1, 0, 1,
-0.9114721, -0.6813769, -2.312592, 0.9568627, 1, 0, 1,
-0.9104043, -1.630796, -3.440697, 0.9490196, 1, 0, 1,
-0.9063461, 0.6519256, 0.4237266, 0.945098, 1, 0, 1,
-0.9045385, -0.1968378, -1.342159, 0.9372549, 1, 0, 1,
-0.902693, 1.216639, -3.164642, 0.9333333, 1, 0, 1,
-0.9020411, 0.2080327, -1.600138, 0.9254902, 1, 0, 1,
-0.88915, 2.094318, -2.258551, 0.9215686, 1, 0, 1,
-0.8817109, -0.7477439, -1.392439, 0.9137255, 1, 0, 1,
-0.8783302, -0.1687991, -1.855, 0.9098039, 1, 0, 1,
-0.8659528, -0.6174384, -2.190294, 0.9019608, 1, 0, 1,
-0.8646886, 0.478461, -2.098403, 0.8941177, 1, 0, 1,
-0.8544793, -1.518262, -4.539419, 0.8901961, 1, 0, 1,
-0.8533452, 0.6084726, -0.2395021, 0.8823529, 1, 0, 1,
-0.8387238, 0.8103971, -0.0865242, 0.8784314, 1, 0, 1,
-0.8375981, 0.08116242, -1.834702, 0.8705882, 1, 0, 1,
-0.8359498, 2.150657, -0.1337069, 0.8666667, 1, 0, 1,
-0.8359072, -0.470134, -2.450486, 0.8588235, 1, 0, 1,
-0.8335763, 0.1272497, -2.40299, 0.854902, 1, 0, 1,
-0.8278466, -0.05295455, -1.656195, 0.8470588, 1, 0, 1,
-0.8260665, -0.2777874, -2.78138, 0.8431373, 1, 0, 1,
-0.8243375, 0.6376993, -1.368172, 0.8352941, 1, 0, 1,
-0.8240393, -0.9419205, -3.326729, 0.8313726, 1, 0, 1,
-0.8225574, 0.7719496, -0.3999516, 0.8235294, 1, 0, 1,
-0.8214703, 1.138664, -2.359547, 0.8196079, 1, 0, 1,
-0.8201187, 0.1755634, -1.296724, 0.8117647, 1, 0, 1,
-0.8164749, 1.386066, -1.09571, 0.8078431, 1, 0, 1,
-0.8152822, 0.6257692, -0.1830516, 0.8, 1, 0, 1,
-0.8124958, -0.3033728, -1.364346, 0.7921569, 1, 0, 1,
-0.812193, -0.2824899, -1.998724, 0.7882353, 1, 0, 1,
-0.811034, -0.03677068, -0.5364246, 0.7803922, 1, 0, 1,
-0.8066602, 2.069453, -0.7028228, 0.7764706, 1, 0, 1,
-0.798979, -1.24273, -2.553652, 0.7686275, 1, 0, 1,
-0.7979301, -0.06049966, -1.682641, 0.7647059, 1, 0, 1,
-0.7945166, 0.5377673, 0.8579388, 0.7568628, 1, 0, 1,
-0.7925681, -0.8987816, -2.815083, 0.7529412, 1, 0, 1,
-0.7909743, -1.640778, -3.67841, 0.7450981, 1, 0, 1,
-0.7863795, -0.3765103, -2.213457, 0.7411765, 1, 0, 1,
-0.783433, -0.03510026, -2.442074, 0.7333333, 1, 0, 1,
-0.7811143, -1.415177, -2.989284, 0.7294118, 1, 0, 1,
-0.7809012, 0.7513043, 0.8527235, 0.7215686, 1, 0, 1,
-0.7774904, 1.727515, -0.9829424, 0.7176471, 1, 0, 1,
-0.7731283, 0.308093, -0.6991233, 0.7098039, 1, 0, 1,
-0.7696773, 0.09398383, -0.6347374, 0.7058824, 1, 0, 1,
-0.7653112, 0.7433136, -1.268299, 0.6980392, 1, 0, 1,
-0.7586151, 1.072747, -0.2637554, 0.6901961, 1, 0, 1,
-0.7581894, -1.094186, -2.748151, 0.6862745, 1, 0, 1,
-0.7579725, 1.857062, -0.8310955, 0.6784314, 1, 0, 1,
-0.7561479, -1.080224, -4.917977, 0.6745098, 1, 0, 1,
-0.7532244, -1.214344, -0.9232901, 0.6666667, 1, 0, 1,
-0.7382991, -0.7311192, -0.3529186, 0.6627451, 1, 0, 1,
-0.7366646, 1.246332, -0.8312426, 0.654902, 1, 0, 1,
-0.7362754, -1.244176, -1.515786, 0.6509804, 1, 0, 1,
-0.7284256, 0.5472227, -1.283642, 0.6431373, 1, 0, 1,
-0.7255877, -0.5801928, -1.083095, 0.6392157, 1, 0, 1,
-0.7228788, -2.021131, -3.672351, 0.6313726, 1, 0, 1,
-0.7192669, -0.9565454, -2.8604, 0.627451, 1, 0, 1,
-0.7190791, -0.7554524, -1.419326, 0.6196079, 1, 0, 1,
-0.7158057, -0.8415316, -3.052547, 0.6156863, 1, 0, 1,
-0.7131199, -0.7398894, -1.986858, 0.6078432, 1, 0, 1,
-0.7090414, 0.1616089, -1.346644, 0.6039216, 1, 0, 1,
-0.7071983, -0.1309603, -2.567664, 0.5960785, 1, 0, 1,
-0.7043076, 1.028111, -1.401699, 0.5882353, 1, 0, 1,
-0.7024377, -0.4240189, -2.086645, 0.5843138, 1, 0, 1,
-0.7018595, -0.7656651, -0.7391936, 0.5764706, 1, 0, 1,
-0.6941411, 0.5571396, 0.265791, 0.572549, 1, 0, 1,
-0.6936111, -0.02100756, -1.692358, 0.5647059, 1, 0, 1,
-0.6896752, 1.121239, -0.7271937, 0.5607843, 1, 0, 1,
-0.6890201, 0.8473019, -1.652236, 0.5529412, 1, 0, 1,
-0.6835598, -1.154791, -3.199775, 0.5490196, 1, 0, 1,
-0.678393, 0.2839891, -2.34884, 0.5411765, 1, 0, 1,
-0.6766011, -1.444056, -1.939623, 0.5372549, 1, 0, 1,
-0.6752922, 0.2780475, -0.8488081, 0.5294118, 1, 0, 1,
-0.6743445, -1.062495, -2.237832, 0.5254902, 1, 0, 1,
-0.673704, -1.136375, -2.254201, 0.5176471, 1, 0, 1,
-0.6696483, 0.1061634, -1.964361, 0.5137255, 1, 0, 1,
-0.66952, 0.08090521, -1.780942, 0.5058824, 1, 0, 1,
-0.6653215, -0.5345438, -2.461641, 0.5019608, 1, 0, 1,
-0.6623853, -0.1247299, -0.2690426, 0.4941176, 1, 0, 1,
-0.6622583, 0.4242302, 0.9165139, 0.4862745, 1, 0, 1,
-0.6613362, -1.61145, -2.735178, 0.4823529, 1, 0, 1,
-0.6604463, 0.03106649, -3.355215, 0.4745098, 1, 0, 1,
-0.6601522, -0.1017322, -2.292202, 0.4705882, 1, 0, 1,
-0.6589506, -0.695574, -1.166434, 0.4627451, 1, 0, 1,
-0.6559638, 0.09274058, -1.27343, 0.4588235, 1, 0, 1,
-0.6553022, 0.9869235, -2.355439, 0.4509804, 1, 0, 1,
-0.6531199, 0.07935748, -1.808083, 0.4470588, 1, 0, 1,
-0.6511059, -0.7631274, -2.471183, 0.4392157, 1, 0, 1,
-0.6376863, -0.05017214, -1.467712, 0.4352941, 1, 0, 1,
-0.637652, 0.02179155, -1.195879, 0.427451, 1, 0, 1,
-0.636601, -0.6886147, -1.903329, 0.4235294, 1, 0, 1,
-0.6354854, 0.09752481, -3.157425, 0.4156863, 1, 0, 1,
-0.6345212, 0.6625044, 1.194498, 0.4117647, 1, 0, 1,
-0.6307189, -0.2794049, -0.8789588, 0.4039216, 1, 0, 1,
-0.6300003, 0.7998056, -1.837174, 0.3960784, 1, 0, 1,
-0.6298232, 1.169761, 1.39872, 0.3921569, 1, 0, 1,
-0.6286192, 0.3605144, 0.291903, 0.3843137, 1, 0, 1,
-0.627954, 0.6687213, -0.3015953, 0.3803922, 1, 0, 1,
-0.6242303, -0.6473668, -3.398895, 0.372549, 1, 0, 1,
-0.6181971, -0.2757693, -2.467143, 0.3686275, 1, 0, 1,
-0.6149217, -1.203513, -3.074096, 0.3607843, 1, 0, 1,
-0.6121349, 0.807121, -1.575892, 0.3568628, 1, 0, 1,
-0.6096689, 0.2524826, -0.5279344, 0.3490196, 1, 0, 1,
-0.6068882, 0.7976587, -2.097773, 0.345098, 1, 0, 1,
-0.6064107, -0.9124686, -0.68784, 0.3372549, 1, 0, 1,
-0.6052033, 1.512895, 0.1629957, 0.3333333, 1, 0, 1,
-0.6038098, 0.9335436, -0.5535901, 0.3254902, 1, 0, 1,
-0.602352, -0.4852188, -1.541371, 0.3215686, 1, 0, 1,
-0.5995525, -0.6281453, -2.942972, 0.3137255, 1, 0, 1,
-0.5981462, 0.2154969, -1.687839, 0.3098039, 1, 0, 1,
-0.5978299, -1.305033, -1.035513, 0.3019608, 1, 0, 1,
-0.5876247, 0.8973321, 0.4349656, 0.2941177, 1, 0, 1,
-0.5861903, -0.9035349, -2.774895, 0.2901961, 1, 0, 1,
-0.5858302, -1.19473, -3.106276, 0.282353, 1, 0, 1,
-0.5838399, -0.320937, -1.882562, 0.2784314, 1, 0, 1,
-0.5813587, 2.379393, -0.3206029, 0.2705882, 1, 0, 1,
-0.5756876, -0.2841858, -1.081313, 0.2666667, 1, 0, 1,
-0.5752565, 0.6869895, -0.8773737, 0.2588235, 1, 0, 1,
-0.574997, -0.2625298, -3.861475, 0.254902, 1, 0, 1,
-0.5742422, 0.8756275, -0.3229205, 0.2470588, 1, 0, 1,
-0.5649373, -0.5296374, -2.285965, 0.2431373, 1, 0, 1,
-0.5631175, -0.3058207, -1.945137, 0.2352941, 1, 0, 1,
-0.5606964, 0.6137734, -0.1786645, 0.2313726, 1, 0, 1,
-0.5601475, -0.3527027, -1.022242, 0.2235294, 1, 0, 1,
-0.5559346, -0.02525614, -1.940279, 0.2196078, 1, 0, 1,
-0.5476241, 0.3601957, -0.6020727, 0.2117647, 1, 0, 1,
-0.5466813, -1.731448, -0.7256191, 0.2078431, 1, 0, 1,
-0.5416716, -0.3950627, -2.487809, 0.2, 1, 0, 1,
-0.5381239, -0.9410951, -1.709674, 0.1921569, 1, 0, 1,
-0.5380679, -0.6206571, -3.524636, 0.1882353, 1, 0, 1,
-0.5373408, 0.348319, -1.48008, 0.1803922, 1, 0, 1,
-0.5316966, -1.511957, -2.776686, 0.1764706, 1, 0, 1,
-0.5166306, -0.8956798, -1.556478, 0.1686275, 1, 0, 1,
-0.5129895, -0.9717802, -3.366476, 0.1647059, 1, 0, 1,
-0.5117329, -0.2496967, -1.193324, 0.1568628, 1, 0, 1,
-0.5085168, 0.5520399, 0.06504279, 0.1529412, 1, 0, 1,
-0.5056152, -0.09780376, -1.205595, 0.145098, 1, 0, 1,
-0.5012153, -1.144046, -3.535697, 0.1411765, 1, 0, 1,
-0.5007534, 0.5549262, -1.530761, 0.1333333, 1, 0, 1,
-0.4970905, 1.240888, 0.009719565, 0.1294118, 1, 0, 1,
-0.4956664, 1.311366, 0.5144071, 0.1215686, 1, 0, 1,
-0.4915526, 1.237584, -0.834551, 0.1176471, 1, 0, 1,
-0.487471, -0.3274121, -2.763083, 0.1098039, 1, 0, 1,
-0.4846201, -1.600891, -3.656866, 0.1058824, 1, 0, 1,
-0.4791461, 0.8272429, -1.261849, 0.09803922, 1, 0, 1,
-0.4788378, 0.8410072, -1.258808, 0.09019608, 1, 0, 1,
-0.4779335, 0.3263427, -0.1454639, 0.08627451, 1, 0, 1,
-0.4765995, -1.250471, -4.194207, 0.07843138, 1, 0, 1,
-0.473277, -0.3547279, -1.944924, 0.07450981, 1, 0, 1,
-0.4718308, 0.520875, -0.8152983, 0.06666667, 1, 0, 1,
-0.468953, -0.4549829, -2.167796, 0.0627451, 1, 0, 1,
-0.4688084, -1.743732, -3.262414, 0.05490196, 1, 0, 1,
-0.467535, 0.2405372, -1.485536, 0.05098039, 1, 0, 1,
-0.467469, 1.321862, 0.03025204, 0.04313726, 1, 0, 1,
-0.4625628, -0.2053538, -3.869641, 0.03921569, 1, 0, 1,
-0.4616094, 0.1841036, -0.9971287, 0.03137255, 1, 0, 1,
-0.4601866, 0.4555554, -1.168738, 0.02745098, 1, 0, 1,
-0.4581721, -1.022369, -2.646971, 0.01960784, 1, 0, 1,
-0.4556279, 0.5911266, -0.126713, 0.01568628, 1, 0, 1,
-0.4513642, 0.7184851, -1.796987, 0.007843138, 1, 0, 1,
-0.4447175, -0.09235284, -1.194296, 0.003921569, 1, 0, 1,
-0.4374172, 0.1539898, -1.71156, 0, 1, 0.003921569, 1,
-0.434774, 0.5680332, -0.09207489, 0, 1, 0.01176471, 1,
-0.4341851, -0.6458078, -3.403246, 0, 1, 0.01568628, 1,
-0.4309643, 1.476505, -2.044295, 0, 1, 0.02352941, 1,
-0.4279517, 0.1777729, -0.930869, 0, 1, 0.02745098, 1,
-0.4263878, 0.4773026, -1.046488, 0, 1, 0.03529412, 1,
-0.4243314, -1.005246, -4.741303, 0, 1, 0.03921569, 1,
-0.4238633, -0.6614048, -2.233752, 0, 1, 0.04705882, 1,
-0.4232918, 0.5927646, 0.5175216, 0, 1, 0.05098039, 1,
-0.4227222, 1.200423, -1.761277, 0, 1, 0.05882353, 1,
-0.4205005, -0.5850746, -4.523884, 0, 1, 0.0627451, 1,
-0.4202214, -1.460491, -2.980099, 0, 1, 0.07058824, 1,
-0.4191641, -1.727825, -2.915132, 0, 1, 0.07450981, 1,
-0.4191095, 2.018168, 1.139205, 0, 1, 0.08235294, 1,
-0.418563, 0.3131618, -1.031391, 0, 1, 0.08627451, 1,
-0.4173878, 2.39116, -1.01419, 0, 1, 0.09411765, 1,
-0.4162266, 0.6394546, 0.03711054, 0, 1, 0.1019608, 1,
-0.4159323, -0.5123663, -2.392022, 0, 1, 0.1058824, 1,
-0.415123, -0.7056202, -3.941776, 0, 1, 0.1137255, 1,
-0.414156, 0.9724401, -0.7563944, 0, 1, 0.1176471, 1,
-0.4115964, -0.1091798, -0.3472918, 0, 1, 0.1254902, 1,
-0.4109996, -1.060682, -3.687777, 0, 1, 0.1294118, 1,
-0.4061843, 1.711304, -0.4760777, 0, 1, 0.1372549, 1,
-0.4053203, -1.730725, -3.194622, 0, 1, 0.1411765, 1,
-0.403417, -0.7252842, -0.8363205, 0, 1, 0.1490196, 1,
-0.3992649, -0.4446062, -3.697533, 0, 1, 0.1529412, 1,
-0.3899369, -0.9533029, -2.930519, 0, 1, 0.1607843, 1,
-0.3827201, -1.234245, -2.744217, 0, 1, 0.1647059, 1,
-0.3793832, 0.519089, -0.543318, 0, 1, 0.172549, 1,
-0.3748421, -0.08671748, -1.384113, 0, 1, 0.1764706, 1,
-0.3738208, 0.6878924, -1.892961, 0, 1, 0.1843137, 1,
-0.3656674, -1.312266, -3.842697, 0, 1, 0.1882353, 1,
-0.3632607, 0.3672863, -1.218326, 0, 1, 0.1960784, 1,
-0.3620881, -0.2321062, -1.944024, 0, 1, 0.2039216, 1,
-0.3597834, -0.3568421, -1.42892, 0, 1, 0.2078431, 1,
-0.3529085, 0.4461796, 1.162307, 0, 1, 0.2156863, 1,
-0.3521833, 0.4886302, -0.4752178, 0, 1, 0.2196078, 1,
-0.3417487, -0.1326669, -1.961167, 0, 1, 0.227451, 1,
-0.3321448, 0.4372843, -0.6889538, 0, 1, 0.2313726, 1,
-0.3320307, 2.048216, 1.565896, 0, 1, 0.2392157, 1,
-0.3297567, -0.6211655, -3.98581, 0, 1, 0.2431373, 1,
-0.3285402, -0.6330994, -2.254011, 0, 1, 0.2509804, 1,
-0.3267047, -0.08042465, -2.425382, 0, 1, 0.254902, 1,
-0.3229602, -0.4068387, -0.7318408, 0, 1, 0.2627451, 1,
-0.3208571, -0.5357547, -2.20655, 0, 1, 0.2666667, 1,
-0.3156243, 1.012205, 1.213391, 0, 1, 0.2745098, 1,
-0.3155929, -2.098755, -2.855184, 0, 1, 0.2784314, 1,
-0.3100392, -0.4859115, -2.429713, 0, 1, 0.2862745, 1,
-0.3065576, 0.831518, -0.8301178, 0, 1, 0.2901961, 1,
-0.304413, 1.403819, -1.585126, 0, 1, 0.2980392, 1,
-0.2961149, -0.474958, -2.856719, 0, 1, 0.3058824, 1,
-0.2960265, 1.995369, 0.3060909, 0, 1, 0.3098039, 1,
-0.2946853, 0.2993964, 0.7758731, 0, 1, 0.3176471, 1,
-0.293626, -0.523955, -1.927741, 0, 1, 0.3215686, 1,
-0.2913698, 0.9919071, 0.4213513, 0, 1, 0.3294118, 1,
-0.2903198, -0.4203367, -3.046777, 0, 1, 0.3333333, 1,
-0.2892261, 0.5513324, 0.8395694, 0, 1, 0.3411765, 1,
-0.2875491, -0.9242088, -1.589233, 0, 1, 0.345098, 1,
-0.286736, -2.184364, -1.733847, 0, 1, 0.3529412, 1,
-0.285948, 1.29468, -0.4487791, 0, 1, 0.3568628, 1,
-0.2813817, -1.14754, -3.012706, 0, 1, 0.3647059, 1,
-0.2779507, 0.8962404, -0.3577246, 0, 1, 0.3686275, 1,
-0.2754332, -0.5014549, -1.527435, 0, 1, 0.3764706, 1,
-0.2744494, 0.5796191, 0.7348417, 0, 1, 0.3803922, 1,
-0.2679359, 0.1032216, -3.085691, 0, 1, 0.3882353, 1,
-0.2658222, 0.5361251, 0.609201, 0, 1, 0.3921569, 1,
-0.2644587, 1.854506, 1.231788, 0, 1, 0.4, 1,
-0.2473199, 0.6464977, -0.4002402, 0, 1, 0.4078431, 1,
-0.2435396, -0.1516965, -1.841037, 0, 1, 0.4117647, 1,
-0.2421463, -0.6328519, -0.6931558, 0, 1, 0.4196078, 1,
-0.2417224, 2.284449, -1.156886, 0, 1, 0.4235294, 1,
-0.2412036, 0.06109828, -1.840724, 0, 1, 0.4313726, 1,
-0.2405079, 0.1145267, -1.47852, 0, 1, 0.4352941, 1,
-0.2350465, -0.6496218, -2.45778, 0, 1, 0.4431373, 1,
-0.2344332, -0.01415379, -3.272692, 0, 1, 0.4470588, 1,
-0.2300636, 1.036382, -1.022191, 0, 1, 0.454902, 1,
-0.2215658, 1.310883, -0.5585996, 0, 1, 0.4588235, 1,
-0.219439, 1.300758, 0.3134456, 0, 1, 0.4666667, 1,
-0.2134501, 0.07564226, -2.300797, 0, 1, 0.4705882, 1,
-0.2119657, 2.065313, -1.060214, 0, 1, 0.4784314, 1,
-0.2099401, -0.655936, -3.047264, 0, 1, 0.4823529, 1,
-0.2096367, -0.2315167, -3.616869, 0, 1, 0.4901961, 1,
-0.2080867, -0.1674409, -3.297889, 0, 1, 0.4941176, 1,
-0.2066517, -1.80355, -2.592849, 0, 1, 0.5019608, 1,
-0.2040269, -0.7759635, -0.7596329, 0, 1, 0.509804, 1,
-0.2026478, 1.291724, 1.159946, 0, 1, 0.5137255, 1,
-0.2002965, 0.1162191, -1.254022, 0, 1, 0.5215687, 1,
-0.1922796, -0.7334859, -1.292473, 0, 1, 0.5254902, 1,
-0.190017, -0.5153779, -3.70633, 0, 1, 0.5333334, 1,
-0.1813767, -1.55826, -4.340466, 0, 1, 0.5372549, 1,
-0.180937, -1.316211, -2.226606, 0, 1, 0.5450981, 1,
-0.180669, -1.15571, -1.833459, 0, 1, 0.5490196, 1,
-0.1787038, 0.07507224, -0.9389365, 0, 1, 0.5568628, 1,
-0.177064, 0.6010448, -1.26978, 0, 1, 0.5607843, 1,
-0.1762069, 0.1887257, -0.2428682, 0, 1, 0.5686275, 1,
-0.1741387, 0.6497872, 0.06522396, 0, 1, 0.572549, 1,
-0.1671309, -0.5374184, -3.732535, 0, 1, 0.5803922, 1,
-0.1611808, 0.4859696, 1.029482, 0, 1, 0.5843138, 1,
-0.1603456, -0.9052095, -2.042246, 0, 1, 0.5921569, 1,
-0.1572367, -0.3814127, -2.672128, 0, 1, 0.5960785, 1,
-0.1539256, 1.589737, -0.4810688, 0, 1, 0.6039216, 1,
-0.1521893, -1.399255, -2.450521, 0, 1, 0.6117647, 1,
-0.1521694, -0.5128269, -5.909415, 0, 1, 0.6156863, 1,
-0.1505951, 0.2120888, -0.6755725, 0, 1, 0.6235294, 1,
-0.1474543, -0.2838905, -1.715944, 0, 1, 0.627451, 1,
-0.1467033, -1.725404, -3.21427, 0, 1, 0.6352941, 1,
-0.1460733, 0.4301699, 0.8340185, 0, 1, 0.6392157, 1,
-0.142795, -0.224942, -3.394505, 0, 1, 0.6470588, 1,
-0.1365595, 0.6249472, -1.775944, 0, 1, 0.6509804, 1,
-0.1329865, -0.2519963, -1.446905, 0, 1, 0.6588235, 1,
-0.1288029, -1.04686, -2.50815, 0, 1, 0.6627451, 1,
-0.1272523, 0.9773983, 1.703096, 0, 1, 0.6705883, 1,
-0.1248626, -1.30742, -2.201499, 0, 1, 0.6745098, 1,
-0.122369, -0.4274423, -3.286139, 0, 1, 0.682353, 1,
-0.1223551, -1.601787, -2.570462, 0, 1, 0.6862745, 1,
-0.1133622, -1.114168, -3.424714, 0, 1, 0.6941177, 1,
-0.109079, -0.4485344, -3.024696, 0, 1, 0.7019608, 1,
-0.1063458, 0.2615479, 0.1171551, 0, 1, 0.7058824, 1,
-0.09606347, 0.4328449, -0.1076794, 0, 1, 0.7137255, 1,
-0.09488729, 0.4597339, 1.159008, 0, 1, 0.7176471, 1,
-0.08871967, -0.2098773, -4.005924, 0, 1, 0.7254902, 1,
-0.08746385, 0.5469027, 1.156229, 0, 1, 0.7294118, 1,
-0.08726141, -0.09763157, -1.941308, 0, 1, 0.7372549, 1,
-0.08693432, -0.4065113, -0.7371784, 0, 1, 0.7411765, 1,
-0.08490743, 1.099012, -1.452017, 0, 1, 0.7490196, 1,
-0.07720548, -0.1291265, -2.762547, 0, 1, 0.7529412, 1,
-0.0758809, -0.3422529, -2.800754, 0, 1, 0.7607843, 1,
-0.07544757, -0.03700952, -1.170108, 0, 1, 0.7647059, 1,
-0.07282656, 0.8116102, 0.4222107, 0, 1, 0.772549, 1,
-0.06692462, 0.4082999, -0.6588908, 0, 1, 0.7764706, 1,
-0.06494173, -0.6356608, -3.180627, 0, 1, 0.7843137, 1,
-0.06491274, 0.3591259, -1.258374, 0, 1, 0.7882353, 1,
-0.0592072, 1.023979, -0.8811277, 0, 1, 0.7960784, 1,
-0.05863113, 0.263593, -0.144235, 0, 1, 0.8039216, 1,
-0.0573515, 0.248538, -2.09959, 0, 1, 0.8078431, 1,
-0.05557638, -0.007633644, 0.07303572, 0, 1, 0.8156863, 1,
-0.0509999, 0.788214, 0.6991763, 0, 1, 0.8196079, 1,
-0.05073182, -0.4071167, -1.81924, 0, 1, 0.827451, 1,
-0.04931396, 0.8207618, 0.0670498, 0, 1, 0.8313726, 1,
-0.04762681, -1.362169, -2.718625, 0, 1, 0.8392157, 1,
-0.04460966, -0.2889559, -4.996111, 0, 1, 0.8431373, 1,
-0.0410312, -0.9490283, -3.911503, 0, 1, 0.8509804, 1,
-0.0401275, 0.0744803, -1.697104, 0, 1, 0.854902, 1,
-0.03946336, 0.1530961, 0.1134633, 0, 1, 0.8627451, 1,
-0.03755664, -0.009128876, -0.9454466, 0, 1, 0.8666667, 1,
-0.03668174, 1.108136, -0.7298722, 0, 1, 0.8745098, 1,
-0.03665794, 0.6694173, -0.2754549, 0, 1, 0.8784314, 1,
-0.03645674, 0.5127986, -1.9463, 0, 1, 0.8862745, 1,
-0.03611922, 1.036363, 0.4056583, 0, 1, 0.8901961, 1,
-0.03386632, 0.2186689, 0.7174142, 0, 1, 0.8980392, 1,
-0.03128747, 1.226383, 1.147632, 0, 1, 0.9058824, 1,
-0.0213671, 0.1079451, 0.2324979, 0, 1, 0.9098039, 1,
-0.01777807, -0.46986, -2.588199, 0, 1, 0.9176471, 1,
-0.0169247, -0.3649314, -2.772577, 0, 1, 0.9215686, 1,
-0.01481112, 0.1607223, 0.9654212, 0, 1, 0.9294118, 1,
-0.01206328, 0.1432415, 0.01121288, 0, 1, 0.9333333, 1,
-0.0104942, -0.6157111, -2.966239, 0, 1, 0.9411765, 1,
-0.01009555, 0.7233586, 0.5294865, 0, 1, 0.945098, 1,
-0.009308724, -0.4714092, -3.232196, 0, 1, 0.9529412, 1,
-0.0056793, -0.2419389, -4.67043, 0, 1, 0.9568627, 1,
-0.004176945, -0.4870082, -4.798878, 0, 1, 0.9647059, 1,
0.00411121, 1.760562, -0.7888045, 0, 1, 0.9686275, 1,
0.006428264, -0.7357857, 2.916, 0, 1, 0.9764706, 1,
0.00895091, 0.06236945, -0.08501044, 0, 1, 0.9803922, 1,
0.01073437, -1.961123, 1.462978, 0, 1, 0.9882353, 1,
0.01352935, -2.765245, 1.675614, 0, 1, 0.9921569, 1,
0.02096405, -2.000222, 3.880956, 0, 1, 1, 1,
0.02238268, -0.1962345, 4.677479, 0, 0.9921569, 1, 1,
0.024808, -2.282724, 1.910686, 0, 0.9882353, 1, 1,
0.02960604, -0.8523163, 5.195852, 0, 0.9803922, 1, 1,
0.03539886, 1.092229, -1.383947, 0, 0.9764706, 1, 1,
0.03637573, 0.04266527, 0.529714, 0, 0.9686275, 1, 1,
0.0377167, 1.426966, -0.4814387, 0, 0.9647059, 1, 1,
0.0409526, -0.6230517, 4.52812, 0, 0.9568627, 1, 1,
0.04406795, 0.2043577, -0.2545122, 0, 0.9529412, 1, 1,
0.04601215, -1.919291, 4.042171, 0, 0.945098, 1, 1,
0.04759447, -0.3075863, 0.8498113, 0, 0.9411765, 1, 1,
0.04780051, 2.485549, 0.7344379, 0, 0.9333333, 1, 1,
0.04900572, 0.5370471, 3.288833, 0, 0.9294118, 1, 1,
0.0532014, 0.06977188, -0.1102229, 0, 0.9215686, 1, 1,
0.0534507, -2.515597, 2.88608, 0, 0.9176471, 1, 1,
0.05434262, -1.047767, 3.034384, 0, 0.9098039, 1, 1,
0.05891778, 0.1946645, 1.335488, 0, 0.9058824, 1, 1,
0.06100938, 1.359136, 0.7326797, 0, 0.8980392, 1, 1,
0.06296363, -0.8906894, 2.636941, 0, 0.8901961, 1, 1,
0.06422498, -0.05152337, 1.481733, 0, 0.8862745, 1, 1,
0.06727378, -0.1879376, 3.993681, 0, 0.8784314, 1, 1,
0.06970481, -0.8606066, 2.730604, 0, 0.8745098, 1, 1,
0.07075357, 0.09487671, -0.4495862, 0, 0.8666667, 1, 1,
0.07144802, -1.764347, 2.594708, 0, 0.8627451, 1, 1,
0.07456358, 0.7879985, -0.6091154, 0, 0.854902, 1, 1,
0.07818662, 0.6683647, -0.08377979, 0, 0.8509804, 1, 1,
0.08009296, -0.6356159, 3.313533, 0, 0.8431373, 1, 1,
0.08121759, -1.217717, 3.918689, 0, 0.8392157, 1, 1,
0.08173298, -0.1119238, 3.069607, 0, 0.8313726, 1, 1,
0.09510303, -1.34959, 2.956403, 0, 0.827451, 1, 1,
0.09547022, 0.1235627, -0.7210117, 0, 0.8196079, 1, 1,
0.09646869, 0.5654162, 0.1556286, 0, 0.8156863, 1, 1,
0.09816942, 0.3896805, -1.129079, 0, 0.8078431, 1, 1,
0.1092312, 0.4627476, 0.158231, 0, 0.8039216, 1, 1,
0.1096202, -0.6288623, 3.363228, 0, 0.7960784, 1, 1,
0.1114119, 0.05657342, 0.6017271, 0, 0.7882353, 1, 1,
0.1132561, 1.638244, 2.00947, 0, 0.7843137, 1, 1,
0.1140139, -2.377888, 3.431163, 0, 0.7764706, 1, 1,
0.1216343, -0.09857551, 2.167532, 0, 0.772549, 1, 1,
0.1224785, 0.2720486, 0.5100299, 0, 0.7647059, 1, 1,
0.1239182, 0.06474097, 0.7778183, 0, 0.7607843, 1, 1,
0.1336481, -1.140029, 1.866185, 0, 0.7529412, 1, 1,
0.1343935, -0.5442645, 2.83519, 0, 0.7490196, 1, 1,
0.1358978, 1.965729, 0.3764034, 0, 0.7411765, 1, 1,
0.1380009, 1.507027, -0.4770295, 0, 0.7372549, 1, 1,
0.1390656, -0.2908538, 3.676233, 0, 0.7294118, 1, 1,
0.1397157, 0.3814794, 1.671946, 0, 0.7254902, 1, 1,
0.1400498, -0.687934, 1.972291, 0, 0.7176471, 1, 1,
0.1403845, 2.596158, -0.8698063, 0, 0.7137255, 1, 1,
0.1422761, -0.5294428, 3.933445, 0, 0.7058824, 1, 1,
0.1433079, 0.7038729, 0.8699427, 0, 0.6980392, 1, 1,
0.1451885, -0.1213349, 3.986777, 0, 0.6941177, 1, 1,
0.146515, 0.7011865, 0.9399724, 0, 0.6862745, 1, 1,
0.1472771, -0.09174328, 1.064326, 0, 0.682353, 1, 1,
0.1502265, 0.148851, 0.06351917, 0, 0.6745098, 1, 1,
0.1567405, -0.6251249, 1.904784, 0, 0.6705883, 1, 1,
0.1573462, -0.05316835, -0.1771892, 0, 0.6627451, 1, 1,
0.1586482, -1.321185, 1.981936, 0, 0.6588235, 1, 1,
0.1587074, -0.7121384, 1.003846, 0, 0.6509804, 1, 1,
0.1655001, -1.373858, 2.948682, 0, 0.6470588, 1, 1,
0.1674824, 1.270106, 0.623638, 0, 0.6392157, 1, 1,
0.1679751, 1.045262, -0.6299179, 0, 0.6352941, 1, 1,
0.1707973, 0.9289238, 0.8300149, 0, 0.627451, 1, 1,
0.1735248, -2.093522, 3.743703, 0, 0.6235294, 1, 1,
0.1743558, -1.635375, 4.687962, 0, 0.6156863, 1, 1,
0.1784973, -0.2809354, 2.39027, 0, 0.6117647, 1, 1,
0.1785197, 0.0837191, 0.5011076, 0, 0.6039216, 1, 1,
0.1791534, -0.8937601, 2.859184, 0, 0.5960785, 1, 1,
0.1827624, 1.597216, -1.776202, 0, 0.5921569, 1, 1,
0.184574, -0.0764102, 2.46484, 0, 0.5843138, 1, 1,
0.1854264, 0.6500018, 0.03008156, 0, 0.5803922, 1, 1,
0.1856534, -0.3818272, 1.880757, 0, 0.572549, 1, 1,
0.1872883, 1.937047, 0.1955284, 0, 0.5686275, 1, 1,
0.187308, 0.6865432, -1.944599, 0, 0.5607843, 1, 1,
0.1890981, -1.262988, 1.579382, 0, 0.5568628, 1, 1,
0.1938317, 0.8967181, -1.057956, 0, 0.5490196, 1, 1,
0.1986729, 0.5706692, -1.183961, 0, 0.5450981, 1, 1,
0.202525, -0.1921531, 2.064737, 0, 0.5372549, 1, 1,
0.2033534, 0.3858811, -1.417393, 0, 0.5333334, 1, 1,
0.2069202, -0.1654598, 2.934964, 0, 0.5254902, 1, 1,
0.2072071, -1.737995, 3.516427, 0, 0.5215687, 1, 1,
0.2125527, -1.157164, 2.667676, 0, 0.5137255, 1, 1,
0.221339, 0.5530499, 1.802502, 0, 0.509804, 1, 1,
0.2246038, 0.6325856, 1.270355, 0, 0.5019608, 1, 1,
0.2338601, 2.70962, -0.6922557, 0, 0.4941176, 1, 1,
0.2345661, -0.07885211, 2.578153, 0, 0.4901961, 1, 1,
0.2369305, -0.391585, 1.631442, 0, 0.4823529, 1, 1,
0.2397523, -0.7820027, 3.497024, 0, 0.4784314, 1, 1,
0.2455063, 0.7315359, 0.573703, 0, 0.4705882, 1, 1,
0.2466329, 1.019738, -0.204156, 0, 0.4666667, 1, 1,
0.2487577, 0.7338139, 1.083953, 0, 0.4588235, 1, 1,
0.2488879, -0.3581773, 2.745719, 0, 0.454902, 1, 1,
0.2494512, 0.1082499, 0.1497686, 0, 0.4470588, 1, 1,
0.2498426, 0.5111914, 0.1390617, 0, 0.4431373, 1, 1,
0.2541487, -1.171834, 3.710139, 0, 0.4352941, 1, 1,
0.2552277, 0.9854983, -0.1388199, 0, 0.4313726, 1, 1,
0.2573746, 0.889745, 0.1160489, 0, 0.4235294, 1, 1,
0.2578273, 0.6755641, 0.596139, 0, 0.4196078, 1, 1,
0.2579875, 0.4655493, 0.5780612, 0, 0.4117647, 1, 1,
0.258113, 1.350708, 0.3988964, 0, 0.4078431, 1, 1,
0.2616177, 0.2312345, 0.4964663, 0, 0.4, 1, 1,
0.2628651, -1.011837, 3.159023, 0, 0.3921569, 1, 1,
0.268838, 0.03047012, 0.9577475, 0, 0.3882353, 1, 1,
0.2723033, 0.3869516, 0.9627028, 0, 0.3803922, 1, 1,
0.2780522, -0.3068692, 3.19385, 0, 0.3764706, 1, 1,
0.2788185, 1.305779, -0.08381546, 0, 0.3686275, 1, 1,
0.2794564, 0.5590031, 1.451586, 0, 0.3647059, 1, 1,
0.2795506, 0.8039345, 0.2980217, 0, 0.3568628, 1, 1,
0.2827763, 1.348268, 1.027767, 0, 0.3529412, 1, 1,
0.2844691, -0.7514107, 0.981103, 0, 0.345098, 1, 1,
0.2918973, -0.289998, 1.226933, 0, 0.3411765, 1, 1,
0.2944949, 0.6014992, 2.373631, 0, 0.3333333, 1, 1,
0.3013641, 0.4772852, -0.01991981, 0, 0.3294118, 1, 1,
0.3035101, 0.3495208, 1.787408, 0, 0.3215686, 1, 1,
0.3048493, -1.204432, 4.109823, 0, 0.3176471, 1, 1,
0.3054911, -1.832143, 2.282821, 0, 0.3098039, 1, 1,
0.3065504, 0.3012133, 0.8700192, 0, 0.3058824, 1, 1,
0.3067236, -1.498019, 2.724243, 0, 0.2980392, 1, 1,
0.3147893, 2.181776, 1.136341, 0, 0.2901961, 1, 1,
0.3232739, -0.9693103, 2.232879, 0, 0.2862745, 1, 1,
0.3254131, -1.423503, 1.425207, 0, 0.2784314, 1, 1,
0.3265082, -0.4105943, 2.112866, 0, 0.2745098, 1, 1,
0.3276844, -1.209314, 2.243801, 0, 0.2666667, 1, 1,
0.3281998, 0.900275, 1.031426, 0, 0.2627451, 1, 1,
0.3288938, 0.05912827, 1.523632, 0, 0.254902, 1, 1,
0.3307045, -0.3808436, 1.646246, 0, 0.2509804, 1, 1,
0.332587, 0.5708638, 2.17743, 0, 0.2431373, 1, 1,
0.3360613, 0.8211601, 0.3359701, 0, 0.2392157, 1, 1,
0.3407578, 0.0266443, 1.252714, 0, 0.2313726, 1, 1,
0.3408155, 0.1357839, 0.162886, 0, 0.227451, 1, 1,
0.3466865, -1.65724, 4.15116, 0, 0.2196078, 1, 1,
0.3502754, -0.7356709, 0.7348675, 0, 0.2156863, 1, 1,
0.3524253, 0.2536972, 0.9686683, 0, 0.2078431, 1, 1,
0.3529168, -0.05680384, 2.117836, 0, 0.2039216, 1, 1,
0.3588568, 1.162986, 1.332534, 0, 0.1960784, 1, 1,
0.3624999, -0.4333889, 0.8656427, 0, 0.1882353, 1, 1,
0.3636075, -0.7495148, 0.6832159, 0, 0.1843137, 1, 1,
0.3636793, -1.987253, 2.965075, 0, 0.1764706, 1, 1,
0.3650371, -0.3737181, 2.48061, 0, 0.172549, 1, 1,
0.3663522, -0.2090289, 1.962235, 0, 0.1647059, 1, 1,
0.369767, -0.8203818, 2.985166, 0, 0.1607843, 1, 1,
0.3708994, -1.471668, 3.51844, 0, 0.1529412, 1, 1,
0.3710475, 0.0525468, 2.745675, 0, 0.1490196, 1, 1,
0.3741368, -0.3380913, 2.540188, 0, 0.1411765, 1, 1,
0.3790032, -0.3083746, 2.152997, 0, 0.1372549, 1, 1,
0.3795365, -0.7336621, 2.899573, 0, 0.1294118, 1, 1,
0.3801513, -0.7741431, 3.718487, 0, 0.1254902, 1, 1,
0.3811302, 0.2831824, 1.44923, 0, 0.1176471, 1, 1,
0.3822759, -0.6155482, 2.313978, 0, 0.1137255, 1, 1,
0.383881, -0.9905261, 0.7279997, 0, 0.1058824, 1, 1,
0.3863015, 0.3219467, 2.777825, 0, 0.09803922, 1, 1,
0.3898963, 0.4563495, 0.349201, 0, 0.09411765, 1, 1,
0.3940804, 0.8226281, 1.336056, 0, 0.08627451, 1, 1,
0.3951101, 0.7029893, 1.23667, 0, 0.08235294, 1, 1,
0.3981113, -0.4252828, 2.969741, 0, 0.07450981, 1, 1,
0.4006303, -0.3726349, 3.413207, 0, 0.07058824, 1, 1,
0.4038314, 0.2950644, 2.617672, 0, 0.0627451, 1, 1,
0.4049599, -1.026902, 4.250611, 0, 0.05882353, 1, 1,
0.406004, 0.8282287, 1.387681, 0, 0.05098039, 1, 1,
0.4099047, -0.5690238, 2.327657, 0, 0.04705882, 1, 1,
0.4145769, -0.5369281, 1.944519, 0, 0.03921569, 1, 1,
0.4172731, -0.8005754, 2.766589, 0, 0.03529412, 1, 1,
0.4259237, -0.02719874, 2.279643, 0, 0.02745098, 1, 1,
0.4270206, -0.1670482, 1.454218, 0, 0.02352941, 1, 1,
0.4273773, 2.480415, -1.220482, 0, 0.01568628, 1, 1,
0.4274184, -2.102119, 2.614305, 0, 0.01176471, 1, 1,
0.4275554, 0.9184511, 0.8982952, 0, 0.003921569, 1, 1,
0.4281366, 0.1213733, 2.374068, 0.003921569, 0, 1, 1,
0.4339747, 1.468849, -0.8334873, 0.007843138, 0, 1, 1,
0.4350865, 0.6163759, -0.155906, 0.01568628, 0, 1, 1,
0.4353906, -0.2602194, 3.294498, 0.01960784, 0, 1, 1,
0.4360184, 0.6275136, 0.599802, 0.02745098, 0, 1, 1,
0.4364578, -0.08271647, 1.635641, 0.03137255, 0, 1, 1,
0.4378266, -1.105991, 0.5373791, 0.03921569, 0, 1, 1,
0.4407401, 0.2210481, 0.8131146, 0.04313726, 0, 1, 1,
0.4442844, 0.4825291, 1.454089, 0.05098039, 0, 1, 1,
0.4468525, 1.982097, 1.417872, 0.05490196, 0, 1, 1,
0.4508337, 0.3635613, 1.634333, 0.0627451, 0, 1, 1,
0.4562947, 0.9701051, 0.2459671, 0.06666667, 0, 1, 1,
0.4574079, 1.101431, 0.3473998, 0.07450981, 0, 1, 1,
0.4603835, 0.1466985, 1.315439, 0.07843138, 0, 1, 1,
0.4610822, 0.8034294, 1.141559, 0.08627451, 0, 1, 1,
0.4638401, -0.8821611, 2.917123, 0.09019608, 0, 1, 1,
0.4643362, -0.2462822, 2.283257, 0.09803922, 0, 1, 1,
0.4659894, 0.5399514, 0.1724877, 0.1058824, 0, 1, 1,
0.4674071, 1.752667, 1.071894, 0.1098039, 0, 1, 1,
0.4731036, 1.169869, -0.02746768, 0.1176471, 0, 1, 1,
0.4735229, -1.098991, 3.147095, 0.1215686, 0, 1, 1,
0.4794046, 0.5406135, 0.4614763, 0.1294118, 0, 1, 1,
0.480356, 0.607723, 1.050919, 0.1333333, 0, 1, 1,
0.4844846, 0.8162332, 1.293977, 0.1411765, 0, 1, 1,
0.4903715, -0.4826024, 2.961892, 0.145098, 0, 1, 1,
0.4932875, -1.423317, 4.38065, 0.1529412, 0, 1, 1,
0.4962003, 0.747767, -2.417245, 0.1568628, 0, 1, 1,
0.5023689, -0.520144, 0.4632826, 0.1647059, 0, 1, 1,
0.5061406, 0.2559199, -0.1606875, 0.1686275, 0, 1, 1,
0.5080252, -0.099118, 1.504057, 0.1764706, 0, 1, 1,
0.509442, 1.260417, 0.6469864, 0.1803922, 0, 1, 1,
0.5113817, -0.5810525, 4.862069, 0.1882353, 0, 1, 1,
0.5128871, -0.5058895, 2.611459, 0.1921569, 0, 1, 1,
0.5132557, 0.4194781, 1.739459, 0.2, 0, 1, 1,
0.516673, 0.3603526, -0.1586145, 0.2078431, 0, 1, 1,
0.5181293, 0.5670239, 0.9785603, 0.2117647, 0, 1, 1,
0.5190758, -0.5121992, 1.474675, 0.2196078, 0, 1, 1,
0.5210198, -0.2735834, 0.8148636, 0.2235294, 0, 1, 1,
0.5230112, 0.1039833, 1.997751, 0.2313726, 0, 1, 1,
0.5262086, -1.310539, 1.601372, 0.2352941, 0, 1, 1,
0.527721, 0.7607896, 0.8658721, 0.2431373, 0, 1, 1,
0.5295473, -0.1031591, 1.654243, 0.2470588, 0, 1, 1,
0.53078, 0.0007728186, 2.088231, 0.254902, 0, 1, 1,
0.5345199, 1.215329, 0.4719354, 0.2588235, 0, 1, 1,
0.536484, 0.2830422, 0.1897781, 0.2666667, 0, 1, 1,
0.5371723, 0.2102185, 1.26151, 0.2705882, 0, 1, 1,
0.5458968, -1.204087, 3.332488, 0.2784314, 0, 1, 1,
0.546237, 0.7979096, -0.03555846, 0.282353, 0, 1, 1,
0.5476156, 1.184609, 0.7044182, 0.2901961, 0, 1, 1,
0.5549666, -1.098058, 4.22307, 0.2941177, 0, 1, 1,
0.5583436, 1.428035, -0.1444032, 0.3019608, 0, 1, 1,
0.5585141, -0.2196782, 1.849028, 0.3098039, 0, 1, 1,
0.5612521, -0.3895116, 1.682214, 0.3137255, 0, 1, 1,
0.5650271, 2.513904, -1.119177, 0.3215686, 0, 1, 1,
0.5673687, 0.9808714, 0.1890921, 0.3254902, 0, 1, 1,
0.5680352, 0.06879241, 3.082755, 0.3333333, 0, 1, 1,
0.5699252, 0.2185476, -0.1851806, 0.3372549, 0, 1, 1,
0.5746402, -0.261693, 3.639152, 0.345098, 0, 1, 1,
0.5777842, -1.830168, 4.110099, 0.3490196, 0, 1, 1,
0.5802764, 0.8959842, -0.5083891, 0.3568628, 0, 1, 1,
0.5814805, -0.0788058, 0.118274, 0.3607843, 0, 1, 1,
0.5827411, 0.1598754, 3.001746, 0.3686275, 0, 1, 1,
0.583262, 0.214733, 3.548177, 0.372549, 0, 1, 1,
0.5841286, -1.03352, 2.12793, 0.3803922, 0, 1, 1,
0.5912529, -0.9139247, -0.2466863, 0.3843137, 0, 1, 1,
0.5923704, 0.9824542, 0.0102622, 0.3921569, 0, 1, 1,
0.5954908, -1.87447, 3.848871, 0.3960784, 0, 1, 1,
0.5988639, -0.4333706, 3.267309, 0.4039216, 0, 1, 1,
0.6010658, -1.112666, 1.785785, 0.4117647, 0, 1, 1,
0.6014842, 0.7292187, 2.091331, 0.4156863, 0, 1, 1,
0.6018921, -0.1075537, 1.989157, 0.4235294, 0, 1, 1,
0.6032426, -0.4411211, 2.972696, 0.427451, 0, 1, 1,
0.6041123, 0.6075895, 0.04357943, 0.4352941, 0, 1, 1,
0.6099546, -0.31695, 3.002763, 0.4392157, 0, 1, 1,
0.6108094, -0.6098577, 3.066367, 0.4470588, 0, 1, 1,
0.6141912, 0.5851228, 0.8582909, 0.4509804, 0, 1, 1,
0.618876, 0.1906551, -0.004916177, 0.4588235, 0, 1, 1,
0.6199669, -1.674227, 4.210063, 0.4627451, 0, 1, 1,
0.6236281, -1.070735, 1.631956, 0.4705882, 0, 1, 1,
0.6280641, 1.634832, 1.944168, 0.4745098, 0, 1, 1,
0.6287759, 0.3453133, 1.899287, 0.4823529, 0, 1, 1,
0.6317966, 1.012433, 3.002423, 0.4862745, 0, 1, 1,
0.6328117, 1.676366, -0.3137799, 0.4941176, 0, 1, 1,
0.6338121, 0.5130429, 1.178837, 0.5019608, 0, 1, 1,
0.6350953, 2.066314, 1.181852, 0.5058824, 0, 1, 1,
0.6396828, -0.4587962, 2.314182, 0.5137255, 0, 1, 1,
0.6434183, 1.369236, 0.9640962, 0.5176471, 0, 1, 1,
0.6547009, -0.04814696, 3.828184, 0.5254902, 0, 1, 1,
0.6558863, -0.5368275, 1.424042, 0.5294118, 0, 1, 1,
0.6567287, 0.2382744, -1.067413, 0.5372549, 0, 1, 1,
0.6568866, 2.260466, -0.05654498, 0.5411765, 0, 1, 1,
0.6642951, 0.8633935, 1.170619, 0.5490196, 0, 1, 1,
0.6752331, -0.7468325, 2.886088, 0.5529412, 0, 1, 1,
0.6767138, -0.7144645, 1.607259, 0.5607843, 0, 1, 1,
0.6775841, 0.3673895, 1.424208, 0.5647059, 0, 1, 1,
0.6776116, 0.2773259, 0.2091561, 0.572549, 0, 1, 1,
0.6842241, 2.234521, 0.2546971, 0.5764706, 0, 1, 1,
0.6847621, -0.2933085, 2.399391, 0.5843138, 0, 1, 1,
0.6923781, -1.045424, 4.721847, 0.5882353, 0, 1, 1,
0.6944527, 0.2662889, 1.279763, 0.5960785, 0, 1, 1,
0.6983529, -1.681557, 4.434767, 0.6039216, 0, 1, 1,
0.6996675, 0.3332108, 1.854942, 0.6078432, 0, 1, 1,
0.7068416, 0.003677531, 2.432198, 0.6156863, 0, 1, 1,
0.7076846, -0.02090305, 2.209611, 0.6196079, 0, 1, 1,
0.71071, 0.1537456, 1.393656, 0.627451, 0, 1, 1,
0.7167009, -0.3470796, 1.387244, 0.6313726, 0, 1, 1,
0.7236563, 2.389165, 0.2479075, 0.6392157, 0, 1, 1,
0.7243447, 1.007894, 0.3649863, 0.6431373, 0, 1, 1,
0.7245397, 0.2763954, 0.7610971, 0.6509804, 0, 1, 1,
0.7249866, 0.1670698, 2.178417, 0.654902, 0, 1, 1,
0.732644, 1.677014, -0.05867247, 0.6627451, 0, 1, 1,
0.7388139, -0.1902779, 3.037062, 0.6666667, 0, 1, 1,
0.7405716, -1.992033, 3.054261, 0.6745098, 0, 1, 1,
0.7464818, 0.09132157, 4.034338, 0.6784314, 0, 1, 1,
0.746555, 1.62386, 1.181459, 0.6862745, 0, 1, 1,
0.7669584, 0.3805197, 1.809505, 0.6901961, 0, 1, 1,
0.7692446, -0.1045031, 0.2988973, 0.6980392, 0, 1, 1,
0.7695534, 0.6094404, 1.448534, 0.7058824, 0, 1, 1,
0.7708951, -0.533107, 3.752416, 0.7098039, 0, 1, 1,
0.7714074, -0.003015219, 1.046105, 0.7176471, 0, 1, 1,
0.7732427, 0.6445136, 0.1928786, 0.7215686, 0, 1, 1,
0.7733, -2.150506, 3.808005, 0.7294118, 0, 1, 1,
0.7786598, -0.4019894, 1.634239, 0.7333333, 0, 1, 1,
0.7826332, -0.1157623, 0.1641728, 0.7411765, 0, 1, 1,
0.7856854, -1.159502, 0.3850198, 0.7450981, 0, 1, 1,
0.787002, 0.6723287, 0.8609242, 0.7529412, 0, 1, 1,
0.7880163, 0.272529, 0.5311935, 0.7568628, 0, 1, 1,
0.7909326, 1.038158, 2.296641, 0.7647059, 0, 1, 1,
0.7914019, 0.3447286, 1.037466, 0.7686275, 0, 1, 1,
0.7935919, 1.525998, 1.087053, 0.7764706, 0, 1, 1,
0.7991908, -1.199013, 2.400595, 0.7803922, 0, 1, 1,
0.8049574, -1.512576, 3.931358, 0.7882353, 0, 1, 1,
0.8073282, -0.7053034, 2.349534, 0.7921569, 0, 1, 1,
0.8132635, 0.9098164, 0.1270896, 0.8, 0, 1, 1,
0.8195349, -0.2892783, 0.1418696, 0.8078431, 0, 1, 1,
0.8198689, -0.2709714, 0.4910945, 0.8117647, 0, 1, 1,
0.8231258, 0.4470306, 1.916326, 0.8196079, 0, 1, 1,
0.8268047, 1.242686, 1.282626, 0.8235294, 0, 1, 1,
0.8306776, -0.3828421, 3.909751, 0.8313726, 0, 1, 1,
0.8381583, -0.4236476, 1.134739, 0.8352941, 0, 1, 1,
0.8381899, -0.06551088, 1.555036, 0.8431373, 0, 1, 1,
0.8382527, 1.429309, 0.9140971, 0.8470588, 0, 1, 1,
0.8389058, 0.2834401, -0.1633714, 0.854902, 0, 1, 1,
0.8414038, 0.1229917, 2.779967, 0.8588235, 0, 1, 1,
0.8541417, -1.931112, 3.227608, 0.8666667, 0, 1, 1,
0.8553649, 0.462449, 0.9585548, 0.8705882, 0, 1, 1,
0.8559327, -1.342684, 2.830691, 0.8784314, 0, 1, 1,
0.8565981, 0.2930917, 0.8241022, 0.8823529, 0, 1, 1,
0.8569962, 0.4403014, 1.608891, 0.8901961, 0, 1, 1,
0.859717, 1.649314, 0.1445623, 0.8941177, 0, 1, 1,
0.8683891, 1.15276, 1.189078, 0.9019608, 0, 1, 1,
0.8727847, -0.5335529, 1.58379, 0.9098039, 0, 1, 1,
0.8731336, -0.4107141, 1.593469, 0.9137255, 0, 1, 1,
0.8746676, 0.4337639, 2.331044, 0.9215686, 0, 1, 1,
0.877332, -1.007583, 1.206388, 0.9254902, 0, 1, 1,
0.8793281, 0.8268443, 1.150923, 0.9333333, 0, 1, 1,
0.8800471, 1.645364, 1.541277, 0.9372549, 0, 1, 1,
0.8858255, -0.5154822, 1.186782, 0.945098, 0, 1, 1,
0.8890768, -0.4599726, 2.240524, 0.9490196, 0, 1, 1,
0.8902, -0.2007276, 0.5358222, 0.9568627, 0, 1, 1,
0.891014, 0.8103431, 0.2582957, 0.9607843, 0, 1, 1,
0.8997437, -0.4476604, 1.218789, 0.9686275, 0, 1, 1,
0.9027982, 1.01937, 1.372556, 0.972549, 0, 1, 1,
0.9033332, 1.596173, -0.3648304, 0.9803922, 0, 1, 1,
0.9120111, 0.8003402, 2.103826, 0.9843137, 0, 1, 1,
0.9237214, 0.3193807, 0.2939912, 0.9921569, 0, 1, 1,
0.924377, 1.19955, 1.547298, 0.9960784, 0, 1, 1,
0.9314497, 0.2569179, 0.9295189, 1, 0, 0.9960784, 1,
0.9319837, 1.305379, 0.3406793, 1, 0, 0.9882353, 1,
0.9372507, 0.1958145, -0.4245302, 1, 0, 0.9843137, 1,
0.9386635, -0.5675054, 1.79314, 1, 0, 0.9764706, 1,
0.9422653, 0.3010961, 1.07067, 1, 0, 0.972549, 1,
0.9447232, -0.9764364, 3.400704, 1, 0, 0.9647059, 1,
0.9472239, -0.8786335, 3.069066, 1, 0, 0.9607843, 1,
0.9487236, 0.6620225, 1.83023, 1, 0, 0.9529412, 1,
0.9552643, -0.4202012, -0.9232923, 1, 0, 0.9490196, 1,
0.9576015, -1.092896, 2.135352, 1, 0, 0.9411765, 1,
0.958834, -1.269372, 2.420166, 1, 0, 0.9372549, 1,
0.9642889, 1.093599, -0.1216829, 1, 0, 0.9294118, 1,
0.9713302, -0.684063, 0.1733337, 1, 0, 0.9254902, 1,
0.9734723, -1.402032, 3.339874, 1, 0, 0.9176471, 1,
0.974129, 1.742355, 0.3704386, 1, 0, 0.9137255, 1,
0.9789328, -0.230723, 2.949561, 1, 0, 0.9058824, 1,
0.980009, -2.22009, 3.218933, 1, 0, 0.9019608, 1,
0.9840282, -0.4363376, 2.944822, 1, 0, 0.8941177, 1,
0.987394, 0.1850336, -0.05679708, 1, 0, 0.8862745, 1,
0.9994917, 0.2857959, 3.424421, 1, 0, 0.8823529, 1,
0.9996049, 1.980187, -0.5614592, 1, 0, 0.8745098, 1,
1.009088, -2.148639, 3.297287, 1, 0, 0.8705882, 1,
1.013426, -2.69248, 3.145213, 1, 0, 0.8627451, 1,
1.016033, -0.3792755, 0.4563169, 1, 0, 0.8588235, 1,
1.02241, 0.09329845, 2.38724, 1, 0, 0.8509804, 1,
1.02395, 1.732404, 0.3309825, 1, 0, 0.8470588, 1,
1.028564, 0.7988604, 1.324203, 1, 0, 0.8392157, 1,
1.052132, 0.8086656, -0.1704703, 1, 0, 0.8352941, 1,
1.058051, -0.1947875, 1.66446, 1, 0, 0.827451, 1,
1.060586, 1.291412, 0.2696823, 1, 0, 0.8235294, 1,
1.061525, -2.136488, 2.76588, 1, 0, 0.8156863, 1,
1.061996, 1.917724, 0.9237753, 1, 0, 0.8117647, 1,
1.073149, 0.6986396, -1.028527, 1, 0, 0.8039216, 1,
1.074679, -0.1511625, 2.798193, 1, 0, 0.7960784, 1,
1.083844, 0.4463191, 1.472908, 1, 0, 0.7921569, 1,
1.090069, -0.3369267, 2.6449, 1, 0, 0.7843137, 1,
1.093732, 1.144207, 0.9200846, 1, 0, 0.7803922, 1,
1.103384, 1.493319, 2.703461, 1, 0, 0.772549, 1,
1.106578, 1.893802, 0.9098822, 1, 0, 0.7686275, 1,
1.112041, -1.274521, 2.716889, 1, 0, 0.7607843, 1,
1.114299, 1.487261, 0.3199064, 1, 0, 0.7568628, 1,
1.11861, -0.8392223, 1.83044, 1, 0, 0.7490196, 1,
1.129418, 0.4392899, 0.09267783, 1, 0, 0.7450981, 1,
1.139472, 3.099205, 1.078068, 1, 0, 0.7372549, 1,
1.139913, 0.271143, 1.153463, 1, 0, 0.7333333, 1,
1.145294, 0.6631933, 0.8942249, 1, 0, 0.7254902, 1,
1.149166, -0.04813759, -0.1850082, 1, 0, 0.7215686, 1,
1.156215, 0.680356, 0.6549557, 1, 0, 0.7137255, 1,
1.157087, 0.8538538, 0.9418938, 1, 0, 0.7098039, 1,
1.16847, -1.778002, 2.776025, 1, 0, 0.7019608, 1,
1.168787, -0.3080941, 2.033017, 1, 0, 0.6941177, 1,
1.178385, -0.1542952, 0.7194279, 1, 0, 0.6901961, 1,
1.1858, 0.3644715, 2.076089, 1, 0, 0.682353, 1,
1.197959, -0.5989032, 2.768787, 1, 0, 0.6784314, 1,
1.199371, 2.479254, 1.015873, 1, 0, 0.6705883, 1,
1.204013, -0.612776, 3.170405, 1, 0, 0.6666667, 1,
1.207823, -0.4307533, 2.106234, 1, 0, 0.6588235, 1,
1.208792, 0.6800004, -0.3635301, 1, 0, 0.654902, 1,
1.21698, -0.3010372, 1.461536, 1, 0, 0.6470588, 1,
1.217971, -1.235068, 2.693357, 1, 0, 0.6431373, 1,
1.220622, 0.5831825, -0.4362765, 1, 0, 0.6352941, 1,
1.221047, 1.260737, -1.265917, 1, 0, 0.6313726, 1,
1.222134, 0.369056, 0.7293776, 1, 0, 0.6235294, 1,
1.227463, 0.4480886, 0.6963108, 1, 0, 0.6196079, 1,
1.231242, 0.8270518, 1.207493, 1, 0, 0.6117647, 1,
1.232289, -0.9263781, 2.362704, 1, 0, 0.6078432, 1,
1.238929, -0.7802263, 0.5476785, 1, 0, 0.6, 1,
1.245305, -0.9258115, 1.61282, 1, 0, 0.5921569, 1,
1.247827, -1.106602, 2.933182, 1, 0, 0.5882353, 1,
1.253114, 1.043454, 1.593831, 1, 0, 0.5803922, 1,
1.254994, -0.1093595, 3.548602, 1, 0, 0.5764706, 1,
1.261798, 0.7453758, 2.019139, 1, 0, 0.5686275, 1,
1.273795, -1.39359, 3.026499, 1, 0, 0.5647059, 1,
1.277131, 1.349071, 1.307319, 1, 0, 0.5568628, 1,
1.280987, -0.5425844, 2.388119, 1, 0, 0.5529412, 1,
1.282038, 0.5390526, 1.700658, 1, 0, 0.5450981, 1,
1.292542, 1.012342, 1.071461, 1, 0, 0.5411765, 1,
1.297522, -0.8895298, 1.598817, 1, 0, 0.5333334, 1,
1.301821, -0.07702558, 1.912402, 1, 0, 0.5294118, 1,
1.303876, -0.742483, 2.522483, 1, 0, 0.5215687, 1,
1.307356, 0.05579602, 1.559286, 1, 0, 0.5176471, 1,
1.316974, 1.315909, 2.339869, 1, 0, 0.509804, 1,
1.327804, -1.555584, 3.129235, 1, 0, 0.5058824, 1,
1.334998, 1.274556, 0.4811266, 1, 0, 0.4980392, 1,
1.337793, 0.2093234, 0.9508209, 1, 0, 0.4901961, 1,
1.339459, -0.2597775, 1.592521, 1, 0, 0.4862745, 1,
1.348549, 1.9802, -0.8618436, 1, 0, 0.4784314, 1,
1.350842, -0.4556363, 2.647507, 1, 0, 0.4745098, 1,
1.357666, 0.3065304, 2.384877, 1, 0, 0.4666667, 1,
1.358976, -1.457743, 3.047769, 1, 0, 0.4627451, 1,
1.366361, -1.282154, 2.63057, 1, 0, 0.454902, 1,
1.368618, 0.1582863, 0.3153404, 1, 0, 0.4509804, 1,
1.370499, -0.02058803, 1.003953, 1, 0, 0.4431373, 1,
1.373712, 0.81593, 3.032125, 1, 0, 0.4392157, 1,
1.375918, 1.244946, 0.4596621, 1, 0, 0.4313726, 1,
1.383726, -0.3399143, 2.630424, 1, 0, 0.427451, 1,
1.389468, -0.7267991, 0.853736, 1, 0, 0.4196078, 1,
1.400393, -0.5852396, 2.389032, 1, 0, 0.4156863, 1,
1.422341, -0.6382747, 3.486483, 1, 0, 0.4078431, 1,
1.439817, -0.04884168, 1.290634, 1, 0, 0.4039216, 1,
1.440037, 0.3690744, 1.699147, 1, 0, 0.3960784, 1,
1.440334, 0.3619687, 1.668828, 1, 0, 0.3882353, 1,
1.461333, -0.2941695, 2.329594, 1, 0, 0.3843137, 1,
1.462036, 0.708314, 0.8386714, 1, 0, 0.3764706, 1,
1.465208, -0.9652663, 3.299984, 1, 0, 0.372549, 1,
1.466802, -0.7733414, 1.497258, 1, 0, 0.3647059, 1,
1.470736, -1.31163, 2.184862, 1, 0, 0.3607843, 1,
1.484349, -0.7751431, 1.124895, 1, 0, 0.3529412, 1,
1.488443, -0.5702149, 0.862703, 1, 0, 0.3490196, 1,
1.497095, -1.36997, 1.634827, 1, 0, 0.3411765, 1,
1.509812, 0.8417343, -0.6094449, 1, 0, 0.3372549, 1,
1.530531, 1.345123, 1.448518, 1, 0, 0.3294118, 1,
1.549954, -2.31512, 1.508386, 1, 0, 0.3254902, 1,
1.550616, -0.5846717, -1.333609, 1, 0, 0.3176471, 1,
1.556194, -0.5389972, 3.002681, 1, 0, 0.3137255, 1,
1.574141, 0.08235241, 1.198539, 1, 0, 0.3058824, 1,
1.578885, -0.12289, 0.8125713, 1, 0, 0.2980392, 1,
1.602756, 0.06363701, 1.442747, 1, 0, 0.2941177, 1,
1.606589, -1.670416, 2.772431, 1, 0, 0.2862745, 1,
1.607864, -0.6287374, 1.083522, 1, 0, 0.282353, 1,
1.61239, 0.5004278, 0.7473916, 1, 0, 0.2745098, 1,
1.624119, 0.9726339, 1.282127, 1, 0, 0.2705882, 1,
1.648917, 0.3726641, 0.3215398, 1, 0, 0.2627451, 1,
1.682939, -0.5313168, 2.508882, 1, 0, 0.2588235, 1,
1.697187, -0.7476005, 1.419965, 1, 0, 0.2509804, 1,
1.700846, 0.09153023, 2.838159, 1, 0, 0.2470588, 1,
1.705282, -0.9877039, -0.7356926, 1, 0, 0.2392157, 1,
1.728343, 1.106905, 1.070128, 1, 0, 0.2352941, 1,
1.732675, 1.303187, -1.026438, 1, 0, 0.227451, 1,
1.746708, 1.262558, -1.507379, 1, 0, 0.2235294, 1,
1.756459, 0.1722931, 2.341455, 1, 0, 0.2156863, 1,
1.773415, -0.1789127, 1.938289, 1, 0, 0.2117647, 1,
1.78718, 0.3880924, 2.703875, 1, 0, 0.2039216, 1,
1.814565, -2.315199, 3.147545, 1, 0, 0.1960784, 1,
1.828529, -0.03517706, 1.084708, 1, 0, 0.1921569, 1,
1.84429, -0.5384427, 0.946922, 1, 0, 0.1843137, 1,
1.864475, -1.070529, 2.062456, 1, 0, 0.1803922, 1,
1.876552, 0.8393217, 2.166822, 1, 0, 0.172549, 1,
1.898796, 1.507386, 0.8101755, 1, 0, 0.1686275, 1,
1.943144, -1.106578, 1.58132, 1, 0, 0.1607843, 1,
1.970131, -0.9773288, 1.757037, 1, 0, 0.1568628, 1,
1.988692, -0.1357732, 0.3200038, 1, 0, 0.1490196, 1,
2.00406, -1.476701, 2.013651, 1, 0, 0.145098, 1,
2.01408, -1.716717, 0.9731936, 1, 0, 0.1372549, 1,
2.023741, 1.588257, 0.8048651, 1, 0, 0.1333333, 1,
2.025886, -1.017452, 0.7936853, 1, 0, 0.1254902, 1,
2.064916, 0.1040328, 3.118442, 1, 0, 0.1215686, 1,
2.179701, 0.2181714, 1.45859, 1, 0, 0.1137255, 1,
2.211081, 1.176887, 1.390514, 1, 0, 0.1098039, 1,
2.220214, -0.8644902, 0.3263974, 1, 0, 0.1019608, 1,
2.231076, 1.248663, 2.18016, 1, 0, 0.09411765, 1,
2.238042, -0.6432337, 1.331517, 1, 0, 0.09019608, 1,
2.250004, 0.4678733, -0.2669764, 1, 0, 0.08235294, 1,
2.269941, -1.640407, 0.696578, 1, 0, 0.07843138, 1,
2.335846, 1.449405, -0.5162027, 1, 0, 0.07058824, 1,
2.349677, -1.086445, 3.788087, 1, 0, 0.06666667, 1,
2.371728, -0.8364639, 1.499167, 1, 0, 0.05882353, 1,
2.430582, 0.6463274, 0.961233, 1, 0, 0.05490196, 1,
2.439838, 0.4407364, 0.7397494, 1, 0, 0.04705882, 1,
2.481714, -0.2737212, 1.729638, 1, 0, 0.04313726, 1,
2.552228, 0.355564, 1.655651, 1, 0, 0.03529412, 1,
2.725395, 0.1045773, 1.440616, 1, 0, 0.03137255, 1,
2.800216, 1.029049, 1.454478, 1, 0, 0.02352941, 1,
2.873526, -0.6711919, 1.636391, 1, 0, 0.01960784, 1,
3.123704, -0.9363744, 2.748153, 1, 0, 0.01176471, 1,
3.641947, -0.1725105, 0.5079138, 1, 0, 0.007843138, 1
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
0.04832888, -3.761467, -7.791758, 0, -0.5, 0.5, 0.5,
0.04832888, -3.761467, -7.791758, 1, -0.5, 0.5, 0.5,
0.04832888, -3.761467, -7.791758, 1, 1.5, 0.5, 0.5,
0.04832888, -3.761467, -7.791758, 0, 1.5, 0.5, 0.5
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
-4.763526, 0.1734601, -7.791758, 0, -0.5, 0.5, 0.5,
-4.763526, 0.1734601, -7.791758, 1, -0.5, 0.5, 0.5,
-4.763526, 0.1734601, -7.791758, 1, 1.5, 0.5, 0.5,
-4.763526, 0.1734601, -7.791758, 0, 1.5, 0.5, 0.5
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
-4.763526, -3.761467, -0.3567812, 0, -0.5, 0.5, 0.5,
-4.763526, -3.761467, -0.3567812, 1, -0.5, 0.5, 0.5,
-4.763526, -3.761467, -0.3567812, 1, 1.5, 0.5, 0.5,
-4.763526, -3.761467, -0.3567812, 0, 1.5, 0.5, 0.5
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
-2, -2.853407, -6.075994,
2, -2.853407, -6.075994,
-2, -2.853407, -6.075994,
-2, -3.00475, -6.361954,
0, -2.853407, -6.075994,
0, -3.00475, -6.361954,
2, -2.853407, -6.075994,
2, -3.00475, -6.361954
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
-2, -3.307437, -6.933876, 0, -0.5, 0.5, 0.5,
-2, -3.307437, -6.933876, 1, -0.5, 0.5, 0.5,
-2, -3.307437, -6.933876, 1, 1.5, 0.5, 0.5,
-2, -3.307437, -6.933876, 0, 1.5, 0.5, 0.5,
0, -3.307437, -6.933876, 0, -0.5, 0.5, 0.5,
0, -3.307437, -6.933876, 1, -0.5, 0.5, 0.5,
0, -3.307437, -6.933876, 1, 1.5, 0.5, 0.5,
0, -3.307437, -6.933876, 0, 1.5, 0.5, 0.5,
2, -3.307437, -6.933876, 0, -0.5, 0.5, 0.5,
2, -3.307437, -6.933876, 1, -0.5, 0.5, 0.5,
2, -3.307437, -6.933876, 1, 1.5, 0.5, 0.5,
2, -3.307437, -6.933876, 0, 1.5, 0.5, 0.5
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
-3.653098, -2, -6.075994,
-3.653098, 3, -6.075994,
-3.653098, -2, -6.075994,
-3.838169, -2, -6.361954,
-3.653098, -1, -6.075994,
-3.838169, -1, -6.361954,
-3.653098, 0, -6.075994,
-3.838169, 0, -6.361954,
-3.653098, 1, -6.075994,
-3.838169, 1, -6.361954,
-3.653098, 2, -6.075994,
-3.838169, 2, -6.361954,
-3.653098, 3, -6.075994,
-3.838169, 3, -6.361954
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
-4.208312, -2, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, -2, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, -2, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, -2, -6.933876, 0, 1.5, 0.5, 0.5,
-4.208312, -1, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, -1, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, -1, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, -1, -6.933876, 0, 1.5, 0.5, 0.5,
-4.208312, 0, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, 0, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, 0, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, 0, -6.933876, 0, 1.5, 0.5, 0.5,
-4.208312, 1, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, 1, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, 1, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, 1, -6.933876, 0, 1.5, 0.5, 0.5,
-4.208312, 2, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, 2, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, 2, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, 2, -6.933876, 0, 1.5, 0.5, 0.5,
-4.208312, 3, -6.933876, 0, -0.5, 0.5, 0.5,
-4.208312, 3, -6.933876, 1, -0.5, 0.5, 0.5,
-4.208312, 3, -6.933876, 1, 1.5, 0.5, 0.5,
-4.208312, 3, -6.933876, 0, 1.5, 0.5, 0.5
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
-3.653098, -2.853407, -4,
-3.653098, -2.853407, 4,
-3.653098, -2.853407, -4,
-3.838169, -3.00475, -4,
-3.653098, -2.853407, -2,
-3.838169, -3.00475, -2,
-3.653098, -2.853407, 0,
-3.838169, -3.00475, 0,
-3.653098, -2.853407, 2,
-3.838169, -3.00475, 2,
-3.653098, -2.853407, 4,
-3.838169, -3.00475, 4
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
-4.208312, -3.307437, -4, 0, -0.5, 0.5, 0.5,
-4.208312, -3.307437, -4, 1, -0.5, 0.5, 0.5,
-4.208312, -3.307437, -4, 1, 1.5, 0.5, 0.5,
-4.208312, -3.307437, -4, 0, 1.5, 0.5, 0.5,
-4.208312, -3.307437, -2, 0, -0.5, 0.5, 0.5,
-4.208312, -3.307437, -2, 1, -0.5, 0.5, 0.5,
-4.208312, -3.307437, -2, 1, 1.5, 0.5, 0.5,
-4.208312, -3.307437, -2, 0, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 0, 0, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 0, 1, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 0, 1, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 0, 0, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 2, 0, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 2, 1, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 2, 1, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 2, 0, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 4, 0, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 4, 1, -0.5, 0.5, 0.5,
-4.208312, -3.307437, 4, 1, 1.5, 0.5, 0.5,
-4.208312, -3.307437, 4, 0, 1.5, 0.5, 0.5
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
-3.653098, -2.853407, -6.075994,
-3.653098, 3.200327, -6.075994,
-3.653098, -2.853407, 5.362431,
-3.653098, 3.200327, 5.362431,
-3.653098, -2.853407, -6.075994,
-3.653098, -2.853407, 5.362431,
-3.653098, 3.200327, -6.075994,
-3.653098, 3.200327, 5.362431,
-3.653098, -2.853407, -6.075994,
3.749756, -2.853407, -6.075994,
-3.653098, -2.853407, 5.362431,
3.749756, -2.853407, 5.362431,
-3.653098, 3.200327, -6.075994,
3.749756, 3.200327, -6.075994,
-3.653098, 3.200327, 5.362431,
3.749756, 3.200327, 5.362431,
3.749756, -2.853407, -6.075994,
3.749756, 3.200327, -6.075994,
3.749756, -2.853407, 5.362431,
3.749756, 3.200327, 5.362431,
3.749756, -2.853407, -6.075994,
3.749756, -2.853407, 5.362431,
3.749756, 3.200327, -6.075994,
3.749756, 3.200327, 5.362431
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
var radius = 7.961281;
var distance = 35.42064;
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
mvMatrix.translate( -0.04832888, -0.1734601, 0.3567812 );
mvMatrix.scale( 1.162781, 1.421915, 0.7525418 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42064);
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
Pestan<-read.table("Pestan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pestan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
```

```r
y<-Pestan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
```

```r
z<-Pestan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
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
-3.545289, -1.484835, -3.696504, 0, 0, 1, 1, 1,
-3.194783, -0.8740129, -1.84752, 1, 0, 0, 1, 1,
-2.968202, -0.323133, -0.1686204, 1, 0, 0, 1, 1,
-2.571783, 1.649146, -0.9398877, 1, 0, 0, 1, 1,
-2.547923, -0.2213562, -2.046843, 1, 0, 0, 1, 1,
-2.471785, -0.6943457, -1.247734, 1, 0, 0, 1, 1,
-2.438271, -0.2153755, -2.886138, 0, 0, 0, 1, 1,
-2.429946, 0.222528, 0.5331668, 0, 0, 0, 1, 1,
-2.41583, 0.2748545, -1.058164, 0, 0, 0, 1, 1,
-2.411682, -1.924401, -2.436319, 0, 0, 0, 1, 1,
-2.398509, 1.46661, -1.384474, 0, 0, 0, 1, 1,
-2.392726, -0.4773966, -2.363724, 0, 0, 0, 1, 1,
-2.376021, 0.152173, -0.3278928, 0, 0, 0, 1, 1,
-2.173032, 1.746637, -2.624769, 1, 1, 1, 1, 1,
-2.059698, -0.9428378, -1.131198, 1, 1, 1, 1, 1,
-2.040453, -0.5474916, -0.5092946, 1, 1, 1, 1, 1,
-2.038227, 0.2872926, -0.506134, 1, 1, 1, 1, 1,
-2.019447, 0.8963432, -0.5777436, 1, 1, 1, 1, 1,
-1.991373, 0.02959745, -2.844104, 1, 1, 1, 1, 1,
-1.970157, 0.6489881, -2.313893, 1, 1, 1, 1, 1,
-1.949696, -0.3456829, -3.327969, 1, 1, 1, 1, 1,
-1.913669, -1.8495, -1.415022, 1, 1, 1, 1, 1,
-1.898406, 1.053555, -1.363767, 1, 1, 1, 1, 1,
-1.876887, 0.09139559, -2.610683, 1, 1, 1, 1, 1,
-1.870146, -0.7011604, -2.386264, 1, 1, 1, 1, 1,
-1.854519, 1.20107, -1.31338, 1, 1, 1, 1, 1,
-1.85292, -1.817062, -4.516598, 1, 1, 1, 1, 1,
-1.847697, 0.7095325, -1.817618, 1, 1, 1, 1, 1,
-1.826778, -0.04922593, -1.190044, 0, 0, 1, 1, 1,
-1.81863, 0.4052405, -0.2525171, 1, 0, 0, 1, 1,
-1.815377, -0.432631, -0.5602723, 1, 0, 0, 1, 1,
-1.808538, -1.505545, -0.2530773, 1, 0, 0, 1, 1,
-1.788176, 0.5755135, 0.2540046, 1, 0, 0, 1, 1,
-1.757173, 0.08661989, -0.1076304, 1, 0, 0, 1, 1,
-1.753185, -1.864992, -1.70649, 0, 0, 0, 1, 1,
-1.746615, 0.291265, -0.58166, 0, 0, 0, 1, 1,
-1.732021, -2.370519, 0.3911968, 0, 0, 0, 1, 1,
-1.724682, 0.7544827, 0.5158392, 0, 0, 0, 1, 1,
-1.702854, 1.152552, 0.0106979, 0, 0, 0, 1, 1,
-1.690884, 0.4544713, 0.4228525, 0, 0, 0, 1, 1,
-1.678684, 1.933258, -1.642506, 0, 0, 0, 1, 1,
-1.677068, 1.30175, 0.02682215, 1, 1, 1, 1, 1,
-1.664056, -1.467374, -2.582383, 1, 1, 1, 1, 1,
-1.659807, -1.066301, -2.777344, 1, 1, 1, 1, 1,
-1.646757, 1.130113, -1.683974, 1, 1, 1, 1, 1,
-1.642387, -1.29769, -3.78979, 1, 1, 1, 1, 1,
-1.612318, -1.240983, -2.463437, 1, 1, 1, 1, 1,
-1.591027, 1.495616, 0.7307321, 1, 1, 1, 1, 1,
-1.570954, 0.967696, -1.537705, 1, 1, 1, 1, 1,
-1.568826, -0.178247, 0.491671, 1, 1, 1, 1, 1,
-1.567107, -0.5439385, -1.869088, 1, 1, 1, 1, 1,
-1.557124, -0.5980389, -1.073923, 1, 1, 1, 1, 1,
-1.548796, -0.218208, -2.453882, 1, 1, 1, 1, 1,
-1.528731, -0.3654142, -0.6596348, 1, 1, 1, 1, 1,
-1.52318, -0.1280199, 0.6039187, 1, 1, 1, 1, 1,
-1.522436, -0.2521912, -1.997912, 1, 1, 1, 1, 1,
-1.514673, 0.2954625, -0.4935803, 0, 0, 1, 1, 1,
-1.504029, -0.2208136, -1.537949, 1, 0, 0, 1, 1,
-1.491887, 1.322757, 0.175284, 1, 0, 0, 1, 1,
-1.472624, 0.2021618, -2.287693, 1, 0, 0, 1, 1,
-1.470635, 2.032804, -1.014306, 1, 0, 0, 1, 1,
-1.47034, -1.769577, -3.369657, 1, 0, 0, 1, 1,
-1.469432, 0.2517048, -2.759231, 0, 0, 0, 1, 1,
-1.466096, -0.04939418, -2.343666, 0, 0, 0, 1, 1,
-1.464144, -0.5550434, -1.180713, 0, 0, 0, 1, 1,
-1.453226, -1.559989, -3.785222, 0, 0, 0, 1, 1,
-1.450779, 0.9006366, -1.622669, 0, 0, 0, 1, 1,
-1.442946, -1.861469, -2.813943, 0, 0, 0, 1, 1,
-1.438064, 0.4115967, -2.775886, 0, 0, 0, 1, 1,
-1.413468, -2.09105, -1.675592, 1, 1, 1, 1, 1,
-1.408033, 0.1687644, -0.9673654, 1, 1, 1, 1, 1,
-1.403576, -0.09119905, -2.346954, 1, 1, 1, 1, 1,
-1.401909, -1.173195, -3.638938, 1, 1, 1, 1, 1,
-1.391795, -0.4629652, -2.549432, 1, 1, 1, 1, 1,
-1.388816, -0.3592716, -2.121055, 1, 1, 1, 1, 1,
-1.378802, -0.08450694, -0.9556851, 1, 1, 1, 1, 1,
-1.377919, -1.118694, -2.709559, 1, 1, 1, 1, 1,
-1.37376, 0.1140531, -0.2634082, 1, 1, 1, 1, 1,
-1.364095, 0.2468589, -2.991444, 1, 1, 1, 1, 1,
-1.359123, -0.09004782, -0.5166726, 1, 1, 1, 1, 1,
-1.354445, -0.6629825, -2.303836, 1, 1, 1, 1, 1,
-1.347237, -1.790007, -2.139189, 1, 1, 1, 1, 1,
-1.346152, 0.9202223, 0.6062735, 1, 1, 1, 1, 1,
-1.339893, -1.927384, -1.679467, 1, 1, 1, 1, 1,
-1.336843, -1.166673, -1.738848, 0, 0, 1, 1, 1,
-1.332985, 0.6030207, -0.1068774, 1, 0, 0, 1, 1,
-1.327269, -0.03286694, -0.4135707, 1, 0, 0, 1, 1,
-1.325674, -2.185464, -2.820523, 1, 0, 0, 1, 1,
-1.322698, -2.454907, -1.444971, 1, 0, 0, 1, 1,
-1.317496, -0.08355957, -0.242954, 1, 0, 0, 1, 1,
-1.315288, 0.7551295, -0.1978451, 0, 0, 0, 1, 1,
-1.311575, 1.666464, -2.467231, 0, 0, 0, 1, 1,
-1.30873, 0.491598, -2.006469, 0, 0, 0, 1, 1,
-1.282618, -0.1923999, -1.834141, 0, 0, 0, 1, 1,
-1.28234, -1.583066, -3.139584, 0, 0, 0, 1, 1,
-1.282111, -0.5037816, -1.782478, 0, 0, 0, 1, 1,
-1.270939, 3.112166, -1.532233, 0, 0, 0, 1, 1,
-1.261668, -2.106556, -2.102065, 1, 1, 1, 1, 1,
-1.26124, -0.03770798, -2.172821, 1, 1, 1, 1, 1,
-1.257969, 0.4855363, -1.932863, 1, 1, 1, 1, 1,
-1.245586, 0.7770203, -0.9864517, 1, 1, 1, 1, 1,
-1.228489, 0.9013866, 0.3926371, 1, 1, 1, 1, 1,
-1.225572, 0.05831705, -1.56701, 1, 1, 1, 1, 1,
-1.224569, 1.009817, -2.62957, 1, 1, 1, 1, 1,
-1.222127, -1.642687, -3.949722, 1, 1, 1, 1, 1,
-1.213652, -1.911604, -2.72432, 1, 1, 1, 1, 1,
-1.213017, -0.1521816, -1.409128, 1, 1, 1, 1, 1,
-1.209957, -1.136759, -4.103875, 1, 1, 1, 1, 1,
-1.20943, 0.616993, -0.2327071, 1, 1, 1, 1, 1,
-1.209197, -0.1935836, -3.472199, 1, 1, 1, 1, 1,
-1.207445, 0.2912131, -0.5101141, 1, 1, 1, 1, 1,
-1.204008, 0.3856547, -1.277005, 1, 1, 1, 1, 1,
-1.197575, 0.4328195, -1.084448, 0, 0, 1, 1, 1,
-1.193764, -0.6854165, -2.317014, 1, 0, 0, 1, 1,
-1.193234, 0.5604699, -1.338902, 1, 0, 0, 1, 1,
-1.185001, 0.6030245, 0.007928004, 1, 0, 0, 1, 1,
-1.18043, -2.564023, -4.330782, 1, 0, 0, 1, 1,
-1.179892, -1.065239, -3.62387, 1, 0, 0, 1, 1,
-1.16902, 1.287965, -0.8844182, 0, 0, 0, 1, 1,
-1.165744, -2.07142, -2.937021, 0, 0, 0, 1, 1,
-1.1585, -0.2231928, -3.426491, 0, 0, 0, 1, 1,
-1.156242, 0.346714, -2.014138, 0, 0, 0, 1, 1,
-1.15478, 0.6729154, -0.9077453, 0, 0, 0, 1, 1,
-1.145976, -0.3312064, -1.526195, 0, 0, 0, 1, 1,
-1.145673, -1.74272, -1.431616, 0, 0, 0, 1, 1,
-1.137002, -0.456986, -1.155127, 1, 1, 1, 1, 1,
-1.131247, -0.01890875, -1.523166, 1, 1, 1, 1, 1,
-1.126774, 0.1533986, 0.7609587, 1, 1, 1, 1, 1,
-1.119035, -0.7883081, -3.539514, 1, 1, 1, 1, 1,
-1.10908, 0.1391803, -0.81103, 1, 1, 1, 1, 1,
-1.108494, -0.8455129, -4.27967, 1, 1, 1, 1, 1,
-1.108365, 0.7641776, 1.756906, 1, 1, 1, 1, 1,
-1.108297, 0.6479447, -3.183017, 1, 1, 1, 1, 1,
-1.098511, 0.20123, -1.543577, 1, 1, 1, 1, 1,
-1.098446, -1.536055, -1.926043, 1, 1, 1, 1, 1,
-1.094418, -1.295529, -1.333652, 1, 1, 1, 1, 1,
-1.093784, 0.1023499, -2.093722, 1, 1, 1, 1, 1,
-1.087291, -0.4208356, 0.1781817, 1, 1, 1, 1, 1,
-1.075164, -0.9938826, -1.966512, 1, 1, 1, 1, 1,
-1.062071, -1.170648, -3.962839, 1, 1, 1, 1, 1,
-1.055741, 0.0188268, -1.413759, 0, 0, 1, 1, 1,
-1.04836, -0.3643852, -1.680545, 1, 0, 0, 1, 1,
-1.045334, 0.7344621, -2.249549, 1, 0, 0, 1, 1,
-1.037027, -0.1462038, -0.9321481, 1, 0, 0, 1, 1,
-1.03101, 0.6261922, -0.6419555, 1, 0, 0, 1, 1,
-1.028215, -1.223809, -2.943663, 1, 0, 0, 1, 1,
-1.023996, 1.203813, 0.4654971, 0, 0, 0, 1, 1,
-1.023005, 2.070324, 0.8652879, 0, 0, 0, 1, 1,
-1.021984, 0.7320722, 0.2980568, 0, 0, 0, 1, 1,
-1.01621, 1.020851, -1.438965, 0, 0, 0, 1, 1,
-1.013069, -0.3843642, -2.039774, 0, 0, 0, 1, 1,
-1.007966, -1.803481, -2.597918, 0, 0, 0, 1, 1,
-1.007774, 1.271548, 0.0862787, 0, 0, 0, 1, 1,
-0.9940932, 1.495646, -2.448854, 1, 1, 1, 1, 1,
-0.9928748, -0.1802814, 0.2219958, 1, 1, 1, 1, 1,
-0.9906754, 0.6463671, -0.5056584, 1, 1, 1, 1, 1,
-0.9853441, -1.176148, -1.185317, 1, 1, 1, 1, 1,
-0.981576, -0.5925208, -1.588275, 1, 1, 1, 1, 1,
-0.9814471, 1.247963, 0.3344792, 1, 1, 1, 1, 1,
-0.9782645, -1.452453, -4.040566, 1, 1, 1, 1, 1,
-0.9720842, -0.1726451, -3.254401, 1, 1, 1, 1, 1,
-0.9708992, -0.6991892, -1.741983, 1, 1, 1, 1, 1,
-0.9613556, -0.01423973, -3.132855, 1, 1, 1, 1, 1,
-0.9599029, 1.392058, 0.2771948, 1, 1, 1, 1, 1,
-0.9583909, 1.761073, -1.989968, 1, 1, 1, 1, 1,
-0.9578555, -1.497472, -3.955825, 1, 1, 1, 1, 1,
-0.9487013, 0.09900595, -2.184889, 1, 1, 1, 1, 1,
-0.9461774, 0.6695313, -1.323309, 1, 1, 1, 1, 1,
-0.9418376, -0.3684454, -1.072471, 0, 0, 1, 1, 1,
-0.936289, -0.3428508, -1.270534, 1, 0, 0, 1, 1,
-0.9361726, 0.4487752, -1.61839, 1, 0, 0, 1, 1,
-0.929219, 1.301204, -0.4917526, 1, 0, 0, 1, 1,
-0.9119555, 0.9941879, -3.167748, 1, 0, 0, 1, 1,
-0.9118415, 0.201798, 0.05339227, 1, 0, 0, 1, 1,
-0.9114721, -0.6813769, -2.312592, 0, 0, 0, 1, 1,
-0.9104043, -1.630796, -3.440697, 0, 0, 0, 1, 1,
-0.9063461, 0.6519256, 0.4237266, 0, 0, 0, 1, 1,
-0.9045385, -0.1968378, -1.342159, 0, 0, 0, 1, 1,
-0.902693, 1.216639, -3.164642, 0, 0, 0, 1, 1,
-0.9020411, 0.2080327, -1.600138, 0, 0, 0, 1, 1,
-0.88915, 2.094318, -2.258551, 0, 0, 0, 1, 1,
-0.8817109, -0.7477439, -1.392439, 1, 1, 1, 1, 1,
-0.8783302, -0.1687991, -1.855, 1, 1, 1, 1, 1,
-0.8659528, -0.6174384, -2.190294, 1, 1, 1, 1, 1,
-0.8646886, 0.478461, -2.098403, 1, 1, 1, 1, 1,
-0.8544793, -1.518262, -4.539419, 1, 1, 1, 1, 1,
-0.8533452, 0.6084726, -0.2395021, 1, 1, 1, 1, 1,
-0.8387238, 0.8103971, -0.0865242, 1, 1, 1, 1, 1,
-0.8375981, 0.08116242, -1.834702, 1, 1, 1, 1, 1,
-0.8359498, 2.150657, -0.1337069, 1, 1, 1, 1, 1,
-0.8359072, -0.470134, -2.450486, 1, 1, 1, 1, 1,
-0.8335763, 0.1272497, -2.40299, 1, 1, 1, 1, 1,
-0.8278466, -0.05295455, -1.656195, 1, 1, 1, 1, 1,
-0.8260665, -0.2777874, -2.78138, 1, 1, 1, 1, 1,
-0.8243375, 0.6376993, -1.368172, 1, 1, 1, 1, 1,
-0.8240393, -0.9419205, -3.326729, 1, 1, 1, 1, 1,
-0.8225574, 0.7719496, -0.3999516, 0, 0, 1, 1, 1,
-0.8214703, 1.138664, -2.359547, 1, 0, 0, 1, 1,
-0.8201187, 0.1755634, -1.296724, 1, 0, 0, 1, 1,
-0.8164749, 1.386066, -1.09571, 1, 0, 0, 1, 1,
-0.8152822, 0.6257692, -0.1830516, 1, 0, 0, 1, 1,
-0.8124958, -0.3033728, -1.364346, 1, 0, 0, 1, 1,
-0.812193, -0.2824899, -1.998724, 0, 0, 0, 1, 1,
-0.811034, -0.03677068, -0.5364246, 0, 0, 0, 1, 1,
-0.8066602, 2.069453, -0.7028228, 0, 0, 0, 1, 1,
-0.798979, -1.24273, -2.553652, 0, 0, 0, 1, 1,
-0.7979301, -0.06049966, -1.682641, 0, 0, 0, 1, 1,
-0.7945166, 0.5377673, 0.8579388, 0, 0, 0, 1, 1,
-0.7925681, -0.8987816, -2.815083, 0, 0, 0, 1, 1,
-0.7909743, -1.640778, -3.67841, 1, 1, 1, 1, 1,
-0.7863795, -0.3765103, -2.213457, 1, 1, 1, 1, 1,
-0.783433, -0.03510026, -2.442074, 1, 1, 1, 1, 1,
-0.7811143, -1.415177, -2.989284, 1, 1, 1, 1, 1,
-0.7809012, 0.7513043, 0.8527235, 1, 1, 1, 1, 1,
-0.7774904, 1.727515, -0.9829424, 1, 1, 1, 1, 1,
-0.7731283, 0.308093, -0.6991233, 1, 1, 1, 1, 1,
-0.7696773, 0.09398383, -0.6347374, 1, 1, 1, 1, 1,
-0.7653112, 0.7433136, -1.268299, 1, 1, 1, 1, 1,
-0.7586151, 1.072747, -0.2637554, 1, 1, 1, 1, 1,
-0.7581894, -1.094186, -2.748151, 1, 1, 1, 1, 1,
-0.7579725, 1.857062, -0.8310955, 1, 1, 1, 1, 1,
-0.7561479, -1.080224, -4.917977, 1, 1, 1, 1, 1,
-0.7532244, -1.214344, -0.9232901, 1, 1, 1, 1, 1,
-0.7382991, -0.7311192, -0.3529186, 1, 1, 1, 1, 1,
-0.7366646, 1.246332, -0.8312426, 0, 0, 1, 1, 1,
-0.7362754, -1.244176, -1.515786, 1, 0, 0, 1, 1,
-0.7284256, 0.5472227, -1.283642, 1, 0, 0, 1, 1,
-0.7255877, -0.5801928, -1.083095, 1, 0, 0, 1, 1,
-0.7228788, -2.021131, -3.672351, 1, 0, 0, 1, 1,
-0.7192669, -0.9565454, -2.8604, 1, 0, 0, 1, 1,
-0.7190791, -0.7554524, -1.419326, 0, 0, 0, 1, 1,
-0.7158057, -0.8415316, -3.052547, 0, 0, 0, 1, 1,
-0.7131199, -0.7398894, -1.986858, 0, 0, 0, 1, 1,
-0.7090414, 0.1616089, -1.346644, 0, 0, 0, 1, 1,
-0.7071983, -0.1309603, -2.567664, 0, 0, 0, 1, 1,
-0.7043076, 1.028111, -1.401699, 0, 0, 0, 1, 1,
-0.7024377, -0.4240189, -2.086645, 0, 0, 0, 1, 1,
-0.7018595, -0.7656651, -0.7391936, 1, 1, 1, 1, 1,
-0.6941411, 0.5571396, 0.265791, 1, 1, 1, 1, 1,
-0.6936111, -0.02100756, -1.692358, 1, 1, 1, 1, 1,
-0.6896752, 1.121239, -0.7271937, 1, 1, 1, 1, 1,
-0.6890201, 0.8473019, -1.652236, 1, 1, 1, 1, 1,
-0.6835598, -1.154791, -3.199775, 1, 1, 1, 1, 1,
-0.678393, 0.2839891, -2.34884, 1, 1, 1, 1, 1,
-0.6766011, -1.444056, -1.939623, 1, 1, 1, 1, 1,
-0.6752922, 0.2780475, -0.8488081, 1, 1, 1, 1, 1,
-0.6743445, -1.062495, -2.237832, 1, 1, 1, 1, 1,
-0.673704, -1.136375, -2.254201, 1, 1, 1, 1, 1,
-0.6696483, 0.1061634, -1.964361, 1, 1, 1, 1, 1,
-0.66952, 0.08090521, -1.780942, 1, 1, 1, 1, 1,
-0.6653215, -0.5345438, -2.461641, 1, 1, 1, 1, 1,
-0.6623853, -0.1247299, -0.2690426, 1, 1, 1, 1, 1,
-0.6622583, 0.4242302, 0.9165139, 0, 0, 1, 1, 1,
-0.6613362, -1.61145, -2.735178, 1, 0, 0, 1, 1,
-0.6604463, 0.03106649, -3.355215, 1, 0, 0, 1, 1,
-0.6601522, -0.1017322, -2.292202, 1, 0, 0, 1, 1,
-0.6589506, -0.695574, -1.166434, 1, 0, 0, 1, 1,
-0.6559638, 0.09274058, -1.27343, 1, 0, 0, 1, 1,
-0.6553022, 0.9869235, -2.355439, 0, 0, 0, 1, 1,
-0.6531199, 0.07935748, -1.808083, 0, 0, 0, 1, 1,
-0.6511059, -0.7631274, -2.471183, 0, 0, 0, 1, 1,
-0.6376863, -0.05017214, -1.467712, 0, 0, 0, 1, 1,
-0.637652, 0.02179155, -1.195879, 0, 0, 0, 1, 1,
-0.636601, -0.6886147, -1.903329, 0, 0, 0, 1, 1,
-0.6354854, 0.09752481, -3.157425, 0, 0, 0, 1, 1,
-0.6345212, 0.6625044, 1.194498, 1, 1, 1, 1, 1,
-0.6307189, -0.2794049, -0.8789588, 1, 1, 1, 1, 1,
-0.6300003, 0.7998056, -1.837174, 1, 1, 1, 1, 1,
-0.6298232, 1.169761, 1.39872, 1, 1, 1, 1, 1,
-0.6286192, 0.3605144, 0.291903, 1, 1, 1, 1, 1,
-0.627954, 0.6687213, -0.3015953, 1, 1, 1, 1, 1,
-0.6242303, -0.6473668, -3.398895, 1, 1, 1, 1, 1,
-0.6181971, -0.2757693, -2.467143, 1, 1, 1, 1, 1,
-0.6149217, -1.203513, -3.074096, 1, 1, 1, 1, 1,
-0.6121349, 0.807121, -1.575892, 1, 1, 1, 1, 1,
-0.6096689, 0.2524826, -0.5279344, 1, 1, 1, 1, 1,
-0.6068882, 0.7976587, -2.097773, 1, 1, 1, 1, 1,
-0.6064107, -0.9124686, -0.68784, 1, 1, 1, 1, 1,
-0.6052033, 1.512895, 0.1629957, 1, 1, 1, 1, 1,
-0.6038098, 0.9335436, -0.5535901, 1, 1, 1, 1, 1,
-0.602352, -0.4852188, -1.541371, 0, 0, 1, 1, 1,
-0.5995525, -0.6281453, -2.942972, 1, 0, 0, 1, 1,
-0.5981462, 0.2154969, -1.687839, 1, 0, 0, 1, 1,
-0.5978299, -1.305033, -1.035513, 1, 0, 0, 1, 1,
-0.5876247, 0.8973321, 0.4349656, 1, 0, 0, 1, 1,
-0.5861903, -0.9035349, -2.774895, 1, 0, 0, 1, 1,
-0.5858302, -1.19473, -3.106276, 0, 0, 0, 1, 1,
-0.5838399, -0.320937, -1.882562, 0, 0, 0, 1, 1,
-0.5813587, 2.379393, -0.3206029, 0, 0, 0, 1, 1,
-0.5756876, -0.2841858, -1.081313, 0, 0, 0, 1, 1,
-0.5752565, 0.6869895, -0.8773737, 0, 0, 0, 1, 1,
-0.574997, -0.2625298, -3.861475, 0, 0, 0, 1, 1,
-0.5742422, 0.8756275, -0.3229205, 0, 0, 0, 1, 1,
-0.5649373, -0.5296374, -2.285965, 1, 1, 1, 1, 1,
-0.5631175, -0.3058207, -1.945137, 1, 1, 1, 1, 1,
-0.5606964, 0.6137734, -0.1786645, 1, 1, 1, 1, 1,
-0.5601475, -0.3527027, -1.022242, 1, 1, 1, 1, 1,
-0.5559346, -0.02525614, -1.940279, 1, 1, 1, 1, 1,
-0.5476241, 0.3601957, -0.6020727, 1, 1, 1, 1, 1,
-0.5466813, -1.731448, -0.7256191, 1, 1, 1, 1, 1,
-0.5416716, -0.3950627, -2.487809, 1, 1, 1, 1, 1,
-0.5381239, -0.9410951, -1.709674, 1, 1, 1, 1, 1,
-0.5380679, -0.6206571, -3.524636, 1, 1, 1, 1, 1,
-0.5373408, 0.348319, -1.48008, 1, 1, 1, 1, 1,
-0.5316966, -1.511957, -2.776686, 1, 1, 1, 1, 1,
-0.5166306, -0.8956798, -1.556478, 1, 1, 1, 1, 1,
-0.5129895, -0.9717802, -3.366476, 1, 1, 1, 1, 1,
-0.5117329, -0.2496967, -1.193324, 1, 1, 1, 1, 1,
-0.5085168, 0.5520399, 0.06504279, 0, 0, 1, 1, 1,
-0.5056152, -0.09780376, -1.205595, 1, 0, 0, 1, 1,
-0.5012153, -1.144046, -3.535697, 1, 0, 0, 1, 1,
-0.5007534, 0.5549262, -1.530761, 1, 0, 0, 1, 1,
-0.4970905, 1.240888, 0.009719565, 1, 0, 0, 1, 1,
-0.4956664, 1.311366, 0.5144071, 1, 0, 0, 1, 1,
-0.4915526, 1.237584, -0.834551, 0, 0, 0, 1, 1,
-0.487471, -0.3274121, -2.763083, 0, 0, 0, 1, 1,
-0.4846201, -1.600891, -3.656866, 0, 0, 0, 1, 1,
-0.4791461, 0.8272429, -1.261849, 0, 0, 0, 1, 1,
-0.4788378, 0.8410072, -1.258808, 0, 0, 0, 1, 1,
-0.4779335, 0.3263427, -0.1454639, 0, 0, 0, 1, 1,
-0.4765995, -1.250471, -4.194207, 0, 0, 0, 1, 1,
-0.473277, -0.3547279, -1.944924, 1, 1, 1, 1, 1,
-0.4718308, 0.520875, -0.8152983, 1, 1, 1, 1, 1,
-0.468953, -0.4549829, -2.167796, 1, 1, 1, 1, 1,
-0.4688084, -1.743732, -3.262414, 1, 1, 1, 1, 1,
-0.467535, 0.2405372, -1.485536, 1, 1, 1, 1, 1,
-0.467469, 1.321862, 0.03025204, 1, 1, 1, 1, 1,
-0.4625628, -0.2053538, -3.869641, 1, 1, 1, 1, 1,
-0.4616094, 0.1841036, -0.9971287, 1, 1, 1, 1, 1,
-0.4601866, 0.4555554, -1.168738, 1, 1, 1, 1, 1,
-0.4581721, -1.022369, -2.646971, 1, 1, 1, 1, 1,
-0.4556279, 0.5911266, -0.126713, 1, 1, 1, 1, 1,
-0.4513642, 0.7184851, -1.796987, 1, 1, 1, 1, 1,
-0.4447175, -0.09235284, -1.194296, 1, 1, 1, 1, 1,
-0.4374172, 0.1539898, -1.71156, 1, 1, 1, 1, 1,
-0.434774, 0.5680332, -0.09207489, 1, 1, 1, 1, 1,
-0.4341851, -0.6458078, -3.403246, 0, 0, 1, 1, 1,
-0.4309643, 1.476505, -2.044295, 1, 0, 0, 1, 1,
-0.4279517, 0.1777729, -0.930869, 1, 0, 0, 1, 1,
-0.4263878, 0.4773026, -1.046488, 1, 0, 0, 1, 1,
-0.4243314, -1.005246, -4.741303, 1, 0, 0, 1, 1,
-0.4238633, -0.6614048, -2.233752, 1, 0, 0, 1, 1,
-0.4232918, 0.5927646, 0.5175216, 0, 0, 0, 1, 1,
-0.4227222, 1.200423, -1.761277, 0, 0, 0, 1, 1,
-0.4205005, -0.5850746, -4.523884, 0, 0, 0, 1, 1,
-0.4202214, -1.460491, -2.980099, 0, 0, 0, 1, 1,
-0.4191641, -1.727825, -2.915132, 0, 0, 0, 1, 1,
-0.4191095, 2.018168, 1.139205, 0, 0, 0, 1, 1,
-0.418563, 0.3131618, -1.031391, 0, 0, 0, 1, 1,
-0.4173878, 2.39116, -1.01419, 1, 1, 1, 1, 1,
-0.4162266, 0.6394546, 0.03711054, 1, 1, 1, 1, 1,
-0.4159323, -0.5123663, -2.392022, 1, 1, 1, 1, 1,
-0.415123, -0.7056202, -3.941776, 1, 1, 1, 1, 1,
-0.414156, 0.9724401, -0.7563944, 1, 1, 1, 1, 1,
-0.4115964, -0.1091798, -0.3472918, 1, 1, 1, 1, 1,
-0.4109996, -1.060682, -3.687777, 1, 1, 1, 1, 1,
-0.4061843, 1.711304, -0.4760777, 1, 1, 1, 1, 1,
-0.4053203, -1.730725, -3.194622, 1, 1, 1, 1, 1,
-0.403417, -0.7252842, -0.8363205, 1, 1, 1, 1, 1,
-0.3992649, -0.4446062, -3.697533, 1, 1, 1, 1, 1,
-0.3899369, -0.9533029, -2.930519, 1, 1, 1, 1, 1,
-0.3827201, -1.234245, -2.744217, 1, 1, 1, 1, 1,
-0.3793832, 0.519089, -0.543318, 1, 1, 1, 1, 1,
-0.3748421, -0.08671748, -1.384113, 1, 1, 1, 1, 1,
-0.3738208, 0.6878924, -1.892961, 0, 0, 1, 1, 1,
-0.3656674, -1.312266, -3.842697, 1, 0, 0, 1, 1,
-0.3632607, 0.3672863, -1.218326, 1, 0, 0, 1, 1,
-0.3620881, -0.2321062, -1.944024, 1, 0, 0, 1, 1,
-0.3597834, -0.3568421, -1.42892, 1, 0, 0, 1, 1,
-0.3529085, 0.4461796, 1.162307, 1, 0, 0, 1, 1,
-0.3521833, 0.4886302, -0.4752178, 0, 0, 0, 1, 1,
-0.3417487, -0.1326669, -1.961167, 0, 0, 0, 1, 1,
-0.3321448, 0.4372843, -0.6889538, 0, 0, 0, 1, 1,
-0.3320307, 2.048216, 1.565896, 0, 0, 0, 1, 1,
-0.3297567, -0.6211655, -3.98581, 0, 0, 0, 1, 1,
-0.3285402, -0.6330994, -2.254011, 0, 0, 0, 1, 1,
-0.3267047, -0.08042465, -2.425382, 0, 0, 0, 1, 1,
-0.3229602, -0.4068387, -0.7318408, 1, 1, 1, 1, 1,
-0.3208571, -0.5357547, -2.20655, 1, 1, 1, 1, 1,
-0.3156243, 1.012205, 1.213391, 1, 1, 1, 1, 1,
-0.3155929, -2.098755, -2.855184, 1, 1, 1, 1, 1,
-0.3100392, -0.4859115, -2.429713, 1, 1, 1, 1, 1,
-0.3065576, 0.831518, -0.8301178, 1, 1, 1, 1, 1,
-0.304413, 1.403819, -1.585126, 1, 1, 1, 1, 1,
-0.2961149, -0.474958, -2.856719, 1, 1, 1, 1, 1,
-0.2960265, 1.995369, 0.3060909, 1, 1, 1, 1, 1,
-0.2946853, 0.2993964, 0.7758731, 1, 1, 1, 1, 1,
-0.293626, -0.523955, -1.927741, 1, 1, 1, 1, 1,
-0.2913698, 0.9919071, 0.4213513, 1, 1, 1, 1, 1,
-0.2903198, -0.4203367, -3.046777, 1, 1, 1, 1, 1,
-0.2892261, 0.5513324, 0.8395694, 1, 1, 1, 1, 1,
-0.2875491, -0.9242088, -1.589233, 1, 1, 1, 1, 1,
-0.286736, -2.184364, -1.733847, 0, 0, 1, 1, 1,
-0.285948, 1.29468, -0.4487791, 1, 0, 0, 1, 1,
-0.2813817, -1.14754, -3.012706, 1, 0, 0, 1, 1,
-0.2779507, 0.8962404, -0.3577246, 1, 0, 0, 1, 1,
-0.2754332, -0.5014549, -1.527435, 1, 0, 0, 1, 1,
-0.2744494, 0.5796191, 0.7348417, 1, 0, 0, 1, 1,
-0.2679359, 0.1032216, -3.085691, 0, 0, 0, 1, 1,
-0.2658222, 0.5361251, 0.609201, 0, 0, 0, 1, 1,
-0.2644587, 1.854506, 1.231788, 0, 0, 0, 1, 1,
-0.2473199, 0.6464977, -0.4002402, 0, 0, 0, 1, 1,
-0.2435396, -0.1516965, -1.841037, 0, 0, 0, 1, 1,
-0.2421463, -0.6328519, -0.6931558, 0, 0, 0, 1, 1,
-0.2417224, 2.284449, -1.156886, 0, 0, 0, 1, 1,
-0.2412036, 0.06109828, -1.840724, 1, 1, 1, 1, 1,
-0.2405079, 0.1145267, -1.47852, 1, 1, 1, 1, 1,
-0.2350465, -0.6496218, -2.45778, 1, 1, 1, 1, 1,
-0.2344332, -0.01415379, -3.272692, 1, 1, 1, 1, 1,
-0.2300636, 1.036382, -1.022191, 1, 1, 1, 1, 1,
-0.2215658, 1.310883, -0.5585996, 1, 1, 1, 1, 1,
-0.219439, 1.300758, 0.3134456, 1, 1, 1, 1, 1,
-0.2134501, 0.07564226, -2.300797, 1, 1, 1, 1, 1,
-0.2119657, 2.065313, -1.060214, 1, 1, 1, 1, 1,
-0.2099401, -0.655936, -3.047264, 1, 1, 1, 1, 1,
-0.2096367, -0.2315167, -3.616869, 1, 1, 1, 1, 1,
-0.2080867, -0.1674409, -3.297889, 1, 1, 1, 1, 1,
-0.2066517, -1.80355, -2.592849, 1, 1, 1, 1, 1,
-0.2040269, -0.7759635, -0.7596329, 1, 1, 1, 1, 1,
-0.2026478, 1.291724, 1.159946, 1, 1, 1, 1, 1,
-0.2002965, 0.1162191, -1.254022, 0, 0, 1, 1, 1,
-0.1922796, -0.7334859, -1.292473, 1, 0, 0, 1, 1,
-0.190017, -0.5153779, -3.70633, 1, 0, 0, 1, 1,
-0.1813767, -1.55826, -4.340466, 1, 0, 0, 1, 1,
-0.180937, -1.316211, -2.226606, 1, 0, 0, 1, 1,
-0.180669, -1.15571, -1.833459, 1, 0, 0, 1, 1,
-0.1787038, 0.07507224, -0.9389365, 0, 0, 0, 1, 1,
-0.177064, 0.6010448, -1.26978, 0, 0, 0, 1, 1,
-0.1762069, 0.1887257, -0.2428682, 0, 0, 0, 1, 1,
-0.1741387, 0.6497872, 0.06522396, 0, 0, 0, 1, 1,
-0.1671309, -0.5374184, -3.732535, 0, 0, 0, 1, 1,
-0.1611808, 0.4859696, 1.029482, 0, 0, 0, 1, 1,
-0.1603456, -0.9052095, -2.042246, 0, 0, 0, 1, 1,
-0.1572367, -0.3814127, -2.672128, 1, 1, 1, 1, 1,
-0.1539256, 1.589737, -0.4810688, 1, 1, 1, 1, 1,
-0.1521893, -1.399255, -2.450521, 1, 1, 1, 1, 1,
-0.1521694, -0.5128269, -5.909415, 1, 1, 1, 1, 1,
-0.1505951, 0.2120888, -0.6755725, 1, 1, 1, 1, 1,
-0.1474543, -0.2838905, -1.715944, 1, 1, 1, 1, 1,
-0.1467033, -1.725404, -3.21427, 1, 1, 1, 1, 1,
-0.1460733, 0.4301699, 0.8340185, 1, 1, 1, 1, 1,
-0.142795, -0.224942, -3.394505, 1, 1, 1, 1, 1,
-0.1365595, 0.6249472, -1.775944, 1, 1, 1, 1, 1,
-0.1329865, -0.2519963, -1.446905, 1, 1, 1, 1, 1,
-0.1288029, -1.04686, -2.50815, 1, 1, 1, 1, 1,
-0.1272523, 0.9773983, 1.703096, 1, 1, 1, 1, 1,
-0.1248626, -1.30742, -2.201499, 1, 1, 1, 1, 1,
-0.122369, -0.4274423, -3.286139, 1, 1, 1, 1, 1,
-0.1223551, -1.601787, -2.570462, 0, 0, 1, 1, 1,
-0.1133622, -1.114168, -3.424714, 1, 0, 0, 1, 1,
-0.109079, -0.4485344, -3.024696, 1, 0, 0, 1, 1,
-0.1063458, 0.2615479, 0.1171551, 1, 0, 0, 1, 1,
-0.09606347, 0.4328449, -0.1076794, 1, 0, 0, 1, 1,
-0.09488729, 0.4597339, 1.159008, 1, 0, 0, 1, 1,
-0.08871967, -0.2098773, -4.005924, 0, 0, 0, 1, 1,
-0.08746385, 0.5469027, 1.156229, 0, 0, 0, 1, 1,
-0.08726141, -0.09763157, -1.941308, 0, 0, 0, 1, 1,
-0.08693432, -0.4065113, -0.7371784, 0, 0, 0, 1, 1,
-0.08490743, 1.099012, -1.452017, 0, 0, 0, 1, 1,
-0.07720548, -0.1291265, -2.762547, 0, 0, 0, 1, 1,
-0.0758809, -0.3422529, -2.800754, 0, 0, 0, 1, 1,
-0.07544757, -0.03700952, -1.170108, 1, 1, 1, 1, 1,
-0.07282656, 0.8116102, 0.4222107, 1, 1, 1, 1, 1,
-0.06692462, 0.4082999, -0.6588908, 1, 1, 1, 1, 1,
-0.06494173, -0.6356608, -3.180627, 1, 1, 1, 1, 1,
-0.06491274, 0.3591259, -1.258374, 1, 1, 1, 1, 1,
-0.0592072, 1.023979, -0.8811277, 1, 1, 1, 1, 1,
-0.05863113, 0.263593, -0.144235, 1, 1, 1, 1, 1,
-0.0573515, 0.248538, -2.09959, 1, 1, 1, 1, 1,
-0.05557638, -0.007633644, 0.07303572, 1, 1, 1, 1, 1,
-0.0509999, 0.788214, 0.6991763, 1, 1, 1, 1, 1,
-0.05073182, -0.4071167, -1.81924, 1, 1, 1, 1, 1,
-0.04931396, 0.8207618, 0.0670498, 1, 1, 1, 1, 1,
-0.04762681, -1.362169, -2.718625, 1, 1, 1, 1, 1,
-0.04460966, -0.2889559, -4.996111, 1, 1, 1, 1, 1,
-0.0410312, -0.9490283, -3.911503, 1, 1, 1, 1, 1,
-0.0401275, 0.0744803, -1.697104, 0, 0, 1, 1, 1,
-0.03946336, 0.1530961, 0.1134633, 1, 0, 0, 1, 1,
-0.03755664, -0.009128876, -0.9454466, 1, 0, 0, 1, 1,
-0.03668174, 1.108136, -0.7298722, 1, 0, 0, 1, 1,
-0.03665794, 0.6694173, -0.2754549, 1, 0, 0, 1, 1,
-0.03645674, 0.5127986, -1.9463, 1, 0, 0, 1, 1,
-0.03611922, 1.036363, 0.4056583, 0, 0, 0, 1, 1,
-0.03386632, 0.2186689, 0.7174142, 0, 0, 0, 1, 1,
-0.03128747, 1.226383, 1.147632, 0, 0, 0, 1, 1,
-0.0213671, 0.1079451, 0.2324979, 0, 0, 0, 1, 1,
-0.01777807, -0.46986, -2.588199, 0, 0, 0, 1, 1,
-0.0169247, -0.3649314, -2.772577, 0, 0, 0, 1, 1,
-0.01481112, 0.1607223, 0.9654212, 0, 0, 0, 1, 1,
-0.01206328, 0.1432415, 0.01121288, 1, 1, 1, 1, 1,
-0.0104942, -0.6157111, -2.966239, 1, 1, 1, 1, 1,
-0.01009555, 0.7233586, 0.5294865, 1, 1, 1, 1, 1,
-0.009308724, -0.4714092, -3.232196, 1, 1, 1, 1, 1,
-0.0056793, -0.2419389, -4.67043, 1, 1, 1, 1, 1,
-0.004176945, -0.4870082, -4.798878, 1, 1, 1, 1, 1,
0.00411121, 1.760562, -0.7888045, 1, 1, 1, 1, 1,
0.006428264, -0.7357857, 2.916, 1, 1, 1, 1, 1,
0.00895091, 0.06236945, -0.08501044, 1, 1, 1, 1, 1,
0.01073437, -1.961123, 1.462978, 1, 1, 1, 1, 1,
0.01352935, -2.765245, 1.675614, 1, 1, 1, 1, 1,
0.02096405, -2.000222, 3.880956, 1, 1, 1, 1, 1,
0.02238268, -0.1962345, 4.677479, 1, 1, 1, 1, 1,
0.024808, -2.282724, 1.910686, 1, 1, 1, 1, 1,
0.02960604, -0.8523163, 5.195852, 1, 1, 1, 1, 1,
0.03539886, 1.092229, -1.383947, 0, 0, 1, 1, 1,
0.03637573, 0.04266527, 0.529714, 1, 0, 0, 1, 1,
0.0377167, 1.426966, -0.4814387, 1, 0, 0, 1, 1,
0.0409526, -0.6230517, 4.52812, 1, 0, 0, 1, 1,
0.04406795, 0.2043577, -0.2545122, 1, 0, 0, 1, 1,
0.04601215, -1.919291, 4.042171, 1, 0, 0, 1, 1,
0.04759447, -0.3075863, 0.8498113, 0, 0, 0, 1, 1,
0.04780051, 2.485549, 0.7344379, 0, 0, 0, 1, 1,
0.04900572, 0.5370471, 3.288833, 0, 0, 0, 1, 1,
0.0532014, 0.06977188, -0.1102229, 0, 0, 0, 1, 1,
0.0534507, -2.515597, 2.88608, 0, 0, 0, 1, 1,
0.05434262, -1.047767, 3.034384, 0, 0, 0, 1, 1,
0.05891778, 0.1946645, 1.335488, 0, 0, 0, 1, 1,
0.06100938, 1.359136, 0.7326797, 1, 1, 1, 1, 1,
0.06296363, -0.8906894, 2.636941, 1, 1, 1, 1, 1,
0.06422498, -0.05152337, 1.481733, 1, 1, 1, 1, 1,
0.06727378, -0.1879376, 3.993681, 1, 1, 1, 1, 1,
0.06970481, -0.8606066, 2.730604, 1, 1, 1, 1, 1,
0.07075357, 0.09487671, -0.4495862, 1, 1, 1, 1, 1,
0.07144802, -1.764347, 2.594708, 1, 1, 1, 1, 1,
0.07456358, 0.7879985, -0.6091154, 1, 1, 1, 1, 1,
0.07818662, 0.6683647, -0.08377979, 1, 1, 1, 1, 1,
0.08009296, -0.6356159, 3.313533, 1, 1, 1, 1, 1,
0.08121759, -1.217717, 3.918689, 1, 1, 1, 1, 1,
0.08173298, -0.1119238, 3.069607, 1, 1, 1, 1, 1,
0.09510303, -1.34959, 2.956403, 1, 1, 1, 1, 1,
0.09547022, 0.1235627, -0.7210117, 1, 1, 1, 1, 1,
0.09646869, 0.5654162, 0.1556286, 1, 1, 1, 1, 1,
0.09816942, 0.3896805, -1.129079, 0, 0, 1, 1, 1,
0.1092312, 0.4627476, 0.158231, 1, 0, 0, 1, 1,
0.1096202, -0.6288623, 3.363228, 1, 0, 0, 1, 1,
0.1114119, 0.05657342, 0.6017271, 1, 0, 0, 1, 1,
0.1132561, 1.638244, 2.00947, 1, 0, 0, 1, 1,
0.1140139, -2.377888, 3.431163, 1, 0, 0, 1, 1,
0.1216343, -0.09857551, 2.167532, 0, 0, 0, 1, 1,
0.1224785, 0.2720486, 0.5100299, 0, 0, 0, 1, 1,
0.1239182, 0.06474097, 0.7778183, 0, 0, 0, 1, 1,
0.1336481, -1.140029, 1.866185, 0, 0, 0, 1, 1,
0.1343935, -0.5442645, 2.83519, 0, 0, 0, 1, 1,
0.1358978, 1.965729, 0.3764034, 0, 0, 0, 1, 1,
0.1380009, 1.507027, -0.4770295, 0, 0, 0, 1, 1,
0.1390656, -0.2908538, 3.676233, 1, 1, 1, 1, 1,
0.1397157, 0.3814794, 1.671946, 1, 1, 1, 1, 1,
0.1400498, -0.687934, 1.972291, 1, 1, 1, 1, 1,
0.1403845, 2.596158, -0.8698063, 1, 1, 1, 1, 1,
0.1422761, -0.5294428, 3.933445, 1, 1, 1, 1, 1,
0.1433079, 0.7038729, 0.8699427, 1, 1, 1, 1, 1,
0.1451885, -0.1213349, 3.986777, 1, 1, 1, 1, 1,
0.146515, 0.7011865, 0.9399724, 1, 1, 1, 1, 1,
0.1472771, -0.09174328, 1.064326, 1, 1, 1, 1, 1,
0.1502265, 0.148851, 0.06351917, 1, 1, 1, 1, 1,
0.1567405, -0.6251249, 1.904784, 1, 1, 1, 1, 1,
0.1573462, -0.05316835, -0.1771892, 1, 1, 1, 1, 1,
0.1586482, -1.321185, 1.981936, 1, 1, 1, 1, 1,
0.1587074, -0.7121384, 1.003846, 1, 1, 1, 1, 1,
0.1655001, -1.373858, 2.948682, 1, 1, 1, 1, 1,
0.1674824, 1.270106, 0.623638, 0, 0, 1, 1, 1,
0.1679751, 1.045262, -0.6299179, 1, 0, 0, 1, 1,
0.1707973, 0.9289238, 0.8300149, 1, 0, 0, 1, 1,
0.1735248, -2.093522, 3.743703, 1, 0, 0, 1, 1,
0.1743558, -1.635375, 4.687962, 1, 0, 0, 1, 1,
0.1784973, -0.2809354, 2.39027, 1, 0, 0, 1, 1,
0.1785197, 0.0837191, 0.5011076, 0, 0, 0, 1, 1,
0.1791534, -0.8937601, 2.859184, 0, 0, 0, 1, 1,
0.1827624, 1.597216, -1.776202, 0, 0, 0, 1, 1,
0.184574, -0.0764102, 2.46484, 0, 0, 0, 1, 1,
0.1854264, 0.6500018, 0.03008156, 0, 0, 0, 1, 1,
0.1856534, -0.3818272, 1.880757, 0, 0, 0, 1, 1,
0.1872883, 1.937047, 0.1955284, 0, 0, 0, 1, 1,
0.187308, 0.6865432, -1.944599, 1, 1, 1, 1, 1,
0.1890981, -1.262988, 1.579382, 1, 1, 1, 1, 1,
0.1938317, 0.8967181, -1.057956, 1, 1, 1, 1, 1,
0.1986729, 0.5706692, -1.183961, 1, 1, 1, 1, 1,
0.202525, -0.1921531, 2.064737, 1, 1, 1, 1, 1,
0.2033534, 0.3858811, -1.417393, 1, 1, 1, 1, 1,
0.2069202, -0.1654598, 2.934964, 1, 1, 1, 1, 1,
0.2072071, -1.737995, 3.516427, 1, 1, 1, 1, 1,
0.2125527, -1.157164, 2.667676, 1, 1, 1, 1, 1,
0.221339, 0.5530499, 1.802502, 1, 1, 1, 1, 1,
0.2246038, 0.6325856, 1.270355, 1, 1, 1, 1, 1,
0.2338601, 2.70962, -0.6922557, 1, 1, 1, 1, 1,
0.2345661, -0.07885211, 2.578153, 1, 1, 1, 1, 1,
0.2369305, -0.391585, 1.631442, 1, 1, 1, 1, 1,
0.2397523, -0.7820027, 3.497024, 1, 1, 1, 1, 1,
0.2455063, 0.7315359, 0.573703, 0, 0, 1, 1, 1,
0.2466329, 1.019738, -0.204156, 1, 0, 0, 1, 1,
0.2487577, 0.7338139, 1.083953, 1, 0, 0, 1, 1,
0.2488879, -0.3581773, 2.745719, 1, 0, 0, 1, 1,
0.2494512, 0.1082499, 0.1497686, 1, 0, 0, 1, 1,
0.2498426, 0.5111914, 0.1390617, 1, 0, 0, 1, 1,
0.2541487, -1.171834, 3.710139, 0, 0, 0, 1, 1,
0.2552277, 0.9854983, -0.1388199, 0, 0, 0, 1, 1,
0.2573746, 0.889745, 0.1160489, 0, 0, 0, 1, 1,
0.2578273, 0.6755641, 0.596139, 0, 0, 0, 1, 1,
0.2579875, 0.4655493, 0.5780612, 0, 0, 0, 1, 1,
0.258113, 1.350708, 0.3988964, 0, 0, 0, 1, 1,
0.2616177, 0.2312345, 0.4964663, 0, 0, 0, 1, 1,
0.2628651, -1.011837, 3.159023, 1, 1, 1, 1, 1,
0.268838, 0.03047012, 0.9577475, 1, 1, 1, 1, 1,
0.2723033, 0.3869516, 0.9627028, 1, 1, 1, 1, 1,
0.2780522, -0.3068692, 3.19385, 1, 1, 1, 1, 1,
0.2788185, 1.305779, -0.08381546, 1, 1, 1, 1, 1,
0.2794564, 0.5590031, 1.451586, 1, 1, 1, 1, 1,
0.2795506, 0.8039345, 0.2980217, 1, 1, 1, 1, 1,
0.2827763, 1.348268, 1.027767, 1, 1, 1, 1, 1,
0.2844691, -0.7514107, 0.981103, 1, 1, 1, 1, 1,
0.2918973, -0.289998, 1.226933, 1, 1, 1, 1, 1,
0.2944949, 0.6014992, 2.373631, 1, 1, 1, 1, 1,
0.3013641, 0.4772852, -0.01991981, 1, 1, 1, 1, 1,
0.3035101, 0.3495208, 1.787408, 1, 1, 1, 1, 1,
0.3048493, -1.204432, 4.109823, 1, 1, 1, 1, 1,
0.3054911, -1.832143, 2.282821, 1, 1, 1, 1, 1,
0.3065504, 0.3012133, 0.8700192, 0, 0, 1, 1, 1,
0.3067236, -1.498019, 2.724243, 1, 0, 0, 1, 1,
0.3147893, 2.181776, 1.136341, 1, 0, 0, 1, 1,
0.3232739, -0.9693103, 2.232879, 1, 0, 0, 1, 1,
0.3254131, -1.423503, 1.425207, 1, 0, 0, 1, 1,
0.3265082, -0.4105943, 2.112866, 1, 0, 0, 1, 1,
0.3276844, -1.209314, 2.243801, 0, 0, 0, 1, 1,
0.3281998, 0.900275, 1.031426, 0, 0, 0, 1, 1,
0.3288938, 0.05912827, 1.523632, 0, 0, 0, 1, 1,
0.3307045, -0.3808436, 1.646246, 0, 0, 0, 1, 1,
0.332587, 0.5708638, 2.17743, 0, 0, 0, 1, 1,
0.3360613, 0.8211601, 0.3359701, 0, 0, 0, 1, 1,
0.3407578, 0.0266443, 1.252714, 0, 0, 0, 1, 1,
0.3408155, 0.1357839, 0.162886, 1, 1, 1, 1, 1,
0.3466865, -1.65724, 4.15116, 1, 1, 1, 1, 1,
0.3502754, -0.7356709, 0.7348675, 1, 1, 1, 1, 1,
0.3524253, 0.2536972, 0.9686683, 1, 1, 1, 1, 1,
0.3529168, -0.05680384, 2.117836, 1, 1, 1, 1, 1,
0.3588568, 1.162986, 1.332534, 1, 1, 1, 1, 1,
0.3624999, -0.4333889, 0.8656427, 1, 1, 1, 1, 1,
0.3636075, -0.7495148, 0.6832159, 1, 1, 1, 1, 1,
0.3636793, -1.987253, 2.965075, 1, 1, 1, 1, 1,
0.3650371, -0.3737181, 2.48061, 1, 1, 1, 1, 1,
0.3663522, -0.2090289, 1.962235, 1, 1, 1, 1, 1,
0.369767, -0.8203818, 2.985166, 1, 1, 1, 1, 1,
0.3708994, -1.471668, 3.51844, 1, 1, 1, 1, 1,
0.3710475, 0.0525468, 2.745675, 1, 1, 1, 1, 1,
0.3741368, -0.3380913, 2.540188, 1, 1, 1, 1, 1,
0.3790032, -0.3083746, 2.152997, 0, 0, 1, 1, 1,
0.3795365, -0.7336621, 2.899573, 1, 0, 0, 1, 1,
0.3801513, -0.7741431, 3.718487, 1, 0, 0, 1, 1,
0.3811302, 0.2831824, 1.44923, 1, 0, 0, 1, 1,
0.3822759, -0.6155482, 2.313978, 1, 0, 0, 1, 1,
0.383881, -0.9905261, 0.7279997, 1, 0, 0, 1, 1,
0.3863015, 0.3219467, 2.777825, 0, 0, 0, 1, 1,
0.3898963, 0.4563495, 0.349201, 0, 0, 0, 1, 1,
0.3940804, 0.8226281, 1.336056, 0, 0, 0, 1, 1,
0.3951101, 0.7029893, 1.23667, 0, 0, 0, 1, 1,
0.3981113, -0.4252828, 2.969741, 0, 0, 0, 1, 1,
0.4006303, -0.3726349, 3.413207, 0, 0, 0, 1, 1,
0.4038314, 0.2950644, 2.617672, 0, 0, 0, 1, 1,
0.4049599, -1.026902, 4.250611, 1, 1, 1, 1, 1,
0.406004, 0.8282287, 1.387681, 1, 1, 1, 1, 1,
0.4099047, -0.5690238, 2.327657, 1, 1, 1, 1, 1,
0.4145769, -0.5369281, 1.944519, 1, 1, 1, 1, 1,
0.4172731, -0.8005754, 2.766589, 1, 1, 1, 1, 1,
0.4259237, -0.02719874, 2.279643, 1, 1, 1, 1, 1,
0.4270206, -0.1670482, 1.454218, 1, 1, 1, 1, 1,
0.4273773, 2.480415, -1.220482, 1, 1, 1, 1, 1,
0.4274184, -2.102119, 2.614305, 1, 1, 1, 1, 1,
0.4275554, 0.9184511, 0.8982952, 1, 1, 1, 1, 1,
0.4281366, 0.1213733, 2.374068, 1, 1, 1, 1, 1,
0.4339747, 1.468849, -0.8334873, 1, 1, 1, 1, 1,
0.4350865, 0.6163759, -0.155906, 1, 1, 1, 1, 1,
0.4353906, -0.2602194, 3.294498, 1, 1, 1, 1, 1,
0.4360184, 0.6275136, 0.599802, 1, 1, 1, 1, 1,
0.4364578, -0.08271647, 1.635641, 0, 0, 1, 1, 1,
0.4378266, -1.105991, 0.5373791, 1, 0, 0, 1, 1,
0.4407401, 0.2210481, 0.8131146, 1, 0, 0, 1, 1,
0.4442844, 0.4825291, 1.454089, 1, 0, 0, 1, 1,
0.4468525, 1.982097, 1.417872, 1, 0, 0, 1, 1,
0.4508337, 0.3635613, 1.634333, 1, 0, 0, 1, 1,
0.4562947, 0.9701051, 0.2459671, 0, 0, 0, 1, 1,
0.4574079, 1.101431, 0.3473998, 0, 0, 0, 1, 1,
0.4603835, 0.1466985, 1.315439, 0, 0, 0, 1, 1,
0.4610822, 0.8034294, 1.141559, 0, 0, 0, 1, 1,
0.4638401, -0.8821611, 2.917123, 0, 0, 0, 1, 1,
0.4643362, -0.2462822, 2.283257, 0, 0, 0, 1, 1,
0.4659894, 0.5399514, 0.1724877, 0, 0, 0, 1, 1,
0.4674071, 1.752667, 1.071894, 1, 1, 1, 1, 1,
0.4731036, 1.169869, -0.02746768, 1, 1, 1, 1, 1,
0.4735229, -1.098991, 3.147095, 1, 1, 1, 1, 1,
0.4794046, 0.5406135, 0.4614763, 1, 1, 1, 1, 1,
0.480356, 0.607723, 1.050919, 1, 1, 1, 1, 1,
0.4844846, 0.8162332, 1.293977, 1, 1, 1, 1, 1,
0.4903715, -0.4826024, 2.961892, 1, 1, 1, 1, 1,
0.4932875, -1.423317, 4.38065, 1, 1, 1, 1, 1,
0.4962003, 0.747767, -2.417245, 1, 1, 1, 1, 1,
0.5023689, -0.520144, 0.4632826, 1, 1, 1, 1, 1,
0.5061406, 0.2559199, -0.1606875, 1, 1, 1, 1, 1,
0.5080252, -0.099118, 1.504057, 1, 1, 1, 1, 1,
0.509442, 1.260417, 0.6469864, 1, 1, 1, 1, 1,
0.5113817, -0.5810525, 4.862069, 1, 1, 1, 1, 1,
0.5128871, -0.5058895, 2.611459, 1, 1, 1, 1, 1,
0.5132557, 0.4194781, 1.739459, 0, 0, 1, 1, 1,
0.516673, 0.3603526, -0.1586145, 1, 0, 0, 1, 1,
0.5181293, 0.5670239, 0.9785603, 1, 0, 0, 1, 1,
0.5190758, -0.5121992, 1.474675, 1, 0, 0, 1, 1,
0.5210198, -0.2735834, 0.8148636, 1, 0, 0, 1, 1,
0.5230112, 0.1039833, 1.997751, 1, 0, 0, 1, 1,
0.5262086, -1.310539, 1.601372, 0, 0, 0, 1, 1,
0.527721, 0.7607896, 0.8658721, 0, 0, 0, 1, 1,
0.5295473, -0.1031591, 1.654243, 0, 0, 0, 1, 1,
0.53078, 0.0007728186, 2.088231, 0, 0, 0, 1, 1,
0.5345199, 1.215329, 0.4719354, 0, 0, 0, 1, 1,
0.536484, 0.2830422, 0.1897781, 0, 0, 0, 1, 1,
0.5371723, 0.2102185, 1.26151, 0, 0, 0, 1, 1,
0.5458968, -1.204087, 3.332488, 1, 1, 1, 1, 1,
0.546237, 0.7979096, -0.03555846, 1, 1, 1, 1, 1,
0.5476156, 1.184609, 0.7044182, 1, 1, 1, 1, 1,
0.5549666, -1.098058, 4.22307, 1, 1, 1, 1, 1,
0.5583436, 1.428035, -0.1444032, 1, 1, 1, 1, 1,
0.5585141, -0.2196782, 1.849028, 1, 1, 1, 1, 1,
0.5612521, -0.3895116, 1.682214, 1, 1, 1, 1, 1,
0.5650271, 2.513904, -1.119177, 1, 1, 1, 1, 1,
0.5673687, 0.9808714, 0.1890921, 1, 1, 1, 1, 1,
0.5680352, 0.06879241, 3.082755, 1, 1, 1, 1, 1,
0.5699252, 0.2185476, -0.1851806, 1, 1, 1, 1, 1,
0.5746402, -0.261693, 3.639152, 1, 1, 1, 1, 1,
0.5777842, -1.830168, 4.110099, 1, 1, 1, 1, 1,
0.5802764, 0.8959842, -0.5083891, 1, 1, 1, 1, 1,
0.5814805, -0.0788058, 0.118274, 1, 1, 1, 1, 1,
0.5827411, 0.1598754, 3.001746, 0, 0, 1, 1, 1,
0.583262, 0.214733, 3.548177, 1, 0, 0, 1, 1,
0.5841286, -1.03352, 2.12793, 1, 0, 0, 1, 1,
0.5912529, -0.9139247, -0.2466863, 1, 0, 0, 1, 1,
0.5923704, 0.9824542, 0.0102622, 1, 0, 0, 1, 1,
0.5954908, -1.87447, 3.848871, 1, 0, 0, 1, 1,
0.5988639, -0.4333706, 3.267309, 0, 0, 0, 1, 1,
0.6010658, -1.112666, 1.785785, 0, 0, 0, 1, 1,
0.6014842, 0.7292187, 2.091331, 0, 0, 0, 1, 1,
0.6018921, -0.1075537, 1.989157, 0, 0, 0, 1, 1,
0.6032426, -0.4411211, 2.972696, 0, 0, 0, 1, 1,
0.6041123, 0.6075895, 0.04357943, 0, 0, 0, 1, 1,
0.6099546, -0.31695, 3.002763, 0, 0, 0, 1, 1,
0.6108094, -0.6098577, 3.066367, 1, 1, 1, 1, 1,
0.6141912, 0.5851228, 0.8582909, 1, 1, 1, 1, 1,
0.618876, 0.1906551, -0.004916177, 1, 1, 1, 1, 1,
0.6199669, -1.674227, 4.210063, 1, 1, 1, 1, 1,
0.6236281, -1.070735, 1.631956, 1, 1, 1, 1, 1,
0.6280641, 1.634832, 1.944168, 1, 1, 1, 1, 1,
0.6287759, 0.3453133, 1.899287, 1, 1, 1, 1, 1,
0.6317966, 1.012433, 3.002423, 1, 1, 1, 1, 1,
0.6328117, 1.676366, -0.3137799, 1, 1, 1, 1, 1,
0.6338121, 0.5130429, 1.178837, 1, 1, 1, 1, 1,
0.6350953, 2.066314, 1.181852, 1, 1, 1, 1, 1,
0.6396828, -0.4587962, 2.314182, 1, 1, 1, 1, 1,
0.6434183, 1.369236, 0.9640962, 1, 1, 1, 1, 1,
0.6547009, -0.04814696, 3.828184, 1, 1, 1, 1, 1,
0.6558863, -0.5368275, 1.424042, 1, 1, 1, 1, 1,
0.6567287, 0.2382744, -1.067413, 0, 0, 1, 1, 1,
0.6568866, 2.260466, -0.05654498, 1, 0, 0, 1, 1,
0.6642951, 0.8633935, 1.170619, 1, 0, 0, 1, 1,
0.6752331, -0.7468325, 2.886088, 1, 0, 0, 1, 1,
0.6767138, -0.7144645, 1.607259, 1, 0, 0, 1, 1,
0.6775841, 0.3673895, 1.424208, 1, 0, 0, 1, 1,
0.6776116, 0.2773259, 0.2091561, 0, 0, 0, 1, 1,
0.6842241, 2.234521, 0.2546971, 0, 0, 0, 1, 1,
0.6847621, -0.2933085, 2.399391, 0, 0, 0, 1, 1,
0.6923781, -1.045424, 4.721847, 0, 0, 0, 1, 1,
0.6944527, 0.2662889, 1.279763, 0, 0, 0, 1, 1,
0.6983529, -1.681557, 4.434767, 0, 0, 0, 1, 1,
0.6996675, 0.3332108, 1.854942, 0, 0, 0, 1, 1,
0.7068416, 0.003677531, 2.432198, 1, 1, 1, 1, 1,
0.7076846, -0.02090305, 2.209611, 1, 1, 1, 1, 1,
0.71071, 0.1537456, 1.393656, 1, 1, 1, 1, 1,
0.7167009, -0.3470796, 1.387244, 1, 1, 1, 1, 1,
0.7236563, 2.389165, 0.2479075, 1, 1, 1, 1, 1,
0.7243447, 1.007894, 0.3649863, 1, 1, 1, 1, 1,
0.7245397, 0.2763954, 0.7610971, 1, 1, 1, 1, 1,
0.7249866, 0.1670698, 2.178417, 1, 1, 1, 1, 1,
0.732644, 1.677014, -0.05867247, 1, 1, 1, 1, 1,
0.7388139, -0.1902779, 3.037062, 1, 1, 1, 1, 1,
0.7405716, -1.992033, 3.054261, 1, 1, 1, 1, 1,
0.7464818, 0.09132157, 4.034338, 1, 1, 1, 1, 1,
0.746555, 1.62386, 1.181459, 1, 1, 1, 1, 1,
0.7669584, 0.3805197, 1.809505, 1, 1, 1, 1, 1,
0.7692446, -0.1045031, 0.2988973, 1, 1, 1, 1, 1,
0.7695534, 0.6094404, 1.448534, 0, 0, 1, 1, 1,
0.7708951, -0.533107, 3.752416, 1, 0, 0, 1, 1,
0.7714074, -0.003015219, 1.046105, 1, 0, 0, 1, 1,
0.7732427, 0.6445136, 0.1928786, 1, 0, 0, 1, 1,
0.7733, -2.150506, 3.808005, 1, 0, 0, 1, 1,
0.7786598, -0.4019894, 1.634239, 1, 0, 0, 1, 1,
0.7826332, -0.1157623, 0.1641728, 0, 0, 0, 1, 1,
0.7856854, -1.159502, 0.3850198, 0, 0, 0, 1, 1,
0.787002, 0.6723287, 0.8609242, 0, 0, 0, 1, 1,
0.7880163, 0.272529, 0.5311935, 0, 0, 0, 1, 1,
0.7909326, 1.038158, 2.296641, 0, 0, 0, 1, 1,
0.7914019, 0.3447286, 1.037466, 0, 0, 0, 1, 1,
0.7935919, 1.525998, 1.087053, 0, 0, 0, 1, 1,
0.7991908, -1.199013, 2.400595, 1, 1, 1, 1, 1,
0.8049574, -1.512576, 3.931358, 1, 1, 1, 1, 1,
0.8073282, -0.7053034, 2.349534, 1, 1, 1, 1, 1,
0.8132635, 0.9098164, 0.1270896, 1, 1, 1, 1, 1,
0.8195349, -0.2892783, 0.1418696, 1, 1, 1, 1, 1,
0.8198689, -0.2709714, 0.4910945, 1, 1, 1, 1, 1,
0.8231258, 0.4470306, 1.916326, 1, 1, 1, 1, 1,
0.8268047, 1.242686, 1.282626, 1, 1, 1, 1, 1,
0.8306776, -0.3828421, 3.909751, 1, 1, 1, 1, 1,
0.8381583, -0.4236476, 1.134739, 1, 1, 1, 1, 1,
0.8381899, -0.06551088, 1.555036, 1, 1, 1, 1, 1,
0.8382527, 1.429309, 0.9140971, 1, 1, 1, 1, 1,
0.8389058, 0.2834401, -0.1633714, 1, 1, 1, 1, 1,
0.8414038, 0.1229917, 2.779967, 1, 1, 1, 1, 1,
0.8541417, -1.931112, 3.227608, 1, 1, 1, 1, 1,
0.8553649, 0.462449, 0.9585548, 0, 0, 1, 1, 1,
0.8559327, -1.342684, 2.830691, 1, 0, 0, 1, 1,
0.8565981, 0.2930917, 0.8241022, 1, 0, 0, 1, 1,
0.8569962, 0.4403014, 1.608891, 1, 0, 0, 1, 1,
0.859717, 1.649314, 0.1445623, 1, 0, 0, 1, 1,
0.8683891, 1.15276, 1.189078, 1, 0, 0, 1, 1,
0.8727847, -0.5335529, 1.58379, 0, 0, 0, 1, 1,
0.8731336, -0.4107141, 1.593469, 0, 0, 0, 1, 1,
0.8746676, 0.4337639, 2.331044, 0, 0, 0, 1, 1,
0.877332, -1.007583, 1.206388, 0, 0, 0, 1, 1,
0.8793281, 0.8268443, 1.150923, 0, 0, 0, 1, 1,
0.8800471, 1.645364, 1.541277, 0, 0, 0, 1, 1,
0.8858255, -0.5154822, 1.186782, 0, 0, 0, 1, 1,
0.8890768, -0.4599726, 2.240524, 1, 1, 1, 1, 1,
0.8902, -0.2007276, 0.5358222, 1, 1, 1, 1, 1,
0.891014, 0.8103431, 0.2582957, 1, 1, 1, 1, 1,
0.8997437, -0.4476604, 1.218789, 1, 1, 1, 1, 1,
0.9027982, 1.01937, 1.372556, 1, 1, 1, 1, 1,
0.9033332, 1.596173, -0.3648304, 1, 1, 1, 1, 1,
0.9120111, 0.8003402, 2.103826, 1, 1, 1, 1, 1,
0.9237214, 0.3193807, 0.2939912, 1, 1, 1, 1, 1,
0.924377, 1.19955, 1.547298, 1, 1, 1, 1, 1,
0.9314497, 0.2569179, 0.9295189, 1, 1, 1, 1, 1,
0.9319837, 1.305379, 0.3406793, 1, 1, 1, 1, 1,
0.9372507, 0.1958145, -0.4245302, 1, 1, 1, 1, 1,
0.9386635, -0.5675054, 1.79314, 1, 1, 1, 1, 1,
0.9422653, 0.3010961, 1.07067, 1, 1, 1, 1, 1,
0.9447232, -0.9764364, 3.400704, 1, 1, 1, 1, 1,
0.9472239, -0.8786335, 3.069066, 0, 0, 1, 1, 1,
0.9487236, 0.6620225, 1.83023, 1, 0, 0, 1, 1,
0.9552643, -0.4202012, -0.9232923, 1, 0, 0, 1, 1,
0.9576015, -1.092896, 2.135352, 1, 0, 0, 1, 1,
0.958834, -1.269372, 2.420166, 1, 0, 0, 1, 1,
0.9642889, 1.093599, -0.1216829, 1, 0, 0, 1, 1,
0.9713302, -0.684063, 0.1733337, 0, 0, 0, 1, 1,
0.9734723, -1.402032, 3.339874, 0, 0, 0, 1, 1,
0.974129, 1.742355, 0.3704386, 0, 0, 0, 1, 1,
0.9789328, -0.230723, 2.949561, 0, 0, 0, 1, 1,
0.980009, -2.22009, 3.218933, 0, 0, 0, 1, 1,
0.9840282, -0.4363376, 2.944822, 0, 0, 0, 1, 1,
0.987394, 0.1850336, -0.05679708, 0, 0, 0, 1, 1,
0.9994917, 0.2857959, 3.424421, 1, 1, 1, 1, 1,
0.9996049, 1.980187, -0.5614592, 1, 1, 1, 1, 1,
1.009088, -2.148639, 3.297287, 1, 1, 1, 1, 1,
1.013426, -2.69248, 3.145213, 1, 1, 1, 1, 1,
1.016033, -0.3792755, 0.4563169, 1, 1, 1, 1, 1,
1.02241, 0.09329845, 2.38724, 1, 1, 1, 1, 1,
1.02395, 1.732404, 0.3309825, 1, 1, 1, 1, 1,
1.028564, 0.7988604, 1.324203, 1, 1, 1, 1, 1,
1.052132, 0.8086656, -0.1704703, 1, 1, 1, 1, 1,
1.058051, -0.1947875, 1.66446, 1, 1, 1, 1, 1,
1.060586, 1.291412, 0.2696823, 1, 1, 1, 1, 1,
1.061525, -2.136488, 2.76588, 1, 1, 1, 1, 1,
1.061996, 1.917724, 0.9237753, 1, 1, 1, 1, 1,
1.073149, 0.6986396, -1.028527, 1, 1, 1, 1, 1,
1.074679, -0.1511625, 2.798193, 1, 1, 1, 1, 1,
1.083844, 0.4463191, 1.472908, 0, 0, 1, 1, 1,
1.090069, -0.3369267, 2.6449, 1, 0, 0, 1, 1,
1.093732, 1.144207, 0.9200846, 1, 0, 0, 1, 1,
1.103384, 1.493319, 2.703461, 1, 0, 0, 1, 1,
1.106578, 1.893802, 0.9098822, 1, 0, 0, 1, 1,
1.112041, -1.274521, 2.716889, 1, 0, 0, 1, 1,
1.114299, 1.487261, 0.3199064, 0, 0, 0, 1, 1,
1.11861, -0.8392223, 1.83044, 0, 0, 0, 1, 1,
1.129418, 0.4392899, 0.09267783, 0, 0, 0, 1, 1,
1.139472, 3.099205, 1.078068, 0, 0, 0, 1, 1,
1.139913, 0.271143, 1.153463, 0, 0, 0, 1, 1,
1.145294, 0.6631933, 0.8942249, 0, 0, 0, 1, 1,
1.149166, -0.04813759, -0.1850082, 0, 0, 0, 1, 1,
1.156215, 0.680356, 0.6549557, 1, 1, 1, 1, 1,
1.157087, 0.8538538, 0.9418938, 1, 1, 1, 1, 1,
1.16847, -1.778002, 2.776025, 1, 1, 1, 1, 1,
1.168787, -0.3080941, 2.033017, 1, 1, 1, 1, 1,
1.178385, -0.1542952, 0.7194279, 1, 1, 1, 1, 1,
1.1858, 0.3644715, 2.076089, 1, 1, 1, 1, 1,
1.197959, -0.5989032, 2.768787, 1, 1, 1, 1, 1,
1.199371, 2.479254, 1.015873, 1, 1, 1, 1, 1,
1.204013, -0.612776, 3.170405, 1, 1, 1, 1, 1,
1.207823, -0.4307533, 2.106234, 1, 1, 1, 1, 1,
1.208792, 0.6800004, -0.3635301, 1, 1, 1, 1, 1,
1.21698, -0.3010372, 1.461536, 1, 1, 1, 1, 1,
1.217971, -1.235068, 2.693357, 1, 1, 1, 1, 1,
1.220622, 0.5831825, -0.4362765, 1, 1, 1, 1, 1,
1.221047, 1.260737, -1.265917, 1, 1, 1, 1, 1,
1.222134, 0.369056, 0.7293776, 0, 0, 1, 1, 1,
1.227463, 0.4480886, 0.6963108, 1, 0, 0, 1, 1,
1.231242, 0.8270518, 1.207493, 1, 0, 0, 1, 1,
1.232289, -0.9263781, 2.362704, 1, 0, 0, 1, 1,
1.238929, -0.7802263, 0.5476785, 1, 0, 0, 1, 1,
1.245305, -0.9258115, 1.61282, 1, 0, 0, 1, 1,
1.247827, -1.106602, 2.933182, 0, 0, 0, 1, 1,
1.253114, 1.043454, 1.593831, 0, 0, 0, 1, 1,
1.254994, -0.1093595, 3.548602, 0, 0, 0, 1, 1,
1.261798, 0.7453758, 2.019139, 0, 0, 0, 1, 1,
1.273795, -1.39359, 3.026499, 0, 0, 0, 1, 1,
1.277131, 1.349071, 1.307319, 0, 0, 0, 1, 1,
1.280987, -0.5425844, 2.388119, 0, 0, 0, 1, 1,
1.282038, 0.5390526, 1.700658, 1, 1, 1, 1, 1,
1.292542, 1.012342, 1.071461, 1, 1, 1, 1, 1,
1.297522, -0.8895298, 1.598817, 1, 1, 1, 1, 1,
1.301821, -0.07702558, 1.912402, 1, 1, 1, 1, 1,
1.303876, -0.742483, 2.522483, 1, 1, 1, 1, 1,
1.307356, 0.05579602, 1.559286, 1, 1, 1, 1, 1,
1.316974, 1.315909, 2.339869, 1, 1, 1, 1, 1,
1.327804, -1.555584, 3.129235, 1, 1, 1, 1, 1,
1.334998, 1.274556, 0.4811266, 1, 1, 1, 1, 1,
1.337793, 0.2093234, 0.9508209, 1, 1, 1, 1, 1,
1.339459, -0.2597775, 1.592521, 1, 1, 1, 1, 1,
1.348549, 1.9802, -0.8618436, 1, 1, 1, 1, 1,
1.350842, -0.4556363, 2.647507, 1, 1, 1, 1, 1,
1.357666, 0.3065304, 2.384877, 1, 1, 1, 1, 1,
1.358976, -1.457743, 3.047769, 1, 1, 1, 1, 1,
1.366361, -1.282154, 2.63057, 0, 0, 1, 1, 1,
1.368618, 0.1582863, 0.3153404, 1, 0, 0, 1, 1,
1.370499, -0.02058803, 1.003953, 1, 0, 0, 1, 1,
1.373712, 0.81593, 3.032125, 1, 0, 0, 1, 1,
1.375918, 1.244946, 0.4596621, 1, 0, 0, 1, 1,
1.383726, -0.3399143, 2.630424, 1, 0, 0, 1, 1,
1.389468, -0.7267991, 0.853736, 0, 0, 0, 1, 1,
1.400393, -0.5852396, 2.389032, 0, 0, 0, 1, 1,
1.422341, -0.6382747, 3.486483, 0, 0, 0, 1, 1,
1.439817, -0.04884168, 1.290634, 0, 0, 0, 1, 1,
1.440037, 0.3690744, 1.699147, 0, 0, 0, 1, 1,
1.440334, 0.3619687, 1.668828, 0, 0, 0, 1, 1,
1.461333, -0.2941695, 2.329594, 0, 0, 0, 1, 1,
1.462036, 0.708314, 0.8386714, 1, 1, 1, 1, 1,
1.465208, -0.9652663, 3.299984, 1, 1, 1, 1, 1,
1.466802, -0.7733414, 1.497258, 1, 1, 1, 1, 1,
1.470736, -1.31163, 2.184862, 1, 1, 1, 1, 1,
1.484349, -0.7751431, 1.124895, 1, 1, 1, 1, 1,
1.488443, -0.5702149, 0.862703, 1, 1, 1, 1, 1,
1.497095, -1.36997, 1.634827, 1, 1, 1, 1, 1,
1.509812, 0.8417343, -0.6094449, 1, 1, 1, 1, 1,
1.530531, 1.345123, 1.448518, 1, 1, 1, 1, 1,
1.549954, -2.31512, 1.508386, 1, 1, 1, 1, 1,
1.550616, -0.5846717, -1.333609, 1, 1, 1, 1, 1,
1.556194, -0.5389972, 3.002681, 1, 1, 1, 1, 1,
1.574141, 0.08235241, 1.198539, 1, 1, 1, 1, 1,
1.578885, -0.12289, 0.8125713, 1, 1, 1, 1, 1,
1.602756, 0.06363701, 1.442747, 1, 1, 1, 1, 1,
1.606589, -1.670416, 2.772431, 0, 0, 1, 1, 1,
1.607864, -0.6287374, 1.083522, 1, 0, 0, 1, 1,
1.61239, 0.5004278, 0.7473916, 1, 0, 0, 1, 1,
1.624119, 0.9726339, 1.282127, 1, 0, 0, 1, 1,
1.648917, 0.3726641, 0.3215398, 1, 0, 0, 1, 1,
1.682939, -0.5313168, 2.508882, 1, 0, 0, 1, 1,
1.697187, -0.7476005, 1.419965, 0, 0, 0, 1, 1,
1.700846, 0.09153023, 2.838159, 0, 0, 0, 1, 1,
1.705282, -0.9877039, -0.7356926, 0, 0, 0, 1, 1,
1.728343, 1.106905, 1.070128, 0, 0, 0, 1, 1,
1.732675, 1.303187, -1.026438, 0, 0, 0, 1, 1,
1.746708, 1.262558, -1.507379, 0, 0, 0, 1, 1,
1.756459, 0.1722931, 2.341455, 0, 0, 0, 1, 1,
1.773415, -0.1789127, 1.938289, 1, 1, 1, 1, 1,
1.78718, 0.3880924, 2.703875, 1, 1, 1, 1, 1,
1.814565, -2.315199, 3.147545, 1, 1, 1, 1, 1,
1.828529, -0.03517706, 1.084708, 1, 1, 1, 1, 1,
1.84429, -0.5384427, 0.946922, 1, 1, 1, 1, 1,
1.864475, -1.070529, 2.062456, 1, 1, 1, 1, 1,
1.876552, 0.8393217, 2.166822, 1, 1, 1, 1, 1,
1.898796, 1.507386, 0.8101755, 1, 1, 1, 1, 1,
1.943144, -1.106578, 1.58132, 1, 1, 1, 1, 1,
1.970131, -0.9773288, 1.757037, 1, 1, 1, 1, 1,
1.988692, -0.1357732, 0.3200038, 1, 1, 1, 1, 1,
2.00406, -1.476701, 2.013651, 1, 1, 1, 1, 1,
2.01408, -1.716717, 0.9731936, 1, 1, 1, 1, 1,
2.023741, 1.588257, 0.8048651, 1, 1, 1, 1, 1,
2.025886, -1.017452, 0.7936853, 1, 1, 1, 1, 1,
2.064916, 0.1040328, 3.118442, 0, 0, 1, 1, 1,
2.179701, 0.2181714, 1.45859, 1, 0, 0, 1, 1,
2.211081, 1.176887, 1.390514, 1, 0, 0, 1, 1,
2.220214, -0.8644902, 0.3263974, 1, 0, 0, 1, 1,
2.231076, 1.248663, 2.18016, 1, 0, 0, 1, 1,
2.238042, -0.6432337, 1.331517, 1, 0, 0, 1, 1,
2.250004, 0.4678733, -0.2669764, 0, 0, 0, 1, 1,
2.269941, -1.640407, 0.696578, 0, 0, 0, 1, 1,
2.335846, 1.449405, -0.5162027, 0, 0, 0, 1, 1,
2.349677, -1.086445, 3.788087, 0, 0, 0, 1, 1,
2.371728, -0.8364639, 1.499167, 0, 0, 0, 1, 1,
2.430582, 0.6463274, 0.961233, 0, 0, 0, 1, 1,
2.439838, 0.4407364, 0.7397494, 0, 0, 0, 1, 1,
2.481714, -0.2737212, 1.729638, 1, 1, 1, 1, 1,
2.552228, 0.355564, 1.655651, 1, 1, 1, 1, 1,
2.725395, 0.1045773, 1.440616, 1, 1, 1, 1, 1,
2.800216, 1.029049, 1.454478, 1, 1, 1, 1, 1,
2.873526, -0.6711919, 1.636391, 1, 1, 1, 1, 1,
3.123704, -0.9363744, 2.748153, 1, 1, 1, 1, 1,
3.641947, -0.1725105, 0.5079138, 1, 1, 1, 1, 1
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
var radius = 9.811096;
var distance = 34.46106;
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
mvMatrix.translate( -0.04832888, -0.17346, 0.3567812 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46106);
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
