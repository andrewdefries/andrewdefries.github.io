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
-2.901106, 0.01069425, -0.6008178, 1, 0, 0, 1,
-2.808995, 0.1914152, -0.3194648, 1, 0.007843138, 0, 1,
-2.684387, 1.36449, -1.761438, 1, 0.01176471, 0, 1,
-2.633722, -2.039836, -1.684923, 1, 0.01960784, 0, 1,
-2.633393, 1.649164, -0.01245731, 1, 0.02352941, 0, 1,
-2.539137, -0.02834066, -0.4038044, 1, 0.03137255, 0, 1,
-2.477076, -1.209132, -3.597749, 1, 0.03529412, 0, 1,
-2.43403, -1.553007, -2.890077, 1, 0.04313726, 0, 1,
-2.350089, 1.506999, -1.822413, 1, 0.04705882, 0, 1,
-2.319378, 0.01844274, -2.372109, 1, 0.05490196, 0, 1,
-2.310023, 0.05958571, -1.290881, 1, 0.05882353, 0, 1,
-2.288561, 0.1670944, -1.952464, 1, 0.06666667, 0, 1,
-2.27185, -0.5634338, -3.425322, 1, 0.07058824, 0, 1,
-2.249505, 0.2058841, -0.8200673, 1, 0.07843138, 0, 1,
-2.228532, 0.01822814, -1.036851, 1, 0.08235294, 0, 1,
-2.20671, 0.2057326, -0.4880055, 1, 0.09019608, 0, 1,
-2.191791, 0.1349916, -3.109547, 1, 0.09411765, 0, 1,
-2.188631, 0.1815002, -1.157951, 1, 0.1019608, 0, 1,
-2.172999, 1.416573, 0.2657292, 1, 0.1098039, 0, 1,
-2.162168, -0.9622529, -1.964051, 1, 0.1137255, 0, 1,
-2.104755, 0.04957613, -1.800488, 1, 0.1215686, 0, 1,
-2.092584, -0.9170042, -3.205145, 1, 0.1254902, 0, 1,
-2.082393, -0.9017698, 0.5458864, 1, 0.1333333, 0, 1,
-2.081252, 1.269033, -2.054529, 1, 0.1372549, 0, 1,
-2.053849, -0.4001087, -0.5522592, 1, 0.145098, 0, 1,
-2.02035, 1.472798, 0.01661259, 1, 0.1490196, 0, 1,
-1.938356, -1.214953, -2.703738, 1, 0.1568628, 0, 1,
-1.892153, 0.08659708, -2.265251, 1, 0.1607843, 0, 1,
-1.890493, 0.2283776, -1.081744, 1, 0.1686275, 0, 1,
-1.887415, 0.6991935, -0.8122756, 1, 0.172549, 0, 1,
-1.882991, 0.7995661, -1.271012, 1, 0.1803922, 0, 1,
-1.881117, 0.3987537, -0.5112185, 1, 0.1843137, 0, 1,
-1.880696, 0.4624693, -1.840158, 1, 0.1921569, 0, 1,
-1.84589, -0.579824, -1.286545, 1, 0.1960784, 0, 1,
-1.817275, 0.5127846, -2.246433, 1, 0.2039216, 0, 1,
-1.809452, -0.5034977, -1.099397, 1, 0.2117647, 0, 1,
-1.806043, 0.2227121, -1.670418, 1, 0.2156863, 0, 1,
-1.798369, 1.023441, -1.105091, 1, 0.2235294, 0, 1,
-1.796731, 0.6478236, -0.8363423, 1, 0.227451, 0, 1,
-1.789126, 1.130842, -1.375121, 1, 0.2352941, 0, 1,
-1.771405, 0.5558369, -0.444502, 1, 0.2392157, 0, 1,
-1.770757, -0.3609844, -2.627476, 1, 0.2470588, 0, 1,
-1.759246, 2.681215, 0.707141, 1, 0.2509804, 0, 1,
-1.755719, -0.7062256, -2.452455, 1, 0.2588235, 0, 1,
-1.755284, 0.1819171, -2.05406, 1, 0.2627451, 0, 1,
-1.74493, 1.820195, -1.139364, 1, 0.2705882, 0, 1,
-1.733145, 0.4667805, -0.9850993, 1, 0.2745098, 0, 1,
-1.720054, -0.3074013, -1.34686, 1, 0.282353, 0, 1,
-1.7134, 1.074855, 1.19726, 1, 0.2862745, 0, 1,
-1.710173, 0.1939079, -0.5105975, 1, 0.2941177, 0, 1,
-1.709933, -0.7780336, 0.1243502, 1, 0.3019608, 0, 1,
-1.70054, 1.881093, -1.042294, 1, 0.3058824, 0, 1,
-1.650675, -0.1918858, -0.396013, 1, 0.3137255, 0, 1,
-1.647316, -0.4629853, -0.5506466, 1, 0.3176471, 0, 1,
-1.629513, -0.2668602, -2.849403, 1, 0.3254902, 0, 1,
-1.628798, -1.502835, -3.276986, 1, 0.3294118, 0, 1,
-1.60034, 0.4736626, -0.7693025, 1, 0.3372549, 0, 1,
-1.597968, -0.6389906, -3.526144, 1, 0.3411765, 0, 1,
-1.580619, 1.12137, -0.4694272, 1, 0.3490196, 0, 1,
-1.576064, -0.1772624, -1.493029, 1, 0.3529412, 0, 1,
-1.574274, -0.542558, -2.180851, 1, 0.3607843, 0, 1,
-1.547485, -0.214692, -1.301488, 1, 0.3647059, 0, 1,
-1.532693, 0.5044535, -1.598937, 1, 0.372549, 0, 1,
-1.522788, 1.028717, 0.2907835, 1, 0.3764706, 0, 1,
-1.516147, 0.8924018, 0.3963458, 1, 0.3843137, 0, 1,
-1.502964, -0.1654706, -1.568813, 1, 0.3882353, 0, 1,
-1.500204, 0.6966412, -0.2089754, 1, 0.3960784, 0, 1,
-1.494513, -0.6248223, -2.448436, 1, 0.4039216, 0, 1,
-1.481416, -0.03494623, -0.6272579, 1, 0.4078431, 0, 1,
-1.479425, -0.01324333, -1.304319, 1, 0.4156863, 0, 1,
-1.455006, -0.1597781, -0.9285333, 1, 0.4196078, 0, 1,
-1.453717, -2.202167, -1.084765, 1, 0.427451, 0, 1,
-1.447209, -0.327703, -2.530299, 1, 0.4313726, 0, 1,
-1.445951, 0.1167114, -0.7586142, 1, 0.4392157, 0, 1,
-1.444446, -0.9642292, -2.203721, 1, 0.4431373, 0, 1,
-1.443812, -1.389123, -2.854198, 1, 0.4509804, 0, 1,
-1.418597, 0.3310523, -0.4314436, 1, 0.454902, 0, 1,
-1.414054, -1.045042, -3.951041, 1, 0.4627451, 0, 1,
-1.409393, 1.397803, -0.7471702, 1, 0.4666667, 0, 1,
-1.408364, 1.201702, 0.7124442, 1, 0.4745098, 0, 1,
-1.402414, 0.2175194, -2.351206, 1, 0.4784314, 0, 1,
-1.395465, 0.2149069, 0.4585692, 1, 0.4862745, 0, 1,
-1.395451, -0.5160187, -1.280258, 1, 0.4901961, 0, 1,
-1.378998, -0.5080295, -1.955498, 1, 0.4980392, 0, 1,
-1.375536, 0.6476473, -0.419909, 1, 0.5058824, 0, 1,
-1.373981, 0.04807929, -0.2152461, 1, 0.509804, 0, 1,
-1.371983, 0.0222108, -1.690129, 1, 0.5176471, 0, 1,
-1.365703, -0.07255851, -3.209448, 1, 0.5215687, 0, 1,
-1.36286, 1.418089, 0.3010028, 1, 0.5294118, 0, 1,
-1.362015, -1.628247, -1.93685, 1, 0.5333334, 0, 1,
-1.358596, 1.288209, 0.01316905, 1, 0.5411765, 0, 1,
-1.357774, -1.648566, -2.603273, 1, 0.5450981, 0, 1,
-1.352421, -0.6869618, -1.020572, 1, 0.5529412, 0, 1,
-1.346169, -0.4351945, -2.480316, 1, 0.5568628, 0, 1,
-1.344999, -0.3251365, -1.327572, 1, 0.5647059, 0, 1,
-1.342461, -0.07678548, -1.328964, 1, 0.5686275, 0, 1,
-1.340091, 0.1656367, -0.8560701, 1, 0.5764706, 0, 1,
-1.337378, 0.4450123, -0.9712397, 1, 0.5803922, 0, 1,
-1.332757, -2.745137, -4.428455, 1, 0.5882353, 0, 1,
-1.332505, -1.661659, -1.333623, 1, 0.5921569, 0, 1,
-1.327372, -0.1774072, -1.283378, 1, 0.6, 0, 1,
-1.319575, 0.1668135, -2.264608, 1, 0.6078432, 0, 1,
-1.317632, -0.8843246, -3.262345, 1, 0.6117647, 0, 1,
-1.310982, 0.2149582, -1.794412, 1, 0.6196079, 0, 1,
-1.298722, 0.6282363, -1.949554, 1, 0.6235294, 0, 1,
-1.296183, 0.3982584, -1.849249, 1, 0.6313726, 0, 1,
-1.292331, -1.494063, -4.283277, 1, 0.6352941, 0, 1,
-1.291423, 0.2658621, -0.9925599, 1, 0.6431373, 0, 1,
-1.283257, -0.1107719, -2.30035, 1, 0.6470588, 0, 1,
-1.280615, -0.3287758, -2.198079, 1, 0.654902, 0, 1,
-1.267299, -2.6491, -1.844463, 1, 0.6588235, 0, 1,
-1.266504, 0.133352, -0.1302498, 1, 0.6666667, 0, 1,
-1.257872, 1.293928, -1.530354, 1, 0.6705883, 0, 1,
-1.242969, -0.0812393, -1.795894, 1, 0.6784314, 0, 1,
-1.240698, 0.9960936, -1.304548, 1, 0.682353, 0, 1,
-1.236954, 0.02347195, -0.02051532, 1, 0.6901961, 0, 1,
-1.235243, -0.3238202, -1.742064, 1, 0.6941177, 0, 1,
-1.232111, 0.7286088, -2.583356, 1, 0.7019608, 0, 1,
-1.224946, -0.1948078, -0.3357892, 1, 0.7098039, 0, 1,
-1.223078, -0.4465141, -0.9214646, 1, 0.7137255, 0, 1,
-1.219041, -0.6104246, -4.000354, 1, 0.7215686, 0, 1,
-1.194195, 0.4589178, -1.826415, 1, 0.7254902, 0, 1,
-1.188244, 0.01476577, -2.730536, 1, 0.7333333, 0, 1,
-1.187301, 1.220315, -0.345974, 1, 0.7372549, 0, 1,
-1.18628, -0.2718217, -0.292206, 1, 0.7450981, 0, 1,
-1.184125, 0.18674, -1.531104, 1, 0.7490196, 0, 1,
-1.166707, 0.07139288, -1.721196, 1, 0.7568628, 0, 1,
-1.157308, -0.1975071, -0.4347236, 1, 0.7607843, 0, 1,
-1.155108, -0.6940015, -2.310989, 1, 0.7686275, 0, 1,
-1.15136, -0.3225571, -1.35307, 1, 0.772549, 0, 1,
-1.146142, -1.541675, -3.314191, 1, 0.7803922, 0, 1,
-1.143296, -1.271732, -2.102768, 1, 0.7843137, 0, 1,
-1.140372, 1.245226, -1.133885, 1, 0.7921569, 0, 1,
-1.139028, -0.5662536, -1.591099, 1, 0.7960784, 0, 1,
-1.136963, 0.6740062, -2.252661, 1, 0.8039216, 0, 1,
-1.132519, 1.632219, -0.9916182, 1, 0.8117647, 0, 1,
-1.124178, 1.892136, -0.2627785, 1, 0.8156863, 0, 1,
-1.122991, 0.9650558, -1.112762, 1, 0.8235294, 0, 1,
-1.113656, -0.3285228, -0.3519463, 1, 0.827451, 0, 1,
-1.112541, 0.08963197, -2.346024, 1, 0.8352941, 0, 1,
-1.107172, -0.6845963, -1.220359, 1, 0.8392157, 0, 1,
-1.106557, 0.6423069, -1.80789, 1, 0.8470588, 0, 1,
-1.093979, 1.345515, 1.440733, 1, 0.8509804, 0, 1,
-1.084263, -1.620495, -1.443873, 1, 0.8588235, 0, 1,
-1.08079, 0.2518203, 0.1297021, 1, 0.8627451, 0, 1,
-1.080464, -0.7945908, -3.754396, 1, 0.8705882, 0, 1,
-1.071034, 1.673094, -1.59443, 1, 0.8745098, 0, 1,
-1.065348, -0.3819956, -2.691166, 1, 0.8823529, 0, 1,
-1.063257, 0.5442134, -0.711359, 1, 0.8862745, 0, 1,
-1.060928, 1.41148, -2.808345, 1, 0.8941177, 0, 1,
-1.052304, 0.9324316, 1.006758, 1, 0.8980392, 0, 1,
-1.051906, 0.4937695, 1.076969, 1, 0.9058824, 0, 1,
-1.046917, -0.4269885, -4.067821, 1, 0.9137255, 0, 1,
-1.04317, 1.311509, -1.571972, 1, 0.9176471, 0, 1,
-1.043028, 0.223533, -2.848654, 1, 0.9254902, 0, 1,
-1.040972, 1.053869, -1.457524, 1, 0.9294118, 0, 1,
-1.040687, -0.887821, -1.229493, 1, 0.9372549, 0, 1,
-1.039088, -0.3172574, -2.114472, 1, 0.9411765, 0, 1,
-1.024768, 0.3041307, -0.716463, 1, 0.9490196, 0, 1,
-1.016183, -0.06118471, -1.87827, 1, 0.9529412, 0, 1,
-1.014266, -0.07653797, -0.6648892, 1, 0.9607843, 0, 1,
-1.011525, 0.05431714, -2.839093, 1, 0.9647059, 0, 1,
-1.010977, -0.2694986, -4.133279, 1, 0.972549, 0, 1,
-1.006441, 0.6878701, -1.40282, 1, 0.9764706, 0, 1,
-1.00146, 0.6994267, -0.5100351, 1, 0.9843137, 0, 1,
-0.998226, -0.1509255, -2.397576, 1, 0.9882353, 0, 1,
-0.9937499, -0.5164496, -0.4485371, 1, 0.9960784, 0, 1,
-0.9910509, 1.158807, -0.5577804, 0.9960784, 1, 0, 1,
-0.9885349, -0.2740601, -1.764141, 0.9921569, 1, 0, 1,
-0.9703939, -0.9160969, -1.405358, 0.9843137, 1, 0, 1,
-0.9586717, 1.274545, 0.4271524, 0.9803922, 1, 0, 1,
-0.9507816, 0.3658493, -2.847221, 0.972549, 1, 0, 1,
-0.9386195, 0.2212501, -0.7013412, 0.9686275, 1, 0, 1,
-0.9378194, -0.7269186, -1.841398, 0.9607843, 1, 0, 1,
-0.9365391, 0.1596391, -1.566452, 0.9568627, 1, 0, 1,
-0.9319693, 1.240279, -1.626268, 0.9490196, 1, 0, 1,
-0.9286965, -0.1691736, -1.236834, 0.945098, 1, 0, 1,
-0.925043, -1.090492, -2.155312, 0.9372549, 1, 0, 1,
-0.9220938, 0.3803741, -2.288281, 0.9333333, 1, 0, 1,
-0.9186273, 0.9123436, -1.037913, 0.9254902, 1, 0, 1,
-0.9134033, -1.16025, -2.39661, 0.9215686, 1, 0, 1,
-0.9121427, -1.850135, -2.582712, 0.9137255, 1, 0, 1,
-0.9013337, 1.103307, -2.147671, 0.9098039, 1, 0, 1,
-0.9003476, 0.5129493, -1.005015, 0.9019608, 1, 0, 1,
-0.8921685, 1.103946, -2.30823, 0.8941177, 1, 0, 1,
-0.8867531, 0.7278641, -0.3445946, 0.8901961, 1, 0, 1,
-0.8822263, 0.1798798, -1.218963, 0.8823529, 1, 0, 1,
-0.8745175, 0.2446939, -2.294967, 0.8784314, 1, 0, 1,
-0.8647211, 1.00966, 0.2174725, 0.8705882, 1, 0, 1,
-0.8631256, 0.9770479, -0.07451227, 0.8666667, 1, 0, 1,
-0.8606831, 1.077445, -0.3597729, 0.8588235, 1, 0, 1,
-0.8587193, -1.413913, -4.37018, 0.854902, 1, 0, 1,
-0.8578055, -0.4528403, -3.098873, 0.8470588, 1, 0, 1,
-0.8569757, 1.457717, -0.7091419, 0.8431373, 1, 0, 1,
-0.84957, -0.4840435, -1.64593, 0.8352941, 1, 0, 1,
-0.8446195, 0.3880299, -1.683002, 0.8313726, 1, 0, 1,
-0.8363273, 0.05039462, -1.084814, 0.8235294, 1, 0, 1,
-0.8310527, -1.226037, -2.29464, 0.8196079, 1, 0, 1,
-0.8297625, 0.7586085, -0.9704272, 0.8117647, 1, 0, 1,
-0.827996, 1.3213, -0.8629798, 0.8078431, 1, 0, 1,
-0.8226495, -0.0752469, 0.8220714, 0.8, 1, 0, 1,
-0.8200263, 0.002814737, -0.01199546, 0.7921569, 1, 0, 1,
-0.818427, 0.2431716, -2.886389, 0.7882353, 1, 0, 1,
-0.8162, 0.3318145, -2.036953, 0.7803922, 1, 0, 1,
-0.8107634, 0.3675224, -1.60656, 0.7764706, 1, 0, 1,
-0.8101432, -0.6157321, -3.220186, 0.7686275, 1, 0, 1,
-0.8018533, 0.1242477, -1.491851, 0.7647059, 1, 0, 1,
-0.7999802, -0.08842286, -3.16966, 0.7568628, 1, 0, 1,
-0.7938434, -0.7170969, -3.248039, 0.7529412, 1, 0, 1,
-0.7933547, 0.2567802, -1.322425, 0.7450981, 1, 0, 1,
-0.7811086, -0.1140227, -2.355613, 0.7411765, 1, 0, 1,
-0.7756414, -1.255837, -2.457046, 0.7333333, 1, 0, 1,
-0.7742497, 0.2880233, -1.788675, 0.7294118, 1, 0, 1,
-0.7727687, -0.9171447, -3.06456, 0.7215686, 1, 0, 1,
-0.7684885, -0.07335228, -0.8383319, 0.7176471, 1, 0, 1,
-0.7675131, 0.8291727, -1.236288, 0.7098039, 1, 0, 1,
-0.7661241, -0.3314697, -2.808628, 0.7058824, 1, 0, 1,
-0.7621044, 0.2126871, -1.624511, 0.6980392, 1, 0, 1,
-0.7607428, -0.1291236, 0.6789179, 0.6901961, 1, 0, 1,
-0.7538815, -1.217478, -3.065096, 0.6862745, 1, 0, 1,
-0.7532361, -0.5649185, -2.342953, 0.6784314, 1, 0, 1,
-0.7503535, 0.1597047, -0.9616579, 0.6745098, 1, 0, 1,
-0.7476806, -0.207324, -0.5360097, 0.6666667, 1, 0, 1,
-0.7369844, 2.985699, 0.02989246, 0.6627451, 1, 0, 1,
-0.7298422, -1.818192, -3.079577, 0.654902, 1, 0, 1,
-0.7242826, -0.252515, -0.9112988, 0.6509804, 1, 0, 1,
-0.7215006, -0.6325662, -1.736859, 0.6431373, 1, 0, 1,
-0.7120712, -0.2101665, -2.634073, 0.6392157, 1, 0, 1,
-0.7103089, 1.019093, -0.7547349, 0.6313726, 1, 0, 1,
-0.7101885, 0.7512052, 0.3255606, 0.627451, 1, 0, 1,
-0.7099987, 0.7901897, 0.4705084, 0.6196079, 1, 0, 1,
-0.7073078, 1.871372, 0.7950699, 0.6156863, 1, 0, 1,
-0.6988933, -0.7585778, -2.14212, 0.6078432, 1, 0, 1,
-0.6903692, 0.6662374, -2.421948, 0.6039216, 1, 0, 1,
-0.6889019, 1.509098, 0.08806591, 0.5960785, 1, 0, 1,
-0.6867305, -1.609692, -2.456393, 0.5882353, 1, 0, 1,
-0.6859189, -1.037503, -2.634948, 0.5843138, 1, 0, 1,
-0.6824678, 1.454234, 0.6328201, 0.5764706, 1, 0, 1,
-0.6790621, -0.2420746, -2.845519, 0.572549, 1, 0, 1,
-0.6781226, 1.043744, -1.343446, 0.5647059, 1, 0, 1,
-0.6777627, -0.8321141, -1.538619, 0.5607843, 1, 0, 1,
-0.6765172, -1.552649, -3.460014, 0.5529412, 1, 0, 1,
-0.670708, -0.5106481, -2.258826, 0.5490196, 1, 0, 1,
-0.6656497, 0.9387458, 0.2540178, 0.5411765, 1, 0, 1,
-0.6634364, 2.001304, -1.580412, 0.5372549, 1, 0, 1,
-0.6633571, 0.6526082, -2.116376, 0.5294118, 1, 0, 1,
-0.6632915, 0.2472038, -1.214687, 0.5254902, 1, 0, 1,
-0.6626241, -0.9482254, -2.240874, 0.5176471, 1, 0, 1,
-0.6479788, -0.3587984, -0.8796909, 0.5137255, 1, 0, 1,
-0.6469531, 1.122339, -0.5905077, 0.5058824, 1, 0, 1,
-0.6434827, 0.4746935, 0.225943, 0.5019608, 1, 0, 1,
-0.6429986, 0.6530301, -1.515765, 0.4941176, 1, 0, 1,
-0.6395782, -0.02665395, -2.433663, 0.4862745, 1, 0, 1,
-0.6380845, 1.210276, -1.080353, 0.4823529, 1, 0, 1,
-0.6361704, -0.7919883, -2.439724, 0.4745098, 1, 0, 1,
-0.6329268, 1.356503, -1.9397, 0.4705882, 1, 0, 1,
-0.6258093, 1.22384, -1.707299, 0.4627451, 1, 0, 1,
-0.6252384, 0.7565932, 0.9933379, 0.4588235, 1, 0, 1,
-0.6246954, 0.9282328, -0.0883429, 0.4509804, 1, 0, 1,
-0.6237575, -1.515619, -2.375338, 0.4470588, 1, 0, 1,
-0.6236322, 0.3479151, -1.928399, 0.4392157, 1, 0, 1,
-0.6177067, 1.678968, 0.08167575, 0.4352941, 1, 0, 1,
-0.6135907, 1.471963, -1.215163, 0.427451, 1, 0, 1,
-0.6121746, -1.057668, -2.786213, 0.4235294, 1, 0, 1,
-0.6108835, 0.4643757, -1.463076, 0.4156863, 1, 0, 1,
-0.6107368, -0.3128175, -3.535283, 0.4117647, 1, 0, 1,
-0.6072975, -0.6151616, -3.076885, 0.4039216, 1, 0, 1,
-0.6062359, -0.1942013, -2.730698, 0.3960784, 1, 0, 1,
-0.6060424, -0.6663037, -2.550903, 0.3921569, 1, 0, 1,
-0.602254, -0.6879718, -1.83591, 0.3843137, 1, 0, 1,
-0.6017852, -2.215658, -3.389364, 0.3803922, 1, 0, 1,
-0.6013745, -0.02126318, -2.577187, 0.372549, 1, 0, 1,
-0.6008719, 0.305419, -3.142851, 0.3686275, 1, 0, 1,
-0.59736, -0.7027518, -2.164601, 0.3607843, 1, 0, 1,
-0.593522, -0.4844396, -1.49609, 0.3568628, 1, 0, 1,
-0.5927187, -0.3361261, -3.190003, 0.3490196, 1, 0, 1,
-0.5907942, 0.06153077, -2.786399, 0.345098, 1, 0, 1,
-0.5904378, 0.4257303, -0.6340159, 0.3372549, 1, 0, 1,
-0.5895853, 0.2736687, -0.553426, 0.3333333, 1, 0, 1,
-0.5840409, 0.8400136, -1.236136, 0.3254902, 1, 0, 1,
-0.580565, 0.7726614, 0.07811916, 0.3215686, 1, 0, 1,
-0.5804136, -1.199672, -3.67642, 0.3137255, 1, 0, 1,
-0.5802261, 0.0856823, -2.799334, 0.3098039, 1, 0, 1,
-0.57824, -0.2967607, -1.953335, 0.3019608, 1, 0, 1,
-0.5766185, 1.077497, -0.9833311, 0.2941177, 1, 0, 1,
-0.5759299, -0.5321755, -2.432702, 0.2901961, 1, 0, 1,
-0.5754324, -2.417405, -2.934812, 0.282353, 1, 0, 1,
-0.5733925, 1.333575, 0.8190868, 0.2784314, 1, 0, 1,
-0.5719584, -1.715029, -1.278698, 0.2705882, 1, 0, 1,
-0.5685803, 0.3240844, -1.322154, 0.2666667, 1, 0, 1,
-0.5652307, -0.427889, -2.068243, 0.2588235, 1, 0, 1,
-0.5621006, 1.542117, 2.031338, 0.254902, 1, 0, 1,
-0.560199, 2.177953, -2.24462, 0.2470588, 1, 0, 1,
-0.554041, 0.2683574, -1.093388, 0.2431373, 1, 0, 1,
-0.5516584, 0.06382637, -2.007198, 0.2352941, 1, 0, 1,
-0.5513462, 0.2347728, -0.9227102, 0.2313726, 1, 0, 1,
-0.5504884, 0.7455015, -1.857499, 0.2235294, 1, 0, 1,
-0.5492015, -0.8397835, -3.921884, 0.2196078, 1, 0, 1,
-0.5489153, -0.3378075, -3.687748, 0.2117647, 1, 0, 1,
-0.548327, 0.05595929, 0.3340761, 0.2078431, 1, 0, 1,
-0.5475864, -0.07457139, -1.635554, 0.2, 1, 0, 1,
-0.5429944, -0.001116377, -2.927536, 0.1921569, 1, 0, 1,
-0.5408019, 0.2687846, -1.173695, 0.1882353, 1, 0, 1,
-0.5393276, -1.040152, -2.205465, 0.1803922, 1, 0, 1,
-0.5383259, -0.214004, -2.288301, 0.1764706, 1, 0, 1,
-0.533523, 0.2150526, -0.6360779, 0.1686275, 1, 0, 1,
-0.5292255, 0.3679865, -0.1489018, 0.1647059, 1, 0, 1,
-0.5197827, 1.528584, 0.3432764, 0.1568628, 1, 0, 1,
-0.5197179, -2.188507, -1.34551, 0.1529412, 1, 0, 1,
-0.5182265, -0.5644307, -0.787777, 0.145098, 1, 0, 1,
-0.5039852, 0.0877373, 0.7385365, 0.1411765, 1, 0, 1,
-0.5038049, 0.1668507, -1.001432, 0.1333333, 1, 0, 1,
-0.5003101, -0.6013939, -2.70995, 0.1294118, 1, 0, 1,
-0.4990613, 1.200731, -1.131416, 0.1215686, 1, 0, 1,
-0.4944917, 0.2087862, -1.609723, 0.1176471, 1, 0, 1,
-0.4942184, -1.206017, -3.359352, 0.1098039, 1, 0, 1,
-0.4915533, -0.3894438, -2.054556, 0.1058824, 1, 0, 1,
-0.4875169, 0.584496, -0.5874387, 0.09803922, 1, 0, 1,
-0.486557, 1.520733, -0.2783805, 0.09019608, 1, 0, 1,
-0.4860165, 0.2809778, -1.786573, 0.08627451, 1, 0, 1,
-0.4727295, -0.2340133, -2.061655, 0.07843138, 1, 0, 1,
-0.4712734, -1.71294, -1.528646, 0.07450981, 1, 0, 1,
-0.4698055, -0.1381946, -1.60021, 0.06666667, 1, 0, 1,
-0.4697976, -1.394191, -4.076289, 0.0627451, 1, 0, 1,
-0.4676532, 1.010448, -1.084329, 0.05490196, 1, 0, 1,
-0.4674793, 0.1183169, -2.637532, 0.05098039, 1, 0, 1,
-0.4634534, -0.5963051, -2.525213, 0.04313726, 1, 0, 1,
-0.4569224, 0.9213321, 1.130107, 0.03921569, 1, 0, 1,
-0.4505877, 1.561978, -0.4199576, 0.03137255, 1, 0, 1,
-0.449791, 0.727882, 1.155958, 0.02745098, 1, 0, 1,
-0.4496154, 0.009975487, -1.949276, 0.01960784, 1, 0, 1,
-0.4488983, -1.535586, -3.746435, 0.01568628, 1, 0, 1,
-0.4488415, -1.309904, -3.590257, 0.007843138, 1, 0, 1,
-0.4469298, 0.5028065, -2.100938, 0.003921569, 1, 0, 1,
-0.4395774, 0.875304, -0.9635985, 0, 1, 0.003921569, 1,
-0.4380091, 0.01429998, -1.225446, 0, 1, 0.01176471, 1,
-0.437509, 0.7244707, -0.2516122, 0, 1, 0.01568628, 1,
-0.4323932, 0.1627787, -0.2561337, 0, 1, 0.02352941, 1,
-0.4319691, 0.1710983, -0.5648509, 0, 1, 0.02745098, 1,
-0.4316085, 0.4582866, -0.6228031, 0, 1, 0.03529412, 1,
-0.4299733, 0.3783173, -1.859667, 0, 1, 0.03921569, 1,
-0.4265658, 0.4024048, 0.0501051, 0, 1, 0.04705882, 1,
-0.4256991, -2.08851, -2.549463, 0, 1, 0.05098039, 1,
-0.4243732, -0.5183924, -0.4941199, 0, 1, 0.05882353, 1,
-0.4240089, -0.1047726, -2.689731, 0, 1, 0.0627451, 1,
-0.4229266, -2.737504, -2.383627, 0, 1, 0.07058824, 1,
-0.4228583, 0.6818846, 0.5039878, 0, 1, 0.07450981, 1,
-0.4171097, 0.5635309, -0.8547954, 0, 1, 0.08235294, 1,
-0.415471, -0.899672, -3.187447, 0, 1, 0.08627451, 1,
-0.4137616, -1.368114, -4.156555, 0, 1, 0.09411765, 1,
-0.4086315, 0.6415286, -1.194643, 0, 1, 0.1019608, 1,
-0.4078365, -0.4839576, -3.694119, 0, 1, 0.1058824, 1,
-0.4069959, 0.6521707, -0.7237917, 0, 1, 0.1137255, 1,
-0.4057722, 0.8925272, 1.603757, 0, 1, 0.1176471, 1,
-0.405228, 0.2634353, -0.8125696, 0, 1, 0.1254902, 1,
-0.4040517, -0.8403264, -1.748094, 0, 1, 0.1294118, 1,
-0.3992377, -0.1641336, -1.029119, 0, 1, 0.1372549, 1,
-0.3945141, -0.7587258, -0.8751362, 0, 1, 0.1411765, 1,
-0.393258, 1.244448, 0.07094457, 0, 1, 0.1490196, 1,
-0.3919899, -0.6252491, -3.212126, 0, 1, 0.1529412, 1,
-0.3830698, 1.196243, -0.4253232, 0, 1, 0.1607843, 1,
-0.3824256, -1.227873, -1.803699, 0, 1, 0.1647059, 1,
-0.3781162, 0.2582592, -1.666965, 0, 1, 0.172549, 1,
-0.3679412, -0.08768573, -2.000233, 0, 1, 0.1764706, 1,
-0.3643416, 0.7702852, -1.230732, 0, 1, 0.1843137, 1,
-0.3640549, 1.526595, -0.3861304, 0, 1, 0.1882353, 1,
-0.3625118, 1.728835, -0.8650765, 0, 1, 0.1960784, 1,
-0.3604414, -1.622621, -2.12302, 0, 1, 0.2039216, 1,
-0.3597769, 0.8246657, -0.5782532, 0, 1, 0.2078431, 1,
-0.3593821, -2.076952, -3.437082, 0, 1, 0.2156863, 1,
-0.3558723, 0.8848783, -0.08064405, 0, 1, 0.2196078, 1,
-0.349958, -0.5744855, -2.636653, 0, 1, 0.227451, 1,
-0.349209, -0.635971, -1.930547, 0, 1, 0.2313726, 1,
-0.3447935, 0.08253276, -0.6628686, 0, 1, 0.2392157, 1,
-0.3440749, -1.36108, -1.318045, 0, 1, 0.2431373, 1,
-0.3439593, 0.687977, -0.4438786, 0, 1, 0.2509804, 1,
-0.3317006, 2.167948, -0.1359492, 0, 1, 0.254902, 1,
-0.3314939, -1.704645, -3.056607, 0, 1, 0.2627451, 1,
-0.330699, -1.47036, -4.003846, 0, 1, 0.2666667, 1,
-0.3305946, 2.411643, -0.6747444, 0, 1, 0.2745098, 1,
-0.3262828, -0.3843592, -2.278677, 0, 1, 0.2784314, 1,
-0.3135013, -1.469545, -3.175097, 0, 1, 0.2862745, 1,
-0.3127084, 0.8117499, -1.392568, 0, 1, 0.2901961, 1,
-0.309072, 0.5479064, 0.5017214, 0, 1, 0.2980392, 1,
-0.304223, 0.7205567, -0.5770127, 0, 1, 0.3058824, 1,
-0.2994543, 1.660008, 0.5218294, 0, 1, 0.3098039, 1,
-0.2963891, 0.278265, -0.3735595, 0, 1, 0.3176471, 1,
-0.2958415, -1.454363, -3.734299, 0, 1, 0.3215686, 1,
-0.2858516, 0.3223788, -0.3928886, 0, 1, 0.3294118, 1,
-0.2855374, -0.5468184, -3.209131, 0, 1, 0.3333333, 1,
-0.281255, -0.8918338, -3.277869, 0, 1, 0.3411765, 1,
-0.2781978, -1.628774, -2.406891, 0, 1, 0.345098, 1,
-0.276266, -0.6734205, -2.592974, 0, 1, 0.3529412, 1,
-0.2758422, 0.06089439, -1.963521, 0, 1, 0.3568628, 1,
-0.2736094, -1.727036, -2.343419, 0, 1, 0.3647059, 1,
-0.2702422, 0.1106164, -1.320051, 0, 1, 0.3686275, 1,
-0.2689728, -1.354604, -3.831632, 0, 1, 0.3764706, 1,
-0.2674279, 0.9423909, 0.1041372, 0, 1, 0.3803922, 1,
-0.2672544, -0.6181147, -3.020954, 0, 1, 0.3882353, 1,
-0.2667368, -0.4767901, -3.660304, 0, 1, 0.3921569, 1,
-0.264712, -1.178997, -3.213614, 0, 1, 0.4, 1,
-0.2590897, -1.717161, -1.542383, 0, 1, 0.4078431, 1,
-0.2585976, -0.1598713, -2.47828, 0, 1, 0.4117647, 1,
-0.2579983, 0.7291862, -0.4974592, 0, 1, 0.4196078, 1,
-0.2577018, 0.03342088, -0.5588836, 0, 1, 0.4235294, 1,
-0.2572581, 0.09738702, -2.746748, 0, 1, 0.4313726, 1,
-0.2558969, -0.2921534, -3.127647, 0, 1, 0.4352941, 1,
-0.2554354, -0.854373, -3.079083, 0, 1, 0.4431373, 1,
-0.2521695, 1.15098, -0.0834956, 0, 1, 0.4470588, 1,
-0.2519532, -1.479645, -5.152743, 0, 1, 0.454902, 1,
-0.2474363, 1.18596, -0.9625049, 0, 1, 0.4588235, 1,
-0.2455772, -2.05679, -2.420661, 0, 1, 0.4666667, 1,
-0.2436935, -1.821937, -2.863742, 0, 1, 0.4705882, 1,
-0.2432827, 1.55378, 0.3191865, 0, 1, 0.4784314, 1,
-0.2395565, -0.5476837, -2.806066, 0, 1, 0.4823529, 1,
-0.2380389, -1.095502, -3.680926, 0, 1, 0.4901961, 1,
-0.2323621, -0.1606934, -3.463091, 0, 1, 0.4941176, 1,
-0.2316516, -0.9813383, -3.792128, 0, 1, 0.5019608, 1,
-0.2312535, 0.9684438, -0.7072557, 0, 1, 0.509804, 1,
-0.2288228, 0.7824254, -1.136432, 0, 1, 0.5137255, 1,
-0.2239768, -0.7615316, -1.474292, 0, 1, 0.5215687, 1,
-0.2236797, 1.17843, -0.08694734, 0, 1, 0.5254902, 1,
-0.2226691, -2.522417, -1.520347, 0, 1, 0.5333334, 1,
-0.2223454, 0.8229823, 0.5847393, 0, 1, 0.5372549, 1,
-0.2170409, 1.40473, 0.5088789, 0, 1, 0.5450981, 1,
-0.2152115, 0.3410066, 0.08298954, 0, 1, 0.5490196, 1,
-0.2137171, -0.07937958, -1.860427, 0, 1, 0.5568628, 1,
-0.2133569, 1.018465, -1.870549, 0, 1, 0.5607843, 1,
-0.2061676, -0.4215147, -2.459154, 0, 1, 0.5686275, 1,
-0.2049216, 2.350717, -0.461474, 0, 1, 0.572549, 1,
-0.2033838, 1.222321, 0.4235671, 0, 1, 0.5803922, 1,
-0.1998044, 2.002867, 1.253572, 0, 1, 0.5843138, 1,
-0.1985826, 0.1898695, -1.234111, 0, 1, 0.5921569, 1,
-0.1939663, 0.894438, -0.2738698, 0, 1, 0.5960785, 1,
-0.1887789, -1.427067, -2.439088, 0, 1, 0.6039216, 1,
-0.1860312, 1.539024, 0.1748363, 0, 1, 0.6117647, 1,
-0.1824248, 1.609146, 0.9856472, 0, 1, 0.6156863, 1,
-0.174783, 2.844757, -0.1253373, 0, 1, 0.6235294, 1,
-0.1742096, -0.8376347, -2.886232, 0, 1, 0.627451, 1,
-0.1704522, 0.8812983, 0.4040195, 0, 1, 0.6352941, 1,
-0.1667409, -0.3414787, -1.640514, 0, 1, 0.6392157, 1,
-0.1667185, -0.1100756, -2.930927, 0, 1, 0.6470588, 1,
-0.1666567, -0.5764191, -1.291711, 0, 1, 0.6509804, 1,
-0.1621968, 1.062028, -0.3630964, 0, 1, 0.6588235, 1,
-0.1577668, 0.2849441, -1.123452, 0, 1, 0.6627451, 1,
-0.1542019, -1.478479, -3.682512, 0, 1, 0.6705883, 1,
-0.1505818, 0.2101063, -0.5549038, 0, 1, 0.6745098, 1,
-0.1424402, -0.846209, -3.278379, 0, 1, 0.682353, 1,
-0.1423789, -1.489449, -2.309483, 0, 1, 0.6862745, 1,
-0.134725, 0.8972022, 0.08979677, 0, 1, 0.6941177, 1,
-0.1323888, 0.4943759, -0.3192906, 0, 1, 0.7019608, 1,
-0.1303643, 0.06820855, -1.513563, 0, 1, 0.7058824, 1,
-0.1295199, -1.659431, -2.541996, 0, 1, 0.7137255, 1,
-0.1260503, -1.494693, -4.692121, 0, 1, 0.7176471, 1,
-0.1239048, -1.095446, -2.662779, 0, 1, 0.7254902, 1,
-0.1236627, -1.763821, -3.720925, 0, 1, 0.7294118, 1,
-0.1223489, -1.066292, -3.023489, 0, 1, 0.7372549, 1,
-0.1210814, 0.4100262, -1.03881, 0, 1, 0.7411765, 1,
-0.1094016, 1.48014, -0.2634658, 0, 1, 0.7490196, 1,
-0.1090899, 0.1266284, -2.566464, 0, 1, 0.7529412, 1,
-0.1076528, -0.4590299, -4.602781, 0, 1, 0.7607843, 1,
-0.1052152, -2.252609, -4.355044, 0, 1, 0.7647059, 1,
-0.1028605, 0.3382713, 0.9143786, 0, 1, 0.772549, 1,
-0.09242975, 0.4954118, -0.5795349, 0, 1, 0.7764706, 1,
-0.08939812, -0.328909, -4.212946, 0, 1, 0.7843137, 1,
-0.08902081, 1.471782, -1.33683, 0, 1, 0.7882353, 1,
-0.08195131, 0.508697, -0.07725247, 0, 1, 0.7960784, 1,
-0.08174016, 1.564738, -0.0633302, 0, 1, 0.8039216, 1,
-0.07815246, 1.845796, -0.3823449, 0, 1, 0.8078431, 1,
-0.06737922, 0.4036225, -1.472359, 0, 1, 0.8156863, 1,
-0.06683762, -1.289636, -2.795489, 0, 1, 0.8196079, 1,
-0.06511351, -2.330679, -4.46558, 0, 1, 0.827451, 1,
-0.06186954, 0.6965982, -0.7318878, 0, 1, 0.8313726, 1,
-0.06132796, 0.8282226, -1.257611, 0, 1, 0.8392157, 1,
-0.0611106, -1.437478, -3.161951, 0, 1, 0.8431373, 1,
-0.05767611, -1.043489, -3.819189, 0, 1, 0.8509804, 1,
-0.056371, 0.731117, -1.672732, 0, 1, 0.854902, 1,
-0.05543351, -0.5057516, -3.213746, 0, 1, 0.8627451, 1,
-0.05474428, 0.6890196, -0.5089869, 0, 1, 0.8666667, 1,
-0.05073993, 0.7943962, 0.5198938, 0, 1, 0.8745098, 1,
-0.05053544, 0.6396392, 1.937423, 0, 1, 0.8784314, 1,
-0.04970008, 0.1794829, 0.7590197, 0, 1, 0.8862745, 1,
-0.0480122, 0.2556715, 0.2313098, 0, 1, 0.8901961, 1,
-0.04794656, -1.337741, -4.000625, 0, 1, 0.8980392, 1,
-0.04769079, -0.03318749, -4.235223, 0, 1, 0.9058824, 1,
-0.04506685, -1.177284, -3.53172, 0, 1, 0.9098039, 1,
-0.02380876, -1.450649, -3.260818, 0, 1, 0.9176471, 1,
-0.02305638, -0.9550038, -2.37727, 0, 1, 0.9215686, 1,
-0.01082626, 1.124372, 0.01692211, 0, 1, 0.9294118, 1,
-0.01032752, -0.1293639, -3.26812, 0, 1, 0.9333333, 1,
-0.0008227059, 2.155022, 0.1167866, 0, 1, 0.9411765, 1,
8.670081e-05, -1.672555, 3.596902, 0, 1, 0.945098, 1,
0.001520347, 1.172414, -0.6853896, 0, 1, 0.9529412, 1,
0.005196062, 0.4830909, 1.294168, 0, 1, 0.9568627, 1,
0.005524824, 0.5348756, 1.690076, 0, 1, 0.9647059, 1,
0.006285403, 0.06020384, -0.1842001, 0, 1, 0.9686275, 1,
0.006630247, -1.287634, 2.605501, 0, 1, 0.9764706, 1,
0.007047893, 0.2561599, 0.2968777, 0, 1, 0.9803922, 1,
0.007647098, -0.6344603, 3.1346, 0, 1, 0.9882353, 1,
0.0118847, -0.1030134, 2.435464, 0, 1, 0.9921569, 1,
0.01269275, 0.05173773, -0.08620393, 0, 1, 1, 1,
0.01475644, 0.216469, 0.2032332, 0, 0.9921569, 1, 1,
0.01483145, -0.8024997, 2.465582, 0, 0.9882353, 1, 1,
0.01986924, 0.9418045, 0.06598893, 0, 0.9803922, 1, 1,
0.02276634, -0.3000211, 4.113614, 0, 0.9764706, 1, 1,
0.02319164, 1.814766, 0.7115834, 0, 0.9686275, 1, 1,
0.02723107, 1.66231, -0.1163333, 0, 0.9647059, 1, 1,
0.02749453, -0.6722854, 1.980337, 0, 0.9568627, 1, 1,
0.02982613, 1.331894, 0.6294761, 0, 0.9529412, 1, 1,
0.03286471, -0.6325039, 4.577004, 0, 0.945098, 1, 1,
0.03367025, 0.6867518, 0.4269165, 0, 0.9411765, 1, 1,
0.03385447, -0.6431385, 1.505427, 0, 0.9333333, 1, 1,
0.03471572, -0.3992657, 3.518218, 0, 0.9294118, 1, 1,
0.03485564, 1.446757, 0.4985307, 0, 0.9215686, 1, 1,
0.03650614, -1.117883, 2.439354, 0, 0.9176471, 1, 1,
0.037189, -0.8084784, 2.604935, 0, 0.9098039, 1, 1,
0.03785403, -0.2477609, 4.142016, 0, 0.9058824, 1, 1,
0.04044979, -0.8108463, 3.375971, 0, 0.8980392, 1, 1,
0.04406203, -0.05846811, 0.8949139, 0, 0.8901961, 1, 1,
0.04766714, -0.3758439, 2.10307, 0, 0.8862745, 1, 1,
0.05378556, -2.214013, 2.528959, 0, 0.8784314, 1, 1,
0.05627152, -1.188439, 4.018414, 0, 0.8745098, 1, 1,
0.06106133, -0.0179992, 1.854403, 0, 0.8666667, 1, 1,
0.06174541, 0.9668115, 0.7236576, 0, 0.8627451, 1, 1,
0.06405424, -0.7532012, 2.650769, 0, 0.854902, 1, 1,
0.06511384, -1.333668, 4.246497, 0, 0.8509804, 1, 1,
0.06633824, -0.7854268, 4.06771, 0, 0.8431373, 1, 1,
0.07118455, 1.244972, -0.1738987, 0, 0.8392157, 1, 1,
0.07305337, -0.2967689, 3.597346, 0, 0.8313726, 1, 1,
0.07494864, 0.4407124, -0.7311324, 0, 0.827451, 1, 1,
0.07986993, 0.2738934, 1.675136, 0, 0.8196079, 1, 1,
0.08474647, 1.967993, 0.04995932, 0, 0.8156863, 1, 1,
0.08829564, -0.9718626, 3.081878, 0, 0.8078431, 1, 1,
0.0890832, -0.5017687, 3.440368, 0, 0.8039216, 1, 1,
0.08927828, -0.5216782, 3.602938, 0, 0.7960784, 1, 1,
0.09064194, 0.441343, 0.4062906, 0, 0.7882353, 1, 1,
0.09390887, -0.7224033, 2.461845, 0, 0.7843137, 1, 1,
0.09682032, -0.2914126, 1.425295, 0, 0.7764706, 1, 1,
0.1009909, -1.035765, 2.258166, 0, 0.772549, 1, 1,
0.1015929, -0.4464526, 2.639929, 0, 0.7647059, 1, 1,
0.1041428, -0.1106242, 0.5647146, 0, 0.7607843, 1, 1,
0.1088929, -0.4027968, 4.032035, 0, 0.7529412, 1, 1,
0.1103518, -0.9582229, 3.438088, 0, 0.7490196, 1, 1,
0.1122592, -1.297294, 1.92254, 0, 0.7411765, 1, 1,
0.1189136, -1.677803, 3.744479, 0, 0.7372549, 1, 1,
0.1217442, 0.6823007, -1.044099, 0, 0.7294118, 1, 1,
0.1238027, -0.3189702, 2.94896, 0, 0.7254902, 1, 1,
0.1252816, 2.063281, 0.4273823, 0, 0.7176471, 1, 1,
0.1258508, -0.01601779, 2.735177, 0, 0.7137255, 1, 1,
0.1260733, 1.064795, 0.04432535, 0, 0.7058824, 1, 1,
0.1300517, -0.865316, 4.002166, 0, 0.6980392, 1, 1,
0.1333004, -2.047102, 3.526067, 0, 0.6941177, 1, 1,
0.137887, -1.952613, 1.313192, 0, 0.6862745, 1, 1,
0.1393173, 0.8420868, -0.6905705, 0, 0.682353, 1, 1,
0.1405133, 0.07451031, 1.00086, 0, 0.6745098, 1, 1,
0.1430376, 0.4347257, -1.171223, 0, 0.6705883, 1, 1,
0.1431384, 0.7893458, 0.9593404, 0, 0.6627451, 1, 1,
0.1532539, -2.046324, 3.468201, 0, 0.6588235, 1, 1,
0.153826, -1.234493, 0.5410029, 0, 0.6509804, 1, 1,
0.1541712, 0.2890454, 2.099885, 0, 0.6470588, 1, 1,
0.1595111, 0.5631083, 1.311731, 0, 0.6392157, 1, 1,
0.1599995, -0.3966647, 1.872701, 0, 0.6352941, 1, 1,
0.1603456, -1.067154, 2.381526, 0, 0.627451, 1, 1,
0.1620865, 1.439956, 0.5204384, 0, 0.6235294, 1, 1,
0.1641359, 0.4313933, -0.5572961, 0, 0.6156863, 1, 1,
0.1647002, 0.6511275, 0.1723211, 0, 0.6117647, 1, 1,
0.1676337, 1.488739, -0.5924698, 0, 0.6039216, 1, 1,
0.1718176, -0.08662096, 2.438188, 0, 0.5960785, 1, 1,
0.1727525, 0.8107132, -0.2349332, 0, 0.5921569, 1, 1,
0.1730474, -0.7442983, 1.998799, 0, 0.5843138, 1, 1,
0.1766796, -1.073823, 3.283596, 0, 0.5803922, 1, 1,
0.1770865, -0.9367535, 1.582314, 0, 0.572549, 1, 1,
0.1772955, -0.1001014, 0.7130954, 0, 0.5686275, 1, 1,
0.1802077, -0.7792844, 2.703073, 0, 0.5607843, 1, 1,
0.185289, -0.8967239, 3.686287, 0, 0.5568628, 1, 1,
0.1853352, 0.3617176, 0.2904533, 0, 0.5490196, 1, 1,
0.1884037, 0.5846, 0.9922497, 0, 0.5450981, 1, 1,
0.1915193, 0.5288095, -1.238528, 0, 0.5372549, 1, 1,
0.1925382, -0.8568603, 3.395726, 0, 0.5333334, 1, 1,
0.1942086, -0.68755, 3.954742, 0, 0.5254902, 1, 1,
0.20149, -1.615744, 2.469126, 0, 0.5215687, 1, 1,
0.2185282, -0.1273436, 2.066374, 0, 0.5137255, 1, 1,
0.2215095, -1.389689, 2.068801, 0, 0.509804, 1, 1,
0.2226834, 0.05563674, 2.612977, 0, 0.5019608, 1, 1,
0.2240873, -0.3116758, 3.164824, 0, 0.4941176, 1, 1,
0.2252866, -0.8995849, 3.423096, 0, 0.4901961, 1, 1,
0.2264763, -1.24337, 3.29716, 0, 0.4823529, 1, 1,
0.2283615, 0.7882304, 0.6487615, 0, 0.4784314, 1, 1,
0.2311576, -0.4530806, 2.391846, 0, 0.4705882, 1, 1,
0.2332653, 1.834699, -1.03079, 0, 0.4666667, 1, 1,
0.2347048, 1.144909, -0.06846185, 0, 0.4588235, 1, 1,
0.2347786, -0.226549, 3.042293, 0, 0.454902, 1, 1,
0.2370772, 0.4245773, 0.9295917, 0, 0.4470588, 1, 1,
0.2386302, -1.090096, 4.150195, 0, 0.4431373, 1, 1,
0.2433999, -0.06510334, 2.576235, 0, 0.4352941, 1, 1,
0.2440222, -2.407453, 2.687543, 0, 0.4313726, 1, 1,
0.2526775, -1.05978, 2.649193, 0, 0.4235294, 1, 1,
0.2558733, -0.1679854, 0.9100352, 0, 0.4196078, 1, 1,
0.2600747, -1.459642, 1.789183, 0, 0.4117647, 1, 1,
0.2612903, -0.008282694, 0.7976388, 0, 0.4078431, 1, 1,
0.2662176, -0.2091015, 1.898193, 0, 0.4, 1, 1,
0.2686073, 0.8688853, -0.1761556, 0, 0.3921569, 1, 1,
0.2688778, -0.5614868, 1.764801, 0, 0.3882353, 1, 1,
0.2723021, -0.6344741, 4.132296, 0, 0.3803922, 1, 1,
0.2727194, 0.5096936, 0.9546949, 0, 0.3764706, 1, 1,
0.2753811, -0.8481257, 0.1360444, 0, 0.3686275, 1, 1,
0.2785926, -0.4049133, 0.4608989, 0, 0.3647059, 1, 1,
0.2824255, -1.166673, 2.818273, 0, 0.3568628, 1, 1,
0.2912466, -0.2657513, 1.225871, 0, 0.3529412, 1, 1,
0.2944959, -0.4750423, 2.807112, 0, 0.345098, 1, 1,
0.2945023, -1.096157, 1.981527, 0, 0.3411765, 1, 1,
0.2966501, 0.7322381, 1.496404, 0, 0.3333333, 1, 1,
0.3012767, 0.3584754, 1.617257, 0, 0.3294118, 1, 1,
0.3033835, 0.8297713, 0.1466987, 0, 0.3215686, 1, 1,
0.3074541, -0.3811196, 3.565333, 0, 0.3176471, 1, 1,
0.3080163, -0.368899, 2.946944, 0, 0.3098039, 1, 1,
0.314721, -0.4009711, 1.866587, 0, 0.3058824, 1, 1,
0.3149866, -2.103938, 1.86949, 0, 0.2980392, 1, 1,
0.316819, 0.3563982, 1.924656, 0, 0.2901961, 1, 1,
0.3182521, -2.853006, 2.219385, 0, 0.2862745, 1, 1,
0.3212906, 1.293472, 1.64207, 0, 0.2784314, 1, 1,
0.3224124, 1.735545, -1.095919, 0, 0.2745098, 1, 1,
0.3235652, 0.4642956, 1.065618, 0, 0.2666667, 1, 1,
0.334174, 0.1302175, 3.395983, 0, 0.2627451, 1, 1,
0.3346721, 1.333842, 0.9376404, 0, 0.254902, 1, 1,
0.3349202, 0.5242876, 0.7745833, 0, 0.2509804, 1, 1,
0.3372229, 0.637009, 1.28782, 0, 0.2431373, 1, 1,
0.3399341, -1.652663, 2.254335, 0, 0.2392157, 1, 1,
0.3470027, 1.45799, -0.6158077, 0, 0.2313726, 1, 1,
0.3482142, 1.310473, -0.2599584, 0, 0.227451, 1, 1,
0.349748, -1.637137, 2.603785, 0, 0.2196078, 1, 1,
0.3516546, 0.2092723, -0.7079218, 0, 0.2156863, 1, 1,
0.3602651, -0.588529, 1.384991, 0, 0.2078431, 1, 1,
0.3629385, 0.8975643, -0.0532328, 0, 0.2039216, 1, 1,
0.365427, -0.4987513, 2.348612, 0, 0.1960784, 1, 1,
0.3686306, 0.04098191, 1.876325, 0, 0.1882353, 1, 1,
0.3696344, 0.8567052, -0.2286644, 0, 0.1843137, 1, 1,
0.3705886, -1.19067, 3.456081, 0, 0.1764706, 1, 1,
0.3709236, -0.6503398, 3.041153, 0, 0.172549, 1, 1,
0.37234, -0.1071349, 0.9320446, 0, 0.1647059, 1, 1,
0.3745244, -0.7764478, 1.916414, 0, 0.1607843, 1, 1,
0.3789814, 0.675437, 1.119059, 0, 0.1529412, 1, 1,
0.3838848, 1.151344, 1.996893, 0, 0.1490196, 1, 1,
0.3840032, -0.8225551, 2.461984, 0, 0.1411765, 1, 1,
0.3856609, -1.443677, 2.833183, 0, 0.1372549, 1, 1,
0.3880364, 1.705272, 0.350845, 0, 0.1294118, 1, 1,
0.3907062, 0.5120929, 2.51983, 0, 0.1254902, 1, 1,
0.3916069, -0.7212341, 3.67938, 0, 0.1176471, 1, 1,
0.3953756, -1.237854, 3.147752, 0, 0.1137255, 1, 1,
0.3967945, -0.4794125, 2.233003, 0, 0.1058824, 1, 1,
0.39891, -0.3682388, 3.64462, 0, 0.09803922, 1, 1,
0.4005735, -0.3755181, 4.988109, 0, 0.09411765, 1, 1,
0.4029333, -0.07651771, 2.553127, 0, 0.08627451, 1, 1,
0.4057112, 1.472963, 0.5834816, 0, 0.08235294, 1, 1,
0.4120032, 1.744738, 0.4743322, 0, 0.07450981, 1, 1,
0.4120324, 2.01998, 0.6176319, 0, 0.07058824, 1, 1,
0.4128321, 0.1998582, 1.837088, 0, 0.0627451, 1, 1,
0.4137674, 0.01591127, 0.6688517, 0, 0.05882353, 1, 1,
0.4170909, -3.239609, 2.688319, 0, 0.05098039, 1, 1,
0.4185895, 0.8896108, 1.729958, 0, 0.04705882, 1, 1,
0.4201437, -1.008181, 4.074626, 0, 0.03921569, 1, 1,
0.4280488, -0.1330967, 1.284249, 0, 0.03529412, 1, 1,
0.4287463, 0.3107152, 2.169514, 0, 0.02745098, 1, 1,
0.4358388, -0.2656863, 0.9667964, 0, 0.02352941, 1, 1,
0.4428609, 0.4832892, 1.569134, 0, 0.01568628, 1, 1,
0.4430654, 1.663447, 1.790797, 0, 0.01176471, 1, 1,
0.4447444, 1.60433, -0.2800828, 0, 0.003921569, 1, 1,
0.4455529, 0.2589031, 0.850483, 0.003921569, 0, 1, 1,
0.4495736, 0.1071199, 1.747114, 0.007843138, 0, 1, 1,
0.4542909, -0.7632167, 2.914592, 0.01568628, 0, 1, 1,
0.4601653, 0.6990352, 0.4173134, 0.01960784, 0, 1, 1,
0.4692791, 1.20481, 2.606145, 0.02745098, 0, 1, 1,
0.4710433, -0.9478648, 2.21697, 0.03137255, 0, 1, 1,
0.4743778, -1.77791, 3.566823, 0.03921569, 0, 1, 1,
0.4745632, 1.779849, -0.01914667, 0.04313726, 0, 1, 1,
0.4760883, 1.215124, 2.807761, 0.05098039, 0, 1, 1,
0.4802824, 0.6861013, 0.5419468, 0.05490196, 0, 1, 1,
0.4813603, 0.5528182, 2.302717, 0.0627451, 0, 1, 1,
0.4853803, 0.3913861, 1.765417, 0.06666667, 0, 1, 1,
0.4862081, 1.384073, -0.8718498, 0.07450981, 0, 1, 1,
0.4907707, 0.777777, -0.572817, 0.07843138, 0, 1, 1,
0.4929245, 1.053893, 0.9753622, 0.08627451, 0, 1, 1,
0.4971259, -1.332886, 2.011787, 0.09019608, 0, 1, 1,
0.4986644, 0.2196464, 0.1450778, 0.09803922, 0, 1, 1,
0.4992881, -0.5982277, 2.90849, 0.1058824, 0, 1, 1,
0.5094228, 0.6938543, 0.7640747, 0.1098039, 0, 1, 1,
0.5108657, 1.507017, 0.06077152, 0.1176471, 0, 1, 1,
0.513999, -0.8784876, 2.723833, 0.1215686, 0, 1, 1,
0.5143864, 0.03445052, 0.596527, 0.1294118, 0, 1, 1,
0.5146165, -1.362055, 1.651644, 0.1333333, 0, 1, 1,
0.5177613, 0.3479725, 2.050638, 0.1411765, 0, 1, 1,
0.5188278, -0.8667065, 3.407655, 0.145098, 0, 1, 1,
0.5192275, -0.3274442, 1.886569, 0.1529412, 0, 1, 1,
0.5264792, 0.5136693, 1.535868, 0.1568628, 0, 1, 1,
0.5291682, -1.998875, 1.95913, 0.1647059, 0, 1, 1,
0.5309709, -0.1855847, 3.398419, 0.1686275, 0, 1, 1,
0.5311112, 0.448126, 0.5355914, 0.1764706, 0, 1, 1,
0.531244, 0.548405, 0.3526186, 0.1803922, 0, 1, 1,
0.5333332, -1.758279, 3.040182, 0.1882353, 0, 1, 1,
0.5336825, -0.2028266, 0.2751504, 0.1921569, 0, 1, 1,
0.5365731, -1.782975, 2.592699, 0.2, 0, 1, 1,
0.540022, -1.496745, 1.624821, 0.2078431, 0, 1, 1,
0.5433094, -0.5901595, 0.7712728, 0.2117647, 0, 1, 1,
0.545211, 0.4661757, 0.5832664, 0.2196078, 0, 1, 1,
0.5482346, 1.328829, 1.428687, 0.2235294, 0, 1, 1,
0.5571073, -0.8232172, 2.445615, 0.2313726, 0, 1, 1,
0.5593051, 0.7673236, 3.147029, 0.2352941, 0, 1, 1,
0.5702416, 0.9412531, 2.136068, 0.2431373, 0, 1, 1,
0.5758336, -0.6926791, 2.918502, 0.2470588, 0, 1, 1,
0.5800793, 0.4328217, -0.175852, 0.254902, 0, 1, 1,
0.5842953, 2.00843, -0.1165565, 0.2588235, 0, 1, 1,
0.5854164, 0.9353155, 0.6264474, 0.2666667, 0, 1, 1,
0.5861968, -0.03810083, 2.422818, 0.2705882, 0, 1, 1,
0.5894116, 0.250033, 2.792631, 0.2784314, 0, 1, 1,
0.5928319, -0.4649151, 2.27422, 0.282353, 0, 1, 1,
0.5988245, 0.03881588, 0.7037398, 0.2901961, 0, 1, 1,
0.6024854, -0.08145139, 2.592039, 0.2941177, 0, 1, 1,
0.6027055, -0.6969901, 4.536694, 0.3019608, 0, 1, 1,
0.6051779, -2.046669, 2.353861, 0.3098039, 0, 1, 1,
0.6201251, 0.007833535, 2.246951, 0.3137255, 0, 1, 1,
0.6247447, 0.5796027, -0.4038335, 0.3215686, 0, 1, 1,
0.6258877, -1.046736, 1.833573, 0.3254902, 0, 1, 1,
0.6287778, -0.1370498, 0.6936892, 0.3333333, 0, 1, 1,
0.6306263, 1.020357, -0.1252882, 0.3372549, 0, 1, 1,
0.631581, -0.7483802, 3.892323, 0.345098, 0, 1, 1,
0.6317747, -1.422811, 2.100522, 0.3490196, 0, 1, 1,
0.6356543, 0.3912844, 2.335648, 0.3568628, 0, 1, 1,
0.6375132, 0.6772959, 1.818174, 0.3607843, 0, 1, 1,
0.6408384, 1.102089, -0.3574638, 0.3686275, 0, 1, 1,
0.6449118, 0.2159373, 2.035018, 0.372549, 0, 1, 1,
0.6451629, 0.5667834, -0.4622748, 0.3803922, 0, 1, 1,
0.6476305, 0.0175424, 2.212285, 0.3843137, 0, 1, 1,
0.6497906, 0.6537024, 1.41659, 0.3921569, 0, 1, 1,
0.6498357, -0.8143716, 2.076891, 0.3960784, 0, 1, 1,
0.6507112, -0.9610857, 3.947114, 0.4039216, 0, 1, 1,
0.6560011, 1.385628, 1.52626, 0.4117647, 0, 1, 1,
0.6584336, 2.095272, 0.04151512, 0.4156863, 0, 1, 1,
0.6584364, -0.3517385, 1.87438, 0.4235294, 0, 1, 1,
0.6587882, 0.7384722, -0.1260912, 0.427451, 0, 1, 1,
0.6613544, 0.6976568, 0.8321717, 0.4352941, 0, 1, 1,
0.664274, -0.8622162, 3.684895, 0.4392157, 0, 1, 1,
0.6642816, 0.02987546, 1.836021, 0.4470588, 0, 1, 1,
0.6644682, 0.2529624, 1.61949, 0.4509804, 0, 1, 1,
0.666338, -1.646255, 0.4166718, 0.4588235, 0, 1, 1,
0.6674432, -0.2702752, 2.534065, 0.4627451, 0, 1, 1,
0.6677648, 0.09237829, 2.50033, 0.4705882, 0, 1, 1,
0.6709725, -0.6332767, 0.9895051, 0.4745098, 0, 1, 1,
0.6731181, -1.263924, 4.120507, 0.4823529, 0, 1, 1,
0.6739022, -0.7257432, 1.445387, 0.4862745, 0, 1, 1,
0.6758635, 1.34298, 0.6139199, 0.4941176, 0, 1, 1,
0.681494, 0.1584423, 1.233506, 0.5019608, 0, 1, 1,
0.6867483, 0.4608454, 2.165345, 0.5058824, 0, 1, 1,
0.6878856, 1.870707, 0.8019807, 0.5137255, 0, 1, 1,
0.6956331, -1.062554, 3.322192, 0.5176471, 0, 1, 1,
0.7012041, -0.5967209, 4.111649, 0.5254902, 0, 1, 1,
0.7099721, 0.3362063, 1.110298, 0.5294118, 0, 1, 1,
0.7114885, -0.4892893, 2.065735, 0.5372549, 0, 1, 1,
0.7127993, 0.08084144, 0.7801635, 0.5411765, 0, 1, 1,
0.7147208, 1.104632, 0.2275265, 0.5490196, 0, 1, 1,
0.7173426, -0.7477278, 1.302089, 0.5529412, 0, 1, 1,
0.7174134, 1.412903, 1.053362, 0.5607843, 0, 1, 1,
0.7174821, -0.0287834, 1.881664, 0.5647059, 0, 1, 1,
0.7392388, 0.06209932, 1.244284, 0.572549, 0, 1, 1,
0.7457836, 1.465736, 0.122243, 0.5764706, 0, 1, 1,
0.7513718, -1.221872, 2.561988, 0.5843138, 0, 1, 1,
0.7537141, -1.397369, 2.762752, 0.5882353, 0, 1, 1,
0.7556068, -1.54861, 3.395615, 0.5960785, 0, 1, 1,
0.7558933, -1.306054, 1.827781, 0.6039216, 0, 1, 1,
0.7596214, 0.9228581, 0.6855002, 0.6078432, 0, 1, 1,
0.7625604, -0.24945, 2.423179, 0.6156863, 0, 1, 1,
0.7633668, -0.0006959475, 1.691489, 0.6196079, 0, 1, 1,
0.7667033, -1.419285, 3.682344, 0.627451, 0, 1, 1,
0.7719617, -0.4249765, 2.501352, 0.6313726, 0, 1, 1,
0.7751667, -0.4611284, 2.429674, 0.6392157, 0, 1, 1,
0.7793852, 0.1953374, 1.087476, 0.6431373, 0, 1, 1,
0.7800749, 1.135579, 0.4540181, 0.6509804, 0, 1, 1,
0.7962371, 2.023873, 0.5665189, 0.654902, 0, 1, 1,
0.8007292, -0.2811852, 0.2175276, 0.6627451, 0, 1, 1,
0.8012641, -1.363122, 1.752352, 0.6666667, 0, 1, 1,
0.802056, -0.3270583, 2.42029, 0.6745098, 0, 1, 1,
0.8031424, 0.1342643, 1.604174, 0.6784314, 0, 1, 1,
0.8044301, 0.3349687, 1.657637, 0.6862745, 0, 1, 1,
0.8058288, 1.015261, -1.976611, 0.6901961, 0, 1, 1,
0.8071911, 0.05595143, 3.186802, 0.6980392, 0, 1, 1,
0.8086631, -0.5821028, 1.473205, 0.7058824, 0, 1, 1,
0.8112797, 2.003005, -1.107727, 0.7098039, 0, 1, 1,
0.8117606, -0.3762544, 0.5501728, 0.7176471, 0, 1, 1,
0.8136368, -1.90772, 2.860775, 0.7215686, 0, 1, 1,
0.8138197, 0.2620926, 2.374005, 0.7294118, 0, 1, 1,
0.814755, -1.100377, 2.468844, 0.7333333, 0, 1, 1,
0.8193861, -1.366741, 1.807597, 0.7411765, 0, 1, 1,
0.8255358, -0.3976304, 1.914505, 0.7450981, 0, 1, 1,
0.8316085, -0.5414211, 2.845069, 0.7529412, 0, 1, 1,
0.8349981, -0.7281497, 0.8110169, 0.7568628, 0, 1, 1,
0.8373083, 1.445372, 2.013408, 0.7647059, 0, 1, 1,
0.8417411, -0.09856112, 3.248685, 0.7686275, 0, 1, 1,
0.8421282, -0.04969663, 3.029548, 0.7764706, 0, 1, 1,
0.846558, 1.127654, 0.1826873, 0.7803922, 0, 1, 1,
0.8508586, 1.002579, 0.637917, 0.7882353, 0, 1, 1,
0.8522731, 1.749195, 0.05251345, 0.7921569, 0, 1, 1,
0.8523288, -0.3086881, 1.940697, 0.8, 0, 1, 1,
0.8526577, -1.050282, 1.100638, 0.8078431, 0, 1, 1,
0.8569034, 0.1949925, 1.737425, 0.8117647, 0, 1, 1,
0.8615547, -1.02847, 4.299298, 0.8196079, 0, 1, 1,
0.8660598, -0.05088836, 1.537182, 0.8235294, 0, 1, 1,
0.8666693, 0.3049382, -0.00743641, 0.8313726, 0, 1, 1,
0.866806, -0.3402161, 3.424797, 0.8352941, 0, 1, 1,
0.8669459, 1.14988, -0.1280047, 0.8431373, 0, 1, 1,
0.8733888, -1.222106, 1.416386, 0.8470588, 0, 1, 1,
0.8738103, -0.5513495, 2.009955, 0.854902, 0, 1, 1,
0.8755621, 0.7074339, -1.030572, 0.8588235, 0, 1, 1,
0.8762382, 0.3293679, 0.9185943, 0.8666667, 0, 1, 1,
0.8790466, 1.261, 0.1037066, 0.8705882, 0, 1, 1,
0.8827012, -0.7944018, 3.173868, 0.8784314, 0, 1, 1,
0.8834734, 0.3729558, 2.304388, 0.8823529, 0, 1, 1,
0.8874465, 0.7540983, 0.8984566, 0.8901961, 0, 1, 1,
0.8878649, 1.00058, 1.694648, 0.8941177, 0, 1, 1,
0.8986373, 1.510653, 0.6222408, 0.9019608, 0, 1, 1,
0.8987334, -1.175092, 3.075563, 0.9098039, 0, 1, 1,
0.8999768, 2.291314, -0.4341326, 0.9137255, 0, 1, 1,
0.9026097, 0.3083463, 1.524455, 0.9215686, 0, 1, 1,
0.9058912, 0.7121936, -0.01322987, 0.9254902, 0, 1, 1,
0.906521, -0.1017894, 1.756128, 0.9333333, 0, 1, 1,
0.906784, -0.4453686, 1.898246, 0.9372549, 0, 1, 1,
0.9117169, -0.2453337, 2.550725, 0.945098, 0, 1, 1,
0.9152625, 0.2637865, 1.74647, 0.9490196, 0, 1, 1,
0.9174512, -1.676712, 2.017254, 0.9568627, 0, 1, 1,
0.9222642, -0.149612, 3.536911, 0.9607843, 0, 1, 1,
0.9259953, 0.5915318, 0.6070807, 0.9686275, 0, 1, 1,
0.9298781, -1.685278, 3.68108, 0.972549, 0, 1, 1,
0.9362111, -1.164552, 2.270067, 0.9803922, 0, 1, 1,
0.9365825, -0.4618249, 1.562383, 0.9843137, 0, 1, 1,
0.9456024, -1.010554, 1.364451, 0.9921569, 0, 1, 1,
0.9555002, -1.135152, 0.6525549, 0.9960784, 0, 1, 1,
0.9579155, -0.1905319, 0.1080533, 1, 0, 0.9960784, 1,
0.9618135, 1.687158, 1.366908, 1, 0, 0.9882353, 1,
0.9647354, -1.615774, 3.303485, 1, 0, 0.9843137, 1,
0.9682412, 1.688007, 2.494623, 1, 0, 0.9764706, 1,
0.9711121, 1.541092, 1.706424, 1, 0, 0.972549, 1,
0.979187, -1.069391, 4.288322, 1, 0, 0.9647059, 1,
0.9852106, -0.1506578, 2.437682, 1, 0, 0.9607843, 1,
0.9862595, -2.196162, 4.243813, 1, 0, 0.9529412, 1,
0.9895706, 0.2103865, 0.7526526, 1, 0, 0.9490196, 1,
0.9924901, -1.063818, 3.356211, 1, 0, 0.9411765, 1,
0.9962156, -0.02501226, 1.577943, 1, 0, 0.9372549, 1,
1.001807, -0.8958095, 3.135383, 1, 0, 0.9294118, 1,
1.003838, -0.5729618, -0.05985755, 1, 0, 0.9254902, 1,
1.005016, -0.8042503, 1.861186, 1, 0, 0.9176471, 1,
1.006296, 0.3353305, 1.801127, 1, 0, 0.9137255, 1,
1.006497, 0.4174201, 0.5834875, 1, 0, 0.9058824, 1,
1.011868, 0.03599757, -1.076712, 1, 0, 0.9019608, 1,
1.016852, 0.6402779, 0.8345344, 1, 0, 0.8941177, 1,
1.042167, 0.932588, 1.439836, 1, 0, 0.8862745, 1,
1.047592, 1.680489, -1.209136, 1, 0, 0.8823529, 1,
1.048413, -1.095459, 3.15046, 1, 0, 0.8745098, 1,
1.052113, -0.3402307, 2.481529, 1, 0, 0.8705882, 1,
1.056681, -0.3049673, 2.358901, 1, 0, 0.8627451, 1,
1.064407, 0.839071, -0.1779741, 1, 0, 0.8588235, 1,
1.078885, 0.00846463, 0.8990585, 1, 0, 0.8509804, 1,
1.080816, -1.444389, 2.512245, 1, 0, 0.8470588, 1,
1.090191, 0.6634156, 1.937942, 1, 0, 0.8392157, 1,
1.090581, 0.2316204, 1.26471, 1, 0, 0.8352941, 1,
1.09173, 0.840571, 0.544082, 1, 0, 0.827451, 1,
1.092146, 0.9103893, -0.05068725, 1, 0, 0.8235294, 1,
1.110776, 0.5317467, 1.45593, 1, 0, 0.8156863, 1,
1.120193, -0.9613984, 1.259412, 1, 0, 0.8117647, 1,
1.123827, -0.7102624, 2.174079, 1, 0, 0.8039216, 1,
1.127797, 1.858027, 0.4161359, 1, 0, 0.7960784, 1,
1.12817, -0.4127062, 1.869957, 1, 0, 0.7921569, 1,
1.131072, -0.03341911, 1.956572, 1, 0, 0.7843137, 1,
1.134943, 0.6810107, 0.9022043, 1, 0, 0.7803922, 1,
1.139926, -0.6061265, 2.754826, 1, 0, 0.772549, 1,
1.142406, 0.6102036, 2.113072, 1, 0, 0.7686275, 1,
1.14274, 1.447615, -0.01832321, 1, 0, 0.7607843, 1,
1.14862, 0.5551013, 1.460554, 1, 0, 0.7568628, 1,
1.163496, 1.223377, 1.266242, 1, 0, 0.7490196, 1,
1.166238, -0.3109058, 1.324436, 1, 0, 0.7450981, 1,
1.16827, 0.8410481, 2.239119, 1, 0, 0.7372549, 1,
1.170753, -1.16807, 1.74954, 1, 0, 0.7333333, 1,
1.172163, 0.288018, 3.052618, 1, 0, 0.7254902, 1,
1.173447, -1.222776, 1.758064, 1, 0, 0.7215686, 1,
1.17808, 0.6124591, 2.161273, 1, 0, 0.7137255, 1,
1.178336, 2.139923, 0.7061034, 1, 0, 0.7098039, 1,
1.183829, 1.249938, 1.22694, 1, 0, 0.7019608, 1,
1.190014, 0.9759692, -0.6901121, 1, 0, 0.6941177, 1,
1.190784, -1.445993, 4.24844, 1, 0, 0.6901961, 1,
1.197776, 0.8714951, 0.3272795, 1, 0, 0.682353, 1,
1.199434, -0.7624824, 2.100792, 1, 0, 0.6784314, 1,
1.211592, -0.153513, -0.08650716, 1, 0, 0.6705883, 1,
1.218655, 1.903298, 0.9757577, 1, 0, 0.6666667, 1,
1.227734, -0.0511713, 1.935894, 1, 0, 0.6588235, 1,
1.233519, -1.964967, 3.402833, 1, 0, 0.654902, 1,
1.235381, -0.7675082, 3.34741, 1, 0, 0.6470588, 1,
1.251881, -2.007038, 2.802425, 1, 0, 0.6431373, 1,
1.260887, 0.3804037, 2.241876, 1, 0, 0.6352941, 1,
1.262744, 0.7632272, 0.5263042, 1, 0, 0.6313726, 1,
1.280447, -0.2422142, 0.9677069, 1, 0, 0.6235294, 1,
1.28969, 0.109671, -0.1608677, 1, 0, 0.6196079, 1,
1.294146, 0.3945132, 2.620852, 1, 0, 0.6117647, 1,
1.315074, 0.8781521, 1.191645, 1, 0, 0.6078432, 1,
1.320056, -0.5961396, 1.890941, 1, 0, 0.6, 1,
1.327727, 1.033731, 0.2709792, 1, 0, 0.5921569, 1,
1.330643, 0.4392393, 0.8020753, 1, 0, 0.5882353, 1,
1.34589, -1.311961, 2.635934, 1, 0, 0.5803922, 1,
1.356103, -0.8787237, 1.837453, 1, 0, 0.5764706, 1,
1.358669, -1.154859, 2.157161, 1, 0, 0.5686275, 1,
1.36037, -0.1827842, 2.28886, 1, 0, 0.5647059, 1,
1.367068, -1.032123, 2.592262, 1, 0, 0.5568628, 1,
1.375409, 0.08835375, 2.072258, 1, 0, 0.5529412, 1,
1.376136, -0.09958234, 2.845786, 1, 0, 0.5450981, 1,
1.37917, 0.1551216, 1.642305, 1, 0, 0.5411765, 1,
1.3794, 1.200929, 1.099717, 1, 0, 0.5333334, 1,
1.387321, -0.3946889, 2.952991, 1, 0, 0.5294118, 1,
1.389506, -0.5943246, 1.048801, 1, 0, 0.5215687, 1,
1.406115, 0.4100331, 1.526392, 1, 0, 0.5176471, 1,
1.417694, 0.7179798, 1.495437, 1, 0, 0.509804, 1,
1.436212, -0.8816521, 2.851035, 1, 0, 0.5058824, 1,
1.439844, 0.561149, 2.016445, 1, 0, 0.4980392, 1,
1.44003, 0.7123051, 0.1297284, 1, 0, 0.4901961, 1,
1.445683, -1.164553, 1.91203, 1, 0, 0.4862745, 1,
1.450368, 0.4975777, 1.184117, 1, 0, 0.4784314, 1,
1.450974, -0.02923686, 0.9011146, 1, 0, 0.4745098, 1,
1.456192, 0.4711799, 0.1164032, 1, 0, 0.4666667, 1,
1.462337, 1.521886, 0.8891851, 1, 0, 0.4627451, 1,
1.468205, 0.2865465, 1.637803, 1, 0, 0.454902, 1,
1.472309, 0.5172098, 0.5413126, 1, 0, 0.4509804, 1,
1.475236, -0.9487994, 2.218674, 1, 0, 0.4431373, 1,
1.477664, -0.7059177, 2.931109, 1, 0, 0.4392157, 1,
1.479484, -0.2541921, 3.642391, 1, 0, 0.4313726, 1,
1.485302, 0.3312225, 1.563398, 1, 0, 0.427451, 1,
1.491206, 0.9753313, 0.490614, 1, 0, 0.4196078, 1,
1.503237, -1.734794, 2.476959, 1, 0, 0.4156863, 1,
1.525116, 0.004279002, 0.1308338, 1, 0, 0.4078431, 1,
1.533963, -0.5723421, 1.24489, 1, 0, 0.4039216, 1,
1.541153, -0.1651153, 2.851476, 1, 0, 0.3960784, 1,
1.543405, -0.8140671, 2.040324, 1, 0, 0.3882353, 1,
1.556996, 0.4015881, 1.191505, 1, 0, 0.3843137, 1,
1.558458, -0.005723224, 2.377231, 1, 0, 0.3764706, 1,
1.560452, 0.1630296, 2.095007, 1, 0, 0.372549, 1,
1.571318, 0.5918379, 1.337593, 1, 0, 0.3647059, 1,
1.579749, -1.572189, 0.1836499, 1, 0, 0.3607843, 1,
1.581476, 0.9970244, 1.925312, 1, 0, 0.3529412, 1,
1.58209, -1.021096, 1.961395, 1, 0, 0.3490196, 1,
1.583932, -0.9040909, 0.7923928, 1, 0, 0.3411765, 1,
1.599491, 0.09835581, 0.1019565, 1, 0, 0.3372549, 1,
1.603628, 0.6286436, 2.252372, 1, 0, 0.3294118, 1,
1.619706, -0.4193815, 1.447989, 1, 0, 0.3254902, 1,
1.631018, -1.073914, 2.124082, 1, 0, 0.3176471, 1,
1.635324, -0.1063843, 1.143444, 1, 0, 0.3137255, 1,
1.637164, -0.6706873, 0.925312, 1, 0, 0.3058824, 1,
1.643548, -0.002018901, 2.924433, 1, 0, 0.2980392, 1,
1.643578, -0.7121079, 1.139692, 1, 0, 0.2941177, 1,
1.645576, 1.998486, 1.027189, 1, 0, 0.2862745, 1,
1.651348, -1.354569, 1.94416, 1, 0, 0.282353, 1,
1.669735, 1.639988, 0.9753796, 1, 0, 0.2745098, 1,
1.700298, -1.846766, 4.173128, 1, 0, 0.2705882, 1,
1.701521, 1.939014, 0.4189036, 1, 0, 0.2627451, 1,
1.702554, -0.2187275, 0.7608035, 1, 0, 0.2588235, 1,
1.733037, 0.4640226, 0.7459086, 1, 0, 0.2509804, 1,
1.733423, -0.5274114, 1.104819, 1, 0, 0.2470588, 1,
1.736199, 1.13589, 1.324172, 1, 0, 0.2392157, 1,
1.760499, -0.4930367, 1.566844, 1, 0, 0.2352941, 1,
1.7614, 0.650923, 0.8154946, 1, 0, 0.227451, 1,
1.802778, -1.198392, 2.734107, 1, 0, 0.2235294, 1,
1.803535, -0.09519929, 2.001812, 1, 0, 0.2156863, 1,
1.812572, -0.9045914, 2.018205, 1, 0, 0.2117647, 1,
1.823071, 0.1730052, 0.7430159, 1, 0, 0.2039216, 1,
1.824583, 0.9190097, 0.8576412, 1, 0, 0.1960784, 1,
1.826935, -0.7778456, 0.6725118, 1, 0, 0.1921569, 1,
1.839411, -1.564626, 2.569634, 1, 0, 0.1843137, 1,
1.85991, -0.6179784, 2.259892, 1, 0, 0.1803922, 1,
1.869255, 1.312793, 2.125089, 1, 0, 0.172549, 1,
1.873683, 0.225411, 2.153204, 1, 0, 0.1686275, 1,
1.877345, 1.748657, 1.272387, 1, 0, 0.1607843, 1,
1.884183, -1.080147, 2.439916, 1, 0, 0.1568628, 1,
1.892895, 1.177171, -0.1026512, 1, 0, 0.1490196, 1,
1.90085, 0.9897042, 1.220606, 1, 0, 0.145098, 1,
1.911814, -1.089036, 1.258292, 1, 0, 0.1372549, 1,
1.914899, -2.227794, 2.683108, 1, 0, 0.1333333, 1,
1.961574, -1.447591, 3.871716, 1, 0, 0.1254902, 1,
2.009605, 0.01639592, 0.7981479, 1, 0, 0.1215686, 1,
2.034828, -0.4085252, 3.343515, 1, 0, 0.1137255, 1,
2.056556, 0.1416301, 1.204595, 1, 0, 0.1098039, 1,
2.077883, -2.13417, 2.240603, 1, 0, 0.1019608, 1,
2.146115, -1.045204, 1.110525, 1, 0, 0.09411765, 1,
2.171127, -0.4041306, 0.9878198, 1, 0, 0.09019608, 1,
2.183145, 0.3087091, 2.333789, 1, 0, 0.08235294, 1,
2.210664, 1.887872, 0.6729845, 1, 0, 0.07843138, 1,
2.276052, 1.34744, 4.188057, 1, 0, 0.07058824, 1,
2.310569, 0.06505463, 0.569197, 1, 0, 0.06666667, 1,
2.448957, 0.1286063, 2.919197, 1, 0, 0.05882353, 1,
2.507462, -0.5728212, 1.858756, 1, 0, 0.05490196, 1,
2.549437, 0.04827152, 1.016124, 1, 0, 0.04705882, 1,
2.552641, 2.016898, 0.3748604, 1, 0, 0.04313726, 1,
2.62611, 0.2317756, 0.8305898, 1, 0, 0.03529412, 1,
2.632885, -1.728104, 1.819262, 1, 0, 0.03137255, 1,
2.666742, -0.2750643, 2.17484, 1, 0, 0.02352941, 1,
2.697083, 0.6860995, 2.449191, 1, 0, 0.01960784, 1,
2.802786, 0.08118726, 2.968999, 1, 0, 0.01176471, 1,
3.116285, 0.4485775, 2.182975, 1, 0, 0.007843138, 1
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
0.1075894, -4.294799, -6.871618, 0, -0.5, 0.5, 0.5,
0.1075894, -4.294799, -6.871618, 1, -0.5, 0.5, 0.5,
0.1075894, -4.294799, -6.871618, 1, 1.5, 0.5, 0.5,
0.1075894, -4.294799, -6.871618, 0, 1.5, 0.5, 0.5
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
-3.921054, -0.1269553, -6.871618, 0, -0.5, 0.5, 0.5,
-3.921054, -0.1269553, -6.871618, 1, -0.5, 0.5, 0.5,
-3.921054, -0.1269553, -6.871618, 1, 1.5, 0.5, 0.5,
-3.921054, -0.1269553, -6.871618, 0, 1.5, 0.5, 0.5
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
-3.921054, -4.294799, -0.08231735, 0, -0.5, 0.5, 0.5,
-3.921054, -4.294799, -0.08231735, 1, -0.5, 0.5, 0.5,
-3.921054, -4.294799, -0.08231735, 1, 1.5, 0.5, 0.5,
-3.921054, -4.294799, -0.08231735, 0, 1.5, 0.5, 0.5
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
-2, -3.332989, -5.304856,
3, -3.332989, -5.304856,
-2, -3.332989, -5.304856,
-2, -3.493291, -5.565983,
-1, -3.332989, -5.304856,
-1, -3.493291, -5.565983,
0, -3.332989, -5.304856,
0, -3.493291, -5.565983,
1, -3.332989, -5.304856,
1, -3.493291, -5.565983,
2, -3.332989, -5.304856,
2, -3.493291, -5.565983,
3, -3.332989, -5.304856,
3, -3.493291, -5.565983
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
-2, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
-2, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
-2, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
-2, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5,
-1, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
-1, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
-1, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
-1, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5,
0, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
0, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
0, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
0, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5,
1, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
1, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
1, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
1, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5,
2, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
2, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
2, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
2, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5,
3, -3.813894, -6.088237, 0, -0.5, 0.5, 0.5,
3, -3.813894, -6.088237, 1, -0.5, 0.5, 0.5,
3, -3.813894, -6.088237, 1, 1.5, 0.5, 0.5,
3, -3.813894, -6.088237, 0, 1.5, 0.5, 0.5
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
-2.991367, -3, -5.304856,
-2.991367, 2, -5.304856,
-2.991367, -3, -5.304856,
-3.146315, -3, -5.565983,
-2.991367, -2, -5.304856,
-3.146315, -2, -5.565983,
-2.991367, -1, -5.304856,
-3.146315, -1, -5.565983,
-2.991367, 0, -5.304856,
-3.146315, 0, -5.565983,
-2.991367, 1, -5.304856,
-3.146315, 1, -5.565983,
-2.991367, 2, -5.304856,
-3.146315, 2, -5.565983
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
-3.45621, -3, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, -3, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, -3, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, -3, -6.088237, 0, 1.5, 0.5, 0.5,
-3.45621, -2, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, -2, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, -2, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, -2, -6.088237, 0, 1.5, 0.5, 0.5,
-3.45621, -1, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, -1, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, -1, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, -1, -6.088237, 0, 1.5, 0.5, 0.5,
-3.45621, 0, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, 0, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, 0, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, 0, -6.088237, 0, 1.5, 0.5, 0.5,
-3.45621, 1, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, 1, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, 1, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, 1, -6.088237, 0, 1.5, 0.5, 0.5,
-3.45621, 2, -6.088237, 0, -0.5, 0.5, 0.5,
-3.45621, 2, -6.088237, 1, -0.5, 0.5, 0.5,
-3.45621, 2, -6.088237, 1, 1.5, 0.5, 0.5,
-3.45621, 2, -6.088237, 0, 1.5, 0.5, 0.5
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
-2.991367, -3.332989, -4,
-2.991367, -3.332989, 4,
-2.991367, -3.332989, -4,
-3.146315, -3.493291, -4,
-2.991367, -3.332989, -2,
-3.146315, -3.493291, -2,
-2.991367, -3.332989, 0,
-3.146315, -3.493291, 0,
-2.991367, -3.332989, 2,
-3.146315, -3.493291, 2,
-2.991367, -3.332989, 4,
-3.146315, -3.493291, 4
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
-3.45621, -3.813894, -4, 0, -0.5, 0.5, 0.5,
-3.45621, -3.813894, -4, 1, -0.5, 0.5, 0.5,
-3.45621, -3.813894, -4, 1, 1.5, 0.5, 0.5,
-3.45621, -3.813894, -4, 0, 1.5, 0.5, 0.5,
-3.45621, -3.813894, -2, 0, -0.5, 0.5, 0.5,
-3.45621, -3.813894, -2, 1, -0.5, 0.5, 0.5,
-3.45621, -3.813894, -2, 1, 1.5, 0.5, 0.5,
-3.45621, -3.813894, -2, 0, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 0, 0, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 0, 1, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 0, 1, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 0, 0, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 2, 0, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 2, 1, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 2, 1, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 2, 0, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 4, 0, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 4, 1, -0.5, 0.5, 0.5,
-3.45621, -3.813894, 4, 1, 1.5, 0.5, 0.5,
-3.45621, -3.813894, 4, 0, 1.5, 0.5, 0.5
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
-2.991367, -3.332989, -5.304856,
-2.991367, 3.079079, -5.304856,
-2.991367, -3.332989, 5.140222,
-2.991367, 3.079079, 5.140222,
-2.991367, -3.332989, -5.304856,
-2.991367, -3.332989, 5.140222,
-2.991367, 3.079079, -5.304856,
-2.991367, 3.079079, 5.140222,
-2.991367, -3.332989, -5.304856,
3.206546, -3.332989, -5.304856,
-2.991367, -3.332989, 5.140222,
3.206546, -3.332989, 5.140222,
-2.991367, 3.079079, -5.304856,
3.206546, 3.079079, -5.304856,
-2.991367, 3.079079, 5.140222,
3.206546, 3.079079, 5.140222,
3.206546, -3.332989, -5.304856,
3.206546, 3.079079, -5.304856,
3.206546, -3.332989, 5.140222,
3.206546, 3.079079, 5.140222,
3.206546, -3.332989, -5.304856,
3.206546, -3.332989, 5.140222,
3.206546, 3.079079, -5.304856,
3.206546, 3.079079, 5.140222
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
var radius = 7.333799;
var distance = 32.62889;
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
mvMatrix.translate( -0.1075894, 0.1269553, 0.08231735 );
mvMatrix.scale( 1.279374, 1.236644, 0.7591563 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.62889);
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
benzylaminopurine<-read.table("benzylaminopurine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzylaminopurine$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
y<-benzylaminopurine$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
```

```r
z<-benzylaminopurine$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzylaminopurine' not found
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
-2.901106, 0.01069425, -0.6008178, 0, 0, 1, 1, 1,
-2.808995, 0.1914152, -0.3194648, 1, 0, 0, 1, 1,
-2.684387, 1.36449, -1.761438, 1, 0, 0, 1, 1,
-2.633722, -2.039836, -1.684923, 1, 0, 0, 1, 1,
-2.633393, 1.649164, -0.01245731, 1, 0, 0, 1, 1,
-2.539137, -0.02834066, -0.4038044, 1, 0, 0, 1, 1,
-2.477076, -1.209132, -3.597749, 0, 0, 0, 1, 1,
-2.43403, -1.553007, -2.890077, 0, 0, 0, 1, 1,
-2.350089, 1.506999, -1.822413, 0, 0, 0, 1, 1,
-2.319378, 0.01844274, -2.372109, 0, 0, 0, 1, 1,
-2.310023, 0.05958571, -1.290881, 0, 0, 0, 1, 1,
-2.288561, 0.1670944, -1.952464, 0, 0, 0, 1, 1,
-2.27185, -0.5634338, -3.425322, 0, 0, 0, 1, 1,
-2.249505, 0.2058841, -0.8200673, 1, 1, 1, 1, 1,
-2.228532, 0.01822814, -1.036851, 1, 1, 1, 1, 1,
-2.20671, 0.2057326, -0.4880055, 1, 1, 1, 1, 1,
-2.191791, 0.1349916, -3.109547, 1, 1, 1, 1, 1,
-2.188631, 0.1815002, -1.157951, 1, 1, 1, 1, 1,
-2.172999, 1.416573, 0.2657292, 1, 1, 1, 1, 1,
-2.162168, -0.9622529, -1.964051, 1, 1, 1, 1, 1,
-2.104755, 0.04957613, -1.800488, 1, 1, 1, 1, 1,
-2.092584, -0.9170042, -3.205145, 1, 1, 1, 1, 1,
-2.082393, -0.9017698, 0.5458864, 1, 1, 1, 1, 1,
-2.081252, 1.269033, -2.054529, 1, 1, 1, 1, 1,
-2.053849, -0.4001087, -0.5522592, 1, 1, 1, 1, 1,
-2.02035, 1.472798, 0.01661259, 1, 1, 1, 1, 1,
-1.938356, -1.214953, -2.703738, 1, 1, 1, 1, 1,
-1.892153, 0.08659708, -2.265251, 1, 1, 1, 1, 1,
-1.890493, 0.2283776, -1.081744, 0, 0, 1, 1, 1,
-1.887415, 0.6991935, -0.8122756, 1, 0, 0, 1, 1,
-1.882991, 0.7995661, -1.271012, 1, 0, 0, 1, 1,
-1.881117, 0.3987537, -0.5112185, 1, 0, 0, 1, 1,
-1.880696, 0.4624693, -1.840158, 1, 0, 0, 1, 1,
-1.84589, -0.579824, -1.286545, 1, 0, 0, 1, 1,
-1.817275, 0.5127846, -2.246433, 0, 0, 0, 1, 1,
-1.809452, -0.5034977, -1.099397, 0, 0, 0, 1, 1,
-1.806043, 0.2227121, -1.670418, 0, 0, 0, 1, 1,
-1.798369, 1.023441, -1.105091, 0, 0, 0, 1, 1,
-1.796731, 0.6478236, -0.8363423, 0, 0, 0, 1, 1,
-1.789126, 1.130842, -1.375121, 0, 0, 0, 1, 1,
-1.771405, 0.5558369, -0.444502, 0, 0, 0, 1, 1,
-1.770757, -0.3609844, -2.627476, 1, 1, 1, 1, 1,
-1.759246, 2.681215, 0.707141, 1, 1, 1, 1, 1,
-1.755719, -0.7062256, -2.452455, 1, 1, 1, 1, 1,
-1.755284, 0.1819171, -2.05406, 1, 1, 1, 1, 1,
-1.74493, 1.820195, -1.139364, 1, 1, 1, 1, 1,
-1.733145, 0.4667805, -0.9850993, 1, 1, 1, 1, 1,
-1.720054, -0.3074013, -1.34686, 1, 1, 1, 1, 1,
-1.7134, 1.074855, 1.19726, 1, 1, 1, 1, 1,
-1.710173, 0.1939079, -0.5105975, 1, 1, 1, 1, 1,
-1.709933, -0.7780336, 0.1243502, 1, 1, 1, 1, 1,
-1.70054, 1.881093, -1.042294, 1, 1, 1, 1, 1,
-1.650675, -0.1918858, -0.396013, 1, 1, 1, 1, 1,
-1.647316, -0.4629853, -0.5506466, 1, 1, 1, 1, 1,
-1.629513, -0.2668602, -2.849403, 1, 1, 1, 1, 1,
-1.628798, -1.502835, -3.276986, 1, 1, 1, 1, 1,
-1.60034, 0.4736626, -0.7693025, 0, 0, 1, 1, 1,
-1.597968, -0.6389906, -3.526144, 1, 0, 0, 1, 1,
-1.580619, 1.12137, -0.4694272, 1, 0, 0, 1, 1,
-1.576064, -0.1772624, -1.493029, 1, 0, 0, 1, 1,
-1.574274, -0.542558, -2.180851, 1, 0, 0, 1, 1,
-1.547485, -0.214692, -1.301488, 1, 0, 0, 1, 1,
-1.532693, 0.5044535, -1.598937, 0, 0, 0, 1, 1,
-1.522788, 1.028717, 0.2907835, 0, 0, 0, 1, 1,
-1.516147, 0.8924018, 0.3963458, 0, 0, 0, 1, 1,
-1.502964, -0.1654706, -1.568813, 0, 0, 0, 1, 1,
-1.500204, 0.6966412, -0.2089754, 0, 0, 0, 1, 1,
-1.494513, -0.6248223, -2.448436, 0, 0, 0, 1, 1,
-1.481416, -0.03494623, -0.6272579, 0, 0, 0, 1, 1,
-1.479425, -0.01324333, -1.304319, 1, 1, 1, 1, 1,
-1.455006, -0.1597781, -0.9285333, 1, 1, 1, 1, 1,
-1.453717, -2.202167, -1.084765, 1, 1, 1, 1, 1,
-1.447209, -0.327703, -2.530299, 1, 1, 1, 1, 1,
-1.445951, 0.1167114, -0.7586142, 1, 1, 1, 1, 1,
-1.444446, -0.9642292, -2.203721, 1, 1, 1, 1, 1,
-1.443812, -1.389123, -2.854198, 1, 1, 1, 1, 1,
-1.418597, 0.3310523, -0.4314436, 1, 1, 1, 1, 1,
-1.414054, -1.045042, -3.951041, 1, 1, 1, 1, 1,
-1.409393, 1.397803, -0.7471702, 1, 1, 1, 1, 1,
-1.408364, 1.201702, 0.7124442, 1, 1, 1, 1, 1,
-1.402414, 0.2175194, -2.351206, 1, 1, 1, 1, 1,
-1.395465, 0.2149069, 0.4585692, 1, 1, 1, 1, 1,
-1.395451, -0.5160187, -1.280258, 1, 1, 1, 1, 1,
-1.378998, -0.5080295, -1.955498, 1, 1, 1, 1, 1,
-1.375536, 0.6476473, -0.419909, 0, 0, 1, 1, 1,
-1.373981, 0.04807929, -0.2152461, 1, 0, 0, 1, 1,
-1.371983, 0.0222108, -1.690129, 1, 0, 0, 1, 1,
-1.365703, -0.07255851, -3.209448, 1, 0, 0, 1, 1,
-1.36286, 1.418089, 0.3010028, 1, 0, 0, 1, 1,
-1.362015, -1.628247, -1.93685, 1, 0, 0, 1, 1,
-1.358596, 1.288209, 0.01316905, 0, 0, 0, 1, 1,
-1.357774, -1.648566, -2.603273, 0, 0, 0, 1, 1,
-1.352421, -0.6869618, -1.020572, 0, 0, 0, 1, 1,
-1.346169, -0.4351945, -2.480316, 0, 0, 0, 1, 1,
-1.344999, -0.3251365, -1.327572, 0, 0, 0, 1, 1,
-1.342461, -0.07678548, -1.328964, 0, 0, 0, 1, 1,
-1.340091, 0.1656367, -0.8560701, 0, 0, 0, 1, 1,
-1.337378, 0.4450123, -0.9712397, 1, 1, 1, 1, 1,
-1.332757, -2.745137, -4.428455, 1, 1, 1, 1, 1,
-1.332505, -1.661659, -1.333623, 1, 1, 1, 1, 1,
-1.327372, -0.1774072, -1.283378, 1, 1, 1, 1, 1,
-1.319575, 0.1668135, -2.264608, 1, 1, 1, 1, 1,
-1.317632, -0.8843246, -3.262345, 1, 1, 1, 1, 1,
-1.310982, 0.2149582, -1.794412, 1, 1, 1, 1, 1,
-1.298722, 0.6282363, -1.949554, 1, 1, 1, 1, 1,
-1.296183, 0.3982584, -1.849249, 1, 1, 1, 1, 1,
-1.292331, -1.494063, -4.283277, 1, 1, 1, 1, 1,
-1.291423, 0.2658621, -0.9925599, 1, 1, 1, 1, 1,
-1.283257, -0.1107719, -2.30035, 1, 1, 1, 1, 1,
-1.280615, -0.3287758, -2.198079, 1, 1, 1, 1, 1,
-1.267299, -2.6491, -1.844463, 1, 1, 1, 1, 1,
-1.266504, 0.133352, -0.1302498, 1, 1, 1, 1, 1,
-1.257872, 1.293928, -1.530354, 0, 0, 1, 1, 1,
-1.242969, -0.0812393, -1.795894, 1, 0, 0, 1, 1,
-1.240698, 0.9960936, -1.304548, 1, 0, 0, 1, 1,
-1.236954, 0.02347195, -0.02051532, 1, 0, 0, 1, 1,
-1.235243, -0.3238202, -1.742064, 1, 0, 0, 1, 1,
-1.232111, 0.7286088, -2.583356, 1, 0, 0, 1, 1,
-1.224946, -0.1948078, -0.3357892, 0, 0, 0, 1, 1,
-1.223078, -0.4465141, -0.9214646, 0, 0, 0, 1, 1,
-1.219041, -0.6104246, -4.000354, 0, 0, 0, 1, 1,
-1.194195, 0.4589178, -1.826415, 0, 0, 0, 1, 1,
-1.188244, 0.01476577, -2.730536, 0, 0, 0, 1, 1,
-1.187301, 1.220315, -0.345974, 0, 0, 0, 1, 1,
-1.18628, -0.2718217, -0.292206, 0, 0, 0, 1, 1,
-1.184125, 0.18674, -1.531104, 1, 1, 1, 1, 1,
-1.166707, 0.07139288, -1.721196, 1, 1, 1, 1, 1,
-1.157308, -0.1975071, -0.4347236, 1, 1, 1, 1, 1,
-1.155108, -0.6940015, -2.310989, 1, 1, 1, 1, 1,
-1.15136, -0.3225571, -1.35307, 1, 1, 1, 1, 1,
-1.146142, -1.541675, -3.314191, 1, 1, 1, 1, 1,
-1.143296, -1.271732, -2.102768, 1, 1, 1, 1, 1,
-1.140372, 1.245226, -1.133885, 1, 1, 1, 1, 1,
-1.139028, -0.5662536, -1.591099, 1, 1, 1, 1, 1,
-1.136963, 0.6740062, -2.252661, 1, 1, 1, 1, 1,
-1.132519, 1.632219, -0.9916182, 1, 1, 1, 1, 1,
-1.124178, 1.892136, -0.2627785, 1, 1, 1, 1, 1,
-1.122991, 0.9650558, -1.112762, 1, 1, 1, 1, 1,
-1.113656, -0.3285228, -0.3519463, 1, 1, 1, 1, 1,
-1.112541, 0.08963197, -2.346024, 1, 1, 1, 1, 1,
-1.107172, -0.6845963, -1.220359, 0, 0, 1, 1, 1,
-1.106557, 0.6423069, -1.80789, 1, 0, 0, 1, 1,
-1.093979, 1.345515, 1.440733, 1, 0, 0, 1, 1,
-1.084263, -1.620495, -1.443873, 1, 0, 0, 1, 1,
-1.08079, 0.2518203, 0.1297021, 1, 0, 0, 1, 1,
-1.080464, -0.7945908, -3.754396, 1, 0, 0, 1, 1,
-1.071034, 1.673094, -1.59443, 0, 0, 0, 1, 1,
-1.065348, -0.3819956, -2.691166, 0, 0, 0, 1, 1,
-1.063257, 0.5442134, -0.711359, 0, 0, 0, 1, 1,
-1.060928, 1.41148, -2.808345, 0, 0, 0, 1, 1,
-1.052304, 0.9324316, 1.006758, 0, 0, 0, 1, 1,
-1.051906, 0.4937695, 1.076969, 0, 0, 0, 1, 1,
-1.046917, -0.4269885, -4.067821, 0, 0, 0, 1, 1,
-1.04317, 1.311509, -1.571972, 1, 1, 1, 1, 1,
-1.043028, 0.223533, -2.848654, 1, 1, 1, 1, 1,
-1.040972, 1.053869, -1.457524, 1, 1, 1, 1, 1,
-1.040687, -0.887821, -1.229493, 1, 1, 1, 1, 1,
-1.039088, -0.3172574, -2.114472, 1, 1, 1, 1, 1,
-1.024768, 0.3041307, -0.716463, 1, 1, 1, 1, 1,
-1.016183, -0.06118471, -1.87827, 1, 1, 1, 1, 1,
-1.014266, -0.07653797, -0.6648892, 1, 1, 1, 1, 1,
-1.011525, 0.05431714, -2.839093, 1, 1, 1, 1, 1,
-1.010977, -0.2694986, -4.133279, 1, 1, 1, 1, 1,
-1.006441, 0.6878701, -1.40282, 1, 1, 1, 1, 1,
-1.00146, 0.6994267, -0.5100351, 1, 1, 1, 1, 1,
-0.998226, -0.1509255, -2.397576, 1, 1, 1, 1, 1,
-0.9937499, -0.5164496, -0.4485371, 1, 1, 1, 1, 1,
-0.9910509, 1.158807, -0.5577804, 1, 1, 1, 1, 1,
-0.9885349, -0.2740601, -1.764141, 0, 0, 1, 1, 1,
-0.9703939, -0.9160969, -1.405358, 1, 0, 0, 1, 1,
-0.9586717, 1.274545, 0.4271524, 1, 0, 0, 1, 1,
-0.9507816, 0.3658493, -2.847221, 1, 0, 0, 1, 1,
-0.9386195, 0.2212501, -0.7013412, 1, 0, 0, 1, 1,
-0.9378194, -0.7269186, -1.841398, 1, 0, 0, 1, 1,
-0.9365391, 0.1596391, -1.566452, 0, 0, 0, 1, 1,
-0.9319693, 1.240279, -1.626268, 0, 0, 0, 1, 1,
-0.9286965, -0.1691736, -1.236834, 0, 0, 0, 1, 1,
-0.925043, -1.090492, -2.155312, 0, 0, 0, 1, 1,
-0.9220938, 0.3803741, -2.288281, 0, 0, 0, 1, 1,
-0.9186273, 0.9123436, -1.037913, 0, 0, 0, 1, 1,
-0.9134033, -1.16025, -2.39661, 0, 0, 0, 1, 1,
-0.9121427, -1.850135, -2.582712, 1, 1, 1, 1, 1,
-0.9013337, 1.103307, -2.147671, 1, 1, 1, 1, 1,
-0.9003476, 0.5129493, -1.005015, 1, 1, 1, 1, 1,
-0.8921685, 1.103946, -2.30823, 1, 1, 1, 1, 1,
-0.8867531, 0.7278641, -0.3445946, 1, 1, 1, 1, 1,
-0.8822263, 0.1798798, -1.218963, 1, 1, 1, 1, 1,
-0.8745175, 0.2446939, -2.294967, 1, 1, 1, 1, 1,
-0.8647211, 1.00966, 0.2174725, 1, 1, 1, 1, 1,
-0.8631256, 0.9770479, -0.07451227, 1, 1, 1, 1, 1,
-0.8606831, 1.077445, -0.3597729, 1, 1, 1, 1, 1,
-0.8587193, -1.413913, -4.37018, 1, 1, 1, 1, 1,
-0.8578055, -0.4528403, -3.098873, 1, 1, 1, 1, 1,
-0.8569757, 1.457717, -0.7091419, 1, 1, 1, 1, 1,
-0.84957, -0.4840435, -1.64593, 1, 1, 1, 1, 1,
-0.8446195, 0.3880299, -1.683002, 1, 1, 1, 1, 1,
-0.8363273, 0.05039462, -1.084814, 0, 0, 1, 1, 1,
-0.8310527, -1.226037, -2.29464, 1, 0, 0, 1, 1,
-0.8297625, 0.7586085, -0.9704272, 1, 0, 0, 1, 1,
-0.827996, 1.3213, -0.8629798, 1, 0, 0, 1, 1,
-0.8226495, -0.0752469, 0.8220714, 1, 0, 0, 1, 1,
-0.8200263, 0.002814737, -0.01199546, 1, 0, 0, 1, 1,
-0.818427, 0.2431716, -2.886389, 0, 0, 0, 1, 1,
-0.8162, 0.3318145, -2.036953, 0, 0, 0, 1, 1,
-0.8107634, 0.3675224, -1.60656, 0, 0, 0, 1, 1,
-0.8101432, -0.6157321, -3.220186, 0, 0, 0, 1, 1,
-0.8018533, 0.1242477, -1.491851, 0, 0, 0, 1, 1,
-0.7999802, -0.08842286, -3.16966, 0, 0, 0, 1, 1,
-0.7938434, -0.7170969, -3.248039, 0, 0, 0, 1, 1,
-0.7933547, 0.2567802, -1.322425, 1, 1, 1, 1, 1,
-0.7811086, -0.1140227, -2.355613, 1, 1, 1, 1, 1,
-0.7756414, -1.255837, -2.457046, 1, 1, 1, 1, 1,
-0.7742497, 0.2880233, -1.788675, 1, 1, 1, 1, 1,
-0.7727687, -0.9171447, -3.06456, 1, 1, 1, 1, 1,
-0.7684885, -0.07335228, -0.8383319, 1, 1, 1, 1, 1,
-0.7675131, 0.8291727, -1.236288, 1, 1, 1, 1, 1,
-0.7661241, -0.3314697, -2.808628, 1, 1, 1, 1, 1,
-0.7621044, 0.2126871, -1.624511, 1, 1, 1, 1, 1,
-0.7607428, -0.1291236, 0.6789179, 1, 1, 1, 1, 1,
-0.7538815, -1.217478, -3.065096, 1, 1, 1, 1, 1,
-0.7532361, -0.5649185, -2.342953, 1, 1, 1, 1, 1,
-0.7503535, 0.1597047, -0.9616579, 1, 1, 1, 1, 1,
-0.7476806, -0.207324, -0.5360097, 1, 1, 1, 1, 1,
-0.7369844, 2.985699, 0.02989246, 1, 1, 1, 1, 1,
-0.7298422, -1.818192, -3.079577, 0, 0, 1, 1, 1,
-0.7242826, -0.252515, -0.9112988, 1, 0, 0, 1, 1,
-0.7215006, -0.6325662, -1.736859, 1, 0, 0, 1, 1,
-0.7120712, -0.2101665, -2.634073, 1, 0, 0, 1, 1,
-0.7103089, 1.019093, -0.7547349, 1, 0, 0, 1, 1,
-0.7101885, 0.7512052, 0.3255606, 1, 0, 0, 1, 1,
-0.7099987, 0.7901897, 0.4705084, 0, 0, 0, 1, 1,
-0.7073078, 1.871372, 0.7950699, 0, 0, 0, 1, 1,
-0.6988933, -0.7585778, -2.14212, 0, 0, 0, 1, 1,
-0.6903692, 0.6662374, -2.421948, 0, 0, 0, 1, 1,
-0.6889019, 1.509098, 0.08806591, 0, 0, 0, 1, 1,
-0.6867305, -1.609692, -2.456393, 0, 0, 0, 1, 1,
-0.6859189, -1.037503, -2.634948, 0, 0, 0, 1, 1,
-0.6824678, 1.454234, 0.6328201, 1, 1, 1, 1, 1,
-0.6790621, -0.2420746, -2.845519, 1, 1, 1, 1, 1,
-0.6781226, 1.043744, -1.343446, 1, 1, 1, 1, 1,
-0.6777627, -0.8321141, -1.538619, 1, 1, 1, 1, 1,
-0.6765172, -1.552649, -3.460014, 1, 1, 1, 1, 1,
-0.670708, -0.5106481, -2.258826, 1, 1, 1, 1, 1,
-0.6656497, 0.9387458, 0.2540178, 1, 1, 1, 1, 1,
-0.6634364, 2.001304, -1.580412, 1, 1, 1, 1, 1,
-0.6633571, 0.6526082, -2.116376, 1, 1, 1, 1, 1,
-0.6632915, 0.2472038, -1.214687, 1, 1, 1, 1, 1,
-0.6626241, -0.9482254, -2.240874, 1, 1, 1, 1, 1,
-0.6479788, -0.3587984, -0.8796909, 1, 1, 1, 1, 1,
-0.6469531, 1.122339, -0.5905077, 1, 1, 1, 1, 1,
-0.6434827, 0.4746935, 0.225943, 1, 1, 1, 1, 1,
-0.6429986, 0.6530301, -1.515765, 1, 1, 1, 1, 1,
-0.6395782, -0.02665395, -2.433663, 0, 0, 1, 1, 1,
-0.6380845, 1.210276, -1.080353, 1, 0, 0, 1, 1,
-0.6361704, -0.7919883, -2.439724, 1, 0, 0, 1, 1,
-0.6329268, 1.356503, -1.9397, 1, 0, 0, 1, 1,
-0.6258093, 1.22384, -1.707299, 1, 0, 0, 1, 1,
-0.6252384, 0.7565932, 0.9933379, 1, 0, 0, 1, 1,
-0.6246954, 0.9282328, -0.0883429, 0, 0, 0, 1, 1,
-0.6237575, -1.515619, -2.375338, 0, 0, 0, 1, 1,
-0.6236322, 0.3479151, -1.928399, 0, 0, 0, 1, 1,
-0.6177067, 1.678968, 0.08167575, 0, 0, 0, 1, 1,
-0.6135907, 1.471963, -1.215163, 0, 0, 0, 1, 1,
-0.6121746, -1.057668, -2.786213, 0, 0, 0, 1, 1,
-0.6108835, 0.4643757, -1.463076, 0, 0, 0, 1, 1,
-0.6107368, -0.3128175, -3.535283, 1, 1, 1, 1, 1,
-0.6072975, -0.6151616, -3.076885, 1, 1, 1, 1, 1,
-0.6062359, -0.1942013, -2.730698, 1, 1, 1, 1, 1,
-0.6060424, -0.6663037, -2.550903, 1, 1, 1, 1, 1,
-0.602254, -0.6879718, -1.83591, 1, 1, 1, 1, 1,
-0.6017852, -2.215658, -3.389364, 1, 1, 1, 1, 1,
-0.6013745, -0.02126318, -2.577187, 1, 1, 1, 1, 1,
-0.6008719, 0.305419, -3.142851, 1, 1, 1, 1, 1,
-0.59736, -0.7027518, -2.164601, 1, 1, 1, 1, 1,
-0.593522, -0.4844396, -1.49609, 1, 1, 1, 1, 1,
-0.5927187, -0.3361261, -3.190003, 1, 1, 1, 1, 1,
-0.5907942, 0.06153077, -2.786399, 1, 1, 1, 1, 1,
-0.5904378, 0.4257303, -0.6340159, 1, 1, 1, 1, 1,
-0.5895853, 0.2736687, -0.553426, 1, 1, 1, 1, 1,
-0.5840409, 0.8400136, -1.236136, 1, 1, 1, 1, 1,
-0.580565, 0.7726614, 0.07811916, 0, 0, 1, 1, 1,
-0.5804136, -1.199672, -3.67642, 1, 0, 0, 1, 1,
-0.5802261, 0.0856823, -2.799334, 1, 0, 0, 1, 1,
-0.57824, -0.2967607, -1.953335, 1, 0, 0, 1, 1,
-0.5766185, 1.077497, -0.9833311, 1, 0, 0, 1, 1,
-0.5759299, -0.5321755, -2.432702, 1, 0, 0, 1, 1,
-0.5754324, -2.417405, -2.934812, 0, 0, 0, 1, 1,
-0.5733925, 1.333575, 0.8190868, 0, 0, 0, 1, 1,
-0.5719584, -1.715029, -1.278698, 0, 0, 0, 1, 1,
-0.5685803, 0.3240844, -1.322154, 0, 0, 0, 1, 1,
-0.5652307, -0.427889, -2.068243, 0, 0, 0, 1, 1,
-0.5621006, 1.542117, 2.031338, 0, 0, 0, 1, 1,
-0.560199, 2.177953, -2.24462, 0, 0, 0, 1, 1,
-0.554041, 0.2683574, -1.093388, 1, 1, 1, 1, 1,
-0.5516584, 0.06382637, -2.007198, 1, 1, 1, 1, 1,
-0.5513462, 0.2347728, -0.9227102, 1, 1, 1, 1, 1,
-0.5504884, 0.7455015, -1.857499, 1, 1, 1, 1, 1,
-0.5492015, -0.8397835, -3.921884, 1, 1, 1, 1, 1,
-0.5489153, -0.3378075, -3.687748, 1, 1, 1, 1, 1,
-0.548327, 0.05595929, 0.3340761, 1, 1, 1, 1, 1,
-0.5475864, -0.07457139, -1.635554, 1, 1, 1, 1, 1,
-0.5429944, -0.001116377, -2.927536, 1, 1, 1, 1, 1,
-0.5408019, 0.2687846, -1.173695, 1, 1, 1, 1, 1,
-0.5393276, -1.040152, -2.205465, 1, 1, 1, 1, 1,
-0.5383259, -0.214004, -2.288301, 1, 1, 1, 1, 1,
-0.533523, 0.2150526, -0.6360779, 1, 1, 1, 1, 1,
-0.5292255, 0.3679865, -0.1489018, 1, 1, 1, 1, 1,
-0.5197827, 1.528584, 0.3432764, 1, 1, 1, 1, 1,
-0.5197179, -2.188507, -1.34551, 0, 0, 1, 1, 1,
-0.5182265, -0.5644307, -0.787777, 1, 0, 0, 1, 1,
-0.5039852, 0.0877373, 0.7385365, 1, 0, 0, 1, 1,
-0.5038049, 0.1668507, -1.001432, 1, 0, 0, 1, 1,
-0.5003101, -0.6013939, -2.70995, 1, 0, 0, 1, 1,
-0.4990613, 1.200731, -1.131416, 1, 0, 0, 1, 1,
-0.4944917, 0.2087862, -1.609723, 0, 0, 0, 1, 1,
-0.4942184, -1.206017, -3.359352, 0, 0, 0, 1, 1,
-0.4915533, -0.3894438, -2.054556, 0, 0, 0, 1, 1,
-0.4875169, 0.584496, -0.5874387, 0, 0, 0, 1, 1,
-0.486557, 1.520733, -0.2783805, 0, 0, 0, 1, 1,
-0.4860165, 0.2809778, -1.786573, 0, 0, 0, 1, 1,
-0.4727295, -0.2340133, -2.061655, 0, 0, 0, 1, 1,
-0.4712734, -1.71294, -1.528646, 1, 1, 1, 1, 1,
-0.4698055, -0.1381946, -1.60021, 1, 1, 1, 1, 1,
-0.4697976, -1.394191, -4.076289, 1, 1, 1, 1, 1,
-0.4676532, 1.010448, -1.084329, 1, 1, 1, 1, 1,
-0.4674793, 0.1183169, -2.637532, 1, 1, 1, 1, 1,
-0.4634534, -0.5963051, -2.525213, 1, 1, 1, 1, 1,
-0.4569224, 0.9213321, 1.130107, 1, 1, 1, 1, 1,
-0.4505877, 1.561978, -0.4199576, 1, 1, 1, 1, 1,
-0.449791, 0.727882, 1.155958, 1, 1, 1, 1, 1,
-0.4496154, 0.009975487, -1.949276, 1, 1, 1, 1, 1,
-0.4488983, -1.535586, -3.746435, 1, 1, 1, 1, 1,
-0.4488415, -1.309904, -3.590257, 1, 1, 1, 1, 1,
-0.4469298, 0.5028065, -2.100938, 1, 1, 1, 1, 1,
-0.4395774, 0.875304, -0.9635985, 1, 1, 1, 1, 1,
-0.4380091, 0.01429998, -1.225446, 1, 1, 1, 1, 1,
-0.437509, 0.7244707, -0.2516122, 0, 0, 1, 1, 1,
-0.4323932, 0.1627787, -0.2561337, 1, 0, 0, 1, 1,
-0.4319691, 0.1710983, -0.5648509, 1, 0, 0, 1, 1,
-0.4316085, 0.4582866, -0.6228031, 1, 0, 0, 1, 1,
-0.4299733, 0.3783173, -1.859667, 1, 0, 0, 1, 1,
-0.4265658, 0.4024048, 0.0501051, 1, 0, 0, 1, 1,
-0.4256991, -2.08851, -2.549463, 0, 0, 0, 1, 1,
-0.4243732, -0.5183924, -0.4941199, 0, 0, 0, 1, 1,
-0.4240089, -0.1047726, -2.689731, 0, 0, 0, 1, 1,
-0.4229266, -2.737504, -2.383627, 0, 0, 0, 1, 1,
-0.4228583, 0.6818846, 0.5039878, 0, 0, 0, 1, 1,
-0.4171097, 0.5635309, -0.8547954, 0, 0, 0, 1, 1,
-0.415471, -0.899672, -3.187447, 0, 0, 0, 1, 1,
-0.4137616, -1.368114, -4.156555, 1, 1, 1, 1, 1,
-0.4086315, 0.6415286, -1.194643, 1, 1, 1, 1, 1,
-0.4078365, -0.4839576, -3.694119, 1, 1, 1, 1, 1,
-0.4069959, 0.6521707, -0.7237917, 1, 1, 1, 1, 1,
-0.4057722, 0.8925272, 1.603757, 1, 1, 1, 1, 1,
-0.405228, 0.2634353, -0.8125696, 1, 1, 1, 1, 1,
-0.4040517, -0.8403264, -1.748094, 1, 1, 1, 1, 1,
-0.3992377, -0.1641336, -1.029119, 1, 1, 1, 1, 1,
-0.3945141, -0.7587258, -0.8751362, 1, 1, 1, 1, 1,
-0.393258, 1.244448, 0.07094457, 1, 1, 1, 1, 1,
-0.3919899, -0.6252491, -3.212126, 1, 1, 1, 1, 1,
-0.3830698, 1.196243, -0.4253232, 1, 1, 1, 1, 1,
-0.3824256, -1.227873, -1.803699, 1, 1, 1, 1, 1,
-0.3781162, 0.2582592, -1.666965, 1, 1, 1, 1, 1,
-0.3679412, -0.08768573, -2.000233, 1, 1, 1, 1, 1,
-0.3643416, 0.7702852, -1.230732, 0, 0, 1, 1, 1,
-0.3640549, 1.526595, -0.3861304, 1, 0, 0, 1, 1,
-0.3625118, 1.728835, -0.8650765, 1, 0, 0, 1, 1,
-0.3604414, -1.622621, -2.12302, 1, 0, 0, 1, 1,
-0.3597769, 0.8246657, -0.5782532, 1, 0, 0, 1, 1,
-0.3593821, -2.076952, -3.437082, 1, 0, 0, 1, 1,
-0.3558723, 0.8848783, -0.08064405, 0, 0, 0, 1, 1,
-0.349958, -0.5744855, -2.636653, 0, 0, 0, 1, 1,
-0.349209, -0.635971, -1.930547, 0, 0, 0, 1, 1,
-0.3447935, 0.08253276, -0.6628686, 0, 0, 0, 1, 1,
-0.3440749, -1.36108, -1.318045, 0, 0, 0, 1, 1,
-0.3439593, 0.687977, -0.4438786, 0, 0, 0, 1, 1,
-0.3317006, 2.167948, -0.1359492, 0, 0, 0, 1, 1,
-0.3314939, -1.704645, -3.056607, 1, 1, 1, 1, 1,
-0.330699, -1.47036, -4.003846, 1, 1, 1, 1, 1,
-0.3305946, 2.411643, -0.6747444, 1, 1, 1, 1, 1,
-0.3262828, -0.3843592, -2.278677, 1, 1, 1, 1, 1,
-0.3135013, -1.469545, -3.175097, 1, 1, 1, 1, 1,
-0.3127084, 0.8117499, -1.392568, 1, 1, 1, 1, 1,
-0.309072, 0.5479064, 0.5017214, 1, 1, 1, 1, 1,
-0.304223, 0.7205567, -0.5770127, 1, 1, 1, 1, 1,
-0.2994543, 1.660008, 0.5218294, 1, 1, 1, 1, 1,
-0.2963891, 0.278265, -0.3735595, 1, 1, 1, 1, 1,
-0.2958415, -1.454363, -3.734299, 1, 1, 1, 1, 1,
-0.2858516, 0.3223788, -0.3928886, 1, 1, 1, 1, 1,
-0.2855374, -0.5468184, -3.209131, 1, 1, 1, 1, 1,
-0.281255, -0.8918338, -3.277869, 1, 1, 1, 1, 1,
-0.2781978, -1.628774, -2.406891, 1, 1, 1, 1, 1,
-0.276266, -0.6734205, -2.592974, 0, 0, 1, 1, 1,
-0.2758422, 0.06089439, -1.963521, 1, 0, 0, 1, 1,
-0.2736094, -1.727036, -2.343419, 1, 0, 0, 1, 1,
-0.2702422, 0.1106164, -1.320051, 1, 0, 0, 1, 1,
-0.2689728, -1.354604, -3.831632, 1, 0, 0, 1, 1,
-0.2674279, 0.9423909, 0.1041372, 1, 0, 0, 1, 1,
-0.2672544, -0.6181147, -3.020954, 0, 0, 0, 1, 1,
-0.2667368, -0.4767901, -3.660304, 0, 0, 0, 1, 1,
-0.264712, -1.178997, -3.213614, 0, 0, 0, 1, 1,
-0.2590897, -1.717161, -1.542383, 0, 0, 0, 1, 1,
-0.2585976, -0.1598713, -2.47828, 0, 0, 0, 1, 1,
-0.2579983, 0.7291862, -0.4974592, 0, 0, 0, 1, 1,
-0.2577018, 0.03342088, -0.5588836, 0, 0, 0, 1, 1,
-0.2572581, 0.09738702, -2.746748, 1, 1, 1, 1, 1,
-0.2558969, -0.2921534, -3.127647, 1, 1, 1, 1, 1,
-0.2554354, -0.854373, -3.079083, 1, 1, 1, 1, 1,
-0.2521695, 1.15098, -0.0834956, 1, 1, 1, 1, 1,
-0.2519532, -1.479645, -5.152743, 1, 1, 1, 1, 1,
-0.2474363, 1.18596, -0.9625049, 1, 1, 1, 1, 1,
-0.2455772, -2.05679, -2.420661, 1, 1, 1, 1, 1,
-0.2436935, -1.821937, -2.863742, 1, 1, 1, 1, 1,
-0.2432827, 1.55378, 0.3191865, 1, 1, 1, 1, 1,
-0.2395565, -0.5476837, -2.806066, 1, 1, 1, 1, 1,
-0.2380389, -1.095502, -3.680926, 1, 1, 1, 1, 1,
-0.2323621, -0.1606934, -3.463091, 1, 1, 1, 1, 1,
-0.2316516, -0.9813383, -3.792128, 1, 1, 1, 1, 1,
-0.2312535, 0.9684438, -0.7072557, 1, 1, 1, 1, 1,
-0.2288228, 0.7824254, -1.136432, 1, 1, 1, 1, 1,
-0.2239768, -0.7615316, -1.474292, 0, 0, 1, 1, 1,
-0.2236797, 1.17843, -0.08694734, 1, 0, 0, 1, 1,
-0.2226691, -2.522417, -1.520347, 1, 0, 0, 1, 1,
-0.2223454, 0.8229823, 0.5847393, 1, 0, 0, 1, 1,
-0.2170409, 1.40473, 0.5088789, 1, 0, 0, 1, 1,
-0.2152115, 0.3410066, 0.08298954, 1, 0, 0, 1, 1,
-0.2137171, -0.07937958, -1.860427, 0, 0, 0, 1, 1,
-0.2133569, 1.018465, -1.870549, 0, 0, 0, 1, 1,
-0.2061676, -0.4215147, -2.459154, 0, 0, 0, 1, 1,
-0.2049216, 2.350717, -0.461474, 0, 0, 0, 1, 1,
-0.2033838, 1.222321, 0.4235671, 0, 0, 0, 1, 1,
-0.1998044, 2.002867, 1.253572, 0, 0, 0, 1, 1,
-0.1985826, 0.1898695, -1.234111, 0, 0, 0, 1, 1,
-0.1939663, 0.894438, -0.2738698, 1, 1, 1, 1, 1,
-0.1887789, -1.427067, -2.439088, 1, 1, 1, 1, 1,
-0.1860312, 1.539024, 0.1748363, 1, 1, 1, 1, 1,
-0.1824248, 1.609146, 0.9856472, 1, 1, 1, 1, 1,
-0.174783, 2.844757, -0.1253373, 1, 1, 1, 1, 1,
-0.1742096, -0.8376347, -2.886232, 1, 1, 1, 1, 1,
-0.1704522, 0.8812983, 0.4040195, 1, 1, 1, 1, 1,
-0.1667409, -0.3414787, -1.640514, 1, 1, 1, 1, 1,
-0.1667185, -0.1100756, -2.930927, 1, 1, 1, 1, 1,
-0.1666567, -0.5764191, -1.291711, 1, 1, 1, 1, 1,
-0.1621968, 1.062028, -0.3630964, 1, 1, 1, 1, 1,
-0.1577668, 0.2849441, -1.123452, 1, 1, 1, 1, 1,
-0.1542019, -1.478479, -3.682512, 1, 1, 1, 1, 1,
-0.1505818, 0.2101063, -0.5549038, 1, 1, 1, 1, 1,
-0.1424402, -0.846209, -3.278379, 1, 1, 1, 1, 1,
-0.1423789, -1.489449, -2.309483, 0, 0, 1, 1, 1,
-0.134725, 0.8972022, 0.08979677, 1, 0, 0, 1, 1,
-0.1323888, 0.4943759, -0.3192906, 1, 0, 0, 1, 1,
-0.1303643, 0.06820855, -1.513563, 1, 0, 0, 1, 1,
-0.1295199, -1.659431, -2.541996, 1, 0, 0, 1, 1,
-0.1260503, -1.494693, -4.692121, 1, 0, 0, 1, 1,
-0.1239048, -1.095446, -2.662779, 0, 0, 0, 1, 1,
-0.1236627, -1.763821, -3.720925, 0, 0, 0, 1, 1,
-0.1223489, -1.066292, -3.023489, 0, 0, 0, 1, 1,
-0.1210814, 0.4100262, -1.03881, 0, 0, 0, 1, 1,
-0.1094016, 1.48014, -0.2634658, 0, 0, 0, 1, 1,
-0.1090899, 0.1266284, -2.566464, 0, 0, 0, 1, 1,
-0.1076528, -0.4590299, -4.602781, 0, 0, 0, 1, 1,
-0.1052152, -2.252609, -4.355044, 1, 1, 1, 1, 1,
-0.1028605, 0.3382713, 0.9143786, 1, 1, 1, 1, 1,
-0.09242975, 0.4954118, -0.5795349, 1, 1, 1, 1, 1,
-0.08939812, -0.328909, -4.212946, 1, 1, 1, 1, 1,
-0.08902081, 1.471782, -1.33683, 1, 1, 1, 1, 1,
-0.08195131, 0.508697, -0.07725247, 1, 1, 1, 1, 1,
-0.08174016, 1.564738, -0.0633302, 1, 1, 1, 1, 1,
-0.07815246, 1.845796, -0.3823449, 1, 1, 1, 1, 1,
-0.06737922, 0.4036225, -1.472359, 1, 1, 1, 1, 1,
-0.06683762, -1.289636, -2.795489, 1, 1, 1, 1, 1,
-0.06511351, -2.330679, -4.46558, 1, 1, 1, 1, 1,
-0.06186954, 0.6965982, -0.7318878, 1, 1, 1, 1, 1,
-0.06132796, 0.8282226, -1.257611, 1, 1, 1, 1, 1,
-0.0611106, -1.437478, -3.161951, 1, 1, 1, 1, 1,
-0.05767611, -1.043489, -3.819189, 1, 1, 1, 1, 1,
-0.056371, 0.731117, -1.672732, 0, 0, 1, 1, 1,
-0.05543351, -0.5057516, -3.213746, 1, 0, 0, 1, 1,
-0.05474428, 0.6890196, -0.5089869, 1, 0, 0, 1, 1,
-0.05073993, 0.7943962, 0.5198938, 1, 0, 0, 1, 1,
-0.05053544, 0.6396392, 1.937423, 1, 0, 0, 1, 1,
-0.04970008, 0.1794829, 0.7590197, 1, 0, 0, 1, 1,
-0.0480122, 0.2556715, 0.2313098, 0, 0, 0, 1, 1,
-0.04794656, -1.337741, -4.000625, 0, 0, 0, 1, 1,
-0.04769079, -0.03318749, -4.235223, 0, 0, 0, 1, 1,
-0.04506685, -1.177284, -3.53172, 0, 0, 0, 1, 1,
-0.02380876, -1.450649, -3.260818, 0, 0, 0, 1, 1,
-0.02305638, -0.9550038, -2.37727, 0, 0, 0, 1, 1,
-0.01082626, 1.124372, 0.01692211, 0, 0, 0, 1, 1,
-0.01032752, -0.1293639, -3.26812, 1, 1, 1, 1, 1,
-0.0008227059, 2.155022, 0.1167866, 1, 1, 1, 1, 1,
8.670081e-05, -1.672555, 3.596902, 1, 1, 1, 1, 1,
0.001520347, 1.172414, -0.6853896, 1, 1, 1, 1, 1,
0.005196062, 0.4830909, 1.294168, 1, 1, 1, 1, 1,
0.005524824, 0.5348756, 1.690076, 1, 1, 1, 1, 1,
0.006285403, 0.06020384, -0.1842001, 1, 1, 1, 1, 1,
0.006630247, -1.287634, 2.605501, 1, 1, 1, 1, 1,
0.007047893, 0.2561599, 0.2968777, 1, 1, 1, 1, 1,
0.007647098, -0.6344603, 3.1346, 1, 1, 1, 1, 1,
0.0118847, -0.1030134, 2.435464, 1, 1, 1, 1, 1,
0.01269275, 0.05173773, -0.08620393, 1, 1, 1, 1, 1,
0.01475644, 0.216469, 0.2032332, 1, 1, 1, 1, 1,
0.01483145, -0.8024997, 2.465582, 1, 1, 1, 1, 1,
0.01986924, 0.9418045, 0.06598893, 1, 1, 1, 1, 1,
0.02276634, -0.3000211, 4.113614, 0, 0, 1, 1, 1,
0.02319164, 1.814766, 0.7115834, 1, 0, 0, 1, 1,
0.02723107, 1.66231, -0.1163333, 1, 0, 0, 1, 1,
0.02749453, -0.6722854, 1.980337, 1, 0, 0, 1, 1,
0.02982613, 1.331894, 0.6294761, 1, 0, 0, 1, 1,
0.03286471, -0.6325039, 4.577004, 1, 0, 0, 1, 1,
0.03367025, 0.6867518, 0.4269165, 0, 0, 0, 1, 1,
0.03385447, -0.6431385, 1.505427, 0, 0, 0, 1, 1,
0.03471572, -0.3992657, 3.518218, 0, 0, 0, 1, 1,
0.03485564, 1.446757, 0.4985307, 0, 0, 0, 1, 1,
0.03650614, -1.117883, 2.439354, 0, 0, 0, 1, 1,
0.037189, -0.8084784, 2.604935, 0, 0, 0, 1, 1,
0.03785403, -0.2477609, 4.142016, 0, 0, 0, 1, 1,
0.04044979, -0.8108463, 3.375971, 1, 1, 1, 1, 1,
0.04406203, -0.05846811, 0.8949139, 1, 1, 1, 1, 1,
0.04766714, -0.3758439, 2.10307, 1, 1, 1, 1, 1,
0.05378556, -2.214013, 2.528959, 1, 1, 1, 1, 1,
0.05627152, -1.188439, 4.018414, 1, 1, 1, 1, 1,
0.06106133, -0.0179992, 1.854403, 1, 1, 1, 1, 1,
0.06174541, 0.9668115, 0.7236576, 1, 1, 1, 1, 1,
0.06405424, -0.7532012, 2.650769, 1, 1, 1, 1, 1,
0.06511384, -1.333668, 4.246497, 1, 1, 1, 1, 1,
0.06633824, -0.7854268, 4.06771, 1, 1, 1, 1, 1,
0.07118455, 1.244972, -0.1738987, 1, 1, 1, 1, 1,
0.07305337, -0.2967689, 3.597346, 1, 1, 1, 1, 1,
0.07494864, 0.4407124, -0.7311324, 1, 1, 1, 1, 1,
0.07986993, 0.2738934, 1.675136, 1, 1, 1, 1, 1,
0.08474647, 1.967993, 0.04995932, 1, 1, 1, 1, 1,
0.08829564, -0.9718626, 3.081878, 0, 0, 1, 1, 1,
0.0890832, -0.5017687, 3.440368, 1, 0, 0, 1, 1,
0.08927828, -0.5216782, 3.602938, 1, 0, 0, 1, 1,
0.09064194, 0.441343, 0.4062906, 1, 0, 0, 1, 1,
0.09390887, -0.7224033, 2.461845, 1, 0, 0, 1, 1,
0.09682032, -0.2914126, 1.425295, 1, 0, 0, 1, 1,
0.1009909, -1.035765, 2.258166, 0, 0, 0, 1, 1,
0.1015929, -0.4464526, 2.639929, 0, 0, 0, 1, 1,
0.1041428, -0.1106242, 0.5647146, 0, 0, 0, 1, 1,
0.1088929, -0.4027968, 4.032035, 0, 0, 0, 1, 1,
0.1103518, -0.9582229, 3.438088, 0, 0, 0, 1, 1,
0.1122592, -1.297294, 1.92254, 0, 0, 0, 1, 1,
0.1189136, -1.677803, 3.744479, 0, 0, 0, 1, 1,
0.1217442, 0.6823007, -1.044099, 1, 1, 1, 1, 1,
0.1238027, -0.3189702, 2.94896, 1, 1, 1, 1, 1,
0.1252816, 2.063281, 0.4273823, 1, 1, 1, 1, 1,
0.1258508, -0.01601779, 2.735177, 1, 1, 1, 1, 1,
0.1260733, 1.064795, 0.04432535, 1, 1, 1, 1, 1,
0.1300517, -0.865316, 4.002166, 1, 1, 1, 1, 1,
0.1333004, -2.047102, 3.526067, 1, 1, 1, 1, 1,
0.137887, -1.952613, 1.313192, 1, 1, 1, 1, 1,
0.1393173, 0.8420868, -0.6905705, 1, 1, 1, 1, 1,
0.1405133, 0.07451031, 1.00086, 1, 1, 1, 1, 1,
0.1430376, 0.4347257, -1.171223, 1, 1, 1, 1, 1,
0.1431384, 0.7893458, 0.9593404, 1, 1, 1, 1, 1,
0.1532539, -2.046324, 3.468201, 1, 1, 1, 1, 1,
0.153826, -1.234493, 0.5410029, 1, 1, 1, 1, 1,
0.1541712, 0.2890454, 2.099885, 1, 1, 1, 1, 1,
0.1595111, 0.5631083, 1.311731, 0, 0, 1, 1, 1,
0.1599995, -0.3966647, 1.872701, 1, 0, 0, 1, 1,
0.1603456, -1.067154, 2.381526, 1, 0, 0, 1, 1,
0.1620865, 1.439956, 0.5204384, 1, 0, 0, 1, 1,
0.1641359, 0.4313933, -0.5572961, 1, 0, 0, 1, 1,
0.1647002, 0.6511275, 0.1723211, 1, 0, 0, 1, 1,
0.1676337, 1.488739, -0.5924698, 0, 0, 0, 1, 1,
0.1718176, -0.08662096, 2.438188, 0, 0, 0, 1, 1,
0.1727525, 0.8107132, -0.2349332, 0, 0, 0, 1, 1,
0.1730474, -0.7442983, 1.998799, 0, 0, 0, 1, 1,
0.1766796, -1.073823, 3.283596, 0, 0, 0, 1, 1,
0.1770865, -0.9367535, 1.582314, 0, 0, 0, 1, 1,
0.1772955, -0.1001014, 0.7130954, 0, 0, 0, 1, 1,
0.1802077, -0.7792844, 2.703073, 1, 1, 1, 1, 1,
0.185289, -0.8967239, 3.686287, 1, 1, 1, 1, 1,
0.1853352, 0.3617176, 0.2904533, 1, 1, 1, 1, 1,
0.1884037, 0.5846, 0.9922497, 1, 1, 1, 1, 1,
0.1915193, 0.5288095, -1.238528, 1, 1, 1, 1, 1,
0.1925382, -0.8568603, 3.395726, 1, 1, 1, 1, 1,
0.1942086, -0.68755, 3.954742, 1, 1, 1, 1, 1,
0.20149, -1.615744, 2.469126, 1, 1, 1, 1, 1,
0.2185282, -0.1273436, 2.066374, 1, 1, 1, 1, 1,
0.2215095, -1.389689, 2.068801, 1, 1, 1, 1, 1,
0.2226834, 0.05563674, 2.612977, 1, 1, 1, 1, 1,
0.2240873, -0.3116758, 3.164824, 1, 1, 1, 1, 1,
0.2252866, -0.8995849, 3.423096, 1, 1, 1, 1, 1,
0.2264763, -1.24337, 3.29716, 1, 1, 1, 1, 1,
0.2283615, 0.7882304, 0.6487615, 1, 1, 1, 1, 1,
0.2311576, -0.4530806, 2.391846, 0, 0, 1, 1, 1,
0.2332653, 1.834699, -1.03079, 1, 0, 0, 1, 1,
0.2347048, 1.144909, -0.06846185, 1, 0, 0, 1, 1,
0.2347786, -0.226549, 3.042293, 1, 0, 0, 1, 1,
0.2370772, 0.4245773, 0.9295917, 1, 0, 0, 1, 1,
0.2386302, -1.090096, 4.150195, 1, 0, 0, 1, 1,
0.2433999, -0.06510334, 2.576235, 0, 0, 0, 1, 1,
0.2440222, -2.407453, 2.687543, 0, 0, 0, 1, 1,
0.2526775, -1.05978, 2.649193, 0, 0, 0, 1, 1,
0.2558733, -0.1679854, 0.9100352, 0, 0, 0, 1, 1,
0.2600747, -1.459642, 1.789183, 0, 0, 0, 1, 1,
0.2612903, -0.008282694, 0.7976388, 0, 0, 0, 1, 1,
0.2662176, -0.2091015, 1.898193, 0, 0, 0, 1, 1,
0.2686073, 0.8688853, -0.1761556, 1, 1, 1, 1, 1,
0.2688778, -0.5614868, 1.764801, 1, 1, 1, 1, 1,
0.2723021, -0.6344741, 4.132296, 1, 1, 1, 1, 1,
0.2727194, 0.5096936, 0.9546949, 1, 1, 1, 1, 1,
0.2753811, -0.8481257, 0.1360444, 1, 1, 1, 1, 1,
0.2785926, -0.4049133, 0.4608989, 1, 1, 1, 1, 1,
0.2824255, -1.166673, 2.818273, 1, 1, 1, 1, 1,
0.2912466, -0.2657513, 1.225871, 1, 1, 1, 1, 1,
0.2944959, -0.4750423, 2.807112, 1, 1, 1, 1, 1,
0.2945023, -1.096157, 1.981527, 1, 1, 1, 1, 1,
0.2966501, 0.7322381, 1.496404, 1, 1, 1, 1, 1,
0.3012767, 0.3584754, 1.617257, 1, 1, 1, 1, 1,
0.3033835, 0.8297713, 0.1466987, 1, 1, 1, 1, 1,
0.3074541, -0.3811196, 3.565333, 1, 1, 1, 1, 1,
0.3080163, -0.368899, 2.946944, 1, 1, 1, 1, 1,
0.314721, -0.4009711, 1.866587, 0, 0, 1, 1, 1,
0.3149866, -2.103938, 1.86949, 1, 0, 0, 1, 1,
0.316819, 0.3563982, 1.924656, 1, 0, 0, 1, 1,
0.3182521, -2.853006, 2.219385, 1, 0, 0, 1, 1,
0.3212906, 1.293472, 1.64207, 1, 0, 0, 1, 1,
0.3224124, 1.735545, -1.095919, 1, 0, 0, 1, 1,
0.3235652, 0.4642956, 1.065618, 0, 0, 0, 1, 1,
0.334174, 0.1302175, 3.395983, 0, 0, 0, 1, 1,
0.3346721, 1.333842, 0.9376404, 0, 0, 0, 1, 1,
0.3349202, 0.5242876, 0.7745833, 0, 0, 0, 1, 1,
0.3372229, 0.637009, 1.28782, 0, 0, 0, 1, 1,
0.3399341, -1.652663, 2.254335, 0, 0, 0, 1, 1,
0.3470027, 1.45799, -0.6158077, 0, 0, 0, 1, 1,
0.3482142, 1.310473, -0.2599584, 1, 1, 1, 1, 1,
0.349748, -1.637137, 2.603785, 1, 1, 1, 1, 1,
0.3516546, 0.2092723, -0.7079218, 1, 1, 1, 1, 1,
0.3602651, -0.588529, 1.384991, 1, 1, 1, 1, 1,
0.3629385, 0.8975643, -0.0532328, 1, 1, 1, 1, 1,
0.365427, -0.4987513, 2.348612, 1, 1, 1, 1, 1,
0.3686306, 0.04098191, 1.876325, 1, 1, 1, 1, 1,
0.3696344, 0.8567052, -0.2286644, 1, 1, 1, 1, 1,
0.3705886, -1.19067, 3.456081, 1, 1, 1, 1, 1,
0.3709236, -0.6503398, 3.041153, 1, 1, 1, 1, 1,
0.37234, -0.1071349, 0.9320446, 1, 1, 1, 1, 1,
0.3745244, -0.7764478, 1.916414, 1, 1, 1, 1, 1,
0.3789814, 0.675437, 1.119059, 1, 1, 1, 1, 1,
0.3838848, 1.151344, 1.996893, 1, 1, 1, 1, 1,
0.3840032, -0.8225551, 2.461984, 1, 1, 1, 1, 1,
0.3856609, -1.443677, 2.833183, 0, 0, 1, 1, 1,
0.3880364, 1.705272, 0.350845, 1, 0, 0, 1, 1,
0.3907062, 0.5120929, 2.51983, 1, 0, 0, 1, 1,
0.3916069, -0.7212341, 3.67938, 1, 0, 0, 1, 1,
0.3953756, -1.237854, 3.147752, 1, 0, 0, 1, 1,
0.3967945, -0.4794125, 2.233003, 1, 0, 0, 1, 1,
0.39891, -0.3682388, 3.64462, 0, 0, 0, 1, 1,
0.4005735, -0.3755181, 4.988109, 0, 0, 0, 1, 1,
0.4029333, -0.07651771, 2.553127, 0, 0, 0, 1, 1,
0.4057112, 1.472963, 0.5834816, 0, 0, 0, 1, 1,
0.4120032, 1.744738, 0.4743322, 0, 0, 0, 1, 1,
0.4120324, 2.01998, 0.6176319, 0, 0, 0, 1, 1,
0.4128321, 0.1998582, 1.837088, 0, 0, 0, 1, 1,
0.4137674, 0.01591127, 0.6688517, 1, 1, 1, 1, 1,
0.4170909, -3.239609, 2.688319, 1, 1, 1, 1, 1,
0.4185895, 0.8896108, 1.729958, 1, 1, 1, 1, 1,
0.4201437, -1.008181, 4.074626, 1, 1, 1, 1, 1,
0.4280488, -0.1330967, 1.284249, 1, 1, 1, 1, 1,
0.4287463, 0.3107152, 2.169514, 1, 1, 1, 1, 1,
0.4358388, -0.2656863, 0.9667964, 1, 1, 1, 1, 1,
0.4428609, 0.4832892, 1.569134, 1, 1, 1, 1, 1,
0.4430654, 1.663447, 1.790797, 1, 1, 1, 1, 1,
0.4447444, 1.60433, -0.2800828, 1, 1, 1, 1, 1,
0.4455529, 0.2589031, 0.850483, 1, 1, 1, 1, 1,
0.4495736, 0.1071199, 1.747114, 1, 1, 1, 1, 1,
0.4542909, -0.7632167, 2.914592, 1, 1, 1, 1, 1,
0.4601653, 0.6990352, 0.4173134, 1, 1, 1, 1, 1,
0.4692791, 1.20481, 2.606145, 1, 1, 1, 1, 1,
0.4710433, -0.9478648, 2.21697, 0, 0, 1, 1, 1,
0.4743778, -1.77791, 3.566823, 1, 0, 0, 1, 1,
0.4745632, 1.779849, -0.01914667, 1, 0, 0, 1, 1,
0.4760883, 1.215124, 2.807761, 1, 0, 0, 1, 1,
0.4802824, 0.6861013, 0.5419468, 1, 0, 0, 1, 1,
0.4813603, 0.5528182, 2.302717, 1, 0, 0, 1, 1,
0.4853803, 0.3913861, 1.765417, 0, 0, 0, 1, 1,
0.4862081, 1.384073, -0.8718498, 0, 0, 0, 1, 1,
0.4907707, 0.777777, -0.572817, 0, 0, 0, 1, 1,
0.4929245, 1.053893, 0.9753622, 0, 0, 0, 1, 1,
0.4971259, -1.332886, 2.011787, 0, 0, 0, 1, 1,
0.4986644, 0.2196464, 0.1450778, 0, 0, 0, 1, 1,
0.4992881, -0.5982277, 2.90849, 0, 0, 0, 1, 1,
0.5094228, 0.6938543, 0.7640747, 1, 1, 1, 1, 1,
0.5108657, 1.507017, 0.06077152, 1, 1, 1, 1, 1,
0.513999, -0.8784876, 2.723833, 1, 1, 1, 1, 1,
0.5143864, 0.03445052, 0.596527, 1, 1, 1, 1, 1,
0.5146165, -1.362055, 1.651644, 1, 1, 1, 1, 1,
0.5177613, 0.3479725, 2.050638, 1, 1, 1, 1, 1,
0.5188278, -0.8667065, 3.407655, 1, 1, 1, 1, 1,
0.5192275, -0.3274442, 1.886569, 1, 1, 1, 1, 1,
0.5264792, 0.5136693, 1.535868, 1, 1, 1, 1, 1,
0.5291682, -1.998875, 1.95913, 1, 1, 1, 1, 1,
0.5309709, -0.1855847, 3.398419, 1, 1, 1, 1, 1,
0.5311112, 0.448126, 0.5355914, 1, 1, 1, 1, 1,
0.531244, 0.548405, 0.3526186, 1, 1, 1, 1, 1,
0.5333332, -1.758279, 3.040182, 1, 1, 1, 1, 1,
0.5336825, -0.2028266, 0.2751504, 1, 1, 1, 1, 1,
0.5365731, -1.782975, 2.592699, 0, 0, 1, 1, 1,
0.540022, -1.496745, 1.624821, 1, 0, 0, 1, 1,
0.5433094, -0.5901595, 0.7712728, 1, 0, 0, 1, 1,
0.545211, 0.4661757, 0.5832664, 1, 0, 0, 1, 1,
0.5482346, 1.328829, 1.428687, 1, 0, 0, 1, 1,
0.5571073, -0.8232172, 2.445615, 1, 0, 0, 1, 1,
0.5593051, 0.7673236, 3.147029, 0, 0, 0, 1, 1,
0.5702416, 0.9412531, 2.136068, 0, 0, 0, 1, 1,
0.5758336, -0.6926791, 2.918502, 0, 0, 0, 1, 1,
0.5800793, 0.4328217, -0.175852, 0, 0, 0, 1, 1,
0.5842953, 2.00843, -0.1165565, 0, 0, 0, 1, 1,
0.5854164, 0.9353155, 0.6264474, 0, 0, 0, 1, 1,
0.5861968, -0.03810083, 2.422818, 0, 0, 0, 1, 1,
0.5894116, 0.250033, 2.792631, 1, 1, 1, 1, 1,
0.5928319, -0.4649151, 2.27422, 1, 1, 1, 1, 1,
0.5988245, 0.03881588, 0.7037398, 1, 1, 1, 1, 1,
0.6024854, -0.08145139, 2.592039, 1, 1, 1, 1, 1,
0.6027055, -0.6969901, 4.536694, 1, 1, 1, 1, 1,
0.6051779, -2.046669, 2.353861, 1, 1, 1, 1, 1,
0.6201251, 0.007833535, 2.246951, 1, 1, 1, 1, 1,
0.6247447, 0.5796027, -0.4038335, 1, 1, 1, 1, 1,
0.6258877, -1.046736, 1.833573, 1, 1, 1, 1, 1,
0.6287778, -0.1370498, 0.6936892, 1, 1, 1, 1, 1,
0.6306263, 1.020357, -0.1252882, 1, 1, 1, 1, 1,
0.631581, -0.7483802, 3.892323, 1, 1, 1, 1, 1,
0.6317747, -1.422811, 2.100522, 1, 1, 1, 1, 1,
0.6356543, 0.3912844, 2.335648, 1, 1, 1, 1, 1,
0.6375132, 0.6772959, 1.818174, 1, 1, 1, 1, 1,
0.6408384, 1.102089, -0.3574638, 0, 0, 1, 1, 1,
0.6449118, 0.2159373, 2.035018, 1, 0, 0, 1, 1,
0.6451629, 0.5667834, -0.4622748, 1, 0, 0, 1, 1,
0.6476305, 0.0175424, 2.212285, 1, 0, 0, 1, 1,
0.6497906, 0.6537024, 1.41659, 1, 0, 0, 1, 1,
0.6498357, -0.8143716, 2.076891, 1, 0, 0, 1, 1,
0.6507112, -0.9610857, 3.947114, 0, 0, 0, 1, 1,
0.6560011, 1.385628, 1.52626, 0, 0, 0, 1, 1,
0.6584336, 2.095272, 0.04151512, 0, 0, 0, 1, 1,
0.6584364, -0.3517385, 1.87438, 0, 0, 0, 1, 1,
0.6587882, 0.7384722, -0.1260912, 0, 0, 0, 1, 1,
0.6613544, 0.6976568, 0.8321717, 0, 0, 0, 1, 1,
0.664274, -0.8622162, 3.684895, 0, 0, 0, 1, 1,
0.6642816, 0.02987546, 1.836021, 1, 1, 1, 1, 1,
0.6644682, 0.2529624, 1.61949, 1, 1, 1, 1, 1,
0.666338, -1.646255, 0.4166718, 1, 1, 1, 1, 1,
0.6674432, -0.2702752, 2.534065, 1, 1, 1, 1, 1,
0.6677648, 0.09237829, 2.50033, 1, 1, 1, 1, 1,
0.6709725, -0.6332767, 0.9895051, 1, 1, 1, 1, 1,
0.6731181, -1.263924, 4.120507, 1, 1, 1, 1, 1,
0.6739022, -0.7257432, 1.445387, 1, 1, 1, 1, 1,
0.6758635, 1.34298, 0.6139199, 1, 1, 1, 1, 1,
0.681494, 0.1584423, 1.233506, 1, 1, 1, 1, 1,
0.6867483, 0.4608454, 2.165345, 1, 1, 1, 1, 1,
0.6878856, 1.870707, 0.8019807, 1, 1, 1, 1, 1,
0.6956331, -1.062554, 3.322192, 1, 1, 1, 1, 1,
0.7012041, -0.5967209, 4.111649, 1, 1, 1, 1, 1,
0.7099721, 0.3362063, 1.110298, 1, 1, 1, 1, 1,
0.7114885, -0.4892893, 2.065735, 0, 0, 1, 1, 1,
0.7127993, 0.08084144, 0.7801635, 1, 0, 0, 1, 1,
0.7147208, 1.104632, 0.2275265, 1, 0, 0, 1, 1,
0.7173426, -0.7477278, 1.302089, 1, 0, 0, 1, 1,
0.7174134, 1.412903, 1.053362, 1, 0, 0, 1, 1,
0.7174821, -0.0287834, 1.881664, 1, 0, 0, 1, 1,
0.7392388, 0.06209932, 1.244284, 0, 0, 0, 1, 1,
0.7457836, 1.465736, 0.122243, 0, 0, 0, 1, 1,
0.7513718, -1.221872, 2.561988, 0, 0, 0, 1, 1,
0.7537141, -1.397369, 2.762752, 0, 0, 0, 1, 1,
0.7556068, -1.54861, 3.395615, 0, 0, 0, 1, 1,
0.7558933, -1.306054, 1.827781, 0, 0, 0, 1, 1,
0.7596214, 0.9228581, 0.6855002, 0, 0, 0, 1, 1,
0.7625604, -0.24945, 2.423179, 1, 1, 1, 1, 1,
0.7633668, -0.0006959475, 1.691489, 1, 1, 1, 1, 1,
0.7667033, -1.419285, 3.682344, 1, 1, 1, 1, 1,
0.7719617, -0.4249765, 2.501352, 1, 1, 1, 1, 1,
0.7751667, -0.4611284, 2.429674, 1, 1, 1, 1, 1,
0.7793852, 0.1953374, 1.087476, 1, 1, 1, 1, 1,
0.7800749, 1.135579, 0.4540181, 1, 1, 1, 1, 1,
0.7962371, 2.023873, 0.5665189, 1, 1, 1, 1, 1,
0.8007292, -0.2811852, 0.2175276, 1, 1, 1, 1, 1,
0.8012641, -1.363122, 1.752352, 1, 1, 1, 1, 1,
0.802056, -0.3270583, 2.42029, 1, 1, 1, 1, 1,
0.8031424, 0.1342643, 1.604174, 1, 1, 1, 1, 1,
0.8044301, 0.3349687, 1.657637, 1, 1, 1, 1, 1,
0.8058288, 1.015261, -1.976611, 1, 1, 1, 1, 1,
0.8071911, 0.05595143, 3.186802, 1, 1, 1, 1, 1,
0.8086631, -0.5821028, 1.473205, 0, 0, 1, 1, 1,
0.8112797, 2.003005, -1.107727, 1, 0, 0, 1, 1,
0.8117606, -0.3762544, 0.5501728, 1, 0, 0, 1, 1,
0.8136368, -1.90772, 2.860775, 1, 0, 0, 1, 1,
0.8138197, 0.2620926, 2.374005, 1, 0, 0, 1, 1,
0.814755, -1.100377, 2.468844, 1, 0, 0, 1, 1,
0.8193861, -1.366741, 1.807597, 0, 0, 0, 1, 1,
0.8255358, -0.3976304, 1.914505, 0, 0, 0, 1, 1,
0.8316085, -0.5414211, 2.845069, 0, 0, 0, 1, 1,
0.8349981, -0.7281497, 0.8110169, 0, 0, 0, 1, 1,
0.8373083, 1.445372, 2.013408, 0, 0, 0, 1, 1,
0.8417411, -0.09856112, 3.248685, 0, 0, 0, 1, 1,
0.8421282, -0.04969663, 3.029548, 0, 0, 0, 1, 1,
0.846558, 1.127654, 0.1826873, 1, 1, 1, 1, 1,
0.8508586, 1.002579, 0.637917, 1, 1, 1, 1, 1,
0.8522731, 1.749195, 0.05251345, 1, 1, 1, 1, 1,
0.8523288, -0.3086881, 1.940697, 1, 1, 1, 1, 1,
0.8526577, -1.050282, 1.100638, 1, 1, 1, 1, 1,
0.8569034, 0.1949925, 1.737425, 1, 1, 1, 1, 1,
0.8615547, -1.02847, 4.299298, 1, 1, 1, 1, 1,
0.8660598, -0.05088836, 1.537182, 1, 1, 1, 1, 1,
0.8666693, 0.3049382, -0.00743641, 1, 1, 1, 1, 1,
0.866806, -0.3402161, 3.424797, 1, 1, 1, 1, 1,
0.8669459, 1.14988, -0.1280047, 1, 1, 1, 1, 1,
0.8733888, -1.222106, 1.416386, 1, 1, 1, 1, 1,
0.8738103, -0.5513495, 2.009955, 1, 1, 1, 1, 1,
0.8755621, 0.7074339, -1.030572, 1, 1, 1, 1, 1,
0.8762382, 0.3293679, 0.9185943, 1, 1, 1, 1, 1,
0.8790466, 1.261, 0.1037066, 0, 0, 1, 1, 1,
0.8827012, -0.7944018, 3.173868, 1, 0, 0, 1, 1,
0.8834734, 0.3729558, 2.304388, 1, 0, 0, 1, 1,
0.8874465, 0.7540983, 0.8984566, 1, 0, 0, 1, 1,
0.8878649, 1.00058, 1.694648, 1, 0, 0, 1, 1,
0.8986373, 1.510653, 0.6222408, 1, 0, 0, 1, 1,
0.8987334, -1.175092, 3.075563, 0, 0, 0, 1, 1,
0.8999768, 2.291314, -0.4341326, 0, 0, 0, 1, 1,
0.9026097, 0.3083463, 1.524455, 0, 0, 0, 1, 1,
0.9058912, 0.7121936, -0.01322987, 0, 0, 0, 1, 1,
0.906521, -0.1017894, 1.756128, 0, 0, 0, 1, 1,
0.906784, -0.4453686, 1.898246, 0, 0, 0, 1, 1,
0.9117169, -0.2453337, 2.550725, 0, 0, 0, 1, 1,
0.9152625, 0.2637865, 1.74647, 1, 1, 1, 1, 1,
0.9174512, -1.676712, 2.017254, 1, 1, 1, 1, 1,
0.9222642, -0.149612, 3.536911, 1, 1, 1, 1, 1,
0.9259953, 0.5915318, 0.6070807, 1, 1, 1, 1, 1,
0.9298781, -1.685278, 3.68108, 1, 1, 1, 1, 1,
0.9362111, -1.164552, 2.270067, 1, 1, 1, 1, 1,
0.9365825, -0.4618249, 1.562383, 1, 1, 1, 1, 1,
0.9456024, -1.010554, 1.364451, 1, 1, 1, 1, 1,
0.9555002, -1.135152, 0.6525549, 1, 1, 1, 1, 1,
0.9579155, -0.1905319, 0.1080533, 1, 1, 1, 1, 1,
0.9618135, 1.687158, 1.366908, 1, 1, 1, 1, 1,
0.9647354, -1.615774, 3.303485, 1, 1, 1, 1, 1,
0.9682412, 1.688007, 2.494623, 1, 1, 1, 1, 1,
0.9711121, 1.541092, 1.706424, 1, 1, 1, 1, 1,
0.979187, -1.069391, 4.288322, 1, 1, 1, 1, 1,
0.9852106, -0.1506578, 2.437682, 0, 0, 1, 1, 1,
0.9862595, -2.196162, 4.243813, 1, 0, 0, 1, 1,
0.9895706, 0.2103865, 0.7526526, 1, 0, 0, 1, 1,
0.9924901, -1.063818, 3.356211, 1, 0, 0, 1, 1,
0.9962156, -0.02501226, 1.577943, 1, 0, 0, 1, 1,
1.001807, -0.8958095, 3.135383, 1, 0, 0, 1, 1,
1.003838, -0.5729618, -0.05985755, 0, 0, 0, 1, 1,
1.005016, -0.8042503, 1.861186, 0, 0, 0, 1, 1,
1.006296, 0.3353305, 1.801127, 0, 0, 0, 1, 1,
1.006497, 0.4174201, 0.5834875, 0, 0, 0, 1, 1,
1.011868, 0.03599757, -1.076712, 0, 0, 0, 1, 1,
1.016852, 0.6402779, 0.8345344, 0, 0, 0, 1, 1,
1.042167, 0.932588, 1.439836, 0, 0, 0, 1, 1,
1.047592, 1.680489, -1.209136, 1, 1, 1, 1, 1,
1.048413, -1.095459, 3.15046, 1, 1, 1, 1, 1,
1.052113, -0.3402307, 2.481529, 1, 1, 1, 1, 1,
1.056681, -0.3049673, 2.358901, 1, 1, 1, 1, 1,
1.064407, 0.839071, -0.1779741, 1, 1, 1, 1, 1,
1.078885, 0.00846463, 0.8990585, 1, 1, 1, 1, 1,
1.080816, -1.444389, 2.512245, 1, 1, 1, 1, 1,
1.090191, 0.6634156, 1.937942, 1, 1, 1, 1, 1,
1.090581, 0.2316204, 1.26471, 1, 1, 1, 1, 1,
1.09173, 0.840571, 0.544082, 1, 1, 1, 1, 1,
1.092146, 0.9103893, -0.05068725, 1, 1, 1, 1, 1,
1.110776, 0.5317467, 1.45593, 1, 1, 1, 1, 1,
1.120193, -0.9613984, 1.259412, 1, 1, 1, 1, 1,
1.123827, -0.7102624, 2.174079, 1, 1, 1, 1, 1,
1.127797, 1.858027, 0.4161359, 1, 1, 1, 1, 1,
1.12817, -0.4127062, 1.869957, 0, 0, 1, 1, 1,
1.131072, -0.03341911, 1.956572, 1, 0, 0, 1, 1,
1.134943, 0.6810107, 0.9022043, 1, 0, 0, 1, 1,
1.139926, -0.6061265, 2.754826, 1, 0, 0, 1, 1,
1.142406, 0.6102036, 2.113072, 1, 0, 0, 1, 1,
1.14274, 1.447615, -0.01832321, 1, 0, 0, 1, 1,
1.14862, 0.5551013, 1.460554, 0, 0, 0, 1, 1,
1.163496, 1.223377, 1.266242, 0, 0, 0, 1, 1,
1.166238, -0.3109058, 1.324436, 0, 0, 0, 1, 1,
1.16827, 0.8410481, 2.239119, 0, 0, 0, 1, 1,
1.170753, -1.16807, 1.74954, 0, 0, 0, 1, 1,
1.172163, 0.288018, 3.052618, 0, 0, 0, 1, 1,
1.173447, -1.222776, 1.758064, 0, 0, 0, 1, 1,
1.17808, 0.6124591, 2.161273, 1, 1, 1, 1, 1,
1.178336, 2.139923, 0.7061034, 1, 1, 1, 1, 1,
1.183829, 1.249938, 1.22694, 1, 1, 1, 1, 1,
1.190014, 0.9759692, -0.6901121, 1, 1, 1, 1, 1,
1.190784, -1.445993, 4.24844, 1, 1, 1, 1, 1,
1.197776, 0.8714951, 0.3272795, 1, 1, 1, 1, 1,
1.199434, -0.7624824, 2.100792, 1, 1, 1, 1, 1,
1.211592, -0.153513, -0.08650716, 1, 1, 1, 1, 1,
1.218655, 1.903298, 0.9757577, 1, 1, 1, 1, 1,
1.227734, -0.0511713, 1.935894, 1, 1, 1, 1, 1,
1.233519, -1.964967, 3.402833, 1, 1, 1, 1, 1,
1.235381, -0.7675082, 3.34741, 1, 1, 1, 1, 1,
1.251881, -2.007038, 2.802425, 1, 1, 1, 1, 1,
1.260887, 0.3804037, 2.241876, 1, 1, 1, 1, 1,
1.262744, 0.7632272, 0.5263042, 1, 1, 1, 1, 1,
1.280447, -0.2422142, 0.9677069, 0, 0, 1, 1, 1,
1.28969, 0.109671, -0.1608677, 1, 0, 0, 1, 1,
1.294146, 0.3945132, 2.620852, 1, 0, 0, 1, 1,
1.315074, 0.8781521, 1.191645, 1, 0, 0, 1, 1,
1.320056, -0.5961396, 1.890941, 1, 0, 0, 1, 1,
1.327727, 1.033731, 0.2709792, 1, 0, 0, 1, 1,
1.330643, 0.4392393, 0.8020753, 0, 0, 0, 1, 1,
1.34589, -1.311961, 2.635934, 0, 0, 0, 1, 1,
1.356103, -0.8787237, 1.837453, 0, 0, 0, 1, 1,
1.358669, -1.154859, 2.157161, 0, 0, 0, 1, 1,
1.36037, -0.1827842, 2.28886, 0, 0, 0, 1, 1,
1.367068, -1.032123, 2.592262, 0, 0, 0, 1, 1,
1.375409, 0.08835375, 2.072258, 0, 0, 0, 1, 1,
1.376136, -0.09958234, 2.845786, 1, 1, 1, 1, 1,
1.37917, 0.1551216, 1.642305, 1, 1, 1, 1, 1,
1.3794, 1.200929, 1.099717, 1, 1, 1, 1, 1,
1.387321, -0.3946889, 2.952991, 1, 1, 1, 1, 1,
1.389506, -0.5943246, 1.048801, 1, 1, 1, 1, 1,
1.406115, 0.4100331, 1.526392, 1, 1, 1, 1, 1,
1.417694, 0.7179798, 1.495437, 1, 1, 1, 1, 1,
1.436212, -0.8816521, 2.851035, 1, 1, 1, 1, 1,
1.439844, 0.561149, 2.016445, 1, 1, 1, 1, 1,
1.44003, 0.7123051, 0.1297284, 1, 1, 1, 1, 1,
1.445683, -1.164553, 1.91203, 1, 1, 1, 1, 1,
1.450368, 0.4975777, 1.184117, 1, 1, 1, 1, 1,
1.450974, -0.02923686, 0.9011146, 1, 1, 1, 1, 1,
1.456192, 0.4711799, 0.1164032, 1, 1, 1, 1, 1,
1.462337, 1.521886, 0.8891851, 1, 1, 1, 1, 1,
1.468205, 0.2865465, 1.637803, 0, 0, 1, 1, 1,
1.472309, 0.5172098, 0.5413126, 1, 0, 0, 1, 1,
1.475236, -0.9487994, 2.218674, 1, 0, 0, 1, 1,
1.477664, -0.7059177, 2.931109, 1, 0, 0, 1, 1,
1.479484, -0.2541921, 3.642391, 1, 0, 0, 1, 1,
1.485302, 0.3312225, 1.563398, 1, 0, 0, 1, 1,
1.491206, 0.9753313, 0.490614, 0, 0, 0, 1, 1,
1.503237, -1.734794, 2.476959, 0, 0, 0, 1, 1,
1.525116, 0.004279002, 0.1308338, 0, 0, 0, 1, 1,
1.533963, -0.5723421, 1.24489, 0, 0, 0, 1, 1,
1.541153, -0.1651153, 2.851476, 0, 0, 0, 1, 1,
1.543405, -0.8140671, 2.040324, 0, 0, 0, 1, 1,
1.556996, 0.4015881, 1.191505, 0, 0, 0, 1, 1,
1.558458, -0.005723224, 2.377231, 1, 1, 1, 1, 1,
1.560452, 0.1630296, 2.095007, 1, 1, 1, 1, 1,
1.571318, 0.5918379, 1.337593, 1, 1, 1, 1, 1,
1.579749, -1.572189, 0.1836499, 1, 1, 1, 1, 1,
1.581476, 0.9970244, 1.925312, 1, 1, 1, 1, 1,
1.58209, -1.021096, 1.961395, 1, 1, 1, 1, 1,
1.583932, -0.9040909, 0.7923928, 1, 1, 1, 1, 1,
1.599491, 0.09835581, 0.1019565, 1, 1, 1, 1, 1,
1.603628, 0.6286436, 2.252372, 1, 1, 1, 1, 1,
1.619706, -0.4193815, 1.447989, 1, 1, 1, 1, 1,
1.631018, -1.073914, 2.124082, 1, 1, 1, 1, 1,
1.635324, -0.1063843, 1.143444, 1, 1, 1, 1, 1,
1.637164, -0.6706873, 0.925312, 1, 1, 1, 1, 1,
1.643548, -0.002018901, 2.924433, 1, 1, 1, 1, 1,
1.643578, -0.7121079, 1.139692, 1, 1, 1, 1, 1,
1.645576, 1.998486, 1.027189, 0, 0, 1, 1, 1,
1.651348, -1.354569, 1.94416, 1, 0, 0, 1, 1,
1.669735, 1.639988, 0.9753796, 1, 0, 0, 1, 1,
1.700298, -1.846766, 4.173128, 1, 0, 0, 1, 1,
1.701521, 1.939014, 0.4189036, 1, 0, 0, 1, 1,
1.702554, -0.2187275, 0.7608035, 1, 0, 0, 1, 1,
1.733037, 0.4640226, 0.7459086, 0, 0, 0, 1, 1,
1.733423, -0.5274114, 1.104819, 0, 0, 0, 1, 1,
1.736199, 1.13589, 1.324172, 0, 0, 0, 1, 1,
1.760499, -0.4930367, 1.566844, 0, 0, 0, 1, 1,
1.7614, 0.650923, 0.8154946, 0, 0, 0, 1, 1,
1.802778, -1.198392, 2.734107, 0, 0, 0, 1, 1,
1.803535, -0.09519929, 2.001812, 0, 0, 0, 1, 1,
1.812572, -0.9045914, 2.018205, 1, 1, 1, 1, 1,
1.823071, 0.1730052, 0.7430159, 1, 1, 1, 1, 1,
1.824583, 0.9190097, 0.8576412, 1, 1, 1, 1, 1,
1.826935, -0.7778456, 0.6725118, 1, 1, 1, 1, 1,
1.839411, -1.564626, 2.569634, 1, 1, 1, 1, 1,
1.85991, -0.6179784, 2.259892, 1, 1, 1, 1, 1,
1.869255, 1.312793, 2.125089, 1, 1, 1, 1, 1,
1.873683, 0.225411, 2.153204, 1, 1, 1, 1, 1,
1.877345, 1.748657, 1.272387, 1, 1, 1, 1, 1,
1.884183, -1.080147, 2.439916, 1, 1, 1, 1, 1,
1.892895, 1.177171, -0.1026512, 1, 1, 1, 1, 1,
1.90085, 0.9897042, 1.220606, 1, 1, 1, 1, 1,
1.911814, -1.089036, 1.258292, 1, 1, 1, 1, 1,
1.914899, -2.227794, 2.683108, 1, 1, 1, 1, 1,
1.961574, -1.447591, 3.871716, 1, 1, 1, 1, 1,
2.009605, 0.01639592, 0.7981479, 0, 0, 1, 1, 1,
2.034828, -0.4085252, 3.343515, 1, 0, 0, 1, 1,
2.056556, 0.1416301, 1.204595, 1, 0, 0, 1, 1,
2.077883, -2.13417, 2.240603, 1, 0, 0, 1, 1,
2.146115, -1.045204, 1.110525, 1, 0, 0, 1, 1,
2.171127, -0.4041306, 0.9878198, 1, 0, 0, 1, 1,
2.183145, 0.3087091, 2.333789, 0, 0, 0, 1, 1,
2.210664, 1.887872, 0.6729845, 0, 0, 0, 1, 1,
2.276052, 1.34744, 4.188057, 0, 0, 0, 1, 1,
2.310569, 0.06505463, 0.569197, 0, 0, 0, 1, 1,
2.448957, 0.1286063, 2.919197, 0, 0, 0, 1, 1,
2.507462, -0.5728212, 1.858756, 0, 0, 0, 1, 1,
2.549437, 0.04827152, 1.016124, 0, 0, 0, 1, 1,
2.552641, 2.016898, 0.3748604, 1, 1, 1, 1, 1,
2.62611, 0.2317756, 0.8305898, 1, 1, 1, 1, 1,
2.632885, -1.728104, 1.819262, 1, 1, 1, 1, 1,
2.666742, -0.2750643, 2.17484, 1, 1, 1, 1, 1,
2.697083, 0.6860995, 2.449191, 1, 1, 1, 1, 1,
2.802786, 0.08118726, 2.968999, 1, 1, 1, 1, 1,
3.116285, 0.4485775, 2.182975, 1, 1, 1, 1, 1
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
var radius = 9.192317;
var distance = 32.28762;
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
mvMatrix.translate( -0.1075894, 0.1269554, 0.08231735 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.28762);
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
