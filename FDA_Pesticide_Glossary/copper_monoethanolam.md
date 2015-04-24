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
-2.856448, 2.719155, -0.01606693, 1, 0, 0, 1,
-2.735984, -1.632301, -3.048718, 1, 0.007843138, 0, 1,
-2.725849, 0.5139582, -1.916662, 1, 0.01176471, 0, 1,
-2.677006, 0.6520109, -1.030099, 1, 0.01960784, 0, 1,
-2.587016, 0.2675804, -2.457808, 1, 0.02352941, 0, 1,
-2.565378, -0.4654621, -1.99002, 1, 0.03137255, 0, 1,
-2.450084, 1.927154, 0.6425182, 1, 0.03529412, 0, 1,
-2.436485, 0.2296371, -1.684287, 1, 0.04313726, 0, 1,
-2.335706, -0.9226719, -2.556973, 1, 0.04705882, 0, 1,
-2.319966, 1.784311, -2.075124, 1, 0.05490196, 0, 1,
-2.310201, 0.3993237, -1.824891, 1, 0.05882353, 0, 1,
-2.279278, 0.5190119, -0.6041216, 1, 0.06666667, 0, 1,
-2.272772, -0.1531801, -1.646079, 1, 0.07058824, 0, 1,
-2.269854, -0.2523501, -2.675018, 1, 0.07843138, 0, 1,
-2.245658, -1.109291, -1.076622, 1, 0.08235294, 0, 1,
-2.208944, 0.37086, -1.253878, 1, 0.09019608, 0, 1,
-2.197463, 2.892442, -1.662542, 1, 0.09411765, 0, 1,
-2.122624, -1.133122, -2.231278, 1, 0.1019608, 0, 1,
-2.092767, 1.084264, -1.038767, 1, 0.1098039, 0, 1,
-2.059011, 0.07583099, -0.1590789, 1, 0.1137255, 0, 1,
-2.0487, -0.0444653, -1.107029, 1, 0.1215686, 0, 1,
-2.041754, -0.9656994, -0.7973072, 1, 0.1254902, 0, 1,
-2.035354, -1.287548, -0.9096544, 1, 0.1333333, 0, 1,
-2.022175, -0.9377148, -1.93562, 1, 0.1372549, 0, 1,
-2.015482, -0.6387126, -0.7866052, 1, 0.145098, 0, 1,
-2.002948, 1.045976, -0.03544604, 1, 0.1490196, 0, 1,
-1.965869, -0.03301928, -1.531207, 1, 0.1568628, 0, 1,
-1.961392, 0.4997171, -2.580712, 1, 0.1607843, 0, 1,
-1.94976, 0.1371678, -2.16849, 1, 0.1686275, 0, 1,
-1.939649, 1.281649, -0.1093339, 1, 0.172549, 0, 1,
-1.927477, 0.8364462, 0.8495355, 1, 0.1803922, 0, 1,
-1.913932, 0.840646, -1.573625, 1, 0.1843137, 0, 1,
-1.890814, -0.8025922, -1.671183, 1, 0.1921569, 0, 1,
-1.850972, -1.475514, -0.6129156, 1, 0.1960784, 0, 1,
-1.8215, -0.165239, -2.527202, 1, 0.2039216, 0, 1,
-1.813439, -0.01841514, -0.8334806, 1, 0.2117647, 0, 1,
-1.805683, -0.09071268, -2.255869, 1, 0.2156863, 0, 1,
-1.792095, 0.7848814, -1.779385, 1, 0.2235294, 0, 1,
-1.776708, 2.016943, 0.3215158, 1, 0.227451, 0, 1,
-1.762858, -1.598382, -0.7858373, 1, 0.2352941, 0, 1,
-1.749087, -0.4337666, -1.982028, 1, 0.2392157, 0, 1,
-1.745744, -0.599356, -2.61052, 1, 0.2470588, 0, 1,
-1.728175, 0.006856455, -0.4830897, 1, 0.2509804, 0, 1,
-1.721111, -0.05606391, -1.687525, 1, 0.2588235, 0, 1,
-1.703085, 0.138241, -1.377561, 1, 0.2627451, 0, 1,
-1.696807, 0.5504832, -1.654654, 1, 0.2705882, 0, 1,
-1.693808, -0.781762, -1.191306, 1, 0.2745098, 0, 1,
-1.689573, 1.404884, -0.5793627, 1, 0.282353, 0, 1,
-1.679432, -0.3776779, -2.757711, 1, 0.2862745, 0, 1,
-1.678664, -2.244219, -5.827843, 1, 0.2941177, 0, 1,
-1.664933, -0.08316789, -2.624849, 1, 0.3019608, 0, 1,
-1.654823, 0.5813748, -0.08667, 1, 0.3058824, 0, 1,
-1.650692, 0.7567487, -2.063241, 1, 0.3137255, 0, 1,
-1.586976, 1.659165, -0.03892556, 1, 0.3176471, 0, 1,
-1.575444, 0.1724206, 0.299052, 1, 0.3254902, 0, 1,
-1.54553, 0.778743, -0.9059424, 1, 0.3294118, 0, 1,
-1.535557, 0.4671642, -1.578133, 1, 0.3372549, 0, 1,
-1.520256, 1.364229, -0.8516119, 1, 0.3411765, 0, 1,
-1.520032, 1.21092, -0.2597923, 1, 0.3490196, 0, 1,
-1.516375, -0.06919438, -3.310771, 1, 0.3529412, 0, 1,
-1.51316, 0.44429, -1.923262, 1, 0.3607843, 0, 1,
-1.494057, 0.5116668, -1.260301, 1, 0.3647059, 0, 1,
-1.485386, 0.5906025, -2.176278, 1, 0.372549, 0, 1,
-1.483859, 0.3535812, -2.023386, 1, 0.3764706, 0, 1,
-1.483041, 0.02895525, -1.599421, 1, 0.3843137, 0, 1,
-1.482824, 1.046103, -0.09471682, 1, 0.3882353, 0, 1,
-1.481222, -0.2495083, -0.778068, 1, 0.3960784, 0, 1,
-1.475605, 0.6806661, 0.4113502, 1, 0.4039216, 0, 1,
-1.471919, 0.4490517, -1.645416, 1, 0.4078431, 0, 1,
-1.434045, -2.054182, -2.780635, 1, 0.4156863, 0, 1,
-1.433755, -0.1601335, -0.7835273, 1, 0.4196078, 0, 1,
-1.431708, 0.5564035, -2.438113, 1, 0.427451, 0, 1,
-1.420214, 2.070709, 0.4722243, 1, 0.4313726, 0, 1,
-1.415747, 0.9556321, -1.328237, 1, 0.4392157, 0, 1,
-1.407308, -0.8979749, -3.027385, 1, 0.4431373, 0, 1,
-1.406407, 0.4511622, -1.421706, 1, 0.4509804, 0, 1,
-1.405925, -1.008375, -2.182667, 1, 0.454902, 0, 1,
-1.404967, 0.6090892, -1.135906, 1, 0.4627451, 0, 1,
-1.385232, 0.3810653, 1.180292, 1, 0.4666667, 0, 1,
-1.382078, -0.988924, -2.137556, 1, 0.4745098, 0, 1,
-1.381902, -0.5621153, -1.977104, 1, 0.4784314, 0, 1,
-1.381537, 1.151241, -1.356563, 1, 0.4862745, 0, 1,
-1.378394, 1.504237, 0.3250796, 1, 0.4901961, 0, 1,
-1.367402, 0.1833328, -2.312395, 1, 0.4980392, 0, 1,
-1.366616, -1.146843, -1.940346, 1, 0.5058824, 0, 1,
-1.366214, -0.611604, -1.426762, 1, 0.509804, 0, 1,
-1.365686, 1.494189, -2.063902, 1, 0.5176471, 0, 1,
-1.364418, 0.5104614, -0.7931845, 1, 0.5215687, 0, 1,
-1.354748, -2.511614, -4.295821, 1, 0.5294118, 0, 1,
-1.344759, -0.4772756, -3.679351, 1, 0.5333334, 0, 1,
-1.328769, 1.496522, -1.519218, 1, 0.5411765, 0, 1,
-1.323585, -0.6878843, -1.663599, 1, 0.5450981, 0, 1,
-1.323481, -0.4201798, -1.790733, 1, 0.5529412, 0, 1,
-1.318441, -0.9952773, -4.823065, 1, 0.5568628, 0, 1,
-1.318017, 0.7259416, -1.905774, 1, 0.5647059, 0, 1,
-1.311145, 0.9125258, 0.01982511, 1, 0.5686275, 0, 1,
-1.304024, -0.1151245, -1.888499, 1, 0.5764706, 0, 1,
-1.303508, 1.849426, 0.5170681, 1, 0.5803922, 0, 1,
-1.292576, -1.24502, -2.665519, 1, 0.5882353, 0, 1,
-1.274254, 0.2741763, -0.178216, 1, 0.5921569, 0, 1,
-1.267215, 0.003415153, 0.284685, 1, 0.6, 0, 1,
-1.263053, 0.8007607, -1.275952, 1, 0.6078432, 0, 1,
-1.25748, 0.2599016, -2.054772, 1, 0.6117647, 0, 1,
-1.252623, 2.177012, -1.035674, 1, 0.6196079, 0, 1,
-1.237313, -0.3946175, -1.947709, 1, 0.6235294, 0, 1,
-1.233848, 0.2696846, -1.531453, 1, 0.6313726, 0, 1,
-1.226895, -2.043839, -1.305931, 1, 0.6352941, 0, 1,
-1.2246, 0.1156742, -1.558383, 1, 0.6431373, 0, 1,
-1.223879, -1.415218, -3.065722, 1, 0.6470588, 0, 1,
-1.223474, -1.764531, -1.322692, 1, 0.654902, 0, 1,
-1.220814, -0.3728989, -2.077665, 1, 0.6588235, 0, 1,
-1.211512, -1.167661, -2.838629, 1, 0.6666667, 0, 1,
-1.210945, 1.404039, -0.4568073, 1, 0.6705883, 0, 1,
-1.209221, 0.6595188, -0.06151917, 1, 0.6784314, 0, 1,
-1.204722, -0.7628258, -2.156497, 1, 0.682353, 0, 1,
-1.194356, 0.515191, -1.397748, 1, 0.6901961, 0, 1,
-1.189377, -1.373236, -3.514045, 1, 0.6941177, 0, 1,
-1.185241, 0.1544053, -0.7054659, 1, 0.7019608, 0, 1,
-1.183858, 1.811447, 1.133528, 1, 0.7098039, 0, 1,
-1.175665, -0.7507467, -2.769797, 1, 0.7137255, 0, 1,
-1.175072, 0.6165357, -0.4982912, 1, 0.7215686, 0, 1,
-1.172819, 2.579824, -1.61789, 1, 0.7254902, 0, 1,
-1.165402, 1.013926, -1.661211, 1, 0.7333333, 0, 1,
-1.161131, 1.902558, -0.5720248, 1, 0.7372549, 0, 1,
-1.154246, 0.5240979, -0.4345216, 1, 0.7450981, 0, 1,
-1.152316, -0.1240019, -0.749727, 1, 0.7490196, 0, 1,
-1.150487, -0.4232939, -3.526878, 1, 0.7568628, 0, 1,
-1.14423, 0.5357614, -0.4845522, 1, 0.7607843, 0, 1,
-1.134931, -0.7580984, -3.384861, 1, 0.7686275, 0, 1,
-1.127185, -1.604198, -1.186683, 1, 0.772549, 0, 1,
-1.124351, 1.145175, -1.080642, 1, 0.7803922, 0, 1,
-1.119299, 0.1091693, -3.231333, 1, 0.7843137, 0, 1,
-1.118872, -0.06429961, -2.861941, 1, 0.7921569, 0, 1,
-1.116242, 0.6797315, -2.285781, 1, 0.7960784, 0, 1,
-1.113673, -2.179286, -1.922295, 1, 0.8039216, 0, 1,
-1.103629, -2.0504, -1.156828, 1, 0.8117647, 0, 1,
-1.099609, -0.6557871, -2.882304, 1, 0.8156863, 0, 1,
-1.093188, 0.4853643, -1.555023, 1, 0.8235294, 0, 1,
-1.085415, 1.437001, -0.8036131, 1, 0.827451, 0, 1,
-1.082536, -0.6317982, -1.925485, 1, 0.8352941, 0, 1,
-1.081186, -0.7980954, -1.366632, 1, 0.8392157, 0, 1,
-1.079103, -1.56123, -1.956965, 1, 0.8470588, 0, 1,
-1.076858, -1.006604, -2.87283, 1, 0.8509804, 0, 1,
-1.071608, -0.4746346, -0.1819229, 1, 0.8588235, 0, 1,
-1.067762, -0.3714963, -2.2234, 1, 0.8627451, 0, 1,
-1.063745, -0.06009668, -1.930264, 1, 0.8705882, 0, 1,
-1.062186, -0.4024664, -2.381829, 1, 0.8745098, 0, 1,
-1.054771, 0.4865774, 0.2415816, 1, 0.8823529, 0, 1,
-1.053092, -0.4397022, 0.3439772, 1, 0.8862745, 0, 1,
-1.04546, -0.3891286, -1.154441, 1, 0.8941177, 0, 1,
-1.043276, 0.2745534, -0.6977593, 1, 0.8980392, 0, 1,
-1.037711, 0.5241039, -1.034974, 1, 0.9058824, 0, 1,
-1.023209, 0.3964536, 0.4209756, 1, 0.9137255, 0, 1,
-1.009985, 0.4053646, -2.404279, 1, 0.9176471, 0, 1,
-1.006492, -0.7650322, -2.725241, 1, 0.9254902, 0, 1,
-1.000115, -0.5271838, -3.271191, 1, 0.9294118, 0, 1,
-0.9998884, -0.1380858, -0.9198853, 1, 0.9372549, 0, 1,
-0.9984176, 0.8571372, -0.5033625, 1, 0.9411765, 0, 1,
-0.9979709, -0.7150455, -2.533142, 1, 0.9490196, 0, 1,
-0.9832315, -1.10521, -3.510183, 1, 0.9529412, 0, 1,
-0.9735883, -0.9785745, -1.443642, 1, 0.9607843, 0, 1,
-0.9664187, 0.3052811, -2.114966, 1, 0.9647059, 0, 1,
-0.9657658, 0.402087, 1.434932, 1, 0.972549, 0, 1,
-0.9605292, 0.1516309, -0.9850928, 1, 0.9764706, 0, 1,
-0.9474558, 1.730903, 0.610607, 1, 0.9843137, 0, 1,
-0.9473358, 1.075457, 0.04959094, 1, 0.9882353, 0, 1,
-0.9424036, -1.293223, -0.7347285, 1, 0.9960784, 0, 1,
-0.9395854, 0.6009709, 0.424661, 0.9960784, 1, 0, 1,
-0.9313687, -0.5287963, -2.628466, 0.9921569, 1, 0, 1,
-0.9207078, 0.00345475, -2.85012, 0.9843137, 1, 0, 1,
-0.9187987, 0.8518237, -0.7694317, 0.9803922, 1, 0, 1,
-0.9175977, 1.360228, 0.7937498, 0.972549, 1, 0, 1,
-0.9120807, 0.07494015, -1.297858, 0.9686275, 1, 0, 1,
-0.9087472, -0.01158935, 0.9217746, 0.9607843, 1, 0, 1,
-0.9084731, -1.506036, -3.107737, 0.9568627, 1, 0, 1,
-0.9074425, -1.14664, -2.008973, 0.9490196, 1, 0, 1,
-0.8977255, -1.75531, -4.441841, 0.945098, 1, 0, 1,
-0.8953744, -0.3212827, -0.501378, 0.9372549, 1, 0, 1,
-0.8935751, -0.2056596, -1.248402, 0.9333333, 1, 0, 1,
-0.8901162, -1.067122, -1.962995, 0.9254902, 1, 0, 1,
-0.8875656, 1.944061, -1.341206, 0.9215686, 1, 0, 1,
-0.8852686, -0.1130169, -1.179466, 0.9137255, 1, 0, 1,
-0.8823501, 0.923917, -1.200972, 0.9098039, 1, 0, 1,
-0.8819776, -1.446282, -2.20801, 0.9019608, 1, 0, 1,
-0.8775753, 0.3238651, -0.0960768, 0.8941177, 1, 0, 1,
-0.8738539, 1.625681, 0.1538616, 0.8901961, 1, 0, 1,
-0.8715209, -1.606945, -3.333528, 0.8823529, 1, 0, 1,
-0.8706257, 0.4145948, -0.5874434, 0.8784314, 1, 0, 1,
-0.862745, -1.540784, -2.287863, 0.8705882, 1, 0, 1,
-0.8551782, 1.743796, -0.2421276, 0.8666667, 1, 0, 1,
-0.8524827, 0.849026, -1.91662, 0.8588235, 1, 0, 1,
-0.851609, -1.874084, -3.236751, 0.854902, 1, 0, 1,
-0.8506521, -0.5942018, -1.974682, 0.8470588, 1, 0, 1,
-0.8436368, 0.7012834, -1.134683, 0.8431373, 1, 0, 1,
-0.8317457, -0.7792761, -2.876213, 0.8352941, 1, 0, 1,
-0.8283771, 1.116621, -1.044717, 0.8313726, 1, 0, 1,
-0.8241482, -1.608833, -3.279388, 0.8235294, 1, 0, 1,
-0.8206126, -0.2018797, -0.9107433, 0.8196079, 1, 0, 1,
-0.8162028, 0.1512008, 0.3717525, 0.8117647, 1, 0, 1,
-0.8153452, -0.4834423, -2.905129, 0.8078431, 1, 0, 1,
-0.8141357, 0.592353, -0.6494861, 0.8, 1, 0, 1,
-0.8076481, -0.3188735, -2.311222, 0.7921569, 1, 0, 1,
-0.8022352, -0.2991905, -1.90602, 0.7882353, 1, 0, 1,
-0.79941, 1.070932, -1.851219, 0.7803922, 1, 0, 1,
-0.7980878, -1.040789, -2.57205, 0.7764706, 1, 0, 1,
-0.7973477, -0.6196175, -1.440785, 0.7686275, 1, 0, 1,
-0.7965087, 1.026778, -0.6586767, 0.7647059, 1, 0, 1,
-0.7963578, 1.961516, -1.275619, 0.7568628, 1, 0, 1,
-0.791926, -0.5665838, -2.988224, 0.7529412, 1, 0, 1,
-0.7892131, 0.9990126, -2.324609, 0.7450981, 1, 0, 1,
-0.7891007, 1.014425, -1.361506, 0.7411765, 1, 0, 1,
-0.7870041, 1.045546, -2.372379, 0.7333333, 1, 0, 1,
-0.7835935, -1.309439, -2.974377, 0.7294118, 1, 0, 1,
-0.7755272, -0.7176859, -3.684108, 0.7215686, 1, 0, 1,
-0.773037, -1.257149, -2.943666, 0.7176471, 1, 0, 1,
-0.7706314, 1.069309, -1.39146, 0.7098039, 1, 0, 1,
-0.7632505, 0.1076757, 0.0833522, 0.7058824, 1, 0, 1,
-0.7582828, 0.05389613, -2.104636, 0.6980392, 1, 0, 1,
-0.7580629, -0.687628, -1.723541, 0.6901961, 1, 0, 1,
-0.7549536, -0.04558032, -3.408601, 0.6862745, 1, 0, 1,
-0.7390355, -0.2704392, -1.064944, 0.6784314, 1, 0, 1,
-0.7381778, -0.4885311, -3.127149, 0.6745098, 1, 0, 1,
-0.7374044, 1.23945, 2.534168, 0.6666667, 1, 0, 1,
-0.7356507, -0.09933472, 0.9526611, 0.6627451, 1, 0, 1,
-0.734983, 1.693555, -0.9691561, 0.654902, 1, 0, 1,
-0.733759, 0.4296695, -2.012824, 0.6509804, 1, 0, 1,
-0.7191133, -1.704475, -3.907644, 0.6431373, 1, 0, 1,
-0.7189835, 0.9757359, 1.358312, 0.6392157, 1, 0, 1,
-0.718244, -2.252484, -0.3013565, 0.6313726, 1, 0, 1,
-0.7119246, -2.609632, -3.652903, 0.627451, 1, 0, 1,
-0.708612, -1.644014, -1.965398, 0.6196079, 1, 0, 1,
-0.7062068, 1.997896, 0.09623165, 0.6156863, 1, 0, 1,
-0.7036882, -1.960972, -2.081587, 0.6078432, 1, 0, 1,
-0.7006607, -0.8416043, -4.710148, 0.6039216, 1, 0, 1,
-0.6985366, 1.103988, -1.018802, 0.5960785, 1, 0, 1,
-0.6898312, 0.8862776, -0.9610773, 0.5882353, 1, 0, 1,
-0.6855053, -1.123149, -1.57164, 0.5843138, 1, 0, 1,
-0.6844217, 0.3817788, -2.297494, 0.5764706, 1, 0, 1,
-0.6810521, -2.017427, -3.29486, 0.572549, 1, 0, 1,
-0.6794633, 1.652605, 0.2589017, 0.5647059, 1, 0, 1,
-0.6792107, 0.7132169, -0.4423907, 0.5607843, 1, 0, 1,
-0.6724424, 1.425263, 0.7872469, 0.5529412, 1, 0, 1,
-0.6695195, 0.370022, 0.6380302, 0.5490196, 1, 0, 1,
-0.6627037, -1.033722, -1.38183, 0.5411765, 1, 0, 1,
-0.6621218, 1.290932, -0.3712288, 0.5372549, 1, 0, 1,
-0.6563493, 0.08761127, -1.727132, 0.5294118, 1, 0, 1,
-0.6510399, 1.477137, -2.111937, 0.5254902, 1, 0, 1,
-0.648899, 0.9064729, -1.10964, 0.5176471, 1, 0, 1,
-0.6361998, -0.8661717, -1.835723, 0.5137255, 1, 0, 1,
-0.6347336, 1.187172, 0.3021882, 0.5058824, 1, 0, 1,
-0.6302778, 0.5849763, -1.218861, 0.5019608, 1, 0, 1,
-0.6246622, -0.3447518, -1.854334, 0.4941176, 1, 0, 1,
-0.6169918, 0.6314541, 0.6383092, 0.4862745, 1, 0, 1,
-0.616466, -0.9100224, -2.589802, 0.4823529, 1, 0, 1,
-0.6124679, -0.1996563, -1.777497, 0.4745098, 1, 0, 1,
-0.6012395, -1.229377, -1.744056, 0.4705882, 1, 0, 1,
-0.6002566, -0.850696, -1.941869, 0.4627451, 1, 0, 1,
-0.5983183, -0.1555744, -0.1810375, 0.4588235, 1, 0, 1,
-0.5869949, -0.5295945, -3.27694, 0.4509804, 1, 0, 1,
-0.5771819, 0.8010758, 0.06453609, 0.4470588, 1, 0, 1,
-0.5734984, -1.576241, -3.430823, 0.4392157, 1, 0, 1,
-0.5726598, -0.8541886, -4.074265, 0.4352941, 1, 0, 1,
-0.5672184, -0.02723482, -1.896657, 0.427451, 1, 0, 1,
-0.5627143, 0.2344726, -1.297434, 0.4235294, 1, 0, 1,
-0.5606999, 1.248187, -1.246127, 0.4156863, 1, 0, 1,
-0.5596885, 1.037127, 0.1590264, 0.4117647, 1, 0, 1,
-0.5571206, 0.6642558, -0.09044749, 0.4039216, 1, 0, 1,
-0.5555134, -0.4017687, -2.007304, 0.3960784, 1, 0, 1,
-0.5542324, -1.268635, -4.978983, 0.3921569, 1, 0, 1,
-0.5540934, -0.2111665, -0.225007, 0.3843137, 1, 0, 1,
-0.5513939, -0.999756, 0.3369991, 0.3803922, 1, 0, 1,
-0.5482763, 0.4757823, -2.736073, 0.372549, 1, 0, 1,
-0.5474775, 1.166313, -0.5222151, 0.3686275, 1, 0, 1,
-0.5460801, -0.6075909, -1.941465, 0.3607843, 1, 0, 1,
-0.5325837, 0.120758, -1.09331, 0.3568628, 1, 0, 1,
-0.5282867, -0.4648338, -4.488507, 0.3490196, 1, 0, 1,
-0.5277038, -1.898299, -3.751798, 0.345098, 1, 0, 1,
-0.5253452, -0.4237972, -2.817727, 0.3372549, 1, 0, 1,
-0.521931, 0.152779, -2.218418, 0.3333333, 1, 0, 1,
-0.518318, 0.4923554, -0.9475845, 0.3254902, 1, 0, 1,
-0.5154171, -0.3199733, -2.146538, 0.3215686, 1, 0, 1,
-0.5146691, -0.2462319, -2.842022, 0.3137255, 1, 0, 1,
-0.5108361, -0.3687812, -1.321062, 0.3098039, 1, 0, 1,
-0.502543, 0.6711278, 0.1779308, 0.3019608, 1, 0, 1,
-0.4981211, -1.964559, -3.833988, 0.2941177, 1, 0, 1,
-0.495175, 0.2925939, -0.6450136, 0.2901961, 1, 0, 1,
-0.4931905, 0.8482152, -2.974071, 0.282353, 1, 0, 1,
-0.4894614, -1.26119, -2.75736, 0.2784314, 1, 0, 1,
-0.4846522, -0.2717564, -1.953872, 0.2705882, 1, 0, 1,
-0.4791239, 1.854248, -2.745227, 0.2666667, 1, 0, 1,
-0.4682452, -1.649098, -2.170985, 0.2588235, 1, 0, 1,
-0.4663776, -1.687216, -3.064629, 0.254902, 1, 0, 1,
-0.4576345, -0.1806773, -2.74097, 0.2470588, 1, 0, 1,
-0.4555298, 1.516856, -0.9040229, 0.2431373, 1, 0, 1,
-0.4435116, -1.181171, -4.319777, 0.2352941, 1, 0, 1,
-0.4399062, 0.006659382, -1.302463, 0.2313726, 1, 0, 1,
-0.4397415, 1.267892, 0.1113907, 0.2235294, 1, 0, 1,
-0.4372407, 0.1015177, -1.662374, 0.2196078, 1, 0, 1,
-0.4365592, -1.448491, -1.530003, 0.2117647, 1, 0, 1,
-0.4363558, 1.212661, -0.7303383, 0.2078431, 1, 0, 1,
-0.4291114, -0.8450893, -2.652394, 0.2, 1, 0, 1,
-0.4290708, -1.586723, -2.431498, 0.1921569, 1, 0, 1,
-0.4261684, 1.771124, -2.144252, 0.1882353, 1, 0, 1,
-0.4235184, -1.346066, -2.351393, 0.1803922, 1, 0, 1,
-0.4214861, -0.46526, -2.535225, 0.1764706, 1, 0, 1,
-0.4210092, 0.01383248, -1.157533, 0.1686275, 1, 0, 1,
-0.4198201, -1.36532, -1.756241, 0.1647059, 1, 0, 1,
-0.4165427, 0.9593268, -0.4755707, 0.1568628, 1, 0, 1,
-0.4146898, -1.104255, -2.371909, 0.1529412, 1, 0, 1,
-0.4050924, -2.081372, -0.5029011, 0.145098, 1, 0, 1,
-0.4044264, 0.3332736, -2.333729, 0.1411765, 1, 0, 1,
-0.4024244, 0.8767378, -1.968455, 0.1333333, 1, 0, 1,
-0.4005666, -1.919376, -1.599856, 0.1294118, 1, 0, 1,
-0.3999581, 1.000682, 0.4543093, 0.1215686, 1, 0, 1,
-0.3991787, 0.1585788, -0.8269924, 0.1176471, 1, 0, 1,
-0.396155, -0.6302499, -0.9063193, 0.1098039, 1, 0, 1,
-0.39455, -1.317476, -1.701846, 0.1058824, 1, 0, 1,
-0.3935831, -1.839946, -3.57413, 0.09803922, 1, 0, 1,
-0.3924828, -0.9170759, -3.073861, 0.09019608, 1, 0, 1,
-0.3917419, 1.222662, 0.01007932, 0.08627451, 1, 0, 1,
-0.3916161, 0.0462928, -2.316985, 0.07843138, 1, 0, 1,
-0.3907647, 0.2422017, -0.6283044, 0.07450981, 1, 0, 1,
-0.3899814, 0.3109832, -2.679258, 0.06666667, 1, 0, 1,
-0.3830303, 0.1400838, -2.507673, 0.0627451, 1, 0, 1,
-0.3794234, -0.8422185, -3.437265, 0.05490196, 1, 0, 1,
-0.3770647, -1.03046, -3.757994, 0.05098039, 1, 0, 1,
-0.3757594, 2.811713, 1.372062, 0.04313726, 1, 0, 1,
-0.3730375, 0.4629256, -0.878675, 0.03921569, 1, 0, 1,
-0.3699677, -1.072148, -1.390028, 0.03137255, 1, 0, 1,
-0.3692231, 0.1319845, -0.4522338, 0.02745098, 1, 0, 1,
-0.3626065, -1.491408, -0.8825426, 0.01960784, 1, 0, 1,
-0.3609265, -1.445416, -1.981793, 0.01568628, 1, 0, 1,
-0.3571066, -0.2007074, -2.236048, 0.007843138, 1, 0, 1,
-0.3534568, -0.2803778, -2.550312, 0.003921569, 1, 0, 1,
-0.3532876, -0.2820956, -2.790824, 0, 1, 0.003921569, 1,
-0.352073, -1.010474, -2.991704, 0, 1, 0.01176471, 1,
-0.347878, -1.378162, -3.735132, 0, 1, 0.01568628, 1,
-0.3447607, -0.5836753, -2.104306, 0, 1, 0.02352941, 1,
-0.3426839, 0.1311547, -1.156308, 0, 1, 0.02745098, 1,
-0.3425401, 0.2156243, 0.1001481, 0, 1, 0.03529412, 1,
-0.3425165, 1.036055, 0.8338929, 0, 1, 0.03921569, 1,
-0.3408458, -1.713272, -4.884197, 0, 1, 0.04705882, 1,
-0.3397535, 1.093664, -0.7838496, 0, 1, 0.05098039, 1,
-0.3367369, 0.7832338, 1.739622, 0, 1, 0.05882353, 1,
-0.3357976, -0.4075321, -4.170918, 0, 1, 0.0627451, 1,
-0.3340659, 0.9737516, 0.9030458, 0, 1, 0.07058824, 1,
-0.3251627, 0.4481263, -1.528542, 0, 1, 0.07450981, 1,
-0.324412, -2.614425, -2.565138, 0, 1, 0.08235294, 1,
-0.3226142, 1.443144, -0.4242464, 0, 1, 0.08627451, 1,
-0.3195545, -0.2492615, -3.354978, 0, 1, 0.09411765, 1,
-0.3191434, 0.1891583, -3.120331, 0, 1, 0.1019608, 1,
-0.3190932, -1.284474, -3.57965, 0, 1, 0.1058824, 1,
-0.3144327, 0.7729841, 0.6102705, 0, 1, 0.1137255, 1,
-0.3102685, -1.318231, -3.465753, 0, 1, 0.1176471, 1,
-0.3083414, 0.2463229, 1.005058, 0, 1, 0.1254902, 1,
-0.3062967, 0.6531203, -1.261454, 0, 1, 0.1294118, 1,
-0.2988103, -0.01152177, -2.29798, 0, 1, 0.1372549, 1,
-0.2974315, -0.4343745, -2.471905, 0, 1, 0.1411765, 1,
-0.2962359, -0.1566953, -0.7835332, 0, 1, 0.1490196, 1,
-0.295358, 1.097777, -2.139621, 0, 1, 0.1529412, 1,
-0.2934666, 0.8534797, 0.07020509, 0, 1, 0.1607843, 1,
-0.2856882, -0.3066841, -3.02424, 0, 1, 0.1647059, 1,
-0.2852683, 0.04559656, -2.152936, 0, 1, 0.172549, 1,
-0.2851263, -1.554846, -4.004827, 0, 1, 0.1764706, 1,
-0.2821235, 0.975361, -1.652725, 0, 1, 0.1843137, 1,
-0.2804368, 1.248445, -0.8971248, 0, 1, 0.1882353, 1,
-0.2786087, -1.067902, -0.9871261, 0, 1, 0.1960784, 1,
-0.2778618, 0.8675433, 2.330972, 0, 1, 0.2039216, 1,
-0.2746423, -2.130741, -1.427577, 0, 1, 0.2078431, 1,
-0.2743764, 0.1484421, -3.706665, 0, 1, 0.2156863, 1,
-0.2737768, 0.2779895, 0.5261384, 0, 1, 0.2196078, 1,
-0.2709601, -0.5674764, -2.748445, 0, 1, 0.227451, 1,
-0.2692716, -0.379508, -2.398551, 0, 1, 0.2313726, 1,
-0.2687076, -0.2514847, -1.234366, 0, 1, 0.2392157, 1,
-0.2638253, 1.412163, -0.4115113, 0, 1, 0.2431373, 1,
-0.2547408, -0.4803305, -3.176703, 0, 1, 0.2509804, 1,
-0.2538266, 0.05483448, -1.948786, 0, 1, 0.254902, 1,
-0.2504834, -1.157587, -4.845438, 0, 1, 0.2627451, 1,
-0.2477917, -0.5261225, -5.088456, 0, 1, 0.2666667, 1,
-0.246532, -0.9406687, -2.428668, 0, 1, 0.2745098, 1,
-0.2455275, -0.31849, -2.314341, 0, 1, 0.2784314, 1,
-0.2432526, 0.5486513, -1.371873, 0, 1, 0.2862745, 1,
-0.242084, -0.2052542, -3.714058, 0, 1, 0.2901961, 1,
-0.2417244, -1.003048, -3.341001, 0, 1, 0.2980392, 1,
-0.2357124, 0.7776685, -1.717769, 0, 1, 0.3058824, 1,
-0.2343637, 0.09726965, -1.047707, 0, 1, 0.3098039, 1,
-0.2306345, -0.3739952, -3.657434, 0, 1, 0.3176471, 1,
-0.2281854, 0.1618185, -1.911395, 0, 1, 0.3215686, 1,
-0.2281087, 0.7036539, -0.7946347, 0, 1, 0.3294118, 1,
-0.2178131, 0.4089583, 0.5371199, 0, 1, 0.3333333, 1,
-0.2118637, -1.925275, -3.880235, 0, 1, 0.3411765, 1,
-0.2099757, -0.660086, -3.693204, 0, 1, 0.345098, 1,
-0.2030309, -0.2558056, -3.046144, 0, 1, 0.3529412, 1,
-0.1991644, 0.3380387, 0.01544118, 0, 1, 0.3568628, 1,
-0.1983373, 0.4359336, -0.07830641, 0, 1, 0.3647059, 1,
-0.1931912, -0.7387577, -3.533119, 0, 1, 0.3686275, 1,
-0.1918935, 0.7181196, 0.1359215, 0, 1, 0.3764706, 1,
-0.1916675, -0.06107592, -1.237519, 0, 1, 0.3803922, 1,
-0.1915787, 1.061164, 0.8482605, 0, 1, 0.3882353, 1,
-0.1888464, -0.3520767, -2.687757, 0, 1, 0.3921569, 1,
-0.1852651, -0.8457995, -2.170094, 0, 1, 0.4, 1,
-0.1805217, 0.3759382, -0.4324676, 0, 1, 0.4078431, 1,
-0.1780267, 1.45831, 0.8778951, 0, 1, 0.4117647, 1,
-0.1770192, 0.2133894, -0.3333318, 0, 1, 0.4196078, 1,
-0.1736872, -0.6424566, -2.247947, 0, 1, 0.4235294, 1,
-0.1730375, 1.155831, 0.2447168, 0, 1, 0.4313726, 1,
-0.168865, 0.7844445, 0.8382936, 0, 1, 0.4352941, 1,
-0.1674456, -1.182614, -4.708612, 0, 1, 0.4431373, 1,
-0.167301, -1.073282, -4.411695, 0, 1, 0.4470588, 1,
-0.1666414, 0.1353781, -2.33043, 0, 1, 0.454902, 1,
-0.1634594, -0.9525597, -3.73266, 0, 1, 0.4588235, 1,
-0.1631322, -0.9826, -2.898639, 0, 1, 0.4666667, 1,
-0.1587285, -0.4820642, -4.040133, 0, 1, 0.4705882, 1,
-0.1565253, 0.8058298, 0.6303679, 0, 1, 0.4784314, 1,
-0.1557455, -1.241667, -3.933935, 0, 1, 0.4823529, 1,
-0.155496, -1.807861, -4.209929, 0, 1, 0.4901961, 1,
-0.1546936, 0.175166, -1.079386, 0, 1, 0.4941176, 1,
-0.1504036, 1.561361, 0.003340034, 0, 1, 0.5019608, 1,
-0.1481047, 1.119304, 0.1510388, 0, 1, 0.509804, 1,
-0.1449541, 0.08739124, -1.04651, 0, 1, 0.5137255, 1,
-0.1434605, -0.7107436, -3.084256, 0, 1, 0.5215687, 1,
-0.1401677, -0.2171912, -3.652879, 0, 1, 0.5254902, 1,
-0.139888, 1.112294, -0.003243318, 0, 1, 0.5333334, 1,
-0.1390625, 0.5601129, -1.707715, 0, 1, 0.5372549, 1,
-0.1360949, 1.456536, -1.104473, 0, 1, 0.5450981, 1,
-0.1343748, -1.367118, -3.32241, 0, 1, 0.5490196, 1,
-0.1340764, -0.2164248, -2.529214, 0, 1, 0.5568628, 1,
-0.1325688, -0.9275984, -4.713992, 0, 1, 0.5607843, 1,
-0.1307874, -0.6734651, -1.718767, 0, 1, 0.5686275, 1,
-0.129581, 0.4838831, -0.9589108, 0, 1, 0.572549, 1,
-0.129063, 1.313429, -0.3675961, 0, 1, 0.5803922, 1,
-0.1279285, -1.606209, -3.166476, 0, 1, 0.5843138, 1,
-0.1244789, -0.412802, -3.918011, 0, 1, 0.5921569, 1,
-0.1238597, 1.08524, 0.6596895, 0, 1, 0.5960785, 1,
-0.1230589, 0.2471871, 0.1687827, 0, 1, 0.6039216, 1,
-0.1225337, 0.5227472, 0.8014798, 0, 1, 0.6117647, 1,
-0.1201236, -0.3012945, -2.379029, 0, 1, 0.6156863, 1,
-0.1197464, 0.6886219, -0.1433775, 0, 1, 0.6235294, 1,
-0.1173569, -0.4081438, -3.68804, 0, 1, 0.627451, 1,
-0.1161892, -0.3155243, -3.371255, 0, 1, 0.6352941, 1,
-0.1141723, -0.4545819, -1.383337, 0, 1, 0.6392157, 1,
-0.1100997, -2.042886, -2.705482, 0, 1, 0.6470588, 1,
-0.1067225, 0.3985692, -0.5895255, 0, 1, 0.6509804, 1,
-0.1053302, 0.7194344, 0.7620917, 0, 1, 0.6588235, 1,
-0.09959744, -1.241207, -3.546764, 0, 1, 0.6627451, 1,
-0.09880368, -0.8114624, -3.897397, 0, 1, 0.6705883, 1,
-0.09706599, -0.7967063, -3.981478, 0, 1, 0.6745098, 1,
-0.09657362, 1.289395, -1.578944, 0, 1, 0.682353, 1,
-0.09105137, -0.3390849, -3.275824, 0, 1, 0.6862745, 1,
-0.09089268, 1.020425, -0.06301314, 0, 1, 0.6941177, 1,
-0.09018568, 1.12846, -2.035362, 0, 1, 0.7019608, 1,
-0.08922698, -0.3485548, -3.18174, 0, 1, 0.7058824, 1,
-0.08730252, -0.706367, -3.032518, 0, 1, 0.7137255, 1,
-0.08295786, 1.61107, -2.03477, 0, 1, 0.7176471, 1,
-0.08210883, 0.02636754, -1.023493, 0, 1, 0.7254902, 1,
-0.08049107, -0.1098884, -3.010212, 0, 1, 0.7294118, 1,
-0.07381145, -1.775784, -4.452032, 0, 1, 0.7372549, 1,
-0.06999449, 0.8514231, -0.2002137, 0, 1, 0.7411765, 1,
-0.06505129, 0.3717262, -0.912843, 0, 1, 0.7490196, 1,
-0.06465296, -0.1342872, -2.181609, 0, 1, 0.7529412, 1,
-0.05855091, -0.2742585, -3.321774, 0, 1, 0.7607843, 1,
-0.05753297, -0.2992326, -2.07679, 0, 1, 0.7647059, 1,
-0.05488584, 0.429281, -1.320273, 0, 1, 0.772549, 1,
-0.05167092, 0.07037431, -1.171511, 0, 1, 0.7764706, 1,
-0.05117966, -0.1960887, -3.293082, 0, 1, 0.7843137, 1,
-0.04663065, -0.03954406, -0.7633008, 0, 1, 0.7882353, 1,
-0.04561611, -0.3136247, -1.38873, 0, 1, 0.7960784, 1,
-0.04506851, 1.240939, -0.1867935, 0, 1, 0.8039216, 1,
-0.03099167, -1.969933, -3.597144, 0, 1, 0.8078431, 1,
-0.02975563, -0.8996045, -1.718636, 0, 1, 0.8156863, 1,
-0.02193568, -0.8820425, -4.198089, 0, 1, 0.8196079, 1,
-0.02029654, 0.04503784, -0.09956595, 0, 1, 0.827451, 1,
-0.01772311, 0.7284304, -1.190383, 0, 1, 0.8313726, 1,
-0.01768472, -0.1963572, -1.309844, 0, 1, 0.8392157, 1,
-0.01764042, 0.3325879, 0.6075343, 0, 1, 0.8431373, 1,
-0.01748738, 1.609581, -1.109455, 0, 1, 0.8509804, 1,
-0.01460861, 0.1716309, -0.6993986, 0, 1, 0.854902, 1,
-0.009171621, -2.731304, -4.027733, 0, 1, 0.8627451, 1,
-0.00768895, -0.0181146, -2.929815, 0, 1, 0.8666667, 1,
-0.005492542, -1.335057, -1.872868, 0, 1, 0.8745098, 1,
-0.002709329, 2.002219, -1.614983, 0, 1, 0.8784314, 1,
-0.0001747521, 0.9987434, 0.6471151, 0, 1, 0.8862745, 1,
-0.0001399158, -0.3682331, -1.539036, 0, 1, 0.8901961, 1,
2.090349e-05, -0.1282048, 5.171389, 0, 1, 0.8980392, 1,
6.007602e-05, -0.843182, 3.38313, 0, 1, 0.9058824, 1,
0.00158198, 0.9067215, -1.697526, 0, 1, 0.9098039, 1,
0.002014739, -1.406422, 4.749019, 0, 1, 0.9176471, 1,
0.005309398, 0.1679887, 1.04064, 0, 1, 0.9215686, 1,
0.006247828, -0.8868721, 2.446352, 0, 1, 0.9294118, 1,
0.007169886, 0.4001382, -0.2668314, 0, 1, 0.9333333, 1,
0.009121107, -0.4774432, 4.527682, 0, 1, 0.9411765, 1,
0.01010752, -0.02108029, 2.680504, 0, 1, 0.945098, 1,
0.01169336, 0.2819613, -0.1655222, 0, 1, 0.9529412, 1,
0.01209531, -0.03548472, 0.04617002, 0, 1, 0.9568627, 1,
0.01835397, 2.363121, 0.9461864, 0, 1, 0.9647059, 1,
0.01842698, -0.4452433, 2.793407, 0, 1, 0.9686275, 1,
0.02124176, -1.034159, 2.937089, 0, 1, 0.9764706, 1,
0.02346373, -0.1307211, 2.163525, 0, 1, 0.9803922, 1,
0.03098519, -0.09028946, 1.914, 0, 1, 0.9882353, 1,
0.03506964, 0.9439813, -0.1137389, 0, 1, 0.9921569, 1,
0.03843606, 0.2769178, 0.3421893, 0, 1, 1, 1,
0.03990107, -0.9506081, 3.748639, 0, 0.9921569, 1, 1,
0.04195553, -0.409602, 3.598178, 0, 0.9882353, 1, 1,
0.04283748, 0.6252666, 0.05434154, 0, 0.9803922, 1, 1,
0.04341268, -0.3917784, 4.123165, 0, 0.9764706, 1, 1,
0.04554028, 1.71841, 0.7383579, 0, 0.9686275, 1, 1,
0.04682632, -0.8077943, 3.482923, 0, 0.9647059, 1, 1,
0.04931531, 0.315541, 1.305453, 0, 0.9568627, 1, 1,
0.05277389, -1.052595, 1.89743, 0, 0.9529412, 1, 1,
0.05293835, -0.4879737, 5.692507, 0, 0.945098, 1, 1,
0.0557867, 0.4757597, 0.9425262, 0, 0.9411765, 1, 1,
0.05747637, -1.808144, 4.302613, 0, 0.9333333, 1, 1,
0.06782981, -1.397184, 2.075773, 0, 0.9294118, 1, 1,
0.06836461, -0.7389091, 2.746095, 0, 0.9215686, 1, 1,
0.06899142, -1.942514, 3.91537, 0, 0.9176471, 1, 1,
0.0720516, -0.5126107, 2.598473, 0, 0.9098039, 1, 1,
0.07553519, 1.637321, 0.6038202, 0, 0.9058824, 1, 1,
0.07969685, 1.650328, -0.5178887, 0, 0.8980392, 1, 1,
0.08370322, 0.2514044, -0.9514148, 0, 0.8901961, 1, 1,
0.09091207, -1.70157, 3.865515, 0, 0.8862745, 1, 1,
0.1023152, 0.623172, 0.4159867, 0, 0.8784314, 1, 1,
0.1031983, 1.555025, 2.69958, 0, 0.8745098, 1, 1,
0.1033335, 0.4007323, -0.654523, 0, 0.8666667, 1, 1,
0.1046852, 2.538734, 0.03718271, 0, 0.8627451, 1, 1,
0.1088505, -0.7493055, 3.238611, 0, 0.854902, 1, 1,
0.1089259, 1.794935, -0.9799032, 0, 0.8509804, 1, 1,
0.1123919, -0.09673428, 2.521321, 0, 0.8431373, 1, 1,
0.1143172, -0.6032682, 3.604876, 0, 0.8392157, 1, 1,
0.1149804, -0.9011605, 1.219412, 0, 0.8313726, 1, 1,
0.1159101, 1.141061, -0.9274849, 0, 0.827451, 1, 1,
0.1249318, 0.4121803, -0.4952615, 0, 0.8196079, 1, 1,
0.1250054, 1.549784, 0.897081, 0, 0.8156863, 1, 1,
0.1266768, 0.07598528, 1.482042, 0, 0.8078431, 1, 1,
0.1272295, -0.7764322, 4.562788, 0, 0.8039216, 1, 1,
0.1303704, -1.121778, 5.23272, 0, 0.7960784, 1, 1,
0.1342473, -0.4812844, 3.667136, 0, 0.7882353, 1, 1,
0.1358265, -0.0877103, 1.135674, 0, 0.7843137, 1, 1,
0.13664, -1.033153, 1.533551, 0, 0.7764706, 1, 1,
0.1373698, -0.3240224, 3.488004, 0, 0.772549, 1, 1,
0.1400109, -1.955566, 1.727945, 0, 0.7647059, 1, 1,
0.1418107, 0.1506512, -0.8859988, 0, 0.7607843, 1, 1,
0.1424336, 0.6698625, 2.154129, 0, 0.7529412, 1, 1,
0.1465222, -0.1263553, 2.532022, 0, 0.7490196, 1, 1,
0.1481702, -1.317132, 3.337971, 0, 0.7411765, 1, 1,
0.1497709, 0.4164093, 0.6434784, 0, 0.7372549, 1, 1,
0.1508872, 0.2107625, 1.078552, 0, 0.7294118, 1, 1,
0.1517316, 0.1177327, 0.4262792, 0, 0.7254902, 1, 1,
0.1524037, -1.931031, 2.83791, 0, 0.7176471, 1, 1,
0.1536891, -1.676195, 1.659517, 0, 0.7137255, 1, 1,
0.1540497, 0.7251878, 1.674947, 0, 0.7058824, 1, 1,
0.1540826, -0.2962196, 1.447299, 0, 0.6980392, 1, 1,
0.1546802, -1.621162, 2.85162, 0, 0.6941177, 1, 1,
0.1562179, 0.551102, -0.03475098, 0, 0.6862745, 1, 1,
0.1575981, 0.4694742, 0.3394346, 0, 0.682353, 1, 1,
0.1661142, 1.299075, 0.47031, 0, 0.6745098, 1, 1,
0.1670923, 0.8501633, 0.414937, 0, 0.6705883, 1, 1,
0.1676888, -0.9760095, 2.320703, 0, 0.6627451, 1, 1,
0.1725978, 0.1885803, -1.717966, 0, 0.6588235, 1, 1,
0.1727055, 1.808559, 0.3166222, 0, 0.6509804, 1, 1,
0.1729443, 2.420851, 2.408576, 0, 0.6470588, 1, 1,
0.1767453, 0.2998873, 1.891981, 0, 0.6392157, 1, 1,
0.1769308, -0.7431967, 1.234268, 0, 0.6352941, 1, 1,
0.1859868, 1.353475, 0.3809093, 0, 0.627451, 1, 1,
0.1874821, -0.3421744, 3.660122, 0, 0.6235294, 1, 1,
0.1894889, -0.1018289, 2.200521, 0, 0.6156863, 1, 1,
0.2015717, -1.400651, 2.780488, 0, 0.6117647, 1, 1,
0.2029399, 0.8975669, 2.313319, 0, 0.6039216, 1, 1,
0.2031323, -2.025413, 3.563451, 0, 0.5960785, 1, 1,
0.2072435, -0.5739402, 1.337423, 0, 0.5921569, 1, 1,
0.2079421, 0.6845605, 0.3407248, 0, 0.5843138, 1, 1,
0.2081096, 1.429789, 1.899925, 0, 0.5803922, 1, 1,
0.2145631, 1.118619, -2.898921, 0, 0.572549, 1, 1,
0.2146621, -2.315547, 4.44566, 0, 0.5686275, 1, 1,
0.2200684, -0.5396597, 1.816174, 0, 0.5607843, 1, 1,
0.2213515, 1.397508, 0.6717818, 0, 0.5568628, 1, 1,
0.2264123, -0.4981368, 4.629107, 0, 0.5490196, 1, 1,
0.2268849, -1.685912, 2.30505, 0, 0.5450981, 1, 1,
0.238325, -0.5306717, 2.686899, 0, 0.5372549, 1, 1,
0.2386716, -0.6551786, 4.097565, 0, 0.5333334, 1, 1,
0.24184, -1.404485, 5.55125, 0, 0.5254902, 1, 1,
0.244508, -0.1980099, 2.931319, 0, 0.5215687, 1, 1,
0.2496894, 0.3084899, 3.208232, 0, 0.5137255, 1, 1,
0.2513095, 0.7312527, -0.154745, 0, 0.509804, 1, 1,
0.2529731, -0.2676893, 3.830555, 0, 0.5019608, 1, 1,
0.2542289, -0.08347448, 3.475577, 0, 0.4941176, 1, 1,
0.2546735, -0.1427908, 2.559417, 0, 0.4901961, 1, 1,
0.2546929, 0.3201565, -0.4062775, 0, 0.4823529, 1, 1,
0.2556145, -1.222484, 2.899767, 0, 0.4784314, 1, 1,
0.2559776, 1.28145, 0.5026376, 0, 0.4705882, 1, 1,
0.2567517, -0.2387482, 3.054861, 0, 0.4666667, 1, 1,
0.2636032, -0.1850879, 2.634072, 0, 0.4588235, 1, 1,
0.2637249, -0.7960895, 2.518377, 0, 0.454902, 1, 1,
0.2673402, 0.05548146, 2.048666, 0, 0.4470588, 1, 1,
0.2680193, -0.264691, 1.985828, 0, 0.4431373, 1, 1,
0.270474, 0.4022873, -0.4543534, 0, 0.4352941, 1, 1,
0.2735114, 0.1336261, -0.3168994, 0, 0.4313726, 1, 1,
0.2773564, -0.5510195, 2.372778, 0, 0.4235294, 1, 1,
0.2800498, 0.6487878, -0.1419156, 0, 0.4196078, 1, 1,
0.2806629, -0.1177679, 2.656274, 0, 0.4117647, 1, 1,
0.2817223, 0.4681306, 0.7397834, 0, 0.4078431, 1, 1,
0.2824548, -0.1934794, 3.363679, 0, 0.4, 1, 1,
0.2848123, 0.3492843, 0.05124837, 0, 0.3921569, 1, 1,
0.285838, 1.740334, 0.9261792, 0, 0.3882353, 1, 1,
0.2884862, 0.4086056, -0.4983228, 0, 0.3803922, 1, 1,
0.2901755, -0.5391135, 3.066997, 0, 0.3764706, 1, 1,
0.2921432, -0.2569063, 1.955708, 0, 0.3686275, 1, 1,
0.3013508, 0.2116458, 1.272224, 0, 0.3647059, 1, 1,
0.3018826, 0.4738571, -0.216786, 0, 0.3568628, 1, 1,
0.3021331, 0.4601501, 1.301483, 0, 0.3529412, 1, 1,
0.3028685, -0.9571328, 2.190845, 0, 0.345098, 1, 1,
0.3041003, -1.806228, 3.983798, 0, 0.3411765, 1, 1,
0.3052122, 0.5939922, -0.1495759, 0, 0.3333333, 1, 1,
0.3057628, 0.05480526, 1.097938, 0, 0.3294118, 1, 1,
0.3069597, -1.470403, 3.424718, 0, 0.3215686, 1, 1,
0.3140055, 2.611643, 0.6222489, 0, 0.3176471, 1, 1,
0.3153389, 0.2121374, 0.7597325, 0, 0.3098039, 1, 1,
0.320311, 1.126284, -0.9919551, 0, 0.3058824, 1, 1,
0.3220169, -0.8162566, 2.226784, 0, 0.2980392, 1, 1,
0.3220827, -0.5142023, 3.356769, 0, 0.2901961, 1, 1,
0.3227126, 0.9617572, -0.4073854, 0, 0.2862745, 1, 1,
0.3265805, -0.9335931, 1.504681, 0, 0.2784314, 1, 1,
0.3369268, 0.8218959, 1.422299, 0, 0.2745098, 1, 1,
0.3385882, -0.3401365, 2.021268, 0, 0.2666667, 1, 1,
0.3387185, 0.8492855, 0.3189759, 0, 0.2627451, 1, 1,
0.3409647, 0.2561481, 1.649527, 0, 0.254902, 1, 1,
0.3416935, 0.2987627, 0.5262702, 0, 0.2509804, 1, 1,
0.3431009, 0.3282897, 3.606144, 0, 0.2431373, 1, 1,
0.3461648, 0.4366701, 1.584124, 0, 0.2392157, 1, 1,
0.3475599, 0.9399986, 0.9366472, 0, 0.2313726, 1, 1,
0.3549942, 0.1882285, 2.283582, 0, 0.227451, 1, 1,
0.3563792, -0.8948781, 2.582959, 0, 0.2196078, 1, 1,
0.3615438, 0.5743407, 0.1257599, 0, 0.2156863, 1, 1,
0.3657095, -0.9874948, 1.862508, 0, 0.2078431, 1, 1,
0.3670981, -0.0190841, 0.9048848, 0, 0.2039216, 1, 1,
0.3686185, -1.226983, 2.568447, 0, 0.1960784, 1, 1,
0.3764394, 0.8127431, 0.5949278, 0, 0.1882353, 1, 1,
0.3779922, -0.1052162, 1.559744, 0, 0.1843137, 1, 1,
0.3840698, 0.09846525, 2.194635, 0, 0.1764706, 1, 1,
0.3855601, 1.129714, -0.1234184, 0, 0.172549, 1, 1,
0.3977173, 1.712591, 2.079925, 0, 0.1647059, 1, 1,
0.3989466, 1.086856, 0.4656436, 0, 0.1607843, 1, 1,
0.4030069, 1.332634, 0.7896675, 0, 0.1529412, 1, 1,
0.404142, 1.923779, 0.07349829, 0, 0.1490196, 1, 1,
0.4043766, -0.04887326, 2.686914, 0, 0.1411765, 1, 1,
0.4056112, 1.27835, 0.8128424, 0, 0.1372549, 1, 1,
0.4065554, -1.199727, 4.3297, 0, 0.1294118, 1, 1,
0.4088566, -1.097391, 3.884876, 0, 0.1254902, 1, 1,
0.4119603, -1.959903, 3.455991, 0, 0.1176471, 1, 1,
0.4151388, -0.8816484, 2.162695, 0, 0.1137255, 1, 1,
0.4154319, -0.2413817, 2.059413, 0, 0.1058824, 1, 1,
0.4226142, 2.128573, 0.6686405, 0, 0.09803922, 1, 1,
0.4238487, 1.000902, -0.1541315, 0, 0.09411765, 1, 1,
0.4242985, 0.02713139, 1.369478, 0, 0.08627451, 1, 1,
0.4249838, -1.079632, 3.155051, 0, 0.08235294, 1, 1,
0.4322467, 0.9064217, 2.007687, 0, 0.07450981, 1, 1,
0.4327911, -0.2352188, 4.651985, 0, 0.07058824, 1, 1,
0.4363883, -0.04621, 1.481223, 0, 0.0627451, 1, 1,
0.4380038, 0.6441173, 0.7374082, 0, 0.05882353, 1, 1,
0.4386961, 2.03496, -0.2644121, 0, 0.05098039, 1, 1,
0.4427318, -0.3418285, 2.884702, 0, 0.04705882, 1, 1,
0.4448619, -0.9412603, 2.369772, 0, 0.03921569, 1, 1,
0.4479003, 0.164436, 0.9140161, 0, 0.03529412, 1, 1,
0.452708, 0.6303656, -0.2062816, 0, 0.02745098, 1, 1,
0.4555703, 0.05365783, 1.724601, 0, 0.02352941, 1, 1,
0.4586962, 0.5960016, 1.223965, 0, 0.01568628, 1, 1,
0.4672256, 0.795405, -1.461145, 0, 0.01176471, 1, 1,
0.4711074, 0.5967917, 1.97767, 0, 0.003921569, 1, 1,
0.4722367, 0.2438602, 2.151067, 0.003921569, 0, 1, 1,
0.4767426, -0.6231437, 3.74394, 0.007843138, 0, 1, 1,
0.4881067, -2.122565, 2.232985, 0.01568628, 0, 1, 1,
0.4902371, -0.8541071, 2.694512, 0.01960784, 0, 1, 1,
0.4921756, 0.1859403, 1.754892, 0.02745098, 0, 1, 1,
0.4989291, 0.8386322, 1.369022, 0.03137255, 0, 1, 1,
0.502651, -0.2072362, 2.150923, 0.03921569, 0, 1, 1,
0.5139289, -0.9463363, 2.694143, 0.04313726, 0, 1, 1,
0.5165944, 1.731749, -0.8533265, 0.05098039, 0, 1, 1,
0.5176059, 1.098725, 0.3920996, 0.05490196, 0, 1, 1,
0.523935, 1.344359, 0.706287, 0.0627451, 0, 1, 1,
0.5259773, 1.396807, 0.8380488, 0.06666667, 0, 1, 1,
0.527054, -1.000281, 2.941136, 0.07450981, 0, 1, 1,
0.5290976, -0.34142, 2.44341, 0.07843138, 0, 1, 1,
0.531708, 1.096636, 0.9195516, 0.08627451, 0, 1, 1,
0.5351162, -1.438612, 1.521573, 0.09019608, 0, 1, 1,
0.5412261, -1.066918, 3.233896, 0.09803922, 0, 1, 1,
0.541849, 0.5897549, -1.057098, 0.1058824, 0, 1, 1,
0.5422333, -0.2036332, 2.641286, 0.1098039, 0, 1, 1,
0.5435473, -1.371862, 2.424127, 0.1176471, 0, 1, 1,
0.5446723, -0.6372352, 2.507633, 0.1215686, 0, 1, 1,
0.5447, 1.227964, 0.5332733, 0.1294118, 0, 1, 1,
0.5481943, -0.07739028, 0.1153445, 0.1333333, 0, 1, 1,
0.5499598, -0.7736409, 2.857456, 0.1411765, 0, 1, 1,
0.5502526, -0.2641495, 2.242447, 0.145098, 0, 1, 1,
0.5541206, -0.04799198, 0.8150125, 0.1529412, 0, 1, 1,
0.5576211, -0.2582845, 2.305478, 0.1568628, 0, 1, 1,
0.5641631, -0.3738799, 2.713547, 0.1647059, 0, 1, 1,
0.5658436, -0.2882386, 1.599146, 0.1686275, 0, 1, 1,
0.571867, -1.035464, 1.791757, 0.1764706, 0, 1, 1,
0.5762903, 1.368484, -1.617499, 0.1803922, 0, 1, 1,
0.5773167, -0.8459061, 2.740801, 0.1882353, 0, 1, 1,
0.5797946, -0.5441664, 1.108385, 0.1921569, 0, 1, 1,
0.5869144, -0.1364805, 0.7342387, 0.2, 0, 1, 1,
0.5944049, -0.3855457, 1.676029, 0.2078431, 0, 1, 1,
0.5950645, 0.4801107, 2.133553, 0.2117647, 0, 1, 1,
0.5988285, -0.433548, 1.641129, 0.2196078, 0, 1, 1,
0.60045, 0.3020751, 0.956131, 0.2235294, 0, 1, 1,
0.6035262, 0.2928436, 0.4754143, 0.2313726, 0, 1, 1,
0.6057429, 1.423128, -0.519645, 0.2352941, 0, 1, 1,
0.6128483, -0.9601108, 0.9052675, 0.2431373, 0, 1, 1,
0.6137452, -0.1411386, 1.213769, 0.2470588, 0, 1, 1,
0.615554, -0.8293677, 3.141922, 0.254902, 0, 1, 1,
0.616247, 0.5590313, 0.1727494, 0.2588235, 0, 1, 1,
0.6229259, -1.267072, 1.347893, 0.2666667, 0, 1, 1,
0.6281332, 0.8201942, 2.812475, 0.2705882, 0, 1, 1,
0.6286707, -1.224544, 4.104459, 0.2784314, 0, 1, 1,
0.6289211, 0.07409935, 1.11105, 0.282353, 0, 1, 1,
0.6302249, 0.9279919, 0.3450332, 0.2901961, 0, 1, 1,
0.6303833, -1.655033, 2.977678, 0.2941177, 0, 1, 1,
0.634393, -0.7332403, 2.612082, 0.3019608, 0, 1, 1,
0.6373678, 1.235229, 0.2589176, 0.3098039, 0, 1, 1,
0.6467391, -0.7978206, 3.248124, 0.3137255, 0, 1, 1,
0.6471093, -1.110528, 2.484983, 0.3215686, 0, 1, 1,
0.6598141, 0.71425, -0.9294517, 0.3254902, 0, 1, 1,
0.6598821, -0.3263353, 1.015081, 0.3333333, 0, 1, 1,
0.6614722, 0.09408972, 2.300934, 0.3372549, 0, 1, 1,
0.6657863, -0.6980532, 0.8201349, 0.345098, 0, 1, 1,
0.6683142, -0.5691639, 4.352684, 0.3490196, 0, 1, 1,
0.6780726, 0.8389743, -0.4393545, 0.3568628, 0, 1, 1,
0.6810252, -1.280937, 3.844701, 0.3607843, 0, 1, 1,
0.6810812, 1.127559, 2.123024, 0.3686275, 0, 1, 1,
0.6825757, -1.614951, 2.346821, 0.372549, 0, 1, 1,
0.6858343, 1.900259, 1.453418, 0.3803922, 0, 1, 1,
0.6871099, 1.653779, 0.5725551, 0.3843137, 0, 1, 1,
0.6945163, -0.4177894, 2.192128, 0.3921569, 0, 1, 1,
0.7068072, 1.265184, -1.288469, 0.3960784, 0, 1, 1,
0.7100955, -0.7332482, 1.69135, 0.4039216, 0, 1, 1,
0.7136734, 0.8598197, 2.371234, 0.4117647, 0, 1, 1,
0.7170442, 0.3891066, 0.3911884, 0.4156863, 0, 1, 1,
0.7196423, -0.5513794, 1.493081, 0.4235294, 0, 1, 1,
0.7219256, 0.9057342, -1.30779, 0.427451, 0, 1, 1,
0.7220849, -1.528598, 2.708296, 0.4352941, 0, 1, 1,
0.7227291, 0.03041327, 0.855454, 0.4392157, 0, 1, 1,
0.7239857, -0.0534269, 1.773451, 0.4470588, 0, 1, 1,
0.727677, 0.08115905, 2.904315, 0.4509804, 0, 1, 1,
0.7283256, 1.657361, 0.6743625, 0.4588235, 0, 1, 1,
0.73232, 2.701569, 0.5453275, 0.4627451, 0, 1, 1,
0.7385347, 0.1265281, 3.643187, 0.4705882, 0, 1, 1,
0.7389999, 0.3087271, 1.844975, 0.4745098, 0, 1, 1,
0.7414287, 0.7377359, 2.861605, 0.4823529, 0, 1, 1,
0.7426894, -0.5641691, 1.003631, 0.4862745, 0, 1, 1,
0.7436717, 1.141705, 0.008396707, 0.4941176, 0, 1, 1,
0.7464439, -0.01928305, 0.9176293, 0.5019608, 0, 1, 1,
0.7494612, -1.581501, 3.987613, 0.5058824, 0, 1, 1,
0.7508409, 1.049661, -0.4202918, 0.5137255, 0, 1, 1,
0.7528658, 0.06635258, 0.826761, 0.5176471, 0, 1, 1,
0.7528834, -1.116675, 3.971009, 0.5254902, 0, 1, 1,
0.7534692, 1.235149, 1.232977, 0.5294118, 0, 1, 1,
0.7557092, -1.646441, 0.5654926, 0.5372549, 0, 1, 1,
0.7584084, 1.161516, 1.442233, 0.5411765, 0, 1, 1,
0.7692844, 0.7398504, 1.157008, 0.5490196, 0, 1, 1,
0.7731326, -2.330596, 1.764797, 0.5529412, 0, 1, 1,
0.7907153, 0.1924064, 2.999774, 0.5607843, 0, 1, 1,
0.8058591, -2.335343, 3.783772, 0.5647059, 0, 1, 1,
0.8072345, -1.437206, 3.092358, 0.572549, 0, 1, 1,
0.8074127, 0.5147653, 1.849363, 0.5764706, 0, 1, 1,
0.8106485, 1.508688, 2.510518, 0.5843138, 0, 1, 1,
0.8152311, -1.211261, 2.703852, 0.5882353, 0, 1, 1,
0.817592, -0.7318658, 3.07612, 0.5960785, 0, 1, 1,
0.8186573, -0.3853755, 2.832319, 0.6039216, 0, 1, 1,
0.8194673, 1.565846, 0.4800766, 0.6078432, 0, 1, 1,
0.8235738, -1.491443, 1.564106, 0.6156863, 0, 1, 1,
0.8238773, 0.6124719, 1.368534, 0.6196079, 0, 1, 1,
0.8379775, -0.35647, 3.21681, 0.627451, 0, 1, 1,
0.8399152, 0.7496324, 0.9323778, 0.6313726, 0, 1, 1,
0.8403217, -0.06374725, 1.343087, 0.6392157, 0, 1, 1,
0.8413067, -0.5339405, 2.618981, 0.6431373, 0, 1, 1,
0.8425886, 1.210593, -0.5927896, 0.6509804, 0, 1, 1,
0.8459887, -2.718493, 2.030707, 0.654902, 0, 1, 1,
0.8483053, -0.6831691, 1.568946, 0.6627451, 0, 1, 1,
0.852666, 1.73468, -0.3698776, 0.6666667, 0, 1, 1,
0.8541608, 1.078356, 1.558697, 0.6745098, 0, 1, 1,
0.8579648, -0.0004013326, 2.627088, 0.6784314, 0, 1, 1,
0.8664208, -0.6799448, 2.256706, 0.6862745, 0, 1, 1,
0.8671594, 0.4746451, 0.7477417, 0.6901961, 0, 1, 1,
0.8720474, -0.3845662, 2.428779, 0.6980392, 0, 1, 1,
0.8771825, -0.3384079, 1.58211, 0.7058824, 0, 1, 1,
0.8780298, 1.663103, -1.591245, 0.7098039, 0, 1, 1,
0.8814087, 0.1596388, 1.841805, 0.7176471, 0, 1, 1,
0.8818502, 0.05403507, 2.196797, 0.7215686, 0, 1, 1,
0.8819134, 0.2083165, 1.278188, 0.7294118, 0, 1, 1,
0.8856124, -0.9986621, 2.353934, 0.7333333, 0, 1, 1,
0.8911045, -1.018197, 2.582096, 0.7411765, 0, 1, 1,
0.8920392, -0.7761278, 1.615033, 0.7450981, 0, 1, 1,
0.897944, 1.681219, 0.5938908, 0.7529412, 0, 1, 1,
0.9013136, -0.8346197, 2.995527, 0.7568628, 0, 1, 1,
0.9023708, -0.06038783, 4.028304, 0.7647059, 0, 1, 1,
0.9053556, -0.7652818, 0.7171438, 0.7686275, 0, 1, 1,
0.9074573, -0.2062177, 3.484179, 0.7764706, 0, 1, 1,
0.9108509, 0.9865573, 2.302479, 0.7803922, 0, 1, 1,
0.9123628, 0.7236622, 0.5523716, 0.7882353, 0, 1, 1,
0.9168317, -0.6621764, 1.992824, 0.7921569, 0, 1, 1,
0.9192849, -0.1852205, 1.626138, 0.8, 0, 1, 1,
0.9194572, -0.8659703, 1.873395, 0.8078431, 0, 1, 1,
0.9236956, -0.7524128, 3.524977, 0.8117647, 0, 1, 1,
0.9287394, 0.6946073, 0.7208337, 0.8196079, 0, 1, 1,
0.9288188, 1.178173, 1.349797, 0.8235294, 0, 1, 1,
0.9309937, -1.61691, 1.308317, 0.8313726, 0, 1, 1,
0.9312443, -0.403144, 3.021115, 0.8352941, 0, 1, 1,
0.9374847, 0.1799246, 1.776042, 0.8431373, 0, 1, 1,
0.9396228, -1.810236, 1.23631, 0.8470588, 0, 1, 1,
0.9441238, -0.7442227, 1.037832, 0.854902, 0, 1, 1,
0.9443343, -0.1796846, 1.375802, 0.8588235, 0, 1, 1,
0.9494535, -1.997179, 2.522932, 0.8666667, 0, 1, 1,
0.9627002, -0.3759486, 2.722411, 0.8705882, 0, 1, 1,
0.9642327, 0.04098957, 2.821221, 0.8784314, 0, 1, 1,
0.9739481, -0.6408767, 2.860637, 0.8823529, 0, 1, 1,
0.9778338, -0.1321342, 1.357587, 0.8901961, 0, 1, 1,
0.9789685, 0.4469512, 2.223541, 0.8941177, 0, 1, 1,
0.987075, 0.2157869, 1.365068, 0.9019608, 0, 1, 1,
0.9941041, 0.7912546, 1.022866, 0.9098039, 0, 1, 1,
0.9945694, -0.3488152, 2.446133, 0.9137255, 0, 1, 1,
0.9958091, 0.1670362, -0.3993903, 0.9215686, 0, 1, 1,
0.999494, 0.4978573, -0.6833062, 0.9254902, 0, 1, 1,
1.003794, 0.9820943, 1.594839, 0.9333333, 0, 1, 1,
1.005114, -0.1069592, 2.320078, 0.9372549, 0, 1, 1,
1.006396, 0.6624323, 0.2575521, 0.945098, 0, 1, 1,
1.008193, -0.5615392, 0.6599278, 0.9490196, 0, 1, 1,
1.011356, -1.172292, 1.825319, 0.9568627, 0, 1, 1,
1.012199, 1.40462, 2.039201, 0.9607843, 0, 1, 1,
1.01718, -0.9483472, 2.364228, 0.9686275, 0, 1, 1,
1.022042, 1.933512, 1.597041, 0.972549, 0, 1, 1,
1.026476, 0.009730996, 0.2996788, 0.9803922, 0, 1, 1,
1.028052, -0.266167, 2.68301, 0.9843137, 0, 1, 1,
1.034378, -1.384974, 1.835793, 0.9921569, 0, 1, 1,
1.035646, -0.05262039, 2.040539, 0.9960784, 0, 1, 1,
1.040492, 0.7335249, 3.286352, 1, 0, 0.9960784, 1,
1.041031, 1.608945, 0.6842644, 1, 0, 0.9882353, 1,
1.046895, 0.2896858, 1.134185, 1, 0, 0.9843137, 1,
1.052487, -1.53875, 2.3045, 1, 0, 0.9764706, 1,
1.056731, 0.7355111, 1.75918, 1, 0, 0.972549, 1,
1.057272, -1.346117, 2.364023, 1, 0, 0.9647059, 1,
1.058232, 0.1072774, 0.710901, 1, 0, 0.9607843, 1,
1.059057, -0.7126947, 3.596744, 1, 0, 0.9529412, 1,
1.062311, 0.5853807, 1.206743, 1, 0, 0.9490196, 1,
1.062482, -1.512217, 2.679533, 1, 0, 0.9411765, 1,
1.067495, -0.6779782, 3.898476, 1, 0, 0.9372549, 1,
1.068938, 1.776332, 2.526586, 1, 0, 0.9294118, 1,
1.077303, 2.215734, 0.6471103, 1, 0, 0.9254902, 1,
1.07808, -1.263174, 2.334133, 1, 0, 0.9176471, 1,
1.079929, -0.3780706, 1.280321, 1, 0, 0.9137255, 1,
1.080264, 1.330149, -0.03963887, 1, 0, 0.9058824, 1,
1.080544, -0.1210086, 3.382804, 1, 0, 0.9019608, 1,
1.080713, -1.418567, 2.500138, 1, 0, 0.8941177, 1,
1.08121, 0.2482646, 0.9757091, 1, 0, 0.8862745, 1,
1.090803, -1.904238, 3.254375, 1, 0, 0.8823529, 1,
1.099632, -1.358148, 4.493768, 1, 0, 0.8745098, 1,
1.101758, 0.6388862, 0.9731972, 1, 0, 0.8705882, 1,
1.104488, 1.341638, 1.033713, 1, 0, 0.8627451, 1,
1.105374, 1.130821, -0.2589578, 1, 0, 0.8588235, 1,
1.105518, 0.1315812, 1.727251, 1, 0, 0.8509804, 1,
1.122572, 1.290167, 1.545824, 1, 0, 0.8470588, 1,
1.134581, 1.182782, 0.7540441, 1, 0, 0.8392157, 1,
1.143725, 0.4078211, 0.4440126, 1, 0, 0.8352941, 1,
1.152952, 1.460654, 1.300616, 1, 0, 0.827451, 1,
1.165583, -0.009141291, -0.06359942, 1, 0, 0.8235294, 1,
1.171421, -0.4873, 2.408303, 1, 0, 0.8156863, 1,
1.171915, 0.2988317, 1.531301, 1, 0, 0.8117647, 1,
1.175886, 1.548434, -0.6989357, 1, 0, 0.8039216, 1,
1.177381, 1.228498, 0.6653277, 1, 0, 0.7960784, 1,
1.17888, 0.4458202, 1.323345, 1, 0, 0.7921569, 1,
1.182458, -0.7280293, 3.237868, 1, 0, 0.7843137, 1,
1.186429, 0.05458743, -0.2217356, 1, 0, 0.7803922, 1,
1.188778, -0.9178475, 1.956602, 1, 0, 0.772549, 1,
1.189112, -0.388885, 2.425298, 1, 0, 0.7686275, 1,
1.191176, -0.09090739, 1.432874, 1, 0, 0.7607843, 1,
1.199, -0.2175524, 2.930838, 1, 0, 0.7568628, 1,
1.200376, 0.6088545, 1.200662, 1, 0, 0.7490196, 1,
1.201337, -0.2469323, 2.473275, 1, 0, 0.7450981, 1,
1.202548, 2.306814, 1.519696, 1, 0, 0.7372549, 1,
1.205881, -0.2869666, 2.671055, 1, 0, 0.7333333, 1,
1.206837, 0.7814878, -0.01432756, 1, 0, 0.7254902, 1,
1.209743, 0.8375139, 0.6408795, 1, 0, 0.7215686, 1,
1.209913, -0.541207, 2.729957, 1, 0, 0.7137255, 1,
1.210106, -0.6213535, 2.116759, 1, 0, 0.7098039, 1,
1.213755, 1.141839, 0.7033136, 1, 0, 0.7019608, 1,
1.217583, 0.9707748, -0.1226614, 1, 0, 0.6941177, 1,
1.223552, 0.4061504, 1.104142, 1, 0, 0.6901961, 1,
1.228013, 0.4021328, 2.550659, 1, 0, 0.682353, 1,
1.232083, 0.7803473, 0.7102765, 1, 0, 0.6784314, 1,
1.235074, -0.961794, 1.838939, 1, 0, 0.6705883, 1,
1.237783, 0.03027892, 1.488723, 1, 0, 0.6666667, 1,
1.241625, -2.335709, 3.121054, 1, 0, 0.6588235, 1,
1.249661, -2.345186, 4.643923, 1, 0, 0.654902, 1,
1.255834, 0.4662717, 2.600667, 1, 0, 0.6470588, 1,
1.257478, -1.1149, 4.159367, 1, 0, 0.6431373, 1,
1.26041, -0.424256, 2.989083, 1, 0, 0.6352941, 1,
1.26478, 1.042941, 1.716365, 1, 0, 0.6313726, 1,
1.267182, 0.7756746, 0.5580974, 1, 0, 0.6235294, 1,
1.27659, -1.222703, 1.106642, 1, 0, 0.6196079, 1,
1.28102, 1.092893, -0.2689362, 1, 0, 0.6117647, 1,
1.285569, 0.3316521, 1.641407, 1, 0, 0.6078432, 1,
1.292013, -0.9642615, 1.008793, 1, 0, 0.6, 1,
1.29439, -0.3235981, 0.7982969, 1, 0, 0.5921569, 1,
1.29806, 0.5237424, 1.530025, 1, 0, 0.5882353, 1,
1.319151, -1.642534, 2.343174, 1, 0, 0.5803922, 1,
1.329366, 0.1904898, 1.901434, 1, 0, 0.5764706, 1,
1.335187, 1.571628, 0.01589208, 1, 0, 0.5686275, 1,
1.339199, 0.05707645, 2.164853, 1, 0, 0.5647059, 1,
1.348073, -1.855676, 0.7010095, 1, 0, 0.5568628, 1,
1.349014, 0.2696655, 2.344609, 1, 0, 0.5529412, 1,
1.350164, 0.8100347, -0.1012114, 1, 0, 0.5450981, 1,
1.354279, 0.559841, -1.413473, 1, 0, 0.5411765, 1,
1.355493, 0.8159365, -0.9650731, 1, 0, 0.5333334, 1,
1.361969, 1.512586, -0.4750569, 1, 0, 0.5294118, 1,
1.370185, 0.6256796, 0.1089253, 1, 0, 0.5215687, 1,
1.376857, 1.449862, 2.463177, 1, 0, 0.5176471, 1,
1.379082, 1.069644, 1.119573, 1, 0, 0.509804, 1,
1.384497, -0.3873844, 1.10155, 1, 0, 0.5058824, 1,
1.399374, 0.8705474, 0.6820707, 1, 0, 0.4980392, 1,
1.399396, -1.801344, 3.425874, 1, 0, 0.4901961, 1,
1.407387, 0.4712071, 1.948517, 1, 0, 0.4862745, 1,
1.407693, 0.7016025, 0.4681264, 1, 0, 0.4784314, 1,
1.416211, 0.9736784, 0.2859171, 1, 0, 0.4745098, 1,
1.423259, 0.4583363, 2.203984, 1, 0, 0.4666667, 1,
1.426111, -0.4678771, 2.566547, 1, 0, 0.4627451, 1,
1.427436, -0.7586718, 1.41835, 1, 0, 0.454902, 1,
1.430879, -0.8102379, 2.475962, 1, 0, 0.4509804, 1,
1.44392, -2.446137, 1.830939, 1, 0, 0.4431373, 1,
1.446165, 0.07448263, 3.429764, 1, 0, 0.4392157, 1,
1.446252, -0.6452199, 2.959152, 1, 0, 0.4313726, 1,
1.449966, -0.3607324, 2.872027, 1, 0, 0.427451, 1,
1.460367, -0.6263935, 2.185564, 1, 0, 0.4196078, 1,
1.466984, 0.2458774, -0.4945071, 1, 0, 0.4156863, 1,
1.470155, -0.7994292, 1.089142, 1, 0, 0.4078431, 1,
1.480625, 1.519992, 0.2163689, 1, 0, 0.4039216, 1,
1.491512, 0.751525, 0.1396533, 1, 0, 0.3960784, 1,
1.501983, -1.225495, 3.08817, 1, 0, 0.3882353, 1,
1.512173, -0.2070862, 1.594282, 1, 0, 0.3843137, 1,
1.512514, -0.07763415, 2.031979, 1, 0, 0.3764706, 1,
1.528472, 0.5885527, 1.913901, 1, 0, 0.372549, 1,
1.533511, 0.3765667, 1.255702, 1, 0, 0.3647059, 1,
1.538439, -1.392983, 2.617243, 1, 0, 0.3607843, 1,
1.556435, -1.854844, 2.843197, 1, 0, 0.3529412, 1,
1.557539, 1.073541, 1.388138, 1, 0, 0.3490196, 1,
1.559939, -1.041847, 2.694027, 1, 0, 0.3411765, 1,
1.562914, -0.1740609, 1.802069, 1, 0, 0.3372549, 1,
1.56548, 1.164989, 0.5066079, 1, 0, 0.3294118, 1,
1.601401, -2.020929, 2.477912, 1, 0, 0.3254902, 1,
1.602062, -1.523737, 3.0623, 1, 0, 0.3176471, 1,
1.624572, -0.5099707, 3.706913, 1, 0, 0.3137255, 1,
1.628321, -0.583182, 0.6897563, 1, 0, 0.3058824, 1,
1.628857, 0.8885109, 0.7343925, 1, 0, 0.2980392, 1,
1.654532, -0.1034782, 1.975847, 1, 0, 0.2941177, 1,
1.677846, -0.4840031, 1.94896, 1, 0, 0.2862745, 1,
1.682525, 0.2134886, 1.439957, 1, 0, 0.282353, 1,
1.710461, 0.2602109, 0.9371333, 1, 0, 0.2745098, 1,
1.721297, -0.5339023, 3.38299, 1, 0, 0.2705882, 1,
1.729614, -0.5135186, 1.177856, 1, 0, 0.2627451, 1,
1.741745, -2.64967, 4.1681, 1, 0, 0.2588235, 1,
1.756292, -2.11056, 0.499687, 1, 0, 0.2509804, 1,
1.766885, 0.9360049, -1.250281, 1, 0, 0.2470588, 1,
1.774419, 1.295089, 1.612122, 1, 0, 0.2392157, 1,
1.775229, -0.3972063, 2.931082, 1, 0, 0.2352941, 1,
1.77662, 0.04680203, 2.252841, 1, 0, 0.227451, 1,
1.796211, -2.010948, 2.503563, 1, 0, 0.2235294, 1,
1.801342, -1.549781, 0.03645313, 1, 0, 0.2156863, 1,
1.812801, -0.1837866, -0.117321, 1, 0, 0.2117647, 1,
1.820887, -0.213487, 2.966783, 1, 0, 0.2039216, 1,
1.82112, -0.0705177, 1.540955, 1, 0, 0.1960784, 1,
1.822135, 0.6322185, 0.8310441, 1, 0, 0.1921569, 1,
1.830754, 0.222688, 1.817462, 1, 0, 0.1843137, 1,
1.909027, 0.403243, 0.8989865, 1, 0, 0.1803922, 1,
1.934661, 1.720329, 1.112555, 1, 0, 0.172549, 1,
1.93552, -0.7572742, 2.85686, 1, 0, 0.1686275, 1,
1.942472, 1.07188, 1.384284, 1, 0, 0.1607843, 1,
1.94942, -1.605896, 3.4145, 1, 0, 0.1568628, 1,
1.959599, -1.363181, 1.86756, 1, 0, 0.1490196, 1,
1.972388, 0.6549024, 1.739955, 1, 0, 0.145098, 1,
1.981722, -0.1707928, 2.178018, 1, 0, 0.1372549, 1,
2.00243, -0.8076979, -0.3968872, 1, 0, 0.1333333, 1,
2.026765, -0.3746211, 2.344161, 1, 0, 0.1254902, 1,
2.066591, 0.6482893, 0.8944935, 1, 0, 0.1215686, 1,
2.074748, -0.8380435, 0.3917348, 1, 0, 0.1137255, 1,
2.09384, -0.2644531, 2.548484, 1, 0, 0.1098039, 1,
2.110968, -1.193511, 2.607916, 1, 0, 0.1019608, 1,
2.111897, -0.7310873, 1.9869, 1, 0, 0.09411765, 1,
2.166123, -1.210661, 0.9611186, 1, 0, 0.09019608, 1,
2.167143, -0.23097, 2.760201, 1, 0, 0.08235294, 1,
2.169193, -0.5933818, 1.072455, 1, 0, 0.07843138, 1,
2.23969, -1.23811, 3.494963, 1, 0, 0.07058824, 1,
2.295593, 0.8752139, 0.943947, 1, 0, 0.06666667, 1,
2.307849, 0.2754599, 3.80792, 1, 0, 0.05882353, 1,
2.317404, -2.913435, 2.460604, 1, 0, 0.05490196, 1,
2.334337, 0.6221657, 0.7639084, 1, 0, 0.04705882, 1,
2.394662, 1.06257, 2.507965, 1, 0, 0.04313726, 1,
2.432195, -1.85881, 2.978161, 1, 0, 0.03529412, 1,
2.528372, -1.095541, 2.737532, 1, 0, 0.03137255, 1,
2.633159, 1.062638, 1.423668, 1, 0, 0.02352941, 1,
2.655257, -0.9711382, 1.471796, 1, 0, 0.01960784, 1,
2.830549, 0.5710552, 0.9216906, 1, 0, 0.01176471, 1,
3.343585, 0.3844321, 2.275708, 1, 0, 0.007843138, 1
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
0.2435687, -3.897532, -7.780542, 0, -0.5, 0.5, 0.5,
0.2435687, -3.897532, -7.780542, 1, -0.5, 0.5, 0.5,
0.2435687, -3.897532, -7.780542, 1, 1.5, 0.5, 0.5,
0.2435687, -3.897532, -7.780542, 0, 1.5, 0.5, 0.5
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
-3.907353, -0.01049638, -7.780542, 0, -0.5, 0.5, 0.5,
-3.907353, -0.01049638, -7.780542, 1, -0.5, 0.5, 0.5,
-3.907353, -0.01049638, -7.780542, 1, 1.5, 0.5, 0.5,
-3.907353, -0.01049638, -7.780542, 0, 1.5, 0.5, 0.5
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
-3.907353, -3.897532, -0.06766772, 0, -0.5, 0.5, 0.5,
-3.907353, -3.897532, -0.06766772, 1, -0.5, 0.5, 0.5,
-3.907353, -3.897532, -0.06766772, 1, 1.5, 0.5, 0.5,
-3.907353, -3.897532, -0.06766772, 0, 1.5, 0.5, 0.5
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
-2, -3.000523, -6.000648,
3, -3.000523, -6.000648,
-2, -3.000523, -6.000648,
-2, -3.150025, -6.297297,
-1, -3.000523, -6.000648,
-1, -3.150025, -6.297297,
0, -3.000523, -6.000648,
0, -3.150025, -6.297297,
1, -3.000523, -6.000648,
1, -3.150025, -6.297297,
2, -3.000523, -6.000648,
2, -3.150025, -6.297297,
3, -3.000523, -6.000648,
3, -3.150025, -6.297297
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
-2, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
-2, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
-2, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
-2, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5,
-1, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
-1, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
-1, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
-1, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5,
0, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
0, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
0, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
0, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5,
1, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
1, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
1, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
1, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5,
2, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
2, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
2, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
2, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5,
3, -3.449028, -6.890595, 0, -0.5, 0.5, 0.5,
3, -3.449028, -6.890595, 1, -0.5, 0.5, 0.5,
3, -3.449028, -6.890595, 1, 1.5, 0.5, 0.5,
3, -3.449028, -6.890595, 0, 1.5, 0.5, 0.5
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
-2.949448, -2, -6.000648,
-2.949448, 2, -6.000648,
-2.949448, -2, -6.000648,
-3.109099, -2, -6.297297,
-2.949448, -1, -6.000648,
-3.109099, -1, -6.297297,
-2.949448, 0, -6.000648,
-3.109099, 0, -6.297297,
-2.949448, 1, -6.000648,
-3.109099, 1, -6.297297,
-2.949448, 2, -6.000648,
-3.109099, 2, -6.297297
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
-3.428401, -2, -6.890595, 0, -0.5, 0.5, 0.5,
-3.428401, -2, -6.890595, 1, -0.5, 0.5, 0.5,
-3.428401, -2, -6.890595, 1, 1.5, 0.5, 0.5,
-3.428401, -2, -6.890595, 0, 1.5, 0.5, 0.5,
-3.428401, -1, -6.890595, 0, -0.5, 0.5, 0.5,
-3.428401, -1, -6.890595, 1, -0.5, 0.5, 0.5,
-3.428401, -1, -6.890595, 1, 1.5, 0.5, 0.5,
-3.428401, -1, -6.890595, 0, 1.5, 0.5, 0.5,
-3.428401, 0, -6.890595, 0, -0.5, 0.5, 0.5,
-3.428401, 0, -6.890595, 1, -0.5, 0.5, 0.5,
-3.428401, 0, -6.890595, 1, 1.5, 0.5, 0.5,
-3.428401, 0, -6.890595, 0, 1.5, 0.5, 0.5,
-3.428401, 1, -6.890595, 0, -0.5, 0.5, 0.5,
-3.428401, 1, -6.890595, 1, -0.5, 0.5, 0.5,
-3.428401, 1, -6.890595, 1, 1.5, 0.5, 0.5,
-3.428401, 1, -6.890595, 0, 1.5, 0.5, 0.5,
-3.428401, 2, -6.890595, 0, -0.5, 0.5, 0.5,
-3.428401, 2, -6.890595, 1, -0.5, 0.5, 0.5,
-3.428401, 2, -6.890595, 1, 1.5, 0.5, 0.5,
-3.428401, 2, -6.890595, 0, 1.5, 0.5, 0.5
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
-2.949448, -3.000523, -4,
-2.949448, -3.000523, 4,
-2.949448, -3.000523, -4,
-3.109099, -3.150025, -4,
-2.949448, -3.000523, -2,
-3.109099, -3.150025, -2,
-2.949448, -3.000523, 0,
-3.109099, -3.150025, 0,
-2.949448, -3.000523, 2,
-3.109099, -3.150025, 2,
-2.949448, -3.000523, 4,
-3.109099, -3.150025, 4
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
-3.428401, -3.449028, -4, 0, -0.5, 0.5, 0.5,
-3.428401, -3.449028, -4, 1, -0.5, 0.5, 0.5,
-3.428401, -3.449028, -4, 1, 1.5, 0.5, 0.5,
-3.428401, -3.449028, -4, 0, 1.5, 0.5, 0.5,
-3.428401, -3.449028, -2, 0, -0.5, 0.5, 0.5,
-3.428401, -3.449028, -2, 1, -0.5, 0.5, 0.5,
-3.428401, -3.449028, -2, 1, 1.5, 0.5, 0.5,
-3.428401, -3.449028, -2, 0, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 0, 0, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 0, 1, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 0, 1, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 0, 0, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 2, 0, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 2, 1, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 2, 1, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 2, 0, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 4, 0, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 4, 1, -0.5, 0.5, 0.5,
-3.428401, -3.449028, 4, 1, 1.5, 0.5, 0.5,
-3.428401, -3.449028, 4, 0, 1.5, 0.5, 0.5
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
-2.949448, -3.000523, -6.000648,
-2.949448, 2.979531, -6.000648,
-2.949448, -3.000523, 5.865313,
-2.949448, 2.979531, 5.865313,
-2.949448, -3.000523, -6.000648,
-2.949448, -3.000523, 5.865313,
-2.949448, 2.979531, -6.000648,
-2.949448, 2.979531, 5.865313,
-2.949448, -3.000523, -6.000648,
3.436585, -3.000523, -6.000648,
-2.949448, -3.000523, 5.865313,
3.436585, -3.000523, 5.865313,
-2.949448, 2.979531, -6.000648,
3.436585, 2.979531, -6.000648,
-2.949448, 2.979531, 5.865313,
3.436585, 2.979531, 5.865313,
3.436585, -3.000523, -6.000648,
3.436585, 2.979531, -6.000648,
3.436585, -3.000523, 5.865313,
3.436585, 2.979531, 5.865313,
3.436585, -3.000523, -6.000648,
3.436585, -3.000523, 5.865313,
3.436585, 2.979531, -6.000648,
3.436585, 2.979531, 5.865313
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
var radius = 7.872248;
var distance = 35.02452;
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
mvMatrix.translate( -0.2435687, 0.01049638, 0.06766772 );
mvMatrix.scale( 1.332851, 1.423337, 0.7173148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.02452);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
copper_monoethanolam<-read.table("copper_monoethanolam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-copper_monoethanolam$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
```

```r
y<-copper_monoethanolam$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
```

```r
z<-copper_monoethanolam$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
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
-2.856448, 2.719155, -0.01606693, 0, 0, 1, 1, 1,
-2.735984, -1.632301, -3.048718, 1, 0, 0, 1, 1,
-2.725849, 0.5139582, -1.916662, 1, 0, 0, 1, 1,
-2.677006, 0.6520109, -1.030099, 1, 0, 0, 1, 1,
-2.587016, 0.2675804, -2.457808, 1, 0, 0, 1, 1,
-2.565378, -0.4654621, -1.99002, 1, 0, 0, 1, 1,
-2.450084, 1.927154, 0.6425182, 0, 0, 0, 1, 1,
-2.436485, 0.2296371, -1.684287, 0, 0, 0, 1, 1,
-2.335706, -0.9226719, -2.556973, 0, 0, 0, 1, 1,
-2.319966, 1.784311, -2.075124, 0, 0, 0, 1, 1,
-2.310201, 0.3993237, -1.824891, 0, 0, 0, 1, 1,
-2.279278, 0.5190119, -0.6041216, 0, 0, 0, 1, 1,
-2.272772, -0.1531801, -1.646079, 0, 0, 0, 1, 1,
-2.269854, -0.2523501, -2.675018, 1, 1, 1, 1, 1,
-2.245658, -1.109291, -1.076622, 1, 1, 1, 1, 1,
-2.208944, 0.37086, -1.253878, 1, 1, 1, 1, 1,
-2.197463, 2.892442, -1.662542, 1, 1, 1, 1, 1,
-2.122624, -1.133122, -2.231278, 1, 1, 1, 1, 1,
-2.092767, 1.084264, -1.038767, 1, 1, 1, 1, 1,
-2.059011, 0.07583099, -0.1590789, 1, 1, 1, 1, 1,
-2.0487, -0.0444653, -1.107029, 1, 1, 1, 1, 1,
-2.041754, -0.9656994, -0.7973072, 1, 1, 1, 1, 1,
-2.035354, -1.287548, -0.9096544, 1, 1, 1, 1, 1,
-2.022175, -0.9377148, -1.93562, 1, 1, 1, 1, 1,
-2.015482, -0.6387126, -0.7866052, 1, 1, 1, 1, 1,
-2.002948, 1.045976, -0.03544604, 1, 1, 1, 1, 1,
-1.965869, -0.03301928, -1.531207, 1, 1, 1, 1, 1,
-1.961392, 0.4997171, -2.580712, 1, 1, 1, 1, 1,
-1.94976, 0.1371678, -2.16849, 0, 0, 1, 1, 1,
-1.939649, 1.281649, -0.1093339, 1, 0, 0, 1, 1,
-1.927477, 0.8364462, 0.8495355, 1, 0, 0, 1, 1,
-1.913932, 0.840646, -1.573625, 1, 0, 0, 1, 1,
-1.890814, -0.8025922, -1.671183, 1, 0, 0, 1, 1,
-1.850972, -1.475514, -0.6129156, 1, 0, 0, 1, 1,
-1.8215, -0.165239, -2.527202, 0, 0, 0, 1, 1,
-1.813439, -0.01841514, -0.8334806, 0, 0, 0, 1, 1,
-1.805683, -0.09071268, -2.255869, 0, 0, 0, 1, 1,
-1.792095, 0.7848814, -1.779385, 0, 0, 0, 1, 1,
-1.776708, 2.016943, 0.3215158, 0, 0, 0, 1, 1,
-1.762858, -1.598382, -0.7858373, 0, 0, 0, 1, 1,
-1.749087, -0.4337666, -1.982028, 0, 0, 0, 1, 1,
-1.745744, -0.599356, -2.61052, 1, 1, 1, 1, 1,
-1.728175, 0.006856455, -0.4830897, 1, 1, 1, 1, 1,
-1.721111, -0.05606391, -1.687525, 1, 1, 1, 1, 1,
-1.703085, 0.138241, -1.377561, 1, 1, 1, 1, 1,
-1.696807, 0.5504832, -1.654654, 1, 1, 1, 1, 1,
-1.693808, -0.781762, -1.191306, 1, 1, 1, 1, 1,
-1.689573, 1.404884, -0.5793627, 1, 1, 1, 1, 1,
-1.679432, -0.3776779, -2.757711, 1, 1, 1, 1, 1,
-1.678664, -2.244219, -5.827843, 1, 1, 1, 1, 1,
-1.664933, -0.08316789, -2.624849, 1, 1, 1, 1, 1,
-1.654823, 0.5813748, -0.08667, 1, 1, 1, 1, 1,
-1.650692, 0.7567487, -2.063241, 1, 1, 1, 1, 1,
-1.586976, 1.659165, -0.03892556, 1, 1, 1, 1, 1,
-1.575444, 0.1724206, 0.299052, 1, 1, 1, 1, 1,
-1.54553, 0.778743, -0.9059424, 1, 1, 1, 1, 1,
-1.535557, 0.4671642, -1.578133, 0, 0, 1, 1, 1,
-1.520256, 1.364229, -0.8516119, 1, 0, 0, 1, 1,
-1.520032, 1.21092, -0.2597923, 1, 0, 0, 1, 1,
-1.516375, -0.06919438, -3.310771, 1, 0, 0, 1, 1,
-1.51316, 0.44429, -1.923262, 1, 0, 0, 1, 1,
-1.494057, 0.5116668, -1.260301, 1, 0, 0, 1, 1,
-1.485386, 0.5906025, -2.176278, 0, 0, 0, 1, 1,
-1.483859, 0.3535812, -2.023386, 0, 0, 0, 1, 1,
-1.483041, 0.02895525, -1.599421, 0, 0, 0, 1, 1,
-1.482824, 1.046103, -0.09471682, 0, 0, 0, 1, 1,
-1.481222, -0.2495083, -0.778068, 0, 0, 0, 1, 1,
-1.475605, 0.6806661, 0.4113502, 0, 0, 0, 1, 1,
-1.471919, 0.4490517, -1.645416, 0, 0, 0, 1, 1,
-1.434045, -2.054182, -2.780635, 1, 1, 1, 1, 1,
-1.433755, -0.1601335, -0.7835273, 1, 1, 1, 1, 1,
-1.431708, 0.5564035, -2.438113, 1, 1, 1, 1, 1,
-1.420214, 2.070709, 0.4722243, 1, 1, 1, 1, 1,
-1.415747, 0.9556321, -1.328237, 1, 1, 1, 1, 1,
-1.407308, -0.8979749, -3.027385, 1, 1, 1, 1, 1,
-1.406407, 0.4511622, -1.421706, 1, 1, 1, 1, 1,
-1.405925, -1.008375, -2.182667, 1, 1, 1, 1, 1,
-1.404967, 0.6090892, -1.135906, 1, 1, 1, 1, 1,
-1.385232, 0.3810653, 1.180292, 1, 1, 1, 1, 1,
-1.382078, -0.988924, -2.137556, 1, 1, 1, 1, 1,
-1.381902, -0.5621153, -1.977104, 1, 1, 1, 1, 1,
-1.381537, 1.151241, -1.356563, 1, 1, 1, 1, 1,
-1.378394, 1.504237, 0.3250796, 1, 1, 1, 1, 1,
-1.367402, 0.1833328, -2.312395, 1, 1, 1, 1, 1,
-1.366616, -1.146843, -1.940346, 0, 0, 1, 1, 1,
-1.366214, -0.611604, -1.426762, 1, 0, 0, 1, 1,
-1.365686, 1.494189, -2.063902, 1, 0, 0, 1, 1,
-1.364418, 0.5104614, -0.7931845, 1, 0, 0, 1, 1,
-1.354748, -2.511614, -4.295821, 1, 0, 0, 1, 1,
-1.344759, -0.4772756, -3.679351, 1, 0, 0, 1, 1,
-1.328769, 1.496522, -1.519218, 0, 0, 0, 1, 1,
-1.323585, -0.6878843, -1.663599, 0, 0, 0, 1, 1,
-1.323481, -0.4201798, -1.790733, 0, 0, 0, 1, 1,
-1.318441, -0.9952773, -4.823065, 0, 0, 0, 1, 1,
-1.318017, 0.7259416, -1.905774, 0, 0, 0, 1, 1,
-1.311145, 0.9125258, 0.01982511, 0, 0, 0, 1, 1,
-1.304024, -0.1151245, -1.888499, 0, 0, 0, 1, 1,
-1.303508, 1.849426, 0.5170681, 1, 1, 1, 1, 1,
-1.292576, -1.24502, -2.665519, 1, 1, 1, 1, 1,
-1.274254, 0.2741763, -0.178216, 1, 1, 1, 1, 1,
-1.267215, 0.003415153, 0.284685, 1, 1, 1, 1, 1,
-1.263053, 0.8007607, -1.275952, 1, 1, 1, 1, 1,
-1.25748, 0.2599016, -2.054772, 1, 1, 1, 1, 1,
-1.252623, 2.177012, -1.035674, 1, 1, 1, 1, 1,
-1.237313, -0.3946175, -1.947709, 1, 1, 1, 1, 1,
-1.233848, 0.2696846, -1.531453, 1, 1, 1, 1, 1,
-1.226895, -2.043839, -1.305931, 1, 1, 1, 1, 1,
-1.2246, 0.1156742, -1.558383, 1, 1, 1, 1, 1,
-1.223879, -1.415218, -3.065722, 1, 1, 1, 1, 1,
-1.223474, -1.764531, -1.322692, 1, 1, 1, 1, 1,
-1.220814, -0.3728989, -2.077665, 1, 1, 1, 1, 1,
-1.211512, -1.167661, -2.838629, 1, 1, 1, 1, 1,
-1.210945, 1.404039, -0.4568073, 0, 0, 1, 1, 1,
-1.209221, 0.6595188, -0.06151917, 1, 0, 0, 1, 1,
-1.204722, -0.7628258, -2.156497, 1, 0, 0, 1, 1,
-1.194356, 0.515191, -1.397748, 1, 0, 0, 1, 1,
-1.189377, -1.373236, -3.514045, 1, 0, 0, 1, 1,
-1.185241, 0.1544053, -0.7054659, 1, 0, 0, 1, 1,
-1.183858, 1.811447, 1.133528, 0, 0, 0, 1, 1,
-1.175665, -0.7507467, -2.769797, 0, 0, 0, 1, 1,
-1.175072, 0.6165357, -0.4982912, 0, 0, 0, 1, 1,
-1.172819, 2.579824, -1.61789, 0, 0, 0, 1, 1,
-1.165402, 1.013926, -1.661211, 0, 0, 0, 1, 1,
-1.161131, 1.902558, -0.5720248, 0, 0, 0, 1, 1,
-1.154246, 0.5240979, -0.4345216, 0, 0, 0, 1, 1,
-1.152316, -0.1240019, -0.749727, 1, 1, 1, 1, 1,
-1.150487, -0.4232939, -3.526878, 1, 1, 1, 1, 1,
-1.14423, 0.5357614, -0.4845522, 1, 1, 1, 1, 1,
-1.134931, -0.7580984, -3.384861, 1, 1, 1, 1, 1,
-1.127185, -1.604198, -1.186683, 1, 1, 1, 1, 1,
-1.124351, 1.145175, -1.080642, 1, 1, 1, 1, 1,
-1.119299, 0.1091693, -3.231333, 1, 1, 1, 1, 1,
-1.118872, -0.06429961, -2.861941, 1, 1, 1, 1, 1,
-1.116242, 0.6797315, -2.285781, 1, 1, 1, 1, 1,
-1.113673, -2.179286, -1.922295, 1, 1, 1, 1, 1,
-1.103629, -2.0504, -1.156828, 1, 1, 1, 1, 1,
-1.099609, -0.6557871, -2.882304, 1, 1, 1, 1, 1,
-1.093188, 0.4853643, -1.555023, 1, 1, 1, 1, 1,
-1.085415, 1.437001, -0.8036131, 1, 1, 1, 1, 1,
-1.082536, -0.6317982, -1.925485, 1, 1, 1, 1, 1,
-1.081186, -0.7980954, -1.366632, 0, 0, 1, 1, 1,
-1.079103, -1.56123, -1.956965, 1, 0, 0, 1, 1,
-1.076858, -1.006604, -2.87283, 1, 0, 0, 1, 1,
-1.071608, -0.4746346, -0.1819229, 1, 0, 0, 1, 1,
-1.067762, -0.3714963, -2.2234, 1, 0, 0, 1, 1,
-1.063745, -0.06009668, -1.930264, 1, 0, 0, 1, 1,
-1.062186, -0.4024664, -2.381829, 0, 0, 0, 1, 1,
-1.054771, 0.4865774, 0.2415816, 0, 0, 0, 1, 1,
-1.053092, -0.4397022, 0.3439772, 0, 0, 0, 1, 1,
-1.04546, -0.3891286, -1.154441, 0, 0, 0, 1, 1,
-1.043276, 0.2745534, -0.6977593, 0, 0, 0, 1, 1,
-1.037711, 0.5241039, -1.034974, 0, 0, 0, 1, 1,
-1.023209, 0.3964536, 0.4209756, 0, 0, 0, 1, 1,
-1.009985, 0.4053646, -2.404279, 1, 1, 1, 1, 1,
-1.006492, -0.7650322, -2.725241, 1, 1, 1, 1, 1,
-1.000115, -0.5271838, -3.271191, 1, 1, 1, 1, 1,
-0.9998884, -0.1380858, -0.9198853, 1, 1, 1, 1, 1,
-0.9984176, 0.8571372, -0.5033625, 1, 1, 1, 1, 1,
-0.9979709, -0.7150455, -2.533142, 1, 1, 1, 1, 1,
-0.9832315, -1.10521, -3.510183, 1, 1, 1, 1, 1,
-0.9735883, -0.9785745, -1.443642, 1, 1, 1, 1, 1,
-0.9664187, 0.3052811, -2.114966, 1, 1, 1, 1, 1,
-0.9657658, 0.402087, 1.434932, 1, 1, 1, 1, 1,
-0.9605292, 0.1516309, -0.9850928, 1, 1, 1, 1, 1,
-0.9474558, 1.730903, 0.610607, 1, 1, 1, 1, 1,
-0.9473358, 1.075457, 0.04959094, 1, 1, 1, 1, 1,
-0.9424036, -1.293223, -0.7347285, 1, 1, 1, 1, 1,
-0.9395854, 0.6009709, 0.424661, 1, 1, 1, 1, 1,
-0.9313687, -0.5287963, -2.628466, 0, 0, 1, 1, 1,
-0.9207078, 0.00345475, -2.85012, 1, 0, 0, 1, 1,
-0.9187987, 0.8518237, -0.7694317, 1, 0, 0, 1, 1,
-0.9175977, 1.360228, 0.7937498, 1, 0, 0, 1, 1,
-0.9120807, 0.07494015, -1.297858, 1, 0, 0, 1, 1,
-0.9087472, -0.01158935, 0.9217746, 1, 0, 0, 1, 1,
-0.9084731, -1.506036, -3.107737, 0, 0, 0, 1, 1,
-0.9074425, -1.14664, -2.008973, 0, 0, 0, 1, 1,
-0.8977255, -1.75531, -4.441841, 0, 0, 0, 1, 1,
-0.8953744, -0.3212827, -0.501378, 0, 0, 0, 1, 1,
-0.8935751, -0.2056596, -1.248402, 0, 0, 0, 1, 1,
-0.8901162, -1.067122, -1.962995, 0, 0, 0, 1, 1,
-0.8875656, 1.944061, -1.341206, 0, 0, 0, 1, 1,
-0.8852686, -0.1130169, -1.179466, 1, 1, 1, 1, 1,
-0.8823501, 0.923917, -1.200972, 1, 1, 1, 1, 1,
-0.8819776, -1.446282, -2.20801, 1, 1, 1, 1, 1,
-0.8775753, 0.3238651, -0.0960768, 1, 1, 1, 1, 1,
-0.8738539, 1.625681, 0.1538616, 1, 1, 1, 1, 1,
-0.8715209, -1.606945, -3.333528, 1, 1, 1, 1, 1,
-0.8706257, 0.4145948, -0.5874434, 1, 1, 1, 1, 1,
-0.862745, -1.540784, -2.287863, 1, 1, 1, 1, 1,
-0.8551782, 1.743796, -0.2421276, 1, 1, 1, 1, 1,
-0.8524827, 0.849026, -1.91662, 1, 1, 1, 1, 1,
-0.851609, -1.874084, -3.236751, 1, 1, 1, 1, 1,
-0.8506521, -0.5942018, -1.974682, 1, 1, 1, 1, 1,
-0.8436368, 0.7012834, -1.134683, 1, 1, 1, 1, 1,
-0.8317457, -0.7792761, -2.876213, 1, 1, 1, 1, 1,
-0.8283771, 1.116621, -1.044717, 1, 1, 1, 1, 1,
-0.8241482, -1.608833, -3.279388, 0, 0, 1, 1, 1,
-0.8206126, -0.2018797, -0.9107433, 1, 0, 0, 1, 1,
-0.8162028, 0.1512008, 0.3717525, 1, 0, 0, 1, 1,
-0.8153452, -0.4834423, -2.905129, 1, 0, 0, 1, 1,
-0.8141357, 0.592353, -0.6494861, 1, 0, 0, 1, 1,
-0.8076481, -0.3188735, -2.311222, 1, 0, 0, 1, 1,
-0.8022352, -0.2991905, -1.90602, 0, 0, 0, 1, 1,
-0.79941, 1.070932, -1.851219, 0, 0, 0, 1, 1,
-0.7980878, -1.040789, -2.57205, 0, 0, 0, 1, 1,
-0.7973477, -0.6196175, -1.440785, 0, 0, 0, 1, 1,
-0.7965087, 1.026778, -0.6586767, 0, 0, 0, 1, 1,
-0.7963578, 1.961516, -1.275619, 0, 0, 0, 1, 1,
-0.791926, -0.5665838, -2.988224, 0, 0, 0, 1, 1,
-0.7892131, 0.9990126, -2.324609, 1, 1, 1, 1, 1,
-0.7891007, 1.014425, -1.361506, 1, 1, 1, 1, 1,
-0.7870041, 1.045546, -2.372379, 1, 1, 1, 1, 1,
-0.7835935, -1.309439, -2.974377, 1, 1, 1, 1, 1,
-0.7755272, -0.7176859, -3.684108, 1, 1, 1, 1, 1,
-0.773037, -1.257149, -2.943666, 1, 1, 1, 1, 1,
-0.7706314, 1.069309, -1.39146, 1, 1, 1, 1, 1,
-0.7632505, 0.1076757, 0.0833522, 1, 1, 1, 1, 1,
-0.7582828, 0.05389613, -2.104636, 1, 1, 1, 1, 1,
-0.7580629, -0.687628, -1.723541, 1, 1, 1, 1, 1,
-0.7549536, -0.04558032, -3.408601, 1, 1, 1, 1, 1,
-0.7390355, -0.2704392, -1.064944, 1, 1, 1, 1, 1,
-0.7381778, -0.4885311, -3.127149, 1, 1, 1, 1, 1,
-0.7374044, 1.23945, 2.534168, 1, 1, 1, 1, 1,
-0.7356507, -0.09933472, 0.9526611, 1, 1, 1, 1, 1,
-0.734983, 1.693555, -0.9691561, 0, 0, 1, 1, 1,
-0.733759, 0.4296695, -2.012824, 1, 0, 0, 1, 1,
-0.7191133, -1.704475, -3.907644, 1, 0, 0, 1, 1,
-0.7189835, 0.9757359, 1.358312, 1, 0, 0, 1, 1,
-0.718244, -2.252484, -0.3013565, 1, 0, 0, 1, 1,
-0.7119246, -2.609632, -3.652903, 1, 0, 0, 1, 1,
-0.708612, -1.644014, -1.965398, 0, 0, 0, 1, 1,
-0.7062068, 1.997896, 0.09623165, 0, 0, 0, 1, 1,
-0.7036882, -1.960972, -2.081587, 0, 0, 0, 1, 1,
-0.7006607, -0.8416043, -4.710148, 0, 0, 0, 1, 1,
-0.6985366, 1.103988, -1.018802, 0, 0, 0, 1, 1,
-0.6898312, 0.8862776, -0.9610773, 0, 0, 0, 1, 1,
-0.6855053, -1.123149, -1.57164, 0, 0, 0, 1, 1,
-0.6844217, 0.3817788, -2.297494, 1, 1, 1, 1, 1,
-0.6810521, -2.017427, -3.29486, 1, 1, 1, 1, 1,
-0.6794633, 1.652605, 0.2589017, 1, 1, 1, 1, 1,
-0.6792107, 0.7132169, -0.4423907, 1, 1, 1, 1, 1,
-0.6724424, 1.425263, 0.7872469, 1, 1, 1, 1, 1,
-0.6695195, 0.370022, 0.6380302, 1, 1, 1, 1, 1,
-0.6627037, -1.033722, -1.38183, 1, 1, 1, 1, 1,
-0.6621218, 1.290932, -0.3712288, 1, 1, 1, 1, 1,
-0.6563493, 0.08761127, -1.727132, 1, 1, 1, 1, 1,
-0.6510399, 1.477137, -2.111937, 1, 1, 1, 1, 1,
-0.648899, 0.9064729, -1.10964, 1, 1, 1, 1, 1,
-0.6361998, -0.8661717, -1.835723, 1, 1, 1, 1, 1,
-0.6347336, 1.187172, 0.3021882, 1, 1, 1, 1, 1,
-0.6302778, 0.5849763, -1.218861, 1, 1, 1, 1, 1,
-0.6246622, -0.3447518, -1.854334, 1, 1, 1, 1, 1,
-0.6169918, 0.6314541, 0.6383092, 0, 0, 1, 1, 1,
-0.616466, -0.9100224, -2.589802, 1, 0, 0, 1, 1,
-0.6124679, -0.1996563, -1.777497, 1, 0, 0, 1, 1,
-0.6012395, -1.229377, -1.744056, 1, 0, 0, 1, 1,
-0.6002566, -0.850696, -1.941869, 1, 0, 0, 1, 1,
-0.5983183, -0.1555744, -0.1810375, 1, 0, 0, 1, 1,
-0.5869949, -0.5295945, -3.27694, 0, 0, 0, 1, 1,
-0.5771819, 0.8010758, 0.06453609, 0, 0, 0, 1, 1,
-0.5734984, -1.576241, -3.430823, 0, 0, 0, 1, 1,
-0.5726598, -0.8541886, -4.074265, 0, 0, 0, 1, 1,
-0.5672184, -0.02723482, -1.896657, 0, 0, 0, 1, 1,
-0.5627143, 0.2344726, -1.297434, 0, 0, 0, 1, 1,
-0.5606999, 1.248187, -1.246127, 0, 0, 0, 1, 1,
-0.5596885, 1.037127, 0.1590264, 1, 1, 1, 1, 1,
-0.5571206, 0.6642558, -0.09044749, 1, 1, 1, 1, 1,
-0.5555134, -0.4017687, -2.007304, 1, 1, 1, 1, 1,
-0.5542324, -1.268635, -4.978983, 1, 1, 1, 1, 1,
-0.5540934, -0.2111665, -0.225007, 1, 1, 1, 1, 1,
-0.5513939, -0.999756, 0.3369991, 1, 1, 1, 1, 1,
-0.5482763, 0.4757823, -2.736073, 1, 1, 1, 1, 1,
-0.5474775, 1.166313, -0.5222151, 1, 1, 1, 1, 1,
-0.5460801, -0.6075909, -1.941465, 1, 1, 1, 1, 1,
-0.5325837, 0.120758, -1.09331, 1, 1, 1, 1, 1,
-0.5282867, -0.4648338, -4.488507, 1, 1, 1, 1, 1,
-0.5277038, -1.898299, -3.751798, 1, 1, 1, 1, 1,
-0.5253452, -0.4237972, -2.817727, 1, 1, 1, 1, 1,
-0.521931, 0.152779, -2.218418, 1, 1, 1, 1, 1,
-0.518318, 0.4923554, -0.9475845, 1, 1, 1, 1, 1,
-0.5154171, -0.3199733, -2.146538, 0, 0, 1, 1, 1,
-0.5146691, -0.2462319, -2.842022, 1, 0, 0, 1, 1,
-0.5108361, -0.3687812, -1.321062, 1, 0, 0, 1, 1,
-0.502543, 0.6711278, 0.1779308, 1, 0, 0, 1, 1,
-0.4981211, -1.964559, -3.833988, 1, 0, 0, 1, 1,
-0.495175, 0.2925939, -0.6450136, 1, 0, 0, 1, 1,
-0.4931905, 0.8482152, -2.974071, 0, 0, 0, 1, 1,
-0.4894614, -1.26119, -2.75736, 0, 0, 0, 1, 1,
-0.4846522, -0.2717564, -1.953872, 0, 0, 0, 1, 1,
-0.4791239, 1.854248, -2.745227, 0, 0, 0, 1, 1,
-0.4682452, -1.649098, -2.170985, 0, 0, 0, 1, 1,
-0.4663776, -1.687216, -3.064629, 0, 0, 0, 1, 1,
-0.4576345, -0.1806773, -2.74097, 0, 0, 0, 1, 1,
-0.4555298, 1.516856, -0.9040229, 1, 1, 1, 1, 1,
-0.4435116, -1.181171, -4.319777, 1, 1, 1, 1, 1,
-0.4399062, 0.006659382, -1.302463, 1, 1, 1, 1, 1,
-0.4397415, 1.267892, 0.1113907, 1, 1, 1, 1, 1,
-0.4372407, 0.1015177, -1.662374, 1, 1, 1, 1, 1,
-0.4365592, -1.448491, -1.530003, 1, 1, 1, 1, 1,
-0.4363558, 1.212661, -0.7303383, 1, 1, 1, 1, 1,
-0.4291114, -0.8450893, -2.652394, 1, 1, 1, 1, 1,
-0.4290708, -1.586723, -2.431498, 1, 1, 1, 1, 1,
-0.4261684, 1.771124, -2.144252, 1, 1, 1, 1, 1,
-0.4235184, -1.346066, -2.351393, 1, 1, 1, 1, 1,
-0.4214861, -0.46526, -2.535225, 1, 1, 1, 1, 1,
-0.4210092, 0.01383248, -1.157533, 1, 1, 1, 1, 1,
-0.4198201, -1.36532, -1.756241, 1, 1, 1, 1, 1,
-0.4165427, 0.9593268, -0.4755707, 1, 1, 1, 1, 1,
-0.4146898, -1.104255, -2.371909, 0, 0, 1, 1, 1,
-0.4050924, -2.081372, -0.5029011, 1, 0, 0, 1, 1,
-0.4044264, 0.3332736, -2.333729, 1, 0, 0, 1, 1,
-0.4024244, 0.8767378, -1.968455, 1, 0, 0, 1, 1,
-0.4005666, -1.919376, -1.599856, 1, 0, 0, 1, 1,
-0.3999581, 1.000682, 0.4543093, 1, 0, 0, 1, 1,
-0.3991787, 0.1585788, -0.8269924, 0, 0, 0, 1, 1,
-0.396155, -0.6302499, -0.9063193, 0, 0, 0, 1, 1,
-0.39455, -1.317476, -1.701846, 0, 0, 0, 1, 1,
-0.3935831, -1.839946, -3.57413, 0, 0, 0, 1, 1,
-0.3924828, -0.9170759, -3.073861, 0, 0, 0, 1, 1,
-0.3917419, 1.222662, 0.01007932, 0, 0, 0, 1, 1,
-0.3916161, 0.0462928, -2.316985, 0, 0, 0, 1, 1,
-0.3907647, 0.2422017, -0.6283044, 1, 1, 1, 1, 1,
-0.3899814, 0.3109832, -2.679258, 1, 1, 1, 1, 1,
-0.3830303, 0.1400838, -2.507673, 1, 1, 1, 1, 1,
-0.3794234, -0.8422185, -3.437265, 1, 1, 1, 1, 1,
-0.3770647, -1.03046, -3.757994, 1, 1, 1, 1, 1,
-0.3757594, 2.811713, 1.372062, 1, 1, 1, 1, 1,
-0.3730375, 0.4629256, -0.878675, 1, 1, 1, 1, 1,
-0.3699677, -1.072148, -1.390028, 1, 1, 1, 1, 1,
-0.3692231, 0.1319845, -0.4522338, 1, 1, 1, 1, 1,
-0.3626065, -1.491408, -0.8825426, 1, 1, 1, 1, 1,
-0.3609265, -1.445416, -1.981793, 1, 1, 1, 1, 1,
-0.3571066, -0.2007074, -2.236048, 1, 1, 1, 1, 1,
-0.3534568, -0.2803778, -2.550312, 1, 1, 1, 1, 1,
-0.3532876, -0.2820956, -2.790824, 1, 1, 1, 1, 1,
-0.352073, -1.010474, -2.991704, 1, 1, 1, 1, 1,
-0.347878, -1.378162, -3.735132, 0, 0, 1, 1, 1,
-0.3447607, -0.5836753, -2.104306, 1, 0, 0, 1, 1,
-0.3426839, 0.1311547, -1.156308, 1, 0, 0, 1, 1,
-0.3425401, 0.2156243, 0.1001481, 1, 0, 0, 1, 1,
-0.3425165, 1.036055, 0.8338929, 1, 0, 0, 1, 1,
-0.3408458, -1.713272, -4.884197, 1, 0, 0, 1, 1,
-0.3397535, 1.093664, -0.7838496, 0, 0, 0, 1, 1,
-0.3367369, 0.7832338, 1.739622, 0, 0, 0, 1, 1,
-0.3357976, -0.4075321, -4.170918, 0, 0, 0, 1, 1,
-0.3340659, 0.9737516, 0.9030458, 0, 0, 0, 1, 1,
-0.3251627, 0.4481263, -1.528542, 0, 0, 0, 1, 1,
-0.324412, -2.614425, -2.565138, 0, 0, 0, 1, 1,
-0.3226142, 1.443144, -0.4242464, 0, 0, 0, 1, 1,
-0.3195545, -0.2492615, -3.354978, 1, 1, 1, 1, 1,
-0.3191434, 0.1891583, -3.120331, 1, 1, 1, 1, 1,
-0.3190932, -1.284474, -3.57965, 1, 1, 1, 1, 1,
-0.3144327, 0.7729841, 0.6102705, 1, 1, 1, 1, 1,
-0.3102685, -1.318231, -3.465753, 1, 1, 1, 1, 1,
-0.3083414, 0.2463229, 1.005058, 1, 1, 1, 1, 1,
-0.3062967, 0.6531203, -1.261454, 1, 1, 1, 1, 1,
-0.2988103, -0.01152177, -2.29798, 1, 1, 1, 1, 1,
-0.2974315, -0.4343745, -2.471905, 1, 1, 1, 1, 1,
-0.2962359, -0.1566953, -0.7835332, 1, 1, 1, 1, 1,
-0.295358, 1.097777, -2.139621, 1, 1, 1, 1, 1,
-0.2934666, 0.8534797, 0.07020509, 1, 1, 1, 1, 1,
-0.2856882, -0.3066841, -3.02424, 1, 1, 1, 1, 1,
-0.2852683, 0.04559656, -2.152936, 1, 1, 1, 1, 1,
-0.2851263, -1.554846, -4.004827, 1, 1, 1, 1, 1,
-0.2821235, 0.975361, -1.652725, 0, 0, 1, 1, 1,
-0.2804368, 1.248445, -0.8971248, 1, 0, 0, 1, 1,
-0.2786087, -1.067902, -0.9871261, 1, 0, 0, 1, 1,
-0.2778618, 0.8675433, 2.330972, 1, 0, 0, 1, 1,
-0.2746423, -2.130741, -1.427577, 1, 0, 0, 1, 1,
-0.2743764, 0.1484421, -3.706665, 1, 0, 0, 1, 1,
-0.2737768, 0.2779895, 0.5261384, 0, 0, 0, 1, 1,
-0.2709601, -0.5674764, -2.748445, 0, 0, 0, 1, 1,
-0.2692716, -0.379508, -2.398551, 0, 0, 0, 1, 1,
-0.2687076, -0.2514847, -1.234366, 0, 0, 0, 1, 1,
-0.2638253, 1.412163, -0.4115113, 0, 0, 0, 1, 1,
-0.2547408, -0.4803305, -3.176703, 0, 0, 0, 1, 1,
-0.2538266, 0.05483448, -1.948786, 0, 0, 0, 1, 1,
-0.2504834, -1.157587, -4.845438, 1, 1, 1, 1, 1,
-0.2477917, -0.5261225, -5.088456, 1, 1, 1, 1, 1,
-0.246532, -0.9406687, -2.428668, 1, 1, 1, 1, 1,
-0.2455275, -0.31849, -2.314341, 1, 1, 1, 1, 1,
-0.2432526, 0.5486513, -1.371873, 1, 1, 1, 1, 1,
-0.242084, -0.2052542, -3.714058, 1, 1, 1, 1, 1,
-0.2417244, -1.003048, -3.341001, 1, 1, 1, 1, 1,
-0.2357124, 0.7776685, -1.717769, 1, 1, 1, 1, 1,
-0.2343637, 0.09726965, -1.047707, 1, 1, 1, 1, 1,
-0.2306345, -0.3739952, -3.657434, 1, 1, 1, 1, 1,
-0.2281854, 0.1618185, -1.911395, 1, 1, 1, 1, 1,
-0.2281087, 0.7036539, -0.7946347, 1, 1, 1, 1, 1,
-0.2178131, 0.4089583, 0.5371199, 1, 1, 1, 1, 1,
-0.2118637, -1.925275, -3.880235, 1, 1, 1, 1, 1,
-0.2099757, -0.660086, -3.693204, 1, 1, 1, 1, 1,
-0.2030309, -0.2558056, -3.046144, 0, 0, 1, 1, 1,
-0.1991644, 0.3380387, 0.01544118, 1, 0, 0, 1, 1,
-0.1983373, 0.4359336, -0.07830641, 1, 0, 0, 1, 1,
-0.1931912, -0.7387577, -3.533119, 1, 0, 0, 1, 1,
-0.1918935, 0.7181196, 0.1359215, 1, 0, 0, 1, 1,
-0.1916675, -0.06107592, -1.237519, 1, 0, 0, 1, 1,
-0.1915787, 1.061164, 0.8482605, 0, 0, 0, 1, 1,
-0.1888464, -0.3520767, -2.687757, 0, 0, 0, 1, 1,
-0.1852651, -0.8457995, -2.170094, 0, 0, 0, 1, 1,
-0.1805217, 0.3759382, -0.4324676, 0, 0, 0, 1, 1,
-0.1780267, 1.45831, 0.8778951, 0, 0, 0, 1, 1,
-0.1770192, 0.2133894, -0.3333318, 0, 0, 0, 1, 1,
-0.1736872, -0.6424566, -2.247947, 0, 0, 0, 1, 1,
-0.1730375, 1.155831, 0.2447168, 1, 1, 1, 1, 1,
-0.168865, 0.7844445, 0.8382936, 1, 1, 1, 1, 1,
-0.1674456, -1.182614, -4.708612, 1, 1, 1, 1, 1,
-0.167301, -1.073282, -4.411695, 1, 1, 1, 1, 1,
-0.1666414, 0.1353781, -2.33043, 1, 1, 1, 1, 1,
-0.1634594, -0.9525597, -3.73266, 1, 1, 1, 1, 1,
-0.1631322, -0.9826, -2.898639, 1, 1, 1, 1, 1,
-0.1587285, -0.4820642, -4.040133, 1, 1, 1, 1, 1,
-0.1565253, 0.8058298, 0.6303679, 1, 1, 1, 1, 1,
-0.1557455, -1.241667, -3.933935, 1, 1, 1, 1, 1,
-0.155496, -1.807861, -4.209929, 1, 1, 1, 1, 1,
-0.1546936, 0.175166, -1.079386, 1, 1, 1, 1, 1,
-0.1504036, 1.561361, 0.003340034, 1, 1, 1, 1, 1,
-0.1481047, 1.119304, 0.1510388, 1, 1, 1, 1, 1,
-0.1449541, 0.08739124, -1.04651, 1, 1, 1, 1, 1,
-0.1434605, -0.7107436, -3.084256, 0, 0, 1, 1, 1,
-0.1401677, -0.2171912, -3.652879, 1, 0, 0, 1, 1,
-0.139888, 1.112294, -0.003243318, 1, 0, 0, 1, 1,
-0.1390625, 0.5601129, -1.707715, 1, 0, 0, 1, 1,
-0.1360949, 1.456536, -1.104473, 1, 0, 0, 1, 1,
-0.1343748, -1.367118, -3.32241, 1, 0, 0, 1, 1,
-0.1340764, -0.2164248, -2.529214, 0, 0, 0, 1, 1,
-0.1325688, -0.9275984, -4.713992, 0, 0, 0, 1, 1,
-0.1307874, -0.6734651, -1.718767, 0, 0, 0, 1, 1,
-0.129581, 0.4838831, -0.9589108, 0, 0, 0, 1, 1,
-0.129063, 1.313429, -0.3675961, 0, 0, 0, 1, 1,
-0.1279285, -1.606209, -3.166476, 0, 0, 0, 1, 1,
-0.1244789, -0.412802, -3.918011, 0, 0, 0, 1, 1,
-0.1238597, 1.08524, 0.6596895, 1, 1, 1, 1, 1,
-0.1230589, 0.2471871, 0.1687827, 1, 1, 1, 1, 1,
-0.1225337, 0.5227472, 0.8014798, 1, 1, 1, 1, 1,
-0.1201236, -0.3012945, -2.379029, 1, 1, 1, 1, 1,
-0.1197464, 0.6886219, -0.1433775, 1, 1, 1, 1, 1,
-0.1173569, -0.4081438, -3.68804, 1, 1, 1, 1, 1,
-0.1161892, -0.3155243, -3.371255, 1, 1, 1, 1, 1,
-0.1141723, -0.4545819, -1.383337, 1, 1, 1, 1, 1,
-0.1100997, -2.042886, -2.705482, 1, 1, 1, 1, 1,
-0.1067225, 0.3985692, -0.5895255, 1, 1, 1, 1, 1,
-0.1053302, 0.7194344, 0.7620917, 1, 1, 1, 1, 1,
-0.09959744, -1.241207, -3.546764, 1, 1, 1, 1, 1,
-0.09880368, -0.8114624, -3.897397, 1, 1, 1, 1, 1,
-0.09706599, -0.7967063, -3.981478, 1, 1, 1, 1, 1,
-0.09657362, 1.289395, -1.578944, 1, 1, 1, 1, 1,
-0.09105137, -0.3390849, -3.275824, 0, 0, 1, 1, 1,
-0.09089268, 1.020425, -0.06301314, 1, 0, 0, 1, 1,
-0.09018568, 1.12846, -2.035362, 1, 0, 0, 1, 1,
-0.08922698, -0.3485548, -3.18174, 1, 0, 0, 1, 1,
-0.08730252, -0.706367, -3.032518, 1, 0, 0, 1, 1,
-0.08295786, 1.61107, -2.03477, 1, 0, 0, 1, 1,
-0.08210883, 0.02636754, -1.023493, 0, 0, 0, 1, 1,
-0.08049107, -0.1098884, -3.010212, 0, 0, 0, 1, 1,
-0.07381145, -1.775784, -4.452032, 0, 0, 0, 1, 1,
-0.06999449, 0.8514231, -0.2002137, 0, 0, 0, 1, 1,
-0.06505129, 0.3717262, -0.912843, 0, 0, 0, 1, 1,
-0.06465296, -0.1342872, -2.181609, 0, 0, 0, 1, 1,
-0.05855091, -0.2742585, -3.321774, 0, 0, 0, 1, 1,
-0.05753297, -0.2992326, -2.07679, 1, 1, 1, 1, 1,
-0.05488584, 0.429281, -1.320273, 1, 1, 1, 1, 1,
-0.05167092, 0.07037431, -1.171511, 1, 1, 1, 1, 1,
-0.05117966, -0.1960887, -3.293082, 1, 1, 1, 1, 1,
-0.04663065, -0.03954406, -0.7633008, 1, 1, 1, 1, 1,
-0.04561611, -0.3136247, -1.38873, 1, 1, 1, 1, 1,
-0.04506851, 1.240939, -0.1867935, 1, 1, 1, 1, 1,
-0.03099167, -1.969933, -3.597144, 1, 1, 1, 1, 1,
-0.02975563, -0.8996045, -1.718636, 1, 1, 1, 1, 1,
-0.02193568, -0.8820425, -4.198089, 1, 1, 1, 1, 1,
-0.02029654, 0.04503784, -0.09956595, 1, 1, 1, 1, 1,
-0.01772311, 0.7284304, -1.190383, 1, 1, 1, 1, 1,
-0.01768472, -0.1963572, -1.309844, 1, 1, 1, 1, 1,
-0.01764042, 0.3325879, 0.6075343, 1, 1, 1, 1, 1,
-0.01748738, 1.609581, -1.109455, 1, 1, 1, 1, 1,
-0.01460861, 0.1716309, -0.6993986, 0, 0, 1, 1, 1,
-0.009171621, -2.731304, -4.027733, 1, 0, 0, 1, 1,
-0.00768895, -0.0181146, -2.929815, 1, 0, 0, 1, 1,
-0.005492542, -1.335057, -1.872868, 1, 0, 0, 1, 1,
-0.002709329, 2.002219, -1.614983, 1, 0, 0, 1, 1,
-0.0001747521, 0.9987434, 0.6471151, 1, 0, 0, 1, 1,
-0.0001399158, -0.3682331, -1.539036, 0, 0, 0, 1, 1,
2.090349e-05, -0.1282048, 5.171389, 0, 0, 0, 1, 1,
6.007602e-05, -0.843182, 3.38313, 0, 0, 0, 1, 1,
0.00158198, 0.9067215, -1.697526, 0, 0, 0, 1, 1,
0.002014739, -1.406422, 4.749019, 0, 0, 0, 1, 1,
0.005309398, 0.1679887, 1.04064, 0, 0, 0, 1, 1,
0.006247828, -0.8868721, 2.446352, 0, 0, 0, 1, 1,
0.007169886, 0.4001382, -0.2668314, 1, 1, 1, 1, 1,
0.009121107, -0.4774432, 4.527682, 1, 1, 1, 1, 1,
0.01010752, -0.02108029, 2.680504, 1, 1, 1, 1, 1,
0.01169336, 0.2819613, -0.1655222, 1, 1, 1, 1, 1,
0.01209531, -0.03548472, 0.04617002, 1, 1, 1, 1, 1,
0.01835397, 2.363121, 0.9461864, 1, 1, 1, 1, 1,
0.01842698, -0.4452433, 2.793407, 1, 1, 1, 1, 1,
0.02124176, -1.034159, 2.937089, 1, 1, 1, 1, 1,
0.02346373, -0.1307211, 2.163525, 1, 1, 1, 1, 1,
0.03098519, -0.09028946, 1.914, 1, 1, 1, 1, 1,
0.03506964, 0.9439813, -0.1137389, 1, 1, 1, 1, 1,
0.03843606, 0.2769178, 0.3421893, 1, 1, 1, 1, 1,
0.03990107, -0.9506081, 3.748639, 1, 1, 1, 1, 1,
0.04195553, -0.409602, 3.598178, 1, 1, 1, 1, 1,
0.04283748, 0.6252666, 0.05434154, 1, 1, 1, 1, 1,
0.04341268, -0.3917784, 4.123165, 0, 0, 1, 1, 1,
0.04554028, 1.71841, 0.7383579, 1, 0, 0, 1, 1,
0.04682632, -0.8077943, 3.482923, 1, 0, 0, 1, 1,
0.04931531, 0.315541, 1.305453, 1, 0, 0, 1, 1,
0.05277389, -1.052595, 1.89743, 1, 0, 0, 1, 1,
0.05293835, -0.4879737, 5.692507, 1, 0, 0, 1, 1,
0.0557867, 0.4757597, 0.9425262, 0, 0, 0, 1, 1,
0.05747637, -1.808144, 4.302613, 0, 0, 0, 1, 1,
0.06782981, -1.397184, 2.075773, 0, 0, 0, 1, 1,
0.06836461, -0.7389091, 2.746095, 0, 0, 0, 1, 1,
0.06899142, -1.942514, 3.91537, 0, 0, 0, 1, 1,
0.0720516, -0.5126107, 2.598473, 0, 0, 0, 1, 1,
0.07553519, 1.637321, 0.6038202, 0, 0, 0, 1, 1,
0.07969685, 1.650328, -0.5178887, 1, 1, 1, 1, 1,
0.08370322, 0.2514044, -0.9514148, 1, 1, 1, 1, 1,
0.09091207, -1.70157, 3.865515, 1, 1, 1, 1, 1,
0.1023152, 0.623172, 0.4159867, 1, 1, 1, 1, 1,
0.1031983, 1.555025, 2.69958, 1, 1, 1, 1, 1,
0.1033335, 0.4007323, -0.654523, 1, 1, 1, 1, 1,
0.1046852, 2.538734, 0.03718271, 1, 1, 1, 1, 1,
0.1088505, -0.7493055, 3.238611, 1, 1, 1, 1, 1,
0.1089259, 1.794935, -0.9799032, 1, 1, 1, 1, 1,
0.1123919, -0.09673428, 2.521321, 1, 1, 1, 1, 1,
0.1143172, -0.6032682, 3.604876, 1, 1, 1, 1, 1,
0.1149804, -0.9011605, 1.219412, 1, 1, 1, 1, 1,
0.1159101, 1.141061, -0.9274849, 1, 1, 1, 1, 1,
0.1249318, 0.4121803, -0.4952615, 1, 1, 1, 1, 1,
0.1250054, 1.549784, 0.897081, 1, 1, 1, 1, 1,
0.1266768, 0.07598528, 1.482042, 0, 0, 1, 1, 1,
0.1272295, -0.7764322, 4.562788, 1, 0, 0, 1, 1,
0.1303704, -1.121778, 5.23272, 1, 0, 0, 1, 1,
0.1342473, -0.4812844, 3.667136, 1, 0, 0, 1, 1,
0.1358265, -0.0877103, 1.135674, 1, 0, 0, 1, 1,
0.13664, -1.033153, 1.533551, 1, 0, 0, 1, 1,
0.1373698, -0.3240224, 3.488004, 0, 0, 0, 1, 1,
0.1400109, -1.955566, 1.727945, 0, 0, 0, 1, 1,
0.1418107, 0.1506512, -0.8859988, 0, 0, 0, 1, 1,
0.1424336, 0.6698625, 2.154129, 0, 0, 0, 1, 1,
0.1465222, -0.1263553, 2.532022, 0, 0, 0, 1, 1,
0.1481702, -1.317132, 3.337971, 0, 0, 0, 1, 1,
0.1497709, 0.4164093, 0.6434784, 0, 0, 0, 1, 1,
0.1508872, 0.2107625, 1.078552, 1, 1, 1, 1, 1,
0.1517316, 0.1177327, 0.4262792, 1, 1, 1, 1, 1,
0.1524037, -1.931031, 2.83791, 1, 1, 1, 1, 1,
0.1536891, -1.676195, 1.659517, 1, 1, 1, 1, 1,
0.1540497, 0.7251878, 1.674947, 1, 1, 1, 1, 1,
0.1540826, -0.2962196, 1.447299, 1, 1, 1, 1, 1,
0.1546802, -1.621162, 2.85162, 1, 1, 1, 1, 1,
0.1562179, 0.551102, -0.03475098, 1, 1, 1, 1, 1,
0.1575981, 0.4694742, 0.3394346, 1, 1, 1, 1, 1,
0.1661142, 1.299075, 0.47031, 1, 1, 1, 1, 1,
0.1670923, 0.8501633, 0.414937, 1, 1, 1, 1, 1,
0.1676888, -0.9760095, 2.320703, 1, 1, 1, 1, 1,
0.1725978, 0.1885803, -1.717966, 1, 1, 1, 1, 1,
0.1727055, 1.808559, 0.3166222, 1, 1, 1, 1, 1,
0.1729443, 2.420851, 2.408576, 1, 1, 1, 1, 1,
0.1767453, 0.2998873, 1.891981, 0, 0, 1, 1, 1,
0.1769308, -0.7431967, 1.234268, 1, 0, 0, 1, 1,
0.1859868, 1.353475, 0.3809093, 1, 0, 0, 1, 1,
0.1874821, -0.3421744, 3.660122, 1, 0, 0, 1, 1,
0.1894889, -0.1018289, 2.200521, 1, 0, 0, 1, 1,
0.2015717, -1.400651, 2.780488, 1, 0, 0, 1, 1,
0.2029399, 0.8975669, 2.313319, 0, 0, 0, 1, 1,
0.2031323, -2.025413, 3.563451, 0, 0, 0, 1, 1,
0.2072435, -0.5739402, 1.337423, 0, 0, 0, 1, 1,
0.2079421, 0.6845605, 0.3407248, 0, 0, 0, 1, 1,
0.2081096, 1.429789, 1.899925, 0, 0, 0, 1, 1,
0.2145631, 1.118619, -2.898921, 0, 0, 0, 1, 1,
0.2146621, -2.315547, 4.44566, 0, 0, 0, 1, 1,
0.2200684, -0.5396597, 1.816174, 1, 1, 1, 1, 1,
0.2213515, 1.397508, 0.6717818, 1, 1, 1, 1, 1,
0.2264123, -0.4981368, 4.629107, 1, 1, 1, 1, 1,
0.2268849, -1.685912, 2.30505, 1, 1, 1, 1, 1,
0.238325, -0.5306717, 2.686899, 1, 1, 1, 1, 1,
0.2386716, -0.6551786, 4.097565, 1, 1, 1, 1, 1,
0.24184, -1.404485, 5.55125, 1, 1, 1, 1, 1,
0.244508, -0.1980099, 2.931319, 1, 1, 1, 1, 1,
0.2496894, 0.3084899, 3.208232, 1, 1, 1, 1, 1,
0.2513095, 0.7312527, -0.154745, 1, 1, 1, 1, 1,
0.2529731, -0.2676893, 3.830555, 1, 1, 1, 1, 1,
0.2542289, -0.08347448, 3.475577, 1, 1, 1, 1, 1,
0.2546735, -0.1427908, 2.559417, 1, 1, 1, 1, 1,
0.2546929, 0.3201565, -0.4062775, 1, 1, 1, 1, 1,
0.2556145, -1.222484, 2.899767, 1, 1, 1, 1, 1,
0.2559776, 1.28145, 0.5026376, 0, 0, 1, 1, 1,
0.2567517, -0.2387482, 3.054861, 1, 0, 0, 1, 1,
0.2636032, -0.1850879, 2.634072, 1, 0, 0, 1, 1,
0.2637249, -0.7960895, 2.518377, 1, 0, 0, 1, 1,
0.2673402, 0.05548146, 2.048666, 1, 0, 0, 1, 1,
0.2680193, -0.264691, 1.985828, 1, 0, 0, 1, 1,
0.270474, 0.4022873, -0.4543534, 0, 0, 0, 1, 1,
0.2735114, 0.1336261, -0.3168994, 0, 0, 0, 1, 1,
0.2773564, -0.5510195, 2.372778, 0, 0, 0, 1, 1,
0.2800498, 0.6487878, -0.1419156, 0, 0, 0, 1, 1,
0.2806629, -0.1177679, 2.656274, 0, 0, 0, 1, 1,
0.2817223, 0.4681306, 0.7397834, 0, 0, 0, 1, 1,
0.2824548, -0.1934794, 3.363679, 0, 0, 0, 1, 1,
0.2848123, 0.3492843, 0.05124837, 1, 1, 1, 1, 1,
0.285838, 1.740334, 0.9261792, 1, 1, 1, 1, 1,
0.2884862, 0.4086056, -0.4983228, 1, 1, 1, 1, 1,
0.2901755, -0.5391135, 3.066997, 1, 1, 1, 1, 1,
0.2921432, -0.2569063, 1.955708, 1, 1, 1, 1, 1,
0.3013508, 0.2116458, 1.272224, 1, 1, 1, 1, 1,
0.3018826, 0.4738571, -0.216786, 1, 1, 1, 1, 1,
0.3021331, 0.4601501, 1.301483, 1, 1, 1, 1, 1,
0.3028685, -0.9571328, 2.190845, 1, 1, 1, 1, 1,
0.3041003, -1.806228, 3.983798, 1, 1, 1, 1, 1,
0.3052122, 0.5939922, -0.1495759, 1, 1, 1, 1, 1,
0.3057628, 0.05480526, 1.097938, 1, 1, 1, 1, 1,
0.3069597, -1.470403, 3.424718, 1, 1, 1, 1, 1,
0.3140055, 2.611643, 0.6222489, 1, 1, 1, 1, 1,
0.3153389, 0.2121374, 0.7597325, 1, 1, 1, 1, 1,
0.320311, 1.126284, -0.9919551, 0, 0, 1, 1, 1,
0.3220169, -0.8162566, 2.226784, 1, 0, 0, 1, 1,
0.3220827, -0.5142023, 3.356769, 1, 0, 0, 1, 1,
0.3227126, 0.9617572, -0.4073854, 1, 0, 0, 1, 1,
0.3265805, -0.9335931, 1.504681, 1, 0, 0, 1, 1,
0.3369268, 0.8218959, 1.422299, 1, 0, 0, 1, 1,
0.3385882, -0.3401365, 2.021268, 0, 0, 0, 1, 1,
0.3387185, 0.8492855, 0.3189759, 0, 0, 0, 1, 1,
0.3409647, 0.2561481, 1.649527, 0, 0, 0, 1, 1,
0.3416935, 0.2987627, 0.5262702, 0, 0, 0, 1, 1,
0.3431009, 0.3282897, 3.606144, 0, 0, 0, 1, 1,
0.3461648, 0.4366701, 1.584124, 0, 0, 0, 1, 1,
0.3475599, 0.9399986, 0.9366472, 0, 0, 0, 1, 1,
0.3549942, 0.1882285, 2.283582, 1, 1, 1, 1, 1,
0.3563792, -0.8948781, 2.582959, 1, 1, 1, 1, 1,
0.3615438, 0.5743407, 0.1257599, 1, 1, 1, 1, 1,
0.3657095, -0.9874948, 1.862508, 1, 1, 1, 1, 1,
0.3670981, -0.0190841, 0.9048848, 1, 1, 1, 1, 1,
0.3686185, -1.226983, 2.568447, 1, 1, 1, 1, 1,
0.3764394, 0.8127431, 0.5949278, 1, 1, 1, 1, 1,
0.3779922, -0.1052162, 1.559744, 1, 1, 1, 1, 1,
0.3840698, 0.09846525, 2.194635, 1, 1, 1, 1, 1,
0.3855601, 1.129714, -0.1234184, 1, 1, 1, 1, 1,
0.3977173, 1.712591, 2.079925, 1, 1, 1, 1, 1,
0.3989466, 1.086856, 0.4656436, 1, 1, 1, 1, 1,
0.4030069, 1.332634, 0.7896675, 1, 1, 1, 1, 1,
0.404142, 1.923779, 0.07349829, 1, 1, 1, 1, 1,
0.4043766, -0.04887326, 2.686914, 1, 1, 1, 1, 1,
0.4056112, 1.27835, 0.8128424, 0, 0, 1, 1, 1,
0.4065554, -1.199727, 4.3297, 1, 0, 0, 1, 1,
0.4088566, -1.097391, 3.884876, 1, 0, 0, 1, 1,
0.4119603, -1.959903, 3.455991, 1, 0, 0, 1, 1,
0.4151388, -0.8816484, 2.162695, 1, 0, 0, 1, 1,
0.4154319, -0.2413817, 2.059413, 1, 0, 0, 1, 1,
0.4226142, 2.128573, 0.6686405, 0, 0, 0, 1, 1,
0.4238487, 1.000902, -0.1541315, 0, 0, 0, 1, 1,
0.4242985, 0.02713139, 1.369478, 0, 0, 0, 1, 1,
0.4249838, -1.079632, 3.155051, 0, 0, 0, 1, 1,
0.4322467, 0.9064217, 2.007687, 0, 0, 0, 1, 1,
0.4327911, -0.2352188, 4.651985, 0, 0, 0, 1, 1,
0.4363883, -0.04621, 1.481223, 0, 0, 0, 1, 1,
0.4380038, 0.6441173, 0.7374082, 1, 1, 1, 1, 1,
0.4386961, 2.03496, -0.2644121, 1, 1, 1, 1, 1,
0.4427318, -0.3418285, 2.884702, 1, 1, 1, 1, 1,
0.4448619, -0.9412603, 2.369772, 1, 1, 1, 1, 1,
0.4479003, 0.164436, 0.9140161, 1, 1, 1, 1, 1,
0.452708, 0.6303656, -0.2062816, 1, 1, 1, 1, 1,
0.4555703, 0.05365783, 1.724601, 1, 1, 1, 1, 1,
0.4586962, 0.5960016, 1.223965, 1, 1, 1, 1, 1,
0.4672256, 0.795405, -1.461145, 1, 1, 1, 1, 1,
0.4711074, 0.5967917, 1.97767, 1, 1, 1, 1, 1,
0.4722367, 0.2438602, 2.151067, 1, 1, 1, 1, 1,
0.4767426, -0.6231437, 3.74394, 1, 1, 1, 1, 1,
0.4881067, -2.122565, 2.232985, 1, 1, 1, 1, 1,
0.4902371, -0.8541071, 2.694512, 1, 1, 1, 1, 1,
0.4921756, 0.1859403, 1.754892, 1, 1, 1, 1, 1,
0.4989291, 0.8386322, 1.369022, 0, 0, 1, 1, 1,
0.502651, -0.2072362, 2.150923, 1, 0, 0, 1, 1,
0.5139289, -0.9463363, 2.694143, 1, 0, 0, 1, 1,
0.5165944, 1.731749, -0.8533265, 1, 0, 0, 1, 1,
0.5176059, 1.098725, 0.3920996, 1, 0, 0, 1, 1,
0.523935, 1.344359, 0.706287, 1, 0, 0, 1, 1,
0.5259773, 1.396807, 0.8380488, 0, 0, 0, 1, 1,
0.527054, -1.000281, 2.941136, 0, 0, 0, 1, 1,
0.5290976, -0.34142, 2.44341, 0, 0, 0, 1, 1,
0.531708, 1.096636, 0.9195516, 0, 0, 0, 1, 1,
0.5351162, -1.438612, 1.521573, 0, 0, 0, 1, 1,
0.5412261, -1.066918, 3.233896, 0, 0, 0, 1, 1,
0.541849, 0.5897549, -1.057098, 0, 0, 0, 1, 1,
0.5422333, -0.2036332, 2.641286, 1, 1, 1, 1, 1,
0.5435473, -1.371862, 2.424127, 1, 1, 1, 1, 1,
0.5446723, -0.6372352, 2.507633, 1, 1, 1, 1, 1,
0.5447, 1.227964, 0.5332733, 1, 1, 1, 1, 1,
0.5481943, -0.07739028, 0.1153445, 1, 1, 1, 1, 1,
0.5499598, -0.7736409, 2.857456, 1, 1, 1, 1, 1,
0.5502526, -0.2641495, 2.242447, 1, 1, 1, 1, 1,
0.5541206, -0.04799198, 0.8150125, 1, 1, 1, 1, 1,
0.5576211, -0.2582845, 2.305478, 1, 1, 1, 1, 1,
0.5641631, -0.3738799, 2.713547, 1, 1, 1, 1, 1,
0.5658436, -0.2882386, 1.599146, 1, 1, 1, 1, 1,
0.571867, -1.035464, 1.791757, 1, 1, 1, 1, 1,
0.5762903, 1.368484, -1.617499, 1, 1, 1, 1, 1,
0.5773167, -0.8459061, 2.740801, 1, 1, 1, 1, 1,
0.5797946, -0.5441664, 1.108385, 1, 1, 1, 1, 1,
0.5869144, -0.1364805, 0.7342387, 0, 0, 1, 1, 1,
0.5944049, -0.3855457, 1.676029, 1, 0, 0, 1, 1,
0.5950645, 0.4801107, 2.133553, 1, 0, 0, 1, 1,
0.5988285, -0.433548, 1.641129, 1, 0, 0, 1, 1,
0.60045, 0.3020751, 0.956131, 1, 0, 0, 1, 1,
0.6035262, 0.2928436, 0.4754143, 1, 0, 0, 1, 1,
0.6057429, 1.423128, -0.519645, 0, 0, 0, 1, 1,
0.6128483, -0.9601108, 0.9052675, 0, 0, 0, 1, 1,
0.6137452, -0.1411386, 1.213769, 0, 0, 0, 1, 1,
0.615554, -0.8293677, 3.141922, 0, 0, 0, 1, 1,
0.616247, 0.5590313, 0.1727494, 0, 0, 0, 1, 1,
0.6229259, -1.267072, 1.347893, 0, 0, 0, 1, 1,
0.6281332, 0.8201942, 2.812475, 0, 0, 0, 1, 1,
0.6286707, -1.224544, 4.104459, 1, 1, 1, 1, 1,
0.6289211, 0.07409935, 1.11105, 1, 1, 1, 1, 1,
0.6302249, 0.9279919, 0.3450332, 1, 1, 1, 1, 1,
0.6303833, -1.655033, 2.977678, 1, 1, 1, 1, 1,
0.634393, -0.7332403, 2.612082, 1, 1, 1, 1, 1,
0.6373678, 1.235229, 0.2589176, 1, 1, 1, 1, 1,
0.6467391, -0.7978206, 3.248124, 1, 1, 1, 1, 1,
0.6471093, -1.110528, 2.484983, 1, 1, 1, 1, 1,
0.6598141, 0.71425, -0.9294517, 1, 1, 1, 1, 1,
0.6598821, -0.3263353, 1.015081, 1, 1, 1, 1, 1,
0.6614722, 0.09408972, 2.300934, 1, 1, 1, 1, 1,
0.6657863, -0.6980532, 0.8201349, 1, 1, 1, 1, 1,
0.6683142, -0.5691639, 4.352684, 1, 1, 1, 1, 1,
0.6780726, 0.8389743, -0.4393545, 1, 1, 1, 1, 1,
0.6810252, -1.280937, 3.844701, 1, 1, 1, 1, 1,
0.6810812, 1.127559, 2.123024, 0, 0, 1, 1, 1,
0.6825757, -1.614951, 2.346821, 1, 0, 0, 1, 1,
0.6858343, 1.900259, 1.453418, 1, 0, 0, 1, 1,
0.6871099, 1.653779, 0.5725551, 1, 0, 0, 1, 1,
0.6945163, -0.4177894, 2.192128, 1, 0, 0, 1, 1,
0.7068072, 1.265184, -1.288469, 1, 0, 0, 1, 1,
0.7100955, -0.7332482, 1.69135, 0, 0, 0, 1, 1,
0.7136734, 0.8598197, 2.371234, 0, 0, 0, 1, 1,
0.7170442, 0.3891066, 0.3911884, 0, 0, 0, 1, 1,
0.7196423, -0.5513794, 1.493081, 0, 0, 0, 1, 1,
0.7219256, 0.9057342, -1.30779, 0, 0, 0, 1, 1,
0.7220849, -1.528598, 2.708296, 0, 0, 0, 1, 1,
0.7227291, 0.03041327, 0.855454, 0, 0, 0, 1, 1,
0.7239857, -0.0534269, 1.773451, 1, 1, 1, 1, 1,
0.727677, 0.08115905, 2.904315, 1, 1, 1, 1, 1,
0.7283256, 1.657361, 0.6743625, 1, 1, 1, 1, 1,
0.73232, 2.701569, 0.5453275, 1, 1, 1, 1, 1,
0.7385347, 0.1265281, 3.643187, 1, 1, 1, 1, 1,
0.7389999, 0.3087271, 1.844975, 1, 1, 1, 1, 1,
0.7414287, 0.7377359, 2.861605, 1, 1, 1, 1, 1,
0.7426894, -0.5641691, 1.003631, 1, 1, 1, 1, 1,
0.7436717, 1.141705, 0.008396707, 1, 1, 1, 1, 1,
0.7464439, -0.01928305, 0.9176293, 1, 1, 1, 1, 1,
0.7494612, -1.581501, 3.987613, 1, 1, 1, 1, 1,
0.7508409, 1.049661, -0.4202918, 1, 1, 1, 1, 1,
0.7528658, 0.06635258, 0.826761, 1, 1, 1, 1, 1,
0.7528834, -1.116675, 3.971009, 1, 1, 1, 1, 1,
0.7534692, 1.235149, 1.232977, 1, 1, 1, 1, 1,
0.7557092, -1.646441, 0.5654926, 0, 0, 1, 1, 1,
0.7584084, 1.161516, 1.442233, 1, 0, 0, 1, 1,
0.7692844, 0.7398504, 1.157008, 1, 0, 0, 1, 1,
0.7731326, -2.330596, 1.764797, 1, 0, 0, 1, 1,
0.7907153, 0.1924064, 2.999774, 1, 0, 0, 1, 1,
0.8058591, -2.335343, 3.783772, 1, 0, 0, 1, 1,
0.8072345, -1.437206, 3.092358, 0, 0, 0, 1, 1,
0.8074127, 0.5147653, 1.849363, 0, 0, 0, 1, 1,
0.8106485, 1.508688, 2.510518, 0, 0, 0, 1, 1,
0.8152311, -1.211261, 2.703852, 0, 0, 0, 1, 1,
0.817592, -0.7318658, 3.07612, 0, 0, 0, 1, 1,
0.8186573, -0.3853755, 2.832319, 0, 0, 0, 1, 1,
0.8194673, 1.565846, 0.4800766, 0, 0, 0, 1, 1,
0.8235738, -1.491443, 1.564106, 1, 1, 1, 1, 1,
0.8238773, 0.6124719, 1.368534, 1, 1, 1, 1, 1,
0.8379775, -0.35647, 3.21681, 1, 1, 1, 1, 1,
0.8399152, 0.7496324, 0.9323778, 1, 1, 1, 1, 1,
0.8403217, -0.06374725, 1.343087, 1, 1, 1, 1, 1,
0.8413067, -0.5339405, 2.618981, 1, 1, 1, 1, 1,
0.8425886, 1.210593, -0.5927896, 1, 1, 1, 1, 1,
0.8459887, -2.718493, 2.030707, 1, 1, 1, 1, 1,
0.8483053, -0.6831691, 1.568946, 1, 1, 1, 1, 1,
0.852666, 1.73468, -0.3698776, 1, 1, 1, 1, 1,
0.8541608, 1.078356, 1.558697, 1, 1, 1, 1, 1,
0.8579648, -0.0004013326, 2.627088, 1, 1, 1, 1, 1,
0.8664208, -0.6799448, 2.256706, 1, 1, 1, 1, 1,
0.8671594, 0.4746451, 0.7477417, 1, 1, 1, 1, 1,
0.8720474, -0.3845662, 2.428779, 1, 1, 1, 1, 1,
0.8771825, -0.3384079, 1.58211, 0, 0, 1, 1, 1,
0.8780298, 1.663103, -1.591245, 1, 0, 0, 1, 1,
0.8814087, 0.1596388, 1.841805, 1, 0, 0, 1, 1,
0.8818502, 0.05403507, 2.196797, 1, 0, 0, 1, 1,
0.8819134, 0.2083165, 1.278188, 1, 0, 0, 1, 1,
0.8856124, -0.9986621, 2.353934, 1, 0, 0, 1, 1,
0.8911045, -1.018197, 2.582096, 0, 0, 0, 1, 1,
0.8920392, -0.7761278, 1.615033, 0, 0, 0, 1, 1,
0.897944, 1.681219, 0.5938908, 0, 0, 0, 1, 1,
0.9013136, -0.8346197, 2.995527, 0, 0, 0, 1, 1,
0.9023708, -0.06038783, 4.028304, 0, 0, 0, 1, 1,
0.9053556, -0.7652818, 0.7171438, 0, 0, 0, 1, 1,
0.9074573, -0.2062177, 3.484179, 0, 0, 0, 1, 1,
0.9108509, 0.9865573, 2.302479, 1, 1, 1, 1, 1,
0.9123628, 0.7236622, 0.5523716, 1, 1, 1, 1, 1,
0.9168317, -0.6621764, 1.992824, 1, 1, 1, 1, 1,
0.9192849, -0.1852205, 1.626138, 1, 1, 1, 1, 1,
0.9194572, -0.8659703, 1.873395, 1, 1, 1, 1, 1,
0.9236956, -0.7524128, 3.524977, 1, 1, 1, 1, 1,
0.9287394, 0.6946073, 0.7208337, 1, 1, 1, 1, 1,
0.9288188, 1.178173, 1.349797, 1, 1, 1, 1, 1,
0.9309937, -1.61691, 1.308317, 1, 1, 1, 1, 1,
0.9312443, -0.403144, 3.021115, 1, 1, 1, 1, 1,
0.9374847, 0.1799246, 1.776042, 1, 1, 1, 1, 1,
0.9396228, -1.810236, 1.23631, 1, 1, 1, 1, 1,
0.9441238, -0.7442227, 1.037832, 1, 1, 1, 1, 1,
0.9443343, -0.1796846, 1.375802, 1, 1, 1, 1, 1,
0.9494535, -1.997179, 2.522932, 1, 1, 1, 1, 1,
0.9627002, -0.3759486, 2.722411, 0, 0, 1, 1, 1,
0.9642327, 0.04098957, 2.821221, 1, 0, 0, 1, 1,
0.9739481, -0.6408767, 2.860637, 1, 0, 0, 1, 1,
0.9778338, -0.1321342, 1.357587, 1, 0, 0, 1, 1,
0.9789685, 0.4469512, 2.223541, 1, 0, 0, 1, 1,
0.987075, 0.2157869, 1.365068, 1, 0, 0, 1, 1,
0.9941041, 0.7912546, 1.022866, 0, 0, 0, 1, 1,
0.9945694, -0.3488152, 2.446133, 0, 0, 0, 1, 1,
0.9958091, 0.1670362, -0.3993903, 0, 0, 0, 1, 1,
0.999494, 0.4978573, -0.6833062, 0, 0, 0, 1, 1,
1.003794, 0.9820943, 1.594839, 0, 0, 0, 1, 1,
1.005114, -0.1069592, 2.320078, 0, 0, 0, 1, 1,
1.006396, 0.6624323, 0.2575521, 0, 0, 0, 1, 1,
1.008193, -0.5615392, 0.6599278, 1, 1, 1, 1, 1,
1.011356, -1.172292, 1.825319, 1, 1, 1, 1, 1,
1.012199, 1.40462, 2.039201, 1, 1, 1, 1, 1,
1.01718, -0.9483472, 2.364228, 1, 1, 1, 1, 1,
1.022042, 1.933512, 1.597041, 1, 1, 1, 1, 1,
1.026476, 0.009730996, 0.2996788, 1, 1, 1, 1, 1,
1.028052, -0.266167, 2.68301, 1, 1, 1, 1, 1,
1.034378, -1.384974, 1.835793, 1, 1, 1, 1, 1,
1.035646, -0.05262039, 2.040539, 1, 1, 1, 1, 1,
1.040492, 0.7335249, 3.286352, 1, 1, 1, 1, 1,
1.041031, 1.608945, 0.6842644, 1, 1, 1, 1, 1,
1.046895, 0.2896858, 1.134185, 1, 1, 1, 1, 1,
1.052487, -1.53875, 2.3045, 1, 1, 1, 1, 1,
1.056731, 0.7355111, 1.75918, 1, 1, 1, 1, 1,
1.057272, -1.346117, 2.364023, 1, 1, 1, 1, 1,
1.058232, 0.1072774, 0.710901, 0, 0, 1, 1, 1,
1.059057, -0.7126947, 3.596744, 1, 0, 0, 1, 1,
1.062311, 0.5853807, 1.206743, 1, 0, 0, 1, 1,
1.062482, -1.512217, 2.679533, 1, 0, 0, 1, 1,
1.067495, -0.6779782, 3.898476, 1, 0, 0, 1, 1,
1.068938, 1.776332, 2.526586, 1, 0, 0, 1, 1,
1.077303, 2.215734, 0.6471103, 0, 0, 0, 1, 1,
1.07808, -1.263174, 2.334133, 0, 0, 0, 1, 1,
1.079929, -0.3780706, 1.280321, 0, 0, 0, 1, 1,
1.080264, 1.330149, -0.03963887, 0, 0, 0, 1, 1,
1.080544, -0.1210086, 3.382804, 0, 0, 0, 1, 1,
1.080713, -1.418567, 2.500138, 0, 0, 0, 1, 1,
1.08121, 0.2482646, 0.9757091, 0, 0, 0, 1, 1,
1.090803, -1.904238, 3.254375, 1, 1, 1, 1, 1,
1.099632, -1.358148, 4.493768, 1, 1, 1, 1, 1,
1.101758, 0.6388862, 0.9731972, 1, 1, 1, 1, 1,
1.104488, 1.341638, 1.033713, 1, 1, 1, 1, 1,
1.105374, 1.130821, -0.2589578, 1, 1, 1, 1, 1,
1.105518, 0.1315812, 1.727251, 1, 1, 1, 1, 1,
1.122572, 1.290167, 1.545824, 1, 1, 1, 1, 1,
1.134581, 1.182782, 0.7540441, 1, 1, 1, 1, 1,
1.143725, 0.4078211, 0.4440126, 1, 1, 1, 1, 1,
1.152952, 1.460654, 1.300616, 1, 1, 1, 1, 1,
1.165583, -0.009141291, -0.06359942, 1, 1, 1, 1, 1,
1.171421, -0.4873, 2.408303, 1, 1, 1, 1, 1,
1.171915, 0.2988317, 1.531301, 1, 1, 1, 1, 1,
1.175886, 1.548434, -0.6989357, 1, 1, 1, 1, 1,
1.177381, 1.228498, 0.6653277, 1, 1, 1, 1, 1,
1.17888, 0.4458202, 1.323345, 0, 0, 1, 1, 1,
1.182458, -0.7280293, 3.237868, 1, 0, 0, 1, 1,
1.186429, 0.05458743, -0.2217356, 1, 0, 0, 1, 1,
1.188778, -0.9178475, 1.956602, 1, 0, 0, 1, 1,
1.189112, -0.388885, 2.425298, 1, 0, 0, 1, 1,
1.191176, -0.09090739, 1.432874, 1, 0, 0, 1, 1,
1.199, -0.2175524, 2.930838, 0, 0, 0, 1, 1,
1.200376, 0.6088545, 1.200662, 0, 0, 0, 1, 1,
1.201337, -0.2469323, 2.473275, 0, 0, 0, 1, 1,
1.202548, 2.306814, 1.519696, 0, 0, 0, 1, 1,
1.205881, -0.2869666, 2.671055, 0, 0, 0, 1, 1,
1.206837, 0.7814878, -0.01432756, 0, 0, 0, 1, 1,
1.209743, 0.8375139, 0.6408795, 0, 0, 0, 1, 1,
1.209913, -0.541207, 2.729957, 1, 1, 1, 1, 1,
1.210106, -0.6213535, 2.116759, 1, 1, 1, 1, 1,
1.213755, 1.141839, 0.7033136, 1, 1, 1, 1, 1,
1.217583, 0.9707748, -0.1226614, 1, 1, 1, 1, 1,
1.223552, 0.4061504, 1.104142, 1, 1, 1, 1, 1,
1.228013, 0.4021328, 2.550659, 1, 1, 1, 1, 1,
1.232083, 0.7803473, 0.7102765, 1, 1, 1, 1, 1,
1.235074, -0.961794, 1.838939, 1, 1, 1, 1, 1,
1.237783, 0.03027892, 1.488723, 1, 1, 1, 1, 1,
1.241625, -2.335709, 3.121054, 1, 1, 1, 1, 1,
1.249661, -2.345186, 4.643923, 1, 1, 1, 1, 1,
1.255834, 0.4662717, 2.600667, 1, 1, 1, 1, 1,
1.257478, -1.1149, 4.159367, 1, 1, 1, 1, 1,
1.26041, -0.424256, 2.989083, 1, 1, 1, 1, 1,
1.26478, 1.042941, 1.716365, 1, 1, 1, 1, 1,
1.267182, 0.7756746, 0.5580974, 0, 0, 1, 1, 1,
1.27659, -1.222703, 1.106642, 1, 0, 0, 1, 1,
1.28102, 1.092893, -0.2689362, 1, 0, 0, 1, 1,
1.285569, 0.3316521, 1.641407, 1, 0, 0, 1, 1,
1.292013, -0.9642615, 1.008793, 1, 0, 0, 1, 1,
1.29439, -0.3235981, 0.7982969, 1, 0, 0, 1, 1,
1.29806, 0.5237424, 1.530025, 0, 0, 0, 1, 1,
1.319151, -1.642534, 2.343174, 0, 0, 0, 1, 1,
1.329366, 0.1904898, 1.901434, 0, 0, 0, 1, 1,
1.335187, 1.571628, 0.01589208, 0, 0, 0, 1, 1,
1.339199, 0.05707645, 2.164853, 0, 0, 0, 1, 1,
1.348073, -1.855676, 0.7010095, 0, 0, 0, 1, 1,
1.349014, 0.2696655, 2.344609, 0, 0, 0, 1, 1,
1.350164, 0.8100347, -0.1012114, 1, 1, 1, 1, 1,
1.354279, 0.559841, -1.413473, 1, 1, 1, 1, 1,
1.355493, 0.8159365, -0.9650731, 1, 1, 1, 1, 1,
1.361969, 1.512586, -0.4750569, 1, 1, 1, 1, 1,
1.370185, 0.6256796, 0.1089253, 1, 1, 1, 1, 1,
1.376857, 1.449862, 2.463177, 1, 1, 1, 1, 1,
1.379082, 1.069644, 1.119573, 1, 1, 1, 1, 1,
1.384497, -0.3873844, 1.10155, 1, 1, 1, 1, 1,
1.399374, 0.8705474, 0.6820707, 1, 1, 1, 1, 1,
1.399396, -1.801344, 3.425874, 1, 1, 1, 1, 1,
1.407387, 0.4712071, 1.948517, 1, 1, 1, 1, 1,
1.407693, 0.7016025, 0.4681264, 1, 1, 1, 1, 1,
1.416211, 0.9736784, 0.2859171, 1, 1, 1, 1, 1,
1.423259, 0.4583363, 2.203984, 1, 1, 1, 1, 1,
1.426111, -0.4678771, 2.566547, 1, 1, 1, 1, 1,
1.427436, -0.7586718, 1.41835, 0, 0, 1, 1, 1,
1.430879, -0.8102379, 2.475962, 1, 0, 0, 1, 1,
1.44392, -2.446137, 1.830939, 1, 0, 0, 1, 1,
1.446165, 0.07448263, 3.429764, 1, 0, 0, 1, 1,
1.446252, -0.6452199, 2.959152, 1, 0, 0, 1, 1,
1.449966, -0.3607324, 2.872027, 1, 0, 0, 1, 1,
1.460367, -0.6263935, 2.185564, 0, 0, 0, 1, 1,
1.466984, 0.2458774, -0.4945071, 0, 0, 0, 1, 1,
1.470155, -0.7994292, 1.089142, 0, 0, 0, 1, 1,
1.480625, 1.519992, 0.2163689, 0, 0, 0, 1, 1,
1.491512, 0.751525, 0.1396533, 0, 0, 0, 1, 1,
1.501983, -1.225495, 3.08817, 0, 0, 0, 1, 1,
1.512173, -0.2070862, 1.594282, 0, 0, 0, 1, 1,
1.512514, -0.07763415, 2.031979, 1, 1, 1, 1, 1,
1.528472, 0.5885527, 1.913901, 1, 1, 1, 1, 1,
1.533511, 0.3765667, 1.255702, 1, 1, 1, 1, 1,
1.538439, -1.392983, 2.617243, 1, 1, 1, 1, 1,
1.556435, -1.854844, 2.843197, 1, 1, 1, 1, 1,
1.557539, 1.073541, 1.388138, 1, 1, 1, 1, 1,
1.559939, -1.041847, 2.694027, 1, 1, 1, 1, 1,
1.562914, -0.1740609, 1.802069, 1, 1, 1, 1, 1,
1.56548, 1.164989, 0.5066079, 1, 1, 1, 1, 1,
1.601401, -2.020929, 2.477912, 1, 1, 1, 1, 1,
1.602062, -1.523737, 3.0623, 1, 1, 1, 1, 1,
1.624572, -0.5099707, 3.706913, 1, 1, 1, 1, 1,
1.628321, -0.583182, 0.6897563, 1, 1, 1, 1, 1,
1.628857, 0.8885109, 0.7343925, 1, 1, 1, 1, 1,
1.654532, -0.1034782, 1.975847, 1, 1, 1, 1, 1,
1.677846, -0.4840031, 1.94896, 0, 0, 1, 1, 1,
1.682525, 0.2134886, 1.439957, 1, 0, 0, 1, 1,
1.710461, 0.2602109, 0.9371333, 1, 0, 0, 1, 1,
1.721297, -0.5339023, 3.38299, 1, 0, 0, 1, 1,
1.729614, -0.5135186, 1.177856, 1, 0, 0, 1, 1,
1.741745, -2.64967, 4.1681, 1, 0, 0, 1, 1,
1.756292, -2.11056, 0.499687, 0, 0, 0, 1, 1,
1.766885, 0.9360049, -1.250281, 0, 0, 0, 1, 1,
1.774419, 1.295089, 1.612122, 0, 0, 0, 1, 1,
1.775229, -0.3972063, 2.931082, 0, 0, 0, 1, 1,
1.77662, 0.04680203, 2.252841, 0, 0, 0, 1, 1,
1.796211, -2.010948, 2.503563, 0, 0, 0, 1, 1,
1.801342, -1.549781, 0.03645313, 0, 0, 0, 1, 1,
1.812801, -0.1837866, -0.117321, 1, 1, 1, 1, 1,
1.820887, -0.213487, 2.966783, 1, 1, 1, 1, 1,
1.82112, -0.0705177, 1.540955, 1, 1, 1, 1, 1,
1.822135, 0.6322185, 0.8310441, 1, 1, 1, 1, 1,
1.830754, 0.222688, 1.817462, 1, 1, 1, 1, 1,
1.909027, 0.403243, 0.8989865, 1, 1, 1, 1, 1,
1.934661, 1.720329, 1.112555, 1, 1, 1, 1, 1,
1.93552, -0.7572742, 2.85686, 1, 1, 1, 1, 1,
1.942472, 1.07188, 1.384284, 1, 1, 1, 1, 1,
1.94942, -1.605896, 3.4145, 1, 1, 1, 1, 1,
1.959599, -1.363181, 1.86756, 1, 1, 1, 1, 1,
1.972388, 0.6549024, 1.739955, 1, 1, 1, 1, 1,
1.981722, -0.1707928, 2.178018, 1, 1, 1, 1, 1,
2.00243, -0.8076979, -0.3968872, 1, 1, 1, 1, 1,
2.026765, -0.3746211, 2.344161, 1, 1, 1, 1, 1,
2.066591, 0.6482893, 0.8944935, 0, 0, 1, 1, 1,
2.074748, -0.8380435, 0.3917348, 1, 0, 0, 1, 1,
2.09384, -0.2644531, 2.548484, 1, 0, 0, 1, 1,
2.110968, -1.193511, 2.607916, 1, 0, 0, 1, 1,
2.111897, -0.7310873, 1.9869, 1, 0, 0, 1, 1,
2.166123, -1.210661, 0.9611186, 1, 0, 0, 1, 1,
2.167143, -0.23097, 2.760201, 0, 0, 0, 1, 1,
2.169193, -0.5933818, 1.072455, 0, 0, 0, 1, 1,
2.23969, -1.23811, 3.494963, 0, 0, 0, 1, 1,
2.295593, 0.8752139, 0.943947, 0, 0, 0, 1, 1,
2.307849, 0.2754599, 3.80792, 0, 0, 0, 1, 1,
2.317404, -2.913435, 2.460604, 0, 0, 0, 1, 1,
2.334337, 0.6221657, 0.7639084, 0, 0, 0, 1, 1,
2.394662, 1.06257, 2.507965, 1, 1, 1, 1, 1,
2.432195, -1.85881, 2.978161, 1, 1, 1, 1, 1,
2.528372, -1.095541, 2.737532, 1, 1, 1, 1, 1,
2.633159, 1.062638, 1.423668, 1, 1, 1, 1, 1,
2.655257, -0.9711382, 1.471796, 1, 1, 1, 1, 1,
2.830549, 0.5710552, 0.9216906, 1, 1, 1, 1, 1,
3.343585, 0.3844321, 2.275708, 1, 1, 1, 1, 1
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
var radius = 9.698921;
var distance = 34.06705;
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
mvMatrix.translate( -0.2435687, 0.01049638, 0.06766772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06705);
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