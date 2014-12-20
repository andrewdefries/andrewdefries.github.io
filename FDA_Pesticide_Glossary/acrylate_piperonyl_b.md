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
-3.191733, -0.2804794, -1.663825, 1, 0, 0, 1,
-3.122643, 0.1033417, -2.642675, 1, 0.007843138, 0, 1,
-3.020743, 0.6678188, -0.4234954, 1, 0.01176471, 0, 1,
-2.543127, 0.1556158, -3.744118, 1, 0.01960784, 0, 1,
-2.540811, -0.02851768, -2.247386, 1, 0.02352941, 0, 1,
-2.509254, 0.4833388, -1.704675, 1, 0.03137255, 0, 1,
-2.502661, -2.883001, -1.92938, 1, 0.03529412, 0, 1,
-2.479115, -1.228878, -0.421734, 1, 0.04313726, 0, 1,
-2.46443, 0.4300627, -1.397663, 1, 0.04705882, 0, 1,
-2.430285, 0.8281455, -3.343563, 1, 0.05490196, 0, 1,
-2.418178, 0.4749585, -1.523511, 1, 0.05882353, 0, 1,
-2.389438, 1.181084, -1.289744, 1, 0.06666667, 0, 1,
-2.276108, 1.19013, -2.482594, 1, 0.07058824, 0, 1,
-2.215281, 0.9740738, -1.022398, 1, 0.07843138, 0, 1,
-2.191588, -0.1668106, -0.8920952, 1, 0.08235294, 0, 1,
-2.170779, 1.330645, -2.867206, 1, 0.09019608, 0, 1,
-2.159826, -0.6257648, -2.700284, 1, 0.09411765, 0, 1,
-2.137748, -0.3554167, -2.475967, 1, 0.1019608, 0, 1,
-2.071433, -0.4560184, -0.4848389, 1, 0.1098039, 0, 1,
-2.050447, 0.4918304, -1.301746, 1, 0.1137255, 0, 1,
-2.037903, -0.7230458, -1.966668, 1, 0.1215686, 0, 1,
-2.017001, -1.289884, -0.9526125, 1, 0.1254902, 0, 1,
-1.987819, -0.8129723, -3.745193, 1, 0.1333333, 0, 1,
-1.970589, 0.3481288, -0.9977821, 1, 0.1372549, 0, 1,
-1.936821, 0.1014536, -0.7146149, 1, 0.145098, 0, 1,
-1.902331, 0.1483701, -0.9783882, 1, 0.1490196, 0, 1,
-1.899685, -0.5244234, -0.4067509, 1, 0.1568628, 0, 1,
-1.888199, 0.5597406, -0.7953936, 1, 0.1607843, 0, 1,
-1.876883, -0.2061438, -1.187073, 1, 0.1686275, 0, 1,
-1.872269, 0.6935039, -1.773407, 1, 0.172549, 0, 1,
-1.870576, 0.3730492, -0.3460787, 1, 0.1803922, 0, 1,
-1.847149, -0.6806491, -0.7765678, 1, 0.1843137, 0, 1,
-1.83775, 0.3120651, -1.241094, 1, 0.1921569, 0, 1,
-1.836173, -0.8278719, -2.334004, 1, 0.1960784, 0, 1,
-1.835907, -0.3787667, -0.9898798, 1, 0.2039216, 0, 1,
-1.832731, -0.1511736, -0.7730163, 1, 0.2117647, 0, 1,
-1.819709, 0.6334397, -1.560521, 1, 0.2156863, 0, 1,
-1.792008, 0.1827311, -1.366815, 1, 0.2235294, 0, 1,
-1.79057, 0.7807459, -0.2981668, 1, 0.227451, 0, 1,
-1.779749, -0.08697869, -0.8226063, 1, 0.2352941, 0, 1,
-1.774172, 0.2000267, -2.415213, 1, 0.2392157, 0, 1,
-1.760422, 0.8479844, -0.4756433, 1, 0.2470588, 0, 1,
-1.756356, -0.5589575, -2.039272, 1, 0.2509804, 0, 1,
-1.746851, -1.286018, -3.152573, 1, 0.2588235, 0, 1,
-1.729664, 0.2974314, -2.130664, 1, 0.2627451, 0, 1,
-1.712832, -0.8116553, -1.758684, 1, 0.2705882, 0, 1,
-1.695284, 0.3099344, -2.149533, 1, 0.2745098, 0, 1,
-1.685063, -0.1779162, -0.3905647, 1, 0.282353, 0, 1,
-1.680987, 0.6489751, -0.8770182, 1, 0.2862745, 0, 1,
-1.667191, -0.925127, -3.18244, 1, 0.2941177, 0, 1,
-1.65802, -1.879727, -3.523854, 1, 0.3019608, 0, 1,
-1.633807, -1.296233, -3.634856, 1, 0.3058824, 0, 1,
-1.633584, 0.09581954, 0.1990779, 1, 0.3137255, 0, 1,
-1.628781, 0.2086639, 0.4807285, 1, 0.3176471, 0, 1,
-1.613745, -0.02321582, -1.74001, 1, 0.3254902, 0, 1,
-1.606725, 0.7684628, 0.7028685, 1, 0.3294118, 0, 1,
-1.601077, -1.271648, -1.448814, 1, 0.3372549, 0, 1,
-1.596691, 0.006268268, -0.5085885, 1, 0.3411765, 0, 1,
-1.571755, -0.4342982, -1.849327, 1, 0.3490196, 0, 1,
-1.570197, 1.530892, -0.7272055, 1, 0.3529412, 0, 1,
-1.549343, 0.9823006, -1.679668, 1, 0.3607843, 0, 1,
-1.541981, -0.01868543, -1.697191, 1, 0.3647059, 0, 1,
-1.539743, 0.1752812, -1.449244, 1, 0.372549, 0, 1,
-1.537492, -0.01823195, -0.5911095, 1, 0.3764706, 0, 1,
-1.53665, 0.6345083, -1.490655, 1, 0.3843137, 0, 1,
-1.536576, 3.243116, -0.6978614, 1, 0.3882353, 0, 1,
-1.533824, -0.6459201, -3.792836, 1, 0.3960784, 0, 1,
-1.529717, 0.6838139, -0.7082967, 1, 0.4039216, 0, 1,
-1.524631, 1.815512, -2.386031, 1, 0.4078431, 0, 1,
-1.517215, 0.6024586, 0.05133602, 1, 0.4156863, 0, 1,
-1.515166, 0.8773447, -1.20434, 1, 0.4196078, 0, 1,
-1.512849, 1.469553, -2.982464, 1, 0.427451, 0, 1,
-1.509163, -0.2958074, -3.034526, 1, 0.4313726, 0, 1,
-1.497626, -0.3178407, -1.301296, 1, 0.4392157, 0, 1,
-1.484895, 0.7531745, -1.202482, 1, 0.4431373, 0, 1,
-1.480309, 1.110497, -1.442423, 1, 0.4509804, 0, 1,
-1.477973, -2.179123, -4.130455, 1, 0.454902, 0, 1,
-1.47613, 0.2837048, -0.645743, 1, 0.4627451, 0, 1,
-1.467865, -0.07788702, -2.697533, 1, 0.4666667, 0, 1,
-1.461106, 0.289831, -1.864166, 1, 0.4745098, 0, 1,
-1.459847, 0.7978788, -0.6488443, 1, 0.4784314, 0, 1,
-1.454377, 0.7216622, -1.014126, 1, 0.4862745, 0, 1,
-1.441072, 0.6260608, -0.2408442, 1, 0.4901961, 0, 1,
-1.438544, 1.645329, -0.6435714, 1, 0.4980392, 0, 1,
-1.421178, 1.340907, -0.8542387, 1, 0.5058824, 0, 1,
-1.420798, 1.027515, -0.7582029, 1, 0.509804, 0, 1,
-1.400826, -1.50594, -2.191078, 1, 0.5176471, 0, 1,
-1.3998, -0.7601936, -1.194873, 1, 0.5215687, 0, 1,
-1.399007, 1.201916, -0.3647132, 1, 0.5294118, 0, 1,
-1.398878, -0.4870661, -2.750228, 1, 0.5333334, 0, 1,
-1.398513, 0.2805813, -1.94503, 1, 0.5411765, 0, 1,
-1.398222, -1.040792, -1.555089, 1, 0.5450981, 0, 1,
-1.387349, 0.9078227, -0.8208737, 1, 0.5529412, 0, 1,
-1.382895, -0.3534646, -3.558323, 1, 0.5568628, 0, 1,
-1.376759, -3.089023, -2.011795, 1, 0.5647059, 0, 1,
-1.370328, -0.3804319, -1.596252, 1, 0.5686275, 0, 1,
-1.363778, 1.129918, -0.6445978, 1, 0.5764706, 0, 1,
-1.349674, 0.8616375, -1.717905, 1, 0.5803922, 0, 1,
-1.347665, -0.0455264, -1.519732, 1, 0.5882353, 0, 1,
-1.344149, -1.202703, -4.719925, 1, 0.5921569, 0, 1,
-1.308608, -1.24927, -2.028146, 1, 0.6, 0, 1,
-1.305265, -1.231717, -2.170935, 1, 0.6078432, 0, 1,
-1.304149, 0.3929354, -1.342317, 1, 0.6117647, 0, 1,
-1.294213, 0.9902578, -0.4821755, 1, 0.6196079, 0, 1,
-1.287962, -0.4633581, -0.7277508, 1, 0.6235294, 0, 1,
-1.283209, 0.696588, -1.30488, 1, 0.6313726, 0, 1,
-1.277892, 1.215804, -0.1584789, 1, 0.6352941, 0, 1,
-1.261736, 0.6415957, -0.2166851, 1, 0.6431373, 0, 1,
-1.250171, -1.017511, -2.734716, 1, 0.6470588, 0, 1,
-1.240688, 0.04968001, -2.024042, 1, 0.654902, 0, 1,
-1.239778, 0.2817779, -1.50332, 1, 0.6588235, 0, 1,
-1.237751, -1.10323, -2.103387, 1, 0.6666667, 0, 1,
-1.237478, -0.9042392, -2.5791, 1, 0.6705883, 0, 1,
-1.229686, 0.6073152, -0.3223447, 1, 0.6784314, 0, 1,
-1.229337, -1.000445, -2.618681, 1, 0.682353, 0, 1,
-1.219874, 0.3886274, -0.4578721, 1, 0.6901961, 0, 1,
-1.215304, 0.7653463, -0.8357456, 1, 0.6941177, 0, 1,
-1.210123, 0.1108973, -1.912443, 1, 0.7019608, 0, 1,
-1.20857, 0.2290306, -3.177929, 1, 0.7098039, 0, 1,
-1.20672, 0.7651368, -1.850891, 1, 0.7137255, 0, 1,
-1.205776, -1.130237, -2.148422, 1, 0.7215686, 0, 1,
-1.204698, 0.3456278, -2.193032, 1, 0.7254902, 0, 1,
-1.197899, 1.496158, -1.81216, 1, 0.7333333, 0, 1,
-1.194015, -1.325143, -2.54974, 1, 0.7372549, 0, 1,
-1.190455, -0.1130349, -2.756917, 1, 0.7450981, 0, 1,
-1.190421, 0.3582254, -0.8009004, 1, 0.7490196, 0, 1,
-1.179929, -0.7376943, -0.8605366, 1, 0.7568628, 0, 1,
-1.17435, -1.542112, -3.627578, 1, 0.7607843, 0, 1,
-1.158338, 2.413927, 1.377624, 1, 0.7686275, 0, 1,
-1.156383, 0.08376947, -2.717059, 1, 0.772549, 0, 1,
-1.1495, -1.288179, -0.977896, 1, 0.7803922, 0, 1,
-1.130614, -1.698053, -1.539731, 1, 0.7843137, 0, 1,
-1.120174, -0.2389722, -1.979035, 1, 0.7921569, 0, 1,
-1.119391, -0.2443683, -1.097599, 1, 0.7960784, 0, 1,
-1.116192, -1.417498, -2.965673, 1, 0.8039216, 0, 1,
-1.11264, -0.5888012, -2.97651, 1, 0.8117647, 0, 1,
-1.112493, -1.225297, -2.630212, 1, 0.8156863, 0, 1,
-1.110215, 0.6156054, -0.9608389, 1, 0.8235294, 0, 1,
-1.103968, -1.11947, -2.768633, 1, 0.827451, 0, 1,
-1.103591, 0.5228006, -1.950604, 1, 0.8352941, 0, 1,
-1.101194, -0.213439, -1.876359, 1, 0.8392157, 0, 1,
-1.09972, 0.08238525, -0.1831629, 1, 0.8470588, 0, 1,
-1.087645, -0.254677, -1.706827, 1, 0.8509804, 0, 1,
-1.081962, 0.2002556, -1.054317, 1, 0.8588235, 0, 1,
-1.076087, -0.5768285, -2.460122, 1, 0.8627451, 0, 1,
-1.066636, 0.01231957, -1.743327, 1, 0.8705882, 0, 1,
-1.066286, 0.974243, -0.8331931, 1, 0.8745098, 0, 1,
-1.065578, -1.592355, -2.518795, 1, 0.8823529, 0, 1,
-1.064726, 0.03396657, -0.7403408, 1, 0.8862745, 0, 1,
-1.059846, 0.6230404, -0.7914837, 1, 0.8941177, 0, 1,
-1.050914, 0.08383455, -1.150345, 1, 0.8980392, 0, 1,
-1.044217, -0.3952879, -3.549638, 1, 0.9058824, 0, 1,
-1.043368, -1.358529, -5.287366, 1, 0.9137255, 0, 1,
-1.037995, 0.1961628, -0.1521831, 1, 0.9176471, 0, 1,
-1.023017, -1.756994, -1.598682, 1, 0.9254902, 0, 1,
-1.021828, 0.7571854, -0.9396657, 1, 0.9294118, 0, 1,
-1.020066, 0.9460189, -0.2065426, 1, 0.9372549, 0, 1,
-1.017702, -0.7597497, -3.476718, 1, 0.9411765, 0, 1,
-1.016172, 1.495175, -1.347699, 1, 0.9490196, 0, 1,
-1.015308, 0.1385348, -2.8163, 1, 0.9529412, 0, 1,
-1.008373, 0.91802, 0.6049536, 1, 0.9607843, 0, 1,
-1.007205, 0.6945319, -1.848955, 1, 0.9647059, 0, 1,
-1.000532, 0.373388, -2.350589, 1, 0.972549, 0, 1,
-1.000266, -1.587266, -3.116607, 1, 0.9764706, 0, 1,
-0.9999899, -0.8066779, -2.4542, 1, 0.9843137, 0, 1,
-0.9975408, 0.1589094, -1.953607, 1, 0.9882353, 0, 1,
-0.9961693, 0.04245682, -2.048355, 1, 0.9960784, 0, 1,
-0.9817451, -0.8768806, -2.333731, 0.9960784, 1, 0, 1,
-0.9705969, 0.02505419, -2.18214, 0.9921569, 1, 0, 1,
-0.9694107, 1.465805, -1.542539, 0.9843137, 1, 0, 1,
-0.9621142, 1.242908, 0.3516389, 0.9803922, 1, 0, 1,
-0.9610203, 0.6365733, 0.6746196, 0.972549, 1, 0, 1,
-0.9590294, 1.176842, -0.3040272, 0.9686275, 1, 0, 1,
-0.9559891, -0.8691748, -3.830393, 0.9607843, 1, 0, 1,
-0.9544098, 0.830263, -0.9081424, 0.9568627, 1, 0, 1,
-0.9448311, -0.7571818, -3.624295, 0.9490196, 1, 0, 1,
-0.9414325, 0.505208, -1.252845, 0.945098, 1, 0, 1,
-0.9408579, 0.1931541, -0.1687188, 0.9372549, 1, 0, 1,
-0.9350637, 1.618183, -2.742959, 0.9333333, 1, 0, 1,
-0.9345902, 0.2018322, -2.573153, 0.9254902, 1, 0, 1,
-0.9315684, -2.071725, -2.744333, 0.9215686, 1, 0, 1,
-0.9261805, -1.120225, -0.4922225, 0.9137255, 1, 0, 1,
-0.9240586, -0.04281774, -0.01358097, 0.9098039, 1, 0, 1,
-0.920859, -2.248411, -1.963246, 0.9019608, 1, 0, 1,
-0.9191499, 1.0187, 0.08353191, 0.8941177, 1, 0, 1,
-0.9165884, -1.160788, -2.337255, 0.8901961, 1, 0, 1,
-0.9137863, 2.621372, -1.169105, 0.8823529, 1, 0, 1,
-0.9067519, -1.382725, -3.246486, 0.8784314, 1, 0, 1,
-0.9060241, -0.8754273, -1.703198, 0.8705882, 1, 0, 1,
-0.9025937, -1.333895, -1.163005, 0.8666667, 1, 0, 1,
-0.8901099, -2.02622, -5.054751, 0.8588235, 1, 0, 1,
-0.8860728, -0.5357772, -4.723154, 0.854902, 1, 0, 1,
-0.8858669, 1.109014, -0.02426659, 0.8470588, 1, 0, 1,
-0.8724687, -0.2970388, -0.6491354, 0.8431373, 1, 0, 1,
-0.8715124, 0.8973358, -2.138549, 0.8352941, 1, 0, 1,
-0.8683902, 0.1666323, -1.159998, 0.8313726, 1, 0, 1,
-0.8660548, -1.444814, -2.570005, 0.8235294, 1, 0, 1,
-0.8600929, -0.7624086, -2.018438, 0.8196079, 1, 0, 1,
-0.85818, -0.0700436, -1.525396, 0.8117647, 1, 0, 1,
-0.8555986, -0.2756976, -3.027181, 0.8078431, 1, 0, 1,
-0.8525194, -0.6105936, -2.218853, 0.8, 1, 0, 1,
-0.8491526, 0.2171917, -1.554339, 0.7921569, 1, 0, 1,
-0.8464836, 0.4317221, -1.182718, 0.7882353, 1, 0, 1,
-0.8388157, 0.1160021, -1.550773, 0.7803922, 1, 0, 1,
-0.8205259, -1.417022, -4.213801, 0.7764706, 1, 0, 1,
-0.8193169, -2.724145, -4.970007, 0.7686275, 1, 0, 1,
-0.8186063, 0.6588983, -2.450631, 0.7647059, 1, 0, 1,
-0.8124059, 0.2267852, -1.265535, 0.7568628, 1, 0, 1,
-0.8115133, -0.248549, -1.786683, 0.7529412, 1, 0, 1,
-0.804755, 0.1994201, -1.925218, 0.7450981, 1, 0, 1,
-0.8046724, -1.103356, -1.992285, 0.7411765, 1, 0, 1,
-0.7954635, -0.3584514, -1.977694, 0.7333333, 1, 0, 1,
-0.7904934, 0.2346715, -0.3478586, 0.7294118, 1, 0, 1,
-0.7900532, -1.109434, -2.140168, 0.7215686, 1, 0, 1,
-0.786847, 0.1484357, -0.2744502, 0.7176471, 1, 0, 1,
-0.7857664, 1.02332, -0.5429299, 0.7098039, 1, 0, 1,
-0.7843645, -0.255281, -3.624543, 0.7058824, 1, 0, 1,
-0.7836105, -0.8929857, -1.707655, 0.6980392, 1, 0, 1,
-0.782779, -0.01836329, -1.650698, 0.6901961, 1, 0, 1,
-0.7795314, 1.104795, 0.3902022, 0.6862745, 1, 0, 1,
-0.7778822, 0.8601614, -1.00572, 0.6784314, 1, 0, 1,
-0.7760981, -0.6633586, -1.458967, 0.6745098, 1, 0, 1,
-0.7745984, 0.2082147, -0.6605145, 0.6666667, 1, 0, 1,
-0.7735674, -0.9994242, -0.2158486, 0.6627451, 1, 0, 1,
-0.7713913, -0.9492434, -3.708754, 0.654902, 1, 0, 1,
-0.7703245, 0.5485616, -0.02424752, 0.6509804, 1, 0, 1,
-0.7692224, -0.6315653, -3.725017, 0.6431373, 1, 0, 1,
-0.7684316, -0.9332775, -2.915241, 0.6392157, 1, 0, 1,
-0.7656637, -1.580161, -2.035614, 0.6313726, 1, 0, 1,
-0.7565267, -0.6004336, -1.287393, 0.627451, 1, 0, 1,
-0.7555681, 1.617645, -1.305783, 0.6196079, 1, 0, 1,
-0.7458846, 0.7870792, -1.593985, 0.6156863, 1, 0, 1,
-0.7408286, 0.9054986, 1.978119, 0.6078432, 1, 0, 1,
-0.7408, 1.566745, 0.798285, 0.6039216, 1, 0, 1,
-0.7374364, -1.554311, -2.853906, 0.5960785, 1, 0, 1,
-0.7351258, 1.687132, 0.857702, 0.5882353, 1, 0, 1,
-0.7250455, -1.190729, -3.349961, 0.5843138, 1, 0, 1,
-0.717308, -0.0190549, -2.188366, 0.5764706, 1, 0, 1,
-0.7149699, 1.009524, -0.8876433, 0.572549, 1, 0, 1,
-0.7149021, 0.902618, -2.475222, 0.5647059, 1, 0, 1,
-0.7101298, 1.308595, -1.376443, 0.5607843, 1, 0, 1,
-0.7088681, -2.061149, -4.106407, 0.5529412, 1, 0, 1,
-0.7056137, 3.091093, -0.1298071, 0.5490196, 1, 0, 1,
-0.7026764, -0.8223903, -0.9928734, 0.5411765, 1, 0, 1,
-0.6997945, -0.3001889, -1.176943, 0.5372549, 1, 0, 1,
-0.6984348, -0.4276449, -1.195485, 0.5294118, 1, 0, 1,
-0.6969915, -0.1847889, -1.277427, 0.5254902, 1, 0, 1,
-0.6967983, -0.3659762, -1.269661, 0.5176471, 1, 0, 1,
-0.6929928, 0.2922461, -1.495516, 0.5137255, 1, 0, 1,
-0.6918721, -0.004570055, -1.742184, 0.5058824, 1, 0, 1,
-0.6911204, -0.6240249, -1.611805, 0.5019608, 1, 0, 1,
-0.6892471, -2.978815, -2.685094, 0.4941176, 1, 0, 1,
-0.6881039, 0.6647136, -1.634813, 0.4862745, 1, 0, 1,
-0.6802566, 0.1321206, -2.257436, 0.4823529, 1, 0, 1,
-0.6800128, 1.539204, -0.7165006, 0.4745098, 1, 0, 1,
-0.6771437, 0.2053928, -2.268459, 0.4705882, 1, 0, 1,
-0.6728865, -1.369085, -0.6586176, 0.4627451, 1, 0, 1,
-0.6702376, -2.03741, -2.782378, 0.4588235, 1, 0, 1,
-0.6697518, 0.5548384, -0.1734283, 0.4509804, 1, 0, 1,
-0.6694592, 0.6252082, -0.9894981, 0.4470588, 1, 0, 1,
-0.6615364, 2.099945, -0.8275223, 0.4392157, 1, 0, 1,
-0.6508659, 0.4220547, -2.24611, 0.4352941, 1, 0, 1,
-0.6502394, -0.8653938, -2.132573, 0.427451, 1, 0, 1,
-0.6357962, 0.4960992, 0.2882431, 0.4235294, 1, 0, 1,
-0.6340063, -0.7257722, -1.389921, 0.4156863, 1, 0, 1,
-0.6287457, -2.083958, -4.201352, 0.4117647, 1, 0, 1,
-0.6283287, -0.5864616, -1.832459, 0.4039216, 1, 0, 1,
-0.6273478, 0.639127, -1.247147, 0.3960784, 1, 0, 1,
-0.6240511, 1.331465, -1.780815, 0.3921569, 1, 0, 1,
-0.6233408, 0.4064036, -0.7657807, 0.3843137, 1, 0, 1,
-0.6233229, -0.7817897, -2.924286, 0.3803922, 1, 0, 1,
-0.6231872, 1.975944, -1.225862, 0.372549, 1, 0, 1,
-0.6176072, -0.6404097, -2.629668, 0.3686275, 1, 0, 1,
-0.6145511, -0.8061191, -1.893357, 0.3607843, 1, 0, 1,
-0.6136401, -2.064778e-06, -2.993901, 0.3568628, 1, 0, 1,
-0.6030176, 0.03156158, -3.081218, 0.3490196, 1, 0, 1,
-0.5935407, -0.2343446, -1.388814, 0.345098, 1, 0, 1,
-0.5918325, 0.1474459, -1.518231, 0.3372549, 1, 0, 1,
-0.5900034, 0.0593184, 0.1006516, 0.3333333, 1, 0, 1,
-0.5895457, -2.221775, -2.31773, 0.3254902, 1, 0, 1,
-0.5852864, -1.43621, -0.6004609, 0.3215686, 1, 0, 1,
-0.5808919, 0.3043275, -1.918342, 0.3137255, 1, 0, 1,
-0.5793377, 0.3246132, -1.618663, 0.3098039, 1, 0, 1,
-0.5791549, -0.7390537, -3.823823, 0.3019608, 1, 0, 1,
-0.577693, -0.1845067, -2.261234, 0.2941177, 1, 0, 1,
-0.5753207, 0.2246948, -3.086117, 0.2901961, 1, 0, 1,
-0.5655698, 0.4765335, 0.04071712, 0.282353, 1, 0, 1,
-0.5626384, -1.476312, -3.167387, 0.2784314, 1, 0, 1,
-0.5552725, 0.9459232, 0.3327984, 0.2705882, 1, 0, 1,
-0.5548875, 0.3458181, -1.627489, 0.2666667, 1, 0, 1,
-0.5535694, -1.429731, -2.518507, 0.2588235, 1, 0, 1,
-0.5527985, -0.3995599, -2.432152, 0.254902, 1, 0, 1,
-0.5521899, 0.9810753, 0.4449306, 0.2470588, 1, 0, 1,
-0.5495068, 0.4207774, -1.42713, 0.2431373, 1, 0, 1,
-0.5474769, -0.5399061, -1.07542, 0.2352941, 1, 0, 1,
-0.5413465, -0.000524999, -3.320392, 0.2313726, 1, 0, 1,
-0.532795, -1.123016, -2.86012, 0.2235294, 1, 0, 1,
-0.5312439, -0.5681528, -5.446693, 0.2196078, 1, 0, 1,
-0.5269123, -0.1166273, -2.823425, 0.2117647, 1, 0, 1,
-0.5257624, -1.191947, -0.2836944, 0.2078431, 1, 0, 1,
-0.5205795, 0.4953913, -2.781101, 0.2, 1, 0, 1,
-0.5193248, -0.3837163, -0.4913689, 0.1921569, 1, 0, 1,
-0.5133714, -1.896483, -4.290576, 0.1882353, 1, 0, 1,
-0.5125745, -0.5992407, -2.158823, 0.1803922, 1, 0, 1,
-0.5114264, -0.05133308, -0.7200607, 0.1764706, 1, 0, 1,
-0.5113026, -0.2255982, -3.278578, 0.1686275, 1, 0, 1,
-0.5094302, 0.1780309, -2.772153, 0.1647059, 1, 0, 1,
-0.5067918, 0.1261881, -2.942391, 0.1568628, 1, 0, 1,
-0.5039625, -0.734491, -3.664642, 0.1529412, 1, 0, 1,
-0.5021505, 1.07225, -0.6142879, 0.145098, 1, 0, 1,
-0.4991509, -1.252521, -1.081147, 0.1411765, 1, 0, 1,
-0.4984081, 2.351282, -0.3065847, 0.1333333, 1, 0, 1,
-0.4969546, 0.4212276, -0.08680787, 0.1294118, 1, 0, 1,
-0.4961971, 0.5490638, -1.808654, 0.1215686, 1, 0, 1,
-0.4960854, -1.503879, -3.854679, 0.1176471, 1, 0, 1,
-0.4959301, -0.8541132, -2.10551, 0.1098039, 1, 0, 1,
-0.493288, 1.727611, 0.8687194, 0.1058824, 1, 0, 1,
-0.4919455, 0.4347976, -0.7022519, 0.09803922, 1, 0, 1,
-0.4896026, -0.4070292, -1.530946, 0.09019608, 1, 0, 1,
-0.4817981, 0.1855187, -2.409317, 0.08627451, 1, 0, 1,
-0.4760126, -1.550944, -2.360873, 0.07843138, 1, 0, 1,
-0.4729877, 0.6286824, -1.27585, 0.07450981, 1, 0, 1,
-0.4700913, 1.365363, 1.100651, 0.06666667, 1, 0, 1,
-0.4620073, -0.8166124, -2.898684, 0.0627451, 1, 0, 1,
-0.4545285, 0.5467184, -0.4818212, 0.05490196, 1, 0, 1,
-0.4528038, 0.2852933, -0.7303222, 0.05098039, 1, 0, 1,
-0.4521802, 3.010474, 0.7118998, 0.04313726, 1, 0, 1,
-0.4471176, 0.3999106, -2.561954, 0.03921569, 1, 0, 1,
-0.4467171, -2.240695, -1.257231, 0.03137255, 1, 0, 1,
-0.4449778, 0.3005515, -0.8750076, 0.02745098, 1, 0, 1,
-0.4447539, -0.03132264, -0.8925624, 0.01960784, 1, 0, 1,
-0.4367861, 0.1632275, -0.9562852, 0.01568628, 1, 0, 1,
-0.4308292, -1.813306, -1.933211, 0.007843138, 1, 0, 1,
-0.4288459, 1.691816, -0.4361489, 0.003921569, 1, 0, 1,
-0.423026, 0.1039809, -1.690695, 0, 1, 0.003921569, 1,
-0.4226113, 0.6955149, -2.388353, 0, 1, 0.01176471, 1,
-0.4225261, 0.9392735, -1.612969, 0, 1, 0.01568628, 1,
-0.4216419, 0.5783041, 0.14285, 0, 1, 0.02352941, 1,
-0.4169265, 0.2369775, -2.29017, 0, 1, 0.02745098, 1,
-0.4140608, 0.3200945, -0.7752242, 0, 1, 0.03529412, 1,
-0.4134134, 0.08980708, -1.397285, 0, 1, 0.03921569, 1,
-0.4112002, 1.38939, -0.3311569, 0, 1, 0.04705882, 1,
-0.4110981, -0.8416204, -3.212229, 0, 1, 0.05098039, 1,
-0.4103211, 0.5163447, 0.06454045, 0, 1, 0.05882353, 1,
-0.4096793, 0.9231898, -0.5575039, 0, 1, 0.0627451, 1,
-0.4084242, -0.8897113, -3.400277, 0, 1, 0.07058824, 1,
-0.405402, -1.178935, -3.76119, 0, 1, 0.07450981, 1,
-0.4010888, -0.5282961, -1.157947, 0, 1, 0.08235294, 1,
-0.3994735, 1.16324, -1.647872, 0, 1, 0.08627451, 1,
-0.3980012, 2.44655, 0.4469702, 0, 1, 0.09411765, 1,
-0.3893503, -0.5917456, -3.814575, 0, 1, 0.1019608, 1,
-0.3782986, 0.03920201, -1.20923, 0, 1, 0.1058824, 1,
-0.3645828, 0.5663903, -0.8342651, 0, 1, 0.1137255, 1,
-0.3632683, -1.941405, -3.00211, 0, 1, 0.1176471, 1,
-0.3570366, 0.6453756, -1.750651, 0, 1, 0.1254902, 1,
-0.3480583, -1.594437, -3.315218, 0, 1, 0.1294118, 1,
-0.3466655, -1.78713, -4.144467, 0, 1, 0.1372549, 1,
-0.3457166, -1.626766, -4.263386, 0, 1, 0.1411765, 1,
-0.334493, -2.063794, -1.8394, 0, 1, 0.1490196, 1,
-0.3343515, 0.2001855, -1.526904, 0, 1, 0.1529412, 1,
-0.3297251, 1.843686, -0.9776277, 0, 1, 0.1607843, 1,
-0.3294891, -1.236751, -0.9345019, 0, 1, 0.1647059, 1,
-0.3271109, 0.2287232, -0.2825238, 0, 1, 0.172549, 1,
-0.3179056, -0.42348, -1.512013, 0, 1, 0.1764706, 1,
-0.3166409, 1.057047, -1.421586, 0, 1, 0.1843137, 1,
-0.3152386, -0.8232821, -1.547014, 0, 1, 0.1882353, 1,
-0.3092377, 0.9131927, -0.8741437, 0, 1, 0.1960784, 1,
-0.3088438, -1.312259, -3.061961, 0, 1, 0.2039216, 1,
-0.3077856, -1.585961, -1.950263, 0, 1, 0.2078431, 1,
-0.3069172, -0.2228909, -1.166809, 0, 1, 0.2156863, 1,
-0.3025921, -0.3263066, -2.316796, 0, 1, 0.2196078, 1,
-0.300738, 0.1800991, -0.05649195, 0, 1, 0.227451, 1,
-0.2935567, 0.7744249, -0.2925782, 0, 1, 0.2313726, 1,
-0.2889263, -1.222962, -0.9670169, 0, 1, 0.2392157, 1,
-0.2867868, -0.1622183, -0.3195354, 0, 1, 0.2431373, 1,
-0.2826822, -0.222401, -3.617984, 0, 1, 0.2509804, 1,
-0.2809576, -0.2188279, -2.244593, 0, 1, 0.254902, 1,
-0.2804296, 0.5891874, -0.3469605, 0, 1, 0.2627451, 1,
-0.2791033, 1.479742, 1.778711, 0, 1, 0.2666667, 1,
-0.2722414, 1.460629, -0.8641599, 0, 1, 0.2745098, 1,
-0.2717867, 1.004259, -0.2356747, 0, 1, 0.2784314, 1,
-0.2709476, -0.2715068, -1.429624, 0, 1, 0.2862745, 1,
-0.2674782, -0.6580656, -3.507752, 0, 1, 0.2901961, 1,
-0.2668318, 0.06513699, -1.084232, 0, 1, 0.2980392, 1,
-0.2633131, 0.08367025, -0.5463628, 0, 1, 0.3058824, 1,
-0.2610879, 1.108762, -0.01943029, 0, 1, 0.3098039, 1,
-0.2598377, 0.6050954, 1.029062, 0, 1, 0.3176471, 1,
-0.2573913, 0.6442372, 0.9897247, 0, 1, 0.3215686, 1,
-0.2547285, -1.499672, -3.748653, 0, 1, 0.3294118, 1,
-0.2529814, -0.1827642, -1.271386, 0, 1, 0.3333333, 1,
-0.2520232, -0.1489045, -0.2279835, 0, 1, 0.3411765, 1,
-0.2511531, -1.588736, -2.221086, 0, 1, 0.345098, 1,
-0.2476907, 1.332217, 1.079696, 0, 1, 0.3529412, 1,
-0.2461557, -0.6185389, -1.088878, 0, 1, 0.3568628, 1,
-0.2461282, 2.145466, -0.6242417, 0, 1, 0.3647059, 1,
-0.2414399, -1.394514, -3.047456, 0, 1, 0.3686275, 1,
-0.2408613, -0.9264469, -4.208975, 0, 1, 0.3764706, 1,
-0.2330224, -1.165199, -5.033573, 0, 1, 0.3803922, 1,
-0.2308493, -0.002771363, -0.2398977, 0, 1, 0.3882353, 1,
-0.2184035, 0.3089515, -0.5777545, 0, 1, 0.3921569, 1,
-0.2141162, -1.574344, -2.798045, 0, 1, 0.4, 1,
-0.2124231, -1.094379, -3.289507, 0, 1, 0.4078431, 1,
-0.2097771, 0.597664, 0.3974959, 0, 1, 0.4117647, 1,
-0.2064415, 0.8545934, 1.040546, 0, 1, 0.4196078, 1,
-0.2053497, 1.234579, 0.6823691, 0, 1, 0.4235294, 1,
-0.2052269, 0.9868792, -0.09781155, 0, 1, 0.4313726, 1,
-0.2021555, 0.4421795, -1.105329, 0, 1, 0.4352941, 1,
-0.200331, -0.05746484, -3.201218, 0, 1, 0.4431373, 1,
-0.1995849, -0.7276329, -2.070739, 0, 1, 0.4470588, 1,
-0.1972963, 0.8996326, -1.80165, 0, 1, 0.454902, 1,
-0.1946911, -0.312414, -2.341793, 0, 1, 0.4588235, 1,
-0.1944041, -0.3194807, -2.613669, 0, 1, 0.4666667, 1,
-0.1918798, 1.768391, -1.520187, 0, 1, 0.4705882, 1,
-0.1866002, -0.3123326, -1.348742, 0, 1, 0.4784314, 1,
-0.1843197, 1.871779, -0.1519963, 0, 1, 0.4823529, 1,
-0.1843145, -0.3014206, -3.460564, 0, 1, 0.4901961, 1,
-0.183704, 2.074709, 0.6191981, 0, 1, 0.4941176, 1,
-0.1815993, -0.2835675, -1.435397, 0, 1, 0.5019608, 1,
-0.176096, -0.5011531, -2.726617, 0, 1, 0.509804, 1,
-0.1753126, 1.484909, 1.268419, 0, 1, 0.5137255, 1,
-0.1745329, 0.4462173, 0.09826892, 0, 1, 0.5215687, 1,
-0.1741094, 1.383708, -1.419322, 0, 1, 0.5254902, 1,
-0.1739408, 1.607389, 0.3836588, 0, 1, 0.5333334, 1,
-0.1736652, 0.3422439, -0.4154288, 0, 1, 0.5372549, 1,
-0.1710481, 0.1473947, -2.485791, 0, 1, 0.5450981, 1,
-0.166251, -0.03093788, -2.274528, 0, 1, 0.5490196, 1,
-0.165196, 0.2007481, -2.310602, 0, 1, 0.5568628, 1,
-0.1602716, 0.3157303, -1.367348, 0, 1, 0.5607843, 1,
-0.1597811, -1.8131, -3.793949, 0, 1, 0.5686275, 1,
-0.1573412, 0.7048559, -2.634362, 0, 1, 0.572549, 1,
-0.1556514, 1.400943, -1.750548, 0, 1, 0.5803922, 1,
-0.155281, 0.8403596, 0.4755484, 0, 1, 0.5843138, 1,
-0.1520093, 0.2516389, -1.881734, 0, 1, 0.5921569, 1,
-0.1511791, 0.09952123, -0.4020206, 0, 1, 0.5960785, 1,
-0.1448665, 0.3111458, 0.3020554, 0, 1, 0.6039216, 1,
-0.1445664, 1.608344, -0.7256937, 0, 1, 0.6117647, 1,
-0.1390251, 0.07708032, -3.116971, 0, 1, 0.6156863, 1,
-0.1376725, -1.586758, -3.095136, 0, 1, 0.6235294, 1,
-0.131585, -1.186824, -2.936573, 0, 1, 0.627451, 1,
-0.1298683, 0.2446951, -1.723395, 0, 1, 0.6352941, 1,
-0.1285674, -0.49277, -3.826222, 0, 1, 0.6392157, 1,
-0.1284682, -1.398846, -2.531106, 0, 1, 0.6470588, 1,
-0.1275849, -0.2625895, -4.473223, 0, 1, 0.6509804, 1,
-0.1229146, -0.2822142, -2.706347, 0, 1, 0.6588235, 1,
-0.1207401, 0.2801764, -2.470096, 0, 1, 0.6627451, 1,
-0.118152, -1.199083, -4.063005, 0, 1, 0.6705883, 1,
-0.1146735, 0.3243479, 1.160634, 0, 1, 0.6745098, 1,
-0.1109574, -0.2792253, -3.802875, 0, 1, 0.682353, 1,
-0.1105379, 0.6920705, -0.4896277, 0, 1, 0.6862745, 1,
-0.1094894, 0.9561238, -0.9449407, 0, 1, 0.6941177, 1,
-0.1084117, 0.5917236, -1.178962, 0, 1, 0.7019608, 1,
-0.1081171, -1.250276, -4.201632, 0, 1, 0.7058824, 1,
-0.1019198, -0.02943527, -1.20845, 0, 1, 0.7137255, 1,
-0.1018363, -2.063424, -3.488368, 0, 1, 0.7176471, 1,
-0.09593962, -0.8244204, -5.338813, 0, 1, 0.7254902, 1,
-0.0956855, 1.242964, -1.011559, 0, 1, 0.7294118, 1,
-0.0945189, 0.3803735, -0.2370147, 0, 1, 0.7372549, 1,
-0.09202363, -0.5643634, -2.132507, 0, 1, 0.7411765, 1,
-0.0913142, -0.316635, -3.831923, 0, 1, 0.7490196, 1,
-0.08779917, 0.989181, 0.9892051, 0, 1, 0.7529412, 1,
-0.07849233, -0.2000903, -0.8235315, 0, 1, 0.7607843, 1,
-0.07638108, 1.122362, 1.4306, 0, 1, 0.7647059, 1,
-0.07473946, -0.2468782, -3.498974, 0, 1, 0.772549, 1,
-0.07350137, 1.176994, 0.1050411, 0, 1, 0.7764706, 1,
-0.07183751, 0.3245989, -0.1356817, 0, 1, 0.7843137, 1,
-0.0673204, 0.1382573, -1.025562, 0, 1, 0.7882353, 1,
-0.06262103, 0.7989872, 0.3144445, 0, 1, 0.7960784, 1,
-0.06139192, -0.5364097, -3.221995, 0, 1, 0.8039216, 1,
-0.05576947, -0.521019, -3.184402, 0, 1, 0.8078431, 1,
-0.0523356, 1.114675, 0.7524062, 0, 1, 0.8156863, 1,
-0.05161919, 0.1058022, -1.02755, 0, 1, 0.8196079, 1,
-0.05035688, 0.2563794, -2.907374, 0, 1, 0.827451, 1,
-0.04819151, -0.3240605, -2.559481, 0, 1, 0.8313726, 1,
-0.04593084, 0.5436094, -0.09135249, 0, 1, 0.8392157, 1,
-0.04541247, -0.3921733, -4.383362, 0, 1, 0.8431373, 1,
-0.04064848, -0.2852229, -2.085877, 0, 1, 0.8509804, 1,
-0.0352871, 0.01330669, -0.1837289, 0, 1, 0.854902, 1,
-0.02828584, -0.1746083, -3.534589, 0, 1, 0.8627451, 1,
-0.02816052, 1.924834, -1.538222, 0, 1, 0.8666667, 1,
-0.01996057, 1.656117, -0.05593542, 0, 1, 0.8745098, 1,
-0.01935052, 0.7134149, 1.655321, 0, 1, 0.8784314, 1,
-0.01351297, -0.8308343, -3.128226, 0, 1, 0.8862745, 1,
-0.01347421, -1.052809, -1.730369, 0, 1, 0.8901961, 1,
-0.00943875, 2.908856, 0.6715752, 0, 1, 0.8980392, 1,
-0.007872517, -0.2307265, -3.847112, 0, 1, 0.9058824, 1,
-0.006599206, -0.1252585, -2.958819, 0, 1, 0.9098039, 1,
-0.004916918, -1.476434, -4.221485, 0, 1, 0.9176471, 1,
-0.004143481, 1.446875, -1.34244, 0, 1, 0.9215686, 1,
-0.003756826, 1.120844, 0.01823683, 0, 1, 0.9294118, 1,
0.0006116118, -0.4652944, 2.552286, 0, 1, 0.9333333, 1,
0.005944339, -0.9749548, 6.426862, 0, 1, 0.9411765, 1,
0.01038133, 2.310529, -1.293824, 0, 1, 0.945098, 1,
0.01183124, -0.04948122, 1.15115, 0, 1, 0.9529412, 1,
0.01443521, -0.772075, 3.975732, 0, 1, 0.9568627, 1,
0.01504588, -1.141891, 1.673814, 0, 1, 0.9647059, 1,
0.01725646, -0.2692258, 2.117392, 0, 1, 0.9686275, 1,
0.01740246, 0.1019537, -0.206221, 0, 1, 0.9764706, 1,
0.0179987, 0.04835981, -0.2142986, 0, 1, 0.9803922, 1,
0.01954502, -0.2542019, 1.387678, 0, 1, 0.9882353, 1,
0.02218963, 0.6440167, 0.8120862, 0, 1, 0.9921569, 1,
0.02251652, 1.398732, 0.9762084, 0, 1, 1, 1,
0.02770238, -0.8217254, 3.143651, 0, 0.9921569, 1, 1,
0.03176021, -0.001946834, 1.124379, 0, 0.9882353, 1, 1,
0.03245423, 1.073774, -2.179196, 0, 0.9803922, 1, 1,
0.03319336, -0.2615457, 1.360487, 0, 0.9764706, 1, 1,
0.03690229, 1.906088, 0.547424, 0, 0.9686275, 1, 1,
0.0373963, -0.957792, 1.906071, 0, 0.9647059, 1, 1,
0.04191022, -1.528877, 3.400568, 0, 0.9568627, 1, 1,
0.04670865, -2.183817, 3.19049, 0, 0.9529412, 1, 1,
0.04910378, -0.002048762, 2.900265, 0, 0.945098, 1, 1,
0.04917816, 0.3066604, 0.8253049, 0, 0.9411765, 1, 1,
0.0495338, 0.1255828, 0.4535983, 0, 0.9333333, 1, 1,
0.05203468, 2.024789, 0.7007925, 0, 0.9294118, 1, 1,
0.05251106, 1.123827, 0.6621999, 0, 0.9215686, 1, 1,
0.05848296, -1.496885, 4.268163, 0, 0.9176471, 1, 1,
0.06054635, -0.2097109, 2.191469, 0, 0.9098039, 1, 1,
0.06262941, 1.279406, -0.7127768, 0, 0.9058824, 1, 1,
0.06416614, 0.4424919, -1.195657, 0, 0.8980392, 1, 1,
0.06852679, -1.014748, 2.612394, 0, 0.8901961, 1, 1,
0.07299181, -0.3790435, 4.363038, 0, 0.8862745, 1, 1,
0.0746795, 0.42316, -0.7420624, 0, 0.8784314, 1, 1,
0.07760962, 0.1439847, 1.214307, 0, 0.8745098, 1, 1,
0.07767756, -0.5873677, 3.212307, 0, 0.8666667, 1, 1,
0.07879589, -0.4827998, 3.412728, 0, 0.8627451, 1, 1,
0.08120001, -0.6696076, 2.302822, 0, 0.854902, 1, 1,
0.08235538, -0.2485459, 3.829443, 0, 0.8509804, 1, 1,
0.08706988, -0.4254485, 2.50607, 0, 0.8431373, 1, 1,
0.08842885, -0.4051463, 0.9121433, 0, 0.8392157, 1, 1,
0.09062041, -0.5362104, 2.161826, 0, 0.8313726, 1, 1,
0.09201042, 0.3647589, 0.4693853, 0, 0.827451, 1, 1,
0.09211597, -0.2467936, 2.314373, 0, 0.8196079, 1, 1,
0.09362556, -0.8809274, 3.564138, 0, 0.8156863, 1, 1,
0.09895109, -0.6134938, 4.349679, 0, 0.8078431, 1, 1,
0.1061264, -0.650694, 3.383503, 0, 0.8039216, 1, 1,
0.1066194, 1.899325, -1.540681, 0, 0.7960784, 1, 1,
0.1083241, 0.7694661, -0.7276742, 0, 0.7882353, 1, 1,
0.1121301, -0.5937389, 3.534111, 0, 0.7843137, 1, 1,
0.1142014, 0.7385615, 0.3958477, 0, 0.7764706, 1, 1,
0.1155443, -1.92938, 2.978184, 0, 0.772549, 1, 1,
0.1176372, 1.828962, -1.011222, 0, 0.7647059, 1, 1,
0.1200192, -0.6673342, 2.67288, 0, 0.7607843, 1, 1,
0.1203897, 0.8674664, 0.2632856, 0, 0.7529412, 1, 1,
0.1258645, -1.129148, 5.072962, 0, 0.7490196, 1, 1,
0.1271794, -0.8441956, 4.469774, 0, 0.7411765, 1, 1,
0.1299274, 0.1065937, 1.551175, 0, 0.7372549, 1, 1,
0.1323349, 0.1379283, -0.1230273, 0, 0.7294118, 1, 1,
0.1330358, 0.7000738, 2.08789, 0, 0.7254902, 1, 1,
0.1345882, -0.2711796, 1.575878, 0, 0.7176471, 1, 1,
0.1348901, 2.307176, 1.531825, 0, 0.7137255, 1, 1,
0.1354046, 0.9285218, 0.6690106, 0, 0.7058824, 1, 1,
0.1358071, -0.06012753, 2.748147, 0, 0.6980392, 1, 1,
0.1362425, -1.243598, 3.017428, 0, 0.6941177, 1, 1,
0.138375, -1.817847, 4.990654, 0, 0.6862745, 1, 1,
0.1424325, 2.932396, -0.7061676, 0, 0.682353, 1, 1,
0.1482289, -1.970611, 1.888257, 0, 0.6745098, 1, 1,
0.1483194, 1.05898, -0.9333296, 0, 0.6705883, 1, 1,
0.1493355, -0.5625445, 2.834201, 0, 0.6627451, 1, 1,
0.1507985, -0.6307369, 0.92575, 0, 0.6588235, 1, 1,
0.1514276, -0.2697204, 2.495766, 0, 0.6509804, 1, 1,
0.1560533, 1.256968, 0.5549824, 0, 0.6470588, 1, 1,
0.1584338, -0.2866024, 3.854409, 0, 0.6392157, 1, 1,
0.1606914, -0.01232339, -0.3563247, 0, 0.6352941, 1, 1,
0.1663727, 0.9412727, 1.423774, 0, 0.627451, 1, 1,
0.1669783, -1.022951, 3.89924, 0, 0.6235294, 1, 1,
0.1709804, -1.306273, 3.313268, 0, 0.6156863, 1, 1,
0.1741905, -0.004222242, 0.8793685, 0, 0.6117647, 1, 1,
0.1744625, -0.099142, 2.434202, 0, 0.6039216, 1, 1,
0.1746528, -1.39358, 2.738175, 0, 0.5960785, 1, 1,
0.176357, -1.271652, 3.584502, 0, 0.5921569, 1, 1,
0.180452, 1.207451, -0.3928036, 0, 0.5843138, 1, 1,
0.1813944, -0.188698, 2.060294, 0, 0.5803922, 1, 1,
0.1826064, -0.08596589, 3.259827, 0, 0.572549, 1, 1,
0.1834519, 0.9869827, 0.887225, 0, 0.5686275, 1, 1,
0.1874083, -0.7194719, 1.971749, 0, 0.5607843, 1, 1,
0.1893984, 2.193583, -0.509549, 0, 0.5568628, 1, 1,
0.1981632, -0.4882393, 2.548522, 0, 0.5490196, 1, 1,
0.1987783, 1.771188, 1.277766, 0, 0.5450981, 1, 1,
0.2015718, -0.7589335, 1.845489, 0, 0.5372549, 1, 1,
0.2021762, -1.056493, 3.620012, 0, 0.5333334, 1, 1,
0.2040919, -0.4963874, 1.713078, 0, 0.5254902, 1, 1,
0.2058074, 1.843788, 0.669165, 0, 0.5215687, 1, 1,
0.2087084, -0.3000583, 3.14652, 0, 0.5137255, 1, 1,
0.2113622, 1.039651, 0.2809385, 0, 0.509804, 1, 1,
0.2113967, -1.038343, 2.568295, 0, 0.5019608, 1, 1,
0.2150494, -1.468136, 4.09081, 0, 0.4941176, 1, 1,
0.2154437, -2.004908, 2.671231, 0, 0.4901961, 1, 1,
0.2176262, 0.8571059, -0.304597, 0, 0.4823529, 1, 1,
0.2178156, 1.100281, -0.9454598, 0, 0.4784314, 1, 1,
0.2178677, 0.1915752, 1.046046, 0, 0.4705882, 1, 1,
0.2214583, 0.9878185, 1.254544, 0, 0.4666667, 1, 1,
0.2216199, 0.8031338, -0.3089842, 0, 0.4588235, 1, 1,
0.2237404, 0.01177246, 1.073171, 0, 0.454902, 1, 1,
0.2238754, -1.175095, 3.337121, 0, 0.4470588, 1, 1,
0.225996, 0.8810574, -0.1739481, 0, 0.4431373, 1, 1,
0.2270121, 0.804063, 0.7515903, 0, 0.4352941, 1, 1,
0.2421563, 0.3202544, -0.3526647, 0, 0.4313726, 1, 1,
0.2518179, -0.1170181, 0.4780532, 0, 0.4235294, 1, 1,
0.2527579, -1.589141, 4.902337, 0, 0.4196078, 1, 1,
0.25527, 0.687253, 0.7377521, 0, 0.4117647, 1, 1,
0.2564509, -0.409724, 2.313514, 0, 0.4078431, 1, 1,
0.2582768, -0.9245489, 2.081817, 0, 0.4, 1, 1,
0.265407, 0.4850339, 0.6548486, 0, 0.3921569, 1, 1,
0.2659211, 0.05635614, 1.893362, 0, 0.3882353, 1, 1,
0.2663675, 0.8309106, 0.08597405, 0, 0.3803922, 1, 1,
0.2694673, 0.07954725, 2.061722, 0, 0.3764706, 1, 1,
0.2718774, 0.2842247, 1.19138, 0, 0.3686275, 1, 1,
0.2726666, -0.1757714, 1.635665, 0, 0.3647059, 1, 1,
0.2728211, -1.630549, 0.7441555, 0, 0.3568628, 1, 1,
0.2744232, 0.4509553, 0.275853, 0, 0.3529412, 1, 1,
0.2776593, -1.089947, 3.683227, 0, 0.345098, 1, 1,
0.2779622, -0.9369591, 1.800427, 0, 0.3411765, 1, 1,
0.2779639, 0.06639592, -0.851623, 0, 0.3333333, 1, 1,
0.2785118, 0.6617592, 1.436278, 0, 0.3294118, 1, 1,
0.2787383, 0.1442471, 1.736951, 0, 0.3215686, 1, 1,
0.2799949, 1.009362, 2.036135, 0, 0.3176471, 1, 1,
0.2827795, -0.5598534, 3.504194, 0, 0.3098039, 1, 1,
0.2828166, 0.7574437, -1.277935, 0, 0.3058824, 1, 1,
0.2838475, 1.252552, 0.5695758, 0, 0.2980392, 1, 1,
0.2842963, 0.3190514, 1.46572, 0, 0.2901961, 1, 1,
0.2848397, 0.8389154, -0.3118938, 0, 0.2862745, 1, 1,
0.2883988, 0.31891, 1.263897, 0, 0.2784314, 1, 1,
0.2901504, 2.39099, -0.3089345, 0, 0.2745098, 1, 1,
0.2943092, 3.826517, -1.126785, 0, 0.2666667, 1, 1,
0.3003164, -0.3858806, 2.286401, 0, 0.2627451, 1, 1,
0.3016444, -0.3593137, 0.9409903, 0, 0.254902, 1, 1,
0.3019565, -0.665349, 2.26612, 0, 0.2509804, 1, 1,
0.3025781, -0.5879604, 2.1331, 0, 0.2431373, 1, 1,
0.3038799, -1.036061, 1.933489, 0, 0.2392157, 1, 1,
0.3050863, -1.412132, 3.700996, 0, 0.2313726, 1, 1,
0.306094, -0.7540035, 3.802304, 0, 0.227451, 1, 1,
0.3064134, -0.05265633, 1.754494, 0, 0.2196078, 1, 1,
0.3072214, -0.6425508, 3.313989, 0, 0.2156863, 1, 1,
0.3079014, 0.7676595, 0.7298442, 0, 0.2078431, 1, 1,
0.3188079, 0.2794456, -0.466739, 0, 0.2039216, 1, 1,
0.3205433, -0.1517407, 2.477919, 0, 0.1960784, 1, 1,
0.3234953, 0.3577712, -0.2158296, 0, 0.1882353, 1, 1,
0.326921, -2.237476, 2.774216, 0, 0.1843137, 1, 1,
0.3294386, 0.771744, 0.827228, 0, 0.1764706, 1, 1,
0.3321046, 0.5635171, -0.9806126, 0, 0.172549, 1, 1,
0.333226, 1.182721, -0.5471942, 0, 0.1647059, 1, 1,
0.3342537, 0.07699043, 0.704814, 0, 0.1607843, 1, 1,
0.33612, 0.05255509, 1.998873, 0, 0.1529412, 1, 1,
0.3412049, 0.1441908, 1.490458, 0, 0.1490196, 1, 1,
0.3415413, 0.4137183, 1.079861, 0, 0.1411765, 1, 1,
0.3445703, -0.314614, 0.5531885, 0, 0.1372549, 1, 1,
0.3457311, 0.1052075, 1.679409, 0, 0.1294118, 1, 1,
0.3474818, -0.5580754, 3.794508, 0, 0.1254902, 1, 1,
0.3505445, 0.2555914, 2.012723, 0, 0.1176471, 1, 1,
0.3548909, -0.2418465, 1.822563, 0, 0.1137255, 1, 1,
0.3561186, 2.259603, 0.6959607, 0, 0.1058824, 1, 1,
0.3592011, -0.4560375, 3.471789, 0, 0.09803922, 1, 1,
0.3613427, 0.4574289, 1.185238, 0, 0.09411765, 1, 1,
0.3613496, 0.1997391, 1.492931, 0, 0.08627451, 1, 1,
0.3615089, 1.598805, 0.6810868, 0, 0.08235294, 1, 1,
0.3623925, 0.7886463, 1.181972, 0, 0.07450981, 1, 1,
0.3626694, -2.357429, 1.422634, 0, 0.07058824, 1, 1,
0.366062, 1.133752, 0.6804513, 0, 0.0627451, 1, 1,
0.3705793, -1.804496, 2.681232, 0, 0.05882353, 1, 1,
0.3717986, 0.6833534, 0.7560906, 0, 0.05098039, 1, 1,
0.3731242, -0.5738732, 3.152282, 0, 0.04705882, 1, 1,
0.373641, 2.728673, -0.7299307, 0, 0.03921569, 1, 1,
0.3793573, -0.8904444, 3.402163, 0, 0.03529412, 1, 1,
0.3852541, -1.490275, 2.850251, 0, 0.02745098, 1, 1,
0.3887926, -0.05141078, 0.293192, 0, 0.02352941, 1, 1,
0.391786, 1.442513, 0.7875573, 0, 0.01568628, 1, 1,
0.3945164, -0.7296795, 1.958388, 0, 0.01176471, 1, 1,
0.3948506, 0.4249086, 2.023474, 0, 0.003921569, 1, 1,
0.3953415, -1.203943, 4.048929, 0.003921569, 0, 1, 1,
0.3980445, -0.6135073, 1.93343, 0.007843138, 0, 1, 1,
0.3988076, 0.05583617, 1.36047, 0.01568628, 0, 1, 1,
0.3989778, 0.05251182, 1.175766, 0.01960784, 0, 1, 1,
0.3990765, 0.7950685, -0.1988217, 0.02745098, 0, 1, 1,
0.4009761, 1.338434, 0.5956655, 0.03137255, 0, 1, 1,
0.406237, -1.677399, 3.285568, 0.03921569, 0, 1, 1,
0.4104682, -0.955773, 1.330897, 0.04313726, 0, 1, 1,
0.4116318, 0.06497901, 1.836187, 0.05098039, 0, 1, 1,
0.4128361, -1.093355, 3.505244, 0.05490196, 0, 1, 1,
0.4129383, 1.36402, -1.639169, 0.0627451, 0, 1, 1,
0.4193161, 0.06202108, 1.330088, 0.06666667, 0, 1, 1,
0.419658, 0.1615136, 3.107324, 0.07450981, 0, 1, 1,
0.4199262, -0.6841908, 2.230515, 0.07843138, 0, 1, 1,
0.4215377, 2.34437, 0.3306515, 0.08627451, 0, 1, 1,
0.4277475, -0.2395817, 3.47964, 0.09019608, 0, 1, 1,
0.4296358, 0.6589354, 1.50777, 0.09803922, 0, 1, 1,
0.4332044, 0.2392105, 0.1963445, 0.1058824, 0, 1, 1,
0.4333576, 0.3426458, 1.94715, 0.1098039, 0, 1, 1,
0.4338888, -0.9229466, 2.225685, 0.1176471, 0, 1, 1,
0.4371617, 0.9621745, 0.1127506, 0.1215686, 0, 1, 1,
0.4385165, -1.227788, 1.739828, 0.1294118, 0, 1, 1,
0.4426384, 0.3095016, 0.7138413, 0.1333333, 0, 1, 1,
0.442703, -0.0002215813, 1.110767, 0.1411765, 0, 1, 1,
0.4462417, -0.1162097, 3.288876, 0.145098, 0, 1, 1,
0.4601554, 0.2971632, 0.1631913, 0.1529412, 0, 1, 1,
0.4641255, 1.072389, -0.01886455, 0.1568628, 0, 1, 1,
0.464756, 0.1191233, 3.529882, 0.1647059, 0, 1, 1,
0.4671321, 2.59412, 0.5567672, 0.1686275, 0, 1, 1,
0.4760475, -1.163888, 2.921283, 0.1764706, 0, 1, 1,
0.4813507, -0.8782821, 4.865592, 0.1803922, 0, 1, 1,
0.4818096, 1.626842, -0.580226, 0.1882353, 0, 1, 1,
0.4906653, -1.620564, 2.566933, 0.1921569, 0, 1, 1,
0.4956626, 0.8510821, 0.2329777, 0.2, 0, 1, 1,
0.496717, -0.817427, 2.607052, 0.2078431, 0, 1, 1,
0.4974824, -0.652582, 3.559405, 0.2117647, 0, 1, 1,
0.5020851, 0.1182637, 1.41351, 0.2196078, 0, 1, 1,
0.5030156, 0.1770497, 2.081865, 0.2235294, 0, 1, 1,
0.5046016, -1.074856, 1.742786, 0.2313726, 0, 1, 1,
0.505502, -0.5410624, 2.112446, 0.2352941, 0, 1, 1,
0.5061508, -0.8738037, 1.96595, 0.2431373, 0, 1, 1,
0.5077232, 1.737135, 1.218606, 0.2470588, 0, 1, 1,
0.5116144, 0.4343068, -1.797423, 0.254902, 0, 1, 1,
0.5120745, -1.397212, 2.270451, 0.2588235, 0, 1, 1,
0.5250493, -1.648699, 4.576048, 0.2666667, 0, 1, 1,
0.5266087, -0.001948565, 2.233383, 0.2705882, 0, 1, 1,
0.5280083, 0.1555982, 1.683901, 0.2784314, 0, 1, 1,
0.5328813, -0.07677063, 1.517773, 0.282353, 0, 1, 1,
0.5424303, -0.2453036, 2.735395, 0.2901961, 0, 1, 1,
0.5452259, -0.4734418, -1.170828, 0.2941177, 0, 1, 1,
0.5472353, -0.1621151, 1.684039, 0.3019608, 0, 1, 1,
0.5591511, 1.32366, -1.520648, 0.3098039, 0, 1, 1,
0.5651659, -0.4383357, 2.102717, 0.3137255, 0, 1, 1,
0.5745116, -0.1568521, 2.962825, 0.3215686, 0, 1, 1,
0.5802538, 0.5392656, 0.8601301, 0.3254902, 0, 1, 1,
0.5912547, -1.024905, 3.363445, 0.3333333, 0, 1, 1,
0.5926193, -0.9443064, 1.332868, 0.3372549, 0, 1, 1,
0.5990373, -1.107719, 3.41439, 0.345098, 0, 1, 1,
0.6021066, 0.2546987, 1.840642, 0.3490196, 0, 1, 1,
0.6026602, 0.4168463, 1.904536, 0.3568628, 0, 1, 1,
0.6044673, 1.395485, 1.729234, 0.3607843, 0, 1, 1,
0.6124722, 0.4853752, 1.301376, 0.3686275, 0, 1, 1,
0.6150617, -1.272715, 2.221874, 0.372549, 0, 1, 1,
0.6160071, -0.9244541, 2.619466, 0.3803922, 0, 1, 1,
0.6161391, 0.9553127, 2.729454, 0.3843137, 0, 1, 1,
0.6195896, -0.70652, 2.14955, 0.3921569, 0, 1, 1,
0.6224262, -0.01564735, 3.470848, 0.3960784, 0, 1, 1,
0.6235108, -0.3248286, 2.083007, 0.4039216, 0, 1, 1,
0.625033, -0.3824921, 3.866269, 0.4117647, 0, 1, 1,
0.6251023, 0.2635042, 1.958041, 0.4156863, 0, 1, 1,
0.6260256, -0.2502341, 2.801844, 0.4235294, 0, 1, 1,
0.6283077, 0.1650759, 0.2549349, 0.427451, 0, 1, 1,
0.6356514, 0.3140754, 1.856119, 0.4352941, 0, 1, 1,
0.6366444, -1.275992, 2.434554, 0.4392157, 0, 1, 1,
0.6406484, 0.3085732, 0.1994031, 0.4470588, 0, 1, 1,
0.6414373, -1.225272, 3.376415, 0.4509804, 0, 1, 1,
0.6463546, -0.7529488, 4.099291, 0.4588235, 0, 1, 1,
0.6474162, -0.3395114, 2.488027, 0.4627451, 0, 1, 1,
0.654691, 1.184415, 0.6298186, 0.4705882, 0, 1, 1,
0.6652504, 0.3018546, 3.012614, 0.4745098, 0, 1, 1,
0.6666363, 0.4793894, 0.1338657, 0.4823529, 0, 1, 1,
0.6694317, 0.191265, 2.207114, 0.4862745, 0, 1, 1,
0.6725572, 0.2948419, 2.635001, 0.4941176, 0, 1, 1,
0.6743544, 0.1985926, 0.9362935, 0.5019608, 0, 1, 1,
0.6819001, 0.3223054, 0.4047395, 0.5058824, 0, 1, 1,
0.6822629, -0.0642923, 1.979795, 0.5137255, 0, 1, 1,
0.6887507, -0.6381066, 3.697252, 0.5176471, 0, 1, 1,
0.6889098, 0.5855407, 0.5723766, 0.5254902, 0, 1, 1,
0.690192, 0.9321086, 1.185414, 0.5294118, 0, 1, 1,
0.6923003, -0.6889119, 2.100448, 0.5372549, 0, 1, 1,
0.6934704, 1.713263, 0.4617295, 0.5411765, 0, 1, 1,
0.6937758, 1.983723, -0.06753219, 0.5490196, 0, 1, 1,
0.6952268, -0.3318571, 2.127102, 0.5529412, 0, 1, 1,
0.7019557, -0.6455308, 3.970411, 0.5607843, 0, 1, 1,
0.7058497, -0.3656966, 1.304822, 0.5647059, 0, 1, 1,
0.7071053, 0.5213168, 1.64948, 0.572549, 0, 1, 1,
0.713744, 0.1187192, 1.527048, 0.5764706, 0, 1, 1,
0.7143455, -0.08958818, 1.030773, 0.5843138, 0, 1, 1,
0.7155424, 0.3476431, 2.524405, 0.5882353, 0, 1, 1,
0.7242056, -1.99877, 1.927024, 0.5960785, 0, 1, 1,
0.7326601, 0.5771071, 2.003997, 0.6039216, 0, 1, 1,
0.7485018, -0.5035167, 1.353724, 0.6078432, 0, 1, 1,
0.7486439, 0.3498473, 3.230358, 0.6156863, 0, 1, 1,
0.7525991, 0.9319858, -0.3394824, 0.6196079, 0, 1, 1,
0.7624897, 1.364971, -0.4760481, 0.627451, 0, 1, 1,
0.763088, 0.6711544, -0.5034658, 0.6313726, 0, 1, 1,
0.7658033, -1.342346, 2.495628, 0.6392157, 0, 1, 1,
0.7872287, -1.793231, 2.755548, 0.6431373, 0, 1, 1,
0.7892883, -0.6641004, 1.798421, 0.6509804, 0, 1, 1,
0.7900196, -1.290372, 2.695383, 0.654902, 0, 1, 1,
0.7901505, 0.770622, -0.01978319, 0.6627451, 0, 1, 1,
0.7905758, 0.3864267, 0.6736809, 0.6666667, 0, 1, 1,
0.7944512, -1.138122, 1.903597, 0.6745098, 0, 1, 1,
0.7947935, -1.258334, 2.636763, 0.6784314, 0, 1, 1,
0.796198, -1.322409, 0.4208947, 0.6862745, 0, 1, 1,
0.8065871, 0.381004, 1.910453, 0.6901961, 0, 1, 1,
0.8085059, -0.3607349, 0.4628992, 0.6980392, 0, 1, 1,
0.8130429, -1.195505, 1.939174, 0.7058824, 0, 1, 1,
0.8176103, -1.670671, 2.72103, 0.7098039, 0, 1, 1,
0.8176731, 1.589275, -1.212348, 0.7176471, 0, 1, 1,
0.8192887, 1.300201, 0.7115197, 0.7215686, 0, 1, 1,
0.8236107, 0.5814044, 0.6204515, 0.7294118, 0, 1, 1,
0.8278465, 1.312461, -0.7639642, 0.7333333, 0, 1, 1,
0.8337522, 0.250453, 2.833614, 0.7411765, 0, 1, 1,
0.8347182, -0.119127, 1.223184, 0.7450981, 0, 1, 1,
0.8430515, -0.8072613, 2.861869, 0.7529412, 0, 1, 1,
0.8439958, -0.4468285, 0.09332955, 0.7568628, 0, 1, 1,
0.8470376, -0.841228, 1.791037, 0.7647059, 0, 1, 1,
0.847807, 0.5752572, 0.09918176, 0.7686275, 0, 1, 1,
0.8583305, -0.05012067, 2.324146, 0.7764706, 0, 1, 1,
0.8589132, 0.3015791, 1.395324, 0.7803922, 0, 1, 1,
0.8634098, -2.744031, 1.496167, 0.7882353, 0, 1, 1,
0.8642952, -0.1382934, 1.623338, 0.7921569, 0, 1, 1,
0.8660369, -0.2103381, 0.5923476, 0.8, 0, 1, 1,
0.8724882, 0.3788094, 1.068646, 0.8078431, 0, 1, 1,
0.8731089, 0.4622609, -0.3849945, 0.8117647, 0, 1, 1,
0.8806664, 1.170975, 0.6805627, 0.8196079, 0, 1, 1,
0.885761, -0.5870075, 0.9007893, 0.8235294, 0, 1, 1,
0.8905777, -0.1934772, 1.26622, 0.8313726, 0, 1, 1,
0.893182, -0.02069805, 2.592106, 0.8352941, 0, 1, 1,
0.8954772, -0.01141845, 1.924495, 0.8431373, 0, 1, 1,
0.9019024, 1.845598, -1.443452, 0.8470588, 0, 1, 1,
0.902959, 1.36254, 2.532436, 0.854902, 0, 1, 1,
0.9052779, -0.3330808, 0.9864191, 0.8588235, 0, 1, 1,
0.9057189, 0.5528064, 0.6186997, 0.8666667, 0, 1, 1,
0.926316, -0.2556719, 3.50605, 0.8705882, 0, 1, 1,
0.9312633, -1.163888, 1.877419, 0.8784314, 0, 1, 1,
0.9350016, 0.2868076, 1.344388, 0.8823529, 0, 1, 1,
0.9391999, -0.2777246, 2.115676, 0.8901961, 0, 1, 1,
0.9439804, 0.7238788, 1.677866, 0.8941177, 0, 1, 1,
0.9451904, -0.5860521, 2.40832, 0.9019608, 0, 1, 1,
0.9517568, -0.09248104, 1.946215, 0.9098039, 0, 1, 1,
0.9558092, 1.099423, 0.0971211, 0.9137255, 0, 1, 1,
0.9578314, 0.03510547, 4.444636, 0.9215686, 0, 1, 1,
0.9601641, 0.2997768, 2.417112, 0.9254902, 0, 1, 1,
0.9634737, 0.01289636, 3.109824, 0.9333333, 0, 1, 1,
0.9644821, -0.8380296, 0.9052607, 0.9372549, 0, 1, 1,
0.9653722, 0.7846979, 2.062496, 0.945098, 0, 1, 1,
0.9663615, 0.7050185, 1.548513, 0.9490196, 0, 1, 1,
0.9687371, 0.8964798, 1.119654, 0.9568627, 0, 1, 1,
0.9725381, -1.829796, 4.344546, 0.9607843, 0, 1, 1,
0.9748642, 1.462688, -1.039806, 0.9686275, 0, 1, 1,
0.9779801, 1.721927, 0.1073014, 0.972549, 0, 1, 1,
0.9831462, -0.02041878, 1.455274, 0.9803922, 0, 1, 1,
0.9843616, 0.2333362, 2.989859, 0.9843137, 0, 1, 1,
0.9849693, 0.8480973, 1.638565, 0.9921569, 0, 1, 1,
0.9861575, 0.4059665, -0.169094, 0.9960784, 0, 1, 1,
0.9914514, -1.720676, 3.991122, 1, 0, 0.9960784, 1,
0.9931729, -0.07681691, 1.818124, 1, 0, 0.9882353, 1,
0.9944768, 1.028829, -0.1723241, 1, 0, 0.9843137, 1,
1.00042, 1.815391, 1.139719, 1, 0, 0.9764706, 1,
1.000999, -0.2467351, 4.126488, 1, 0, 0.972549, 1,
1.012464, -0.7709777, 2.285816, 1, 0, 0.9647059, 1,
1.014189, 0.2010702, 3.426965, 1, 0, 0.9607843, 1,
1.016332, -1.506783, 0.3443294, 1, 0, 0.9529412, 1,
1.021649, -0.07568717, 0.8270761, 1, 0, 0.9490196, 1,
1.023453, -0.2810595, -0.4363277, 1, 0, 0.9411765, 1,
1.023771, 1.758796, 0.8382046, 1, 0, 0.9372549, 1,
1.025824, 0.005355914, 0.07716738, 1, 0, 0.9294118, 1,
1.026843, -0.7431724, 3.162734, 1, 0, 0.9254902, 1,
1.029099, 0.4755048, 1.768961, 1, 0, 0.9176471, 1,
1.030415, 0.4105326, 1.535379, 1, 0, 0.9137255, 1,
1.031132, -0.7811927, 3.074404, 1, 0, 0.9058824, 1,
1.031544, -0.05040653, 2.344168, 1, 0, 0.9019608, 1,
1.036391, 0.04666464, 3.544434, 1, 0, 0.8941177, 1,
1.041239, -0.6876645, 2.243103, 1, 0, 0.8862745, 1,
1.041736, 0.4178486, 2.182007, 1, 0, 0.8823529, 1,
1.046299, -1.421084, 4.163081, 1, 0, 0.8745098, 1,
1.053329, 1.080036, 0.5409893, 1, 0, 0.8705882, 1,
1.061499, -0.9755391, 2.532363, 1, 0, 0.8627451, 1,
1.071858, 0.6422872, 1.071094, 1, 0, 0.8588235, 1,
1.076148, 0.2680118, 2.758653, 1, 0, 0.8509804, 1,
1.08004, 1.354894, -0.1575034, 1, 0, 0.8470588, 1,
1.085867, 0.6318459, 0.5808359, 1, 0, 0.8392157, 1,
1.085917, 0.5451202, -0.01030341, 1, 0, 0.8352941, 1,
1.091071, -1.238844, 3.470257, 1, 0, 0.827451, 1,
1.103122, 0.1673636, 0.5185788, 1, 0, 0.8235294, 1,
1.105651, 1.610215, -0.1865795, 1, 0, 0.8156863, 1,
1.107471, 1.093983, 0.5618559, 1, 0, 0.8117647, 1,
1.108929, -1.106868, 2.886799, 1, 0, 0.8039216, 1,
1.114909, -0.2164514, 3.582978, 1, 0, 0.7960784, 1,
1.115075, -1.001635, 1.148945, 1, 0, 0.7921569, 1,
1.116695, 0.4556478, 1.972504, 1, 0, 0.7843137, 1,
1.126813, 0.2849064, 1.358376, 1, 0, 0.7803922, 1,
1.134281, -0.05059183, 1.226005, 1, 0, 0.772549, 1,
1.147644, 0.07842833, 1.676602, 1, 0, 0.7686275, 1,
1.152645, 0.4947594, 0.2237706, 1, 0, 0.7607843, 1,
1.1571, 0.6887779, 0.7063301, 1, 0, 0.7568628, 1,
1.159364, -1.258726, 1.669706, 1, 0, 0.7490196, 1,
1.166468, -0.7109094, 1.553663, 1, 0, 0.7450981, 1,
1.173239, -0.4123406, 2.805509, 1, 0, 0.7372549, 1,
1.175178, 0.07204293, 1.060017, 1, 0, 0.7333333, 1,
1.177501, -0.168876, 0.8250603, 1, 0, 0.7254902, 1,
1.184397, 1.437231, 0.5749815, 1, 0, 0.7215686, 1,
1.191237, 0.9946005, 2.596756, 1, 0, 0.7137255, 1,
1.194213, 0.7237184, 0.2755727, 1, 0, 0.7098039, 1,
1.212851, 0.02888731, 0.7290447, 1, 0, 0.7019608, 1,
1.215139, 0.4414096, 0.2308445, 1, 0, 0.6941177, 1,
1.216842, -2.48378, 2.023934, 1, 0, 0.6901961, 1,
1.222941, -0.7626644, 2.365545, 1, 0, 0.682353, 1,
1.225542, 0.1809791, 2.413827, 1, 0, 0.6784314, 1,
1.230168, -0.1180469, 2.108286, 1, 0, 0.6705883, 1,
1.237684, -0.6270334, 2.218985, 1, 0, 0.6666667, 1,
1.25512, 0.9847472, 0.1001733, 1, 0, 0.6588235, 1,
1.26023, 0.3551209, -0.00745693, 1, 0, 0.654902, 1,
1.263888, 0.3530147, 2.193006, 1, 0, 0.6470588, 1,
1.274154, -0.604516, 1.554853, 1, 0, 0.6431373, 1,
1.275014, -0.5816206, 3.147951, 1, 0, 0.6352941, 1,
1.27835, 0.05193403, 1.923374, 1, 0, 0.6313726, 1,
1.283781, -0.3308668, 2.585983, 1, 0, 0.6235294, 1,
1.284344, -1.423873, 1.986659, 1, 0, 0.6196079, 1,
1.312079, 0.9384779, 0.363187, 1, 0, 0.6117647, 1,
1.318722, -0.3123268, 0.2701821, 1, 0, 0.6078432, 1,
1.324484, 1.006735, 1.479419, 1, 0, 0.6, 1,
1.331679, -0.2727814, -0.9678254, 1, 0, 0.5921569, 1,
1.336703, 0.9622253, 2.578438, 1, 0, 0.5882353, 1,
1.337346, 0.4005428, 0.826212, 1, 0, 0.5803922, 1,
1.341733, -0.6831425, 0.4631108, 1, 0, 0.5764706, 1,
1.342181, -0.3256805, 1.942301, 1, 0, 0.5686275, 1,
1.347995, -0.4307719, 1.097169, 1, 0, 0.5647059, 1,
1.348441, 0.7463349, 1.842616, 1, 0, 0.5568628, 1,
1.356109, -0.4119322, 2.332819, 1, 0, 0.5529412, 1,
1.378738, -0.3336131, 2.121851, 1, 0, 0.5450981, 1,
1.389735, 0.2378758, 1.558164, 1, 0, 0.5411765, 1,
1.391739, -1.829291, 2.73757, 1, 0, 0.5333334, 1,
1.392206, -0.06770081, 2.773732, 1, 0, 0.5294118, 1,
1.392644, -0.8030689, 1.972258, 1, 0, 0.5215687, 1,
1.394218, -0.9482548, 2.535137, 1, 0, 0.5176471, 1,
1.396874, -0.7554516, 3.952075, 1, 0, 0.509804, 1,
1.399303, 1.438265, -0.1798641, 1, 0, 0.5058824, 1,
1.401227, -1.285105, 3.215614, 1, 0, 0.4980392, 1,
1.424852, 1.463707, 1.350454, 1, 0, 0.4901961, 1,
1.431241, -0.4719873, 1.650907, 1, 0, 0.4862745, 1,
1.431824, -0.05633619, 0.9574809, 1, 0, 0.4784314, 1,
1.432334, 0.6243137, 2.061584, 1, 0, 0.4745098, 1,
1.433458, 2.044464, 1.725304, 1, 0, 0.4666667, 1,
1.436903, -0.6437924, 1.718781, 1, 0, 0.4627451, 1,
1.442571, -1.052557, 2.682426, 1, 0, 0.454902, 1,
1.447401, -0.2961418, 1.180382, 1, 0, 0.4509804, 1,
1.455625, 1.723267, -0.7213624, 1, 0, 0.4431373, 1,
1.455833, -0.9793163, 1.803435, 1, 0, 0.4392157, 1,
1.458474, 2.189305, -0.6071939, 1, 0, 0.4313726, 1,
1.470045, 0.3096167, 1.578448, 1, 0, 0.427451, 1,
1.477982, -0.566112, 1.617968, 1, 0, 0.4196078, 1,
1.481321, -1.647967, 3.003258, 1, 0, 0.4156863, 1,
1.48535, -1.225629, 4.134978, 1, 0, 0.4078431, 1,
1.496016, -1.708333, 2.077806, 1, 0, 0.4039216, 1,
1.498218, 0.2045767, 1.718811, 1, 0, 0.3960784, 1,
1.504516, 1.259501, 0.5355973, 1, 0, 0.3882353, 1,
1.506279, 1.289282, 2.435695, 1, 0, 0.3843137, 1,
1.521997, 1.377436, -0.3433048, 1, 0, 0.3764706, 1,
1.529314, -0.8994472, 1.909038, 1, 0, 0.372549, 1,
1.532887, -0.6572695, 2.231465, 1, 0, 0.3647059, 1,
1.545731, -0.07586887, 2.970335, 1, 0, 0.3607843, 1,
1.547653, -0.2588668, 2.341686, 1, 0, 0.3529412, 1,
1.552674, 0.9778225, 1.799019, 1, 0, 0.3490196, 1,
1.55721, 1.244092, -1.217381, 1, 0, 0.3411765, 1,
1.562569, -0.9206135, 2.856779, 1, 0, 0.3372549, 1,
1.563681, -0.3072972, 1.169297, 1, 0, 0.3294118, 1,
1.566572, 0.05863276, 0.2686481, 1, 0, 0.3254902, 1,
1.566775, -0.5022059, 1.79971, 1, 0, 0.3176471, 1,
1.569121, -0.5004165, 2.625049, 1, 0, 0.3137255, 1,
1.585861, -0.1532883, 0.9968199, 1, 0, 0.3058824, 1,
1.593158, -0.5591271, 3.278975, 1, 0, 0.2980392, 1,
1.594466, -1.002002, 3.218465, 1, 0, 0.2941177, 1,
1.613006, -0.6979553, 0.6089798, 1, 0, 0.2862745, 1,
1.617024, 1.530646, 2.29002, 1, 0, 0.282353, 1,
1.638842, -0.4618694, 1.078507, 1, 0, 0.2745098, 1,
1.663752, -0.7059636, 3.209689, 1, 0, 0.2705882, 1,
1.66417, -1.508454, 3.40684, 1, 0, 0.2627451, 1,
1.667031, 0.8387511, 0.3402227, 1, 0, 0.2588235, 1,
1.669207, 1.312431, -0.3068717, 1, 0, 0.2509804, 1,
1.683097, -0.07044882, 3.00058, 1, 0, 0.2470588, 1,
1.691607, -0.3746317, 0.6062684, 1, 0, 0.2392157, 1,
1.692695, 2.158659, 0.4240394, 1, 0, 0.2352941, 1,
1.699468, -1.051692, 3.579303, 1, 0, 0.227451, 1,
1.714673, -0.5693381, 0.09547576, 1, 0, 0.2235294, 1,
1.71533, -1.969445, 1.013725, 1, 0, 0.2156863, 1,
1.759166, -1.221971, 3.778507, 1, 0, 0.2117647, 1,
1.760079, 0.107472, 4.263855, 1, 0, 0.2039216, 1,
1.832074, -0.9881799, 3.102536, 1, 0, 0.1960784, 1,
1.832976, 0.05299185, 2.846957, 1, 0, 0.1921569, 1,
1.85199, 1.42975, 0.4611965, 1, 0, 0.1843137, 1,
1.862339, -0.2358818, 1.441493, 1, 0, 0.1803922, 1,
1.869791, 0.807064, 2.178754, 1, 0, 0.172549, 1,
1.894212, 0.3874213, 0.5573228, 1, 0, 0.1686275, 1,
1.89859, -0.03119976, 2.122459, 1, 0, 0.1607843, 1,
1.900458, -0.05843907, 0.3872523, 1, 0, 0.1568628, 1,
1.901467, -0.8015029, 2.840354, 1, 0, 0.1490196, 1,
1.932783, -0.5598157, 3.491655, 1, 0, 0.145098, 1,
1.936423, 0.2587176, 1.181689, 1, 0, 0.1372549, 1,
2.003095, 0.2806297, 0.9608439, 1, 0, 0.1333333, 1,
2.034733, -0.1888877, 1.060838, 1, 0, 0.1254902, 1,
2.044987, 0.6970478, 0.7484025, 1, 0, 0.1215686, 1,
2.090403, -0.2357659, 1.804234, 1, 0, 0.1137255, 1,
2.105781, -0.4720978, 1.606298, 1, 0, 0.1098039, 1,
2.108346, 0.8482109, 0.4352664, 1, 0, 0.1019608, 1,
2.123035, -1.17735, 3.372562, 1, 0, 0.09411765, 1,
2.126967, 1.637956, -1.254117, 1, 0, 0.09019608, 1,
2.133664, 0.1598407, 0.9754528, 1, 0, 0.08235294, 1,
2.150747, -0.3396158, 1.862329, 1, 0, 0.07843138, 1,
2.16663, -0.380635, 3.204738, 1, 0, 0.07058824, 1,
2.214724, 1.256755, 0.3957372, 1, 0, 0.06666667, 1,
2.27312, -2.079781, 2.088433, 1, 0, 0.05882353, 1,
2.2758, -0.4550994, -0.3147234, 1, 0, 0.05490196, 1,
2.347778, -0.6312298, 2.057981, 1, 0, 0.04705882, 1,
2.445394, -0.4955237, -0.6245154, 1, 0, 0.04313726, 1,
2.459043, 0.5375918, 3.099976, 1, 0, 0.03529412, 1,
2.58684, -0.4633764, 0.2927579, 1, 0, 0.03137255, 1,
2.640367, 2.751991, 0.5974449, 1, 0, 0.02352941, 1,
2.705028, 0.1679267, 3.160404, 1, 0, 0.01960784, 1,
2.71249, -0.5400782, 1.874068, 1, 0, 0.01176471, 1,
2.844725, 1.915978, 1.245708, 1, 0, 0.007843138, 1
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
-0.1735041, -4.261207, -7.45926, 0, -0.5, 0.5, 0.5,
-0.1735041, -4.261207, -7.45926, 1, -0.5, 0.5, 0.5,
-0.1735041, -4.261207, -7.45926, 1, 1.5, 0.5, 0.5,
-0.1735041, -4.261207, -7.45926, 0, 1.5, 0.5, 0.5
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
-4.214913, 0.368747, -7.45926, 0, -0.5, 0.5, 0.5,
-4.214913, 0.368747, -7.45926, 1, -0.5, 0.5, 0.5,
-4.214913, 0.368747, -7.45926, 1, 1.5, 0.5, 0.5,
-4.214913, 0.368747, -7.45926, 0, 1.5, 0.5, 0.5
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
-4.214913, -4.261207, 0.4900844, 0, -0.5, 0.5, 0.5,
-4.214913, -4.261207, 0.4900844, 1, -0.5, 0.5, 0.5,
-4.214913, -4.261207, 0.4900844, 1, 1.5, 0.5, 0.5,
-4.214913, -4.261207, 0.4900844, 0, 1.5, 0.5, 0.5
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
-3, -3.192756, -5.624796,
2, -3.192756, -5.624796,
-3, -3.192756, -5.624796,
-3, -3.370831, -5.93054,
-2, -3.192756, -5.624796,
-2, -3.370831, -5.93054,
-1, -3.192756, -5.624796,
-1, -3.370831, -5.93054,
0, -3.192756, -5.624796,
0, -3.370831, -5.93054,
1, -3.192756, -5.624796,
1, -3.370831, -5.93054,
2, -3.192756, -5.624796,
2, -3.370831, -5.93054
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
-3, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
-3, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
-3, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
-3, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5,
-2, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
-2, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
-2, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
-2, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5,
-1, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
-1, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
-1, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
-1, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5,
0, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
0, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
0, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
0, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5,
1, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
1, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
1, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
1, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5,
2, -3.726981, -6.542028, 0, -0.5, 0.5, 0.5,
2, -3.726981, -6.542028, 1, -0.5, 0.5, 0.5,
2, -3.726981, -6.542028, 1, 1.5, 0.5, 0.5,
2, -3.726981, -6.542028, 0, 1.5, 0.5, 0.5
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
-3.28228, -3, -5.624796,
-3.28228, 3, -5.624796,
-3.28228, -3, -5.624796,
-3.437719, -3, -5.93054,
-3.28228, -2, -5.624796,
-3.437719, -2, -5.93054,
-3.28228, -1, -5.624796,
-3.437719, -1, -5.93054,
-3.28228, 0, -5.624796,
-3.437719, 0, -5.93054,
-3.28228, 1, -5.624796,
-3.437719, 1, -5.93054,
-3.28228, 2, -5.624796,
-3.437719, 2, -5.93054,
-3.28228, 3, -5.624796,
-3.437719, 3, -5.93054
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
-3.748597, -3, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, -3, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, -3, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, -3, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, -2, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, -2, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, -2, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, -2, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, -1, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, -1, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, -1, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, -1, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, 0, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, 0, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, 0, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, 0, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, 1, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, 1, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, 1, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, 1, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, 2, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, 2, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, 2, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, 2, -6.542028, 0, 1.5, 0.5, 0.5,
-3.748597, 3, -6.542028, 0, -0.5, 0.5, 0.5,
-3.748597, 3, -6.542028, 1, -0.5, 0.5, 0.5,
-3.748597, 3, -6.542028, 1, 1.5, 0.5, 0.5,
-3.748597, 3, -6.542028, 0, 1.5, 0.5, 0.5
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
-3.28228, -3.192756, -4,
-3.28228, -3.192756, 6,
-3.28228, -3.192756, -4,
-3.437719, -3.370831, -4,
-3.28228, -3.192756, -2,
-3.437719, -3.370831, -2,
-3.28228, -3.192756, 0,
-3.437719, -3.370831, 0,
-3.28228, -3.192756, 2,
-3.437719, -3.370831, 2,
-3.28228, -3.192756, 4,
-3.437719, -3.370831, 4,
-3.28228, -3.192756, 6,
-3.437719, -3.370831, 6
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
"4",
"6"
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
-3.748597, -3.726981, -4, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, -4, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, -4, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, -4, 0, 1.5, 0.5, 0.5,
-3.748597, -3.726981, -2, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, -2, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, -2, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, -2, 0, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 0, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 0, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 0, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 0, 0, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 2, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 2, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 2, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 2, 0, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 4, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 4, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 4, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 4, 0, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 6, 0, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 6, 1, -0.5, 0.5, 0.5,
-3.748597, -3.726981, 6, 1, 1.5, 0.5, 0.5,
-3.748597, -3.726981, 6, 0, 1.5, 0.5, 0.5
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
-3.28228, -3.192756, -5.624796,
-3.28228, 3.93025, -5.624796,
-3.28228, -3.192756, 6.604965,
-3.28228, 3.93025, 6.604965,
-3.28228, -3.192756, -5.624796,
-3.28228, -3.192756, 6.604965,
-3.28228, 3.93025, -5.624796,
-3.28228, 3.93025, 6.604965,
-3.28228, -3.192756, -5.624796,
2.935272, -3.192756, -5.624796,
-3.28228, -3.192756, 6.604965,
2.935272, -3.192756, 6.604965,
-3.28228, 3.93025, -5.624796,
2.935272, 3.93025, -5.624796,
-3.28228, 3.93025, 6.604965,
2.935272, 3.93025, 6.604965,
2.935272, -3.192756, -5.624796,
2.935272, 3.93025, -5.624796,
2.935272, -3.192756, 6.604965,
2.935272, 3.93025, 6.604965,
2.935272, -3.192756, -5.624796,
2.935272, -3.192756, 6.604965,
2.935272, 3.93025, -5.624796,
2.935272, 3.93025, 6.604965
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
var radius = 8.254487;
var distance = 36.72515;
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
mvMatrix.translate( 0.1735041, -0.368747, -0.4900844 );
mvMatrix.scale( 1.435438, 1.25297, 0.72977 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.72515);
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
acrylate_piperonyl_b<-read.table("acrylate_piperonyl_b.xyz", skip=1)
```

```
## Error in read.table("acrylate_piperonyl_b.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-acrylate_piperonyl_b$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
```

```r
y<-acrylate_piperonyl_b$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
```

```r
z<-acrylate_piperonyl_b$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
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
-3.191733, -0.2804794, -1.663825, 0, 0, 1, 1, 1,
-3.122643, 0.1033417, -2.642675, 1, 0, 0, 1, 1,
-3.020743, 0.6678188, -0.4234954, 1, 0, 0, 1, 1,
-2.543127, 0.1556158, -3.744118, 1, 0, 0, 1, 1,
-2.540811, -0.02851768, -2.247386, 1, 0, 0, 1, 1,
-2.509254, 0.4833388, -1.704675, 1, 0, 0, 1, 1,
-2.502661, -2.883001, -1.92938, 0, 0, 0, 1, 1,
-2.479115, -1.228878, -0.421734, 0, 0, 0, 1, 1,
-2.46443, 0.4300627, -1.397663, 0, 0, 0, 1, 1,
-2.430285, 0.8281455, -3.343563, 0, 0, 0, 1, 1,
-2.418178, 0.4749585, -1.523511, 0, 0, 0, 1, 1,
-2.389438, 1.181084, -1.289744, 0, 0, 0, 1, 1,
-2.276108, 1.19013, -2.482594, 0, 0, 0, 1, 1,
-2.215281, 0.9740738, -1.022398, 1, 1, 1, 1, 1,
-2.191588, -0.1668106, -0.8920952, 1, 1, 1, 1, 1,
-2.170779, 1.330645, -2.867206, 1, 1, 1, 1, 1,
-2.159826, -0.6257648, -2.700284, 1, 1, 1, 1, 1,
-2.137748, -0.3554167, -2.475967, 1, 1, 1, 1, 1,
-2.071433, -0.4560184, -0.4848389, 1, 1, 1, 1, 1,
-2.050447, 0.4918304, -1.301746, 1, 1, 1, 1, 1,
-2.037903, -0.7230458, -1.966668, 1, 1, 1, 1, 1,
-2.017001, -1.289884, -0.9526125, 1, 1, 1, 1, 1,
-1.987819, -0.8129723, -3.745193, 1, 1, 1, 1, 1,
-1.970589, 0.3481288, -0.9977821, 1, 1, 1, 1, 1,
-1.936821, 0.1014536, -0.7146149, 1, 1, 1, 1, 1,
-1.902331, 0.1483701, -0.9783882, 1, 1, 1, 1, 1,
-1.899685, -0.5244234, -0.4067509, 1, 1, 1, 1, 1,
-1.888199, 0.5597406, -0.7953936, 1, 1, 1, 1, 1,
-1.876883, -0.2061438, -1.187073, 0, 0, 1, 1, 1,
-1.872269, 0.6935039, -1.773407, 1, 0, 0, 1, 1,
-1.870576, 0.3730492, -0.3460787, 1, 0, 0, 1, 1,
-1.847149, -0.6806491, -0.7765678, 1, 0, 0, 1, 1,
-1.83775, 0.3120651, -1.241094, 1, 0, 0, 1, 1,
-1.836173, -0.8278719, -2.334004, 1, 0, 0, 1, 1,
-1.835907, -0.3787667, -0.9898798, 0, 0, 0, 1, 1,
-1.832731, -0.1511736, -0.7730163, 0, 0, 0, 1, 1,
-1.819709, 0.6334397, -1.560521, 0, 0, 0, 1, 1,
-1.792008, 0.1827311, -1.366815, 0, 0, 0, 1, 1,
-1.79057, 0.7807459, -0.2981668, 0, 0, 0, 1, 1,
-1.779749, -0.08697869, -0.8226063, 0, 0, 0, 1, 1,
-1.774172, 0.2000267, -2.415213, 0, 0, 0, 1, 1,
-1.760422, 0.8479844, -0.4756433, 1, 1, 1, 1, 1,
-1.756356, -0.5589575, -2.039272, 1, 1, 1, 1, 1,
-1.746851, -1.286018, -3.152573, 1, 1, 1, 1, 1,
-1.729664, 0.2974314, -2.130664, 1, 1, 1, 1, 1,
-1.712832, -0.8116553, -1.758684, 1, 1, 1, 1, 1,
-1.695284, 0.3099344, -2.149533, 1, 1, 1, 1, 1,
-1.685063, -0.1779162, -0.3905647, 1, 1, 1, 1, 1,
-1.680987, 0.6489751, -0.8770182, 1, 1, 1, 1, 1,
-1.667191, -0.925127, -3.18244, 1, 1, 1, 1, 1,
-1.65802, -1.879727, -3.523854, 1, 1, 1, 1, 1,
-1.633807, -1.296233, -3.634856, 1, 1, 1, 1, 1,
-1.633584, 0.09581954, 0.1990779, 1, 1, 1, 1, 1,
-1.628781, 0.2086639, 0.4807285, 1, 1, 1, 1, 1,
-1.613745, -0.02321582, -1.74001, 1, 1, 1, 1, 1,
-1.606725, 0.7684628, 0.7028685, 1, 1, 1, 1, 1,
-1.601077, -1.271648, -1.448814, 0, 0, 1, 1, 1,
-1.596691, 0.006268268, -0.5085885, 1, 0, 0, 1, 1,
-1.571755, -0.4342982, -1.849327, 1, 0, 0, 1, 1,
-1.570197, 1.530892, -0.7272055, 1, 0, 0, 1, 1,
-1.549343, 0.9823006, -1.679668, 1, 0, 0, 1, 1,
-1.541981, -0.01868543, -1.697191, 1, 0, 0, 1, 1,
-1.539743, 0.1752812, -1.449244, 0, 0, 0, 1, 1,
-1.537492, -0.01823195, -0.5911095, 0, 0, 0, 1, 1,
-1.53665, 0.6345083, -1.490655, 0, 0, 0, 1, 1,
-1.536576, 3.243116, -0.6978614, 0, 0, 0, 1, 1,
-1.533824, -0.6459201, -3.792836, 0, 0, 0, 1, 1,
-1.529717, 0.6838139, -0.7082967, 0, 0, 0, 1, 1,
-1.524631, 1.815512, -2.386031, 0, 0, 0, 1, 1,
-1.517215, 0.6024586, 0.05133602, 1, 1, 1, 1, 1,
-1.515166, 0.8773447, -1.20434, 1, 1, 1, 1, 1,
-1.512849, 1.469553, -2.982464, 1, 1, 1, 1, 1,
-1.509163, -0.2958074, -3.034526, 1, 1, 1, 1, 1,
-1.497626, -0.3178407, -1.301296, 1, 1, 1, 1, 1,
-1.484895, 0.7531745, -1.202482, 1, 1, 1, 1, 1,
-1.480309, 1.110497, -1.442423, 1, 1, 1, 1, 1,
-1.477973, -2.179123, -4.130455, 1, 1, 1, 1, 1,
-1.47613, 0.2837048, -0.645743, 1, 1, 1, 1, 1,
-1.467865, -0.07788702, -2.697533, 1, 1, 1, 1, 1,
-1.461106, 0.289831, -1.864166, 1, 1, 1, 1, 1,
-1.459847, 0.7978788, -0.6488443, 1, 1, 1, 1, 1,
-1.454377, 0.7216622, -1.014126, 1, 1, 1, 1, 1,
-1.441072, 0.6260608, -0.2408442, 1, 1, 1, 1, 1,
-1.438544, 1.645329, -0.6435714, 1, 1, 1, 1, 1,
-1.421178, 1.340907, -0.8542387, 0, 0, 1, 1, 1,
-1.420798, 1.027515, -0.7582029, 1, 0, 0, 1, 1,
-1.400826, -1.50594, -2.191078, 1, 0, 0, 1, 1,
-1.3998, -0.7601936, -1.194873, 1, 0, 0, 1, 1,
-1.399007, 1.201916, -0.3647132, 1, 0, 0, 1, 1,
-1.398878, -0.4870661, -2.750228, 1, 0, 0, 1, 1,
-1.398513, 0.2805813, -1.94503, 0, 0, 0, 1, 1,
-1.398222, -1.040792, -1.555089, 0, 0, 0, 1, 1,
-1.387349, 0.9078227, -0.8208737, 0, 0, 0, 1, 1,
-1.382895, -0.3534646, -3.558323, 0, 0, 0, 1, 1,
-1.376759, -3.089023, -2.011795, 0, 0, 0, 1, 1,
-1.370328, -0.3804319, -1.596252, 0, 0, 0, 1, 1,
-1.363778, 1.129918, -0.6445978, 0, 0, 0, 1, 1,
-1.349674, 0.8616375, -1.717905, 1, 1, 1, 1, 1,
-1.347665, -0.0455264, -1.519732, 1, 1, 1, 1, 1,
-1.344149, -1.202703, -4.719925, 1, 1, 1, 1, 1,
-1.308608, -1.24927, -2.028146, 1, 1, 1, 1, 1,
-1.305265, -1.231717, -2.170935, 1, 1, 1, 1, 1,
-1.304149, 0.3929354, -1.342317, 1, 1, 1, 1, 1,
-1.294213, 0.9902578, -0.4821755, 1, 1, 1, 1, 1,
-1.287962, -0.4633581, -0.7277508, 1, 1, 1, 1, 1,
-1.283209, 0.696588, -1.30488, 1, 1, 1, 1, 1,
-1.277892, 1.215804, -0.1584789, 1, 1, 1, 1, 1,
-1.261736, 0.6415957, -0.2166851, 1, 1, 1, 1, 1,
-1.250171, -1.017511, -2.734716, 1, 1, 1, 1, 1,
-1.240688, 0.04968001, -2.024042, 1, 1, 1, 1, 1,
-1.239778, 0.2817779, -1.50332, 1, 1, 1, 1, 1,
-1.237751, -1.10323, -2.103387, 1, 1, 1, 1, 1,
-1.237478, -0.9042392, -2.5791, 0, 0, 1, 1, 1,
-1.229686, 0.6073152, -0.3223447, 1, 0, 0, 1, 1,
-1.229337, -1.000445, -2.618681, 1, 0, 0, 1, 1,
-1.219874, 0.3886274, -0.4578721, 1, 0, 0, 1, 1,
-1.215304, 0.7653463, -0.8357456, 1, 0, 0, 1, 1,
-1.210123, 0.1108973, -1.912443, 1, 0, 0, 1, 1,
-1.20857, 0.2290306, -3.177929, 0, 0, 0, 1, 1,
-1.20672, 0.7651368, -1.850891, 0, 0, 0, 1, 1,
-1.205776, -1.130237, -2.148422, 0, 0, 0, 1, 1,
-1.204698, 0.3456278, -2.193032, 0, 0, 0, 1, 1,
-1.197899, 1.496158, -1.81216, 0, 0, 0, 1, 1,
-1.194015, -1.325143, -2.54974, 0, 0, 0, 1, 1,
-1.190455, -0.1130349, -2.756917, 0, 0, 0, 1, 1,
-1.190421, 0.3582254, -0.8009004, 1, 1, 1, 1, 1,
-1.179929, -0.7376943, -0.8605366, 1, 1, 1, 1, 1,
-1.17435, -1.542112, -3.627578, 1, 1, 1, 1, 1,
-1.158338, 2.413927, 1.377624, 1, 1, 1, 1, 1,
-1.156383, 0.08376947, -2.717059, 1, 1, 1, 1, 1,
-1.1495, -1.288179, -0.977896, 1, 1, 1, 1, 1,
-1.130614, -1.698053, -1.539731, 1, 1, 1, 1, 1,
-1.120174, -0.2389722, -1.979035, 1, 1, 1, 1, 1,
-1.119391, -0.2443683, -1.097599, 1, 1, 1, 1, 1,
-1.116192, -1.417498, -2.965673, 1, 1, 1, 1, 1,
-1.11264, -0.5888012, -2.97651, 1, 1, 1, 1, 1,
-1.112493, -1.225297, -2.630212, 1, 1, 1, 1, 1,
-1.110215, 0.6156054, -0.9608389, 1, 1, 1, 1, 1,
-1.103968, -1.11947, -2.768633, 1, 1, 1, 1, 1,
-1.103591, 0.5228006, -1.950604, 1, 1, 1, 1, 1,
-1.101194, -0.213439, -1.876359, 0, 0, 1, 1, 1,
-1.09972, 0.08238525, -0.1831629, 1, 0, 0, 1, 1,
-1.087645, -0.254677, -1.706827, 1, 0, 0, 1, 1,
-1.081962, 0.2002556, -1.054317, 1, 0, 0, 1, 1,
-1.076087, -0.5768285, -2.460122, 1, 0, 0, 1, 1,
-1.066636, 0.01231957, -1.743327, 1, 0, 0, 1, 1,
-1.066286, 0.974243, -0.8331931, 0, 0, 0, 1, 1,
-1.065578, -1.592355, -2.518795, 0, 0, 0, 1, 1,
-1.064726, 0.03396657, -0.7403408, 0, 0, 0, 1, 1,
-1.059846, 0.6230404, -0.7914837, 0, 0, 0, 1, 1,
-1.050914, 0.08383455, -1.150345, 0, 0, 0, 1, 1,
-1.044217, -0.3952879, -3.549638, 0, 0, 0, 1, 1,
-1.043368, -1.358529, -5.287366, 0, 0, 0, 1, 1,
-1.037995, 0.1961628, -0.1521831, 1, 1, 1, 1, 1,
-1.023017, -1.756994, -1.598682, 1, 1, 1, 1, 1,
-1.021828, 0.7571854, -0.9396657, 1, 1, 1, 1, 1,
-1.020066, 0.9460189, -0.2065426, 1, 1, 1, 1, 1,
-1.017702, -0.7597497, -3.476718, 1, 1, 1, 1, 1,
-1.016172, 1.495175, -1.347699, 1, 1, 1, 1, 1,
-1.015308, 0.1385348, -2.8163, 1, 1, 1, 1, 1,
-1.008373, 0.91802, 0.6049536, 1, 1, 1, 1, 1,
-1.007205, 0.6945319, -1.848955, 1, 1, 1, 1, 1,
-1.000532, 0.373388, -2.350589, 1, 1, 1, 1, 1,
-1.000266, -1.587266, -3.116607, 1, 1, 1, 1, 1,
-0.9999899, -0.8066779, -2.4542, 1, 1, 1, 1, 1,
-0.9975408, 0.1589094, -1.953607, 1, 1, 1, 1, 1,
-0.9961693, 0.04245682, -2.048355, 1, 1, 1, 1, 1,
-0.9817451, -0.8768806, -2.333731, 1, 1, 1, 1, 1,
-0.9705969, 0.02505419, -2.18214, 0, 0, 1, 1, 1,
-0.9694107, 1.465805, -1.542539, 1, 0, 0, 1, 1,
-0.9621142, 1.242908, 0.3516389, 1, 0, 0, 1, 1,
-0.9610203, 0.6365733, 0.6746196, 1, 0, 0, 1, 1,
-0.9590294, 1.176842, -0.3040272, 1, 0, 0, 1, 1,
-0.9559891, -0.8691748, -3.830393, 1, 0, 0, 1, 1,
-0.9544098, 0.830263, -0.9081424, 0, 0, 0, 1, 1,
-0.9448311, -0.7571818, -3.624295, 0, 0, 0, 1, 1,
-0.9414325, 0.505208, -1.252845, 0, 0, 0, 1, 1,
-0.9408579, 0.1931541, -0.1687188, 0, 0, 0, 1, 1,
-0.9350637, 1.618183, -2.742959, 0, 0, 0, 1, 1,
-0.9345902, 0.2018322, -2.573153, 0, 0, 0, 1, 1,
-0.9315684, -2.071725, -2.744333, 0, 0, 0, 1, 1,
-0.9261805, -1.120225, -0.4922225, 1, 1, 1, 1, 1,
-0.9240586, -0.04281774, -0.01358097, 1, 1, 1, 1, 1,
-0.920859, -2.248411, -1.963246, 1, 1, 1, 1, 1,
-0.9191499, 1.0187, 0.08353191, 1, 1, 1, 1, 1,
-0.9165884, -1.160788, -2.337255, 1, 1, 1, 1, 1,
-0.9137863, 2.621372, -1.169105, 1, 1, 1, 1, 1,
-0.9067519, -1.382725, -3.246486, 1, 1, 1, 1, 1,
-0.9060241, -0.8754273, -1.703198, 1, 1, 1, 1, 1,
-0.9025937, -1.333895, -1.163005, 1, 1, 1, 1, 1,
-0.8901099, -2.02622, -5.054751, 1, 1, 1, 1, 1,
-0.8860728, -0.5357772, -4.723154, 1, 1, 1, 1, 1,
-0.8858669, 1.109014, -0.02426659, 1, 1, 1, 1, 1,
-0.8724687, -0.2970388, -0.6491354, 1, 1, 1, 1, 1,
-0.8715124, 0.8973358, -2.138549, 1, 1, 1, 1, 1,
-0.8683902, 0.1666323, -1.159998, 1, 1, 1, 1, 1,
-0.8660548, -1.444814, -2.570005, 0, 0, 1, 1, 1,
-0.8600929, -0.7624086, -2.018438, 1, 0, 0, 1, 1,
-0.85818, -0.0700436, -1.525396, 1, 0, 0, 1, 1,
-0.8555986, -0.2756976, -3.027181, 1, 0, 0, 1, 1,
-0.8525194, -0.6105936, -2.218853, 1, 0, 0, 1, 1,
-0.8491526, 0.2171917, -1.554339, 1, 0, 0, 1, 1,
-0.8464836, 0.4317221, -1.182718, 0, 0, 0, 1, 1,
-0.8388157, 0.1160021, -1.550773, 0, 0, 0, 1, 1,
-0.8205259, -1.417022, -4.213801, 0, 0, 0, 1, 1,
-0.8193169, -2.724145, -4.970007, 0, 0, 0, 1, 1,
-0.8186063, 0.6588983, -2.450631, 0, 0, 0, 1, 1,
-0.8124059, 0.2267852, -1.265535, 0, 0, 0, 1, 1,
-0.8115133, -0.248549, -1.786683, 0, 0, 0, 1, 1,
-0.804755, 0.1994201, -1.925218, 1, 1, 1, 1, 1,
-0.8046724, -1.103356, -1.992285, 1, 1, 1, 1, 1,
-0.7954635, -0.3584514, -1.977694, 1, 1, 1, 1, 1,
-0.7904934, 0.2346715, -0.3478586, 1, 1, 1, 1, 1,
-0.7900532, -1.109434, -2.140168, 1, 1, 1, 1, 1,
-0.786847, 0.1484357, -0.2744502, 1, 1, 1, 1, 1,
-0.7857664, 1.02332, -0.5429299, 1, 1, 1, 1, 1,
-0.7843645, -0.255281, -3.624543, 1, 1, 1, 1, 1,
-0.7836105, -0.8929857, -1.707655, 1, 1, 1, 1, 1,
-0.782779, -0.01836329, -1.650698, 1, 1, 1, 1, 1,
-0.7795314, 1.104795, 0.3902022, 1, 1, 1, 1, 1,
-0.7778822, 0.8601614, -1.00572, 1, 1, 1, 1, 1,
-0.7760981, -0.6633586, -1.458967, 1, 1, 1, 1, 1,
-0.7745984, 0.2082147, -0.6605145, 1, 1, 1, 1, 1,
-0.7735674, -0.9994242, -0.2158486, 1, 1, 1, 1, 1,
-0.7713913, -0.9492434, -3.708754, 0, 0, 1, 1, 1,
-0.7703245, 0.5485616, -0.02424752, 1, 0, 0, 1, 1,
-0.7692224, -0.6315653, -3.725017, 1, 0, 0, 1, 1,
-0.7684316, -0.9332775, -2.915241, 1, 0, 0, 1, 1,
-0.7656637, -1.580161, -2.035614, 1, 0, 0, 1, 1,
-0.7565267, -0.6004336, -1.287393, 1, 0, 0, 1, 1,
-0.7555681, 1.617645, -1.305783, 0, 0, 0, 1, 1,
-0.7458846, 0.7870792, -1.593985, 0, 0, 0, 1, 1,
-0.7408286, 0.9054986, 1.978119, 0, 0, 0, 1, 1,
-0.7408, 1.566745, 0.798285, 0, 0, 0, 1, 1,
-0.7374364, -1.554311, -2.853906, 0, 0, 0, 1, 1,
-0.7351258, 1.687132, 0.857702, 0, 0, 0, 1, 1,
-0.7250455, -1.190729, -3.349961, 0, 0, 0, 1, 1,
-0.717308, -0.0190549, -2.188366, 1, 1, 1, 1, 1,
-0.7149699, 1.009524, -0.8876433, 1, 1, 1, 1, 1,
-0.7149021, 0.902618, -2.475222, 1, 1, 1, 1, 1,
-0.7101298, 1.308595, -1.376443, 1, 1, 1, 1, 1,
-0.7088681, -2.061149, -4.106407, 1, 1, 1, 1, 1,
-0.7056137, 3.091093, -0.1298071, 1, 1, 1, 1, 1,
-0.7026764, -0.8223903, -0.9928734, 1, 1, 1, 1, 1,
-0.6997945, -0.3001889, -1.176943, 1, 1, 1, 1, 1,
-0.6984348, -0.4276449, -1.195485, 1, 1, 1, 1, 1,
-0.6969915, -0.1847889, -1.277427, 1, 1, 1, 1, 1,
-0.6967983, -0.3659762, -1.269661, 1, 1, 1, 1, 1,
-0.6929928, 0.2922461, -1.495516, 1, 1, 1, 1, 1,
-0.6918721, -0.004570055, -1.742184, 1, 1, 1, 1, 1,
-0.6911204, -0.6240249, -1.611805, 1, 1, 1, 1, 1,
-0.6892471, -2.978815, -2.685094, 1, 1, 1, 1, 1,
-0.6881039, 0.6647136, -1.634813, 0, 0, 1, 1, 1,
-0.6802566, 0.1321206, -2.257436, 1, 0, 0, 1, 1,
-0.6800128, 1.539204, -0.7165006, 1, 0, 0, 1, 1,
-0.6771437, 0.2053928, -2.268459, 1, 0, 0, 1, 1,
-0.6728865, -1.369085, -0.6586176, 1, 0, 0, 1, 1,
-0.6702376, -2.03741, -2.782378, 1, 0, 0, 1, 1,
-0.6697518, 0.5548384, -0.1734283, 0, 0, 0, 1, 1,
-0.6694592, 0.6252082, -0.9894981, 0, 0, 0, 1, 1,
-0.6615364, 2.099945, -0.8275223, 0, 0, 0, 1, 1,
-0.6508659, 0.4220547, -2.24611, 0, 0, 0, 1, 1,
-0.6502394, -0.8653938, -2.132573, 0, 0, 0, 1, 1,
-0.6357962, 0.4960992, 0.2882431, 0, 0, 0, 1, 1,
-0.6340063, -0.7257722, -1.389921, 0, 0, 0, 1, 1,
-0.6287457, -2.083958, -4.201352, 1, 1, 1, 1, 1,
-0.6283287, -0.5864616, -1.832459, 1, 1, 1, 1, 1,
-0.6273478, 0.639127, -1.247147, 1, 1, 1, 1, 1,
-0.6240511, 1.331465, -1.780815, 1, 1, 1, 1, 1,
-0.6233408, 0.4064036, -0.7657807, 1, 1, 1, 1, 1,
-0.6233229, -0.7817897, -2.924286, 1, 1, 1, 1, 1,
-0.6231872, 1.975944, -1.225862, 1, 1, 1, 1, 1,
-0.6176072, -0.6404097, -2.629668, 1, 1, 1, 1, 1,
-0.6145511, -0.8061191, -1.893357, 1, 1, 1, 1, 1,
-0.6136401, -2.064778e-06, -2.993901, 1, 1, 1, 1, 1,
-0.6030176, 0.03156158, -3.081218, 1, 1, 1, 1, 1,
-0.5935407, -0.2343446, -1.388814, 1, 1, 1, 1, 1,
-0.5918325, 0.1474459, -1.518231, 1, 1, 1, 1, 1,
-0.5900034, 0.0593184, 0.1006516, 1, 1, 1, 1, 1,
-0.5895457, -2.221775, -2.31773, 1, 1, 1, 1, 1,
-0.5852864, -1.43621, -0.6004609, 0, 0, 1, 1, 1,
-0.5808919, 0.3043275, -1.918342, 1, 0, 0, 1, 1,
-0.5793377, 0.3246132, -1.618663, 1, 0, 0, 1, 1,
-0.5791549, -0.7390537, -3.823823, 1, 0, 0, 1, 1,
-0.577693, -0.1845067, -2.261234, 1, 0, 0, 1, 1,
-0.5753207, 0.2246948, -3.086117, 1, 0, 0, 1, 1,
-0.5655698, 0.4765335, 0.04071712, 0, 0, 0, 1, 1,
-0.5626384, -1.476312, -3.167387, 0, 0, 0, 1, 1,
-0.5552725, 0.9459232, 0.3327984, 0, 0, 0, 1, 1,
-0.5548875, 0.3458181, -1.627489, 0, 0, 0, 1, 1,
-0.5535694, -1.429731, -2.518507, 0, 0, 0, 1, 1,
-0.5527985, -0.3995599, -2.432152, 0, 0, 0, 1, 1,
-0.5521899, 0.9810753, 0.4449306, 0, 0, 0, 1, 1,
-0.5495068, 0.4207774, -1.42713, 1, 1, 1, 1, 1,
-0.5474769, -0.5399061, -1.07542, 1, 1, 1, 1, 1,
-0.5413465, -0.000524999, -3.320392, 1, 1, 1, 1, 1,
-0.532795, -1.123016, -2.86012, 1, 1, 1, 1, 1,
-0.5312439, -0.5681528, -5.446693, 1, 1, 1, 1, 1,
-0.5269123, -0.1166273, -2.823425, 1, 1, 1, 1, 1,
-0.5257624, -1.191947, -0.2836944, 1, 1, 1, 1, 1,
-0.5205795, 0.4953913, -2.781101, 1, 1, 1, 1, 1,
-0.5193248, -0.3837163, -0.4913689, 1, 1, 1, 1, 1,
-0.5133714, -1.896483, -4.290576, 1, 1, 1, 1, 1,
-0.5125745, -0.5992407, -2.158823, 1, 1, 1, 1, 1,
-0.5114264, -0.05133308, -0.7200607, 1, 1, 1, 1, 1,
-0.5113026, -0.2255982, -3.278578, 1, 1, 1, 1, 1,
-0.5094302, 0.1780309, -2.772153, 1, 1, 1, 1, 1,
-0.5067918, 0.1261881, -2.942391, 1, 1, 1, 1, 1,
-0.5039625, -0.734491, -3.664642, 0, 0, 1, 1, 1,
-0.5021505, 1.07225, -0.6142879, 1, 0, 0, 1, 1,
-0.4991509, -1.252521, -1.081147, 1, 0, 0, 1, 1,
-0.4984081, 2.351282, -0.3065847, 1, 0, 0, 1, 1,
-0.4969546, 0.4212276, -0.08680787, 1, 0, 0, 1, 1,
-0.4961971, 0.5490638, -1.808654, 1, 0, 0, 1, 1,
-0.4960854, -1.503879, -3.854679, 0, 0, 0, 1, 1,
-0.4959301, -0.8541132, -2.10551, 0, 0, 0, 1, 1,
-0.493288, 1.727611, 0.8687194, 0, 0, 0, 1, 1,
-0.4919455, 0.4347976, -0.7022519, 0, 0, 0, 1, 1,
-0.4896026, -0.4070292, -1.530946, 0, 0, 0, 1, 1,
-0.4817981, 0.1855187, -2.409317, 0, 0, 0, 1, 1,
-0.4760126, -1.550944, -2.360873, 0, 0, 0, 1, 1,
-0.4729877, 0.6286824, -1.27585, 1, 1, 1, 1, 1,
-0.4700913, 1.365363, 1.100651, 1, 1, 1, 1, 1,
-0.4620073, -0.8166124, -2.898684, 1, 1, 1, 1, 1,
-0.4545285, 0.5467184, -0.4818212, 1, 1, 1, 1, 1,
-0.4528038, 0.2852933, -0.7303222, 1, 1, 1, 1, 1,
-0.4521802, 3.010474, 0.7118998, 1, 1, 1, 1, 1,
-0.4471176, 0.3999106, -2.561954, 1, 1, 1, 1, 1,
-0.4467171, -2.240695, -1.257231, 1, 1, 1, 1, 1,
-0.4449778, 0.3005515, -0.8750076, 1, 1, 1, 1, 1,
-0.4447539, -0.03132264, -0.8925624, 1, 1, 1, 1, 1,
-0.4367861, 0.1632275, -0.9562852, 1, 1, 1, 1, 1,
-0.4308292, -1.813306, -1.933211, 1, 1, 1, 1, 1,
-0.4288459, 1.691816, -0.4361489, 1, 1, 1, 1, 1,
-0.423026, 0.1039809, -1.690695, 1, 1, 1, 1, 1,
-0.4226113, 0.6955149, -2.388353, 1, 1, 1, 1, 1,
-0.4225261, 0.9392735, -1.612969, 0, 0, 1, 1, 1,
-0.4216419, 0.5783041, 0.14285, 1, 0, 0, 1, 1,
-0.4169265, 0.2369775, -2.29017, 1, 0, 0, 1, 1,
-0.4140608, 0.3200945, -0.7752242, 1, 0, 0, 1, 1,
-0.4134134, 0.08980708, -1.397285, 1, 0, 0, 1, 1,
-0.4112002, 1.38939, -0.3311569, 1, 0, 0, 1, 1,
-0.4110981, -0.8416204, -3.212229, 0, 0, 0, 1, 1,
-0.4103211, 0.5163447, 0.06454045, 0, 0, 0, 1, 1,
-0.4096793, 0.9231898, -0.5575039, 0, 0, 0, 1, 1,
-0.4084242, -0.8897113, -3.400277, 0, 0, 0, 1, 1,
-0.405402, -1.178935, -3.76119, 0, 0, 0, 1, 1,
-0.4010888, -0.5282961, -1.157947, 0, 0, 0, 1, 1,
-0.3994735, 1.16324, -1.647872, 0, 0, 0, 1, 1,
-0.3980012, 2.44655, 0.4469702, 1, 1, 1, 1, 1,
-0.3893503, -0.5917456, -3.814575, 1, 1, 1, 1, 1,
-0.3782986, 0.03920201, -1.20923, 1, 1, 1, 1, 1,
-0.3645828, 0.5663903, -0.8342651, 1, 1, 1, 1, 1,
-0.3632683, -1.941405, -3.00211, 1, 1, 1, 1, 1,
-0.3570366, 0.6453756, -1.750651, 1, 1, 1, 1, 1,
-0.3480583, -1.594437, -3.315218, 1, 1, 1, 1, 1,
-0.3466655, -1.78713, -4.144467, 1, 1, 1, 1, 1,
-0.3457166, -1.626766, -4.263386, 1, 1, 1, 1, 1,
-0.334493, -2.063794, -1.8394, 1, 1, 1, 1, 1,
-0.3343515, 0.2001855, -1.526904, 1, 1, 1, 1, 1,
-0.3297251, 1.843686, -0.9776277, 1, 1, 1, 1, 1,
-0.3294891, -1.236751, -0.9345019, 1, 1, 1, 1, 1,
-0.3271109, 0.2287232, -0.2825238, 1, 1, 1, 1, 1,
-0.3179056, -0.42348, -1.512013, 1, 1, 1, 1, 1,
-0.3166409, 1.057047, -1.421586, 0, 0, 1, 1, 1,
-0.3152386, -0.8232821, -1.547014, 1, 0, 0, 1, 1,
-0.3092377, 0.9131927, -0.8741437, 1, 0, 0, 1, 1,
-0.3088438, -1.312259, -3.061961, 1, 0, 0, 1, 1,
-0.3077856, -1.585961, -1.950263, 1, 0, 0, 1, 1,
-0.3069172, -0.2228909, -1.166809, 1, 0, 0, 1, 1,
-0.3025921, -0.3263066, -2.316796, 0, 0, 0, 1, 1,
-0.300738, 0.1800991, -0.05649195, 0, 0, 0, 1, 1,
-0.2935567, 0.7744249, -0.2925782, 0, 0, 0, 1, 1,
-0.2889263, -1.222962, -0.9670169, 0, 0, 0, 1, 1,
-0.2867868, -0.1622183, -0.3195354, 0, 0, 0, 1, 1,
-0.2826822, -0.222401, -3.617984, 0, 0, 0, 1, 1,
-0.2809576, -0.2188279, -2.244593, 0, 0, 0, 1, 1,
-0.2804296, 0.5891874, -0.3469605, 1, 1, 1, 1, 1,
-0.2791033, 1.479742, 1.778711, 1, 1, 1, 1, 1,
-0.2722414, 1.460629, -0.8641599, 1, 1, 1, 1, 1,
-0.2717867, 1.004259, -0.2356747, 1, 1, 1, 1, 1,
-0.2709476, -0.2715068, -1.429624, 1, 1, 1, 1, 1,
-0.2674782, -0.6580656, -3.507752, 1, 1, 1, 1, 1,
-0.2668318, 0.06513699, -1.084232, 1, 1, 1, 1, 1,
-0.2633131, 0.08367025, -0.5463628, 1, 1, 1, 1, 1,
-0.2610879, 1.108762, -0.01943029, 1, 1, 1, 1, 1,
-0.2598377, 0.6050954, 1.029062, 1, 1, 1, 1, 1,
-0.2573913, 0.6442372, 0.9897247, 1, 1, 1, 1, 1,
-0.2547285, -1.499672, -3.748653, 1, 1, 1, 1, 1,
-0.2529814, -0.1827642, -1.271386, 1, 1, 1, 1, 1,
-0.2520232, -0.1489045, -0.2279835, 1, 1, 1, 1, 1,
-0.2511531, -1.588736, -2.221086, 1, 1, 1, 1, 1,
-0.2476907, 1.332217, 1.079696, 0, 0, 1, 1, 1,
-0.2461557, -0.6185389, -1.088878, 1, 0, 0, 1, 1,
-0.2461282, 2.145466, -0.6242417, 1, 0, 0, 1, 1,
-0.2414399, -1.394514, -3.047456, 1, 0, 0, 1, 1,
-0.2408613, -0.9264469, -4.208975, 1, 0, 0, 1, 1,
-0.2330224, -1.165199, -5.033573, 1, 0, 0, 1, 1,
-0.2308493, -0.002771363, -0.2398977, 0, 0, 0, 1, 1,
-0.2184035, 0.3089515, -0.5777545, 0, 0, 0, 1, 1,
-0.2141162, -1.574344, -2.798045, 0, 0, 0, 1, 1,
-0.2124231, -1.094379, -3.289507, 0, 0, 0, 1, 1,
-0.2097771, 0.597664, 0.3974959, 0, 0, 0, 1, 1,
-0.2064415, 0.8545934, 1.040546, 0, 0, 0, 1, 1,
-0.2053497, 1.234579, 0.6823691, 0, 0, 0, 1, 1,
-0.2052269, 0.9868792, -0.09781155, 1, 1, 1, 1, 1,
-0.2021555, 0.4421795, -1.105329, 1, 1, 1, 1, 1,
-0.200331, -0.05746484, -3.201218, 1, 1, 1, 1, 1,
-0.1995849, -0.7276329, -2.070739, 1, 1, 1, 1, 1,
-0.1972963, 0.8996326, -1.80165, 1, 1, 1, 1, 1,
-0.1946911, -0.312414, -2.341793, 1, 1, 1, 1, 1,
-0.1944041, -0.3194807, -2.613669, 1, 1, 1, 1, 1,
-0.1918798, 1.768391, -1.520187, 1, 1, 1, 1, 1,
-0.1866002, -0.3123326, -1.348742, 1, 1, 1, 1, 1,
-0.1843197, 1.871779, -0.1519963, 1, 1, 1, 1, 1,
-0.1843145, -0.3014206, -3.460564, 1, 1, 1, 1, 1,
-0.183704, 2.074709, 0.6191981, 1, 1, 1, 1, 1,
-0.1815993, -0.2835675, -1.435397, 1, 1, 1, 1, 1,
-0.176096, -0.5011531, -2.726617, 1, 1, 1, 1, 1,
-0.1753126, 1.484909, 1.268419, 1, 1, 1, 1, 1,
-0.1745329, 0.4462173, 0.09826892, 0, 0, 1, 1, 1,
-0.1741094, 1.383708, -1.419322, 1, 0, 0, 1, 1,
-0.1739408, 1.607389, 0.3836588, 1, 0, 0, 1, 1,
-0.1736652, 0.3422439, -0.4154288, 1, 0, 0, 1, 1,
-0.1710481, 0.1473947, -2.485791, 1, 0, 0, 1, 1,
-0.166251, -0.03093788, -2.274528, 1, 0, 0, 1, 1,
-0.165196, 0.2007481, -2.310602, 0, 0, 0, 1, 1,
-0.1602716, 0.3157303, -1.367348, 0, 0, 0, 1, 1,
-0.1597811, -1.8131, -3.793949, 0, 0, 0, 1, 1,
-0.1573412, 0.7048559, -2.634362, 0, 0, 0, 1, 1,
-0.1556514, 1.400943, -1.750548, 0, 0, 0, 1, 1,
-0.155281, 0.8403596, 0.4755484, 0, 0, 0, 1, 1,
-0.1520093, 0.2516389, -1.881734, 0, 0, 0, 1, 1,
-0.1511791, 0.09952123, -0.4020206, 1, 1, 1, 1, 1,
-0.1448665, 0.3111458, 0.3020554, 1, 1, 1, 1, 1,
-0.1445664, 1.608344, -0.7256937, 1, 1, 1, 1, 1,
-0.1390251, 0.07708032, -3.116971, 1, 1, 1, 1, 1,
-0.1376725, -1.586758, -3.095136, 1, 1, 1, 1, 1,
-0.131585, -1.186824, -2.936573, 1, 1, 1, 1, 1,
-0.1298683, 0.2446951, -1.723395, 1, 1, 1, 1, 1,
-0.1285674, -0.49277, -3.826222, 1, 1, 1, 1, 1,
-0.1284682, -1.398846, -2.531106, 1, 1, 1, 1, 1,
-0.1275849, -0.2625895, -4.473223, 1, 1, 1, 1, 1,
-0.1229146, -0.2822142, -2.706347, 1, 1, 1, 1, 1,
-0.1207401, 0.2801764, -2.470096, 1, 1, 1, 1, 1,
-0.118152, -1.199083, -4.063005, 1, 1, 1, 1, 1,
-0.1146735, 0.3243479, 1.160634, 1, 1, 1, 1, 1,
-0.1109574, -0.2792253, -3.802875, 1, 1, 1, 1, 1,
-0.1105379, 0.6920705, -0.4896277, 0, 0, 1, 1, 1,
-0.1094894, 0.9561238, -0.9449407, 1, 0, 0, 1, 1,
-0.1084117, 0.5917236, -1.178962, 1, 0, 0, 1, 1,
-0.1081171, -1.250276, -4.201632, 1, 0, 0, 1, 1,
-0.1019198, -0.02943527, -1.20845, 1, 0, 0, 1, 1,
-0.1018363, -2.063424, -3.488368, 1, 0, 0, 1, 1,
-0.09593962, -0.8244204, -5.338813, 0, 0, 0, 1, 1,
-0.0956855, 1.242964, -1.011559, 0, 0, 0, 1, 1,
-0.0945189, 0.3803735, -0.2370147, 0, 0, 0, 1, 1,
-0.09202363, -0.5643634, -2.132507, 0, 0, 0, 1, 1,
-0.0913142, -0.316635, -3.831923, 0, 0, 0, 1, 1,
-0.08779917, 0.989181, 0.9892051, 0, 0, 0, 1, 1,
-0.07849233, -0.2000903, -0.8235315, 0, 0, 0, 1, 1,
-0.07638108, 1.122362, 1.4306, 1, 1, 1, 1, 1,
-0.07473946, -0.2468782, -3.498974, 1, 1, 1, 1, 1,
-0.07350137, 1.176994, 0.1050411, 1, 1, 1, 1, 1,
-0.07183751, 0.3245989, -0.1356817, 1, 1, 1, 1, 1,
-0.0673204, 0.1382573, -1.025562, 1, 1, 1, 1, 1,
-0.06262103, 0.7989872, 0.3144445, 1, 1, 1, 1, 1,
-0.06139192, -0.5364097, -3.221995, 1, 1, 1, 1, 1,
-0.05576947, -0.521019, -3.184402, 1, 1, 1, 1, 1,
-0.0523356, 1.114675, 0.7524062, 1, 1, 1, 1, 1,
-0.05161919, 0.1058022, -1.02755, 1, 1, 1, 1, 1,
-0.05035688, 0.2563794, -2.907374, 1, 1, 1, 1, 1,
-0.04819151, -0.3240605, -2.559481, 1, 1, 1, 1, 1,
-0.04593084, 0.5436094, -0.09135249, 1, 1, 1, 1, 1,
-0.04541247, -0.3921733, -4.383362, 1, 1, 1, 1, 1,
-0.04064848, -0.2852229, -2.085877, 1, 1, 1, 1, 1,
-0.0352871, 0.01330669, -0.1837289, 0, 0, 1, 1, 1,
-0.02828584, -0.1746083, -3.534589, 1, 0, 0, 1, 1,
-0.02816052, 1.924834, -1.538222, 1, 0, 0, 1, 1,
-0.01996057, 1.656117, -0.05593542, 1, 0, 0, 1, 1,
-0.01935052, 0.7134149, 1.655321, 1, 0, 0, 1, 1,
-0.01351297, -0.8308343, -3.128226, 1, 0, 0, 1, 1,
-0.01347421, -1.052809, -1.730369, 0, 0, 0, 1, 1,
-0.00943875, 2.908856, 0.6715752, 0, 0, 0, 1, 1,
-0.007872517, -0.2307265, -3.847112, 0, 0, 0, 1, 1,
-0.006599206, -0.1252585, -2.958819, 0, 0, 0, 1, 1,
-0.004916918, -1.476434, -4.221485, 0, 0, 0, 1, 1,
-0.004143481, 1.446875, -1.34244, 0, 0, 0, 1, 1,
-0.003756826, 1.120844, 0.01823683, 0, 0, 0, 1, 1,
0.0006116118, -0.4652944, 2.552286, 1, 1, 1, 1, 1,
0.005944339, -0.9749548, 6.426862, 1, 1, 1, 1, 1,
0.01038133, 2.310529, -1.293824, 1, 1, 1, 1, 1,
0.01183124, -0.04948122, 1.15115, 1, 1, 1, 1, 1,
0.01443521, -0.772075, 3.975732, 1, 1, 1, 1, 1,
0.01504588, -1.141891, 1.673814, 1, 1, 1, 1, 1,
0.01725646, -0.2692258, 2.117392, 1, 1, 1, 1, 1,
0.01740246, 0.1019537, -0.206221, 1, 1, 1, 1, 1,
0.0179987, 0.04835981, -0.2142986, 1, 1, 1, 1, 1,
0.01954502, -0.2542019, 1.387678, 1, 1, 1, 1, 1,
0.02218963, 0.6440167, 0.8120862, 1, 1, 1, 1, 1,
0.02251652, 1.398732, 0.9762084, 1, 1, 1, 1, 1,
0.02770238, -0.8217254, 3.143651, 1, 1, 1, 1, 1,
0.03176021, -0.001946834, 1.124379, 1, 1, 1, 1, 1,
0.03245423, 1.073774, -2.179196, 1, 1, 1, 1, 1,
0.03319336, -0.2615457, 1.360487, 0, 0, 1, 1, 1,
0.03690229, 1.906088, 0.547424, 1, 0, 0, 1, 1,
0.0373963, -0.957792, 1.906071, 1, 0, 0, 1, 1,
0.04191022, -1.528877, 3.400568, 1, 0, 0, 1, 1,
0.04670865, -2.183817, 3.19049, 1, 0, 0, 1, 1,
0.04910378, -0.002048762, 2.900265, 1, 0, 0, 1, 1,
0.04917816, 0.3066604, 0.8253049, 0, 0, 0, 1, 1,
0.0495338, 0.1255828, 0.4535983, 0, 0, 0, 1, 1,
0.05203468, 2.024789, 0.7007925, 0, 0, 0, 1, 1,
0.05251106, 1.123827, 0.6621999, 0, 0, 0, 1, 1,
0.05848296, -1.496885, 4.268163, 0, 0, 0, 1, 1,
0.06054635, -0.2097109, 2.191469, 0, 0, 0, 1, 1,
0.06262941, 1.279406, -0.7127768, 0, 0, 0, 1, 1,
0.06416614, 0.4424919, -1.195657, 1, 1, 1, 1, 1,
0.06852679, -1.014748, 2.612394, 1, 1, 1, 1, 1,
0.07299181, -0.3790435, 4.363038, 1, 1, 1, 1, 1,
0.0746795, 0.42316, -0.7420624, 1, 1, 1, 1, 1,
0.07760962, 0.1439847, 1.214307, 1, 1, 1, 1, 1,
0.07767756, -0.5873677, 3.212307, 1, 1, 1, 1, 1,
0.07879589, -0.4827998, 3.412728, 1, 1, 1, 1, 1,
0.08120001, -0.6696076, 2.302822, 1, 1, 1, 1, 1,
0.08235538, -0.2485459, 3.829443, 1, 1, 1, 1, 1,
0.08706988, -0.4254485, 2.50607, 1, 1, 1, 1, 1,
0.08842885, -0.4051463, 0.9121433, 1, 1, 1, 1, 1,
0.09062041, -0.5362104, 2.161826, 1, 1, 1, 1, 1,
0.09201042, 0.3647589, 0.4693853, 1, 1, 1, 1, 1,
0.09211597, -0.2467936, 2.314373, 1, 1, 1, 1, 1,
0.09362556, -0.8809274, 3.564138, 1, 1, 1, 1, 1,
0.09895109, -0.6134938, 4.349679, 0, 0, 1, 1, 1,
0.1061264, -0.650694, 3.383503, 1, 0, 0, 1, 1,
0.1066194, 1.899325, -1.540681, 1, 0, 0, 1, 1,
0.1083241, 0.7694661, -0.7276742, 1, 0, 0, 1, 1,
0.1121301, -0.5937389, 3.534111, 1, 0, 0, 1, 1,
0.1142014, 0.7385615, 0.3958477, 1, 0, 0, 1, 1,
0.1155443, -1.92938, 2.978184, 0, 0, 0, 1, 1,
0.1176372, 1.828962, -1.011222, 0, 0, 0, 1, 1,
0.1200192, -0.6673342, 2.67288, 0, 0, 0, 1, 1,
0.1203897, 0.8674664, 0.2632856, 0, 0, 0, 1, 1,
0.1258645, -1.129148, 5.072962, 0, 0, 0, 1, 1,
0.1271794, -0.8441956, 4.469774, 0, 0, 0, 1, 1,
0.1299274, 0.1065937, 1.551175, 0, 0, 0, 1, 1,
0.1323349, 0.1379283, -0.1230273, 1, 1, 1, 1, 1,
0.1330358, 0.7000738, 2.08789, 1, 1, 1, 1, 1,
0.1345882, -0.2711796, 1.575878, 1, 1, 1, 1, 1,
0.1348901, 2.307176, 1.531825, 1, 1, 1, 1, 1,
0.1354046, 0.9285218, 0.6690106, 1, 1, 1, 1, 1,
0.1358071, -0.06012753, 2.748147, 1, 1, 1, 1, 1,
0.1362425, -1.243598, 3.017428, 1, 1, 1, 1, 1,
0.138375, -1.817847, 4.990654, 1, 1, 1, 1, 1,
0.1424325, 2.932396, -0.7061676, 1, 1, 1, 1, 1,
0.1482289, -1.970611, 1.888257, 1, 1, 1, 1, 1,
0.1483194, 1.05898, -0.9333296, 1, 1, 1, 1, 1,
0.1493355, -0.5625445, 2.834201, 1, 1, 1, 1, 1,
0.1507985, -0.6307369, 0.92575, 1, 1, 1, 1, 1,
0.1514276, -0.2697204, 2.495766, 1, 1, 1, 1, 1,
0.1560533, 1.256968, 0.5549824, 1, 1, 1, 1, 1,
0.1584338, -0.2866024, 3.854409, 0, 0, 1, 1, 1,
0.1606914, -0.01232339, -0.3563247, 1, 0, 0, 1, 1,
0.1663727, 0.9412727, 1.423774, 1, 0, 0, 1, 1,
0.1669783, -1.022951, 3.89924, 1, 0, 0, 1, 1,
0.1709804, -1.306273, 3.313268, 1, 0, 0, 1, 1,
0.1741905, -0.004222242, 0.8793685, 1, 0, 0, 1, 1,
0.1744625, -0.099142, 2.434202, 0, 0, 0, 1, 1,
0.1746528, -1.39358, 2.738175, 0, 0, 0, 1, 1,
0.176357, -1.271652, 3.584502, 0, 0, 0, 1, 1,
0.180452, 1.207451, -0.3928036, 0, 0, 0, 1, 1,
0.1813944, -0.188698, 2.060294, 0, 0, 0, 1, 1,
0.1826064, -0.08596589, 3.259827, 0, 0, 0, 1, 1,
0.1834519, 0.9869827, 0.887225, 0, 0, 0, 1, 1,
0.1874083, -0.7194719, 1.971749, 1, 1, 1, 1, 1,
0.1893984, 2.193583, -0.509549, 1, 1, 1, 1, 1,
0.1981632, -0.4882393, 2.548522, 1, 1, 1, 1, 1,
0.1987783, 1.771188, 1.277766, 1, 1, 1, 1, 1,
0.2015718, -0.7589335, 1.845489, 1, 1, 1, 1, 1,
0.2021762, -1.056493, 3.620012, 1, 1, 1, 1, 1,
0.2040919, -0.4963874, 1.713078, 1, 1, 1, 1, 1,
0.2058074, 1.843788, 0.669165, 1, 1, 1, 1, 1,
0.2087084, -0.3000583, 3.14652, 1, 1, 1, 1, 1,
0.2113622, 1.039651, 0.2809385, 1, 1, 1, 1, 1,
0.2113967, -1.038343, 2.568295, 1, 1, 1, 1, 1,
0.2150494, -1.468136, 4.09081, 1, 1, 1, 1, 1,
0.2154437, -2.004908, 2.671231, 1, 1, 1, 1, 1,
0.2176262, 0.8571059, -0.304597, 1, 1, 1, 1, 1,
0.2178156, 1.100281, -0.9454598, 1, 1, 1, 1, 1,
0.2178677, 0.1915752, 1.046046, 0, 0, 1, 1, 1,
0.2214583, 0.9878185, 1.254544, 1, 0, 0, 1, 1,
0.2216199, 0.8031338, -0.3089842, 1, 0, 0, 1, 1,
0.2237404, 0.01177246, 1.073171, 1, 0, 0, 1, 1,
0.2238754, -1.175095, 3.337121, 1, 0, 0, 1, 1,
0.225996, 0.8810574, -0.1739481, 1, 0, 0, 1, 1,
0.2270121, 0.804063, 0.7515903, 0, 0, 0, 1, 1,
0.2421563, 0.3202544, -0.3526647, 0, 0, 0, 1, 1,
0.2518179, -0.1170181, 0.4780532, 0, 0, 0, 1, 1,
0.2527579, -1.589141, 4.902337, 0, 0, 0, 1, 1,
0.25527, 0.687253, 0.7377521, 0, 0, 0, 1, 1,
0.2564509, -0.409724, 2.313514, 0, 0, 0, 1, 1,
0.2582768, -0.9245489, 2.081817, 0, 0, 0, 1, 1,
0.265407, 0.4850339, 0.6548486, 1, 1, 1, 1, 1,
0.2659211, 0.05635614, 1.893362, 1, 1, 1, 1, 1,
0.2663675, 0.8309106, 0.08597405, 1, 1, 1, 1, 1,
0.2694673, 0.07954725, 2.061722, 1, 1, 1, 1, 1,
0.2718774, 0.2842247, 1.19138, 1, 1, 1, 1, 1,
0.2726666, -0.1757714, 1.635665, 1, 1, 1, 1, 1,
0.2728211, -1.630549, 0.7441555, 1, 1, 1, 1, 1,
0.2744232, 0.4509553, 0.275853, 1, 1, 1, 1, 1,
0.2776593, -1.089947, 3.683227, 1, 1, 1, 1, 1,
0.2779622, -0.9369591, 1.800427, 1, 1, 1, 1, 1,
0.2779639, 0.06639592, -0.851623, 1, 1, 1, 1, 1,
0.2785118, 0.6617592, 1.436278, 1, 1, 1, 1, 1,
0.2787383, 0.1442471, 1.736951, 1, 1, 1, 1, 1,
0.2799949, 1.009362, 2.036135, 1, 1, 1, 1, 1,
0.2827795, -0.5598534, 3.504194, 1, 1, 1, 1, 1,
0.2828166, 0.7574437, -1.277935, 0, 0, 1, 1, 1,
0.2838475, 1.252552, 0.5695758, 1, 0, 0, 1, 1,
0.2842963, 0.3190514, 1.46572, 1, 0, 0, 1, 1,
0.2848397, 0.8389154, -0.3118938, 1, 0, 0, 1, 1,
0.2883988, 0.31891, 1.263897, 1, 0, 0, 1, 1,
0.2901504, 2.39099, -0.3089345, 1, 0, 0, 1, 1,
0.2943092, 3.826517, -1.126785, 0, 0, 0, 1, 1,
0.3003164, -0.3858806, 2.286401, 0, 0, 0, 1, 1,
0.3016444, -0.3593137, 0.9409903, 0, 0, 0, 1, 1,
0.3019565, -0.665349, 2.26612, 0, 0, 0, 1, 1,
0.3025781, -0.5879604, 2.1331, 0, 0, 0, 1, 1,
0.3038799, -1.036061, 1.933489, 0, 0, 0, 1, 1,
0.3050863, -1.412132, 3.700996, 0, 0, 0, 1, 1,
0.306094, -0.7540035, 3.802304, 1, 1, 1, 1, 1,
0.3064134, -0.05265633, 1.754494, 1, 1, 1, 1, 1,
0.3072214, -0.6425508, 3.313989, 1, 1, 1, 1, 1,
0.3079014, 0.7676595, 0.7298442, 1, 1, 1, 1, 1,
0.3188079, 0.2794456, -0.466739, 1, 1, 1, 1, 1,
0.3205433, -0.1517407, 2.477919, 1, 1, 1, 1, 1,
0.3234953, 0.3577712, -0.2158296, 1, 1, 1, 1, 1,
0.326921, -2.237476, 2.774216, 1, 1, 1, 1, 1,
0.3294386, 0.771744, 0.827228, 1, 1, 1, 1, 1,
0.3321046, 0.5635171, -0.9806126, 1, 1, 1, 1, 1,
0.333226, 1.182721, -0.5471942, 1, 1, 1, 1, 1,
0.3342537, 0.07699043, 0.704814, 1, 1, 1, 1, 1,
0.33612, 0.05255509, 1.998873, 1, 1, 1, 1, 1,
0.3412049, 0.1441908, 1.490458, 1, 1, 1, 1, 1,
0.3415413, 0.4137183, 1.079861, 1, 1, 1, 1, 1,
0.3445703, -0.314614, 0.5531885, 0, 0, 1, 1, 1,
0.3457311, 0.1052075, 1.679409, 1, 0, 0, 1, 1,
0.3474818, -0.5580754, 3.794508, 1, 0, 0, 1, 1,
0.3505445, 0.2555914, 2.012723, 1, 0, 0, 1, 1,
0.3548909, -0.2418465, 1.822563, 1, 0, 0, 1, 1,
0.3561186, 2.259603, 0.6959607, 1, 0, 0, 1, 1,
0.3592011, -0.4560375, 3.471789, 0, 0, 0, 1, 1,
0.3613427, 0.4574289, 1.185238, 0, 0, 0, 1, 1,
0.3613496, 0.1997391, 1.492931, 0, 0, 0, 1, 1,
0.3615089, 1.598805, 0.6810868, 0, 0, 0, 1, 1,
0.3623925, 0.7886463, 1.181972, 0, 0, 0, 1, 1,
0.3626694, -2.357429, 1.422634, 0, 0, 0, 1, 1,
0.366062, 1.133752, 0.6804513, 0, 0, 0, 1, 1,
0.3705793, -1.804496, 2.681232, 1, 1, 1, 1, 1,
0.3717986, 0.6833534, 0.7560906, 1, 1, 1, 1, 1,
0.3731242, -0.5738732, 3.152282, 1, 1, 1, 1, 1,
0.373641, 2.728673, -0.7299307, 1, 1, 1, 1, 1,
0.3793573, -0.8904444, 3.402163, 1, 1, 1, 1, 1,
0.3852541, -1.490275, 2.850251, 1, 1, 1, 1, 1,
0.3887926, -0.05141078, 0.293192, 1, 1, 1, 1, 1,
0.391786, 1.442513, 0.7875573, 1, 1, 1, 1, 1,
0.3945164, -0.7296795, 1.958388, 1, 1, 1, 1, 1,
0.3948506, 0.4249086, 2.023474, 1, 1, 1, 1, 1,
0.3953415, -1.203943, 4.048929, 1, 1, 1, 1, 1,
0.3980445, -0.6135073, 1.93343, 1, 1, 1, 1, 1,
0.3988076, 0.05583617, 1.36047, 1, 1, 1, 1, 1,
0.3989778, 0.05251182, 1.175766, 1, 1, 1, 1, 1,
0.3990765, 0.7950685, -0.1988217, 1, 1, 1, 1, 1,
0.4009761, 1.338434, 0.5956655, 0, 0, 1, 1, 1,
0.406237, -1.677399, 3.285568, 1, 0, 0, 1, 1,
0.4104682, -0.955773, 1.330897, 1, 0, 0, 1, 1,
0.4116318, 0.06497901, 1.836187, 1, 0, 0, 1, 1,
0.4128361, -1.093355, 3.505244, 1, 0, 0, 1, 1,
0.4129383, 1.36402, -1.639169, 1, 0, 0, 1, 1,
0.4193161, 0.06202108, 1.330088, 0, 0, 0, 1, 1,
0.419658, 0.1615136, 3.107324, 0, 0, 0, 1, 1,
0.4199262, -0.6841908, 2.230515, 0, 0, 0, 1, 1,
0.4215377, 2.34437, 0.3306515, 0, 0, 0, 1, 1,
0.4277475, -0.2395817, 3.47964, 0, 0, 0, 1, 1,
0.4296358, 0.6589354, 1.50777, 0, 0, 0, 1, 1,
0.4332044, 0.2392105, 0.1963445, 0, 0, 0, 1, 1,
0.4333576, 0.3426458, 1.94715, 1, 1, 1, 1, 1,
0.4338888, -0.9229466, 2.225685, 1, 1, 1, 1, 1,
0.4371617, 0.9621745, 0.1127506, 1, 1, 1, 1, 1,
0.4385165, -1.227788, 1.739828, 1, 1, 1, 1, 1,
0.4426384, 0.3095016, 0.7138413, 1, 1, 1, 1, 1,
0.442703, -0.0002215813, 1.110767, 1, 1, 1, 1, 1,
0.4462417, -0.1162097, 3.288876, 1, 1, 1, 1, 1,
0.4601554, 0.2971632, 0.1631913, 1, 1, 1, 1, 1,
0.4641255, 1.072389, -0.01886455, 1, 1, 1, 1, 1,
0.464756, 0.1191233, 3.529882, 1, 1, 1, 1, 1,
0.4671321, 2.59412, 0.5567672, 1, 1, 1, 1, 1,
0.4760475, -1.163888, 2.921283, 1, 1, 1, 1, 1,
0.4813507, -0.8782821, 4.865592, 1, 1, 1, 1, 1,
0.4818096, 1.626842, -0.580226, 1, 1, 1, 1, 1,
0.4906653, -1.620564, 2.566933, 1, 1, 1, 1, 1,
0.4956626, 0.8510821, 0.2329777, 0, 0, 1, 1, 1,
0.496717, -0.817427, 2.607052, 1, 0, 0, 1, 1,
0.4974824, -0.652582, 3.559405, 1, 0, 0, 1, 1,
0.5020851, 0.1182637, 1.41351, 1, 0, 0, 1, 1,
0.5030156, 0.1770497, 2.081865, 1, 0, 0, 1, 1,
0.5046016, -1.074856, 1.742786, 1, 0, 0, 1, 1,
0.505502, -0.5410624, 2.112446, 0, 0, 0, 1, 1,
0.5061508, -0.8738037, 1.96595, 0, 0, 0, 1, 1,
0.5077232, 1.737135, 1.218606, 0, 0, 0, 1, 1,
0.5116144, 0.4343068, -1.797423, 0, 0, 0, 1, 1,
0.5120745, -1.397212, 2.270451, 0, 0, 0, 1, 1,
0.5250493, -1.648699, 4.576048, 0, 0, 0, 1, 1,
0.5266087, -0.001948565, 2.233383, 0, 0, 0, 1, 1,
0.5280083, 0.1555982, 1.683901, 1, 1, 1, 1, 1,
0.5328813, -0.07677063, 1.517773, 1, 1, 1, 1, 1,
0.5424303, -0.2453036, 2.735395, 1, 1, 1, 1, 1,
0.5452259, -0.4734418, -1.170828, 1, 1, 1, 1, 1,
0.5472353, -0.1621151, 1.684039, 1, 1, 1, 1, 1,
0.5591511, 1.32366, -1.520648, 1, 1, 1, 1, 1,
0.5651659, -0.4383357, 2.102717, 1, 1, 1, 1, 1,
0.5745116, -0.1568521, 2.962825, 1, 1, 1, 1, 1,
0.5802538, 0.5392656, 0.8601301, 1, 1, 1, 1, 1,
0.5912547, -1.024905, 3.363445, 1, 1, 1, 1, 1,
0.5926193, -0.9443064, 1.332868, 1, 1, 1, 1, 1,
0.5990373, -1.107719, 3.41439, 1, 1, 1, 1, 1,
0.6021066, 0.2546987, 1.840642, 1, 1, 1, 1, 1,
0.6026602, 0.4168463, 1.904536, 1, 1, 1, 1, 1,
0.6044673, 1.395485, 1.729234, 1, 1, 1, 1, 1,
0.6124722, 0.4853752, 1.301376, 0, 0, 1, 1, 1,
0.6150617, -1.272715, 2.221874, 1, 0, 0, 1, 1,
0.6160071, -0.9244541, 2.619466, 1, 0, 0, 1, 1,
0.6161391, 0.9553127, 2.729454, 1, 0, 0, 1, 1,
0.6195896, -0.70652, 2.14955, 1, 0, 0, 1, 1,
0.6224262, -0.01564735, 3.470848, 1, 0, 0, 1, 1,
0.6235108, -0.3248286, 2.083007, 0, 0, 0, 1, 1,
0.625033, -0.3824921, 3.866269, 0, 0, 0, 1, 1,
0.6251023, 0.2635042, 1.958041, 0, 0, 0, 1, 1,
0.6260256, -0.2502341, 2.801844, 0, 0, 0, 1, 1,
0.6283077, 0.1650759, 0.2549349, 0, 0, 0, 1, 1,
0.6356514, 0.3140754, 1.856119, 0, 0, 0, 1, 1,
0.6366444, -1.275992, 2.434554, 0, 0, 0, 1, 1,
0.6406484, 0.3085732, 0.1994031, 1, 1, 1, 1, 1,
0.6414373, -1.225272, 3.376415, 1, 1, 1, 1, 1,
0.6463546, -0.7529488, 4.099291, 1, 1, 1, 1, 1,
0.6474162, -0.3395114, 2.488027, 1, 1, 1, 1, 1,
0.654691, 1.184415, 0.6298186, 1, 1, 1, 1, 1,
0.6652504, 0.3018546, 3.012614, 1, 1, 1, 1, 1,
0.6666363, 0.4793894, 0.1338657, 1, 1, 1, 1, 1,
0.6694317, 0.191265, 2.207114, 1, 1, 1, 1, 1,
0.6725572, 0.2948419, 2.635001, 1, 1, 1, 1, 1,
0.6743544, 0.1985926, 0.9362935, 1, 1, 1, 1, 1,
0.6819001, 0.3223054, 0.4047395, 1, 1, 1, 1, 1,
0.6822629, -0.0642923, 1.979795, 1, 1, 1, 1, 1,
0.6887507, -0.6381066, 3.697252, 1, 1, 1, 1, 1,
0.6889098, 0.5855407, 0.5723766, 1, 1, 1, 1, 1,
0.690192, 0.9321086, 1.185414, 1, 1, 1, 1, 1,
0.6923003, -0.6889119, 2.100448, 0, 0, 1, 1, 1,
0.6934704, 1.713263, 0.4617295, 1, 0, 0, 1, 1,
0.6937758, 1.983723, -0.06753219, 1, 0, 0, 1, 1,
0.6952268, -0.3318571, 2.127102, 1, 0, 0, 1, 1,
0.7019557, -0.6455308, 3.970411, 1, 0, 0, 1, 1,
0.7058497, -0.3656966, 1.304822, 1, 0, 0, 1, 1,
0.7071053, 0.5213168, 1.64948, 0, 0, 0, 1, 1,
0.713744, 0.1187192, 1.527048, 0, 0, 0, 1, 1,
0.7143455, -0.08958818, 1.030773, 0, 0, 0, 1, 1,
0.7155424, 0.3476431, 2.524405, 0, 0, 0, 1, 1,
0.7242056, -1.99877, 1.927024, 0, 0, 0, 1, 1,
0.7326601, 0.5771071, 2.003997, 0, 0, 0, 1, 1,
0.7485018, -0.5035167, 1.353724, 0, 0, 0, 1, 1,
0.7486439, 0.3498473, 3.230358, 1, 1, 1, 1, 1,
0.7525991, 0.9319858, -0.3394824, 1, 1, 1, 1, 1,
0.7624897, 1.364971, -0.4760481, 1, 1, 1, 1, 1,
0.763088, 0.6711544, -0.5034658, 1, 1, 1, 1, 1,
0.7658033, -1.342346, 2.495628, 1, 1, 1, 1, 1,
0.7872287, -1.793231, 2.755548, 1, 1, 1, 1, 1,
0.7892883, -0.6641004, 1.798421, 1, 1, 1, 1, 1,
0.7900196, -1.290372, 2.695383, 1, 1, 1, 1, 1,
0.7901505, 0.770622, -0.01978319, 1, 1, 1, 1, 1,
0.7905758, 0.3864267, 0.6736809, 1, 1, 1, 1, 1,
0.7944512, -1.138122, 1.903597, 1, 1, 1, 1, 1,
0.7947935, -1.258334, 2.636763, 1, 1, 1, 1, 1,
0.796198, -1.322409, 0.4208947, 1, 1, 1, 1, 1,
0.8065871, 0.381004, 1.910453, 1, 1, 1, 1, 1,
0.8085059, -0.3607349, 0.4628992, 1, 1, 1, 1, 1,
0.8130429, -1.195505, 1.939174, 0, 0, 1, 1, 1,
0.8176103, -1.670671, 2.72103, 1, 0, 0, 1, 1,
0.8176731, 1.589275, -1.212348, 1, 0, 0, 1, 1,
0.8192887, 1.300201, 0.7115197, 1, 0, 0, 1, 1,
0.8236107, 0.5814044, 0.6204515, 1, 0, 0, 1, 1,
0.8278465, 1.312461, -0.7639642, 1, 0, 0, 1, 1,
0.8337522, 0.250453, 2.833614, 0, 0, 0, 1, 1,
0.8347182, -0.119127, 1.223184, 0, 0, 0, 1, 1,
0.8430515, -0.8072613, 2.861869, 0, 0, 0, 1, 1,
0.8439958, -0.4468285, 0.09332955, 0, 0, 0, 1, 1,
0.8470376, -0.841228, 1.791037, 0, 0, 0, 1, 1,
0.847807, 0.5752572, 0.09918176, 0, 0, 0, 1, 1,
0.8583305, -0.05012067, 2.324146, 0, 0, 0, 1, 1,
0.8589132, 0.3015791, 1.395324, 1, 1, 1, 1, 1,
0.8634098, -2.744031, 1.496167, 1, 1, 1, 1, 1,
0.8642952, -0.1382934, 1.623338, 1, 1, 1, 1, 1,
0.8660369, -0.2103381, 0.5923476, 1, 1, 1, 1, 1,
0.8724882, 0.3788094, 1.068646, 1, 1, 1, 1, 1,
0.8731089, 0.4622609, -0.3849945, 1, 1, 1, 1, 1,
0.8806664, 1.170975, 0.6805627, 1, 1, 1, 1, 1,
0.885761, -0.5870075, 0.9007893, 1, 1, 1, 1, 1,
0.8905777, -0.1934772, 1.26622, 1, 1, 1, 1, 1,
0.893182, -0.02069805, 2.592106, 1, 1, 1, 1, 1,
0.8954772, -0.01141845, 1.924495, 1, 1, 1, 1, 1,
0.9019024, 1.845598, -1.443452, 1, 1, 1, 1, 1,
0.902959, 1.36254, 2.532436, 1, 1, 1, 1, 1,
0.9052779, -0.3330808, 0.9864191, 1, 1, 1, 1, 1,
0.9057189, 0.5528064, 0.6186997, 1, 1, 1, 1, 1,
0.926316, -0.2556719, 3.50605, 0, 0, 1, 1, 1,
0.9312633, -1.163888, 1.877419, 1, 0, 0, 1, 1,
0.9350016, 0.2868076, 1.344388, 1, 0, 0, 1, 1,
0.9391999, -0.2777246, 2.115676, 1, 0, 0, 1, 1,
0.9439804, 0.7238788, 1.677866, 1, 0, 0, 1, 1,
0.9451904, -0.5860521, 2.40832, 1, 0, 0, 1, 1,
0.9517568, -0.09248104, 1.946215, 0, 0, 0, 1, 1,
0.9558092, 1.099423, 0.0971211, 0, 0, 0, 1, 1,
0.9578314, 0.03510547, 4.444636, 0, 0, 0, 1, 1,
0.9601641, 0.2997768, 2.417112, 0, 0, 0, 1, 1,
0.9634737, 0.01289636, 3.109824, 0, 0, 0, 1, 1,
0.9644821, -0.8380296, 0.9052607, 0, 0, 0, 1, 1,
0.9653722, 0.7846979, 2.062496, 0, 0, 0, 1, 1,
0.9663615, 0.7050185, 1.548513, 1, 1, 1, 1, 1,
0.9687371, 0.8964798, 1.119654, 1, 1, 1, 1, 1,
0.9725381, -1.829796, 4.344546, 1, 1, 1, 1, 1,
0.9748642, 1.462688, -1.039806, 1, 1, 1, 1, 1,
0.9779801, 1.721927, 0.1073014, 1, 1, 1, 1, 1,
0.9831462, -0.02041878, 1.455274, 1, 1, 1, 1, 1,
0.9843616, 0.2333362, 2.989859, 1, 1, 1, 1, 1,
0.9849693, 0.8480973, 1.638565, 1, 1, 1, 1, 1,
0.9861575, 0.4059665, -0.169094, 1, 1, 1, 1, 1,
0.9914514, -1.720676, 3.991122, 1, 1, 1, 1, 1,
0.9931729, -0.07681691, 1.818124, 1, 1, 1, 1, 1,
0.9944768, 1.028829, -0.1723241, 1, 1, 1, 1, 1,
1.00042, 1.815391, 1.139719, 1, 1, 1, 1, 1,
1.000999, -0.2467351, 4.126488, 1, 1, 1, 1, 1,
1.012464, -0.7709777, 2.285816, 1, 1, 1, 1, 1,
1.014189, 0.2010702, 3.426965, 0, 0, 1, 1, 1,
1.016332, -1.506783, 0.3443294, 1, 0, 0, 1, 1,
1.021649, -0.07568717, 0.8270761, 1, 0, 0, 1, 1,
1.023453, -0.2810595, -0.4363277, 1, 0, 0, 1, 1,
1.023771, 1.758796, 0.8382046, 1, 0, 0, 1, 1,
1.025824, 0.005355914, 0.07716738, 1, 0, 0, 1, 1,
1.026843, -0.7431724, 3.162734, 0, 0, 0, 1, 1,
1.029099, 0.4755048, 1.768961, 0, 0, 0, 1, 1,
1.030415, 0.4105326, 1.535379, 0, 0, 0, 1, 1,
1.031132, -0.7811927, 3.074404, 0, 0, 0, 1, 1,
1.031544, -0.05040653, 2.344168, 0, 0, 0, 1, 1,
1.036391, 0.04666464, 3.544434, 0, 0, 0, 1, 1,
1.041239, -0.6876645, 2.243103, 0, 0, 0, 1, 1,
1.041736, 0.4178486, 2.182007, 1, 1, 1, 1, 1,
1.046299, -1.421084, 4.163081, 1, 1, 1, 1, 1,
1.053329, 1.080036, 0.5409893, 1, 1, 1, 1, 1,
1.061499, -0.9755391, 2.532363, 1, 1, 1, 1, 1,
1.071858, 0.6422872, 1.071094, 1, 1, 1, 1, 1,
1.076148, 0.2680118, 2.758653, 1, 1, 1, 1, 1,
1.08004, 1.354894, -0.1575034, 1, 1, 1, 1, 1,
1.085867, 0.6318459, 0.5808359, 1, 1, 1, 1, 1,
1.085917, 0.5451202, -0.01030341, 1, 1, 1, 1, 1,
1.091071, -1.238844, 3.470257, 1, 1, 1, 1, 1,
1.103122, 0.1673636, 0.5185788, 1, 1, 1, 1, 1,
1.105651, 1.610215, -0.1865795, 1, 1, 1, 1, 1,
1.107471, 1.093983, 0.5618559, 1, 1, 1, 1, 1,
1.108929, -1.106868, 2.886799, 1, 1, 1, 1, 1,
1.114909, -0.2164514, 3.582978, 1, 1, 1, 1, 1,
1.115075, -1.001635, 1.148945, 0, 0, 1, 1, 1,
1.116695, 0.4556478, 1.972504, 1, 0, 0, 1, 1,
1.126813, 0.2849064, 1.358376, 1, 0, 0, 1, 1,
1.134281, -0.05059183, 1.226005, 1, 0, 0, 1, 1,
1.147644, 0.07842833, 1.676602, 1, 0, 0, 1, 1,
1.152645, 0.4947594, 0.2237706, 1, 0, 0, 1, 1,
1.1571, 0.6887779, 0.7063301, 0, 0, 0, 1, 1,
1.159364, -1.258726, 1.669706, 0, 0, 0, 1, 1,
1.166468, -0.7109094, 1.553663, 0, 0, 0, 1, 1,
1.173239, -0.4123406, 2.805509, 0, 0, 0, 1, 1,
1.175178, 0.07204293, 1.060017, 0, 0, 0, 1, 1,
1.177501, -0.168876, 0.8250603, 0, 0, 0, 1, 1,
1.184397, 1.437231, 0.5749815, 0, 0, 0, 1, 1,
1.191237, 0.9946005, 2.596756, 1, 1, 1, 1, 1,
1.194213, 0.7237184, 0.2755727, 1, 1, 1, 1, 1,
1.212851, 0.02888731, 0.7290447, 1, 1, 1, 1, 1,
1.215139, 0.4414096, 0.2308445, 1, 1, 1, 1, 1,
1.216842, -2.48378, 2.023934, 1, 1, 1, 1, 1,
1.222941, -0.7626644, 2.365545, 1, 1, 1, 1, 1,
1.225542, 0.1809791, 2.413827, 1, 1, 1, 1, 1,
1.230168, -0.1180469, 2.108286, 1, 1, 1, 1, 1,
1.237684, -0.6270334, 2.218985, 1, 1, 1, 1, 1,
1.25512, 0.9847472, 0.1001733, 1, 1, 1, 1, 1,
1.26023, 0.3551209, -0.00745693, 1, 1, 1, 1, 1,
1.263888, 0.3530147, 2.193006, 1, 1, 1, 1, 1,
1.274154, -0.604516, 1.554853, 1, 1, 1, 1, 1,
1.275014, -0.5816206, 3.147951, 1, 1, 1, 1, 1,
1.27835, 0.05193403, 1.923374, 1, 1, 1, 1, 1,
1.283781, -0.3308668, 2.585983, 0, 0, 1, 1, 1,
1.284344, -1.423873, 1.986659, 1, 0, 0, 1, 1,
1.312079, 0.9384779, 0.363187, 1, 0, 0, 1, 1,
1.318722, -0.3123268, 0.2701821, 1, 0, 0, 1, 1,
1.324484, 1.006735, 1.479419, 1, 0, 0, 1, 1,
1.331679, -0.2727814, -0.9678254, 1, 0, 0, 1, 1,
1.336703, 0.9622253, 2.578438, 0, 0, 0, 1, 1,
1.337346, 0.4005428, 0.826212, 0, 0, 0, 1, 1,
1.341733, -0.6831425, 0.4631108, 0, 0, 0, 1, 1,
1.342181, -0.3256805, 1.942301, 0, 0, 0, 1, 1,
1.347995, -0.4307719, 1.097169, 0, 0, 0, 1, 1,
1.348441, 0.7463349, 1.842616, 0, 0, 0, 1, 1,
1.356109, -0.4119322, 2.332819, 0, 0, 0, 1, 1,
1.378738, -0.3336131, 2.121851, 1, 1, 1, 1, 1,
1.389735, 0.2378758, 1.558164, 1, 1, 1, 1, 1,
1.391739, -1.829291, 2.73757, 1, 1, 1, 1, 1,
1.392206, -0.06770081, 2.773732, 1, 1, 1, 1, 1,
1.392644, -0.8030689, 1.972258, 1, 1, 1, 1, 1,
1.394218, -0.9482548, 2.535137, 1, 1, 1, 1, 1,
1.396874, -0.7554516, 3.952075, 1, 1, 1, 1, 1,
1.399303, 1.438265, -0.1798641, 1, 1, 1, 1, 1,
1.401227, -1.285105, 3.215614, 1, 1, 1, 1, 1,
1.424852, 1.463707, 1.350454, 1, 1, 1, 1, 1,
1.431241, -0.4719873, 1.650907, 1, 1, 1, 1, 1,
1.431824, -0.05633619, 0.9574809, 1, 1, 1, 1, 1,
1.432334, 0.6243137, 2.061584, 1, 1, 1, 1, 1,
1.433458, 2.044464, 1.725304, 1, 1, 1, 1, 1,
1.436903, -0.6437924, 1.718781, 1, 1, 1, 1, 1,
1.442571, -1.052557, 2.682426, 0, 0, 1, 1, 1,
1.447401, -0.2961418, 1.180382, 1, 0, 0, 1, 1,
1.455625, 1.723267, -0.7213624, 1, 0, 0, 1, 1,
1.455833, -0.9793163, 1.803435, 1, 0, 0, 1, 1,
1.458474, 2.189305, -0.6071939, 1, 0, 0, 1, 1,
1.470045, 0.3096167, 1.578448, 1, 0, 0, 1, 1,
1.477982, -0.566112, 1.617968, 0, 0, 0, 1, 1,
1.481321, -1.647967, 3.003258, 0, 0, 0, 1, 1,
1.48535, -1.225629, 4.134978, 0, 0, 0, 1, 1,
1.496016, -1.708333, 2.077806, 0, 0, 0, 1, 1,
1.498218, 0.2045767, 1.718811, 0, 0, 0, 1, 1,
1.504516, 1.259501, 0.5355973, 0, 0, 0, 1, 1,
1.506279, 1.289282, 2.435695, 0, 0, 0, 1, 1,
1.521997, 1.377436, -0.3433048, 1, 1, 1, 1, 1,
1.529314, -0.8994472, 1.909038, 1, 1, 1, 1, 1,
1.532887, -0.6572695, 2.231465, 1, 1, 1, 1, 1,
1.545731, -0.07586887, 2.970335, 1, 1, 1, 1, 1,
1.547653, -0.2588668, 2.341686, 1, 1, 1, 1, 1,
1.552674, 0.9778225, 1.799019, 1, 1, 1, 1, 1,
1.55721, 1.244092, -1.217381, 1, 1, 1, 1, 1,
1.562569, -0.9206135, 2.856779, 1, 1, 1, 1, 1,
1.563681, -0.3072972, 1.169297, 1, 1, 1, 1, 1,
1.566572, 0.05863276, 0.2686481, 1, 1, 1, 1, 1,
1.566775, -0.5022059, 1.79971, 1, 1, 1, 1, 1,
1.569121, -0.5004165, 2.625049, 1, 1, 1, 1, 1,
1.585861, -0.1532883, 0.9968199, 1, 1, 1, 1, 1,
1.593158, -0.5591271, 3.278975, 1, 1, 1, 1, 1,
1.594466, -1.002002, 3.218465, 1, 1, 1, 1, 1,
1.613006, -0.6979553, 0.6089798, 0, 0, 1, 1, 1,
1.617024, 1.530646, 2.29002, 1, 0, 0, 1, 1,
1.638842, -0.4618694, 1.078507, 1, 0, 0, 1, 1,
1.663752, -0.7059636, 3.209689, 1, 0, 0, 1, 1,
1.66417, -1.508454, 3.40684, 1, 0, 0, 1, 1,
1.667031, 0.8387511, 0.3402227, 1, 0, 0, 1, 1,
1.669207, 1.312431, -0.3068717, 0, 0, 0, 1, 1,
1.683097, -0.07044882, 3.00058, 0, 0, 0, 1, 1,
1.691607, -0.3746317, 0.6062684, 0, 0, 0, 1, 1,
1.692695, 2.158659, 0.4240394, 0, 0, 0, 1, 1,
1.699468, -1.051692, 3.579303, 0, 0, 0, 1, 1,
1.714673, -0.5693381, 0.09547576, 0, 0, 0, 1, 1,
1.71533, -1.969445, 1.013725, 0, 0, 0, 1, 1,
1.759166, -1.221971, 3.778507, 1, 1, 1, 1, 1,
1.760079, 0.107472, 4.263855, 1, 1, 1, 1, 1,
1.832074, -0.9881799, 3.102536, 1, 1, 1, 1, 1,
1.832976, 0.05299185, 2.846957, 1, 1, 1, 1, 1,
1.85199, 1.42975, 0.4611965, 1, 1, 1, 1, 1,
1.862339, -0.2358818, 1.441493, 1, 1, 1, 1, 1,
1.869791, 0.807064, 2.178754, 1, 1, 1, 1, 1,
1.894212, 0.3874213, 0.5573228, 1, 1, 1, 1, 1,
1.89859, -0.03119976, 2.122459, 1, 1, 1, 1, 1,
1.900458, -0.05843907, 0.3872523, 1, 1, 1, 1, 1,
1.901467, -0.8015029, 2.840354, 1, 1, 1, 1, 1,
1.932783, -0.5598157, 3.491655, 1, 1, 1, 1, 1,
1.936423, 0.2587176, 1.181689, 1, 1, 1, 1, 1,
2.003095, 0.2806297, 0.9608439, 1, 1, 1, 1, 1,
2.034733, -0.1888877, 1.060838, 1, 1, 1, 1, 1,
2.044987, 0.6970478, 0.7484025, 0, 0, 1, 1, 1,
2.090403, -0.2357659, 1.804234, 1, 0, 0, 1, 1,
2.105781, -0.4720978, 1.606298, 1, 0, 0, 1, 1,
2.108346, 0.8482109, 0.4352664, 1, 0, 0, 1, 1,
2.123035, -1.17735, 3.372562, 1, 0, 0, 1, 1,
2.126967, 1.637956, -1.254117, 1, 0, 0, 1, 1,
2.133664, 0.1598407, 0.9754528, 0, 0, 0, 1, 1,
2.150747, -0.3396158, 1.862329, 0, 0, 0, 1, 1,
2.16663, -0.380635, 3.204738, 0, 0, 0, 1, 1,
2.214724, 1.256755, 0.3957372, 0, 0, 0, 1, 1,
2.27312, -2.079781, 2.088433, 0, 0, 0, 1, 1,
2.2758, -0.4550994, -0.3147234, 0, 0, 0, 1, 1,
2.347778, -0.6312298, 2.057981, 0, 0, 0, 1, 1,
2.445394, -0.4955237, -0.6245154, 1, 1, 1, 1, 1,
2.459043, 0.5375918, 3.099976, 1, 1, 1, 1, 1,
2.58684, -0.4633764, 0.2927579, 1, 1, 1, 1, 1,
2.640367, 2.751991, 0.5974449, 1, 1, 1, 1, 1,
2.705028, 0.1679267, 3.160404, 1, 1, 1, 1, 1,
2.71249, -0.5400782, 1.874068, 1, 1, 1, 1, 1,
2.844725, 1.915978, 1.245708, 1, 1, 1, 1, 1
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
var radius = 10.08987;
var distance = 35.44024;
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
mvMatrix.translate( 0.1735041, -0.368747, -0.4900844 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.44024);
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
