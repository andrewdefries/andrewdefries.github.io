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
-3.060458, 0.2149127, -2.635517, 1, 0, 0, 1,
-2.988225, -0.05943909, -3.063629, 1, 0.007843138, 0, 1,
-2.464638, 0.4174904, -1.375893, 1, 0.01176471, 0, 1,
-2.405959, -1.142402, -3.164767, 1, 0.01960784, 0, 1,
-2.399562, -0.375595, -2.048877, 1, 0.02352941, 0, 1,
-2.373696, -0.8037855, -1.659719, 1, 0.03137255, 0, 1,
-2.367661, 0.4512544, -2.504169, 1, 0.03529412, 0, 1,
-2.330217, -0.8447689, -2.581526, 1, 0.04313726, 0, 1,
-2.284063, -1.038955, -1.358743, 1, 0.04705882, 0, 1,
-2.235205, 0.250674, 0.1537675, 1, 0.05490196, 0, 1,
-2.220328, 0.3672093, -2.889149, 1, 0.05882353, 0, 1,
-2.214368, -0.4717542, -2.152003, 1, 0.06666667, 0, 1,
-2.205237, 2.770933, -0.8171584, 1, 0.07058824, 0, 1,
-2.199827, 0.8688206, -1.741243, 1, 0.07843138, 0, 1,
-2.147489, 1.325104, -1.368145, 1, 0.08235294, 0, 1,
-2.129619, 0.6912133, -1.018027, 1, 0.09019608, 0, 1,
-2.11446, 0.4085366, -0.730276, 1, 0.09411765, 0, 1,
-2.074694, -0.1702599, -0.4541644, 1, 0.1019608, 0, 1,
-2.051997, 1.06047, -1.275905, 1, 0.1098039, 0, 1,
-2.014335, 0.9659578, 0.04213476, 1, 0.1137255, 0, 1,
-2.00893, 0.8726094, 0.122441, 1, 0.1215686, 0, 1,
-2.008017, -0.4737173, -2.336755, 1, 0.1254902, 0, 1,
-1.996181, 1.729474, 0.5868317, 1, 0.1333333, 0, 1,
-1.982189, 1.670882, -0.3650364, 1, 0.1372549, 0, 1,
-1.956596, -0.9577682, -3.374733, 1, 0.145098, 0, 1,
-1.933, 1.832262, 0.271307, 1, 0.1490196, 0, 1,
-1.926993, -1.82204, -1.483731, 1, 0.1568628, 0, 1,
-1.924299, -0.3721937, -1.785466, 1, 0.1607843, 0, 1,
-1.887883, -1.109251, -2.147712, 1, 0.1686275, 0, 1,
-1.834018, 0.09615885, -1.499566, 1, 0.172549, 0, 1,
-1.825041, 0.5225371, -1.277053, 1, 0.1803922, 0, 1,
-1.790986, 0.5045452, -0.4380218, 1, 0.1843137, 0, 1,
-1.790084, -1.502979, -2.260183, 1, 0.1921569, 0, 1,
-1.78939, -0.6564012, -2.63125, 1, 0.1960784, 0, 1,
-1.785494, -0.6563733, -2.356142, 1, 0.2039216, 0, 1,
-1.782307, -1.241533, -3.002137, 1, 0.2117647, 0, 1,
-1.76996, -1.478865, -0.8948587, 1, 0.2156863, 0, 1,
-1.766153, 0.06212765, -0.1128459, 1, 0.2235294, 0, 1,
-1.759336, 0.0971771, -2.617465, 1, 0.227451, 0, 1,
-1.749189, 1.020072, -1.005956, 1, 0.2352941, 0, 1,
-1.713187, 0.883354, -0.3888519, 1, 0.2392157, 0, 1,
-1.70836, -0.5117795, -1.327309, 1, 0.2470588, 0, 1,
-1.698988, -0.1787676, -1.995784, 1, 0.2509804, 0, 1,
-1.680432, -0.8283886, -2.587851, 1, 0.2588235, 0, 1,
-1.676887, 0.3354723, -2.095833, 1, 0.2627451, 0, 1,
-1.668167, 1.115737, -0.9549977, 1, 0.2705882, 0, 1,
-1.666283, -1.077485, -3.707633, 1, 0.2745098, 0, 1,
-1.664433, -0.170389, -0.5455624, 1, 0.282353, 0, 1,
-1.644641, -0.6770956, -1.545326, 1, 0.2862745, 0, 1,
-1.626093, -1.094289, -1.633287, 1, 0.2941177, 0, 1,
-1.623974, 0.7593667, 0.3672526, 1, 0.3019608, 0, 1,
-1.612495, -0.712866, -2.776404, 1, 0.3058824, 0, 1,
-1.609896, -0.1067666, -0.9920529, 1, 0.3137255, 0, 1,
-1.609634, -0.296245, 0.1181501, 1, 0.3176471, 0, 1,
-1.585069, 1.285432, -1.804199, 1, 0.3254902, 0, 1,
-1.579899, -0.7842124, -3.507231, 1, 0.3294118, 0, 1,
-1.573844, -1.472984, -1.760977, 1, 0.3372549, 0, 1,
-1.559072, 0.02490439, -0.8478407, 1, 0.3411765, 0, 1,
-1.538388, 0.1228387, -1.786617, 1, 0.3490196, 0, 1,
-1.538035, 0.8562487, -0.4894122, 1, 0.3529412, 0, 1,
-1.50824, -1.041101, -3.2477, 1, 0.3607843, 0, 1,
-1.501272, 2.216374, -1.077897, 1, 0.3647059, 0, 1,
-1.49725, 0.02495469, -1.515276, 1, 0.372549, 0, 1,
-1.490939, -0.4958122, 0.6082928, 1, 0.3764706, 0, 1,
-1.480559, 0.7696211, -2.138524, 1, 0.3843137, 0, 1,
-1.443894, -0.2013838, -0.1241756, 1, 0.3882353, 0, 1,
-1.436323, -0.1079945, 0.05398511, 1, 0.3960784, 0, 1,
-1.414301, 0.02778058, -1.377783, 1, 0.4039216, 0, 1,
-1.408438, -0.3447053, -3.16512, 1, 0.4078431, 0, 1,
-1.405968, -1.748788, -4.128569, 1, 0.4156863, 0, 1,
-1.39601, -0.02314433, -1.32507, 1, 0.4196078, 0, 1,
-1.394682, -0.3930927, -5.276798, 1, 0.427451, 0, 1,
-1.394073, -1.83527, -2.0106, 1, 0.4313726, 0, 1,
-1.39342, 0.9180226, 0.2435611, 1, 0.4392157, 0, 1,
-1.390646, -0.4857291, -0.1622013, 1, 0.4431373, 0, 1,
-1.388292, 1.433118, -2.048743, 1, 0.4509804, 0, 1,
-1.387928, 0.6266966, -2.259077, 1, 0.454902, 0, 1,
-1.378083, -0.01806299, -0.8584724, 1, 0.4627451, 0, 1,
-1.375981, 1.949054, -0.5205394, 1, 0.4666667, 0, 1,
-1.3684, 0.6977007, -1.415404, 1, 0.4745098, 0, 1,
-1.360829, -0.700083, -2.607116, 1, 0.4784314, 0, 1,
-1.359309, 1.172735, 1.557046, 1, 0.4862745, 0, 1,
-1.353897, 0.6559546, 0.2218555, 1, 0.4901961, 0, 1,
-1.350151, 0.8938192, -1.024333, 1, 0.4980392, 0, 1,
-1.348113, -0.5408775, -1.284455, 1, 0.5058824, 0, 1,
-1.344448, -1.726582, -2.510418, 1, 0.509804, 0, 1,
-1.343324, -0.1875184, 0.004361649, 1, 0.5176471, 0, 1,
-1.335082, 1.301431, -0.9339078, 1, 0.5215687, 0, 1,
-1.331551, 0.2783013, -2.27832, 1, 0.5294118, 0, 1,
-1.330047, -0.009851893, -0.4298664, 1, 0.5333334, 0, 1,
-1.325155, -1.171517, -2.138349, 1, 0.5411765, 0, 1,
-1.32041, 1.357948, -1.232341, 1, 0.5450981, 0, 1,
-1.307041, -0.9301202, -3.209582, 1, 0.5529412, 0, 1,
-1.306762, 0.9443374, -2.470444, 1, 0.5568628, 0, 1,
-1.306624, 1.046671, 0.8008808, 1, 0.5647059, 0, 1,
-1.299627, 0.2441572, -1.552187, 1, 0.5686275, 0, 1,
-1.293761, -0.02481344, -3.531251, 1, 0.5764706, 0, 1,
-1.283595, 1.483903, 0.4469201, 1, 0.5803922, 0, 1,
-1.269314, -1.10238, -1.562881, 1, 0.5882353, 0, 1,
-1.268133, -0.4569618, -1.192454, 1, 0.5921569, 0, 1,
-1.262951, -0.118996, -1.579325, 1, 0.6, 0, 1,
-1.260394, -1.36001, -1.126382, 1, 0.6078432, 0, 1,
-1.237802, -0.4742947, -1.330498, 1, 0.6117647, 0, 1,
-1.235671, -0.8226816, -3.037031, 1, 0.6196079, 0, 1,
-1.231008, 2.426981, -0.6189947, 1, 0.6235294, 0, 1,
-1.226663, 1.050366, -1.732396, 1, 0.6313726, 0, 1,
-1.218246, 0.3476802, -1.853003, 1, 0.6352941, 0, 1,
-1.214291, 1.589223, -0.9698552, 1, 0.6431373, 0, 1,
-1.209464, 1.704016, -1.035811, 1, 0.6470588, 0, 1,
-1.203619, 0.2742916, -0.9355615, 1, 0.654902, 0, 1,
-1.202932, 1.150581, -0.7710395, 1, 0.6588235, 0, 1,
-1.194311, -0.8410615, -2.652836, 1, 0.6666667, 0, 1,
-1.167368, 1.425, 0.6745703, 1, 0.6705883, 0, 1,
-1.158697, -1.029658, -3.232605, 1, 0.6784314, 0, 1,
-1.153935, -1.984572, -3.110406, 1, 0.682353, 0, 1,
-1.148997, -0.01203038, -1.749252, 1, 0.6901961, 0, 1,
-1.148365, -0.9032773, -1.439513, 1, 0.6941177, 0, 1,
-1.146341, -2.24841, -5.352033, 1, 0.7019608, 0, 1,
-1.139004, 0.7203389, -3.275943, 1, 0.7098039, 0, 1,
-1.138633, 1.609741, -0.4555638, 1, 0.7137255, 0, 1,
-1.136947, -0.8340213, -3.494862, 1, 0.7215686, 0, 1,
-1.126303, -0.3307894, -0.9193009, 1, 0.7254902, 0, 1,
-1.122951, -1.651839, -3.99627, 1, 0.7333333, 0, 1,
-1.122613, -0.770055, -1.811307, 1, 0.7372549, 0, 1,
-1.122054, 0.8766862, -0.2116699, 1, 0.7450981, 0, 1,
-1.117485, -0.2366042, -1.46778, 1, 0.7490196, 0, 1,
-1.110995, 0.6084201, -2.500092, 1, 0.7568628, 0, 1,
-1.101997, -0.2752024, -3.612541, 1, 0.7607843, 0, 1,
-1.101593, 0.4308312, -1.981854, 1, 0.7686275, 0, 1,
-1.097392, -0.9398541, -2.561043, 1, 0.772549, 0, 1,
-1.092373, 1.433684, -0.7583936, 1, 0.7803922, 0, 1,
-1.091164, 0.2433021, -1.361, 1, 0.7843137, 0, 1,
-1.087135, -0.2730004, -2.627793, 1, 0.7921569, 0, 1,
-1.086381, -1.978559, -5.042837, 1, 0.7960784, 0, 1,
-1.082681, 0.009999257, -1.366782, 1, 0.8039216, 0, 1,
-1.082407, -0.5435995, -1.073576, 1, 0.8117647, 0, 1,
-1.069752, -0.1769876, -1.264457, 1, 0.8156863, 0, 1,
-1.069079, 0.7605718, -2.077554, 1, 0.8235294, 0, 1,
-1.066576, -0.1469998, -1.856398, 1, 0.827451, 0, 1,
-1.048142, -0.357413, -1.877369, 1, 0.8352941, 0, 1,
-1.047442, 0.5623227, -0.6208404, 1, 0.8392157, 0, 1,
-1.042665, 1.138092, -0.3195804, 1, 0.8470588, 0, 1,
-1.041685, -0.10866, -2.761398, 1, 0.8509804, 0, 1,
-1.040859, -0.6068965, -2.324025, 1, 0.8588235, 0, 1,
-1.035459, -0.6676761, -0.8794192, 1, 0.8627451, 0, 1,
-1.025846, -0.5570744, -3.207176, 1, 0.8705882, 0, 1,
-1.024327, 0.4365035, 0.06998619, 1, 0.8745098, 0, 1,
-1.022339, -1.839612, -3.653445, 1, 0.8823529, 0, 1,
-1.018293, 0.2262834, -1.433097, 1, 0.8862745, 0, 1,
-1.017028, -0.5882788, -3.780775, 1, 0.8941177, 0, 1,
-1.016744, -0.9347271, -1.930007, 1, 0.8980392, 0, 1,
-1.015304, -0.3976994, -2.428275, 1, 0.9058824, 0, 1,
-1.004976, -1.523595, -3.611054, 1, 0.9137255, 0, 1,
-1.004394, 0.09394886, 1.233511, 1, 0.9176471, 0, 1,
-1.004192, -1.300673, -1.8365, 1, 0.9254902, 0, 1,
-0.9988331, -1.06495, -2.892987, 1, 0.9294118, 0, 1,
-0.9967545, 0.01317731, -0.6873611, 1, 0.9372549, 0, 1,
-0.9953593, -1.364267, -3.333161, 1, 0.9411765, 0, 1,
-0.994083, -1.072995, -1.356368, 1, 0.9490196, 0, 1,
-0.9919509, -0.1013477, -1.300871, 1, 0.9529412, 0, 1,
-0.9918039, -0.2653264, -1.935423, 1, 0.9607843, 0, 1,
-0.9827279, -0.8911293, -2.792908, 1, 0.9647059, 0, 1,
-0.9753909, 2.772485, 1.109586, 1, 0.972549, 0, 1,
-0.9628884, 0.1241709, -0.8881495, 1, 0.9764706, 0, 1,
-0.9623295, -0.4277383, -1.868784, 1, 0.9843137, 0, 1,
-0.9543492, 1.413781, -1.040674, 1, 0.9882353, 0, 1,
-0.9527892, 0.4725785, -1.212537, 1, 0.9960784, 0, 1,
-0.9482887, 1.601414, -1.856065, 0.9960784, 1, 0, 1,
-0.9467211, -0.5193143, -1.621388, 0.9921569, 1, 0, 1,
-0.9435519, 0.5363713, -2.857693, 0.9843137, 1, 0, 1,
-0.9431856, -0.6231321, -1.382626, 0.9803922, 1, 0, 1,
-0.9430654, 1.281408, 0.1005753, 0.972549, 1, 0, 1,
-0.93607, 1.651239, -0.1411954, 0.9686275, 1, 0, 1,
-0.9356762, -0.8728309, -1.720722, 0.9607843, 1, 0, 1,
-0.9324162, -1.210707, -2.481299, 0.9568627, 1, 0, 1,
-0.9314358, 1.884438, -0.1278654, 0.9490196, 1, 0, 1,
-0.9212161, -1.35433, -2.802782, 0.945098, 1, 0, 1,
-0.9179219, 0.9918649, -1.32647, 0.9372549, 1, 0, 1,
-0.9177448, -1.694358, -2.046863, 0.9333333, 1, 0, 1,
-0.9171852, 0.5498324, -1.096686, 0.9254902, 1, 0, 1,
-0.9119688, 0.987227, -0.3874897, 0.9215686, 1, 0, 1,
-0.9094831, -1.428573, -2.156972, 0.9137255, 1, 0, 1,
-0.9074969, 1.417285, 0.5163004, 0.9098039, 1, 0, 1,
-0.9047504, 0.366785, -1.191056, 0.9019608, 1, 0, 1,
-0.9045718, 0.303311, -2.831314, 0.8941177, 1, 0, 1,
-0.9023472, -0.1018171, -2.066911, 0.8901961, 1, 0, 1,
-0.8898419, 0.06034976, -1.912359, 0.8823529, 1, 0, 1,
-0.8886575, 0.7596648, -1.635028, 0.8784314, 1, 0, 1,
-0.8803642, 0.1337175, 0.2760521, 0.8705882, 1, 0, 1,
-0.8787462, 0.3830585, -0.6781499, 0.8666667, 1, 0, 1,
-0.8705291, 0.619611, -0.2199704, 0.8588235, 1, 0, 1,
-0.8691685, -0.668809, -1.300627, 0.854902, 1, 0, 1,
-0.8676195, 0.1629424, -1.526963, 0.8470588, 1, 0, 1,
-0.8665619, 0.6755177, -0.5707411, 0.8431373, 1, 0, 1,
-0.862734, -0.1312275, -1.171596, 0.8352941, 1, 0, 1,
-0.8595961, -1.890446, -1.430605, 0.8313726, 1, 0, 1,
-0.8507299, 0.1128324, -2.512384, 0.8235294, 1, 0, 1,
-0.8493564, -0.581352, -2.112061, 0.8196079, 1, 0, 1,
-0.8448219, 0.6022271, -2.150981, 0.8117647, 1, 0, 1,
-0.8415161, -0.5551977, -3.589521, 0.8078431, 1, 0, 1,
-0.8339434, -0.7486222, -0.5419639, 0.8, 1, 0, 1,
-0.8279104, 0.4040779, -1.856133, 0.7921569, 1, 0, 1,
-0.8190991, 0.6870435, -0.7778353, 0.7882353, 1, 0, 1,
-0.8176394, -0.3095724, -2.632409, 0.7803922, 1, 0, 1,
-0.8073536, -0.1985438, -0.66067, 0.7764706, 1, 0, 1,
-0.8060474, -0.06772024, -0.4003996, 0.7686275, 1, 0, 1,
-0.8012545, -0.5506173, -0.6207469, 0.7647059, 1, 0, 1,
-0.8006374, 1.247656, -1.198862, 0.7568628, 1, 0, 1,
-0.7961861, -0.2866073, -0.596398, 0.7529412, 1, 0, 1,
-0.7929559, 0.2213199, -0.5439587, 0.7450981, 1, 0, 1,
-0.7925728, -1.11387, -2.516662, 0.7411765, 1, 0, 1,
-0.7883697, -0.03854478, -2.71815, 0.7333333, 1, 0, 1,
-0.7867905, 2.004831, 0.09950195, 0.7294118, 1, 0, 1,
-0.7846808, 1.332272, -1.245131, 0.7215686, 1, 0, 1,
-0.7827262, -0.2223505, -2.426328, 0.7176471, 1, 0, 1,
-0.7813893, 0.1603616, -1.338942, 0.7098039, 1, 0, 1,
-0.7789274, -1.280472, -1.831761, 0.7058824, 1, 0, 1,
-0.7772673, 1.23989, 0.007466353, 0.6980392, 1, 0, 1,
-0.7757972, -0.3171093, -3.308179, 0.6901961, 1, 0, 1,
-0.7540612, -0.6320806, -1.596325, 0.6862745, 1, 0, 1,
-0.7538729, 0.3043859, -2.165308, 0.6784314, 1, 0, 1,
-0.747076, -1.012343, -3.283525, 0.6745098, 1, 0, 1,
-0.7433948, 0.1817089, -1.973486, 0.6666667, 1, 0, 1,
-0.7412583, 1.806328, -1.120764, 0.6627451, 1, 0, 1,
-0.7400859, -0.5327169, -2.383658, 0.654902, 1, 0, 1,
-0.7391452, -1.011218, -3.679051, 0.6509804, 1, 0, 1,
-0.738323, -0.382894, -3.225474, 0.6431373, 1, 0, 1,
-0.7373987, 0.6802846, -0.8369361, 0.6392157, 1, 0, 1,
-0.7360241, -0.5982489, -1.821694, 0.6313726, 1, 0, 1,
-0.7351326, -0.8310756, -0.4947313, 0.627451, 1, 0, 1,
-0.7348831, -0.2320681, -2.600964, 0.6196079, 1, 0, 1,
-0.7308627, 0.3950983, -2.058812, 0.6156863, 1, 0, 1,
-0.7259061, -1.103554, -1.283785, 0.6078432, 1, 0, 1,
-0.714397, 0.01563344, -1.639601, 0.6039216, 1, 0, 1,
-0.711013, 0.8162757, 0.9709388, 0.5960785, 1, 0, 1,
-0.7099668, 0.3654113, -1.872473, 0.5882353, 1, 0, 1,
-0.7063862, 2.290525, 0.6757507, 0.5843138, 1, 0, 1,
-0.7033866, 1.635517, 0.7757816, 0.5764706, 1, 0, 1,
-0.7033712, -1.186319, -2.339546, 0.572549, 1, 0, 1,
-0.6971821, 0.3953024, -1.633252, 0.5647059, 1, 0, 1,
-0.6943383, 1.250374, 1.407444, 0.5607843, 1, 0, 1,
-0.693767, -0.279589, -3.296628, 0.5529412, 1, 0, 1,
-0.6889983, 0.2694453, -1.679644, 0.5490196, 1, 0, 1,
-0.6871694, -0.1784174, -2.553259, 0.5411765, 1, 0, 1,
-0.6858509, -1.108778, -4.023985, 0.5372549, 1, 0, 1,
-0.6854379, 0.594555, -1.955845, 0.5294118, 1, 0, 1,
-0.683161, 1.088259, -1.680458, 0.5254902, 1, 0, 1,
-0.6808107, -1.182341, -2.425376, 0.5176471, 1, 0, 1,
-0.6783903, -0.7377123, -3.293108, 0.5137255, 1, 0, 1,
-0.6763284, -0.360924, -1.694603, 0.5058824, 1, 0, 1,
-0.6757253, 0.6812974, -0.6751914, 0.5019608, 1, 0, 1,
-0.6714922, -0.1944249, -2.289628, 0.4941176, 1, 0, 1,
-0.6695862, 1.09433, 0.694989, 0.4862745, 1, 0, 1,
-0.6695685, 0.5883719, -2.093398, 0.4823529, 1, 0, 1,
-0.6674242, -0.2242531, -1.845021, 0.4745098, 1, 0, 1,
-0.6628925, -1.239357, -3.780692, 0.4705882, 1, 0, 1,
-0.6598197, 1.491232, 0.4957608, 0.4627451, 1, 0, 1,
-0.6586462, -0.9338899, -0.6666163, 0.4588235, 1, 0, 1,
-0.6579638, 1.443245, -0.2646677, 0.4509804, 1, 0, 1,
-0.6567039, 0.01420449, -1.501107, 0.4470588, 1, 0, 1,
-0.6542023, -1.490482, -2.495585, 0.4392157, 1, 0, 1,
-0.65398, -0.5819705, -2.38449, 0.4352941, 1, 0, 1,
-0.653675, 0.350842, -1.918807, 0.427451, 1, 0, 1,
-0.6488367, 0.4220625, -1.394043, 0.4235294, 1, 0, 1,
-0.6415536, 1.346543, 0.9803339, 0.4156863, 1, 0, 1,
-0.6387601, 0.4001694, 0.09092427, 0.4117647, 1, 0, 1,
-0.635144, -1.229033, -3.145432, 0.4039216, 1, 0, 1,
-0.6332263, 0.5658799, -0.6320375, 0.3960784, 1, 0, 1,
-0.6320624, 1.594941, -0.1727887, 0.3921569, 1, 0, 1,
-0.624504, -0.912299, -2.803046, 0.3843137, 1, 0, 1,
-0.6234228, -0.9524136, -3.17923, 0.3803922, 1, 0, 1,
-0.6231679, 0.9460763, 0.2078387, 0.372549, 1, 0, 1,
-0.6209135, 0.2898691, -1.68955, 0.3686275, 1, 0, 1,
-0.6190498, -0.9605059, -2.941497, 0.3607843, 1, 0, 1,
-0.6148852, -0.03499173, -3.3208, 0.3568628, 1, 0, 1,
-0.614523, 0.1547441, -1.601389, 0.3490196, 1, 0, 1,
-0.6082522, -0.9532433, -0.883143, 0.345098, 1, 0, 1,
-0.6060436, 2.238245, 1.037369, 0.3372549, 1, 0, 1,
-0.604763, 0.487414, 0.02749223, 0.3333333, 1, 0, 1,
-0.5999757, -0.8504601, -3.002423, 0.3254902, 1, 0, 1,
-0.5983105, -1.693441, -2.80354, 0.3215686, 1, 0, 1,
-0.5977567, -0.7531237, -1.335817, 0.3137255, 1, 0, 1,
-0.5968465, 2.669473, -0.1808632, 0.3098039, 1, 0, 1,
-0.5930163, 0.282356, -0.4305731, 0.3019608, 1, 0, 1,
-0.5929931, -1.898089, -2.494129, 0.2941177, 1, 0, 1,
-0.5921257, -1.468307, -3.814791, 0.2901961, 1, 0, 1,
-0.5915493, -1.729158, -4.111709, 0.282353, 1, 0, 1,
-0.5886775, 1.011978, -1.232093, 0.2784314, 1, 0, 1,
-0.586457, 0.2681375, -1.021409, 0.2705882, 1, 0, 1,
-0.5853522, -0.4207424, -2.062461, 0.2666667, 1, 0, 1,
-0.5833419, -1.688553, -1.180876, 0.2588235, 1, 0, 1,
-0.5832607, 0.6570727, -0.3869614, 0.254902, 1, 0, 1,
-0.5781429, -1.410306, -2.939674, 0.2470588, 1, 0, 1,
-0.5747244, -0.8136071, -2.006672, 0.2431373, 1, 0, 1,
-0.5735146, -0.5560629, -2.220324, 0.2352941, 1, 0, 1,
-0.5734181, 0.07720268, -1.949293, 0.2313726, 1, 0, 1,
-0.573184, 1.89981, -1.202974, 0.2235294, 1, 0, 1,
-0.570025, 0.3781568, -0.9827632, 0.2196078, 1, 0, 1,
-0.5673336, 1.133823, -0.485483, 0.2117647, 1, 0, 1,
-0.5603102, -0.4893889, -2.509269, 0.2078431, 1, 0, 1,
-0.5562972, 1.585487, 0.002496614, 0.2, 1, 0, 1,
-0.5504741, -0.390002, -2.593089, 0.1921569, 1, 0, 1,
-0.5471036, -2.407189, -2.100234, 0.1882353, 1, 0, 1,
-0.5416692, -1.524896, -1.953899, 0.1803922, 1, 0, 1,
-0.5395001, -0.1367522, -0.2734671, 0.1764706, 1, 0, 1,
-0.5387517, -0.9974357, -2.686569, 0.1686275, 1, 0, 1,
-0.5359941, -0.5592583, -2.711028, 0.1647059, 1, 0, 1,
-0.5304385, -0.3671588, -1.050883, 0.1568628, 1, 0, 1,
-0.5263547, -0.3734517, -2.413925, 0.1529412, 1, 0, 1,
-0.5227311, -0.6205937, -2.405677, 0.145098, 1, 0, 1,
-0.517248, 1.228208, -1.209111, 0.1411765, 1, 0, 1,
-0.5171258, -0.203215, 0.6162069, 0.1333333, 1, 0, 1,
-0.5138123, -0.2322427, -2.553694, 0.1294118, 1, 0, 1,
-0.5089695, 1.636853, 1.15166, 0.1215686, 1, 0, 1,
-0.5080132, -0.531105, -4.491933, 0.1176471, 1, 0, 1,
-0.5048069, 1.449721, 1.247583, 0.1098039, 1, 0, 1,
-0.5029026, 0.8187153, -1.729875, 0.1058824, 1, 0, 1,
-0.4988132, 0.7026381, 1.118668, 0.09803922, 1, 0, 1,
-0.4975721, 1.043281, -1.430223, 0.09019608, 1, 0, 1,
-0.4938133, 0.7634121, -0.5853358, 0.08627451, 1, 0, 1,
-0.4933855, -0.2841978, -1.670849, 0.07843138, 1, 0, 1,
-0.4921297, 0.04622259, -0.9034092, 0.07450981, 1, 0, 1,
-0.4892744, 0.1509388, -1.209831, 0.06666667, 1, 0, 1,
-0.4863536, 0.1706515, -0.5517501, 0.0627451, 1, 0, 1,
-0.4855471, -1.212043, -3.087205, 0.05490196, 1, 0, 1,
-0.479905, 0.08705737, -1.396025, 0.05098039, 1, 0, 1,
-0.479463, -3.197312, -1.875553, 0.04313726, 1, 0, 1,
-0.4713762, 0.07154369, -2.165406, 0.03921569, 1, 0, 1,
-0.469118, 0.5879434, -0.9945949, 0.03137255, 1, 0, 1,
-0.4672983, -0.003613251, -0.9720578, 0.02745098, 1, 0, 1,
-0.4616851, 0.2678019, -2.313488, 0.01960784, 1, 0, 1,
-0.4599249, -1.65883, -3.588389, 0.01568628, 1, 0, 1,
-0.4594621, 0.9665757, 0.5914015, 0.007843138, 1, 0, 1,
-0.4579388, -0.009314541, -2.537287, 0.003921569, 1, 0, 1,
-0.4501457, -1.282275, -3.073251, 0, 1, 0.003921569, 1,
-0.448916, 1.614394, -0.06848118, 0, 1, 0.01176471, 1,
-0.4487019, 0.3932423, -1.476482, 0, 1, 0.01568628, 1,
-0.4435659, -0.2158648, -1.53044, 0, 1, 0.02352941, 1,
-0.4419116, -0.6954575, -2.07059, 0, 1, 0.02745098, 1,
-0.4400351, -0.03982823, -1.839205, 0, 1, 0.03529412, 1,
-0.4380092, 1.345339, 0.06052862, 0, 1, 0.03921569, 1,
-0.4347412, 0.1244803, -0.2736505, 0, 1, 0.04705882, 1,
-0.431918, 0.5557864, -0.8857831, 0, 1, 0.05098039, 1,
-0.4298881, -0.5410606, -1.336848, 0, 1, 0.05882353, 1,
-0.4295236, 0.008496943, -1.7178, 0, 1, 0.0627451, 1,
-0.4246185, 0.4118863, -0.3209024, 0, 1, 0.07058824, 1,
-0.4174743, 0.1605645, -1.405669, 0, 1, 0.07450981, 1,
-0.4149406, -0.309108, -2.75465, 0, 1, 0.08235294, 1,
-0.413474, -0.4810373, -2.144378, 0, 1, 0.08627451, 1,
-0.4131613, 1.143244, 0.7316893, 0, 1, 0.09411765, 1,
-0.4093463, -0.533058, -1.562443, 0, 1, 0.1019608, 1,
-0.4044308, -1.768334, -3.880035, 0, 1, 0.1058824, 1,
-0.4042632, 1.148331, -0.1704553, 0, 1, 0.1137255, 1,
-0.3883094, 0.2927653, -1.973774, 0, 1, 0.1176471, 1,
-0.3827476, -0.0563186, -4.344492, 0, 1, 0.1254902, 1,
-0.3820329, -1.55043, -2.738683, 0, 1, 0.1294118, 1,
-0.3814422, -0.5935563, -2.884143, 0, 1, 0.1372549, 1,
-0.3804717, -0.2484262, -2.884916, 0, 1, 0.1411765, 1,
-0.3779318, -0.3310988, -2.687975, 0, 1, 0.1490196, 1,
-0.3746096, 1.123666, -0.3393254, 0, 1, 0.1529412, 1,
-0.3714283, -0.5602294, -2.224863, 0, 1, 0.1607843, 1,
-0.3700474, -1.814466, -1.71572, 0, 1, 0.1647059, 1,
-0.3691122, -0.3939558, -2.242577, 0, 1, 0.172549, 1,
-0.3675307, 1.237785, -0.3175622, 0, 1, 0.1764706, 1,
-0.3624749, 0.2286725, -1.510757, 0, 1, 0.1843137, 1,
-0.3617475, -0.4432466, -2.7638, 0, 1, 0.1882353, 1,
-0.3614, 0.08132743, -2.363043, 0, 1, 0.1960784, 1,
-0.3575334, -0.3600408, -2.626747, 0, 1, 0.2039216, 1,
-0.3565387, -0.08589577, -2.164405, 0, 1, 0.2078431, 1,
-0.3431524, -1.238695, -2.952309, 0, 1, 0.2156863, 1,
-0.3414206, -1.893389, -1.094846, 0, 1, 0.2196078, 1,
-0.336099, 0.5766612, 0.2436652, 0, 1, 0.227451, 1,
-0.3349627, 0.1171482, -1.417122, 0, 1, 0.2313726, 1,
-0.3315364, 0.8581396, -1.137416, 0, 1, 0.2392157, 1,
-0.3311875, 0.374121, -2.564334, 0, 1, 0.2431373, 1,
-0.3259329, -0.7752322, -3.087963, 0, 1, 0.2509804, 1,
-0.3245783, -0.4621564, -2.712725, 0, 1, 0.254902, 1,
-0.3226694, 0.7441518, -0.1000591, 0, 1, 0.2627451, 1,
-0.3220734, 1.838047, -0.2199845, 0, 1, 0.2666667, 1,
-0.3209532, -0.2739021, -3.242683, 0, 1, 0.2745098, 1,
-0.316359, 0.6162826, -0.6456847, 0, 1, 0.2784314, 1,
-0.3134742, 0.1286545, -1.715536, 0, 1, 0.2862745, 1,
-0.3131326, -0.3145969, -1.204967, 0, 1, 0.2901961, 1,
-0.3126141, 0.7791496, 1.711731, 0, 1, 0.2980392, 1,
-0.3124489, -0.599637, -3.367185, 0, 1, 0.3058824, 1,
-0.3057235, -0.05893712, -1.19442, 0, 1, 0.3098039, 1,
-0.3057152, 0.3858311, -0.4701886, 0, 1, 0.3176471, 1,
-0.3025805, 0.2995078, -0.4129475, 0, 1, 0.3215686, 1,
-0.299214, -0.9789768, -1.617165, 0, 1, 0.3294118, 1,
-0.2941529, -0.424112, -4.129481, 0, 1, 0.3333333, 1,
-0.2939777, -1.212676, -2.449385, 0, 1, 0.3411765, 1,
-0.2931107, -0.2701024, -4.421199, 0, 1, 0.345098, 1,
-0.2929115, -1.367734, -3.026467, 0, 1, 0.3529412, 1,
-0.2927776, -0.6844931, -2.311212, 0, 1, 0.3568628, 1,
-0.2924798, -0.5413639, -3.40542, 0, 1, 0.3647059, 1,
-0.2875828, 0.109453, -1.081611, 0, 1, 0.3686275, 1,
-0.2844242, 0.1942385, -1.030367, 0, 1, 0.3764706, 1,
-0.283562, -1.286961, -3.496327, 0, 1, 0.3803922, 1,
-0.2823837, -2.785967, -2.812203, 0, 1, 0.3882353, 1,
-0.2788438, 0.8118536, 0.07476623, 0, 1, 0.3921569, 1,
-0.2712577, -0.8557962, -3.37191, 0, 1, 0.4, 1,
-0.2687988, -0.5693347, -3.625445, 0, 1, 0.4078431, 1,
-0.2680317, 0.938976, -0.5475019, 0, 1, 0.4117647, 1,
-0.2625538, 0.357533, -1.111996, 0, 1, 0.4196078, 1,
-0.2610647, -0.2541947, -0.8760551, 0, 1, 0.4235294, 1,
-0.2597348, 0.1707604, -1.386577, 0, 1, 0.4313726, 1,
-0.2574063, -0.6443875, -2.126316, 0, 1, 0.4352941, 1,
-0.2538165, 2.197035, -0.6016826, 0, 1, 0.4431373, 1,
-0.2513784, -0.3591252, -2.952125, 0, 1, 0.4470588, 1,
-0.2505747, 0.01646253, -1.449852, 0, 1, 0.454902, 1,
-0.2502791, -0.7284988, -2.130453, 0, 1, 0.4588235, 1,
-0.247917, 1.561241, 0.2430254, 0, 1, 0.4666667, 1,
-0.2474928, 0.4817755, -1.634852, 0, 1, 0.4705882, 1,
-0.2472427, 0.2680478, -0.668231, 0, 1, 0.4784314, 1,
-0.2442634, -0.05288234, -2.334116, 0, 1, 0.4823529, 1,
-0.2442057, 0.6590934, -2.003319, 0, 1, 0.4901961, 1,
-0.2437308, 1.115967, -0.9147304, 0, 1, 0.4941176, 1,
-0.2414742, 0.3686309, -0.03384555, 0, 1, 0.5019608, 1,
-0.2405991, -1.433609, -3.778152, 0, 1, 0.509804, 1,
-0.240233, -0.7795443, -3.028211, 0, 1, 0.5137255, 1,
-0.2397521, -1.589026, -3.311341, 0, 1, 0.5215687, 1,
-0.2395962, -0.4446577, -3.150823, 0, 1, 0.5254902, 1,
-0.2331708, -0.0263326, -0.1829226, 0, 1, 0.5333334, 1,
-0.2280409, -0.214193, -2.34207, 0, 1, 0.5372549, 1,
-0.225035, -2.078945, -2.543812, 0, 1, 0.5450981, 1,
-0.2246511, 1.037354, -0.6879455, 0, 1, 0.5490196, 1,
-0.2228504, 1.026848, -1.591927, 0, 1, 0.5568628, 1,
-0.220655, -0.8883621, -3.930297, 0, 1, 0.5607843, 1,
-0.2204757, -0.8121624, -2.648861, 0, 1, 0.5686275, 1,
-0.215652, 0.3736743, 0.7514554, 0, 1, 0.572549, 1,
-0.2150809, -0.3960686, -2.401931, 0, 1, 0.5803922, 1,
-0.2127286, -0.3160384, -2.5925, 0, 1, 0.5843138, 1,
-0.2121387, 1.591632, -0.7403986, 0, 1, 0.5921569, 1,
-0.2102901, -1.168348, -4.66368, 0, 1, 0.5960785, 1,
-0.2091736, -2.578532, -3.81282, 0, 1, 0.6039216, 1,
-0.2020877, 0.1458851, -1.73999, 0, 1, 0.6117647, 1,
-0.2015673, 0.05085042, -2.89853, 0, 1, 0.6156863, 1,
-0.1997632, 1.290568, 0.02121994, 0, 1, 0.6235294, 1,
-0.1990969, 1.62025, 0.1023935, 0, 1, 0.627451, 1,
-0.198892, -1.637807, -4.666754, 0, 1, 0.6352941, 1,
-0.1923631, 0.1700016, -0.1157319, 0, 1, 0.6392157, 1,
-0.1893208, -0.6182121, -1.395891, 0, 1, 0.6470588, 1,
-0.1874071, -0.3623855, -2.307345, 0, 1, 0.6509804, 1,
-0.1858829, -1.031233, -4.041911, 0, 1, 0.6588235, 1,
-0.1847627, -0.9697057, -3.300578, 0, 1, 0.6627451, 1,
-0.1837455, 0.05843409, -1.497032, 0, 1, 0.6705883, 1,
-0.1829102, 0.547999, 0.330464, 0, 1, 0.6745098, 1,
-0.1773017, 0.6922306, -0.2889313, 0, 1, 0.682353, 1,
-0.1689552, 0.2580526, -0.9792539, 0, 1, 0.6862745, 1,
-0.1678396, 0.008757094, -0.9825866, 0, 1, 0.6941177, 1,
-0.1641242, -1.879828, -3.833401, 0, 1, 0.7019608, 1,
-0.1640473, 0.1362735, -2.665444, 0, 1, 0.7058824, 1,
-0.1639366, -0.08926929, -0.971131, 0, 1, 0.7137255, 1,
-0.160097, -0.2500052, -3.882258, 0, 1, 0.7176471, 1,
-0.1579238, 0.315058, -2.028516, 0, 1, 0.7254902, 1,
-0.1570737, -0.04003697, -0.9678818, 0, 1, 0.7294118, 1,
-0.1541699, -0.7705523, -1.849528, 0, 1, 0.7372549, 1,
-0.1535795, -0.5094551, -1.158322, 0, 1, 0.7411765, 1,
-0.1524515, 0.786411, 0.9963849, 0, 1, 0.7490196, 1,
-0.1500844, -0.4602555, -2.876009, 0, 1, 0.7529412, 1,
-0.1499898, -0.3964761, -0.6778027, 0, 1, 0.7607843, 1,
-0.1488161, -0.2896691, -1.877084, 0, 1, 0.7647059, 1,
-0.1485854, 0.1272961, -2.147688, 0, 1, 0.772549, 1,
-0.147496, 0.1505861, -1.043842, 0, 1, 0.7764706, 1,
-0.1466442, 1.260348, 1.534795, 0, 1, 0.7843137, 1,
-0.1422281, 1.552448, 0.8461428, 0, 1, 0.7882353, 1,
-0.1410187, 2.465099, -1.23591, 0, 1, 0.7960784, 1,
-0.1400556, -1.207349, -1.745918, 0, 1, 0.8039216, 1,
-0.1390827, -0.9363645, -1.983589, 0, 1, 0.8078431, 1,
-0.1387497, -0.4338826, -3.501426, 0, 1, 0.8156863, 1,
-0.1381826, 0.9360795, -1.193719, 0, 1, 0.8196079, 1,
-0.1379134, -0.1517748, -1.961301, 0, 1, 0.827451, 1,
-0.1374374, -0.5264415, -3.201914, 0, 1, 0.8313726, 1,
-0.1356751, 0.2297454, -0.1222216, 0, 1, 0.8392157, 1,
-0.1353665, -0.6952264, -1.625645, 0, 1, 0.8431373, 1,
-0.1348463, -0.9042117, -3.319364, 0, 1, 0.8509804, 1,
-0.1348428, -0.5626706, -1.99558, 0, 1, 0.854902, 1,
-0.1283579, -0.6782495, -2.298898, 0, 1, 0.8627451, 1,
-0.1232795, -1.307077, -2.036678, 0, 1, 0.8666667, 1,
-0.1204692, -0.749733, -3.945559, 0, 1, 0.8745098, 1,
-0.1195244, 0.6663851, -0.2622952, 0, 1, 0.8784314, 1,
-0.1129531, 1.119412, -0.06020957, 0, 1, 0.8862745, 1,
-0.1102142, -0.1179675, -3.006068, 0, 1, 0.8901961, 1,
-0.1099718, -0.8826261, -2.005136, 0, 1, 0.8980392, 1,
-0.1096766, -0.4639278, -2.985194, 0, 1, 0.9058824, 1,
-0.1067058, 0.07405814, -1.572471, 0, 1, 0.9098039, 1,
-0.1022718, 0.6624317, 1.105946, 0, 1, 0.9176471, 1,
-0.100297, 1.218926, -1.371141, 0, 1, 0.9215686, 1,
-0.09979632, 1.347803, -1.112246, 0, 1, 0.9294118, 1,
-0.09724423, -1.576752, -2.758707, 0, 1, 0.9333333, 1,
-0.0964698, -0.8144897, -1.32047, 0, 1, 0.9411765, 1,
-0.09626833, 1.653659, -0.8231044, 0, 1, 0.945098, 1,
-0.09617481, -0.5353165, -3.412239, 0, 1, 0.9529412, 1,
-0.09406718, -0.4244293, -4.168784, 0, 1, 0.9568627, 1,
-0.09085725, -2.646518, -1.42381, 0, 1, 0.9647059, 1,
-0.08780367, 0.01159548, 0.0283133, 0, 1, 0.9686275, 1,
-0.08755546, -0.5913655, -2.399068, 0, 1, 0.9764706, 1,
-0.08521825, -0.1745915, -3.555506, 0, 1, 0.9803922, 1,
-0.08343115, 0.01353247, -2.167091, 0, 1, 0.9882353, 1,
-0.08235338, -1.180844, -2.111836, 0, 1, 0.9921569, 1,
-0.07920565, -1.104301, -3.493277, 0, 1, 1, 1,
-0.07709327, 0.2424289, -0.4231449, 0, 0.9921569, 1, 1,
-0.0746432, 0.977241, -0.4755567, 0, 0.9882353, 1, 1,
-0.07188504, -0.9918557, -5.19262, 0, 0.9803922, 1, 1,
-0.06343325, -0.4781343, -2.936045, 0, 0.9764706, 1, 1,
-0.06309506, -0.2750328, -3.151035, 0, 0.9686275, 1, 1,
-0.06219911, -0.1669101, -4.872222, 0, 0.9647059, 1, 1,
-0.05750106, 0.8576245, 0.2496933, 0, 0.9568627, 1, 1,
-0.05596473, -0.3267176, -2.336992, 0, 0.9529412, 1, 1,
-0.05344936, -0.5319936, -1.936807, 0, 0.945098, 1, 1,
-0.04822174, -0.07332509, -2.402104, 0, 0.9411765, 1, 1,
-0.04729376, -1.091532, -2.375993, 0, 0.9333333, 1, 1,
-0.04620514, -0.3132208, -2.696404, 0, 0.9294118, 1, 1,
-0.0455663, 1.762005, -0.5451946, 0, 0.9215686, 1, 1,
-0.04222153, -1.193229, -2.710463, 0, 0.9176471, 1, 1,
-0.03998623, 0.6768268, 1.326482, 0, 0.9098039, 1, 1,
-0.03351397, -0.1817724, -1.714462, 0, 0.9058824, 1, 1,
-0.03128423, -0.8262872, -4.054526, 0, 0.8980392, 1, 1,
-0.02735756, -1.158618, -2.303634, 0, 0.8901961, 1, 1,
-0.02685209, 0.4124728, -0.5080248, 0, 0.8862745, 1, 1,
-0.02615335, -1.003177, -2.936977, 0, 0.8784314, 1, 1,
-0.024941, -0.8509438, -3.872671, 0, 0.8745098, 1, 1,
-0.01677538, -0.9381531, -2.173828, 0, 0.8666667, 1, 1,
-0.01309321, -1.1995, -2.312579, 0, 0.8627451, 1, 1,
-0.005338996, 1.377236, -0.1313788, 0, 0.854902, 1, 1,
-0.001807649, -0.9393118, -2.613623, 0, 0.8509804, 1, 1,
0.003671496, 1.060779, 0.5300528, 0, 0.8431373, 1, 1,
0.007189183, -0.9772883, 3.997017, 0, 0.8392157, 1, 1,
0.01084979, 0.8451909, 1.683756, 0, 0.8313726, 1, 1,
0.01317521, -1.738933, 2.833819, 0, 0.827451, 1, 1,
0.01599641, -2.804113, 2.068825, 0, 0.8196079, 1, 1,
0.01926405, -0.7692256, 2.302157, 0, 0.8156863, 1, 1,
0.01975011, 0.590313, 0.7799274, 0, 0.8078431, 1, 1,
0.01995824, 0.08603284, 1.158438, 0, 0.8039216, 1, 1,
0.02255108, -2.72706, 3.524117, 0, 0.7960784, 1, 1,
0.0260873, 1.312987, -0.8081715, 0, 0.7882353, 1, 1,
0.02772703, -0.5326491, 2.396849, 0, 0.7843137, 1, 1,
0.02803646, -0.6964182, 4.162009, 0, 0.7764706, 1, 1,
0.02884589, 1.948021, 2.277232, 0, 0.772549, 1, 1,
0.02929422, 2.118439, -0.3074423, 0, 0.7647059, 1, 1,
0.02969556, -1.261199, 3.520058, 0, 0.7607843, 1, 1,
0.03839071, -0.5663568, 2.956466, 0, 0.7529412, 1, 1,
0.04437007, 0.9993536, 0.2258113, 0, 0.7490196, 1, 1,
0.04447871, -0.6560265, 3.221055, 0, 0.7411765, 1, 1,
0.04680232, 0.9283664, -0.6740358, 0, 0.7372549, 1, 1,
0.05309469, -0.9804018, 3.534466, 0, 0.7294118, 1, 1,
0.05564019, 0.235147, 1.159459, 0, 0.7254902, 1, 1,
0.05743125, -0.1269819, 3.034212, 0, 0.7176471, 1, 1,
0.05788567, 0.5712765, -1.958004, 0, 0.7137255, 1, 1,
0.05794418, 0.6132724, -0.4111576, 0, 0.7058824, 1, 1,
0.0639765, -0.7413116, 4.031578, 0, 0.6980392, 1, 1,
0.07123855, 0.5375547, -1.012116, 0, 0.6941177, 1, 1,
0.0720352, -0.4860073, 3.146882, 0, 0.6862745, 1, 1,
0.07272148, 0.2946773, -0.1715849, 0, 0.682353, 1, 1,
0.07503899, 0.3645893, -0.175994, 0, 0.6745098, 1, 1,
0.07760784, 1.429019, -0.5713062, 0, 0.6705883, 1, 1,
0.07866468, 0.7088989, 0.3281676, 0, 0.6627451, 1, 1,
0.08034674, -1.046204, 1.073865, 0, 0.6588235, 1, 1,
0.08373933, -0.6184759, 3.740805, 0, 0.6509804, 1, 1,
0.08418927, -0.2497496, 1.708429, 0, 0.6470588, 1, 1,
0.08556268, -0.9295062, 3.249241, 0, 0.6392157, 1, 1,
0.08642861, -1.11735, 3.496488, 0, 0.6352941, 1, 1,
0.08737434, 0.3231025, -1.832813, 0, 0.627451, 1, 1,
0.08926161, -0.5547332, 1.830056, 0, 0.6235294, 1, 1,
0.09311415, 0.517894, 0.2450971, 0, 0.6156863, 1, 1,
0.1015693, 0.5599574, 0.5213283, 0, 0.6117647, 1, 1,
0.1049987, 1.010123, 0.7618595, 0, 0.6039216, 1, 1,
0.1139772, 0.03941945, 1.961974, 0, 0.5960785, 1, 1,
0.116453, 1.299881, 0.1646506, 0, 0.5921569, 1, 1,
0.1233008, 0.2070532, 0.4394963, 0, 0.5843138, 1, 1,
0.1306723, 0.1439835, 0.2725856, 0, 0.5803922, 1, 1,
0.1366831, -0.9479954, 2.279751, 0, 0.572549, 1, 1,
0.1437867, 1.072325, -0.3969944, 0, 0.5686275, 1, 1,
0.1453989, 1.962434, -0.1137151, 0, 0.5607843, 1, 1,
0.1472653, -0.1473746, 2.247047, 0, 0.5568628, 1, 1,
0.1517174, 0.1525498, -0.7166988, 0, 0.5490196, 1, 1,
0.1523081, -0.02021548, 2.311954, 0, 0.5450981, 1, 1,
0.1567296, -1.560418, 4.170517, 0, 0.5372549, 1, 1,
0.1597301, 1.463797, 0.1344811, 0, 0.5333334, 1, 1,
0.1624991, 1.41982, 0.6531249, 0, 0.5254902, 1, 1,
0.1630241, 1.347371, -0.9842871, 0, 0.5215687, 1, 1,
0.1631646, -0.5282007, 3.920776, 0, 0.5137255, 1, 1,
0.16361, 2.369911, 0.4135411, 0, 0.509804, 1, 1,
0.1641347, 0.6425494, 1.494937, 0, 0.5019608, 1, 1,
0.1652862, 1.704632, 0.3588861, 0, 0.4941176, 1, 1,
0.1658229, -0.7485244, 1.564792, 0, 0.4901961, 1, 1,
0.1665705, -1.046434, 0.4769113, 0, 0.4823529, 1, 1,
0.1682473, 0.3261178, 2.129205, 0, 0.4784314, 1, 1,
0.1692368, 1.726873, -0.3787843, 0, 0.4705882, 1, 1,
0.1693681, 0.3367395, -0.1816198, 0, 0.4666667, 1, 1,
0.1724329, -0.1245512, 2.876709, 0, 0.4588235, 1, 1,
0.1790976, -1.316643, 4.467715, 0, 0.454902, 1, 1,
0.1802882, 0.1302847, 0.2091708, 0, 0.4470588, 1, 1,
0.1897869, -1.493398, 3.738847, 0, 0.4431373, 1, 1,
0.1910519, 1.10182, -0.2120769, 0, 0.4352941, 1, 1,
0.1952483, -1.140502, 5.560882, 0, 0.4313726, 1, 1,
0.2081908, 0.4587255, 0.6684105, 0, 0.4235294, 1, 1,
0.2087035, -0.2555798, 1.901253, 0, 0.4196078, 1, 1,
0.2135457, -0.6610817, 2.268295, 0, 0.4117647, 1, 1,
0.2153931, 0.9454567, 1.055224, 0, 0.4078431, 1, 1,
0.2156009, 0.09536204, 1.6319, 0, 0.4, 1, 1,
0.2178325, -0.7378461, 3.722107, 0, 0.3921569, 1, 1,
0.2211801, -1.23778, 3.803084, 0, 0.3882353, 1, 1,
0.2222363, -0.02731928, 1.555258, 0, 0.3803922, 1, 1,
0.2225071, 0.4700461, -0.3252469, 0, 0.3764706, 1, 1,
0.2254703, 0.9566802, -0.2713905, 0, 0.3686275, 1, 1,
0.226702, 2.113427, 0.6051063, 0, 0.3647059, 1, 1,
0.2338661, -0.7871748, 3.935698, 0, 0.3568628, 1, 1,
0.2367321, -0.2072292, 2.57042, 0, 0.3529412, 1, 1,
0.2367361, -0.1088236, 2.727305, 0, 0.345098, 1, 1,
0.2420402, -0.5008163, 2.608367, 0, 0.3411765, 1, 1,
0.2426297, -0.1877017, 2.145889, 0, 0.3333333, 1, 1,
0.2445336, 1.817694, -0.5437705, 0, 0.3294118, 1, 1,
0.245663, -0.6971587, 4.271438, 0, 0.3215686, 1, 1,
0.250427, -1.117285, 2.901705, 0, 0.3176471, 1, 1,
0.2517771, 0.7182816, 1.349212, 0, 0.3098039, 1, 1,
0.2529949, 0.3825619, -0.1712592, 0, 0.3058824, 1, 1,
0.2535406, 1.494566, 2.578353, 0, 0.2980392, 1, 1,
0.2548129, -0.06999017, 1.243267, 0, 0.2901961, 1, 1,
0.2552642, -0.2661065, 2.640369, 0, 0.2862745, 1, 1,
0.2555363, 1.067955, -0.6676858, 0, 0.2784314, 1, 1,
0.2564961, 0.08082345, 3.105259, 0, 0.2745098, 1, 1,
0.2608129, 0.5299854, 1.439114, 0, 0.2666667, 1, 1,
0.2610129, -0.4575583, 3.016451, 0, 0.2627451, 1, 1,
0.2610138, 1.853505, -1.693354, 0, 0.254902, 1, 1,
0.2617528, -0.1619889, 1.730966, 0, 0.2509804, 1, 1,
0.2662832, -0.7299577, 4.882965, 0, 0.2431373, 1, 1,
0.2664876, 0.5898552, 2.821187, 0, 0.2392157, 1, 1,
0.2673618, -0.698678, 3.674463, 0, 0.2313726, 1, 1,
0.2707211, 0.7277758, 0.5983914, 0, 0.227451, 1, 1,
0.272907, 1.360623, 0.7633228, 0, 0.2196078, 1, 1,
0.2742124, 1.763294, 0.8146649, 0, 0.2156863, 1, 1,
0.2756563, -0.7662168, 3.528073, 0, 0.2078431, 1, 1,
0.2760243, -0.0173275, 1.347582, 0, 0.2039216, 1, 1,
0.2784401, 1.236901, 1.00857, 0, 0.1960784, 1, 1,
0.2803936, -0.07856729, 4.303956, 0, 0.1882353, 1, 1,
0.2804823, 0.7993842, 0.894146, 0, 0.1843137, 1, 1,
0.2817448, 0.1370253, 2.289033, 0, 0.1764706, 1, 1,
0.2817764, 1.188166, -2.405208, 0, 0.172549, 1, 1,
0.2824604, 1.077741, 0.7586025, 0, 0.1647059, 1, 1,
0.2888246, 0.2726014, 1.036963, 0, 0.1607843, 1, 1,
0.291455, 1.048553, 1.597149, 0, 0.1529412, 1, 1,
0.2925672, -0.9838964, 4.447528, 0, 0.1490196, 1, 1,
0.2949766, -0.8242814, 1.922683, 0, 0.1411765, 1, 1,
0.2976359, -1.081542, 4.70771, 0, 0.1372549, 1, 1,
0.2999396, 0.07986035, 0.4867619, 0, 0.1294118, 1, 1,
0.3041772, 2.995994, -0.05465313, 0, 0.1254902, 1, 1,
0.3163163, 1.446017, 1.607473, 0, 0.1176471, 1, 1,
0.317087, 0.698567, 0.9817165, 0, 0.1137255, 1, 1,
0.3230966, 2.998253, 0.3685687, 0, 0.1058824, 1, 1,
0.3252952, -0.6163721, 2.847694, 0, 0.09803922, 1, 1,
0.3283877, 0.5549668, -0.3164506, 0, 0.09411765, 1, 1,
0.3307841, 0.6309208, -0.7686867, 0, 0.08627451, 1, 1,
0.3371738, 0.4693876, -0.8184446, 0, 0.08235294, 1, 1,
0.3377717, -1.072687, 3.211336, 0, 0.07450981, 1, 1,
0.3388778, 1.198936, 0.2528336, 0, 0.07058824, 1, 1,
0.3431991, 2.366568, 0.6412396, 0, 0.0627451, 1, 1,
0.345042, -0.252264, 3.3188, 0, 0.05882353, 1, 1,
0.3546304, 1.301477, 0.5760219, 0, 0.05098039, 1, 1,
0.3553011, -0.05362378, 2.729964, 0, 0.04705882, 1, 1,
0.3593247, 1.415034, 1.082276, 0, 0.03921569, 1, 1,
0.3594614, 1.451837, 0.4306708, 0, 0.03529412, 1, 1,
0.3612637, 0.3527901, 0.9333268, 0, 0.02745098, 1, 1,
0.3633368, -0.01465269, 1.063913, 0, 0.02352941, 1, 1,
0.3655537, 1.838619, -1.23205, 0, 0.01568628, 1, 1,
0.3700637, -1.507015, 3.166867, 0, 0.01176471, 1, 1,
0.3738208, 0.1377276, 1.51345, 0, 0.003921569, 1, 1,
0.3773378, 0.3571516, 0.5972281, 0.003921569, 0, 1, 1,
0.3787329, 2.651158, 0.5092048, 0.007843138, 0, 1, 1,
0.3802364, 1.109873, -0.00794642, 0.01568628, 0, 1, 1,
0.3804829, -0.8424, 1.39365, 0.01960784, 0, 1, 1,
0.3853521, -1.172429, 3.092082, 0.02745098, 0, 1, 1,
0.3884355, -1.740474, 2.217919, 0.03137255, 0, 1, 1,
0.3958301, 3.03596, 0.3462689, 0.03921569, 0, 1, 1,
0.4017972, -0.8556235, 4.664748, 0.04313726, 0, 1, 1,
0.4099836, 0.1404897, 3.323302, 0.05098039, 0, 1, 1,
0.4102643, 1.915082, -0.2564794, 0.05490196, 0, 1, 1,
0.4125955, 1.65661, 0.7682059, 0.0627451, 0, 1, 1,
0.4134628, 1.050205, 0.3776827, 0.06666667, 0, 1, 1,
0.4151815, 0.6844066, -0.08501052, 0.07450981, 0, 1, 1,
0.4202666, -0.8663561, 1.630092, 0.07843138, 0, 1, 1,
0.4248903, -1.558139, 2.977726, 0.08627451, 0, 1, 1,
0.4272344, -0.9202495, 2.489893, 0.09019608, 0, 1, 1,
0.432797, 0.1541928, 0.2368732, 0.09803922, 0, 1, 1,
0.435069, 0.9983584, 2.061768, 0.1058824, 0, 1, 1,
0.4351251, 0.1227776, 0.2258425, 0.1098039, 0, 1, 1,
0.4419495, -0.3608913, 4.585873, 0.1176471, 0, 1, 1,
0.4429598, 1.453769, 0.5889304, 0.1215686, 0, 1, 1,
0.4466251, -0.2621036, 2.940589, 0.1294118, 0, 1, 1,
0.4482968, 0.8592923, 1.967307, 0.1333333, 0, 1, 1,
0.4501016, -0.1349777, 1.301974, 0.1411765, 0, 1, 1,
0.4537964, 1.10564, -0.9417226, 0.145098, 0, 1, 1,
0.460368, -0.07454345, 2.41542, 0.1529412, 0, 1, 1,
0.4643537, 0.1276667, 1.7355, 0.1568628, 0, 1, 1,
0.4651466, -0.1322335, 1.864387, 0.1647059, 0, 1, 1,
0.4684332, -0.1069467, 0.05981301, 0.1686275, 0, 1, 1,
0.4700036, 1.486832, 1.351969, 0.1764706, 0, 1, 1,
0.472356, -0.8595484, 4.143248, 0.1803922, 0, 1, 1,
0.4760561, -1.710277, 2.859433, 0.1882353, 0, 1, 1,
0.4782063, 0.5175281, 1.28886, 0.1921569, 0, 1, 1,
0.4790878, 1.247498, 0.7639655, 0.2, 0, 1, 1,
0.4835088, -2.336277, 1.599166, 0.2078431, 0, 1, 1,
0.4907721, -0.1112195, 1.406775, 0.2117647, 0, 1, 1,
0.4928409, 0.3830793, 0.3215941, 0.2196078, 0, 1, 1,
0.4940801, 1.180667, -0.2959701, 0.2235294, 0, 1, 1,
0.4982519, 2.182978, -0.06074517, 0.2313726, 0, 1, 1,
0.4993709, -0.5744679, 3.191516, 0.2352941, 0, 1, 1,
0.5013202, 1.197069, -0.6564946, 0.2431373, 0, 1, 1,
0.5018241, -1.316293, 4.429252, 0.2470588, 0, 1, 1,
0.5019065, 0.8720996, 0.5221571, 0.254902, 0, 1, 1,
0.5035937, 0.8003307, -0.8924292, 0.2588235, 0, 1, 1,
0.5057459, -1.212212, 3.635572, 0.2666667, 0, 1, 1,
0.5063388, -0.5718709, 1.688278, 0.2705882, 0, 1, 1,
0.5071763, -0.3024724, 1.15167, 0.2784314, 0, 1, 1,
0.5078388, -0.04678499, 2.545258, 0.282353, 0, 1, 1,
0.5094882, 0.765708, 0.1251624, 0.2901961, 0, 1, 1,
0.5129709, 0.2940911, 1.406476, 0.2941177, 0, 1, 1,
0.5169957, -0.5140219, 3.127988, 0.3019608, 0, 1, 1,
0.5202507, 0.7773758, 2.361208, 0.3098039, 0, 1, 1,
0.5227451, -0.7356213, 2.465512, 0.3137255, 0, 1, 1,
0.5287296, 0.07536906, 0.3170638, 0.3215686, 0, 1, 1,
0.5364539, -0.138085, 4.927519, 0.3254902, 0, 1, 1,
0.5368792, 0.06907637, 1.783444, 0.3333333, 0, 1, 1,
0.5426015, -1.110742, 2.157293, 0.3372549, 0, 1, 1,
0.5478045, 0.5640517, -0.6097282, 0.345098, 0, 1, 1,
0.5488645, 0.9549035, 1.364393, 0.3490196, 0, 1, 1,
0.5527145, 0.5114436, 0.8226777, 0.3568628, 0, 1, 1,
0.5529226, -0.4353753, 1.329365, 0.3607843, 0, 1, 1,
0.5573869, -0.5729876, 3.05763, 0.3686275, 0, 1, 1,
0.5579242, -0.2784569, 1.687134, 0.372549, 0, 1, 1,
0.5580462, 1.073277, -0.7279212, 0.3803922, 0, 1, 1,
0.5592764, 0.3014608, 1.526269, 0.3843137, 0, 1, 1,
0.5637958, -0.1050731, 2.057276, 0.3921569, 0, 1, 1,
0.5672764, -0.3787194, 0.841154, 0.3960784, 0, 1, 1,
0.5694804, -1.953448, 3.962291, 0.4039216, 0, 1, 1,
0.5697238, 0.8957297, -0.5028898, 0.4117647, 0, 1, 1,
0.5714334, -0.4638322, 2.793221, 0.4156863, 0, 1, 1,
0.5746337, -1.314284, 3.746645, 0.4235294, 0, 1, 1,
0.5810907, -0.5029644, 2.876174, 0.427451, 0, 1, 1,
0.5819193, 0.1879676, -1.189809, 0.4352941, 0, 1, 1,
0.5895615, -0.9242976, 0.82546, 0.4392157, 0, 1, 1,
0.5899982, 1.893218, 0.2378908, 0.4470588, 0, 1, 1,
0.5918021, -0.4328656, 3.488207, 0.4509804, 0, 1, 1,
0.5955513, -1.213083, 1.089859, 0.4588235, 0, 1, 1,
0.5956964, 1.09726, 1.535972, 0.4627451, 0, 1, 1,
0.6023491, -0.8384688, 1.026836, 0.4705882, 0, 1, 1,
0.609534, -0.5190076, 2.314498, 0.4745098, 0, 1, 1,
0.6099962, -0.9933369, 3.15339, 0.4823529, 0, 1, 1,
0.6171343, 0.04502087, 2.141725, 0.4862745, 0, 1, 1,
0.6212024, 0.4824713, 0.3617966, 0.4941176, 0, 1, 1,
0.6241155, -1.486054, 3.213065, 0.5019608, 0, 1, 1,
0.6279264, -1.193602, 2.756839, 0.5058824, 0, 1, 1,
0.6291032, -1.180987, 1.931756, 0.5137255, 0, 1, 1,
0.6297007, 1.59384, 0.2311456, 0.5176471, 0, 1, 1,
0.6389558, 0.03263685, 0.6213612, 0.5254902, 0, 1, 1,
0.6409166, -1.000553, 2.790575, 0.5294118, 0, 1, 1,
0.6426754, -0.4349095, 2.586074, 0.5372549, 0, 1, 1,
0.6458203, 0.5523753, 2.379417, 0.5411765, 0, 1, 1,
0.6501793, -1.446438, 2.767408, 0.5490196, 0, 1, 1,
0.6516171, 0.4296004, 2.114698, 0.5529412, 0, 1, 1,
0.6519985, -0.3600877, 2.539972, 0.5607843, 0, 1, 1,
0.6545362, -0.6695559, 0.8061358, 0.5647059, 0, 1, 1,
0.6569216, 0.2312372, -0.2440608, 0.572549, 0, 1, 1,
0.6606862, 2.678349, -0.6566455, 0.5764706, 0, 1, 1,
0.6615878, 0.3775538, 0.3873298, 0.5843138, 0, 1, 1,
0.662367, 1.077292, 1.426196, 0.5882353, 0, 1, 1,
0.6659822, 0.2345679, 2.448633, 0.5960785, 0, 1, 1,
0.6693256, -0.7595945, 2.548004, 0.6039216, 0, 1, 1,
0.6767487, 1.921091, 0.1517873, 0.6078432, 0, 1, 1,
0.6791736, 0.3016152, 0.6367048, 0.6156863, 0, 1, 1,
0.6843959, 0.3458674, 0.1943403, 0.6196079, 0, 1, 1,
0.6867124, 0.9623154, 0.7091607, 0.627451, 0, 1, 1,
0.6890311, -0.6240205, 1.590798, 0.6313726, 0, 1, 1,
0.6891076, 2.23621, -0.1282632, 0.6392157, 0, 1, 1,
0.693388, 1.297097, -1.653592, 0.6431373, 0, 1, 1,
0.6951877, -1.252378, 3.120957, 0.6509804, 0, 1, 1,
0.6992208, 0.5559605, 1.706774, 0.654902, 0, 1, 1,
0.7002544, 1.201802, 0.4190601, 0.6627451, 0, 1, 1,
0.704411, 1.060095, -1.410907, 0.6666667, 0, 1, 1,
0.7055302, -1.061445, 3.588497, 0.6745098, 0, 1, 1,
0.7066175, -2.419515, 2.969777, 0.6784314, 0, 1, 1,
0.7180755, -0.547093, 3.201828, 0.6862745, 0, 1, 1,
0.7190728, 0.5324396, 1.987685, 0.6901961, 0, 1, 1,
0.7212057, 0.8570244, 1.595011, 0.6980392, 0, 1, 1,
0.7219403, -2.229888, 2.497201, 0.7058824, 0, 1, 1,
0.7248793, 0.6028162, 0.4809341, 0.7098039, 0, 1, 1,
0.7268285, 0.9396799, 1.784111, 0.7176471, 0, 1, 1,
0.7269356, 0.359707, -0.2552967, 0.7215686, 0, 1, 1,
0.7277505, -1.090841, 2.157856, 0.7294118, 0, 1, 1,
0.7287454, -1.630705, 2.009012, 0.7333333, 0, 1, 1,
0.7304965, -0.3937912, 0.7110557, 0.7411765, 0, 1, 1,
0.7338579, 0.4781497, -0.6447679, 0.7450981, 0, 1, 1,
0.7371472, 2.353574, -0.4654814, 0.7529412, 0, 1, 1,
0.7457398, 0.7625869, 1.330273, 0.7568628, 0, 1, 1,
0.7503463, 0.03891529, 2.663385, 0.7647059, 0, 1, 1,
0.7518972, 0.9707769, 1.107352, 0.7686275, 0, 1, 1,
0.7519656, -0.6050535, 2.450196, 0.7764706, 0, 1, 1,
0.7522138, -1.180581, 2.468605, 0.7803922, 0, 1, 1,
0.7662255, 0.1863892, 0.6755099, 0.7882353, 0, 1, 1,
0.7703174, 1.387999, -0.0105723, 0.7921569, 0, 1, 1,
0.7743046, -0.8277462, 1.692871, 0.8, 0, 1, 1,
0.7748638, -0.1760358, 2.086698, 0.8078431, 0, 1, 1,
0.7801151, 1.066146, 1.905463, 0.8117647, 0, 1, 1,
0.7832956, -0.09457662, 0.733167, 0.8196079, 0, 1, 1,
0.7964734, -0.6884869, 5.743464, 0.8235294, 0, 1, 1,
0.7970101, -0.371922, 3.501506, 0.8313726, 0, 1, 1,
0.797519, 0.5076308, -0.01023356, 0.8352941, 0, 1, 1,
0.7977484, -1.371799, 2.229078, 0.8431373, 0, 1, 1,
0.8045522, -0.6548482, 2.070492, 0.8470588, 0, 1, 1,
0.8052005, 0.1640342, 1.534723, 0.854902, 0, 1, 1,
0.8086239, -0.2049379, 1.197833, 0.8588235, 0, 1, 1,
0.8103141, 0.03253573, 0.8084779, 0.8666667, 0, 1, 1,
0.8139747, 0.1575362, 0.6995494, 0.8705882, 0, 1, 1,
0.8147464, -0.5982274, 1.394283, 0.8784314, 0, 1, 1,
0.8207055, 0.901636, 1.26404, 0.8823529, 0, 1, 1,
0.8366838, -0.6939799, 1.665556, 0.8901961, 0, 1, 1,
0.8377882, -0.1787303, 2.833945, 0.8941177, 0, 1, 1,
0.8396553, -1.031557, 1.770967, 0.9019608, 0, 1, 1,
0.8398219, 0.5807592, 2.046003, 0.9098039, 0, 1, 1,
0.8418033, -0.2666286, 2.053307, 0.9137255, 0, 1, 1,
0.8518546, 0.8700312, 0.304584, 0.9215686, 0, 1, 1,
0.8529244, 0.4509716, 1.702382, 0.9254902, 0, 1, 1,
0.8553226, -0.1247176, 0.4407963, 0.9333333, 0, 1, 1,
0.8554037, 1.450768, -0.3827226, 0.9372549, 0, 1, 1,
0.8636522, -1.289363, 2.470536, 0.945098, 0, 1, 1,
0.8685106, 0.6341577, 1.879864, 0.9490196, 0, 1, 1,
0.8708386, -0.8307898, 1.745397, 0.9568627, 0, 1, 1,
0.8710473, -1.007658, 2.398525, 0.9607843, 0, 1, 1,
0.8736092, 0.7008089, -0.434221, 0.9686275, 0, 1, 1,
0.8749636, 0.3184185, 1.033904, 0.972549, 0, 1, 1,
0.8786667, 0.6381086, -0.2512567, 0.9803922, 0, 1, 1,
0.8834353, -1.210238, 2.908246, 0.9843137, 0, 1, 1,
0.8851957, -1.750717, 2.205318, 0.9921569, 0, 1, 1,
0.8890538, -0.7582939, 2.143829, 0.9960784, 0, 1, 1,
0.8963886, -1.262243, 3.861391, 1, 0, 0.9960784, 1,
0.896975, -0.8345084, 2.018518, 1, 0, 0.9882353, 1,
0.900349, -0.104375, 2.844631, 1, 0, 0.9843137, 1,
0.909039, 0.106358, 1.260941, 1, 0, 0.9764706, 1,
0.9108951, 0.5519666, 0.8805699, 1, 0, 0.972549, 1,
0.9206921, 1.034503, -1.01157, 1, 0, 0.9647059, 1,
0.9225165, 0.5068265, 1.660645, 1, 0, 0.9607843, 1,
0.9237238, -0.2807315, 2.25295, 1, 0, 0.9529412, 1,
0.9243227, -1.098959, -0.2040276, 1, 0, 0.9490196, 1,
0.9264876, -0.7922402, 1.925145, 1, 0, 0.9411765, 1,
0.930651, -0.4606886, -0.8596566, 1, 0, 0.9372549, 1,
0.9386874, -1.150796, 3.092546, 1, 0, 0.9294118, 1,
0.9412961, -0.5258421, 1.452022, 1, 0, 0.9254902, 1,
0.9431344, 1.119811, 0.7744889, 1, 0, 0.9176471, 1,
0.9459057, -1.641504, 2.289023, 1, 0, 0.9137255, 1,
0.9481285, -0.3728514, 0.7717062, 1, 0, 0.9058824, 1,
0.9580211, 0.1944314, 2.301257, 1, 0, 0.9019608, 1,
0.9643288, -0.3378893, 0.3984473, 1, 0, 0.8941177, 1,
0.9669731, -0.1599045, 2.464294, 1, 0, 0.8862745, 1,
0.9677693, 1.078121, 1.069475, 1, 0, 0.8823529, 1,
0.9694309, -0.4490196, -0.1311588, 1, 0, 0.8745098, 1,
0.9851421, 0.6328539, 0.08554932, 1, 0, 0.8705882, 1,
0.9872833, -0.1534156, 0.9532443, 1, 0, 0.8627451, 1,
0.9875209, -0.9287499, 1.753982, 1, 0, 0.8588235, 1,
1.004046, -0.3465073, 0.4904094, 1, 0, 0.8509804, 1,
1.009168, -2.279929, 2.684914, 1, 0, 0.8470588, 1,
1.011708, 0.2726208, -0.0280851, 1, 0, 0.8392157, 1,
1.018125, -0.4926774, 3.338125, 1, 0, 0.8352941, 1,
1.021472, -0.412674, 2.951571, 1, 0, 0.827451, 1,
1.023867, -0.623234, 2.429984, 1, 0, 0.8235294, 1,
1.026212, -0.8204053, 1.987763, 1, 0, 0.8156863, 1,
1.026253, 1.084158, 0.08578824, 1, 0, 0.8117647, 1,
1.03086, 0.9130943, 0.9089738, 1, 0, 0.8039216, 1,
1.042178, 0.8781798, 1.395666, 1, 0, 0.7960784, 1,
1.061068, -1.035392, 1.170035, 1, 0, 0.7921569, 1,
1.063692, -1.200191, 2.657165, 1, 0, 0.7843137, 1,
1.083258, 0.299576, 1.177768, 1, 0, 0.7803922, 1,
1.084407, 0.2066091, 2.123262, 1, 0, 0.772549, 1,
1.091262, 0.8732894, 1.22656, 1, 0, 0.7686275, 1,
1.093429, -1.482362, 2.652167, 1, 0, 0.7607843, 1,
1.108126, -1.638533, 4.306581, 1, 0, 0.7568628, 1,
1.112169, 1.27774, 1.202954, 1, 0, 0.7490196, 1,
1.113748, 0.8114183, 1.320371, 1, 0, 0.7450981, 1,
1.115815, 0.175304, 1.92122, 1, 0, 0.7372549, 1,
1.119325, 0.8689842, -0.2214911, 1, 0, 0.7333333, 1,
1.126411, 1.866602, 0.02767352, 1, 0, 0.7254902, 1,
1.132287, -2.018839, 3.034354, 1, 0, 0.7215686, 1,
1.133484, -0.4510356, 1.138317, 1, 0, 0.7137255, 1,
1.142158, 1.948935, 0.3137259, 1, 0, 0.7098039, 1,
1.143522, -0.3511691, 2.797102, 1, 0, 0.7019608, 1,
1.14454, -0.2632369, 1.499554, 1, 0, 0.6941177, 1,
1.14499, -0.7710389, 3.108709, 1, 0, 0.6901961, 1,
1.154261, 0.2840117, 1.461366, 1, 0, 0.682353, 1,
1.161167, 1.206983, -0.07707796, 1, 0, 0.6784314, 1,
1.167439, -1.093654, 2.584801, 1, 0, 0.6705883, 1,
1.168358, -0.3684751, 3.201779, 1, 0, 0.6666667, 1,
1.181068, -1.326598, 0.8995489, 1, 0, 0.6588235, 1,
1.181839, -1.093694, 2.416122, 1, 0, 0.654902, 1,
1.182671, -0.5767661, 3.634425, 1, 0, 0.6470588, 1,
1.196017, -0.6542596, 3.185209, 1, 0, 0.6431373, 1,
1.196535, -0.5328252, 1.184675, 1, 0, 0.6352941, 1,
1.202314, 1.286665, 0.5812577, 1, 0, 0.6313726, 1,
1.206994, -0.9620691, 2.616509, 1, 0, 0.6235294, 1,
1.218192, -2.130754, 2.453146, 1, 0, 0.6196079, 1,
1.221122, 1.331362, 0.3620026, 1, 0, 0.6117647, 1,
1.224936, 0.8348178, 3.153625, 1, 0, 0.6078432, 1,
1.22607, 0.3062372, 0.813198, 1, 0, 0.6, 1,
1.226073, 1.623868, 0.315232, 1, 0, 0.5921569, 1,
1.244301, -0.4460043, 2.026142, 1, 0, 0.5882353, 1,
1.264873, -0.6803904, 2.068913, 1, 0, 0.5803922, 1,
1.267371, -0.2502441, 1.900724, 1, 0, 0.5764706, 1,
1.279783, 1.781652, -0.2055963, 1, 0, 0.5686275, 1,
1.284407, -0.6388467, 3.473447, 1, 0, 0.5647059, 1,
1.286227, -0.5812929, 2.545375, 1, 0, 0.5568628, 1,
1.286303, 1.504808, 0.6811779, 1, 0, 0.5529412, 1,
1.298109, -1.342553, 2.058114, 1, 0, 0.5450981, 1,
1.299346, -0.8102668, 2.550396, 1, 0, 0.5411765, 1,
1.3048, -0.9507022, 3.1238, 1, 0, 0.5333334, 1,
1.309346, 0.1319193, 1.381223, 1, 0, 0.5294118, 1,
1.313697, -0.9699115, 2.840384, 1, 0, 0.5215687, 1,
1.322559, 0.1471775, 1.800629, 1, 0, 0.5176471, 1,
1.323212, 0.3421402, 0.972412, 1, 0, 0.509804, 1,
1.343063, 0.3538623, 1.571852, 1, 0, 0.5058824, 1,
1.344601, 0.1061114, 2.035052, 1, 0, 0.4980392, 1,
1.349567, 0.6947395, 0.8938132, 1, 0, 0.4901961, 1,
1.350011, -0.2864458, 0.9243948, 1, 0, 0.4862745, 1,
1.356458, 0.3813983, 1.242872, 1, 0, 0.4784314, 1,
1.363906, -0.7220814, 3.488121, 1, 0, 0.4745098, 1,
1.36446, -0.544687, 2.523468, 1, 0, 0.4666667, 1,
1.366643, 1.924868, -1.61515, 1, 0, 0.4627451, 1,
1.368983, 0.133547, -0.6111062, 1, 0, 0.454902, 1,
1.370428, 0.8292159, 2.175032, 1, 0, 0.4509804, 1,
1.37088, -0.2563214, 1.194176, 1, 0, 0.4431373, 1,
1.370951, -0.2262998, 2.21379, 1, 0, 0.4392157, 1,
1.372612, 0.6023734, 0.8512796, 1, 0, 0.4313726, 1,
1.380682, 0.009858321, 2.806904, 1, 0, 0.427451, 1,
1.389407, 0.4763364, 1.094204, 1, 0, 0.4196078, 1,
1.39834, 1.670008, 0.1615678, 1, 0, 0.4156863, 1,
1.418743, 1.34546, -0.2585398, 1, 0, 0.4078431, 1,
1.440899, -1.762273, 2.015886, 1, 0, 0.4039216, 1,
1.456512, -1.003274, 2.047023, 1, 0, 0.3960784, 1,
1.471701, 0.5417945, 2.816843, 1, 0, 0.3882353, 1,
1.471937, 1.641276, 0.1046422, 1, 0, 0.3843137, 1,
1.492356, -1.181623, 0.809715, 1, 0, 0.3764706, 1,
1.499212, -0.6675295, 2.327485, 1, 0, 0.372549, 1,
1.511673, -0.4727182, 1.615139, 1, 0, 0.3647059, 1,
1.519538, -0.4835066, 1.806657, 1, 0, 0.3607843, 1,
1.523679, -0.7381067, 2.685052, 1, 0, 0.3529412, 1,
1.537313, -0.4623147, 0.160595, 1, 0, 0.3490196, 1,
1.541867, 0.7901244, 2.350598, 1, 0, 0.3411765, 1,
1.542121, -0.4867865, 2.714912, 1, 0, 0.3372549, 1,
1.54329, 2.80075, 0.8793438, 1, 0, 0.3294118, 1,
1.561363, 0.05219011, 1.944215, 1, 0, 0.3254902, 1,
1.562988, -0.2240881, 1.387893, 1, 0, 0.3176471, 1,
1.566333, -0.1131885, 2.879133, 1, 0, 0.3137255, 1,
1.584198, 0.03090199, 2.78568, 1, 0, 0.3058824, 1,
1.586261, -1.057774, 2.511576, 1, 0, 0.2980392, 1,
1.588747, 0.6697752, 0.1032893, 1, 0, 0.2941177, 1,
1.588881, -0.4505466, 2.054209, 1, 0, 0.2862745, 1,
1.609151, 1.91787, 0.7266318, 1, 0, 0.282353, 1,
1.610907, 0.1574592, 1.912568, 1, 0, 0.2745098, 1,
1.642253, -0.2589632, 0.2311098, 1, 0, 0.2705882, 1,
1.672985, -0.1679703, 3.100825, 1, 0, 0.2627451, 1,
1.697848, 1.561081, 0.7338648, 1, 0, 0.2588235, 1,
1.709527, 0.6410658, -0.6561494, 1, 0, 0.2509804, 1,
1.743389, 0.8396093, 0.9041066, 1, 0, 0.2470588, 1,
1.743585, 0.2817583, 2.70355, 1, 0, 0.2392157, 1,
1.758998, 1.353085, 1.785764, 1, 0, 0.2352941, 1,
1.796551, -0.8041615, 1.564522, 1, 0, 0.227451, 1,
1.80823, -0.5598147, 1.833156, 1, 0, 0.2235294, 1,
1.848645, -0.2780284, 1.178938, 1, 0, 0.2156863, 1,
1.85706, 3.003741, 0.1025475, 1, 0, 0.2117647, 1,
1.857272, 0.5955522, 0.4065449, 1, 0, 0.2039216, 1,
1.868634, -1.257213, 2.219648, 1, 0, 0.1960784, 1,
1.874656, 0.7487776, 2.396684, 1, 0, 0.1921569, 1,
1.880814, -1.642283, 3.036182, 1, 0, 0.1843137, 1,
1.883616, -1.389672, 2.52839, 1, 0, 0.1803922, 1,
1.890115, 0.7396722, 2.499417, 1, 0, 0.172549, 1,
1.902213, 0.9603454, 0.1821689, 1, 0, 0.1686275, 1,
1.917499, 1.023073, 2.434133, 1, 0, 0.1607843, 1,
1.961583, -0.8465205, 3.24691, 1, 0, 0.1568628, 1,
1.965053, 0.406736, 2.86976, 1, 0, 0.1490196, 1,
1.980161, -0.7674632, 1.299904, 1, 0, 0.145098, 1,
1.985335, 0.7731694, 0.735338, 1, 0, 0.1372549, 1,
1.992116, -2.759427, 2.315735, 1, 0, 0.1333333, 1,
1.997934, 0.3587325, 0.07915468, 1, 0, 0.1254902, 1,
2.092315, -0.8569056, 1.960095, 1, 0, 0.1215686, 1,
2.110855, 2.110204, 2.034182, 1, 0, 0.1137255, 1,
2.120084, -0.2929761, 1.855627, 1, 0, 0.1098039, 1,
2.162786, -0.6216916, 1.076532, 1, 0, 0.1019608, 1,
2.166067, -0.7522979, 2.155531, 1, 0, 0.09411765, 1,
2.18018, -0.56425, 3.075761, 1, 0, 0.09019608, 1,
2.189758, 0.5214193, 1.622434, 1, 0, 0.08235294, 1,
2.243556, 0.1596267, 2.186418, 1, 0, 0.07843138, 1,
2.295352, 0.635029, -0.9606422, 1, 0, 0.07058824, 1,
2.320717, 1.835723, 1.415268, 1, 0, 0.06666667, 1,
2.323122, -0.4265105, 1.274402, 1, 0, 0.05882353, 1,
2.362734, 1.247326, 1.028314, 1, 0, 0.05490196, 1,
2.565136, -0.8541074, 2.892425, 1, 0, 0.04705882, 1,
2.60488, -0.5403522, -0.1673728, 1, 0, 0.04313726, 1,
2.651357, 0.7717839, 1.316192, 1, 0, 0.03529412, 1,
2.656873, -1.038547, 1.465708, 1, 0, 0.03137255, 1,
2.762208, -0.04425627, 0.3817475, 1, 0, 0.02352941, 1,
2.801344, -0.5187952, 1.525742, 1, 0, 0.01960784, 1,
2.868073, -1.493534, 2.64303, 1, 0, 0.01176471, 1,
2.988986, 0.8130946, 0.7372097, 1, 0, 0.007843138, 1
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
-0.03573585, -4.253852, -7.23272, 0, -0.5, 0.5, 0.5,
-0.03573585, -4.253852, -7.23272, 1, -0.5, 0.5, 0.5,
-0.03573585, -4.253852, -7.23272, 1, 1.5, 0.5, 0.5,
-0.03573585, -4.253852, -7.23272, 0, 1.5, 0.5, 0.5
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
-4.085839, -0.08067596, -7.23272, 0, -0.5, 0.5, 0.5,
-4.085839, -0.08067596, -7.23272, 1, -0.5, 0.5, 0.5,
-4.085839, -0.08067596, -7.23272, 1, 1.5, 0.5, 0.5,
-4.085839, -0.08067596, -7.23272, 0, 1.5, 0.5, 0.5
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
-4.085839, -4.253852, 0.1957152, 0, -0.5, 0.5, 0.5,
-4.085839, -4.253852, 0.1957152, 1, -0.5, 0.5, 0.5,
-4.085839, -4.253852, 0.1957152, 1, 1.5, 0.5, 0.5,
-4.085839, -4.253852, 0.1957152, 0, 1.5, 0.5, 0.5
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
-3, -3.290811, -5.518466,
2, -3.290811, -5.518466,
-3, -3.290811, -5.518466,
-3, -3.451318, -5.804174,
-2, -3.290811, -5.518466,
-2, -3.451318, -5.804174,
-1, -3.290811, -5.518466,
-1, -3.451318, -5.804174,
0, -3.290811, -5.518466,
0, -3.451318, -5.804174,
1, -3.290811, -5.518466,
1, -3.451318, -5.804174,
2, -3.290811, -5.518466,
2, -3.451318, -5.804174
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
-3, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
-3, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
-3, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
-3, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5,
-2, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
-2, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
-2, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
-2, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5,
-1, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
-1, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
-1, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
-1, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5,
0, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
0, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
0, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
0, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5,
1, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
1, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
1, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
1, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5,
2, -3.772331, -6.375593, 0, -0.5, 0.5, 0.5,
2, -3.772331, -6.375593, 1, -0.5, 0.5, 0.5,
2, -3.772331, -6.375593, 1, 1.5, 0.5, 0.5,
2, -3.772331, -6.375593, 0, 1.5, 0.5, 0.5
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
-3.1512, -3, -5.518466,
-3.1512, 3, -5.518466,
-3.1512, -3, -5.518466,
-3.306973, -3, -5.804174,
-3.1512, -2, -5.518466,
-3.306973, -2, -5.804174,
-3.1512, -1, -5.518466,
-3.306973, -1, -5.804174,
-3.1512, 0, -5.518466,
-3.306973, 0, -5.804174,
-3.1512, 1, -5.518466,
-3.306973, 1, -5.804174,
-3.1512, 2, -5.518466,
-3.306973, 2, -5.804174,
-3.1512, 3, -5.518466,
-3.306973, 3, -5.804174
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
-3.618519, -3, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, -3, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, -3, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, -3, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, -2, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, -2, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, -2, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, -2, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, -1, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, -1, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, -1, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, -1, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, 0, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, 0, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, 0, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, 0, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, 1, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, 1, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, 1, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, 1, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, 2, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, 2, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, 2, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, 2, -6.375593, 0, 1.5, 0.5, 0.5,
-3.618519, 3, -6.375593, 0, -0.5, 0.5, 0.5,
-3.618519, 3, -6.375593, 1, -0.5, 0.5, 0.5,
-3.618519, 3, -6.375593, 1, 1.5, 0.5, 0.5,
-3.618519, 3, -6.375593, 0, 1.5, 0.5, 0.5
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
-3.1512, -3.290811, -4,
-3.1512, -3.290811, 4,
-3.1512, -3.290811, -4,
-3.306973, -3.451318, -4,
-3.1512, -3.290811, -2,
-3.306973, -3.451318, -2,
-3.1512, -3.290811, 0,
-3.306973, -3.451318, 0,
-3.1512, -3.290811, 2,
-3.306973, -3.451318, 2,
-3.1512, -3.290811, 4,
-3.306973, -3.451318, 4
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
-3.618519, -3.772331, -4, 0, -0.5, 0.5, 0.5,
-3.618519, -3.772331, -4, 1, -0.5, 0.5, 0.5,
-3.618519, -3.772331, -4, 1, 1.5, 0.5, 0.5,
-3.618519, -3.772331, -4, 0, 1.5, 0.5, 0.5,
-3.618519, -3.772331, -2, 0, -0.5, 0.5, 0.5,
-3.618519, -3.772331, -2, 1, -0.5, 0.5, 0.5,
-3.618519, -3.772331, -2, 1, 1.5, 0.5, 0.5,
-3.618519, -3.772331, -2, 0, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 0, 0, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 0, 1, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 0, 1, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 0, 0, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 2, 0, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 2, 1, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 2, 1, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 2, 0, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 4, 0, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 4, 1, -0.5, 0.5, 0.5,
-3.618519, -3.772331, 4, 1, 1.5, 0.5, 0.5,
-3.618519, -3.772331, 4, 0, 1.5, 0.5, 0.5
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
-3.1512, -3.290811, -5.518466,
-3.1512, 3.129459, -5.518466,
-3.1512, -3.290811, 5.909896,
-3.1512, 3.129459, 5.909896,
-3.1512, -3.290811, -5.518466,
-3.1512, -3.290811, 5.909896,
-3.1512, 3.129459, -5.518466,
-3.1512, 3.129459, 5.909896,
-3.1512, -3.290811, -5.518466,
3.079728, -3.290811, -5.518466,
-3.1512, -3.290811, 5.909896,
3.079728, -3.290811, 5.909896,
-3.1512, 3.129459, -5.518466,
3.079728, 3.129459, -5.518466,
-3.1512, 3.129459, 5.909896,
3.079728, 3.129459, 5.909896,
3.079728, -3.290811, -5.518466,
3.079728, 3.129459, -5.518466,
3.079728, -3.290811, 5.909896,
3.079728, 3.129459, 5.909896,
3.079728, -3.290811, -5.518466,
3.079728, -3.290811, 5.909896,
3.079728, 3.129459, -5.518466,
3.079728, 3.129459, 5.909896
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
var radius = 7.750113;
var distance = 34.48113;
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
mvMatrix.translate( 0.03573585, 0.08067596, -0.1957152 );
mvMatrix.scale( 1.344836, 1.305175, 0.7332262 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48113);
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
Propyne<-read.table("Propyne.xyz")
```

```
## Error in read.table("Propyne.xyz"): no lines available in input
```

```r
x<-Propyne$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
y<-Propyne$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
z<-Propyne$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
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
-3.060458, 0.2149127, -2.635517, 0, 0, 1, 1, 1,
-2.988225, -0.05943909, -3.063629, 1, 0, 0, 1, 1,
-2.464638, 0.4174904, -1.375893, 1, 0, 0, 1, 1,
-2.405959, -1.142402, -3.164767, 1, 0, 0, 1, 1,
-2.399562, -0.375595, -2.048877, 1, 0, 0, 1, 1,
-2.373696, -0.8037855, -1.659719, 1, 0, 0, 1, 1,
-2.367661, 0.4512544, -2.504169, 0, 0, 0, 1, 1,
-2.330217, -0.8447689, -2.581526, 0, 0, 0, 1, 1,
-2.284063, -1.038955, -1.358743, 0, 0, 0, 1, 1,
-2.235205, 0.250674, 0.1537675, 0, 0, 0, 1, 1,
-2.220328, 0.3672093, -2.889149, 0, 0, 0, 1, 1,
-2.214368, -0.4717542, -2.152003, 0, 0, 0, 1, 1,
-2.205237, 2.770933, -0.8171584, 0, 0, 0, 1, 1,
-2.199827, 0.8688206, -1.741243, 1, 1, 1, 1, 1,
-2.147489, 1.325104, -1.368145, 1, 1, 1, 1, 1,
-2.129619, 0.6912133, -1.018027, 1, 1, 1, 1, 1,
-2.11446, 0.4085366, -0.730276, 1, 1, 1, 1, 1,
-2.074694, -0.1702599, -0.4541644, 1, 1, 1, 1, 1,
-2.051997, 1.06047, -1.275905, 1, 1, 1, 1, 1,
-2.014335, 0.9659578, 0.04213476, 1, 1, 1, 1, 1,
-2.00893, 0.8726094, 0.122441, 1, 1, 1, 1, 1,
-2.008017, -0.4737173, -2.336755, 1, 1, 1, 1, 1,
-1.996181, 1.729474, 0.5868317, 1, 1, 1, 1, 1,
-1.982189, 1.670882, -0.3650364, 1, 1, 1, 1, 1,
-1.956596, -0.9577682, -3.374733, 1, 1, 1, 1, 1,
-1.933, 1.832262, 0.271307, 1, 1, 1, 1, 1,
-1.926993, -1.82204, -1.483731, 1, 1, 1, 1, 1,
-1.924299, -0.3721937, -1.785466, 1, 1, 1, 1, 1,
-1.887883, -1.109251, -2.147712, 0, 0, 1, 1, 1,
-1.834018, 0.09615885, -1.499566, 1, 0, 0, 1, 1,
-1.825041, 0.5225371, -1.277053, 1, 0, 0, 1, 1,
-1.790986, 0.5045452, -0.4380218, 1, 0, 0, 1, 1,
-1.790084, -1.502979, -2.260183, 1, 0, 0, 1, 1,
-1.78939, -0.6564012, -2.63125, 1, 0, 0, 1, 1,
-1.785494, -0.6563733, -2.356142, 0, 0, 0, 1, 1,
-1.782307, -1.241533, -3.002137, 0, 0, 0, 1, 1,
-1.76996, -1.478865, -0.8948587, 0, 0, 0, 1, 1,
-1.766153, 0.06212765, -0.1128459, 0, 0, 0, 1, 1,
-1.759336, 0.0971771, -2.617465, 0, 0, 0, 1, 1,
-1.749189, 1.020072, -1.005956, 0, 0, 0, 1, 1,
-1.713187, 0.883354, -0.3888519, 0, 0, 0, 1, 1,
-1.70836, -0.5117795, -1.327309, 1, 1, 1, 1, 1,
-1.698988, -0.1787676, -1.995784, 1, 1, 1, 1, 1,
-1.680432, -0.8283886, -2.587851, 1, 1, 1, 1, 1,
-1.676887, 0.3354723, -2.095833, 1, 1, 1, 1, 1,
-1.668167, 1.115737, -0.9549977, 1, 1, 1, 1, 1,
-1.666283, -1.077485, -3.707633, 1, 1, 1, 1, 1,
-1.664433, -0.170389, -0.5455624, 1, 1, 1, 1, 1,
-1.644641, -0.6770956, -1.545326, 1, 1, 1, 1, 1,
-1.626093, -1.094289, -1.633287, 1, 1, 1, 1, 1,
-1.623974, 0.7593667, 0.3672526, 1, 1, 1, 1, 1,
-1.612495, -0.712866, -2.776404, 1, 1, 1, 1, 1,
-1.609896, -0.1067666, -0.9920529, 1, 1, 1, 1, 1,
-1.609634, -0.296245, 0.1181501, 1, 1, 1, 1, 1,
-1.585069, 1.285432, -1.804199, 1, 1, 1, 1, 1,
-1.579899, -0.7842124, -3.507231, 1, 1, 1, 1, 1,
-1.573844, -1.472984, -1.760977, 0, 0, 1, 1, 1,
-1.559072, 0.02490439, -0.8478407, 1, 0, 0, 1, 1,
-1.538388, 0.1228387, -1.786617, 1, 0, 0, 1, 1,
-1.538035, 0.8562487, -0.4894122, 1, 0, 0, 1, 1,
-1.50824, -1.041101, -3.2477, 1, 0, 0, 1, 1,
-1.501272, 2.216374, -1.077897, 1, 0, 0, 1, 1,
-1.49725, 0.02495469, -1.515276, 0, 0, 0, 1, 1,
-1.490939, -0.4958122, 0.6082928, 0, 0, 0, 1, 1,
-1.480559, 0.7696211, -2.138524, 0, 0, 0, 1, 1,
-1.443894, -0.2013838, -0.1241756, 0, 0, 0, 1, 1,
-1.436323, -0.1079945, 0.05398511, 0, 0, 0, 1, 1,
-1.414301, 0.02778058, -1.377783, 0, 0, 0, 1, 1,
-1.408438, -0.3447053, -3.16512, 0, 0, 0, 1, 1,
-1.405968, -1.748788, -4.128569, 1, 1, 1, 1, 1,
-1.39601, -0.02314433, -1.32507, 1, 1, 1, 1, 1,
-1.394682, -0.3930927, -5.276798, 1, 1, 1, 1, 1,
-1.394073, -1.83527, -2.0106, 1, 1, 1, 1, 1,
-1.39342, 0.9180226, 0.2435611, 1, 1, 1, 1, 1,
-1.390646, -0.4857291, -0.1622013, 1, 1, 1, 1, 1,
-1.388292, 1.433118, -2.048743, 1, 1, 1, 1, 1,
-1.387928, 0.6266966, -2.259077, 1, 1, 1, 1, 1,
-1.378083, -0.01806299, -0.8584724, 1, 1, 1, 1, 1,
-1.375981, 1.949054, -0.5205394, 1, 1, 1, 1, 1,
-1.3684, 0.6977007, -1.415404, 1, 1, 1, 1, 1,
-1.360829, -0.700083, -2.607116, 1, 1, 1, 1, 1,
-1.359309, 1.172735, 1.557046, 1, 1, 1, 1, 1,
-1.353897, 0.6559546, 0.2218555, 1, 1, 1, 1, 1,
-1.350151, 0.8938192, -1.024333, 1, 1, 1, 1, 1,
-1.348113, -0.5408775, -1.284455, 0, 0, 1, 1, 1,
-1.344448, -1.726582, -2.510418, 1, 0, 0, 1, 1,
-1.343324, -0.1875184, 0.004361649, 1, 0, 0, 1, 1,
-1.335082, 1.301431, -0.9339078, 1, 0, 0, 1, 1,
-1.331551, 0.2783013, -2.27832, 1, 0, 0, 1, 1,
-1.330047, -0.009851893, -0.4298664, 1, 0, 0, 1, 1,
-1.325155, -1.171517, -2.138349, 0, 0, 0, 1, 1,
-1.32041, 1.357948, -1.232341, 0, 0, 0, 1, 1,
-1.307041, -0.9301202, -3.209582, 0, 0, 0, 1, 1,
-1.306762, 0.9443374, -2.470444, 0, 0, 0, 1, 1,
-1.306624, 1.046671, 0.8008808, 0, 0, 0, 1, 1,
-1.299627, 0.2441572, -1.552187, 0, 0, 0, 1, 1,
-1.293761, -0.02481344, -3.531251, 0, 0, 0, 1, 1,
-1.283595, 1.483903, 0.4469201, 1, 1, 1, 1, 1,
-1.269314, -1.10238, -1.562881, 1, 1, 1, 1, 1,
-1.268133, -0.4569618, -1.192454, 1, 1, 1, 1, 1,
-1.262951, -0.118996, -1.579325, 1, 1, 1, 1, 1,
-1.260394, -1.36001, -1.126382, 1, 1, 1, 1, 1,
-1.237802, -0.4742947, -1.330498, 1, 1, 1, 1, 1,
-1.235671, -0.8226816, -3.037031, 1, 1, 1, 1, 1,
-1.231008, 2.426981, -0.6189947, 1, 1, 1, 1, 1,
-1.226663, 1.050366, -1.732396, 1, 1, 1, 1, 1,
-1.218246, 0.3476802, -1.853003, 1, 1, 1, 1, 1,
-1.214291, 1.589223, -0.9698552, 1, 1, 1, 1, 1,
-1.209464, 1.704016, -1.035811, 1, 1, 1, 1, 1,
-1.203619, 0.2742916, -0.9355615, 1, 1, 1, 1, 1,
-1.202932, 1.150581, -0.7710395, 1, 1, 1, 1, 1,
-1.194311, -0.8410615, -2.652836, 1, 1, 1, 1, 1,
-1.167368, 1.425, 0.6745703, 0, 0, 1, 1, 1,
-1.158697, -1.029658, -3.232605, 1, 0, 0, 1, 1,
-1.153935, -1.984572, -3.110406, 1, 0, 0, 1, 1,
-1.148997, -0.01203038, -1.749252, 1, 0, 0, 1, 1,
-1.148365, -0.9032773, -1.439513, 1, 0, 0, 1, 1,
-1.146341, -2.24841, -5.352033, 1, 0, 0, 1, 1,
-1.139004, 0.7203389, -3.275943, 0, 0, 0, 1, 1,
-1.138633, 1.609741, -0.4555638, 0, 0, 0, 1, 1,
-1.136947, -0.8340213, -3.494862, 0, 0, 0, 1, 1,
-1.126303, -0.3307894, -0.9193009, 0, 0, 0, 1, 1,
-1.122951, -1.651839, -3.99627, 0, 0, 0, 1, 1,
-1.122613, -0.770055, -1.811307, 0, 0, 0, 1, 1,
-1.122054, 0.8766862, -0.2116699, 0, 0, 0, 1, 1,
-1.117485, -0.2366042, -1.46778, 1, 1, 1, 1, 1,
-1.110995, 0.6084201, -2.500092, 1, 1, 1, 1, 1,
-1.101997, -0.2752024, -3.612541, 1, 1, 1, 1, 1,
-1.101593, 0.4308312, -1.981854, 1, 1, 1, 1, 1,
-1.097392, -0.9398541, -2.561043, 1, 1, 1, 1, 1,
-1.092373, 1.433684, -0.7583936, 1, 1, 1, 1, 1,
-1.091164, 0.2433021, -1.361, 1, 1, 1, 1, 1,
-1.087135, -0.2730004, -2.627793, 1, 1, 1, 1, 1,
-1.086381, -1.978559, -5.042837, 1, 1, 1, 1, 1,
-1.082681, 0.009999257, -1.366782, 1, 1, 1, 1, 1,
-1.082407, -0.5435995, -1.073576, 1, 1, 1, 1, 1,
-1.069752, -0.1769876, -1.264457, 1, 1, 1, 1, 1,
-1.069079, 0.7605718, -2.077554, 1, 1, 1, 1, 1,
-1.066576, -0.1469998, -1.856398, 1, 1, 1, 1, 1,
-1.048142, -0.357413, -1.877369, 1, 1, 1, 1, 1,
-1.047442, 0.5623227, -0.6208404, 0, 0, 1, 1, 1,
-1.042665, 1.138092, -0.3195804, 1, 0, 0, 1, 1,
-1.041685, -0.10866, -2.761398, 1, 0, 0, 1, 1,
-1.040859, -0.6068965, -2.324025, 1, 0, 0, 1, 1,
-1.035459, -0.6676761, -0.8794192, 1, 0, 0, 1, 1,
-1.025846, -0.5570744, -3.207176, 1, 0, 0, 1, 1,
-1.024327, 0.4365035, 0.06998619, 0, 0, 0, 1, 1,
-1.022339, -1.839612, -3.653445, 0, 0, 0, 1, 1,
-1.018293, 0.2262834, -1.433097, 0, 0, 0, 1, 1,
-1.017028, -0.5882788, -3.780775, 0, 0, 0, 1, 1,
-1.016744, -0.9347271, -1.930007, 0, 0, 0, 1, 1,
-1.015304, -0.3976994, -2.428275, 0, 0, 0, 1, 1,
-1.004976, -1.523595, -3.611054, 0, 0, 0, 1, 1,
-1.004394, 0.09394886, 1.233511, 1, 1, 1, 1, 1,
-1.004192, -1.300673, -1.8365, 1, 1, 1, 1, 1,
-0.9988331, -1.06495, -2.892987, 1, 1, 1, 1, 1,
-0.9967545, 0.01317731, -0.6873611, 1, 1, 1, 1, 1,
-0.9953593, -1.364267, -3.333161, 1, 1, 1, 1, 1,
-0.994083, -1.072995, -1.356368, 1, 1, 1, 1, 1,
-0.9919509, -0.1013477, -1.300871, 1, 1, 1, 1, 1,
-0.9918039, -0.2653264, -1.935423, 1, 1, 1, 1, 1,
-0.9827279, -0.8911293, -2.792908, 1, 1, 1, 1, 1,
-0.9753909, 2.772485, 1.109586, 1, 1, 1, 1, 1,
-0.9628884, 0.1241709, -0.8881495, 1, 1, 1, 1, 1,
-0.9623295, -0.4277383, -1.868784, 1, 1, 1, 1, 1,
-0.9543492, 1.413781, -1.040674, 1, 1, 1, 1, 1,
-0.9527892, 0.4725785, -1.212537, 1, 1, 1, 1, 1,
-0.9482887, 1.601414, -1.856065, 1, 1, 1, 1, 1,
-0.9467211, -0.5193143, -1.621388, 0, 0, 1, 1, 1,
-0.9435519, 0.5363713, -2.857693, 1, 0, 0, 1, 1,
-0.9431856, -0.6231321, -1.382626, 1, 0, 0, 1, 1,
-0.9430654, 1.281408, 0.1005753, 1, 0, 0, 1, 1,
-0.93607, 1.651239, -0.1411954, 1, 0, 0, 1, 1,
-0.9356762, -0.8728309, -1.720722, 1, 0, 0, 1, 1,
-0.9324162, -1.210707, -2.481299, 0, 0, 0, 1, 1,
-0.9314358, 1.884438, -0.1278654, 0, 0, 0, 1, 1,
-0.9212161, -1.35433, -2.802782, 0, 0, 0, 1, 1,
-0.9179219, 0.9918649, -1.32647, 0, 0, 0, 1, 1,
-0.9177448, -1.694358, -2.046863, 0, 0, 0, 1, 1,
-0.9171852, 0.5498324, -1.096686, 0, 0, 0, 1, 1,
-0.9119688, 0.987227, -0.3874897, 0, 0, 0, 1, 1,
-0.9094831, -1.428573, -2.156972, 1, 1, 1, 1, 1,
-0.9074969, 1.417285, 0.5163004, 1, 1, 1, 1, 1,
-0.9047504, 0.366785, -1.191056, 1, 1, 1, 1, 1,
-0.9045718, 0.303311, -2.831314, 1, 1, 1, 1, 1,
-0.9023472, -0.1018171, -2.066911, 1, 1, 1, 1, 1,
-0.8898419, 0.06034976, -1.912359, 1, 1, 1, 1, 1,
-0.8886575, 0.7596648, -1.635028, 1, 1, 1, 1, 1,
-0.8803642, 0.1337175, 0.2760521, 1, 1, 1, 1, 1,
-0.8787462, 0.3830585, -0.6781499, 1, 1, 1, 1, 1,
-0.8705291, 0.619611, -0.2199704, 1, 1, 1, 1, 1,
-0.8691685, -0.668809, -1.300627, 1, 1, 1, 1, 1,
-0.8676195, 0.1629424, -1.526963, 1, 1, 1, 1, 1,
-0.8665619, 0.6755177, -0.5707411, 1, 1, 1, 1, 1,
-0.862734, -0.1312275, -1.171596, 1, 1, 1, 1, 1,
-0.8595961, -1.890446, -1.430605, 1, 1, 1, 1, 1,
-0.8507299, 0.1128324, -2.512384, 0, 0, 1, 1, 1,
-0.8493564, -0.581352, -2.112061, 1, 0, 0, 1, 1,
-0.8448219, 0.6022271, -2.150981, 1, 0, 0, 1, 1,
-0.8415161, -0.5551977, -3.589521, 1, 0, 0, 1, 1,
-0.8339434, -0.7486222, -0.5419639, 1, 0, 0, 1, 1,
-0.8279104, 0.4040779, -1.856133, 1, 0, 0, 1, 1,
-0.8190991, 0.6870435, -0.7778353, 0, 0, 0, 1, 1,
-0.8176394, -0.3095724, -2.632409, 0, 0, 0, 1, 1,
-0.8073536, -0.1985438, -0.66067, 0, 0, 0, 1, 1,
-0.8060474, -0.06772024, -0.4003996, 0, 0, 0, 1, 1,
-0.8012545, -0.5506173, -0.6207469, 0, 0, 0, 1, 1,
-0.8006374, 1.247656, -1.198862, 0, 0, 0, 1, 1,
-0.7961861, -0.2866073, -0.596398, 0, 0, 0, 1, 1,
-0.7929559, 0.2213199, -0.5439587, 1, 1, 1, 1, 1,
-0.7925728, -1.11387, -2.516662, 1, 1, 1, 1, 1,
-0.7883697, -0.03854478, -2.71815, 1, 1, 1, 1, 1,
-0.7867905, 2.004831, 0.09950195, 1, 1, 1, 1, 1,
-0.7846808, 1.332272, -1.245131, 1, 1, 1, 1, 1,
-0.7827262, -0.2223505, -2.426328, 1, 1, 1, 1, 1,
-0.7813893, 0.1603616, -1.338942, 1, 1, 1, 1, 1,
-0.7789274, -1.280472, -1.831761, 1, 1, 1, 1, 1,
-0.7772673, 1.23989, 0.007466353, 1, 1, 1, 1, 1,
-0.7757972, -0.3171093, -3.308179, 1, 1, 1, 1, 1,
-0.7540612, -0.6320806, -1.596325, 1, 1, 1, 1, 1,
-0.7538729, 0.3043859, -2.165308, 1, 1, 1, 1, 1,
-0.747076, -1.012343, -3.283525, 1, 1, 1, 1, 1,
-0.7433948, 0.1817089, -1.973486, 1, 1, 1, 1, 1,
-0.7412583, 1.806328, -1.120764, 1, 1, 1, 1, 1,
-0.7400859, -0.5327169, -2.383658, 0, 0, 1, 1, 1,
-0.7391452, -1.011218, -3.679051, 1, 0, 0, 1, 1,
-0.738323, -0.382894, -3.225474, 1, 0, 0, 1, 1,
-0.7373987, 0.6802846, -0.8369361, 1, 0, 0, 1, 1,
-0.7360241, -0.5982489, -1.821694, 1, 0, 0, 1, 1,
-0.7351326, -0.8310756, -0.4947313, 1, 0, 0, 1, 1,
-0.7348831, -0.2320681, -2.600964, 0, 0, 0, 1, 1,
-0.7308627, 0.3950983, -2.058812, 0, 0, 0, 1, 1,
-0.7259061, -1.103554, -1.283785, 0, 0, 0, 1, 1,
-0.714397, 0.01563344, -1.639601, 0, 0, 0, 1, 1,
-0.711013, 0.8162757, 0.9709388, 0, 0, 0, 1, 1,
-0.7099668, 0.3654113, -1.872473, 0, 0, 0, 1, 1,
-0.7063862, 2.290525, 0.6757507, 0, 0, 0, 1, 1,
-0.7033866, 1.635517, 0.7757816, 1, 1, 1, 1, 1,
-0.7033712, -1.186319, -2.339546, 1, 1, 1, 1, 1,
-0.6971821, 0.3953024, -1.633252, 1, 1, 1, 1, 1,
-0.6943383, 1.250374, 1.407444, 1, 1, 1, 1, 1,
-0.693767, -0.279589, -3.296628, 1, 1, 1, 1, 1,
-0.6889983, 0.2694453, -1.679644, 1, 1, 1, 1, 1,
-0.6871694, -0.1784174, -2.553259, 1, 1, 1, 1, 1,
-0.6858509, -1.108778, -4.023985, 1, 1, 1, 1, 1,
-0.6854379, 0.594555, -1.955845, 1, 1, 1, 1, 1,
-0.683161, 1.088259, -1.680458, 1, 1, 1, 1, 1,
-0.6808107, -1.182341, -2.425376, 1, 1, 1, 1, 1,
-0.6783903, -0.7377123, -3.293108, 1, 1, 1, 1, 1,
-0.6763284, -0.360924, -1.694603, 1, 1, 1, 1, 1,
-0.6757253, 0.6812974, -0.6751914, 1, 1, 1, 1, 1,
-0.6714922, -0.1944249, -2.289628, 1, 1, 1, 1, 1,
-0.6695862, 1.09433, 0.694989, 0, 0, 1, 1, 1,
-0.6695685, 0.5883719, -2.093398, 1, 0, 0, 1, 1,
-0.6674242, -0.2242531, -1.845021, 1, 0, 0, 1, 1,
-0.6628925, -1.239357, -3.780692, 1, 0, 0, 1, 1,
-0.6598197, 1.491232, 0.4957608, 1, 0, 0, 1, 1,
-0.6586462, -0.9338899, -0.6666163, 1, 0, 0, 1, 1,
-0.6579638, 1.443245, -0.2646677, 0, 0, 0, 1, 1,
-0.6567039, 0.01420449, -1.501107, 0, 0, 0, 1, 1,
-0.6542023, -1.490482, -2.495585, 0, 0, 0, 1, 1,
-0.65398, -0.5819705, -2.38449, 0, 0, 0, 1, 1,
-0.653675, 0.350842, -1.918807, 0, 0, 0, 1, 1,
-0.6488367, 0.4220625, -1.394043, 0, 0, 0, 1, 1,
-0.6415536, 1.346543, 0.9803339, 0, 0, 0, 1, 1,
-0.6387601, 0.4001694, 0.09092427, 1, 1, 1, 1, 1,
-0.635144, -1.229033, -3.145432, 1, 1, 1, 1, 1,
-0.6332263, 0.5658799, -0.6320375, 1, 1, 1, 1, 1,
-0.6320624, 1.594941, -0.1727887, 1, 1, 1, 1, 1,
-0.624504, -0.912299, -2.803046, 1, 1, 1, 1, 1,
-0.6234228, -0.9524136, -3.17923, 1, 1, 1, 1, 1,
-0.6231679, 0.9460763, 0.2078387, 1, 1, 1, 1, 1,
-0.6209135, 0.2898691, -1.68955, 1, 1, 1, 1, 1,
-0.6190498, -0.9605059, -2.941497, 1, 1, 1, 1, 1,
-0.6148852, -0.03499173, -3.3208, 1, 1, 1, 1, 1,
-0.614523, 0.1547441, -1.601389, 1, 1, 1, 1, 1,
-0.6082522, -0.9532433, -0.883143, 1, 1, 1, 1, 1,
-0.6060436, 2.238245, 1.037369, 1, 1, 1, 1, 1,
-0.604763, 0.487414, 0.02749223, 1, 1, 1, 1, 1,
-0.5999757, -0.8504601, -3.002423, 1, 1, 1, 1, 1,
-0.5983105, -1.693441, -2.80354, 0, 0, 1, 1, 1,
-0.5977567, -0.7531237, -1.335817, 1, 0, 0, 1, 1,
-0.5968465, 2.669473, -0.1808632, 1, 0, 0, 1, 1,
-0.5930163, 0.282356, -0.4305731, 1, 0, 0, 1, 1,
-0.5929931, -1.898089, -2.494129, 1, 0, 0, 1, 1,
-0.5921257, -1.468307, -3.814791, 1, 0, 0, 1, 1,
-0.5915493, -1.729158, -4.111709, 0, 0, 0, 1, 1,
-0.5886775, 1.011978, -1.232093, 0, 0, 0, 1, 1,
-0.586457, 0.2681375, -1.021409, 0, 0, 0, 1, 1,
-0.5853522, -0.4207424, -2.062461, 0, 0, 0, 1, 1,
-0.5833419, -1.688553, -1.180876, 0, 0, 0, 1, 1,
-0.5832607, 0.6570727, -0.3869614, 0, 0, 0, 1, 1,
-0.5781429, -1.410306, -2.939674, 0, 0, 0, 1, 1,
-0.5747244, -0.8136071, -2.006672, 1, 1, 1, 1, 1,
-0.5735146, -0.5560629, -2.220324, 1, 1, 1, 1, 1,
-0.5734181, 0.07720268, -1.949293, 1, 1, 1, 1, 1,
-0.573184, 1.89981, -1.202974, 1, 1, 1, 1, 1,
-0.570025, 0.3781568, -0.9827632, 1, 1, 1, 1, 1,
-0.5673336, 1.133823, -0.485483, 1, 1, 1, 1, 1,
-0.5603102, -0.4893889, -2.509269, 1, 1, 1, 1, 1,
-0.5562972, 1.585487, 0.002496614, 1, 1, 1, 1, 1,
-0.5504741, -0.390002, -2.593089, 1, 1, 1, 1, 1,
-0.5471036, -2.407189, -2.100234, 1, 1, 1, 1, 1,
-0.5416692, -1.524896, -1.953899, 1, 1, 1, 1, 1,
-0.5395001, -0.1367522, -0.2734671, 1, 1, 1, 1, 1,
-0.5387517, -0.9974357, -2.686569, 1, 1, 1, 1, 1,
-0.5359941, -0.5592583, -2.711028, 1, 1, 1, 1, 1,
-0.5304385, -0.3671588, -1.050883, 1, 1, 1, 1, 1,
-0.5263547, -0.3734517, -2.413925, 0, 0, 1, 1, 1,
-0.5227311, -0.6205937, -2.405677, 1, 0, 0, 1, 1,
-0.517248, 1.228208, -1.209111, 1, 0, 0, 1, 1,
-0.5171258, -0.203215, 0.6162069, 1, 0, 0, 1, 1,
-0.5138123, -0.2322427, -2.553694, 1, 0, 0, 1, 1,
-0.5089695, 1.636853, 1.15166, 1, 0, 0, 1, 1,
-0.5080132, -0.531105, -4.491933, 0, 0, 0, 1, 1,
-0.5048069, 1.449721, 1.247583, 0, 0, 0, 1, 1,
-0.5029026, 0.8187153, -1.729875, 0, 0, 0, 1, 1,
-0.4988132, 0.7026381, 1.118668, 0, 0, 0, 1, 1,
-0.4975721, 1.043281, -1.430223, 0, 0, 0, 1, 1,
-0.4938133, 0.7634121, -0.5853358, 0, 0, 0, 1, 1,
-0.4933855, -0.2841978, -1.670849, 0, 0, 0, 1, 1,
-0.4921297, 0.04622259, -0.9034092, 1, 1, 1, 1, 1,
-0.4892744, 0.1509388, -1.209831, 1, 1, 1, 1, 1,
-0.4863536, 0.1706515, -0.5517501, 1, 1, 1, 1, 1,
-0.4855471, -1.212043, -3.087205, 1, 1, 1, 1, 1,
-0.479905, 0.08705737, -1.396025, 1, 1, 1, 1, 1,
-0.479463, -3.197312, -1.875553, 1, 1, 1, 1, 1,
-0.4713762, 0.07154369, -2.165406, 1, 1, 1, 1, 1,
-0.469118, 0.5879434, -0.9945949, 1, 1, 1, 1, 1,
-0.4672983, -0.003613251, -0.9720578, 1, 1, 1, 1, 1,
-0.4616851, 0.2678019, -2.313488, 1, 1, 1, 1, 1,
-0.4599249, -1.65883, -3.588389, 1, 1, 1, 1, 1,
-0.4594621, 0.9665757, 0.5914015, 1, 1, 1, 1, 1,
-0.4579388, -0.009314541, -2.537287, 1, 1, 1, 1, 1,
-0.4501457, -1.282275, -3.073251, 1, 1, 1, 1, 1,
-0.448916, 1.614394, -0.06848118, 1, 1, 1, 1, 1,
-0.4487019, 0.3932423, -1.476482, 0, 0, 1, 1, 1,
-0.4435659, -0.2158648, -1.53044, 1, 0, 0, 1, 1,
-0.4419116, -0.6954575, -2.07059, 1, 0, 0, 1, 1,
-0.4400351, -0.03982823, -1.839205, 1, 0, 0, 1, 1,
-0.4380092, 1.345339, 0.06052862, 1, 0, 0, 1, 1,
-0.4347412, 0.1244803, -0.2736505, 1, 0, 0, 1, 1,
-0.431918, 0.5557864, -0.8857831, 0, 0, 0, 1, 1,
-0.4298881, -0.5410606, -1.336848, 0, 0, 0, 1, 1,
-0.4295236, 0.008496943, -1.7178, 0, 0, 0, 1, 1,
-0.4246185, 0.4118863, -0.3209024, 0, 0, 0, 1, 1,
-0.4174743, 0.1605645, -1.405669, 0, 0, 0, 1, 1,
-0.4149406, -0.309108, -2.75465, 0, 0, 0, 1, 1,
-0.413474, -0.4810373, -2.144378, 0, 0, 0, 1, 1,
-0.4131613, 1.143244, 0.7316893, 1, 1, 1, 1, 1,
-0.4093463, -0.533058, -1.562443, 1, 1, 1, 1, 1,
-0.4044308, -1.768334, -3.880035, 1, 1, 1, 1, 1,
-0.4042632, 1.148331, -0.1704553, 1, 1, 1, 1, 1,
-0.3883094, 0.2927653, -1.973774, 1, 1, 1, 1, 1,
-0.3827476, -0.0563186, -4.344492, 1, 1, 1, 1, 1,
-0.3820329, -1.55043, -2.738683, 1, 1, 1, 1, 1,
-0.3814422, -0.5935563, -2.884143, 1, 1, 1, 1, 1,
-0.3804717, -0.2484262, -2.884916, 1, 1, 1, 1, 1,
-0.3779318, -0.3310988, -2.687975, 1, 1, 1, 1, 1,
-0.3746096, 1.123666, -0.3393254, 1, 1, 1, 1, 1,
-0.3714283, -0.5602294, -2.224863, 1, 1, 1, 1, 1,
-0.3700474, -1.814466, -1.71572, 1, 1, 1, 1, 1,
-0.3691122, -0.3939558, -2.242577, 1, 1, 1, 1, 1,
-0.3675307, 1.237785, -0.3175622, 1, 1, 1, 1, 1,
-0.3624749, 0.2286725, -1.510757, 0, 0, 1, 1, 1,
-0.3617475, -0.4432466, -2.7638, 1, 0, 0, 1, 1,
-0.3614, 0.08132743, -2.363043, 1, 0, 0, 1, 1,
-0.3575334, -0.3600408, -2.626747, 1, 0, 0, 1, 1,
-0.3565387, -0.08589577, -2.164405, 1, 0, 0, 1, 1,
-0.3431524, -1.238695, -2.952309, 1, 0, 0, 1, 1,
-0.3414206, -1.893389, -1.094846, 0, 0, 0, 1, 1,
-0.336099, 0.5766612, 0.2436652, 0, 0, 0, 1, 1,
-0.3349627, 0.1171482, -1.417122, 0, 0, 0, 1, 1,
-0.3315364, 0.8581396, -1.137416, 0, 0, 0, 1, 1,
-0.3311875, 0.374121, -2.564334, 0, 0, 0, 1, 1,
-0.3259329, -0.7752322, -3.087963, 0, 0, 0, 1, 1,
-0.3245783, -0.4621564, -2.712725, 0, 0, 0, 1, 1,
-0.3226694, 0.7441518, -0.1000591, 1, 1, 1, 1, 1,
-0.3220734, 1.838047, -0.2199845, 1, 1, 1, 1, 1,
-0.3209532, -0.2739021, -3.242683, 1, 1, 1, 1, 1,
-0.316359, 0.6162826, -0.6456847, 1, 1, 1, 1, 1,
-0.3134742, 0.1286545, -1.715536, 1, 1, 1, 1, 1,
-0.3131326, -0.3145969, -1.204967, 1, 1, 1, 1, 1,
-0.3126141, 0.7791496, 1.711731, 1, 1, 1, 1, 1,
-0.3124489, -0.599637, -3.367185, 1, 1, 1, 1, 1,
-0.3057235, -0.05893712, -1.19442, 1, 1, 1, 1, 1,
-0.3057152, 0.3858311, -0.4701886, 1, 1, 1, 1, 1,
-0.3025805, 0.2995078, -0.4129475, 1, 1, 1, 1, 1,
-0.299214, -0.9789768, -1.617165, 1, 1, 1, 1, 1,
-0.2941529, -0.424112, -4.129481, 1, 1, 1, 1, 1,
-0.2939777, -1.212676, -2.449385, 1, 1, 1, 1, 1,
-0.2931107, -0.2701024, -4.421199, 1, 1, 1, 1, 1,
-0.2929115, -1.367734, -3.026467, 0, 0, 1, 1, 1,
-0.2927776, -0.6844931, -2.311212, 1, 0, 0, 1, 1,
-0.2924798, -0.5413639, -3.40542, 1, 0, 0, 1, 1,
-0.2875828, 0.109453, -1.081611, 1, 0, 0, 1, 1,
-0.2844242, 0.1942385, -1.030367, 1, 0, 0, 1, 1,
-0.283562, -1.286961, -3.496327, 1, 0, 0, 1, 1,
-0.2823837, -2.785967, -2.812203, 0, 0, 0, 1, 1,
-0.2788438, 0.8118536, 0.07476623, 0, 0, 0, 1, 1,
-0.2712577, -0.8557962, -3.37191, 0, 0, 0, 1, 1,
-0.2687988, -0.5693347, -3.625445, 0, 0, 0, 1, 1,
-0.2680317, 0.938976, -0.5475019, 0, 0, 0, 1, 1,
-0.2625538, 0.357533, -1.111996, 0, 0, 0, 1, 1,
-0.2610647, -0.2541947, -0.8760551, 0, 0, 0, 1, 1,
-0.2597348, 0.1707604, -1.386577, 1, 1, 1, 1, 1,
-0.2574063, -0.6443875, -2.126316, 1, 1, 1, 1, 1,
-0.2538165, 2.197035, -0.6016826, 1, 1, 1, 1, 1,
-0.2513784, -0.3591252, -2.952125, 1, 1, 1, 1, 1,
-0.2505747, 0.01646253, -1.449852, 1, 1, 1, 1, 1,
-0.2502791, -0.7284988, -2.130453, 1, 1, 1, 1, 1,
-0.247917, 1.561241, 0.2430254, 1, 1, 1, 1, 1,
-0.2474928, 0.4817755, -1.634852, 1, 1, 1, 1, 1,
-0.2472427, 0.2680478, -0.668231, 1, 1, 1, 1, 1,
-0.2442634, -0.05288234, -2.334116, 1, 1, 1, 1, 1,
-0.2442057, 0.6590934, -2.003319, 1, 1, 1, 1, 1,
-0.2437308, 1.115967, -0.9147304, 1, 1, 1, 1, 1,
-0.2414742, 0.3686309, -0.03384555, 1, 1, 1, 1, 1,
-0.2405991, -1.433609, -3.778152, 1, 1, 1, 1, 1,
-0.240233, -0.7795443, -3.028211, 1, 1, 1, 1, 1,
-0.2397521, -1.589026, -3.311341, 0, 0, 1, 1, 1,
-0.2395962, -0.4446577, -3.150823, 1, 0, 0, 1, 1,
-0.2331708, -0.0263326, -0.1829226, 1, 0, 0, 1, 1,
-0.2280409, -0.214193, -2.34207, 1, 0, 0, 1, 1,
-0.225035, -2.078945, -2.543812, 1, 0, 0, 1, 1,
-0.2246511, 1.037354, -0.6879455, 1, 0, 0, 1, 1,
-0.2228504, 1.026848, -1.591927, 0, 0, 0, 1, 1,
-0.220655, -0.8883621, -3.930297, 0, 0, 0, 1, 1,
-0.2204757, -0.8121624, -2.648861, 0, 0, 0, 1, 1,
-0.215652, 0.3736743, 0.7514554, 0, 0, 0, 1, 1,
-0.2150809, -0.3960686, -2.401931, 0, 0, 0, 1, 1,
-0.2127286, -0.3160384, -2.5925, 0, 0, 0, 1, 1,
-0.2121387, 1.591632, -0.7403986, 0, 0, 0, 1, 1,
-0.2102901, -1.168348, -4.66368, 1, 1, 1, 1, 1,
-0.2091736, -2.578532, -3.81282, 1, 1, 1, 1, 1,
-0.2020877, 0.1458851, -1.73999, 1, 1, 1, 1, 1,
-0.2015673, 0.05085042, -2.89853, 1, 1, 1, 1, 1,
-0.1997632, 1.290568, 0.02121994, 1, 1, 1, 1, 1,
-0.1990969, 1.62025, 0.1023935, 1, 1, 1, 1, 1,
-0.198892, -1.637807, -4.666754, 1, 1, 1, 1, 1,
-0.1923631, 0.1700016, -0.1157319, 1, 1, 1, 1, 1,
-0.1893208, -0.6182121, -1.395891, 1, 1, 1, 1, 1,
-0.1874071, -0.3623855, -2.307345, 1, 1, 1, 1, 1,
-0.1858829, -1.031233, -4.041911, 1, 1, 1, 1, 1,
-0.1847627, -0.9697057, -3.300578, 1, 1, 1, 1, 1,
-0.1837455, 0.05843409, -1.497032, 1, 1, 1, 1, 1,
-0.1829102, 0.547999, 0.330464, 1, 1, 1, 1, 1,
-0.1773017, 0.6922306, -0.2889313, 1, 1, 1, 1, 1,
-0.1689552, 0.2580526, -0.9792539, 0, 0, 1, 1, 1,
-0.1678396, 0.008757094, -0.9825866, 1, 0, 0, 1, 1,
-0.1641242, -1.879828, -3.833401, 1, 0, 0, 1, 1,
-0.1640473, 0.1362735, -2.665444, 1, 0, 0, 1, 1,
-0.1639366, -0.08926929, -0.971131, 1, 0, 0, 1, 1,
-0.160097, -0.2500052, -3.882258, 1, 0, 0, 1, 1,
-0.1579238, 0.315058, -2.028516, 0, 0, 0, 1, 1,
-0.1570737, -0.04003697, -0.9678818, 0, 0, 0, 1, 1,
-0.1541699, -0.7705523, -1.849528, 0, 0, 0, 1, 1,
-0.1535795, -0.5094551, -1.158322, 0, 0, 0, 1, 1,
-0.1524515, 0.786411, 0.9963849, 0, 0, 0, 1, 1,
-0.1500844, -0.4602555, -2.876009, 0, 0, 0, 1, 1,
-0.1499898, -0.3964761, -0.6778027, 0, 0, 0, 1, 1,
-0.1488161, -0.2896691, -1.877084, 1, 1, 1, 1, 1,
-0.1485854, 0.1272961, -2.147688, 1, 1, 1, 1, 1,
-0.147496, 0.1505861, -1.043842, 1, 1, 1, 1, 1,
-0.1466442, 1.260348, 1.534795, 1, 1, 1, 1, 1,
-0.1422281, 1.552448, 0.8461428, 1, 1, 1, 1, 1,
-0.1410187, 2.465099, -1.23591, 1, 1, 1, 1, 1,
-0.1400556, -1.207349, -1.745918, 1, 1, 1, 1, 1,
-0.1390827, -0.9363645, -1.983589, 1, 1, 1, 1, 1,
-0.1387497, -0.4338826, -3.501426, 1, 1, 1, 1, 1,
-0.1381826, 0.9360795, -1.193719, 1, 1, 1, 1, 1,
-0.1379134, -0.1517748, -1.961301, 1, 1, 1, 1, 1,
-0.1374374, -0.5264415, -3.201914, 1, 1, 1, 1, 1,
-0.1356751, 0.2297454, -0.1222216, 1, 1, 1, 1, 1,
-0.1353665, -0.6952264, -1.625645, 1, 1, 1, 1, 1,
-0.1348463, -0.9042117, -3.319364, 1, 1, 1, 1, 1,
-0.1348428, -0.5626706, -1.99558, 0, 0, 1, 1, 1,
-0.1283579, -0.6782495, -2.298898, 1, 0, 0, 1, 1,
-0.1232795, -1.307077, -2.036678, 1, 0, 0, 1, 1,
-0.1204692, -0.749733, -3.945559, 1, 0, 0, 1, 1,
-0.1195244, 0.6663851, -0.2622952, 1, 0, 0, 1, 1,
-0.1129531, 1.119412, -0.06020957, 1, 0, 0, 1, 1,
-0.1102142, -0.1179675, -3.006068, 0, 0, 0, 1, 1,
-0.1099718, -0.8826261, -2.005136, 0, 0, 0, 1, 1,
-0.1096766, -0.4639278, -2.985194, 0, 0, 0, 1, 1,
-0.1067058, 0.07405814, -1.572471, 0, 0, 0, 1, 1,
-0.1022718, 0.6624317, 1.105946, 0, 0, 0, 1, 1,
-0.100297, 1.218926, -1.371141, 0, 0, 0, 1, 1,
-0.09979632, 1.347803, -1.112246, 0, 0, 0, 1, 1,
-0.09724423, -1.576752, -2.758707, 1, 1, 1, 1, 1,
-0.0964698, -0.8144897, -1.32047, 1, 1, 1, 1, 1,
-0.09626833, 1.653659, -0.8231044, 1, 1, 1, 1, 1,
-0.09617481, -0.5353165, -3.412239, 1, 1, 1, 1, 1,
-0.09406718, -0.4244293, -4.168784, 1, 1, 1, 1, 1,
-0.09085725, -2.646518, -1.42381, 1, 1, 1, 1, 1,
-0.08780367, 0.01159548, 0.0283133, 1, 1, 1, 1, 1,
-0.08755546, -0.5913655, -2.399068, 1, 1, 1, 1, 1,
-0.08521825, -0.1745915, -3.555506, 1, 1, 1, 1, 1,
-0.08343115, 0.01353247, -2.167091, 1, 1, 1, 1, 1,
-0.08235338, -1.180844, -2.111836, 1, 1, 1, 1, 1,
-0.07920565, -1.104301, -3.493277, 1, 1, 1, 1, 1,
-0.07709327, 0.2424289, -0.4231449, 1, 1, 1, 1, 1,
-0.0746432, 0.977241, -0.4755567, 1, 1, 1, 1, 1,
-0.07188504, -0.9918557, -5.19262, 1, 1, 1, 1, 1,
-0.06343325, -0.4781343, -2.936045, 0, 0, 1, 1, 1,
-0.06309506, -0.2750328, -3.151035, 1, 0, 0, 1, 1,
-0.06219911, -0.1669101, -4.872222, 1, 0, 0, 1, 1,
-0.05750106, 0.8576245, 0.2496933, 1, 0, 0, 1, 1,
-0.05596473, -0.3267176, -2.336992, 1, 0, 0, 1, 1,
-0.05344936, -0.5319936, -1.936807, 1, 0, 0, 1, 1,
-0.04822174, -0.07332509, -2.402104, 0, 0, 0, 1, 1,
-0.04729376, -1.091532, -2.375993, 0, 0, 0, 1, 1,
-0.04620514, -0.3132208, -2.696404, 0, 0, 0, 1, 1,
-0.0455663, 1.762005, -0.5451946, 0, 0, 0, 1, 1,
-0.04222153, -1.193229, -2.710463, 0, 0, 0, 1, 1,
-0.03998623, 0.6768268, 1.326482, 0, 0, 0, 1, 1,
-0.03351397, -0.1817724, -1.714462, 0, 0, 0, 1, 1,
-0.03128423, -0.8262872, -4.054526, 1, 1, 1, 1, 1,
-0.02735756, -1.158618, -2.303634, 1, 1, 1, 1, 1,
-0.02685209, 0.4124728, -0.5080248, 1, 1, 1, 1, 1,
-0.02615335, -1.003177, -2.936977, 1, 1, 1, 1, 1,
-0.024941, -0.8509438, -3.872671, 1, 1, 1, 1, 1,
-0.01677538, -0.9381531, -2.173828, 1, 1, 1, 1, 1,
-0.01309321, -1.1995, -2.312579, 1, 1, 1, 1, 1,
-0.005338996, 1.377236, -0.1313788, 1, 1, 1, 1, 1,
-0.001807649, -0.9393118, -2.613623, 1, 1, 1, 1, 1,
0.003671496, 1.060779, 0.5300528, 1, 1, 1, 1, 1,
0.007189183, -0.9772883, 3.997017, 1, 1, 1, 1, 1,
0.01084979, 0.8451909, 1.683756, 1, 1, 1, 1, 1,
0.01317521, -1.738933, 2.833819, 1, 1, 1, 1, 1,
0.01599641, -2.804113, 2.068825, 1, 1, 1, 1, 1,
0.01926405, -0.7692256, 2.302157, 1, 1, 1, 1, 1,
0.01975011, 0.590313, 0.7799274, 0, 0, 1, 1, 1,
0.01995824, 0.08603284, 1.158438, 1, 0, 0, 1, 1,
0.02255108, -2.72706, 3.524117, 1, 0, 0, 1, 1,
0.0260873, 1.312987, -0.8081715, 1, 0, 0, 1, 1,
0.02772703, -0.5326491, 2.396849, 1, 0, 0, 1, 1,
0.02803646, -0.6964182, 4.162009, 1, 0, 0, 1, 1,
0.02884589, 1.948021, 2.277232, 0, 0, 0, 1, 1,
0.02929422, 2.118439, -0.3074423, 0, 0, 0, 1, 1,
0.02969556, -1.261199, 3.520058, 0, 0, 0, 1, 1,
0.03839071, -0.5663568, 2.956466, 0, 0, 0, 1, 1,
0.04437007, 0.9993536, 0.2258113, 0, 0, 0, 1, 1,
0.04447871, -0.6560265, 3.221055, 0, 0, 0, 1, 1,
0.04680232, 0.9283664, -0.6740358, 0, 0, 0, 1, 1,
0.05309469, -0.9804018, 3.534466, 1, 1, 1, 1, 1,
0.05564019, 0.235147, 1.159459, 1, 1, 1, 1, 1,
0.05743125, -0.1269819, 3.034212, 1, 1, 1, 1, 1,
0.05788567, 0.5712765, -1.958004, 1, 1, 1, 1, 1,
0.05794418, 0.6132724, -0.4111576, 1, 1, 1, 1, 1,
0.0639765, -0.7413116, 4.031578, 1, 1, 1, 1, 1,
0.07123855, 0.5375547, -1.012116, 1, 1, 1, 1, 1,
0.0720352, -0.4860073, 3.146882, 1, 1, 1, 1, 1,
0.07272148, 0.2946773, -0.1715849, 1, 1, 1, 1, 1,
0.07503899, 0.3645893, -0.175994, 1, 1, 1, 1, 1,
0.07760784, 1.429019, -0.5713062, 1, 1, 1, 1, 1,
0.07866468, 0.7088989, 0.3281676, 1, 1, 1, 1, 1,
0.08034674, -1.046204, 1.073865, 1, 1, 1, 1, 1,
0.08373933, -0.6184759, 3.740805, 1, 1, 1, 1, 1,
0.08418927, -0.2497496, 1.708429, 1, 1, 1, 1, 1,
0.08556268, -0.9295062, 3.249241, 0, 0, 1, 1, 1,
0.08642861, -1.11735, 3.496488, 1, 0, 0, 1, 1,
0.08737434, 0.3231025, -1.832813, 1, 0, 0, 1, 1,
0.08926161, -0.5547332, 1.830056, 1, 0, 0, 1, 1,
0.09311415, 0.517894, 0.2450971, 1, 0, 0, 1, 1,
0.1015693, 0.5599574, 0.5213283, 1, 0, 0, 1, 1,
0.1049987, 1.010123, 0.7618595, 0, 0, 0, 1, 1,
0.1139772, 0.03941945, 1.961974, 0, 0, 0, 1, 1,
0.116453, 1.299881, 0.1646506, 0, 0, 0, 1, 1,
0.1233008, 0.2070532, 0.4394963, 0, 0, 0, 1, 1,
0.1306723, 0.1439835, 0.2725856, 0, 0, 0, 1, 1,
0.1366831, -0.9479954, 2.279751, 0, 0, 0, 1, 1,
0.1437867, 1.072325, -0.3969944, 0, 0, 0, 1, 1,
0.1453989, 1.962434, -0.1137151, 1, 1, 1, 1, 1,
0.1472653, -0.1473746, 2.247047, 1, 1, 1, 1, 1,
0.1517174, 0.1525498, -0.7166988, 1, 1, 1, 1, 1,
0.1523081, -0.02021548, 2.311954, 1, 1, 1, 1, 1,
0.1567296, -1.560418, 4.170517, 1, 1, 1, 1, 1,
0.1597301, 1.463797, 0.1344811, 1, 1, 1, 1, 1,
0.1624991, 1.41982, 0.6531249, 1, 1, 1, 1, 1,
0.1630241, 1.347371, -0.9842871, 1, 1, 1, 1, 1,
0.1631646, -0.5282007, 3.920776, 1, 1, 1, 1, 1,
0.16361, 2.369911, 0.4135411, 1, 1, 1, 1, 1,
0.1641347, 0.6425494, 1.494937, 1, 1, 1, 1, 1,
0.1652862, 1.704632, 0.3588861, 1, 1, 1, 1, 1,
0.1658229, -0.7485244, 1.564792, 1, 1, 1, 1, 1,
0.1665705, -1.046434, 0.4769113, 1, 1, 1, 1, 1,
0.1682473, 0.3261178, 2.129205, 1, 1, 1, 1, 1,
0.1692368, 1.726873, -0.3787843, 0, 0, 1, 1, 1,
0.1693681, 0.3367395, -0.1816198, 1, 0, 0, 1, 1,
0.1724329, -0.1245512, 2.876709, 1, 0, 0, 1, 1,
0.1790976, -1.316643, 4.467715, 1, 0, 0, 1, 1,
0.1802882, 0.1302847, 0.2091708, 1, 0, 0, 1, 1,
0.1897869, -1.493398, 3.738847, 1, 0, 0, 1, 1,
0.1910519, 1.10182, -0.2120769, 0, 0, 0, 1, 1,
0.1952483, -1.140502, 5.560882, 0, 0, 0, 1, 1,
0.2081908, 0.4587255, 0.6684105, 0, 0, 0, 1, 1,
0.2087035, -0.2555798, 1.901253, 0, 0, 0, 1, 1,
0.2135457, -0.6610817, 2.268295, 0, 0, 0, 1, 1,
0.2153931, 0.9454567, 1.055224, 0, 0, 0, 1, 1,
0.2156009, 0.09536204, 1.6319, 0, 0, 0, 1, 1,
0.2178325, -0.7378461, 3.722107, 1, 1, 1, 1, 1,
0.2211801, -1.23778, 3.803084, 1, 1, 1, 1, 1,
0.2222363, -0.02731928, 1.555258, 1, 1, 1, 1, 1,
0.2225071, 0.4700461, -0.3252469, 1, 1, 1, 1, 1,
0.2254703, 0.9566802, -0.2713905, 1, 1, 1, 1, 1,
0.226702, 2.113427, 0.6051063, 1, 1, 1, 1, 1,
0.2338661, -0.7871748, 3.935698, 1, 1, 1, 1, 1,
0.2367321, -0.2072292, 2.57042, 1, 1, 1, 1, 1,
0.2367361, -0.1088236, 2.727305, 1, 1, 1, 1, 1,
0.2420402, -0.5008163, 2.608367, 1, 1, 1, 1, 1,
0.2426297, -0.1877017, 2.145889, 1, 1, 1, 1, 1,
0.2445336, 1.817694, -0.5437705, 1, 1, 1, 1, 1,
0.245663, -0.6971587, 4.271438, 1, 1, 1, 1, 1,
0.250427, -1.117285, 2.901705, 1, 1, 1, 1, 1,
0.2517771, 0.7182816, 1.349212, 1, 1, 1, 1, 1,
0.2529949, 0.3825619, -0.1712592, 0, 0, 1, 1, 1,
0.2535406, 1.494566, 2.578353, 1, 0, 0, 1, 1,
0.2548129, -0.06999017, 1.243267, 1, 0, 0, 1, 1,
0.2552642, -0.2661065, 2.640369, 1, 0, 0, 1, 1,
0.2555363, 1.067955, -0.6676858, 1, 0, 0, 1, 1,
0.2564961, 0.08082345, 3.105259, 1, 0, 0, 1, 1,
0.2608129, 0.5299854, 1.439114, 0, 0, 0, 1, 1,
0.2610129, -0.4575583, 3.016451, 0, 0, 0, 1, 1,
0.2610138, 1.853505, -1.693354, 0, 0, 0, 1, 1,
0.2617528, -0.1619889, 1.730966, 0, 0, 0, 1, 1,
0.2662832, -0.7299577, 4.882965, 0, 0, 0, 1, 1,
0.2664876, 0.5898552, 2.821187, 0, 0, 0, 1, 1,
0.2673618, -0.698678, 3.674463, 0, 0, 0, 1, 1,
0.2707211, 0.7277758, 0.5983914, 1, 1, 1, 1, 1,
0.272907, 1.360623, 0.7633228, 1, 1, 1, 1, 1,
0.2742124, 1.763294, 0.8146649, 1, 1, 1, 1, 1,
0.2756563, -0.7662168, 3.528073, 1, 1, 1, 1, 1,
0.2760243, -0.0173275, 1.347582, 1, 1, 1, 1, 1,
0.2784401, 1.236901, 1.00857, 1, 1, 1, 1, 1,
0.2803936, -0.07856729, 4.303956, 1, 1, 1, 1, 1,
0.2804823, 0.7993842, 0.894146, 1, 1, 1, 1, 1,
0.2817448, 0.1370253, 2.289033, 1, 1, 1, 1, 1,
0.2817764, 1.188166, -2.405208, 1, 1, 1, 1, 1,
0.2824604, 1.077741, 0.7586025, 1, 1, 1, 1, 1,
0.2888246, 0.2726014, 1.036963, 1, 1, 1, 1, 1,
0.291455, 1.048553, 1.597149, 1, 1, 1, 1, 1,
0.2925672, -0.9838964, 4.447528, 1, 1, 1, 1, 1,
0.2949766, -0.8242814, 1.922683, 1, 1, 1, 1, 1,
0.2976359, -1.081542, 4.70771, 0, 0, 1, 1, 1,
0.2999396, 0.07986035, 0.4867619, 1, 0, 0, 1, 1,
0.3041772, 2.995994, -0.05465313, 1, 0, 0, 1, 1,
0.3163163, 1.446017, 1.607473, 1, 0, 0, 1, 1,
0.317087, 0.698567, 0.9817165, 1, 0, 0, 1, 1,
0.3230966, 2.998253, 0.3685687, 1, 0, 0, 1, 1,
0.3252952, -0.6163721, 2.847694, 0, 0, 0, 1, 1,
0.3283877, 0.5549668, -0.3164506, 0, 0, 0, 1, 1,
0.3307841, 0.6309208, -0.7686867, 0, 0, 0, 1, 1,
0.3371738, 0.4693876, -0.8184446, 0, 0, 0, 1, 1,
0.3377717, -1.072687, 3.211336, 0, 0, 0, 1, 1,
0.3388778, 1.198936, 0.2528336, 0, 0, 0, 1, 1,
0.3431991, 2.366568, 0.6412396, 0, 0, 0, 1, 1,
0.345042, -0.252264, 3.3188, 1, 1, 1, 1, 1,
0.3546304, 1.301477, 0.5760219, 1, 1, 1, 1, 1,
0.3553011, -0.05362378, 2.729964, 1, 1, 1, 1, 1,
0.3593247, 1.415034, 1.082276, 1, 1, 1, 1, 1,
0.3594614, 1.451837, 0.4306708, 1, 1, 1, 1, 1,
0.3612637, 0.3527901, 0.9333268, 1, 1, 1, 1, 1,
0.3633368, -0.01465269, 1.063913, 1, 1, 1, 1, 1,
0.3655537, 1.838619, -1.23205, 1, 1, 1, 1, 1,
0.3700637, -1.507015, 3.166867, 1, 1, 1, 1, 1,
0.3738208, 0.1377276, 1.51345, 1, 1, 1, 1, 1,
0.3773378, 0.3571516, 0.5972281, 1, 1, 1, 1, 1,
0.3787329, 2.651158, 0.5092048, 1, 1, 1, 1, 1,
0.3802364, 1.109873, -0.00794642, 1, 1, 1, 1, 1,
0.3804829, -0.8424, 1.39365, 1, 1, 1, 1, 1,
0.3853521, -1.172429, 3.092082, 1, 1, 1, 1, 1,
0.3884355, -1.740474, 2.217919, 0, 0, 1, 1, 1,
0.3958301, 3.03596, 0.3462689, 1, 0, 0, 1, 1,
0.4017972, -0.8556235, 4.664748, 1, 0, 0, 1, 1,
0.4099836, 0.1404897, 3.323302, 1, 0, 0, 1, 1,
0.4102643, 1.915082, -0.2564794, 1, 0, 0, 1, 1,
0.4125955, 1.65661, 0.7682059, 1, 0, 0, 1, 1,
0.4134628, 1.050205, 0.3776827, 0, 0, 0, 1, 1,
0.4151815, 0.6844066, -0.08501052, 0, 0, 0, 1, 1,
0.4202666, -0.8663561, 1.630092, 0, 0, 0, 1, 1,
0.4248903, -1.558139, 2.977726, 0, 0, 0, 1, 1,
0.4272344, -0.9202495, 2.489893, 0, 0, 0, 1, 1,
0.432797, 0.1541928, 0.2368732, 0, 0, 0, 1, 1,
0.435069, 0.9983584, 2.061768, 0, 0, 0, 1, 1,
0.4351251, 0.1227776, 0.2258425, 1, 1, 1, 1, 1,
0.4419495, -0.3608913, 4.585873, 1, 1, 1, 1, 1,
0.4429598, 1.453769, 0.5889304, 1, 1, 1, 1, 1,
0.4466251, -0.2621036, 2.940589, 1, 1, 1, 1, 1,
0.4482968, 0.8592923, 1.967307, 1, 1, 1, 1, 1,
0.4501016, -0.1349777, 1.301974, 1, 1, 1, 1, 1,
0.4537964, 1.10564, -0.9417226, 1, 1, 1, 1, 1,
0.460368, -0.07454345, 2.41542, 1, 1, 1, 1, 1,
0.4643537, 0.1276667, 1.7355, 1, 1, 1, 1, 1,
0.4651466, -0.1322335, 1.864387, 1, 1, 1, 1, 1,
0.4684332, -0.1069467, 0.05981301, 1, 1, 1, 1, 1,
0.4700036, 1.486832, 1.351969, 1, 1, 1, 1, 1,
0.472356, -0.8595484, 4.143248, 1, 1, 1, 1, 1,
0.4760561, -1.710277, 2.859433, 1, 1, 1, 1, 1,
0.4782063, 0.5175281, 1.28886, 1, 1, 1, 1, 1,
0.4790878, 1.247498, 0.7639655, 0, 0, 1, 1, 1,
0.4835088, -2.336277, 1.599166, 1, 0, 0, 1, 1,
0.4907721, -0.1112195, 1.406775, 1, 0, 0, 1, 1,
0.4928409, 0.3830793, 0.3215941, 1, 0, 0, 1, 1,
0.4940801, 1.180667, -0.2959701, 1, 0, 0, 1, 1,
0.4982519, 2.182978, -0.06074517, 1, 0, 0, 1, 1,
0.4993709, -0.5744679, 3.191516, 0, 0, 0, 1, 1,
0.5013202, 1.197069, -0.6564946, 0, 0, 0, 1, 1,
0.5018241, -1.316293, 4.429252, 0, 0, 0, 1, 1,
0.5019065, 0.8720996, 0.5221571, 0, 0, 0, 1, 1,
0.5035937, 0.8003307, -0.8924292, 0, 0, 0, 1, 1,
0.5057459, -1.212212, 3.635572, 0, 0, 0, 1, 1,
0.5063388, -0.5718709, 1.688278, 0, 0, 0, 1, 1,
0.5071763, -0.3024724, 1.15167, 1, 1, 1, 1, 1,
0.5078388, -0.04678499, 2.545258, 1, 1, 1, 1, 1,
0.5094882, 0.765708, 0.1251624, 1, 1, 1, 1, 1,
0.5129709, 0.2940911, 1.406476, 1, 1, 1, 1, 1,
0.5169957, -0.5140219, 3.127988, 1, 1, 1, 1, 1,
0.5202507, 0.7773758, 2.361208, 1, 1, 1, 1, 1,
0.5227451, -0.7356213, 2.465512, 1, 1, 1, 1, 1,
0.5287296, 0.07536906, 0.3170638, 1, 1, 1, 1, 1,
0.5364539, -0.138085, 4.927519, 1, 1, 1, 1, 1,
0.5368792, 0.06907637, 1.783444, 1, 1, 1, 1, 1,
0.5426015, -1.110742, 2.157293, 1, 1, 1, 1, 1,
0.5478045, 0.5640517, -0.6097282, 1, 1, 1, 1, 1,
0.5488645, 0.9549035, 1.364393, 1, 1, 1, 1, 1,
0.5527145, 0.5114436, 0.8226777, 1, 1, 1, 1, 1,
0.5529226, -0.4353753, 1.329365, 1, 1, 1, 1, 1,
0.5573869, -0.5729876, 3.05763, 0, 0, 1, 1, 1,
0.5579242, -0.2784569, 1.687134, 1, 0, 0, 1, 1,
0.5580462, 1.073277, -0.7279212, 1, 0, 0, 1, 1,
0.5592764, 0.3014608, 1.526269, 1, 0, 0, 1, 1,
0.5637958, -0.1050731, 2.057276, 1, 0, 0, 1, 1,
0.5672764, -0.3787194, 0.841154, 1, 0, 0, 1, 1,
0.5694804, -1.953448, 3.962291, 0, 0, 0, 1, 1,
0.5697238, 0.8957297, -0.5028898, 0, 0, 0, 1, 1,
0.5714334, -0.4638322, 2.793221, 0, 0, 0, 1, 1,
0.5746337, -1.314284, 3.746645, 0, 0, 0, 1, 1,
0.5810907, -0.5029644, 2.876174, 0, 0, 0, 1, 1,
0.5819193, 0.1879676, -1.189809, 0, 0, 0, 1, 1,
0.5895615, -0.9242976, 0.82546, 0, 0, 0, 1, 1,
0.5899982, 1.893218, 0.2378908, 1, 1, 1, 1, 1,
0.5918021, -0.4328656, 3.488207, 1, 1, 1, 1, 1,
0.5955513, -1.213083, 1.089859, 1, 1, 1, 1, 1,
0.5956964, 1.09726, 1.535972, 1, 1, 1, 1, 1,
0.6023491, -0.8384688, 1.026836, 1, 1, 1, 1, 1,
0.609534, -0.5190076, 2.314498, 1, 1, 1, 1, 1,
0.6099962, -0.9933369, 3.15339, 1, 1, 1, 1, 1,
0.6171343, 0.04502087, 2.141725, 1, 1, 1, 1, 1,
0.6212024, 0.4824713, 0.3617966, 1, 1, 1, 1, 1,
0.6241155, -1.486054, 3.213065, 1, 1, 1, 1, 1,
0.6279264, -1.193602, 2.756839, 1, 1, 1, 1, 1,
0.6291032, -1.180987, 1.931756, 1, 1, 1, 1, 1,
0.6297007, 1.59384, 0.2311456, 1, 1, 1, 1, 1,
0.6389558, 0.03263685, 0.6213612, 1, 1, 1, 1, 1,
0.6409166, -1.000553, 2.790575, 1, 1, 1, 1, 1,
0.6426754, -0.4349095, 2.586074, 0, 0, 1, 1, 1,
0.6458203, 0.5523753, 2.379417, 1, 0, 0, 1, 1,
0.6501793, -1.446438, 2.767408, 1, 0, 0, 1, 1,
0.6516171, 0.4296004, 2.114698, 1, 0, 0, 1, 1,
0.6519985, -0.3600877, 2.539972, 1, 0, 0, 1, 1,
0.6545362, -0.6695559, 0.8061358, 1, 0, 0, 1, 1,
0.6569216, 0.2312372, -0.2440608, 0, 0, 0, 1, 1,
0.6606862, 2.678349, -0.6566455, 0, 0, 0, 1, 1,
0.6615878, 0.3775538, 0.3873298, 0, 0, 0, 1, 1,
0.662367, 1.077292, 1.426196, 0, 0, 0, 1, 1,
0.6659822, 0.2345679, 2.448633, 0, 0, 0, 1, 1,
0.6693256, -0.7595945, 2.548004, 0, 0, 0, 1, 1,
0.6767487, 1.921091, 0.1517873, 0, 0, 0, 1, 1,
0.6791736, 0.3016152, 0.6367048, 1, 1, 1, 1, 1,
0.6843959, 0.3458674, 0.1943403, 1, 1, 1, 1, 1,
0.6867124, 0.9623154, 0.7091607, 1, 1, 1, 1, 1,
0.6890311, -0.6240205, 1.590798, 1, 1, 1, 1, 1,
0.6891076, 2.23621, -0.1282632, 1, 1, 1, 1, 1,
0.693388, 1.297097, -1.653592, 1, 1, 1, 1, 1,
0.6951877, -1.252378, 3.120957, 1, 1, 1, 1, 1,
0.6992208, 0.5559605, 1.706774, 1, 1, 1, 1, 1,
0.7002544, 1.201802, 0.4190601, 1, 1, 1, 1, 1,
0.704411, 1.060095, -1.410907, 1, 1, 1, 1, 1,
0.7055302, -1.061445, 3.588497, 1, 1, 1, 1, 1,
0.7066175, -2.419515, 2.969777, 1, 1, 1, 1, 1,
0.7180755, -0.547093, 3.201828, 1, 1, 1, 1, 1,
0.7190728, 0.5324396, 1.987685, 1, 1, 1, 1, 1,
0.7212057, 0.8570244, 1.595011, 1, 1, 1, 1, 1,
0.7219403, -2.229888, 2.497201, 0, 0, 1, 1, 1,
0.7248793, 0.6028162, 0.4809341, 1, 0, 0, 1, 1,
0.7268285, 0.9396799, 1.784111, 1, 0, 0, 1, 1,
0.7269356, 0.359707, -0.2552967, 1, 0, 0, 1, 1,
0.7277505, -1.090841, 2.157856, 1, 0, 0, 1, 1,
0.7287454, -1.630705, 2.009012, 1, 0, 0, 1, 1,
0.7304965, -0.3937912, 0.7110557, 0, 0, 0, 1, 1,
0.7338579, 0.4781497, -0.6447679, 0, 0, 0, 1, 1,
0.7371472, 2.353574, -0.4654814, 0, 0, 0, 1, 1,
0.7457398, 0.7625869, 1.330273, 0, 0, 0, 1, 1,
0.7503463, 0.03891529, 2.663385, 0, 0, 0, 1, 1,
0.7518972, 0.9707769, 1.107352, 0, 0, 0, 1, 1,
0.7519656, -0.6050535, 2.450196, 0, 0, 0, 1, 1,
0.7522138, -1.180581, 2.468605, 1, 1, 1, 1, 1,
0.7662255, 0.1863892, 0.6755099, 1, 1, 1, 1, 1,
0.7703174, 1.387999, -0.0105723, 1, 1, 1, 1, 1,
0.7743046, -0.8277462, 1.692871, 1, 1, 1, 1, 1,
0.7748638, -0.1760358, 2.086698, 1, 1, 1, 1, 1,
0.7801151, 1.066146, 1.905463, 1, 1, 1, 1, 1,
0.7832956, -0.09457662, 0.733167, 1, 1, 1, 1, 1,
0.7964734, -0.6884869, 5.743464, 1, 1, 1, 1, 1,
0.7970101, -0.371922, 3.501506, 1, 1, 1, 1, 1,
0.797519, 0.5076308, -0.01023356, 1, 1, 1, 1, 1,
0.7977484, -1.371799, 2.229078, 1, 1, 1, 1, 1,
0.8045522, -0.6548482, 2.070492, 1, 1, 1, 1, 1,
0.8052005, 0.1640342, 1.534723, 1, 1, 1, 1, 1,
0.8086239, -0.2049379, 1.197833, 1, 1, 1, 1, 1,
0.8103141, 0.03253573, 0.8084779, 1, 1, 1, 1, 1,
0.8139747, 0.1575362, 0.6995494, 0, 0, 1, 1, 1,
0.8147464, -0.5982274, 1.394283, 1, 0, 0, 1, 1,
0.8207055, 0.901636, 1.26404, 1, 0, 0, 1, 1,
0.8366838, -0.6939799, 1.665556, 1, 0, 0, 1, 1,
0.8377882, -0.1787303, 2.833945, 1, 0, 0, 1, 1,
0.8396553, -1.031557, 1.770967, 1, 0, 0, 1, 1,
0.8398219, 0.5807592, 2.046003, 0, 0, 0, 1, 1,
0.8418033, -0.2666286, 2.053307, 0, 0, 0, 1, 1,
0.8518546, 0.8700312, 0.304584, 0, 0, 0, 1, 1,
0.8529244, 0.4509716, 1.702382, 0, 0, 0, 1, 1,
0.8553226, -0.1247176, 0.4407963, 0, 0, 0, 1, 1,
0.8554037, 1.450768, -0.3827226, 0, 0, 0, 1, 1,
0.8636522, -1.289363, 2.470536, 0, 0, 0, 1, 1,
0.8685106, 0.6341577, 1.879864, 1, 1, 1, 1, 1,
0.8708386, -0.8307898, 1.745397, 1, 1, 1, 1, 1,
0.8710473, -1.007658, 2.398525, 1, 1, 1, 1, 1,
0.8736092, 0.7008089, -0.434221, 1, 1, 1, 1, 1,
0.8749636, 0.3184185, 1.033904, 1, 1, 1, 1, 1,
0.8786667, 0.6381086, -0.2512567, 1, 1, 1, 1, 1,
0.8834353, -1.210238, 2.908246, 1, 1, 1, 1, 1,
0.8851957, -1.750717, 2.205318, 1, 1, 1, 1, 1,
0.8890538, -0.7582939, 2.143829, 1, 1, 1, 1, 1,
0.8963886, -1.262243, 3.861391, 1, 1, 1, 1, 1,
0.896975, -0.8345084, 2.018518, 1, 1, 1, 1, 1,
0.900349, -0.104375, 2.844631, 1, 1, 1, 1, 1,
0.909039, 0.106358, 1.260941, 1, 1, 1, 1, 1,
0.9108951, 0.5519666, 0.8805699, 1, 1, 1, 1, 1,
0.9206921, 1.034503, -1.01157, 1, 1, 1, 1, 1,
0.9225165, 0.5068265, 1.660645, 0, 0, 1, 1, 1,
0.9237238, -0.2807315, 2.25295, 1, 0, 0, 1, 1,
0.9243227, -1.098959, -0.2040276, 1, 0, 0, 1, 1,
0.9264876, -0.7922402, 1.925145, 1, 0, 0, 1, 1,
0.930651, -0.4606886, -0.8596566, 1, 0, 0, 1, 1,
0.9386874, -1.150796, 3.092546, 1, 0, 0, 1, 1,
0.9412961, -0.5258421, 1.452022, 0, 0, 0, 1, 1,
0.9431344, 1.119811, 0.7744889, 0, 0, 0, 1, 1,
0.9459057, -1.641504, 2.289023, 0, 0, 0, 1, 1,
0.9481285, -0.3728514, 0.7717062, 0, 0, 0, 1, 1,
0.9580211, 0.1944314, 2.301257, 0, 0, 0, 1, 1,
0.9643288, -0.3378893, 0.3984473, 0, 0, 0, 1, 1,
0.9669731, -0.1599045, 2.464294, 0, 0, 0, 1, 1,
0.9677693, 1.078121, 1.069475, 1, 1, 1, 1, 1,
0.9694309, -0.4490196, -0.1311588, 1, 1, 1, 1, 1,
0.9851421, 0.6328539, 0.08554932, 1, 1, 1, 1, 1,
0.9872833, -0.1534156, 0.9532443, 1, 1, 1, 1, 1,
0.9875209, -0.9287499, 1.753982, 1, 1, 1, 1, 1,
1.004046, -0.3465073, 0.4904094, 1, 1, 1, 1, 1,
1.009168, -2.279929, 2.684914, 1, 1, 1, 1, 1,
1.011708, 0.2726208, -0.0280851, 1, 1, 1, 1, 1,
1.018125, -0.4926774, 3.338125, 1, 1, 1, 1, 1,
1.021472, -0.412674, 2.951571, 1, 1, 1, 1, 1,
1.023867, -0.623234, 2.429984, 1, 1, 1, 1, 1,
1.026212, -0.8204053, 1.987763, 1, 1, 1, 1, 1,
1.026253, 1.084158, 0.08578824, 1, 1, 1, 1, 1,
1.03086, 0.9130943, 0.9089738, 1, 1, 1, 1, 1,
1.042178, 0.8781798, 1.395666, 1, 1, 1, 1, 1,
1.061068, -1.035392, 1.170035, 0, 0, 1, 1, 1,
1.063692, -1.200191, 2.657165, 1, 0, 0, 1, 1,
1.083258, 0.299576, 1.177768, 1, 0, 0, 1, 1,
1.084407, 0.2066091, 2.123262, 1, 0, 0, 1, 1,
1.091262, 0.8732894, 1.22656, 1, 0, 0, 1, 1,
1.093429, -1.482362, 2.652167, 1, 0, 0, 1, 1,
1.108126, -1.638533, 4.306581, 0, 0, 0, 1, 1,
1.112169, 1.27774, 1.202954, 0, 0, 0, 1, 1,
1.113748, 0.8114183, 1.320371, 0, 0, 0, 1, 1,
1.115815, 0.175304, 1.92122, 0, 0, 0, 1, 1,
1.119325, 0.8689842, -0.2214911, 0, 0, 0, 1, 1,
1.126411, 1.866602, 0.02767352, 0, 0, 0, 1, 1,
1.132287, -2.018839, 3.034354, 0, 0, 0, 1, 1,
1.133484, -0.4510356, 1.138317, 1, 1, 1, 1, 1,
1.142158, 1.948935, 0.3137259, 1, 1, 1, 1, 1,
1.143522, -0.3511691, 2.797102, 1, 1, 1, 1, 1,
1.14454, -0.2632369, 1.499554, 1, 1, 1, 1, 1,
1.14499, -0.7710389, 3.108709, 1, 1, 1, 1, 1,
1.154261, 0.2840117, 1.461366, 1, 1, 1, 1, 1,
1.161167, 1.206983, -0.07707796, 1, 1, 1, 1, 1,
1.167439, -1.093654, 2.584801, 1, 1, 1, 1, 1,
1.168358, -0.3684751, 3.201779, 1, 1, 1, 1, 1,
1.181068, -1.326598, 0.8995489, 1, 1, 1, 1, 1,
1.181839, -1.093694, 2.416122, 1, 1, 1, 1, 1,
1.182671, -0.5767661, 3.634425, 1, 1, 1, 1, 1,
1.196017, -0.6542596, 3.185209, 1, 1, 1, 1, 1,
1.196535, -0.5328252, 1.184675, 1, 1, 1, 1, 1,
1.202314, 1.286665, 0.5812577, 1, 1, 1, 1, 1,
1.206994, -0.9620691, 2.616509, 0, 0, 1, 1, 1,
1.218192, -2.130754, 2.453146, 1, 0, 0, 1, 1,
1.221122, 1.331362, 0.3620026, 1, 0, 0, 1, 1,
1.224936, 0.8348178, 3.153625, 1, 0, 0, 1, 1,
1.22607, 0.3062372, 0.813198, 1, 0, 0, 1, 1,
1.226073, 1.623868, 0.315232, 1, 0, 0, 1, 1,
1.244301, -0.4460043, 2.026142, 0, 0, 0, 1, 1,
1.264873, -0.6803904, 2.068913, 0, 0, 0, 1, 1,
1.267371, -0.2502441, 1.900724, 0, 0, 0, 1, 1,
1.279783, 1.781652, -0.2055963, 0, 0, 0, 1, 1,
1.284407, -0.6388467, 3.473447, 0, 0, 0, 1, 1,
1.286227, -0.5812929, 2.545375, 0, 0, 0, 1, 1,
1.286303, 1.504808, 0.6811779, 0, 0, 0, 1, 1,
1.298109, -1.342553, 2.058114, 1, 1, 1, 1, 1,
1.299346, -0.8102668, 2.550396, 1, 1, 1, 1, 1,
1.3048, -0.9507022, 3.1238, 1, 1, 1, 1, 1,
1.309346, 0.1319193, 1.381223, 1, 1, 1, 1, 1,
1.313697, -0.9699115, 2.840384, 1, 1, 1, 1, 1,
1.322559, 0.1471775, 1.800629, 1, 1, 1, 1, 1,
1.323212, 0.3421402, 0.972412, 1, 1, 1, 1, 1,
1.343063, 0.3538623, 1.571852, 1, 1, 1, 1, 1,
1.344601, 0.1061114, 2.035052, 1, 1, 1, 1, 1,
1.349567, 0.6947395, 0.8938132, 1, 1, 1, 1, 1,
1.350011, -0.2864458, 0.9243948, 1, 1, 1, 1, 1,
1.356458, 0.3813983, 1.242872, 1, 1, 1, 1, 1,
1.363906, -0.7220814, 3.488121, 1, 1, 1, 1, 1,
1.36446, -0.544687, 2.523468, 1, 1, 1, 1, 1,
1.366643, 1.924868, -1.61515, 1, 1, 1, 1, 1,
1.368983, 0.133547, -0.6111062, 0, 0, 1, 1, 1,
1.370428, 0.8292159, 2.175032, 1, 0, 0, 1, 1,
1.37088, -0.2563214, 1.194176, 1, 0, 0, 1, 1,
1.370951, -0.2262998, 2.21379, 1, 0, 0, 1, 1,
1.372612, 0.6023734, 0.8512796, 1, 0, 0, 1, 1,
1.380682, 0.009858321, 2.806904, 1, 0, 0, 1, 1,
1.389407, 0.4763364, 1.094204, 0, 0, 0, 1, 1,
1.39834, 1.670008, 0.1615678, 0, 0, 0, 1, 1,
1.418743, 1.34546, -0.2585398, 0, 0, 0, 1, 1,
1.440899, -1.762273, 2.015886, 0, 0, 0, 1, 1,
1.456512, -1.003274, 2.047023, 0, 0, 0, 1, 1,
1.471701, 0.5417945, 2.816843, 0, 0, 0, 1, 1,
1.471937, 1.641276, 0.1046422, 0, 0, 0, 1, 1,
1.492356, -1.181623, 0.809715, 1, 1, 1, 1, 1,
1.499212, -0.6675295, 2.327485, 1, 1, 1, 1, 1,
1.511673, -0.4727182, 1.615139, 1, 1, 1, 1, 1,
1.519538, -0.4835066, 1.806657, 1, 1, 1, 1, 1,
1.523679, -0.7381067, 2.685052, 1, 1, 1, 1, 1,
1.537313, -0.4623147, 0.160595, 1, 1, 1, 1, 1,
1.541867, 0.7901244, 2.350598, 1, 1, 1, 1, 1,
1.542121, -0.4867865, 2.714912, 1, 1, 1, 1, 1,
1.54329, 2.80075, 0.8793438, 1, 1, 1, 1, 1,
1.561363, 0.05219011, 1.944215, 1, 1, 1, 1, 1,
1.562988, -0.2240881, 1.387893, 1, 1, 1, 1, 1,
1.566333, -0.1131885, 2.879133, 1, 1, 1, 1, 1,
1.584198, 0.03090199, 2.78568, 1, 1, 1, 1, 1,
1.586261, -1.057774, 2.511576, 1, 1, 1, 1, 1,
1.588747, 0.6697752, 0.1032893, 1, 1, 1, 1, 1,
1.588881, -0.4505466, 2.054209, 0, 0, 1, 1, 1,
1.609151, 1.91787, 0.7266318, 1, 0, 0, 1, 1,
1.610907, 0.1574592, 1.912568, 1, 0, 0, 1, 1,
1.642253, -0.2589632, 0.2311098, 1, 0, 0, 1, 1,
1.672985, -0.1679703, 3.100825, 1, 0, 0, 1, 1,
1.697848, 1.561081, 0.7338648, 1, 0, 0, 1, 1,
1.709527, 0.6410658, -0.6561494, 0, 0, 0, 1, 1,
1.743389, 0.8396093, 0.9041066, 0, 0, 0, 1, 1,
1.743585, 0.2817583, 2.70355, 0, 0, 0, 1, 1,
1.758998, 1.353085, 1.785764, 0, 0, 0, 1, 1,
1.796551, -0.8041615, 1.564522, 0, 0, 0, 1, 1,
1.80823, -0.5598147, 1.833156, 0, 0, 0, 1, 1,
1.848645, -0.2780284, 1.178938, 0, 0, 0, 1, 1,
1.85706, 3.003741, 0.1025475, 1, 1, 1, 1, 1,
1.857272, 0.5955522, 0.4065449, 1, 1, 1, 1, 1,
1.868634, -1.257213, 2.219648, 1, 1, 1, 1, 1,
1.874656, 0.7487776, 2.396684, 1, 1, 1, 1, 1,
1.880814, -1.642283, 3.036182, 1, 1, 1, 1, 1,
1.883616, -1.389672, 2.52839, 1, 1, 1, 1, 1,
1.890115, 0.7396722, 2.499417, 1, 1, 1, 1, 1,
1.902213, 0.9603454, 0.1821689, 1, 1, 1, 1, 1,
1.917499, 1.023073, 2.434133, 1, 1, 1, 1, 1,
1.961583, -0.8465205, 3.24691, 1, 1, 1, 1, 1,
1.965053, 0.406736, 2.86976, 1, 1, 1, 1, 1,
1.980161, -0.7674632, 1.299904, 1, 1, 1, 1, 1,
1.985335, 0.7731694, 0.735338, 1, 1, 1, 1, 1,
1.992116, -2.759427, 2.315735, 1, 1, 1, 1, 1,
1.997934, 0.3587325, 0.07915468, 1, 1, 1, 1, 1,
2.092315, -0.8569056, 1.960095, 0, 0, 1, 1, 1,
2.110855, 2.110204, 2.034182, 1, 0, 0, 1, 1,
2.120084, -0.2929761, 1.855627, 1, 0, 0, 1, 1,
2.162786, -0.6216916, 1.076532, 1, 0, 0, 1, 1,
2.166067, -0.7522979, 2.155531, 1, 0, 0, 1, 1,
2.18018, -0.56425, 3.075761, 1, 0, 0, 1, 1,
2.189758, 0.5214193, 1.622434, 0, 0, 0, 1, 1,
2.243556, 0.1596267, 2.186418, 0, 0, 0, 1, 1,
2.295352, 0.635029, -0.9606422, 0, 0, 0, 1, 1,
2.320717, 1.835723, 1.415268, 0, 0, 0, 1, 1,
2.323122, -0.4265105, 1.274402, 0, 0, 0, 1, 1,
2.362734, 1.247326, 1.028314, 0, 0, 0, 1, 1,
2.565136, -0.8541074, 2.892425, 0, 0, 0, 1, 1,
2.60488, -0.5403522, -0.1673728, 1, 1, 1, 1, 1,
2.651357, 0.7717839, 1.316192, 1, 1, 1, 1, 1,
2.656873, -1.038547, 1.465708, 1, 1, 1, 1, 1,
2.762208, -0.04425627, 0.3817475, 1, 1, 1, 1, 1,
2.801344, -0.5187952, 1.525742, 1, 1, 1, 1, 1,
2.868073, -1.493534, 2.64303, 1, 1, 1, 1, 1,
2.988986, 0.8130946, 0.7372097, 1, 1, 1, 1, 1
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
var radius = 9.590719;
var distance = 33.687;
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
mvMatrix.translate( 0.03573596, 0.08067608, -0.1957152 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.687);
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
