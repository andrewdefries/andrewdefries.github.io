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
-3.243346, 0.8165028, -1.897762, 1, 0, 0, 1,
-2.782283, 0.4555277, -2.259286, 1, 0.007843138, 0, 1,
-2.682319, 0.05204212, -2.159834, 1, 0.01176471, 0, 1,
-2.300748, -0.4138822, -3.665614, 1, 0.01960784, 0, 1,
-2.295307, 1.236105, -0.4332561, 1, 0.02352941, 0, 1,
-2.269125, 0.8670584, 0.6394225, 1, 0.03137255, 0, 1,
-2.253881, -0.05084264, -1.355255, 1, 0.03529412, 0, 1,
-2.241658, 1.928553, -1.68784, 1, 0.04313726, 0, 1,
-2.187914, -0.1443697, -0.2177117, 1, 0.04705882, 0, 1,
-2.113858, 0.0363731, -0.5602679, 1, 0.05490196, 0, 1,
-2.083903, 1.886193, -0.3815506, 1, 0.05882353, 0, 1,
-2.065129, 0.5749138, 1.776615, 1, 0.06666667, 0, 1,
-2.044782, 0.8601795, -1.719677, 1, 0.07058824, 0, 1,
-2.002925, 0.2068986, -0.7480668, 1, 0.07843138, 0, 1,
-1.98602, 2.314977, 0.5274296, 1, 0.08235294, 0, 1,
-1.973005, -0.6905843, -1.771458, 1, 0.09019608, 0, 1,
-1.970291, 1.059195, -0.7730056, 1, 0.09411765, 0, 1,
-1.956172, 0.1500208, -0.3717588, 1, 0.1019608, 0, 1,
-1.950832, 1.968336, -0.622174, 1, 0.1098039, 0, 1,
-1.9326, -0.2105209, -0.8607377, 1, 0.1137255, 0, 1,
-1.92918, 0.03733991, -2.656112, 1, 0.1215686, 0, 1,
-1.909155, 2.196377, 0.7712422, 1, 0.1254902, 0, 1,
-1.908981, -0.685116, -3.276682, 1, 0.1333333, 0, 1,
-1.853033, 0.5116044, -0.9042907, 1, 0.1372549, 0, 1,
-1.849897, -0.8051017, -2.920498, 1, 0.145098, 0, 1,
-1.849441, 1.285761, -2.552517, 1, 0.1490196, 0, 1,
-1.832583, 2.087412, -0.2106621, 1, 0.1568628, 0, 1,
-1.831518, 0.3208485, -1.257551, 1, 0.1607843, 0, 1,
-1.827248, 0.7424161, -2.364792, 1, 0.1686275, 0, 1,
-1.816522, -1.16235, -0.8448011, 1, 0.172549, 0, 1,
-1.813612, -0.771403, -0.7698422, 1, 0.1803922, 0, 1,
-1.792283, 0.3264569, -1.597672, 1, 0.1843137, 0, 1,
-1.771249, 0.4760124, -1.831895, 1, 0.1921569, 0, 1,
-1.71835, 1.242625, -2.440361, 1, 0.1960784, 0, 1,
-1.704929, 0.3299041, -0.1058031, 1, 0.2039216, 0, 1,
-1.696771, -0.7223037, -2.972933, 1, 0.2117647, 0, 1,
-1.695938, -0.3045119, -0.6622132, 1, 0.2156863, 0, 1,
-1.686655, -1.038633, -3.128662, 1, 0.2235294, 0, 1,
-1.685742, 1.662681, 0.1299633, 1, 0.227451, 0, 1,
-1.683097, 0.1658182, 1.909149, 1, 0.2352941, 0, 1,
-1.673772, -0.1134854, -1.718957, 1, 0.2392157, 0, 1,
-1.666761, 1.587098, -0.1190015, 1, 0.2470588, 0, 1,
-1.653832, -0.01145904, 0.9354811, 1, 0.2509804, 0, 1,
-1.64011, -0.2330573, -1.445265, 1, 0.2588235, 0, 1,
-1.618017, -1.176847, -2.095417, 1, 0.2627451, 0, 1,
-1.610765, 0.4484133, -2.709753, 1, 0.2705882, 0, 1,
-1.582753, 0.5154023, -0.1877172, 1, 0.2745098, 0, 1,
-1.577416, -0.414811, -0.4448787, 1, 0.282353, 0, 1,
-1.575025, -0.4923405, -0.5341926, 1, 0.2862745, 0, 1,
-1.550755, 0.4573631, -1.238916, 1, 0.2941177, 0, 1,
-1.548019, 0.5178185, -0.6988154, 1, 0.3019608, 0, 1,
-1.545863, -1.264824, -1.277992, 1, 0.3058824, 0, 1,
-1.537172, -1.306108, -3.565381, 1, 0.3137255, 0, 1,
-1.535826, 0.6527141, -0.9663849, 1, 0.3176471, 0, 1,
-1.51579, 0.4036486, 0.5174119, 1, 0.3254902, 0, 1,
-1.51124, 0.6176814, -0.9312773, 1, 0.3294118, 0, 1,
-1.510395, 0.4988408, -1.089299, 1, 0.3372549, 0, 1,
-1.508571, 0.5833626, -1.174272, 1, 0.3411765, 0, 1,
-1.496977, -1.626891, -1.750159, 1, 0.3490196, 0, 1,
-1.489381, -0.5707994, -0.814816, 1, 0.3529412, 0, 1,
-1.489083, -1.069232, -1.965345, 1, 0.3607843, 0, 1,
-1.48854, -2.357817, -2.325959, 1, 0.3647059, 0, 1,
-1.486922, 0.1771679, 0.4144128, 1, 0.372549, 0, 1,
-1.473044, 0.6183689, 0.05432552, 1, 0.3764706, 0, 1,
-1.467942, -0.2104172, -2.613596, 1, 0.3843137, 0, 1,
-1.45951, 0.8474963, 0.007043899, 1, 0.3882353, 0, 1,
-1.450971, -0.8630378, -1.812361, 1, 0.3960784, 0, 1,
-1.440547, -0.8727362, -1.588987, 1, 0.4039216, 0, 1,
-1.4389, -0.7015821, -2.036842, 1, 0.4078431, 0, 1,
-1.435487, -0.7523529, -2.416622, 1, 0.4156863, 0, 1,
-1.430318, -0.4220623, -2.546277, 1, 0.4196078, 0, 1,
-1.427607, -0.8111799, -2.208575, 1, 0.427451, 0, 1,
-1.42151, 0.1077685, -1.086108, 1, 0.4313726, 0, 1,
-1.421346, -0.09484651, -0.8690103, 1, 0.4392157, 0, 1,
-1.4109, -1.27325, 0.1538565, 1, 0.4431373, 0, 1,
-1.406734, -1.438358, -3.64901, 1, 0.4509804, 0, 1,
-1.404514, -1.20234, -1.333848, 1, 0.454902, 0, 1,
-1.399719, 0.7704511, -1.285317, 1, 0.4627451, 0, 1,
-1.39202, 1.062499, -1.596398, 1, 0.4666667, 0, 1,
-1.390895, 0.06313391, -2.206611, 1, 0.4745098, 0, 1,
-1.390022, -0.5399904, -1.935208, 1, 0.4784314, 0, 1,
-1.383797, -0.5668426, -0.7428752, 1, 0.4862745, 0, 1,
-1.382917, -0.3278801, -1.365137, 1, 0.4901961, 0, 1,
-1.379934, -1.349071, -3.999439, 1, 0.4980392, 0, 1,
-1.3784, 0.9282918, -0.6941608, 1, 0.5058824, 0, 1,
-1.376887, -0.1903147, -0.2745504, 1, 0.509804, 0, 1,
-1.368267, -0.4050844, -2.570486, 1, 0.5176471, 0, 1,
-1.363605, -0.2175618, -2.520225, 1, 0.5215687, 0, 1,
-1.360965, 0.6196262, 0.5085831, 1, 0.5294118, 0, 1,
-1.359552, -1.34623, -1.857841, 1, 0.5333334, 0, 1,
-1.348317, -0.9337246, -0.8299585, 1, 0.5411765, 0, 1,
-1.34155, 1.423934, -0.04625874, 1, 0.5450981, 0, 1,
-1.338385, -0.593228, -0.5329512, 1, 0.5529412, 0, 1,
-1.336922, 0.262329, -0.8699362, 1, 0.5568628, 0, 1,
-1.33635, 1.805663, -1.686701, 1, 0.5647059, 0, 1,
-1.330761, -0.6075919, -2.054797, 1, 0.5686275, 0, 1,
-1.330179, -0.9614854, -2.371635, 1, 0.5764706, 0, 1,
-1.32387, 1.325855, 0.05840087, 1, 0.5803922, 0, 1,
-1.315816, -1.969208, -1.789624, 1, 0.5882353, 0, 1,
-1.31151, -0.1799904, -3.196141, 1, 0.5921569, 0, 1,
-1.31005, 1.39529, -1.540946, 1, 0.6, 0, 1,
-1.307969, -0.06420565, -1.912703, 1, 0.6078432, 0, 1,
-1.301151, 0.8265719, -1.138764, 1, 0.6117647, 0, 1,
-1.297422, 0.02709178, -1.039347, 1, 0.6196079, 0, 1,
-1.277561, 0.5868875, -0.4650624, 1, 0.6235294, 0, 1,
-1.273592, 0.2466587, -0.1049337, 1, 0.6313726, 0, 1,
-1.265195, -0.9681759, -0.9634355, 1, 0.6352941, 0, 1,
-1.265126, -1.038629, -1.930533, 1, 0.6431373, 0, 1,
-1.25456, 0.5619838, -2.419307, 1, 0.6470588, 0, 1,
-1.252805, -0.2317289, -2.700338, 1, 0.654902, 0, 1,
-1.250478, 0.08695616, -0.9014553, 1, 0.6588235, 0, 1,
-1.241359, -0.2788132, -2.410821, 1, 0.6666667, 0, 1,
-1.241336, -1.01149, -3.000604, 1, 0.6705883, 0, 1,
-1.235335, 1.305809, -1.725796, 1, 0.6784314, 0, 1,
-1.235033, 0.05362722, -1.944846, 1, 0.682353, 0, 1,
-1.234127, -0.5357791, -2.004875, 1, 0.6901961, 0, 1,
-1.232685, -0.2226568, -2.186244, 1, 0.6941177, 0, 1,
-1.224945, 0.776197, 0.9227269, 1, 0.7019608, 0, 1,
-1.224577, -0.3551927, -2.630259, 1, 0.7098039, 0, 1,
-1.223148, -0.9906322, -0.9000744, 1, 0.7137255, 0, 1,
-1.220146, 2.789747, -0.8456894, 1, 0.7215686, 0, 1,
-1.219499, 0.3989029, -0.9834958, 1, 0.7254902, 0, 1,
-1.219422, -0.9493724, -2.678448, 1, 0.7333333, 0, 1,
-1.218741, 0.03558861, -2.222577, 1, 0.7372549, 0, 1,
-1.218673, 0.6137671, -1.140563, 1, 0.7450981, 0, 1,
-1.207083, -0.5386318, -2.001831, 1, 0.7490196, 0, 1,
-1.199564, -0.6743128, -0.7549389, 1, 0.7568628, 0, 1,
-1.190566, -0.5773668, -3.218779, 1, 0.7607843, 0, 1,
-1.189346, -0.8643407, -2.907954, 1, 0.7686275, 0, 1,
-1.181832, 0.9814293, -0.1141056, 1, 0.772549, 0, 1,
-1.179167, -0.2034634, -2.12525, 1, 0.7803922, 0, 1,
-1.175582, 0.651175, -0.5600293, 1, 0.7843137, 0, 1,
-1.171366, -1.469111, -2.159988, 1, 0.7921569, 0, 1,
-1.167732, 0.7218176, -0.2462736, 1, 0.7960784, 0, 1,
-1.166601, -0.693912, -0.4474587, 1, 0.8039216, 0, 1,
-1.166002, 0.06159534, -1.089672, 1, 0.8117647, 0, 1,
-1.157886, 1.686203, -1.28109, 1, 0.8156863, 0, 1,
-1.15712, -1.58014, -2.358577, 1, 0.8235294, 0, 1,
-1.156113, 1.565695, -1.143569, 1, 0.827451, 0, 1,
-1.152547, 2.029253, 0.3153489, 1, 0.8352941, 0, 1,
-1.144628, -1.71065, -1.710486, 1, 0.8392157, 0, 1,
-1.138927, 0.3682649, -1.980868, 1, 0.8470588, 0, 1,
-1.128922, 0.08246552, -0.3286054, 1, 0.8509804, 0, 1,
-1.128219, 0.8384817, 0.3872517, 1, 0.8588235, 0, 1,
-1.116415, 1.574973, -1.592316, 1, 0.8627451, 0, 1,
-1.116217, -2.167576, -4.358924, 1, 0.8705882, 0, 1,
-1.107968, -1.558844, -0.8720165, 1, 0.8745098, 0, 1,
-1.099581, -0.03495346, -3.029875, 1, 0.8823529, 0, 1,
-1.093457, 0.9007452, -1.04061, 1, 0.8862745, 0, 1,
-1.092799, 0.8068625, -0.1908201, 1, 0.8941177, 0, 1,
-1.089733, -0.7255396, -3.329786, 1, 0.8980392, 0, 1,
-1.065964, 1.570368, -0.406396, 1, 0.9058824, 0, 1,
-1.065292, 0.9564642, 0.001917498, 1, 0.9137255, 0, 1,
-1.062764, 0.9523111, -1.809629, 1, 0.9176471, 0, 1,
-1.053171, -1.195625, -1.682225, 1, 0.9254902, 0, 1,
-1.050829, -0.2764083, -0.0984031, 1, 0.9294118, 0, 1,
-1.044543, -2.175183, -2.677382, 1, 0.9372549, 0, 1,
-1.030346, -1.70069, -3.585898, 1, 0.9411765, 0, 1,
-1.023482, 0.1835092, -2.200258, 1, 0.9490196, 0, 1,
-1.018397, 1.143811, -0.645349, 1, 0.9529412, 0, 1,
-1.016231, -1.240722, -2.099203, 1, 0.9607843, 0, 1,
-1.015996, 0.133024, -1.523126, 1, 0.9647059, 0, 1,
-1.008784, -0.1114477, -2.807343, 1, 0.972549, 0, 1,
-1.008291, -1.353199, -3.28318, 1, 0.9764706, 0, 1,
-1.007517, -0.01867454, -1.236091, 1, 0.9843137, 0, 1,
-1.002773, -0.4336164, -1.00375, 1, 0.9882353, 0, 1,
-1.000262, -0.3593538, -0.805636, 1, 0.9960784, 0, 1,
-0.9966581, 0.4059422, -0.564518, 0.9960784, 1, 0, 1,
-0.9946736, 1.530694, -0.9041182, 0.9921569, 1, 0, 1,
-0.994278, -0.09160952, -2.487924, 0.9843137, 1, 0, 1,
-0.9864061, -0.1994739, -1.577797, 0.9803922, 1, 0, 1,
-0.9843349, -1.335041, -3.432828, 0.972549, 1, 0, 1,
-0.9798241, 0.01849087, -1.381419, 0.9686275, 1, 0, 1,
-0.9765956, 1.0481, -1.132885, 0.9607843, 1, 0, 1,
-0.9719194, 0.5719371, 1.057543, 0.9568627, 1, 0, 1,
-0.9658751, 0.8182081, -0.8478703, 0.9490196, 1, 0, 1,
-0.965188, 0.6019639, -1.90207, 0.945098, 1, 0, 1,
-0.9520252, 0.7741565, -1.409429, 0.9372549, 1, 0, 1,
-0.9453102, 0.5468132, -1.427746, 0.9333333, 1, 0, 1,
-0.93007, 1.257502, -1.300528, 0.9254902, 1, 0, 1,
-0.9270053, -0.1710267, -2.581333, 0.9215686, 1, 0, 1,
-0.9185203, 0.3943646, -0.9551741, 0.9137255, 1, 0, 1,
-0.9146898, -0.4085243, -1.537737, 0.9098039, 1, 0, 1,
-0.9060793, 1.699136, -0.1462942, 0.9019608, 1, 0, 1,
-0.9059522, -0.3667052, -2.444792, 0.8941177, 1, 0, 1,
-0.9053533, 0.3117096, -1.4924, 0.8901961, 1, 0, 1,
-0.9038027, -0.4828604, -1.227572, 0.8823529, 1, 0, 1,
-0.8991872, -0.7059341, -2.189767, 0.8784314, 1, 0, 1,
-0.8977162, 0.5282938, -0.5909697, 0.8705882, 1, 0, 1,
-0.8849618, -0.1899204, -1.196189, 0.8666667, 1, 0, 1,
-0.8815422, 0.1769387, -2.272876, 0.8588235, 1, 0, 1,
-0.8806131, -1.473766, -1.871249, 0.854902, 1, 0, 1,
-0.8777066, -0.7534847, -1.629256, 0.8470588, 1, 0, 1,
-0.8772956, -0.3045391, -2.826135, 0.8431373, 1, 0, 1,
-0.8756378, 0.122152, -2.046798, 0.8352941, 1, 0, 1,
-0.8721622, -1.272642, -4.009608, 0.8313726, 1, 0, 1,
-0.8653325, 0.3343855, -0.5910972, 0.8235294, 1, 0, 1,
-0.8624951, 0.5039862, -0.68335, 0.8196079, 1, 0, 1,
-0.8624375, -1.229076, -3.839983, 0.8117647, 1, 0, 1,
-0.856799, 1.825866, -2.188798, 0.8078431, 1, 0, 1,
-0.8487935, -0.03667148, -1.740824, 0.8, 1, 0, 1,
-0.8465979, 0.74817, -1.264404, 0.7921569, 1, 0, 1,
-0.841585, -1.220908, -2.460624, 0.7882353, 1, 0, 1,
-0.8366147, -0.4973141, -2.708927, 0.7803922, 1, 0, 1,
-0.8333736, -1.176801, -1.908307, 0.7764706, 1, 0, 1,
-0.8286271, 1.378112, 1.290724, 0.7686275, 1, 0, 1,
-0.8268901, -0.4650177, -2.565908, 0.7647059, 1, 0, 1,
-0.825457, 0.08810688, -0.08638969, 0.7568628, 1, 0, 1,
-0.8168638, -0.04708448, -1.452268, 0.7529412, 1, 0, 1,
-0.8163261, -0.1854069, -0.5546243, 0.7450981, 1, 0, 1,
-0.8099658, -0.4049207, -0.8699872, 0.7411765, 1, 0, 1,
-0.7988232, -0.02772857, -2.837581, 0.7333333, 1, 0, 1,
-0.7977173, 1.053977, -0.3413468, 0.7294118, 1, 0, 1,
-0.786678, -0.2553467, -1.67039, 0.7215686, 1, 0, 1,
-0.7828954, -0.818338, 0.5538073, 0.7176471, 1, 0, 1,
-0.7755272, 0.9689453, -1.371853, 0.7098039, 1, 0, 1,
-0.7746437, 0.1956367, -1.454311, 0.7058824, 1, 0, 1,
-0.7712161, 0.4972108, -0.92293, 0.6980392, 1, 0, 1,
-0.770108, 0.7525632, -1.203298, 0.6901961, 1, 0, 1,
-0.7700008, 0.494561, -1.688942, 0.6862745, 1, 0, 1,
-0.7676029, -1.746325, -2.567483, 0.6784314, 1, 0, 1,
-0.761582, 0.6532737, -0.7407343, 0.6745098, 1, 0, 1,
-0.7540871, 0.269811, -0.01395956, 0.6666667, 1, 0, 1,
-0.7461722, 0.3399951, -0.03961015, 0.6627451, 1, 0, 1,
-0.7456792, -1.260138, -3.38701, 0.654902, 1, 0, 1,
-0.7400323, 0.3464942, -0.9779314, 0.6509804, 1, 0, 1,
-0.7325964, 0.325526, -0.7125391, 0.6431373, 1, 0, 1,
-0.7322218, 0.3065659, -0.3856025, 0.6392157, 1, 0, 1,
-0.7281805, -0.6593669, -1.934616, 0.6313726, 1, 0, 1,
-0.7267156, -0.3692495, -4.059269, 0.627451, 1, 0, 1,
-0.7217236, -0.7716251, -3.661374, 0.6196079, 1, 0, 1,
-0.7178109, -1.019071, -3.886206, 0.6156863, 1, 0, 1,
-0.7069841, -0.8704544, -2.216902, 0.6078432, 1, 0, 1,
-0.7035417, 0.2052893, -1.07716, 0.6039216, 1, 0, 1,
-0.696813, 1.010231, 0.2894116, 0.5960785, 1, 0, 1,
-0.6938971, 1.19431, -0.7332417, 0.5882353, 1, 0, 1,
-0.6897993, 0.1586283, 0.1022799, 0.5843138, 1, 0, 1,
-0.6893767, -1.456952, -2.410542, 0.5764706, 1, 0, 1,
-0.6829137, 0.1222938, -0.1188735, 0.572549, 1, 0, 1,
-0.6798269, 1.535658, -1.326369, 0.5647059, 1, 0, 1,
-0.6752527, -1.074047, -0.5039124, 0.5607843, 1, 0, 1,
-0.6714925, -1.516076, -2.354569, 0.5529412, 1, 0, 1,
-0.6711249, 1.47561, -2.146073, 0.5490196, 1, 0, 1,
-0.6706593, 0.695216, 0.796456, 0.5411765, 1, 0, 1,
-0.6689832, -1.478504, -1.293559, 0.5372549, 1, 0, 1,
-0.6623799, -0.06306966, -1.660683, 0.5294118, 1, 0, 1,
-0.6592904, 0.5549027, -0.9060204, 0.5254902, 1, 0, 1,
-0.6591634, -0.3782554, -1.591913, 0.5176471, 1, 0, 1,
-0.6537687, 1.158203, -2.006706, 0.5137255, 1, 0, 1,
-0.6499655, -0.4264302, -2.10188, 0.5058824, 1, 0, 1,
-0.6480175, 1.745727, -0.1491765, 0.5019608, 1, 0, 1,
-0.6476007, 0.3812277, -1.26081, 0.4941176, 1, 0, 1,
-0.6474746, -1.481666, -3.23835, 0.4862745, 1, 0, 1,
-0.6387036, 0.3283213, -1.188895, 0.4823529, 1, 0, 1,
-0.6340522, -0.6399053, -3.538934, 0.4745098, 1, 0, 1,
-0.6296717, 1.135847, -0.06241906, 0.4705882, 1, 0, 1,
-0.6253612, 0.289879, -2.286588, 0.4627451, 1, 0, 1,
-0.6236666, 0.714003, 0.4243393, 0.4588235, 1, 0, 1,
-0.6236451, -1.728483, -2.282034, 0.4509804, 1, 0, 1,
-0.6231492, 0.3556873, -0.2139367, 0.4470588, 1, 0, 1,
-0.6130415, 0.005361108, -0.9295383, 0.4392157, 1, 0, 1,
-0.6068255, 0.1470541, -0.6111807, 0.4352941, 1, 0, 1,
-0.6039163, 1.437814, -0.3960536, 0.427451, 1, 0, 1,
-0.6029529, -0.06583147, -2.731141, 0.4235294, 1, 0, 1,
-0.6017801, -0.1403052, -2.326236, 0.4156863, 1, 0, 1,
-0.6017228, -0.3733913, -0.934583, 0.4117647, 1, 0, 1,
-0.6008151, 0.6536765, -1.340875, 0.4039216, 1, 0, 1,
-0.6007684, -0.8838273, -2.024443, 0.3960784, 1, 0, 1,
-0.6002842, 0.221366, -2.78085, 0.3921569, 1, 0, 1,
-0.6000524, 0.0645211, -0.4450192, 0.3843137, 1, 0, 1,
-0.5997905, -0.324062, -1.611744, 0.3803922, 1, 0, 1,
-0.5988735, -0.2466999, -2.63487, 0.372549, 1, 0, 1,
-0.5984389, 0.6436873, 0.4812891, 0.3686275, 1, 0, 1,
-0.5980944, 0.6673108, -2.125305, 0.3607843, 1, 0, 1,
-0.5976011, -0.519096, -2.485662, 0.3568628, 1, 0, 1,
-0.590638, 1.533008, -0.5465117, 0.3490196, 1, 0, 1,
-0.586784, 0.1456538, -1.236553, 0.345098, 1, 0, 1,
-0.5855716, -0.350643, -2.137112, 0.3372549, 1, 0, 1,
-0.5839304, 0.2415125, -1.165051, 0.3333333, 1, 0, 1,
-0.5802459, 0.8303745, -1.022948, 0.3254902, 1, 0, 1,
-0.5744071, -0.3084668, -0.5376201, 0.3215686, 1, 0, 1,
-0.5631108, -0.2417493, -1.188765, 0.3137255, 1, 0, 1,
-0.5534388, 0.401791, -1.804167, 0.3098039, 1, 0, 1,
-0.5490785, -1.609118, -3.19215, 0.3019608, 1, 0, 1,
-0.5477115, -0.3981372, -1.960875, 0.2941177, 1, 0, 1,
-0.5475059, 0.2633897, 0.962907, 0.2901961, 1, 0, 1,
-0.5456046, -0.04102226, -1.039276, 0.282353, 1, 0, 1,
-0.5446571, -0.3684389, -1.687326, 0.2784314, 1, 0, 1,
-0.5408444, -0.7253197, -2.870021, 0.2705882, 1, 0, 1,
-0.5401452, -0.4191557, -3.31991, 0.2666667, 1, 0, 1,
-0.536132, 2.293366, -0.5390413, 0.2588235, 1, 0, 1,
-0.5351253, 0.4547626, -0.6543232, 0.254902, 1, 0, 1,
-0.5290356, 0.8750473, 1.385857, 0.2470588, 1, 0, 1,
-0.5278152, -0.2047212, -2.48427, 0.2431373, 1, 0, 1,
-0.52778, -0.3289593, -2.008847, 0.2352941, 1, 0, 1,
-0.5253893, -1.111318, -3.533567, 0.2313726, 1, 0, 1,
-0.5252885, 1.518992, -0.1992541, 0.2235294, 1, 0, 1,
-0.5209908, -2.27101, -2.343715, 0.2196078, 1, 0, 1,
-0.5205585, -0.6102586, -4.48357, 0.2117647, 1, 0, 1,
-0.5132105, 1.924217, -0.02455245, 0.2078431, 1, 0, 1,
-0.5114876, -1.247124, -2.47327, 0.2, 1, 0, 1,
-0.5068111, -1.958403, -1.937606, 0.1921569, 1, 0, 1,
-0.5051894, -0.5584147, -1.867168, 0.1882353, 1, 0, 1,
-0.5004938, -1.804321, -3.404985, 0.1803922, 1, 0, 1,
-0.4937357, -1.004438, -2.450154, 0.1764706, 1, 0, 1,
-0.4922057, -1.550196, -4.453001, 0.1686275, 1, 0, 1,
-0.4857249, -0.1280892, -1.960927, 0.1647059, 1, 0, 1,
-0.4836654, 0.1211499, 0.08965296, 0.1568628, 1, 0, 1,
-0.482824, -0.04806092, -1.051111, 0.1529412, 1, 0, 1,
-0.4798018, 1.46531, -0.8926255, 0.145098, 1, 0, 1,
-0.4788196, 0.522631, -0.2911785, 0.1411765, 1, 0, 1,
-0.4766451, 2.292245, -0.5219887, 0.1333333, 1, 0, 1,
-0.475069, 0.4007333, -0.3841994, 0.1294118, 1, 0, 1,
-0.4735353, -0.1782044, -1.082687, 0.1215686, 1, 0, 1,
-0.4658184, -3.444071, -2.818452, 0.1176471, 1, 0, 1,
-0.4565769, -1.591085, -2.261416, 0.1098039, 1, 0, 1,
-0.4553984, -0.2364462, -1.923252, 0.1058824, 1, 0, 1,
-0.4494693, 1.864816, 0.1144288, 0.09803922, 1, 0, 1,
-0.4485106, -0.4119796, -3.374192, 0.09019608, 1, 0, 1,
-0.4484497, 2.068991, 0.318349, 0.08627451, 1, 0, 1,
-0.4435445, -0.2853059, -2.5201, 0.07843138, 1, 0, 1,
-0.4433519, 0.7285227, 0.279357, 0.07450981, 1, 0, 1,
-0.439026, -0.5630716, -2.370573, 0.06666667, 1, 0, 1,
-0.4385559, 1.016898, 0.1266382, 0.0627451, 1, 0, 1,
-0.435135, 2.418043, -1.443994, 0.05490196, 1, 0, 1,
-0.4344997, 0.5899681, 0.7609766, 0.05098039, 1, 0, 1,
-0.4320843, -0.09412497, -0.8943744, 0.04313726, 1, 0, 1,
-0.4320112, -0.5091391, -2.841345, 0.03921569, 1, 0, 1,
-0.4287894, 1.451263, 1.121603, 0.03137255, 1, 0, 1,
-0.4230734, -0.3180463, -3.33957, 0.02745098, 1, 0, 1,
-0.4194929, 0.3887378, -0.1679156, 0.01960784, 1, 0, 1,
-0.4180526, -0.6824438, -3.211031, 0.01568628, 1, 0, 1,
-0.4168148, 1.979797, 0.2675874, 0.007843138, 1, 0, 1,
-0.4100671, -1.01481, -2.790582, 0.003921569, 1, 0, 1,
-0.4084451, -1.839699, -2.656206, 0, 1, 0.003921569, 1,
-0.4080538, 0.3477472, -0.3027379, 0, 1, 0.01176471, 1,
-0.4066299, -1.312721, -3.378299, 0, 1, 0.01568628, 1,
-0.4060722, -1.378655, -1.878061, 0, 1, 0.02352941, 1,
-0.4016409, -0.972184, -4.869538, 0, 1, 0.02745098, 1,
-0.401404, 0.8691471, -0.03958911, 0, 1, 0.03529412, 1,
-0.400722, -0.9507282, 0.1165291, 0, 1, 0.03921569, 1,
-0.3991741, 0.3689935, -1.594977, 0, 1, 0.04705882, 1,
-0.3989893, 0.02894176, -0.896395, 0, 1, 0.05098039, 1,
-0.3909886, 0.2497262, -0.2932777, 0, 1, 0.05882353, 1,
-0.3872276, -0.4507001, -1.68598, 0, 1, 0.0627451, 1,
-0.3795274, 1.273826, 0.4877218, 0, 1, 0.07058824, 1,
-0.3772443, 1.453402, 0.4832891, 0, 1, 0.07450981, 1,
-0.3763376, -0.4124162, -1.892899, 0, 1, 0.08235294, 1,
-0.3744286, 1.739082, 0.9044985, 0, 1, 0.08627451, 1,
-0.3743252, 0.8134561, 0.009973845, 0, 1, 0.09411765, 1,
-0.3735686, 2.538221, 1.354617, 0, 1, 0.1019608, 1,
-0.3731867, 1.736263, -0.6242363, 0, 1, 0.1058824, 1,
-0.3722257, 0.8009631, -0.7200841, 0, 1, 0.1137255, 1,
-0.3686506, 0.5177173, -0.964417, 0, 1, 0.1176471, 1,
-0.3670593, 0.08821938, -0.7857023, 0, 1, 0.1254902, 1,
-0.3669565, -1.780436, -2.993089, 0, 1, 0.1294118, 1,
-0.3572884, 0.609837, 1.444098, 0, 1, 0.1372549, 1,
-0.3506582, 0.4136364, -0.3548869, 0, 1, 0.1411765, 1,
-0.3485726, 0.33356, -0.7945379, 0, 1, 0.1490196, 1,
-0.3482998, -1.506918, -2.061829, 0, 1, 0.1529412, 1,
-0.3451944, -0.7436491, -1.664759, 0, 1, 0.1607843, 1,
-0.3392056, 1.643189, 0.8856212, 0, 1, 0.1647059, 1,
-0.3386264, 3.093678, -0.3344232, 0, 1, 0.172549, 1,
-0.3364143, -0.5369937, -4.087056, 0, 1, 0.1764706, 1,
-0.3311195, -0.3142765, -3.139822, 0, 1, 0.1843137, 1,
-0.328458, -1.647334, -2.474959, 0, 1, 0.1882353, 1,
-0.3272903, 1.356333, 0.5958681, 0, 1, 0.1960784, 1,
-0.3254583, -1.167199, -3.221275, 0, 1, 0.2039216, 1,
-0.3167252, 0.2041185, -0.7950747, 0, 1, 0.2078431, 1,
-0.3164731, -1.588228, -2.461699, 0, 1, 0.2156863, 1,
-0.3157976, -0.05839461, -1.86044, 0, 1, 0.2196078, 1,
-0.3138316, -0.0102829, -1.360209, 0, 1, 0.227451, 1,
-0.3134906, -0.2588015, -2.031405, 0, 1, 0.2313726, 1,
-0.3102264, 1.159293, -0.5358712, 0, 1, 0.2392157, 1,
-0.3078847, 0.443861, -1.469827, 0, 1, 0.2431373, 1,
-0.3059928, -0.07332228, -1.087714, 0, 1, 0.2509804, 1,
-0.302351, 0.16712, -1.79924, 0, 1, 0.254902, 1,
-0.2983, -1.114304, -5.10986, 0, 1, 0.2627451, 1,
-0.2887516, -1.081747, -2.31099, 0, 1, 0.2666667, 1,
-0.2867558, 0.07901639, -2.060202, 0, 1, 0.2745098, 1,
-0.2814872, 1.138791, -1.065042, 0, 1, 0.2784314, 1,
-0.2807496, -0.8884658, -1.813548, 0, 1, 0.2862745, 1,
-0.2806726, -1.63757, -3.083554, 0, 1, 0.2901961, 1,
-0.2804377, 0.05771875, -1.365901, 0, 1, 0.2980392, 1,
-0.2747608, -0.2176323, -2.794585, 0, 1, 0.3058824, 1,
-0.2723176, 0.5309195, 0.9977253, 0, 1, 0.3098039, 1,
-0.268741, -0.8151482, -2.994396, 0, 1, 0.3176471, 1,
-0.2654658, -0.121096, -2.118434, 0, 1, 0.3215686, 1,
-0.262489, 1.308097, -0.3509025, 0, 1, 0.3294118, 1,
-0.2611209, -1.244989, -2.360227, 0, 1, 0.3333333, 1,
-0.2588734, 0.7519441, -0.8037513, 0, 1, 0.3411765, 1,
-0.2577379, 2.032231, 2.456745, 0, 1, 0.345098, 1,
-0.2539373, 0.6170175, -1.682887, 0, 1, 0.3529412, 1,
-0.2535778, 0.9550592, -0.8028055, 0, 1, 0.3568628, 1,
-0.2534463, 0.2164787, -0.4949076, 0, 1, 0.3647059, 1,
-0.2527085, -1.022069, -1.977361, 0, 1, 0.3686275, 1,
-0.2523993, -1.482105, -3.622737, 0, 1, 0.3764706, 1,
-0.251479, -0.8344751, -1.602403, 0, 1, 0.3803922, 1,
-0.2508206, 0.3386851, -0.9346998, 0, 1, 0.3882353, 1,
-0.2490839, 0.1521402, -1.310804, 0, 1, 0.3921569, 1,
-0.2469047, -0.6663143, -3.323531, 0, 1, 0.4, 1,
-0.2411358, -0.5482768, -2.853592, 0, 1, 0.4078431, 1,
-0.2402185, -0.04181175, -1.177846, 0, 1, 0.4117647, 1,
-0.2393171, 0.7190919, 0.7608654, 0, 1, 0.4196078, 1,
-0.2348343, 0.9463366, -0.0507898, 0, 1, 0.4235294, 1,
-0.2341062, 2.042972, 0.04836485, 0, 1, 0.4313726, 1,
-0.230625, -0.9261307, -3.307438, 0, 1, 0.4352941, 1,
-0.2235471, 0.6947607, -0.4911792, 0, 1, 0.4431373, 1,
-0.2213505, -0.1702677, -2.155795, 0, 1, 0.4470588, 1,
-0.2157828, -0.5951314, -4.715275, 0, 1, 0.454902, 1,
-0.2128433, 0.2835816, -2.277835, 0, 1, 0.4588235, 1,
-0.2064213, -0.7367953, -2.183361, 0, 1, 0.4666667, 1,
-0.2060091, 1.259473, 0.583147, 0, 1, 0.4705882, 1,
-0.2053356, 0.2449151, -0.03568596, 0, 1, 0.4784314, 1,
-0.2046982, -0.4208454, -0.9605736, 0, 1, 0.4823529, 1,
-0.2038024, 0.0555832, -1.0623, 0, 1, 0.4901961, 1,
-0.1972418, 0.686777, -0.3609824, 0, 1, 0.4941176, 1,
-0.1892493, 1.592352, -0.1719349, 0, 1, 0.5019608, 1,
-0.1840585, -1.064191, -1.282626, 0, 1, 0.509804, 1,
-0.1821831, 0.832167, -0.8734645, 0, 1, 0.5137255, 1,
-0.1781127, -0.7946946, -1.257865, 0, 1, 0.5215687, 1,
-0.1717804, -0.3625636, -0.9045954, 0, 1, 0.5254902, 1,
-0.1689489, -0.6076286, -4.772563, 0, 1, 0.5333334, 1,
-0.1605923, 0.3542165, -1.281083, 0, 1, 0.5372549, 1,
-0.1564475, -0.6722573, -1.624249, 0, 1, 0.5450981, 1,
-0.1552144, -0.05302918, -0.7139493, 0, 1, 0.5490196, 1,
-0.1544376, 2.304916, 1.222091, 0, 1, 0.5568628, 1,
-0.1535817, -0.1484894, -2.397483, 0, 1, 0.5607843, 1,
-0.1533082, 0.8209381, -0.6769026, 0, 1, 0.5686275, 1,
-0.1525788, 0.9574671, 0.1628251, 0, 1, 0.572549, 1,
-0.1496533, 0.004302256, -1.111172, 0, 1, 0.5803922, 1,
-0.1476316, -1.137181, -1.407941, 0, 1, 0.5843138, 1,
-0.1459849, -1.382743, -1.979102, 0, 1, 0.5921569, 1,
-0.1451337, -0.5991183, -2.736946, 0, 1, 0.5960785, 1,
-0.1415994, -1.591536, -2.250206, 0, 1, 0.6039216, 1,
-0.1405423, -1.345315, -2.432407, 0, 1, 0.6117647, 1,
-0.1384849, 0.1441209, -0.694796, 0, 1, 0.6156863, 1,
-0.1365606, -1.549251, -3.472711, 0, 1, 0.6235294, 1,
-0.1358168, 0.7617004, -0.594527, 0, 1, 0.627451, 1,
-0.1329506, 0.4466838, -1.635466, 0, 1, 0.6352941, 1,
-0.1322308, -1.946571, -2.302677, 0, 1, 0.6392157, 1,
-0.1309137, 1.038491, -1.318809, 0, 1, 0.6470588, 1,
-0.1238664, -0.06320541, -2.041158, 0, 1, 0.6509804, 1,
-0.1226276, 1.438709, 0.1053407, 0, 1, 0.6588235, 1,
-0.1219835, 0.6344246, -0.5718398, 0, 1, 0.6627451, 1,
-0.1208073, 0.2682255, -1.865281, 0, 1, 0.6705883, 1,
-0.1198704, 0.07432421, 0.7853741, 0, 1, 0.6745098, 1,
-0.1179975, -0.2045486, -3.029561, 0, 1, 0.682353, 1,
-0.1164349, 0.06212078, -2.176866, 0, 1, 0.6862745, 1,
-0.1144238, 0.1123605, -1.709301, 0, 1, 0.6941177, 1,
-0.113006, -0.1083076, -2.547632, 0, 1, 0.7019608, 1,
-0.110913, -1.423706, -3.986793, 0, 1, 0.7058824, 1,
-0.108503, 0.8628802, 0.2686747, 0, 1, 0.7137255, 1,
-0.1046595, 1.949782, -1.712642, 0, 1, 0.7176471, 1,
-0.1034688, 0.6250821, -1.140346, 0, 1, 0.7254902, 1,
-0.101873, -0.0296536, -3.442283, 0, 1, 0.7294118, 1,
-0.1003038, -0.8200151, -3.565325, 0, 1, 0.7372549, 1,
-0.09750594, 0.5885787, -1.958338, 0, 1, 0.7411765, 1,
-0.09728154, -1.139399, -2.000454, 0, 1, 0.7490196, 1,
-0.08993396, -1.5405, -3.111966, 0, 1, 0.7529412, 1,
-0.08974761, -1.757988, -2.245577, 0, 1, 0.7607843, 1,
-0.08861781, -0.5506893, -4.199646, 0, 1, 0.7647059, 1,
-0.08757568, 0.4307717, 0.26802, 0, 1, 0.772549, 1,
-0.08722579, 0.7243245, -0.7578071, 0, 1, 0.7764706, 1,
-0.08631074, 0.4576858, 0.1374916, 0, 1, 0.7843137, 1,
-0.07901691, -0.04311447, -1.928774, 0, 1, 0.7882353, 1,
-0.07813152, -0.2285547, -3.911446, 0, 1, 0.7960784, 1,
-0.0748726, 1.080613, 0.4023938, 0, 1, 0.8039216, 1,
-0.07353812, -0.286248, -3.123998, 0, 1, 0.8078431, 1,
-0.07242671, -0.2571113, -2.734274, 0, 1, 0.8156863, 1,
-0.07121627, -0.6374689, -1.820667, 0, 1, 0.8196079, 1,
-0.06728964, -0.3713908, -2.346179, 0, 1, 0.827451, 1,
-0.06459501, -0.4224065, -0.6192794, 0, 1, 0.8313726, 1,
-0.06073373, -1.635804, -3.301505, 0, 1, 0.8392157, 1,
-0.06043835, 0.08496251, -0.5623088, 0, 1, 0.8431373, 1,
-0.05973131, 1.206445, 1.56044, 0, 1, 0.8509804, 1,
-0.05702198, -1.168128, -1.8641, 0, 1, 0.854902, 1,
-0.05635765, 2.276131, 1.201025, 0, 1, 0.8627451, 1,
-0.05623951, 0.7660196, 0.3124261, 0, 1, 0.8666667, 1,
-0.05548167, -0.1291633, -3.098382, 0, 1, 0.8745098, 1,
-0.05365749, -1.085438, -3.174056, 0, 1, 0.8784314, 1,
-0.05275524, -0.3021582, -1.304585, 0, 1, 0.8862745, 1,
-0.05219162, -0.1214064, -1.619684, 0, 1, 0.8901961, 1,
-0.05207037, 1.373083, -0.07004198, 0, 1, 0.8980392, 1,
-0.05050906, -0.7590289, -1.604806, 0, 1, 0.9058824, 1,
-0.05020991, 0.2571284, -0.2610986, 0, 1, 0.9098039, 1,
-0.05005019, -1.884339, -3.452598, 0, 1, 0.9176471, 1,
-0.04869423, 1.594923, -0.1881509, 0, 1, 0.9215686, 1,
-0.04533164, -0.1558984, -3.585505, 0, 1, 0.9294118, 1,
-0.0440125, 0.4047148, 1.815241, 0, 1, 0.9333333, 1,
-0.04019395, -0.9527256, -1.604367, 0, 1, 0.9411765, 1,
-0.03805074, 1.454954, 0.7415768, 0, 1, 0.945098, 1,
-0.03766298, 0.9336236, 0.1613999, 0, 1, 0.9529412, 1,
-0.03097557, 0.868817, 0.8615112, 0, 1, 0.9568627, 1,
-0.03034558, 1.29311, -0.1172351, 0, 1, 0.9647059, 1,
-0.02923249, -1.103242, -4.037049, 0, 1, 0.9686275, 1,
-0.02266239, 0.2866916, 0.3383494, 0, 1, 0.9764706, 1,
-0.01941864, -0.08139492, -3.682532, 0, 1, 0.9803922, 1,
-0.01389917, -1.775406, -1.937532, 0, 1, 0.9882353, 1,
-0.0122077, 0.1650852, -0.6464344, 0, 1, 0.9921569, 1,
-0.01077017, -0.02135883, -0.6257274, 0, 1, 1, 1,
-0.009367224, -0.4092388, -1.160828, 0, 0.9921569, 1, 1,
-0.007984124, 0.6036345, 0.8456601, 0, 0.9882353, 1, 1,
-0.007286551, 0.05391349, 0.6472024, 0, 0.9803922, 1, 1,
-0.005290166, 0.6445957, 1.435327, 0, 0.9764706, 1, 1,
-0.005203174, 0.5624141, -0.8255052, 0, 0.9686275, 1, 1,
-0.003949966, -0.1846848, -1.90607, 0, 0.9647059, 1, 1,
-0.003159102, -0.3011784, -5.309732, 0, 0.9568627, 1, 1,
-0.002627551, 0.2218497, 1.039531, 0, 0.9529412, 1, 1,
-0.002615179, -0.9118034, -2.596986, 0, 0.945098, 1, 1,
-0.001387384, 1.802069, -0.369294, 0, 0.9411765, 1, 1,
0.0002525809, -2.084169, 2.255522, 0, 0.9333333, 1, 1,
0.001197843, 1.647874, -0.1205057, 0, 0.9294118, 1, 1,
0.002992343, -0.9583244, 5.400588, 0, 0.9215686, 1, 1,
0.00789548, 1.354943, 0.9422268, 0, 0.9176471, 1, 1,
0.008150565, -1.249626, 3.772557, 0, 0.9098039, 1, 1,
0.01215886, -0.873046, 3.033722, 0, 0.9058824, 1, 1,
0.01734464, -0.6430879, 2.897529, 0, 0.8980392, 1, 1,
0.01754438, -0.2944749, 2.819599, 0, 0.8901961, 1, 1,
0.01909736, -0.06366919, 2.584438, 0, 0.8862745, 1, 1,
0.01923573, -1.412272, 3.113028, 0, 0.8784314, 1, 1,
0.01959283, -0.1126473, 3.433232, 0, 0.8745098, 1, 1,
0.02574918, 1.37494, -0.2389181, 0, 0.8666667, 1, 1,
0.02591408, -1.346036, 1.2649, 0, 0.8627451, 1, 1,
0.02633005, 0.2010743, -1.706845, 0, 0.854902, 1, 1,
0.02636201, -1.291151, 2.792494, 0, 0.8509804, 1, 1,
0.02819771, 0.3922588, -1.770721, 0, 0.8431373, 1, 1,
0.03172527, 0.7963141, -1.433375, 0, 0.8392157, 1, 1,
0.03773371, -2.281842, 2.545974, 0, 0.8313726, 1, 1,
0.04132449, 0.1343774, 0.4546262, 0, 0.827451, 1, 1,
0.04228032, 0.2760214, -0.9869531, 0, 0.8196079, 1, 1,
0.04325358, 1.562159, 1.44817, 0, 0.8156863, 1, 1,
0.05110626, -0.1780985, 3.000344, 0, 0.8078431, 1, 1,
0.05133453, -0.6449405, 3.376546, 0, 0.8039216, 1, 1,
0.05184349, 0.476146, -0.0535419, 0, 0.7960784, 1, 1,
0.05951987, 0.2131912, 1.738215, 0, 0.7882353, 1, 1,
0.05988491, -1.023561, 2.439325, 0, 0.7843137, 1, 1,
0.06033986, 1.449452, 1.328222, 0, 0.7764706, 1, 1,
0.06603441, 0.7301085, -0.0295902, 0, 0.772549, 1, 1,
0.07226308, 1.340968, 0.6924124, 0, 0.7647059, 1, 1,
0.07676643, -0.3909538, 1.402569, 0, 0.7607843, 1, 1,
0.08386272, 1.208589, 2.029308, 0, 0.7529412, 1, 1,
0.08546727, -1.1937, 3.711324, 0, 0.7490196, 1, 1,
0.09367067, 1.390869, -0.3749218, 0, 0.7411765, 1, 1,
0.09389335, -0.816727, 2.758566, 0, 0.7372549, 1, 1,
0.0945109, -0.496952, 3.735519, 0, 0.7294118, 1, 1,
0.1006466, -0.7326283, 2.377769, 0, 0.7254902, 1, 1,
0.1030436, -1.080808, 3.084981, 0, 0.7176471, 1, 1,
0.1069881, 2.357131, -0.3162194, 0, 0.7137255, 1, 1,
0.1074627, 0.5499863, -0.05656619, 0, 0.7058824, 1, 1,
0.1249693, 0.4134371, -0.7224738, 0, 0.6980392, 1, 1,
0.1321956, 1.286374, 0.8145784, 0, 0.6941177, 1, 1,
0.1368266, 0.4853922, 0.1773534, 0, 0.6862745, 1, 1,
0.1383523, -0.04938327, 2.220591, 0, 0.682353, 1, 1,
0.1479604, 1.060036, 1.005759, 0, 0.6745098, 1, 1,
0.1558715, -0.02104287, 3.694062, 0, 0.6705883, 1, 1,
0.1716527, -1.049459, 3.852578, 0, 0.6627451, 1, 1,
0.1719689, 1.224028, 0.5383669, 0, 0.6588235, 1, 1,
0.1725951, -1.334559, 3.497314, 0, 0.6509804, 1, 1,
0.1745785, -1.482686, 2.117057, 0, 0.6470588, 1, 1,
0.1746604, 0.7082106, 0.06251207, 0, 0.6392157, 1, 1,
0.1761173, 0.5344187, 1.195173, 0, 0.6352941, 1, 1,
0.1766298, -0.7254948, 2.890769, 0, 0.627451, 1, 1,
0.1779926, 1.164904, 1.431142, 0, 0.6235294, 1, 1,
0.1803552, -0.5591705, 1.742499, 0, 0.6156863, 1, 1,
0.1811175, 1.10826, 0.7440545, 0, 0.6117647, 1, 1,
0.1848557, -0.660784, 3.752608, 0, 0.6039216, 1, 1,
0.1917983, -0.5116706, 2.454516, 0, 0.5960785, 1, 1,
0.1919964, 2.382316, -0.1997905, 0, 0.5921569, 1, 1,
0.1945172, -1.643837, 3.586423, 0, 0.5843138, 1, 1,
0.1956521, -1.102503, 3.616065, 0, 0.5803922, 1, 1,
0.197612, 1.069409, 1.016947, 0, 0.572549, 1, 1,
0.198288, -0.5700123, 4.077614, 0, 0.5686275, 1, 1,
0.2113007, -0.4650006, 3.386047, 0, 0.5607843, 1, 1,
0.2129533, 0.5279054, 0.5029219, 0, 0.5568628, 1, 1,
0.2139786, 0.4919727, 1.267055, 0, 0.5490196, 1, 1,
0.2164787, 1.417103, 1.553891, 0, 0.5450981, 1, 1,
0.2175484, 1.592132, 0.01975392, 0, 0.5372549, 1, 1,
0.2192836, 0.8109124, 1.04991, 0, 0.5333334, 1, 1,
0.2208545, 0.162485, -0.5692302, 0, 0.5254902, 1, 1,
0.2232667, -0.2305098, 2.607757, 0, 0.5215687, 1, 1,
0.2233101, 0.4529467, 0.6292037, 0, 0.5137255, 1, 1,
0.227215, 0.3240519, 0.6624492, 0, 0.509804, 1, 1,
0.2298553, -0.455267, 2.777549, 0, 0.5019608, 1, 1,
0.2300244, 1.002894, -0.7629801, 0, 0.4941176, 1, 1,
0.2339537, 0.08282678, 0.7949904, 0, 0.4901961, 1, 1,
0.2344519, -0.1479603, 4.418889, 0, 0.4823529, 1, 1,
0.2405776, 0.3855835, -0.4122947, 0, 0.4784314, 1, 1,
0.2412104, 1.383318, 0.6358538, 0, 0.4705882, 1, 1,
0.244715, -0.5468715, 2.795742, 0, 0.4666667, 1, 1,
0.2503842, -0.02456813, 0.2961025, 0, 0.4588235, 1, 1,
0.2531656, 0.3643304, 1.676973, 0, 0.454902, 1, 1,
0.2596367, -1.040871, 4.668191, 0, 0.4470588, 1, 1,
0.2630648, -0.01260715, 0.4540877, 0, 0.4431373, 1, 1,
0.2634489, -1.177159, 3.840002, 0, 0.4352941, 1, 1,
0.2669854, -0.2968774, 3.521823, 0, 0.4313726, 1, 1,
0.2704803, 0.5934506, -0.7776597, 0, 0.4235294, 1, 1,
0.2721803, -0.7187362, 3.667156, 0, 0.4196078, 1, 1,
0.2798443, -0.4390785, 2.806151, 0, 0.4117647, 1, 1,
0.2874567, -0.06521949, 3.611927, 0, 0.4078431, 1, 1,
0.2875221, -1.734259, 4.748905, 0, 0.4, 1, 1,
0.288662, 2.115087, 0.06415895, 0, 0.3921569, 1, 1,
0.3008389, 0.1063935, 1.8607, 0, 0.3882353, 1, 1,
0.3043575, -0.3476157, 3.352215, 0, 0.3803922, 1, 1,
0.3077371, 0.4885766, -0.2554167, 0, 0.3764706, 1, 1,
0.3084255, 0.9232264, -0.8910134, 0, 0.3686275, 1, 1,
0.31036, -0.3613134, 1.512435, 0, 0.3647059, 1, 1,
0.3127723, 0.8653212, 1.447272, 0, 0.3568628, 1, 1,
0.3163379, -0.8309125, 2.836231, 0, 0.3529412, 1, 1,
0.3186654, -0.8296238, 3.23165, 0, 0.345098, 1, 1,
0.319586, 0.8257571, 1.045881, 0, 0.3411765, 1, 1,
0.3261695, 0.5816649, -0.3825972, 0, 0.3333333, 1, 1,
0.3323819, 0.1331571, 2.158737, 0, 0.3294118, 1, 1,
0.3332493, 0.6314422, -0.4502198, 0, 0.3215686, 1, 1,
0.3344908, -0.2711692, 2.532875, 0, 0.3176471, 1, 1,
0.3406157, 0.4537563, 1.028249, 0, 0.3098039, 1, 1,
0.3422683, 0.3916101, -0.09647815, 0, 0.3058824, 1, 1,
0.3449399, 0.641371, -0.09119941, 0, 0.2980392, 1, 1,
0.3457958, 1.009689, 1.615419, 0, 0.2901961, 1, 1,
0.3492597, 0.2785514, 1.727792, 0, 0.2862745, 1, 1,
0.3520247, -0.007420788, 2.347147, 0, 0.2784314, 1, 1,
0.3530048, -0.8883557, 4.359385, 0, 0.2745098, 1, 1,
0.3569354, -1.199615, 2.949666, 0, 0.2666667, 1, 1,
0.361669, -0.2438899, 1.376238, 0, 0.2627451, 1, 1,
0.3629159, -0.02829297, 0.3398947, 0, 0.254902, 1, 1,
0.366124, -0.6913932, 2.088703, 0, 0.2509804, 1, 1,
0.3683133, 1.652791, 0.1134861, 0, 0.2431373, 1, 1,
0.3694041, 0.0834614, 2.247985, 0, 0.2392157, 1, 1,
0.3696513, 0.6318893, -0.9739661, 0, 0.2313726, 1, 1,
0.3696785, -1.342928, 1.396014, 0, 0.227451, 1, 1,
0.37386, 1.096408, 1.463895, 0, 0.2196078, 1, 1,
0.3750041, -0.2901805, 1.290781, 0, 0.2156863, 1, 1,
0.3756216, -0.2927089, 2.439871, 0, 0.2078431, 1, 1,
0.3766678, -0.4964973, 2.822242, 0, 0.2039216, 1, 1,
0.3781256, -0.2242683, 1.219923, 0, 0.1960784, 1, 1,
0.3793744, -0.6242328, 3.065295, 0, 0.1882353, 1, 1,
0.3818161, -0.08108892, 2.926035, 0, 0.1843137, 1, 1,
0.3856561, -0.483296, 1.619664, 0, 0.1764706, 1, 1,
0.3928528, -2.393821, 2.606358, 0, 0.172549, 1, 1,
0.3967858, -0.05158286, 0.8041613, 0, 0.1647059, 1, 1,
0.4050679, -1.622611, 2.274067, 0, 0.1607843, 1, 1,
0.4054798, 0.4847783, 0.6992252, 0, 0.1529412, 1, 1,
0.4071079, -0.1792158, 2.043179, 0, 0.1490196, 1, 1,
0.4128384, -1.085067, 4.68954, 0, 0.1411765, 1, 1,
0.4145744, 1.422801, -0.2629894, 0, 0.1372549, 1, 1,
0.4168953, 0.6522896, 0.2392775, 0, 0.1294118, 1, 1,
0.4210227, -1.089508, 2.740952, 0, 0.1254902, 1, 1,
0.4263581, -1.018513, 2.582943, 0, 0.1176471, 1, 1,
0.4282023, -0.7687988, 3.128707, 0, 0.1137255, 1, 1,
0.4287998, -2.253131, 2.63774, 0, 0.1058824, 1, 1,
0.4320187, 0.1858548, -0.1747271, 0, 0.09803922, 1, 1,
0.4333759, 0.4611068, 1.708172, 0, 0.09411765, 1, 1,
0.4351413, 0.4720382, 1.419318, 0, 0.08627451, 1, 1,
0.4406362, 0.01629856, 1.636685, 0, 0.08235294, 1, 1,
0.4460439, -0.103455, 3.120374, 0, 0.07450981, 1, 1,
0.4471024, -2.243974, 1.856003, 0, 0.07058824, 1, 1,
0.4481863, -0.784544, 0.7803195, 0, 0.0627451, 1, 1,
0.4516545, -0.3593225, 2.980584, 0, 0.05882353, 1, 1,
0.4554355, 0.3565609, -0.8237728, 0, 0.05098039, 1, 1,
0.4579405, -0.1821887, 3.542749, 0, 0.04705882, 1, 1,
0.462322, 1.358166, 0.1994719, 0, 0.03921569, 1, 1,
0.4657346, 0.5917339, 2.385142, 0, 0.03529412, 1, 1,
0.4672962, 0.7404826, 1.640959, 0, 0.02745098, 1, 1,
0.4683667, -0.4164131, 2.188632, 0, 0.02352941, 1, 1,
0.4754297, -0.5548637, 1.783144, 0, 0.01568628, 1, 1,
0.4764122, -0.4644327, 1.740763, 0, 0.01176471, 1, 1,
0.4765289, 0.4868843, 1.243261, 0, 0.003921569, 1, 1,
0.4776078, -0.6729656, -0.1012345, 0.003921569, 0, 1, 1,
0.4807769, -0.3176755, 1.90226, 0.007843138, 0, 1, 1,
0.4855717, 0.7375928, -0.3631729, 0.01568628, 0, 1, 1,
0.4872869, -2.528242, 2.942172, 0.01960784, 0, 1, 1,
0.488812, 1.162623, 0.7275301, 0.02745098, 0, 1, 1,
0.4940835, -0.6357337, 3.674576, 0.03137255, 0, 1, 1,
0.5026793, -0.658932, 2.938446, 0.03921569, 0, 1, 1,
0.503045, -2.131075, 3.555068, 0.04313726, 0, 1, 1,
0.5046067, -0.02050206, 1.220134, 0.05098039, 0, 1, 1,
0.5064251, 1.566341, 2.465634, 0.05490196, 0, 1, 1,
0.5081718, -0.7633472, 2.773487, 0.0627451, 0, 1, 1,
0.5097569, -0.5589833, 3.206896, 0.06666667, 0, 1, 1,
0.5100068, -0.1711661, 2.14449, 0.07450981, 0, 1, 1,
0.5126237, 0.2503421, -0.8209891, 0.07843138, 0, 1, 1,
0.5191228, 1.61681, 1.169209, 0.08627451, 0, 1, 1,
0.5204996, -0.6024156, 0.7613952, 0.09019608, 0, 1, 1,
0.5224351, -0.3792714, 1.86382, 0.09803922, 0, 1, 1,
0.5284919, -0.7156838, 2.665372, 0.1058824, 0, 1, 1,
0.5299941, -1.269947, 3.301014, 0.1098039, 0, 1, 1,
0.5302104, 0.8024859, 1.14671, 0.1176471, 0, 1, 1,
0.5338521, -0.7662326, 4.034915, 0.1215686, 0, 1, 1,
0.5350384, -1.344145, 4.758366, 0.1294118, 0, 1, 1,
0.5391065, -1.384207, 1.814095, 0.1333333, 0, 1, 1,
0.5413536, 1.642462, -0.704307, 0.1411765, 0, 1, 1,
0.5506958, 0.168549, 2.208756, 0.145098, 0, 1, 1,
0.5547612, 0.8627559, 0.966647, 0.1529412, 0, 1, 1,
0.5599486, -0.03689416, 2.771031, 0.1568628, 0, 1, 1,
0.564794, -0.762143, 2.917803, 0.1647059, 0, 1, 1,
0.5650464, 1.686561, 1.761783, 0.1686275, 0, 1, 1,
0.5675036, -0.1906258, 1.876699, 0.1764706, 0, 1, 1,
0.5683473, 0.1531718, 2.147095, 0.1803922, 0, 1, 1,
0.5724805, -0.5415993, 2.170089, 0.1882353, 0, 1, 1,
0.5801354, 0.04973601, 0.8012533, 0.1921569, 0, 1, 1,
0.5808122, -2.342917, 2.414324, 0.2, 0, 1, 1,
0.5813112, 0.2829232, 0.471433, 0.2078431, 0, 1, 1,
0.5851991, -1.285388, 2.150107, 0.2117647, 0, 1, 1,
0.5874981, 0.3751767, 2.831582, 0.2196078, 0, 1, 1,
0.5904347, -0.07037015, 1.214133, 0.2235294, 0, 1, 1,
0.5946583, -0.2856303, -0.1521273, 0.2313726, 0, 1, 1,
0.5959769, 0.5501097, 1.781639, 0.2352941, 0, 1, 1,
0.5965006, 0.6528345, -0.02672642, 0.2431373, 0, 1, 1,
0.6014615, 1.487573, 0.7358267, 0.2470588, 0, 1, 1,
0.6159045, -1.26017, 3.719215, 0.254902, 0, 1, 1,
0.6163137, 1.081257, -0.2269966, 0.2588235, 0, 1, 1,
0.6187664, 2.339896, 1.494011, 0.2666667, 0, 1, 1,
0.619992, -0.7589099, 1.21325, 0.2705882, 0, 1, 1,
0.6204799, 0.02625709, -0.2357385, 0.2784314, 0, 1, 1,
0.623385, 0.157855, 1.490398, 0.282353, 0, 1, 1,
0.625747, -0.5733703, 2.073483, 0.2901961, 0, 1, 1,
0.6265495, 0.1588238, 1.707903, 0.2941177, 0, 1, 1,
0.6291685, 0.8190729, 0.2447044, 0.3019608, 0, 1, 1,
0.6303635, -0.7016191, 2.20856, 0.3098039, 0, 1, 1,
0.6307104, 0.3089033, 1.93497, 0.3137255, 0, 1, 1,
0.6326866, -2.167462, 3.053707, 0.3215686, 0, 1, 1,
0.6335609, 0.8044276, 0.9962511, 0.3254902, 0, 1, 1,
0.6337907, -1.127774, 2.801191, 0.3333333, 0, 1, 1,
0.6410199, 0.7183723, -0.8188428, 0.3372549, 0, 1, 1,
0.6417458, 0.7424331, 0.7490159, 0.345098, 0, 1, 1,
0.6444265, -0.2697531, 1.300514, 0.3490196, 0, 1, 1,
0.6447511, -0.9379964, 3.04866, 0.3568628, 0, 1, 1,
0.644767, -1.078277, 1.772694, 0.3607843, 0, 1, 1,
0.6478823, -0.7118086, 4.152566, 0.3686275, 0, 1, 1,
0.6566594, -0.4521928, 3.087348, 0.372549, 0, 1, 1,
0.6572728, 1.14349, 2.230355, 0.3803922, 0, 1, 1,
0.661917, -0.8455456, 0.1252896, 0.3843137, 0, 1, 1,
0.6627896, -1.148503, 2.379494, 0.3921569, 0, 1, 1,
0.6651953, 1.572818, -0.3246618, 0.3960784, 0, 1, 1,
0.6655562, 0.8093444, 2.017553, 0.4039216, 0, 1, 1,
0.6659735, 0.182351, 0.94896, 0.4117647, 0, 1, 1,
0.6707443, 0.439969, -0.3416235, 0.4156863, 0, 1, 1,
0.6724855, 0.6715576, 1.485866, 0.4235294, 0, 1, 1,
0.6736715, -1.374034, 1.307665, 0.427451, 0, 1, 1,
0.6745499, 0.5642952, -0.01561995, 0.4352941, 0, 1, 1,
0.6751742, -2.198361, 4.676595, 0.4392157, 0, 1, 1,
0.6753948, 0.6790512, 1.599356, 0.4470588, 0, 1, 1,
0.6784806, -0.5034455, 2.216181, 0.4509804, 0, 1, 1,
0.6824737, 1.567623, 0.7223007, 0.4588235, 0, 1, 1,
0.6849514, -0.7295806, 2.352715, 0.4627451, 0, 1, 1,
0.6853989, 0.6933998, 2.194184, 0.4705882, 0, 1, 1,
0.6865655, -0.1502768, 1.521069, 0.4745098, 0, 1, 1,
0.688046, -1.498105, 2.414165, 0.4823529, 0, 1, 1,
0.693594, 0.6545658, 1.018818, 0.4862745, 0, 1, 1,
0.69491, -0.9305003, 0.4416944, 0.4941176, 0, 1, 1,
0.6991711, 0.424047, 1.332222, 0.5019608, 0, 1, 1,
0.7029076, -0.6250741, 1.247491, 0.5058824, 0, 1, 1,
0.7138593, 1.063316, 0.2524984, 0.5137255, 0, 1, 1,
0.714193, -0.03502839, 2.402158, 0.5176471, 0, 1, 1,
0.7168511, -0.7955502, 2.604729, 0.5254902, 0, 1, 1,
0.718481, -0.1964631, 1.223428, 0.5294118, 0, 1, 1,
0.7228327, -0.4317873, 3.15266, 0.5372549, 0, 1, 1,
0.7349514, 0.287953, 2.471289, 0.5411765, 0, 1, 1,
0.7350234, -0.7068599, 2.225974, 0.5490196, 0, 1, 1,
0.7361298, 1.257393, -0.6969837, 0.5529412, 0, 1, 1,
0.7388121, 1.521074, 1.020241, 0.5607843, 0, 1, 1,
0.750595, 0.4833983, 1.247776, 0.5647059, 0, 1, 1,
0.7543056, -2.050557, 4.501441, 0.572549, 0, 1, 1,
0.7555873, 2.544329, 2.68264, 0.5764706, 0, 1, 1,
0.7589918, 2.406781, 0.3063403, 0.5843138, 0, 1, 1,
0.7617738, -1.159023, 3.437236, 0.5882353, 0, 1, 1,
0.7651168, 1.356118, 1.482022, 0.5960785, 0, 1, 1,
0.7653102, -0.9995921, 3.66791, 0.6039216, 0, 1, 1,
0.7695283, 0.4051249, 0.1040434, 0.6078432, 0, 1, 1,
0.7708579, -0.7008407, 1.824559, 0.6156863, 0, 1, 1,
0.7741904, -1.024722, 3.385518, 0.6196079, 0, 1, 1,
0.7768494, 0.5236571, -1.022188, 0.627451, 0, 1, 1,
0.7825831, -0.9127066, 2.313569, 0.6313726, 0, 1, 1,
0.7848999, -2.478557, 1.750883, 0.6392157, 0, 1, 1,
0.7861491, 0.237078, 0.8718958, 0.6431373, 0, 1, 1,
0.7952712, 1.554114, 0.1435508, 0.6509804, 0, 1, 1,
0.7986427, 1.065028, 0.8922281, 0.654902, 0, 1, 1,
0.8028752, 0.7227454, 1.07746, 0.6627451, 0, 1, 1,
0.8040541, 1.54639, -0.1547989, 0.6666667, 0, 1, 1,
0.8054653, -0.3646315, 2.489997, 0.6745098, 0, 1, 1,
0.8136188, 0.01998821, 1.25262, 0.6784314, 0, 1, 1,
0.8141461, 1.117562, 0.8812901, 0.6862745, 0, 1, 1,
0.8183822, -1.287224, 1.858731, 0.6901961, 0, 1, 1,
0.823251, -0.3735547, 1.775881, 0.6980392, 0, 1, 1,
0.8232765, 0.6787744, -0.08614156, 0.7058824, 0, 1, 1,
0.827011, 1.473779, 0.05247166, 0.7098039, 0, 1, 1,
0.8313798, -0.06990685, 1.739257, 0.7176471, 0, 1, 1,
0.8316403, -1.514116, 2.223083, 0.7215686, 0, 1, 1,
0.83555, -1.0394, 1.265669, 0.7294118, 0, 1, 1,
0.8415703, 0.4398199, 1.002956, 0.7333333, 0, 1, 1,
0.8555381, -1.531336, 1.435884, 0.7411765, 0, 1, 1,
0.8589168, -1.229144, 3.257062, 0.7450981, 0, 1, 1,
0.8655571, -1.010494, 4.039267, 0.7529412, 0, 1, 1,
0.868022, -0.8196274, 2.918376, 0.7568628, 0, 1, 1,
0.8688139, 0.3236392, -0.1426429, 0.7647059, 0, 1, 1,
0.8691599, -0.1244685, 1.466349, 0.7686275, 0, 1, 1,
0.8717589, 1.611703, 2.099699, 0.7764706, 0, 1, 1,
0.8787668, -1.261842, 1.787441, 0.7803922, 0, 1, 1,
0.8815703, 0.796943, 0.03391118, 0.7882353, 0, 1, 1,
0.8846005, -0.7993543, 2.387017, 0.7921569, 0, 1, 1,
0.886615, 2.277409, 1.526438, 0.8, 0, 1, 1,
0.8972314, -0.5011559, 2.433525, 0.8078431, 0, 1, 1,
0.8988168, 1.173657, 1.087916, 0.8117647, 0, 1, 1,
0.9034284, -0.3637646, 0.9357174, 0.8196079, 0, 1, 1,
0.9035825, 0.6410543, 1.463578, 0.8235294, 0, 1, 1,
0.9042828, 0.733067, -0.4802858, 0.8313726, 0, 1, 1,
0.9046338, 0.4810362, 1.404038, 0.8352941, 0, 1, 1,
0.9096033, -0.9385042, 1.897617, 0.8431373, 0, 1, 1,
0.913107, 0.4355287, 0.8466371, 0.8470588, 0, 1, 1,
0.9140567, -0.5406859, 0.0895142, 0.854902, 0, 1, 1,
0.9173093, 2.448789, 0.3417728, 0.8588235, 0, 1, 1,
0.9179043, 0.05062698, -0.2282338, 0.8666667, 0, 1, 1,
0.9203626, 0.248568, 0.7147291, 0.8705882, 0, 1, 1,
0.9242876, -2.209451, 2.74129, 0.8784314, 0, 1, 1,
0.9258625, 1.786652, 2.04094, 0.8823529, 0, 1, 1,
0.9283553, -0.1259314, 0.9043784, 0.8901961, 0, 1, 1,
0.9287364, 0.3840649, 0.7577121, 0.8941177, 0, 1, 1,
0.9330115, -0.4135828, 2.626633, 0.9019608, 0, 1, 1,
0.9331924, 1.74669, -0.05963305, 0.9098039, 0, 1, 1,
0.9335853, 0.1657765, 0.9530683, 0.9137255, 0, 1, 1,
0.9351936, 0.6189472, 2.293079, 0.9215686, 0, 1, 1,
0.9371737, -0.3003323, 2.612424, 0.9254902, 0, 1, 1,
0.9418266, 0.8815804, 1.065644, 0.9333333, 0, 1, 1,
0.9453141, -0.03372128, 0.530435, 0.9372549, 0, 1, 1,
0.9454328, -1.620305, 3.906792, 0.945098, 0, 1, 1,
0.9484179, 1.741634, -0.6802545, 0.9490196, 0, 1, 1,
0.9610796, 2.334051, -0.00548766, 0.9568627, 0, 1, 1,
0.9622124, 1.103528, 0.1408388, 0.9607843, 0, 1, 1,
0.9657161, -0.6907879, 0.6916141, 0.9686275, 0, 1, 1,
0.9678324, -2.568417, 2.189319, 0.972549, 0, 1, 1,
0.9754247, -1.761685, 2.645412, 0.9803922, 0, 1, 1,
0.9772817, 0.4923583, 0.04561771, 0.9843137, 0, 1, 1,
0.9791499, -0.4379582, 2.354721, 0.9921569, 0, 1, 1,
0.9907916, -2.088106, 2.240358, 0.9960784, 0, 1, 1,
1.000513, -0.942918, 2.637791, 1, 0, 0.9960784, 1,
1.00163, -1.439031, 2.99784, 1, 0, 0.9882353, 1,
1.003624, 0.5680918, 0.4680691, 1, 0, 0.9843137, 1,
1.004311, -0.1902277, 1.387894, 1, 0, 0.9764706, 1,
1.004745, -0.5606273, 2.284388, 1, 0, 0.972549, 1,
1.008963, -1.649275, 1.167924, 1, 0, 0.9647059, 1,
1.012328, -1.261615, 4.282403, 1, 0, 0.9607843, 1,
1.020887, -1.275807, 2.588538, 1, 0, 0.9529412, 1,
1.030508, 0.7506061, 0.6796098, 1, 0, 0.9490196, 1,
1.030755, 0.7968457, 1.432394, 1, 0, 0.9411765, 1,
1.032617, -0.3524026, 1.334848, 1, 0, 0.9372549, 1,
1.037932, -0.9424136, 1.421634, 1, 0, 0.9294118, 1,
1.047978, 0.4641759, -0.7737234, 1, 0, 0.9254902, 1,
1.05229, 0.7618343, 0.5199618, 1, 0, 0.9176471, 1,
1.052539, -0.8454858, 2.657833, 1, 0, 0.9137255, 1,
1.055839, 1.116401, 0.6656054, 1, 0, 0.9058824, 1,
1.057451, 1.286119, 0.7054785, 1, 0, 0.9019608, 1,
1.061117, 0.4972302, 0.5332808, 1, 0, 0.8941177, 1,
1.06204, 1.399052, 1.23739, 1, 0, 0.8862745, 1,
1.066206, 1.277227, -1.60777, 1, 0, 0.8823529, 1,
1.069427, -0.6542816, 1.648413, 1, 0, 0.8745098, 1,
1.070258, 1.326862, 1.396457, 1, 0, 0.8705882, 1,
1.074546, -0.1377836, 1.64797, 1, 0, 0.8627451, 1,
1.074682, 0.005134406, 1.3999, 1, 0, 0.8588235, 1,
1.086667, 0.2307308, 2.553869, 1, 0, 0.8509804, 1,
1.088131, 0.6747332, 1.287494, 1, 0, 0.8470588, 1,
1.09431, -1.481612, 2.917086, 1, 0, 0.8392157, 1,
1.097577, 0.459214, 2.158518, 1, 0, 0.8352941, 1,
1.099176, 0.1916539, 1.498241, 1, 0, 0.827451, 1,
1.100297, -1.566773, 2.884712, 1, 0, 0.8235294, 1,
1.103867, -0.7368228, 1.554554, 1, 0, 0.8156863, 1,
1.10448, -0.5092137, 2.823237, 1, 0, 0.8117647, 1,
1.107827, 1.169913, 0.8088702, 1, 0, 0.8039216, 1,
1.10872, 0.1856611, 3.674029, 1, 0, 0.7960784, 1,
1.108868, 1.184288, -0.07244662, 1, 0, 0.7921569, 1,
1.109225, -2.082225, 2.812979, 1, 0, 0.7843137, 1,
1.114585, 0.2841267, 2.733052, 1, 0, 0.7803922, 1,
1.117156, -0.8114887, 2.543681, 1, 0, 0.772549, 1,
1.117307, -0.8734431, 1.426232, 1, 0, 0.7686275, 1,
1.120084, 0.3004539, 1.516347, 1, 0, 0.7607843, 1,
1.134299, 0.1786215, 1.037379, 1, 0, 0.7568628, 1,
1.135937, -2.604082, 2.435604, 1, 0, 0.7490196, 1,
1.140628, -0.6651467, 1.604623, 1, 0, 0.7450981, 1,
1.145696, -0.3469671, 0.6360658, 1, 0, 0.7372549, 1,
1.147625, 0.1736724, 3.686565, 1, 0, 0.7333333, 1,
1.148919, 1.483374, 1.192101, 1, 0, 0.7254902, 1,
1.159024, -2.265078, 2.861165, 1, 0, 0.7215686, 1,
1.159918, -0.1301905, 2.106078, 1, 0, 0.7137255, 1,
1.164718, -0.574592, 1.243885, 1, 0, 0.7098039, 1,
1.16544, 0.0759586, 3.630379, 1, 0, 0.7019608, 1,
1.165457, 0.9436461, -0.5464147, 1, 0, 0.6941177, 1,
1.189342, 0.2793155, 3.227974, 1, 0, 0.6901961, 1,
1.194957, -0.1828467, 0.1767514, 1, 0, 0.682353, 1,
1.201384, -0.8846714, 2.208257, 1, 0, 0.6784314, 1,
1.205183, -0.6435351, 2.205357, 1, 0, 0.6705883, 1,
1.208531, 0.4594657, 0.8332746, 1, 0, 0.6666667, 1,
1.209463, 0.06730952, 0.006715882, 1, 0, 0.6588235, 1,
1.210292, -1.430295, 3.318632, 1, 0, 0.654902, 1,
1.215569, -0.2923102, 0.2581714, 1, 0, 0.6470588, 1,
1.221167, 0.516906, 1.971312, 1, 0, 0.6431373, 1,
1.223439, -0.191283, 1.330843, 1, 0, 0.6352941, 1,
1.22686, 0.01242089, -0.2701697, 1, 0, 0.6313726, 1,
1.227286, -0.1008155, 1.97922, 1, 0, 0.6235294, 1,
1.228998, -0.5758538, 2.425114, 1, 0, 0.6196079, 1,
1.23034, 0.5996749, 0.9952777, 1, 0, 0.6117647, 1,
1.243057, -0.01180986, 2.142976, 1, 0, 0.6078432, 1,
1.243546, -1.228189, 2.07319, 1, 0, 0.6, 1,
1.244691, 0.1375523, 3.503469, 1, 0, 0.5921569, 1,
1.247653, 0.01086978, 1.020578, 1, 0, 0.5882353, 1,
1.247755, 0.1236761, 0.7305582, 1, 0, 0.5803922, 1,
1.256307, -0.02032181, 2.260544, 1, 0, 0.5764706, 1,
1.256518, 0.4215826, -0.7103291, 1, 0, 0.5686275, 1,
1.260445, -0.6033825, 0.6724656, 1, 0, 0.5647059, 1,
1.263388, 1.339345, 0.1103677, 1, 0, 0.5568628, 1,
1.265581, -0.8056072, 1.694471, 1, 0, 0.5529412, 1,
1.273656, 1.6556, -0.663643, 1, 0, 0.5450981, 1,
1.279648, 0.6929483, 1.433636, 1, 0, 0.5411765, 1,
1.291797, -1.948488, 2.227146, 1, 0, 0.5333334, 1,
1.29348, 1.164461, 0.559607, 1, 0, 0.5294118, 1,
1.296533, 0.5457913, -0.2815756, 1, 0, 0.5215687, 1,
1.298215, -1.240781, 3.674068, 1, 0, 0.5176471, 1,
1.313115, -1.285031, 3.347104, 1, 0, 0.509804, 1,
1.315528, 1.675813, -1.542453, 1, 0, 0.5058824, 1,
1.318144, -0.4309775, 0.972805, 1, 0, 0.4980392, 1,
1.334149, -0.4187969, 1.235954, 1, 0, 0.4901961, 1,
1.341962, -0.03679032, 2.006117, 1, 0, 0.4862745, 1,
1.344176, -0.9880916, 1.369663, 1, 0, 0.4784314, 1,
1.34527, 1.290153, 2.190338, 1, 0, 0.4745098, 1,
1.349774, 0.2120864, 1.492914, 1, 0, 0.4666667, 1,
1.356557, -0.2790786, 3.301519, 1, 0, 0.4627451, 1,
1.358465, 0.750437, 1.648197, 1, 0, 0.454902, 1,
1.360298, -0.8923549, 2.531339, 1, 0, 0.4509804, 1,
1.378886, -0.5230362, 2.782187, 1, 0, 0.4431373, 1,
1.379593, -0.5625591, 3.068191, 1, 0, 0.4392157, 1,
1.38492, -0.05595974, 1.352669, 1, 0, 0.4313726, 1,
1.393025, 0.1534541, 1.258551, 1, 0, 0.427451, 1,
1.395322, -0.5350758, 2.543593, 1, 0, 0.4196078, 1,
1.395606, -1.361138, 3.666452, 1, 0, 0.4156863, 1,
1.398785, -0.3907874, 2.058599, 1, 0, 0.4078431, 1,
1.404137, 2.511889, 0.5136223, 1, 0, 0.4039216, 1,
1.421658, 0.8645752, 1.253489, 1, 0, 0.3960784, 1,
1.422251, 1.206177, 2.279869, 1, 0, 0.3882353, 1,
1.43447, -0.2106932, 2.617418, 1, 0, 0.3843137, 1,
1.449463, -1.970024, 4.565478, 1, 0, 0.3764706, 1,
1.464741, -0.186575, 1.47183, 1, 0, 0.372549, 1,
1.465177, -1.018467, 1.337756, 1, 0, 0.3647059, 1,
1.46849, -0.1293932, 2.414689, 1, 0, 0.3607843, 1,
1.475918, 1.004823, -0.1786084, 1, 0, 0.3529412, 1,
1.477012, -2.074457, 4.959471, 1, 0, 0.3490196, 1,
1.477541, 0.5541813, 0.2135514, 1, 0, 0.3411765, 1,
1.495751, 1.626568, 3.245298, 1, 0, 0.3372549, 1,
1.506238, 1.015254, 2.952165, 1, 0, 0.3294118, 1,
1.515637, -0.3161153, 0.3343, 1, 0, 0.3254902, 1,
1.535688, 0.4717488, 0.3161401, 1, 0, 0.3176471, 1,
1.537141, -0.9011606, 0.2521271, 1, 0, 0.3137255, 1,
1.551209, 0.1320337, 1.083086, 1, 0, 0.3058824, 1,
1.556705, 0.5649915, 1.643293, 1, 0, 0.2980392, 1,
1.560169, 0.3073866, 2.396493, 1, 0, 0.2941177, 1,
1.560661, -0.5827283, 1.374965, 1, 0, 0.2862745, 1,
1.561906, 0.2922378, 1.068654, 1, 0, 0.282353, 1,
1.571, -0.7880211, 1.307975, 1, 0, 0.2745098, 1,
1.574358, 0.2747624, 2.041383, 1, 0, 0.2705882, 1,
1.580417, -1.919475, 2.327403, 1, 0, 0.2627451, 1,
1.611493, 0.26412, 0.9637454, 1, 0, 0.2588235, 1,
1.616339, -1.388673, 1.272848, 1, 0, 0.2509804, 1,
1.618135, -1.334045, 1.998689, 1, 0, 0.2470588, 1,
1.618666, 1.027872, 1.868831, 1, 0, 0.2392157, 1,
1.618868, 2.268714, 0.007634875, 1, 0, 0.2352941, 1,
1.620782, -0.8059598, 1.214377, 1, 0, 0.227451, 1,
1.648343, 1.818002, -0.05882818, 1, 0, 0.2235294, 1,
1.663675, 0.2888405, 1.330904, 1, 0, 0.2156863, 1,
1.679501, -0.5213655, 3.937461, 1, 0, 0.2117647, 1,
1.692722, -0.7802922, 3.259461, 1, 0, 0.2039216, 1,
1.727647, -0.8820589, 1.826196, 1, 0, 0.1960784, 1,
1.732988, 1.220609, 1.60874, 1, 0, 0.1921569, 1,
1.768072, 0.887323, 0.9642292, 1, 0, 0.1843137, 1,
1.776195, 0.2710037, -0.1726623, 1, 0, 0.1803922, 1,
1.817616, -0.5229059, 1.427145, 1, 0, 0.172549, 1,
1.846883, -0.6777896, 1.61809, 1, 0, 0.1686275, 1,
1.87101, -0.4435128, 1.302306, 1, 0, 0.1607843, 1,
1.920905, -0.8311337, 2.67499, 1, 0, 0.1568628, 1,
1.925662, -1.020187, 4.366693, 1, 0, 0.1490196, 1,
1.942964, -0.1182347, 0.9050011, 1, 0, 0.145098, 1,
1.943053, 0.05008487, 1.255758, 1, 0, 0.1372549, 1,
1.946691, 0.9422007, 0.6385124, 1, 0, 0.1333333, 1,
1.987921, -2.793759, 1.341301, 1, 0, 0.1254902, 1,
1.988734, -0.1062838, 0.4851141, 1, 0, 0.1215686, 1,
2.01983, -0.02722849, 0.09583083, 1, 0, 0.1137255, 1,
2.042279, 0.9392077, 0.3716672, 1, 0, 0.1098039, 1,
2.042295, -0.3227785, 0.1860579, 1, 0, 0.1019608, 1,
2.139108, 0.04052117, 0.5599191, 1, 0, 0.09411765, 1,
2.14754, 0.464989, 1.822958, 1, 0, 0.09019608, 1,
2.152919, -1.000564, 1.603621, 1, 0, 0.08235294, 1,
2.180253, -0.8681502, 1.169179, 1, 0, 0.07843138, 1,
2.180603, -0.130702, 2.520236, 1, 0, 0.07058824, 1,
2.279822, 0.5092638, 1.506776, 1, 0, 0.06666667, 1,
2.292758, -1.811141, 0.3368661, 1, 0, 0.05882353, 1,
2.355199, 0.4233823, 1.290616, 1, 0, 0.05490196, 1,
2.356445, -0.1608883, 1.281186, 1, 0, 0.04705882, 1,
2.369251, 1.466684, -0.1425524, 1, 0, 0.04313726, 1,
2.377521, 0.1509017, 1.420796, 1, 0, 0.03529412, 1,
2.680171, 1.343562, 2.480949, 1, 0, 0.03137255, 1,
2.680172, -1.615018, 2.845387, 1, 0, 0.02352941, 1,
2.722703, 2.09062, 0.9306237, 1, 0, 0.01960784, 1,
2.830849, -0.342663, 1.424932, 1, 0, 0.01176471, 1,
3.399305, 0.722819, 2.581073, 1, 0, 0.007843138, 1
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
0.07797933, -4.552219, -7.125132, 0, -0.5, 0.5, 0.5,
0.07797933, -4.552219, -7.125132, 1, -0.5, 0.5, 0.5,
0.07797933, -4.552219, -7.125132, 1, 1.5, 0.5, 0.5,
0.07797933, -4.552219, -7.125132, 0, 1.5, 0.5, 0.5
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
-4.369275, -0.1751965, -7.125132, 0, -0.5, 0.5, 0.5,
-4.369275, -0.1751965, -7.125132, 1, -0.5, 0.5, 0.5,
-4.369275, -0.1751965, -7.125132, 1, 1.5, 0.5, 0.5,
-4.369275, -0.1751965, -7.125132, 0, 1.5, 0.5, 0.5
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
-4.369275, -4.552219, 0.04542756, 0, -0.5, 0.5, 0.5,
-4.369275, -4.552219, 0.04542756, 1, -0.5, 0.5, 0.5,
-4.369275, -4.552219, 0.04542756, 1, 1.5, 0.5, 0.5,
-4.369275, -4.552219, 0.04542756, 0, 1.5, 0.5, 0.5
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
-3, -3.542137, -5.470387,
3, -3.542137, -5.470387,
-3, -3.542137, -5.470387,
-3, -3.710484, -5.746178,
-2, -3.542137, -5.470387,
-2, -3.710484, -5.746178,
-1, -3.542137, -5.470387,
-1, -3.710484, -5.746178,
0, -3.542137, -5.470387,
0, -3.710484, -5.746178,
1, -3.542137, -5.470387,
1, -3.710484, -5.746178,
2, -3.542137, -5.470387,
2, -3.710484, -5.746178,
3, -3.542137, -5.470387,
3, -3.710484, -5.746178
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
-3, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
-3, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
-3, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
-3, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
-2, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
-2, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
-2, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
-2, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
-1, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
-1, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
-1, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
-1, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
0, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
0, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
0, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
0, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
1, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
1, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
1, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
1, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
2, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
2, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
2, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
2, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5,
3, -4.047178, -6.29776, 0, -0.5, 0.5, 0.5,
3, -4.047178, -6.29776, 1, -0.5, 0.5, 0.5,
3, -4.047178, -6.29776, 1, 1.5, 0.5, 0.5,
3, -4.047178, -6.29776, 0, 1.5, 0.5, 0.5
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
-3.342986, -3, -5.470387,
-3.342986, 3, -5.470387,
-3.342986, -3, -5.470387,
-3.514034, -3, -5.746178,
-3.342986, -2, -5.470387,
-3.514034, -2, -5.746178,
-3.342986, -1, -5.470387,
-3.514034, -1, -5.746178,
-3.342986, 0, -5.470387,
-3.514034, 0, -5.746178,
-3.342986, 1, -5.470387,
-3.514034, 1, -5.746178,
-3.342986, 2, -5.470387,
-3.514034, 2, -5.746178,
-3.342986, 3, -5.470387,
-3.514034, 3, -5.746178
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
-3.856131, -3, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, -3, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, -3, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, -3, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, -2, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, -2, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, -2, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, -2, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, -1, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, -1, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, -1, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, -1, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, 0, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, 0, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, 0, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, 0, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, 1, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, 1, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, 1, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, 1, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, 2, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, 2, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, 2, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, 2, -6.29776, 0, 1.5, 0.5, 0.5,
-3.856131, 3, -6.29776, 0, -0.5, 0.5, 0.5,
-3.856131, 3, -6.29776, 1, -0.5, 0.5, 0.5,
-3.856131, 3, -6.29776, 1, 1.5, 0.5, 0.5,
-3.856131, 3, -6.29776, 0, 1.5, 0.5, 0.5
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
-3.342986, -3.542137, -4,
-3.342986, -3.542137, 4,
-3.342986, -3.542137, -4,
-3.514034, -3.710484, -4,
-3.342986, -3.542137, -2,
-3.514034, -3.710484, -2,
-3.342986, -3.542137, 0,
-3.514034, -3.710484, 0,
-3.342986, -3.542137, 2,
-3.514034, -3.710484, 2,
-3.342986, -3.542137, 4,
-3.514034, -3.710484, 4
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
-3.856131, -4.047178, -4, 0, -0.5, 0.5, 0.5,
-3.856131, -4.047178, -4, 1, -0.5, 0.5, 0.5,
-3.856131, -4.047178, -4, 1, 1.5, 0.5, 0.5,
-3.856131, -4.047178, -4, 0, 1.5, 0.5, 0.5,
-3.856131, -4.047178, -2, 0, -0.5, 0.5, 0.5,
-3.856131, -4.047178, -2, 1, -0.5, 0.5, 0.5,
-3.856131, -4.047178, -2, 1, 1.5, 0.5, 0.5,
-3.856131, -4.047178, -2, 0, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 0, 0, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 0, 1, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 0, 1, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 0, 0, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 2, 0, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 2, 1, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 2, 1, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 2, 0, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 4, 0, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 4, 1, -0.5, 0.5, 0.5,
-3.856131, -4.047178, 4, 1, 1.5, 0.5, 0.5,
-3.856131, -4.047178, 4, 0, 1.5, 0.5, 0.5
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
-3.342986, -3.542137, -5.470387,
-3.342986, 3.191744, -5.470387,
-3.342986, -3.542137, 5.561243,
-3.342986, 3.191744, 5.561243,
-3.342986, -3.542137, -5.470387,
-3.342986, -3.542137, 5.561243,
-3.342986, 3.191744, -5.470387,
-3.342986, 3.191744, 5.561243,
-3.342986, -3.542137, -5.470387,
3.498944, -3.542137, -5.470387,
-3.342986, -3.542137, 5.561243,
3.498944, -3.542137, 5.561243,
-3.342986, 3.191744, -5.470387,
3.498944, 3.191744, -5.470387,
-3.342986, 3.191744, 5.561243,
3.498944, 3.191744, 5.561243,
3.498944, -3.542137, -5.470387,
3.498944, 3.191744, -5.470387,
3.498944, -3.542137, 5.561243,
3.498944, 3.191744, 5.561243,
3.498944, -3.542137, -5.470387,
3.498944, -3.542137, 5.561243,
3.498944, 3.191744, -5.470387,
3.498944, 3.191744, 5.561243
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
var radius = 7.808798;
var distance = 34.74222;
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
mvMatrix.translate( -0.07797933, 0.1751965, -0.04542756 );
mvMatrix.scale( 1.234012, 1.253813, 0.7653471 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74222);
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
Trimethylsulfonium<-read.table("Trimethylsulfonium.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Trimethylsulfonium$V2
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
```

```r
y<-Trimethylsulfonium$V3
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
```

```r
z<-Trimethylsulfonium$V4
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
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
-3.243346, 0.8165028, -1.897762, 0, 0, 1, 1, 1,
-2.782283, 0.4555277, -2.259286, 1, 0, 0, 1, 1,
-2.682319, 0.05204212, -2.159834, 1, 0, 0, 1, 1,
-2.300748, -0.4138822, -3.665614, 1, 0, 0, 1, 1,
-2.295307, 1.236105, -0.4332561, 1, 0, 0, 1, 1,
-2.269125, 0.8670584, 0.6394225, 1, 0, 0, 1, 1,
-2.253881, -0.05084264, -1.355255, 0, 0, 0, 1, 1,
-2.241658, 1.928553, -1.68784, 0, 0, 0, 1, 1,
-2.187914, -0.1443697, -0.2177117, 0, 0, 0, 1, 1,
-2.113858, 0.0363731, -0.5602679, 0, 0, 0, 1, 1,
-2.083903, 1.886193, -0.3815506, 0, 0, 0, 1, 1,
-2.065129, 0.5749138, 1.776615, 0, 0, 0, 1, 1,
-2.044782, 0.8601795, -1.719677, 0, 0, 0, 1, 1,
-2.002925, 0.2068986, -0.7480668, 1, 1, 1, 1, 1,
-1.98602, 2.314977, 0.5274296, 1, 1, 1, 1, 1,
-1.973005, -0.6905843, -1.771458, 1, 1, 1, 1, 1,
-1.970291, 1.059195, -0.7730056, 1, 1, 1, 1, 1,
-1.956172, 0.1500208, -0.3717588, 1, 1, 1, 1, 1,
-1.950832, 1.968336, -0.622174, 1, 1, 1, 1, 1,
-1.9326, -0.2105209, -0.8607377, 1, 1, 1, 1, 1,
-1.92918, 0.03733991, -2.656112, 1, 1, 1, 1, 1,
-1.909155, 2.196377, 0.7712422, 1, 1, 1, 1, 1,
-1.908981, -0.685116, -3.276682, 1, 1, 1, 1, 1,
-1.853033, 0.5116044, -0.9042907, 1, 1, 1, 1, 1,
-1.849897, -0.8051017, -2.920498, 1, 1, 1, 1, 1,
-1.849441, 1.285761, -2.552517, 1, 1, 1, 1, 1,
-1.832583, 2.087412, -0.2106621, 1, 1, 1, 1, 1,
-1.831518, 0.3208485, -1.257551, 1, 1, 1, 1, 1,
-1.827248, 0.7424161, -2.364792, 0, 0, 1, 1, 1,
-1.816522, -1.16235, -0.8448011, 1, 0, 0, 1, 1,
-1.813612, -0.771403, -0.7698422, 1, 0, 0, 1, 1,
-1.792283, 0.3264569, -1.597672, 1, 0, 0, 1, 1,
-1.771249, 0.4760124, -1.831895, 1, 0, 0, 1, 1,
-1.71835, 1.242625, -2.440361, 1, 0, 0, 1, 1,
-1.704929, 0.3299041, -0.1058031, 0, 0, 0, 1, 1,
-1.696771, -0.7223037, -2.972933, 0, 0, 0, 1, 1,
-1.695938, -0.3045119, -0.6622132, 0, 0, 0, 1, 1,
-1.686655, -1.038633, -3.128662, 0, 0, 0, 1, 1,
-1.685742, 1.662681, 0.1299633, 0, 0, 0, 1, 1,
-1.683097, 0.1658182, 1.909149, 0, 0, 0, 1, 1,
-1.673772, -0.1134854, -1.718957, 0, 0, 0, 1, 1,
-1.666761, 1.587098, -0.1190015, 1, 1, 1, 1, 1,
-1.653832, -0.01145904, 0.9354811, 1, 1, 1, 1, 1,
-1.64011, -0.2330573, -1.445265, 1, 1, 1, 1, 1,
-1.618017, -1.176847, -2.095417, 1, 1, 1, 1, 1,
-1.610765, 0.4484133, -2.709753, 1, 1, 1, 1, 1,
-1.582753, 0.5154023, -0.1877172, 1, 1, 1, 1, 1,
-1.577416, -0.414811, -0.4448787, 1, 1, 1, 1, 1,
-1.575025, -0.4923405, -0.5341926, 1, 1, 1, 1, 1,
-1.550755, 0.4573631, -1.238916, 1, 1, 1, 1, 1,
-1.548019, 0.5178185, -0.6988154, 1, 1, 1, 1, 1,
-1.545863, -1.264824, -1.277992, 1, 1, 1, 1, 1,
-1.537172, -1.306108, -3.565381, 1, 1, 1, 1, 1,
-1.535826, 0.6527141, -0.9663849, 1, 1, 1, 1, 1,
-1.51579, 0.4036486, 0.5174119, 1, 1, 1, 1, 1,
-1.51124, 0.6176814, -0.9312773, 1, 1, 1, 1, 1,
-1.510395, 0.4988408, -1.089299, 0, 0, 1, 1, 1,
-1.508571, 0.5833626, -1.174272, 1, 0, 0, 1, 1,
-1.496977, -1.626891, -1.750159, 1, 0, 0, 1, 1,
-1.489381, -0.5707994, -0.814816, 1, 0, 0, 1, 1,
-1.489083, -1.069232, -1.965345, 1, 0, 0, 1, 1,
-1.48854, -2.357817, -2.325959, 1, 0, 0, 1, 1,
-1.486922, 0.1771679, 0.4144128, 0, 0, 0, 1, 1,
-1.473044, 0.6183689, 0.05432552, 0, 0, 0, 1, 1,
-1.467942, -0.2104172, -2.613596, 0, 0, 0, 1, 1,
-1.45951, 0.8474963, 0.007043899, 0, 0, 0, 1, 1,
-1.450971, -0.8630378, -1.812361, 0, 0, 0, 1, 1,
-1.440547, -0.8727362, -1.588987, 0, 0, 0, 1, 1,
-1.4389, -0.7015821, -2.036842, 0, 0, 0, 1, 1,
-1.435487, -0.7523529, -2.416622, 1, 1, 1, 1, 1,
-1.430318, -0.4220623, -2.546277, 1, 1, 1, 1, 1,
-1.427607, -0.8111799, -2.208575, 1, 1, 1, 1, 1,
-1.42151, 0.1077685, -1.086108, 1, 1, 1, 1, 1,
-1.421346, -0.09484651, -0.8690103, 1, 1, 1, 1, 1,
-1.4109, -1.27325, 0.1538565, 1, 1, 1, 1, 1,
-1.406734, -1.438358, -3.64901, 1, 1, 1, 1, 1,
-1.404514, -1.20234, -1.333848, 1, 1, 1, 1, 1,
-1.399719, 0.7704511, -1.285317, 1, 1, 1, 1, 1,
-1.39202, 1.062499, -1.596398, 1, 1, 1, 1, 1,
-1.390895, 0.06313391, -2.206611, 1, 1, 1, 1, 1,
-1.390022, -0.5399904, -1.935208, 1, 1, 1, 1, 1,
-1.383797, -0.5668426, -0.7428752, 1, 1, 1, 1, 1,
-1.382917, -0.3278801, -1.365137, 1, 1, 1, 1, 1,
-1.379934, -1.349071, -3.999439, 1, 1, 1, 1, 1,
-1.3784, 0.9282918, -0.6941608, 0, 0, 1, 1, 1,
-1.376887, -0.1903147, -0.2745504, 1, 0, 0, 1, 1,
-1.368267, -0.4050844, -2.570486, 1, 0, 0, 1, 1,
-1.363605, -0.2175618, -2.520225, 1, 0, 0, 1, 1,
-1.360965, 0.6196262, 0.5085831, 1, 0, 0, 1, 1,
-1.359552, -1.34623, -1.857841, 1, 0, 0, 1, 1,
-1.348317, -0.9337246, -0.8299585, 0, 0, 0, 1, 1,
-1.34155, 1.423934, -0.04625874, 0, 0, 0, 1, 1,
-1.338385, -0.593228, -0.5329512, 0, 0, 0, 1, 1,
-1.336922, 0.262329, -0.8699362, 0, 0, 0, 1, 1,
-1.33635, 1.805663, -1.686701, 0, 0, 0, 1, 1,
-1.330761, -0.6075919, -2.054797, 0, 0, 0, 1, 1,
-1.330179, -0.9614854, -2.371635, 0, 0, 0, 1, 1,
-1.32387, 1.325855, 0.05840087, 1, 1, 1, 1, 1,
-1.315816, -1.969208, -1.789624, 1, 1, 1, 1, 1,
-1.31151, -0.1799904, -3.196141, 1, 1, 1, 1, 1,
-1.31005, 1.39529, -1.540946, 1, 1, 1, 1, 1,
-1.307969, -0.06420565, -1.912703, 1, 1, 1, 1, 1,
-1.301151, 0.8265719, -1.138764, 1, 1, 1, 1, 1,
-1.297422, 0.02709178, -1.039347, 1, 1, 1, 1, 1,
-1.277561, 0.5868875, -0.4650624, 1, 1, 1, 1, 1,
-1.273592, 0.2466587, -0.1049337, 1, 1, 1, 1, 1,
-1.265195, -0.9681759, -0.9634355, 1, 1, 1, 1, 1,
-1.265126, -1.038629, -1.930533, 1, 1, 1, 1, 1,
-1.25456, 0.5619838, -2.419307, 1, 1, 1, 1, 1,
-1.252805, -0.2317289, -2.700338, 1, 1, 1, 1, 1,
-1.250478, 0.08695616, -0.9014553, 1, 1, 1, 1, 1,
-1.241359, -0.2788132, -2.410821, 1, 1, 1, 1, 1,
-1.241336, -1.01149, -3.000604, 0, 0, 1, 1, 1,
-1.235335, 1.305809, -1.725796, 1, 0, 0, 1, 1,
-1.235033, 0.05362722, -1.944846, 1, 0, 0, 1, 1,
-1.234127, -0.5357791, -2.004875, 1, 0, 0, 1, 1,
-1.232685, -0.2226568, -2.186244, 1, 0, 0, 1, 1,
-1.224945, 0.776197, 0.9227269, 1, 0, 0, 1, 1,
-1.224577, -0.3551927, -2.630259, 0, 0, 0, 1, 1,
-1.223148, -0.9906322, -0.9000744, 0, 0, 0, 1, 1,
-1.220146, 2.789747, -0.8456894, 0, 0, 0, 1, 1,
-1.219499, 0.3989029, -0.9834958, 0, 0, 0, 1, 1,
-1.219422, -0.9493724, -2.678448, 0, 0, 0, 1, 1,
-1.218741, 0.03558861, -2.222577, 0, 0, 0, 1, 1,
-1.218673, 0.6137671, -1.140563, 0, 0, 0, 1, 1,
-1.207083, -0.5386318, -2.001831, 1, 1, 1, 1, 1,
-1.199564, -0.6743128, -0.7549389, 1, 1, 1, 1, 1,
-1.190566, -0.5773668, -3.218779, 1, 1, 1, 1, 1,
-1.189346, -0.8643407, -2.907954, 1, 1, 1, 1, 1,
-1.181832, 0.9814293, -0.1141056, 1, 1, 1, 1, 1,
-1.179167, -0.2034634, -2.12525, 1, 1, 1, 1, 1,
-1.175582, 0.651175, -0.5600293, 1, 1, 1, 1, 1,
-1.171366, -1.469111, -2.159988, 1, 1, 1, 1, 1,
-1.167732, 0.7218176, -0.2462736, 1, 1, 1, 1, 1,
-1.166601, -0.693912, -0.4474587, 1, 1, 1, 1, 1,
-1.166002, 0.06159534, -1.089672, 1, 1, 1, 1, 1,
-1.157886, 1.686203, -1.28109, 1, 1, 1, 1, 1,
-1.15712, -1.58014, -2.358577, 1, 1, 1, 1, 1,
-1.156113, 1.565695, -1.143569, 1, 1, 1, 1, 1,
-1.152547, 2.029253, 0.3153489, 1, 1, 1, 1, 1,
-1.144628, -1.71065, -1.710486, 0, 0, 1, 1, 1,
-1.138927, 0.3682649, -1.980868, 1, 0, 0, 1, 1,
-1.128922, 0.08246552, -0.3286054, 1, 0, 0, 1, 1,
-1.128219, 0.8384817, 0.3872517, 1, 0, 0, 1, 1,
-1.116415, 1.574973, -1.592316, 1, 0, 0, 1, 1,
-1.116217, -2.167576, -4.358924, 1, 0, 0, 1, 1,
-1.107968, -1.558844, -0.8720165, 0, 0, 0, 1, 1,
-1.099581, -0.03495346, -3.029875, 0, 0, 0, 1, 1,
-1.093457, 0.9007452, -1.04061, 0, 0, 0, 1, 1,
-1.092799, 0.8068625, -0.1908201, 0, 0, 0, 1, 1,
-1.089733, -0.7255396, -3.329786, 0, 0, 0, 1, 1,
-1.065964, 1.570368, -0.406396, 0, 0, 0, 1, 1,
-1.065292, 0.9564642, 0.001917498, 0, 0, 0, 1, 1,
-1.062764, 0.9523111, -1.809629, 1, 1, 1, 1, 1,
-1.053171, -1.195625, -1.682225, 1, 1, 1, 1, 1,
-1.050829, -0.2764083, -0.0984031, 1, 1, 1, 1, 1,
-1.044543, -2.175183, -2.677382, 1, 1, 1, 1, 1,
-1.030346, -1.70069, -3.585898, 1, 1, 1, 1, 1,
-1.023482, 0.1835092, -2.200258, 1, 1, 1, 1, 1,
-1.018397, 1.143811, -0.645349, 1, 1, 1, 1, 1,
-1.016231, -1.240722, -2.099203, 1, 1, 1, 1, 1,
-1.015996, 0.133024, -1.523126, 1, 1, 1, 1, 1,
-1.008784, -0.1114477, -2.807343, 1, 1, 1, 1, 1,
-1.008291, -1.353199, -3.28318, 1, 1, 1, 1, 1,
-1.007517, -0.01867454, -1.236091, 1, 1, 1, 1, 1,
-1.002773, -0.4336164, -1.00375, 1, 1, 1, 1, 1,
-1.000262, -0.3593538, -0.805636, 1, 1, 1, 1, 1,
-0.9966581, 0.4059422, -0.564518, 1, 1, 1, 1, 1,
-0.9946736, 1.530694, -0.9041182, 0, 0, 1, 1, 1,
-0.994278, -0.09160952, -2.487924, 1, 0, 0, 1, 1,
-0.9864061, -0.1994739, -1.577797, 1, 0, 0, 1, 1,
-0.9843349, -1.335041, -3.432828, 1, 0, 0, 1, 1,
-0.9798241, 0.01849087, -1.381419, 1, 0, 0, 1, 1,
-0.9765956, 1.0481, -1.132885, 1, 0, 0, 1, 1,
-0.9719194, 0.5719371, 1.057543, 0, 0, 0, 1, 1,
-0.9658751, 0.8182081, -0.8478703, 0, 0, 0, 1, 1,
-0.965188, 0.6019639, -1.90207, 0, 0, 0, 1, 1,
-0.9520252, 0.7741565, -1.409429, 0, 0, 0, 1, 1,
-0.9453102, 0.5468132, -1.427746, 0, 0, 0, 1, 1,
-0.93007, 1.257502, -1.300528, 0, 0, 0, 1, 1,
-0.9270053, -0.1710267, -2.581333, 0, 0, 0, 1, 1,
-0.9185203, 0.3943646, -0.9551741, 1, 1, 1, 1, 1,
-0.9146898, -0.4085243, -1.537737, 1, 1, 1, 1, 1,
-0.9060793, 1.699136, -0.1462942, 1, 1, 1, 1, 1,
-0.9059522, -0.3667052, -2.444792, 1, 1, 1, 1, 1,
-0.9053533, 0.3117096, -1.4924, 1, 1, 1, 1, 1,
-0.9038027, -0.4828604, -1.227572, 1, 1, 1, 1, 1,
-0.8991872, -0.7059341, -2.189767, 1, 1, 1, 1, 1,
-0.8977162, 0.5282938, -0.5909697, 1, 1, 1, 1, 1,
-0.8849618, -0.1899204, -1.196189, 1, 1, 1, 1, 1,
-0.8815422, 0.1769387, -2.272876, 1, 1, 1, 1, 1,
-0.8806131, -1.473766, -1.871249, 1, 1, 1, 1, 1,
-0.8777066, -0.7534847, -1.629256, 1, 1, 1, 1, 1,
-0.8772956, -0.3045391, -2.826135, 1, 1, 1, 1, 1,
-0.8756378, 0.122152, -2.046798, 1, 1, 1, 1, 1,
-0.8721622, -1.272642, -4.009608, 1, 1, 1, 1, 1,
-0.8653325, 0.3343855, -0.5910972, 0, 0, 1, 1, 1,
-0.8624951, 0.5039862, -0.68335, 1, 0, 0, 1, 1,
-0.8624375, -1.229076, -3.839983, 1, 0, 0, 1, 1,
-0.856799, 1.825866, -2.188798, 1, 0, 0, 1, 1,
-0.8487935, -0.03667148, -1.740824, 1, 0, 0, 1, 1,
-0.8465979, 0.74817, -1.264404, 1, 0, 0, 1, 1,
-0.841585, -1.220908, -2.460624, 0, 0, 0, 1, 1,
-0.8366147, -0.4973141, -2.708927, 0, 0, 0, 1, 1,
-0.8333736, -1.176801, -1.908307, 0, 0, 0, 1, 1,
-0.8286271, 1.378112, 1.290724, 0, 0, 0, 1, 1,
-0.8268901, -0.4650177, -2.565908, 0, 0, 0, 1, 1,
-0.825457, 0.08810688, -0.08638969, 0, 0, 0, 1, 1,
-0.8168638, -0.04708448, -1.452268, 0, 0, 0, 1, 1,
-0.8163261, -0.1854069, -0.5546243, 1, 1, 1, 1, 1,
-0.8099658, -0.4049207, -0.8699872, 1, 1, 1, 1, 1,
-0.7988232, -0.02772857, -2.837581, 1, 1, 1, 1, 1,
-0.7977173, 1.053977, -0.3413468, 1, 1, 1, 1, 1,
-0.786678, -0.2553467, -1.67039, 1, 1, 1, 1, 1,
-0.7828954, -0.818338, 0.5538073, 1, 1, 1, 1, 1,
-0.7755272, 0.9689453, -1.371853, 1, 1, 1, 1, 1,
-0.7746437, 0.1956367, -1.454311, 1, 1, 1, 1, 1,
-0.7712161, 0.4972108, -0.92293, 1, 1, 1, 1, 1,
-0.770108, 0.7525632, -1.203298, 1, 1, 1, 1, 1,
-0.7700008, 0.494561, -1.688942, 1, 1, 1, 1, 1,
-0.7676029, -1.746325, -2.567483, 1, 1, 1, 1, 1,
-0.761582, 0.6532737, -0.7407343, 1, 1, 1, 1, 1,
-0.7540871, 0.269811, -0.01395956, 1, 1, 1, 1, 1,
-0.7461722, 0.3399951, -0.03961015, 1, 1, 1, 1, 1,
-0.7456792, -1.260138, -3.38701, 0, 0, 1, 1, 1,
-0.7400323, 0.3464942, -0.9779314, 1, 0, 0, 1, 1,
-0.7325964, 0.325526, -0.7125391, 1, 0, 0, 1, 1,
-0.7322218, 0.3065659, -0.3856025, 1, 0, 0, 1, 1,
-0.7281805, -0.6593669, -1.934616, 1, 0, 0, 1, 1,
-0.7267156, -0.3692495, -4.059269, 1, 0, 0, 1, 1,
-0.7217236, -0.7716251, -3.661374, 0, 0, 0, 1, 1,
-0.7178109, -1.019071, -3.886206, 0, 0, 0, 1, 1,
-0.7069841, -0.8704544, -2.216902, 0, 0, 0, 1, 1,
-0.7035417, 0.2052893, -1.07716, 0, 0, 0, 1, 1,
-0.696813, 1.010231, 0.2894116, 0, 0, 0, 1, 1,
-0.6938971, 1.19431, -0.7332417, 0, 0, 0, 1, 1,
-0.6897993, 0.1586283, 0.1022799, 0, 0, 0, 1, 1,
-0.6893767, -1.456952, -2.410542, 1, 1, 1, 1, 1,
-0.6829137, 0.1222938, -0.1188735, 1, 1, 1, 1, 1,
-0.6798269, 1.535658, -1.326369, 1, 1, 1, 1, 1,
-0.6752527, -1.074047, -0.5039124, 1, 1, 1, 1, 1,
-0.6714925, -1.516076, -2.354569, 1, 1, 1, 1, 1,
-0.6711249, 1.47561, -2.146073, 1, 1, 1, 1, 1,
-0.6706593, 0.695216, 0.796456, 1, 1, 1, 1, 1,
-0.6689832, -1.478504, -1.293559, 1, 1, 1, 1, 1,
-0.6623799, -0.06306966, -1.660683, 1, 1, 1, 1, 1,
-0.6592904, 0.5549027, -0.9060204, 1, 1, 1, 1, 1,
-0.6591634, -0.3782554, -1.591913, 1, 1, 1, 1, 1,
-0.6537687, 1.158203, -2.006706, 1, 1, 1, 1, 1,
-0.6499655, -0.4264302, -2.10188, 1, 1, 1, 1, 1,
-0.6480175, 1.745727, -0.1491765, 1, 1, 1, 1, 1,
-0.6476007, 0.3812277, -1.26081, 1, 1, 1, 1, 1,
-0.6474746, -1.481666, -3.23835, 0, 0, 1, 1, 1,
-0.6387036, 0.3283213, -1.188895, 1, 0, 0, 1, 1,
-0.6340522, -0.6399053, -3.538934, 1, 0, 0, 1, 1,
-0.6296717, 1.135847, -0.06241906, 1, 0, 0, 1, 1,
-0.6253612, 0.289879, -2.286588, 1, 0, 0, 1, 1,
-0.6236666, 0.714003, 0.4243393, 1, 0, 0, 1, 1,
-0.6236451, -1.728483, -2.282034, 0, 0, 0, 1, 1,
-0.6231492, 0.3556873, -0.2139367, 0, 0, 0, 1, 1,
-0.6130415, 0.005361108, -0.9295383, 0, 0, 0, 1, 1,
-0.6068255, 0.1470541, -0.6111807, 0, 0, 0, 1, 1,
-0.6039163, 1.437814, -0.3960536, 0, 0, 0, 1, 1,
-0.6029529, -0.06583147, -2.731141, 0, 0, 0, 1, 1,
-0.6017801, -0.1403052, -2.326236, 0, 0, 0, 1, 1,
-0.6017228, -0.3733913, -0.934583, 1, 1, 1, 1, 1,
-0.6008151, 0.6536765, -1.340875, 1, 1, 1, 1, 1,
-0.6007684, -0.8838273, -2.024443, 1, 1, 1, 1, 1,
-0.6002842, 0.221366, -2.78085, 1, 1, 1, 1, 1,
-0.6000524, 0.0645211, -0.4450192, 1, 1, 1, 1, 1,
-0.5997905, -0.324062, -1.611744, 1, 1, 1, 1, 1,
-0.5988735, -0.2466999, -2.63487, 1, 1, 1, 1, 1,
-0.5984389, 0.6436873, 0.4812891, 1, 1, 1, 1, 1,
-0.5980944, 0.6673108, -2.125305, 1, 1, 1, 1, 1,
-0.5976011, -0.519096, -2.485662, 1, 1, 1, 1, 1,
-0.590638, 1.533008, -0.5465117, 1, 1, 1, 1, 1,
-0.586784, 0.1456538, -1.236553, 1, 1, 1, 1, 1,
-0.5855716, -0.350643, -2.137112, 1, 1, 1, 1, 1,
-0.5839304, 0.2415125, -1.165051, 1, 1, 1, 1, 1,
-0.5802459, 0.8303745, -1.022948, 1, 1, 1, 1, 1,
-0.5744071, -0.3084668, -0.5376201, 0, 0, 1, 1, 1,
-0.5631108, -0.2417493, -1.188765, 1, 0, 0, 1, 1,
-0.5534388, 0.401791, -1.804167, 1, 0, 0, 1, 1,
-0.5490785, -1.609118, -3.19215, 1, 0, 0, 1, 1,
-0.5477115, -0.3981372, -1.960875, 1, 0, 0, 1, 1,
-0.5475059, 0.2633897, 0.962907, 1, 0, 0, 1, 1,
-0.5456046, -0.04102226, -1.039276, 0, 0, 0, 1, 1,
-0.5446571, -0.3684389, -1.687326, 0, 0, 0, 1, 1,
-0.5408444, -0.7253197, -2.870021, 0, 0, 0, 1, 1,
-0.5401452, -0.4191557, -3.31991, 0, 0, 0, 1, 1,
-0.536132, 2.293366, -0.5390413, 0, 0, 0, 1, 1,
-0.5351253, 0.4547626, -0.6543232, 0, 0, 0, 1, 1,
-0.5290356, 0.8750473, 1.385857, 0, 0, 0, 1, 1,
-0.5278152, -0.2047212, -2.48427, 1, 1, 1, 1, 1,
-0.52778, -0.3289593, -2.008847, 1, 1, 1, 1, 1,
-0.5253893, -1.111318, -3.533567, 1, 1, 1, 1, 1,
-0.5252885, 1.518992, -0.1992541, 1, 1, 1, 1, 1,
-0.5209908, -2.27101, -2.343715, 1, 1, 1, 1, 1,
-0.5205585, -0.6102586, -4.48357, 1, 1, 1, 1, 1,
-0.5132105, 1.924217, -0.02455245, 1, 1, 1, 1, 1,
-0.5114876, -1.247124, -2.47327, 1, 1, 1, 1, 1,
-0.5068111, -1.958403, -1.937606, 1, 1, 1, 1, 1,
-0.5051894, -0.5584147, -1.867168, 1, 1, 1, 1, 1,
-0.5004938, -1.804321, -3.404985, 1, 1, 1, 1, 1,
-0.4937357, -1.004438, -2.450154, 1, 1, 1, 1, 1,
-0.4922057, -1.550196, -4.453001, 1, 1, 1, 1, 1,
-0.4857249, -0.1280892, -1.960927, 1, 1, 1, 1, 1,
-0.4836654, 0.1211499, 0.08965296, 1, 1, 1, 1, 1,
-0.482824, -0.04806092, -1.051111, 0, 0, 1, 1, 1,
-0.4798018, 1.46531, -0.8926255, 1, 0, 0, 1, 1,
-0.4788196, 0.522631, -0.2911785, 1, 0, 0, 1, 1,
-0.4766451, 2.292245, -0.5219887, 1, 0, 0, 1, 1,
-0.475069, 0.4007333, -0.3841994, 1, 0, 0, 1, 1,
-0.4735353, -0.1782044, -1.082687, 1, 0, 0, 1, 1,
-0.4658184, -3.444071, -2.818452, 0, 0, 0, 1, 1,
-0.4565769, -1.591085, -2.261416, 0, 0, 0, 1, 1,
-0.4553984, -0.2364462, -1.923252, 0, 0, 0, 1, 1,
-0.4494693, 1.864816, 0.1144288, 0, 0, 0, 1, 1,
-0.4485106, -0.4119796, -3.374192, 0, 0, 0, 1, 1,
-0.4484497, 2.068991, 0.318349, 0, 0, 0, 1, 1,
-0.4435445, -0.2853059, -2.5201, 0, 0, 0, 1, 1,
-0.4433519, 0.7285227, 0.279357, 1, 1, 1, 1, 1,
-0.439026, -0.5630716, -2.370573, 1, 1, 1, 1, 1,
-0.4385559, 1.016898, 0.1266382, 1, 1, 1, 1, 1,
-0.435135, 2.418043, -1.443994, 1, 1, 1, 1, 1,
-0.4344997, 0.5899681, 0.7609766, 1, 1, 1, 1, 1,
-0.4320843, -0.09412497, -0.8943744, 1, 1, 1, 1, 1,
-0.4320112, -0.5091391, -2.841345, 1, 1, 1, 1, 1,
-0.4287894, 1.451263, 1.121603, 1, 1, 1, 1, 1,
-0.4230734, -0.3180463, -3.33957, 1, 1, 1, 1, 1,
-0.4194929, 0.3887378, -0.1679156, 1, 1, 1, 1, 1,
-0.4180526, -0.6824438, -3.211031, 1, 1, 1, 1, 1,
-0.4168148, 1.979797, 0.2675874, 1, 1, 1, 1, 1,
-0.4100671, -1.01481, -2.790582, 1, 1, 1, 1, 1,
-0.4084451, -1.839699, -2.656206, 1, 1, 1, 1, 1,
-0.4080538, 0.3477472, -0.3027379, 1, 1, 1, 1, 1,
-0.4066299, -1.312721, -3.378299, 0, 0, 1, 1, 1,
-0.4060722, -1.378655, -1.878061, 1, 0, 0, 1, 1,
-0.4016409, -0.972184, -4.869538, 1, 0, 0, 1, 1,
-0.401404, 0.8691471, -0.03958911, 1, 0, 0, 1, 1,
-0.400722, -0.9507282, 0.1165291, 1, 0, 0, 1, 1,
-0.3991741, 0.3689935, -1.594977, 1, 0, 0, 1, 1,
-0.3989893, 0.02894176, -0.896395, 0, 0, 0, 1, 1,
-0.3909886, 0.2497262, -0.2932777, 0, 0, 0, 1, 1,
-0.3872276, -0.4507001, -1.68598, 0, 0, 0, 1, 1,
-0.3795274, 1.273826, 0.4877218, 0, 0, 0, 1, 1,
-0.3772443, 1.453402, 0.4832891, 0, 0, 0, 1, 1,
-0.3763376, -0.4124162, -1.892899, 0, 0, 0, 1, 1,
-0.3744286, 1.739082, 0.9044985, 0, 0, 0, 1, 1,
-0.3743252, 0.8134561, 0.009973845, 1, 1, 1, 1, 1,
-0.3735686, 2.538221, 1.354617, 1, 1, 1, 1, 1,
-0.3731867, 1.736263, -0.6242363, 1, 1, 1, 1, 1,
-0.3722257, 0.8009631, -0.7200841, 1, 1, 1, 1, 1,
-0.3686506, 0.5177173, -0.964417, 1, 1, 1, 1, 1,
-0.3670593, 0.08821938, -0.7857023, 1, 1, 1, 1, 1,
-0.3669565, -1.780436, -2.993089, 1, 1, 1, 1, 1,
-0.3572884, 0.609837, 1.444098, 1, 1, 1, 1, 1,
-0.3506582, 0.4136364, -0.3548869, 1, 1, 1, 1, 1,
-0.3485726, 0.33356, -0.7945379, 1, 1, 1, 1, 1,
-0.3482998, -1.506918, -2.061829, 1, 1, 1, 1, 1,
-0.3451944, -0.7436491, -1.664759, 1, 1, 1, 1, 1,
-0.3392056, 1.643189, 0.8856212, 1, 1, 1, 1, 1,
-0.3386264, 3.093678, -0.3344232, 1, 1, 1, 1, 1,
-0.3364143, -0.5369937, -4.087056, 1, 1, 1, 1, 1,
-0.3311195, -0.3142765, -3.139822, 0, 0, 1, 1, 1,
-0.328458, -1.647334, -2.474959, 1, 0, 0, 1, 1,
-0.3272903, 1.356333, 0.5958681, 1, 0, 0, 1, 1,
-0.3254583, -1.167199, -3.221275, 1, 0, 0, 1, 1,
-0.3167252, 0.2041185, -0.7950747, 1, 0, 0, 1, 1,
-0.3164731, -1.588228, -2.461699, 1, 0, 0, 1, 1,
-0.3157976, -0.05839461, -1.86044, 0, 0, 0, 1, 1,
-0.3138316, -0.0102829, -1.360209, 0, 0, 0, 1, 1,
-0.3134906, -0.2588015, -2.031405, 0, 0, 0, 1, 1,
-0.3102264, 1.159293, -0.5358712, 0, 0, 0, 1, 1,
-0.3078847, 0.443861, -1.469827, 0, 0, 0, 1, 1,
-0.3059928, -0.07332228, -1.087714, 0, 0, 0, 1, 1,
-0.302351, 0.16712, -1.79924, 0, 0, 0, 1, 1,
-0.2983, -1.114304, -5.10986, 1, 1, 1, 1, 1,
-0.2887516, -1.081747, -2.31099, 1, 1, 1, 1, 1,
-0.2867558, 0.07901639, -2.060202, 1, 1, 1, 1, 1,
-0.2814872, 1.138791, -1.065042, 1, 1, 1, 1, 1,
-0.2807496, -0.8884658, -1.813548, 1, 1, 1, 1, 1,
-0.2806726, -1.63757, -3.083554, 1, 1, 1, 1, 1,
-0.2804377, 0.05771875, -1.365901, 1, 1, 1, 1, 1,
-0.2747608, -0.2176323, -2.794585, 1, 1, 1, 1, 1,
-0.2723176, 0.5309195, 0.9977253, 1, 1, 1, 1, 1,
-0.268741, -0.8151482, -2.994396, 1, 1, 1, 1, 1,
-0.2654658, -0.121096, -2.118434, 1, 1, 1, 1, 1,
-0.262489, 1.308097, -0.3509025, 1, 1, 1, 1, 1,
-0.2611209, -1.244989, -2.360227, 1, 1, 1, 1, 1,
-0.2588734, 0.7519441, -0.8037513, 1, 1, 1, 1, 1,
-0.2577379, 2.032231, 2.456745, 1, 1, 1, 1, 1,
-0.2539373, 0.6170175, -1.682887, 0, 0, 1, 1, 1,
-0.2535778, 0.9550592, -0.8028055, 1, 0, 0, 1, 1,
-0.2534463, 0.2164787, -0.4949076, 1, 0, 0, 1, 1,
-0.2527085, -1.022069, -1.977361, 1, 0, 0, 1, 1,
-0.2523993, -1.482105, -3.622737, 1, 0, 0, 1, 1,
-0.251479, -0.8344751, -1.602403, 1, 0, 0, 1, 1,
-0.2508206, 0.3386851, -0.9346998, 0, 0, 0, 1, 1,
-0.2490839, 0.1521402, -1.310804, 0, 0, 0, 1, 1,
-0.2469047, -0.6663143, -3.323531, 0, 0, 0, 1, 1,
-0.2411358, -0.5482768, -2.853592, 0, 0, 0, 1, 1,
-0.2402185, -0.04181175, -1.177846, 0, 0, 0, 1, 1,
-0.2393171, 0.7190919, 0.7608654, 0, 0, 0, 1, 1,
-0.2348343, 0.9463366, -0.0507898, 0, 0, 0, 1, 1,
-0.2341062, 2.042972, 0.04836485, 1, 1, 1, 1, 1,
-0.230625, -0.9261307, -3.307438, 1, 1, 1, 1, 1,
-0.2235471, 0.6947607, -0.4911792, 1, 1, 1, 1, 1,
-0.2213505, -0.1702677, -2.155795, 1, 1, 1, 1, 1,
-0.2157828, -0.5951314, -4.715275, 1, 1, 1, 1, 1,
-0.2128433, 0.2835816, -2.277835, 1, 1, 1, 1, 1,
-0.2064213, -0.7367953, -2.183361, 1, 1, 1, 1, 1,
-0.2060091, 1.259473, 0.583147, 1, 1, 1, 1, 1,
-0.2053356, 0.2449151, -0.03568596, 1, 1, 1, 1, 1,
-0.2046982, -0.4208454, -0.9605736, 1, 1, 1, 1, 1,
-0.2038024, 0.0555832, -1.0623, 1, 1, 1, 1, 1,
-0.1972418, 0.686777, -0.3609824, 1, 1, 1, 1, 1,
-0.1892493, 1.592352, -0.1719349, 1, 1, 1, 1, 1,
-0.1840585, -1.064191, -1.282626, 1, 1, 1, 1, 1,
-0.1821831, 0.832167, -0.8734645, 1, 1, 1, 1, 1,
-0.1781127, -0.7946946, -1.257865, 0, 0, 1, 1, 1,
-0.1717804, -0.3625636, -0.9045954, 1, 0, 0, 1, 1,
-0.1689489, -0.6076286, -4.772563, 1, 0, 0, 1, 1,
-0.1605923, 0.3542165, -1.281083, 1, 0, 0, 1, 1,
-0.1564475, -0.6722573, -1.624249, 1, 0, 0, 1, 1,
-0.1552144, -0.05302918, -0.7139493, 1, 0, 0, 1, 1,
-0.1544376, 2.304916, 1.222091, 0, 0, 0, 1, 1,
-0.1535817, -0.1484894, -2.397483, 0, 0, 0, 1, 1,
-0.1533082, 0.8209381, -0.6769026, 0, 0, 0, 1, 1,
-0.1525788, 0.9574671, 0.1628251, 0, 0, 0, 1, 1,
-0.1496533, 0.004302256, -1.111172, 0, 0, 0, 1, 1,
-0.1476316, -1.137181, -1.407941, 0, 0, 0, 1, 1,
-0.1459849, -1.382743, -1.979102, 0, 0, 0, 1, 1,
-0.1451337, -0.5991183, -2.736946, 1, 1, 1, 1, 1,
-0.1415994, -1.591536, -2.250206, 1, 1, 1, 1, 1,
-0.1405423, -1.345315, -2.432407, 1, 1, 1, 1, 1,
-0.1384849, 0.1441209, -0.694796, 1, 1, 1, 1, 1,
-0.1365606, -1.549251, -3.472711, 1, 1, 1, 1, 1,
-0.1358168, 0.7617004, -0.594527, 1, 1, 1, 1, 1,
-0.1329506, 0.4466838, -1.635466, 1, 1, 1, 1, 1,
-0.1322308, -1.946571, -2.302677, 1, 1, 1, 1, 1,
-0.1309137, 1.038491, -1.318809, 1, 1, 1, 1, 1,
-0.1238664, -0.06320541, -2.041158, 1, 1, 1, 1, 1,
-0.1226276, 1.438709, 0.1053407, 1, 1, 1, 1, 1,
-0.1219835, 0.6344246, -0.5718398, 1, 1, 1, 1, 1,
-0.1208073, 0.2682255, -1.865281, 1, 1, 1, 1, 1,
-0.1198704, 0.07432421, 0.7853741, 1, 1, 1, 1, 1,
-0.1179975, -0.2045486, -3.029561, 1, 1, 1, 1, 1,
-0.1164349, 0.06212078, -2.176866, 0, 0, 1, 1, 1,
-0.1144238, 0.1123605, -1.709301, 1, 0, 0, 1, 1,
-0.113006, -0.1083076, -2.547632, 1, 0, 0, 1, 1,
-0.110913, -1.423706, -3.986793, 1, 0, 0, 1, 1,
-0.108503, 0.8628802, 0.2686747, 1, 0, 0, 1, 1,
-0.1046595, 1.949782, -1.712642, 1, 0, 0, 1, 1,
-0.1034688, 0.6250821, -1.140346, 0, 0, 0, 1, 1,
-0.101873, -0.0296536, -3.442283, 0, 0, 0, 1, 1,
-0.1003038, -0.8200151, -3.565325, 0, 0, 0, 1, 1,
-0.09750594, 0.5885787, -1.958338, 0, 0, 0, 1, 1,
-0.09728154, -1.139399, -2.000454, 0, 0, 0, 1, 1,
-0.08993396, -1.5405, -3.111966, 0, 0, 0, 1, 1,
-0.08974761, -1.757988, -2.245577, 0, 0, 0, 1, 1,
-0.08861781, -0.5506893, -4.199646, 1, 1, 1, 1, 1,
-0.08757568, 0.4307717, 0.26802, 1, 1, 1, 1, 1,
-0.08722579, 0.7243245, -0.7578071, 1, 1, 1, 1, 1,
-0.08631074, 0.4576858, 0.1374916, 1, 1, 1, 1, 1,
-0.07901691, -0.04311447, -1.928774, 1, 1, 1, 1, 1,
-0.07813152, -0.2285547, -3.911446, 1, 1, 1, 1, 1,
-0.0748726, 1.080613, 0.4023938, 1, 1, 1, 1, 1,
-0.07353812, -0.286248, -3.123998, 1, 1, 1, 1, 1,
-0.07242671, -0.2571113, -2.734274, 1, 1, 1, 1, 1,
-0.07121627, -0.6374689, -1.820667, 1, 1, 1, 1, 1,
-0.06728964, -0.3713908, -2.346179, 1, 1, 1, 1, 1,
-0.06459501, -0.4224065, -0.6192794, 1, 1, 1, 1, 1,
-0.06073373, -1.635804, -3.301505, 1, 1, 1, 1, 1,
-0.06043835, 0.08496251, -0.5623088, 1, 1, 1, 1, 1,
-0.05973131, 1.206445, 1.56044, 1, 1, 1, 1, 1,
-0.05702198, -1.168128, -1.8641, 0, 0, 1, 1, 1,
-0.05635765, 2.276131, 1.201025, 1, 0, 0, 1, 1,
-0.05623951, 0.7660196, 0.3124261, 1, 0, 0, 1, 1,
-0.05548167, -0.1291633, -3.098382, 1, 0, 0, 1, 1,
-0.05365749, -1.085438, -3.174056, 1, 0, 0, 1, 1,
-0.05275524, -0.3021582, -1.304585, 1, 0, 0, 1, 1,
-0.05219162, -0.1214064, -1.619684, 0, 0, 0, 1, 1,
-0.05207037, 1.373083, -0.07004198, 0, 0, 0, 1, 1,
-0.05050906, -0.7590289, -1.604806, 0, 0, 0, 1, 1,
-0.05020991, 0.2571284, -0.2610986, 0, 0, 0, 1, 1,
-0.05005019, -1.884339, -3.452598, 0, 0, 0, 1, 1,
-0.04869423, 1.594923, -0.1881509, 0, 0, 0, 1, 1,
-0.04533164, -0.1558984, -3.585505, 0, 0, 0, 1, 1,
-0.0440125, 0.4047148, 1.815241, 1, 1, 1, 1, 1,
-0.04019395, -0.9527256, -1.604367, 1, 1, 1, 1, 1,
-0.03805074, 1.454954, 0.7415768, 1, 1, 1, 1, 1,
-0.03766298, 0.9336236, 0.1613999, 1, 1, 1, 1, 1,
-0.03097557, 0.868817, 0.8615112, 1, 1, 1, 1, 1,
-0.03034558, 1.29311, -0.1172351, 1, 1, 1, 1, 1,
-0.02923249, -1.103242, -4.037049, 1, 1, 1, 1, 1,
-0.02266239, 0.2866916, 0.3383494, 1, 1, 1, 1, 1,
-0.01941864, -0.08139492, -3.682532, 1, 1, 1, 1, 1,
-0.01389917, -1.775406, -1.937532, 1, 1, 1, 1, 1,
-0.0122077, 0.1650852, -0.6464344, 1, 1, 1, 1, 1,
-0.01077017, -0.02135883, -0.6257274, 1, 1, 1, 1, 1,
-0.009367224, -0.4092388, -1.160828, 1, 1, 1, 1, 1,
-0.007984124, 0.6036345, 0.8456601, 1, 1, 1, 1, 1,
-0.007286551, 0.05391349, 0.6472024, 1, 1, 1, 1, 1,
-0.005290166, 0.6445957, 1.435327, 0, 0, 1, 1, 1,
-0.005203174, 0.5624141, -0.8255052, 1, 0, 0, 1, 1,
-0.003949966, -0.1846848, -1.90607, 1, 0, 0, 1, 1,
-0.003159102, -0.3011784, -5.309732, 1, 0, 0, 1, 1,
-0.002627551, 0.2218497, 1.039531, 1, 0, 0, 1, 1,
-0.002615179, -0.9118034, -2.596986, 1, 0, 0, 1, 1,
-0.001387384, 1.802069, -0.369294, 0, 0, 0, 1, 1,
0.0002525809, -2.084169, 2.255522, 0, 0, 0, 1, 1,
0.001197843, 1.647874, -0.1205057, 0, 0, 0, 1, 1,
0.002992343, -0.9583244, 5.400588, 0, 0, 0, 1, 1,
0.00789548, 1.354943, 0.9422268, 0, 0, 0, 1, 1,
0.008150565, -1.249626, 3.772557, 0, 0, 0, 1, 1,
0.01215886, -0.873046, 3.033722, 0, 0, 0, 1, 1,
0.01734464, -0.6430879, 2.897529, 1, 1, 1, 1, 1,
0.01754438, -0.2944749, 2.819599, 1, 1, 1, 1, 1,
0.01909736, -0.06366919, 2.584438, 1, 1, 1, 1, 1,
0.01923573, -1.412272, 3.113028, 1, 1, 1, 1, 1,
0.01959283, -0.1126473, 3.433232, 1, 1, 1, 1, 1,
0.02574918, 1.37494, -0.2389181, 1, 1, 1, 1, 1,
0.02591408, -1.346036, 1.2649, 1, 1, 1, 1, 1,
0.02633005, 0.2010743, -1.706845, 1, 1, 1, 1, 1,
0.02636201, -1.291151, 2.792494, 1, 1, 1, 1, 1,
0.02819771, 0.3922588, -1.770721, 1, 1, 1, 1, 1,
0.03172527, 0.7963141, -1.433375, 1, 1, 1, 1, 1,
0.03773371, -2.281842, 2.545974, 1, 1, 1, 1, 1,
0.04132449, 0.1343774, 0.4546262, 1, 1, 1, 1, 1,
0.04228032, 0.2760214, -0.9869531, 1, 1, 1, 1, 1,
0.04325358, 1.562159, 1.44817, 1, 1, 1, 1, 1,
0.05110626, -0.1780985, 3.000344, 0, 0, 1, 1, 1,
0.05133453, -0.6449405, 3.376546, 1, 0, 0, 1, 1,
0.05184349, 0.476146, -0.0535419, 1, 0, 0, 1, 1,
0.05951987, 0.2131912, 1.738215, 1, 0, 0, 1, 1,
0.05988491, -1.023561, 2.439325, 1, 0, 0, 1, 1,
0.06033986, 1.449452, 1.328222, 1, 0, 0, 1, 1,
0.06603441, 0.7301085, -0.0295902, 0, 0, 0, 1, 1,
0.07226308, 1.340968, 0.6924124, 0, 0, 0, 1, 1,
0.07676643, -0.3909538, 1.402569, 0, 0, 0, 1, 1,
0.08386272, 1.208589, 2.029308, 0, 0, 0, 1, 1,
0.08546727, -1.1937, 3.711324, 0, 0, 0, 1, 1,
0.09367067, 1.390869, -0.3749218, 0, 0, 0, 1, 1,
0.09389335, -0.816727, 2.758566, 0, 0, 0, 1, 1,
0.0945109, -0.496952, 3.735519, 1, 1, 1, 1, 1,
0.1006466, -0.7326283, 2.377769, 1, 1, 1, 1, 1,
0.1030436, -1.080808, 3.084981, 1, 1, 1, 1, 1,
0.1069881, 2.357131, -0.3162194, 1, 1, 1, 1, 1,
0.1074627, 0.5499863, -0.05656619, 1, 1, 1, 1, 1,
0.1249693, 0.4134371, -0.7224738, 1, 1, 1, 1, 1,
0.1321956, 1.286374, 0.8145784, 1, 1, 1, 1, 1,
0.1368266, 0.4853922, 0.1773534, 1, 1, 1, 1, 1,
0.1383523, -0.04938327, 2.220591, 1, 1, 1, 1, 1,
0.1479604, 1.060036, 1.005759, 1, 1, 1, 1, 1,
0.1558715, -0.02104287, 3.694062, 1, 1, 1, 1, 1,
0.1716527, -1.049459, 3.852578, 1, 1, 1, 1, 1,
0.1719689, 1.224028, 0.5383669, 1, 1, 1, 1, 1,
0.1725951, -1.334559, 3.497314, 1, 1, 1, 1, 1,
0.1745785, -1.482686, 2.117057, 1, 1, 1, 1, 1,
0.1746604, 0.7082106, 0.06251207, 0, 0, 1, 1, 1,
0.1761173, 0.5344187, 1.195173, 1, 0, 0, 1, 1,
0.1766298, -0.7254948, 2.890769, 1, 0, 0, 1, 1,
0.1779926, 1.164904, 1.431142, 1, 0, 0, 1, 1,
0.1803552, -0.5591705, 1.742499, 1, 0, 0, 1, 1,
0.1811175, 1.10826, 0.7440545, 1, 0, 0, 1, 1,
0.1848557, -0.660784, 3.752608, 0, 0, 0, 1, 1,
0.1917983, -0.5116706, 2.454516, 0, 0, 0, 1, 1,
0.1919964, 2.382316, -0.1997905, 0, 0, 0, 1, 1,
0.1945172, -1.643837, 3.586423, 0, 0, 0, 1, 1,
0.1956521, -1.102503, 3.616065, 0, 0, 0, 1, 1,
0.197612, 1.069409, 1.016947, 0, 0, 0, 1, 1,
0.198288, -0.5700123, 4.077614, 0, 0, 0, 1, 1,
0.2113007, -0.4650006, 3.386047, 1, 1, 1, 1, 1,
0.2129533, 0.5279054, 0.5029219, 1, 1, 1, 1, 1,
0.2139786, 0.4919727, 1.267055, 1, 1, 1, 1, 1,
0.2164787, 1.417103, 1.553891, 1, 1, 1, 1, 1,
0.2175484, 1.592132, 0.01975392, 1, 1, 1, 1, 1,
0.2192836, 0.8109124, 1.04991, 1, 1, 1, 1, 1,
0.2208545, 0.162485, -0.5692302, 1, 1, 1, 1, 1,
0.2232667, -0.2305098, 2.607757, 1, 1, 1, 1, 1,
0.2233101, 0.4529467, 0.6292037, 1, 1, 1, 1, 1,
0.227215, 0.3240519, 0.6624492, 1, 1, 1, 1, 1,
0.2298553, -0.455267, 2.777549, 1, 1, 1, 1, 1,
0.2300244, 1.002894, -0.7629801, 1, 1, 1, 1, 1,
0.2339537, 0.08282678, 0.7949904, 1, 1, 1, 1, 1,
0.2344519, -0.1479603, 4.418889, 1, 1, 1, 1, 1,
0.2405776, 0.3855835, -0.4122947, 1, 1, 1, 1, 1,
0.2412104, 1.383318, 0.6358538, 0, 0, 1, 1, 1,
0.244715, -0.5468715, 2.795742, 1, 0, 0, 1, 1,
0.2503842, -0.02456813, 0.2961025, 1, 0, 0, 1, 1,
0.2531656, 0.3643304, 1.676973, 1, 0, 0, 1, 1,
0.2596367, -1.040871, 4.668191, 1, 0, 0, 1, 1,
0.2630648, -0.01260715, 0.4540877, 1, 0, 0, 1, 1,
0.2634489, -1.177159, 3.840002, 0, 0, 0, 1, 1,
0.2669854, -0.2968774, 3.521823, 0, 0, 0, 1, 1,
0.2704803, 0.5934506, -0.7776597, 0, 0, 0, 1, 1,
0.2721803, -0.7187362, 3.667156, 0, 0, 0, 1, 1,
0.2798443, -0.4390785, 2.806151, 0, 0, 0, 1, 1,
0.2874567, -0.06521949, 3.611927, 0, 0, 0, 1, 1,
0.2875221, -1.734259, 4.748905, 0, 0, 0, 1, 1,
0.288662, 2.115087, 0.06415895, 1, 1, 1, 1, 1,
0.3008389, 0.1063935, 1.8607, 1, 1, 1, 1, 1,
0.3043575, -0.3476157, 3.352215, 1, 1, 1, 1, 1,
0.3077371, 0.4885766, -0.2554167, 1, 1, 1, 1, 1,
0.3084255, 0.9232264, -0.8910134, 1, 1, 1, 1, 1,
0.31036, -0.3613134, 1.512435, 1, 1, 1, 1, 1,
0.3127723, 0.8653212, 1.447272, 1, 1, 1, 1, 1,
0.3163379, -0.8309125, 2.836231, 1, 1, 1, 1, 1,
0.3186654, -0.8296238, 3.23165, 1, 1, 1, 1, 1,
0.319586, 0.8257571, 1.045881, 1, 1, 1, 1, 1,
0.3261695, 0.5816649, -0.3825972, 1, 1, 1, 1, 1,
0.3323819, 0.1331571, 2.158737, 1, 1, 1, 1, 1,
0.3332493, 0.6314422, -0.4502198, 1, 1, 1, 1, 1,
0.3344908, -0.2711692, 2.532875, 1, 1, 1, 1, 1,
0.3406157, 0.4537563, 1.028249, 1, 1, 1, 1, 1,
0.3422683, 0.3916101, -0.09647815, 0, 0, 1, 1, 1,
0.3449399, 0.641371, -0.09119941, 1, 0, 0, 1, 1,
0.3457958, 1.009689, 1.615419, 1, 0, 0, 1, 1,
0.3492597, 0.2785514, 1.727792, 1, 0, 0, 1, 1,
0.3520247, -0.007420788, 2.347147, 1, 0, 0, 1, 1,
0.3530048, -0.8883557, 4.359385, 1, 0, 0, 1, 1,
0.3569354, -1.199615, 2.949666, 0, 0, 0, 1, 1,
0.361669, -0.2438899, 1.376238, 0, 0, 0, 1, 1,
0.3629159, -0.02829297, 0.3398947, 0, 0, 0, 1, 1,
0.366124, -0.6913932, 2.088703, 0, 0, 0, 1, 1,
0.3683133, 1.652791, 0.1134861, 0, 0, 0, 1, 1,
0.3694041, 0.0834614, 2.247985, 0, 0, 0, 1, 1,
0.3696513, 0.6318893, -0.9739661, 0, 0, 0, 1, 1,
0.3696785, -1.342928, 1.396014, 1, 1, 1, 1, 1,
0.37386, 1.096408, 1.463895, 1, 1, 1, 1, 1,
0.3750041, -0.2901805, 1.290781, 1, 1, 1, 1, 1,
0.3756216, -0.2927089, 2.439871, 1, 1, 1, 1, 1,
0.3766678, -0.4964973, 2.822242, 1, 1, 1, 1, 1,
0.3781256, -0.2242683, 1.219923, 1, 1, 1, 1, 1,
0.3793744, -0.6242328, 3.065295, 1, 1, 1, 1, 1,
0.3818161, -0.08108892, 2.926035, 1, 1, 1, 1, 1,
0.3856561, -0.483296, 1.619664, 1, 1, 1, 1, 1,
0.3928528, -2.393821, 2.606358, 1, 1, 1, 1, 1,
0.3967858, -0.05158286, 0.8041613, 1, 1, 1, 1, 1,
0.4050679, -1.622611, 2.274067, 1, 1, 1, 1, 1,
0.4054798, 0.4847783, 0.6992252, 1, 1, 1, 1, 1,
0.4071079, -0.1792158, 2.043179, 1, 1, 1, 1, 1,
0.4128384, -1.085067, 4.68954, 1, 1, 1, 1, 1,
0.4145744, 1.422801, -0.2629894, 0, 0, 1, 1, 1,
0.4168953, 0.6522896, 0.2392775, 1, 0, 0, 1, 1,
0.4210227, -1.089508, 2.740952, 1, 0, 0, 1, 1,
0.4263581, -1.018513, 2.582943, 1, 0, 0, 1, 1,
0.4282023, -0.7687988, 3.128707, 1, 0, 0, 1, 1,
0.4287998, -2.253131, 2.63774, 1, 0, 0, 1, 1,
0.4320187, 0.1858548, -0.1747271, 0, 0, 0, 1, 1,
0.4333759, 0.4611068, 1.708172, 0, 0, 0, 1, 1,
0.4351413, 0.4720382, 1.419318, 0, 0, 0, 1, 1,
0.4406362, 0.01629856, 1.636685, 0, 0, 0, 1, 1,
0.4460439, -0.103455, 3.120374, 0, 0, 0, 1, 1,
0.4471024, -2.243974, 1.856003, 0, 0, 0, 1, 1,
0.4481863, -0.784544, 0.7803195, 0, 0, 0, 1, 1,
0.4516545, -0.3593225, 2.980584, 1, 1, 1, 1, 1,
0.4554355, 0.3565609, -0.8237728, 1, 1, 1, 1, 1,
0.4579405, -0.1821887, 3.542749, 1, 1, 1, 1, 1,
0.462322, 1.358166, 0.1994719, 1, 1, 1, 1, 1,
0.4657346, 0.5917339, 2.385142, 1, 1, 1, 1, 1,
0.4672962, 0.7404826, 1.640959, 1, 1, 1, 1, 1,
0.4683667, -0.4164131, 2.188632, 1, 1, 1, 1, 1,
0.4754297, -0.5548637, 1.783144, 1, 1, 1, 1, 1,
0.4764122, -0.4644327, 1.740763, 1, 1, 1, 1, 1,
0.4765289, 0.4868843, 1.243261, 1, 1, 1, 1, 1,
0.4776078, -0.6729656, -0.1012345, 1, 1, 1, 1, 1,
0.4807769, -0.3176755, 1.90226, 1, 1, 1, 1, 1,
0.4855717, 0.7375928, -0.3631729, 1, 1, 1, 1, 1,
0.4872869, -2.528242, 2.942172, 1, 1, 1, 1, 1,
0.488812, 1.162623, 0.7275301, 1, 1, 1, 1, 1,
0.4940835, -0.6357337, 3.674576, 0, 0, 1, 1, 1,
0.5026793, -0.658932, 2.938446, 1, 0, 0, 1, 1,
0.503045, -2.131075, 3.555068, 1, 0, 0, 1, 1,
0.5046067, -0.02050206, 1.220134, 1, 0, 0, 1, 1,
0.5064251, 1.566341, 2.465634, 1, 0, 0, 1, 1,
0.5081718, -0.7633472, 2.773487, 1, 0, 0, 1, 1,
0.5097569, -0.5589833, 3.206896, 0, 0, 0, 1, 1,
0.5100068, -0.1711661, 2.14449, 0, 0, 0, 1, 1,
0.5126237, 0.2503421, -0.8209891, 0, 0, 0, 1, 1,
0.5191228, 1.61681, 1.169209, 0, 0, 0, 1, 1,
0.5204996, -0.6024156, 0.7613952, 0, 0, 0, 1, 1,
0.5224351, -0.3792714, 1.86382, 0, 0, 0, 1, 1,
0.5284919, -0.7156838, 2.665372, 0, 0, 0, 1, 1,
0.5299941, -1.269947, 3.301014, 1, 1, 1, 1, 1,
0.5302104, 0.8024859, 1.14671, 1, 1, 1, 1, 1,
0.5338521, -0.7662326, 4.034915, 1, 1, 1, 1, 1,
0.5350384, -1.344145, 4.758366, 1, 1, 1, 1, 1,
0.5391065, -1.384207, 1.814095, 1, 1, 1, 1, 1,
0.5413536, 1.642462, -0.704307, 1, 1, 1, 1, 1,
0.5506958, 0.168549, 2.208756, 1, 1, 1, 1, 1,
0.5547612, 0.8627559, 0.966647, 1, 1, 1, 1, 1,
0.5599486, -0.03689416, 2.771031, 1, 1, 1, 1, 1,
0.564794, -0.762143, 2.917803, 1, 1, 1, 1, 1,
0.5650464, 1.686561, 1.761783, 1, 1, 1, 1, 1,
0.5675036, -0.1906258, 1.876699, 1, 1, 1, 1, 1,
0.5683473, 0.1531718, 2.147095, 1, 1, 1, 1, 1,
0.5724805, -0.5415993, 2.170089, 1, 1, 1, 1, 1,
0.5801354, 0.04973601, 0.8012533, 1, 1, 1, 1, 1,
0.5808122, -2.342917, 2.414324, 0, 0, 1, 1, 1,
0.5813112, 0.2829232, 0.471433, 1, 0, 0, 1, 1,
0.5851991, -1.285388, 2.150107, 1, 0, 0, 1, 1,
0.5874981, 0.3751767, 2.831582, 1, 0, 0, 1, 1,
0.5904347, -0.07037015, 1.214133, 1, 0, 0, 1, 1,
0.5946583, -0.2856303, -0.1521273, 1, 0, 0, 1, 1,
0.5959769, 0.5501097, 1.781639, 0, 0, 0, 1, 1,
0.5965006, 0.6528345, -0.02672642, 0, 0, 0, 1, 1,
0.6014615, 1.487573, 0.7358267, 0, 0, 0, 1, 1,
0.6159045, -1.26017, 3.719215, 0, 0, 0, 1, 1,
0.6163137, 1.081257, -0.2269966, 0, 0, 0, 1, 1,
0.6187664, 2.339896, 1.494011, 0, 0, 0, 1, 1,
0.619992, -0.7589099, 1.21325, 0, 0, 0, 1, 1,
0.6204799, 0.02625709, -0.2357385, 1, 1, 1, 1, 1,
0.623385, 0.157855, 1.490398, 1, 1, 1, 1, 1,
0.625747, -0.5733703, 2.073483, 1, 1, 1, 1, 1,
0.6265495, 0.1588238, 1.707903, 1, 1, 1, 1, 1,
0.6291685, 0.8190729, 0.2447044, 1, 1, 1, 1, 1,
0.6303635, -0.7016191, 2.20856, 1, 1, 1, 1, 1,
0.6307104, 0.3089033, 1.93497, 1, 1, 1, 1, 1,
0.6326866, -2.167462, 3.053707, 1, 1, 1, 1, 1,
0.6335609, 0.8044276, 0.9962511, 1, 1, 1, 1, 1,
0.6337907, -1.127774, 2.801191, 1, 1, 1, 1, 1,
0.6410199, 0.7183723, -0.8188428, 1, 1, 1, 1, 1,
0.6417458, 0.7424331, 0.7490159, 1, 1, 1, 1, 1,
0.6444265, -0.2697531, 1.300514, 1, 1, 1, 1, 1,
0.6447511, -0.9379964, 3.04866, 1, 1, 1, 1, 1,
0.644767, -1.078277, 1.772694, 1, 1, 1, 1, 1,
0.6478823, -0.7118086, 4.152566, 0, 0, 1, 1, 1,
0.6566594, -0.4521928, 3.087348, 1, 0, 0, 1, 1,
0.6572728, 1.14349, 2.230355, 1, 0, 0, 1, 1,
0.661917, -0.8455456, 0.1252896, 1, 0, 0, 1, 1,
0.6627896, -1.148503, 2.379494, 1, 0, 0, 1, 1,
0.6651953, 1.572818, -0.3246618, 1, 0, 0, 1, 1,
0.6655562, 0.8093444, 2.017553, 0, 0, 0, 1, 1,
0.6659735, 0.182351, 0.94896, 0, 0, 0, 1, 1,
0.6707443, 0.439969, -0.3416235, 0, 0, 0, 1, 1,
0.6724855, 0.6715576, 1.485866, 0, 0, 0, 1, 1,
0.6736715, -1.374034, 1.307665, 0, 0, 0, 1, 1,
0.6745499, 0.5642952, -0.01561995, 0, 0, 0, 1, 1,
0.6751742, -2.198361, 4.676595, 0, 0, 0, 1, 1,
0.6753948, 0.6790512, 1.599356, 1, 1, 1, 1, 1,
0.6784806, -0.5034455, 2.216181, 1, 1, 1, 1, 1,
0.6824737, 1.567623, 0.7223007, 1, 1, 1, 1, 1,
0.6849514, -0.7295806, 2.352715, 1, 1, 1, 1, 1,
0.6853989, 0.6933998, 2.194184, 1, 1, 1, 1, 1,
0.6865655, -0.1502768, 1.521069, 1, 1, 1, 1, 1,
0.688046, -1.498105, 2.414165, 1, 1, 1, 1, 1,
0.693594, 0.6545658, 1.018818, 1, 1, 1, 1, 1,
0.69491, -0.9305003, 0.4416944, 1, 1, 1, 1, 1,
0.6991711, 0.424047, 1.332222, 1, 1, 1, 1, 1,
0.7029076, -0.6250741, 1.247491, 1, 1, 1, 1, 1,
0.7138593, 1.063316, 0.2524984, 1, 1, 1, 1, 1,
0.714193, -0.03502839, 2.402158, 1, 1, 1, 1, 1,
0.7168511, -0.7955502, 2.604729, 1, 1, 1, 1, 1,
0.718481, -0.1964631, 1.223428, 1, 1, 1, 1, 1,
0.7228327, -0.4317873, 3.15266, 0, 0, 1, 1, 1,
0.7349514, 0.287953, 2.471289, 1, 0, 0, 1, 1,
0.7350234, -0.7068599, 2.225974, 1, 0, 0, 1, 1,
0.7361298, 1.257393, -0.6969837, 1, 0, 0, 1, 1,
0.7388121, 1.521074, 1.020241, 1, 0, 0, 1, 1,
0.750595, 0.4833983, 1.247776, 1, 0, 0, 1, 1,
0.7543056, -2.050557, 4.501441, 0, 0, 0, 1, 1,
0.7555873, 2.544329, 2.68264, 0, 0, 0, 1, 1,
0.7589918, 2.406781, 0.3063403, 0, 0, 0, 1, 1,
0.7617738, -1.159023, 3.437236, 0, 0, 0, 1, 1,
0.7651168, 1.356118, 1.482022, 0, 0, 0, 1, 1,
0.7653102, -0.9995921, 3.66791, 0, 0, 0, 1, 1,
0.7695283, 0.4051249, 0.1040434, 0, 0, 0, 1, 1,
0.7708579, -0.7008407, 1.824559, 1, 1, 1, 1, 1,
0.7741904, -1.024722, 3.385518, 1, 1, 1, 1, 1,
0.7768494, 0.5236571, -1.022188, 1, 1, 1, 1, 1,
0.7825831, -0.9127066, 2.313569, 1, 1, 1, 1, 1,
0.7848999, -2.478557, 1.750883, 1, 1, 1, 1, 1,
0.7861491, 0.237078, 0.8718958, 1, 1, 1, 1, 1,
0.7952712, 1.554114, 0.1435508, 1, 1, 1, 1, 1,
0.7986427, 1.065028, 0.8922281, 1, 1, 1, 1, 1,
0.8028752, 0.7227454, 1.07746, 1, 1, 1, 1, 1,
0.8040541, 1.54639, -0.1547989, 1, 1, 1, 1, 1,
0.8054653, -0.3646315, 2.489997, 1, 1, 1, 1, 1,
0.8136188, 0.01998821, 1.25262, 1, 1, 1, 1, 1,
0.8141461, 1.117562, 0.8812901, 1, 1, 1, 1, 1,
0.8183822, -1.287224, 1.858731, 1, 1, 1, 1, 1,
0.823251, -0.3735547, 1.775881, 1, 1, 1, 1, 1,
0.8232765, 0.6787744, -0.08614156, 0, 0, 1, 1, 1,
0.827011, 1.473779, 0.05247166, 1, 0, 0, 1, 1,
0.8313798, -0.06990685, 1.739257, 1, 0, 0, 1, 1,
0.8316403, -1.514116, 2.223083, 1, 0, 0, 1, 1,
0.83555, -1.0394, 1.265669, 1, 0, 0, 1, 1,
0.8415703, 0.4398199, 1.002956, 1, 0, 0, 1, 1,
0.8555381, -1.531336, 1.435884, 0, 0, 0, 1, 1,
0.8589168, -1.229144, 3.257062, 0, 0, 0, 1, 1,
0.8655571, -1.010494, 4.039267, 0, 0, 0, 1, 1,
0.868022, -0.8196274, 2.918376, 0, 0, 0, 1, 1,
0.8688139, 0.3236392, -0.1426429, 0, 0, 0, 1, 1,
0.8691599, -0.1244685, 1.466349, 0, 0, 0, 1, 1,
0.8717589, 1.611703, 2.099699, 0, 0, 0, 1, 1,
0.8787668, -1.261842, 1.787441, 1, 1, 1, 1, 1,
0.8815703, 0.796943, 0.03391118, 1, 1, 1, 1, 1,
0.8846005, -0.7993543, 2.387017, 1, 1, 1, 1, 1,
0.886615, 2.277409, 1.526438, 1, 1, 1, 1, 1,
0.8972314, -0.5011559, 2.433525, 1, 1, 1, 1, 1,
0.8988168, 1.173657, 1.087916, 1, 1, 1, 1, 1,
0.9034284, -0.3637646, 0.9357174, 1, 1, 1, 1, 1,
0.9035825, 0.6410543, 1.463578, 1, 1, 1, 1, 1,
0.9042828, 0.733067, -0.4802858, 1, 1, 1, 1, 1,
0.9046338, 0.4810362, 1.404038, 1, 1, 1, 1, 1,
0.9096033, -0.9385042, 1.897617, 1, 1, 1, 1, 1,
0.913107, 0.4355287, 0.8466371, 1, 1, 1, 1, 1,
0.9140567, -0.5406859, 0.0895142, 1, 1, 1, 1, 1,
0.9173093, 2.448789, 0.3417728, 1, 1, 1, 1, 1,
0.9179043, 0.05062698, -0.2282338, 1, 1, 1, 1, 1,
0.9203626, 0.248568, 0.7147291, 0, 0, 1, 1, 1,
0.9242876, -2.209451, 2.74129, 1, 0, 0, 1, 1,
0.9258625, 1.786652, 2.04094, 1, 0, 0, 1, 1,
0.9283553, -0.1259314, 0.9043784, 1, 0, 0, 1, 1,
0.9287364, 0.3840649, 0.7577121, 1, 0, 0, 1, 1,
0.9330115, -0.4135828, 2.626633, 1, 0, 0, 1, 1,
0.9331924, 1.74669, -0.05963305, 0, 0, 0, 1, 1,
0.9335853, 0.1657765, 0.9530683, 0, 0, 0, 1, 1,
0.9351936, 0.6189472, 2.293079, 0, 0, 0, 1, 1,
0.9371737, -0.3003323, 2.612424, 0, 0, 0, 1, 1,
0.9418266, 0.8815804, 1.065644, 0, 0, 0, 1, 1,
0.9453141, -0.03372128, 0.530435, 0, 0, 0, 1, 1,
0.9454328, -1.620305, 3.906792, 0, 0, 0, 1, 1,
0.9484179, 1.741634, -0.6802545, 1, 1, 1, 1, 1,
0.9610796, 2.334051, -0.00548766, 1, 1, 1, 1, 1,
0.9622124, 1.103528, 0.1408388, 1, 1, 1, 1, 1,
0.9657161, -0.6907879, 0.6916141, 1, 1, 1, 1, 1,
0.9678324, -2.568417, 2.189319, 1, 1, 1, 1, 1,
0.9754247, -1.761685, 2.645412, 1, 1, 1, 1, 1,
0.9772817, 0.4923583, 0.04561771, 1, 1, 1, 1, 1,
0.9791499, -0.4379582, 2.354721, 1, 1, 1, 1, 1,
0.9907916, -2.088106, 2.240358, 1, 1, 1, 1, 1,
1.000513, -0.942918, 2.637791, 1, 1, 1, 1, 1,
1.00163, -1.439031, 2.99784, 1, 1, 1, 1, 1,
1.003624, 0.5680918, 0.4680691, 1, 1, 1, 1, 1,
1.004311, -0.1902277, 1.387894, 1, 1, 1, 1, 1,
1.004745, -0.5606273, 2.284388, 1, 1, 1, 1, 1,
1.008963, -1.649275, 1.167924, 1, 1, 1, 1, 1,
1.012328, -1.261615, 4.282403, 0, 0, 1, 1, 1,
1.020887, -1.275807, 2.588538, 1, 0, 0, 1, 1,
1.030508, 0.7506061, 0.6796098, 1, 0, 0, 1, 1,
1.030755, 0.7968457, 1.432394, 1, 0, 0, 1, 1,
1.032617, -0.3524026, 1.334848, 1, 0, 0, 1, 1,
1.037932, -0.9424136, 1.421634, 1, 0, 0, 1, 1,
1.047978, 0.4641759, -0.7737234, 0, 0, 0, 1, 1,
1.05229, 0.7618343, 0.5199618, 0, 0, 0, 1, 1,
1.052539, -0.8454858, 2.657833, 0, 0, 0, 1, 1,
1.055839, 1.116401, 0.6656054, 0, 0, 0, 1, 1,
1.057451, 1.286119, 0.7054785, 0, 0, 0, 1, 1,
1.061117, 0.4972302, 0.5332808, 0, 0, 0, 1, 1,
1.06204, 1.399052, 1.23739, 0, 0, 0, 1, 1,
1.066206, 1.277227, -1.60777, 1, 1, 1, 1, 1,
1.069427, -0.6542816, 1.648413, 1, 1, 1, 1, 1,
1.070258, 1.326862, 1.396457, 1, 1, 1, 1, 1,
1.074546, -0.1377836, 1.64797, 1, 1, 1, 1, 1,
1.074682, 0.005134406, 1.3999, 1, 1, 1, 1, 1,
1.086667, 0.2307308, 2.553869, 1, 1, 1, 1, 1,
1.088131, 0.6747332, 1.287494, 1, 1, 1, 1, 1,
1.09431, -1.481612, 2.917086, 1, 1, 1, 1, 1,
1.097577, 0.459214, 2.158518, 1, 1, 1, 1, 1,
1.099176, 0.1916539, 1.498241, 1, 1, 1, 1, 1,
1.100297, -1.566773, 2.884712, 1, 1, 1, 1, 1,
1.103867, -0.7368228, 1.554554, 1, 1, 1, 1, 1,
1.10448, -0.5092137, 2.823237, 1, 1, 1, 1, 1,
1.107827, 1.169913, 0.8088702, 1, 1, 1, 1, 1,
1.10872, 0.1856611, 3.674029, 1, 1, 1, 1, 1,
1.108868, 1.184288, -0.07244662, 0, 0, 1, 1, 1,
1.109225, -2.082225, 2.812979, 1, 0, 0, 1, 1,
1.114585, 0.2841267, 2.733052, 1, 0, 0, 1, 1,
1.117156, -0.8114887, 2.543681, 1, 0, 0, 1, 1,
1.117307, -0.8734431, 1.426232, 1, 0, 0, 1, 1,
1.120084, 0.3004539, 1.516347, 1, 0, 0, 1, 1,
1.134299, 0.1786215, 1.037379, 0, 0, 0, 1, 1,
1.135937, -2.604082, 2.435604, 0, 0, 0, 1, 1,
1.140628, -0.6651467, 1.604623, 0, 0, 0, 1, 1,
1.145696, -0.3469671, 0.6360658, 0, 0, 0, 1, 1,
1.147625, 0.1736724, 3.686565, 0, 0, 0, 1, 1,
1.148919, 1.483374, 1.192101, 0, 0, 0, 1, 1,
1.159024, -2.265078, 2.861165, 0, 0, 0, 1, 1,
1.159918, -0.1301905, 2.106078, 1, 1, 1, 1, 1,
1.164718, -0.574592, 1.243885, 1, 1, 1, 1, 1,
1.16544, 0.0759586, 3.630379, 1, 1, 1, 1, 1,
1.165457, 0.9436461, -0.5464147, 1, 1, 1, 1, 1,
1.189342, 0.2793155, 3.227974, 1, 1, 1, 1, 1,
1.194957, -0.1828467, 0.1767514, 1, 1, 1, 1, 1,
1.201384, -0.8846714, 2.208257, 1, 1, 1, 1, 1,
1.205183, -0.6435351, 2.205357, 1, 1, 1, 1, 1,
1.208531, 0.4594657, 0.8332746, 1, 1, 1, 1, 1,
1.209463, 0.06730952, 0.006715882, 1, 1, 1, 1, 1,
1.210292, -1.430295, 3.318632, 1, 1, 1, 1, 1,
1.215569, -0.2923102, 0.2581714, 1, 1, 1, 1, 1,
1.221167, 0.516906, 1.971312, 1, 1, 1, 1, 1,
1.223439, -0.191283, 1.330843, 1, 1, 1, 1, 1,
1.22686, 0.01242089, -0.2701697, 1, 1, 1, 1, 1,
1.227286, -0.1008155, 1.97922, 0, 0, 1, 1, 1,
1.228998, -0.5758538, 2.425114, 1, 0, 0, 1, 1,
1.23034, 0.5996749, 0.9952777, 1, 0, 0, 1, 1,
1.243057, -0.01180986, 2.142976, 1, 0, 0, 1, 1,
1.243546, -1.228189, 2.07319, 1, 0, 0, 1, 1,
1.244691, 0.1375523, 3.503469, 1, 0, 0, 1, 1,
1.247653, 0.01086978, 1.020578, 0, 0, 0, 1, 1,
1.247755, 0.1236761, 0.7305582, 0, 0, 0, 1, 1,
1.256307, -0.02032181, 2.260544, 0, 0, 0, 1, 1,
1.256518, 0.4215826, -0.7103291, 0, 0, 0, 1, 1,
1.260445, -0.6033825, 0.6724656, 0, 0, 0, 1, 1,
1.263388, 1.339345, 0.1103677, 0, 0, 0, 1, 1,
1.265581, -0.8056072, 1.694471, 0, 0, 0, 1, 1,
1.273656, 1.6556, -0.663643, 1, 1, 1, 1, 1,
1.279648, 0.6929483, 1.433636, 1, 1, 1, 1, 1,
1.291797, -1.948488, 2.227146, 1, 1, 1, 1, 1,
1.29348, 1.164461, 0.559607, 1, 1, 1, 1, 1,
1.296533, 0.5457913, -0.2815756, 1, 1, 1, 1, 1,
1.298215, -1.240781, 3.674068, 1, 1, 1, 1, 1,
1.313115, -1.285031, 3.347104, 1, 1, 1, 1, 1,
1.315528, 1.675813, -1.542453, 1, 1, 1, 1, 1,
1.318144, -0.4309775, 0.972805, 1, 1, 1, 1, 1,
1.334149, -0.4187969, 1.235954, 1, 1, 1, 1, 1,
1.341962, -0.03679032, 2.006117, 1, 1, 1, 1, 1,
1.344176, -0.9880916, 1.369663, 1, 1, 1, 1, 1,
1.34527, 1.290153, 2.190338, 1, 1, 1, 1, 1,
1.349774, 0.2120864, 1.492914, 1, 1, 1, 1, 1,
1.356557, -0.2790786, 3.301519, 1, 1, 1, 1, 1,
1.358465, 0.750437, 1.648197, 0, 0, 1, 1, 1,
1.360298, -0.8923549, 2.531339, 1, 0, 0, 1, 1,
1.378886, -0.5230362, 2.782187, 1, 0, 0, 1, 1,
1.379593, -0.5625591, 3.068191, 1, 0, 0, 1, 1,
1.38492, -0.05595974, 1.352669, 1, 0, 0, 1, 1,
1.393025, 0.1534541, 1.258551, 1, 0, 0, 1, 1,
1.395322, -0.5350758, 2.543593, 0, 0, 0, 1, 1,
1.395606, -1.361138, 3.666452, 0, 0, 0, 1, 1,
1.398785, -0.3907874, 2.058599, 0, 0, 0, 1, 1,
1.404137, 2.511889, 0.5136223, 0, 0, 0, 1, 1,
1.421658, 0.8645752, 1.253489, 0, 0, 0, 1, 1,
1.422251, 1.206177, 2.279869, 0, 0, 0, 1, 1,
1.43447, -0.2106932, 2.617418, 0, 0, 0, 1, 1,
1.449463, -1.970024, 4.565478, 1, 1, 1, 1, 1,
1.464741, -0.186575, 1.47183, 1, 1, 1, 1, 1,
1.465177, -1.018467, 1.337756, 1, 1, 1, 1, 1,
1.46849, -0.1293932, 2.414689, 1, 1, 1, 1, 1,
1.475918, 1.004823, -0.1786084, 1, 1, 1, 1, 1,
1.477012, -2.074457, 4.959471, 1, 1, 1, 1, 1,
1.477541, 0.5541813, 0.2135514, 1, 1, 1, 1, 1,
1.495751, 1.626568, 3.245298, 1, 1, 1, 1, 1,
1.506238, 1.015254, 2.952165, 1, 1, 1, 1, 1,
1.515637, -0.3161153, 0.3343, 1, 1, 1, 1, 1,
1.535688, 0.4717488, 0.3161401, 1, 1, 1, 1, 1,
1.537141, -0.9011606, 0.2521271, 1, 1, 1, 1, 1,
1.551209, 0.1320337, 1.083086, 1, 1, 1, 1, 1,
1.556705, 0.5649915, 1.643293, 1, 1, 1, 1, 1,
1.560169, 0.3073866, 2.396493, 1, 1, 1, 1, 1,
1.560661, -0.5827283, 1.374965, 0, 0, 1, 1, 1,
1.561906, 0.2922378, 1.068654, 1, 0, 0, 1, 1,
1.571, -0.7880211, 1.307975, 1, 0, 0, 1, 1,
1.574358, 0.2747624, 2.041383, 1, 0, 0, 1, 1,
1.580417, -1.919475, 2.327403, 1, 0, 0, 1, 1,
1.611493, 0.26412, 0.9637454, 1, 0, 0, 1, 1,
1.616339, -1.388673, 1.272848, 0, 0, 0, 1, 1,
1.618135, -1.334045, 1.998689, 0, 0, 0, 1, 1,
1.618666, 1.027872, 1.868831, 0, 0, 0, 1, 1,
1.618868, 2.268714, 0.007634875, 0, 0, 0, 1, 1,
1.620782, -0.8059598, 1.214377, 0, 0, 0, 1, 1,
1.648343, 1.818002, -0.05882818, 0, 0, 0, 1, 1,
1.663675, 0.2888405, 1.330904, 0, 0, 0, 1, 1,
1.679501, -0.5213655, 3.937461, 1, 1, 1, 1, 1,
1.692722, -0.7802922, 3.259461, 1, 1, 1, 1, 1,
1.727647, -0.8820589, 1.826196, 1, 1, 1, 1, 1,
1.732988, 1.220609, 1.60874, 1, 1, 1, 1, 1,
1.768072, 0.887323, 0.9642292, 1, 1, 1, 1, 1,
1.776195, 0.2710037, -0.1726623, 1, 1, 1, 1, 1,
1.817616, -0.5229059, 1.427145, 1, 1, 1, 1, 1,
1.846883, -0.6777896, 1.61809, 1, 1, 1, 1, 1,
1.87101, -0.4435128, 1.302306, 1, 1, 1, 1, 1,
1.920905, -0.8311337, 2.67499, 1, 1, 1, 1, 1,
1.925662, -1.020187, 4.366693, 1, 1, 1, 1, 1,
1.942964, -0.1182347, 0.9050011, 1, 1, 1, 1, 1,
1.943053, 0.05008487, 1.255758, 1, 1, 1, 1, 1,
1.946691, 0.9422007, 0.6385124, 1, 1, 1, 1, 1,
1.987921, -2.793759, 1.341301, 1, 1, 1, 1, 1,
1.988734, -0.1062838, 0.4851141, 0, 0, 1, 1, 1,
2.01983, -0.02722849, 0.09583083, 1, 0, 0, 1, 1,
2.042279, 0.9392077, 0.3716672, 1, 0, 0, 1, 1,
2.042295, -0.3227785, 0.1860579, 1, 0, 0, 1, 1,
2.139108, 0.04052117, 0.5599191, 1, 0, 0, 1, 1,
2.14754, 0.464989, 1.822958, 1, 0, 0, 1, 1,
2.152919, -1.000564, 1.603621, 0, 0, 0, 1, 1,
2.180253, -0.8681502, 1.169179, 0, 0, 0, 1, 1,
2.180603, -0.130702, 2.520236, 0, 0, 0, 1, 1,
2.279822, 0.5092638, 1.506776, 0, 0, 0, 1, 1,
2.292758, -1.811141, 0.3368661, 0, 0, 0, 1, 1,
2.355199, 0.4233823, 1.290616, 0, 0, 0, 1, 1,
2.356445, -0.1608883, 1.281186, 0, 0, 0, 1, 1,
2.369251, 1.466684, -0.1425524, 1, 1, 1, 1, 1,
2.377521, 0.1509017, 1.420796, 1, 1, 1, 1, 1,
2.680171, 1.343562, 2.480949, 1, 1, 1, 1, 1,
2.680172, -1.615018, 2.845387, 1, 1, 1, 1, 1,
2.722703, 2.09062, 0.9306237, 1, 1, 1, 1, 1,
2.830849, -0.342663, 1.424932, 1, 1, 1, 1, 1,
3.399305, 0.722819, 2.581073, 1, 1, 1, 1, 1
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
var radius = 9.67032;
var distance = 33.96659;
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
mvMatrix.translate( -0.07797909, 0.1751964, -0.04542756 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96659);
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
