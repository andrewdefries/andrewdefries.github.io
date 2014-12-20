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
-2.980393, -0.3436745, -3.231159, 1, 0, 0, 1,
-2.659933, 0.2723716, -0.3709328, 1, 0.007843138, 0, 1,
-2.651497, -0.5507483, -2.350845, 1, 0.01176471, 0, 1,
-2.610861, -0.600174, -0.04919564, 1, 0.01960784, 0, 1,
-2.56285, -0.3841708, -2.695604, 1, 0.02352941, 0, 1,
-2.502621, -0.8045899, -2.02811, 1, 0.03137255, 0, 1,
-2.459914, 0.03818724, -1.080688, 1, 0.03529412, 0, 1,
-2.432356, 0.870312, -1.078744, 1, 0.04313726, 0, 1,
-2.421815, 1.187243, 0.06998323, 1, 0.04705882, 0, 1,
-2.399535, 0.3215853, -0.8821236, 1, 0.05490196, 0, 1,
-2.385573, -1.839178, -2.738387, 1, 0.05882353, 0, 1,
-2.338157, 0.02197809, -0.2060214, 1, 0.06666667, 0, 1,
-2.309798, 0.6888462, -2.09587, 1, 0.07058824, 0, 1,
-2.249393, -2.359542, -1.79602, 1, 0.07843138, 0, 1,
-2.231618, -0.02020457, -1.53168, 1, 0.08235294, 0, 1,
-2.216291, 0.8329039, -1.998376, 1, 0.09019608, 0, 1,
-2.115964, -0.7102648, -1.76574, 1, 0.09411765, 0, 1,
-2.1151, 1.077317, -1.993799, 1, 0.1019608, 0, 1,
-2.062788, -0.7121465, 0.2819481, 1, 0.1098039, 0, 1,
-2.041865, -1.179184, -3.673913, 1, 0.1137255, 0, 1,
-2.039482, 0.3848085, -2.135314, 1, 0.1215686, 0, 1,
-2.036504, -0.04544232, -1.745463, 1, 0.1254902, 0, 1,
-2.027869, 0.3510658, -0.787508, 1, 0.1333333, 0, 1,
-2.023479, -0.6521339, -2.087656, 1, 0.1372549, 0, 1,
-2.013356, -0.3921905, -1.601011, 1, 0.145098, 0, 1,
-1.99863, 0.2100105, -0.1697931, 1, 0.1490196, 0, 1,
-1.993337, -1.277371, -1.622727, 1, 0.1568628, 0, 1,
-1.983245, -0.04431313, -0.3614567, 1, 0.1607843, 0, 1,
-1.972161, 0.72216, 0.8689477, 1, 0.1686275, 0, 1,
-1.962337, 0.5721694, -0.5696086, 1, 0.172549, 0, 1,
-1.941706, -0.8671647, -0.4868469, 1, 0.1803922, 0, 1,
-1.939853, -0.2239822, -0.5814565, 1, 0.1843137, 0, 1,
-1.934464, -2.021902, -1.709075, 1, 0.1921569, 0, 1,
-1.90885, -0.4386051, -1.052885, 1, 0.1960784, 0, 1,
-1.865102, 0.4279072, -2.306757, 1, 0.2039216, 0, 1,
-1.858759, 0.7244679, -2.064593, 1, 0.2117647, 0, 1,
-1.851076, 0.1962944, -0.5566221, 1, 0.2156863, 0, 1,
-1.822683, 0.01775358, -2.949589, 1, 0.2235294, 0, 1,
-1.803215, 0.6029122, 0.06947824, 1, 0.227451, 0, 1,
-1.778323, -1.295874, 0.2389633, 1, 0.2352941, 0, 1,
-1.774297, 1.164219, 0.2220883, 1, 0.2392157, 0, 1,
-1.755779, 0.3226257, -1.421754, 1, 0.2470588, 0, 1,
-1.713953, 0.9420221, -0.1235613, 1, 0.2509804, 0, 1,
-1.710659, 1.693548, 0.4857063, 1, 0.2588235, 0, 1,
-1.702266, -0.6960124, -2.832175, 1, 0.2627451, 0, 1,
-1.699323, 0.2612112, -0.2046549, 1, 0.2705882, 0, 1,
-1.691629, -0.4797275, -2.120588, 1, 0.2745098, 0, 1,
-1.687054, -1.159509, -0.6795318, 1, 0.282353, 0, 1,
-1.674426, -0.9031501, -2.902904, 1, 0.2862745, 0, 1,
-1.656468, 0.4991661, -1.143285, 1, 0.2941177, 0, 1,
-1.655902, -0.1714261, -1.742602, 1, 0.3019608, 0, 1,
-1.652731, 0.930488, -0.722986, 1, 0.3058824, 0, 1,
-1.608599, -0.1499951, -2.052388, 1, 0.3137255, 0, 1,
-1.594124, 0.6145352, -0.007302205, 1, 0.3176471, 0, 1,
-1.586645, -0.3808642, -0.4361657, 1, 0.3254902, 0, 1,
-1.576479, -0.01484092, -2.381375, 1, 0.3294118, 0, 1,
-1.561571, 1.258944, -2.592899, 1, 0.3372549, 0, 1,
-1.559585, 1.090384, -0.2652649, 1, 0.3411765, 0, 1,
-1.555583, -0.1244158, -1.476712, 1, 0.3490196, 0, 1,
-1.537414, 0.2832896, -1.578801, 1, 0.3529412, 0, 1,
-1.535001, 0.5382273, -2.296685, 1, 0.3607843, 0, 1,
-1.530333, -0.7028135, -2.702113, 1, 0.3647059, 0, 1,
-1.529244, 1.896499, 0.5358913, 1, 0.372549, 0, 1,
-1.523871, 0.4454888, -2.037348, 1, 0.3764706, 0, 1,
-1.514669, -0.8036206, -0.888828, 1, 0.3843137, 0, 1,
-1.512529, -0.561052, -0.09827912, 1, 0.3882353, 0, 1,
-1.507246, 0.1993437, -1.210305, 1, 0.3960784, 0, 1,
-1.504573, 1.316485, -0.4608305, 1, 0.4039216, 0, 1,
-1.497968, 0.5206472, 0.4506912, 1, 0.4078431, 0, 1,
-1.497394, -0.158784, 0.1286626, 1, 0.4156863, 0, 1,
-1.490859, -0.02598519, -2.078918, 1, 0.4196078, 0, 1,
-1.489426, 0.7256054, -2.535469, 1, 0.427451, 0, 1,
-1.486128, 0.2259677, -2.58162, 1, 0.4313726, 0, 1,
-1.479608, 1.046311, -1.684211, 1, 0.4392157, 0, 1,
-1.477526, -0.5568702, -1.230641, 1, 0.4431373, 0, 1,
-1.477359, 0.8702653, -2.266217, 1, 0.4509804, 0, 1,
-1.4591, 0.1778184, -2.447326, 1, 0.454902, 0, 1,
-1.456165, 1.297213, -1.779012, 1, 0.4627451, 0, 1,
-1.452871, 0.009398331, -1.396211, 1, 0.4666667, 0, 1,
-1.444435, -2.304773, -1.88524, 1, 0.4745098, 0, 1,
-1.443839, 1.916322, -0.9321051, 1, 0.4784314, 0, 1,
-1.435294, -0.6101544, -1.936368, 1, 0.4862745, 0, 1,
-1.431542, -0.76037, -0.9433485, 1, 0.4901961, 0, 1,
-1.431217, 1.014017, 0.03928188, 1, 0.4980392, 0, 1,
-1.430855, -1.112625, -2.902024, 1, 0.5058824, 0, 1,
-1.429801, 0.2412819, -1.331451, 1, 0.509804, 0, 1,
-1.42693, -0.6075024, -2.126321, 1, 0.5176471, 0, 1,
-1.420305, -0.608553, -1.770335, 1, 0.5215687, 0, 1,
-1.407987, 0.1951604, -3.579463, 1, 0.5294118, 0, 1,
-1.393302, -0.1819119, -0.9532914, 1, 0.5333334, 0, 1,
-1.392189, -0.2746369, -2.144999, 1, 0.5411765, 0, 1,
-1.388961, -0.704968, -3.096427, 1, 0.5450981, 0, 1,
-1.375813, -0.3615202, -1.579322, 1, 0.5529412, 0, 1,
-1.372421, -0.6474747, -2.856118, 1, 0.5568628, 0, 1,
-1.358247, 1.207764, -1.9964, 1, 0.5647059, 0, 1,
-1.345259, 0.1371789, -1.005658, 1, 0.5686275, 0, 1,
-1.331178, 0.9700133, -1.890289, 1, 0.5764706, 0, 1,
-1.327565, -2.33197, -2.565017, 1, 0.5803922, 0, 1,
-1.320988, -1.331609, -3.056634, 1, 0.5882353, 0, 1,
-1.309321, -0.5958135, -1.865607, 1, 0.5921569, 0, 1,
-1.309192, 0.7334697, -1.211769, 1, 0.6, 0, 1,
-1.309055, -0.4107708, -1.664612, 1, 0.6078432, 0, 1,
-1.299244, 1.704892, -1.149872, 1, 0.6117647, 0, 1,
-1.297051, -1.244521, -2.194694, 1, 0.6196079, 0, 1,
-1.28773, -0.8408171, -3.185433, 1, 0.6235294, 0, 1,
-1.285132, 1.114099, -2.299632, 1, 0.6313726, 0, 1,
-1.281837, -0.8168124, -0.8372027, 1, 0.6352941, 0, 1,
-1.273777, -0.01182386, -3.253345, 1, 0.6431373, 0, 1,
-1.272925, 0.7470133, 0.1776142, 1, 0.6470588, 0, 1,
-1.27221, 0.003123361, 0.3348431, 1, 0.654902, 0, 1,
-1.26913, -0.3910168, -2.767891, 1, 0.6588235, 0, 1,
-1.267543, -0.1172504, -2.389208, 1, 0.6666667, 0, 1,
-1.26228, -0.9494374, -1.855085, 1, 0.6705883, 0, 1,
-1.257463, -0.3041768, -0.9311132, 1, 0.6784314, 0, 1,
-1.256068, -0.1725495, -2.54114, 1, 0.682353, 0, 1,
-1.252761, -1.444754, -3.23156, 1, 0.6901961, 0, 1,
-1.244448, 0.250905, -1.943818, 1, 0.6941177, 0, 1,
-1.22722, -0.5190565, -2.244767, 1, 0.7019608, 0, 1,
-1.219509, 1.811013, -1.504547, 1, 0.7098039, 0, 1,
-1.217501, -0.7009989, -2.364315, 1, 0.7137255, 0, 1,
-1.200402, 0.1268988, 0.8972035, 1, 0.7215686, 0, 1,
-1.1918, 1.156162, -1.762686, 1, 0.7254902, 0, 1,
-1.183852, 0.412613, 0.03850324, 1, 0.7333333, 0, 1,
-1.178692, -0.3700713, -0.318451, 1, 0.7372549, 0, 1,
-1.173789, -1.10532, -1.325844, 1, 0.7450981, 0, 1,
-1.166577, 0.3005577, -1.420962, 1, 0.7490196, 0, 1,
-1.16598, 1.720663, -0.3072179, 1, 0.7568628, 0, 1,
-1.164474, 0.01139313, -1.816115, 1, 0.7607843, 0, 1,
-1.16167, 0.4703913, -1.90101, 1, 0.7686275, 0, 1,
-1.16083, -2.363704, -4.535764, 1, 0.772549, 0, 1,
-1.159608, 1.103273, 0.9578541, 1, 0.7803922, 0, 1,
-1.151046, 0.2519774, -0.3487385, 1, 0.7843137, 0, 1,
-1.150027, 0.07180696, -0.3579238, 1, 0.7921569, 0, 1,
-1.137248, -0.4561476, 0.7309113, 1, 0.7960784, 0, 1,
-1.134949, -1.475343, -2.591419, 1, 0.8039216, 0, 1,
-1.134371, -1.192867, -3.827485, 1, 0.8117647, 0, 1,
-1.133445, 0.5185068, -0.06832644, 1, 0.8156863, 0, 1,
-1.130696, -0.3822759, -4.053164, 1, 0.8235294, 0, 1,
-1.128689, -1.57004, -2.998368, 1, 0.827451, 0, 1,
-1.12065, 0.8605521, -1.413499, 1, 0.8352941, 0, 1,
-1.114278, -0.03283676, -0.8211902, 1, 0.8392157, 0, 1,
-1.113455, -1.589549, -2.871679, 1, 0.8470588, 0, 1,
-1.108679, 1.152561, -0.01458993, 1, 0.8509804, 0, 1,
-1.106009, -1.55483, -2.370356, 1, 0.8588235, 0, 1,
-1.105982, 2.367242, -2.135662, 1, 0.8627451, 0, 1,
-1.092513, -0.4188965, -4.082456, 1, 0.8705882, 0, 1,
-1.088303, -2.169681, -4.166645, 1, 0.8745098, 0, 1,
-1.087445, -1.16847, -2.391001, 1, 0.8823529, 0, 1,
-1.078544, 1.916132, -0.1416182, 1, 0.8862745, 0, 1,
-1.068985, 1.246866, -0.4037629, 1, 0.8941177, 0, 1,
-1.055692, -0.3092699, -1.101277, 1, 0.8980392, 0, 1,
-1.055218, 1.212412, -1.893723, 1, 0.9058824, 0, 1,
-1.050136, 0.5655619, -0.9773951, 1, 0.9137255, 0, 1,
-1.049809, 0.3305904, -1.143049, 1, 0.9176471, 0, 1,
-1.049532, -0.3828309, -0.578463, 1, 0.9254902, 0, 1,
-1.04005, 1.786379, -1.008515, 1, 0.9294118, 0, 1,
-1.031579, 0.3512799, -1.629966, 1, 0.9372549, 0, 1,
-1.022363, -0.6489375, -0.536984, 1, 0.9411765, 0, 1,
-1.015727, -0.1076182, -1.194139, 1, 0.9490196, 0, 1,
-1.003864, -0.361323, -1.572437, 1, 0.9529412, 0, 1,
-1.000257, 0.2871266, -0.642348, 1, 0.9607843, 0, 1,
-0.9991978, 1.14578, -0.5449519, 1, 0.9647059, 0, 1,
-0.9966518, -0.1676346, 0.04486277, 1, 0.972549, 0, 1,
-0.9910204, -0.2499576, -1.792923, 1, 0.9764706, 0, 1,
-0.9831449, 1.893286, -1.601679, 1, 0.9843137, 0, 1,
-0.9691641, 0.6781916, 0.001920628, 1, 0.9882353, 0, 1,
-0.9637186, -0.2760551, -2.522114, 1, 0.9960784, 0, 1,
-0.9623142, -1.460169, -3.514995, 0.9960784, 1, 0, 1,
-0.9601203, 3.15966, -0.5523197, 0.9921569, 1, 0, 1,
-0.9580491, -0.2618758, -2.641237, 0.9843137, 1, 0, 1,
-0.9492893, -0.516328, -0.1221724, 0.9803922, 1, 0, 1,
-0.9466717, 1.248654, -0.4495503, 0.972549, 1, 0, 1,
-0.9459196, 1.079655, -1.619478, 0.9686275, 1, 0, 1,
-0.9436573, 0.1093445, -1.732553, 0.9607843, 1, 0, 1,
-0.9410204, 1.454438, -1.250006, 0.9568627, 1, 0, 1,
-0.9376447, -0.3221564, -1.588315, 0.9490196, 1, 0, 1,
-0.9320416, -0.009929729, 0.8327591, 0.945098, 1, 0, 1,
-0.9308687, 1.665165, 0.8830661, 0.9372549, 1, 0, 1,
-0.9291524, 0.5964579, -0.5146803, 0.9333333, 1, 0, 1,
-0.9255515, -0.4345677, -2.491249, 0.9254902, 1, 0, 1,
-0.9207265, -1.665787, -1.115023, 0.9215686, 1, 0, 1,
-0.9139035, 0.3623457, 0.9591501, 0.9137255, 1, 0, 1,
-0.9110394, -0.2565265, -1.626562, 0.9098039, 1, 0, 1,
-0.9099211, -2.025909, -2.556867, 0.9019608, 1, 0, 1,
-0.9019656, -0.6438516, -3.29697, 0.8941177, 1, 0, 1,
-0.8996091, -0.1059336, 0.1751197, 0.8901961, 1, 0, 1,
-0.898414, -1.347417, -1.269469, 0.8823529, 1, 0, 1,
-0.8942046, -0.6353673, -1.103477, 0.8784314, 1, 0, 1,
-0.8876685, 0.267955, -0.7659172, 0.8705882, 1, 0, 1,
-0.8823962, 1.849866, -0.550944, 0.8666667, 1, 0, 1,
-0.880998, -0.311047, -0.8458297, 0.8588235, 1, 0, 1,
-0.8752196, 0.9811567, -0.6334579, 0.854902, 1, 0, 1,
-0.8670692, -0.741982, -1.60977, 0.8470588, 1, 0, 1,
-0.861044, -0.1474669, -3.108262, 0.8431373, 1, 0, 1,
-0.8605596, -0.8082482, -1.717763, 0.8352941, 1, 0, 1,
-0.8427176, 0.2036125, -3.088549, 0.8313726, 1, 0, 1,
-0.839656, -1.574409, -3.847074, 0.8235294, 1, 0, 1,
-0.8357061, -0.2478926, -2.434577, 0.8196079, 1, 0, 1,
-0.8338059, -0.4890055, -1.991059, 0.8117647, 1, 0, 1,
-0.8327312, -0.04403215, -3.029274, 0.8078431, 1, 0, 1,
-0.8300455, -1.290191, -0.2262803, 0.8, 1, 0, 1,
-0.8294218, 0.2560986, 0.2809227, 0.7921569, 1, 0, 1,
-0.8261561, 0.9680434, -0.4037896, 0.7882353, 1, 0, 1,
-0.8254227, 0.8057994, -0.1380652, 0.7803922, 1, 0, 1,
-0.8199914, 0.4885949, -3.206472, 0.7764706, 1, 0, 1,
-0.8192666, -1.727586, -3.831959, 0.7686275, 1, 0, 1,
-0.8182729, -1.099375, -3.022486, 0.7647059, 1, 0, 1,
-0.8178357, 0.9207896, -0.5245958, 0.7568628, 1, 0, 1,
-0.8116376, -0.119501, -1.372488, 0.7529412, 1, 0, 1,
-0.8088068, 0.2466093, -1.389979, 0.7450981, 1, 0, 1,
-0.8065194, 0.3173836, -0.8212007, 0.7411765, 1, 0, 1,
-0.7977915, -0.251203, -2.899878, 0.7333333, 1, 0, 1,
-0.7953234, 0.1384598, -3.026524, 0.7294118, 1, 0, 1,
-0.7932691, 0.3659529, -0.9597061, 0.7215686, 1, 0, 1,
-0.7926027, -0.9001613, -2.616928, 0.7176471, 1, 0, 1,
-0.789321, -0.3112186, -2.946696, 0.7098039, 1, 0, 1,
-0.7875206, -0.9137912, -4.638259, 0.7058824, 1, 0, 1,
-0.7872939, 1.278284, -1.703854, 0.6980392, 1, 0, 1,
-0.7815677, 0.04121856, -0.5336135, 0.6901961, 1, 0, 1,
-0.7782815, 0.4573126, -1.107913, 0.6862745, 1, 0, 1,
-0.777005, -1.218576, -3.165984, 0.6784314, 1, 0, 1,
-0.7735637, 0.2934668, -0.4257848, 0.6745098, 1, 0, 1,
-0.7692058, -0.4745115, -1.041372, 0.6666667, 1, 0, 1,
-0.7661049, 1.471236, -0.7319381, 0.6627451, 1, 0, 1,
-0.7643187, 1.003076, -1.462413, 0.654902, 1, 0, 1,
-0.7552639, 0.9002401, -1.481488, 0.6509804, 1, 0, 1,
-0.7552087, 1.010914, -1.09561, 0.6431373, 1, 0, 1,
-0.7469943, 0.5386857, -1.617826, 0.6392157, 1, 0, 1,
-0.7371179, -0.2035854, -3.424779, 0.6313726, 1, 0, 1,
-0.7353886, 0.801934, -0.4926164, 0.627451, 1, 0, 1,
-0.7323613, -0.4510572, -0.0116898, 0.6196079, 1, 0, 1,
-0.73194, -0.6146726, -1.999992, 0.6156863, 1, 0, 1,
-0.7314583, -0.3186409, -2.920397, 0.6078432, 1, 0, 1,
-0.7310808, 1.38116, -0.7092482, 0.6039216, 1, 0, 1,
-0.7274057, -1.293417, -4.5096, 0.5960785, 1, 0, 1,
-0.7265615, 0.6213056, -2.013337, 0.5882353, 1, 0, 1,
-0.7240897, 0.4956099, -1.51319, 0.5843138, 1, 0, 1,
-0.7204797, -0.2784077, -1.233338, 0.5764706, 1, 0, 1,
-0.7067589, -0.8293391, -3.428356, 0.572549, 1, 0, 1,
-0.702615, -0.9952436, -1.791856, 0.5647059, 1, 0, 1,
-0.7019645, 1.571242, -1.654839, 0.5607843, 1, 0, 1,
-0.7007175, 1.164999, -1.229289, 0.5529412, 1, 0, 1,
-0.6895506, -1.357845, -1.742897, 0.5490196, 1, 0, 1,
-0.6868044, 0.8892342, -0.6077852, 0.5411765, 1, 0, 1,
-0.6863761, -0.8673652, -1.96151, 0.5372549, 1, 0, 1,
-0.6855139, -0.5614296, -0.6583936, 0.5294118, 1, 0, 1,
-0.682481, -0.2325231, -1.763734, 0.5254902, 1, 0, 1,
-0.6750317, -0.5323372, -3.727587, 0.5176471, 1, 0, 1,
-0.6745807, 1.343271, -1.645957, 0.5137255, 1, 0, 1,
-0.6677098, 1.221138, -1.315264, 0.5058824, 1, 0, 1,
-0.6636801, -0.8211438, -1.143956, 0.5019608, 1, 0, 1,
-0.6598567, -0.9347355, -3.108189, 0.4941176, 1, 0, 1,
-0.6522019, 1.683372, -0.152342, 0.4862745, 1, 0, 1,
-0.6520403, 0.5422013, -0.8323348, 0.4823529, 1, 0, 1,
-0.6477887, -1.100397, -4.471408, 0.4745098, 1, 0, 1,
-0.6415058, 0.03766783, -0.8861739, 0.4705882, 1, 0, 1,
-0.6413191, 0.5638123, -0.4996177, 0.4627451, 1, 0, 1,
-0.6409296, -0.6649403, -2.420593, 0.4588235, 1, 0, 1,
-0.6408641, -1.517932, -2.18523, 0.4509804, 1, 0, 1,
-0.6374478, 0.5755734, -0.9931484, 0.4470588, 1, 0, 1,
-0.6343048, -2.619224, -1.704464, 0.4392157, 1, 0, 1,
-0.6340554, 1.265965, 0.2807612, 0.4352941, 1, 0, 1,
-0.6281804, 0.4486963, -2.416189, 0.427451, 1, 0, 1,
-0.6260334, 0.176942, -0.9027401, 0.4235294, 1, 0, 1,
-0.6256025, -0.2616359, -1.729803, 0.4156863, 1, 0, 1,
-0.6239895, -0.553827, -1.441387, 0.4117647, 1, 0, 1,
-0.6239104, 0.09690756, -1.39054, 0.4039216, 1, 0, 1,
-0.6235829, -1.611485, -4.124874, 0.3960784, 1, 0, 1,
-0.6233956, 0.7935041, -1.183095, 0.3921569, 1, 0, 1,
-0.6208286, 0.1021179, 0.4933904, 0.3843137, 1, 0, 1,
-0.6190023, -1.051656, -1.897125, 0.3803922, 1, 0, 1,
-0.6188533, 1.640739, -0.7224485, 0.372549, 1, 0, 1,
-0.6174425, -0.195847, -0.5581559, 0.3686275, 1, 0, 1,
-0.6152953, 0.5890834, -1.8377, 0.3607843, 1, 0, 1,
-0.6143066, -0.04761293, -3.855685, 0.3568628, 1, 0, 1,
-0.6138718, -0.1549927, -0.8057387, 0.3490196, 1, 0, 1,
-0.6038151, 0.2682197, -1.041845, 0.345098, 1, 0, 1,
-0.6007758, -0.04212981, -2.201777, 0.3372549, 1, 0, 1,
-0.5990713, 0.264379, 0.3519076, 0.3333333, 1, 0, 1,
-0.595731, 0.07312451, -1.993993, 0.3254902, 1, 0, 1,
-0.5948582, 2.358815, -0.9695472, 0.3215686, 1, 0, 1,
-0.5937048, 0.763176, -3.137571, 0.3137255, 1, 0, 1,
-0.5934211, 1.001766, -0.03829576, 0.3098039, 1, 0, 1,
-0.5924863, -1.765898, -2.276169, 0.3019608, 1, 0, 1,
-0.5890408, 0.08862377, -1.576823, 0.2941177, 1, 0, 1,
-0.587905, -1.496682, -3.77705, 0.2901961, 1, 0, 1,
-0.5846322, 0.7422646, -1.25534, 0.282353, 1, 0, 1,
-0.583986, 0.1738122, -1.518381, 0.2784314, 1, 0, 1,
-0.5836899, 1.888104, -0.9128378, 0.2705882, 1, 0, 1,
-0.5835344, 2.495321, 0.3678394, 0.2666667, 1, 0, 1,
-0.5830807, -0.8225887, -1.061099, 0.2588235, 1, 0, 1,
-0.5781717, 0.8337414, -1.290057, 0.254902, 1, 0, 1,
-0.5769067, 2.346348, -0.3254853, 0.2470588, 1, 0, 1,
-0.571041, 0.2426015, -1.195107, 0.2431373, 1, 0, 1,
-0.5701774, 0.2025809, 0.5848873, 0.2352941, 1, 0, 1,
-0.5690712, -0.8347738, -2.693624, 0.2313726, 1, 0, 1,
-0.5471226, -0.1222885, -0.4724002, 0.2235294, 1, 0, 1,
-0.5436125, 0.1963989, 0.4003481, 0.2196078, 1, 0, 1,
-0.538773, -0.2668666, -3.503973, 0.2117647, 1, 0, 1,
-0.5320242, 0.5505897, -0.8972632, 0.2078431, 1, 0, 1,
-0.5292299, -0.3427816, -2.626271, 0.2, 1, 0, 1,
-0.5282107, -1.300907, -2.936869, 0.1921569, 1, 0, 1,
-0.5246048, -0.3215131, -3.614414, 0.1882353, 1, 0, 1,
-0.523163, -1.138264, -1.236062, 0.1803922, 1, 0, 1,
-0.5213538, 1.578722, -0.6466219, 0.1764706, 1, 0, 1,
-0.515491, 0.1107843, -0.6937686, 0.1686275, 1, 0, 1,
-0.5123312, 0.9435807, -1.270595, 0.1647059, 1, 0, 1,
-0.5112866, 0.5255054, -0.7668577, 0.1568628, 1, 0, 1,
-0.5107962, -1.986784, -2.963588, 0.1529412, 1, 0, 1,
-0.5098615, 1.781393, -0.7784355, 0.145098, 1, 0, 1,
-0.5061507, 0.2800362, -1.133366, 0.1411765, 1, 0, 1,
-0.5055646, -0.3802762, -2.749522, 0.1333333, 1, 0, 1,
-0.5052701, -0.6100217, -2.986651, 0.1294118, 1, 0, 1,
-0.4995367, -0.3961475, -1.876826, 0.1215686, 1, 0, 1,
-0.4979726, 0.03862343, -0.5902113, 0.1176471, 1, 0, 1,
-0.4967555, 0.5270559, -0.3633586, 0.1098039, 1, 0, 1,
-0.4963571, 0.8091144, -1.543853, 0.1058824, 1, 0, 1,
-0.4932949, -0.2148768, -2.888039, 0.09803922, 1, 0, 1,
-0.4900258, -0.4576177, -1.021842, 0.09019608, 1, 0, 1,
-0.4878549, 0.598936, -0.5516866, 0.08627451, 1, 0, 1,
-0.4872376, -0.8236354, -3.809539, 0.07843138, 1, 0, 1,
-0.4864635, 0.07681343, -3.155916, 0.07450981, 1, 0, 1,
-0.4861208, -1.557817, -1.628092, 0.06666667, 1, 0, 1,
-0.4851209, -0.06291799, -2.315342, 0.0627451, 1, 0, 1,
-0.4832582, -1.801499, -4.93912, 0.05490196, 1, 0, 1,
-0.4823391, -0.4069397, -2.871954, 0.05098039, 1, 0, 1,
-0.4683853, 1.597184, -1.888977, 0.04313726, 1, 0, 1,
-0.4675442, 0.1298057, 1.177808, 0.03921569, 1, 0, 1,
-0.465648, 1.998825, 0.8667608, 0.03137255, 1, 0, 1,
-0.4630974, 0.9658087, -1.028221, 0.02745098, 1, 0, 1,
-0.4627683, 1.358462, -0.5377932, 0.01960784, 1, 0, 1,
-0.4595909, -1.35963, -3.176402, 0.01568628, 1, 0, 1,
-0.4574845, -0.6058519, -3.054432, 0.007843138, 1, 0, 1,
-0.4482147, -0.6251127, -3.110408, 0.003921569, 1, 0, 1,
-0.4481799, 0.9177883, 1.680141, 0, 1, 0.003921569, 1,
-0.4457852, 0.4364683, -1.238995, 0, 1, 0.01176471, 1,
-0.4382094, 0.03713194, -2.415897, 0, 1, 0.01568628, 1,
-0.4352499, 0.9572604, -2.094546, 0, 1, 0.02352941, 1,
-0.4303524, 0.4378613, -1.068176, 0, 1, 0.02745098, 1,
-0.4289492, -0.550563, -2.29477, 0, 1, 0.03529412, 1,
-0.4258149, -0.1360774, -1.720253, 0, 1, 0.03921569, 1,
-0.4234001, -2.083775, -4.213229, 0, 1, 0.04705882, 1,
-0.4115359, 0.1764484, -1.470044, 0, 1, 0.05098039, 1,
-0.4111173, 1.035739, 0.2070853, 0, 1, 0.05882353, 1,
-0.4078912, 1.171797, 0.565669, 0, 1, 0.0627451, 1,
-0.4051315, -0.7418909, -2.872341, 0, 1, 0.07058824, 1,
-0.4042827, 1.306083, -1.717623, 0, 1, 0.07450981, 1,
-0.39371, -0.8802861, -3.173565, 0, 1, 0.08235294, 1,
-0.3922416, -1.229831, -2.142346, 0, 1, 0.08627451, 1,
-0.3918558, 1.332656, -0.4953467, 0, 1, 0.09411765, 1,
-0.3836304, -0.9898399, -2.038013, 0, 1, 0.1019608, 1,
-0.3756842, 0.0782928, -1.141417, 0, 1, 0.1058824, 1,
-0.3741688, 1.589838, -1.147336, 0, 1, 0.1137255, 1,
-0.362837, -0.6718338, -1.400666, 0, 1, 0.1176471, 1,
-0.3582968, 0.07143, -2.792816, 0, 1, 0.1254902, 1,
-0.3580035, 0.2451694, -0.5182521, 0, 1, 0.1294118, 1,
-0.3569587, 0.7881667, 0.4708315, 0, 1, 0.1372549, 1,
-0.3542785, -1.492108, -2.566661, 0, 1, 0.1411765, 1,
-0.3492217, 0.09311056, -1.729072, 0, 1, 0.1490196, 1,
-0.346604, -0.4683262, -2.165039, 0, 1, 0.1529412, 1,
-0.3465013, -0.296664, -1.050861, 0, 1, 0.1607843, 1,
-0.3415484, 1.174607, -2.031248, 0, 1, 0.1647059, 1,
-0.3405801, 0.6952128, -0.2533672, 0, 1, 0.172549, 1,
-0.3379781, -0.5061942, -2.026277, 0, 1, 0.1764706, 1,
-0.3361322, -0.8899838, -3.002704, 0, 1, 0.1843137, 1,
-0.3309223, 0.4375503, -2.064452, 0, 1, 0.1882353, 1,
-0.3284969, 0.1048995, -0.2737867, 0, 1, 0.1960784, 1,
-0.3240336, -0.5445049, -2.142804, 0, 1, 0.2039216, 1,
-0.3197958, 0.688802, 0.550277, 0, 1, 0.2078431, 1,
-0.3186379, -1.53933, -2.422292, 0, 1, 0.2156863, 1,
-0.3181843, -0.2764382, -0.8698805, 0, 1, 0.2196078, 1,
-0.3171108, 1.204779, 1.266448, 0, 1, 0.227451, 1,
-0.315639, 0.1478898, 0.05872982, 0, 1, 0.2313726, 1,
-0.311881, 0.442966, 1.188613, 0, 1, 0.2392157, 1,
-0.307894, -0.3900171, -2.220697, 0, 1, 0.2431373, 1,
-0.3030461, -0.4475265, -2.383029, 0, 1, 0.2509804, 1,
-0.3008528, -0.08180191, -2.06773, 0, 1, 0.254902, 1,
-0.2993264, 1.31254, -1.384721, 0, 1, 0.2627451, 1,
-0.2960222, -0.1482086, -0.6206354, 0, 1, 0.2666667, 1,
-0.2948928, -1.658601, -2.674035, 0, 1, 0.2745098, 1,
-0.2947439, -0.7417162, -2.439719, 0, 1, 0.2784314, 1,
-0.2918956, -0.7822806, -0.3778014, 0, 1, 0.2862745, 1,
-0.2881479, 0.2362947, -0.1380308, 0, 1, 0.2901961, 1,
-0.2841721, -0.07285165, -0.4939519, 0, 1, 0.2980392, 1,
-0.2833048, 0.5464384, -1.736693, 0, 1, 0.3058824, 1,
-0.2805976, 0.03593329, -0.8179101, 0, 1, 0.3098039, 1,
-0.2703813, 0.1544429, -3.478332, 0, 1, 0.3176471, 1,
-0.2690075, -0.04001717, -3.54343, 0, 1, 0.3215686, 1,
-0.2665398, 0.559623, -1.533021, 0, 1, 0.3294118, 1,
-0.2618159, -1.473576, -3.50105, 0, 1, 0.3333333, 1,
-0.2596265, -1.404759, -2.462235, 0, 1, 0.3411765, 1,
-0.2592753, 0.4201135, 0.04286508, 0, 1, 0.345098, 1,
-0.2576311, -1.08816, -1.883399, 0, 1, 0.3529412, 1,
-0.2574971, 0.1236796, -0.1718481, 0, 1, 0.3568628, 1,
-0.2539012, 0.003120872, -2.349236, 0, 1, 0.3647059, 1,
-0.2518824, 0.4419541, -1.038089, 0, 1, 0.3686275, 1,
-0.2495204, -0.9617817, -1.955552, 0, 1, 0.3764706, 1,
-0.2453116, -0.4101638, -2.989777, 0, 1, 0.3803922, 1,
-0.2424154, -0.1737608, -2.426929, 0, 1, 0.3882353, 1,
-0.2399654, 0.9046953, -0.9843633, 0, 1, 0.3921569, 1,
-0.2398516, 0.5932446, -0.6567997, 0, 1, 0.4, 1,
-0.2365056, 1.513775, -1.060118, 0, 1, 0.4078431, 1,
-0.2345128, 0.6098788, -0.2742345, 0, 1, 0.4117647, 1,
-0.2315592, -0.3663258, -2.813757, 0, 1, 0.4196078, 1,
-0.2223498, 0.5306872, 0.4893985, 0, 1, 0.4235294, 1,
-0.2203766, -0.4469617, -2.915638, 0, 1, 0.4313726, 1,
-0.2191707, 0.5278547, 0.1541995, 0, 1, 0.4352941, 1,
-0.2165195, 1.125054, -1.600202, 0, 1, 0.4431373, 1,
-0.2152766, 0.6061601, -1.189263, 0, 1, 0.4470588, 1,
-0.2150743, -0.8607451, -1.39025, 0, 1, 0.454902, 1,
-0.2129425, 1.368119, -0.6584877, 0, 1, 0.4588235, 1,
-0.2100579, -0.5977356, -1.803803, 0, 1, 0.4666667, 1,
-0.2083838, -0.8815416, -3.432529, 0, 1, 0.4705882, 1,
-0.2070905, -0.001559437, -1.178679, 0, 1, 0.4784314, 1,
-0.2046097, -1.390711, -3.680487, 0, 1, 0.4823529, 1,
-0.202953, 1.170594, -0.3363743, 0, 1, 0.4901961, 1,
-0.1958895, -0.5003569, -3.646905, 0, 1, 0.4941176, 1,
-0.1939382, 0.2920938, -0.3346283, 0, 1, 0.5019608, 1,
-0.1920523, -0.2240558, -2.227705, 0, 1, 0.509804, 1,
-0.1905884, -0.6510422, -1.950505, 0, 1, 0.5137255, 1,
-0.184431, -0.2376696, -1.925859, 0, 1, 0.5215687, 1,
-0.1840658, 0.2822516, -0.6925173, 0, 1, 0.5254902, 1,
-0.1835684, -0.3831945, -3.758266, 0, 1, 0.5333334, 1,
-0.1786282, 1.446349, 0.7243212, 0, 1, 0.5372549, 1,
-0.1761183, 0.8687235, -0.2933567, 0, 1, 0.5450981, 1,
-0.1661079, 0.3531663, -0.5660869, 0, 1, 0.5490196, 1,
-0.1578767, 0.3678019, -0.09520042, 0, 1, 0.5568628, 1,
-0.1576177, 0.8252878, -0.9549588, 0, 1, 0.5607843, 1,
-0.1532288, -0.4814554, -2.987399, 0, 1, 0.5686275, 1,
-0.1504143, 0.2482062, 0.06274818, 0, 1, 0.572549, 1,
-0.1495454, 1.401509, -0.06495634, 0, 1, 0.5803922, 1,
-0.149101, -0.894562, -3.041421, 0, 1, 0.5843138, 1,
-0.1487557, 0.2876281, -0.8809411, 0, 1, 0.5921569, 1,
-0.1412182, -0.6110837, -2.115085, 0, 1, 0.5960785, 1,
-0.1373897, -0.3546768, -4.509739, 0, 1, 0.6039216, 1,
-0.1291303, 1.106439, 0.02957637, 0, 1, 0.6117647, 1,
-0.1238248, -0.6893684, -3.366407, 0, 1, 0.6156863, 1,
-0.1208283, 0.4851883, -0.1755779, 0, 1, 0.6235294, 1,
-0.1169014, -0.4907297, -1.950649, 0, 1, 0.627451, 1,
-0.1137991, -1.584214, -2.251818, 0, 1, 0.6352941, 1,
-0.1124378, 0.07460262, -0.2982565, 0, 1, 0.6392157, 1,
-0.1103211, -1.646434, -1.791443, 0, 1, 0.6470588, 1,
-0.1094588, 1.324907, -0.1797781, 0, 1, 0.6509804, 1,
-0.1086235, 0.8775482, 0.1211189, 0, 1, 0.6588235, 1,
-0.1072826, -0.9160383, -1.552173, 0, 1, 0.6627451, 1,
-0.1071661, 0.3912863, -1.99568, 0, 1, 0.6705883, 1,
-0.1031874, 1.695742, 1.950709, 0, 1, 0.6745098, 1,
-0.09875888, 1.37174, -0.2875492, 0, 1, 0.682353, 1,
-0.09509993, 0.1743657, -1.367103, 0, 1, 0.6862745, 1,
-0.09168879, -1.006817, -2.396899, 0, 1, 0.6941177, 1,
-0.09164988, 0.2570984, -1.0893, 0, 1, 0.7019608, 1,
-0.09067791, 0.1316655, -2.577381, 0, 1, 0.7058824, 1,
-0.0903324, -0.282654, -2.496453, 0, 1, 0.7137255, 1,
-0.08927373, -0.5927286, -3.355413, 0, 1, 0.7176471, 1,
-0.08731498, 0.9858534, -0.1172321, 0, 1, 0.7254902, 1,
-0.08391597, -0.6036488, -3.488623, 0, 1, 0.7294118, 1,
-0.08263025, -1.406784, -3.617566, 0, 1, 0.7372549, 1,
-0.08139813, 0.4762208, -0.1556317, 0, 1, 0.7411765, 1,
-0.07903253, -0.7354488, -2.672128, 0, 1, 0.7490196, 1,
-0.07738917, 0.199341, -0.4825549, 0, 1, 0.7529412, 1,
-0.07738341, -0.09395273, -0.7981457, 0, 1, 0.7607843, 1,
-0.07420375, 0.743052, -0.4147416, 0, 1, 0.7647059, 1,
-0.07110985, -0.1266759, -3.272404, 0, 1, 0.772549, 1,
-0.06664357, 0.6286868, 2.699949, 0, 1, 0.7764706, 1,
-0.06143396, 0.8024389, -1.277855, 0, 1, 0.7843137, 1,
-0.06020949, 0.3600692, -1.157702, 0, 1, 0.7882353, 1,
-0.05853607, -0.897179, -3.529748, 0, 1, 0.7960784, 1,
-0.05317361, -0.001753065, -1.574395, 0, 1, 0.8039216, 1,
-0.05107287, -0.8118989, -3.971452, 0, 1, 0.8078431, 1,
-0.04754705, 0.8374812, -0.2567768, 0, 1, 0.8156863, 1,
-0.04746164, -0.3302146, -3.633364, 0, 1, 0.8196079, 1,
-0.04736412, 1.018767, -0.08136841, 0, 1, 0.827451, 1,
-0.04683407, -0.1618266, -3.074405, 0, 1, 0.8313726, 1,
-0.04595447, 1.970263, -0.09789914, 0, 1, 0.8392157, 1,
-0.04455026, -0.9462214, -3.48576, 0, 1, 0.8431373, 1,
-0.0434002, 0.3798221, 0.09892873, 0, 1, 0.8509804, 1,
-0.04212053, 1.246974, 1.467029, 0, 1, 0.854902, 1,
-0.03409328, 0.8280176, -0.2245389, 0, 1, 0.8627451, 1,
-0.03341351, -0.1502862, -3.415562, 0, 1, 0.8666667, 1,
-0.02898277, -0.1408772, -4.060906, 0, 1, 0.8745098, 1,
-0.02882749, -0.5906429, -2.715878, 0, 1, 0.8784314, 1,
-0.02140947, -0.08783302, -2.249388, 0, 1, 0.8862745, 1,
-0.02105062, 0.324256, -1.050644, 0, 1, 0.8901961, 1,
-0.0192835, 1.252749, 0.8866335, 0, 1, 0.8980392, 1,
-0.01888368, 1.085468, 1.024423, 0, 1, 0.9058824, 1,
-0.01801093, 0.4334732, 1.75566, 0, 1, 0.9098039, 1,
-0.01772898, -0.2779298, -2.940688, 0, 1, 0.9176471, 1,
-0.01584717, 0.7297395, -1.216036, 0, 1, 0.9215686, 1,
-0.01371278, -0.3033721, -3.185465, 0, 1, 0.9294118, 1,
-0.01113796, -0.08032534, -2.544082, 0, 1, 0.9333333, 1,
-0.01040601, 1.862282, -0.4715648, 0, 1, 0.9411765, 1,
-0.003453513, 1.459745, 0.9057767, 0, 1, 0.945098, 1,
-0.0003846858, 0.8281167, 0.8472824, 0, 1, 0.9529412, 1,
0.001742815, 1.249611, -0.8744524, 0, 1, 0.9568627, 1,
0.00950065, 0.8192204, -0.682291, 0, 1, 0.9647059, 1,
0.01263541, -0.5533842, 2.073178, 0, 1, 0.9686275, 1,
0.01387273, 0.8216665, 0.4547721, 0, 1, 0.9764706, 1,
0.01837657, 0.3689136, 0.8140776, 0, 1, 0.9803922, 1,
0.01996993, -0.5566576, 2.75203, 0, 1, 0.9882353, 1,
0.02527772, 0.2702117, -2.638225, 0, 1, 0.9921569, 1,
0.02553798, -0.1665618, 3.769327, 0, 1, 1, 1,
0.02632231, 1.778091, 1.304648, 0, 0.9921569, 1, 1,
0.02896655, -1.496339, 2.720573, 0, 0.9882353, 1, 1,
0.03002775, -0.8939877, 3.50328, 0, 0.9803922, 1, 1,
0.03409412, -1.968927, 3.657557, 0, 0.9764706, 1, 1,
0.03949772, -1.034423, 3.235953, 0, 0.9686275, 1, 1,
0.04284149, -1.154806, 4.30896, 0, 0.9647059, 1, 1,
0.04673911, 0.260056, 1.115056, 0, 0.9568627, 1, 1,
0.05184961, -0.4146897, 3.934634, 0, 0.9529412, 1, 1,
0.05193254, 1.01036, -0.6494375, 0, 0.945098, 1, 1,
0.0535976, 1.39147, 1.253972, 0, 0.9411765, 1, 1,
0.05369369, 1.030288, -0.2088175, 0, 0.9333333, 1, 1,
0.05449993, 0.8929858, -2.119136, 0, 0.9294118, 1, 1,
0.05513307, 1.273861, 0.5437463, 0, 0.9215686, 1, 1,
0.05539332, -1.601287, 2.649038, 0, 0.9176471, 1, 1,
0.05691696, -1.40281, 4.067224, 0, 0.9098039, 1, 1,
0.06082403, -0.7331013, 5.297036, 0, 0.9058824, 1, 1,
0.06163656, 1.594637, -0.05278832, 0, 0.8980392, 1, 1,
0.06241012, -0.3129184, 2.019908, 0, 0.8901961, 1, 1,
0.06343973, -0.7136254, 2.068797, 0, 0.8862745, 1, 1,
0.06471927, -0.3607765, 1.821831, 0, 0.8784314, 1, 1,
0.06824634, -0.149314, 2.22795, 0, 0.8745098, 1, 1,
0.07207664, 1.158832, 1.052203, 0, 0.8666667, 1, 1,
0.0761345, -0.4446379, 4.410362, 0, 0.8627451, 1, 1,
0.0762267, -0.05151904, 2.673251, 0, 0.854902, 1, 1,
0.07639285, 1.603429, 0.04671617, 0, 0.8509804, 1, 1,
0.07737187, -0.274647, 2.777414, 0, 0.8431373, 1, 1,
0.07892666, -0.3763008, 1.394956, 0, 0.8392157, 1, 1,
0.07999308, 1.38871, 1.125375, 0, 0.8313726, 1, 1,
0.08316618, -0.5249657, 1.837273, 0, 0.827451, 1, 1,
0.0867167, 0.8410826, -0.4667587, 0, 0.8196079, 1, 1,
0.08683605, 0.8292826, 2.962646, 0, 0.8156863, 1, 1,
0.0870105, -0.6761674, 2.792818, 0, 0.8078431, 1, 1,
0.08929048, -0.8610022, 3.455003, 0, 0.8039216, 1, 1,
0.08963626, -0.278903, 3.480672, 0, 0.7960784, 1, 1,
0.09187471, 0.4197433, 0.7987762, 0, 0.7882353, 1, 1,
0.09445089, 0.1067757, 0.5039858, 0, 0.7843137, 1, 1,
0.09707057, -0.8648427, 2.204162, 0, 0.7764706, 1, 1,
0.09993242, -0.8321312, 3.695571, 0, 0.772549, 1, 1,
0.101294, 1.517325, -1.096063, 0, 0.7647059, 1, 1,
0.1037953, 0.902005, -0.413599, 0, 0.7607843, 1, 1,
0.1055465, 0.7322223, 0.2303404, 0, 0.7529412, 1, 1,
0.1059066, -0.6258445, 2.171191, 0, 0.7490196, 1, 1,
0.1132862, -1.160071, 3.728843, 0, 0.7411765, 1, 1,
0.1181738, 0.2693613, 0.2363275, 0, 0.7372549, 1, 1,
0.1184042, -0.3089557, 4.553108, 0, 0.7294118, 1, 1,
0.120067, 1.69954, -1.599003, 0, 0.7254902, 1, 1,
0.1205026, -0.5039694, 1.316789, 0, 0.7176471, 1, 1,
0.1297611, -0.9292207, 3.166202, 0, 0.7137255, 1, 1,
0.1302821, 0.4105184, -0.1953009, 0, 0.7058824, 1, 1,
0.1315862, 0.333918, -1.169158, 0, 0.6980392, 1, 1,
0.1325981, 1.911028, 0.1137485, 0, 0.6941177, 1, 1,
0.1343659, -0.07630662, 0.6595107, 0, 0.6862745, 1, 1,
0.1352043, -1.052376, 4.698889, 0, 0.682353, 1, 1,
0.1383276, 0.5145582, -2.034942, 0, 0.6745098, 1, 1,
0.1403527, -0.4025417, 2.904984, 0, 0.6705883, 1, 1,
0.1416242, -0.7618808, 1.019461, 0, 0.6627451, 1, 1,
0.1453486, -3.061646, 2.461525, 0, 0.6588235, 1, 1,
0.1453517, 1.395012, 0.1826722, 0, 0.6509804, 1, 1,
0.1456254, -0.1937468, 3.379856, 0, 0.6470588, 1, 1,
0.1476126, 0.239361, 1.476366, 0, 0.6392157, 1, 1,
0.1531831, 0.9534194, 2.687122, 0, 0.6352941, 1, 1,
0.155567, -0.5197692, 3.7604, 0, 0.627451, 1, 1,
0.156203, 0.2765086, 0.437493, 0, 0.6235294, 1, 1,
0.157919, 0.284573, 1.703374, 0, 0.6156863, 1, 1,
0.158281, 0.2432879, -0.5363116, 0, 0.6117647, 1, 1,
0.1588348, 1.337568, -0.3988744, 0, 0.6039216, 1, 1,
0.1633496, 1.482179, -0.01597418, 0, 0.5960785, 1, 1,
0.1648717, -1.234929, 2.08932, 0, 0.5921569, 1, 1,
0.1679398, -0.9350091, 3.921552, 0, 0.5843138, 1, 1,
0.17005, -0.6116008, 2.36018, 0, 0.5803922, 1, 1,
0.1746682, 0.2316925, 2.346394, 0, 0.572549, 1, 1,
0.1749028, -0.9409155, 4.78732, 0, 0.5686275, 1, 1,
0.1767378, -0.4225523, 3.895264, 0, 0.5607843, 1, 1,
0.1777802, 0.6062027, -0.5960694, 0, 0.5568628, 1, 1,
0.1801149, 0.98436, 0.5323741, 0, 0.5490196, 1, 1,
0.1806653, 0.4336213, 0.6404292, 0, 0.5450981, 1, 1,
0.185643, 0.08724024, 0.4127889, 0, 0.5372549, 1, 1,
0.1876069, 0.2835702, 0.7104706, 0, 0.5333334, 1, 1,
0.1887088, 0.4781871, -0.008636947, 0, 0.5254902, 1, 1,
0.1939567, 2.629193, 2.161678, 0, 0.5215687, 1, 1,
0.1952572, -1.404173, 4.648786, 0, 0.5137255, 1, 1,
0.1956711, 0.37251, -0.1725696, 0, 0.509804, 1, 1,
0.1964639, -0.4524502, 2.698665, 0, 0.5019608, 1, 1,
0.1968588, -0.9785947, 2.91706, 0, 0.4941176, 1, 1,
0.19757, 0.3354044, 0.1189452, 0, 0.4901961, 1, 1,
0.2010709, -0.7804518, 1.031177, 0, 0.4823529, 1, 1,
0.2028003, -1.042112, 3.311877, 0, 0.4784314, 1, 1,
0.2043998, -1.868477, 3.626899, 0, 0.4705882, 1, 1,
0.2064577, -0.8915503, 2.05006, 0, 0.4666667, 1, 1,
0.2078238, -1.011848, 2.10881, 0, 0.4588235, 1, 1,
0.2088161, -1.704301, 3.837446, 0, 0.454902, 1, 1,
0.2119069, 1.92488, 0.9463482, 0, 0.4470588, 1, 1,
0.2168971, -0.4421842, 3.115374, 0, 0.4431373, 1, 1,
0.2210473, -0.1078972, 0.9026037, 0, 0.4352941, 1, 1,
0.2228509, -0.6392463, 3.769104, 0, 0.4313726, 1, 1,
0.223576, -2.386746, 3.321727, 0, 0.4235294, 1, 1,
0.2239387, 1.618626, 0.4937054, 0, 0.4196078, 1, 1,
0.2268282, -1.736757, 0.301439, 0, 0.4117647, 1, 1,
0.2306659, 0.1088363, 1.864785, 0, 0.4078431, 1, 1,
0.2314576, -0.0128794, 1.21718, 0, 0.4, 1, 1,
0.2332757, 0.8455175, 0.3553644, 0, 0.3921569, 1, 1,
0.2344801, 0.4488067, 0.05676456, 0, 0.3882353, 1, 1,
0.2347208, -0.0564157, 1.874527, 0, 0.3803922, 1, 1,
0.2352099, 0.09236146, 1.033709, 0, 0.3764706, 1, 1,
0.235939, 1.884383, -0.500464, 0, 0.3686275, 1, 1,
0.2362389, -0.3618122, 3.995543, 0, 0.3647059, 1, 1,
0.2375341, -2.21682, 3.414712, 0, 0.3568628, 1, 1,
0.2427398, 0.406076, 0.5322589, 0, 0.3529412, 1, 1,
0.2442653, 0.2793803, 0.7761867, 0, 0.345098, 1, 1,
0.2452249, -1.840971, 2.888587, 0, 0.3411765, 1, 1,
0.245752, 1.552631, -0.1293983, 0, 0.3333333, 1, 1,
0.2465123, -1.860175, 2.776219, 0, 0.3294118, 1, 1,
0.2509109, 0.3136052, 0.3103302, 0, 0.3215686, 1, 1,
0.2561696, 0.6261433, -0.2051521, 0, 0.3176471, 1, 1,
0.26318, -0.9763632, 2.637988, 0, 0.3098039, 1, 1,
0.264394, -1.05834, 4.390678, 0, 0.3058824, 1, 1,
0.2645428, -1.754389, 3.620623, 0, 0.2980392, 1, 1,
0.2646642, -0.8460843, 3.083763, 0, 0.2901961, 1, 1,
0.2681903, 0.05025698, 0.3270668, 0, 0.2862745, 1, 1,
0.2701516, 1.146588, 0.5464665, 0, 0.2784314, 1, 1,
0.2747626, 0.3097568, 1.143822, 0, 0.2745098, 1, 1,
0.2751162, 0.4429618, 0.7066173, 0, 0.2666667, 1, 1,
0.2757711, 0.6584256, -0.6868542, 0, 0.2627451, 1, 1,
0.2764482, 1.564382, 0.2075264, 0, 0.254902, 1, 1,
0.2796218, -0.5336753, 1.384017, 0, 0.2509804, 1, 1,
0.280294, -0.7149267, 3.86323, 0, 0.2431373, 1, 1,
0.2851393, 0.4943057, 1.579398, 0, 0.2392157, 1, 1,
0.2921956, -2.399234, 2.654881, 0, 0.2313726, 1, 1,
0.2949206, 0.883678, 0.5225918, 0, 0.227451, 1, 1,
0.2970676, 1.330999, 0.6083612, 0, 0.2196078, 1, 1,
0.2998111, -1.645223, 4.456063, 0, 0.2156863, 1, 1,
0.3016161, -0.7476708, 3.033216, 0, 0.2078431, 1, 1,
0.3073815, 1.525901, -1.493345, 0, 0.2039216, 1, 1,
0.3075778, -1.83979, 3.926375, 0, 0.1960784, 1, 1,
0.3114957, -1.26525, 4.506554, 0, 0.1882353, 1, 1,
0.311505, -1.749863, 4.607071, 0, 0.1843137, 1, 1,
0.3133741, 0.2513333, 1.543276, 0, 0.1764706, 1, 1,
0.3134692, 1.078819, 0.3284259, 0, 0.172549, 1, 1,
0.3168423, 0.01834095, 1.613618, 0, 0.1647059, 1, 1,
0.3169731, -0.6393223, 3.200385, 0, 0.1607843, 1, 1,
0.3198989, -0.3981153, 1.888194, 0, 0.1529412, 1, 1,
0.3207814, 0.8357037, 1.570375, 0, 0.1490196, 1, 1,
0.3217686, 0.09239783, 2.551456, 0, 0.1411765, 1, 1,
0.3232338, -0.562107, 1.681565, 0, 0.1372549, 1, 1,
0.3275223, -1.119286, 1.317014, 0, 0.1294118, 1, 1,
0.3281712, 1.038397, 0.956232, 0, 0.1254902, 1, 1,
0.335451, 0.1561929, 1.523936, 0, 0.1176471, 1, 1,
0.3403256, -0.6811809, 4.267038, 0, 0.1137255, 1, 1,
0.3427449, 1.372847, 0.751278, 0, 0.1058824, 1, 1,
0.3505822, -0.4747344, 2.648502, 0, 0.09803922, 1, 1,
0.3530564, 0.09548409, 1.087943, 0, 0.09411765, 1, 1,
0.3571507, 0.7394425, 1.606398, 0, 0.08627451, 1, 1,
0.3631069, -0.6982229, 1.989782, 0, 0.08235294, 1, 1,
0.3648789, -0.3929426, 3.18483, 0, 0.07450981, 1, 1,
0.3654203, -2.215848, 3.275767, 0, 0.07058824, 1, 1,
0.3662843, -0.1710593, -0.1877011, 0, 0.0627451, 1, 1,
0.3714695, -1.829526, 2.741458, 0, 0.05882353, 1, 1,
0.3772636, -1.267788, 1.370238, 0, 0.05098039, 1, 1,
0.3786961, -0.7155038, 4.290723, 0, 0.04705882, 1, 1,
0.3805763, 0.1588037, -0.2543225, 0, 0.03921569, 1, 1,
0.3817982, -0.8897876, 4.022911, 0, 0.03529412, 1, 1,
0.3821065, -0.9595287, 4.909983, 0, 0.02745098, 1, 1,
0.3837527, -0.1459244, 1.651403, 0, 0.02352941, 1, 1,
0.3883758, -1.528681, 3.405208, 0, 0.01568628, 1, 1,
0.3935879, -0.5639015, 4.442226, 0, 0.01176471, 1, 1,
0.3950374, 0.07860042, 1.971026, 0, 0.003921569, 1, 1,
0.3974044, -0.7474647, 2.349004, 0.003921569, 0, 1, 1,
0.3974989, 0.6292039, 1.401949, 0.007843138, 0, 1, 1,
0.3980917, -0.1657218, 4.193864, 0.01568628, 0, 1, 1,
0.3992008, 0.08161485, 2.204992, 0.01960784, 0, 1, 1,
0.4065734, -0.5696447, 3.686096, 0.02745098, 0, 1, 1,
0.4075435, 0.3525414, 1.324192, 0.03137255, 0, 1, 1,
0.4083401, -0.1433072, 0.6914101, 0.03921569, 0, 1, 1,
0.4083738, -0.6617033, 2.670613, 0.04313726, 0, 1, 1,
0.4112379, 1.199434, 0.1532541, 0.05098039, 0, 1, 1,
0.4113842, -0.6208023, 1.301542, 0.05490196, 0, 1, 1,
0.4127269, 0.8214175, -0.7756777, 0.0627451, 0, 1, 1,
0.4127392, -0.2762636, 1.86012, 0.06666667, 0, 1, 1,
0.4131564, -0.3404315, 2.212899, 0.07450981, 0, 1, 1,
0.4132919, -1.203074, 3.160904, 0.07843138, 0, 1, 1,
0.413986, -0.1191212, 2.773093, 0.08627451, 0, 1, 1,
0.4155809, 0.1824297, -0.6613292, 0.09019608, 0, 1, 1,
0.4163227, -1.80136, 2.017683, 0.09803922, 0, 1, 1,
0.4195354, -0.8711009, 2.296174, 0.1058824, 0, 1, 1,
0.4278079, -0.3133195, 1.845058, 0.1098039, 0, 1, 1,
0.4283361, 0.1685491, 2.058614, 0.1176471, 0, 1, 1,
0.437146, -0.6789844, 0.351064, 0.1215686, 0, 1, 1,
0.4373748, -0.1920959, 0.8367146, 0.1294118, 0, 1, 1,
0.44119, 1.173482, 0.1297909, 0.1333333, 0, 1, 1,
0.4439352, -0.6506377, 3.866925, 0.1411765, 0, 1, 1,
0.4499253, -0.5627183, 4.130723, 0.145098, 0, 1, 1,
0.4517576, 1.069959, 1.300778, 0.1529412, 0, 1, 1,
0.4531018, -0.8150474, 4.340021, 0.1568628, 0, 1, 1,
0.4553872, 0.8367593, 0.50819, 0.1647059, 0, 1, 1,
0.4566485, -2.19792, 4.280558, 0.1686275, 0, 1, 1,
0.459529, -0.1343806, -0.2659057, 0.1764706, 0, 1, 1,
0.4613265, 2.145237, 1.288492, 0.1803922, 0, 1, 1,
0.4617652, 0.5039454, 0.7917551, 0.1882353, 0, 1, 1,
0.4622117, -1.073876, 2.993562, 0.1921569, 0, 1, 1,
0.466879, 0.01387832, 0.7230206, 0.2, 0, 1, 1,
0.4673702, -0.5187309, 1.660349, 0.2078431, 0, 1, 1,
0.4677584, -0.4476862, 1.358165, 0.2117647, 0, 1, 1,
0.4683009, -0.2180402, 2.195246, 0.2196078, 0, 1, 1,
0.4707619, -0.5155197, 3.676409, 0.2235294, 0, 1, 1,
0.4709607, -1.867756, 2.686648, 0.2313726, 0, 1, 1,
0.4717524, -0.9721932, 4.718877, 0.2352941, 0, 1, 1,
0.4843315, 1.655563, 1.064743, 0.2431373, 0, 1, 1,
0.4885597, 0.8874602, 3.245285, 0.2470588, 0, 1, 1,
0.488881, -0.6745766, 0.2676788, 0.254902, 0, 1, 1,
0.4914543, -0.2515735, 4.7747, 0.2588235, 0, 1, 1,
0.4944716, 0.5933871, 1.324239, 0.2666667, 0, 1, 1,
0.4951431, 0.490719, 1.74014, 0.2705882, 0, 1, 1,
0.502471, -0.2886472, 2.010716, 0.2784314, 0, 1, 1,
0.5049444, -0.4809408, 0.03098427, 0.282353, 0, 1, 1,
0.5101336, -2.048283, 3.015157, 0.2901961, 0, 1, 1,
0.5120827, -0.5521209, 2.574325, 0.2941177, 0, 1, 1,
0.5131518, -0.08061582, 0.9993933, 0.3019608, 0, 1, 1,
0.5165733, 2.722317, 0.6208593, 0.3098039, 0, 1, 1,
0.5168999, -1.832261, 3.258251, 0.3137255, 0, 1, 1,
0.5211182, -0.7246761, 2.421488, 0.3215686, 0, 1, 1,
0.5278881, -0.4387789, 2.228436, 0.3254902, 0, 1, 1,
0.5284154, 0.3354327, 2.404248, 0.3333333, 0, 1, 1,
0.5286017, -0.5129369, 2.642369, 0.3372549, 0, 1, 1,
0.5314779, 0.05090211, 0.8622956, 0.345098, 0, 1, 1,
0.5353261, 0.6175253, 2.746205, 0.3490196, 0, 1, 1,
0.5364696, 1.412777, -0.6053569, 0.3568628, 0, 1, 1,
0.5376551, -1.19583, 0.5286923, 0.3607843, 0, 1, 1,
0.5379267, -1.604917, 3.169223, 0.3686275, 0, 1, 1,
0.5383798, 1.140071, 0.05034998, 0.372549, 0, 1, 1,
0.5414491, 1.719517, -0.7600741, 0.3803922, 0, 1, 1,
0.5434733, 0.7299632, 0.5101812, 0.3843137, 0, 1, 1,
0.5455705, -1.34978, 1.523458, 0.3921569, 0, 1, 1,
0.54814, -0.9789585, 1.122748, 0.3960784, 0, 1, 1,
0.5542251, 0.6121546, -0.6301441, 0.4039216, 0, 1, 1,
0.5613028, -0.2647653, 0.7694625, 0.4117647, 0, 1, 1,
0.5696562, -0.5492331, 1.675374, 0.4156863, 0, 1, 1,
0.5715902, 0.736936, 1.265523, 0.4235294, 0, 1, 1,
0.5721945, -0.5310419, 3.470822, 0.427451, 0, 1, 1,
0.5741227, -0.8200677, 3.31736, 0.4352941, 0, 1, 1,
0.5771989, 2.460915, 1.566338, 0.4392157, 0, 1, 1,
0.5792482, 1.308604, 2.073024, 0.4470588, 0, 1, 1,
0.5813543, -0.4971749, 0.8799399, 0.4509804, 0, 1, 1,
0.5835471, -0.442104, 0.1986818, 0.4588235, 0, 1, 1,
0.5842705, -0.03323482, 1.391908, 0.4627451, 0, 1, 1,
0.5860354, 0.4027261, 2.860909, 0.4705882, 0, 1, 1,
0.5943009, 0.383836, -0.3988034, 0.4745098, 0, 1, 1,
0.597392, 0.598114, 0.6536183, 0.4823529, 0, 1, 1,
0.5976416, -0.7585537, 3.100141, 0.4862745, 0, 1, 1,
0.5991141, -0.5252561, 0.6927446, 0.4941176, 0, 1, 1,
0.6057107, -1.172993, 1.801206, 0.5019608, 0, 1, 1,
0.6126519, 0.06723171, 1.564009, 0.5058824, 0, 1, 1,
0.6305349, -0.9622211, 2.633658, 0.5137255, 0, 1, 1,
0.6316607, -0.02956505, 0.9667065, 0.5176471, 0, 1, 1,
0.6355003, 1.214536, -0.2284278, 0.5254902, 0, 1, 1,
0.6407289, -0.3936786, 2.236065, 0.5294118, 0, 1, 1,
0.6495921, 0.4314097, 1.368003, 0.5372549, 0, 1, 1,
0.6508268, 0.544608, 0.5490258, 0.5411765, 0, 1, 1,
0.6522399, 0.3483966, 1.240263, 0.5490196, 0, 1, 1,
0.6547972, -0.3704356, 0.9396353, 0.5529412, 0, 1, 1,
0.654801, -0.489665, 3.220941, 0.5607843, 0, 1, 1,
0.6564449, 1.070823, -0.03337563, 0.5647059, 0, 1, 1,
0.6585134, 0.5093546, -0.3441651, 0.572549, 0, 1, 1,
0.6628025, -0.6661292, 2.564919, 0.5764706, 0, 1, 1,
0.6689194, 0.590378, 0.7112799, 0.5843138, 0, 1, 1,
0.6720971, 0.4534427, 0.9674974, 0.5882353, 0, 1, 1,
0.6762109, 1.380527, 0.9753143, 0.5960785, 0, 1, 1,
0.6773876, -0.2882099, 0.9885467, 0.6039216, 0, 1, 1,
0.67879, 0.9366444, 1.361025, 0.6078432, 0, 1, 1,
0.680687, -0.3119605, 0.583091, 0.6156863, 0, 1, 1,
0.6816842, 0.02571107, 2.07019, 0.6196079, 0, 1, 1,
0.6835908, -0.1485838, 2.673821, 0.627451, 0, 1, 1,
0.6848367, 0.444446, 0.8145451, 0.6313726, 0, 1, 1,
0.6865798, -1.068341, 2.736162, 0.6392157, 0, 1, 1,
0.6866375, -1.514127, 4.999106, 0.6431373, 0, 1, 1,
0.689527, -0.5816965, 2.310463, 0.6509804, 0, 1, 1,
0.6963823, 0.01140939, 1.070588, 0.654902, 0, 1, 1,
0.7219131, -0.5118209, 3.014131, 0.6627451, 0, 1, 1,
0.7263408, -1.460099, 3.754794, 0.6666667, 0, 1, 1,
0.7358695, 0.2653548, 0.9687511, 0.6745098, 0, 1, 1,
0.7370163, -0.01537971, 1.841328, 0.6784314, 0, 1, 1,
0.739158, -1.372425, 2.050341, 0.6862745, 0, 1, 1,
0.7427145, 0.4737101, 0.5150201, 0.6901961, 0, 1, 1,
0.7493354, 0.8453673, -0.2121519, 0.6980392, 0, 1, 1,
0.7518893, 0.305723, 0.2153109, 0.7058824, 0, 1, 1,
0.7588272, 0.4799277, 0.3767587, 0.7098039, 0, 1, 1,
0.7623475, 0.2564849, 0.8766032, 0.7176471, 0, 1, 1,
0.7636073, -2.266564, 2.557098, 0.7215686, 0, 1, 1,
0.7639927, 0.5692387, 0.2503407, 0.7294118, 0, 1, 1,
0.7674192, 0.07460985, 2.332298, 0.7333333, 0, 1, 1,
0.7707188, -0.5457593, 1.08139, 0.7411765, 0, 1, 1,
0.7777643, -3.065171, 4.534084, 0.7450981, 0, 1, 1,
0.7810903, 0.1844365, 0.5487666, 0.7529412, 0, 1, 1,
0.7932542, -0.5335644, 1.925305, 0.7568628, 0, 1, 1,
0.8001564, -0.7792643, 1.985521, 0.7647059, 0, 1, 1,
0.8021515, -0.5389556, 1.228374, 0.7686275, 0, 1, 1,
0.8071082, 2.319646, 0.2299164, 0.7764706, 0, 1, 1,
0.8115273, -0.8423533, 3.164587, 0.7803922, 0, 1, 1,
0.8124438, -0.671954, 2.868893, 0.7882353, 0, 1, 1,
0.8148791, 1.414343, -0.4316786, 0.7921569, 0, 1, 1,
0.816504, -0.9761611, 2.742218, 0.8, 0, 1, 1,
0.8191203, 0.561421, 0.4997297, 0.8078431, 0, 1, 1,
0.8211381, 2.800045, 1.948644, 0.8117647, 0, 1, 1,
0.8221782, 0.109522, 3.37675, 0.8196079, 0, 1, 1,
0.8231719, 0.08571716, 2.048265, 0.8235294, 0, 1, 1,
0.8242304, -1.224599, 3.372673, 0.8313726, 0, 1, 1,
0.827095, 0.5499108, 0.521053, 0.8352941, 0, 1, 1,
0.8279824, -1.229063, 3.355249, 0.8431373, 0, 1, 1,
0.8315491, -2.448328, 3.488742, 0.8470588, 0, 1, 1,
0.8344908, -0.1370697, 1.22258, 0.854902, 0, 1, 1,
0.8395522, 0.5076717, 2.022972, 0.8588235, 0, 1, 1,
0.8482288, -1.757573, 3.817611, 0.8666667, 0, 1, 1,
0.8498157, -0.6765129, 1.779482, 0.8705882, 0, 1, 1,
0.8533661, -0.05891694, 1.76938, 0.8784314, 0, 1, 1,
0.869573, -0.2772606, 2.37226, 0.8823529, 0, 1, 1,
0.8759392, -1.173864, 2.485678, 0.8901961, 0, 1, 1,
0.8875077, -2.054867, 1.738437, 0.8941177, 0, 1, 1,
0.8877479, -0.08118175, 2.335061, 0.9019608, 0, 1, 1,
0.8898041, 0.5670184, -0.402827, 0.9098039, 0, 1, 1,
0.9144747, 1.523975, 0.3844499, 0.9137255, 0, 1, 1,
0.9271362, -0.02073203, 0.736697, 0.9215686, 0, 1, 1,
0.9333091, -1.044939, 3.408737, 0.9254902, 0, 1, 1,
0.9335123, 0.7740788, 0.9446425, 0.9333333, 0, 1, 1,
0.9357547, 0.6362029, 1.34243, 0.9372549, 0, 1, 1,
0.943934, 1.631448, 1.021043, 0.945098, 0, 1, 1,
0.9519027, -0.2731857, 3.222779, 0.9490196, 0, 1, 1,
0.9527743, -0.4474106, 4.51532, 0.9568627, 0, 1, 1,
0.9582281, 0.6153212, -0.3088298, 0.9607843, 0, 1, 1,
0.9592931, 2.374107, 0.2602818, 0.9686275, 0, 1, 1,
0.9639938, -0.8154157, 2.096682, 0.972549, 0, 1, 1,
0.9646828, -0.6107764, 2.975406, 0.9803922, 0, 1, 1,
0.9677932, -0.3837399, 2.718378, 0.9843137, 0, 1, 1,
0.9685565, 0.5076845, -0.06238491, 0.9921569, 0, 1, 1,
0.9701875, -0.2051618, 1.414661, 0.9960784, 0, 1, 1,
0.9709895, -0.7189577, 2.23621, 1, 0, 0.9960784, 1,
0.9711266, -1.235562, 2.220651, 1, 0, 0.9882353, 1,
0.9729996, 1.464574, -0.06645873, 1, 0, 0.9843137, 1,
0.9830196, 0.3188982, 0.79606, 1, 0, 0.9764706, 1,
0.9847523, -0.371231, 2.300281, 1, 0, 0.972549, 1,
0.9856502, -0.3476622, 2.535508, 1, 0, 0.9647059, 1,
0.9953191, -0.253508, 2.75986, 1, 0, 0.9607843, 1,
0.9993482, 0.5192609, 1.626542, 1, 0, 0.9529412, 1,
1.001902, 0.8190557, 0.08591575, 1, 0, 0.9490196, 1,
1.00716, 0.925285, 0.8745255, 1, 0, 0.9411765, 1,
1.009304, -0.417362, 2.929587, 1, 0, 0.9372549, 1,
1.011453, -0.1923265, 3.888535, 1, 0, 0.9294118, 1,
1.012955, -0.257686, 3.043178, 1, 0, 0.9254902, 1,
1.015216, 0.3951026, 0.6799064, 1, 0, 0.9176471, 1,
1.015572, 0.2231356, 2.531337, 1, 0, 0.9137255, 1,
1.019836, 0.6583495, 0.548767, 1, 0, 0.9058824, 1,
1.023729, 1.144457, 1.84412, 1, 0, 0.9019608, 1,
1.026414, 0.9031596, 1.625814, 1, 0, 0.8941177, 1,
1.026687, 1.310409, 2.402934, 1, 0, 0.8862745, 1,
1.030435, -1.130349, 3.47903, 1, 0, 0.8823529, 1,
1.033668, -0.4423882, 1.919439, 1, 0, 0.8745098, 1,
1.037543, -2.362865, 2.865365, 1, 0, 0.8705882, 1,
1.042238, 0.8775855, 3.086522, 1, 0, 0.8627451, 1,
1.043202, 0.177986, 1.089226, 1, 0, 0.8588235, 1,
1.046035, 1.663431, 0.3598413, 1, 0, 0.8509804, 1,
1.047458, -0.283087, 1.46001, 1, 0, 0.8470588, 1,
1.053999, -1.871016, 0.9755449, 1, 0, 0.8392157, 1,
1.06819, 1.047177, 0.5805276, 1, 0, 0.8352941, 1,
1.068517, 0.7934524, -0.360595, 1, 0, 0.827451, 1,
1.076818, 1.031713, 2.081641, 1, 0, 0.8235294, 1,
1.092075, -1.437049, 2.377134, 1, 0, 0.8156863, 1,
1.11848, -0.1061587, 0.2557165, 1, 0, 0.8117647, 1,
1.122099, 1.00743, -0.2682246, 1, 0, 0.8039216, 1,
1.124158, -0.4027551, 3.548424, 1, 0, 0.7960784, 1,
1.126419, -0.8398291, 3.135364, 1, 0, 0.7921569, 1,
1.126765, -0.931251, 1.466241, 1, 0, 0.7843137, 1,
1.129079, -0.4764465, 1.970192, 1, 0, 0.7803922, 1,
1.129714, -0.8140886, 1.317514, 1, 0, 0.772549, 1,
1.131838, -0.1552732, 1.612599, 1, 0, 0.7686275, 1,
1.132196, 1.391574, 0.1840018, 1, 0, 0.7607843, 1,
1.133534, 0.5182216, 0.5097328, 1, 0, 0.7568628, 1,
1.135993, 0.7692822, 1.181417, 1, 0, 0.7490196, 1,
1.147469, 0.05432014, -0.4224083, 1, 0, 0.7450981, 1,
1.147629, 0.5669082, 3.157682, 1, 0, 0.7372549, 1,
1.148916, -0.8875448, 1.150041, 1, 0, 0.7333333, 1,
1.151428, -1.379625, 2.331396, 1, 0, 0.7254902, 1,
1.154967, -0.4648308, 2.805671, 1, 0, 0.7215686, 1,
1.155257, 1.3335, -0.8920331, 1, 0, 0.7137255, 1,
1.162957, -0.1594444, 2.396373, 1, 0, 0.7098039, 1,
1.167659, 0.9899551, -0.3301618, 1, 0, 0.7019608, 1,
1.168909, 0.02054105, -0.02782228, 1, 0, 0.6941177, 1,
1.171552, 0.5431875, 3.038049, 1, 0, 0.6901961, 1,
1.178884, 0.1201947, 0.2071228, 1, 0, 0.682353, 1,
1.183849, -0.2058381, 0.8848477, 1, 0, 0.6784314, 1,
1.192259, -0.9174525, 2.142705, 1, 0, 0.6705883, 1,
1.196419, -1.244451, 4.560604, 1, 0, 0.6666667, 1,
1.199866, 0.3747939, 1.731521, 1, 0, 0.6588235, 1,
1.20054, -0.7719569, 0.7767107, 1, 0, 0.654902, 1,
1.211468, 1.843517, 1.997469, 1, 0, 0.6470588, 1,
1.220009, -0.8354274, 2.45683, 1, 0, 0.6431373, 1,
1.231272, -0.06718145, 2.153471, 1, 0, 0.6352941, 1,
1.23781, -1.006248, 1.188663, 1, 0, 0.6313726, 1,
1.243428, -0.5694944, 2.805727, 1, 0, 0.6235294, 1,
1.258122, -1.511811, 2.109913, 1, 0, 0.6196079, 1,
1.260483, -0.5431415, 3.269593, 1, 0, 0.6117647, 1,
1.27384, -0.7392512, 1.213831, 1, 0, 0.6078432, 1,
1.286087, -1.801262, 2.140803, 1, 0, 0.6, 1,
1.286396, 0.5213407, 2.191629, 1, 0, 0.5921569, 1,
1.290941, -0.02373858, 1.760848, 1, 0, 0.5882353, 1,
1.292458, -0.423059, 2.296098, 1, 0, 0.5803922, 1,
1.293652, 1.52557, 0.6005902, 1, 0, 0.5764706, 1,
1.299692, 0.03208695, 0.8268549, 1, 0, 0.5686275, 1,
1.301821, 0.2770493, -0.9094286, 1, 0, 0.5647059, 1,
1.304228, 0.3520309, 1.582503, 1, 0, 0.5568628, 1,
1.304783, -0.6891693, 1.955039, 1, 0, 0.5529412, 1,
1.305654, 0.2235214, 1.056284, 1, 0, 0.5450981, 1,
1.306669, -1.448879, 2.510885, 1, 0, 0.5411765, 1,
1.307771, 0.4828106, 1.363398, 1, 0, 0.5333334, 1,
1.31008, 0.1452723, 0.8111587, 1, 0, 0.5294118, 1,
1.312355, -0.9831331, 2.156097, 1, 0, 0.5215687, 1,
1.314634, 0.595704, 1.193004, 1, 0, 0.5176471, 1,
1.316956, -0.1101774, 1.396417, 1, 0, 0.509804, 1,
1.334615, -1.688606, 2.352401, 1, 0, 0.5058824, 1,
1.342434, 0.1018821, 0.9937643, 1, 0, 0.4980392, 1,
1.34497, -1.941197, 0.9520633, 1, 0, 0.4901961, 1,
1.347853, 2.559, 2.879985, 1, 0, 0.4862745, 1,
1.355119, 0.8982189, 0.5092945, 1, 0, 0.4784314, 1,
1.355194, 0.2553818, 2.353637, 1, 0, 0.4745098, 1,
1.367849, -0.506898, 3.486804, 1, 0, 0.4666667, 1,
1.373642, -0.5022588, 2.073858, 1, 0, 0.4627451, 1,
1.379817, -1.037078, 1.068828, 1, 0, 0.454902, 1,
1.382499, -1.022549, 1.197649, 1, 0, 0.4509804, 1,
1.383423, -1.202881, 1.765907, 1, 0, 0.4431373, 1,
1.385488, -0.8239969, 2.077449, 1, 0, 0.4392157, 1,
1.393098, 0.999024, -0.932937, 1, 0, 0.4313726, 1,
1.401216, -1.535436, 2.633989, 1, 0, 0.427451, 1,
1.404601, -0.5116307, 4.37944, 1, 0, 0.4196078, 1,
1.407629, 1.227624, 0.9190165, 1, 0, 0.4156863, 1,
1.408379, 0.586455, -0.06916391, 1, 0, 0.4078431, 1,
1.41077, 0.1274099, 1.97213, 1, 0, 0.4039216, 1,
1.423165, -0.5457615, 0.04223422, 1, 0, 0.3960784, 1,
1.425315, -0.0383353, 1.707952, 1, 0, 0.3882353, 1,
1.438523, -0.4722728, 2.401577, 1, 0, 0.3843137, 1,
1.439268, -0.3832788, 1.949716, 1, 0, 0.3764706, 1,
1.441767, 0.06836937, 2.34664, 1, 0, 0.372549, 1,
1.444266, 0.5250554, 1.803772, 1, 0, 0.3647059, 1,
1.453824, 0.1474558, 2.653096, 1, 0, 0.3607843, 1,
1.46943, 0.7323697, 2.975213, 1, 0, 0.3529412, 1,
1.487837, 0.001254337, 1.647204, 1, 0, 0.3490196, 1,
1.495801, -1.346045, 2.556263, 1, 0, 0.3411765, 1,
1.507877, -0.8335079, 2.692147, 1, 0, 0.3372549, 1,
1.516442, -1.395915, 1.732049, 1, 0, 0.3294118, 1,
1.520784, 0.4479656, 1.178664, 1, 0, 0.3254902, 1,
1.52363, 0.5264869, 1.703192, 1, 0, 0.3176471, 1,
1.529355, 0.448348, 1.068444, 1, 0, 0.3137255, 1,
1.544746, 0.6431953, -0.02733078, 1, 0, 0.3058824, 1,
1.583978, 1.140471, 0.2654474, 1, 0, 0.2980392, 1,
1.599897, -0.1123111, 0.2282088, 1, 0, 0.2941177, 1,
1.605323, 0.7757166, 1.448441, 1, 0, 0.2862745, 1,
1.621906, -0.1772339, 1.236646, 1, 0, 0.282353, 1,
1.630333, 1.962533, 1.074528, 1, 0, 0.2745098, 1,
1.636687, -0.4386752, 2.437658, 1, 0, 0.2705882, 1,
1.641343, -1.875801, 3.870381, 1, 0, 0.2627451, 1,
1.653052, 0.3594052, 0.7635594, 1, 0, 0.2588235, 1,
1.663255, -2.448594, 2.313469, 1, 0, 0.2509804, 1,
1.680598, 0.7855965, 1.443145, 1, 0, 0.2470588, 1,
1.690414, 0.4006529, 1.207595, 1, 0, 0.2392157, 1,
1.696443, 0.5229909, 2.02286, 1, 0, 0.2352941, 1,
1.701681, -0.6435252, 1.865055, 1, 0, 0.227451, 1,
1.70788, -0.4018267, 2.820563, 1, 0, 0.2235294, 1,
1.731441, -0.1566497, 2.607728, 1, 0, 0.2156863, 1,
1.735615, -0.5408699, 3.040939, 1, 0, 0.2117647, 1,
1.738246, -0.8494345, 3.23002, 1, 0, 0.2039216, 1,
1.748867, 0.9309733, -1.298083, 1, 0, 0.1960784, 1,
1.751325, 1.036153, 1.478731, 1, 0, 0.1921569, 1,
1.756731, 0.08639463, 0.2210704, 1, 0, 0.1843137, 1,
1.792252, 0.09242691, 0.5168628, 1, 0, 0.1803922, 1,
1.799214, 1.658635, 2.639651, 1, 0, 0.172549, 1,
1.843802, -0.770292, 2.067978, 1, 0, 0.1686275, 1,
1.86165, -1.789418, 3.430406, 1, 0, 0.1607843, 1,
1.869516, -1.340161, 2.332308, 1, 0, 0.1568628, 1,
1.910492, 0.9124176, 0.04882579, 1, 0, 0.1490196, 1,
1.947742, -0.9411495, 0.9029008, 1, 0, 0.145098, 1,
1.954014, -1.812404, 2.947412, 1, 0, 0.1372549, 1,
1.991161, 0.1306211, -0.492519, 1, 0, 0.1333333, 1,
2.119812, -0.2425906, 2.012227, 1, 0, 0.1254902, 1,
2.145346, 0.1098464, 2.128297, 1, 0, 0.1215686, 1,
2.193255, 0.5784016, 0.03165865, 1, 0, 0.1137255, 1,
2.208155, 0.6024958, 2.38812, 1, 0, 0.1098039, 1,
2.257415, 1.869726, 2.188566, 1, 0, 0.1019608, 1,
2.276027, 0.4477609, 1.122854, 1, 0, 0.09411765, 1,
2.283303, 0.695443, 2.606487, 1, 0, 0.09019608, 1,
2.304631, 1.139667, 2.721779, 1, 0, 0.08235294, 1,
2.338199, -1.282194, 2.450736, 1, 0, 0.07843138, 1,
2.375435, 1.183012, 2.093328, 1, 0, 0.07058824, 1,
2.413492, -1.77653, 3.033657, 1, 0, 0.06666667, 1,
2.431867, 1.488092, 0.2929579, 1, 0, 0.05882353, 1,
2.498702, 0.8183233, 1.340169, 1, 0, 0.05490196, 1,
2.507581, 0.1743061, 0.3134932, 1, 0, 0.04705882, 1,
2.540389, -0.4028392, 1.72348, 1, 0, 0.04313726, 1,
2.554627, -1.083824, 2.130482, 1, 0, 0.03529412, 1,
2.731392, 0.1502887, 0.5781627, 1, 0, 0.03137255, 1,
2.756555, -0.2376226, 1.405439, 1, 0, 0.02352941, 1,
2.795656, 0.6122853, -0.4060664, 1, 0, 0.01960784, 1,
2.807827, -1.633013, 0.8958818, 1, 0, 0.01176471, 1,
3.35464, 0.5501396, 1.112934, 1, 0, 0.007843138, 1
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
0.1871232, -4.12028, -6.674149, 0, -0.5, 0.5, 0.5,
0.1871232, -4.12028, -6.674149, 1, -0.5, 0.5, 0.5,
0.1871232, -4.12028, -6.674149, 1, 1.5, 0.5, 0.5,
0.1871232, -4.12028, -6.674149, 0, 1.5, 0.5, 0.5
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
-4.054181, 0.04724431, -6.674149, 0, -0.5, 0.5, 0.5,
-4.054181, 0.04724431, -6.674149, 1, -0.5, 0.5, 0.5,
-4.054181, 0.04724431, -6.674149, 1, 1.5, 0.5, 0.5,
-4.054181, 0.04724431, -6.674149, 0, 1.5, 0.5, 0.5
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
-4.054181, -4.12028, 0.1789577, 0, -0.5, 0.5, 0.5,
-4.054181, -4.12028, 0.1789577, 1, -0.5, 0.5, 0.5,
-4.054181, -4.12028, 0.1789577, 1, 1.5, 0.5, 0.5,
-4.054181, -4.12028, 0.1789577, 0, 1.5, 0.5, 0.5
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
-2, -3.158543, -5.092663,
3, -3.158543, -5.092663,
-2, -3.158543, -5.092663,
-2, -3.318833, -5.356244,
-1, -3.158543, -5.092663,
-1, -3.318833, -5.356244,
0, -3.158543, -5.092663,
0, -3.318833, -5.356244,
1, -3.158543, -5.092663,
1, -3.318833, -5.356244,
2, -3.158543, -5.092663,
2, -3.318833, -5.356244,
3, -3.158543, -5.092663,
3, -3.318833, -5.356244
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
-2, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
-2, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
-2, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
-2, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5,
-1, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
-1, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
-1, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
-1, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5,
0, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
0, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
0, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
0, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5,
1, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
1, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
1, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
1, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5,
2, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
2, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
2, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
2, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5,
3, -3.639412, -5.883406, 0, -0.5, 0.5, 0.5,
3, -3.639412, -5.883406, 1, -0.5, 0.5, 0.5,
3, -3.639412, -5.883406, 1, 1.5, 0.5, 0.5,
3, -3.639412, -5.883406, 0, 1.5, 0.5, 0.5
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
-3.075419, -3, -5.092663,
-3.075419, 3, -5.092663,
-3.075419, -3, -5.092663,
-3.238546, -3, -5.356244,
-3.075419, -2, -5.092663,
-3.238546, -2, -5.356244,
-3.075419, -1, -5.092663,
-3.238546, -1, -5.356244,
-3.075419, 0, -5.092663,
-3.238546, 0, -5.356244,
-3.075419, 1, -5.092663,
-3.238546, 1, -5.356244,
-3.075419, 2, -5.092663,
-3.238546, 2, -5.356244,
-3.075419, 3, -5.092663,
-3.238546, 3, -5.356244
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
-3.5648, -3, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, -3, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, -3, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, -3, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, -2, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, -2, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, -2, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, -2, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, -1, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, -1, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, -1, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, -1, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, 0, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, 0, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, 0, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, 0, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, 1, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, 1, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, 1, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, 1, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, 2, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, 2, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, 2, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, 2, -5.883406, 0, 1.5, 0.5, 0.5,
-3.5648, 3, -5.883406, 0, -0.5, 0.5, 0.5,
-3.5648, 3, -5.883406, 1, -0.5, 0.5, 0.5,
-3.5648, 3, -5.883406, 1, 1.5, 0.5, 0.5,
-3.5648, 3, -5.883406, 0, 1.5, 0.5, 0.5
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
-3.075419, -3.158543, -4,
-3.075419, -3.158543, 4,
-3.075419, -3.158543, -4,
-3.238546, -3.318833, -4,
-3.075419, -3.158543, -2,
-3.238546, -3.318833, -2,
-3.075419, -3.158543, 0,
-3.238546, -3.318833, 0,
-3.075419, -3.158543, 2,
-3.238546, -3.318833, 2,
-3.075419, -3.158543, 4,
-3.238546, -3.318833, 4
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
-3.5648, -3.639412, -4, 0, -0.5, 0.5, 0.5,
-3.5648, -3.639412, -4, 1, -0.5, 0.5, 0.5,
-3.5648, -3.639412, -4, 1, 1.5, 0.5, 0.5,
-3.5648, -3.639412, -4, 0, 1.5, 0.5, 0.5,
-3.5648, -3.639412, -2, 0, -0.5, 0.5, 0.5,
-3.5648, -3.639412, -2, 1, -0.5, 0.5, 0.5,
-3.5648, -3.639412, -2, 1, 1.5, 0.5, 0.5,
-3.5648, -3.639412, -2, 0, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 0, 0, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 0, 1, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 0, 1, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 0, 0, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 2, 0, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 2, 1, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 2, 1, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 2, 0, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 4, 0, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 4, 1, -0.5, 0.5, 0.5,
-3.5648, -3.639412, 4, 1, 1.5, 0.5, 0.5,
-3.5648, -3.639412, 4, 0, 1.5, 0.5, 0.5
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
-3.075419, -3.158543, -5.092663,
-3.075419, 3.253032, -5.092663,
-3.075419, -3.158543, 5.450578,
-3.075419, 3.253032, 5.450578,
-3.075419, -3.158543, -5.092663,
-3.075419, -3.158543, 5.450578,
-3.075419, 3.253032, -5.092663,
-3.075419, 3.253032, 5.450578,
-3.075419, -3.158543, -5.092663,
3.449665, -3.158543, -5.092663,
-3.075419, -3.158543, 5.450578,
3.449665, -3.158543, 5.450578,
-3.075419, 3.253032, -5.092663,
3.449665, 3.253032, -5.092663,
-3.075419, 3.253032, 5.450578,
3.449665, 3.253032, 5.450578,
3.449665, -3.158543, -5.092663,
3.449665, 3.253032, -5.092663,
3.449665, -3.158543, 5.450578,
3.449665, 3.253032, 5.450578,
3.449665, -3.158543, -5.092663,
3.449665, -3.158543, 5.450578,
3.449665, 3.253032, -5.092663,
3.449665, 3.253032, 5.450578
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
var radius = 7.453668;
var distance = 33.16221;
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
mvMatrix.translate( -0.1871232, -0.04724431, -0.1789577 );
mvMatrix.scale( 1.235088, 1.256953, 0.7643809 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16221);
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


