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
-2.850732, -0.6979203, -0.8114308, 1, 0, 0, 1,
-2.61899, 0.7153236, -0.6257867, 1, 0.007843138, 0, 1,
-2.54508, 1.365963, -2.215616, 1, 0.01176471, 0, 1,
-2.39507, -0.4508898, -1.964458, 1, 0.01960784, 0, 1,
-2.363584, 0.8565155, -2.294222, 1, 0.02352941, 0, 1,
-2.346551, 1.185882, -2.046157, 1, 0.03137255, 0, 1,
-2.298476, 0.7976685, -1.620216, 1, 0.03529412, 0, 1,
-2.298384, -1.277025, -2.90082, 1, 0.04313726, 0, 1,
-2.238218, 1.34542, -0.8200037, 1, 0.04705882, 0, 1,
-2.224199, 0.5039867, -1.793323, 1, 0.05490196, 0, 1,
-2.223, -0.8906347, -2.518883, 1, 0.05882353, 0, 1,
-2.212, 0.4430734, -1.294089, 1, 0.06666667, 0, 1,
-2.192781, 0.9512202, 0.9677436, 1, 0.07058824, 0, 1,
-2.16114, -1.4535, -3.150835, 1, 0.07843138, 0, 1,
-2.15547, -0.4115755, -1.840054, 1, 0.08235294, 0, 1,
-2.134667, 0.01537371, 1.091683, 1, 0.09019608, 0, 1,
-2.107995, 0.6453593, -1.418612, 1, 0.09411765, 0, 1,
-2.098731, -0.3262799, -2.255866, 1, 0.1019608, 0, 1,
-2.065522, -0.1595732, -3.485548, 1, 0.1098039, 0, 1,
-2.027653, 0.1761577, -4.103193, 1, 0.1137255, 0, 1,
-2.013073, 0.3589885, -0.7635806, 1, 0.1215686, 0, 1,
-1.97875, -0.5965787, -1.15527, 1, 0.1254902, 0, 1,
-1.966626, -0.5194362, -2.183981, 1, 0.1333333, 0, 1,
-1.953412, -0.9851093, -1.524833, 1, 0.1372549, 0, 1,
-1.928826, 0.768759, -0.7467564, 1, 0.145098, 0, 1,
-1.923741, 0.8057433, 0.508013, 1, 0.1490196, 0, 1,
-1.921611, 1.421466, -1.648994, 1, 0.1568628, 0, 1,
-1.891038, -0.03822381, -0.6250957, 1, 0.1607843, 0, 1,
-1.890088, 1.216859, -1.294728, 1, 0.1686275, 0, 1,
-1.886533, -0.8929735, -3.150592, 1, 0.172549, 0, 1,
-1.866035, 1.592507, -0.3099819, 1, 0.1803922, 0, 1,
-1.828374, 0.7639273, -2.157592, 1, 0.1843137, 0, 1,
-1.812909, 0.6815056, -1.935025, 1, 0.1921569, 0, 1,
-1.73376, 1.063968, -0.3317709, 1, 0.1960784, 0, 1,
-1.715167, 0.3332013, -0.8550199, 1, 0.2039216, 0, 1,
-1.710946, -1.910659, -2.29713, 1, 0.2117647, 0, 1,
-1.703714, -0.07106863, 0.02964972, 1, 0.2156863, 0, 1,
-1.695935, 0.03206006, -3.021127, 1, 0.2235294, 0, 1,
-1.677223, -2.585786, -4.007667, 1, 0.227451, 0, 1,
-1.672821, -0.8748727, -2.421181, 1, 0.2352941, 0, 1,
-1.665931, 1.926381, -2.259731, 1, 0.2392157, 0, 1,
-1.657661, -1.809408, -1.035674, 1, 0.2470588, 0, 1,
-1.647979, 0.7454814, -0.04401903, 1, 0.2509804, 0, 1,
-1.636385, -2.114088, -2.45766, 1, 0.2588235, 0, 1,
-1.633338, -1.139428, -1.830567, 1, 0.2627451, 0, 1,
-1.623725, -0.7702789, -4.473899, 1, 0.2705882, 0, 1,
-1.613618, -0.7175224, -2.704713, 1, 0.2745098, 0, 1,
-1.604008, -0.8430492, -1.160038, 1, 0.282353, 0, 1,
-1.601354, -0.8155766, -0.6836331, 1, 0.2862745, 0, 1,
-1.584055, 1.818657, 0.7096574, 1, 0.2941177, 0, 1,
-1.581227, -1.596248, -3.057288, 1, 0.3019608, 0, 1,
-1.577048, -1.008652, -1.515822, 1, 0.3058824, 0, 1,
-1.574048, 0.06224374, -1.928854, 1, 0.3137255, 0, 1,
-1.56451, -1.396179, -0.6190567, 1, 0.3176471, 0, 1,
-1.563033, 0.6285575, -1.395225, 1, 0.3254902, 0, 1,
-1.556166, -1.158031, -2.586311, 1, 0.3294118, 0, 1,
-1.555244, 0.1606852, -0.3039953, 1, 0.3372549, 0, 1,
-1.550658, 0.6392304, -0.6206535, 1, 0.3411765, 0, 1,
-1.541246, 0.1536601, -1.779654, 1, 0.3490196, 0, 1,
-1.533293, 1.93154, -1.000074, 1, 0.3529412, 0, 1,
-1.528837, 0.2864809, -0.5253845, 1, 0.3607843, 0, 1,
-1.512521, 0.8794913, 0.2672407, 1, 0.3647059, 0, 1,
-1.501968, 0.373365, -2.132216, 1, 0.372549, 0, 1,
-1.49934, 0.1151053, -2.133621, 1, 0.3764706, 0, 1,
-1.498524, 0.4492427, 0.0002906618, 1, 0.3843137, 0, 1,
-1.496873, -0.02780251, -2.524711, 1, 0.3882353, 0, 1,
-1.492325, 1.147831, 2.037846, 1, 0.3960784, 0, 1,
-1.481134, 0.1231735, -1.606568, 1, 0.4039216, 0, 1,
-1.479777, -0.4898699, -2.615156, 1, 0.4078431, 0, 1,
-1.469322, -0.2942875, -0.3538241, 1, 0.4156863, 0, 1,
-1.466182, 1.979115, 0.713571, 1, 0.4196078, 0, 1,
-1.455106, -1.121847, -3.659522, 1, 0.427451, 0, 1,
-1.452471, 0.6006801, -1.544862, 1, 0.4313726, 0, 1,
-1.424212, 0.7628283, -1.015455, 1, 0.4392157, 0, 1,
-1.421536, 1.63903, -0.8244172, 1, 0.4431373, 0, 1,
-1.412102, -2.551508, -2.312885, 1, 0.4509804, 0, 1,
-1.405508, 1.428902, -1.191524, 1, 0.454902, 0, 1,
-1.398009, 0.4484539, -2.394832, 1, 0.4627451, 0, 1,
-1.395802, 0.8894377, 0.9516116, 1, 0.4666667, 0, 1,
-1.391121, -0.02545095, -0.03016837, 1, 0.4745098, 0, 1,
-1.385238, -0.2806007, -2.525466, 1, 0.4784314, 0, 1,
-1.381791, 1.68467, 0.206764, 1, 0.4862745, 0, 1,
-1.377782, 0.2336797, -0.6929947, 1, 0.4901961, 0, 1,
-1.373881, -0.8971853, -1.64707, 1, 0.4980392, 0, 1,
-1.369712, -0.05752622, -0.4649068, 1, 0.5058824, 0, 1,
-1.366366, -0.5891794, -2.461323, 1, 0.509804, 0, 1,
-1.365567, 0.1324202, -1.608514, 1, 0.5176471, 0, 1,
-1.364793, -0.6798766, -3.288828, 1, 0.5215687, 0, 1,
-1.351092, 0.2821255, -1.79265, 1, 0.5294118, 0, 1,
-1.34403, 0.4482623, -0.7678314, 1, 0.5333334, 0, 1,
-1.342028, 0.4931283, 0.2306063, 1, 0.5411765, 0, 1,
-1.325293, -0.4532602, -1.673272, 1, 0.5450981, 0, 1,
-1.319645, 1.066443, 0.3282961, 1, 0.5529412, 0, 1,
-1.306071, -0.1287267, -2.055236, 1, 0.5568628, 0, 1,
-1.28477, 0.9428123, 0.8374262, 1, 0.5647059, 0, 1,
-1.28322, 0.09623602, -1.584862, 1, 0.5686275, 0, 1,
-1.282031, 0.7060664, -0.4996704, 1, 0.5764706, 0, 1,
-1.273888, 1.025485, -0.2620719, 1, 0.5803922, 0, 1,
-1.266528, 1.184765, -0.9615188, 1, 0.5882353, 0, 1,
-1.262594, 0.6838923, -0.5151358, 1, 0.5921569, 0, 1,
-1.255898, -0.6336728, -1.526299, 1, 0.6, 0, 1,
-1.252287, 1.062664, -0.9573866, 1, 0.6078432, 0, 1,
-1.245083, -0.3610077, -1.391502, 1, 0.6117647, 0, 1,
-1.219511, 0.1332871, -1.042065, 1, 0.6196079, 0, 1,
-1.210387, -0.2870759, -2.258888, 1, 0.6235294, 0, 1,
-1.199863, 1.746969, -1.891214, 1, 0.6313726, 0, 1,
-1.198002, 1.645537, -0.812972, 1, 0.6352941, 0, 1,
-1.196619, -0.6522331, -1.748327, 1, 0.6431373, 0, 1,
-1.187578, -0.4348288, -1.233905, 1, 0.6470588, 0, 1,
-1.184708, 0.4777919, -1.258846, 1, 0.654902, 0, 1,
-1.183318, -0.3200519, -2.897241, 1, 0.6588235, 0, 1,
-1.182221, 0.3254783, -2.013255, 1, 0.6666667, 0, 1,
-1.178084, 0.6316026, -0.2452138, 1, 0.6705883, 0, 1,
-1.173375, -0.9442794, -1.571882, 1, 0.6784314, 0, 1,
-1.169867, 0.7245485, -2.047299, 1, 0.682353, 0, 1,
-1.164222, 0.4990017, -0.414685, 1, 0.6901961, 0, 1,
-1.162603, 0.2301758, -1.359142, 1, 0.6941177, 0, 1,
-1.155986, -1.137449, -1.72052, 1, 0.7019608, 0, 1,
-1.149124, 0.06810909, -0.7345683, 1, 0.7098039, 0, 1,
-1.145999, 0.5278897, 0.5672608, 1, 0.7137255, 0, 1,
-1.143677, 0.5786591, -0.564064, 1, 0.7215686, 0, 1,
-1.141472, -0.9623808, -1.634743, 1, 0.7254902, 0, 1,
-1.138669, -0.6650625, -2.689276, 1, 0.7333333, 0, 1,
-1.137424, -0.5017572, -3.567342, 1, 0.7372549, 0, 1,
-1.126257, 0.4978195, -0.5757755, 1, 0.7450981, 0, 1,
-1.121643, 0.5473363, -0.8506109, 1, 0.7490196, 0, 1,
-1.113891, -2.980963, -1.912681, 1, 0.7568628, 0, 1,
-1.112, 0.9530751, -2.258374, 1, 0.7607843, 0, 1,
-1.10221, -0.2203471, -0.6017413, 1, 0.7686275, 0, 1,
-1.099317, 0.1378222, -2.056938, 1, 0.772549, 0, 1,
-1.085404, 0.4716251, -1.285812, 1, 0.7803922, 0, 1,
-1.083434, 0.4310033, 0.3493394, 1, 0.7843137, 0, 1,
-1.082723, -0.3102282, -4.135118, 1, 0.7921569, 0, 1,
-1.079617, 0.1361303, -3.286669, 1, 0.7960784, 0, 1,
-1.077125, 1.866142, 0.04981624, 1, 0.8039216, 0, 1,
-1.071812, 0.1438739, -0.4699293, 1, 0.8117647, 0, 1,
-1.062422, -0.03638184, -2.803904, 1, 0.8156863, 0, 1,
-1.055795, 1.637355, -0.04600548, 1, 0.8235294, 0, 1,
-1.048372, -0.351386, -0.9154168, 1, 0.827451, 0, 1,
-1.047339, -0.854423, -1.956409, 1, 0.8352941, 0, 1,
-1.044757, 0.2747364, -1.567011, 1, 0.8392157, 0, 1,
-1.043494, -0.2374157, -0.1762353, 1, 0.8470588, 0, 1,
-1.043238, -0.2133482, -1.057203, 1, 0.8509804, 0, 1,
-1.040967, 0.9940571, 0.6805792, 1, 0.8588235, 0, 1,
-1.039235, -0.2408061, -4.403858, 1, 0.8627451, 0, 1,
-1.037842, -0.6526503, -3.73906, 1, 0.8705882, 0, 1,
-1.03671, -0.2949995, -2.781838, 1, 0.8745098, 0, 1,
-1.035535, 1.996379, -1.12146, 1, 0.8823529, 0, 1,
-1.033808, 1.351596, -1.181358, 1, 0.8862745, 0, 1,
-1.029356, 0.5228445, -2.192185, 1, 0.8941177, 0, 1,
-1.025029, 0.8378305, -2.129657, 1, 0.8980392, 0, 1,
-1.024562, -1.187222, -2.02002, 1, 0.9058824, 0, 1,
-1.023387, -1.503605, -2.852642, 1, 0.9137255, 0, 1,
-1.018566, 0.2010514, -1.875666, 1, 0.9176471, 0, 1,
-1.018361, 0.6536877, -0.42281, 1, 0.9254902, 0, 1,
-1.017879, 0.8113889, -1.670006, 1, 0.9294118, 0, 1,
-1.013221, -2.691418, -2.387112, 1, 0.9372549, 0, 1,
-1.002555, -0.6233832, -3.232158, 1, 0.9411765, 0, 1,
-0.9968998, -0.9081394, -1.675644, 1, 0.9490196, 0, 1,
-0.9911363, -0.4072687, -1.54108, 1, 0.9529412, 0, 1,
-0.9863892, 0.4857038, -2.558893, 1, 0.9607843, 0, 1,
-0.9851731, -1.282556, -2.134233, 1, 0.9647059, 0, 1,
-0.9849455, 1.517969, -1.655836, 1, 0.972549, 0, 1,
-0.9783565, -0.1032036, -2.174607, 1, 0.9764706, 0, 1,
-0.9780661, 0.09602509, -3.689268, 1, 0.9843137, 0, 1,
-0.9693193, -0.457662, -2.153452, 1, 0.9882353, 0, 1,
-0.9673699, 0.1379256, -1.619392, 1, 0.9960784, 0, 1,
-0.950551, 1.377469, 0.1519359, 0.9960784, 1, 0, 1,
-0.9468737, 0.649523, -1.538062, 0.9921569, 1, 0, 1,
-0.9437414, -0.3872331, -1.705076, 0.9843137, 1, 0, 1,
-0.9421653, 0.5062385, -2.982241, 0.9803922, 1, 0, 1,
-0.9400418, -1.372552, 0.1693955, 0.972549, 1, 0, 1,
-0.9398432, 1.899558, -0.4634512, 0.9686275, 1, 0, 1,
-0.9369389, -0.5205422, -1.408074, 0.9607843, 1, 0, 1,
-0.9347868, -0.4341176, -1.619998, 0.9568627, 1, 0, 1,
-0.932487, 0.3369241, -2.432334, 0.9490196, 1, 0, 1,
-0.9294161, -0.4348791, -0.962198, 0.945098, 1, 0, 1,
-0.9225234, 1.092412, -1.478328, 0.9372549, 1, 0, 1,
-0.9218071, 0.6520258, -1.078444, 0.9333333, 1, 0, 1,
-0.9193873, 1.003113, 1.270978, 0.9254902, 1, 0, 1,
-0.9185098, -0.2376978, -3.159503, 0.9215686, 1, 0, 1,
-0.9183637, 0.02876192, -1.418179, 0.9137255, 1, 0, 1,
-0.9161615, -0.9083855, -2.426378, 0.9098039, 1, 0, 1,
-0.9065732, -0.3612293, -2.349002, 0.9019608, 1, 0, 1,
-0.901326, -0.5835327, -1.455221, 0.8941177, 1, 0, 1,
-0.8984671, -0.8691273, -0.4429021, 0.8901961, 1, 0, 1,
-0.8962333, -0.1516063, -2.103667, 0.8823529, 1, 0, 1,
-0.8917857, -0.349598, -2.762898, 0.8784314, 1, 0, 1,
-0.8890494, 1.757227, -0.6665961, 0.8705882, 1, 0, 1,
-0.8886794, 0.06072743, -1.863068, 0.8666667, 1, 0, 1,
-0.8862308, -1.685634, -2.867997, 0.8588235, 1, 0, 1,
-0.8787636, -0.2467673, -1.196417, 0.854902, 1, 0, 1,
-0.873863, 0.7617034, -0.8331572, 0.8470588, 1, 0, 1,
-0.8701478, 1.959183, -0.3519591, 0.8431373, 1, 0, 1,
-0.856973, 0.7315528, -1.053724, 0.8352941, 1, 0, 1,
-0.8530487, -2.053099, -2.210824, 0.8313726, 1, 0, 1,
-0.8520018, -1.165549, -2.40689, 0.8235294, 1, 0, 1,
-0.8511727, 0.8065462, -3.075759, 0.8196079, 1, 0, 1,
-0.8499319, -0.5496224, -2.162539, 0.8117647, 1, 0, 1,
-0.8446807, 1.71302, -1.209208, 0.8078431, 1, 0, 1,
-0.8397329, -1.132835, -3.742159, 0.8, 1, 0, 1,
-0.8395302, 2.02655, -0.05893402, 0.7921569, 1, 0, 1,
-0.8358638, 0.1135966, -0.2434427, 0.7882353, 1, 0, 1,
-0.8306047, 0.2300858, 0.4428773, 0.7803922, 1, 0, 1,
-0.8287671, 0.362149, -1.535133, 0.7764706, 1, 0, 1,
-0.8276756, 1.928193, -1.515953, 0.7686275, 1, 0, 1,
-0.8260716, 1.183573, -1.348296, 0.7647059, 1, 0, 1,
-0.8217312, 1.566296, -0.2261983, 0.7568628, 1, 0, 1,
-0.8182424, -0.2159632, -1.776258, 0.7529412, 1, 0, 1,
-0.8148834, 1.354629, -1.581087, 0.7450981, 1, 0, 1,
-0.8136613, -0.2047082, -1.411056, 0.7411765, 1, 0, 1,
-0.8125405, -0.1668282, -1.603558, 0.7333333, 1, 0, 1,
-0.8108363, 0.1263853, -0.9323055, 0.7294118, 1, 0, 1,
-0.7987473, -0.8419264, -2.660698, 0.7215686, 1, 0, 1,
-0.7978683, 2.07864, -0.892151, 0.7176471, 1, 0, 1,
-0.7957885, -3.342259, -2.735521, 0.7098039, 1, 0, 1,
-0.7926433, -0.3006304, -3.784956, 0.7058824, 1, 0, 1,
-0.7910835, 1.76809, 0.5133782, 0.6980392, 1, 0, 1,
-0.7872275, 1.379038, -1.790716, 0.6901961, 1, 0, 1,
-0.7792295, 0.2791, -2.093437, 0.6862745, 1, 0, 1,
-0.7784805, -0.8701462, -2.664463, 0.6784314, 1, 0, 1,
-0.7778094, 1.652721, 0.5476637, 0.6745098, 1, 0, 1,
-0.7744108, 1.166668, 0.3650314, 0.6666667, 1, 0, 1,
-0.774271, 0.004630942, -2.43181, 0.6627451, 1, 0, 1,
-0.7711432, -0.9681135, -2.83085, 0.654902, 1, 0, 1,
-0.7709152, -0.824855, -0.6423691, 0.6509804, 1, 0, 1,
-0.7688479, 0.2204297, -0.9732009, 0.6431373, 1, 0, 1,
-0.7668517, 0.2819343, -1.60389, 0.6392157, 1, 0, 1,
-0.7608354, -1.699634, -0.6076817, 0.6313726, 1, 0, 1,
-0.7601174, 2.454525, -2.750834, 0.627451, 1, 0, 1,
-0.7580021, -0.874751, -2.708982, 0.6196079, 1, 0, 1,
-0.7565067, -0.9701033, -2.878299, 0.6156863, 1, 0, 1,
-0.7562687, 0.7045825, -0.02404762, 0.6078432, 1, 0, 1,
-0.7497934, -0.2354772, -2.591105, 0.6039216, 1, 0, 1,
-0.7467419, 0.1964849, -2.043913, 0.5960785, 1, 0, 1,
-0.7437168, -0.5455224, -3.554075, 0.5882353, 1, 0, 1,
-0.7428459, -1.191243, -1.787067, 0.5843138, 1, 0, 1,
-0.7411802, 0.2707488, -2.36737, 0.5764706, 1, 0, 1,
-0.7343469, -0.6139827, -1.447737, 0.572549, 1, 0, 1,
-0.7289017, 1.378237, 0.04600953, 0.5647059, 1, 0, 1,
-0.7259369, 0.7583328, -1.069812, 0.5607843, 1, 0, 1,
-0.7253913, -0.7406797, -2.286609, 0.5529412, 1, 0, 1,
-0.7180014, -1.013865, -3.030963, 0.5490196, 1, 0, 1,
-0.7160348, -0.5486735, 0.2630504, 0.5411765, 1, 0, 1,
-0.7121966, 1.263879, 0.6916679, 0.5372549, 1, 0, 1,
-0.7074475, -0.3287424, -2.038069, 0.5294118, 1, 0, 1,
-0.7042273, -0.6997627, -0.2969172, 0.5254902, 1, 0, 1,
-0.7013825, 1.688613, -0.6959382, 0.5176471, 1, 0, 1,
-0.7006386, 0.0742783, -1.32985, 0.5137255, 1, 0, 1,
-0.6954419, 0.1368771, -1.204791, 0.5058824, 1, 0, 1,
-0.6856188, -0.6513088, -1.272943, 0.5019608, 1, 0, 1,
-0.683699, 2.902158, 1.071981, 0.4941176, 1, 0, 1,
-0.6823763, -0.1602594, -0.8780762, 0.4862745, 1, 0, 1,
-0.6798652, -0.8756226, -4.370263, 0.4823529, 1, 0, 1,
-0.6782541, -0.3859742, -0.8425392, 0.4745098, 1, 0, 1,
-0.6781744, 1.99359, -2.919524, 0.4705882, 1, 0, 1,
-0.6754335, -0.3581252, -2.647369, 0.4627451, 1, 0, 1,
-0.6712975, 0.5687439, -1.33419, 0.4588235, 1, 0, 1,
-0.6710744, -0.6973733, -3.391989, 0.4509804, 1, 0, 1,
-0.6690842, 0.9563451, -0.3651098, 0.4470588, 1, 0, 1,
-0.6672809, -1.301952, -3.109494, 0.4392157, 1, 0, 1,
-0.6671967, 1.423636, 0.6283859, 0.4352941, 1, 0, 1,
-0.6661497, 0.459676, -1.095664, 0.427451, 1, 0, 1,
-0.6569172, 0.723262, -0.8810933, 0.4235294, 1, 0, 1,
-0.656125, -0.8689054, -2.316776, 0.4156863, 1, 0, 1,
-0.6538593, -0.380672, -3.533386, 0.4117647, 1, 0, 1,
-0.6521426, 0.1345787, -1.222844, 0.4039216, 1, 0, 1,
-0.6429716, -0.4127059, -2.553158, 0.3960784, 1, 0, 1,
-0.6368689, -0.6760313, -1.654976, 0.3921569, 1, 0, 1,
-0.6328895, -1.103386, -2.028349, 0.3843137, 1, 0, 1,
-0.6307696, 0.7427155, -2.219285, 0.3803922, 1, 0, 1,
-0.6293099, -0.9629087, -2.21514, 0.372549, 1, 0, 1,
-0.6255567, -0.5194536, -1.802162, 0.3686275, 1, 0, 1,
-0.6240798, 0.8078331, -0.9641659, 0.3607843, 1, 0, 1,
-0.615296, 2.144707, 1.471746, 0.3568628, 1, 0, 1,
-0.612967, 1.196544, -1.929415, 0.3490196, 1, 0, 1,
-0.608925, 1.828457, -0.315262, 0.345098, 1, 0, 1,
-0.607151, 0.2840856, -0.9145917, 0.3372549, 1, 0, 1,
-0.6065035, 1.919906, -1.14088, 0.3333333, 1, 0, 1,
-0.6038734, 0.5486282, -0.2364138, 0.3254902, 1, 0, 1,
-0.5968928, -1.375274, -3.969587, 0.3215686, 1, 0, 1,
-0.5940608, 1.145946, 0.4626092, 0.3137255, 1, 0, 1,
-0.5920369, -0.0965872, 0.02130614, 0.3098039, 1, 0, 1,
-0.5886089, -1.004871, -4.141129, 0.3019608, 1, 0, 1,
-0.5822465, 1.318142, -1.340458, 0.2941177, 1, 0, 1,
-0.5801255, -0.07262221, -0.9609746, 0.2901961, 1, 0, 1,
-0.5747325, -2.477049, -1.899738, 0.282353, 1, 0, 1,
-0.5695933, 0.5932847, 0.06239096, 0.2784314, 1, 0, 1,
-0.568497, 0.8055645, 0.1298309, 0.2705882, 1, 0, 1,
-0.5654927, 0.2874292, -1.739167, 0.2666667, 1, 0, 1,
-0.5602068, 1.075684, -0.5199069, 0.2588235, 1, 0, 1,
-0.556485, -0.2041694, -1.251926, 0.254902, 1, 0, 1,
-0.5518802, 0.4343336, -2.744393, 0.2470588, 1, 0, 1,
-0.5435686, 1.494916, -1.029919, 0.2431373, 1, 0, 1,
-0.5387062, 0.1113753, -2.144873, 0.2352941, 1, 0, 1,
-0.5386699, 1.369146, -0.3045323, 0.2313726, 1, 0, 1,
-0.5373155, -1.022825, -2.59154, 0.2235294, 1, 0, 1,
-0.5344812, 0.8725667, -1.552656, 0.2196078, 1, 0, 1,
-0.5331245, -0.08289537, -2.121128, 0.2117647, 1, 0, 1,
-0.5308155, -0.6957054, 0.06424804, 0.2078431, 1, 0, 1,
-0.5253247, 1.418858, 1.144161, 0.2, 1, 0, 1,
-0.5229648, -1.001427, -2.555743, 0.1921569, 1, 0, 1,
-0.5114817, -0.1456087, -1.856503, 0.1882353, 1, 0, 1,
-0.5113241, 0.3042351, -0.432777, 0.1803922, 1, 0, 1,
-0.5107076, 0.5547668, -1.293476, 0.1764706, 1, 0, 1,
-0.5105175, 0.7191911, 0.06478382, 0.1686275, 1, 0, 1,
-0.5103639, -0.6346269, -3.137402, 0.1647059, 1, 0, 1,
-0.5091615, 0.6867179, 0.6855708, 0.1568628, 1, 0, 1,
-0.5081845, 0.9908251, -0.1138327, 0.1529412, 1, 0, 1,
-0.4995168, -0.7412794, -2.857499, 0.145098, 1, 0, 1,
-0.4994808, 1.053327, -1.041982, 0.1411765, 1, 0, 1,
-0.487045, -1.774379, -4.442819, 0.1333333, 1, 0, 1,
-0.4840706, -1.983992, -2.64382, 0.1294118, 1, 0, 1,
-0.4817826, 1.856372, 0.2269517, 0.1215686, 1, 0, 1,
-0.4813639, -0.4701277, -1.264023, 0.1176471, 1, 0, 1,
-0.4797249, 0.9516436, -0.5812942, 0.1098039, 1, 0, 1,
-0.4785626, -0.5898258, -2.660763, 0.1058824, 1, 0, 1,
-0.4769373, 0.745002, -0.5247969, 0.09803922, 1, 0, 1,
-0.4760029, 0.07023203, -0.4589338, 0.09019608, 1, 0, 1,
-0.4733754, -0.4489091, -2.619208, 0.08627451, 1, 0, 1,
-0.4700769, 0.06776796, -4.385354, 0.07843138, 1, 0, 1,
-0.4654844, -0.2865715, -2.397959, 0.07450981, 1, 0, 1,
-0.4639163, -1.694681, -3.473546, 0.06666667, 1, 0, 1,
-0.4630416, -1.350754, -3.01608, 0.0627451, 1, 0, 1,
-0.4595182, -0.1203978, -2.710892, 0.05490196, 1, 0, 1,
-0.4551378, -0.07121181, -0.7862858, 0.05098039, 1, 0, 1,
-0.4458463, 0.6552994, -0.7242208, 0.04313726, 1, 0, 1,
-0.4455791, 0.4816971, -1.677125, 0.03921569, 1, 0, 1,
-0.4452606, -1.472638, -1.097184, 0.03137255, 1, 0, 1,
-0.4378589, 0.2586259, -0.5740962, 0.02745098, 1, 0, 1,
-0.4378491, 0.1790601, 0.4447297, 0.01960784, 1, 0, 1,
-0.437239, -0.3378545, -1.057586, 0.01568628, 1, 0, 1,
-0.4352672, -0.9717978, -3.323704, 0.007843138, 1, 0, 1,
-0.4339516, -1.588979, -5.660301, 0.003921569, 1, 0, 1,
-0.4247273, 0.009732756, -2.876178, 0, 1, 0.003921569, 1,
-0.4220054, -0.2964497, -1.692024, 0, 1, 0.01176471, 1,
-0.42147, -1.108691, -4.381958, 0, 1, 0.01568628, 1,
-0.4213141, -0.5444484, -2.942438, 0, 1, 0.02352941, 1,
-0.4208788, -0.01241351, -1.131244, 0, 1, 0.02745098, 1,
-0.4168512, 0.3178407, 0.04210662, 0, 1, 0.03529412, 1,
-0.4161564, 0.3578704, -0.8190026, 0, 1, 0.03921569, 1,
-0.4127892, -0.7358912, -5.741972, 0, 1, 0.04705882, 1,
-0.4108235, 0.0634057, -0.07160198, 0, 1, 0.05098039, 1,
-0.4100405, -1.44837, -1.200638, 0, 1, 0.05882353, 1,
-0.4096567, -0.8598626, -3.096321, 0, 1, 0.0627451, 1,
-0.4079329, -0.9496796, -3.806891, 0, 1, 0.07058824, 1,
-0.4076723, 1.323254, -0.1395045, 0, 1, 0.07450981, 1,
-0.4045402, 1.533295, -3.179928, 0, 1, 0.08235294, 1,
-0.4042018, 0.9665699, 1.983212, 0, 1, 0.08627451, 1,
-0.403684, -1.218424, -2.725142, 0, 1, 0.09411765, 1,
-0.4020431, -0.1110721, -2.825276, 0, 1, 0.1019608, 1,
-0.398219, 0.200525, 0.5453011, 0, 1, 0.1058824, 1,
-0.3975332, 0.0463738, -0.4846062, 0, 1, 0.1137255, 1,
-0.3954201, 0.1619812, -0.09209148, 0, 1, 0.1176471, 1,
-0.387945, 1.245565, 0.2554186, 0, 1, 0.1254902, 1,
-0.3829917, -0.3165454, -1.795919, 0, 1, 0.1294118, 1,
-0.3829243, 0.2289342, -1.3629, 0, 1, 0.1372549, 1,
-0.3757004, -1.264235, -3.067373, 0, 1, 0.1411765, 1,
-0.3721657, 0.1684815, -1.499876, 0, 1, 0.1490196, 1,
-0.3644132, 0.2289125, -0.5504853, 0, 1, 0.1529412, 1,
-0.363483, -0.4856493, -0.9833446, 0, 1, 0.1607843, 1,
-0.3594407, -0.4002791, -3.805581, 0, 1, 0.1647059, 1,
-0.359286, 1.15023, -2.507563, 0, 1, 0.172549, 1,
-0.3558991, 1.095387, 0.4196229, 0, 1, 0.1764706, 1,
-0.3545313, -1.301558, -2.974164, 0, 1, 0.1843137, 1,
-0.3543694, -2.087115, -2.481358, 0, 1, 0.1882353, 1,
-0.3489337, -1.07903, -1.902077, 0, 1, 0.1960784, 1,
-0.3486217, -0.491743, -0.9275022, 0, 1, 0.2039216, 1,
-0.3483209, -1.204291, -1.609921, 0, 1, 0.2078431, 1,
-0.3462556, 0.3896218, -0.832666, 0, 1, 0.2156863, 1,
-0.3455974, -0.1036311, -3.473703, 0, 1, 0.2196078, 1,
-0.3451576, -0.6277903, -2.702983, 0, 1, 0.227451, 1,
-0.3416634, -0.1800933, -2.484614, 0, 1, 0.2313726, 1,
-0.3384171, -1.090377, -2.832718, 0, 1, 0.2392157, 1,
-0.3376206, -0.9226008, -2.929365, 0, 1, 0.2431373, 1,
-0.3373992, 0.6629481, -2.18095, 0, 1, 0.2509804, 1,
-0.3363353, 0.2655948, -2.103024, 0, 1, 0.254902, 1,
-0.3327676, 0.4046758, 0.5245623, 0, 1, 0.2627451, 1,
-0.3284718, 0.8344995, 1.343301, 0, 1, 0.2666667, 1,
-0.317115, -0.5338233, -3.634137, 0, 1, 0.2745098, 1,
-0.3169802, -0.9042515, -2.830177, 0, 1, 0.2784314, 1,
-0.3136407, 0.4107579, -0.01702345, 0, 1, 0.2862745, 1,
-0.3072073, 1.352599, 0.7164499, 0, 1, 0.2901961, 1,
-0.3062017, 0.6249698, 0.5401344, 0, 1, 0.2980392, 1,
-0.3054153, 0.4895964, 0.2941693, 0, 1, 0.3058824, 1,
-0.3044381, 0.4312202, 0.246988, 0, 1, 0.3098039, 1,
-0.3043355, 0.1606791, -0.3738542, 0, 1, 0.3176471, 1,
-0.3006931, 0.3435135, -0.1229422, 0, 1, 0.3215686, 1,
-0.3002658, 0.3203169, 0.4496942, 0, 1, 0.3294118, 1,
-0.3001435, -0.4226729, -1.644397, 0, 1, 0.3333333, 1,
-0.2995429, 0.9381337, -0.04026104, 0, 1, 0.3411765, 1,
-0.2976777, 0.8212814, -0.5058291, 0, 1, 0.345098, 1,
-0.2974972, 0.01903469, -2.341113, 0, 1, 0.3529412, 1,
-0.2970424, -0.5359166, -2.292694, 0, 1, 0.3568628, 1,
-0.2847993, 1.092731, 1.065925, 0, 1, 0.3647059, 1,
-0.2832089, 0.4104901, -0.7757455, 0, 1, 0.3686275, 1,
-0.279007, -1.321312, -2.338726, 0, 1, 0.3764706, 1,
-0.2758979, -1.893523, -5.052032, 0, 1, 0.3803922, 1,
-0.2756572, -0.2551806, -1.699673, 0, 1, 0.3882353, 1,
-0.2725314, -0.08019142, -1.326261, 0, 1, 0.3921569, 1,
-0.2711357, -0.4857455, -0.5368378, 0, 1, 0.4, 1,
-0.2675983, 0.08767938, -1.991596, 0, 1, 0.4078431, 1,
-0.2656316, 0.4341407, 1.784737, 0, 1, 0.4117647, 1,
-0.2625102, -0.1012207, 0.1606617, 0, 1, 0.4196078, 1,
-0.2615652, -0.5057381, -3.292837, 0, 1, 0.4235294, 1,
-0.259751, 0.5061789, -1.123459, 0, 1, 0.4313726, 1,
-0.2584498, -0.1835209, -3.28371, 0, 1, 0.4352941, 1,
-0.2527744, 0.1076407, -3.938174, 0, 1, 0.4431373, 1,
-0.2486349, 1.554722, 1.539232, 0, 1, 0.4470588, 1,
-0.2462184, 0.824299, 0.3169613, 0, 1, 0.454902, 1,
-0.2437087, -2.339887, -3.972728, 0, 1, 0.4588235, 1,
-0.2430654, -0.4494959, -3.724229, 0, 1, 0.4666667, 1,
-0.2419823, 0.3334449, 0.8820887, 0, 1, 0.4705882, 1,
-0.2382688, -0.7844631, -0.4939089, 0, 1, 0.4784314, 1,
-0.236678, 1.589872, 1.188066, 0, 1, 0.4823529, 1,
-0.235176, 0.506138, -1.873059, 0, 1, 0.4901961, 1,
-0.2301087, 0.9353819, -0.6611994, 0, 1, 0.4941176, 1,
-0.222075, 0.5006003, -0.9215185, 0, 1, 0.5019608, 1,
-0.219407, -1.793817, -1.8314, 0, 1, 0.509804, 1,
-0.2150535, -1.630419, -2.565687, 0, 1, 0.5137255, 1,
-0.2062147, 0.6177555, 0.000192096, 0, 1, 0.5215687, 1,
-0.2045914, -0.7289214, -2.722522, 0, 1, 0.5254902, 1,
-0.203858, -0.9524313, -3.486911, 0, 1, 0.5333334, 1,
-0.2035026, 2.036211, 0.911167, 0, 1, 0.5372549, 1,
-0.2033827, -0.1042456, -1.330782, 0, 1, 0.5450981, 1,
-0.202316, 1.766652, -0.2931781, 0, 1, 0.5490196, 1,
-0.2022009, 0.9740849, -0.6272835, 0, 1, 0.5568628, 1,
-0.2010632, -1.816913, -2.302692, 0, 1, 0.5607843, 1,
-0.1978072, -0.4137388, -2.484004, 0, 1, 0.5686275, 1,
-0.1932054, 0.3159271, -1.120003, 0, 1, 0.572549, 1,
-0.1899988, 0.07477929, -0.4657875, 0, 1, 0.5803922, 1,
-0.1899829, 1.011507, -1.094763, 0, 1, 0.5843138, 1,
-0.1873973, -0.9028411, -2.820541, 0, 1, 0.5921569, 1,
-0.1850751, 0.1392208, -2.275413, 0, 1, 0.5960785, 1,
-0.1798148, 1.08239, -1.947896, 0, 1, 0.6039216, 1,
-0.1772705, -2.393901, -1.901189, 0, 1, 0.6117647, 1,
-0.173537, 1.398146, 0.2266796, 0, 1, 0.6156863, 1,
-0.1707403, -1.835516, -2.522966, 0, 1, 0.6235294, 1,
-0.1705436, 0.962325, -2.029936, 0, 1, 0.627451, 1,
-0.1618639, -0.430149, -3.09693, 0, 1, 0.6352941, 1,
-0.161138, 0.5355068, 0.7753881, 0, 1, 0.6392157, 1,
-0.1571587, 0.7229093, -1.000532, 0, 1, 0.6470588, 1,
-0.1570139, -0.04360754, -2.33758, 0, 1, 0.6509804, 1,
-0.1527579, 0.306067, -1.697483, 0, 1, 0.6588235, 1,
-0.1511068, 0.5852523, 1.416047, 0, 1, 0.6627451, 1,
-0.1509718, -0.3866413, -4.145094, 0, 1, 0.6705883, 1,
-0.1509493, -1.010709, -1.792298, 0, 1, 0.6745098, 1,
-0.1487918, -0.4796068, -3.53255, 0, 1, 0.682353, 1,
-0.1487783, -0.8084948, -3.356792, 0, 1, 0.6862745, 1,
-0.1463136, -0.138721, -0.1688539, 0, 1, 0.6941177, 1,
-0.144529, -0.01840284, -2.447967, 0, 1, 0.7019608, 1,
-0.1398165, -1.968247, -2.938365, 0, 1, 0.7058824, 1,
-0.139741, -0.2249, -2.453856, 0, 1, 0.7137255, 1,
-0.1365193, 0.7469311, -1.010614, 0, 1, 0.7176471, 1,
-0.1342532, 1.300381, -2.308778, 0, 1, 0.7254902, 1,
-0.1320888, -2.647984, -3.43472, 0, 1, 0.7294118, 1,
-0.1291251, 1.582157, 0.4811289, 0, 1, 0.7372549, 1,
-0.1219269, -0.795298, -4.950948, 0, 1, 0.7411765, 1,
-0.1187589, -0.3239304, -2.177157, 0, 1, 0.7490196, 1,
-0.1185693, 0.3093064, -1.408113, 0, 1, 0.7529412, 1,
-0.1140739, -1.992534, -2.617601, 0, 1, 0.7607843, 1,
-0.1122886, 0.2261982, 0.2748011, 0, 1, 0.7647059, 1,
-0.1106841, -0.4344194, -3.52528, 0, 1, 0.772549, 1,
-0.1100248, -0.6939874, -2.187416, 0, 1, 0.7764706, 1,
-0.1071288, -0.3539006, -3.165037, 0, 1, 0.7843137, 1,
-0.1054166, 0.9294962, -0.008828652, 0, 1, 0.7882353, 1,
-0.100233, -0.4164052, -3.725337, 0, 1, 0.7960784, 1,
-0.09930813, -0.4651511, -3.9712, 0, 1, 0.8039216, 1,
-0.09775896, -0.7896701, -3.955006, 0, 1, 0.8078431, 1,
-0.0968577, -0.7943693, -3.018165, 0, 1, 0.8156863, 1,
-0.09646756, -0.4919844, -2.316678, 0, 1, 0.8196079, 1,
-0.09645336, -0.9234715, -3.812765, 0, 1, 0.827451, 1,
-0.09321137, -0.2363968, -3.467152, 0, 1, 0.8313726, 1,
-0.09179987, 0.6922676, -0.05293138, 0, 1, 0.8392157, 1,
-0.0910772, -0.755357, -1.585736, 0, 1, 0.8431373, 1,
-0.0830105, -1.854555, -4.274244, 0, 1, 0.8509804, 1,
-0.07718248, 0.9716027, 0.6312134, 0, 1, 0.854902, 1,
-0.07680882, 0.5544667, -0.9697065, 0, 1, 0.8627451, 1,
-0.07253205, -0.6492423, -2.223747, 0, 1, 0.8666667, 1,
-0.07193781, -0.20793, -2.122195, 0, 1, 0.8745098, 1,
-0.07021319, 0.8495666, 0.0588822, 0, 1, 0.8784314, 1,
-0.07020168, 0.4287733, -1.052061, 0, 1, 0.8862745, 1,
-0.06914097, -1.084923, -3.85292, 0, 1, 0.8901961, 1,
-0.06818977, -1.164289, -4.233629, 0, 1, 0.8980392, 1,
-0.0669655, -1.368359, -2.523088, 0, 1, 0.9058824, 1,
-0.06198033, 0.3107826, -1.262706, 0, 1, 0.9098039, 1,
-0.06120244, 0.8962884, 0.7351043, 0, 1, 0.9176471, 1,
-0.06008797, -1.956715, -0.7296546, 0, 1, 0.9215686, 1,
-0.05938604, 1.448235, -0.6316156, 0, 1, 0.9294118, 1,
-0.05844578, -0.1395467, -3.974712, 0, 1, 0.9333333, 1,
-0.05406006, 0.07186042, -0.6758078, 0, 1, 0.9411765, 1,
-0.05085281, 1.76368, 0.2573167, 0, 1, 0.945098, 1,
-0.04923245, 0.9309359, -1.376081, 0, 1, 0.9529412, 1,
-0.04664928, 0.4092305, -0.387254, 0, 1, 0.9568627, 1,
-0.04579147, -0.7035511, -2.216043, 0, 1, 0.9647059, 1,
-0.04438503, -0.03611831, -1.902898, 0, 1, 0.9686275, 1,
-0.04289076, -1.644905, -5.161644, 0, 1, 0.9764706, 1,
-0.04270982, 1.075095, 2.095467, 0, 1, 0.9803922, 1,
-0.04228127, -0.4848799, -4.533072, 0, 1, 0.9882353, 1,
-0.03878616, 0.4526735, 0.1785924, 0, 1, 0.9921569, 1,
-0.0362267, 0.7523335, 0.7315246, 0, 1, 1, 1,
-0.03318904, 0.1790648, -1.736, 0, 0.9921569, 1, 1,
-0.03114542, -0.3045647, -2.41861, 0, 0.9882353, 1, 1,
-0.0302285, 0.3529815, -0.7396998, 0, 0.9803922, 1, 1,
-0.0300589, 1.075477, 0.8818487, 0, 0.9764706, 1, 1,
-0.02792848, 1.117417, 0.15199, 0, 0.9686275, 1, 1,
-0.02660099, 0.116633, -0.2262989, 0, 0.9647059, 1, 1,
-0.02565545, -0.6498096, -2.446888, 0, 0.9568627, 1, 1,
-0.02287577, -1.346263, -2.938765, 0, 0.9529412, 1, 1,
-0.02018222, -1.401418, -3.837721, 0, 0.945098, 1, 1,
-0.01516511, -1.970802, -3.308172, 0, 0.9411765, 1, 1,
-0.01489124, 0.09647662, -2.32194, 0, 0.9333333, 1, 1,
-0.01477896, -0.2087816, -1.506418, 0, 0.9294118, 1, 1,
-0.007920884, 0.198262, -1.429302, 0, 0.9215686, 1, 1,
-0.004602799, 0.02639224, -1.603028, 0, 0.9176471, 1, 1,
-0.004537116, 2.104096, 0.03383453, 0, 0.9098039, 1, 1,
-0.002196935, 0.8668785, 0.8260395, 0, 0.9058824, 1, 1,
-0.001119908, 0.6869711, -0.02967314, 0, 0.8980392, 1, 1,
-0.0009477407, -0.1885545, -2.466673, 0, 0.8901961, 1, 1,
-0.0003329515, 0.8978345, 0.7919709, 0, 0.8862745, 1, 1,
0.0001477349, 0.4388124, -0.4547901, 0, 0.8784314, 1, 1,
0.004864086, 1.273445, -1.187702, 0, 0.8745098, 1, 1,
0.006063055, 0.6442623, 1.380722, 0, 0.8666667, 1, 1,
0.008244517, -0.173855, 3.559019, 0, 0.8627451, 1, 1,
0.01102813, -0.3902094, 4.771421, 0, 0.854902, 1, 1,
0.01260037, -1.388109, 2.419869, 0, 0.8509804, 1, 1,
0.01452742, -0.1459028, 3.492483, 0, 0.8431373, 1, 1,
0.02182036, -0.8471966, 3.579606, 0, 0.8392157, 1, 1,
0.02424471, -2.06392, 4.020986, 0, 0.8313726, 1, 1,
0.02639048, 1.854387, -0.1874696, 0, 0.827451, 1, 1,
0.02901886, 0.8159605, 1.031012, 0, 0.8196079, 1, 1,
0.03466905, -0.5713299, 2.65117, 0, 0.8156863, 1, 1,
0.03683051, 0.97012, 0.5066206, 0, 0.8078431, 1, 1,
0.03708201, 0.3020832, -1.195378, 0, 0.8039216, 1, 1,
0.04241688, -0.2973661, 3.201775, 0, 0.7960784, 1, 1,
0.04426426, 0.3398904, -1.230353, 0, 0.7882353, 1, 1,
0.04806475, -0.7207218, 2.536704, 0, 0.7843137, 1, 1,
0.05030381, -0.02956236, 1.669046, 0, 0.7764706, 1, 1,
0.05408224, -0.2490428, 3.284003, 0, 0.772549, 1, 1,
0.05888028, 0.3726827, -0.6535175, 0, 0.7647059, 1, 1,
0.06010724, -1.54171, 4.306977, 0, 0.7607843, 1, 1,
0.0602055, -0.5626373, 4.85948, 0, 0.7529412, 1, 1,
0.06280082, -0.2306798, 1.897441, 0, 0.7490196, 1, 1,
0.06566484, 0.3628301, -1.609368, 0, 0.7411765, 1, 1,
0.07031757, 0.1179571, 0.332369, 0, 0.7372549, 1, 1,
0.07059074, -0.4041097, 3.889208, 0, 0.7294118, 1, 1,
0.07076961, -0.8233793, 3.1666, 0, 0.7254902, 1, 1,
0.07542254, -0.8997891, 3.118851, 0, 0.7176471, 1, 1,
0.07647847, -0.9839014, 3.024106, 0, 0.7137255, 1, 1,
0.07831164, 0.944639, 0.1648062, 0, 0.7058824, 1, 1,
0.07861329, 0.568729, -0.6838779, 0, 0.6980392, 1, 1,
0.08041254, 0.7448981, 1.041134, 0, 0.6941177, 1, 1,
0.08285127, -0.3631116, 2.804438, 0, 0.6862745, 1, 1,
0.08290176, 0.3704022, 0.3839296, 0, 0.682353, 1, 1,
0.08327977, 1.765572, -1.077974, 0, 0.6745098, 1, 1,
0.08529452, 1.369938, -1.079154, 0, 0.6705883, 1, 1,
0.086776, 0.3506192, 0.2409099, 0, 0.6627451, 1, 1,
0.08692525, 0.9706848, 0.05028979, 0, 0.6588235, 1, 1,
0.08989913, 1.709551, -0.2939567, 0, 0.6509804, 1, 1,
0.09779225, -2.095928, 4.419051, 0, 0.6470588, 1, 1,
0.09887146, 0.4072475, 0.09857486, 0, 0.6392157, 1, 1,
0.1002855, 0.4447453, 0.5805135, 0, 0.6352941, 1, 1,
0.1023277, -0.4842423, 2.382085, 0, 0.627451, 1, 1,
0.1039386, -0.2293096, 3.464202, 0, 0.6235294, 1, 1,
0.1062716, -1.202288, 3.297647, 0, 0.6156863, 1, 1,
0.1091223, 0.3227558, 0.5599842, 0, 0.6117647, 1, 1,
0.1112321, 1.88207, 0.5427819, 0, 0.6039216, 1, 1,
0.1131858, 0.06745356, 2.202024, 0, 0.5960785, 1, 1,
0.1133221, 0.1963172, -0.8614514, 0, 0.5921569, 1, 1,
0.114435, 0.01645967, 1.712476, 0, 0.5843138, 1, 1,
0.1170726, 0.6527238, 1.2144, 0, 0.5803922, 1, 1,
0.1238022, 0.9156073, 1.664869, 0, 0.572549, 1, 1,
0.1262572, 1.294234, 0.511138, 0, 0.5686275, 1, 1,
0.1294986, -0.00707932, 0.5898841, 0, 0.5607843, 1, 1,
0.1333846, 0.9107552, 1.869574, 0, 0.5568628, 1, 1,
0.1340822, -0.1227682, 2.442037, 0, 0.5490196, 1, 1,
0.1341523, -0.7960308, 2.483756, 0, 0.5450981, 1, 1,
0.1347284, -0.6550086, 4.354213, 0, 0.5372549, 1, 1,
0.1353685, 1.238067, -0.3838983, 0, 0.5333334, 1, 1,
0.1420228, 1.153721, -1.287329, 0, 0.5254902, 1, 1,
0.1433025, -0.3970861, 4.258119, 0, 0.5215687, 1, 1,
0.1491731, 0.6643102, 0.1134847, 0, 0.5137255, 1, 1,
0.1507626, 1.152976, -0.2075915, 0, 0.509804, 1, 1,
0.1526907, -0.6341829, 5.010343, 0, 0.5019608, 1, 1,
0.1531041, 2.137232, 0.331829, 0, 0.4941176, 1, 1,
0.1592057, -1.571381, 2.678256, 0, 0.4901961, 1, 1,
0.1595133, 0.5839276, 1.456813, 0, 0.4823529, 1, 1,
0.1605214, 0.4816809, -0.89884, 0, 0.4784314, 1, 1,
0.1675986, 0.5599885, 0.577496, 0, 0.4705882, 1, 1,
0.1736528, 1.012932, -1.745081, 0, 0.4666667, 1, 1,
0.1739921, 0.05442334, -0.3134277, 0, 0.4588235, 1, 1,
0.1809551, -0.6398348, 5.390501, 0, 0.454902, 1, 1,
0.1833926, 0.6477123, 0.6680276, 0, 0.4470588, 1, 1,
0.192105, 1.02103, 1.506051, 0, 0.4431373, 1, 1,
0.193225, 1.394355, -1.607715, 0, 0.4352941, 1, 1,
0.1953143, 0.9194527, 0.546563, 0, 0.4313726, 1, 1,
0.1994118, -0.1010948, 1.786676, 0, 0.4235294, 1, 1,
0.1999084, -1.137246, 4.38751, 0, 0.4196078, 1, 1,
0.2056734, -0.01513041, 2.321836, 0, 0.4117647, 1, 1,
0.2104539, 0.2815794, 0.794941, 0, 0.4078431, 1, 1,
0.212528, 0.4744628, -0.6632309, 0, 0.4, 1, 1,
0.2146553, -1.536379, 2.98872, 0, 0.3921569, 1, 1,
0.2173343, 0.2542736, 0.8116975, 0, 0.3882353, 1, 1,
0.2206717, 0.3075637, -0.4560265, 0, 0.3803922, 1, 1,
0.2243436, 0.352055, -0.42395, 0, 0.3764706, 1, 1,
0.224452, 1.831821, -0.05674909, 0, 0.3686275, 1, 1,
0.230042, -1.050478, 2.41294, 0, 0.3647059, 1, 1,
0.2313983, 0.08573328, 2.766527, 0, 0.3568628, 1, 1,
0.2327881, -2.146432, 4.286399, 0, 0.3529412, 1, 1,
0.2365451, -0.07034185, -0.0147913, 0, 0.345098, 1, 1,
0.2518404, 0.998407, 0.8681179, 0, 0.3411765, 1, 1,
0.2519655, -0.9603653, 4.139244, 0, 0.3333333, 1, 1,
0.2588778, 1.169158, 0.3963574, 0, 0.3294118, 1, 1,
0.2645288, -1.966869, 2.046982, 0, 0.3215686, 1, 1,
0.2661493, 1.464129, 0.09969402, 0, 0.3176471, 1, 1,
0.2669595, 0.3921495, -0.8638785, 0, 0.3098039, 1, 1,
0.2685794, -0.403325, 1.758882, 0, 0.3058824, 1, 1,
0.269034, -0.2116942, 1.469119, 0, 0.2980392, 1, 1,
0.2697005, 0.4251142, -0.174645, 0, 0.2901961, 1, 1,
0.2719125, -0.4662851, 4.878374, 0, 0.2862745, 1, 1,
0.2746971, 0.7887235, 1.039089, 0, 0.2784314, 1, 1,
0.2758108, 1.081969, 1.51248, 0, 0.2745098, 1, 1,
0.2795486, 0.9616397, -0.6752412, 0, 0.2666667, 1, 1,
0.2836761, 0.5861347, -1.630023, 0, 0.2627451, 1, 1,
0.2854263, 0.7399383, -0.0679979, 0, 0.254902, 1, 1,
0.2886794, -0.4857167, 2.879389, 0, 0.2509804, 1, 1,
0.2931043, 1.27694, 1.382975, 0, 0.2431373, 1, 1,
0.293657, -1.933824, 2.651248, 0, 0.2392157, 1, 1,
0.2940364, 0.5570766, -0.4438581, 0, 0.2313726, 1, 1,
0.2942363, 1.172734, 0.3385523, 0, 0.227451, 1, 1,
0.2950652, 0.7940442, 0.396205, 0, 0.2196078, 1, 1,
0.2954708, 0.9101372, 1.811647, 0, 0.2156863, 1, 1,
0.2958299, 0.05412621, 2.214068, 0, 0.2078431, 1, 1,
0.3049118, 1.134552, 1.004519, 0, 0.2039216, 1, 1,
0.3090042, 1.854993, 1.191527, 0, 0.1960784, 1, 1,
0.3165866, 1.433676, 0.7674372, 0, 0.1882353, 1, 1,
0.3175338, -1.255612, 1.509038, 0, 0.1843137, 1, 1,
0.3218272, -0.8289381, 2.269875, 0, 0.1764706, 1, 1,
0.3228797, -0.8717731, 2.469609, 0, 0.172549, 1, 1,
0.326065, 0.878172, -0.274115, 0, 0.1647059, 1, 1,
0.3289391, 0.5705948, -1.983928, 0, 0.1607843, 1, 1,
0.3317636, 1.216288, -0.9319296, 0, 0.1529412, 1, 1,
0.332468, -0.8979802, 3.319189, 0, 0.1490196, 1, 1,
0.3345466, 1.022979, -2.099687, 0, 0.1411765, 1, 1,
0.3354925, -1.134181, 2.182212, 0, 0.1372549, 1, 1,
0.3387983, 0.3799565, 0.6374328, 0, 0.1294118, 1, 1,
0.3419753, -1.150518, 0.927462, 0, 0.1254902, 1, 1,
0.3421156, -1.244948, 3.394505, 0, 0.1176471, 1, 1,
0.3437491, 0.5375519, 1.358137, 0, 0.1137255, 1, 1,
0.346399, -0.1640645, 0.819957, 0, 0.1058824, 1, 1,
0.3485037, -0.2147335, 2.413602, 0, 0.09803922, 1, 1,
0.3508739, -0.608021, 1.158152, 0, 0.09411765, 1, 1,
0.3545406, 0.2583684, -1.009065, 0, 0.08627451, 1, 1,
0.3691789, 0.9620797, 1.474748, 0, 0.08235294, 1, 1,
0.3776899, -1.192657, 2.338992, 0, 0.07450981, 1, 1,
0.3802248, -0.3864177, 1.533902, 0, 0.07058824, 1, 1,
0.3822816, 1.611964, 0.8644611, 0, 0.0627451, 1, 1,
0.3834004, 0.8193197, -0.04147459, 0, 0.05882353, 1, 1,
0.3848845, -1.498138, 2.730755, 0, 0.05098039, 1, 1,
0.3885674, 0.005017722, 2.388659, 0, 0.04705882, 1, 1,
0.3963886, -0.08987881, 2.716201, 0, 0.03921569, 1, 1,
0.3964629, 0.2165761, 0.471052, 0, 0.03529412, 1, 1,
0.3994547, 0.9790589, -1.076676, 0, 0.02745098, 1, 1,
0.4028971, -0.3471482, 1.381567, 0, 0.02352941, 1, 1,
0.4029516, 0.3911162, 1.254251, 0, 0.01568628, 1, 1,
0.4100834, -0.04665575, 2.282825, 0, 0.01176471, 1, 1,
0.4101576, 1.094908, -0.1932674, 0, 0.003921569, 1, 1,
0.4187064, 0.9194595, 0.1409727, 0.003921569, 0, 1, 1,
0.4199196, -0.3906811, 2.054816, 0.007843138, 0, 1, 1,
0.4201692, -1.215294, 1.208614, 0.01568628, 0, 1, 1,
0.427431, 0.06762207, 1.803799, 0.01960784, 0, 1, 1,
0.42883, 0.8287451, -0.8271816, 0.02745098, 0, 1, 1,
0.4303323, -0.6191422, 3.114481, 0.03137255, 0, 1, 1,
0.4324022, 1.438469, 2.526365, 0.03921569, 0, 1, 1,
0.4356465, -1.189365, 2.914923, 0.04313726, 0, 1, 1,
0.4369446, 0.4646086, 1.709892, 0.05098039, 0, 1, 1,
0.4377597, 0.7926438, -0.4824743, 0.05490196, 0, 1, 1,
0.4409862, -0.1117615, 4.345526, 0.0627451, 0, 1, 1,
0.4421118, 0.4000289, 2.918169, 0.06666667, 0, 1, 1,
0.4473001, -1.287502, 3.795088, 0.07450981, 0, 1, 1,
0.4474912, 1.013233, -0.1174004, 0.07843138, 0, 1, 1,
0.4480884, -0.6802509, 1.375336, 0.08627451, 0, 1, 1,
0.4499422, -1.554096, 2.715553, 0.09019608, 0, 1, 1,
0.4501624, -0.3049427, 1.213589, 0.09803922, 0, 1, 1,
0.4509375, 1.827036, -0.602826, 0.1058824, 0, 1, 1,
0.4532499, -1.417991, 1.64979, 0.1098039, 0, 1, 1,
0.4546634, 0.7907513, 2.316691, 0.1176471, 0, 1, 1,
0.4551904, -0.3060475, -0.1629677, 0.1215686, 0, 1, 1,
0.4566978, -0.3063695, 2.543414, 0.1294118, 0, 1, 1,
0.4648154, 1.963849, 1.529953, 0.1333333, 0, 1, 1,
0.469949, 1.045505, 1.3529, 0.1411765, 0, 1, 1,
0.4708479, -0.5690998, 2.2023, 0.145098, 0, 1, 1,
0.4712941, 0.1285662, 1.821949, 0.1529412, 0, 1, 1,
0.4732695, -0.4360434, 0.6789098, 0.1568628, 0, 1, 1,
0.4751517, 1.207999, -0.2119018, 0.1647059, 0, 1, 1,
0.4767766, -0.3652146, 3.31746, 0.1686275, 0, 1, 1,
0.4789821, 0.2621443, 0.7221742, 0.1764706, 0, 1, 1,
0.4793192, 0.5229496, 0.2417374, 0.1803922, 0, 1, 1,
0.4820088, -1.0798, 3.808887, 0.1882353, 0, 1, 1,
0.4839126, 0.1654877, 2.416527, 0.1921569, 0, 1, 1,
0.4899496, -0.6067941, 1.952234, 0.2, 0, 1, 1,
0.4917156, -0.4857442, 3.019698, 0.2078431, 0, 1, 1,
0.498106, 0.3437829, 1.996125, 0.2117647, 0, 1, 1,
0.5079054, 0.6648861, -0.2176234, 0.2196078, 0, 1, 1,
0.511506, 0.1797209, 0.9429047, 0.2235294, 0, 1, 1,
0.5149623, -0.3561375, 2.755222, 0.2313726, 0, 1, 1,
0.5163941, 1.090285, 0.02287927, 0.2352941, 0, 1, 1,
0.5191256, -0.3784288, 2.30024, 0.2431373, 0, 1, 1,
0.5257478, -0.6693594, 2.067517, 0.2470588, 0, 1, 1,
0.5298579, 0.1082209, 2.004755, 0.254902, 0, 1, 1,
0.5307832, 0.8075957, 1.180595, 0.2588235, 0, 1, 1,
0.5318312, -2.519599, 3.98008, 0.2666667, 0, 1, 1,
0.5320107, -1.364444, 2.684749, 0.2705882, 0, 1, 1,
0.5344019, 0.5572957, -1.092335, 0.2784314, 0, 1, 1,
0.5403981, -1.332746, 1.040157, 0.282353, 0, 1, 1,
0.5441705, -0.2200453, 2.589061, 0.2901961, 0, 1, 1,
0.5448617, -0.9692093, 3.217916, 0.2941177, 0, 1, 1,
0.5451941, -0.1364339, 0.001362074, 0.3019608, 0, 1, 1,
0.5460826, -0.5479428, 2.993375, 0.3098039, 0, 1, 1,
0.5472131, 0.1020797, 0.9708039, 0.3137255, 0, 1, 1,
0.5485398, 0.6493276, 1.219085, 0.3215686, 0, 1, 1,
0.5515164, -1.993369, 3.579493, 0.3254902, 0, 1, 1,
0.5542893, 1.061088, 0.6124327, 0.3333333, 0, 1, 1,
0.5559505, -0.3207414, 0.5507396, 0.3372549, 0, 1, 1,
0.5611762, -1.055822, 5.00674, 0.345098, 0, 1, 1,
0.5665592, 0.4520245, 1.566599, 0.3490196, 0, 1, 1,
0.5681689, -0.1359673, 2.080499, 0.3568628, 0, 1, 1,
0.5696578, 2.671852, -0.2236086, 0.3607843, 0, 1, 1,
0.5826762, 0.6808264, 0.7066832, 0.3686275, 0, 1, 1,
0.5835348, -1.490241, 2.767526, 0.372549, 0, 1, 1,
0.5872197, -0.7707978, 2.134854, 0.3803922, 0, 1, 1,
0.5890245, 0.6788213, -0.01189556, 0.3843137, 0, 1, 1,
0.5893328, -1.228885, 3.661178, 0.3921569, 0, 1, 1,
0.592926, -0.9256101, 2.970221, 0.3960784, 0, 1, 1,
0.5937245, -2.196934, 2.717628, 0.4039216, 0, 1, 1,
0.5957601, -0.09233762, 1.906233, 0.4117647, 0, 1, 1,
0.5996083, -0.9642031, 2.306913, 0.4156863, 0, 1, 1,
0.6017973, -0.4876268, 1.2637, 0.4235294, 0, 1, 1,
0.6028191, 1.016451, 2.876977, 0.427451, 0, 1, 1,
0.6077871, -0.7913336, 4.244654, 0.4352941, 0, 1, 1,
0.6078057, -0.5989795, 2.061229, 0.4392157, 0, 1, 1,
0.6083877, -1.104595, 2.260495, 0.4470588, 0, 1, 1,
0.6099664, 0.02038197, 3.086377, 0.4509804, 0, 1, 1,
0.6129343, -0.2320998, 1.644358, 0.4588235, 0, 1, 1,
0.6174105, -1.292141, 3.335194, 0.4627451, 0, 1, 1,
0.617909, -0.411081, 2.122838, 0.4705882, 0, 1, 1,
0.6186278, -1.680328, 2.866334, 0.4745098, 0, 1, 1,
0.6186894, -0.2380962, 1.900935, 0.4823529, 0, 1, 1,
0.6193615, 0.200759, 0.9090655, 0.4862745, 0, 1, 1,
0.6207407, 0.7887981, -0.4302429, 0.4941176, 0, 1, 1,
0.6234017, -1.164778, 1.603661, 0.5019608, 0, 1, 1,
0.6290954, 1.403973, 0.06160217, 0.5058824, 0, 1, 1,
0.6312842, 0.5097593, 2.274438, 0.5137255, 0, 1, 1,
0.6386485, -1.655595, 2.318245, 0.5176471, 0, 1, 1,
0.6453337, 1.082007, 2.3716, 0.5254902, 0, 1, 1,
0.6453868, -0.4124202, 2.63019, 0.5294118, 0, 1, 1,
0.6475431, 0.8083966, 0.9153538, 0.5372549, 0, 1, 1,
0.6476796, -0.2920338, 3.155479, 0.5411765, 0, 1, 1,
0.6516618, 0.2331888, 1.295884, 0.5490196, 0, 1, 1,
0.6558223, -0.3258274, 1.72982, 0.5529412, 0, 1, 1,
0.656718, -0.7856666, 3.202442, 0.5607843, 0, 1, 1,
0.6630129, -1.784771, 3.026197, 0.5647059, 0, 1, 1,
0.6697818, -0.2436248, 2.394154, 0.572549, 0, 1, 1,
0.6706281, 0.1580596, 0.2231489, 0.5764706, 0, 1, 1,
0.6722015, -0.1904051, 1.622892, 0.5843138, 0, 1, 1,
0.6790254, -2.230446, 2.114674, 0.5882353, 0, 1, 1,
0.682894, 1.348598, 1.6613, 0.5960785, 0, 1, 1,
0.6883089, -0.8507016, 0.7084941, 0.6039216, 0, 1, 1,
0.6896605, 0.4819899, 0.8336621, 0.6078432, 0, 1, 1,
0.7009043, 0.7947078, 0.8907861, 0.6156863, 0, 1, 1,
0.704892, 0.3729, 1.08315, 0.6196079, 0, 1, 1,
0.708508, 0.590072, 0.287421, 0.627451, 0, 1, 1,
0.7103209, -0.5013216, 2.386088, 0.6313726, 0, 1, 1,
0.7119402, -1.059334, 3.496193, 0.6392157, 0, 1, 1,
0.7143683, 1.205974, -0.9341067, 0.6431373, 0, 1, 1,
0.723217, -0.3067782, 2.38158, 0.6509804, 0, 1, 1,
0.7239454, -0.4780891, 0.7108446, 0.654902, 0, 1, 1,
0.7278997, 0.3581066, 1.438639, 0.6627451, 0, 1, 1,
0.7293659, -1.668663, 2.967021, 0.6666667, 0, 1, 1,
0.7366101, -0.2405577, 0.4165355, 0.6745098, 0, 1, 1,
0.7441893, -1.402692, 3.870551, 0.6784314, 0, 1, 1,
0.7678523, -0.8909552, 2.006972, 0.6862745, 0, 1, 1,
0.7958422, -1.582721, 2.885448, 0.6901961, 0, 1, 1,
0.7997347, -0.9887453, 2.045997, 0.6980392, 0, 1, 1,
0.8040368, 1.241406, -0.1046871, 0.7058824, 0, 1, 1,
0.8064216, -0.5831861, 2.115305, 0.7098039, 0, 1, 1,
0.8103097, 0.1234537, 0.2849563, 0.7176471, 0, 1, 1,
0.8141408, -1.776117, 3.538451, 0.7215686, 0, 1, 1,
0.8145407, -0.1544533, 1.907693, 0.7294118, 0, 1, 1,
0.8163607, 0.1685252, 0.4137611, 0.7333333, 0, 1, 1,
0.8245807, 0.6498938, -0.8025619, 0.7411765, 0, 1, 1,
0.8331072, 1.058579, 0.9405341, 0.7450981, 0, 1, 1,
0.8347975, 0.6053033, 0.3446319, 0.7529412, 0, 1, 1,
0.844489, 0.5966382, 1.288017, 0.7568628, 0, 1, 1,
0.8470585, -1.209908, 2.65448, 0.7647059, 0, 1, 1,
0.8510838, -0.1232272, 1.118885, 0.7686275, 0, 1, 1,
0.853996, -0.9880908, 2.484079, 0.7764706, 0, 1, 1,
0.8543864, -0.4012066, 2.699935, 0.7803922, 0, 1, 1,
0.860431, 1.056743, -0.3144723, 0.7882353, 0, 1, 1,
0.8626127, -0.2269203, 0.03467969, 0.7921569, 0, 1, 1,
0.8646761, -0.3441788, 2.52313, 0.8, 0, 1, 1,
0.8647984, -1.344475, 2.453044, 0.8078431, 0, 1, 1,
0.8667537, 2.09968, -0.2278948, 0.8117647, 0, 1, 1,
0.8703588, -0.5772272, 3.286066, 0.8196079, 0, 1, 1,
0.8718381, 1.367156, 0.5905445, 0.8235294, 0, 1, 1,
0.8736442, 0.09829726, 1.995606, 0.8313726, 0, 1, 1,
0.8752066, 0.2088683, 2.610263, 0.8352941, 0, 1, 1,
0.8782837, 1.394057, 0.1407802, 0.8431373, 0, 1, 1,
0.8819371, -1.104004, 1.407034, 0.8470588, 0, 1, 1,
0.8844752, 0.931129, 1.064396, 0.854902, 0, 1, 1,
0.8877418, -0.5758192, 3.866129, 0.8588235, 0, 1, 1,
0.8922261, 1.342352, 1.073416, 0.8666667, 0, 1, 1,
0.8947761, 1.107712, -1.235377, 0.8705882, 0, 1, 1,
0.895763, -0.7000709, 2.977579, 0.8784314, 0, 1, 1,
0.9012306, 1.564769, 1.234157, 0.8823529, 0, 1, 1,
0.9097156, 1.674092, 0.8837, 0.8901961, 0, 1, 1,
0.9126279, 0.8230633, 0.4602358, 0.8941177, 0, 1, 1,
0.9173478, -1.666809, 2.842654, 0.9019608, 0, 1, 1,
0.9209429, 0.5053101, 0.6349471, 0.9098039, 0, 1, 1,
0.925702, -1.913752, 2.394622, 0.9137255, 0, 1, 1,
0.9477099, 0.350634, 1.274595, 0.9215686, 0, 1, 1,
0.9509882, 1.387151, 0.9883629, 0.9254902, 0, 1, 1,
0.9544563, 0.2483121, -0.6313388, 0.9333333, 0, 1, 1,
0.9587151, 0.5906988, 0.939503, 0.9372549, 0, 1, 1,
0.9588734, 0.3999518, -0.4112767, 0.945098, 0, 1, 1,
0.9608074, -0.2164012, 0.5035541, 0.9490196, 0, 1, 1,
0.9640294, 0.07315635, 2.39805, 0.9568627, 0, 1, 1,
0.9680538, 0.07044563, 2.044125, 0.9607843, 0, 1, 1,
0.9683033, 0.08327283, 2.948378, 0.9686275, 0, 1, 1,
0.9748071, 0.10577, 1.296617, 0.972549, 0, 1, 1,
0.975827, 0.2223234, 1.290984, 0.9803922, 0, 1, 1,
0.9767201, -1.434061, 2.003467, 0.9843137, 0, 1, 1,
0.9784172, -0.7039728, 1.915093, 0.9921569, 0, 1, 1,
0.9789749, 0.5976813, 1.904032, 0.9960784, 0, 1, 1,
0.9819273, -0.6686323, 2.116872, 1, 0, 0.9960784, 1,
0.9880941, 1.075953, 0.9652835, 1, 0, 0.9882353, 1,
0.9965026, -1.322206, 3.221487, 1, 0, 0.9843137, 1,
1.007015, -0.8621842, 2.045078, 1, 0, 0.9764706, 1,
1.013836, -1.175617, 3.02729, 1, 0, 0.972549, 1,
1.015495, -1.437323, 2.875162, 1, 0, 0.9647059, 1,
1.019505, 0.879958, 0.9432648, 1, 0, 0.9607843, 1,
1.020971, 1.751971, -0.5908976, 1, 0, 0.9529412, 1,
1.022932, -0.4580317, 2.351638, 1, 0, 0.9490196, 1,
1.024335, -0.5361965, 1.825661, 1, 0, 0.9411765, 1,
1.029097, -1.150421, 3.321674, 1, 0, 0.9372549, 1,
1.029227, -1.374946, 2.405395, 1, 0, 0.9294118, 1,
1.034039, -0.777459, 2.589494, 1, 0, 0.9254902, 1,
1.040597, 0.4761986, -0.4756028, 1, 0, 0.9176471, 1,
1.042371, -0.6420904, 2.082765, 1, 0, 0.9137255, 1,
1.042978, -2.154488, 2.326842, 1, 0, 0.9058824, 1,
1.044463, 0.124869, 0.3593882, 1, 0, 0.9019608, 1,
1.045229, -1.828665, 1.95414, 1, 0, 0.8941177, 1,
1.046655, 1.379878, 3.004481, 1, 0, 0.8862745, 1,
1.050128, -0.7876571, 2.339277, 1, 0, 0.8823529, 1,
1.050604, -0.3836582, 2.073982, 1, 0, 0.8745098, 1,
1.053051, 1.005226, 1.596965, 1, 0, 0.8705882, 1,
1.061773, 0.7064877, 1.391904, 1, 0, 0.8627451, 1,
1.067308, -0.06381623, 1.810152, 1, 0, 0.8588235, 1,
1.070333, 0.6412531, -0.2737809, 1, 0, 0.8509804, 1,
1.07174, -0.2089642, 2.017544, 1, 0, 0.8470588, 1,
1.07383, 0.0985902, 3.018522, 1, 0, 0.8392157, 1,
1.076252, -0.4900813, 1.493202, 1, 0, 0.8352941, 1,
1.078798, -1.149085, 2.657642, 1, 0, 0.827451, 1,
1.079436, -0.4038559, 1.427983, 1, 0, 0.8235294, 1,
1.086545, 0.1054408, 1.360077, 1, 0, 0.8156863, 1,
1.086781, 1.162421, 0.6715099, 1, 0, 0.8117647, 1,
1.099205, -2.335394, 4.177432, 1, 0, 0.8039216, 1,
1.103794, -0.8551151, 2.14272, 1, 0, 0.7960784, 1,
1.109176, -0.0180939, 3.579265, 1, 0, 0.7921569, 1,
1.1114, -0.1310465, 1.674859, 1, 0, 0.7843137, 1,
1.112867, 0.2618959, 3.210523, 1, 0, 0.7803922, 1,
1.114689, -1.71055, 1.66469, 1, 0, 0.772549, 1,
1.116991, -0.9744316, 4.664496, 1, 0, 0.7686275, 1,
1.118293, -1.543273, 2.128777, 1, 0, 0.7607843, 1,
1.121806, 1.059229, -0.9358811, 1, 0, 0.7568628, 1,
1.129501, 0.321624, 1.445319, 1, 0, 0.7490196, 1,
1.132184, 0.2152405, 1.278446, 1, 0, 0.7450981, 1,
1.132384, 0.3294835, 1.005245, 1, 0, 0.7372549, 1,
1.134718, -1.097502, 1.238904, 1, 0, 0.7333333, 1,
1.141673, 0.6420308, 1.577982, 1, 0, 0.7254902, 1,
1.149341, -1.167972, 3.266505, 1, 0, 0.7215686, 1,
1.155055, -0.5275096, 2.352228, 1, 0, 0.7137255, 1,
1.156588, -0.2636423, 1.621021, 1, 0, 0.7098039, 1,
1.171254, 0.7602635, 2.107295, 1, 0, 0.7019608, 1,
1.173834, -0.4030782, 0.1580191, 1, 0, 0.6941177, 1,
1.176792, -0.6689137, 2.290369, 1, 0, 0.6901961, 1,
1.189697, -0.133422, 3.501378, 1, 0, 0.682353, 1,
1.210189, 1.396536, 1.079525, 1, 0, 0.6784314, 1,
1.213194, 0.6173412, -0.5003715, 1, 0, 0.6705883, 1,
1.21432, -0.5430029, 3.532117, 1, 0, 0.6666667, 1,
1.218334, -0.2496494, 2.965614, 1, 0, 0.6588235, 1,
1.223886, -1.080927, 2.124432, 1, 0, 0.654902, 1,
1.226051, -1.398711, 2.276259, 1, 0, 0.6470588, 1,
1.228697, -0.7328799, 1.848475, 1, 0, 0.6431373, 1,
1.230986, -0.2335212, 2.693113, 1, 0, 0.6352941, 1,
1.238323, 1.047359, -0.9109197, 1, 0, 0.6313726, 1,
1.239942, 1.942274, -0.03821364, 1, 0, 0.6235294, 1,
1.244737, -0.1158593, 1.272862, 1, 0, 0.6196079, 1,
1.252417, -0.8037485, 1.985437, 1, 0, 0.6117647, 1,
1.254048, -1.787115, 1.854508, 1, 0, 0.6078432, 1,
1.266616, -0.6323982, 3.193826, 1, 0, 0.6, 1,
1.274915, -0.8571924, 1.385466, 1, 0, 0.5921569, 1,
1.278068, -0.05412559, 1.220325, 1, 0, 0.5882353, 1,
1.310286, -0.8524527, 2.873122, 1, 0, 0.5803922, 1,
1.311881, 0.9736174, 1.450196, 1, 0, 0.5764706, 1,
1.31215, -0.9272823, 3.507585, 1, 0, 0.5686275, 1,
1.329254, -1.545971, 2.211193, 1, 0, 0.5647059, 1,
1.33418, -0.620585, 2.113909, 1, 0, 0.5568628, 1,
1.33645, 0.7181695, 0.7398093, 1, 0, 0.5529412, 1,
1.338337, 0.1328837, 3.028659, 1, 0, 0.5450981, 1,
1.342138, -0.3840179, 1.649472, 1, 0, 0.5411765, 1,
1.345168, 2.681173, 0.07921572, 1, 0, 0.5333334, 1,
1.351058, -0.9915456, 2.625951, 1, 0, 0.5294118, 1,
1.358842, 0.3419267, 0.9128164, 1, 0, 0.5215687, 1,
1.360375, -0.8058085, 2.454015, 1, 0, 0.5176471, 1,
1.360777, 0.6511571, 2.381314, 1, 0, 0.509804, 1,
1.376839, -0.7248071, 0.7051854, 1, 0, 0.5058824, 1,
1.382589, 1.720181, -1.111577, 1, 0, 0.4980392, 1,
1.382649, -0.2884513, 2.447689, 1, 0, 0.4901961, 1,
1.386276, -0.7205457, 0.5131588, 1, 0, 0.4862745, 1,
1.398336, 1.026525, 1.22752, 1, 0, 0.4784314, 1,
1.403169, -1.46238, 3.812582, 1, 0, 0.4745098, 1,
1.404109, 1.326766, -0.2354145, 1, 0, 0.4666667, 1,
1.407752, -1.436032, 1.296016, 1, 0, 0.4627451, 1,
1.410668, -0.1715153, 0.517136, 1, 0, 0.454902, 1,
1.411415, -0.6407643, 1.629901, 1, 0, 0.4509804, 1,
1.415345, 0.1585055, 1.091725, 1, 0, 0.4431373, 1,
1.429522, 0.1194252, 2.340606, 1, 0, 0.4392157, 1,
1.437317, -0.2013783, 3.473793, 1, 0, 0.4313726, 1,
1.443471, -3.040277, 4.840939, 1, 0, 0.427451, 1,
1.456553, 2.215556, -0.02341831, 1, 0, 0.4196078, 1,
1.459895, -1.384436, 3.171329, 1, 0, 0.4156863, 1,
1.46229, -0.9155772, 2.175731, 1, 0, 0.4078431, 1,
1.468986, -0.6979062, 2.184192, 1, 0, 0.4039216, 1,
1.475875, -1.34223, 2.80274, 1, 0, 0.3960784, 1,
1.493522, -0.4176236, 1.596205, 1, 0, 0.3882353, 1,
1.503833, 2.174849, 2.140438, 1, 0, 0.3843137, 1,
1.504027, 0.904397, 0.5043242, 1, 0, 0.3764706, 1,
1.511672, -0.2850454, 0.9154409, 1, 0, 0.372549, 1,
1.512847, -0.3832748, 2.11559, 1, 0, 0.3647059, 1,
1.513065, 0.3160855, 2.694453, 1, 0, 0.3607843, 1,
1.522792, 0.8573745, 1.102753, 1, 0, 0.3529412, 1,
1.524921, 0.2272561, 2.958092, 1, 0, 0.3490196, 1,
1.530163, -0.5641162, 1.374112, 1, 0, 0.3411765, 1,
1.537393, -1.301259, 1.551794, 1, 0, 0.3372549, 1,
1.545861, 0.5239955, 0.06540003, 1, 0, 0.3294118, 1,
1.562191, 0.9657671, -0.1583468, 1, 0, 0.3254902, 1,
1.573622, 0.678285, 0.7552894, 1, 0, 0.3176471, 1,
1.575562, -0.3221467, 1.718461, 1, 0, 0.3137255, 1,
1.63329, -0.1222733, 1.078535, 1, 0, 0.3058824, 1,
1.636785, 1.076914, 2.155693, 1, 0, 0.2980392, 1,
1.646746, -0.7373617, 2.798376, 1, 0, 0.2941177, 1,
1.651632, 0.6087038, 1.519834, 1, 0, 0.2862745, 1,
1.652597, 0.6620593, 0.7574915, 1, 0, 0.282353, 1,
1.65905, -1.573002, 1.539093, 1, 0, 0.2745098, 1,
1.671502, 1.13461, 0.7613456, 1, 0, 0.2705882, 1,
1.67357, -1.30149, 2.650491, 1, 0, 0.2627451, 1,
1.687134, 0.3621874, 1.395937, 1, 0, 0.2588235, 1,
1.698242, 1.24133, -0.7402655, 1, 0, 0.2509804, 1,
1.705183, -1.581269, 1.501994, 1, 0, 0.2470588, 1,
1.736032, -0.8056868, 2.508528, 1, 0, 0.2392157, 1,
1.773358, 0.6230376, 0.8483711, 1, 0, 0.2352941, 1,
1.785031, 1.489216, 1.370546, 1, 0, 0.227451, 1,
1.803648, -0.4348857, 0.9880435, 1, 0, 0.2235294, 1,
1.8135, -0.227382, 2.013559, 1, 0, 0.2156863, 1,
1.826541, 0.1047475, 1.943212, 1, 0, 0.2117647, 1,
1.832851, -0.7297979, 0.8005823, 1, 0, 0.2039216, 1,
1.84433, 2.120313, -0.02697249, 1, 0, 0.1960784, 1,
1.877321, 0.176162, 1.631325, 1, 0, 0.1921569, 1,
1.880649, -0.5649353, 1.964428, 1, 0, 0.1843137, 1,
1.881098, -0.6494028, 0.7339977, 1, 0, 0.1803922, 1,
1.90208, 0.1892993, 4.004608, 1, 0, 0.172549, 1,
1.90261, 1.517493, 1.408354, 1, 0, 0.1686275, 1,
1.908677, 0.8252516, 0.7977849, 1, 0, 0.1607843, 1,
1.911014, -0.3408326, 1.438618, 1, 0, 0.1568628, 1,
1.912039, -0.5866135, 2.948935, 1, 0, 0.1490196, 1,
1.916348, -0.6238142, 0.7227111, 1, 0, 0.145098, 1,
1.91971, -0.3072069, 1.277118, 1, 0, 0.1372549, 1,
1.952925, -0.5745643, -0.7245088, 1, 0, 0.1333333, 1,
1.977453, 0.8718387, 1.90838, 1, 0, 0.1254902, 1,
1.985445, -1.937423, 3.218188, 1, 0, 0.1215686, 1,
1.990867, -0.06327091, 2.437141, 1, 0, 0.1137255, 1,
1.992728, -2.436062, 1.782859, 1, 0, 0.1098039, 1,
1.995776, -0.6658377, 1.159518, 1, 0, 0.1019608, 1,
2.022962, -2.376727, 2.052286, 1, 0, 0.09411765, 1,
2.03248, 0.9031901, 2.327478, 1, 0, 0.09019608, 1,
2.1487, -1.839145, 3.137403, 1, 0, 0.08235294, 1,
2.159016, 1.580164, 1.276476, 1, 0, 0.07843138, 1,
2.162037, 2.118566, -1.50279, 1, 0, 0.07058824, 1,
2.184323, -1.270473, 2.851472, 1, 0, 0.06666667, 1,
2.275757, -0.04978364, 2.186168, 1, 0, 0.05882353, 1,
2.288657, -1.016528, 2.461636, 1, 0, 0.05490196, 1,
2.305893, 1.100379, 1.049745, 1, 0, 0.04705882, 1,
2.405021, -0.9887897, 3.053418, 1, 0, 0.04313726, 1,
2.416975, 0.5929697, 2.41659, 1, 0, 0.03529412, 1,
2.41729, -0.5481394, 2.15835, 1, 0, 0.03137255, 1,
2.451943, 1.464179, 0.06316405, 1, 0, 0.02352941, 1,
2.563253, -1.611451, 3.354843, 1, 0, 0.01960784, 1,
2.894403, 0.03790958, 2.520757, 1, 0, 0.01176471, 1,
3.455067, 0.9884332, 2.905404, 1, 0, 0.007843138, 1
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
0.3021675, -4.400688, -7.628926, 0, -0.5, 0.5, 0.5,
0.3021675, -4.400688, -7.628926, 1, -0.5, 0.5, 0.5,
0.3021675, -4.400688, -7.628926, 1, 1.5, 0.5, 0.5,
0.3021675, -4.400688, -7.628926, 0, 1.5, 0.5, 0.5
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
-3.919564, -0.2200508, -7.628926, 0, -0.5, 0.5, 0.5,
-3.919564, -0.2200508, -7.628926, 1, -0.5, 0.5, 0.5,
-3.919564, -0.2200508, -7.628926, 1, 1.5, 0.5, 0.5,
-3.919564, -0.2200508, -7.628926, 0, 1.5, 0.5, 0.5
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
-3.919564, -4.400688, -0.1757357, 0, -0.5, 0.5, 0.5,
-3.919564, -4.400688, -0.1757357, 1, -0.5, 0.5, 0.5,
-3.919564, -4.400688, -0.1757357, 1, 1.5, 0.5, 0.5,
-3.919564, -4.400688, -0.1757357, 0, 1.5, 0.5, 0.5
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
-2, -3.435925, -5.908959,
3, -3.435925, -5.908959,
-2, -3.435925, -5.908959,
-2, -3.596719, -6.19562,
-1, -3.435925, -5.908959,
-1, -3.596719, -6.19562,
0, -3.435925, -5.908959,
0, -3.596719, -6.19562,
1, -3.435925, -5.908959,
1, -3.596719, -6.19562,
2, -3.435925, -5.908959,
2, -3.596719, -6.19562,
3, -3.435925, -5.908959,
3, -3.596719, -6.19562
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
-2, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
-2, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
-2, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
-2, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5,
-1, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
-1, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
-1, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
-1, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5,
0, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
0, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
0, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
0, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5,
1, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
1, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
1, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
1, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5,
2, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
2, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
2, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
2, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5,
3, -3.918307, -6.768942, 0, -0.5, 0.5, 0.5,
3, -3.918307, -6.768942, 1, -0.5, 0.5, 0.5,
3, -3.918307, -6.768942, 1, 1.5, 0.5, 0.5,
3, -3.918307, -6.768942, 0, 1.5, 0.5, 0.5
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
-2.945319, -3, -5.908959,
-2.945319, 2, -5.908959,
-2.945319, -3, -5.908959,
-3.107693, -3, -6.19562,
-2.945319, -2, -5.908959,
-3.107693, -2, -6.19562,
-2.945319, -1, -5.908959,
-3.107693, -1, -6.19562,
-2.945319, 0, -5.908959,
-3.107693, 0, -6.19562,
-2.945319, 1, -5.908959,
-3.107693, 1, -6.19562,
-2.945319, 2, -5.908959,
-3.107693, 2, -6.19562
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
-3.432441, -3, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, -3, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, -3, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, -3, -6.768942, 0, 1.5, 0.5, 0.5,
-3.432441, -2, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, -2, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, -2, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, -2, -6.768942, 0, 1.5, 0.5, 0.5,
-3.432441, -1, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, -1, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, -1, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, -1, -6.768942, 0, 1.5, 0.5, 0.5,
-3.432441, 0, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, 0, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, 0, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, 0, -6.768942, 0, 1.5, 0.5, 0.5,
-3.432441, 1, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, 1, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, 1, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, 1, -6.768942, 0, 1.5, 0.5, 0.5,
-3.432441, 2, -6.768942, 0, -0.5, 0.5, 0.5,
-3.432441, 2, -6.768942, 1, -0.5, 0.5, 0.5,
-3.432441, 2, -6.768942, 1, 1.5, 0.5, 0.5,
-3.432441, 2, -6.768942, 0, 1.5, 0.5, 0.5
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
-2.945319, -3.435925, -4,
-2.945319, -3.435925, 4,
-2.945319, -3.435925, -4,
-3.107693, -3.596719, -4,
-2.945319, -3.435925, -2,
-3.107693, -3.596719, -2,
-2.945319, -3.435925, 0,
-3.107693, -3.596719, 0,
-2.945319, -3.435925, 2,
-3.107693, -3.596719, 2,
-2.945319, -3.435925, 4,
-3.107693, -3.596719, 4
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
-3.432441, -3.918307, -4, 0, -0.5, 0.5, 0.5,
-3.432441, -3.918307, -4, 1, -0.5, 0.5, 0.5,
-3.432441, -3.918307, -4, 1, 1.5, 0.5, 0.5,
-3.432441, -3.918307, -4, 0, 1.5, 0.5, 0.5,
-3.432441, -3.918307, -2, 0, -0.5, 0.5, 0.5,
-3.432441, -3.918307, -2, 1, -0.5, 0.5, 0.5,
-3.432441, -3.918307, -2, 1, 1.5, 0.5, 0.5,
-3.432441, -3.918307, -2, 0, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 0, 0, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 0, 1, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 0, 1, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 0, 0, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 2, 0, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 2, 1, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 2, 1, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 2, 0, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 4, 0, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 4, 1, -0.5, 0.5, 0.5,
-3.432441, -3.918307, 4, 1, 1.5, 0.5, 0.5,
-3.432441, -3.918307, 4, 0, 1.5, 0.5, 0.5
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
-2.945319, -3.435925, -5.908959,
-2.945319, 2.995824, -5.908959,
-2.945319, -3.435925, 5.557487,
-2.945319, 2.995824, 5.557487,
-2.945319, -3.435925, -5.908959,
-2.945319, -3.435925, 5.557487,
-2.945319, 2.995824, -5.908959,
-2.945319, 2.995824, 5.557487,
-2.945319, -3.435925, -5.908959,
3.549654, -3.435925, -5.908959,
-2.945319, -3.435925, 5.557487,
3.549654, -3.435925, 5.557487,
-2.945319, 2.995824, -5.908959,
3.549654, 2.995824, -5.908959,
-2.945319, 2.995824, 5.557487,
3.549654, 2.995824, 5.557487,
3.549654, -3.435925, -5.908959,
3.549654, 2.995824, -5.908959,
3.549654, -3.435925, 5.557487,
3.549654, 2.995824, 5.557487,
3.549654, -3.435925, -5.908959,
3.549654, -3.435925, 5.557487,
3.549654, 2.995824, -5.908959,
3.549654, 2.995824, 5.557487
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
var radius = 7.830265;
var distance = 34.83773;
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
mvMatrix.translate( -0.3021675, 0.2200508, 0.1757357 );
mvMatrix.scale( 1.303506, 1.316319, 0.7383487 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83773);
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
Tebuconazole<-read.table("Tebuconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tebuconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tebuconazole' not found
```

```r
y<-Tebuconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tebuconazole' not found
```

```r
z<-Tebuconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tebuconazole' not found
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
-2.850732, -0.6979203, -0.8114308, 0, 0, 1, 1, 1,
-2.61899, 0.7153236, -0.6257867, 1, 0, 0, 1, 1,
-2.54508, 1.365963, -2.215616, 1, 0, 0, 1, 1,
-2.39507, -0.4508898, -1.964458, 1, 0, 0, 1, 1,
-2.363584, 0.8565155, -2.294222, 1, 0, 0, 1, 1,
-2.346551, 1.185882, -2.046157, 1, 0, 0, 1, 1,
-2.298476, 0.7976685, -1.620216, 0, 0, 0, 1, 1,
-2.298384, -1.277025, -2.90082, 0, 0, 0, 1, 1,
-2.238218, 1.34542, -0.8200037, 0, 0, 0, 1, 1,
-2.224199, 0.5039867, -1.793323, 0, 0, 0, 1, 1,
-2.223, -0.8906347, -2.518883, 0, 0, 0, 1, 1,
-2.212, 0.4430734, -1.294089, 0, 0, 0, 1, 1,
-2.192781, 0.9512202, 0.9677436, 0, 0, 0, 1, 1,
-2.16114, -1.4535, -3.150835, 1, 1, 1, 1, 1,
-2.15547, -0.4115755, -1.840054, 1, 1, 1, 1, 1,
-2.134667, 0.01537371, 1.091683, 1, 1, 1, 1, 1,
-2.107995, 0.6453593, -1.418612, 1, 1, 1, 1, 1,
-2.098731, -0.3262799, -2.255866, 1, 1, 1, 1, 1,
-2.065522, -0.1595732, -3.485548, 1, 1, 1, 1, 1,
-2.027653, 0.1761577, -4.103193, 1, 1, 1, 1, 1,
-2.013073, 0.3589885, -0.7635806, 1, 1, 1, 1, 1,
-1.97875, -0.5965787, -1.15527, 1, 1, 1, 1, 1,
-1.966626, -0.5194362, -2.183981, 1, 1, 1, 1, 1,
-1.953412, -0.9851093, -1.524833, 1, 1, 1, 1, 1,
-1.928826, 0.768759, -0.7467564, 1, 1, 1, 1, 1,
-1.923741, 0.8057433, 0.508013, 1, 1, 1, 1, 1,
-1.921611, 1.421466, -1.648994, 1, 1, 1, 1, 1,
-1.891038, -0.03822381, -0.6250957, 1, 1, 1, 1, 1,
-1.890088, 1.216859, -1.294728, 0, 0, 1, 1, 1,
-1.886533, -0.8929735, -3.150592, 1, 0, 0, 1, 1,
-1.866035, 1.592507, -0.3099819, 1, 0, 0, 1, 1,
-1.828374, 0.7639273, -2.157592, 1, 0, 0, 1, 1,
-1.812909, 0.6815056, -1.935025, 1, 0, 0, 1, 1,
-1.73376, 1.063968, -0.3317709, 1, 0, 0, 1, 1,
-1.715167, 0.3332013, -0.8550199, 0, 0, 0, 1, 1,
-1.710946, -1.910659, -2.29713, 0, 0, 0, 1, 1,
-1.703714, -0.07106863, 0.02964972, 0, 0, 0, 1, 1,
-1.695935, 0.03206006, -3.021127, 0, 0, 0, 1, 1,
-1.677223, -2.585786, -4.007667, 0, 0, 0, 1, 1,
-1.672821, -0.8748727, -2.421181, 0, 0, 0, 1, 1,
-1.665931, 1.926381, -2.259731, 0, 0, 0, 1, 1,
-1.657661, -1.809408, -1.035674, 1, 1, 1, 1, 1,
-1.647979, 0.7454814, -0.04401903, 1, 1, 1, 1, 1,
-1.636385, -2.114088, -2.45766, 1, 1, 1, 1, 1,
-1.633338, -1.139428, -1.830567, 1, 1, 1, 1, 1,
-1.623725, -0.7702789, -4.473899, 1, 1, 1, 1, 1,
-1.613618, -0.7175224, -2.704713, 1, 1, 1, 1, 1,
-1.604008, -0.8430492, -1.160038, 1, 1, 1, 1, 1,
-1.601354, -0.8155766, -0.6836331, 1, 1, 1, 1, 1,
-1.584055, 1.818657, 0.7096574, 1, 1, 1, 1, 1,
-1.581227, -1.596248, -3.057288, 1, 1, 1, 1, 1,
-1.577048, -1.008652, -1.515822, 1, 1, 1, 1, 1,
-1.574048, 0.06224374, -1.928854, 1, 1, 1, 1, 1,
-1.56451, -1.396179, -0.6190567, 1, 1, 1, 1, 1,
-1.563033, 0.6285575, -1.395225, 1, 1, 1, 1, 1,
-1.556166, -1.158031, -2.586311, 1, 1, 1, 1, 1,
-1.555244, 0.1606852, -0.3039953, 0, 0, 1, 1, 1,
-1.550658, 0.6392304, -0.6206535, 1, 0, 0, 1, 1,
-1.541246, 0.1536601, -1.779654, 1, 0, 0, 1, 1,
-1.533293, 1.93154, -1.000074, 1, 0, 0, 1, 1,
-1.528837, 0.2864809, -0.5253845, 1, 0, 0, 1, 1,
-1.512521, 0.8794913, 0.2672407, 1, 0, 0, 1, 1,
-1.501968, 0.373365, -2.132216, 0, 0, 0, 1, 1,
-1.49934, 0.1151053, -2.133621, 0, 0, 0, 1, 1,
-1.498524, 0.4492427, 0.0002906618, 0, 0, 0, 1, 1,
-1.496873, -0.02780251, -2.524711, 0, 0, 0, 1, 1,
-1.492325, 1.147831, 2.037846, 0, 0, 0, 1, 1,
-1.481134, 0.1231735, -1.606568, 0, 0, 0, 1, 1,
-1.479777, -0.4898699, -2.615156, 0, 0, 0, 1, 1,
-1.469322, -0.2942875, -0.3538241, 1, 1, 1, 1, 1,
-1.466182, 1.979115, 0.713571, 1, 1, 1, 1, 1,
-1.455106, -1.121847, -3.659522, 1, 1, 1, 1, 1,
-1.452471, 0.6006801, -1.544862, 1, 1, 1, 1, 1,
-1.424212, 0.7628283, -1.015455, 1, 1, 1, 1, 1,
-1.421536, 1.63903, -0.8244172, 1, 1, 1, 1, 1,
-1.412102, -2.551508, -2.312885, 1, 1, 1, 1, 1,
-1.405508, 1.428902, -1.191524, 1, 1, 1, 1, 1,
-1.398009, 0.4484539, -2.394832, 1, 1, 1, 1, 1,
-1.395802, 0.8894377, 0.9516116, 1, 1, 1, 1, 1,
-1.391121, -0.02545095, -0.03016837, 1, 1, 1, 1, 1,
-1.385238, -0.2806007, -2.525466, 1, 1, 1, 1, 1,
-1.381791, 1.68467, 0.206764, 1, 1, 1, 1, 1,
-1.377782, 0.2336797, -0.6929947, 1, 1, 1, 1, 1,
-1.373881, -0.8971853, -1.64707, 1, 1, 1, 1, 1,
-1.369712, -0.05752622, -0.4649068, 0, 0, 1, 1, 1,
-1.366366, -0.5891794, -2.461323, 1, 0, 0, 1, 1,
-1.365567, 0.1324202, -1.608514, 1, 0, 0, 1, 1,
-1.364793, -0.6798766, -3.288828, 1, 0, 0, 1, 1,
-1.351092, 0.2821255, -1.79265, 1, 0, 0, 1, 1,
-1.34403, 0.4482623, -0.7678314, 1, 0, 0, 1, 1,
-1.342028, 0.4931283, 0.2306063, 0, 0, 0, 1, 1,
-1.325293, -0.4532602, -1.673272, 0, 0, 0, 1, 1,
-1.319645, 1.066443, 0.3282961, 0, 0, 0, 1, 1,
-1.306071, -0.1287267, -2.055236, 0, 0, 0, 1, 1,
-1.28477, 0.9428123, 0.8374262, 0, 0, 0, 1, 1,
-1.28322, 0.09623602, -1.584862, 0, 0, 0, 1, 1,
-1.282031, 0.7060664, -0.4996704, 0, 0, 0, 1, 1,
-1.273888, 1.025485, -0.2620719, 1, 1, 1, 1, 1,
-1.266528, 1.184765, -0.9615188, 1, 1, 1, 1, 1,
-1.262594, 0.6838923, -0.5151358, 1, 1, 1, 1, 1,
-1.255898, -0.6336728, -1.526299, 1, 1, 1, 1, 1,
-1.252287, 1.062664, -0.9573866, 1, 1, 1, 1, 1,
-1.245083, -0.3610077, -1.391502, 1, 1, 1, 1, 1,
-1.219511, 0.1332871, -1.042065, 1, 1, 1, 1, 1,
-1.210387, -0.2870759, -2.258888, 1, 1, 1, 1, 1,
-1.199863, 1.746969, -1.891214, 1, 1, 1, 1, 1,
-1.198002, 1.645537, -0.812972, 1, 1, 1, 1, 1,
-1.196619, -0.6522331, -1.748327, 1, 1, 1, 1, 1,
-1.187578, -0.4348288, -1.233905, 1, 1, 1, 1, 1,
-1.184708, 0.4777919, -1.258846, 1, 1, 1, 1, 1,
-1.183318, -0.3200519, -2.897241, 1, 1, 1, 1, 1,
-1.182221, 0.3254783, -2.013255, 1, 1, 1, 1, 1,
-1.178084, 0.6316026, -0.2452138, 0, 0, 1, 1, 1,
-1.173375, -0.9442794, -1.571882, 1, 0, 0, 1, 1,
-1.169867, 0.7245485, -2.047299, 1, 0, 0, 1, 1,
-1.164222, 0.4990017, -0.414685, 1, 0, 0, 1, 1,
-1.162603, 0.2301758, -1.359142, 1, 0, 0, 1, 1,
-1.155986, -1.137449, -1.72052, 1, 0, 0, 1, 1,
-1.149124, 0.06810909, -0.7345683, 0, 0, 0, 1, 1,
-1.145999, 0.5278897, 0.5672608, 0, 0, 0, 1, 1,
-1.143677, 0.5786591, -0.564064, 0, 0, 0, 1, 1,
-1.141472, -0.9623808, -1.634743, 0, 0, 0, 1, 1,
-1.138669, -0.6650625, -2.689276, 0, 0, 0, 1, 1,
-1.137424, -0.5017572, -3.567342, 0, 0, 0, 1, 1,
-1.126257, 0.4978195, -0.5757755, 0, 0, 0, 1, 1,
-1.121643, 0.5473363, -0.8506109, 1, 1, 1, 1, 1,
-1.113891, -2.980963, -1.912681, 1, 1, 1, 1, 1,
-1.112, 0.9530751, -2.258374, 1, 1, 1, 1, 1,
-1.10221, -0.2203471, -0.6017413, 1, 1, 1, 1, 1,
-1.099317, 0.1378222, -2.056938, 1, 1, 1, 1, 1,
-1.085404, 0.4716251, -1.285812, 1, 1, 1, 1, 1,
-1.083434, 0.4310033, 0.3493394, 1, 1, 1, 1, 1,
-1.082723, -0.3102282, -4.135118, 1, 1, 1, 1, 1,
-1.079617, 0.1361303, -3.286669, 1, 1, 1, 1, 1,
-1.077125, 1.866142, 0.04981624, 1, 1, 1, 1, 1,
-1.071812, 0.1438739, -0.4699293, 1, 1, 1, 1, 1,
-1.062422, -0.03638184, -2.803904, 1, 1, 1, 1, 1,
-1.055795, 1.637355, -0.04600548, 1, 1, 1, 1, 1,
-1.048372, -0.351386, -0.9154168, 1, 1, 1, 1, 1,
-1.047339, -0.854423, -1.956409, 1, 1, 1, 1, 1,
-1.044757, 0.2747364, -1.567011, 0, 0, 1, 1, 1,
-1.043494, -0.2374157, -0.1762353, 1, 0, 0, 1, 1,
-1.043238, -0.2133482, -1.057203, 1, 0, 0, 1, 1,
-1.040967, 0.9940571, 0.6805792, 1, 0, 0, 1, 1,
-1.039235, -0.2408061, -4.403858, 1, 0, 0, 1, 1,
-1.037842, -0.6526503, -3.73906, 1, 0, 0, 1, 1,
-1.03671, -0.2949995, -2.781838, 0, 0, 0, 1, 1,
-1.035535, 1.996379, -1.12146, 0, 0, 0, 1, 1,
-1.033808, 1.351596, -1.181358, 0, 0, 0, 1, 1,
-1.029356, 0.5228445, -2.192185, 0, 0, 0, 1, 1,
-1.025029, 0.8378305, -2.129657, 0, 0, 0, 1, 1,
-1.024562, -1.187222, -2.02002, 0, 0, 0, 1, 1,
-1.023387, -1.503605, -2.852642, 0, 0, 0, 1, 1,
-1.018566, 0.2010514, -1.875666, 1, 1, 1, 1, 1,
-1.018361, 0.6536877, -0.42281, 1, 1, 1, 1, 1,
-1.017879, 0.8113889, -1.670006, 1, 1, 1, 1, 1,
-1.013221, -2.691418, -2.387112, 1, 1, 1, 1, 1,
-1.002555, -0.6233832, -3.232158, 1, 1, 1, 1, 1,
-0.9968998, -0.9081394, -1.675644, 1, 1, 1, 1, 1,
-0.9911363, -0.4072687, -1.54108, 1, 1, 1, 1, 1,
-0.9863892, 0.4857038, -2.558893, 1, 1, 1, 1, 1,
-0.9851731, -1.282556, -2.134233, 1, 1, 1, 1, 1,
-0.9849455, 1.517969, -1.655836, 1, 1, 1, 1, 1,
-0.9783565, -0.1032036, -2.174607, 1, 1, 1, 1, 1,
-0.9780661, 0.09602509, -3.689268, 1, 1, 1, 1, 1,
-0.9693193, -0.457662, -2.153452, 1, 1, 1, 1, 1,
-0.9673699, 0.1379256, -1.619392, 1, 1, 1, 1, 1,
-0.950551, 1.377469, 0.1519359, 1, 1, 1, 1, 1,
-0.9468737, 0.649523, -1.538062, 0, 0, 1, 1, 1,
-0.9437414, -0.3872331, -1.705076, 1, 0, 0, 1, 1,
-0.9421653, 0.5062385, -2.982241, 1, 0, 0, 1, 1,
-0.9400418, -1.372552, 0.1693955, 1, 0, 0, 1, 1,
-0.9398432, 1.899558, -0.4634512, 1, 0, 0, 1, 1,
-0.9369389, -0.5205422, -1.408074, 1, 0, 0, 1, 1,
-0.9347868, -0.4341176, -1.619998, 0, 0, 0, 1, 1,
-0.932487, 0.3369241, -2.432334, 0, 0, 0, 1, 1,
-0.9294161, -0.4348791, -0.962198, 0, 0, 0, 1, 1,
-0.9225234, 1.092412, -1.478328, 0, 0, 0, 1, 1,
-0.9218071, 0.6520258, -1.078444, 0, 0, 0, 1, 1,
-0.9193873, 1.003113, 1.270978, 0, 0, 0, 1, 1,
-0.9185098, -0.2376978, -3.159503, 0, 0, 0, 1, 1,
-0.9183637, 0.02876192, -1.418179, 1, 1, 1, 1, 1,
-0.9161615, -0.9083855, -2.426378, 1, 1, 1, 1, 1,
-0.9065732, -0.3612293, -2.349002, 1, 1, 1, 1, 1,
-0.901326, -0.5835327, -1.455221, 1, 1, 1, 1, 1,
-0.8984671, -0.8691273, -0.4429021, 1, 1, 1, 1, 1,
-0.8962333, -0.1516063, -2.103667, 1, 1, 1, 1, 1,
-0.8917857, -0.349598, -2.762898, 1, 1, 1, 1, 1,
-0.8890494, 1.757227, -0.6665961, 1, 1, 1, 1, 1,
-0.8886794, 0.06072743, -1.863068, 1, 1, 1, 1, 1,
-0.8862308, -1.685634, -2.867997, 1, 1, 1, 1, 1,
-0.8787636, -0.2467673, -1.196417, 1, 1, 1, 1, 1,
-0.873863, 0.7617034, -0.8331572, 1, 1, 1, 1, 1,
-0.8701478, 1.959183, -0.3519591, 1, 1, 1, 1, 1,
-0.856973, 0.7315528, -1.053724, 1, 1, 1, 1, 1,
-0.8530487, -2.053099, -2.210824, 1, 1, 1, 1, 1,
-0.8520018, -1.165549, -2.40689, 0, 0, 1, 1, 1,
-0.8511727, 0.8065462, -3.075759, 1, 0, 0, 1, 1,
-0.8499319, -0.5496224, -2.162539, 1, 0, 0, 1, 1,
-0.8446807, 1.71302, -1.209208, 1, 0, 0, 1, 1,
-0.8397329, -1.132835, -3.742159, 1, 0, 0, 1, 1,
-0.8395302, 2.02655, -0.05893402, 1, 0, 0, 1, 1,
-0.8358638, 0.1135966, -0.2434427, 0, 0, 0, 1, 1,
-0.8306047, 0.2300858, 0.4428773, 0, 0, 0, 1, 1,
-0.8287671, 0.362149, -1.535133, 0, 0, 0, 1, 1,
-0.8276756, 1.928193, -1.515953, 0, 0, 0, 1, 1,
-0.8260716, 1.183573, -1.348296, 0, 0, 0, 1, 1,
-0.8217312, 1.566296, -0.2261983, 0, 0, 0, 1, 1,
-0.8182424, -0.2159632, -1.776258, 0, 0, 0, 1, 1,
-0.8148834, 1.354629, -1.581087, 1, 1, 1, 1, 1,
-0.8136613, -0.2047082, -1.411056, 1, 1, 1, 1, 1,
-0.8125405, -0.1668282, -1.603558, 1, 1, 1, 1, 1,
-0.8108363, 0.1263853, -0.9323055, 1, 1, 1, 1, 1,
-0.7987473, -0.8419264, -2.660698, 1, 1, 1, 1, 1,
-0.7978683, 2.07864, -0.892151, 1, 1, 1, 1, 1,
-0.7957885, -3.342259, -2.735521, 1, 1, 1, 1, 1,
-0.7926433, -0.3006304, -3.784956, 1, 1, 1, 1, 1,
-0.7910835, 1.76809, 0.5133782, 1, 1, 1, 1, 1,
-0.7872275, 1.379038, -1.790716, 1, 1, 1, 1, 1,
-0.7792295, 0.2791, -2.093437, 1, 1, 1, 1, 1,
-0.7784805, -0.8701462, -2.664463, 1, 1, 1, 1, 1,
-0.7778094, 1.652721, 0.5476637, 1, 1, 1, 1, 1,
-0.7744108, 1.166668, 0.3650314, 1, 1, 1, 1, 1,
-0.774271, 0.004630942, -2.43181, 1, 1, 1, 1, 1,
-0.7711432, -0.9681135, -2.83085, 0, 0, 1, 1, 1,
-0.7709152, -0.824855, -0.6423691, 1, 0, 0, 1, 1,
-0.7688479, 0.2204297, -0.9732009, 1, 0, 0, 1, 1,
-0.7668517, 0.2819343, -1.60389, 1, 0, 0, 1, 1,
-0.7608354, -1.699634, -0.6076817, 1, 0, 0, 1, 1,
-0.7601174, 2.454525, -2.750834, 1, 0, 0, 1, 1,
-0.7580021, -0.874751, -2.708982, 0, 0, 0, 1, 1,
-0.7565067, -0.9701033, -2.878299, 0, 0, 0, 1, 1,
-0.7562687, 0.7045825, -0.02404762, 0, 0, 0, 1, 1,
-0.7497934, -0.2354772, -2.591105, 0, 0, 0, 1, 1,
-0.7467419, 0.1964849, -2.043913, 0, 0, 0, 1, 1,
-0.7437168, -0.5455224, -3.554075, 0, 0, 0, 1, 1,
-0.7428459, -1.191243, -1.787067, 0, 0, 0, 1, 1,
-0.7411802, 0.2707488, -2.36737, 1, 1, 1, 1, 1,
-0.7343469, -0.6139827, -1.447737, 1, 1, 1, 1, 1,
-0.7289017, 1.378237, 0.04600953, 1, 1, 1, 1, 1,
-0.7259369, 0.7583328, -1.069812, 1, 1, 1, 1, 1,
-0.7253913, -0.7406797, -2.286609, 1, 1, 1, 1, 1,
-0.7180014, -1.013865, -3.030963, 1, 1, 1, 1, 1,
-0.7160348, -0.5486735, 0.2630504, 1, 1, 1, 1, 1,
-0.7121966, 1.263879, 0.6916679, 1, 1, 1, 1, 1,
-0.7074475, -0.3287424, -2.038069, 1, 1, 1, 1, 1,
-0.7042273, -0.6997627, -0.2969172, 1, 1, 1, 1, 1,
-0.7013825, 1.688613, -0.6959382, 1, 1, 1, 1, 1,
-0.7006386, 0.0742783, -1.32985, 1, 1, 1, 1, 1,
-0.6954419, 0.1368771, -1.204791, 1, 1, 1, 1, 1,
-0.6856188, -0.6513088, -1.272943, 1, 1, 1, 1, 1,
-0.683699, 2.902158, 1.071981, 1, 1, 1, 1, 1,
-0.6823763, -0.1602594, -0.8780762, 0, 0, 1, 1, 1,
-0.6798652, -0.8756226, -4.370263, 1, 0, 0, 1, 1,
-0.6782541, -0.3859742, -0.8425392, 1, 0, 0, 1, 1,
-0.6781744, 1.99359, -2.919524, 1, 0, 0, 1, 1,
-0.6754335, -0.3581252, -2.647369, 1, 0, 0, 1, 1,
-0.6712975, 0.5687439, -1.33419, 1, 0, 0, 1, 1,
-0.6710744, -0.6973733, -3.391989, 0, 0, 0, 1, 1,
-0.6690842, 0.9563451, -0.3651098, 0, 0, 0, 1, 1,
-0.6672809, -1.301952, -3.109494, 0, 0, 0, 1, 1,
-0.6671967, 1.423636, 0.6283859, 0, 0, 0, 1, 1,
-0.6661497, 0.459676, -1.095664, 0, 0, 0, 1, 1,
-0.6569172, 0.723262, -0.8810933, 0, 0, 0, 1, 1,
-0.656125, -0.8689054, -2.316776, 0, 0, 0, 1, 1,
-0.6538593, -0.380672, -3.533386, 1, 1, 1, 1, 1,
-0.6521426, 0.1345787, -1.222844, 1, 1, 1, 1, 1,
-0.6429716, -0.4127059, -2.553158, 1, 1, 1, 1, 1,
-0.6368689, -0.6760313, -1.654976, 1, 1, 1, 1, 1,
-0.6328895, -1.103386, -2.028349, 1, 1, 1, 1, 1,
-0.6307696, 0.7427155, -2.219285, 1, 1, 1, 1, 1,
-0.6293099, -0.9629087, -2.21514, 1, 1, 1, 1, 1,
-0.6255567, -0.5194536, -1.802162, 1, 1, 1, 1, 1,
-0.6240798, 0.8078331, -0.9641659, 1, 1, 1, 1, 1,
-0.615296, 2.144707, 1.471746, 1, 1, 1, 1, 1,
-0.612967, 1.196544, -1.929415, 1, 1, 1, 1, 1,
-0.608925, 1.828457, -0.315262, 1, 1, 1, 1, 1,
-0.607151, 0.2840856, -0.9145917, 1, 1, 1, 1, 1,
-0.6065035, 1.919906, -1.14088, 1, 1, 1, 1, 1,
-0.6038734, 0.5486282, -0.2364138, 1, 1, 1, 1, 1,
-0.5968928, -1.375274, -3.969587, 0, 0, 1, 1, 1,
-0.5940608, 1.145946, 0.4626092, 1, 0, 0, 1, 1,
-0.5920369, -0.0965872, 0.02130614, 1, 0, 0, 1, 1,
-0.5886089, -1.004871, -4.141129, 1, 0, 0, 1, 1,
-0.5822465, 1.318142, -1.340458, 1, 0, 0, 1, 1,
-0.5801255, -0.07262221, -0.9609746, 1, 0, 0, 1, 1,
-0.5747325, -2.477049, -1.899738, 0, 0, 0, 1, 1,
-0.5695933, 0.5932847, 0.06239096, 0, 0, 0, 1, 1,
-0.568497, 0.8055645, 0.1298309, 0, 0, 0, 1, 1,
-0.5654927, 0.2874292, -1.739167, 0, 0, 0, 1, 1,
-0.5602068, 1.075684, -0.5199069, 0, 0, 0, 1, 1,
-0.556485, -0.2041694, -1.251926, 0, 0, 0, 1, 1,
-0.5518802, 0.4343336, -2.744393, 0, 0, 0, 1, 1,
-0.5435686, 1.494916, -1.029919, 1, 1, 1, 1, 1,
-0.5387062, 0.1113753, -2.144873, 1, 1, 1, 1, 1,
-0.5386699, 1.369146, -0.3045323, 1, 1, 1, 1, 1,
-0.5373155, -1.022825, -2.59154, 1, 1, 1, 1, 1,
-0.5344812, 0.8725667, -1.552656, 1, 1, 1, 1, 1,
-0.5331245, -0.08289537, -2.121128, 1, 1, 1, 1, 1,
-0.5308155, -0.6957054, 0.06424804, 1, 1, 1, 1, 1,
-0.5253247, 1.418858, 1.144161, 1, 1, 1, 1, 1,
-0.5229648, -1.001427, -2.555743, 1, 1, 1, 1, 1,
-0.5114817, -0.1456087, -1.856503, 1, 1, 1, 1, 1,
-0.5113241, 0.3042351, -0.432777, 1, 1, 1, 1, 1,
-0.5107076, 0.5547668, -1.293476, 1, 1, 1, 1, 1,
-0.5105175, 0.7191911, 0.06478382, 1, 1, 1, 1, 1,
-0.5103639, -0.6346269, -3.137402, 1, 1, 1, 1, 1,
-0.5091615, 0.6867179, 0.6855708, 1, 1, 1, 1, 1,
-0.5081845, 0.9908251, -0.1138327, 0, 0, 1, 1, 1,
-0.4995168, -0.7412794, -2.857499, 1, 0, 0, 1, 1,
-0.4994808, 1.053327, -1.041982, 1, 0, 0, 1, 1,
-0.487045, -1.774379, -4.442819, 1, 0, 0, 1, 1,
-0.4840706, -1.983992, -2.64382, 1, 0, 0, 1, 1,
-0.4817826, 1.856372, 0.2269517, 1, 0, 0, 1, 1,
-0.4813639, -0.4701277, -1.264023, 0, 0, 0, 1, 1,
-0.4797249, 0.9516436, -0.5812942, 0, 0, 0, 1, 1,
-0.4785626, -0.5898258, -2.660763, 0, 0, 0, 1, 1,
-0.4769373, 0.745002, -0.5247969, 0, 0, 0, 1, 1,
-0.4760029, 0.07023203, -0.4589338, 0, 0, 0, 1, 1,
-0.4733754, -0.4489091, -2.619208, 0, 0, 0, 1, 1,
-0.4700769, 0.06776796, -4.385354, 0, 0, 0, 1, 1,
-0.4654844, -0.2865715, -2.397959, 1, 1, 1, 1, 1,
-0.4639163, -1.694681, -3.473546, 1, 1, 1, 1, 1,
-0.4630416, -1.350754, -3.01608, 1, 1, 1, 1, 1,
-0.4595182, -0.1203978, -2.710892, 1, 1, 1, 1, 1,
-0.4551378, -0.07121181, -0.7862858, 1, 1, 1, 1, 1,
-0.4458463, 0.6552994, -0.7242208, 1, 1, 1, 1, 1,
-0.4455791, 0.4816971, -1.677125, 1, 1, 1, 1, 1,
-0.4452606, -1.472638, -1.097184, 1, 1, 1, 1, 1,
-0.4378589, 0.2586259, -0.5740962, 1, 1, 1, 1, 1,
-0.4378491, 0.1790601, 0.4447297, 1, 1, 1, 1, 1,
-0.437239, -0.3378545, -1.057586, 1, 1, 1, 1, 1,
-0.4352672, -0.9717978, -3.323704, 1, 1, 1, 1, 1,
-0.4339516, -1.588979, -5.660301, 1, 1, 1, 1, 1,
-0.4247273, 0.009732756, -2.876178, 1, 1, 1, 1, 1,
-0.4220054, -0.2964497, -1.692024, 1, 1, 1, 1, 1,
-0.42147, -1.108691, -4.381958, 0, 0, 1, 1, 1,
-0.4213141, -0.5444484, -2.942438, 1, 0, 0, 1, 1,
-0.4208788, -0.01241351, -1.131244, 1, 0, 0, 1, 1,
-0.4168512, 0.3178407, 0.04210662, 1, 0, 0, 1, 1,
-0.4161564, 0.3578704, -0.8190026, 1, 0, 0, 1, 1,
-0.4127892, -0.7358912, -5.741972, 1, 0, 0, 1, 1,
-0.4108235, 0.0634057, -0.07160198, 0, 0, 0, 1, 1,
-0.4100405, -1.44837, -1.200638, 0, 0, 0, 1, 1,
-0.4096567, -0.8598626, -3.096321, 0, 0, 0, 1, 1,
-0.4079329, -0.9496796, -3.806891, 0, 0, 0, 1, 1,
-0.4076723, 1.323254, -0.1395045, 0, 0, 0, 1, 1,
-0.4045402, 1.533295, -3.179928, 0, 0, 0, 1, 1,
-0.4042018, 0.9665699, 1.983212, 0, 0, 0, 1, 1,
-0.403684, -1.218424, -2.725142, 1, 1, 1, 1, 1,
-0.4020431, -0.1110721, -2.825276, 1, 1, 1, 1, 1,
-0.398219, 0.200525, 0.5453011, 1, 1, 1, 1, 1,
-0.3975332, 0.0463738, -0.4846062, 1, 1, 1, 1, 1,
-0.3954201, 0.1619812, -0.09209148, 1, 1, 1, 1, 1,
-0.387945, 1.245565, 0.2554186, 1, 1, 1, 1, 1,
-0.3829917, -0.3165454, -1.795919, 1, 1, 1, 1, 1,
-0.3829243, 0.2289342, -1.3629, 1, 1, 1, 1, 1,
-0.3757004, -1.264235, -3.067373, 1, 1, 1, 1, 1,
-0.3721657, 0.1684815, -1.499876, 1, 1, 1, 1, 1,
-0.3644132, 0.2289125, -0.5504853, 1, 1, 1, 1, 1,
-0.363483, -0.4856493, -0.9833446, 1, 1, 1, 1, 1,
-0.3594407, -0.4002791, -3.805581, 1, 1, 1, 1, 1,
-0.359286, 1.15023, -2.507563, 1, 1, 1, 1, 1,
-0.3558991, 1.095387, 0.4196229, 1, 1, 1, 1, 1,
-0.3545313, -1.301558, -2.974164, 0, 0, 1, 1, 1,
-0.3543694, -2.087115, -2.481358, 1, 0, 0, 1, 1,
-0.3489337, -1.07903, -1.902077, 1, 0, 0, 1, 1,
-0.3486217, -0.491743, -0.9275022, 1, 0, 0, 1, 1,
-0.3483209, -1.204291, -1.609921, 1, 0, 0, 1, 1,
-0.3462556, 0.3896218, -0.832666, 1, 0, 0, 1, 1,
-0.3455974, -0.1036311, -3.473703, 0, 0, 0, 1, 1,
-0.3451576, -0.6277903, -2.702983, 0, 0, 0, 1, 1,
-0.3416634, -0.1800933, -2.484614, 0, 0, 0, 1, 1,
-0.3384171, -1.090377, -2.832718, 0, 0, 0, 1, 1,
-0.3376206, -0.9226008, -2.929365, 0, 0, 0, 1, 1,
-0.3373992, 0.6629481, -2.18095, 0, 0, 0, 1, 1,
-0.3363353, 0.2655948, -2.103024, 0, 0, 0, 1, 1,
-0.3327676, 0.4046758, 0.5245623, 1, 1, 1, 1, 1,
-0.3284718, 0.8344995, 1.343301, 1, 1, 1, 1, 1,
-0.317115, -0.5338233, -3.634137, 1, 1, 1, 1, 1,
-0.3169802, -0.9042515, -2.830177, 1, 1, 1, 1, 1,
-0.3136407, 0.4107579, -0.01702345, 1, 1, 1, 1, 1,
-0.3072073, 1.352599, 0.7164499, 1, 1, 1, 1, 1,
-0.3062017, 0.6249698, 0.5401344, 1, 1, 1, 1, 1,
-0.3054153, 0.4895964, 0.2941693, 1, 1, 1, 1, 1,
-0.3044381, 0.4312202, 0.246988, 1, 1, 1, 1, 1,
-0.3043355, 0.1606791, -0.3738542, 1, 1, 1, 1, 1,
-0.3006931, 0.3435135, -0.1229422, 1, 1, 1, 1, 1,
-0.3002658, 0.3203169, 0.4496942, 1, 1, 1, 1, 1,
-0.3001435, -0.4226729, -1.644397, 1, 1, 1, 1, 1,
-0.2995429, 0.9381337, -0.04026104, 1, 1, 1, 1, 1,
-0.2976777, 0.8212814, -0.5058291, 1, 1, 1, 1, 1,
-0.2974972, 0.01903469, -2.341113, 0, 0, 1, 1, 1,
-0.2970424, -0.5359166, -2.292694, 1, 0, 0, 1, 1,
-0.2847993, 1.092731, 1.065925, 1, 0, 0, 1, 1,
-0.2832089, 0.4104901, -0.7757455, 1, 0, 0, 1, 1,
-0.279007, -1.321312, -2.338726, 1, 0, 0, 1, 1,
-0.2758979, -1.893523, -5.052032, 1, 0, 0, 1, 1,
-0.2756572, -0.2551806, -1.699673, 0, 0, 0, 1, 1,
-0.2725314, -0.08019142, -1.326261, 0, 0, 0, 1, 1,
-0.2711357, -0.4857455, -0.5368378, 0, 0, 0, 1, 1,
-0.2675983, 0.08767938, -1.991596, 0, 0, 0, 1, 1,
-0.2656316, 0.4341407, 1.784737, 0, 0, 0, 1, 1,
-0.2625102, -0.1012207, 0.1606617, 0, 0, 0, 1, 1,
-0.2615652, -0.5057381, -3.292837, 0, 0, 0, 1, 1,
-0.259751, 0.5061789, -1.123459, 1, 1, 1, 1, 1,
-0.2584498, -0.1835209, -3.28371, 1, 1, 1, 1, 1,
-0.2527744, 0.1076407, -3.938174, 1, 1, 1, 1, 1,
-0.2486349, 1.554722, 1.539232, 1, 1, 1, 1, 1,
-0.2462184, 0.824299, 0.3169613, 1, 1, 1, 1, 1,
-0.2437087, -2.339887, -3.972728, 1, 1, 1, 1, 1,
-0.2430654, -0.4494959, -3.724229, 1, 1, 1, 1, 1,
-0.2419823, 0.3334449, 0.8820887, 1, 1, 1, 1, 1,
-0.2382688, -0.7844631, -0.4939089, 1, 1, 1, 1, 1,
-0.236678, 1.589872, 1.188066, 1, 1, 1, 1, 1,
-0.235176, 0.506138, -1.873059, 1, 1, 1, 1, 1,
-0.2301087, 0.9353819, -0.6611994, 1, 1, 1, 1, 1,
-0.222075, 0.5006003, -0.9215185, 1, 1, 1, 1, 1,
-0.219407, -1.793817, -1.8314, 1, 1, 1, 1, 1,
-0.2150535, -1.630419, -2.565687, 1, 1, 1, 1, 1,
-0.2062147, 0.6177555, 0.000192096, 0, 0, 1, 1, 1,
-0.2045914, -0.7289214, -2.722522, 1, 0, 0, 1, 1,
-0.203858, -0.9524313, -3.486911, 1, 0, 0, 1, 1,
-0.2035026, 2.036211, 0.911167, 1, 0, 0, 1, 1,
-0.2033827, -0.1042456, -1.330782, 1, 0, 0, 1, 1,
-0.202316, 1.766652, -0.2931781, 1, 0, 0, 1, 1,
-0.2022009, 0.9740849, -0.6272835, 0, 0, 0, 1, 1,
-0.2010632, -1.816913, -2.302692, 0, 0, 0, 1, 1,
-0.1978072, -0.4137388, -2.484004, 0, 0, 0, 1, 1,
-0.1932054, 0.3159271, -1.120003, 0, 0, 0, 1, 1,
-0.1899988, 0.07477929, -0.4657875, 0, 0, 0, 1, 1,
-0.1899829, 1.011507, -1.094763, 0, 0, 0, 1, 1,
-0.1873973, -0.9028411, -2.820541, 0, 0, 0, 1, 1,
-0.1850751, 0.1392208, -2.275413, 1, 1, 1, 1, 1,
-0.1798148, 1.08239, -1.947896, 1, 1, 1, 1, 1,
-0.1772705, -2.393901, -1.901189, 1, 1, 1, 1, 1,
-0.173537, 1.398146, 0.2266796, 1, 1, 1, 1, 1,
-0.1707403, -1.835516, -2.522966, 1, 1, 1, 1, 1,
-0.1705436, 0.962325, -2.029936, 1, 1, 1, 1, 1,
-0.1618639, -0.430149, -3.09693, 1, 1, 1, 1, 1,
-0.161138, 0.5355068, 0.7753881, 1, 1, 1, 1, 1,
-0.1571587, 0.7229093, -1.000532, 1, 1, 1, 1, 1,
-0.1570139, -0.04360754, -2.33758, 1, 1, 1, 1, 1,
-0.1527579, 0.306067, -1.697483, 1, 1, 1, 1, 1,
-0.1511068, 0.5852523, 1.416047, 1, 1, 1, 1, 1,
-0.1509718, -0.3866413, -4.145094, 1, 1, 1, 1, 1,
-0.1509493, -1.010709, -1.792298, 1, 1, 1, 1, 1,
-0.1487918, -0.4796068, -3.53255, 1, 1, 1, 1, 1,
-0.1487783, -0.8084948, -3.356792, 0, 0, 1, 1, 1,
-0.1463136, -0.138721, -0.1688539, 1, 0, 0, 1, 1,
-0.144529, -0.01840284, -2.447967, 1, 0, 0, 1, 1,
-0.1398165, -1.968247, -2.938365, 1, 0, 0, 1, 1,
-0.139741, -0.2249, -2.453856, 1, 0, 0, 1, 1,
-0.1365193, 0.7469311, -1.010614, 1, 0, 0, 1, 1,
-0.1342532, 1.300381, -2.308778, 0, 0, 0, 1, 1,
-0.1320888, -2.647984, -3.43472, 0, 0, 0, 1, 1,
-0.1291251, 1.582157, 0.4811289, 0, 0, 0, 1, 1,
-0.1219269, -0.795298, -4.950948, 0, 0, 0, 1, 1,
-0.1187589, -0.3239304, -2.177157, 0, 0, 0, 1, 1,
-0.1185693, 0.3093064, -1.408113, 0, 0, 0, 1, 1,
-0.1140739, -1.992534, -2.617601, 0, 0, 0, 1, 1,
-0.1122886, 0.2261982, 0.2748011, 1, 1, 1, 1, 1,
-0.1106841, -0.4344194, -3.52528, 1, 1, 1, 1, 1,
-0.1100248, -0.6939874, -2.187416, 1, 1, 1, 1, 1,
-0.1071288, -0.3539006, -3.165037, 1, 1, 1, 1, 1,
-0.1054166, 0.9294962, -0.008828652, 1, 1, 1, 1, 1,
-0.100233, -0.4164052, -3.725337, 1, 1, 1, 1, 1,
-0.09930813, -0.4651511, -3.9712, 1, 1, 1, 1, 1,
-0.09775896, -0.7896701, -3.955006, 1, 1, 1, 1, 1,
-0.0968577, -0.7943693, -3.018165, 1, 1, 1, 1, 1,
-0.09646756, -0.4919844, -2.316678, 1, 1, 1, 1, 1,
-0.09645336, -0.9234715, -3.812765, 1, 1, 1, 1, 1,
-0.09321137, -0.2363968, -3.467152, 1, 1, 1, 1, 1,
-0.09179987, 0.6922676, -0.05293138, 1, 1, 1, 1, 1,
-0.0910772, -0.755357, -1.585736, 1, 1, 1, 1, 1,
-0.0830105, -1.854555, -4.274244, 1, 1, 1, 1, 1,
-0.07718248, 0.9716027, 0.6312134, 0, 0, 1, 1, 1,
-0.07680882, 0.5544667, -0.9697065, 1, 0, 0, 1, 1,
-0.07253205, -0.6492423, -2.223747, 1, 0, 0, 1, 1,
-0.07193781, -0.20793, -2.122195, 1, 0, 0, 1, 1,
-0.07021319, 0.8495666, 0.0588822, 1, 0, 0, 1, 1,
-0.07020168, 0.4287733, -1.052061, 1, 0, 0, 1, 1,
-0.06914097, -1.084923, -3.85292, 0, 0, 0, 1, 1,
-0.06818977, -1.164289, -4.233629, 0, 0, 0, 1, 1,
-0.0669655, -1.368359, -2.523088, 0, 0, 0, 1, 1,
-0.06198033, 0.3107826, -1.262706, 0, 0, 0, 1, 1,
-0.06120244, 0.8962884, 0.7351043, 0, 0, 0, 1, 1,
-0.06008797, -1.956715, -0.7296546, 0, 0, 0, 1, 1,
-0.05938604, 1.448235, -0.6316156, 0, 0, 0, 1, 1,
-0.05844578, -0.1395467, -3.974712, 1, 1, 1, 1, 1,
-0.05406006, 0.07186042, -0.6758078, 1, 1, 1, 1, 1,
-0.05085281, 1.76368, 0.2573167, 1, 1, 1, 1, 1,
-0.04923245, 0.9309359, -1.376081, 1, 1, 1, 1, 1,
-0.04664928, 0.4092305, -0.387254, 1, 1, 1, 1, 1,
-0.04579147, -0.7035511, -2.216043, 1, 1, 1, 1, 1,
-0.04438503, -0.03611831, -1.902898, 1, 1, 1, 1, 1,
-0.04289076, -1.644905, -5.161644, 1, 1, 1, 1, 1,
-0.04270982, 1.075095, 2.095467, 1, 1, 1, 1, 1,
-0.04228127, -0.4848799, -4.533072, 1, 1, 1, 1, 1,
-0.03878616, 0.4526735, 0.1785924, 1, 1, 1, 1, 1,
-0.0362267, 0.7523335, 0.7315246, 1, 1, 1, 1, 1,
-0.03318904, 0.1790648, -1.736, 1, 1, 1, 1, 1,
-0.03114542, -0.3045647, -2.41861, 1, 1, 1, 1, 1,
-0.0302285, 0.3529815, -0.7396998, 1, 1, 1, 1, 1,
-0.0300589, 1.075477, 0.8818487, 0, 0, 1, 1, 1,
-0.02792848, 1.117417, 0.15199, 1, 0, 0, 1, 1,
-0.02660099, 0.116633, -0.2262989, 1, 0, 0, 1, 1,
-0.02565545, -0.6498096, -2.446888, 1, 0, 0, 1, 1,
-0.02287577, -1.346263, -2.938765, 1, 0, 0, 1, 1,
-0.02018222, -1.401418, -3.837721, 1, 0, 0, 1, 1,
-0.01516511, -1.970802, -3.308172, 0, 0, 0, 1, 1,
-0.01489124, 0.09647662, -2.32194, 0, 0, 0, 1, 1,
-0.01477896, -0.2087816, -1.506418, 0, 0, 0, 1, 1,
-0.007920884, 0.198262, -1.429302, 0, 0, 0, 1, 1,
-0.004602799, 0.02639224, -1.603028, 0, 0, 0, 1, 1,
-0.004537116, 2.104096, 0.03383453, 0, 0, 0, 1, 1,
-0.002196935, 0.8668785, 0.8260395, 0, 0, 0, 1, 1,
-0.001119908, 0.6869711, -0.02967314, 1, 1, 1, 1, 1,
-0.0009477407, -0.1885545, -2.466673, 1, 1, 1, 1, 1,
-0.0003329515, 0.8978345, 0.7919709, 1, 1, 1, 1, 1,
0.0001477349, 0.4388124, -0.4547901, 1, 1, 1, 1, 1,
0.004864086, 1.273445, -1.187702, 1, 1, 1, 1, 1,
0.006063055, 0.6442623, 1.380722, 1, 1, 1, 1, 1,
0.008244517, -0.173855, 3.559019, 1, 1, 1, 1, 1,
0.01102813, -0.3902094, 4.771421, 1, 1, 1, 1, 1,
0.01260037, -1.388109, 2.419869, 1, 1, 1, 1, 1,
0.01452742, -0.1459028, 3.492483, 1, 1, 1, 1, 1,
0.02182036, -0.8471966, 3.579606, 1, 1, 1, 1, 1,
0.02424471, -2.06392, 4.020986, 1, 1, 1, 1, 1,
0.02639048, 1.854387, -0.1874696, 1, 1, 1, 1, 1,
0.02901886, 0.8159605, 1.031012, 1, 1, 1, 1, 1,
0.03466905, -0.5713299, 2.65117, 1, 1, 1, 1, 1,
0.03683051, 0.97012, 0.5066206, 0, 0, 1, 1, 1,
0.03708201, 0.3020832, -1.195378, 1, 0, 0, 1, 1,
0.04241688, -0.2973661, 3.201775, 1, 0, 0, 1, 1,
0.04426426, 0.3398904, -1.230353, 1, 0, 0, 1, 1,
0.04806475, -0.7207218, 2.536704, 1, 0, 0, 1, 1,
0.05030381, -0.02956236, 1.669046, 1, 0, 0, 1, 1,
0.05408224, -0.2490428, 3.284003, 0, 0, 0, 1, 1,
0.05888028, 0.3726827, -0.6535175, 0, 0, 0, 1, 1,
0.06010724, -1.54171, 4.306977, 0, 0, 0, 1, 1,
0.0602055, -0.5626373, 4.85948, 0, 0, 0, 1, 1,
0.06280082, -0.2306798, 1.897441, 0, 0, 0, 1, 1,
0.06566484, 0.3628301, -1.609368, 0, 0, 0, 1, 1,
0.07031757, 0.1179571, 0.332369, 0, 0, 0, 1, 1,
0.07059074, -0.4041097, 3.889208, 1, 1, 1, 1, 1,
0.07076961, -0.8233793, 3.1666, 1, 1, 1, 1, 1,
0.07542254, -0.8997891, 3.118851, 1, 1, 1, 1, 1,
0.07647847, -0.9839014, 3.024106, 1, 1, 1, 1, 1,
0.07831164, 0.944639, 0.1648062, 1, 1, 1, 1, 1,
0.07861329, 0.568729, -0.6838779, 1, 1, 1, 1, 1,
0.08041254, 0.7448981, 1.041134, 1, 1, 1, 1, 1,
0.08285127, -0.3631116, 2.804438, 1, 1, 1, 1, 1,
0.08290176, 0.3704022, 0.3839296, 1, 1, 1, 1, 1,
0.08327977, 1.765572, -1.077974, 1, 1, 1, 1, 1,
0.08529452, 1.369938, -1.079154, 1, 1, 1, 1, 1,
0.086776, 0.3506192, 0.2409099, 1, 1, 1, 1, 1,
0.08692525, 0.9706848, 0.05028979, 1, 1, 1, 1, 1,
0.08989913, 1.709551, -0.2939567, 1, 1, 1, 1, 1,
0.09779225, -2.095928, 4.419051, 1, 1, 1, 1, 1,
0.09887146, 0.4072475, 0.09857486, 0, 0, 1, 1, 1,
0.1002855, 0.4447453, 0.5805135, 1, 0, 0, 1, 1,
0.1023277, -0.4842423, 2.382085, 1, 0, 0, 1, 1,
0.1039386, -0.2293096, 3.464202, 1, 0, 0, 1, 1,
0.1062716, -1.202288, 3.297647, 1, 0, 0, 1, 1,
0.1091223, 0.3227558, 0.5599842, 1, 0, 0, 1, 1,
0.1112321, 1.88207, 0.5427819, 0, 0, 0, 1, 1,
0.1131858, 0.06745356, 2.202024, 0, 0, 0, 1, 1,
0.1133221, 0.1963172, -0.8614514, 0, 0, 0, 1, 1,
0.114435, 0.01645967, 1.712476, 0, 0, 0, 1, 1,
0.1170726, 0.6527238, 1.2144, 0, 0, 0, 1, 1,
0.1238022, 0.9156073, 1.664869, 0, 0, 0, 1, 1,
0.1262572, 1.294234, 0.511138, 0, 0, 0, 1, 1,
0.1294986, -0.00707932, 0.5898841, 1, 1, 1, 1, 1,
0.1333846, 0.9107552, 1.869574, 1, 1, 1, 1, 1,
0.1340822, -0.1227682, 2.442037, 1, 1, 1, 1, 1,
0.1341523, -0.7960308, 2.483756, 1, 1, 1, 1, 1,
0.1347284, -0.6550086, 4.354213, 1, 1, 1, 1, 1,
0.1353685, 1.238067, -0.3838983, 1, 1, 1, 1, 1,
0.1420228, 1.153721, -1.287329, 1, 1, 1, 1, 1,
0.1433025, -0.3970861, 4.258119, 1, 1, 1, 1, 1,
0.1491731, 0.6643102, 0.1134847, 1, 1, 1, 1, 1,
0.1507626, 1.152976, -0.2075915, 1, 1, 1, 1, 1,
0.1526907, -0.6341829, 5.010343, 1, 1, 1, 1, 1,
0.1531041, 2.137232, 0.331829, 1, 1, 1, 1, 1,
0.1592057, -1.571381, 2.678256, 1, 1, 1, 1, 1,
0.1595133, 0.5839276, 1.456813, 1, 1, 1, 1, 1,
0.1605214, 0.4816809, -0.89884, 1, 1, 1, 1, 1,
0.1675986, 0.5599885, 0.577496, 0, 0, 1, 1, 1,
0.1736528, 1.012932, -1.745081, 1, 0, 0, 1, 1,
0.1739921, 0.05442334, -0.3134277, 1, 0, 0, 1, 1,
0.1809551, -0.6398348, 5.390501, 1, 0, 0, 1, 1,
0.1833926, 0.6477123, 0.6680276, 1, 0, 0, 1, 1,
0.192105, 1.02103, 1.506051, 1, 0, 0, 1, 1,
0.193225, 1.394355, -1.607715, 0, 0, 0, 1, 1,
0.1953143, 0.9194527, 0.546563, 0, 0, 0, 1, 1,
0.1994118, -0.1010948, 1.786676, 0, 0, 0, 1, 1,
0.1999084, -1.137246, 4.38751, 0, 0, 0, 1, 1,
0.2056734, -0.01513041, 2.321836, 0, 0, 0, 1, 1,
0.2104539, 0.2815794, 0.794941, 0, 0, 0, 1, 1,
0.212528, 0.4744628, -0.6632309, 0, 0, 0, 1, 1,
0.2146553, -1.536379, 2.98872, 1, 1, 1, 1, 1,
0.2173343, 0.2542736, 0.8116975, 1, 1, 1, 1, 1,
0.2206717, 0.3075637, -0.4560265, 1, 1, 1, 1, 1,
0.2243436, 0.352055, -0.42395, 1, 1, 1, 1, 1,
0.224452, 1.831821, -0.05674909, 1, 1, 1, 1, 1,
0.230042, -1.050478, 2.41294, 1, 1, 1, 1, 1,
0.2313983, 0.08573328, 2.766527, 1, 1, 1, 1, 1,
0.2327881, -2.146432, 4.286399, 1, 1, 1, 1, 1,
0.2365451, -0.07034185, -0.0147913, 1, 1, 1, 1, 1,
0.2518404, 0.998407, 0.8681179, 1, 1, 1, 1, 1,
0.2519655, -0.9603653, 4.139244, 1, 1, 1, 1, 1,
0.2588778, 1.169158, 0.3963574, 1, 1, 1, 1, 1,
0.2645288, -1.966869, 2.046982, 1, 1, 1, 1, 1,
0.2661493, 1.464129, 0.09969402, 1, 1, 1, 1, 1,
0.2669595, 0.3921495, -0.8638785, 1, 1, 1, 1, 1,
0.2685794, -0.403325, 1.758882, 0, 0, 1, 1, 1,
0.269034, -0.2116942, 1.469119, 1, 0, 0, 1, 1,
0.2697005, 0.4251142, -0.174645, 1, 0, 0, 1, 1,
0.2719125, -0.4662851, 4.878374, 1, 0, 0, 1, 1,
0.2746971, 0.7887235, 1.039089, 1, 0, 0, 1, 1,
0.2758108, 1.081969, 1.51248, 1, 0, 0, 1, 1,
0.2795486, 0.9616397, -0.6752412, 0, 0, 0, 1, 1,
0.2836761, 0.5861347, -1.630023, 0, 0, 0, 1, 1,
0.2854263, 0.7399383, -0.0679979, 0, 0, 0, 1, 1,
0.2886794, -0.4857167, 2.879389, 0, 0, 0, 1, 1,
0.2931043, 1.27694, 1.382975, 0, 0, 0, 1, 1,
0.293657, -1.933824, 2.651248, 0, 0, 0, 1, 1,
0.2940364, 0.5570766, -0.4438581, 0, 0, 0, 1, 1,
0.2942363, 1.172734, 0.3385523, 1, 1, 1, 1, 1,
0.2950652, 0.7940442, 0.396205, 1, 1, 1, 1, 1,
0.2954708, 0.9101372, 1.811647, 1, 1, 1, 1, 1,
0.2958299, 0.05412621, 2.214068, 1, 1, 1, 1, 1,
0.3049118, 1.134552, 1.004519, 1, 1, 1, 1, 1,
0.3090042, 1.854993, 1.191527, 1, 1, 1, 1, 1,
0.3165866, 1.433676, 0.7674372, 1, 1, 1, 1, 1,
0.3175338, -1.255612, 1.509038, 1, 1, 1, 1, 1,
0.3218272, -0.8289381, 2.269875, 1, 1, 1, 1, 1,
0.3228797, -0.8717731, 2.469609, 1, 1, 1, 1, 1,
0.326065, 0.878172, -0.274115, 1, 1, 1, 1, 1,
0.3289391, 0.5705948, -1.983928, 1, 1, 1, 1, 1,
0.3317636, 1.216288, -0.9319296, 1, 1, 1, 1, 1,
0.332468, -0.8979802, 3.319189, 1, 1, 1, 1, 1,
0.3345466, 1.022979, -2.099687, 1, 1, 1, 1, 1,
0.3354925, -1.134181, 2.182212, 0, 0, 1, 1, 1,
0.3387983, 0.3799565, 0.6374328, 1, 0, 0, 1, 1,
0.3419753, -1.150518, 0.927462, 1, 0, 0, 1, 1,
0.3421156, -1.244948, 3.394505, 1, 0, 0, 1, 1,
0.3437491, 0.5375519, 1.358137, 1, 0, 0, 1, 1,
0.346399, -0.1640645, 0.819957, 1, 0, 0, 1, 1,
0.3485037, -0.2147335, 2.413602, 0, 0, 0, 1, 1,
0.3508739, -0.608021, 1.158152, 0, 0, 0, 1, 1,
0.3545406, 0.2583684, -1.009065, 0, 0, 0, 1, 1,
0.3691789, 0.9620797, 1.474748, 0, 0, 0, 1, 1,
0.3776899, -1.192657, 2.338992, 0, 0, 0, 1, 1,
0.3802248, -0.3864177, 1.533902, 0, 0, 0, 1, 1,
0.3822816, 1.611964, 0.8644611, 0, 0, 0, 1, 1,
0.3834004, 0.8193197, -0.04147459, 1, 1, 1, 1, 1,
0.3848845, -1.498138, 2.730755, 1, 1, 1, 1, 1,
0.3885674, 0.005017722, 2.388659, 1, 1, 1, 1, 1,
0.3963886, -0.08987881, 2.716201, 1, 1, 1, 1, 1,
0.3964629, 0.2165761, 0.471052, 1, 1, 1, 1, 1,
0.3994547, 0.9790589, -1.076676, 1, 1, 1, 1, 1,
0.4028971, -0.3471482, 1.381567, 1, 1, 1, 1, 1,
0.4029516, 0.3911162, 1.254251, 1, 1, 1, 1, 1,
0.4100834, -0.04665575, 2.282825, 1, 1, 1, 1, 1,
0.4101576, 1.094908, -0.1932674, 1, 1, 1, 1, 1,
0.4187064, 0.9194595, 0.1409727, 1, 1, 1, 1, 1,
0.4199196, -0.3906811, 2.054816, 1, 1, 1, 1, 1,
0.4201692, -1.215294, 1.208614, 1, 1, 1, 1, 1,
0.427431, 0.06762207, 1.803799, 1, 1, 1, 1, 1,
0.42883, 0.8287451, -0.8271816, 1, 1, 1, 1, 1,
0.4303323, -0.6191422, 3.114481, 0, 0, 1, 1, 1,
0.4324022, 1.438469, 2.526365, 1, 0, 0, 1, 1,
0.4356465, -1.189365, 2.914923, 1, 0, 0, 1, 1,
0.4369446, 0.4646086, 1.709892, 1, 0, 0, 1, 1,
0.4377597, 0.7926438, -0.4824743, 1, 0, 0, 1, 1,
0.4409862, -0.1117615, 4.345526, 1, 0, 0, 1, 1,
0.4421118, 0.4000289, 2.918169, 0, 0, 0, 1, 1,
0.4473001, -1.287502, 3.795088, 0, 0, 0, 1, 1,
0.4474912, 1.013233, -0.1174004, 0, 0, 0, 1, 1,
0.4480884, -0.6802509, 1.375336, 0, 0, 0, 1, 1,
0.4499422, -1.554096, 2.715553, 0, 0, 0, 1, 1,
0.4501624, -0.3049427, 1.213589, 0, 0, 0, 1, 1,
0.4509375, 1.827036, -0.602826, 0, 0, 0, 1, 1,
0.4532499, -1.417991, 1.64979, 1, 1, 1, 1, 1,
0.4546634, 0.7907513, 2.316691, 1, 1, 1, 1, 1,
0.4551904, -0.3060475, -0.1629677, 1, 1, 1, 1, 1,
0.4566978, -0.3063695, 2.543414, 1, 1, 1, 1, 1,
0.4648154, 1.963849, 1.529953, 1, 1, 1, 1, 1,
0.469949, 1.045505, 1.3529, 1, 1, 1, 1, 1,
0.4708479, -0.5690998, 2.2023, 1, 1, 1, 1, 1,
0.4712941, 0.1285662, 1.821949, 1, 1, 1, 1, 1,
0.4732695, -0.4360434, 0.6789098, 1, 1, 1, 1, 1,
0.4751517, 1.207999, -0.2119018, 1, 1, 1, 1, 1,
0.4767766, -0.3652146, 3.31746, 1, 1, 1, 1, 1,
0.4789821, 0.2621443, 0.7221742, 1, 1, 1, 1, 1,
0.4793192, 0.5229496, 0.2417374, 1, 1, 1, 1, 1,
0.4820088, -1.0798, 3.808887, 1, 1, 1, 1, 1,
0.4839126, 0.1654877, 2.416527, 1, 1, 1, 1, 1,
0.4899496, -0.6067941, 1.952234, 0, 0, 1, 1, 1,
0.4917156, -0.4857442, 3.019698, 1, 0, 0, 1, 1,
0.498106, 0.3437829, 1.996125, 1, 0, 0, 1, 1,
0.5079054, 0.6648861, -0.2176234, 1, 0, 0, 1, 1,
0.511506, 0.1797209, 0.9429047, 1, 0, 0, 1, 1,
0.5149623, -0.3561375, 2.755222, 1, 0, 0, 1, 1,
0.5163941, 1.090285, 0.02287927, 0, 0, 0, 1, 1,
0.5191256, -0.3784288, 2.30024, 0, 0, 0, 1, 1,
0.5257478, -0.6693594, 2.067517, 0, 0, 0, 1, 1,
0.5298579, 0.1082209, 2.004755, 0, 0, 0, 1, 1,
0.5307832, 0.8075957, 1.180595, 0, 0, 0, 1, 1,
0.5318312, -2.519599, 3.98008, 0, 0, 0, 1, 1,
0.5320107, -1.364444, 2.684749, 0, 0, 0, 1, 1,
0.5344019, 0.5572957, -1.092335, 1, 1, 1, 1, 1,
0.5403981, -1.332746, 1.040157, 1, 1, 1, 1, 1,
0.5441705, -0.2200453, 2.589061, 1, 1, 1, 1, 1,
0.5448617, -0.9692093, 3.217916, 1, 1, 1, 1, 1,
0.5451941, -0.1364339, 0.001362074, 1, 1, 1, 1, 1,
0.5460826, -0.5479428, 2.993375, 1, 1, 1, 1, 1,
0.5472131, 0.1020797, 0.9708039, 1, 1, 1, 1, 1,
0.5485398, 0.6493276, 1.219085, 1, 1, 1, 1, 1,
0.5515164, -1.993369, 3.579493, 1, 1, 1, 1, 1,
0.5542893, 1.061088, 0.6124327, 1, 1, 1, 1, 1,
0.5559505, -0.3207414, 0.5507396, 1, 1, 1, 1, 1,
0.5611762, -1.055822, 5.00674, 1, 1, 1, 1, 1,
0.5665592, 0.4520245, 1.566599, 1, 1, 1, 1, 1,
0.5681689, -0.1359673, 2.080499, 1, 1, 1, 1, 1,
0.5696578, 2.671852, -0.2236086, 1, 1, 1, 1, 1,
0.5826762, 0.6808264, 0.7066832, 0, 0, 1, 1, 1,
0.5835348, -1.490241, 2.767526, 1, 0, 0, 1, 1,
0.5872197, -0.7707978, 2.134854, 1, 0, 0, 1, 1,
0.5890245, 0.6788213, -0.01189556, 1, 0, 0, 1, 1,
0.5893328, -1.228885, 3.661178, 1, 0, 0, 1, 1,
0.592926, -0.9256101, 2.970221, 1, 0, 0, 1, 1,
0.5937245, -2.196934, 2.717628, 0, 0, 0, 1, 1,
0.5957601, -0.09233762, 1.906233, 0, 0, 0, 1, 1,
0.5996083, -0.9642031, 2.306913, 0, 0, 0, 1, 1,
0.6017973, -0.4876268, 1.2637, 0, 0, 0, 1, 1,
0.6028191, 1.016451, 2.876977, 0, 0, 0, 1, 1,
0.6077871, -0.7913336, 4.244654, 0, 0, 0, 1, 1,
0.6078057, -0.5989795, 2.061229, 0, 0, 0, 1, 1,
0.6083877, -1.104595, 2.260495, 1, 1, 1, 1, 1,
0.6099664, 0.02038197, 3.086377, 1, 1, 1, 1, 1,
0.6129343, -0.2320998, 1.644358, 1, 1, 1, 1, 1,
0.6174105, -1.292141, 3.335194, 1, 1, 1, 1, 1,
0.617909, -0.411081, 2.122838, 1, 1, 1, 1, 1,
0.6186278, -1.680328, 2.866334, 1, 1, 1, 1, 1,
0.6186894, -0.2380962, 1.900935, 1, 1, 1, 1, 1,
0.6193615, 0.200759, 0.9090655, 1, 1, 1, 1, 1,
0.6207407, 0.7887981, -0.4302429, 1, 1, 1, 1, 1,
0.6234017, -1.164778, 1.603661, 1, 1, 1, 1, 1,
0.6290954, 1.403973, 0.06160217, 1, 1, 1, 1, 1,
0.6312842, 0.5097593, 2.274438, 1, 1, 1, 1, 1,
0.6386485, -1.655595, 2.318245, 1, 1, 1, 1, 1,
0.6453337, 1.082007, 2.3716, 1, 1, 1, 1, 1,
0.6453868, -0.4124202, 2.63019, 1, 1, 1, 1, 1,
0.6475431, 0.8083966, 0.9153538, 0, 0, 1, 1, 1,
0.6476796, -0.2920338, 3.155479, 1, 0, 0, 1, 1,
0.6516618, 0.2331888, 1.295884, 1, 0, 0, 1, 1,
0.6558223, -0.3258274, 1.72982, 1, 0, 0, 1, 1,
0.656718, -0.7856666, 3.202442, 1, 0, 0, 1, 1,
0.6630129, -1.784771, 3.026197, 1, 0, 0, 1, 1,
0.6697818, -0.2436248, 2.394154, 0, 0, 0, 1, 1,
0.6706281, 0.1580596, 0.2231489, 0, 0, 0, 1, 1,
0.6722015, -0.1904051, 1.622892, 0, 0, 0, 1, 1,
0.6790254, -2.230446, 2.114674, 0, 0, 0, 1, 1,
0.682894, 1.348598, 1.6613, 0, 0, 0, 1, 1,
0.6883089, -0.8507016, 0.7084941, 0, 0, 0, 1, 1,
0.6896605, 0.4819899, 0.8336621, 0, 0, 0, 1, 1,
0.7009043, 0.7947078, 0.8907861, 1, 1, 1, 1, 1,
0.704892, 0.3729, 1.08315, 1, 1, 1, 1, 1,
0.708508, 0.590072, 0.287421, 1, 1, 1, 1, 1,
0.7103209, -0.5013216, 2.386088, 1, 1, 1, 1, 1,
0.7119402, -1.059334, 3.496193, 1, 1, 1, 1, 1,
0.7143683, 1.205974, -0.9341067, 1, 1, 1, 1, 1,
0.723217, -0.3067782, 2.38158, 1, 1, 1, 1, 1,
0.7239454, -0.4780891, 0.7108446, 1, 1, 1, 1, 1,
0.7278997, 0.3581066, 1.438639, 1, 1, 1, 1, 1,
0.7293659, -1.668663, 2.967021, 1, 1, 1, 1, 1,
0.7366101, -0.2405577, 0.4165355, 1, 1, 1, 1, 1,
0.7441893, -1.402692, 3.870551, 1, 1, 1, 1, 1,
0.7678523, -0.8909552, 2.006972, 1, 1, 1, 1, 1,
0.7958422, -1.582721, 2.885448, 1, 1, 1, 1, 1,
0.7997347, -0.9887453, 2.045997, 1, 1, 1, 1, 1,
0.8040368, 1.241406, -0.1046871, 0, 0, 1, 1, 1,
0.8064216, -0.5831861, 2.115305, 1, 0, 0, 1, 1,
0.8103097, 0.1234537, 0.2849563, 1, 0, 0, 1, 1,
0.8141408, -1.776117, 3.538451, 1, 0, 0, 1, 1,
0.8145407, -0.1544533, 1.907693, 1, 0, 0, 1, 1,
0.8163607, 0.1685252, 0.4137611, 1, 0, 0, 1, 1,
0.8245807, 0.6498938, -0.8025619, 0, 0, 0, 1, 1,
0.8331072, 1.058579, 0.9405341, 0, 0, 0, 1, 1,
0.8347975, 0.6053033, 0.3446319, 0, 0, 0, 1, 1,
0.844489, 0.5966382, 1.288017, 0, 0, 0, 1, 1,
0.8470585, -1.209908, 2.65448, 0, 0, 0, 1, 1,
0.8510838, -0.1232272, 1.118885, 0, 0, 0, 1, 1,
0.853996, -0.9880908, 2.484079, 0, 0, 0, 1, 1,
0.8543864, -0.4012066, 2.699935, 1, 1, 1, 1, 1,
0.860431, 1.056743, -0.3144723, 1, 1, 1, 1, 1,
0.8626127, -0.2269203, 0.03467969, 1, 1, 1, 1, 1,
0.8646761, -0.3441788, 2.52313, 1, 1, 1, 1, 1,
0.8647984, -1.344475, 2.453044, 1, 1, 1, 1, 1,
0.8667537, 2.09968, -0.2278948, 1, 1, 1, 1, 1,
0.8703588, -0.5772272, 3.286066, 1, 1, 1, 1, 1,
0.8718381, 1.367156, 0.5905445, 1, 1, 1, 1, 1,
0.8736442, 0.09829726, 1.995606, 1, 1, 1, 1, 1,
0.8752066, 0.2088683, 2.610263, 1, 1, 1, 1, 1,
0.8782837, 1.394057, 0.1407802, 1, 1, 1, 1, 1,
0.8819371, -1.104004, 1.407034, 1, 1, 1, 1, 1,
0.8844752, 0.931129, 1.064396, 1, 1, 1, 1, 1,
0.8877418, -0.5758192, 3.866129, 1, 1, 1, 1, 1,
0.8922261, 1.342352, 1.073416, 1, 1, 1, 1, 1,
0.8947761, 1.107712, -1.235377, 0, 0, 1, 1, 1,
0.895763, -0.7000709, 2.977579, 1, 0, 0, 1, 1,
0.9012306, 1.564769, 1.234157, 1, 0, 0, 1, 1,
0.9097156, 1.674092, 0.8837, 1, 0, 0, 1, 1,
0.9126279, 0.8230633, 0.4602358, 1, 0, 0, 1, 1,
0.9173478, -1.666809, 2.842654, 1, 0, 0, 1, 1,
0.9209429, 0.5053101, 0.6349471, 0, 0, 0, 1, 1,
0.925702, -1.913752, 2.394622, 0, 0, 0, 1, 1,
0.9477099, 0.350634, 1.274595, 0, 0, 0, 1, 1,
0.9509882, 1.387151, 0.9883629, 0, 0, 0, 1, 1,
0.9544563, 0.2483121, -0.6313388, 0, 0, 0, 1, 1,
0.9587151, 0.5906988, 0.939503, 0, 0, 0, 1, 1,
0.9588734, 0.3999518, -0.4112767, 0, 0, 0, 1, 1,
0.9608074, -0.2164012, 0.5035541, 1, 1, 1, 1, 1,
0.9640294, 0.07315635, 2.39805, 1, 1, 1, 1, 1,
0.9680538, 0.07044563, 2.044125, 1, 1, 1, 1, 1,
0.9683033, 0.08327283, 2.948378, 1, 1, 1, 1, 1,
0.9748071, 0.10577, 1.296617, 1, 1, 1, 1, 1,
0.975827, 0.2223234, 1.290984, 1, 1, 1, 1, 1,
0.9767201, -1.434061, 2.003467, 1, 1, 1, 1, 1,
0.9784172, -0.7039728, 1.915093, 1, 1, 1, 1, 1,
0.9789749, 0.5976813, 1.904032, 1, 1, 1, 1, 1,
0.9819273, -0.6686323, 2.116872, 1, 1, 1, 1, 1,
0.9880941, 1.075953, 0.9652835, 1, 1, 1, 1, 1,
0.9965026, -1.322206, 3.221487, 1, 1, 1, 1, 1,
1.007015, -0.8621842, 2.045078, 1, 1, 1, 1, 1,
1.013836, -1.175617, 3.02729, 1, 1, 1, 1, 1,
1.015495, -1.437323, 2.875162, 1, 1, 1, 1, 1,
1.019505, 0.879958, 0.9432648, 0, 0, 1, 1, 1,
1.020971, 1.751971, -0.5908976, 1, 0, 0, 1, 1,
1.022932, -0.4580317, 2.351638, 1, 0, 0, 1, 1,
1.024335, -0.5361965, 1.825661, 1, 0, 0, 1, 1,
1.029097, -1.150421, 3.321674, 1, 0, 0, 1, 1,
1.029227, -1.374946, 2.405395, 1, 0, 0, 1, 1,
1.034039, -0.777459, 2.589494, 0, 0, 0, 1, 1,
1.040597, 0.4761986, -0.4756028, 0, 0, 0, 1, 1,
1.042371, -0.6420904, 2.082765, 0, 0, 0, 1, 1,
1.042978, -2.154488, 2.326842, 0, 0, 0, 1, 1,
1.044463, 0.124869, 0.3593882, 0, 0, 0, 1, 1,
1.045229, -1.828665, 1.95414, 0, 0, 0, 1, 1,
1.046655, 1.379878, 3.004481, 0, 0, 0, 1, 1,
1.050128, -0.7876571, 2.339277, 1, 1, 1, 1, 1,
1.050604, -0.3836582, 2.073982, 1, 1, 1, 1, 1,
1.053051, 1.005226, 1.596965, 1, 1, 1, 1, 1,
1.061773, 0.7064877, 1.391904, 1, 1, 1, 1, 1,
1.067308, -0.06381623, 1.810152, 1, 1, 1, 1, 1,
1.070333, 0.6412531, -0.2737809, 1, 1, 1, 1, 1,
1.07174, -0.2089642, 2.017544, 1, 1, 1, 1, 1,
1.07383, 0.0985902, 3.018522, 1, 1, 1, 1, 1,
1.076252, -0.4900813, 1.493202, 1, 1, 1, 1, 1,
1.078798, -1.149085, 2.657642, 1, 1, 1, 1, 1,
1.079436, -0.4038559, 1.427983, 1, 1, 1, 1, 1,
1.086545, 0.1054408, 1.360077, 1, 1, 1, 1, 1,
1.086781, 1.162421, 0.6715099, 1, 1, 1, 1, 1,
1.099205, -2.335394, 4.177432, 1, 1, 1, 1, 1,
1.103794, -0.8551151, 2.14272, 1, 1, 1, 1, 1,
1.109176, -0.0180939, 3.579265, 0, 0, 1, 1, 1,
1.1114, -0.1310465, 1.674859, 1, 0, 0, 1, 1,
1.112867, 0.2618959, 3.210523, 1, 0, 0, 1, 1,
1.114689, -1.71055, 1.66469, 1, 0, 0, 1, 1,
1.116991, -0.9744316, 4.664496, 1, 0, 0, 1, 1,
1.118293, -1.543273, 2.128777, 1, 0, 0, 1, 1,
1.121806, 1.059229, -0.9358811, 0, 0, 0, 1, 1,
1.129501, 0.321624, 1.445319, 0, 0, 0, 1, 1,
1.132184, 0.2152405, 1.278446, 0, 0, 0, 1, 1,
1.132384, 0.3294835, 1.005245, 0, 0, 0, 1, 1,
1.134718, -1.097502, 1.238904, 0, 0, 0, 1, 1,
1.141673, 0.6420308, 1.577982, 0, 0, 0, 1, 1,
1.149341, -1.167972, 3.266505, 0, 0, 0, 1, 1,
1.155055, -0.5275096, 2.352228, 1, 1, 1, 1, 1,
1.156588, -0.2636423, 1.621021, 1, 1, 1, 1, 1,
1.171254, 0.7602635, 2.107295, 1, 1, 1, 1, 1,
1.173834, -0.4030782, 0.1580191, 1, 1, 1, 1, 1,
1.176792, -0.6689137, 2.290369, 1, 1, 1, 1, 1,
1.189697, -0.133422, 3.501378, 1, 1, 1, 1, 1,
1.210189, 1.396536, 1.079525, 1, 1, 1, 1, 1,
1.213194, 0.6173412, -0.5003715, 1, 1, 1, 1, 1,
1.21432, -0.5430029, 3.532117, 1, 1, 1, 1, 1,
1.218334, -0.2496494, 2.965614, 1, 1, 1, 1, 1,
1.223886, -1.080927, 2.124432, 1, 1, 1, 1, 1,
1.226051, -1.398711, 2.276259, 1, 1, 1, 1, 1,
1.228697, -0.7328799, 1.848475, 1, 1, 1, 1, 1,
1.230986, -0.2335212, 2.693113, 1, 1, 1, 1, 1,
1.238323, 1.047359, -0.9109197, 1, 1, 1, 1, 1,
1.239942, 1.942274, -0.03821364, 0, 0, 1, 1, 1,
1.244737, -0.1158593, 1.272862, 1, 0, 0, 1, 1,
1.252417, -0.8037485, 1.985437, 1, 0, 0, 1, 1,
1.254048, -1.787115, 1.854508, 1, 0, 0, 1, 1,
1.266616, -0.6323982, 3.193826, 1, 0, 0, 1, 1,
1.274915, -0.8571924, 1.385466, 1, 0, 0, 1, 1,
1.278068, -0.05412559, 1.220325, 0, 0, 0, 1, 1,
1.310286, -0.8524527, 2.873122, 0, 0, 0, 1, 1,
1.311881, 0.9736174, 1.450196, 0, 0, 0, 1, 1,
1.31215, -0.9272823, 3.507585, 0, 0, 0, 1, 1,
1.329254, -1.545971, 2.211193, 0, 0, 0, 1, 1,
1.33418, -0.620585, 2.113909, 0, 0, 0, 1, 1,
1.33645, 0.7181695, 0.7398093, 0, 0, 0, 1, 1,
1.338337, 0.1328837, 3.028659, 1, 1, 1, 1, 1,
1.342138, -0.3840179, 1.649472, 1, 1, 1, 1, 1,
1.345168, 2.681173, 0.07921572, 1, 1, 1, 1, 1,
1.351058, -0.9915456, 2.625951, 1, 1, 1, 1, 1,
1.358842, 0.3419267, 0.9128164, 1, 1, 1, 1, 1,
1.360375, -0.8058085, 2.454015, 1, 1, 1, 1, 1,
1.360777, 0.6511571, 2.381314, 1, 1, 1, 1, 1,
1.376839, -0.7248071, 0.7051854, 1, 1, 1, 1, 1,
1.382589, 1.720181, -1.111577, 1, 1, 1, 1, 1,
1.382649, -0.2884513, 2.447689, 1, 1, 1, 1, 1,
1.386276, -0.7205457, 0.5131588, 1, 1, 1, 1, 1,
1.398336, 1.026525, 1.22752, 1, 1, 1, 1, 1,
1.403169, -1.46238, 3.812582, 1, 1, 1, 1, 1,
1.404109, 1.326766, -0.2354145, 1, 1, 1, 1, 1,
1.407752, -1.436032, 1.296016, 1, 1, 1, 1, 1,
1.410668, -0.1715153, 0.517136, 0, 0, 1, 1, 1,
1.411415, -0.6407643, 1.629901, 1, 0, 0, 1, 1,
1.415345, 0.1585055, 1.091725, 1, 0, 0, 1, 1,
1.429522, 0.1194252, 2.340606, 1, 0, 0, 1, 1,
1.437317, -0.2013783, 3.473793, 1, 0, 0, 1, 1,
1.443471, -3.040277, 4.840939, 1, 0, 0, 1, 1,
1.456553, 2.215556, -0.02341831, 0, 0, 0, 1, 1,
1.459895, -1.384436, 3.171329, 0, 0, 0, 1, 1,
1.46229, -0.9155772, 2.175731, 0, 0, 0, 1, 1,
1.468986, -0.6979062, 2.184192, 0, 0, 0, 1, 1,
1.475875, -1.34223, 2.80274, 0, 0, 0, 1, 1,
1.493522, -0.4176236, 1.596205, 0, 0, 0, 1, 1,
1.503833, 2.174849, 2.140438, 0, 0, 0, 1, 1,
1.504027, 0.904397, 0.5043242, 1, 1, 1, 1, 1,
1.511672, -0.2850454, 0.9154409, 1, 1, 1, 1, 1,
1.512847, -0.3832748, 2.11559, 1, 1, 1, 1, 1,
1.513065, 0.3160855, 2.694453, 1, 1, 1, 1, 1,
1.522792, 0.8573745, 1.102753, 1, 1, 1, 1, 1,
1.524921, 0.2272561, 2.958092, 1, 1, 1, 1, 1,
1.530163, -0.5641162, 1.374112, 1, 1, 1, 1, 1,
1.537393, -1.301259, 1.551794, 1, 1, 1, 1, 1,
1.545861, 0.5239955, 0.06540003, 1, 1, 1, 1, 1,
1.562191, 0.9657671, -0.1583468, 1, 1, 1, 1, 1,
1.573622, 0.678285, 0.7552894, 1, 1, 1, 1, 1,
1.575562, -0.3221467, 1.718461, 1, 1, 1, 1, 1,
1.63329, -0.1222733, 1.078535, 1, 1, 1, 1, 1,
1.636785, 1.076914, 2.155693, 1, 1, 1, 1, 1,
1.646746, -0.7373617, 2.798376, 1, 1, 1, 1, 1,
1.651632, 0.6087038, 1.519834, 0, 0, 1, 1, 1,
1.652597, 0.6620593, 0.7574915, 1, 0, 0, 1, 1,
1.65905, -1.573002, 1.539093, 1, 0, 0, 1, 1,
1.671502, 1.13461, 0.7613456, 1, 0, 0, 1, 1,
1.67357, -1.30149, 2.650491, 1, 0, 0, 1, 1,
1.687134, 0.3621874, 1.395937, 1, 0, 0, 1, 1,
1.698242, 1.24133, -0.7402655, 0, 0, 0, 1, 1,
1.705183, -1.581269, 1.501994, 0, 0, 0, 1, 1,
1.736032, -0.8056868, 2.508528, 0, 0, 0, 1, 1,
1.773358, 0.6230376, 0.8483711, 0, 0, 0, 1, 1,
1.785031, 1.489216, 1.370546, 0, 0, 0, 1, 1,
1.803648, -0.4348857, 0.9880435, 0, 0, 0, 1, 1,
1.8135, -0.227382, 2.013559, 0, 0, 0, 1, 1,
1.826541, 0.1047475, 1.943212, 1, 1, 1, 1, 1,
1.832851, -0.7297979, 0.8005823, 1, 1, 1, 1, 1,
1.84433, 2.120313, -0.02697249, 1, 1, 1, 1, 1,
1.877321, 0.176162, 1.631325, 1, 1, 1, 1, 1,
1.880649, -0.5649353, 1.964428, 1, 1, 1, 1, 1,
1.881098, -0.6494028, 0.7339977, 1, 1, 1, 1, 1,
1.90208, 0.1892993, 4.004608, 1, 1, 1, 1, 1,
1.90261, 1.517493, 1.408354, 1, 1, 1, 1, 1,
1.908677, 0.8252516, 0.7977849, 1, 1, 1, 1, 1,
1.911014, -0.3408326, 1.438618, 1, 1, 1, 1, 1,
1.912039, -0.5866135, 2.948935, 1, 1, 1, 1, 1,
1.916348, -0.6238142, 0.7227111, 1, 1, 1, 1, 1,
1.91971, -0.3072069, 1.277118, 1, 1, 1, 1, 1,
1.952925, -0.5745643, -0.7245088, 1, 1, 1, 1, 1,
1.977453, 0.8718387, 1.90838, 1, 1, 1, 1, 1,
1.985445, -1.937423, 3.218188, 0, 0, 1, 1, 1,
1.990867, -0.06327091, 2.437141, 1, 0, 0, 1, 1,
1.992728, -2.436062, 1.782859, 1, 0, 0, 1, 1,
1.995776, -0.6658377, 1.159518, 1, 0, 0, 1, 1,
2.022962, -2.376727, 2.052286, 1, 0, 0, 1, 1,
2.03248, 0.9031901, 2.327478, 1, 0, 0, 1, 1,
2.1487, -1.839145, 3.137403, 0, 0, 0, 1, 1,
2.159016, 1.580164, 1.276476, 0, 0, 0, 1, 1,
2.162037, 2.118566, -1.50279, 0, 0, 0, 1, 1,
2.184323, -1.270473, 2.851472, 0, 0, 0, 1, 1,
2.275757, -0.04978364, 2.186168, 0, 0, 0, 1, 1,
2.288657, -1.016528, 2.461636, 0, 0, 0, 1, 1,
2.305893, 1.100379, 1.049745, 0, 0, 0, 1, 1,
2.405021, -0.9887897, 3.053418, 1, 1, 1, 1, 1,
2.416975, 0.5929697, 2.41659, 1, 1, 1, 1, 1,
2.41729, -0.5481394, 2.15835, 1, 1, 1, 1, 1,
2.451943, 1.464179, 0.06316405, 1, 1, 1, 1, 1,
2.563253, -1.611451, 3.354843, 1, 1, 1, 1, 1,
2.894403, 0.03790958, 2.520757, 1, 1, 1, 1, 1,
3.455067, 0.9884332, 2.905404, 1, 1, 1, 1, 1
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
var radius = 9.674663;
var distance = 33.98185;
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
mvMatrix.translate( -0.3021675, 0.2200509, 0.1757357 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98185);
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
