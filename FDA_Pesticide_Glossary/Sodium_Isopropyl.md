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
-3.60306, 0.4612712, -3.146611, 1, 0, 0, 1,
-3.316417, -0.4288124, -2.555944, 1, 0.007843138, 0, 1,
-3.031364, 0.3728316, -2.738402, 1, 0.01176471, 0, 1,
-3.024371, -0.04438962, -3.723032, 1, 0.01960784, 0, 1,
-2.997453, -1.626913, -0.6912707, 1, 0.02352941, 0, 1,
-2.892794, -0.4101409, -1.125678, 1, 0.03137255, 0, 1,
-2.607759, -0.7638331, -0.5343546, 1, 0.03529412, 0, 1,
-2.597037, 1.272434, -3.104368, 1, 0.04313726, 0, 1,
-2.401282, 0.9110556, -1.253902, 1, 0.04705882, 0, 1,
-2.323783, -0.7103205, -3.087242, 1, 0.05490196, 0, 1,
-2.272747, -0.06550432, -1.518462, 1, 0.05882353, 0, 1,
-2.240275, -0.2793894, 0.06250522, 1, 0.06666667, 0, 1,
-2.188318, 0.6745482, -1.234312, 1, 0.07058824, 0, 1,
-2.166549, -1.106166, -0.7002265, 1, 0.07843138, 0, 1,
-2.142364, -1.541188, -2.1305, 1, 0.08235294, 0, 1,
-2.04941, -0.2812552, -0.8438234, 1, 0.09019608, 0, 1,
-2.047235, -0.6148274, -2.004296, 1, 0.09411765, 0, 1,
-2.017232, 0.5673526, -2.231749, 1, 0.1019608, 0, 1,
-1.999925, -0.2284258, -1.01781, 1, 0.1098039, 0, 1,
-1.984138, -0.322672, -2.369222, 1, 0.1137255, 0, 1,
-1.960048, -1.39307, -2.129448, 1, 0.1215686, 0, 1,
-1.958821, -0.3995606, -1.472383, 1, 0.1254902, 0, 1,
-1.923161, -0.5474564, -0.3977575, 1, 0.1333333, 0, 1,
-1.914864, -1.70296, -2.861397, 1, 0.1372549, 0, 1,
-1.907414, 1.452662, -0.5713871, 1, 0.145098, 0, 1,
-1.900919, 1.722242, -0.1104649, 1, 0.1490196, 0, 1,
-1.868254, -0.6302451, -2.835534, 1, 0.1568628, 0, 1,
-1.852988, -0.5485584, -0.32873, 1, 0.1607843, 0, 1,
-1.851913, 0.4352079, -2.565104, 1, 0.1686275, 0, 1,
-1.851304, -1.423837, -2.516332, 1, 0.172549, 0, 1,
-1.830982, 0.8250319, -0.3858162, 1, 0.1803922, 0, 1,
-1.828907, 1.34531, -0.5861349, 1, 0.1843137, 0, 1,
-1.817456, -0.885936, -1.366716, 1, 0.1921569, 0, 1,
-1.804194, 0.7877787, -0.8463743, 1, 0.1960784, 0, 1,
-1.79612, -0.1435979, -0.2417618, 1, 0.2039216, 0, 1,
-1.78402, -0.02020453, -2.482245, 1, 0.2117647, 0, 1,
-1.783128, 0.1753288, -1.645839, 1, 0.2156863, 0, 1,
-1.780889, -0.448119, -2.240178, 1, 0.2235294, 0, 1,
-1.776505, 0.09835672, -0.3747877, 1, 0.227451, 0, 1,
-1.755723, -0.5525113, -3.417969, 1, 0.2352941, 0, 1,
-1.748638, 0.8269219, -0.6411539, 1, 0.2392157, 0, 1,
-1.731715, -1.240941, -4.831892, 1, 0.2470588, 0, 1,
-1.730564, 0.5485145, 0.4587872, 1, 0.2509804, 0, 1,
-1.712564, -0.3837557, -1.706907, 1, 0.2588235, 0, 1,
-1.711932, -1.004156, -1.758748, 1, 0.2627451, 0, 1,
-1.710825, -0.2324203, -1.563146, 1, 0.2705882, 0, 1,
-1.702494, -0.3402856, -1.565408, 1, 0.2745098, 0, 1,
-1.69847, -0.1363411, -2.457557, 1, 0.282353, 0, 1,
-1.694932, 0.4204669, -3.467147, 1, 0.2862745, 0, 1,
-1.694591, 0.318295, 1.091191, 1, 0.2941177, 0, 1,
-1.687582, -1.353605, -2.990989, 1, 0.3019608, 0, 1,
-1.687066, -0.6070716, -3.061373, 1, 0.3058824, 0, 1,
-1.682503, 2.109247, -1.51551, 1, 0.3137255, 0, 1,
-1.682208, 1.256506, 0.4958999, 1, 0.3176471, 0, 1,
-1.663586, -0.6584994, -2.829817, 1, 0.3254902, 0, 1,
-1.658572, 0.3717166, -0.506541, 1, 0.3294118, 0, 1,
-1.621515, 0.02005918, -0.7285525, 1, 0.3372549, 0, 1,
-1.615169, -1.683369, -2.192866, 1, 0.3411765, 0, 1,
-1.61036, -0.4480272, -0.4985405, 1, 0.3490196, 0, 1,
-1.598347, -0.9816912, -2.764442, 1, 0.3529412, 0, 1,
-1.590734, 0.4036359, -2.158035, 1, 0.3607843, 0, 1,
-1.582707, -1.173138, -1.946841, 1, 0.3647059, 0, 1,
-1.582349, -1.88295, -1.290928, 1, 0.372549, 0, 1,
-1.572758, -0.8255875, -1.910428, 1, 0.3764706, 0, 1,
-1.57009, 0.5123626, -0.9376972, 1, 0.3843137, 0, 1,
-1.568952, 2.040017, -0.6853778, 1, 0.3882353, 0, 1,
-1.515139, -0.4396367, -4.070468, 1, 0.3960784, 0, 1,
-1.511244, -0.4490734, -1.387811, 1, 0.4039216, 0, 1,
-1.498906, -0.4480081, -2.688568, 1, 0.4078431, 0, 1,
-1.490229, -0.3943252, -2.038392, 1, 0.4156863, 0, 1,
-1.484609, 0.9536667, -1.225924, 1, 0.4196078, 0, 1,
-1.482344, 0.5366411, -1.614332, 1, 0.427451, 0, 1,
-1.478697, 1.770076, -2.025623, 1, 0.4313726, 0, 1,
-1.456146, -2.123053, -2.237752, 1, 0.4392157, 0, 1,
-1.454735, -0.3832363, -2.435062, 1, 0.4431373, 0, 1,
-1.451312, -0.5392674, -1.810961, 1, 0.4509804, 0, 1,
-1.441877, -1.817542, -1.902485, 1, 0.454902, 0, 1,
-1.434194, -0.121765, -1.666101, 1, 0.4627451, 0, 1,
-1.4249, 0.771304, -1.118846, 1, 0.4666667, 0, 1,
-1.411282, -0.7380183, -1.756514, 1, 0.4745098, 0, 1,
-1.406545, 0.4647009, -1.488984, 1, 0.4784314, 0, 1,
-1.406462, -1.856515, -3.370593, 1, 0.4862745, 0, 1,
-1.371018, 0.5798754, -1.529929, 1, 0.4901961, 0, 1,
-1.368717, 0.3548447, 0.4137203, 1, 0.4980392, 0, 1,
-1.366165, 1.268375, -0.5071751, 1, 0.5058824, 0, 1,
-1.363212, -0.5894518, -3.431058, 1, 0.509804, 0, 1,
-1.355892, -0.7431443, -2.087461, 1, 0.5176471, 0, 1,
-1.353833, -0.4078149, -1.550237, 1, 0.5215687, 0, 1,
-1.352833, -2.071426, -1.995308, 1, 0.5294118, 0, 1,
-1.352037, 0.2105432, -4.671226, 1, 0.5333334, 0, 1,
-1.348568, -0.1625202, -2.003684, 1, 0.5411765, 0, 1,
-1.343913, -0.7183424, -0.3663629, 1, 0.5450981, 0, 1,
-1.340611, 0.4719918, -0.01769152, 1, 0.5529412, 0, 1,
-1.340293, 0.8340347, -0.7808923, 1, 0.5568628, 0, 1,
-1.339647, -1.621622, -1.446461, 1, 0.5647059, 0, 1,
-1.334545, -0.1370501, -3.088686, 1, 0.5686275, 0, 1,
-1.326037, 1.885154, -0.954787, 1, 0.5764706, 0, 1,
-1.321026, 2.164947, 0.5041593, 1, 0.5803922, 0, 1,
-1.314644, 0.3263915, -1.657837, 1, 0.5882353, 0, 1,
-1.310138, 0.3291771, -1.375874, 1, 0.5921569, 0, 1,
-1.300652, -0.05719401, -1.104567, 1, 0.6, 0, 1,
-1.296886, 1.181671, 0.02965668, 1, 0.6078432, 0, 1,
-1.288032, 0.8124428, -0.2879161, 1, 0.6117647, 0, 1,
-1.276322, -0.7833961, -3.412036, 1, 0.6196079, 0, 1,
-1.275638, 0.6853623, -1.80847, 1, 0.6235294, 0, 1,
-1.275379, 1.843681, 0.2295976, 1, 0.6313726, 0, 1,
-1.273666, -1.275595, -3.350484, 1, 0.6352941, 0, 1,
-1.267976, 0.5397823, -1.276384, 1, 0.6431373, 0, 1,
-1.267971, -0.8192191, -1.962794, 1, 0.6470588, 0, 1,
-1.267937, 1.257746, 0.6524311, 1, 0.654902, 0, 1,
-1.260714, 0.1955418, 0.2093269, 1, 0.6588235, 0, 1,
-1.257648, 0.3096475, -2.982982, 1, 0.6666667, 0, 1,
-1.256537, -0.6164738, -0.5823017, 1, 0.6705883, 0, 1,
-1.249191, -1.425436, -2.365965, 1, 0.6784314, 0, 1,
-1.244672, 0.01243545, -0.04772191, 1, 0.682353, 0, 1,
-1.23544, -0.10429, -1.897306, 1, 0.6901961, 0, 1,
-1.222746, -0.7610402, -1.176818, 1, 0.6941177, 0, 1,
-1.215297, 0.3026996, -1.40859, 1, 0.7019608, 0, 1,
-1.214122, -0.4317352, -2.916815, 1, 0.7098039, 0, 1,
-1.212995, 0.1001188, -0.9719998, 1, 0.7137255, 0, 1,
-1.211715, 0.3807119, -1.410284, 1, 0.7215686, 0, 1,
-1.210583, 0.9987081, -0.3561858, 1, 0.7254902, 0, 1,
-1.208056, -0.4311219, -2.881327, 1, 0.7333333, 0, 1,
-1.206525, -1.80379, -3.429713, 1, 0.7372549, 0, 1,
-1.203193, 0.2559073, -1.234191, 1, 0.7450981, 0, 1,
-1.201043, 1.195471, -2.190835, 1, 0.7490196, 0, 1,
-1.199291, -2.031482, -1.772525, 1, 0.7568628, 0, 1,
-1.194251, -0.2129686, -0.4315567, 1, 0.7607843, 0, 1,
-1.179604, -1.499969, -2.393534, 1, 0.7686275, 0, 1,
-1.17108, -0.8767122, -2.67205, 1, 0.772549, 0, 1,
-1.170618, -1.245228, -1.669952, 1, 0.7803922, 0, 1,
-1.16995, -0.6304061, -2.127069, 1, 0.7843137, 0, 1,
-1.163142, 1.13451, 0.3499047, 1, 0.7921569, 0, 1,
-1.157671, -1.425893, -2.828034, 1, 0.7960784, 0, 1,
-1.157377, -0.9872612, -2.131693, 1, 0.8039216, 0, 1,
-1.146193, -0.003581815, -0.1735726, 1, 0.8117647, 0, 1,
-1.145224, 1.96048, 1.064721, 1, 0.8156863, 0, 1,
-1.143894, 0.8802186, -1.486572, 1, 0.8235294, 0, 1,
-1.141366, 0.0491613, -2.617991, 1, 0.827451, 0, 1,
-1.132378, 0.4563678, -0.7735932, 1, 0.8352941, 0, 1,
-1.127999, -0.01278646, -1.244185, 1, 0.8392157, 0, 1,
-1.12569, -0.7558329, -2.344131, 1, 0.8470588, 0, 1,
-1.124734, 1.300378, -0.758613, 1, 0.8509804, 0, 1,
-1.124019, -2.366726, -3.56801, 1, 0.8588235, 0, 1,
-1.122589, 1.325445, -0.5291733, 1, 0.8627451, 0, 1,
-1.120007, 1.552976, -0.09946554, 1, 0.8705882, 0, 1,
-1.112559, -1.289797, -0.4595971, 1, 0.8745098, 0, 1,
-1.104886, -1.002291, -1.664208, 1, 0.8823529, 0, 1,
-1.098421, -1.418908, -3.792669, 1, 0.8862745, 0, 1,
-1.09295, -0.7106754, -1.454175, 1, 0.8941177, 0, 1,
-1.079317, 0.4539329, -2.03704, 1, 0.8980392, 0, 1,
-1.074671, -1.093746, -2.372721, 1, 0.9058824, 0, 1,
-1.070434, 1.320669, -1.3759, 1, 0.9137255, 0, 1,
-1.060042, -2.015224, -2.837882, 1, 0.9176471, 0, 1,
-1.052281, 1.052587, 0.2760205, 1, 0.9254902, 0, 1,
-1.048934, 1.265869, 1.436735, 1, 0.9294118, 0, 1,
-1.044944, -1.516526, -2.122288, 1, 0.9372549, 0, 1,
-1.041232, 0.6407821, -0.1523295, 1, 0.9411765, 0, 1,
-1.039819, 0.4864797, -2.013899, 1, 0.9490196, 0, 1,
-1.032467, 2.630823, -0.1605081, 1, 0.9529412, 0, 1,
-1.031878, -0.7962219, -2.102924, 1, 0.9607843, 0, 1,
-1.007176, 0.5059549, -1.171591, 1, 0.9647059, 0, 1,
-1.00383, 0.06880653, -0.9373259, 1, 0.972549, 0, 1,
-1.001204, -0.4712135, -1.989642, 1, 0.9764706, 0, 1,
-0.9988305, 0.9292011, -1.909174, 1, 0.9843137, 0, 1,
-0.9976797, -0.41044, -2.280719, 1, 0.9882353, 0, 1,
-0.9942482, -0.7543341, -2.936201, 1, 0.9960784, 0, 1,
-0.990039, 0.6012613, -0.9157777, 0.9960784, 1, 0, 1,
-0.9771901, 0.2478372, -2.56053, 0.9921569, 1, 0, 1,
-0.9751583, -1.548981, -3.567774, 0.9843137, 1, 0, 1,
-0.9635277, 0.8861127, -0.4960724, 0.9803922, 1, 0, 1,
-0.9578651, 0.009132624, -0.5577191, 0.972549, 1, 0, 1,
-0.9573882, -0.4984416, -2.478941, 0.9686275, 1, 0, 1,
-0.9429427, -1.548348, -2.632482, 0.9607843, 1, 0, 1,
-0.9420953, -0.7792724, -2.844771, 0.9568627, 1, 0, 1,
-0.939617, -0.6624582, -3.229352, 0.9490196, 1, 0, 1,
-0.9320216, 1.580077, 1.25247, 0.945098, 1, 0, 1,
-0.9318035, -0.2047201, -2.385308, 0.9372549, 1, 0, 1,
-0.9298483, -0.1535181, 0.01933085, 0.9333333, 1, 0, 1,
-0.9293677, 0.2087067, -2.539949, 0.9254902, 1, 0, 1,
-0.9273104, 1.61657, -0.1358067, 0.9215686, 1, 0, 1,
-0.9268814, 0.3941089, -0.03759628, 0.9137255, 1, 0, 1,
-0.9268292, -0.3531355, -2.3237, 0.9098039, 1, 0, 1,
-0.9211462, -1.239955, -4.009955, 0.9019608, 1, 0, 1,
-0.9182451, -0.03046632, -1.053267, 0.8941177, 1, 0, 1,
-0.9179673, 1.532338, -0.3729087, 0.8901961, 1, 0, 1,
-0.9171035, 1.245022, -0.7355027, 0.8823529, 1, 0, 1,
-0.9170792, -1.125449, -3.480682, 0.8784314, 1, 0, 1,
-0.915848, 0.6444778, -2.426015, 0.8705882, 1, 0, 1,
-0.9157052, -0.5875072, -1.562561, 0.8666667, 1, 0, 1,
-0.9126845, 0.584026, 0.203362, 0.8588235, 1, 0, 1,
-0.912162, 0.1819948, 0.5372832, 0.854902, 1, 0, 1,
-0.9044547, 1.153171, -0.01467252, 0.8470588, 1, 0, 1,
-0.9040207, 0.5586278, -0.7964115, 0.8431373, 1, 0, 1,
-0.8989536, 1.003314, -0.4635039, 0.8352941, 1, 0, 1,
-0.8963941, -0.160642, -1.575356, 0.8313726, 1, 0, 1,
-0.8924209, -0.3947313, -1.081806, 0.8235294, 1, 0, 1,
-0.8835903, 0.7101864, 0.4765223, 0.8196079, 1, 0, 1,
-0.8830693, 0.3978221, -0.449315, 0.8117647, 1, 0, 1,
-0.8824546, 0.3945476, -1.344154, 0.8078431, 1, 0, 1,
-0.881481, 0.4708849, -3.256855, 0.8, 1, 0, 1,
-0.8767323, 2.212657, -1.576176, 0.7921569, 1, 0, 1,
-0.87626, -0.473766, -2.040332, 0.7882353, 1, 0, 1,
-0.8681233, 0.7350751, -0.4797578, 0.7803922, 1, 0, 1,
-0.8598488, -0.7251843, -3.115057, 0.7764706, 1, 0, 1,
-0.8579578, 0.3371845, 0.2975399, 0.7686275, 1, 0, 1,
-0.8578115, 0.4288125, -0.7509478, 0.7647059, 1, 0, 1,
-0.8535448, -1.428288, -2.911168, 0.7568628, 1, 0, 1,
-0.8477731, 0.8473584, -1.378894, 0.7529412, 1, 0, 1,
-0.847246, -0.197006, -1.895527, 0.7450981, 1, 0, 1,
-0.8466707, -0.4872871, -2.498008, 0.7411765, 1, 0, 1,
-0.845417, 0.6011401, -1.808632, 0.7333333, 1, 0, 1,
-0.843235, -1.165492, -0.6436049, 0.7294118, 1, 0, 1,
-0.8399256, -0.3437897, -2.490966, 0.7215686, 1, 0, 1,
-0.8339369, -0.8313006, -3.731319, 0.7176471, 1, 0, 1,
-0.8317493, -1.80407, -2.617723, 0.7098039, 1, 0, 1,
-0.8317267, -0.4468358, -2.239724, 0.7058824, 1, 0, 1,
-0.8255907, 0.180506, 0.9155945, 0.6980392, 1, 0, 1,
-0.8218153, 0.7264161, -0.4138417, 0.6901961, 1, 0, 1,
-0.8125997, 0.04601628, -0.8285096, 0.6862745, 1, 0, 1,
-0.8119716, 0.1465839, -0.6430359, 0.6784314, 1, 0, 1,
-0.8103072, -0.3707358, -2.489686, 0.6745098, 1, 0, 1,
-0.8085029, 1.834408, 0.5387353, 0.6666667, 1, 0, 1,
-0.805245, -1.337453, -3.236478, 0.6627451, 1, 0, 1,
-0.7999418, 0.4101711, 1.279016, 0.654902, 1, 0, 1,
-0.7954229, -2.078955, -1.647013, 0.6509804, 1, 0, 1,
-0.7913576, -0.1575592, 0.2788164, 0.6431373, 1, 0, 1,
-0.7912759, 1.8357, -0.2491836, 0.6392157, 1, 0, 1,
-0.7890844, 0.5045776, -0.2368283, 0.6313726, 1, 0, 1,
-0.7845863, -0.4007936, -3.347207, 0.627451, 1, 0, 1,
-0.7805313, -0.7569995, -4.357342, 0.6196079, 1, 0, 1,
-0.7775858, 0.2994339, -1.039128, 0.6156863, 1, 0, 1,
-0.775613, -1.211757, -1.417924, 0.6078432, 1, 0, 1,
-0.7748634, -2.417113, -3.154389, 0.6039216, 1, 0, 1,
-0.7716528, -0.7275366, -3.426512, 0.5960785, 1, 0, 1,
-0.7690527, -0.5419641, -1.863155, 0.5882353, 1, 0, 1,
-0.7524087, -0.4515953, -3.184612, 0.5843138, 1, 0, 1,
-0.7514183, 0.7410196, -0.1474185, 0.5764706, 1, 0, 1,
-0.7498118, 1.751894, -1.75801, 0.572549, 1, 0, 1,
-0.7431275, -0.1518163, 0.9409277, 0.5647059, 1, 0, 1,
-0.7405537, -1.770062, -2.703053, 0.5607843, 1, 0, 1,
-0.7400581, 0.7010814, -0.7478534, 0.5529412, 1, 0, 1,
-0.7366375, 0.973427, -0.7152112, 0.5490196, 1, 0, 1,
-0.7277825, -0.3538359, -2.708933, 0.5411765, 1, 0, 1,
-0.7276277, -0.0705035, -1.747738, 0.5372549, 1, 0, 1,
-0.7080984, 0.3922506, 0.4684304, 0.5294118, 1, 0, 1,
-0.7076736, -1.316603, -4.223999, 0.5254902, 1, 0, 1,
-0.7046356, -1.807892, -4.139343, 0.5176471, 1, 0, 1,
-0.697948, 0.2071453, -2.704854, 0.5137255, 1, 0, 1,
-0.6943476, 0.3739453, 0.009672942, 0.5058824, 1, 0, 1,
-0.6930185, 0.4617845, -2.942337, 0.5019608, 1, 0, 1,
-0.6898094, -2.056092, -1.068223, 0.4941176, 1, 0, 1,
-0.6850583, 0.4987989, -0.6519964, 0.4862745, 1, 0, 1,
-0.682961, 0.694168, -1.440408, 0.4823529, 1, 0, 1,
-0.6829416, -1.245736, -1.100847, 0.4745098, 1, 0, 1,
-0.679602, -0.03467411, -0.8735947, 0.4705882, 1, 0, 1,
-0.678091, 0.4820267, -0.7213509, 0.4627451, 1, 0, 1,
-0.6778839, -0.8257111, -2.892745, 0.4588235, 1, 0, 1,
-0.6759675, -0.2217726, -3.22575, 0.4509804, 1, 0, 1,
-0.6714604, -1.439797, -3.231304, 0.4470588, 1, 0, 1,
-0.6709371, -0.7204673, -1.118771, 0.4392157, 1, 0, 1,
-0.6696993, -1.298435, -2.436444, 0.4352941, 1, 0, 1,
-0.6670192, -0.8759465, -2.086608, 0.427451, 1, 0, 1,
-0.6608418, -0.8906739, -1.075902, 0.4235294, 1, 0, 1,
-0.6588472, 0.7500356, -1.250242, 0.4156863, 1, 0, 1,
-0.6541123, 1.489947, -1.06573, 0.4117647, 1, 0, 1,
-0.6536555, 1.447262, -0.6154492, 0.4039216, 1, 0, 1,
-0.6521772, 0.9072289, -0.08338501, 0.3960784, 1, 0, 1,
-0.6429095, 0.6605386, -0.9386014, 0.3921569, 1, 0, 1,
-0.6428769, 1.054831, -1.675597, 0.3843137, 1, 0, 1,
-0.6370044, 1.720815, -0.971738, 0.3803922, 1, 0, 1,
-0.6338851, 0.7714233, 0.464307, 0.372549, 1, 0, 1,
-0.6316742, -1.251111, -2.452008, 0.3686275, 1, 0, 1,
-0.6307334, 2.036378, -0.2993638, 0.3607843, 1, 0, 1,
-0.6291399, 1.013048, -0.7251571, 0.3568628, 1, 0, 1,
-0.6273691, 2.690371, 0.7568535, 0.3490196, 1, 0, 1,
-0.6260981, 0.9053722, -0.9444171, 0.345098, 1, 0, 1,
-0.6258698, -2.621762, -3.13097, 0.3372549, 1, 0, 1,
-0.618572, -0.06961465, -1.226678, 0.3333333, 1, 0, 1,
-0.6143795, 1.066865, -0.8038771, 0.3254902, 1, 0, 1,
-0.6071492, 0.9292974, -2.1044, 0.3215686, 1, 0, 1,
-0.6065398, 0.8089385, -0.1162426, 0.3137255, 1, 0, 1,
-0.6055288, 0.4679526, -0.3269853, 0.3098039, 1, 0, 1,
-0.6049061, -0.04876805, -1.112814, 0.3019608, 1, 0, 1,
-0.5972276, -0.09424817, -1.559113, 0.2941177, 1, 0, 1,
-0.5944629, 1.326868, -0.8080859, 0.2901961, 1, 0, 1,
-0.5845295, 0.03914748, -1.919407, 0.282353, 1, 0, 1,
-0.5785767, 1.057156, -0.9998147, 0.2784314, 1, 0, 1,
-0.5783393, -1.107589, -4.671652, 0.2705882, 1, 0, 1,
-0.5754065, 1.093847, -0.7250997, 0.2666667, 1, 0, 1,
-0.5733974, 0.7923254, -0.531963, 0.2588235, 1, 0, 1,
-0.5675623, -0.2837748, -1.937213, 0.254902, 1, 0, 1,
-0.5634413, -0.7420145, -2.766285, 0.2470588, 1, 0, 1,
-0.56314, 0.4631901, -1.591872, 0.2431373, 1, 0, 1,
-0.5585126, -0.4987698, -1.410882, 0.2352941, 1, 0, 1,
-0.5572482, -1.093145, -3.632398, 0.2313726, 1, 0, 1,
-0.552427, -0.5876456, -1.246096, 0.2235294, 1, 0, 1,
-0.5486073, 0.1248985, -1.120449, 0.2196078, 1, 0, 1,
-0.5476371, -0.430631, -4.24146, 0.2117647, 1, 0, 1,
-0.5473441, 0.768773, -2.516729, 0.2078431, 1, 0, 1,
-0.546692, 1.424242, -0.7860463, 0.2, 1, 0, 1,
-0.546133, 0.1013303, -2.031913, 0.1921569, 1, 0, 1,
-0.5360107, 0.1092738, -2.565382, 0.1882353, 1, 0, 1,
-0.5350294, 0.808665, -0.7082559, 0.1803922, 1, 0, 1,
-0.5339847, 0.04689511, -1.562927, 0.1764706, 1, 0, 1,
-0.5339825, 0.1155455, -1.465324, 0.1686275, 1, 0, 1,
-0.5328155, 1.115732, 0.3705378, 0.1647059, 1, 0, 1,
-0.5306718, -1.739161, -0.8539042, 0.1568628, 1, 0, 1,
-0.5301527, 0.7461357, -1.003313, 0.1529412, 1, 0, 1,
-0.5184659, 1.540968, -0.9283473, 0.145098, 1, 0, 1,
-0.5168305, 0.8985689, -0.5455544, 0.1411765, 1, 0, 1,
-0.5124513, 0.6419427, 0.1074795, 0.1333333, 1, 0, 1,
-0.5121667, 0.08374988, -2.384941, 0.1294118, 1, 0, 1,
-0.5033286, -2.118601, -3.043125, 0.1215686, 1, 0, 1,
-0.5031909, -1.394526, -3.182268, 0.1176471, 1, 0, 1,
-0.4988846, -1.775862, -2.529923, 0.1098039, 1, 0, 1,
-0.4952285, -0.8144974, -1.224492, 0.1058824, 1, 0, 1,
-0.4923933, 0.3334806, -1.705505, 0.09803922, 1, 0, 1,
-0.4921119, -0.7998492, -4.24202, 0.09019608, 1, 0, 1,
-0.4919233, -1.409135, -3.935097, 0.08627451, 1, 0, 1,
-0.4912724, -1.160697, -3.109749, 0.07843138, 1, 0, 1,
-0.4877723, 0.2283067, -1.844812, 0.07450981, 1, 0, 1,
-0.4850616, -0.8841538, -4.158888, 0.06666667, 1, 0, 1,
-0.4824018, -0.4952355, -3.015137, 0.0627451, 1, 0, 1,
-0.4797865, 0.7495399, -1.963691, 0.05490196, 1, 0, 1,
-0.4762066, 1.333236, -1.618112, 0.05098039, 1, 0, 1,
-0.4756933, -1.208724, -4.536493, 0.04313726, 1, 0, 1,
-0.4747106, 0.08391587, -2.314759, 0.03921569, 1, 0, 1,
-0.4687833, 0.7834615, -0.7608883, 0.03137255, 1, 0, 1,
-0.4678115, 2.260104, -0.1254419, 0.02745098, 1, 0, 1,
-0.4672492, -0.2348428, -3.159795, 0.01960784, 1, 0, 1,
-0.464596, -0.3521225, -2.303022, 0.01568628, 1, 0, 1,
-0.4633403, 0.7886161, 0.7202419, 0.007843138, 1, 0, 1,
-0.4557992, -0.7936749, -3.040663, 0.003921569, 1, 0, 1,
-0.4551057, 0.34781, -2.24361, 0, 1, 0.003921569, 1,
-0.4548808, -0.49443, -2.503298, 0, 1, 0.01176471, 1,
-0.4543073, 1.005786, 1.601894, 0, 1, 0.01568628, 1,
-0.4537148, 0.2328173, -2.435686, 0, 1, 0.02352941, 1,
-0.4513584, -0.6352462, -4.462162, 0, 1, 0.02745098, 1,
-0.4387762, -1.674253, -1.250749, 0, 1, 0.03529412, 1,
-0.4387024, 0.5222113, -1.702664, 0, 1, 0.03921569, 1,
-0.4312922, -0.4234874, -1.158036, 0, 1, 0.04705882, 1,
-0.4310828, 1.247445, -1.438651, 0, 1, 0.05098039, 1,
-0.4302518, 0.8119298, 0.2549025, 0, 1, 0.05882353, 1,
-0.4283346, -1.781399, -3.198005, 0, 1, 0.0627451, 1,
-0.4239121, -1.493162, -1.934042, 0, 1, 0.07058824, 1,
-0.4193018, -0.032489, -1.558157, 0, 1, 0.07450981, 1,
-0.409088, 0.5852549, -1.289859, 0, 1, 0.08235294, 1,
-0.4036797, -0.6650906, -1.826729, 0, 1, 0.08627451, 1,
-0.4002216, 0.1294576, -1.921491, 0, 1, 0.09411765, 1,
-0.3988965, -0.2804601, -2.354903, 0, 1, 0.1019608, 1,
-0.388021, 0.2012332, 0.4580792, 0, 1, 0.1058824, 1,
-0.3816265, 0.1152592, -0.6555067, 0, 1, 0.1137255, 1,
-0.3803212, -0.4204381, -0.9973205, 0, 1, 0.1176471, 1,
-0.380015, -0.1244601, -1.450597, 0, 1, 0.1254902, 1,
-0.3761053, 0.9475842, -1.071127, 0, 1, 0.1294118, 1,
-0.3743273, -0.5271897, -2.103578, 0, 1, 0.1372549, 1,
-0.3679869, -1.165372, -1.864209, 0, 1, 0.1411765, 1,
-0.3656764, -0.5569126, -4.063018, 0, 1, 0.1490196, 1,
-0.3584547, -0.88652, -2.55833, 0, 1, 0.1529412, 1,
-0.3517738, -0.303266, -3.346301, 0, 1, 0.1607843, 1,
-0.3504433, -0.08576868, -1.532874, 0, 1, 0.1647059, 1,
-0.348944, 0.2207943, -0.57991, 0, 1, 0.172549, 1,
-0.3415511, 1.109767, -0.1452309, 0, 1, 0.1764706, 1,
-0.3404352, 0.1289248, -1.501029, 0, 1, 0.1843137, 1,
-0.3403949, 0.5224503, -0.7263435, 0, 1, 0.1882353, 1,
-0.3399028, 1.878415, 0.5265855, 0, 1, 0.1960784, 1,
-0.3351501, 0.4421671, 0.1122414, 0, 1, 0.2039216, 1,
-0.3325706, -1.156453, -3.27558, 0, 1, 0.2078431, 1,
-0.3323902, -2.449368, -2.027257, 0, 1, 0.2156863, 1,
-0.3304592, 0.05688323, -1.905606, 0, 1, 0.2196078, 1,
-0.3299607, -2.094033, -4.877029, 0, 1, 0.227451, 1,
-0.3287064, -0.3799143, -0.8710929, 0, 1, 0.2313726, 1,
-0.3286866, 1.112499, 0.01446005, 0, 1, 0.2392157, 1,
-0.3266916, 1.370269, -0.4232827, 0, 1, 0.2431373, 1,
-0.3266549, -1.248715, -3.517996, 0, 1, 0.2509804, 1,
-0.3251016, -0.6196752, -3.207695, 0, 1, 0.254902, 1,
-0.3226272, -1.144521, -3.757099, 0, 1, 0.2627451, 1,
-0.3176714, 0.8524997, 0.8817514, 0, 1, 0.2666667, 1,
-0.3121087, 0.8798169, -0.3023869, 0, 1, 0.2745098, 1,
-0.312021, 1.286061, 0.07735923, 0, 1, 0.2784314, 1,
-0.3102922, 2.43333, -0.2552921, 0, 1, 0.2862745, 1,
-0.3083163, 0.2974086, -0.1566857, 0, 1, 0.2901961, 1,
-0.3020548, 0.4289369, -1.373259, 0, 1, 0.2980392, 1,
-0.301465, -0.09891485, -3.375911, 0, 1, 0.3058824, 1,
-0.2994419, 0.6383309, -0.9189586, 0, 1, 0.3098039, 1,
-0.296768, -0.768208, -3.346358, 0, 1, 0.3176471, 1,
-0.2946699, 1.595019, -0.5294731, 0, 1, 0.3215686, 1,
-0.292343, 0.4708593, -0.2890155, 0, 1, 0.3294118, 1,
-0.2909058, 0.150318, -1.136804, 0, 1, 0.3333333, 1,
-0.2904768, 2.1577, -0.4077452, 0, 1, 0.3411765, 1,
-0.2814775, -0.7500042, -3.365154, 0, 1, 0.345098, 1,
-0.2788777, 1.548282, -1.788993, 0, 1, 0.3529412, 1,
-0.2634621, 0.5413682, 0.3584818, 0, 1, 0.3568628, 1,
-0.2628687, -3.511906, -1.789794, 0, 1, 0.3647059, 1,
-0.2575033, 0.6794881, -1.074587, 0, 1, 0.3686275, 1,
-0.2574655, -0.4280746, -2.212711, 0, 1, 0.3764706, 1,
-0.2552397, 0.6102399, -1.166288, 0, 1, 0.3803922, 1,
-0.2544637, 2.053721, -0.3309695, 0, 1, 0.3882353, 1,
-0.254392, -1.579124, -3.153692, 0, 1, 0.3921569, 1,
-0.2523582, 0.4333712, -0.8491899, 0, 1, 0.4, 1,
-0.2512512, 0.3025528, -1.788417, 0, 1, 0.4078431, 1,
-0.2497874, -1.171336, -3.305182, 0, 1, 0.4117647, 1,
-0.2486089, 1.377851, 0.1166723, 0, 1, 0.4196078, 1,
-0.246426, 0.9232242, -0.2687877, 0, 1, 0.4235294, 1,
-0.2441412, 0.2096653, -1.590537, 0, 1, 0.4313726, 1,
-0.2388594, 0.4185838, -3.139834, 0, 1, 0.4352941, 1,
-0.2364637, -0.5274762, -2.145893, 0, 1, 0.4431373, 1,
-0.2355028, -0.1149584, -2.114689, 0, 1, 0.4470588, 1,
-0.2352903, -0.2808606, -4.13799, 0, 1, 0.454902, 1,
-0.2352805, -1.70112, -2.567579, 0, 1, 0.4588235, 1,
-0.2323922, 0.4385866, 0.6584775, 0, 1, 0.4666667, 1,
-0.2291392, -0.4460142, -3.739248, 0, 1, 0.4705882, 1,
-0.2282953, -0.5604744, -2.607014, 0, 1, 0.4784314, 1,
-0.2251703, -0.2025845, -2.729333, 0, 1, 0.4823529, 1,
-0.2170115, -1.386789, -2.774837, 0, 1, 0.4901961, 1,
-0.2152137, -2.653166, -3.663679, 0, 1, 0.4941176, 1,
-0.2136245, -1.181157, -4.339359, 0, 1, 0.5019608, 1,
-0.2115757, 0.448485, -0.1553364, 0, 1, 0.509804, 1,
-0.2094311, 0.5607749, -0.4489973, 0, 1, 0.5137255, 1,
-0.2063339, -1.793542, -2.787333, 0, 1, 0.5215687, 1,
-0.2003734, -0.8681843, -1.568134, 0, 1, 0.5254902, 1,
-0.2000021, -0.2690352, -1.091271, 0, 1, 0.5333334, 1,
-0.198657, -0.1674849, -2.051407, 0, 1, 0.5372549, 1,
-0.1979823, 0.315696, -0.4912744, 0, 1, 0.5450981, 1,
-0.1964639, 0.6844233, -1.122805, 0, 1, 0.5490196, 1,
-0.1964621, -0.7256774, -1.508131, 0, 1, 0.5568628, 1,
-0.1948247, 0.9575132, 0.8646745, 0, 1, 0.5607843, 1,
-0.1888795, 0.9537734, -1.217656, 0, 1, 0.5686275, 1,
-0.188645, -0.01283383, -2.962842, 0, 1, 0.572549, 1,
-0.1877117, 0.4652874, -0.4071295, 0, 1, 0.5803922, 1,
-0.1840737, 0.4756427, 0.04433127, 0, 1, 0.5843138, 1,
-0.1833255, 1.535793, 0.7786723, 0, 1, 0.5921569, 1,
-0.1820449, -1.930031, -1.887197, 0, 1, 0.5960785, 1,
-0.179344, 1.393659, 0.2436772, 0, 1, 0.6039216, 1,
-0.1789106, 1.362185, -0.6421231, 0, 1, 0.6117647, 1,
-0.1788052, 0.3960919, -0.7097679, 0, 1, 0.6156863, 1,
-0.1753705, -1.363138, -2.976436, 0, 1, 0.6235294, 1,
-0.1714688, 2.103587, 0.04338055, 0, 1, 0.627451, 1,
-0.1675122, -1.083528, -2.588556, 0, 1, 0.6352941, 1,
-0.1661239, -0.1574761, -0.9160153, 0, 1, 0.6392157, 1,
-0.1592001, -1.308996, -2.348776, 0, 1, 0.6470588, 1,
-0.1569065, 0.1441173, -0.6671285, 0, 1, 0.6509804, 1,
-0.1543407, -1.368222, -2.906903, 0, 1, 0.6588235, 1,
-0.1527873, 1.323715, -1.51161, 0, 1, 0.6627451, 1,
-0.1522847, 0.0569646, -1.63456, 0, 1, 0.6705883, 1,
-0.1481481, 1.002448, -0.5468851, 0, 1, 0.6745098, 1,
-0.1454552, -0.3741346, -1.331634, 0, 1, 0.682353, 1,
-0.1444482, 0.140241, -0.06358267, 0, 1, 0.6862745, 1,
-0.1415169, 2.434484, 0.7283974, 0, 1, 0.6941177, 1,
-0.1411399, -0.3862963, -1.486242, 0, 1, 0.7019608, 1,
-0.1262973, 1.057973, 0.3010329, 0, 1, 0.7058824, 1,
-0.1209515, 0.2605887, -2.592965, 0, 1, 0.7137255, 1,
-0.1187814, 0.7660777, -1.477802, 0, 1, 0.7176471, 1,
-0.1179789, 0.9898419, -0.6842378, 0, 1, 0.7254902, 1,
-0.1173044, -0.6084192, -2.517669, 0, 1, 0.7294118, 1,
-0.1165966, -0.09259935, -0.3413785, 0, 1, 0.7372549, 1,
-0.1157236, -0.6135135, -3.501102, 0, 1, 0.7411765, 1,
-0.1116599, -0.05748435, -2.246693, 0, 1, 0.7490196, 1,
-0.1072663, 0.6316366, 0.5641181, 0, 1, 0.7529412, 1,
-0.1033539, 1.399116, -1.735805, 0, 1, 0.7607843, 1,
-0.1007392, -0.2224406, -3.241379, 0, 1, 0.7647059, 1,
-0.100626, 0.8738711, 0.04817348, 0, 1, 0.772549, 1,
-0.1000952, -1.091792, -2.853225, 0, 1, 0.7764706, 1,
-0.09937744, 0.7286623, 1.270536, 0, 1, 0.7843137, 1,
-0.09798449, 0.4697624, -1.196963, 0, 1, 0.7882353, 1,
-0.09661517, 1.975451, 1.324011, 0, 1, 0.7960784, 1,
-0.09543087, 0.6777614, 0.2171209, 0, 1, 0.8039216, 1,
-0.09266487, 0.6877831, -0.2013346, 0, 1, 0.8078431, 1,
-0.09021729, 0.243652, -1.449169, 0, 1, 0.8156863, 1,
-0.0895865, -0.3017982, -3.469195, 0, 1, 0.8196079, 1,
-0.08804104, -1.198992, -1.053031, 0, 1, 0.827451, 1,
-0.08643467, 1.420699, 1.195098, 0, 1, 0.8313726, 1,
-0.08470561, 1.975287, -0.5730919, 0, 1, 0.8392157, 1,
-0.08467539, 0.6178031, -0.386367, 0, 1, 0.8431373, 1,
-0.08357403, -0.1973456, -3.209744, 0, 1, 0.8509804, 1,
-0.08117615, 0.1860884, 0.7817878, 0, 1, 0.854902, 1,
-0.07823905, -0.8275098, -1.271834, 0, 1, 0.8627451, 1,
-0.07368843, -0.04572561, -2.493586, 0, 1, 0.8666667, 1,
-0.07066552, -0.1091264, -0.7495865, 0, 1, 0.8745098, 1,
-0.07014316, 0.5697914, 0.9728651, 0, 1, 0.8784314, 1,
-0.06966441, -0.8092391, -2.771118, 0, 1, 0.8862745, 1,
-0.06830047, 1.234137, 0.7045696, 0, 1, 0.8901961, 1,
-0.06487972, -0.4661371, -2.936148, 0, 1, 0.8980392, 1,
-0.06461589, -0.03110711, -2.375401, 0, 1, 0.9058824, 1,
-0.05822088, -0.3269115, -3.199792, 0, 1, 0.9098039, 1,
-0.05310445, 0.5523314, 0.1393262, 0, 1, 0.9176471, 1,
-0.05071206, 0.6750635, -1.803154, 0, 1, 0.9215686, 1,
-0.0484232, 0.5238802, 0.9224555, 0, 1, 0.9294118, 1,
-0.04386574, -0.1723317, -2.835247, 0, 1, 0.9333333, 1,
-0.03709954, 0.001750596, 0.2626397, 0, 1, 0.9411765, 1,
-0.03595035, 1.227653, -1.190321, 0, 1, 0.945098, 1,
-0.0357863, -0.3985214, -2.720109, 0, 1, 0.9529412, 1,
-0.03442321, -0.7253778, -2.306845, 0, 1, 0.9568627, 1,
-0.0338347, 0.2166346, -1.512493, 0, 1, 0.9647059, 1,
-0.03158623, 0.6864723, 0.5962448, 0, 1, 0.9686275, 1,
-0.03113942, 0.2943602, -1.358615, 0, 1, 0.9764706, 1,
-0.03093426, 0.8817061, -0.2663073, 0, 1, 0.9803922, 1,
-0.02878431, -0.3843736, -2.765142, 0, 1, 0.9882353, 1,
-0.02642508, 2.051707, 0.835758, 0, 1, 0.9921569, 1,
-0.02389158, 1.030037, -0.1636857, 0, 1, 1, 1,
-0.02142011, 2.105236, 1.88217, 0, 0.9921569, 1, 1,
-0.02007232, 0.0486256, -0.1827642, 0, 0.9882353, 1, 1,
-0.01957062, 0.2222859, -0.3998109, 0, 0.9803922, 1, 1,
-0.01758496, 0.1387032, -0.7519981, 0, 0.9764706, 1, 1,
-0.01537551, -1.746579, -2.76447, 0, 0.9686275, 1, 1,
-0.0147565, 0.2356984, -0.1957238, 0, 0.9647059, 1, 1,
-0.009450381, -0.01612949, -2.139013, 0, 0.9568627, 1, 1,
-0.008406424, 0.8633627, 0.9348468, 0, 0.9529412, 1, 1,
-0.004986302, -1.389309, -3.537066, 0, 0.945098, 1, 1,
0.0001380522, 0.5297005, 0.400249, 0, 0.9411765, 1, 1,
0.001705197, 0.3614009, -0.06034448, 0, 0.9333333, 1, 1,
0.002021295, -0.06915937, 3.568507, 0, 0.9294118, 1, 1,
0.004384257, 0.177994, -1.009642, 0, 0.9215686, 1, 1,
0.005405102, -1.549651, 4.765093, 0, 0.9176471, 1, 1,
0.005414345, 0.6495229, 1.428492, 0, 0.9098039, 1, 1,
0.007004885, 0.3827722, -0.2826149, 0, 0.9058824, 1, 1,
0.007745665, 0.08457641, 0.2108317, 0, 0.8980392, 1, 1,
0.008440368, 0.8582584, 0.5129207, 0, 0.8901961, 1, 1,
0.0107688, -2.841505, 2.781006, 0, 0.8862745, 1, 1,
0.01216452, 0.07842408, 0.2587973, 0, 0.8784314, 1, 1,
0.01653458, -0.08883972, 4.552488, 0, 0.8745098, 1, 1,
0.01674212, -1.254414, 3.548144, 0, 0.8666667, 1, 1,
0.01910156, 0.08645189, -0.03600537, 0, 0.8627451, 1, 1,
0.02195706, -1.619565, 2.716609, 0, 0.854902, 1, 1,
0.02738879, -0.01593833, -0.1740644, 0, 0.8509804, 1, 1,
0.02825018, -0.5973468, 3.752793, 0, 0.8431373, 1, 1,
0.03439255, 0.4185373, -1.428873, 0, 0.8392157, 1, 1,
0.03834442, 0.1312029, -1.039271, 0, 0.8313726, 1, 1,
0.04094717, 1.397382, -0.4921602, 0, 0.827451, 1, 1,
0.04391656, 0.3471977, -2.045363, 0, 0.8196079, 1, 1,
0.04640076, 0.5834002, 0.07368921, 0, 0.8156863, 1, 1,
0.05192012, -0.02487543, 2.831526, 0, 0.8078431, 1, 1,
0.05708158, 1.06724, 0.2262822, 0, 0.8039216, 1, 1,
0.05940687, 0.3460071, -0.5793339, 0, 0.7960784, 1, 1,
0.06330085, -0.449853, 2.648023, 0, 0.7882353, 1, 1,
0.06834192, 0.825364, 0.7055236, 0, 0.7843137, 1, 1,
0.0686665, 0.4916291, 1.393269, 0, 0.7764706, 1, 1,
0.06985331, -0.7255385, 4.894488, 0, 0.772549, 1, 1,
0.07328192, 0.2364355, -0.3422111, 0, 0.7647059, 1, 1,
0.07394996, -0.4057301, 3.047375, 0, 0.7607843, 1, 1,
0.0811331, 1.386696, 0.04537361, 0, 0.7529412, 1, 1,
0.08388636, 0.6019753, 2.134035, 0, 0.7490196, 1, 1,
0.08612461, -0.473335, 3.878813, 0, 0.7411765, 1, 1,
0.08708359, -0.03579398, 1.237252, 0, 0.7372549, 1, 1,
0.0896962, -0.5664736, 2.332107, 0, 0.7294118, 1, 1,
0.0941098, -0.9303784, 2.534966, 0, 0.7254902, 1, 1,
0.09544374, -0.7207786, 2.919042, 0, 0.7176471, 1, 1,
0.09847157, 1.962322, -0.2610015, 0, 0.7137255, 1, 1,
0.1045923, -1.093329, 2.761911, 0, 0.7058824, 1, 1,
0.107764, 0.01505193, 1.469859, 0, 0.6980392, 1, 1,
0.1103763, -0.6089177, 4.206443, 0, 0.6941177, 1, 1,
0.1105858, 1.335139, -1.095896, 0, 0.6862745, 1, 1,
0.1126322, 0.2041397, 1.538175, 0, 0.682353, 1, 1,
0.119213, 1.666916, 0.7050149, 0, 0.6745098, 1, 1,
0.1228504, 0.230953, 1.232517, 0, 0.6705883, 1, 1,
0.1239228, 1.582866, 0.2356536, 0, 0.6627451, 1, 1,
0.127847, -0.2150774, 1.719112, 0, 0.6588235, 1, 1,
0.1297282, -0.5175637, 2.637851, 0, 0.6509804, 1, 1,
0.1351296, -1.440969, 3.072044, 0, 0.6470588, 1, 1,
0.1370686, -0.2462317, 3.96593, 0, 0.6392157, 1, 1,
0.1397541, -0.6398818, 2.419837, 0, 0.6352941, 1, 1,
0.1470688, 0.1816626, 0.9784877, 0, 0.627451, 1, 1,
0.1478313, -2.686086, 3.004146, 0, 0.6235294, 1, 1,
0.1493101, 0.7396065, -1.664469, 0, 0.6156863, 1, 1,
0.1531277, 0.1134264, 0.3283257, 0, 0.6117647, 1, 1,
0.1533367, 1.523428, 0.1120018, 0, 0.6039216, 1, 1,
0.1543189, 1.063676, -0.6091682, 0, 0.5960785, 1, 1,
0.1556471, 1.02572, -0.1684849, 0, 0.5921569, 1, 1,
0.1565053, -0.6491551, 3.254638, 0, 0.5843138, 1, 1,
0.1599383, 0.4794318, -0.2686725, 0, 0.5803922, 1, 1,
0.1610648, 0.5824092, 0.2562192, 0, 0.572549, 1, 1,
0.1614424, -0.01240023, 0.699771, 0, 0.5686275, 1, 1,
0.1637708, 0.7385466, -0.2432173, 0, 0.5607843, 1, 1,
0.1703954, 0.495637, -0.08496972, 0, 0.5568628, 1, 1,
0.173073, 0.4742494, -0.8071346, 0, 0.5490196, 1, 1,
0.1805137, -1.179029, 4.067662, 0, 0.5450981, 1, 1,
0.1827298, 0.293143, 0.9402364, 0, 0.5372549, 1, 1,
0.1830298, -1.549982, 2.534508, 0, 0.5333334, 1, 1,
0.1858854, 0.2107258, 0.8117034, 0, 0.5254902, 1, 1,
0.1860832, -0.0006457901, 1.46671, 0, 0.5215687, 1, 1,
0.1921987, 0.2766454, -0.4381394, 0, 0.5137255, 1, 1,
0.1935377, -0.3777833, 0.787324, 0, 0.509804, 1, 1,
0.1938957, -0.8119624, 1.459676, 0, 0.5019608, 1, 1,
0.1941697, 0.2452115, -0.3588736, 0, 0.4941176, 1, 1,
0.1992658, 2.799731, 0.8910819, 0, 0.4901961, 1, 1,
0.2003416, -0.09263916, 2.305107, 0, 0.4823529, 1, 1,
0.2009615, -2.012976, 1.149893, 0, 0.4784314, 1, 1,
0.2031168, -0.549086, 2.746641, 0, 0.4705882, 1, 1,
0.2059722, -1.813128, 1.811968, 0, 0.4666667, 1, 1,
0.2104675, 0.9145154, -0.0254985, 0, 0.4588235, 1, 1,
0.2124847, 0.7463021, 1.294568, 0, 0.454902, 1, 1,
0.2133546, 0.6118646, 0.4230907, 0, 0.4470588, 1, 1,
0.2153964, -0.5883099, 2.012957, 0, 0.4431373, 1, 1,
0.2165894, 0.7800909, 0.3613564, 0, 0.4352941, 1, 1,
0.2296719, 0.8820021, -0.4114756, 0, 0.4313726, 1, 1,
0.232584, -0.3876347, 2.976516, 0, 0.4235294, 1, 1,
0.2335438, -1.736378, 3.275558, 0, 0.4196078, 1, 1,
0.2395364, 0.788604, 2.275508, 0, 0.4117647, 1, 1,
0.2450229, -0.172444, 2.247634, 0, 0.4078431, 1, 1,
0.2499338, -1.060997, 2.822008, 0, 0.4, 1, 1,
0.2509039, 0.6452154, 0.4628249, 0, 0.3921569, 1, 1,
0.256097, -0.3546728, 3.245198, 0, 0.3882353, 1, 1,
0.2567408, 0.04722162, 1.536345, 0, 0.3803922, 1, 1,
0.2599892, 0.05987634, 1.539464, 0, 0.3764706, 1, 1,
0.2604019, -0.5759798, 3.225074, 0, 0.3686275, 1, 1,
0.2712722, 0.9012849, 1.162136, 0, 0.3647059, 1, 1,
0.2738193, -0.04107639, 2.107588, 0, 0.3568628, 1, 1,
0.2746788, 0.6243867, 0.2719296, 0, 0.3529412, 1, 1,
0.2752351, -0.9492221, 3.576658, 0, 0.345098, 1, 1,
0.2754756, -0.3171425, 1.689549, 0, 0.3411765, 1, 1,
0.2783987, 1.048468, 1.216696, 0, 0.3333333, 1, 1,
0.2805653, -1.205204, 3.098618, 0, 0.3294118, 1, 1,
0.2854461, -0.1206041, 1.318563, 0, 0.3215686, 1, 1,
0.2858885, 0.6187006, 0.2072699, 0, 0.3176471, 1, 1,
0.2886467, 0.8235282, 1.20199, 0, 0.3098039, 1, 1,
0.299485, 0.1103371, 2.397931, 0, 0.3058824, 1, 1,
0.3040978, -1.343781, 3.043324, 0, 0.2980392, 1, 1,
0.3090048, 1.524637, -0.7589812, 0, 0.2901961, 1, 1,
0.3159658, 0.1276317, 0.03614148, 0, 0.2862745, 1, 1,
0.3182425, -1.009887, 3.185209, 0, 0.2784314, 1, 1,
0.3189394, 0.4268458, 1.088868, 0, 0.2745098, 1, 1,
0.3256209, -0.4868243, 1.811268, 0, 0.2666667, 1, 1,
0.3271227, -0.01361694, 0.02582392, 0, 0.2627451, 1, 1,
0.3299811, 0.4333076, 1.999993, 0, 0.254902, 1, 1,
0.3308734, 0.07608441, 0.8085309, 0, 0.2509804, 1, 1,
0.3314645, 0.6258074, 0.9296631, 0, 0.2431373, 1, 1,
0.3323107, 0.9216054, 1.766158, 0, 0.2392157, 1, 1,
0.3330688, 0.6369841, -0.04526005, 0, 0.2313726, 1, 1,
0.3333381, 0.9076581, 0.7760781, 0, 0.227451, 1, 1,
0.3351887, -0.3638762, 2.67069, 0, 0.2196078, 1, 1,
0.3397948, -1.596019, 1.266042, 0, 0.2156863, 1, 1,
0.3406112, 0.6249214, 2.272931, 0, 0.2078431, 1, 1,
0.3419176, -1.487879, 3.683668, 0, 0.2039216, 1, 1,
0.3427997, 0.5211764, -0.7993734, 0, 0.1960784, 1, 1,
0.3441641, -0.7639553, 1.924565, 0, 0.1882353, 1, 1,
0.354094, -0.9225827, 2.515479, 0, 0.1843137, 1, 1,
0.3590546, -0.2779331, 1.461207, 0, 0.1764706, 1, 1,
0.3609608, -0.1700696, -0.2726426, 0, 0.172549, 1, 1,
0.3619463, -1.046634, 3.439838, 0, 0.1647059, 1, 1,
0.3682809, 0.4752529, 1.393962, 0, 0.1607843, 1, 1,
0.3684501, -0.9047333, 3.663313, 0, 0.1529412, 1, 1,
0.3727683, -0.1938449, 1.626652, 0, 0.1490196, 1, 1,
0.3762219, -1.197745, 2.551325, 0, 0.1411765, 1, 1,
0.3764618, -0.6268309, 1.605486, 0, 0.1372549, 1, 1,
0.3814495, 0.7409143, 2.576463, 0, 0.1294118, 1, 1,
0.3851961, 0.1374853, 1.026678, 0, 0.1254902, 1, 1,
0.3856689, 0.3249086, 1.830144, 0, 0.1176471, 1, 1,
0.3871549, 1.538291, 1.448538, 0, 0.1137255, 1, 1,
0.3876283, 0.6802649, 1.069407, 0, 0.1058824, 1, 1,
0.3912531, 1.211986, 1.29382, 0, 0.09803922, 1, 1,
0.3946195, -1.360734, 2.74693, 0, 0.09411765, 1, 1,
0.3995161, 0.1173928, 0.9908701, 0, 0.08627451, 1, 1,
0.4042034, -0.07863123, 2.750771, 0, 0.08235294, 1, 1,
0.4108442, -1.160549, 2.944744, 0, 0.07450981, 1, 1,
0.4126784, 1.494749, -0.7980579, 0, 0.07058824, 1, 1,
0.4139632, 0.7652578, 0.3313015, 0, 0.0627451, 1, 1,
0.4173564, 0.6642566, 1.328897, 0, 0.05882353, 1, 1,
0.4185984, -0.6466075, 3.209888, 0, 0.05098039, 1, 1,
0.419182, 0.7030041, 1.119687, 0, 0.04705882, 1, 1,
0.4209306, -0.9313571, 1.437826, 0, 0.03921569, 1, 1,
0.4270958, -0.8816211, 1.265055, 0, 0.03529412, 1, 1,
0.4300711, -2.386099, 3.198044, 0, 0.02745098, 1, 1,
0.4304689, -0.9866703, 4.068235, 0, 0.02352941, 1, 1,
0.4314448, -0.2195165, 1.622127, 0, 0.01568628, 1, 1,
0.4395564, -0.09095518, 2.099508, 0, 0.01176471, 1, 1,
0.4406888, -1.006864, 1.762521, 0, 0.003921569, 1, 1,
0.4413202, -0.3575172, 1.254141, 0.003921569, 0, 1, 1,
0.4421256, -1.542572, 2.915944, 0.007843138, 0, 1, 1,
0.4440395, 0.5602414, 2.167618, 0.01568628, 0, 1, 1,
0.4460568, -1.478286, 3.851517, 0.01960784, 0, 1, 1,
0.4468464, 0.4131701, 2.167888, 0.02745098, 0, 1, 1,
0.4651535, 0.4809368, -0.3800461, 0.03137255, 0, 1, 1,
0.4665056, -0.09633757, 1.015118, 0.03921569, 0, 1, 1,
0.466559, 0.866073, -1.696989, 0.04313726, 0, 1, 1,
0.4694053, -1.189457, 2.814999, 0.05098039, 0, 1, 1,
0.4708559, -0.6535547, 2.182737, 0.05490196, 0, 1, 1,
0.4734188, 0.05854031, 0.981054, 0.0627451, 0, 1, 1,
0.475312, 1.54891, 0.1761324, 0.06666667, 0, 1, 1,
0.4753615, -1.546851, 3.421967, 0.07450981, 0, 1, 1,
0.4800467, 1.95445, -0.3064957, 0.07843138, 0, 1, 1,
0.484186, -1.518287, 2.217891, 0.08627451, 0, 1, 1,
0.4870144, -1.225006, 1.812956, 0.09019608, 0, 1, 1,
0.4897063, -0.2782291, 3.452221, 0.09803922, 0, 1, 1,
0.4908631, 0.8489221, 0.6372425, 0.1058824, 0, 1, 1,
0.4915783, 0.9993798, 0.08737104, 0.1098039, 0, 1, 1,
0.4981116, 0.2564852, 1.853216, 0.1176471, 0, 1, 1,
0.498352, -0.9322593, 3.695751, 0.1215686, 0, 1, 1,
0.5108125, 3.007219, -0.6890952, 0.1294118, 0, 1, 1,
0.5108911, 0.4545551, -0.5465731, 0.1333333, 0, 1, 1,
0.514673, 1.084683, 1.220813, 0.1411765, 0, 1, 1,
0.5164337, -1.63558, 0.4714518, 0.145098, 0, 1, 1,
0.516977, -0.05625889, 2.388303, 0.1529412, 0, 1, 1,
0.5204274, 0.3553135, 1.131969, 0.1568628, 0, 1, 1,
0.5222779, -1.336173, 3.19963, 0.1647059, 0, 1, 1,
0.5252849, 0.5647418, 1.598596, 0.1686275, 0, 1, 1,
0.5375468, -1.064546, 2.004844, 0.1764706, 0, 1, 1,
0.5393448, 0.5017452, 0.4956167, 0.1803922, 0, 1, 1,
0.5394489, -0.1338251, 1.666558, 0.1882353, 0, 1, 1,
0.5425383, 0.2721254, 1.194081, 0.1921569, 0, 1, 1,
0.5455814, -0.5355794, 1.581638, 0.2, 0, 1, 1,
0.547312, 1.439073, -0.3476209, 0.2078431, 0, 1, 1,
0.5474805, 2.077268, -0.4538606, 0.2117647, 0, 1, 1,
0.5532096, -0.1954039, 2.058508, 0.2196078, 0, 1, 1,
0.5572572, 0.2779579, -0.2462542, 0.2235294, 0, 1, 1,
0.5636989, 1.755759, 1.085171, 0.2313726, 0, 1, 1,
0.577504, -0.1634697, 1.529146, 0.2352941, 0, 1, 1,
0.5786908, 0.4127775, 0.2713079, 0.2431373, 0, 1, 1,
0.5787495, -0.4175652, 2.212643, 0.2470588, 0, 1, 1,
0.5800376, 2.433601, 1.864089, 0.254902, 0, 1, 1,
0.583115, -0.1868983, 2.089061, 0.2588235, 0, 1, 1,
0.5896136, -0.8893318, 3.701544, 0.2666667, 0, 1, 1,
0.5958103, -0.5070409, 4.59755, 0.2705882, 0, 1, 1,
0.5997428, 0.01082881, 0.8254885, 0.2784314, 0, 1, 1,
0.6000082, 0.2500921, 1.556931, 0.282353, 0, 1, 1,
0.6021311, 0.3860003, 1.523566, 0.2901961, 0, 1, 1,
0.6039929, -0.6374208, 5.006955, 0.2941177, 0, 1, 1,
0.60961, 1.959735, 1.325099, 0.3019608, 0, 1, 1,
0.6099739, -0.7308342, 3.815172, 0.3098039, 0, 1, 1,
0.6101475, -1.046248, 4.597813, 0.3137255, 0, 1, 1,
0.6107727, -0.3562871, 0.4408498, 0.3215686, 0, 1, 1,
0.6222491, 0.2646633, 0.4985469, 0.3254902, 0, 1, 1,
0.6300693, -0.913289, 0.7647445, 0.3333333, 0, 1, 1,
0.633432, -0.3684494, 2.327508, 0.3372549, 0, 1, 1,
0.6359264, -0.2816041, 2.203969, 0.345098, 0, 1, 1,
0.636475, 0.9979041, 1.877885, 0.3490196, 0, 1, 1,
0.6365242, -0.09474333, 3.048727, 0.3568628, 0, 1, 1,
0.6386331, -1.851822, 3.956444, 0.3607843, 0, 1, 1,
0.6391469, 0.1018715, 0.4660395, 0.3686275, 0, 1, 1,
0.6421645, -0.7368447, 1.633187, 0.372549, 0, 1, 1,
0.6441382, 0.008478161, 1.940972, 0.3803922, 0, 1, 1,
0.6510549, -2.403996, 2.928704, 0.3843137, 0, 1, 1,
0.6518541, 0.6861253, 1.101653, 0.3921569, 0, 1, 1,
0.654852, -0.4008858, 2.71005, 0.3960784, 0, 1, 1,
0.65961, -0.04179381, 1.845775, 0.4039216, 0, 1, 1,
0.6597123, 0.3892322, -0.2518735, 0.4117647, 0, 1, 1,
0.6625755, 0.443, 1.740645, 0.4156863, 0, 1, 1,
0.6668218, -0.6694831, 3.379441, 0.4235294, 0, 1, 1,
0.6717385, 0.7973893, 0.6867805, 0.427451, 0, 1, 1,
0.6736515, -0.1526257, 0.9681057, 0.4352941, 0, 1, 1,
0.6739691, 0.08118662, 1.832971, 0.4392157, 0, 1, 1,
0.6841887, -0.4241166, 1.029376, 0.4470588, 0, 1, 1,
0.6886287, 0.6617779, 1.697481, 0.4509804, 0, 1, 1,
0.6893395, 0.06234858, 2.492151, 0.4588235, 0, 1, 1,
0.6915398, -0.4701835, 0.4556022, 0.4627451, 0, 1, 1,
0.692156, 0.5990838, 0.2156093, 0.4705882, 0, 1, 1,
0.6978279, -0.1170396, 0.3918933, 0.4745098, 0, 1, 1,
0.6980127, 0.07701463, 1.383651, 0.4823529, 0, 1, 1,
0.6984755, -0.9023948, 1.14894, 0.4862745, 0, 1, 1,
0.702921, -0.2458196, 1.782738, 0.4941176, 0, 1, 1,
0.7038907, 0.565901, 2.067183, 0.5019608, 0, 1, 1,
0.7044622, -0.1061895, 0.3637367, 0.5058824, 0, 1, 1,
0.7077333, -0.7527397, 1.711193, 0.5137255, 0, 1, 1,
0.7090707, 0.8232455, 0.5601808, 0.5176471, 0, 1, 1,
0.7125008, 0.7432438, -1.774507, 0.5254902, 0, 1, 1,
0.7201198, -1.295789, 3.445937, 0.5294118, 0, 1, 1,
0.7233903, -1.868595, 1.259952, 0.5372549, 0, 1, 1,
0.7365819, 1.06109, -0.4795203, 0.5411765, 0, 1, 1,
0.7371367, 0.8173768, 2.430534, 0.5490196, 0, 1, 1,
0.7393688, 0.06364602, 2.343403, 0.5529412, 0, 1, 1,
0.7458683, 0.9253434, -0.7602917, 0.5607843, 0, 1, 1,
0.7495315, 0.1406177, -0.785268, 0.5647059, 0, 1, 1,
0.7560856, -0.7069123, 2.123214, 0.572549, 0, 1, 1,
0.7596016, 0.7075146, 0.2852066, 0.5764706, 0, 1, 1,
0.7664989, -0.1379556, -0.02243271, 0.5843138, 0, 1, 1,
0.7714388, 0.4788658, 0.5500973, 0.5882353, 0, 1, 1,
0.7759395, -1.584321, 4.103795, 0.5960785, 0, 1, 1,
0.7769256, 1.208117, 2.003044, 0.6039216, 0, 1, 1,
0.7770394, 1.40037, -1.142182, 0.6078432, 0, 1, 1,
0.7792047, 0.6710089, 2.068309, 0.6156863, 0, 1, 1,
0.7801184, -0.9120243, 2.979892, 0.6196079, 0, 1, 1,
0.780952, 0.2916376, 1.023657, 0.627451, 0, 1, 1,
0.7839217, -0.5952868, 1.469836, 0.6313726, 0, 1, 1,
0.7894563, 2.551769, -0.9555638, 0.6392157, 0, 1, 1,
0.7934255, 2.244916, 0.2410172, 0.6431373, 0, 1, 1,
0.7939212, 2.436664, -0.2332521, 0.6509804, 0, 1, 1,
0.798768, 0.1550659, 2.630589, 0.654902, 0, 1, 1,
0.7988365, -0.4581242, 4.237562, 0.6627451, 0, 1, 1,
0.8005592, 0.3244313, 1.611147, 0.6666667, 0, 1, 1,
0.800806, 0.2458448, -1.342398, 0.6745098, 0, 1, 1,
0.8081333, -2.028978, 3.231963, 0.6784314, 0, 1, 1,
0.8111264, 1.955029, 0.3230102, 0.6862745, 0, 1, 1,
0.8141531, -0.1844397, 3.434696, 0.6901961, 0, 1, 1,
0.8192188, -0.7427239, 1.545547, 0.6980392, 0, 1, 1,
0.8198466, -0.3414902, 0.7428462, 0.7058824, 0, 1, 1,
0.8200662, 1.621755, 0.3329588, 0.7098039, 0, 1, 1,
0.8310628, -0.3358628, 2.631727, 0.7176471, 0, 1, 1,
0.8339512, -0.9292878, 3.294349, 0.7215686, 0, 1, 1,
0.8350192, -0.09699702, 0.3349589, 0.7294118, 0, 1, 1,
0.835554, -0.8213885, 1.890251, 0.7333333, 0, 1, 1,
0.8360282, 0.06365114, 0.9332207, 0.7411765, 0, 1, 1,
0.8385501, -1.038704, 1.631277, 0.7450981, 0, 1, 1,
0.8453657, 1.260697, 0.6905791, 0.7529412, 0, 1, 1,
0.8518869, -1.900788, 0.7764406, 0.7568628, 0, 1, 1,
0.8521494, -0.0638132, 1.475897, 0.7647059, 0, 1, 1,
0.8550925, 1.384586, -0.5681509, 0.7686275, 0, 1, 1,
0.8568629, -1.137133, 2.626684, 0.7764706, 0, 1, 1,
0.8569045, 0.01471875, 1.842162, 0.7803922, 0, 1, 1,
0.8656938, 0.1608209, 0.3958609, 0.7882353, 0, 1, 1,
0.866869, 0.3136977, 0.7494945, 0.7921569, 0, 1, 1,
0.8764429, -0.7777071, 3.37423, 0.8, 0, 1, 1,
0.8765138, -0.688777, 2.249411, 0.8078431, 0, 1, 1,
0.879558, -0.01830612, 1.753538, 0.8117647, 0, 1, 1,
0.8809657, -0.3906401, 3.893847, 0.8196079, 0, 1, 1,
0.8862215, 0.5830891, 1.0625, 0.8235294, 0, 1, 1,
0.8890634, -0.1282288, 1.28624, 0.8313726, 0, 1, 1,
0.8906941, -1.03545, 2.959165, 0.8352941, 0, 1, 1,
0.8932759, -0.7058821, 2.531312, 0.8431373, 0, 1, 1,
0.8934144, 0.8194134, 1.753658, 0.8470588, 0, 1, 1,
0.8941615, 0.5401871, 2.336268, 0.854902, 0, 1, 1,
0.8979009, 0.2381345, 1.54697, 0.8588235, 0, 1, 1,
0.8994552, -0.3066036, 2.732217, 0.8666667, 0, 1, 1,
0.8995977, 1.076605, -0.2260625, 0.8705882, 0, 1, 1,
0.9002041, 1.157481, 2.33313, 0.8784314, 0, 1, 1,
0.902613, -0.3159572, 1.562974, 0.8823529, 0, 1, 1,
0.9027519, -1.924416, 2.533303, 0.8901961, 0, 1, 1,
0.9052715, -1.123607, 1.064819, 0.8941177, 0, 1, 1,
0.9069761, 1.871256, -0.3021269, 0.9019608, 0, 1, 1,
0.9089251, -0.5464219, 2.721437, 0.9098039, 0, 1, 1,
0.9121143, -0.7745252, 0.2585275, 0.9137255, 0, 1, 1,
0.9186268, 0.9893364, 0.9044748, 0.9215686, 0, 1, 1,
0.9339799, -0.947731, 1.241889, 0.9254902, 0, 1, 1,
0.9366932, 0.3710973, 1.278318, 0.9333333, 0, 1, 1,
0.9407697, -1.672259, 2.60721, 0.9372549, 0, 1, 1,
0.942723, 2.440797, -0.1227525, 0.945098, 0, 1, 1,
0.9483492, 1.142085, 1.163224, 0.9490196, 0, 1, 1,
0.9543226, 0.8544796, 3.232009, 0.9568627, 0, 1, 1,
0.9569386, 0.9547046, 1.452595, 0.9607843, 0, 1, 1,
0.9617999, 0.6801333, 2.395559, 0.9686275, 0, 1, 1,
0.9669464, -0.04222565, 2.774476, 0.972549, 0, 1, 1,
0.9688861, -1.258611, 3.723603, 0.9803922, 0, 1, 1,
0.9714526, -0.7658484, 0.8828789, 0.9843137, 0, 1, 1,
0.9745445, -0.1559742, 1.2296, 0.9921569, 0, 1, 1,
0.9789953, -0.257561, 1.278296, 0.9960784, 0, 1, 1,
0.9812064, 0.1626633, 0.9028431, 1, 0, 0.9960784, 1,
0.9861449, -1.119273, 4.883881, 1, 0, 0.9882353, 1,
0.9876131, -0.4774404, 0.469497, 1, 0, 0.9843137, 1,
0.9920259, -0.4940132, 3.452173, 1, 0, 0.9764706, 1,
0.9941131, 1.498497, 1.624011, 1, 0, 0.972549, 1,
0.9960548, -1.227964, 3.33019, 1, 0, 0.9647059, 1,
0.9982595, 0.1438764, 0.6685492, 1, 0, 0.9607843, 1,
1.007597, -0.9161429, 1.431445, 1, 0, 0.9529412, 1,
1.009062, 0.4353786, 0.1752496, 1, 0, 0.9490196, 1,
1.012528, 0.1986521, 3.202723, 1, 0, 0.9411765, 1,
1.014767, -0.436919, 1.46653, 1, 0, 0.9372549, 1,
1.014863, 0.5698001, -0.03726194, 1, 0, 0.9294118, 1,
1.035971, 1.11997, 0.7672801, 1, 0, 0.9254902, 1,
1.048903, -0.7749879, 1.237142, 1, 0, 0.9176471, 1,
1.062053, -0.8018003, 2.720562, 1, 0, 0.9137255, 1,
1.065449, -0.9329549, 1.551799, 1, 0, 0.9058824, 1,
1.0712, 1.256072, 1.131269, 1, 0, 0.9019608, 1,
1.079356, 0.1975191, 0.07178505, 1, 0, 0.8941177, 1,
1.083645, -1.320595, 3.648972, 1, 0, 0.8862745, 1,
1.097229, 0.7174773, -0.6936542, 1, 0, 0.8823529, 1,
1.105437, -1.2481, 2.344297, 1, 0, 0.8745098, 1,
1.109186, -0.65219, 1.319195, 1, 0, 0.8705882, 1,
1.111249, -0.01594865, 2.520087, 1, 0, 0.8627451, 1,
1.115435, 1.642672, 0.3635831, 1, 0, 0.8588235, 1,
1.118884, 1.425434, 0.1019383, 1, 0, 0.8509804, 1,
1.120812, -1.680267, 2.868407, 1, 0, 0.8470588, 1,
1.125291, 0.5199455, 0.4276681, 1, 0, 0.8392157, 1,
1.130169, 0.0573254, 0.9564998, 1, 0, 0.8352941, 1,
1.133959, -0.6804443, 2.105016, 1, 0, 0.827451, 1,
1.139704, 0.4203587, 3.530427, 1, 0, 0.8235294, 1,
1.14734, -0.5913625, 2.027823, 1, 0, 0.8156863, 1,
1.14805, -1.130687, 1.476139, 1, 0, 0.8117647, 1,
1.148139, -0.5322296, 1.906102, 1, 0, 0.8039216, 1,
1.153511, -2.506495, 3.819401, 1, 0, 0.7960784, 1,
1.153605, 0.7357515, -0.5328801, 1, 0, 0.7921569, 1,
1.153664, 0.5098119, 1.71444, 1, 0, 0.7843137, 1,
1.155948, -0.3552578, 0.7886975, 1, 0, 0.7803922, 1,
1.158661, -1.219025, 1.865654, 1, 0, 0.772549, 1,
1.162516, 0.3403519, 1.309432, 1, 0, 0.7686275, 1,
1.169865, 0.4982441, 0.1571063, 1, 0, 0.7607843, 1,
1.170143, 0.4791635, 2.263046, 1, 0, 0.7568628, 1,
1.175034, -0.197927, 1.479513, 1, 0, 0.7490196, 1,
1.17894, -1.38298, 1.86257, 1, 0, 0.7450981, 1,
1.190316, -1.762245, 1.829276, 1, 0, 0.7372549, 1,
1.198439, 0.005389244, -0.3020356, 1, 0, 0.7333333, 1,
1.199158, 0.7955776, -0.1098677, 1, 0, 0.7254902, 1,
1.200957, 0.7247491, 2.472097, 1, 0, 0.7215686, 1,
1.213134, 0.1400387, 2.389793, 1, 0, 0.7137255, 1,
1.215781, 0.3472752, 1.336543, 1, 0, 0.7098039, 1,
1.218627, 0.9401576, -0.7797415, 1, 0, 0.7019608, 1,
1.233286, -0.8841507, 3.143072, 1, 0, 0.6941177, 1,
1.236049, -0.3704355, 1.850563, 1, 0, 0.6901961, 1,
1.23793, 1.19605, 1.4101, 1, 0, 0.682353, 1,
1.241086, 1.39865, 1.521493, 1, 0, 0.6784314, 1,
1.244393, 1.370044, 1.034352, 1, 0, 0.6705883, 1,
1.263816, 1.328141, 0.1991446, 1, 0, 0.6666667, 1,
1.267139, -1.709028, 1.723454, 1, 0, 0.6588235, 1,
1.271036, 2.141119, 2.21519, 1, 0, 0.654902, 1,
1.281615, 0.1217863, 2.854332, 1, 0, 0.6470588, 1,
1.285911, 0.4307338, 1.380881, 1, 0, 0.6431373, 1,
1.288694, -0.4386119, 0.8391284, 1, 0, 0.6352941, 1,
1.294814, 1.882409, 0.4182558, 1, 0, 0.6313726, 1,
1.303092, -1.126715, 2.987294, 1, 0, 0.6235294, 1,
1.307096, 0.0790074, 0.6971737, 1, 0, 0.6196079, 1,
1.307934, -0.5563709, 0.2758617, 1, 0, 0.6117647, 1,
1.320658, -0.7972265, 1.433644, 1, 0, 0.6078432, 1,
1.323539, 1.6335, 1.0987, 1, 0, 0.6, 1,
1.335467, -1.220187, 2.28451, 1, 0, 0.5921569, 1,
1.341346, -0.8159658, 0.08358803, 1, 0, 0.5882353, 1,
1.341802, -0.4025559, 1.579863, 1, 0, 0.5803922, 1,
1.35003, 0.6149391, 0.7454666, 1, 0, 0.5764706, 1,
1.353249, 0.3996523, 0.745896, 1, 0, 0.5686275, 1,
1.360804, -0.6703451, 2.508988, 1, 0, 0.5647059, 1,
1.371144, 1.184735, 0.1132678, 1, 0, 0.5568628, 1,
1.371805, 1.137103, 0.6203957, 1, 0, 0.5529412, 1,
1.384326, 2.201059, 1.277832, 1, 0, 0.5450981, 1,
1.38552, 0.5554408, 3.352081, 1, 0, 0.5411765, 1,
1.391156, 0.6626411, 0.9167845, 1, 0, 0.5333334, 1,
1.394183, 0.05573357, 2.016958, 1, 0, 0.5294118, 1,
1.39452, -0.3714571, 0.2815219, 1, 0, 0.5215687, 1,
1.395709, -0.4825188, 0.7973081, 1, 0, 0.5176471, 1,
1.406186, 0.439468, 2.045911, 1, 0, 0.509804, 1,
1.428986, 0.4322322, 1.101631, 1, 0, 0.5058824, 1,
1.437245, 1.753525, -0.3727814, 1, 0, 0.4980392, 1,
1.450451, -0.2009815, 1.486707, 1, 0, 0.4901961, 1,
1.473338, 0.5121325, 0.2834749, 1, 0, 0.4862745, 1,
1.493557, 0.405684, 1.370732, 1, 0, 0.4784314, 1,
1.521848, 0.2859345, 1.402862, 1, 0, 0.4745098, 1,
1.529687, 0.2585679, 1.864263, 1, 0, 0.4666667, 1,
1.544884, -0.795616, 3.156409, 1, 0, 0.4627451, 1,
1.552531, 1.58372, 0.7650104, 1, 0, 0.454902, 1,
1.553566, 0.7270971, 0.9546723, 1, 0, 0.4509804, 1,
1.570077, 1.10845, 2.220274, 1, 0, 0.4431373, 1,
1.575397, -3.401945, 1.822467, 1, 0, 0.4392157, 1,
1.586924, 0.1091781, 1.795563, 1, 0, 0.4313726, 1,
1.600568, -1.536706, 0.5091088, 1, 0, 0.427451, 1,
1.614823, 0.9352039, 1.323588, 1, 0, 0.4196078, 1,
1.631814, 0.5600215, -0.3542558, 1, 0, 0.4156863, 1,
1.635774, 0.9059347, -0.6240498, 1, 0, 0.4078431, 1,
1.642463, 1.478685, 1.0116, 1, 0, 0.4039216, 1,
1.646695, -1.272458, 2.846179, 1, 0, 0.3960784, 1,
1.651466, -0.09910541, 2.32904, 1, 0, 0.3882353, 1,
1.658128, -0.09437889, 3.328644, 1, 0, 0.3843137, 1,
1.669164, -1.658847, 1.422128, 1, 0, 0.3764706, 1,
1.670482, 2.004062, 1.192764, 1, 0, 0.372549, 1,
1.680157, -0.964132, 1.767406, 1, 0, 0.3647059, 1,
1.680897, -1.177658, 3.522678, 1, 0, 0.3607843, 1,
1.686171, -0.3972537, 3.54538, 1, 0, 0.3529412, 1,
1.692341, 0.3687028, 1.371841, 1, 0, 0.3490196, 1,
1.693741, 1.476215, 1.274994, 1, 0, 0.3411765, 1,
1.697604, 2.00119, -1.637416, 1, 0, 0.3372549, 1,
1.705011, -0.3016917, 0.8007333, 1, 0, 0.3294118, 1,
1.719629, 0.5376192, 0.6718804, 1, 0, 0.3254902, 1,
1.719837, -0.6064631, 1.165466, 1, 0, 0.3176471, 1,
1.72341, -1.226543, 1.553839, 1, 0, 0.3137255, 1,
1.723811, 0.3758828, 0.9107307, 1, 0, 0.3058824, 1,
1.726379, -0.5126231, 4.625741, 1, 0, 0.2980392, 1,
1.751548, 0.369258, 1.518149, 1, 0, 0.2941177, 1,
1.758048, -0.5940551, 1.174581, 1, 0, 0.2862745, 1,
1.759541, -0.1073462, 1.086974, 1, 0, 0.282353, 1,
1.761212, 0.9549226, 0.6422439, 1, 0, 0.2745098, 1,
1.773297, -0.9086226, 3.491419, 1, 0, 0.2705882, 1,
1.787183, -0.7331285, 0.9053844, 1, 0, 0.2627451, 1,
1.791264, 1.780153, 2.467621, 1, 0, 0.2588235, 1,
1.814799, 0.4939341, 1.551404, 1, 0, 0.2509804, 1,
1.839041, 0.1121458, 0.7853032, 1, 0, 0.2470588, 1,
1.841973, -0.6411916, 2.356551, 1, 0, 0.2392157, 1,
1.842978, 0.9603767, -0.8999777, 1, 0, 0.2352941, 1,
1.846246, -1.257351, 3.963944, 1, 0, 0.227451, 1,
1.858161, -0.6179433, 2.203656, 1, 0, 0.2235294, 1,
1.875323, -1.114959, 2.249479, 1, 0, 0.2156863, 1,
1.885677, -0.8208513, 0.618968, 1, 0, 0.2117647, 1,
1.904126, -0.3688025, 3.200478, 1, 0, 0.2039216, 1,
1.927583, 0.3740707, 0.2950903, 1, 0, 0.1960784, 1,
1.933133, -0.7883602, 3.082538, 1, 0, 0.1921569, 1,
1.950116, 0.2539064, 1.437838, 1, 0, 0.1843137, 1,
1.974724, -2.125035, 2.613565, 1, 0, 0.1803922, 1,
1.976909, 0.4211466, 1.31649, 1, 0, 0.172549, 1,
1.983273, -0.5665293, 1.328313, 1, 0, 0.1686275, 1,
1.992411, -2.430426, 2.731186, 1, 0, 0.1607843, 1,
1.997378, -1.945329, 3.401846, 1, 0, 0.1568628, 1,
1.998912, -1.468173, 1.531575, 1, 0, 0.1490196, 1,
2.006702, -0.62279, 3.087283, 1, 0, 0.145098, 1,
2.007276, 1.117226, 3.849128, 1, 0, 0.1372549, 1,
2.007331, 0.2606212, 2.978393, 1, 0, 0.1333333, 1,
2.019928, -0.5499335, 2.593565, 1, 0, 0.1254902, 1,
2.066362, -0.2176371, -0.6177435, 1, 0, 0.1215686, 1,
2.073849, -0.9635194, 4.096762, 1, 0, 0.1137255, 1,
2.086489, 1.566358, 1.632998, 1, 0, 0.1098039, 1,
2.095177, 0.5660309, -0.6206284, 1, 0, 0.1019608, 1,
2.098932, -0.03484182, 1.517801, 1, 0, 0.09411765, 1,
2.125679, 1.318782, -0.7932773, 1, 0, 0.09019608, 1,
2.13173, 1.097612, -0.5017889, 1, 0, 0.08235294, 1,
2.131886, -1.380323, 3.026839, 1, 0, 0.07843138, 1,
2.144558, 0.1502909, 1.472303, 1, 0, 0.07058824, 1,
2.177515, -0.1700769, 2.931506, 1, 0, 0.06666667, 1,
2.19366, 0.3496264, 1.850099, 1, 0, 0.05882353, 1,
2.206766, 0.1982344, 1.274663, 1, 0, 0.05490196, 1,
2.246626, 1.662228, 0.6335188, 1, 0, 0.04705882, 1,
2.353742, 0.7183506, -0.7290115, 1, 0, 0.04313726, 1,
2.365005, -2.193481, 3.354026, 1, 0, 0.03529412, 1,
2.493106, 1.225091, 0.9835494, 1, 0, 0.03137255, 1,
2.613047, 1.019236, 1.629423, 1, 0, 0.02352941, 1,
2.7507, -1.709073, 1.071526, 1, 0, 0.01960784, 1,
3.401727, -0.222284, 2.089053, 1, 0, 0.01176471, 1,
3.403154, -1.665198, 1.814618, 1, 0, 0.007843138, 1
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
-0.09995317, -4.616897, -6.552365, 0, -0.5, 0.5, 0.5,
-0.09995317, -4.616897, -6.552365, 1, -0.5, 0.5, 0.5,
-0.09995317, -4.616897, -6.552365, 1, 1.5, 0.5, 0.5,
-0.09995317, -4.616897, -6.552365, 0, 1.5, 0.5, 0.5
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
-4.790613, -0.2523434, -6.552365, 0, -0.5, 0.5, 0.5,
-4.790613, -0.2523434, -6.552365, 1, -0.5, 0.5, 0.5,
-4.790613, -0.2523434, -6.552365, 1, 1.5, 0.5, 0.5,
-4.790613, -0.2523434, -6.552365, 0, 1.5, 0.5, 0.5
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
-4.790613, -4.616897, 0.06496263, 0, -0.5, 0.5, 0.5,
-4.790613, -4.616897, 0.06496263, 1, -0.5, 0.5, 0.5,
-4.790613, -4.616897, 0.06496263, 1, 1.5, 0.5, 0.5,
-4.790613, -4.616897, 0.06496263, 0, 1.5, 0.5, 0.5
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
-2, -3.609693, -5.025289,
2, -3.609693, -5.025289,
-2, -3.609693, -5.025289,
-2, -3.77756, -5.279802,
0, -3.609693, -5.025289,
0, -3.77756, -5.279802,
2, -3.609693, -5.025289,
2, -3.77756, -5.279802
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
-2, -4.113295, -5.788827, 0, -0.5, 0.5, 0.5,
-2, -4.113295, -5.788827, 1, -0.5, 0.5, 0.5,
-2, -4.113295, -5.788827, 1, 1.5, 0.5, 0.5,
-2, -4.113295, -5.788827, 0, 1.5, 0.5, 0.5,
0, -4.113295, -5.788827, 0, -0.5, 0.5, 0.5,
0, -4.113295, -5.788827, 1, -0.5, 0.5, 0.5,
0, -4.113295, -5.788827, 1, 1.5, 0.5, 0.5,
0, -4.113295, -5.788827, 0, 1.5, 0.5, 0.5,
2, -4.113295, -5.788827, 0, -0.5, 0.5, 0.5,
2, -4.113295, -5.788827, 1, -0.5, 0.5, 0.5,
2, -4.113295, -5.788827, 1, 1.5, 0.5, 0.5,
2, -4.113295, -5.788827, 0, 1.5, 0.5, 0.5
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
-3.708153, -3, -5.025289,
-3.708153, 3, -5.025289,
-3.708153, -3, -5.025289,
-3.888563, -3, -5.279802,
-3.708153, -2, -5.025289,
-3.888563, -2, -5.279802,
-3.708153, -1, -5.025289,
-3.888563, -1, -5.279802,
-3.708153, 0, -5.025289,
-3.888563, 0, -5.279802,
-3.708153, 1, -5.025289,
-3.888563, 1, -5.279802,
-3.708153, 2, -5.025289,
-3.888563, 2, -5.279802,
-3.708153, 3, -5.025289,
-3.888563, 3, -5.279802
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
-4.249383, -3, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, -3, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, -3, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, -3, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, -2, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, -2, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, -2, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, -2, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, -1, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, -1, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, -1, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, -1, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, 0, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, 0, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, 0, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, 0, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, 1, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, 1, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, 1, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, 1, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, 2, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, 2, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, 2, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, 2, -5.788827, 0, 1.5, 0.5, 0.5,
-4.249383, 3, -5.788827, 0, -0.5, 0.5, 0.5,
-4.249383, 3, -5.788827, 1, -0.5, 0.5, 0.5,
-4.249383, 3, -5.788827, 1, 1.5, 0.5, 0.5,
-4.249383, 3, -5.788827, 0, 1.5, 0.5, 0.5
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
-3.708153, -3.609693, -4,
-3.708153, -3.609693, 4,
-3.708153, -3.609693, -4,
-3.888563, -3.77756, -4,
-3.708153, -3.609693, -2,
-3.888563, -3.77756, -2,
-3.708153, -3.609693, 0,
-3.888563, -3.77756, 0,
-3.708153, -3.609693, 2,
-3.888563, -3.77756, 2,
-3.708153, -3.609693, 4,
-3.888563, -3.77756, 4
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
-4.249383, -4.113295, -4, 0, -0.5, 0.5, 0.5,
-4.249383, -4.113295, -4, 1, -0.5, 0.5, 0.5,
-4.249383, -4.113295, -4, 1, 1.5, 0.5, 0.5,
-4.249383, -4.113295, -4, 0, 1.5, 0.5, 0.5,
-4.249383, -4.113295, -2, 0, -0.5, 0.5, 0.5,
-4.249383, -4.113295, -2, 1, -0.5, 0.5, 0.5,
-4.249383, -4.113295, -2, 1, 1.5, 0.5, 0.5,
-4.249383, -4.113295, -2, 0, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 0, 0, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 0, 1, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 0, 1, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 0, 0, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 2, 0, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 2, 1, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 2, 1, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 2, 0, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 4, 0, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 4, 1, -0.5, 0.5, 0.5,
-4.249383, -4.113295, 4, 1, 1.5, 0.5, 0.5,
-4.249383, -4.113295, 4, 0, 1.5, 0.5, 0.5
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
-3.708153, -3.609693, -5.025289,
-3.708153, 3.105006, -5.025289,
-3.708153, -3.609693, 5.155214,
-3.708153, 3.105006, 5.155214,
-3.708153, -3.609693, -5.025289,
-3.708153, -3.609693, 5.155214,
-3.708153, 3.105006, -5.025289,
-3.708153, 3.105006, 5.155214,
-3.708153, -3.609693, -5.025289,
3.508247, -3.609693, -5.025289,
-3.708153, -3.609693, 5.155214,
3.508247, -3.609693, 5.155214,
-3.708153, 3.105006, -5.025289,
3.508247, 3.105006, -5.025289,
-3.708153, 3.105006, 5.155214,
3.508247, 3.105006, 5.155214,
3.508247, -3.609693, -5.025289,
3.508247, 3.105006, -5.025289,
3.508247, -3.609693, 5.155214,
3.508247, 3.105006, 5.155214,
3.508247, -3.609693, -5.025289,
3.508247, -3.609693, 5.155214,
3.508247, 3.105006, -5.025289,
3.508247, 3.105006, 5.155214
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
var radius = 7.566832;
var distance = 33.66569;
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
mvMatrix.translate( 0.09995317, 0.2523434, -0.06496263 );
mvMatrix.scale( 1.133724, 1.218433, 0.8036348 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66569);
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
Sodium_Isopropyl<-read.table("Sodium_Isopropyl.xyz")
```

```
## Error in read.table("Sodium_Isopropyl.xyz"): no lines available in input
```

```r
x<-Sodium_Isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
y<-Sodium_Isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
z<-Sodium_Isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
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
-3.60306, 0.4612712, -3.146611, 0, 0, 1, 1, 1,
-3.316417, -0.4288124, -2.555944, 1, 0, 0, 1, 1,
-3.031364, 0.3728316, -2.738402, 1, 0, 0, 1, 1,
-3.024371, -0.04438962, -3.723032, 1, 0, 0, 1, 1,
-2.997453, -1.626913, -0.6912707, 1, 0, 0, 1, 1,
-2.892794, -0.4101409, -1.125678, 1, 0, 0, 1, 1,
-2.607759, -0.7638331, -0.5343546, 0, 0, 0, 1, 1,
-2.597037, 1.272434, -3.104368, 0, 0, 0, 1, 1,
-2.401282, 0.9110556, -1.253902, 0, 0, 0, 1, 1,
-2.323783, -0.7103205, -3.087242, 0, 0, 0, 1, 1,
-2.272747, -0.06550432, -1.518462, 0, 0, 0, 1, 1,
-2.240275, -0.2793894, 0.06250522, 0, 0, 0, 1, 1,
-2.188318, 0.6745482, -1.234312, 0, 0, 0, 1, 1,
-2.166549, -1.106166, -0.7002265, 1, 1, 1, 1, 1,
-2.142364, -1.541188, -2.1305, 1, 1, 1, 1, 1,
-2.04941, -0.2812552, -0.8438234, 1, 1, 1, 1, 1,
-2.047235, -0.6148274, -2.004296, 1, 1, 1, 1, 1,
-2.017232, 0.5673526, -2.231749, 1, 1, 1, 1, 1,
-1.999925, -0.2284258, -1.01781, 1, 1, 1, 1, 1,
-1.984138, -0.322672, -2.369222, 1, 1, 1, 1, 1,
-1.960048, -1.39307, -2.129448, 1, 1, 1, 1, 1,
-1.958821, -0.3995606, -1.472383, 1, 1, 1, 1, 1,
-1.923161, -0.5474564, -0.3977575, 1, 1, 1, 1, 1,
-1.914864, -1.70296, -2.861397, 1, 1, 1, 1, 1,
-1.907414, 1.452662, -0.5713871, 1, 1, 1, 1, 1,
-1.900919, 1.722242, -0.1104649, 1, 1, 1, 1, 1,
-1.868254, -0.6302451, -2.835534, 1, 1, 1, 1, 1,
-1.852988, -0.5485584, -0.32873, 1, 1, 1, 1, 1,
-1.851913, 0.4352079, -2.565104, 0, 0, 1, 1, 1,
-1.851304, -1.423837, -2.516332, 1, 0, 0, 1, 1,
-1.830982, 0.8250319, -0.3858162, 1, 0, 0, 1, 1,
-1.828907, 1.34531, -0.5861349, 1, 0, 0, 1, 1,
-1.817456, -0.885936, -1.366716, 1, 0, 0, 1, 1,
-1.804194, 0.7877787, -0.8463743, 1, 0, 0, 1, 1,
-1.79612, -0.1435979, -0.2417618, 0, 0, 0, 1, 1,
-1.78402, -0.02020453, -2.482245, 0, 0, 0, 1, 1,
-1.783128, 0.1753288, -1.645839, 0, 0, 0, 1, 1,
-1.780889, -0.448119, -2.240178, 0, 0, 0, 1, 1,
-1.776505, 0.09835672, -0.3747877, 0, 0, 0, 1, 1,
-1.755723, -0.5525113, -3.417969, 0, 0, 0, 1, 1,
-1.748638, 0.8269219, -0.6411539, 0, 0, 0, 1, 1,
-1.731715, -1.240941, -4.831892, 1, 1, 1, 1, 1,
-1.730564, 0.5485145, 0.4587872, 1, 1, 1, 1, 1,
-1.712564, -0.3837557, -1.706907, 1, 1, 1, 1, 1,
-1.711932, -1.004156, -1.758748, 1, 1, 1, 1, 1,
-1.710825, -0.2324203, -1.563146, 1, 1, 1, 1, 1,
-1.702494, -0.3402856, -1.565408, 1, 1, 1, 1, 1,
-1.69847, -0.1363411, -2.457557, 1, 1, 1, 1, 1,
-1.694932, 0.4204669, -3.467147, 1, 1, 1, 1, 1,
-1.694591, 0.318295, 1.091191, 1, 1, 1, 1, 1,
-1.687582, -1.353605, -2.990989, 1, 1, 1, 1, 1,
-1.687066, -0.6070716, -3.061373, 1, 1, 1, 1, 1,
-1.682503, 2.109247, -1.51551, 1, 1, 1, 1, 1,
-1.682208, 1.256506, 0.4958999, 1, 1, 1, 1, 1,
-1.663586, -0.6584994, -2.829817, 1, 1, 1, 1, 1,
-1.658572, 0.3717166, -0.506541, 1, 1, 1, 1, 1,
-1.621515, 0.02005918, -0.7285525, 0, 0, 1, 1, 1,
-1.615169, -1.683369, -2.192866, 1, 0, 0, 1, 1,
-1.61036, -0.4480272, -0.4985405, 1, 0, 0, 1, 1,
-1.598347, -0.9816912, -2.764442, 1, 0, 0, 1, 1,
-1.590734, 0.4036359, -2.158035, 1, 0, 0, 1, 1,
-1.582707, -1.173138, -1.946841, 1, 0, 0, 1, 1,
-1.582349, -1.88295, -1.290928, 0, 0, 0, 1, 1,
-1.572758, -0.8255875, -1.910428, 0, 0, 0, 1, 1,
-1.57009, 0.5123626, -0.9376972, 0, 0, 0, 1, 1,
-1.568952, 2.040017, -0.6853778, 0, 0, 0, 1, 1,
-1.515139, -0.4396367, -4.070468, 0, 0, 0, 1, 1,
-1.511244, -0.4490734, -1.387811, 0, 0, 0, 1, 1,
-1.498906, -0.4480081, -2.688568, 0, 0, 0, 1, 1,
-1.490229, -0.3943252, -2.038392, 1, 1, 1, 1, 1,
-1.484609, 0.9536667, -1.225924, 1, 1, 1, 1, 1,
-1.482344, 0.5366411, -1.614332, 1, 1, 1, 1, 1,
-1.478697, 1.770076, -2.025623, 1, 1, 1, 1, 1,
-1.456146, -2.123053, -2.237752, 1, 1, 1, 1, 1,
-1.454735, -0.3832363, -2.435062, 1, 1, 1, 1, 1,
-1.451312, -0.5392674, -1.810961, 1, 1, 1, 1, 1,
-1.441877, -1.817542, -1.902485, 1, 1, 1, 1, 1,
-1.434194, -0.121765, -1.666101, 1, 1, 1, 1, 1,
-1.4249, 0.771304, -1.118846, 1, 1, 1, 1, 1,
-1.411282, -0.7380183, -1.756514, 1, 1, 1, 1, 1,
-1.406545, 0.4647009, -1.488984, 1, 1, 1, 1, 1,
-1.406462, -1.856515, -3.370593, 1, 1, 1, 1, 1,
-1.371018, 0.5798754, -1.529929, 1, 1, 1, 1, 1,
-1.368717, 0.3548447, 0.4137203, 1, 1, 1, 1, 1,
-1.366165, 1.268375, -0.5071751, 0, 0, 1, 1, 1,
-1.363212, -0.5894518, -3.431058, 1, 0, 0, 1, 1,
-1.355892, -0.7431443, -2.087461, 1, 0, 0, 1, 1,
-1.353833, -0.4078149, -1.550237, 1, 0, 0, 1, 1,
-1.352833, -2.071426, -1.995308, 1, 0, 0, 1, 1,
-1.352037, 0.2105432, -4.671226, 1, 0, 0, 1, 1,
-1.348568, -0.1625202, -2.003684, 0, 0, 0, 1, 1,
-1.343913, -0.7183424, -0.3663629, 0, 0, 0, 1, 1,
-1.340611, 0.4719918, -0.01769152, 0, 0, 0, 1, 1,
-1.340293, 0.8340347, -0.7808923, 0, 0, 0, 1, 1,
-1.339647, -1.621622, -1.446461, 0, 0, 0, 1, 1,
-1.334545, -0.1370501, -3.088686, 0, 0, 0, 1, 1,
-1.326037, 1.885154, -0.954787, 0, 0, 0, 1, 1,
-1.321026, 2.164947, 0.5041593, 1, 1, 1, 1, 1,
-1.314644, 0.3263915, -1.657837, 1, 1, 1, 1, 1,
-1.310138, 0.3291771, -1.375874, 1, 1, 1, 1, 1,
-1.300652, -0.05719401, -1.104567, 1, 1, 1, 1, 1,
-1.296886, 1.181671, 0.02965668, 1, 1, 1, 1, 1,
-1.288032, 0.8124428, -0.2879161, 1, 1, 1, 1, 1,
-1.276322, -0.7833961, -3.412036, 1, 1, 1, 1, 1,
-1.275638, 0.6853623, -1.80847, 1, 1, 1, 1, 1,
-1.275379, 1.843681, 0.2295976, 1, 1, 1, 1, 1,
-1.273666, -1.275595, -3.350484, 1, 1, 1, 1, 1,
-1.267976, 0.5397823, -1.276384, 1, 1, 1, 1, 1,
-1.267971, -0.8192191, -1.962794, 1, 1, 1, 1, 1,
-1.267937, 1.257746, 0.6524311, 1, 1, 1, 1, 1,
-1.260714, 0.1955418, 0.2093269, 1, 1, 1, 1, 1,
-1.257648, 0.3096475, -2.982982, 1, 1, 1, 1, 1,
-1.256537, -0.6164738, -0.5823017, 0, 0, 1, 1, 1,
-1.249191, -1.425436, -2.365965, 1, 0, 0, 1, 1,
-1.244672, 0.01243545, -0.04772191, 1, 0, 0, 1, 1,
-1.23544, -0.10429, -1.897306, 1, 0, 0, 1, 1,
-1.222746, -0.7610402, -1.176818, 1, 0, 0, 1, 1,
-1.215297, 0.3026996, -1.40859, 1, 0, 0, 1, 1,
-1.214122, -0.4317352, -2.916815, 0, 0, 0, 1, 1,
-1.212995, 0.1001188, -0.9719998, 0, 0, 0, 1, 1,
-1.211715, 0.3807119, -1.410284, 0, 0, 0, 1, 1,
-1.210583, 0.9987081, -0.3561858, 0, 0, 0, 1, 1,
-1.208056, -0.4311219, -2.881327, 0, 0, 0, 1, 1,
-1.206525, -1.80379, -3.429713, 0, 0, 0, 1, 1,
-1.203193, 0.2559073, -1.234191, 0, 0, 0, 1, 1,
-1.201043, 1.195471, -2.190835, 1, 1, 1, 1, 1,
-1.199291, -2.031482, -1.772525, 1, 1, 1, 1, 1,
-1.194251, -0.2129686, -0.4315567, 1, 1, 1, 1, 1,
-1.179604, -1.499969, -2.393534, 1, 1, 1, 1, 1,
-1.17108, -0.8767122, -2.67205, 1, 1, 1, 1, 1,
-1.170618, -1.245228, -1.669952, 1, 1, 1, 1, 1,
-1.16995, -0.6304061, -2.127069, 1, 1, 1, 1, 1,
-1.163142, 1.13451, 0.3499047, 1, 1, 1, 1, 1,
-1.157671, -1.425893, -2.828034, 1, 1, 1, 1, 1,
-1.157377, -0.9872612, -2.131693, 1, 1, 1, 1, 1,
-1.146193, -0.003581815, -0.1735726, 1, 1, 1, 1, 1,
-1.145224, 1.96048, 1.064721, 1, 1, 1, 1, 1,
-1.143894, 0.8802186, -1.486572, 1, 1, 1, 1, 1,
-1.141366, 0.0491613, -2.617991, 1, 1, 1, 1, 1,
-1.132378, 0.4563678, -0.7735932, 1, 1, 1, 1, 1,
-1.127999, -0.01278646, -1.244185, 0, 0, 1, 1, 1,
-1.12569, -0.7558329, -2.344131, 1, 0, 0, 1, 1,
-1.124734, 1.300378, -0.758613, 1, 0, 0, 1, 1,
-1.124019, -2.366726, -3.56801, 1, 0, 0, 1, 1,
-1.122589, 1.325445, -0.5291733, 1, 0, 0, 1, 1,
-1.120007, 1.552976, -0.09946554, 1, 0, 0, 1, 1,
-1.112559, -1.289797, -0.4595971, 0, 0, 0, 1, 1,
-1.104886, -1.002291, -1.664208, 0, 0, 0, 1, 1,
-1.098421, -1.418908, -3.792669, 0, 0, 0, 1, 1,
-1.09295, -0.7106754, -1.454175, 0, 0, 0, 1, 1,
-1.079317, 0.4539329, -2.03704, 0, 0, 0, 1, 1,
-1.074671, -1.093746, -2.372721, 0, 0, 0, 1, 1,
-1.070434, 1.320669, -1.3759, 0, 0, 0, 1, 1,
-1.060042, -2.015224, -2.837882, 1, 1, 1, 1, 1,
-1.052281, 1.052587, 0.2760205, 1, 1, 1, 1, 1,
-1.048934, 1.265869, 1.436735, 1, 1, 1, 1, 1,
-1.044944, -1.516526, -2.122288, 1, 1, 1, 1, 1,
-1.041232, 0.6407821, -0.1523295, 1, 1, 1, 1, 1,
-1.039819, 0.4864797, -2.013899, 1, 1, 1, 1, 1,
-1.032467, 2.630823, -0.1605081, 1, 1, 1, 1, 1,
-1.031878, -0.7962219, -2.102924, 1, 1, 1, 1, 1,
-1.007176, 0.5059549, -1.171591, 1, 1, 1, 1, 1,
-1.00383, 0.06880653, -0.9373259, 1, 1, 1, 1, 1,
-1.001204, -0.4712135, -1.989642, 1, 1, 1, 1, 1,
-0.9988305, 0.9292011, -1.909174, 1, 1, 1, 1, 1,
-0.9976797, -0.41044, -2.280719, 1, 1, 1, 1, 1,
-0.9942482, -0.7543341, -2.936201, 1, 1, 1, 1, 1,
-0.990039, 0.6012613, -0.9157777, 1, 1, 1, 1, 1,
-0.9771901, 0.2478372, -2.56053, 0, 0, 1, 1, 1,
-0.9751583, -1.548981, -3.567774, 1, 0, 0, 1, 1,
-0.9635277, 0.8861127, -0.4960724, 1, 0, 0, 1, 1,
-0.9578651, 0.009132624, -0.5577191, 1, 0, 0, 1, 1,
-0.9573882, -0.4984416, -2.478941, 1, 0, 0, 1, 1,
-0.9429427, -1.548348, -2.632482, 1, 0, 0, 1, 1,
-0.9420953, -0.7792724, -2.844771, 0, 0, 0, 1, 1,
-0.939617, -0.6624582, -3.229352, 0, 0, 0, 1, 1,
-0.9320216, 1.580077, 1.25247, 0, 0, 0, 1, 1,
-0.9318035, -0.2047201, -2.385308, 0, 0, 0, 1, 1,
-0.9298483, -0.1535181, 0.01933085, 0, 0, 0, 1, 1,
-0.9293677, 0.2087067, -2.539949, 0, 0, 0, 1, 1,
-0.9273104, 1.61657, -0.1358067, 0, 0, 0, 1, 1,
-0.9268814, 0.3941089, -0.03759628, 1, 1, 1, 1, 1,
-0.9268292, -0.3531355, -2.3237, 1, 1, 1, 1, 1,
-0.9211462, -1.239955, -4.009955, 1, 1, 1, 1, 1,
-0.9182451, -0.03046632, -1.053267, 1, 1, 1, 1, 1,
-0.9179673, 1.532338, -0.3729087, 1, 1, 1, 1, 1,
-0.9171035, 1.245022, -0.7355027, 1, 1, 1, 1, 1,
-0.9170792, -1.125449, -3.480682, 1, 1, 1, 1, 1,
-0.915848, 0.6444778, -2.426015, 1, 1, 1, 1, 1,
-0.9157052, -0.5875072, -1.562561, 1, 1, 1, 1, 1,
-0.9126845, 0.584026, 0.203362, 1, 1, 1, 1, 1,
-0.912162, 0.1819948, 0.5372832, 1, 1, 1, 1, 1,
-0.9044547, 1.153171, -0.01467252, 1, 1, 1, 1, 1,
-0.9040207, 0.5586278, -0.7964115, 1, 1, 1, 1, 1,
-0.8989536, 1.003314, -0.4635039, 1, 1, 1, 1, 1,
-0.8963941, -0.160642, -1.575356, 1, 1, 1, 1, 1,
-0.8924209, -0.3947313, -1.081806, 0, 0, 1, 1, 1,
-0.8835903, 0.7101864, 0.4765223, 1, 0, 0, 1, 1,
-0.8830693, 0.3978221, -0.449315, 1, 0, 0, 1, 1,
-0.8824546, 0.3945476, -1.344154, 1, 0, 0, 1, 1,
-0.881481, 0.4708849, -3.256855, 1, 0, 0, 1, 1,
-0.8767323, 2.212657, -1.576176, 1, 0, 0, 1, 1,
-0.87626, -0.473766, -2.040332, 0, 0, 0, 1, 1,
-0.8681233, 0.7350751, -0.4797578, 0, 0, 0, 1, 1,
-0.8598488, -0.7251843, -3.115057, 0, 0, 0, 1, 1,
-0.8579578, 0.3371845, 0.2975399, 0, 0, 0, 1, 1,
-0.8578115, 0.4288125, -0.7509478, 0, 0, 0, 1, 1,
-0.8535448, -1.428288, -2.911168, 0, 0, 0, 1, 1,
-0.8477731, 0.8473584, -1.378894, 0, 0, 0, 1, 1,
-0.847246, -0.197006, -1.895527, 1, 1, 1, 1, 1,
-0.8466707, -0.4872871, -2.498008, 1, 1, 1, 1, 1,
-0.845417, 0.6011401, -1.808632, 1, 1, 1, 1, 1,
-0.843235, -1.165492, -0.6436049, 1, 1, 1, 1, 1,
-0.8399256, -0.3437897, -2.490966, 1, 1, 1, 1, 1,
-0.8339369, -0.8313006, -3.731319, 1, 1, 1, 1, 1,
-0.8317493, -1.80407, -2.617723, 1, 1, 1, 1, 1,
-0.8317267, -0.4468358, -2.239724, 1, 1, 1, 1, 1,
-0.8255907, 0.180506, 0.9155945, 1, 1, 1, 1, 1,
-0.8218153, 0.7264161, -0.4138417, 1, 1, 1, 1, 1,
-0.8125997, 0.04601628, -0.8285096, 1, 1, 1, 1, 1,
-0.8119716, 0.1465839, -0.6430359, 1, 1, 1, 1, 1,
-0.8103072, -0.3707358, -2.489686, 1, 1, 1, 1, 1,
-0.8085029, 1.834408, 0.5387353, 1, 1, 1, 1, 1,
-0.805245, -1.337453, -3.236478, 1, 1, 1, 1, 1,
-0.7999418, 0.4101711, 1.279016, 0, 0, 1, 1, 1,
-0.7954229, -2.078955, -1.647013, 1, 0, 0, 1, 1,
-0.7913576, -0.1575592, 0.2788164, 1, 0, 0, 1, 1,
-0.7912759, 1.8357, -0.2491836, 1, 0, 0, 1, 1,
-0.7890844, 0.5045776, -0.2368283, 1, 0, 0, 1, 1,
-0.7845863, -0.4007936, -3.347207, 1, 0, 0, 1, 1,
-0.7805313, -0.7569995, -4.357342, 0, 0, 0, 1, 1,
-0.7775858, 0.2994339, -1.039128, 0, 0, 0, 1, 1,
-0.775613, -1.211757, -1.417924, 0, 0, 0, 1, 1,
-0.7748634, -2.417113, -3.154389, 0, 0, 0, 1, 1,
-0.7716528, -0.7275366, -3.426512, 0, 0, 0, 1, 1,
-0.7690527, -0.5419641, -1.863155, 0, 0, 0, 1, 1,
-0.7524087, -0.4515953, -3.184612, 0, 0, 0, 1, 1,
-0.7514183, 0.7410196, -0.1474185, 1, 1, 1, 1, 1,
-0.7498118, 1.751894, -1.75801, 1, 1, 1, 1, 1,
-0.7431275, -0.1518163, 0.9409277, 1, 1, 1, 1, 1,
-0.7405537, -1.770062, -2.703053, 1, 1, 1, 1, 1,
-0.7400581, 0.7010814, -0.7478534, 1, 1, 1, 1, 1,
-0.7366375, 0.973427, -0.7152112, 1, 1, 1, 1, 1,
-0.7277825, -0.3538359, -2.708933, 1, 1, 1, 1, 1,
-0.7276277, -0.0705035, -1.747738, 1, 1, 1, 1, 1,
-0.7080984, 0.3922506, 0.4684304, 1, 1, 1, 1, 1,
-0.7076736, -1.316603, -4.223999, 1, 1, 1, 1, 1,
-0.7046356, -1.807892, -4.139343, 1, 1, 1, 1, 1,
-0.697948, 0.2071453, -2.704854, 1, 1, 1, 1, 1,
-0.6943476, 0.3739453, 0.009672942, 1, 1, 1, 1, 1,
-0.6930185, 0.4617845, -2.942337, 1, 1, 1, 1, 1,
-0.6898094, -2.056092, -1.068223, 1, 1, 1, 1, 1,
-0.6850583, 0.4987989, -0.6519964, 0, 0, 1, 1, 1,
-0.682961, 0.694168, -1.440408, 1, 0, 0, 1, 1,
-0.6829416, -1.245736, -1.100847, 1, 0, 0, 1, 1,
-0.679602, -0.03467411, -0.8735947, 1, 0, 0, 1, 1,
-0.678091, 0.4820267, -0.7213509, 1, 0, 0, 1, 1,
-0.6778839, -0.8257111, -2.892745, 1, 0, 0, 1, 1,
-0.6759675, -0.2217726, -3.22575, 0, 0, 0, 1, 1,
-0.6714604, -1.439797, -3.231304, 0, 0, 0, 1, 1,
-0.6709371, -0.7204673, -1.118771, 0, 0, 0, 1, 1,
-0.6696993, -1.298435, -2.436444, 0, 0, 0, 1, 1,
-0.6670192, -0.8759465, -2.086608, 0, 0, 0, 1, 1,
-0.6608418, -0.8906739, -1.075902, 0, 0, 0, 1, 1,
-0.6588472, 0.7500356, -1.250242, 0, 0, 0, 1, 1,
-0.6541123, 1.489947, -1.06573, 1, 1, 1, 1, 1,
-0.6536555, 1.447262, -0.6154492, 1, 1, 1, 1, 1,
-0.6521772, 0.9072289, -0.08338501, 1, 1, 1, 1, 1,
-0.6429095, 0.6605386, -0.9386014, 1, 1, 1, 1, 1,
-0.6428769, 1.054831, -1.675597, 1, 1, 1, 1, 1,
-0.6370044, 1.720815, -0.971738, 1, 1, 1, 1, 1,
-0.6338851, 0.7714233, 0.464307, 1, 1, 1, 1, 1,
-0.6316742, -1.251111, -2.452008, 1, 1, 1, 1, 1,
-0.6307334, 2.036378, -0.2993638, 1, 1, 1, 1, 1,
-0.6291399, 1.013048, -0.7251571, 1, 1, 1, 1, 1,
-0.6273691, 2.690371, 0.7568535, 1, 1, 1, 1, 1,
-0.6260981, 0.9053722, -0.9444171, 1, 1, 1, 1, 1,
-0.6258698, -2.621762, -3.13097, 1, 1, 1, 1, 1,
-0.618572, -0.06961465, -1.226678, 1, 1, 1, 1, 1,
-0.6143795, 1.066865, -0.8038771, 1, 1, 1, 1, 1,
-0.6071492, 0.9292974, -2.1044, 0, 0, 1, 1, 1,
-0.6065398, 0.8089385, -0.1162426, 1, 0, 0, 1, 1,
-0.6055288, 0.4679526, -0.3269853, 1, 0, 0, 1, 1,
-0.6049061, -0.04876805, -1.112814, 1, 0, 0, 1, 1,
-0.5972276, -0.09424817, -1.559113, 1, 0, 0, 1, 1,
-0.5944629, 1.326868, -0.8080859, 1, 0, 0, 1, 1,
-0.5845295, 0.03914748, -1.919407, 0, 0, 0, 1, 1,
-0.5785767, 1.057156, -0.9998147, 0, 0, 0, 1, 1,
-0.5783393, -1.107589, -4.671652, 0, 0, 0, 1, 1,
-0.5754065, 1.093847, -0.7250997, 0, 0, 0, 1, 1,
-0.5733974, 0.7923254, -0.531963, 0, 0, 0, 1, 1,
-0.5675623, -0.2837748, -1.937213, 0, 0, 0, 1, 1,
-0.5634413, -0.7420145, -2.766285, 0, 0, 0, 1, 1,
-0.56314, 0.4631901, -1.591872, 1, 1, 1, 1, 1,
-0.5585126, -0.4987698, -1.410882, 1, 1, 1, 1, 1,
-0.5572482, -1.093145, -3.632398, 1, 1, 1, 1, 1,
-0.552427, -0.5876456, -1.246096, 1, 1, 1, 1, 1,
-0.5486073, 0.1248985, -1.120449, 1, 1, 1, 1, 1,
-0.5476371, -0.430631, -4.24146, 1, 1, 1, 1, 1,
-0.5473441, 0.768773, -2.516729, 1, 1, 1, 1, 1,
-0.546692, 1.424242, -0.7860463, 1, 1, 1, 1, 1,
-0.546133, 0.1013303, -2.031913, 1, 1, 1, 1, 1,
-0.5360107, 0.1092738, -2.565382, 1, 1, 1, 1, 1,
-0.5350294, 0.808665, -0.7082559, 1, 1, 1, 1, 1,
-0.5339847, 0.04689511, -1.562927, 1, 1, 1, 1, 1,
-0.5339825, 0.1155455, -1.465324, 1, 1, 1, 1, 1,
-0.5328155, 1.115732, 0.3705378, 1, 1, 1, 1, 1,
-0.5306718, -1.739161, -0.8539042, 1, 1, 1, 1, 1,
-0.5301527, 0.7461357, -1.003313, 0, 0, 1, 1, 1,
-0.5184659, 1.540968, -0.9283473, 1, 0, 0, 1, 1,
-0.5168305, 0.8985689, -0.5455544, 1, 0, 0, 1, 1,
-0.5124513, 0.6419427, 0.1074795, 1, 0, 0, 1, 1,
-0.5121667, 0.08374988, -2.384941, 1, 0, 0, 1, 1,
-0.5033286, -2.118601, -3.043125, 1, 0, 0, 1, 1,
-0.5031909, -1.394526, -3.182268, 0, 0, 0, 1, 1,
-0.4988846, -1.775862, -2.529923, 0, 0, 0, 1, 1,
-0.4952285, -0.8144974, -1.224492, 0, 0, 0, 1, 1,
-0.4923933, 0.3334806, -1.705505, 0, 0, 0, 1, 1,
-0.4921119, -0.7998492, -4.24202, 0, 0, 0, 1, 1,
-0.4919233, -1.409135, -3.935097, 0, 0, 0, 1, 1,
-0.4912724, -1.160697, -3.109749, 0, 0, 0, 1, 1,
-0.4877723, 0.2283067, -1.844812, 1, 1, 1, 1, 1,
-0.4850616, -0.8841538, -4.158888, 1, 1, 1, 1, 1,
-0.4824018, -0.4952355, -3.015137, 1, 1, 1, 1, 1,
-0.4797865, 0.7495399, -1.963691, 1, 1, 1, 1, 1,
-0.4762066, 1.333236, -1.618112, 1, 1, 1, 1, 1,
-0.4756933, -1.208724, -4.536493, 1, 1, 1, 1, 1,
-0.4747106, 0.08391587, -2.314759, 1, 1, 1, 1, 1,
-0.4687833, 0.7834615, -0.7608883, 1, 1, 1, 1, 1,
-0.4678115, 2.260104, -0.1254419, 1, 1, 1, 1, 1,
-0.4672492, -0.2348428, -3.159795, 1, 1, 1, 1, 1,
-0.464596, -0.3521225, -2.303022, 1, 1, 1, 1, 1,
-0.4633403, 0.7886161, 0.7202419, 1, 1, 1, 1, 1,
-0.4557992, -0.7936749, -3.040663, 1, 1, 1, 1, 1,
-0.4551057, 0.34781, -2.24361, 1, 1, 1, 1, 1,
-0.4548808, -0.49443, -2.503298, 1, 1, 1, 1, 1,
-0.4543073, 1.005786, 1.601894, 0, 0, 1, 1, 1,
-0.4537148, 0.2328173, -2.435686, 1, 0, 0, 1, 1,
-0.4513584, -0.6352462, -4.462162, 1, 0, 0, 1, 1,
-0.4387762, -1.674253, -1.250749, 1, 0, 0, 1, 1,
-0.4387024, 0.5222113, -1.702664, 1, 0, 0, 1, 1,
-0.4312922, -0.4234874, -1.158036, 1, 0, 0, 1, 1,
-0.4310828, 1.247445, -1.438651, 0, 0, 0, 1, 1,
-0.4302518, 0.8119298, 0.2549025, 0, 0, 0, 1, 1,
-0.4283346, -1.781399, -3.198005, 0, 0, 0, 1, 1,
-0.4239121, -1.493162, -1.934042, 0, 0, 0, 1, 1,
-0.4193018, -0.032489, -1.558157, 0, 0, 0, 1, 1,
-0.409088, 0.5852549, -1.289859, 0, 0, 0, 1, 1,
-0.4036797, -0.6650906, -1.826729, 0, 0, 0, 1, 1,
-0.4002216, 0.1294576, -1.921491, 1, 1, 1, 1, 1,
-0.3988965, -0.2804601, -2.354903, 1, 1, 1, 1, 1,
-0.388021, 0.2012332, 0.4580792, 1, 1, 1, 1, 1,
-0.3816265, 0.1152592, -0.6555067, 1, 1, 1, 1, 1,
-0.3803212, -0.4204381, -0.9973205, 1, 1, 1, 1, 1,
-0.380015, -0.1244601, -1.450597, 1, 1, 1, 1, 1,
-0.3761053, 0.9475842, -1.071127, 1, 1, 1, 1, 1,
-0.3743273, -0.5271897, -2.103578, 1, 1, 1, 1, 1,
-0.3679869, -1.165372, -1.864209, 1, 1, 1, 1, 1,
-0.3656764, -0.5569126, -4.063018, 1, 1, 1, 1, 1,
-0.3584547, -0.88652, -2.55833, 1, 1, 1, 1, 1,
-0.3517738, -0.303266, -3.346301, 1, 1, 1, 1, 1,
-0.3504433, -0.08576868, -1.532874, 1, 1, 1, 1, 1,
-0.348944, 0.2207943, -0.57991, 1, 1, 1, 1, 1,
-0.3415511, 1.109767, -0.1452309, 1, 1, 1, 1, 1,
-0.3404352, 0.1289248, -1.501029, 0, 0, 1, 1, 1,
-0.3403949, 0.5224503, -0.7263435, 1, 0, 0, 1, 1,
-0.3399028, 1.878415, 0.5265855, 1, 0, 0, 1, 1,
-0.3351501, 0.4421671, 0.1122414, 1, 0, 0, 1, 1,
-0.3325706, -1.156453, -3.27558, 1, 0, 0, 1, 1,
-0.3323902, -2.449368, -2.027257, 1, 0, 0, 1, 1,
-0.3304592, 0.05688323, -1.905606, 0, 0, 0, 1, 1,
-0.3299607, -2.094033, -4.877029, 0, 0, 0, 1, 1,
-0.3287064, -0.3799143, -0.8710929, 0, 0, 0, 1, 1,
-0.3286866, 1.112499, 0.01446005, 0, 0, 0, 1, 1,
-0.3266916, 1.370269, -0.4232827, 0, 0, 0, 1, 1,
-0.3266549, -1.248715, -3.517996, 0, 0, 0, 1, 1,
-0.3251016, -0.6196752, -3.207695, 0, 0, 0, 1, 1,
-0.3226272, -1.144521, -3.757099, 1, 1, 1, 1, 1,
-0.3176714, 0.8524997, 0.8817514, 1, 1, 1, 1, 1,
-0.3121087, 0.8798169, -0.3023869, 1, 1, 1, 1, 1,
-0.312021, 1.286061, 0.07735923, 1, 1, 1, 1, 1,
-0.3102922, 2.43333, -0.2552921, 1, 1, 1, 1, 1,
-0.3083163, 0.2974086, -0.1566857, 1, 1, 1, 1, 1,
-0.3020548, 0.4289369, -1.373259, 1, 1, 1, 1, 1,
-0.301465, -0.09891485, -3.375911, 1, 1, 1, 1, 1,
-0.2994419, 0.6383309, -0.9189586, 1, 1, 1, 1, 1,
-0.296768, -0.768208, -3.346358, 1, 1, 1, 1, 1,
-0.2946699, 1.595019, -0.5294731, 1, 1, 1, 1, 1,
-0.292343, 0.4708593, -0.2890155, 1, 1, 1, 1, 1,
-0.2909058, 0.150318, -1.136804, 1, 1, 1, 1, 1,
-0.2904768, 2.1577, -0.4077452, 1, 1, 1, 1, 1,
-0.2814775, -0.7500042, -3.365154, 1, 1, 1, 1, 1,
-0.2788777, 1.548282, -1.788993, 0, 0, 1, 1, 1,
-0.2634621, 0.5413682, 0.3584818, 1, 0, 0, 1, 1,
-0.2628687, -3.511906, -1.789794, 1, 0, 0, 1, 1,
-0.2575033, 0.6794881, -1.074587, 1, 0, 0, 1, 1,
-0.2574655, -0.4280746, -2.212711, 1, 0, 0, 1, 1,
-0.2552397, 0.6102399, -1.166288, 1, 0, 0, 1, 1,
-0.2544637, 2.053721, -0.3309695, 0, 0, 0, 1, 1,
-0.254392, -1.579124, -3.153692, 0, 0, 0, 1, 1,
-0.2523582, 0.4333712, -0.8491899, 0, 0, 0, 1, 1,
-0.2512512, 0.3025528, -1.788417, 0, 0, 0, 1, 1,
-0.2497874, -1.171336, -3.305182, 0, 0, 0, 1, 1,
-0.2486089, 1.377851, 0.1166723, 0, 0, 0, 1, 1,
-0.246426, 0.9232242, -0.2687877, 0, 0, 0, 1, 1,
-0.2441412, 0.2096653, -1.590537, 1, 1, 1, 1, 1,
-0.2388594, 0.4185838, -3.139834, 1, 1, 1, 1, 1,
-0.2364637, -0.5274762, -2.145893, 1, 1, 1, 1, 1,
-0.2355028, -0.1149584, -2.114689, 1, 1, 1, 1, 1,
-0.2352903, -0.2808606, -4.13799, 1, 1, 1, 1, 1,
-0.2352805, -1.70112, -2.567579, 1, 1, 1, 1, 1,
-0.2323922, 0.4385866, 0.6584775, 1, 1, 1, 1, 1,
-0.2291392, -0.4460142, -3.739248, 1, 1, 1, 1, 1,
-0.2282953, -0.5604744, -2.607014, 1, 1, 1, 1, 1,
-0.2251703, -0.2025845, -2.729333, 1, 1, 1, 1, 1,
-0.2170115, -1.386789, -2.774837, 1, 1, 1, 1, 1,
-0.2152137, -2.653166, -3.663679, 1, 1, 1, 1, 1,
-0.2136245, -1.181157, -4.339359, 1, 1, 1, 1, 1,
-0.2115757, 0.448485, -0.1553364, 1, 1, 1, 1, 1,
-0.2094311, 0.5607749, -0.4489973, 1, 1, 1, 1, 1,
-0.2063339, -1.793542, -2.787333, 0, 0, 1, 1, 1,
-0.2003734, -0.8681843, -1.568134, 1, 0, 0, 1, 1,
-0.2000021, -0.2690352, -1.091271, 1, 0, 0, 1, 1,
-0.198657, -0.1674849, -2.051407, 1, 0, 0, 1, 1,
-0.1979823, 0.315696, -0.4912744, 1, 0, 0, 1, 1,
-0.1964639, 0.6844233, -1.122805, 1, 0, 0, 1, 1,
-0.1964621, -0.7256774, -1.508131, 0, 0, 0, 1, 1,
-0.1948247, 0.9575132, 0.8646745, 0, 0, 0, 1, 1,
-0.1888795, 0.9537734, -1.217656, 0, 0, 0, 1, 1,
-0.188645, -0.01283383, -2.962842, 0, 0, 0, 1, 1,
-0.1877117, 0.4652874, -0.4071295, 0, 0, 0, 1, 1,
-0.1840737, 0.4756427, 0.04433127, 0, 0, 0, 1, 1,
-0.1833255, 1.535793, 0.7786723, 0, 0, 0, 1, 1,
-0.1820449, -1.930031, -1.887197, 1, 1, 1, 1, 1,
-0.179344, 1.393659, 0.2436772, 1, 1, 1, 1, 1,
-0.1789106, 1.362185, -0.6421231, 1, 1, 1, 1, 1,
-0.1788052, 0.3960919, -0.7097679, 1, 1, 1, 1, 1,
-0.1753705, -1.363138, -2.976436, 1, 1, 1, 1, 1,
-0.1714688, 2.103587, 0.04338055, 1, 1, 1, 1, 1,
-0.1675122, -1.083528, -2.588556, 1, 1, 1, 1, 1,
-0.1661239, -0.1574761, -0.9160153, 1, 1, 1, 1, 1,
-0.1592001, -1.308996, -2.348776, 1, 1, 1, 1, 1,
-0.1569065, 0.1441173, -0.6671285, 1, 1, 1, 1, 1,
-0.1543407, -1.368222, -2.906903, 1, 1, 1, 1, 1,
-0.1527873, 1.323715, -1.51161, 1, 1, 1, 1, 1,
-0.1522847, 0.0569646, -1.63456, 1, 1, 1, 1, 1,
-0.1481481, 1.002448, -0.5468851, 1, 1, 1, 1, 1,
-0.1454552, -0.3741346, -1.331634, 1, 1, 1, 1, 1,
-0.1444482, 0.140241, -0.06358267, 0, 0, 1, 1, 1,
-0.1415169, 2.434484, 0.7283974, 1, 0, 0, 1, 1,
-0.1411399, -0.3862963, -1.486242, 1, 0, 0, 1, 1,
-0.1262973, 1.057973, 0.3010329, 1, 0, 0, 1, 1,
-0.1209515, 0.2605887, -2.592965, 1, 0, 0, 1, 1,
-0.1187814, 0.7660777, -1.477802, 1, 0, 0, 1, 1,
-0.1179789, 0.9898419, -0.6842378, 0, 0, 0, 1, 1,
-0.1173044, -0.6084192, -2.517669, 0, 0, 0, 1, 1,
-0.1165966, -0.09259935, -0.3413785, 0, 0, 0, 1, 1,
-0.1157236, -0.6135135, -3.501102, 0, 0, 0, 1, 1,
-0.1116599, -0.05748435, -2.246693, 0, 0, 0, 1, 1,
-0.1072663, 0.6316366, 0.5641181, 0, 0, 0, 1, 1,
-0.1033539, 1.399116, -1.735805, 0, 0, 0, 1, 1,
-0.1007392, -0.2224406, -3.241379, 1, 1, 1, 1, 1,
-0.100626, 0.8738711, 0.04817348, 1, 1, 1, 1, 1,
-0.1000952, -1.091792, -2.853225, 1, 1, 1, 1, 1,
-0.09937744, 0.7286623, 1.270536, 1, 1, 1, 1, 1,
-0.09798449, 0.4697624, -1.196963, 1, 1, 1, 1, 1,
-0.09661517, 1.975451, 1.324011, 1, 1, 1, 1, 1,
-0.09543087, 0.6777614, 0.2171209, 1, 1, 1, 1, 1,
-0.09266487, 0.6877831, -0.2013346, 1, 1, 1, 1, 1,
-0.09021729, 0.243652, -1.449169, 1, 1, 1, 1, 1,
-0.0895865, -0.3017982, -3.469195, 1, 1, 1, 1, 1,
-0.08804104, -1.198992, -1.053031, 1, 1, 1, 1, 1,
-0.08643467, 1.420699, 1.195098, 1, 1, 1, 1, 1,
-0.08470561, 1.975287, -0.5730919, 1, 1, 1, 1, 1,
-0.08467539, 0.6178031, -0.386367, 1, 1, 1, 1, 1,
-0.08357403, -0.1973456, -3.209744, 1, 1, 1, 1, 1,
-0.08117615, 0.1860884, 0.7817878, 0, 0, 1, 1, 1,
-0.07823905, -0.8275098, -1.271834, 1, 0, 0, 1, 1,
-0.07368843, -0.04572561, -2.493586, 1, 0, 0, 1, 1,
-0.07066552, -0.1091264, -0.7495865, 1, 0, 0, 1, 1,
-0.07014316, 0.5697914, 0.9728651, 1, 0, 0, 1, 1,
-0.06966441, -0.8092391, -2.771118, 1, 0, 0, 1, 1,
-0.06830047, 1.234137, 0.7045696, 0, 0, 0, 1, 1,
-0.06487972, -0.4661371, -2.936148, 0, 0, 0, 1, 1,
-0.06461589, -0.03110711, -2.375401, 0, 0, 0, 1, 1,
-0.05822088, -0.3269115, -3.199792, 0, 0, 0, 1, 1,
-0.05310445, 0.5523314, 0.1393262, 0, 0, 0, 1, 1,
-0.05071206, 0.6750635, -1.803154, 0, 0, 0, 1, 1,
-0.0484232, 0.5238802, 0.9224555, 0, 0, 0, 1, 1,
-0.04386574, -0.1723317, -2.835247, 1, 1, 1, 1, 1,
-0.03709954, 0.001750596, 0.2626397, 1, 1, 1, 1, 1,
-0.03595035, 1.227653, -1.190321, 1, 1, 1, 1, 1,
-0.0357863, -0.3985214, -2.720109, 1, 1, 1, 1, 1,
-0.03442321, -0.7253778, -2.306845, 1, 1, 1, 1, 1,
-0.0338347, 0.2166346, -1.512493, 1, 1, 1, 1, 1,
-0.03158623, 0.6864723, 0.5962448, 1, 1, 1, 1, 1,
-0.03113942, 0.2943602, -1.358615, 1, 1, 1, 1, 1,
-0.03093426, 0.8817061, -0.2663073, 1, 1, 1, 1, 1,
-0.02878431, -0.3843736, -2.765142, 1, 1, 1, 1, 1,
-0.02642508, 2.051707, 0.835758, 1, 1, 1, 1, 1,
-0.02389158, 1.030037, -0.1636857, 1, 1, 1, 1, 1,
-0.02142011, 2.105236, 1.88217, 1, 1, 1, 1, 1,
-0.02007232, 0.0486256, -0.1827642, 1, 1, 1, 1, 1,
-0.01957062, 0.2222859, -0.3998109, 1, 1, 1, 1, 1,
-0.01758496, 0.1387032, -0.7519981, 0, 0, 1, 1, 1,
-0.01537551, -1.746579, -2.76447, 1, 0, 0, 1, 1,
-0.0147565, 0.2356984, -0.1957238, 1, 0, 0, 1, 1,
-0.009450381, -0.01612949, -2.139013, 1, 0, 0, 1, 1,
-0.008406424, 0.8633627, 0.9348468, 1, 0, 0, 1, 1,
-0.004986302, -1.389309, -3.537066, 1, 0, 0, 1, 1,
0.0001380522, 0.5297005, 0.400249, 0, 0, 0, 1, 1,
0.001705197, 0.3614009, -0.06034448, 0, 0, 0, 1, 1,
0.002021295, -0.06915937, 3.568507, 0, 0, 0, 1, 1,
0.004384257, 0.177994, -1.009642, 0, 0, 0, 1, 1,
0.005405102, -1.549651, 4.765093, 0, 0, 0, 1, 1,
0.005414345, 0.6495229, 1.428492, 0, 0, 0, 1, 1,
0.007004885, 0.3827722, -0.2826149, 0, 0, 0, 1, 1,
0.007745665, 0.08457641, 0.2108317, 1, 1, 1, 1, 1,
0.008440368, 0.8582584, 0.5129207, 1, 1, 1, 1, 1,
0.0107688, -2.841505, 2.781006, 1, 1, 1, 1, 1,
0.01216452, 0.07842408, 0.2587973, 1, 1, 1, 1, 1,
0.01653458, -0.08883972, 4.552488, 1, 1, 1, 1, 1,
0.01674212, -1.254414, 3.548144, 1, 1, 1, 1, 1,
0.01910156, 0.08645189, -0.03600537, 1, 1, 1, 1, 1,
0.02195706, -1.619565, 2.716609, 1, 1, 1, 1, 1,
0.02738879, -0.01593833, -0.1740644, 1, 1, 1, 1, 1,
0.02825018, -0.5973468, 3.752793, 1, 1, 1, 1, 1,
0.03439255, 0.4185373, -1.428873, 1, 1, 1, 1, 1,
0.03834442, 0.1312029, -1.039271, 1, 1, 1, 1, 1,
0.04094717, 1.397382, -0.4921602, 1, 1, 1, 1, 1,
0.04391656, 0.3471977, -2.045363, 1, 1, 1, 1, 1,
0.04640076, 0.5834002, 0.07368921, 1, 1, 1, 1, 1,
0.05192012, -0.02487543, 2.831526, 0, 0, 1, 1, 1,
0.05708158, 1.06724, 0.2262822, 1, 0, 0, 1, 1,
0.05940687, 0.3460071, -0.5793339, 1, 0, 0, 1, 1,
0.06330085, -0.449853, 2.648023, 1, 0, 0, 1, 1,
0.06834192, 0.825364, 0.7055236, 1, 0, 0, 1, 1,
0.0686665, 0.4916291, 1.393269, 1, 0, 0, 1, 1,
0.06985331, -0.7255385, 4.894488, 0, 0, 0, 1, 1,
0.07328192, 0.2364355, -0.3422111, 0, 0, 0, 1, 1,
0.07394996, -0.4057301, 3.047375, 0, 0, 0, 1, 1,
0.0811331, 1.386696, 0.04537361, 0, 0, 0, 1, 1,
0.08388636, 0.6019753, 2.134035, 0, 0, 0, 1, 1,
0.08612461, -0.473335, 3.878813, 0, 0, 0, 1, 1,
0.08708359, -0.03579398, 1.237252, 0, 0, 0, 1, 1,
0.0896962, -0.5664736, 2.332107, 1, 1, 1, 1, 1,
0.0941098, -0.9303784, 2.534966, 1, 1, 1, 1, 1,
0.09544374, -0.7207786, 2.919042, 1, 1, 1, 1, 1,
0.09847157, 1.962322, -0.2610015, 1, 1, 1, 1, 1,
0.1045923, -1.093329, 2.761911, 1, 1, 1, 1, 1,
0.107764, 0.01505193, 1.469859, 1, 1, 1, 1, 1,
0.1103763, -0.6089177, 4.206443, 1, 1, 1, 1, 1,
0.1105858, 1.335139, -1.095896, 1, 1, 1, 1, 1,
0.1126322, 0.2041397, 1.538175, 1, 1, 1, 1, 1,
0.119213, 1.666916, 0.7050149, 1, 1, 1, 1, 1,
0.1228504, 0.230953, 1.232517, 1, 1, 1, 1, 1,
0.1239228, 1.582866, 0.2356536, 1, 1, 1, 1, 1,
0.127847, -0.2150774, 1.719112, 1, 1, 1, 1, 1,
0.1297282, -0.5175637, 2.637851, 1, 1, 1, 1, 1,
0.1351296, -1.440969, 3.072044, 1, 1, 1, 1, 1,
0.1370686, -0.2462317, 3.96593, 0, 0, 1, 1, 1,
0.1397541, -0.6398818, 2.419837, 1, 0, 0, 1, 1,
0.1470688, 0.1816626, 0.9784877, 1, 0, 0, 1, 1,
0.1478313, -2.686086, 3.004146, 1, 0, 0, 1, 1,
0.1493101, 0.7396065, -1.664469, 1, 0, 0, 1, 1,
0.1531277, 0.1134264, 0.3283257, 1, 0, 0, 1, 1,
0.1533367, 1.523428, 0.1120018, 0, 0, 0, 1, 1,
0.1543189, 1.063676, -0.6091682, 0, 0, 0, 1, 1,
0.1556471, 1.02572, -0.1684849, 0, 0, 0, 1, 1,
0.1565053, -0.6491551, 3.254638, 0, 0, 0, 1, 1,
0.1599383, 0.4794318, -0.2686725, 0, 0, 0, 1, 1,
0.1610648, 0.5824092, 0.2562192, 0, 0, 0, 1, 1,
0.1614424, -0.01240023, 0.699771, 0, 0, 0, 1, 1,
0.1637708, 0.7385466, -0.2432173, 1, 1, 1, 1, 1,
0.1703954, 0.495637, -0.08496972, 1, 1, 1, 1, 1,
0.173073, 0.4742494, -0.8071346, 1, 1, 1, 1, 1,
0.1805137, -1.179029, 4.067662, 1, 1, 1, 1, 1,
0.1827298, 0.293143, 0.9402364, 1, 1, 1, 1, 1,
0.1830298, -1.549982, 2.534508, 1, 1, 1, 1, 1,
0.1858854, 0.2107258, 0.8117034, 1, 1, 1, 1, 1,
0.1860832, -0.0006457901, 1.46671, 1, 1, 1, 1, 1,
0.1921987, 0.2766454, -0.4381394, 1, 1, 1, 1, 1,
0.1935377, -0.3777833, 0.787324, 1, 1, 1, 1, 1,
0.1938957, -0.8119624, 1.459676, 1, 1, 1, 1, 1,
0.1941697, 0.2452115, -0.3588736, 1, 1, 1, 1, 1,
0.1992658, 2.799731, 0.8910819, 1, 1, 1, 1, 1,
0.2003416, -0.09263916, 2.305107, 1, 1, 1, 1, 1,
0.2009615, -2.012976, 1.149893, 1, 1, 1, 1, 1,
0.2031168, -0.549086, 2.746641, 0, 0, 1, 1, 1,
0.2059722, -1.813128, 1.811968, 1, 0, 0, 1, 1,
0.2104675, 0.9145154, -0.0254985, 1, 0, 0, 1, 1,
0.2124847, 0.7463021, 1.294568, 1, 0, 0, 1, 1,
0.2133546, 0.6118646, 0.4230907, 1, 0, 0, 1, 1,
0.2153964, -0.5883099, 2.012957, 1, 0, 0, 1, 1,
0.2165894, 0.7800909, 0.3613564, 0, 0, 0, 1, 1,
0.2296719, 0.8820021, -0.4114756, 0, 0, 0, 1, 1,
0.232584, -0.3876347, 2.976516, 0, 0, 0, 1, 1,
0.2335438, -1.736378, 3.275558, 0, 0, 0, 1, 1,
0.2395364, 0.788604, 2.275508, 0, 0, 0, 1, 1,
0.2450229, -0.172444, 2.247634, 0, 0, 0, 1, 1,
0.2499338, -1.060997, 2.822008, 0, 0, 0, 1, 1,
0.2509039, 0.6452154, 0.4628249, 1, 1, 1, 1, 1,
0.256097, -0.3546728, 3.245198, 1, 1, 1, 1, 1,
0.2567408, 0.04722162, 1.536345, 1, 1, 1, 1, 1,
0.2599892, 0.05987634, 1.539464, 1, 1, 1, 1, 1,
0.2604019, -0.5759798, 3.225074, 1, 1, 1, 1, 1,
0.2712722, 0.9012849, 1.162136, 1, 1, 1, 1, 1,
0.2738193, -0.04107639, 2.107588, 1, 1, 1, 1, 1,
0.2746788, 0.6243867, 0.2719296, 1, 1, 1, 1, 1,
0.2752351, -0.9492221, 3.576658, 1, 1, 1, 1, 1,
0.2754756, -0.3171425, 1.689549, 1, 1, 1, 1, 1,
0.2783987, 1.048468, 1.216696, 1, 1, 1, 1, 1,
0.2805653, -1.205204, 3.098618, 1, 1, 1, 1, 1,
0.2854461, -0.1206041, 1.318563, 1, 1, 1, 1, 1,
0.2858885, 0.6187006, 0.2072699, 1, 1, 1, 1, 1,
0.2886467, 0.8235282, 1.20199, 1, 1, 1, 1, 1,
0.299485, 0.1103371, 2.397931, 0, 0, 1, 1, 1,
0.3040978, -1.343781, 3.043324, 1, 0, 0, 1, 1,
0.3090048, 1.524637, -0.7589812, 1, 0, 0, 1, 1,
0.3159658, 0.1276317, 0.03614148, 1, 0, 0, 1, 1,
0.3182425, -1.009887, 3.185209, 1, 0, 0, 1, 1,
0.3189394, 0.4268458, 1.088868, 1, 0, 0, 1, 1,
0.3256209, -0.4868243, 1.811268, 0, 0, 0, 1, 1,
0.3271227, -0.01361694, 0.02582392, 0, 0, 0, 1, 1,
0.3299811, 0.4333076, 1.999993, 0, 0, 0, 1, 1,
0.3308734, 0.07608441, 0.8085309, 0, 0, 0, 1, 1,
0.3314645, 0.6258074, 0.9296631, 0, 0, 0, 1, 1,
0.3323107, 0.9216054, 1.766158, 0, 0, 0, 1, 1,
0.3330688, 0.6369841, -0.04526005, 0, 0, 0, 1, 1,
0.3333381, 0.9076581, 0.7760781, 1, 1, 1, 1, 1,
0.3351887, -0.3638762, 2.67069, 1, 1, 1, 1, 1,
0.3397948, -1.596019, 1.266042, 1, 1, 1, 1, 1,
0.3406112, 0.6249214, 2.272931, 1, 1, 1, 1, 1,
0.3419176, -1.487879, 3.683668, 1, 1, 1, 1, 1,
0.3427997, 0.5211764, -0.7993734, 1, 1, 1, 1, 1,
0.3441641, -0.7639553, 1.924565, 1, 1, 1, 1, 1,
0.354094, -0.9225827, 2.515479, 1, 1, 1, 1, 1,
0.3590546, -0.2779331, 1.461207, 1, 1, 1, 1, 1,
0.3609608, -0.1700696, -0.2726426, 1, 1, 1, 1, 1,
0.3619463, -1.046634, 3.439838, 1, 1, 1, 1, 1,
0.3682809, 0.4752529, 1.393962, 1, 1, 1, 1, 1,
0.3684501, -0.9047333, 3.663313, 1, 1, 1, 1, 1,
0.3727683, -0.1938449, 1.626652, 1, 1, 1, 1, 1,
0.3762219, -1.197745, 2.551325, 1, 1, 1, 1, 1,
0.3764618, -0.6268309, 1.605486, 0, 0, 1, 1, 1,
0.3814495, 0.7409143, 2.576463, 1, 0, 0, 1, 1,
0.3851961, 0.1374853, 1.026678, 1, 0, 0, 1, 1,
0.3856689, 0.3249086, 1.830144, 1, 0, 0, 1, 1,
0.3871549, 1.538291, 1.448538, 1, 0, 0, 1, 1,
0.3876283, 0.6802649, 1.069407, 1, 0, 0, 1, 1,
0.3912531, 1.211986, 1.29382, 0, 0, 0, 1, 1,
0.3946195, -1.360734, 2.74693, 0, 0, 0, 1, 1,
0.3995161, 0.1173928, 0.9908701, 0, 0, 0, 1, 1,
0.4042034, -0.07863123, 2.750771, 0, 0, 0, 1, 1,
0.4108442, -1.160549, 2.944744, 0, 0, 0, 1, 1,
0.4126784, 1.494749, -0.7980579, 0, 0, 0, 1, 1,
0.4139632, 0.7652578, 0.3313015, 0, 0, 0, 1, 1,
0.4173564, 0.6642566, 1.328897, 1, 1, 1, 1, 1,
0.4185984, -0.6466075, 3.209888, 1, 1, 1, 1, 1,
0.419182, 0.7030041, 1.119687, 1, 1, 1, 1, 1,
0.4209306, -0.9313571, 1.437826, 1, 1, 1, 1, 1,
0.4270958, -0.8816211, 1.265055, 1, 1, 1, 1, 1,
0.4300711, -2.386099, 3.198044, 1, 1, 1, 1, 1,
0.4304689, -0.9866703, 4.068235, 1, 1, 1, 1, 1,
0.4314448, -0.2195165, 1.622127, 1, 1, 1, 1, 1,
0.4395564, -0.09095518, 2.099508, 1, 1, 1, 1, 1,
0.4406888, -1.006864, 1.762521, 1, 1, 1, 1, 1,
0.4413202, -0.3575172, 1.254141, 1, 1, 1, 1, 1,
0.4421256, -1.542572, 2.915944, 1, 1, 1, 1, 1,
0.4440395, 0.5602414, 2.167618, 1, 1, 1, 1, 1,
0.4460568, -1.478286, 3.851517, 1, 1, 1, 1, 1,
0.4468464, 0.4131701, 2.167888, 1, 1, 1, 1, 1,
0.4651535, 0.4809368, -0.3800461, 0, 0, 1, 1, 1,
0.4665056, -0.09633757, 1.015118, 1, 0, 0, 1, 1,
0.466559, 0.866073, -1.696989, 1, 0, 0, 1, 1,
0.4694053, -1.189457, 2.814999, 1, 0, 0, 1, 1,
0.4708559, -0.6535547, 2.182737, 1, 0, 0, 1, 1,
0.4734188, 0.05854031, 0.981054, 1, 0, 0, 1, 1,
0.475312, 1.54891, 0.1761324, 0, 0, 0, 1, 1,
0.4753615, -1.546851, 3.421967, 0, 0, 0, 1, 1,
0.4800467, 1.95445, -0.3064957, 0, 0, 0, 1, 1,
0.484186, -1.518287, 2.217891, 0, 0, 0, 1, 1,
0.4870144, -1.225006, 1.812956, 0, 0, 0, 1, 1,
0.4897063, -0.2782291, 3.452221, 0, 0, 0, 1, 1,
0.4908631, 0.8489221, 0.6372425, 0, 0, 0, 1, 1,
0.4915783, 0.9993798, 0.08737104, 1, 1, 1, 1, 1,
0.4981116, 0.2564852, 1.853216, 1, 1, 1, 1, 1,
0.498352, -0.9322593, 3.695751, 1, 1, 1, 1, 1,
0.5108125, 3.007219, -0.6890952, 1, 1, 1, 1, 1,
0.5108911, 0.4545551, -0.5465731, 1, 1, 1, 1, 1,
0.514673, 1.084683, 1.220813, 1, 1, 1, 1, 1,
0.5164337, -1.63558, 0.4714518, 1, 1, 1, 1, 1,
0.516977, -0.05625889, 2.388303, 1, 1, 1, 1, 1,
0.5204274, 0.3553135, 1.131969, 1, 1, 1, 1, 1,
0.5222779, -1.336173, 3.19963, 1, 1, 1, 1, 1,
0.5252849, 0.5647418, 1.598596, 1, 1, 1, 1, 1,
0.5375468, -1.064546, 2.004844, 1, 1, 1, 1, 1,
0.5393448, 0.5017452, 0.4956167, 1, 1, 1, 1, 1,
0.5394489, -0.1338251, 1.666558, 1, 1, 1, 1, 1,
0.5425383, 0.2721254, 1.194081, 1, 1, 1, 1, 1,
0.5455814, -0.5355794, 1.581638, 0, 0, 1, 1, 1,
0.547312, 1.439073, -0.3476209, 1, 0, 0, 1, 1,
0.5474805, 2.077268, -0.4538606, 1, 0, 0, 1, 1,
0.5532096, -0.1954039, 2.058508, 1, 0, 0, 1, 1,
0.5572572, 0.2779579, -0.2462542, 1, 0, 0, 1, 1,
0.5636989, 1.755759, 1.085171, 1, 0, 0, 1, 1,
0.577504, -0.1634697, 1.529146, 0, 0, 0, 1, 1,
0.5786908, 0.4127775, 0.2713079, 0, 0, 0, 1, 1,
0.5787495, -0.4175652, 2.212643, 0, 0, 0, 1, 1,
0.5800376, 2.433601, 1.864089, 0, 0, 0, 1, 1,
0.583115, -0.1868983, 2.089061, 0, 0, 0, 1, 1,
0.5896136, -0.8893318, 3.701544, 0, 0, 0, 1, 1,
0.5958103, -0.5070409, 4.59755, 0, 0, 0, 1, 1,
0.5997428, 0.01082881, 0.8254885, 1, 1, 1, 1, 1,
0.6000082, 0.2500921, 1.556931, 1, 1, 1, 1, 1,
0.6021311, 0.3860003, 1.523566, 1, 1, 1, 1, 1,
0.6039929, -0.6374208, 5.006955, 1, 1, 1, 1, 1,
0.60961, 1.959735, 1.325099, 1, 1, 1, 1, 1,
0.6099739, -0.7308342, 3.815172, 1, 1, 1, 1, 1,
0.6101475, -1.046248, 4.597813, 1, 1, 1, 1, 1,
0.6107727, -0.3562871, 0.4408498, 1, 1, 1, 1, 1,
0.6222491, 0.2646633, 0.4985469, 1, 1, 1, 1, 1,
0.6300693, -0.913289, 0.7647445, 1, 1, 1, 1, 1,
0.633432, -0.3684494, 2.327508, 1, 1, 1, 1, 1,
0.6359264, -0.2816041, 2.203969, 1, 1, 1, 1, 1,
0.636475, 0.9979041, 1.877885, 1, 1, 1, 1, 1,
0.6365242, -0.09474333, 3.048727, 1, 1, 1, 1, 1,
0.6386331, -1.851822, 3.956444, 1, 1, 1, 1, 1,
0.6391469, 0.1018715, 0.4660395, 0, 0, 1, 1, 1,
0.6421645, -0.7368447, 1.633187, 1, 0, 0, 1, 1,
0.6441382, 0.008478161, 1.940972, 1, 0, 0, 1, 1,
0.6510549, -2.403996, 2.928704, 1, 0, 0, 1, 1,
0.6518541, 0.6861253, 1.101653, 1, 0, 0, 1, 1,
0.654852, -0.4008858, 2.71005, 1, 0, 0, 1, 1,
0.65961, -0.04179381, 1.845775, 0, 0, 0, 1, 1,
0.6597123, 0.3892322, -0.2518735, 0, 0, 0, 1, 1,
0.6625755, 0.443, 1.740645, 0, 0, 0, 1, 1,
0.6668218, -0.6694831, 3.379441, 0, 0, 0, 1, 1,
0.6717385, 0.7973893, 0.6867805, 0, 0, 0, 1, 1,
0.6736515, -0.1526257, 0.9681057, 0, 0, 0, 1, 1,
0.6739691, 0.08118662, 1.832971, 0, 0, 0, 1, 1,
0.6841887, -0.4241166, 1.029376, 1, 1, 1, 1, 1,
0.6886287, 0.6617779, 1.697481, 1, 1, 1, 1, 1,
0.6893395, 0.06234858, 2.492151, 1, 1, 1, 1, 1,
0.6915398, -0.4701835, 0.4556022, 1, 1, 1, 1, 1,
0.692156, 0.5990838, 0.2156093, 1, 1, 1, 1, 1,
0.6978279, -0.1170396, 0.3918933, 1, 1, 1, 1, 1,
0.6980127, 0.07701463, 1.383651, 1, 1, 1, 1, 1,
0.6984755, -0.9023948, 1.14894, 1, 1, 1, 1, 1,
0.702921, -0.2458196, 1.782738, 1, 1, 1, 1, 1,
0.7038907, 0.565901, 2.067183, 1, 1, 1, 1, 1,
0.7044622, -0.1061895, 0.3637367, 1, 1, 1, 1, 1,
0.7077333, -0.7527397, 1.711193, 1, 1, 1, 1, 1,
0.7090707, 0.8232455, 0.5601808, 1, 1, 1, 1, 1,
0.7125008, 0.7432438, -1.774507, 1, 1, 1, 1, 1,
0.7201198, -1.295789, 3.445937, 1, 1, 1, 1, 1,
0.7233903, -1.868595, 1.259952, 0, 0, 1, 1, 1,
0.7365819, 1.06109, -0.4795203, 1, 0, 0, 1, 1,
0.7371367, 0.8173768, 2.430534, 1, 0, 0, 1, 1,
0.7393688, 0.06364602, 2.343403, 1, 0, 0, 1, 1,
0.7458683, 0.9253434, -0.7602917, 1, 0, 0, 1, 1,
0.7495315, 0.1406177, -0.785268, 1, 0, 0, 1, 1,
0.7560856, -0.7069123, 2.123214, 0, 0, 0, 1, 1,
0.7596016, 0.7075146, 0.2852066, 0, 0, 0, 1, 1,
0.7664989, -0.1379556, -0.02243271, 0, 0, 0, 1, 1,
0.7714388, 0.4788658, 0.5500973, 0, 0, 0, 1, 1,
0.7759395, -1.584321, 4.103795, 0, 0, 0, 1, 1,
0.7769256, 1.208117, 2.003044, 0, 0, 0, 1, 1,
0.7770394, 1.40037, -1.142182, 0, 0, 0, 1, 1,
0.7792047, 0.6710089, 2.068309, 1, 1, 1, 1, 1,
0.7801184, -0.9120243, 2.979892, 1, 1, 1, 1, 1,
0.780952, 0.2916376, 1.023657, 1, 1, 1, 1, 1,
0.7839217, -0.5952868, 1.469836, 1, 1, 1, 1, 1,
0.7894563, 2.551769, -0.9555638, 1, 1, 1, 1, 1,
0.7934255, 2.244916, 0.2410172, 1, 1, 1, 1, 1,
0.7939212, 2.436664, -0.2332521, 1, 1, 1, 1, 1,
0.798768, 0.1550659, 2.630589, 1, 1, 1, 1, 1,
0.7988365, -0.4581242, 4.237562, 1, 1, 1, 1, 1,
0.8005592, 0.3244313, 1.611147, 1, 1, 1, 1, 1,
0.800806, 0.2458448, -1.342398, 1, 1, 1, 1, 1,
0.8081333, -2.028978, 3.231963, 1, 1, 1, 1, 1,
0.8111264, 1.955029, 0.3230102, 1, 1, 1, 1, 1,
0.8141531, -0.1844397, 3.434696, 1, 1, 1, 1, 1,
0.8192188, -0.7427239, 1.545547, 1, 1, 1, 1, 1,
0.8198466, -0.3414902, 0.7428462, 0, 0, 1, 1, 1,
0.8200662, 1.621755, 0.3329588, 1, 0, 0, 1, 1,
0.8310628, -0.3358628, 2.631727, 1, 0, 0, 1, 1,
0.8339512, -0.9292878, 3.294349, 1, 0, 0, 1, 1,
0.8350192, -0.09699702, 0.3349589, 1, 0, 0, 1, 1,
0.835554, -0.8213885, 1.890251, 1, 0, 0, 1, 1,
0.8360282, 0.06365114, 0.9332207, 0, 0, 0, 1, 1,
0.8385501, -1.038704, 1.631277, 0, 0, 0, 1, 1,
0.8453657, 1.260697, 0.6905791, 0, 0, 0, 1, 1,
0.8518869, -1.900788, 0.7764406, 0, 0, 0, 1, 1,
0.8521494, -0.0638132, 1.475897, 0, 0, 0, 1, 1,
0.8550925, 1.384586, -0.5681509, 0, 0, 0, 1, 1,
0.8568629, -1.137133, 2.626684, 0, 0, 0, 1, 1,
0.8569045, 0.01471875, 1.842162, 1, 1, 1, 1, 1,
0.8656938, 0.1608209, 0.3958609, 1, 1, 1, 1, 1,
0.866869, 0.3136977, 0.7494945, 1, 1, 1, 1, 1,
0.8764429, -0.7777071, 3.37423, 1, 1, 1, 1, 1,
0.8765138, -0.688777, 2.249411, 1, 1, 1, 1, 1,
0.879558, -0.01830612, 1.753538, 1, 1, 1, 1, 1,
0.8809657, -0.3906401, 3.893847, 1, 1, 1, 1, 1,
0.8862215, 0.5830891, 1.0625, 1, 1, 1, 1, 1,
0.8890634, -0.1282288, 1.28624, 1, 1, 1, 1, 1,
0.8906941, -1.03545, 2.959165, 1, 1, 1, 1, 1,
0.8932759, -0.7058821, 2.531312, 1, 1, 1, 1, 1,
0.8934144, 0.8194134, 1.753658, 1, 1, 1, 1, 1,
0.8941615, 0.5401871, 2.336268, 1, 1, 1, 1, 1,
0.8979009, 0.2381345, 1.54697, 1, 1, 1, 1, 1,
0.8994552, -0.3066036, 2.732217, 1, 1, 1, 1, 1,
0.8995977, 1.076605, -0.2260625, 0, 0, 1, 1, 1,
0.9002041, 1.157481, 2.33313, 1, 0, 0, 1, 1,
0.902613, -0.3159572, 1.562974, 1, 0, 0, 1, 1,
0.9027519, -1.924416, 2.533303, 1, 0, 0, 1, 1,
0.9052715, -1.123607, 1.064819, 1, 0, 0, 1, 1,
0.9069761, 1.871256, -0.3021269, 1, 0, 0, 1, 1,
0.9089251, -0.5464219, 2.721437, 0, 0, 0, 1, 1,
0.9121143, -0.7745252, 0.2585275, 0, 0, 0, 1, 1,
0.9186268, 0.9893364, 0.9044748, 0, 0, 0, 1, 1,
0.9339799, -0.947731, 1.241889, 0, 0, 0, 1, 1,
0.9366932, 0.3710973, 1.278318, 0, 0, 0, 1, 1,
0.9407697, -1.672259, 2.60721, 0, 0, 0, 1, 1,
0.942723, 2.440797, -0.1227525, 0, 0, 0, 1, 1,
0.9483492, 1.142085, 1.163224, 1, 1, 1, 1, 1,
0.9543226, 0.8544796, 3.232009, 1, 1, 1, 1, 1,
0.9569386, 0.9547046, 1.452595, 1, 1, 1, 1, 1,
0.9617999, 0.6801333, 2.395559, 1, 1, 1, 1, 1,
0.9669464, -0.04222565, 2.774476, 1, 1, 1, 1, 1,
0.9688861, -1.258611, 3.723603, 1, 1, 1, 1, 1,
0.9714526, -0.7658484, 0.8828789, 1, 1, 1, 1, 1,
0.9745445, -0.1559742, 1.2296, 1, 1, 1, 1, 1,
0.9789953, -0.257561, 1.278296, 1, 1, 1, 1, 1,
0.9812064, 0.1626633, 0.9028431, 1, 1, 1, 1, 1,
0.9861449, -1.119273, 4.883881, 1, 1, 1, 1, 1,
0.9876131, -0.4774404, 0.469497, 1, 1, 1, 1, 1,
0.9920259, -0.4940132, 3.452173, 1, 1, 1, 1, 1,
0.9941131, 1.498497, 1.624011, 1, 1, 1, 1, 1,
0.9960548, -1.227964, 3.33019, 1, 1, 1, 1, 1,
0.9982595, 0.1438764, 0.6685492, 0, 0, 1, 1, 1,
1.007597, -0.9161429, 1.431445, 1, 0, 0, 1, 1,
1.009062, 0.4353786, 0.1752496, 1, 0, 0, 1, 1,
1.012528, 0.1986521, 3.202723, 1, 0, 0, 1, 1,
1.014767, -0.436919, 1.46653, 1, 0, 0, 1, 1,
1.014863, 0.5698001, -0.03726194, 1, 0, 0, 1, 1,
1.035971, 1.11997, 0.7672801, 0, 0, 0, 1, 1,
1.048903, -0.7749879, 1.237142, 0, 0, 0, 1, 1,
1.062053, -0.8018003, 2.720562, 0, 0, 0, 1, 1,
1.065449, -0.9329549, 1.551799, 0, 0, 0, 1, 1,
1.0712, 1.256072, 1.131269, 0, 0, 0, 1, 1,
1.079356, 0.1975191, 0.07178505, 0, 0, 0, 1, 1,
1.083645, -1.320595, 3.648972, 0, 0, 0, 1, 1,
1.097229, 0.7174773, -0.6936542, 1, 1, 1, 1, 1,
1.105437, -1.2481, 2.344297, 1, 1, 1, 1, 1,
1.109186, -0.65219, 1.319195, 1, 1, 1, 1, 1,
1.111249, -0.01594865, 2.520087, 1, 1, 1, 1, 1,
1.115435, 1.642672, 0.3635831, 1, 1, 1, 1, 1,
1.118884, 1.425434, 0.1019383, 1, 1, 1, 1, 1,
1.120812, -1.680267, 2.868407, 1, 1, 1, 1, 1,
1.125291, 0.5199455, 0.4276681, 1, 1, 1, 1, 1,
1.130169, 0.0573254, 0.9564998, 1, 1, 1, 1, 1,
1.133959, -0.6804443, 2.105016, 1, 1, 1, 1, 1,
1.139704, 0.4203587, 3.530427, 1, 1, 1, 1, 1,
1.14734, -0.5913625, 2.027823, 1, 1, 1, 1, 1,
1.14805, -1.130687, 1.476139, 1, 1, 1, 1, 1,
1.148139, -0.5322296, 1.906102, 1, 1, 1, 1, 1,
1.153511, -2.506495, 3.819401, 1, 1, 1, 1, 1,
1.153605, 0.7357515, -0.5328801, 0, 0, 1, 1, 1,
1.153664, 0.5098119, 1.71444, 1, 0, 0, 1, 1,
1.155948, -0.3552578, 0.7886975, 1, 0, 0, 1, 1,
1.158661, -1.219025, 1.865654, 1, 0, 0, 1, 1,
1.162516, 0.3403519, 1.309432, 1, 0, 0, 1, 1,
1.169865, 0.4982441, 0.1571063, 1, 0, 0, 1, 1,
1.170143, 0.4791635, 2.263046, 0, 0, 0, 1, 1,
1.175034, -0.197927, 1.479513, 0, 0, 0, 1, 1,
1.17894, -1.38298, 1.86257, 0, 0, 0, 1, 1,
1.190316, -1.762245, 1.829276, 0, 0, 0, 1, 1,
1.198439, 0.005389244, -0.3020356, 0, 0, 0, 1, 1,
1.199158, 0.7955776, -0.1098677, 0, 0, 0, 1, 1,
1.200957, 0.7247491, 2.472097, 0, 0, 0, 1, 1,
1.213134, 0.1400387, 2.389793, 1, 1, 1, 1, 1,
1.215781, 0.3472752, 1.336543, 1, 1, 1, 1, 1,
1.218627, 0.9401576, -0.7797415, 1, 1, 1, 1, 1,
1.233286, -0.8841507, 3.143072, 1, 1, 1, 1, 1,
1.236049, -0.3704355, 1.850563, 1, 1, 1, 1, 1,
1.23793, 1.19605, 1.4101, 1, 1, 1, 1, 1,
1.241086, 1.39865, 1.521493, 1, 1, 1, 1, 1,
1.244393, 1.370044, 1.034352, 1, 1, 1, 1, 1,
1.263816, 1.328141, 0.1991446, 1, 1, 1, 1, 1,
1.267139, -1.709028, 1.723454, 1, 1, 1, 1, 1,
1.271036, 2.141119, 2.21519, 1, 1, 1, 1, 1,
1.281615, 0.1217863, 2.854332, 1, 1, 1, 1, 1,
1.285911, 0.4307338, 1.380881, 1, 1, 1, 1, 1,
1.288694, -0.4386119, 0.8391284, 1, 1, 1, 1, 1,
1.294814, 1.882409, 0.4182558, 1, 1, 1, 1, 1,
1.303092, -1.126715, 2.987294, 0, 0, 1, 1, 1,
1.307096, 0.0790074, 0.6971737, 1, 0, 0, 1, 1,
1.307934, -0.5563709, 0.2758617, 1, 0, 0, 1, 1,
1.320658, -0.7972265, 1.433644, 1, 0, 0, 1, 1,
1.323539, 1.6335, 1.0987, 1, 0, 0, 1, 1,
1.335467, -1.220187, 2.28451, 1, 0, 0, 1, 1,
1.341346, -0.8159658, 0.08358803, 0, 0, 0, 1, 1,
1.341802, -0.4025559, 1.579863, 0, 0, 0, 1, 1,
1.35003, 0.6149391, 0.7454666, 0, 0, 0, 1, 1,
1.353249, 0.3996523, 0.745896, 0, 0, 0, 1, 1,
1.360804, -0.6703451, 2.508988, 0, 0, 0, 1, 1,
1.371144, 1.184735, 0.1132678, 0, 0, 0, 1, 1,
1.371805, 1.137103, 0.6203957, 0, 0, 0, 1, 1,
1.384326, 2.201059, 1.277832, 1, 1, 1, 1, 1,
1.38552, 0.5554408, 3.352081, 1, 1, 1, 1, 1,
1.391156, 0.6626411, 0.9167845, 1, 1, 1, 1, 1,
1.394183, 0.05573357, 2.016958, 1, 1, 1, 1, 1,
1.39452, -0.3714571, 0.2815219, 1, 1, 1, 1, 1,
1.395709, -0.4825188, 0.7973081, 1, 1, 1, 1, 1,
1.406186, 0.439468, 2.045911, 1, 1, 1, 1, 1,
1.428986, 0.4322322, 1.101631, 1, 1, 1, 1, 1,
1.437245, 1.753525, -0.3727814, 1, 1, 1, 1, 1,
1.450451, -0.2009815, 1.486707, 1, 1, 1, 1, 1,
1.473338, 0.5121325, 0.2834749, 1, 1, 1, 1, 1,
1.493557, 0.405684, 1.370732, 1, 1, 1, 1, 1,
1.521848, 0.2859345, 1.402862, 1, 1, 1, 1, 1,
1.529687, 0.2585679, 1.864263, 1, 1, 1, 1, 1,
1.544884, -0.795616, 3.156409, 1, 1, 1, 1, 1,
1.552531, 1.58372, 0.7650104, 0, 0, 1, 1, 1,
1.553566, 0.7270971, 0.9546723, 1, 0, 0, 1, 1,
1.570077, 1.10845, 2.220274, 1, 0, 0, 1, 1,
1.575397, -3.401945, 1.822467, 1, 0, 0, 1, 1,
1.586924, 0.1091781, 1.795563, 1, 0, 0, 1, 1,
1.600568, -1.536706, 0.5091088, 1, 0, 0, 1, 1,
1.614823, 0.9352039, 1.323588, 0, 0, 0, 1, 1,
1.631814, 0.5600215, -0.3542558, 0, 0, 0, 1, 1,
1.635774, 0.9059347, -0.6240498, 0, 0, 0, 1, 1,
1.642463, 1.478685, 1.0116, 0, 0, 0, 1, 1,
1.646695, -1.272458, 2.846179, 0, 0, 0, 1, 1,
1.651466, -0.09910541, 2.32904, 0, 0, 0, 1, 1,
1.658128, -0.09437889, 3.328644, 0, 0, 0, 1, 1,
1.669164, -1.658847, 1.422128, 1, 1, 1, 1, 1,
1.670482, 2.004062, 1.192764, 1, 1, 1, 1, 1,
1.680157, -0.964132, 1.767406, 1, 1, 1, 1, 1,
1.680897, -1.177658, 3.522678, 1, 1, 1, 1, 1,
1.686171, -0.3972537, 3.54538, 1, 1, 1, 1, 1,
1.692341, 0.3687028, 1.371841, 1, 1, 1, 1, 1,
1.693741, 1.476215, 1.274994, 1, 1, 1, 1, 1,
1.697604, 2.00119, -1.637416, 1, 1, 1, 1, 1,
1.705011, -0.3016917, 0.8007333, 1, 1, 1, 1, 1,
1.719629, 0.5376192, 0.6718804, 1, 1, 1, 1, 1,
1.719837, -0.6064631, 1.165466, 1, 1, 1, 1, 1,
1.72341, -1.226543, 1.553839, 1, 1, 1, 1, 1,
1.723811, 0.3758828, 0.9107307, 1, 1, 1, 1, 1,
1.726379, -0.5126231, 4.625741, 1, 1, 1, 1, 1,
1.751548, 0.369258, 1.518149, 1, 1, 1, 1, 1,
1.758048, -0.5940551, 1.174581, 0, 0, 1, 1, 1,
1.759541, -0.1073462, 1.086974, 1, 0, 0, 1, 1,
1.761212, 0.9549226, 0.6422439, 1, 0, 0, 1, 1,
1.773297, -0.9086226, 3.491419, 1, 0, 0, 1, 1,
1.787183, -0.7331285, 0.9053844, 1, 0, 0, 1, 1,
1.791264, 1.780153, 2.467621, 1, 0, 0, 1, 1,
1.814799, 0.4939341, 1.551404, 0, 0, 0, 1, 1,
1.839041, 0.1121458, 0.7853032, 0, 0, 0, 1, 1,
1.841973, -0.6411916, 2.356551, 0, 0, 0, 1, 1,
1.842978, 0.9603767, -0.8999777, 0, 0, 0, 1, 1,
1.846246, -1.257351, 3.963944, 0, 0, 0, 1, 1,
1.858161, -0.6179433, 2.203656, 0, 0, 0, 1, 1,
1.875323, -1.114959, 2.249479, 0, 0, 0, 1, 1,
1.885677, -0.8208513, 0.618968, 1, 1, 1, 1, 1,
1.904126, -0.3688025, 3.200478, 1, 1, 1, 1, 1,
1.927583, 0.3740707, 0.2950903, 1, 1, 1, 1, 1,
1.933133, -0.7883602, 3.082538, 1, 1, 1, 1, 1,
1.950116, 0.2539064, 1.437838, 1, 1, 1, 1, 1,
1.974724, -2.125035, 2.613565, 1, 1, 1, 1, 1,
1.976909, 0.4211466, 1.31649, 1, 1, 1, 1, 1,
1.983273, -0.5665293, 1.328313, 1, 1, 1, 1, 1,
1.992411, -2.430426, 2.731186, 1, 1, 1, 1, 1,
1.997378, -1.945329, 3.401846, 1, 1, 1, 1, 1,
1.998912, -1.468173, 1.531575, 1, 1, 1, 1, 1,
2.006702, -0.62279, 3.087283, 1, 1, 1, 1, 1,
2.007276, 1.117226, 3.849128, 1, 1, 1, 1, 1,
2.007331, 0.2606212, 2.978393, 1, 1, 1, 1, 1,
2.019928, -0.5499335, 2.593565, 1, 1, 1, 1, 1,
2.066362, -0.2176371, -0.6177435, 0, 0, 1, 1, 1,
2.073849, -0.9635194, 4.096762, 1, 0, 0, 1, 1,
2.086489, 1.566358, 1.632998, 1, 0, 0, 1, 1,
2.095177, 0.5660309, -0.6206284, 1, 0, 0, 1, 1,
2.098932, -0.03484182, 1.517801, 1, 0, 0, 1, 1,
2.125679, 1.318782, -0.7932773, 1, 0, 0, 1, 1,
2.13173, 1.097612, -0.5017889, 0, 0, 0, 1, 1,
2.131886, -1.380323, 3.026839, 0, 0, 0, 1, 1,
2.144558, 0.1502909, 1.472303, 0, 0, 0, 1, 1,
2.177515, -0.1700769, 2.931506, 0, 0, 0, 1, 1,
2.19366, 0.3496264, 1.850099, 0, 0, 0, 1, 1,
2.206766, 0.1982344, 1.274663, 0, 0, 0, 1, 1,
2.246626, 1.662228, 0.6335188, 0, 0, 0, 1, 1,
2.353742, 0.7183506, -0.7290115, 1, 1, 1, 1, 1,
2.365005, -2.193481, 3.354026, 1, 1, 1, 1, 1,
2.493106, 1.225091, 0.9835494, 1, 1, 1, 1, 1,
2.613047, 1.019236, 1.629423, 1, 1, 1, 1, 1,
2.7507, -1.709073, 1.071526, 1, 1, 1, 1, 1,
3.401727, -0.222284, 2.089053, 1, 1, 1, 1, 1,
3.403154, -1.665198, 1.814618, 1, 1, 1, 1, 1
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
var radius = 9.445222;
var distance = 33.17595;
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
mvMatrix.translate( 0.09995317, 0.2523434, -0.06496263 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17595);
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
