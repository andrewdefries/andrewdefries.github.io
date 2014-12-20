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
-3.301176, -0.6274763, -2.71041, 1, 0, 0, 1,
-3.154679, 1.175082, -0.2793379, 1, 0.007843138, 0, 1,
-2.993786, 2.819277, -1.138443, 1, 0.01176471, 0, 1,
-2.842542, -0.5799065, -0.3787921, 1, 0.01960784, 0, 1,
-2.663225, 0.1335519, -2.638696, 1, 0.02352941, 0, 1,
-2.454696, -0.6811563, -2.492325, 1, 0.03137255, 0, 1,
-2.44091, -1.526545, -2.475231, 1, 0.03529412, 0, 1,
-2.369201, -0.165682, -0.935172, 1, 0.04313726, 0, 1,
-2.261441, -0.6218349, -2.770734, 1, 0.04705882, 0, 1,
-2.259878, -0.2902627, -1.850028, 1, 0.05490196, 0, 1,
-2.230064, -1.026646, -2.088391, 1, 0.05882353, 0, 1,
-2.160922, -0.9002354, -1.425943, 1, 0.06666667, 0, 1,
-2.101838, 0.3476264, 1.840976, 1, 0.07058824, 0, 1,
-2.058121, -1.676984, -0.6453413, 1, 0.07843138, 0, 1,
-2.048942, -1.382601, -2.092508, 1, 0.08235294, 0, 1,
-2.016153, 0.5961819, -2.945333, 1, 0.09019608, 0, 1,
-2.001409, -0.341538, -0.8118836, 1, 0.09411765, 0, 1,
-1.986301, 1.09489, 0.05750222, 1, 0.1019608, 0, 1,
-1.96239, -1.877897, -1.829107, 1, 0.1098039, 0, 1,
-1.960863, 0.04016135, -2.136391, 1, 0.1137255, 0, 1,
-1.948667, -0.8023621, -2.627518, 1, 0.1215686, 0, 1,
-1.941606, -0.1585607, -0.9584295, 1, 0.1254902, 0, 1,
-1.917303, 0.782915, -1.279572, 1, 0.1333333, 0, 1,
-1.901779, 1.084073, -1.872717, 1, 0.1372549, 0, 1,
-1.881306, 0.7029228, -0.9708683, 1, 0.145098, 0, 1,
-1.878058, 1.50605, -0.1680404, 1, 0.1490196, 0, 1,
-1.854155, -0.111194, -2.089824, 1, 0.1568628, 0, 1,
-1.827503, -0.1125322, -2.292227, 1, 0.1607843, 0, 1,
-1.819882, -0.8231965, -0.4093896, 1, 0.1686275, 0, 1,
-1.818425, -1.049464, -1.608058, 1, 0.172549, 0, 1,
-1.804895, 0.7732422, -2.023979, 1, 0.1803922, 0, 1,
-1.796609, 1.181183, -1.162747, 1, 0.1843137, 0, 1,
-1.777883, 0.3331767, -0.8466364, 1, 0.1921569, 0, 1,
-1.771165, -0.9106816, -3.289526, 1, 0.1960784, 0, 1,
-1.728931, -1.019818, 0.6476345, 1, 0.2039216, 0, 1,
-1.697619, 0.6257446, -1.813855, 1, 0.2117647, 0, 1,
-1.697323, 0.9498141, -1.123184, 1, 0.2156863, 0, 1,
-1.690229, 0.9898979, -1.987146, 1, 0.2235294, 0, 1,
-1.667337, -1.205083, -1.730183, 1, 0.227451, 0, 1,
-1.662706, 1.433338, -0.9150655, 1, 0.2352941, 0, 1,
-1.659484, -0.6264666, -1.895425, 1, 0.2392157, 0, 1,
-1.65833, 0.5600988, -0.4714348, 1, 0.2470588, 0, 1,
-1.643153, -0.1336843, -0.9919946, 1, 0.2509804, 0, 1,
-1.623742, 0.848763, -1.039047, 1, 0.2588235, 0, 1,
-1.60223, -0.4644114, 0.03836104, 1, 0.2627451, 0, 1,
-1.596713, 0.7828706, -0.5917802, 1, 0.2705882, 0, 1,
-1.596568, 0.2181089, -2.626127, 1, 0.2745098, 0, 1,
-1.592371, -0.5422596, -0.3922963, 1, 0.282353, 0, 1,
-1.579672, 0.6641568, -0.7215875, 1, 0.2862745, 0, 1,
-1.574439, 0.7953602, -1.764475, 1, 0.2941177, 0, 1,
-1.569654, -0.4068814, -1.712363, 1, 0.3019608, 0, 1,
-1.566589, 1.776309, -2.273677, 1, 0.3058824, 0, 1,
-1.556732, 0.1673018, 0.7902884, 1, 0.3137255, 0, 1,
-1.549884, -1.898702, -3.775315, 1, 0.3176471, 0, 1,
-1.531012, 0.397722, -1.744758, 1, 0.3254902, 0, 1,
-1.520586, 0.8566493, -0.9077303, 1, 0.3294118, 0, 1,
-1.51074, 0.830196, -1.171816, 1, 0.3372549, 0, 1,
-1.508874, 2.655499, -1.31428, 1, 0.3411765, 0, 1,
-1.508177, -0.2740937, -3.013797, 1, 0.3490196, 0, 1,
-1.501512, 0.6907421, -0.9971304, 1, 0.3529412, 0, 1,
-1.493852, -0.2591074, -3.135809, 1, 0.3607843, 0, 1,
-1.491108, -0.5923279, -2.371085, 1, 0.3647059, 0, 1,
-1.489468, -2.048516, -2.440609, 1, 0.372549, 0, 1,
-1.487379, -0.7204131, -3.300704, 1, 0.3764706, 0, 1,
-1.479276, 0.4507672, 0.3409006, 1, 0.3843137, 0, 1,
-1.473848, -1.010308, -2.064642, 1, 0.3882353, 0, 1,
-1.465064, -0.7166729, -3.374986, 1, 0.3960784, 0, 1,
-1.454918, 1.146961, -0.1073616, 1, 0.4039216, 0, 1,
-1.450692, -0.07874219, -2.234643, 1, 0.4078431, 0, 1,
-1.448028, 1.997303, -0.3906605, 1, 0.4156863, 0, 1,
-1.446533, 0.8160657, -1.105694, 1, 0.4196078, 0, 1,
-1.445518, 1.623589, 0.9683271, 1, 0.427451, 0, 1,
-1.441314, -1.466033, -1.786593, 1, 0.4313726, 0, 1,
-1.419256, 0.475697, -2.839663, 1, 0.4392157, 0, 1,
-1.415595, -0.3470161, -2.719394, 1, 0.4431373, 0, 1,
-1.407197, 0.6964483, -1.769407, 1, 0.4509804, 0, 1,
-1.39233, 1.790268, -0.7893575, 1, 0.454902, 0, 1,
-1.385491, 1.507845, 0.0375478, 1, 0.4627451, 0, 1,
-1.385073, 1.309061, -0.5708382, 1, 0.4666667, 0, 1,
-1.382337, 0.451457, -0.5104055, 1, 0.4745098, 0, 1,
-1.375987, -0.8886881, -1.211958, 1, 0.4784314, 0, 1,
-1.361603, -0.5119987, -2.923593, 1, 0.4862745, 0, 1,
-1.358109, 1.783774, -0.9535608, 1, 0.4901961, 0, 1,
-1.357188, -0.7703795, -2.670605, 1, 0.4980392, 0, 1,
-1.346821, 1.541565, -1.369522, 1, 0.5058824, 0, 1,
-1.343876, 1.084892, -1.150306, 1, 0.509804, 0, 1,
-1.325806, -0.8330643, -2.969985, 1, 0.5176471, 0, 1,
-1.321547, 0.6632888, -1.364356, 1, 0.5215687, 0, 1,
-1.321051, 0.7931063, -1.36664, 1, 0.5294118, 0, 1,
-1.320293, 0.1584101, -1.365594, 1, 0.5333334, 0, 1,
-1.316907, 1.355319, -1.013943, 1, 0.5411765, 0, 1,
-1.31615, 0.1810243, -0.56957, 1, 0.5450981, 0, 1,
-1.31464, 0.5850086, -2.015792, 1, 0.5529412, 0, 1,
-1.30997, 0.5551545, -2.157316, 1, 0.5568628, 0, 1,
-1.304776, 0.2014198, -1.644706, 1, 0.5647059, 0, 1,
-1.304621, 1.7587, 0.8062767, 1, 0.5686275, 0, 1,
-1.30292, 1.485305, -0.5070048, 1, 0.5764706, 0, 1,
-1.298954, 0.2859502, -0.8569095, 1, 0.5803922, 0, 1,
-1.288658, 0.07364842, -0.9962906, 1, 0.5882353, 0, 1,
-1.288454, -0.1516101, -1.367836, 1, 0.5921569, 0, 1,
-1.284404, 0.5121214, 0.7165241, 1, 0.6, 0, 1,
-1.277422, -0.1051111, -1.798133, 1, 0.6078432, 0, 1,
-1.268623, -0.3418002, -1.366053, 1, 0.6117647, 0, 1,
-1.255813, 0.3468081, -2.658551, 1, 0.6196079, 0, 1,
-1.252917, 1.075028, 0.2907473, 1, 0.6235294, 0, 1,
-1.252315, 0.6749712, 0.8201208, 1, 0.6313726, 0, 1,
-1.234943, 0.3065321, -2.082457, 1, 0.6352941, 0, 1,
-1.218468, -1.713971, -2.078723, 1, 0.6431373, 0, 1,
-1.215958, 0.4565122, -2.643882, 1, 0.6470588, 0, 1,
-1.214561, 0.588042, -1.997668, 1, 0.654902, 0, 1,
-1.214095, 1.319925, -1.749394, 1, 0.6588235, 0, 1,
-1.208816, -0.2917058, -1.807727, 1, 0.6666667, 0, 1,
-1.208728, 1.071717, -3.385955, 1, 0.6705883, 0, 1,
-1.194042, -1.169457, -2.772988, 1, 0.6784314, 0, 1,
-1.18745, 0.5011147, -0.714784, 1, 0.682353, 0, 1,
-1.181497, 1.011986, -1.884086, 1, 0.6901961, 0, 1,
-1.173188, 1.507929, 0.4315219, 1, 0.6941177, 0, 1,
-1.171804, 0.01236161, 0.233565, 1, 0.7019608, 0, 1,
-1.166056, -1.014108, -2.695254, 1, 0.7098039, 0, 1,
-1.161819, -1.383561, -2.813318, 1, 0.7137255, 0, 1,
-1.149333, 0.2511027, -0.6722537, 1, 0.7215686, 0, 1,
-1.145624, -1.016229, -2.543557, 1, 0.7254902, 0, 1,
-1.14547, -0.1943487, -1.458721, 1, 0.7333333, 0, 1,
-1.131294, 0.5946043, -1.438289, 1, 0.7372549, 0, 1,
-1.124765, -1.131111, -2.768636, 1, 0.7450981, 0, 1,
-1.121091, 0.2933448, -1.809579, 1, 0.7490196, 0, 1,
-1.121003, 0.9399357, 0.9901392, 1, 0.7568628, 0, 1,
-1.115973, 0.4004718, -0.7170879, 1, 0.7607843, 0, 1,
-1.115388, 0.5417237, -1.704349, 1, 0.7686275, 0, 1,
-1.113657, -0.5146051, -0.8666684, 1, 0.772549, 0, 1,
-1.110278, -1.769494, -4.234091, 1, 0.7803922, 0, 1,
-1.10769, 0.9247111, -0.6384037, 1, 0.7843137, 0, 1,
-1.106143, 0.06050329, -0.6064885, 1, 0.7921569, 0, 1,
-1.098026, -0.5335934, -2.51813, 1, 0.7960784, 0, 1,
-1.09706, -0.8010964, -4.141906, 1, 0.8039216, 0, 1,
-1.076366, 1.251938, 0.8122947, 1, 0.8117647, 0, 1,
-1.071975, 2.001186, -0.5699942, 1, 0.8156863, 0, 1,
-1.07065, 0.2756163, -1.611241, 1, 0.8235294, 0, 1,
-1.067313, -0.7138351, -2.2103, 1, 0.827451, 0, 1,
-1.06132, 1.067368, -0.4418881, 1, 0.8352941, 0, 1,
-1.053758, -2.025551, -2.685474, 1, 0.8392157, 0, 1,
-1.048644, -0.03446288, -2.583682, 1, 0.8470588, 0, 1,
-1.045227, -0.5809032, -2.31396, 1, 0.8509804, 0, 1,
-1.041162, 0.854793, 0.01003417, 1, 0.8588235, 0, 1,
-1.040084, -2.659632, -1.457634, 1, 0.8627451, 0, 1,
-1.038012, 0.5097077, -1.282563, 1, 0.8705882, 0, 1,
-1.035536, -0.6487788, -2.228507, 1, 0.8745098, 0, 1,
-1.032789, -0.4725885, 0.05760272, 1, 0.8823529, 0, 1,
-1.029487, -0.3272649, -4.005823, 1, 0.8862745, 0, 1,
-1.022552, 0.3755453, -0.7627726, 1, 0.8941177, 0, 1,
-1.011487, 2.298111, 0.7583679, 1, 0.8980392, 0, 1,
-0.9951035, 0.1128372, -2.184951, 1, 0.9058824, 0, 1,
-0.9935836, -0.267497, -2.244666, 1, 0.9137255, 0, 1,
-0.9825877, -0.6767398, -2.724271, 1, 0.9176471, 0, 1,
-0.9718871, -0.1013622, -0.7743658, 1, 0.9254902, 0, 1,
-0.9680126, -1.444876, -3.08268, 1, 0.9294118, 0, 1,
-0.9620985, 0.2994471, -1.242885, 1, 0.9372549, 0, 1,
-0.960719, -0.3789373, -2.844658, 1, 0.9411765, 0, 1,
-0.9602802, -1.659021, -1.67179, 1, 0.9490196, 0, 1,
-0.9555302, 0.07733513, -1.657752, 1, 0.9529412, 0, 1,
-0.951373, -0.4541393, -2.279498, 1, 0.9607843, 0, 1,
-0.9375879, -0.5144144, -1.429859, 1, 0.9647059, 0, 1,
-0.9284433, 0.7386323, -0.7338702, 1, 0.972549, 0, 1,
-0.9249359, -1.391445, -2.800293, 1, 0.9764706, 0, 1,
-0.9214844, -0.1015467, -2.779404, 1, 0.9843137, 0, 1,
-0.9199407, -1.059671, -1.488187, 1, 0.9882353, 0, 1,
-0.9189764, 0.8088195, 0.0327251, 1, 0.9960784, 0, 1,
-0.916976, 0.442504, -1.394724, 0.9960784, 1, 0, 1,
-0.9080206, -0.5814976, -1.241488, 0.9921569, 1, 0, 1,
-0.903311, 1.375818, -2.009006, 0.9843137, 1, 0, 1,
-0.9020531, -0.2532864, -0.7115631, 0.9803922, 1, 0, 1,
-0.9013015, -1.253246, -5.208148, 0.972549, 1, 0, 1,
-0.9002109, -0.8857335, -2.714681, 0.9686275, 1, 0, 1,
-0.8933575, -1.613518, -1.190331, 0.9607843, 1, 0, 1,
-0.8886163, -0.1927999, -2.285148, 0.9568627, 1, 0, 1,
-0.8875533, 1.222844, -0.2727264, 0.9490196, 1, 0, 1,
-0.8826159, -0.2681784, -0.09355912, 0.945098, 1, 0, 1,
-0.8811084, -1.0489, -0.8771183, 0.9372549, 1, 0, 1,
-0.8810964, -1.394578, -1.934555, 0.9333333, 1, 0, 1,
-0.877141, -0.02974307, -2.552162, 0.9254902, 1, 0, 1,
-0.8758416, 0.5901644, -0.1355254, 0.9215686, 1, 0, 1,
-0.872898, -1.254415, -2.427639, 0.9137255, 1, 0, 1,
-0.8684538, -0.2863467, -3.00843, 0.9098039, 1, 0, 1,
-0.8661422, -0.5014056, -1.985533, 0.9019608, 1, 0, 1,
-0.8599891, -1.024004, -1.60519, 0.8941177, 1, 0, 1,
-0.859655, 0.4124112, -1.055887, 0.8901961, 1, 0, 1,
-0.8570341, -1.713212, -3.869126, 0.8823529, 1, 0, 1,
-0.8503323, -0.3150872, -2.438417, 0.8784314, 1, 0, 1,
-0.8490741, 0.377594, 0.04360069, 0.8705882, 1, 0, 1,
-0.8471702, -0.2510587, -1.249852, 0.8666667, 1, 0, 1,
-0.8469697, 1.062291, -1.040542, 0.8588235, 1, 0, 1,
-0.8298313, -0.7800695, -1.905658, 0.854902, 1, 0, 1,
-0.8295096, -0.07381378, 0.1858503, 0.8470588, 1, 0, 1,
-0.8219882, 0.1268333, -0.5718939, 0.8431373, 1, 0, 1,
-0.8067155, 0.2024952, -0.4553705, 0.8352941, 1, 0, 1,
-0.8020273, -0.08146184, -3.157514, 0.8313726, 1, 0, 1,
-0.7972738, -0.7088255, -2.289894, 0.8235294, 1, 0, 1,
-0.7899508, 0.9103096, -1.946901, 0.8196079, 1, 0, 1,
-0.7855016, -0.4493285, -2.478997, 0.8117647, 1, 0, 1,
-0.7851413, 0.4208773, 0.3331458, 0.8078431, 1, 0, 1,
-0.7824409, -0.6945651, -2.767402, 0.8, 1, 0, 1,
-0.7788972, -1.144994, -3.594867, 0.7921569, 1, 0, 1,
-0.772916, -0.4480785, -3.355544, 0.7882353, 1, 0, 1,
-0.770743, -0.2511277, -0.3745952, 0.7803922, 1, 0, 1,
-0.7701138, 0.800824, -1.716339, 0.7764706, 1, 0, 1,
-0.7669955, -0.8119009, -3.115369, 0.7686275, 1, 0, 1,
-0.7654122, 0.7247656, -0.2034071, 0.7647059, 1, 0, 1,
-0.7636698, -0.1013394, -0.4494377, 0.7568628, 1, 0, 1,
-0.7606031, -1.112421, -2.656335, 0.7529412, 1, 0, 1,
-0.7581294, 1.585822, 0.5337151, 0.7450981, 1, 0, 1,
-0.7563838, -0.6143304, -2.442845, 0.7411765, 1, 0, 1,
-0.7557018, -1.333687, -3.576145, 0.7333333, 1, 0, 1,
-0.7517303, -1.08224, -1.913472, 0.7294118, 1, 0, 1,
-0.7468339, 0.3621406, -1.106115, 0.7215686, 1, 0, 1,
-0.7457193, 1.590701, -0.1684915, 0.7176471, 1, 0, 1,
-0.7344377, 0.970806, -0.8047662, 0.7098039, 1, 0, 1,
-0.7319231, -0.2753797, -4.298961, 0.7058824, 1, 0, 1,
-0.7207082, 0.7424676, 0.2888997, 0.6980392, 1, 0, 1,
-0.7191616, 0.5169891, -1.794688, 0.6901961, 1, 0, 1,
-0.7136415, -0.0891728, -1.801428, 0.6862745, 1, 0, 1,
-0.7098553, 2.272236, -0.5567716, 0.6784314, 1, 0, 1,
-0.7051492, 0.4578544, -0.3346038, 0.6745098, 1, 0, 1,
-0.7043035, 0.1519863, -1.885442, 0.6666667, 1, 0, 1,
-0.7035805, 0.9780493, -1.511209, 0.6627451, 1, 0, 1,
-0.7014167, 0.5366629, -3.03107, 0.654902, 1, 0, 1,
-0.7002125, 0.2392289, -1.69815, 0.6509804, 1, 0, 1,
-0.6990346, 0.296612, -0.9852983, 0.6431373, 1, 0, 1,
-0.6981966, -1.065176, -1.07711, 0.6392157, 1, 0, 1,
-0.6975872, -0.4895857, -1.594285, 0.6313726, 1, 0, 1,
-0.6968102, -0.1381644, -1.439556, 0.627451, 1, 0, 1,
-0.6950913, -0.9450362, -1.841079, 0.6196079, 1, 0, 1,
-0.6917161, 0.4766734, -1.912796, 0.6156863, 1, 0, 1,
-0.6863471, -1.427361, -1.900124, 0.6078432, 1, 0, 1,
-0.6843416, 0.5379145, -0.1851665, 0.6039216, 1, 0, 1,
-0.6784036, 0.7364275, -2.804193, 0.5960785, 1, 0, 1,
-0.6760871, 0.129707, -1.522975, 0.5882353, 1, 0, 1,
-0.6743566, -1.762072, -3.479689, 0.5843138, 1, 0, 1,
-0.6736825, 1.001328, -1.694069, 0.5764706, 1, 0, 1,
-0.6734468, -0.9953637, -0.4338378, 0.572549, 1, 0, 1,
-0.6712391, 0.3472208, -1.669648, 0.5647059, 1, 0, 1,
-0.6699089, -1.984805, -3.91679, 0.5607843, 1, 0, 1,
-0.6684382, -1.212869, -1.902906, 0.5529412, 1, 0, 1,
-0.6566972, -0.5480784, -3.25405, 0.5490196, 1, 0, 1,
-0.654547, 0.2916178, -2.746385, 0.5411765, 1, 0, 1,
-0.6542563, 0.1197932, -1.538985, 0.5372549, 1, 0, 1,
-0.6536354, 1.323009, 1.478625, 0.5294118, 1, 0, 1,
-0.6535779, -1.316677, -3.734483, 0.5254902, 1, 0, 1,
-0.6510733, -1.735412, -4.130766, 0.5176471, 1, 0, 1,
-0.6485481, -2.027246, -4.574068, 0.5137255, 1, 0, 1,
-0.6426893, -0.5103714, -2.652162, 0.5058824, 1, 0, 1,
-0.6398818, 0.5153033, -1.35077, 0.5019608, 1, 0, 1,
-0.6343027, -0.6344447, -3.410575, 0.4941176, 1, 0, 1,
-0.6326318, 0.7784222, 0.1544599, 0.4862745, 1, 0, 1,
-0.6323882, -0.1769737, -3.403743, 0.4823529, 1, 0, 1,
-0.6323709, -0.3583584, -2.158359, 0.4745098, 1, 0, 1,
-0.631047, -0.7277905, -2.301283, 0.4705882, 1, 0, 1,
-0.6274402, 1.604806, 0.145724, 0.4627451, 1, 0, 1,
-0.624921, -0.8833113, -1.646909, 0.4588235, 1, 0, 1,
-0.6157864, -0.6630722, -1.943936, 0.4509804, 1, 0, 1,
-0.6150852, -1.215718, -1.526103, 0.4470588, 1, 0, 1,
-0.6128213, 2.418709, 0.4932091, 0.4392157, 1, 0, 1,
-0.6116381, 0.3413975, 0.1126219, 0.4352941, 1, 0, 1,
-0.6113673, 0.8572103, -0.21355, 0.427451, 1, 0, 1,
-0.6063372, 0.8773247, -0.07044472, 0.4235294, 1, 0, 1,
-0.5916292, -0.487471, -1.853621, 0.4156863, 1, 0, 1,
-0.5867898, 0.4898813, -1.433527, 0.4117647, 1, 0, 1,
-0.5835857, 0.1196004, -1.63006, 0.4039216, 1, 0, 1,
-0.5814275, -0.3978569, -3.570765, 0.3960784, 1, 0, 1,
-0.5776115, 1.196595, -0.9722996, 0.3921569, 1, 0, 1,
-0.5736334, 0.04696897, -2.255879, 0.3843137, 1, 0, 1,
-0.5721444, -1.114723, -3.551028, 0.3803922, 1, 0, 1,
-0.56468, -1.795961, -3.116363, 0.372549, 1, 0, 1,
-0.5640708, -0.7397944, -3.051321, 0.3686275, 1, 0, 1,
-0.562144, -1.521864, -0.08676592, 0.3607843, 1, 0, 1,
-0.5592707, -2.327096, -1.185042, 0.3568628, 1, 0, 1,
-0.5519586, -0.1914673, -3.168542, 0.3490196, 1, 0, 1,
-0.5501134, 0.1845686, -1.640543, 0.345098, 1, 0, 1,
-0.5468456, 2.030416, -1.600977, 0.3372549, 1, 0, 1,
-0.5456951, 1.154882, -2.391766, 0.3333333, 1, 0, 1,
-0.5456072, -1.382856, -2.22405, 0.3254902, 1, 0, 1,
-0.5435385, 1.103845, -1.293694, 0.3215686, 1, 0, 1,
-0.5430193, -0.6838853, -1.796672, 0.3137255, 1, 0, 1,
-0.5425923, -1.139592, -3.19392, 0.3098039, 1, 0, 1,
-0.5419127, -0.6104845, -3.389426, 0.3019608, 1, 0, 1,
-0.541489, 1.106478, -1.373055, 0.2941177, 1, 0, 1,
-0.5409724, 0.1333273, -1.703079, 0.2901961, 1, 0, 1,
-0.5380948, 0.5428454, -1.760388, 0.282353, 1, 0, 1,
-0.5349053, -0.7370748, -4.287544, 0.2784314, 1, 0, 1,
-0.5297401, -2.949459, -2.285561, 0.2705882, 1, 0, 1,
-0.5236021, 0.113511, -1.147404, 0.2666667, 1, 0, 1,
-0.5212995, 1.119719, -0.03678183, 0.2588235, 1, 0, 1,
-0.5209361, 0.9367663, 0.8222887, 0.254902, 1, 0, 1,
-0.5190651, 0.813099, -1.110599, 0.2470588, 1, 0, 1,
-0.518987, 0.1488007, 0.6896257, 0.2431373, 1, 0, 1,
-0.5163377, -1.051409, -3.127139, 0.2352941, 1, 0, 1,
-0.5099154, -0.337029, -2.951803, 0.2313726, 1, 0, 1,
-0.5061374, 1.260442, -0.541327, 0.2235294, 1, 0, 1,
-0.5042865, 0.7962456, 0.1999827, 0.2196078, 1, 0, 1,
-0.5022757, -0.2890823, -3.862409, 0.2117647, 1, 0, 1,
-0.5019851, -0.8597625, -1.589302, 0.2078431, 1, 0, 1,
-0.4994538, 0.3432327, -0.6907921, 0.2, 1, 0, 1,
-0.4931861, -0.1511944, -0.8361699, 0.1921569, 1, 0, 1,
-0.4915925, -0.05872285, 0.1516763, 0.1882353, 1, 0, 1,
-0.4912329, 0.3845838, -2.798161, 0.1803922, 1, 0, 1,
-0.4881102, 0.05777901, -3.596954, 0.1764706, 1, 0, 1,
-0.4848549, 0.4598102, 0.5608541, 0.1686275, 1, 0, 1,
-0.4834006, 0.1191905, -0.942381, 0.1647059, 1, 0, 1,
-0.4808355, -0.4508067, -1.281682, 0.1568628, 1, 0, 1,
-0.4796411, 2.018352, -2.119635, 0.1529412, 1, 0, 1,
-0.4783372, 0.8654695, 0.2159376, 0.145098, 1, 0, 1,
-0.4779873, -0.3192023, -1.328497, 0.1411765, 1, 0, 1,
-0.473578, 0.6215507, -0.8476117, 0.1333333, 1, 0, 1,
-0.4730402, -0.3572045, -2.996766, 0.1294118, 1, 0, 1,
-0.472541, 0.4634803, -1.358333, 0.1215686, 1, 0, 1,
-0.4724, -0.3019833, -2.81252, 0.1176471, 1, 0, 1,
-0.4713686, -1.312067, -3.311823, 0.1098039, 1, 0, 1,
-0.4687988, -0.9507734, -2.911294, 0.1058824, 1, 0, 1,
-0.4680492, -0.4160683, -2.256682, 0.09803922, 1, 0, 1,
-0.4633533, 1.184468, -0.3401896, 0.09019608, 1, 0, 1,
-0.4575272, 0.1455762, -0.9279495, 0.08627451, 1, 0, 1,
-0.4513093, 0.6376076, 0.9714457, 0.07843138, 1, 0, 1,
-0.4487774, -1.40547, -2.340051, 0.07450981, 1, 0, 1,
-0.448756, 0.8131729, -0.9622653, 0.06666667, 1, 0, 1,
-0.4486742, 0.9463114, -0.04631968, 0.0627451, 1, 0, 1,
-0.444495, 2.06567, -2.190781, 0.05490196, 1, 0, 1,
-0.4441486, -0.9857622, -2.789947, 0.05098039, 1, 0, 1,
-0.4437843, -0.1038877, -1.532067, 0.04313726, 1, 0, 1,
-0.4406488, 0.7373031, -1.576452, 0.03921569, 1, 0, 1,
-0.440393, -1.471869, -3.084387, 0.03137255, 1, 0, 1,
-0.4399029, 0.1283601, -1.522408, 0.02745098, 1, 0, 1,
-0.435094, 0.9212946, -1.550024, 0.01960784, 1, 0, 1,
-0.4298969, -0.9330484, -4.243853, 0.01568628, 1, 0, 1,
-0.4280166, 0.162058, -1.436685, 0.007843138, 1, 0, 1,
-0.4271374, 0.2103022, -2.201186, 0.003921569, 1, 0, 1,
-0.4268979, 0.7738831, -2.608694, 0, 1, 0.003921569, 1,
-0.4240433, 1.153195, 2.595917, 0, 1, 0.01176471, 1,
-0.4234438, 1.017329, -1.052179, 0, 1, 0.01568628, 1,
-0.4179358, 0.08483715, -0.4106628, 0, 1, 0.02352941, 1,
-0.4144668, 0.2026109, -2.371108, 0, 1, 0.02745098, 1,
-0.4142554, 0.9826692, 0.2749743, 0, 1, 0.03529412, 1,
-0.407047, 1.481223, -1.920813, 0, 1, 0.03921569, 1,
-0.4059241, 0.691284, -0.9046977, 0, 1, 0.04705882, 1,
-0.4057349, -0.8164952, -1.521483, 0, 1, 0.05098039, 1,
-0.4032318, 1.281127, 0.2894854, 0, 1, 0.05882353, 1,
-0.400156, 1.089271, -0.7964955, 0, 1, 0.0627451, 1,
-0.399629, 0.1219818, 0.1206121, 0, 1, 0.07058824, 1,
-0.3968881, -0.6131002, -1.576349, 0, 1, 0.07450981, 1,
-0.396378, -0.5619441, -2.496161, 0, 1, 0.08235294, 1,
-0.39264, -0.9201878, -3.975914, 0, 1, 0.08627451, 1,
-0.3892007, -0.5261571, -3.590331, 0, 1, 0.09411765, 1,
-0.3826858, -0.5300816, -2.989652, 0, 1, 0.1019608, 1,
-0.3769853, -0.9815119, -1.661539, 0, 1, 0.1058824, 1,
-0.3764628, 0.8649486, -0.3842551, 0, 1, 0.1137255, 1,
-0.3750265, -1.562506, -3.441728, 0, 1, 0.1176471, 1,
-0.3748921, 1.274687, 0.8192396, 0, 1, 0.1254902, 1,
-0.3714337, 0.9287578, -3.689302, 0, 1, 0.1294118, 1,
-0.3700061, 0.1491953, -1.627392, 0, 1, 0.1372549, 1,
-0.3685353, 0.9065905, -0.5014471, 0, 1, 0.1411765, 1,
-0.3677276, -0.3816852, -2.617749, 0, 1, 0.1490196, 1,
-0.3621987, -0.5294528, -0.4350418, 0, 1, 0.1529412, 1,
-0.3598967, 1.14916, -2.099921, 0, 1, 0.1607843, 1,
-0.3568096, -0.6034082, -3.587973, 0, 1, 0.1647059, 1,
-0.3552273, -0.003446747, -2.530849, 0, 1, 0.172549, 1,
-0.3478602, -2.162113, -3.72838, 0, 1, 0.1764706, 1,
-0.3435587, 0.9431242, 0.4743424, 0, 1, 0.1843137, 1,
-0.3334746, -1.266048, -2.278107, 0, 1, 0.1882353, 1,
-0.332444, 1.8482, 0.01968223, 0, 1, 0.1960784, 1,
-0.3308387, 0.5710961, 0.1311268, 0, 1, 0.2039216, 1,
-0.3290303, -1.00206, -2.268321, 0, 1, 0.2078431, 1,
-0.3282963, 1.97972, -1.318349, 0, 1, 0.2156863, 1,
-0.326912, -0.6505406, -2.65548, 0, 1, 0.2196078, 1,
-0.3248826, -0.620414, -2.797959, 0, 1, 0.227451, 1,
-0.3218518, -1.420201, -4.722601, 0, 1, 0.2313726, 1,
-0.3214961, 1.056167, -0.8885219, 0, 1, 0.2392157, 1,
-0.3195176, -0.53962, -0.4018651, 0, 1, 0.2431373, 1,
-0.3175763, -0.5871643, -3.254812, 0, 1, 0.2509804, 1,
-0.3171895, -1.439375, -1.711863, 0, 1, 0.254902, 1,
-0.3051176, 2.102045, -0.01124218, 0, 1, 0.2627451, 1,
-0.2964312, 0.179493, -0.3701891, 0, 1, 0.2666667, 1,
-0.2951342, 0.9231679, 0.3764305, 0, 1, 0.2745098, 1,
-0.2950077, 0.6948158, -0.470952, 0, 1, 0.2784314, 1,
-0.2929065, 0.09768221, -2.861133, 0, 1, 0.2862745, 1,
-0.2925723, -1.896001, -4.427051, 0, 1, 0.2901961, 1,
-0.2912793, 1.666866, 0.2358733, 0, 1, 0.2980392, 1,
-0.2872603, 0.9706052, -0.8351276, 0, 1, 0.3058824, 1,
-0.2777898, -0.4309966, -2.791499, 0, 1, 0.3098039, 1,
-0.2731617, -0.4954316, -2.89563, 0, 1, 0.3176471, 1,
-0.2698251, -0.82592, -2.293038, 0, 1, 0.3215686, 1,
-0.2652455, 0.3609492, -1.058552, 0, 1, 0.3294118, 1,
-0.2651762, 0.9338035, -0.2415674, 0, 1, 0.3333333, 1,
-0.2646893, 0.5294257, -0.6364359, 0, 1, 0.3411765, 1,
-0.2568092, -1.474097, -2.928705, 0, 1, 0.345098, 1,
-0.2563632, -0.1313672, -1.965193, 0, 1, 0.3529412, 1,
-0.255352, 0.7184426, -1.569236, 0, 1, 0.3568628, 1,
-0.2542222, 1.969084, -0.5940678, 0, 1, 0.3647059, 1,
-0.2522053, -1.21741, -4.285115, 0, 1, 0.3686275, 1,
-0.2488043, 1.011088, -0.9900422, 0, 1, 0.3764706, 1,
-0.2443447, 0.3791086, -0.6227965, 0, 1, 0.3803922, 1,
-0.2414886, -0.6637152, -3.827077, 0, 1, 0.3882353, 1,
-0.2410957, 0.8463088, 0.04789389, 0, 1, 0.3921569, 1,
-0.2407298, -1.139153, -1.402414, 0, 1, 0.4, 1,
-0.2403605, 0.4359203, 0.2973439, 0, 1, 0.4078431, 1,
-0.235947, -1.476695, -3.663728, 0, 1, 0.4117647, 1,
-0.2334835, 1.881003, 0.3423319, 0, 1, 0.4196078, 1,
-0.2322931, 0.641437, 0.5508382, 0, 1, 0.4235294, 1,
-0.2318694, -0.2015023, -0.9844145, 0, 1, 0.4313726, 1,
-0.2290032, 0.6159832, -2.340357, 0, 1, 0.4352941, 1,
-0.2274792, 0.1286377, -3.346887, 0, 1, 0.4431373, 1,
-0.2267038, -0.9545931, -3.775061, 0, 1, 0.4470588, 1,
-0.2263728, 0.7015634, -1.979176, 0, 1, 0.454902, 1,
-0.217963, -0.1964303, -1.408332, 0, 1, 0.4588235, 1,
-0.2172235, 1.440758, -1.606099, 0, 1, 0.4666667, 1,
-0.2121969, 0.646637, 0.6963028, 0, 1, 0.4705882, 1,
-0.2115809, -0.02003256, -2.19066, 0, 1, 0.4784314, 1,
-0.2109513, 1.584241, -2.37809, 0, 1, 0.4823529, 1,
-0.2098794, 0.4742987, -0.1068655, 0, 1, 0.4901961, 1,
-0.2049453, 0.5853095, -0.6731409, 0, 1, 0.4941176, 1,
-0.2001164, 1.488335, -0.8117485, 0, 1, 0.5019608, 1,
-0.1994382, 0.7859871, 0.1505057, 0, 1, 0.509804, 1,
-0.1990368, 0.2668183, -0.11525, 0, 1, 0.5137255, 1,
-0.1964796, 0.5630921, -0.4626615, 0, 1, 0.5215687, 1,
-0.1962974, 0.2646005, -2.526541, 0, 1, 0.5254902, 1,
-0.19364, 0.5748892, 0.2796898, 0, 1, 0.5333334, 1,
-0.1894223, -1.029985, -2.423659, 0, 1, 0.5372549, 1,
-0.1840437, -0.9723892, -2.73956, 0, 1, 0.5450981, 1,
-0.1831812, 0.2563297, -0.2101969, 0, 1, 0.5490196, 1,
-0.1825919, -0.8130733, -1.836459, 0, 1, 0.5568628, 1,
-0.1809837, -1.07979, -2.254154, 0, 1, 0.5607843, 1,
-0.1764471, -1.798955, -1.324574, 0, 1, 0.5686275, 1,
-0.1761926, 0.1107721, -0.5723463, 0, 1, 0.572549, 1,
-0.1747189, -3.028745, -2.626227, 0, 1, 0.5803922, 1,
-0.1722108, -0.8900415, -3.095087, 0, 1, 0.5843138, 1,
-0.1714161, -1.108295, -2.554235, 0, 1, 0.5921569, 1,
-0.1655487, -1.2138, -3.075364, 0, 1, 0.5960785, 1,
-0.1614296, 0.2575895, -0.7006645, 0, 1, 0.6039216, 1,
-0.1597131, 0.1084958, 0.6145159, 0, 1, 0.6117647, 1,
-0.1574359, 0.3058116, -0.2491706, 0, 1, 0.6156863, 1,
-0.1533312, -1.644559, -3.362505, 0, 1, 0.6235294, 1,
-0.1331174, 0.7556406, 0.9694366, 0, 1, 0.627451, 1,
-0.1317941, -2.238542, -2.759168, 0, 1, 0.6352941, 1,
-0.1307288, -0.2845373, -3.02484, 0, 1, 0.6392157, 1,
-0.1279402, -1.270856, -2.693999, 0, 1, 0.6470588, 1,
-0.1243173, -1.132695, -2.790936, 0, 1, 0.6509804, 1,
-0.1225937, -0.5253485, -4.170684, 0, 1, 0.6588235, 1,
-0.1184509, -1.457832, -3.021468, 0, 1, 0.6627451, 1,
-0.1178554, 0.07829689, 1.38205, 0, 1, 0.6705883, 1,
-0.1152244, -1.749083, -1.187442, 0, 1, 0.6745098, 1,
-0.1149052, 0.8969082, -0.9427145, 0, 1, 0.682353, 1,
-0.1035583, 0.3065223, 1.35696, 0, 1, 0.6862745, 1,
-0.1027788, 0.6344775, 0.2511422, 0, 1, 0.6941177, 1,
-0.1025041, 0.0886858, -0.4474532, 0, 1, 0.7019608, 1,
-0.0973829, 1.168752, -1.904063, 0, 1, 0.7058824, 1,
-0.0901915, 0.7592157, 1.236471, 0, 1, 0.7137255, 1,
-0.09003934, 1.812556, 0.6394536, 0, 1, 0.7176471, 1,
-0.08664417, -0.1365398, -2.683949, 0, 1, 0.7254902, 1,
-0.08327024, 1.0134, -0.2786544, 0, 1, 0.7294118, 1,
-0.08252128, -0.688882, -0.297638, 0, 1, 0.7372549, 1,
-0.08144052, 1.120368, -0.4603476, 0, 1, 0.7411765, 1,
-0.07732644, -1.002805, -3.232033, 0, 1, 0.7490196, 1,
-0.07662828, -1.162702, -3.404295, 0, 1, 0.7529412, 1,
-0.07341655, 1.142974, 0.328518, 0, 1, 0.7607843, 1,
-0.07074168, 1.459193, -0.4711717, 0, 1, 0.7647059, 1,
-0.06878866, 0.8862724, 0.4802764, 0, 1, 0.772549, 1,
-0.0645963, -0.8309342, -2.756903, 0, 1, 0.7764706, 1,
-0.06213764, -0.1332201, -3.259563, 0, 1, 0.7843137, 1,
-0.057659, -0.04735737, -2.941448, 0, 1, 0.7882353, 1,
-0.04948311, 0.3883829, 0.3933628, 0, 1, 0.7960784, 1,
-0.04874283, -1.553055, -2.480126, 0, 1, 0.8039216, 1,
-0.04759133, 0.3881394, 1.492613, 0, 1, 0.8078431, 1,
-0.04428328, -0.7169253, -3.869498, 0, 1, 0.8156863, 1,
-0.04316639, 0.6073875, -0.8349739, 0, 1, 0.8196079, 1,
-0.0428815, -0.08353559, -2.847557, 0, 1, 0.827451, 1,
-0.04028542, 0.5993915, 0.1751347, 0, 1, 0.8313726, 1,
-0.03360676, 0.04240013, 1.040445, 0, 1, 0.8392157, 1,
-0.03077571, 0.7814016, -2.639093, 0, 1, 0.8431373, 1,
-0.02955384, -1.013949, -1.705988, 0, 1, 0.8509804, 1,
-0.02912672, -1.841968, -2.34982, 0, 1, 0.854902, 1,
-0.02760248, 0.4301074, 0.8661765, 0, 1, 0.8627451, 1,
-0.02472614, 0.7004601, -1.863176, 0, 1, 0.8666667, 1,
-0.02402721, 1.997632, 0.3875675, 0, 1, 0.8745098, 1,
-0.02389775, -0.233761, -6.044231, 0, 1, 0.8784314, 1,
-0.01620503, 0.949107, -0.843721, 0, 1, 0.8862745, 1,
-0.01317517, 0.6813307, -0.1653825, 0, 1, 0.8901961, 1,
0.0004173925, -1.443309, 1.262617, 0, 1, 0.8980392, 1,
0.0009892541, 0.5816181, 0.9300076, 0, 1, 0.9058824, 1,
0.00272296, 1.967645, -0.894358, 0, 1, 0.9098039, 1,
0.003005828, -0.03197477, 4.026211, 0, 1, 0.9176471, 1,
0.004030548, 0.7757581, 1.252617, 0, 1, 0.9215686, 1,
0.009849518, -0.07070712, 3.484253, 0, 1, 0.9294118, 1,
0.01176438, -0.6045294, 3.791955, 0, 1, 0.9333333, 1,
0.01494068, 0.8495378, -0.7291424, 0, 1, 0.9411765, 1,
0.01747577, 0.5749605, 0.8525695, 0, 1, 0.945098, 1,
0.01919991, -0.4106059, 4.837519, 0, 1, 0.9529412, 1,
0.02141578, -0.4927943, 2.217305, 0, 1, 0.9568627, 1,
0.02370222, -0.1210421, 1.007164, 0, 1, 0.9647059, 1,
0.03069877, 0.5157195, 0.1366469, 0, 1, 0.9686275, 1,
0.03128192, -1.187588, 3.688379, 0, 1, 0.9764706, 1,
0.03408401, -0.7741045, 2.275594, 0, 1, 0.9803922, 1,
0.03882785, -0.7671613, 2.193716, 0, 1, 0.9882353, 1,
0.04430123, -1.14577, 2.269818, 0, 1, 0.9921569, 1,
0.04518096, 2.178386, -1.432437, 0, 1, 1, 1,
0.04889043, -1.167625, 3.033074, 0, 0.9921569, 1, 1,
0.04999513, 0.1413371, 0.103806, 0, 0.9882353, 1, 1,
0.05016506, 0.05347386, 0.973541, 0, 0.9803922, 1, 1,
0.05143709, 1.274783, -1.392389, 0, 0.9764706, 1, 1,
0.05303533, -0.4960306, 2.850262, 0, 0.9686275, 1, 1,
0.05570341, 1.461842, 0.9855101, 0, 0.9647059, 1, 1,
0.05583115, 0.0865475, 1.233668, 0, 0.9568627, 1, 1,
0.05646812, 0.8368953, -0.1949908, 0, 0.9529412, 1, 1,
0.05726746, -0.5748907, 2.938446, 0, 0.945098, 1, 1,
0.05811255, 1.488774, 0.5403553, 0, 0.9411765, 1, 1,
0.06368797, -0.4858367, 3.145281, 0, 0.9333333, 1, 1,
0.07238592, 1.319243, 1.045653, 0, 0.9294118, 1, 1,
0.07797637, -1.832444, 3.176652, 0, 0.9215686, 1, 1,
0.08145554, 0.1335564, 0.1298082, 0, 0.9176471, 1, 1,
0.08176416, 0.9650937, -0.7857844, 0, 0.9098039, 1, 1,
0.08203678, 0.2170932, 0.7642045, 0, 0.9058824, 1, 1,
0.08374855, -0.01992603, 1.547289, 0, 0.8980392, 1, 1,
0.08408845, 1.486241, 0.7498339, 0, 0.8901961, 1, 1,
0.09117424, -0.2884787, 1.269053, 0, 0.8862745, 1, 1,
0.09147197, 1.682396, 1.673918, 0, 0.8784314, 1, 1,
0.100868, 0.5181946, 1.376427, 0, 0.8745098, 1, 1,
0.1024998, 0.9466797, 1.473538, 0, 0.8666667, 1, 1,
0.102896, 2.080026, -0.6635283, 0, 0.8627451, 1, 1,
0.1120076, -0.5036434, 3.849531, 0, 0.854902, 1, 1,
0.1169932, -0.1101979, 4.624718, 0, 0.8509804, 1, 1,
0.1225301, 0.6913848, 0.1624007, 0, 0.8431373, 1, 1,
0.1236017, 1.044172, -0.5132142, 0, 0.8392157, 1, 1,
0.1248174, 0.4478242, -1.364949, 0, 0.8313726, 1, 1,
0.1253232, 1.663005, 1.995875, 0, 0.827451, 1, 1,
0.1276345, -0.7515239, 3.859532, 0, 0.8196079, 1, 1,
0.131071, -1.983955, 1.514737, 0, 0.8156863, 1, 1,
0.1315887, -0.4291797, 3.818119, 0, 0.8078431, 1, 1,
0.134827, -0.2199972, 3.161428, 0, 0.8039216, 1, 1,
0.1379312, 0.1614472, 0.3398395, 0, 0.7960784, 1, 1,
0.1401078, 2.271151, 0.8754899, 0, 0.7882353, 1, 1,
0.1410826, 0.2229089, 2.728218, 0, 0.7843137, 1, 1,
0.1420972, -1.445464, 2.849362, 0, 0.7764706, 1, 1,
0.1429067, -0.1389477, 2.046745, 0, 0.772549, 1, 1,
0.1460518, -0.5726525, 4.3557, 0, 0.7647059, 1, 1,
0.1469742, -0.04992371, 1.156856, 0, 0.7607843, 1, 1,
0.1489479, 2.287874, -1.12612, 0, 0.7529412, 1, 1,
0.1497247, 2.451499, -2.68857, 0, 0.7490196, 1, 1,
0.1504809, -1.358809, 2.319307, 0, 0.7411765, 1, 1,
0.152255, -0.9924045, 3.409218, 0, 0.7372549, 1, 1,
0.1574628, 0.8391622, -0.8675058, 0, 0.7294118, 1, 1,
0.1590145, -0.1883451, 2.857343, 0, 0.7254902, 1, 1,
0.1606966, 0.3366291, 0.5261772, 0, 0.7176471, 1, 1,
0.1607015, 0.1130227, 0.700422, 0, 0.7137255, 1, 1,
0.1660446, -1.286122, 2.779264, 0, 0.7058824, 1, 1,
0.1683404, -0.7720984, 4.56556, 0, 0.6980392, 1, 1,
0.1687258, 1.231477, -1.005983, 0, 0.6941177, 1, 1,
0.1700786, -0.2075374, 3.265504, 0, 0.6862745, 1, 1,
0.1703027, -0.8257362, 2.868655, 0, 0.682353, 1, 1,
0.1720973, 0.2594275, 2.54259, 0, 0.6745098, 1, 1,
0.1724049, -0.572681, 2.309922, 0, 0.6705883, 1, 1,
0.1738988, -0.6527473, 1.803155, 0, 0.6627451, 1, 1,
0.1743317, 0.9563888, -0.6271757, 0, 0.6588235, 1, 1,
0.1767379, -0.3987727, 4.684586, 0, 0.6509804, 1, 1,
0.1775374, 0.6875606, -0.252005, 0, 0.6470588, 1, 1,
0.181962, 0.5633784, 0.822685, 0, 0.6392157, 1, 1,
0.1836475, -0.6541458, 1.387879, 0, 0.6352941, 1, 1,
0.1849692, 0.5320646, -1.29512, 0, 0.627451, 1, 1,
0.1879264, -0.386674, 4.058154, 0, 0.6235294, 1, 1,
0.1886015, 0.5164961, 0.522154, 0, 0.6156863, 1, 1,
0.1889034, -0.5569068, 1.4816, 0, 0.6117647, 1, 1,
0.1924727, -1.040419, 2.451861, 0, 0.6039216, 1, 1,
0.1937191, 0.1905259, 0.9406145, 0, 0.5960785, 1, 1,
0.1997931, -0.07218211, 3.03618, 0, 0.5921569, 1, 1,
0.2000689, 0.6178105, -0.7139726, 0, 0.5843138, 1, 1,
0.2015305, -0.8640067, 2.718769, 0, 0.5803922, 1, 1,
0.2030986, -0.5704603, 4.824972, 0, 0.572549, 1, 1,
0.2055042, -0.3467416, 2.661226, 0, 0.5686275, 1, 1,
0.2069594, 0.9576169, -0.6725389, 0, 0.5607843, 1, 1,
0.2098505, 0.1399718, -0.4777427, 0, 0.5568628, 1, 1,
0.2100267, 1.473827, -0.8631541, 0, 0.5490196, 1, 1,
0.2155826, 0.3439575, 0.9967659, 0, 0.5450981, 1, 1,
0.2184828, -1.640792, 3.50415, 0, 0.5372549, 1, 1,
0.2187804, -0.4948338, 2.662076, 0, 0.5333334, 1, 1,
0.2188603, 0.811856, -0.27532, 0, 0.5254902, 1, 1,
0.2214483, 0.08291893, 1.395593, 0, 0.5215687, 1, 1,
0.2227136, -0.01749634, 3.123256, 0, 0.5137255, 1, 1,
0.231458, -0.681749, 3.466897, 0, 0.509804, 1, 1,
0.2398755, -0.6675274, 2.780481, 0, 0.5019608, 1, 1,
0.240696, -0.6511286, 2.061589, 0, 0.4941176, 1, 1,
0.2421558, 0.2922512, -0.02923828, 0, 0.4901961, 1, 1,
0.2432364, -0.5921465, 2.714577, 0, 0.4823529, 1, 1,
0.2451057, -1.60825, 4.70918, 0, 0.4784314, 1, 1,
0.2451955, 1.311662, -0.4252307, 0, 0.4705882, 1, 1,
0.2521411, -0.4127834, 2.950593, 0, 0.4666667, 1, 1,
0.2523017, -0.7883911, 2.748807, 0, 0.4588235, 1, 1,
0.252578, 0.03247556, 1.481488, 0, 0.454902, 1, 1,
0.2531549, -0.1523719, 2.530232, 0, 0.4470588, 1, 1,
0.2535674, -1.691053, 0.8546944, 0, 0.4431373, 1, 1,
0.2550697, 0.05564601, -0.09955958, 0, 0.4352941, 1, 1,
0.258063, -0.7970096, 1.918651, 0, 0.4313726, 1, 1,
0.2582818, -0.3414244, 2.232343, 0, 0.4235294, 1, 1,
0.2590499, -0.4186588, 2.272275, 0, 0.4196078, 1, 1,
0.2607398, 0.6447217, 0.146605, 0, 0.4117647, 1, 1,
0.2609582, 0.6569896, 0.1648225, 0, 0.4078431, 1, 1,
0.2641, -0.02141017, 0.6441908, 0, 0.4, 1, 1,
0.2659354, -1.503879, 2.686275, 0, 0.3921569, 1, 1,
0.2662548, -0.1746517, 0.8213875, 0, 0.3882353, 1, 1,
0.271532, -0.59837, 2.025355, 0, 0.3803922, 1, 1,
0.2718504, -0.870342, 1.748957, 0, 0.3764706, 1, 1,
0.2726751, 0.8178099, 1.59412, 0, 0.3686275, 1, 1,
0.2734756, 0.7391692, -1.25915, 0, 0.3647059, 1, 1,
0.2744332, -0.4419491, 2.44964, 0, 0.3568628, 1, 1,
0.2789261, 0.4143867, -0.601214, 0, 0.3529412, 1, 1,
0.2789802, 0.9340296, 2.09565, 0, 0.345098, 1, 1,
0.2847163, 0.8572339, 0.9729584, 0, 0.3411765, 1, 1,
0.2891501, -0.8217926, 2.195828, 0, 0.3333333, 1, 1,
0.2908705, -0.234796, 1.787217, 0, 0.3294118, 1, 1,
0.2916596, 0.9391684, -1.741971, 0, 0.3215686, 1, 1,
0.2962078, -0.01686337, -0.708375, 0, 0.3176471, 1, 1,
0.3001773, 0.05681179, 2.484965, 0, 0.3098039, 1, 1,
0.3045275, -0.2773437, 2.183084, 0, 0.3058824, 1, 1,
0.3070818, 0.1774891, 3.266863, 0, 0.2980392, 1, 1,
0.3075191, 0.9108976, 0.03433028, 0, 0.2901961, 1, 1,
0.3082136, 2.386451, 1.513479, 0, 0.2862745, 1, 1,
0.3139586, -0.09155635, 0.8694173, 0, 0.2784314, 1, 1,
0.3142004, -0.6283131, 2.012923, 0, 0.2745098, 1, 1,
0.315962, 1.007447, 1.718242, 0, 0.2666667, 1, 1,
0.318464, -0.6092917, 2.556968, 0, 0.2627451, 1, 1,
0.3206787, 0.5583063, -1.175998, 0, 0.254902, 1, 1,
0.3208039, -1.445102, 4.210198, 0, 0.2509804, 1, 1,
0.3212998, 0.1266929, 2.53112, 0, 0.2431373, 1, 1,
0.3240116, 0.5910573, -0.2253998, 0, 0.2392157, 1, 1,
0.3310823, 0.2172855, 0.9886907, 0, 0.2313726, 1, 1,
0.3343095, 1.083581, -0.04346211, 0, 0.227451, 1, 1,
0.3480586, -0.08579, 2.702996, 0, 0.2196078, 1, 1,
0.3484588, 0.04348784, 0.001182867, 0, 0.2156863, 1, 1,
0.364702, 0.6709103, 0.6260997, 0, 0.2078431, 1, 1,
0.3662845, -0.1997715, 1.168513, 0, 0.2039216, 1, 1,
0.3694174, -0.2642847, 1.828547, 0, 0.1960784, 1, 1,
0.3713546, 1.290788, 0.2029905, 0, 0.1882353, 1, 1,
0.3742517, 0.5123683, 1.638164, 0, 0.1843137, 1, 1,
0.3780882, 2.544662, -0.05814418, 0, 0.1764706, 1, 1,
0.3800544, -0.09213363, 0.03695196, 0, 0.172549, 1, 1,
0.3887626, 0.2275001, 1.215174, 0, 0.1647059, 1, 1,
0.3964525, 0.4918393, 0.6599623, 0, 0.1607843, 1, 1,
0.3976375, -1.831388, 2.184268, 0, 0.1529412, 1, 1,
0.3976564, 1.870762, 1.368999, 0, 0.1490196, 1, 1,
0.3986031, -0.4609932, 2.565211, 0, 0.1411765, 1, 1,
0.3994719, 1.52567, -0.1803223, 0, 0.1372549, 1, 1,
0.4041235, -2.479196, 3.250726, 0, 0.1294118, 1, 1,
0.4055739, -1.286419, 2.739112, 0, 0.1254902, 1, 1,
0.4072854, 0.01812704, 2.854475, 0, 0.1176471, 1, 1,
0.407724, -0.3325295, 3.351634, 0, 0.1137255, 1, 1,
0.4096218, -0.6320763, 2.845655, 0, 0.1058824, 1, 1,
0.4101483, -0.8084096, 2.158361, 0, 0.09803922, 1, 1,
0.4106594, 0.3556168, 0.5273498, 0, 0.09411765, 1, 1,
0.414353, -0.8077065, 3.466973, 0, 0.08627451, 1, 1,
0.4179957, 1.539496, 0.002992186, 0, 0.08235294, 1, 1,
0.4204614, 0.3972063, -1.046826, 0, 0.07450981, 1, 1,
0.4225075, -0.3901294, 1.15202, 0, 0.07058824, 1, 1,
0.4231919, 0.7264006, -0.8481349, 0, 0.0627451, 1, 1,
0.42381, 0.7682914, -0.3924282, 0, 0.05882353, 1, 1,
0.4244061, 0.5378143, 1.037577, 0, 0.05098039, 1, 1,
0.4259661, -0.4828131, 2.758878, 0, 0.04705882, 1, 1,
0.4261057, 0.7596323, 0.02976652, 0, 0.03921569, 1, 1,
0.4261205, 2.468662, 1.017711, 0, 0.03529412, 1, 1,
0.4268754, 0.7135344, -0.2203314, 0, 0.02745098, 1, 1,
0.43149, 1.129316, 0.08887193, 0, 0.02352941, 1, 1,
0.4352041, -0.6561165, 2.976972, 0, 0.01568628, 1, 1,
0.4359489, -2.533421, 3.069223, 0, 0.01176471, 1, 1,
0.4366254, 0.2703315, 0.6916687, 0, 0.003921569, 1, 1,
0.4400087, 1.302234, -0.2121249, 0.003921569, 0, 1, 1,
0.4492096, -0.1073123, 3.156697, 0.007843138, 0, 1, 1,
0.4532314, 1.271435, -1.207759, 0.01568628, 0, 1, 1,
0.456606, 0.9246906, -0.02308585, 0.01960784, 0, 1, 1,
0.4576961, 0.1376532, 1.26843, 0.02745098, 0, 1, 1,
0.4582164, -0.1757237, -0.1784262, 0.03137255, 0, 1, 1,
0.4626433, 0.1368761, 1.736101, 0.03921569, 0, 1, 1,
0.4634925, 0.05020203, 0.6606709, 0.04313726, 0, 1, 1,
0.4655697, -0.06162437, -0.06862189, 0.05098039, 0, 1, 1,
0.4696082, 0.8339715, 0.5186481, 0.05490196, 0, 1, 1,
0.4705289, -0.9472224, 3.716672, 0.0627451, 0, 1, 1,
0.4747588, 1.005875, 0.1111622, 0.06666667, 0, 1, 1,
0.4815503, 0.2142446, 0.8228226, 0.07450981, 0, 1, 1,
0.4870189, 0.5981063, -0.4421587, 0.07843138, 0, 1, 1,
0.4924648, -0.7442447, 2.955593, 0.08627451, 0, 1, 1,
0.4927872, 0.2660747, 0.6639056, 0.09019608, 0, 1, 1,
0.4959113, -0.09609993, 1.175729, 0.09803922, 0, 1, 1,
0.4967047, -0.5107589, 2.120695, 0.1058824, 0, 1, 1,
0.5012744, -0.6741439, 2.932325, 0.1098039, 0, 1, 1,
0.5100141, -0.8446527, 2.330555, 0.1176471, 0, 1, 1,
0.5103789, 0.2599254, 0.7079071, 0.1215686, 0, 1, 1,
0.5142148, 2.081042, -0.7767579, 0.1294118, 0, 1, 1,
0.5184274, -0.08486121, 1.899058, 0.1333333, 0, 1, 1,
0.525781, -1.477423, 1.554394, 0.1411765, 0, 1, 1,
0.5274577, -0.873526, 1.611191, 0.145098, 0, 1, 1,
0.527719, 0.3067686, -0.3918023, 0.1529412, 0, 1, 1,
0.533995, 0.08266249, 3.354003, 0.1568628, 0, 1, 1,
0.5376438, 0.6875871, 0.7039459, 0.1647059, 0, 1, 1,
0.5376822, -0.5139644, 2.728947, 0.1686275, 0, 1, 1,
0.5422456, 0.3350537, 0.6280249, 0.1764706, 0, 1, 1,
0.5423755, -0.4198996, 1.149508, 0.1803922, 0, 1, 1,
0.5438837, 0.08504101, 0.8959417, 0.1882353, 0, 1, 1,
0.5457691, 0.3151912, 1.677063, 0.1921569, 0, 1, 1,
0.549462, -1.328715, 1.839408, 0.2, 0, 1, 1,
0.5506244, 0.4283078, 2.341257, 0.2078431, 0, 1, 1,
0.5508707, -1.861718, 1.885637, 0.2117647, 0, 1, 1,
0.5526983, -0.4680288, 2.214668, 0.2196078, 0, 1, 1,
0.5630396, 0.8046513, 0.6980218, 0.2235294, 0, 1, 1,
0.5646657, 0.3488595, 1.822057, 0.2313726, 0, 1, 1,
0.5647233, -0.02460161, 1.564604, 0.2352941, 0, 1, 1,
0.5662839, -1.680516, 2.91475, 0.2431373, 0, 1, 1,
0.5724082, -0.297554, 2.506716, 0.2470588, 0, 1, 1,
0.5728618, 1.321766, 0.8367497, 0.254902, 0, 1, 1,
0.5735009, -1.002076, 3.028971, 0.2588235, 0, 1, 1,
0.5745753, -0.5847396, 1.219773, 0.2666667, 0, 1, 1,
0.578088, 1.723962, 0.05430476, 0.2705882, 0, 1, 1,
0.5785444, -0.1290942, 0.8418827, 0.2784314, 0, 1, 1,
0.5813824, -2.375345, 3.701609, 0.282353, 0, 1, 1,
0.5868585, 0.03943088, -0.1675066, 0.2901961, 0, 1, 1,
0.5919834, 0.002805382, 0.4403347, 0.2941177, 0, 1, 1,
0.5932499, -1.180418, 2.789815, 0.3019608, 0, 1, 1,
0.5950861, -0.6075165, 1.201498, 0.3098039, 0, 1, 1,
0.5977724, 0.4568186, -0.2110034, 0.3137255, 0, 1, 1,
0.5978407, -0.3718719, 3.513736, 0.3215686, 0, 1, 1,
0.6019426, 0.9188215, -0.8377156, 0.3254902, 0, 1, 1,
0.6045548, -0.8034619, 2.629616, 0.3333333, 0, 1, 1,
0.6054028, 1.408231, 2.017057, 0.3372549, 0, 1, 1,
0.6067673, -0.2163731, 0.6977139, 0.345098, 0, 1, 1,
0.6109614, -0.161486, 2.611849, 0.3490196, 0, 1, 1,
0.6273885, 0.7409728, 1.856231, 0.3568628, 0, 1, 1,
0.6305072, -1.18738, 2.015504, 0.3607843, 0, 1, 1,
0.632324, 0.4829217, 1.291712, 0.3686275, 0, 1, 1,
0.640383, -1.604204, 2.57875, 0.372549, 0, 1, 1,
0.6418352, 0.271548, -0.1266441, 0.3803922, 0, 1, 1,
0.6474813, -0.1884016, 2.462379, 0.3843137, 0, 1, 1,
0.6483175, -0.8342984, 1.670495, 0.3921569, 0, 1, 1,
0.649654, 0.7467412, 1.099209, 0.3960784, 0, 1, 1,
0.658914, -0.1133853, 3.090737, 0.4039216, 0, 1, 1,
0.6606616, -0.9449751, 2.926118, 0.4117647, 0, 1, 1,
0.6641039, -1.083912, 1.337802, 0.4156863, 0, 1, 1,
0.6689176, 1.580231, -0.341353, 0.4235294, 0, 1, 1,
0.6692114, -1.112335, 4.313518, 0.427451, 0, 1, 1,
0.6746937, -0.5365388, 2.275448, 0.4352941, 0, 1, 1,
0.6748219, 0.7191956, 0.895048, 0.4392157, 0, 1, 1,
0.6749502, 0.3822964, 2.145469, 0.4470588, 0, 1, 1,
0.6758764, 0.8702408, 0.8175467, 0.4509804, 0, 1, 1,
0.6811525, 0.7782986, -0.8855828, 0.4588235, 0, 1, 1,
0.6817997, -1.045444, 2.548011, 0.4627451, 0, 1, 1,
0.6837342, 1.427533, 0.1517244, 0.4705882, 0, 1, 1,
0.6895664, 0.196156, 1.896168, 0.4745098, 0, 1, 1,
0.6914815, 1.159477, 1.529666, 0.4823529, 0, 1, 1,
0.6956481, -1.822969, 2.060566, 0.4862745, 0, 1, 1,
0.7022588, 0.433547, 2.600043, 0.4941176, 0, 1, 1,
0.7046527, 0.05456791, 0.535065, 0.5019608, 0, 1, 1,
0.7065777, 1.890016, 0.4352743, 0.5058824, 0, 1, 1,
0.7071126, -0.1864883, 0.9826265, 0.5137255, 0, 1, 1,
0.7074586, -0.2567479, 0.5226712, 0.5176471, 0, 1, 1,
0.7079831, 0.5207003, 0.1582949, 0.5254902, 0, 1, 1,
0.7119056, -1.045301, 3.167259, 0.5294118, 0, 1, 1,
0.7143439, 2.136833, 0.2062111, 0.5372549, 0, 1, 1,
0.7145356, -1.202205, 2.33724, 0.5411765, 0, 1, 1,
0.7146873, 1.832489, 1.027703, 0.5490196, 0, 1, 1,
0.7156446, -1.535987, 2.752862, 0.5529412, 0, 1, 1,
0.7164469, -0.3437595, 1.538361, 0.5607843, 0, 1, 1,
0.7164959, 0.4018961, 2.90821, 0.5647059, 0, 1, 1,
0.7178847, 0.1878421, 0.5612527, 0.572549, 0, 1, 1,
0.7272933, -0.9345163, 2.110059, 0.5764706, 0, 1, 1,
0.7293382, 0.3761455, 2.828644, 0.5843138, 0, 1, 1,
0.7297647, 1.201084, 1.326342, 0.5882353, 0, 1, 1,
0.7382153, -0.8769671, 2.867134, 0.5960785, 0, 1, 1,
0.7383474, -1.446429, 1.436649, 0.6039216, 0, 1, 1,
0.7412332, -1.505776, 2.136289, 0.6078432, 0, 1, 1,
0.7425392, -0.7697365, 3.772334, 0.6156863, 0, 1, 1,
0.7469141, 0.5481864, 0.6496823, 0.6196079, 0, 1, 1,
0.7515792, 0.4396795, 0.5464585, 0.627451, 0, 1, 1,
0.7535829, 0.4104356, 0.7620308, 0.6313726, 0, 1, 1,
0.7542995, 1.320836, 0.5964556, 0.6392157, 0, 1, 1,
0.754789, 0.9330181, 1.105264, 0.6431373, 0, 1, 1,
0.7561405, 0.03211489, 2.97461, 0.6509804, 0, 1, 1,
0.7581794, -0.2176563, 0.3488099, 0.654902, 0, 1, 1,
0.7601328, -1.269516, 3.646401, 0.6627451, 0, 1, 1,
0.7618969, 0.3362515, 0.8851849, 0.6666667, 0, 1, 1,
0.7645991, -0.1430877, 1.619098, 0.6745098, 0, 1, 1,
0.7721128, -0.4978637, 2.55611, 0.6784314, 0, 1, 1,
0.7732, -0.1049724, -0.08256602, 0.6862745, 0, 1, 1,
0.7733143, 0.7949584, 1.136443, 0.6901961, 0, 1, 1,
0.7756084, -1.189901, 3.029206, 0.6980392, 0, 1, 1,
0.7765113, -1.019045, 2.32621, 0.7058824, 0, 1, 1,
0.8217616, -0.9495308, 1.55451, 0.7098039, 0, 1, 1,
0.8219808, -0.4971515, 2.821634, 0.7176471, 0, 1, 1,
0.8222364, 1.151555, 0.1628572, 0.7215686, 0, 1, 1,
0.8230587, 0.2575832, 2.199183, 0.7294118, 0, 1, 1,
0.8238546, -0.6722832, 1.952121, 0.7333333, 0, 1, 1,
0.8258212, 1.297224, 0.4391498, 0.7411765, 0, 1, 1,
0.8307357, -2.273542, 1.710612, 0.7450981, 0, 1, 1,
0.8331166, 0.01639568, 0.7728689, 0.7529412, 0, 1, 1,
0.8382434, 0.7334592, 1.971094, 0.7568628, 0, 1, 1,
0.8441975, 0.5980802, 0.03721662, 0.7647059, 0, 1, 1,
0.8466025, -1.615562, 2.448436, 0.7686275, 0, 1, 1,
0.8484942, 0.2217867, 2.920766, 0.7764706, 0, 1, 1,
0.8511518, -0.7749427, 2.112263, 0.7803922, 0, 1, 1,
0.8511742, 0.364649, -0.1352, 0.7882353, 0, 1, 1,
0.855358, -2.052252, 2.107646, 0.7921569, 0, 1, 1,
0.8561249, -0.09264822, 0.5333682, 0.8, 0, 1, 1,
0.8569838, 1.829386, 0.4409277, 0.8078431, 0, 1, 1,
0.856986, -1.62032, 4.470705, 0.8117647, 0, 1, 1,
0.8594223, -0.5534386, 1.894952, 0.8196079, 0, 1, 1,
0.8642284, 0.8729576, 1.424109, 0.8235294, 0, 1, 1,
0.8690344, -0.5570408, 3.233095, 0.8313726, 0, 1, 1,
0.8721372, -1.054172, 3.277667, 0.8352941, 0, 1, 1,
0.8816025, 0.8514479, -1.367005, 0.8431373, 0, 1, 1,
0.8818133, -0.9162683, 2.714279, 0.8470588, 0, 1, 1,
0.8880891, 0.4108232, 1.990344, 0.854902, 0, 1, 1,
0.8918139, 0.646467, 1.15818, 0.8588235, 0, 1, 1,
0.8974167, -0.9756203, 2.202936, 0.8666667, 0, 1, 1,
0.9082524, 2.231404, 0.2088253, 0.8705882, 0, 1, 1,
0.9133484, 0.3604524, 1.969736, 0.8784314, 0, 1, 1,
0.9140645, -0.007353036, 3.915034, 0.8823529, 0, 1, 1,
0.923819, 0.7157847, -0.7038722, 0.8901961, 0, 1, 1,
0.9265687, -0.1483618, 2.567213, 0.8941177, 0, 1, 1,
0.9382061, 1.084558, -0.166249, 0.9019608, 0, 1, 1,
0.9396832, 0.8424143, 0.1941156, 0.9098039, 0, 1, 1,
0.9401586, -0.06011366, -0.1183288, 0.9137255, 0, 1, 1,
0.9420137, -0.862254, 3.923034, 0.9215686, 0, 1, 1,
0.9432356, 2.43565, 0.5657476, 0.9254902, 0, 1, 1,
0.9435771, -2.73615, 3.412551, 0.9333333, 0, 1, 1,
0.9479207, 0.7456551, -0.1483527, 0.9372549, 0, 1, 1,
0.9591522, 0.8987169, -0.4094992, 0.945098, 0, 1, 1,
0.96051, -0.6002496, 2.430379, 0.9490196, 0, 1, 1,
0.9622075, -2.360363, 3.628723, 0.9568627, 0, 1, 1,
0.9626604, 0.08552784, 0.2337768, 0.9607843, 0, 1, 1,
0.9631957, -0.1039855, 1.20225, 0.9686275, 0, 1, 1,
0.9663144, 0.7463511, 1.654272, 0.972549, 0, 1, 1,
0.9826483, 1.180038, 0.9369099, 0.9803922, 0, 1, 1,
0.986451, -0.6537097, 0.8321135, 0.9843137, 0, 1, 1,
0.9884593, -0.4711696, 2.514048, 0.9921569, 0, 1, 1,
0.9969359, -0.2939613, 1.917843, 0.9960784, 0, 1, 1,
0.9975165, -1.633518, 1.173997, 1, 0, 0.9960784, 1,
1.003536, 0.2902319, 0.8794312, 1, 0, 0.9882353, 1,
1.005979, 0.8377541, 1.240924, 1, 0, 0.9843137, 1,
1.011722, -0.6182272, 1.522506, 1, 0, 0.9764706, 1,
1.014663, -1.032525, 4.231883, 1, 0, 0.972549, 1,
1.014847, 1.308499, 1.291096, 1, 0, 0.9647059, 1,
1.015893, -1.935485, 2.503662, 1, 0, 0.9607843, 1,
1.023498, -0.0688433, 0.9448475, 1, 0, 0.9529412, 1,
1.029846, -0.8856702, 3.379555, 1, 0, 0.9490196, 1,
1.03214, -2.1945, 2.95918, 1, 0, 0.9411765, 1,
1.032281, 0.5263646, 0.656801, 1, 0, 0.9372549, 1,
1.035904, -0.1915481, 0.1814785, 1, 0, 0.9294118, 1,
1.03666, -0.129519, 1.829334, 1, 0, 0.9254902, 1,
1.050047, 0.3784055, -0.06316697, 1, 0, 0.9176471, 1,
1.050227, 0.9140517, 0.5111184, 1, 0, 0.9137255, 1,
1.052914, 0.9990929, 1.68252, 1, 0, 0.9058824, 1,
1.066906, -0.2883103, 0.3017721, 1, 0, 0.9019608, 1,
1.074622, 0.7020122, 0.07965977, 1, 0, 0.8941177, 1,
1.077587, 1.614421, 2.175793, 1, 0, 0.8862745, 1,
1.083539, 0.5887853, 1.615065, 1, 0, 0.8823529, 1,
1.088912, -0.1925531, 0.9732048, 1, 0, 0.8745098, 1,
1.092025, 0.1174842, 1.150575, 1, 0, 0.8705882, 1,
1.105943, 0.4332472, 1.484604, 1, 0, 0.8627451, 1,
1.109054, 0.6128634, 0.2929446, 1, 0, 0.8588235, 1,
1.115793, -0.07999634, 0.6755081, 1, 0, 0.8509804, 1,
1.115968, -0.5829112, 1.217199, 1, 0, 0.8470588, 1,
1.122334, -0.6853243, 3.439394, 1, 0, 0.8392157, 1,
1.126349, -1.12368, 1.712184, 1, 0, 0.8352941, 1,
1.127639, -1.953108, 3.589522, 1, 0, 0.827451, 1,
1.139683, -0.32277, 2.134096, 1, 0, 0.8235294, 1,
1.140549, -1.427316, 1.813672, 1, 0, 0.8156863, 1,
1.147696, -1.285379, 1.535095, 1, 0, 0.8117647, 1,
1.152984, -1.98529, 0.9824772, 1, 0, 0.8039216, 1,
1.156764, 0.2978278, 2.306324, 1, 0, 0.7960784, 1,
1.176111, -0.3677314, 4.012385, 1, 0, 0.7921569, 1,
1.176863, 0.04106991, 0.6884777, 1, 0, 0.7843137, 1,
1.190585, 0.6066853, 2.432862, 1, 0, 0.7803922, 1,
1.191962, 1.165188, -0.5020206, 1, 0, 0.772549, 1,
1.200295, 0.01879628, 3.412031, 1, 0, 0.7686275, 1,
1.203952, -0.106296, 2.472975, 1, 0, 0.7607843, 1,
1.205181, 0.09349637, 1.490654, 1, 0, 0.7568628, 1,
1.205573, 0.8519559, 1.117123, 1, 0, 0.7490196, 1,
1.206437, -0.7859018, 2.743977, 1, 0, 0.7450981, 1,
1.230394, 0.4738397, 2.235111, 1, 0, 0.7372549, 1,
1.232352, 0.5693827, 1.741104, 1, 0, 0.7333333, 1,
1.232537, 0.5289676, -0.5567507, 1, 0, 0.7254902, 1,
1.233068, -1.346132, 2.808698, 1, 0, 0.7215686, 1,
1.234989, 1.747355, 1.281904, 1, 0, 0.7137255, 1,
1.236611, 1.073634, 0.0536848, 1, 0, 0.7098039, 1,
1.241626, -0.8101229, 1.666468, 1, 0, 0.7019608, 1,
1.245108, -0.3571759, 0.8781963, 1, 0, 0.6941177, 1,
1.248713, 0.1399802, 3.021307, 1, 0, 0.6901961, 1,
1.265668, 0.6048145, 0.8452584, 1, 0, 0.682353, 1,
1.268865, -0.2018648, 2.458943, 1, 0, 0.6784314, 1,
1.270501, -0.4858122, 1.782098, 1, 0, 0.6705883, 1,
1.280818, -0.6196904, 2.851649, 1, 0, 0.6666667, 1,
1.287448, -0.8434325, 3.612121, 1, 0, 0.6588235, 1,
1.29057, 0.3070844, 1.894697, 1, 0, 0.654902, 1,
1.296429, 0.2958013, 1.916507, 1, 0, 0.6470588, 1,
1.303817, 0.5871263, 0.9491756, 1, 0, 0.6431373, 1,
1.312272, -0.2542267, 2.284243, 1, 0, 0.6352941, 1,
1.319569, 0.4968118, 0.819636, 1, 0, 0.6313726, 1,
1.322195, 0.3273204, 1.378566, 1, 0, 0.6235294, 1,
1.333168, 1.528764, 0.8659526, 1, 0, 0.6196079, 1,
1.333422, 1.681113, -0.1134151, 1, 0, 0.6117647, 1,
1.339932, -0.7430391, 0.733686, 1, 0, 0.6078432, 1,
1.342469, -1.175002, -0.4647385, 1, 0, 0.6, 1,
1.349465, -0.1210947, 0.2844127, 1, 0, 0.5921569, 1,
1.354097, 0.8688897, -0.04193229, 1, 0, 0.5882353, 1,
1.358856, -0.2646886, 0.7209667, 1, 0, 0.5803922, 1,
1.363927, 0.0023101, 1.868556, 1, 0, 0.5764706, 1,
1.367744, -0.2135397, 1.554956, 1, 0, 0.5686275, 1,
1.373396, 0.66289, -0.2980103, 1, 0, 0.5647059, 1,
1.37787, -1.408989, 2.025454, 1, 0, 0.5568628, 1,
1.378623, -0.5181619, 3.054898, 1, 0, 0.5529412, 1,
1.379237, 1.419351, 0.1321998, 1, 0, 0.5450981, 1,
1.379653, -0.563804, 3.737114, 1, 0, 0.5411765, 1,
1.382566, -1.173306, 1.400755, 1, 0, 0.5333334, 1,
1.384616, -0.3434519, 2.765424, 1, 0, 0.5294118, 1,
1.395729, -0.7083904, 1.723568, 1, 0, 0.5215687, 1,
1.397619, -0.4897642, 1.804278, 1, 0, 0.5176471, 1,
1.404781, 0.5510865, 0.9276493, 1, 0, 0.509804, 1,
1.408958, 0.3993077, 2.283808, 1, 0, 0.5058824, 1,
1.428248, -0.4176953, 3.210274, 1, 0, 0.4980392, 1,
1.431334, 0.5486753, 1.09458, 1, 0, 0.4901961, 1,
1.440647, 1.617976, 0.8559564, 1, 0, 0.4862745, 1,
1.446704, 1.266603, 0.6454921, 1, 0, 0.4784314, 1,
1.449243, -1.091771, 1.985966, 1, 0, 0.4745098, 1,
1.455806, -0.827499, 1.571168, 1, 0, 0.4666667, 1,
1.455932, -2.041828, 3.822931, 1, 0, 0.4627451, 1,
1.468005, 1.378097, 1.215178, 1, 0, 0.454902, 1,
1.469361, -0.609631, 3.5304, 1, 0, 0.4509804, 1,
1.471535, -0.4055783, 1.948758, 1, 0, 0.4431373, 1,
1.475708, 0.5407965, 1.938819, 1, 0, 0.4392157, 1,
1.483295, -0.832328, 1.248446, 1, 0, 0.4313726, 1,
1.484251, 0.9391122, 2.213245, 1, 0, 0.427451, 1,
1.488416, -0.03550458, 2.298551, 1, 0, 0.4196078, 1,
1.491303, -1.595604, 1.628594, 1, 0, 0.4156863, 1,
1.502432, 0.227572, 2.450776, 1, 0, 0.4078431, 1,
1.509793, 0.03978754, 1.220992, 1, 0, 0.4039216, 1,
1.53124, 0.6727794, 1.186551, 1, 0, 0.3960784, 1,
1.533589, -0.6303694, 1.682442, 1, 0, 0.3882353, 1,
1.562042, 1.335323, 0.3697358, 1, 0, 0.3843137, 1,
1.565173, -1.093171, 0.9499554, 1, 0, 0.3764706, 1,
1.574423, -1.407639, 4.672818, 1, 0, 0.372549, 1,
1.591504, 0.3110775, 1.754969, 1, 0, 0.3647059, 1,
1.607415, -0.9854175, 2.472435, 1, 0, 0.3607843, 1,
1.609243, -1.1925, 1.411602, 1, 0, 0.3529412, 1,
1.612222, 0.6181996, 1.240942, 1, 0, 0.3490196, 1,
1.617381, -1.569732, 2.929976, 1, 0, 0.3411765, 1,
1.642226, -1.335356, 4.30779, 1, 0, 0.3372549, 1,
1.645593, -0.9447761, 1.904293, 1, 0, 0.3294118, 1,
1.678631, -1.40345, 1.600833, 1, 0, 0.3254902, 1,
1.680407, -1.322971, 1.493107, 1, 0, 0.3176471, 1,
1.680581, -0.9994642, 2.542235, 1, 0, 0.3137255, 1,
1.681393, -1.298192, 1.567414, 1, 0, 0.3058824, 1,
1.681834, 1.893975, 1.012916, 1, 0, 0.2980392, 1,
1.687482, -0.1408544, 1.686606, 1, 0, 0.2941177, 1,
1.690762, -0.7204016, 1.569634, 1, 0, 0.2862745, 1,
1.717534, -1.320313, 1.677374, 1, 0, 0.282353, 1,
1.72903, -0.4955025, 1.196871, 1, 0, 0.2745098, 1,
1.732759, -0.4114478, 1.427458, 1, 0, 0.2705882, 1,
1.735986, -0.07314749, 2.159601, 1, 0, 0.2627451, 1,
1.736339, -1.206046, 0.9696962, 1, 0, 0.2588235, 1,
1.739039, -0.7208282, 4.224411, 1, 0, 0.2509804, 1,
1.742963, -0.03787094, 0.7751994, 1, 0, 0.2470588, 1,
1.745423, 1.188182, 2.447153, 1, 0, 0.2392157, 1,
1.753119, -1.637324, 1.283525, 1, 0, 0.2352941, 1,
1.776746, 0.6211984, -0.9089912, 1, 0, 0.227451, 1,
1.79228, -0.2367838, 2.539185, 1, 0, 0.2235294, 1,
1.794393, -0.2509951, 1.207506, 1, 0, 0.2156863, 1,
1.807211, 0.3862601, 0.9467884, 1, 0, 0.2117647, 1,
1.810024, -0.5256808, 1.11383, 1, 0, 0.2039216, 1,
1.836168, 0.4018637, 1.182483, 1, 0, 0.1960784, 1,
1.836262, 0.8398874, 1.213619, 1, 0, 0.1921569, 1,
1.857879, 1.315333, 1.76221, 1, 0, 0.1843137, 1,
1.898454, 1.100571, -0.1087278, 1, 0, 0.1803922, 1,
1.922384, -0.8421111, 2.094117, 1, 0, 0.172549, 1,
1.925819, 0.5959574, 1.544824, 1, 0, 0.1686275, 1,
1.929582, 1.103703, 1.038367, 1, 0, 0.1607843, 1,
1.93352, -0.6558969, 1.212485, 1, 0, 0.1568628, 1,
1.93369, 0.8109395, 0.5865893, 1, 0, 0.1490196, 1,
1.959292, 1.715742, -1.183752, 1, 0, 0.145098, 1,
1.975625, 1.25403, -0.07849922, 1, 0, 0.1372549, 1,
2.033663, -0.193823, 1.234313, 1, 0, 0.1333333, 1,
2.067755, 0.01492508, 1.500994, 1, 0, 0.1254902, 1,
2.134408, 0.9423831, 0.8648315, 1, 0, 0.1215686, 1,
2.136667, -0.9992038, -0.02342287, 1, 0, 0.1137255, 1,
2.146817, 0.5006343, 1.394573, 1, 0, 0.1098039, 1,
2.153433, -0.2936917, 3.078296, 1, 0, 0.1019608, 1,
2.198496, -0.2915613, 1.038016, 1, 0, 0.09411765, 1,
2.226502, -0.5334713, 3.245358, 1, 0, 0.09019608, 1,
2.239181, -0.8391572, 2.060546, 1, 0, 0.08235294, 1,
2.247068, -0.0261846, 2.480496, 1, 0, 0.07843138, 1,
2.365028, 0.8003436, 2.746946, 1, 0, 0.07058824, 1,
2.424678, -0.5779198, 3.359551, 1, 0, 0.06666667, 1,
2.500236, -0.3143793, 1.559845, 1, 0, 0.05882353, 1,
2.522201, -0.4901022, 2.033271, 1, 0, 0.05490196, 1,
2.567855, 0.831942, 1.534408, 1, 0, 0.04705882, 1,
2.691776, 1.069607, 0.6437649, 1, 0, 0.04313726, 1,
2.696132, 0.3796121, 0.8394589, 1, 0, 0.03529412, 1,
2.736378, 0.1112258, 0.2596071, 1, 0, 0.03137255, 1,
2.763447, -0.5954615, 0.8817195, 1, 0, 0.02352941, 1,
2.897536, -0.2083538, 2.582566, 1, 0, 0.01960784, 1,
2.946186, -0.2419829, 1.516295, 1, 0, 0.01176471, 1,
2.996044, 2.056477, 0.4069171, 1, 0, 0.007843138, 1
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
-0.1525662, -4.019985, -7.888688, 0, -0.5, 0.5, 0.5,
-0.1525662, -4.019985, -7.888688, 1, -0.5, 0.5, 0.5,
-0.1525662, -4.019985, -7.888688, 1, 1.5, 0.5, 0.5,
-0.1525662, -4.019985, -7.888688, 0, 1.5, 0.5, 0.5
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
-4.368555, -0.1047343, -7.888688, 0, -0.5, 0.5, 0.5,
-4.368555, -0.1047343, -7.888688, 1, -0.5, 0.5, 0.5,
-4.368555, -0.1047343, -7.888688, 1, 1.5, 0.5, 0.5,
-4.368555, -0.1047343, -7.888688, 0, 1.5, 0.5, 0.5
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
-4.368555, -4.019985, -0.6033561, 0, -0.5, 0.5, 0.5,
-4.368555, -4.019985, -0.6033561, 1, -0.5, 0.5, 0.5,
-4.368555, -4.019985, -0.6033561, 1, 1.5, 0.5, 0.5,
-4.368555, -4.019985, -0.6033561, 0, 1.5, 0.5, 0.5
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
-3, -3.116466, -6.207458,
2, -3.116466, -6.207458,
-3, -3.116466, -6.207458,
-3, -3.267052, -6.487663,
-2, -3.116466, -6.207458,
-2, -3.267052, -6.487663,
-1, -3.116466, -6.207458,
-1, -3.267052, -6.487663,
0, -3.116466, -6.207458,
0, -3.267052, -6.487663,
1, -3.116466, -6.207458,
1, -3.267052, -6.487663,
2, -3.116466, -6.207458,
2, -3.267052, -6.487663
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
-3, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
-3, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
-3, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
-3, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5,
-2, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
-2, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
-2, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
-2, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5,
-1, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
-1, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
-1, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
-1, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5,
0, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
0, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
0, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
0, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5,
1, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
1, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
1, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
1, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5,
2, -3.568225, -7.048073, 0, -0.5, 0.5, 0.5,
2, -3.568225, -7.048073, 1, -0.5, 0.5, 0.5,
2, -3.568225, -7.048073, 1, 1.5, 0.5, 0.5,
2, -3.568225, -7.048073, 0, 1.5, 0.5, 0.5
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
-3.395635, -3, -6.207458,
-3.395635, 2, -6.207458,
-3.395635, -3, -6.207458,
-3.557788, -3, -6.487663,
-3.395635, -2, -6.207458,
-3.557788, -2, -6.487663,
-3.395635, -1, -6.207458,
-3.557788, -1, -6.487663,
-3.395635, 0, -6.207458,
-3.557788, 0, -6.487663,
-3.395635, 1, -6.207458,
-3.557788, 1, -6.487663,
-3.395635, 2, -6.207458,
-3.557788, 2, -6.487663
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
-3.882095, -3, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, -3, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, -3, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, -3, -7.048073, 0, 1.5, 0.5, 0.5,
-3.882095, -2, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, -2, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, -2, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, -2, -7.048073, 0, 1.5, 0.5, 0.5,
-3.882095, -1, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, -1, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, -1, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, -1, -7.048073, 0, 1.5, 0.5, 0.5,
-3.882095, 0, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, 0, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, 0, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, 0, -7.048073, 0, 1.5, 0.5, 0.5,
-3.882095, 1, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, 1, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, 1, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, 1, -7.048073, 0, 1.5, 0.5, 0.5,
-3.882095, 2, -7.048073, 0, -0.5, 0.5, 0.5,
-3.882095, 2, -7.048073, 1, -0.5, 0.5, 0.5,
-3.882095, 2, -7.048073, 1, 1.5, 0.5, 0.5,
-3.882095, 2, -7.048073, 0, 1.5, 0.5, 0.5
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
-3.395635, -3.116466, -6,
-3.395635, -3.116466, 4,
-3.395635, -3.116466, -6,
-3.557788, -3.267052, -6,
-3.395635, -3.116466, -4,
-3.557788, -3.267052, -4,
-3.395635, -3.116466, -2,
-3.557788, -3.267052, -2,
-3.395635, -3.116466, 0,
-3.557788, -3.267052, 0,
-3.395635, -3.116466, 2,
-3.557788, -3.267052, 2,
-3.395635, -3.116466, 4,
-3.557788, -3.267052, 4
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
-3.882095, -3.568225, -6, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -6, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -6, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, -6, 0, 1.5, 0.5, 0.5,
-3.882095, -3.568225, -4, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -4, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -4, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, -4, 0, 1.5, 0.5, 0.5,
-3.882095, -3.568225, -2, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -2, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, -2, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, -2, 0, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 0, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 0, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 0, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 0, 0, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 2, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 2, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 2, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 2, 0, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 4, 0, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 4, 1, -0.5, 0.5, 0.5,
-3.882095, -3.568225, 4, 1, 1.5, 0.5, 0.5,
-3.882095, -3.568225, 4, 0, 1.5, 0.5, 0.5
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
-3.395635, -3.116466, -6.207458,
-3.395635, 2.906997, -6.207458,
-3.395635, -3.116466, 5.000745,
-3.395635, 2.906997, 5.000745,
-3.395635, -3.116466, -6.207458,
-3.395635, -3.116466, 5.000745,
-3.395635, 2.906997, -6.207458,
-3.395635, 2.906997, 5.000745,
-3.395635, -3.116466, -6.207458,
3.090502, -3.116466, -6.207458,
-3.395635, -3.116466, 5.000745,
3.090502, -3.116466, 5.000745,
-3.395635, 2.906997, -6.207458,
3.090502, 2.906997, -6.207458,
-3.395635, 2.906997, 5.000745,
3.090502, 2.906997, 5.000745,
3.090502, -3.116466, -6.207458,
3.090502, 2.906997, -6.207458,
3.090502, -3.116466, 5.000745,
3.090502, 2.906997, 5.000745,
3.090502, -3.116466, -6.207458,
3.090502, -3.116466, 5.000745,
3.090502, 2.906997, -6.207458,
3.090502, 2.906997, 5.000745
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
var radius = 7.626318;
var distance = 33.93035;
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
mvMatrix.translate( 0.1525662, 0.1047343, 0.6033561 );
mvMatrix.scale( 1.271284, 1.368934, 0.7356865 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.93035);
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
benazolin<-read.table("benazolin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benazolin$V2
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
y<-benazolin$V3
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
z<-benazolin$V4
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
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
-3.301176, -0.6274763, -2.71041, 0, 0, 1, 1, 1,
-3.154679, 1.175082, -0.2793379, 1, 0, 0, 1, 1,
-2.993786, 2.819277, -1.138443, 1, 0, 0, 1, 1,
-2.842542, -0.5799065, -0.3787921, 1, 0, 0, 1, 1,
-2.663225, 0.1335519, -2.638696, 1, 0, 0, 1, 1,
-2.454696, -0.6811563, -2.492325, 1, 0, 0, 1, 1,
-2.44091, -1.526545, -2.475231, 0, 0, 0, 1, 1,
-2.369201, -0.165682, -0.935172, 0, 0, 0, 1, 1,
-2.261441, -0.6218349, -2.770734, 0, 0, 0, 1, 1,
-2.259878, -0.2902627, -1.850028, 0, 0, 0, 1, 1,
-2.230064, -1.026646, -2.088391, 0, 0, 0, 1, 1,
-2.160922, -0.9002354, -1.425943, 0, 0, 0, 1, 1,
-2.101838, 0.3476264, 1.840976, 0, 0, 0, 1, 1,
-2.058121, -1.676984, -0.6453413, 1, 1, 1, 1, 1,
-2.048942, -1.382601, -2.092508, 1, 1, 1, 1, 1,
-2.016153, 0.5961819, -2.945333, 1, 1, 1, 1, 1,
-2.001409, -0.341538, -0.8118836, 1, 1, 1, 1, 1,
-1.986301, 1.09489, 0.05750222, 1, 1, 1, 1, 1,
-1.96239, -1.877897, -1.829107, 1, 1, 1, 1, 1,
-1.960863, 0.04016135, -2.136391, 1, 1, 1, 1, 1,
-1.948667, -0.8023621, -2.627518, 1, 1, 1, 1, 1,
-1.941606, -0.1585607, -0.9584295, 1, 1, 1, 1, 1,
-1.917303, 0.782915, -1.279572, 1, 1, 1, 1, 1,
-1.901779, 1.084073, -1.872717, 1, 1, 1, 1, 1,
-1.881306, 0.7029228, -0.9708683, 1, 1, 1, 1, 1,
-1.878058, 1.50605, -0.1680404, 1, 1, 1, 1, 1,
-1.854155, -0.111194, -2.089824, 1, 1, 1, 1, 1,
-1.827503, -0.1125322, -2.292227, 1, 1, 1, 1, 1,
-1.819882, -0.8231965, -0.4093896, 0, 0, 1, 1, 1,
-1.818425, -1.049464, -1.608058, 1, 0, 0, 1, 1,
-1.804895, 0.7732422, -2.023979, 1, 0, 0, 1, 1,
-1.796609, 1.181183, -1.162747, 1, 0, 0, 1, 1,
-1.777883, 0.3331767, -0.8466364, 1, 0, 0, 1, 1,
-1.771165, -0.9106816, -3.289526, 1, 0, 0, 1, 1,
-1.728931, -1.019818, 0.6476345, 0, 0, 0, 1, 1,
-1.697619, 0.6257446, -1.813855, 0, 0, 0, 1, 1,
-1.697323, 0.9498141, -1.123184, 0, 0, 0, 1, 1,
-1.690229, 0.9898979, -1.987146, 0, 0, 0, 1, 1,
-1.667337, -1.205083, -1.730183, 0, 0, 0, 1, 1,
-1.662706, 1.433338, -0.9150655, 0, 0, 0, 1, 1,
-1.659484, -0.6264666, -1.895425, 0, 0, 0, 1, 1,
-1.65833, 0.5600988, -0.4714348, 1, 1, 1, 1, 1,
-1.643153, -0.1336843, -0.9919946, 1, 1, 1, 1, 1,
-1.623742, 0.848763, -1.039047, 1, 1, 1, 1, 1,
-1.60223, -0.4644114, 0.03836104, 1, 1, 1, 1, 1,
-1.596713, 0.7828706, -0.5917802, 1, 1, 1, 1, 1,
-1.596568, 0.2181089, -2.626127, 1, 1, 1, 1, 1,
-1.592371, -0.5422596, -0.3922963, 1, 1, 1, 1, 1,
-1.579672, 0.6641568, -0.7215875, 1, 1, 1, 1, 1,
-1.574439, 0.7953602, -1.764475, 1, 1, 1, 1, 1,
-1.569654, -0.4068814, -1.712363, 1, 1, 1, 1, 1,
-1.566589, 1.776309, -2.273677, 1, 1, 1, 1, 1,
-1.556732, 0.1673018, 0.7902884, 1, 1, 1, 1, 1,
-1.549884, -1.898702, -3.775315, 1, 1, 1, 1, 1,
-1.531012, 0.397722, -1.744758, 1, 1, 1, 1, 1,
-1.520586, 0.8566493, -0.9077303, 1, 1, 1, 1, 1,
-1.51074, 0.830196, -1.171816, 0, 0, 1, 1, 1,
-1.508874, 2.655499, -1.31428, 1, 0, 0, 1, 1,
-1.508177, -0.2740937, -3.013797, 1, 0, 0, 1, 1,
-1.501512, 0.6907421, -0.9971304, 1, 0, 0, 1, 1,
-1.493852, -0.2591074, -3.135809, 1, 0, 0, 1, 1,
-1.491108, -0.5923279, -2.371085, 1, 0, 0, 1, 1,
-1.489468, -2.048516, -2.440609, 0, 0, 0, 1, 1,
-1.487379, -0.7204131, -3.300704, 0, 0, 0, 1, 1,
-1.479276, 0.4507672, 0.3409006, 0, 0, 0, 1, 1,
-1.473848, -1.010308, -2.064642, 0, 0, 0, 1, 1,
-1.465064, -0.7166729, -3.374986, 0, 0, 0, 1, 1,
-1.454918, 1.146961, -0.1073616, 0, 0, 0, 1, 1,
-1.450692, -0.07874219, -2.234643, 0, 0, 0, 1, 1,
-1.448028, 1.997303, -0.3906605, 1, 1, 1, 1, 1,
-1.446533, 0.8160657, -1.105694, 1, 1, 1, 1, 1,
-1.445518, 1.623589, 0.9683271, 1, 1, 1, 1, 1,
-1.441314, -1.466033, -1.786593, 1, 1, 1, 1, 1,
-1.419256, 0.475697, -2.839663, 1, 1, 1, 1, 1,
-1.415595, -0.3470161, -2.719394, 1, 1, 1, 1, 1,
-1.407197, 0.6964483, -1.769407, 1, 1, 1, 1, 1,
-1.39233, 1.790268, -0.7893575, 1, 1, 1, 1, 1,
-1.385491, 1.507845, 0.0375478, 1, 1, 1, 1, 1,
-1.385073, 1.309061, -0.5708382, 1, 1, 1, 1, 1,
-1.382337, 0.451457, -0.5104055, 1, 1, 1, 1, 1,
-1.375987, -0.8886881, -1.211958, 1, 1, 1, 1, 1,
-1.361603, -0.5119987, -2.923593, 1, 1, 1, 1, 1,
-1.358109, 1.783774, -0.9535608, 1, 1, 1, 1, 1,
-1.357188, -0.7703795, -2.670605, 1, 1, 1, 1, 1,
-1.346821, 1.541565, -1.369522, 0, 0, 1, 1, 1,
-1.343876, 1.084892, -1.150306, 1, 0, 0, 1, 1,
-1.325806, -0.8330643, -2.969985, 1, 0, 0, 1, 1,
-1.321547, 0.6632888, -1.364356, 1, 0, 0, 1, 1,
-1.321051, 0.7931063, -1.36664, 1, 0, 0, 1, 1,
-1.320293, 0.1584101, -1.365594, 1, 0, 0, 1, 1,
-1.316907, 1.355319, -1.013943, 0, 0, 0, 1, 1,
-1.31615, 0.1810243, -0.56957, 0, 0, 0, 1, 1,
-1.31464, 0.5850086, -2.015792, 0, 0, 0, 1, 1,
-1.30997, 0.5551545, -2.157316, 0, 0, 0, 1, 1,
-1.304776, 0.2014198, -1.644706, 0, 0, 0, 1, 1,
-1.304621, 1.7587, 0.8062767, 0, 0, 0, 1, 1,
-1.30292, 1.485305, -0.5070048, 0, 0, 0, 1, 1,
-1.298954, 0.2859502, -0.8569095, 1, 1, 1, 1, 1,
-1.288658, 0.07364842, -0.9962906, 1, 1, 1, 1, 1,
-1.288454, -0.1516101, -1.367836, 1, 1, 1, 1, 1,
-1.284404, 0.5121214, 0.7165241, 1, 1, 1, 1, 1,
-1.277422, -0.1051111, -1.798133, 1, 1, 1, 1, 1,
-1.268623, -0.3418002, -1.366053, 1, 1, 1, 1, 1,
-1.255813, 0.3468081, -2.658551, 1, 1, 1, 1, 1,
-1.252917, 1.075028, 0.2907473, 1, 1, 1, 1, 1,
-1.252315, 0.6749712, 0.8201208, 1, 1, 1, 1, 1,
-1.234943, 0.3065321, -2.082457, 1, 1, 1, 1, 1,
-1.218468, -1.713971, -2.078723, 1, 1, 1, 1, 1,
-1.215958, 0.4565122, -2.643882, 1, 1, 1, 1, 1,
-1.214561, 0.588042, -1.997668, 1, 1, 1, 1, 1,
-1.214095, 1.319925, -1.749394, 1, 1, 1, 1, 1,
-1.208816, -0.2917058, -1.807727, 1, 1, 1, 1, 1,
-1.208728, 1.071717, -3.385955, 0, 0, 1, 1, 1,
-1.194042, -1.169457, -2.772988, 1, 0, 0, 1, 1,
-1.18745, 0.5011147, -0.714784, 1, 0, 0, 1, 1,
-1.181497, 1.011986, -1.884086, 1, 0, 0, 1, 1,
-1.173188, 1.507929, 0.4315219, 1, 0, 0, 1, 1,
-1.171804, 0.01236161, 0.233565, 1, 0, 0, 1, 1,
-1.166056, -1.014108, -2.695254, 0, 0, 0, 1, 1,
-1.161819, -1.383561, -2.813318, 0, 0, 0, 1, 1,
-1.149333, 0.2511027, -0.6722537, 0, 0, 0, 1, 1,
-1.145624, -1.016229, -2.543557, 0, 0, 0, 1, 1,
-1.14547, -0.1943487, -1.458721, 0, 0, 0, 1, 1,
-1.131294, 0.5946043, -1.438289, 0, 0, 0, 1, 1,
-1.124765, -1.131111, -2.768636, 0, 0, 0, 1, 1,
-1.121091, 0.2933448, -1.809579, 1, 1, 1, 1, 1,
-1.121003, 0.9399357, 0.9901392, 1, 1, 1, 1, 1,
-1.115973, 0.4004718, -0.7170879, 1, 1, 1, 1, 1,
-1.115388, 0.5417237, -1.704349, 1, 1, 1, 1, 1,
-1.113657, -0.5146051, -0.8666684, 1, 1, 1, 1, 1,
-1.110278, -1.769494, -4.234091, 1, 1, 1, 1, 1,
-1.10769, 0.9247111, -0.6384037, 1, 1, 1, 1, 1,
-1.106143, 0.06050329, -0.6064885, 1, 1, 1, 1, 1,
-1.098026, -0.5335934, -2.51813, 1, 1, 1, 1, 1,
-1.09706, -0.8010964, -4.141906, 1, 1, 1, 1, 1,
-1.076366, 1.251938, 0.8122947, 1, 1, 1, 1, 1,
-1.071975, 2.001186, -0.5699942, 1, 1, 1, 1, 1,
-1.07065, 0.2756163, -1.611241, 1, 1, 1, 1, 1,
-1.067313, -0.7138351, -2.2103, 1, 1, 1, 1, 1,
-1.06132, 1.067368, -0.4418881, 1, 1, 1, 1, 1,
-1.053758, -2.025551, -2.685474, 0, 0, 1, 1, 1,
-1.048644, -0.03446288, -2.583682, 1, 0, 0, 1, 1,
-1.045227, -0.5809032, -2.31396, 1, 0, 0, 1, 1,
-1.041162, 0.854793, 0.01003417, 1, 0, 0, 1, 1,
-1.040084, -2.659632, -1.457634, 1, 0, 0, 1, 1,
-1.038012, 0.5097077, -1.282563, 1, 0, 0, 1, 1,
-1.035536, -0.6487788, -2.228507, 0, 0, 0, 1, 1,
-1.032789, -0.4725885, 0.05760272, 0, 0, 0, 1, 1,
-1.029487, -0.3272649, -4.005823, 0, 0, 0, 1, 1,
-1.022552, 0.3755453, -0.7627726, 0, 0, 0, 1, 1,
-1.011487, 2.298111, 0.7583679, 0, 0, 0, 1, 1,
-0.9951035, 0.1128372, -2.184951, 0, 0, 0, 1, 1,
-0.9935836, -0.267497, -2.244666, 0, 0, 0, 1, 1,
-0.9825877, -0.6767398, -2.724271, 1, 1, 1, 1, 1,
-0.9718871, -0.1013622, -0.7743658, 1, 1, 1, 1, 1,
-0.9680126, -1.444876, -3.08268, 1, 1, 1, 1, 1,
-0.9620985, 0.2994471, -1.242885, 1, 1, 1, 1, 1,
-0.960719, -0.3789373, -2.844658, 1, 1, 1, 1, 1,
-0.9602802, -1.659021, -1.67179, 1, 1, 1, 1, 1,
-0.9555302, 0.07733513, -1.657752, 1, 1, 1, 1, 1,
-0.951373, -0.4541393, -2.279498, 1, 1, 1, 1, 1,
-0.9375879, -0.5144144, -1.429859, 1, 1, 1, 1, 1,
-0.9284433, 0.7386323, -0.7338702, 1, 1, 1, 1, 1,
-0.9249359, -1.391445, -2.800293, 1, 1, 1, 1, 1,
-0.9214844, -0.1015467, -2.779404, 1, 1, 1, 1, 1,
-0.9199407, -1.059671, -1.488187, 1, 1, 1, 1, 1,
-0.9189764, 0.8088195, 0.0327251, 1, 1, 1, 1, 1,
-0.916976, 0.442504, -1.394724, 1, 1, 1, 1, 1,
-0.9080206, -0.5814976, -1.241488, 0, 0, 1, 1, 1,
-0.903311, 1.375818, -2.009006, 1, 0, 0, 1, 1,
-0.9020531, -0.2532864, -0.7115631, 1, 0, 0, 1, 1,
-0.9013015, -1.253246, -5.208148, 1, 0, 0, 1, 1,
-0.9002109, -0.8857335, -2.714681, 1, 0, 0, 1, 1,
-0.8933575, -1.613518, -1.190331, 1, 0, 0, 1, 1,
-0.8886163, -0.1927999, -2.285148, 0, 0, 0, 1, 1,
-0.8875533, 1.222844, -0.2727264, 0, 0, 0, 1, 1,
-0.8826159, -0.2681784, -0.09355912, 0, 0, 0, 1, 1,
-0.8811084, -1.0489, -0.8771183, 0, 0, 0, 1, 1,
-0.8810964, -1.394578, -1.934555, 0, 0, 0, 1, 1,
-0.877141, -0.02974307, -2.552162, 0, 0, 0, 1, 1,
-0.8758416, 0.5901644, -0.1355254, 0, 0, 0, 1, 1,
-0.872898, -1.254415, -2.427639, 1, 1, 1, 1, 1,
-0.8684538, -0.2863467, -3.00843, 1, 1, 1, 1, 1,
-0.8661422, -0.5014056, -1.985533, 1, 1, 1, 1, 1,
-0.8599891, -1.024004, -1.60519, 1, 1, 1, 1, 1,
-0.859655, 0.4124112, -1.055887, 1, 1, 1, 1, 1,
-0.8570341, -1.713212, -3.869126, 1, 1, 1, 1, 1,
-0.8503323, -0.3150872, -2.438417, 1, 1, 1, 1, 1,
-0.8490741, 0.377594, 0.04360069, 1, 1, 1, 1, 1,
-0.8471702, -0.2510587, -1.249852, 1, 1, 1, 1, 1,
-0.8469697, 1.062291, -1.040542, 1, 1, 1, 1, 1,
-0.8298313, -0.7800695, -1.905658, 1, 1, 1, 1, 1,
-0.8295096, -0.07381378, 0.1858503, 1, 1, 1, 1, 1,
-0.8219882, 0.1268333, -0.5718939, 1, 1, 1, 1, 1,
-0.8067155, 0.2024952, -0.4553705, 1, 1, 1, 1, 1,
-0.8020273, -0.08146184, -3.157514, 1, 1, 1, 1, 1,
-0.7972738, -0.7088255, -2.289894, 0, 0, 1, 1, 1,
-0.7899508, 0.9103096, -1.946901, 1, 0, 0, 1, 1,
-0.7855016, -0.4493285, -2.478997, 1, 0, 0, 1, 1,
-0.7851413, 0.4208773, 0.3331458, 1, 0, 0, 1, 1,
-0.7824409, -0.6945651, -2.767402, 1, 0, 0, 1, 1,
-0.7788972, -1.144994, -3.594867, 1, 0, 0, 1, 1,
-0.772916, -0.4480785, -3.355544, 0, 0, 0, 1, 1,
-0.770743, -0.2511277, -0.3745952, 0, 0, 0, 1, 1,
-0.7701138, 0.800824, -1.716339, 0, 0, 0, 1, 1,
-0.7669955, -0.8119009, -3.115369, 0, 0, 0, 1, 1,
-0.7654122, 0.7247656, -0.2034071, 0, 0, 0, 1, 1,
-0.7636698, -0.1013394, -0.4494377, 0, 0, 0, 1, 1,
-0.7606031, -1.112421, -2.656335, 0, 0, 0, 1, 1,
-0.7581294, 1.585822, 0.5337151, 1, 1, 1, 1, 1,
-0.7563838, -0.6143304, -2.442845, 1, 1, 1, 1, 1,
-0.7557018, -1.333687, -3.576145, 1, 1, 1, 1, 1,
-0.7517303, -1.08224, -1.913472, 1, 1, 1, 1, 1,
-0.7468339, 0.3621406, -1.106115, 1, 1, 1, 1, 1,
-0.7457193, 1.590701, -0.1684915, 1, 1, 1, 1, 1,
-0.7344377, 0.970806, -0.8047662, 1, 1, 1, 1, 1,
-0.7319231, -0.2753797, -4.298961, 1, 1, 1, 1, 1,
-0.7207082, 0.7424676, 0.2888997, 1, 1, 1, 1, 1,
-0.7191616, 0.5169891, -1.794688, 1, 1, 1, 1, 1,
-0.7136415, -0.0891728, -1.801428, 1, 1, 1, 1, 1,
-0.7098553, 2.272236, -0.5567716, 1, 1, 1, 1, 1,
-0.7051492, 0.4578544, -0.3346038, 1, 1, 1, 1, 1,
-0.7043035, 0.1519863, -1.885442, 1, 1, 1, 1, 1,
-0.7035805, 0.9780493, -1.511209, 1, 1, 1, 1, 1,
-0.7014167, 0.5366629, -3.03107, 0, 0, 1, 1, 1,
-0.7002125, 0.2392289, -1.69815, 1, 0, 0, 1, 1,
-0.6990346, 0.296612, -0.9852983, 1, 0, 0, 1, 1,
-0.6981966, -1.065176, -1.07711, 1, 0, 0, 1, 1,
-0.6975872, -0.4895857, -1.594285, 1, 0, 0, 1, 1,
-0.6968102, -0.1381644, -1.439556, 1, 0, 0, 1, 1,
-0.6950913, -0.9450362, -1.841079, 0, 0, 0, 1, 1,
-0.6917161, 0.4766734, -1.912796, 0, 0, 0, 1, 1,
-0.6863471, -1.427361, -1.900124, 0, 0, 0, 1, 1,
-0.6843416, 0.5379145, -0.1851665, 0, 0, 0, 1, 1,
-0.6784036, 0.7364275, -2.804193, 0, 0, 0, 1, 1,
-0.6760871, 0.129707, -1.522975, 0, 0, 0, 1, 1,
-0.6743566, -1.762072, -3.479689, 0, 0, 0, 1, 1,
-0.6736825, 1.001328, -1.694069, 1, 1, 1, 1, 1,
-0.6734468, -0.9953637, -0.4338378, 1, 1, 1, 1, 1,
-0.6712391, 0.3472208, -1.669648, 1, 1, 1, 1, 1,
-0.6699089, -1.984805, -3.91679, 1, 1, 1, 1, 1,
-0.6684382, -1.212869, -1.902906, 1, 1, 1, 1, 1,
-0.6566972, -0.5480784, -3.25405, 1, 1, 1, 1, 1,
-0.654547, 0.2916178, -2.746385, 1, 1, 1, 1, 1,
-0.6542563, 0.1197932, -1.538985, 1, 1, 1, 1, 1,
-0.6536354, 1.323009, 1.478625, 1, 1, 1, 1, 1,
-0.6535779, -1.316677, -3.734483, 1, 1, 1, 1, 1,
-0.6510733, -1.735412, -4.130766, 1, 1, 1, 1, 1,
-0.6485481, -2.027246, -4.574068, 1, 1, 1, 1, 1,
-0.6426893, -0.5103714, -2.652162, 1, 1, 1, 1, 1,
-0.6398818, 0.5153033, -1.35077, 1, 1, 1, 1, 1,
-0.6343027, -0.6344447, -3.410575, 1, 1, 1, 1, 1,
-0.6326318, 0.7784222, 0.1544599, 0, 0, 1, 1, 1,
-0.6323882, -0.1769737, -3.403743, 1, 0, 0, 1, 1,
-0.6323709, -0.3583584, -2.158359, 1, 0, 0, 1, 1,
-0.631047, -0.7277905, -2.301283, 1, 0, 0, 1, 1,
-0.6274402, 1.604806, 0.145724, 1, 0, 0, 1, 1,
-0.624921, -0.8833113, -1.646909, 1, 0, 0, 1, 1,
-0.6157864, -0.6630722, -1.943936, 0, 0, 0, 1, 1,
-0.6150852, -1.215718, -1.526103, 0, 0, 0, 1, 1,
-0.6128213, 2.418709, 0.4932091, 0, 0, 0, 1, 1,
-0.6116381, 0.3413975, 0.1126219, 0, 0, 0, 1, 1,
-0.6113673, 0.8572103, -0.21355, 0, 0, 0, 1, 1,
-0.6063372, 0.8773247, -0.07044472, 0, 0, 0, 1, 1,
-0.5916292, -0.487471, -1.853621, 0, 0, 0, 1, 1,
-0.5867898, 0.4898813, -1.433527, 1, 1, 1, 1, 1,
-0.5835857, 0.1196004, -1.63006, 1, 1, 1, 1, 1,
-0.5814275, -0.3978569, -3.570765, 1, 1, 1, 1, 1,
-0.5776115, 1.196595, -0.9722996, 1, 1, 1, 1, 1,
-0.5736334, 0.04696897, -2.255879, 1, 1, 1, 1, 1,
-0.5721444, -1.114723, -3.551028, 1, 1, 1, 1, 1,
-0.56468, -1.795961, -3.116363, 1, 1, 1, 1, 1,
-0.5640708, -0.7397944, -3.051321, 1, 1, 1, 1, 1,
-0.562144, -1.521864, -0.08676592, 1, 1, 1, 1, 1,
-0.5592707, -2.327096, -1.185042, 1, 1, 1, 1, 1,
-0.5519586, -0.1914673, -3.168542, 1, 1, 1, 1, 1,
-0.5501134, 0.1845686, -1.640543, 1, 1, 1, 1, 1,
-0.5468456, 2.030416, -1.600977, 1, 1, 1, 1, 1,
-0.5456951, 1.154882, -2.391766, 1, 1, 1, 1, 1,
-0.5456072, -1.382856, -2.22405, 1, 1, 1, 1, 1,
-0.5435385, 1.103845, -1.293694, 0, 0, 1, 1, 1,
-0.5430193, -0.6838853, -1.796672, 1, 0, 0, 1, 1,
-0.5425923, -1.139592, -3.19392, 1, 0, 0, 1, 1,
-0.5419127, -0.6104845, -3.389426, 1, 0, 0, 1, 1,
-0.541489, 1.106478, -1.373055, 1, 0, 0, 1, 1,
-0.5409724, 0.1333273, -1.703079, 1, 0, 0, 1, 1,
-0.5380948, 0.5428454, -1.760388, 0, 0, 0, 1, 1,
-0.5349053, -0.7370748, -4.287544, 0, 0, 0, 1, 1,
-0.5297401, -2.949459, -2.285561, 0, 0, 0, 1, 1,
-0.5236021, 0.113511, -1.147404, 0, 0, 0, 1, 1,
-0.5212995, 1.119719, -0.03678183, 0, 0, 0, 1, 1,
-0.5209361, 0.9367663, 0.8222887, 0, 0, 0, 1, 1,
-0.5190651, 0.813099, -1.110599, 0, 0, 0, 1, 1,
-0.518987, 0.1488007, 0.6896257, 1, 1, 1, 1, 1,
-0.5163377, -1.051409, -3.127139, 1, 1, 1, 1, 1,
-0.5099154, -0.337029, -2.951803, 1, 1, 1, 1, 1,
-0.5061374, 1.260442, -0.541327, 1, 1, 1, 1, 1,
-0.5042865, 0.7962456, 0.1999827, 1, 1, 1, 1, 1,
-0.5022757, -0.2890823, -3.862409, 1, 1, 1, 1, 1,
-0.5019851, -0.8597625, -1.589302, 1, 1, 1, 1, 1,
-0.4994538, 0.3432327, -0.6907921, 1, 1, 1, 1, 1,
-0.4931861, -0.1511944, -0.8361699, 1, 1, 1, 1, 1,
-0.4915925, -0.05872285, 0.1516763, 1, 1, 1, 1, 1,
-0.4912329, 0.3845838, -2.798161, 1, 1, 1, 1, 1,
-0.4881102, 0.05777901, -3.596954, 1, 1, 1, 1, 1,
-0.4848549, 0.4598102, 0.5608541, 1, 1, 1, 1, 1,
-0.4834006, 0.1191905, -0.942381, 1, 1, 1, 1, 1,
-0.4808355, -0.4508067, -1.281682, 1, 1, 1, 1, 1,
-0.4796411, 2.018352, -2.119635, 0, 0, 1, 1, 1,
-0.4783372, 0.8654695, 0.2159376, 1, 0, 0, 1, 1,
-0.4779873, -0.3192023, -1.328497, 1, 0, 0, 1, 1,
-0.473578, 0.6215507, -0.8476117, 1, 0, 0, 1, 1,
-0.4730402, -0.3572045, -2.996766, 1, 0, 0, 1, 1,
-0.472541, 0.4634803, -1.358333, 1, 0, 0, 1, 1,
-0.4724, -0.3019833, -2.81252, 0, 0, 0, 1, 1,
-0.4713686, -1.312067, -3.311823, 0, 0, 0, 1, 1,
-0.4687988, -0.9507734, -2.911294, 0, 0, 0, 1, 1,
-0.4680492, -0.4160683, -2.256682, 0, 0, 0, 1, 1,
-0.4633533, 1.184468, -0.3401896, 0, 0, 0, 1, 1,
-0.4575272, 0.1455762, -0.9279495, 0, 0, 0, 1, 1,
-0.4513093, 0.6376076, 0.9714457, 0, 0, 0, 1, 1,
-0.4487774, -1.40547, -2.340051, 1, 1, 1, 1, 1,
-0.448756, 0.8131729, -0.9622653, 1, 1, 1, 1, 1,
-0.4486742, 0.9463114, -0.04631968, 1, 1, 1, 1, 1,
-0.444495, 2.06567, -2.190781, 1, 1, 1, 1, 1,
-0.4441486, -0.9857622, -2.789947, 1, 1, 1, 1, 1,
-0.4437843, -0.1038877, -1.532067, 1, 1, 1, 1, 1,
-0.4406488, 0.7373031, -1.576452, 1, 1, 1, 1, 1,
-0.440393, -1.471869, -3.084387, 1, 1, 1, 1, 1,
-0.4399029, 0.1283601, -1.522408, 1, 1, 1, 1, 1,
-0.435094, 0.9212946, -1.550024, 1, 1, 1, 1, 1,
-0.4298969, -0.9330484, -4.243853, 1, 1, 1, 1, 1,
-0.4280166, 0.162058, -1.436685, 1, 1, 1, 1, 1,
-0.4271374, 0.2103022, -2.201186, 1, 1, 1, 1, 1,
-0.4268979, 0.7738831, -2.608694, 1, 1, 1, 1, 1,
-0.4240433, 1.153195, 2.595917, 1, 1, 1, 1, 1,
-0.4234438, 1.017329, -1.052179, 0, 0, 1, 1, 1,
-0.4179358, 0.08483715, -0.4106628, 1, 0, 0, 1, 1,
-0.4144668, 0.2026109, -2.371108, 1, 0, 0, 1, 1,
-0.4142554, 0.9826692, 0.2749743, 1, 0, 0, 1, 1,
-0.407047, 1.481223, -1.920813, 1, 0, 0, 1, 1,
-0.4059241, 0.691284, -0.9046977, 1, 0, 0, 1, 1,
-0.4057349, -0.8164952, -1.521483, 0, 0, 0, 1, 1,
-0.4032318, 1.281127, 0.2894854, 0, 0, 0, 1, 1,
-0.400156, 1.089271, -0.7964955, 0, 0, 0, 1, 1,
-0.399629, 0.1219818, 0.1206121, 0, 0, 0, 1, 1,
-0.3968881, -0.6131002, -1.576349, 0, 0, 0, 1, 1,
-0.396378, -0.5619441, -2.496161, 0, 0, 0, 1, 1,
-0.39264, -0.9201878, -3.975914, 0, 0, 0, 1, 1,
-0.3892007, -0.5261571, -3.590331, 1, 1, 1, 1, 1,
-0.3826858, -0.5300816, -2.989652, 1, 1, 1, 1, 1,
-0.3769853, -0.9815119, -1.661539, 1, 1, 1, 1, 1,
-0.3764628, 0.8649486, -0.3842551, 1, 1, 1, 1, 1,
-0.3750265, -1.562506, -3.441728, 1, 1, 1, 1, 1,
-0.3748921, 1.274687, 0.8192396, 1, 1, 1, 1, 1,
-0.3714337, 0.9287578, -3.689302, 1, 1, 1, 1, 1,
-0.3700061, 0.1491953, -1.627392, 1, 1, 1, 1, 1,
-0.3685353, 0.9065905, -0.5014471, 1, 1, 1, 1, 1,
-0.3677276, -0.3816852, -2.617749, 1, 1, 1, 1, 1,
-0.3621987, -0.5294528, -0.4350418, 1, 1, 1, 1, 1,
-0.3598967, 1.14916, -2.099921, 1, 1, 1, 1, 1,
-0.3568096, -0.6034082, -3.587973, 1, 1, 1, 1, 1,
-0.3552273, -0.003446747, -2.530849, 1, 1, 1, 1, 1,
-0.3478602, -2.162113, -3.72838, 1, 1, 1, 1, 1,
-0.3435587, 0.9431242, 0.4743424, 0, 0, 1, 1, 1,
-0.3334746, -1.266048, -2.278107, 1, 0, 0, 1, 1,
-0.332444, 1.8482, 0.01968223, 1, 0, 0, 1, 1,
-0.3308387, 0.5710961, 0.1311268, 1, 0, 0, 1, 1,
-0.3290303, -1.00206, -2.268321, 1, 0, 0, 1, 1,
-0.3282963, 1.97972, -1.318349, 1, 0, 0, 1, 1,
-0.326912, -0.6505406, -2.65548, 0, 0, 0, 1, 1,
-0.3248826, -0.620414, -2.797959, 0, 0, 0, 1, 1,
-0.3218518, -1.420201, -4.722601, 0, 0, 0, 1, 1,
-0.3214961, 1.056167, -0.8885219, 0, 0, 0, 1, 1,
-0.3195176, -0.53962, -0.4018651, 0, 0, 0, 1, 1,
-0.3175763, -0.5871643, -3.254812, 0, 0, 0, 1, 1,
-0.3171895, -1.439375, -1.711863, 0, 0, 0, 1, 1,
-0.3051176, 2.102045, -0.01124218, 1, 1, 1, 1, 1,
-0.2964312, 0.179493, -0.3701891, 1, 1, 1, 1, 1,
-0.2951342, 0.9231679, 0.3764305, 1, 1, 1, 1, 1,
-0.2950077, 0.6948158, -0.470952, 1, 1, 1, 1, 1,
-0.2929065, 0.09768221, -2.861133, 1, 1, 1, 1, 1,
-0.2925723, -1.896001, -4.427051, 1, 1, 1, 1, 1,
-0.2912793, 1.666866, 0.2358733, 1, 1, 1, 1, 1,
-0.2872603, 0.9706052, -0.8351276, 1, 1, 1, 1, 1,
-0.2777898, -0.4309966, -2.791499, 1, 1, 1, 1, 1,
-0.2731617, -0.4954316, -2.89563, 1, 1, 1, 1, 1,
-0.2698251, -0.82592, -2.293038, 1, 1, 1, 1, 1,
-0.2652455, 0.3609492, -1.058552, 1, 1, 1, 1, 1,
-0.2651762, 0.9338035, -0.2415674, 1, 1, 1, 1, 1,
-0.2646893, 0.5294257, -0.6364359, 1, 1, 1, 1, 1,
-0.2568092, -1.474097, -2.928705, 1, 1, 1, 1, 1,
-0.2563632, -0.1313672, -1.965193, 0, 0, 1, 1, 1,
-0.255352, 0.7184426, -1.569236, 1, 0, 0, 1, 1,
-0.2542222, 1.969084, -0.5940678, 1, 0, 0, 1, 1,
-0.2522053, -1.21741, -4.285115, 1, 0, 0, 1, 1,
-0.2488043, 1.011088, -0.9900422, 1, 0, 0, 1, 1,
-0.2443447, 0.3791086, -0.6227965, 1, 0, 0, 1, 1,
-0.2414886, -0.6637152, -3.827077, 0, 0, 0, 1, 1,
-0.2410957, 0.8463088, 0.04789389, 0, 0, 0, 1, 1,
-0.2407298, -1.139153, -1.402414, 0, 0, 0, 1, 1,
-0.2403605, 0.4359203, 0.2973439, 0, 0, 0, 1, 1,
-0.235947, -1.476695, -3.663728, 0, 0, 0, 1, 1,
-0.2334835, 1.881003, 0.3423319, 0, 0, 0, 1, 1,
-0.2322931, 0.641437, 0.5508382, 0, 0, 0, 1, 1,
-0.2318694, -0.2015023, -0.9844145, 1, 1, 1, 1, 1,
-0.2290032, 0.6159832, -2.340357, 1, 1, 1, 1, 1,
-0.2274792, 0.1286377, -3.346887, 1, 1, 1, 1, 1,
-0.2267038, -0.9545931, -3.775061, 1, 1, 1, 1, 1,
-0.2263728, 0.7015634, -1.979176, 1, 1, 1, 1, 1,
-0.217963, -0.1964303, -1.408332, 1, 1, 1, 1, 1,
-0.2172235, 1.440758, -1.606099, 1, 1, 1, 1, 1,
-0.2121969, 0.646637, 0.6963028, 1, 1, 1, 1, 1,
-0.2115809, -0.02003256, -2.19066, 1, 1, 1, 1, 1,
-0.2109513, 1.584241, -2.37809, 1, 1, 1, 1, 1,
-0.2098794, 0.4742987, -0.1068655, 1, 1, 1, 1, 1,
-0.2049453, 0.5853095, -0.6731409, 1, 1, 1, 1, 1,
-0.2001164, 1.488335, -0.8117485, 1, 1, 1, 1, 1,
-0.1994382, 0.7859871, 0.1505057, 1, 1, 1, 1, 1,
-0.1990368, 0.2668183, -0.11525, 1, 1, 1, 1, 1,
-0.1964796, 0.5630921, -0.4626615, 0, 0, 1, 1, 1,
-0.1962974, 0.2646005, -2.526541, 1, 0, 0, 1, 1,
-0.19364, 0.5748892, 0.2796898, 1, 0, 0, 1, 1,
-0.1894223, -1.029985, -2.423659, 1, 0, 0, 1, 1,
-0.1840437, -0.9723892, -2.73956, 1, 0, 0, 1, 1,
-0.1831812, 0.2563297, -0.2101969, 1, 0, 0, 1, 1,
-0.1825919, -0.8130733, -1.836459, 0, 0, 0, 1, 1,
-0.1809837, -1.07979, -2.254154, 0, 0, 0, 1, 1,
-0.1764471, -1.798955, -1.324574, 0, 0, 0, 1, 1,
-0.1761926, 0.1107721, -0.5723463, 0, 0, 0, 1, 1,
-0.1747189, -3.028745, -2.626227, 0, 0, 0, 1, 1,
-0.1722108, -0.8900415, -3.095087, 0, 0, 0, 1, 1,
-0.1714161, -1.108295, -2.554235, 0, 0, 0, 1, 1,
-0.1655487, -1.2138, -3.075364, 1, 1, 1, 1, 1,
-0.1614296, 0.2575895, -0.7006645, 1, 1, 1, 1, 1,
-0.1597131, 0.1084958, 0.6145159, 1, 1, 1, 1, 1,
-0.1574359, 0.3058116, -0.2491706, 1, 1, 1, 1, 1,
-0.1533312, -1.644559, -3.362505, 1, 1, 1, 1, 1,
-0.1331174, 0.7556406, 0.9694366, 1, 1, 1, 1, 1,
-0.1317941, -2.238542, -2.759168, 1, 1, 1, 1, 1,
-0.1307288, -0.2845373, -3.02484, 1, 1, 1, 1, 1,
-0.1279402, -1.270856, -2.693999, 1, 1, 1, 1, 1,
-0.1243173, -1.132695, -2.790936, 1, 1, 1, 1, 1,
-0.1225937, -0.5253485, -4.170684, 1, 1, 1, 1, 1,
-0.1184509, -1.457832, -3.021468, 1, 1, 1, 1, 1,
-0.1178554, 0.07829689, 1.38205, 1, 1, 1, 1, 1,
-0.1152244, -1.749083, -1.187442, 1, 1, 1, 1, 1,
-0.1149052, 0.8969082, -0.9427145, 1, 1, 1, 1, 1,
-0.1035583, 0.3065223, 1.35696, 0, 0, 1, 1, 1,
-0.1027788, 0.6344775, 0.2511422, 1, 0, 0, 1, 1,
-0.1025041, 0.0886858, -0.4474532, 1, 0, 0, 1, 1,
-0.0973829, 1.168752, -1.904063, 1, 0, 0, 1, 1,
-0.0901915, 0.7592157, 1.236471, 1, 0, 0, 1, 1,
-0.09003934, 1.812556, 0.6394536, 1, 0, 0, 1, 1,
-0.08664417, -0.1365398, -2.683949, 0, 0, 0, 1, 1,
-0.08327024, 1.0134, -0.2786544, 0, 0, 0, 1, 1,
-0.08252128, -0.688882, -0.297638, 0, 0, 0, 1, 1,
-0.08144052, 1.120368, -0.4603476, 0, 0, 0, 1, 1,
-0.07732644, -1.002805, -3.232033, 0, 0, 0, 1, 1,
-0.07662828, -1.162702, -3.404295, 0, 0, 0, 1, 1,
-0.07341655, 1.142974, 0.328518, 0, 0, 0, 1, 1,
-0.07074168, 1.459193, -0.4711717, 1, 1, 1, 1, 1,
-0.06878866, 0.8862724, 0.4802764, 1, 1, 1, 1, 1,
-0.0645963, -0.8309342, -2.756903, 1, 1, 1, 1, 1,
-0.06213764, -0.1332201, -3.259563, 1, 1, 1, 1, 1,
-0.057659, -0.04735737, -2.941448, 1, 1, 1, 1, 1,
-0.04948311, 0.3883829, 0.3933628, 1, 1, 1, 1, 1,
-0.04874283, -1.553055, -2.480126, 1, 1, 1, 1, 1,
-0.04759133, 0.3881394, 1.492613, 1, 1, 1, 1, 1,
-0.04428328, -0.7169253, -3.869498, 1, 1, 1, 1, 1,
-0.04316639, 0.6073875, -0.8349739, 1, 1, 1, 1, 1,
-0.0428815, -0.08353559, -2.847557, 1, 1, 1, 1, 1,
-0.04028542, 0.5993915, 0.1751347, 1, 1, 1, 1, 1,
-0.03360676, 0.04240013, 1.040445, 1, 1, 1, 1, 1,
-0.03077571, 0.7814016, -2.639093, 1, 1, 1, 1, 1,
-0.02955384, -1.013949, -1.705988, 1, 1, 1, 1, 1,
-0.02912672, -1.841968, -2.34982, 0, 0, 1, 1, 1,
-0.02760248, 0.4301074, 0.8661765, 1, 0, 0, 1, 1,
-0.02472614, 0.7004601, -1.863176, 1, 0, 0, 1, 1,
-0.02402721, 1.997632, 0.3875675, 1, 0, 0, 1, 1,
-0.02389775, -0.233761, -6.044231, 1, 0, 0, 1, 1,
-0.01620503, 0.949107, -0.843721, 1, 0, 0, 1, 1,
-0.01317517, 0.6813307, -0.1653825, 0, 0, 0, 1, 1,
0.0004173925, -1.443309, 1.262617, 0, 0, 0, 1, 1,
0.0009892541, 0.5816181, 0.9300076, 0, 0, 0, 1, 1,
0.00272296, 1.967645, -0.894358, 0, 0, 0, 1, 1,
0.003005828, -0.03197477, 4.026211, 0, 0, 0, 1, 1,
0.004030548, 0.7757581, 1.252617, 0, 0, 0, 1, 1,
0.009849518, -0.07070712, 3.484253, 0, 0, 0, 1, 1,
0.01176438, -0.6045294, 3.791955, 1, 1, 1, 1, 1,
0.01494068, 0.8495378, -0.7291424, 1, 1, 1, 1, 1,
0.01747577, 0.5749605, 0.8525695, 1, 1, 1, 1, 1,
0.01919991, -0.4106059, 4.837519, 1, 1, 1, 1, 1,
0.02141578, -0.4927943, 2.217305, 1, 1, 1, 1, 1,
0.02370222, -0.1210421, 1.007164, 1, 1, 1, 1, 1,
0.03069877, 0.5157195, 0.1366469, 1, 1, 1, 1, 1,
0.03128192, -1.187588, 3.688379, 1, 1, 1, 1, 1,
0.03408401, -0.7741045, 2.275594, 1, 1, 1, 1, 1,
0.03882785, -0.7671613, 2.193716, 1, 1, 1, 1, 1,
0.04430123, -1.14577, 2.269818, 1, 1, 1, 1, 1,
0.04518096, 2.178386, -1.432437, 1, 1, 1, 1, 1,
0.04889043, -1.167625, 3.033074, 1, 1, 1, 1, 1,
0.04999513, 0.1413371, 0.103806, 1, 1, 1, 1, 1,
0.05016506, 0.05347386, 0.973541, 1, 1, 1, 1, 1,
0.05143709, 1.274783, -1.392389, 0, 0, 1, 1, 1,
0.05303533, -0.4960306, 2.850262, 1, 0, 0, 1, 1,
0.05570341, 1.461842, 0.9855101, 1, 0, 0, 1, 1,
0.05583115, 0.0865475, 1.233668, 1, 0, 0, 1, 1,
0.05646812, 0.8368953, -0.1949908, 1, 0, 0, 1, 1,
0.05726746, -0.5748907, 2.938446, 1, 0, 0, 1, 1,
0.05811255, 1.488774, 0.5403553, 0, 0, 0, 1, 1,
0.06368797, -0.4858367, 3.145281, 0, 0, 0, 1, 1,
0.07238592, 1.319243, 1.045653, 0, 0, 0, 1, 1,
0.07797637, -1.832444, 3.176652, 0, 0, 0, 1, 1,
0.08145554, 0.1335564, 0.1298082, 0, 0, 0, 1, 1,
0.08176416, 0.9650937, -0.7857844, 0, 0, 0, 1, 1,
0.08203678, 0.2170932, 0.7642045, 0, 0, 0, 1, 1,
0.08374855, -0.01992603, 1.547289, 1, 1, 1, 1, 1,
0.08408845, 1.486241, 0.7498339, 1, 1, 1, 1, 1,
0.09117424, -0.2884787, 1.269053, 1, 1, 1, 1, 1,
0.09147197, 1.682396, 1.673918, 1, 1, 1, 1, 1,
0.100868, 0.5181946, 1.376427, 1, 1, 1, 1, 1,
0.1024998, 0.9466797, 1.473538, 1, 1, 1, 1, 1,
0.102896, 2.080026, -0.6635283, 1, 1, 1, 1, 1,
0.1120076, -0.5036434, 3.849531, 1, 1, 1, 1, 1,
0.1169932, -0.1101979, 4.624718, 1, 1, 1, 1, 1,
0.1225301, 0.6913848, 0.1624007, 1, 1, 1, 1, 1,
0.1236017, 1.044172, -0.5132142, 1, 1, 1, 1, 1,
0.1248174, 0.4478242, -1.364949, 1, 1, 1, 1, 1,
0.1253232, 1.663005, 1.995875, 1, 1, 1, 1, 1,
0.1276345, -0.7515239, 3.859532, 1, 1, 1, 1, 1,
0.131071, -1.983955, 1.514737, 1, 1, 1, 1, 1,
0.1315887, -0.4291797, 3.818119, 0, 0, 1, 1, 1,
0.134827, -0.2199972, 3.161428, 1, 0, 0, 1, 1,
0.1379312, 0.1614472, 0.3398395, 1, 0, 0, 1, 1,
0.1401078, 2.271151, 0.8754899, 1, 0, 0, 1, 1,
0.1410826, 0.2229089, 2.728218, 1, 0, 0, 1, 1,
0.1420972, -1.445464, 2.849362, 1, 0, 0, 1, 1,
0.1429067, -0.1389477, 2.046745, 0, 0, 0, 1, 1,
0.1460518, -0.5726525, 4.3557, 0, 0, 0, 1, 1,
0.1469742, -0.04992371, 1.156856, 0, 0, 0, 1, 1,
0.1489479, 2.287874, -1.12612, 0, 0, 0, 1, 1,
0.1497247, 2.451499, -2.68857, 0, 0, 0, 1, 1,
0.1504809, -1.358809, 2.319307, 0, 0, 0, 1, 1,
0.152255, -0.9924045, 3.409218, 0, 0, 0, 1, 1,
0.1574628, 0.8391622, -0.8675058, 1, 1, 1, 1, 1,
0.1590145, -0.1883451, 2.857343, 1, 1, 1, 1, 1,
0.1606966, 0.3366291, 0.5261772, 1, 1, 1, 1, 1,
0.1607015, 0.1130227, 0.700422, 1, 1, 1, 1, 1,
0.1660446, -1.286122, 2.779264, 1, 1, 1, 1, 1,
0.1683404, -0.7720984, 4.56556, 1, 1, 1, 1, 1,
0.1687258, 1.231477, -1.005983, 1, 1, 1, 1, 1,
0.1700786, -0.2075374, 3.265504, 1, 1, 1, 1, 1,
0.1703027, -0.8257362, 2.868655, 1, 1, 1, 1, 1,
0.1720973, 0.2594275, 2.54259, 1, 1, 1, 1, 1,
0.1724049, -0.572681, 2.309922, 1, 1, 1, 1, 1,
0.1738988, -0.6527473, 1.803155, 1, 1, 1, 1, 1,
0.1743317, 0.9563888, -0.6271757, 1, 1, 1, 1, 1,
0.1767379, -0.3987727, 4.684586, 1, 1, 1, 1, 1,
0.1775374, 0.6875606, -0.252005, 1, 1, 1, 1, 1,
0.181962, 0.5633784, 0.822685, 0, 0, 1, 1, 1,
0.1836475, -0.6541458, 1.387879, 1, 0, 0, 1, 1,
0.1849692, 0.5320646, -1.29512, 1, 0, 0, 1, 1,
0.1879264, -0.386674, 4.058154, 1, 0, 0, 1, 1,
0.1886015, 0.5164961, 0.522154, 1, 0, 0, 1, 1,
0.1889034, -0.5569068, 1.4816, 1, 0, 0, 1, 1,
0.1924727, -1.040419, 2.451861, 0, 0, 0, 1, 1,
0.1937191, 0.1905259, 0.9406145, 0, 0, 0, 1, 1,
0.1997931, -0.07218211, 3.03618, 0, 0, 0, 1, 1,
0.2000689, 0.6178105, -0.7139726, 0, 0, 0, 1, 1,
0.2015305, -0.8640067, 2.718769, 0, 0, 0, 1, 1,
0.2030986, -0.5704603, 4.824972, 0, 0, 0, 1, 1,
0.2055042, -0.3467416, 2.661226, 0, 0, 0, 1, 1,
0.2069594, 0.9576169, -0.6725389, 1, 1, 1, 1, 1,
0.2098505, 0.1399718, -0.4777427, 1, 1, 1, 1, 1,
0.2100267, 1.473827, -0.8631541, 1, 1, 1, 1, 1,
0.2155826, 0.3439575, 0.9967659, 1, 1, 1, 1, 1,
0.2184828, -1.640792, 3.50415, 1, 1, 1, 1, 1,
0.2187804, -0.4948338, 2.662076, 1, 1, 1, 1, 1,
0.2188603, 0.811856, -0.27532, 1, 1, 1, 1, 1,
0.2214483, 0.08291893, 1.395593, 1, 1, 1, 1, 1,
0.2227136, -0.01749634, 3.123256, 1, 1, 1, 1, 1,
0.231458, -0.681749, 3.466897, 1, 1, 1, 1, 1,
0.2398755, -0.6675274, 2.780481, 1, 1, 1, 1, 1,
0.240696, -0.6511286, 2.061589, 1, 1, 1, 1, 1,
0.2421558, 0.2922512, -0.02923828, 1, 1, 1, 1, 1,
0.2432364, -0.5921465, 2.714577, 1, 1, 1, 1, 1,
0.2451057, -1.60825, 4.70918, 1, 1, 1, 1, 1,
0.2451955, 1.311662, -0.4252307, 0, 0, 1, 1, 1,
0.2521411, -0.4127834, 2.950593, 1, 0, 0, 1, 1,
0.2523017, -0.7883911, 2.748807, 1, 0, 0, 1, 1,
0.252578, 0.03247556, 1.481488, 1, 0, 0, 1, 1,
0.2531549, -0.1523719, 2.530232, 1, 0, 0, 1, 1,
0.2535674, -1.691053, 0.8546944, 1, 0, 0, 1, 1,
0.2550697, 0.05564601, -0.09955958, 0, 0, 0, 1, 1,
0.258063, -0.7970096, 1.918651, 0, 0, 0, 1, 1,
0.2582818, -0.3414244, 2.232343, 0, 0, 0, 1, 1,
0.2590499, -0.4186588, 2.272275, 0, 0, 0, 1, 1,
0.2607398, 0.6447217, 0.146605, 0, 0, 0, 1, 1,
0.2609582, 0.6569896, 0.1648225, 0, 0, 0, 1, 1,
0.2641, -0.02141017, 0.6441908, 0, 0, 0, 1, 1,
0.2659354, -1.503879, 2.686275, 1, 1, 1, 1, 1,
0.2662548, -0.1746517, 0.8213875, 1, 1, 1, 1, 1,
0.271532, -0.59837, 2.025355, 1, 1, 1, 1, 1,
0.2718504, -0.870342, 1.748957, 1, 1, 1, 1, 1,
0.2726751, 0.8178099, 1.59412, 1, 1, 1, 1, 1,
0.2734756, 0.7391692, -1.25915, 1, 1, 1, 1, 1,
0.2744332, -0.4419491, 2.44964, 1, 1, 1, 1, 1,
0.2789261, 0.4143867, -0.601214, 1, 1, 1, 1, 1,
0.2789802, 0.9340296, 2.09565, 1, 1, 1, 1, 1,
0.2847163, 0.8572339, 0.9729584, 1, 1, 1, 1, 1,
0.2891501, -0.8217926, 2.195828, 1, 1, 1, 1, 1,
0.2908705, -0.234796, 1.787217, 1, 1, 1, 1, 1,
0.2916596, 0.9391684, -1.741971, 1, 1, 1, 1, 1,
0.2962078, -0.01686337, -0.708375, 1, 1, 1, 1, 1,
0.3001773, 0.05681179, 2.484965, 1, 1, 1, 1, 1,
0.3045275, -0.2773437, 2.183084, 0, 0, 1, 1, 1,
0.3070818, 0.1774891, 3.266863, 1, 0, 0, 1, 1,
0.3075191, 0.9108976, 0.03433028, 1, 0, 0, 1, 1,
0.3082136, 2.386451, 1.513479, 1, 0, 0, 1, 1,
0.3139586, -0.09155635, 0.8694173, 1, 0, 0, 1, 1,
0.3142004, -0.6283131, 2.012923, 1, 0, 0, 1, 1,
0.315962, 1.007447, 1.718242, 0, 0, 0, 1, 1,
0.318464, -0.6092917, 2.556968, 0, 0, 0, 1, 1,
0.3206787, 0.5583063, -1.175998, 0, 0, 0, 1, 1,
0.3208039, -1.445102, 4.210198, 0, 0, 0, 1, 1,
0.3212998, 0.1266929, 2.53112, 0, 0, 0, 1, 1,
0.3240116, 0.5910573, -0.2253998, 0, 0, 0, 1, 1,
0.3310823, 0.2172855, 0.9886907, 0, 0, 0, 1, 1,
0.3343095, 1.083581, -0.04346211, 1, 1, 1, 1, 1,
0.3480586, -0.08579, 2.702996, 1, 1, 1, 1, 1,
0.3484588, 0.04348784, 0.001182867, 1, 1, 1, 1, 1,
0.364702, 0.6709103, 0.6260997, 1, 1, 1, 1, 1,
0.3662845, -0.1997715, 1.168513, 1, 1, 1, 1, 1,
0.3694174, -0.2642847, 1.828547, 1, 1, 1, 1, 1,
0.3713546, 1.290788, 0.2029905, 1, 1, 1, 1, 1,
0.3742517, 0.5123683, 1.638164, 1, 1, 1, 1, 1,
0.3780882, 2.544662, -0.05814418, 1, 1, 1, 1, 1,
0.3800544, -0.09213363, 0.03695196, 1, 1, 1, 1, 1,
0.3887626, 0.2275001, 1.215174, 1, 1, 1, 1, 1,
0.3964525, 0.4918393, 0.6599623, 1, 1, 1, 1, 1,
0.3976375, -1.831388, 2.184268, 1, 1, 1, 1, 1,
0.3976564, 1.870762, 1.368999, 1, 1, 1, 1, 1,
0.3986031, -0.4609932, 2.565211, 1, 1, 1, 1, 1,
0.3994719, 1.52567, -0.1803223, 0, 0, 1, 1, 1,
0.4041235, -2.479196, 3.250726, 1, 0, 0, 1, 1,
0.4055739, -1.286419, 2.739112, 1, 0, 0, 1, 1,
0.4072854, 0.01812704, 2.854475, 1, 0, 0, 1, 1,
0.407724, -0.3325295, 3.351634, 1, 0, 0, 1, 1,
0.4096218, -0.6320763, 2.845655, 1, 0, 0, 1, 1,
0.4101483, -0.8084096, 2.158361, 0, 0, 0, 1, 1,
0.4106594, 0.3556168, 0.5273498, 0, 0, 0, 1, 1,
0.414353, -0.8077065, 3.466973, 0, 0, 0, 1, 1,
0.4179957, 1.539496, 0.002992186, 0, 0, 0, 1, 1,
0.4204614, 0.3972063, -1.046826, 0, 0, 0, 1, 1,
0.4225075, -0.3901294, 1.15202, 0, 0, 0, 1, 1,
0.4231919, 0.7264006, -0.8481349, 0, 0, 0, 1, 1,
0.42381, 0.7682914, -0.3924282, 1, 1, 1, 1, 1,
0.4244061, 0.5378143, 1.037577, 1, 1, 1, 1, 1,
0.4259661, -0.4828131, 2.758878, 1, 1, 1, 1, 1,
0.4261057, 0.7596323, 0.02976652, 1, 1, 1, 1, 1,
0.4261205, 2.468662, 1.017711, 1, 1, 1, 1, 1,
0.4268754, 0.7135344, -0.2203314, 1, 1, 1, 1, 1,
0.43149, 1.129316, 0.08887193, 1, 1, 1, 1, 1,
0.4352041, -0.6561165, 2.976972, 1, 1, 1, 1, 1,
0.4359489, -2.533421, 3.069223, 1, 1, 1, 1, 1,
0.4366254, 0.2703315, 0.6916687, 1, 1, 1, 1, 1,
0.4400087, 1.302234, -0.2121249, 1, 1, 1, 1, 1,
0.4492096, -0.1073123, 3.156697, 1, 1, 1, 1, 1,
0.4532314, 1.271435, -1.207759, 1, 1, 1, 1, 1,
0.456606, 0.9246906, -0.02308585, 1, 1, 1, 1, 1,
0.4576961, 0.1376532, 1.26843, 1, 1, 1, 1, 1,
0.4582164, -0.1757237, -0.1784262, 0, 0, 1, 1, 1,
0.4626433, 0.1368761, 1.736101, 1, 0, 0, 1, 1,
0.4634925, 0.05020203, 0.6606709, 1, 0, 0, 1, 1,
0.4655697, -0.06162437, -0.06862189, 1, 0, 0, 1, 1,
0.4696082, 0.8339715, 0.5186481, 1, 0, 0, 1, 1,
0.4705289, -0.9472224, 3.716672, 1, 0, 0, 1, 1,
0.4747588, 1.005875, 0.1111622, 0, 0, 0, 1, 1,
0.4815503, 0.2142446, 0.8228226, 0, 0, 0, 1, 1,
0.4870189, 0.5981063, -0.4421587, 0, 0, 0, 1, 1,
0.4924648, -0.7442447, 2.955593, 0, 0, 0, 1, 1,
0.4927872, 0.2660747, 0.6639056, 0, 0, 0, 1, 1,
0.4959113, -0.09609993, 1.175729, 0, 0, 0, 1, 1,
0.4967047, -0.5107589, 2.120695, 0, 0, 0, 1, 1,
0.5012744, -0.6741439, 2.932325, 1, 1, 1, 1, 1,
0.5100141, -0.8446527, 2.330555, 1, 1, 1, 1, 1,
0.5103789, 0.2599254, 0.7079071, 1, 1, 1, 1, 1,
0.5142148, 2.081042, -0.7767579, 1, 1, 1, 1, 1,
0.5184274, -0.08486121, 1.899058, 1, 1, 1, 1, 1,
0.525781, -1.477423, 1.554394, 1, 1, 1, 1, 1,
0.5274577, -0.873526, 1.611191, 1, 1, 1, 1, 1,
0.527719, 0.3067686, -0.3918023, 1, 1, 1, 1, 1,
0.533995, 0.08266249, 3.354003, 1, 1, 1, 1, 1,
0.5376438, 0.6875871, 0.7039459, 1, 1, 1, 1, 1,
0.5376822, -0.5139644, 2.728947, 1, 1, 1, 1, 1,
0.5422456, 0.3350537, 0.6280249, 1, 1, 1, 1, 1,
0.5423755, -0.4198996, 1.149508, 1, 1, 1, 1, 1,
0.5438837, 0.08504101, 0.8959417, 1, 1, 1, 1, 1,
0.5457691, 0.3151912, 1.677063, 1, 1, 1, 1, 1,
0.549462, -1.328715, 1.839408, 0, 0, 1, 1, 1,
0.5506244, 0.4283078, 2.341257, 1, 0, 0, 1, 1,
0.5508707, -1.861718, 1.885637, 1, 0, 0, 1, 1,
0.5526983, -0.4680288, 2.214668, 1, 0, 0, 1, 1,
0.5630396, 0.8046513, 0.6980218, 1, 0, 0, 1, 1,
0.5646657, 0.3488595, 1.822057, 1, 0, 0, 1, 1,
0.5647233, -0.02460161, 1.564604, 0, 0, 0, 1, 1,
0.5662839, -1.680516, 2.91475, 0, 0, 0, 1, 1,
0.5724082, -0.297554, 2.506716, 0, 0, 0, 1, 1,
0.5728618, 1.321766, 0.8367497, 0, 0, 0, 1, 1,
0.5735009, -1.002076, 3.028971, 0, 0, 0, 1, 1,
0.5745753, -0.5847396, 1.219773, 0, 0, 0, 1, 1,
0.578088, 1.723962, 0.05430476, 0, 0, 0, 1, 1,
0.5785444, -0.1290942, 0.8418827, 1, 1, 1, 1, 1,
0.5813824, -2.375345, 3.701609, 1, 1, 1, 1, 1,
0.5868585, 0.03943088, -0.1675066, 1, 1, 1, 1, 1,
0.5919834, 0.002805382, 0.4403347, 1, 1, 1, 1, 1,
0.5932499, -1.180418, 2.789815, 1, 1, 1, 1, 1,
0.5950861, -0.6075165, 1.201498, 1, 1, 1, 1, 1,
0.5977724, 0.4568186, -0.2110034, 1, 1, 1, 1, 1,
0.5978407, -0.3718719, 3.513736, 1, 1, 1, 1, 1,
0.6019426, 0.9188215, -0.8377156, 1, 1, 1, 1, 1,
0.6045548, -0.8034619, 2.629616, 1, 1, 1, 1, 1,
0.6054028, 1.408231, 2.017057, 1, 1, 1, 1, 1,
0.6067673, -0.2163731, 0.6977139, 1, 1, 1, 1, 1,
0.6109614, -0.161486, 2.611849, 1, 1, 1, 1, 1,
0.6273885, 0.7409728, 1.856231, 1, 1, 1, 1, 1,
0.6305072, -1.18738, 2.015504, 1, 1, 1, 1, 1,
0.632324, 0.4829217, 1.291712, 0, 0, 1, 1, 1,
0.640383, -1.604204, 2.57875, 1, 0, 0, 1, 1,
0.6418352, 0.271548, -0.1266441, 1, 0, 0, 1, 1,
0.6474813, -0.1884016, 2.462379, 1, 0, 0, 1, 1,
0.6483175, -0.8342984, 1.670495, 1, 0, 0, 1, 1,
0.649654, 0.7467412, 1.099209, 1, 0, 0, 1, 1,
0.658914, -0.1133853, 3.090737, 0, 0, 0, 1, 1,
0.6606616, -0.9449751, 2.926118, 0, 0, 0, 1, 1,
0.6641039, -1.083912, 1.337802, 0, 0, 0, 1, 1,
0.6689176, 1.580231, -0.341353, 0, 0, 0, 1, 1,
0.6692114, -1.112335, 4.313518, 0, 0, 0, 1, 1,
0.6746937, -0.5365388, 2.275448, 0, 0, 0, 1, 1,
0.6748219, 0.7191956, 0.895048, 0, 0, 0, 1, 1,
0.6749502, 0.3822964, 2.145469, 1, 1, 1, 1, 1,
0.6758764, 0.8702408, 0.8175467, 1, 1, 1, 1, 1,
0.6811525, 0.7782986, -0.8855828, 1, 1, 1, 1, 1,
0.6817997, -1.045444, 2.548011, 1, 1, 1, 1, 1,
0.6837342, 1.427533, 0.1517244, 1, 1, 1, 1, 1,
0.6895664, 0.196156, 1.896168, 1, 1, 1, 1, 1,
0.6914815, 1.159477, 1.529666, 1, 1, 1, 1, 1,
0.6956481, -1.822969, 2.060566, 1, 1, 1, 1, 1,
0.7022588, 0.433547, 2.600043, 1, 1, 1, 1, 1,
0.7046527, 0.05456791, 0.535065, 1, 1, 1, 1, 1,
0.7065777, 1.890016, 0.4352743, 1, 1, 1, 1, 1,
0.7071126, -0.1864883, 0.9826265, 1, 1, 1, 1, 1,
0.7074586, -0.2567479, 0.5226712, 1, 1, 1, 1, 1,
0.7079831, 0.5207003, 0.1582949, 1, 1, 1, 1, 1,
0.7119056, -1.045301, 3.167259, 1, 1, 1, 1, 1,
0.7143439, 2.136833, 0.2062111, 0, 0, 1, 1, 1,
0.7145356, -1.202205, 2.33724, 1, 0, 0, 1, 1,
0.7146873, 1.832489, 1.027703, 1, 0, 0, 1, 1,
0.7156446, -1.535987, 2.752862, 1, 0, 0, 1, 1,
0.7164469, -0.3437595, 1.538361, 1, 0, 0, 1, 1,
0.7164959, 0.4018961, 2.90821, 1, 0, 0, 1, 1,
0.7178847, 0.1878421, 0.5612527, 0, 0, 0, 1, 1,
0.7272933, -0.9345163, 2.110059, 0, 0, 0, 1, 1,
0.7293382, 0.3761455, 2.828644, 0, 0, 0, 1, 1,
0.7297647, 1.201084, 1.326342, 0, 0, 0, 1, 1,
0.7382153, -0.8769671, 2.867134, 0, 0, 0, 1, 1,
0.7383474, -1.446429, 1.436649, 0, 0, 0, 1, 1,
0.7412332, -1.505776, 2.136289, 0, 0, 0, 1, 1,
0.7425392, -0.7697365, 3.772334, 1, 1, 1, 1, 1,
0.7469141, 0.5481864, 0.6496823, 1, 1, 1, 1, 1,
0.7515792, 0.4396795, 0.5464585, 1, 1, 1, 1, 1,
0.7535829, 0.4104356, 0.7620308, 1, 1, 1, 1, 1,
0.7542995, 1.320836, 0.5964556, 1, 1, 1, 1, 1,
0.754789, 0.9330181, 1.105264, 1, 1, 1, 1, 1,
0.7561405, 0.03211489, 2.97461, 1, 1, 1, 1, 1,
0.7581794, -0.2176563, 0.3488099, 1, 1, 1, 1, 1,
0.7601328, -1.269516, 3.646401, 1, 1, 1, 1, 1,
0.7618969, 0.3362515, 0.8851849, 1, 1, 1, 1, 1,
0.7645991, -0.1430877, 1.619098, 1, 1, 1, 1, 1,
0.7721128, -0.4978637, 2.55611, 1, 1, 1, 1, 1,
0.7732, -0.1049724, -0.08256602, 1, 1, 1, 1, 1,
0.7733143, 0.7949584, 1.136443, 1, 1, 1, 1, 1,
0.7756084, -1.189901, 3.029206, 1, 1, 1, 1, 1,
0.7765113, -1.019045, 2.32621, 0, 0, 1, 1, 1,
0.8217616, -0.9495308, 1.55451, 1, 0, 0, 1, 1,
0.8219808, -0.4971515, 2.821634, 1, 0, 0, 1, 1,
0.8222364, 1.151555, 0.1628572, 1, 0, 0, 1, 1,
0.8230587, 0.2575832, 2.199183, 1, 0, 0, 1, 1,
0.8238546, -0.6722832, 1.952121, 1, 0, 0, 1, 1,
0.8258212, 1.297224, 0.4391498, 0, 0, 0, 1, 1,
0.8307357, -2.273542, 1.710612, 0, 0, 0, 1, 1,
0.8331166, 0.01639568, 0.7728689, 0, 0, 0, 1, 1,
0.8382434, 0.7334592, 1.971094, 0, 0, 0, 1, 1,
0.8441975, 0.5980802, 0.03721662, 0, 0, 0, 1, 1,
0.8466025, -1.615562, 2.448436, 0, 0, 0, 1, 1,
0.8484942, 0.2217867, 2.920766, 0, 0, 0, 1, 1,
0.8511518, -0.7749427, 2.112263, 1, 1, 1, 1, 1,
0.8511742, 0.364649, -0.1352, 1, 1, 1, 1, 1,
0.855358, -2.052252, 2.107646, 1, 1, 1, 1, 1,
0.8561249, -0.09264822, 0.5333682, 1, 1, 1, 1, 1,
0.8569838, 1.829386, 0.4409277, 1, 1, 1, 1, 1,
0.856986, -1.62032, 4.470705, 1, 1, 1, 1, 1,
0.8594223, -0.5534386, 1.894952, 1, 1, 1, 1, 1,
0.8642284, 0.8729576, 1.424109, 1, 1, 1, 1, 1,
0.8690344, -0.5570408, 3.233095, 1, 1, 1, 1, 1,
0.8721372, -1.054172, 3.277667, 1, 1, 1, 1, 1,
0.8816025, 0.8514479, -1.367005, 1, 1, 1, 1, 1,
0.8818133, -0.9162683, 2.714279, 1, 1, 1, 1, 1,
0.8880891, 0.4108232, 1.990344, 1, 1, 1, 1, 1,
0.8918139, 0.646467, 1.15818, 1, 1, 1, 1, 1,
0.8974167, -0.9756203, 2.202936, 1, 1, 1, 1, 1,
0.9082524, 2.231404, 0.2088253, 0, 0, 1, 1, 1,
0.9133484, 0.3604524, 1.969736, 1, 0, 0, 1, 1,
0.9140645, -0.007353036, 3.915034, 1, 0, 0, 1, 1,
0.923819, 0.7157847, -0.7038722, 1, 0, 0, 1, 1,
0.9265687, -0.1483618, 2.567213, 1, 0, 0, 1, 1,
0.9382061, 1.084558, -0.166249, 1, 0, 0, 1, 1,
0.9396832, 0.8424143, 0.1941156, 0, 0, 0, 1, 1,
0.9401586, -0.06011366, -0.1183288, 0, 0, 0, 1, 1,
0.9420137, -0.862254, 3.923034, 0, 0, 0, 1, 1,
0.9432356, 2.43565, 0.5657476, 0, 0, 0, 1, 1,
0.9435771, -2.73615, 3.412551, 0, 0, 0, 1, 1,
0.9479207, 0.7456551, -0.1483527, 0, 0, 0, 1, 1,
0.9591522, 0.8987169, -0.4094992, 0, 0, 0, 1, 1,
0.96051, -0.6002496, 2.430379, 1, 1, 1, 1, 1,
0.9622075, -2.360363, 3.628723, 1, 1, 1, 1, 1,
0.9626604, 0.08552784, 0.2337768, 1, 1, 1, 1, 1,
0.9631957, -0.1039855, 1.20225, 1, 1, 1, 1, 1,
0.9663144, 0.7463511, 1.654272, 1, 1, 1, 1, 1,
0.9826483, 1.180038, 0.9369099, 1, 1, 1, 1, 1,
0.986451, -0.6537097, 0.8321135, 1, 1, 1, 1, 1,
0.9884593, -0.4711696, 2.514048, 1, 1, 1, 1, 1,
0.9969359, -0.2939613, 1.917843, 1, 1, 1, 1, 1,
0.9975165, -1.633518, 1.173997, 1, 1, 1, 1, 1,
1.003536, 0.2902319, 0.8794312, 1, 1, 1, 1, 1,
1.005979, 0.8377541, 1.240924, 1, 1, 1, 1, 1,
1.011722, -0.6182272, 1.522506, 1, 1, 1, 1, 1,
1.014663, -1.032525, 4.231883, 1, 1, 1, 1, 1,
1.014847, 1.308499, 1.291096, 1, 1, 1, 1, 1,
1.015893, -1.935485, 2.503662, 0, 0, 1, 1, 1,
1.023498, -0.0688433, 0.9448475, 1, 0, 0, 1, 1,
1.029846, -0.8856702, 3.379555, 1, 0, 0, 1, 1,
1.03214, -2.1945, 2.95918, 1, 0, 0, 1, 1,
1.032281, 0.5263646, 0.656801, 1, 0, 0, 1, 1,
1.035904, -0.1915481, 0.1814785, 1, 0, 0, 1, 1,
1.03666, -0.129519, 1.829334, 0, 0, 0, 1, 1,
1.050047, 0.3784055, -0.06316697, 0, 0, 0, 1, 1,
1.050227, 0.9140517, 0.5111184, 0, 0, 0, 1, 1,
1.052914, 0.9990929, 1.68252, 0, 0, 0, 1, 1,
1.066906, -0.2883103, 0.3017721, 0, 0, 0, 1, 1,
1.074622, 0.7020122, 0.07965977, 0, 0, 0, 1, 1,
1.077587, 1.614421, 2.175793, 0, 0, 0, 1, 1,
1.083539, 0.5887853, 1.615065, 1, 1, 1, 1, 1,
1.088912, -0.1925531, 0.9732048, 1, 1, 1, 1, 1,
1.092025, 0.1174842, 1.150575, 1, 1, 1, 1, 1,
1.105943, 0.4332472, 1.484604, 1, 1, 1, 1, 1,
1.109054, 0.6128634, 0.2929446, 1, 1, 1, 1, 1,
1.115793, -0.07999634, 0.6755081, 1, 1, 1, 1, 1,
1.115968, -0.5829112, 1.217199, 1, 1, 1, 1, 1,
1.122334, -0.6853243, 3.439394, 1, 1, 1, 1, 1,
1.126349, -1.12368, 1.712184, 1, 1, 1, 1, 1,
1.127639, -1.953108, 3.589522, 1, 1, 1, 1, 1,
1.139683, -0.32277, 2.134096, 1, 1, 1, 1, 1,
1.140549, -1.427316, 1.813672, 1, 1, 1, 1, 1,
1.147696, -1.285379, 1.535095, 1, 1, 1, 1, 1,
1.152984, -1.98529, 0.9824772, 1, 1, 1, 1, 1,
1.156764, 0.2978278, 2.306324, 1, 1, 1, 1, 1,
1.176111, -0.3677314, 4.012385, 0, 0, 1, 1, 1,
1.176863, 0.04106991, 0.6884777, 1, 0, 0, 1, 1,
1.190585, 0.6066853, 2.432862, 1, 0, 0, 1, 1,
1.191962, 1.165188, -0.5020206, 1, 0, 0, 1, 1,
1.200295, 0.01879628, 3.412031, 1, 0, 0, 1, 1,
1.203952, -0.106296, 2.472975, 1, 0, 0, 1, 1,
1.205181, 0.09349637, 1.490654, 0, 0, 0, 1, 1,
1.205573, 0.8519559, 1.117123, 0, 0, 0, 1, 1,
1.206437, -0.7859018, 2.743977, 0, 0, 0, 1, 1,
1.230394, 0.4738397, 2.235111, 0, 0, 0, 1, 1,
1.232352, 0.5693827, 1.741104, 0, 0, 0, 1, 1,
1.232537, 0.5289676, -0.5567507, 0, 0, 0, 1, 1,
1.233068, -1.346132, 2.808698, 0, 0, 0, 1, 1,
1.234989, 1.747355, 1.281904, 1, 1, 1, 1, 1,
1.236611, 1.073634, 0.0536848, 1, 1, 1, 1, 1,
1.241626, -0.8101229, 1.666468, 1, 1, 1, 1, 1,
1.245108, -0.3571759, 0.8781963, 1, 1, 1, 1, 1,
1.248713, 0.1399802, 3.021307, 1, 1, 1, 1, 1,
1.265668, 0.6048145, 0.8452584, 1, 1, 1, 1, 1,
1.268865, -0.2018648, 2.458943, 1, 1, 1, 1, 1,
1.270501, -0.4858122, 1.782098, 1, 1, 1, 1, 1,
1.280818, -0.6196904, 2.851649, 1, 1, 1, 1, 1,
1.287448, -0.8434325, 3.612121, 1, 1, 1, 1, 1,
1.29057, 0.3070844, 1.894697, 1, 1, 1, 1, 1,
1.296429, 0.2958013, 1.916507, 1, 1, 1, 1, 1,
1.303817, 0.5871263, 0.9491756, 1, 1, 1, 1, 1,
1.312272, -0.2542267, 2.284243, 1, 1, 1, 1, 1,
1.319569, 0.4968118, 0.819636, 1, 1, 1, 1, 1,
1.322195, 0.3273204, 1.378566, 0, 0, 1, 1, 1,
1.333168, 1.528764, 0.8659526, 1, 0, 0, 1, 1,
1.333422, 1.681113, -0.1134151, 1, 0, 0, 1, 1,
1.339932, -0.7430391, 0.733686, 1, 0, 0, 1, 1,
1.342469, -1.175002, -0.4647385, 1, 0, 0, 1, 1,
1.349465, -0.1210947, 0.2844127, 1, 0, 0, 1, 1,
1.354097, 0.8688897, -0.04193229, 0, 0, 0, 1, 1,
1.358856, -0.2646886, 0.7209667, 0, 0, 0, 1, 1,
1.363927, 0.0023101, 1.868556, 0, 0, 0, 1, 1,
1.367744, -0.2135397, 1.554956, 0, 0, 0, 1, 1,
1.373396, 0.66289, -0.2980103, 0, 0, 0, 1, 1,
1.37787, -1.408989, 2.025454, 0, 0, 0, 1, 1,
1.378623, -0.5181619, 3.054898, 0, 0, 0, 1, 1,
1.379237, 1.419351, 0.1321998, 1, 1, 1, 1, 1,
1.379653, -0.563804, 3.737114, 1, 1, 1, 1, 1,
1.382566, -1.173306, 1.400755, 1, 1, 1, 1, 1,
1.384616, -0.3434519, 2.765424, 1, 1, 1, 1, 1,
1.395729, -0.7083904, 1.723568, 1, 1, 1, 1, 1,
1.397619, -0.4897642, 1.804278, 1, 1, 1, 1, 1,
1.404781, 0.5510865, 0.9276493, 1, 1, 1, 1, 1,
1.408958, 0.3993077, 2.283808, 1, 1, 1, 1, 1,
1.428248, -0.4176953, 3.210274, 1, 1, 1, 1, 1,
1.431334, 0.5486753, 1.09458, 1, 1, 1, 1, 1,
1.440647, 1.617976, 0.8559564, 1, 1, 1, 1, 1,
1.446704, 1.266603, 0.6454921, 1, 1, 1, 1, 1,
1.449243, -1.091771, 1.985966, 1, 1, 1, 1, 1,
1.455806, -0.827499, 1.571168, 1, 1, 1, 1, 1,
1.455932, -2.041828, 3.822931, 1, 1, 1, 1, 1,
1.468005, 1.378097, 1.215178, 0, 0, 1, 1, 1,
1.469361, -0.609631, 3.5304, 1, 0, 0, 1, 1,
1.471535, -0.4055783, 1.948758, 1, 0, 0, 1, 1,
1.475708, 0.5407965, 1.938819, 1, 0, 0, 1, 1,
1.483295, -0.832328, 1.248446, 1, 0, 0, 1, 1,
1.484251, 0.9391122, 2.213245, 1, 0, 0, 1, 1,
1.488416, -0.03550458, 2.298551, 0, 0, 0, 1, 1,
1.491303, -1.595604, 1.628594, 0, 0, 0, 1, 1,
1.502432, 0.227572, 2.450776, 0, 0, 0, 1, 1,
1.509793, 0.03978754, 1.220992, 0, 0, 0, 1, 1,
1.53124, 0.6727794, 1.186551, 0, 0, 0, 1, 1,
1.533589, -0.6303694, 1.682442, 0, 0, 0, 1, 1,
1.562042, 1.335323, 0.3697358, 0, 0, 0, 1, 1,
1.565173, -1.093171, 0.9499554, 1, 1, 1, 1, 1,
1.574423, -1.407639, 4.672818, 1, 1, 1, 1, 1,
1.591504, 0.3110775, 1.754969, 1, 1, 1, 1, 1,
1.607415, -0.9854175, 2.472435, 1, 1, 1, 1, 1,
1.609243, -1.1925, 1.411602, 1, 1, 1, 1, 1,
1.612222, 0.6181996, 1.240942, 1, 1, 1, 1, 1,
1.617381, -1.569732, 2.929976, 1, 1, 1, 1, 1,
1.642226, -1.335356, 4.30779, 1, 1, 1, 1, 1,
1.645593, -0.9447761, 1.904293, 1, 1, 1, 1, 1,
1.678631, -1.40345, 1.600833, 1, 1, 1, 1, 1,
1.680407, -1.322971, 1.493107, 1, 1, 1, 1, 1,
1.680581, -0.9994642, 2.542235, 1, 1, 1, 1, 1,
1.681393, -1.298192, 1.567414, 1, 1, 1, 1, 1,
1.681834, 1.893975, 1.012916, 1, 1, 1, 1, 1,
1.687482, -0.1408544, 1.686606, 1, 1, 1, 1, 1,
1.690762, -0.7204016, 1.569634, 0, 0, 1, 1, 1,
1.717534, -1.320313, 1.677374, 1, 0, 0, 1, 1,
1.72903, -0.4955025, 1.196871, 1, 0, 0, 1, 1,
1.732759, -0.4114478, 1.427458, 1, 0, 0, 1, 1,
1.735986, -0.07314749, 2.159601, 1, 0, 0, 1, 1,
1.736339, -1.206046, 0.9696962, 1, 0, 0, 1, 1,
1.739039, -0.7208282, 4.224411, 0, 0, 0, 1, 1,
1.742963, -0.03787094, 0.7751994, 0, 0, 0, 1, 1,
1.745423, 1.188182, 2.447153, 0, 0, 0, 1, 1,
1.753119, -1.637324, 1.283525, 0, 0, 0, 1, 1,
1.776746, 0.6211984, -0.9089912, 0, 0, 0, 1, 1,
1.79228, -0.2367838, 2.539185, 0, 0, 0, 1, 1,
1.794393, -0.2509951, 1.207506, 0, 0, 0, 1, 1,
1.807211, 0.3862601, 0.9467884, 1, 1, 1, 1, 1,
1.810024, -0.5256808, 1.11383, 1, 1, 1, 1, 1,
1.836168, 0.4018637, 1.182483, 1, 1, 1, 1, 1,
1.836262, 0.8398874, 1.213619, 1, 1, 1, 1, 1,
1.857879, 1.315333, 1.76221, 1, 1, 1, 1, 1,
1.898454, 1.100571, -0.1087278, 1, 1, 1, 1, 1,
1.922384, -0.8421111, 2.094117, 1, 1, 1, 1, 1,
1.925819, 0.5959574, 1.544824, 1, 1, 1, 1, 1,
1.929582, 1.103703, 1.038367, 1, 1, 1, 1, 1,
1.93352, -0.6558969, 1.212485, 1, 1, 1, 1, 1,
1.93369, 0.8109395, 0.5865893, 1, 1, 1, 1, 1,
1.959292, 1.715742, -1.183752, 1, 1, 1, 1, 1,
1.975625, 1.25403, -0.07849922, 1, 1, 1, 1, 1,
2.033663, -0.193823, 1.234313, 1, 1, 1, 1, 1,
2.067755, 0.01492508, 1.500994, 1, 1, 1, 1, 1,
2.134408, 0.9423831, 0.8648315, 0, 0, 1, 1, 1,
2.136667, -0.9992038, -0.02342287, 1, 0, 0, 1, 1,
2.146817, 0.5006343, 1.394573, 1, 0, 0, 1, 1,
2.153433, -0.2936917, 3.078296, 1, 0, 0, 1, 1,
2.198496, -0.2915613, 1.038016, 1, 0, 0, 1, 1,
2.226502, -0.5334713, 3.245358, 1, 0, 0, 1, 1,
2.239181, -0.8391572, 2.060546, 0, 0, 0, 1, 1,
2.247068, -0.0261846, 2.480496, 0, 0, 0, 1, 1,
2.365028, 0.8003436, 2.746946, 0, 0, 0, 1, 1,
2.424678, -0.5779198, 3.359551, 0, 0, 0, 1, 1,
2.500236, -0.3143793, 1.559845, 0, 0, 0, 1, 1,
2.522201, -0.4901022, 2.033271, 0, 0, 0, 1, 1,
2.567855, 0.831942, 1.534408, 0, 0, 0, 1, 1,
2.691776, 1.069607, 0.6437649, 1, 1, 1, 1, 1,
2.696132, 0.3796121, 0.8394589, 1, 1, 1, 1, 1,
2.736378, 0.1112258, 0.2596071, 1, 1, 1, 1, 1,
2.763447, -0.5954615, 0.8817195, 1, 1, 1, 1, 1,
2.897536, -0.2083538, 2.582566, 1, 1, 1, 1, 1,
2.946186, -0.2419829, 1.516295, 1, 1, 1, 1, 1,
2.996044, 2.056477, 0.4069171, 1, 1, 1, 1, 1
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
var radius = 9.468547;
var distance = 33.25787;
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
mvMatrix.translate( 0.1525661, 0.1047344, 0.6033561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.25787);
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
