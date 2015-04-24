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
-3.744725, 2.076805, -1.70302, 1, 0, 0, 1,
-3.011346, 0.007861707, -1.53547, 1, 0.007843138, 0, 1,
-2.952033, -1.089155, -3.458757, 1, 0.01176471, 0, 1,
-2.77558, -0.4607894, -3.214881, 1, 0.01960784, 0, 1,
-2.76403, -0.1033883, -1.059075, 1, 0.02352941, 0, 1,
-2.707388, -1.538907, -1.783957, 1, 0.03137255, 0, 1,
-2.602681, -0.5729514, -3.793439, 1, 0.03529412, 0, 1,
-2.599411, 0.4581393, 0.2742574, 1, 0.04313726, 0, 1,
-2.508719, 0.7231627, -2.535968, 1, 0.04705882, 0, 1,
-2.391438, 1.027379, -0.7575509, 1, 0.05490196, 0, 1,
-2.364457, 0.04039404, -1.65984, 1, 0.05882353, 0, 1,
-2.33239, 0.05951787, -2.241087, 1, 0.06666667, 0, 1,
-2.296892, 1.556632, -1.195561, 1, 0.07058824, 0, 1,
-2.246657, -1.132549, -2.791788, 1, 0.07843138, 0, 1,
-2.215999, 1.609578, -2.612163, 1, 0.08235294, 0, 1,
-2.20831, 0.4034067, -1.716119, 1, 0.09019608, 0, 1,
-2.201594, -1.280118, -0.9727032, 1, 0.09411765, 0, 1,
-2.098666, -1.323147, -2.400264, 1, 0.1019608, 0, 1,
-2.085706, -0.2256477, -1.646958, 1, 0.1098039, 0, 1,
-2.05525, -0.9596749, -1.930468, 1, 0.1137255, 0, 1,
-2.047805, 0.4713325, -0.4467086, 1, 0.1215686, 0, 1,
-2.022132, 0.04720744, -1.396317, 1, 0.1254902, 0, 1,
-2.020649, -0.9938653, -2.391789, 1, 0.1333333, 0, 1,
-2.014937, -1.192634, -1.29304, 1, 0.1372549, 0, 1,
-2.013201, 0.2752866, -2.299951, 1, 0.145098, 0, 1,
-1.996077, -1.133872, -3.257367, 1, 0.1490196, 0, 1,
-1.989983, 0.9943782, -2.595529, 1, 0.1568628, 0, 1,
-1.971862, -0.1796455, -0.2083023, 1, 0.1607843, 0, 1,
-1.970109, -0.1023956, -1.784958, 1, 0.1686275, 0, 1,
-1.964293, -0.09906104, -0.01890593, 1, 0.172549, 0, 1,
-1.961041, 0.1625909, -1.898177, 1, 0.1803922, 0, 1,
-1.949968, 0.6142035, -1.344252, 1, 0.1843137, 0, 1,
-1.940143, -0.5380659, -2.929405, 1, 0.1921569, 0, 1,
-1.928717, 1.920863, -0.4187135, 1, 0.1960784, 0, 1,
-1.917645, 1.36297, 0.4427738, 1, 0.2039216, 0, 1,
-1.912062, 0.2086715, 0.6021205, 1, 0.2117647, 0, 1,
-1.896047, -1.00446, -1.111427, 1, 0.2156863, 0, 1,
-1.892726, 0.2301834, -2.374533, 1, 0.2235294, 0, 1,
-1.883938, 0.8413711, -0.3470283, 1, 0.227451, 0, 1,
-1.882791, 2.283191, -0.6834522, 1, 0.2352941, 0, 1,
-1.881252, 0.9179873, -1.800746, 1, 0.2392157, 0, 1,
-1.864993, -0.3527633, -0.4302978, 1, 0.2470588, 0, 1,
-1.843448, 0.08357894, -0.7457467, 1, 0.2509804, 0, 1,
-1.825786, 2.569616, -2.816834, 1, 0.2588235, 0, 1,
-1.811625, 0.09469277, -2.265682, 1, 0.2627451, 0, 1,
-1.782491, -0.0476561, -1.607885, 1, 0.2705882, 0, 1,
-1.774368, -0.2781798, -1.042425, 1, 0.2745098, 0, 1,
-1.762971, 1.466438, -1.676714, 1, 0.282353, 0, 1,
-1.761425, 0.164822, -2.010261, 1, 0.2862745, 0, 1,
-1.75002, 0.2213262, -1.767722, 1, 0.2941177, 0, 1,
-1.747215, 1.777899, -1.804641, 1, 0.3019608, 0, 1,
-1.736964, 0.03752207, -3.151719, 1, 0.3058824, 0, 1,
-1.720041, 0.7623848, -2.061079, 1, 0.3137255, 0, 1,
-1.697342, 0.8298818, -0.2503135, 1, 0.3176471, 0, 1,
-1.684824, -0.9863694, -1.39209, 1, 0.3254902, 0, 1,
-1.684244, -1.566565, -1.677971, 1, 0.3294118, 0, 1,
-1.679857, -0.2962837, -1.304894, 1, 0.3372549, 0, 1,
-1.666115, 0.5879772, -0.02060874, 1, 0.3411765, 0, 1,
-1.638448, 0.6219338, -1.285837, 1, 0.3490196, 0, 1,
-1.608148, -0.02878661, -1.331971, 1, 0.3529412, 0, 1,
-1.604311, 0.6513286, -1.815391, 1, 0.3607843, 0, 1,
-1.588992, 1.409454, -0.05479493, 1, 0.3647059, 0, 1,
-1.588929, 0.750477, -0.3093565, 1, 0.372549, 0, 1,
-1.563631, -0.535324, -1.689293, 1, 0.3764706, 0, 1,
-1.563607, -0.2194664, -2.147394, 1, 0.3843137, 0, 1,
-1.562713, 1.580123, -3.156697, 1, 0.3882353, 0, 1,
-1.549677, -0.8965183, -1.855359, 1, 0.3960784, 0, 1,
-1.542629, -0.8711594, -1.331171, 1, 0.4039216, 0, 1,
-1.542014, 0.5294142, -0.8621523, 1, 0.4078431, 0, 1,
-1.530285, -0.6023711, -1.630282, 1, 0.4156863, 0, 1,
-1.526297, -1.371209, -0.1655837, 1, 0.4196078, 0, 1,
-1.521907, 0.02982499, -2.309057, 1, 0.427451, 0, 1,
-1.51331, 0.3980822, -2.244922, 1, 0.4313726, 0, 1,
-1.513225, 0.6465434, -1.658333, 1, 0.4392157, 0, 1,
-1.507994, -0.2773319, -2.478268, 1, 0.4431373, 0, 1,
-1.492179, 0.07118087, -1.292827, 1, 0.4509804, 0, 1,
-1.470331, -2.203166, -3.971084, 1, 0.454902, 0, 1,
-1.449834, -0.3711186, -1.891173, 1, 0.4627451, 0, 1,
-1.440272, 3.09464, 0.7635475, 1, 0.4666667, 0, 1,
-1.420816, 0.3556837, -1.964416, 1, 0.4745098, 0, 1,
-1.420149, -0.5163699, -1.506054, 1, 0.4784314, 0, 1,
-1.413342, 0.5752617, 1.026435, 1, 0.4862745, 0, 1,
-1.410985, 1.532247, -1.079025, 1, 0.4901961, 0, 1,
-1.410946, 0.3888318, -3.36548, 1, 0.4980392, 0, 1,
-1.400852, 2.471517, -1.321558, 1, 0.5058824, 0, 1,
-1.391253, -1.032748, -3.25738, 1, 0.509804, 0, 1,
-1.387839, -0.8974515, -3.23488, 1, 0.5176471, 0, 1,
-1.387348, 0.620606, -0.6174887, 1, 0.5215687, 0, 1,
-1.384, 0.5804703, -0.875973, 1, 0.5294118, 0, 1,
-1.368397, 1.494061, 0.8791497, 1, 0.5333334, 0, 1,
-1.365575, -0.07781059, -1.675453, 1, 0.5411765, 0, 1,
-1.352313, -0.8517245, -2.405036, 1, 0.5450981, 0, 1,
-1.351355, -0.4992056, -3.194405, 1, 0.5529412, 0, 1,
-1.345174, -0.5107397, -1.648075, 1, 0.5568628, 0, 1,
-1.344831, 0.5312956, -0.3666471, 1, 0.5647059, 0, 1,
-1.336115, 0.5844979, -2.125627, 1, 0.5686275, 0, 1,
-1.3328, 0.08940899, -1.182549, 1, 0.5764706, 0, 1,
-1.32651, -0.2882387, -0.7967993, 1, 0.5803922, 0, 1,
-1.323303, -0.6014925, -2.899235, 1, 0.5882353, 0, 1,
-1.320364, -1.1335, -2.031534, 1, 0.5921569, 0, 1,
-1.295433, -0.8166125, -1.657713, 1, 0.6, 0, 1,
-1.291803, -0.4739641, -1.503177, 1, 0.6078432, 0, 1,
-1.287242, 1.28331, -0.5889944, 1, 0.6117647, 0, 1,
-1.282564, 0.7451941, -2.046029, 1, 0.6196079, 0, 1,
-1.279055, -0.2647272, -3.166758, 1, 0.6235294, 0, 1,
-1.25864, 0.3996452, -0.6644185, 1, 0.6313726, 0, 1,
-1.242058, 0.4448229, -2.844215, 1, 0.6352941, 0, 1,
-1.239824, 2.092588, 1.852667, 1, 0.6431373, 0, 1,
-1.230528, -0.7886205, -3.446913, 1, 0.6470588, 0, 1,
-1.226162, -1.117163, -1.559043, 1, 0.654902, 0, 1,
-1.225405, 0.5091795, -0.8235312, 1, 0.6588235, 0, 1,
-1.213979, 1.7246, -1.043918, 1, 0.6666667, 0, 1,
-1.209835, 1.423244, -1.741257, 1, 0.6705883, 0, 1,
-1.205944, -1.360729, -3.211861, 1, 0.6784314, 0, 1,
-1.198625, -1.667118, -4.39224, 1, 0.682353, 0, 1,
-1.193846, 0.9737741, -1.005858, 1, 0.6901961, 0, 1,
-1.168749, -0.03585342, -2.125596, 1, 0.6941177, 0, 1,
-1.165478, -0.388082, -1.159449, 1, 0.7019608, 0, 1,
-1.155147, -0.1240268, -0.2238609, 1, 0.7098039, 0, 1,
-1.153613, 0.04813938, -1.560405, 1, 0.7137255, 0, 1,
-1.151859, -1.557548, -0.3590084, 1, 0.7215686, 0, 1,
-1.151687, -0.4092495, -3.542433, 1, 0.7254902, 0, 1,
-1.147346, -1.159263, -0.9097616, 1, 0.7333333, 0, 1,
-1.145417, 0.4081397, -1.724339, 1, 0.7372549, 0, 1,
-1.139153, 1.992143, -1.189374, 1, 0.7450981, 0, 1,
-1.136904, 0.609454, -1.07411, 1, 0.7490196, 0, 1,
-1.132716, 0.2720486, -2.913245, 1, 0.7568628, 0, 1,
-1.132127, -1.220736, -0.581682, 1, 0.7607843, 0, 1,
-1.130334, -1.225106, -2.330643, 1, 0.7686275, 0, 1,
-1.130132, -0.2808741, -0.5640983, 1, 0.772549, 0, 1,
-1.127993, -0.5463188, -2.743444, 1, 0.7803922, 0, 1,
-1.125317, -0.4666782, -1.717657, 1, 0.7843137, 0, 1,
-1.124719, 0.2354998, 0.9790293, 1, 0.7921569, 0, 1,
-1.124099, 1.400855, 0.5477102, 1, 0.7960784, 0, 1,
-1.119502, 0.4547882, -2.632435, 1, 0.8039216, 0, 1,
-1.107096, -0.2882497, -1.340261, 1, 0.8117647, 0, 1,
-1.104511, 1.040275, -0.3585499, 1, 0.8156863, 0, 1,
-1.103836, 0.933253, -1.627585, 1, 0.8235294, 0, 1,
-1.094425, -1.53034, -1.993599, 1, 0.827451, 0, 1,
-1.093272, 0.8122517, -0.929746, 1, 0.8352941, 0, 1,
-1.08185, -0.6731332, -2.83398, 1, 0.8392157, 0, 1,
-1.076056, -0.3853029, -0.5654594, 1, 0.8470588, 0, 1,
-1.072045, 1.069802, -0.58184, 1, 0.8509804, 0, 1,
-1.060449, -0.5441794, -1.284818, 1, 0.8588235, 0, 1,
-1.060074, 1.233157, 0.3853692, 1, 0.8627451, 0, 1,
-1.047957, 1.022638, -1.19056, 1, 0.8705882, 0, 1,
-1.046014, -0.2165843, -3.038915, 1, 0.8745098, 0, 1,
-1.037856, -2.052387, -2.217991, 1, 0.8823529, 0, 1,
-1.035471, -0.2766216, -3.019643, 1, 0.8862745, 0, 1,
-1.032254, 0.2781116, -2.348206, 1, 0.8941177, 0, 1,
-1.028733, 1.276856, -0.4234115, 1, 0.8980392, 0, 1,
-1.024713, 0.8475654, -0.05984186, 1, 0.9058824, 0, 1,
-1.023213, -0.3133764, -1.227358, 1, 0.9137255, 0, 1,
-1.021416, 0.2957299, -2.386348, 1, 0.9176471, 0, 1,
-1.019314, 0.7858088, 0.1892425, 1, 0.9254902, 0, 1,
-1.015859, -0.5954034, -3.645321, 1, 0.9294118, 0, 1,
-1.011596, -0.8781904, -1.226408, 1, 0.9372549, 0, 1,
-1.011007, -0.3198366, -0.9086049, 1, 0.9411765, 0, 1,
-1.008737, 0.7126344, -0.4825003, 1, 0.9490196, 0, 1,
-1.000551, -0.5702883, -1.065339, 1, 0.9529412, 0, 1,
-0.9966174, 1.283651, -0.8851503, 1, 0.9607843, 0, 1,
-0.9873009, 0.4407875, -2.098694, 1, 0.9647059, 0, 1,
-0.9842951, 0.3337311, -0.6620474, 1, 0.972549, 0, 1,
-0.9798161, -0.1499677, -0.8075823, 1, 0.9764706, 0, 1,
-0.9763818, 0.5160525, -1.057452, 1, 0.9843137, 0, 1,
-0.9752023, -0.7939239, -2.108182, 1, 0.9882353, 0, 1,
-0.9691101, 0.0008358293, -3.141078, 1, 0.9960784, 0, 1,
-0.9689825, 0.9664165, 1.414315, 0.9960784, 1, 0, 1,
-0.9662166, -0.4990589, -1.848453, 0.9921569, 1, 0, 1,
-0.9649248, 0.7848184, -2.373572, 0.9843137, 1, 0, 1,
-0.9627591, 0.148318, -1.568236, 0.9803922, 1, 0, 1,
-0.9514891, -0.09857065, -1.431216, 0.972549, 1, 0, 1,
-0.9449392, -0.7324601, -2.579983, 0.9686275, 1, 0, 1,
-0.941433, 0.7901333, -0.003527078, 0.9607843, 1, 0, 1,
-0.9328063, 0.2722933, -1.064128, 0.9568627, 1, 0, 1,
-0.929892, 1.621481, -0.8874904, 0.9490196, 1, 0, 1,
-0.9273192, -1.132168, -0.09838845, 0.945098, 1, 0, 1,
-0.9258685, 0.3135633, -1.033905, 0.9372549, 1, 0, 1,
-0.9255049, -0.06642916, -1.261231, 0.9333333, 1, 0, 1,
-0.9196814, 0.558894, -0.3132829, 0.9254902, 1, 0, 1,
-0.913466, -0.9551175, -1.85191, 0.9215686, 1, 0, 1,
-0.9094163, 0.9848864, -1.075863, 0.9137255, 1, 0, 1,
-0.9029035, -0.2572951, -2.149082, 0.9098039, 1, 0, 1,
-0.9010996, -0.5846473, -1.897919, 0.9019608, 1, 0, 1,
-0.9009591, 0.4581496, -0.4858396, 0.8941177, 1, 0, 1,
-0.8934973, -1.010391, 0.3164088, 0.8901961, 1, 0, 1,
-0.8931077, -0.01574181, -1.551262, 0.8823529, 1, 0, 1,
-0.892386, 0.187053, -1.756629, 0.8784314, 1, 0, 1,
-0.892378, 1.939263, 0.6566137, 0.8705882, 1, 0, 1,
-0.8838158, -0.1717497, 0.01773802, 0.8666667, 1, 0, 1,
-0.8743927, -0.8956004, -3.783553, 0.8588235, 1, 0, 1,
-0.8662251, -0.1828677, -3.362929, 0.854902, 1, 0, 1,
-0.8645694, -0.01857704, -1.239932, 0.8470588, 1, 0, 1,
-0.863435, -1.409337, -2.598595, 0.8431373, 1, 0, 1,
-0.8579946, -0.4507445, -1.158357, 0.8352941, 1, 0, 1,
-0.8526869, -0.2229015, -2.733266, 0.8313726, 1, 0, 1,
-0.8476533, -0.189233, -2.278657, 0.8235294, 1, 0, 1,
-0.8463568, 0.8993855, -1.389668, 0.8196079, 1, 0, 1,
-0.8446807, 0.4980846, 0.07317892, 0.8117647, 1, 0, 1,
-0.8409972, -0.3779543, -1.184818, 0.8078431, 1, 0, 1,
-0.8390046, -1.350567, -0.6160707, 0.8, 1, 0, 1,
-0.83572, -0.2999364, 0.1322544, 0.7921569, 1, 0, 1,
-0.8341635, 0.08281036, -2.581192, 0.7882353, 1, 0, 1,
-0.8241624, 0.8441956, 0.06354373, 0.7803922, 1, 0, 1,
-0.8230425, 0.2068412, -1.534337, 0.7764706, 1, 0, 1,
-0.819041, 0.6829647, -0.8227593, 0.7686275, 1, 0, 1,
-0.8188248, 0.3159248, -0.9043081, 0.7647059, 1, 0, 1,
-0.8155581, -1.699109, -3.316984, 0.7568628, 1, 0, 1,
-0.8122134, -0.4037493, -2.480951, 0.7529412, 1, 0, 1,
-0.8037376, 0.5630791, -2.699479, 0.7450981, 1, 0, 1,
-0.8033983, 0.3882464, -1.102292, 0.7411765, 1, 0, 1,
-0.8022615, -1.020778, -1.668947, 0.7333333, 1, 0, 1,
-0.7955055, -0.885662, -3.628144, 0.7294118, 1, 0, 1,
-0.7917007, -0.820429, 0.195466, 0.7215686, 1, 0, 1,
-0.7896648, -1.608888, -2.457666, 0.7176471, 1, 0, 1,
-0.7860017, 1.309374, -0.899726, 0.7098039, 1, 0, 1,
-0.7787094, 0.3172222, -0.9266558, 0.7058824, 1, 0, 1,
-0.7759235, -1.251131, -3.278292, 0.6980392, 1, 0, 1,
-0.7722697, -1.443592, -0.5856624, 0.6901961, 1, 0, 1,
-0.7692016, -1.554139, -2.010237, 0.6862745, 1, 0, 1,
-0.7659888, 1.156079, 0.3578716, 0.6784314, 1, 0, 1,
-0.7653704, 0.9276078, 1.348487, 0.6745098, 1, 0, 1,
-0.7636557, 0.3063004, -1.136406, 0.6666667, 1, 0, 1,
-0.7606427, 1.545308, -0.03461467, 0.6627451, 1, 0, 1,
-0.7598699, -0.116315, -0.6183221, 0.654902, 1, 0, 1,
-0.7574295, 1.714908, -1.558652, 0.6509804, 1, 0, 1,
-0.7555958, 0.5596803, -0.08960892, 0.6431373, 1, 0, 1,
-0.7554602, -1.117646, -2.51487, 0.6392157, 1, 0, 1,
-0.7548077, 0.453443, -2.729801, 0.6313726, 1, 0, 1,
-0.7508109, 0.1007454, -3.313909, 0.627451, 1, 0, 1,
-0.7504579, -0.9047406, -2.432156, 0.6196079, 1, 0, 1,
-0.7504483, 1.356372, 0.900471, 0.6156863, 1, 0, 1,
-0.7455638, -0.2839382, -2.021912, 0.6078432, 1, 0, 1,
-0.7387262, 0.1852079, -0.7103549, 0.6039216, 1, 0, 1,
-0.7334408, 0.8450357, -2.786377, 0.5960785, 1, 0, 1,
-0.7331493, -0.8757258, -2.181899, 0.5882353, 1, 0, 1,
-0.7306418, -0.4305744, -1.237048, 0.5843138, 1, 0, 1,
-0.7285663, 0.5072633, -1.482512, 0.5764706, 1, 0, 1,
-0.720451, 0.8590481, -1.341332, 0.572549, 1, 0, 1,
-0.7099227, -1.058729, -2.552893, 0.5647059, 1, 0, 1,
-0.7064125, 1.233904, -1.695849, 0.5607843, 1, 0, 1,
-0.7029527, -0.06274303, -1.574437, 0.5529412, 1, 0, 1,
-0.6981862, -0.7876633, -1.273838, 0.5490196, 1, 0, 1,
-0.6975403, 1.089506, 1.177735, 0.5411765, 1, 0, 1,
-0.6939404, -2.149146, -4.539209, 0.5372549, 1, 0, 1,
-0.6919314, -0.4071775, -2.773936, 0.5294118, 1, 0, 1,
-0.6904014, 0.6008916, 0.2639968, 0.5254902, 1, 0, 1,
-0.6900997, 0.4854071, -1.481623, 0.5176471, 1, 0, 1,
-0.6865626, 1.125167, -0.6440511, 0.5137255, 1, 0, 1,
-0.6846094, -0.2850008, -2.473434, 0.5058824, 1, 0, 1,
-0.6841874, -0.5422994, -1.814571, 0.5019608, 1, 0, 1,
-0.6719036, 0.3366126, -0.1257704, 0.4941176, 1, 0, 1,
-0.6703839, -1.547464, -2.879704, 0.4862745, 1, 0, 1,
-0.6697921, -1.386593, -2.863916, 0.4823529, 1, 0, 1,
-0.6615051, -0.5676461, -3.062798, 0.4745098, 1, 0, 1,
-0.6605376, -0.1312151, -1.018045, 0.4705882, 1, 0, 1,
-0.6604317, 0.01668752, -1.066919, 0.4627451, 1, 0, 1,
-0.6587421, -0.3822088, -1.821666, 0.4588235, 1, 0, 1,
-0.6566513, -2.301906, -4.057448, 0.4509804, 1, 0, 1,
-0.6544173, -0.7686495, -3.708977, 0.4470588, 1, 0, 1,
-0.6521443, 0.07547057, -0.6876028, 0.4392157, 1, 0, 1,
-0.6507536, -1.686329, -3.358608, 0.4352941, 1, 0, 1,
-0.6506813, 0.7264196, -1.07314, 0.427451, 1, 0, 1,
-0.6445333, 0.1235765, 0.2455853, 0.4235294, 1, 0, 1,
-0.6427633, -0.4919574, -2.072282, 0.4156863, 1, 0, 1,
-0.641276, 1.931061, -1.158203, 0.4117647, 1, 0, 1,
-0.6403694, 1.334981, -1.188366, 0.4039216, 1, 0, 1,
-0.6390294, -1.552379, -2.116975, 0.3960784, 1, 0, 1,
-0.6381475, 0.8839454, -1.070005, 0.3921569, 1, 0, 1,
-0.632268, -0.7650531, -1.773778, 0.3843137, 1, 0, 1,
-0.6264985, -1.021164, -2.504075, 0.3803922, 1, 0, 1,
-0.6243663, 1.121508, -1.346196, 0.372549, 1, 0, 1,
-0.6225522, 0.1014173, -1.739159, 0.3686275, 1, 0, 1,
-0.6146371, -0.2855157, -1.493503, 0.3607843, 1, 0, 1,
-0.6092698, -0.5154743, -1.15212, 0.3568628, 1, 0, 1,
-0.6085573, 1.41308, -0.2297918, 0.3490196, 1, 0, 1,
-0.604059, -0.3329624, -1.681247, 0.345098, 1, 0, 1,
-0.6016899, 1.001964, 0.6191906, 0.3372549, 1, 0, 1,
-0.5952905, 1.64332, 0.5033416, 0.3333333, 1, 0, 1,
-0.5943524, 0.08254935, -0.2421209, 0.3254902, 1, 0, 1,
-0.5845658, 1.672663, 2.275908, 0.3215686, 1, 0, 1,
-0.5827224, -1.251209, -4.33105, 0.3137255, 1, 0, 1,
-0.5744193, -0.5876295, -2.747558, 0.3098039, 1, 0, 1,
-0.5737272, 0.7863286, -0.559054, 0.3019608, 1, 0, 1,
-0.5723376, -1.397921, -2.293287, 0.2941177, 1, 0, 1,
-0.5709118, 3.018822, 0.2927296, 0.2901961, 1, 0, 1,
-0.5692311, 0.1900933, -2.9654, 0.282353, 1, 0, 1,
-0.5675552, -0.538619, -5.066058, 0.2784314, 1, 0, 1,
-0.5669439, 0.751943, -0.1523875, 0.2705882, 1, 0, 1,
-0.5644196, 0.1318177, -1.655886, 0.2666667, 1, 0, 1,
-0.5589997, -0.5114203, -2.404049, 0.2588235, 1, 0, 1,
-0.5583144, 1.636355, 0.01868059, 0.254902, 1, 0, 1,
-0.5545471, -0.05807208, -1.112641, 0.2470588, 1, 0, 1,
-0.5488697, -1.270613, -1.647324, 0.2431373, 1, 0, 1,
-0.5468308, -0.5327502, -1.423586, 0.2352941, 1, 0, 1,
-0.5464165, -1.183416, -2.783427, 0.2313726, 1, 0, 1,
-0.540687, -0.239006, -1.964266, 0.2235294, 1, 0, 1,
-0.5371942, 0.06925445, -1.568151, 0.2196078, 1, 0, 1,
-0.53707, 0.2811454, -1.479128, 0.2117647, 1, 0, 1,
-0.5360547, -1.429513, -1.286124, 0.2078431, 1, 0, 1,
-0.5347375, -0.2173658, -2.316767, 0.2, 1, 0, 1,
-0.5311314, 0.1571471, -2.161343, 0.1921569, 1, 0, 1,
-0.5301768, 0.4182829, -0.5986533, 0.1882353, 1, 0, 1,
-0.5301347, 0.176058, -2.798016, 0.1803922, 1, 0, 1,
-0.5268969, 0.6020671, -0.3577566, 0.1764706, 1, 0, 1,
-0.5253546, -0.1276528, -3.112177, 0.1686275, 1, 0, 1,
-0.525108, 0.1058135, -2.433776, 0.1647059, 1, 0, 1,
-0.5239305, -0.4834348, -2.213262, 0.1568628, 1, 0, 1,
-0.5219954, 0.3602024, -0.3863131, 0.1529412, 1, 0, 1,
-0.5184235, 1.304848, -0.8849251, 0.145098, 1, 0, 1,
-0.5172755, 1.61287, -0.1398768, 0.1411765, 1, 0, 1,
-0.5158029, -1.552981, -1.204989, 0.1333333, 1, 0, 1,
-0.5127717, -0.1220148, -1.49283, 0.1294118, 1, 0, 1,
-0.5123059, -0.1357099, -2.292271, 0.1215686, 1, 0, 1,
-0.5108358, -0.5215573, -2.26745, 0.1176471, 1, 0, 1,
-0.5105005, -0.1007177, -1.372647, 0.1098039, 1, 0, 1,
-0.5091056, -1.196352, -1.469219, 0.1058824, 1, 0, 1,
-0.507239, 0.1553646, -0.6955351, 0.09803922, 1, 0, 1,
-0.5063412, -0.4298076, -3.624067, 0.09019608, 1, 0, 1,
-0.5057024, -0.09217259, -2.929543, 0.08627451, 1, 0, 1,
-0.4976259, 0.3785354, -0.1565107, 0.07843138, 1, 0, 1,
-0.4967414, -0.0175117, -1.929305, 0.07450981, 1, 0, 1,
-0.4960456, 1.227659, 0.2267347, 0.06666667, 1, 0, 1,
-0.4933228, 2.129081, -0.3265291, 0.0627451, 1, 0, 1,
-0.4890364, -1.991975, -2.279684, 0.05490196, 1, 0, 1,
-0.4850697, -2.074729, -2.701114, 0.05098039, 1, 0, 1,
-0.4773013, -0.3092884, -0.9660042, 0.04313726, 1, 0, 1,
-0.4759168, 0.06647006, 0.4270775, 0.03921569, 1, 0, 1,
-0.4745285, 0.05034007, -2.506646, 0.03137255, 1, 0, 1,
-0.4745066, 0.9096419, -1.547253, 0.02745098, 1, 0, 1,
-0.4675424, 0.3844606, 0.4972325, 0.01960784, 1, 0, 1,
-0.4666239, 1.272812, -1.19421, 0.01568628, 1, 0, 1,
-0.4655985, -0.9078032, -3.546078, 0.007843138, 1, 0, 1,
-0.4636271, -0.6253716, -2.602854, 0.003921569, 1, 0, 1,
-0.4613878, 0.4296561, -0.3903424, 0, 1, 0.003921569, 1,
-0.4586979, 1.39165, 0.8317616, 0, 1, 0.01176471, 1,
-0.458457, 0.3622687, -0.2707973, 0, 1, 0.01568628, 1,
-0.4571144, 0.1784749, -2.101809, 0, 1, 0.02352941, 1,
-0.4558752, -0.9946703, -2.273983, 0, 1, 0.02745098, 1,
-0.4556842, -1.092716, -2.804651, 0, 1, 0.03529412, 1,
-0.4527382, 0.1193816, -2.856559, 0, 1, 0.03921569, 1,
-0.4516492, 0.2454213, -0.715105, 0, 1, 0.04705882, 1,
-0.4487045, -0.8760442, -0.277436, 0, 1, 0.05098039, 1,
-0.4440313, -0.22152, -2.007494, 0, 1, 0.05882353, 1,
-0.4438757, 2.64959, 0.3236398, 0, 1, 0.0627451, 1,
-0.4430948, 0.4867766, 0.961824, 0, 1, 0.07058824, 1,
-0.4423012, -0.3933226, -0.715709, 0, 1, 0.07450981, 1,
-0.4404739, 1.607527, -1.162579, 0, 1, 0.08235294, 1,
-0.4398632, 0.7558183, 0.3397693, 0, 1, 0.08627451, 1,
-0.4382412, -0.2146939, -1.314355, 0, 1, 0.09411765, 1,
-0.4370121, 0.5188432, 0.8605824, 0, 1, 0.1019608, 1,
-0.4365666, 0.4906351, 0.05329788, 0, 1, 0.1058824, 1,
-0.4324076, 1.146171, -0.2627141, 0, 1, 0.1137255, 1,
-0.4293064, 0.1281941, -0.9394688, 0, 1, 0.1176471, 1,
-0.4228733, 0.5092793, 0.9492171, 0, 1, 0.1254902, 1,
-0.4187074, -0.7527535, -0.5719106, 0, 1, 0.1294118, 1,
-0.416973, -0.8732524, -2.838198, 0, 1, 0.1372549, 1,
-0.4149084, 0.403708, 1.049179, 0, 1, 0.1411765, 1,
-0.4145181, 0.5552506, 0.6760926, 0, 1, 0.1490196, 1,
-0.4122186, -0.135902, -0.8769438, 0, 1, 0.1529412, 1,
-0.4113324, 0.9995916, -0.5069771, 0, 1, 0.1607843, 1,
-0.4108835, -0.03336153, -0.98082, 0, 1, 0.1647059, 1,
-0.4090005, 0.04556361, 0.1183826, 0, 1, 0.172549, 1,
-0.4079848, -1.405403, -0.5308382, 0, 1, 0.1764706, 1,
-0.4054315, -1.051554, -1.892223, 0, 1, 0.1843137, 1,
-0.4038571, 1.357396, 1.13289, 0, 1, 0.1882353, 1,
-0.4028581, 0.5528179, -3.130565, 0, 1, 0.1960784, 1,
-0.4006378, -0.2498991, -2.852222, 0, 1, 0.2039216, 1,
-0.3982642, 0.7087723, 0.3943555, 0, 1, 0.2078431, 1,
-0.3977407, -1.745025, -3.031177, 0, 1, 0.2156863, 1,
-0.3956933, -0.5161051, -3.356106, 0, 1, 0.2196078, 1,
-0.3948973, -0.3602263, -1.433887, 0, 1, 0.227451, 1,
-0.3947974, 0.7313429, -0.9005274, 0, 1, 0.2313726, 1,
-0.3897499, -1.566136, -3.991132, 0, 1, 0.2392157, 1,
-0.3847916, 0.407508, -0.928299, 0, 1, 0.2431373, 1,
-0.3831829, -1.099081, -2.752111, 0, 1, 0.2509804, 1,
-0.3810675, 0.1871564, 0.2685097, 0, 1, 0.254902, 1,
-0.3803795, -0.7244569, -1.291845, 0, 1, 0.2627451, 1,
-0.3762838, 0.6707597, -0.5460377, 0, 1, 0.2666667, 1,
-0.3705632, 0.3293603, 2.418377, 0, 1, 0.2745098, 1,
-0.3655465, -0.8970954, -2.674495, 0, 1, 0.2784314, 1,
-0.3654685, 0.09374155, -0.3370053, 0, 1, 0.2862745, 1,
-0.3649645, -0.3799324, -1.188102, 0, 1, 0.2901961, 1,
-0.3595437, 1.394206, -0.270837, 0, 1, 0.2980392, 1,
-0.3580818, -1.007977, -1.783043, 0, 1, 0.3058824, 1,
-0.3546341, -1.214206, -3.241566, 0, 1, 0.3098039, 1,
-0.3542534, 0.892728, 0.02272463, 0, 1, 0.3176471, 1,
-0.3528321, -0.4185871, -2.660414, 0, 1, 0.3215686, 1,
-0.3521918, -1.427384, -2.764788, 0, 1, 0.3294118, 1,
-0.3505613, -0.936264, -0.9145586, 0, 1, 0.3333333, 1,
-0.3501676, 1.588395, -0.3245568, 0, 1, 0.3411765, 1,
-0.3498461, 0.37084, -0.5210586, 0, 1, 0.345098, 1,
-0.3483147, 0.1825352, -1.190908, 0, 1, 0.3529412, 1,
-0.3479672, 1.132305, 0.05343542, 0, 1, 0.3568628, 1,
-0.341725, -0.7920961, -3.684515, 0, 1, 0.3647059, 1,
-0.338784, -0.07445993, -4.176905, 0, 1, 0.3686275, 1,
-0.3382189, -1.739178, -4.959296, 0, 1, 0.3764706, 1,
-0.3352732, -2.574306, -2.035087, 0, 1, 0.3803922, 1,
-0.3340532, -0.3835324, -1.658361, 0, 1, 0.3882353, 1,
-0.329747, 0.1297872, 0.2086001, 0, 1, 0.3921569, 1,
-0.3215669, -0.8401344, -2.381774, 0, 1, 0.4, 1,
-0.3195092, 0.07798696, -1.237028, 0, 1, 0.4078431, 1,
-0.3137237, 0.3532329, -0.7988498, 0, 1, 0.4117647, 1,
-0.3106228, 0.8889096, -0.6113132, 0, 1, 0.4196078, 1,
-0.3053816, -0.5255129, -2.474862, 0, 1, 0.4235294, 1,
-0.3016369, -0.2757532, -1.222625, 0, 1, 0.4313726, 1,
-0.2985353, 0.5104761, 0.6684429, 0, 1, 0.4352941, 1,
-0.294499, 0.9888049, 0.9717177, 0, 1, 0.4431373, 1,
-0.2929015, -1.003871, -2.031323, 0, 1, 0.4470588, 1,
-0.284324, -0.1913863, -2.965067, 0, 1, 0.454902, 1,
-0.2795219, 0.4856435, -0.8977877, 0, 1, 0.4588235, 1,
-0.2781039, 1.210769, 0.1848032, 0, 1, 0.4666667, 1,
-0.2775961, -1.618256, -3.354637, 0, 1, 0.4705882, 1,
-0.2769422, 1.225647, 1.558152, 0, 1, 0.4784314, 1,
-0.276406, -2.175727, -3.560068, 0, 1, 0.4823529, 1,
-0.2762952, -1.754795, -3.761707, 0, 1, 0.4901961, 1,
-0.275301, -0.06697192, -0.8920668, 0, 1, 0.4941176, 1,
-0.2751339, 1.567723, 1.130422, 0, 1, 0.5019608, 1,
-0.2734971, -0.1153024, -2.485182, 0, 1, 0.509804, 1,
-0.2724983, -0.2702245, -2.251712, 0, 1, 0.5137255, 1,
-0.2706999, -0.02652144, 0.3227186, 0, 1, 0.5215687, 1,
-0.2703225, 0.7500225, -0.6994994, 0, 1, 0.5254902, 1,
-0.2665937, 0.7575628, 2.503812, 0, 1, 0.5333334, 1,
-0.2645334, 0.03414911, -2.087874, 0, 1, 0.5372549, 1,
-0.2609647, -1.868031, -2.709231, 0, 1, 0.5450981, 1,
-0.2551338, 2.175929, 0.04115776, 0, 1, 0.5490196, 1,
-0.2546344, 0.4024964, -0.1459258, 0, 1, 0.5568628, 1,
-0.2531734, 1.825847, -1.140735, 0, 1, 0.5607843, 1,
-0.2486576, 1.180606, 0.4302142, 0, 1, 0.5686275, 1,
-0.2436371, 0.4782846, 0.7041168, 0, 1, 0.572549, 1,
-0.2413563, 0.7601055, -0.2434578, 0, 1, 0.5803922, 1,
-0.2397163, 0.6798381, -1.519083, 0, 1, 0.5843138, 1,
-0.2386477, -1.134449, -3.702036, 0, 1, 0.5921569, 1,
-0.2364449, -0.9474869, -2.629138, 0, 1, 0.5960785, 1,
-0.2316124, -0.5319794, -2.33239, 0, 1, 0.6039216, 1,
-0.2276283, 0.2275736, -2.924067, 0, 1, 0.6117647, 1,
-0.2215656, 0.9847693, -3.214678, 0, 1, 0.6156863, 1,
-0.2203638, 0.9225758, 0.724456, 0, 1, 0.6235294, 1,
-0.2185214, -0.6913075, -4.820034, 0, 1, 0.627451, 1,
-0.2177535, 0.04808004, 0.03053253, 0, 1, 0.6352941, 1,
-0.2162561, -1.469481, -2.3265, 0, 1, 0.6392157, 1,
-0.2157298, 0.2182775, -0.7195998, 0, 1, 0.6470588, 1,
-0.2149666, 1.188232, 0.1612135, 0, 1, 0.6509804, 1,
-0.2135268, 1.41448, -0.3481205, 0, 1, 0.6588235, 1,
-0.212109, -1.038871, -3.176529, 0, 1, 0.6627451, 1,
-0.2114126, 0.9165357, 1.384182, 0, 1, 0.6705883, 1,
-0.2106686, -0.6253176, -2.503776, 0, 1, 0.6745098, 1,
-0.2101778, -0.5174881, -2.434548, 0, 1, 0.682353, 1,
-0.2061606, -2.663252, -3.082327, 0, 1, 0.6862745, 1,
-0.203839, 0.9024153, -1.729357, 0, 1, 0.6941177, 1,
-0.1992351, 0.326814, 0.3497065, 0, 1, 0.7019608, 1,
-0.1981759, 2.136897, -2.609486, 0, 1, 0.7058824, 1,
-0.1959891, 1.279682, 0.5487027, 0, 1, 0.7137255, 1,
-0.1939382, 0.8868496, -0.5692576, 0, 1, 0.7176471, 1,
-0.184005, 1.878976, 0.5546188, 0, 1, 0.7254902, 1,
-0.1810494, -0.3880356, -2.811442, 0, 1, 0.7294118, 1,
-0.1792589, 0.9668486, -0.002639896, 0, 1, 0.7372549, 1,
-0.1781668, 0.3162867, -0.9735135, 0, 1, 0.7411765, 1,
-0.1736885, -0.9924325, -2.787102, 0, 1, 0.7490196, 1,
-0.1676187, 2.209678, 0.966385, 0, 1, 0.7529412, 1,
-0.1661424, -1.185308, -2.275627, 0, 1, 0.7607843, 1,
-0.1617645, 0.01544428, -0.5272137, 0, 1, 0.7647059, 1,
-0.161711, -1.437195, -2.636909, 0, 1, 0.772549, 1,
-0.1609491, 0.3715881, -1.580692, 0, 1, 0.7764706, 1,
-0.1582691, 0.9693584, -1.915632, 0, 1, 0.7843137, 1,
-0.1562529, 0.05917434, -2.291168, 0, 1, 0.7882353, 1,
-0.1529876, 2.105489, -0.4694107, 0, 1, 0.7960784, 1,
-0.152626, 1.573934, -0.2450719, 0, 1, 0.8039216, 1,
-0.1406474, 0.9174664, -0.7104574, 0, 1, 0.8078431, 1,
-0.1364618, 1.041947, -0.5944243, 0, 1, 0.8156863, 1,
-0.1300109, -0.5547426, -4.543404, 0, 1, 0.8196079, 1,
-0.1298596, 0.4777085, -1.288569, 0, 1, 0.827451, 1,
-0.1295899, -0.531025, -1.828224, 0, 1, 0.8313726, 1,
-0.127977, 1.518163, 0.9371068, 0, 1, 0.8392157, 1,
-0.127183, -1.079432, -4.24601, 0, 1, 0.8431373, 1,
-0.1267595, -1.566812, -1.000903, 0, 1, 0.8509804, 1,
-0.1254538, 1.26585, -0.2748296, 0, 1, 0.854902, 1,
-0.1246042, -1.289504, -3.961029, 0, 1, 0.8627451, 1,
-0.1226511, -0.6506739, -2.450916, 0, 1, 0.8666667, 1,
-0.1215695, -0.8133618, -2.144162, 0, 1, 0.8745098, 1,
-0.1183447, 0.8319399, 1.1793, 0, 1, 0.8784314, 1,
-0.1179336, 0.4065453, -2.372323, 0, 1, 0.8862745, 1,
-0.1128619, 0.01800755, -2.146138, 0, 1, 0.8901961, 1,
-0.1068273, -0.6432109, -3.060072, 0, 1, 0.8980392, 1,
-0.1061528, -0.1485566, -1.426868, 0, 1, 0.9058824, 1,
-0.1040717, 0.6962242, -1.070958, 0, 1, 0.9098039, 1,
-0.09983071, 1.106017, -1.257735, 0, 1, 0.9176471, 1,
-0.0974833, -0.7122111, -4.044431, 0, 1, 0.9215686, 1,
-0.09377342, 0.7801373, -0.3438503, 0, 1, 0.9294118, 1,
-0.09350356, -0.3473663, -2.671936, 0, 1, 0.9333333, 1,
-0.08662058, 2.833527, -0.4568157, 0, 1, 0.9411765, 1,
-0.08643822, -1.909874, -4.081892, 0, 1, 0.945098, 1,
-0.08248843, 1.202077, -1.136462, 0, 1, 0.9529412, 1,
-0.08225795, -0.3382722, -2.245677, 0, 1, 0.9568627, 1,
-0.08114695, -1.667136, -4.138687, 0, 1, 0.9647059, 1,
-0.08046503, 0.1729523, -1.222823, 0, 1, 0.9686275, 1,
-0.07821289, -1.014165, -1.687545, 0, 1, 0.9764706, 1,
-0.07799514, 0.3520441, 0.8219036, 0, 1, 0.9803922, 1,
-0.07723952, 0.08598023, 0.4937223, 0, 1, 0.9882353, 1,
-0.07617221, 0.2604356, -1.121533, 0, 1, 0.9921569, 1,
-0.07426824, 0.3740432, -0.5808553, 0, 1, 1, 1,
-0.07146184, 2.263906, 0.06213749, 0, 0.9921569, 1, 1,
-0.06988733, -1.379501, -3.305809, 0, 0.9882353, 1, 1,
-0.06899321, -1.842604, -3.681546, 0, 0.9803922, 1, 1,
-0.06651907, -1.410321, -2.020853, 0, 0.9764706, 1, 1,
-0.06398085, 1.171906, -0.4561949, 0, 0.9686275, 1, 1,
-0.05472835, 0.780201, 1.475772, 0, 0.9647059, 1, 1,
-0.04800066, -0.7327265, -2.722696, 0, 0.9568627, 1, 1,
-0.0452466, -1.212642, -1.181796, 0, 0.9529412, 1, 1,
-0.04392917, -0.1104359, -3.806044, 0, 0.945098, 1, 1,
-0.04120028, -0.06887492, -2.21601, 0, 0.9411765, 1, 1,
-0.04099083, 1.327406, -1.431838, 0, 0.9333333, 1, 1,
-0.03921349, -2.289793, -2.84899, 0, 0.9294118, 1, 1,
-0.03805073, -0.9660221, -3.115096, 0, 0.9215686, 1, 1,
-0.03530581, -0.8470157, -4.040452, 0, 0.9176471, 1, 1,
-0.03334254, 0.4042335, -0.3997697, 0, 0.9098039, 1, 1,
-0.02630728, 1.514947, 2.064145, 0, 0.9058824, 1, 1,
-0.02107472, -1.217294, -2.479775, 0, 0.8980392, 1, 1,
-0.01793621, 1.662803, -0.9515976, 0, 0.8901961, 1, 1,
-0.01175217, -0.9187624, -3.110986, 0, 0.8862745, 1, 1,
-0.01139018, -0.02555179, -3.571673, 0, 0.8784314, 1, 1,
-0.01113192, -0.8340508, -4.728541, 0, 0.8745098, 1, 1,
-0.01013877, -1.056393, -3.275319, 0, 0.8666667, 1, 1,
-0.009770566, -0.5485205, -2.396123, 0, 0.8627451, 1, 1,
-0.009425861, 1.065459, 1.769339, 0, 0.854902, 1, 1,
-0.009047928, 0.4842412, 0.7174235, 0, 0.8509804, 1, 1,
-0.008669192, 1.48496, 0.374528, 0, 0.8431373, 1, 1,
-0.008409991, 0.4304525, -0.2083352, 0, 0.8392157, 1, 1,
-0.00479126, 1.511327, 2.060075, 0, 0.8313726, 1, 1,
-0.002215303, 0.6019793, -0.9566696, 0, 0.827451, 1, 1,
0.00206168, -0.3982005, 2.317615, 0, 0.8196079, 1, 1,
0.007723588, 0.4777232, 0.5618288, 0, 0.8156863, 1, 1,
0.009143979, -0.1331223, 3.345239, 0, 0.8078431, 1, 1,
0.01122489, -0.1716125, 3.718393, 0, 0.8039216, 1, 1,
0.01348686, -0.4411412, 1.567494, 0, 0.7960784, 1, 1,
0.01936394, 0.8716261, 2.136498, 0, 0.7882353, 1, 1,
0.02281108, 2.165109, -0.002182798, 0, 0.7843137, 1, 1,
0.02304522, -1.107111, 2.669739, 0, 0.7764706, 1, 1,
0.02468413, -1.312954, 4.61372, 0, 0.772549, 1, 1,
0.02789037, 0.3490139, 0.9408055, 0, 0.7647059, 1, 1,
0.02816716, 0.6412768, 0.4735775, 0, 0.7607843, 1, 1,
0.02905536, -1.696398, 3.760701, 0, 0.7529412, 1, 1,
0.03024145, 0.7202916, 2.17451, 0, 0.7490196, 1, 1,
0.03196051, 1.153672, -0.195482, 0, 0.7411765, 1, 1,
0.04057427, -1.116834, 3.764749, 0, 0.7372549, 1, 1,
0.04328916, -0.3270205, 4.053357, 0, 0.7294118, 1, 1,
0.04524915, 0.6732793, 0.3086365, 0, 0.7254902, 1, 1,
0.04741311, -2.930362, 2.003262, 0, 0.7176471, 1, 1,
0.04798278, -1.182585, 0.5584712, 0, 0.7137255, 1, 1,
0.05306449, -0.461792, 2.239349, 0, 0.7058824, 1, 1,
0.05876337, -0.2656523, 2.701266, 0, 0.6980392, 1, 1,
0.06237246, 0.3337976, 0.3433441, 0, 0.6941177, 1, 1,
0.0628898, 0.6893399, 0.3036406, 0, 0.6862745, 1, 1,
0.06918556, 1.094779, 0.6286692, 0, 0.682353, 1, 1,
0.06924517, 0.3681077, -1.137688, 0, 0.6745098, 1, 1,
0.0694669, -0.02326448, 0.6705284, 0, 0.6705883, 1, 1,
0.07121972, -0.9105783, 2.529111, 0, 0.6627451, 1, 1,
0.07593235, -0.4035237, 4.397226, 0, 0.6588235, 1, 1,
0.07977669, 0.4004993, 0.5913848, 0, 0.6509804, 1, 1,
0.08184806, -0.1455868, 2.727216, 0, 0.6470588, 1, 1,
0.08446602, 0.1895991, -1.022765, 0, 0.6392157, 1, 1,
0.09166756, 1.387227, 0.3239551, 0, 0.6352941, 1, 1,
0.09887579, 0.9382459, -0.4536532, 0, 0.627451, 1, 1,
0.1000716, 2.772617, 1.68475, 0, 0.6235294, 1, 1,
0.1001946, -0.2761064, 2.726716, 0, 0.6156863, 1, 1,
0.102576, -0.3639352, 2.447176, 0, 0.6117647, 1, 1,
0.1041352, 0.8341129, 0.08287819, 0, 0.6039216, 1, 1,
0.1075947, 1.0768, -0.3794788, 0, 0.5960785, 1, 1,
0.1099838, 0.7153197, -0.8969109, 0, 0.5921569, 1, 1,
0.1119484, 0.7219523, -0.8154461, 0, 0.5843138, 1, 1,
0.1177737, -0.01491119, 1.135167, 0, 0.5803922, 1, 1,
0.1211775, 0.5139737, 0.5167893, 0, 0.572549, 1, 1,
0.1216827, -1.197269, 4.81345, 0, 0.5686275, 1, 1,
0.1229036, 1.391999, -0.3360131, 0, 0.5607843, 1, 1,
0.1252152, 0.1932368, 0.9163263, 0, 0.5568628, 1, 1,
0.1261836, -1.144531, 1.807561, 0, 0.5490196, 1, 1,
0.1292545, -0.5050679, 1.763107, 0, 0.5450981, 1, 1,
0.1317049, 0.05667382, 0.4659835, 0, 0.5372549, 1, 1,
0.133974, 1.090553, 1.870533, 0, 0.5333334, 1, 1,
0.1373621, 1.750459, -0.199971, 0, 0.5254902, 1, 1,
0.1420298, -0.3061179, 2.171171, 0, 0.5215687, 1, 1,
0.1424453, -0.6183088, 2.020223, 0, 0.5137255, 1, 1,
0.1426463, -1.489438, 2.406006, 0, 0.509804, 1, 1,
0.1474825, -0.2362386, 1.428903, 0, 0.5019608, 1, 1,
0.1483055, -1.576773, 2.676872, 0, 0.4941176, 1, 1,
0.1483072, -0.5737925, 3.02635, 0, 0.4901961, 1, 1,
0.1484158, 1.061298, -0.6398975, 0, 0.4823529, 1, 1,
0.1537643, -0.5228708, 2.499405, 0, 0.4784314, 1, 1,
0.1542596, -0.1367892, 1.245425, 0, 0.4705882, 1, 1,
0.157277, -1.683272, 2.956429, 0, 0.4666667, 1, 1,
0.1608282, -0.01379107, 0.4578027, 0, 0.4588235, 1, 1,
0.1613434, -0.528818, 2.889589, 0, 0.454902, 1, 1,
0.1635597, -0.336371, 2.478924, 0, 0.4470588, 1, 1,
0.1640334, 0.8848697, -0.01171761, 0, 0.4431373, 1, 1,
0.1652362, 0.5528466, 0.5005093, 0, 0.4352941, 1, 1,
0.166523, -0.6563354, 2.254198, 0, 0.4313726, 1, 1,
0.1674447, 1.609696, 0.629509, 0, 0.4235294, 1, 1,
0.1680352, -1.472633, 3.999264, 0, 0.4196078, 1, 1,
0.1704261, 0.4321238, 2.016109, 0, 0.4117647, 1, 1,
0.1744719, -1.832897, 4.43929, 0, 0.4078431, 1, 1,
0.174776, -1.327408, 2.651983, 0, 0.4, 1, 1,
0.1757087, 0.2704977, 0.4730397, 0, 0.3921569, 1, 1,
0.1777711, 1.026639, 0.2968529, 0, 0.3882353, 1, 1,
0.1789812, 1.073673, 0.3898144, 0, 0.3803922, 1, 1,
0.1793757, -0.7936879, 1.928606, 0, 0.3764706, 1, 1,
0.1795094, -2.65683, 1.603288, 0, 0.3686275, 1, 1,
0.1825448, -1.363513, 2.638515, 0, 0.3647059, 1, 1,
0.1837938, 2.318237, -0.2268247, 0, 0.3568628, 1, 1,
0.1844569, 1.388906, 2.06577, 0, 0.3529412, 1, 1,
0.1881087, -1.16699, 2.285273, 0, 0.345098, 1, 1,
0.1915525, 0.9696328, 0.2171285, 0, 0.3411765, 1, 1,
0.2055208, -0.2032181, 1.739859, 0, 0.3333333, 1, 1,
0.2226097, 2.509311, 0.5273712, 0, 0.3294118, 1, 1,
0.2306175, 0.5401108, 2.059518, 0, 0.3215686, 1, 1,
0.2378622, -0.6247937, 1.857829, 0, 0.3176471, 1, 1,
0.2386962, 1.276542, -0.6209773, 0, 0.3098039, 1, 1,
0.2415169, -1.268674, 2.344723, 0, 0.3058824, 1, 1,
0.2424826, 1.203151, 0.9327253, 0, 0.2980392, 1, 1,
0.2439347, 0.5176221, -0.4825391, 0, 0.2901961, 1, 1,
0.2440786, 0.3298156, 0.1342973, 0, 0.2862745, 1, 1,
0.244769, -0.2153026, 1.466827, 0, 0.2784314, 1, 1,
0.2450013, 0.5163891, -0.3522369, 0, 0.2745098, 1, 1,
0.2454295, -0.2383955, 1.317418, 0, 0.2666667, 1, 1,
0.2459072, 0.1915653, 0.8345536, 0, 0.2627451, 1, 1,
0.2459883, -0.2758809, 2.274248, 0, 0.254902, 1, 1,
0.2462969, 0.3043507, 1.639244, 0, 0.2509804, 1, 1,
0.2469081, 0.2121259, 0.02569718, 0, 0.2431373, 1, 1,
0.250471, 0.2691514, 0.5534739, 0, 0.2392157, 1, 1,
0.2521428, 0.1667124, 0.7626719, 0, 0.2313726, 1, 1,
0.2549859, -0.479238, 2.632439, 0, 0.227451, 1, 1,
0.2555004, 1.816716, 1.069254, 0, 0.2196078, 1, 1,
0.2588024, -1.149624, 2.938027, 0, 0.2156863, 1, 1,
0.2588703, 0.6578358, 0.02644932, 0, 0.2078431, 1, 1,
0.2600451, -1.754444, 3.834448, 0, 0.2039216, 1, 1,
0.260727, -1.637409, 4.061137, 0, 0.1960784, 1, 1,
0.2631966, 0.7907298, -0.1470826, 0, 0.1882353, 1, 1,
0.2645088, 1.231573, -0.01453102, 0, 0.1843137, 1, 1,
0.2682193, -0.460316, 3.158619, 0, 0.1764706, 1, 1,
0.2689173, 0.05518306, 2.486869, 0, 0.172549, 1, 1,
0.2706896, 0.8486944, 1.777292, 0, 0.1647059, 1, 1,
0.2707701, 1.074363, -0.08933876, 0, 0.1607843, 1, 1,
0.2718698, 0.7465879, -0.9497854, 0, 0.1529412, 1, 1,
0.2727423, -1.551996, 2.759818, 0, 0.1490196, 1, 1,
0.2727841, 0.1556656, 1.580057, 0, 0.1411765, 1, 1,
0.2773507, -0.7669709, 0.7722262, 0, 0.1372549, 1, 1,
0.2797941, 0.6719937, 1.226251, 0, 0.1294118, 1, 1,
0.282767, -1.863254, 3.9895, 0, 0.1254902, 1, 1,
0.2830546, -1.258659, 2.425989, 0, 0.1176471, 1, 1,
0.2833084, 0.6365309, 0.3021232, 0, 0.1137255, 1, 1,
0.2862208, -1.062998, 2.855592, 0, 0.1058824, 1, 1,
0.2866014, -0.002484045, 1.175232, 0, 0.09803922, 1, 1,
0.2879203, 1.459733, 1.13637, 0, 0.09411765, 1, 1,
0.288053, 0.2479094, -0.1049941, 0, 0.08627451, 1, 1,
0.2885157, -2.02636, 1.103482, 0, 0.08235294, 1, 1,
0.290144, 0.9813867, 1.125934, 0, 0.07450981, 1, 1,
0.2930194, 0.03666671, 0.7444422, 0, 0.07058824, 1, 1,
0.2951613, 2.010576, -1.402937, 0, 0.0627451, 1, 1,
0.2957621, -0.8120552, 3.145778, 0, 0.05882353, 1, 1,
0.3089453, 1.763431, 0.5490867, 0, 0.05098039, 1, 1,
0.312021, 0.1386333, 1.958155, 0, 0.04705882, 1, 1,
0.3128736, 1.055383, -0.2328511, 0, 0.03921569, 1, 1,
0.3244124, 1.743511, 1.289898, 0, 0.03529412, 1, 1,
0.3273264, -0.4683793, 3.017527, 0, 0.02745098, 1, 1,
0.3379688, -0.5182449, 3.128447, 0, 0.02352941, 1, 1,
0.3449728, 0.6837735, -0.7569992, 0, 0.01568628, 1, 1,
0.3476742, -0.5599357, 2.580666, 0, 0.01176471, 1, 1,
0.3485318, 0.8624359, 3.114444, 0, 0.003921569, 1, 1,
0.3550656, 0.6168264, 0.5823466, 0.003921569, 0, 1, 1,
0.357272, 0.6314445, -1.083254, 0.007843138, 0, 1, 1,
0.3684444, 0.4541334, 0.7082089, 0.01568628, 0, 1, 1,
0.3705176, -1.278699, 2.57427, 0.01960784, 0, 1, 1,
0.3717844, -0.1074518, 1.614093, 0.02745098, 0, 1, 1,
0.3722507, 0.8412781, -0.6606091, 0.03137255, 0, 1, 1,
0.373206, 0.5814443, -0.06013754, 0.03921569, 0, 1, 1,
0.3785284, -0.120519, 1.755292, 0.04313726, 0, 1, 1,
0.3785929, -1.145761, 2.704926, 0.05098039, 0, 1, 1,
0.3787662, -1.228032, 3.833503, 0.05490196, 0, 1, 1,
0.3791682, 0.9581577, -0.5070534, 0.0627451, 0, 1, 1,
0.3937215, -0.4449381, 0.8045224, 0.06666667, 0, 1, 1,
0.3961662, -0.2759041, 2.687674, 0.07450981, 0, 1, 1,
0.4030899, -0.8202695, 1.897817, 0.07843138, 0, 1, 1,
0.4039752, -0.5227383, 1.191387, 0.08627451, 0, 1, 1,
0.4050628, 0.1620668, 1.918051, 0.09019608, 0, 1, 1,
0.4094935, -1.471207, 2.166913, 0.09803922, 0, 1, 1,
0.411828, -0.2811384, 2.542434, 0.1058824, 0, 1, 1,
0.4156273, -0.1397971, 2.605831, 0.1098039, 0, 1, 1,
0.416319, 0.1008393, 1.037294, 0.1176471, 0, 1, 1,
0.420345, 1.097433, -0.6921421, 0.1215686, 0, 1, 1,
0.424902, -1.434391, 2.562634, 0.1294118, 0, 1, 1,
0.4396479, -0.08748017, 2.196622, 0.1333333, 0, 1, 1,
0.4416458, -0.3959949, 3.46096, 0.1411765, 0, 1, 1,
0.4489719, 0.9055436, -0.3609694, 0.145098, 0, 1, 1,
0.4551394, 1.593075, 1.234553, 0.1529412, 0, 1, 1,
0.4562904, 1.085998, 0.9130583, 0.1568628, 0, 1, 1,
0.4580809, -0.7566804, 2.795481, 0.1647059, 0, 1, 1,
0.4603991, 0.9633383, 0.9599735, 0.1686275, 0, 1, 1,
0.4618956, 0.148147, 0.8637683, 0.1764706, 0, 1, 1,
0.4633427, 1.807994, -0.1238239, 0.1803922, 0, 1, 1,
0.4649242, -1.888098, 3.127953, 0.1882353, 0, 1, 1,
0.4712758, -0.0712788, 0.9338133, 0.1921569, 0, 1, 1,
0.4714552, 0.2861794, 1.551722, 0.2, 0, 1, 1,
0.4735736, 0.1802801, -0.1836187, 0.2078431, 0, 1, 1,
0.4744911, 1.711843, 0.2605458, 0.2117647, 0, 1, 1,
0.4828591, -0.9185925, 2.533321, 0.2196078, 0, 1, 1,
0.4845852, -0.01197051, 2.409909, 0.2235294, 0, 1, 1,
0.5008124, -0.1161673, 1.795841, 0.2313726, 0, 1, 1,
0.5008235, -1.083918, 3.305184, 0.2352941, 0, 1, 1,
0.5020934, -0.4359815, 3.720655, 0.2431373, 0, 1, 1,
0.5027957, 0.719925, -0.6067203, 0.2470588, 0, 1, 1,
0.5044394, -0.09627832, 1.161983, 0.254902, 0, 1, 1,
0.5055624, 0.6242253, 0.9221424, 0.2588235, 0, 1, 1,
0.5079502, 1.77099, -0.6395115, 0.2666667, 0, 1, 1,
0.5088595, 1.370139, 1.17081, 0.2705882, 0, 1, 1,
0.5090563, -0.1009516, 2.551339, 0.2784314, 0, 1, 1,
0.510017, 0.7615016, -0.9798068, 0.282353, 0, 1, 1,
0.5127917, -0.2343789, 3.908598, 0.2901961, 0, 1, 1,
0.5138232, -0.4485411, 3.254526, 0.2941177, 0, 1, 1,
0.5145176, 1.195326, -0.3577002, 0.3019608, 0, 1, 1,
0.5152277, -1.641029, 5.638603, 0.3098039, 0, 1, 1,
0.5264912, -0.1532617, 1.156367, 0.3137255, 0, 1, 1,
0.5342256, 0.08008533, -0.1423878, 0.3215686, 0, 1, 1,
0.5360585, 1.502676, 1.64398, 0.3254902, 0, 1, 1,
0.5466463, -0.9418237, 1.117531, 0.3333333, 0, 1, 1,
0.5501738, 0.7619511, -0.5976697, 0.3372549, 0, 1, 1,
0.5508066, -1.131664, 1.149459, 0.345098, 0, 1, 1,
0.5536442, -0.3266303, 1.188273, 0.3490196, 0, 1, 1,
0.5545605, 0.08491907, 0.8445476, 0.3568628, 0, 1, 1,
0.5615528, -0.742191, 2.773253, 0.3607843, 0, 1, 1,
0.5679853, -0.4161543, 2.30066, 0.3686275, 0, 1, 1,
0.5688514, -0.8509085, 3.463386, 0.372549, 0, 1, 1,
0.5706274, 0.4064453, 0.00433456, 0.3803922, 0, 1, 1,
0.5729369, 0.3149605, 2.933141, 0.3843137, 0, 1, 1,
0.5732316, -0.2236507, 1.754715, 0.3921569, 0, 1, 1,
0.5733811, 1.227419, -0.456139, 0.3960784, 0, 1, 1,
0.5879744, 0.409386, 0.2748145, 0.4039216, 0, 1, 1,
0.5921824, 0.9295048, 1.92702, 0.4117647, 0, 1, 1,
0.5941979, -2.146095, 2.820616, 0.4156863, 0, 1, 1,
0.5945413, -1.332146, 3.550426, 0.4235294, 0, 1, 1,
0.5956875, 1.026556, 1.597057, 0.427451, 0, 1, 1,
0.6038446, -0.6269948, 1.626549, 0.4352941, 0, 1, 1,
0.6086906, 0.05484159, 1.776942, 0.4392157, 0, 1, 1,
0.6104203, 0.1535536, 0.2344981, 0.4470588, 0, 1, 1,
0.6128324, -0.5544093, 4.019618, 0.4509804, 0, 1, 1,
0.616154, 0.07716016, -0.2871492, 0.4588235, 0, 1, 1,
0.6244247, -1.281065, 3.49497, 0.4627451, 0, 1, 1,
0.6273668, 1.319579, 0.553619, 0.4705882, 0, 1, 1,
0.6308084, 0.741863, 0.4623775, 0.4745098, 0, 1, 1,
0.6322532, 0.7359619, 0.1032774, 0.4823529, 0, 1, 1,
0.6363155, 0.8876263, 0.3352619, 0.4862745, 0, 1, 1,
0.6463682, 0.9544446, 0.6138383, 0.4941176, 0, 1, 1,
0.647889, -0.6520485, 2.744891, 0.5019608, 0, 1, 1,
0.6525372, -0.5757948, 1.411651, 0.5058824, 0, 1, 1,
0.653895, -1.255018, 2.051215, 0.5137255, 0, 1, 1,
0.6544251, -0.243948, 1.581133, 0.5176471, 0, 1, 1,
0.6549445, 0.4700957, -0.3502133, 0.5254902, 0, 1, 1,
0.6556634, 0.2719464, 0.150242, 0.5294118, 0, 1, 1,
0.6572435, 0.8522289, -1.243193, 0.5372549, 0, 1, 1,
0.6576927, -0.7737097, 3.879617, 0.5411765, 0, 1, 1,
0.6593447, 0.7269129, 1.417668, 0.5490196, 0, 1, 1,
0.6597825, 0.9238848, -0.1232241, 0.5529412, 0, 1, 1,
0.6604968, -0.6612967, 3.044915, 0.5607843, 0, 1, 1,
0.6661589, 1.056891, 0.7124856, 0.5647059, 0, 1, 1,
0.6673635, 0.2385208, 0.6668072, 0.572549, 0, 1, 1,
0.6694438, 0.5165783, 0.3417987, 0.5764706, 0, 1, 1,
0.675829, 0.50891, 1.248114, 0.5843138, 0, 1, 1,
0.6764624, 0.6677297, 1.121486, 0.5882353, 0, 1, 1,
0.6767206, 1.137401, 1.326663, 0.5960785, 0, 1, 1,
0.6817805, -1.151383, 1.47642, 0.6039216, 0, 1, 1,
0.6819741, 1.061292, 0.9995456, 0.6078432, 0, 1, 1,
0.683239, -2.340164, 3.141911, 0.6156863, 0, 1, 1,
0.68526, 0.1421274, 1.261341, 0.6196079, 0, 1, 1,
0.691067, -0.0464176, 2.668785, 0.627451, 0, 1, 1,
0.6948919, 0.3244008, 0.4392658, 0.6313726, 0, 1, 1,
0.6998529, -2.125573, 3.359335, 0.6392157, 0, 1, 1,
0.6999817, 1.100927, -0.3247553, 0.6431373, 0, 1, 1,
0.7004654, 0.5838832, 1.036733, 0.6509804, 0, 1, 1,
0.7039534, 0.200365, -0.4119006, 0.654902, 0, 1, 1,
0.7069011, 2.693839, -0.7453923, 0.6627451, 0, 1, 1,
0.7075981, 0.2857454, 0.4121123, 0.6666667, 0, 1, 1,
0.71455, 0.861504, 0.6406822, 0.6745098, 0, 1, 1,
0.7203338, -1.025767, 3.129615, 0.6784314, 0, 1, 1,
0.7236941, -0.6199416, 2.129248, 0.6862745, 0, 1, 1,
0.7328519, 0.4205725, 2.471998, 0.6901961, 0, 1, 1,
0.7409685, -0.06129858, 3.193224, 0.6980392, 0, 1, 1,
0.7442626, -0.9560471, 2.358957, 0.7058824, 0, 1, 1,
0.7444788, -1.764347, 2.611834, 0.7098039, 0, 1, 1,
0.7487991, -1.296516, 3.1046, 0.7176471, 0, 1, 1,
0.7543752, -0.9925119, 3.983945, 0.7215686, 0, 1, 1,
0.7586643, -0.5375674, 0.9907048, 0.7294118, 0, 1, 1,
0.7636449, -0.3206889, 2.519515, 0.7333333, 0, 1, 1,
0.7662419, 0.02657306, 0.9158864, 0.7411765, 0, 1, 1,
0.7685707, 0.6635816, 1.071312, 0.7450981, 0, 1, 1,
0.7703169, 0.401746, 2.183459, 0.7529412, 0, 1, 1,
0.7717286, -1.20834, 1.540917, 0.7568628, 0, 1, 1,
0.7732802, -0.8188822, 2.847292, 0.7647059, 0, 1, 1,
0.7841045, -0.4414693, 1.953594, 0.7686275, 0, 1, 1,
0.7924523, 0.08410531, 1.90799, 0.7764706, 0, 1, 1,
0.7967702, 0.4581223, 1.854669, 0.7803922, 0, 1, 1,
0.7971534, 0.182872, 0.4626159, 0.7882353, 0, 1, 1,
0.8034515, 0.1279738, 3.175942, 0.7921569, 0, 1, 1,
0.8082685, -0.3544175, 3.27603, 0.8, 0, 1, 1,
0.8083682, 2.518609, 1.723398, 0.8078431, 0, 1, 1,
0.814429, -1.111262, -0.4052963, 0.8117647, 0, 1, 1,
0.8157427, 2.650866, 0.328344, 0.8196079, 0, 1, 1,
0.8212599, -0.1101693, 0.5387598, 0.8235294, 0, 1, 1,
0.8221212, 0.4068134, 0.8198909, 0.8313726, 0, 1, 1,
0.825552, 0.5804035, 0.04422703, 0.8352941, 0, 1, 1,
0.8298829, -1.320109, 1.992549, 0.8431373, 0, 1, 1,
0.8313732, 0.8584988, 0.02133888, 0.8470588, 0, 1, 1,
0.8318925, -1.124405, 2.481803, 0.854902, 0, 1, 1,
0.8397596, -0.469422, 0.4892407, 0.8588235, 0, 1, 1,
0.8441954, -0.3518414, 0.2425733, 0.8666667, 0, 1, 1,
0.8480229, -1.237591, 3.273817, 0.8705882, 0, 1, 1,
0.8502504, 0.6010125, 0.1770311, 0.8784314, 0, 1, 1,
0.853372, -0.07126182, 0.574398, 0.8823529, 0, 1, 1,
0.8573917, 0.9436361, 0.8479537, 0.8901961, 0, 1, 1,
0.8607354, -0.3082487, 3.473692, 0.8941177, 0, 1, 1,
0.8611273, 1.571247, 0.8245674, 0.9019608, 0, 1, 1,
0.8659242, -0.02215678, 1.88332, 0.9098039, 0, 1, 1,
0.8672834, 0.5214255, 2.528778, 0.9137255, 0, 1, 1,
0.8674436, -0.09167348, 1.895033, 0.9215686, 0, 1, 1,
0.8701846, -2.79411, 3.418085, 0.9254902, 0, 1, 1,
0.875551, 1.350964, -0.009584665, 0.9333333, 0, 1, 1,
0.8765799, 1.595343, -0.1098225, 0.9372549, 0, 1, 1,
0.8767369, -0.6580611, 0.2400881, 0.945098, 0, 1, 1,
0.8838081, 1.065555, 0.9383687, 0.9490196, 0, 1, 1,
0.8891109, 1.311021, 0.9298875, 0.9568627, 0, 1, 1,
0.9006125, -0.3808385, 4.040843, 0.9607843, 0, 1, 1,
0.9052016, 0.4982509, 1.814134, 0.9686275, 0, 1, 1,
0.9085803, -0.1279964, 2.467105, 0.972549, 0, 1, 1,
0.9096084, -0.422643, 3.159541, 0.9803922, 0, 1, 1,
0.9151357, -0.8825369, 2.476649, 0.9843137, 0, 1, 1,
0.9170995, 0.4064957, 2.398812, 0.9921569, 0, 1, 1,
0.9184063, 0.4529384, 1.612061, 0.9960784, 0, 1, 1,
0.9186072, -1.468133, 3.200061, 1, 0, 0.9960784, 1,
0.9191875, -0.7422876, 2.501026, 1, 0, 0.9882353, 1,
0.9280671, -1.763435, 2.315789, 1, 0, 0.9843137, 1,
0.9335088, -0.8804823, 1.037133, 1, 0, 0.9764706, 1,
0.9357523, -0.9434009, 1.752254, 1, 0, 0.972549, 1,
0.9371772, -0.4391918, 2.504557, 1, 0, 0.9647059, 1,
0.9379798, 0.7869806, 0.5540568, 1, 0, 0.9607843, 1,
0.9469008, 1.305222, 0.6753954, 1, 0, 0.9529412, 1,
0.9530989, -0.1874405, 2.8303, 1, 0, 0.9490196, 1,
0.9563283, 0.03203254, 1.232529, 1, 0, 0.9411765, 1,
0.962146, -1.115542, 2.090097, 1, 0, 0.9372549, 1,
0.9656349, 1.401988, 0.250598, 1, 0, 0.9294118, 1,
0.9741453, 0.613951, 1.705645, 1, 0, 0.9254902, 1,
0.9806826, 0.5932391, 0.7604331, 1, 0, 0.9176471, 1,
0.9827228, -2.274953, 4.533456, 1, 0, 0.9137255, 1,
0.9949999, -0.2728316, 3.413618, 1, 0, 0.9058824, 1,
0.999207, 0.9152897, 0.01675639, 1, 0, 0.9019608, 1,
1.025327, 1.341834, 1.354549, 1, 0, 0.8941177, 1,
1.03633, -0.1952259, 1.860958, 1, 0, 0.8862745, 1,
1.041324, -0.9232566, 2.444565, 1, 0, 0.8823529, 1,
1.056077, 0.2519569, 1.006758, 1, 0, 0.8745098, 1,
1.058323, 0.01244638, 2.150107, 1, 0, 0.8705882, 1,
1.059793, 0.8973023, 0.736561, 1, 0, 0.8627451, 1,
1.067694, 0.3130899, 1.165132, 1, 0, 0.8588235, 1,
1.069061, -0.5089142, 2.836017, 1, 0, 0.8509804, 1,
1.074169, 0.351698, 0.3998849, 1, 0, 0.8470588, 1,
1.077202, -1.585071, 2.482677, 1, 0, 0.8392157, 1,
1.080987, 0.8599014, 1.014986, 1, 0, 0.8352941, 1,
1.083347, 0.6176121, 1.346871, 1, 0, 0.827451, 1,
1.083587, 0.6080022, 1.179287, 1, 0, 0.8235294, 1,
1.088149, -1.06373, 1.863899, 1, 0, 0.8156863, 1,
1.094019, 0.7192124, 2.271646, 1, 0, 0.8117647, 1,
1.096278, -0.3248297, 0.7538031, 1, 0, 0.8039216, 1,
1.096846, 0.04077839, 0.4082613, 1, 0, 0.7960784, 1,
1.099221, -0.12806, 2.746056, 1, 0, 0.7921569, 1,
1.108337, 0.4780227, 0.6275232, 1, 0, 0.7843137, 1,
1.115981, 0.9482338, 0.7204562, 1, 0, 0.7803922, 1,
1.120145, 0.8096603, 3.26461, 1, 0, 0.772549, 1,
1.128838, -1.762966, 1.980431, 1, 0, 0.7686275, 1,
1.139428, 1.144424, 1.910187, 1, 0, 0.7607843, 1,
1.139746, 1.01527, 1.203781, 1, 0, 0.7568628, 1,
1.142659, -1.067985, 3.684836, 1, 0, 0.7490196, 1,
1.15559, 1.253307, 1.093426, 1, 0, 0.7450981, 1,
1.160604, -1.191711, 1.489597, 1, 0, 0.7372549, 1,
1.168291, 0.0149723, 2.031135, 1, 0, 0.7333333, 1,
1.169591, 0.3964724, 2.033165, 1, 0, 0.7254902, 1,
1.172897, 0.52745, 0.642355, 1, 0, 0.7215686, 1,
1.204589, 1.916038, -1.184732, 1, 0, 0.7137255, 1,
1.205613, 1.172712, 0.9545037, 1, 0, 0.7098039, 1,
1.208638, 0.8615756, 1.617056, 1, 0, 0.7019608, 1,
1.210536, -0.3100564, -0.4057657, 1, 0, 0.6941177, 1,
1.213406, 0.6268972, 1.26224, 1, 0, 0.6901961, 1,
1.213804, 0.1185672, 3.840479, 1, 0, 0.682353, 1,
1.233838, 0.1221563, 0.6161952, 1, 0, 0.6784314, 1,
1.237363, -1.708225, 2.85615, 1, 0, 0.6705883, 1,
1.240879, -0.6664433, 2.709903, 1, 0, 0.6666667, 1,
1.246167, 0.7135715, 0.2585635, 1, 0, 0.6588235, 1,
1.246685, -0.137297, 1.459834, 1, 0, 0.654902, 1,
1.252127, 0.6855367, 0.9037102, 1, 0, 0.6470588, 1,
1.275428, -0.5396684, 3.840252, 1, 0, 0.6431373, 1,
1.278039, -1.506747, 3.479621, 1, 0, 0.6352941, 1,
1.29554, 1.315565, 1.938186, 1, 0, 0.6313726, 1,
1.302008, -0.1317649, 1.698872, 1, 0, 0.6235294, 1,
1.302684, -0.8421187, 3.332222, 1, 0, 0.6196079, 1,
1.319332, 0.1806135, 1.613419, 1, 0, 0.6117647, 1,
1.320814, 0.6690595, 3.933727, 1, 0, 0.6078432, 1,
1.322704, 0.1934346, 3.717202, 1, 0, 0.6, 1,
1.330413, -1.571862, 1.398275, 1, 0, 0.5921569, 1,
1.332059, 0.07070342, 1.084664, 1, 0, 0.5882353, 1,
1.337651, -0.3072514, 0.6147736, 1, 0, 0.5803922, 1,
1.338247, 0.3967813, 1.984266, 1, 0, 0.5764706, 1,
1.342915, -0.7157212, 0.625651, 1, 0, 0.5686275, 1,
1.360945, -1.185429, 0.7433253, 1, 0, 0.5647059, 1,
1.363248, -0.7399036, 2.207814, 1, 0, 0.5568628, 1,
1.36646, -0.62521, 0.8722608, 1, 0, 0.5529412, 1,
1.369756, -0.7888127, 1.226745, 1, 0, 0.5450981, 1,
1.371623, 0.1870895, 0.2778398, 1, 0, 0.5411765, 1,
1.375048, 1.135296, -0.3020231, 1, 0, 0.5333334, 1,
1.387958, -1.614902, 2.053646, 1, 0, 0.5294118, 1,
1.394176, 1.750116, 0.3545667, 1, 0, 0.5215687, 1,
1.404671, -0.640838, 2.107111, 1, 0, 0.5176471, 1,
1.413399, -0.4794907, 0.3257008, 1, 0, 0.509804, 1,
1.41654, 1.470616, 0.5290079, 1, 0, 0.5058824, 1,
1.426007, -0.6515948, 1.338486, 1, 0, 0.4980392, 1,
1.431524, -0.4363967, 1.169289, 1, 0, 0.4901961, 1,
1.433287, -1.330699, 0.8764042, 1, 0, 0.4862745, 1,
1.440608, 1.165422, 1.856079, 1, 0, 0.4784314, 1,
1.45235, 2.89094, 1.498451, 1, 0, 0.4745098, 1,
1.455023, -0.00933979, 1.219732, 1, 0, 0.4666667, 1,
1.458859, 0.1705295, 1.455197, 1, 0, 0.4627451, 1,
1.459018, -1.206022, 1.337921, 1, 0, 0.454902, 1,
1.463741, -0.1207389, 1.114641, 1, 0, 0.4509804, 1,
1.47675, -0.5495322, 1.322479, 1, 0, 0.4431373, 1,
1.484116, -1.77666, 2.516325, 1, 0, 0.4392157, 1,
1.48932, -1.153778, 3.974781, 1, 0, 0.4313726, 1,
1.493388, -0.08127542, 1.843097, 1, 0, 0.427451, 1,
1.497819, 1.453921, 3.051622, 1, 0, 0.4196078, 1,
1.541438, 0.2746139, 1.859999, 1, 0, 0.4156863, 1,
1.547638, 0.2871098, 3.168822, 1, 0, 0.4078431, 1,
1.555192, -0.1392444, 0.8522395, 1, 0, 0.4039216, 1,
1.571502, 0.1229587, 1.837549, 1, 0, 0.3960784, 1,
1.582703, -1.075927, 1.95249, 1, 0, 0.3882353, 1,
1.592539, -0.03881949, 1.422636, 1, 0, 0.3843137, 1,
1.611782, -0.6779285, 2.074615, 1, 0, 0.3764706, 1,
1.618165, -1.744637, 2.004809, 1, 0, 0.372549, 1,
1.641655, 0.4644485, 2.519836, 1, 0, 0.3647059, 1,
1.643925, -0.15048, 1.372967, 1, 0, 0.3607843, 1,
1.645486, 0.2503954, 1.145739, 1, 0, 0.3529412, 1,
1.666539, 0.4395546, 1.681933, 1, 0, 0.3490196, 1,
1.666938, -1.03743, 4.076484, 1, 0, 0.3411765, 1,
1.669774, 0.306118, 1.632029, 1, 0, 0.3372549, 1,
1.678075, -1.196817, 2.480875, 1, 0, 0.3294118, 1,
1.684651, -0.1253046, 2.247103, 1, 0, 0.3254902, 1,
1.69304, 0.6117159, -0.4857878, 1, 0, 0.3176471, 1,
1.702256, 1.926895, -1.324806, 1, 0, 0.3137255, 1,
1.706805, 0.3154101, 1.600067, 1, 0, 0.3058824, 1,
1.711751, -0.4177521, 1.83044, 1, 0, 0.2980392, 1,
1.719044, 0.5630164, 1.394586, 1, 0, 0.2941177, 1,
1.71958, -0.9361251, 3.008066, 1, 0, 0.2862745, 1,
1.76569, 0.6063135, 0.08624867, 1, 0, 0.282353, 1,
1.791932, 0.4226824, 0.9390426, 1, 0, 0.2745098, 1,
1.812169, 0.02219436, 1.313459, 1, 0, 0.2705882, 1,
1.831468, -0.9879843, 2.053545, 1, 0, 0.2627451, 1,
1.833194, -0.9489999, 2.607293, 1, 0, 0.2588235, 1,
1.836949, -0.6682016, 3.559636, 1, 0, 0.2509804, 1,
1.839738, -0.1009118, 1.863691, 1, 0, 0.2470588, 1,
1.844195, -0.03825659, 2.163153, 1, 0, 0.2392157, 1,
1.880188, 0.6540214, 1.729412, 1, 0, 0.2352941, 1,
1.882558, -0.3370686, 2.111941, 1, 0, 0.227451, 1,
1.889249, 0.03651316, 0.8127117, 1, 0, 0.2235294, 1,
1.902501, 0.07514708, 1.508309, 1, 0, 0.2156863, 1,
1.913582, -1.896123, 3.287163, 1, 0, 0.2117647, 1,
1.93647, -2.709048, 0.3272225, 1, 0, 0.2039216, 1,
1.953519, -0.03928094, 1.448723, 1, 0, 0.1960784, 1,
1.954863, -1.431944, 1.561317, 1, 0, 0.1921569, 1,
1.972491, -0.8939558, 4.233328, 1, 0, 0.1843137, 1,
1.979711, -0.2670373, 1.143871, 1, 0, 0.1803922, 1,
1.985476, 0.447309, 1.765026, 1, 0, 0.172549, 1,
1.995795, -0.3726001, 1.453958, 1, 0, 0.1686275, 1,
2.01445, 1.812935, 0.0267657, 1, 0, 0.1607843, 1,
2.018019, 1.183588, 1.991866, 1, 0, 0.1568628, 1,
2.022527, -1.974485, 2.257106, 1, 0, 0.1490196, 1,
2.028084, 0.1694445, 3.032229, 1, 0, 0.145098, 1,
2.033945, 0.7555672, 0.7672632, 1, 0, 0.1372549, 1,
2.034137, 2.797169, 3.06556, 1, 0, 0.1333333, 1,
2.056338, 0.4873213, 1.972674, 1, 0, 0.1254902, 1,
2.076504, -0.7524983, 2.003922, 1, 0, 0.1215686, 1,
2.091114, -0.8356153, 2.401926, 1, 0, 0.1137255, 1,
2.094623, -0.1875252, 3.375388, 1, 0, 0.1098039, 1,
2.097828, -0.2713548, 2.383224, 1, 0, 0.1019608, 1,
2.102351, 0.8655878, 1.801316, 1, 0, 0.09411765, 1,
2.111548, -0.4951558, 1.90712, 1, 0, 0.09019608, 1,
2.178067, 1.168404, 0.5274897, 1, 0, 0.08235294, 1,
2.181466, 0.7555532, 0.6858392, 1, 0, 0.07843138, 1,
2.234622, -0.472251, 2.122498, 1, 0, 0.07058824, 1,
2.301668, -0.005220396, 1.946789, 1, 0, 0.06666667, 1,
2.303289, -0.6471253, 2.385405, 1, 0, 0.05882353, 1,
2.339502, 0.2706302, -0.1246187, 1, 0, 0.05490196, 1,
2.34464, 0.1418717, 2.619033, 1, 0, 0.04705882, 1,
2.380892, 0.4449389, 2.502743, 1, 0, 0.04313726, 1,
2.415205, 0.3332048, 0.1927227, 1, 0, 0.03529412, 1,
2.584734, -0.3790696, 2.843113, 1, 0, 0.03137255, 1,
2.739088, -0.5967475, 3.30254, 1, 0, 0.02352941, 1,
2.833194, 0.6552677, 0.644349, 1, 0, 0.01960784, 1,
2.849578, -1.480178, -0.04618523, 1, 0, 0.01176471, 1,
2.890981, 0.09178562, 2.154992, 1, 0, 0.007843138, 1
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
-0.4268721, -3.9516, -6.880497, 0, -0.5, 0.5, 0.5,
-0.4268721, -3.9516, -6.880497, 1, -0.5, 0.5, 0.5,
-0.4268721, -3.9516, -6.880497, 1, 1.5, 0.5, 0.5,
-0.4268721, -3.9516, -6.880497, 0, 1.5, 0.5, 0.5
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
-4.869478, 0.0821389, -6.880497, 0, -0.5, 0.5, 0.5,
-4.869478, 0.0821389, -6.880497, 1, -0.5, 0.5, 0.5,
-4.869478, 0.0821389, -6.880497, 1, 1.5, 0.5, 0.5,
-4.869478, 0.0821389, -6.880497, 0, 1.5, 0.5, 0.5
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
-4.869478, -3.9516, 0.2862725, 0, -0.5, 0.5, 0.5,
-4.869478, -3.9516, 0.2862725, 1, -0.5, 0.5, 0.5,
-4.869478, -3.9516, 0.2862725, 1, 1.5, 0.5, 0.5,
-4.869478, -3.9516, 0.2862725, 0, 1.5, 0.5, 0.5
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
-3, -3.020737, -5.226627,
2, -3.020737, -5.226627,
-3, -3.020737, -5.226627,
-3, -3.175881, -5.502273,
-2, -3.020737, -5.226627,
-2, -3.175881, -5.502273,
-1, -3.020737, -5.226627,
-1, -3.175881, -5.502273,
0, -3.020737, -5.226627,
0, -3.175881, -5.502273,
1, -3.020737, -5.226627,
1, -3.175881, -5.502273,
2, -3.020737, -5.226627,
2, -3.175881, -5.502273
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
-3, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
-3, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
-3, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
-3, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5,
-2, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
-2, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
-2, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
-2, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5,
-1, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
-1, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
-1, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
-1, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5,
0, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
0, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
0, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
0, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5,
1, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
1, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
1, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
1, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5,
2, -3.486169, -6.053563, 0, -0.5, 0.5, 0.5,
2, -3.486169, -6.053563, 1, -0.5, 0.5, 0.5,
2, -3.486169, -6.053563, 1, 1.5, 0.5, 0.5,
2, -3.486169, -6.053563, 0, 1.5, 0.5, 0.5
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
-3.844261, -2, -5.226627,
-3.844261, 3, -5.226627,
-3.844261, -2, -5.226627,
-4.015131, -2, -5.502273,
-3.844261, -1, -5.226627,
-4.015131, -1, -5.502273,
-3.844261, 0, -5.226627,
-4.015131, 0, -5.502273,
-3.844261, 1, -5.226627,
-4.015131, 1, -5.502273,
-3.844261, 2, -5.226627,
-4.015131, 2, -5.502273,
-3.844261, 3, -5.226627,
-4.015131, 3, -5.502273
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
-4.356869, -2, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, -2, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, -2, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, -2, -6.053563, 0, 1.5, 0.5, 0.5,
-4.356869, -1, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, -1, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, -1, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, -1, -6.053563, 0, 1.5, 0.5, 0.5,
-4.356869, 0, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, 0, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, 0, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, 0, -6.053563, 0, 1.5, 0.5, 0.5,
-4.356869, 1, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, 1, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, 1, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, 1, -6.053563, 0, 1.5, 0.5, 0.5,
-4.356869, 2, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, 2, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, 2, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, 2, -6.053563, 0, 1.5, 0.5, 0.5,
-4.356869, 3, -6.053563, 0, -0.5, 0.5, 0.5,
-4.356869, 3, -6.053563, 1, -0.5, 0.5, 0.5,
-4.356869, 3, -6.053563, 1, 1.5, 0.5, 0.5,
-4.356869, 3, -6.053563, 0, 1.5, 0.5, 0.5
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
-3.844261, -3.020737, -4,
-3.844261, -3.020737, 4,
-3.844261, -3.020737, -4,
-4.015131, -3.175881, -4,
-3.844261, -3.020737, -2,
-4.015131, -3.175881, -2,
-3.844261, -3.020737, 0,
-4.015131, -3.175881, 0,
-3.844261, -3.020737, 2,
-4.015131, -3.175881, 2,
-3.844261, -3.020737, 4,
-4.015131, -3.175881, 4
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
-4.356869, -3.486169, -4, 0, -0.5, 0.5, 0.5,
-4.356869, -3.486169, -4, 1, -0.5, 0.5, 0.5,
-4.356869, -3.486169, -4, 1, 1.5, 0.5, 0.5,
-4.356869, -3.486169, -4, 0, 1.5, 0.5, 0.5,
-4.356869, -3.486169, -2, 0, -0.5, 0.5, 0.5,
-4.356869, -3.486169, -2, 1, -0.5, 0.5, 0.5,
-4.356869, -3.486169, -2, 1, 1.5, 0.5, 0.5,
-4.356869, -3.486169, -2, 0, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 0, 0, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 0, 1, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 0, 1, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 0, 0, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 2, 0, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 2, 1, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 2, 1, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 2, 0, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 4, 0, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 4, 1, -0.5, 0.5, 0.5,
-4.356869, -3.486169, 4, 1, 1.5, 0.5, 0.5,
-4.356869, -3.486169, 4, 0, 1.5, 0.5, 0.5
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
-3.844261, -3.020737, -5.226627,
-3.844261, 3.185015, -5.226627,
-3.844261, -3.020737, 5.799172,
-3.844261, 3.185015, 5.799172,
-3.844261, -3.020737, -5.226627,
-3.844261, -3.020737, 5.799172,
-3.844261, 3.185015, -5.226627,
-3.844261, 3.185015, 5.799172,
-3.844261, -3.020737, -5.226627,
2.990517, -3.020737, -5.226627,
-3.844261, -3.020737, 5.799172,
2.990517, -3.020737, 5.799172,
-3.844261, 3.185015, -5.226627,
2.990517, 3.185015, -5.226627,
-3.844261, 3.185015, 5.799172,
2.990517, 3.185015, 5.799172,
2.990517, -3.020737, -5.226627,
2.990517, 3.185015, -5.226627,
2.990517, -3.020737, 5.799172,
2.990517, 3.185015, 5.799172,
2.990517, -3.020737, -5.226627,
2.990517, -3.020737, 5.799172,
2.990517, 3.185015, -5.226627,
2.990517, 3.185015, 5.799172
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
var radius = 7.678816;
var distance = 34.16392;
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
mvMatrix.translate( 0.4268721, -0.0821389, -0.2862725 );
mvMatrix.scale( 1.214741, 1.337869, 0.7530053 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16392);
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
carbamate<-read.table("carbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
y<-carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
z<-carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
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
-3.744725, 2.076805, -1.70302, 0, 0, 1, 1, 1,
-3.011346, 0.007861707, -1.53547, 1, 0, 0, 1, 1,
-2.952033, -1.089155, -3.458757, 1, 0, 0, 1, 1,
-2.77558, -0.4607894, -3.214881, 1, 0, 0, 1, 1,
-2.76403, -0.1033883, -1.059075, 1, 0, 0, 1, 1,
-2.707388, -1.538907, -1.783957, 1, 0, 0, 1, 1,
-2.602681, -0.5729514, -3.793439, 0, 0, 0, 1, 1,
-2.599411, 0.4581393, 0.2742574, 0, 0, 0, 1, 1,
-2.508719, 0.7231627, -2.535968, 0, 0, 0, 1, 1,
-2.391438, 1.027379, -0.7575509, 0, 0, 0, 1, 1,
-2.364457, 0.04039404, -1.65984, 0, 0, 0, 1, 1,
-2.33239, 0.05951787, -2.241087, 0, 0, 0, 1, 1,
-2.296892, 1.556632, -1.195561, 0, 0, 0, 1, 1,
-2.246657, -1.132549, -2.791788, 1, 1, 1, 1, 1,
-2.215999, 1.609578, -2.612163, 1, 1, 1, 1, 1,
-2.20831, 0.4034067, -1.716119, 1, 1, 1, 1, 1,
-2.201594, -1.280118, -0.9727032, 1, 1, 1, 1, 1,
-2.098666, -1.323147, -2.400264, 1, 1, 1, 1, 1,
-2.085706, -0.2256477, -1.646958, 1, 1, 1, 1, 1,
-2.05525, -0.9596749, -1.930468, 1, 1, 1, 1, 1,
-2.047805, 0.4713325, -0.4467086, 1, 1, 1, 1, 1,
-2.022132, 0.04720744, -1.396317, 1, 1, 1, 1, 1,
-2.020649, -0.9938653, -2.391789, 1, 1, 1, 1, 1,
-2.014937, -1.192634, -1.29304, 1, 1, 1, 1, 1,
-2.013201, 0.2752866, -2.299951, 1, 1, 1, 1, 1,
-1.996077, -1.133872, -3.257367, 1, 1, 1, 1, 1,
-1.989983, 0.9943782, -2.595529, 1, 1, 1, 1, 1,
-1.971862, -0.1796455, -0.2083023, 1, 1, 1, 1, 1,
-1.970109, -0.1023956, -1.784958, 0, 0, 1, 1, 1,
-1.964293, -0.09906104, -0.01890593, 1, 0, 0, 1, 1,
-1.961041, 0.1625909, -1.898177, 1, 0, 0, 1, 1,
-1.949968, 0.6142035, -1.344252, 1, 0, 0, 1, 1,
-1.940143, -0.5380659, -2.929405, 1, 0, 0, 1, 1,
-1.928717, 1.920863, -0.4187135, 1, 0, 0, 1, 1,
-1.917645, 1.36297, 0.4427738, 0, 0, 0, 1, 1,
-1.912062, 0.2086715, 0.6021205, 0, 0, 0, 1, 1,
-1.896047, -1.00446, -1.111427, 0, 0, 0, 1, 1,
-1.892726, 0.2301834, -2.374533, 0, 0, 0, 1, 1,
-1.883938, 0.8413711, -0.3470283, 0, 0, 0, 1, 1,
-1.882791, 2.283191, -0.6834522, 0, 0, 0, 1, 1,
-1.881252, 0.9179873, -1.800746, 0, 0, 0, 1, 1,
-1.864993, -0.3527633, -0.4302978, 1, 1, 1, 1, 1,
-1.843448, 0.08357894, -0.7457467, 1, 1, 1, 1, 1,
-1.825786, 2.569616, -2.816834, 1, 1, 1, 1, 1,
-1.811625, 0.09469277, -2.265682, 1, 1, 1, 1, 1,
-1.782491, -0.0476561, -1.607885, 1, 1, 1, 1, 1,
-1.774368, -0.2781798, -1.042425, 1, 1, 1, 1, 1,
-1.762971, 1.466438, -1.676714, 1, 1, 1, 1, 1,
-1.761425, 0.164822, -2.010261, 1, 1, 1, 1, 1,
-1.75002, 0.2213262, -1.767722, 1, 1, 1, 1, 1,
-1.747215, 1.777899, -1.804641, 1, 1, 1, 1, 1,
-1.736964, 0.03752207, -3.151719, 1, 1, 1, 1, 1,
-1.720041, 0.7623848, -2.061079, 1, 1, 1, 1, 1,
-1.697342, 0.8298818, -0.2503135, 1, 1, 1, 1, 1,
-1.684824, -0.9863694, -1.39209, 1, 1, 1, 1, 1,
-1.684244, -1.566565, -1.677971, 1, 1, 1, 1, 1,
-1.679857, -0.2962837, -1.304894, 0, 0, 1, 1, 1,
-1.666115, 0.5879772, -0.02060874, 1, 0, 0, 1, 1,
-1.638448, 0.6219338, -1.285837, 1, 0, 0, 1, 1,
-1.608148, -0.02878661, -1.331971, 1, 0, 0, 1, 1,
-1.604311, 0.6513286, -1.815391, 1, 0, 0, 1, 1,
-1.588992, 1.409454, -0.05479493, 1, 0, 0, 1, 1,
-1.588929, 0.750477, -0.3093565, 0, 0, 0, 1, 1,
-1.563631, -0.535324, -1.689293, 0, 0, 0, 1, 1,
-1.563607, -0.2194664, -2.147394, 0, 0, 0, 1, 1,
-1.562713, 1.580123, -3.156697, 0, 0, 0, 1, 1,
-1.549677, -0.8965183, -1.855359, 0, 0, 0, 1, 1,
-1.542629, -0.8711594, -1.331171, 0, 0, 0, 1, 1,
-1.542014, 0.5294142, -0.8621523, 0, 0, 0, 1, 1,
-1.530285, -0.6023711, -1.630282, 1, 1, 1, 1, 1,
-1.526297, -1.371209, -0.1655837, 1, 1, 1, 1, 1,
-1.521907, 0.02982499, -2.309057, 1, 1, 1, 1, 1,
-1.51331, 0.3980822, -2.244922, 1, 1, 1, 1, 1,
-1.513225, 0.6465434, -1.658333, 1, 1, 1, 1, 1,
-1.507994, -0.2773319, -2.478268, 1, 1, 1, 1, 1,
-1.492179, 0.07118087, -1.292827, 1, 1, 1, 1, 1,
-1.470331, -2.203166, -3.971084, 1, 1, 1, 1, 1,
-1.449834, -0.3711186, -1.891173, 1, 1, 1, 1, 1,
-1.440272, 3.09464, 0.7635475, 1, 1, 1, 1, 1,
-1.420816, 0.3556837, -1.964416, 1, 1, 1, 1, 1,
-1.420149, -0.5163699, -1.506054, 1, 1, 1, 1, 1,
-1.413342, 0.5752617, 1.026435, 1, 1, 1, 1, 1,
-1.410985, 1.532247, -1.079025, 1, 1, 1, 1, 1,
-1.410946, 0.3888318, -3.36548, 1, 1, 1, 1, 1,
-1.400852, 2.471517, -1.321558, 0, 0, 1, 1, 1,
-1.391253, -1.032748, -3.25738, 1, 0, 0, 1, 1,
-1.387839, -0.8974515, -3.23488, 1, 0, 0, 1, 1,
-1.387348, 0.620606, -0.6174887, 1, 0, 0, 1, 1,
-1.384, 0.5804703, -0.875973, 1, 0, 0, 1, 1,
-1.368397, 1.494061, 0.8791497, 1, 0, 0, 1, 1,
-1.365575, -0.07781059, -1.675453, 0, 0, 0, 1, 1,
-1.352313, -0.8517245, -2.405036, 0, 0, 0, 1, 1,
-1.351355, -0.4992056, -3.194405, 0, 0, 0, 1, 1,
-1.345174, -0.5107397, -1.648075, 0, 0, 0, 1, 1,
-1.344831, 0.5312956, -0.3666471, 0, 0, 0, 1, 1,
-1.336115, 0.5844979, -2.125627, 0, 0, 0, 1, 1,
-1.3328, 0.08940899, -1.182549, 0, 0, 0, 1, 1,
-1.32651, -0.2882387, -0.7967993, 1, 1, 1, 1, 1,
-1.323303, -0.6014925, -2.899235, 1, 1, 1, 1, 1,
-1.320364, -1.1335, -2.031534, 1, 1, 1, 1, 1,
-1.295433, -0.8166125, -1.657713, 1, 1, 1, 1, 1,
-1.291803, -0.4739641, -1.503177, 1, 1, 1, 1, 1,
-1.287242, 1.28331, -0.5889944, 1, 1, 1, 1, 1,
-1.282564, 0.7451941, -2.046029, 1, 1, 1, 1, 1,
-1.279055, -0.2647272, -3.166758, 1, 1, 1, 1, 1,
-1.25864, 0.3996452, -0.6644185, 1, 1, 1, 1, 1,
-1.242058, 0.4448229, -2.844215, 1, 1, 1, 1, 1,
-1.239824, 2.092588, 1.852667, 1, 1, 1, 1, 1,
-1.230528, -0.7886205, -3.446913, 1, 1, 1, 1, 1,
-1.226162, -1.117163, -1.559043, 1, 1, 1, 1, 1,
-1.225405, 0.5091795, -0.8235312, 1, 1, 1, 1, 1,
-1.213979, 1.7246, -1.043918, 1, 1, 1, 1, 1,
-1.209835, 1.423244, -1.741257, 0, 0, 1, 1, 1,
-1.205944, -1.360729, -3.211861, 1, 0, 0, 1, 1,
-1.198625, -1.667118, -4.39224, 1, 0, 0, 1, 1,
-1.193846, 0.9737741, -1.005858, 1, 0, 0, 1, 1,
-1.168749, -0.03585342, -2.125596, 1, 0, 0, 1, 1,
-1.165478, -0.388082, -1.159449, 1, 0, 0, 1, 1,
-1.155147, -0.1240268, -0.2238609, 0, 0, 0, 1, 1,
-1.153613, 0.04813938, -1.560405, 0, 0, 0, 1, 1,
-1.151859, -1.557548, -0.3590084, 0, 0, 0, 1, 1,
-1.151687, -0.4092495, -3.542433, 0, 0, 0, 1, 1,
-1.147346, -1.159263, -0.9097616, 0, 0, 0, 1, 1,
-1.145417, 0.4081397, -1.724339, 0, 0, 0, 1, 1,
-1.139153, 1.992143, -1.189374, 0, 0, 0, 1, 1,
-1.136904, 0.609454, -1.07411, 1, 1, 1, 1, 1,
-1.132716, 0.2720486, -2.913245, 1, 1, 1, 1, 1,
-1.132127, -1.220736, -0.581682, 1, 1, 1, 1, 1,
-1.130334, -1.225106, -2.330643, 1, 1, 1, 1, 1,
-1.130132, -0.2808741, -0.5640983, 1, 1, 1, 1, 1,
-1.127993, -0.5463188, -2.743444, 1, 1, 1, 1, 1,
-1.125317, -0.4666782, -1.717657, 1, 1, 1, 1, 1,
-1.124719, 0.2354998, 0.9790293, 1, 1, 1, 1, 1,
-1.124099, 1.400855, 0.5477102, 1, 1, 1, 1, 1,
-1.119502, 0.4547882, -2.632435, 1, 1, 1, 1, 1,
-1.107096, -0.2882497, -1.340261, 1, 1, 1, 1, 1,
-1.104511, 1.040275, -0.3585499, 1, 1, 1, 1, 1,
-1.103836, 0.933253, -1.627585, 1, 1, 1, 1, 1,
-1.094425, -1.53034, -1.993599, 1, 1, 1, 1, 1,
-1.093272, 0.8122517, -0.929746, 1, 1, 1, 1, 1,
-1.08185, -0.6731332, -2.83398, 0, 0, 1, 1, 1,
-1.076056, -0.3853029, -0.5654594, 1, 0, 0, 1, 1,
-1.072045, 1.069802, -0.58184, 1, 0, 0, 1, 1,
-1.060449, -0.5441794, -1.284818, 1, 0, 0, 1, 1,
-1.060074, 1.233157, 0.3853692, 1, 0, 0, 1, 1,
-1.047957, 1.022638, -1.19056, 1, 0, 0, 1, 1,
-1.046014, -0.2165843, -3.038915, 0, 0, 0, 1, 1,
-1.037856, -2.052387, -2.217991, 0, 0, 0, 1, 1,
-1.035471, -0.2766216, -3.019643, 0, 0, 0, 1, 1,
-1.032254, 0.2781116, -2.348206, 0, 0, 0, 1, 1,
-1.028733, 1.276856, -0.4234115, 0, 0, 0, 1, 1,
-1.024713, 0.8475654, -0.05984186, 0, 0, 0, 1, 1,
-1.023213, -0.3133764, -1.227358, 0, 0, 0, 1, 1,
-1.021416, 0.2957299, -2.386348, 1, 1, 1, 1, 1,
-1.019314, 0.7858088, 0.1892425, 1, 1, 1, 1, 1,
-1.015859, -0.5954034, -3.645321, 1, 1, 1, 1, 1,
-1.011596, -0.8781904, -1.226408, 1, 1, 1, 1, 1,
-1.011007, -0.3198366, -0.9086049, 1, 1, 1, 1, 1,
-1.008737, 0.7126344, -0.4825003, 1, 1, 1, 1, 1,
-1.000551, -0.5702883, -1.065339, 1, 1, 1, 1, 1,
-0.9966174, 1.283651, -0.8851503, 1, 1, 1, 1, 1,
-0.9873009, 0.4407875, -2.098694, 1, 1, 1, 1, 1,
-0.9842951, 0.3337311, -0.6620474, 1, 1, 1, 1, 1,
-0.9798161, -0.1499677, -0.8075823, 1, 1, 1, 1, 1,
-0.9763818, 0.5160525, -1.057452, 1, 1, 1, 1, 1,
-0.9752023, -0.7939239, -2.108182, 1, 1, 1, 1, 1,
-0.9691101, 0.0008358293, -3.141078, 1, 1, 1, 1, 1,
-0.9689825, 0.9664165, 1.414315, 1, 1, 1, 1, 1,
-0.9662166, -0.4990589, -1.848453, 0, 0, 1, 1, 1,
-0.9649248, 0.7848184, -2.373572, 1, 0, 0, 1, 1,
-0.9627591, 0.148318, -1.568236, 1, 0, 0, 1, 1,
-0.9514891, -0.09857065, -1.431216, 1, 0, 0, 1, 1,
-0.9449392, -0.7324601, -2.579983, 1, 0, 0, 1, 1,
-0.941433, 0.7901333, -0.003527078, 1, 0, 0, 1, 1,
-0.9328063, 0.2722933, -1.064128, 0, 0, 0, 1, 1,
-0.929892, 1.621481, -0.8874904, 0, 0, 0, 1, 1,
-0.9273192, -1.132168, -0.09838845, 0, 0, 0, 1, 1,
-0.9258685, 0.3135633, -1.033905, 0, 0, 0, 1, 1,
-0.9255049, -0.06642916, -1.261231, 0, 0, 0, 1, 1,
-0.9196814, 0.558894, -0.3132829, 0, 0, 0, 1, 1,
-0.913466, -0.9551175, -1.85191, 0, 0, 0, 1, 1,
-0.9094163, 0.9848864, -1.075863, 1, 1, 1, 1, 1,
-0.9029035, -0.2572951, -2.149082, 1, 1, 1, 1, 1,
-0.9010996, -0.5846473, -1.897919, 1, 1, 1, 1, 1,
-0.9009591, 0.4581496, -0.4858396, 1, 1, 1, 1, 1,
-0.8934973, -1.010391, 0.3164088, 1, 1, 1, 1, 1,
-0.8931077, -0.01574181, -1.551262, 1, 1, 1, 1, 1,
-0.892386, 0.187053, -1.756629, 1, 1, 1, 1, 1,
-0.892378, 1.939263, 0.6566137, 1, 1, 1, 1, 1,
-0.8838158, -0.1717497, 0.01773802, 1, 1, 1, 1, 1,
-0.8743927, -0.8956004, -3.783553, 1, 1, 1, 1, 1,
-0.8662251, -0.1828677, -3.362929, 1, 1, 1, 1, 1,
-0.8645694, -0.01857704, -1.239932, 1, 1, 1, 1, 1,
-0.863435, -1.409337, -2.598595, 1, 1, 1, 1, 1,
-0.8579946, -0.4507445, -1.158357, 1, 1, 1, 1, 1,
-0.8526869, -0.2229015, -2.733266, 1, 1, 1, 1, 1,
-0.8476533, -0.189233, -2.278657, 0, 0, 1, 1, 1,
-0.8463568, 0.8993855, -1.389668, 1, 0, 0, 1, 1,
-0.8446807, 0.4980846, 0.07317892, 1, 0, 0, 1, 1,
-0.8409972, -0.3779543, -1.184818, 1, 0, 0, 1, 1,
-0.8390046, -1.350567, -0.6160707, 1, 0, 0, 1, 1,
-0.83572, -0.2999364, 0.1322544, 1, 0, 0, 1, 1,
-0.8341635, 0.08281036, -2.581192, 0, 0, 0, 1, 1,
-0.8241624, 0.8441956, 0.06354373, 0, 0, 0, 1, 1,
-0.8230425, 0.2068412, -1.534337, 0, 0, 0, 1, 1,
-0.819041, 0.6829647, -0.8227593, 0, 0, 0, 1, 1,
-0.8188248, 0.3159248, -0.9043081, 0, 0, 0, 1, 1,
-0.8155581, -1.699109, -3.316984, 0, 0, 0, 1, 1,
-0.8122134, -0.4037493, -2.480951, 0, 0, 0, 1, 1,
-0.8037376, 0.5630791, -2.699479, 1, 1, 1, 1, 1,
-0.8033983, 0.3882464, -1.102292, 1, 1, 1, 1, 1,
-0.8022615, -1.020778, -1.668947, 1, 1, 1, 1, 1,
-0.7955055, -0.885662, -3.628144, 1, 1, 1, 1, 1,
-0.7917007, -0.820429, 0.195466, 1, 1, 1, 1, 1,
-0.7896648, -1.608888, -2.457666, 1, 1, 1, 1, 1,
-0.7860017, 1.309374, -0.899726, 1, 1, 1, 1, 1,
-0.7787094, 0.3172222, -0.9266558, 1, 1, 1, 1, 1,
-0.7759235, -1.251131, -3.278292, 1, 1, 1, 1, 1,
-0.7722697, -1.443592, -0.5856624, 1, 1, 1, 1, 1,
-0.7692016, -1.554139, -2.010237, 1, 1, 1, 1, 1,
-0.7659888, 1.156079, 0.3578716, 1, 1, 1, 1, 1,
-0.7653704, 0.9276078, 1.348487, 1, 1, 1, 1, 1,
-0.7636557, 0.3063004, -1.136406, 1, 1, 1, 1, 1,
-0.7606427, 1.545308, -0.03461467, 1, 1, 1, 1, 1,
-0.7598699, -0.116315, -0.6183221, 0, 0, 1, 1, 1,
-0.7574295, 1.714908, -1.558652, 1, 0, 0, 1, 1,
-0.7555958, 0.5596803, -0.08960892, 1, 0, 0, 1, 1,
-0.7554602, -1.117646, -2.51487, 1, 0, 0, 1, 1,
-0.7548077, 0.453443, -2.729801, 1, 0, 0, 1, 1,
-0.7508109, 0.1007454, -3.313909, 1, 0, 0, 1, 1,
-0.7504579, -0.9047406, -2.432156, 0, 0, 0, 1, 1,
-0.7504483, 1.356372, 0.900471, 0, 0, 0, 1, 1,
-0.7455638, -0.2839382, -2.021912, 0, 0, 0, 1, 1,
-0.7387262, 0.1852079, -0.7103549, 0, 0, 0, 1, 1,
-0.7334408, 0.8450357, -2.786377, 0, 0, 0, 1, 1,
-0.7331493, -0.8757258, -2.181899, 0, 0, 0, 1, 1,
-0.7306418, -0.4305744, -1.237048, 0, 0, 0, 1, 1,
-0.7285663, 0.5072633, -1.482512, 1, 1, 1, 1, 1,
-0.720451, 0.8590481, -1.341332, 1, 1, 1, 1, 1,
-0.7099227, -1.058729, -2.552893, 1, 1, 1, 1, 1,
-0.7064125, 1.233904, -1.695849, 1, 1, 1, 1, 1,
-0.7029527, -0.06274303, -1.574437, 1, 1, 1, 1, 1,
-0.6981862, -0.7876633, -1.273838, 1, 1, 1, 1, 1,
-0.6975403, 1.089506, 1.177735, 1, 1, 1, 1, 1,
-0.6939404, -2.149146, -4.539209, 1, 1, 1, 1, 1,
-0.6919314, -0.4071775, -2.773936, 1, 1, 1, 1, 1,
-0.6904014, 0.6008916, 0.2639968, 1, 1, 1, 1, 1,
-0.6900997, 0.4854071, -1.481623, 1, 1, 1, 1, 1,
-0.6865626, 1.125167, -0.6440511, 1, 1, 1, 1, 1,
-0.6846094, -0.2850008, -2.473434, 1, 1, 1, 1, 1,
-0.6841874, -0.5422994, -1.814571, 1, 1, 1, 1, 1,
-0.6719036, 0.3366126, -0.1257704, 1, 1, 1, 1, 1,
-0.6703839, -1.547464, -2.879704, 0, 0, 1, 1, 1,
-0.6697921, -1.386593, -2.863916, 1, 0, 0, 1, 1,
-0.6615051, -0.5676461, -3.062798, 1, 0, 0, 1, 1,
-0.6605376, -0.1312151, -1.018045, 1, 0, 0, 1, 1,
-0.6604317, 0.01668752, -1.066919, 1, 0, 0, 1, 1,
-0.6587421, -0.3822088, -1.821666, 1, 0, 0, 1, 1,
-0.6566513, -2.301906, -4.057448, 0, 0, 0, 1, 1,
-0.6544173, -0.7686495, -3.708977, 0, 0, 0, 1, 1,
-0.6521443, 0.07547057, -0.6876028, 0, 0, 0, 1, 1,
-0.6507536, -1.686329, -3.358608, 0, 0, 0, 1, 1,
-0.6506813, 0.7264196, -1.07314, 0, 0, 0, 1, 1,
-0.6445333, 0.1235765, 0.2455853, 0, 0, 0, 1, 1,
-0.6427633, -0.4919574, -2.072282, 0, 0, 0, 1, 1,
-0.641276, 1.931061, -1.158203, 1, 1, 1, 1, 1,
-0.6403694, 1.334981, -1.188366, 1, 1, 1, 1, 1,
-0.6390294, -1.552379, -2.116975, 1, 1, 1, 1, 1,
-0.6381475, 0.8839454, -1.070005, 1, 1, 1, 1, 1,
-0.632268, -0.7650531, -1.773778, 1, 1, 1, 1, 1,
-0.6264985, -1.021164, -2.504075, 1, 1, 1, 1, 1,
-0.6243663, 1.121508, -1.346196, 1, 1, 1, 1, 1,
-0.6225522, 0.1014173, -1.739159, 1, 1, 1, 1, 1,
-0.6146371, -0.2855157, -1.493503, 1, 1, 1, 1, 1,
-0.6092698, -0.5154743, -1.15212, 1, 1, 1, 1, 1,
-0.6085573, 1.41308, -0.2297918, 1, 1, 1, 1, 1,
-0.604059, -0.3329624, -1.681247, 1, 1, 1, 1, 1,
-0.6016899, 1.001964, 0.6191906, 1, 1, 1, 1, 1,
-0.5952905, 1.64332, 0.5033416, 1, 1, 1, 1, 1,
-0.5943524, 0.08254935, -0.2421209, 1, 1, 1, 1, 1,
-0.5845658, 1.672663, 2.275908, 0, 0, 1, 1, 1,
-0.5827224, -1.251209, -4.33105, 1, 0, 0, 1, 1,
-0.5744193, -0.5876295, -2.747558, 1, 0, 0, 1, 1,
-0.5737272, 0.7863286, -0.559054, 1, 0, 0, 1, 1,
-0.5723376, -1.397921, -2.293287, 1, 0, 0, 1, 1,
-0.5709118, 3.018822, 0.2927296, 1, 0, 0, 1, 1,
-0.5692311, 0.1900933, -2.9654, 0, 0, 0, 1, 1,
-0.5675552, -0.538619, -5.066058, 0, 0, 0, 1, 1,
-0.5669439, 0.751943, -0.1523875, 0, 0, 0, 1, 1,
-0.5644196, 0.1318177, -1.655886, 0, 0, 0, 1, 1,
-0.5589997, -0.5114203, -2.404049, 0, 0, 0, 1, 1,
-0.5583144, 1.636355, 0.01868059, 0, 0, 0, 1, 1,
-0.5545471, -0.05807208, -1.112641, 0, 0, 0, 1, 1,
-0.5488697, -1.270613, -1.647324, 1, 1, 1, 1, 1,
-0.5468308, -0.5327502, -1.423586, 1, 1, 1, 1, 1,
-0.5464165, -1.183416, -2.783427, 1, 1, 1, 1, 1,
-0.540687, -0.239006, -1.964266, 1, 1, 1, 1, 1,
-0.5371942, 0.06925445, -1.568151, 1, 1, 1, 1, 1,
-0.53707, 0.2811454, -1.479128, 1, 1, 1, 1, 1,
-0.5360547, -1.429513, -1.286124, 1, 1, 1, 1, 1,
-0.5347375, -0.2173658, -2.316767, 1, 1, 1, 1, 1,
-0.5311314, 0.1571471, -2.161343, 1, 1, 1, 1, 1,
-0.5301768, 0.4182829, -0.5986533, 1, 1, 1, 1, 1,
-0.5301347, 0.176058, -2.798016, 1, 1, 1, 1, 1,
-0.5268969, 0.6020671, -0.3577566, 1, 1, 1, 1, 1,
-0.5253546, -0.1276528, -3.112177, 1, 1, 1, 1, 1,
-0.525108, 0.1058135, -2.433776, 1, 1, 1, 1, 1,
-0.5239305, -0.4834348, -2.213262, 1, 1, 1, 1, 1,
-0.5219954, 0.3602024, -0.3863131, 0, 0, 1, 1, 1,
-0.5184235, 1.304848, -0.8849251, 1, 0, 0, 1, 1,
-0.5172755, 1.61287, -0.1398768, 1, 0, 0, 1, 1,
-0.5158029, -1.552981, -1.204989, 1, 0, 0, 1, 1,
-0.5127717, -0.1220148, -1.49283, 1, 0, 0, 1, 1,
-0.5123059, -0.1357099, -2.292271, 1, 0, 0, 1, 1,
-0.5108358, -0.5215573, -2.26745, 0, 0, 0, 1, 1,
-0.5105005, -0.1007177, -1.372647, 0, 0, 0, 1, 1,
-0.5091056, -1.196352, -1.469219, 0, 0, 0, 1, 1,
-0.507239, 0.1553646, -0.6955351, 0, 0, 0, 1, 1,
-0.5063412, -0.4298076, -3.624067, 0, 0, 0, 1, 1,
-0.5057024, -0.09217259, -2.929543, 0, 0, 0, 1, 1,
-0.4976259, 0.3785354, -0.1565107, 0, 0, 0, 1, 1,
-0.4967414, -0.0175117, -1.929305, 1, 1, 1, 1, 1,
-0.4960456, 1.227659, 0.2267347, 1, 1, 1, 1, 1,
-0.4933228, 2.129081, -0.3265291, 1, 1, 1, 1, 1,
-0.4890364, -1.991975, -2.279684, 1, 1, 1, 1, 1,
-0.4850697, -2.074729, -2.701114, 1, 1, 1, 1, 1,
-0.4773013, -0.3092884, -0.9660042, 1, 1, 1, 1, 1,
-0.4759168, 0.06647006, 0.4270775, 1, 1, 1, 1, 1,
-0.4745285, 0.05034007, -2.506646, 1, 1, 1, 1, 1,
-0.4745066, 0.9096419, -1.547253, 1, 1, 1, 1, 1,
-0.4675424, 0.3844606, 0.4972325, 1, 1, 1, 1, 1,
-0.4666239, 1.272812, -1.19421, 1, 1, 1, 1, 1,
-0.4655985, -0.9078032, -3.546078, 1, 1, 1, 1, 1,
-0.4636271, -0.6253716, -2.602854, 1, 1, 1, 1, 1,
-0.4613878, 0.4296561, -0.3903424, 1, 1, 1, 1, 1,
-0.4586979, 1.39165, 0.8317616, 1, 1, 1, 1, 1,
-0.458457, 0.3622687, -0.2707973, 0, 0, 1, 1, 1,
-0.4571144, 0.1784749, -2.101809, 1, 0, 0, 1, 1,
-0.4558752, -0.9946703, -2.273983, 1, 0, 0, 1, 1,
-0.4556842, -1.092716, -2.804651, 1, 0, 0, 1, 1,
-0.4527382, 0.1193816, -2.856559, 1, 0, 0, 1, 1,
-0.4516492, 0.2454213, -0.715105, 1, 0, 0, 1, 1,
-0.4487045, -0.8760442, -0.277436, 0, 0, 0, 1, 1,
-0.4440313, -0.22152, -2.007494, 0, 0, 0, 1, 1,
-0.4438757, 2.64959, 0.3236398, 0, 0, 0, 1, 1,
-0.4430948, 0.4867766, 0.961824, 0, 0, 0, 1, 1,
-0.4423012, -0.3933226, -0.715709, 0, 0, 0, 1, 1,
-0.4404739, 1.607527, -1.162579, 0, 0, 0, 1, 1,
-0.4398632, 0.7558183, 0.3397693, 0, 0, 0, 1, 1,
-0.4382412, -0.2146939, -1.314355, 1, 1, 1, 1, 1,
-0.4370121, 0.5188432, 0.8605824, 1, 1, 1, 1, 1,
-0.4365666, 0.4906351, 0.05329788, 1, 1, 1, 1, 1,
-0.4324076, 1.146171, -0.2627141, 1, 1, 1, 1, 1,
-0.4293064, 0.1281941, -0.9394688, 1, 1, 1, 1, 1,
-0.4228733, 0.5092793, 0.9492171, 1, 1, 1, 1, 1,
-0.4187074, -0.7527535, -0.5719106, 1, 1, 1, 1, 1,
-0.416973, -0.8732524, -2.838198, 1, 1, 1, 1, 1,
-0.4149084, 0.403708, 1.049179, 1, 1, 1, 1, 1,
-0.4145181, 0.5552506, 0.6760926, 1, 1, 1, 1, 1,
-0.4122186, -0.135902, -0.8769438, 1, 1, 1, 1, 1,
-0.4113324, 0.9995916, -0.5069771, 1, 1, 1, 1, 1,
-0.4108835, -0.03336153, -0.98082, 1, 1, 1, 1, 1,
-0.4090005, 0.04556361, 0.1183826, 1, 1, 1, 1, 1,
-0.4079848, -1.405403, -0.5308382, 1, 1, 1, 1, 1,
-0.4054315, -1.051554, -1.892223, 0, 0, 1, 1, 1,
-0.4038571, 1.357396, 1.13289, 1, 0, 0, 1, 1,
-0.4028581, 0.5528179, -3.130565, 1, 0, 0, 1, 1,
-0.4006378, -0.2498991, -2.852222, 1, 0, 0, 1, 1,
-0.3982642, 0.7087723, 0.3943555, 1, 0, 0, 1, 1,
-0.3977407, -1.745025, -3.031177, 1, 0, 0, 1, 1,
-0.3956933, -0.5161051, -3.356106, 0, 0, 0, 1, 1,
-0.3948973, -0.3602263, -1.433887, 0, 0, 0, 1, 1,
-0.3947974, 0.7313429, -0.9005274, 0, 0, 0, 1, 1,
-0.3897499, -1.566136, -3.991132, 0, 0, 0, 1, 1,
-0.3847916, 0.407508, -0.928299, 0, 0, 0, 1, 1,
-0.3831829, -1.099081, -2.752111, 0, 0, 0, 1, 1,
-0.3810675, 0.1871564, 0.2685097, 0, 0, 0, 1, 1,
-0.3803795, -0.7244569, -1.291845, 1, 1, 1, 1, 1,
-0.3762838, 0.6707597, -0.5460377, 1, 1, 1, 1, 1,
-0.3705632, 0.3293603, 2.418377, 1, 1, 1, 1, 1,
-0.3655465, -0.8970954, -2.674495, 1, 1, 1, 1, 1,
-0.3654685, 0.09374155, -0.3370053, 1, 1, 1, 1, 1,
-0.3649645, -0.3799324, -1.188102, 1, 1, 1, 1, 1,
-0.3595437, 1.394206, -0.270837, 1, 1, 1, 1, 1,
-0.3580818, -1.007977, -1.783043, 1, 1, 1, 1, 1,
-0.3546341, -1.214206, -3.241566, 1, 1, 1, 1, 1,
-0.3542534, 0.892728, 0.02272463, 1, 1, 1, 1, 1,
-0.3528321, -0.4185871, -2.660414, 1, 1, 1, 1, 1,
-0.3521918, -1.427384, -2.764788, 1, 1, 1, 1, 1,
-0.3505613, -0.936264, -0.9145586, 1, 1, 1, 1, 1,
-0.3501676, 1.588395, -0.3245568, 1, 1, 1, 1, 1,
-0.3498461, 0.37084, -0.5210586, 1, 1, 1, 1, 1,
-0.3483147, 0.1825352, -1.190908, 0, 0, 1, 1, 1,
-0.3479672, 1.132305, 0.05343542, 1, 0, 0, 1, 1,
-0.341725, -0.7920961, -3.684515, 1, 0, 0, 1, 1,
-0.338784, -0.07445993, -4.176905, 1, 0, 0, 1, 1,
-0.3382189, -1.739178, -4.959296, 1, 0, 0, 1, 1,
-0.3352732, -2.574306, -2.035087, 1, 0, 0, 1, 1,
-0.3340532, -0.3835324, -1.658361, 0, 0, 0, 1, 1,
-0.329747, 0.1297872, 0.2086001, 0, 0, 0, 1, 1,
-0.3215669, -0.8401344, -2.381774, 0, 0, 0, 1, 1,
-0.3195092, 0.07798696, -1.237028, 0, 0, 0, 1, 1,
-0.3137237, 0.3532329, -0.7988498, 0, 0, 0, 1, 1,
-0.3106228, 0.8889096, -0.6113132, 0, 0, 0, 1, 1,
-0.3053816, -0.5255129, -2.474862, 0, 0, 0, 1, 1,
-0.3016369, -0.2757532, -1.222625, 1, 1, 1, 1, 1,
-0.2985353, 0.5104761, 0.6684429, 1, 1, 1, 1, 1,
-0.294499, 0.9888049, 0.9717177, 1, 1, 1, 1, 1,
-0.2929015, -1.003871, -2.031323, 1, 1, 1, 1, 1,
-0.284324, -0.1913863, -2.965067, 1, 1, 1, 1, 1,
-0.2795219, 0.4856435, -0.8977877, 1, 1, 1, 1, 1,
-0.2781039, 1.210769, 0.1848032, 1, 1, 1, 1, 1,
-0.2775961, -1.618256, -3.354637, 1, 1, 1, 1, 1,
-0.2769422, 1.225647, 1.558152, 1, 1, 1, 1, 1,
-0.276406, -2.175727, -3.560068, 1, 1, 1, 1, 1,
-0.2762952, -1.754795, -3.761707, 1, 1, 1, 1, 1,
-0.275301, -0.06697192, -0.8920668, 1, 1, 1, 1, 1,
-0.2751339, 1.567723, 1.130422, 1, 1, 1, 1, 1,
-0.2734971, -0.1153024, -2.485182, 1, 1, 1, 1, 1,
-0.2724983, -0.2702245, -2.251712, 1, 1, 1, 1, 1,
-0.2706999, -0.02652144, 0.3227186, 0, 0, 1, 1, 1,
-0.2703225, 0.7500225, -0.6994994, 1, 0, 0, 1, 1,
-0.2665937, 0.7575628, 2.503812, 1, 0, 0, 1, 1,
-0.2645334, 0.03414911, -2.087874, 1, 0, 0, 1, 1,
-0.2609647, -1.868031, -2.709231, 1, 0, 0, 1, 1,
-0.2551338, 2.175929, 0.04115776, 1, 0, 0, 1, 1,
-0.2546344, 0.4024964, -0.1459258, 0, 0, 0, 1, 1,
-0.2531734, 1.825847, -1.140735, 0, 0, 0, 1, 1,
-0.2486576, 1.180606, 0.4302142, 0, 0, 0, 1, 1,
-0.2436371, 0.4782846, 0.7041168, 0, 0, 0, 1, 1,
-0.2413563, 0.7601055, -0.2434578, 0, 0, 0, 1, 1,
-0.2397163, 0.6798381, -1.519083, 0, 0, 0, 1, 1,
-0.2386477, -1.134449, -3.702036, 0, 0, 0, 1, 1,
-0.2364449, -0.9474869, -2.629138, 1, 1, 1, 1, 1,
-0.2316124, -0.5319794, -2.33239, 1, 1, 1, 1, 1,
-0.2276283, 0.2275736, -2.924067, 1, 1, 1, 1, 1,
-0.2215656, 0.9847693, -3.214678, 1, 1, 1, 1, 1,
-0.2203638, 0.9225758, 0.724456, 1, 1, 1, 1, 1,
-0.2185214, -0.6913075, -4.820034, 1, 1, 1, 1, 1,
-0.2177535, 0.04808004, 0.03053253, 1, 1, 1, 1, 1,
-0.2162561, -1.469481, -2.3265, 1, 1, 1, 1, 1,
-0.2157298, 0.2182775, -0.7195998, 1, 1, 1, 1, 1,
-0.2149666, 1.188232, 0.1612135, 1, 1, 1, 1, 1,
-0.2135268, 1.41448, -0.3481205, 1, 1, 1, 1, 1,
-0.212109, -1.038871, -3.176529, 1, 1, 1, 1, 1,
-0.2114126, 0.9165357, 1.384182, 1, 1, 1, 1, 1,
-0.2106686, -0.6253176, -2.503776, 1, 1, 1, 1, 1,
-0.2101778, -0.5174881, -2.434548, 1, 1, 1, 1, 1,
-0.2061606, -2.663252, -3.082327, 0, 0, 1, 1, 1,
-0.203839, 0.9024153, -1.729357, 1, 0, 0, 1, 1,
-0.1992351, 0.326814, 0.3497065, 1, 0, 0, 1, 1,
-0.1981759, 2.136897, -2.609486, 1, 0, 0, 1, 1,
-0.1959891, 1.279682, 0.5487027, 1, 0, 0, 1, 1,
-0.1939382, 0.8868496, -0.5692576, 1, 0, 0, 1, 1,
-0.184005, 1.878976, 0.5546188, 0, 0, 0, 1, 1,
-0.1810494, -0.3880356, -2.811442, 0, 0, 0, 1, 1,
-0.1792589, 0.9668486, -0.002639896, 0, 0, 0, 1, 1,
-0.1781668, 0.3162867, -0.9735135, 0, 0, 0, 1, 1,
-0.1736885, -0.9924325, -2.787102, 0, 0, 0, 1, 1,
-0.1676187, 2.209678, 0.966385, 0, 0, 0, 1, 1,
-0.1661424, -1.185308, -2.275627, 0, 0, 0, 1, 1,
-0.1617645, 0.01544428, -0.5272137, 1, 1, 1, 1, 1,
-0.161711, -1.437195, -2.636909, 1, 1, 1, 1, 1,
-0.1609491, 0.3715881, -1.580692, 1, 1, 1, 1, 1,
-0.1582691, 0.9693584, -1.915632, 1, 1, 1, 1, 1,
-0.1562529, 0.05917434, -2.291168, 1, 1, 1, 1, 1,
-0.1529876, 2.105489, -0.4694107, 1, 1, 1, 1, 1,
-0.152626, 1.573934, -0.2450719, 1, 1, 1, 1, 1,
-0.1406474, 0.9174664, -0.7104574, 1, 1, 1, 1, 1,
-0.1364618, 1.041947, -0.5944243, 1, 1, 1, 1, 1,
-0.1300109, -0.5547426, -4.543404, 1, 1, 1, 1, 1,
-0.1298596, 0.4777085, -1.288569, 1, 1, 1, 1, 1,
-0.1295899, -0.531025, -1.828224, 1, 1, 1, 1, 1,
-0.127977, 1.518163, 0.9371068, 1, 1, 1, 1, 1,
-0.127183, -1.079432, -4.24601, 1, 1, 1, 1, 1,
-0.1267595, -1.566812, -1.000903, 1, 1, 1, 1, 1,
-0.1254538, 1.26585, -0.2748296, 0, 0, 1, 1, 1,
-0.1246042, -1.289504, -3.961029, 1, 0, 0, 1, 1,
-0.1226511, -0.6506739, -2.450916, 1, 0, 0, 1, 1,
-0.1215695, -0.8133618, -2.144162, 1, 0, 0, 1, 1,
-0.1183447, 0.8319399, 1.1793, 1, 0, 0, 1, 1,
-0.1179336, 0.4065453, -2.372323, 1, 0, 0, 1, 1,
-0.1128619, 0.01800755, -2.146138, 0, 0, 0, 1, 1,
-0.1068273, -0.6432109, -3.060072, 0, 0, 0, 1, 1,
-0.1061528, -0.1485566, -1.426868, 0, 0, 0, 1, 1,
-0.1040717, 0.6962242, -1.070958, 0, 0, 0, 1, 1,
-0.09983071, 1.106017, -1.257735, 0, 0, 0, 1, 1,
-0.0974833, -0.7122111, -4.044431, 0, 0, 0, 1, 1,
-0.09377342, 0.7801373, -0.3438503, 0, 0, 0, 1, 1,
-0.09350356, -0.3473663, -2.671936, 1, 1, 1, 1, 1,
-0.08662058, 2.833527, -0.4568157, 1, 1, 1, 1, 1,
-0.08643822, -1.909874, -4.081892, 1, 1, 1, 1, 1,
-0.08248843, 1.202077, -1.136462, 1, 1, 1, 1, 1,
-0.08225795, -0.3382722, -2.245677, 1, 1, 1, 1, 1,
-0.08114695, -1.667136, -4.138687, 1, 1, 1, 1, 1,
-0.08046503, 0.1729523, -1.222823, 1, 1, 1, 1, 1,
-0.07821289, -1.014165, -1.687545, 1, 1, 1, 1, 1,
-0.07799514, 0.3520441, 0.8219036, 1, 1, 1, 1, 1,
-0.07723952, 0.08598023, 0.4937223, 1, 1, 1, 1, 1,
-0.07617221, 0.2604356, -1.121533, 1, 1, 1, 1, 1,
-0.07426824, 0.3740432, -0.5808553, 1, 1, 1, 1, 1,
-0.07146184, 2.263906, 0.06213749, 1, 1, 1, 1, 1,
-0.06988733, -1.379501, -3.305809, 1, 1, 1, 1, 1,
-0.06899321, -1.842604, -3.681546, 1, 1, 1, 1, 1,
-0.06651907, -1.410321, -2.020853, 0, 0, 1, 1, 1,
-0.06398085, 1.171906, -0.4561949, 1, 0, 0, 1, 1,
-0.05472835, 0.780201, 1.475772, 1, 0, 0, 1, 1,
-0.04800066, -0.7327265, -2.722696, 1, 0, 0, 1, 1,
-0.0452466, -1.212642, -1.181796, 1, 0, 0, 1, 1,
-0.04392917, -0.1104359, -3.806044, 1, 0, 0, 1, 1,
-0.04120028, -0.06887492, -2.21601, 0, 0, 0, 1, 1,
-0.04099083, 1.327406, -1.431838, 0, 0, 0, 1, 1,
-0.03921349, -2.289793, -2.84899, 0, 0, 0, 1, 1,
-0.03805073, -0.9660221, -3.115096, 0, 0, 0, 1, 1,
-0.03530581, -0.8470157, -4.040452, 0, 0, 0, 1, 1,
-0.03334254, 0.4042335, -0.3997697, 0, 0, 0, 1, 1,
-0.02630728, 1.514947, 2.064145, 0, 0, 0, 1, 1,
-0.02107472, -1.217294, -2.479775, 1, 1, 1, 1, 1,
-0.01793621, 1.662803, -0.9515976, 1, 1, 1, 1, 1,
-0.01175217, -0.9187624, -3.110986, 1, 1, 1, 1, 1,
-0.01139018, -0.02555179, -3.571673, 1, 1, 1, 1, 1,
-0.01113192, -0.8340508, -4.728541, 1, 1, 1, 1, 1,
-0.01013877, -1.056393, -3.275319, 1, 1, 1, 1, 1,
-0.009770566, -0.5485205, -2.396123, 1, 1, 1, 1, 1,
-0.009425861, 1.065459, 1.769339, 1, 1, 1, 1, 1,
-0.009047928, 0.4842412, 0.7174235, 1, 1, 1, 1, 1,
-0.008669192, 1.48496, 0.374528, 1, 1, 1, 1, 1,
-0.008409991, 0.4304525, -0.2083352, 1, 1, 1, 1, 1,
-0.00479126, 1.511327, 2.060075, 1, 1, 1, 1, 1,
-0.002215303, 0.6019793, -0.9566696, 1, 1, 1, 1, 1,
0.00206168, -0.3982005, 2.317615, 1, 1, 1, 1, 1,
0.007723588, 0.4777232, 0.5618288, 1, 1, 1, 1, 1,
0.009143979, -0.1331223, 3.345239, 0, 0, 1, 1, 1,
0.01122489, -0.1716125, 3.718393, 1, 0, 0, 1, 1,
0.01348686, -0.4411412, 1.567494, 1, 0, 0, 1, 1,
0.01936394, 0.8716261, 2.136498, 1, 0, 0, 1, 1,
0.02281108, 2.165109, -0.002182798, 1, 0, 0, 1, 1,
0.02304522, -1.107111, 2.669739, 1, 0, 0, 1, 1,
0.02468413, -1.312954, 4.61372, 0, 0, 0, 1, 1,
0.02789037, 0.3490139, 0.9408055, 0, 0, 0, 1, 1,
0.02816716, 0.6412768, 0.4735775, 0, 0, 0, 1, 1,
0.02905536, -1.696398, 3.760701, 0, 0, 0, 1, 1,
0.03024145, 0.7202916, 2.17451, 0, 0, 0, 1, 1,
0.03196051, 1.153672, -0.195482, 0, 0, 0, 1, 1,
0.04057427, -1.116834, 3.764749, 0, 0, 0, 1, 1,
0.04328916, -0.3270205, 4.053357, 1, 1, 1, 1, 1,
0.04524915, 0.6732793, 0.3086365, 1, 1, 1, 1, 1,
0.04741311, -2.930362, 2.003262, 1, 1, 1, 1, 1,
0.04798278, -1.182585, 0.5584712, 1, 1, 1, 1, 1,
0.05306449, -0.461792, 2.239349, 1, 1, 1, 1, 1,
0.05876337, -0.2656523, 2.701266, 1, 1, 1, 1, 1,
0.06237246, 0.3337976, 0.3433441, 1, 1, 1, 1, 1,
0.0628898, 0.6893399, 0.3036406, 1, 1, 1, 1, 1,
0.06918556, 1.094779, 0.6286692, 1, 1, 1, 1, 1,
0.06924517, 0.3681077, -1.137688, 1, 1, 1, 1, 1,
0.0694669, -0.02326448, 0.6705284, 1, 1, 1, 1, 1,
0.07121972, -0.9105783, 2.529111, 1, 1, 1, 1, 1,
0.07593235, -0.4035237, 4.397226, 1, 1, 1, 1, 1,
0.07977669, 0.4004993, 0.5913848, 1, 1, 1, 1, 1,
0.08184806, -0.1455868, 2.727216, 1, 1, 1, 1, 1,
0.08446602, 0.1895991, -1.022765, 0, 0, 1, 1, 1,
0.09166756, 1.387227, 0.3239551, 1, 0, 0, 1, 1,
0.09887579, 0.9382459, -0.4536532, 1, 0, 0, 1, 1,
0.1000716, 2.772617, 1.68475, 1, 0, 0, 1, 1,
0.1001946, -0.2761064, 2.726716, 1, 0, 0, 1, 1,
0.102576, -0.3639352, 2.447176, 1, 0, 0, 1, 1,
0.1041352, 0.8341129, 0.08287819, 0, 0, 0, 1, 1,
0.1075947, 1.0768, -0.3794788, 0, 0, 0, 1, 1,
0.1099838, 0.7153197, -0.8969109, 0, 0, 0, 1, 1,
0.1119484, 0.7219523, -0.8154461, 0, 0, 0, 1, 1,
0.1177737, -0.01491119, 1.135167, 0, 0, 0, 1, 1,
0.1211775, 0.5139737, 0.5167893, 0, 0, 0, 1, 1,
0.1216827, -1.197269, 4.81345, 0, 0, 0, 1, 1,
0.1229036, 1.391999, -0.3360131, 1, 1, 1, 1, 1,
0.1252152, 0.1932368, 0.9163263, 1, 1, 1, 1, 1,
0.1261836, -1.144531, 1.807561, 1, 1, 1, 1, 1,
0.1292545, -0.5050679, 1.763107, 1, 1, 1, 1, 1,
0.1317049, 0.05667382, 0.4659835, 1, 1, 1, 1, 1,
0.133974, 1.090553, 1.870533, 1, 1, 1, 1, 1,
0.1373621, 1.750459, -0.199971, 1, 1, 1, 1, 1,
0.1420298, -0.3061179, 2.171171, 1, 1, 1, 1, 1,
0.1424453, -0.6183088, 2.020223, 1, 1, 1, 1, 1,
0.1426463, -1.489438, 2.406006, 1, 1, 1, 1, 1,
0.1474825, -0.2362386, 1.428903, 1, 1, 1, 1, 1,
0.1483055, -1.576773, 2.676872, 1, 1, 1, 1, 1,
0.1483072, -0.5737925, 3.02635, 1, 1, 1, 1, 1,
0.1484158, 1.061298, -0.6398975, 1, 1, 1, 1, 1,
0.1537643, -0.5228708, 2.499405, 1, 1, 1, 1, 1,
0.1542596, -0.1367892, 1.245425, 0, 0, 1, 1, 1,
0.157277, -1.683272, 2.956429, 1, 0, 0, 1, 1,
0.1608282, -0.01379107, 0.4578027, 1, 0, 0, 1, 1,
0.1613434, -0.528818, 2.889589, 1, 0, 0, 1, 1,
0.1635597, -0.336371, 2.478924, 1, 0, 0, 1, 1,
0.1640334, 0.8848697, -0.01171761, 1, 0, 0, 1, 1,
0.1652362, 0.5528466, 0.5005093, 0, 0, 0, 1, 1,
0.166523, -0.6563354, 2.254198, 0, 0, 0, 1, 1,
0.1674447, 1.609696, 0.629509, 0, 0, 0, 1, 1,
0.1680352, -1.472633, 3.999264, 0, 0, 0, 1, 1,
0.1704261, 0.4321238, 2.016109, 0, 0, 0, 1, 1,
0.1744719, -1.832897, 4.43929, 0, 0, 0, 1, 1,
0.174776, -1.327408, 2.651983, 0, 0, 0, 1, 1,
0.1757087, 0.2704977, 0.4730397, 1, 1, 1, 1, 1,
0.1777711, 1.026639, 0.2968529, 1, 1, 1, 1, 1,
0.1789812, 1.073673, 0.3898144, 1, 1, 1, 1, 1,
0.1793757, -0.7936879, 1.928606, 1, 1, 1, 1, 1,
0.1795094, -2.65683, 1.603288, 1, 1, 1, 1, 1,
0.1825448, -1.363513, 2.638515, 1, 1, 1, 1, 1,
0.1837938, 2.318237, -0.2268247, 1, 1, 1, 1, 1,
0.1844569, 1.388906, 2.06577, 1, 1, 1, 1, 1,
0.1881087, -1.16699, 2.285273, 1, 1, 1, 1, 1,
0.1915525, 0.9696328, 0.2171285, 1, 1, 1, 1, 1,
0.2055208, -0.2032181, 1.739859, 1, 1, 1, 1, 1,
0.2226097, 2.509311, 0.5273712, 1, 1, 1, 1, 1,
0.2306175, 0.5401108, 2.059518, 1, 1, 1, 1, 1,
0.2378622, -0.6247937, 1.857829, 1, 1, 1, 1, 1,
0.2386962, 1.276542, -0.6209773, 1, 1, 1, 1, 1,
0.2415169, -1.268674, 2.344723, 0, 0, 1, 1, 1,
0.2424826, 1.203151, 0.9327253, 1, 0, 0, 1, 1,
0.2439347, 0.5176221, -0.4825391, 1, 0, 0, 1, 1,
0.2440786, 0.3298156, 0.1342973, 1, 0, 0, 1, 1,
0.244769, -0.2153026, 1.466827, 1, 0, 0, 1, 1,
0.2450013, 0.5163891, -0.3522369, 1, 0, 0, 1, 1,
0.2454295, -0.2383955, 1.317418, 0, 0, 0, 1, 1,
0.2459072, 0.1915653, 0.8345536, 0, 0, 0, 1, 1,
0.2459883, -0.2758809, 2.274248, 0, 0, 0, 1, 1,
0.2462969, 0.3043507, 1.639244, 0, 0, 0, 1, 1,
0.2469081, 0.2121259, 0.02569718, 0, 0, 0, 1, 1,
0.250471, 0.2691514, 0.5534739, 0, 0, 0, 1, 1,
0.2521428, 0.1667124, 0.7626719, 0, 0, 0, 1, 1,
0.2549859, -0.479238, 2.632439, 1, 1, 1, 1, 1,
0.2555004, 1.816716, 1.069254, 1, 1, 1, 1, 1,
0.2588024, -1.149624, 2.938027, 1, 1, 1, 1, 1,
0.2588703, 0.6578358, 0.02644932, 1, 1, 1, 1, 1,
0.2600451, -1.754444, 3.834448, 1, 1, 1, 1, 1,
0.260727, -1.637409, 4.061137, 1, 1, 1, 1, 1,
0.2631966, 0.7907298, -0.1470826, 1, 1, 1, 1, 1,
0.2645088, 1.231573, -0.01453102, 1, 1, 1, 1, 1,
0.2682193, -0.460316, 3.158619, 1, 1, 1, 1, 1,
0.2689173, 0.05518306, 2.486869, 1, 1, 1, 1, 1,
0.2706896, 0.8486944, 1.777292, 1, 1, 1, 1, 1,
0.2707701, 1.074363, -0.08933876, 1, 1, 1, 1, 1,
0.2718698, 0.7465879, -0.9497854, 1, 1, 1, 1, 1,
0.2727423, -1.551996, 2.759818, 1, 1, 1, 1, 1,
0.2727841, 0.1556656, 1.580057, 1, 1, 1, 1, 1,
0.2773507, -0.7669709, 0.7722262, 0, 0, 1, 1, 1,
0.2797941, 0.6719937, 1.226251, 1, 0, 0, 1, 1,
0.282767, -1.863254, 3.9895, 1, 0, 0, 1, 1,
0.2830546, -1.258659, 2.425989, 1, 0, 0, 1, 1,
0.2833084, 0.6365309, 0.3021232, 1, 0, 0, 1, 1,
0.2862208, -1.062998, 2.855592, 1, 0, 0, 1, 1,
0.2866014, -0.002484045, 1.175232, 0, 0, 0, 1, 1,
0.2879203, 1.459733, 1.13637, 0, 0, 0, 1, 1,
0.288053, 0.2479094, -0.1049941, 0, 0, 0, 1, 1,
0.2885157, -2.02636, 1.103482, 0, 0, 0, 1, 1,
0.290144, 0.9813867, 1.125934, 0, 0, 0, 1, 1,
0.2930194, 0.03666671, 0.7444422, 0, 0, 0, 1, 1,
0.2951613, 2.010576, -1.402937, 0, 0, 0, 1, 1,
0.2957621, -0.8120552, 3.145778, 1, 1, 1, 1, 1,
0.3089453, 1.763431, 0.5490867, 1, 1, 1, 1, 1,
0.312021, 0.1386333, 1.958155, 1, 1, 1, 1, 1,
0.3128736, 1.055383, -0.2328511, 1, 1, 1, 1, 1,
0.3244124, 1.743511, 1.289898, 1, 1, 1, 1, 1,
0.3273264, -0.4683793, 3.017527, 1, 1, 1, 1, 1,
0.3379688, -0.5182449, 3.128447, 1, 1, 1, 1, 1,
0.3449728, 0.6837735, -0.7569992, 1, 1, 1, 1, 1,
0.3476742, -0.5599357, 2.580666, 1, 1, 1, 1, 1,
0.3485318, 0.8624359, 3.114444, 1, 1, 1, 1, 1,
0.3550656, 0.6168264, 0.5823466, 1, 1, 1, 1, 1,
0.357272, 0.6314445, -1.083254, 1, 1, 1, 1, 1,
0.3684444, 0.4541334, 0.7082089, 1, 1, 1, 1, 1,
0.3705176, -1.278699, 2.57427, 1, 1, 1, 1, 1,
0.3717844, -0.1074518, 1.614093, 1, 1, 1, 1, 1,
0.3722507, 0.8412781, -0.6606091, 0, 0, 1, 1, 1,
0.373206, 0.5814443, -0.06013754, 1, 0, 0, 1, 1,
0.3785284, -0.120519, 1.755292, 1, 0, 0, 1, 1,
0.3785929, -1.145761, 2.704926, 1, 0, 0, 1, 1,
0.3787662, -1.228032, 3.833503, 1, 0, 0, 1, 1,
0.3791682, 0.9581577, -0.5070534, 1, 0, 0, 1, 1,
0.3937215, -0.4449381, 0.8045224, 0, 0, 0, 1, 1,
0.3961662, -0.2759041, 2.687674, 0, 0, 0, 1, 1,
0.4030899, -0.8202695, 1.897817, 0, 0, 0, 1, 1,
0.4039752, -0.5227383, 1.191387, 0, 0, 0, 1, 1,
0.4050628, 0.1620668, 1.918051, 0, 0, 0, 1, 1,
0.4094935, -1.471207, 2.166913, 0, 0, 0, 1, 1,
0.411828, -0.2811384, 2.542434, 0, 0, 0, 1, 1,
0.4156273, -0.1397971, 2.605831, 1, 1, 1, 1, 1,
0.416319, 0.1008393, 1.037294, 1, 1, 1, 1, 1,
0.420345, 1.097433, -0.6921421, 1, 1, 1, 1, 1,
0.424902, -1.434391, 2.562634, 1, 1, 1, 1, 1,
0.4396479, -0.08748017, 2.196622, 1, 1, 1, 1, 1,
0.4416458, -0.3959949, 3.46096, 1, 1, 1, 1, 1,
0.4489719, 0.9055436, -0.3609694, 1, 1, 1, 1, 1,
0.4551394, 1.593075, 1.234553, 1, 1, 1, 1, 1,
0.4562904, 1.085998, 0.9130583, 1, 1, 1, 1, 1,
0.4580809, -0.7566804, 2.795481, 1, 1, 1, 1, 1,
0.4603991, 0.9633383, 0.9599735, 1, 1, 1, 1, 1,
0.4618956, 0.148147, 0.8637683, 1, 1, 1, 1, 1,
0.4633427, 1.807994, -0.1238239, 1, 1, 1, 1, 1,
0.4649242, -1.888098, 3.127953, 1, 1, 1, 1, 1,
0.4712758, -0.0712788, 0.9338133, 1, 1, 1, 1, 1,
0.4714552, 0.2861794, 1.551722, 0, 0, 1, 1, 1,
0.4735736, 0.1802801, -0.1836187, 1, 0, 0, 1, 1,
0.4744911, 1.711843, 0.2605458, 1, 0, 0, 1, 1,
0.4828591, -0.9185925, 2.533321, 1, 0, 0, 1, 1,
0.4845852, -0.01197051, 2.409909, 1, 0, 0, 1, 1,
0.5008124, -0.1161673, 1.795841, 1, 0, 0, 1, 1,
0.5008235, -1.083918, 3.305184, 0, 0, 0, 1, 1,
0.5020934, -0.4359815, 3.720655, 0, 0, 0, 1, 1,
0.5027957, 0.719925, -0.6067203, 0, 0, 0, 1, 1,
0.5044394, -0.09627832, 1.161983, 0, 0, 0, 1, 1,
0.5055624, 0.6242253, 0.9221424, 0, 0, 0, 1, 1,
0.5079502, 1.77099, -0.6395115, 0, 0, 0, 1, 1,
0.5088595, 1.370139, 1.17081, 0, 0, 0, 1, 1,
0.5090563, -0.1009516, 2.551339, 1, 1, 1, 1, 1,
0.510017, 0.7615016, -0.9798068, 1, 1, 1, 1, 1,
0.5127917, -0.2343789, 3.908598, 1, 1, 1, 1, 1,
0.5138232, -0.4485411, 3.254526, 1, 1, 1, 1, 1,
0.5145176, 1.195326, -0.3577002, 1, 1, 1, 1, 1,
0.5152277, -1.641029, 5.638603, 1, 1, 1, 1, 1,
0.5264912, -0.1532617, 1.156367, 1, 1, 1, 1, 1,
0.5342256, 0.08008533, -0.1423878, 1, 1, 1, 1, 1,
0.5360585, 1.502676, 1.64398, 1, 1, 1, 1, 1,
0.5466463, -0.9418237, 1.117531, 1, 1, 1, 1, 1,
0.5501738, 0.7619511, -0.5976697, 1, 1, 1, 1, 1,
0.5508066, -1.131664, 1.149459, 1, 1, 1, 1, 1,
0.5536442, -0.3266303, 1.188273, 1, 1, 1, 1, 1,
0.5545605, 0.08491907, 0.8445476, 1, 1, 1, 1, 1,
0.5615528, -0.742191, 2.773253, 1, 1, 1, 1, 1,
0.5679853, -0.4161543, 2.30066, 0, 0, 1, 1, 1,
0.5688514, -0.8509085, 3.463386, 1, 0, 0, 1, 1,
0.5706274, 0.4064453, 0.00433456, 1, 0, 0, 1, 1,
0.5729369, 0.3149605, 2.933141, 1, 0, 0, 1, 1,
0.5732316, -0.2236507, 1.754715, 1, 0, 0, 1, 1,
0.5733811, 1.227419, -0.456139, 1, 0, 0, 1, 1,
0.5879744, 0.409386, 0.2748145, 0, 0, 0, 1, 1,
0.5921824, 0.9295048, 1.92702, 0, 0, 0, 1, 1,
0.5941979, -2.146095, 2.820616, 0, 0, 0, 1, 1,
0.5945413, -1.332146, 3.550426, 0, 0, 0, 1, 1,
0.5956875, 1.026556, 1.597057, 0, 0, 0, 1, 1,
0.6038446, -0.6269948, 1.626549, 0, 0, 0, 1, 1,
0.6086906, 0.05484159, 1.776942, 0, 0, 0, 1, 1,
0.6104203, 0.1535536, 0.2344981, 1, 1, 1, 1, 1,
0.6128324, -0.5544093, 4.019618, 1, 1, 1, 1, 1,
0.616154, 0.07716016, -0.2871492, 1, 1, 1, 1, 1,
0.6244247, -1.281065, 3.49497, 1, 1, 1, 1, 1,
0.6273668, 1.319579, 0.553619, 1, 1, 1, 1, 1,
0.6308084, 0.741863, 0.4623775, 1, 1, 1, 1, 1,
0.6322532, 0.7359619, 0.1032774, 1, 1, 1, 1, 1,
0.6363155, 0.8876263, 0.3352619, 1, 1, 1, 1, 1,
0.6463682, 0.9544446, 0.6138383, 1, 1, 1, 1, 1,
0.647889, -0.6520485, 2.744891, 1, 1, 1, 1, 1,
0.6525372, -0.5757948, 1.411651, 1, 1, 1, 1, 1,
0.653895, -1.255018, 2.051215, 1, 1, 1, 1, 1,
0.6544251, -0.243948, 1.581133, 1, 1, 1, 1, 1,
0.6549445, 0.4700957, -0.3502133, 1, 1, 1, 1, 1,
0.6556634, 0.2719464, 0.150242, 1, 1, 1, 1, 1,
0.6572435, 0.8522289, -1.243193, 0, 0, 1, 1, 1,
0.6576927, -0.7737097, 3.879617, 1, 0, 0, 1, 1,
0.6593447, 0.7269129, 1.417668, 1, 0, 0, 1, 1,
0.6597825, 0.9238848, -0.1232241, 1, 0, 0, 1, 1,
0.6604968, -0.6612967, 3.044915, 1, 0, 0, 1, 1,
0.6661589, 1.056891, 0.7124856, 1, 0, 0, 1, 1,
0.6673635, 0.2385208, 0.6668072, 0, 0, 0, 1, 1,
0.6694438, 0.5165783, 0.3417987, 0, 0, 0, 1, 1,
0.675829, 0.50891, 1.248114, 0, 0, 0, 1, 1,
0.6764624, 0.6677297, 1.121486, 0, 0, 0, 1, 1,
0.6767206, 1.137401, 1.326663, 0, 0, 0, 1, 1,
0.6817805, -1.151383, 1.47642, 0, 0, 0, 1, 1,
0.6819741, 1.061292, 0.9995456, 0, 0, 0, 1, 1,
0.683239, -2.340164, 3.141911, 1, 1, 1, 1, 1,
0.68526, 0.1421274, 1.261341, 1, 1, 1, 1, 1,
0.691067, -0.0464176, 2.668785, 1, 1, 1, 1, 1,
0.6948919, 0.3244008, 0.4392658, 1, 1, 1, 1, 1,
0.6998529, -2.125573, 3.359335, 1, 1, 1, 1, 1,
0.6999817, 1.100927, -0.3247553, 1, 1, 1, 1, 1,
0.7004654, 0.5838832, 1.036733, 1, 1, 1, 1, 1,
0.7039534, 0.200365, -0.4119006, 1, 1, 1, 1, 1,
0.7069011, 2.693839, -0.7453923, 1, 1, 1, 1, 1,
0.7075981, 0.2857454, 0.4121123, 1, 1, 1, 1, 1,
0.71455, 0.861504, 0.6406822, 1, 1, 1, 1, 1,
0.7203338, -1.025767, 3.129615, 1, 1, 1, 1, 1,
0.7236941, -0.6199416, 2.129248, 1, 1, 1, 1, 1,
0.7328519, 0.4205725, 2.471998, 1, 1, 1, 1, 1,
0.7409685, -0.06129858, 3.193224, 1, 1, 1, 1, 1,
0.7442626, -0.9560471, 2.358957, 0, 0, 1, 1, 1,
0.7444788, -1.764347, 2.611834, 1, 0, 0, 1, 1,
0.7487991, -1.296516, 3.1046, 1, 0, 0, 1, 1,
0.7543752, -0.9925119, 3.983945, 1, 0, 0, 1, 1,
0.7586643, -0.5375674, 0.9907048, 1, 0, 0, 1, 1,
0.7636449, -0.3206889, 2.519515, 1, 0, 0, 1, 1,
0.7662419, 0.02657306, 0.9158864, 0, 0, 0, 1, 1,
0.7685707, 0.6635816, 1.071312, 0, 0, 0, 1, 1,
0.7703169, 0.401746, 2.183459, 0, 0, 0, 1, 1,
0.7717286, -1.20834, 1.540917, 0, 0, 0, 1, 1,
0.7732802, -0.8188822, 2.847292, 0, 0, 0, 1, 1,
0.7841045, -0.4414693, 1.953594, 0, 0, 0, 1, 1,
0.7924523, 0.08410531, 1.90799, 0, 0, 0, 1, 1,
0.7967702, 0.4581223, 1.854669, 1, 1, 1, 1, 1,
0.7971534, 0.182872, 0.4626159, 1, 1, 1, 1, 1,
0.8034515, 0.1279738, 3.175942, 1, 1, 1, 1, 1,
0.8082685, -0.3544175, 3.27603, 1, 1, 1, 1, 1,
0.8083682, 2.518609, 1.723398, 1, 1, 1, 1, 1,
0.814429, -1.111262, -0.4052963, 1, 1, 1, 1, 1,
0.8157427, 2.650866, 0.328344, 1, 1, 1, 1, 1,
0.8212599, -0.1101693, 0.5387598, 1, 1, 1, 1, 1,
0.8221212, 0.4068134, 0.8198909, 1, 1, 1, 1, 1,
0.825552, 0.5804035, 0.04422703, 1, 1, 1, 1, 1,
0.8298829, -1.320109, 1.992549, 1, 1, 1, 1, 1,
0.8313732, 0.8584988, 0.02133888, 1, 1, 1, 1, 1,
0.8318925, -1.124405, 2.481803, 1, 1, 1, 1, 1,
0.8397596, -0.469422, 0.4892407, 1, 1, 1, 1, 1,
0.8441954, -0.3518414, 0.2425733, 1, 1, 1, 1, 1,
0.8480229, -1.237591, 3.273817, 0, 0, 1, 1, 1,
0.8502504, 0.6010125, 0.1770311, 1, 0, 0, 1, 1,
0.853372, -0.07126182, 0.574398, 1, 0, 0, 1, 1,
0.8573917, 0.9436361, 0.8479537, 1, 0, 0, 1, 1,
0.8607354, -0.3082487, 3.473692, 1, 0, 0, 1, 1,
0.8611273, 1.571247, 0.8245674, 1, 0, 0, 1, 1,
0.8659242, -0.02215678, 1.88332, 0, 0, 0, 1, 1,
0.8672834, 0.5214255, 2.528778, 0, 0, 0, 1, 1,
0.8674436, -0.09167348, 1.895033, 0, 0, 0, 1, 1,
0.8701846, -2.79411, 3.418085, 0, 0, 0, 1, 1,
0.875551, 1.350964, -0.009584665, 0, 0, 0, 1, 1,
0.8765799, 1.595343, -0.1098225, 0, 0, 0, 1, 1,
0.8767369, -0.6580611, 0.2400881, 0, 0, 0, 1, 1,
0.8838081, 1.065555, 0.9383687, 1, 1, 1, 1, 1,
0.8891109, 1.311021, 0.9298875, 1, 1, 1, 1, 1,
0.9006125, -0.3808385, 4.040843, 1, 1, 1, 1, 1,
0.9052016, 0.4982509, 1.814134, 1, 1, 1, 1, 1,
0.9085803, -0.1279964, 2.467105, 1, 1, 1, 1, 1,
0.9096084, -0.422643, 3.159541, 1, 1, 1, 1, 1,
0.9151357, -0.8825369, 2.476649, 1, 1, 1, 1, 1,
0.9170995, 0.4064957, 2.398812, 1, 1, 1, 1, 1,
0.9184063, 0.4529384, 1.612061, 1, 1, 1, 1, 1,
0.9186072, -1.468133, 3.200061, 1, 1, 1, 1, 1,
0.9191875, -0.7422876, 2.501026, 1, 1, 1, 1, 1,
0.9280671, -1.763435, 2.315789, 1, 1, 1, 1, 1,
0.9335088, -0.8804823, 1.037133, 1, 1, 1, 1, 1,
0.9357523, -0.9434009, 1.752254, 1, 1, 1, 1, 1,
0.9371772, -0.4391918, 2.504557, 1, 1, 1, 1, 1,
0.9379798, 0.7869806, 0.5540568, 0, 0, 1, 1, 1,
0.9469008, 1.305222, 0.6753954, 1, 0, 0, 1, 1,
0.9530989, -0.1874405, 2.8303, 1, 0, 0, 1, 1,
0.9563283, 0.03203254, 1.232529, 1, 0, 0, 1, 1,
0.962146, -1.115542, 2.090097, 1, 0, 0, 1, 1,
0.9656349, 1.401988, 0.250598, 1, 0, 0, 1, 1,
0.9741453, 0.613951, 1.705645, 0, 0, 0, 1, 1,
0.9806826, 0.5932391, 0.7604331, 0, 0, 0, 1, 1,
0.9827228, -2.274953, 4.533456, 0, 0, 0, 1, 1,
0.9949999, -0.2728316, 3.413618, 0, 0, 0, 1, 1,
0.999207, 0.9152897, 0.01675639, 0, 0, 0, 1, 1,
1.025327, 1.341834, 1.354549, 0, 0, 0, 1, 1,
1.03633, -0.1952259, 1.860958, 0, 0, 0, 1, 1,
1.041324, -0.9232566, 2.444565, 1, 1, 1, 1, 1,
1.056077, 0.2519569, 1.006758, 1, 1, 1, 1, 1,
1.058323, 0.01244638, 2.150107, 1, 1, 1, 1, 1,
1.059793, 0.8973023, 0.736561, 1, 1, 1, 1, 1,
1.067694, 0.3130899, 1.165132, 1, 1, 1, 1, 1,
1.069061, -0.5089142, 2.836017, 1, 1, 1, 1, 1,
1.074169, 0.351698, 0.3998849, 1, 1, 1, 1, 1,
1.077202, -1.585071, 2.482677, 1, 1, 1, 1, 1,
1.080987, 0.8599014, 1.014986, 1, 1, 1, 1, 1,
1.083347, 0.6176121, 1.346871, 1, 1, 1, 1, 1,
1.083587, 0.6080022, 1.179287, 1, 1, 1, 1, 1,
1.088149, -1.06373, 1.863899, 1, 1, 1, 1, 1,
1.094019, 0.7192124, 2.271646, 1, 1, 1, 1, 1,
1.096278, -0.3248297, 0.7538031, 1, 1, 1, 1, 1,
1.096846, 0.04077839, 0.4082613, 1, 1, 1, 1, 1,
1.099221, -0.12806, 2.746056, 0, 0, 1, 1, 1,
1.108337, 0.4780227, 0.6275232, 1, 0, 0, 1, 1,
1.115981, 0.9482338, 0.7204562, 1, 0, 0, 1, 1,
1.120145, 0.8096603, 3.26461, 1, 0, 0, 1, 1,
1.128838, -1.762966, 1.980431, 1, 0, 0, 1, 1,
1.139428, 1.144424, 1.910187, 1, 0, 0, 1, 1,
1.139746, 1.01527, 1.203781, 0, 0, 0, 1, 1,
1.142659, -1.067985, 3.684836, 0, 0, 0, 1, 1,
1.15559, 1.253307, 1.093426, 0, 0, 0, 1, 1,
1.160604, -1.191711, 1.489597, 0, 0, 0, 1, 1,
1.168291, 0.0149723, 2.031135, 0, 0, 0, 1, 1,
1.169591, 0.3964724, 2.033165, 0, 0, 0, 1, 1,
1.172897, 0.52745, 0.642355, 0, 0, 0, 1, 1,
1.204589, 1.916038, -1.184732, 1, 1, 1, 1, 1,
1.205613, 1.172712, 0.9545037, 1, 1, 1, 1, 1,
1.208638, 0.8615756, 1.617056, 1, 1, 1, 1, 1,
1.210536, -0.3100564, -0.4057657, 1, 1, 1, 1, 1,
1.213406, 0.6268972, 1.26224, 1, 1, 1, 1, 1,
1.213804, 0.1185672, 3.840479, 1, 1, 1, 1, 1,
1.233838, 0.1221563, 0.6161952, 1, 1, 1, 1, 1,
1.237363, -1.708225, 2.85615, 1, 1, 1, 1, 1,
1.240879, -0.6664433, 2.709903, 1, 1, 1, 1, 1,
1.246167, 0.7135715, 0.2585635, 1, 1, 1, 1, 1,
1.246685, -0.137297, 1.459834, 1, 1, 1, 1, 1,
1.252127, 0.6855367, 0.9037102, 1, 1, 1, 1, 1,
1.275428, -0.5396684, 3.840252, 1, 1, 1, 1, 1,
1.278039, -1.506747, 3.479621, 1, 1, 1, 1, 1,
1.29554, 1.315565, 1.938186, 1, 1, 1, 1, 1,
1.302008, -0.1317649, 1.698872, 0, 0, 1, 1, 1,
1.302684, -0.8421187, 3.332222, 1, 0, 0, 1, 1,
1.319332, 0.1806135, 1.613419, 1, 0, 0, 1, 1,
1.320814, 0.6690595, 3.933727, 1, 0, 0, 1, 1,
1.322704, 0.1934346, 3.717202, 1, 0, 0, 1, 1,
1.330413, -1.571862, 1.398275, 1, 0, 0, 1, 1,
1.332059, 0.07070342, 1.084664, 0, 0, 0, 1, 1,
1.337651, -0.3072514, 0.6147736, 0, 0, 0, 1, 1,
1.338247, 0.3967813, 1.984266, 0, 0, 0, 1, 1,
1.342915, -0.7157212, 0.625651, 0, 0, 0, 1, 1,
1.360945, -1.185429, 0.7433253, 0, 0, 0, 1, 1,
1.363248, -0.7399036, 2.207814, 0, 0, 0, 1, 1,
1.36646, -0.62521, 0.8722608, 0, 0, 0, 1, 1,
1.369756, -0.7888127, 1.226745, 1, 1, 1, 1, 1,
1.371623, 0.1870895, 0.2778398, 1, 1, 1, 1, 1,
1.375048, 1.135296, -0.3020231, 1, 1, 1, 1, 1,
1.387958, -1.614902, 2.053646, 1, 1, 1, 1, 1,
1.394176, 1.750116, 0.3545667, 1, 1, 1, 1, 1,
1.404671, -0.640838, 2.107111, 1, 1, 1, 1, 1,
1.413399, -0.4794907, 0.3257008, 1, 1, 1, 1, 1,
1.41654, 1.470616, 0.5290079, 1, 1, 1, 1, 1,
1.426007, -0.6515948, 1.338486, 1, 1, 1, 1, 1,
1.431524, -0.4363967, 1.169289, 1, 1, 1, 1, 1,
1.433287, -1.330699, 0.8764042, 1, 1, 1, 1, 1,
1.440608, 1.165422, 1.856079, 1, 1, 1, 1, 1,
1.45235, 2.89094, 1.498451, 1, 1, 1, 1, 1,
1.455023, -0.00933979, 1.219732, 1, 1, 1, 1, 1,
1.458859, 0.1705295, 1.455197, 1, 1, 1, 1, 1,
1.459018, -1.206022, 1.337921, 0, 0, 1, 1, 1,
1.463741, -0.1207389, 1.114641, 1, 0, 0, 1, 1,
1.47675, -0.5495322, 1.322479, 1, 0, 0, 1, 1,
1.484116, -1.77666, 2.516325, 1, 0, 0, 1, 1,
1.48932, -1.153778, 3.974781, 1, 0, 0, 1, 1,
1.493388, -0.08127542, 1.843097, 1, 0, 0, 1, 1,
1.497819, 1.453921, 3.051622, 0, 0, 0, 1, 1,
1.541438, 0.2746139, 1.859999, 0, 0, 0, 1, 1,
1.547638, 0.2871098, 3.168822, 0, 0, 0, 1, 1,
1.555192, -0.1392444, 0.8522395, 0, 0, 0, 1, 1,
1.571502, 0.1229587, 1.837549, 0, 0, 0, 1, 1,
1.582703, -1.075927, 1.95249, 0, 0, 0, 1, 1,
1.592539, -0.03881949, 1.422636, 0, 0, 0, 1, 1,
1.611782, -0.6779285, 2.074615, 1, 1, 1, 1, 1,
1.618165, -1.744637, 2.004809, 1, 1, 1, 1, 1,
1.641655, 0.4644485, 2.519836, 1, 1, 1, 1, 1,
1.643925, -0.15048, 1.372967, 1, 1, 1, 1, 1,
1.645486, 0.2503954, 1.145739, 1, 1, 1, 1, 1,
1.666539, 0.4395546, 1.681933, 1, 1, 1, 1, 1,
1.666938, -1.03743, 4.076484, 1, 1, 1, 1, 1,
1.669774, 0.306118, 1.632029, 1, 1, 1, 1, 1,
1.678075, -1.196817, 2.480875, 1, 1, 1, 1, 1,
1.684651, -0.1253046, 2.247103, 1, 1, 1, 1, 1,
1.69304, 0.6117159, -0.4857878, 1, 1, 1, 1, 1,
1.702256, 1.926895, -1.324806, 1, 1, 1, 1, 1,
1.706805, 0.3154101, 1.600067, 1, 1, 1, 1, 1,
1.711751, -0.4177521, 1.83044, 1, 1, 1, 1, 1,
1.719044, 0.5630164, 1.394586, 1, 1, 1, 1, 1,
1.71958, -0.9361251, 3.008066, 0, 0, 1, 1, 1,
1.76569, 0.6063135, 0.08624867, 1, 0, 0, 1, 1,
1.791932, 0.4226824, 0.9390426, 1, 0, 0, 1, 1,
1.812169, 0.02219436, 1.313459, 1, 0, 0, 1, 1,
1.831468, -0.9879843, 2.053545, 1, 0, 0, 1, 1,
1.833194, -0.9489999, 2.607293, 1, 0, 0, 1, 1,
1.836949, -0.6682016, 3.559636, 0, 0, 0, 1, 1,
1.839738, -0.1009118, 1.863691, 0, 0, 0, 1, 1,
1.844195, -0.03825659, 2.163153, 0, 0, 0, 1, 1,
1.880188, 0.6540214, 1.729412, 0, 0, 0, 1, 1,
1.882558, -0.3370686, 2.111941, 0, 0, 0, 1, 1,
1.889249, 0.03651316, 0.8127117, 0, 0, 0, 1, 1,
1.902501, 0.07514708, 1.508309, 0, 0, 0, 1, 1,
1.913582, -1.896123, 3.287163, 1, 1, 1, 1, 1,
1.93647, -2.709048, 0.3272225, 1, 1, 1, 1, 1,
1.953519, -0.03928094, 1.448723, 1, 1, 1, 1, 1,
1.954863, -1.431944, 1.561317, 1, 1, 1, 1, 1,
1.972491, -0.8939558, 4.233328, 1, 1, 1, 1, 1,
1.979711, -0.2670373, 1.143871, 1, 1, 1, 1, 1,
1.985476, 0.447309, 1.765026, 1, 1, 1, 1, 1,
1.995795, -0.3726001, 1.453958, 1, 1, 1, 1, 1,
2.01445, 1.812935, 0.0267657, 1, 1, 1, 1, 1,
2.018019, 1.183588, 1.991866, 1, 1, 1, 1, 1,
2.022527, -1.974485, 2.257106, 1, 1, 1, 1, 1,
2.028084, 0.1694445, 3.032229, 1, 1, 1, 1, 1,
2.033945, 0.7555672, 0.7672632, 1, 1, 1, 1, 1,
2.034137, 2.797169, 3.06556, 1, 1, 1, 1, 1,
2.056338, 0.4873213, 1.972674, 1, 1, 1, 1, 1,
2.076504, -0.7524983, 2.003922, 0, 0, 1, 1, 1,
2.091114, -0.8356153, 2.401926, 1, 0, 0, 1, 1,
2.094623, -0.1875252, 3.375388, 1, 0, 0, 1, 1,
2.097828, -0.2713548, 2.383224, 1, 0, 0, 1, 1,
2.102351, 0.8655878, 1.801316, 1, 0, 0, 1, 1,
2.111548, -0.4951558, 1.90712, 1, 0, 0, 1, 1,
2.178067, 1.168404, 0.5274897, 0, 0, 0, 1, 1,
2.181466, 0.7555532, 0.6858392, 0, 0, 0, 1, 1,
2.234622, -0.472251, 2.122498, 0, 0, 0, 1, 1,
2.301668, -0.005220396, 1.946789, 0, 0, 0, 1, 1,
2.303289, -0.6471253, 2.385405, 0, 0, 0, 1, 1,
2.339502, 0.2706302, -0.1246187, 0, 0, 0, 1, 1,
2.34464, 0.1418717, 2.619033, 0, 0, 0, 1, 1,
2.380892, 0.4449389, 2.502743, 1, 1, 1, 1, 1,
2.415205, 0.3332048, 0.1927227, 1, 1, 1, 1, 1,
2.584734, -0.3790696, 2.843113, 1, 1, 1, 1, 1,
2.739088, -0.5967475, 3.30254, 1, 1, 1, 1, 1,
2.833194, 0.6552677, 0.644349, 1, 1, 1, 1, 1,
2.849578, -1.480178, -0.04618523, 1, 1, 1, 1, 1,
2.890981, 0.09178562, 2.154992, 1, 1, 1, 1, 1
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
var radius = 9.532382;
var distance = 33.48209;
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
mvMatrix.translate( 0.426872, -0.08213878, -0.2862725 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.48209);
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