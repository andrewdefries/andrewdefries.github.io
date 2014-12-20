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
-2.856922, -1.145267, -2.012628, 1, 0, 0, 1,
-2.775628, -2.083431, -1.877434, 1, 0.007843138, 0, 1,
-2.742495, -2.057571, -1.900076, 1, 0.01176471, 0, 1,
-2.708534, -0.4610881, -1.059929, 1, 0.01960784, 0, 1,
-2.628668, 0.7948516, -1.401425, 1, 0.02352941, 0, 1,
-2.585197, 1.769383, -1.761845, 1, 0.03137255, 0, 1,
-2.381457, -0.01167028, -1.332743, 1, 0.03529412, 0, 1,
-2.351352, -1.407229, -3.985744, 1, 0.04313726, 0, 1,
-2.290523, -0.5907999, -1.319181, 1, 0.04705882, 0, 1,
-2.263065, -1.50793, -1.654601, 1, 0.05490196, 0, 1,
-2.254826, -0.3170112, -1.610776, 1, 0.05882353, 0, 1,
-2.207868, 2.090388, -0.2945936, 1, 0.06666667, 0, 1,
-2.197587, 0.5936481, -1.797306, 1, 0.07058824, 0, 1,
-2.188126, -1.288719, -3.532006, 1, 0.07843138, 0, 1,
-2.182483, 0.5509413, -1.015919, 1, 0.08235294, 0, 1,
-2.115793, 0.7454177, -2.276965, 1, 0.09019608, 0, 1,
-2.081385, 0.9535617, -0.4395114, 1, 0.09411765, 0, 1,
-1.988859, -0.0373219, -1.652522, 1, 0.1019608, 0, 1,
-1.982005, 0.8066635, -1.446289, 1, 0.1098039, 0, 1,
-1.976337, 0.07001837, -1.280426, 1, 0.1137255, 0, 1,
-1.944387, -1.817266, -0.3984292, 1, 0.1215686, 0, 1,
-1.937485, 2.256057, -0.6593066, 1, 0.1254902, 0, 1,
-1.925722, 0.08656628, -2.724433, 1, 0.1333333, 0, 1,
-1.878404, -0.0236881, -3.66151, 1, 0.1372549, 0, 1,
-1.862164, -1.67495, -1.481454, 1, 0.145098, 0, 1,
-1.852789, 0.07937001, -0.6116173, 1, 0.1490196, 0, 1,
-1.849218, 0.09448542, -2.502338, 1, 0.1568628, 0, 1,
-1.827432, -0.847921, -1.724001, 1, 0.1607843, 0, 1,
-1.818958, 0.7273518, -0.9664627, 1, 0.1686275, 0, 1,
-1.816972, -1.456099, -3.442879, 1, 0.172549, 0, 1,
-1.806604, 1.733689, -0.2068062, 1, 0.1803922, 0, 1,
-1.79409, -0.001164398, -1.112957, 1, 0.1843137, 0, 1,
-1.794055, -0.8098043, -1.433124, 1, 0.1921569, 0, 1,
-1.793567, -0.2104043, -1.550812, 1, 0.1960784, 0, 1,
-1.792267, 1.252201, -0.4229102, 1, 0.2039216, 0, 1,
-1.763025, -0.7657475, -3.72754, 1, 0.2117647, 0, 1,
-1.762304, -0.5968689, -0.5581202, 1, 0.2156863, 0, 1,
-1.754581, -1.372949, -0.7415967, 1, 0.2235294, 0, 1,
-1.746105, -0.855284, -1.304985, 1, 0.227451, 0, 1,
-1.744925, -0.9134047, -4.188192, 1, 0.2352941, 0, 1,
-1.738711, -1.593458, -2.431979, 1, 0.2392157, 0, 1,
-1.729043, 0.1655131, -1.58005, 1, 0.2470588, 0, 1,
-1.72903, 1.566687, -2.014868, 1, 0.2509804, 0, 1,
-1.727609, -0.4703194, -2.546709, 1, 0.2588235, 0, 1,
-1.724367, -1.56003, -2.445569, 1, 0.2627451, 0, 1,
-1.709317, 1.677453, 0.7429001, 1, 0.2705882, 0, 1,
-1.701448, 0.6875675, -0.8879979, 1, 0.2745098, 0, 1,
-1.680982, 0.416959, -0.8705856, 1, 0.282353, 0, 1,
-1.651043, 0.1443045, -2.230792, 1, 0.2862745, 0, 1,
-1.644095, -0.3466781, -0.2895052, 1, 0.2941177, 0, 1,
-1.642255, 0.8958946, -0.3432892, 1, 0.3019608, 0, 1,
-1.600967, -0.7411565, -2.195839, 1, 0.3058824, 0, 1,
-1.591761, 0.2720709, -2.124029, 1, 0.3137255, 0, 1,
-1.590334, 0.5874485, -1.114442, 1, 0.3176471, 0, 1,
-1.588943, -0.3124478, -2.416491, 1, 0.3254902, 0, 1,
-1.580693, -0.2333275, -3.814161, 1, 0.3294118, 0, 1,
-1.564798, 0.2764399, -1.132259, 1, 0.3372549, 0, 1,
-1.559781, 1.407988, -0.4468968, 1, 0.3411765, 0, 1,
-1.556162, 0.8640724, 0.3242055, 1, 0.3490196, 0, 1,
-1.531554, 0.7767832, -0.3080911, 1, 0.3529412, 0, 1,
-1.529183, -0.5415646, -5.0459, 1, 0.3607843, 0, 1,
-1.524835, 0.0639452, -1.404837, 1, 0.3647059, 0, 1,
-1.510596, -0.3111729, -1.155096, 1, 0.372549, 0, 1,
-1.498186, -1.208714, -3.493361, 1, 0.3764706, 0, 1,
-1.478653, 1.580196, -2.777796, 1, 0.3843137, 0, 1,
-1.474839, 0.07058924, -0.7768164, 1, 0.3882353, 0, 1,
-1.470925, 0.9389422, -0.8473324, 1, 0.3960784, 0, 1,
-1.466425, -0.2499715, -3.931547, 1, 0.4039216, 0, 1,
-1.463817, -0.86682, -1.501209, 1, 0.4078431, 0, 1,
-1.458963, 1.654819, 0.2612705, 1, 0.4156863, 0, 1,
-1.456491, 0.6327259, -0.2091367, 1, 0.4196078, 0, 1,
-1.454422, -0.01209409, -1.313958, 1, 0.427451, 0, 1,
-1.452439, -0.4181785, -3.044485, 1, 0.4313726, 0, 1,
-1.432669, -1.131351, -1.998678, 1, 0.4392157, 0, 1,
-1.430138, -0.8201411, -4.141055, 1, 0.4431373, 0, 1,
-1.429247, 0.1458425, -2.035712, 1, 0.4509804, 0, 1,
-1.42771, -0.02478025, -2.046092, 1, 0.454902, 0, 1,
-1.427193, -0.7536157, -3.431316, 1, 0.4627451, 0, 1,
-1.417722, 0.437956, -2.286847, 1, 0.4666667, 0, 1,
-1.406163, 0.3724307, -1.473401, 1, 0.4745098, 0, 1,
-1.394074, 0.3412986, -0.007672989, 1, 0.4784314, 0, 1,
-1.392774, 1.986735, -1.032146, 1, 0.4862745, 0, 1,
-1.390036, 1.048399, -1.94036, 1, 0.4901961, 0, 1,
-1.379058, 1.436186, -2.201829, 1, 0.4980392, 0, 1,
-1.372189, 0.1434566, -1.76269, 1, 0.5058824, 0, 1,
-1.371435, 0.144367, -2.027376, 1, 0.509804, 0, 1,
-1.371289, 1.902143, 1.04046, 1, 0.5176471, 0, 1,
-1.370836, -0.8966796, -2.519186, 1, 0.5215687, 0, 1,
-1.369213, 0.6024755, -1.674711, 1, 0.5294118, 0, 1,
-1.364357, -1.181317, -2.066921, 1, 0.5333334, 0, 1,
-1.362353, -0.333676, -1.896523, 1, 0.5411765, 0, 1,
-1.353217, -0.8089887, -3.131554, 1, 0.5450981, 0, 1,
-1.34835, 0.05597374, -3.338215, 1, 0.5529412, 0, 1,
-1.340628, 0.5639108, -1.883167, 1, 0.5568628, 0, 1,
-1.336286, -1.01513, -1.646895, 1, 0.5647059, 0, 1,
-1.335644, 0.4151937, -2.64147, 1, 0.5686275, 0, 1,
-1.334828, 0.3040866, -0.7892799, 1, 0.5764706, 0, 1,
-1.330279, 2.343069, -0.3377487, 1, 0.5803922, 0, 1,
-1.308236, 1.126342, -1.11824, 1, 0.5882353, 0, 1,
-1.304461, 0.1841646, -2.849162, 1, 0.5921569, 0, 1,
-1.303141, 0.3507403, -2.014385, 1, 0.6, 0, 1,
-1.299265, 0.3323992, -0.01118279, 1, 0.6078432, 0, 1,
-1.291809, 2.230079, -1.260144, 1, 0.6117647, 0, 1,
-1.291476, 0.5173525, 0.1631561, 1, 0.6196079, 0, 1,
-1.290048, -0.03295283, -0.7340173, 1, 0.6235294, 0, 1,
-1.289763, -0.4695717, 0.2288633, 1, 0.6313726, 0, 1,
-1.264895, 1.007755, -0.7537005, 1, 0.6352941, 0, 1,
-1.258895, -0.7667791, -1.889155, 1, 0.6431373, 0, 1,
-1.249819, 0.219052, -0.9038825, 1, 0.6470588, 0, 1,
-1.235302, 0.1600755, -1.784331, 1, 0.654902, 0, 1,
-1.234901, 0.5959596, -1.871318, 1, 0.6588235, 0, 1,
-1.227821, 0.04036522, -0.63309, 1, 0.6666667, 0, 1,
-1.224272, -1.01446, -2.337265, 1, 0.6705883, 0, 1,
-1.221547, 0.459493, -1.091921, 1, 0.6784314, 0, 1,
-1.21529, 0.8323808, -1.120085, 1, 0.682353, 0, 1,
-1.21527, 0.07190089, 0.3635234, 1, 0.6901961, 0, 1,
-1.187096, 1.226249, -2.015615, 1, 0.6941177, 0, 1,
-1.183344, 0.368478, -3.512594, 1, 0.7019608, 0, 1,
-1.182868, -0.2489487, -0.898213, 1, 0.7098039, 0, 1,
-1.177215, -0.8116434, -1.639198, 1, 0.7137255, 0, 1,
-1.175732, 0.774048, -0.9548602, 1, 0.7215686, 0, 1,
-1.173471, -2.119431, -1.18504, 1, 0.7254902, 0, 1,
-1.164826, -0.4253224, -2.388523, 1, 0.7333333, 0, 1,
-1.143433, 1.946687, -1.792404, 1, 0.7372549, 0, 1,
-1.14322, 0.8225316, 1.789236, 1, 0.7450981, 0, 1,
-1.140042, -2.022241, -2.308154, 1, 0.7490196, 0, 1,
-1.137633, 1.389066, -1.104987, 1, 0.7568628, 0, 1,
-1.124808, 1.199886, -1.118777, 1, 0.7607843, 0, 1,
-1.123164, 1.431632, 1.133916, 1, 0.7686275, 0, 1,
-1.122073, 0.3656445, -0.7833142, 1, 0.772549, 0, 1,
-1.121019, 1.334384, -0.6963404, 1, 0.7803922, 0, 1,
-1.116397, 0.3059655, -1.399608, 1, 0.7843137, 0, 1,
-1.113763, -1.301217, -3.232829, 1, 0.7921569, 0, 1,
-1.113756, 1.333955, -1.603784, 1, 0.7960784, 0, 1,
-1.109017, -0.514461, -1.415864, 1, 0.8039216, 0, 1,
-1.102672, -0.5637651, -0.1331597, 1, 0.8117647, 0, 1,
-1.101212, 0.5650308, -3.50965, 1, 0.8156863, 0, 1,
-1.097444, 1.24822, -0.7619003, 1, 0.8235294, 0, 1,
-1.079902, 0.5189041, -2.345667, 1, 0.827451, 0, 1,
-1.078468, 0.1887421, -0.6772007, 1, 0.8352941, 0, 1,
-1.07183, -0.6666835, -2.505063, 1, 0.8392157, 0, 1,
-1.07122, -0.3366724, -2.989819, 1, 0.8470588, 0, 1,
-1.070805, -1.61613, -4.095178, 1, 0.8509804, 0, 1,
-1.054209, -1.321909, -4.076164, 1, 0.8588235, 0, 1,
-1.053363, -1.630262, -3.391988, 1, 0.8627451, 0, 1,
-1.053104, -0.9016939, -3.306533, 1, 0.8705882, 0, 1,
-1.045819, 0.3454262, -0.4116555, 1, 0.8745098, 0, 1,
-1.026639, 0.6668609, -2.350538, 1, 0.8823529, 0, 1,
-1.023941, 0.729648, -1.712273, 1, 0.8862745, 0, 1,
-1.022606, -1.394188, -2.861075, 1, 0.8941177, 0, 1,
-1.021743, -1.264069, -2.4566, 1, 0.8980392, 0, 1,
-1.016498, -2.770642, -4.391182, 1, 0.9058824, 0, 1,
-1.013467, -0.9709314, -1.149937, 1, 0.9137255, 0, 1,
-1.012476, -0.7922891, -2.488853, 1, 0.9176471, 0, 1,
-1.011213, 0.7717898, -1.571682, 1, 0.9254902, 0, 1,
-0.9995639, 0.3267584, -0.112494, 1, 0.9294118, 0, 1,
-0.9956876, -0.7195472, -1.463053, 1, 0.9372549, 0, 1,
-0.9952223, 0.6208792, -0.425845, 1, 0.9411765, 0, 1,
-0.9932366, -0.05685082, -1.42259, 1, 0.9490196, 0, 1,
-0.9897299, 0.288002, -1.281798, 1, 0.9529412, 0, 1,
-0.9869197, 1.935842, -0.3385642, 1, 0.9607843, 0, 1,
-0.9863567, 0.03284452, -0.8512152, 1, 0.9647059, 0, 1,
-0.9852283, 1.277893, -1.70391, 1, 0.972549, 0, 1,
-0.9818211, 1.950305, -0.3062005, 1, 0.9764706, 0, 1,
-0.9779021, -1.533858, -1.756196, 1, 0.9843137, 0, 1,
-0.9733035, -1.480852, -2.460343, 1, 0.9882353, 0, 1,
-0.9614816, 1.82401, 0.1555971, 1, 0.9960784, 0, 1,
-0.9579449, 0.05036161, -1.36709, 0.9960784, 1, 0, 1,
-0.9575309, 0.3245876, 0.3797764, 0.9921569, 1, 0, 1,
-0.9551371, 1.763982, -2.058407, 0.9843137, 1, 0, 1,
-0.9530502, -2.267467, -3.510483, 0.9803922, 1, 0, 1,
-0.952714, -1.23869, -3.153808, 0.972549, 1, 0, 1,
-0.9470296, -0.7168859, -2.184632, 0.9686275, 1, 0, 1,
-0.9429777, -0.07590199, -1.915231, 0.9607843, 1, 0, 1,
-0.9408855, -0.1980075, -0.6961508, 0.9568627, 1, 0, 1,
-0.9388821, -0.1538543, -1.365966, 0.9490196, 1, 0, 1,
-0.9282286, 0.06662202, -3.087795, 0.945098, 1, 0, 1,
-0.9221399, 1.275454, -0.3717107, 0.9372549, 1, 0, 1,
-0.9103103, 1.886008, -0.9660204, 0.9333333, 1, 0, 1,
-0.9005916, 0.3064705, -0.6622602, 0.9254902, 1, 0, 1,
-0.8957706, 0.4342169, -3.407737, 0.9215686, 1, 0, 1,
-0.8868353, 0.4397069, -1.638967, 0.9137255, 1, 0, 1,
-0.8849442, -0.3416391, -1.211035, 0.9098039, 1, 0, 1,
-0.876517, -1.358743, -2.11286, 0.9019608, 1, 0, 1,
-0.8744573, -1.132539, -3.273004, 0.8941177, 1, 0, 1,
-0.8664595, -0.7967845, -2.412662, 0.8901961, 1, 0, 1,
-0.8644884, -0.2318997, -1.713212, 0.8823529, 1, 0, 1,
-0.8639621, 1.170404, 0.05198688, 0.8784314, 1, 0, 1,
-0.8633379, -0.5911872, -0.6448976, 0.8705882, 1, 0, 1,
-0.8598548, -0.3646637, -2.638447, 0.8666667, 1, 0, 1,
-0.8571522, 1.700665, 0.6303388, 0.8588235, 1, 0, 1,
-0.8566762, -1.148083, -4.268103, 0.854902, 1, 0, 1,
-0.8535613, -0.475434, -2.021403, 0.8470588, 1, 0, 1,
-0.8475853, 0.0768631, -1.956763, 0.8431373, 1, 0, 1,
-0.8473046, -0.7634254, -0.9514752, 0.8352941, 1, 0, 1,
-0.8380027, -0.3040127, -2.940995, 0.8313726, 1, 0, 1,
-0.8363023, -2.438518, -1.115733, 0.8235294, 1, 0, 1,
-0.8354666, -1.289394, -3.059645, 0.8196079, 1, 0, 1,
-0.8327861, -0.2634825, -2.101837, 0.8117647, 1, 0, 1,
-0.8310184, 0.8739277, -1.592468, 0.8078431, 1, 0, 1,
-0.8234111, 0.02379836, 0.3261503, 0.8, 1, 0, 1,
-0.8223895, -0.2478994, -1.704929, 0.7921569, 1, 0, 1,
-0.8119864, -0.4805087, -1.32567, 0.7882353, 1, 0, 1,
-0.8112832, -0.8352345, -0.9575695, 0.7803922, 1, 0, 1,
-0.8049363, -0.921626, -4.849069, 0.7764706, 1, 0, 1,
-0.8031427, 0.1033351, -1.13346, 0.7686275, 1, 0, 1,
-0.8020179, -0.6827818, -3.02388, 0.7647059, 1, 0, 1,
-0.8009661, -0.8486599, -1.644305, 0.7568628, 1, 0, 1,
-0.7989263, 0.3129354, -1.24843, 0.7529412, 1, 0, 1,
-0.7978716, 0.7929373, -1.371169, 0.7450981, 1, 0, 1,
-0.7933014, 0.2079384, -0.6621873, 0.7411765, 1, 0, 1,
-0.7829143, -1.53683, -4.563052, 0.7333333, 1, 0, 1,
-0.7747803, 1.029999, 0.3949839, 0.7294118, 1, 0, 1,
-0.7723883, 1.27769, -1.283776, 0.7215686, 1, 0, 1,
-0.7709572, -2.160503, -2.580481, 0.7176471, 1, 0, 1,
-0.766456, -0.1723067, 0.008549095, 0.7098039, 1, 0, 1,
-0.7657192, 0.1144064, -0.7931893, 0.7058824, 1, 0, 1,
-0.7638935, -0.3310895, -2.564913, 0.6980392, 1, 0, 1,
-0.7620934, 0.2737424, -1.354728, 0.6901961, 1, 0, 1,
-0.7588015, 1.008424, 0.4842702, 0.6862745, 1, 0, 1,
-0.7575921, -1.978486, -1.803558, 0.6784314, 1, 0, 1,
-0.7556475, -1.400182, -2.625398, 0.6745098, 1, 0, 1,
-0.7551314, -0.4005993, -2.241108, 0.6666667, 1, 0, 1,
-0.7458556, -0.7496933, -2.315614, 0.6627451, 1, 0, 1,
-0.7434757, 0.04317049, -0.756493, 0.654902, 1, 0, 1,
-0.7418408, 1.214577, -1.497777, 0.6509804, 1, 0, 1,
-0.7415665, -0.7188167, -1.190027, 0.6431373, 1, 0, 1,
-0.7327583, 0.4902171, 0.1014181, 0.6392157, 1, 0, 1,
-0.7310448, -0.1236341, -1.38225, 0.6313726, 1, 0, 1,
-0.71715, 1.534708, -0.541024, 0.627451, 1, 0, 1,
-0.7160636, -1.867424, -4.634323, 0.6196079, 1, 0, 1,
-0.7146719, 0.232423, 0.4297464, 0.6156863, 1, 0, 1,
-0.7135037, -0.786059, -1.689925, 0.6078432, 1, 0, 1,
-0.7011687, 1.453449, 0.5141671, 0.6039216, 1, 0, 1,
-0.7005332, -1.30682, -3.1374, 0.5960785, 1, 0, 1,
-0.7000718, -0.9727489, -1.225071, 0.5882353, 1, 0, 1,
-0.6913305, 0.3680877, -1.966897, 0.5843138, 1, 0, 1,
-0.6873616, 0.4623228, -1.537622, 0.5764706, 1, 0, 1,
-0.6768704, 0.252928, -2.157092, 0.572549, 1, 0, 1,
-0.6757756, 0.1869812, -1.826457, 0.5647059, 1, 0, 1,
-0.6750635, 0.5606142, -0.9120322, 0.5607843, 1, 0, 1,
-0.6692442, -0.4673665, -3.900786, 0.5529412, 1, 0, 1,
-0.664169, 1.445243, 1.103785, 0.5490196, 1, 0, 1,
-0.6624132, 0.403752, 0.8294823, 0.5411765, 1, 0, 1,
-0.6599075, -0.5864235, -2.848269, 0.5372549, 1, 0, 1,
-0.6566131, -0.0445684, -0.3471255, 0.5294118, 1, 0, 1,
-0.6559701, -0.8697019, -4.437497, 0.5254902, 1, 0, 1,
-0.6556833, -0.452674, -3.372233, 0.5176471, 1, 0, 1,
-0.654663, 0.8652344, -1.247635, 0.5137255, 1, 0, 1,
-0.6470914, -0.946422, -3.055915, 0.5058824, 1, 0, 1,
-0.6454991, -0.9499396, -4.019658, 0.5019608, 1, 0, 1,
-0.6427345, 0.3442641, -0.3413828, 0.4941176, 1, 0, 1,
-0.6421316, 0.1228729, -2.346443, 0.4862745, 1, 0, 1,
-0.6404737, 0.1571345, -1.315118, 0.4823529, 1, 0, 1,
-0.6375808, -0.155517, -3.180214, 0.4745098, 1, 0, 1,
-0.6336966, -0.7334126, -2.310595, 0.4705882, 1, 0, 1,
-0.6334439, -0.8714685, -1.072641, 0.4627451, 1, 0, 1,
-0.6319141, -0.1793102, -0.9092688, 0.4588235, 1, 0, 1,
-0.6231405, 0.7303544, 0.1489392, 0.4509804, 1, 0, 1,
-0.6168385, 0.7470039, -0.7159014, 0.4470588, 1, 0, 1,
-0.6123602, 0.8066694, -1.25072, 0.4392157, 1, 0, 1,
-0.6062576, -0.7404709, -2.235529, 0.4352941, 1, 0, 1,
-0.605232, -1.450745, -2.344687, 0.427451, 1, 0, 1,
-0.6043929, 1.540362, 0.6458981, 0.4235294, 1, 0, 1,
-0.6033131, 0.6140495, -0.09264755, 0.4156863, 1, 0, 1,
-0.6020569, 1.133843, -1.177104, 0.4117647, 1, 0, 1,
-0.5964305, -0.5476111, -0.08200191, 0.4039216, 1, 0, 1,
-0.5950673, 0.04168051, -1.178016, 0.3960784, 1, 0, 1,
-0.592167, 0.9931393, -0.01723366, 0.3921569, 1, 0, 1,
-0.5891094, 0.3761312, -3.182132, 0.3843137, 1, 0, 1,
-0.5870252, 0.5951396, 1.09594, 0.3803922, 1, 0, 1,
-0.585451, -0.9129965, -3.056734, 0.372549, 1, 0, 1,
-0.5823526, 0.7724465, -1.556709, 0.3686275, 1, 0, 1,
-0.5801018, 2.011985, -1.933403, 0.3607843, 1, 0, 1,
-0.5767473, 0.4060686, -0.3124706, 0.3568628, 1, 0, 1,
-0.5578545, 0.4690763, -1.052174, 0.3490196, 1, 0, 1,
-0.556277, -0.2431128, -1.218693, 0.345098, 1, 0, 1,
-0.553988, 1.140016, -0.6725646, 0.3372549, 1, 0, 1,
-0.5531102, 0.1345611, -1.241141, 0.3333333, 1, 0, 1,
-0.5512405, -0.6941017, -2.849946, 0.3254902, 1, 0, 1,
-0.5497048, 0.9847618, -0.6696736, 0.3215686, 1, 0, 1,
-0.5439381, 0.03909, -2.205036, 0.3137255, 1, 0, 1,
-0.5399708, -1.156362, -4.343005, 0.3098039, 1, 0, 1,
-0.5399662, -0.2017176, -1.987939, 0.3019608, 1, 0, 1,
-0.5317334, 0.2921683, -0.4720432, 0.2941177, 1, 0, 1,
-0.5310656, 0.2980653, -0.705969, 0.2901961, 1, 0, 1,
-0.5284285, 2.132178, -1.10271, 0.282353, 1, 0, 1,
-0.5278654, 0.2809625, 0.6910288, 0.2784314, 1, 0, 1,
-0.5240018, -0.4095028, -1.29112, 0.2705882, 1, 0, 1,
-0.5187169, 0.1997645, -2.281511, 0.2666667, 1, 0, 1,
-0.5167693, 2.414473, 0.1684355, 0.2588235, 1, 0, 1,
-0.5150574, 0.7109795, -1.412587, 0.254902, 1, 0, 1,
-0.5101341, 1.286425, -0.4512569, 0.2470588, 1, 0, 1,
-0.5063869, 1.956644, 1.122902, 0.2431373, 1, 0, 1,
-0.5033605, -0.0216691, -1.433614, 0.2352941, 1, 0, 1,
-0.4998978, -0.7837508, -0.8072903, 0.2313726, 1, 0, 1,
-0.4964374, 1.677482, -0.4778804, 0.2235294, 1, 0, 1,
-0.4920063, -1.32811, -4.145745, 0.2196078, 1, 0, 1,
-0.4914608, -0.1410713, -0.723305, 0.2117647, 1, 0, 1,
-0.4903419, 0.932807, -1.168239, 0.2078431, 1, 0, 1,
-0.4879176, -1.130397, -1.968821, 0.2, 1, 0, 1,
-0.4864751, -1.913936, -0.156263, 0.1921569, 1, 0, 1,
-0.4800987, -1.034943, -3.354742, 0.1882353, 1, 0, 1,
-0.4773073, -0.7168847, -2.004476, 0.1803922, 1, 0, 1,
-0.4742557, 0.2594749, -1.240325, 0.1764706, 1, 0, 1,
-0.4721546, 0.2717515, -1.376953, 0.1686275, 1, 0, 1,
-0.4716829, 0.1886755, -2.950109, 0.1647059, 1, 0, 1,
-0.470425, 0.671199, -1.343866, 0.1568628, 1, 0, 1,
-0.4685148, -0.3025598, -0.1638852, 0.1529412, 1, 0, 1,
-0.4674973, 0.01189513, -1.244489, 0.145098, 1, 0, 1,
-0.4670333, 0.671443, -1.107368, 0.1411765, 1, 0, 1,
-0.466883, -1.001608, -2.778792, 0.1333333, 1, 0, 1,
-0.4659134, -0.9948252, -4.042244, 0.1294118, 1, 0, 1,
-0.4610432, -0.3064834, -1.740978, 0.1215686, 1, 0, 1,
-0.4583893, 1.097227, -0.6812567, 0.1176471, 1, 0, 1,
-0.4580066, 0.2629106, -0.6808035, 0.1098039, 1, 0, 1,
-0.4481397, 0.5098969, 0.1711531, 0.1058824, 1, 0, 1,
-0.4435606, 0.7295934, 0.4146308, 0.09803922, 1, 0, 1,
-0.4419979, 0.2799642, 0.1101939, 0.09019608, 1, 0, 1,
-0.4393967, -0.2372355, -1.845115, 0.08627451, 1, 0, 1,
-0.4386372, 1.334671, -0.2323077, 0.07843138, 1, 0, 1,
-0.4322172, -0.2302122, -2.840568, 0.07450981, 1, 0, 1,
-0.428377, 1.79151, 0.1249935, 0.06666667, 1, 0, 1,
-0.4245889, 0.3761624, -2.266259, 0.0627451, 1, 0, 1,
-0.4171545, 0.6717922, 0.8450682, 0.05490196, 1, 0, 1,
-0.4121875, -0.8636739, -3.881381, 0.05098039, 1, 0, 1,
-0.4102772, -1.125404, -4.010438, 0.04313726, 1, 0, 1,
-0.4100359, 0.6526743, -0.09932303, 0.03921569, 1, 0, 1,
-0.4085103, -0.7438694, -2.246272, 0.03137255, 1, 0, 1,
-0.4062888, -0.7025351, -4.015197, 0.02745098, 1, 0, 1,
-0.4060836, -0.06295703, -1.551887, 0.01960784, 1, 0, 1,
-0.405052, -0.7613835, -2.810212, 0.01568628, 1, 0, 1,
-0.4006002, 0.04373153, -2.886977, 0.007843138, 1, 0, 1,
-0.396854, -1.319626, -3.186481, 0.003921569, 1, 0, 1,
-0.3961739, -0.4149666, -3.105103, 0, 1, 0.003921569, 1,
-0.3923845, -0.03438454, -3.13346, 0, 1, 0.01176471, 1,
-0.3921846, -0.2750751, -1.985904, 0, 1, 0.01568628, 1,
-0.3911072, 1.308985, 1.137498, 0, 1, 0.02352941, 1,
-0.3910252, -0.1821082, -2.11795, 0, 1, 0.02745098, 1,
-0.3895483, -0.5865898, -4.98219, 0, 1, 0.03529412, 1,
-0.3850888, -1.514988, -4.315294, 0, 1, 0.03921569, 1,
-0.3843032, 1.561398, 0.01508733, 0, 1, 0.04705882, 1,
-0.3816205, 0.180433, 1.417764, 0, 1, 0.05098039, 1,
-0.3802239, -1.468733, -1.576986, 0, 1, 0.05882353, 1,
-0.3788716, 1.55018, 0.5425435, 0, 1, 0.0627451, 1,
-0.3785079, 0.9759911, 1.554462, 0, 1, 0.07058824, 1,
-0.3709491, 1.23263, 0.2654213, 0, 1, 0.07450981, 1,
-0.3707406, 1.507857, 0.7420935, 0, 1, 0.08235294, 1,
-0.3705014, -0.7568027, -0.9990556, 0, 1, 0.08627451, 1,
-0.3697772, 1.261386, -1.906555, 0, 1, 0.09411765, 1,
-0.3670519, 0.04290669, -3.142158, 0, 1, 0.1019608, 1,
-0.3629592, -0.3374336, -1.865401, 0, 1, 0.1058824, 1,
-0.3606334, 0.4866599, -0.8352232, 0, 1, 0.1137255, 1,
-0.3585102, 0.3091652, -2.293248, 0, 1, 0.1176471, 1,
-0.3545611, -1.823358, -2.202093, 0, 1, 0.1254902, 1,
-0.3541419, -0.1048198, -3.998256, 0, 1, 0.1294118, 1,
-0.3532033, 1.407083, 0.8173385, 0, 1, 0.1372549, 1,
-0.3473853, -1.164789, -1.200721, 0, 1, 0.1411765, 1,
-0.3463589, 0.05863733, -4.135226, 0, 1, 0.1490196, 1,
-0.345885, -0.9390766, -1.486824, 0, 1, 0.1529412, 1,
-0.3420333, -1.313457, -4.269177, 0, 1, 0.1607843, 1,
-0.3412553, 0.320482, -0.6257751, 0, 1, 0.1647059, 1,
-0.3373477, -0.07292966, -0.3008996, 0, 1, 0.172549, 1,
-0.3360823, 1.330918, 0.001635919, 0, 1, 0.1764706, 1,
-0.3320622, -0.06401329, -0.6980831, 0, 1, 0.1843137, 1,
-0.3309642, -0.3096177, -2.685179, 0, 1, 0.1882353, 1,
-0.3303427, 0.4838065, -0.1427806, 0, 1, 0.1960784, 1,
-0.3296651, -0.6638242, -2.000652, 0, 1, 0.2039216, 1,
-0.3256527, -1.789716, -2.537549, 0, 1, 0.2078431, 1,
-0.3238396, 1.694192, 0.3010567, 0, 1, 0.2156863, 1,
-0.3218632, 1.552779, 0.6126572, 0, 1, 0.2196078, 1,
-0.3209863, -0.3751274, -1.495653, 0, 1, 0.227451, 1,
-0.3147127, -0.260446, -0.3417929, 0, 1, 0.2313726, 1,
-0.3138254, -1.012979, -3.320977, 0, 1, 0.2392157, 1,
-0.311876, 2.293687, 1.487985, 0, 1, 0.2431373, 1,
-0.3109598, -2.5369, -3.797092, 0, 1, 0.2509804, 1,
-0.3098647, -0.6712345, -4.730225, 0, 1, 0.254902, 1,
-0.308832, 0.1580793, -1.77628, 0, 1, 0.2627451, 1,
-0.3073979, -0.2881334, -2.983242, 0, 1, 0.2666667, 1,
-0.3040852, 1.762061, 0.9264681, 0, 1, 0.2745098, 1,
-0.2977895, 0.8757948, -0.7437696, 0, 1, 0.2784314, 1,
-0.2960054, -0.2170998, -2.808358, 0, 1, 0.2862745, 1,
-0.2952911, -0.02487282, -0.7806965, 0, 1, 0.2901961, 1,
-0.2946919, -0.1632879, -3.098234, 0, 1, 0.2980392, 1,
-0.2945927, -0.3656741, -4.125166, 0, 1, 0.3058824, 1,
-0.2885338, 0.3850046, -0.2867337, 0, 1, 0.3098039, 1,
-0.2867522, -1.785383, -2.217831, 0, 1, 0.3176471, 1,
-0.2836747, -0.4848712, -4.109612, 0, 1, 0.3215686, 1,
-0.2823027, 1.185734, -2.132206, 0, 1, 0.3294118, 1,
-0.282287, 1.783003, 0.3543298, 0, 1, 0.3333333, 1,
-0.2819818, -0.6179481, -3.329076, 0, 1, 0.3411765, 1,
-0.2813555, -1.385993, -2.874254, 0, 1, 0.345098, 1,
-0.2811193, 0.1590073, -0.005235483, 0, 1, 0.3529412, 1,
-0.2749757, 1.306951, -0.749374, 0, 1, 0.3568628, 1,
-0.2729014, 0.5538662, 0.2846992, 0, 1, 0.3647059, 1,
-0.2669411, -0.6652517, -2.877554, 0, 1, 0.3686275, 1,
-0.2659626, 1.183789, 0.507539, 0, 1, 0.3764706, 1,
-0.2656786, 0.8261386, 0.7053155, 0, 1, 0.3803922, 1,
-0.2655221, 0.8284544, 0.9840674, 0, 1, 0.3882353, 1,
-0.2638568, -2.885726, -1.55104, 0, 1, 0.3921569, 1,
-0.2600129, 1.018895, -1.108661, 0, 1, 0.4, 1,
-0.2563388, 0.8188215, -0.4541678, 0, 1, 0.4078431, 1,
-0.2552813, -0.02254649, -2.051647, 0, 1, 0.4117647, 1,
-0.2508341, 0.905772, 0.5655659, 0, 1, 0.4196078, 1,
-0.2476644, -0.4132129, -2.237212, 0, 1, 0.4235294, 1,
-0.2470392, 0.2035036, -1.528429, 0, 1, 0.4313726, 1,
-0.2460623, -0.68712, -4.687111, 0, 1, 0.4352941, 1,
-0.2423781, -1.498984, -2.640053, 0, 1, 0.4431373, 1,
-0.2403653, 1.187851, 0.2367197, 0, 1, 0.4470588, 1,
-0.2403648, -0.5741142, -2.376869, 0, 1, 0.454902, 1,
-0.2377085, 0.6022716, 0.5424896, 0, 1, 0.4588235, 1,
-0.235102, 2.12415, -1.119586, 0, 1, 0.4666667, 1,
-0.2348524, -0.1023452, -1.709726, 0, 1, 0.4705882, 1,
-0.2324299, 1.444279, -0.3879071, 0, 1, 0.4784314, 1,
-0.2262668, -0.4074799, -3.169558, 0, 1, 0.4823529, 1,
-0.2214533, -2.564096, -2.876991, 0, 1, 0.4901961, 1,
-0.2156781, -0.474772, -3.416319, 0, 1, 0.4941176, 1,
-0.2149676, 0.9028829, -0.001724546, 0, 1, 0.5019608, 1,
-0.2141329, 1.602573, -0.002358421, 0, 1, 0.509804, 1,
-0.2132017, 1.509225, 0.6008958, 0, 1, 0.5137255, 1,
-0.2084074, 1.033777, -1.892733, 0, 1, 0.5215687, 1,
-0.2077859, -0.988559, -2.190232, 0, 1, 0.5254902, 1,
-0.2066288, -0.8680592, -3.418414, 0, 1, 0.5333334, 1,
-0.202796, -1.28154, -2.195214, 0, 1, 0.5372549, 1,
-0.1974361, -0.1504092, -3.814842, 0, 1, 0.5450981, 1,
-0.1948191, 0.6946119, -0.1919856, 0, 1, 0.5490196, 1,
-0.1939638, -0.4401019, -3.106017, 0, 1, 0.5568628, 1,
-0.1934, 2.067353, 1.600604, 0, 1, 0.5607843, 1,
-0.1907785, 0.6550497, 0.01754862, 0, 1, 0.5686275, 1,
-0.1893822, 1.157899, -0.05062833, 0, 1, 0.572549, 1,
-0.1885426, 0.4709395, 0.5424961, 0, 1, 0.5803922, 1,
-0.185092, -0.2840571, -2.267817, 0, 1, 0.5843138, 1,
-0.1842557, -0.1366723, -2.532383, 0, 1, 0.5921569, 1,
-0.183132, -0.1134604, -1.398789, 0, 1, 0.5960785, 1,
-0.1825606, -0.1323889, -2.789314, 0, 1, 0.6039216, 1,
-0.1800446, 1.436776, -0.5589061, 0, 1, 0.6117647, 1,
-0.1766609, 0.3948376, 0.6561489, 0, 1, 0.6156863, 1,
-0.1753789, 0.08681719, -1.338133, 0, 1, 0.6235294, 1,
-0.1742324, -0.1287862, -1.819757, 0, 1, 0.627451, 1,
-0.1734749, -0.5583476, -2.599392, 0, 1, 0.6352941, 1,
-0.1723403, -2.402261, -2.966224, 0, 1, 0.6392157, 1,
-0.17061, 1.991201, 1.012631, 0, 1, 0.6470588, 1,
-0.1655846, 0.8675793, 0.5433094, 0, 1, 0.6509804, 1,
-0.1604575, 1.495357, -0.03965828, 0, 1, 0.6588235, 1,
-0.1581335, -0.4138496, -3.502092, 0, 1, 0.6627451, 1,
-0.1575705, -0.8434848, -2.929404, 0, 1, 0.6705883, 1,
-0.1553412, 1.261729, 0.8261129, 0, 1, 0.6745098, 1,
-0.1528333, 0.8636387, 1.908872, 0, 1, 0.682353, 1,
-0.1525067, -0.7541286, -4.013211, 0, 1, 0.6862745, 1,
-0.1516625, -0.8551772, -3.34536, 0, 1, 0.6941177, 1,
-0.1513341, -0.1090495, -0.07810742, 0, 1, 0.7019608, 1,
-0.147407, -0.0105788, -1.407093, 0, 1, 0.7058824, 1,
-0.1463488, 0.7997169, -1.141533, 0, 1, 0.7137255, 1,
-0.1457836, 1.048074, -1.817733, 0, 1, 0.7176471, 1,
-0.1456486, 0.5319121, 0.5912489, 0, 1, 0.7254902, 1,
-0.1455386, -1.278024, -4.783757, 0, 1, 0.7294118, 1,
-0.1438345, 0.4184321, -1.328379, 0, 1, 0.7372549, 1,
-0.1434233, -0.2829465, -2.951144, 0, 1, 0.7411765, 1,
-0.1379562, 1.190955, -0.8457049, 0, 1, 0.7490196, 1,
-0.135243, -0.3096024, -1.237588, 0, 1, 0.7529412, 1,
-0.135175, 0.6795524, 0.02807613, 0, 1, 0.7607843, 1,
-0.1279425, 1.435774, -1.143322, 0, 1, 0.7647059, 1,
-0.1249919, 1.28511, 0.7135889, 0, 1, 0.772549, 1,
-0.1218535, -0.509169, -2.255855, 0, 1, 0.7764706, 1,
-0.114714, 1.312477, 1.452832, 0, 1, 0.7843137, 1,
-0.1139158, 0.5377223, -1.077924, 0, 1, 0.7882353, 1,
-0.112656, -0.1940474, -2.803579, 0, 1, 0.7960784, 1,
-0.109257, -0.47539, -2.661283, 0, 1, 0.8039216, 1,
-0.1077579, -0.1758026, -0.6139999, 0, 1, 0.8078431, 1,
-0.1050205, -1.950168, -4.378411, 0, 1, 0.8156863, 1,
-0.1019033, -0.667738, -3.680557, 0, 1, 0.8196079, 1,
-0.09838101, 1.846844, 0.003735068, 0, 1, 0.827451, 1,
-0.09594442, 2.086962, -0.8029634, 0, 1, 0.8313726, 1,
-0.09088184, 1.785443, 0.919251, 0, 1, 0.8392157, 1,
-0.09025555, 0.8476168, -0.09267879, 0, 1, 0.8431373, 1,
-0.08684743, -1.811859, -0.7994568, 0, 1, 0.8509804, 1,
-0.08473312, -0.4455566, -3.31916, 0, 1, 0.854902, 1,
-0.08331027, -1.102227, -3.141574, 0, 1, 0.8627451, 1,
-0.07940892, -1.577708, -3.534547, 0, 1, 0.8666667, 1,
-0.074983, -0.002060374, -0.8144292, 0, 1, 0.8745098, 1,
-0.07475469, -0.1912754, -3.894325, 0, 1, 0.8784314, 1,
-0.07326847, 0.3486609, 0.6129166, 0, 1, 0.8862745, 1,
-0.07155254, 0.9865029, -0.9248673, 0, 1, 0.8901961, 1,
-0.06839256, -1.070246, -1.47194, 0, 1, 0.8980392, 1,
-0.05690823, -0.999314, -3.38903, 0, 1, 0.9058824, 1,
-0.0552077, 0.06961213, -0.7484999, 0, 1, 0.9098039, 1,
-0.04584115, 0.891626, 0.373908, 0, 1, 0.9176471, 1,
-0.04434606, -1.404296, -3.484612, 0, 1, 0.9215686, 1,
-0.04298268, 0.1333967, -1.070598, 0, 1, 0.9294118, 1,
-0.03730976, 0.6051939, -0.3708034, 0, 1, 0.9333333, 1,
-0.03437106, -0.06072984, -2.910956, 0, 1, 0.9411765, 1,
-0.03339805, -0.1741457, -3.380354, 0, 1, 0.945098, 1,
-0.02893725, 1.505421, 0.8788648, 0, 1, 0.9529412, 1,
-0.02303247, 1.176027, 0.3827036, 0, 1, 0.9568627, 1,
-0.01469192, -0.4493357, -1.877943, 0, 1, 0.9647059, 1,
-0.01421141, -0.7002976, -4.048851, 0, 1, 0.9686275, 1,
-0.01398197, 0.09161463, 0.6225913, 0, 1, 0.9764706, 1,
-0.01292252, -0.3156492, -3.302265, 0, 1, 0.9803922, 1,
-0.01173851, -1.616205, -2.235719, 0, 1, 0.9882353, 1,
-0.003445, -1.3635, -2.85504, 0, 1, 0.9921569, 1,
0.0006370503, -0.7649865, 3.610238, 0, 1, 1, 1,
0.0009591525, -0.5220839, 4.4138, 0, 0.9921569, 1, 1,
0.002587336, 1.616416, 0.9415568, 0, 0.9882353, 1, 1,
0.005635779, 0.5726017, 0.4035769, 0, 0.9803922, 1, 1,
0.006619541, 0.44179, -0.7446052, 0, 0.9764706, 1, 1,
0.007079589, -0.2505143, 2.631454, 0, 0.9686275, 1, 1,
0.01604593, -1.419028, 2.465338, 0, 0.9647059, 1, 1,
0.01695078, -0.08946123, 3.854626, 0, 0.9568627, 1, 1,
0.0217369, 1.496164, -0.2424914, 0, 0.9529412, 1, 1,
0.0229343, 0.1879403, 0.8141301, 0, 0.945098, 1, 1,
0.03024098, 0.565386, 2.031753, 0, 0.9411765, 1, 1,
0.0357479, -1.327865, 3.573735, 0, 0.9333333, 1, 1,
0.03616172, 0.5406613, -0.4459514, 0, 0.9294118, 1, 1,
0.04151328, 0.9090202, 0.3313516, 0, 0.9215686, 1, 1,
0.04366758, 1.500033, -0.4854412, 0, 0.9176471, 1, 1,
0.04433917, 0.6245009, -1.00626, 0, 0.9098039, 1, 1,
0.04526563, -1.425883, 2.611448, 0, 0.9058824, 1, 1,
0.04565228, -0.541285, 2.002798, 0, 0.8980392, 1, 1,
0.05063251, -0.2772549, 3.135995, 0, 0.8901961, 1, 1,
0.0526687, 0.07859707, -0.4431927, 0, 0.8862745, 1, 1,
0.05315168, -1.376655, 4.294837, 0, 0.8784314, 1, 1,
0.05449884, -0.4574678, 2.465874, 0, 0.8745098, 1, 1,
0.05863374, -0.6375802, 4.264702, 0, 0.8666667, 1, 1,
0.05958036, -0.3526015, 3.132319, 0, 0.8627451, 1, 1,
0.06229069, 0.7038336, -0.983738, 0, 0.854902, 1, 1,
0.06628202, 2.087679, 1.739628, 0, 0.8509804, 1, 1,
0.0724526, -0.7956176, 2.350338, 0, 0.8431373, 1, 1,
0.07416142, -0.5046718, 1.768615, 0, 0.8392157, 1, 1,
0.08278218, 1.994145, 0.08044711, 0, 0.8313726, 1, 1,
0.08453111, -0.4349428, 1.972037, 0, 0.827451, 1, 1,
0.08892777, 0.9448984, -0.3645594, 0, 0.8196079, 1, 1,
0.08907027, 0.5310183, -0.01859022, 0, 0.8156863, 1, 1,
0.09097172, 0.323896, 0.9977276, 0, 0.8078431, 1, 1,
0.09119219, 0.7113668, 0.491678, 0, 0.8039216, 1, 1,
0.09420805, 1.487722, 1.12817, 0, 0.7960784, 1, 1,
0.09538659, -0.3518369, 2.108522, 0, 0.7882353, 1, 1,
0.09538686, -1.488689, 4.075081, 0, 0.7843137, 1, 1,
0.09813694, 0.2036002, 0.5721137, 0, 0.7764706, 1, 1,
0.099222, 0.7232623, -0.6097193, 0, 0.772549, 1, 1,
0.09990504, 1.175663, -1.81954, 0, 0.7647059, 1, 1,
0.1026176, 0.2125819, 2.268796, 0, 0.7607843, 1, 1,
0.1068208, -0.252229, 1.928328, 0, 0.7529412, 1, 1,
0.1091519, 0.4895817, -0.1966398, 0, 0.7490196, 1, 1,
0.1093945, -1.487108, 3.114811, 0, 0.7411765, 1, 1,
0.113809, -0.7221212, 3.080646, 0, 0.7372549, 1, 1,
0.1176853, 0.5849949, 1.24866, 0, 0.7294118, 1, 1,
0.1194511, -1.512692, 3.80789, 0, 0.7254902, 1, 1,
0.12012, -0.3224541, 4.552998, 0, 0.7176471, 1, 1,
0.120601, -0.7341285, 3.028397, 0, 0.7137255, 1, 1,
0.1253887, 1.024369, 0.437746, 0, 0.7058824, 1, 1,
0.1258946, 0.960737, -1.077336, 0, 0.6980392, 1, 1,
0.1280896, 0.7779776, 0.8743536, 0, 0.6941177, 1, 1,
0.1285444, 0.09151909, 0.662861, 0, 0.6862745, 1, 1,
0.128609, 1.014164, 0.06315687, 0, 0.682353, 1, 1,
0.1385101, -0.5725003, 4.512917, 0, 0.6745098, 1, 1,
0.1388406, -0.7512663, 3.3813, 0, 0.6705883, 1, 1,
0.1404776, -1.643323, 3.927228, 0, 0.6627451, 1, 1,
0.1410135, -1.297305, 4.983936, 0, 0.6588235, 1, 1,
0.1424822, 1.097399, 0.5850406, 0, 0.6509804, 1, 1,
0.143567, 2.177177, -0.09972671, 0, 0.6470588, 1, 1,
0.1461874, 1.069052, -0.6236771, 0, 0.6392157, 1, 1,
0.1497225, 1.934133, -0.1102026, 0, 0.6352941, 1, 1,
0.1502915, -0.4982212, 1.749656, 0, 0.627451, 1, 1,
0.152248, -0.6923563, 4.365852, 0, 0.6235294, 1, 1,
0.1524665, 0.2340605, 1.341914, 0, 0.6156863, 1, 1,
0.1534826, 0.09445638, 0.9557741, 0, 0.6117647, 1, 1,
0.1538728, 1.023299, 0.3934288, 0, 0.6039216, 1, 1,
0.1552317, 0.9315912, -0.9641151, 0, 0.5960785, 1, 1,
0.1558796, -0.04688907, 2.523618, 0, 0.5921569, 1, 1,
0.1582235, -0.8814898, 2.591362, 0, 0.5843138, 1, 1,
0.1606701, 1.052014, 0.03457513, 0, 0.5803922, 1, 1,
0.1624647, -0.1783377, 1.977717, 0, 0.572549, 1, 1,
0.1626051, 0.7245964, 0.7778651, 0, 0.5686275, 1, 1,
0.1630497, -0.2145133, 2.14573, 0, 0.5607843, 1, 1,
0.1636575, -1.909447, 3.465557, 0, 0.5568628, 1, 1,
0.1649553, 1.19677, 0.6054471, 0, 0.5490196, 1, 1,
0.1657183, -1.139666, 2.802793, 0, 0.5450981, 1, 1,
0.1657311, 0.3133706, 1.062736, 0, 0.5372549, 1, 1,
0.1749564, 1.631321, 0.3623654, 0, 0.5333334, 1, 1,
0.1794249, 1.13296, 0.2042465, 0, 0.5254902, 1, 1,
0.1795411, -0.1752903, 2.842037, 0, 0.5215687, 1, 1,
0.191489, -0.5463322, 2.336988, 0, 0.5137255, 1, 1,
0.1939107, -0.04480444, 1.542934, 0, 0.509804, 1, 1,
0.1966098, -1.2624, 2.982108, 0, 0.5019608, 1, 1,
0.1979291, -0.1605084, 1.57591, 0, 0.4941176, 1, 1,
0.2005503, 2.170548, -1.431883, 0, 0.4901961, 1, 1,
0.2026035, -0.5054099, 2.43771, 0, 0.4823529, 1, 1,
0.2035433, -0.2740997, 2.553735, 0, 0.4784314, 1, 1,
0.2043462, -0.5675291, 3.332757, 0, 0.4705882, 1, 1,
0.2053451, -2.018238, 4.306916, 0, 0.4666667, 1, 1,
0.2065199, 0.333128, 1.402309, 0, 0.4588235, 1, 1,
0.2071837, 0.310938, 0.4299836, 0, 0.454902, 1, 1,
0.2076124, -1.281904, 2.547713, 0, 0.4470588, 1, 1,
0.210189, 0.3209737, 1.329769, 0, 0.4431373, 1, 1,
0.2145269, -0.5038188, 3.506602, 0, 0.4352941, 1, 1,
0.2156219, 0.9050974, 0.3158979, 0, 0.4313726, 1, 1,
0.2167155, -1.260556, 3.182203, 0, 0.4235294, 1, 1,
0.2170807, 0.9590654, -0.008961289, 0, 0.4196078, 1, 1,
0.2215291, -0.4815368, 1.731786, 0, 0.4117647, 1, 1,
0.2226633, -2.569101, 5.188155, 0, 0.4078431, 1, 1,
0.2296303, 0.3811392, -0.729854, 0, 0.4, 1, 1,
0.2301192, -0.8064425, 3.235942, 0, 0.3921569, 1, 1,
0.2309477, -1.383984, 4.953284, 0, 0.3882353, 1, 1,
0.2313856, 0.5141477, -0.9631684, 0, 0.3803922, 1, 1,
0.2352766, 2.325463, 0.416259, 0, 0.3764706, 1, 1,
0.2368241, 1.525608, 0.1144942, 0, 0.3686275, 1, 1,
0.2379953, -2.382922, 2.628965, 0, 0.3647059, 1, 1,
0.2383709, -0.4083318, 2.438431, 0, 0.3568628, 1, 1,
0.2407248, 0.6668913, 0.08532494, 0, 0.3529412, 1, 1,
0.2410577, -0.2833856, 1.336201, 0, 0.345098, 1, 1,
0.2417748, -0.2323442, 0.9107115, 0, 0.3411765, 1, 1,
0.242858, -0.2718354, 2.890899, 0, 0.3333333, 1, 1,
0.2435144, 0.1126442, 1.177803, 0, 0.3294118, 1, 1,
0.2462261, -0.5214485, 3.166385, 0, 0.3215686, 1, 1,
0.2463427, 0.9282975, 0.681565, 0, 0.3176471, 1, 1,
0.2489159, -1.820334, 3.382587, 0, 0.3098039, 1, 1,
0.2494925, 0.1488894, 1.967524, 0, 0.3058824, 1, 1,
0.2498046, -0.6124896, 3.273566, 0, 0.2980392, 1, 1,
0.2499904, -0.3514366, 2.970259, 0, 0.2901961, 1, 1,
0.252298, -0.389592, 1.308498, 0, 0.2862745, 1, 1,
0.2532121, 0.7322878, 1.47649, 0, 0.2784314, 1, 1,
0.2553007, 0.1478738, 1.089613, 0, 0.2745098, 1, 1,
0.2564094, 0.6047305, -0.2572786, 0, 0.2666667, 1, 1,
0.2577276, -1.059813, 3.33041, 0, 0.2627451, 1, 1,
0.2624509, 0.6400447, -0.1363819, 0, 0.254902, 1, 1,
0.2655515, -0.870898, 2.910343, 0, 0.2509804, 1, 1,
0.2691202, 0.5897904, 0.1986869, 0, 0.2431373, 1, 1,
0.2707025, -0.4523665, 3.146055, 0, 0.2392157, 1, 1,
0.2746579, -2.072522, 5.832261, 0, 0.2313726, 1, 1,
0.2763151, 0.6730074, -1.503589, 0, 0.227451, 1, 1,
0.2764757, 0.2735472, 0.2522656, 0, 0.2196078, 1, 1,
0.282417, 0.3455347, 1.789943, 0, 0.2156863, 1, 1,
0.2848715, 0.8987761, 2.072147, 0, 0.2078431, 1, 1,
0.2923502, 0.5513275, 0.9434438, 0, 0.2039216, 1, 1,
0.2928942, -1.395882, 5.467836, 0, 0.1960784, 1, 1,
0.2944174, 1.161632, -0.4293955, 0, 0.1882353, 1, 1,
0.3020235, 0.7318338, -0.587459, 0, 0.1843137, 1, 1,
0.305363, 1.034856, 0.3432112, 0, 0.1764706, 1, 1,
0.3059759, -1.31318, 2.835002, 0, 0.172549, 1, 1,
0.3079875, 0.5484108, -0.8091959, 0, 0.1647059, 1, 1,
0.3103889, -0.2019555, 1.60412, 0, 0.1607843, 1, 1,
0.318327, -0.2962409, 3.551995, 0, 0.1529412, 1, 1,
0.3197942, 1.28617, 1.716827, 0, 0.1490196, 1, 1,
0.3205307, -0.8368331, 4.397283, 0, 0.1411765, 1, 1,
0.3291808, 1.714, 1.128228, 0, 0.1372549, 1, 1,
0.3350861, 0.01239412, 1.772413, 0, 0.1294118, 1, 1,
0.33789, 0.5218528, 0.9361783, 0, 0.1254902, 1, 1,
0.3412655, -0.7859305, 2.632514, 0, 0.1176471, 1, 1,
0.3462357, 0.9173787, 0.3163366, 0, 0.1137255, 1, 1,
0.3490853, -1.334022, 3.019228, 0, 0.1058824, 1, 1,
0.3497585, -0.6178796, 3.06072, 0, 0.09803922, 1, 1,
0.3499502, 0.07893724, 0.02240958, 0, 0.09411765, 1, 1,
0.3539556, -0.1384777, 1.761845, 0, 0.08627451, 1, 1,
0.359524, -1.616323, 4.224324, 0, 0.08235294, 1, 1,
0.360692, 0.2899713, 0.8713664, 0, 0.07450981, 1, 1,
0.3618085, -0.2472215, 2.086985, 0, 0.07058824, 1, 1,
0.3626176, -0.505241, 3.730969, 0, 0.0627451, 1, 1,
0.363099, 0.4069139, 1.654778, 0, 0.05882353, 1, 1,
0.3657778, -2.462847, 1.822087, 0, 0.05098039, 1, 1,
0.3658609, 0.5305471, 0.6913651, 0, 0.04705882, 1, 1,
0.3663028, 0.6213089, 2.233685, 0, 0.03921569, 1, 1,
0.3703212, 0.7835013, -0.1583196, 0, 0.03529412, 1, 1,
0.3708911, 1.394837, -0.06791679, 0, 0.02745098, 1, 1,
0.3766685, 2.491246, -0.7139634, 0, 0.02352941, 1, 1,
0.3782945, 0.9282374, 0.965157, 0, 0.01568628, 1, 1,
0.387066, -0.05329172, 1.45756, 0, 0.01176471, 1, 1,
0.3884815, 0.1389399, 0.3896178, 0, 0.003921569, 1, 1,
0.3886175, 0.3219813, 1.05471, 0.003921569, 0, 1, 1,
0.3932057, 0.5607888, 0.05523283, 0.007843138, 0, 1, 1,
0.3944563, 0.05605343, 1.678623, 0.01568628, 0, 1, 1,
0.3955813, -0.6337604, 2.025471, 0.01960784, 0, 1, 1,
0.4002656, -2.486264, 3.311239, 0.02745098, 0, 1, 1,
0.4034916, -0.3211916, 2.233324, 0.03137255, 0, 1, 1,
0.4048548, -1.608202, 2.278824, 0.03921569, 0, 1, 1,
0.4114754, 0.345378, -0.1716825, 0.04313726, 0, 1, 1,
0.4115819, -1.719017, 1.064196, 0.05098039, 0, 1, 1,
0.4135782, 0.5946992, -0.4833497, 0.05490196, 0, 1, 1,
0.418559, 0.05609105, 2.463565, 0.0627451, 0, 1, 1,
0.4254884, 0.8560202, 1.285535, 0.06666667, 0, 1, 1,
0.4409163, 0.6316692, 2.703461, 0.07450981, 0, 1, 1,
0.4473835, -0.5782601, 3.114476, 0.07843138, 0, 1, 1,
0.4504046, 0.09495776, 2.167323, 0.08627451, 0, 1, 1,
0.4540163, -0.2107415, 1.886062, 0.09019608, 0, 1, 1,
0.4543312, 0.5488688, 0.951398, 0.09803922, 0, 1, 1,
0.4545541, 0.9447895, 0.207941, 0.1058824, 0, 1, 1,
0.4581868, -0.9494579, 2.015748, 0.1098039, 0, 1, 1,
0.4591387, 2.039063, -0.7061216, 0.1176471, 0, 1, 1,
0.4625992, 0.6489487, 0.3337542, 0.1215686, 0, 1, 1,
0.4658929, 0.8289781, 0.9442552, 0.1294118, 0, 1, 1,
0.4668387, -1.126339, 2.215437, 0.1333333, 0, 1, 1,
0.4675919, -0.9155188, 1.705566, 0.1411765, 0, 1, 1,
0.4753507, 0.137638, 1.201561, 0.145098, 0, 1, 1,
0.4763528, 1.987684, -1.256933, 0.1529412, 0, 1, 1,
0.4765434, 1.888705, -0.4932406, 0.1568628, 0, 1, 1,
0.4825864, -1.799323, 4.109715, 0.1647059, 0, 1, 1,
0.4827344, 2.046033, -1.072237, 0.1686275, 0, 1, 1,
0.5072126, -1.833541, 2.235405, 0.1764706, 0, 1, 1,
0.5136693, 0.8919893, 0.4409863, 0.1803922, 0, 1, 1,
0.518788, 1.511954, 0.4866637, 0.1882353, 0, 1, 1,
0.5215901, 1.554362, -1.286486, 0.1921569, 0, 1, 1,
0.532905, 1.392173, -1.182564, 0.2, 0, 1, 1,
0.5344583, -1.4893, 2.825203, 0.2078431, 0, 1, 1,
0.5366558, -1.808295, 1.706345, 0.2117647, 0, 1, 1,
0.5376612, 0.007477403, 1.493345, 0.2196078, 0, 1, 1,
0.5382624, -2.243975, 1.434963, 0.2235294, 0, 1, 1,
0.5394137, -0.2015529, 2.493872, 0.2313726, 0, 1, 1,
0.5410503, -0.2349663, 1.141257, 0.2352941, 0, 1, 1,
0.5422348, 0.9746874, 1.863737, 0.2431373, 0, 1, 1,
0.5455413, 0.3878873, 1.112754, 0.2470588, 0, 1, 1,
0.5455947, -0.06711546, 0.6538247, 0.254902, 0, 1, 1,
0.5484055, -0.6472995, 2.603757, 0.2588235, 0, 1, 1,
0.5491142, -0.9510589, 2.594288, 0.2666667, 0, 1, 1,
0.5555527, 1.664093, 1.900098, 0.2705882, 0, 1, 1,
0.5572317, 1.328874, 2.093379, 0.2784314, 0, 1, 1,
0.5606713, -0.7337199, 2.874966, 0.282353, 0, 1, 1,
0.5624478, 1.764366, 0.9815277, 0.2901961, 0, 1, 1,
0.5644895, -1.590568, -0.04102532, 0.2941177, 0, 1, 1,
0.5654594, 0.06395527, 1.751962, 0.3019608, 0, 1, 1,
0.5710172, 1.555972, 0.1053397, 0.3098039, 0, 1, 1,
0.5723596, -0.4990797, 0.812957, 0.3137255, 0, 1, 1,
0.5796776, 1.605481, -0.1797963, 0.3215686, 0, 1, 1,
0.5802189, 1.003002, 1.189754, 0.3254902, 0, 1, 1,
0.581093, 0.2414887, 1.535217, 0.3333333, 0, 1, 1,
0.5859874, 0.7675766, 0.09399689, 0.3372549, 0, 1, 1,
0.5884774, 1.071937, 2.730233, 0.345098, 0, 1, 1,
0.5930111, -0.3768682, 1.926084, 0.3490196, 0, 1, 1,
0.5944738, 0.3277136, -0.3679973, 0.3568628, 0, 1, 1,
0.5944817, -0.8717589, 2.101241, 0.3607843, 0, 1, 1,
0.5952988, -1.685681, 2.270331, 0.3686275, 0, 1, 1,
0.5954074, 1.022039, 0.2336087, 0.372549, 0, 1, 1,
0.5964395, 1.267135, 2.035698, 0.3803922, 0, 1, 1,
0.6078877, 0.08781803, 1.967816, 0.3843137, 0, 1, 1,
0.6120433, 0.8512111, 1.081806, 0.3921569, 0, 1, 1,
0.6169202, -0.3304235, -0.4667285, 0.3960784, 0, 1, 1,
0.6179883, 0.1311958, 1.984133, 0.4039216, 0, 1, 1,
0.6208156, -1.683449, 3.287597, 0.4117647, 0, 1, 1,
0.6212304, 0.08043671, 0.9938961, 0.4156863, 0, 1, 1,
0.6243135, -1.105524, 3.481102, 0.4235294, 0, 1, 1,
0.630071, -2.111915, 0.1025726, 0.427451, 0, 1, 1,
0.6310365, 0.675943, 1.307667, 0.4352941, 0, 1, 1,
0.6349966, -0.1349006, 0.8031563, 0.4392157, 0, 1, 1,
0.6363162, 0.5030288, 0.4688282, 0.4470588, 0, 1, 1,
0.6429004, 1.372984, -1.941919, 0.4509804, 0, 1, 1,
0.6450912, -0.2882977, 1.430732, 0.4588235, 0, 1, 1,
0.6480072, 1.129264, 0.2534933, 0.4627451, 0, 1, 1,
0.6481038, 3.039572, 0.01295821, 0.4705882, 0, 1, 1,
0.6490939, 0.5563971, 0.02088608, 0.4745098, 0, 1, 1,
0.6491048, 1.064621, 1.003728, 0.4823529, 0, 1, 1,
0.650773, 0.4969523, 1.588468, 0.4862745, 0, 1, 1,
0.6587815, 0.04989637, 1.378787, 0.4941176, 0, 1, 1,
0.6589028, 1.893422, 2.241401, 0.5019608, 0, 1, 1,
0.6589733, -0.0005771832, 1.341436, 0.5058824, 0, 1, 1,
0.6629842, 0.001309562, 1.16486, 0.5137255, 0, 1, 1,
0.6656349, 0.1969064, 0.273469, 0.5176471, 0, 1, 1,
0.6719906, 0.5508465, 0.02405152, 0.5254902, 0, 1, 1,
0.6727309, -0.9506613, 2.913726, 0.5294118, 0, 1, 1,
0.6797372, 0.8910224, -1.563188, 0.5372549, 0, 1, 1,
0.6851947, 0.01768002, 1.222966, 0.5411765, 0, 1, 1,
0.6853804, 0.2619182, 0.958295, 0.5490196, 0, 1, 1,
0.6859997, -0.5302677, 1.092395, 0.5529412, 0, 1, 1,
0.6907789, -0.9074527, 3.300929, 0.5607843, 0, 1, 1,
0.6942723, 0.7303814, 1.117173, 0.5647059, 0, 1, 1,
0.6957749, 0.5616155, 2.446596, 0.572549, 0, 1, 1,
0.6959375, 0.7648072, 1.809802, 0.5764706, 0, 1, 1,
0.7019824, 0.8131722, 2.007519, 0.5843138, 0, 1, 1,
0.7057586, -0.8596596, 1.656792, 0.5882353, 0, 1, 1,
0.7076009, 0.1830983, 0.9166439, 0.5960785, 0, 1, 1,
0.7085636, 0.01142149, 0.1789902, 0.6039216, 0, 1, 1,
0.7088107, -0.1035728, 2.232388, 0.6078432, 0, 1, 1,
0.7101067, -0.9884564, 2.519847, 0.6156863, 0, 1, 1,
0.7127549, -0.4615446, 0.1855613, 0.6196079, 0, 1, 1,
0.7171844, 0.3843175, 1.776284, 0.627451, 0, 1, 1,
0.7184265, -0.3871619, 3.075112, 0.6313726, 0, 1, 1,
0.7190775, -0.3762926, 2.98554, 0.6392157, 0, 1, 1,
0.7225286, 1.166105, 1.460444, 0.6431373, 0, 1, 1,
0.7313676, -0.7608585, 1.913246, 0.6509804, 0, 1, 1,
0.7328671, -0.3867312, 2.223228, 0.654902, 0, 1, 1,
0.7440963, 0.1797548, 2.212959, 0.6627451, 0, 1, 1,
0.7471426, 0.6656543, 1.120774, 0.6666667, 0, 1, 1,
0.7493271, 2.156702, -0.5153688, 0.6745098, 0, 1, 1,
0.7532762, 0.3202016, 0.8285726, 0.6784314, 0, 1, 1,
0.7547513, -1.216446, 2.722613, 0.6862745, 0, 1, 1,
0.7554021, -0.905101, 3.411811, 0.6901961, 0, 1, 1,
0.757448, 0.8290808, 0.5290807, 0.6980392, 0, 1, 1,
0.7645209, 1.258427, -0.9301482, 0.7058824, 0, 1, 1,
0.7658032, 1.067677, 2.481667, 0.7098039, 0, 1, 1,
0.7662164, 0.2019826, 0.4347171, 0.7176471, 0, 1, 1,
0.7692797, 1.156413, -1.240934, 0.7215686, 0, 1, 1,
0.7757374, -0.2122754, 2.1801, 0.7294118, 0, 1, 1,
0.7784669, 0.412418, 1.537061, 0.7333333, 0, 1, 1,
0.7810605, -0.2553878, 0.4040039, 0.7411765, 0, 1, 1,
0.7886147, -0.9305555, 1.843676, 0.7450981, 0, 1, 1,
0.7899185, -0.03930252, 0.6056513, 0.7529412, 0, 1, 1,
0.7959934, 0.7662447, 0.8953528, 0.7568628, 0, 1, 1,
0.7970887, 0.5921234, -0.1454754, 0.7647059, 0, 1, 1,
0.797752, 1.937972, -0.07495175, 0.7686275, 0, 1, 1,
0.7980097, 0.8168687, -0.8379597, 0.7764706, 0, 1, 1,
0.8042567, 1.083596, 1.095937, 0.7803922, 0, 1, 1,
0.8098623, 0.6919762, 1.433334, 0.7882353, 0, 1, 1,
0.8108878, -0.2822472, 3.02591, 0.7921569, 0, 1, 1,
0.8156354, 0.6540169, 1.674121, 0.8, 0, 1, 1,
0.8169996, 0.04571692, 1.511806, 0.8078431, 0, 1, 1,
0.8284568, 0.6844789, 1.584454, 0.8117647, 0, 1, 1,
0.8305225, -0.8916382, 2.784054, 0.8196079, 0, 1, 1,
0.8357295, -0.2906593, 1.697813, 0.8235294, 0, 1, 1,
0.8373979, -0.9619672, 1.811149, 0.8313726, 0, 1, 1,
0.8448014, 0.9261041, 1.585461, 0.8352941, 0, 1, 1,
0.8463145, 0.5313576, 0.3772122, 0.8431373, 0, 1, 1,
0.8471061, 1.732043, 0.9633074, 0.8470588, 0, 1, 1,
0.8547426, -0.8496259, 2.871105, 0.854902, 0, 1, 1,
0.8582135, -0.08268014, 2.043003, 0.8588235, 0, 1, 1,
0.8630634, 0.6516919, 2.24925, 0.8666667, 0, 1, 1,
0.8644519, 0.4321991, 1.307981, 0.8705882, 0, 1, 1,
0.8765179, -1.082867, 3.412172, 0.8784314, 0, 1, 1,
0.8813058, -0.6618121, 3.391432, 0.8823529, 0, 1, 1,
0.8880784, 0.9595498, 0.6777462, 0.8901961, 0, 1, 1,
0.8895538, 0.342618, -0.8055326, 0.8941177, 0, 1, 1,
0.8964969, 0.3237652, 3.021621, 0.9019608, 0, 1, 1,
0.9033046, 0.7752713, 2.681871, 0.9098039, 0, 1, 1,
0.9051206, 0.3554255, 1.451323, 0.9137255, 0, 1, 1,
0.9167372, 0.9307377, -0.7449641, 0.9215686, 0, 1, 1,
0.9179413, -0.5915103, 1.161105, 0.9254902, 0, 1, 1,
0.920265, 1.003837, 1.346596, 0.9333333, 0, 1, 1,
0.9204518, -0.4631807, 2.899058, 0.9372549, 0, 1, 1,
0.9214852, 0.6912654, 1.457095, 0.945098, 0, 1, 1,
0.9250742, -0.9381913, 5.022931, 0.9490196, 0, 1, 1,
0.9265283, -1.051849, 4.101156, 0.9568627, 0, 1, 1,
0.9303436, -1.164533, 1.966663, 0.9607843, 0, 1, 1,
0.9330468, 0.1638001, 2.387654, 0.9686275, 0, 1, 1,
0.9364425, -1.609362, 3.351582, 0.972549, 0, 1, 1,
0.9476167, 1.641865, 0.9329853, 0.9803922, 0, 1, 1,
0.9479696, -1.738862, 2.272017, 0.9843137, 0, 1, 1,
0.9501117, 0.1697306, 0.9305786, 0.9921569, 0, 1, 1,
0.9508666, 1.255461, 1.655005, 0.9960784, 0, 1, 1,
0.9591587, 0.6822873, 1.177191, 1, 0, 0.9960784, 1,
0.9615738, 0.4964582, 0.280921, 1, 0, 0.9882353, 1,
0.9617042, 0.2682628, 2.111301, 1, 0, 0.9843137, 1,
0.9634447, 1.121471, -0.1954021, 1, 0, 0.9764706, 1,
0.9702864, 1.008526, 0.8925941, 1, 0, 0.972549, 1,
0.9745511, -1.000429, 3.713887, 1, 0, 0.9647059, 1,
0.9782424, 0.8287686, 0.3764831, 1, 0, 0.9607843, 1,
0.981932, 1.353466, 0.3306917, 1, 0, 0.9529412, 1,
0.9819733, -0.9085531, 0.8327749, 1, 0, 0.9490196, 1,
0.9888306, 0.4552156, -1.087654, 1, 0, 0.9411765, 1,
0.9935297, 1.47966, 0.6801236, 1, 0, 0.9372549, 1,
0.9981647, 1.984285, 1.422536, 1, 0, 0.9294118, 1,
1.004416, -1.280696, 1.78833, 1, 0, 0.9254902, 1,
1.011976, -0.2958239, 0.6460139, 1, 0, 0.9176471, 1,
1.018651, -0.1349123, 0.3439483, 1, 0, 0.9137255, 1,
1.026034, -0.8469646, 3.620711, 1, 0, 0.9058824, 1,
1.033332, 0.9732376, 2.266963, 1, 0, 0.9019608, 1,
1.036692, -0.7151152, 1.109646, 1, 0, 0.8941177, 1,
1.045851, 1.645482, 0.3335851, 1, 0, 0.8862745, 1,
1.047961, 0.763035, 0.7874144, 1, 0, 0.8823529, 1,
1.048203, -1.855693, 3.188815, 1, 0, 0.8745098, 1,
1.054721, 0.858705, 0.1666019, 1, 0, 0.8705882, 1,
1.055662, -0.252156, 1.867213, 1, 0, 0.8627451, 1,
1.055892, -0.1436187, 1.704014, 1, 0, 0.8588235, 1,
1.05718, -0.9457216, 3.218068, 1, 0, 0.8509804, 1,
1.063025, 0.7870761, 1.228882, 1, 0, 0.8470588, 1,
1.068914, 1.029936, 1.081029, 1, 0, 0.8392157, 1,
1.079219, -1.250693, 1.491811, 1, 0, 0.8352941, 1,
1.079697, -0.3466498, 3.569358, 1, 0, 0.827451, 1,
1.0826, -1.241376, 3.823242, 1, 0, 0.8235294, 1,
1.082897, -0.2423584, 1.215225, 1, 0, 0.8156863, 1,
1.084004, 0.05245983, 2.079586, 1, 0, 0.8117647, 1,
1.086667, 0.4595983, 1.486994, 1, 0, 0.8039216, 1,
1.087126, 1.553701, -1.097097, 1, 0, 0.7960784, 1,
1.095269, 0.6672422, 1.293448, 1, 0, 0.7921569, 1,
1.096468, 0.2247432, 2.209172, 1, 0, 0.7843137, 1,
1.102432, -0.9744762, 1.600568, 1, 0, 0.7803922, 1,
1.107823, 1.15021, 1.619928, 1, 0, 0.772549, 1,
1.110523, -1.158994, 3.306968, 1, 0, 0.7686275, 1,
1.114436, -1.29289, 1.733338, 1, 0, 0.7607843, 1,
1.120354, -0.1956924, 1.372297, 1, 0, 0.7568628, 1,
1.123102, -1.910814, 1.634549, 1, 0, 0.7490196, 1,
1.125857, 0.426329, 0.03407899, 1, 0, 0.7450981, 1,
1.128719, 1.061723, 2.299339, 1, 0, 0.7372549, 1,
1.130366, 0.1445971, 0.7688342, 1, 0, 0.7333333, 1,
1.130396, 0.4850821, 0.2499959, 1, 0, 0.7254902, 1,
1.13158, 0.7986488, 0.5694289, 1, 0, 0.7215686, 1,
1.156764, 1.199641, 2.702584, 1, 0, 0.7137255, 1,
1.156902, -0.9918792, 3.024194, 1, 0, 0.7098039, 1,
1.160626, 1.226176, -1.888858, 1, 0, 0.7019608, 1,
1.181714, -0.786621, 2.696201, 1, 0, 0.6941177, 1,
1.183154, -1.359213, 2.327923, 1, 0, 0.6901961, 1,
1.19313, -0.9607071, 3.186315, 1, 0, 0.682353, 1,
1.194044, -0.2933727, 2.661818, 1, 0, 0.6784314, 1,
1.20405, 0.4739497, 2.060505, 1, 0, 0.6705883, 1,
1.209664, 0.4239075, -0.2163373, 1, 0, 0.6666667, 1,
1.211768, 0.4975218, 1.608302, 1, 0, 0.6588235, 1,
1.218082, -1.681348, 0.43863, 1, 0, 0.654902, 1,
1.21903, -0.6635831, 1.359238, 1, 0, 0.6470588, 1,
1.240729, 0.8193665, 1.501145, 1, 0, 0.6431373, 1,
1.247857, -1.26528, 2.200115, 1, 0, 0.6352941, 1,
1.253489, -1.3071, 1.715717, 1, 0, 0.6313726, 1,
1.257093, -0.7425809, 1.608988, 1, 0, 0.6235294, 1,
1.257563, 1.430348, 1.684638, 1, 0, 0.6196079, 1,
1.265891, -0.9367598, 1.876359, 1, 0, 0.6117647, 1,
1.272749, 0.3799336, 1.830822, 1, 0, 0.6078432, 1,
1.285543, 0.5341274, -0.2438872, 1, 0, 0.6, 1,
1.285665, 1.596237, 0.7838317, 1, 0, 0.5921569, 1,
1.295916, 0.5727617, 2.486794, 1, 0, 0.5882353, 1,
1.297115, -0.21884, 2.836668, 1, 0, 0.5803922, 1,
1.301484, -0.7117115, 3.993315, 1, 0, 0.5764706, 1,
1.322061, 1.261853, 0.9537864, 1, 0, 0.5686275, 1,
1.322664, 0.9554527, -0.4980231, 1, 0, 0.5647059, 1,
1.332504, 2.080516, 1.028603, 1, 0, 0.5568628, 1,
1.335616, -0.4040289, 1.921935, 1, 0, 0.5529412, 1,
1.339225, 1.149786, 1.257611, 1, 0, 0.5450981, 1,
1.341417, 0.5727969, 1.015336, 1, 0, 0.5411765, 1,
1.342428, 1.296925, 0.1622291, 1, 0, 0.5333334, 1,
1.348288, 1.656765, -0.8584207, 1, 0, 0.5294118, 1,
1.365865, 1.127565, -0.2946804, 1, 0, 0.5215687, 1,
1.373311, -1.586911, 2.596996, 1, 0, 0.5176471, 1,
1.380007, 0.3525623, 2.252363, 1, 0, 0.509804, 1,
1.383358, 0.8747564, 0.8442044, 1, 0, 0.5058824, 1,
1.385767, 0.7086683, 1.16399, 1, 0, 0.4980392, 1,
1.387455, -0.3146513, 2.625185, 1, 0, 0.4901961, 1,
1.388248, -1.356625, 1.629517, 1, 0, 0.4862745, 1,
1.38963, -0.2813227, 2.450572, 1, 0, 0.4784314, 1,
1.393325, 0.1620805, 1.300227, 1, 0, 0.4745098, 1,
1.393443, -1.351529, 1.995602, 1, 0, 0.4666667, 1,
1.403919, -1.812681, 3.966106, 1, 0, 0.4627451, 1,
1.413814, -2.057157, 1.987925, 1, 0, 0.454902, 1,
1.415048, -0.3371553, 1.331949, 1, 0, 0.4509804, 1,
1.416767, -0.2995347, 4.053076, 1, 0, 0.4431373, 1,
1.439257, 0.9068447, 0.7226778, 1, 0, 0.4392157, 1,
1.442746, 0.4316294, 0.3988688, 1, 0, 0.4313726, 1,
1.468852, -0.3009877, 2.306208, 1, 0, 0.427451, 1,
1.472052, 0.623562, 1.028054, 1, 0, 0.4196078, 1,
1.47787, 1.120833, 2.212569, 1, 0, 0.4156863, 1,
1.483135, 0.3795336, 2.980437, 1, 0, 0.4078431, 1,
1.483414, -0.4018432, 0.7617522, 1, 0, 0.4039216, 1,
1.489233, 0.6845831, 2.519124, 1, 0, 0.3960784, 1,
1.499099, 0.2152412, 2.130913, 1, 0, 0.3882353, 1,
1.499725, 0.1482482, 1.31449, 1, 0, 0.3843137, 1,
1.500851, -0.02902711, 2.412739, 1, 0, 0.3764706, 1,
1.514291, -0.2252335, 1.868451, 1, 0, 0.372549, 1,
1.519623, 1.235313, 0.8941786, 1, 0, 0.3647059, 1,
1.533096, 2.36717, -0.02407674, 1, 0, 0.3607843, 1,
1.540927, 1.720259, 2.027222, 1, 0, 0.3529412, 1,
1.547235, -0.01465802, 1.927623, 1, 0, 0.3490196, 1,
1.552347, 0.3944398, 0.185665, 1, 0, 0.3411765, 1,
1.571292, -0.6862091, 1.294909, 1, 0, 0.3372549, 1,
1.578559, -0.9897794, 2.093714, 1, 0, 0.3294118, 1,
1.606182, -0.1780066, 1.379972, 1, 0, 0.3254902, 1,
1.613893, 0.7512008, 0.6124599, 1, 0, 0.3176471, 1,
1.627774, 0.4598614, -1.201519, 1, 0, 0.3137255, 1,
1.629263, -1.648369, 2.037073, 1, 0, 0.3058824, 1,
1.643382, 0.742477, 1.052007, 1, 0, 0.2980392, 1,
1.65003, -0.4680439, 3.136248, 1, 0, 0.2941177, 1,
1.65525, 0.5466261, 1.248249, 1, 0, 0.2862745, 1,
1.660129, -0.4966678, 1.407918, 1, 0, 0.282353, 1,
1.667255, -1.455155, 1.985899, 1, 0, 0.2745098, 1,
1.69887, 0.8586968, 0.6829675, 1, 0, 0.2705882, 1,
1.700745, -1.057838, 1.843214, 1, 0, 0.2627451, 1,
1.713262, 1.351244, 2.186991, 1, 0, 0.2588235, 1,
1.755532, 0.3221959, -0.3686675, 1, 0, 0.2509804, 1,
1.779813, 1.537097, 3.188514, 1, 0, 0.2470588, 1,
1.779979, -0.9597244, 2.235304, 1, 0, 0.2392157, 1,
1.780981, 0.3405778, 1.210894, 1, 0, 0.2352941, 1,
1.782338, 1.191936, 1.774533, 1, 0, 0.227451, 1,
1.78652, 1.002852, 1.456998, 1, 0, 0.2235294, 1,
1.789507, -1.595354, 0.5763443, 1, 0, 0.2156863, 1,
1.79208, -0.3258215, 0.8511805, 1, 0, 0.2117647, 1,
1.796981, -0.8464746, 2.982154, 1, 0, 0.2039216, 1,
1.836041, 1.339643, 0.2209684, 1, 0, 0.1960784, 1,
1.849758, 1.611267, 0.1469982, 1, 0, 0.1921569, 1,
1.881709, -1.356307, 1.071547, 1, 0, 0.1843137, 1,
1.888477, -0.4059332, 3.790823, 1, 0, 0.1803922, 1,
1.893607, -1.329201, 2.297179, 1, 0, 0.172549, 1,
1.906401, -0.8681372, 2.417634, 1, 0, 0.1686275, 1,
2.02686, -0.1623105, 2.197639, 1, 0, 0.1607843, 1,
2.039748, 0.7132777, 2.613085, 1, 0, 0.1568628, 1,
2.060997, -1.713477, 2.445994, 1, 0, 0.1490196, 1,
2.073158, 1.531834, -0.5718194, 1, 0, 0.145098, 1,
2.106695, 0.1829375, 3.036652, 1, 0, 0.1372549, 1,
2.111541, -0.7964332, 2.665617, 1, 0, 0.1333333, 1,
2.116935, -0.4399419, 0.4173118, 1, 0, 0.1254902, 1,
2.124158, 1.590889, 0.03999297, 1, 0, 0.1215686, 1,
2.138964, 1.546278, 1.592879, 1, 0, 0.1137255, 1,
2.143375, -0.2003421, 1.21322, 1, 0, 0.1098039, 1,
2.144009, 1.246494, -0.7144669, 1, 0, 0.1019608, 1,
2.148587, 0.4954499, 1.339738, 1, 0, 0.09411765, 1,
2.157198, -0.6411413, 1.300407, 1, 0, 0.09019608, 1,
2.201273, 0.324254, 1.022085, 1, 0, 0.08235294, 1,
2.225124, -0.1641922, 2.228234, 1, 0, 0.07843138, 1,
2.249381, 0.7859249, 0.9282624, 1, 0, 0.07058824, 1,
2.251674, -0.2172107, 3.046566, 1, 0, 0.06666667, 1,
2.283549, -0.3899114, 0.4732674, 1, 0, 0.05882353, 1,
2.352133, 1.48355, 1.31043, 1, 0, 0.05490196, 1,
2.389422, -0.1977384, 1.558912, 1, 0, 0.04705882, 1,
2.46269, -0.1461298, 2.033228, 1, 0, 0.04313726, 1,
2.486989, -0.2631169, 0.6343666, 1, 0, 0.03529412, 1,
2.503363, 0.1824068, 1.631428, 1, 0, 0.03137255, 1,
2.523252, -0.744884, 1.47975, 1, 0, 0.02352941, 1,
2.677779, 0.5480989, 0.0940357, 1, 0, 0.01960784, 1,
2.753035, -0.2776532, 2.614364, 1, 0, 0.01176471, 1,
3.268134, -1.009012, 1.641883, 1, 0, 0.007843138, 1
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
0.2056057, -3.890065, -6.889748, 0, -0.5, 0.5, 0.5,
0.2056057, -3.890065, -6.889748, 1, -0.5, 0.5, 0.5,
0.2056057, -3.890065, -6.889748, 1, 1.5, 0.5, 0.5,
0.2056057, -3.890065, -6.889748, 0, 1.5, 0.5, 0.5
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
-3.895119, 0.07692301, -6.889748, 0, -0.5, 0.5, 0.5,
-3.895119, 0.07692301, -6.889748, 1, -0.5, 0.5, 0.5,
-3.895119, 0.07692301, -6.889748, 1, 1.5, 0.5, 0.5,
-3.895119, 0.07692301, -6.889748, 0, 1.5, 0.5, 0.5
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
-3.895119, -3.890065, 0.3931806, 0, -0.5, 0.5, 0.5,
-3.895119, -3.890065, 0.3931806, 1, -0.5, 0.5, 0.5,
-3.895119, -3.890065, 0.3931806, 1, 1.5, 0.5, 0.5,
-3.895119, -3.890065, 0.3931806, 0, 1.5, 0.5, 0.5
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
-2, -2.974606, -5.209072,
3, -2.974606, -5.209072,
-2, -2.974606, -5.209072,
-2, -3.127182, -5.489185,
-1, -2.974606, -5.209072,
-1, -3.127182, -5.489185,
0, -2.974606, -5.209072,
0, -3.127182, -5.489185,
1, -2.974606, -5.209072,
1, -3.127182, -5.489185,
2, -2.974606, -5.209072,
2, -3.127182, -5.489185,
3, -2.974606, -5.209072,
3, -3.127182, -5.489185
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
-2, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
-2, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
-2, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
-2, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5,
-1, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
-1, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
-1, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
-1, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5,
0, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
0, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
0, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
0, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5,
1, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
1, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
1, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
1, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5,
2, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
2, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
2, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
2, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5,
3, -3.432335, -6.04941, 0, -0.5, 0.5, 0.5,
3, -3.432335, -6.04941, 1, -0.5, 0.5, 0.5,
3, -3.432335, -6.04941, 1, 1.5, 0.5, 0.5,
3, -3.432335, -6.04941, 0, 1.5, 0.5, 0.5
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
-2.948798, -2, -5.209072,
-2.948798, 3, -5.209072,
-2.948798, -2, -5.209072,
-3.106519, -2, -5.489185,
-2.948798, -1, -5.209072,
-3.106519, -1, -5.489185,
-2.948798, 0, -5.209072,
-3.106519, 0, -5.489185,
-2.948798, 1, -5.209072,
-3.106519, 1, -5.489185,
-2.948798, 2, -5.209072,
-3.106519, 2, -5.489185,
-2.948798, 3, -5.209072,
-3.106519, 3, -5.489185
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
-3.421959, -2, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, -2, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, -2, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, -2, -6.04941, 0, 1.5, 0.5, 0.5,
-3.421959, -1, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, -1, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, -1, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, -1, -6.04941, 0, 1.5, 0.5, 0.5,
-3.421959, 0, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, 0, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, 0, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, 0, -6.04941, 0, 1.5, 0.5, 0.5,
-3.421959, 1, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, 1, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, 1, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, 1, -6.04941, 0, 1.5, 0.5, 0.5,
-3.421959, 2, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, 2, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, 2, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, 2, -6.04941, 0, 1.5, 0.5, 0.5,
-3.421959, 3, -6.04941, 0, -0.5, 0.5, 0.5,
-3.421959, 3, -6.04941, 1, -0.5, 0.5, 0.5,
-3.421959, 3, -6.04941, 1, 1.5, 0.5, 0.5,
-3.421959, 3, -6.04941, 0, 1.5, 0.5, 0.5
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
-2.948798, -2.974606, -4,
-2.948798, -2.974606, 4,
-2.948798, -2.974606, -4,
-3.106519, -3.127182, -4,
-2.948798, -2.974606, -2,
-3.106519, -3.127182, -2,
-2.948798, -2.974606, 0,
-3.106519, -3.127182, 0,
-2.948798, -2.974606, 2,
-3.106519, -3.127182, 2,
-2.948798, -2.974606, 4,
-3.106519, -3.127182, 4
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
-3.421959, -3.432335, -4, 0, -0.5, 0.5, 0.5,
-3.421959, -3.432335, -4, 1, -0.5, 0.5, 0.5,
-3.421959, -3.432335, -4, 1, 1.5, 0.5, 0.5,
-3.421959, -3.432335, -4, 0, 1.5, 0.5, 0.5,
-3.421959, -3.432335, -2, 0, -0.5, 0.5, 0.5,
-3.421959, -3.432335, -2, 1, -0.5, 0.5, 0.5,
-3.421959, -3.432335, -2, 1, 1.5, 0.5, 0.5,
-3.421959, -3.432335, -2, 0, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 0, 0, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 0, 1, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 0, 1, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 0, 0, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 2, 0, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 2, 1, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 2, 1, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 2, 0, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 4, 0, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 4, 1, -0.5, 0.5, 0.5,
-3.421959, -3.432335, 4, 1, 1.5, 0.5, 0.5,
-3.421959, -3.432335, 4, 0, 1.5, 0.5, 0.5
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
-2.948798, -2.974606, -5.209072,
-2.948798, 3.128452, -5.209072,
-2.948798, -2.974606, 5.995433,
-2.948798, 3.128452, 5.995433,
-2.948798, -2.974606, -5.209072,
-2.948798, -2.974606, 5.995433,
-2.948798, 3.128452, -5.209072,
-2.948798, 3.128452, 5.995433,
-2.948798, -2.974606, -5.209072,
3.36001, -2.974606, -5.209072,
-2.948798, -2.974606, 5.995433,
3.36001, -2.974606, 5.995433,
-2.948798, 3.128452, -5.209072,
3.36001, 3.128452, -5.209072,
-2.948798, 3.128452, 5.995433,
3.36001, 3.128452, 5.995433,
3.36001, -2.974606, -5.209072,
3.36001, 3.128452, -5.209072,
3.36001, -2.974606, 5.995433,
3.36001, 3.128452, 5.995433,
3.36001, -2.974606, -5.209072,
3.36001, -2.974606, 5.995433,
3.36001, 3.128452, -5.209072,
3.36001, 3.128452, 5.995433
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
var radius = 7.600353;
var distance = 33.81483;
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
mvMatrix.translate( -0.2056057, -0.07692301, -0.3931806 );
mvMatrix.scale( 1.302568, 1.346481, 0.7334237 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81483);
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
bromoxynil<-read.table("bromoxynil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromoxynil$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
```

```r
y<-bromoxynil$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
```

```r
z<-bromoxynil$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
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
-2.856922, -1.145267, -2.012628, 0, 0, 1, 1, 1,
-2.775628, -2.083431, -1.877434, 1, 0, 0, 1, 1,
-2.742495, -2.057571, -1.900076, 1, 0, 0, 1, 1,
-2.708534, -0.4610881, -1.059929, 1, 0, 0, 1, 1,
-2.628668, 0.7948516, -1.401425, 1, 0, 0, 1, 1,
-2.585197, 1.769383, -1.761845, 1, 0, 0, 1, 1,
-2.381457, -0.01167028, -1.332743, 0, 0, 0, 1, 1,
-2.351352, -1.407229, -3.985744, 0, 0, 0, 1, 1,
-2.290523, -0.5907999, -1.319181, 0, 0, 0, 1, 1,
-2.263065, -1.50793, -1.654601, 0, 0, 0, 1, 1,
-2.254826, -0.3170112, -1.610776, 0, 0, 0, 1, 1,
-2.207868, 2.090388, -0.2945936, 0, 0, 0, 1, 1,
-2.197587, 0.5936481, -1.797306, 0, 0, 0, 1, 1,
-2.188126, -1.288719, -3.532006, 1, 1, 1, 1, 1,
-2.182483, 0.5509413, -1.015919, 1, 1, 1, 1, 1,
-2.115793, 0.7454177, -2.276965, 1, 1, 1, 1, 1,
-2.081385, 0.9535617, -0.4395114, 1, 1, 1, 1, 1,
-1.988859, -0.0373219, -1.652522, 1, 1, 1, 1, 1,
-1.982005, 0.8066635, -1.446289, 1, 1, 1, 1, 1,
-1.976337, 0.07001837, -1.280426, 1, 1, 1, 1, 1,
-1.944387, -1.817266, -0.3984292, 1, 1, 1, 1, 1,
-1.937485, 2.256057, -0.6593066, 1, 1, 1, 1, 1,
-1.925722, 0.08656628, -2.724433, 1, 1, 1, 1, 1,
-1.878404, -0.0236881, -3.66151, 1, 1, 1, 1, 1,
-1.862164, -1.67495, -1.481454, 1, 1, 1, 1, 1,
-1.852789, 0.07937001, -0.6116173, 1, 1, 1, 1, 1,
-1.849218, 0.09448542, -2.502338, 1, 1, 1, 1, 1,
-1.827432, -0.847921, -1.724001, 1, 1, 1, 1, 1,
-1.818958, 0.7273518, -0.9664627, 0, 0, 1, 1, 1,
-1.816972, -1.456099, -3.442879, 1, 0, 0, 1, 1,
-1.806604, 1.733689, -0.2068062, 1, 0, 0, 1, 1,
-1.79409, -0.001164398, -1.112957, 1, 0, 0, 1, 1,
-1.794055, -0.8098043, -1.433124, 1, 0, 0, 1, 1,
-1.793567, -0.2104043, -1.550812, 1, 0, 0, 1, 1,
-1.792267, 1.252201, -0.4229102, 0, 0, 0, 1, 1,
-1.763025, -0.7657475, -3.72754, 0, 0, 0, 1, 1,
-1.762304, -0.5968689, -0.5581202, 0, 0, 0, 1, 1,
-1.754581, -1.372949, -0.7415967, 0, 0, 0, 1, 1,
-1.746105, -0.855284, -1.304985, 0, 0, 0, 1, 1,
-1.744925, -0.9134047, -4.188192, 0, 0, 0, 1, 1,
-1.738711, -1.593458, -2.431979, 0, 0, 0, 1, 1,
-1.729043, 0.1655131, -1.58005, 1, 1, 1, 1, 1,
-1.72903, 1.566687, -2.014868, 1, 1, 1, 1, 1,
-1.727609, -0.4703194, -2.546709, 1, 1, 1, 1, 1,
-1.724367, -1.56003, -2.445569, 1, 1, 1, 1, 1,
-1.709317, 1.677453, 0.7429001, 1, 1, 1, 1, 1,
-1.701448, 0.6875675, -0.8879979, 1, 1, 1, 1, 1,
-1.680982, 0.416959, -0.8705856, 1, 1, 1, 1, 1,
-1.651043, 0.1443045, -2.230792, 1, 1, 1, 1, 1,
-1.644095, -0.3466781, -0.2895052, 1, 1, 1, 1, 1,
-1.642255, 0.8958946, -0.3432892, 1, 1, 1, 1, 1,
-1.600967, -0.7411565, -2.195839, 1, 1, 1, 1, 1,
-1.591761, 0.2720709, -2.124029, 1, 1, 1, 1, 1,
-1.590334, 0.5874485, -1.114442, 1, 1, 1, 1, 1,
-1.588943, -0.3124478, -2.416491, 1, 1, 1, 1, 1,
-1.580693, -0.2333275, -3.814161, 1, 1, 1, 1, 1,
-1.564798, 0.2764399, -1.132259, 0, 0, 1, 1, 1,
-1.559781, 1.407988, -0.4468968, 1, 0, 0, 1, 1,
-1.556162, 0.8640724, 0.3242055, 1, 0, 0, 1, 1,
-1.531554, 0.7767832, -0.3080911, 1, 0, 0, 1, 1,
-1.529183, -0.5415646, -5.0459, 1, 0, 0, 1, 1,
-1.524835, 0.0639452, -1.404837, 1, 0, 0, 1, 1,
-1.510596, -0.3111729, -1.155096, 0, 0, 0, 1, 1,
-1.498186, -1.208714, -3.493361, 0, 0, 0, 1, 1,
-1.478653, 1.580196, -2.777796, 0, 0, 0, 1, 1,
-1.474839, 0.07058924, -0.7768164, 0, 0, 0, 1, 1,
-1.470925, 0.9389422, -0.8473324, 0, 0, 0, 1, 1,
-1.466425, -0.2499715, -3.931547, 0, 0, 0, 1, 1,
-1.463817, -0.86682, -1.501209, 0, 0, 0, 1, 1,
-1.458963, 1.654819, 0.2612705, 1, 1, 1, 1, 1,
-1.456491, 0.6327259, -0.2091367, 1, 1, 1, 1, 1,
-1.454422, -0.01209409, -1.313958, 1, 1, 1, 1, 1,
-1.452439, -0.4181785, -3.044485, 1, 1, 1, 1, 1,
-1.432669, -1.131351, -1.998678, 1, 1, 1, 1, 1,
-1.430138, -0.8201411, -4.141055, 1, 1, 1, 1, 1,
-1.429247, 0.1458425, -2.035712, 1, 1, 1, 1, 1,
-1.42771, -0.02478025, -2.046092, 1, 1, 1, 1, 1,
-1.427193, -0.7536157, -3.431316, 1, 1, 1, 1, 1,
-1.417722, 0.437956, -2.286847, 1, 1, 1, 1, 1,
-1.406163, 0.3724307, -1.473401, 1, 1, 1, 1, 1,
-1.394074, 0.3412986, -0.007672989, 1, 1, 1, 1, 1,
-1.392774, 1.986735, -1.032146, 1, 1, 1, 1, 1,
-1.390036, 1.048399, -1.94036, 1, 1, 1, 1, 1,
-1.379058, 1.436186, -2.201829, 1, 1, 1, 1, 1,
-1.372189, 0.1434566, -1.76269, 0, 0, 1, 1, 1,
-1.371435, 0.144367, -2.027376, 1, 0, 0, 1, 1,
-1.371289, 1.902143, 1.04046, 1, 0, 0, 1, 1,
-1.370836, -0.8966796, -2.519186, 1, 0, 0, 1, 1,
-1.369213, 0.6024755, -1.674711, 1, 0, 0, 1, 1,
-1.364357, -1.181317, -2.066921, 1, 0, 0, 1, 1,
-1.362353, -0.333676, -1.896523, 0, 0, 0, 1, 1,
-1.353217, -0.8089887, -3.131554, 0, 0, 0, 1, 1,
-1.34835, 0.05597374, -3.338215, 0, 0, 0, 1, 1,
-1.340628, 0.5639108, -1.883167, 0, 0, 0, 1, 1,
-1.336286, -1.01513, -1.646895, 0, 0, 0, 1, 1,
-1.335644, 0.4151937, -2.64147, 0, 0, 0, 1, 1,
-1.334828, 0.3040866, -0.7892799, 0, 0, 0, 1, 1,
-1.330279, 2.343069, -0.3377487, 1, 1, 1, 1, 1,
-1.308236, 1.126342, -1.11824, 1, 1, 1, 1, 1,
-1.304461, 0.1841646, -2.849162, 1, 1, 1, 1, 1,
-1.303141, 0.3507403, -2.014385, 1, 1, 1, 1, 1,
-1.299265, 0.3323992, -0.01118279, 1, 1, 1, 1, 1,
-1.291809, 2.230079, -1.260144, 1, 1, 1, 1, 1,
-1.291476, 0.5173525, 0.1631561, 1, 1, 1, 1, 1,
-1.290048, -0.03295283, -0.7340173, 1, 1, 1, 1, 1,
-1.289763, -0.4695717, 0.2288633, 1, 1, 1, 1, 1,
-1.264895, 1.007755, -0.7537005, 1, 1, 1, 1, 1,
-1.258895, -0.7667791, -1.889155, 1, 1, 1, 1, 1,
-1.249819, 0.219052, -0.9038825, 1, 1, 1, 1, 1,
-1.235302, 0.1600755, -1.784331, 1, 1, 1, 1, 1,
-1.234901, 0.5959596, -1.871318, 1, 1, 1, 1, 1,
-1.227821, 0.04036522, -0.63309, 1, 1, 1, 1, 1,
-1.224272, -1.01446, -2.337265, 0, 0, 1, 1, 1,
-1.221547, 0.459493, -1.091921, 1, 0, 0, 1, 1,
-1.21529, 0.8323808, -1.120085, 1, 0, 0, 1, 1,
-1.21527, 0.07190089, 0.3635234, 1, 0, 0, 1, 1,
-1.187096, 1.226249, -2.015615, 1, 0, 0, 1, 1,
-1.183344, 0.368478, -3.512594, 1, 0, 0, 1, 1,
-1.182868, -0.2489487, -0.898213, 0, 0, 0, 1, 1,
-1.177215, -0.8116434, -1.639198, 0, 0, 0, 1, 1,
-1.175732, 0.774048, -0.9548602, 0, 0, 0, 1, 1,
-1.173471, -2.119431, -1.18504, 0, 0, 0, 1, 1,
-1.164826, -0.4253224, -2.388523, 0, 0, 0, 1, 1,
-1.143433, 1.946687, -1.792404, 0, 0, 0, 1, 1,
-1.14322, 0.8225316, 1.789236, 0, 0, 0, 1, 1,
-1.140042, -2.022241, -2.308154, 1, 1, 1, 1, 1,
-1.137633, 1.389066, -1.104987, 1, 1, 1, 1, 1,
-1.124808, 1.199886, -1.118777, 1, 1, 1, 1, 1,
-1.123164, 1.431632, 1.133916, 1, 1, 1, 1, 1,
-1.122073, 0.3656445, -0.7833142, 1, 1, 1, 1, 1,
-1.121019, 1.334384, -0.6963404, 1, 1, 1, 1, 1,
-1.116397, 0.3059655, -1.399608, 1, 1, 1, 1, 1,
-1.113763, -1.301217, -3.232829, 1, 1, 1, 1, 1,
-1.113756, 1.333955, -1.603784, 1, 1, 1, 1, 1,
-1.109017, -0.514461, -1.415864, 1, 1, 1, 1, 1,
-1.102672, -0.5637651, -0.1331597, 1, 1, 1, 1, 1,
-1.101212, 0.5650308, -3.50965, 1, 1, 1, 1, 1,
-1.097444, 1.24822, -0.7619003, 1, 1, 1, 1, 1,
-1.079902, 0.5189041, -2.345667, 1, 1, 1, 1, 1,
-1.078468, 0.1887421, -0.6772007, 1, 1, 1, 1, 1,
-1.07183, -0.6666835, -2.505063, 0, 0, 1, 1, 1,
-1.07122, -0.3366724, -2.989819, 1, 0, 0, 1, 1,
-1.070805, -1.61613, -4.095178, 1, 0, 0, 1, 1,
-1.054209, -1.321909, -4.076164, 1, 0, 0, 1, 1,
-1.053363, -1.630262, -3.391988, 1, 0, 0, 1, 1,
-1.053104, -0.9016939, -3.306533, 1, 0, 0, 1, 1,
-1.045819, 0.3454262, -0.4116555, 0, 0, 0, 1, 1,
-1.026639, 0.6668609, -2.350538, 0, 0, 0, 1, 1,
-1.023941, 0.729648, -1.712273, 0, 0, 0, 1, 1,
-1.022606, -1.394188, -2.861075, 0, 0, 0, 1, 1,
-1.021743, -1.264069, -2.4566, 0, 0, 0, 1, 1,
-1.016498, -2.770642, -4.391182, 0, 0, 0, 1, 1,
-1.013467, -0.9709314, -1.149937, 0, 0, 0, 1, 1,
-1.012476, -0.7922891, -2.488853, 1, 1, 1, 1, 1,
-1.011213, 0.7717898, -1.571682, 1, 1, 1, 1, 1,
-0.9995639, 0.3267584, -0.112494, 1, 1, 1, 1, 1,
-0.9956876, -0.7195472, -1.463053, 1, 1, 1, 1, 1,
-0.9952223, 0.6208792, -0.425845, 1, 1, 1, 1, 1,
-0.9932366, -0.05685082, -1.42259, 1, 1, 1, 1, 1,
-0.9897299, 0.288002, -1.281798, 1, 1, 1, 1, 1,
-0.9869197, 1.935842, -0.3385642, 1, 1, 1, 1, 1,
-0.9863567, 0.03284452, -0.8512152, 1, 1, 1, 1, 1,
-0.9852283, 1.277893, -1.70391, 1, 1, 1, 1, 1,
-0.9818211, 1.950305, -0.3062005, 1, 1, 1, 1, 1,
-0.9779021, -1.533858, -1.756196, 1, 1, 1, 1, 1,
-0.9733035, -1.480852, -2.460343, 1, 1, 1, 1, 1,
-0.9614816, 1.82401, 0.1555971, 1, 1, 1, 1, 1,
-0.9579449, 0.05036161, -1.36709, 1, 1, 1, 1, 1,
-0.9575309, 0.3245876, 0.3797764, 0, 0, 1, 1, 1,
-0.9551371, 1.763982, -2.058407, 1, 0, 0, 1, 1,
-0.9530502, -2.267467, -3.510483, 1, 0, 0, 1, 1,
-0.952714, -1.23869, -3.153808, 1, 0, 0, 1, 1,
-0.9470296, -0.7168859, -2.184632, 1, 0, 0, 1, 1,
-0.9429777, -0.07590199, -1.915231, 1, 0, 0, 1, 1,
-0.9408855, -0.1980075, -0.6961508, 0, 0, 0, 1, 1,
-0.9388821, -0.1538543, -1.365966, 0, 0, 0, 1, 1,
-0.9282286, 0.06662202, -3.087795, 0, 0, 0, 1, 1,
-0.9221399, 1.275454, -0.3717107, 0, 0, 0, 1, 1,
-0.9103103, 1.886008, -0.9660204, 0, 0, 0, 1, 1,
-0.9005916, 0.3064705, -0.6622602, 0, 0, 0, 1, 1,
-0.8957706, 0.4342169, -3.407737, 0, 0, 0, 1, 1,
-0.8868353, 0.4397069, -1.638967, 1, 1, 1, 1, 1,
-0.8849442, -0.3416391, -1.211035, 1, 1, 1, 1, 1,
-0.876517, -1.358743, -2.11286, 1, 1, 1, 1, 1,
-0.8744573, -1.132539, -3.273004, 1, 1, 1, 1, 1,
-0.8664595, -0.7967845, -2.412662, 1, 1, 1, 1, 1,
-0.8644884, -0.2318997, -1.713212, 1, 1, 1, 1, 1,
-0.8639621, 1.170404, 0.05198688, 1, 1, 1, 1, 1,
-0.8633379, -0.5911872, -0.6448976, 1, 1, 1, 1, 1,
-0.8598548, -0.3646637, -2.638447, 1, 1, 1, 1, 1,
-0.8571522, 1.700665, 0.6303388, 1, 1, 1, 1, 1,
-0.8566762, -1.148083, -4.268103, 1, 1, 1, 1, 1,
-0.8535613, -0.475434, -2.021403, 1, 1, 1, 1, 1,
-0.8475853, 0.0768631, -1.956763, 1, 1, 1, 1, 1,
-0.8473046, -0.7634254, -0.9514752, 1, 1, 1, 1, 1,
-0.8380027, -0.3040127, -2.940995, 1, 1, 1, 1, 1,
-0.8363023, -2.438518, -1.115733, 0, 0, 1, 1, 1,
-0.8354666, -1.289394, -3.059645, 1, 0, 0, 1, 1,
-0.8327861, -0.2634825, -2.101837, 1, 0, 0, 1, 1,
-0.8310184, 0.8739277, -1.592468, 1, 0, 0, 1, 1,
-0.8234111, 0.02379836, 0.3261503, 1, 0, 0, 1, 1,
-0.8223895, -0.2478994, -1.704929, 1, 0, 0, 1, 1,
-0.8119864, -0.4805087, -1.32567, 0, 0, 0, 1, 1,
-0.8112832, -0.8352345, -0.9575695, 0, 0, 0, 1, 1,
-0.8049363, -0.921626, -4.849069, 0, 0, 0, 1, 1,
-0.8031427, 0.1033351, -1.13346, 0, 0, 0, 1, 1,
-0.8020179, -0.6827818, -3.02388, 0, 0, 0, 1, 1,
-0.8009661, -0.8486599, -1.644305, 0, 0, 0, 1, 1,
-0.7989263, 0.3129354, -1.24843, 0, 0, 0, 1, 1,
-0.7978716, 0.7929373, -1.371169, 1, 1, 1, 1, 1,
-0.7933014, 0.2079384, -0.6621873, 1, 1, 1, 1, 1,
-0.7829143, -1.53683, -4.563052, 1, 1, 1, 1, 1,
-0.7747803, 1.029999, 0.3949839, 1, 1, 1, 1, 1,
-0.7723883, 1.27769, -1.283776, 1, 1, 1, 1, 1,
-0.7709572, -2.160503, -2.580481, 1, 1, 1, 1, 1,
-0.766456, -0.1723067, 0.008549095, 1, 1, 1, 1, 1,
-0.7657192, 0.1144064, -0.7931893, 1, 1, 1, 1, 1,
-0.7638935, -0.3310895, -2.564913, 1, 1, 1, 1, 1,
-0.7620934, 0.2737424, -1.354728, 1, 1, 1, 1, 1,
-0.7588015, 1.008424, 0.4842702, 1, 1, 1, 1, 1,
-0.7575921, -1.978486, -1.803558, 1, 1, 1, 1, 1,
-0.7556475, -1.400182, -2.625398, 1, 1, 1, 1, 1,
-0.7551314, -0.4005993, -2.241108, 1, 1, 1, 1, 1,
-0.7458556, -0.7496933, -2.315614, 1, 1, 1, 1, 1,
-0.7434757, 0.04317049, -0.756493, 0, 0, 1, 1, 1,
-0.7418408, 1.214577, -1.497777, 1, 0, 0, 1, 1,
-0.7415665, -0.7188167, -1.190027, 1, 0, 0, 1, 1,
-0.7327583, 0.4902171, 0.1014181, 1, 0, 0, 1, 1,
-0.7310448, -0.1236341, -1.38225, 1, 0, 0, 1, 1,
-0.71715, 1.534708, -0.541024, 1, 0, 0, 1, 1,
-0.7160636, -1.867424, -4.634323, 0, 0, 0, 1, 1,
-0.7146719, 0.232423, 0.4297464, 0, 0, 0, 1, 1,
-0.7135037, -0.786059, -1.689925, 0, 0, 0, 1, 1,
-0.7011687, 1.453449, 0.5141671, 0, 0, 0, 1, 1,
-0.7005332, -1.30682, -3.1374, 0, 0, 0, 1, 1,
-0.7000718, -0.9727489, -1.225071, 0, 0, 0, 1, 1,
-0.6913305, 0.3680877, -1.966897, 0, 0, 0, 1, 1,
-0.6873616, 0.4623228, -1.537622, 1, 1, 1, 1, 1,
-0.6768704, 0.252928, -2.157092, 1, 1, 1, 1, 1,
-0.6757756, 0.1869812, -1.826457, 1, 1, 1, 1, 1,
-0.6750635, 0.5606142, -0.9120322, 1, 1, 1, 1, 1,
-0.6692442, -0.4673665, -3.900786, 1, 1, 1, 1, 1,
-0.664169, 1.445243, 1.103785, 1, 1, 1, 1, 1,
-0.6624132, 0.403752, 0.8294823, 1, 1, 1, 1, 1,
-0.6599075, -0.5864235, -2.848269, 1, 1, 1, 1, 1,
-0.6566131, -0.0445684, -0.3471255, 1, 1, 1, 1, 1,
-0.6559701, -0.8697019, -4.437497, 1, 1, 1, 1, 1,
-0.6556833, -0.452674, -3.372233, 1, 1, 1, 1, 1,
-0.654663, 0.8652344, -1.247635, 1, 1, 1, 1, 1,
-0.6470914, -0.946422, -3.055915, 1, 1, 1, 1, 1,
-0.6454991, -0.9499396, -4.019658, 1, 1, 1, 1, 1,
-0.6427345, 0.3442641, -0.3413828, 1, 1, 1, 1, 1,
-0.6421316, 0.1228729, -2.346443, 0, 0, 1, 1, 1,
-0.6404737, 0.1571345, -1.315118, 1, 0, 0, 1, 1,
-0.6375808, -0.155517, -3.180214, 1, 0, 0, 1, 1,
-0.6336966, -0.7334126, -2.310595, 1, 0, 0, 1, 1,
-0.6334439, -0.8714685, -1.072641, 1, 0, 0, 1, 1,
-0.6319141, -0.1793102, -0.9092688, 1, 0, 0, 1, 1,
-0.6231405, 0.7303544, 0.1489392, 0, 0, 0, 1, 1,
-0.6168385, 0.7470039, -0.7159014, 0, 0, 0, 1, 1,
-0.6123602, 0.8066694, -1.25072, 0, 0, 0, 1, 1,
-0.6062576, -0.7404709, -2.235529, 0, 0, 0, 1, 1,
-0.605232, -1.450745, -2.344687, 0, 0, 0, 1, 1,
-0.6043929, 1.540362, 0.6458981, 0, 0, 0, 1, 1,
-0.6033131, 0.6140495, -0.09264755, 0, 0, 0, 1, 1,
-0.6020569, 1.133843, -1.177104, 1, 1, 1, 1, 1,
-0.5964305, -0.5476111, -0.08200191, 1, 1, 1, 1, 1,
-0.5950673, 0.04168051, -1.178016, 1, 1, 1, 1, 1,
-0.592167, 0.9931393, -0.01723366, 1, 1, 1, 1, 1,
-0.5891094, 0.3761312, -3.182132, 1, 1, 1, 1, 1,
-0.5870252, 0.5951396, 1.09594, 1, 1, 1, 1, 1,
-0.585451, -0.9129965, -3.056734, 1, 1, 1, 1, 1,
-0.5823526, 0.7724465, -1.556709, 1, 1, 1, 1, 1,
-0.5801018, 2.011985, -1.933403, 1, 1, 1, 1, 1,
-0.5767473, 0.4060686, -0.3124706, 1, 1, 1, 1, 1,
-0.5578545, 0.4690763, -1.052174, 1, 1, 1, 1, 1,
-0.556277, -0.2431128, -1.218693, 1, 1, 1, 1, 1,
-0.553988, 1.140016, -0.6725646, 1, 1, 1, 1, 1,
-0.5531102, 0.1345611, -1.241141, 1, 1, 1, 1, 1,
-0.5512405, -0.6941017, -2.849946, 1, 1, 1, 1, 1,
-0.5497048, 0.9847618, -0.6696736, 0, 0, 1, 1, 1,
-0.5439381, 0.03909, -2.205036, 1, 0, 0, 1, 1,
-0.5399708, -1.156362, -4.343005, 1, 0, 0, 1, 1,
-0.5399662, -0.2017176, -1.987939, 1, 0, 0, 1, 1,
-0.5317334, 0.2921683, -0.4720432, 1, 0, 0, 1, 1,
-0.5310656, 0.2980653, -0.705969, 1, 0, 0, 1, 1,
-0.5284285, 2.132178, -1.10271, 0, 0, 0, 1, 1,
-0.5278654, 0.2809625, 0.6910288, 0, 0, 0, 1, 1,
-0.5240018, -0.4095028, -1.29112, 0, 0, 0, 1, 1,
-0.5187169, 0.1997645, -2.281511, 0, 0, 0, 1, 1,
-0.5167693, 2.414473, 0.1684355, 0, 0, 0, 1, 1,
-0.5150574, 0.7109795, -1.412587, 0, 0, 0, 1, 1,
-0.5101341, 1.286425, -0.4512569, 0, 0, 0, 1, 1,
-0.5063869, 1.956644, 1.122902, 1, 1, 1, 1, 1,
-0.5033605, -0.0216691, -1.433614, 1, 1, 1, 1, 1,
-0.4998978, -0.7837508, -0.8072903, 1, 1, 1, 1, 1,
-0.4964374, 1.677482, -0.4778804, 1, 1, 1, 1, 1,
-0.4920063, -1.32811, -4.145745, 1, 1, 1, 1, 1,
-0.4914608, -0.1410713, -0.723305, 1, 1, 1, 1, 1,
-0.4903419, 0.932807, -1.168239, 1, 1, 1, 1, 1,
-0.4879176, -1.130397, -1.968821, 1, 1, 1, 1, 1,
-0.4864751, -1.913936, -0.156263, 1, 1, 1, 1, 1,
-0.4800987, -1.034943, -3.354742, 1, 1, 1, 1, 1,
-0.4773073, -0.7168847, -2.004476, 1, 1, 1, 1, 1,
-0.4742557, 0.2594749, -1.240325, 1, 1, 1, 1, 1,
-0.4721546, 0.2717515, -1.376953, 1, 1, 1, 1, 1,
-0.4716829, 0.1886755, -2.950109, 1, 1, 1, 1, 1,
-0.470425, 0.671199, -1.343866, 1, 1, 1, 1, 1,
-0.4685148, -0.3025598, -0.1638852, 0, 0, 1, 1, 1,
-0.4674973, 0.01189513, -1.244489, 1, 0, 0, 1, 1,
-0.4670333, 0.671443, -1.107368, 1, 0, 0, 1, 1,
-0.466883, -1.001608, -2.778792, 1, 0, 0, 1, 1,
-0.4659134, -0.9948252, -4.042244, 1, 0, 0, 1, 1,
-0.4610432, -0.3064834, -1.740978, 1, 0, 0, 1, 1,
-0.4583893, 1.097227, -0.6812567, 0, 0, 0, 1, 1,
-0.4580066, 0.2629106, -0.6808035, 0, 0, 0, 1, 1,
-0.4481397, 0.5098969, 0.1711531, 0, 0, 0, 1, 1,
-0.4435606, 0.7295934, 0.4146308, 0, 0, 0, 1, 1,
-0.4419979, 0.2799642, 0.1101939, 0, 0, 0, 1, 1,
-0.4393967, -0.2372355, -1.845115, 0, 0, 0, 1, 1,
-0.4386372, 1.334671, -0.2323077, 0, 0, 0, 1, 1,
-0.4322172, -0.2302122, -2.840568, 1, 1, 1, 1, 1,
-0.428377, 1.79151, 0.1249935, 1, 1, 1, 1, 1,
-0.4245889, 0.3761624, -2.266259, 1, 1, 1, 1, 1,
-0.4171545, 0.6717922, 0.8450682, 1, 1, 1, 1, 1,
-0.4121875, -0.8636739, -3.881381, 1, 1, 1, 1, 1,
-0.4102772, -1.125404, -4.010438, 1, 1, 1, 1, 1,
-0.4100359, 0.6526743, -0.09932303, 1, 1, 1, 1, 1,
-0.4085103, -0.7438694, -2.246272, 1, 1, 1, 1, 1,
-0.4062888, -0.7025351, -4.015197, 1, 1, 1, 1, 1,
-0.4060836, -0.06295703, -1.551887, 1, 1, 1, 1, 1,
-0.405052, -0.7613835, -2.810212, 1, 1, 1, 1, 1,
-0.4006002, 0.04373153, -2.886977, 1, 1, 1, 1, 1,
-0.396854, -1.319626, -3.186481, 1, 1, 1, 1, 1,
-0.3961739, -0.4149666, -3.105103, 1, 1, 1, 1, 1,
-0.3923845, -0.03438454, -3.13346, 1, 1, 1, 1, 1,
-0.3921846, -0.2750751, -1.985904, 0, 0, 1, 1, 1,
-0.3911072, 1.308985, 1.137498, 1, 0, 0, 1, 1,
-0.3910252, -0.1821082, -2.11795, 1, 0, 0, 1, 1,
-0.3895483, -0.5865898, -4.98219, 1, 0, 0, 1, 1,
-0.3850888, -1.514988, -4.315294, 1, 0, 0, 1, 1,
-0.3843032, 1.561398, 0.01508733, 1, 0, 0, 1, 1,
-0.3816205, 0.180433, 1.417764, 0, 0, 0, 1, 1,
-0.3802239, -1.468733, -1.576986, 0, 0, 0, 1, 1,
-0.3788716, 1.55018, 0.5425435, 0, 0, 0, 1, 1,
-0.3785079, 0.9759911, 1.554462, 0, 0, 0, 1, 1,
-0.3709491, 1.23263, 0.2654213, 0, 0, 0, 1, 1,
-0.3707406, 1.507857, 0.7420935, 0, 0, 0, 1, 1,
-0.3705014, -0.7568027, -0.9990556, 0, 0, 0, 1, 1,
-0.3697772, 1.261386, -1.906555, 1, 1, 1, 1, 1,
-0.3670519, 0.04290669, -3.142158, 1, 1, 1, 1, 1,
-0.3629592, -0.3374336, -1.865401, 1, 1, 1, 1, 1,
-0.3606334, 0.4866599, -0.8352232, 1, 1, 1, 1, 1,
-0.3585102, 0.3091652, -2.293248, 1, 1, 1, 1, 1,
-0.3545611, -1.823358, -2.202093, 1, 1, 1, 1, 1,
-0.3541419, -0.1048198, -3.998256, 1, 1, 1, 1, 1,
-0.3532033, 1.407083, 0.8173385, 1, 1, 1, 1, 1,
-0.3473853, -1.164789, -1.200721, 1, 1, 1, 1, 1,
-0.3463589, 0.05863733, -4.135226, 1, 1, 1, 1, 1,
-0.345885, -0.9390766, -1.486824, 1, 1, 1, 1, 1,
-0.3420333, -1.313457, -4.269177, 1, 1, 1, 1, 1,
-0.3412553, 0.320482, -0.6257751, 1, 1, 1, 1, 1,
-0.3373477, -0.07292966, -0.3008996, 1, 1, 1, 1, 1,
-0.3360823, 1.330918, 0.001635919, 1, 1, 1, 1, 1,
-0.3320622, -0.06401329, -0.6980831, 0, 0, 1, 1, 1,
-0.3309642, -0.3096177, -2.685179, 1, 0, 0, 1, 1,
-0.3303427, 0.4838065, -0.1427806, 1, 0, 0, 1, 1,
-0.3296651, -0.6638242, -2.000652, 1, 0, 0, 1, 1,
-0.3256527, -1.789716, -2.537549, 1, 0, 0, 1, 1,
-0.3238396, 1.694192, 0.3010567, 1, 0, 0, 1, 1,
-0.3218632, 1.552779, 0.6126572, 0, 0, 0, 1, 1,
-0.3209863, -0.3751274, -1.495653, 0, 0, 0, 1, 1,
-0.3147127, -0.260446, -0.3417929, 0, 0, 0, 1, 1,
-0.3138254, -1.012979, -3.320977, 0, 0, 0, 1, 1,
-0.311876, 2.293687, 1.487985, 0, 0, 0, 1, 1,
-0.3109598, -2.5369, -3.797092, 0, 0, 0, 1, 1,
-0.3098647, -0.6712345, -4.730225, 0, 0, 0, 1, 1,
-0.308832, 0.1580793, -1.77628, 1, 1, 1, 1, 1,
-0.3073979, -0.2881334, -2.983242, 1, 1, 1, 1, 1,
-0.3040852, 1.762061, 0.9264681, 1, 1, 1, 1, 1,
-0.2977895, 0.8757948, -0.7437696, 1, 1, 1, 1, 1,
-0.2960054, -0.2170998, -2.808358, 1, 1, 1, 1, 1,
-0.2952911, -0.02487282, -0.7806965, 1, 1, 1, 1, 1,
-0.2946919, -0.1632879, -3.098234, 1, 1, 1, 1, 1,
-0.2945927, -0.3656741, -4.125166, 1, 1, 1, 1, 1,
-0.2885338, 0.3850046, -0.2867337, 1, 1, 1, 1, 1,
-0.2867522, -1.785383, -2.217831, 1, 1, 1, 1, 1,
-0.2836747, -0.4848712, -4.109612, 1, 1, 1, 1, 1,
-0.2823027, 1.185734, -2.132206, 1, 1, 1, 1, 1,
-0.282287, 1.783003, 0.3543298, 1, 1, 1, 1, 1,
-0.2819818, -0.6179481, -3.329076, 1, 1, 1, 1, 1,
-0.2813555, -1.385993, -2.874254, 1, 1, 1, 1, 1,
-0.2811193, 0.1590073, -0.005235483, 0, 0, 1, 1, 1,
-0.2749757, 1.306951, -0.749374, 1, 0, 0, 1, 1,
-0.2729014, 0.5538662, 0.2846992, 1, 0, 0, 1, 1,
-0.2669411, -0.6652517, -2.877554, 1, 0, 0, 1, 1,
-0.2659626, 1.183789, 0.507539, 1, 0, 0, 1, 1,
-0.2656786, 0.8261386, 0.7053155, 1, 0, 0, 1, 1,
-0.2655221, 0.8284544, 0.9840674, 0, 0, 0, 1, 1,
-0.2638568, -2.885726, -1.55104, 0, 0, 0, 1, 1,
-0.2600129, 1.018895, -1.108661, 0, 0, 0, 1, 1,
-0.2563388, 0.8188215, -0.4541678, 0, 0, 0, 1, 1,
-0.2552813, -0.02254649, -2.051647, 0, 0, 0, 1, 1,
-0.2508341, 0.905772, 0.5655659, 0, 0, 0, 1, 1,
-0.2476644, -0.4132129, -2.237212, 0, 0, 0, 1, 1,
-0.2470392, 0.2035036, -1.528429, 1, 1, 1, 1, 1,
-0.2460623, -0.68712, -4.687111, 1, 1, 1, 1, 1,
-0.2423781, -1.498984, -2.640053, 1, 1, 1, 1, 1,
-0.2403653, 1.187851, 0.2367197, 1, 1, 1, 1, 1,
-0.2403648, -0.5741142, -2.376869, 1, 1, 1, 1, 1,
-0.2377085, 0.6022716, 0.5424896, 1, 1, 1, 1, 1,
-0.235102, 2.12415, -1.119586, 1, 1, 1, 1, 1,
-0.2348524, -0.1023452, -1.709726, 1, 1, 1, 1, 1,
-0.2324299, 1.444279, -0.3879071, 1, 1, 1, 1, 1,
-0.2262668, -0.4074799, -3.169558, 1, 1, 1, 1, 1,
-0.2214533, -2.564096, -2.876991, 1, 1, 1, 1, 1,
-0.2156781, -0.474772, -3.416319, 1, 1, 1, 1, 1,
-0.2149676, 0.9028829, -0.001724546, 1, 1, 1, 1, 1,
-0.2141329, 1.602573, -0.002358421, 1, 1, 1, 1, 1,
-0.2132017, 1.509225, 0.6008958, 1, 1, 1, 1, 1,
-0.2084074, 1.033777, -1.892733, 0, 0, 1, 1, 1,
-0.2077859, -0.988559, -2.190232, 1, 0, 0, 1, 1,
-0.2066288, -0.8680592, -3.418414, 1, 0, 0, 1, 1,
-0.202796, -1.28154, -2.195214, 1, 0, 0, 1, 1,
-0.1974361, -0.1504092, -3.814842, 1, 0, 0, 1, 1,
-0.1948191, 0.6946119, -0.1919856, 1, 0, 0, 1, 1,
-0.1939638, -0.4401019, -3.106017, 0, 0, 0, 1, 1,
-0.1934, 2.067353, 1.600604, 0, 0, 0, 1, 1,
-0.1907785, 0.6550497, 0.01754862, 0, 0, 0, 1, 1,
-0.1893822, 1.157899, -0.05062833, 0, 0, 0, 1, 1,
-0.1885426, 0.4709395, 0.5424961, 0, 0, 0, 1, 1,
-0.185092, -0.2840571, -2.267817, 0, 0, 0, 1, 1,
-0.1842557, -0.1366723, -2.532383, 0, 0, 0, 1, 1,
-0.183132, -0.1134604, -1.398789, 1, 1, 1, 1, 1,
-0.1825606, -0.1323889, -2.789314, 1, 1, 1, 1, 1,
-0.1800446, 1.436776, -0.5589061, 1, 1, 1, 1, 1,
-0.1766609, 0.3948376, 0.6561489, 1, 1, 1, 1, 1,
-0.1753789, 0.08681719, -1.338133, 1, 1, 1, 1, 1,
-0.1742324, -0.1287862, -1.819757, 1, 1, 1, 1, 1,
-0.1734749, -0.5583476, -2.599392, 1, 1, 1, 1, 1,
-0.1723403, -2.402261, -2.966224, 1, 1, 1, 1, 1,
-0.17061, 1.991201, 1.012631, 1, 1, 1, 1, 1,
-0.1655846, 0.8675793, 0.5433094, 1, 1, 1, 1, 1,
-0.1604575, 1.495357, -0.03965828, 1, 1, 1, 1, 1,
-0.1581335, -0.4138496, -3.502092, 1, 1, 1, 1, 1,
-0.1575705, -0.8434848, -2.929404, 1, 1, 1, 1, 1,
-0.1553412, 1.261729, 0.8261129, 1, 1, 1, 1, 1,
-0.1528333, 0.8636387, 1.908872, 1, 1, 1, 1, 1,
-0.1525067, -0.7541286, -4.013211, 0, 0, 1, 1, 1,
-0.1516625, -0.8551772, -3.34536, 1, 0, 0, 1, 1,
-0.1513341, -0.1090495, -0.07810742, 1, 0, 0, 1, 1,
-0.147407, -0.0105788, -1.407093, 1, 0, 0, 1, 1,
-0.1463488, 0.7997169, -1.141533, 1, 0, 0, 1, 1,
-0.1457836, 1.048074, -1.817733, 1, 0, 0, 1, 1,
-0.1456486, 0.5319121, 0.5912489, 0, 0, 0, 1, 1,
-0.1455386, -1.278024, -4.783757, 0, 0, 0, 1, 1,
-0.1438345, 0.4184321, -1.328379, 0, 0, 0, 1, 1,
-0.1434233, -0.2829465, -2.951144, 0, 0, 0, 1, 1,
-0.1379562, 1.190955, -0.8457049, 0, 0, 0, 1, 1,
-0.135243, -0.3096024, -1.237588, 0, 0, 0, 1, 1,
-0.135175, 0.6795524, 0.02807613, 0, 0, 0, 1, 1,
-0.1279425, 1.435774, -1.143322, 1, 1, 1, 1, 1,
-0.1249919, 1.28511, 0.7135889, 1, 1, 1, 1, 1,
-0.1218535, -0.509169, -2.255855, 1, 1, 1, 1, 1,
-0.114714, 1.312477, 1.452832, 1, 1, 1, 1, 1,
-0.1139158, 0.5377223, -1.077924, 1, 1, 1, 1, 1,
-0.112656, -0.1940474, -2.803579, 1, 1, 1, 1, 1,
-0.109257, -0.47539, -2.661283, 1, 1, 1, 1, 1,
-0.1077579, -0.1758026, -0.6139999, 1, 1, 1, 1, 1,
-0.1050205, -1.950168, -4.378411, 1, 1, 1, 1, 1,
-0.1019033, -0.667738, -3.680557, 1, 1, 1, 1, 1,
-0.09838101, 1.846844, 0.003735068, 1, 1, 1, 1, 1,
-0.09594442, 2.086962, -0.8029634, 1, 1, 1, 1, 1,
-0.09088184, 1.785443, 0.919251, 1, 1, 1, 1, 1,
-0.09025555, 0.8476168, -0.09267879, 1, 1, 1, 1, 1,
-0.08684743, -1.811859, -0.7994568, 1, 1, 1, 1, 1,
-0.08473312, -0.4455566, -3.31916, 0, 0, 1, 1, 1,
-0.08331027, -1.102227, -3.141574, 1, 0, 0, 1, 1,
-0.07940892, -1.577708, -3.534547, 1, 0, 0, 1, 1,
-0.074983, -0.002060374, -0.8144292, 1, 0, 0, 1, 1,
-0.07475469, -0.1912754, -3.894325, 1, 0, 0, 1, 1,
-0.07326847, 0.3486609, 0.6129166, 1, 0, 0, 1, 1,
-0.07155254, 0.9865029, -0.9248673, 0, 0, 0, 1, 1,
-0.06839256, -1.070246, -1.47194, 0, 0, 0, 1, 1,
-0.05690823, -0.999314, -3.38903, 0, 0, 0, 1, 1,
-0.0552077, 0.06961213, -0.7484999, 0, 0, 0, 1, 1,
-0.04584115, 0.891626, 0.373908, 0, 0, 0, 1, 1,
-0.04434606, -1.404296, -3.484612, 0, 0, 0, 1, 1,
-0.04298268, 0.1333967, -1.070598, 0, 0, 0, 1, 1,
-0.03730976, 0.6051939, -0.3708034, 1, 1, 1, 1, 1,
-0.03437106, -0.06072984, -2.910956, 1, 1, 1, 1, 1,
-0.03339805, -0.1741457, -3.380354, 1, 1, 1, 1, 1,
-0.02893725, 1.505421, 0.8788648, 1, 1, 1, 1, 1,
-0.02303247, 1.176027, 0.3827036, 1, 1, 1, 1, 1,
-0.01469192, -0.4493357, -1.877943, 1, 1, 1, 1, 1,
-0.01421141, -0.7002976, -4.048851, 1, 1, 1, 1, 1,
-0.01398197, 0.09161463, 0.6225913, 1, 1, 1, 1, 1,
-0.01292252, -0.3156492, -3.302265, 1, 1, 1, 1, 1,
-0.01173851, -1.616205, -2.235719, 1, 1, 1, 1, 1,
-0.003445, -1.3635, -2.85504, 1, 1, 1, 1, 1,
0.0006370503, -0.7649865, 3.610238, 1, 1, 1, 1, 1,
0.0009591525, -0.5220839, 4.4138, 1, 1, 1, 1, 1,
0.002587336, 1.616416, 0.9415568, 1, 1, 1, 1, 1,
0.005635779, 0.5726017, 0.4035769, 1, 1, 1, 1, 1,
0.006619541, 0.44179, -0.7446052, 0, 0, 1, 1, 1,
0.007079589, -0.2505143, 2.631454, 1, 0, 0, 1, 1,
0.01604593, -1.419028, 2.465338, 1, 0, 0, 1, 1,
0.01695078, -0.08946123, 3.854626, 1, 0, 0, 1, 1,
0.0217369, 1.496164, -0.2424914, 1, 0, 0, 1, 1,
0.0229343, 0.1879403, 0.8141301, 1, 0, 0, 1, 1,
0.03024098, 0.565386, 2.031753, 0, 0, 0, 1, 1,
0.0357479, -1.327865, 3.573735, 0, 0, 0, 1, 1,
0.03616172, 0.5406613, -0.4459514, 0, 0, 0, 1, 1,
0.04151328, 0.9090202, 0.3313516, 0, 0, 0, 1, 1,
0.04366758, 1.500033, -0.4854412, 0, 0, 0, 1, 1,
0.04433917, 0.6245009, -1.00626, 0, 0, 0, 1, 1,
0.04526563, -1.425883, 2.611448, 0, 0, 0, 1, 1,
0.04565228, -0.541285, 2.002798, 1, 1, 1, 1, 1,
0.05063251, -0.2772549, 3.135995, 1, 1, 1, 1, 1,
0.0526687, 0.07859707, -0.4431927, 1, 1, 1, 1, 1,
0.05315168, -1.376655, 4.294837, 1, 1, 1, 1, 1,
0.05449884, -0.4574678, 2.465874, 1, 1, 1, 1, 1,
0.05863374, -0.6375802, 4.264702, 1, 1, 1, 1, 1,
0.05958036, -0.3526015, 3.132319, 1, 1, 1, 1, 1,
0.06229069, 0.7038336, -0.983738, 1, 1, 1, 1, 1,
0.06628202, 2.087679, 1.739628, 1, 1, 1, 1, 1,
0.0724526, -0.7956176, 2.350338, 1, 1, 1, 1, 1,
0.07416142, -0.5046718, 1.768615, 1, 1, 1, 1, 1,
0.08278218, 1.994145, 0.08044711, 1, 1, 1, 1, 1,
0.08453111, -0.4349428, 1.972037, 1, 1, 1, 1, 1,
0.08892777, 0.9448984, -0.3645594, 1, 1, 1, 1, 1,
0.08907027, 0.5310183, -0.01859022, 1, 1, 1, 1, 1,
0.09097172, 0.323896, 0.9977276, 0, 0, 1, 1, 1,
0.09119219, 0.7113668, 0.491678, 1, 0, 0, 1, 1,
0.09420805, 1.487722, 1.12817, 1, 0, 0, 1, 1,
0.09538659, -0.3518369, 2.108522, 1, 0, 0, 1, 1,
0.09538686, -1.488689, 4.075081, 1, 0, 0, 1, 1,
0.09813694, 0.2036002, 0.5721137, 1, 0, 0, 1, 1,
0.099222, 0.7232623, -0.6097193, 0, 0, 0, 1, 1,
0.09990504, 1.175663, -1.81954, 0, 0, 0, 1, 1,
0.1026176, 0.2125819, 2.268796, 0, 0, 0, 1, 1,
0.1068208, -0.252229, 1.928328, 0, 0, 0, 1, 1,
0.1091519, 0.4895817, -0.1966398, 0, 0, 0, 1, 1,
0.1093945, -1.487108, 3.114811, 0, 0, 0, 1, 1,
0.113809, -0.7221212, 3.080646, 0, 0, 0, 1, 1,
0.1176853, 0.5849949, 1.24866, 1, 1, 1, 1, 1,
0.1194511, -1.512692, 3.80789, 1, 1, 1, 1, 1,
0.12012, -0.3224541, 4.552998, 1, 1, 1, 1, 1,
0.120601, -0.7341285, 3.028397, 1, 1, 1, 1, 1,
0.1253887, 1.024369, 0.437746, 1, 1, 1, 1, 1,
0.1258946, 0.960737, -1.077336, 1, 1, 1, 1, 1,
0.1280896, 0.7779776, 0.8743536, 1, 1, 1, 1, 1,
0.1285444, 0.09151909, 0.662861, 1, 1, 1, 1, 1,
0.128609, 1.014164, 0.06315687, 1, 1, 1, 1, 1,
0.1385101, -0.5725003, 4.512917, 1, 1, 1, 1, 1,
0.1388406, -0.7512663, 3.3813, 1, 1, 1, 1, 1,
0.1404776, -1.643323, 3.927228, 1, 1, 1, 1, 1,
0.1410135, -1.297305, 4.983936, 1, 1, 1, 1, 1,
0.1424822, 1.097399, 0.5850406, 1, 1, 1, 1, 1,
0.143567, 2.177177, -0.09972671, 1, 1, 1, 1, 1,
0.1461874, 1.069052, -0.6236771, 0, 0, 1, 1, 1,
0.1497225, 1.934133, -0.1102026, 1, 0, 0, 1, 1,
0.1502915, -0.4982212, 1.749656, 1, 0, 0, 1, 1,
0.152248, -0.6923563, 4.365852, 1, 0, 0, 1, 1,
0.1524665, 0.2340605, 1.341914, 1, 0, 0, 1, 1,
0.1534826, 0.09445638, 0.9557741, 1, 0, 0, 1, 1,
0.1538728, 1.023299, 0.3934288, 0, 0, 0, 1, 1,
0.1552317, 0.9315912, -0.9641151, 0, 0, 0, 1, 1,
0.1558796, -0.04688907, 2.523618, 0, 0, 0, 1, 1,
0.1582235, -0.8814898, 2.591362, 0, 0, 0, 1, 1,
0.1606701, 1.052014, 0.03457513, 0, 0, 0, 1, 1,
0.1624647, -0.1783377, 1.977717, 0, 0, 0, 1, 1,
0.1626051, 0.7245964, 0.7778651, 0, 0, 0, 1, 1,
0.1630497, -0.2145133, 2.14573, 1, 1, 1, 1, 1,
0.1636575, -1.909447, 3.465557, 1, 1, 1, 1, 1,
0.1649553, 1.19677, 0.6054471, 1, 1, 1, 1, 1,
0.1657183, -1.139666, 2.802793, 1, 1, 1, 1, 1,
0.1657311, 0.3133706, 1.062736, 1, 1, 1, 1, 1,
0.1749564, 1.631321, 0.3623654, 1, 1, 1, 1, 1,
0.1794249, 1.13296, 0.2042465, 1, 1, 1, 1, 1,
0.1795411, -0.1752903, 2.842037, 1, 1, 1, 1, 1,
0.191489, -0.5463322, 2.336988, 1, 1, 1, 1, 1,
0.1939107, -0.04480444, 1.542934, 1, 1, 1, 1, 1,
0.1966098, -1.2624, 2.982108, 1, 1, 1, 1, 1,
0.1979291, -0.1605084, 1.57591, 1, 1, 1, 1, 1,
0.2005503, 2.170548, -1.431883, 1, 1, 1, 1, 1,
0.2026035, -0.5054099, 2.43771, 1, 1, 1, 1, 1,
0.2035433, -0.2740997, 2.553735, 1, 1, 1, 1, 1,
0.2043462, -0.5675291, 3.332757, 0, 0, 1, 1, 1,
0.2053451, -2.018238, 4.306916, 1, 0, 0, 1, 1,
0.2065199, 0.333128, 1.402309, 1, 0, 0, 1, 1,
0.2071837, 0.310938, 0.4299836, 1, 0, 0, 1, 1,
0.2076124, -1.281904, 2.547713, 1, 0, 0, 1, 1,
0.210189, 0.3209737, 1.329769, 1, 0, 0, 1, 1,
0.2145269, -0.5038188, 3.506602, 0, 0, 0, 1, 1,
0.2156219, 0.9050974, 0.3158979, 0, 0, 0, 1, 1,
0.2167155, -1.260556, 3.182203, 0, 0, 0, 1, 1,
0.2170807, 0.9590654, -0.008961289, 0, 0, 0, 1, 1,
0.2215291, -0.4815368, 1.731786, 0, 0, 0, 1, 1,
0.2226633, -2.569101, 5.188155, 0, 0, 0, 1, 1,
0.2296303, 0.3811392, -0.729854, 0, 0, 0, 1, 1,
0.2301192, -0.8064425, 3.235942, 1, 1, 1, 1, 1,
0.2309477, -1.383984, 4.953284, 1, 1, 1, 1, 1,
0.2313856, 0.5141477, -0.9631684, 1, 1, 1, 1, 1,
0.2352766, 2.325463, 0.416259, 1, 1, 1, 1, 1,
0.2368241, 1.525608, 0.1144942, 1, 1, 1, 1, 1,
0.2379953, -2.382922, 2.628965, 1, 1, 1, 1, 1,
0.2383709, -0.4083318, 2.438431, 1, 1, 1, 1, 1,
0.2407248, 0.6668913, 0.08532494, 1, 1, 1, 1, 1,
0.2410577, -0.2833856, 1.336201, 1, 1, 1, 1, 1,
0.2417748, -0.2323442, 0.9107115, 1, 1, 1, 1, 1,
0.242858, -0.2718354, 2.890899, 1, 1, 1, 1, 1,
0.2435144, 0.1126442, 1.177803, 1, 1, 1, 1, 1,
0.2462261, -0.5214485, 3.166385, 1, 1, 1, 1, 1,
0.2463427, 0.9282975, 0.681565, 1, 1, 1, 1, 1,
0.2489159, -1.820334, 3.382587, 1, 1, 1, 1, 1,
0.2494925, 0.1488894, 1.967524, 0, 0, 1, 1, 1,
0.2498046, -0.6124896, 3.273566, 1, 0, 0, 1, 1,
0.2499904, -0.3514366, 2.970259, 1, 0, 0, 1, 1,
0.252298, -0.389592, 1.308498, 1, 0, 0, 1, 1,
0.2532121, 0.7322878, 1.47649, 1, 0, 0, 1, 1,
0.2553007, 0.1478738, 1.089613, 1, 0, 0, 1, 1,
0.2564094, 0.6047305, -0.2572786, 0, 0, 0, 1, 1,
0.2577276, -1.059813, 3.33041, 0, 0, 0, 1, 1,
0.2624509, 0.6400447, -0.1363819, 0, 0, 0, 1, 1,
0.2655515, -0.870898, 2.910343, 0, 0, 0, 1, 1,
0.2691202, 0.5897904, 0.1986869, 0, 0, 0, 1, 1,
0.2707025, -0.4523665, 3.146055, 0, 0, 0, 1, 1,
0.2746579, -2.072522, 5.832261, 0, 0, 0, 1, 1,
0.2763151, 0.6730074, -1.503589, 1, 1, 1, 1, 1,
0.2764757, 0.2735472, 0.2522656, 1, 1, 1, 1, 1,
0.282417, 0.3455347, 1.789943, 1, 1, 1, 1, 1,
0.2848715, 0.8987761, 2.072147, 1, 1, 1, 1, 1,
0.2923502, 0.5513275, 0.9434438, 1, 1, 1, 1, 1,
0.2928942, -1.395882, 5.467836, 1, 1, 1, 1, 1,
0.2944174, 1.161632, -0.4293955, 1, 1, 1, 1, 1,
0.3020235, 0.7318338, -0.587459, 1, 1, 1, 1, 1,
0.305363, 1.034856, 0.3432112, 1, 1, 1, 1, 1,
0.3059759, -1.31318, 2.835002, 1, 1, 1, 1, 1,
0.3079875, 0.5484108, -0.8091959, 1, 1, 1, 1, 1,
0.3103889, -0.2019555, 1.60412, 1, 1, 1, 1, 1,
0.318327, -0.2962409, 3.551995, 1, 1, 1, 1, 1,
0.3197942, 1.28617, 1.716827, 1, 1, 1, 1, 1,
0.3205307, -0.8368331, 4.397283, 1, 1, 1, 1, 1,
0.3291808, 1.714, 1.128228, 0, 0, 1, 1, 1,
0.3350861, 0.01239412, 1.772413, 1, 0, 0, 1, 1,
0.33789, 0.5218528, 0.9361783, 1, 0, 0, 1, 1,
0.3412655, -0.7859305, 2.632514, 1, 0, 0, 1, 1,
0.3462357, 0.9173787, 0.3163366, 1, 0, 0, 1, 1,
0.3490853, -1.334022, 3.019228, 1, 0, 0, 1, 1,
0.3497585, -0.6178796, 3.06072, 0, 0, 0, 1, 1,
0.3499502, 0.07893724, 0.02240958, 0, 0, 0, 1, 1,
0.3539556, -0.1384777, 1.761845, 0, 0, 0, 1, 1,
0.359524, -1.616323, 4.224324, 0, 0, 0, 1, 1,
0.360692, 0.2899713, 0.8713664, 0, 0, 0, 1, 1,
0.3618085, -0.2472215, 2.086985, 0, 0, 0, 1, 1,
0.3626176, -0.505241, 3.730969, 0, 0, 0, 1, 1,
0.363099, 0.4069139, 1.654778, 1, 1, 1, 1, 1,
0.3657778, -2.462847, 1.822087, 1, 1, 1, 1, 1,
0.3658609, 0.5305471, 0.6913651, 1, 1, 1, 1, 1,
0.3663028, 0.6213089, 2.233685, 1, 1, 1, 1, 1,
0.3703212, 0.7835013, -0.1583196, 1, 1, 1, 1, 1,
0.3708911, 1.394837, -0.06791679, 1, 1, 1, 1, 1,
0.3766685, 2.491246, -0.7139634, 1, 1, 1, 1, 1,
0.3782945, 0.9282374, 0.965157, 1, 1, 1, 1, 1,
0.387066, -0.05329172, 1.45756, 1, 1, 1, 1, 1,
0.3884815, 0.1389399, 0.3896178, 1, 1, 1, 1, 1,
0.3886175, 0.3219813, 1.05471, 1, 1, 1, 1, 1,
0.3932057, 0.5607888, 0.05523283, 1, 1, 1, 1, 1,
0.3944563, 0.05605343, 1.678623, 1, 1, 1, 1, 1,
0.3955813, -0.6337604, 2.025471, 1, 1, 1, 1, 1,
0.4002656, -2.486264, 3.311239, 1, 1, 1, 1, 1,
0.4034916, -0.3211916, 2.233324, 0, 0, 1, 1, 1,
0.4048548, -1.608202, 2.278824, 1, 0, 0, 1, 1,
0.4114754, 0.345378, -0.1716825, 1, 0, 0, 1, 1,
0.4115819, -1.719017, 1.064196, 1, 0, 0, 1, 1,
0.4135782, 0.5946992, -0.4833497, 1, 0, 0, 1, 1,
0.418559, 0.05609105, 2.463565, 1, 0, 0, 1, 1,
0.4254884, 0.8560202, 1.285535, 0, 0, 0, 1, 1,
0.4409163, 0.6316692, 2.703461, 0, 0, 0, 1, 1,
0.4473835, -0.5782601, 3.114476, 0, 0, 0, 1, 1,
0.4504046, 0.09495776, 2.167323, 0, 0, 0, 1, 1,
0.4540163, -0.2107415, 1.886062, 0, 0, 0, 1, 1,
0.4543312, 0.5488688, 0.951398, 0, 0, 0, 1, 1,
0.4545541, 0.9447895, 0.207941, 0, 0, 0, 1, 1,
0.4581868, -0.9494579, 2.015748, 1, 1, 1, 1, 1,
0.4591387, 2.039063, -0.7061216, 1, 1, 1, 1, 1,
0.4625992, 0.6489487, 0.3337542, 1, 1, 1, 1, 1,
0.4658929, 0.8289781, 0.9442552, 1, 1, 1, 1, 1,
0.4668387, -1.126339, 2.215437, 1, 1, 1, 1, 1,
0.4675919, -0.9155188, 1.705566, 1, 1, 1, 1, 1,
0.4753507, 0.137638, 1.201561, 1, 1, 1, 1, 1,
0.4763528, 1.987684, -1.256933, 1, 1, 1, 1, 1,
0.4765434, 1.888705, -0.4932406, 1, 1, 1, 1, 1,
0.4825864, -1.799323, 4.109715, 1, 1, 1, 1, 1,
0.4827344, 2.046033, -1.072237, 1, 1, 1, 1, 1,
0.5072126, -1.833541, 2.235405, 1, 1, 1, 1, 1,
0.5136693, 0.8919893, 0.4409863, 1, 1, 1, 1, 1,
0.518788, 1.511954, 0.4866637, 1, 1, 1, 1, 1,
0.5215901, 1.554362, -1.286486, 1, 1, 1, 1, 1,
0.532905, 1.392173, -1.182564, 0, 0, 1, 1, 1,
0.5344583, -1.4893, 2.825203, 1, 0, 0, 1, 1,
0.5366558, -1.808295, 1.706345, 1, 0, 0, 1, 1,
0.5376612, 0.007477403, 1.493345, 1, 0, 0, 1, 1,
0.5382624, -2.243975, 1.434963, 1, 0, 0, 1, 1,
0.5394137, -0.2015529, 2.493872, 1, 0, 0, 1, 1,
0.5410503, -0.2349663, 1.141257, 0, 0, 0, 1, 1,
0.5422348, 0.9746874, 1.863737, 0, 0, 0, 1, 1,
0.5455413, 0.3878873, 1.112754, 0, 0, 0, 1, 1,
0.5455947, -0.06711546, 0.6538247, 0, 0, 0, 1, 1,
0.5484055, -0.6472995, 2.603757, 0, 0, 0, 1, 1,
0.5491142, -0.9510589, 2.594288, 0, 0, 0, 1, 1,
0.5555527, 1.664093, 1.900098, 0, 0, 0, 1, 1,
0.5572317, 1.328874, 2.093379, 1, 1, 1, 1, 1,
0.5606713, -0.7337199, 2.874966, 1, 1, 1, 1, 1,
0.5624478, 1.764366, 0.9815277, 1, 1, 1, 1, 1,
0.5644895, -1.590568, -0.04102532, 1, 1, 1, 1, 1,
0.5654594, 0.06395527, 1.751962, 1, 1, 1, 1, 1,
0.5710172, 1.555972, 0.1053397, 1, 1, 1, 1, 1,
0.5723596, -0.4990797, 0.812957, 1, 1, 1, 1, 1,
0.5796776, 1.605481, -0.1797963, 1, 1, 1, 1, 1,
0.5802189, 1.003002, 1.189754, 1, 1, 1, 1, 1,
0.581093, 0.2414887, 1.535217, 1, 1, 1, 1, 1,
0.5859874, 0.7675766, 0.09399689, 1, 1, 1, 1, 1,
0.5884774, 1.071937, 2.730233, 1, 1, 1, 1, 1,
0.5930111, -0.3768682, 1.926084, 1, 1, 1, 1, 1,
0.5944738, 0.3277136, -0.3679973, 1, 1, 1, 1, 1,
0.5944817, -0.8717589, 2.101241, 1, 1, 1, 1, 1,
0.5952988, -1.685681, 2.270331, 0, 0, 1, 1, 1,
0.5954074, 1.022039, 0.2336087, 1, 0, 0, 1, 1,
0.5964395, 1.267135, 2.035698, 1, 0, 0, 1, 1,
0.6078877, 0.08781803, 1.967816, 1, 0, 0, 1, 1,
0.6120433, 0.8512111, 1.081806, 1, 0, 0, 1, 1,
0.6169202, -0.3304235, -0.4667285, 1, 0, 0, 1, 1,
0.6179883, 0.1311958, 1.984133, 0, 0, 0, 1, 1,
0.6208156, -1.683449, 3.287597, 0, 0, 0, 1, 1,
0.6212304, 0.08043671, 0.9938961, 0, 0, 0, 1, 1,
0.6243135, -1.105524, 3.481102, 0, 0, 0, 1, 1,
0.630071, -2.111915, 0.1025726, 0, 0, 0, 1, 1,
0.6310365, 0.675943, 1.307667, 0, 0, 0, 1, 1,
0.6349966, -0.1349006, 0.8031563, 0, 0, 0, 1, 1,
0.6363162, 0.5030288, 0.4688282, 1, 1, 1, 1, 1,
0.6429004, 1.372984, -1.941919, 1, 1, 1, 1, 1,
0.6450912, -0.2882977, 1.430732, 1, 1, 1, 1, 1,
0.6480072, 1.129264, 0.2534933, 1, 1, 1, 1, 1,
0.6481038, 3.039572, 0.01295821, 1, 1, 1, 1, 1,
0.6490939, 0.5563971, 0.02088608, 1, 1, 1, 1, 1,
0.6491048, 1.064621, 1.003728, 1, 1, 1, 1, 1,
0.650773, 0.4969523, 1.588468, 1, 1, 1, 1, 1,
0.6587815, 0.04989637, 1.378787, 1, 1, 1, 1, 1,
0.6589028, 1.893422, 2.241401, 1, 1, 1, 1, 1,
0.6589733, -0.0005771832, 1.341436, 1, 1, 1, 1, 1,
0.6629842, 0.001309562, 1.16486, 1, 1, 1, 1, 1,
0.6656349, 0.1969064, 0.273469, 1, 1, 1, 1, 1,
0.6719906, 0.5508465, 0.02405152, 1, 1, 1, 1, 1,
0.6727309, -0.9506613, 2.913726, 1, 1, 1, 1, 1,
0.6797372, 0.8910224, -1.563188, 0, 0, 1, 1, 1,
0.6851947, 0.01768002, 1.222966, 1, 0, 0, 1, 1,
0.6853804, 0.2619182, 0.958295, 1, 0, 0, 1, 1,
0.6859997, -0.5302677, 1.092395, 1, 0, 0, 1, 1,
0.6907789, -0.9074527, 3.300929, 1, 0, 0, 1, 1,
0.6942723, 0.7303814, 1.117173, 1, 0, 0, 1, 1,
0.6957749, 0.5616155, 2.446596, 0, 0, 0, 1, 1,
0.6959375, 0.7648072, 1.809802, 0, 0, 0, 1, 1,
0.7019824, 0.8131722, 2.007519, 0, 0, 0, 1, 1,
0.7057586, -0.8596596, 1.656792, 0, 0, 0, 1, 1,
0.7076009, 0.1830983, 0.9166439, 0, 0, 0, 1, 1,
0.7085636, 0.01142149, 0.1789902, 0, 0, 0, 1, 1,
0.7088107, -0.1035728, 2.232388, 0, 0, 0, 1, 1,
0.7101067, -0.9884564, 2.519847, 1, 1, 1, 1, 1,
0.7127549, -0.4615446, 0.1855613, 1, 1, 1, 1, 1,
0.7171844, 0.3843175, 1.776284, 1, 1, 1, 1, 1,
0.7184265, -0.3871619, 3.075112, 1, 1, 1, 1, 1,
0.7190775, -0.3762926, 2.98554, 1, 1, 1, 1, 1,
0.7225286, 1.166105, 1.460444, 1, 1, 1, 1, 1,
0.7313676, -0.7608585, 1.913246, 1, 1, 1, 1, 1,
0.7328671, -0.3867312, 2.223228, 1, 1, 1, 1, 1,
0.7440963, 0.1797548, 2.212959, 1, 1, 1, 1, 1,
0.7471426, 0.6656543, 1.120774, 1, 1, 1, 1, 1,
0.7493271, 2.156702, -0.5153688, 1, 1, 1, 1, 1,
0.7532762, 0.3202016, 0.8285726, 1, 1, 1, 1, 1,
0.7547513, -1.216446, 2.722613, 1, 1, 1, 1, 1,
0.7554021, -0.905101, 3.411811, 1, 1, 1, 1, 1,
0.757448, 0.8290808, 0.5290807, 1, 1, 1, 1, 1,
0.7645209, 1.258427, -0.9301482, 0, 0, 1, 1, 1,
0.7658032, 1.067677, 2.481667, 1, 0, 0, 1, 1,
0.7662164, 0.2019826, 0.4347171, 1, 0, 0, 1, 1,
0.7692797, 1.156413, -1.240934, 1, 0, 0, 1, 1,
0.7757374, -0.2122754, 2.1801, 1, 0, 0, 1, 1,
0.7784669, 0.412418, 1.537061, 1, 0, 0, 1, 1,
0.7810605, -0.2553878, 0.4040039, 0, 0, 0, 1, 1,
0.7886147, -0.9305555, 1.843676, 0, 0, 0, 1, 1,
0.7899185, -0.03930252, 0.6056513, 0, 0, 0, 1, 1,
0.7959934, 0.7662447, 0.8953528, 0, 0, 0, 1, 1,
0.7970887, 0.5921234, -0.1454754, 0, 0, 0, 1, 1,
0.797752, 1.937972, -0.07495175, 0, 0, 0, 1, 1,
0.7980097, 0.8168687, -0.8379597, 0, 0, 0, 1, 1,
0.8042567, 1.083596, 1.095937, 1, 1, 1, 1, 1,
0.8098623, 0.6919762, 1.433334, 1, 1, 1, 1, 1,
0.8108878, -0.2822472, 3.02591, 1, 1, 1, 1, 1,
0.8156354, 0.6540169, 1.674121, 1, 1, 1, 1, 1,
0.8169996, 0.04571692, 1.511806, 1, 1, 1, 1, 1,
0.8284568, 0.6844789, 1.584454, 1, 1, 1, 1, 1,
0.8305225, -0.8916382, 2.784054, 1, 1, 1, 1, 1,
0.8357295, -0.2906593, 1.697813, 1, 1, 1, 1, 1,
0.8373979, -0.9619672, 1.811149, 1, 1, 1, 1, 1,
0.8448014, 0.9261041, 1.585461, 1, 1, 1, 1, 1,
0.8463145, 0.5313576, 0.3772122, 1, 1, 1, 1, 1,
0.8471061, 1.732043, 0.9633074, 1, 1, 1, 1, 1,
0.8547426, -0.8496259, 2.871105, 1, 1, 1, 1, 1,
0.8582135, -0.08268014, 2.043003, 1, 1, 1, 1, 1,
0.8630634, 0.6516919, 2.24925, 1, 1, 1, 1, 1,
0.8644519, 0.4321991, 1.307981, 0, 0, 1, 1, 1,
0.8765179, -1.082867, 3.412172, 1, 0, 0, 1, 1,
0.8813058, -0.6618121, 3.391432, 1, 0, 0, 1, 1,
0.8880784, 0.9595498, 0.6777462, 1, 0, 0, 1, 1,
0.8895538, 0.342618, -0.8055326, 1, 0, 0, 1, 1,
0.8964969, 0.3237652, 3.021621, 1, 0, 0, 1, 1,
0.9033046, 0.7752713, 2.681871, 0, 0, 0, 1, 1,
0.9051206, 0.3554255, 1.451323, 0, 0, 0, 1, 1,
0.9167372, 0.9307377, -0.7449641, 0, 0, 0, 1, 1,
0.9179413, -0.5915103, 1.161105, 0, 0, 0, 1, 1,
0.920265, 1.003837, 1.346596, 0, 0, 0, 1, 1,
0.9204518, -0.4631807, 2.899058, 0, 0, 0, 1, 1,
0.9214852, 0.6912654, 1.457095, 0, 0, 0, 1, 1,
0.9250742, -0.9381913, 5.022931, 1, 1, 1, 1, 1,
0.9265283, -1.051849, 4.101156, 1, 1, 1, 1, 1,
0.9303436, -1.164533, 1.966663, 1, 1, 1, 1, 1,
0.9330468, 0.1638001, 2.387654, 1, 1, 1, 1, 1,
0.9364425, -1.609362, 3.351582, 1, 1, 1, 1, 1,
0.9476167, 1.641865, 0.9329853, 1, 1, 1, 1, 1,
0.9479696, -1.738862, 2.272017, 1, 1, 1, 1, 1,
0.9501117, 0.1697306, 0.9305786, 1, 1, 1, 1, 1,
0.9508666, 1.255461, 1.655005, 1, 1, 1, 1, 1,
0.9591587, 0.6822873, 1.177191, 1, 1, 1, 1, 1,
0.9615738, 0.4964582, 0.280921, 1, 1, 1, 1, 1,
0.9617042, 0.2682628, 2.111301, 1, 1, 1, 1, 1,
0.9634447, 1.121471, -0.1954021, 1, 1, 1, 1, 1,
0.9702864, 1.008526, 0.8925941, 1, 1, 1, 1, 1,
0.9745511, -1.000429, 3.713887, 1, 1, 1, 1, 1,
0.9782424, 0.8287686, 0.3764831, 0, 0, 1, 1, 1,
0.981932, 1.353466, 0.3306917, 1, 0, 0, 1, 1,
0.9819733, -0.9085531, 0.8327749, 1, 0, 0, 1, 1,
0.9888306, 0.4552156, -1.087654, 1, 0, 0, 1, 1,
0.9935297, 1.47966, 0.6801236, 1, 0, 0, 1, 1,
0.9981647, 1.984285, 1.422536, 1, 0, 0, 1, 1,
1.004416, -1.280696, 1.78833, 0, 0, 0, 1, 1,
1.011976, -0.2958239, 0.6460139, 0, 0, 0, 1, 1,
1.018651, -0.1349123, 0.3439483, 0, 0, 0, 1, 1,
1.026034, -0.8469646, 3.620711, 0, 0, 0, 1, 1,
1.033332, 0.9732376, 2.266963, 0, 0, 0, 1, 1,
1.036692, -0.7151152, 1.109646, 0, 0, 0, 1, 1,
1.045851, 1.645482, 0.3335851, 0, 0, 0, 1, 1,
1.047961, 0.763035, 0.7874144, 1, 1, 1, 1, 1,
1.048203, -1.855693, 3.188815, 1, 1, 1, 1, 1,
1.054721, 0.858705, 0.1666019, 1, 1, 1, 1, 1,
1.055662, -0.252156, 1.867213, 1, 1, 1, 1, 1,
1.055892, -0.1436187, 1.704014, 1, 1, 1, 1, 1,
1.05718, -0.9457216, 3.218068, 1, 1, 1, 1, 1,
1.063025, 0.7870761, 1.228882, 1, 1, 1, 1, 1,
1.068914, 1.029936, 1.081029, 1, 1, 1, 1, 1,
1.079219, -1.250693, 1.491811, 1, 1, 1, 1, 1,
1.079697, -0.3466498, 3.569358, 1, 1, 1, 1, 1,
1.0826, -1.241376, 3.823242, 1, 1, 1, 1, 1,
1.082897, -0.2423584, 1.215225, 1, 1, 1, 1, 1,
1.084004, 0.05245983, 2.079586, 1, 1, 1, 1, 1,
1.086667, 0.4595983, 1.486994, 1, 1, 1, 1, 1,
1.087126, 1.553701, -1.097097, 1, 1, 1, 1, 1,
1.095269, 0.6672422, 1.293448, 0, 0, 1, 1, 1,
1.096468, 0.2247432, 2.209172, 1, 0, 0, 1, 1,
1.102432, -0.9744762, 1.600568, 1, 0, 0, 1, 1,
1.107823, 1.15021, 1.619928, 1, 0, 0, 1, 1,
1.110523, -1.158994, 3.306968, 1, 0, 0, 1, 1,
1.114436, -1.29289, 1.733338, 1, 0, 0, 1, 1,
1.120354, -0.1956924, 1.372297, 0, 0, 0, 1, 1,
1.123102, -1.910814, 1.634549, 0, 0, 0, 1, 1,
1.125857, 0.426329, 0.03407899, 0, 0, 0, 1, 1,
1.128719, 1.061723, 2.299339, 0, 0, 0, 1, 1,
1.130366, 0.1445971, 0.7688342, 0, 0, 0, 1, 1,
1.130396, 0.4850821, 0.2499959, 0, 0, 0, 1, 1,
1.13158, 0.7986488, 0.5694289, 0, 0, 0, 1, 1,
1.156764, 1.199641, 2.702584, 1, 1, 1, 1, 1,
1.156902, -0.9918792, 3.024194, 1, 1, 1, 1, 1,
1.160626, 1.226176, -1.888858, 1, 1, 1, 1, 1,
1.181714, -0.786621, 2.696201, 1, 1, 1, 1, 1,
1.183154, -1.359213, 2.327923, 1, 1, 1, 1, 1,
1.19313, -0.9607071, 3.186315, 1, 1, 1, 1, 1,
1.194044, -0.2933727, 2.661818, 1, 1, 1, 1, 1,
1.20405, 0.4739497, 2.060505, 1, 1, 1, 1, 1,
1.209664, 0.4239075, -0.2163373, 1, 1, 1, 1, 1,
1.211768, 0.4975218, 1.608302, 1, 1, 1, 1, 1,
1.218082, -1.681348, 0.43863, 1, 1, 1, 1, 1,
1.21903, -0.6635831, 1.359238, 1, 1, 1, 1, 1,
1.240729, 0.8193665, 1.501145, 1, 1, 1, 1, 1,
1.247857, -1.26528, 2.200115, 1, 1, 1, 1, 1,
1.253489, -1.3071, 1.715717, 1, 1, 1, 1, 1,
1.257093, -0.7425809, 1.608988, 0, 0, 1, 1, 1,
1.257563, 1.430348, 1.684638, 1, 0, 0, 1, 1,
1.265891, -0.9367598, 1.876359, 1, 0, 0, 1, 1,
1.272749, 0.3799336, 1.830822, 1, 0, 0, 1, 1,
1.285543, 0.5341274, -0.2438872, 1, 0, 0, 1, 1,
1.285665, 1.596237, 0.7838317, 1, 0, 0, 1, 1,
1.295916, 0.5727617, 2.486794, 0, 0, 0, 1, 1,
1.297115, -0.21884, 2.836668, 0, 0, 0, 1, 1,
1.301484, -0.7117115, 3.993315, 0, 0, 0, 1, 1,
1.322061, 1.261853, 0.9537864, 0, 0, 0, 1, 1,
1.322664, 0.9554527, -0.4980231, 0, 0, 0, 1, 1,
1.332504, 2.080516, 1.028603, 0, 0, 0, 1, 1,
1.335616, -0.4040289, 1.921935, 0, 0, 0, 1, 1,
1.339225, 1.149786, 1.257611, 1, 1, 1, 1, 1,
1.341417, 0.5727969, 1.015336, 1, 1, 1, 1, 1,
1.342428, 1.296925, 0.1622291, 1, 1, 1, 1, 1,
1.348288, 1.656765, -0.8584207, 1, 1, 1, 1, 1,
1.365865, 1.127565, -0.2946804, 1, 1, 1, 1, 1,
1.373311, -1.586911, 2.596996, 1, 1, 1, 1, 1,
1.380007, 0.3525623, 2.252363, 1, 1, 1, 1, 1,
1.383358, 0.8747564, 0.8442044, 1, 1, 1, 1, 1,
1.385767, 0.7086683, 1.16399, 1, 1, 1, 1, 1,
1.387455, -0.3146513, 2.625185, 1, 1, 1, 1, 1,
1.388248, -1.356625, 1.629517, 1, 1, 1, 1, 1,
1.38963, -0.2813227, 2.450572, 1, 1, 1, 1, 1,
1.393325, 0.1620805, 1.300227, 1, 1, 1, 1, 1,
1.393443, -1.351529, 1.995602, 1, 1, 1, 1, 1,
1.403919, -1.812681, 3.966106, 1, 1, 1, 1, 1,
1.413814, -2.057157, 1.987925, 0, 0, 1, 1, 1,
1.415048, -0.3371553, 1.331949, 1, 0, 0, 1, 1,
1.416767, -0.2995347, 4.053076, 1, 0, 0, 1, 1,
1.439257, 0.9068447, 0.7226778, 1, 0, 0, 1, 1,
1.442746, 0.4316294, 0.3988688, 1, 0, 0, 1, 1,
1.468852, -0.3009877, 2.306208, 1, 0, 0, 1, 1,
1.472052, 0.623562, 1.028054, 0, 0, 0, 1, 1,
1.47787, 1.120833, 2.212569, 0, 0, 0, 1, 1,
1.483135, 0.3795336, 2.980437, 0, 0, 0, 1, 1,
1.483414, -0.4018432, 0.7617522, 0, 0, 0, 1, 1,
1.489233, 0.6845831, 2.519124, 0, 0, 0, 1, 1,
1.499099, 0.2152412, 2.130913, 0, 0, 0, 1, 1,
1.499725, 0.1482482, 1.31449, 0, 0, 0, 1, 1,
1.500851, -0.02902711, 2.412739, 1, 1, 1, 1, 1,
1.514291, -0.2252335, 1.868451, 1, 1, 1, 1, 1,
1.519623, 1.235313, 0.8941786, 1, 1, 1, 1, 1,
1.533096, 2.36717, -0.02407674, 1, 1, 1, 1, 1,
1.540927, 1.720259, 2.027222, 1, 1, 1, 1, 1,
1.547235, -0.01465802, 1.927623, 1, 1, 1, 1, 1,
1.552347, 0.3944398, 0.185665, 1, 1, 1, 1, 1,
1.571292, -0.6862091, 1.294909, 1, 1, 1, 1, 1,
1.578559, -0.9897794, 2.093714, 1, 1, 1, 1, 1,
1.606182, -0.1780066, 1.379972, 1, 1, 1, 1, 1,
1.613893, 0.7512008, 0.6124599, 1, 1, 1, 1, 1,
1.627774, 0.4598614, -1.201519, 1, 1, 1, 1, 1,
1.629263, -1.648369, 2.037073, 1, 1, 1, 1, 1,
1.643382, 0.742477, 1.052007, 1, 1, 1, 1, 1,
1.65003, -0.4680439, 3.136248, 1, 1, 1, 1, 1,
1.65525, 0.5466261, 1.248249, 0, 0, 1, 1, 1,
1.660129, -0.4966678, 1.407918, 1, 0, 0, 1, 1,
1.667255, -1.455155, 1.985899, 1, 0, 0, 1, 1,
1.69887, 0.8586968, 0.6829675, 1, 0, 0, 1, 1,
1.700745, -1.057838, 1.843214, 1, 0, 0, 1, 1,
1.713262, 1.351244, 2.186991, 1, 0, 0, 1, 1,
1.755532, 0.3221959, -0.3686675, 0, 0, 0, 1, 1,
1.779813, 1.537097, 3.188514, 0, 0, 0, 1, 1,
1.779979, -0.9597244, 2.235304, 0, 0, 0, 1, 1,
1.780981, 0.3405778, 1.210894, 0, 0, 0, 1, 1,
1.782338, 1.191936, 1.774533, 0, 0, 0, 1, 1,
1.78652, 1.002852, 1.456998, 0, 0, 0, 1, 1,
1.789507, -1.595354, 0.5763443, 0, 0, 0, 1, 1,
1.79208, -0.3258215, 0.8511805, 1, 1, 1, 1, 1,
1.796981, -0.8464746, 2.982154, 1, 1, 1, 1, 1,
1.836041, 1.339643, 0.2209684, 1, 1, 1, 1, 1,
1.849758, 1.611267, 0.1469982, 1, 1, 1, 1, 1,
1.881709, -1.356307, 1.071547, 1, 1, 1, 1, 1,
1.888477, -0.4059332, 3.790823, 1, 1, 1, 1, 1,
1.893607, -1.329201, 2.297179, 1, 1, 1, 1, 1,
1.906401, -0.8681372, 2.417634, 1, 1, 1, 1, 1,
2.02686, -0.1623105, 2.197639, 1, 1, 1, 1, 1,
2.039748, 0.7132777, 2.613085, 1, 1, 1, 1, 1,
2.060997, -1.713477, 2.445994, 1, 1, 1, 1, 1,
2.073158, 1.531834, -0.5718194, 1, 1, 1, 1, 1,
2.106695, 0.1829375, 3.036652, 1, 1, 1, 1, 1,
2.111541, -0.7964332, 2.665617, 1, 1, 1, 1, 1,
2.116935, -0.4399419, 0.4173118, 1, 1, 1, 1, 1,
2.124158, 1.590889, 0.03999297, 0, 0, 1, 1, 1,
2.138964, 1.546278, 1.592879, 1, 0, 0, 1, 1,
2.143375, -0.2003421, 1.21322, 1, 0, 0, 1, 1,
2.144009, 1.246494, -0.7144669, 1, 0, 0, 1, 1,
2.148587, 0.4954499, 1.339738, 1, 0, 0, 1, 1,
2.157198, -0.6411413, 1.300407, 1, 0, 0, 1, 1,
2.201273, 0.324254, 1.022085, 0, 0, 0, 1, 1,
2.225124, -0.1641922, 2.228234, 0, 0, 0, 1, 1,
2.249381, 0.7859249, 0.9282624, 0, 0, 0, 1, 1,
2.251674, -0.2172107, 3.046566, 0, 0, 0, 1, 1,
2.283549, -0.3899114, 0.4732674, 0, 0, 0, 1, 1,
2.352133, 1.48355, 1.31043, 0, 0, 0, 1, 1,
2.389422, -0.1977384, 1.558912, 0, 0, 0, 1, 1,
2.46269, -0.1461298, 2.033228, 1, 1, 1, 1, 1,
2.486989, -0.2631169, 0.6343666, 1, 1, 1, 1, 1,
2.503363, 0.1824068, 1.631428, 1, 1, 1, 1, 1,
2.523252, -0.744884, 1.47975, 1, 1, 1, 1, 1,
2.677779, 0.5480989, 0.0940357, 1, 1, 1, 1, 1,
2.753035, -0.2776532, 2.614364, 1, 1, 1, 1, 1,
3.268134, -1.009012, 1.641883, 1, 1, 1, 1, 1
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
var radius = 9.441338;
var distance = 33.1623;
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
mvMatrix.translate( -0.2056059, -0.07692313, -0.3931806 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1623);
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
