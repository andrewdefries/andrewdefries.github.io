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
-3.158035, 2.015659, -2.037025, 1, 0, 0, 1,
-3.002558, 1.064611, -1.38571, 1, 0.007843138, 0, 1,
-2.942387, 1.515454, -0.08217744, 1, 0.01176471, 0, 1,
-2.711263, 0.05664687, -1.260259, 1, 0.01960784, 0, 1,
-2.611624, -0.06153354, -0.4374619, 1, 0.02352941, 0, 1,
-2.606271, 0.5554648, -0.2065852, 1, 0.03137255, 0, 1,
-2.535631, 1.107753, 0.1308565, 1, 0.03529412, 0, 1,
-2.373652, 0.4983731, -1.394339, 1, 0.04313726, 0, 1,
-2.310876, -0.3030709, -0.282625, 1, 0.04705882, 0, 1,
-2.286621, 0.7496276, -1.104492, 1, 0.05490196, 0, 1,
-2.250282, 1.337495, -0.4100872, 1, 0.05882353, 0, 1,
-2.222279, 1.164247, 0.3957012, 1, 0.06666667, 0, 1,
-2.218722, -1.460695, -0.5363227, 1, 0.07058824, 0, 1,
-2.116478, -0.07591914, 0.3386502, 1, 0.07843138, 0, 1,
-2.104532, 0.5107048, -1.797526, 1, 0.08235294, 0, 1,
-2.08581, 0.977591, -0.999885, 1, 0.09019608, 0, 1,
-2.059376, 0.8240209, -0.7267814, 1, 0.09411765, 0, 1,
-2.039695, -0.5657899, 0.9080231, 1, 0.1019608, 0, 1,
-2.038959, 0.3175871, 0.5440196, 1, 0.1098039, 0, 1,
-2.010977, 0.7483867, -2.782065, 1, 0.1137255, 0, 1,
-1.950229, 0.2879525, -3.023368, 1, 0.1215686, 0, 1,
-1.931335, -0.6937501, -1.2466, 1, 0.1254902, 0, 1,
-1.927375, 0.7730596, -0.905184, 1, 0.1333333, 0, 1,
-1.907911, -0.7937793, -1.624256, 1, 0.1372549, 0, 1,
-1.890019, -1.314469, -4.547036, 1, 0.145098, 0, 1,
-1.887022, 0.3571818, -2.950386, 1, 0.1490196, 0, 1,
-1.88701, 0.2352713, -0.005676362, 1, 0.1568628, 0, 1,
-1.879399, -0.6515825, -1.45765, 1, 0.1607843, 0, 1,
-1.86563, -2.440697, -3.229228, 1, 0.1686275, 0, 1,
-1.810211, 0.624396, 0.5231375, 1, 0.172549, 0, 1,
-1.797918, 1.26724, -0.9437006, 1, 0.1803922, 0, 1,
-1.787034, -1.733899, -1.946836, 1, 0.1843137, 0, 1,
-1.759684, -0.6286722, -2.598921, 1, 0.1921569, 0, 1,
-1.738808, -2.41429, -2.482842, 1, 0.1960784, 0, 1,
-1.720954, -1.079082, -4.468462, 1, 0.2039216, 0, 1,
-1.714145, 1.619491, -0.1495524, 1, 0.2117647, 0, 1,
-1.710252, 0.7164935, -0.5752885, 1, 0.2156863, 0, 1,
-1.62129, -0.6300403, -2.698815, 1, 0.2235294, 0, 1,
-1.607437, 1.310156, -1.786153, 1, 0.227451, 0, 1,
-1.605591, -1.875341, -2.763777, 1, 0.2352941, 0, 1,
-1.600329, -1.238454, -3.470771, 1, 0.2392157, 0, 1,
-1.57787, 1.111484, -2.74626, 1, 0.2470588, 0, 1,
-1.571143, -0.8344041, -1.793341, 1, 0.2509804, 0, 1,
-1.552733, 0.4991207, -1.643417, 1, 0.2588235, 0, 1,
-1.527779, -1.424536, -0.2766216, 1, 0.2627451, 0, 1,
-1.526255, -0.6364259, -2.462665, 1, 0.2705882, 0, 1,
-1.509019, 1.833633, -1.855267, 1, 0.2745098, 0, 1,
-1.5046, -0.7064136, -2.55854, 1, 0.282353, 0, 1,
-1.489933, -0.7773417, -3.96314, 1, 0.2862745, 0, 1,
-1.482718, -0.1558356, -2.083722, 1, 0.2941177, 0, 1,
-1.481495, -1.521968, -5.038654, 1, 0.3019608, 0, 1,
-1.477975, 0.4748726, -0.6930051, 1, 0.3058824, 0, 1,
-1.473908, 0.9024764, -1.277555, 1, 0.3137255, 0, 1,
-1.466295, 0.697106, -1.131348, 1, 0.3176471, 0, 1,
-1.461742, -1.403444, -3.437246, 1, 0.3254902, 0, 1,
-1.460767, 1.134191, -1.815924, 1, 0.3294118, 0, 1,
-1.458095, 0.3663892, -0.8737814, 1, 0.3372549, 0, 1,
-1.45789, 0.6623286, -1.065416, 1, 0.3411765, 0, 1,
-1.45197, -1.763492, -3.249726, 1, 0.3490196, 0, 1,
-1.448703, 1.118511, -1.186918, 1, 0.3529412, 0, 1,
-1.434742, -0.06514333, -2.541337, 1, 0.3607843, 0, 1,
-1.431896, -0.2056985, 0.03711764, 1, 0.3647059, 0, 1,
-1.424257, -0.4792184, -1.226039, 1, 0.372549, 0, 1,
-1.422422, 0.4930465, -1.647671, 1, 0.3764706, 0, 1,
-1.421941, 1.091566, -1.153549, 1, 0.3843137, 0, 1,
-1.419337, 1.219649, -1.140618, 1, 0.3882353, 0, 1,
-1.4187, 0.5118759, -2.97684, 1, 0.3960784, 0, 1,
-1.41368, -0.9506526, -1.930624, 1, 0.4039216, 0, 1,
-1.402255, -0.06584328, -3.91702, 1, 0.4078431, 0, 1,
-1.395887, -0.308263, -2.473081, 1, 0.4156863, 0, 1,
-1.393002, -2.150321, -3.259163, 1, 0.4196078, 0, 1,
-1.388986, -0.2553596, -0.8795205, 1, 0.427451, 0, 1,
-1.388456, 1.726865, 0.3682614, 1, 0.4313726, 0, 1,
-1.379683, -1.846961, -1.760714, 1, 0.4392157, 0, 1,
-1.368223, -0.8711894, -1.344989, 1, 0.4431373, 0, 1,
-1.363844, -1.395793, -2.040922, 1, 0.4509804, 0, 1,
-1.35878, -0.03625426, -2.355827, 1, 0.454902, 0, 1,
-1.337981, -0.398126, -2.117791, 1, 0.4627451, 0, 1,
-1.330607, -0.01422911, -0.9945664, 1, 0.4666667, 0, 1,
-1.327489, -0.1608279, -0.5134228, 1, 0.4745098, 0, 1,
-1.326905, 1.005543, -0.6258662, 1, 0.4784314, 0, 1,
-1.321523, -1.126996, -1.88741, 1, 0.4862745, 0, 1,
-1.307917, -0.5425025, -1.622072, 1, 0.4901961, 0, 1,
-1.302819, -0.01827385, -2.094015, 1, 0.4980392, 0, 1,
-1.299937, -0.4020154, -1.390654, 1, 0.5058824, 0, 1,
-1.282182, -0.1458535, 0.6565648, 1, 0.509804, 0, 1,
-1.278358, -0.9121401, -0.1281234, 1, 0.5176471, 0, 1,
-1.273949, -0.01533591, -1.759177, 1, 0.5215687, 0, 1,
-1.260773, 0.271549, -3.213649, 1, 0.5294118, 0, 1,
-1.248937, -1.787502, -2.435679, 1, 0.5333334, 0, 1,
-1.243124, -0.7794249, -2.024315, 1, 0.5411765, 0, 1,
-1.239929, 1.005229, -1.294635, 1, 0.5450981, 0, 1,
-1.236965, -0.07450757, -0.7599733, 1, 0.5529412, 0, 1,
-1.236603, -1.242851, -2.884894, 1, 0.5568628, 0, 1,
-1.230273, 1.942526, 0.05044007, 1, 0.5647059, 0, 1,
-1.22905, -1.139699, -1.52904, 1, 0.5686275, 0, 1,
-1.220284, 0.634124, -0.7548557, 1, 0.5764706, 0, 1,
-1.219094, -0.235158, -2.910784, 1, 0.5803922, 0, 1,
-1.215485, 0.04079507, -0.9437176, 1, 0.5882353, 0, 1,
-1.20375, -0.5785271, -1.987713, 1, 0.5921569, 0, 1,
-1.203098, 0.2056108, -0.6492609, 1, 0.6, 0, 1,
-1.20265, 0.6817527, -3.457934, 1, 0.6078432, 0, 1,
-1.202437, 1.243927, -1.723307, 1, 0.6117647, 0, 1,
-1.19868, 0.9301048, -0.5481073, 1, 0.6196079, 0, 1,
-1.197071, 0.9023722, -0.1026599, 1, 0.6235294, 0, 1,
-1.191054, 0.8486115, -0.6378772, 1, 0.6313726, 0, 1,
-1.177428, 0.7436658, 0.3168968, 1, 0.6352941, 0, 1,
-1.165697, 0.3352709, -0.658445, 1, 0.6431373, 0, 1,
-1.161439, -0.7856196, -1.990638, 1, 0.6470588, 0, 1,
-1.160584, 0.2967028, -2.228828, 1, 0.654902, 0, 1,
-1.154675, -0.4593548, -2.727239, 1, 0.6588235, 0, 1,
-1.154069, -0.7160128, -1.347839, 1, 0.6666667, 0, 1,
-1.153784, 0.8220865, -1.435914, 1, 0.6705883, 0, 1,
-1.152319, -0.3509871, -0.5818231, 1, 0.6784314, 0, 1,
-1.149301, 0.6926159, 0.6282386, 1, 0.682353, 0, 1,
-1.143152, 1.171001, -0.09188688, 1, 0.6901961, 0, 1,
-1.143009, 0.4670875, -1.160114, 1, 0.6941177, 0, 1,
-1.13345, -0.6674084, -1.719323, 1, 0.7019608, 0, 1,
-1.130388, -0.08879817, -2.666132, 1, 0.7098039, 0, 1,
-1.128931, 0.7299849, -1.291971, 1, 0.7137255, 0, 1,
-1.128121, 2.118587, 1.422797, 1, 0.7215686, 0, 1,
-1.126626, -1.083426, -2.489823, 1, 0.7254902, 0, 1,
-1.123551, 0.1080109, -1.529911, 1, 0.7333333, 0, 1,
-1.109338, -0.0650753, -1.321203, 1, 0.7372549, 0, 1,
-1.098555, -0.5125149, -2.363855, 1, 0.7450981, 0, 1,
-1.094599, -1.82775, -3.329073, 1, 0.7490196, 0, 1,
-1.08965, 0.2363752, -1.948033, 1, 0.7568628, 0, 1,
-1.072196, 0.1862516, -1.346987, 1, 0.7607843, 0, 1,
-1.071471, -0.3332068, -2.099593, 1, 0.7686275, 0, 1,
-1.062493, 2.117001, -0.3932908, 1, 0.772549, 0, 1,
-1.062268, 1.030411, 0.4324004, 1, 0.7803922, 0, 1,
-1.054902, -0.1603787, -2.939518, 1, 0.7843137, 0, 1,
-1.053128, -1.401357, -3.076383, 1, 0.7921569, 0, 1,
-1.05171, -1.145951, -3.138484, 1, 0.7960784, 0, 1,
-1.051638, -1.533711, -1.555589, 1, 0.8039216, 0, 1,
-1.045482, -2.010386, -2.445158, 1, 0.8117647, 0, 1,
-1.044319, -0.9988359, -2.622062, 1, 0.8156863, 0, 1,
-1.039542, 0.8138705, -0.4653664, 1, 0.8235294, 0, 1,
-1.038901, -0.702784, -2.005301, 1, 0.827451, 0, 1,
-1.025173, 0.2054741, -0.1805145, 1, 0.8352941, 0, 1,
-1.02433, -0.800128, -2.935889, 1, 0.8392157, 0, 1,
-1.017324, 0.05746051, -2.782651, 1, 0.8470588, 0, 1,
-1.015617, -0.3999683, -2.117179, 1, 0.8509804, 0, 1,
-1.005328, -1.371267, -1.22616, 1, 0.8588235, 0, 1,
-1.004911, -1.028967, -1.118278, 1, 0.8627451, 0, 1,
-1.000199, -0.8571388, -2.914277, 1, 0.8705882, 0, 1,
-0.9869436, 1.038136, -1.347768, 1, 0.8745098, 0, 1,
-0.9864701, 0.01189086, -0.6494402, 1, 0.8823529, 0, 1,
-0.959869, -1.098394, -2.642375, 1, 0.8862745, 0, 1,
-0.9517782, 0.1373934, -2.272085, 1, 0.8941177, 0, 1,
-0.9512602, 0.6640835, -1.3306, 1, 0.8980392, 0, 1,
-0.9471105, -0.332383, -1.430032, 1, 0.9058824, 0, 1,
-0.9420068, -0.9056992, -3.277565, 1, 0.9137255, 0, 1,
-0.9392219, 0.6826678, -1.642556, 1, 0.9176471, 0, 1,
-0.9274762, -0.3619743, -0.7299259, 1, 0.9254902, 0, 1,
-0.9175838, 1.323545, -1.617294, 1, 0.9294118, 0, 1,
-0.9174535, -0.2433933, -2.124228, 1, 0.9372549, 0, 1,
-0.9107105, 1.022357, -1.987127, 1, 0.9411765, 0, 1,
-0.9026707, 1.688922, -2.576592, 1, 0.9490196, 0, 1,
-0.8990624, -0.4279018, -2.29466, 1, 0.9529412, 0, 1,
-0.8978239, -0.2444837, -1.213756, 1, 0.9607843, 0, 1,
-0.894982, -0.1710807, -2.511483, 1, 0.9647059, 0, 1,
-0.8943358, -1.384607, -2.015229, 1, 0.972549, 0, 1,
-0.89323, -0.09318248, -0.6248528, 1, 0.9764706, 0, 1,
-0.8929803, 0.7344822, 0.1031619, 1, 0.9843137, 0, 1,
-0.8927913, 0.7402083, 1.485557, 1, 0.9882353, 0, 1,
-0.8906377, -0.6174217, -3.406321, 1, 0.9960784, 0, 1,
-0.8885093, -1.879842, -3.280256, 0.9960784, 1, 0, 1,
-0.8864939, -0.8951315, -2.934699, 0.9921569, 1, 0, 1,
-0.883784, -0.1579188, -2.48483, 0.9843137, 1, 0, 1,
-0.8826189, 0.3759587, -1.724357, 0.9803922, 1, 0, 1,
-0.8798331, 0.384428, -1.743604, 0.972549, 1, 0, 1,
-0.8778903, -0.1541951, -1.840427, 0.9686275, 1, 0, 1,
-0.8768939, 0.936074, 1.706693, 0.9607843, 1, 0, 1,
-0.8757315, -1.209053, -1.305773, 0.9568627, 1, 0, 1,
-0.8741506, -1.56138, -4.451298, 0.9490196, 1, 0, 1,
-0.8727673, -0.6067414, -3.104063, 0.945098, 1, 0, 1,
-0.8703739, 0.8425606, -1.221862, 0.9372549, 1, 0, 1,
-0.8664643, -0.836585, -1.552936, 0.9333333, 1, 0, 1,
-0.857422, 0.7963404, -1.591797, 0.9254902, 1, 0, 1,
-0.8560238, 0.664456, -2.278469, 0.9215686, 1, 0, 1,
-0.8459607, -0.8272643, -1.99694, 0.9137255, 1, 0, 1,
-0.8433067, 0.3682017, -0.4400592, 0.9098039, 1, 0, 1,
-0.839276, -1.745468, -2.172019, 0.9019608, 1, 0, 1,
-0.8392697, -0.118545, -2.626634, 0.8941177, 1, 0, 1,
-0.834887, 0.9833472, -0.4227017, 0.8901961, 1, 0, 1,
-0.8325889, 1.82821, 0.7300947, 0.8823529, 1, 0, 1,
-0.8320979, 1.22249, -0.6264197, 0.8784314, 1, 0, 1,
-0.8267436, 0.8342566, -1.383841, 0.8705882, 1, 0, 1,
-0.8249111, 3.077212, 0.4670984, 0.8666667, 1, 0, 1,
-0.8191494, -0.559068, -3.891915, 0.8588235, 1, 0, 1,
-0.8112387, 0.03842831, -1.217054, 0.854902, 1, 0, 1,
-0.8083984, -0.4161636, -3.164146, 0.8470588, 1, 0, 1,
-0.8055838, -0.7206187, -2.467934, 0.8431373, 1, 0, 1,
-0.8027034, 0.4896701, -1.757908, 0.8352941, 1, 0, 1,
-0.8017868, 2.023562, 0.2797809, 0.8313726, 1, 0, 1,
-0.7915296, -0.2452499, -2.632009, 0.8235294, 1, 0, 1,
-0.7883463, -0.03082488, -2.401102, 0.8196079, 1, 0, 1,
-0.7848828, 0.553598, -1.835587, 0.8117647, 1, 0, 1,
-0.7826914, -0.7508492, -2.723536, 0.8078431, 1, 0, 1,
-0.7816969, 0.3644959, -0.9792082, 0.8, 1, 0, 1,
-0.7807531, 0.5524403, -2.148904, 0.7921569, 1, 0, 1,
-0.7791529, 0.7121335, -0.2736016, 0.7882353, 1, 0, 1,
-0.7784761, 0.8970513, 1.149002, 0.7803922, 1, 0, 1,
-0.7763951, 2.912452, 0.2942995, 0.7764706, 1, 0, 1,
-0.7739193, 0.02186307, -1.414837, 0.7686275, 1, 0, 1,
-0.7703457, -0.0118425, -0.9879922, 0.7647059, 1, 0, 1,
-0.7690781, 0.2279657, -2.803134, 0.7568628, 1, 0, 1,
-0.7659198, 0.2732733, 1.124161, 0.7529412, 1, 0, 1,
-0.7618828, -0.6310101, -1.423477, 0.7450981, 1, 0, 1,
-0.7579817, 0.4172657, 0.1751745, 0.7411765, 1, 0, 1,
-0.7526071, -1.146381, -1.767518, 0.7333333, 1, 0, 1,
-0.7520325, 3.270283, -0.5891852, 0.7294118, 1, 0, 1,
-0.7486336, 1.353372, 0.821699, 0.7215686, 1, 0, 1,
-0.7479069, 0.04605314, -1.532427, 0.7176471, 1, 0, 1,
-0.7460225, -0.3545315, -2.443827, 0.7098039, 1, 0, 1,
-0.7454303, 0.9685529, -1.682769, 0.7058824, 1, 0, 1,
-0.7250072, -0.3002107, -2.301242, 0.6980392, 1, 0, 1,
-0.7243935, -0.2820413, -1.556167, 0.6901961, 1, 0, 1,
-0.722582, 0.4161767, -1.463748, 0.6862745, 1, 0, 1,
-0.7192616, -0.5773838, -2.114304, 0.6784314, 1, 0, 1,
-0.7185258, -0.6362332, -1.300097, 0.6745098, 1, 0, 1,
-0.7154298, 1.313882, 0.687855, 0.6666667, 1, 0, 1,
-0.7142965, 0.01702832, -0.483, 0.6627451, 1, 0, 1,
-0.7069644, -0.8762822, -1.336458, 0.654902, 1, 0, 1,
-0.70573, -0.337029, -3.643416, 0.6509804, 1, 0, 1,
-0.6981477, 1.44108, -0.9059864, 0.6431373, 1, 0, 1,
-0.6973958, 0.3007486, -0.7367726, 0.6392157, 1, 0, 1,
-0.6932676, 1.44316, -1.806548, 0.6313726, 1, 0, 1,
-0.691949, -1.923727, -2.81501, 0.627451, 1, 0, 1,
-0.6913986, -0.6428321, -2.349335, 0.6196079, 1, 0, 1,
-0.6867355, 1.421334, -1.320769, 0.6156863, 1, 0, 1,
-0.6811128, 0.7007201, -0.5420439, 0.6078432, 1, 0, 1,
-0.6799852, 0.5826309, -0.3735013, 0.6039216, 1, 0, 1,
-0.6782327, 0.2887154, -0.3961666, 0.5960785, 1, 0, 1,
-0.6766504, 1.404912, -1.44937, 0.5882353, 1, 0, 1,
-0.673578, -1.340642, -1.220963, 0.5843138, 1, 0, 1,
-0.6721938, 1.292052, -0.5209152, 0.5764706, 1, 0, 1,
-0.6708449, -1.624732, -0.9317943, 0.572549, 1, 0, 1,
-0.6700321, 0.4450981, 0.2578304, 0.5647059, 1, 0, 1,
-0.6696184, 0.4831814, -2.496295, 0.5607843, 1, 0, 1,
-0.6674659, 0.7928714, -0.2075734, 0.5529412, 1, 0, 1,
-0.6656034, 0.6205395, -1.01283, 0.5490196, 1, 0, 1,
-0.6642846, -2.774907, -2.558663, 0.5411765, 1, 0, 1,
-0.6633627, -0.4625942, -1.491738, 0.5372549, 1, 0, 1,
-0.662459, -0.8342267, -2.017401, 0.5294118, 1, 0, 1,
-0.6571957, 0.7621081, -0.3354379, 0.5254902, 1, 0, 1,
-0.6551161, 0.9057696, 0.4187891, 0.5176471, 1, 0, 1,
-0.6527062, 0.5748653, -0.3179254, 0.5137255, 1, 0, 1,
-0.652194, 0.1825647, -1.956532, 0.5058824, 1, 0, 1,
-0.6424029, -0.5041686, -1.794939, 0.5019608, 1, 0, 1,
-0.6409597, -0.1004911, -2.733397, 0.4941176, 1, 0, 1,
-0.639254, 0.08583812, -2.396046, 0.4862745, 1, 0, 1,
-0.6325752, -0.713943, -4.013548, 0.4823529, 1, 0, 1,
-0.6314744, 1.149868, -1.665464, 0.4745098, 1, 0, 1,
-0.6279118, -2.658926, -4.328996, 0.4705882, 1, 0, 1,
-0.6264432, 0.1891699, 0.221861, 0.4627451, 1, 0, 1,
-0.6204522, 1.823125, 0.7218618, 0.4588235, 1, 0, 1,
-0.6198488, -0.7629557, -2.735731, 0.4509804, 1, 0, 1,
-0.6101773, 0.7544275, -0.8524175, 0.4470588, 1, 0, 1,
-0.6084899, 0.4121376, -1.662768, 0.4392157, 1, 0, 1,
-0.6071651, -1.590072, -4.139926, 0.4352941, 1, 0, 1,
-0.6059515, 0.2682742, -0.07212593, 0.427451, 1, 0, 1,
-0.6034709, -0.8310384, -2.387546, 0.4235294, 1, 0, 1,
-0.6007065, -0.6468917, -2.786533, 0.4156863, 1, 0, 1,
-0.5997666, 0.8940485, 0.523822, 0.4117647, 1, 0, 1,
-0.5964129, -1.706774, -1.8468, 0.4039216, 1, 0, 1,
-0.5959803, 1.786094, 1.106413, 0.3960784, 1, 0, 1,
-0.5944546, 0.1272452, -2.15378, 0.3921569, 1, 0, 1,
-0.5935304, 0.3903161, -1.062818, 0.3843137, 1, 0, 1,
-0.5929559, 0.5081146, -2.27659, 0.3803922, 1, 0, 1,
-0.5929037, 0.3143643, -0.664629, 0.372549, 1, 0, 1,
-0.5925776, -0.3353142, -2.611509, 0.3686275, 1, 0, 1,
-0.5907915, -0.2841644, 0.295652, 0.3607843, 1, 0, 1,
-0.5780228, -0.1501711, -0.08663912, 0.3568628, 1, 0, 1,
-0.5775154, 1.628622, -0.1068071, 0.3490196, 1, 0, 1,
-0.5727431, -0.5781702, -1.699291, 0.345098, 1, 0, 1,
-0.5726249, 1.318315, -0.4880826, 0.3372549, 1, 0, 1,
-0.569178, 1.352062, -2.293604, 0.3333333, 1, 0, 1,
-0.5689205, 0.868671, -1.197502, 0.3254902, 1, 0, 1,
-0.5670979, 0.3548174, -1.317552, 0.3215686, 1, 0, 1,
-0.5653595, -0.5720717, -3.70736, 0.3137255, 1, 0, 1,
-0.5641713, 0.3958867, -2.121551, 0.3098039, 1, 0, 1,
-0.5632001, -0.4604465, -2.792235, 0.3019608, 1, 0, 1,
-0.5578442, -0.273832, -2.164789, 0.2941177, 1, 0, 1,
-0.5463344, -0.1138869, -0.3052386, 0.2901961, 1, 0, 1,
-0.5439948, -0.2958575, -3.306472, 0.282353, 1, 0, 1,
-0.5411525, -0.7463443, -0.8616149, 0.2784314, 1, 0, 1,
-0.5392705, 0.322037, -3.090341, 0.2705882, 1, 0, 1,
-0.5355417, 1.054478, -1.530496, 0.2666667, 1, 0, 1,
-0.5330254, -0.5252857, -1.250135, 0.2588235, 1, 0, 1,
-0.5278342, -0.1651935, -2.33911, 0.254902, 1, 0, 1,
-0.5275487, 1.008022, -1.335851, 0.2470588, 1, 0, 1,
-0.527539, -1.049301, -3.161873, 0.2431373, 1, 0, 1,
-0.5254507, -1.164137, -4.520268, 0.2352941, 1, 0, 1,
-0.5252104, -0.6643161, -2.022721, 0.2313726, 1, 0, 1,
-0.5234947, 1.361131, -2.335567, 0.2235294, 1, 0, 1,
-0.5232478, -0.06583575, -1.259791, 0.2196078, 1, 0, 1,
-0.5207846, 0.9197193, -2.029279, 0.2117647, 1, 0, 1,
-0.5189818, -3.192394, -3.12634, 0.2078431, 1, 0, 1,
-0.5118019, -0.1123419, 0.1670052, 0.2, 1, 0, 1,
-0.5060834, 1.060966, -0.5725842, 0.1921569, 1, 0, 1,
-0.5010649, -1.357283, -3.033802, 0.1882353, 1, 0, 1,
-0.4993505, 0.7731918, -0.7512515, 0.1803922, 1, 0, 1,
-0.4987698, 0.5112775, -1.945895, 0.1764706, 1, 0, 1,
-0.496133, -0.07089908, -1.429532, 0.1686275, 1, 0, 1,
-0.495434, -0.4965884, -1.121977, 0.1647059, 1, 0, 1,
-0.4942314, 0.7454604, 1.010839, 0.1568628, 1, 0, 1,
-0.491519, -0.3694998, -3.27304, 0.1529412, 1, 0, 1,
-0.4906953, -1.027887, -2.706508, 0.145098, 1, 0, 1,
-0.4879711, -0.5215917, -1.65585, 0.1411765, 1, 0, 1,
-0.4831407, 0.6159502, -1.879439, 0.1333333, 1, 0, 1,
-0.4821984, 0.2887339, -3.305007, 0.1294118, 1, 0, 1,
-0.4811358, -0.1051692, -2.152107, 0.1215686, 1, 0, 1,
-0.4755051, -2.33844, -2.235497, 0.1176471, 1, 0, 1,
-0.4751806, -1.394809, -1.011658, 0.1098039, 1, 0, 1,
-0.4730956, -0.818805, -4.52486, 0.1058824, 1, 0, 1,
-0.4667782, 0.2661382, -1.433437, 0.09803922, 1, 0, 1,
-0.4661559, -1.003193, -2.426866, 0.09019608, 1, 0, 1,
-0.4570155, -0.07110462, -2.370664, 0.08627451, 1, 0, 1,
-0.4557438, -0.9367654, -2.980409, 0.07843138, 1, 0, 1,
-0.4540921, -0.1628781, -2.585476, 0.07450981, 1, 0, 1,
-0.4533973, 0.0250477, -1.132542, 0.06666667, 1, 0, 1,
-0.4533234, -0.6474686, -3.365557, 0.0627451, 1, 0, 1,
-0.4532788, -1.426978, -2.046701, 0.05490196, 1, 0, 1,
-0.449978, -2.241937, -4.283179, 0.05098039, 1, 0, 1,
-0.4485396, 0.4382957, -0.1240638, 0.04313726, 1, 0, 1,
-0.4469121, -1.291793, -3.065111, 0.03921569, 1, 0, 1,
-0.4395711, 0.4573578, -2.17857, 0.03137255, 1, 0, 1,
-0.4394598, 0.5871001, 0.5009931, 0.02745098, 1, 0, 1,
-0.4379369, 0.4245328, -1.812218, 0.01960784, 1, 0, 1,
-0.4334061, 1.304499, 0.2563182, 0.01568628, 1, 0, 1,
-0.4332415, 0.1707946, -1.574625, 0.007843138, 1, 0, 1,
-0.4273711, 0.7014636, -0.7370757, 0.003921569, 1, 0, 1,
-0.4252622, 0.8193625, -1.252289, 0, 1, 0.003921569, 1,
-0.4242511, -0.7394853, -2.196025, 0, 1, 0.01176471, 1,
-0.4220035, 0.004775725, -1.879772, 0, 1, 0.01568628, 1,
-0.4184462, -0.3080276, -2.407693, 0, 1, 0.02352941, 1,
-0.4143954, 0.1304457, -2.287279, 0, 1, 0.02745098, 1,
-0.4141349, 2.204102, -0.5042171, 0, 1, 0.03529412, 1,
-0.411689, -1.855227, -2.949375, 0, 1, 0.03921569, 1,
-0.410861, -0.4235445, -2.74321, 0, 1, 0.04705882, 1,
-0.4103206, 1.914515, 1.17197, 0, 1, 0.05098039, 1,
-0.4080591, 1.665774, 0.7378106, 0, 1, 0.05882353, 1,
-0.4075407, -0.8527426, -1.437305, 0, 1, 0.0627451, 1,
-0.4057777, 0.1384705, -0.5076587, 0, 1, 0.07058824, 1,
-0.3983474, -0.8319235, -2.691411, 0, 1, 0.07450981, 1,
-0.3983358, 0.3843242, -0.1256294, 0, 1, 0.08235294, 1,
-0.3977054, -0.6921434, -0.06172473, 0, 1, 0.08627451, 1,
-0.3972413, 0.03899694, -1.422421, 0, 1, 0.09411765, 1,
-0.3967624, 0.4484049, -0.2413315, 0, 1, 0.1019608, 1,
-0.3889081, -1.452854, -1.6625, 0, 1, 0.1058824, 1,
-0.3834355, -0.5498833, -0.8689829, 0, 1, 0.1137255, 1,
-0.371861, -0.6747224, -1.691362, 0, 1, 0.1176471, 1,
-0.3705819, 0.9126454, -2.726675, 0, 1, 0.1254902, 1,
-0.3688425, 1.920554, 0.2896311, 0, 1, 0.1294118, 1,
-0.3674463, 0.04604378, -0.008525935, 0, 1, 0.1372549, 1,
-0.3661064, 2.322791, -1.347597, 0, 1, 0.1411765, 1,
-0.3627096, 1.130157, -1.30928, 0, 1, 0.1490196, 1,
-0.3622521, -0.6332889, -2.879713, 0, 1, 0.1529412, 1,
-0.3594435, -0.9866369, -1.806082, 0, 1, 0.1607843, 1,
-0.3582115, 0.3339619, -0.5528755, 0, 1, 0.1647059, 1,
-0.3544752, -0.1207287, -1.885476, 0, 1, 0.172549, 1,
-0.354278, 0.387377, -1.573517, 0, 1, 0.1764706, 1,
-0.3542506, 0.09401421, -0.9146491, 0, 1, 0.1843137, 1,
-0.344294, -0.4836765, -2.174799, 0, 1, 0.1882353, 1,
-0.340526, 0.2200477, -0.7196336, 0, 1, 0.1960784, 1,
-0.3372855, 0.9172864, 0.3056631, 0, 1, 0.2039216, 1,
-0.3347476, -1.177838, -3.41174, 0, 1, 0.2078431, 1,
-0.3332663, -0.5868849, -2.052655, 0, 1, 0.2156863, 1,
-0.3309599, -0.4068106, -3.643035, 0, 1, 0.2196078, 1,
-0.328622, 0.7055629, -1.642247, 0, 1, 0.227451, 1,
-0.32274, -1.465836, -3.667344, 0, 1, 0.2313726, 1,
-0.3201561, 0.9606494, -1.136376, 0, 1, 0.2392157, 1,
-0.3133996, -0.6411744, -3.025754, 0, 1, 0.2431373, 1,
-0.3129159, -0.851011, -2.349556, 0, 1, 0.2509804, 1,
-0.3102028, -0.09077143, -3.851191, 0, 1, 0.254902, 1,
-0.3093896, 0.03016183, -2.769903, 0, 1, 0.2627451, 1,
-0.3093188, -0.4555514, -2.730564, 0, 1, 0.2666667, 1,
-0.3063163, 1.773893, 1.157817, 0, 1, 0.2745098, 1,
-0.3029075, 0.9260389, 0.630492, 0, 1, 0.2784314, 1,
-0.2967526, -0.7329534, -3.929221, 0, 1, 0.2862745, 1,
-0.2929624, 1.011035, 1.591605, 0, 1, 0.2901961, 1,
-0.2916224, -0.4817979, -3.352068, 0, 1, 0.2980392, 1,
-0.2847798, -2.35535, -2.49697, 0, 1, 0.3058824, 1,
-0.2834415, 0.8126885, 1.042712, 0, 1, 0.3098039, 1,
-0.2824186, -1.896945, -2.781241, 0, 1, 0.3176471, 1,
-0.2815356, 0.4251456, -0.9260002, 0, 1, 0.3215686, 1,
-0.2803023, 1.665758, 2.613271, 0, 1, 0.3294118, 1,
-0.278957, -0.04807208, -2.367692, 0, 1, 0.3333333, 1,
-0.2775239, -0.7865101, -2.592889, 0, 1, 0.3411765, 1,
-0.2773128, -0.4227895, -1.947717, 0, 1, 0.345098, 1,
-0.2665736, 0.1585062, 0.1166587, 0, 1, 0.3529412, 1,
-0.2647306, -2.641422, -3.070122, 0, 1, 0.3568628, 1,
-0.2591176, 0.01868613, -0.5323146, 0, 1, 0.3647059, 1,
-0.2585518, -0.7778887, -4.049542, 0, 1, 0.3686275, 1,
-0.2576859, 0.01954972, 0.2538427, 0, 1, 0.3764706, 1,
-0.2571824, -1.696514, -1.265418, 0, 1, 0.3803922, 1,
-0.2547165, 0.9785321, -1.84276, 0, 1, 0.3882353, 1,
-0.2512629, -0.07428744, -2.512385, 0, 1, 0.3921569, 1,
-0.2431937, -0.3129649, 0.0927131, 0, 1, 0.4, 1,
-0.2420077, -0.02860694, -1.154344, 0, 1, 0.4078431, 1,
-0.2419472, -0.9092206, -3.492652, 0, 1, 0.4117647, 1,
-0.2417434, -0.6235579, -2.568144, 0, 1, 0.4196078, 1,
-0.239708, 2.434965, 1.246839, 0, 1, 0.4235294, 1,
-0.2336507, 0.1864922, -2.365338, 0, 1, 0.4313726, 1,
-0.2320019, -0.9294478, -2.22494, 0, 1, 0.4352941, 1,
-0.2316511, 0.4993891, -0.9570464, 0, 1, 0.4431373, 1,
-0.2289243, 0.3442078, -0.6792846, 0, 1, 0.4470588, 1,
-0.2285062, -0.1232239, -5.208172, 0, 1, 0.454902, 1,
-0.2266449, 0.7298342, 0.1364596, 0, 1, 0.4588235, 1,
-0.2247153, -1.450964, -1.623134, 0, 1, 0.4666667, 1,
-0.2087894, -0.5615156, -1.426467, 0, 1, 0.4705882, 1,
-0.2084304, -1.384627, -4.813251, 0, 1, 0.4784314, 1,
-0.2082778, 0.2297841, -1.060112, 0, 1, 0.4823529, 1,
-0.2081158, 1.717706, 0.1881692, 0, 1, 0.4901961, 1,
-0.204538, -0.3291149, -2.343501, 0, 1, 0.4941176, 1,
-0.1986091, -0.9078634, -2.862717, 0, 1, 0.5019608, 1,
-0.198009, 0.9161528, 0.7847078, 0, 1, 0.509804, 1,
-0.1977612, 0.8085435, -0.1226586, 0, 1, 0.5137255, 1,
-0.1974592, 0.2319732, -1.191893, 0, 1, 0.5215687, 1,
-0.1950971, 0.2472429, -2.559463, 0, 1, 0.5254902, 1,
-0.1916216, 1.109521, 0.6933854, 0, 1, 0.5333334, 1,
-0.1908036, 1.107616, 0.5738845, 0, 1, 0.5372549, 1,
-0.1905862, -0.2987107, -3.060616, 0, 1, 0.5450981, 1,
-0.188798, -1.103523, -2.12364, 0, 1, 0.5490196, 1,
-0.1882968, 1.100682, 1.095346, 0, 1, 0.5568628, 1,
-0.1803912, -0.1418154, -2.56285, 0, 1, 0.5607843, 1,
-0.1778119, -0.6124089, -4.16706, 0, 1, 0.5686275, 1,
-0.1757917, 1.184824, -0.08537549, 0, 1, 0.572549, 1,
-0.1756503, -0.5378501, -2.716334, 0, 1, 0.5803922, 1,
-0.1740341, 0.1669811, -0.984454, 0, 1, 0.5843138, 1,
-0.1686825, 0.04480713, -0.3949128, 0, 1, 0.5921569, 1,
-0.1642069, 1.534815, 1.584314, 0, 1, 0.5960785, 1,
-0.1621865, -0.1413693, -2.655323, 0, 1, 0.6039216, 1,
-0.1611819, -0.8430997, -3.932266, 0, 1, 0.6117647, 1,
-0.1572698, 0.5424396, -0.7430753, 0, 1, 0.6156863, 1,
-0.1542618, -0.03186798, -3.142469, 0, 1, 0.6235294, 1,
-0.150275, 1.977942, 1.270561, 0, 1, 0.627451, 1,
-0.1485363, 0.3608467, 0.1940981, 0, 1, 0.6352941, 1,
-0.142142, 0.8260352, -0.2866335, 0, 1, 0.6392157, 1,
-0.1420401, -2.014867, -3.234329, 0, 1, 0.6470588, 1,
-0.1326762, 1.080724, 0.6355202, 0, 1, 0.6509804, 1,
-0.1275938, -0.3219159, -1.124618, 0, 1, 0.6588235, 1,
-0.125542, -1.325982, -3.827085, 0, 1, 0.6627451, 1,
-0.1214279, -2.092164, -3.156648, 0, 1, 0.6705883, 1,
-0.120756, 1.276302, -0.1340565, 0, 1, 0.6745098, 1,
-0.1189267, -0.5719008, -3.06298, 0, 1, 0.682353, 1,
-0.1188353, -0.9877148, -1.210085, 0, 1, 0.6862745, 1,
-0.1121757, -0.2070116, -0.9461023, 0, 1, 0.6941177, 1,
-0.1097639, -1.546519, -4.915964, 0, 1, 0.7019608, 1,
-0.1088915, -0.5620786, -5.11144, 0, 1, 0.7058824, 1,
-0.1078071, 0.4071609, -0.8986008, 0, 1, 0.7137255, 1,
-0.1059196, 0.5107773, -1.126912, 0, 1, 0.7176471, 1,
-0.1025646, -1.04081, -3.277701, 0, 1, 0.7254902, 1,
-0.0962686, 1.136445, -0.3267761, 0, 1, 0.7294118, 1,
-0.09435619, 0.4293748, -0.7946699, 0, 1, 0.7372549, 1,
-0.09318042, 1.587157, -1.586913, 0, 1, 0.7411765, 1,
-0.0850981, 0.1659102, 0.4772068, 0, 1, 0.7490196, 1,
-0.07871747, -0.2060728, -1.269071, 0, 1, 0.7529412, 1,
-0.07769327, -0.3786703, -2.302522, 0, 1, 0.7607843, 1,
-0.07471553, 0.2360598, 0.6240604, 0, 1, 0.7647059, 1,
-0.06918842, -0.7522323, -2.381228, 0, 1, 0.772549, 1,
-0.06879415, 0.005998635, -2.265863, 0, 1, 0.7764706, 1,
-0.0682722, 1.196323, -1.178494, 0, 1, 0.7843137, 1,
-0.06736702, 0.3751692, -2.345525, 0, 1, 0.7882353, 1,
-0.0657033, 1.541148, 0.2143173, 0, 1, 0.7960784, 1,
-0.06150565, -0.2939713, -3.057689, 0, 1, 0.8039216, 1,
-0.05412153, 0.9288418, -0.0938126, 0, 1, 0.8078431, 1,
-0.05224365, 1.01009, -2.254363, 0, 1, 0.8156863, 1,
-0.05173651, -0.5369392, -3.373882, 0, 1, 0.8196079, 1,
-0.0514317, -1.182007, -4.410933, 0, 1, 0.827451, 1,
-0.05061027, -0.1556344, -3.618418, 0, 1, 0.8313726, 1,
-0.04490434, 1.336558, 0.736264, 0, 1, 0.8392157, 1,
-0.04318886, -0.3582999, -3.456666, 0, 1, 0.8431373, 1,
-0.04209028, 1.05534, 0.113298, 0, 1, 0.8509804, 1,
-0.04074907, -0.9551948, -2.609349, 0, 1, 0.854902, 1,
-0.0402957, -1.519494, -4.554916, 0, 1, 0.8627451, 1,
-0.03641043, 1.41493, 1.777412, 0, 1, 0.8666667, 1,
-0.03448506, -0.1809376, -4.451621, 0, 1, 0.8745098, 1,
-0.03127178, 0.902186, -0.6699966, 0, 1, 0.8784314, 1,
-0.02642669, -0.9246621, -4.171288, 0, 1, 0.8862745, 1,
-0.02394383, -0.6427563, -3.548326, 0, 1, 0.8901961, 1,
-0.02049704, -0.4684379, -3.770346, 0, 1, 0.8980392, 1,
-0.01852874, 0.07893033, -0.6754511, 0, 1, 0.9058824, 1,
-0.0163309, -1.389029, -2.821268, 0, 1, 0.9098039, 1,
-0.01298777, 1.336148, 2.099201, 0, 1, 0.9176471, 1,
-0.01292516, 0.5413339, 0.5680955, 0, 1, 0.9215686, 1,
-0.005368453, 0.701682, 0.6407695, 0, 1, 0.9294118, 1,
9.688148e-05, -1.550132, 2.797336, 0, 1, 0.9333333, 1,
0.0002739044, -1.48449, 3.085523, 0, 1, 0.9411765, 1,
0.001372328, 0.311973, 0.7513511, 0, 1, 0.945098, 1,
0.007257175, 1.329095, 0.222428, 0, 1, 0.9529412, 1,
0.01061813, -1.891425, 4.340725, 0, 1, 0.9568627, 1,
0.01553111, 0.8654791, -0.3158864, 0, 1, 0.9647059, 1,
0.01858602, 0.6076226, -0.9257042, 0, 1, 0.9686275, 1,
0.01976896, -0.3902558, 3.439452, 0, 1, 0.9764706, 1,
0.02233003, -0.1829091, 2.649421, 0, 1, 0.9803922, 1,
0.02263005, -0.118708, 2.346376, 0, 1, 0.9882353, 1,
0.02270072, -2.771115, 2.690938, 0, 1, 0.9921569, 1,
0.02357963, -0.926945, 1.390918, 0, 1, 1, 1,
0.02590696, 1.767484, -0.01326739, 0, 0.9921569, 1, 1,
0.02893782, -0.1564057, 3.270795, 0, 0.9882353, 1, 1,
0.04083605, -1.501012, 2.148884, 0, 0.9803922, 1, 1,
0.04223154, -0.1232073, 3.303899, 0, 0.9764706, 1, 1,
0.04563036, -0.1681283, 3.020861, 0, 0.9686275, 1, 1,
0.04591966, -1.693369, 2.763493, 0, 0.9647059, 1, 1,
0.04807073, -1.808018, 3.494144, 0, 0.9568627, 1, 1,
0.05265066, -0.5722923, 4.710553, 0, 0.9529412, 1, 1,
0.05349231, 0.02406044, 2.525035, 0, 0.945098, 1, 1,
0.05489646, -0.8558714, 2.870248, 0, 0.9411765, 1, 1,
0.05844815, 0.1495233, 0.359387, 0, 0.9333333, 1, 1,
0.0609538, -0.3443351, 3.058636, 0, 0.9294118, 1, 1,
0.06208251, -0.8434178, 3.647677, 0, 0.9215686, 1, 1,
0.06337371, 0.260394, -0.3858948, 0, 0.9176471, 1, 1,
0.06785315, 1.389142, -0.8323137, 0, 0.9098039, 1, 1,
0.06882249, 0.5772998, -0.4650859, 0, 0.9058824, 1, 1,
0.07153853, -0.5342461, 2.076202, 0, 0.8980392, 1, 1,
0.07317416, 0.3946014, -0.5169466, 0, 0.8901961, 1, 1,
0.07544837, 1.721578, 1.62353, 0, 0.8862745, 1, 1,
0.07557208, -0.1567898, 1.86051, 0, 0.8784314, 1, 1,
0.07588203, -0.8783678, 3.146923, 0, 0.8745098, 1, 1,
0.07677711, 0.2172871, 1.128751, 0, 0.8666667, 1, 1,
0.07697063, -0.3476904, 3.70048, 0, 0.8627451, 1, 1,
0.0801704, -0.4931564, 2.873098, 0, 0.854902, 1, 1,
0.0821259, 0.4698318, 2.045189, 0, 0.8509804, 1, 1,
0.08283728, 1.476812, 0.1295743, 0, 0.8431373, 1, 1,
0.08339588, 1.230379, 1.920791, 0, 0.8392157, 1, 1,
0.08347974, -2.030204, 2.159614, 0, 0.8313726, 1, 1,
0.08390719, -0.6749063, 3.273451, 0, 0.827451, 1, 1,
0.08625922, -1.533184, 3.073063, 0, 0.8196079, 1, 1,
0.08758494, -0.6149528, 2.290836, 0, 0.8156863, 1, 1,
0.08768815, -0.03431642, -1.901536, 0, 0.8078431, 1, 1,
0.08890364, 1.886473, 0.554738, 0, 0.8039216, 1, 1,
0.09422653, 0.101, 2.628805, 0, 0.7960784, 1, 1,
0.0946219, 0.5036934, 0.373209, 0, 0.7882353, 1, 1,
0.0958124, -1.504491, 3.170669, 0, 0.7843137, 1, 1,
0.09663505, 0.5943956, -0.7300417, 0, 0.7764706, 1, 1,
0.09863323, -1.81901, 1.852496, 0, 0.772549, 1, 1,
0.09898446, 0.01557134, -0.6182553, 0, 0.7647059, 1, 1,
0.1036928, -0.3506185, 1.696287, 0, 0.7607843, 1, 1,
0.104999, -0.2094956, 3.275596, 0, 0.7529412, 1, 1,
0.1092748, -1.432999, 2.308703, 0, 0.7490196, 1, 1,
0.1104443, -1.007455, 4.079775, 0, 0.7411765, 1, 1,
0.1106854, -0.522522, 1.633874, 0, 0.7372549, 1, 1,
0.1109156, 0.1280815, 2.269084, 0, 0.7294118, 1, 1,
0.1121048, 0.712864, 0.5454169, 0, 0.7254902, 1, 1,
0.1144442, -1.307841, 4.57427, 0, 0.7176471, 1, 1,
0.117487, -0.1303927, 1.696858, 0, 0.7137255, 1, 1,
0.118123, 0.8189546, 0.8316635, 0, 0.7058824, 1, 1,
0.1198325, -0.8708651, 0.4791489, 0, 0.6980392, 1, 1,
0.1214865, 1.597562, -0.1311058, 0, 0.6941177, 1, 1,
0.1279886, 1.30317, -0.2733777, 0, 0.6862745, 1, 1,
0.1327012, -1.336375, 4.208166, 0, 0.682353, 1, 1,
0.1333095, 0.9865311, -0.2049814, 0, 0.6745098, 1, 1,
0.1334825, 0.08454884, 0.5537377, 0, 0.6705883, 1, 1,
0.1353708, 0.526605, -0.9455221, 0, 0.6627451, 1, 1,
0.1383602, 1.310525, -0.8049007, 0, 0.6588235, 1, 1,
0.1419909, -0.7603662, 2.995525, 0, 0.6509804, 1, 1,
0.1423785, -0.7307335, 2.127401, 0, 0.6470588, 1, 1,
0.1430989, -0.3157701, 1.436655, 0, 0.6392157, 1, 1,
0.1437786, -1.156427, 1.558329, 0, 0.6352941, 1, 1,
0.1539191, 1.220889, 0.7155164, 0, 0.627451, 1, 1,
0.1550851, 0.8635532, 1.023084, 0, 0.6235294, 1, 1,
0.1570462, -0.3433339, 1.730743, 0, 0.6156863, 1, 1,
0.1598159, -0.02072678, 4.125185, 0, 0.6117647, 1, 1,
0.1651411, 0.3019394, 1.862332, 0, 0.6039216, 1, 1,
0.1674202, -1.365924, 4.886927, 0, 0.5960785, 1, 1,
0.1686179, -0.03780076, 2.116535, 0, 0.5921569, 1, 1,
0.169919, 1.971452, -0.7441867, 0, 0.5843138, 1, 1,
0.170648, -0.2231705, 2.492697, 0, 0.5803922, 1, 1,
0.1723575, 0.2025894, 0.3527832, 0, 0.572549, 1, 1,
0.173213, -0.6358951, 1.66681, 0, 0.5686275, 1, 1,
0.1770623, 1.08616, 0.3879013, 0, 0.5607843, 1, 1,
0.177613, -0.8559159, 3.374184, 0, 0.5568628, 1, 1,
0.1784722, 0.5951805, 1.306257, 0, 0.5490196, 1, 1,
0.1786527, 0.1832214, 0.9420147, 0, 0.5450981, 1, 1,
0.1792474, 0.008303447, 3.113417, 0, 0.5372549, 1, 1,
0.1800854, 0.3259614, -0.370356, 0, 0.5333334, 1, 1,
0.1853466, -0.0005802711, 3.315295, 0, 0.5254902, 1, 1,
0.1863195, 0.05568832, 2.163413, 0, 0.5215687, 1, 1,
0.1870584, 0.9030699, 0.3783678, 0, 0.5137255, 1, 1,
0.1917946, 0.8830143, -1.26453, 0, 0.509804, 1, 1,
0.1927595, 0.3821935, 2.17478, 0, 0.5019608, 1, 1,
0.1933568, -0.7396835, 2.579733, 0, 0.4941176, 1, 1,
0.1935134, 2.312036, -1.946544, 0, 0.4901961, 1, 1,
0.1981143, -1.305799, 4.749427, 0, 0.4823529, 1, 1,
0.2002737, 1.204016, 0.007024556, 0, 0.4784314, 1, 1,
0.2027349, 0.10756, -0.7216663, 0, 0.4705882, 1, 1,
0.2045655, 0.2210096, 1.455943, 0, 0.4666667, 1, 1,
0.2049557, -0.1863881, 3.809034, 0, 0.4588235, 1, 1,
0.2077927, 0.01591805, 1.226347, 0, 0.454902, 1, 1,
0.2083689, 1.593076, 0.03337893, 0, 0.4470588, 1, 1,
0.2099891, 0.3074383, 0.07050076, 0, 0.4431373, 1, 1,
0.2113681, -0.03219817, 1.966703, 0, 0.4352941, 1, 1,
0.2150606, -1.995951, 1.607262, 0, 0.4313726, 1, 1,
0.2234061, 1.091599, 0.1465282, 0, 0.4235294, 1, 1,
0.2240564, 0.2406785, 0.4234787, 0, 0.4196078, 1, 1,
0.2273903, -0.6871119, 3.686026, 0, 0.4117647, 1, 1,
0.2307769, -0.9463027, 3.048164, 0, 0.4078431, 1, 1,
0.2332775, 2.909987, -0.2801352, 0, 0.4, 1, 1,
0.2359529, -0.7355753, 2.151769, 0, 0.3921569, 1, 1,
0.2372541, 1.154461, -0.8264047, 0, 0.3882353, 1, 1,
0.2409418, 0.5324598, -0.04467473, 0, 0.3803922, 1, 1,
0.2420251, 0.4229074, 0.9440734, 0, 0.3764706, 1, 1,
0.2446913, 0.2253142, 1.380243, 0, 0.3686275, 1, 1,
0.2450568, 1.193111, 0.3566191, 0, 0.3647059, 1, 1,
0.2467463, 0.5043187, 0.3639352, 0, 0.3568628, 1, 1,
0.2558445, 1.410532, -0.2015847, 0, 0.3529412, 1, 1,
0.256752, 0.1776299, 1.306541, 0, 0.345098, 1, 1,
0.2571858, -1.311019, 2.853765, 0, 0.3411765, 1, 1,
0.2604622, 1.486825, -1.38747, 0, 0.3333333, 1, 1,
0.262236, 0.4473537, 0.1562663, 0, 0.3294118, 1, 1,
0.2629153, -0.4838618, 3.836896, 0, 0.3215686, 1, 1,
0.2648912, 1.449158, 2.45946, 0, 0.3176471, 1, 1,
0.2656489, 0.216925, -0.6000329, 0, 0.3098039, 1, 1,
0.271822, -0.4309403, 3.717095, 0, 0.3058824, 1, 1,
0.2719924, 1.681233, -0.4114795, 0, 0.2980392, 1, 1,
0.2736649, 0.06193238, 2.743504, 0, 0.2901961, 1, 1,
0.2778939, 0.6726854, -1.461219, 0, 0.2862745, 1, 1,
0.2781233, -2.31759, 2.000153, 0, 0.2784314, 1, 1,
0.2832196, -0.8537738, 2.676869, 0, 0.2745098, 1, 1,
0.283588, -2.020648, 2.856168, 0, 0.2666667, 1, 1,
0.2857217, -1.417248, 1.312419, 0, 0.2627451, 1, 1,
0.2868757, 0.3438213, 0.6240139, 0, 0.254902, 1, 1,
0.2924457, -0.9813449, 2.389376, 0, 0.2509804, 1, 1,
0.2991896, 0.3598004, 0.0288409, 0, 0.2431373, 1, 1,
0.3089554, 1.885161, 0.2717032, 0, 0.2392157, 1, 1,
0.3116172, -0.2754157, 2.540655, 0, 0.2313726, 1, 1,
0.3166434, 1.647757, 0.8656266, 0, 0.227451, 1, 1,
0.317254, -1.306888, 2.874617, 0, 0.2196078, 1, 1,
0.3224919, 0.6010324, -1.31795, 0, 0.2156863, 1, 1,
0.3245071, 0.7874503, 2.202328, 0, 0.2078431, 1, 1,
0.3261794, 2.388798, -0.3131696, 0, 0.2039216, 1, 1,
0.3283439, -1.177834, 3.785594, 0, 0.1960784, 1, 1,
0.3305973, 1.286099, -0.3639278, 0, 0.1882353, 1, 1,
0.3318535, -0.865479, 2.566517, 0, 0.1843137, 1, 1,
0.335849, 0.3072418, 0.8736951, 0, 0.1764706, 1, 1,
0.3403403, -0.9334773, 4.011938, 0, 0.172549, 1, 1,
0.3406098, -1.00737, 4.530154, 0, 0.1647059, 1, 1,
0.3457248, -0.2379022, 2.136356, 0, 0.1607843, 1, 1,
0.3498755, -1.25105, 2.452463, 0, 0.1529412, 1, 1,
0.3568753, -0.7390357, 2.458674, 0, 0.1490196, 1, 1,
0.3575156, 0.5813099, 0.5566894, 0, 0.1411765, 1, 1,
0.3587081, 0.614633, 0.2328708, 0, 0.1372549, 1, 1,
0.366584, 0.2142743, 1.625335, 0, 0.1294118, 1, 1,
0.3674027, -0.4555868, 3.632282, 0, 0.1254902, 1, 1,
0.3685706, 1.339521, 1.265895, 0, 0.1176471, 1, 1,
0.3769004, -1.39248, 3.109321, 0, 0.1137255, 1, 1,
0.3839077, 0.234522, 1.087792, 0, 0.1058824, 1, 1,
0.3884014, -0.1383524, -0.532463, 0, 0.09803922, 1, 1,
0.3899377, 0.7064876, 0.01209283, 0, 0.09411765, 1, 1,
0.3910592, -1.954981, 3.390591, 0, 0.08627451, 1, 1,
0.3967389, 0.3922122, -0.4581343, 0, 0.08235294, 1, 1,
0.3998972, -0.6116595, 2.239897, 0, 0.07450981, 1, 1,
0.407547, 0.4262302, 0.6407273, 0, 0.07058824, 1, 1,
0.4097791, 0.05812592, 3.099336, 0, 0.0627451, 1, 1,
0.4101603, -1.237666, 1.899766, 0, 0.05882353, 1, 1,
0.4107183, -0.2993143, 3.439599, 0, 0.05098039, 1, 1,
0.4149775, -0.0923607, 1.847947, 0, 0.04705882, 1, 1,
0.4169578, 1.036267, -0.7253392, 0, 0.03921569, 1, 1,
0.4224059, 0.2584626, 0.3671534, 0, 0.03529412, 1, 1,
0.424615, -1.474608, 3.165983, 0, 0.02745098, 1, 1,
0.4279002, -0.2939692, 2.59716, 0, 0.02352941, 1, 1,
0.429724, 0.3205611, 1.789939, 0, 0.01568628, 1, 1,
0.434307, -1.093081, 4.402063, 0, 0.01176471, 1, 1,
0.4366289, 1.329314, -0.7619263, 0, 0.003921569, 1, 1,
0.4390658, 0.6276478, 1.25771, 0.003921569, 0, 1, 1,
0.4559528, -0.8040127, 2.20841, 0.007843138, 0, 1, 1,
0.4574345, -0.2496567, 3.32301, 0.01568628, 0, 1, 1,
0.4590026, 0.3373157, 1.669868, 0.01960784, 0, 1, 1,
0.4594188, 1.463588, 1.109113, 0.02745098, 0, 1, 1,
0.4604244, -1.516182, 1.504869, 0.03137255, 0, 1, 1,
0.4648939, 1.468943, 1.816696, 0.03921569, 0, 1, 1,
0.4654565, -0.5964071, 1.361306, 0.04313726, 0, 1, 1,
0.4675829, -0.6835196, 1.705656, 0.05098039, 0, 1, 1,
0.4679489, -0.2140228, 2.70576, 0.05490196, 0, 1, 1,
0.4694015, 0.6228921, 2.473457, 0.0627451, 0, 1, 1,
0.4706101, -0.5695865, 2.28301, 0.06666667, 0, 1, 1,
0.4707958, 0.8428056, 2.086481, 0.07450981, 0, 1, 1,
0.4735705, 1.209489, 2.041024, 0.07843138, 0, 1, 1,
0.475446, -0.69196, 2.308267, 0.08627451, 0, 1, 1,
0.4773581, -0.4306206, 2.347754, 0.09019608, 0, 1, 1,
0.4782355, -1.779815, 3.720288, 0.09803922, 0, 1, 1,
0.4895578, -0.3184735, 2.407619, 0.1058824, 0, 1, 1,
0.4913535, -0.3937072, 3.068729, 0.1098039, 0, 1, 1,
0.4925562, 1.087034, -0.5379592, 0.1176471, 0, 1, 1,
0.4943132, 0.1124579, 1.667093, 0.1215686, 0, 1, 1,
0.4962279, 1.755893, 3.105306, 0.1294118, 0, 1, 1,
0.5012761, -0.6280967, 3.271369, 0.1333333, 0, 1, 1,
0.5023359, -0.03341714, 1.78839, 0.1411765, 0, 1, 1,
0.5036421, -0.7138076, 1.66388, 0.145098, 0, 1, 1,
0.5045547, -0.5081077, 2.173612, 0.1529412, 0, 1, 1,
0.505896, -0.3532749, 2.850899, 0.1568628, 0, 1, 1,
0.5127239, 0.4441156, 0.9484985, 0.1647059, 0, 1, 1,
0.513576, -0.7793915, 2.103396, 0.1686275, 0, 1, 1,
0.5141074, 1.808755, 1.210826, 0.1764706, 0, 1, 1,
0.5172663, 2.1597, -1.073911, 0.1803922, 0, 1, 1,
0.5200686, 1.44373, -0.5029866, 0.1882353, 0, 1, 1,
0.5214863, 0.7955512, 0.7207519, 0.1921569, 0, 1, 1,
0.5257627, 0.1158683, 2.495494, 0.2, 0, 1, 1,
0.5267885, 1.025953, 0.4210251, 0.2078431, 0, 1, 1,
0.5294913, 1.900029, 0.3589076, 0.2117647, 0, 1, 1,
0.5302277, -0.4529957, 2.48828, 0.2196078, 0, 1, 1,
0.5311631, 0.4812292, 0.2312396, 0.2235294, 0, 1, 1,
0.5380288, 1.293635, 1.382125, 0.2313726, 0, 1, 1,
0.5381413, -1.056931, 2.417073, 0.2352941, 0, 1, 1,
0.5439446, 0.7846241, 2.678165, 0.2431373, 0, 1, 1,
0.5442432, 0.9699525, 3.30816, 0.2470588, 0, 1, 1,
0.5499554, -0.6053694, 1.577185, 0.254902, 0, 1, 1,
0.5503695, 1.472855, -0.07173451, 0.2588235, 0, 1, 1,
0.5509442, 0.4159318, 2.891288, 0.2666667, 0, 1, 1,
0.5575451, -2.076675, 3.097235, 0.2705882, 0, 1, 1,
0.5649187, 1.33469, 0.1260631, 0.2784314, 0, 1, 1,
0.5670939, 0.2438606, 2.440681, 0.282353, 0, 1, 1,
0.5672377, 1.404389, 0.9846955, 0.2901961, 0, 1, 1,
0.5852144, 0.2752769, 1.398724, 0.2941177, 0, 1, 1,
0.5863999, -1.781915, 2.642396, 0.3019608, 0, 1, 1,
0.5868179, 0.4078771, 1.434911, 0.3098039, 0, 1, 1,
0.5936704, 0.2154002, -0.9403605, 0.3137255, 0, 1, 1,
0.594662, 2.030273, -0.2396071, 0.3215686, 0, 1, 1,
0.5948419, -0.5082724, 2.137952, 0.3254902, 0, 1, 1,
0.5949746, 0.5979682, -0.5137972, 0.3333333, 0, 1, 1,
0.5950727, -0.001894544, 2.494359, 0.3372549, 0, 1, 1,
0.5960934, 0.1339663, 0.257256, 0.345098, 0, 1, 1,
0.5969569, -0.749485, 1.733414, 0.3490196, 0, 1, 1,
0.5971645, 0.655081, 1.129561, 0.3568628, 0, 1, 1,
0.5972255, 0.1705173, 2.720324, 0.3607843, 0, 1, 1,
0.6039034, 1.091929, 0.4191359, 0.3686275, 0, 1, 1,
0.609375, 0.7578329, -0.7221512, 0.372549, 0, 1, 1,
0.6100053, -0.6500345, 1.596952, 0.3803922, 0, 1, 1,
0.6107094, -0.8593851, 0.558103, 0.3843137, 0, 1, 1,
0.6137536, 1.221646, 0.8182485, 0.3921569, 0, 1, 1,
0.6173089, 1.177057, 0.3739292, 0.3960784, 0, 1, 1,
0.620115, 1.819358, -0.1887747, 0.4039216, 0, 1, 1,
0.6246754, 0.2585492, -0.2442154, 0.4117647, 0, 1, 1,
0.6304299, -1.363347, 3.066239, 0.4156863, 0, 1, 1,
0.6329545, 0.1850497, 0.5951006, 0.4235294, 0, 1, 1,
0.6385407, 0.9332501, -0.6012869, 0.427451, 0, 1, 1,
0.6441328, -0.711974, 0.6899382, 0.4352941, 0, 1, 1,
0.6458814, 0.7051613, -0.1573813, 0.4392157, 0, 1, 1,
0.6600239, 0.1543601, 1.443739, 0.4470588, 0, 1, 1,
0.6610535, -0.921445, 4.937308, 0.4509804, 0, 1, 1,
0.6703694, 0.2786584, 1.70228, 0.4588235, 0, 1, 1,
0.6729299, 0.04053584, 1.281078, 0.4627451, 0, 1, 1,
0.6739236, 1.180392, -0.03323532, 0.4705882, 0, 1, 1,
0.6892103, -0.3331305, 4.389093, 0.4745098, 0, 1, 1,
0.6904008, 1.355852, 1.502754, 0.4823529, 0, 1, 1,
0.6928242, 0.2131399, 0.2323689, 0.4862745, 0, 1, 1,
0.7000154, -1.206992, 1.949654, 0.4941176, 0, 1, 1,
0.7035444, -0.6241789, 2.776293, 0.5019608, 0, 1, 1,
0.705427, -0.1998152, 2.261634, 0.5058824, 0, 1, 1,
0.7065732, 0.1639323, 1.375264, 0.5137255, 0, 1, 1,
0.7133011, 2.606448, -0.3923711, 0.5176471, 0, 1, 1,
0.7145526, 1.456804, 0.9641163, 0.5254902, 0, 1, 1,
0.7178013, 0.7454819, 1.727778, 0.5294118, 0, 1, 1,
0.7193419, -0.7512755, 3.403005, 0.5372549, 0, 1, 1,
0.7194397, -2.733477, 2.822562, 0.5411765, 0, 1, 1,
0.7216726, -0.516158, 2.847583, 0.5490196, 0, 1, 1,
0.7229122, -1.234664, 2.411228, 0.5529412, 0, 1, 1,
0.7237227, -0.2767242, 2.701689, 0.5607843, 0, 1, 1,
0.7439523, -1.070956, 3.003321, 0.5647059, 0, 1, 1,
0.7443264, -1.023248, 0.8078361, 0.572549, 0, 1, 1,
0.744849, -0.5002125, 0.7604185, 0.5764706, 0, 1, 1,
0.7482228, 0.1084514, 1.975858, 0.5843138, 0, 1, 1,
0.7524025, -0.3617302, 2.52773, 0.5882353, 0, 1, 1,
0.7570992, -1.500195, 2.627874, 0.5960785, 0, 1, 1,
0.7591737, -0.6123258, 2.668061, 0.6039216, 0, 1, 1,
0.761422, -1.648337, 0.8813304, 0.6078432, 0, 1, 1,
0.7634347, 0.5062475, 1.370878, 0.6156863, 0, 1, 1,
0.773587, -0.1415434, 1.250354, 0.6196079, 0, 1, 1,
0.7744263, 0.9634977, 0.9858119, 0.627451, 0, 1, 1,
0.7837386, -0.2045901, 1.47411, 0.6313726, 0, 1, 1,
0.7839217, -2.040992, 2.72658, 0.6392157, 0, 1, 1,
0.7864653, -0.8599917, 3.091381, 0.6431373, 0, 1, 1,
0.7914509, 0.02607442, 1.423051, 0.6509804, 0, 1, 1,
0.7918923, 0.3403991, 1.408462, 0.654902, 0, 1, 1,
0.794504, 1.017811, 1.542618, 0.6627451, 0, 1, 1,
0.8057186, -0.7693557, 1.532295, 0.6666667, 0, 1, 1,
0.8078388, 1.66177, 0.5003055, 0.6745098, 0, 1, 1,
0.8078644, 1.524042, -0.1985866, 0.6784314, 0, 1, 1,
0.8100269, 0.797117, 1.672298, 0.6862745, 0, 1, 1,
0.8125519, -0.4101887, 1.115399, 0.6901961, 0, 1, 1,
0.8128572, 1.005636, 1.904433, 0.6980392, 0, 1, 1,
0.826065, 1.982865, 0.1374031, 0.7058824, 0, 1, 1,
0.833388, -0.3646058, 3.484181, 0.7098039, 0, 1, 1,
0.8487001, -1.819272, 3.088176, 0.7176471, 0, 1, 1,
0.8557115, -0.7198783, 3.235242, 0.7215686, 0, 1, 1,
0.8599698, 0.1918284, 1.730424, 0.7294118, 0, 1, 1,
0.8655521, 0.2205344, 0.8329678, 0.7333333, 0, 1, 1,
0.8673833, -1.708186, 4.065869, 0.7411765, 0, 1, 1,
0.8696703, -1.69415, 0.4561879, 0.7450981, 0, 1, 1,
0.8736028, -1.222321, 2.144571, 0.7529412, 0, 1, 1,
0.8754201, 0.6112811, 1.398143, 0.7568628, 0, 1, 1,
0.8758034, 0.7988981, 0.8583868, 0.7647059, 0, 1, 1,
0.8809569, 0.2248692, 1.256223, 0.7686275, 0, 1, 1,
0.8945684, -0.7514479, 1.821449, 0.7764706, 0, 1, 1,
0.8981829, 1.764586, -0.524632, 0.7803922, 0, 1, 1,
0.9034833, -0.03803047, 1.061148, 0.7882353, 0, 1, 1,
0.9071988, -0.01741599, 0.7646831, 0.7921569, 0, 1, 1,
0.9108722, 0.9080296, -0.1133686, 0.8, 0, 1, 1,
0.9158466, 0.8394867, 1.67349, 0.8078431, 0, 1, 1,
0.9207883, -0.03022742, 0.448048, 0.8117647, 0, 1, 1,
0.9210116, -1.197087, 2.365386, 0.8196079, 0, 1, 1,
0.922671, 0.2758335, 1.49977, 0.8235294, 0, 1, 1,
0.9237797, -0.357699, 1.474501, 0.8313726, 0, 1, 1,
0.9369364, -0.03081968, 3.257867, 0.8352941, 0, 1, 1,
0.9404256, -1.962513, 2.778246, 0.8431373, 0, 1, 1,
0.9451618, -0.9870214, 2.162226, 0.8470588, 0, 1, 1,
0.9493345, -1.242388, 2.536124, 0.854902, 0, 1, 1,
0.9494596, 0.114073, 3.850029, 0.8588235, 0, 1, 1,
0.9517286, 0.4761886, -0.7327937, 0.8666667, 0, 1, 1,
0.9544854, 0.3899655, 1.54878, 0.8705882, 0, 1, 1,
0.959707, -2.476636, 1.479443, 0.8784314, 0, 1, 1,
0.9605084, -0.2995656, 3.453285, 0.8823529, 0, 1, 1,
0.9633397, 1.192004, 0.2543362, 0.8901961, 0, 1, 1,
0.9663447, -1.871384, 2.839532, 0.8941177, 0, 1, 1,
0.9663632, 0.6441715, 1.854977, 0.9019608, 0, 1, 1,
0.9784898, -1.90901, 2.800227, 0.9098039, 0, 1, 1,
0.9856475, -1.302616, 3.824948, 0.9137255, 0, 1, 1,
0.98569, 0.6091079, -1.023335, 0.9215686, 0, 1, 1,
0.9926286, 1.093179, 0.3683005, 0.9254902, 0, 1, 1,
0.9969344, -0.400908, 1.203894, 0.9333333, 0, 1, 1,
0.9986742, -1.283913, 1.466742, 0.9372549, 0, 1, 1,
1.004361, -1.511871, 1.472538, 0.945098, 0, 1, 1,
1.006155, -0.7235833, 0.6502773, 0.9490196, 0, 1, 1,
1.008722, -1.541585, 2.807039, 0.9568627, 0, 1, 1,
1.00951, -1.358542, 2.852484, 0.9607843, 0, 1, 1,
1.014274, -1.631354, 3.699963, 0.9686275, 0, 1, 1,
1.014841, -2.061043, 2.013223, 0.972549, 0, 1, 1,
1.02117, 1.602368, 0.4408712, 0.9803922, 0, 1, 1,
1.026657, 0.01618634, 2.465589, 0.9843137, 0, 1, 1,
1.029429, 1.574735, 1.988913, 0.9921569, 0, 1, 1,
1.033312, 0.1087963, 1.584818, 0.9960784, 0, 1, 1,
1.040689, 0.7821143, 1.130524, 1, 0, 0.9960784, 1,
1.044297, 0.1831174, 2.447543, 1, 0, 0.9882353, 1,
1.051945, 0.9835084, 1.884355, 1, 0, 0.9843137, 1,
1.052404, 1.174334, 2.489715, 1, 0, 0.9764706, 1,
1.052898, 0.8458515, -0.2479517, 1, 0, 0.972549, 1,
1.053536, -0.6764776, 1.384151, 1, 0, 0.9647059, 1,
1.054901, -0.8297421, 5.125992, 1, 0, 0.9607843, 1,
1.067396, 0.3970132, -0.2378146, 1, 0, 0.9529412, 1,
1.072189, 1.629591, 2.925245, 1, 0, 0.9490196, 1,
1.075728, 0.4091906, 0.2445553, 1, 0, 0.9411765, 1,
1.078042, 0.8297803, 2.268741, 1, 0, 0.9372549, 1,
1.080953, 1.025644, 0.707638, 1, 0, 0.9294118, 1,
1.087129, 0.07392059, 3.269481, 1, 0, 0.9254902, 1,
1.087734, -0.4261012, 1.191579, 1, 0, 0.9176471, 1,
1.088979, 1.189081, -0.4690465, 1, 0, 0.9137255, 1,
1.091414, 0.1970331, -0.7815825, 1, 0, 0.9058824, 1,
1.095971, 0.1784317, 1.133791, 1, 0, 0.9019608, 1,
1.117909, -2.766227, 3.093001, 1, 0, 0.8941177, 1,
1.140411, 0.2057959, 3.978641, 1, 0, 0.8862745, 1,
1.143729, 0.4319674, -0.8659462, 1, 0, 0.8823529, 1,
1.152746, -2.736016, 3.16739, 1, 0, 0.8745098, 1,
1.156033, 0.1454151, 1.399464, 1, 0, 0.8705882, 1,
1.176532, -0.5574805, 1.751338, 1, 0, 0.8627451, 1,
1.182143, -0.8092169, 2.349333, 1, 0, 0.8588235, 1,
1.191479, 0.358167, 1.628118, 1, 0, 0.8509804, 1,
1.193072, 0.2173764, 1.357671, 1, 0, 0.8470588, 1,
1.194681, -0.9597998, 0.9168366, 1, 0, 0.8392157, 1,
1.199059, 0.5068922, 0.3372106, 1, 0, 0.8352941, 1,
1.200824, -0.04222228, 2.063776, 1, 0, 0.827451, 1,
1.202291, -0.009723295, 0.02415115, 1, 0, 0.8235294, 1,
1.210806, 1.087192, 2.04133, 1, 0, 0.8156863, 1,
1.211124, -0.6357248, 1.209546, 1, 0, 0.8117647, 1,
1.212615, -0.7869442, 2.513737, 1, 0, 0.8039216, 1,
1.214897, -0.9607711, 4.123257, 1, 0, 0.7960784, 1,
1.217269, -0.0217735, 0.7701671, 1, 0, 0.7921569, 1,
1.227422, -0.1296447, 4.106189, 1, 0, 0.7843137, 1,
1.23337, 0.3054476, 0.6349674, 1, 0, 0.7803922, 1,
1.236742, 0.7607277, 2.694787, 1, 0, 0.772549, 1,
1.242709, 0.9178531, 2.932795, 1, 0, 0.7686275, 1,
1.244517, -0.4287405, 3.783038, 1, 0, 0.7607843, 1,
1.245969, -1.642683, 2.429898, 1, 0, 0.7568628, 1,
1.249122, 1.795341, 0.6730344, 1, 0, 0.7490196, 1,
1.251476, -1.451471, 3.509608, 1, 0, 0.7450981, 1,
1.25485, -0.5667719, 1.623178, 1, 0, 0.7372549, 1,
1.255828, 0.1217681, 1.163973, 1, 0, 0.7333333, 1,
1.256139, 0.04008, 0.5689601, 1, 0, 0.7254902, 1,
1.257613, -0.0314214, 3.547841, 1, 0, 0.7215686, 1,
1.257707, -1.381334, 2.090704, 1, 0, 0.7137255, 1,
1.267434, 0.3256624, 0.4013573, 1, 0, 0.7098039, 1,
1.271515, -1.802172, 2.763387, 1, 0, 0.7019608, 1,
1.276112, 0.2115023, 3.41392, 1, 0, 0.6941177, 1,
1.278985, 0.8948244, 2.104964, 1, 0, 0.6901961, 1,
1.280334, -0.1134595, 0.123576, 1, 0, 0.682353, 1,
1.287516, -0.893344, 2.726515, 1, 0, 0.6784314, 1,
1.296367, -0.329262, 2.202267, 1, 0, 0.6705883, 1,
1.304695, -1.255525, 2.787994, 1, 0, 0.6666667, 1,
1.307122, -1.549863, 2.462396, 1, 0, 0.6588235, 1,
1.309059, -0.9184669, 1.734758, 1, 0, 0.654902, 1,
1.310338, -0.8601574, 1.271443, 1, 0, 0.6470588, 1,
1.310879, 0.2714937, 1.14144, 1, 0, 0.6431373, 1,
1.324859, 0.3137534, 0.8620296, 1, 0, 0.6352941, 1,
1.331658, 1.231412, -0.3074872, 1, 0, 0.6313726, 1,
1.332179, 0.3210091, 1.926086, 1, 0, 0.6235294, 1,
1.347389, -0.2473415, 1.202197, 1, 0, 0.6196079, 1,
1.347989, -0.8849747, 2.21658, 1, 0, 0.6117647, 1,
1.349674, -0.3223027, 1.881205, 1, 0, 0.6078432, 1,
1.364613, 1.25566, 1.498506, 1, 0, 0.6, 1,
1.372062, 1.540271, 0.7928329, 1, 0, 0.5921569, 1,
1.382569, -0.1993279, 1.226429, 1, 0, 0.5882353, 1,
1.386343, -1.464702, 1.66912, 1, 0, 0.5803922, 1,
1.387636, 0.3043097, 1.362982, 1, 0, 0.5764706, 1,
1.402978, 0.6593884, 2.256863, 1, 0, 0.5686275, 1,
1.405925, -1.622978, 2.619078, 1, 0, 0.5647059, 1,
1.407206, 1.163592, 1.89836, 1, 0, 0.5568628, 1,
1.408203, -1.441911, 1.696254, 1, 0, 0.5529412, 1,
1.409412, -0.212147, 0.7493265, 1, 0, 0.5450981, 1,
1.417044, 0.5389038, 2.453139, 1, 0, 0.5411765, 1,
1.423171, -0.4024362, 2.845884, 1, 0, 0.5333334, 1,
1.423418, 0.8710544, 1.799421, 1, 0, 0.5294118, 1,
1.426565, 0.864022, 0.9605214, 1, 0, 0.5215687, 1,
1.428457, -0.9597194, 2.85446, 1, 0, 0.5176471, 1,
1.428679, -1.573647, 4.160386, 1, 0, 0.509804, 1,
1.443523, 0.6350565, 2.059671, 1, 0, 0.5058824, 1,
1.446759, -0.2362824, -0.2213454, 1, 0, 0.4980392, 1,
1.449704, 0.2301734, 1.504387, 1, 0, 0.4901961, 1,
1.455599, 1.287463, 1.484553, 1, 0, 0.4862745, 1,
1.457986, -0.7267017, 1.176571, 1, 0, 0.4784314, 1,
1.464014, 0.5601522, 1.682527, 1, 0, 0.4745098, 1,
1.468128, 0.1802701, -0.2508846, 1, 0, 0.4666667, 1,
1.468152, 1.044403, 1.323854, 1, 0, 0.4627451, 1,
1.480273, -0.2715472, 2.598001, 1, 0, 0.454902, 1,
1.491533, 0.02965433, 2.056783, 1, 0, 0.4509804, 1,
1.494702, -1.727161, 2.928137, 1, 0, 0.4431373, 1,
1.497057, -0.3488624, 2.230271, 1, 0, 0.4392157, 1,
1.504559, -0.8479695, 2.230438, 1, 0, 0.4313726, 1,
1.50624, 0.8825639, 1.017212, 1, 0, 0.427451, 1,
1.510384, -0.6648074, 2.474193, 1, 0, 0.4196078, 1,
1.521498, -0.5326899, 1.681921, 1, 0, 0.4156863, 1,
1.528135, 1.993508, 0.005262054, 1, 0, 0.4078431, 1,
1.532147, -0.2089788, 3.253619, 1, 0, 0.4039216, 1,
1.533767, 0.4682219, 2.502913, 1, 0, 0.3960784, 1,
1.545698, 1.531262, -0.4377331, 1, 0, 0.3882353, 1,
1.553009, 1.545831, 2.66425, 1, 0, 0.3843137, 1,
1.586515, 0.2285235, 2.70868, 1, 0, 0.3764706, 1,
1.587578, -0.8414961, 1.254837, 1, 0, 0.372549, 1,
1.592015, 0.9923703, 0.8393104, 1, 0, 0.3647059, 1,
1.598555, 0.8673097, 3.568257, 1, 0, 0.3607843, 1,
1.619727, 0.3693832, 2.174713, 1, 0, 0.3529412, 1,
1.626266, -1.024964, 1.999485, 1, 0, 0.3490196, 1,
1.627268, 0.009036713, 3.155208, 1, 0, 0.3411765, 1,
1.632117, 0.2092617, 0.9565116, 1, 0, 0.3372549, 1,
1.632239, -1.143334, 3.041227, 1, 0, 0.3294118, 1,
1.653506, 0.3519613, 1.736845, 1, 0, 0.3254902, 1,
1.663184, -2.113464, 3.3388, 1, 0, 0.3176471, 1,
1.664526, 0.1026133, 1.085734, 1, 0, 0.3137255, 1,
1.666937, -1.016434, 2.93286, 1, 0, 0.3058824, 1,
1.675665, 0.4980094, 1.689776, 1, 0, 0.2980392, 1,
1.688144, 0.5340807, 0.8139938, 1, 0, 0.2941177, 1,
1.689633, 0.7043908, 1.730212, 1, 0, 0.2862745, 1,
1.693806, 1.926532, 0.7968972, 1, 0, 0.282353, 1,
1.73139, 0.8541768, -1.563012, 1, 0, 0.2745098, 1,
1.7607, -0.1011574, 0.9852545, 1, 0, 0.2705882, 1,
1.762559, 0.3624685, -0.5851816, 1, 0, 0.2627451, 1,
1.800109, -0.6775877, 3.117451, 1, 0, 0.2588235, 1,
1.811153, -2.504324, 3.40638, 1, 0, 0.2509804, 1,
1.840805, 0.03512891, 1.356939, 1, 0, 0.2470588, 1,
1.861565, -0.4523829, 2.140268, 1, 0, 0.2392157, 1,
1.865266, -0.6648351, 1.315798, 1, 0, 0.2352941, 1,
1.876782, 0.09947471, 0.2276223, 1, 0, 0.227451, 1,
1.890244, -0.2106177, 1.646776, 1, 0, 0.2235294, 1,
1.892275, -0.3620211, 2.5131, 1, 0, 0.2156863, 1,
1.893163, 1.289636, -0.5406836, 1, 0, 0.2117647, 1,
1.897018, 0.1315485, 1.92265, 1, 0, 0.2039216, 1,
1.919629, 0.7667909, -1.30498, 1, 0, 0.1960784, 1,
1.936579, -0.462638, 2.877784, 1, 0, 0.1921569, 1,
1.939064, 0.4571961, 0.4998793, 1, 0, 0.1843137, 1,
1.960873, -0.3024947, 3.055264, 1, 0, 0.1803922, 1,
1.973578, 1.565056, 0.3363915, 1, 0, 0.172549, 1,
1.983573, -0.9546924, 3.08588, 1, 0, 0.1686275, 1,
1.988859, 0.6961377, 1.18061, 1, 0, 0.1607843, 1,
1.996371, -1.137673, 3.132158, 1, 0, 0.1568628, 1,
2.003141, -0.3196021, 0.4355582, 1, 0, 0.1490196, 1,
2.049742, -1.4288, 3.31553, 1, 0, 0.145098, 1,
2.116408, -1.027636, 1.677262, 1, 0, 0.1372549, 1,
2.133953, 1.196293, 1.333634, 1, 0, 0.1333333, 1,
2.167104, -0.01252321, 0.960013, 1, 0, 0.1254902, 1,
2.181771, -0.1581117, 1.935101, 1, 0, 0.1215686, 1,
2.182251, 0.1732495, 0.6652019, 1, 0, 0.1137255, 1,
2.212809, 2.192416, 1.48205, 1, 0, 0.1098039, 1,
2.217087, 1.245866, -0.4122264, 1, 0, 0.1019608, 1,
2.233674, -0.5672442, 2.326928, 1, 0, 0.09411765, 1,
2.255887, -0.2396016, 2.225946, 1, 0, 0.09019608, 1,
2.258953, -0.4530622, 0.9510352, 1, 0, 0.08235294, 1,
2.288667, -0.07347356, 4.24074, 1, 0, 0.07843138, 1,
2.299841, 0.9804245, -0.3581581, 1, 0, 0.07058824, 1,
2.363722, 1.604654, 1.168607, 1, 0, 0.06666667, 1,
2.468177, -0.02100863, 0.7718903, 1, 0, 0.05882353, 1,
2.473288, -0.5867472, 1.949353, 1, 0, 0.05490196, 1,
2.504287, 0.1406258, 1.244441, 1, 0, 0.04705882, 1,
2.625013, 0.4282607, 2.543204, 1, 0, 0.04313726, 1,
2.642314, 1.103421, 1.06927, 1, 0, 0.03529412, 1,
2.730257, -1.454157, 3.46993, 1, 0, 0.03137255, 1,
2.735838, 1.231309, 1.38542, 1, 0, 0.02352941, 1,
2.737855, 0.0243727, 0.7936357, 1, 0, 0.01960784, 1,
3.185977, 0.1395233, 1.108983, 1, 0, 0.01176471, 1,
3.761852, -0.1933833, 0.3227377, 1, 0, 0.007843138, 1
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
0.3019083, -4.287818, -6.959813, 0, -0.5, 0.5, 0.5,
0.3019083, -4.287818, -6.959813, 1, -0.5, 0.5, 0.5,
0.3019083, -4.287818, -6.959813, 1, 1.5, 0.5, 0.5,
0.3019083, -4.287818, -6.959813, 0, 1.5, 0.5, 0.5
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
-4.330956, 0.03894472, -6.959813, 0, -0.5, 0.5, 0.5,
-4.330956, 0.03894472, -6.959813, 1, -0.5, 0.5, 0.5,
-4.330956, 0.03894472, -6.959813, 1, 1.5, 0.5, 0.5,
-4.330956, 0.03894472, -6.959813, 0, 1.5, 0.5, 0.5
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
-4.330956, -4.287818, -0.04109025, 0, -0.5, 0.5, 0.5,
-4.330956, -4.287818, -0.04109025, 1, -0.5, 0.5, 0.5,
-4.330956, -4.287818, -0.04109025, 1, 1.5, 0.5, 0.5,
-4.330956, -4.287818, -0.04109025, 0, 1.5, 0.5, 0.5
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
-3, -3.289334, -5.363185,
3, -3.289334, -5.363185,
-3, -3.289334, -5.363185,
-3, -3.455748, -5.62929,
-2, -3.289334, -5.363185,
-2, -3.455748, -5.62929,
-1, -3.289334, -5.363185,
-1, -3.455748, -5.62929,
0, -3.289334, -5.363185,
0, -3.455748, -5.62929,
1, -3.289334, -5.363185,
1, -3.455748, -5.62929,
2, -3.289334, -5.363185,
2, -3.455748, -5.62929,
3, -3.289334, -5.363185,
3, -3.455748, -5.62929
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
-3, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
-3, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
-3, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
-3, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
-2, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
-2, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
-2, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
-2, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
-1, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
-1, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
-1, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
-1, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
0, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
0, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
0, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
0, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
1, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
1, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
1, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
1, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
2, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
2, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
2, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
2, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5,
3, -3.788576, -6.161499, 0, -0.5, 0.5, 0.5,
3, -3.788576, -6.161499, 1, -0.5, 0.5, 0.5,
3, -3.788576, -6.161499, 1, 1.5, 0.5, 0.5,
3, -3.788576, -6.161499, 0, 1.5, 0.5, 0.5
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
-3.261834, -3, -5.363185,
-3.261834, 3, -5.363185,
-3.261834, -3, -5.363185,
-3.440021, -3, -5.62929,
-3.261834, -2, -5.363185,
-3.440021, -2, -5.62929,
-3.261834, -1, -5.363185,
-3.440021, -1, -5.62929,
-3.261834, 0, -5.363185,
-3.440021, 0, -5.62929,
-3.261834, 1, -5.363185,
-3.440021, 1, -5.62929,
-3.261834, 2, -5.363185,
-3.440021, 2, -5.62929,
-3.261834, 3, -5.363185,
-3.440021, 3, -5.62929
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
-3.796395, -3, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, -3, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, -3, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, -3, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, -2, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, -2, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, -2, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, -2, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, -1, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, -1, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, -1, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, -1, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, 0, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, 0, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, 0, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, 0, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, 1, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, 1, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, 1, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, 1, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, 2, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, 2, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, 2, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, 2, -6.161499, 0, 1.5, 0.5, 0.5,
-3.796395, 3, -6.161499, 0, -0.5, 0.5, 0.5,
-3.796395, 3, -6.161499, 1, -0.5, 0.5, 0.5,
-3.796395, 3, -6.161499, 1, 1.5, 0.5, 0.5,
-3.796395, 3, -6.161499, 0, 1.5, 0.5, 0.5
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
-3.261834, -3.289334, -4,
-3.261834, -3.289334, 4,
-3.261834, -3.289334, -4,
-3.440021, -3.455748, -4,
-3.261834, -3.289334, -2,
-3.440021, -3.455748, -2,
-3.261834, -3.289334, 0,
-3.440021, -3.455748, 0,
-3.261834, -3.289334, 2,
-3.440021, -3.455748, 2,
-3.261834, -3.289334, 4,
-3.440021, -3.455748, 4
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
-3.796395, -3.788576, -4, 0, -0.5, 0.5, 0.5,
-3.796395, -3.788576, -4, 1, -0.5, 0.5, 0.5,
-3.796395, -3.788576, -4, 1, 1.5, 0.5, 0.5,
-3.796395, -3.788576, -4, 0, 1.5, 0.5, 0.5,
-3.796395, -3.788576, -2, 0, -0.5, 0.5, 0.5,
-3.796395, -3.788576, -2, 1, -0.5, 0.5, 0.5,
-3.796395, -3.788576, -2, 1, 1.5, 0.5, 0.5,
-3.796395, -3.788576, -2, 0, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 0, 0, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 0, 1, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 0, 1, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 0, 0, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 2, 0, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 2, 1, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 2, 1, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 2, 0, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 4, 0, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 4, 1, -0.5, 0.5, 0.5,
-3.796395, -3.788576, 4, 1, 1.5, 0.5, 0.5,
-3.796395, -3.788576, 4, 0, 1.5, 0.5, 0.5
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
-3.261834, -3.289334, -5.363185,
-3.261834, 3.367224, -5.363185,
-3.261834, -3.289334, 5.281004,
-3.261834, 3.367224, 5.281004,
-3.261834, -3.289334, -5.363185,
-3.261834, -3.289334, 5.281004,
-3.261834, 3.367224, -5.363185,
-3.261834, 3.367224, 5.281004,
-3.261834, -3.289334, -5.363185,
3.86565, -3.289334, -5.363185,
-3.261834, -3.289334, 5.281004,
3.86565, -3.289334, 5.281004,
-3.261834, 3.367224, -5.363185,
3.86565, 3.367224, -5.363185,
-3.261834, 3.367224, 5.281004,
3.86565, 3.367224, 5.281004,
3.86565, -3.289334, -5.363185,
3.86565, 3.367224, -5.363185,
3.86565, -3.289334, 5.281004,
3.86565, 3.367224, 5.281004,
3.86565, -3.289334, -5.363185,
3.86565, -3.289334, 5.281004,
3.86565, 3.367224, -5.363185,
3.86565, 3.367224, 5.281004
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
var radius = 7.708755;
var distance = 34.29712;
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
mvMatrix.translate( -0.3019083, -0.03894472, 0.04109025 );
mvMatrix.scale( 1.169397, 1.252127, 0.783043 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.29712);
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
cinosulfuron<-read.table("cinosulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cinosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'cinosulfuron' not found
```

```r
y<-cinosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'cinosulfuron' not found
```

```r
z<-cinosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'cinosulfuron' not found
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
-3.158035, 2.015659, -2.037025, 0, 0, 1, 1, 1,
-3.002558, 1.064611, -1.38571, 1, 0, 0, 1, 1,
-2.942387, 1.515454, -0.08217744, 1, 0, 0, 1, 1,
-2.711263, 0.05664687, -1.260259, 1, 0, 0, 1, 1,
-2.611624, -0.06153354, -0.4374619, 1, 0, 0, 1, 1,
-2.606271, 0.5554648, -0.2065852, 1, 0, 0, 1, 1,
-2.535631, 1.107753, 0.1308565, 0, 0, 0, 1, 1,
-2.373652, 0.4983731, -1.394339, 0, 0, 0, 1, 1,
-2.310876, -0.3030709, -0.282625, 0, 0, 0, 1, 1,
-2.286621, 0.7496276, -1.104492, 0, 0, 0, 1, 1,
-2.250282, 1.337495, -0.4100872, 0, 0, 0, 1, 1,
-2.222279, 1.164247, 0.3957012, 0, 0, 0, 1, 1,
-2.218722, -1.460695, -0.5363227, 0, 0, 0, 1, 1,
-2.116478, -0.07591914, 0.3386502, 1, 1, 1, 1, 1,
-2.104532, 0.5107048, -1.797526, 1, 1, 1, 1, 1,
-2.08581, 0.977591, -0.999885, 1, 1, 1, 1, 1,
-2.059376, 0.8240209, -0.7267814, 1, 1, 1, 1, 1,
-2.039695, -0.5657899, 0.9080231, 1, 1, 1, 1, 1,
-2.038959, 0.3175871, 0.5440196, 1, 1, 1, 1, 1,
-2.010977, 0.7483867, -2.782065, 1, 1, 1, 1, 1,
-1.950229, 0.2879525, -3.023368, 1, 1, 1, 1, 1,
-1.931335, -0.6937501, -1.2466, 1, 1, 1, 1, 1,
-1.927375, 0.7730596, -0.905184, 1, 1, 1, 1, 1,
-1.907911, -0.7937793, -1.624256, 1, 1, 1, 1, 1,
-1.890019, -1.314469, -4.547036, 1, 1, 1, 1, 1,
-1.887022, 0.3571818, -2.950386, 1, 1, 1, 1, 1,
-1.88701, 0.2352713, -0.005676362, 1, 1, 1, 1, 1,
-1.879399, -0.6515825, -1.45765, 1, 1, 1, 1, 1,
-1.86563, -2.440697, -3.229228, 0, 0, 1, 1, 1,
-1.810211, 0.624396, 0.5231375, 1, 0, 0, 1, 1,
-1.797918, 1.26724, -0.9437006, 1, 0, 0, 1, 1,
-1.787034, -1.733899, -1.946836, 1, 0, 0, 1, 1,
-1.759684, -0.6286722, -2.598921, 1, 0, 0, 1, 1,
-1.738808, -2.41429, -2.482842, 1, 0, 0, 1, 1,
-1.720954, -1.079082, -4.468462, 0, 0, 0, 1, 1,
-1.714145, 1.619491, -0.1495524, 0, 0, 0, 1, 1,
-1.710252, 0.7164935, -0.5752885, 0, 0, 0, 1, 1,
-1.62129, -0.6300403, -2.698815, 0, 0, 0, 1, 1,
-1.607437, 1.310156, -1.786153, 0, 0, 0, 1, 1,
-1.605591, -1.875341, -2.763777, 0, 0, 0, 1, 1,
-1.600329, -1.238454, -3.470771, 0, 0, 0, 1, 1,
-1.57787, 1.111484, -2.74626, 1, 1, 1, 1, 1,
-1.571143, -0.8344041, -1.793341, 1, 1, 1, 1, 1,
-1.552733, 0.4991207, -1.643417, 1, 1, 1, 1, 1,
-1.527779, -1.424536, -0.2766216, 1, 1, 1, 1, 1,
-1.526255, -0.6364259, -2.462665, 1, 1, 1, 1, 1,
-1.509019, 1.833633, -1.855267, 1, 1, 1, 1, 1,
-1.5046, -0.7064136, -2.55854, 1, 1, 1, 1, 1,
-1.489933, -0.7773417, -3.96314, 1, 1, 1, 1, 1,
-1.482718, -0.1558356, -2.083722, 1, 1, 1, 1, 1,
-1.481495, -1.521968, -5.038654, 1, 1, 1, 1, 1,
-1.477975, 0.4748726, -0.6930051, 1, 1, 1, 1, 1,
-1.473908, 0.9024764, -1.277555, 1, 1, 1, 1, 1,
-1.466295, 0.697106, -1.131348, 1, 1, 1, 1, 1,
-1.461742, -1.403444, -3.437246, 1, 1, 1, 1, 1,
-1.460767, 1.134191, -1.815924, 1, 1, 1, 1, 1,
-1.458095, 0.3663892, -0.8737814, 0, 0, 1, 1, 1,
-1.45789, 0.6623286, -1.065416, 1, 0, 0, 1, 1,
-1.45197, -1.763492, -3.249726, 1, 0, 0, 1, 1,
-1.448703, 1.118511, -1.186918, 1, 0, 0, 1, 1,
-1.434742, -0.06514333, -2.541337, 1, 0, 0, 1, 1,
-1.431896, -0.2056985, 0.03711764, 1, 0, 0, 1, 1,
-1.424257, -0.4792184, -1.226039, 0, 0, 0, 1, 1,
-1.422422, 0.4930465, -1.647671, 0, 0, 0, 1, 1,
-1.421941, 1.091566, -1.153549, 0, 0, 0, 1, 1,
-1.419337, 1.219649, -1.140618, 0, 0, 0, 1, 1,
-1.4187, 0.5118759, -2.97684, 0, 0, 0, 1, 1,
-1.41368, -0.9506526, -1.930624, 0, 0, 0, 1, 1,
-1.402255, -0.06584328, -3.91702, 0, 0, 0, 1, 1,
-1.395887, -0.308263, -2.473081, 1, 1, 1, 1, 1,
-1.393002, -2.150321, -3.259163, 1, 1, 1, 1, 1,
-1.388986, -0.2553596, -0.8795205, 1, 1, 1, 1, 1,
-1.388456, 1.726865, 0.3682614, 1, 1, 1, 1, 1,
-1.379683, -1.846961, -1.760714, 1, 1, 1, 1, 1,
-1.368223, -0.8711894, -1.344989, 1, 1, 1, 1, 1,
-1.363844, -1.395793, -2.040922, 1, 1, 1, 1, 1,
-1.35878, -0.03625426, -2.355827, 1, 1, 1, 1, 1,
-1.337981, -0.398126, -2.117791, 1, 1, 1, 1, 1,
-1.330607, -0.01422911, -0.9945664, 1, 1, 1, 1, 1,
-1.327489, -0.1608279, -0.5134228, 1, 1, 1, 1, 1,
-1.326905, 1.005543, -0.6258662, 1, 1, 1, 1, 1,
-1.321523, -1.126996, -1.88741, 1, 1, 1, 1, 1,
-1.307917, -0.5425025, -1.622072, 1, 1, 1, 1, 1,
-1.302819, -0.01827385, -2.094015, 1, 1, 1, 1, 1,
-1.299937, -0.4020154, -1.390654, 0, 0, 1, 1, 1,
-1.282182, -0.1458535, 0.6565648, 1, 0, 0, 1, 1,
-1.278358, -0.9121401, -0.1281234, 1, 0, 0, 1, 1,
-1.273949, -0.01533591, -1.759177, 1, 0, 0, 1, 1,
-1.260773, 0.271549, -3.213649, 1, 0, 0, 1, 1,
-1.248937, -1.787502, -2.435679, 1, 0, 0, 1, 1,
-1.243124, -0.7794249, -2.024315, 0, 0, 0, 1, 1,
-1.239929, 1.005229, -1.294635, 0, 0, 0, 1, 1,
-1.236965, -0.07450757, -0.7599733, 0, 0, 0, 1, 1,
-1.236603, -1.242851, -2.884894, 0, 0, 0, 1, 1,
-1.230273, 1.942526, 0.05044007, 0, 0, 0, 1, 1,
-1.22905, -1.139699, -1.52904, 0, 0, 0, 1, 1,
-1.220284, 0.634124, -0.7548557, 0, 0, 0, 1, 1,
-1.219094, -0.235158, -2.910784, 1, 1, 1, 1, 1,
-1.215485, 0.04079507, -0.9437176, 1, 1, 1, 1, 1,
-1.20375, -0.5785271, -1.987713, 1, 1, 1, 1, 1,
-1.203098, 0.2056108, -0.6492609, 1, 1, 1, 1, 1,
-1.20265, 0.6817527, -3.457934, 1, 1, 1, 1, 1,
-1.202437, 1.243927, -1.723307, 1, 1, 1, 1, 1,
-1.19868, 0.9301048, -0.5481073, 1, 1, 1, 1, 1,
-1.197071, 0.9023722, -0.1026599, 1, 1, 1, 1, 1,
-1.191054, 0.8486115, -0.6378772, 1, 1, 1, 1, 1,
-1.177428, 0.7436658, 0.3168968, 1, 1, 1, 1, 1,
-1.165697, 0.3352709, -0.658445, 1, 1, 1, 1, 1,
-1.161439, -0.7856196, -1.990638, 1, 1, 1, 1, 1,
-1.160584, 0.2967028, -2.228828, 1, 1, 1, 1, 1,
-1.154675, -0.4593548, -2.727239, 1, 1, 1, 1, 1,
-1.154069, -0.7160128, -1.347839, 1, 1, 1, 1, 1,
-1.153784, 0.8220865, -1.435914, 0, 0, 1, 1, 1,
-1.152319, -0.3509871, -0.5818231, 1, 0, 0, 1, 1,
-1.149301, 0.6926159, 0.6282386, 1, 0, 0, 1, 1,
-1.143152, 1.171001, -0.09188688, 1, 0, 0, 1, 1,
-1.143009, 0.4670875, -1.160114, 1, 0, 0, 1, 1,
-1.13345, -0.6674084, -1.719323, 1, 0, 0, 1, 1,
-1.130388, -0.08879817, -2.666132, 0, 0, 0, 1, 1,
-1.128931, 0.7299849, -1.291971, 0, 0, 0, 1, 1,
-1.128121, 2.118587, 1.422797, 0, 0, 0, 1, 1,
-1.126626, -1.083426, -2.489823, 0, 0, 0, 1, 1,
-1.123551, 0.1080109, -1.529911, 0, 0, 0, 1, 1,
-1.109338, -0.0650753, -1.321203, 0, 0, 0, 1, 1,
-1.098555, -0.5125149, -2.363855, 0, 0, 0, 1, 1,
-1.094599, -1.82775, -3.329073, 1, 1, 1, 1, 1,
-1.08965, 0.2363752, -1.948033, 1, 1, 1, 1, 1,
-1.072196, 0.1862516, -1.346987, 1, 1, 1, 1, 1,
-1.071471, -0.3332068, -2.099593, 1, 1, 1, 1, 1,
-1.062493, 2.117001, -0.3932908, 1, 1, 1, 1, 1,
-1.062268, 1.030411, 0.4324004, 1, 1, 1, 1, 1,
-1.054902, -0.1603787, -2.939518, 1, 1, 1, 1, 1,
-1.053128, -1.401357, -3.076383, 1, 1, 1, 1, 1,
-1.05171, -1.145951, -3.138484, 1, 1, 1, 1, 1,
-1.051638, -1.533711, -1.555589, 1, 1, 1, 1, 1,
-1.045482, -2.010386, -2.445158, 1, 1, 1, 1, 1,
-1.044319, -0.9988359, -2.622062, 1, 1, 1, 1, 1,
-1.039542, 0.8138705, -0.4653664, 1, 1, 1, 1, 1,
-1.038901, -0.702784, -2.005301, 1, 1, 1, 1, 1,
-1.025173, 0.2054741, -0.1805145, 1, 1, 1, 1, 1,
-1.02433, -0.800128, -2.935889, 0, 0, 1, 1, 1,
-1.017324, 0.05746051, -2.782651, 1, 0, 0, 1, 1,
-1.015617, -0.3999683, -2.117179, 1, 0, 0, 1, 1,
-1.005328, -1.371267, -1.22616, 1, 0, 0, 1, 1,
-1.004911, -1.028967, -1.118278, 1, 0, 0, 1, 1,
-1.000199, -0.8571388, -2.914277, 1, 0, 0, 1, 1,
-0.9869436, 1.038136, -1.347768, 0, 0, 0, 1, 1,
-0.9864701, 0.01189086, -0.6494402, 0, 0, 0, 1, 1,
-0.959869, -1.098394, -2.642375, 0, 0, 0, 1, 1,
-0.9517782, 0.1373934, -2.272085, 0, 0, 0, 1, 1,
-0.9512602, 0.6640835, -1.3306, 0, 0, 0, 1, 1,
-0.9471105, -0.332383, -1.430032, 0, 0, 0, 1, 1,
-0.9420068, -0.9056992, -3.277565, 0, 0, 0, 1, 1,
-0.9392219, 0.6826678, -1.642556, 1, 1, 1, 1, 1,
-0.9274762, -0.3619743, -0.7299259, 1, 1, 1, 1, 1,
-0.9175838, 1.323545, -1.617294, 1, 1, 1, 1, 1,
-0.9174535, -0.2433933, -2.124228, 1, 1, 1, 1, 1,
-0.9107105, 1.022357, -1.987127, 1, 1, 1, 1, 1,
-0.9026707, 1.688922, -2.576592, 1, 1, 1, 1, 1,
-0.8990624, -0.4279018, -2.29466, 1, 1, 1, 1, 1,
-0.8978239, -0.2444837, -1.213756, 1, 1, 1, 1, 1,
-0.894982, -0.1710807, -2.511483, 1, 1, 1, 1, 1,
-0.8943358, -1.384607, -2.015229, 1, 1, 1, 1, 1,
-0.89323, -0.09318248, -0.6248528, 1, 1, 1, 1, 1,
-0.8929803, 0.7344822, 0.1031619, 1, 1, 1, 1, 1,
-0.8927913, 0.7402083, 1.485557, 1, 1, 1, 1, 1,
-0.8906377, -0.6174217, -3.406321, 1, 1, 1, 1, 1,
-0.8885093, -1.879842, -3.280256, 1, 1, 1, 1, 1,
-0.8864939, -0.8951315, -2.934699, 0, 0, 1, 1, 1,
-0.883784, -0.1579188, -2.48483, 1, 0, 0, 1, 1,
-0.8826189, 0.3759587, -1.724357, 1, 0, 0, 1, 1,
-0.8798331, 0.384428, -1.743604, 1, 0, 0, 1, 1,
-0.8778903, -0.1541951, -1.840427, 1, 0, 0, 1, 1,
-0.8768939, 0.936074, 1.706693, 1, 0, 0, 1, 1,
-0.8757315, -1.209053, -1.305773, 0, 0, 0, 1, 1,
-0.8741506, -1.56138, -4.451298, 0, 0, 0, 1, 1,
-0.8727673, -0.6067414, -3.104063, 0, 0, 0, 1, 1,
-0.8703739, 0.8425606, -1.221862, 0, 0, 0, 1, 1,
-0.8664643, -0.836585, -1.552936, 0, 0, 0, 1, 1,
-0.857422, 0.7963404, -1.591797, 0, 0, 0, 1, 1,
-0.8560238, 0.664456, -2.278469, 0, 0, 0, 1, 1,
-0.8459607, -0.8272643, -1.99694, 1, 1, 1, 1, 1,
-0.8433067, 0.3682017, -0.4400592, 1, 1, 1, 1, 1,
-0.839276, -1.745468, -2.172019, 1, 1, 1, 1, 1,
-0.8392697, -0.118545, -2.626634, 1, 1, 1, 1, 1,
-0.834887, 0.9833472, -0.4227017, 1, 1, 1, 1, 1,
-0.8325889, 1.82821, 0.7300947, 1, 1, 1, 1, 1,
-0.8320979, 1.22249, -0.6264197, 1, 1, 1, 1, 1,
-0.8267436, 0.8342566, -1.383841, 1, 1, 1, 1, 1,
-0.8249111, 3.077212, 0.4670984, 1, 1, 1, 1, 1,
-0.8191494, -0.559068, -3.891915, 1, 1, 1, 1, 1,
-0.8112387, 0.03842831, -1.217054, 1, 1, 1, 1, 1,
-0.8083984, -0.4161636, -3.164146, 1, 1, 1, 1, 1,
-0.8055838, -0.7206187, -2.467934, 1, 1, 1, 1, 1,
-0.8027034, 0.4896701, -1.757908, 1, 1, 1, 1, 1,
-0.8017868, 2.023562, 0.2797809, 1, 1, 1, 1, 1,
-0.7915296, -0.2452499, -2.632009, 0, 0, 1, 1, 1,
-0.7883463, -0.03082488, -2.401102, 1, 0, 0, 1, 1,
-0.7848828, 0.553598, -1.835587, 1, 0, 0, 1, 1,
-0.7826914, -0.7508492, -2.723536, 1, 0, 0, 1, 1,
-0.7816969, 0.3644959, -0.9792082, 1, 0, 0, 1, 1,
-0.7807531, 0.5524403, -2.148904, 1, 0, 0, 1, 1,
-0.7791529, 0.7121335, -0.2736016, 0, 0, 0, 1, 1,
-0.7784761, 0.8970513, 1.149002, 0, 0, 0, 1, 1,
-0.7763951, 2.912452, 0.2942995, 0, 0, 0, 1, 1,
-0.7739193, 0.02186307, -1.414837, 0, 0, 0, 1, 1,
-0.7703457, -0.0118425, -0.9879922, 0, 0, 0, 1, 1,
-0.7690781, 0.2279657, -2.803134, 0, 0, 0, 1, 1,
-0.7659198, 0.2732733, 1.124161, 0, 0, 0, 1, 1,
-0.7618828, -0.6310101, -1.423477, 1, 1, 1, 1, 1,
-0.7579817, 0.4172657, 0.1751745, 1, 1, 1, 1, 1,
-0.7526071, -1.146381, -1.767518, 1, 1, 1, 1, 1,
-0.7520325, 3.270283, -0.5891852, 1, 1, 1, 1, 1,
-0.7486336, 1.353372, 0.821699, 1, 1, 1, 1, 1,
-0.7479069, 0.04605314, -1.532427, 1, 1, 1, 1, 1,
-0.7460225, -0.3545315, -2.443827, 1, 1, 1, 1, 1,
-0.7454303, 0.9685529, -1.682769, 1, 1, 1, 1, 1,
-0.7250072, -0.3002107, -2.301242, 1, 1, 1, 1, 1,
-0.7243935, -0.2820413, -1.556167, 1, 1, 1, 1, 1,
-0.722582, 0.4161767, -1.463748, 1, 1, 1, 1, 1,
-0.7192616, -0.5773838, -2.114304, 1, 1, 1, 1, 1,
-0.7185258, -0.6362332, -1.300097, 1, 1, 1, 1, 1,
-0.7154298, 1.313882, 0.687855, 1, 1, 1, 1, 1,
-0.7142965, 0.01702832, -0.483, 1, 1, 1, 1, 1,
-0.7069644, -0.8762822, -1.336458, 0, 0, 1, 1, 1,
-0.70573, -0.337029, -3.643416, 1, 0, 0, 1, 1,
-0.6981477, 1.44108, -0.9059864, 1, 0, 0, 1, 1,
-0.6973958, 0.3007486, -0.7367726, 1, 0, 0, 1, 1,
-0.6932676, 1.44316, -1.806548, 1, 0, 0, 1, 1,
-0.691949, -1.923727, -2.81501, 1, 0, 0, 1, 1,
-0.6913986, -0.6428321, -2.349335, 0, 0, 0, 1, 1,
-0.6867355, 1.421334, -1.320769, 0, 0, 0, 1, 1,
-0.6811128, 0.7007201, -0.5420439, 0, 0, 0, 1, 1,
-0.6799852, 0.5826309, -0.3735013, 0, 0, 0, 1, 1,
-0.6782327, 0.2887154, -0.3961666, 0, 0, 0, 1, 1,
-0.6766504, 1.404912, -1.44937, 0, 0, 0, 1, 1,
-0.673578, -1.340642, -1.220963, 0, 0, 0, 1, 1,
-0.6721938, 1.292052, -0.5209152, 1, 1, 1, 1, 1,
-0.6708449, -1.624732, -0.9317943, 1, 1, 1, 1, 1,
-0.6700321, 0.4450981, 0.2578304, 1, 1, 1, 1, 1,
-0.6696184, 0.4831814, -2.496295, 1, 1, 1, 1, 1,
-0.6674659, 0.7928714, -0.2075734, 1, 1, 1, 1, 1,
-0.6656034, 0.6205395, -1.01283, 1, 1, 1, 1, 1,
-0.6642846, -2.774907, -2.558663, 1, 1, 1, 1, 1,
-0.6633627, -0.4625942, -1.491738, 1, 1, 1, 1, 1,
-0.662459, -0.8342267, -2.017401, 1, 1, 1, 1, 1,
-0.6571957, 0.7621081, -0.3354379, 1, 1, 1, 1, 1,
-0.6551161, 0.9057696, 0.4187891, 1, 1, 1, 1, 1,
-0.6527062, 0.5748653, -0.3179254, 1, 1, 1, 1, 1,
-0.652194, 0.1825647, -1.956532, 1, 1, 1, 1, 1,
-0.6424029, -0.5041686, -1.794939, 1, 1, 1, 1, 1,
-0.6409597, -0.1004911, -2.733397, 1, 1, 1, 1, 1,
-0.639254, 0.08583812, -2.396046, 0, 0, 1, 1, 1,
-0.6325752, -0.713943, -4.013548, 1, 0, 0, 1, 1,
-0.6314744, 1.149868, -1.665464, 1, 0, 0, 1, 1,
-0.6279118, -2.658926, -4.328996, 1, 0, 0, 1, 1,
-0.6264432, 0.1891699, 0.221861, 1, 0, 0, 1, 1,
-0.6204522, 1.823125, 0.7218618, 1, 0, 0, 1, 1,
-0.6198488, -0.7629557, -2.735731, 0, 0, 0, 1, 1,
-0.6101773, 0.7544275, -0.8524175, 0, 0, 0, 1, 1,
-0.6084899, 0.4121376, -1.662768, 0, 0, 0, 1, 1,
-0.6071651, -1.590072, -4.139926, 0, 0, 0, 1, 1,
-0.6059515, 0.2682742, -0.07212593, 0, 0, 0, 1, 1,
-0.6034709, -0.8310384, -2.387546, 0, 0, 0, 1, 1,
-0.6007065, -0.6468917, -2.786533, 0, 0, 0, 1, 1,
-0.5997666, 0.8940485, 0.523822, 1, 1, 1, 1, 1,
-0.5964129, -1.706774, -1.8468, 1, 1, 1, 1, 1,
-0.5959803, 1.786094, 1.106413, 1, 1, 1, 1, 1,
-0.5944546, 0.1272452, -2.15378, 1, 1, 1, 1, 1,
-0.5935304, 0.3903161, -1.062818, 1, 1, 1, 1, 1,
-0.5929559, 0.5081146, -2.27659, 1, 1, 1, 1, 1,
-0.5929037, 0.3143643, -0.664629, 1, 1, 1, 1, 1,
-0.5925776, -0.3353142, -2.611509, 1, 1, 1, 1, 1,
-0.5907915, -0.2841644, 0.295652, 1, 1, 1, 1, 1,
-0.5780228, -0.1501711, -0.08663912, 1, 1, 1, 1, 1,
-0.5775154, 1.628622, -0.1068071, 1, 1, 1, 1, 1,
-0.5727431, -0.5781702, -1.699291, 1, 1, 1, 1, 1,
-0.5726249, 1.318315, -0.4880826, 1, 1, 1, 1, 1,
-0.569178, 1.352062, -2.293604, 1, 1, 1, 1, 1,
-0.5689205, 0.868671, -1.197502, 1, 1, 1, 1, 1,
-0.5670979, 0.3548174, -1.317552, 0, 0, 1, 1, 1,
-0.5653595, -0.5720717, -3.70736, 1, 0, 0, 1, 1,
-0.5641713, 0.3958867, -2.121551, 1, 0, 0, 1, 1,
-0.5632001, -0.4604465, -2.792235, 1, 0, 0, 1, 1,
-0.5578442, -0.273832, -2.164789, 1, 0, 0, 1, 1,
-0.5463344, -0.1138869, -0.3052386, 1, 0, 0, 1, 1,
-0.5439948, -0.2958575, -3.306472, 0, 0, 0, 1, 1,
-0.5411525, -0.7463443, -0.8616149, 0, 0, 0, 1, 1,
-0.5392705, 0.322037, -3.090341, 0, 0, 0, 1, 1,
-0.5355417, 1.054478, -1.530496, 0, 0, 0, 1, 1,
-0.5330254, -0.5252857, -1.250135, 0, 0, 0, 1, 1,
-0.5278342, -0.1651935, -2.33911, 0, 0, 0, 1, 1,
-0.5275487, 1.008022, -1.335851, 0, 0, 0, 1, 1,
-0.527539, -1.049301, -3.161873, 1, 1, 1, 1, 1,
-0.5254507, -1.164137, -4.520268, 1, 1, 1, 1, 1,
-0.5252104, -0.6643161, -2.022721, 1, 1, 1, 1, 1,
-0.5234947, 1.361131, -2.335567, 1, 1, 1, 1, 1,
-0.5232478, -0.06583575, -1.259791, 1, 1, 1, 1, 1,
-0.5207846, 0.9197193, -2.029279, 1, 1, 1, 1, 1,
-0.5189818, -3.192394, -3.12634, 1, 1, 1, 1, 1,
-0.5118019, -0.1123419, 0.1670052, 1, 1, 1, 1, 1,
-0.5060834, 1.060966, -0.5725842, 1, 1, 1, 1, 1,
-0.5010649, -1.357283, -3.033802, 1, 1, 1, 1, 1,
-0.4993505, 0.7731918, -0.7512515, 1, 1, 1, 1, 1,
-0.4987698, 0.5112775, -1.945895, 1, 1, 1, 1, 1,
-0.496133, -0.07089908, -1.429532, 1, 1, 1, 1, 1,
-0.495434, -0.4965884, -1.121977, 1, 1, 1, 1, 1,
-0.4942314, 0.7454604, 1.010839, 1, 1, 1, 1, 1,
-0.491519, -0.3694998, -3.27304, 0, 0, 1, 1, 1,
-0.4906953, -1.027887, -2.706508, 1, 0, 0, 1, 1,
-0.4879711, -0.5215917, -1.65585, 1, 0, 0, 1, 1,
-0.4831407, 0.6159502, -1.879439, 1, 0, 0, 1, 1,
-0.4821984, 0.2887339, -3.305007, 1, 0, 0, 1, 1,
-0.4811358, -0.1051692, -2.152107, 1, 0, 0, 1, 1,
-0.4755051, -2.33844, -2.235497, 0, 0, 0, 1, 1,
-0.4751806, -1.394809, -1.011658, 0, 0, 0, 1, 1,
-0.4730956, -0.818805, -4.52486, 0, 0, 0, 1, 1,
-0.4667782, 0.2661382, -1.433437, 0, 0, 0, 1, 1,
-0.4661559, -1.003193, -2.426866, 0, 0, 0, 1, 1,
-0.4570155, -0.07110462, -2.370664, 0, 0, 0, 1, 1,
-0.4557438, -0.9367654, -2.980409, 0, 0, 0, 1, 1,
-0.4540921, -0.1628781, -2.585476, 1, 1, 1, 1, 1,
-0.4533973, 0.0250477, -1.132542, 1, 1, 1, 1, 1,
-0.4533234, -0.6474686, -3.365557, 1, 1, 1, 1, 1,
-0.4532788, -1.426978, -2.046701, 1, 1, 1, 1, 1,
-0.449978, -2.241937, -4.283179, 1, 1, 1, 1, 1,
-0.4485396, 0.4382957, -0.1240638, 1, 1, 1, 1, 1,
-0.4469121, -1.291793, -3.065111, 1, 1, 1, 1, 1,
-0.4395711, 0.4573578, -2.17857, 1, 1, 1, 1, 1,
-0.4394598, 0.5871001, 0.5009931, 1, 1, 1, 1, 1,
-0.4379369, 0.4245328, -1.812218, 1, 1, 1, 1, 1,
-0.4334061, 1.304499, 0.2563182, 1, 1, 1, 1, 1,
-0.4332415, 0.1707946, -1.574625, 1, 1, 1, 1, 1,
-0.4273711, 0.7014636, -0.7370757, 1, 1, 1, 1, 1,
-0.4252622, 0.8193625, -1.252289, 1, 1, 1, 1, 1,
-0.4242511, -0.7394853, -2.196025, 1, 1, 1, 1, 1,
-0.4220035, 0.004775725, -1.879772, 0, 0, 1, 1, 1,
-0.4184462, -0.3080276, -2.407693, 1, 0, 0, 1, 1,
-0.4143954, 0.1304457, -2.287279, 1, 0, 0, 1, 1,
-0.4141349, 2.204102, -0.5042171, 1, 0, 0, 1, 1,
-0.411689, -1.855227, -2.949375, 1, 0, 0, 1, 1,
-0.410861, -0.4235445, -2.74321, 1, 0, 0, 1, 1,
-0.4103206, 1.914515, 1.17197, 0, 0, 0, 1, 1,
-0.4080591, 1.665774, 0.7378106, 0, 0, 0, 1, 1,
-0.4075407, -0.8527426, -1.437305, 0, 0, 0, 1, 1,
-0.4057777, 0.1384705, -0.5076587, 0, 0, 0, 1, 1,
-0.3983474, -0.8319235, -2.691411, 0, 0, 0, 1, 1,
-0.3983358, 0.3843242, -0.1256294, 0, 0, 0, 1, 1,
-0.3977054, -0.6921434, -0.06172473, 0, 0, 0, 1, 1,
-0.3972413, 0.03899694, -1.422421, 1, 1, 1, 1, 1,
-0.3967624, 0.4484049, -0.2413315, 1, 1, 1, 1, 1,
-0.3889081, -1.452854, -1.6625, 1, 1, 1, 1, 1,
-0.3834355, -0.5498833, -0.8689829, 1, 1, 1, 1, 1,
-0.371861, -0.6747224, -1.691362, 1, 1, 1, 1, 1,
-0.3705819, 0.9126454, -2.726675, 1, 1, 1, 1, 1,
-0.3688425, 1.920554, 0.2896311, 1, 1, 1, 1, 1,
-0.3674463, 0.04604378, -0.008525935, 1, 1, 1, 1, 1,
-0.3661064, 2.322791, -1.347597, 1, 1, 1, 1, 1,
-0.3627096, 1.130157, -1.30928, 1, 1, 1, 1, 1,
-0.3622521, -0.6332889, -2.879713, 1, 1, 1, 1, 1,
-0.3594435, -0.9866369, -1.806082, 1, 1, 1, 1, 1,
-0.3582115, 0.3339619, -0.5528755, 1, 1, 1, 1, 1,
-0.3544752, -0.1207287, -1.885476, 1, 1, 1, 1, 1,
-0.354278, 0.387377, -1.573517, 1, 1, 1, 1, 1,
-0.3542506, 0.09401421, -0.9146491, 0, 0, 1, 1, 1,
-0.344294, -0.4836765, -2.174799, 1, 0, 0, 1, 1,
-0.340526, 0.2200477, -0.7196336, 1, 0, 0, 1, 1,
-0.3372855, 0.9172864, 0.3056631, 1, 0, 0, 1, 1,
-0.3347476, -1.177838, -3.41174, 1, 0, 0, 1, 1,
-0.3332663, -0.5868849, -2.052655, 1, 0, 0, 1, 1,
-0.3309599, -0.4068106, -3.643035, 0, 0, 0, 1, 1,
-0.328622, 0.7055629, -1.642247, 0, 0, 0, 1, 1,
-0.32274, -1.465836, -3.667344, 0, 0, 0, 1, 1,
-0.3201561, 0.9606494, -1.136376, 0, 0, 0, 1, 1,
-0.3133996, -0.6411744, -3.025754, 0, 0, 0, 1, 1,
-0.3129159, -0.851011, -2.349556, 0, 0, 0, 1, 1,
-0.3102028, -0.09077143, -3.851191, 0, 0, 0, 1, 1,
-0.3093896, 0.03016183, -2.769903, 1, 1, 1, 1, 1,
-0.3093188, -0.4555514, -2.730564, 1, 1, 1, 1, 1,
-0.3063163, 1.773893, 1.157817, 1, 1, 1, 1, 1,
-0.3029075, 0.9260389, 0.630492, 1, 1, 1, 1, 1,
-0.2967526, -0.7329534, -3.929221, 1, 1, 1, 1, 1,
-0.2929624, 1.011035, 1.591605, 1, 1, 1, 1, 1,
-0.2916224, -0.4817979, -3.352068, 1, 1, 1, 1, 1,
-0.2847798, -2.35535, -2.49697, 1, 1, 1, 1, 1,
-0.2834415, 0.8126885, 1.042712, 1, 1, 1, 1, 1,
-0.2824186, -1.896945, -2.781241, 1, 1, 1, 1, 1,
-0.2815356, 0.4251456, -0.9260002, 1, 1, 1, 1, 1,
-0.2803023, 1.665758, 2.613271, 1, 1, 1, 1, 1,
-0.278957, -0.04807208, -2.367692, 1, 1, 1, 1, 1,
-0.2775239, -0.7865101, -2.592889, 1, 1, 1, 1, 1,
-0.2773128, -0.4227895, -1.947717, 1, 1, 1, 1, 1,
-0.2665736, 0.1585062, 0.1166587, 0, 0, 1, 1, 1,
-0.2647306, -2.641422, -3.070122, 1, 0, 0, 1, 1,
-0.2591176, 0.01868613, -0.5323146, 1, 0, 0, 1, 1,
-0.2585518, -0.7778887, -4.049542, 1, 0, 0, 1, 1,
-0.2576859, 0.01954972, 0.2538427, 1, 0, 0, 1, 1,
-0.2571824, -1.696514, -1.265418, 1, 0, 0, 1, 1,
-0.2547165, 0.9785321, -1.84276, 0, 0, 0, 1, 1,
-0.2512629, -0.07428744, -2.512385, 0, 0, 0, 1, 1,
-0.2431937, -0.3129649, 0.0927131, 0, 0, 0, 1, 1,
-0.2420077, -0.02860694, -1.154344, 0, 0, 0, 1, 1,
-0.2419472, -0.9092206, -3.492652, 0, 0, 0, 1, 1,
-0.2417434, -0.6235579, -2.568144, 0, 0, 0, 1, 1,
-0.239708, 2.434965, 1.246839, 0, 0, 0, 1, 1,
-0.2336507, 0.1864922, -2.365338, 1, 1, 1, 1, 1,
-0.2320019, -0.9294478, -2.22494, 1, 1, 1, 1, 1,
-0.2316511, 0.4993891, -0.9570464, 1, 1, 1, 1, 1,
-0.2289243, 0.3442078, -0.6792846, 1, 1, 1, 1, 1,
-0.2285062, -0.1232239, -5.208172, 1, 1, 1, 1, 1,
-0.2266449, 0.7298342, 0.1364596, 1, 1, 1, 1, 1,
-0.2247153, -1.450964, -1.623134, 1, 1, 1, 1, 1,
-0.2087894, -0.5615156, -1.426467, 1, 1, 1, 1, 1,
-0.2084304, -1.384627, -4.813251, 1, 1, 1, 1, 1,
-0.2082778, 0.2297841, -1.060112, 1, 1, 1, 1, 1,
-0.2081158, 1.717706, 0.1881692, 1, 1, 1, 1, 1,
-0.204538, -0.3291149, -2.343501, 1, 1, 1, 1, 1,
-0.1986091, -0.9078634, -2.862717, 1, 1, 1, 1, 1,
-0.198009, 0.9161528, 0.7847078, 1, 1, 1, 1, 1,
-0.1977612, 0.8085435, -0.1226586, 1, 1, 1, 1, 1,
-0.1974592, 0.2319732, -1.191893, 0, 0, 1, 1, 1,
-0.1950971, 0.2472429, -2.559463, 1, 0, 0, 1, 1,
-0.1916216, 1.109521, 0.6933854, 1, 0, 0, 1, 1,
-0.1908036, 1.107616, 0.5738845, 1, 0, 0, 1, 1,
-0.1905862, -0.2987107, -3.060616, 1, 0, 0, 1, 1,
-0.188798, -1.103523, -2.12364, 1, 0, 0, 1, 1,
-0.1882968, 1.100682, 1.095346, 0, 0, 0, 1, 1,
-0.1803912, -0.1418154, -2.56285, 0, 0, 0, 1, 1,
-0.1778119, -0.6124089, -4.16706, 0, 0, 0, 1, 1,
-0.1757917, 1.184824, -0.08537549, 0, 0, 0, 1, 1,
-0.1756503, -0.5378501, -2.716334, 0, 0, 0, 1, 1,
-0.1740341, 0.1669811, -0.984454, 0, 0, 0, 1, 1,
-0.1686825, 0.04480713, -0.3949128, 0, 0, 0, 1, 1,
-0.1642069, 1.534815, 1.584314, 1, 1, 1, 1, 1,
-0.1621865, -0.1413693, -2.655323, 1, 1, 1, 1, 1,
-0.1611819, -0.8430997, -3.932266, 1, 1, 1, 1, 1,
-0.1572698, 0.5424396, -0.7430753, 1, 1, 1, 1, 1,
-0.1542618, -0.03186798, -3.142469, 1, 1, 1, 1, 1,
-0.150275, 1.977942, 1.270561, 1, 1, 1, 1, 1,
-0.1485363, 0.3608467, 0.1940981, 1, 1, 1, 1, 1,
-0.142142, 0.8260352, -0.2866335, 1, 1, 1, 1, 1,
-0.1420401, -2.014867, -3.234329, 1, 1, 1, 1, 1,
-0.1326762, 1.080724, 0.6355202, 1, 1, 1, 1, 1,
-0.1275938, -0.3219159, -1.124618, 1, 1, 1, 1, 1,
-0.125542, -1.325982, -3.827085, 1, 1, 1, 1, 1,
-0.1214279, -2.092164, -3.156648, 1, 1, 1, 1, 1,
-0.120756, 1.276302, -0.1340565, 1, 1, 1, 1, 1,
-0.1189267, -0.5719008, -3.06298, 1, 1, 1, 1, 1,
-0.1188353, -0.9877148, -1.210085, 0, 0, 1, 1, 1,
-0.1121757, -0.2070116, -0.9461023, 1, 0, 0, 1, 1,
-0.1097639, -1.546519, -4.915964, 1, 0, 0, 1, 1,
-0.1088915, -0.5620786, -5.11144, 1, 0, 0, 1, 1,
-0.1078071, 0.4071609, -0.8986008, 1, 0, 0, 1, 1,
-0.1059196, 0.5107773, -1.126912, 1, 0, 0, 1, 1,
-0.1025646, -1.04081, -3.277701, 0, 0, 0, 1, 1,
-0.0962686, 1.136445, -0.3267761, 0, 0, 0, 1, 1,
-0.09435619, 0.4293748, -0.7946699, 0, 0, 0, 1, 1,
-0.09318042, 1.587157, -1.586913, 0, 0, 0, 1, 1,
-0.0850981, 0.1659102, 0.4772068, 0, 0, 0, 1, 1,
-0.07871747, -0.2060728, -1.269071, 0, 0, 0, 1, 1,
-0.07769327, -0.3786703, -2.302522, 0, 0, 0, 1, 1,
-0.07471553, 0.2360598, 0.6240604, 1, 1, 1, 1, 1,
-0.06918842, -0.7522323, -2.381228, 1, 1, 1, 1, 1,
-0.06879415, 0.005998635, -2.265863, 1, 1, 1, 1, 1,
-0.0682722, 1.196323, -1.178494, 1, 1, 1, 1, 1,
-0.06736702, 0.3751692, -2.345525, 1, 1, 1, 1, 1,
-0.0657033, 1.541148, 0.2143173, 1, 1, 1, 1, 1,
-0.06150565, -0.2939713, -3.057689, 1, 1, 1, 1, 1,
-0.05412153, 0.9288418, -0.0938126, 1, 1, 1, 1, 1,
-0.05224365, 1.01009, -2.254363, 1, 1, 1, 1, 1,
-0.05173651, -0.5369392, -3.373882, 1, 1, 1, 1, 1,
-0.0514317, -1.182007, -4.410933, 1, 1, 1, 1, 1,
-0.05061027, -0.1556344, -3.618418, 1, 1, 1, 1, 1,
-0.04490434, 1.336558, 0.736264, 1, 1, 1, 1, 1,
-0.04318886, -0.3582999, -3.456666, 1, 1, 1, 1, 1,
-0.04209028, 1.05534, 0.113298, 1, 1, 1, 1, 1,
-0.04074907, -0.9551948, -2.609349, 0, 0, 1, 1, 1,
-0.0402957, -1.519494, -4.554916, 1, 0, 0, 1, 1,
-0.03641043, 1.41493, 1.777412, 1, 0, 0, 1, 1,
-0.03448506, -0.1809376, -4.451621, 1, 0, 0, 1, 1,
-0.03127178, 0.902186, -0.6699966, 1, 0, 0, 1, 1,
-0.02642669, -0.9246621, -4.171288, 1, 0, 0, 1, 1,
-0.02394383, -0.6427563, -3.548326, 0, 0, 0, 1, 1,
-0.02049704, -0.4684379, -3.770346, 0, 0, 0, 1, 1,
-0.01852874, 0.07893033, -0.6754511, 0, 0, 0, 1, 1,
-0.0163309, -1.389029, -2.821268, 0, 0, 0, 1, 1,
-0.01298777, 1.336148, 2.099201, 0, 0, 0, 1, 1,
-0.01292516, 0.5413339, 0.5680955, 0, 0, 0, 1, 1,
-0.005368453, 0.701682, 0.6407695, 0, 0, 0, 1, 1,
9.688148e-05, -1.550132, 2.797336, 1, 1, 1, 1, 1,
0.0002739044, -1.48449, 3.085523, 1, 1, 1, 1, 1,
0.001372328, 0.311973, 0.7513511, 1, 1, 1, 1, 1,
0.007257175, 1.329095, 0.222428, 1, 1, 1, 1, 1,
0.01061813, -1.891425, 4.340725, 1, 1, 1, 1, 1,
0.01553111, 0.8654791, -0.3158864, 1, 1, 1, 1, 1,
0.01858602, 0.6076226, -0.9257042, 1, 1, 1, 1, 1,
0.01976896, -0.3902558, 3.439452, 1, 1, 1, 1, 1,
0.02233003, -0.1829091, 2.649421, 1, 1, 1, 1, 1,
0.02263005, -0.118708, 2.346376, 1, 1, 1, 1, 1,
0.02270072, -2.771115, 2.690938, 1, 1, 1, 1, 1,
0.02357963, -0.926945, 1.390918, 1, 1, 1, 1, 1,
0.02590696, 1.767484, -0.01326739, 1, 1, 1, 1, 1,
0.02893782, -0.1564057, 3.270795, 1, 1, 1, 1, 1,
0.04083605, -1.501012, 2.148884, 1, 1, 1, 1, 1,
0.04223154, -0.1232073, 3.303899, 0, 0, 1, 1, 1,
0.04563036, -0.1681283, 3.020861, 1, 0, 0, 1, 1,
0.04591966, -1.693369, 2.763493, 1, 0, 0, 1, 1,
0.04807073, -1.808018, 3.494144, 1, 0, 0, 1, 1,
0.05265066, -0.5722923, 4.710553, 1, 0, 0, 1, 1,
0.05349231, 0.02406044, 2.525035, 1, 0, 0, 1, 1,
0.05489646, -0.8558714, 2.870248, 0, 0, 0, 1, 1,
0.05844815, 0.1495233, 0.359387, 0, 0, 0, 1, 1,
0.0609538, -0.3443351, 3.058636, 0, 0, 0, 1, 1,
0.06208251, -0.8434178, 3.647677, 0, 0, 0, 1, 1,
0.06337371, 0.260394, -0.3858948, 0, 0, 0, 1, 1,
0.06785315, 1.389142, -0.8323137, 0, 0, 0, 1, 1,
0.06882249, 0.5772998, -0.4650859, 0, 0, 0, 1, 1,
0.07153853, -0.5342461, 2.076202, 1, 1, 1, 1, 1,
0.07317416, 0.3946014, -0.5169466, 1, 1, 1, 1, 1,
0.07544837, 1.721578, 1.62353, 1, 1, 1, 1, 1,
0.07557208, -0.1567898, 1.86051, 1, 1, 1, 1, 1,
0.07588203, -0.8783678, 3.146923, 1, 1, 1, 1, 1,
0.07677711, 0.2172871, 1.128751, 1, 1, 1, 1, 1,
0.07697063, -0.3476904, 3.70048, 1, 1, 1, 1, 1,
0.0801704, -0.4931564, 2.873098, 1, 1, 1, 1, 1,
0.0821259, 0.4698318, 2.045189, 1, 1, 1, 1, 1,
0.08283728, 1.476812, 0.1295743, 1, 1, 1, 1, 1,
0.08339588, 1.230379, 1.920791, 1, 1, 1, 1, 1,
0.08347974, -2.030204, 2.159614, 1, 1, 1, 1, 1,
0.08390719, -0.6749063, 3.273451, 1, 1, 1, 1, 1,
0.08625922, -1.533184, 3.073063, 1, 1, 1, 1, 1,
0.08758494, -0.6149528, 2.290836, 1, 1, 1, 1, 1,
0.08768815, -0.03431642, -1.901536, 0, 0, 1, 1, 1,
0.08890364, 1.886473, 0.554738, 1, 0, 0, 1, 1,
0.09422653, 0.101, 2.628805, 1, 0, 0, 1, 1,
0.0946219, 0.5036934, 0.373209, 1, 0, 0, 1, 1,
0.0958124, -1.504491, 3.170669, 1, 0, 0, 1, 1,
0.09663505, 0.5943956, -0.7300417, 1, 0, 0, 1, 1,
0.09863323, -1.81901, 1.852496, 0, 0, 0, 1, 1,
0.09898446, 0.01557134, -0.6182553, 0, 0, 0, 1, 1,
0.1036928, -0.3506185, 1.696287, 0, 0, 0, 1, 1,
0.104999, -0.2094956, 3.275596, 0, 0, 0, 1, 1,
0.1092748, -1.432999, 2.308703, 0, 0, 0, 1, 1,
0.1104443, -1.007455, 4.079775, 0, 0, 0, 1, 1,
0.1106854, -0.522522, 1.633874, 0, 0, 0, 1, 1,
0.1109156, 0.1280815, 2.269084, 1, 1, 1, 1, 1,
0.1121048, 0.712864, 0.5454169, 1, 1, 1, 1, 1,
0.1144442, -1.307841, 4.57427, 1, 1, 1, 1, 1,
0.117487, -0.1303927, 1.696858, 1, 1, 1, 1, 1,
0.118123, 0.8189546, 0.8316635, 1, 1, 1, 1, 1,
0.1198325, -0.8708651, 0.4791489, 1, 1, 1, 1, 1,
0.1214865, 1.597562, -0.1311058, 1, 1, 1, 1, 1,
0.1279886, 1.30317, -0.2733777, 1, 1, 1, 1, 1,
0.1327012, -1.336375, 4.208166, 1, 1, 1, 1, 1,
0.1333095, 0.9865311, -0.2049814, 1, 1, 1, 1, 1,
0.1334825, 0.08454884, 0.5537377, 1, 1, 1, 1, 1,
0.1353708, 0.526605, -0.9455221, 1, 1, 1, 1, 1,
0.1383602, 1.310525, -0.8049007, 1, 1, 1, 1, 1,
0.1419909, -0.7603662, 2.995525, 1, 1, 1, 1, 1,
0.1423785, -0.7307335, 2.127401, 1, 1, 1, 1, 1,
0.1430989, -0.3157701, 1.436655, 0, 0, 1, 1, 1,
0.1437786, -1.156427, 1.558329, 1, 0, 0, 1, 1,
0.1539191, 1.220889, 0.7155164, 1, 0, 0, 1, 1,
0.1550851, 0.8635532, 1.023084, 1, 0, 0, 1, 1,
0.1570462, -0.3433339, 1.730743, 1, 0, 0, 1, 1,
0.1598159, -0.02072678, 4.125185, 1, 0, 0, 1, 1,
0.1651411, 0.3019394, 1.862332, 0, 0, 0, 1, 1,
0.1674202, -1.365924, 4.886927, 0, 0, 0, 1, 1,
0.1686179, -0.03780076, 2.116535, 0, 0, 0, 1, 1,
0.169919, 1.971452, -0.7441867, 0, 0, 0, 1, 1,
0.170648, -0.2231705, 2.492697, 0, 0, 0, 1, 1,
0.1723575, 0.2025894, 0.3527832, 0, 0, 0, 1, 1,
0.173213, -0.6358951, 1.66681, 0, 0, 0, 1, 1,
0.1770623, 1.08616, 0.3879013, 1, 1, 1, 1, 1,
0.177613, -0.8559159, 3.374184, 1, 1, 1, 1, 1,
0.1784722, 0.5951805, 1.306257, 1, 1, 1, 1, 1,
0.1786527, 0.1832214, 0.9420147, 1, 1, 1, 1, 1,
0.1792474, 0.008303447, 3.113417, 1, 1, 1, 1, 1,
0.1800854, 0.3259614, -0.370356, 1, 1, 1, 1, 1,
0.1853466, -0.0005802711, 3.315295, 1, 1, 1, 1, 1,
0.1863195, 0.05568832, 2.163413, 1, 1, 1, 1, 1,
0.1870584, 0.9030699, 0.3783678, 1, 1, 1, 1, 1,
0.1917946, 0.8830143, -1.26453, 1, 1, 1, 1, 1,
0.1927595, 0.3821935, 2.17478, 1, 1, 1, 1, 1,
0.1933568, -0.7396835, 2.579733, 1, 1, 1, 1, 1,
0.1935134, 2.312036, -1.946544, 1, 1, 1, 1, 1,
0.1981143, -1.305799, 4.749427, 1, 1, 1, 1, 1,
0.2002737, 1.204016, 0.007024556, 1, 1, 1, 1, 1,
0.2027349, 0.10756, -0.7216663, 0, 0, 1, 1, 1,
0.2045655, 0.2210096, 1.455943, 1, 0, 0, 1, 1,
0.2049557, -0.1863881, 3.809034, 1, 0, 0, 1, 1,
0.2077927, 0.01591805, 1.226347, 1, 0, 0, 1, 1,
0.2083689, 1.593076, 0.03337893, 1, 0, 0, 1, 1,
0.2099891, 0.3074383, 0.07050076, 1, 0, 0, 1, 1,
0.2113681, -0.03219817, 1.966703, 0, 0, 0, 1, 1,
0.2150606, -1.995951, 1.607262, 0, 0, 0, 1, 1,
0.2234061, 1.091599, 0.1465282, 0, 0, 0, 1, 1,
0.2240564, 0.2406785, 0.4234787, 0, 0, 0, 1, 1,
0.2273903, -0.6871119, 3.686026, 0, 0, 0, 1, 1,
0.2307769, -0.9463027, 3.048164, 0, 0, 0, 1, 1,
0.2332775, 2.909987, -0.2801352, 0, 0, 0, 1, 1,
0.2359529, -0.7355753, 2.151769, 1, 1, 1, 1, 1,
0.2372541, 1.154461, -0.8264047, 1, 1, 1, 1, 1,
0.2409418, 0.5324598, -0.04467473, 1, 1, 1, 1, 1,
0.2420251, 0.4229074, 0.9440734, 1, 1, 1, 1, 1,
0.2446913, 0.2253142, 1.380243, 1, 1, 1, 1, 1,
0.2450568, 1.193111, 0.3566191, 1, 1, 1, 1, 1,
0.2467463, 0.5043187, 0.3639352, 1, 1, 1, 1, 1,
0.2558445, 1.410532, -0.2015847, 1, 1, 1, 1, 1,
0.256752, 0.1776299, 1.306541, 1, 1, 1, 1, 1,
0.2571858, -1.311019, 2.853765, 1, 1, 1, 1, 1,
0.2604622, 1.486825, -1.38747, 1, 1, 1, 1, 1,
0.262236, 0.4473537, 0.1562663, 1, 1, 1, 1, 1,
0.2629153, -0.4838618, 3.836896, 1, 1, 1, 1, 1,
0.2648912, 1.449158, 2.45946, 1, 1, 1, 1, 1,
0.2656489, 0.216925, -0.6000329, 1, 1, 1, 1, 1,
0.271822, -0.4309403, 3.717095, 0, 0, 1, 1, 1,
0.2719924, 1.681233, -0.4114795, 1, 0, 0, 1, 1,
0.2736649, 0.06193238, 2.743504, 1, 0, 0, 1, 1,
0.2778939, 0.6726854, -1.461219, 1, 0, 0, 1, 1,
0.2781233, -2.31759, 2.000153, 1, 0, 0, 1, 1,
0.2832196, -0.8537738, 2.676869, 1, 0, 0, 1, 1,
0.283588, -2.020648, 2.856168, 0, 0, 0, 1, 1,
0.2857217, -1.417248, 1.312419, 0, 0, 0, 1, 1,
0.2868757, 0.3438213, 0.6240139, 0, 0, 0, 1, 1,
0.2924457, -0.9813449, 2.389376, 0, 0, 0, 1, 1,
0.2991896, 0.3598004, 0.0288409, 0, 0, 0, 1, 1,
0.3089554, 1.885161, 0.2717032, 0, 0, 0, 1, 1,
0.3116172, -0.2754157, 2.540655, 0, 0, 0, 1, 1,
0.3166434, 1.647757, 0.8656266, 1, 1, 1, 1, 1,
0.317254, -1.306888, 2.874617, 1, 1, 1, 1, 1,
0.3224919, 0.6010324, -1.31795, 1, 1, 1, 1, 1,
0.3245071, 0.7874503, 2.202328, 1, 1, 1, 1, 1,
0.3261794, 2.388798, -0.3131696, 1, 1, 1, 1, 1,
0.3283439, -1.177834, 3.785594, 1, 1, 1, 1, 1,
0.3305973, 1.286099, -0.3639278, 1, 1, 1, 1, 1,
0.3318535, -0.865479, 2.566517, 1, 1, 1, 1, 1,
0.335849, 0.3072418, 0.8736951, 1, 1, 1, 1, 1,
0.3403403, -0.9334773, 4.011938, 1, 1, 1, 1, 1,
0.3406098, -1.00737, 4.530154, 1, 1, 1, 1, 1,
0.3457248, -0.2379022, 2.136356, 1, 1, 1, 1, 1,
0.3498755, -1.25105, 2.452463, 1, 1, 1, 1, 1,
0.3568753, -0.7390357, 2.458674, 1, 1, 1, 1, 1,
0.3575156, 0.5813099, 0.5566894, 1, 1, 1, 1, 1,
0.3587081, 0.614633, 0.2328708, 0, 0, 1, 1, 1,
0.366584, 0.2142743, 1.625335, 1, 0, 0, 1, 1,
0.3674027, -0.4555868, 3.632282, 1, 0, 0, 1, 1,
0.3685706, 1.339521, 1.265895, 1, 0, 0, 1, 1,
0.3769004, -1.39248, 3.109321, 1, 0, 0, 1, 1,
0.3839077, 0.234522, 1.087792, 1, 0, 0, 1, 1,
0.3884014, -0.1383524, -0.532463, 0, 0, 0, 1, 1,
0.3899377, 0.7064876, 0.01209283, 0, 0, 0, 1, 1,
0.3910592, -1.954981, 3.390591, 0, 0, 0, 1, 1,
0.3967389, 0.3922122, -0.4581343, 0, 0, 0, 1, 1,
0.3998972, -0.6116595, 2.239897, 0, 0, 0, 1, 1,
0.407547, 0.4262302, 0.6407273, 0, 0, 0, 1, 1,
0.4097791, 0.05812592, 3.099336, 0, 0, 0, 1, 1,
0.4101603, -1.237666, 1.899766, 1, 1, 1, 1, 1,
0.4107183, -0.2993143, 3.439599, 1, 1, 1, 1, 1,
0.4149775, -0.0923607, 1.847947, 1, 1, 1, 1, 1,
0.4169578, 1.036267, -0.7253392, 1, 1, 1, 1, 1,
0.4224059, 0.2584626, 0.3671534, 1, 1, 1, 1, 1,
0.424615, -1.474608, 3.165983, 1, 1, 1, 1, 1,
0.4279002, -0.2939692, 2.59716, 1, 1, 1, 1, 1,
0.429724, 0.3205611, 1.789939, 1, 1, 1, 1, 1,
0.434307, -1.093081, 4.402063, 1, 1, 1, 1, 1,
0.4366289, 1.329314, -0.7619263, 1, 1, 1, 1, 1,
0.4390658, 0.6276478, 1.25771, 1, 1, 1, 1, 1,
0.4559528, -0.8040127, 2.20841, 1, 1, 1, 1, 1,
0.4574345, -0.2496567, 3.32301, 1, 1, 1, 1, 1,
0.4590026, 0.3373157, 1.669868, 1, 1, 1, 1, 1,
0.4594188, 1.463588, 1.109113, 1, 1, 1, 1, 1,
0.4604244, -1.516182, 1.504869, 0, 0, 1, 1, 1,
0.4648939, 1.468943, 1.816696, 1, 0, 0, 1, 1,
0.4654565, -0.5964071, 1.361306, 1, 0, 0, 1, 1,
0.4675829, -0.6835196, 1.705656, 1, 0, 0, 1, 1,
0.4679489, -0.2140228, 2.70576, 1, 0, 0, 1, 1,
0.4694015, 0.6228921, 2.473457, 1, 0, 0, 1, 1,
0.4706101, -0.5695865, 2.28301, 0, 0, 0, 1, 1,
0.4707958, 0.8428056, 2.086481, 0, 0, 0, 1, 1,
0.4735705, 1.209489, 2.041024, 0, 0, 0, 1, 1,
0.475446, -0.69196, 2.308267, 0, 0, 0, 1, 1,
0.4773581, -0.4306206, 2.347754, 0, 0, 0, 1, 1,
0.4782355, -1.779815, 3.720288, 0, 0, 0, 1, 1,
0.4895578, -0.3184735, 2.407619, 0, 0, 0, 1, 1,
0.4913535, -0.3937072, 3.068729, 1, 1, 1, 1, 1,
0.4925562, 1.087034, -0.5379592, 1, 1, 1, 1, 1,
0.4943132, 0.1124579, 1.667093, 1, 1, 1, 1, 1,
0.4962279, 1.755893, 3.105306, 1, 1, 1, 1, 1,
0.5012761, -0.6280967, 3.271369, 1, 1, 1, 1, 1,
0.5023359, -0.03341714, 1.78839, 1, 1, 1, 1, 1,
0.5036421, -0.7138076, 1.66388, 1, 1, 1, 1, 1,
0.5045547, -0.5081077, 2.173612, 1, 1, 1, 1, 1,
0.505896, -0.3532749, 2.850899, 1, 1, 1, 1, 1,
0.5127239, 0.4441156, 0.9484985, 1, 1, 1, 1, 1,
0.513576, -0.7793915, 2.103396, 1, 1, 1, 1, 1,
0.5141074, 1.808755, 1.210826, 1, 1, 1, 1, 1,
0.5172663, 2.1597, -1.073911, 1, 1, 1, 1, 1,
0.5200686, 1.44373, -0.5029866, 1, 1, 1, 1, 1,
0.5214863, 0.7955512, 0.7207519, 1, 1, 1, 1, 1,
0.5257627, 0.1158683, 2.495494, 0, 0, 1, 1, 1,
0.5267885, 1.025953, 0.4210251, 1, 0, 0, 1, 1,
0.5294913, 1.900029, 0.3589076, 1, 0, 0, 1, 1,
0.5302277, -0.4529957, 2.48828, 1, 0, 0, 1, 1,
0.5311631, 0.4812292, 0.2312396, 1, 0, 0, 1, 1,
0.5380288, 1.293635, 1.382125, 1, 0, 0, 1, 1,
0.5381413, -1.056931, 2.417073, 0, 0, 0, 1, 1,
0.5439446, 0.7846241, 2.678165, 0, 0, 0, 1, 1,
0.5442432, 0.9699525, 3.30816, 0, 0, 0, 1, 1,
0.5499554, -0.6053694, 1.577185, 0, 0, 0, 1, 1,
0.5503695, 1.472855, -0.07173451, 0, 0, 0, 1, 1,
0.5509442, 0.4159318, 2.891288, 0, 0, 0, 1, 1,
0.5575451, -2.076675, 3.097235, 0, 0, 0, 1, 1,
0.5649187, 1.33469, 0.1260631, 1, 1, 1, 1, 1,
0.5670939, 0.2438606, 2.440681, 1, 1, 1, 1, 1,
0.5672377, 1.404389, 0.9846955, 1, 1, 1, 1, 1,
0.5852144, 0.2752769, 1.398724, 1, 1, 1, 1, 1,
0.5863999, -1.781915, 2.642396, 1, 1, 1, 1, 1,
0.5868179, 0.4078771, 1.434911, 1, 1, 1, 1, 1,
0.5936704, 0.2154002, -0.9403605, 1, 1, 1, 1, 1,
0.594662, 2.030273, -0.2396071, 1, 1, 1, 1, 1,
0.5948419, -0.5082724, 2.137952, 1, 1, 1, 1, 1,
0.5949746, 0.5979682, -0.5137972, 1, 1, 1, 1, 1,
0.5950727, -0.001894544, 2.494359, 1, 1, 1, 1, 1,
0.5960934, 0.1339663, 0.257256, 1, 1, 1, 1, 1,
0.5969569, -0.749485, 1.733414, 1, 1, 1, 1, 1,
0.5971645, 0.655081, 1.129561, 1, 1, 1, 1, 1,
0.5972255, 0.1705173, 2.720324, 1, 1, 1, 1, 1,
0.6039034, 1.091929, 0.4191359, 0, 0, 1, 1, 1,
0.609375, 0.7578329, -0.7221512, 1, 0, 0, 1, 1,
0.6100053, -0.6500345, 1.596952, 1, 0, 0, 1, 1,
0.6107094, -0.8593851, 0.558103, 1, 0, 0, 1, 1,
0.6137536, 1.221646, 0.8182485, 1, 0, 0, 1, 1,
0.6173089, 1.177057, 0.3739292, 1, 0, 0, 1, 1,
0.620115, 1.819358, -0.1887747, 0, 0, 0, 1, 1,
0.6246754, 0.2585492, -0.2442154, 0, 0, 0, 1, 1,
0.6304299, -1.363347, 3.066239, 0, 0, 0, 1, 1,
0.6329545, 0.1850497, 0.5951006, 0, 0, 0, 1, 1,
0.6385407, 0.9332501, -0.6012869, 0, 0, 0, 1, 1,
0.6441328, -0.711974, 0.6899382, 0, 0, 0, 1, 1,
0.6458814, 0.7051613, -0.1573813, 0, 0, 0, 1, 1,
0.6600239, 0.1543601, 1.443739, 1, 1, 1, 1, 1,
0.6610535, -0.921445, 4.937308, 1, 1, 1, 1, 1,
0.6703694, 0.2786584, 1.70228, 1, 1, 1, 1, 1,
0.6729299, 0.04053584, 1.281078, 1, 1, 1, 1, 1,
0.6739236, 1.180392, -0.03323532, 1, 1, 1, 1, 1,
0.6892103, -0.3331305, 4.389093, 1, 1, 1, 1, 1,
0.6904008, 1.355852, 1.502754, 1, 1, 1, 1, 1,
0.6928242, 0.2131399, 0.2323689, 1, 1, 1, 1, 1,
0.7000154, -1.206992, 1.949654, 1, 1, 1, 1, 1,
0.7035444, -0.6241789, 2.776293, 1, 1, 1, 1, 1,
0.705427, -0.1998152, 2.261634, 1, 1, 1, 1, 1,
0.7065732, 0.1639323, 1.375264, 1, 1, 1, 1, 1,
0.7133011, 2.606448, -0.3923711, 1, 1, 1, 1, 1,
0.7145526, 1.456804, 0.9641163, 1, 1, 1, 1, 1,
0.7178013, 0.7454819, 1.727778, 1, 1, 1, 1, 1,
0.7193419, -0.7512755, 3.403005, 0, 0, 1, 1, 1,
0.7194397, -2.733477, 2.822562, 1, 0, 0, 1, 1,
0.7216726, -0.516158, 2.847583, 1, 0, 0, 1, 1,
0.7229122, -1.234664, 2.411228, 1, 0, 0, 1, 1,
0.7237227, -0.2767242, 2.701689, 1, 0, 0, 1, 1,
0.7439523, -1.070956, 3.003321, 1, 0, 0, 1, 1,
0.7443264, -1.023248, 0.8078361, 0, 0, 0, 1, 1,
0.744849, -0.5002125, 0.7604185, 0, 0, 0, 1, 1,
0.7482228, 0.1084514, 1.975858, 0, 0, 0, 1, 1,
0.7524025, -0.3617302, 2.52773, 0, 0, 0, 1, 1,
0.7570992, -1.500195, 2.627874, 0, 0, 0, 1, 1,
0.7591737, -0.6123258, 2.668061, 0, 0, 0, 1, 1,
0.761422, -1.648337, 0.8813304, 0, 0, 0, 1, 1,
0.7634347, 0.5062475, 1.370878, 1, 1, 1, 1, 1,
0.773587, -0.1415434, 1.250354, 1, 1, 1, 1, 1,
0.7744263, 0.9634977, 0.9858119, 1, 1, 1, 1, 1,
0.7837386, -0.2045901, 1.47411, 1, 1, 1, 1, 1,
0.7839217, -2.040992, 2.72658, 1, 1, 1, 1, 1,
0.7864653, -0.8599917, 3.091381, 1, 1, 1, 1, 1,
0.7914509, 0.02607442, 1.423051, 1, 1, 1, 1, 1,
0.7918923, 0.3403991, 1.408462, 1, 1, 1, 1, 1,
0.794504, 1.017811, 1.542618, 1, 1, 1, 1, 1,
0.8057186, -0.7693557, 1.532295, 1, 1, 1, 1, 1,
0.8078388, 1.66177, 0.5003055, 1, 1, 1, 1, 1,
0.8078644, 1.524042, -0.1985866, 1, 1, 1, 1, 1,
0.8100269, 0.797117, 1.672298, 1, 1, 1, 1, 1,
0.8125519, -0.4101887, 1.115399, 1, 1, 1, 1, 1,
0.8128572, 1.005636, 1.904433, 1, 1, 1, 1, 1,
0.826065, 1.982865, 0.1374031, 0, 0, 1, 1, 1,
0.833388, -0.3646058, 3.484181, 1, 0, 0, 1, 1,
0.8487001, -1.819272, 3.088176, 1, 0, 0, 1, 1,
0.8557115, -0.7198783, 3.235242, 1, 0, 0, 1, 1,
0.8599698, 0.1918284, 1.730424, 1, 0, 0, 1, 1,
0.8655521, 0.2205344, 0.8329678, 1, 0, 0, 1, 1,
0.8673833, -1.708186, 4.065869, 0, 0, 0, 1, 1,
0.8696703, -1.69415, 0.4561879, 0, 0, 0, 1, 1,
0.8736028, -1.222321, 2.144571, 0, 0, 0, 1, 1,
0.8754201, 0.6112811, 1.398143, 0, 0, 0, 1, 1,
0.8758034, 0.7988981, 0.8583868, 0, 0, 0, 1, 1,
0.8809569, 0.2248692, 1.256223, 0, 0, 0, 1, 1,
0.8945684, -0.7514479, 1.821449, 0, 0, 0, 1, 1,
0.8981829, 1.764586, -0.524632, 1, 1, 1, 1, 1,
0.9034833, -0.03803047, 1.061148, 1, 1, 1, 1, 1,
0.9071988, -0.01741599, 0.7646831, 1, 1, 1, 1, 1,
0.9108722, 0.9080296, -0.1133686, 1, 1, 1, 1, 1,
0.9158466, 0.8394867, 1.67349, 1, 1, 1, 1, 1,
0.9207883, -0.03022742, 0.448048, 1, 1, 1, 1, 1,
0.9210116, -1.197087, 2.365386, 1, 1, 1, 1, 1,
0.922671, 0.2758335, 1.49977, 1, 1, 1, 1, 1,
0.9237797, -0.357699, 1.474501, 1, 1, 1, 1, 1,
0.9369364, -0.03081968, 3.257867, 1, 1, 1, 1, 1,
0.9404256, -1.962513, 2.778246, 1, 1, 1, 1, 1,
0.9451618, -0.9870214, 2.162226, 1, 1, 1, 1, 1,
0.9493345, -1.242388, 2.536124, 1, 1, 1, 1, 1,
0.9494596, 0.114073, 3.850029, 1, 1, 1, 1, 1,
0.9517286, 0.4761886, -0.7327937, 1, 1, 1, 1, 1,
0.9544854, 0.3899655, 1.54878, 0, 0, 1, 1, 1,
0.959707, -2.476636, 1.479443, 1, 0, 0, 1, 1,
0.9605084, -0.2995656, 3.453285, 1, 0, 0, 1, 1,
0.9633397, 1.192004, 0.2543362, 1, 0, 0, 1, 1,
0.9663447, -1.871384, 2.839532, 1, 0, 0, 1, 1,
0.9663632, 0.6441715, 1.854977, 1, 0, 0, 1, 1,
0.9784898, -1.90901, 2.800227, 0, 0, 0, 1, 1,
0.9856475, -1.302616, 3.824948, 0, 0, 0, 1, 1,
0.98569, 0.6091079, -1.023335, 0, 0, 0, 1, 1,
0.9926286, 1.093179, 0.3683005, 0, 0, 0, 1, 1,
0.9969344, -0.400908, 1.203894, 0, 0, 0, 1, 1,
0.9986742, -1.283913, 1.466742, 0, 0, 0, 1, 1,
1.004361, -1.511871, 1.472538, 0, 0, 0, 1, 1,
1.006155, -0.7235833, 0.6502773, 1, 1, 1, 1, 1,
1.008722, -1.541585, 2.807039, 1, 1, 1, 1, 1,
1.00951, -1.358542, 2.852484, 1, 1, 1, 1, 1,
1.014274, -1.631354, 3.699963, 1, 1, 1, 1, 1,
1.014841, -2.061043, 2.013223, 1, 1, 1, 1, 1,
1.02117, 1.602368, 0.4408712, 1, 1, 1, 1, 1,
1.026657, 0.01618634, 2.465589, 1, 1, 1, 1, 1,
1.029429, 1.574735, 1.988913, 1, 1, 1, 1, 1,
1.033312, 0.1087963, 1.584818, 1, 1, 1, 1, 1,
1.040689, 0.7821143, 1.130524, 1, 1, 1, 1, 1,
1.044297, 0.1831174, 2.447543, 1, 1, 1, 1, 1,
1.051945, 0.9835084, 1.884355, 1, 1, 1, 1, 1,
1.052404, 1.174334, 2.489715, 1, 1, 1, 1, 1,
1.052898, 0.8458515, -0.2479517, 1, 1, 1, 1, 1,
1.053536, -0.6764776, 1.384151, 1, 1, 1, 1, 1,
1.054901, -0.8297421, 5.125992, 0, 0, 1, 1, 1,
1.067396, 0.3970132, -0.2378146, 1, 0, 0, 1, 1,
1.072189, 1.629591, 2.925245, 1, 0, 0, 1, 1,
1.075728, 0.4091906, 0.2445553, 1, 0, 0, 1, 1,
1.078042, 0.8297803, 2.268741, 1, 0, 0, 1, 1,
1.080953, 1.025644, 0.707638, 1, 0, 0, 1, 1,
1.087129, 0.07392059, 3.269481, 0, 0, 0, 1, 1,
1.087734, -0.4261012, 1.191579, 0, 0, 0, 1, 1,
1.088979, 1.189081, -0.4690465, 0, 0, 0, 1, 1,
1.091414, 0.1970331, -0.7815825, 0, 0, 0, 1, 1,
1.095971, 0.1784317, 1.133791, 0, 0, 0, 1, 1,
1.117909, -2.766227, 3.093001, 0, 0, 0, 1, 1,
1.140411, 0.2057959, 3.978641, 0, 0, 0, 1, 1,
1.143729, 0.4319674, -0.8659462, 1, 1, 1, 1, 1,
1.152746, -2.736016, 3.16739, 1, 1, 1, 1, 1,
1.156033, 0.1454151, 1.399464, 1, 1, 1, 1, 1,
1.176532, -0.5574805, 1.751338, 1, 1, 1, 1, 1,
1.182143, -0.8092169, 2.349333, 1, 1, 1, 1, 1,
1.191479, 0.358167, 1.628118, 1, 1, 1, 1, 1,
1.193072, 0.2173764, 1.357671, 1, 1, 1, 1, 1,
1.194681, -0.9597998, 0.9168366, 1, 1, 1, 1, 1,
1.199059, 0.5068922, 0.3372106, 1, 1, 1, 1, 1,
1.200824, -0.04222228, 2.063776, 1, 1, 1, 1, 1,
1.202291, -0.009723295, 0.02415115, 1, 1, 1, 1, 1,
1.210806, 1.087192, 2.04133, 1, 1, 1, 1, 1,
1.211124, -0.6357248, 1.209546, 1, 1, 1, 1, 1,
1.212615, -0.7869442, 2.513737, 1, 1, 1, 1, 1,
1.214897, -0.9607711, 4.123257, 1, 1, 1, 1, 1,
1.217269, -0.0217735, 0.7701671, 0, 0, 1, 1, 1,
1.227422, -0.1296447, 4.106189, 1, 0, 0, 1, 1,
1.23337, 0.3054476, 0.6349674, 1, 0, 0, 1, 1,
1.236742, 0.7607277, 2.694787, 1, 0, 0, 1, 1,
1.242709, 0.9178531, 2.932795, 1, 0, 0, 1, 1,
1.244517, -0.4287405, 3.783038, 1, 0, 0, 1, 1,
1.245969, -1.642683, 2.429898, 0, 0, 0, 1, 1,
1.249122, 1.795341, 0.6730344, 0, 0, 0, 1, 1,
1.251476, -1.451471, 3.509608, 0, 0, 0, 1, 1,
1.25485, -0.5667719, 1.623178, 0, 0, 0, 1, 1,
1.255828, 0.1217681, 1.163973, 0, 0, 0, 1, 1,
1.256139, 0.04008, 0.5689601, 0, 0, 0, 1, 1,
1.257613, -0.0314214, 3.547841, 0, 0, 0, 1, 1,
1.257707, -1.381334, 2.090704, 1, 1, 1, 1, 1,
1.267434, 0.3256624, 0.4013573, 1, 1, 1, 1, 1,
1.271515, -1.802172, 2.763387, 1, 1, 1, 1, 1,
1.276112, 0.2115023, 3.41392, 1, 1, 1, 1, 1,
1.278985, 0.8948244, 2.104964, 1, 1, 1, 1, 1,
1.280334, -0.1134595, 0.123576, 1, 1, 1, 1, 1,
1.287516, -0.893344, 2.726515, 1, 1, 1, 1, 1,
1.296367, -0.329262, 2.202267, 1, 1, 1, 1, 1,
1.304695, -1.255525, 2.787994, 1, 1, 1, 1, 1,
1.307122, -1.549863, 2.462396, 1, 1, 1, 1, 1,
1.309059, -0.9184669, 1.734758, 1, 1, 1, 1, 1,
1.310338, -0.8601574, 1.271443, 1, 1, 1, 1, 1,
1.310879, 0.2714937, 1.14144, 1, 1, 1, 1, 1,
1.324859, 0.3137534, 0.8620296, 1, 1, 1, 1, 1,
1.331658, 1.231412, -0.3074872, 1, 1, 1, 1, 1,
1.332179, 0.3210091, 1.926086, 0, 0, 1, 1, 1,
1.347389, -0.2473415, 1.202197, 1, 0, 0, 1, 1,
1.347989, -0.8849747, 2.21658, 1, 0, 0, 1, 1,
1.349674, -0.3223027, 1.881205, 1, 0, 0, 1, 1,
1.364613, 1.25566, 1.498506, 1, 0, 0, 1, 1,
1.372062, 1.540271, 0.7928329, 1, 0, 0, 1, 1,
1.382569, -0.1993279, 1.226429, 0, 0, 0, 1, 1,
1.386343, -1.464702, 1.66912, 0, 0, 0, 1, 1,
1.387636, 0.3043097, 1.362982, 0, 0, 0, 1, 1,
1.402978, 0.6593884, 2.256863, 0, 0, 0, 1, 1,
1.405925, -1.622978, 2.619078, 0, 0, 0, 1, 1,
1.407206, 1.163592, 1.89836, 0, 0, 0, 1, 1,
1.408203, -1.441911, 1.696254, 0, 0, 0, 1, 1,
1.409412, -0.212147, 0.7493265, 1, 1, 1, 1, 1,
1.417044, 0.5389038, 2.453139, 1, 1, 1, 1, 1,
1.423171, -0.4024362, 2.845884, 1, 1, 1, 1, 1,
1.423418, 0.8710544, 1.799421, 1, 1, 1, 1, 1,
1.426565, 0.864022, 0.9605214, 1, 1, 1, 1, 1,
1.428457, -0.9597194, 2.85446, 1, 1, 1, 1, 1,
1.428679, -1.573647, 4.160386, 1, 1, 1, 1, 1,
1.443523, 0.6350565, 2.059671, 1, 1, 1, 1, 1,
1.446759, -0.2362824, -0.2213454, 1, 1, 1, 1, 1,
1.449704, 0.2301734, 1.504387, 1, 1, 1, 1, 1,
1.455599, 1.287463, 1.484553, 1, 1, 1, 1, 1,
1.457986, -0.7267017, 1.176571, 1, 1, 1, 1, 1,
1.464014, 0.5601522, 1.682527, 1, 1, 1, 1, 1,
1.468128, 0.1802701, -0.2508846, 1, 1, 1, 1, 1,
1.468152, 1.044403, 1.323854, 1, 1, 1, 1, 1,
1.480273, -0.2715472, 2.598001, 0, 0, 1, 1, 1,
1.491533, 0.02965433, 2.056783, 1, 0, 0, 1, 1,
1.494702, -1.727161, 2.928137, 1, 0, 0, 1, 1,
1.497057, -0.3488624, 2.230271, 1, 0, 0, 1, 1,
1.504559, -0.8479695, 2.230438, 1, 0, 0, 1, 1,
1.50624, 0.8825639, 1.017212, 1, 0, 0, 1, 1,
1.510384, -0.6648074, 2.474193, 0, 0, 0, 1, 1,
1.521498, -0.5326899, 1.681921, 0, 0, 0, 1, 1,
1.528135, 1.993508, 0.005262054, 0, 0, 0, 1, 1,
1.532147, -0.2089788, 3.253619, 0, 0, 0, 1, 1,
1.533767, 0.4682219, 2.502913, 0, 0, 0, 1, 1,
1.545698, 1.531262, -0.4377331, 0, 0, 0, 1, 1,
1.553009, 1.545831, 2.66425, 0, 0, 0, 1, 1,
1.586515, 0.2285235, 2.70868, 1, 1, 1, 1, 1,
1.587578, -0.8414961, 1.254837, 1, 1, 1, 1, 1,
1.592015, 0.9923703, 0.8393104, 1, 1, 1, 1, 1,
1.598555, 0.8673097, 3.568257, 1, 1, 1, 1, 1,
1.619727, 0.3693832, 2.174713, 1, 1, 1, 1, 1,
1.626266, -1.024964, 1.999485, 1, 1, 1, 1, 1,
1.627268, 0.009036713, 3.155208, 1, 1, 1, 1, 1,
1.632117, 0.2092617, 0.9565116, 1, 1, 1, 1, 1,
1.632239, -1.143334, 3.041227, 1, 1, 1, 1, 1,
1.653506, 0.3519613, 1.736845, 1, 1, 1, 1, 1,
1.663184, -2.113464, 3.3388, 1, 1, 1, 1, 1,
1.664526, 0.1026133, 1.085734, 1, 1, 1, 1, 1,
1.666937, -1.016434, 2.93286, 1, 1, 1, 1, 1,
1.675665, 0.4980094, 1.689776, 1, 1, 1, 1, 1,
1.688144, 0.5340807, 0.8139938, 1, 1, 1, 1, 1,
1.689633, 0.7043908, 1.730212, 0, 0, 1, 1, 1,
1.693806, 1.926532, 0.7968972, 1, 0, 0, 1, 1,
1.73139, 0.8541768, -1.563012, 1, 0, 0, 1, 1,
1.7607, -0.1011574, 0.9852545, 1, 0, 0, 1, 1,
1.762559, 0.3624685, -0.5851816, 1, 0, 0, 1, 1,
1.800109, -0.6775877, 3.117451, 1, 0, 0, 1, 1,
1.811153, -2.504324, 3.40638, 0, 0, 0, 1, 1,
1.840805, 0.03512891, 1.356939, 0, 0, 0, 1, 1,
1.861565, -0.4523829, 2.140268, 0, 0, 0, 1, 1,
1.865266, -0.6648351, 1.315798, 0, 0, 0, 1, 1,
1.876782, 0.09947471, 0.2276223, 0, 0, 0, 1, 1,
1.890244, -0.2106177, 1.646776, 0, 0, 0, 1, 1,
1.892275, -0.3620211, 2.5131, 0, 0, 0, 1, 1,
1.893163, 1.289636, -0.5406836, 1, 1, 1, 1, 1,
1.897018, 0.1315485, 1.92265, 1, 1, 1, 1, 1,
1.919629, 0.7667909, -1.30498, 1, 1, 1, 1, 1,
1.936579, -0.462638, 2.877784, 1, 1, 1, 1, 1,
1.939064, 0.4571961, 0.4998793, 1, 1, 1, 1, 1,
1.960873, -0.3024947, 3.055264, 1, 1, 1, 1, 1,
1.973578, 1.565056, 0.3363915, 1, 1, 1, 1, 1,
1.983573, -0.9546924, 3.08588, 1, 1, 1, 1, 1,
1.988859, 0.6961377, 1.18061, 1, 1, 1, 1, 1,
1.996371, -1.137673, 3.132158, 1, 1, 1, 1, 1,
2.003141, -0.3196021, 0.4355582, 1, 1, 1, 1, 1,
2.049742, -1.4288, 3.31553, 1, 1, 1, 1, 1,
2.116408, -1.027636, 1.677262, 1, 1, 1, 1, 1,
2.133953, 1.196293, 1.333634, 1, 1, 1, 1, 1,
2.167104, -0.01252321, 0.960013, 1, 1, 1, 1, 1,
2.181771, -0.1581117, 1.935101, 0, 0, 1, 1, 1,
2.182251, 0.1732495, 0.6652019, 1, 0, 0, 1, 1,
2.212809, 2.192416, 1.48205, 1, 0, 0, 1, 1,
2.217087, 1.245866, -0.4122264, 1, 0, 0, 1, 1,
2.233674, -0.5672442, 2.326928, 1, 0, 0, 1, 1,
2.255887, -0.2396016, 2.225946, 1, 0, 0, 1, 1,
2.258953, -0.4530622, 0.9510352, 0, 0, 0, 1, 1,
2.288667, -0.07347356, 4.24074, 0, 0, 0, 1, 1,
2.299841, 0.9804245, -0.3581581, 0, 0, 0, 1, 1,
2.363722, 1.604654, 1.168607, 0, 0, 0, 1, 1,
2.468177, -0.02100863, 0.7718903, 0, 0, 0, 1, 1,
2.473288, -0.5867472, 1.949353, 0, 0, 0, 1, 1,
2.504287, 0.1406258, 1.244441, 0, 0, 0, 1, 1,
2.625013, 0.4282607, 2.543204, 1, 1, 1, 1, 1,
2.642314, 1.103421, 1.06927, 1, 1, 1, 1, 1,
2.730257, -1.454157, 3.46993, 1, 1, 1, 1, 1,
2.735838, 1.231309, 1.38542, 1, 1, 1, 1, 1,
2.737855, 0.0243727, 0.7936357, 1, 1, 1, 1, 1,
3.185977, 0.1395233, 1.108983, 1, 1, 1, 1, 1,
3.761852, -0.1933833, 0.3227377, 1, 1, 1, 1, 1
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
var radius = 9.578735;
var distance = 33.6449;
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
mvMatrix.translate( -0.3019083, -0.03894472, 0.04109025 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6449);
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
