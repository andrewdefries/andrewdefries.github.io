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
-3.125926, -0.9151539, -1.460591, 1, 0, 0, 1,
-2.804044, 0.753911, -0.8073049, 1, 0.007843138, 0, 1,
-2.727642, 0.1777674, -1.865216, 1, 0.01176471, 0, 1,
-2.666215, -0.545943, -1.079372, 1, 0.01960784, 0, 1,
-2.636992, 1.668961, -0.9578085, 1, 0.02352941, 0, 1,
-2.557774, -0.3387946, 0.2252122, 1, 0.03137255, 0, 1,
-2.526585, -0.8327399, -2.66112, 1, 0.03529412, 0, 1,
-2.386195, 0.3352391, -1.014787, 1, 0.04313726, 0, 1,
-2.376497, -0.1730058, -1.293637, 1, 0.04705882, 0, 1,
-2.277808, -1.155835, -2.894569, 1, 0.05490196, 0, 1,
-2.167444, 0.05842008, -2.623297, 1, 0.05882353, 0, 1,
-2.111921, -1.214955, -2.378414, 1, 0.06666667, 0, 1,
-2.056625, -0.6615286, -3.46778, 1, 0.07058824, 0, 1,
-2.048496, 1.301194, -1.230691, 1, 0.07843138, 0, 1,
-2.014528, -0.9649664, -1.268831, 1, 0.08235294, 0, 1,
-2.004446, -1.529204, -1.559667, 1, 0.09019608, 0, 1,
-1.935482, 1.007388, -2.794874, 1, 0.09411765, 0, 1,
-1.929803, -0.1444132, -0.4637228, 1, 0.1019608, 0, 1,
-1.893788, -0.9967206, -0.4273959, 1, 0.1098039, 0, 1,
-1.889296, 0.5494431, -1.30418, 1, 0.1137255, 0, 1,
-1.883403, 0.9082454, -0.336104, 1, 0.1215686, 0, 1,
-1.852923, 0.09853765, -4.320742, 1, 0.1254902, 0, 1,
-1.851797, -0.3105002, -4.183946, 1, 0.1333333, 0, 1,
-1.84901, -0.9272868, -2.47424, 1, 0.1372549, 0, 1,
-1.823731, 0.9040883, -1.067691, 1, 0.145098, 0, 1,
-1.805399, 0.3743878, -0.6734309, 1, 0.1490196, 0, 1,
-1.802905, -1.03841, -3.954536, 1, 0.1568628, 0, 1,
-1.800208, 0.4268306, 1.167396, 1, 0.1607843, 0, 1,
-1.778975, 0.452314, -1.677787, 1, 0.1686275, 0, 1,
-1.774307, -0.6230471, -3.626275, 1, 0.172549, 0, 1,
-1.754593, 0.5816426, -0.8132316, 1, 0.1803922, 0, 1,
-1.73692, 0.3389159, -1.669675, 1, 0.1843137, 0, 1,
-1.727578, 0.9293408, -1.6474, 1, 0.1921569, 0, 1,
-1.705687, 1.345446, -1.818408, 1, 0.1960784, 0, 1,
-1.704469, 0.1150504, -4.839208, 1, 0.2039216, 0, 1,
-1.681972, 0.4278609, 1.144876, 1, 0.2117647, 0, 1,
-1.678786, -0.560307, -2.172657, 1, 0.2156863, 0, 1,
-1.674047, 0.01622354, -3.013995, 1, 0.2235294, 0, 1,
-1.66971, -0.578016, -1.771304, 1, 0.227451, 0, 1,
-1.624169, -0.6012415, 1.730311, 1, 0.2352941, 0, 1,
-1.617806, 0.3859264, 0.5802795, 1, 0.2392157, 0, 1,
-1.616239, 0.6817745, 0.08989371, 1, 0.2470588, 0, 1,
-1.594148, 0.4160735, -0.9129521, 1, 0.2509804, 0, 1,
-1.586463, 1.140045, -0.4864182, 1, 0.2588235, 0, 1,
-1.582862, 1.611935, -0.6978709, 1, 0.2627451, 0, 1,
-1.572266, -1.408976, -3.178852, 1, 0.2705882, 0, 1,
-1.549677, -0.1538004, -2.227927, 1, 0.2745098, 0, 1,
-1.54782, 0.0490255, -2.066598, 1, 0.282353, 0, 1,
-1.530078, -0.14798, -3.003755, 1, 0.2862745, 0, 1,
-1.52607, 0.835963, 0.6741882, 1, 0.2941177, 0, 1,
-1.518261, 0.1484708, -0.3899221, 1, 0.3019608, 0, 1,
-1.488321, -0.6997412, -3.134929, 1, 0.3058824, 0, 1,
-1.483714, 0.7564276, -0.5033991, 1, 0.3137255, 0, 1,
-1.4827, -0.3260787, -2.626889, 1, 0.3176471, 0, 1,
-1.475009, 0.3115536, -1.664046, 1, 0.3254902, 0, 1,
-1.473468, -0.2837407, 0.01013904, 1, 0.3294118, 0, 1,
-1.463591, 0.1453977, -2.207103, 1, 0.3372549, 0, 1,
-1.460243, 0.9427855, 0.7060643, 1, 0.3411765, 0, 1,
-1.456162, -0.8446357, -0.9253882, 1, 0.3490196, 0, 1,
-1.426452, 0.5081655, -1.244368, 1, 0.3529412, 0, 1,
-1.424989, 0.6933794, -2.435734, 1, 0.3607843, 0, 1,
-1.417837, -1.35108, -2.273155, 1, 0.3647059, 0, 1,
-1.40501, 1.431573, -1.951976, 1, 0.372549, 0, 1,
-1.403141, 0.1137903, -0.5159787, 1, 0.3764706, 0, 1,
-1.398998, 1.787902, -0.1641024, 1, 0.3843137, 0, 1,
-1.398879, 0.2736304, -1.633829, 1, 0.3882353, 0, 1,
-1.392951, 0.7803234, -0.6809756, 1, 0.3960784, 0, 1,
-1.390493, -1.4926, -2.675857, 1, 0.4039216, 0, 1,
-1.386564, -1.905777, -4.172955, 1, 0.4078431, 0, 1,
-1.377266, -0.7556565, -2.713558, 1, 0.4156863, 0, 1,
-1.375041, 0.5131944, -2.806073, 1, 0.4196078, 0, 1,
-1.373953, -0.3907542, -2.244242, 1, 0.427451, 0, 1,
-1.371323, -2.025963, -3.285028, 1, 0.4313726, 0, 1,
-1.366414, 0.7644157, -2.143893, 1, 0.4392157, 0, 1,
-1.358971, 0.2434819, -1.073065, 1, 0.4431373, 0, 1,
-1.358641, -1.369835, -2.628826, 1, 0.4509804, 0, 1,
-1.350389, 0.90477, 1.301456, 1, 0.454902, 0, 1,
-1.35023, -0.3346983, -1.443459, 1, 0.4627451, 0, 1,
-1.34561, 0.7184209, -0.343534, 1, 0.4666667, 0, 1,
-1.34043, -0.3792495, -2.363614, 1, 0.4745098, 0, 1,
-1.333112, 1.603387, -2.045518, 1, 0.4784314, 0, 1,
-1.32966, 0.9537374, -1.583141, 1, 0.4862745, 0, 1,
-1.321987, -1.966077, -2.234946, 1, 0.4901961, 0, 1,
-1.317884, 2.154268, -0.166989, 1, 0.4980392, 0, 1,
-1.315819, 0.4810387, -1.002537, 1, 0.5058824, 0, 1,
-1.315452, 0.1698554, 0.1358776, 1, 0.509804, 0, 1,
-1.297177, 0.5034129, -1.787901, 1, 0.5176471, 0, 1,
-1.292267, 0.6019928, -1.867498, 1, 0.5215687, 0, 1,
-1.280217, 0.3745905, -1.385705, 1, 0.5294118, 0, 1,
-1.278023, 0.7272802, -1.663559, 1, 0.5333334, 0, 1,
-1.251656, 0.3739436, 0.06516428, 1, 0.5411765, 0, 1,
-1.249605, -0.3238178, -1.172357, 1, 0.5450981, 0, 1,
-1.247704, 0.2312467, -1.580556, 1, 0.5529412, 0, 1,
-1.238236, -1.239893, -2.387012, 1, 0.5568628, 0, 1,
-1.237879, -0.5432112, -2.421725, 1, 0.5647059, 0, 1,
-1.226526, 0.2845647, -2.034242, 1, 0.5686275, 0, 1,
-1.223866, 2.565908, -1.486674, 1, 0.5764706, 0, 1,
-1.223351, 2.560124, -0.8229322, 1, 0.5803922, 0, 1,
-1.221359, -0.7058811, -1.901073, 1, 0.5882353, 0, 1,
-1.218392, -1.732258, -3.490848, 1, 0.5921569, 0, 1,
-1.207888, 0.1610455, -2.037501, 1, 0.6, 0, 1,
-1.202114, 0.7172241, -2.210998, 1, 0.6078432, 0, 1,
-1.200143, 0.4260188, 0.1111027, 1, 0.6117647, 0, 1,
-1.199039, -0.3996005, -2.325465, 1, 0.6196079, 0, 1,
-1.193616, 0.08841892, -0.9207335, 1, 0.6235294, 0, 1,
-1.19151, -0.4299444, -0.8353729, 1, 0.6313726, 0, 1,
-1.185521, 0.513306, -3.211932, 1, 0.6352941, 0, 1,
-1.175603, -0.951737, -4.401495, 1, 0.6431373, 0, 1,
-1.161729, -0.8661867, -2.683537, 1, 0.6470588, 0, 1,
-1.15761, -1.407331, -2.272786, 1, 0.654902, 0, 1,
-1.149822, 0.7481647, -2.936643, 1, 0.6588235, 0, 1,
-1.149557, -0.1826131, -2.196172, 1, 0.6666667, 0, 1,
-1.146653, 1.828527, 0.02137675, 1, 0.6705883, 0, 1,
-1.138517, -0.3203661, -1.321216, 1, 0.6784314, 0, 1,
-1.122759, -1.138503, -2.809042, 1, 0.682353, 0, 1,
-1.099491, -1.994362, -1.386297, 1, 0.6901961, 0, 1,
-1.078616, 0.5226002, -0.8332845, 1, 0.6941177, 0, 1,
-1.06858, 1.922838, -0.5186226, 1, 0.7019608, 0, 1,
-1.066246, -0.6288925, -2.00444, 1, 0.7098039, 0, 1,
-1.053354, 2.203564, -1.059944, 1, 0.7137255, 0, 1,
-1.051553, -0.3032712, -3.341735, 1, 0.7215686, 0, 1,
-1.050757, 0.2329526, -1.321748, 1, 0.7254902, 0, 1,
-1.042082, 2.535282, -1.114624, 1, 0.7333333, 0, 1,
-1.020137, 0.1019119, -0.2529229, 1, 0.7372549, 0, 1,
-1.019729, 0.57683, -1.543203, 1, 0.7450981, 0, 1,
-1.017053, 1.554296, -0.156717, 1, 0.7490196, 0, 1,
-1.013629, 0.7531208, -1.524499, 1, 0.7568628, 0, 1,
-1.011746, -1.305849, -2.18098, 1, 0.7607843, 0, 1,
-1.009312, 0.8303021, -1.190406, 1, 0.7686275, 0, 1,
-1.000655, -0.07596853, -0.1618686, 1, 0.772549, 0, 1,
-0.9904258, -1.091755, -2.509558, 1, 0.7803922, 0, 1,
-0.9810619, 2.880083, -2.169714, 1, 0.7843137, 0, 1,
-0.9803949, -0.6916571, -3.096326, 1, 0.7921569, 0, 1,
-0.9517055, 1.231563, -0.6908819, 1, 0.7960784, 0, 1,
-0.9514443, -0.9995106, -1.740336, 1, 0.8039216, 0, 1,
-0.9483186, -2.337974, -0.9110824, 1, 0.8117647, 0, 1,
-0.9445928, -0.2913229, -2.264235, 1, 0.8156863, 0, 1,
-0.9436586, -0.3970278, -2.698886, 1, 0.8235294, 0, 1,
-0.942537, 1.528635, -0.9969244, 1, 0.827451, 0, 1,
-0.9379233, 0.2094553, -0.8156974, 1, 0.8352941, 0, 1,
-0.9372222, 0.3885632, -1.265059, 1, 0.8392157, 0, 1,
-0.9358379, 1.53307, -1.531183, 1, 0.8470588, 0, 1,
-0.9332252, 0.8649525, -1.188209, 1, 0.8509804, 0, 1,
-0.9322509, -2.227369, -4.511087, 1, 0.8588235, 0, 1,
-0.9248894, -1.598514, -4.060697, 1, 0.8627451, 0, 1,
-0.9199007, -0.5573717, -2.273676, 1, 0.8705882, 0, 1,
-0.9191662, 0.3125372, -1.073687, 1, 0.8745098, 0, 1,
-0.9143339, -0.1430915, -1.475068, 1, 0.8823529, 0, 1,
-0.9102167, -0.0139362, -0.4168414, 1, 0.8862745, 0, 1,
-0.9101694, -0.2412511, -3.549725, 1, 0.8941177, 0, 1,
-0.9055511, 1.303566, 0.198687, 1, 0.8980392, 0, 1,
-0.9055041, -0.2655478, -2.964814, 1, 0.9058824, 0, 1,
-0.8928885, -0.01185685, -2.853225, 1, 0.9137255, 0, 1,
-0.8921052, -0.7005026, -3.66402, 1, 0.9176471, 0, 1,
-0.8822151, 0.7032616, -2.248275, 1, 0.9254902, 0, 1,
-0.8816687, -0.14413, -1.863706, 1, 0.9294118, 0, 1,
-0.8812467, 1.228509, -0.9346928, 1, 0.9372549, 0, 1,
-0.8811364, 0.4919997, -1.951186, 1, 0.9411765, 0, 1,
-0.8791878, -0.8839537, -3.918547, 1, 0.9490196, 0, 1,
-0.8760989, -0.05214594, -2.436002, 1, 0.9529412, 0, 1,
-0.8737985, 0.04156753, 0.8308378, 1, 0.9607843, 0, 1,
-0.87195, 2.004191, 0.5741524, 1, 0.9647059, 0, 1,
-0.8670439, 0.731152, 0.4152844, 1, 0.972549, 0, 1,
-0.8609396, 0.1045595, -0.7395138, 1, 0.9764706, 0, 1,
-0.8542134, -0.6539689, -2.44293, 1, 0.9843137, 0, 1,
-0.852586, 2.323447, -1.262352, 1, 0.9882353, 0, 1,
-0.8516231, 0.5306989, -2.717246, 1, 0.9960784, 0, 1,
-0.8495135, 1.116678, -1.722312, 0.9960784, 1, 0, 1,
-0.8489368, 0.9830415, -0.05555013, 0.9921569, 1, 0, 1,
-0.8482538, 0.3333184, -1.591569, 0.9843137, 1, 0, 1,
-0.8416241, -0.3507344, -0.977132, 0.9803922, 1, 0, 1,
-0.8367689, 1.199374, -0.5178587, 0.972549, 1, 0, 1,
-0.826, 1.208226, -1.184651, 0.9686275, 1, 0, 1,
-0.8183292, -0.8422096, -1.971571, 0.9607843, 1, 0, 1,
-0.8155073, -0.1739761, -1.305333, 0.9568627, 1, 0, 1,
-0.8108799, 0.01564832, 1.11108, 0.9490196, 1, 0, 1,
-0.8064625, -0.9700475, -3.359294, 0.945098, 1, 0, 1,
-0.8052637, 0.2142184, -2.814781, 0.9372549, 1, 0, 1,
-0.8019754, 0.8446364, -0.9906228, 0.9333333, 1, 0, 1,
-0.7973196, 2.44322, -0.2413227, 0.9254902, 1, 0, 1,
-0.7973017, -1.083833, -2.509931, 0.9215686, 1, 0, 1,
-0.7953237, 1.357852, 0.956418, 0.9137255, 1, 0, 1,
-0.7903855, 0.5871165, -1.684078, 0.9098039, 1, 0, 1,
-0.7868981, 0.3410155, -2.158164, 0.9019608, 1, 0, 1,
-0.7841209, -0.7842377, -3.028576, 0.8941177, 1, 0, 1,
-0.7697207, 1.031151, -2.387631, 0.8901961, 1, 0, 1,
-0.7684065, -1.366141, -3.287607, 0.8823529, 1, 0, 1,
-0.7674934, 0.03641813, -0.5220153, 0.8784314, 1, 0, 1,
-0.7620617, -0.502782, -1.665052, 0.8705882, 1, 0, 1,
-0.7618131, -0.3819193, -2.614135, 0.8666667, 1, 0, 1,
-0.7606434, -0.1418394, -3.272192, 0.8588235, 1, 0, 1,
-0.7599837, -0.9788355, -2.214455, 0.854902, 1, 0, 1,
-0.7557656, -0.1838377, -1.79881, 0.8470588, 1, 0, 1,
-0.754328, -0.5578353, -3.306782, 0.8431373, 1, 0, 1,
-0.7538738, -1.616305, -1.194235, 0.8352941, 1, 0, 1,
-0.7496977, -0.7581485, -2.245494, 0.8313726, 1, 0, 1,
-0.7397053, 0.8017074, 0.1483511, 0.8235294, 1, 0, 1,
-0.739179, -0.5159054, -0.883903, 0.8196079, 1, 0, 1,
-0.7354628, 2.081406, 1.098048, 0.8117647, 1, 0, 1,
-0.7259629, 0.2097891, 0.5350869, 0.8078431, 1, 0, 1,
-0.722731, -0.418553, -3.266584, 0.8, 1, 0, 1,
-0.7135203, -1.662424, -2.79177, 0.7921569, 1, 0, 1,
-0.7129275, -0.6040469, -1.267064, 0.7882353, 1, 0, 1,
-0.7107933, 2.48285, 0.5332804, 0.7803922, 1, 0, 1,
-0.709498, -0.9581504, -5.28371, 0.7764706, 1, 0, 1,
-0.6970855, -0.4962724, -3.255558, 0.7686275, 1, 0, 1,
-0.6960386, -1.663796, -2.610162, 0.7647059, 1, 0, 1,
-0.6876436, -0.4964531, -1.878621, 0.7568628, 1, 0, 1,
-0.6741378, 0.03269695, -1.578389, 0.7529412, 1, 0, 1,
-0.6731992, 0.7038709, -0.4547284, 0.7450981, 1, 0, 1,
-0.6688533, -0.6739925, -2.742966, 0.7411765, 1, 0, 1,
-0.6645098, 0.4494109, -2.336612, 0.7333333, 1, 0, 1,
-0.6608116, 0.07460172, -1.47603, 0.7294118, 1, 0, 1,
-0.6551349, 0.250161, -0.01252702, 0.7215686, 1, 0, 1,
-0.6545498, 2.032588, -1.433944, 0.7176471, 1, 0, 1,
-0.6536077, 0.07438274, -1.869237, 0.7098039, 1, 0, 1,
-0.6522216, 0.1852162, -0.6316644, 0.7058824, 1, 0, 1,
-0.6517082, -0.4901621, -2.602069, 0.6980392, 1, 0, 1,
-0.6516914, 0.4611127, -1.275785, 0.6901961, 1, 0, 1,
-0.6509609, -0.007871536, -2.236982, 0.6862745, 1, 0, 1,
-0.649599, 0.9021855, -0.6580099, 0.6784314, 1, 0, 1,
-0.6475214, 1.103719, -0.1344326, 0.6745098, 1, 0, 1,
-0.645696, 0.03653944, -0.4865398, 0.6666667, 1, 0, 1,
-0.630484, 1.447176, 0.5756289, 0.6627451, 1, 0, 1,
-0.6232839, 1.65294, -1.513726, 0.654902, 1, 0, 1,
-0.6227866, 1.260947, -1.353322, 0.6509804, 1, 0, 1,
-0.6214723, -1.02586, -2.682933, 0.6431373, 1, 0, 1,
-0.6148687, -0.5773415, -1.902844, 0.6392157, 1, 0, 1,
-0.613709, 0.6823654, -0.3523717, 0.6313726, 1, 0, 1,
-0.6116144, -0.3269668, -0.2115339, 0.627451, 1, 0, 1,
-0.6067065, 0.7874779, 0.2102002, 0.6196079, 1, 0, 1,
-0.6061031, -0.04819571, -0.5169228, 0.6156863, 1, 0, 1,
-0.6012957, 0.7619455, -0.2462133, 0.6078432, 1, 0, 1,
-0.598344, 0.1000635, -0.8688275, 0.6039216, 1, 0, 1,
-0.5951397, 0.759814, -0.4724694, 0.5960785, 1, 0, 1,
-0.5931229, -0.7309044, -2.470065, 0.5882353, 1, 0, 1,
-0.5925447, -0.4708137, -3.100009, 0.5843138, 1, 0, 1,
-0.5919616, 0.4815578, -1.154515, 0.5764706, 1, 0, 1,
-0.5898868, 0.1596272, -0.5050144, 0.572549, 1, 0, 1,
-0.586275, 0.1149867, -0.5337963, 0.5647059, 1, 0, 1,
-0.5859312, -0.1988432, -3.032112, 0.5607843, 1, 0, 1,
-0.5801305, -0.3834161, -3.299203, 0.5529412, 1, 0, 1,
-0.5793505, 1.115098, -0.598693, 0.5490196, 1, 0, 1,
-0.5785055, -0.5116616, -1.3582, 0.5411765, 1, 0, 1,
-0.577723, 0.9727141, -1.113316, 0.5372549, 1, 0, 1,
-0.5747405, 1.347757, -1.01399, 0.5294118, 1, 0, 1,
-0.5626637, -0.1484306, -1.218, 0.5254902, 1, 0, 1,
-0.5613281, 1.811915, -0.5725981, 0.5176471, 1, 0, 1,
-0.5602161, 0.08881886, -1.1051, 0.5137255, 1, 0, 1,
-0.5597103, 0.4059259, -1.855165, 0.5058824, 1, 0, 1,
-0.5540958, -1.890453, -3.672451, 0.5019608, 1, 0, 1,
-0.5530112, 0.2272328, -1.808916, 0.4941176, 1, 0, 1,
-0.5503191, -1.059254, -2.903977, 0.4862745, 1, 0, 1,
-0.5423799, -0.8790987, -0.3157445, 0.4823529, 1, 0, 1,
-0.5341378, 0.1053022, -0.141126, 0.4745098, 1, 0, 1,
-0.531767, 1.258988, 0.3591796, 0.4705882, 1, 0, 1,
-0.529492, -1.114127, -2.936987, 0.4627451, 1, 0, 1,
-0.529136, -0.5992539, -3.509471, 0.4588235, 1, 0, 1,
-0.5278254, -0.3694247, -2.135379, 0.4509804, 1, 0, 1,
-0.5233391, 0.1285713, -1.296308, 0.4470588, 1, 0, 1,
-0.5231147, 1.522251, 0.3735881, 0.4392157, 1, 0, 1,
-0.5068741, 0.7304599, -0.3461223, 0.4352941, 1, 0, 1,
-0.5064654, -0.6847013, -2.481671, 0.427451, 1, 0, 1,
-0.5011661, -1.59267, -2.267775, 0.4235294, 1, 0, 1,
-0.5010911, 0.2107837, -1.168155, 0.4156863, 1, 0, 1,
-0.4972282, -0.06887471, -1.464719, 0.4117647, 1, 0, 1,
-0.4942436, 1.997869, 0.3477454, 0.4039216, 1, 0, 1,
-0.4914284, 0.5932357, -0.784706, 0.3960784, 1, 0, 1,
-0.4879273, 0.5576728, -0.2240702, 0.3921569, 1, 0, 1,
-0.4863262, 0.617819, -0.5343826, 0.3843137, 1, 0, 1,
-0.4852426, 0.6959798, -0.4765619, 0.3803922, 1, 0, 1,
-0.4849473, -0.7086344, -1.224782, 0.372549, 1, 0, 1,
-0.4818353, 0.3999067, -0.453225, 0.3686275, 1, 0, 1,
-0.4794492, 0.6646503, -1.941193, 0.3607843, 1, 0, 1,
-0.4785944, 0.008618166, -2.893006, 0.3568628, 1, 0, 1,
-0.474562, 0.7380487, -1.470986, 0.3490196, 1, 0, 1,
-0.4743479, -1.358321, -1.741025, 0.345098, 1, 0, 1,
-0.4699393, 0.642709, 0.207731, 0.3372549, 1, 0, 1,
-0.4698001, 0.3449067, -2.73705, 0.3333333, 1, 0, 1,
-0.4644535, -1.178424, -0.5203676, 0.3254902, 1, 0, 1,
-0.4643995, -1.089855, -4.410384, 0.3215686, 1, 0, 1,
-0.4571397, -0.9108811, -2.657574, 0.3137255, 1, 0, 1,
-0.4517529, -0.3180486, -1.902605, 0.3098039, 1, 0, 1,
-0.4388316, 0.2425245, -0.510288, 0.3019608, 1, 0, 1,
-0.4267322, 0.3276656, -0.6465679, 0.2941177, 1, 0, 1,
-0.4225932, -0.9891914, -1.788625, 0.2901961, 1, 0, 1,
-0.4170561, -0.3670093, -2.355788, 0.282353, 1, 0, 1,
-0.4162076, 0.1645005, -1.260048, 0.2784314, 1, 0, 1,
-0.4152559, -1.19699, -3.055892, 0.2705882, 1, 0, 1,
-0.414631, 0.326739, -2.155956, 0.2666667, 1, 0, 1,
-0.4143735, -0.781743, -3.074915, 0.2588235, 1, 0, 1,
-0.4141983, 0.02840937, -0.338762, 0.254902, 1, 0, 1,
-0.4033953, -0.4655442, -1.643906, 0.2470588, 1, 0, 1,
-0.4006045, -0.2023842, -2.038392, 0.2431373, 1, 0, 1,
-0.3979389, 0.283222, -2.187672, 0.2352941, 1, 0, 1,
-0.3955017, -1.084476, -3.666398, 0.2313726, 1, 0, 1,
-0.3943849, -1.253723, -1.904353, 0.2235294, 1, 0, 1,
-0.3917333, 2.218911, 0.8600599, 0.2196078, 1, 0, 1,
-0.3873298, 0.08062579, -3.080025, 0.2117647, 1, 0, 1,
-0.3847475, -1.751121, -1.527544, 0.2078431, 1, 0, 1,
-0.3835168, -1.302697, -4.007309, 0.2, 1, 0, 1,
-0.3820076, 0.6400775, -1.361552, 0.1921569, 1, 0, 1,
-0.3802208, -1.282594, -2.827912, 0.1882353, 1, 0, 1,
-0.3775516, -2.642319, -2.221599, 0.1803922, 1, 0, 1,
-0.3775108, 0.8089465, 1.232088, 0.1764706, 1, 0, 1,
-0.3773794, -2.047522, -3.465997, 0.1686275, 1, 0, 1,
-0.3696137, 0.1480367, -1.008903, 0.1647059, 1, 0, 1,
-0.3679011, 0.0485736, -3.878497, 0.1568628, 1, 0, 1,
-0.3662381, -0.04940616, -2.082022, 0.1529412, 1, 0, 1,
-0.3572513, -0.2222336, -1.45274, 0.145098, 1, 0, 1,
-0.3524012, -0.8728748, -1.55943, 0.1411765, 1, 0, 1,
-0.3521427, -0.7767378, -2.87241, 0.1333333, 1, 0, 1,
-0.3521089, -0.601624, -3.110157, 0.1294118, 1, 0, 1,
-0.3476737, -0.03319183, -2.60293, 0.1215686, 1, 0, 1,
-0.3460311, 0.2275992, -2.225631, 0.1176471, 1, 0, 1,
-0.3435134, 0.7495291, -2.2028, 0.1098039, 1, 0, 1,
-0.3433692, 1.756329, 0.007764834, 0.1058824, 1, 0, 1,
-0.3413958, 0.2439125, -2.356866, 0.09803922, 1, 0, 1,
-0.3333363, 0.3922445, -2.483716, 0.09019608, 1, 0, 1,
-0.3314908, 0.7862384, 1.176105, 0.08627451, 1, 0, 1,
-0.3308243, 1.047955, -0.7206365, 0.07843138, 1, 0, 1,
-0.3294868, 0.9509333, 1.797986, 0.07450981, 1, 0, 1,
-0.3291785, -0.9314821, -2.352115, 0.06666667, 1, 0, 1,
-0.3282642, 0.5705608, 0.7035708, 0.0627451, 1, 0, 1,
-0.3278494, -0.6993451, -2.448007, 0.05490196, 1, 0, 1,
-0.3178095, -0.740144, -2.443801, 0.05098039, 1, 0, 1,
-0.3144929, -0.7051788, -4.222604, 0.04313726, 1, 0, 1,
-0.3140422, -0.4650582, -1.331046, 0.03921569, 1, 0, 1,
-0.3125116, 0.3852397, -2.020197, 0.03137255, 1, 0, 1,
-0.3090076, -0.627148, -3.116657, 0.02745098, 1, 0, 1,
-0.3045609, -0.4231329, -0.9936907, 0.01960784, 1, 0, 1,
-0.3022017, -0.7825472, -3.725153, 0.01568628, 1, 0, 1,
-0.2996031, 0.8579327, -2.221979, 0.007843138, 1, 0, 1,
-0.2895466, -1.827306, -4.101675, 0.003921569, 1, 0, 1,
-0.2711251, 0.8452405, 2.244432, 0, 1, 0.003921569, 1,
-0.2663182, 0.3769053, -0.7471254, 0, 1, 0.01176471, 1,
-0.2646312, -0.9291291, -1.981059, 0, 1, 0.01568628, 1,
-0.2575894, -0.04063379, -2.400727, 0, 1, 0.02352941, 1,
-0.257267, -0.4562272, -1.609243, 0, 1, 0.02745098, 1,
-0.2540345, -1.188235, -3.062903, 0, 1, 0.03529412, 1,
-0.2534013, 0.8867119, 2.06126, 0, 1, 0.03921569, 1,
-0.2501063, -0.1775307, -1.140925, 0, 1, 0.04705882, 1,
-0.249, 0.9695719, -0.1179957, 0, 1, 0.05098039, 1,
-0.2474935, -0.09242521, -2.607436, 0, 1, 0.05882353, 1,
-0.2467767, 0.6981902, 0.123766, 0, 1, 0.0627451, 1,
-0.2465447, 0.02930352, -2.152316, 0, 1, 0.07058824, 1,
-0.2442166, 1.951265, -0.2039878, 0, 1, 0.07450981, 1,
-0.2417813, 1.96415, -0.2125387, 0, 1, 0.08235294, 1,
-0.2381881, 1.946529, -0.235159, 0, 1, 0.08627451, 1,
-0.2333109, -1.408001, -3.294318, 0, 1, 0.09411765, 1,
-0.2324409, 0.07652871, -1.190476, 0, 1, 0.1019608, 1,
-0.232162, 0.2935701, -0.672004, 0, 1, 0.1058824, 1,
-0.2306372, -0.4397876, -3.140505, 0, 1, 0.1137255, 1,
-0.2290462, -0.7371582, -2.878044, 0, 1, 0.1176471, 1,
-0.2284824, 0.5727099, 0.53567, 0, 1, 0.1254902, 1,
-0.2271397, -0.520222, -2.546569, 0, 1, 0.1294118, 1,
-0.2265119, -0.7367977, -1.679049, 0, 1, 0.1372549, 1,
-0.2255659, -0.227735, -4.344809, 0, 1, 0.1411765, 1,
-0.2248321, -1.684929, -3.471506, 0, 1, 0.1490196, 1,
-0.221003, 0.1226393, -0.4580744, 0, 1, 0.1529412, 1,
-0.2167058, -0.2520256, -2.766927, 0, 1, 0.1607843, 1,
-0.2151985, -0.5295327, -2.569537, 0, 1, 0.1647059, 1,
-0.2106247, -0.2238809, -1.139705, 0, 1, 0.172549, 1,
-0.2033121, 0.6102129, -0.03310899, 0, 1, 0.1764706, 1,
-0.1997253, 1.000684, 0.4635515, 0, 1, 0.1843137, 1,
-0.1981824, -0.08251619, -2.602353, 0, 1, 0.1882353, 1,
-0.1979502, -0.3655576, -2.408983, 0, 1, 0.1960784, 1,
-0.1974855, -0.9457015, -3.160163, 0, 1, 0.2039216, 1,
-0.194447, -0.8081237, -2.396219, 0, 1, 0.2078431, 1,
-0.1924289, -0.947768, -2.617184, 0, 1, 0.2156863, 1,
-0.1906908, 0.8218088, -0.07001124, 0, 1, 0.2196078, 1,
-0.1859051, 1.126006, -0.8287326, 0, 1, 0.227451, 1,
-0.1757631, -1.165892, -2.592797, 0, 1, 0.2313726, 1,
-0.1756757, 0.4189126, -1.274877, 0, 1, 0.2392157, 1,
-0.1711718, -0.91429, -4.543199, 0, 1, 0.2431373, 1,
-0.16948, -1.638499, -6.18153, 0, 1, 0.2509804, 1,
-0.1675879, -0.4944526, -1.489033, 0, 1, 0.254902, 1,
-0.164185, -0.4512593, -2.988628, 0, 1, 0.2627451, 1,
-0.1582159, -0.8402689, -3.702615, 0, 1, 0.2666667, 1,
-0.156577, 0.5718671, -1.09396, 0, 1, 0.2745098, 1,
-0.1511302, -1.54509, -1.868756, 0, 1, 0.2784314, 1,
-0.1508608, 2.065237, -1.154865, 0, 1, 0.2862745, 1,
-0.1474417, 0.2542725, 0.7467064, 0, 1, 0.2901961, 1,
-0.1461955, 0.4109763, -0.7197859, 0, 1, 0.2980392, 1,
-0.1454752, -0.385874, -2.800999, 0, 1, 0.3058824, 1,
-0.1450732, -1.864843, -1.896802, 0, 1, 0.3098039, 1,
-0.145073, 0.1487036, -1.274367, 0, 1, 0.3176471, 1,
-0.144388, -0.8799317, -1.042695, 0, 1, 0.3215686, 1,
-0.1373259, 0.6572074, -0.3063391, 0, 1, 0.3294118, 1,
-0.1369821, 1.228792, -1.02619, 0, 1, 0.3333333, 1,
-0.1353784, -1.16154, -2.609639, 0, 1, 0.3411765, 1,
-0.131771, 0.3330101, 1.375919, 0, 1, 0.345098, 1,
-0.130192, -0.7580898, -2.459145, 0, 1, 0.3529412, 1,
-0.1292862, -0.827688, -5.079032, 0, 1, 0.3568628, 1,
-0.1236227, -0.3822087, -2.872671, 0, 1, 0.3647059, 1,
-0.1212209, 0.6647426, 2.006079, 0, 1, 0.3686275, 1,
-0.1144086, 1.049422, -0.4405918, 0, 1, 0.3764706, 1,
-0.110784, -0.4157502, -2.324893, 0, 1, 0.3803922, 1,
-0.1089979, 2.655769, 1.657916, 0, 1, 0.3882353, 1,
-0.1088248, 0.2364624, -0.5400355, 0, 1, 0.3921569, 1,
-0.1087183, -1.988005, -3.127816, 0, 1, 0.4, 1,
-0.107156, 0.7229064, 0.592061, 0, 1, 0.4078431, 1,
-0.1070852, 1.704959, -1.977022, 0, 1, 0.4117647, 1,
-0.1031444, 0.6923079, -1.957414, 0, 1, 0.4196078, 1,
-0.09967273, 1.471426, -1.541715, 0, 1, 0.4235294, 1,
-0.09892629, 1.280039, -0.4766858, 0, 1, 0.4313726, 1,
-0.09875409, 1.780339, 0.8851997, 0, 1, 0.4352941, 1,
-0.09758937, -1.188046, -2.782879, 0, 1, 0.4431373, 1,
-0.09720286, -0.1231183, -1.303268, 0, 1, 0.4470588, 1,
-0.09243628, 1.116768, -1.530146, 0, 1, 0.454902, 1,
-0.08989302, -0.667438, -2.944795, 0, 1, 0.4588235, 1,
-0.08572873, -0.9064612, -2.471016, 0, 1, 0.4666667, 1,
-0.08545168, 0.9149405, -1.372458, 0, 1, 0.4705882, 1,
-0.08440651, 0.6641058, 0.5404926, 0, 1, 0.4784314, 1,
-0.08051437, 2.729783, -0.4060729, 0, 1, 0.4823529, 1,
-0.07932332, 0.2432987, -0.8701577, 0, 1, 0.4901961, 1,
-0.07878417, 0.5283778, -0.2939795, 0, 1, 0.4941176, 1,
-0.07863316, -0.357135, -2.483185, 0, 1, 0.5019608, 1,
-0.07855216, -0.4598542, -3.425327, 0, 1, 0.509804, 1,
-0.07666022, 1.370259, 0.2060732, 0, 1, 0.5137255, 1,
-0.07625715, 0.4193452, -0.1910906, 0, 1, 0.5215687, 1,
-0.07423002, -1.068701, -4.59745, 0, 1, 0.5254902, 1,
-0.07414876, 2.303495, -1.077617, 0, 1, 0.5333334, 1,
-0.06315222, -0.4689679, -3.768977, 0, 1, 0.5372549, 1,
-0.05929187, -1.265031, -2.446648, 0, 1, 0.5450981, 1,
-0.05849272, -0.6130335, -3.833256, 0, 1, 0.5490196, 1,
-0.05462934, 0.9268417, -0.1815586, 0, 1, 0.5568628, 1,
-0.05376653, -0.9404446, -3.173361, 0, 1, 0.5607843, 1,
-0.05193593, 0.8987646, -0.1104361, 0, 1, 0.5686275, 1,
-0.04915095, 0.6505491, 0.4793387, 0, 1, 0.572549, 1,
-0.04454135, 0.01098307, -0.8585716, 0, 1, 0.5803922, 1,
-0.03968039, 0.3350751, -0.1023386, 0, 1, 0.5843138, 1,
-0.0384784, -0.2584437, -3.506148, 0, 1, 0.5921569, 1,
-0.03729235, -1.316557, -3.307746, 0, 1, 0.5960785, 1,
-0.03659808, 0.4920199, -1.120694, 0, 1, 0.6039216, 1,
-0.03624724, 0.6657377, 0.4354793, 0, 1, 0.6117647, 1,
-0.03224351, 0.1825236, 1.346128, 0, 1, 0.6156863, 1,
-0.03189964, 0.2302159, -0.4486277, 0, 1, 0.6235294, 1,
-0.03160396, -1.126727, -2.557972, 0, 1, 0.627451, 1,
-0.02999465, 1.164337, -1.975835, 0, 1, 0.6352941, 1,
-0.02881517, -0.7286555, -2.534248, 0, 1, 0.6392157, 1,
-0.02777388, -0.4278139, -2.977153, 0, 1, 0.6470588, 1,
-0.02723719, -0.04169368, -2.627662, 0, 1, 0.6509804, 1,
-0.02649535, -0.3408143, -2.895877, 0, 1, 0.6588235, 1,
-0.02567938, 1.042745, 0.5112662, 0, 1, 0.6627451, 1,
-0.02437152, 2.061943, 0.9955192, 0, 1, 0.6705883, 1,
-0.0205799, -0.02333277, -1.845024, 0, 1, 0.6745098, 1,
-0.01586763, -0.7034463, -3.195566, 0, 1, 0.682353, 1,
-0.01573731, 0.2332557, -0.1260816, 0, 1, 0.6862745, 1,
-0.01535301, 1.721906, 0.1124022, 0, 1, 0.6941177, 1,
-0.01427924, -0.292536, -1.711131, 0, 1, 0.7019608, 1,
-0.008869733, -0.4752393, -4.092362, 0, 1, 0.7058824, 1,
-0.002173255, 0.7023359, -2.105674, 0, 1, 0.7137255, 1,
-0.002050509, -0.6320621, -2.135111, 0, 1, 0.7176471, 1,
-0.0009868955, 0.1070392, 2.080171, 0, 1, 0.7254902, 1,
-0.0003564545, 0.7316608, 0.6204372, 0, 1, 0.7294118, 1,
0.0006760434, 0.1626564, 1.634035, 0, 1, 0.7372549, 1,
0.002350591, 0.5040556, -1.061587, 0, 1, 0.7411765, 1,
0.002713468, 0.3479994, -0.8345554, 0, 1, 0.7490196, 1,
0.002823415, 1.815157, 0.0371948, 0, 1, 0.7529412, 1,
0.00459862, -0.296442, 4.236224, 0, 1, 0.7607843, 1,
0.00689201, 0.6267053, 1.10323, 0, 1, 0.7647059, 1,
0.009089418, -0.3527946, 1.616435, 0, 1, 0.772549, 1,
0.01451138, -0.08119537, 4.241356, 0, 1, 0.7764706, 1,
0.01527659, 0.3415746, 0.3417717, 0, 1, 0.7843137, 1,
0.01540183, 0.2617538, -0.2149759, 0, 1, 0.7882353, 1,
0.01706724, -2.813408, 2.644604, 0, 1, 0.7960784, 1,
0.01708164, -0.2194375, 3.065287, 0, 1, 0.8039216, 1,
0.01752058, -0.01170347, 2.023291, 0, 1, 0.8078431, 1,
0.02076048, 0.7049623, 0.5155654, 0, 1, 0.8156863, 1,
0.0218327, 1.183593, 0.1260245, 0, 1, 0.8196079, 1,
0.02508542, 1.153174, 0.3311572, 0, 1, 0.827451, 1,
0.02829911, -0.8468568, 4.76982, 0, 1, 0.8313726, 1,
0.02859799, -0.127432, 2.59364, 0, 1, 0.8392157, 1,
0.03126002, 0.4944411, -2.52631, 0, 1, 0.8431373, 1,
0.03443535, -0.6867635, 4.019236, 0, 1, 0.8509804, 1,
0.03722971, -1.207242, 3.371594, 0, 1, 0.854902, 1,
0.03970389, 0.08049771, 0.07612435, 0, 1, 0.8627451, 1,
0.04044776, -0.6775565, 4.149232, 0, 1, 0.8666667, 1,
0.04291024, 0.8376524, -0.827903, 0, 1, 0.8745098, 1,
0.04794028, -1.258577, 2.283258, 0, 1, 0.8784314, 1,
0.04877926, 0.7331269, -1.343363, 0, 1, 0.8862745, 1,
0.04895241, -0.527774, 4.650545, 0, 1, 0.8901961, 1,
0.05082314, -1.586527, 2.901292, 0, 1, 0.8980392, 1,
0.05284097, 0.5507334, -0.7540143, 0, 1, 0.9058824, 1,
0.0536732, -0.6722366, 3.15185, 0, 1, 0.9098039, 1,
0.05613431, -0.9260809, 3.240794, 0, 1, 0.9176471, 1,
0.05700476, -0.1149565, 3.20778, 0, 1, 0.9215686, 1,
0.05752347, 1.757931, 0.6103196, 0, 1, 0.9294118, 1,
0.05914802, -0.1009388, 2.957429, 0, 1, 0.9333333, 1,
0.06061314, -0.360915, 4.552705, 0, 1, 0.9411765, 1,
0.06092044, 0.5702274, -0.7140637, 0, 1, 0.945098, 1,
0.06699601, -0.8758269, 2.774556, 0, 1, 0.9529412, 1,
0.06756806, 0.6884072, 0.03665485, 0, 1, 0.9568627, 1,
0.06803421, 0.276856, 1.453233, 0, 1, 0.9647059, 1,
0.07452859, -0.8219155, 2.122635, 0, 1, 0.9686275, 1,
0.07524556, -1.75433, 4.343524, 0, 1, 0.9764706, 1,
0.07633133, -0.8072707, 4.134346, 0, 1, 0.9803922, 1,
0.0771979, -0.3126543, 3.378242, 0, 1, 0.9882353, 1,
0.0795629, 0.8453466, -0.1833587, 0, 1, 0.9921569, 1,
0.08086411, 0.6055913, -0.5445428, 0, 1, 1, 1,
0.08177078, -1.217847, 3.185746, 0, 0.9921569, 1, 1,
0.08417807, 1.079924, -0.4508926, 0, 0.9882353, 1, 1,
0.08846171, -0.2637932, 2.956371, 0, 0.9803922, 1, 1,
0.09091936, -0.3164681, 2.965323, 0, 0.9764706, 1, 1,
0.09726572, 1.343524, 0.2066688, 0, 0.9686275, 1, 1,
0.09746683, 0.9636014, 0.6974501, 0, 0.9647059, 1, 1,
0.09826565, 1.153547, -2.229664, 0, 0.9568627, 1, 1,
0.09879249, 0.2016817, -0.6192438, 0, 0.9529412, 1, 1,
0.100646, -0.2012468, 4.924372, 0, 0.945098, 1, 1,
0.101678, 0.1816197, 2.058112, 0, 0.9411765, 1, 1,
0.102761, 1.30453, 0.5018443, 0, 0.9333333, 1, 1,
0.1031645, -0.2611883, 2.242713, 0, 0.9294118, 1, 1,
0.1053127, -2.441639, 2.550875, 0, 0.9215686, 1, 1,
0.1061116, -0.6661331, 1.7732, 0, 0.9176471, 1, 1,
0.1083777, -0.2900817, 2.695691, 0, 0.9098039, 1, 1,
0.109539, 1.194761, -1.445812, 0, 0.9058824, 1, 1,
0.10993, 0.4351367, -0.2776534, 0, 0.8980392, 1, 1,
0.1099713, 0.818945, 0.7377468, 0, 0.8901961, 1, 1,
0.1156001, 0.7115285, 0.3065497, 0, 0.8862745, 1, 1,
0.1179759, 0.9381258, 0.3863773, 0, 0.8784314, 1, 1,
0.1204373, -0.3096627, 3.1377, 0, 0.8745098, 1, 1,
0.120775, 0.633289, 1.03982, 0, 0.8666667, 1, 1,
0.1214695, -0.03094352, 2.21522, 0, 0.8627451, 1, 1,
0.1215134, 0.07483895, 1.793753, 0, 0.854902, 1, 1,
0.1283133, -2.281937, 2.156634, 0, 0.8509804, 1, 1,
0.133339, -0.9812272, 4.313029, 0, 0.8431373, 1, 1,
0.1404329, 1.846705, -1.865447, 0, 0.8392157, 1, 1,
0.1452161, -0.7872428, 2.577877, 0, 0.8313726, 1, 1,
0.1456733, -0.1836691, 0.6987128, 0, 0.827451, 1, 1,
0.1460195, -0.1257731, 1.905627, 0, 0.8196079, 1, 1,
0.1462136, 1.072763, 0.3141907, 0, 0.8156863, 1, 1,
0.1472567, 0.3028322, 0.6780907, 0, 0.8078431, 1, 1,
0.1491438, -1.602884, 1.397383, 0, 0.8039216, 1, 1,
0.1494455, 1.753864, 0.3480963, 0, 0.7960784, 1, 1,
0.1503494, 0.6416774, 1.598409, 0, 0.7882353, 1, 1,
0.1507312, -1.352893, 2.797468, 0, 0.7843137, 1, 1,
0.1522595, -0.8974915, 3.719968, 0, 0.7764706, 1, 1,
0.1523633, -0.883616, 1.63302, 0, 0.772549, 1, 1,
0.1527254, 1.817087, -1.050139, 0, 0.7647059, 1, 1,
0.1532551, 0.05733478, 0.4101482, 0, 0.7607843, 1, 1,
0.1541483, 0.796224, -0.1279338, 0, 0.7529412, 1, 1,
0.1561603, 0.7325691, -2.273504, 0, 0.7490196, 1, 1,
0.1581019, 0.5541014, -0.1658379, 0, 0.7411765, 1, 1,
0.1602374, -0.5577132, 3.300075, 0, 0.7372549, 1, 1,
0.1621187, -0.3716898, 1.61047, 0, 0.7294118, 1, 1,
0.1657673, 0.4011472, 2.309855, 0, 0.7254902, 1, 1,
0.1669336, -0.3037091, 3.012831, 0, 0.7176471, 1, 1,
0.1711265, -0.5276422, 3.201677, 0, 0.7137255, 1, 1,
0.1769742, 1.215842, 0.387774, 0, 0.7058824, 1, 1,
0.1782903, 1.610375, 0.3815216, 0, 0.6980392, 1, 1,
0.1803191, 1.528182, -1.627854, 0, 0.6941177, 1, 1,
0.1832013, -1.254017, 2.2295, 0, 0.6862745, 1, 1,
0.1862551, -1.176386, 5.160393, 0, 0.682353, 1, 1,
0.1868304, 0.3140542, 1.741698, 0, 0.6745098, 1, 1,
0.1899449, 0.06205805, 2.71529, 0, 0.6705883, 1, 1,
0.1912317, -0.2693323, 2.475972, 0, 0.6627451, 1, 1,
0.1942125, -0.6056712, 3.752484, 0, 0.6588235, 1, 1,
0.1942159, -0.5801936, 3.339664, 0, 0.6509804, 1, 1,
0.2014786, 0.1932402, 1.625362, 0, 0.6470588, 1, 1,
0.2016602, -0.6456943, 3.251353, 0, 0.6392157, 1, 1,
0.2024159, 0.9502928, 1.140831, 0, 0.6352941, 1, 1,
0.2031707, 0.3242121, 1.074735, 0, 0.627451, 1, 1,
0.2124812, 0.1115812, 0.1840213, 0, 0.6235294, 1, 1,
0.2137858, 0.5891467, 1.011775, 0, 0.6156863, 1, 1,
0.2140359, 0.5516543, 0.02127193, 0, 0.6117647, 1, 1,
0.2209612, -0.001906622, 2.624757, 0, 0.6039216, 1, 1,
0.223538, -0.3985592, 1.5259, 0, 0.5960785, 1, 1,
0.2329597, 0.6451316, -0.8709978, 0, 0.5921569, 1, 1,
0.2368286, 0.5409976, 0.3970221, 0, 0.5843138, 1, 1,
0.2423975, 0.693042, -0.9294327, 0, 0.5803922, 1, 1,
0.250279, 2.972344, -0.3790756, 0, 0.572549, 1, 1,
0.250357, 0.8880035, -0.03721163, 0, 0.5686275, 1, 1,
0.2517307, -0.03693878, 2.889899, 0, 0.5607843, 1, 1,
0.2520873, 0.03829673, 0.4762545, 0, 0.5568628, 1, 1,
0.2534264, -0.6751445, 3.1505, 0, 0.5490196, 1, 1,
0.2596305, -0.3699202, 2.616358, 0, 0.5450981, 1, 1,
0.2627885, -0.461106, 0.777192, 0, 0.5372549, 1, 1,
0.264843, -0.2197814, 4.21101, 0, 0.5333334, 1, 1,
0.265454, 0.7195913, -0.3915329, 0, 0.5254902, 1, 1,
0.2662365, -1.940279, 2.324013, 0, 0.5215687, 1, 1,
0.26758, -0.5186828, 3.04685, 0, 0.5137255, 1, 1,
0.2690029, 0.1778806, -0.8455845, 0, 0.509804, 1, 1,
0.269334, 0.3306224, 0.3777557, 0, 0.5019608, 1, 1,
0.2702569, 0.9306561, -0.3014232, 0, 0.4941176, 1, 1,
0.2733463, 1.286282, 0.732992, 0, 0.4901961, 1, 1,
0.2743571, 0.06993502, 0.6214418, 0, 0.4823529, 1, 1,
0.2768014, -0.3332377, 0.5220915, 0, 0.4784314, 1, 1,
0.2772808, 0.4118117, 0.3681788, 0, 0.4705882, 1, 1,
0.2811694, -0.7414504, 3.040763, 0, 0.4666667, 1, 1,
0.287508, -0.04313888, 2.168971, 0, 0.4588235, 1, 1,
0.2876319, 1.73361, 0.07628185, 0, 0.454902, 1, 1,
0.2878404, 0.768801, 1.730217, 0, 0.4470588, 1, 1,
0.2879517, 0.1216491, -0.3391473, 0, 0.4431373, 1, 1,
0.2891435, -1.210224, 3.815757, 0, 0.4352941, 1, 1,
0.2910242, -0.4053371, 1.680935, 0, 0.4313726, 1, 1,
0.2916512, 0.6845956, -0.3180723, 0, 0.4235294, 1, 1,
0.2944506, -0.8921038, 2.458806, 0, 0.4196078, 1, 1,
0.2971653, -1.099819, 2.790775, 0, 0.4117647, 1, 1,
0.3001477, 0.1697742, 0.3474234, 0, 0.4078431, 1, 1,
0.3008297, -0.717271, 4.041399, 0, 0.4, 1, 1,
0.3009098, 0.5803842, 0.4065265, 0, 0.3921569, 1, 1,
0.3038561, -0.1402979, 0.1078795, 0, 0.3882353, 1, 1,
0.3172706, -0.9369426, 2.392147, 0, 0.3803922, 1, 1,
0.3240635, 0.4908323, 0.6801076, 0, 0.3764706, 1, 1,
0.3327118, -0.8225859, 2.491207, 0, 0.3686275, 1, 1,
0.3356368, -0.8754155, 1.976946, 0, 0.3647059, 1, 1,
0.3376226, 0.8489549, -0.7347834, 0, 0.3568628, 1, 1,
0.3479921, 0.3749557, 0.9768434, 0, 0.3529412, 1, 1,
0.3506266, -0.6584937, 1.814123, 0, 0.345098, 1, 1,
0.3534087, -0.3416556, 0.3186541, 0, 0.3411765, 1, 1,
0.3538873, -0.6996983, 1.628294, 0, 0.3333333, 1, 1,
0.3540089, 0.2475616, 1.676945, 0, 0.3294118, 1, 1,
0.3587609, 0.07547373, 0.4631388, 0, 0.3215686, 1, 1,
0.3594481, 0.4383587, -0.4227121, 0, 0.3176471, 1, 1,
0.3607607, 0.02353602, 0.13685, 0, 0.3098039, 1, 1,
0.3608487, 0.1277962, 1.041297, 0, 0.3058824, 1, 1,
0.3698687, -2.047169, 2.942523, 0, 0.2980392, 1, 1,
0.3703803, 1.32356, 1.68894, 0, 0.2901961, 1, 1,
0.3748531, -1.779911, 3.464482, 0, 0.2862745, 1, 1,
0.3767042, 0.489659, -0.7779031, 0, 0.2784314, 1, 1,
0.3800943, -0.3164349, 2.474035, 0, 0.2745098, 1, 1,
0.3806309, -0.01818957, 2.574113, 0, 0.2666667, 1, 1,
0.380864, -2.195235, 2.408335, 0, 0.2627451, 1, 1,
0.3822352, 1.193622, 1.077481, 0, 0.254902, 1, 1,
0.3833712, -1.046441, 3.130942, 0, 0.2509804, 1, 1,
0.3852203, -0.8670616, 3.45026, 0, 0.2431373, 1, 1,
0.3875754, -0.2239032, 1.283135, 0, 0.2392157, 1, 1,
0.3890041, 0.4562857, -0.3267407, 0, 0.2313726, 1, 1,
0.3919128, 0.006680612, 2.121717, 0, 0.227451, 1, 1,
0.3942341, 0.1172807, 1.56559, 0, 0.2196078, 1, 1,
0.3953095, 0.2048821, 0.8589422, 0, 0.2156863, 1, 1,
0.3969065, 0.4602545, -0.6089714, 0, 0.2078431, 1, 1,
0.4007339, -0.2379898, 3.358328, 0, 0.2039216, 1, 1,
0.403365, -1.316864, 3.652463, 0, 0.1960784, 1, 1,
0.4039206, -0.07193443, 0.8433175, 0, 0.1882353, 1, 1,
0.4043317, -1.114059, 4.363696, 0, 0.1843137, 1, 1,
0.417405, 0.130871, -0.02547733, 0, 0.1764706, 1, 1,
0.4179871, -0.6577648, 2.944564, 0, 0.172549, 1, 1,
0.4202621, 0.2136182, 1.578245, 0, 0.1647059, 1, 1,
0.4242489, 2.430857, 1.796887, 0, 0.1607843, 1, 1,
0.4260822, -1.266802, 2.439732, 0, 0.1529412, 1, 1,
0.4291072, -0.321038, 3.291145, 0, 0.1490196, 1, 1,
0.4338292, -1.182253, 2.477912, 0, 0.1411765, 1, 1,
0.4377586, -0.2985967, 2.835212, 0, 0.1372549, 1, 1,
0.43882, -0.8799257, 3.462896, 0, 0.1294118, 1, 1,
0.4428374, -0.8631929, 2.001068, 0, 0.1254902, 1, 1,
0.4430761, 0.7282482, 2.557405, 0, 0.1176471, 1, 1,
0.4558956, -1.55341, 3.807611, 0, 0.1137255, 1, 1,
0.4573953, -1.637386, 2.928771, 0, 0.1058824, 1, 1,
0.4622378, -0.3532019, 1.741957, 0, 0.09803922, 1, 1,
0.4626275, -0.02043938, 2.021907, 0, 0.09411765, 1, 1,
0.4674261, -1.327526, 3.419037, 0, 0.08627451, 1, 1,
0.4728193, -2.026175, 1.363849, 0, 0.08235294, 1, 1,
0.4793869, -1.98593, 1.547362, 0, 0.07450981, 1, 1,
0.4795024, 2.220153, -0.433926, 0, 0.07058824, 1, 1,
0.481145, -0.3946831, 3.235406, 0, 0.0627451, 1, 1,
0.4831661, 1.484961, 0.4774456, 0, 0.05882353, 1, 1,
0.4878832, -1.404034, 3.931394, 0, 0.05098039, 1, 1,
0.488349, 0.1114874, 1.421105, 0, 0.04705882, 1, 1,
0.4977959, 0.890176, 0.08462176, 0, 0.03921569, 1, 1,
0.5058253, -0.2835527, 1.196813, 0, 0.03529412, 1, 1,
0.5069662, 0.4606598, 0.06915204, 0, 0.02745098, 1, 1,
0.5094504, -0.643266, 2.291342, 0, 0.02352941, 1, 1,
0.5094768, 0.8896189, -0.2639103, 0, 0.01568628, 1, 1,
0.5114286, -0.3431719, 2.657508, 0, 0.01176471, 1, 1,
0.5189742, 0.9347231, 0.533472, 0, 0.003921569, 1, 1,
0.519379, 1.328806, 0.04725476, 0.003921569, 0, 1, 1,
0.5212726, 1.653932, 0.2257052, 0.007843138, 0, 1, 1,
0.5228412, -1.299563, 2.165389, 0.01568628, 0, 1, 1,
0.5248038, 1.301916, -0.1811704, 0.01960784, 0, 1, 1,
0.5260651, 0.3260921, 2.304131, 0.02745098, 0, 1, 1,
0.5290811, -0.0931049, 2.301198, 0.03137255, 0, 1, 1,
0.5313766, -0.3812192, 2.780404, 0.03921569, 0, 1, 1,
0.5399066, -1.006109, 1.430472, 0.04313726, 0, 1, 1,
0.5444696, 1.18833, 1.316494, 0.05098039, 0, 1, 1,
0.5461535, 1.338828, 2.227837, 0.05490196, 0, 1, 1,
0.5463256, 1.625618, -0.4524712, 0.0627451, 0, 1, 1,
0.5471264, -2.093044, 3.084336, 0.06666667, 0, 1, 1,
0.5484523, -0.816791, 1.195369, 0.07450981, 0, 1, 1,
0.5511129, 0.1850607, 1.874283, 0.07843138, 0, 1, 1,
0.551962, 0.7474312, 0.3473693, 0.08627451, 0, 1, 1,
0.5537839, -0.3219477, 2.064595, 0.09019608, 0, 1, 1,
0.5575533, 0.2378322, -1.293763, 0.09803922, 0, 1, 1,
0.5640789, 0.3397554, -1.064465, 0.1058824, 0, 1, 1,
0.5650457, -0.8721771, 1.228152, 0.1098039, 0, 1, 1,
0.5653346, 0.05095087, 3.256894, 0.1176471, 0, 1, 1,
0.5760181, -0.5684502, 3.64685, 0.1215686, 0, 1, 1,
0.5767181, -3.149594, 1.269603, 0.1294118, 0, 1, 1,
0.5796286, 0.2188133, -0.4778055, 0.1333333, 0, 1, 1,
0.5839574, -0.2020459, 2.673297, 0.1411765, 0, 1, 1,
0.5867525, -0.1402269, 2.399121, 0.145098, 0, 1, 1,
0.5911614, 0.0552016, 0.9258288, 0.1529412, 0, 1, 1,
0.5987095, -1.247077, 3.430945, 0.1568628, 0, 1, 1,
0.6008086, -0.3135655, 3.067449, 0.1647059, 0, 1, 1,
0.6020596, -0.1583066, 4.221159, 0.1686275, 0, 1, 1,
0.6128854, -0.8220449, 2.695837, 0.1764706, 0, 1, 1,
0.6152664, -1.361434, 2.459581, 0.1803922, 0, 1, 1,
0.6209236, -0.529407, 0.4608569, 0.1882353, 0, 1, 1,
0.6215338, -1.3116, 2.525866, 0.1921569, 0, 1, 1,
0.623204, -0.1000935, 2.816033, 0.2, 0, 1, 1,
0.6259631, 0.4854697, 2.163811, 0.2078431, 0, 1, 1,
0.6273403, 0.583549, 0.1603688, 0.2117647, 0, 1, 1,
0.628091, -0.7000929, 2.523869, 0.2196078, 0, 1, 1,
0.6343334, -1.12214, 2.916343, 0.2235294, 0, 1, 1,
0.6362616, 1.537244, 0.9224164, 0.2313726, 0, 1, 1,
0.6388862, -1.90575, 2.12373, 0.2352941, 0, 1, 1,
0.6428567, -1.399998, 1.195409, 0.2431373, 0, 1, 1,
0.643908, -0.4045991, 1.782668, 0.2470588, 0, 1, 1,
0.6506624, -0.7069396, 1.454265, 0.254902, 0, 1, 1,
0.6554261, 0.1962665, 0.4953356, 0.2588235, 0, 1, 1,
0.6598257, 0.4025761, 1.70471, 0.2666667, 0, 1, 1,
0.6615925, -1.32093, 1.772651, 0.2705882, 0, 1, 1,
0.6678397, -0.2304513, 1.01811, 0.2784314, 0, 1, 1,
0.6696277, -0.2712133, 1.520923, 0.282353, 0, 1, 1,
0.6705301, -0.1027432, 1.367778, 0.2901961, 0, 1, 1,
0.6707974, 0.5811784, 2.086004, 0.2941177, 0, 1, 1,
0.6797035, -0.316403, 3.087076, 0.3019608, 0, 1, 1,
0.6809177, 0.1167263, 0.0231391, 0.3098039, 0, 1, 1,
0.6823016, -0.4605094, 2.290679, 0.3137255, 0, 1, 1,
0.6835685, -0.5358905, 1.925525, 0.3215686, 0, 1, 1,
0.6892134, 1.017939, 0.07019968, 0.3254902, 0, 1, 1,
0.6925061, 0.01687899, 1.251603, 0.3333333, 0, 1, 1,
0.6927555, 0.9757268, 1.470725, 0.3372549, 0, 1, 1,
0.6967759, 2.321419, 0.0799714, 0.345098, 0, 1, 1,
0.6977891, 0.528362, 2.024836, 0.3490196, 0, 1, 1,
0.7009565, 0.7823145, 1.03098, 0.3568628, 0, 1, 1,
0.707892, -0.4562679, 2.633989, 0.3607843, 0, 1, 1,
0.7091203, 1.106261, 1.610723, 0.3686275, 0, 1, 1,
0.709556, 0.197483, 0.9026195, 0.372549, 0, 1, 1,
0.71136, 0.1653487, -0.108606, 0.3803922, 0, 1, 1,
0.711458, -1.256685, 1.20821, 0.3843137, 0, 1, 1,
0.7153838, 1.498768, -0.9373671, 0.3921569, 0, 1, 1,
0.7171153, 0.8924497, 0.4080945, 0.3960784, 0, 1, 1,
0.7187362, 1.486, -0.5605536, 0.4039216, 0, 1, 1,
0.7223326, 2.05074, 0.4827547, 0.4117647, 0, 1, 1,
0.723879, 0.6408612, 0.3478496, 0.4156863, 0, 1, 1,
0.7366869, 0.5059607, 0.4661478, 0.4235294, 0, 1, 1,
0.7500293, -0.5624897, 3.609161, 0.427451, 0, 1, 1,
0.7501814, 2.046458, 1.264612, 0.4352941, 0, 1, 1,
0.7511988, -1.401092, 1.933293, 0.4392157, 0, 1, 1,
0.7540455, 0.313462, 1.368021, 0.4470588, 0, 1, 1,
0.7568836, 0.05328403, 1.875968, 0.4509804, 0, 1, 1,
0.7616953, 0.02415952, 0.5945927, 0.4588235, 0, 1, 1,
0.7645651, 1.018148, 4.445883, 0.4627451, 0, 1, 1,
0.7650382, 0.2188757, 1.859987, 0.4705882, 0, 1, 1,
0.7660951, 1.67505, -0.1878767, 0.4745098, 0, 1, 1,
0.7720373, 0.02437634, 0.540356, 0.4823529, 0, 1, 1,
0.7726786, 0.920803, 2.199001, 0.4862745, 0, 1, 1,
0.7764497, -1.430731, 0.8976024, 0.4941176, 0, 1, 1,
0.7766391, -0.2496083, 0.08710044, 0.5019608, 0, 1, 1,
0.7795382, -0.0600775, 1.645717, 0.5058824, 0, 1, 1,
0.7826174, -2.154951, 3.281748, 0.5137255, 0, 1, 1,
0.7842966, -1.346745, 2.011235, 0.5176471, 0, 1, 1,
0.7991528, -2.124752, 2.897848, 0.5254902, 0, 1, 1,
0.8018813, -0.279113, 0.8475798, 0.5294118, 0, 1, 1,
0.8036412, 0.4383733, 1.095978, 0.5372549, 0, 1, 1,
0.8044643, 0.7807143, -0.5569341, 0.5411765, 0, 1, 1,
0.8126016, -0.2682438, 1.391226, 0.5490196, 0, 1, 1,
0.8130682, 1.342101, -0.6493363, 0.5529412, 0, 1, 1,
0.8149906, 0.7541527, -0.6888074, 0.5607843, 0, 1, 1,
0.8156346, 0.1187719, 0.1953043, 0.5647059, 0, 1, 1,
0.8202006, 0.8995253, 1.714812, 0.572549, 0, 1, 1,
0.8202165, 0.7451257, 2.53642, 0.5764706, 0, 1, 1,
0.8221366, -1.571023, 2.984717, 0.5843138, 0, 1, 1,
0.8273064, 0.9239932, 0.3487925, 0.5882353, 0, 1, 1,
0.8319907, 0.3853382, 1.891451, 0.5960785, 0, 1, 1,
0.8321047, -0.2858853, 4.196146, 0.6039216, 0, 1, 1,
0.8333686, 0.212236, 1.434629, 0.6078432, 0, 1, 1,
0.8347632, 1.91848, 0.04062596, 0.6156863, 0, 1, 1,
0.8350509, -0.3969796, 4.004209, 0.6196079, 0, 1, 1,
0.8355901, -0.4576824, 2.386833, 0.627451, 0, 1, 1,
0.838986, -0.9419559, 2.983129, 0.6313726, 0, 1, 1,
0.8390707, 0.6372296, 0.9124588, 0.6392157, 0, 1, 1,
0.845212, 0.8029951, 1.280746, 0.6431373, 0, 1, 1,
0.8452855, -1.437999, 1.936452, 0.6509804, 0, 1, 1,
0.8453349, 0.3410093, 0.8514722, 0.654902, 0, 1, 1,
0.8491724, 0.5565827, 1.900204, 0.6627451, 0, 1, 1,
0.8557429, -0.03798969, 1.053714, 0.6666667, 0, 1, 1,
0.8558438, -0.5458246, 3.743705, 0.6745098, 0, 1, 1,
0.8610036, 1.436988, 0.2174453, 0.6784314, 0, 1, 1,
0.8616111, -1.949646, 2.814328, 0.6862745, 0, 1, 1,
0.8675563, 2.186163, -0.2271317, 0.6901961, 0, 1, 1,
0.868028, -0.3559841, 2.719652, 0.6980392, 0, 1, 1,
0.8709323, -0.9340776, 3.020013, 0.7058824, 0, 1, 1,
0.8713582, 0.7343068, 0.8013246, 0.7098039, 0, 1, 1,
0.8739302, -0.6398677, 2.844358, 0.7176471, 0, 1, 1,
0.8763368, -0.3692257, -1.029872, 0.7215686, 0, 1, 1,
0.8774097, 0.03353849, 0.5326778, 0.7294118, 0, 1, 1,
0.8792599, 0.1463063, 0.05438315, 0.7333333, 0, 1, 1,
0.8906996, -1.968737, 0.8269073, 0.7411765, 0, 1, 1,
0.893796, -1.200156, 0.4346455, 0.7450981, 0, 1, 1,
0.8942376, -0.3671482, 1.910983, 0.7529412, 0, 1, 1,
0.8979698, 0.5727946, 1.018804, 0.7568628, 0, 1, 1,
0.9055406, -0.7462813, 2.375893, 0.7647059, 0, 1, 1,
0.9067112, 0.7432382, 1.314389, 0.7686275, 0, 1, 1,
0.9101303, 1.504997, 1.246746, 0.7764706, 0, 1, 1,
0.9118308, -1.273918, 4.109387, 0.7803922, 0, 1, 1,
0.9126559, 1.436968, -0.3234108, 0.7882353, 0, 1, 1,
0.9169465, -0.2450054, -0.7533601, 0.7921569, 0, 1, 1,
0.9176897, -1.473245, 3.091202, 0.8, 0, 1, 1,
0.9195434, -1.450585, -0.1372033, 0.8078431, 0, 1, 1,
0.9209456, -0.2841545, 1.667559, 0.8117647, 0, 1, 1,
0.9248215, -0.5134332, 2.307072, 0.8196079, 0, 1, 1,
0.9254245, 0.4534364, 0.3674237, 0.8235294, 0, 1, 1,
0.9268854, -0.3467667, 1.778114, 0.8313726, 0, 1, 1,
0.9280413, -0.322922, 0.2584601, 0.8352941, 0, 1, 1,
0.9413719, 0.6290542, 0.7134652, 0.8431373, 0, 1, 1,
0.9492102, 0.11071, 2.358898, 0.8470588, 0, 1, 1,
0.9509388, -0.1765726, 1.460527, 0.854902, 0, 1, 1,
0.9545575, 0.119668, 2.635094, 0.8588235, 0, 1, 1,
0.9573659, -0.2303705, 0.9046228, 0.8666667, 0, 1, 1,
0.9618698, 1.108772, 1.199104, 0.8705882, 0, 1, 1,
0.9652452, 2.147142, 0.4376944, 0.8784314, 0, 1, 1,
0.9761063, -0.06328599, 1.547367, 0.8823529, 0, 1, 1,
0.9825663, -1.437669, 0.4339677, 0.8901961, 0, 1, 1,
0.9854251, -1.321423, 2.593636, 0.8941177, 0, 1, 1,
0.9863662, 0.4651538, 3.073368, 0.9019608, 0, 1, 1,
0.9888985, 0.2675507, 0.8180339, 0.9098039, 0, 1, 1,
0.990486, 1.143243, -0.8339176, 0.9137255, 0, 1, 1,
0.9930995, 0.7291221, 1.810537, 0.9215686, 0, 1, 1,
0.9935329, 1.526809, 1.369642, 0.9254902, 0, 1, 1,
0.9967943, -1.89192, 2.970163, 0.9333333, 0, 1, 1,
1.001285, 0.3111998, 0.6472825, 0.9372549, 0, 1, 1,
1.007793, 1.35099, 0.1796087, 0.945098, 0, 1, 1,
1.008223, -0.2778875, 3.527414, 0.9490196, 0, 1, 1,
1.01301, -1.622372, 3.635659, 0.9568627, 0, 1, 1,
1.013212, -1.685035, 2.613569, 0.9607843, 0, 1, 1,
1.022958, -0.1700318, 2.53833, 0.9686275, 0, 1, 1,
1.024879, 1.089586, 0.6519859, 0.972549, 0, 1, 1,
1.027136, -0.4538232, 2.536246, 0.9803922, 0, 1, 1,
1.02863, 0.3878717, 1.837001, 0.9843137, 0, 1, 1,
1.029301, -0.3626813, 1.624498, 0.9921569, 0, 1, 1,
1.034781, -1.678782, 2.80617, 0.9960784, 0, 1, 1,
1.042675, -0.6070613, 1.705277, 1, 0, 0.9960784, 1,
1.044966, 0.1448625, 0.2848282, 1, 0, 0.9882353, 1,
1.046324, 0.7720723, 0.4393068, 1, 0, 0.9843137, 1,
1.046695, -0.3706546, 2.112977, 1, 0, 0.9764706, 1,
1.053437, 1.343634, -0.1246277, 1, 0, 0.972549, 1,
1.055492, -0.03520307, -0.06407482, 1, 0, 0.9647059, 1,
1.057055, -0.5882142, 1.763954, 1, 0, 0.9607843, 1,
1.064657, -1.182546, 1.857033, 1, 0, 0.9529412, 1,
1.064889, -0.7787657, 3.800429, 1, 0, 0.9490196, 1,
1.070593, -1.471524, 1.310824, 1, 0, 0.9411765, 1,
1.071764, 0.4836932, 1.606245, 1, 0, 0.9372549, 1,
1.080352, 1.112993, 1.850592, 1, 0, 0.9294118, 1,
1.086002, 0.9972658, 0.270695, 1, 0, 0.9254902, 1,
1.091284, 1.361758, 0.4945051, 1, 0, 0.9176471, 1,
1.091323, 1.335712, 0.4291538, 1, 0, 0.9137255, 1,
1.09161, -1.647593, 3.432129, 1, 0, 0.9058824, 1,
1.092672, 1.185648, 0.5297108, 1, 0, 0.9019608, 1,
1.093681, 2.144913, -1.095985, 1, 0, 0.8941177, 1,
1.095462, -1.160782, 0.9236262, 1, 0, 0.8862745, 1,
1.099296, -1.543321, 3.271591, 1, 0, 0.8823529, 1,
1.102555, 1.221529, 2.951569, 1, 0, 0.8745098, 1,
1.107625, 0.7208173, 0.7753856, 1, 0, 0.8705882, 1,
1.111126, -0.1587536, 2.170343, 1, 0, 0.8627451, 1,
1.11826, 1.021886, 0.06967106, 1, 0, 0.8588235, 1,
1.127646, 1.349152, 1.146903, 1, 0, 0.8509804, 1,
1.129737, 1.106878, 1.852224, 1, 0, 0.8470588, 1,
1.133681, 0.8680661, 0.700536, 1, 0, 0.8392157, 1,
1.1419, -0.2654101, 2.999007, 1, 0, 0.8352941, 1,
1.142615, -2.024976, 1.373862, 1, 0, 0.827451, 1,
1.151367, -0.6951966, 3.065362, 1, 0, 0.8235294, 1,
1.151783, -0.4056956, 3.880449, 1, 0, 0.8156863, 1,
1.153208, -0.6235012, 1.455401, 1, 0, 0.8117647, 1,
1.155515, -0.1495851, 1.902045, 1, 0, 0.8039216, 1,
1.157912, -1.950329, 2.147784, 1, 0, 0.7960784, 1,
1.158792, -1.27032, 1.989573, 1, 0, 0.7921569, 1,
1.162594, -0.450172, 2.346183, 1, 0, 0.7843137, 1,
1.163234, -0.8137855, 2.300779, 1, 0, 0.7803922, 1,
1.163565, -0.3468581, 1.409571, 1, 0, 0.772549, 1,
1.164514, 1.075288, 2.170626, 1, 0, 0.7686275, 1,
1.173405, -0.0830835, 2.568678, 1, 0, 0.7607843, 1,
1.175848, 0.3188297, 1.53123, 1, 0, 0.7568628, 1,
1.18288, -0.1627253, 1.526636, 1, 0, 0.7490196, 1,
1.191028, 0.9948788, 1.199018, 1, 0, 0.7450981, 1,
1.203245, 0.5837198, 1.552105, 1, 0, 0.7372549, 1,
1.206543, 1.019226, 0.7714033, 1, 0, 0.7333333, 1,
1.21206, -1.264581, 1.762206, 1, 0, 0.7254902, 1,
1.212362, -0.2040316, 2.012158, 1, 0, 0.7215686, 1,
1.214531, 1.230626, 0.05754571, 1, 0, 0.7137255, 1,
1.219321, -0.7411823, 0.8410098, 1, 0, 0.7098039, 1,
1.22859, 1.339261, 1.07117, 1, 0, 0.7019608, 1,
1.232121, -0.5835025, 2.429714, 1, 0, 0.6941177, 1,
1.235939, -1.229149, 1.999608, 1, 0, 0.6901961, 1,
1.245118, 0.6379823, 0.9496043, 1, 0, 0.682353, 1,
1.255186, -0.1790767, 2.155031, 1, 0, 0.6784314, 1,
1.260235, -0.09703314, -0.2034646, 1, 0, 0.6705883, 1,
1.270354, 0.8880248, 0.9848098, 1, 0, 0.6666667, 1,
1.279277, -0.8970455, 3.612212, 1, 0, 0.6588235, 1,
1.283472, -0.9104316, 2.081809, 1, 0, 0.654902, 1,
1.292956, -0.823101, 3.088617, 1, 0, 0.6470588, 1,
1.307564, -1.255452, 4.282728, 1, 0, 0.6431373, 1,
1.308995, 0.06471346, 1.46928, 1, 0, 0.6352941, 1,
1.317319, -0.5014455, 2.23689, 1, 0, 0.6313726, 1,
1.32522, 0.2188377, 2.03248, 1, 0, 0.6235294, 1,
1.325624, -0.2568617, 3.759603, 1, 0, 0.6196079, 1,
1.329931, -0.6642541, 1.425841, 1, 0, 0.6117647, 1,
1.342472, -1.246608, 1.685631, 1, 0, 0.6078432, 1,
1.349574, 0.57621, 0.8630608, 1, 0, 0.6, 1,
1.352343, 1.796981, 2.460661, 1, 0, 0.5921569, 1,
1.352894, -0.2868229, 2.117533, 1, 0, 0.5882353, 1,
1.353464, 0.1472255, 1.199525, 1, 0, 0.5803922, 1,
1.354487, 0.6535788, 2.253736, 1, 0, 0.5764706, 1,
1.358623, 0.05365809, 2.711387, 1, 0, 0.5686275, 1,
1.362652, -2.528595, 2.925969, 1, 0, 0.5647059, 1,
1.37616, -0.524615, 2.412352, 1, 0, 0.5568628, 1,
1.37894, 0.3429558, 1.108658, 1, 0, 0.5529412, 1,
1.385153, 1.149146, -0.1702709, 1, 0, 0.5450981, 1,
1.386566, 1.724947, 0.7207957, 1, 0, 0.5411765, 1,
1.387504, -0.3866886, 1.565647, 1, 0, 0.5333334, 1,
1.392839, -0.2853997, 1.575199, 1, 0, 0.5294118, 1,
1.392866, -0.2299024, -0.02190449, 1, 0, 0.5215687, 1,
1.399909, 0.2354381, 3.653621, 1, 0, 0.5176471, 1,
1.407408, -0.1890811, 1.444389, 1, 0, 0.509804, 1,
1.415604, 0.08965489, 0.1606594, 1, 0, 0.5058824, 1,
1.435012, -0.03004336, 0.5455742, 1, 0, 0.4980392, 1,
1.448244, -0.8177213, 1.63442, 1, 0, 0.4901961, 1,
1.450389, 0.3814801, 1.001522, 1, 0, 0.4862745, 1,
1.460629, -0.6227586, 2.871344, 1, 0, 0.4784314, 1,
1.466668, -1.47019, 1.94607, 1, 0, 0.4745098, 1,
1.512433, 0.8223991, 0.4067244, 1, 0, 0.4666667, 1,
1.521113, 0.07428063, 0.1221468, 1, 0, 0.4627451, 1,
1.5429, 1.207579, 1.019297, 1, 0, 0.454902, 1,
1.547681, 1.714536, 0.3682495, 1, 0, 0.4509804, 1,
1.55741, -0.9177132, 1.102238, 1, 0, 0.4431373, 1,
1.564571, -1.583852, 3.993764, 1, 0, 0.4392157, 1,
1.581926, 1.184678, 0.1144177, 1, 0, 0.4313726, 1,
1.585018, -0.7640988, 3.172155, 1, 0, 0.427451, 1,
1.590511, -0.1339073, 1.196216, 1, 0, 0.4196078, 1,
1.604653, -0.7161512, 1.286731, 1, 0, 0.4156863, 1,
1.61064, 0.4073158, 1.949829, 1, 0, 0.4078431, 1,
1.616871, 0.003635381, 2.073089, 1, 0, 0.4039216, 1,
1.61728, 0.3692415, 1.654476, 1, 0, 0.3960784, 1,
1.629796, -0.7823209, 2.47161, 1, 0, 0.3882353, 1,
1.637431, 0.8871616, 1.110402, 1, 0, 0.3843137, 1,
1.641096, 0.8981302, 1.083777, 1, 0, 0.3764706, 1,
1.65374, 0.2983927, 0.9000173, 1, 0, 0.372549, 1,
1.655532, -0.2526208, 1.819371, 1, 0, 0.3647059, 1,
1.664971, -1.130096, 1.904695, 1, 0, 0.3607843, 1,
1.667681, 0.3403417, 0.3719626, 1, 0, 0.3529412, 1,
1.668333, -0.2936988, 0.5927969, 1, 0, 0.3490196, 1,
1.670263, 0.07172185, 0.2333682, 1, 0, 0.3411765, 1,
1.672638, 0.6976802, 0.5104506, 1, 0, 0.3372549, 1,
1.678587, -1.642598, 2.808697, 1, 0, 0.3294118, 1,
1.679501, -0.1202242, 3.255388, 1, 0, 0.3254902, 1,
1.703831, 0.6525419, 1.003156, 1, 0, 0.3176471, 1,
1.704154, -0.2945003, 2.230608, 1, 0, 0.3137255, 1,
1.710039, -0.5396222, 0.7625409, 1, 0, 0.3058824, 1,
1.71924, -0.8800831, 1.763711, 1, 0, 0.2980392, 1,
1.745209, -0.08082587, 1.193287, 1, 0, 0.2941177, 1,
1.746006, -0.227732, 0.5687697, 1, 0, 0.2862745, 1,
1.764634, -1.417261, 2.547137, 1, 0, 0.282353, 1,
1.783668, 0.1641176, 0.8058344, 1, 0, 0.2745098, 1,
1.78646, -0.9184713, 2.201542, 1, 0, 0.2705882, 1,
1.793727, 1.105721, 1.123645, 1, 0, 0.2627451, 1,
1.80367, -0.234731, 0.02574338, 1, 0, 0.2588235, 1,
1.806027, 0.2374256, 2.708189, 1, 0, 0.2509804, 1,
1.806053, 0.5810041, 1.046721, 1, 0, 0.2470588, 1,
1.809651, -2.372892, 1.900234, 1, 0, 0.2392157, 1,
1.847074, -0.0545566, 3.072591, 1, 0, 0.2352941, 1,
1.875315, -1.992427, 1.965702, 1, 0, 0.227451, 1,
1.876814, 1.246477, 1.867503, 1, 0, 0.2235294, 1,
1.878533, -0.4387049, 2.601144, 1, 0, 0.2156863, 1,
1.88637, 0.4971086, 1.730215, 1, 0, 0.2117647, 1,
1.890369, 0.1135549, 0.9566243, 1, 0, 0.2039216, 1,
1.92559, -0.5295377, 1.73035, 1, 0, 0.1960784, 1,
1.987662, 0.003678451, 0.416988, 1, 0, 0.1921569, 1,
2.032135, 2.580618, -0.5981199, 1, 0, 0.1843137, 1,
2.034, 0.7391607, 0.4160122, 1, 0, 0.1803922, 1,
2.03435, 1.056833, 1.259759, 1, 0, 0.172549, 1,
2.053278, 0.7536747, 2.088889, 1, 0, 0.1686275, 1,
2.077491, -0.272633, 4.212335, 1, 0, 0.1607843, 1,
2.119776, -1.180961, 0.6973785, 1, 0, 0.1568628, 1,
2.127017, -0.524102, 1.02908, 1, 0, 0.1490196, 1,
2.147131, -0.3467588, 2.048435, 1, 0, 0.145098, 1,
2.168392, 1.541997, -0.1723825, 1, 0, 0.1372549, 1,
2.210628, -1.243688, 3.799775, 1, 0, 0.1333333, 1,
2.231135, 1.455456, 1.438425, 1, 0, 0.1254902, 1,
2.283456, -1.449543, 1.984998, 1, 0, 0.1215686, 1,
2.29458, 0.1100874, 0.5048662, 1, 0, 0.1137255, 1,
2.297788, -0.4442439, 1.875608, 1, 0, 0.1098039, 1,
2.356932, -0.08399434, 2.842553, 1, 0, 0.1019608, 1,
2.375232, 0.3996454, 0.6007828, 1, 0, 0.09411765, 1,
2.378397, 1.570334, 0.6029749, 1, 0, 0.09019608, 1,
2.432124, -0.4286959, 3.056795, 1, 0, 0.08235294, 1,
2.475245, -1.002013, 2.300836, 1, 0, 0.07843138, 1,
2.516294, -0.59278, 0.7077065, 1, 0, 0.07058824, 1,
2.517788, 0.3444698, 1.339918, 1, 0, 0.06666667, 1,
2.536204, 0.1458291, 0.6292896, 1, 0, 0.05882353, 1,
2.53962, -0.2369202, 2.001536, 1, 0, 0.05490196, 1,
2.541483, 0.04933036, 0.8414909, 1, 0, 0.04705882, 1,
2.645401, 1.610207, 1.233013, 1, 0, 0.04313726, 1,
2.708989, -1.604678, 0.8563629, 1, 0, 0.03529412, 1,
2.765599, 1.575605, 1.464084, 1, 0, 0.03137255, 1,
2.808152, 0.4171318, 0.9046737, 1, 0, 0.02352941, 1,
2.883694, -1.244549, 3.769521, 1, 0, 0.01960784, 1,
3.076349, -1.636789, 1.961659, 1, 0, 0.01176471, 1,
3.093629, 1.890133, 0.552267, 1, 0, 0.007843138, 1
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
-0.01614821, -4.187262, -8.103987, 0, -0.5, 0.5, 0.5,
-0.01614821, -4.187262, -8.103987, 1, -0.5, 0.5, 0.5,
-0.01614821, -4.187262, -8.103987, 1, 1.5, 0.5, 0.5,
-0.01614821, -4.187262, -8.103987, 0, 1.5, 0.5, 0.5
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
-4.18014, -0.08862495, -8.103987, 0, -0.5, 0.5, 0.5,
-4.18014, -0.08862495, -8.103987, 1, -0.5, 0.5, 0.5,
-4.18014, -0.08862495, -8.103987, 1, 1.5, 0.5, 0.5,
-4.18014, -0.08862495, -8.103987, 0, 1.5, 0.5, 0.5
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
-4.18014, -4.187262, -0.5105689, 0, -0.5, 0.5, 0.5,
-4.18014, -4.187262, -0.5105689, 1, -0.5, 0.5, 0.5,
-4.18014, -4.187262, -0.5105689, 1, 1.5, 0.5, 0.5,
-4.18014, -4.187262, -0.5105689, 0, 1.5, 0.5, 0.5
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
-3, -3.241423, -6.351659,
3, -3.241423, -6.351659,
-3, -3.241423, -6.351659,
-3, -3.399063, -6.643714,
-2, -3.241423, -6.351659,
-2, -3.399063, -6.643714,
-1, -3.241423, -6.351659,
-1, -3.399063, -6.643714,
0, -3.241423, -6.351659,
0, -3.399063, -6.643714,
1, -3.241423, -6.351659,
1, -3.399063, -6.643714,
2, -3.241423, -6.351659,
2, -3.399063, -6.643714,
3, -3.241423, -6.351659,
3, -3.399063, -6.643714
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
-3, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
-3, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
-3, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
-3, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
-2, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
-2, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
-2, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
-2, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
-1, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
-1, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
-1, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
-1, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
0, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
0, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
0, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
0, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
1, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
1, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
1, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
1, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
2, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
2, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
2, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
2, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5,
3, -3.714343, -7.227823, 0, -0.5, 0.5, 0.5,
3, -3.714343, -7.227823, 1, -0.5, 0.5, 0.5,
3, -3.714343, -7.227823, 1, 1.5, 0.5, 0.5,
3, -3.714343, -7.227823, 0, 1.5, 0.5, 0.5
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
-3.219219, -3, -6.351659,
-3.219219, 2, -6.351659,
-3.219219, -3, -6.351659,
-3.379372, -3, -6.643714,
-3.219219, -2, -6.351659,
-3.379372, -2, -6.643714,
-3.219219, -1, -6.351659,
-3.379372, -1, -6.643714,
-3.219219, 0, -6.351659,
-3.379372, 0, -6.643714,
-3.219219, 1, -6.351659,
-3.379372, 1, -6.643714,
-3.219219, 2, -6.351659,
-3.379372, 2, -6.643714
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
-3.699679, -3, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, -3, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, -3, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, -3, -7.227823, 0, 1.5, 0.5, 0.5,
-3.699679, -2, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, -2, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, -2, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, -2, -7.227823, 0, 1.5, 0.5, 0.5,
-3.699679, -1, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, -1, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, -1, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, -1, -7.227823, 0, 1.5, 0.5, 0.5,
-3.699679, 0, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, 0, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, 0, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, 0, -7.227823, 0, 1.5, 0.5, 0.5,
-3.699679, 1, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, 1, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, 1, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, 1, -7.227823, 0, 1.5, 0.5, 0.5,
-3.699679, 2, -7.227823, 0, -0.5, 0.5, 0.5,
-3.699679, 2, -7.227823, 1, -0.5, 0.5, 0.5,
-3.699679, 2, -7.227823, 1, 1.5, 0.5, 0.5,
-3.699679, 2, -7.227823, 0, 1.5, 0.5, 0.5
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
-3.219219, -3.241423, -6,
-3.219219, -3.241423, 4,
-3.219219, -3.241423, -6,
-3.379372, -3.399063, -6,
-3.219219, -3.241423, -4,
-3.379372, -3.399063, -4,
-3.219219, -3.241423, -2,
-3.379372, -3.399063, -2,
-3.219219, -3.241423, 0,
-3.379372, -3.399063, 0,
-3.219219, -3.241423, 2,
-3.379372, -3.399063, 2,
-3.219219, -3.241423, 4,
-3.379372, -3.399063, 4
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
-3.699679, -3.714343, -6, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -6, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -6, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, -6, 0, 1.5, 0.5, 0.5,
-3.699679, -3.714343, -4, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -4, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -4, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, -4, 0, 1.5, 0.5, 0.5,
-3.699679, -3.714343, -2, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -2, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, -2, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, -2, 0, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 0, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 0, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 0, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 0, 0, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 2, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 2, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 2, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 2, 0, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 4, 0, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 4, 1, -0.5, 0.5, 0.5,
-3.699679, -3.714343, 4, 1, 1.5, 0.5, 0.5,
-3.699679, -3.714343, 4, 0, 1.5, 0.5, 0.5
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
-3.219219, -3.241423, -6.351659,
-3.219219, 3.064173, -6.351659,
-3.219219, -3.241423, 5.330522,
-3.219219, 3.064173, 5.330522,
-3.219219, -3.241423, -6.351659,
-3.219219, -3.241423, 5.330522,
-3.219219, 3.064173, -6.351659,
-3.219219, 3.064173, 5.330522,
-3.219219, -3.241423, -6.351659,
3.186923, -3.241423, -6.351659,
-3.219219, -3.241423, 5.330522,
3.186923, -3.241423, 5.330522,
-3.219219, 3.064173, -6.351659,
3.186923, 3.064173, -6.351659,
-3.219219, 3.064173, 5.330522,
3.186923, 3.064173, 5.330522,
3.186923, -3.241423, -6.351659,
3.186923, 3.064173, -6.351659,
3.186923, -3.241423, 5.330522,
3.186923, 3.064173, 5.330522,
3.186923, -3.241423, -6.351659,
3.186923, -3.241423, 5.330522,
3.186923, 3.064173, -6.351659,
3.186923, 3.064173, 5.330522
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
var radius = 7.870963;
var distance = 35.01881;
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
mvMatrix.translate( 0.01614821, 0.08862495, 0.5105689 );
mvMatrix.scale( 1.32845, 1.349633, 0.7284804 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.01881);
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
Piperidine<-read.table("Piperidine.xyz")
```

```
## Error in read.table("Piperidine.xyz"): no lines available in input
```

```r
x<-Piperidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
```

```r
y<-Piperidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
```

```r
z<-Piperidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Piperidine' not found
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
-3.125926, -0.9151539, -1.460591, 0, 0, 1, 1, 1,
-2.804044, 0.753911, -0.8073049, 1, 0, 0, 1, 1,
-2.727642, 0.1777674, -1.865216, 1, 0, 0, 1, 1,
-2.666215, -0.545943, -1.079372, 1, 0, 0, 1, 1,
-2.636992, 1.668961, -0.9578085, 1, 0, 0, 1, 1,
-2.557774, -0.3387946, 0.2252122, 1, 0, 0, 1, 1,
-2.526585, -0.8327399, -2.66112, 0, 0, 0, 1, 1,
-2.386195, 0.3352391, -1.014787, 0, 0, 0, 1, 1,
-2.376497, -0.1730058, -1.293637, 0, 0, 0, 1, 1,
-2.277808, -1.155835, -2.894569, 0, 0, 0, 1, 1,
-2.167444, 0.05842008, -2.623297, 0, 0, 0, 1, 1,
-2.111921, -1.214955, -2.378414, 0, 0, 0, 1, 1,
-2.056625, -0.6615286, -3.46778, 0, 0, 0, 1, 1,
-2.048496, 1.301194, -1.230691, 1, 1, 1, 1, 1,
-2.014528, -0.9649664, -1.268831, 1, 1, 1, 1, 1,
-2.004446, -1.529204, -1.559667, 1, 1, 1, 1, 1,
-1.935482, 1.007388, -2.794874, 1, 1, 1, 1, 1,
-1.929803, -0.1444132, -0.4637228, 1, 1, 1, 1, 1,
-1.893788, -0.9967206, -0.4273959, 1, 1, 1, 1, 1,
-1.889296, 0.5494431, -1.30418, 1, 1, 1, 1, 1,
-1.883403, 0.9082454, -0.336104, 1, 1, 1, 1, 1,
-1.852923, 0.09853765, -4.320742, 1, 1, 1, 1, 1,
-1.851797, -0.3105002, -4.183946, 1, 1, 1, 1, 1,
-1.84901, -0.9272868, -2.47424, 1, 1, 1, 1, 1,
-1.823731, 0.9040883, -1.067691, 1, 1, 1, 1, 1,
-1.805399, 0.3743878, -0.6734309, 1, 1, 1, 1, 1,
-1.802905, -1.03841, -3.954536, 1, 1, 1, 1, 1,
-1.800208, 0.4268306, 1.167396, 1, 1, 1, 1, 1,
-1.778975, 0.452314, -1.677787, 0, 0, 1, 1, 1,
-1.774307, -0.6230471, -3.626275, 1, 0, 0, 1, 1,
-1.754593, 0.5816426, -0.8132316, 1, 0, 0, 1, 1,
-1.73692, 0.3389159, -1.669675, 1, 0, 0, 1, 1,
-1.727578, 0.9293408, -1.6474, 1, 0, 0, 1, 1,
-1.705687, 1.345446, -1.818408, 1, 0, 0, 1, 1,
-1.704469, 0.1150504, -4.839208, 0, 0, 0, 1, 1,
-1.681972, 0.4278609, 1.144876, 0, 0, 0, 1, 1,
-1.678786, -0.560307, -2.172657, 0, 0, 0, 1, 1,
-1.674047, 0.01622354, -3.013995, 0, 0, 0, 1, 1,
-1.66971, -0.578016, -1.771304, 0, 0, 0, 1, 1,
-1.624169, -0.6012415, 1.730311, 0, 0, 0, 1, 1,
-1.617806, 0.3859264, 0.5802795, 0, 0, 0, 1, 1,
-1.616239, 0.6817745, 0.08989371, 1, 1, 1, 1, 1,
-1.594148, 0.4160735, -0.9129521, 1, 1, 1, 1, 1,
-1.586463, 1.140045, -0.4864182, 1, 1, 1, 1, 1,
-1.582862, 1.611935, -0.6978709, 1, 1, 1, 1, 1,
-1.572266, -1.408976, -3.178852, 1, 1, 1, 1, 1,
-1.549677, -0.1538004, -2.227927, 1, 1, 1, 1, 1,
-1.54782, 0.0490255, -2.066598, 1, 1, 1, 1, 1,
-1.530078, -0.14798, -3.003755, 1, 1, 1, 1, 1,
-1.52607, 0.835963, 0.6741882, 1, 1, 1, 1, 1,
-1.518261, 0.1484708, -0.3899221, 1, 1, 1, 1, 1,
-1.488321, -0.6997412, -3.134929, 1, 1, 1, 1, 1,
-1.483714, 0.7564276, -0.5033991, 1, 1, 1, 1, 1,
-1.4827, -0.3260787, -2.626889, 1, 1, 1, 1, 1,
-1.475009, 0.3115536, -1.664046, 1, 1, 1, 1, 1,
-1.473468, -0.2837407, 0.01013904, 1, 1, 1, 1, 1,
-1.463591, 0.1453977, -2.207103, 0, 0, 1, 1, 1,
-1.460243, 0.9427855, 0.7060643, 1, 0, 0, 1, 1,
-1.456162, -0.8446357, -0.9253882, 1, 0, 0, 1, 1,
-1.426452, 0.5081655, -1.244368, 1, 0, 0, 1, 1,
-1.424989, 0.6933794, -2.435734, 1, 0, 0, 1, 1,
-1.417837, -1.35108, -2.273155, 1, 0, 0, 1, 1,
-1.40501, 1.431573, -1.951976, 0, 0, 0, 1, 1,
-1.403141, 0.1137903, -0.5159787, 0, 0, 0, 1, 1,
-1.398998, 1.787902, -0.1641024, 0, 0, 0, 1, 1,
-1.398879, 0.2736304, -1.633829, 0, 0, 0, 1, 1,
-1.392951, 0.7803234, -0.6809756, 0, 0, 0, 1, 1,
-1.390493, -1.4926, -2.675857, 0, 0, 0, 1, 1,
-1.386564, -1.905777, -4.172955, 0, 0, 0, 1, 1,
-1.377266, -0.7556565, -2.713558, 1, 1, 1, 1, 1,
-1.375041, 0.5131944, -2.806073, 1, 1, 1, 1, 1,
-1.373953, -0.3907542, -2.244242, 1, 1, 1, 1, 1,
-1.371323, -2.025963, -3.285028, 1, 1, 1, 1, 1,
-1.366414, 0.7644157, -2.143893, 1, 1, 1, 1, 1,
-1.358971, 0.2434819, -1.073065, 1, 1, 1, 1, 1,
-1.358641, -1.369835, -2.628826, 1, 1, 1, 1, 1,
-1.350389, 0.90477, 1.301456, 1, 1, 1, 1, 1,
-1.35023, -0.3346983, -1.443459, 1, 1, 1, 1, 1,
-1.34561, 0.7184209, -0.343534, 1, 1, 1, 1, 1,
-1.34043, -0.3792495, -2.363614, 1, 1, 1, 1, 1,
-1.333112, 1.603387, -2.045518, 1, 1, 1, 1, 1,
-1.32966, 0.9537374, -1.583141, 1, 1, 1, 1, 1,
-1.321987, -1.966077, -2.234946, 1, 1, 1, 1, 1,
-1.317884, 2.154268, -0.166989, 1, 1, 1, 1, 1,
-1.315819, 0.4810387, -1.002537, 0, 0, 1, 1, 1,
-1.315452, 0.1698554, 0.1358776, 1, 0, 0, 1, 1,
-1.297177, 0.5034129, -1.787901, 1, 0, 0, 1, 1,
-1.292267, 0.6019928, -1.867498, 1, 0, 0, 1, 1,
-1.280217, 0.3745905, -1.385705, 1, 0, 0, 1, 1,
-1.278023, 0.7272802, -1.663559, 1, 0, 0, 1, 1,
-1.251656, 0.3739436, 0.06516428, 0, 0, 0, 1, 1,
-1.249605, -0.3238178, -1.172357, 0, 0, 0, 1, 1,
-1.247704, 0.2312467, -1.580556, 0, 0, 0, 1, 1,
-1.238236, -1.239893, -2.387012, 0, 0, 0, 1, 1,
-1.237879, -0.5432112, -2.421725, 0, 0, 0, 1, 1,
-1.226526, 0.2845647, -2.034242, 0, 0, 0, 1, 1,
-1.223866, 2.565908, -1.486674, 0, 0, 0, 1, 1,
-1.223351, 2.560124, -0.8229322, 1, 1, 1, 1, 1,
-1.221359, -0.7058811, -1.901073, 1, 1, 1, 1, 1,
-1.218392, -1.732258, -3.490848, 1, 1, 1, 1, 1,
-1.207888, 0.1610455, -2.037501, 1, 1, 1, 1, 1,
-1.202114, 0.7172241, -2.210998, 1, 1, 1, 1, 1,
-1.200143, 0.4260188, 0.1111027, 1, 1, 1, 1, 1,
-1.199039, -0.3996005, -2.325465, 1, 1, 1, 1, 1,
-1.193616, 0.08841892, -0.9207335, 1, 1, 1, 1, 1,
-1.19151, -0.4299444, -0.8353729, 1, 1, 1, 1, 1,
-1.185521, 0.513306, -3.211932, 1, 1, 1, 1, 1,
-1.175603, -0.951737, -4.401495, 1, 1, 1, 1, 1,
-1.161729, -0.8661867, -2.683537, 1, 1, 1, 1, 1,
-1.15761, -1.407331, -2.272786, 1, 1, 1, 1, 1,
-1.149822, 0.7481647, -2.936643, 1, 1, 1, 1, 1,
-1.149557, -0.1826131, -2.196172, 1, 1, 1, 1, 1,
-1.146653, 1.828527, 0.02137675, 0, 0, 1, 1, 1,
-1.138517, -0.3203661, -1.321216, 1, 0, 0, 1, 1,
-1.122759, -1.138503, -2.809042, 1, 0, 0, 1, 1,
-1.099491, -1.994362, -1.386297, 1, 0, 0, 1, 1,
-1.078616, 0.5226002, -0.8332845, 1, 0, 0, 1, 1,
-1.06858, 1.922838, -0.5186226, 1, 0, 0, 1, 1,
-1.066246, -0.6288925, -2.00444, 0, 0, 0, 1, 1,
-1.053354, 2.203564, -1.059944, 0, 0, 0, 1, 1,
-1.051553, -0.3032712, -3.341735, 0, 0, 0, 1, 1,
-1.050757, 0.2329526, -1.321748, 0, 0, 0, 1, 1,
-1.042082, 2.535282, -1.114624, 0, 0, 0, 1, 1,
-1.020137, 0.1019119, -0.2529229, 0, 0, 0, 1, 1,
-1.019729, 0.57683, -1.543203, 0, 0, 0, 1, 1,
-1.017053, 1.554296, -0.156717, 1, 1, 1, 1, 1,
-1.013629, 0.7531208, -1.524499, 1, 1, 1, 1, 1,
-1.011746, -1.305849, -2.18098, 1, 1, 1, 1, 1,
-1.009312, 0.8303021, -1.190406, 1, 1, 1, 1, 1,
-1.000655, -0.07596853, -0.1618686, 1, 1, 1, 1, 1,
-0.9904258, -1.091755, -2.509558, 1, 1, 1, 1, 1,
-0.9810619, 2.880083, -2.169714, 1, 1, 1, 1, 1,
-0.9803949, -0.6916571, -3.096326, 1, 1, 1, 1, 1,
-0.9517055, 1.231563, -0.6908819, 1, 1, 1, 1, 1,
-0.9514443, -0.9995106, -1.740336, 1, 1, 1, 1, 1,
-0.9483186, -2.337974, -0.9110824, 1, 1, 1, 1, 1,
-0.9445928, -0.2913229, -2.264235, 1, 1, 1, 1, 1,
-0.9436586, -0.3970278, -2.698886, 1, 1, 1, 1, 1,
-0.942537, 1.528635, -0.9969244, 1, 1, 1, 1, 1,
-0.9379233, 0.2094553, -0.8156974, 1, 1, 1, 1, 1,
-0.9372222, 0.3885632, -1.265059, 0, 0, 1, 1, 1,
-0.9358379, 1.53307, -1.531183, 1, 0, 0, 1, 1,
-0.9332252, 0.8649525, -1.188209, 1, 0, 0, 1, 1,
-0.9322509, -2.227369, -4.511087, 1, 0, 0, 1, 1,
-0.9248894, -1.598514, -4.060697, 1, 0, 0, 1, 1,
-0.9199007, -0.5573717, -2.273676, 1, 0, 0, 1, 1,
-0.9191662, 0.3125372, -1.073687, 0, 0, 0, 1, 1,
-0.9143339, -0.1430915, -1.475068, 0, 0, 0, 1, 1,
-0.9102167, -0.0139362, -0.4168414, 0, 0, 0, 1, 1,
-0.9101694, -0.2412511, -3.549725, 0, 0, 0, 1, 1,
-0.9055511, 1.303566, 0.198687, 0, 0, 0, 1, 1,
-0.9055041, -0.2655478, -2.964814, 0, 0, 0, 1, 1,
-0.8928885, -0.01185685, -2.853225, 0, 0, 0, 1, 1,
-0.8921052, -0.7005026, -3.66402, 1, 1, 1, 1, 1,
-0.8822151, 0.7032616, -2.248275, 1, 1, 1, 1, 1,
-0.8816687, -0.14413, -1.863706, 1, 1, 1, 1, 1,
-0.8812467, 1.228509, -0.9346928, 1, 1, 1, 1, 1,
-0.8811364, 0.4919997, -1.951186, 1, 1, 1, 1, 1,
-0.8791878, -0.8839537, -3.918547, 1, 1, 1, 1, 1,
-0.8760989, -0.05214594, -2.436002, 1, 1, 1, 1, 1,
-0.8737985, 0.04156753, 0.8308378, 1, 1, 1, 1, 1,
-0.87195, 2.004191, 0.5741524, 1, 1, 1, 1, 1,
-0.8670439, 0.731152, 0.4152844, 1, 1, 1, 1, 1,
-0.8609396, 0.1045595, -0.7395138, 1, 1, 1, 1, 1,
-0.8542134, -0.6539689, -2.44293, 1, 1, 1, 1, 1,
-0.852586, 2.323447, -1.262352, 1, 1, 1, 1, 1,
-0.8516231, 0.5306989, -2.717246, 1, 1, 1, 1, 1,
-0.8495135, 1.116678, -1.722312, 1, 1, 1, 1, 1,
-0.8489368, 0.9830415, -0.05555013, 0, 0, 1, 1, 1,
-0.8482538, 0.3333184, -1.591569, 1, 0, 0, 1, 1,
-0.8416241, -0.3507344, -0.977132, 1, 0, 0, 1, 1,
-0.8367689, 1.199374, -0.5178587, 1, 0, 0, 1, 1,
-0.826, 1.208226, -1.184651, 1, 0, 0, 1, 1,
-0.8183292, -0.8422096, -1.971571, 1, 0, 0, 1, 1,
-0.8155073, -0.1739761, -1.305333, 0, 0, 0, 1, 1,
-0.8108799, 0.01564832, 1.11108, 0, 0, 0, 1, 1,
-0.8064625, -0.9700475, -3.359294, 0, 0, 0, 1, 1,
-0.8052637, 0.2142184, -2.814781, 0, 0, 0, 1, 1,
-0.8019754, 0.8446364, -0.9906228, 0, 0, 0, 1, 1,
-0.7973196, 2.44322, -0.2413227, 0, 0, 0, 1, 1,
-0.7973017, -1.083833, -2.509931, 0, 0, 0, 1, 1,
-0.7953237, 1.357852, 0.956418, 1, 1, 1, 1, 1,
-0.7903855, 0.5871165, -1.684078, 1, 1, 1, 1, 1,
-0.7868981, 0.3410155, -2.158164, 1, 1, 1, 1, 1,
-0.7841209, -0.7842377, -3.028576, 1, 1, 1, 1, 1,
-0.7697207, 1.031151, -2.387631, 1, 1, 1, 1, 1,
-0.7684065, -1.366141, -3.287607, 1, 1, 1, 1, 1,
-0.7674934, 0.03641813, -0.5220153, 1, 1, 1, 1, 1,
-0.7620617, -0.502782, -1.665052, 1, 1, 1, 1, 1,
-0.7618131, -0.3819193, -2.614135, 1, 1, 1, 1, 1,
-0.7606434, -0.1418394, -3.272192, 1, 1, 1, 1, 1,
-0.7599837, -0.9788355, -2.214455, 1, 1, 1, 1, 1,
-0.7557656, -0.1838377, -1.79881, 1, 1, 1, 1, 1,
-0.754328, -0.5578353, -3.306782, 1, 1, 1, 1, 1,
-0.7538738, -1.616305, -1.194235, 1, 1, 1, 1, 1,
-0.7496977, -0.7581485, -2.245494, 1, 1, 1, 1, 1,
-0.7397053, 0.8017074, 0.1483511, 0, 0, 1, 1, 1,
-0.739179, -0.5159054, -0.883903, 1, 0, 0, 1, 1,
-0.7354628, 2.081406, 1.098048, 1, 0, 0, 1, 1,
-0.7259629, 0.2097891, 0.5350869, 1, 0, 0, 1, 1,
-0.722731, -0.418553, -3.266584, 1, 0, 0, 1, 1,
-0.7135203, -1.662424, -2.79177, 1, 0, 0, 1, 1,
-0.7129275, -0.6040469, -1.267064, 0, 0, 0, 1, 1,
-0.7107933, 2.48285, 0.5332804, 0, 0, 0, 1, 1,
-0.709498, -0.9581504, -5.28371, 0, 0, 0, 1, 1,
-0.6970855, -0.4962724, -3.255558, 0, 0, 0, 1, 1,
-0.6960386, -1.663796, -2.610162, 0, 0, 0, 1, 1,
-0.6876436, -0.4964531, -1.878621, 0, 0, 0, 1, 1,
-0.6741378, 0.03269695, -1.578389, 0, 0, 0, 1, 1,
-0.6731992, 0.7038709, -0.4547284, 1, 1, 1, 1, 1,
-0.6688533, -0.6739925, -2.742966, 1, 1, 1, 1, 1,
-0.6645098, 0.4494109, -2.336612, 1, 1, 1, 1, 1,
-0.6608116, 0.07460172, -1.47603, 1, 1, 1, 1, 1,
-0.6551349, 0.250161, -0.01252702, 1, 1, 1, 1, 1,
-0.6545498, 2.032588, -1.433944, 1, 1, 1, 1, 1,
-0.6536077, 0.07438274, -1.869237, 1, 1, 1, 1, 1,
-0.6522216, 0.1852162, -0.6316644, 1, 1, 1, 1, 1,
-0.6517082, -0.4901621, -2.602069, 1, 1, 1, 1, 1,
-0.6516914, 0.4611127, -1.275785, 1, 1, 1, 1, 1,
-0.6509609, -0.007871536, -2.236982, 1, 1, 1, 1, 1,
-0.649599, 0.9021855, -0.6580099, 1, 1, 1, 1, 1,
-0.6475214, 1.103719, -0.1344326, 1, 1, 1, 1, 1,
-0.645696, 0.03653944, -0.4865398, 1, 1, 1, 1, 1,
-0.630484, 1.447176, 0.5756289, 1, 1, 1, 1, 1,
-0.6232839, 1.65294, -1.513726, 0, 0, 1, 1, 1,
-0.6227866, 1.260947, -1.353322, 1, 0, 0, 1, 1,
-0.6214723, -1.02586, -2.682933, 1, 0, 0, 1, 1,
-0.6148687, -0.5773415, -1.902844, 1, 0, 0, 1, 1,
-0.613709, 0.6823654, -0.3523717, 1, 0, 0, 1, 1,
-0.6116144, -0.3269668, -0.2115339, 1, 0, 0, 1, 1,
-0.6067065, 0.7874779, 0.2102002, 0, 0, 0, 1, 1,
-0.6061031, -0.04819571, -0.5169228, 0, 0, 0, 1, 1,
-0.6012957, 0.7619455, -0.2462133, 0, 0, 0, 1, 1,
-0.598344, 0.1000635, -0.8688275, 0, 0, 0, 1, 1,
-0.5951397, 0.759814, -0.4724694, 0, 0, 0, 1, 1,
-0.5931229, -0.7309044, -2.470065, 0, 0, 0, 1, 1,
-0.5925447, -0.4708137, -3.100009, 0, 0, 0, 1, 1,
-0.5919616, 0.4815578, -1.154515, 1, 1, 1, 1, 1,
-0.5898868, 0.1596272, -0.5050144, 1, 1, 1, 1, 1,
-0.586275, 0.1149867, -0.5337963, 1, 1, 1, 1, 1,
-0.5859312, -0.1988432, -3.032112, 1, 1, 1, 1, 1,
-0.5801305, -0.3834161, -3.299203, 1, 1, 1, 1, 1,
-0.5793505, 1.115098, -0.598693, 1, 1, 1, 1, 1,
-0.5785055, -0.5116616, -1.3582, 1, 1, 1, 1, 1,
-0.577723, 0.9727141, -1.113316, 1, 1, 1, 1, 1,
-0.5747405, 1.347757, -1.01399, 1, 1, 1, 1, 1,
-0.5626637, -0.1484306, -1.218, 1, 1, 1, 1, 1,
-0.5613281, 1.811915, -0.5725981, 1, 1, 1, 1, 1,
-0.5602161, 0.08881886, -1.1051, 1, 1, 1, 1, 1,
-0.5597103, 0.4059259, -1.855165, 1, 1, 1, 1, 1,
-0.5540958, -1.890453, -3.672451, 1, 1, 1, 1, 1,
-0.5530112, 0.2272328, -1.808916, 1, 1, 1, 1, 1,
-0.5503191, -1.059254, -2.903977, 0, 0, 1, 1, 1,
-0.5423799, -0.8790987, -0.3157445, 1, 0, 0, 1, 1,
-0.5341378, 0.1053022, -0.141126, 1, 0, 0, 1, 1,
-0.531767, 1.258988, 0.3591796, 1, 0, 0, 1, 1,
-0.529492, -1.114127, -2.936987, 1, 0, 0, 1, 1,
-0.529136, -0.5992539, -3.509471, 1, 0, 0, 1, 1,
-0.5278254, -0.3694247, -2.135379, 0, 0, 0, 1, 1,
-0.5233391, 0.1285713, -1.296308, 0, 0, 0, 1, 1,
-0.5231147, 1.522251, 0.3735881, 0, 0, 0, 1, 1,
-0.5068741, 0.7304599, -0.3461223, 0, 0, 0, 1, 1,
-0.5064654, -0.6847013, -2.481671, 0, 0, 0, 1, 1,
-0.5011661, -1.59267, -2.267775, 0, 0, 0, 1, 1,
-0.5010911, 0.2107837, -1.168155, 0, 0, 0, 1, 1,
-0.4972282, -0.06887471, -1.464719, 1, 1, 1, 1, 1,
-0.4942436, 1.997869, 0.3477454, 1, 1, 1, 1, 1,
-0.4914284, 0.5932357, -0.784706, 1, 1, 1, 1, 1,
-0.4879273, 0.5576728, -0.2240702, 1, 1, 1, 1, 1,
-0.4863262, 0.617819, -0.5343826, 1, 1, 1, 1, 1,
-0.4852426, 0.6959798, -0.4765619, 1, 1, 1, 1, 1,
-0.4849473, -0.7086344, -1.224782, 1, 1, 1, 1, 1,
-0.4818353, 0.3999067, -0.453225, 1, 1, 1, 1, 1,
-0.4794492, 0.6646503, -1.941193, 1, 1, 1, 1, 1,
-0.4785944, 0.008618166, -2.893006, 1, 1, 1, 1, 1,
-0.474562, 0.7380487, -1.470986, 1, 1, 1, 1, 1,
-0.4743479, -1.358321, -1.741025, 1, 1, 1, 1, 1,
-0.4699393, 0.642709, 0.207731, 1, 1, 1, 1, 1,
-0.4698001, 0.3449067, -2.73705, 1, 1, 1, 1, 1,
-0.4644535, -1.178424, -0.5203676, 1, 1, 1, 1, 1,
-0.4643995, -1.089855, -4.410384, 0, 0, 1, 1, 1,
-0.4571397, -0.9108811, -2.657574, 1, 0, 0, 1, 1,
-0.4517529, -0.3180486, -1.902605, 1, 0, 0, 1, 1,
-0.4388316, 0.2425245, -0.510288, 1, 0, 0, 1, 1,
-0.4267322, 0.3276656, -0.6465679, 1, 0, 0, 1, 1,
-0.4225932, -0.9891914, -1.788625, 1, 0, 0, 1, 1,
-0.4170561, -0.3670093, -2.355788, 0, 0, 0, 1, 1,
-0.4162076, 0.1645005, -1.260048, 0, 0, 0, 1, 1,
-0.4152559, -1.19699, -3.055892, 0, 0, 0, 1, 1,
-0.414631, 0.326739, -2.155956, 0, 0, 0, 1, 1,
-0.4143735, -0.781743, -3.074915, 0, 0, 0, 1, 1,
-0.4141983, 0.02840937, -0.338762, 0, 0, 0, 1, 1,
-0.4033953, -0.4655442, -1.643906, 0, 0, 0, 1, 1,
-0.4006045, -0.2023842, -2.038392, 1, 1, 1, 1, 1,
-0.3979389, 0.283222, -2.187672, 1, 1, 1, 1, 1,
-0.3955017, -1.084476, -3.666398, 1, 1, 1, 1, 1,
-0.3943849, -1.253723, -1.904353, 1, 1, 1, 1, 1,
-0.3917333, 2.218911, 0.8600599, 1, 1, 1, 1, 1,
-0.3873298, 0.08062579, -3.080025, 1, 1, 1, 1, 1,
-0.3847475, -1.751121, -1.527544, 1, 1, 1, 1, 1,
-0.3835168, -1.302697, -4.007309, 1, 1, 1, 1, 1,
-0.3820076, 0.6400775, -1.361552, 1, 1, 1, 1, 1,
-0.3802208, -1.282594, -2.827912, 1, 1, 1, 1, 1,
-0.3775516, -2.642319, -2.221599, 1, 1, 1, 1, 1,
-0.3775108, 0.8089465, 1.232088, 1, 1, 1, 1, 1,
-0.3773794, -2.047522, -3.465997, 1, 1, 1, 1, 1,
-0.3696137, 0.1480367, -1.008903, 1, 1, 1, 1, 1,
-0.3679011, 0.0485736, -3.878497, 1, 1, 1, 1, 1,
-0.3662381, -0.04940616, -2.082022, 0, 0, 1, 1, 1,
-0.3572513, -0.2222336, -1.45274, 1, 0, 0, 1, 1,
-0.3524012, -0.8728748, -1.55943, 1, 0, 0, 1, 1,
-0.3521427, -0.7767378, -2.87241, 1, 0, 0, 1, 1,
-0.3521089, -0.601624, -3.110157, 1, 0, 0, 1, 1,
-0.3476737, -0.03319183, -2.60293, 1, 0, 0, 1, 1,
-0.3460311, 0.2275992, -2.225631, 0, 0, 0, 1, 1,
-0.3435134, 0.7495291, -2.2028, 0, 0, 0, 1, 1,
-0.3433692, 1.756329, 0.007764834, 0, 0, 0, 1, 1,
-0.3413958, 0.2439125, -2.356866, 0, 0, 0, 1, 1,
-0.3333363, 0.3922445, -2.483716, 0, 0, 0, 1, 1,
-0.3314908, 0.7862384, 1.176105, 0, 0, 0, 1, 1,
-0.3308243, 1.047955, -0.7206365, 0, 0, 0, 1, 1,
-0.3294868, 0.9509333, 1.797986, 1, 1, 1, 1, 1,
-0.3291785, -0.9314821, -2.352115, 1, 1, 1, 1, 1,
-0.3282642, 0.5705608, 0.7035708, 1, 1, 1, 1, 1,
-0.3278494, -0.6993451, -2.448007, 1, 1, 1, 1, 1,
-0.3178095, -0.740144, -2.443801, 1, 1, 1, 1, 1,
-0.3144929, -0.7051788, -4.222604, 1, 1, 1, 1, 1,
-0.3140422, -0.4650582, -1.331046, 1, 1, 1, 1, 1,
-0.3125116, 0.3852397, -2.020197, 1, 1, 1, 1, 1,
-0.3090076, -0.627148, -3.116657, 1, 1, 1, 1, 1,
-0.3045609, -0.4231329, -0.9936907, 1, 1, 1, 1, 1,
-0.3022017, -0.7825472, -3.725153, 1, 1, 1, 1, 1,
-0.2996031, 0.8579327, -2.221979, 1, 1, 1, 1, 1,
-0.2895466, -1.827306, -4.101675, 1, 1, 1, 1, 1,
-0.2711251, 0.8452405, 2.244432, 1, 1, 1, 1, 1,
-0.2663182, 0.3769053, -0.7471254, 1, 1, 1, 1, 1,
-0.2646312, -0.9291291, -1.981059, 0, 0, 1, 1, 1,
-0.2575894, -0.04063379, -2.400727, 1, 0, 0, 1, 1,
-0.257267, -0.4562272, -1.609243, 1, 0, 0, 1, 1,
-0.2540345, -1.188235, -3.062903, 1, 0, 0, 1, 1,
-0.2534013, 0.8867119, 2.06126, 1, 0, 0, 1, 1,
-0.2501063, -0.1775307, -1.140925, 1, 0, 0, 1, 1,
-0.249, 0.9695719, -0.1179957, 0, 0, 0, 1, 1,
-0.2474935, -0.09242521, -2.607436, 0, 0, 0, 1, 1,
-0.2467767, 0.6981902, 0.123766, 0, 0, 0, 1, 1,
-0.2465447, 0.02930352, -2.152316, 0, 0, 0, 1, 1,
-0.2442166, 1.951265, -0.2039878, 0, 0, 0, 1, 1,
-0.2417813, 1.96415, -0.2125387, 0, 0, 0, 1, 1,
-0.2381881, 1.946529, -0.235159, 0, 0, 0, 1, 1,
-0.2333109, -1.408001, -3.294318, 1, 1, 1, 1, 1,
-0.2324409, 0.07652871, -1.190476, 1, 1, 1, 1, 1,
-0.232162, 0.2935701, -0.672004, 1, 1, 1, 1, 1,
-0.2306372, -0.4397876, -3.140505, 1, 1, 1, 1, 1,
-0.2290462, -0.7371582, -2.878044, 1, 1, 1, 1, 1,
-0.2284824, 0.5727099, 0.53567, 1, 1, 1, 1, 1,
-0.2271397, -0.520222, -2.546569, 1, 1, 1, 1, 1,
-0.2265119, -0.7367977, -1.679049, 1, 1, 1, 1, 1,
-0.2255659, -0.227735, -4.344809, 1, 1, 1, 1, 1,
-0.2248321, -1.684929, -3.471506, 1, 1, 1, 1, 1,
-0.221003, 0.1226393, -0.4580744, 1, 1, 1, 1, 1,
-0.2167058, -0.2520256, -2.766927, 1, 1, 1, 1, 1,
-0.2151985, -0.5295327, -2.569537, 1, 1, 1, 1, 1,
-0.2106247, -0.2238809, -1.139705, 1, 1, 1, 1, 1,
-0.2033121, 0.6102129, -0.03310899, 1, 1, 1, 1, 1,
-0.1997253, 1.000684, 0.4635515, 0, 0, 1, 1, 1,
-0.1981824, -0.08251619, -2.602353, 1, 0, 0, 1, 1,
-0.1979502, -0.3655576, -2.408983, 1, 0, 0, 1, 1,
-0.1974855, -0.9457015, -3.160163, 1, 0, 0, 1, 1,
-0.194447, -0.8081237, -2.396219, 1, 0, 0, 1, 1,
-0.1924289, -0.947768, -2.617184, 1, 0, 0, 1, 1,
-0.1906908, 0.8218088, -0.07001124, 0, 0, 0, 1, 1,
-0.1859051, 1.126006, -0.8287326, 0, 0, 0, 1, 1,
-0.1757631, -1.165892, -2.592797, 0, 0, 0, 1, 1,
-0.1756757, 0.4189126, -1.274877, 0, 0, 0, 1, 1,
-0.1711718, -0.91429, -4.543199, 0, 0, 0, 1, 1,
-0.16948, -1.638499, -6.18153, 0, 0, 0, 1, 1,
-0.1675879, -0.4944526, -1.489033, 0, 0, 0, 1, 1,
-0.164185, -0.4512593, -2.988628, 1, 1, 1, 1, 1,
-0.1582159, -0.8402689, -3.702615, 1, 1, 1, 1, 1,
-0.156577, 0.5718671, -1.09396, 1, 1, 1, 1, 1,
-0.1511302, -1.54509, -1.868756, 1, 1, 1, 1, 1,
-0.1508608, 2.065237, -1.154865, 1, 1, 1, 1, 1,
-0.1474417, 0.2542725, 0.7467064, 1, 1, 1, 1, 1,
-0.1461955, 0.4109763, -0.7197859, 1, 1, 1, 1, 1,
-0.1454752, -0.385874, -2.800999, 1, 1, 1, 1, 1,
-0.1450732, -1.864843, -1.896802, 1, 1, 1, 1, 1,
-0.145073, 0.1487036, -1.274367, 1, 1, 1, 1, 1,
-0.144388, -0.8799317, -1.042695, 1, 1, 1, 1, 1,
-0.1373259, 0.6572074, -0.3063391, 1, 1, 1, 1, 1,
-0.1369821, 1.228792, -1.02619, 1, 1, 1, 1, 1,
-0.1353784, -1.16154, -2.609639, 1, 1, 1, 1, 1,
-0.131771, 0.3330101, 1.375919, 1, 1, 1, 1, 1,
-0.130192, -0.7580898, -2.459145, 0, 0, 1, 1, 1,
-0.1292862, -0.827688, -5.079032, 1, 0, 0, 1, 1,
-0.1236227, -0.3822087, -2.872671, 1, 0, 0, 1, 1,
-0.1212209, 0.6647426, 2.006079, 1, 0, 0, 1, 1,
-0.1144086, 1.049422, -0.4405918, 1, 0, 0, 1, 1,
-0.110784, -0.4157502, -2.324893, 1, 0, 0, 1, 1,
-0.1089979, 2.655769, 1.657916, 0, 0, 0, 1, 1,
-0.1088248, 0.2364624, -0.5400355, 0, 0, 0, 1, 1,
-0.1087183, -1.988005, -3.127816, 0, 0, 0, 1, 1,
-0.107156, 0.7229064, 0.592061, 0, 0, 0, 1, 1,
-0.1070852, 1.704959, -1.977022, 0, 0, 0, 1, 1,
-0.1031444, 0.6923079, -1.957414, 0, 0, 0, 1, 1,
-0.09967273, 1.471426, -1.541715, 0, 0, 0, 1, 1,
-0.09892629, 1.280039, -0.4766858, 1, 1, 1, 1, 1,
-0.09875409, 1.780339, 0.8851997, 1, 1, 1, 1, 1,
-0.09758937, -1.188046, -2.782879, 1, 1, 1, 1, 1,
-0.09720286, -0.1231183, -1.303268, 1, 1, 1, 1, 1,
-0.09243628, 1.116768, -1.530146, 1, 1, 1, 1, 1,
-0.08989302, -0.667438, -2.944795, 1, 1, 1, 1, 1,
-0.08572873, -0.9064612, -2.471016, 1, 1, 1, 1, 1,
-0.08545168, 0.9149405, -1.372458, 1, 1, 1, 1, 1,
-0.08440651, 0.6641058, 0.5404926, 1, 1, 1, 1, 1,
-0.08051437, 2.729783, -0.4060729, 1, 1, 1, 1, 1,
-0.07932332, 0.2432987, -0.8701577, 1, 1, 1, 1, 1,
-0.07878417, 0.5283778, -0.2939795, 1, 1, 1, 1, 1,
-0.07863316, -0.357135, -2.483185, 1, 1, 1, 1, 1,
-0.07855216, -0.4598542, -3.425327, 1, 1, 1, 1, 1,
-0.07666022, 1.370259, 0.2060732, 1, 1, 1, 1, 1,
-0.07625715, 0.4193452, -0.1910906, 0, 0, 1, 1, 1,
-0.07423002, -1.068701, -4.59745, 1, 0, 0, 1, 1,
-0.07414876, 2.303495, -1.077617, 1, 0, 0, 1, 1,
-0.06315222, -0.4689679, -3.768977, 1, 0, 0, 1, 1,
-0.05929187, -1.265031, -2.446648, 1, 0, 0, 1, 1,
-0.05849272, -0.6130335, -3.833256, 1, 0, 0, 1, 1,
-0.05462934, 0.9268417, -0.1815586, 0, 0, 0, 1, 1,
-0.05376653, -0.9404446, -3.173361, 0, 0, 0, 1, 1,
-0.05193593, 0.8987646, -0.1104361, 0, 0, 0, 1, 1,
-0.04915095, 0.6505491, 0.4793387, 0, 0, 0, 1, 1,
-0.04454135, 0.01098307, -0.8585716, 0, 0, 0, 1, 1,
-0.03968039, 0.3350751, -0.1023386, 0, 0, 0, 1, 1,
-0.0384784, -0.2584437, -3.506148, 0, 0, 0, 1, 1,
-0.03729235, -1.316557, -3.307746, 1, 1, 1, 1, 1,
-0.03659808, 0.4920199, -1.120694, 1, 1, 1, 1, 1,
-0.03624724, 0.6657377, 0.4354793, 1, 1, 1, 1, 1,
-0.03224351, 0.1825236, 1.346128, 1, 1, 1, 1, 1,
-0.03189964, 0.2302159, -0.4486277, 1, 1, 1, 1, 1,
-0.03160396, -1.126727, -2.557972, 1, 1, 1, 1, 1,
-0.02999465, 1.164337, -1.975835, 1, 1, 1, 1, 1,
-0.02881517, -0.7286555, -2.534248, 1, 1, 1, 1, 1,
-0.02777388, -0.4278139, -2.977153, 1, 1, 1, 1, 1,
-0.02723719, -0.04169368, -2.627662, 1, 1, 1, 1, 1,
-0.02649535, -0.3408143, -2.895877, 1, 1, 1, 1, 1,
-0.02567938, 1.042745, 0.5112662, 1, 1, 1, 1, 1,
-0.02437152, 2.061943, 0.9955192, 1, 1, 1, 1, 1,
-0.0205799, -0.02333277, -1.845024, 1, 1, 1, 1, 1,
-0.01586763, -0.7034463, -3.195566, 1, 1, 1, 1, 1,
-0.01573731, 0.2332557, -0.1260816, 0, 0, 1, 1, 1,
-0.01535301, 1.721906, 0.1124022, 1, 0, 0, 1, 1,
-0.01427924, -0.292536, -1.711131, 1, 0, 0, 1, 1,
-0.008869733, -0.4752393, -4.092362, 1, 0, 0, 1, 1,
-0.002173255, 0.7023359, -2.105674, 1, 0, 0, 1, 1,
-0.002050509, -0.6320621, -2.135111, 1, 0, 0, 1, 1,
-0.0009868955, 0.1070392, 2.080171, 0, 0, 0, 1, 1,
-0.0003564545, 0.7316608, 0.6204372, 0, 0, 0, 1, 1,
0.0006760434, 0.1626564, 1.634035, 0, 0, 0, 1, 1,
0.002350591, 0.5040556, -1.061587, 0, 0, 0, 1, 1,
0.002713468, 0.3479994, -0.8345554, 0, 0, 0, 1, 1,
0.002823415, 1.815157, 0.0371948, 0, 0, 0, 1, 1,
0.00459862, -0.296442, 4.236224, 0, 0, 0, 1, 1,
0.00689201, 0.6267053, 1.10323, 1, 1, 1, 1, 1,
0.009089418, -0.3527946, 1.616435, 1, 1, 1, 1, 1,
0.01451138, -0.08119537, 4.241356, 1, 1, 1, 1, 1,
0.01527659, 0.3415746, 0.3417717, 1, 1, 1, 1, 1,
0.01540183, 0.2617538, -0.2149759, 1, 1, 1, 1, 1,
0.01706724, -2.813408, 2.644604, 1, 1, 1, 1, 1,
0.01708164, -0.2194375, 3.065287, 1, 1, 1, 1, 1,
0.01752058, -0.01170347, 2.023291, 1, 1, 1, 1, 1,
0.02076048, 0.7049623, 0.5155654, 1, 1, 1, 1, 1,
0.0218327, 1.183593, 0.1260245, 1, 1, 1, 1, 1,
0.02508542, 1.153174, 0.3311572, 1, 1, 1, 1, 1,
0.02829911, -0.8468568, 4.76982, 1, 1, 1, 1, 1,
0.02859799, -0.127432, 2.59364, 1, 1, 1, 1, 1,
0.03126002, 0.4944411, -2.52631, 1, 1, 1, 1, 1,
0.03443535, -0.6867635, 4.019236, 1, 1, 1, 1, 1,
0.03722971, -1.207242, 3.371594, 0, 0, 1, 1, 1,
0.03970389, 0.08049771, 0.07612435, 1, 0, 0, 1, 1,
0.04044776, -0.6775565, 4.149232, 1, 0, 0, 1, 1,
0.04291024, 0.8376524, -0.827903, 1, 0, 0, 1, 1,
0.04794028, -1.258577, 2.283258, 1, 0, 0, 1, 1,
0.04877926, 0.7331269, -1.343363, 1, 0, 0, 1, 1,
0.04895241, -0.527774, 4.650545, 0, 0, 0, 1, 1,
0.05082314, -1.586527, 2.901292, 0, 0, 0, 1, 1,
0.05284097, 0.5507334, -0.7540143, 0, 0, 0, 1, 1,
0.0536732, -0.6722366, 3.15185, 0, 0, 0, 1, 1,
0.05613431, -0.9260809, 3.240794, 0, 0, 0, 1, 1,
0.05700476, -0.1149565, 3.20778, 0, 0, 0, 1, 1,
0.05752347, 1.757931, 0.6103196, 0, 0, 0, 1, 1,
0.05914802, -0.1009388, 2.957429, 1, 1, 1, 1, 1,
0.06061314, -0.360915, 4.552705, 1, 1, 1, 1, 1,
0.06092044, 0.5702274, -0.7140637, 1, 1, 1, 1, 1,
0.06699601, -0.8758269, 2.774556, 1, 1, 1, 1, 1,
0.06756806, 0.6884072, 0.03665485, 1, 1, 1, 1, 1,
0.06803421, 0.276856, 1.453233, 1, 1, 1, 1, 1,
0.07452859, -0.8219155, 2.122635, 1, 1, 1, 1, 1,
0.07524556, -1.75433, 4.343524, 1, 1, 1, 1, 1,
0.07633133, -0.8072707, 4.134346, 1, 1, 1, 1, 1,
0.0771979, -0.3126543, 3.378242, 1, 1, 1, 1, 1,
0.0795629, 0.8453466, -0.1833587, 1, 1, 1, 1, 1,
0.08086411, 0.6055913, -0.5445428, 1, 1, 1, 1, 1,
0.08177078, -1.217847, 3.185746, 1, 1, 1, 1, 1,
0.08417807, 1.079924, -0.4508926, 1, 1, 1, 1, 1,
0.08846171, -0.2637932, 2.956371, 1, 1, 1, 1, 1,
0.09091936, -0.3164681, 2.965323, 0, 0, 1, 1, 1,
0.09726572, 1.343524, 0.2066688, 1, 0, 0, 1, 1,
0.09746683, 0.9636014, 0.6974501, 1, 0, 0, 1, 1,
0.09826565, 1.153547, -2.229664, 1, 0, 0, 1, 1,
0.09879249, 0.2016817, -0.6192438, 1, 0, 0, 1, 1,
0.100646, -0.2012468, 4.924372, 1, 0, 0, 1, 1,
0.101678, 0.1816197, 2.058112, 0, 0, 0, 1, 1,
0.102761, 1.30453, 0.5018443, 0, 0, 0, 1, 1,
0.1031645, -0.2611883, 2.242713, 0, 0, 0, 1, 1,
0.1053127, -2.441639, 2.550875, 0, 0, 0, 1, 1,
0.1061116, -0.6661331, 1.7732, 0, 0, 0, 1, 1,
0.1083777, -0.2900817, 2.695691, 0, 0, 0, 1, 1,
0.109539, 1.194761, -1.445812, 0, 0, 0, 1, 1,
0.10993, 0.4351367, -0.2776534, 1, 1, 1, 1, 1,
0.1099713, 0.818945, 0.7377468, 1, 1, 1, 1, 1,
0.1156001, 0.7115285, 0.3065497, 1, 1, 1, 1, 1,
0.1179759, 0.9381258, 0.3863773, 1, 1, 1, 1, 1,
0.1204373, -0.3096627, 3.1377, 1, 1, 1, 1, 1,
0.120775, 0.633289, 1.03982, 1, 1, 1, 1, 1,
0.1214695, -0.03094352, 2.21522, 1, 1, 1, 1, 1,
0.1215134, 0.07483895, 1.793753, 1, 1, 1, 1, 1,
0.1283133, -2.281937, 2.156634, 1, 1, 1, 1, 1,
0.133339, -0.9812272, 4.313029, 1, 1, 1, 1, 1,
0.1404329, 1.846705, -1.865447, 1, 1, 1, 1, 1,
0.1452161, -0.7872428, 2.577877, 1, 1, 1, 1, 1,
0.1456733, -0.1836691, 0.6987128, 1, 1, 1, 1, 1,
0.1460195, -0.1257731, 1.905627, 1, 1, 1, 1, 1,
0.1462136, 1.072763, 0.3141907, 1, 1, 1, 1, 1,
0.1472567, 0.3028322, 0.6780907, 0, 0, 1, 1, 1,
0.1491438, -1.602884, 1.397383, 1, 0, 0, 1, 1,
0.1494455, 1.753864, 0.3480963, 1, 0, 0, 1, 1,
0.1503494, 0.6416774, 1.598409, 1, 0, 0, 1, 1,
0.1507312, -1.352893, 2.797468, 1, 0, 0, 1, 1,
0.1522595, -0.8974915, 3.719968, 1, 0, 0, 1, 1,
0.1523633, -0.883616, 1.63302, 0, 0, 0, 1, 1,
0.1527254, 1.817087, -1.050139, 0, 0, 0, 1, 1,
0.1532551, 0.05733478, 0.4101482, 0, 0, 0, 1, 1,
0.1541483, 0.796224, -0.1279338, 0, 0, 0, 1, 1,
0.1561603, 0.7325691, -2.273504, 0, 0, 0, 1, 1,
0.1581019, 0.5541014, -0.1658379, 0, 0, 0, 1, 1,
0.1602374, -0.5577132, 3.300075, 0, 0, 0, 1, 1,
0.1621187, -0.3716898, 1.61047, 1, 1, 1, 1, 1,
0.1657673, 0.4011472, 2.309855, 1, 1, 1, 1, 1,
0.1669336, -0.3037091, 3.012831, 1, 1, 1, 1, 1,
0.1711265, -0.5276422, 3.201677, 1, 1, 1, 1, 1,
0.1769742, 1.215842, 0.387774, 1, 1, 1, 1, 1,
0.1782903, 1.610375, 0.3815216, 1, 1, 1, 1, 1,
0.1803191, 1.528182, -1.627854, 1, 1, 1, 1, 1,
0.1832013, -1.254017, 2.2295, 1, 1, 1, 1, 1,
0.1862551, -1.176386, 5.160393, 1, 1, 1, 1, 1,
0.1868304, 0.3140542, 1.741698, 1, 1, 1, 1, 1,
0.1899449, 0.06205805, 2.71529, 1, 1, 1, 1, 1,
0.1912317, -0.2693323, 2.475972, 1, 1, 1, 1, 1,
0.1942125, -0.6056712, 3.752484, 1, 1, 1, 1, 1,
0.1942159, -0.5801936, 3.339664, 1, 1, 1, 1, 1,
0.2014786, 0.1932402, 1.625362, 1, 1, 1, 1, 1,
0.2016602, -0.6456943, 3.251353, 0, 0, 1, 1, 1,
0.2024159, 0.9502928, 1.140831, 1, 0, 0, 1, 1,
0.2031707, 0.3242121, 1.074735, 1, 0, 0, 1, 1,
0.2124812, 0.1115812, 0.1840213, 1, 0, 0, 1, 1,
0.2137858, 0.5891467, 1.011775, 1, 0, 0, 1, 1,
0.2140359, 0.5516543, 0.02127193, 1, 0, 0, 1, 1,
0.2209612, -0.001906622, 2.624757, 0, 0, 0, 1, 1,
0.223538, -0.3985592, 1.5259, 0, 0, 0, 1, 1,
0.2329597, 0.6451316, -0.8709978, 0, 0, 0, 1, 1,
0.2368286, 0.5409976, 0.3970221, 0, 0, 0, 1, 1,
0.2423975, 0.693042, -0.9294327, 0, 0, 0, 1, 1,
0.250279, 2.972344, -0.3790756, 0, 0, 0, 1, 1,
0.250357, 0.8880035, -0.03721163, 0, 0, 0, 1, 1,
0.2517307, -0.03693878, 2.889899, 1, 1, 1, 1, 1,
0.2520873, 0.03829673, 0.4762545, 1, 1, 1, 1, 1,
0.2534264, -0.6751445, 3.1505, 1, 1, 1, 1, 1,
0.2596305, -0.3699202, 2.616358, 1, 1, 1, 1, 1,
0.2627885, -0.461106, 0.777192, 1, 1, 1, 1, 1,
0.264843, -0.2197814, 4.21101, 1, 1, 1, 1, 1,
0.265454, 0.7195913, -0.3915329, 1, 1, 1, 1, 1,
0.2662365, -1.940279, 2.324013, 1, 1, 1, 1, 1,
0.26758, -0.5186828, 3.04685, 1, 1, 1, 1, 1,
0.2690029, 0.1778806, -0.8455845, 1, 1, 1, 1, 1,
0.269334, 0.3306224, 0.3777557, 1, 1, 1, 1, 1,
0.2702569, 0.9306561, -0.3014232, 1, 1, 1, 1, 1,
0.2733463, 1.286282, 0.732992, 1, 1, 1, 1, 1,
0.2743571, 0.06993502, 0.6214418, 1, 1, 1, 1, 1,
0.2768014, -0.3332377, 0.5220915, 1, 1, 1, 1, 1,
0.2772808, 0.4118117, 0.3681788, 0, 0, 1, 1, 1,
0.2811694, -0.7414504, 3.040763, 1, 0, 0, 1, 1,
0.287508, -0.04313888, 2.168971, 1, 0, 0, 1, 1,
0.2876319, 1.73361, 0.07628185, 1, 0, 0, 1, 1,
0.2878404, 0.768801, 1.730217, 1, 0, 0, 1, 1,
0.2879517, 0.1216491, -0.3391473, 1, 0, 0, 1, 1,
0.2891435, -1.210224, 3.815757, 0, 0, 0, 1, 1,
0.2910242, -0.4053371, 1.680935, 0, 0, 0, 1, 1,
0.2916512, 0.6845956, -0.3180723, 0, 0, 0, 1, 1,
0.2944506, -0.8921038, 2.458806, 0, 0, 0, 1, 1,
0.2971653, -1.099819, 2.790775, 0, 0, 0, 1, 1,
0.3001477, 0.1697742, 0.3474234, 0, 0, 0, 1, 1,
0.3008297, -0.717271, 4.041399, 0, 0, 0, 1, 1,
0.3009098, 0.5803842, 0.4065265, 1, 1, 1, 1, 1,
0.3038561, -0.1402979, 0.1078795, 1, 1, 1, 1, 1,
0.3172706, -0.9369426, 2.392147, 1, 1, 1, 1, 1,
0.3240635, 0.4908323, 0.6801076, 1, 1, 1, 1, 1,
0.3327118, -0.8225859, 2.491207, 1, 1, 1, 1, 1,
0.3356368, -0.8754155, 1.976946, 1, 1, 1, 1, 1,
0.3376226, 0.8489549, -0.7347834, 1, 1, 1, 1, 1,
0.3479921, 0.3749557, 0.9768434, 1, 1, 1, 1, 1,
0.3506266, -0.6584937, 1.814123, 1, 1, 1, 1, 1,
0.3534087, -0.3416556, 0.3186541, 1, 1, 1, 1, 1,
0.3538873, -0.6996983, 1.628294, 1, 1, 1, 1, 1,
0.3540089, 0.2475616, 1.676945, 1, 1, 1, 1, 1,
0.3587609, 0.07547373, 0.4631388, 1, 1, 1, 1, 1,
0.3594481, 0.4383587, -0.4227121, 1, 1, 1, 1, 1,
0.3607607, 0.02353602, 0.13685, 1, 1, 1, 1, 1,
0.3608487, 0.1277962, 1.041297, 0, 0, 1, 1, 1,
0.3698687, -2.047169, 2.942523, 1, 0, 0, 1, 1,
0.3703803, 1.32356, 1.68894, 1, 0, 0, 1, 1,
0.3748531, -1.779911, 3.464482, 1, 0, 0, 1, 1,
0.3767042, 0.489659, -0.7779031, 1, 0, 0, 1, 1,
0.3800943, -0.3164349, 2.474035, 1, 0, 0, 1, 1,
0.3806309, -0.01818957, 2.574113, 0, 0, 0, 1, 1,
0.380864, -2.195235, 2.408335, 0, 0, 0, 1, 1,
0.3822352, 1.193622, 1.077481, 0, 0, 0, 1, 1,
0.3833712, -1.046441, 3.130942, 0, 0, 0, 1, 1,
0.3852203, -0.8670616, 3.45026, 0, 0, 0, 1, 1,
0.3875754, -0.2239032, 1.283135, 0, 0, 0, 1, 1,
0.3890041, 0.4562857, -0.3267407, 0, 0, 0, 1, 1,
0.3919128, 0.006680612, 2.121717, 1, 1, 1, 1, 1,
0.3942341, 0.1172807, 1.56559, 1, 1, 1, 1, 1,
0.3953095, 0.2048821, 0.8589422, 1, 1, 1, 1, 1,
0.3969065, 0.4602545, -0.6089714, 1, 1, 1, 1, 1,
0.4007339, -0.2379898, 3.358328, 1, 1, 1, 1, 1,
0.403365, -1.316864, 3.652463, 1, 1, 1, 1, 1,
0.4039206, -0.07193443, 0.8433175, 1, 1, 1, 1, 1,
0.4043317, -1.114059, 4.363696, 1, 1, 1, 1, 1,
0.417405, 0.130871, -0.02547733, 1, 1, 1, 1, 1,
0.4179871, -0.6577648, 2.944564, 1, 1, 1, 1, 1,
0.4202621, 0.2136182, 1.578245, 1, 1, 1, 1, 1,
0.4242489, 2.430857, 1.796887, 1, 1, 1, 1, 1,
0.4260822, -1.266802, 2.439732, 1, 1, 1, 1, 1,
0.4291072, -0.321038, 3.291145, 1, 1, 1, 1, 1,
0.4338292, -1.182253, 2.477912, 1, 1, 1, 1, 1,
0.4377586, -0.2985967, 2.835212, 0, 0, 1, 1, 1,
0.43882, -0.8799257, 3.462896, 1, 0, 0, 1, 1,
0.4428374, -0.8631929, 2.001068, 1, 0, 0, 1, 1,
0.4430761, 0.7282482, 2.557405, 1, 0, 0, 1, 1,
0.4558956, -1.55341, 3.807611, 1, 0, 0, 1, 1,
0.4573953, -1.637386, 2.928771, 1, 0, 0, 1, 1,
0.4622378, -0.3532019, 1.741957, 0, 0, 0, 1, 1,
0.4626275, -0.02043938, 2.021907, 0, 0, 0, 1, 1,
0.4674261, -1.327526, 3.419037, 0, 0, 0, 1, 1,
0.4728193, -2.026175, 1.363849, 0, 0, 0, 1, 1,
0.4793869, -1.98593, 1.547362, 0, 0, 0, 1, 1,
0.4795024, 2.220153, -0.433926, 0, 0, 0, 1, 1,
0.481145, -0.3946831, 3.235406, 0, 0, 0, 1, 1,
0.4831661, 1.484961, 0.4774456, 1, 1, 1, 1, 1,
0.4878832, -1.404034, 3.931394, 1, 1, 1, 1, 1,
0.488349, 0.1114874, 1.421105, 1, 1, 1, 1, 1,
0.4977959, 0.890176, 0.08462176, 1, 1, 1, 1, 1,
0.5058253, -0.2835527, 1.196813, 1, 1, 1, 1, 1,
0.5069662, 0.4606598, 0.06915204, 1, 1, 1, 1, 1,
0.5094504, -0.643266, 2.291342, 1, 1, 1, 1, 1,
0.5094768, 0.8896189, -0.2639103, 1, 1, 1, 1, 1,
0.5114286, -0.3431719, 2.657508, 1, 1, 1, 1, 1,
0.5189742, 0.9347231, 0.533472, 1, 1, 1, 1, 1,
0.519379, 1.328806, 0.04725476, 1, 1, 1, 1, 1,
0.5212726, 1.653932, 0.2257052, 1, 1, 1, 1, 1,
0.5228412, -1.299563, 2.165389, 1, 1, 1, 1, 1,
0.5248038, 1.301916, -0.1811704, 1, 1, 1, 1, 1,
0.5260651, 0.3260921, 2.304131, 1, 1, 1, 1, 1,
0.5290811, -0.0931049, 2.301198, 0, 0, 1, 1, 1,
0.5313766, -0.3812192, 2.780404, 1, 0, 0, 1, 1,
0.5399066, -1.006109, 1.430472, 1, 0, 0, 1, 1,
0.5444696, 1.18833, 1.316494, 1, 0, 0, 1, 1,
0.5461535, 1.338828, 2.227837, 1, 0, 0, 1, 1,
0.5463256, 1.625618, -0.4524712, 1, 0, 0, 1, 1,
0.5471264, -2.093044, 3.084336, 0, 0, 0, 1, 1,
0.5484523, -0.816791, 1.195369, 0, 0, 0, 1, 1,
0.5511129, 0.1850607, 1.874283, 0, 0, 0, 1, 1,
0.551962, 0.7474312, 0.3473693, 0, 0, 0, 1, 1,
0.5537839, -0.3219477, 2.064595, 0, 0, 0, 1, 1,
0.5575533, 0.2378322, -1.293763, 0, 0, 0, 1, 1,
0.5640789, 0.3397554, -1.064465, 0, 0, 0, 1, 1,
0.5650457, -0.8721771, 1.228152, 1, 1, 1, 1, 1,
0.5653346, 0.05095087, 3.256894, 1, 1, 1, 1, 1,
0.5760181, -0.5684502, 3.64685, 1, 1, 1, 1, 1,
0.5767181, -3.149594, 1.269603, 1, 1, 1, 1, 1,
0.5796286, 0.2188133, -0.4778055, 1, 1, 1, 1, 1,
0.5839574, -0.2020459, 2.673297, 1, 1, 1, 1, 1,
0.5867525, -0.1402269, 2.399121, 1, 1, 1, 1, 1,
0.5911614, 0.0552016, 0.9258288, 1, 1, 1, 1, 1,
0.5987095, -1.247077, 3.430945, 1, 1, 1, 1, 1,
0.6008086, -0.3135655, 3.067449, 1, 1, 1, 1, 1,
0.6020596, -0.1583066, 4.221159, 1, 1, 1, 1, 1,
0.6128854, -0.8220449, 2.695837, 1, 1, 1, 1, 1,
0.6152664, -1.361434, 2.459581, 1, 1, 1, 1, 1,
0.6209236, -0.529407, 0.4608569, 1, 1, 1, 1, 1,
0.6215338, -1.3116, 2.525866, 1, 1, 1, 1, 1,
0.623204, -0.1000935, 2.816033, 0, 0, 1, 1, 1,
0.6259631, 0.4854697, 2.163811, 1, 0, 0, 1, 1,
0.6273403, 0.583549, 0.1603688, 1, 0, 0, 1, 1,
0.628091, -0.7000929, 2.523869, 1, 0, 0, 1, 1,
0.6343334, -1.12214, 2.916343, 1, 0, 0, 1, 1,
0.6362616, 1.537244, 0.9224164, 1, 0, 0, 1, 1,
0.6388862, -1.90575, 2.12373, 0, 0, 0, 1, 1,
0.6428567, -1.399998, 1.195409, 0, 0, 0, 1, 1,
0.643908, -0.4045991, 1.782668, 0, 0, 0, 1, 1,
0.6506624, -0.7069396, 1.454265, 0, 0, 0, 1, 1,
0.6554261, 0.1962665, 0.4953356, 0, 0, 0, 1, 1,
0.6598257, 0.4025761, 1.70471, 0, 0, 0, 1, 1,
0.6615925, -1.32093, 1.772651, 0, 0, 0, 1, 1,
0.6678397, -0.2304513, 1.01811, 1, 1, 1, 1, 1,
0.6696277, -0.2712133, 1.520923, 1, 1, 1, 1, 1,
0.6705301, -0.1027432, 1.367778, 1, 1, 1, 1, 1,
0.6707974, 0.5811784, 2.086004, 1, 1, 1, 1, 1,
0.6797035, -0.316403, 3.087076, 1, 1, 1, 1, 1,
0.6809177, 0.1167263, 0.0231391, 1, 1, 1, 1, 1,
0.6823016, -0.4605094, 2.290679, 1, 1, 1, 1, 1,
0.6835685, -0.5358905, 1.925525, 1, 1, 1, 1, 1,
0.6892134, 1.017939, 0.07019968, 1, 1, 1, 1, 1,
0.6925061, 0.01687899, 1.251603, 1, 1, 1, 1, 1,
0.6927555, 0.9757268, 1.470725, 1, 1, 1, 1, 1,
0.6967759, 2.321419, 0.0799714, 1, 1, 1, 1, 1,
0.6977891, 0.528362, 2.024836, 1, 1, 1, 1, 1,
0.7009565, 0.7823145, 1.03098, 1, 1, 1, 1, 1,
0.707892, -0.4562679, 2.633989, 1, 1, 1, 1, 1,
0.7091203, 1.106261, 1.610723, 0, 0, 1, 1, 1,
0.709556, 0.197483, 0.9026195, 1, 0, 0, 1, 1,
0.71136, 0.1653487, -0.108606, 1, 0, 0, 1, 1,
0.711458, -1.256685, 1.20821, 1, 0, 0, 1, 1,
0.7153838, 1.498768, -0.9373671, 1, 0, 0, 1, 1,
0.7171153, 0.8924497, 0.4080945, 1, 0, 0, 1, 1,
0.7187362, 1.486, -0.5605536, 0, 0, 0, 1, 1,
0.7223326, 2.05074, 0.4827547, 0, 0, 0, 1, 1,
0.723879, 0.6408612, 0.3478496, 0, 0, 0, 1, 1,
0.7366869, 0.5059607, 0.4661478, 0, 0, 0, 1, 1,
0.7500293, -0.5624897, 3.609161, 0, 0, 0, 1, 1,
0.7501814, 2.046458, 1.264612, 0, 0, 0, 1, 1,
0.7511988, -1.401092, 1.933293, 0, 0, 0, 1, 1,
0.7540455, 0.313462, 1.368021, 1, 1, 1, 1, 1,
0.7568836, 0.05328403, 1.875968, 1, 1, 1, 1, 1,
0.7616953, 0.02415952, 0.5945927, 1, 1, 1, 1, 1,
0.7645651, 1.018148, 4.445883, 1, 1, 1, 1, 1,
0.7650382, 0.2188757, 1.859987, 1, 1, 1, 1, 1,
0.7660951, 1.67505, -0.1878767, 1, 1, 1, 1, 1,
0.7720373, 0.02437634, 0.540356, 1, 1, 1, 1, 1,
0.7726786, 0.920803, 2.199001, 1, 1, 1, 1, 1,
0.7764497, -1.430731, 0.8976024, 1, 1, 1, 1, 1,
0.7766391, -0.2496083, 0.08710044, 1, 1, 1, 1, 1,
0.7795382, -0.0600775, 1.645717, 1, 1, 1, 1, 1,
0.7826174, -2.154951, 3.281748, 1, 1, 1, 1, 1,
0.7842966, -1.346745, 2.011235, 1, 1, 1, 1, 1,
0.7991528, -2.124752, 2.897848, 1, 1, 1, 1, 1,
0.8018813, -0.279113, 0.8475798, 1, 1, 1, 1, 1,
0.8036412, 0.4383733, 1.095978, 0, 0, 1, 1, 1,
0.8044643, 0.7807143, -0.5569341, 1, 0, 0, 1, 1,
0.8126016, -0.2682438, 1.391226, 1, 0, 0, 1, 1,
0.8130682, 1.342101, -0.6493363, 1, 0, 0, 1, 1,
0.8149906, 0.7541527, -0.6888074, 1, 0, 0, 1, 1,
0.8156346, 0.1187719, 0.1953043, 1, 0, 0, 1, 1,
0.8202006, 0.8995253, 1.714812, 0, 0, 0, 1, 1,
0.8202165, 0.7451257, 2.53642, 0, 0, 0, 1, 1,
0.8221366, -1.571023, 2.984717, 0, 0, 0, 1, 1,
0.8273064, 0.9239932, 0.3487925, 0, 0, 0, 1, 1,
0.8319907, 0.3853382, 1.891451, 0, 0, 0, 1, 1,
0.8321047, -0.2858853, 4.196146, 0, 0, 0, 1, 1,
0.8333686, 0.212236, 1.434629, 0, 0, 0, 1, 1,
0.8347632, 1.91848, 0.04062596, 1, 1, 1, 1, 1,
0.8350509, -0.3969796, 4.004209, 1, 1, 1, 1, 1,
0.8355901, -0.4576824, 2.386833, 1, 1, 1, 1, 1,
0.838986, -0.9419559, 2.983129, 1, 1, 1, 1, 1,
0.8390707, 0.6372296, 0.9124588, 1, 1, 1, 1, 1,
0.845212, 0.8029951, 1.280746, 1, 1, 1, 1, 1,
0.8452855, -1.437999, 1.936452, 1, 1, 1, 1, 1,
0.8453349, 0.3410093, 0.8514722, 1, 1, 1, 1, 1,
0.8491724, 0.5565827, 1.900204, 1, 1, 1, 1, 1,
0.8557429, -0.03798969, 1.053714, 1, 1, 1, 1, 1,
0.8558438, -0.5458246, 3.743705, 1, 1, 1, 1, 1,
0.8610036, 1.436988, 0.2174453, 1, 1, 1, 1, 1,
0.8616111, -1.949646, 2.814328, 1, 1, 1, 1, 1,
0.8675563, 2.186163, -0.2271317, 1, 1, 1, 1, 1,
0.868028, -0.3559841, 2.719652, 1, 1, 1, 1, 1,
0.8709323, -0.9340776, 3.020013, 0, 0, 1, 1, 1,
0.8713582, 0.7343068, 0.8013246, 1, 0, 0, 1, 1,
0.8739302, -0.6398677, 2.844358, 1, 0, 0, 1, 1,
0.8763368, -0.3692257, -1.029872, 1, 0, 0, 1, 1,
0.8774097, 0.03353849, 0.5326778, 1, 0, 0, 1, 1,
0.8792599, 0.1463063, 0.05438315, 1, 0, 0, 1, 1,
0.8906996, -1.968737, 0.8269073, 0, 0, 0, 1, 1,
0.893796, -1.200156, 0.4346455, 0, 0, 0, 1, 1,
0.8942376, -0.3671482, 1.910983, 0, 0, 0, 1, 1,
0.8979698, 0.5727946, 1.018804, 0, 0, 0, 1, 1,
0.9055406, -0.7462813, 2.375893, 0, 0, 0, 1, 1,
0.9067112, 0.7432382, 1.314389, 0, 0, 0, 1, 1,
0.9101303, 1.504997, 1.246746, 0, 0, 0, 1, 1,
0.9118308, -1.273918, 4.109387, 1, 1, 1, 1, 1,
0.9126559, 1.436968, -0.3234108, 1, 1, 1, 1, 1,
0.9169465, -0.2450054, -0.7533601, 1, 1, 1, 1, 1,
0.9176897, -1.473245, 3.091202, 1, 1, 1, 1, 1,
0.9195434, -1.450585, -0.1372033, 1, 1, 1, 1, 1,
0.9209456, -0.2841545, 1.667559, 1, 1, 1, 1, 1,
0.9248215, -0.5134332, 2.307072, 1, 1, 1, 1, 1,
0.9254245, 0.4534364, 0.3674237, 1, 1, 1, 1, 1,
0.9268854, -0.3467667, 1.778114, 1, 1, 1, 1, 1,
0.9280413, -0.322922, 0.2584601, 1, 1, 1, 1, 1,
0.9413719, 0.6290542, 0.7134652, 1, 1, 1, 1, 1,
0.9492102, 0.11071, 2.358898, 1, 1, 1, 1, 1,
0.9509388, -0.1765726, 1.460527, 1, 1, 1, 1, 1,
0.9545575, 0.119668, 2.635094, 1, 1, 1, 1, 1,
0.9573659, -0.2303705, 0.9046228, 1, 1, 1, 1, 1,
0.9618698, 1.108772, 1.199104, 0, 0, 1, 1, 1,
0.9652452, 2.147142, 0.4376944, 1, 0, 0, 1, 1,
0.9761063, -0.06328599, 1.547367, 1, 0, 0, 1, 1,
0.9825663, -1.437669, 0.4339677, 1, 0, 0, 1, 1,
0.9854251, -1.321423, 2.593636, 1, 0, 0, 1, 1,
0.9863662, 0.4651538, 3.073368, 1, 0, 0, 1, 1,
0.9888985, 0.2675507, 0.8180339, 0, 0, 0, 1, 1,
0.990486, 1.143243, -0.8339176, 0, 0, 0, 1, 1,
0.9930995, 0.7291221, 1.810537, 0, 0, 0, 1, 1,
0.9935329, 1.526809, 1.369642, 0, 0, 0, 1, 1,
0.9967943, -1.89192, 2.970163, 0, 0, 0, 1, 1,
1.001285, 0.3111998, 0.6472825, 0, 0, 0, 1, 1,
1.007793, 1.35099, 0.1796087, 0, 0, 0, 1, 1,
1.008223, -0.2778875, 3.527414, 1, 1, 1, 1, 1,
1.01301, -1.622372, 3.635659, 1, 1, 1, 1, 1,
1.013212, -1.685035, 2.613569, 1, 1, 1, 1, 1,
1.022958, -0.1700318, 2.53833, 1, 1, 1, 1, 1,
1.024879, 1.089586, 0.6519859, 1, 1, 1, 1, 1,
1.027136, -0.4538232, 2.536246, 1, 1, 1, 1, 1,
1.02863, 0.3878717, 1.837001, 1, 1, 1, 1, 1,
1.029301, -0.3626813, 1.624498, 1, 1, 1, 1, 1,
1.034781, -1.678782, 2.80617, 1, 1, 1, 1, 1,
1.042675, -0.6070613, 1.705277, 1, 1, 1, 1, 1,
1.044966, 0.1448625, 0.2848282, 1, 1, 1, 1, 1,
1.046324, 0.7720723, 0.4393068, 1, 1, 1, 1, 1,
1.046695, -0.3706546, 2.112977, 1, 1, 1, 1, 1,
1.053437, 1.343634, -0.1246277, 1, 1, 1, 1, 1,
1.055492, -0.03520307, -0.06407482, 1, 1, 1, 1, 1,
1.057055, -0.5882142, 1.763954, 0, 0, 1, 1, 1,
1.064657, -1.182546, 1.857033, 1, 0, 0, 1, 1,
1.064889, -0.7787657, 3.800429, 1, 0, 0, 1, 1,
1.070593, -1.471524, 1.310824, 1, 0, 0, 1, 1,
1.071764, 0.4836932, 1.606245, 1, 0, 0, 1, 1,
1.080352, 1.112993, 1.850592, 1, 0, 0, 1, 1,
1.086002, 0.9972658, 0.270695, 0, 0, 0, 1, 1,
1.091284, 1.361758, 0.4945051, 0, 0, 0, 1, 1,
1.091323, 1.335712, 0.4291538, 0, 0, 0, 1, 1,
1.09161, -1.647593, 3.432129, 0, 0, 0, 1, 1,
1.092672, 1.185648, 0.5297108, 0, 0, 0, 1, 1,
1.093681, 2.144913, -1.095985, 0, 0, 0, 1, 1,
1.095462, -1.160782, 0.9236262, 0, 0, 0, 1, 1,
1.099296, -1.543321, 3.271591, 1, 1, 1, 1, 1,
1.102555, 1.221529, 2.951569, 1, 1, 1, 1, 1,
1.107625, 0.7208173, 0.7753856, 1, 1, 1, 1, 1,
1.111126, -0.1587536, 2.170343, 1, 1, 1, 1, 1,
1.11826, 1.021886, 0.06967106, 1, 1, 1, 1, 1,
1.127646, 1.349152, 1.146903, 1, 1, 1, 1, 1,
1.129737, 1.106878, 1.852224, 1, 1, 1, 1, 1,
1.133681, 0.8680661, 0.700536, 1, 1, 1, 1, 1,
1.1419, -0.2654101, 2.999007, 1, 1, 1, 1, 1,
1.142615, -2.024976, 1.373862, 1, 1, 1, 1, 1,
1.151367, -0.6951966, 3.065362, 1, 1, 1, 1, 1,
1.151783, -0.4056956, 3.880449, 1, 1, 1, 1, 1,
1.153208, -0.6235012, 1.455401, 1, 1, 1, 1, 1,
1.155515, -0.1495851, 1.902045, 1, 1, 1, 1, 1,
1.157912, -1.950329, 2.147784, 1, 1, 1, 1, 1,
1.158792, -1.27032, 1.989573, 0, 0, 1, 1, 1,
1.162594, -0.450172, 2.346183, 1, 0, 0, 1, 1,
1.163234, -0.8137855, 2.300779, 1, 0, 0, 1, 1,
1.163565, -0.3468581, 1.409571, 1, 0, 0, 1, 1,
1.164514, 1.075288, 2.170626, 1, 0, 0, 1, 1,
1.173405, -0.0830835, 2.568678, 1, 0, 0, 1, 1,
1.175848, 0.3188297, 1.53123, 0, 0, 0, 1, 1,
1.18288, -0.1627253, 1.526636, 0, 0, 0, 1, 1,
1.191028, 0.9948788, 1.199018, 0, 0, 0, 1, 1,
1.203245, 0.5837198, 1.552105, 0, 0, 0, 1, 1,
1.206543, 1.019226, 0.7714033, 0, 0, 0, 1, 1,
1.21206, -1.264581, 1.762206, 0, 0, 0, 1, 1,
1.212362, -0.2040316, 2.012158, 0, 0, 0, 1, 1,
1.214531, 1.230626, 0.05754571, 1, 1, 1, 1, 1,
1.219321, -0.7411823, 0.8410098, 1, 1, 1, 1, 1,
1.22859, 1.339261, 1.07117, 1, 1, 1, 1, 1,
1.232121, -0.5835025, 2.429714, 1, 1, 1, 1, 1,
1.235939, -1.229149, 1.999608, 1, 1, 1, 1, 1,
1.245118, 0.6379823, 0.9496043, 1, 1, 1, 1, 1,
1.255186, -0.1790767, 2.155031, 1, 1, 1, 1, 1,
1.260235, -0.09703314, -0.2034646, 1, 1, 1, 1, 1,
1.270354, 0.8880248, 0.9848098, 1, 1, 1, 1, 1,
1.279277, -0.8970455, 3.612212, 1, 1, 1, 1, 1,
1.283472, -0.9104316, 2.081809, 1, 1, 1, 1, 1,
1.292956, -0.823101, 3.088617, 1, 1, 1, 1, 1,
1.307564, -1.255452, 4.282728, 1, 1, 1, 1, 1,
1.308995, 0.06471346, 1.46928, 1, 1, 1, 1, 1,
1.317319, -0.5014455, 2.23689, 1, 1, 1, 1, 1,
1.32522, 0.2188377, 2.03248, 0, 0, 1, 1, 1,
1.325624, -0.2568617, 3.759603, 1, 0, 0, 1, 1,
1.329931, -0.6642541, 1.425841, 1, 0, 0, 1, 1,
1.342472, -1.246608, 1.685631, 1, 0, 0, 1, 1,
1.349574, 0.57621, 0.8630608, 1, 0, 0, 1, 1,
1.352343, 1.796981, 2.460661, 1, 0, 0, 1, 1,
1.352894, -0.2868229, 2.117533, 0, 0, 0, 1, 1,
1.353464, 0.1472255, 1.199525, 0, 0, 0, 1, 1,
1.354487, 0.6535788, 2.253736, 0, 0, 0, 1, 1,
1.358623, 0.05365809, 2.711387, 0, 0, 0, 1, 1,
1.362652, -2.528595, 2.925969, 0, 0, 0, 1, 1,
1.37616, -0.524615, 2.412352, 0, 0, 0, 1, 1,
1.37894, 0.3429558, 1.108658, 0, 0, 0, 1, 1,
1.385153, 1.149146, -0.1702709, 1, 1, 1, 1, 1,
1.386566, 1.724947, 0.7207957, 1, 1, 1, 1, 1,
1.387504, -0.3866886, 1.565647, 1, 1, 1, 1, 1,
1.392839, -0.2853997, 1.575199, 1, 1, 1, 1, 1,
1.392866, -0.2299024, -0.02190449, 1, 1, 1, 1, 1,
1.399909, 0.2354381, 3.653621, 1, 1, 1, 1, 1,
1.407408, -0.1890811, 1.444389, 1, 1, 1, 1, 1,
1.415604, 0.08965489, 0.1606594, 1, 1, 1, 1, 1,
1.435012, -0.03004336, 0.5455742, 1, 1, 1, 1, 1,
1.448244, -0.8177213, 1.63442, 1, 1, 1, 1, 1,
1.450389, 0.3814801, 1.001522, 1, 1, 1, 1, 1,
1.460629, -0.6227586, 2.871344, 1, 1, 1, 1, 1,
1.466668, -1.47019, 1.94607, 1, 1, 1, 1, 1,
1.512433, 0.8223991, 0.4067244, 1, 1, 1, 1, 1,
1.521113, 0.07428063, 0.1221468, 1, 1, 1, 1, 1,
1.5429, 1.207579, 1.019297, 0, 0, 1, 1, 1,
1.547681, 1.714536, 0.3682495, 1, 0, 0, 1, 1,
1.55741, -0.9177132, 1.102238, 1, 0, 0, 1, 1,
1.564571, -1.583852, 3.993764, 1, 0, 0, 1, 1,
1.581926, 1.184678, 0.1144177, 1, 0, 0, 1, 1,
1.585018, -0.7640988, 3.172155, 1, 0, 0, 1, 1,
1.590511, -0.1339073, 1.196216, 0, 0, 0, 1, 1,
1.604653, -0.7161512, 1.286731, 0, 0, 0, 1, 1,
1.61064, 0.4073158, 1.949829, 0, 0, 0, 1, 1,
1.616871, 0.003635381, 2.073089, 0, 0, 0, 1, 1,
1.61728, 0.3692415, 1.654476, 0, 0, 0, 1, 1,
1.629796, -0.7823209, 2.47161, 0, 0, 0, 1, 1,
1.637431, 0.8871616, 1.110402, 0, 0, 0, 1, 1,
1.641096, 0.8981302, 1.083777, 1, 1, 1, 1, 1,
1.65374, 0.2983927, 0.9000173, 1, 1, 1, 1, 1,
1.655532, -0.2526208, 1.819371, 1, 1, 1, 1, 1,
1.664971, -1.130096, 1.904695, 1, 1, 1, 1, 1,
1.667681, 0.3403417, 0.3719626, 1, 1, 1, 1, 1,
1.668333, -0.2936988, 0.5927969, 1, 1, 1, 1, 1,
1.670263, 0.07172185, 0.2333682, 1, 1, 1, 1, 1,
1.672638, 0.6976802, 0.5104506, 1, 1, 1, 1, 1,
1.678587, -1.642598, 2.808697, 1, 1, 1, 1, 1,
1.679501, -0.1202242, 3.255388, 1, 1, 1, 1, 1,
1.703831, 0.6525419, 1.003156, 1, 1, 1, 1, 1,
1.704154, -0.2945003, 2.230608, 1, 1, 1, 1, 1,
1.710039, -0.5396222, 0.7625409, 1, 1, 1, 1, 1,
1.71924, -0.8800831, 1.763711, 1, 1, 1, 1, 1,
1.745209, -0.08082587, 1.193287, 1, 1, 1, 1, 1,
1.746006, -0.227732, 0.5687697, 0, 0, 1, 1, 1,
1.764634, -1.417261, 2.547137, 1, 0, 0, 1, 1,
1.783668, 0.1641176, 0.8058344, 1, 0, 0, 1, 1,
1.78646, -0.9184713, 2.201542, 1, 0, 0, 1, 1,
1.793727, 1.105721, 1.123645, 1, 0, 0, 1, 1,
1.80367, -0.234731, 0.02574338, 1, 0, 0, 1, 1,
1.806027, 0.2374256, 2.708189, 0, 0, 0, 1, 1,
1.806053, 0.5810041, 1.046721, 0, 0, 0, 1, 1,
1.809651, -2.372892, 1.900234, 0, 0, 0, 1, 1,
1.847074, -0.0545566, 3.072591, 0, 0, 0, 1, 1,
1.875315, -1.992427, 1.965702, 0, 0, 0, 1, 1,
1.876814, 1.246477, 1.867503, 0, 0, 0, 1, 1,
1.878533, -0.4387049, 2.601144, 0, 0, 0, 1, 1,
1.88637, 0.4971086, 1.730215, 1, 1, 1, 1, 1,
1.890369, 0.1135549, 0.9566243, 1, 1, 1, 1, 1,
1.92559, -0.5295377, 1.73035, 1, 1, 1, 1, 1,
1.987662, 0.003678451, 0.416988, 1, 1, 1, 1, 1,
2.032135, 2.580618, -0.5981199, 1, 1, 1, 1, 1,
2.034, 0.7391607, 0.4160122, 1, 1, 1, 1, 1,
2.03435, 1.056833, 1.259759, 1, 1, 1, 1, 1,
2.053278, 0.7536747, 2.088889, 1, 1, 1, 1, 1,
2.077491, -0.272633, 4.212335, 1, 1, 1, 1, 1,
2.119776, -1.180961, 0.6973785, 1, 1, 1, 1, 1,
2.127017, -0.524102, 1.02908, 1, 1, 1, 1, 1,
2.147131, -0.3467588, 2.048435, 1, 1, 1, 1, 1,
2.168392, 1.541997, -0.1723825, 1, 1, 1, 1, 1,
2.210628, -1.243688, 3.799775, 1, 1, 1, 1, 1,
2.231135, 1.455456, 1.438425, 1, 1, 1, 1, 1,
2.283456, -1.449543, 1.984998, 0, 0, 1, 1, 1,
2.29458, 0.1100874, 0.5048662, 1, 0, 0, 1, 1,
2.297788, -0.4442439, 1.875608, 1, 0, 0, 1, 1,
2.356932, -0.08399434, 2.842553, 1, 0, 0, 1, 1,
2.375232, 0.3996454, 0.6007828, 1, 0, 0, 1, 1,
2.378397, 1.570334, 0.6029749, 1, 0, 0, 1, 1,
2.432124, -0.4286959, 3.056795, 0, 0, 0, 1, 1,
2.475245, -1.002013, 2.300836, 0, 0, 0, 1, 1,
2.516294, -0.59278, 0.7077065, 0, 0, 0, 1, 1,
2.517788, 0.3444698, 1.339918, 0, 0, 0, 1, 1,
2.536204, 0.1458291, 0.6292896, 0, 0, 0, 1, 1,
2.53962, -0.2369202, 2.001536, 0, 0, 0, 1, 1,
2.541483, 0.04933036, 0.8414909, 0, 0, 0, 1, 1,
2.645401, 1.610207, 1.233013, 1, 1, 1, 1, 1,
2.708989, -1.604678, 0.8563629, 1, 1, 1, 1, 1,
2.765599, 1.575605, 1.464084, 1, 1, 1, 1, 1,
2.808152, 0.4171318, 0.9046737, 1, 1, 1, 1, 1,
2.883694, -1.244549, 3.769521, 1, 1, 1, 1, 1,
3.076349, -1.636789, 1.961659, 1, 1, 1, 1, 1,
3.093629, 1.890133, 0.552267, 1, 1, 1, 1, 1
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
var radius = 9.707677;
var distance = 34.09781;
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
mvMatrix.translate( 0.01614833, 0.08862495, 0.5105689 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09781);
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
