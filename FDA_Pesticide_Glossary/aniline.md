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
-2.886455, 0.06455023, -3.078531, 1, 0, 0, 1,
-2.880016, 1.698422, -0.9879974, 1, 0.007843138, 0, 1,
-2.422529, -0.5653715, -1.378056, 1, 0.01176471, 0, 1,
-2.39179, 1.171433, -0.03017018, 1, 0.01960784, 0, 1,
-2.38209, 1.224023, -0.9567422, 1, 0.02352941, 0, 1,
-2.353849, -0.8441779, -2.732358, 1, 0.03137255, 0, 1,
-2.345455, -0.1288579, -2.934812, 1, 0.03529412, 0, 1,
-2.311622, -0.5787956, -2.947064, 1, 0.04313726, 0, 1,
-2.285737, -1.025787, -0.697467, 1, 0.04705882, 0, 1,
-2.21995, -1.111543, -1.575634, 1, 0.05490196, 0, 1,
-2.169998, 1.255993, -1.948878, 1, 0.05882353, 0, 1,
-2.126368, 1.607551, -2.220365, 1, 0.06666667, 0, 1,
-2.114842, -1.545437, -1.907444, 1, 0.07058824, 0, 1,
-2.107433, -0.7395192, -2.919551, 1, 0.07843138, 0, 1,
-2.079633, 0.4975852, -1.500102, 1, 0.08235294, 0, 1,
-2.070896, -0.03614458, -2.400511, 1, 0.09019608, 0, 1,
-2.00975, 0.2648537, -0.7101275, 1, 0.09411765, 0, 1,
-2.005473, -1.51899, -2.196695, 1, 0.1019608, 0, 1,
-1.996355, 1.931144, -1.195183, 1, 0.1098039, 0, 1,
-1.972228, -0.2216345, -1.623463, 1, 0.1137255, 0, 1,
-1.948021, 1.184677, -1.19752, 1, 0.1215686, 0, 1,
-1.936489, -0.2321235, -2.402831, 1, 0.1254902, 0, 1,
-1.916491, 0.1681464, -2.206351, 1, 0.1333333, 0, 1,
-1.902139, 0.5454337, -1.95601, 1, 0.1372549, 0, 1,
-1.893878, 0.1012041, -1.19502, 1, 0.145098, 0, 1,
-1.886151, -0.7315511, -2.269245, 1, 0.1490196, 0, 1,
-1.885622, 0.04212509, -2.329056, 1, 0.1568628, 0, 1,
-1.861365, 0.7548629, -0.8272867, 1, 0.1607843, 0, 1,
-1.843607, 0.1033666, -0.1220071, 1, 0.1686275, 0, 1,
-1.828548, -1.230722, -0.7825505, 1, 0.172549, 0, 1,
-1.810639, 0.6632906, -2.067618, 1, 0.1803922, 0, 1,
-1.795032, -0.7199332, -2.188991, 1, 0.1843137, 0, 1,
-1.791472, -1.948343, -2.2226, 1, 0.1921569, 0, 1,
-1.753063, -0.6294534, -2.230304, 1, 0.1960784, 0, 1,
-1.751508, -1.302318, -2.019507, 1, 0.2039216, 0, 1,
-1.748411, 0.5125135, -0.7340158, 1, 0.2117647, 0, 1,
-1.748026, -1.757706, -2.272221, 1, 0.2156863, 0, 1,
-1.731162, -2.471303, -2.027665, 1, 0.2235294, 0, 1,
-1.726949, 0.1594514, -0.7693415, 1, 0.227451, 0, 1,
-1.724041, 0.2734243, -2.011117, 1, 0.2352941, 0, 1,
-1.720731, 0.834563, -1.341986, 1, 0.2392157, 0, 1,
-1.707608, -1.16411, -0.430734, 1, 0.2470588, 0, 1,
-1.698605, 2.123729, 0.1036353, 1, 0.2509804, 0, 1,
-1.684883, 0.981863, -1.666699, 1, 0.2588235, 0, 1,
-1.67667, 0.6459924, -0.3871423, 1, 0.2627451, 0, 1,
-1.675808, 0.4997862, -1.904813, 1, 0.2705882, 0, 1,
-1.667285, 1.055198, -0.03456527, 1, 0.2745098, 0, 1,
-1.654137, 0.2303488, -1.403866, 1, 0.282353, 0, 1,
-1.643681, 0.8649371, -1.381441, 1, 0.2862745, 0, 1,
-1.639359, 0.8871001, -1.961524, 1, 0.2941177, 0, 1,
-1.635323, 1.021093, -0.6757626, 1, 0.3019608, 0, 1,
-1.632073, -1.106218, -1.581436, 1, 0.3058824, 0, 1,
-1.622082, 1.080869, -1.639556, 1, 0.3137255, 0, 1,
-1.619463, -0.6661837, -1.237834, 1, 0.3176471, 0, 1,
-1.607314, 1.56972, -2.14554, 1, 0.3254902, 0, 1,
-1.600303, -0.4546375, 0.2823616, 1, 0.3294118, 0, 1,
-1.596601, 1.819292, -2.665399, 1, 0.3372549, 0, 1,
-1.593147, -0.4736449, -2.360051, 1, 0.3411765, 0, 1,
-1.587403, -0.7532699, -2.285462, 1, 0.3490196, 0, 1,
-1.568633, -0.3399929, -2.01669, 1, 0.3529412, 0, 1,
-1.5618, -0.9077277, -3.120723, 1, 0.3607843, 0, 1,
-1.560611, -0.2756723, -1.579785, 1, 0.3647059, 0, 1,
-1.553449, -0.629186, -3.453429, 1, 0.372549, 0, 1,
-1.539919, 0.9654726, -1.186898, 1, 0.3764706, 0, 1,
-1.533723, 1.448733, -0.6875792, 1, 0.3843137, 0, 1,
-1.489275, -0.8751414, -1.35143, 1, 0.3882353, 0, 1,
-1.4821, 1.723917, -1.640854, 1, 0.3960784, 0, 1,
-1.46749, 2.271475, -0.6888997, 1, 0.4039216, 0, 1,
-1.458682, -1.375171, -1.848715, 1, 0.4078431, 0, 1,
-1.449639, -0.6292819, -1.915577, 1, 0.4156863, 0, 1,
-1.448982, -0.02284531, -2.32443, 1, 0.4196078, 0, 1,
-1.444236, 0.02849907, -2.182922, 1, 0.427451, 0, 1,
-1.433678, 0.589442, -1.144401, 1, 0.4313726, 0, 1,
-1.429646, 0.133887, -1.517505, 1, 0.4392157, 0, 1,
-1.426271, -2.204438, -2.977412, 1, 0.4431373, 0, 1,
-1.414571, 0.834061, -3.027603, 1, 0.4509804, 0, 1,
-1.407957, -0.5209906, -2.148623, 1, 0.454902, 0, 1,
-1.406753, -0.6014194, -2.256353, 1, 0.4627451, 0, 1,
-1.400182, 1.049177, -1.24476, 1, 0.4666667, 0, 1,
-1.394477, 0.9453045, -0.995375, 1, 0.4745098, 0, 1,
-1.393896, -0.7446027, -1.256549, 1, 0.4784314, 0, 1,
-1.389521, 0.6397963, -0.1619551, 1, 0.4862745, 0, 1,
-1.379623, -0.2313448, -0.7361492, 1, 0.4901961, 0, 1,
-1.369644, 0.03010997, 0.3362154, 1, 0.4980392, 0, 1,
-1.366434, -0.978276, -1.879444, 1, 0.5058824, 0, 1,
-1.365189, -2.558985, -0.7000741, 1, 0.509804, 0, 1,
-1.342139, -1.648873, -2.035491, 1, 0.5176471, 0, 1,
-1.34053, -0.1841187, -1.428643, 1, 0.5215687, 0, 1,
-1.337617, 1.155752, -1.030953, 1, 0.5294118, 0, 1,
-1.32894, 0.1427031, -2.475086, 1, 0.5333334, 0, 1,
-1.324868, -1.054943, -3.592305, 1, 0.5411765, 0, 1,
-1.312265, 0.4557338, -1.475599, 1, 0.5450981, 0, 1,
-1.307214, -1.121843, -3.767309, 1, 0.5529412, 0, 1,
-1.306783, -1.24582, -3.020143, 1, 0.5568628, 0, 1,
-1.306077, 1.750159, 0.2267792, 1, 0.5647059, 0, 1,
-1.305979, 0.08242603, -0.6084467, 1, 0.5686275, 0, 1,
-1.303707, 1.565271, -2.274247, 1, 0.5764706, 0, 1,
-1.301179, 0.05565921, -1.069533, 1, 0.5803922, 0, 1,
-1.300875, 0.1566578, -1.557336, 1, 0.5882353, 0, 1,
-1.2997, -0.6762319, -2.141292, 1, 0.5921569, 0, 1,
-1.29176, 1.326863, 0.6753523, 1, 0.6, 0, 1,
-1.289388, 0.1512925, -1.080622, 1, 0.6078432, 0, 1,
-1.284981, 0.03242595, -1.454745, 1, 0.6117647, 0, 1,
-1.275479, 0.985848, -0.8377392, 1, 0.6196079, 0, 1,
-1.273641, -0.1571569, -1.096402, 1, 0.6235294, 0, 1,
-1.270664, 0.076014, -1.920265, 1, 0.6313726, 0, 1,
-1.267743, 0.05676387, -2.486749, 1, 0.6352941, 0, 1,
-1.26368, -1.252622, -3.923906, 1, 0.6431373, 0, 1,
-1.26298, -1.083796, -2.705098, 1, 0.6470588, 0, 1,
-1.262147, -1.274278, -3.080129, 1, 0.654902, 0, 1,
-1.258285, 1.240023, 0.3106018, 1, 0.6588235, 0, 1,
-1.25787, -0.09570949, -1.647102, 1, 0.6666667, 0, 1,
-1.248545, -0.1292434, -1.971231, 1, 0.6705883, 0, 1,
-1.242035, -1.411392, -2.495367, 1, 0.6784314, 0, 1,
-1.240008, 0.6039286, -0.9614297, 1, 0.682353, 0, 1,
-1.236704, -0.2021531, -1.076833, 1, 0.6901961, 0, 1,
-1.233948, 2.535397, -0.4363253, 1, 0.6941177, 0, 1,
-1.233037, -0.6229952, -0.3136693, 1, 0.7019608, 0, 1,
-1.230088, 0.5364936, 0.5595737, 1, 0.7098039, 0, 1,
-1.221344, -1.541126, -2.962749, 1, 0.7137255, 0, 1,
-1.205222, 0.1169688, -0.3366877, 1, 0.7215686, 0, 1,
-1.203383, -1.046597, -2.643449, 1, 0.7254902, 0, 1,
-1.202293, 0.01965826, -2.747819, 1, 0.7333333, 0, 1,
-1.199987, 1.024373, -1.655301, 1, 0.7372549, 0, 1,
-1.195496, 1.777147, -1.07894, 1, 0.7450981, 0, 1,
-1.194067, 0.6543875, -0.9189974, 1, 0.7490196, 0, 1,
-1.192546, -0.8435939, -1.811353, 1, 0.7568628, 0, 1,
-1.188608, -0.1122986, -2.358991, 1, 0.7607843, 0, 1,
-1.18743, -0.7607424, -3.16923, 1, 0.7686275, 0, 1,
-1.184059, 1.850244, -0.06291106, 1, 0.772549, 0, 1,
-1.180519, 0.116827, -0.4221005, 1, 0.7803922, 0, 1,
-1.175906, 0.1455034, -1.957373, 1, 0.7843137, 0, 1,
-1.163404, -0.9446808, -2.821195, 1, 0.7921569, 0, 1,
-1.153262, -0.5526446, -1.642294, 1, 0.7960784, 0, 1,
-1.148791, -0.8521304, -1.995798, 1, 0.8039216, 0, 1,
-1.142383, 0.2617932, -1.222359, 1, 0.8117647, 0, 1,
-1.140558, -0.2173033, -2.928581, 1, 0.8156863, 0, 1,
-1.137803, 0.03881977, -1.872719, 1, 0.8235294, 0, 1,
-1.133311, 0.8876877, -1.254792, 1, 0.827451, 0, 1,
-1.128105, 1.431187, -0.4587116, 1, 0.8352941, 0, 1,
-1.122919, -1.750223, -5.615881, 1, 0.8392157, 0, 1,
-1.119443, -0.3753451, -1.096882, 1, 0.8470588, 0, 1,
-1.11931, 0.4871209, 0.6649671, 1, 0.8509804, 0, 1,
-1.10698, -0.5548682, -3.376334, 1, 0.8588235, 0, 1,
-1.103241, 1.488884, -0.5275047, 1, 0.8627451, 0, 1,
-1.100889, -0.499966, -3.261697, 1, 0.8705882, 0, 1,
-1.100119, -0.6609361, -2.271375, 1, 0.8745098, 0, 1,
-1.09138, -1.731782, -1.861429, 1, 0.8823529, 0, 1,
-1.089042, 0.1015496, -0.9389862, 1, 0.8862745, 0, 1,
-1.081067, -0.4975319, -1.214476, 1, 0.8941177, 0, 1,
-1.080566, 1.10285, -1.131486, 1, 0.8980392, 0, 1,
-1.077757, 1.235871, 0.1568268, 1, 0.9058824, 0, 1,
-1.073118, 0.9593501, -1.75262, 1, 0.9137255, 0, 1,
-1.070798, 2.073527, -1.413542, 1, 0.9176471, 0, 1,
-1.06861, -0.5152346, -2.651772, 1, 0.9254902, 0, 1,
-1.065709, 0.1607523, 0.5607433, 1, 0.9294118, 0, 1,
-1.061299, -0.0002643765, -1.935712, 1, 0.9372549, 0, 1,
-1.060025, 0.322789, -0.01637118, 1, 0.9411765, 0, 1,
-1.058544, -0.6830725, -2.027154, 1, 0.9490196, 0, 1,
-1.034502, 0.2715542, -2.053308, 1, 0.9529412, 0, 1,
-1.028038, -1.860845, -3.33143, 1, 0.9607843, 0, 1,
-1.027484, -0.3526101, 1.306609, 1, 0.9647059, 0, 1,
-1.025001, 0.2336144, -2.072348, 1, 0.972549, 0, 1,
-1.009064, -0.01863869, -2.135309, 1, 0.9764706, 0, 1,
-0.9972969, -2.464856, -1.801611, 1, 0.9843137, 0, 1,
-0.9942825, 0.3068772, -1.084082, 1, 0.9882353, 0, 1,
-0.9938964, -0.1427135, -3.030226, 1, 0.9960784, 0, 1,
-0.9897602, 1.344828, -2.141897, 0.9960784, 1, 0, 1,
-0.9892491, -1.316729, -3.744204, 0.9921569, 1, 0, 1,
-0.9846398, 0.5795678, -1.618234, 0.9843137, 1, 0, 1,
-0.9824859, -0.2910018, -2.173865, 0.9803922, 1, 0, 1,
-0.9824607, -1.73642, -1.968306, 0.972549, 1, 0, 1,
-0.9793342, -0.1106187, -2.490231, 0.9686275, 1, 0, 1,
-0.9746322, 0.6719252, 0.2007044, 0.9607843, 1, 0, 1,
-0.9683339, -0.7126939, -2.579121, 0.9568627, 1, 0, 1,
-0.9679419, -1.574718, -1.52648, 0.9490196, 1, 0, 1,
-0.9666616, 0.3563699, -2.818376, 0.945098, 1, 0, 1,
-0.9651338, -0.06917298, -1.583641, 0.9372549, 1, 0, 1,
-0.9626459, -0.9605517, -1.128114, 0.9333333, 1, 0, 1,
-0.9623893, 0.2500755, -0.5312608, 0.9254902, 1, 0, 1,
-0.9592475, 1.574149, -0.897926, 0.9215686, 1, 0, 1,
-0.9390808, 0.3541671, -0.08574426, 0.9137255, 1, 0, 1,
-0.9327468, -0.8344615, -3.875654, 0.9098039, 1, 0, 1,
-0.9279594, 1.005764, -2.143135, 0.9019608, 1, 0, 1,
-0.923308, 0.362879, -1.02807, 0.8941177, 1, 0, 1,
-0.9178772, -0.7166215, -1.401051, 0.8901961, 1, 0, 1,
-0.9139206, 0.09330266, -0.9821798, 0.8823529, 1, 0, 1,
-0.9126124, -0.05092938, 1.161883, 0.8784314, 1, 0, 1,
-0.9117346, 0.1964628, -1.431704, 0.8705882, 1, 0, 1,
-0.9080269, -1.044382, -1.971105, 0.8666667, 1, 0, 1,
-0.9028127, -0.4438891, -1.984349, 0.8588235, 1, 0, 1,
-0.9005532, 1.488458, -1.890566, 0.854902, 1, 0, 1,
-0.8997195, 1.208041, -2.410476, 0.8470588, 1, 0, 1,
-0.8963481, -0.5589156, -2.312713, 0.8431373, 1, 0, 1,
-0.8952204, 0.2705248, -1.330338, 0.8352941, 1, 0, 1,
-0.8929695, -0.8976013, -3.615642, 0.8313726, 1, 0, 1,
-0.8925185, 1.624576, -0.5007952, 0.8235294, 1, 0, 1,
-0.8849797, -1.068479, -2.602363, 0.8196079, 1, 0, 1,
-0.8835663, 0.3052126, -0.7252432, 0.8117647, 1, 0, 1,
-0.8804674, 0.2115524, -0.6902396, 0.8078431, 1, 0, 1,
-0.8774977, -0.7398444, -4.02051, 0.8, 1, 0, 1,
-0.8763218, 0.3582735, -0.03276578, 0.7921569, 1, 0, 1,
-0.8758876, 1.259875, -1.375699, 0.7882353, 1, 0, 1,
-0.875074, 0.2680672, -2.092162, 0.7803922, 1, 0, 1,
-0.8746196, 0.4167763, -2.145361, 0.7764706, 1, 0, 1,
-0.8745521, 0.8086914, -2.747056, 0.7686275, 1, 0, 1,
-0.8739734, 0.2709275, -1.728558, 0.7647059, 1, 0, 1,
-0.8651097, 0.6640047, -0.4915282, 0.7568628, 1, 0, 1,
-0.8565792, -0.2665407, -1.465786, 0.7529412, 1, 0, 1,
-0.8560622, 0.6719245, 0.6053051, 0.7450981, 1, 0, 1,
-0.8553652, -1.507719, -1.224553, 0.7411765, 1, 0, 1,
-0.8521582, 1.418638, 1.486004, 0.7333333, 1, 0, 1,
-0.8510923, -1.167399, -1.150597, 0.7294118, 1, 0, 1,
-0.8496581, 0.2939661, -2.387772, 0.7215686, 1, 0, 1,
-0.8439807, -1.131073, -3.444331, 0.7176471, 1, 0, 1,
-0.8412714, -0.3987408, -2.925957, 0.7098039, 1, 0, 1,
-0.8406798, -0.7384977, -2.94978, 0.7058824, 1, 0, 1,
-0.833064, 0.3182101, -0.2619351, 0.6980392, 1, 0, 1,
-0.8290057, 0.242142, -2.085863, 0.6901961, 1, 0, 1,
-0.8264133, -0.2329043, -2.281314, 0.6862745, 1, 0, 1,
-0.8164878, 0.3000859, -1.341737, 0.6784314, 1, 0, 1,
-0.8111523, -1.174016, -3.759494, 0.6745098, 1, 0, 1,
-0.8107875, -0.1761631, -1.687826, 0.6666667, 1, 0, 1,
-0.8074976, 0.8402625, 0.8502433, 0.6627451, 1, 0, 1,
-0.8063399, -0.0005785993, -1.706322, 0.654902, 1, 0, 1,
-0.8061728, 0.9537386, 0.8082622, 0.6509804, 1, 0, 1,
-0.8013224, -0.7567881, -1.46915, 0.6431373, 1, 0, 1,
-0.7945626, -0.4916649, -3.337117, 0.6392157, 1, 0, 1,
-0.7918896, 0.3229448, -1.265804, 0.6313726, 1, 0, 1,
-0.7912631, -0.5681216, -1.793507, 0.627451, 1, 0, 1,
-0.7897212, 0.318424, -2.655, 0.6196079, 1, 0, 1,
-0.7869025, -0.2367356, -2.747324, 0.6156863, 1, 0, 1,
-0.782181, 0.8769792, 0.6420518, 0.6078432, 1, 0, 1,
-0.7810796, 1.304102, -2.774632, 0.6039216, 1, 0, 1,
-0.7792515, -1.699571, -3.631209, 0.5960785, 1, 0, 1,
-0.7683898, 0.09080761, -2.943564, 0.5882353, 1, 0, 1,
-0.7650993, -0.7264082, -0.8286738, 0.5843138, 1, 0, 1,
-0.7642687, 0.9703274, -0.6369143, 0.5764706, 1, 0, 1,
-0.7626137, 1.192697, -0.2108416, 0.572549, 1, 0, 1,
-0.7604607, -0.7487543, -1.912513, 0.5647059, 1, 0, 1,
-0.7529909, 0.5500654, -0.8150563, 0.5607843, 1, 0, 1,
-0.748048, -0.03141575, -1.03946, 0.5529412, 1, 0, 1,
-0.7458088, 0.2486787, -1.281419, 0.5490196, 1, 0, 1,
-0.7445411, -0.4685286, -1.827306, 0.5411765, 1, 0, 1,
-0.743329, -1.249432, -3.365337, 0.5372549, 1, 0, 1,
-0.7375032, -0.216212, -1.117418, 0.5294118, 1, 0, 1,
-0.7344587, -2.636239, -3.738011, 0.5254902, 1, 0, 1,
-0.7338296, -0.3273257, -2.894517, 0.5176471, 1, 0, 1,
-0.7337652, -1.061038, -3.334247, 0.5137255, 1, 0, 1,
-0.7228981, -0.5460488, -1.345972, 0.5058824, 1, 0, 1,
-0.722127, -0.7076781, -2.750996, 0.5019608, 1, 0, 1,
-0.7189856, 0.602845, -0.8116416, 0.4941176, 1, 0, 1,
-0.7151286, 0.7742134, -1.079228, 0.4862745, 1, 0, 1,
-0.7140985, 0.01328392, -1.916922, 0.4823529, 1, 0, 1,
-0.7131991, 1.25544, -1.524373, 0.4745098, 1, 0, 1,
-0.706995, 0.2260542, -0.1131645, 0.4705882, 1, 0, 1,
-0.7031796, 0.1880969, -2.641697, 0.4627451, 1, 0, 1,
-0.7002512, -0.9181843, -3.235956, 0.4588235, 1, 0, 1,
-0.6962922, -2.394042, -2.339054, 0.4509804, 1, 0, 1,
-0.6930348, -2.123277, -2.179451, 0.4470588, 1, 0, 1,
-0.6922117, -0.1835834, -3.36051, 0.4392157, 1, 0, 1,
-0.6903182, -0.5202467, -0.4137866, 0.4352941, 1, 0, 1,
-0.6893846, 0.9778903, 0.4224545, 0.427451, 1, 0, 1,
-0.6877233, -0.8013761, -3.112051, 0.4235294, 1, 0, 1,
-0.6769313, 0.2756244, 0.3861826, 0.4156863, 1, 0, 1,
-0.6706782, -1.182558, -3.361099, 0.4117647, 1, 0, 1,
-0.6685168, 0.3231993, -0.9779285, 0.4039216, 1, 0, 1,
-0.6663839, -0.761731, -2.920363, 0.3960784, 1, 0, 1,
-0.6634135, -0.4359432, -0.8797199, 0.3921569, 1, 0, 1,
-0.6562353, -0.2723009, -2.762531, 0.3843137, 1, 0, 1,
-0.6546896, -0.1854964, -3.001788, 0.3803922, 1, 0, 1,
-0.6510838, 0.4254158, -1.390632, 0.372549, 1, 0, 1,
-0.6508699, -1.460286, -1.887179, 0.3686275, 1, 0, 1,
-0.650323, 1.056401, 0.3878156, 0.3607843, 1, 0, 1,
-0.6496999, -0.7395106, -2.629771, 0.3568628, 1, 0, 1,
-0.6373202, 2.281415, -0.3341506, 0.3490196, 1, 0, 1,
-0.6343616, -1.475089, -1.633723, 0.345098, 1, 0, 1,
-0.6336454, -0.5272544, -2.785682, 0.3372549, 1, 0, 1,
-0.625683, 1.051278, -0.29131, 0.3333333, 1, 0, 1,
-0.625661, 1.321386, -1.936645, 0.3254902, 1, 0, 1,
-0.6256055, 2.282647, 0.4808355, 0.3215686, 1, 0, 1,
-0.6250183, -1.000592, -2.828444, 0.3137255, 1, 0, 1,
-0.6214636, -0.1809125, -0.9908556, 0.3098039, 1, 0, 1,
-0.6134552, -0.1592836, -0.6270877, 0.3019608, 1, 0, 1,
-0.6077648, -0.05277507, -1.203546, 0.2941177, 1, 0, 1,
-0.6067612, -0.2288754, -3.759735, 0.2901961, 1, 0, 1,
-0.6064565, -0.4542519, -2.41118, 0.282353, 1, 0, 1,
-0.5996839, 1.522499, 0.7129339, 0.2784314, 1, 0, 1,
-0.5977993, 1.865108, 1.254177, 0.2705882, 1, 0, 1,
-0.5938248, 2.22045, -1.255875, 0.2666667, 1, 0, 1,
-0.5919619, -0.9124654, -2.987374, 0.2588235, 1, 0, 1,
-0.5913547, -0.3703338, -2.243922, 0.254902, 1, 0, 1,
-0.5861497, -0.3848773, -1.867709, 0.2470588, 1, 0, 1,
-0.5821239, -1.586807, -3.548234, 0.2431373, 1, 0, 1,
-0.5810674, 0.6147944, 0.919269, 0.2352941, 1, 0, 1,
-0.5749994, 0.1621719, -0.8667955, 0.2313726, 1, 0, 1,
-0.5744876, -0.6032909, -2.734488, 0.2235294, 1, 0, 1,
-0.5730476, -1.789215, -2.484033, 0.2196078, 1, 0, 1,
-0.5689723, 2.01538, -0.8852893, 0.2117647, 1, 0, 1,
-0.5674783, 0.7338145, 0.8974728, 0.2078431, 1, 0, 1,
-0.5646451, -1.989411, -4.433384, 0.2, 1, 0, 1,
-0.5525604, -0.01336192, -1.832614, 0.1921569, 1, 0, 1,
-0.5516208, 0.6508487, -1.391155, 0.1882353, 1, 0, 1,
-0.5513, 0.2109334, -0.08035941, 0.1803922, 1, 0, 1,
-0.5496021, -0.04369884, -2.123291, 0.1764706, 1, 0, 1,
-0.5480996, -1.101221, -2.88002, 0.1686275, 1, 0, 1,
-0.5469679, -0.4675823, -2.050008, 0.1647059, 1, 0, 1,
-0.5464716, 0.6452665, -1.175797, 0.1568628, 1, 0, 1,
-0.5462078, -1.519522, -3.374698, 0.1529412, 1, 0, 1,
-0.5452986, -1.021089, -1.88126, 0.145098, 1, 0, 1,
-0.5446073, 0.5112768, -1.798684, 0.1411765, 1, 0, 1,
-0.5439832, 0.5322608, -1.482723, 0.1333333, 1, 0, 1,
-0.5378159, 1.027768, -0.6774231, 0.1294118, 1, 0, 1,
-0.5373611, -0.4447832, -3.04133, 0.1215686, 1, 0, 1,
-0.5327102, 1.192829, -0.3456711, 0.1176471, 1, 0, 1,
-0.5312532, -0.2203278, -1.471372, 0.1098039, 1, 0, 1,
-0.5305771, -0.5630028, -1.059715, 0.1058824, 1, 0, 1,
-0.5304277, -0.375611, -1.973385, 0.09803922, 1, 0, 1,
-0.5285004, -0.1436747, -1.449397, 0.09019608, 1, 0, 1,
-0.5276148, -0.1192068, -0.5575383, 0.08627451, 1, 0, 1,
-0.5231536, -0.08810864, -0.5532271, 0.07843138, 1, 0, 1,
-0.5227994, 0.7157422, -0.5279215, 0.07450981, 1, 0, 1,
-0.520813, -0.7988452, -3.146256, 0.06666667, 1, 0, 1,
-0.520146, 1.582933, -0.2154219, 0.0627451, 1, 0, 1,
-0.5165004, -0.2086268, -1.301831, 0.05490196, 1, 0, 1,
-0.5105541, -1.06767, -1.990774, 0.05098039, 1, 0, 1,
-0.503494, 0.6965542, -1.050465, 0.04313726, 1, 0, 1,
-0.4980694, 0.4587159, -0.615769, 0.03921569, 1, 0, 1,
-0.4906861, -1.032631, -1.301996, 0.03137255, 1, 0, 1,
-0.4899011, -1.049438, -3.279677, 0.02745098, 1, 0, 1,
-0.4840551, 2.36425, -1.867772, 0.01960784, 1, 0, 1,
-0.4799539, -0.707203, -3.174648, 0.01568628, 1, 0, 1,
-0.4769569, -0.2509362, -4.503452, 0.007843138, 1, 0, 1,
-0.4764388, 1.41696, -2.71093, 0.003921569, 1, 0, 1,
-0.4679951, 0.12165, 0.2493466, 0, 1, 0.003921569, 1,
-0.4658457, -1.447549, -3.37447, 0, 1, 0.01176471, 1,
-0.4607493, -0.8530424, -3.49785, 0, 1, 0.01568628, 1,
-0.4570131, 0.07835121, -2.409917, 0, 1, 0.02352941, 1,
-0.4481748, -0.2978485, -3.701146, 0, 1, 0.02745098, 1,
-0.4423563, -0.3500547, -3.126709, 0, 1, 0.03529412, 1,
-0.4367419, 1.820078, -0.3914406, 0, 1, 0.03921569, 1,
-0.4318655, -0.7156401, -1.222225, 0, 1, 0.04705882, 1,
-0.4300602, -0.03571205, -1.190788, 0, 1, 0.05098039, 1,
-0.4272344, 1.177492, -2.126487, 0, 1, 0.05882353, 1,
-0.4244143, -1.059161, -2.817625, 0, 1, 0.0627451, 1,
-0.3996168, -0.4781902, -2.837185, 0, 1, 0.07058824, 1,
-0.3992063, -0.2582334, -1.619896, 0, 1, 0.07450981, 1,
-0.3971112, -2.955398, -2.262822, 0, 1, 0.08235294, 1,
-0.3957359, 0.7523797, 1.672404, 0, 1, 0.08627451, 1,
-0.3916095, 0.35271, -1.970294, 0, 1, 0.09411765, 1,
-0.3849804, -0.346396, -1.160612, 0, 1, 0.1019608, 1,
-0.3836122, -0.9434351, -3.953499, 0, 1, 0.1058824, 1,
-0.3797923, -0.181659, -3.890697, 0, 1, 0.1137255, 1,
-0.3773092, -0.6985818, -2.016306, 0, 1, 0.1176471, 1,
-0.3771797, -1.068373, -3.389313, 0, 1, 0.1254902, 1,
-0.3714533, 0.2880528, -2.427333, 0, 1, 0.1294118, 1,
-0.3704058, -0.3428461, -1.579427, 0, 1, 0.1372549, 1,
-0.3672747, 0.2713834, -1.20946, 0, 1, 0.1411765, 1,
-0.3671846, -0.2218309, -2.92696, 0, 1, 0.1490196, 1,
-0.3666232, -1.682818, -2.106963, 0, 1, 0.1529412, 1,
-0.3646165, 0.4039929, -1.38144, 0, 1, 0.1607843, 1,
-0.3639649, -0.8751456, -1.695723, 0, 1, 0.1647059, 1,
-0.3630322, 0.09095388, -2.268452, 0, 1, 0.172549, 1,
-0.3612728, -0.2592318, -2.393173, 0, 1, 0.1764706, 1,
-0.3606679, -1.141722, -4.368466, 0, 1, 0.1843137, 1,
-0.3589152, -0.3877492, -3.419194, 0, 1, 0.1882353, 1,
-0.3548822, 1.167267, 1.066741, 0, 1, 0.1960784, 1,
-0.3526503, 0.5170758, 1.274573, 0, 1, 0.2039216, 1,
-0.3499023, -0.8756467, -4.522661, 0, 1, 0.2078431, 1,
-0.3490199, 0.5470856, -0.6255684, 0, 1, 0.2156863, 1,
-0.3482344, 0.02751714, -0.6268693, 0, 1, 0.2196078, 1,
-0.3460885, -0.5610232, -3.510699, 0, 1, 0.227451, 1,
-0.3402126, -0.4382148, -4.464166, 0, 1, 0.2313726, 1,
-0.3387038, -0.9243276, -4.249325, 0, 1, 0.2392157, 1,
-0.3378115, 1.01493, -0.3355193, 0, 1, 0.2431373, 1,
-0.3301694, 0.03340862, -1.867139, 0, 1, 0.2509804, 1,
-0.3291747, 1.752149, -2.189166, 0, 1, 0.254902, 1,
-0.3167389, -0.2360479, -1.313787, 0, 1, 0.2627451, 1,
-0.3107252, -0.1564306, -2.600218, 0, 1, 0.2666667, 1,
-0.3084273, 0.9828885, -0.3954137, 0, 1, 0.2745098, 1,
-0.3052238, 0.4418685, -0.3520387, 0, 1, 0.2784314, 1,
-0.3045141, 0.0784585, -1.629573, 0, 1, 0.2862745, 1,
-0.3020172, -1.262025, -3.677327, 0, 1, 0.2901961, 1,
-0.3006706, 0.2340465, 1.856774, 0, 1, 0.2980392, 1,
-0.2981403, 0.738426, -0.4148964, 0, 1, 0.3058824, 1,
-0.2843904, 0.9412983, -0.7526104, 0, 1, 0.3098039, 1,
-0.2825432, -0.5372471, -1.004403, 0, 1, 0.3176471, 1,
-0.281721, 0.06348538, -1.985274, 0, 1, 0.3215686, 1,
-0.2807743, 0.3250695, -0.03278994, 0, 1, 0.3294118, 1,
-0.2802713, -1.015024, -2.82044, 0, 1, 0.3333333, 1,
-0.2721472, 1.608452, 0.6023705, 0, 1, 0.3411765, 1,
-0.2675081, 0.07819105, 0.04059105, 0, 1, 0.345098, 1,
-0.2658339, 0.4698891, 0.03615329, 0, 1, 0.3529412, 1,
-0.2618674, -0.03271582, -1.846591, 0, 1, 0.3568628, 1,
-0.2608545, -2.317842, -3.396132, 0, 1, 0.3647059, 1,
-0.2589491, -1.406672, -3.444519, 0, 1, 0.3686275, 1,
-0.2570782, 0.9633674, 0.7948172, 0, 1, 0.3764706, 1,
-0.2501009, -1.661096, -2.39818, 0, 1, 0.3803922, 1,
-0.2448311, -1.474302, -2.704125, 0, 1, 0.3882353, 1,
-0.2418853, 0.213906, -0.7258531, 0, 1, 0.3921569, 1,
-0.2417128, -1.121232, -3.446785, 0, 1, 0.4, 1,
-0.2411351, -1.435173, -3.827121, 0, 1, 0.4078431, 1,
-0.2408445, -1.356942, -4.152296, 0, 1, 0.4117647, 1,
-0.2400505, 0.5798885, -1.455744, 0, 1, 0.4196078, 1,
-0.2394709, 1.024436, -0.7181737, 0, 1, 0.4235294, 1,
-0.2371579, 0.8781708, -0.4490639, 0, 1, 0.4313726, 1,
-0.2361201, -0.2249094, -4.226, 0, 1, 0.4352941, 1,
-0.2351819, 0.4190564, 0.06975778, 0, 1, 0.4431373, 1,
-0.2331035, 0.09023978, -1.383734, 0, 1, 0.4470588, 1,
-0.2321908, 0.1462553, -1.591694, 0, 1, 0.454902, 1,
-0.2241344, -0.7875367, -3.610128, 0, 1, 0.4588235, 1,
-0.2230208, 0.6021366, -0.0307171, 0, 1, 0.4666667, 1,
-0.219265, 0.8238302, -1.315947, 0, 1, 0.4705882, 1,
-0.2168714, -1.73117, -3.49597, 0, 1, 0.4784314, 1,
-0.2123664, 0.1955311, -1.093134, 0, 1, 0.4823529, 1,
-0.2098879, 1.110101, -1.002798, 0, 1, 0.4901961, 1,
-0.2056869, 1.328276, -1.214524, 0, 1, 0.4941176, 1,
-0.2043251, 0.7919535, -0.7055138, 0, 1, 0.5019608, 1,
-0.2009506, 0.2978981, -1.269459, 0, 1, 0.509804, 1,
-0.1947546, -0.1660343, -2.431178, 0, 1, 0.5137255, 1,
-0.1918204, 0.09095672, -1.20737, 0, 1, 0.5215687, 1,
-0.1909008, -0.2862554, -3.681212, 0, 1, 0.5254902, 1,
-0.1865694, -0.8288978, -3.812809, 0, 1, 0.5333334, 1,
-0.1863428, -1.439886, -3.523853, 0, 1, 0.5372549, 1,
-0.1820987, -0.3359876, -3.743924, 0, 1, 0.5450981, 1,
-0.182049, -1.243102, -3.054764, 0, 1, 0.5490196, 1,
-0.1728632, 0.09707298, -1.59324, 0, 1, 0.5568628, 1,
-0.1724891, -0.885955, -3.344265, 0, 1, 0.5607843, 1,
-0.1684635, 0.9893357, -1.160301, 0, 1, 0.5686275, 1,
-0.166538, 0.6356328, -0.6288911, 0, 1, 0.572549, 1,
-0.1646352, 1.716993, 0.3832732, 0, 1, 0.5803922, 1,
-0.1643408, -0.5247129, -2.515388, 0, 1, 0.5843138, 1,
-0.1616668, 0.9639184, -0.2126903, 0, 1, 0.5921569, 1,
-0.1573947, 0.1594679, -0.6375635, 0, 1, 0.5960785, 1,
-0.1550302, 0.7473479, 0.9659986, 0, 1, 0.6039216, 1,
-0.1527602, 1.260052, -0.4251963, 0, 1, 0.6117647, 1,
-0.148259, 0.207218, 0.04124107, 0, 1, 0.6156863, 1,
-0.1459063, 0.9436904, 0.402927, 0, 1, 0.6235294, 1,
-0.1429435, 1.400846, -0.8328053, 0, 1, 0.627451, 1,
-0.1421347, -0.2358323, -2.463474, 0, 1, 0.6352941, 1,
-0.1385508, -1.195079, -4.203235, 0, 1, 0.6392157, 1,
-0.1381647, -2.179095, -2.58755, 0, 1, 0.6470588, 1,
-0.1355638, -0.7028881, -2.416908, 0, 1, 0.6509804, 1,
-0.1350677, -0.4459332, -5.045706, 0, 1, 0.6588235, 1,
-0.1344809, 0.1100488, 0.2508144, 0, 1, 0.6627451, 1,
-0.1334026, -2.074351, -3.423558, 0, 1, 0.6705883, 1,
-0.1331918, -0.8281469, -3.177059, 0, 1, 0.6745098, 1,
-0.1328891, -1.492181, -3.182896, 0, 1, 0.682353, 1,
-0.1265531, 1.112624, 0.9356231, 0, 1, 0.6862745, 1,
-0.1203435, -0.4329527, -2.498835, 0, 1, 0.6941177, 1,
-0.1174523, -0.7066109, -4.66539, 0, 1, 0.7019608, 1,
-0.1171204, 1.835961, 1.140889, 0, 1, 0.7058824, 1,
-0.1081385, 0.7178708, -1.240786, 0, 1, 0.7137255, 1,
-0.103541, -2.854649, -3.482055, 0, 1, 0.7176471, 1,
-0.09796182, 0.02277428, -1.006215, 0, 1, 0.7254902, 1,
-0.09767165, -0.7776153, -3.761743, 0, 1, 0.7294118, 1,
-0.09720095, 0.8584415, 0.0213938, 0, 1, 0.7372549, 1,
-0.09345891, 0.7330856, -1.081464, 0, 1, 0.7411765, 1,
-0.08120862, 2.155873, -0.02907487, 0, 1, 0.7490196, 1,
-0.07936414, -1.155456, -4.519806, 0, 1, 0.7529412, 1,
-0.0722757, 0.06669055, -1.550137, 0, 1, 0.7607843, 1,
-0.07070318, 1.174295, 1.186903, 0, 1, 0.7647059, 1,
-0.06876794, 0.07167838, -0.6930083, 0, 1, 0.772549, 1,
-0.06630557, 0.07065311, -1.69028, 0, 1, 0.7764706, 1,
-0.06536869, 0.4749574, 0.3945393, 0, 1, 0.7843137, 1,
-0.06271927, 0.9657208, -0.8852938, 0, 1, 0.7882353, 1,
-0.06180213, 1.165333, 0.4432014, 0, 1, 0.7960784, 1,
-0.06153858, -2.089097, -3.953172, 0, 1, 0.8039216, 1,
-0.0597874, 2.064814, -0.6343878, 0, 1, 0.8078431, 1,
-0.05513336, 0.3351961, -0.7656626, 0, 1, 0.8156863, 1,
-0.05441513, -0.4707208, -2.914705, 0, 1, 0.8196079, 1,
-0.05218367, 0.6865188, -1.113667, 0, 1, 0.827451, 1,
-0.04577944, -0.4875305, -3.186266, 0, 1, 0.8313726, 1,
-0.03817199, 1.42864, 0.1012939, 0, 1, 0.8392157, 1,
-0.03686981, -1.383404, -2.217398, 0, 1, 0.8431373, 1,
-0.03213158, -0.8832211, -3.179914, 0, 1, 0.8509804, 1,
-0.0302573, -0.001455518, -1.793511, 0, 1, 0.854902, 1,
-0.02327273, 0.7393015, 0.4512735, 0, 1, 0.8627451, 1,
-0.02215879, -0.6528411, -1.783304, 0, 1, 0.8666667, 1,
-0.01938369, 0.1627771, 0.3064384, 0, 1, 0.8745098, 1,
-0.01765027, -0.1485431, -3.899309, 0, 1, 0.8784314, 1,
-0.01713195, 0.1368433, 0.4993581, 0, 1, 0.8862745, 1,
-0.01595901, 0.5627155, 0.1936304, 0, 1, 0.8901961, 1,
-0.003302771, 0.8531756, 0.9142296, 0, 1, 0.8980392, 1,
-0.002892749, 1.812, -1.109485, 0, 1, 0.9058824, 1,
0.002295751, 0.367698, -0.5745233, 0, 1, 0.9098039, 1,
0.003210644, -2.423571, 3.176456, 0, 1, 0.9176471, 1,
0.007540158, 0.7681898, 0.2728386, 0, 1, 0.9215686, 1,
0.01104607, 0.3371328, 0.2784318, 0, 1, 0.9294118, 1,
0.01129831, -1.039624, 4.905174, 0, 1, 0.9333333, 1,
0.01229582, 0.620009, 0.5172453, 0, 1, 0.9411765, 1,
0.01328916, -1.613425, 2.305299, 0, 1, 0.945098, 1,
0.02016135, -0.6025574, 1.663245, 0, 1, 0.9529412, 1,
0.0217049, -0.6517763, 4.08633, 0, 1, 0.9568627, 1,
0.0230497, -0.1519087, 2.449166, 0, 1, 0.9647059, 1,
0.02437952, -0.5700516, 2.646167, 0, 1, 0.9686275, 1,
0.02453135, -1.141296, 2.717005, 0, 1, 0.9764706, 1,
0.02472777, 1.934521, 0.131534, 0, 1, 0.9803922, 1,
0.03021285, 0.1863174, 1.210232, 0, 1, 0.9882353, 1,
0.03084383, -0.400418, 3.053138, 0, 1, 0.9921569, 1,
0.03317501, 0.9850724, -0.3942903, 0, 1, 1, 1,
0.03734531, -0.8764596, 1.006831, 0, 0.9921569, 1, 1,
0.0447764, 0.1325922, -0.04867064, 0, 0.9882353, 1, 1,
0.04585006, -0.888288, 3.023004, 0, 0.9803922, 1, 1,
0.04701734, 1.520636, -2.307745, 0, 0.9764706, 1, 1,
0.05172722, 0.6645069, -1.191358, 0, 0.9686275, 1, 1,
0.05192504, -0.428453, 3.011737, 0, 0.9647059, 1, 1,
0.05295324, -1.241713, 3.646667, 0, 0.9568627, 1, 1,
0.06302636, -0.830771, 2.95975, 0, 0.9529412, 1, 1,
0.06642891, -0.6002331, 3.155155, 0, 0.945098, 1, 1,
0.06660306, -1.330626, 3.583185, 0, 0.9411765, 1, 1,
0.06884492, 0.2462536, 1.284064, 0, 0.9333333, 1, 1,
0.07353696, 1.14291, -1.19453, 0, 0.9294118, 1, 1,
0.07537641, 0.4537179, 0.1173099, 0, 0.9215686, 1, 1,
0.07744703, 0.8625336, 0.0173315, 0, 0.9176471, 1, 1,
0.07942348, 0.3179063, -0.06532574, 0, 0.9098039, 1, 1,
0.0824561, 0.1332151, -0.2960681, 0, 0.9058824, 1, 1,
0.08308267, -0.8351913, 5.173525, 0, 0.8980392, 1, 1,
0.08415206, 2.228384, -0.3816073, 0, 0.8901961, 1, 1,
0.08475281, -1.950147, 4.23494, 0, 0.8862745, 1, 1,
0.08709003, 0.2173417, -0.730217, 0, 0.8784314, 1, 1,
0.08729187, -0.2183895, 2.149668, 0, 0.8745098, 1, 1,
0.08835478, 0.0674068, 1.199904, 0, 0.8666667, 1, 1,
0.08897302, 0.8330817, -0.6143416, 0, 0.8627451, 1, 1,
0.0935347, 0.8694758, 0.09842715, 0, 0.854902, 1, 1,
0.09509353, 0.6190125, -0.3299676, 0, 0.8509804, 1, 1,
0.0992466, -0.6108698, 1.404775, 0, 0.8431373, 1, 1,
0.1014587, -0.1235369, 2.956858, 0, 0.8392157, 1, 1,
0.1063725, -0.03740346, 2.035469, 0, 0.8313726, 1, 1,
0.1065831, -1.404787, 1.829767, 0, 0.827451, 1, 1,
0.1101397, 1.071714, 1.347438, 0, 0.8196079, 1, 1,
0.1114087, 0.2938272, -0.6415636, 0, 0.8156863, 1, 1,
0.1144164, 0.4218872, 0.7802289, 0, 0.8078431, 1, 1,
0.1223712, 0.8307706, -0.7935708, 0, 0.8039216, 1, 1,
0.1246264, -0.8360539, 2.577058, 0, 0.7960784, 1, 1,
0.1253144, -1.96703, 3.763014, 0, 0.7882353, 1, 1,
0.126754, -1.225739, 3.617523, 0, 0.7843137, 1, 1,
0.1294618, -1.493888, 2.430827, 0, 0.7764706, 1, 1,
0.1296325, 0.1941032, -0.7497137, 0, 0.772549, 1, 1,
0.1314922, -1.569786, 2.725837, 0, 0.7647059, 1, 1,
0.1377565, 0.08354372, 0.8351125, 0, 0.7607843, 1, 1,
0.1382563, -0.9590227, 3.322031, 0, 0.7529412, 1, 1,
0.1424378, -1.170118, 0.574501, 0, 0.7490196, 1, 1,
0.1436861, 0.8864598, -0.2402196, 0, 0.7411765, 1, 1,
0.1448679, 0.4074725, -0.8347211, 0, 0.7372549, 1, 1,
0.1486204, 0.02312658, 0.5875713, 0, 0.7294118, 1, 1,
0.1550563, -0.06215612, 1.439611, 0, 0.7254902, 1, 1,
0.1559634, 1.67036, 1.275469, 0, 0.7176471, 1, 1,
0.1572144, 0.01766067, 2.035548, 0, 0.7137255, 1, 1,
0.1581032, -0.910976, 3.308641, 0, 0.7058824, 1, 1,
0.1646878, -0.2645755, 3.392412, 0, 0.6980392, 1, 1,
0.1649815, 0.2227665, 1.548001, 0, 0.6941177, 1, 1,
0.1669992, -0.2184146, 2.450689, 0, 0.6862745, 1, 1,
0.1710823, -0.764306, 1.550414, 0, 0.682353, 1, 1,
0.1736169, -2.377524, 4.370466, 0, 0.6745098, 1, 1,
0.1821128, -0.3709415, 3.761834, 0, 0.6705883, 1, 1,
0.1845087, 0.8842188, 0.2370739, 0, 0.6627451, 1, 1,
0.1937822, -1.038439, 2.852508, 0, 0.6588235, 1, 1,
0.1966258, 1.158656, 0.6552703, 0, 0.6509804, 1, 1,
0.1995559, -0.6967614, 2.378863, 0, 0.6470588, 1, 1,
0.2029376, -1.640251, 3.129808, 0, 0.6392157, 1, 1,
0.2056423, -0.5335415, 3.526744, 0, 0.6352941, 1, 1,
0.2141104, 0.6841914, -1.89693, 0, 0.627451, 1, 1,
0.2154837, -0.6068941, 2.153244, 0, 0.6235294, 1, 1,
0.2155418, 0.4541385, 0.2354095, 0, 0.6156863, 1, 1,
0.2181805, -1.275193, 2.149697, 0, 0.6117647, 1, 1,
0.2187279, -0.760609, 1.385662, 0, 0.6039216, 1, 1,
0.2189893, 0.1289662, 1.228107, 0, 0.5960785, 1, 1,
0.2286227, 0.471444, 0.5056636, 0, 0.5921569, 1, 1,
0.2368605, 1.258805, -0.6173674, 0, 0.5843138, 1, 1,
0.2372832, -1.088028, 3.260657, 0, 0.5803922, 1, 1,
0.2383011, -1.582646, 2.927684, 0, 0.572549, 1, 1,
0.2406878, -1.359504, 2.416798, 0, 0.5686275, 1, 1,
0.2425334, 0.01985072, 2.680654, 0, 0.5607843, 1, 1,
0.2429684, 1.423082, 0.5319299, 0, 0.5568628, 1, 1,
0.2497799, -0.7052979, 1.585511, 0, 0.5490196, 1, 1,
0.2515886, -1.749693, 4.496687, 0, 0.5450981, 1, 1,
0.2562735, -0.2914762, 2.822043, 0, 0.5372549, 1, 1,
0.2593451, 0.9317286, -1.379778, 0, 0.5333334, 1, 1,
0.2681823, -0.4635099, 3.267646, 0, 0.5254902, 1, 1,
0.2708054, -0.1753248, 1.789905, 0, 0.5215687, 1, 1,
0.2719298, 0.5921237, -0.7645141, 0, 0.5137255, 1, 1,
0.2729444, 0.5196412, 1.798513, 0, 0.509804, 1, 1,
0.274294, 0.2091946, 1.707476, 0, 0.5019608, 1, 1,
0.2784407, 0.7374654, 0.1280752, 0, 0.4941176, 1, 1,
0.2812547, -2.00306, 3.177274, 0, 0.4901961, 1, 1,
0.2838339, 0.009439789, 2.968681, 0, 0.4823529, 1, 1,
0.2856961, 0.0282824, 1.743833, 0, 0.4784314, 1, 1,
0.2888142, -1.613565, 2.487237, 0, 0.4705882, 1, 1,
0.2897757, 2.465955, 0.6288236, 0, 0.4666667, 1, 1,
0.2911425, 1.017263, 0.9453382, 0, 0.4588235, 1, 1,
0.2941207, -0.4278623, 2.687554, 0, 0.454902, 1, 1,
0.2944767, 0.003933566, 1.364892, 0, 0.4470588, 1, 1,
0.2976643, -0.04522862, 0.4099307, 0, 0.4431373, 1, 1,
0.3014339, 1.119814, 0.1138816, 0, 0.4352941, 1, 1,
0.301605, -0.05319811, 2.042625, 0, 0.4313726, 1, 1,
0.3022682, -0.4327979, 1.596277, 0, 0.4235294, 1, 1,
0.3056421, 0.6749095, 1.073025, 0, 0.4196078, 1, 1,
0.3056685, 0.8329749, 0.9161701, 0, 0.4117647, 1, 1,
0.3064424, 1.755075, 1.588893, 0, 0.4078431, 1, 1,
0.3083795, 0.4474043, 2.029612, 0, 0.4, 1, 1,
0.3173425, 0.1604316, 1.71299, 0, 0.3921569, 1, 1,
0.3185438, -0.5679857, 3.811327, 0, 0.3882353, 1, 1,
0.3207987, 0.006019739, 1.975519, 0, 0.3803922, 1, 1,
0.3234085, 0.2282195, 0.5463495, 0, 0.3764706, 1, 1,
0.3323762, 1.099656, 0.7612077, 0, 0.3686275, 1, 1,
0.335055, 0.9801968, 1.064342, 0, 0.3647059, 1, 1,
0.3355865, 0.7274778, 0.5871638, 0, 0.3568628, 1, 1,
0.3384383, 0.4172353, -1.253175, 0, 0.3529412, 1, 1,
0.3388594, -1.661247, 2.970897, 0, 0.345098, 1, 1,
0.3393235, 2.008062, 0.7053072, 0, 0.3411765, 1, 1,
0.3426761, -1.018338, 3.723707, 0, 0.3333333, 1, 1,
0.3435746, 0.964344, 1.851194, 0, 0.3294118, 1, 1,
0.3447749, 0.1124942, 1.51567, 0, 0.3215686, 1, 1,
0.3477149, -0.3415368, 2.787426, 0, 0.3176471, 1, 1,
0.34955, 0.5855792, 1.449561, 0, 0.3098039, 1, 1,
0.3515434, 0.08271015, 0.7524522, 0, 0.3058824, 1, 1,
0.3523046, 0.05654139, -0.3449863, 0, 0.2980392, 1, 1,
0.3564788, 0.139506, 1.973877, 0, 0.2901961, 1, 1,
0.3586969, -1.167659, 2.584791, 0, 0.2862745, 1, 1,
0.3637846, 1.110207, 0.1424758, 0, 0.2784314, 1, 1,
0.3685893, 0.8611137, -0.5405697, 0, 0.2745098, 1, 1,
0.3706971, -0.1376162, 0.3962939, 0, 0.2666667, 1, 1,
0.3732758, 0.5792823, 1.856742, 0, 0.2627451, 1, 1,
0.3749003, -1.128552, 4.511237, 0, 0.254902, 1, 1,
0.375506, 0.4850312, 0.2180149, 0, 0.2509804, 1, 1,
0.3759677, 2.155933, 1.172575, 0, 0.2431373, 1, 1,
0.3807192, 0.9482988, 0.7105988, 0, 0.2392157, 1, 1,
0.3821509, 1.517511, -1.3117, 0, 0.2313726, 1, 1,
0.3856342, 1.487966, -1.401212, 0, 0.227451, 1, 1,
0.3874275, -0.3172169, 2.132187, 0, 0.2196078, 1, 1,
0.3881444, 0.3183984, 1.598231, 0, 0.2156863, 1, 1,
0.3885983, -2.218518, 3.764294, 0, 0.2078431, 1, 1,
0.3933614, -1.705218, 4.383758, 0, 0.2039216, 1, 1,
0.3939496, -0.2104848, 2.835683, 0, 0.1960784, 1, 1,
0.395946, -0.745755, 2.410344, 0, 0.1882353, 1, 1,
0.3968814, 0.409819, -0.6236303, 0, 0.1843137, 1, 1,
0.3972918, -0.6382422, 2.716711, 0, 0.1764706, 1, 1,
0.4004004, 0.7068234, 0.4581464, 0, 0.172549, 1, 1,
0.4004157, -0.0781638, 1.142007, 0, 0.1647059, 1, 1,
0.4017153, -2.287378, 4.392237, 0, 0.1607843, 1, 1,
0.4034064, 1.295915, 0.4821067, 0, 0.1529412, 1, 1,
0.4041687, -0.04763344, 1.258216, 0, 0.1490196, 1, 1,
0.405962, 0.4693063, 0.3655762, 0, 0.1411765, 1, 1,
0.4098766, -0.1986917, 2.416146, 0, 0.1372549, 1, 1,
0.4107153, 0.6953472, 0.67542, 0, 0.1294118, 1, 1,
0.4128475, -1.348521, 1.923394, 0, 0.1254902, 1, 1,
0.4139318, 0.2604032, 0.2160685, 0, 0.1176471, 1, 1,
0.4216846, -0.2005264, 3.875699, 0, 0.1137255, 1, 1,
0.4232709, -0.1716471, 3.295171, 0, 0.1058824, 1, 1,
0.4289085, -0.7215422, 3.392832, 0, 0.09803922, 1, 1,
0.4297933, 1.281741, -1.41944, 0, 0.09411765, 1, 1,
0.4380586, 0.05635906, 1.22169, 0, 0.08627451, 1, 1,
0.4389694, -1.41404, 3.932958, 0, 0.08235294, 1, 1,
0.4400345, 1.085596, -1.047388, 0, 0.07450981, 1, 1,
0.4416342, 0.6247063, 1.360714, 0, 0.07058824, 1, 1,
0.4418696, -0.743578, 2.189097, 0, 0.0627451, 1, 1,
0.4446042, -0.1596042, 1.446191, 0, 0.05882353, 1, 1,
0.4454379, -1.368862, 3.622226, 0, 0.05098039, 1, 1,
0.4454777, -0.06962673, 2.51057, 0, 0.04705882, 1, 1,
0.4522706, 0.9798225, 0.4582261, 0, 0.03921569, 1, 1,
0.4628394, 1.33535, 1.202293, 0, 0.03529412, 1, 1,
0.4629014, -0.4804565, 1.32302, 0, 0.02745098, 1, 1,
0.4666767, -1.763584, 2.677832, 0, 0.02352941, 1, 1,
0.4712317, 0.2812669, 0.1199941, 0, 0.01568628, 1, 1,
0.4733873, 1.2292, 0.3418674, 0, 0.01176471, 1, 1,
0.4751959, 0.8733669, 0.3371323, 0, 0.003921569, 1, 1,
0.4773446, 0.5855719, 1.035456, 0.003921569, 0, 1, 1,
0.4805167, 1.127824, -0.4240198, 0.007843138, 0, 1, 1,
0.4814434, 0.6184997, 2.04794, 0.01568628, 0, 1, 1,
0.482796, -1.279346, 3.681694, 0.01960784, 0, 1, 1,
0.4884322, -1.624127, 3.684046, 0.02745098, 0, 1, 1,
0.494305, -1.376989, 1.238818, 0.03137255, 0, 1, 1,
0.4945617, -0.8988381, 1.851914, 0.03921569, 0, 1, 1,
0.5021743, 0.01741515, 1.30336, 0.04313726, 0, 1, 1,
0.5022283, 0.4594095, 0.8424546, 0.05098039, 0, 1, 1,
0.5054104, -0.2597466, 2.26457, 0.05490196, 0, 1, 1,
0.505661, -1.150232, 2.318615, 0.0627451, 0, 1, 1,
0.5194559, 1.417671, 0.3729357, 0.06666667, 0, 1, 1,
0.5214086, -0.5367894, 1.94713, 0.07450981, 0, 1, 1,
0.5317851, 1.224889, -1.363476, 0.07843138, 0, 1, 1,
0.5319067, -1.077431, 2.670702, 0.08627451, 0, 1, 1,
0.531908, 0.4379094, 2.999599, 0.09019608, 0, 1, 1,
0.5361082, -1.981931, 2.664864, 0.09803922, 0, 1, 1,
0.5375139, -0.8567927, 2.647568, 0.1058824, 0, 1, 1,
0.5391183, -0.1489617, 2.046484, 0.1098039, 0, 1, 1,
0.5429165, 1.011244, -0.3851035, 0.1176471, 0, 1, 1,
0.5442287, 1.048124, 2.771317, 0.1215686, 0, 1, 1,
0.5451159, -0.6375607, 2.241102, 0.1294118, 0, 1, 1,
0.5481971, -0.2876746, 2.535438, 0.1333333, 0, 1, 1,
0.548921, 1.3557, 0.3675101, 0.1411765, 0, 1, 1,
0.5531852, -0.9210803, 2.93915, 0.145098, 0, 1, 1,
0.5571252, -0.7964721, 2.1168, 0.1529412, 0, 1, 1,
0.5576908, -0.4782245, 2.886672, 0.1568628, 0, 1, 1,
0.5577195, 1.726446, 1.318045, 0.1647059, 0, 1, 1,
0.5602401, 0.3229946, -0.2923013, 0.1686275, 0, 1, 1,
0.5660053, 0.291024, 1.07259, 0.1764706, 0, 1, 1,
0.5670606, -0.8164256, 1.574538, 0.1803922, 0, 1, 1,
0.5674205, 2.273394, -0.7369287, 0.1882353, 0, 1, 1,
0.5716261, 0.2906323, 1.520322, 0.1921569, 0, 1, 1,
0.5748951, 1.169175, 2.499448, 0.2, 0, 1, 1,
0.5783848, 0.7239426, 1.080052, 0.2078431, 0, 1, 1,
0.5801699, -0.7772968, 0.9064279, 0.2117647, 0, 1, 1,
0.5832536, -0.8208637, 4.529881, 0.2196078, 0, 1, 1,
0.5834516, 1.213093, 1.138649, 0.2235294, 0, 1, 1,
0.5842025, 1.203173, 1.60114, 0.2313726, 0, 1, 1,
0.5854161, 1.285136, 0.9488588, 0.2352941, 0, 1, 1,
0.5854446, 1.592086, 1.085526, 0.2431373, 0, 1, 1,
0.5913364, -0.5259111, 1.101396, 0.2470588, 0, 1, 1,
0.594223, -0.5525636, 3.337538, 0.254902, 0, 1, 1,
0.594666, -1.884097, 1.770856, 0.2588235, 0, 1, 1,
0.5955163, -0.1604503, 3.249678, 0.2666667, 0, 1, 1,
0.5995007, -1.333901, 3.715443, 0.2705882, 0, 1, 1,
0.5995331, -0.4378542, 1.037623, 0.2784314, 0, 1, 1,
0.599614, -1.382233, 2.18424, 0.282353, 0, 1, 1,
0.6013083, 0.7484191, 1.54745, 0.2901961, 0, 1, 1,
0.6033967, 0.5104443, 3.037968, 0.2941177, 0, 1, 1,
0.6101526, -0.7746363, 2.330995, 0.3019608, 0, 1, 1,
0.6123696, -0.3379043, 3.698829, 0.3098039, 0, 1, 1,
0.6238253, -0.8401781, 1.438945, 0.3137255, 0, 1, 1,
0.6292052, 0.2190674, 2.210876, 0.3215686, 0, 1, 1,
0.6326799, 0.5378328, 2.596875, 0.3254902, 0, 1, 1,
0.632697, -1.252289, 0.6551021, 0.3333333, 0, 1, 1,
0.6354736, 2.454168, 1.688447, 0.3372549, 0, 1, 1,
0.6363636, -0.3633797, 2.47433, 0.345098, 0, 1, 1,
0.637373, -0.1246769, 0.8670658, 0.3490196, 0, 1, 1,
0.638762, 0.9424714, 0.1100624, 0.3568628, 0, 1, 1,
0.6396019, -1.447391, 1.797544, 0.3607843, 0, 1, 1,
0.6433056, 0.6262212, 0.940001, 0.3686275, 0, 1, 1,
0.6433554, 1.627693, -0.5557818, 0.372549, 0, 1, 1,
0.6487236, 1.062914, 0.1499802, 0.3803922, 0, 1, 1,
0.6494586, -1.557481, 2.356404, 0.3843137, 0, 1, 1,
0.650149, 0.8220507, 2.474922, 0.3921569, 0, 1, 1,
0.6585583, -0.3780165, 2.302336, 0.3960784, 0, 1, 1,
0.6630519, 0.6124976, 1.293463, 0.4039216, 0, 1, 1,
0.6653025, 0.2391122, 0.7847133, 0.4117647, 0, 1, 1,
0.6702878, 1.294348, 1.197049, 0.4156863, 0, 1, 1,
0.6720513, -1.761874, 3.64949, 0.4235294, 0, 1, 1,
0.6738916, 0.2623329, 0.8748361, 0.427451, 0, 1, 1,
0.6779715, -0.981298, 2.166627, 0.4352941, 0, 1, 1,
0.6906707, 2.098248, 0.2493435, 0.4392157, 0, 1, 1,
0.6968859, -0.3987851, 1.00252, 0.4470588, 0, 1, 1,
0.6979474, -0.9498058, 2.255282, 0.4509804, 0, 1, 1,
0.7004985, -1.779348, 3.695312, 0.4588235, 0, 1, 1,
0.7048047, 1.208103, -0.2182212, 0.4627451, 0, 1, 1,
0.7097761, 1.510382, 0.090554, 0.4705882, 0, 1, 1,
0.7100639, 0.2149438, 1.599816, 0.4745098, 0, 1, 1,
0.7109803, -1.229638, 3.379879, 0.4823529, 0, 1, 1,
0.7167522, 1.169255, -0.7990837, 0.4862745, 0, 1, 1,
0.716929, -0.1870981, 0.2015172, 0.4941176, 0, 1, 1,
0.720693, -0.02492543, 2.025787, 0.5019608, 0, 1, 1,
0.724116, 0.01250182, 3.525297, 0.5058824, 0, 1, 1,
0.7284954, 2.394331, -0.8845168, 0.5137255, 0, 1, 1,
0.7293664, 0.1171961, -0.5379512, 0.5176471, 0, 1, 1,
0.730244, -0.1628547, 2.133828, 0.5254902, 0, 1, 1,
0.7378644, 0.363332, 1.166585, 0.5294118, 0, 1, 1,
0.7395086, -0.3587164, 1.676913, 0.5372549, 0, 1, 1,
0.7401695, 0.9687035, 0.2175864, 0.5411765, 0, 1, 1,
0.7436657, -0.0753374, 1.563151, 0.5490196, 0, 1, 1,
0.7438303, 1.540942, 1.081571, 0.5529412, 0, 1, 1,
0.7489319, 2.39774, -1.64139, 0.5607843, 0, 1, 1,
0.7523673, -1.018745, 1.852738, 0.5647059, 0, 1, 1,
0.7564709, 0.1134218, -0.4384425, 0.572549, 0, 1, 1,
0.7701252, 0.1951919, 1.008854, 0.5764706, 0, 1, 1,
0.7715452, 0.3487814, 0.7294837, 0.5843138, 0, 1, 1,
0.7766581, 0.02006451, 1.343119, 0.5882353, 0, 1, 1,
0.7838998, -0.7398521, 2.936447, 0.5960785, 0, 1, 1,
0.7866902, -1.059563, 2.272423, 0.6039216, 0, 1, 1,
0.7878013, -0.3435154, 1.54033, 0.6078432, 0, 1, 1,
0.7918146, 1.000124, 0.05398214, 0.6156863, 0, 1, 1,
0.7922693, -0.4272971, 2.702423, 0.6196079, 0, 1, 1,
0.7923097, -1.974644, 3.44869, 0.627451, 0, 1, 1,
0.7937919, -0.8836862, 4.010194, 0.6313726, 0, 1, 1,
0.7960774, -0.2089859, 0.7323673, 0.6392157, 0, 1, 1,
0.8008088, 0.2420332, 1.90627, 0.6431373, 0, 1, 1,
0.8015002, -0.3226861, 2.225399, 0.6509804, 0, 1, 1,
0.8016465, 0.6645886, 0.6796909, 0.654902, 0, 1, 1,
0.8057028, -0.1569028, 2.677882, 0.6627451, 0, 1, 1,
0.8126612, 1.557527, -0.5092725, 0.6666667, 0, 1, 1,
0.8158242, -0.1070114, 0.3626263, 0.6745098, 0, 1, 1,
0.8172771, -1.246698, 2.363324, 0.6784314, 0, 1, 1,
0.8198447, -0.7359903, 1.800595, 0.6862745, 0, 1, 1,
0.8334429, 0.2407481, 1.663521, 0.6901961, 0, 1, 1,
0.8343397, -0.5895641, 2.36001, 0.6980392, 0, 1, 1,
0.8360402, -1.952257, 1.44933, 0.7058824, 0, 1, 1,
0.8368858, 0.8865194, 1.565427, 0.7098039, 0, 1, 1,
0.8400535, -0.7805374, 1.239084, 0.7176471, 0, 1, 1,
0.8419936, 0.6989367, -0.8140527, 0.7215686, 0, 1, 1,
0.8462613, -0.2481894, 0.3848817, 0.7294118, 0, 1, 1,
0.8487865, -0.3140434, 1.781866, 0.7333333, 0, 1, 1,
0.8556382, -1.651616, 1.777781, 0.7411765, 0, 1, 1,
0.858424, -0.8006768, 2.851677, 0.7450981, 0, 1, 1,
0.8607486, -0.9845566, 2.565811, 0.7529412, 0, 1, 1,
0.8607535, 0.1267441, 2.82316, 0.7568628, 0, 1, 1,
0.8681971, -1.352164, 3.836087, 0.7647059, 0, 1, 1,
0.8705281, -0.1784746, 4.797606, 0.7686275, 0, 1, 1,
0.8717703, -0.3423766, 2.877224, 0.7764706, 0, 1, 1,
0.8727276, -0.1561223, 3.163543, 0.7803922, 0, 1, 1,
0.8741888, 0.4214844, 3.29002, 0.7882353, 0, 1, 1,
0.8786069, -0.4426986, 1.053347, 0.7921569, 0, 1, 1,
0.8792126, -0.09742128, 1.813045, 0.8, 0, 1, 1,
0.8793128, -0.1881613, 2.948598, 0.8078431, 0, 1, 1,
0.8856074, -0.2304617, 0.713412, 0.8117647, 0, 1, 1,
0.8896059, 0.08056326, 2.729786, 0.8196079, 0, 1, 1,
0.8899957, 1.232363, 1.250096, 0.8235294, 0, 1, 1,
0.8900899, -0.8555151, 1.435077, 0.8313726, 0, 1, 1,
0.8910719, 0.584347, -0.07848599, 0.8352941, 0, 1, 1,
0.8950117, 2.083978, 1.633998, 0.8431373, 0, 1, 1,
0.898971, 0.2867908, 0.9641579, 0.8470588, 0, 1, 1,
0.8992283, 0.7540048, 0.2829112, 0.854902, 0, 1, 1,
0.9074386, -0.07355196, 1.273944, 0.8588235, 0, 1, 1,
0.9108465, 0.1688807, 2.541188, 0.8666667, 0, 1, 1,
0.9112812, 1.041371, 1.575601, 0.8705882, 0, 1, 1,
0.9127551, 0.6370345, -0.4863354, 0.8784314, 0, 1, 1,
0.9130555, -1.401702, 2.752048, 0.8823529, 0, 1, 1,
0.9201817, -0.2864185, -0.2645465, 0.8901961, 0, 1, 1,
0.9255003, 1.309182, 1.133583, 0.8941177, 0, 1, 1,
0.9313007, 0.2175623, 2.246075, 0.9019608, 0, 1, 1,
0.935184, -0.5086034, 1.956635, 0.9098039, 0, 1, 1,
0.9361209, 0.01830981, 2.646259, 0.9137255, 0, 1, 1,
0.9403289, 0.7828588, -0.1788674, 0.9215686, 0, 1, 1,
0.9420639, 0.5294645, 2.388257, 0.9254902, 0, 1, 1,
0.9426007, 0.2008696, 2.389199, 0.9333333, 0, 1, 1,
0.9427911, 0.4130852, 0.2391577, 0.9372549, 0, 1, 1,
0.9453614, 0.8935781, 2.135318, 0.945098, 0, 1, 1,
0.9491345, -1.192054, 1.623417, 0.9490196, 0, 1, 1,
0.9539866, -1.383415, 2.851253, 0.9568627, 0, 1, 1,
0.9541788, -1.552314, 3.296711, 0.9607843, 0, 1, 1,
0.959021, 0.8514748, 1.076546, 0.9686275, 0, 1, 1,
0.9602576, -1.035933, 1.257365, 0.972549, 0, 1, 1,
0.960941, -0.1420254, 1.713964, 0.9803922, 0, 1, 1,
0.9621845, -0.9474441, 3.55676, 0.9843137, 0, 1, 1,
0.9672127, -1.624312, 3.204164, 0.9921569, 0, 1, 1,
0.9735777, 0.3308637, 0.2026582, 0.9960784, 0, 1, 1,
0.9778553, -0.9449127, 1.412292, 1, 0, 0.9960784, 1,
0.9779528, -0.7692888, 3.528177, 1, 0, 0.9882353, 1,
0.980841, -1.343682, 2.124031, 1, 0, 0.9843137, 1,
0.9914332, 0.04788269, 2.024606, 1, 0, 0.9764706, 1,
0.9990889, -1.467881, 2.366685, 1, 0, 0.972549, 1,
1.002943, -1.035187, 2.671155, 1, 0, 0.9647059, 1,
1.01198, 2.295325, 2.700072, 1, 0, 0.9607843, 1,
1.01338, 0.6925682, 0.2999412, 1, 0, 0.9529412, 1,
1.02357, -0.951269, 2.219263, 1, 0, 0.9490196, 1,
1.02364, -0.9727539, 0.7211095, 1, 0, 0.9411765, 1,
1.024907, 0.4179652, 1.285971, 1, 0, 0.9372549, 1,
1.028842, 0.7583341, 1.570791, 1, 0, 0.9294118, 1,
1.029785, 0.8091726, 1.420118, 1, 0, 0.9254902, 1,
1.034878, 1.260847, 0.8985408, 1, 0, 0.9176471, 1,
1.047139, -0.9991028, 0.9012405, 1, 0, 0.9137255, 1,
1.050196, -0.2592965, 2.973522, 1, 0, 0.9058824, 1,
1.053571, -0.6102551, 0.499106, 1, 0, 0.9019608, 1,
1.058834, -0.1964797, 1.881399, 1, 0, 0.8941177, 1,
1.059679, 0.5660003, 0.5525954, 1, 0, 0.8862745, 1,
1.060748, 0.2166171, -1.096377, 1, 0, 0.8823529, 1,
1.062467, 2.703908, 1.318245, 1, 0, 0.8745098, 1,
1.066902, 1.259721, 0.1880217, 1, 0, 0.8705882, 1,
1.069745, 1.737397, 1.019152, 1, 0, 0.8627451, 1,
1.074124, 1.580359, -0.8697703, 1, 0, 0.8588235, 1,
1.086432, -1.087941, 2.819905, 1, 0, 0.8509804, 1,
1.090153, -1.898983, 2.766831, 1, 0, 0.8470588, 1,
1.096062, -0.2891774, 1.393275, 1, 0, 0.8392157, 1,
1.10066, -0.560564, 3.272859, 1, 0, 0.8352941, 1,
1.101328, -0.9678439, 0.1073852, 1, 0, 0.827451, 1,
1.10627, 0.5403555, 1.891003, 1, 0, 0.8235294, 1,
1.108915, -0.4138944, 1.512531, 1, 0, 0.8156863, 1,
1.120305, 0.6163888, 1.528834, 1, 0, 0.8117647, 1,
1.123639, -0.6292809, 0.8610308, 1, 0, 0.8039216, 1,
1.124802, -1.605337, 1.839647, 1, 0, 0.7960784, 1,
1.125074, 1.418101, 0.4891297, 1, 0, 0.7921569, 1,
1.127099, -0.9311073, 2.868737, 1, 0, 0.7843137, 1,
1.128555, -0.03707894, 2.446961, 1, 0, 0.7803922, 1,
1.128767, -0.2626098, 1.866805, 1, 0, 0.772549, 1,
1.131058, -0.3116097, 1.117695, 1, 0, 0.7686275, 1,
1.132575, 2.275855, -1.869759, 1, 0, 0.7607843, 1,
1.132672, 1.876764, -0.02843693, 1, 0, 0.7568628, 1,
1.137259, 0.07070515, 0.1913673, 1, 0, 0.7490196, 1,
1.145332, -0.422303, 3.051611, 1, 0, 0.7450981, 1,
1.145939, 0.5355697, 1.251613, 1, 0, 0.7372549, 1,
1.15963, -0.8690262, 3.877922, 1, 0, 0.7333333, 1,
1.160498, 1.262196, 1.046197, 1, 0, 0.7254902, 1,
1.167987, -0.1011339, 1.939066, 1, 0, 0.7215686, 1,
1.16929, -0.8280672, 2.657562, 1, 0, 0.7137255, 1,
1.173021, 1.646505, 0.916834, 1, 0, 0.7098039, 1,
1.17401, 1.313501, 1.529104, 1, 0, 0.7019608, 1,
1.176597, -0.7366914, 2.041598, 1, 0, 0.6941177, 1,
1.179363, 0.6437267, -0.9861661, 1, 0, 0.6901961, 1,
1.180215, -0.6434882, 1.820536, 1, 0, 0.682353, 1,
1.190872, -0.5118365, 2.207569, 1, 0, 0.6784314, 1,
1.19179, 0.6051064, 0.9929878, 1, 0, 0.6705883, 1,
1.198345, 0.3059193, 3.206868, 1, 0, 0.6666667, 1,
1.202036, -0.3072275, 1.143286, 1, 0, 0.6588235, 1,
1.213684, 0.440602, 1.396607, 1, 0, 0.654902, 1,
1.221603, -0.1508499, 1.522757, 1, 0, 0.6470588, 1,
1.23284, 0.4114744, 1.088563, 1, 0, 0.6431373, 1,
1.235615, -1.292391, 2.308273, 1, 0, 0.6352941, 1,
1.236936, -0.3766778, 0.6762542, 1, 0, 0.6313726, 1,
1.237538, 1.147734, -0.983878, 1, 0, 0.6235294, 1,
1.239338, 0.8885893, 1.978386, 1, 0, 0.6196079, 1,
1.27114, -0.9544348, 3.728261, 1, 0, 0.6117647, 1,
1.272454, -1.237628, 3.045542, 1, 0, 0.6078432, 1,
1.272623, 0.4446559, -0.6514645, 1, 0, 0.6, 1,
1.273838, 0.8982067, 1.15255, 1, 0, 0.5921569, 1,
1.276339, 0.9364526, 3.143927, 1, 0, 0.5882353, 1,
1.276831, 0.2306038, -0.04749689, 1, 0, 0.5803922, 1,
1.278315, 1.081917, 2.578504, 1, 0, 0.5764706, 1,
1.285968, -1.221605, 2.50972, 1, 0, 0.5686275, 1,
1.288247, -0.2652742, 1.526844, 1, 0, 0.5647059, 1,
1.293408, 0.004300137, 0.3752503, 1, 0, 0.5568628, 1,
1.308347, 0.1167083, 1.49323, 1, 0, 0.5529412, 1,
1.310257, -1.028117, 2.238444, 1, 0, 0.5450981, 1,
1.310939, -0.9185327, 2.683817, 1, 0, 0.5411765, 1,
1.312761, 0.1814779, 1.780061, 1, 0, 0.5333334, 1,
1.323075, -0.699336, 2.328504, 1, 0, 0.5294118, 1,
1.323297, 0.5246975, 0.1298511, 1, 0, 0.5215687, 1,
1.330835, -0.1355495, -0.1621704, 1, 0, 0.5176471, 1,
1.333132, 1.927798, 0.1307628, 1, 0, 0.509804, 1,
1.348759, 0.6541308, 1.556832, 1, 0, 0.5058824, 1,
1.357244, 0.6010242, 1.177063, 1, 0, 0.4980392, 1,
1.361325, 0.7633092, 0.08830988, 1, 0, 0.4901961, 1,
1.371735, -0.6013349, 0.8249545, 1, 0, 0.4862745, 1,
1.391152, 1.38346, 1.017047, 1, 0, 0.4784314, 1,
1.394018, -0.1836733, 1.241517, 1, 0, 0.4745098, 1,
1.396341, -0.9131553, 4.151129, 1, 0, 0.4666667, 1,
1.40783, -3.013659, 0.1949456, 1, 0, 0.4627451, 1,
1.410612, -0.3860087, -0.7326145, 1, 0, 0.454902, 1,
1.421376, 0.7718909, 1.474695, 1, 0, 0.4509804, 1,
1.42831, -1.552546, 1.908039, 1, 0, 0.4431373, 1,
1.434151, 1.232603, -0.2341505, 1, 0, 0.4392157, 1,
1.435004, -0.6810584, 1.409825, 1, 0, 0.4313726, 1,
1.435662, 0.3695391, 1.264623, 1, 0, 0.427451, 1,
1.443829, -1.262124, 2.410707, 1, 0, 0.4196078, 1,
1.445545, 0.4562082, 0.9290494, 1, 0, 0.4156863, 1,
1.461499, 1.619774, -0.312247, 1, 0, 0.4078431, 1,
1.462092, 0.5360151, 0.1342351, 1, 0, 0.4039216, 1,
1.468636, 0.2420302, 0.725289, 1, 0, 0.3960784, 1,
1.485742, -0.7161585, 0.9774675, 1, 0, 0.3882353, 1,
1.489012, 0.9868362, 0.6691194, 1, 0, 0.3843137, 1,
1.493574, -1.232574, 2.170671, 1, 0, 0.3764706, 1,
1.495084, 0.9744296, 2.043892, 1, 0, 0.372549, 1,
1.510137, 2.028029, 1.62097, 1, 0, 0.3647059, 1,
1.518674, -1.223047, 1.321036, 1, 0, 0.3607843, 1,
1.524046, -0.8232986, 2.172809, 1, 0, 0.3529412, 1,
1.526926, 1.945135, 1.531424, 1, 0, 0.3490196, 1,
1.529338, 0.02341961, 1.844069, 1, 0, 0.3411765, 1,
1.531706, -1.082686, 2.114684, 1, 0, 0.3372549, 1,
1.544952, -0.1038214, 1.249921, 1, 0, 0.3294118, 1,
1.553535, 0.9269338, 0.8567951, 1, 0, 0.3254902, 1,
1.578288, 0.7440845, 1.665618, 1, 0, 0.3176471, 1,
1.590639, 1.030949, 0.4504354, 1, 0, 0.3137255, 1,
1.605466, 0.2272644, 2.809361, 1, 0, 0.3058824, 1,
1.623794, -0.1917284, 0.1614104, 1, 0, 0.2980392, 1,
1.624885, -0.06240162, 2.434354, 1, 0, 0.2941177, 1,
1.648373, -0.3417075, 2.942546, 1, 0, 0.2862745, 1,
1.654674, 0.6410319, 1.860144, 1, 0, 0.282353, 1,
1.667543, -0.846756, 1.258308, 1, 0, 0.2745098, 1,
1.682269, 0.1559017, 1.506898, 1, 0, 0.2705882, 1,
1.688687, -0.8564937, 0.3120058, 1, 0, 0.2627451, 1,
1.689113, 0.7005546, 0.9624984, 1, 0, 0.2588235, 1,
1.693593, 1.205653, 0.5821392, 1, 0, 0.2509804, 1,
1.695722, -2.618334, 2.421698, 1, 0, 0.2470588, 1,
1.696413, -0.6086084, 2.230909, 1, 0, 0.2392157, 1,
1.719375, 0.5628674, 0.7197417, 1, 0, 0.2352941, 1,
1.753799, 0.251748, 1.386365, 1, 0, 0.227451, 1,
1.780624, 0.7232856, 2.327937, 1, 0, 0.2235294, 1,
1.78099, 0.2957696, 2.7886, 1, 0, 0.2156863, 1,
1.808076, -0.7560689, 1.62459, 1, 0, 0.2117647, 1,
1.813183, -1.103282, -0.06773999, 1, 0, 0.2039216, 1,
1.831715, -0.352809, 1.814498, 1, 0, 0.1960784, 1,
1.835933, -2.6183, 3.145372, 1, 0, 0.1921569, 1,
1.841488, 1.509979, -0.5497314, 1, 0, 0.1843137, 1,
1.841542, 0.5129336, 2.766466, 1, 0, 0.1803922, 1,
1.892624, -0.328761, 0.9554924, 1, 0, 0.172549, 1,
1.897756, 0.8253697, 0.9622661, 1, 0, 0.1686275, 1,
1.912416, -0.6707489, 1.390067, 1, 0, 0.1607843, 1,
1.936357, 2.460529, 2.822545, 1, 0, 0.1568628, 1,
1.957213, 0.3155994, 1.498526, 1, 0, 0.1490196, 1,
1.977576, -1.276, 2.941028, 1, 0, 0.145098, 1,
2.037005, -0.00480306, 0.9724389, 1, 0, 0.1372549, 1,
2.045033, 0.2264079, 0.4482667, 1, 0, 0.1333333, 1,
2.052319, -0.750446, 2.601216, 1, 0, 0.1254902, 1,
2.105748, -2.276105, 3.460209, 1, 0, 0.1215686, 1,
2.131196, -1.11658, 1.068025, 1, 0, 0.1137255, 1,
2.164147, -0.2262362, 0.5706248, 1, 0, 0.1098039, 1,
2.178993, -0.9431264, 3.578107, 1, 0, 0.1019608, 1,
2.236077, 1.104791, 1.843686, 1, 0, 0.09411765, 1,
2.253413, 1.40672, 0.0948987, 1, 0, 0.09019608, 1,
2.261267, -0.8062304, 1.36773, 1, 0, 0.08235294, 1,
2.278548, 1.155619, 1.406765, 1, 0, 0.07843138, 1,
2.282655, -0.1646916, 0.451429, 1, 0, 0.07058824, 1,
2.29177, -0.7811654, 2.081788, 1, 0, 0.06666667, 1,
2.415072, -0.8854879, 1.795002, 1, 0, 0.05882353, 1,
2.494708, 1.80134, -0.4781031, 1, 0, 0.05490196, 1,
2.585576, 0.2328597, 2.305536, 1, 0, 0.04705882, 1,
2.599852, -1.900142, 2.687728, 1, 0, 0.04313726, 1,
2.632154, -2.537935, 3.774457, 1, 0, 0.03529412, 1,
2.661163, -0.4176908, 2.147653, 1, 0, 0.03137255, 1,
2.797754, -0.7270244, 1.528299, 1, 0, 0.02352941, 1,
2.801846, -0.5846933, 2.230698, 1, 0, 0.01960784, 1,
2.993162, 1.859244, 1.660145, 1, 0, 0.01176471, 1,
3.03832, -0.1926817, 1.092637, 1, 0, 0.007843138, 1
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
0.07593238, -3.982786, -7.444686, 0, -0.5, 0.5, 0.5,
0.07593238, -3.982786, -7.444686, 1, -0.5, 0.5, 0.5,
0.07593238, -3.982786, -7.444686, 1, 1.5, 0.5, 0.5,
0.07593238, -3.982786, -7.444686, 0, 1.5, 0.5, 0.5
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
-3.890704, -0.1548752, -7.444686, 0, -0.5, 0.5, 0.5,
-3.890704, -0.1548752, -7.444686, 1, -0.5, 0.5, 0.5,
-3.890704, -0.1548752, -7.444686, 1, 1.5, 0.5, 0.5,
-3.890704, -0.1548752, -7.444686, 0, 1.5, 0.5, 0.5
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
-3.890704, -3.982786, -0.2211783, 0, -0.5, 0.5, 0.5,
-3.890704, -3.982786, -0.2211783, 1, -0.5, 0.5, 0.5,
-3.890704, -3.982786, -0.2211783, 1, 1.5, 0.5, 0.5,
-3.890704, -3.982786, -0.2211783, 0, 1.5, 0.5, 0.5
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
-2, -3.099422, -5.777722,
3, -3.099422, -5.777722,
-2, -3.099422, -5.777722,
-2, -3.246649, -6.05555,
-1, -3.099422, -5.777722,
-1, -3.246649, -6.05555,
0, -3.099422, -5.777722,
0, -3.246649, -6.05555,
1, -3.099422, -5.777722,
1, -3.246649, -6.05555,
2, -3.099422, -5.777722,
2, -3.246649, -6.05555,
3, -3.099422, -5.777722,
3, -3.246649, -6.05555
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
-2, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
-2, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
-2, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
-2, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5,
-1, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
-1, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
-1, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
-1, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5,
0, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
0, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
0, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
0, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5,
1, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
1, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
1, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
1, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5,
2, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
2, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
2, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
2, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5,
3, -3.541104, -6.611204, 0, -0.5, 0.5, 0.5,
3, -3.541104, -6.611204, 1, -0.5, 0.5, 0.5,
3, -3.541104, -6.611204, 1, 1.5, 0.5, 0.5,
3, -3.541104, -6.611204, 0, 1.5, 0.5, 0.5
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
-2.975327, -3, -5.777722,
-2.975327, 2, -5.777722,
-2.975327, -3, -5.777722,
-3.127889, -3, -6.05555,
-2.975327, -2, -5.777722,
-3.127889, -2, -6.05555,
-2.975327, -1, -5.777722,
-3.127889, -1, -6.05555,
-2.975327, 0, -5.777722,
-3.127889, 0, -6.05555,
-2.975327, 1, -5.777722,
-3.127889, 1, -6.05555,
-2.975327, 2, -5.777722,
-3.127889, 2, -6.05555
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
-3.433015, -3, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, -3, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, -3, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, -3, -6.611204, 0, 1.5, 0.5, 0.5,
-3.433015, -2, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, -2, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, -2, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, -2, -6.611204, 0, 1.5, 0.5, 0.5,
-3.433015, -1, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, -1, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, -1, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, -1, -6.611204, 0, 1.5, 0.5, 0.5,
-3.433015, 0, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, 0, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, 0, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, 0, -6.611204, 0, 1.5, 0.5, 0.5,
-3.433015, 1, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, 1, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, 1, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, 1, -6.611204, 0, 1.5, 0.5, 0.5,
-3.433015, 2, -6.611204, 0, -0.5, 0.5, 0.5,
-3.433015, 2, -6.611204, 1, -0.5, 0.5, 0.5,
-3.433015, 2, -6.611204, 1, 1.5, 0.5, 0.5,
-3.433015, 2, -6.611204, 0, 1.5, 0.5, 0.5
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
-2.975327, -3.099422, -4,
-2.975327, -3.099422, 4,
-2.975327, -3.099422, -4,
-3.127889, -3.246649, -4,
-2.975327, -3.099422, -2,
-3.127889, -3.246649, -2,
-2.975327, -3.099422, 0,
-3.127889, -3.246649, 0,
-2.975327, -3.099422, 2,
-3.127889, -3.246649, 2,
-2.975327, -3.099422, 4,
-3.127889, -3.246649, 4
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
-3.433015, -3.541104, -4, 0, -0.5, 0.5, 0.5,
-3.433015, -3.541104, -4, 1, -0.5, 0.5, 0.5,
-3.433015, -3.541104, -4, 1, 1.5, 0.5, 0.5,
-3.433015, -3.541104, -4, 0, 1.5, 0.5, 0.5,
-3.433015, -3.541104, -2, 0, -0.5, 0.5, 0.5,
-3.433015, -3.541104, -2, 1, -0.5, 0.5, 0.5,
-3.433015, -3.541104, -2, 1, 1.5, 0.5, 0.5,
-3.433015, -3.541104, -2, 0, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 0, 0, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 0, 1, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 0, 1, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 0, 0, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 2, 0, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 2, 1, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 2, 1, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 2, 0, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 4, 0, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 4, 1, -0.5, 0.5, 0.5,
-3.433015, -3.541104, 4, 1, 1.5, 0.5, 0.5,
-3.433015, -3.541104, 4, 0, 1.5, 0.5, 0.5
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
-2.975327, -3.099422, -5.777722,
-2.975327, 2.789672, -5.777722,
-2.975327, -3.099422, 5.335366,
-2.975327, 2.789672, 5.335366,
-2.975327, -3.099422, -5.777722,
-2.975327, -3.099422, 5.335366,
-2.975327, 2.789672, -5.777722,
-2.975327, 2.789672, 5.335366,
-2.975327, -3.099422, -5.777722,
3.127191, -3.099422, -5.777722,
-2.975327, -3.099422, 5.335366,
3.127191, -3.099422, 5.335366,
-2.975327, 2.789672, -5.777722,
3.127191, 2.789672, -5.777722,
-2.975327, 2.789672, 5.335366,
3.127191, 2.789672, 5.335366,
3.127191, -3.099422, -5.777722,
3.127191, 2.789672, -5.777722,
3.127191, -3.099422, 5.335366,
3.127191, 2.789672, 5.335366,
3.127191, -3.099422, -5.777722,
3.127191, -3.099422, 5.335366,
3.127191, 2.789672, -5.777722,
3.127191, 2.789672, 5.335366
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
var radius = 7.464714;
var distance = 33.21136;
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
mvMatrix.translate( -0.07593238, 0.1548752, 0.2211783 );
mvMatrix.scale( 1.322568, 1.370499, 0.7262603 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21136);
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
aniline<-read.table("aniline.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aniline$V2
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
```

```r
y<-aniline$V3
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
```

```r
z<-aniline$V4
```

```
## Error in eval(expr, envir, enclos): object 'aniline' not found
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
-2.886455, 0.06455023, -3.078531, 0, 0, 1, 1, 1,
-2.880016, 1.698422, -0.9879974, 1, 0, 0, 1, 1,
-2.422529, -0.5653715, -1.378056, 1, 0, 0, 1, 1,
-2.39179, 1.171433, -0.03017018, 1, 0, 0, 1, 1,
-2.38209, 1.224023, -0.9567422, 1, 0, 0, 1, 1,
-2.353849, -0.8441779, -2.732358, 1, 0, 0, 1, 1,
-2.345455, -0.1288579, -2.934812, 0, 0, 0, 1, 1,
-2.311622, -0.5787956, -2.947064, 0, 0, 0, 1, 1,
-2.285737, -1.025787, -0.697467, 0, 0, 0, 1, 1,
-2.21995, -1.111543, -1.575634, 0, 0, 0, 1, 1,
-2.169998, 1.255993, -1.948878, 0, 0, 0, 1, 1,
-2.126368, 1.607551, -2.220365, 0, 0, 0, 1, 1,
-2.114842, -1.545437, -1.907444, 0, 0, 0, 1, 1,
-2.107433, -0.7395192, -2.919551, 1, 1, 1, 1, 1,
-2.079633, 0.4975852, -1.500102, 1, 1, 1, 1, 1,
-2.070896, -0.03614458, -2.400511, 1, 1, 1, 1, 1,
-2.00975, 0.2648537, -0.7101275, 1, 1, 1, 1, 1,
-2.005473, -1.51899, -2.196695, 1, 1, 1, 1, 1,
-1.996355, 1.931144, -1.195183, 1, 1, 1, 1, 1,
-1.972228, -0.2216345, -1.623463, 1, 1, 1, 1, 1,
-1.948021, 1.184677, -1.19752, 1, 1, 1, 1, 1,
-1.936489, -0.2321235, -2.402831, 1, 1, 1, 1, 1,
-1.916491, 0.1681464, -2.206351, 1, 1, 1, 1, 1,
-1.902139, 0.5454337, -1.95601, 1, 1, 1, 1, 1,
-1.893878, 0.1012041, -1.19502, 1, 1, 1, 1, 1,
-1.886151, -0.7315511, -2.269245, 1, 1, 1, 1, 1,
-1.885622, 0.04212509, -2.329056, 1, 1, 1, 1, 1,
-1.861365, 0.7548629, -0.8272867, 1, 1, 1, 1, 1,
-1.843607, 0.1033666, -0.1220071, 0, 0, 1, 1, 1,
-1.828548, -1.230722, -0.7825505, 1, 0, 0, 1, 1,
-1.810639, 0.6632906, -2.067618, 1, 0, 0, 1, 1,
-1.795032, -0.7199332, -2.188991, 1, 0, 0, 1, 1,
-1.791472, -1.948343, -2.2226, 1, 0, 0, 1, 1,
-1.753063, -0.6294534, -2.230304, 1, 0, 0, 1, 1,
-1.751508, -1.302318, -2.019507, 0, 0, 0, 1, 1,
-1.748411, 0.5125135, -0.7340158, 0, 0, 0, 1, 1,
-1.748026, -1.757706, -2.272221, 0, 0, 0, 1, 1,
-1.731162, -2.471303, -2.027665, 0, 0, 0, 1, 1,
-1.726949, 0.1594514, -0.7693415, 0, 0, 0, 1, 1,
-1.724041, 0.2734243, -2.011117, 0, 0, 0, 1, 1,
-1.720731, 0.834563, -1.341986, 0, 0, 0, 1, 1,
-1.707608, -1.16411, -0.430734, 1, 1, 1, 1, 1,
-1.698605, 2.123729, 0.1036353, 1, 1, 1, 1, 1,
-1.684883, 0.981863, -1.666699, 1, 1, 1, 1, 1,
-1.67667, 0.6459924, -0.3871423, 1, 1, 1, 1, 1,
-1.675808, 0.4997862, -1.904813, 1, 1, 1, 1, 1,
-1.667285, 1.055198, -0.03456527, 1, 1, 1, 1, 1,
-1.654137, 0.2303488, -1.403866, 1, 1, 1, 1, 1,
-1.643681, 0.8649371, -1.381441, 1, 1, 1, 1, 1,
-1.639359, 0.8871001, -1.961524, 1, 1, 1, 1, 1,
-1.635323, 1.021093, -0.6757626, 1, 1, 1, 1, 1,
-1.632073, -1.106218, -1.581436, 1, 1, 1, 1, 1,
-1.622082, 1.080869, -1.639556, 1, 1, 1, 1, 1,
-1.619463, -0.6661837, -1.237834, 1, 1, 1, 1, 1,
-1.607314, 1.56972, -2.14554, 1, 1, 1, 1, 1,
-1.600303, -0.4546375, 0.2823616, 1, 1, 1, 1, 1,
-1.596601, 1.819292, -2.665399, 0, 0, 1, 1, 1,
-1.593147, -0.4736449, -2.360051, 1, 0, 0, 1, 1,
-1.587403, -0.7532699, -2.285462, 1, 0, 0, 1, 1,
-1.568633, -0.3399929, -2.01669, 1, 0, 0, 1, 1,
-1.5618, -0.9077277, -3.120723, 1, 0, 0, 1, 1,
-1.560611, -0.2756723, -1.579785, 1, 0, 0, 1, 1,
-1.553449, -0.629186, -3.453429, 0, 0, 0, 1, 1,
-1.539919, 0.9654726, -1.186898, 0, 0, 0, 1, 1,
-1.533723, 1.448733, -0.6875792, 0, 0, 0, 1, 1,
-1.489275, -0.8751414, -1.35143, 0, 0, 0, 1, 1,
-1.4821, 1.723917, -1.640854, 0, 0, 0, 1, 1,
-1.46749, 2.271475, -0.6888997, 0, 0, 0, 1, 1,
-1.458682, -1.375171, -1.848715, 0, 0, 0, 1, 1,
-1.449639, -0.6292819, -1.915577, 1, 1, 1, 1, 1,
-1.448982, -0.02284531, -2.32443, 1, 1, 1, 1, 1,
-1.444236, 0.02849907, -2.182922, 1, 1, 1, 1, 1,
-1.433678, 0.589442, -1.144401, 1, 1, 1, 1, 1,
-1.429646, 0.133887, -1.517505, 1, 1, 1, 1, 1,
-1.426271, -2.204438, -2.977412, 1, 1, 1, 1, 1,
-1.414571, 0.834061, -3.027603, 1, 1, 1, 1, 1,
-1.407957, -0.5209906, -2.148623, 1, 1, 1, 1, 1,
-1.406753, -0.6014194, -2.256353, 1, 1, 1, 1, 1,
-1.400182, 1.049177, -1.24476, 1, 1, 1, 1, 1,
-1.394477, 0.9453045, -0.995375, 1, 1, 1, 1, 1,
-1.393896, -0.7446027, -1.256549, 1, 1, 1, 1, 1,
-1.389521, 0.6397963, -0.1619551, 1, 1, 1, 1, 1,
-1.379623, -0.2313448, -0.7361492, 1, 1, 1, 1, 1,
-1.369644, 0.03010997, 0.3362154, 1, 1, 1, 1, 1,
-1.366434, -0.978276, -1.879444, 0, 0, 1, 1, 1,
-1.365189, -2.558985, -0.7000741, 1, 0, 0, 1, 1,
-1.342139, -1.648873, -2.035491, 1, 0, 0, 1, 1,
-1.34053, -0.1841187, -1.428643, 1, 0, 0, 1, 1,
-1.337617, 1.155752, -1.030953, 1, 0, 0, 1, 1,
-1.32894, 0.1427031, -2.475086, 1, 0, 0, 1, 1,
-1.324868, -1.054943, -3.592305, 0, 0, 0, 1, 1,
-1.312265, 0.4557338, -1.475599, 0, 0, 0, 1, 1,
-1.307214, -1.121843, -3.767309, 0, 0, 0, 1, 1,
-1.306783, -1.24582, -3.020143, 0, 0, 0, 1, 1,
-1.306077, 1.750159, 0.2267792, 0, 0, 0, 1, 1,
-1.305979, 0.08242603, -0.6084467, 0, 0, 0, 1, 1,
-1.303707, 1.565271, -2.274247, 0, 0, 0, 1, 1,
-1.301179, 0.05565921, -1.069533, 1, 1, 1, 1, 1,
-1.300875, 0.1566578, -1.557336, 1, 1, 1, 1, 1,
-1.2997, -0.6762319, -2.141292, 1, 1, 1, 1, 1,
-1.29176, 1.326863, 0.6753523, 1, 1, 1, 1, 1,
-1.289388, 0.1512925, -1.080622, 1, 1, 1, 1, 1,
-1.284981, 0.03242595, -1.454745, 1, 1, 1, 1, 1,
-1.275479, 0.985848, -0.8377392, 1, 1, 1, 1, 1,
-1.273641, -0.1571569, -1.096402, 1, 1, 1, 1, 1,
-1.270664, 0.076014, -1.920265, 1, 1, 1, 1, 1,
-1.267743, 0.05676387, -2.486749, 1, 1, 1, 1, 1,
-1.26368, -1.252622, -3.923906, 1, 1, 1, 1, 1,
-1.26298, -1.083796, -2.705098, 1, 1, 1, 1, 1,
-1.262147, -1.274278, -3.080129, 1, 1, 1, 1, 1,
-1.258285, 1.240023, 0.3106018, 1, 1, 1, 1, 1,
-1.25787, -0.09570949, -1.647102, 1, 1, 1, 1, 1,
-1.248545, -0.1292434, -1.971231, 0, 0, 1, 1, 1,
-1.242035, -1.411392, -2.495367, 1, 0, 0, 1, 1,
-1.240008, 0.6039286, -0.9614297, 1, 0, 0, 1, 1,
-1.236704, -0.2021531, -1.076833, 1, 0, 0, 1, 1,
-1.233948, 2.535397, -0.4363253, 1, 0, 0, 1, 1,
-1.233037, -0.6229952, -0.3136693, 1, 0, 0, 1, 1,
-1.230088, 0.5364936, 0.5595737, 0, 0, 0, 1, 1,
-1.221344, -1.541126, -2.962749, 0, 0, 0, 1, 1,
-1.205222, 0.1169688, -0.3366877, 0, 0, 0, 1, 1,
-1.203383, -1.046597, -2.643449, 0, 0, 0, 1, 1,
-1.202293, 0.01965826, -2.747819, 0, 0, 0, 1, 1,
-1.199987, 1.024373, -1.655301, 0, 0, 0, 1, 1,
-1.195496, 1.777147, -1.07894, 0, 0, 0, 1, 1,
-1.194067, 0.6543875, -0.9189974, 1, 1, 1, 1, 1,
-1.192546, -0.8435939, -1.811353, 1, 1, 1, 1, 1,
-1.188608, -0.1122986, -2.358991, 1, 1, 1, 1, 1,
-1.18743, -0.7607424, -3.16923, 1, 1, 1, 1, 1,
-1.184059, 1.850244, -0.06291106, 1, 1, 1, 1, 1,
-1.180519, 0.116827, -0.4221005, 1, 1, 1, 1, 1,
-1.175906, 0.1455034, -1.957373, 1, 1, 1, 1, 1,
-1.163404, -0.9446808, -2.821195, 1, 1, 1, 1, 1,
-1.153262, -0.5526446, -1.642294, 1, 1, 1, 1, 1,
-1.148791, -0.8521304, -1.995798, 1, 1, 1, 1, 1,
-1.142383, 0.2617932, -1.222359, 1, 1, 1, 1, 1,
-1.140558, -0.2173033, -2.928581, 1, 1, 1, 1, 1,
-1.137803, 0.03881977, -1.872719, 1, 1, 1, 1, 1,
-1.133311, 0.8876877, -1.254792, 1, 1, 1, 1, 1,
-1.128105, 1.431187, -0.4587116, 1, 1, 1, 1, 1,
-1.122919, -1.750223, -5.615881, 0, 0, 1, 1, 1,
-1.119443, -0.3753451, -1.096882, 1, 0, 0, 1, 1,
-1.11931, 0.4871209, 0.6649671, 1, 0, 0, 1, 1,
-1.10698, -0.5548682, -3.376334, 1, 0, 0, 1, 1,
-1.103241, 1.488884, -0.5275047, 1, 0, 0, 1, 1,
-1.100889, -0.499966, -3.261697, 1, 0, 0, 1, 1,
-1.100119, -0.6609361, -2.271375, 0, 0, 0, 1, 1,
-1.09138, -1.731782, -1.861429, 0, 0, 0, 1, 1,
-1.089042, 0.1015496, -0.9389862, 0, 0, 0, 1, 1,
-1.081067, -0.4975319, -1.214476, 0, 0, 0, 1, 1,
-1.080566, 1.10285, -1.131486, 0, 0, 0, 1, 1,
-1.077757, 1.235871, 0.1568268, 0, 0, 0, 1, 1,
-1.073118, 0.9593501, -1.75262, 0, 0, 0, 1, 1,
-1.070798, 2.073527, -1.413542, 1, 1, 1, 1, 1,
-1.06861, -0.5152346, -2.651772, 1, 1, 1, 1, 1,
-1.065709, 0.1607523, 0.5607433, 1, 1, 1, 1, 1,
-1.061299, -0.0002643765, -1.935712, 1, 1, 1, 1, 1,
-1.060025, 0.322789, -0.01637118, 1, 1, 1, 1, 1,
-1.058544, -0.6830725, -2.027154, 1, 1, 1, 1, 1,
-1.034502, 0.2715542, -2.053308, 1, 1, 1, 1, 1,
-1.028038, -1.860845, -3.33143, 1, 1, 1, 1, 1,
-1.027484, -0.3526101, 1.306609, 1, 1, 1, 1, 1,
-1.025001, 0.2336144, -2.072348, 1, 1, 1, 1, 1,
-1.009064, -0.01863869, -2.135309, 1, 1, 1, 1, 1,
-0.9972969, -2.464856, -1.801611, 1, 1, 1, 1, 1,
-0.9942825, 0.3068772, -1.084082, 1, 1, 1, 1, 1,
-0.9938964, -0.1427135, -3.030226, 1, 1, 1, 1, 1,
-0.9897602, 1.344828, -2.141897, 1, 1, 1, 1, 1,
-0.9892491, -1.316729, -3.744204, 0, 0, 1, 1, 1,
-0.9846398, 0.5795678, -1.618234, 1, 0, 0, 1, 1,
-0.9824859, -0.2910018, -2.173865, 1, 0, 0, 1, 1,
-0.9824607, -1.73642, -1.968306, 1, 0, 0, 1, 1,
-0.9793342, -0.1106187, -2.490231, 1, 0, 0, 1, 1,
-0.9746322, 0.6719252, 0.2007044, 1, 0, 0, 1, 1,
-0.9683339, -0.7126939, -2.579121, 0, 0, 0, 1, 1,
-0.9679419, -1.574718, -1.52648, 0, 0, 0, 1, 1,
-0.9666616, 0.3563699, -2.818376, 0, 0, 0, 1, 1,
-0.9651338, -0.06917298, -1.583641, 0, 0, 0, 1, 1,
-0.9626459, -0.9605517, -1.128114, 0, 0, 0, 1, 1,
-0.9623893, 0.2500755, -0.5312608, 0, 0, 0, 1, 1,
-0.9592475, 1.574149, -0.897926, 0, 0, 0, 1, 1,
-0.9390808, 0.3541671, -0.08574426, 1, 1, 1, 1, 1,
-0.9327468, -0.8344615, -3.875654, 1, 1, 1, 1, 1,
-0.9279594, 1.005764, -2.143135, 1, 1, 1, 1, 1,
-0.923308, 0.362879, -1.02807, 1, 1, 1, 1, 1,
-0.9178772, -0.7166215, -1.401051, 1, 1, 1, 1, 1,
-0.9139206, 0.09330266, -0.9821798, 1, 1, 1, 1, 1,
-0.9126124, -0.05092938, 1.161883, 1, 1, 1, 1, 1,
-0.9117346, 0.1964628, -1.431704, 1, 1, 1, 1, 1,
-0.9080269, -1.044382, -1.971105, 1, 1, 1, 1, 1,
-0.9028127, -0.4438891, -1.984349, 1, 1, 1, 1, 1,
-0.9005532, 1.488458, -1.890566, 1, 1, 1, 1, 1,
-0.8997195, 1.208041, -2.410476, 1, 1, 1, 1, 1,
-0.8963481, -0.5589156, -2.312713, 1, 1, 1, 1, 1,
-0.8952204, 0.2705248, -1.330338, 1, 1, 1, 1, 1,
-0.8929695, -0.8976013, -3.615642, 1, 1, 1, 1, 1,
-0.8925185, 1.624576, -0.5007952, 0, 0, 1, 1, 1,
-0.8849797, -1.068479, -2.602363, 1, 0, 0, 1, 1,
-0.8835663, 0.3052126, -0.7252432, 1, 0, 0, 1, 1,
-0.8804674, 0.2115524, -0.6902396, 1, 0, 0, 1, 1,
-0.8774977, -0.7398444, -4.02051, 1, 0, 0, 1, 1,
-0.8763218, 0.3582735, -0.03276578, 1, 0, 0, 1, 1,
-0.8758876, 1.259875, -1.375699, 0, 0, 0, 1, 1,
-0.875074, 0.2680672, -2.092162, 0, 0, 0, 1, 1,
-0.8746196, 0.4167763, -2.145361, 0, 0, 0, 1, 1,
-0.8745521, 0.8086914, -2.747056, 0, 0, 0, 1, 1,
-0.8739734, 0.2709275, -1.728558, 0, 0, 0, 1, 1,
-0.8651097, 0.6640047, -0.4915282, 0, 0, 0, 1, 1,
-0.8565792, -0.2665407, -1.465786, 0, 0, 0, 1, 1,
-0.8560622, 0.6719245, 0.6053051, 1, 1, 1, 1, 1,
-0.8553652, -1.507719, -1.224553, 1, 1, 1, 1, 1,
-0.8521582, 1.418638, 1.486004, 1, 1, 1, 1, 1,
-0.8510923, -1.167399, -1.150597, 1, 1, 1, 1, 1,
-0.8496581, 0.2939661, -2.387772, 1, 1, 1, 1, 1,
-0.8439807, -1.131073, -3.444331, 1, 1, 1, 1, 1,
-0.8412714, -0.3987408, -2.925957, 1, 1, 1, 1, 1,
-0.8406798, -0.7384977, -2.94978, 1, 1, 1, 1, 1,
-0.833064, 0.3182101, -0.2619351, 1, 1, 1, 1, 1,
-0.8290057, 0.242142, -2.085863, 1, 1, 1, 1, 1,
-0.8264133, -0.2329043, -2.281314, 1, 1, 1, 1, 1,
-0.8164878, 0.3000859, -1.341737, 1, 1, 1, 1, 1,
-0.8111523, -1.174016, -3.759494, 1, 1, 1, 1, 1,
-0.8107875, -0.1761631, -1.687826, 1, 1, 1, 1, 1,
-0.8074976, 0.8402625, 0.8502433, 1, 1, 1, 1, 1,
-0.8063399, -0.0005785993, -1.706322, 0, 0, 1, 1, 1,
-0.8061728, 0.9537386, 0.8082622, 1, 0, 0, 1, 1,
-0.8013224, -0.7567881, -1.46915, 1, 0, 0, 1, 1,
-0.7945626, -0.4916649, -3.337117, 1, 0, 0, 1, 1,
-0.7918896, 0.3229448, -1.265804, 1, 0, 0, 1, 1,
-0.7912631, -0.5681216, -1.793507, 1, 0, 0, 1, 1,
-0.7897212, 0.318424, -2.655, 0, 0, 0, 1, 1,
-0.7869025, -0.2367356, -2.747324, 0, 0, 0, 1, 1,
-0.782181, 0.8769792, 0.6420518, 0, 0, 0, 1, 1,
-0.7810796, 1.304102, -2.774632, 0, 0, 0, 1, 1,
-0.7792515, -1.699571, -3.631209, 0, 0, 0, 1, 1,
-0.7683898, 0.09080761, -2.943564, 0, 0, 0, 1, 1,
-0.7650993, -0.7264082, -0.8286738, 0, 0, 0, 1, 1,
-0.7642687, 0.9703274, -0.6369143, 1, 1, 1, 1, 1,
-0.7626137, 1.192697, -0.2108416, 1, 1, 1, 1, 1,
-0.7604607, -0.7487543, -1.912513, 1, 1, 1, 1, 1,
-0.7529909, 0.5500654, -0.8150563, 1, 1, 1, 1, 1,
-0.748048, -0.03141575, -1.03946, 1, 1, 1, 1, 1,
-0.7458088, 0.2486787, -1.281419, 1, 1, 1, 1, 1,
-0.7445411, -0.4685286, -1.827306, 1, 1, 1, 1, 1,
-0.743329, -1.249432, -3.365337, 1, 1, 1, 1, 1,
-0.7375032, -0.216212, -1.117418, 1, 1, 1, 1, 1,
-0.7344587, -2.636239, -3.738011, 1, 1, 1, 1, 1,
-0.7338296, -0.3273257, -2.894517, 1, 1, 1, 1, 1,
-0.7337652, -1.061038, -3.334247, 1, 1, 1, 1, 1,
-0.7228981, -0.5460488, -1.345972, 1, 1, 1, 1, 1,
-0.722127, -0.7076781, -2.750996, 1, 1, 1, 1, 1,
-0.7189856, 0.602845, -0.8116416, 1, 1, 1, 1, 1,
-0.7151286, 0.7742134, -1.079228, 0, 0, 1, 1, 1,
-0.7140985, 0.01328392, -1.916922, 1, 0, 0, 1, 1,
-0.7131991, 1.25544, -1.524373, 1, 0, 0, 1, 1,
-0.706995, 0.2260542, -0.1131645, 1, 0, 0, 1, 1,
-0.7031796, 0.1880969, -2.641697, 1, 0, 0, 1, 1,
-0.7002512, -0.9181843, -3.235956, 1, 0, 0, 1, 1,
-0.6962922, -2.394042, -2.339054, 0, 0, 0, 1, 1,
-0.6930348, -2.123277, -2.179451, 0, 0, 0, 1, 1,
-0.6922117, -0.1835834, -3.36051, 0, 0, 0, 1, 1,
-0.6903182, -0.5202467, -0.4137866, 0, 0, 0, 1, 1,
-0.6893846, 0.9778903, 0.4224545, 0, 0, 0, 1, 1,
-0.6877233, -0.8013761, -3.112051, 0, 0, 0, 1, 1,
-0.6769313, 0.2756244, 0.3861826, 0, 0, 0, 1, 1,
-0.6706782, -1.182558, -3.361099, 1, 1, 1, 1, 1,
-0.6685168, 0.3231993, -0.9779285, 1, 1, 1, 1, 1,
-0.6663839, -0.761731, -2.920363, 1, 1, 1, 1, 1,
-0.6634135, -0.4359432, -0.8797199, 1, 1, 1, 1, 1,
-0.6562353, -0.2723009, -2.762531, 1, 1, 1, 1, 1,
-0.6546896, -0.1854964, -3.001788, 1, 1, 1, 1, 1,
-0.6510838, 0.4254158, -1.390632, 1, 1, 1, 1, 1,
-0.6508699, -1.460286, -1.887179, 1, 1, 1, 1, 1,
-0.650323, 1.056401, 0.3878156, 1, 1, 1, 1, 1,
-0.6496999, -0.7395106, -2.629771, 1, 1, 1, 1, 1,
-0.6373202, 2.281415, -0.3341506, 1, 1, 1, 1, 1,
-0.6343616, -1.475089, -1.633723, 1, 1, 1, 1, 1,
-0.6336454, -0.5272544, -2.785682, 1, 1, 1, 1, 1,
-0.625683, 1.051278, -0.29131, 1, 1, 1, 1, 1,
-0.625661, 1.321386, -1.936645, 1, 1, 1, 1, 1,
-0.6256055, 2.282647, 0.4808355, 0, 0, 1, 1, 1,
-0.6250183, -1.000592, -2.828444, 1, 0, 0, 1, 1,
-0.6214636, -0.1809125, -0.9908556, 1, 0, 0, 1, 1,
-0.6134552, -0.1592836, -0.6270877, 1, 0, 0, 1, 1,
-0.6077648, -0.05277507, -1.203546, 1, 0, 0, 1, 1,
-0.6067612, -0.2288754, -3.759735, 1, 0, 0, 1, 1,
-0.6064565, -0.4542519, -2.41118, 0, 0, 0, 1, 1,
-0.5996839, 1.522499, 0.7129339, 0, 0, 0, 1, 1,
-0.5977993, 1.865108, 1.254177, 0, 0, 0, 1, 1,
-0.5938248, 2.22045, -1.255875, 0, 0, 0, 1, 1,
-0.5919619, -0.9124654, -2.987374, 0, 0, 0, 1, 1,
-0.5913547, -0.3703338, -2.243922, 0, 0, 0, 1, 1,
-0.5861497, -0.3848773, -1.867709, 0, 0, 0, 1, 1,
-0.5821239, -1.586807, -3.548234, 1, 1, 1, 1, 1,
-0.5810674, 0.6147944, 0.919269, 1, 1, 1, 1, 1,
-0.5749994, 0.1621719, -0.8667955, 1, 1, 1, 1, 1,
-0.5744876, -0.6032909, -2.734488, 1, 1, 1, 1, 1,
-0.5730476, -1.789215, -2.484033, 1, 1, 1, 1, 1,
-0.5689723, 2.01538, -0.8852893, 1, 1, 1, 1, 1,
-0.5674783, 0.7338145, 0.8974728, 1, 1, 1, 1, 1,
-0.5646451, -1.989411, -4.433384, 1, 1, 1, 1, 1,
-0.5525604, -0.01336192, -1.832614, 1, 1, 1, 1, 1,
-0.5516208, 0.6508487, -1.391155, 1, 1, 1, 1, 1,
-0.5513, 0.2109334, -0.08035941, 1, 1, 1, 1, 1,
-0.5496021, -0.04369884, -2.123291, 1, 1, 1, 1, 1,
-0.5480996, -1.101221, -2.88002, 1, 1, 1, 1, 1,
-0.5469679, -0.4675823, -2.050008, 1, 1, 1, 1, 1,
-0.5464716, 0.6452665, -1.175797, 1, 1, 1, 1, 1,
-0.5462078, -1.519522, -3.374698, 0, 0, 1, 1, 1,
-0.5452986, -1.021089, -1.88126, 1, 0, 0, 1, 1,
-0.5446073, 0.5112768, -1.798684, 1, 0, 0, 1, 1,
-0.5439832, 0.5322608, -1.482723, 1, 0, 0, 1, 1,
-0.5378159, 1.027768, -0.6774231, 1, 0, 0, 1, 1,
-0.5373611, -0.4447832, -3.04133, 1, 0, 0, 1, 1,
-0.5327102, 1.192829, -0.3456711, 0, 0, 0, 1, 1,
-0.5312532, -0.2203278, -1.471372, 0, 0, 0, 1, 1,
-0.5305771, -0.5630028, -1.059715, 0, 0, 0, 1, 1,
-0.5304277, -0.375611, -1.973385, 0, 0, 0, 1, 1,
-0.5285004, -0.1436747, -1.449397, 0, 0, 0, 1, 1,
-0.5276148, -0.1192068, -0.5575383, 0, 0, 0, 1, 1,
-0.5231536, -0.08810864, -0.5532271, 0, 0, 0, 1, 1,
-0.5227994, 0.7157422, -0.5279215, 1, 1, 1, 1, 1,
-0.520813, -0.7988452, -3.146256, 1, 1, 1, 1, 1,
-0.520146, 1.582933, -0.2154219, 1, 1, 1, 1, 1,
-0.5165004, -0.2086268, -1.301831, 1, 1, 1, 1, 1,
-0.5105541, -1.06767, -1.990774, 1, 1, 1, 1, 1,
-0.503494, 0.6965542, -1.050465, 1, 1, 1, 1, 1,
-0.4980694, 0.4587159, -0.615769, 1, 1, 1, 1, 1,
-0.4906861, -1.032631, -1.301996, 1, 1, 1, 1, 1,
-0.4899011, -1.049438, -3.279677, 1, 1, 1, 1, 1,
-0.4840551, 2.36425, -1.867772, 1, 1, 1, 1, 1,
-0.4799539, -0.707203, -3.174648, 1, 1, 1, 1, 1,
-0.4769569, -0.2509362, -4.503452, 1, 1, 1, 1, 1,
-0.4764388, 1.41696, -2.71093, 1, 1, 1, 1, 1,
-0.4679951, 0.12165, 0.2493466, 1, 1, 1, 1, 1,
-0.4658457, -1.447549, -3.37447, 1, 1, 1, 1, 1,
-0.4607493, -0.8530424, -3.49785, 0, 0, 1, 1, 1,
-0.4570131, 0.07835121, -2.409917, 1, 0, 0, 1, 1,
-0.4481748, -0.2978485, -3.701146, 1, 0, 0, 1, 1,
-0.4423563, -0.3500547, -3.126709, 1, 0, 0, 1, 1,
-0.4367419, 1.820078, -0.3914406, 1, 0, 0, 1, 1,
-0.4318655, -0.7156401, -1.222225, 1, 0, 0, 1, 1,
-0.4300602, -0.03571205, -1.190788, 0, 0, 0, 1, 1,
-0.4272344, 1.177492, -2.126487, 0, 0, 0, 1, 1,
-0.4244143, -1.059161, -2.817625, 0, 0, 0, 1, 1,
-0.3996168, -0.4781902, -2.837185, 0, 0, 0, 1, 1,
-0.3992063, -0.2582334, -1.619896, 0, 0, 0, 1, 1,
-0.3971112, -2.955398, -2.262822, 0, 0, 0, 1, 1,
-0.3957359, 0.7523797, 1.672404, 0, 0, 0, 1, 1,
-0.3916095, 0.35271, -1.970294, 1, 1, 1, 1, 1,
-0.3849804, -0.346396, -1.160612, 1, 1, 1, 1, 1,
-0.3836122, -0.9434351, -3.953499, 1, 1, 1, 1, 1,
-0.3797923, -0.181659, -3.890697, 1, 1, 1, 1, 1,
-0.3773092, -0.6985818, -2.016306, 1, 1, 1, 1, 1,
-0.3771797, -1.068373, -3.389313, 1, 1, 1, 1, 1,
-0.3714533, 0.2880528, -2.427333, 1, 1, 1, 1, 1,
-0.3704058, -0.3428461, -1.579427, 1, 1, 1, 1, 1,
-0.3672747, 0.2713834, -1.20946, 1, 1, 1, 1, 1,
-0.3671846, -0.2218309, -2.92696, 1, 1, 1, 1, 1,
-0.3666232, -1.682818, -2.106963, 1, 1, 1, 1, 1,
-0.3646165, 0.4039929, -1.38144, 1, 1, 1, 1, 1,
-0.3639649, -0.8751456, -1.695723, 1, 1, 1, 1, 1,
-0.3630322, 0.09095388, -2.268452, 1, 1, 1, 1, 1,
-0.3612728, -0.2592318, -2.393173, 1, 1, 1, 1, 1,
-0.3606679, -1.141722, -4.368466, 0, 0, 1, 1, 1,
-0.3589152, -0.3877492, -3.419194, 1, 0, 0, 1, 1,
-0.3548822, 1.167267, 1.066741, 1, 0, 0, 1, 1,
-0.3526503, 0.5170758, 1.274573, 1, 0, 0, 1, 1,
-0.3499023, -0.8756467, -4.522661, 1, 0, 0, 1, 1,
-0.3490199, 0.5470856, -0.6255684, 1, 0, 0, 1, 1,
-0.3482344, 0.02751714, -0.6268693, 0, 0, 0, 1, 1,
-0.3460885, -0.5610232, -3.510699, 0, 0, 0, 1, 1,
-0.3402126, -0.4382148, -4.464166, 0, 0, 0, 1, 1,
-0.3387038, -0.9243276, -4.249325, 0, 0, 0, 1, 1,
-0.3378115, 1.01493, -0.3355193, 0, 0, 0, 1, 1,
-0.3301694, 0.03340862, -1.867139, 0, 0, 0, 1, 1,
-0.3291747, 1.752149, -2.189166, 0, 0, 0, 1, 1,
-0.3167389, -0.2360479, -1.313787, 1, 1, 1, 1, 1,
-0.3107252, -0.1564306, -2.600218, 1, 1, 1, 1, 1,
-0.3084273, 0.9828885, -0.3954137, 1, 1, 1, 1, 1,
-0.3052238, 0.4418685, -0.3520387, 1, 1, 1, 1, 1,
-0.3045141, 0.0784585, -1.629573, 1, 1, 1, 1, 1,
-0.3020172, -1.262025, -3.677327, 1, 1, 1, 1, 1,
-0.3006706, 0.2340465, 1.856774, 1, 1, 1, 1, 1,
-0.2981403, 0.738426, -0.4148964, 1, 1, 1, 1, 1,
-0.2843904, 0.9412983, -0.7526104, 1, 1, 1, 1, 1,
-0.2825432, -0.5372471, -1.004403, 1, 1, 1, 1, 1,
-0.281721, 0.06348538, -1.985274, 1, 1, 1, 1, 1,
-0.2807743, 0.3250695, -0.03278994, 1, 1, 1, 1, 1,
-0.2802713, -1.015024, -2.82044, 1, 1, 1, 1, 1,
-0.2721472, 1.608452, 0.6023705, 1, 1, 1, 1, 1,
-0.2675081, 0.07819105, 0.04059105, 1, 1, 1, 1, 1,
-0.2658339, 0.4698891, 0.03615329, 0, 0, 1, 1, 1,
-0.2618674, -0.03271582, -1.846591, 1, 0, 0, 1, 1,
-0.2608545, -2.317842, -3.396132, 1, 0, 0, 1, 1,
-0.2589491, -1.406672, -3.444519, 1, 0, 0, 1, 1,
-0.2570782, 0.9633674, 0.7948172, 1, 0, 0, 1, 1,
-0.2501009, -1.661096, -2.39818, 1, 0, 0, 1, 1,
-0.2448311, -1.474302, -2.704125, 0, 0, 0, 1, 1,
-0.2418853, 0.213906, -0.7258531, 0, 0, 0, 1, 1,
-0.2417128, -1.121232, -3.446785, 0, 0, 0, 1, 1,
-0.2411351, -1.435173, -3.827121, 0, 0, 0, 1, 1,
-0.2408445, -1.356942, -4.152296, 0, 0, 0, 1, 1,
-0.2400505, 0.5798885, -1.455744, 0, 0, 0, 1, 1,
-0.2394709, 1.024436, -0.7181737, 0, 0, 0, 1, 1,
-0.2371579, 0.8781708, -0.4490639, 1, 1, 1, 1, 1,
-0.2361201, -0.2249094, -4.226, 1, 1, 1, 1, 1,
-0.2351819, 0.4190564, 0.06975778, 1, 1, 1, 1, 1,
-0.2331035, 0.09023978, -1.383734, 1, 1, 1, 1, 1,
-0.2321908, 0.1462553, -1.591694, 1, 1, 1, 1, 1,
-0.2241344, -0.7875367, -3.610128, 1, 1, 1, 1, 1,
-0.2230208, 0.6021366, -0.0307171, 1, 1, 1, 1, 1,
-0.219265, 0.8238302, -1.315947, 1, 1, 1, 1, 1,
-0.2168714, -1.73117, -3.49597, 1, 1, 1, 1, 1,
-0.2123664, 0.1955311, -1.093134, 1, 1, 1, 1, 1,
-0.2098879, 1.110101, -1.002798, 1, 1, 1, 1, 1,
-0.2056869, 1.328276, -1.214524, 1, 1, 1, 1, 1,
-0.2043251, 0.7919535, -0.7055138, 1, 1, 1, 1, 1,
-0.2009506, 0.2978981, -1.269459, 1, 1, 1, 1, 1,
-0.1947546, -0.1660343, -2.431178, 1, 1, 1, 1, 1,
-0.1918204, 0.09095672, -1.20737, 0, 0, 1, 1, 1,
-0.1909008, -0.2862554, -3.681212, 1, 0, 0, 1, 1,
-0.1865694, -0.8288978, -3.812809, 1, 0, 0, 1, 1,
-0.1863428, -1.439886, -3.523853, 1, 0, 0, 1, 1,
-0.1820987, -0.3359876, -3.743924, 1, 0, 0, 1, 1,
-0.182049, -1.243102, -3.054764, 1, 0, 0, 1, 1,
-0.1728632, 0.09707298, -1.59324, 0, 0, 0, 1, 1,
-0.1724891, -0.885955, -3.344265, 0, 0, 0, 1, 1,
-0.1684635, 0.9893357, -1.160301, 0, 0, 0, 1, 1,
-0.166538, 0.6356328, -0.6288911, 0, 0, 0, 1, 1,
-0.1646352, 1.716993, 0.3832732, 0, 0, 0, 1, 1,
-0.1643408, -0.5247129, -2.515388, 0, 0, 0, 1, 1,
-0.1616668, 0.9639184, -0.2126903, 0, 0, 0, 1, 1,
-0.1573947, 0.1594679, -0.6375635, 1, 1, 1, 1, 1,
-0.1550302, 0.7473479, 0.9659986, 1, 1, 1, 1, 1,
-0.1527602, 1.260052, -0.4251963, 1, 1, 1, 1, 1,
-0.148259, 0.207218, 0.04124107, 1, 1, 1, 1, 1,
-0.1459063, 0.9436904, 0.402927, 1, 1, 1, 1, 1,
-0.1429435, 1.400846, -0.8328053, 1, 1, 1, 1, 1,
-0.1421347, -0.2358323, -2.463474, 1, 1, 1, 1, 1,
-0.1385508, -1.195079, -4.203235, 1, 1, 1, 1, 1,
-0.1381647, -2.179095, -2.58755, 1, 1, 1, 1, 1,
-0.1355638, -0.7028881, -2.416908, 1, 1, 1, 1, 1,
-0.1350677, -0.4459332, -5.045706, 1, 1, 1, 1, 1,
-0.1344809, 0.1100488, 0.2508144, 1, 1, 1, 1, 1,
-0.1334026, -2.074351, -3.423558, 1, 1, 1, 1, 1,
-0.1331918, -0.8281469, -3.177059, 1, 1, 1, 1, 1,
-0.1328891, -1.492181, -3.182896, 1, 1, 1, 1, 1,
-0.1265531, 1.112624, 0.9356231, 0, 0, 1, 1, 1,
-0.1203435, -0.4329527, -2.498835, 1, 0, 0, 1, 1,
-0.1174523, -0.7066109, -4.66539, 1, 0, 0, 1, 1,
-0.1171204, 1.835961, 1.140889, 1, 0, 0, 1, 1,
-0.1081385, 0.7178708, -1.240786, 1, 0, 0, 1, 1,
-0.103541, -2.854649, -3.482055, 1, 0, 0, 1, 1,
-0.09796182, 0.02277428, -1.006215, 0, 0, 0, 1, 1,
-0.09767165, -0.7776153, -3.761743, 0, 0, 0, 1, 1,
-0.09720095, 0.8584415, 0.0213938, 0, 0, 0, 1, 1,
-0.09345891, 0.7330856, -1.081464, 0, 0, 0, 1, 1,
-0.08120862, 2.155873, -0.02907487, 0, 0, 0, 1, 1,
-0.07936414, -1.155456, -4.519806, 0, 0, 0, 1, 1,
-0.0722757, 0.06669055, -1.550137, 0, 0, 0, 1, 1,
-0.07070318, 1.174295, 1.186903, 1, 1, 1, 1, 1,
-0.06876794, 0.07167838, -0.6930083, 1, 1, 1, 1, 1,
-0.06630557, 0.07065311, -1.69028, 1, 1, 1, 1, 1,
-0.06536869, 0.4749574, 0.3945393, 1, 1, 1, 1, 1,
-0.06271927, 0.9657208, -0.8852938, 1, 1, 1, 1, 1,
-0.06180213, 1.165333, 0.4432014, 1, 1, 1, 1, 1,
-0.06153858, -2.089097, -3.953172, 1, 1, 1, 1, 1,
-0.0597874, 2.064814, -0.6343878, 1, 1, 1, 1, 1,
-0.05513336, 0.3351961, -0.7656626, 1, 1, 1, 1, 1,
-0.05441513, -0.4707208, -2.914705, 1, 1, 1, 1, 1,
-0.05218367, 0.6865188, -1.113667, 1, 1, 1, 1, 1,
-0.04577944, -0.4875305, -3.186266, 1, 1, 1, 1, 1,
-0.03817199, 1.42864, 0.1012939, 1, 1, 1, 1, 1,
-0.03686981, -1.383404, -2.217398, 1, 1, 1, 1, 1,
-0.03213158, -0.8832211, -3.179914, 1, 1, 1, 1, 1,
-0.0302573, -0.001455518, -1.793511, 0, 0, 1, 1, 1,
-0.02327273, 0.7393015, 0.4512735, 1, 0, 0, 1, 1,
-0.02215879, -0.6528411, -1.783304, 1, 0, 0, 1, 1,
-0.01938369, 0.1627771, 0.3064384, 1, 0, 0, 1, 1,
-0.01765027, -0.1485431, -3.899309, 1, 0, 0, 1, 1,
-0.01713195, 0.1368433, 0.4993581, 1, 0, 0, 1, 1,
-0.01595901, 0.5627155, 0.1936304, 0, 0, 0, 1, 1,
-0.003302771, 0.8531756, 0.9142296, 0, 0, 0, 1, 1,
-0.002892749, 1.812, -1.109485, 0, 0, 0, 1, 1,
0.002295751, 0.367698, -0.5745233, 0, 0, 0, 1, 1,
0.003210644, -2.423571, 3.176456, 0, 0, 0, 1, 1,
0.007540158, 0.7681898, 0.2728386, 0, 0, 0, 1, 1,
0.01104607, 0.3371328, 0.2784318, 0, 0, 0, 1, 1,
0.01129831, -1.039624, 4.905174, 1, 1, 1, 1, 1,
0.01229582, 0.620009, 0.5172453, 1, 1, 1, 1, 1,
0.01328916, -1.613425, 2.305299, 1, 1, 1, 1, 1,
0.02016135, -0.6025574, 1.663245, 1, 1, 1, 1, 1,
0.0217049, -0.6517763, 4.08633, 1, 1, 1, 1, 1,
0.0230497, -0.1519087, 2.449166, 1, 1, 1, 1, 1,
0.02437952, -0.5700516, 2.646167, 1, 1, 1, 1, 1,
0.02453135, -1.141296, 2.717005, 1, 1, 1, 1, 1,
0.02472777, 1.934521, 0.131534, 1, 1, 1, 1, 1,
0.03021285, 0.1863174, 1.210232, 1, 1, 1, 1, 1,
0.03084383, -0.400418, 3.053138, 1, 1, 1, 1, 1,
0.03317501, 0.9850724, -0.3942903, 1, 1, 1, 1, 1,
0.03734531, -0.8764596, 1.006831, 1, 1, 1, 1, 1,
0.0447764, 0.1325922, -0.04867064, 1, 1, 1, 1, 1,
0.04585006, -0.888288, 3.023004, 1, 1, 1, 1, 1,
0.04701734, 1.520636, -2.307745, 0, 0, 1, 1, 1,
0.05172722, 0.6645069, -1.191358, 1, 0, 0, 1, 1,
0.05192504, -0.428453, 3.011737, 1, 0, 0, 1, 1,
0.05295324, -1.241713, 3.646667, 1, 0, 0, 1, 1,
0.06302636, -0.830771, 2.95975, 1, 0, 0, 1, 1,
0.06642891, -0.6002331, 3.155155, 1, 0, 0, 1, 1,
0.06660306, -1.330626, 3.583185, 0, 0, 0, 1, 1,
0.06884492, 0.2462536, 1.284064, 0, 0, 0, 1, 1,
0.07353696, 1.14291, -1.19453, 0, 0, 0, 1, 1,
0.07537641, 0.4537179, 0.1173099, 0, 0, 0, 1, 1,
0.07744703, 0.8625336, 0.0173315, 0, 0, 0, 1, 1,
0.07942348, 0.3179063, -0.06532574, 0, 0, 0, 1, 1,
0.0824561, 0.1332151, -0.2960681, 0, 0, 0, 1, 1,
0.08308267, -0.8351913, 5.173525, 1, 1, 1, 1, 1,
0.08415206, 2.228384, -0.3816073, 1, 1, 1, 1, 1,
0.08475281, -1.950147, 4.23494, 1, 1, 1, 1, 1,
0.08709003, 0.2173417, -0.730217, 1, 1, 1, 1, 1,
0.08729187, -0.2183895, 2.149668, 1, 1, 1, 1, 1,
0.08835478, 0.0674068, 1.199904, 1, 1, 1, 1, 1,
0.08897302, 0.8330817, -0.6143416, 1, 1, 1, 1, 1,
0.0935347, 0.8694758, 0.09842715, 1, 1, 1, 1, 1,
0.09509353, 0.6190125, -0.3299676, 1, 1, 1, 1, 1,
0.0992466, -0.6108698, 1.404775, 1, 1, 1, 1, 1,
0.1014587, -0.1235369, 2.956858, 1, 1, 1, 1, 1,
0.1063725, -0.03740346, 2.035469, 1, 1, 1, 1, 1,
0.1065831, -1.404787, 1.829767, 1, 1, 1, 1, 1,
0.1101397, 1.071714, 1.347438, 1, 1, 1, 1, 1,
0.1114087, 0.2938272, -0.6415636, 1, 1, 1, 1, 1,
0.1144164, 0.4218872, 0.7802289, 0, 0, 1, 1, 1,
0.1223712, 0.8307706, -0.7935708, 1, 0, 0, 1, 1,
0.1246264, -0.8360539, 2.577058, 1, 0, 0, 1, 1,
0.1253144, -1.96703, 3.763014, 1, 0, 0, 1, 1,
0.126754, -1.225739, 3.617523, 1, 0, 0, 1, 1,
0.1294618, -1.493888, 2.430827, 1, 0, 0, 1, 1,
0.1296325, 0.1941032, -0.7497137, 0, 0, 0, 1, 1,
0.1314922, -1.569786, 2.725837, 0, 0, 0, 1, 1,
0.1377565, 0.08354372, 0.8351125, 0, 0, 0, 1, 1,
0.1382563, -0.9590227, 3.322031, 0, 0, 0, 1, 1,
0.1424378, -1.170118, 0.574501, 0, 0, 0, 1, 1,
0.1436861, 0.8864598, -0.2402196, 0, 0, 0, 1, 1,
0.1448679, 0.4074725, -0.8347211, 0, 0, 0, 1, 1,
0.1486204, 0.02312658, 0.5875713, 1, 1, 1, 1, 1,
0.1550563, -0.06215612, 1.439611, 1, 1, 1, 1, 1,
0.1559634, 1.67036, 1.275469, 1, 1, 1, 1, 1,
0.1572144, 0.01766067, 2.035548, 1, 1, 1, 1, 1,
0.1581032, -0.910976, 3.308641, 1, 1, 1, 1, 1,
0.1646878, -0.2645755, 3.392412, 1, 1, 1, 1, 1,
0.1649815, 0.2227665, 1.548001, 1, 1, 1, 1, 1,
0.1669992, -0.2184146, 2.450689, 1, 1, 1, 1, 1,
0.1710823, -0.764306, 1.550414, 1, 1, 1, 1, 1,
0.1736169, -2.377524, 4.370466, 1, 1, 1, 1, 1,
0.1821128, -0.3709415, 3.761834, 1, 1, 1, 1, 1,
0.1845087, 0.8842188, 0.2370739, 1, 1, 1, 1, 1,
0.1937822, -1.038439, 2.852508, 1, 1, 1, 1, 1,
0.1966258, 1.158656, 0.6552703, 1, 1, 1, 1, 1,
0.1995559, -0.6967614, 2.378863, 1, 1, 1, 1, 1,
0.2029376, -1.640251, 3.129808, 0, 0, 1, 1, 1,
0.2056423, -0.5335415, 3.526744, 1, 0, 0, 1, 1,
0.2141104, 0.6841914, -1.89693, 1, 0, 0, 1, 1,
0.2154837, -0.6068941, 2.153244, 1, 0, 0, 1, 1,
0.2155418, 0.4541385, 0.2354095, 1, 0, 0, 1, 1,
0.2181805, -1.275193, 2.149697, 1, 0, 0, 1, 1,
0.2187279, -0.760609, 1.385662, 0, 0, 0, 1, 1,
0.2189893, 0.1289662, 1.228107, 0, 0, 0, 1, 1,
0.2286227, 0.471444, 0.5056636, 0, 0, 0, 1, 1,
0.2368605, 1.258805, -0.6173674, 0, 0, 0, 1, 1,
0.2372832, -1.088028, 3.260657, 0, 0, 0, 1, 1,
0.2383011, -1.582646, 2.927684, 0, 0, 0, 1, 1,
0.2406878, -1.359504, 2.416798, 0, 0, 0, 1, 1,
0.2425334, 0.01985072, 2.680654, 1, 1, 1, 1, 1,
0.2429684, 1.423082, 0.5319299, 1, 1, 1, 1, 1,
0.2497799, -0.7052979, 1.585511, 1, 1, 1, 1, 1,
0.2515886, -1.749693, 4.496687, 1, 1, 1, 1, 1,
0.2562735, -0.2914762, 2.822043, 1, 1, 1, 1, 1,
0.2593451, 0.9317286, -1.379778, 1, 1, 1, 1, 1,
0.2681823, -0.4635099, 3.267646, 1, 1, 1, 1, 1,
0.2708054, -0.1753248, 1.789905, 1, 1, 1, 1, 1,
0.2719298, 0.5921237, -0.7645141, 1, 1, 1, 1, 1,
0.2729444, 0.5196412, 1.798513, 1, 1, 1, 1, 1,
0.274294, 0.2091946, 1.707476, 1, 1, 1, 1, 1,
0.2784407, 0.7374654, 0.1280752, 1, 1, 1, 1, 1,
0.2812547, -2.00306, 3.177274, 1, 1, 1, 1, 1,
0.2838339, 0.009439789, 2.968681, 1, 1, 1, 1, 1,
0.2856961, 0.0282824, 1.743833, 1, 1, 1, 1, 1,
0.2888142, -1.613565, 2.487237, 0, 0, 1, 1, 1,
0.2897757, 2.465955, 0.6288236, 1, 0, 0, 1, 1,
0.2911425, 1.017263, 0.9453382, 1, 0, 0, 1, 1,
0.2941207, -0.4278623, 2.687554, 1, 0, 0, 1, 1,
0.2944767, 0.003933566, 1.364892, 1, 0, 0, 1, 1,
0.2976643, -0.04522862, 0.4099307, 1, 0, 0, 1, 1,
0.3014339, 1.119814, 0.1138816, 0, 0, 0, 1, 1,
0.301605, -0.05319811, 2.042625, 0, 0, 0, 1, 1,
0.3022682, -0.4327979, 1.596277, 0, 0, 0, 1, 1,
0.3056421, 0.6749095, 1.073025, 0, 0, 0, 1, 1,
0.3056685, 0.8329749, 0.9161701, 0, 0, 0, 1, 1,
0.3064424, 1.755075, 1.588893, 0, 0, 0, 1, 1,
0.3083795, 0.4474043, 2.029612, 0, 0, 0, 1, 1,
0.3173425, 0.1604316, 1.71299, 1, 1, 1, 1, 1,
0.3185438, -0.5679857, 3.811327, 1, 1, 1, 1, 1,
0.3207987, 0.006019739, 1.975519, 1, 1, 1, 1, 1,
0.3234085, 0.2282195, 0.5463495, 1, 1, 1, 1, 1,
0.3323762, 1.099656, 0.7612077, 1, 1, 1, 1, 1,
0.335055, 0.9801968, 1.064342, 1, 1, 1, 1, 1,
0.3355865, 0.7274778, 0.5871638, 1, 1, 1, 1, 1,
0.3384383, 0.4172353, -1.253175, 1, 1, 1, 1, 1,
0.3388594, -1.661247, 2.970897, 1, 1, 1, 1, 1,
0.3393235, 2.008062, 0.7053072, 1, 1, 1, 1, 1,
0.3426761, -1.018338, 3.723707, 1, 1, 1, 1, 1,
0.3435746, 0.964344, 1.851194, 1, 1, 1, 1, 1,
0.3447749, 0.1124942, 1.51567, 1, 1, 1, 1, 1,
0.3477149, -0.3415368, 2.787426, 1, 1, 1, 1, 1,
0.34955, 0.5855792, 1.449561, 1, 1, 1, 1, 1,
0.3515434, 0.08271015, 0.7524522, 0, 0, 1, 1, 1,
0.3523046, 0.05654139, -0.3449863, 1, 0, 0, 1, 1,
0.3564788, 0.139506, 1.973877, 1, 0, 0, 1, 1,
0.3586969, -1.167659, 2.584791, 1, 0, 0, 1, 1,
0.3637846, 1.110207, 0.1424758, 1, 0, 0, 1, 1,
0.3685893, 0.8611137, -0.5405697, 1, 0, 0, 1, 1,
0.3706971, -0.1376162, 0.3962939, 0, 0, 0, 1, 1,
0.3732758, 0.5792823, 1.856742, 0, 0, 0, 1, 1,
0.3749003, -1.128552, 4.511237, 0, 0, 0, 1, 1,
0.375506, 0.4850312, 0.2180149, 0, 0, 0, 1, 1,
0.3759677, 2.155933, 1.172575, 0, 0, 0, 1, 1,
0.3807192, 0.9482988, 0.7105988, 0, 0, 0, 1, 1,
0.3821509, 1.517511, -1.3117, 0, 0, 0, 1, 1,
0.3856342, 1.487966, -1.401212, 1, 1, 1, 1, 1,
0.3874275, -0.3172169, 2.132187, 1, 1, 1, 1, 1,
0.3881444, 0.3183984, 1.598231, 1, 1, 1, 1, 1,
0.3885983, -2.218518, 3.764294, 1, 1, 1, 1, 1,
0.3933614, -1.705218, 4.383758, 1, 1, 1, 1, 1,
0.3939496, -0.2104848, 2.835683, 1, 1, 1, 1, 1,
0.395946, -0.745755, 2.410344, 1, 1, 1, 1, 1,
0.3968814, 0.409819, -0.6236303, 1, 1, 1, 1, 1,
0.3972918, -0.6382422, 2.716711, 1, 1, 1, 1, 1,
0.4004004, 0.7068234, 0.4581464, 1, 1, 1, 1, 1,
0.4004157, -0.0781638, 1.142007, 1, 1, 1, 1, 1,
0.4017153, -2.287378, 4.392237, 1, 1, 1, 1, 1,
0.4034064, 1.295915, 0.4821067, 1, 1, 1, 1, 1,
0.4041687, -0.04763344, 1.258216, 1, 1, 1, 1, 1,
0.405962, 0.4693063, 0.3655762, 1, 1, 1, 1, 1,
0.4098766, -0.1986917, 2.416146, 0, 0, 1, 1, 1,
0.4107153, 0.6953472, 0.67542, 1, 0, 0, 1, 1,
0.4128475, -1.348521, 1.923394, 1, 0, 0, 1, 1,
0.4139318, 0.2604032, 0.2160685, 1, 0, 0, 1, 1,
0.4216846, -0.2005264, 3.875699, 1, 0, 0, 1, 1,
0.4232709, -0.1716471, 3.295171, 1, 0, 0, 1, 1,
0.4289085, -0.7215422, 3.392832, 0, 0, 0, 1, 1,
0.4297933, 1.281741, -1.41944, 0, 0, 0, 1, 1,
0.4380586, 0.05635906, 1.22169, 0, 0, 0, 1, 1,
0.4389694, -1.41404, 3.932958, 0, 0, 0, 1, 1,
0.4400345, 1.085596, -1.047388, 0, 0, 0, 1, 1,
0.4416342, 0.6247063, 1.360714, 0, 0, 0, 1, 1,
0.4418696, -0.743578, 2.189097, 0, 0, 0, 1, 1,
0.4446042, -0.1596042, 1.446191, 1, 1, 1, 1, 1,
0.4454379, -1.368862, 3.622226, 1, 1, 1, 1, 1,
0.4454777, -0.06962673, 2.51057, 1, 1, 1, 1, 1,
0.4522706, 0.9798225, 0.4582261, 1, 1, 1, 1, 1,
0.4628394, 1.33535, 1.202293, 1, 1, 1, 1, 1,
0.4629014, -0.4804565, 1.32302, 1, 1, 1, 1, 1,
0.4666767, -1.763584, 2.677832, 1, 1, 1, 1, 1,
0.4712317, 0.2812669, 0.1199941, 1, 1, 1, 1, 1,
0.4733873, 1.2292, 0.3418674, 1, 1, 1, 1, 1,
0.4751959, 0.8733669, 0.3371323, 1, 1, 1, 1, 1,
0.4773446, 0.5855719, 1.035456, 1, 1, 1, 1, 1,
0.4805167, 1.127824, -0.4240198, 1, 1, 1, 1, 1,
0.4814434, 0.6184997, 2.04794, 1, 1, 1, 1, 1,
0.482796, -1.279346, 3.681694, 1, 1, 1, 1, 1,
0.4884322, -1.624127, 3.684046, 1, 1, 1, 1, 1,
0.494305, -1.376989, 1.238818, 0, 0, 1, 1, 1,
0.4945617, -0.8988381, 1.851914, 1, 0, 0, 1, 1,
0.5021743, 0.01741515, 1.30336, 1, 0, 0, 1, 1,
0.5022283, 0.4594095, 0.8424546, 1, 0, 0, 1, 1,
0.5054104, -0.2597466, 2.26457, 1, 0, 0, 1, 1,
0.505661, -1.150232, 2.318615, 1, 0, 0, 1, 1,
0.5194559, 1.417671, 0.3729357, 0, 0, 0, 1, 1,
0.5214086, -0.5367894, 1.94713, 0, 0, 0, 1, 1,
0.5317851, 1.224889, -1.363476, 0, 0, 0, 1, 1,
0.5319067, -1.077431, 2.670702, 0, 0, 0, 1, 1,
0.531908, 0.4379094, 2.999599, 0, 0, 0, 1, 1,
0.5361082, -1.981931, 2.664864, 0, 0, 0, 1, 1,
0.5375139, -0.8567927, 2.647568, 0, 0, 0, 1, 1,
0.5391183, -0.1489617, 2.046484, 1, 1, 1, 1, 1,
0.5429165, 1.011244, -0.3851035, 1, 1, 1, 1, 1,
0.5442287, 1.048124, 2.771317, 1, 1, 1, 1, 1,
0.5451159, -0.6375607, 2.241102, 1, 1, 1, 1, 1,
0.5481971, -0.2876746, 2.535438, 1, 1, 1, 1, 1,
0.548921, 1.3557, 0.3675101, 1, 1, 1, 1, 1,
0.5531852, -0.9210803, 2.93915, 1, 1, 1, 1, 1,
0.5571252, -0.7964721, 2.1168, 1, 1, 1, 1, 1,
0.5576908, -0.4782245, 2.886672, 1, 1, 1, 1, 1,
0.5577195, 1.726446, 1.318045, 1, 1, 1, 1, 1,
0.5602401, 0.3229946, -0.2923013, 1, 1, 1, 1, 1,
0.5660053, 0.291024, 1.07259, 1, 1, 1, 1, 1,
0.5670606, -0.8164256, 1.574538, 1, 1, 1, 1, 1,
0.5674205, 2.273394, -0.7369287, 1, 1, 1, 1, 1,
0.5716261, 0.2906323, 1.520322, 1, 1, 1, 1, 1,
0.5748951, 1.169175, 2.499448, 0, 0, 1, 1, 1,
0.5783848, 0.7239426, 1.080052, 1, 0, 0, 1, 1,
0.5801699, -0.7772968, 0.9064279, 1, 0, 0, 1, 1,
0.5832536, -0.8208637, 4.529881, 1, 0, 0, 1, 1,
0.5834516, 1.213093, 1.138649, 1, 0, 0, 1, 1,
0.5842025, 1.203173, 1.60114, 1, 0, 0, 1, 1,
0.5854161, 1.285136, 0.9488588, 0, 0, 0, 1, 1,
0.5854446, 1.592086, 1.085526, 0, 0, 0, 1, 1,
0.5913364, -0.5259111, 1.101396, 0, 0, 0, 1, 1,
0.594223, -0.5525636, 3.337538, 0, 0, 0, 1, 1,
0.594666, -1.884097, 1.770856, 0, 0, 0, 1, 1,
0.5955163, -0.1604503, 3.249678, 0, 0, 0, 1, 1,
0.5995007, -1.333901, 3.715443, 0, 0, 0, 1, 1,
0.5995331, -0.4378542, 1.037623, 1, 1, 1, 1, 1,
0.599614, -1.382233, 2.18424, 1, 1, 1, 1, 1,
0.6013083, 0.7484191, 1.54745, 1, 1, 1, 1, 1,
0.6033967, 0.5104443, 3.037968, 1, 1, 1, 1, 1,
0.6101526, -0.7746363, 2.330995, 1, 1, 1, 1, 1,
0.6123696, -0.3379043, 3.698829, 1, 1, 1, 1, 1,
0.6238253, -0.8401781, 1.438945, 1, 1, 1, 1, 1,
0.6292052, 0.2190674, 2.210876, 1, 1, 1, 1, 1,
0.6326799, 0.5378328, 2.596875, 1, 1, 1, 1, 1,
0.632697, -1.252289, 0.6551021, 1, 1, 1, 1, 1,
0.6354736, 2.454168, 1.688447, 1, 1, 1, 1, 1,
0.6363636, -0.3633797, 2.47433, 1, 1, 1, 1, 1,
0.637373, -0.1246769, 0.8670658, 1, 1, 1, 1, 1,
0.638762, 0.9424714, 0.1100624, 1, 1, 1, 1, 1,
0.6396019, -1.447391, 1.797544, 1, 1, 1, 1, 1,
0.6433056, 0.6262212, 0.940001, 0, 0, 1, 1, 1,
0.6433554, 1.627693, -0.5557818, 1, 0, 0, 1, 1,
0.6487236, 1.062914, 0.1499802, 1, 0, 0, 1, 1,
0.6494586, -1.557481, 2.356404, 1, 0, 0, 1, 1,
0.650149, 0.8220507, 2.474922, 1, 0, 0, 1, 1,
0.6585583, -0.3780165, 2.302336, 1, 0, 0, 1, 1,
0.6630519, 0.6124976, 1.293463, 0, 0, 0, 1, 1,
0.6653025, 0.2391122, 0.7847133, 0, 0, 0, 1, 1,
0.6702878, 1.294348, 1.197049, 0, 0, 0, 1, 1,
0.6720513, -1.761874, 3.64949, 0, 0, 0, 1, 1,
0.6738916, 0.2623329, 0.8748361, 0, 0, 0, 1, 1,
0.6779715, -0.981298, 2.166627, 0, 0, 0, 1, 1,
0.6906707, 2.098248, 0.2493435, 0, 0, 0, 1, 1,
0.6968859, -0.3987851, 1.00252, 1, 1, 1, 1, 1,
0.6979474, -0.9498058, 2.255282, 1, 1, 1, 1, 1,
0.7004985, -1.779348, 3.695312, 1, 1, 1, 1, 1,
0.7048047, 1.208103, -0.2182212, 1, 1, 1, 1, 1,
0.7097761, 1.510382, 0.090554, 1, 1, 1, 1, 1,
0.7100639, 0.2149438, 1.599816, 1, 1, 1, 1, 1,
0.7109803, -1.229638, 3.379879, 1, 1, 1, 1, 1,
0.7167522, 1.169255, -0.7990837, 1, 1, 1, 1, 1,
0.716929, -0.1870981, 0.2015172, 1, 1, 1, 1, 1,
0.720693, -0.02492543, 2.025787, 1, 1, 1, 1, 1,
0.724116, 0.01250182, 3.525297, 1, 1, 1, 1, 1,
0.7284954, 2.394331, -0.8845168, 1, 1, 1, 1, 1,
0.7293664, 0.1171961, -0.5379512, 1, 1, 1, 1, 1,
0.730244, -0.1628547, 2.133828, 1, 1, 1, 1, 1,
0.7378644, 0.363332, 1.166585, 1, 1, 1, 1, 1,
0.7395086, -0.3587164, 1.676913, 0, 0, 1, 1, 1,
0.7401695, 0.9687035, 0.2175864, 1, 0, 0, 1, 1,
0.7436657, -0.0753374, 1.563151, 1, 0, 0, 1, 1,
0.7438303, 1.540942, 1.081571, 1, 0, 0, 1, 1,
0.7489319, 2.39774, -1.64139, 1, 0, 0, 1, 1,
0.7523673, -1.018745, 1.852738, 1, 0, 0, 1, 1,
0.7564709, 0.1134218, -0.4384425, 0, 0, 0, 1, 1,
0.7701252, 0.1951919, 1.008854, 0, 0, 0, 1, 1,
0.7715452, 0.3487814, 0.7294837, 0, 0, 0, 1, 1,
0.7766581, 0.02006451, 1.343119, 0, 0, 0, 1, 1,
0.7838998, -0.7398521, 2.936447, 0, 0, 0, 1, 1,
0.7866902, -1.059563, 2.272423, 0, 0, 0, 1, 1,
0.7878013, -0.3435154, 1.54033, 0, 0, 0, 1, 1,
0.7918146, 1.000124, 0.05398214, 1, 1, 1, 1, 1,
0.7922693, -0.4272971, 2.702423, 1, 1, 1, 1, 1,
0.7923097, -1.974644, 3.44869, 1, 1, 1, 1, 1,
0.7937919, -0.8836862, 4.010194, 1, 1, 1, 1, 1,
0.7960774, -0.2089859, 0.7323673, 1, 1, 1, 1, 1,
0.8008088, 0.2420332, 1.90627, 1, 1, 1, 1, 1,
0.8015002, -0.3226861, 2.225399, 1, 1, 1, 1, 1,
0.8016465, 0.6645886, 0.6796909, 1, 1, 1, 1, 1,
0.8057028, -0.1569028, 2.677882, 1, 1, 1, 1, 1,
0.8126612, 1.557527, -0.5092725, 1, 1, 1, 1, 1,
0.8158242, -0.1070114, 0.3626263, 1, 1, 1, 1, 1,
0.8172771, -1.246698, 2.363324, 1, 1, 1, 1, 1,
0.8198447, -0.7359903, 1.800595, 1, 1, 1, 1, 1,
0.8334429, 0.2407481, 1.663521, 1, 1, 1, 1, 1,
0.8343397, -0.5895641, 2.36001, 1, 1, 1, 1, 1,
0.8360402, -1.952257, 1.44933, 0, 0, 1, 1, 1,
0.8368858, 0.8865194, 1.565427, 1, 0, 0, 1, 1,
0.8400535, -0.7805374, 1.239084, 1, 0, 0, 1, 1,
0.8419936, 0.6989367, -0.8140527, 1, 0, 0, 1, 1,
0.8462613, -0.2481894, 0.3848817, 1, 0, 0, 1, 1,
0.8487865, -0.3140434, 1.781866, 1, 0, 0, 1, 1,
0.8556382, -1.651616, 1.777781, 0, 0, 0, 1, 1,
0.858424, -0.8006768, 2.851677, 0, 0, 0, 1, 1,
0.8607486, -0.9845566, 2.565811, 0, 0, 0, 1, 1,
0.8607535, 0.1267441, 2.82316, 0, 0, 0, 1, 1,
0.8681971, -1.352164, 3.836087, 0, 0, 0, 1, 1,
0.8705281, -0.1784746, 4.797606, 0, 0, 0, 1, 1,
0.8717703, -0.3423766, 2.877224, 0, 0, 0, 1, 1,
0.8727276, -0.1561223, 3.163543, 1, 1, 1, 1, 1,
0.8741888, 0.4214844, 3.29002, 1, 1, 1, 1, 1,
0.8786069, -0.4426986, 1.053347, 1, 1, 1, 1, 1,
0.8792126, -0.09742128, 1.813045, 1, 1, 1, 1, 1,
0.8793128, -0.1881613, 2.948598, 1, 1, 1, 1, 1,
0.8856074, -0.2304617, 0.713412, 1, 1, 1, 1, 1,
0.8896059, 0.08056326, 2.729786, 1, 1, 1, 1, 1,
0.8899957, 1.232363, 1.250096, 1, 1, 1, 1, 1,
0.8900899, -0.8555151, 1.435077, 1, 1, 1, 1, 1,
0.8910719, 0.584347, -0.07848599, 1, 1, 1, 1, 1,
0.8950117, 2.083978, 1.633998, 1, 1, 1, 1, 1,
0.898971, 0.2867908, 0.9641579, 1, 1, 1, 1, 1,
0.8992283, 0.7540048, 0.2829112, 1, 1, 1, 1, 1,
0.9074386, -0.07355196, 1.273944, 1, 1, 1, 1, 1,
0.9108465, 0.1688807, 2.541188, 1, 1, 1, 1, 1,
0.9112812, 1.041371, 1.575601, 0, 0, 1, 1, 1,
0.9127551, 0.6370345, -0.4863354, 1, 0, 0, 1, 1,
0.9130555, -1.401702, 2.752048, 1, 0, 0, 1, 1,
0.9201817, -0.2864185, -0.2645465, 1, 0, 0, 1, 1,
0.9255003, 1.309182, 1.133583, 1, 0, 0, 1, 1,
0.9313007, 0.2175623, 2.246075, 1, 0, 0, 1, 1,
0.935184, -0.5086034, 1.956635, 0, 0, 0, 1, 1,
0.9361209, 0.01830981, 2.646259, 0, 0, 0, 1, 1,
0.9403289, 0.7828588, -0.1788674, 0, 0, 0, 1, 1,
0.9420639, 0.5294645, 2.388257, 0, 0, 0, 1, 1,
0.9426007, 0.2008696, 2.389199, 0, 0, 0, 1, 1,
0.9427911, 0.4130852, 0.2391577, 0, 0, 0, 1, 1,
0.9453614, 0.8935781, 2.135318, 0, 0, 0, 1, 1,
0.9491345, -1.192054, 1.623417, 1, 1, 1, 1, 1,
0.9539866, -1.383415, 2.851253, 1, 1, 1, 1, 1,
0.9541788, -1.552314, 3.296711, 1, 1, 1, 1, 1,
0.959021, 0.8514748, 1.076546, 1, 1, 1, 1, 1,
0.9602576, -1.035933, 1.257365, 1, 1, 1, 1, 1,
0.960941, -0.1420254, 1.713964, 1, 1, 1, 1, 1,
0.9621845, -0.9474441, 3.55676, 1, 1, 1, 1, 1,
0.9672127, -1.624312, 3.204164, 1, 1, 1, 1, 1,
0.9735777, 0.3308637, 0.2026582, 1, 1, 1, 1, 1,
0.9778553, -0.9449127, 1.412292, 1, 1, 1, 1, 1,
0.9779528, -0.7692888, 3.528177, 1, 1, 1, 1, 1,
0.980841, -1.343682, 2.124031, 1, 1, 1, 1, 1,
0.9914332, 0.04788269, 2.024606, 1, 1, 1, 1, 1,
0.9990889, -1.467881, 2.366685, 1, 1, 1, 1, 1,
1.002943, -1.035187, 2.671155, 1, 1, 1, 1, 1,
1.01198, 2.295325, 2.700072, 0, 0, 1, 1, 1,
1.01338, 0.6925682, 0.2999412, 1, 0, 0, 1, 1,
1.02357, -0.951269, 2.219263, 1, 0, 0, 1, 1,
1.02364, -0.9727539, 0.7211095, 1, 0, 0, 1, 1,
1.024907, 0.4179652, 1.285971, 1, 0, 0, 1, 1,
1.028842, 0.7583341, 1.570791, 1, 0, 0, 1, 1,
1.029785, 0.8091726, 1.420118, 0, 0, 0, 1, 1,
1.034878, 1.260847, 0.8985408, 0, 0, 0, 1, 1,
1.047139, -0.9991028, 0.9012405, 0, 0, 0, 1, 1,
1.050196, -0.2592965, 2.973522, 0, 0, 0, 1, 1,
1.053571, -0.6102551, 0.499106, 0, 0, 0, 1, 1,
1.058834, -0.1964797, 1.881399, 0, 0, 0, 1, 1,
1.059679, 0.5660003, 0.5525954, 0, 0, 0, 1, 1,
1.060748, 0.2166171, -1.096377, 1, 1, 1, 1, 1,
1.062467, 2.703908, 1.318245, 1, 1, 1, 1, 1,
1.066902, 1.259721, 0.1880217, 1, 1, 1, 1, 1,
1.069745, 1.737397, 1.019152, 1, 1, 1, 1, 1,
1.074124, 1.580359, -0.8697703, 1, 1, 1, 1, 1,
1.086432, -1.087941, 2.819905, 1, 1, 1, 1, 1,
1.090153, -1.898983, 2.766831, 1, 1, 1, 1, 1,
1.096062, -0.2891774, 1.393275, 1, 1, 1, 1, 1,
1.10066, -0.560564, 3.272859, 1, 1, 1, 1, 1,
1.101328, -0.9678439, 0.1073852, 1, 1, 1, 1, 1,
1.10627, 0.5403555, 1.891003, 1, 1, 1, 1, 1,
1.108915, -0.4138944, 1.512531, 1, 1, 1, 1, 1,
1.120305, 0.6163888, 1.528834, 1, 1, 1, 1, 1,
1.123639, -0.6292809, 0.8610308, 1, 1, 1, 1, 1,
1.124802, -1.605337, 1.839647, 1, 1, 1, 1, 1,
1.125074, 1.418101, 0.4891297, 0, 0, 1, 1, 1,
1.127099, -0.9311073, 2.868737, 1, 0, 0, 1, 1,
1.128555, -0.03707894, 2.446961, 1, 0, 0, 1, 1,
1.128767, -0.2626098, 1.866805, 1, 0, 0, 1, 1,
1.131058, -0.3116097, 1.117695, 1, 0, 0, 1, 1,
1.132575, 2.275855, -1.869759, 1, 0, 0, 1, 1,
1.132672, 1.876764, -0.02843693, 0, 0, 0, 1, 1,
1.137259, 0.07070515, 0.1913673, 0, 0, 0, 1, 1,
1.145332, -0.422303, 3.051611, 0, 0, 0, 1, 1,
1.145939, 0.5355697, 1.251613, 0, 0, 0, 1, 1,
1.15963, -0.8690262, 3.877922, 0, 0, 0, 1, 1,
1.160498, 1.262196, 1.046197, 0, 0, 0, 1, 1,
1.167987, -0.1011339, 1.939066, 0, 0, 0, 1, 1,
1.16929, -0.8280672, 2.657562, 1, 1, 1, 1, 1,
1.173021, 1.646505, 0.916834, 1, 1, 1, 1, 1,
1.17401, 1.313501, 1.529104, 1, 1, 1, 1, 1,
1.176597, -0.7366914, 2.041598, 1, 1, 1, 1, 1,
1.179363, 0.6437267, -0.9861661, 1, 1, 1, 1, 1,
1.180215, -0.6434882, 1.820536, 1, 1, 1, 1, 1,
1.190872, -0.5118365, 2.207569, 1, 1, 1, 1, 1,
1.19179, 0.6051064, 0.9929878, 1, 1, 1, 1, 1,
1.198345, 0.3059193, 3.206868, 1, 1, 1, 1, 1,
1.202036, -0.3072275, 1.143286, 1, 1, 1, 1, 1,
1.213684, 0.440602, 1.396607, 1, 1, 1, 1, 1,
1.221603, -0.1508499, 1.522757, 1, 1, 1, 1, 1,
1.23284, 0.4114744, 1.088563, 1, 1, 1, 1, 1,
1.235615, -1.292391, 2.308273, 1, 1, 1, 1, 1,
1.236936, -0.3766778, 0.6762542, 1, 1, 1, 1, 1,
1.237538, 1.147734, -0.983878, 0, 0, 1, 1, 1,
1.239338, 0.8885893, 1.978386, 1, 0, 0, 1, 1,
1.27114, -0.9544348, 3.728261, 1, 0, 0, 1, 1,
1.272454, -1.237628, 3.045542, 1, 0, 0, 1, 1,
1.272623, 0.4446559, -0.6514645, 1, 0, 0, 1, 1,
1.273838, 0.8982067, 1.15255, 1, 0, 0, 1, 1,
1.276339, 0.9364526, 3.143927, 0, 0, 0, 1, 1,
1.276831, 0.2306038, -0.04749689, 0, 0, 0, 1, 1,
1.278315, 1.081917, 2.578504, 0, 0, 0, 1, 1,
1.285968, -1.221605, 2.50972, 0, 0, 0, 1, 1,
1.288247, -0.2652742, 1.526844, 0, 0, 0, 1, 1,
1.293408, 0.004300137, 0.3752503, 0, 0, 0, 1, 1,
1.308347, 0.1167083, 1.49323, 0, 0, 0, 1, 1,
1.310257, -1.028117, 2.238444, 1, 1, 1, 1, 1,
1.310939, -0.9185327, 2.683817, 1, 1, 1, 1, 1,
1.312761, 0.1814779, 1.780061, 1, 1, 1, 1, 1,
1.323075, -0.699336, 2.328504, 1, 1, 1, 1, 1,
1.323297, 0.5246975, 0.1298511, 1, 1, 1, 1, 1,
1.330835, -0.1355495, -0.1621704, 1, 1, 1, 1, 1,
1.333132, 1.927798, 0.1307628, 1, 1, 1, 1, 1,
1.348759, 0.6541308, 1.556832, 1, 1, 1, 1, 1,
1.357244, 0.6010242, 1.177063, 1, 1, 1, 1, 1,
1.361325, 0.7633092, 0.08830988, 1, 1, 1, 1, 1,
1.371735, -0.6013349, 0.8249545, 1, 1, 1, 1, 1,
1.391152, 1.38346, 1.017047, 1, 1, 1, 1, 1,
1.394018, -0.1836733, 1.241517, 1, 1, 1, 1, 1,
1.396341, -0.9131553, 4.151129, 1, 1, 1, 1, 1,
1.40783, -3.013659, 0.1949456, 1, 1, 1, 1, 1,
1.410612, -0.3860087, -0.7326145, 0, 0, 1, 1, 1,
1.421376, 0.7718909, 1.474695, 1, 0, 0, 1, 1,
1.42831, -1.552546, 1.908039, 1, 0, 0, 1, 1,
1.434151, 1.232603, -0.2341505, 1, 0, 0, 1, 1,
1.435004, -0.6810584, 1.409825, 1, 0, 0, 1, 1,
1.435662, 0.3695391, 1.264623, 1, 0, 0, 1, 1,
1.443829, -1.262124, 2.410707, 0, 0, 0, 1, 1,
1.445545, 0.4562082, 0.9290494, 0, 0, 0, 1, 1,
1.461499, 1.619774, -0.312247, 0, 0, 0, 1, 1,
1.462092, 0.5360151, 0.1342351, 0, 0, 0, 1, 1,
1.468636, 0.2420302, 0.725289, 0, 0, 0, 1, 1,
1.485742, -0.7161585, 0.9774675, 0, 0, 0, 1, 1,
1.489012, 0.9868362, 0.6691194, 0, 0, 0, 1, 1,
1.493574, -1.232574, 2.170671, 1, 1, 1, 1, 1,
1.495084, 0.9744296, 2.043892, 1, 1, 1, 1, 1,
1.510137, 2.028029, 1.62097, 1, 1, 1, 1, 1,
1.518674, -1.223047, 1.321036, 1, 1, 1, 1, 1,
1.524046, -0.8232986, 2.172809, 1, 1, 1, 1, 1,
1.526926, 1.945135, 1.531424, 1, 1, 1, 1, 1,
1.529338, 0.02341961, 1.844069, 1, 1, 1, 1, 1,
1.531706, -1.082686, 2.114684, 1, 1, 1, 1, 1,
1.544952, -0.1038214, 1.249921, 1, 1, 1, 1, 1,
1.553535, 0.9269338, 0.8567951, 1, 1, 1, 1, 1,
1.578288, 0.7440845, 1.665618, 1, 1, 1, 1, 1,
1.590639, 1.030949, 0.4504354, 1, 1, 1, 1, 1,
1.605466, 0.2272644, 2.809361, 1, 1, 1, 1, 1,
1.623794, -0.1917284, 0.1614104, 1, 1, 1, 1, 1,
1.624885, -0.06240162, 2.434354, 1, 1, 1, 1, 1,
1.648373, -0.3417075, 2.942546, 0, 0, 1, 1, 1,
1.654674, 0.6410319, 1.860144, 1, 0, 0, 1, 1,
1.667543, -0.846756, 1.258308, 1, 0, 0, 1, 1,
1.682269, 0.1559017, 1.506898, 1, 0, 0, 1, 1,
1.688687, -0.8564937, 0.3120058, 1, 0, 0, 1, 1,
1.689113, 0.7005546, 0.9624984, 1, 0, 0, 1, 1,
1.693593, 1.205653, 0.5821392, 0, 0, 0, 1, 1,
1.695722, -2.618334, 2.421698, 0, 0, 0, 1, 1,
1.696413, -0.6086084, 2.230909, 0, 0, 0, 1, 1,
1.719375, 0.5628674, 0.7197417, 0, 0, 0, 1, 1,
1.753799, 0.251748, 1.386365, 0, 0, 0, 1, 1,
1.780624, 0.7232856, 2.327937, 0, 0, 0, 1, 1,
1.78099, 0.2957696, 2.7886, 0, 0, 0, 1, 1,
1.808076, -0.7560689, 1.62459, 1, 1, 1, 1, 1,
1.813183, -1.103282, -0.06773999, 1, 1, 1, 1, 1,
1.831715, -0.352809, 1.814498, 1, 1, 1, 1, 1,
1.835933, -2.6183, 3.145372, 1, 1, 1, 1, 1,
1.841488, 1.509979, -0.5497314, 1, 1, 1, 1, 1,
1.841542, 0.5129336, 2.766466, 1, 1, 1, 1, 1,
1.892624, -0.328761, 0.9554924, 1, 1, 1, 1, 1,
1.897756, 0.8253697, 0.9622661, 1, 1, 1, 1, 1,
1.912416, -0.6707489, 1.390067, 1, 1, 1, 1, 1,
1.936357, 2.460529, 2.822545, 1, 1, 1, 1, 1,
1.957213, 0.3155994, 1.498526, 1, 1, 1, 1, 1,
1.977576, -1.276, 2.941028, 1, 1, 1, 1, 1,
2.037005, -0.00480306, 0.9724389, 1, 1, 1, 1, 1,
2.045033, 0.2264079, 0.4482667, 1, 1, 1, 1, 1,
2.052319, -0.750446, 2.601216, 1, 1, 1, 1, 1,
2.105748, -2.276105, 3.460209, 0, 0, 1, 1, 1,
2.131196, -1.11658, 1.068025, 1, 0, 0, 1, 1,
2.164147, -0.2262362, 0.5706248, 1, 0, 0, 1, 1,
2.178993, -0.9431264, 3.578107, 1, 0, 0, 1, 1,
2.236077, 1.104791, 1.843686, 1, 0, 0, 1, 1,
2.253413, 1.40672, 0.0948987, 1, 0, 0, 1, 1,
2.261267, -0.8062304, 1.36773, 0, 0, 0, 1, 1,
2.278548, 1.155619, 1.406765, 0, 0, 0, 1, 1,
2.282655, -0.1646916, 0.451429, 0, 0, 0, 1, 1,
2.29177, -0.7811654, 2.081788, 0, 0, 0, 1, 1,
2.415072, -0.8854879, 1.795002, 0, 0, 0, 1, 1,
2.494708, 1.80134, -0.4781031, 0, 0, 0, 1, 1,
2.585576, 0.2328597, 2.305536, 0, 0, 0, 1, 1,
2.599852, -1.900142, 2.687728, 1, 1, 1, 1, 1,
2.632154, -2.537935, 3.774457, 1, 1, 1, 1, 1,
2.661163, -0.4176908, 2.147653, 1, 1, 1, 1, 1,
2.797754, -0.7270244, 1.528299, 1, 1, 1, 1, 1,
2.801846, -0.5846933, 2.230698, 1, 1, 1, 1, 1,
2.993162, 1.859244, 1.660145, 1, 1, 1, 1, 1,
3.03832, -0.1926817, 1.092637, 1, 1, 1, 1, 1
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
var radius = 9.300235;
var distance = 32.66668;
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
mvMatrix.translate( -0.07593238, 0.1548752, 0.2211783 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66668);
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
