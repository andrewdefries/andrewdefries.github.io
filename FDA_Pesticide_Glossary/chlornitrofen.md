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
-2.974679, 0.3223135, -2.078578, 1, 0, 0, 1,
-2.870201, -0.2348262, -2.193999, 1, 0.007843138, 0, 1,
-2.862059, 1.078177, -1.706268, 1, 0.01176471, 0, 1,
-2.822884, 0.6719329, -1.499694, 1, 0.01960784, 0, 1,
-2.805182, 0.7331442, -1.607603, 1, 0.02352941, 0, 1,
-2.653169, 0.6215537, -1.697793, 1, 0.03137255, 0, 1,
-2.57261, 0.4020587, -0.893378, 1, 0.03529412, 0, 1,
-2.529845, -0.3744524, -2.101843, 1, 0.04313726, 0, 1,
-2.483647, 0.1782116, -4.271008, 1, 0.04705882, 0, 1,
-2.466943, -0.4520972, -2.358938, 1, 0.05490196, 0, 1,
-2.451404, 3.299817, -1.083854, 1, 0.05882353, 0, 1,
-2.392434, 0.6611958, -3.757221, 1, 0.06666667, 0, 1,
-2.325838, -1.469534, -2.065544, 1, 0.07058824, 0, 1,
-2.261195, 0.1260824, -0.04703924, 1, 0.07843138, 0, 1,
-2.200454, 1.319685, -0.8868439, 1, 0.08235294, 0, 1,
-2.190427, 0.4184609, -1.867271, 1, 0.09019608, 0, 1,
-2.17033, 0.03166928, -1.705431, 1, 0.09411765, 0, 1,
-2.151461, -0.04694017, -1.317726, 1, 0.1019608, 0, 1,
-2.146403, -0.6622179, -2.472733, 1, 0.1098039, 0, 1,
-2.116979, 0.9146227, -1.445922, 1, 0.1137255, 0, 1,
-2.09928, 1.73795, -0.6950253, 1, 0.1215686, 0, 1,
-2.094075, 1.298203, -1.995321, 1, 0.1254902, 0, 1,
-2.07135, -1.082172, -0.5374728, 1, 0.1333333, 0, 1,
-2.069416, -0.6747531, -2.764945, 1, 0.1372549, 0, 1,
-2.050222, -0.9306073, -3.547703, 1, 0.145098, 0, 1,
-2.043604, 1.561522, 0.2872178, 1, 0.1490196, 0, 1,
-2.041484, 0.711972, -2.538247, 1, 0.1568628, 0, 1,
-2.035851, -0.5969837, -1.110437, 1, 0.1607843, 0, 1,
-2.010626, 0.365328, -0.3867674, 1, 0.1686275, 0, 1,
-1.995467, -0.3189734, -0.49533, 1, 0.172549, 0, 1,
-1.965712, 1.570436, 0.4714142, 1, 0.1803922, 0, 1,
-1.910819, -0.3296736, -3.317475, 1, 0.1843137, 0, 1,
-1.908884, -0.6731641, -2.087289, 1, 0.1921569, 0, 1,
-1.908041, -0.5465758, -1.332282, 1, 0.1960784, 0, 1,
-1.849488, -0.2488349, -2.106388, 1, 0.2039216, 0, 1,
-1.841771, -2.113009, -1.650194, 1, 0.2117647, 0, 1,
-1.797124, -0.8141267, -2.294899, 1, 0.2156863, 0, 1,
-1.794379, -2.01933, -0.8407969, 1, 0.2235294, 0, 1,
-1.7793, -0.3259576, -1.659771, 1, 0.227451, 0, 1,
-1.760094, 1.328873, 0.8107836, 1, 0.2352941, 0, 1,
-1.753157, -0.4832507, -3.154047, 1, 0.2392157, 0, 1,
-1.734055, -1.365959, -2.086435, 1, 0.2470588, 0, 1,
-1.721358, -1.580756, -1.767535, 1, 0.2509804, 0, 1,
-1.710395, -0.000578062, -0.2728071, 1, 0.2588235, 0, 1,
-1.67428, 1.125589, 0.07034098, 1, 0.2627451, 0, 1,
-1.650569, 0.5836577, -0.3263435, 1, 0.2705882, 0, 1,
-1.631161, 0.1000712, -1.185578, 1, 0.2745098, 0, 1,
-1.61892, -0.1361698, -1.889539, 1, 0.282353, 0, 1,
-1.616463, -0.6685281, -2.320399, 1, 0.2862745, 0, 1,
-1.611058, 0.2905519, -0.339764, 1, 0.2941177, 0, 1,
-1.591354, -1.706157, -2.840185, 1, 0.3019608, 0, 1,
-1.590052, -1.000441, -1.888385, 1, 0.3058824, 0, 1,
-1.585141, 0.8350694, -0.1050475, 1, 0.3137255, 0, 1,
-1.575641, -0.1761756, -3.695232, 1, 0.3176471, 0, 1,
-1.570464, -0.4839587, -1.252827, 1, 0.3254902, 0, 1,
-1.566328, -0.4629593, -1.423796, 1, 0.3294118, 0, 1,
-1.56431, 0.5028115, -1.470799, 1, 0.3372549, 0, 1,
-1.553334, 0.510858, -2.826276, 1, 0.3411765, 0, 1,
-1.544907, -0.7892214, -2.736598, 1, 0.3490196, 0, 1,
-1.542439, 0.01977953, -2.725055, 1, 0.3529412, 0, 1,
-1.52744, 0.4914819, -1.451146, 1, 0.3607843, 0, 1,
-1.527148, -0.2916201, -2.827243, 1, 0.3647059, 0, 1,
-1.525921, -0.176028, -0.4598266, 1, 0.372549, 0, 1,
-1.518451, -1.093547, -0.9343373, 1, 0.3764706, 0, 1,
-1.502179, 1.14669, -1.222553, 1, 0.3843137, 0, 1,
-1.501399, 2.273764, -1.724302, 1, 0.3882353, 0, 1,
-1.492471, 0.3063977, -0.3654415, 1, 0.3960784, 0, 1,
-1.488872, -0.8142474, -1.2925, 1, 0.4039216, 0, 1,
-1.483611, 1.04212, -1.300251, 1, 0.4078431, 0, 1,
-1.483105, 1.014858, -2.157926, 1, 0.4156863, 0, 1,
-1.481733, -0.1499288, 0.1715273, 1, 0.4196078, 0, 1,
-1.478486, -0.9698048, -2.936512, 1, 0.427451, 0, 1,
-1.469357, -1.361513, -3.145403, 1, 0.4313726, 0, 1,
-1.467294, 0.5452393, 0.7887069, 1, 0.4392157, 0, 1,
-1.4568, -1.234197, -4.801351, 1, 0.4431373, 0, 1,
-1.441203, 0.5698453, -0.350067, 1, 0.4509804, 0, 1,
-1.436669, -0.4580846, -2.644927, 1, 0.454902, 0, 1,
-1.433052, 0.2571707, -1.61091, 1, 0.4627451, 0, 1,
-1.432747, -2.044107, -3.114871, 1, 0.4666667, 0, 1,
-1.428324, -0.05323621, -1.713276, 1, 0.4745098, 0, 1,
-1.403706, 1.210853, -0.3335727, 1, 0.4784314, 0, 1,
-1.396281, 1.048357, -0.7282108, 1, 0.4862745, 0, 1,
-1.382061, 2.06828, 0.9774544, 1, 0.4901961, 0, 1,
-1.358086, -0.5442763, -2.844261, 1, 0.4980392, 0, 1,
-1.355584, -0.2730321, -1.810839, 1, 0.5058824, 0, 1,
-1.351429, 1.244341, -1.298672, 1, 0.509804, 0, 1,
-1.349117, 1.212056, 0.05655235, 1, 0.5176471, 0, 1,
-1.345011, 0.8869123, -2.527418, 1, 0.5215687, 0, 1,
-1.337605, 1.738774, -1.20363, 1, 0.5294118, 0, 1,
-1.336534, -0.2858582, -3.159407, 1, 0.5333334, 0, 1,
-1.335929, 0.3537709, -1.184451, 1, 0.5411765, 0, 1,
-1.317071, 0.6535907, -1.422492, 1, 0.5450981, 0, 1,
-1.310638, 2.960736, -1.250667, 1, 0.5529412, 0, 1,
-1.306438, -0.4121976, -2.294601, 1, 0.5568628, 0, 1,
-1.287185, -0.4102123, -2.301569, 1, 0.5647059, 0, 1,
-1.280638, 1.815585, -0.3991601, 1, 0.5686275, 0, 1,
-1.27601, 0.3376448, 0.3268729, 1, 0.5764706, 0, 1,
-1.27414, 0.7366141, -0.9220677, 1, 0.5803922, 0, 1,
-1.271088, 0.8406098, 0.6037933, 1, 0.5882353, 0, 1,
-1.27024, -2.29689, -0.2464743, 1, 0.5921569, 0, 1,
-1.268017, -0.4037085, -0.9088099, 1, 0.6, 0, 1,
-1.266565, 0.244649, -0.5198122, 1, 0.6078432, 0, 1,
-1.266263, 0.5411553, -0.5798235, 1, 0.6117647, 0, 1,
-1.265797, -0.9420477, -2.440206, 1, 0.6196079, 0, 1,
-1.258077, -0.02633226, 0.1455762, 1, 0.6235294, 0, 1,
-1.251628, -0.6961203, -2.163657, 1, 0.6313726, 0, 1,
-1.243607, 0.3793858, -1.358426, 1, 0.6352941, 0, 1,
-1.238391, 1.436255, 0.5700063, 1, 0.6431373, 0, 1,
-1.236367, -0.2310131, -0.336974, 1, 0.6470588, 0, 1,
-1.227306, 0.4175804, -2.85258, 1, 0.654902, 0, 1,
-1.218307, -0.3956109, -2.561895, 1, 0.6588235, 0, 1,
-1.217029, 0.07604775, -2.428894, 1, 0.6666667, 0, 1,
-1.216019, -0.6004987, -2.350714, 1, 0.6705883, 0, 1,
-1.214351, -0.06910322, -2.595715, 1, 0.6784314, 0, 1,
-1.21338, -0.182163, -2.876311, 1, 0.682353, 0, 1,
-1.206721, -0.00647567, -1.329703, 1, 0.6901961, 0, 1,
-1.206376, 2.19681, -0.2442693, 1, 0.6941177, 0, 1,
-1.204961, 0.5774979, -0.4821849, 1, 0.7019608, 0, 1,
-1.203989, 0.1615098, -1.945532, 1, 0.7098039, 0, 1,
-1.202401, 0.01066393, -1.690175, 1, 0.7137255, 0, 1,
-1.197738, 0.7344881, -0.4175954, 1, 0.7215686, 0, 1,
-1.195591, 0.06906503, 0.1101721, 1, 0.7254902, 0, 1,
-1.194324, 0.7970461, -1.535232, 1, 0.7333333, 0, 1,
-1.174082, -0.5712922, -1.563229, 1, 0.7372549, 0, 1,
-1.168414, -0.0005387999, -1.7799, 1, 0.7450981, 0, 1,
-1.168295, 1.665708, -2.001122, 1, 0.7490196, 0, 1,
-1.162569, 2.086114, -1.150671, 1, 0.7568628, 0, 1,
-1.16247, -0.8091744, -3.52929, 1, 0.7607843, 0, 1,
-1.158305, 0.9105022, -0.7759852, 1, 0.7686275, 0, 1,
-1.155638, 1.853431, -1.502857, 1, 0.772549, 0, 1,
-1.154344, 0.1617467, -2.040866, 1, 0.7803922, 0, 1,
-1.151257, 0.4192003, -1.686481, 1, 0.7843137, 0, 1,
-1.143265, -0.3250722, -1.632552, 1, 0.7921569, 0, 1,
-1.14208, -1.07219, -1.375366, 1, 0.7960784, 0, 1,
-1.141138, 0.2038071, -3.160112, 1, 0.8039216, 0, 1,
-1.128183, -0.04238326, -1.250838, 1, 0.8117647, 0, 1,
-1.125727, -0.3149769, -1.847537, 1, 0.8156863, 0, 1,
-1.125311, 0.9474937, -0.8543571, 1, 0.8235294, 0, 1,
-1.122074, 0.2229291, -0.1352868, 1, 0.827451, 0, 1,
-1.121339, -0.4889675, -1.386649, 1, 0.8352941, 0, 1,
-1.116957, -0.4705492, 0.387977, 1, 0.8392157, 0, 1,
-1.111593, 0.3851174, -0.4233014, 1, 0.8470588, 0, 1,
-1.097426, 0.09083595, -2.085809, 1, 0.8509804, 0, 1,
-1.086523, -0.3612666, -2.50387, 1, 0.8588235, 0, 1,
-1.074754, -0.4898058, -2.503749, 1, 0.8627451, 0, 1,
-1.070312, 0.2791203, -0.1163128, 1, 0.8705882, 0, 1,
-1.053488, -1.372732, -3.027671, 1, 0.8745098, 0, 1,
-1.053298, 0.03780574, -2.043922, 1, 0.8823529, 0, 1,
-1.052005, 0.2766066, -1.599221, 1, 0.8862745, 0, 1,
-1.049126, 0.3221442, -1.830681, 1, 0.8941177, 0, 1,
-1.038676, -1.417559, -0.7473018, 1, 0.8980392, 0, 1,
-1.038561, -0.8833823, -1.775657, 1, 0.9058824, 0, 1,
-1.032149, 0.3116367, -1.476404, 1, 0.9137255, 0, 1,
-1.032041, -0.7989931, -2.151381, 1, 0.9176471, 0, 1,
-1.03166, -0.3786737, -1.02571, 1, 0.9254902, 0, 1,
-1.023792, 0.1552521, -2.730681, 1, 0.9294118, 0, 1,
-1.022948, -0.9907382, -4.055726, 1, 0.9372549, 0, 1,
-1.012331, -0.6991103, -3.752806, 1, 0.9411765, 0, 1,
-1.003803, 0.6380578, -1.891198, 1, 0.9490196, 0, 1,
-1.003507, -1.114269, -0.5417822, 1, 0.9529412, 0, 1,
-1.002374, -0.8080841, -3.389399, 1, 0.9607843, 0, 1,
-0.9997225, -0.4626452, -2.102452, 1, 0.9647059, 0, 1,
-0.9945962, 0.8122356, 0.573805, 1, 0.972549, 0, 1,
-0.9894426, 0.5913047, -0.4568, 1, 0.9764706, 0, 1,
-0.9889018, 1.680101, -1.180408, 1, 0.9843137, 0, 1,
-0.983569, 1.605309, 0.2926299, 1, 0.9882353, 0, 1,
-0.982807, 0.7542124, -3.19412, 1, 0.9960784, 0, 1,
-0.9786889, 0.4326683, -2.557166, 0.9960784, 1, 0, 1,
-0.9756055, 0.5228875, 0.9397463, 0.9921569, 1, 0, 1,
-0.9741864, 0.8021157, -1.164809, 0.9843137, 1, 0, 1,
-0.9712409, 0.09009027, -1.857411, 0.9803922, 1, 0, 1,
-0.9697323, -0.4905025, -2.654875, 0.972549, 1, 0, 1,
-0.9669714, 0.3632712, -3.009311, 0.9686275, 1, 0, 1,
-0.9657913, -0.414142, -1.726284, 0.9607843, 1, 0, 1,
-0.9620731, -0.3580631, -2.58983, 0.9568627, 1, 0, 1,
-0.9606466, 1.207351, -0.65896, 0.9490196, 1, 0, 1,
-0.9504874, 1.354564, -0.514389, 0.945098, 1, 0, 1,
-0.9480956, 1.328443, 0.986525, 0.9372549, 1, 0, 1,
-0.9415805, -1.427672, -1.859352, 0.9333333, 1, 0, 1,
-0.9409342, -0.1085825, -1.521016, 0.9254902, 1, 0, 1,
-0.9342732, -0.7849175, -3.471431, 0.9215686, 1, 0, 1,
-0.9311247, -0.2130252, -0.8070324, 0.9137255, 1, 0, 1,
-0.9274074, -0.1918101, -1.288831, 0.9098039, 1, 0, 1,
-0.9240771, 0.5944306, -0.7358248, 0.9019608, 1, 0, 1,
-0.9181929, 1.794787, -0.3264696, 0.8941177, 1, 0, 1,
-0.9146393, -1.068944, -1.482666, 0.8901961, 1, 0, 1,
-0.909047, 1.654779, -1.953004, 0.8823529, 1, 0, 1,
-0.9081866, -1.368924, -2.841413, 0.8784314, 1, 0, 1,
-0.8964676, 1.380548, -0.5026835, 0.8705882, 1, 0, 1,
-0.8952189, -0.1286865, -2.47359, 0.8666667, 1, 0, 1,
-0.892857, 0.4780511, 0.2142878, 0.8588235, 1, 0, 1,
-0.8886228, -0.4334618, -2.270491, 0.854902, 1, 0, 1,
-0.887615, -1.638134, -0.825385, 0.8470588, 1, 0, 1,
-0.8777663, 0.983463, -1.542354, 0.8431373, 1, 0, 1,
-0.8745336, 0.921571, -0.01761506, 0.8352941, 1, 0, 1,
-0.8713978, -0.1539273, 0.9854182, 0.8313726, 1, 0, 1,
-0.8701958, 0.6704289, 0.1487886, 0.8235294, 1, 0, 1,
-0.8664603, 0.3857884, -1.444473, 0.8196079, 1, 0, 1,
-0.8610516, -2.241564, -3.91298, 0.8117647, 1, 0, 1,
-0.8589922, 0.2870386, -0.1477384, 0.8078431, 1, 0, 1,
-0.8533473, 0.274869, 0.5754559, 0.8, 1, 0, 1,
-0.852694, -0.7357224, -2.929775, 0.7921569, 1, 0, 1,
-0.8479056, -0.8882242, 0.1006016, 0.7882353, 1, 0, 1,
-0.8463159, -0.5130529, -2.341625, 0.7803922, 1, 0, 1,
-0.8452956, 0.3395691, 0.2251871, 0.7764706, 1, 0, 1,
-0.8451771, -1.312116, -1.969116, 0.7686275, 1, 0, 1,
-0.8448519, -0.1388596, -1.91759, 0.7647059, 1, 0, 1,
-0.8439306, 1.431429, -0.5154919, 0.7568628, 1, 0, 1,
-0.8363749, 1.883159, 1.037712, 0.7529412, 1, 0, 1,
-0.8328041, -0.2407184, -2.997863, 0.7450981, 1, 0, 1,
-0.8326025, 0.2815324, -0.9821531, 0.7411765, 1, 0, 1,
-0.8298569, 0.6332656, -1.021626, 0.7333333, 1, 0, 1,
-0.8297426, -1.588104, -1.322984, 0.7294118, 1, 0, 1,
-0.8256624, -0.1848772, -2.791387, 0.7215686, 1, 0, 1,
-0.8229851, -0.2984725, -2.831566, 0.7176471, 1, 0, 1,
-0.8191994, 1.349357, -1.267441, 0.7098039, 1, 0, 1,
-0.8190201, 0.4085681, -2.063551, 0.7058824, 1, 0, 1,
-0.818552, 1.908108, -0.8669293, 0.6980392, 1, 0, 1,
-0.8181378, 0.3167945, -3.234706, 0.6901961, 1, 0, 1,
-0.8150599, -0.05509999, 0.2661057, 0.6862745, 1, 0, 1,
-0.8017524, 0.8314747, -2.367814, 0.6784314, 1, 0, 1,
-0.801349, 0.5991723, -3.050441, 0.6745098, 1, 0, 1,
-0.800079, -1.993238, -3.542001, 0.6666667, 1, 0, 1,
-0.7991866, -0.05085661, -2.305171, 0.6627451, 1, 0, 1,
-0.7923014, 0.7340848, -2.003731, 0.654902, 1, 0, 1,
-0.7907027, 0.3481195, -1.693592, 0.6509804, 1, 0, 1,
-0.7879463, -0.2483839, -3.965883, 0.6431373, 1, 0, 1,
-0.7875064, 1.084631, 1.032251, 0.6392157, 1, 0, 1,
-0.7828388, 1.326813, -0.513951, 0.6313726, 1, 0, 1,
-0.7700657, -0.9565502, -3.236118, 0.627451, 1, 0, 1,
-0.764891, 0.363396, -0.7015314, 0.6196079, 1, 0, 1,
-0.763263, 0.138317, -0.1791274, 0.6156863, 1, 0, 1,
-0.7615904, 0.6299886, -1.406914, 0.6078432, 1, 0, 1,
-0.7481862, 0.3149944, -1.336113, 0.6039216, 1, 0, 1,
-0.7424679, 0.7145458, -0.8697171, 0.5960785, 1, 0, 1,
-0.739663, 0.3478615, 1.517327, 0.5882353, 1, 0, 1,
-0.7349532, 0.6173112, -1.227098, 0.5843138, 1, 0, 1,
-0.7347994, -1.232257, -3.147159, 0.5764706, 1, 0, 1,
-0.7338383, 1.807976, 1.263498, 0.572549, 1, 0, 1,
-0.7276496, -0.7545792, -3.193793, 0.5647059, 1, 0, 1,
-0.7258095, -0.5522041, -2.315589, 0.5607843, 1, 0, 1,
-0.7235835, 0.5279352, -0.1431643, 0.5529412, 1, 0, 1,
-0.7193935, -0.884654, -2.895138, 0.5490196, 1, 0, 1,
-0.7171229, 1.008028, -0.6541418, 0.5411765, 1, 0, 1,
-0.7126917, 0.1044261, -0.7115025, 0.5372549, 1, 0, 1,
-0.7064828, 0.6393521, 0.1826912, 0.5294118, 1, 0, 1,
-0.7053429, 0.8995512, -1.584545, 0.5254902, 1, 0, 1,
-0.702156, -0.5597705, -3.335186, 0.5176471, 1, 0, 1,
-0.6984822, 1.296846, -0.9001679, 0.5137255, 1, 0, 1,
-0.6885017, 1.261057, -1.018419, 0.5058824, 1, 0, 1,
-0.6867339, 0.6035189, 1.220907, 0.5019608, 1, 0, 1,
-0.6848175, -1.753242, -3.07897, 0.4941176, 1, 0, 1,
-0.6845345, 0.3607613, -1.051397, 0.4862745, 1, 0, 1,
-0.6765735, 0.4210008, 0.01526586, 0.4823529, 1, 0, 1,
-0.6752968, -0.07062963, -3.613437, 0.4745098, 1, 0, 1,
-0.6725633, 0.6985009, -1.140244, 0.4705882, 1, 0, 1,
-0.6684523, 1.122968, -0.813302, 0.4627451, 1, 0, 1,
-0.6645555, -1.444764, -1.89191, 0.4588235, 1, 0, 1,
-0.6632389, -0.4681706, -2.306714, 0.4509804, 1, 0, 1,
-0.6560459, 0.4325416, 0.6489491, 0.4470588, 1, 0, 1,
-0.6464613, -0.4553373, -0.003235876, 0.4392157, 1, 0, 1,
-0.6451464, 0.8821598, -0.6242747, 0.4352941, 1, 0, 1,
-0.6411931, 0.584737, 0.8375254, 0.427451, 1, 0, 1,
-0.641105, 1.26188, -1.733711, 0.4235294, 1, 0, 1,
-0.632643, -0.1502091, 0.3028021, 0.4156863, 1, 0, 1,
-0.6318282, -0.04401056, -2.559166, 0.4117647, 1, 0, 1,
-0.627488, 1.338417, 0.3497456, 0.4039216, 1, 0, 1,
-0.6252123, 0.7789144, -0.3091148, 0.3960784, 1, 0, 1,
-0.6237295, -1.197731, -2.147497, 0.3921569, 1, 0, 1,
-0.6191589, 1.681426, -0.2421381, 0.3843137, 1, 0, 1,
-0.6182356, 0.3863674, -1.035262, 0.3803922, 1, 0, 1,
-0.6160606, -0.3536399, -1.309966, 0.372549, 1, 0, 1,
-0.6043594, 0.4081077, -0.4657251, 0.3686275, 1, 0, 1,
-0.6040587, 1.111817, 0.3940085, 0.3607843, 1, 0, 1,
-0.6037421, -0.06436906, -2.398692, 0.3568628, 1, 0, 1,
-0.6012324, 0.1281532, -1.680535, 0.3490196, 1, 0, 1,
-0.6007805, -0.1476994, -0.5257916, 0.345098, 1, 0, 1,
-0.59593, 1.443396, -0.05287228, 0.3372549, 1, 0, 1,
-0.5953161, 1.147701, -1.274374, 0.3333333, 1, 0, 1,
-0.5946519, 1.689729, -0.4451164, 0.3254902, 1, 0, 1,
-0.5934026, 0.6255968, -0.3692884, 0.3215686, 1, 0, 1,
-0.5899232, 0.5093489, -1.328052, 0.3137255, 1, 0, 1,
-0.5898643, 0.842328, 0.1202959, 0.3098039, 1, 0, 1,
-0.5878364, -0.1196941, -2.805149, 0.3019608, 1, 0, 1,
-0.5851811, -0.5640525, -0.2625628, 0.2941177, 1, 0, 1,
-0.5850185, 0.2381775, -2.468199, 0.2901961, 1, 0, 1,
-0.5841303, -0.2495891, -1.343183, 0.282353, 1, 0, 1,
-0.5823159, 0.7086173, -1.620601, 0.2784314, 1, 0, 1,
-0.5809528, -1.255103, -2.431745, 0.2705882, 1, 0, 1,
-0.5802066, -2.587115, -1.172821, 0.2666667, 1, 0, 1,
-0.5791528, 0.9020586, -0.2109856, 0.2588235, 1, 0, 1,
-0.5789769, -2.319035, -2.220975, 0.254902, 1, 0, 1,
-0.5762472, -2.213604, -4.279112, 0.2470588, 1, 0, 1,
-0.5744331, 1.295869, 0.9256234, 0.2431373, 1, 0, 1,
-0.5744045, 0.04552451, -1.54288, 0.2352941, 1, 0, 1,
-0.5733187, 1.087937, -1.420535, 0.2313726, 1, 0, 1,
-0.5688934, 1.034723, 0.6334723, 0.2235294, 1, 0, 1,
-0.5681162, -1.039368, -2.845544, 0.2196078, 1, 0, 1,
-0.5600573, -0.02911628, -2.132137, 0.2117647, 1, 0, 1,
-0.5560976, -1.252558, -1.617264, 0.2078431, 1, 0, 1,
-0.5418274, 2.182701, -1.092572, 0.2, 1, 0, 1,
-0.5383188, -0.4279215, -1.044031, 0.1921569, 1, 0, 1,
-0.5366715, 0.2269322, -0.9447543, 0.1882353, 1, 0, 1,
-0.5349897, -1.110867, -2.185291, 0.1803922, 1, 0, 1,
-0.5324208, 0.3625131, 0.0688109, 0.1764706, 1, 0, 1,
-0.5323279, -2.190062, -3.263789, 0.1686275, 1, 0, 1,
-0.5316842, 0.6393205, 0.1227205, 0.1647059, 1, 0, 1,
-0.5300915, -1.135499, -1.809452, 0.1568628, 1, 0, 1,
-0.528527, 0.5135337, 0.1529456, 0.1529412, 1, 0, 1,
-0.5224397, -0.4866323, -1.088067, 0.145098, 1, 0, 1,
-0.5200989, -0.7497226, -4.484078, 0.1411765, 1, 0, 1,
-0.5163329, 0.004113322, -3.349389, 0.1333333, 1, 0, 1,
-0.5044744, 1.456884, -3.606166, 0.1294118, 1, 0, 1,
-0.5019354, -0.6857959, -2.509655, 0.1215686, 1, 0, 1,
-0.5003926, -0.3215856, -2.033403, 0.1176471, 1, 0, 1,
-0.4998044, 1.535038, 0.6233577, 0.1098039, 1, 0, 1,
-0.4971013, -0.4844714, -4.719164, 0.1058824, 1, 0, 1,
-0.4948871, -0.1908421, -0.9293185, 0.09803922, 1, 0, 1,
-0.4948634, 0.8030344, -1.978282, 0.09019608, 1, 0, 1,
-0.4941709, 2.169633, -0.7575058, 0.08627451, 1, 0, 1,
-0.4933154, -0.5138357, -1.196288, 0.07843138, 1, 0, 1,
-0.491621, -0.2893118, -1.956284, 0.07450981, 1, 0, 1,
-0.4861038, 0.1720265, -1.559625, 0.06666667, 1, 0, 1,
-0.4856485, 0.3643638, -1.822211, 0.0627451, 1, 0, 1,
-0.484296, -0.3797685, -2.384574, 0.05490196, 1, 0, 1,
-0.4835353, 1.502853, 0.3109775, 0.05098039, 1, 0, 1,
-0.4810807, 0.2564565, -1.719954, 0.04313726, 1, 0, 1,
-0.4801732, 0.7133284, -0.1189027, 0.03921569, 1, 0, 1,
-0.479312, -0.485736, -2.750673, 0.03137255, 1, 0, 1,
-0.4704657, 0.03625363, -0.3513663, 0.02745098, 1, 0, 1,
-0.4698627, 1.91491, 0.2280813, 0.01960784, 1, 0, 1,
-0.4671207, -0.7931314, -2.086469, 0.01568628, 1, 0, 1,
-0.4662282, -1.892916, -3.42546, 0.007843138, 1, 0, 1,
-0.4606512, 0.01233478, -2.423459, 0.003921569, 1, 0, 1,
-0.457162, 0.198835, 0.7963147, 0, 1, 0.003921569, 1,
-0.4545349, -0.1988081, -2.09887, 0, 1, 0.01176471, 1,
-0.4527179, 1.517791, -1.906774, 0, 1, 0.01568628, 1,
-0.4525299, 0.5278869, -0.5408772, 0, 1, 0.02352941, 1,
-0.4514447, 0.5818009, -1.506033, 0, 1, 0.02745098, 1,
-0.4500143, 0.3681965, -0.5201609, 0, 1, 0.03529412, 1,
-0.4462183, -0.6180699, -3.602889, 0, 1, 0.03921569, 1,
-0.4440379, 0.4489402, -1.858074, 0, 1, 0.04705882, 1,
-0.4392808, 0.2854819, -0.6127826, 0, 1, 0.05098039, 1,
-0.4372251, -1.582851, -1.406534, 0, 1, 0.05882353, 1,
-0.4365486, 0.4097723, 0.1243178, 0, 1, 0.0627451, 1,
-0.4330848, 1.378187, -0.01112098, 0, 1, 0.07058824, 1,
-0.4284066, -1.56924, -2.498377, 0, 1, 0.07450981, 1,
-0.4273477, 0.9103206, -0.002708073, 0, 1, 0.08235294, 1,
-0.4190678, -0.9450675, -1.332299, 0, 1, 0.08627451, 1,
-0.4189491, 0.3803163, -0.08227993, 0, 1, 0.09411765, 1,
-0.4163515, -2.405032, -3.681494, 0, 1, 0.1019608, 1,
-0.4097637, 1.363822, 0.811197, 0, 1, 0.1058824, 1,
-0.408821, -0.01331892, -0.6387852, 0, 1, 0.1137255, 1,
-0.4082305, -1.294707, -4.324915, 0, 1, 0.1176471, 1,
-0.4080565, -1.358286, -2.132194, 0, 1, 0.1254902, 1,
-0.4073601, 2.131811, -0.9975865, 0, 1, 0.1294118, 1,
-0.4017865, 0.3675449, -0.3995419, 0, 1, 0.1372549, 1,
-0.3961221, 1.896415, 1.249375, 0, 1, 0.1411765, 1,
-0.395882, -1.808135, -2.662165, 0, 1, 0.1490196, 1,
-0.3952404, 1.450686, -0.2280303, 0, 1, 0.1529412, 1,
-0.3950416, 0.3559374, 0.2719342, 0, 1, 0.1607843, 1,
-0.3946624, -1.149289, -3.169889, 0, 1, 0.1647059, 1,
-0.3902064, -1.09141, -2.905557, 0, 1, 0.172549, 1,
-0.3896863, -0.500266, -3.34737, 0, 1, 0.1764706, 1,
-0.3848918, 0.06313744, -1.855747, 0, 1, 0.1843137, 1,
-0.3785187, -2.142673, -2.530328, 0, 1, 0.1882353, 1,
-0.3709604, -0.08483891, -2.909991, 0, 1, 0.1960784, 1,
-0.37087, -1.455813, -2.261811, 0, 1, 0.2039216, 1,
-0.3698933, -0.112765, -1.830975, 0, 1, 0.2078431, 1,
-0.3696359, -0.4279203, -3.069966, 0, 1, 0.2156863, 1,
-0.3691117, 0.1698306, -1.147064, 0, 1, 0.2196078, 1,
-0.3665726, 0.4257002, -2.352568, 0, 1, 0.227451, 1,
-0.3620909, -0.6140079, -4.255647, 0, 1, 0.2313726, 1,
-0.3604131, 0.6825439, -0.1616765, 0, 1, 0.2392157, 1,
-0.3578897, 0.3131712, -2.078627, 0, 1, 0.2431373, 1,
-0.354105, -2.290438, -2.448411, 0, 1, 0.2509804, 1,
-0.3515062, 1.037288, -0.3397919, 0, 1, 0.254902, 1,
-0.3506754, -0.1666659, -1.551682, 0, 1, 0.2627451, 1,
-0.3478111, -2.129554, -3.260234, 0, 1, 0.2666667, 1,
-0.3360306, -1.265386, -3.009037, 0, 1, 0.2745098, 1,
-0.3340478, 0.8451305, 2.906697, 0, 1, 0.2784314, 1,
-0.3320769, -1.415762, -1.182687, 0, 1, 0.2862745, 1,
-0.3317453, 0.7512822, 1.459202, 0, 1, 0.2901961, 1,
-0.3289566, 0.09827114, -0.7147411, 0, 1, 0.2980392, 1,
-0.3289513, -0.124924, -1.848459, 0, 1, 0.3058824, 1,
-0.3189369, -0.4818039, -2.741822, 0, 1, 0.3098039, 1,
-0.3152998, 1.874237, -0.3877861, 0, 1, 0.3176471, 1,
-0.3138697, -1.252017, -2.995773, 0, 1, 0.3215686, 1,
-0.3082684, -0.0283418, -1.465506, 0, 1, 0.3294118, 1,
-0.3041101, -1.913976, -2.081622, 0, 1, 0.3333333, 1,
-0.3040259, -1.572535, -2.512021, 0, 1, 0.3411765, 1,
-0.3031788, -0.8357175, -0.6741384, 0, 1, 0.345098, 1,
-0.3028772, -0.5898602, -0.7755497, 0, 1, 0.3529412, 1,
-0.3022775, 1.128207, 1.677885, 0, 1, 0.3568628, 1,
-0.3020865, -2.487259, -2.052027, 0, 1, 0.3647059, 1,
-0.2995461, -0.3723169, -3.063831, 0, 1, 0.3686275, 1,
-0.2974338, 0.1354063, -0.9012197, 0, 1, 0.3764706, 1,
-0.2958186, -0.7218223, -1.983597, 0, 1, 0.3803922, 1,
-0.2939425, -1.144864, -1.927407, 0, 1, 0.3882353, 1,
-0.2858744, 0.2395419, -2.571113, 0, 1, 0.3921569, 1,
-0.2836697, 0.8899671, 0.09327779, 0, 1, 0.4, 1,
-0.2816455, -1.325715, -2.589116, 0, 1, 0.4078431, 1,
-0.2799098, 0.9384918, -1.092185, 0, 1, 0.4117647, 1,
-0.2789574, 0.1933383, -2.337567, 0, 1, 0.4196078, 1,
-0.2763328, -0.4067437, -2.500741, 0, 1, 0.4235294, 1,
-0.2737977, 1.322492, -0.9687868, 0, 1, 0.4313726, 1,
-0.2709154, -0.08870744, -3.134902, 0, 1, 0.4352941, 1,
-0.2704949, 0.06337088, -1.412466, 0, 1, 0.4431373, 1,
-0.2693055, 1.447501, 0.6250501, 0, 1, 0.4470588, 1,
-0.2632309, 1.21304, -0.9970556, 0, 1, 0.454902, 1,
-0.2627675, 0.223475, 0.2845336, 0, 1, 0.4588235, 1,
-0.2595052, 1.177891, 0.8863423, 0, 1, 0.4666667, 1,
-0.2585722, 0.7498982, 2.660386, 0, 1, 0.4705882, 1,
-0.2542512, -1.270442, -3.428932, 0, 1, 0.4784314, 1,
-0.2498277, 1.102285, 1.766679, 0, 1, 0.4823529, 1,
-0.2475073, 0.3741301, -2.120732, 0, 1, 0.4901961, 1,
-0.246432, -1.470263, -4.330446, 0, 1, 0.4941176, 1,
-0.2441589, 1.061164, -0.1496826, 0, 1, 0.5019608, 1,
-0.2371543, -0.7052936, -2.987626, 0, 1, 0.509804, 1,
-0.2368612, 0.8560087, -0.7710806, 0, 1, 0.5137255, 1,
-0.2343247, 0.7443371, -0.581521, 0, 1, 0.5215687, 1,
-0.2321256, -0.3931956, -4.056996, 0, 1, 0.5254902, 1,
-0.2285483, 0.3802464, 0.1050906, 0, 1, 0.5333334, 1,
-0.2283571, 1.037347, 0.1410544, 0, 1, 0.5372549, 1,
-0.2251911, 0.7473462, 1.375692, 0, 1, 0.5450981, 1,
-0.2207358, -0.396449, -1.556077, 0, 1, 0.5490196, 1,
-0.2206413, 0.3898706, -0.5704106, 0, 1, 0.5568628, 1,
-0.2186165, 0.933459, 1.105227, 0, 1, 0.5607843, 1,
-0.2144282, -0.38324, -1.427387, 0, 1, 0.5686275, 1,
-0.2050685, -0.622457, -2.869156, 0, 1, 0.572549, 1,
-0.2026732, 2.071778, 0.3030497, 0, 1, 0.5803922, 1,
-0.1981382, -0.1497227, -2.795902, 0, 1, 0.5843138, 1,
-0.1910136, -0.4186944, -3.419621, 0, 1, 0.5921569, 1,
-0.1903111, 0.2202884, -1.711944, 0, 1, 0.5960785, 1,
-0.1900611, 0.7019686, -0.9399561, 0, 1, 0.6039216, 1,
-0.1900293, 0.1051632, -2.062565, 0, 1, 0.6117647, 1,
-0.189432, -0.1829158, -2.890277, 0, 1, 0.6156863, 1,
-0.1870358, -0.3990532, -2.861825, 0, 1, 0.6235294, 1,
-0.1851049, -0.3297642, -2.039055, 0, 1, 0.627451, 1,
-0.1850243, 0.3041432, 1.196807, 0, 1, 0.6352941, 1,
-0.1815474, -0.4248956, -3.348952, 0, 1, 0.6392157, 1,
-0.1767819, -0.6629193, -4.153991, 0, 1, 0.6470588, 1,
-0.1678652, 0.2561856, -1.258203, 0, 1, 0.6509804, 1,
-0.1646529, -1.037494, -4.228212, 0, 1, 0.6588235, 1,
-0.1588343, 1.302108, -1.247291, 0, 1, 0.6627451, 1,
-0.1572288, -0.8906308, -1.787853, 0, 1, 0.6705883, 1,
-0.157142, 0.5851827, -1.975552, 0, 1, 0.6745098, 1,
-0.1500843, -0.906881, -2.712166, 0, 1, 0.682353, 1,
-0.1471885, -0.7654235, -3.529701, 0, 1, 0.6862745, 1,
-0.1471491, 0.8985396, 0.1213485, 0, 1, 0.6941177, 1,
-0.1471402, 1.246224, 0.1500459, 0, 1, 0.7019608, 1,
-0.1451139, 0.6887666, 0.4008912, 0, 1, 0.7058824, 1,
-0.144731, -1.474948, -0.9181939, 0, 1, 0.7137255, 1,
-0.1446093, 1.126663, 1.611489, 0, 1, 0.7176471, 1,
-0.1401904, 0.07330532, 0.5854251, 0, 1, 0.7254902, 1,
-0.134332, 0.1272871, -1.837897, 0, 1, 0.7294118, 1,
-0.1250667, -0.1381594, -3.816195, 0, 1, 0.7372549, 1,
-0.1231274, 0.1330154, -1.053374, 0, 1, 0.7411765, 1,
-0.1222603, -0.2304487, -3.058525, 0, 1, 0.7490196, 1,
-0.1216279, -0.8316392, -3.243933, 0, 1, 0.7529412, 1,
-0.1155455, 1.771452, -0.9719084, 0, 1, 0.7607843, 1,
-0.1139776, -0.4319337, -5.522928, 0, 1, 0.7647059, 1,
-0.1121436, -0.639852, -4.356439, 0, 1, 0.772549, 1,
-0.1111696, 0.9514358, -1.658927, 0, 1, 0.7764706, 1,
-0.1069926, -1.804518, -2.947411, 0, 1, 0.7843137, 1,
-0.1063477, -0.282559, -2.697716, 0, 1, 0.7882353, 1,
-0.1059357, -0.8040798, -3.348185, 0, 1, 0.7960784, 1,
-0.1059253, 0.7978376, -0.5770375, 0, 1, 0.8039216, 1,
-0.1044974, -0.8024318, -4.134532, 0, 1, 0.8078431, 1,
-0.1027633, -0.4245785, -3.248163, 0, 1, 0.8156863, 1,
-0.1009105, -0.8979689, -2.607491, 0, 1, 0.8196079, 1,
-0.09548185, 0.9007118, -0.6788631, 0, 1, 0.827451, 1,
-0.09479415, 0.2545525, -0.7905908, 0, 1, 0.8313726, 1,
-0.09338399, -1.028787, -2.511783, 0, 1, 0.8392157, 1,
-0.08743899, -0.8067791, -3.765735, 0, 1, 0.8431373, 1,
-0.08596932, 0.6809783, -0.6443599, 0, 1, 0.8509804, 1,
-0.07845574, 1.611283, -0.1267203, 0, 1, 0.854902, 1,
-0.07579517, 0.988386, 0.4983054, 0, 1, 0.8627451, 1,
-0.07375067, 0.4547631, 0.05590966, 0, 1, 0.8666667, 1,
-0.06648914, 0.6251691, 1.036535, 0, 1, 0.8745098, 1,
-0.06115299, 1.106161, 1.705293, 0, 1, 0.8784314, 1,
-0.06071506, 1.272828, 0.8359258, 0, 1, 0.8862745, 1,
-0.05692338, 0.4894016, 0.5925454, 0, 1, 0.8901961, 1,
-0.05620338, 1.137226, -1.295891, 0, 1, 0.8980392, 1,
-0.05573814, -0.3189142, -1.382668, 0, 1, 0.9058824, 1,
-0.0535662, -1.033704, -2.65526, 0, 1, 0.9098039, 1,
-0.05252728, -0.1513831, -2.4369, 0, 1, 0.9176471, 1,
-0.04926942, 2.120999, 2.075053, 0, 1, 0.9215686, 1,
-0.0476553, -0.03813159, -3.685937, 0, 1, 0.9294118, 1,
-0.04745384, 1.699816, 1.91436, 0, 1, 0.9333333, 1,
-0.04686074, -0.8622607, -4.873384, 0, 1, 0.9411765, 1,
-0.04463967, -1.005426, -2.486272, 0, 1, 0.945098, 1,
-0.04409001, -0.9639744, -3.365103, 0, 1, 0.9529412, 1,
-0.04371972, 3.020773, 1.47462, 0, 1, 0.9568627, 1,
-0.04362321, -1.597312, -3.73151, 0, 1, 0.9647059, 1,
-0.04064739, -1.344581, -4.440994, 0, 1, 0.9686275, 1,
-0.03994969, 0.4777858, 1.161903, 0, 1, 0.9764706, 1,
-0.03831479, 1.513982, -0.402674, 0, 1, 0.9803922, 1,
-0.03448546, -0.008491411, -2.967526, 0, 1, 0.9882353, 1,
-0.03363223, 0.1216465, 1.051084, 0, 1, 0.9921569, 1,
-0.02774115, -0.5845333, -0.6647808, 0, 1, 1, 1,
-0.02748367, 0.3217969, -3.804985, 0, 0.9921569, 1, 1,
-0.02661817, -0.1550876, -3.634091, 0, 0.9882353, 1, 1,
-0.01946893, -2.495763, -2.920667, 0, 0.9803922, 1, 1,
-0.01335423, -1.193667, -2.977402, 0, 0.9764706, 1, 1,
-0.01266288, -1.680931, -2.130498, 0, 0.9686275, 1, 1,
-0.01079642, 1.592795, -0.596175, 0, 0.9647059, 1, 1,
-0.01011046, -1.267401, -2.623324, 0, 0.9568627, 1, 1,
-0.008820551, -0.1129764, -4.910586, 0, 0.9529412, 1, 1,
-0.008515605, 1.657334, 0.2650447, 0, 0.945098, 1, 1,
-0.005657476, 1.497086, -0.2136986, 0, 0.9411765, 1, 1,
-0.004099265, 0.02955894, 0.5409086, 0, 0.9333333, 1, 1,
-0.002028411, 1.668903, -0.216473, 0, 0.9294118, 1, 1,
-0.000722828, -0.1762399, -4.931421, 0, 0.9215686, 1, 1,
0.002944166, 0.9093502, -0.861805, 0, 0.9176471, 1, 1,
0.003120658, 2.179177, -0.3120831, 0, 0.9098039, 1, 1,
0.009113536, 2.552925, -0.2502575, 0, 0.9058824, 1, 1,
0.01052366, 0.8140312, -0.01596217, 0, 0.8980392, 1, 1,
0.01598757, -1.536714, 3.07508, 0, 0.8901961, 1, 1,
0.01744143, -0.3220579, 2.420325, 0, 0.8862745, 1, 1,
0.02210183, -0.3464629, 2.85584, 0, 0.8784314, 1, 1,
0.02761663, -2.329769, 2.383568, 0, 0.8745098, 1, 1,
0.03255383, 0.06890261, -0.3623612, 0, 0.8666667, 1, 1,
0.03598364, 0.1635426, -1.267627, 0, 0.8627451, 1, 1,
0.03822562, -0.966094, 2.933792, 0, 0.854902, 1, 1,
0.03869355, 0.5511694, 0.6418034, 0, 0.8509804, 1, 1,
0.03953477, -0.6728774, 2.86821, 0, 0.8431373, 1, 1,
0.0435724, 0.05838725, 0.6454049, 0, 0.8392157, 1, 1,
0.04734548, 0.415975, 0.8406134, 0, 0.8313726, 1, 1,
0.04793611, -0.3033722, 3.237952, 0, 0.827451, 1, 1,
0.05065694, -0.4601251, 2.184921, 0, 0.8196079, 1, 1,
0.05141256, -1.489031, 4.103371, 0, 0.8156863, 1, 1,
0.05557249, 1.520376, 0.7514795, 0, 0.8078431, 1, 1,
0.06276425, -0.8671384, 1.026238, 0, 0.8039216, 1, 1,
0.06733169, 0.4802892, -0.01436392, 0, 0.7960784, 1, 1,
0.06872056, 1.454852, -0.2523786, 0, 0.7882353, 1, 1,
0.07441929, -0.4041358, 3.096765, 0, 0.7843137, 1, 1,
0.07944053, 0.191952, 0.9986784, 0, 0.7764706, 1, 1,
0.08017652, 0.07173994, 1.924911, 0, 0.772549, 1, 1,
0.08115968, -0.8803651, 4.264105, 0, 0.7647059, 1, 1,
0.08308152, -0.4161024, 3.022309, 0, 0.7607843, 1, 1,
0.08544682, 1.333357, 0.7029068, 0, 0.7529412, 1, 1,
0.08817253, 0.1881241, -0.8170259, 0, 0.7490196, 1, 1,
0.0886793, 1.053189, 1.128995, 0, 0.7411765, 1, 1,
0.09080164, 1.112108, 0.06907682, 0, 0.7372549, 1, 1,
0.09398297, -0.2659609, 1.581902, 0, 0.7294118, 1, 1,
0.0941668, -0.9430715, 2.187469, 0, 0.7254902, 1, 1,
0.09492305, 0.5534835, -0.1422206, 0, 0.7176471, 1, 1,
0.09694961, 0.6360781, -0.3624629, 0, 0.7137255, 1, 1,
0.1017526, 0.06229153, 0.8721206, 0, 0.7058824, 1, 1,
0.102136, -0.9514463, 2.576547, 0, 0.6980392, 1, 1,
0.1024703, 0.6848112, 1.231467, 0, 0.6941177, 1, 1,
0.1089221, 0.2255585, 1.059637, 0, 0.6862745, 1, 1,
0.114273, -1.83053, 3.490144, 0, 0.682353, 1, 1,
0.114316, -0.6822408, 2.255275, 0, 0.6745098, 1, 1,
0.1145497, 1.706368, 0.683716, 0, 0.6705883, 1, 1,
0.1147639, -0.1492586, 1.548487, 0, 0.6627451, 1, 1,
0.1152832, 0.476408, 0.1177543, 0, 0.6588235, 1, 1,
0.1180304, -1.246937, 4.554843, 0, 0.6509804, 1, 1,
0.1182292, -0.7787546, 3.800564, 0, 0.6470588, 1, 1,
0.1211816, -1.914782, 0.9330053, 0, 0.6392157, 1, 1,
0.1227075, -0.2747904, 3.783219, 0, 0.6352941, 1, 1,
0.1345883, -0.9347071, 0.9177165, 0, 0.627451, 1, 1,
0.1354355, -0.8224369, 4.287129, 0, 0.6235294, 1, 1,
0.1364571, -1.830564, 3.232382, 0, 0.6156863, 1, 1,
0.1394438, -0.3548788, 2.712954, 0, 0.6117647, 1, 1,
0.1435444, -0.6377328, 4.342725, 0, 0.6039216, 1, 1,
0.1437487, -0.2457533, 1.806288, 0, 0.5960785, 1, 1,
0.1499551, -0.9506716, 2.364249, 0, 0.5921569, 1, 1,
0.1587191, 0.7610688, 1.614574, 0, 0.5843138, 1, 1,
0.1651395, 0.32804, 1.539783, 0, 0.5803922, 1, 1,
0.1697109, -0.1471165, 1.423013, 0, 0.572549, 1, 1,
0.1699072, -0.2685757, 3.923985, 0, 0.5686275, 1, 1,
0.1707172, -0.2972925, 2.098124, 0, 0.5607843, 1, 1,
0.1717097, 0.3686959, -2.357315, 0, 0.5568628, 1, 1,
0.1721451, -0.4659164, 0.7941473, 0, 0.5490196, 1, 1,
0.1759496, 0.5489254, 1.303702, 0, 0.5450981, 1, 1,
0.1782456, -0.5491192, 1.914482, 0, 0.5372549, 1, 1,
0.1814127, 0.09180153, 0.6630892, 0, 0.5333334, 1, 1,
0.1814265, 0.1371349, 0.401528, 0, 0.5254902, 1, 1,
0.1830848, -1.15686, 1.703704, 0, 0.5215687, 1, 1,
0.1835013, -0.03576541, 0.8299199, 0, 0.5137255, 1, 1,
0.1843917, 0.5941542, 0.07976258, 0, 0.509804, 1, 1,
0.1869422, -0.1905683, 4.411482, 0, 0.5019608, 1, 1,
0.1890491, -0.2357242, 1.231352, 0, 0.4941176, 1, 1,
0.1899991, -0.7965707, 3.338335, 0, 0.4901961, 1, 1,
0.1905766, 1.676533, -0.1924564, 0, 0.4823529, 1, 1,
0.1907174, 0.928252, 0.4674904, 0, 0.4784314, 1, 1,
0.1954362, -1.339575, 3.305111, 0, 0.4705882, 1, 1,
0.1969587, 1.013619, -0.6779727, 0, 0.4666667, 1, 1,
0.1978562, 0.3367702, -0.6789649, 0, 0.4588235, 1, 1,
0.1979404, -0.4951293, 2.974756, 0, 0.454902, 1, 1,
0.2001181, 0.07169886, 1.384773, 0, 0.4470588, 1, 1,
0.200905, 0.9144978, 1.968164, 0, 0.4431373, 1, 1,
0.2124704, -1.771129, 5.274802, 0, 0.4352941, 1, 1,
0.2148477, -0.004017022, 1.195099, 0, 0.4313726, 1, 1,
0.2283677, 1.47804, -0.5421661, 0, 0.4235294, 1, 1,
0.2287069, -1.53526, 1.714585, 0, 0.4196078, 1, 1,
0.2294242, 0.4906262, 1.144126, 0, 0.4117647, 1, 1,
0.2296282, -0.3899925, 1.615441, 0, 0.4078431, 1, 1,
0.2309587, -0.08307025, 1.541232, 0, 0.4, 1, 1,
0.2314997, 0.01345449, 2.843021, 0, 0.3921569, 1, 1,
0.2319005, -0.9641037, 3.618579, 0, 0.3882353, 1, 1,
0.2336981, -1.335433, 1.793515, 0, 0.3803922, 1, 1,
0.2403727, -1.549829, 2.231784, 0, 0.3764706, 1, 1,
0.2421221, -1.39933, 4.462633, 0, 0.3686275, 1, 1,
0.2423485, -0.6770923, 1.709648, 0, 0.3647059, 1, 1,
0.2470895, 1.012413, 1.934036, 0, 0.3568628, 1, 1,
0.2502654, 0.1311303, 1.939336, 0, 0.3529412, 1, 1,
0.2538669, 0.7071709, -0.9075245, 0, 0.345098, 1, 1,
0.2573731, -0.3643718, 2.037526, 0, 0.3411765, 1, 1,
0.2587121, -1.164539, 3.267955, 0, 0.3333333, 1, 1,
0.2613085, 0.568232, 0.2228283, 0, 0.3294118, 1, 1,
0.2645314, -0.2252769, 3.340678, 0, 0.3215686, 1, 1,
0.2647178, -0.752592, 3.312937, 0, 0.3176471, 1, 1,
0.2666569, 0.8632947, 0.396069, 0, 0.3098039, 1, 1,
0.2674602, 0.2972046, 1.485344, 0, 0.3058824, 1, 1,
0.2733493, -0.6942653, 3.406185, 0, 0.2980392, 1, 1,
0.2755616, 0.5417182, -0.06264232, 0, 0.2901961, 1, 1,
0.2784354, -0.423385, 2.014179, 0, 0.2862745, 1, 1,
0.2796, 1.280805, -0.8516375, 0, 0.2784314, 1, 1,
0.2799344, 0.1618803, 1.583243, 0, 0.2745098, 1, 1,
0.2811922, 0.5774627, 0.1869557, 0, 0.2666667, 1, 1,
0.2834017, -1.953122, 3.32465, 0, 0.2627451, 1, 1,
0.2903692, 0.7223414, 0.04349895, 0, 0.254902, 1, 1,
0.2907447, 0.4404095, -0.1021887, 0, 0.2509804, 1, 1,
0.2915984, -1.527038, 4.490096, 0, 0.2431373, 1, 1,
0.2938465, -1.130217, 4.824169, 0, 0.2392157, 1, 1,
0.299557, -0.1552692, 2.558356, 0, 0.2313726, 1, 1,
0.3012107, 1.304732, 0.7985505, 0, 0.227451, 1, 1,
0.3013645, -1.997983, 2.000684, 0, 0.2196078, 1, 1,
0.3027774, -0.1119239, -0.3215204, 0, 0.2156863, 1, 1,
0.3048956, -0.4057065, 3.190158, 0, 0.2078431, 1, 1,
0.306681, 0.5779904, -0.4664765, 0, 0.2039216, 1, 1,
0.3067283, 0.657518, 0.6061062, 0, 0.1960784, 1, 1,
0.3146163, -0.4301204, 2.282023, 0, 0.1882353, 1, 1,
0.316447, 0.5734427, 0.9001212, 0, 0.1843137, 1, 1,
0.3165787, -2.817867, 3.545397, 0, 0.1764706, 1, 1,
0.3173118, 0.7317495, -0.4106618, 0, 0.172549, 1, 1,
0.322978, 0.1428262, 1.683777, 0, 0.1647059, 1, 1,
0.3230414, -0.8207167, 3.295162, 0, 0.1607843, 1, 1,
0.3254045, 0.02933048, 1.342022, 0, 0.1529412, 1, 1,
0.325781, 0.648653, -0.5461102, 0, 0.1490196, 1, 1,
0.3262212, -0.001571607, 1.465012, 0, 0.1411765, 1, 1,
0.3392103, -0.7284277, 3.959227, 0, 0.1372549, 1, 1,
0.340938, -0.0237378, 2.192193, 0, 0.1294118, 1, 1,
0.3508821, 0.2243789, 0.8756118, 0, 0.1254902, 1, 1,
0.3511009, -0.2780803, 2.237022, 0, 0.1176471, 1, 1,
0.3532053, -0.03645292, 1.734203, 0, 0.1137255, 1, 1,
0.3541284, 1.473119, 0.6230448, 0, 0.1058824, 1, 1,
0.3541952, 0.3793586, 2.594922, 0, 0.09803922, 1, 1,
0.3559971, -2.474485, 3.232578, 0, 0.09411765, 1, 1,
0.3587804, -1.709405, 2.144187, 0, 0.08627451, 1, 1,
0.3661845, 0.8545602, -0.2742075, 0, 0.08235294, 1, 1,
0.3698178, 0.2196166, 1.374286, 0, 0.07450981, 1, 1,
0.3703191, 0.52481, 0.5505788, 0, 0.07058824, 1, 1,
0.3731839, 0.1412068, 2.481059, 0, 0.0627451, 1, 1,
0.3769027, -0.9671794, 2.983351, 0, 0.05882353, 1, 1,
0.3774528, -0.3776982, 1.681423, 0, 0.05098039, 1, 1,
0.3792065, 0.4302575, 0.3352848, 0, 0.04705882, 1, 1,
0.3821948, 0.6519627, 0.7639353, 0, 0.03921569, 1, 1,
0.3862638, 0.2830788, 0.6219706, 0, 0.03529412, 1, 1,
0.3875639, -0.3300242, 1.344393, 0, 0.02745098, 1, 1,
0.3885608, -0.1217329, 1.261017, 0, 0.02352941, 1, 1,
0.3886195, -0.3467714, 2.564562, 0, 0.01568628, 1, 1,
0.3912829, -0.4279158, 4.770833, 0, 0.01176471, 1, 1,
0.3969103, 0.3315257, 0.2464527, 0, 0.003921569, 1, 1,
0.3971316, 0.1519334, 1.877591, 0.003921569, 0, 1, 1,
0.4025437, 0.1547226, 2.030605, 0.007843138, 0, 1, 1,
0.4038939, 1.477836, 0.04261694, 0.01568628, 0, 1, 1,
0.4056465, -0.8526791, 2.808345, 0.01960784, 0, 1, 1,
0.4190303, -1.454062, 1.736717, 0.02745098, 0, 1, 1,
0.4196151, 0.3454918, 0.6639294, 0.03137255, 0, 1, 1,
0.424505, -1.864737, 1.803033, 0.03921569, 0, 1, 1,
0.4253927, 1.491216, -0.3365484, 0.04313726, 0, 1, 1,
0.4259202, 0.2047797, 2.921149, 0.05098039, 0, 1, 1,
0.4260132, -0.6383656, 2.311013, 0.05490196, 0, 1, 1,
0.4283189, 0.688439, 0.2801864, 0.0627451, 0, 1, 1,
0.4322421, 0.2509079, 1.370348, 0.06666667, 0, 1, 1,
0.4341375, 1.081605, 0.9130633, 0.07450981, 0, 1, 1,
0.434177, -0.8992821, 2.919523, 0.07843138, 0, 1, 1,
0.4420653, -0.6852912, 3.391931, 0.08627451, 0, 1, 1,
0.4424349, 0.2273358, 1.289699, 0.09019608, 0, 1, 1,
0.4468676, -1.277963, 3.008475, 0.09803922, 0, 1, 1,
0.4474857, -0.02507262, 1.482687, 0.1058824, 0, 1, 1,
0.4581767, -1.320673, 2.371397, 0.1098039, 0, 1, 1,
0.4641227, 0.6444623, -1.566378, 0.1176471, 0, 1, 1,
0.4658498, -0.4402563, 1.595224, 0.1215686, 0, 1, 1,
0.4675606, -0.9760808, 4.846579, 0.1294118, 0, 1, 1,
0.4777315, -1.157069, 3.55192, 0.1333333, 0, 1, 1,
0.4826108, 0.5025117, -0.0879658, 0.1411765, 0, 1, 1,
0.4837191, -0.3762281, 1.422628, 0.145098, 0, 1, 1,
0.4839021, 0.1357175, -0.08784647, 0.1529412, 0, 1, 1,
0.4873114, -1.111172, 4.01826, 0.1568628, 0, 1, 1,
0.4886928, -0.1280589, 4.276802, 0.1647059, 0, 1, 1,
0.4892733, 0.0175535, 1.50298, 0.1686275, 0, 1, 1,
0.4955955, 0.8236547, 1.861783, 0.1764706, 0, 1, 1,
0.4987253, 0.9996638, 0.3850527, 0.1803922, 0, 1, 1,
0.5029644, 0.8540304, 2.689683, 0.1882353, 0, 1, 1,
0.5046648, -0.5491764, 1.601757, 0.1921569, 0, 1, 1,
0.50688, -1.726253, 2.030463, 0.2, 0, 1, 1,
0.5104761, -2.06443, 2.464565, 0.2078431, 0, 1, 1,
0.5128967, -0.6264786, 2.752327, 0.2117647, 0, 1, 1,
0.5130749, 0.3020505, 0.7027061, 0.2196078, 0, 1, 1,
0.5139037, -0.6153989, 2.274385, 0.2235294, 0, 1, 1,
0.5189564, -0.4855801, 0.7883889, 0.2313726, 0, 1, 1,
0.5234659, -0.8502905, 2.649391, 0.2352941, 0, 1, 1,
0.5272129, -1.404588, 3.929759, 0.2431373, 0, 1, 1,
0.5316919, 0.2366734, 0.2076032, 0.2470588, 0, 1, 1,
0.5326217, 1.075469, -0.2931474, 0.254902, 0, 1, 1,
0.536266, -0.6969599, 2.19198, 0.2588235, 0, 1, 1,
0.5362902, -0.8416414, 3.767272, 0.2666667, 0, 1, 1,
0.5389215, -0.6463506, 2.891927, 0.2705882, 0, 1, 1,
0.547026, -1.326064, 2.821756, 0.2784314, 0, 1, 1,
0.5502251, -0.9828311, 3.568529, 0.282353, 0, 1, 1,
0.5504953, 0.6851477, 1.66214, 0.2901961, 0, 1, 1,
0.5514265, 0.3740349, 1.497492, 0.2941177, 0, 1, 1,
0.5537546, 2.159818, 1.272754, 0.3019608, 0, 1, 1,
0.554333, 0.6984411, 0.06733424, 0.3098039, 0, 1, 1,
0.5554723, -0.7570462, 2.53454, 0.3137255, 0, 1, 1,
0.5586528, -0.6865185, 2.651369, 0.3215686, 0, 1, 1,
0.562939, -0.7245892, 2.0916, 0.3254902, 0, 1, 1,
0.5631253, 0.1040107, 1.260246, 0.3333333, 0, 1, 1,
0.566176, -1.524229, 2.910427, 0.3372549, 0, 1, 1,
0.5686707, -1.498384, 2.398722, 0.345098, 0, 1, 1,
0.5688888, -0.3368428, -0.6089419, 0.3490196, 0, 1, 1,
0.5738954, -1.37808, 2.846399, 0.3568628, 0, 1, 1,
0.5804937, -1.963701, 3.251827, 0.3607843, 0, 1, 1,
0.5844378, 1.073221, 2.27608, 0.3686275, 0, 1, 1,
0.5853178, -0.2760919, 1.179393, 0.372549, 0, 1, 1,
0.58564, -0.1409494, 1.303749, 0.3803922, 0, 1, 1,
0.5857624, -0.8230398, 2.523778, 0.3843137, 0, 1, 1,
0.5893809, 1.454512, -1.194233, 0.3921569, 0, 1, 1,
0.5927658, 1.517698, -2.018582, 0.3960784, 0, 1, 1,
0.6001018, -0.626014, 3.037801, 0.4039216, 0, 1, 1,
0.6012534, 1.404875, 1.486689, 0.4117647, 0, 1, 1,
0.6042935, 0.3431766, 1.25927, 0.4156863, 0, 1, 1,
0.6063249, 0.5537863, 1.642298, 0.4235294, 0, 1, 1,
0.6091977, -0.2920938, 2.37537, 0.427451, 0, 1, 1,
0.6099499, 1.798027, 0.3003501, 0.4352941, 0, 1, 1,
0.6155082, 0.4438074, 0.4871414, 0.4392157, 0, 1, 1,
0.6175109, -0.7183995, 0.8728759, 0.4470588, 0, 1, 1,
0.6207361, 0.4652453, 0.09415371, 0.4509804, 0, 1, 1,
0.6222398, -1.022444, 3.566972, 0.4588235, 0, 1, 1,
0.6253015, 0.6219632, 1.006467, 0.4627451, 0, 1, 1,
0.629011, 0.4723617, -0.09601917, 0.4705882, 0, 1, 1,
0.6341717, -0.6426605, 1.351501, 0.4745098, 0, 1, 1,
0.6342983, 0.8331575, 0.2944674, 0.4823529, 0, 1, 1,
0.6434672, 0.2717287, 0.6537676, 0.4862745, 0, 1, 1,
0.6445326, -0.4263457, 1.096293, 0.4941176, 0, 1, 1,
0.6512429, -1.645934, 0.3715349, 0.5019608, 0, 1, 1,
0.6517178, -1.788566, 3.537245, 0.5058824, 0, 1, 1,
0.6596137, -0.3903552, 1.762639, 0.5137255, 0, 1, 1,
0.6628534, -0.07287301, 2.060105, 0.5176471, 0, 1, 1,
0.6720876, 0.3514174, -0.1402199, 0.5254902, 0, 1, 1,
0.6775491, 1.439804, 0.4340252, 0.5294118, 0, 1, 1,
0.678497, -0.07654773, 0.1814437, 0.5372549, 0, 1, 1,
0.6801616, 0.4695887, 1.719842, 0.5411765, 0, 1, 1,
0.6865196, 0.8299088, 0.2619088, 0.5490196, 0, 1, 1,
0.6877542, 1.114249, -0.898307, 0.5529412, 0, 1, 1,
0.6883941, 0.8543782, -0.3642287, 0.5607843, 0, 1, 1,
0.6914557, 1.934746, -0.07763141, 0.5647059, 0, 1, 1,
0.6985771, 0.01984971, 2.052541, 0.572549, 0, 1, 1,
0.7017878, 0.9256096, -1.572293, 0.5764706, 0, 1, 1,
0.7030024, -0.2443383, 0.2174822, 0.5843138, 0, 1, 1,
0.7033809, 0.1393279, 1.027883, 0.5882353, 0, 1, 1,
0.7140353, 0.6164295, 0.08531488, 0.5960785, 0, 1, 1,
0.7168438, -0.7646533, 2.68989, 0.6039216, 0, 1, 1,
0.7231519, -0.03774477, 1.951772, 0.6078432, 0, 1, 1,
0.7255707, 0.406482, 0.313549, 0.6156863, 0, 1, 1,
0.7326637, -0.7423656, 1.247404, 0.6196079, 0, 1, 1,
0.7371196, -0.8210725, 1.855608, 0.627451, 0, 1, 1,
0.737393, 0.8624952, 0.9436455, 0.6313726, 0, 1, 1,
0.7386552, 0.6843005, 0.3730279, 0.6392157, 0, 1, 1,
0.7440579, -0.1253762, 3.073834, 0.6431373, 0, 1, 1,
0.7590755, -0.1138289, 2.894921, 0.6509804, 0, 1, 1,
0.7642012, 0.255547, 2.003896, 0.654902, 0, 1, 1,
0.7645059, -0.7010915, 2.581199, 0.6627451, 0, 1, 1,
0.765441, -0.3478732, 1.253931, 0.6666667, 0, 1, 1,
0.7662865, -0.9924092, 1.679644, 0.6745098, 0, 1, 1,
0.7687942, -0.7165468, 3.042535, 0.6784314, 0, 1, 1,
0.7740673, 0.2616872, 1.340553, 0.6862745, 0, 1, 1,
0.7748897, -1.150684, 2.899459, 0.6901961, 0, 1, 1,
0.7762621, 0.2900801, 0.6562479, 0.6980392, 0, 1, 1,
0.7797773, 1.696215, 0.8427565, 0.7058824, 0, 1, 1,
0.7805392, -0.9133562, 2.487571, 0.7098039, 0, 1, 1,
0.7817491, -0.288771, 0.279439, 0.7176471, 0, 1, 1,
0.7833185, -0.5491304, 2.352766, 0.7215686, 0, 1, 1,
0.7901023, -0.268107, 0.4882575, 0.7294118, 0, 1, 1,
0.7904583, -0.8073803, 1.997473, 0.7333333, 0, 1, 1,
0.7919391, -1.068506, 2.257396, 0.7411765, 0, 1, 1,
0.7957739, 1.041587, 0.8631546, 0.7450981, 0, 1, 1,
0.7978495, 0.8904731, -0.5640228, 0.7529412, 0, 1, 1,
0.7983916, 0.3553331, 2.742427, 0.7568628, 0, 1, 1,
0.8009069, -1.192708, 2.535212, 0.7647059, 0, 1, 1,
0.8016825, 1.656006, 0.06652844, 0.7686275, 0, 1, 1,
0.8056065, -0.3520367, 1.816108, 0.7764706, 0, 1, 1,
0.8068991, -2.462495, 1.320636, 0.7803922, 0, 1, 1,
0.8115961, -1.323884, 2.005443, 0.7882353, 0, 1, 1,
0.8120716, 1.688797, 0.8111426, 0.7921569, 0, 1, 1,
0.8184425, 1.554612, 1.388016, 0.8, 0, 1, 1,
0.8320891, -1.847724, 4.142793, 0.8078431, 0, 1, 1,
0.8328644, 0.8865525, 2.82314, 0.8117647, 0, 1, 1,
0.8365929, 0.6514469, 1.075929, 0.8196079, 0, 1, 1,
0.8482694, -0.03516702, 2.14488, 0.8235294, 0, 1, 1,
0.8556392, 0.9634984, -0.8116303, 0.8313726, 0, 1, 1,
0.8566822, 0.2908246, 0.6359819, 0.8352941, 0, 1, 1,
0.86074, -0.4526093, 0.9640918, 0.8431373, 0, 1, 1,
0.8626332, -0.5089322, 3.020195, 0.8470588, 0, 1, 1,
0.8634974, -0.8162183, 2.864968, 0.854902, 0, 1, 1,
0.8643879, -0.9620061, 2.034472, 0.8588235, 0, 1, 1,
0.8662657, 1.227899, 0.2752926, 0.8666667, 0, 1, 1,
0.8664466, 0.1625042, 0.9025126, 0.8705882, 0, 1, 1,
0.8739747, 0.733682, 0.8189357, 0.8784314, 0, 1, 1,
0.8751752, -0.5993367, 2.983224, 0.8823529, 0, 1, 1,
0.87617, -1.146554, 0.9987394, 0.8901961, 0, 1, 1,
0.8831829, -1.729581, 3.191821, 0.8941177, 0, 1, 1,
0.8871521, 0.3167095, 1.455071, 0.9019608, 0, 1, 1,
0.890031, -0.4763004, 0.9277623, 0.9098039, 0, 1, 1,
0.8916253, -2.136113, 2.766584, 0.9137255, 0, 1, 1,
0.8946801, 0.6694316, 0.5463855, 0.9215686, 0, 1, 1,
0.9051798, -0.1438708, 2.240929, 0.9254902, 0, 1, 1,
0.9161064, 0.5496399, 1.698082, 0.9333333, 0, 1, 1,
0.9192334, 0.907214, 0.9920337, 0.9372549, 0, 1, 1,
0.9210422, 0.9500239, 0.9312692, 0.945098, 0, 1, 1,
0.9214821, 0.5233869, -0.6923923, 0.9490196, 0, 1, 1,
0.9250078, 1.481528, -0.5176442, 0.9568627, 0, 1, 1,
0.9363015, 2.782766, 1.213128, 0.9607843, 0, 1, 1,
0.9508613, 0.5331309, 2.058083, 0.9686275, 0, 1, 1,
0.9550543, -0.1386878, 1.542533, 0.972549, 0, 1, 1,
0.9604797, -0.1982095, 1.525838, 0.9803922, 0, 1, 1,
0.9653029, 0.8600237, -0.1176963, 0.9843137, 0, 1, 1,
0.9809293, 2.658189, 0.9199317, 0.9921569, 0, 1, 1,
0.9810978, -0.009268123, 1.73447, 0.9960784, 0, 1, 1,
0.9811478, 0.1873243, 2.953172, 1, 0, 0.9960784, 1,
0.9841776, 0.02820133, 2.432486, 1, 0, 0.9882353, 1,
0.9913601, -0.3532786, 1.984927, 1, 0, 0.9843137, 1,
0.9936226, -0.7276198, 1.427057, 1, 0, 0.9764706, 1,
0.9976339, -0.1697921, 0.6328014, 1, 0, 0.972549, 1,
0.9998729, -0.69109, 1.59919, 1, 0, 0.9647059, 1,
1.002207, -1.607116, 1.938774, 1, 0, 0.9607843, 1,
1.012306, 1.905675, 1.006037, 1, 0, 0.9529412, 1,
1.019118, 1.552629, -0.03049958, 1, 0, 0.9490196, 1,
1.027206, -0.2487407, 2.503373, 1, 0, 0.9411765, 1,
1.031386, 0.3696473, -0.4200025, 1, 0, 0.9372549, 1,
1.031792, -0.1488185, 1.594098, 1, 0, 0.9294118, 1,
1.035807, -1.660488, 2.249066, 1, 0, 0.9254902, 1,
1.047632, -0.6399289, 1.413103, 1, 0, 0.9176471, 1,
1.048992, -0.2709966, 1.930125, 1, 0, 0.9137255, 1,
1.054531, 1.092038, 1.521413, 1, 0, 0.9058824, 1,
1.059119, 0.5725664, -1.015842, 1, 0, 0.9019608, 1,
1.060063, 0.2059874, 1.918734, 1, 0, 0.8941177, 1,
1.068231, 1.247018, 0.922373, 1, 0, 0.8862745, 1,
1.070947, -1.385041, 2.543598, 1, 0, 0.8823529, 1,
1.074225, 0.111749, 2.841069, 1, 0, 0.8745098, 1,
1.074527, 1.015741, 0.0634982, 1, 0, 0.8705882, 1,
1.077242, -0.4380492, 1.093564, 1, 0, 0.8627451, 1,
1.080528, 0.8288263, 1.980271, 1, 0, 0.8588235, 1,
1.086109, 1.017653, 0.4358704, 1, 0, 0.8509804, 1,
1.089397, -0.7804692, 2.007165, 1, 0, 0.8470588, 1,
1.089898, 0.76556, 0.08697343, 1, 0, 0.8392157, 1,
1.092136, -1.213205, 1.082846, 1, 0, 0.8352941, 1,
1.093728, 1.316779, -1.226917, 1, 0, 0.827451, 1,
1.10213, -0.01348921, 2.550735, 1, 0, 0.8235294, 1,
1.103251, -0.5196797, 0.9644439, 1, 0, 0.8156863, 1,
1.103622, -0.2260358, 0.5502577, 1, 0, 0.8117647, 1,
1.103689, -0.8296092, 2.803327, 1, 0, 0.8039216, 1,
1.106157, 1.47428, 0.1765798, 1, 0, 0.7960784, 1,
1.107159, 1.936113, 0.7477413, 1, 0, 0.7921569, 1,
1.109645, 0.3795733, 0.9873915, 1, 0, 0.7843137, 1,
1.111127, -0.6380346, 4.013355, 1, 0, 0.7803922, 1,
1.113527, 1.402078, 1.967761, 1, 0, 0.772549, 1,
1.116001, -1.247081, 1.043406, 1, 0, 0.7686275, 1,
1.121131, -1.340219, 2.271609, 1, 0, 0.7607843, 1,
1.127136, 0.4020673, 0.4934356, 1, 0, 0.7568628, 1,
1.127557, -1.097364, 1.536345, 1, 0, 0.7490196, 1,
1.145728, 1.077753, -1.365883, 1, 0, 0.7450981, 1,
1.156016, 0.3685269, -0.8009374, 1, 0, 0.7372549, 1,
1.157383, -0.3522629, 1.561034, 1, 0, 0.7333333, 1,
1.157746, 0.3076001, -0.5275871, 1, 0, 0.7254902, 1,
1.16618, -0.3865829, 3.09742, 1, 0, 0.7215686, 1,
1.175354, 0.458166, 0.8604025, 1, 0, 0.7137255, 1,
1.182074, 0.6378199, 1.644332, 1, 0, 0.7098039, 1,
1.186779, 1.040131, 2.216899, 1, 0, 0.7019608, 1,
1.188968, 1.078011, 0.3642075, 1, 0, 0.6941177, 1,
1.204853, -0.7228343, 3.241229, 1, 0, 0.6901961, 1,
1.221123, -0.07562044, 0.9556813, 1, 0, 0.682353, 1,
1.222475, -0.7705069, 1.33777, 1, 0, 0.6784314, 1,
1.236448, -1.48357, 3.185757, 1, 0, 0.6705883, 1,
1.237209, 1.681696, 0.7115181, 1, 0, 0.6666667, 1,
1.238526, -1.208792, 2.484018, 1, 0, 0.6588235, 1,
1.243255, 0.6189238, 1.653778, 1, 0, 0.654902, 1,
1.248726, 0.3306309, -1.347841, 1, 0, 0.6470588, 1,
1.269111, -0.3550025, 0.394343, 1, 0, 0.6431373, 1,
1.273438, 0.3131017, 1.22355, 1, 0, 0.6352941, 1,
1.275009, 0.8753554, 0.7202027, 1, 0, 0.6313726, 1,
1.277362, 0.1245421, 0.929009, 1, 0, 0.6235294, 1,
1.287479, -0.6187961, 2.191176, 1, 0, 0.6196079, 1,
1.301494, 0.2836277, -1.25545, 1, 0, 0.6117647, 1,
1.303204, -0.7686204, 3.613953, 1, 0, 0.6078432, 1,
1.308282, 0.2417427, 2.704799, 1, 0, 0.6, 1,
1.308478, 0.2260024, 2.442517, 1, 0, 0.5921569, 1,
1.31812, -0.3362876, 2.23645, 1, 0, 0.5882353, 1,
1.318976, -1.072526, 1.186796, 1, 0, 0.5803922, 1,
1.323512, -0.2906083, 3.122363, 1, 0, 0.5764706, 1,
1.325468, 1.135207, 1.796707, 1, 0, 0.5686275, 1,
1.330382, -0.4470356, 2.379172, 1, 0, 0.5647059, 1,
1.333925, 1.141433, -0.09680017, 1, 0, 0.5568628, 1,
1.340008, 1.220125, 2.249242, 1, 0, 0.5529412, 1,
1.343252, -0.2307009, 2.438134, 1, 0, 0.5450981, 1,
1.345906, 0.7758812, 0.8865695, 1, 0, 0.5411765, 1,
1.349917, -1.326587, 1.828645, 1, 0, 0.5333334, 1,
1.350643, -0.1287976, 1.814121, 1, 0, 0.5294118, 1,
1.356228, 1.134425, 1.240471, 1, 0, 0.5215687, 1,
1.358421, -0.1488673, -0.01157057, 1, 0, 0.5176471, 1,
1.36337, -0.329446, 2.364378, 1, 0, 0.509804, 1,
1.367276, 0.0405526, -0.9507696, 1, 0, 0.5058824, 1,
1.391809, -0.5786414, 2.867801, 1, 0, 0.4980392, 1,
1.392221, -1.185035, 2.688005, 1, 0, 0.4901961, 1,
1.392294, -0.3003096, 3.017548, 1, 0, 0.4862745, 1,
1.392652, 0.607881, 1.011601, 1, 0, 0.4784314, 1,
1.39299, 0.4552805, 2.683703, 1, 0, 0.4745098, 1,
1.393216, 0.3201284, 1.425754, 1, 0, 0.4666667, 1,
1.403181, -0.4487258, 1.486117, 1, 0, 0.4627451, 1,
1.403938, 0.9483463, 1.331444, 1, 0, 0.454902, 1,
1.404913, -0.3745309, 4.455085, 1, 0, 0.4509804, 1,
1.417044, 1.010973, 1.048926, 1, 0, 0.4431373, 1,
1.425577, 0.7169574, -0.1704481, 1, 0, 0.4392157, 1,
1.438468, -0.3560711, 0.9061878, 1, 0, 0.4313726, 1,
1.44781, 1.697693, 2.153304, 1, 0, 0.427451, 1,
1.478812, -1.468496, 1.372654, 1, 0, 0.4196078, 1,
1.481266, -1.709715, 1.807775, 1, 0, 0.4156863, 1,
1.489739, -0.3895895, 2.669608, 1, 0, 0.4078431, 1,
1.490766, 0.07115107, 2.108355, 1, 0, 0.4039216, 1,
1.499997, -1.073532, 2.784117, 1, 0, 0.3960784, 1,
1.515984, -0.5453629, 2.931044, 1, 0, 0.3882353, 1,
1.524053, 0.7669703, 3.179171, 1, 0, 0.3843137, 1,
1.52653, 1.366336, 0.4444353, 1, 0, 0.3764706, 1,
1.529316, 0.3424084, 1.710069, 1, 0, 0.372549, 1,
1.534657, -1.05573, 0.5283449, 1, 0, 0.3647059, 1,
1.535211, -1.564923, 1.990879, 1, 0, 0.3607843, 1,
1.552277, 0.7358664, 0.245168, 1, 0, 0.3529412, 1,
1.554678, 0.08552412, 0.8137755, 1, 0, 0.3490196, 1,
1.55989, -2.18476, 3.24535, 1, 0, 0.3411765, 1,
1.565225, 1.170042, 0.06552731, 1, 0, 0.3372549, 1,
1.587235, -1.106375, 2.994572, 1, 0, 0.3294118, 1,
1.610407, -0.7661369, 3.256902, 1, 0, 0.3254902, 1,
1.619869, 0.4200858, 2.315687, 1, 0, 0.3176471, 1,
1.620733, 0.9421164, 1.947455, 1, 0, 0.3137255, 1,
1.62558, 1.319538, 1.938775, 1, 0, 0.3058824, 1,
1.709189, -1.111766, 2.203066, 1, 0, 0.2980392, 1,
1.724648, -0.01038594, 2.20691, 1, 0, 0.2941177, 1,
1.731339, -0.985977, 1.770601, 1, 0, 0.2862745, 1,
1.738291, -0.6131061, 0.4989849, 1, 0, 0.282353, 1,
1.743549, -0.1749049, 2.726551, 1, 0, 0.2745098, 1,
1.750771, 0.9312168, 1.82885, 1, 0, 0.2705882, 1,
1.760309, 1.458825, 0.05489689, 1, 0, 0.2627451, 1,
1.766516, -2.297129, 3.918628, 1, 0, 0.2588235, 1,
1.769916, 0.9329754, -0.2097098, 1, 0, 0.2509804, 1,
1.772289, 1.158971, 1.725167, 1, 0, 0.2470588, 1,
1.777342, -1.258669, 0.5813189, 1, 0, 0.2392157, 1,
1.785394, -0.2267228, 2.602483, 1, 0, 0.2352941, 1,
1.787719, 1.031982, -0.4364091, 1, 0, 0.227451, 1,
1.788436, 0.0575156, 0.8378169, 1, 0, 0.2235294, 1,
1.813494, 0.4897785, 2.16382, 1, 0, 0.2156863, 1,
1.839793, -0.07841219, 1.12138, 1, 0, 0.2117647, 1,
1.850691, -0.7843692, 1.388238, 1, 0, 0.2039216, 1,
1.860509, -0.1115997, -1.381508, 1, 0, 0.1960784, 1,
1.883185, 0.2738765, 1.599974, 1, 0, 0.1921569, 1,
1.906701, 1.323561, -0.6404832, 1, 0, 0.1843137, 1,
1.911641, -1.574957, 1.445875, 1, 0, 0.1803922, 1,
1.91692, -0.7573351, 0.2478179, 1, 0, 0.172549, 1,
1.922972, -1.494694, 2.526194, 1, 0, 0.1686275, 1,
1.940233, 0.6416788, 0.7308937, 1, 0, 0.1607843, 1,
1.967549, 0.9344724, 1.307449, 1, 0, 0.1568628, 1,
1.976286, -0.4529577, 2.020324, 1, 0, 0.1490196, 1,
1.988741, -0.4981866, 2.765943, 1, 0, 0.145098, 1,
1.993749, -1.744437, 0.58649, 1, 0, 0.1372549, 1,
2.05656, -1.767481, 3.543806, 1, 0, 0.1333333, 1,
2.094764, 1.111134, 0.252497, 1, 0, 0.1254902, 1,
2.099473, 0.333714, 2.227112, 1, 0, 0.1215686, 1,
2.099959, 0.1274431, 0.3761858, 1, 0, 0.1137255, 1,
2.120173, -0.4288454, 2.376313, 1, 0, 0.1098039, 1,
2.138128, 1.159775, 1.115461, 1, 0, 0.1019608, 1,
2.151343, -0.1603615, 2.333056, 1, 0, 0.09411765, 1,
2.156715, 0.2807632, 3.567102, 1, 0, 0.09019608, 1,
2.166645, -1.399625, 0.09782194, 1, 0, 0.08235294, 1,
2.196173, 1.178067, 1.212191, 1, 0, 0.07843138, 1,
2.233522, -2.244865, 2.670057, 1, 0, 0.07058824, 1,
2.280059, -0.05489842, 2.575855, 1, 0, 0.06666667, 1,
2.387062, 0.7548205, 1.16182, 1, 0, 0.05882353, 1,
2.408511, 0.719305, -0.5377604, 1, 0, 0.05490196, 1,
2.40995, 1.500669, 1.519334, 1, 0, 0.04705882, 1,
2.465421, 1.113791, 1.870237, 1, 0, 0.04313726, 1,
2.491675, 0.04413276, 2.004521, 1, 0, 0.03529412, 1,
2.51291, 0.09735885, 0.497065, 1, 0, 0.03137255, 1,
2.694941, -1.864675, 1.174019, 1, 0, 0.02352941, 1,
2.941863, 0.6724892, -0.01949563, 1, 0, 0.01960784, 1,
3.136519, 0.2848913, 2.462206, 1, 0, 0.01176471, 1,
3.14476, 0.4835187, 2.24531, 1, 0, 0.007843138, 1
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
0.08504093, -3.854814, -7.353144, 0, -0.5, 0.5, 0.5,
0.08504093, -3.854814, -7.353144, 1, -0.5, 0.5, 0.5,
0.08504093, -3.854814, -7.353144, 1, 1.5, 0.5, 0.5,
0.08504093, -3.854814, -7.353144, 0, 1.5, 0.5, 0.5
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
-4.011923, 0.2409751, -7.353144, 0, -0.5, 0.5, 0.5,
-4.011923, 0.2409751, -7.353144, 1, -0.5, 0.5, 0.5,
-4.011923, 0.2409751, -7.353144, 1, 1.5, 0.5, 0.5,
-4.011923, 0.2409751, -7.353144, 0, 1.5, 0.5, 0.5
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
-4.011923, -3.854814, -0.124063, 0, -0.5, 0.5, 0.5,
-4.011923, -3.854814, -0.124063, 1, -0.5, 0.5, 0.5,
-4.011923, -3.854814, -0.124063, 1, 1.5, 0.5, 0.5,
-4.011923, -3.854814, -0.124063, 0, 1.5, 0.5, 0.5
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
-2, -2.909632, -5.684894,
3, -2.909632, -5.684894,
-2, -2.909632, -5.684894,
-2, -3.067163, -5.962936,
-1, -2.909632, -5.684894,
-1, -3.067163, -5.962936,
0, -2.909632, -5.684894,
0, -3.067163, -5.962936,
1, -2.909632, -5.684894,
1, -3.067163, -5.962936,
2, -2.909632, -5.684894,
2, -3.067163, -5.962936,
3, -2.909632, -5.684894,
3, -3.067163, -5.962936
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
-2, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
-2, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
-2, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
-2, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5,
-1, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
-1, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
-1, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
-1, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5,
0, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
0, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
0, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
0, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5,
1, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
1, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
1, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
1, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5,
2, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
2, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
2, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
2, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5,
3, -3.382223, -6.519019, 0, -0.5, 0.5, 0.5,
3, -3.382223, -6.519019, 1, -0.5, 0.5, 0.5,
3, -3.382223, -6.519019, 1, 1.5, 0.5, 0.5,
3, -3.382223, -6.519019, 0, 1.5, 0.5, 0.5
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
-3.06647, -2, -5.684894,
-3.06647, 3, -5.684894,
-3.06647, -2, -5.684894,
-3.224046, -2, -5.962936,
-3.06647, -1, -5.684894,
-3.224046, -1, -5.962936,
-3.06647, 0, -5.684894,
-3.224046, 0, -5.962936,
-3.06647, 1, -5.684894,
-3.224046, 1, -5.962936,
-3.06647, 2, -5.684894,
-3.224046, 2, -5.962936,
-3.06647, 3, -5.684894,
-3.224046, 3, -5.962936
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
-3.539197, -2, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, -2, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, -2, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, -2, -6.519019, 0, 1.5, 0.5, 0.5,
-3.539197, -1, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, -1, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, -1, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, -1, -6.519019, 0, 1.5, 0.5, 0.5,
-3.539197, 0, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, 0, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, 0, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, 0, -6.519019, 0, 1.5, 0.5, 0.5,
-3.539197, 1, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, 1, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, 1, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, 1, -6.519019, 0, 1.5, 0.5, 0.5,
-3.539197, 2, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, 2, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, 2, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, 2, -6.519019, 0, 1.5, 0.5, 0.5,
-3.539197, 3, -6.519019, 0, -0.5, 0.5, 0.5,
-3.539197, 3, -6.519019, 1, -0.5, 0.5, 0.5,
-3.539197, 3, -6.519019, 1, 1.5, 0.5, 0.5,
-3.539197, 3, -6.519019, 0, 1.5, 0.5, 0.5
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
-3.06647, -2.909632, -4,
-3.06647, -2.909632, 4,
-3.06647, -2.909632, -4,
-3.224046, -3.067163, -4,
-3.06647, -2.909632, -2,
-3.224046, -3.067163, -2,
-3.06647, -2.909632, 0,
-3.224046, -3.067163, 0,
-3.06647, -2.909632, 2,
-3.224046, -3.067163, 2,
-3.06647, -2.909632, 4,
-3.224046, -3.067163, 4
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
-3.539197, -3.382223, -4, 0, -0.5, 0.5, 0.5,
-3.539197, -3.382223, -4, 1, -0.5, 0.5, 0.5,
-3.539197, -3.382223, -4, 1, 1.5, 0.5, 0.5,
-3.539197, -3.382223, -4, 0, 1.5, 0.5, 0.5,
-3.539197, -3.382223, -2, 0, -0.5, 0.5, 0.5,
-3.539197, -3.382223, -2, 1, -0.5, 0.5, 0.5,
-3.539197, -3.382223, -2, 1, 1.5, 0.5, 0.5,
-3.539197, -3.382223, -2, 0, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 0, 0, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 0, 1, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 0, 1, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 0, 0, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 2, 0, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 2, 1, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 2, 1, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 2, 0, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 4, 0, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 4, 1, -0.5, 0.5, 0.5,
-3.539197, -3.382223, 4, 1, 1.5, 0.5, 0.5,
-3.539197, -3.382223, 4, 0, 1.5, 0.5, 0.5
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
-3.06647, -2.909632, -5.684894,
-3.06647, 3.391582, -5.684894,
-3.06647, -2.909632, 5.436768,
-3.06647, 3.391582, 5.436768,
-3.06647, -2.909632, -5.684894,
-3.06647, -2.909632, 5.436768,
-3.06647, 3.391582, -5.684894,
-3.06647, 3.391582, 5.436768,
-3.06647, -2.909632, -5.684894,
3.236552, -2.909632, -5.684894,
-3.06647, -2.909632, 5.436768,
3.236552, -2.909632, 5.436768,
-3.06647, 3.391582, -5.684894,
3.236552, 3.391582, -5.684894,
-3.06647, 3.391582, 5.436768,
3.236552, 3.391582, 5.436768,
3.236552, -2.909632, -5.684894,
3.236552, 3.391582, -5.684894,
3.236552, -2.909632, 5.436768,
3.236552, 3.391582, 5.436768,
3.236552, -2.909632, -5.684894,
3.236552, -2.909632, 5.436768,
3.236552, 3.391582, -5.684894,
3.236552, 3.391582, 5.436768
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
var radius = 7.61039;
var distance = 33.85949;
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
mvMatrix.translate( -0.08504093, -0.2409751, 0.124063 );
mvMatrix.scale( 1.305485, 1.30586, 0.7398626 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85949);
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
chlornitrofen<-read.table("chlornitrofen.xyz")
```

```
## Error in read.table("chlornitrofen.xyz"): no lines available in input
```

```r
x<-chlornitrofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
```

```r
y<-chlornitrofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
```

```r
z<-chlornitrofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
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
-2.974679, 0.3223135, -2.078578, 0, 0, 1, 1, 1,
-2.870201, -0.2348262, -2.193999, 1, 0, 0, 1, 1,
-2.862059, 1.078177, -1.706268, 1, 0, 0, 1, 1,
-2.822884, 0.6719329, -1.499694, 1, 0, 0, 1, 1,
-2.805182, 0.7331442, -1.607603, 1, 0, 0, 1, 1,
-2.653169, 0.6215537, -1.697793, 1, 0, 0, 1, 1,
-2.57261, 0.4020587, -0.893378, 0, 0, 0, 1, 1,
-2.529845, -0.3744524, -2.101843, 0, 0, 0, 1, 1,
-2.483647, 0.1782116, -4.271008, 0, 0, 0, 1, 1,
-2.466943, -0.4520972, -2.358938, 0, 0, 0, 1, 1,
-2.451404, 3.299817, -1.083854, 0, 0, 0, 1, 1,
-2.392434, 0.6611958, -3.757221, 0, 0, 0, 1, 1,
-2.325838, -1.469534, -2.065544, 0, 0, 0, 1, 1,
-2.261195, 0.1260824, -0.04703924, 1, 1, 1, 1, 1,
-2.200454, 1.319685, -0.8868439, 1, 1, 1, 1, 1,
-2.190427, 0.4184609, -1.867271, 1, 1, 1, 1, 1,
-2.17033, 0.03166928, -1.705431, 1, 1, 1, 1, 1,
-2.151461, -0.04694017, -1.317726, 1, 1, 1, 1, 1,
-2.146403, -0.6622179, -2.472733, 1, 1, 1, 1, 1,
-2.116979, 0.9146227, -1.445922, 1, 1, 1, 1, 1,
-2.09928, 1.73795, -0.6950253, 1, 1, 1, 1, 1,
-2.094075, 1.298203, -1.995321, 1, 1, 1, 1, 1,
-2.07135, -1.082172, -0.5374728, 1, 1, 1, 1, 1,
-2.069416, -0.6747531, -2.764945, 1, 1, 1, 1, 1,
-2.050222, -0.9306073, -3.547703, 1, 1, 1, 1, 1,
-2.043604, 1.561522, 0.2872178, 1, 1, 1, 1, 1,
-2.041484, 0.711972, -2.538247, 1, 1, 1, 1, 1,
-2.035851, -0.5969837, -1.110437, 1, 1, 1, 1, 1,
-2.010626, 0.365328, -0.3867674, 0, 0, 1, 1, 1,
-1.995467, -0.3189734, -0.49533, 1, 0, 0, 1, 1,
-1.965712, 1.570436, 0.4714142, 1, 0, 0, 1, 1,
-1.910819, -0.3296736, -3.317475, 1, 0, 0, 1, 1,
-1.908884, -0.6731641, -2.087289, 1, 0, 0, 1, 1,
-1.908041, -0.5465758, -1.332282, 1, 0, 0, 1, 1,
-1.849488, -0.2488349, -2.106388, 0, 0, 0, 1, 1,
-1.841771, -2.113009, -1.650194, 0, 0, 0, 1, 1,
-1.797124, -0.8141267, -2.294899, 0, 0, 0, 1, 1,
-1.794379, -2.01933, -0.8407969, 0, 0, 0, 1, 1,
-1.7793, -0.3259576, -1.659771, 0, 0, 0, 1, 1,
-1.760094, 1.328873, 0.8107836, 0, 0, 0, 1, 1,
-1.753157, -0.4832507, -3.154047, 0, 0, 0, 1, 1,
-1.734055, -1.365959, -2.086435, 1, 1, 1, 1, 1,
-1.721358, -1.580756, -1.767535, 1, 1, 1, 1, 1,
-1.710395, -0.000578062, -0.2728071, 1, 1, 1, 1, 1,
-1.67428, 1.125589, 0.07034098, 1, 1, 1, 1, 1,
-1.650569, 0.5836577, -0.3263435, 1, 1, 1, 1, 1,
-1.631161, 0.1000712, -1.185578, 1, 1, 1, 1, 1,
-1.61892, -0.1361698, -1.889539, 1, 1, 1, 1, 1,
-1.616463, -0.6685281, -2.320399, 1, 1, 1, 1, 1,
-1.611058, 0.2905519, -0.339764, 1, 1, 1, 1, 1,
-1.591354, -1.706157, -2.840185, 1, 1, 1, 1, 1,
-1.590052, -1.000441, -1.888385, 1, 1, 1, 1, 1,
-1.585141, 0.8350694, -0.1050475, 1, 1, 1, 1, 1,
-1.575641, -0.1761756, -3.695232, 1, 1, 1, 1, 1,
-1.570464, -0.4839587, -1.252827, 1, 1, 1, 1, 1,
-1.566328, -0.4629593, -1.423796, 1, 1, 1, 1, 1,
-1.56431, 0.5028115, -1.470799, 0, 0, 1, 1, 1,
-1.553334, 0.510858, -2.826276, 1, 0, 0, 1, 1,
-1.544907, -0.7892214, -2.736598, 1, 0, 0, 1, 1,
-1.542439, 0.01977953, -2.725055, 1, 0, 0, 1, 1,
-1.52744, 0.4914819, -1.451146, 1, 0, 0, 1, 1,
-1.527148, -0.2916201, -2.827243, 1, 0, 0, 1, 1,
-1.525921, -0.176028, -0.4598266, 0, 0, 0, 1, 1,
-1.518451, -1.093547, -0.9343373, 0, 0, 0, 1, 1,
-1.502179, 1.14669, -1.222553, 0, 0, 0, 1, 1,
-1.501399, 2.273764, -1.724302, 0, 0, 0, 1, 1,
-1.492471, 0.3063977, -0.3654415, 0, 0, 0, 1, 1,
-1.488872, -0.8142474, -1.2925, 0, 0, 0, 1, 1,
-1.483611, 1.04212, -1.300251, 0, 0, 0, 1, 1,
-1.483105, 1.014858, -2.157926, 1, 1, 1, 1, 1,
-1.481733, -0.1499288, 0.1715273, 1, 1, 1, 1, 1,
-1.478486, -0.9698048, -2.936512, 1, 1, 1, 1, 1,
-1.469357, -1.361513, -3.145403, 1, 1, 1, 1, 1,
-1.467294, 0.5452393, 0.7887069, 1, 1, 1, 1, 1,
-1.4568, -1.234197, -4.801351, 1, 1, 1, 1, 1,
-1.441203, 0.5698453, -0.350067, 1, 1, 1, 1, 1,
-1.436669, -0.4580846, -2.644927, 1, 1, 1, 1, 1,
-1.433052, 0.2571707, -1.61091, 1, 1, 1, 1, 1,
-1.432747, -2.044107, -3.114871, 1, 1, 1, 1, 1,
-1.428324, -0.05323621, -1.713276, 1, 1, 1, 1, 1,
-1.403706, 1.210853, -0.3335727, 1, 1, 1, 1, 1,
-1.396281, 1.048357, -0.7282108, 1, 1, 1, 1, 1,
-1.382061, 2.06828, 0.9774544, 1, 1, 1, 1, 1,
-1.358086, -0.5442763, -2.844261, 1, 1, 1, 1, 1,
-1.355584, -0.2730321, -1.810839, 0, 0, 1, 1, 1,
-1.351429, 1.244341, -1.298672, 1, 0, 0, 1, 1,
-1.349117, 1.212056, 0.05655235, 1, 0, 0, 1, 1,
-1.345011, 0.8869123, -2.527418, 1, 0, 0, 1, 1,
-1.337605, 1.738774, -1.20363, 1, 0, 0, 1, 1,
-1.336534, -0.2858582, -3.159407, 1, 0, 0, 1, 1,
-1.335929, 0.3537709, -1.184451, 0, 0, 0, 1, 1,
-1.317071, 0.6535907, -1.422492, 0, 0, 0, 1, 1,
-1.310638, 2.960736, -1.250667, 0, 0, 0, 1, 1,
-1.306438, -0.4121976, -2.294601, 0, 0, 0, 1, 1,
-1.287185, -0.4102123, -2.301569, 0, 0, 0, 1, 1,
-1.280638, 1.815585, -0.3991601, 0, 0, 0, 1, 1,
-1.27601, 0.3376448, 0.3268729, 0, 0, 0, 1, 1,
-1.27414, 0.7366141, -0.9220677, 1, 1, 1, 1, 1,
-1.271088, 0.8406098, 0.6037933, 1, 1, 1, 1, 1,
-1.27024, -2.29689, -0.2464743, 1, 1, 1, 1, 1,
-1.268017, -0.4037085, -0.9088099, 1, 1, 1, 1, 1,
-1.266565, 0.244649, -0.5198122, 1, 1, 1, 1, 1,
-1.266263, 0.5411553, -0.5798235, 1, 1, 1, 1, 1,
-1.265797, -0.9420477, -2.440206, 1, 1, 1, 1, 1,
-1.258077, -0.02633226, 0.1455762, 1, 1, 1, 1, 1,
-1.251628, -0.6961203, -2.163657, 1, 1, 1, 1, 1,
-1.243607, 0.3793858, -1.358426, 1, 1, 1, 1, 1,
-1.238391, 1.436255, 0.5700063, 1, 1, 1, 1, 1,
-1.236367, -0.2310131, -0.336974, 1, 1, 1, 1, 1,
-1.227306, 0.4175804, -2.85258, 1, 1, 1, 1, 1,
-1.218307, -0.3956109, -2.561895, 1, 1, 1, 1, 1,
-1.217029, 0.07604775, -2.428894, 1, 1, 1, 1, 1,
-1.216019, -0.6004987, -2.350714, 0, 0, 1, 1, 1,
-1.214351, -0.06910322, -2.595715, 1, 0, 0, 1, 1,
-1.21338, -0.182163, -2.876311, 1, 0, 0, 1, 1,
-1.206721, -0.00647567, -1.329703, 1, 0, 0, 1, 1,
-1.206376, 2.19681, -0.2442693, 1, 0, 0, 1, 1,
-1.204961, 0.5774979, -0.4821849, 1, 0, 0, 1, 1,
-1.203989, 0.1615098, -1.945532, 0, 0, 0, 1, 1,
-1.202401, 0.01066393, -1.690175, 0, 0, 0, 1, 1,
-1.197738, 0.7344881, -0.4175954, 0, 0, 0, 1, 1,
-1.195591, 0.06906503, 0.1101721, 0, 0, 0, 1, 1,
-1.194324, 0.7970461, -1.535232, 0, 0, 0, 1, 1,
-1.174082, -0.5712922, -1.563229, 0, 0, 0, 1, 1,
-1.168414, -0.0005387999, -1.7799, 0, 0, 0, 1, 1,
-1.168295, 1.665708, -2.001122, 1, 1, 1, 1, 1,
-1.162569, 2.086114, -1.150671, 1, 1, 1, 1, 1,
-1.16247, -0.8091744, -3.52929, 1, 1, 1, 1, 1,
-1.158305, 0.9105022, -0.7759852, 1, 1, 1, 1, 1,
-1.155638, 1.853431, -1.502857, 1, 1, 1, 1, 1,
-1.154344, 0.1617467, -2.040866, 1, 1, 1, 1, 1,
-1.151257, 0.4192003, -1.686481, 1, 1, 1, 1, 1,
-1.143265, -0.3250722, -1.632552, 1, 1, 1, 1, 1,
-1.14208, -1.07219, -1.375366, 1, 1, 1, 1, 1,
-1.141138, 0.2038071, -3.160112, 1, 1, 1, 1, 1,
-1.128183, -0.04238326, -1.250838, 1, 1, 1, 1, 1,
-1.125727, -0.3149769, -1.847537, 1, 1, 1, 1, 1,
-1.125311, 0.9474937, -0.8543571, 1, 1, 1, 1, 1,
-1.122074, 0.2229291, -0.1352868, 1, 1, 1, 1, 1,
-1.121339, -0.4889675, -1.386649, 1, 1, 1, 1, 1,
-1.116957, -0.4705492, 0.387977, 0, 0, 1, 1, 1,
-1.111593, 0.3851174, -0.4233014, 1, 0, 0, 1, 1,
-1.097426, 0.09083595, -2.085809, 1, 0, 0, 1, 1,
-1.086523, -0.3612666, -2.50387, 1, 0, 0, 1, 1,
-1.074754, -0.4898058, -2.503749, 1, 0, 0, 1, 1,
-1.070312, 0.2791203, -0.1163128, 1, 0, 0, 1, 1,
-1.053488, -1.372732, -3.027671, 0, 0, 0, 1, 1,
-1.053298, 0.03780574, -2.043922, 0, 0, 0, 1, 1,
-1.052005, 0.2766066, -1.599221, 0, 0, 0, 1, 1,
-1.049126, 0.3221442, -1.830681, 0, 0, 0, 1, 1,
-1.038676, -1.417559, -0.7473018, 0, 0, 0, 1, 1,
-1.038561, -0.8833823, -1.775657, 0, 0, 0, 1, 1,
-1.032149, 0.3116367, -1.476404, 0, 0, 0, 1, 1,
-1.032041, -0.7989931, -2.151381, 1, 1, 1, 1, 1,
-1.03166, -0.3786737, -1.02571, 1, 1, 1, 1, 1,
-1.023792, 0.1552521, -2.730681, 1, 1, 1, 1, 1,
-1.022948, -0.9907382, -4.055726, 1, 1, 1, 1, 1,
-1.012331, -0.6991103, -3.752806, 1, 1, 1, 1, 1,
-1.003803, 0.6380578, -1.891198, 1, 1, 1, 1, 1,
-1.003507, -1.114269, -0.5417822, 1, 1, 1, 1, 1,
-1.002374, -0.8080841, -3.389399, 1, 1, 1, 1, 1,
-0.9997225, -0.4626452, -2.102452, 1, 1, 1, 1, 1,
-0.9945962, 0.8122356, 0.573805, 1, 1, 1, 1, 1,
-0.9894426, 0.5913047, -0.4568, 1, 1, 1, 1, 1,
-0.9889018, 1.680101, -1.180408, 1, 1, 1, 1, 1,
-0.983569, 1.605309, 0.2926299, 1, 1, 1, 1, 1,
-0.982807, 0.7542124, -3.19412, 1, 1, 1, 1, 1,
-0.9786889, 0.4326683, -2.557166, 1, 1, 1, 1, 1,
-0.9756055, 0.5228875, 0.9397463, 0, 0, 1, 1, 1,
-0.9741864, 0.8021157, -1.164809, 1, 0, 0, 1, 1,
-0.9712409, 0.09009027, -1.857411, 1, 0, 0, 1, 1,
-0.9697323, -0.4905025, -2.654875, 1, 0, 0, 1, 1,
-0.9669714, 0.3632712, -3.009311, 1, 0, 0, 1, 1,
-0.9657913, -0.414142, -1.726284, 1, 0, 0, 1, 1,
-0.9620731, -0.3580631, -2.58983, 0, 0, 0, 1, 1,
-0.9606466, 1.207351, -0.65896, 0, 0, 0, 1, 1,
-0.9504874, 1.354564, -0.514389, 0, 0, 0, 1, 1,
-0.9480956, 1.328443, 0.986525, 0, 0, 0, 1, 1,
-0.9415805, -1.427672, -1.859352, 0, 0, 0, 1, 1,
-0.9409342, -0.1085825, -1.521016, 0, 0, 0, 1, 1,
-0.9342732, -0.7849175, -3.471431, 0, 0, 0, 1, 1,
-0.9311247, -0.2130252, -0.8070324, 1, 1, 1, 1, 1,
-0.9274074, -0.1918101, -1.288831, 1, 1, 1, 1, 1,
-0.9240771, 0.5944306, -0.7358248, 1, 1, 1, 1, 1,
-0.9181929, 1.794787, -0.3264696, 1, 1, 1, 1, 1,
-0.9146393, -1.068944, -1.482666, 1, 1, 1, 1, 1,
-0.909047, 1.654779, -1.953004, 1, 1, 1, 1, 1,
-0.9081866, -1.368924, -2.841413, 1, 1, 1, 1, 1,
-0.8964676, 1.380548, -0.5026835, 1, 1, 1, 1, 1,
-0.8952189, -0.1286865, -2.47359, 1, 1, 1, 1, 1,
-0.892857, 0.4780511, 0.2142878, 1, 1, 1, 1, 1,
-0.8886228, -0.4334618, -2.270491, 1, 1, 1, 1, 1,
-0.887615, -1.638134, -0.825385, 1, 1, 1, 1, 1,
-0.8777663, 0.983463, -1.542354, 1, 1, 1, 1, 1,
-0.8745336, 0.921571, -0.01761506, 1, 1, 1, 1, 1,
-0.8713978, -0.1539273, 0.9854182, 1, 1, 1, 1, 1,
-0.8701958, 0.6704289, 0.1487886, 0, 0, 1, 1, 1,
-0.8664603, 0.3857884, -1.444473, 1, 0, 0, 1, 1,
-0.8610516, -2.241564, -3.91298, 1, 0, 0, 1, 1,
-0.8589922, 0.2870386, -0.1477384, 1, 0, 0, 1, 1,
-0.8533473, 0.274869, 0.5754559, 1, 0, 0, 1, 1,
-0.852694, -0.7357224, -2.929775, 1, 0, 0, 1, 1,
-0.8479056, -0.8882242, 0.1006016, 0, 0, 0, 1, 1,
-0.8463159, -0.5130529, -2.341625, 0, 0, 0, 1, 1,
-0.8452956, 0.3395691, 0.2251871, 0, 0, 0, 1, 1,
-0.8451771, -1.312116, -1.969116, 0, 0, 0, 1, 1,
-0.8448519, -0.1388596, -1.91759, 0, 0, 0, 1, 1,
-0.8439306, 1.431429, -0.5154919, 0, 0, 0, 1, 1,
-0.8363749, 1.883159, 1.037712, 0, 0, 0, 1, 1,
-0.8328041, -0.2407184, -2.997863, 1, 1, 1, 1, 1,
-0.8326025, 0.2815324, -0.9821531, 1, 1, 1, 1, 1,
-0.8298569, 0.6332656, -1.021626, 1, 1, 1, 1, 1,
-0.8297426, -1.588104, -1.322984, 1, 1, 1, 1, 1,
-0.8256624, -0.1848772, -2.791387, 1, 1, 1, 1, 1,
-0.8229851, -0.2984725, -2.831566, 1, 1, 1, 1, 1,
-0.8191994, 1.349357, -1.267441, 1, 1, 1, 1, 1,
-0.8190201, 0.4085681, -2.063551, 1, 1, 1, 1, 1,
-0.818552, 1.908108, -0.8669293, 1, 1, 1, 1, 1,
-0.8181378, 0.3167945, -3.234706, 1, 1, 1, 1, 1,
-0.8150599, -0.05509999, 0.2661057, 1, 1, 1, 1, 1,
-0.8017524, 0.8314747, -2.367814, 1, 1, 1, 1, 1,
-0.801349, 0.5991723, -3.050441, 1, 1, 1, 1, 1,
-0.800079, -1.993238, -3.542001, 1, 1, 1, 1, 1,
-0.7991866, -0.05085661, -2.305171, 1, 1, 1, 1, 1,
-0.7923014, 0.7340848, -2.003731, 0, 0, 1, 1, 1,
-0.7907027, 0.3481195, -1.693592, 1, 0, 0, 1, 1,
-0.7879463, -0.2483839, -3.965883, 1, 0, 0, 1, 1,
-0.7875064, 1.084631, 1.032251, 1, 0, 0, 1, 1,
-0.7828388, 1.326813, -0.513951, 1, 0, 0, 1, 1,
-0.7700657, -0.9565502, -3.236118, 1, 0, 0, 1, 1,
-0.764891, 0.363396, -0.7015314, 0, 0, 0, 1, 1,
-0.763263, 0.138317, -0.1791274, 0, 0, 0, 1, 1,
-0.7615904, 0.6299886, -1.406914, 0, 0, 0, 1, 1,
-0.7481862, 0.3149944, -1.336113, 0, 0, 0, 1, 1,
-0.7424679, 0.7145458, -0.8697171, 0, 0, 0, 1, 1,
-0.739663, 0.3478615, 1.517327, 0, 0, 0, 1, 1,
-0.7349532, 0.6173112, -1.227098, 0, 0, 0, 1, 1,
-0.7347994, -1.232257, -3.147159, 1, 1, 1, 1, 1,
-0.7338383, 1.807976, 1.263498, 1, 1, 1, 1, 1,
-0.7276496, -0.7545792, -3.193793, 1, 1, 1, 1, 1,
-0.7258095, -0.5522041, -2.315589, 1, 1, 1, 1, 1,
-0.7235835, 0.5279352, -0.1431643, 1, 1, 1, 1, 1,
-0.7193935, -0.884654, -2.895138, 1, 1, 1, 1, 1,
-0.7171229, 1.008028, -0.6541418, 1, 1, 1, 1, 1,
-0.7126917, 0.1044261, -0.7115025, 1, 1, 1, 1, 1,
-0.7064828, 0.6393521, 0.1826912, 1, 1, 1, 1, 1,
-0.7053429, 0.8995512, -1.584545, 1, 1, 1, 1, 1,
-0.702156, -0.5597705, -3.335186, 1, 1, 1, 1, 1,
-0.6984822, 1.296846, -0.9001679, 1, 1, 1, 1, 1,
-0.6885017, 1.261057, -1.018419, 1, 1, 1, 1, 1,
-0.6867339, 0.6035189, 1.220907, 1, 1, 1, 1, 1,
-0.6848175, -1.753242, -3.07897, 1, 1, 1, 1, 1,
-0.6845345, 0.3607613, -1.051397, 0, 0, 1, 1, 1,
-0.6765735, 0.4210008, 0.01526586, 1, 0, 0, 1, 1,
-0.6752968, -0.07062963, -3.613437, 1, 0, 0, 1, 1,
-0.6725633, 0.6985009, -1.140244, 1, 0, 0, 1, 1,
-0.6684523, 1.122968, -0.813302, 1, 0, 0, 1, 1,
-0.6645555, -1.444764, -1.89191, 1, 0, 0, 1, 1,
-0.6632389, -0.4681706, -2.306714, 0, 0, 0, 1, 1,
-0.6560459, 0.4325416, 0.6489491, 0, 0, 0, 1, 1,
-0.6464613, -0.4553373, -0.003235876, 0, 0, 0, 1, 1,
-0.6451464, 0.8821598, -0.6242747, 0, 0, 0, 1, 1,
-0.6411931, 0.584737, 0.8375254, 0, 0, 0, 1, 1,
-0.641105, 1.26188, -1.733711, 0, 0, 0, 1, 1,
-0.632643, -0.1502091, 0.3028021, 0, 0, 0, 1, 1,
-0.6318282, -0.04401056, -2.559166, 1, 1, 1, 1, 1,
-0.627488, 1.338417, 0.3497456, 1, 1, 1, 1, 1,
-0.6252123, 0.7789144, -0.3091148, 1, 1, 1, 1, 1,
-0.6237295, -1.197731, -2.147497, 1, 1, 1, 1, 1,
-0.6191589, 1.681426, -0.2421381, 1, 1, 1, 1, 1,
-0.6182356, 0.3863674, -1.035262, 1, 1, 1, 1, 1,
-0.6160606, -0.3536399, -1.309966, 1, 1, 1, 1, 1,
-0.6043594, 0.4081077, -0.4657251, 1, 1, 1, 1, 1,
-0.6040587, 1.111817, 0.3940085, 1, 1, 1, 1, 1,
-0.6037421, -0.06436906, -2.398692, 1, 1, 1, 1, 1,
-0.6012324, 0.1281532, -1.680535, 1, 1, 1, 1, 1,
-0.6007805, -0.1476994, -0.5257916, 1, 1, 1, 1, 1,
-0.59593, 1.443396, -0.05287228, 1, 1, 1, 1, 1,
-0.5953161, 1.147701, -1.274374, 1, 1, 1, 1, 1,
-0.5946519, 1.689729, -0.4451164, 1, 1, 1, 1, 1,
-0.5934026, 0.6255968, -0.3692884, 0, 0, 1, 1, 1,
-0.5899232, 0.5093489, -1.328052, 1, 0, 0, 1, 1,
-0.5898643, 0.842328, 0.1202959, 1, 0, 0, 1, 1,
-0.5878364, -0.1196941, -2.805149, 1, 0, 0, 1, 1,
-0.5851811, -0.5640525, -0.2625628, 1, 0, 0, 1, 1,
-0.5850185, 0.2381775, -2.468199, 1, 0, 0, 1, 1,
-0.5841303, -0.2495891, -1.343183, 0, 0, 0, 1, 1,
-0.5823159, 0.7086173, -1.620601, 0, 0, 0, 1, 1,
-0.5809528, -1.255103, -2.431745, 0, 0, 0, 1, 1,
-0.5802066, -2.587115, -1.172821, 0, 0, 0, 1, 1,
-0.5791528, 0.9020586, -0.2109856, 0, 0, 0, 1, 1,
-0.5789769, -2.319035, -2.220975, 0, 0, 0, 1, 1,
-0.5762472, -2.213604, -4.279112, 0, 0, 0, 1, 1,
-0.5744331, 1.295869, 0.9256234, 1, 1, 1, 1, 1,
-0.5744045, 0.04552451, -1.54288, 1, 1, 1, 1, 1,
-0.5733187, 1.087937, -1.420535, 1, 1, 1, 1, 1,
-0.5688934, 1.034723, 0.6334723, 1, 1, 1, 1, 1,
-0.5681162, -1.039368, -2.845544, 1, 1, 1, 1, 1,
-0.5600573, -0.02911628, -2.132137, 1, 1, 1, 1, 1,
-0.5560976, -1.252558, -1.617264, 1, 1, 1, 1, 1,
-0.5418274, 2.182701, -1.092572, 1, 1, 1, 1, 1,
-0.5383188, -0.4279215, -1.044031, 1, 1, 1, 1, 1,
-0.5366715, 0.2269322, -0.9447543, 1, 1, 1, 1, 1,
-0.5349897, -1.110867, -2.185291, 1, 1, 1, 1, 1,
-0.5324208, 0.3625131, 0.0688109, 1, 1, 1, 1, 1,
-0.5323279, -2.190062, -3.263789, 1, 1, 1, 1, 1,
-0.5316842, 0.6393205, 0.1227205, 1, 1, 1, 1, 1,
-0.5300915, -1.135499, -1.809452, 1, 1, 1, 1, 1,
-0.528527, 0.5135337, 0.1529456, 0, 0, 1, 1, 1,
-0.5224397, -0.4866323, -1.088067, 1, 0, 0, 1, 1,
-0.5200989, -0.7497226, -4.484078, 1, 0, 0, 1, 1,
-0.5163329, 0.004113322, -3.349389, 1, 0, 0, 1, 1,
-0.5044744, 1.456884, -3.606166, 1, 0, 0, 1, 1,
-0.5019354, -0.6857959, -2.509655, 1, 0, 0, 1, 1,
-0.5003926, -0.3215856, -2.033403, 0, 0, 0, 1, 1,
-0.4998044, 1.535038, 0.6233577, 0, 0, 0, 1, 1,
-0.4971013, -0.4844714, -4.719164, 0, 0, 0, 1, 1,
-0.4948871, -0.1908421, -0.9293185, 0, 0, 0, 1, 1,
-0.4948634, 0.8030344, -1.978282, 0, 0, 0, 1, 1,
-0.4941709, 2.169633, -0.7575058, 0, 0, 0, 1, 1,
-0.4933154, -0.5138357, -1.196288, 0, 0, 0, 1, 1,
-0.491621, -0.2893118, -1.956284, 1, 1, 1, 1, 1,
-0.4861038, 0.1720265, -1.559625, 1, 1, 1, 1, 1,
-0.4856485, 0.3643638, -1.822211, 1, 1, 1, 1, 1,
-0.484296, -0.3797685, -2.384574, 1, 1, 1, 1, 1,
-0.4835353, 1.502853, 0.3109775, 1, 1, 1, 1, 1,
-0.4810807, 0.2564565, -1.719954, 1, 1, 1, 1, 1,
-0.4801732, 0.7133284, -0.1189027, 1, 1, 1, 1, 1,
-0.479312, -0.485736, -2.750673, 1, 1, 1, 1, 1,
-0.4704657, 0.03625363, -0.3513663, 1, 1, 1, 1, 1,
-0.4698627, 1.91491, 0.2280813, 1, 1, 1, 1, 1,
-0.4671207, -0.7931314, -2.086469, 1, 1, 1, 1, 1,
-0.4662282, -1.892916, -3.42546, 1, 1, 1, 1, 1,
-0.4606512, 0.01233478, -2.423459, 1, 1, 1, 1, 1,
-0.457162, 0.198835, 0.7963147, 1, 1, 1, 1, 1,
-0.4545349, -0.1988081, -2.09887, 1, 1, 1, 1, 1,
-0.4527179, 1.517791, -1.906774, 0, 0, 1, 1, 1,
-0.4525299, 0.5278869, -0.5408772, 1, 0, 0, 1, 1,
-0.4514447, 0.5818009, -1.506033, 1, 0, 0, 1, 1,
-0.4500143, 0.3681965, -0.5201609, 1, 0, 0, 1, 1,
-0.4462183, -0.6180699, -3.602889, 1, 0, 0, 1, 1,
-0.4440379, 0.4489402, -1.858074, 1, 0, 0, 1, 1,
-0.4392808, 0.2854819, -0.6127826, 0, 0, 0, 1, 1,
-0.4372251, -1.582851, -1.406534, 0, 0, 0, 1, 1,
-0.4365486, 0.4097723, 0.1243178, 0, 0, 0, 1, 1,
-0.4330848, 1.378187, -0.01112098, 0, 0, 0, 1, 1,
-0.4284066, -1.56924, -2.498377, 0, 0, 0, 1, 1,
-0.4273477, 0.9103206, -0.002708073, 0, 0, 0, 1, 1,
-0.4190678, -0.9450675, -1.332299, 0, 0, 0, 1, 1,
-0.4189491, 0.3803163, -0.08227993, 1, 1, 1, 1, 1,
-0.4163515, -2.405032, -3.681494, 1, 1, 1, 1, 1,
-0.4097637, 1.363822, 0.811197, 1, 1, 1, 1, 1,
-0.408821, -0.01331892, -0.6387852, 1, 1, 1, 1, 1,
-0.4082305, -1.294707, -4.324915, 1, 1, 1, 1, 1,
-0.4080565, -1.358286, -2.132194, 1, 1, 1, 1, 1,
-0.4073601, 2.131811, -0.9975865, 1, 1, 1, 1, 1,
-0.4017865, 0.3675449, -0.3995419, 1, 1, 1, 1, 1,
-0.3961221, 1.896415, 1.249375, 1, 1, 1, 1, 1,
-0.395882, -1.808135, -2.662165, 1, 1, 1, 1, 1,
-0.3952404, 1.450686, -0.2280303, 1, 1, 1, 1, 1,
-0.3950416, 0.3559374, 0.2719342, 1, 1, 1, 1, 1,
-0.3946624, -1.149289, -3.169889, 1, 1, 1, 1, 1,
-0.3902064, -1.09141, -2.905557, 1, 1, 1, 1, 1,
-0.3896863, -0.500266, -3.34737, 1, 1, 1, 1, 1,
-0.3848918, 0.06313744, -1.855747, 0, 0, 1, 1, 1,
-0.3785187, -2.142673, -2.530328, 1, 0, 0, 1, 1,
-0.3709604, -0.08483891, -2.909991, 1, 0, 0, 1, 1,
-0.37087, -1.455813, -2.261811, 1, 0, 0, 1, 1,
-0.3698933, -0.112765, -1.830975, 1, 0, 0, 1, 1,
-0.3696359, -0.4279203, -3.069966, 1, 0, 0, 1, 1,
-0.3691117, 0.1698306, -1.147064, 0, 0, 0, 1, 1,
-0.3665726, 0.4257002, -2.352568, 0, 0, 0, 1, 1,
-0.3620909, -0.6140079, -4.255647, 0, 0, 0, 1, 1,
-0.3604131, 0.6825439, -0.1616765, 0, 0, 0, 1, 1,
-0.3578897, 0.3131712, -2.078627, 0, 0, 0, 1, 1,
-0.354105, -2.290438, -2.448411, 0, 0, 0, 1, 1,
-0.3515062, 1.037288, -0.3397919, 0, 0, 0, 1, 1,
-0.3506754, -0.1666659, -1.551682, 1, 1, 1, 1, 1,
-0.3478111, -2.129554, -3.260234, 1, 1, 1, 1, 1,
-0.3360306, -1.265386, -3.009037, 1, 1, 1, 1, 1,
-0.3340478, 0.8451305, 2.906697, 1, 1, 1, 1, 1,
-0.3320769, -1.415762, -1.182687, 1, 1, 1, 1, 1,
-0.3317453, 0.7512822, 1.459202, 1, 1, 1, 1, 1,
-0.3289566, 0.09827114, -0.7147411, 1, 1, 1, 1, 1,
-0.3289513, -0.124924, -1.848459, 1, 1, 1, 1, 1,
-0.3189369, -0.4818039, -2.741822, 1, 1, 1, 1, 1,
-0.3152998, 1.874237, -0.3877861, 1, 1, 1, 1, 1,
-0.3138697, -1.252017, -2.995773, 1, 1, 1, 1, 1,
-0.3082684, -0.0283418, -1.465506, 1, 1, 1, 1, 1,
-0.3041101, -1.913976, -2.081622, 1, 1, 1, 1, 1,
-0.3040259, -1.572535, -2.512021, 1, 1, 1, 1, 1,
-0.3031788, -0.8357175, -0.6741384, 1, 1, 1, 1, 1,
-0.3028772, -0.5898602, -0.7755497, 0, 0, 1, 1, 1,
-0.3022775, 1.128207, 1.677885, 1, 0, 0, 1, 1,
-0.3020865, -2.487259, -2.052027, 1, 0, 0, 1, 1,
-0.2995461, -0.3723169, -3.063831, 1, 0, 0, 1, 1,
-0.2974338, 0.1354063, -0.9012197, 1, 0, 0, 1, 1,
-0.2958186, -0.7218223, -1.983597, 1, 0, 0, 1, 1,
-0.2939425, -1.144864, -1.927407, 0, 0, 0, 1, 1,
-0.2858744, 0.2395419, -2.571113, 0, 0, 0, 1, 1,
-0.2836697, 0.8899671, 0.09327779, 0, 0, 0, 1, 1,
-0.2816455, -1.325715, -2.589116, 0, 0, 0, 1, 1,
-0.2799098, 0.9384918, -1.092185, 0, 0, 0, 1, 1,
-0.2789574, 0.1933383, -2.337567, 0, 0, 0, 1, 1,
-0.2763328, -0.4067437, -2.500741, 0, 0, 0, 1, 1,
-0.2737977, 1.322492, -0.9687868, 1, 1, 1, 1, 1,
-0.2709154, -0.08870744, -3.134902, 1, 1, 1, 1, 1,
-0.2704949, 0.06337088, -1.412466, 1, 1, 1, 1, 1,
-0.2693055, 1.447501, 0.6250501, 1, 1, 1, 1, 1,
-0.2632309, 1.21304, -0.9970556, 1, 1, 1, 1, 1,
-0.2627675, 0.223475, 0.2845336, 1, 1, 1, 1, 1,
-0.2595052, 1.177891, 0.8863423, 1, 1, 1, 1, 1,
-0.2585722, 0.7498982, 2.660386, 1, 1, 1, 1, 1,
-0.2542512, -1.270442, -3.428932, 1, 1, 1, 1, 1,
-0.2498277, 1.102285, 1.766679, 1, 1, 1, 1, 1,
-0.2475073, 0.3741301, -2.120732, 1, 1, 1, 1, 1,
-0.246432, -1.470263, -4.330446, 1, 1, 1, 1, 1,
-0.2441589, 1.061164, -0.1496826, 1, 1, 1, 1, 1,
-0.2371543, -0.7052936, -2.987626, 1, 1, 1, 1, 1,
-0.2368612, 0.8560087, -0.7710806, 1, 1, 1, 1, 1,
-0.2343247, 0.7443371, -0.581521, 0, 0, 1, 1, 1,
-0.2321256, -0.3931956, -4.056996, 1, 0, 0, 1, 1,
-0.2285483, 0.3802464, 0.1050906, 1, 0, 0, 1, 1,
-0.2283571, 1.037347, 0.1410544, 1, 0, 0, 1, 1,
-0.2251911, 0.7473462, 1.375692, 1, 0, 0, 1, 1,
-0.2207358, -0.396449, -1.556077, 1, 0, 0, 1, 1,
-0.2206413, 0.3898706, -0.5704106, 0, 0, 0, 1, 1,
-0.2186165, 0.933459, 1.105227, 0, 0, 0, 1, 1,
-0.2144282, -0.38324, -1.427387, 0, 0, 0, 1, 1,
-0.2050685, -0.622457, -2.869156, 0, 0, 0, 1, 1,
-0.2026732, 2.071778, 0.3030497, 0, 0, 0, 1, 1,
-0.1981382, -0.1497227, -2.795902, 0, 0, 0, 1, 1,
-0.1910136, -0.4186944, -3.419621, 0, 0, 0, 1, 1,
-0.1903111, 0.2202884, -1.711944, 1, 1, 1, 1, 1,
-0.1900611, 0.7019686, -0.9399561, 1, 1, 1, 1, 1,
-0.1900293, 0.1051632, -2.062565, 1, 1, 1, 1, 1,
-0.189432, -0.1829158, -2.890277, 1, 1, 1, 1, 1,
-0.1870358, -0.3990532, -2.861825, 1, 1, 1, 1, 1,
-0.1851049, -0.3297642, -2.039055, 1, 1, 1, 1, 1,
-0.1850243, 0.3041432, 1.196807, 1, 1, 1, 1, 1,
-0.1815474, -0.4248956, -3.348952, 1, 1, 1, 1, 1,
-0.1767819, -0.6629193, -4.153991, 1, 1, 1, 1, 1,
-0.1678652, 0.2561856, -1.258203, 1, 1, 1, 1, 1,
-0.1646529, -1.037494, -4.228212, 1, 1, 1, 1, 1,
-0.1588343, 1.302108, -1.247291, 1, 1, 1, 1, 1,
-0.1572288, -0.8906308, -1.787853, 1, 1, 1, 1, 1,
-0.157142, 0.5851827, -1.975552, 1, 1, 1, 1, 1,
-0.1500843, -0.906881, -2.712166, 1, 1, 1, 1, 1,
-0.1471885, -0.7654235, -3.529701, 0, 0, 1, 1, 1,
-0.1471491, 0.8985396, 0.1213485, 1, 0, 0, 1, 1,
-0.1471402, 1.246224, 0.1500459, 1, 0, 0, 1, 1,
-0.1451139, 0.6887666, 0.4008912, 1, 0, 0, 1, 1,
-0.144731, -1.474948, -0.9181939, 1, 0, 0, 1, 1,
-0.1446093, 1.126663, 1.611489, 1, 0, 0, 1, 1,
-0.1401904, 0.07330532, 0.5854251, 0, 0, 0, 1, 1,
-0.134332, 0.1272871, -1.837897, 0, 0, 0, 1, 1,
-0.1250667, -0.1381594, -3.816195, 0, 0, 0, 1, 1,
-0.1231274, 0.1330154, -1.053374, 0, 0, 0, 1, 1,
-0.1222603, -0.2304487, -3.058525, 0, 0, 0, 1, 1,
-0.1216279, -0.8316392, -3.243933, 0, 0, 0, 1, 1,
-0.1155455, 1.771452, -0.9719084, 0, 0, 0, 1, 1,
-0.1139776, -0.4319337, -5.522928, 1, 1, 1, 1, 1,
-0.1121436, -0.639852, -4.356439, 1, 1, 1, 1, 1,
-0.1111696, 0.9514358, -1.658927, 1, 1, 1, 1, 1,
-0.1069926, -1.804518, -2.947411, 1, 1, 1, 1, 1,
-0.1063477, -0.282559, -2.697716, 1, 1, 1, 1, 1,
-0.1059357, -0.8040798, -3.348185, 1, 1, 1, 1, 1,
-0.1059253, 0.7978376, -0.5770375, 1, 1, 1, 1, 1,
-0.1044974, -0.8024318, -4.134532, 1, 1, 1, 1, 1,
-0.1027633, -0.4245785, -3.248163, 1, 1, 1, 1, 1,
-0.1009105, -0.8979689, -2.607491, 1, 1, 1, 1, 1,
-0.09548185, 0.9007118, -0.6788631, 1, 1, 1, 1, 1,
-0.09479415, 0.2545525, -0.7905908, 1, 1, 1, 1, 1,
-0.09338399, -1.028787, -2.511783, 1, 1, 1, 1, 1,
-0.08743899, -0.8067791, -3.765735, 1, 1, 1, 1, 1,
-0.08596932, 0.6809783, -0.6443599, 1, 1, 1, 1, 1,
-0.07845574, 1.611283, -0.1267203, 0, 0, 1, 1, 1,
-0.07579517, 0.988386, 0.4983054, 1, 0, 0, 1, 1,
-0.07375067, 0.4547631, 0.05590966, 1, 0, 0, 1, 1,
-0.06648914, 0.6251691, 1.036535, 1, 0, 0, 1, 1,
-0.06115299, 1.106161, 1.705293, 1, 0, 0, 1, 1,
-0.06071506, 1.272828, 0.8359258, 1, 0, 0, 1, 1,
-0.05692338, 0.4894016, 0.5925454, 0, 0, 0, 1, 1,
-0.05620338, 1.137226, -1.295891, 0, 0, 0, 1, 1,
-0.05573814, -0.3189142, -1.382668, 0, 0, 0, 1, 1,
-0.0535662, -1.033704, -2.65526, 0, 0, 0, 1, 1,
-0.05252728, -0.1513831, -2.4369, 0, 0, 0, 1, 1,
-0.04926942, 2.120999, 2.075053, 0, 0, 0, 1, 1,
-0.0476553, -0.03813159, -3.685937, 0, 0, 0, 1, 1,
-0.04745384, 1.699816, 1.91436, 1, 1, 1, 1, 1,
-0.04686074, -0.8622607, -4.873384, 1, 1, 1, 1, 1,
-0.04463967, -1.005426, -2.486272, 1, 1, 1, 1, 1,
-0.04409001, -0.9639744, -3.365103, 1, 1, 1, 1, 1,
-0.04371972, 3.020773, 1.47462, 1, 1, 1, 1, 1,
-0.04362321, -1.597312, -3.73151, 1, 1, 1, 1, 1,
-0.04064739, -1.344581, -4.440994, 1, 1, 1, 1, 1,
-0.03994969, 0.4777858, 1.161903, 1, 1, 1, 1, 1,
-0.03831479, 1.513982, -0.402674, 1, 1, 1, 1, 1,
-0.03448546, -0.008491411, -2.967526, 1, 1, 1, 1, 1,
-0.03363223, 0.1216465, 1.051084, 1, 1, 1, 1, 1,
-0.02774115, -0.5845333, -0.6647808, 1, 1, 1, 1, 1,
-0.02748367, 0.3217969, -3.804985, 1, 1, 1, 1, 1,
-0.02661817, -0.1550876, -3.634091, 1, 1, 1, 1, 1,
-0.01946893, -2.495763, -2.920667, 1, 1, 1, 1, 1,
-0.01335423, -1.193667, -2.977402, 0, 0, 1, 1, 1,
-0.01266288, -1.680931, -2.130498, 1, 0, 0, 1, 1,
-0.01079642, 1.592795, -0.596175, 1, 0, 0, 1, 1,
-0.01011046, -1.267401, -2.623324, 1, 0, 0, 1, 1,
-0.008820551, -0.1129764, -4.910586, 1, 0, 0, 1, 1,
-0.008515605, 1.657334, 0.2650447, 1, 0, 0, 1, 1,
-0.005657476, 1.497086, -0.2136986, 0, 0, 0, 1, 1,
-0.004099265, 0.02955894, 0.5409086, 0, 0, 0, 1, 1,
-0.002028411, 1.668903, -0.216473, 0, 0, 0, 1, 1,
-0.000722828, -0.1762399, -4.931421, 0, 0, 0, 1, 1,
0.002944166, 0.9093502, -0.861805, 0, 0, 0, 1, 1,
0.003120658, 2.179177, -0.3120831, 0, 0, 0, 1, 1,
0.009113536, 2.552925, -0.2502575, 0, 0, 0, 1, 1,
0.01052366, 0.8140312, -0.01596217, 1, 1, 1, 1, 1,
0.01598757, -1.536714, 3.07508, 1, 1, 1, 1, 1,
0.01744143, -0.3220579, 2.420325, 1, 1, 1, 1, 1,
0.02210183, -0.3464629, 2.85584, 1, 1, 1, 1, 1,
0.02761663, -2.329769, 2.383568, 1, 1, 1, 1, 1,
0.03255383, 0.06890261, -0.3623612, 1, 1, 1, 1, 1,
0.03598364, 0.1635426, -1.267627, 1, 1, 1, 1, 1,
0.03822562, -0.966094, 2.933792, 1, 1, 1, 1, 1,
0.03869355, 0.5511694, 0.6418034, 1, 1, 1, 1, 1,
0.03953477, -0.6728774, 2.86821, 1, 1, 1, 1, 1,
0.0435724, 0.05838725, 0.6454049, 1, 1, 1, 1, 1,
0.04734548, 0.415975, 0.8406134, 1, 1, 1, 1, 1,
0.04793611, -0.3033722, 3.237952, 1, 1, 1, 1, 1,
0.05065694, -0.4601251, 2.184921, 1, 1, 1, 1, 1,
0.05141256, -1.489031, 4.103371, 1, 1, 1, 1, 1,
0.05557249, 1.520376, 0.7514795, 0, 0, 1, 1, 1,
0.06276425, -0.8671384, 1.026238, 1, 0, 0, 1, 1,
0.06733169, 0.4802892, -0.01436392, 1, 0, 0, 1, 1,
0.06872056, 1.454852, -0.2523786, 1, 0, 0, 1, 1,
0.07441929, -0.4041358, 3.096765, 1, 0, 0, 1, 1,
0.07944053, 0.191952, 0.9986784, 1, 0, 0, 1, 1,
0.08017652, 0.07173994, 1.924911, 0, 0, 0, 1, 1,
0.08115968, -0.8803651, 4.264105, 0, 0, 0, 1, 1,
0.08308152, -0.4161024, 3.022309, 0, 0, 0, 1, 1,
0.08544682, 1.333357, 0.7029068, 0, 0, 0, 1, 1,
0.08817253, 0.1881241, -0.8170259, 0, 0, 0, 1, 1,
0.0886793, 1.053189, 1.128995, 0, 0, 0, 1, 1,
0.09080164, 1.112108, 0.06907682, 0, 0, 0, 1, 1,
0.09398297, -0.2659609, 1.581902, 1, 1, 1, 1, 1,
0.0941668, -0.9430715, 2.187469, 1, 1, 1, 1, 1,
0.09492305, 0.5534835, -0.1422206, 1, 1, 1, 1, 1,
0.09694961, 0.6360781, -0.3624629, 1, 1, 1, 1, 1,
0.1017526, 0.06229153, 0.8721206, 1, 1, 1, 1, 1,
0.102136, -0.9514463, 2.576547, 1, 1, 1, 1, 1,
0.1024703, 0.6848112, 1.231467, 1, 1, 1, 1, 1,
0.1089221, 0.2255585, 1.059637, 1, 1, 1, 1, 1,
0.114273, -1.83053, 3.490144, 1, 1, 1, 1, 1,
0.114316, -0.6822408, 2.255275, 1, 1, 1, 1, 1,
0.1145497, 1.706368, 0.683716, 1, 1, 1, 1, 1,
0.1147639, -0.1492586, 1.548487, 1, 1, 1, 1, 1,
0.1152832, 0.476408, 0.1177543, 1, 1, 1, 1, 1,
0.1180304, -1.246937, 4.554843, 1, 1, 1, 1, 1,
0.1182292, -0.7787546, 3.800564, 1, 1, 1, 1, 1,
0.1211816, -1.914782, 0.9330053, 0, 0, 1, 1, 1,
0.1227075, -0.2747904, 3.783219, 1, 0, 0, 1, 1,
0.1345883, -0.9347071, 0.9177165, 1, 0, 0, 1, 1,
0.1354355, -0.8224369, 4.287129, 1, 0, 0, 1, 1,
0.1364571, -1.830564, 3.232382, 1, 0, 0, 1, 1,
0.1394438, -0.3548788, 2.712954, 1, 0, 0, 1, 1,
0.1435444, -0.6377328, 4.342725, 0, 0, 0, 1, 1,
0.1437487, -0.2457533, 1.806288, 0, 0, 0, 1, 1,
0.1499551, -0.9506716, 2.364249, 0, 0, 0, 1, 1,
0.1587191, 0.7610688, 1.614574, 0, 0, 0, 1, 1,
0.1651395, 0.32804, 1.539783, 0, 0, 0, 1, 1,
0.1697109, -0.1471165, 1.423013, 0, 0, 0, 1, 1,
0.1699072, -0.2685757, 3.923985, 0, 0, 0, 1, 1,
0.1707172, -0.2972925, 2.098124, 1, 1, 1, 1, 1,
0.1717097, 0.3686959, -2.357315, 1, 1, 1, 1, 1,
0.1721451, -0.4659164, 0.7941473, 1, 1, 1, 1, 1,
0.1759496, 0.5489254, 1.303702, 1, 1, 1, 1, 1,
0.1782456, -0.5491192, 1.914482, 1, 1, 1, 1, 1,
0.1814127, 0.09180153, 0.6630892, 1, 1, 1, 1, 1,
0.1814265, 0.1371349, 0.401528, 1, 1, 1, 1, 1,
0.1830848, -1.15686, 1.703704, 1, 1, 1, 1, 1,
0.1835013, -0.03576541, 0.8299199, 1, 1, 1, 1, 1,
0.1843917, 0.5941542, 0.07976258, 1, 1, 1, 1, 1,
0.1869422, -0.1905683, 4.411482, 1, 1, 1, 1, 1,
0.1890491, -0.2357242, 1.231352, 1, 1, 1, 1, 1,
0.1899991, -0.7965707, 3.338335, 1, 1, 1, 1, 1,
0.1905766, 1.676533, -0.1924564, 1, 1, 1, 1, 1,
0.1907174, 0.928252, 0.4674904, 1, 1, 1, 1, 1,
0.1954362, -1.339575, 3.305111, 0, 0, 1, 1, 1,
0.1969587, 1.013619, -0.6779727, 1, 0, 0, 1, 1,
0.1978562, 0.3367702, -0.6789649, 1, 0, 0, 1, 1,
0.1979404, -0.4951293, 2.974756, 1, 0, 0, 1, 1,
0.2001181, 0.07169886, 1.384773, 1, 0, 0, 1, 1,
0.200905, 0.9144978, 1.968164, 1, 0, 0, 1, 1,
0.2124704, -1.771129, 5.274802, 0, 0, 0, 1, 1,
0.2148477, -0.004017022, 1.195099, 0, 0, 0, 1, 1,
0.2283677, 1.47804, -0.5421661, 0, 0, 0, 1, 1,
0.2287069, -1.53526, 1.714585, 0, 0, 0, 1, 1,
0.2294242, 0.4906262, 1.144126, 0, 0, 0, 1, 1,
0.2296282, -0.3899925, 1.615441, 0, 0, 0, 1, 1,
0.2309587, -0.08307025, 1.541232, 0, 0, 0, 1, 1,
0.2314997, 0.01345449, 2.843021, 1, 1, 1, 1, 1,
0.2319005, -0.9641037, 3.618579, 1, 1, 1, 1, 1,
0.2336981, -1.335433, 1.793515, 1, 1, 1, 1, 1,
0.2403727, -1.549829, 2.231784, 1, 1, 1, 1, 1,
0.2421221, -1.39933, 4.462633, 1, 1, 1, 1, 1,
0.2423485, -0.6770923, 1.709648, 1, 1, 1, 1, 1,
0.2470895, 1.012413, 1.934036, 1, 1, 1, 1, 1,
0.2502654, 0.1311303, 1.939336, 1, 1, 1, 1, 1,
0.2538669, 0.7071709, -0.9075245, 1, 1, 1, 1, 1,
0.2573731, -0.3643718, 2.037526, 1, 1, 1, 1, 1,
0.2587121, -1.164539, 3.267955, 1, 1, 1, 1, 1,
0.2613085, 0.568232, 0.2228283, 1, 1, 1, 1, 1,
0.2645314, -0.2252769, 3.340678, 1, 1, 1, 1, 1,
0.2647178, -0.752592, 3.312937, 1, 1, 1, 1, 1,
0.2666569, 0.8632947, 0.396069, 1, 1, 1, 1, 1,
0.2674602, 0.2972046, 1.485344, 0, 0, 1, 1, 1,
0.2733493, -0.6942653, 3.406185, 1, 0, 0, 1, 1,
0.2755616, 0.5417182, -0.06264232, 1, 0, 0, 1, 1,
0.2784354, -0.423385, 2.014179, 1, 0, 0, 1, 1,
0.2796, 1.280805, -0.8516375, 1, 0, 0, 1, 1,
0.2799344, 0.1618803, 1.583243, 1, 0, 0, 1, 1,
0.2811922, 0.5774627, 0.1869557, 0, 0, 0, 1, 1,
0.2834017, -1.953122, 3.32465, 0, 0, 0, 1, 1,
0.2903692, 0.7223414, 0.04349895, 0, 0, 0, 1, 1,
0.2907447, 0.4404095, -0.1021887, 0, 0, 0, 1, 1,
0.2915984, -1.527038, 4.490096, 0, 0, 0, 1, 1,
0.2938465, -1.130217, 4.824169, 0, 0, 0, 1, 1,
0.299557, -0.1552692, 2.558356, 0, 0, 0, 1, 1,
0.3012107, 1.304732, 0.7985505, 1, 1, 1, 1, 1,
0.3013645, -1.997983, 2.000684, 1, 1, 1, 1, 1,
0.3027774, -0.1119239, -0.3215204, 1, 1, 1, 1, 1,
0.3048956, -0.4057065, 3.190158, 1, 1, 1, 1, 1,
0.306681, 0.5779904, -0.4664765, 1, 1, 1, 1, 1,
0.3067283, 0.657518, 0.6061062, 1, 1, 1, 1, 1,
0.3146163, -0.4301204, 2.282023, 1, 1, 1, 1, 1,
0.316447, 0.5734427, 0.9001212, 1, 1, 1, 1, 1,
0.3165787, -2.817867, 3.545397, 1, 1, 1, 1, 1,
0.3173118, 0.7317495, -0.4106618, 1, 1, 1, 1, 1,
0.322978, 0.1428262, 1.683777, 1, 1, 1, 1, 1,
0.3230414, -0.8207167, 3.295162, 1, 1, 1, 1, 1,
0.3254045, 0.02933048, 1.342022, 1, 1, 1, 1, 1,
0.325781, 0.648653, -0.5461102, 1, 1, 1, 1, 1,
0.3262212, -0.001571607, 1.465012, 1, 1, 1, 1, 1,
0.3392103, -0.7284277, 3.959227, 0, 0, 1, 1, 1,
0.340938, -0.0237378, 2.192193, 1, 0, 0, 1, 1,
0.3508821, 0.2243789, 0.8756118, 1, 0, 0, 1, 1,
0.3511009, -0.2780803, 2.237022, 1, 0, 0, 1, 1,
0.3532053, -0.03645292, 1.734203, 1, 0, 0, 1, 1,
0.3541284, 1.473119, 0.6230448, 1, 0, 0, 1, 1,
0.3541952, 0.3793586, 2.594922, 0, 0, 0, 1, 1,
0.3559971, -2.474485, 3.232578, 0, 0, 0, 1, 1,
0.3587804, -1.709405, 2.144187, 0, 0, 0, 1, 1,
0.3661845, 0.8545602, -0.2742075, 0, 0, 0, 1, 1,
0.3698178, 0.2196166, 1.374286, 0, 0, 0, 1, 1,
0.3703191, 0.52481, 0.5505788, 0, 0, 0, 1, 1,
0.3731839, 0.1412068, 2.481059, 0, 0, 0, 1, 1,
0.3769027, -0.9671794, 2.983351, 1, 1, 1, 1, 1,
0.3774528, -0.3776982, 1.681423, 1, 1, 1, 1, 1,
0.3792065, 0.4302575, 0.3352848, 1, 1, 1, 1, 1,
0.3821948, 0.6519627, 0.7639353, 1, 1, 1, 1, 1,
0.3862638, 0.2830788, 0.6219706, 1, 1, 1, 1, 1,
0.3875639, -0.3300242, 1.344393, 1, 1, 1, 1, 1,
0.3885608, -0.1217329, 1.261017, 1, 1, 1, 1, 1,
0.3886195, -0.3467714, 2.564562, 1, 1, 1, 1, 1,
0.3912829, -0.4279158, 4.770833, 1, 1, 1, 1, 1,
0.3969103, 0.3315257, 0.2464527, 1, 1, 1, 1, 1,
0.3971316, 0.1519334, 1.877591, 1, 1, 1, 1, 1,
0.4025437, 0.1547226, 2.030605, 1, 1, 1, 1, 1,
0.4038939, 1.477836, 0.04261694, 1, 1, 1, 1, 1,
0.4056465, -0.8526791, 2.808345, 1, 1, 1, 1, 1,
0.4190303, -1.454062, 1.736717, 1, 1, 1, 1, 1,
0.4196151, 0.3454918, 0.6639294, 0, 0, 1, 1, 1,
0.424505, -1.864737, 1.803033, 1, 0, 0, 1, 1,
0.4253927, 1.491216, -0.3365484, 1, 0, 0, 1, 1,
0.4259202, 0.2047797, 2.921149, 1, 0, 0, 1, 1,
0.4260132, -0.6383656, 2.311013, 1, 0, 0, 1, 1,
0.4283189, 0.688439, 0.2801864, 1, 0, 0, 1, 1,
0.4322421, 0.2509079, 1.370348, 0, 0, 0, 1, 1,
0.4341375, 1.081605, 0.9130633, 0, 0, 0, 1, 1,
0.434177, -0.8992821, 2.919523, 0, 0, 0, 1, 1,
0.4420653, -0.6852912, 3.391931, 0, 0, 0, 1, 1,
0.4424349, 0.2273358, 1.289699, 0, 0, 0, 1, 1,
0.4468676, -1.277963, 3.008475, 0, 0, 0, 1, 1,
0.4474857, -0.02507262, 1.482687, 0, 0, 0, 1, 1,
0.4581767, -1.320673, 2.371397, 1, 1, 1, 1, 1,
0.4641227, 0.6444623, -1.566378, 1, 1, 1, 1, 1,
0.4658498, -0.4402563, 1.595224, 1, 1, 1, 1, 1,
0.4675606, -0.9760808, 4.846579, 1, 1, 1, 1, 1,
0.4777315, -1.157069, 3.55192, 1, 1, 1, 1, 1,
0.4826108, 0.5025117, -0.0879658, 1, 1, 1, 1, 1,
0.4837191, -0.3762281, 1.422628, 1, 1, 1, 1, 1,
0.4839021, 0.1357175, -0.08784647, 1, 1, 1, 1, 1,
0.4873114, -1.111172, 4.01826, 1, 1, 1, 1, 1,
0.4886928, -0.1280589, 4.276802, 1, 1, 1, 1, 1,
0.4892733, 0.0175535, 1.50298, 1, 1, 1, 1, 1,
0.4955955, 0.8236547, 1.861783, 1, 1, 1, 1, 1,
0.4987253, 0.9996638, 0.3850527, 1, 1, 1, 1, 1,
0.5029644, 0.8540304, 2.689683, 1, 1, 1, 1, 1,
0.5046648, -0.5491764, 1.601757, 1, 1, 1, 1, 1,
0.50688, -1.726253, 2.030463, 0, 0, 1, 1, 1,
0.5104761, -2.06443, 2.464565, 1, 0, 0, 1, 1,
0.5128967, -0.6264786, 2.752327, 1, 0, 0, 1, 1,
0.5130749, 0.3020505, 0.7027061, 1, 0, 0, 1, 1,
0.5139037, -0.6153989, 2.274385, 1, 0, 0, 1, 1,
0.5189564, -0.4855801, 0.7883889, 1, 0, 0, 1, 1,
0.5234659, -0.8502905, 2.649391, 0, 0, 0, 1, 1,
0.5272129, -1.404588, 3.929759, 0, 0, 0, 1, 1,
0.5316919, 0.2366734, 0.2076032, 0, 0, 0, 1, 1,
0.5326217, 1.075469, -0.2931474, 0, 0, 0, 1, 1,
0.536266, -0.6969599, 2.19198, 0, 0, 0, 1, 1,
0.5362902, -0.8416414, 3.767272, 0, 0, 0, 1, 1,
0.5389215, -0.6463506, 2.891927, 0, 0, 0, 1, 1,
0.547026, -1.326064, 2.821756, 1, 1, 1, 1, 1,
0.5502251, -0.9828311, 3.568529, 1, 1, 1, 1, 1,
0.5504953, 0.6851477, 1.66214, 1, 1, 1, 1, 1,
0.5514265, 0.3740349, 1.497492, 1, 1, 1, 1, 1,
0.5537546, 2.159818, 1.272754, 1, 1, 1, 1, 1,
0.554333, 0.6984411, 0.06733424, 1, 1, 1, 1, 1,
0.5554723, -0.7570462, 2.53454, 1, 1, 1, 1, 1,
0.5586528, -0.6865185, 2.651369, 1, 1, 1, 1, 1,
0.562939, -0.7245892, 2.0916, 1, 1, 1, 1, 1,
0.5631253, 0.1040107, 1.260246, 1, 1, 1, 1, 1,
0.566176, -1.524229, 2.910427, 1, 1, 1, 1, 1,
0.5686707, -1.498384, 2.398722, 1, 1, 1, 1, 1,
0.5688888, -0.3368428, -0.6089419, 1, 1, 1, 1, 1,
0.5738954, -1.37808, 2.846399, 1, 1, 1, 1, 1,
0.5804937, -1.963701, 3.251827, 1, 1, 1, 1, 1,
0.5844378, 1.073221, 2.27608, 0, 0, 1, 1, 1,
0.5853178, -0.2760919, 1.179393, 1, 0, 0, 1, 1,
0.58564, -0.1409494, 1.303749, 1, 0, 0, 1, 1,
0.5857624, -0.8230398, 2.523778, 1, 0, 0, 1, 1,
0.5893809, 1.454512, -1.194233, 1, 0, 0, 1, 1,
0.5927658, 1.517698, -2.018582, 1, 0, 0, 1, 1,
0.6001018, -0.626014, 3.037801, 0, 0, 0, 1, 1,
0.6012534, 1.404875, 1.486689, 0, 0, 0, 1, 1,
0.6042935, 0.3431766, 1.25927, 0, 0, 0, 1, 1,
0.6063249, 0.5537863, 1.642298, 0, 0, 0, 1, 1,
0.6091977, -0.2920938, 2.37537, 0, 0, 0, 1, 1,
0.6099499, 1.798027, 0.3003501, 0, 0, 0, 1, 1,
0.6155082, 0.4438074, 0.4871414, 0, 0, 0, 1, 1,
0.6175109, -0.7183995, 0.8728759, 1, 1, 1, 1, 1,
0.6207361, 0.4652453, 0.09415371, 1, 1, 1, 1, 1,
0.6222398, -1.022444, 3.566972, 1, 1, 1, 1, 1,
0.6253015, 0.6219632, 1.006467, 1, 1, 1, 1, 1,
0.629011, 0.4723617, -0.09601917, 1, 1, 1, 1, 1,
0.6341717, -0.6426605, 1.351501, 1, 1, 1, 1, 1,
0.6342983, 0.8331575, 0.2944674, 1, 1, 1, 1, 1,
0.6434672, 0.2717287, 0.6537676, 1, 1, 1, 1, 1,
0.6445326, -0.4263457, 1.096293, 1, 1, 1, 1, 1,
0.6512429, -1.645934, 0.3715349, 1, 1, 1, 1, 1,
0.6517178, -1.788566, 3.537245, 1, 1, 1, 1, 1,
0.6596137, -0.3903552, 1.762639, 1, 1, 1, 1, 1,
0.6628534, -0.07287301, 2.060105, 1, 1, 1, 1, 1,
0.6720876, 0.3514174, -0.1402199, 1, 1, 1, 1, 1,
0.6775491, 1.439804, 0.4340252, 1, 1, 1, 1, 1,
0.678497, -0.07654773, 0.1814437, 0, 0, 1, 1, 1,
0.6801616, 0.4695887, 1.719842, 1, 0, 0, 1, 1,
0.6865196, 0.8299088, 0.2619088, 1, 0, 0, 1, 1,
0.6877542, 1.114249, -0.898307, 1, 0, 0, 1, 1,
0.6883941, 0.8543782, -0.3642287, 1, 0, 0, 1, 1,
0.6914557, 1.934746, -0.07763141, 1, 0, 0, 1, 1,
0.6985771, 0.01984971, 2.052541, 0, 0, 0, 1, 1,
0.7017878, 0.9256096, -1.572293, 0, 0, 0, 1, 1,
0.7030024, -0.2443383, 0.2174822, 0, 0, 0, 1, 1,
0.7033809, 0.1393279, 1.027883, 0, 0, 0, 1, 1,
0.7140353, 0.6164295, 0.08531488, 0, 0, 0, 1, 1,
0.7168438, -0.7646533, 2.68989, 0, 0, 0, 1, 1,
0.7231519, -0.03774477, 1.951772, 0, 0, 0, 1, 1,
0.7255707, 0.406482, 0.313549, 1, 1, 1, 1, 1,
0.7326637, -0.7423656, 1.247404, 1, 1, 1, 1, 1,
0.7371196, -0.8210725, 1.855608, 1, 1, 1, 1, 1,
0.737393, 0.8624952, 0.9436455, 1, 1, 1, 1, 1,
0.7386552, 0.6843005, 0.3730279, 1, 1, 1, 1, 1,
0.7440579, -0.1253762, 3.073834, 1, 1, 1, 1, 1,
0.7590755, -0.1138289, 2.894921, 1, 1, 1, 1, 1,
0.7642012, 0.255547, 2.003896, 1, 1, 1, 1, 1,
0.7645059, -0.7010915, 2.581199, 1, 1, 1, 1, 1,
0.765441, -0.3478732, 1.253931, 1, 1, 1, 1, 1,
0.7662865, -0.9924092, 1.679644, 1, 1, 1, 1, 1,
0.7687942, -0.7165468, 3.042535, 1, 1, 1, 1, 1,
0.7740673, 0.2616872, 1.340553, 1, 1, 1, 1, 1,
0.7748897, -1.150684, 2.899459, 1, 1, 1, 1, 1,
0.7762621, 0.2900801, 0.6562479, 1, 1, 1, 1, 1,
0.7797773, 1.696215, 0.8427565, 0, 0, 1, 1, 1,
0.7805392, -0.9133562, 2.487571, 1, 0, 0, 1, 1,
0.7817491, -0.288771, 0.279439, 1, 0, 0, 1, 1,
0.7833185, -0.5491304, 2.352766, 1, 0, 0, 1, 1,
0.7901023, -0.268107, 0.4882575, 1, 0, 0, 1, 1,
0.7904583, -0.8073803, 1.997473, 1, 0, 0, 1, 1,
0.7919391, -1.068506, 2.257396, 0, 0, 0, 1, 1,
0.7957739, 1.041587, 0.8631546, 0, 0, 0, 1, 1,
0.7978495, 0.8904731, -0.5640228, 0, 0, 0, 1, 1,
0.7983916, 0.3553331, 2.742427, 0, 0, 0, 1, 1,
0.8009069, -1.192708, 2.535212, 0, 0, 0, 1, 1,
0.8016825, 1.656006, 0.06652844, 0, 0, 0, 1, 1,
0.8056065, -0.3520367, 1.816108, 0, 0, 0, 1, 1,
0.8068991, -2.462495, 1.320636, 1, 1, 1, 1, 1,
0.8115961, -1.323884, 2.005443, 1, 1, 1, 1, 1,
0.8120716, 1.688797, 0.8111426, 1, 1, 1, 1, 1,
0.8184425, 1.554612, 1.388016, 1, 1, 1, 1, 1,
0.8320891, -1.847724, 4.142793, 1, 1, 1, 1, 1,
0.8328644, 0.8865525, 2.82314, 1, 1, 1, 1, 1,
0.8365929, 0.6514469, 1.075929, 1, 1, 1, 1, 1,
0.8482694, -0.03516702, 2.14488, 1, 1, 1, 1, 1,
0.8556392, 0.9634984, -0.8116303, 1, 1, 1, 1, 1,
0.8566822, 0.2908246, 0.6359819, 1, 1, 1, 1, 1,
0.86074, -0.4526093, 0.9640918, 1, 1, 1, 1, 1,
0.8626332, -0.5089322, 3.020195, 1, 1, 1, 1, 1,
0.8634974, -0.8162183, 2.864968, 1, 1, 1, 1, 1,
0.8643879, -0.9620061, 2.034472, 1, 1, 1, 1, 1,
0.8662657, 1.227899, 0.2752926, 1, 1, 1, 1, 1,
0.8664466, 0.1625042, 0.9025126, 0, 0, 1, 1, 1,
0.8739747, 0.733682, 0.8189357, 1, 0, 0, 1, 1,
0.8751752, -0.5993367, 2.983224, 1, 0, 0, 1, 1,
0.87617, -1.146554, 0.9987394, 1, 0, 0, 1, 1,
0.8831829, -1.729581, 3.191821, 1, 0, 0, 1, 1,
0.8871521, 0.3167095, 1.455071, 1, 0, 0, 1, 1,
0.890031, -0.4763004, 0.9277623, 0, 0, 0, 1, 1,
0.8916253, -2.136113, 2.766584, 0, 0, 0, 1, 1,
0.8946801, 0.6694316, 0.5463855, 0, 0, 0, 1, 1,
0.9051798, -0.1438708, 2.240929, 0, 0, 0, 1, 1,
0.9161064, 0.5496399, 1.698082, 0, 0, 0, 1, 1,
0.9192334, 0.907214, 0.9920337, 0, 0, 0, 1, 1,
0.9210422, 0.9500239, 0.9312692, 0, 0, 0, 1, 1,
0.9214821, 0.5233869, -0.6923923, 1, 1, 1, 1, 1,
0.9250078, 1.481528, -0.5176442, 1, 1, 1, 1, 1,
0.9363015, 2.782766, 1.213128, 1, 1, 1, 1, 1,
0.9508613, 0.5331309, 2.058083, 1, 1, 1, 1, 1,
0.9550543, -0.1386878, 1.542533, 1, 1, 1, 1, 1,
0.9604797, -0.1982095, 1.525838, 1, 1, 1, 1, 1,
0.9653029, 0.8600237, -0.1176963, 1, 1, 1, 1, 1,
0.9809293, 2.658189, 0.9199317, 1, 1, 1, 1, 1,
0.9810978, -0.009268123, 1.73447, 1, 1, 1, 1, 1,
0.9811478, 0.1873243, 2.953172, 1, 1, 1, 1, 1,
0.9841776, 0.02820133, 2.432486, 1, 1, 1, 1, 1,
0.9913601, -0.3532786, 1.984927, 1, 1, 1, 1, 1,
0.9936226, -0.7276198, 1.427057, 1, 1, 1, 1, 1,
0.9976339, -0.1697921, 0.6328014, 1, 1, 1, 1, 1,
0.9998729, -0.69109, 1.59919, 1, 1, 1, 1, 1,
1.002207, -1.607116, 1.938774, 0, 0, 1, 1, 1,
1.012306, 1.905675, 1.006037, 1, 0, 0, 1, 1,
1.019118, 1.552629, -0.03049958, 1, 0, 0, 1, 1,
1.027206, -0.2487407, 2.503373, 1, 0, 0, 1, 1,
1.031386, 0.3696473, -0.4200025, 1, 0, 0, 1, 1,
1.031792, -0.1488185, 1.594098, 1, 0, 0, 1, 1,
1.035807, -1.660488, 2.249066, 0, 0, 0, 1, 1,
1.047632, -0.6399289, 1.413103, 0, 0, 0, 1, 1,
1.048992, -0.2709966, 1.930125, 0, 0, 0, 1, 1,
1.054531, 1.092038, 1.521413, 0, 0, 0, 1, 1,
1.059119, 0.5725664, -1.015842, 0, 0, 0, 1, 1,
1.060063, 0.2059874, 1.918734, 0, 0, 0, 1, 1,
1.068231, 1.247018, 0.922373, 0, 0, 0, 1, 1,
1.070947, -1.385041, 2.543598, 1, 1, 1, 1, 1,
1.074225, 0.111749, 2.841069, 1, 1, 1, 1, 1,
1.074527, 1.015741, 0.0634982, 1, 1, 1, 1, 1,
1.077242, -0.4380492, 1.093564, 1, 1, 1, 1, 1,
1.080528, 0.8288263, 1.980271, 1, 1, 1, 1, 1,
1.086109, 1.017653, 0.4358704, 1, 1, 1, 1, 1,
1.089397, -0.7804692, 2.007165, 1, 1, 1, 1, 1,
1.089898, 0.76556, 0.08697343, 1, 1, 1, 1, 1,
1.092136, -1.213205, 1.082846, 1, 1, 1, 1, 1,
1.093728, 1.316779, -1.226917, 1, 1, 1, 1, 1,
1.10213, -0.01348921, 2.550735, 1, 1, 1, 1, 1,
1.103251, -0.5196797, 0.9644439, 1, 1, 1, 1, 1,
1.103622, -0.2260358, 0.5502577, 1, 1, 1, 1, 1,
1.103689, -0.8296092, 2.803327, 1, 1, 1, 1, 1,
1.106157, 1.47428, 0.1765798, 1, 1, 1, 1, 1,
1.107159, 1.936113, 0.7477413, 0, 0, 1, 1, 1,
1.109645, 0.3795733, 0.9873915, 1, 0, 0, 1, 1,
1.111127, -0.6380346, 4.013355, 1, 0, 0, 1, 1,
1.113527, 1.402078, 1.967761, 1, 0, 0, 1, 1,
1.116001, -1.247081, 1.043406, 1, 0, 0, 1, 1,
1.121131, -1.340219, 2.271609, 1, 0, 0, 1, 1,
1.127136, 0.4020673, 0.4934356, 0, 0, 0, 1, 1,
1.127557, -1.097364, 1.536345, 0, 0, 0, 1, 1,
1.145728, 1.077753, -1.365883, 0, 0, 0, 1, 1,
1.156016, 0.3685269, -0.8009374, 0, 0, 0, 1, 1,
1.157383, -0.3522629, 1.561034, 0, 0, 0, 1, 1,
1.157746, 0.3076001, -0.5275871, 0, 0, 0, 1, 1,
1.16618, -0.3865829, 3.09742, 0, 0, 0, 1, 1,
1.175354, 0.458166, 0.8604025, 1, 1, 1, 1, 1,
1.182074, 0.6378199, 1.644332, 1, 1, 1, 1, 1,
1.186779, 1.040131, 2.216899, 1, 1, 1, 1, 1,
1.188968, 1.078011, 0.3642075, 1, 1, 1, 1, 1,
1.204853, -0.7228343, 3.241229, 1, 1, 1, 1, 1,
1.221123, -0.07562044, 0.9556813, 1, 1, 1, 1, 1,
1.222475, -0.7705069, 1.33777, 1, 1, 1, 1, 1,
1.236448, -1.48357, 3.185757, 1, 1, 1, 1, 1,
1.237209, 1.681696, 0.7115181, 1, 1, 1, 1, 1,
1.238526, -1.208792, 2.484018, 1, 1, 1, 1, 1,
1.243255, 0.6189238, 1.653778, 1, 1, 1, 1, 1,
1.248726, 0.3306309, -1.347841, 1, 1, 1, 1, 1,
1.269111, -0.3550025, 0.394343, 1, 1, 1, 1, 1,
1.273438, 0.3131017, 1.22355, 1, 1, 1, 1, 1,
1.275009, 0.8753554, 0.7202027, 1, 1, 1, 1, 1,
1.277362, 0.1245421, 0.929009, 0, 0, 1, 1, 1,
1.287479, -0.6187961, 2.191176, 1, 0, 0, 1, 1,
1.301494, 0.2836277, -1.25545, 1, 0, 0, 1, 1,
1.303204, -0.7686204, 3.613953, 1, 0, 0, 1, 1,
1.308282, 0.2417427, 2.704799, 1, 0, 0, 1, 1,
1.308478, 0.2260024, 2.442517, 1, 0, 0, 1, 1,
1.31812, -0.3362876, 2.23645, 0, 0, 0, 1, 1,
1.318976, -1.072526, 1.186796, 0, 0, 0, 1, 1,
1.323512, -0.2906083, 3.122363, 0, 0, 0, 1, 1,
1.325468, 1.135207, 1.796707, 0, 0, 0, 1, 1,
1.330382, -0.4470356, 2.379172, 0, 0, 0, 1, 1,
1.333925, 1.141433, -0.09680017, 0, 0, 0, 1, 1,
1.340008, 1.220125, 2.249242, 0, 0, 0, 1, 1,
1.343252, -0.2307009, 2.438134, 1, 1, 1, 1, 1,
1.345906, 0.7758812, 0.8865695, 1, 1, 1, 1, 1,
1.349917, -1.326587, 1.828645, 1, 1, 1, 1, 1,
1.350643, -0.1287976, 1.814121, 1, 1, 1, 1, 1,
1.356228, 1.134425, 1.240471, 1, 1, 1, 1, 1,
1.358421, -0.1488673, -0.01157057, 1, 1, 1, 1, 1,
1.36337, -0.329446, 2.364378, 1, 1, 1, 1, 1,
1.367276, 0.0405526, -0.9507696, 1, 1, 1, 1, 1,
1.391809, -0.5786414, 2.867801, 1, 1, 1, 1, 1,
1.392221, -1.185035, 2.688005, 1, 1, 1, 1, 1,
1.392294, -0.3003096, 3.017548, 1, 1, 1, 1, 1,
1.392652, 0.607881, 1.011601, 1, 1, 1, 1, 1,
1.39299, 0.4552805, 2.683703, 1, 1, 1, 1, 1,
1.393216, 0.3201284, 1.425754, 1, 1, 1, 1, 1,
1.403181, -0.4487258, 1.486117, 1, 1, 1, 1, 1,
1.403938, 0.9483463, 1.331444, 0, 0, 1, 1, 1,
1.404913, -0.3745309, 4.455085, 1, 0, 0, 1, 1,
1.417044, 1.010973, 1.048926, 1, 0, 0, 1, 1,
1.425577, 0.7169574, -0.1704481, 1, 0, 0, 1, 1,
1.438468, -0.3560711, 0.9061878, 1, 0, 0, 1, 1,
1.44781, 1.697693, 2.153304, 1, 0, 0, 1, 1,
1.478812, -1.468496, 1.372654, 0, 0, 0, 1, 1,
1.481266, -1.709715, 1.807775, 0, 0, 0, 1, 1,
1.489739, -0.3895895, 2.669608, 0, 0, 0, 1, 1,
1.490766, 0.07115107, 2.108355, 0, 0, 0, 1, 1,
1.499997, -1.073532, 2.784117, 0, 0, 0, 1, 1,
1.515984, -0.5453629, 2.931044, 0, 0, 0, 1, 1,
1.524053, 0.7669703, 3.179171, 0, 0, 0, 1, 1,
1.52653, 1.366336, 0.4444353, 1, 1, 1, 1, 1,
1.529316, 0.3424084, 1.710069, 1, 1, 1, 1, 1,
1.534657, -1.05573, 0.5283449, 1, 1, 1, 1, 1,
1.535211, -1.564923, 1.990879, 1, 1, 1, 1, 1,
1.552277, 0.7358664, 0.245168, 1, 1, 1, 1, 1,
1.554678, 0.08552412, 0.8137755, 1, 1, 1, 1, 1,
1.55989, -2.18476, 3.24535, 1, 1, 1, 1, 1,
1.565225, 1.170042, 0.06552731, 1, 1, 1, 1, 1,
1.587235, -1.106375, 2.994572, 1, 1, 1, 1, 1,
1.610407, -0.7661369, 3.256902, 1, 1, 1, 1, 1,
1.619869, 0.4200858, 2.315687, 1, 1, 1, 1, 1,
1.620733, 0.9421164, 1.947455, 1, 1, 1, 1, 1,
1.62558, 1.319538, 1.938775, 1, 1, 1, 1, 1,
1.709189, -1.111766, 2.203066, 1, 1, 1, 1, 1,
1.724648, -0.01038594, 2.20691, 1, 1, 1, 1, 1,
1.731339, -0.985977, 1.770601, 0, 0, 1, 1, 1,
1.738291, -0.6131061, 0.4989849, 1, 0, 0, 1, 1,
1.743549, -0.1749049, 2.726551, 1, 0, 0, 1, 1,
1.750771, 0.9312168, 1.82885, 1, 0, 0, 1, 1,
1.760309, 1.458825, 0.05489689, 1, 0, 0, 1, 1,
1.766516, -2.297129, 3.918628, 1, 0, 0, 1, 1,
1.769916, 0.9329754, -0.2097098, 0, 0, 0, 1, 1,
1.772289, 1.158971, 1.725167, 0, 0, 0, 1, 1,
1.777342, -1.258669, 0.5813189, 0, 0, 0, 1, 1,
1.785394, -0.2267228, 2.602483, 0, 0, 0, 1, 1,
1.787719, 1.031982, -0.4364091, 0, 0, 0, 1, 1,
1.788436, 0.0575156, 0.8378169, 0, 0, 0, 1, 1,
1.813494, 0.4897785, 2.16382, 0, 0, 0, 1, 1,
1.839793, -0.07841219, 1.12138, 1, 1, 1, 1, 1,
1.850691, -0.7843692, 1.388238, 1, 1, 1, 1, 1,
1.860509, -0.1115997, -1.381508, 1, 1, 1, 1, 1,
1.883185, 0.2738765, 1.599974, 1, 1, 1, 1, 1,
1.906701, 1.323561, -0.6404832, 1, 1, 1, 1, 1,
1.911641, -1.574957, 1.445875, 1, 1, 1, 1, 1,
1.91692, -0.7573351, 0.2478179, 1, 1, 1, 1, 1,
1.922972, -1.494694, 2.526194, 1, 1, 1, 1, 1,
1.940233, 0.6416788, 0.7308937, 1, 1, 1, 1, 1,
1.967549, 0.9344724, 1.307449, 1, 1, 1, 1, 1,
1.976286, -0.4529577, 2.020324, 1, 1, 1, 1, 1,
1.988741, -0.4981866, 2.765943, 1, 1, 1, 1, 1,
1.993749, -1.744437, 0.58649, 1, 1, 1, 1, 1,
2.05656, -1.767481, 3.543806, 1, 1, 1, 1, 1,
2.094764, 1.111134, 0.252497, 1, 1, 1, 1, 1,
2.099473, 0.333714, 2.227112, 0, 0, 1, 1, 1,
2.099959, 0.1274431, 0.3761858, 1, 0, 0, 1, 1,
2.120173, -0.4288454, 2.376313, 1, 0, 0, 1, 1,
2.138128, 1.159775, 1.115461, 1, 0, 0, 1, 1,
2.151343, -0.1603615, 2.333056, 1, 0, 0, 1, 1,
2.156715, 0.2807632, 3.567102, 1, 0, 0, 1, 1,
2.166645, -1.399625, 0.09782194, 0, 0, 0, 1, 1,
2.196173, 1.178067, 1.212191, 0, 0, 0, 1, 1,
2.233522, -2.244865, 2.670057, 0, 0, 0, 1, 1,
2.280059, -0.05489842, 2.575855, 0, 0, 0, 1, 1,
2.387062, 0.7548205, 1.16182, 0, 0, 0, 1, 1,
2.408511, 0.719305, -0.5377604, 0, 0, 0, 1, 1,
2.40995, 1.500669, 1.519334, 0, 0, 0, 1, 1,
2.465421, 1.113791, 1.870237, 1, 1, 1, 1, 1,
2.491675, 0.04413276, 2.004521, 1, 1, 1, 1, 1,
2.51291, 0.09735885, 0.497065, 1, 1, 1, 1, 1,
2.694941, -1.864675, 1.174019, 1, 1, 1, 1, 1,
2.941863, 0.6724892, -0.01949563, 1, 1, 1, 1, 1,
3.136519, 0.2848913, 2.462206, 1, 1, 1, 1, 1,
3.14476, 0.4835187, 2.24531, 1, 1, 1, 1, 1
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
var radius = 9.456226;
var distance = 33.21459;
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
mvMatrix.translate( -0.08504081, -0.2409751, 0.124063 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21459);
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
