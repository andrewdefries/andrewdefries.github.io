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
-3.029364, -0.5712451, -2.959052, 1, 0, 0, 1,
-2.935289, -0.2361763, -2.786079, 1, 0.007843138, 0, 1,
-2.712174, 0.4593761, -0.5288072, 1, 0.01176471, 0, 1,
-2.709389, -0.2867387, 0.5908822, 1, 0.01960784, 0, 1,
-2.690839, -1.236824, -1.830118, 1, 0.02352941, 0, 1,
-2.556444, 1.628183, 1.068805, 1, 0.03137255, 0, 1,
-2.468442, -2.403136, -3.93251, 1, 0.03529412, 0, 1,
-2.458774, -1.574539, -2.106522, 1, 0.04313726, 0, 1,
-2.425071, -0.8064607, -3.013375, 1, 0.04705882, 0, 1,
-2.377333, 2.388385, -1.083526, 1, 0.05490196, 0, 1,
-2.361278, 0.7481723, -0.7299491, 1, 0.05882353, 0, 1,
-2.310107, -0.1324893, -1.441737, 1, 0.06666667, 0, 1,
-2.295016, -0.2829405, -3.301344, 1, 0.07058824, 0, 1,
-2.183652, 1.400384, -0.787654, 1, 0.07843138, 0, 1,
-2.179445, 0.1158019, 1.055791, 1, 0.08235294, 0, 1,
-2.157135, 2.396652, -1.207664, 1, 0.09019608, 0, 1,
-2.137652, -0.6007636, -1.342149, 1, 0.09411765, 0, 1,
-2.117138, -1.22491, -2.142879, 1, 0.1019608, 0, 1,
-2.108468, 0.8066246, -1.322605, 1, 0.1098039, 0, 1,
-2.107863, -0.8600798, -1.906847, 1, 0.1137255, 0, 1,
-2.105618, -0.4343334, -2.363905, 1, 0.1215686, 0, 1,
-2.10357, 0.6379741, -1.138522, 1, 0.1254902, 0, 1,
-2.085443, -0.1520119, -1.972915, 1, 0.1333333, 0, 1,
-2.080538, -0.5380773, -0.5158291, 1, 0.1372549, 0, 1,
-2.069941, -0.2924097, -1.197253, 1, 0.145098, 0, 1,
-2.039601, 1.268067, -2.602168, 1, 0.1490196, 0, 1,
-2.017617, -0.4767454, -2.711719, 1, 0.1568628, 0, 1,
-2.014991, 1.334766, -1.268785, 1, 0.1607843, 0, 1,
-1.999722, -1.492217, -2.243634, 1, 0.1686275, 0, 1,
-1.947396, -0.9502595, -2.032352, 1, 0.172549, 0, 1,
-1.937731, -3.475898, -3.913015, 1, 0.1803922, 0, 1,
-1.936555, -0.08386172, -1.744888, 1, 0.1843137, 0, 1,
-1.929373, -1.110566, -3.181661, 1, 0.1921569, 0, 1,
-1.922004, 0.7582245, -0.414889, 1, 0.1960784, 0, 1,
-1.891418, -2.586692, -1.032342, 1, 0.2039216, 0, 1,
-1.8719, 1.038523, -0.594709, 1, 0.2117647, 0, 1,
-1.864275, 1.808904, -0.7156125, 1, 0.2156863, 0, 1,
-1.852706, 0.8524483, 0.6567513, 1, 0.2235294, 0, 1,
-1.841547, 0.1199703, -3.424878, 1, 0.227451, 0, 1,
-1.786386, 0.4566725, -0.02778245, 1, 0.2352941, 0, 1,
-1.769747, -0.1792128, -1.645627, 1, 0.2392157, 0, 1,
-1.756032, -0.6557141, -1.439103, 1, 0.2470588, 0, 1,
-1.751949, -0.6559999, -2.838544, 1, 0.2509804, 0, 1,
-1.751706, -0.765903, -2.28997, 1, 0.2588235, 0, 1,
-1.748667, -0.08359948, -0.6406683, 1, 0.2627451, 0, 1,
-1.735858, -0.7384903, -3.179031, 1, 0.2705882, 0, 1,
-1.694647, 0.844152, -2.04196, 1, 0.2745098, 0, 1,
-1.688723, 0.8629285, -0.589917, 1, 0.282353, 0, 1,
-1.672523, -1.317648, -2.045223, 1, 0.2862745, 0, 1,
-1.66653, 1.370347, 0.1454828, 1, 0.2941177, 0, 1,
-1.663603, 0.09009451, -0.5890123, 1, 0.3019608, 0, 1,
-1.641583, 0.1463865, -2.348512, 1, 0.3058824, 0, 1,
-1.633305, 2.566096, -0.1648649, 1, 0.3137255, 0, 1,
-1.606553, 0.5953876, -1.510866, 1, 0.3176471, 0, 1,
-1.605789, -0.201663, -0.9161078, 1, 0.3254902, 0, 1,
-1.602414, -0.3496386, -0.2631622, 1, 0.3294118, 0, 1,
-1.600712, 0.757446, -2.172361, 1, 0.3372549, 0, 1,
-1.593864, 1.234599, -0.579417, 1, 0.3411765, 0, 1,
-1.593752, -0.695577, -1.292105, 1, 0.3490196, 0, 1,
-1.590632, -0.4429663, -1.161143, 1, 0.3529412, 0, 1,
-1.589032, 0.3012325, -1.033343, 1, 0.3607843, 0, 1,
-1.587105, 0.7972876, -1.177826, 1, 0.3647059, 0, 1,
-1.585928, -1.201284, -1.828577, 1, 0.372549, 0, 1,
-1.584391, 0.4404189, -1.948211, 1, 0.3764706, 0, 1,
-1.581895, -0.6004587, -2.51399, 1, 0.3843137, 0, 1,
-1.57887, 1.033552, -1.60608, 1, 0.3882353, 0, 1,
-1.573178, 0.4597369, -0.1530661, 1, 0.3960784, 0, 1,
-1.56852, 0.3441485, -1.369633, 1, 0.4039216, 0, 1,
-1.557662, 1.191933, 0.4709207, 1, 0.4078431, 0, 1,
-1.556605, 0.5740202, -1.774826, 1, 0.4156863, 0, 1,
-1.549217, 1.06987, -0.9396934, 1, 0.4196078, 0, 1,
-1.543146, -0.7008508, -1.562411, 1, 0.427451, 0, 1,
-1.54162, -0.05799592, -1.951362, 1, 0.4313726, 0, 1,
-1.501279, -1.078392, -1.701836, 1, 0.4392157, 0, 1,
-1.492748, -0.3385049, -2.603098, 1, 0.4431373, 0, 1,
-1.467771, 0.2442029, -1.106774, 1, 0.4509804, 0, 1,
-1.467654, -0.5595971, -2.286161, 1, 0.454902, 0, 1,
-1.456579, 0.9876634, -0.8928908, 1, 0.4627451, 0, 1,
-1.455967, -0.6334603, -1.474128, 1, 0.4666667, 0, 1,
-1.452769, 0.744179, 0.169468, 1, 0.4745098, 0, 1,
-1.44945, 0.8137043, -0.1107117, 1, 0.4784314, 0, 1,
-1.446503, 0.9750236, -0.2575256, 1, 0.4862745, 0, 1,
-1.432615, 0.815785, 0.4754212, 1, 0.4901961, 0, 1,
-1.424644, -0.6024778, -2.624675, 1, 0.4980392, 0, 1,
-1.398173, -1.108175, -1.880027, 1, 0.5058824, 0, 1,
-1.380699, -1.455171, -2.794193, 1, 0.509804, 0, 1,
-1.368666, -0.1055429, -1.9213, 1, 0.5176471, 0, 1,
-1.363053, 0.6160364, -0.1151152, 1, 0.5215687, 0, 1,
-1.348608, -1.418693, -0.8036258, 1, 0.5294118, 0, 1,
-1.343307, -0.03393505, -3.446942, 1, 0.5333334, 0, 1,
-1.341103, -0.1749325, 0.6414521, 1, 0.5411765, 0, 1,
-1.339944, -0.09967174, -2.515049, 1, 0.5450981, 0, 1,
-1.330415, -0.526975, -0.554906, 1, 0.5529412, 0, 1,
-1.328542, -0.2909196, -0.9168249, 1, 0.5568628, 0, 1,
-1.327666, -0.8007861, -3.213632, 1, 0.5647059, 0, 1,
-1.322267, 1.004037, 0.453181, 1, 0.5686275, 0, 1,
-1.32182, 0.131048, -1.084532, 1, 0.5764706, 0, 1,
-1.318081, -0.7454755, -1.882068, 1, 0.5803922, 0, 1,
-1.316225, 1.887556, -0.665676, 1, 0.5882353, 0, 1,
-1.304431, 0.01063963, -1.405841, 1, 0.5921569, 0, 1,
-1.282724, -1.119371, -1.143384, 1, 0.6, 0, 1,
-1.28137, -0.3076431, -0.6796359, 1, 0.6078432, 0, 1,
-1.271003, -1.249163, -1.36395, 1, 0.6117647, 0, 1,
-1.264545, 0.8090174, -0.1634994, 1, 0.6196079, 0, 1,
-1.251238, 0.9254377, -0.1396207, 1, 0.6235294, 0, 1,
-1.249746, -0.3490221, -2.008774, 1, 0.6313726, 0, 1,
-1.249379, 0.13133, -0.9097835, 1, 0.6352941, 0, 1,
-1.236121, 0.5467822, -0.4934126, 1, 0.6431373, 0, 1,
-1.230055, 0.508235, -3.606202, 1, 0.6470588, 0, 1,
-1.229162, -0.3161731, -1.172033, 1, 0.654902, 0, 1,
-1.223304, -0.726451, -1.026929, 1, 0.6588235, 0, 1,
-1.217444, -1.229149, -3.572501, 1, 0.6666667, 0, 1,
-1.214612, 2.050513, -0.9811855, 1, 0.6705883, 0, 1,
-1.214383, -0.4500153, -2.291545, 1, 0.6784314, 0, 1,
-1.20365, -1.281194, -3.67658, 1, 0.682353, 0, 1,
-1.202444, -0.8846271, -2.797001, 1, 0.6901961, 0, 1,
-1.200679, 0.6832059, 1.619402, 1, 0.6941177, 0, 1,
-1.192353, -0.7631032, -3.701784, 1, 0.7019608, 0, 1,
-1.189179, 0.6872705, -1.760178, 1, 0.7098039, 0, 1,
-1.188018, 1.622681, -0.6463779, 1, 0.7137255, 0, 1,
-1.186435, -2.45567, -2.870438, 1, 0.7215686, 0, 1,
-1.185722, 2.883572, -0.7589168, 1, 0.7254902, 0, 1,
-1.184357, 0.523609, 1.446243, 1, 0.7333333, 0, 1,
-1.180254, -0.9691859, -3.318328, 1, 0.7372549, 0, 1,
-1.175782, 0.7437769, -1.114528, 1, 0.7450981, 0, 1,
-1.175373, 0.6285955, -2.285657, 1, 0.7490196, 0, 1,
-1.173648, 1.589138, -0.4257755, 1, 0.7568628, 0, 1,
-1.168258, -0.06284379, -0.9357602, 1, 0.7607843, 0, 1,
-1.165389, 1.294926, 0.3908903, 1, 0.7686275, 0, 1,
-1.164982, -0.5242013, -1.438979, 1, 0.772549, 0, 1,
-1.157932, -0.02997979, -3.038932, 1, 0.7803922, 0, 1,
-1.150919, -0.7341001, -1.850068, 1, 0.7843137, 0, 1,
-1.136189, 0.7233385, -2.098326, 1, 0.7921569, 0, 1,
-1.135215, -1.366747, -1.457881, 1, 0.7960784, 0, 1,
-1.130807, -0.9443636, -2.507691, 1, 0.8039216, 0, 1,
-1.126992, 0.1211142, -1.323276, 1, 0.8117647, 0, 1,
-1.116654, -0.842154, -1.76892, 1, 0.8156863, 0, 1,
-1.114591, 1.057778, -1.284979, 1, 0.8235294, 0, 1,
-1.10791, 1.019419, -0.5753673, 1, 0.827451, 0, 1,
-1.102829, 0.125632, -1.379483, 1, 0.8352941, 0, 1,
-1.102751, -0.1751707, -2.230292, 1, 0.8392157, 0, 1,
-1.088833, 0.7150406, 0.6820859, 1, 0.8470588, 0, 1,
-1.087985, -1.50588, -1.115028, 1, 0.8509804, 0, 1,
-1.082338, 0.4383074, -0.9256592, 1, 0.8588235, 0, 1,
-1.076337, 2.274997, -2.057638, 1, 0.8627451, 0, 1,
-1.072431, -0.7080242, -2.959349, 1, 0.8705882, 0, 1,
-1.069505, -0.7448226, -2.215707, 1, 0.8745098, 0, 1,
-1.063137, 1.146867, 0.4059477, 1, 0.8823529, 0, 1,
-1.060857, 0.8271774, 0.005167628, 1, 0.8862745, 0, 1,
-1.058772, -1.342966, -1.784281, 1, 0.8941177, 0, 1,
-1.051674, -1.574168, -3.421931, 1, 0.8980392, 0, 1,
-1.050695, -0.2501855, -0.9576277, 1, 0.9058824, 0, 1,
-1.04888, -0.2350185, -0.4693571, 1, 0.9137255, 0, 1,
-1.043298, -0.8607834, -1.018701, 1, 0.9176471, 0, 1,
-1.038714, 0.2852101, -2.557266, 1, 0.9254902, 0, 1,
-1.035874, 1.42857, -1.34313, 1, 0.9294118, 0, 1,
-1.035677, 0.1374929, -1.986712, 1, 0.9372549, 0, 1,
-1.03533, -1.561081, -4.039721, 1, 0.9411765, 0, 1,
-1.03454, -0.606172, -1.714296, 1, 0.9490196, 0, 1,
-1.025859, -1.192232, -1.865562, 1, 0.9529412, 0, 1,
-1.023, -1.479706, -2.175336, 1, 0.9607843, 0, 1,
-1.018084, -0.460718, -1.716131, 1, 0.9647059, 0, 1,
-1.017208, -0.03862713, -2.928796, 1, 0.972549, 0, 1,
-1.01588, -1.283718, -2.093364, 1, 0.9764706, 0, 1,
-1.011331, -1.476765, -0.8331726, 1, 0.9843137, 0, 1,
-1.009266, -0.5744679, -2.589914, 1, 0.9882353, 0, 1,
-1.008641, 0.07901966, -0.7699673, 1, 0.9960784, 0, 1,
-1.007991, -1.427224, -3.586842, 0.9960784, 1, 0, 1,
-1.007682, -0.3582068, -1.143502, 0.9921569, 1, 0, 1,
-1.006707, 0.6014968, -0.522759, 0.9843137, 1, 0, 1,
-0.9984373, 1.039691, -1.001119, 0.9803922, 1, 0, 1,
-0.9979838, 1.499537, -1.131135, 0.972549, 1, 0, 1,
-0.9940715, 3.106042, -1.427764, 0.9686275, 1, 0, 1,
-0.993239, 0.05119964, -0.6616402, 0.9607843, 1, 0, 1,
-0.9889303, 1.000983, -2.14331, 0.9568627, 1, 0, 1,
-0.9812071, -0.06842878, -2.211005, 0.9490196, 1, 0, 1,
-0.9722054, -0.1010205, -1.727717, 0.945098, 1, 0, 1,
-0.9713634, 1.843405, -1.102919, 0.9372549, 1, 0, 1,
-0.9697699, 0.9064899, -1.60255, 0.9333333, 1, 0, 1,
-0.9674318, -0.7813022, -1.100289, 0.9254902, 1, 0, 1,
-0.9650295, 0.2964815, -1.264285, 0.9215686, 1, 0, 1,
-0.958914, 0.5407637, -2.732008, 0.9137255, 1, 0, 1,
-0.947766, 0.2726178, -0.07175414, 0.9098039, 1, 0, 1,
-0.9473837, -0.9845968, -1.892745, 0.9019608, 1, 0, 1,
-0.9429661, 1.590767, -1.798269, 0.8941177, 1, 0, 1,
-0.9428399, -0.3026491, -2.324647, 0.8901961, 1, 0, 1,
-0.9404796, -1.078976, -2.473059, 0.8823529, 1, 0, 1,
-0.9400157, -0.368692, -0.9110497, 0.8784314, 1, 0, 1,
-0.9368871, 0.0486043, -2.224202, 0.8705882, 1, 0, 1,
-0.9363015, -0.858516, -2.097586, 0.8666667, 1, 0, 1,
-0.933724, -1.882005, -3.349394, 0.8588235, 1, 0, 1,
-0.9275351, -0.7414351, -3.189306, 0.854902, 1, 0, 1,
-0.9260014, -1.328058, -2.457634, 0.8470588, 1, 0, 1,
-0.9201521, 2.418516, 0.3968385, 0.8431373, 1, 0, 1,
-0.9153178, 1.525225, 0.202673, 0.8352941, 1, 0, 1,
-0.9137156, 1.616961, -0.1168463, 0.8313726, 1, 0, 1,
-0.9129713, -0.01750969, 0.4894765, 0.8235294, 1, 0, 1,
-0.9113432, -2.290103, -1.368574, 0.8196079, 1, 0, 1,
-0.9090825, 0.336634, -1.470695, 0.8117647, 1, 0, 1,
-0.9068317, 1.16203, 1.141483, 0.8078431, 1, 0, 1,
-0.9056625, 1.091702, -1.997131, 0.8, 1, 0, 1,
-0.9054631, -1.450294, -1.595173, 0.7921569, 1, 0, 1,
-0.9042857, -1.090606, -0.8637, 0.7882353, 1, 0, 1,
-0.8974645, -2.318977, -1.328069, 0.7803922, 1, 0, 1,
-0.8970903, 0.3172254, -1.849216, 0.7764706, 1, 0, 1,
-0.895459, 0.3185308, -0.8610945, 0.7686275, 1, 0, 1,
-0.8923353, -0.4918327, -2.143428, 0.7647059, 1, 0, 1,
-0.8902248, 0.7549592, 0.4085567, 0.7568628, 1, 0, 1,
-0.8852339, 0.6719502, -0.3792495, 0.7529412, 1, 0, 1,
-0.8815221, 0.2192652, -1.233746, 0.7450981, 1, 0, 1,
-0.8596081, -0.021223, -0.922543, 0.7411765, 1, 0, 1,
-0.8583373, -1.336557, -1.055323, 0.7333333, 1, 0, 1,
-0.8574395, 2.313099, -0.1593455, 0.7294118, 1, 0, 1,
-0.8518441, -1.778814, -1.135204, 0.7215686, 1, 0, 1,
-0.843402, 0.6635291, 0.728581, 0.7176471, 1, 0, 1,
-0.8397106, -0.3947529, -3.105856, 0.7098039, 1, 0, 1,
-0.8369516, -0.2882828, -1.782655, 0.7058824, 1, 0, 1,
-0.8342906, 0.1739544, -1.774784, 0.6980392, 1, 0, 1,
-0.8335761, -0.6157882, -4.112094, 0.6901961, 1, 0, 1,
-0.8223519, -2.14606, -1.832854, 0.6862745, 1, 0, 1,
-0.8217124, 0.1215409, -1.069775, 0.6784314, 1, 0, 1,
-0.8196216, 0.02528, -1.392237, 0.6745098, 1, 0, 1,
-0.8184509, 1.202781, 0.1213368, 0.6666667, 1, 0, 1,
-0.8169757, -1.31539, -3.240046, 0.6627451, 1, 0, 1,
-0.8137577, -0.336594, -0.9855541, 0.654902, 1, 0, 1,
-0.8131173, -0.8244911, -1.075141, 0.6509804, 1, 0, 1,
-0.8130697, 0.05671137, -3.464984, 0.6431373, 1, 0, 1,
-0.8109557, -0.8036867, -1.719018, 0.6392157, 1, 0, 1,
-0.8076258, -1.392351, -1.090112, 0.6313726, 1, 0, 1,
-0.8075825, -1.741972, -2.027459, 0.627451, 1, 0, 1,
-0.8043863, 1.581453, 0.8894145, 0.6196079, 1, 0, 1,
-0.8033259, -1.532717, -1.730772, 0.6156863, 1, 0, 1,
-0.7965749, 1.873336, 0.07577556, 0.6078432, 1, 0, 1,
-0.7954088, -0.9138042, -1.692638, 0.6039216, 1, 0, 1,
-0.7927159, -2.044746, -3.794706, 0.5960785, 1, 0, 1,
-0.7853887, -0.4191488, -0.5185488, 0.5882353, 1, 0, 1,
-0.7799402, 0.4297337, -1.797673, 0.5843138, 1, 0, 1,
-0.7758962, 0.9820964, -0.1370774, 0.5764706, 1, 0, 1,
-0.7701178, -1.055687, -2.528729, 0.572549, 1, 0, 1,
-0.7666295, 1.131379, -0.9094836, 0.5647059, 1, 0, 1,
-0.7608412, -3.117476, -3.785497, 0.5607843, 1, 0, 1,
-0.7574604, -0.1718488, -1.603781, 0.5529412, 1, 0, 1,
-0.7460047, -0.9812034, -2.910401, 0.5490196, 1, 0, 1,
-0.7456283, 0.2602031, -1.757426, 0.5411765, 1, 0, 1,
-0.7442331, -0.3296883, -2.886459, 0.5372549, 1, 0, 1,
-0.739811, 0.4428641, -1.2843, 0.5294118, 1, 0, 1,
-0.7342842, 0.3844814, 0.2048529, 0.5254902, 1, 0, 1,
-0.7306648, 0.6001409, -2.165115, 0.5176471, 1, 0, 1,
-0.7241942, -1.532575, -2.154651, 0.5137255, 1, 0, 1,
-0.7198139, 0.3827955, 0.02482689, 0.5058824, 1, 0, 1,
-0.7192425, -0.7707266, -2.031763, 0.5019608, 1, 0, 1,
-0.7155303, -0.06844113, -1.869098, 0.4941176, 1, 0, 1,
-0.7125461, 0.1697914, -0.09589429, 0.4862745, 1, 0, 1,
-0.7056928, 0.1777656, -3.077945, 0.4823529, 1, 0, 1,
-0.7012609, 1.794231, -0.8204582, 0.4745098, 1, 0, 1,
-0.6998292, -1.181755, -2.229113, 0.4705882, 1, 0, 1,
-0.6969597, 1.173976, -1.80219, 0.4627451, 1, 0, 1,
-0.6938925, -0.2478794, -2.03272, 0.4588235, 1, 0, 1,
-0.6930661, 0.7298194, -1.521936, 0.4509804, 1, 0, 1,
-0.6930192, -0.5093006, -1.542959, 0.4470588, 1, 0, 1,
-0.6821486, -0.1150026, -1.839457, 0.4392157, 1, 0, 1,
-0.6811052, -0.5773688, -3.228698, 0.4352941, 1, 0, 1,
-0.6775964, -1.225679, -2.172907, 0.427451, 1, 0, 1,
-0.6750147, -1.258064, -3.293846, 0.4235294, 1, 0, 1,
-0.6724368, -0.2105232, -0.9377716, 0.4156863, 1, 0, 1,
-0.6666086, 1.133916, -0.7345648, 0.4117647, 1, 0, 1,
-0.6655597, 0.3734938, -1.913732, 0.4039216, 1, 0, 1,
-0.6642655, -0.8210493, -3.559662, 0.3960784, 1, 0, 1,
-0.662519, 0.6417815, 0.6289623, 0.3921569, 1, 0, 1,
-0.6612942, 0.2540246, -0.1488884, 0.3843137, 1, 0, 1,
-0.6608202, 0.7310843, 1.698606, 0.3803922, 1, 0, 1,
-0.659322, -0.06087141, -0.1918511, 0.372549, 1, 0, 1,
-0.6591773, 1.342311, -2.696221, 0.3686275, 1, 0, 1,
-0.6559358, -1.292203, -2.301727, 0.3607843, 1, 0, 1,
-0.6515687, -0.3923973, -1.142444, 0.3568628, 1, 0, 1,
-0.647609, -1.286643, -2.617115, 0.3490196, 1, 0, 1,
-0.6471077, -1.541064, -2.522734, 0.345098, 1, 0, 1,
-0.6442835, 1.457046, 0.320808, 0.3372549, 1, 0, 1,
-0.6425633, 0.8625867, -0.9261436, 0.3333333, 1, 0, 1,
-0.6419162, -1.042995, -2.181055, 0.3254902, 1, 0, 1,
-0.6416869, 1.944772, 0.7509032, 0.3215686, 1, 0, 1,
-0.636849, -0.9711334, -1.788764, 0.3137255, 1, 0, 1,
-0.6317403, -1.369551, -1.848766, 0.3098039, 1, 0, 1,
-0.6306336, 1.57692, 0.3112525, 0.3019608, 1, 0, 1,
-0.6260353, -0.4425999, -4.282046, 0.2941177, 1, 0, 1,
-0.6218171, 1.027133, 2.620031, 0.2901961, 1, 0, 1,
-0.6207136, 0.6401726, -2.986971, 0.282353, 1, 0, 1,
-0.6193309, -0.1413877, -2.349284, 0.2784314, 1, 0, 1,
-0.6182883, 1.23991, -1.079763, 0.2705882, 1, 0, 1,
-0.6179695, -1.611507, -2.947205, 0.2666667, 1, 0, 1,
-0.6146713, 0.3976404, -0.656868, 0.2588235, 1, 0, 1,
-0.6092561, 2.018348, -1.293719, 0.254902, 1, 0, 1,
-0.6047007, 1.294402, -0.01587721, 0.2470588, 1, 0, 1,
-0.6041351, -1.241463, -2.286447, 0.2431373, 1, 0, 1,
-0.6017802, 0.1943504, -2.004178, 0.2352941, 1, 0, 1,
-0.6004238, -1.051995, -2.631318, 0.2313726, 1, 0, 1,
-0.600117, -0.6385128, -3.917918, 0.2235294, 1, 0, 1,
-0.6000914, 0.7499912, 0.5851498, 0.2196078, 1, 0, 1,
-0.5927581, -0.4960305, -1.815161, 0.2117647, 1, 0, 1,
-0.5910942, 0.7174612, -0.7558721, 0.2078431, 1, 0, 1,
-0.5837477, -0.109222, -1.247123, 0.2, 1, 0, 1,
-0.582475, 0.5259004, -2.596291, 0.1921569, 1, 0, 1,
-0.5771924, 1.584094, -0.4608372, 0.1882353, 1, 0, 1,
-0.5710902, -0.06903575, -1.544453, 0.1803922, 1, 0, 1,
-0.5702164, -0.5213551, -2.699002, 0.1764706, 1, 0, 1,
-0.5685647, -0.1751173, -1.753816, 0.1686275, 1, 0, 1,
-0.5678586, -0.7456151, -2.819667, 0.1647059, 1, 0, 1,
-0.5676833, 1.172053, -1.172248, 0.1568628, 1, 0, 1,
-0.5676333, -1.506375, -4.322976, 0.1529412, 1, 0, 1,
-0.566859, -0.08437295, -1.915352, 0.145098, 1, 0, 1,
-0.5621468, -0.2892587, -1.538913, 0.1411765, 1, 0, 1,
-0.5611043, 0.414608, -0.4032024, 0.1333333, 1, 0, 1,
-0.5592399, 0.8334287, -2.070746, 0.1294118, 1, 0, 1,
-0.5589879, 0.02358897, -1.496003, 0.1215686, 1, 0, 1,
-0.5552966, 0.7145386, 0.04120759, 0.1176471, 1, 0, 1,
-0.5500234, 1.238926, 1.083864, 0.1098039, 1, 0, 1,
-0.5463446, -0.8692235, -2.640765, 0.1058824, 1, 0, 1,
-0.5434446, -0.0312238, -3.758749, 0.09803922, 1, 0, 1,
-0.537798, -0.3563932, -3.916453, 0.09019608, 1, 0, 1,
-0.5374027, -0.1938176, -1.526605, 0.08627451, 1, 0, 1,
-0.5329866, -2.318747, -1.770317, 0.07843138, 1, 0, 1,
-0.531176, -0.7250308, -2.63375, 0.07450981, 1, 0, 1,
-0.5289998, 0.2003882, -2.203292, 0.06666667, 1, 0, 1,
-0.524667, -0.7069793, -2.555474, 0.0627451, 1, 0, 1,
-0.5244739, -0.86261, -2.750368, 0.05490196, 1, 0, 1,
-0.5172694, -1.224149, -4.191385, 0.05098039, 1, 0, 1,
-0.5137643, -1.185881, -2.510417, 0.04313726, 1, 0, 1,
-0.5090421, -0.4055615, -2.02884, 0.03921569, 1, 0, 1,
-0.5079878, 0.6539956, -1.288614, 0.03137255, 1, 0, 1,
-0.5065733, -0.8781134, -1.455429, 0.02745098, 1, 0, 1,
-0.5060105, -1.749595, -3.868996, 0.01960784, 1, 0, 1,
-0.5040787, -0.4523179, -2.526864, 0.01568628, 1, 0, 1,
-0.4965831, -0.2078658, -1.087424, 0.007843138, 1, 0, 1,
-0.4944181, 0.1005728, 0.02045768, 0.003921569, 1, 0, 1,
-0.4830377, -0.5524298, -3.837072, 0, 1, 0.003921569, 1,
-0.4830004, -0.9188596, -2.054534, 0, 1, 0.01176471, 1,
-0.482351, 0.572355, -0.2586863, 0, 1, 0.01568628, 1,
-0.4740001, -1.421214, -2.15799, 0, 1, 0.02352941, 1,
-0.4738358, -0.1818306, -2.697758, 0, 1, 0.02745098, 1,
-0.467735, 1.753058, -0.5804926, 0, 1, 0.03529412, 1,
-0.4609964, 0.9986899, 1.443295, 0, 1, 0.03921569, 1,
-0.4603001, -0.2954568, 0.5857287, 0, 1, 0.04705882, 1,
-0.4584027, 0.7647229, 0.3123059, 0, 1, 0.05098039, 1,
-0.4566297, 1.225102, -0.585384, 0, 1, 0.05882353, 1,
-0.4544692, 0.04920433, -2.217038, 0, 1, 0.0627451, 1,
-0.4464307, 0.1545124, -1.737563, 0, 1, 0.07058824, 1,
-0.4449377, 1.206654, -0.9136668, 0, 1, 0.07450981, 1,
-0.4416969, -0.04268984, -2.020884, 0, 1, 0.08235294, 1,
-0.4337875, 0.3019845, -1.501999, 0, 1, 0.08627451, 1,
-0.4329265, -0.5926982, -2.202672, 0, 1, 0.09411765, 1,
-0.4308128, 1.054351, -0.8064955, 0, 1, 0.1019608, 1,
-0.4169027, 0.8919421, -1.952133, 0, 1, 0.1058824, 1,
-0.4012307, -1.710675, -1.291607, 0, 1, 0.1137255, 1,
-0.397479, 1.761103, 0.3101359, 0, 1, 0.1176471, 1,
-0.3930157, -1.733286, -3.892068, 0, 1, 0.1254902, 1,
-0.3896787, -0.01030231, -2.771633, 0, 1, 0.1294118, 1,
-0.3888447, -1.449383, -2.632845, 0, 1, 0.1372549, 1,
-0.3867897, 0.2156322, -0.7449058, 0, 1, 0.1411765, 1,
-0.3861674, 0.4329087, -1.206818, 0, 1, 0.1490196, 1,
-0.3837957, -0.8505692, -1.695726, 0, 1, 0.1529412, 1,
-0.3811753, 0.08584516, 0.1376061, 0, 1, 0.1607843, 1,
-0.3786743, -0.665971, -2.427648, 0, 1, 0.1647059, 1,
-0.377089, 0.5303311, 0.5806503, 0, 1, 0.172549, 1,
-0.3764056, 1.211386, -1.977081, 0, 1, 0.1764706, 1,
-0.3698985, 0.379586, -0.7794466, 0, 1, 0.1843137, 1,
-0.368956, 0.5846605, 0.5032738, 0, 1, 0.1882353, 1,
-0.3680497, -0.8883753, -1.73424, 0, 1, 0.1960784, 1,
-0.3670076, 0.002644207, 0.2813416, 0, 1, 0.2039216, 1,
-0.3640138, 0.632192, -0.880981, 0, 1, 0.2078431, 1,
-0.3589154, -0.4025325, -3.106545, 0, 1, 0.2156863, 1,
-0.3526801, -1.278974, -3.503324, 0, 1, 0.2196078, 1,
-0.3486759, -0.02236024, -1.863034, 0, 1, 0.227451, 1,
-0.3430266, 0.1628753, -2.403028, 0, 1, 0.2313726, 1,
-0.3419491, 0.8673233, 1.802033, 0, 1, 0.2392157, 1,
-0.3399171, -0.9213935, -3.000784, 0, 1, 0.2431373, 1,
-0.3387081, 1.32514, -0.9155302, 0, 1, 0.2509804, 1,
-0.3374305, 0.9297875, -0.7451005, 0, 1, 0.254902, 1,
-0.3306019, -1.144901, -2.961151, 0, 1, 0.2627451, 1,
-0.3275429, -0.308723, -2.169969, 0, 1, 0.2666667, 1,
-0.3275129, -1.051324, -2.062287, 0, 1, 0.2745098, 1,
-0.3236706, 0.03622047, -0.6609597, 0, 1, 0.2784314, 1,
-0.3235934, -0.1344047, -0.7389424, 0, 1, 0.2862745, 1,
-0.3151257, -0.3709786, -2.713628, 0, 1, 0.2901961, 1,
-0.3115043, -1.670751, -4.284425, 0, 1, 0.2980392, 1,
-0.3096695, 0.3973135, -2.074222, 0, 1, 0.3058824, 1,
-0.3082408, 2.90809, -2.271675, 0, 1, 0.3098039, 1,
-0.3069686, -0.4582248, -1.248109, 0, 1, 0.3176471, 1,
-0.3059771, 0.9080235, -0.3987063, 0, 1, 0.3215686, 1,
-0.3055295, -1.538883, -3.803696, 0, 1, 0.3294118, 1,
-0.2950993, 0.8038064, 0.2819811, 0, 1, 0.3333333, 1,
-0.2950149, -1.003036, -2.722997, 0, 1, 0.3411765, 1,
-0.2918929, 0.4251335, 1.014279, 0, 1, 0.345098, 1,
-0.286817, -0.3181448, -2.587628, 0, 1, 0.3529412, 1,
-0.2860757, -1.820378, -1.357107, 0, 1, 0.3568628, 1,
-0.2852973, -0.05233746, -2.87925, 0, 1, 0.3647059, 1,
-0.2798373, -1.297966, -3.797171, 0, 1, 0.3686275, 1,
-0.2779948, -0.3995947, -3.638616, 0, 1, 0.3764706, 1,
-0.2775037, 0.9334255, -0.8849733, 0, 1, 0.3803922, 1,
-0.2752044, -0.2884073, -3.448459, 0, 1, 0.3882353, 1,
-0.2702358, 1.008536, -1.923247, 0, 1, 0.3921569, 1,
-0.2699856, 0.1821275, -0.2735683, 0, 1, 0.4, 1,
-0.269053, -0.02139483, -2.582333, 0, 1, 0.4078431, 1,
-0.2688144, -1.540153, -3.937294, 0, 1, 0.4117647, 1,
-0.26707, 1.837405, 0.4032271, 0, 1, 0.4196078, 1,
-0.2627748, -0.7173166, -1.687977, 0, 1, 0.4235294, 1,
-0.2624202, -0.01741423, -0.5029854, 0, 1, 0.4313726, 1,
-0.26006, 1.5314, -0.5593527, 0, 1, 0.4352941, 1,
-0.2566137, 1.093904, -1.196714, 0, 1, 0.4431373, 1,
-0.2533267, 0.1278474, -1.240574, 0, 1, 0.4470588, 1,
-0.2531573, -0.1391254, -2.854394, 0, 1, 0.454902, 1,
-0.2507211, 0.2552892, 2.1513, 0, 1, 0.4588235, 1,
-0.2488995, 2.018904, -0.3727183, 0, 1, 0.4666667, 1,
-0.2437601, 0.2746852, -2.078643, 0, 1, 0.4705882, 1,
-0.2403752, 0.4051633, 0.3920784, 0, 1, 0.4784314, 1,
-0.2375538, -1.108966, -1.411644, 0, 1, 0.4823529, 1,
-0.235137, 0.6088433, 0.1629432, 0, 1, 0.4901961, 1,
-0.2339461, 0.534228, -1.366077, 0, 1, 0.4941176, 1,
-0.2212721, 0.1706501, -2.088549, 0, 1, 0.5019608, 1,
-0.2167087, -1.251259, -3.308606, 0, 1, 0.509804, 1,
-0.2145743, 1.721731, 1.708015, 0, 1, 0.5137255, 1,
-0.2144245, -1.446073, -4.321985, 0, 1, 0.5215687, 1,
-0.2082927, -0.4621719, -2.973065, 0, 1, 0.5254902, 1,
-0.2034279, -0.8750886, -2.202944, 0, 1, 0.5333334, 1,
-0.2033324, 1.245524, -0.2117827, 0, 1, 0.5372549, 1,
-0.1983541, 0.4088345, -0.6434897, 0, 1, 0.5450981, 1,
-0.1962128, -1.065857, -4.130231, 0, 1, 0.5490196, 1,
-0.1945759, 1.26193, -0.6912674, 0, 1, 0.5568628, 1,
-0.1871378, 0.8228812, 0.1623563, 0, 1, 0.5607843, 1,
-0.1843691, -1.374648, -4.169988, 0, 1, 0.5686275, 1,
-0.1841387, -1.366045, -3.110388, 0, 1, 0.572549, 1,
-0.1840149, 0.6232141, -1.799358, 0, 1, 0.5803922, 1,
-0.1826565, -0.9048986, -2.148985, 0, 1, 0.5843138, 1,
-0.1820631, -1.458123, -3.535068, 0, 1, 0.5921569, 1,
-0.1815218, -0.8418598, -3.775667, 0, 1, 0.5960785, 1,
-0.1775874, 0.8295755, -1.958378, 0, 1, 0.6039216, 1,
-0.1733036, 0.6987196, 0.5066922, 0, 1, 0.6117647, 1,
-0.1662764, 0.4058686, -0.7224216, 0, 1, 0.6156863, 1,
-0.1649087, 0.9940925, -0.3563742, 0, 1, 0.6235294, 1,
-0.1646093, 1.5363, -0.727688, 0, 1, 0.627451, 1,
-0.162447, -0.350659, -3.841321, 0, 1, 0.6352941, 1,
-0.1621413, 0.4192138, -0.3201082, 0, 1, 0.6392157, 1,
-0.1568554, -0.5105067, -1.949733, 0, 1, 0.6470588, 1,
-0.1564087, -0.5215769, -0.9698945, 0, 1, 0.6509804, 1,
-0.1484141, 0.3884217, 0.2712101, 0, 1, 0.6588235, 1,
-0.1381389, 1.56, -1.92115, 0, 1, 0.6627451, 1,
-0.135981, 1.067326, -0.1068985, 0, 1, 0.6705883, 1,
-0.1351697, 2.196333, -0.3989558, 0, 1, 0.6745098, 1,
-0.1334773, 0.1528043, -0.2156746, 0, 1, 0.682353, 1,
-0.1325434, -1.479149, -3.828636, 0, 1, 0.6862745, 1,
-0.1297199, -1.443843, -3.969722, 0, 1, 0.6941177, 1,
-0.1263718, -1.184292, -1.851329, 0, 1, 0.7019608, 1,
-0.125364, -1.089457, -2.277521, 0, 1, 0.7058824, 1,
-0.1224664, -1.205195, -4.020954, 0, 1, 0.7137255, 1,
-0.1214381, -0.5788205, -3.99214, 0, 1, 0.7176471, 1,
-0.1183865, 0.2036714, -2.622471, 0, 1, 0.7254902, 1,
-0.1149389, 0.2644939, 0.127827, 0, 1, 0.7294118, 1,
-0.1094426, -1.076967, -4.270834, 0, 1, 0.7372549, 1,
-0.09866268, -0.848374, -2.357235, 0, 1, 0.7411765, 1,
-0.09840585, 0.4377122, -0.3267366, 0, 1, 0.7490196, 1,
-0.09775764, -0.4011314, -3.253592, 0, 1, 0.7529412, 1,
-0.09737093, -0.07837439, -1.430892, 0, 1, 0.7607843, 1,
-0.09515685, -1.071407, -3.439954, 0, 1, 0.7647059, 1,
-0.08309983, -0.5665975, -2.622345, 0, 1, 0.772549, 1,
-0.07932503, 1.081328, -0.3822591, 0, 1, 0.7764706, 1,
-0.07752725, -0.4874938, -2.766515, 0, 1, 0.7843137, 1,
-0.07633273, -1.784962, -3.332514, 0, 1, 0.7882353, 1,
-0.07513223, -1.288281, -1.188668, 0, 1, 0.7960784, 1,
-0.07214254, -0.9801427, -3.238355, 0, 1, 0.8039216, 1,
-0.07008419, -0.2807558, -2.409336, 0, 1, 0.8078431, 1,
-0.06969737, -2.216934, -1.572102, 0, 1, 0.8156863, 1,
-0.05867785, 1.754769, -0.8924425, 0, 1, 0.8196079, 1,
-0.05032447, -0.4494864, -2.727504, 0, 1, 0.827451, 1,
-0.04607426, -1.273304, -4.838672, 0, 1, 0.8313726, 1,
-0.04202752, -0.5786712, -2.997511, 0, 1, 0.8392157, 1,
-0.04080015, 0.1321765, 0.3522743, 0, 1, 0.8431373, 1,
-0.04029096, -1.945643, -3.139627, 0, 1, 0.8509804, 1,
-0.03741482, 1.136242, -1.181079, 0, 1, 0.854902, 1,
-0.0297998, 0.001599222, -0.9714098, 0, 1, 0.8627451, 1,
-0.02859079, -0.6767883, -3.158212, 0, 1, 0.8666667, 1,
-0.02804325, 0.2640455, -0.3816817, 0, 1, 0.8745098, 1,
-0.0243039, 0.02775842, -1.831292, 0, 1, 0.8784314, 1,
-0.02157336, 0.6244993, -0.7046998, 0, 1, 0.8862745, 1,
-0.02077487, -0.7023673, -3.365508, 0, 1, 0.8901961, 1,
-0.01761618, -1.944483, -4.351559, 0, 1, 0.8980392, 1,
-0.008824463, -1.994744, -1.921488, 0, 1, 0.9058824, 1,
-0.008237832, 0.03547759, -1.160035, 0, 1, 0.9098039, 1,
-0.005268849, 0.7273028, -1.108926, 0, 1, 0.9176471, 1,
-0.004689779, -2.350602, -3.501894, 0, 1, 0.9215686, 1,
-0.001199758, 0.1848619, 1.486055, 0, 1, 0.9294118, 1,
-0.0008943987, -0.07875764, -3.185644, 0, 1, 0.9333333, 1,
0.002343522, -0.7633337, 2.923491, 0, 1, 0.9411765, 1,
0.003266636, 0.9614503, -2.20381, 0, 1, 0.945098, 1,
0.003993014, -0.878237, 1.829996, 0, 1, 0.9529412, 1,
0.009012284, -1.168146, 4.321362, 0, 1, 0.9568627, 1,
0.01170564, -1.086118, 2.561529, 0, 1, 0.9647059, 1,
0.01322705, 0.6524613, 2.033885, 0, 1, 0.9686275, 1,
0.01332608, -2.568033, 3.323455, 0, 1, 0.9764706, 1,
0.01478411, 0.0606675, -0.4413225, 0, 1, 0.9803922, 1,
0.01607022, 0.494585, 1.984324, 0, 1, 0.9882353, 1,
0.01689713, -0.5376716, 4.148877, 0, 1, 0.9921569, 1,
0.01794975, -0.9954576, 3.627013, 0, 1, 1, 1,
0.01803759, 0.6605731, -0.04381316, 0, 0.9921569, 1, 1,
0.01822176, -0.8543088, 2.401307, 0, 0.9882353, 1, 1,
0.01831831, -0.1751993, 2.85485, 0, 0.9803922, 1, 1,
0.02076516, -0.6225007, 1.64866, 0, 0.9764706, 1, 1,
0.02480248, 0.3826234, 1.215045, 0, 0.9686275, 1, 1,
0.02816497, 1.452324, -0.7211815, 0, 0.9647059, 1, 1,
0.0305037, 1.745658, -1.066135, 0, 0.9568627, 1, 1,
0.03122043, -0.8313585, 2.140903, 0, 0.9529412, 1, 1,
0.03159817, -0.9106309, 2.349164, 0, 0.945098, 1, 1,
0.03244507, 2.182604, 0.09398937, 0, 0.9411765, 1, 1,
0.03531733, 1.288077, 1.037133, 0, 0.9333333, 1, 1,
0.03689951, 0.131235, 2.209414, 0, 0.9294118, 1, 1,
0.04044103, -1.301188, 4.000984, 0, 0.9215686, 1, 1,
0.04476643, -0.01650132, 2.410476, 0, 0.9176471, 1, 1,
0.04966184, 1.540772, -0.3547684, 0, 0.9098039, 1, 1,
0.05104258, 1.224438, -0.6298319, 0, 0.9058824, 1, 1,
0.05388296, 0.5276024, 1.971715, 0, 0.8980392, 1, 1,
0.05567283, -1.261993, 2.243799, 0, 0.8901961, 1, 1,
0.05624586, 0.8742347, -0.6428307, 0, 0.8862745, 1, 1,
0.06038525, 0.2071076, -0.6164229, 0, 0.8784314, 1, 1,
0.06053855, 1.412341, -1.492595, 0, 0.8745098, 1, 1,
0.06116137, 0.867582, -0.01819463, 0, 0.8666667, 1, 1,
0.06468325, 0.6734872, -0.2263748, 0, 0.8627451, 1, 1,
0.06676423, 0.5435288, 1.431457, 0, 0.854902, 1, 1,
0.06805239, -0.1078344, 2.83021, 0, 0.8509804, 1, 1,
0.07344662, -0.8922964, 3.491029, 0, 0.8431373, 1, 1,
0.07433698, 1.661313, 1.100538, 0, 0.8392157, 1, 1,
0.07572725, -0.2035684, 1.851261, 0, 0.8313726, 1, 1,
0.07587475, -0.681824, 2.263796, 0, 0.827451, 1, 1,
0.07689933, -1.264277, 3.551962, 0, 0.8196079, 1, 1,
0.07813463, -0.6974101, 1.588255, 0, 0.8156863, 1, 1,
0.07959785, 0.3301994, -0.2478134, 0, 0.8078431, 1, 1,
0.0806414, -0.3413465, 1.416816, 0, 0.8039216, 1, 1,
0.08130652, -1.254721, 3.040957, 0, 0.7960784, 1, 1,
0.08399434, 1.130497, -0.4062172, 0, 0.7882353, 1, 1,
0.08850417, -1.203508, 4.009301, 0, 0.7843137, 1, 1,
0.0924203, -0.8994318, 2.641953, 0, 0.7764706, 1, 1,
0.09286335, -0.08590013, 4.202038, 0, 0.772549, 1, 1,
0.09391791, -1.817971, 1.295603, 0, 0.7647059, 1, 1,
0.1002448, 0.915092, -0.3297408, 0, 0.7607843, 1, 1,
0.103501, -0.1189212, 2.148107, 0, 0.7529412, 1, 1,
0.1057816, 0.6364791, -1.41291, 0, 0.7490196, 1, 1,
0.106207, 0.1600119, 1.283417, 0, 0.7411765, 1, 1,
0.1095485, -0.3043284, 2.664027, 0, 0.7372549, 1, 1,
0.1135239, 1.884203, -0.3864187, 0, 0.7294118, 1, 1,
0.1139835, 0.102279, -0.04783276, 0, 0.7254902, 1, 1,
0.114734, -0.5461521, 3.287422, 0, 0.7176471, 1, 1,
0.1166195, -1.501448, 2.511756, 0, 0.7137255, 1, 1,
0.1210618, -0.3892296, 2.238897, 0, 0.7058824, 1, 1,
0.1246075, -2.211004, 2.978832, 0, 0.6980392, 1, 1,
0.1255627, -0.2232919, 4.688852, 0, 0.6941177, 1, 1,
0.1261105, -0.911756, 2.762041, 0, 0.6862745, 1, 1,
0.1266828, -0.7249874, 2.481794, 0, 0.682353, 1, 1,
0.1365148, -0.7173757, 4.275878, 0, 0.6745098, 1, 1,
0.1392233, 1.128498, -0.6318322, 0, 0.6705883, 1, 1,
0.1407633, -0.8232328, 3.422426, 0, 0.6627451, 1, 1,
0.1439329, 1.597601, -0.9306206, 0, 0.6588235, 1, 1,
0.1488533, -0.6554603, 3.877056, 0, 0.6509804, 1, 1,
0.1494491, -1.368074, 4.806785, 0, 0.6470588, 1, 1,
0.1507283, 0.7550201, 0.379179, 0, 0.6392157, 1, 1,
0.1534488, 1.113336, -1.004451, 0, 0.6352941, 1, 1,
0.1708367, -0.5535692, 3.410829, 0, 0.627451, 1, 1,
0.1731061, -0.7505206, 4.181444, 0, 0.6235294, 1, 1,
0.1739364, 0.6195627, -0.9230309, 0, 0.6156863, 1, 1,
0.1744966, 0.8030313, 0.1722818, 0, 0.6117647, 1, 1,
0.1790475, 0.9580896, -0.5597418, 0, 0.6039216, 1, 1,
0.1852407, 0.3315186, 0.7050788, 0, 0.5960785, 1, 1,
0.1858609, 0.5540789, 1.476475, 0, 0.5921569, 1, 1,
0.1912185, -1.305359, 2.679225, 0, 0.5843138, 1, 1,
0.1959234, -0.9934893, 1.577937, 0, 0.5803922, 1, 1,
0.1969879, -1.817672, 4.13192, 0, 0.572549, 1, 1,
0.1977985, 0.1754059, 0.1384728, 0, 0.5686275, 1, 1,
0.2010316, 1.213647, 0.5812442, 0, 0.5607843, 1, 1,
0.2039587, 0.2924951, -0.611241, 0, 0.5568628, 1, 1,
0.2090502, 0.68545, -0.5780032, 0, 0.5490196, 1, 1,
0.2093099, -0.8295421, 1.998216, 0, 0.5450981, 1, 1,
0.2097618, -0.06310964, 1.549127, 0, 0.5372549, 1, 1,
0.2109183, 0.8314333, -2.278623, 0, 0.5333334, 1, 1,
0.2129233, -3.775872, 3.085349, 0, 0.5254902, 1, 1,
0.2142148, -0.01793807, 4.313012, 0, 0.5215687, 1, 1,
0.2153398, -1.444347, 2.27311, 0, 0.5137255, 1, 1,
0.2226368, -0.1919676, 1.931108, 0, 0.509804, 1, 1,
0.2261313, 0.1198182, -0.282004, 0, 0.5019608, 1, 1,
0.2280993, 0.2280097, -0.1782646, 0, 0.4941176, 1, 1,
0.2287872, -0.4230623, 3.762181, 0, 0.4901961, 1, 1,
0.2321989, 0.1436902, 0.9911201, 0, 0.4823529, 1, 1,
0.2383431, 2.15562, -0.3071878, 0, 0.4784314, 1, 1,
0.2438664, -0.7464991, 3.114818, 0, 0.4705882, 1, 1,
0.245545, 1.846466, -0.3259067, 0, 0.4666667, 1, 1,
0.2470332, -0.1389883, 3.815237, 0, 0.4588235, 1, 1,
0.2555298, -2.301646, 2.828346, 0, 0.454902, 1, 1,
0.2572074, -0.3674396, 2.301387, 0, 0.4470588, 1, 1,
0.2577884, 0.4506221, 0.3148898, 0, 0.4431373, 1, 1,
0.2618809, -0.9541154, 3.875442, 0, 0.4352941, 1, 1,
0.2635445, -0.4944346, 1.567288, 0, 0.4313726, 1, 1,
0.2652803, -0.3927682, 2.589386, 0, 0.4235294, 1, 1,
0.2673326, -0.1164507, 1.957252, 0, 0.4196078, 1, 1,
0.2681929, 2.811447, -1.323027, 0, 0.4117647, 1, 1,
0.2684096, -0.1704013, 3.994673, 0, 0.4078431, 1, 1,
0.2694134, -0.1954405, 3.42283, 0, 0.4, 1, 1,
0.2735627, 0.9313998, 0.5950041, 0, 0.3921569, 1, 1,
0.2747062, 1.002134, -1.879705, 0, 0.3882353, 1, 1,
0.276915, 0.2206486, 2.767757, 0, 0.3803922, 1, 1,
0.2791026, -0.7692381, 3.120823, 0, 0.3764706, 1, 1,
0.2791446, -0.9370549, 1.483, 0, 0.3686275, 1, 1,
0.2843231, 2.399927, -1.105304, 0, 0.3647059, 1, 1,
0.2855516, -0.03647559, 2.75508, 0, 0.3568628, 1, 1,
0.2873666, 0.07894281, 1.028711, 0, 0.3529412, 1, 1,
0.2879769, 0.5137505, -0.2456443, 0, 0.345098, 1, 1,
0.2905187, 1.117939, 1.731871, 0, 0.3411765, 1, 1,
0.2906414, 0.1404673, 1.330184, 0, 0.3333333, 1, 1,
0.2915181, -0.3946733, 2.554432, 0, 0.3294118, 1, 1,
0.2922614, -0.1669845, 1.968381, 0, 0.3215686, 1, 1,
0.2940214, -1.047604, 3.700995, 0, 0.3176471, 1, 1,
0.2987979, -0.6406975, 2.857147, 0, 0.3098039, 1, 1,
0.2989056, -1.452152, 4.017938, 0, 0.3058824, 1, 1,
0.2999415, -0.1380408, 2.071942, 0, 0.2980392, 1, 1,
0.3030842, 0.7552553, -0.007847263, 0, 0.2901961, 1, 1,
0.3035443, 0.4502023, 0.5131252, 0, 0.2862745, 1, 1,
0.3055754, -2.302996, 5.560353, 0, 0.2784314, 1, 1,
0.3067924, 1.475045, 0.22933, 0, 0.2745098, 1, 1,
0.3119504, -0.02961451, 3.54598, 0, 0.2666667, 1, 1,
0.3175525, 0.3521363, 1.412837, 0, 0.2627451, 1, 1,
0.3234701, 1.346638, -1.19646, 0, 0.254902, 1, 1,
0.3257192, -0.6239092, 2.334133, 0, 0.2509804, 1, 1,
0.3261963, -0.2355407, 1.07141, 0, 0.2431373, 1, 1,
0.3291255, -0.6880183, 4.010238, 0, 0.2392157, 1, 1,
0.3302621, -0.07444152, 4.156216, 0, 0.2313726, 1, 1,
0.3329157, -0.1096882, 2.415654, 0, 0.227451, 1, 1,
0.3409828, 0.2621071, 0.01745264, 0, 0.2196078, 1, 1,
0.341843, -2.141594, 4.296704, 0, 0.2156863, 1, 1,
0.3427024, 0.7706456, 0.6765606, 0, 0.2078431, 1, 1,
0.3438371, -0.2841338, 2.64179, 0, 0.2039216, 1, 1,
0.3443621, 1.246545, 0.1152031, 0, 0.1960784, 1, 1,
0.3498966, 0.9884223, 0.7373012, 0, 0.1882353, 1, 1,
0.3529418, -1.121311, 3.790016, 0, 0.1843137, 1, 1,
0.3554118, -0.2554235, 1.748454, 0, 0.1764706, 1, 1,
0.3591294, -0.1923651, 3.057445, 0, 0.172549, 1, 1,
0.3607304, 1.254839, 0.0456342, 0, 0.1647059, 1, 1,
0.3633791, 0.959512, 0.8845555, 0, 0.1607843, 1, 1,
0.3646503, -0.4134742, 3.242151, 0, 0.1529412, 1, 1,
0.3656163, 1.30164, 0.05727859, 0, 0.1490196, 1, 1,
0.3692473, -1.503143, 2.536557, 0, 0.1411765, 1, 1,
0.3719754, -0.0005476203, 1.63115, 0, 0.1372549, 1, 1,
0.372926, -1.327998, 2.077065, 0, 0.1294118, 1, 1,
0.3759706, -0.3634817, 4.08357, 0, 0.1254902, 1, 1,
0.3777353, 0.7154923, 1.104138, 0, 0.1176471, 1, 1,
0.381563, 0.4442513, 0.7629217, 0, 0.1137255, 1, 1,
0.3840743, 0.2478894, 0.8238128, 0, 0.1058824, 1, 1,
0.3857479, 0.9513152, -0.5046218, 0, 0.09803922, 1, 1,
0.3868894, -0.4886117, 3.888096, 0, 0.09411765, 1, 1,
0.3897944, 1.229113, -1.066584, 0, 0.08627451, 1, 1,
0.3900224, 1.11027, 0.7035059, 0, 0.08235294, 1, 1,
0.3932924, -2.342683, 1.800166, 0, 0.07450981, 1, 1,
0.396201, 0.43728, 0.8513609, 0, 0.07058824, 1, 1,
0.3966882, -1.150016, 3.480808, 0, 0.0627451, 1, 1,
0.3974631, 0.5555136, 1.019775, 0, 0.05882353, 1, 1,
0.4034435, 0.4344433, -0.6884481, 0, 0.05098039, 1, 1,
0.4046973, -1.360041, 3.290962, 0, 0.04705882, 1, 1,
0.4055595, 0.5364674, 3.725986, 0, 0.03921569, 1, 1,
0.4060776, -0.3676561, 1.405718, 0, 0.03529412, 1, 1,
0.410581, 0.4972259, -0.3002759, 0, 0.02745098, 1, 1,
0.4129562, -0.5025036, 2.209992, 0, 0.02352941, 1, 1,
0.4138943, 1.8907, -1.697264, 0, 0.01568628, 1, 1,
0.4202704, -0.1464208, 1.019876, 0, 0.01176471, 1, 1,
0.4210964, 1.306658, -0.1323765, 0, 0.003921569, 1, 1,
0.4214953, 0.9954519, 1.431455, 0.003921569, 0, 1, 1,
0.4236609, -0.4141878, 3.297333, 0.007843138, 0, 1, 1,
0.4240341, -1.183278, 3.630918, 0.01568628, 0, 1, 1,
0.4256568, -0.1266889, 1.50964, 0.01960784, 0, 1, 1,
0.4267297, 0.09519363, 1.970615, 0.02745098, 0, 1, 1,
0.4273802, -0.5582601, 1.573323, 0.03137255, 0, 1, 1,
0.4332727, -1.30064, 2.744591, 0.03921569, 0, 1, 1,
0.433618, 1.173941, 0.3231192, 0.04313726, 0, 1, 1,
0.4358811, -0.6249136, 2.693726, 0.05098039, 0, 1, 1,
0.4366139, 0.4547088, 1.614098, 0.05490196, 0, 1, 1,
0.4415352, -0.5401145, 2.519835, 0.0627451, 0, 1, 1,
0.4439593, 1.345632, -0.04855492, 0.06666667, 0, 1, 1,
0.444537, 1.09028, -1.087023, 0.07450981, 0, 1, 1,
0.4471723, -1.064307, 1.702052, 0.07843138, 0, 1, 1,
0.450507, -0.8155559, 3.026758, 0.08627451, 0, 1, 1,
0.4560629, 0.6108015, 1.395194, 0.09019608, 0, 1, 1,
0.4635798, 0.1261761, 1.263622, 0.09803922, 0, 1, 1,
0.4679691, -0.5884113, 2.07374, 0.1058824, 0, 1, 1,
0.4685067, 0.3581704, 0.9315705, 0.1098039, 0, 1, 1,
0.4711204, -0.2478994, 1.729908, 0.1176471, 0, 1, 1,
0.4724063, 1.820286, -1.923016, 0.1215686, 0, 1, 1,
0.4736538, -0.2541505, 2.124785, 0.1294118, 0, 1, 1,
0.4759814, 2.397508, -0.2140771, 0.1333333, 0, 1, 1,
0.4909993, 0.5048628, 1.006982, 0.1411765, 0, 1, 1,
0.4935366, 1.02772, 0.7993615, 0.145098, 0, 1, 1,
0.5007454, -0.2146132, 2.715401, 0.1529412, 0, 1, 1,
0.50262, -0.5613022, 1.760762, 0.1568628, 0, 1, 1,
0.5040424, -1.863868, 3.944693, 0.1647059, 0, 1, 1,
0.5141775, 0.9630396, 1.704677, 0.1686275, 0, 1, 1,
0.5169605, -1.17623, 1.995952, 0.1764706, 0, 1, 1,
0.5217504, -0.8004932, 2.47989, 0.1803922, 0, 1, 1,
0.5291411, -2.286733, 3.995651, 0.1882353, 0, 1, 1,
0.5387703, -1.662161, 2.149038, 0.1921569, 0, 1, 1,
0.5426151, -0.345342, 1.864236, 0.2, 0, 1, 1,
0.5442186, 0.572528, -0.493999, 0.2078431, 0, 1, 1,
0.5443028, -0.03006793, 1.79284, 0.2117647, 0, 1, 1,
0.5474111, -1.644617, 2.245508, 0.2196078, 0, 1, 1,
0.5502776, -0.3346674, 2.022632, 0.2235294, 0, 1, 1,
0.5510014, 0.5932084, 1.088831, 0.2313726, 0, 1, 1,
0.5519155, 0.4912263, 0.7336074, 0.2352941, 0, 1, 1,
0.554145, -0.8828779, 1.761865, 0.2431373, 0, 1, 1,
0.5582228, 0.8246496, -0.006034223, 0.2470588, 0, 1, 1,
0.576007, -1.025558, 3.402412, 0.254902, 0, 1, 1,
0.5778807, 0.9503444, 1.215081, 0.2588235, 0, 1, 1,
0.5826672, 0.6022945, 0.6012559, 0.2666667, 0, 1, 1,
0.5851939, -1.554787, 2.972836, 0.2705882, 0, 1, 1,
0.5878049, -1.708314, 2.580977, 0.2784314, 0, 1, 1,
0.5899784, 0.5120354, 0.183223, 0.282353, 0, 1, 1,
0.5909591, 0.4812835, 0.4083727, 0.2901961, 0, 1, 1,
0.5911617, -0.8601868, 1.756747, 0.2941177, 0, 1, 1,
0.5951975, 0.1182161, 2.158325, 0.3019608, 0, 1, 1,
0.5954623, -0.668835, 2.87813, 0.3098039, 0, 1, 1,
0.597924, -2.056728, 1.780764, 0.3137255, 0, 1, 1,
0.6043125, -1.116441, 2.248022, 0.3215686, 0, 1, 1,
0.6087204, -0.01698916, 0.3514962, 0.3254902, 0, 1, 1,
0.6103027, -1.643943, 3.046003, 0.3333333, 0, 1, 1,
0.6177802, 0.803416, 1.667771, 0.3372549, 0, 1, 1,
0.6194864, -0.5490755, 1.300892, 0.345098, 0, 1, 1,
0.6198343, -0.7215679, 2.013776, 0.3490196, 0, 1, 1,
0.6222236, 0.6454039, 1.468468, 0.3568628, 0, 1, 1,
0.6244615, 1.522324, 0.7191742, 0.3607843, 0, 1, 1,
0.6260369, -0.8148286, 2.998218, 0.3686275, 0, 1, 1,
0.6273167, -0.710987, 2.981, 0.372549, 0, 1, 1,
0.6304505, -0.008437954, 2.842044, 0.3803922, 0, 1, 1,
0.6329218, -0.1805713, 2.102344, 0.3843137, 0, 1, 1,
0.6351069, -0.6306025, 3.52364, 0.3921569, 0, 1, 1,
0.6359856, 0.2608828, 0.76998, 0.3960784, 0, 1, 1,
0.636432, -0.865425, 3.474534, 0.4039216, 0, 1, 1,
0.6393387, -1.487874, 2.988044, 0.4117647, 0, 1, 1,
0.6395895, 0.7083048, -0.6682438, 0.4156863, 0, 1, 1,
0.6447496, 0.9653053, 0.5309122, 0.4235294, 0, 1, 1,
0.646848, -0.5144286, 2.473325, 0.427451, 0, 1, 1,
0.6474496, -1.153757, 2.548868, 0.4352941, 0, 1, 1,
0.6524621, -1.674114, 2.574198, 0.4392157, 0, 1, 1,
0.6599736, -0.7715438, 2.347475, 0.4470588, 0, 1, 1,
0.6601834, -0.05813089, -0.1314016, 0.4509804, 0, 1, 1,
0.6652004, 0.8278829, -0.4954827, 0.4588235, 0, 1, 1,
0.6671349, -0.2350489, 2.549299, 0.4627451, 0, 1, 1,
0.6678569, -0.03017553, 1.47155, 0.4705882, 0, 1, 1,
0.6714432, 0.07307204, 3.437878, 0.4745098, 0, 1, 1,
0.6726797, -1.346824, 3.585525, 0.4823529, 0, 1, 1,
0.6779991, -1.083682, 1.044348, 0.4862745, 0, 1, 1,
0.6794069, -0.219749, 1.281027, 0.4941176, 0, 1, 1,
0.6806383, -0.1185424, 1.053981, 0.5019608, 0, 1, 1,
0.6848532, 1.122944, 0.101991, 0.5058824, 0, 1, 1,
0.6888714, 0.6859444, -0.638699, 0.5137255, 0, 1, 1,
0.6957693, -0.1663649, 0.3069241, 0.5176471, 0, 1, 1,
0.6959807, 1.048221, 0.009402245, 0.5254902, 0, 1, 1,
0.6967854, -1.556251, 3.845378, 0.5294118, 0, 1, 1,
0.6991078, 0.4169031, 0.4666598, 0.5372549, 0, 1, 1,
0.7010658, 0.04194194, 2.454654, 0.5411765, 0, 1, 1,
0.7011536, -2.199626, 1.822718, 0.5490196, 0, 1, 1,
0.7060844, -1.681874, 2.93996, 0.5529412, 0, 1, 1,
0.7091772, -1.036975, 3.743125, 0.5607843, 0, 1, 1,
0.7109805, -0.7393347, 1.579558, 0.5647059, 0, 1, 1,
0.7138755, 0.8215061, 2.286396, 0.572549, 0, 1, 1,
0.7155671, 0.02751346, 3.045139, 0.5764706, 0, 1, 1,
0.7271032, -0.7223615, 2.901441, 0.5843138, 0, 1, 1,
0.729463, 0.7697269, 0.5220127, 0.5882353, 0, 1, 1,
0.7296392, -0.2829369, 3.445148, 0.5960785, 0, 1, 1,
0.7359862, 0.05825761, 0.4709109, 0.6039216, 0, 1, 1,
0.7363139, -0.5699766, 2.266908, 0.6078432, 0, 1, 1,
0.7433145, 0.1561548, -0.5805259, 0.6156863, 0, 1, 1,
0.7491712, 0.3373015, 1.62271, 0.6196079, 0, 1, 1,
0.7555124, 1.729048, 1.303041, 0.627451, 0, 1, 1,
0.757936, -1.071003, 2.247656, 0.6313726, 0, 1, 1,
0.7603995, 0.8116621, 1.68564, 0.6392157, 0, 1, 1,
0.7622092, -2.059108, 3.11109, 0.6431373, 0, 1, 1,
0.7689469, -0.7367657, 1.788695, 0.6509804, 0, 1, 1,
0.7727857, -0.2140205, 1.591478, 0.654902, 0, 1, 1,
0.7736049, 1.54974, -0.3399449, 0.6627451, 0, 1, 1,
0.7777189, -1.135164, 2.76413, 0.6666667, 0, 1, 1,
0.778273, 0.2573063, 2.6239, 0.6745098, 0, 1, 1,
0.7792259, 0.05564552, 0.6606709, 0.6784314, 0, 1, 1,
0.7809185, -0.2257292, 1.900502, 0.6862745, 0, 1, 1,
0.7817787, 0.2419258, 0.4700444, 0.6901961, 0, 1, 1,
0.782894, 0.5862257, 2.260997, 0.6980392, 0, 1, 1,
0.7936147, 0.3748668, 0.5207607, 0.7058824, 0, 1, 1,
0.796824, -0.308645, 1.522197, 0.7098039, 0, 1, 1,
0.8027814, 1.443752, 1.486404, 0.7176471, 0, 1, 1,
0.8092031, 0.1593293, 1.361119, 0.7215686, 0, 1, 1,
0.8097245, -0.6069687, 2.356894, 0.7294118, 0, 1, 1,
0.8123128, -0.3216332, 1.883388, 0.7333333, 0, 1, 1,
0.8170395, 0.01621149, 3.01192, 0.7411765, 0, 1, 1,
0.8170808, 0.6826618, 1.504843, 0.7450981, 0, 1, 1,
0.8198437, 1.115761, 0.2344733, 0.7529412, 0, 1, 1,
0.8200902, -0.7643541, 1.03575, 0.7568628, 0, 1, 1,
0.8242614, -0.604678, 2.441473, 0.7647059, 0, 1, 1,
0.8252701, 0.6184286, 1.450991, 0.7686275, 0, 1, 1,
0.8256196, 0.7707512, 2.80322, 0.7764706, 0, 1, 1,
0.8261194, 0.5286374, 1.307155, 0.7803922, 0, 1, 1,
0.8279741, -0.5021645, 3.085934, 0.7882353, 0, 1, 1,
0.8332469, -0.079163, 1.414507, 0.7921569, 0, 1, 1,
0.8378569, 1.153543, 1.222384, 0.8, 0, 1, 1,
0.838852, -0.8211365, 2.119969, 0.8078431, 0, 1, 1,
0.8457212, 0.04391502, 2.007801, 0.8117647, 0, 1, 1,
0.8489086, -1.255081, 0.8865806, 0.8196079, 0, 1, 1,
0.8534281, 0.4763632, 0.007197792, 0.8235294, 0, 1, 1,
0.8549384, -0.2047494, 1.75301, 0.8313726, 0, 1, 1,
0.856157, 0.8884458, 0.4275993, 0.8352941, 0, 1, 1,
0.8569202, -0.1557318, 1.36139, 0.8431373, 0, 1, 1,
0.8634604, -0.08958235, 1.073343, 0.8470588, 0, 1, 1,
0.8673977, -0.6003969, 1.495979, 0.854902, 0, 1, 1,
0.8685298, -1.042632, 3.919435, 0.8588235, 0, 1, 1,
0.868724, -0.7832025, -0.424999, 0.8666667, 0, 1, 1,
0.8723295, -1.078295, 0.3050957, 0.8705882, 0, 1, 1,
0.8778992, 1.094297, 0.3187491, 0.8784314, 0, 1, 1,
0.8825992, 0.4177819, 1.28061, 0.8823529, 0, 1, 1,
0.8892549, -0.173284, 2.442888, 0.8901961, 0, 1, 1,
0.8901065, -0.9513315, 3.780561, 0.8941177, 0, 1, 1,
0.893099, -1.055753, 3.224599, 0.9019608, 0, 1, 1,
0.8933814, -0.1700994, 1.600967, 0.9098039, 0, 1, 1,
0.8944293, -1.550568, 0.2116996, 0.9137255, 0, 1, 1,
0.8981006, -1.269887, 2.378085, 0.9215686, 0, 1, 1,
0.9038331, 0.8868874, -0.3152605, 0.9254902, 0, 1, 1,
0.9108237, 0.8306433, 0.4365733, 0.9333333, 0, 1, 1,
0.9168876, -1.578315, 1.387801, 0.9372549, 0, 1, 1,
0.9254745, -1.011981, 2.285321, 0.945098, 0, 1, 1,
0.9318364, 0.1265175, 3.164822, 0.9490196, 0, 1, 1,
0.9377755, 0.4895709, 3.313346, 0.9568627, 0, 1, 1,
0.9402072, 1.406071, 0.2372651, 0.9607843, 0, 1, 1,
0.9500346, 1.0377, 1.962322, 0.9686275, 0, 1, 1,
0.9619995, -1.021892, 2.382498, 0.972549, 0, 1, 1,
0.9678028, -0.1489885, 0.8008127, 0.9803922, 0, 1, 1,
0.9707407, -1.284948, 2.304403, 0.9843137, 0, 1, 1,
0.9709153, 0.8906415, 0.001737777, 0.9921569, 0, 1, 1,
0.9770382, 1.787753, 1.706864, 0.9960784, 0, 1, 1,
0.9820682, 2.821124, -0.3259678, 1, 0, 0.9960784, 1,
0.986264, -1.021897, 1.869109, 1, 0, 0.9882353, 1,
0.9877952, 0.6552766, 1.598634, 1, 0, 0.9843137, 1,
0.9879817, -1.703957, 2.603863, 1, 0, 0.9764706, 1,
0.9911423, 0.656635, 3.018365, 1, 0, 0.972549, 1,
0.9915266, -1.42951, 2.21465, 1, 0, 0.9647059, 1,
0.9923096, 1.219437, 0.5265877, 1, 0, 0.9607843, 1,
0.9927894, -0.9563306, 2.647267, 1, 0, 0.9529412, 1,
1.005511, -0.5140087, 2.652774, 1, 0, 0.9490196, 1,
1.009585, 1.024488, 1.011251, 1, 0, 0.9411765, 1,
1.015453, -1.86069, 1.976646, 1, 0, 0.9372549, 1,
1.0226, -0.3152638, 3.103073, 1, 0, 0.9294118, 1,
1.022745, 0.009089298, 2.041223, 1, 0, 0.9254902, 1,
1.023471, -0.3114401, 1.597434, 1, 0, 0.9176471, 1,
1.028697, 0.9984205, 2.805514, 1, 0, 0.9137255, 1,
1.031893, -0.6466167, 2.051036, 1, 0, 0.9058824, 1,
1.035871, -1.281677, 2.865088, 1, 0, 0.9019608, 1,
1.045917, 0.3315483, 1.179809, 1, 0, 0.8941177, 1,
1.04862, -0.9243222, 0.8087329, 1, 0, 0.8862745, 1,
1.048817, 0.1458467, 0.6078695, 1, 0, 0.8823529, 1,
1.050388, 1.485687, 1.106361, 1, 0, 0.8745098, 1,
1.053841, 0.3670927, 2.810925, 1, 0, 0.8705882, 1,
1.054583, 0.9924895, 2.073121, 1, 0, 0.8627451, 1,
1.056921, -0.99016, 2.998317, 1, 0, 0.8588235, 1,
1.074881, 0.7479073, 3.135019, 1, 0, 0.8509804, 1,
1.087935, 2.937233, 0.6110446, 1, 0, 0.8470588, 1,
1.091136, -0.3757756, 0.9540416, 1, 0, 0.8392157, 1,
1.097072, 0.4466454, 2.490401, 1, 0, 0.8352941, 1,
1.103134, -1.969727, 5.350867, 1, 0, 0.827451, 1,
1.115654, -0.3526738, 0.07608736, 1, 0, 0.8235294, 1,
1.127846, -0.7857732, 1.814215, 1, 0, 0.8156863, 1,
1.133344, -0.01912318, 1.170264, 1, 0, 0.8117647, 1,
1.133921, 0.7454327, 0.2984503, 1, 0, 0.8039216, 1,
1.140966, -0.7180521, 3.002363, 1, 0, 0.7960784, 1,
1.143341, 1.007989, 1.222581, 1, 0, 0.7921569, 1,
1.145997, 1.631454, 0.1053942, 1, 0, 0.7843137, 1,
1.146204, 0.2049416, 1.495062, 1, 0, 0.7803922, 1,
1.14782, 1.638794, -0.6047869, 1, 0, 0.772549, 1,
1.149876, -0.6464848, 2.13714, 1, 0, 0.7686275, 1,
1.155557, -0.8455278, 2.698503, 1, 0, 0.7607843, 1,
1.163052, 1.931522, -0.09625848, 1, 0, 0.7568628, 1,
1.169444, 0.6381972, 0.2308611, 1, 0, 0.7490196, 1,
1.183923, -0.008109747, 1.263343, 1, 0, 0.7450981, 1,
1.18874, -0.3703931, 1.433406, 1, 0, 0.7372549, 1,
1.193383, 0.8065186, 1.543578, 1, 0, 0.7333333, 1,
1.197238, 0.6330263, 0.8535864, 1, 0, 0.7254902, 1,
1.198498, 0.2374739, 0.7064986, 1, 0, 0.7215686, 1,
1.2015, -0.5228653, 1.805374, 1, 0, 0.7137255, 1,
1.203945, -0.1479867, 2.253462, 1, 0, 0.7098039, 1,
1.205915, -0.3572164, 1.489779, 1, 0, 0.7019608, 1,
1.219123, 0.4039975, 1.19822, 1, 0, 0.6941177, 1,
1.236638, 1.347785, -0.3605399, 1, 0, 0.6901961, 1,
1.23667, 0.07679101, 1.255034, 1, 0, 0.682353, 1,
1.238184, -0.4969718, 1.502352, 1, 0, 0.6784314, 1,
1.238984, -1.330648, 2.029091, 1, 0, 0.6705883, 1,
1.245764, -0.7744771, 1.723258, 1, 0, 0.6666667, 1,
1.247152, 1.691614, 0.8254216, 1, 0, 0.6588235, 1,
1.257695, -0.3926158, 0.5133713, 1, 0, 0.654902, 1,
1.259923, -0.8432267, 2.542436, 1, 0, 0.6470588, 1,
1.260497, 1.09434, 1.963426, 1, 0, 0.6431373, 1,
1.263241, 1.925858, 0.704431, 1, 0, 0.6352941, 1,
1.265934, -0.2015048, 0.502001, 1, 0, 0.6313726, 1,
1.266235, -1.1856, 0.3165913, 1, 0, 0.6235294, 1,
1.269549, -0.8880804, 2.470389, 1, 0, 0.6196079, 1,
1.279257, -1.165892, 0.5553442, 1, 0, 0.6117647, 1,
1.293055, -1.275681, 1.78039, 1, 0, 0.6078432, 1,
1.296132, -1.686355, 2.42277, 1, 0, 0.6, 1,
1.304173, 0.4969561, 1.6832, 1, 0, 0.5921569, 1,
1.308364, -0.3945837, 3.278403, 1, 0, 0.5882353, 1,
1.316812, 0.896966, 0.5899046, 1, 0, 0.5803922, 1,
1.317219, 0.1196463, 0.8360823, 1, 0, 0.5764706, 1,
1.32233, -0.8567366, 3.465492, 1, 0, 0.5686275, 1,
1.327643, 0.2179727, 1.421502, 1, 0, 0.5647059, 1,
1.347543, 0.8813841, 0.8659017, 1, 0, 0.5568628, 1,
1.347879, -0.5454963, 3.038532, 1, 0, 0.5529412, 1,
1.355717, 2.181925, 0.2834651, 1, 0, 0.5450981, 1,
1.359124, -0.6492005, 3.060185, 1, 0, 0.5411765, 1,
1.381223, -0.8461629, 2.550362, 1, 0, 0.5333334, 1,
1.387936, 0.4732711, 1.842398, 1, 0, 0.5294118, 1,
1.392043, 1.702248, 1.146944, 1, 0, 0.5215687, 1,
1.395226, -0.6449001, 2.385978, 1, 0, 0.5176471, 1,
1.396633, -0.2350919, 1.352958, 1, 0, 0.509804, 1,
1.421494, 1.639806, 1.258589, 1, 0, 0.5058824, 1,
1.425025, -0.4198418, 2.294109, 1, 0, 0.4980392, 1,
1.426366, -0.7191393, 2.996429, 1, 0, 0.4901961, 1,
1.428135, 0.6374602, 1.392857, 1, 0, 0.4862745, 1,
1.432885, 0.4103376, 0.9066173, 1, 0, 0.4784314, 1,
1.432998, -1.053845, 3.290454, 1, 0, 0.4745098, 1,
1.434805, 0.3081143, -0.7702965, 1, 0, 0.4666667, 1,
1.438133, 0.6224594, 2.952292, 1, 0, 0.4627451, 1,
1.441863, 0.2047386, 0.3396046, 1, 0, 0.454902, 1,
1.442534, 0.4420082, 1.522335, 1, 0, 0.4509804, 1,
1.443339, 1.169166, 0.8089238, 1, 0, 0.4431373, 1,
1.459294, -0.7386581, 2.137299, 1, 0, 0.4392157, 1,
1.477032, -0.7067187, 1.406375, 1, 0, 0.4313726, 1,
1.481402, -0.05293017, 2.110087, 1, 0, 0.427451, 1,
1.48588, -1.634099, 3.880098, 1, 0, 0.4196078, 1,
1.506412, 0.5030634, 1.003271, 1, 0, 0.4156863, 1,
1.520312, 0.1478497, -0.5860277, 1, 0, 0.4078431, 1,
1.525522, -1.283786, 3.118968, 1, 0, 0.4039216, 1,
1.530767, 1.880213, -1.073354, 1, 0, 0.3960784, 1,
1.531002, 0.749167, 2.992667, 1, 0, 0.3882353, 1,
1.541891, -0.4908405, 2.987679, 1, 0, 0.3843137, 1,
1.543389, -1.064929, 3.047809, 1, 0, 0.3764706, 1,
1.547165, 1.641283, -0.5106911, 1, 0, 0.372549, 1,
1.550561, 0.8032653, 1.12929, 1, 0, 0.3647059, 1,
1.552586, 0.05462987, 2.162258, 1, 0, 0.3607843, 1,
1.582596, 1.051825, 2.001543, 1, 0, 0.3529412, 1,
1.590659, -0.4076993, 0.5928546, 1, 0, 0.3490196, 1,
1.595966, -0.9130226, 1.79783, 1, 0, 0.3411765, 1,
1.618982, -0.06647445, 0.2880854, 1, 0, 0.3372549, 1,
1.62736, 0.6411097, 1.286748, 1, 0, 0.3294118, 1,
1.642585, 0.2323602, 2.40249, 1, 0, 0.3254902, 1,
1.645214, -0.501452, 2.328207, 1, 0, 0.3176471, 1,
1.658578, -0.1707418, 2.551799, 1, 0, 0.3137255, 1,
1.667277, 1.647312, 0.1103576, 1, 0, 0.3058824, 1,
1.674468, 0.8203626, 1.707453, 1, 0, 0.2980392, 1,
1.682002, -1.364341, 3.216031, 1, 0, 0.2941177, 1,
1.687974, 0.8357071, 1.777014, 1, 0, 0.2862745, 1,
1.692392, -0.9708961, 1.65586, 1, 0, 0.282353, 1,
1.695089, -0.5702708, 1.737963, 1, 0, 0.2745098, 1,
1.699395, 0.1143971, 1.480384, 1, 0, 0.2705882, 1,
1.701136, -0.4640295, 1.976069, 1, 0, 0.2627451, 1,
1.706258, 1.132114, 0.7232504, 1, 0, 0.2588235, 1,
1.714163, -0.7059824, 1.223836, 1, 0, 0.2509804, 1,
1.729404, -1.179489, 2.179344, 1, 0, 0.2470588, 1,
1.733953, 1.196812, 0.5964389, 1, 0, 0.2392157, 1,
1.743546, -0.3059952, 1.415914, 1, 0, 0.2352941, 1,
1.780127, 0.0623368, 1.297619, 1, 0, 0.227451, 1,
1.793881, 0.6206616, -0.6828648, 1, 0, 0.2235294, 1,
1.813744, -0.6966477, 2.711491, 1, 0, 0.2156863, 1,
1.842372, -0.2046231, 3.356572, 1, 0, 0.2117647, 1,
1.856353, -0.8322527, 2.109439, 1, 0, 0.2039216, 1,
1.870777, 0.2681526, 2.315611, 1, 0, 0.1960784, 1,
1.884955, -0.7859868, 0.8957224, 1, 0, 0.1921569, 1,
1.893403, 0.5092211, 1.033816, 1, 0, 0.1843137, 1,
1.90996, -0.8689285, 2.444157, 1, 0, 0.1803922, 1,
1.919413, 2.393247, -0.3932296, 1, 0, 0.172549, 1,
1.965179, 0.1659845, 2.53296, 1, 0, 0.1686275, 1,
1.978495, 0.04878512, 2.871759, 1, 0, 0.1607843, 1,
1.980216, -0.3890891, 3.821524, 1, 0, 0.1568628, 1,
1.985896, -0.4621445, 1.752069, 1, 0, 0.1490196, 1,
1.992148, 0.1597459, 1.396618, 1, 0, 0.145098, 1,
1.993105, -0.6791602, 2.414654, 1, 0, 0.1372549, 1,
1.998175, 0.8339469, 1.457385, 1, 0, 0.1333333, 1,
2.007775, 0.3957849, 1.402265, 1, 0, 0.1254902, 1,
2.045492, -0.2429958, 1.594948, 1, 0, 0.1215686, 1,
2.04592, 1.08565, 0.8271255, 1, 0, 0.1137255, 1,
2.069181, -0.6836479, 1.871909, 1, 0, 0.1098039, 1,
2.094571, -1.564626, 3.552257, 1, 0, 0.1019608, 1,
2.117068, 0.6123129, 1.005504, 1, 0, 0.09411765, 1,
2.123287, -0.8778576, 1.963408, 1, 0, 0.09019608, 1,
2.170681, -0.2397617, 0.8151997, 1, 0, 0.08235294, 1,
2.248872, -1.867725, 4.051586, 1, 0, 0.07843138, 1,
2.284897, -1.821826, 4.654025, 1, 0, 0.07058824, 1,
2.295889, 0.01293191, 2.005902, 1, 0, 0.06666667, 1,
2.368243, -0.4908395, 0.1885325, 1, 0, 0.05882353, 1,
2.388932, -0.8971308, 2.942212, 1, 0, 0.05490196, 1,
2.446658, 0.02041182, 2.683131, 1, 0, 0.04705882, 1,
2.474212, 1.185846, 1.709196, 1, 0, 0.04313726, 1,
2.484872, -0.7088197, 1.251258, 1, 0, 0.03529412, 1,
2.562344, -0.4147539, 2.325107, 1, 0, 0.03137255, 1,
2.635846, -0.7725058, 3.865628, 1, 0, 0.02352941, 1,
2.68121, 1.11605, 1.726219, 1, 0, 0.01960784, 1,
2.709443, -1.354239, 0.3778708, 1, 0, 0.01176471, 1,
2.770094, -0.8378647, 3.684052, 1, 0, 0.007843138, 1
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
-0.129635, -4.942356, -6.601307, 0, -0.5, 0.5, 0.5,
-0.129635, -4.942356, -6.601307, 1, -0.5, 0.5, 0.5,
-0.129635, -4.942356, -6.601307, 1, 1.5, 0.5, 0.5,
-0.129635, -4.942356, -6.601307, 0, 1.5, 0.5, 0.5
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
-4.012372, -0.3349149, -6.601307, 0, -0.5, 0.5, 0.5,
-4.012372, -0.3349149, -6.601307, 1, -0.5, 0.5, 0.5,
-4.012372, -0.3349149, -6.601307, 1, 1.5, 0.5, 0.5,
-4.012372, -0.3349149, -6.601307, 0, 1.5, 0.5, 0.5
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
-4.012372, -4.942356, 0.3608406, 0, -0.5, 0.5, 0.5,
-4.012372, -4.942356, 0.3608406, 1, -0.5, 0.5, 0.5,
-4.012372, -4.942356, 0.3608406, 1, 1.5, 0.5, 0.5,
-4.012372, -4.942356, 0.3608406, 0, 1.5, 0.5, 0.5
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
-3, -3.8791, -4.994658,
2, -3.8791, -4.994658,
-3, -3.8791, -4.994658,
-3, -4.05631, -5.262433,
-2, -3.8791, -4.994658,
-2, -4.05631, -5.262433,
-1, -3.8791, -4.994658,
-1, -4.05631, -5.262433,
0, -3.8791, -4.994658,
0, -4.05631, -5.262433,
1, -3.8791, -4.994658,
1, -4.05631, -5.262433,
2, -3.8791, -4.994658,
2, -4.05631, -5.262433
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
-3, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
-3, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
-3, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
-3, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5,
-2, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
-2, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
-2, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
-2, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5,
-1, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
-1, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
-1, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
-1, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5,
0, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
0, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
0, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
0, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5,
1, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
1, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
1, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
1, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5,
2, -4.410728, -5.797982, 0, -0.5, 0.5, 0.5,
2, -4.410728, -5.797982, 1, -0.5, 0.5, 0.5,
2, -4.410728, -5.797982, 1, 1.5, 0.5, 0.5,
2, -4.410728, -5.797982, 0, 1.5, 0.5, 0.5
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
-3.116356, -3, -4.994658,
-3.116356, 3, -4.994658,
-3.116356, -3, -4.994658,
-3.265692, -3, -5.262433,
-3.116356, -2, -4.994658,
-3.265692, -2, -5.262433,
-3.116356, -1, -4.994658,
-3.265692, -1, -5.262433,
-3.116356, 0, -4.994658,
-3.265692, 0, -5.262433,
-3.116356, 1, -4.994658,
-3.265692, 1, -5.262433,
-3.116356, 2, -4.994658,
-3.265692, 2, -5.262433,
-3.116356, 3, -4.994658,
-3.265692, 3, -5.262433
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
-3.564364, -3, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, -3, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, -3, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, -3, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, -2, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, -2, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, -2, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, -2, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, -1, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, -1, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, -1, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, -1, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, 0, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, 0, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, 0, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, 0, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, 1, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, 1, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, 1, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, 1, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, 2, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, 2, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, 2, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, 2, -5.797982, 0, 1.5, 0.5, 0.5,
-3.564364, 3, -5.797982, 0, -0.5, 0.5, 0.5,
-3.564364, 3, -5.797982, 1, -0.5, 0.5, 0.5,
-3.564364, 3, -5.797982, 1, 1.5, 0.5, 0.5,
-3.564364, 3, -5.797982, 0, 1.5, 0.5, 0.5
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
-3.116356, -3.8791, -4,
-3.116356, -3.8791, 4,
-3.116356, -3.8791, -4,
-3.265692, -4.05631, -4,
-3.116356, -3.8791, -2,
-3.265692, -4.05631, -2,
-3.116356, -3.8791, 0,
-3.265692, -4.05631, 0,
-3.116356, -3.8791, 2,
-3.265692, -4.05631, 2,
-3.116356, -3.8791, 4,
-3.265692, -4.05631, 4
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
-3.564364, -4.410728, -4, 0, -0.5, 0.5, 0.5,
-3.564364, -4.410728, -4, 1, -0.5, 0.5, 0.5,
-3.564364, -4.410728, -4, 1, 1.5, 0.5, 0.5,
-3.564364, -4.410728, -4, 0, 1.5, 0.5, 0.5,
-3.564364, -4.410728, -2, 0, -0.5, 0.5, 0.5,
-3.564364, -4.410728, -2, 1, -0.5, 0.5, 0.5,
-3.564364, -4.410728, -2, 1, 1.5, 0.5, 0.5,
-3.564364, -4.410728, -2, 0, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 0, 0, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 0, 1, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 0, 1, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 0, 0, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 2, 0, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 2, 1, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 2, 1, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 2, 0, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 4, 0, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 4, 1, -0.5, 0.5, 0.5,
-3.564364, -4.410728, 4, 1, 1.5, 0.5, 0.5,
-3.564364, -4.410728, 4, 0, 1.5, 0.5, 0.5
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
-3.116356, -3.8791, -4.994658,
-3.116356, 3.20927, -4.994658,
-3.116356, -3.8791, 5.716339,
-3.116356, 3.20927, 5.716339,
-3.116356, -3.8791, -4.994658,
-3.116356, -3.8791, 5.716339,
-3.116356, 3.20927, -4.994658,
-3.116356, 3.20927, 5.716339,
-3.116356, -3.8791, -4.994658,
2.857086, -3.8791, -4.994658,
-3.116356, -3.8791, 5.716339,
2.857086, -3.8791, 5.716339,
-3.116356, 3.20927, -4.994658,
2.857086, 3.20927, -4.994658,
-3.116356, 3.20927, 5.716339,
2.857086, 3.20927, 5.716339,
2.857086, -3.8791, -4.994658,
2.857086, 3.20927, -4.994658,
2.857086, -3.8791, 5.716339,
2.857086, 3.20927, 5.716339,
2.857086, -3.8791, -4.994658,
2.857086, -3.8791, 5.716339,
2.857086, 3.20927, -4.994658,
2.857086, 3.20927, 5.716339
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
var radius = 7.563933;
var distance = 33.65279;
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
mvMatrix.translate( 0.129635, 0.3349149, -0.3608406 );
mvMatrix.scale( 1.369106, 1.153759, 0.7635399 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.65279);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
cyhalofop-butyl<-read.table("cyhalofop-butyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyhalofop-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
y<-cyhalofop-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
```

```r
z<-cyhalofop-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyhalofop' not found
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
-3.029364, -0.5712451, -2.959052, 0, 0, 1, 1, 1,
-2.935289, -0.2361763, -2.786079, 1, 0, 0, 1, 1,
-2.712174, 0.4593761, -0.5288072, 1, 0, 0, 1, 1,
-2.709389, -0.2867387, 0.5908822, 1, 0, 0, 1, 1,
-2.690839, -1.236824, -1.830118, 1, 0, 0, 1, 1,
-2.556444, 1.628183, 1.068805, 1, 0, 0, 1, 1,
-2.468442, -2.403136, -3.93251, 0, 0, 0, 1, 1,
-2.458774, -1.574539, -2.106522, 0, 0, 0, 1, 1,
-2.425071, -0.8064607, -3.013375, 0, 0, 0, 1, 1,
-2.377333, 2.388385, -1.083526, 0, 0, 0, 1, 1,
-2.361278, 0.7481723, -0.7299491, 0, 0, 0, 1, 1,
-2.310107, -0.1324893, -1.441737, 0, 0, 0, 1, 1,
-2.295016, -0.2829405, -3.301344, 0, 0, 0, 1, 1,
-2.183652, 1.400384, -0.787654, 1, 1, 1, 1, 1,
-2.179445, 0.1158019, 1.055791, 1, 1, 1, 1, 1,
-2.157135, 2.396652, -1.207664, 1, 1, 1, 1, 1,
-2.137652, -0.6007636, -1.342149, 1, 1, 1, 1, 1,
-2.117138, -1.22491, -2.142879, 1, 1, 1, 1, 1,
-2.108468, 0.8066246, -1.322605, 1, 1, 1, 1, 1,
-2.107863, -0.8600798, -1.906847, 1, 1, 1, 1, 1,
-2.105618, -0.4343334, -2.363905, 1, 1, 1, 1, 1,
-2.10357, 0.6379741, -1.138522, 1, 1, 1, 1, 1,
-2.085443, -0.1520119, -1.972915, 1, 1, 1, 1, 1,
-2.080538, -0.5380773, -0.5158291, 1, 1, 1, 1, 1,
-2.069941, -0.2924097, -1.197253, 1, 1, 1, 1, 1,
-2.039601, 1.268067, -2.602168, 1, 1, 1, 1, 1,
-2.017617, -0.4767454, -2.711719, 1, 1, 1, 1, 1,
-2.014991, 1.334766, -1.268785, 1, 1, 1, 1, 1,
-1.999722, -1.492217, -2.243634, 0, 0, 1, 1, 1,
-1.947396, -0.9502595, -2.032352, 1, 0, 0, 1, 1,
-1.937731, -3.475898, -3.913015, 1, 0, 0, 1, 1,
-1.936555, -0.08386172, -1.744888, 1, 0, 0, 1, 1,
-1.929373, -1.110566, -3.181661, 1, 0, 0, 1, 1,
-1.922004, 0.7582245, -0.414889, 1, 0, 0, 1, 1,
-1.891418, -2.586692, -1.032342, 0, 0, 0, 1, 1,
-1.8719, 1.038523, -0.594709, 0, 0, 0, 1, 1,
-1.864275, 1.808904, -0.7156125, 0, 0, 0, 1, 1,
-1.852706, 0.8524483, 0.6567513, 0, 0, 0, 1, 1,
-1.841547, 0.1199703, -3.424878, 0, 0, 0, 1, 1,
-1.786386, 0.4566725, -0.02778245, 0, 0, 0, 1, 1,
-1.769747, -0.1792128, -1.645627, 0, 0, 0, 1, 1,
-1.756032, -0.6557141, -1.439103, 1, 1, 1, 1, 1,
-1.751949, -0.6559999, -2.838544, 1, 1, 1, 1, 1,
-1.751706, -0.765903, -2.28997, 1, 1, 1, 1, 1,
-1.748667, -0.08359948, -0.6406683, 1, 1, 1, 1, 1,
-1.735858, -0.7384903, -3.179031, 1, 1, 1, 1, 1,
-1.694647, 0.844152, -2.04196, 1, 1, 1, 1, 1,
-1.688723, 0.8629285, -0.589917, 1, 1, 1, 1, 1,
-1.672523, -1.317648, -2.045223, 1, 1, 1, 1, 1,
-1.66653, 1.370347, 0.1454828, 1, 1, 1, 1, 1,
-1.663603, 0.09009451, -0.5890123, 1, 1, 1, 1, 1,
-1.641583, 0.1463865, -2.348512, 1, 1, 1, 1, 1,
-1.633305, 2.566096, -0.1648649, 1, 1, 1, 1, 1,
-1.606553, 0.5953876, -1.510866, 1, 1, 1, 1, 1,
-1.605789, -0.201663, -0.9161078, 1, 1, 1, 1, 1,
-1.602414, -0.3496386, -0.2631622, 1, 1, 1, 1, 1,
-1.600712, 0.757446, -2.172361, 0, 0, 1, 1, 1,
-1.593864, 1.234599, -0.579417, 1, 0, 0, 1, 1,
-1.593752, -0.695577, -1.292105, 1, 0, 0, 1, 1,
-1.590632, -0.4429663, -1.161143, 1, 0, 0, 1, 1,
-1.589032, 0.3012325, -1.033343, 1, 0, 0, 1, 1,
-1.587105, 0.7972876, -1.177826, 1, 0, 0, 1, 1,
-1.585928, -1.201284, -1.828577, 0, 0, 0, 1, 1,
-1.584391, 0.4404189, -1.948211, 0, 0, 0, 1, 1,
-1.581895, -0.6004587, -2.51399, 0, 0, 0, 1, 1,
-1.57887, 1.033552, -1.60608, 0, 0, 0, 1, 1,
-1.573178, 0.4597369, -0.1530661, 0, 0, 0, 1, 1,
-1.56852, 0.3441485, -1.369633, 0, 0, 0, 1, 1,
-1.557662, 1.191933, 0.4709207, 0, 0, 0, 1, 1,
-1.556605, 0.5740202, -1.774826, 1, 1, 1, 1, 1,
-1.549217, 1.06987, -0.9396934, 1, 1, 1, 1, 1,
-1.543146, -0.7008508, -1.562411, 1, 1, 1, 1, 1,
-1.54162, -0.05799592, -1.951362, 1, 1, 1, 1, 1,
-1.501279, -1.078392, -1.701836, 1, 1, 1, 1, 1,
-1.492748, -0.3385049, -2.603098, 1, 1, 1, 1, 1,
-1.467771, 0.2442029, -1.106774, 1, 1, 1, 1, 1,
-1.467654, -0.5595971, -2.286161, 1, 1, 1, 1, 1,
-1.456579, 0.9876634, -0.8928908, 1, 1, 1, 1, 1,
-1.455967, -0.6334603, -1.474128, 1, 1, 1, 1, 1,
-1.452769, 0.744179, 0.169468, 1, 1, 1, 1, 1,
-1.44945, 0.8137043, -0.1107117, 1, 1, 1, 1, 1,
-1.446503, 0.9750236, -0.2575256, 1, 1, 1, 1, 1,
-1.432615, 0.815785, 0.4754212, 1, 1, 1, 1, 1,
-1.424644, -0.6024778, -2.624675, 1, 1, 1, 1, 1,
-1.398173, -1.108175, -1.880027, 0, 0, 1, 1, 1,
-1.380699, -1.455171, -2.794193, 1, 0, 0, 1, 1,
-1.368666, -0.1055429, -1.9213, 1, 0, 0, 1, 1,
-1.363053, 0.6160364, -0.1151152, 1, 0, 0, 1, 1,
-1.348608, -1.418693, -0.8036258, 1, 0, 0, 1, 1,
-1.343307, -0.03393505, -3.446942, 1, 0, 0, 1, 1,
-1.341103, -0.1749325, 0.6414521, 0, 0, 0, 1, 1,
-1.339944, -0.09967174, -2.515049, 0, 0, 0, 1, 1,
-1.330415, -0.526975, -0.554906, 0, 0, 0, 1, 1,
-1.328542, -0.2909196, -0.9168249, 0, 0, 0, 1, 1,
-1.327666, -0.8007861, -3.213632, 0, 0, 0, 1, 1,
-1.322267, 1.004037, 0.453181, 0, 0, 0, 1, 1,
-1.32182, 0.131048, -1.084532, 0, 0, 0, 1, 1,
-1.318081, -0.7454755, -1.882068, 1, 1, 1, 1, 1,
-1.316225, 1.887556, -0.665676, 1, 1, 1, 1, 1,
-1.304431, 0.01063963, -1.405841, 1, 1, 1, 1, 1,
-1.282724, -1.119371, -1.143384, 1, 1, 1, 1, 1,
-1.28137, -0.3076431, -0.6796359, 1, 1, 1, 1, 1,
-1.271003, -1.249163, -1.36395, 1, 1, 1, 1, 1,
-1.264545, 0.8090174, -0.1634994, 1, 1, 1, 1, 1,
-1.251238, 0.9254377, -0.1396207, 1, 1, 1, 1, 1,
-1.249746, -0.3490221, -2.008774, 1, 1, 1, 1, 1,
-1.249379, 0.13133, -0.9097835, 1, 1, 1, 1, 1,
-1.236121, 0.5467822, -0.4934126, 1, 1, 1, 1, 1,
-1.230055, 0.508235, -3.606202, 1, 1, 1, 1, 1,
-1.229162, -0.3161731, -1.172033, 1, 1, 1, 1, 1,
-1.223304, -0.726451, -1.026929, 1, 1, 1, 1, 1,
-1.217444, -1.229149, -3.572501, 1, 1, 1, 1, 1,
-1.214612, 2.050513, -0.9811855, 0, 0, 1, 1, 1,
-1.214383, -0.4500153, -2.291545, 1, 0, 0, 1, 1,
-1.20365, -1.281194, -3.67658, 1, 0, 0, 1, 1,
-1.202444, -0.8846271, -2.797001, 1, 0, 0, 1, 1,
-1.200679, 0.6832059, 1.619402, 1, 0, 0, 1, 1,
-1.192353, -0.7631032, -3.701784, 1, 0, 0, 1, 1,
-1.189179, 0.6872705, -1.760178, 0, 0, 0, 1, 1,
-1.188018, 1.622681, -0.6463779, 0, 0, 0, 1, 1,
-1.186435, -2.45567, -2.870438, 0, 0, 0, 1, 1,
-1.185722, 2.883572, -0.7589168, 0, 0, 0, 1, 1,
-1.184357, 0.523609, 1.446243, 0, 0, 0, 1, 1,
-1.180254, -0.9691859, -3.318328, 0, 0, 0, 1, 1,
-1.175782, 0.7437769, -1.114528, 0, 0, 0, 1, 1,
-1.175373, 0.6285955, -2.285657, 1, 1, 1, 1, 1,
-1.173648, 1.589138, -0.4257755, 1, 1, 1, 1, 1,
-1.168258, -0.06284379, -0.9357602, 1, 1, 1, 1, 1,
-1.165389, 1.294926, 0.3908903, 1, 1, 1, 1, 1,
-1.164982, -0.5242013, -1.438979, 1, 1, 1, 1, 1,
-1.157932, -0.02997979, -3.038932, 1, 1, 1, 1, 1,
-1.150919, -0.7341001, -1.850068, 1, 1, 1, 1, 1,
-1.136189, 0.7233385, -2.098326, 1, 1, 1, 1, 1,
-1.135215, -1.366747, -1.457881, 1, 1, 1, 1, 1,
-1.130807, -0.9443636, -2.507691, 1, 1, 1, 1, 1,
-1.126992, 0.1211142, -1.323276, 1, 1, 1, 1, 1,
-1.116654, -0.842154, -1.76892, 1, 1, 1, 1, 1,
-1.114591, 1.057778, -1.284979, 1, 1, 1, 1, 1,
-1.10791, 1.019419, -0.5753673, 1, 1, 1, 1, 1,
-1.102829, 0.125632, -1.379483, 1, 1, 1, 1, 1,
-1.102751, -0.1751707, -2.230292, 0, 0, 1, 1, 1,
-1.088833, 0.7150406, 0.6820859, 1, 0, 0, 1, 1,
-1.087985, -1.50588, -1.115028, 1, 0, 0, 1, 1,
-1.082338, 0.4383074, -0.9256592, 1, 0, 0, 1, 1,
-1.076337, 2.274997, -2.057638, 1, 0, 0, 1, 1,
-1.072431, -0.7080242, -2.959349, 1, 0, 0, 1, 1,
-1.069505, -0.7448226, -2.215707, 0, 0, 0, 1, 1,
-1.063137, 1.146867, 0.4059477, 0, 0, 0, 1, 1,
-1.060857, 0.8271774, 0.005167628, 0, 0, 0, 1, 1,
-1.058772, -1.342966, -1.784281, 0, 0, 0, 1, 1,
-1.051674, -1.574168, -3.421931, 0, 0, 0, 1, 1,
-1.050695, -0.2501855, -0.9576277, 0, 0, 0, 1, 1,
-1.04888, -0.2350185, -0.4693571, 0, 0, 0, 1, 1,
-1.043298, -0.8607834, -1.018701, 1, 1, 1, 1, 1,
-1.038714, 0.2852101, -2.557266, 1, 1, 1, 1, 1,
-1.035874, 1.42857, -1.34313, 1, 1, 1, 1, 1,
-1.035677, 0.1374929, -1.986712, 1, 1, 1, 1, 1,
-1.03533, -1.561081, -4.039721, 1, 1, 1, 1, 1,
-1.03454, -0.606172, -1.714296, 1, 1, 1, 1, 1,
-1.025859, -1.192232, -1.865562, 1, 1, 1, 1, 1,
-1.023, -1.479706, -2.175336, 1, 1, 1, 1, 1,
-1.018084, -0.460718, -1.716131, 1, 1, 1, 1, 1,
-1.017208, -0.03862713, -2.928796, 1, 1, 1, 1, 1,
-1.01588, -1.283718, -2.093364, 1, 1, 1, 1, 1,
-1.011331, -1.476765, -0.8331726, 1, 1, 1, 1, 1,
-1.009266, -0.5744679, -2.589914, 1, 1, 1, 1, 1,
-1.008641, 0.07901966, -0.7699673, 1, 1, 1, 1, 1,
-1.007991, -1.427224, -3.586842, 1, 1, 1, 1, 1,
-1.007682, -0.3582068, -1.143502, 0, 0, 1, 1, 1,
-1.006707, 0.6014968, -0.522759, 1, 0, 0, 1, 1,
-0.9984373, 1.039691, -1.001119, 1, 0, 0, 1, 1,
-0.9979838, 1.499537, -1.131135, 1, 0, 0, 1, 1,
-0.9940715, 3.106042, -1.427764, 1, 0, 0, 1, 1,
-0.993239, 0.05119964, -0.6616402, 1, 0, 0, 1, 1,
-0.9889303, 1.000983, -2.14331, 0, 0, 0, 1, 1,
-0.9812071, -0.06842878, -2.211005, 0, 0, 0, 1, 1,
-0.9722054, -0.1010205, -1.727717, 0, 0, 0, 1, 1,
-0.9713634, 1.843405, -1.102919, 0, 0, 0, 1, 1,
-0.9697699, 0.9064899, -1.60255, 0, 0, 0, 1, 1,
-0.9674318, -0.7813022, -1.100289, 0, 0, 0, 1, 1,
-0.9650295, 0.2964815, -1.264285, 0, 0, 0, 1, 1,
-0.958914, 0.5407637, -2.732008, 1, 1, 1, 1, 1,
-0.947766, 0.2726178, -0.07175414, 1, 1, 1, 1, 1,
-0.9473837, -0.9845968, -1.892745, 1, 1, 1, 1, 1,
-0.9429661, 1.590767, -1.798269, 1, 1, 1, 1, 1,
-0.9428399, -0.3026491, -2.324647, 1, 1, 1, 1, 1,
-0.9404796, -1.078976, -2.473059, 1, 1, 1, 1, 1,
-0.9400157, -0.368692, -0.9110497, 1, 1, 1, 1, 1,
-0.9368871, 0.0486043, -2.224202, 1, 1, 1, 1, 1,
-0.9363015, -0.858516, -2.097586, 1, 1, 1, 1, 1,
-0.933724, -1.882005, -3.349394, 1, 1, 1, 1, 1,
-0.9275351, -0.7414351, -3.189306, 1, 1, 1, 1, 1,
-0.9260014, -1.328058, -2.457634, 1, 1, 1, 1, 1,
-0.9201521, 2.418516, 0.3968385, 1, 1, 1, 1, 1,
-0.9153178, 1.525225, 0.202673, 1, 1, 1, 1, 1,
-0.9137156, 1.616961, -0.1168463, 1, 1, 1, 1, 1,
-0.9129713, -0.01750969, 0.4894765, 0, 0, 1, 1, 1,
-0.9113432, -2.290103, -1.368574, 1, 0, 0, 1, 1,
-0.9090825, 0.336634, -1.470695, 1, 0, 0, 1, 1,
-0.9068317, 1.16203, 1.141483, 1, 0, 0, 1, 1,
-0.9056625, 1.091702, -1.997131, 1, 0, 0, 1, 1,
-0.9054631, -1.450294, -1.595173, 1, 0, 0, 1, 1,
-0.9042857, -1.090606, -0.8637, 0, 0, 0, 1, 1,
-0.8974645, -2.318977, -1.328069, 0, 0, 0, 1, 1,
-0.8970903, 0.3172254, -1.849216, 0, 0, 0, 1, 1,
-0.895459, 0.3185308, -0.8610945, 0, 0, 0, 1, 1,
-0.8923353, -0.4918327, -2.143428, 0, 0, 0, 1, 1,
-0.8902248, 0.7549592, 0.4085567, 0, 0, 0, 1, 1,
-0.8852339, 0.6719502, -0.3792495, 0, 0, 0, 1, 1,
-0.8815221, 0.2192652, -1.233746, 1, 1, 1, 1, 1,
-0.8596081, -0.021223, -0.922543, 1, 1, 1, 1, 1,
-0.8583373, -1.336557, -1.055323, 1, 1, 1, 1, 1,
-0.8574395, 2.313099, -0.1593455, 1, 1, 1, 1, 1,
-0.8518441, -1.778814, -1.135204, 1, 1, 1, 1, 1,
-0.843402, 0.6635291, 0.728581, 1, 1, 1, 1, 1,
-0.8397106, -0.3947529, -3.105856, 1, 1, 1, 1, 1,
-0.8369516, -0.2882828, -1.782655, 1, 1, 1, 1, 1,
-0.8342906, 0.1739544, -1.774784, 1, 1, 1, 1, 1,
-0.8335761, -0.6157882, -4.112094, 1, 1, 1, 1, 1,
-0.8223519, -2.14606, -1.832854, 1, 1, 1, 1, 1,
-0.8217124, 0.1215409, -1.069775, 1, 1, 1, 1, 1,
-0.8196216, 0.02528, -1.392237, 1, 1, 1, 1, 1,
-0.8184509, 1.202781, 0.1213368, 1, 1, 1, 1, 1,
-0.8169757, -1.31539, -3.240046, 1, 1, 1, 1, 1,
-0.8137577, -0.336594, -0.9855541, 0, 0, 1, 1, 1,
-0.8131173, -0.8244911, -1.075141, 1, 0, 0, 1, 1,
-0.8130697, 0.05671137, -3.464984, 1, 0, 0, 1, 1,
-0.8109557, -0.8036867, -1.719018, 1, 0, 0, 1, 1,
-0.8076258, -1.392351, -1.090112, 1, 0, 0, 1, 1,
-0.8075825, -1.741972, -2.027459, 1, 0, 0, 1, 1,
-0.8043863, 1.581453, 0.8894145, 0, 0, 0, 1, 1,
-0.8033259, -1.532717, -1.730772, 0, 0, 0, 1, 1,
-0.7965749, 1.873336, 0.07577556, 0, 0, 0, 1, 1,
-0.7954088, -0.9138042, -1.692638, 0, 0, 0, 1, 1,
-0.7927159, -2.044746, -3.794706, 0, 0, 0, 1, 1,
-0.7853887, -0.4191488, -0.5185488, 0, 0, 0, 1, 1,
-0.7799402, 0.4297337, -1.797673, 0, 0, 0, 1, 1,
-0.7758962, 0.9820964, -0.1370774, 1, 1, 1, 1, 1,
-0.7701178, -1.055687, -2.528729, 1, 1, 1, 1, 1,
-0.7666295, 1.131379, -0.9094836, 1, 1, 1, 1, 1,
-0.7608412, -3.117476, -3.785497, 1, 1, 1, 1, 1,
-0.7574604, -0.1718488, -1.603781, 1, 1, 1, 1, 1,
-0.7460047, -0.9812034, -2.910401, 1, 1, 1, 1, 1,
-0.7456283, 0.2602031, -1.757426, 1, 1, 1, 1, 1,
-0.7442331, -0.3296883, -2.886459, 1, 1, 1, 1, 1,
-0.739811, 0.4428641, -1.2843, 1, 1, 1, 1, 1,
-0.7342842, 0.3844814, 0.2048529, 1, 1, 1, 1, 1,
-0.7306648, 0.6001409, -2.165115, 1, 1, 1, 1, 1,
-0.7241942, -1.532575, -2.154651, 1, 1, 1, 1, 1,
-0.7198139, 0.3827955, 0.02482689, 1, 1, 1, 1, 1,
-0.7192425, -0.7707266, -2.031763, 1, 1, 1, 1, 1,
-0.7155303, -0.06844113, -1.869098, 1, 1, 1, 1, 1,
-0.7125461, 0.1697914, -0.09589429, 0, 0, 1, 1, 1,
-0.7056928, 0.1777656, -3.077945, 1, 0, 0, 1, 1,
-0.7012609, 1.794231, -0.8204582, 1, 0, 0, 1, 1,
-0.6998292, -1.181755, -2.229113, 1, 0, 0, 1, 1,
-0.6969597, 1.173976, -1.80219, 1, 0, 0, 1, 1,
-0.6938925, -0.2478794, -2.03272, 1, 0, 0, 1, 1,
-0.6930661, 0.7298194, -1.521936, 0, 0, 0, 1, 1,
-0.6930192, -0.5093006, -1.542959, 0, 0, 0, 1, 1,
-0.6821486, -0.1150026, -1.839457, 0, 0, 0, 1, 1,
-0.6811052, -0.5773688, -3.228698, 0, 0, 0, 1, 1,
-0.6775964, -1.225679, -2.172907, 0, 0, 0, 1, 1,
-0.6750147, -1.258064, -3.293846, 0, 0, 0, 1, 1,
-0.6724368, -0.2105232, -0.9377716, 0, 0, 0, 1, 1,
-0.6666086, 1.133916, -0.7345648, 1, 1, 1, 1, 1,
-0.6655597, 0.3734938, -1.913732, 1, 1, 1, 1, 1,
-0.6642655, -0.8210493, -3.559662, 1, 1, 1, 1, 1,
-0.662519, 0.6417815, 0.6289623, 1, 1, 1, 1, 1,
-0.6612942, 0.2540246, -0.1488884, 1, 1, 1, 1, 1,
-0.6608202, 0.7310843, 1.698606, 1, 1, 1, 1, 1,
-0.659322, -0.06087141, -0.1918511, 1, 1, 1, 1, 1,
-0.6591773, 1.342311, -2.696221, 1, 1, 1, 1, 1,
-0.6559358, -1.292203, -2.301727, 1, 1, 1, 1, 1,
-0.6515687, -0.3923973, -1.142444, 1, 1, 1, 1, 1,
-0.647609, -1.286643, -2.617115, 1, 1, 1, 1, 1,
-0.6471077, -1.541064, -2.522734, 1, 1, 1, 1, 1,
-0.6442835, 1.457046, 0.320808, 1, 1, 1, 1, 1,
-0.6425633, 0.8625867, -0.9261436, 1, 1, 1, 1, 1,
-0.6419162, -1.042995, -2.181055, 1, 1, 1, 1, 1,
-0.6416869, 1.944772, 0.7509032, 0, 0, 1, 1, 1,
-0.636849, -0.9711334, -1.788764, 1, 0, 0, 1, 1,
-0.6317403, -1.369551, -1.848766, 1, 0, 0, 1, 1,
-0.6306336, 1.57692, 0.3112525, 1, 0, 0, 1, 1,
-0.6260353, -0.4425999, -4.282046, 1, 0, 0, 1, 1,
-0.6218171, 1.027133, 2.620031, 1, 0, 0, 1, 1,
-0.6207136, 0.6401726, -2.986971, 0, 0, 0, 1, 1,
-0.6193309, -0.1413877, -2.349284, 0, 0, 0, 1, 1,
-0.6182883, 1.23991, -1.079763, 0, 0, 0, 1, 1,
-0.6179695, -1.611507, -2.947205, 0, 0, 0, 1, 1,
-0.6146713, 0.3976404, -0.656868, 0, 0, 0, 1, 1,
-0.6092561, 2.018348, -1.293719, 0, 0, 0, 1, 1,
-0.6047007, 1.294402, -0.01587721, 0, 0, 0, 1, 1,
-0.6041351, -1.241463, -2.286447, 1, 1, 1, 1, 1,
-0.6017802, 0.1943504, -2.004178, 1, 1, 1, 1, 1,
-0.6004238, -1.051995, -2.631318, 1, 1, 1, 1, 1,
-0.600117, -0.6385128, -3.917918, 1, 1, 1, 1, 1,
-0.6000914, 0.7499912, 0.5851498, 1, 1, 1, 1, 1,
-0.5927581, -0.4960305, -1.815161, 1, 1, 1, 1, 1,
-0.5910942, 0.7174612, -0.7558721, 1, 1, 1, 1, 1,
-0.5837477, -0.109222, -1.247123, 1, 1, 1, 1, 1,
-0.582475, 0.5259004, -2.596291, 1, 1, 1, 1, 1,
-0.5771924, 1.584094, -0.4608372, 1, 1, 1, 1, 1,
-0.5710902, -0.06903575, -1.544453, 1, 1, 1, 1, 1,
-0.5702164, -0.5213551, -2.699002, 1, 1, 1, 1, 1,
-0.5685647, -0.1751173, -1.753816, 1, 1, 1, 1, 1,
-0.5678586, -0.7456151, -2.819667, 1, 1, 1, 1, 1,
-0.5676833, 1.172053, -1.172248, 1, 1, 1, 1, 1,
-0.5676333, -1.506375, -4.322976, 0, 0, 1, 1, 1,
-0.566859, -0.08437295, -1.915352, 1, 0, 0, 1, 1,
-0.5621468, -0.2892587, -1.538913, 1, 0, 0, 1, 1,
-0.5611043, 0.414608, -0.4032024, 1, 0, 0, 1, 1,
-0.5592399, 0.8334287, -2.070746, 1, 0, 0, 1, 1,
-0.5589879, 0.02358897, -1.496003, 1, 0, 0, 1, 1,
-0.5552966, 0.7145386, 0.04120759, 0, 0, 0, 1, 1,
-0.5500234, 1.238926, 1.083864, 0, 0, 0, 1, 1,
-0.5463446, -0.8692235, -2.640765, 0, 0, 0, 1, 1,
-0.5434446, -0.0312238, -3.758749, 0, 0, 0, 1, 1,
-0.537798, -0.3563932, -3.916453, 0, 0, 0, 1, 1,
-0.5374027, -0.1938176, -1.526605, 0, 0, 0, 1, 1,
-0.5329866, -2.318747, -1.770317, 0, 0, 0, 1, 1,
-0.531176, -0.7250308, -2.63375, 1, 1, 1, 1, 1,
-0.5289998, 0.2003882, -2.203292, 1, 1, 1, 1, 1,
-0.524667, -0.7069793, -2.555474, 1, 1, 1, 1, 1,
-0.5244739, -0.86261, -2.750368, 1, 1, 1, 1, 1,
-0.5172694, -1.224149, -4.191385, 1, 1, 1, 1, 1,
-0.5137643, -1.185881, -2.510417, 1, 1, 1, 1, 1,
-0.5090421, -0.4055615, -2.02884, 1, 1, 1, 1, 1,
-0.5079878, 0.6539956, -1.288614, 1, 1, 1, 1, 1,
-0.5065733, -0.8781134, -1.455429, 1, 1, 1, 1, 1,
-0.5060105, -1.749595, -3.868996, 1, 1, 1, 1, 1,
-0.5040787, -0.4523179, -2.526864, 1, 1, 1, 1, 1,
-0.4965831, -0.2078658, -1.087424, 1, 1, 1, 1, 1,
-0.4944181, 0.1005728, 0.02045768, 1, 1, 1, 1, 1,
-0.4830377, -0.5524298, -3.837072, 1, 1, 1, 1, 1,
-0.4830004, -0.9188596, -2.054534, 1, 1, 1, 1, 1,
-0.482351, 0.572355, -0.2586863, 0, 0, 1, 1, 1,
-0.4740001, -1.421214, -2.15799, 1, 0, 0, 1, 1,
-0.4738358, -0.1818306, -2.697758, 1, 0, 0, 1, 1,
-0.467735, 1.753058, -0.5804926, 1, 0, 0, 1, 1,
-0.4609964, 0.9986899, 1.443295, 1, 0, 0, 1, 1,
-0.4603001, -0.2954568, 0.5857287, 1, 0, 0, 1, 1,
-0.4584027, 0.7647229, 0.3123059, 0, 0, 0, 1, 1,
-0.4566297, 1.225102, -0.585384, 0, 0, 0, 1, 1,
-0.4544692, 0.04920433, -2.217038, 0, 0, 0, 1, 1,
-0.4464307, 0.1545124, -1.737563, 0, 0, 0, 1, 1,
-0.4449377, 1.206654, -0.9136668, 0, 0, 0, 1, 1,
-0.4416969, -0.04268984, -2.020884, 0, 0, 0, 1, 1,
-0.4337875, 0.3019845, -1.501999, 0, 0, 0, 1, 1,
-0.4329265, -0.5926982, -2.202672, 1, 1, 1, 1, 1,
-0.4308128, 1.054351, -0.8064955, 1, 1, 1, 1, 1,
-0.4169027, 0.8919421, -1.952133, 1, 1, 1, 1, 1,
-0.4012307, -1.710675, -1.291607, 1, 1, 1, 1, 1,
-0.397479, 1.761103, 0.3101359, 1, 1, 1, 1, 1,
-0.3930157, -1.733286, -3.892068, 1, 1, 1, 1, 1,
-0.3896787, -0.01030231, -2.771633, 1, 1, 1, 1, 1,
-0.3888447, -1.449383, -2.632845, 1, 1, 1, 1, 1,
-0.3867897, 0.2156322, -0.7449058, 1, 1, 1, 1, 1,
-0.3861674, 0.4329087, -1.206818, 1, 1, 1, 1, 1,
-0.3837957, -0.8505692, -1.695726, 1, 1, 1, 1, 1,
-0.3811753, 0.08584516, 0.1376061, 1, 1, 1, 1, 1,
-0.3786743, -0.665971, -2.427648, 1, 1, 1, 1, 1,
-0.377089, 0.5303311, 0.5806503, 1, 1, 1, 1, 1,
-0.3764056, 1.211386, -1.977081, 1, 1, 1, 1, 1,
-0.3698985, 0.379586, -0.7794466, 0, 0, 1, 1, 1,
-0.368956, 0.5846605, 0.5032738, 1, 0, 0, 1, 1,
-0.3680497, -0.8883753, -1.73424, 1, 0, 0, 1, 1,
-0.3670076, 0.002644207, 0.2813416, 1, 0, 0, 1, 1,
-0.3640138, 0.632192, -0.880981, 1, 0, 0, 1, 1,
-0.3589154, -0.4025325, -3.106545, 1, 0, 0, 1, 1,
-0.3526801, -1.278974, -3.503324, 0, 0, 0, 1, 1,
-0.3486759, -0.02236024, -1.863034, 0, 0, 0, 1, 1,
-0.3430266, 0.1628753, -2.403028, 0, 0, 0, 1, 1,
-0.3419491, 0.8673233, 1.802033, 0, 0, 0, 1, 1,
-0.3399171, -0.9213935, -3.000784, 0, 0, 0, 1, 1,
-0.3387081, 1.32514, -0.9155302, 0, 0, 0, 1, 1,
-0.3374305, 0.9297875, -0.7451005, 0, 0, 0, 1, 1,
-0.3306019, -1.144901, -2.961151, 1, 1, 1, 1, 1,
-0.3275429, -0.308723, -2.169969, 1, 1, 1, 1, 1,
-0.3275129, -1.051324, -2.062287, 1, 1, 1, 1, 1,
-0.3236706, 0.03622047, -0.6609597, 1, 1, 1, 1, 1,
-0.3235934, -0.1344047, -0.7389424, 1, 1, 1, 1, 1,
-0.3151257, -0.3709786, -2.713628, 1, 1, 1, 1, 1,
-0.3115043, -1.670751, -4.284425, 1, 1, 1, 1, 1,
-0.3096695, 0.3973135, -2.074222, 1, 1, 1, 1, 1,
-0.3082408, 2.90809, -2.271675, 1, 1, 1, 1, 1,
-0.3069686, -0.4582248, -1.248109, 1, 1, 1, 1, 1,
-0.3059771, 0.9080235, -0.3987063, 1, 1, 1, 1, 1,
-0.3055295, -1.538883, -3.803696, 1, 1, 1, 1, 1,
-0.2950993, 0.8038064, 0.2819811, 1, 1, 1, 1, 1,
-0.2950149, -1.003036, -2.722997, 1, 1, 1, 1, 1,
-0.2918929, 0.4251335, 1.014279, 1, 1, 1, 1, 1,
-0.286817, -0.3181448, -2.587628, 0, 0, 1, 1, 1,
-0.2860757, -1.820378, -1.357107, 1, 0, 0, 1, 1,
-0.2852973, -0.05233746, -2.87925, 1, 0, 0, 1, 1,
-0.2798373, -1.297966, -3.797171, 1, 0, 0, 1, 1,
-0.2779948, -0.3995947, -3.638616, 1, 0, 0, 1, 1,
-0.2775037, 0.9334255, -0.8849733, 1, 0, 0, 1, 1,
-0.2752044, -0.2884073, -3.448459, 0, 0, 0, 1, 1,
-0.2702358, 1.008536, -1.923247, 0, 0, 0, 1, 1,
-0.2699856, 0.1821275, -0.2735683, 0, 0, 0, 1, 1,
-0.269053, -0.02139483, -2.582333, 0, 0, 0, 1, 1,
-0.2688144, -1.540153, -3.937294, 0, 0, 0, 1, 1,
-0.26707, 1.837405, 0.4032271, 0, 0, 0, 1, 1,
-0.2627748, -0.7173166, -1.687977, 0, 0, 0, 1, 1,
-0.2624202, -0.01741423, -0.5029854, 1, 1, 1, 1, 1,
-0.26006, 1.5314, -0.5593527, 1, 1, 1, 1, 1,
-0.2566137, 1.093904, -1.196714, 1, 1, 1, 1, 1,
-0.2533267, 0.1278474, -1.240574, 1, 1, 1, 1, 1,
-0.2531573, -0.1391254, -2.854394, 1, 1, 1, 1, 1,
-0.2507211, 0.2552892, 2.1513, 1, 1, 1, 1, 1,
-0.2488995, 2.018904, -0.3727183, 1, 1, 1, 1, 1,
-0.2437601, 0.2746852, -2.078643, 1, 1, 1, 1, 1,
-0.2403752, 0.4051633, 0.3920784, 1, 1, 1, 1, 1,
-0.2375538, -1.108966, -1.411644, 1, 1, 1, 1, 1,
-0.235137, 0.6088433, 0.1629432, 1, 1, 1, 1, 1,
-0.2339461, 0.534228, -1.366077, 1, 1, 1, 1, 1,
-0.2212721, 0.1706501, -2.088549, 1, 1, 1, 1, 1,
-0.2167087, -1.251259, -3.308606, 1, 1, 1, 1, 1,
-0.2145743, 1.721731, 1.708015, 1, 1, 1, 1, 1,
-0.2144245, -1.446073, -4.321985, 0, 0, 1, 1, 1,
-0.2082927, -0.4621719, -2.973065, 1, 0, 0, 1, 1,
-0.2034279, -0.8750886, -2.202944, 1, 0, 0, 1, 1,
-0.2033324, 1.245524, -0.2117827, 1, 0, 0, 1, 1,
-0.1983541, 0.4088345, -0.6434897, 1, 0, 0, 1, 1,
-0.1962128, -1.065857, -4.130231, 1, 0, 0, 1, 1,
-0.1945759, 1.26193, -0.6912674, 0, 0, 0, 1, 1,
-0.1871378, 0.8228812, 0.1623563, 0, 0, 0, 1, 1,
-0.1843691, -1.374648, -4.169988, 0, 0, 0, 1, 1,
-0.1841387, -1.366045, -3.110388, 0, 0, 0, 1, 1,
-0.1840149, 0.6232141, -1.799358, 0, 0, 0, 1, 1,
-0.1826565, -0.9048986, -2.148985, 0, 0, 0, 1, 1,
-0.1820631, -1.458123, -3.535068, 0, 0, 0, 1, 1,
-0.1815218, -0.8418598, -3.775667, 1, 1, 1, 1, 1,
-0.1775874, 0.8295755, -1.958378, 1, 1, 1, 1, 1,
-0.1733036, 0.6987196, 0.5066922, 1, 1, 1, 1, 1,
-0.1662764, 0.4058686, -0.7224216, 1, 1, 1, 1, 1,
-0.1649087, 0.9940925, -0.3563742, 1, 1, 1, 1, 1,
-0.1646093, 1.5363, -0.727688, 1, 1, 1, 1, 1,
-0.162447, -0.350659, -3.841321, 1, 1, 1, 1, 1,
-0.1621413, 0.4192138, -0.3201082, 1, 1, 1, 1, 1,
-0.1568554, -0.5105067, -1.949733, 1, 1, 1, 1, 1,
-0.1564087, -0.5215769, -0.9698945, 1, 1, 1, 1, 1,
-0.1484141, 0.3884217, 0.2712101, 1, 1, 1, 1, 1,
-0.1381389, 1.56, -1.92115, 1, 1, 1, 1, 1,
-0.135981, 1.067326, -0.1068985, 1, 1, 1, 1, 1,
-0.1351697, 2.196333, -0.3989558, 1, 1, 1, 1, 1,
-0.1334773, 0.1528043, -0.2156746, 1, 1, 1, 1, 1,
-0.1325434, -1.479149, -3.828636, 0, 0, 1, 1, 1,
-0.1297199, -1.443843, -3.969722, 1, 0, 0, 1, 1,
-0.1263718, -1.184292, -1.851329, 1, 0, 0, 1, 1,
-0.125364, -1.089457, -2.277521, 1, 0, 0, 1, 1,
-0.1224664, -1.205195, -4.020954, 1, 0, 0, 1, 1,
-0.1214381, -0.5788205, -3.99214, 1, 0, 0, 1, 1,
-0.1183865, 0.2036714, -2.622471, 0, 0, 0, 1, 1,
-0.1149389, 0.2644939, 0.127827, 0, 0, 0, 1, 1,
-0.1094426, -1.076967, -4.270834, 0, 0, 0, 1, 1,
-0.09866268, -0.848374, -2.357235, 0, 0, 0, 1, 1,
-0.09840585, 0.4377122, -0.3267366, 0, 0, 0, 1, 1,
-0.09775764, -0.4011314, -3.253592, 0, 0, 0, 1, 1,
-0.09737093, -0.07837439, -1.430892, 0, 0, 0, 1, 1,
-0.09515685, -1.071407, -3.439954, 1, 1, 1, 1, 1,
-0.08309983, -0.5665975, -2.622345, 1, 1, 1, 1, 1,
-0.07932503, 1.081328, -0.3822591, 1, 1, 1, 1, 1,
-0.07752725, -0.4874938, -2.766515, 1, 1, 1, 1, 1,
-0.07633273, -1.784962, -3.332514, 1, 1, 1, 1, 1,
-0.07513223, -1.288281, -1.188668, 1, 1, 1, 1, 1,
-0.07214254, -0.9801427, -3.238355, 1, 1, 1, 1, 1,
-0.07008419, -0.2807558, -2.409336, 1, 1, 1, 1, 1,
-0.06969737, -2.216934, -1.572102, 1, 1, 1, 1, 1,
-0.05867785, 1.754769, -0.8924425, 1, 1, 1, 1, 1,
-0.05032447, -0.4494864, -2.727504, 1, 1, 1, 1, 1,
-0.04607426, -1.273304, -4.838672, 1, 1, 1, 1, 1,
-0.04202752, -0.5786712, -2.997511, 1, 1, 1, 1, 1,
-0.04080015, 0.1321765, 0.3522743, 1, 1, 1, 1, 1,
-0.04029096, -1.945643, -3.139627, 1, 1, 1, 1, 1,
-0.03741482, 1.136242, -1.181079, 0, 0, 1, 1, 1,
-0.0297998, 0.001599222, -0.9714098, 1, 0, 0, 1, 1,
-0.02859079, -0.6767883, -3.158212, 1, 0, 0, 1, 1,
-0.02804325, 0.2640455, -0.3816817, 1, 0, 0, 1, 1,
-0.0243039, 0.02775842, -1.831292, 1, 0, 0, 1, 1,
-0.02157336, 0.6244993, -0.7046998, 1, 0, 0, 1, 1,
-0.02077487, -0.7023673, -3.365508, 0, 0, 0, 1, 1,
-0.01761618, -1.944483, -4.351559, 0, 0, 0, 1, 1,
-0.008824463, -1.994744, -1.921488, 0, 0, 0, 1, 1,
-0.008237832, 0.03547759, -1.160035, 0, 0, 0, 1, 1,
-0.005268849, 0.7273028, -1.108926, 0, 0, 0, 1, 1,
-0.004689779, -2.350602, -3.501894, 0, 0, 0, 1, 1,
-0.001199758, 0.1848619, 1.486055, 0, 0, 0, 1, 1,
-0.0008943987, -0.07875764, -3.185644, 1, 1, 1, 1, 1,
0.002343522, -0.7633337, 2.923491, 1, 1, 1, 1, 1,
0.003266636, 0.9614503, -2.20381, 1, 1, 1, 1, 1,
0.003993014, -0.878237, 1.829996, 1, 1, 1, 1, 1,
0.009012284, -1.168146, 4.321362, 1, 1, 1, 1, 1,
0.01170564, -1.086118, 2.561529, 1, 1, 1, 1, 1,
0.01322705, 0.6524613, 2.033885, 1, 1, 1, 1, 1,
0.01332608, -2.568033, 3.323455, 1, 1, 1, 1, 1,
0.01478411, 0.0606675, -0.4413225, 1, 1, 1, 1, 1,
0.01607022, 0.494585, 1.984324, 1, 1, 1, 1, 1,
0.01689713, -0.5376716, 4.148877, 1, 1, 1, 1, 1,
0.01794975, -0.9954576, 3.627013, 1, 1, 1, 1, 1,
0.01803759, 0.6605731, -0.04381316, 1, 1, 1, 1, 1,
0.01822176, -0.8543088, 2.401307, 1, 1, 1, 1, 1,
0.01831831, -0.1751993, 2.85485, 1, 1, 1, 1, 1,
0.02076516, -0.6225007, 1.64866, 0, 0, 1, 1, 1,
0.02480248, 0.3826234, 1.215045, 1, 0, 0, 1, 1,
0.02816497, 1.452324, -0.7211815, 1, 0, 0, 1, 1,
0.0305037, 1.745658, -1.066135, 1, 0, 0, 1, 1,
0.03122043, -0.8313585, 2.140903, 1, 0, 0, 1, 1,
0.03159817, -0.9106309, 2.349164, 1, 0, 0, 1, 1,
0.03244507, 2.182604, 0.09398937, 0, 0, 0, 1, 1,
0.03531733, 1.288077, 1.037133, 0, 0, 0, 1, 1,
0.03689951, 0.131235, 2.209414, 0, 0, 0, 1, 1,
0.04044103, -1.301188, 4.000984, 0, 0, 0, 1, 1,
0.04476643, -0.01650132, 2.410476, 0, 0, 0, 1, 1,
0.04966184, 1.540772, -0.3547684, 0, 0, 0, 1, 1,
0.05104258, 1.224438, -0.6298319, 0, 0, 0, 1, 1,
0.05388296, 0.5276024, 1.971715, 1, 1, 1, 1, 1,
0.05567283, -1.261993, 2.243799, 1, 1, 1, 1, 1,
0.05624586, 0.8742347, -0.6428307, 1, 1, 1, 1, 1,
0.06038525, 0.2071076, -0.6164229, 1, 1, 1, 1, 1,
0.06053855, 1.412341, -1.492595, 1, 1, 1, 1, 1,
0.06116137, 0.867582, -0.01819463, 1, 1, 1, 1, 1,
0.06468325, 0.6734872, -0.2263748, 1, 1, 1, 1, 1,
0.06676423, 0.5435288, 1.431457, 1, 1, 1, 1, 1,
0.06805239, -0.1078344, 2.83021, 1, 1, 1, 1, 1,
0.07344662, -0.8922964, 3.491029, 1, 1, 1, 1, 1,
0.07433698, 1.661313, 1.100538, 1, 1, 1, 1, 1,
0.07572725, -0.2035684, 1.851261, 1, 1, 1, 1, 1,
0.07587475, -0.681824, 2.263796, 1, 1, 1, 1, 1,
0.07689933, -1.264277, 3.551962, 1, 1, 1, 1, 1,
0.07813463, -0.6974101, 1.588255, 1, 1, 1, 1, 1,
0.07959785, 0.3301994, -0.2478134, 0, 0, 1, 1, 1,
0.0806414, -0.3413465, 1.416816, 1, 0, 0, 1, 1,
0.08130652, -1.254721, 3.040957, 1, 0, 0, 1, 1,
0.08399434, 1.130497, -0.4062172, 1, 0, 0, 1, 1,
0.08850417, -1.203508, 4.009301, 1, 0, 0, 1, 1,
0.0924203, -0.8994318, 2.641953, 1, 0, 0, 1, 1,
0.09286335, -0.08590013, 4.202038, 0, 0, 0, 1, 1,
0.09391791, -1.817971, 1.295603, 0, 0, 0, 1, 1,
0.1002448, 0.915092, -0.3297408, 0, 0, 0, 1, 1,
0.103501, -0.1189212, 2.148107, 0, 0, 0, 1, 1,
0.1057816, 0.6364791, -1.41291, 0, 0, 0, 1, 1,
0.106207, 0.1600119, 1.283417, 0, 0, 0, 1, 1,
0.1095485, -0.3043284, 2.664027, 0, 0, 0, 1, 1,
0.1135239, 1.884203, -0.3864187, 1, 1, 1, 1, 1,
0.1139835, 0.102279, -0.04783276, 1, 1, 1, 1, 1,
0.114734, -0.5461521, 3.287422, 1, 1, 1, 1, 1,
0.1166195, -1.501448, 2.511756, 1, 1, 1, 1, 1,
0.1210618, -0.3892296, 2.238897, 1, 1, 1, 1, 1,
0.1246075, -2.211004, 2.978832, 1, 1, 1, 1, 1,
0.1255627, -0.2232919, 4.688852, 1, 1, 1, 1, 1,
0.1261105, -0.911756, 2.762041, 1, 1, 1, 1, 1,
0.1266828, -0.7249874, 2.481794, 1, 1, 1, 1, 1,
0.1365148, -0.7173757, 4.275878, 1, 1, 1, 1, 1,
0.1392233, 1.128498, -0.6318322, 1, 1, 1, 1, 1,
0.1407633, -0.8232328, 3.422426, 1, 1, 1, 1, 1,
0.1439329, 1.597601, -0.9306206, 1, 1, 1, 1, 1,
0.1488533, -0.6554603, 3.877056, 1, 1, 1, 1, 1,
0.1494491, -1.368074, 4.806785, 1, 1, 1, 1, 1,
0.1507283, 0.7550201, 0.379179, 0, 0, 1, 1, 1,
0.1534488, 1.113336, -1.004451, 1, 0, 0, 1, 1,
0.1708367, -0.5535692, 3.410829, 1, 0, 0, 1, 1,
0.1731061, -0.7505206, 4.181444, 1, 0, 0, 1, 1,
0.1739364, 0.6195627, -0.9230309, 1, 0, 0, 1, 1,
0.1744966, 0.8030313, 0.1722818, 1, 0, 0, 1, 1,
0.1790475, 0.9580896, -0.5597418, 0, 0, 0, 1, 1,
0.1852407, 0.3315186, 0.7050788, 0, 0, 0, 1, 1,
0.1858609, 0.5540789, 1.476475, 0, 0, 0, 1, 1,
0.1912185, -1.305359, 2.679225, 0, 0, 0, 1, 1,
0.1959234, -0.9934893, 1.577937, 0, 0, 0, 1, 1,
0.1969879, -1.817672, 4.13192, 0, 0, 0, 1, 1,
0.1977985, 0.1754059, 0.1384728, 0, 0, 0, 1, 1,
0.2010316, 1.213647, 0.5812442, 1, 1, 1, 1, 1,
0.2039587, 0.2924951, -0.611241, 1, 1, 1, 1, 1,
0.2090502, 0.68545, -0.5780032, 1, 1, 1, 1, 1,
0.2093099, -0.8295421, 1.998216, 1, 1, 1, 1, 1,
0.2097618, -0.06310964, 1.549127, 1, 1, 1, 1, 1,
0.2109183, 0.8314333, -2.278623, 1, 1, 1, 1, 1,
0.2129233, -3.775872, 3.085349, 1, 1, 1, 1, 1,
0.2142148, -0.01793807, 4.313012, 1, 1, 1, 1, 1,
0.2153398, -1.444347, 2.27311, 1, 1, 1, 1, 1,
0.2226368, -0.1919676, 1.931108, 1, 1, 1, 1, 1,
0.2261313, 0.1198182, -0.282004, 1, 1, 1, 1, 1,
0.2280993, 0.2280097, -0.1782646, 1, 1, 1, 1, 1,
0.2287872, -0.4230623, 3.762181, 1, 1, 1, 1, 1,
0.2321989, 0.1436902, 0.9911201, 1, 1, 1, 1, 1,
0.2383431, 2.15562, -0.3071878, 1, 1, 1, 1, 1,
0.2438664, -0.7464991, 3.114818, 0, 0, 1, 1, 1,
0.245545, 1.846466, -0.3259067, 1, 0, 0, 1, 1,
0.2470332, -0.1389883, 3.815237, 1, 0, 0, 1, 1,
0.2555298, -2.301646, 2.828346, 1, 0, 0, 1, 1,
0.2572074, -0.3674396, 2.301387, 1, 0, 0, 1, 1,
0.2577884, 0.4506221, 0.3148898, 1, 0, 0, 1, 1,
0.2618809, -0.9541154, 3.875442, 0, 0, 0, 1, 1,
0.2635445, -0.4944346, 1.567288, 0, 0, 0, 1, 1,
0.2652803, -0.3927682, 2.589386, 0, 0, 0, 1, 1,
0.2673326, -0.1164507, 1.957252, 0, 0, 0, 1, 1,
0.2681929, 2.811447, -1.323027, 0, 0, 0, 1, 1,
0.2684096, -0.1704013, 3.994673, 0, 0, 0, 1, 1,
0.2694134, -0.1954405, 3.42283, 0, 0, 0, 1, 1,
0.2735627, 0.9313998, 0.5950041, 1, 1, 1, 1, 1,
0.2747062, 1.002134, -1.879705, 1, 1, 1, 1, 1,
0.276915, 0.2206486, 2.767757, 1, 1, 1, 1, 1,
0.2791026, -0.7692381, 3.120823, 1, 1, 1, 1, 1,
0.2791446, -0.9370549, 1.483, 1, 1, 1, 1, 1,
0.2843231, 2.399927, -1.105304, 1, 1, 1, 1, 1,
0.2855516, -0.03647559, 2.75508, 1, 1, 1, 1, 1,
0.2873666, 0.07894281, 1.028711, 1, 1, 1, 1, 1,
0.2879769, 0.5137505, -0.2456443, 1, 1, 1, 1, 1,
0.2905187, 1.117939, 1.731871, 1, 1, 1, 1, 1,
0.2906414, 0.1404673, 1.330184, 1, 1, 1, 1, 1,
0.2915181, -0.3946733, 2.554432, 1, 1, 1, 1, 1,
0.2922614, -0.1669845, 1.968381, 1, 1, 1, 1, 1,
0.2940214, -1.047604, 3.700995, 1, 1, 1, 1, 1,
0.2987979, -0.6406975, 2.857147, 1, 1, 1, 1, 1,
0.2989056, -1.452152, 4.017938, 0, 0, 1, 1, 1,
0.2999415, -0.1380408, 2.071942, 1, 0, 0, 1, 1,
0.3030842, 0.7552553, -0.007847263, 1, 0, 0, 1, 1,
0.3035443, 0.4502023, 0.5131252, 1, 0, 0, 1, 1,
0.3055754, -2.302996, 5.560353, 1, 0, 0, 1, 1,
0.3067924, 1.475045, 0.22933, 1, 0, 0, 1, 1,
0.3119504, -0.02961451, 3.54598, 0, 0, 0, 1, 1,
0.3175525, 0.3521363, 1.412837, 0, 0, 0, 1, 1,
0.3234701, 1.346638, -1.19646, 0, 0, 0, 1, 1,
0.3257192, -0.6239092, 2.334133, 0, 0, 0, 1, 1,
0.3261963, -0.2355407, 1.07141, 0, 0, 0, 1, 1,
0.3291255, -0.6880183, 4.010238, 0, 0, 0, 1, 1,
0.3302621, -0.07444152, 4.156216, 0, 0, 0, 1, 1,
0.3329157, -0.1096882, 2.415654, 1, 1, 1, 1, 1,
0.3409828, 0.2621071, 0.01745264, 1, 1, 1, 1, 1,
0.341843, -2.141594, 4.296704, 1, 1, 1, 1, 1,
0.3427024, 0.7706456, 0.6765606, 1, 1, 1, 1, 1,
0.3438371, -0.2841338, 2.64179, 1, 1, 1, 1, 1,
0.3443621, 1.246545, 0.1152031, 1, 1, 1, 1, 1,
0.3498966, 0.9884223, 0.7373012, 1, 1, 1, 1, 1,
0.3529418, -1.121311, 3.790016, 1, 1, 1, 1, 1,
0.3554118, -0.2554235, 1.748454, 1, 1, 1, 1, 1,
0.3591294, -0.1923651, 3.057445, 1, 1, 1, 1, 1,
0.3607304, 1.254839, 0.0456342, 1, 1, 1, 1, 1,
0.3633791, 0.959512, 0.8845555, 1, 1, 1, 1, 1,
0.3646503, -0.4134742, 3.242151, 1, 1, 1, 1, 1,
0.3656163, 1.30164, 0.05727859, 1, 1, 1, 1, 1,
0.3692473, -1.503143, 2.536557, 1, 1, 1, 1, 1,
0.3719754, -0.0005476203, 1.63115, 0, 0, 1, 1, 1,
0.372926, -1.327998, 2.077065, 1, 0, 0, 1, 1,
0.3759706, -0.3634817, 4.08357, 1, 0, 0, 1, 1,
0.3777353, 0.7154923, 1.104138, 1, 0, 0, 1, 1,
0.381563, 0.4442513, 0.7629217, 1, 0, 0, 1, 1,
0.3840743, 0.2478894, 0.8238128, 1, 0, 0, 1, 1,
0.3857479, 0.9513152, -0.5046218, 0, 0, 0, 1, 1,
0.3868894, -0.4886117, 3.888096, 0, 0, 0, 1, 1,
0.3897944, 1.229113, -1.066584, 0, 0, 0, 1, 1,
0.3900224, 1.11027, 0.7035059, 0, 0, 0, 1, 1,
0.3932924, -2.342683, 1.800166, 0, 0, 0, 1, 1,
0.396201, 0.43728, 0.8513609, 0, 0, 0, 1, 1,
0.3966882, -1.150016, 3.480808, 0, 0, 0, 1, 1,
0.3974631, 0.5555136, 1.019775, 1, 1, 1, 1, 1,
0.4034435, 0.4344433, -0.6884481, 1, 1, 1, 1, 1,
0.4046973, -1.360041, 3.290962, 1, 1, 1, 1, 1,
0.4055595, 0.5364674, 3.725986, 1, 1, 1, 1, 1,
0.4060776, -0.3676561, 1.405718, 1, 1, 1, 1, 1,
0.410581, 0.4972259, -0.3002759, 1, 1, 1, 1, 1,
0.4129562, -0.5025036, 2.209992, 1, 1, 1, 1, 1,
0.4138943, 1.8907, -1.697264, 1, 1, 1, 1, 1,
0.4202704, -0.1464208, 1.019876, 1, 1, 1, 1, 1,
0.4210964, 1.306658, -0.1323765, 1, 1, 1, 1, 1,
0.4214953, 0.9954519, 1.431455, 1, 1, 1, 1, 1,
0.4236609, -0.4141878, 3.297333, 1, 1, 1, 1, 1,
0.4240341, -1.183278, 3.630918, 1, 1, 1, 1, 1,
0.4256568, -0.1266889, 1.50964, 1, 1, 1, 1, 1,
0.4267297, 0.09519363, 1.970615, 1, 1, 1, 1, 1,
0.4273802, -0.5582601, 1.573323, 0, 0, 1, 1, 1,
0.4332727, -1.30064, 2.744591, 1, 0, 0, 1, 1,
0.433618, 1.173941, 0.3231192, 1, 0, 0, 1, 1,
0.4358811, -0.6249136, 2.693726, 1, 0, 0, 1, 1,
0.4366139, 0.4547088, 1.614098, 1, 0, 0, 1, 1,
0.4415352, -0.5401145, 2.519835, 1, 0, 0, 1, 1,
0.4439593, 1.345632, -0.04855492, 0, 0, 0, 1, 1,
0.444537, 1.09028, -1.087023, 0, 0, 0, 1, 1,
0.4471723, -1.064307, 1.702052, 0, 0, 0, 1, 1,
0.450507, -0.8155559, 3.026758, 0, 0, 0, 1, 1,
0.4560629, 0.6108015, 1.395194, 0, 0, 0, 1, 1,
0.4635798, 0.1261761, 1.263622, 0, 0, 0, 1, 1,
0.4679691, -0.5884113, 2.07374, 0, 0, 0, 1, 1,
0.4685067, 0.3581704, 0.9315705, 1, 1, 1, 1, 1,
0.4711204, -0.2478994, 1.729908, 1, 1, 1, 1, 1,
0.4724063, 1.820286, -1.923016, 1, 1, 1, 1, 1,
0.4736538, -0.2541505, 2.124785, 1, 1, 1, 1, 1,
0.4759814, 2.397508, -0.2140771, 1, 1, 1, 1, 1,
0.4909993, 0.5048628, 1.006982, 1, 1, 1, 1, 1,
0.4935366, 1.02772, 0.7993615, 1, 1, 1, 1, 1,
0.5007454, -0.2146132, 2.715401, 1, 1, 1, 1, 1,
0.50262, -0.5613022, 1.760762, 1, 1, 1, 1, 1,
0.5040424, -1.863868, 3.944693, 1, 1, 1, 1, 1,
0.5141775, 0.9630396, 1.704677, 1, 1, 1, 1, 1,
0.5169605, -1.17623, 1.995952, 1, 1, 1, 1, 1,
0.5217504, -0.8004932, 2.47989, 1, 1, 1, 1, 1,
0.5291411, -2.286733, 3.995651, 1, 1, 1, 1, 1,
0.5387703, -1.662161, 2.149038, 1, 1, 1, 1, 1,
0.5426151, -0.345342, 1.864236, 0, 0, 1, 1, 1,
0.5442186, 0.572528, -0.493999, 1, 0, 0, 1, 1,
0.5443028, -0.03006793, 1.79284, 1, 0, 0, 1, 1,
0.5474111, -1.644617, 2.245508, 1, 0, 0, 1, 1,
0.5502776, -0.3346674, 2.022632, 1, 0, 0, 1, 1,
0.5510014, 0.5932084, 1.088831, 1, 0, 0, 1, 1,
0.5519155, 0.4912263, 0.7336074, 0, 0, 0, 1, 1,
0.554145, -0.8828779, 1.761865, 0, 0, 0, 1, 1,
0.5582228, 0.8246496, -0.006034223, 0, 0, 0, 1, 1,
0.576007, -1.025558, 3.402412, 0, 0, 0, 1, 1,
0.5778807, 0.9503444, 1.215081, 0, 0, 0, 1, 1,
0.5826672, 0.6022945, 0.6012559, 0, 0, 0, 1, 1,
0.5851939, -1.554787, 2.972836, 0, 0, 0, 1, 1,
0.5878049, -1.708314, 2.580977, 1, 1, 1, 1, 1,
0.5899784, 0.5120354, 0.183223, 1, 1, 1, 1, 1,
0.5909591, 0.4812835, 0.4083727, 1, 1, 1, 1, 1,
0.5911617, -0.8601868, 1.756747, 1, 1, 1, 1, 1,
0.5951975, 0.1182161, 2.158325, 1, 1, 1, 1, 1,
0.5954623, -0.668835, 2.87813, 1, 1, 1, 1, 1,
0.597924, -2.056728, 1.780764, 1, 1, 1, 1, 1,
0.6043125, -1.116441, 2.248022, 1, 1, 1, 1, 1,
0.6087204, -0.01698916, 0.3514962, 1, 1, 1, 1, 1,
0.6103027, -1.643943, 3.046003, 1, 1, 1, 1, 1,
0.6177802, 0.803416, 1.667771, 1, 1, 1, 1, 1,
0.6194864, -0.5490755, 1.300892, 1, 1, 1, 1, 1,
0.6198343, -0.7215679, 2.013776, 1, 1, 1, 1, 1,
0.6222236, 0.6454039, 1.468468, 1, 1, 1, 1, 1,
0.6244615, 1.522324, 0.7191742, 1, 1, 1, 1, 1,
0.6260369, -0.8148286, 2.998218, 0, 0, 1, 1, 1,
0.6273167, -0.710987, 2.981, 1, 0, 0, 1, 1,
0.6304505, -0.008437954, 2.842044, 1, 0, 0, 1, 1,
0.6329218, -0.1805713, 2.102344, 1, 0, 0, 1, 1,
0.6351069, -0.6306025, 3.52364, 1, 0, 0, 1, 1,
0.6359856, 0.2608828, 0.76998, 1, 0, 0, 1, 1,
0.636432, -0.865425, 3.474534, 0, 0, 0, 1, 1,
0.6393387, -1.487874, 2.988044, 0, 0, 0, 1, 1,
0.6395895, 0.7083048, -0.6682438, 0, 0, 0, 1, 1,
0.6447496, 0.9653053, 0.5309122, 0, 0, 0, 1, 1,
0.646848, -0.5144286, 2.473325, 0, 0, 0, 1, 1,
0.6474496, -1.153757, 2.548868, 0, 0, 0, 1, 1,
0.6524621, -1.674114, 2.574198, 0, 0, 0, 1, 1,
0.6599736, -0.7715438, 2.347475, 1, 1, 1, 1, 1,
0.6601834, -0.05813089, -0.1314016, 1, 1, 1, 1, 1,
0.6652004, 0.8278829, -0.4954827, 1, 1, 1, 1, 1,
0.6671349, -0.2350489, 2.549299, 1, 1, 1, 1, 1,
0.6678569, -0.03017553, 1.47155, 1, 1, 1, 1, 1,
0.6714432, 0.07307204, 3.437878, 1, 1, 1, 1, 1,
0.6726797, -1.346824, 3.585525, 1, 1, 1, 1, 1,
0.6779991, -1.083682, 1.044348, 1, 1, 1, 1, 1,
0.6794069, -0.219749, 1.281027, 1, 1, 1, 1, 1,
0.6806383, -0.1185424, 1.053981, 1, 1, 1, 1, 1,
0.6848532, 1.122944, 0.101991, 1, 1, 1, 1, 1,
0.6888714, 0.6859444, -0.638699, 1, 1, 1, 1, 1,
0.6957693, -0.1663649, 0.3069241, 1, 1, 1, 1, 1,
0.6959807, 1.048221, 0.009402245, 1, 1, 1, 1, 1,
0.6967854, -1.556251, 3.845378, 1, 1, 1, 1, 1,
0.6991078, 0.4169031, 0.4666598, 0, 0, 1, 1, 1,
0.7010658, 0.04194194, 2.454654, 1, 0, 0, 1, 1,
0.7011536, -2.199626, 1.822718, 1, 0, 0, 1, 1,
0.7060844, -1.681874, 2.93996, 1, 0, 0, 1, 1,
0.7091772, -1.036975, 3.743125, 1, 0, 0, 1, 1,
0.7109805, -0.7393347, 1.579558, 1, 0, 0, 1, 1,
0.7138755, 0.8215061, 2.286396, 0, 0, 0, 1, 1,
0.7155671, 0.02751346, 3.045139, 0, 0, 0, 1, 1,
0.7271032, -0.7223615, 2.901441, 0, 0, 0, 1, 1,
0.729463, 0.7697269, 0.5220127, 0, 0, 0, 1, 1,
0.7296392, -0.2829369, 3.445148, 0, 0, 0, 1, 1,
0.7359862, 0.05825761, 0.4709109, 0, 0, 0, 1, 1,
0.7363139, -0.5699766, 2.266908, 0, 0, 0, 1, 1,
0.7433145, 0.1561548, -0.5805259, 1, 1, 1, 1, 1,
0.7491712, 0.3373015, 1.62271, 1, 1, 1, 1, 1,
0.7555124, 1.729048, 1.303041, 1, 1, 1, 1, 1,
0.757936, -1.071003, 2.247656, 1, 1, 1, 1, 1,
0.7603995, 0.8116621, 1.68564, 1, 1, 1, 1, 1,
0.7622092, -2.059108, 3.11109, 1, 1, 1, 1, 1,
0.7689469, -0.7367657, 1.788695, 1, 1, 1, 1, 1,
0.7727857, -0.2140205, 1.591478, 1, 1, 1, 1, 1,
0.7736049, 1.54974, -0.3399449, 1, 1, 1, 1, 1,
0.7777189, -1.135164, 2.76413, 1, 1, 1, 1, 1,
0.778273, 0.2573063, 2.6239, 1, 1, 1, 1, 1,
0.7792259, 0.05564552, 0.6606709, 1, 1, 1, 1, 1,
0.7809185, -0.2257292, 1.900502, 1, 1, 1, 1, 1,
0.7817787, 0.2419258, 0.4700444, 1, 1, 1, 1, 1,
0.782894, 0.5862257, 2.260997, 1, 1, 1, 1, 1,
0.7936147, 0.3748668, 0.5207607, 0, 0, 1, 1, 1,
0.796824, -0.308645, 1.522197, 1, 0, 0, 1, 1,
0.8027814, 1.443752, 1.486404, 1, 0, 0, 1, 1,
0.8092031, 0.1593293, 1.361119, 1, 0, 0, 1, 1,
0.8097245, -0.6069687, 2.356894, 1, 0, 0, 1, 1,
0.8123128, -0.3216332, 1.883388, 1, 0, 0, 1, 1,
0.8170395, 0.01621149, 3.01192, 0, 0, 0, 1, 1,
0.8170808, 0.6826618, 1.504843, 0, 0, 0, 1, 1,
0.8198437, 1.115761, 0.2344733, 0, 0, 0, 1, 1,
0.8200902, -0.7643541, 1.03575, 0, 0, 0, 1, 1,
0.8242614, -0.604678, 2.441473, 0, 0, 0, 1, 1,
0.8252701, 0.6184286, 1.450991, 0, 0, 0, 1, 1,
0.8256196, 0.7707512, 2.80322, 0, 0, 0, 1, 1,
0.8261194, 0.5286374, 1.307155, 1, 1, 1, 1, 1,
0.8279741, -0.5021645, 3.085934, 1, 1, 1, 1, 1,
0.8332469, -0.079163, 1.414507, 1, 1, 1, 1, 1,
0.8378569, 1.153543, 1.222384, 1, 1, 1, 1, 1,
0.838852, -0.8211365, 2.119969, 1, 1, 1, 1, 1,
0.8457212, 0.04391502, 2.007801, 1, 1, 1, 1, 1,
0.8489086, -1.255081, 0.8865806, 1, 1, 1, 1, 1,
0.8534281, 0.4763632, 0.007197792, 1, 1, 1, 1, 1,
0.8549384, -0.2047494, 1.75301, 1, 1, 1, 1, 1,
0.856157, 0.8884458, 0.4275993, 1, 1, 1, 1, 1,
0.8569202, -0.1557318, 1.36139, 1, 1, 1, 1, 1,
0.8634604, -0.08958235, 1.073343, 1, 1, 1, 1, 1,
0.8673977, -0.6003969, 1.495979, 1, 1, 1, 1, 1,
0.8685298, -1.042632, 3.919435, 1, 1, 1, 1, 1,
0.868724, -0.7832025, -0.424999, 1, 1, 1, 1, 1,
0.8723295, -1.078295, 0.3050957, 0, 0, 1, 1, 1,
0.8778992, 1.094297, 0.3187491, 1, 0, 0, 1, 1,
0.8825992, 0.4177819, 1.28061, 1, 0, 0, 1, 1,
0.8892549, -0.173284, 2.442888, 1, 0, 0, 1, 1,
0.8901065, -0.9513315, 3.780561, 1, 0, 0, 1, 1,
0.893099, -1.055753, 3.224599, 1, 0, 0, 1, 1,
0.8933814, -0.1700994, 1.600967, 0, 0, 0, 1, 1,
0.8944293, -1.550568, 0.2116996, 0, 0, 0, 1, 1,
0.8981006, -1.269887, 2.378085, 0, 0, 0, 1, 1,
0.9038331, 0.8868874, -0.3152605, 0, 0, 0, 1, 1,
0.9108237, 0.8306433, 0.4365733, 0, 0, 0, 1, 1,
0.9168876, -1.578315, 1.387801, 0, 0, 0, 1, 1,
0.9254745, -1.011981, 2.285321, 0, 0, 0, 1, 1,
0.9318364, 0.1265175, 3.164822, 1, 1, 1, 1, 1,
0.9377755, 0.4895709, 3.313346, 1, 1, 1, 1, 1,
0.9402072, 1.406071, 0.2372651, 1, 1, 1, 1, 1,
0.9500346, 1.0377, 1.962322, 1, 1, 1, 1, 1,
0.9619995, -1.021892, 2.382498, 1, 1, 1, 1, 1,
0.9678028, -0.1489885, 0.8008127, 1, 1, 1, 1, 1,
0.9707407, -1.284948, 2.304403, 1, 1, 1, 1, 1,
0.9709153, 0.8906415, 0.001737777, 1, 1, 1, 1, 1,
0.9770382, 1.787753, 1.706864, 1, 1, 1, 1, 1,
0.9820682, 2.821124, -0.3259678, 1, 1, 1, 1, 1,
0.986264, -1.021897, 1.869109, 1, 1, 1, 1, 1,
0.9877952, 0.6552766, 1.598634, 1, 1, 1, 1, 1,
0.9879817, -1.703957, 2.603863, 1, 1, 1, 1, 1,
0.9911423, 0.656635, 3.018365, 1, 1, 1, 1, 1,
0.9915266, -1.42951, 2.21465, 1, 1, 1, 1, 1,
0.9923096, 1.219437, 0.5265877, 0, 0, 1, 1, 1,
0.9927894, -0.9563306, 2.647267, 1, 0, 0, 1, 1,
1.005511, -0.5140087, 2.652774, 1, 0, 0, 1, 1,
1.009585, 1.024488, 1.011251, 1, 0, 0, 1, 1,
1.015453, -1.86069, 1.976646, 1, 0, 0, 1, 1,
1.0226, -0.3152638, 3.103073, 1, 0, 0, 1, 1,
1.022745, 0.009089298, 2.041223, 0, 0, 0, 1, 1,
1.023471, -0.3114401, 1.597434, 0, 0, 0, 1, 1,
1.028697, 0.9984205, 2.805514, 0, 0, 0, 1, 1,
1.031893, -0.6466167, 2.051036, 0, 0, 0, 1, 1,
1.035871, -1.281677, 2.865088, 0, 0, 0, 1, 1,
1.045917, 0.3315483, 1.179809, 0, 0, 0, 1, 1,
1.04862, -0.9243222, 0.8087329, 0, 0, 0, 1, 1,
1.048817, 0.1458467, 0.6078695, 1, 1, 1, 1, 1,
1.050388, 1.485687, 1.106361, 1, 1, 1, 1, 1,
1.053841, 0.3670927, 2.810925, 1, 1, 1, 1, 1,
1.054583, 0.9924895, 2.073121, 1, 1, 1, 1, 1,
1.056921, -0.99016, 2.998317, 1, 1, 1, 1, 1,
1.074881, 0.7479073, 3.135019, 1, 1, 1, 1, 1,
1.087935, 2.937233, 0.6110446, 1, 1, 1, 1, 1,
1.091136, -0.3757756, 0.9540416, 1, 1, 1, 1, 1,
1.097072, 0.4466454, 2.490401, 1, 1, 1, 1, 1,
1.103134, -1.969727, 5.350867, 1, 1, 1, 1, 1,
1.115654, -0.3526738, 0.07608736, 1, 1, 1, 1, 1,
1.127846, -0.7857732, 1.814215, 1, 1, 1, 1, 1,
1.133344, -0.01912318, 1.170264, 1, 1, 1, 1, 1,
1.133921, 0.7454327, 0.2984503, 1, 1, 1, 1, 1,
1.140966, -0.7180521, 3.002363, 1, 1, 1, 1, 1,
1.143341, 1.007989, 1.222581, 0, 0, 1, 1, 1,
1.145997, 1.631454, 0.1053942, 1, 0, 0, 1, 1,
1.146204, 0.2049416, 1.495062, 1, 0, 0, 1, 1,
1.14782, 1.638794, -0.6047869, 1, 0, 0, 1, 1,
1.149876, -0.6464848, 2.13714, 1, 0, 0, 1, 1,
1.155557, -0.8455278, 2.698503, 1, 0, 0, 1, 1,
1.163052, 1.931522, -0.09625848, 0, 0, 0, 1, 1,
1.169444, 0.6381972, 0.2308611, 0, 0, 0, 1, 1,
1.183923, -0.008109747, 1.263343, 0, 0, 0, 1, 1,
1.18874, -0.3703931, 1.433406, 0, 0, 0, 1, 1,
1.193383, 0.8065186, 1.543578, 0, 0, 0, 1, 1,
1.197238, 0.6330263, 0.8535864, 0, 0, 0, 1, 1,
1.198498, 0.2374739, 0.7064986, 0, 0, 0, 1, 1,
1.2015, -0.5228653, 1.805374, 1, 1, 1, 1, 1,
1.203945, -0.1479867, 2.253462, 1, 1, 1, 1, 1,
1.205915, -0.3572164, 1.489779, 1, 1, 1, 1, 1,
1.219123, 0.4039975, 1.19822, 1, 1, 1, 1, 1,
1.236638, 1.347785, -0.3605399, 1, 1, 1, 1, 1,
1.23667, 0.07679101, 1.255034, 1, 1, 1, 1, 1,
1.238184, -0.4969718, 1.502352, 1, 1, 1, 1, 1,
1.238984, -1.330648, 2.029091, 1, 1, 1, 1, 1,
1.245764, -0.7744771, 1.723258, 1, 1, 1, 1, 1,
1.247152, 1.691614, 0.8254216, 1, 1, 1, 1, 1,
1.257695, -0.3926158, 0.5133713, 1, 1, 1, 1, 1,
1.259923, -0.8432267, 2.542436, 1, 1, 1, 1, 1,
1.260497, 1.09434, 1.963426, 1, 1, 1, 1, 1,
1.263241, 1.925858, 0.704431, 1, 1, 1, 1, 1,
1.265934, -0.2015048, 0.502001, 1, 1, 1, 1, 1,
1.266235, -1.1856, 0.3165913, 0, 0, 1, 1, 1,
1.269549, -0.8880804, 2.470389, 1, 0, 0, 1, 1,
1.279257, -1.165892, 0.5553442, 1, 0, 0, 1, 1,
1.293055, -1.275681, 1.78039, 1, 0, 0, 1, 1,
1.296132, -1.686355, 2.42277, 1, 0, 0, 1, 1,
1.304173, 0.4969561, 1.6832, 1, 0, 0, 1, 1,
1.308364, -0.3945837, 3.278403, 0, 0, 0, 1, 1,
1.316812, 0.896966, 0.5899046, 0, 0, 0, 1, 1,
1.317219, 0.1196463, 0.8360823, 0, 0, 0, 1, 1,
1.32233, -0.8567366, 3.465492, 0, 0, 0, 1, 1,
1.327643, 0.2179727, 1.421502, 0, 0, 0, 1, 1,
1.347543, 0.8813841, 0.8659017, 0, 0, 0, 1, 1,
1.347879, -0.5454963, 3.038532, 0, 0, 0, 1, 1,
1.355717, 2.181925, 0.2834651, 1, 1, 1, 1, 1,
1.359124, -0.6492005, 3.060185, 1, 1, 1, 1, 1,
1.381223, -0.8461629, 2.550362, 1, 1, 1, 1, 1,
1.387936, 0.4732711, 1.842398, 1, 1, 1, 1, 1,
1.392043, 1.702248, 1.146944, 1, 1, 1, 1, 1,
1.395226, -0.6449001, 2.385978, 1, 1, 1, 1, 1,
1.396633, -0.2350919, 1.352958, 1, 1, 1, 1, 1,
1.421494, 1.639806, 1.258589, 1, 1, 1, 1, 1,
1.425025, -0.4198418, 2.294109, 1, 1, 1, 1, 1,
1.426366, -0.7191393, 2.996429, 1, 1, 1, 1, 1,
1.428135, 0.6374602, 1.392857, 1, 1, 1, 1, 1,
1.432885, 0.4103376, 0.9066173, 1, 1, 1, 1, 1,
1.432998, -1.053845, 3.290454, 1, 1, 1, 1, 1,
1.434805, 0.3081143, -0.7702965, 1, 1, 1, 1, 1,
1.438133, 0.6224594, 2.952292, 1, 1, 1, 1, 1,
1.441863, 0.2047386, 0.3396046, 0, 0, 1, 1, 1,
1.442534, 0.4420082, 1.522335, 1, 0, 0, 1, 1,
1.443339, 1.169166, 0.8089238, 1, 0, 0, 1, 1,
1.459294, -0.7386581, 2.137299, 1, 0, 0, 1, 1,
1.477032, -0.7067187, 1.406375, 1, 0, 0, 1, 1,
1.481402, -0.05293017, 2.110087, 1, 0, 0, 1, 1,
1.48588, -1.634099, 3.880098, 0, 0, 0, 1, 1,
1.506412, 0.5030634, 1.003271, 0, 0, 0, 1, 1,
1.520312, 0.1478497, -0.5860277, 0, 0, 0, 1, 1,
1.525522, -1.283786, 3.118968, 0, 0, 0, 1, 1,
1.530767, 1.880213, -1.073354, 0, 0, 0, 1, 1,
1.531002, 0.749167, 2.992667, 0, 0, 0, 1, 1,
1.541891, -0.4908405, 2.987679, 0, 0, 0, 1, 1,
1.543389, -1.064929, 3.047809, 1, 1, 1, 1, 1,
1.547165, 1.641283, -0.5106911, 1, 1, 1, 1, 1,
1.550561, 0.8032653, 1.12929, 1, 1, 1, 1, 1,
1.552586, 0.05462987, 2.162258, 1, 1, 1, 1, 1,
1.582596, 1.051825, 2.001543, 1, 1, 1, 1, 1,
1.590659, -0.4076993, 0.5928546, 1, 1, 1, 1, 1,
1.595966, -0.9130226, 1.79783, 1, 1, 1, 1, 1,
1.618982, -0.06647445, 0.2880854, 1, 1, 1, 1, 1,
1.62736, 0.6411097, 1.286748, 1, 1, 1, 1, 1,
1.642585, 0.2323602, 2.40249, 1, 1, 1, 1, 1,
1.645214, -0.501452, 2.328207, 1, 1, 1, 1, 1,
1.658578, -0.1707418, 2.551799, 1, 1, 1, 1, 1,
1.667277, 1.647312, 0.1103576, 1, 1, 1, 1, 1,
1.674468, 0.8203626, 1.707453, 1, 1, 1, 1, 1,
1.682002, -1.364341, 3.216031, 1, 1, 1, 1, 1,
1.687974, 0.8357071, 1.777014, 0, 0, 1, 1, 1,
1.692392, -0.9708961, 1.65586, 1, 0, 0, 1, 1,
1.695089, -0.5702708, 1.737963, 1, 0, 0, 1, 1,
1.699395, 0.1143971, 1.480384, 1, 0, 0, 1, 1,
1.701136, -0.4640295, 1.976069, 1, 0, 0, 1, 1,
1.706258, 1.132114, 0.7232504, 1, 0, 0, 1, 1,
1.714163, -0.7059824, 1.223836, 0, 0, 0, 1, 1,
1.729404, -1.179489, 2.179344, 0, 0, 0, 1, 1,
1.733953, 1.196812, 0.5964389, 0, 0, 0, 1, 1,
1.743546, -0.3059952, 1.415914, 0, 0, 0, 1, 1,
1.780127, 0.0623368, 1.297619, 0, 0, 0, 1, 1,
1.793881, 0.6206616, -0.6828648, 0, 0, 0, 1, 1,
1.813744, -0.6966477, 2.711491, 0, 0, 0, 1, 1,
1.842372, -0.2046231, 3.356572, 1, 1, 1, 1, 1,
1.856353, -0.8322527, 2.109439, 1, 1, 1, 1, 1,
1.870777, 0.2681526, 2.315611, 1, 1, 1, 1, 1,
1.884955, -0.7859868, 0.8957224, 1, 1, 1, 1, 1,
1.893403, 0.5092211, 1.033816, 1, 1, 1, 1, 1,
1.90996, -0.8689285, 2.444157, 1, 1, 1, 1, 1,
1.919413, 2.393247, -0.3932296, 1, 1, 1, 1, 1,
1.965179, 0.1659845, 2.53296, 1, 1, 1, 1, 1,
1.978495, 0.04878512, 2.871759, 1, 1, 1, 1, 1,
1.980216, -0.3890891, 3.821524, 1, 1, 1, 1, 1,
1.985896, -0.4621445, 1.752069, 1, 1, 1, 1, 1,
1.992148, 0.1597459, 1.396618, 1, 1, 1, 1, 1,
1.993105, -0.6791602, 2.414654, 1, 1, 1, 1, 1,
1.998175, 0.8339469, 1.457385, 1, 1, 1, 1, 1,
2.007775, 0.3957849, 1.402265, 1, 1, 1, 1, 1,
2.045492, -0.2429958, 1.594948, 0, 0, 1, 1, 1,
2.04592, 1.08565, 0.8271255, 1, 0, 0, 1, 1,
2.069181, -0.6836479, 1.871909, 1, 0, 0, 1, 1,
2.094571, -1.564626, 3.552257, 1, 0, 0, 1, 1,
2.117068, 0.6123129, 1.005504, 1, 0, 0, 1, 1,
2.123287, -0.8778576, 1.963408, 1, 0, 0, 1, 1,
2.170681, -0.2397617, 0.8151997, 0, 0, 0, 1, 1,
2.248872, -1.867725, 4.051586, 0, 0, 0, 1, 1,
2.284897, -1.821826, 4.654025, 0, 0, 0, 1, 1,
2.295889, 0.01293191, 2.005902, 0, 0, 0, 1, 1,
2.368243, -0.4908395, 0.1885325, 0, 0, 0, 1, 1,
2.388932, -0.8971308, 2.942212, 0, 0, 0, 1, 1,
2.446658, 0.02041182, 2.683131, 0, 0, 0, 1, 1,
2.474212, 1.185846, 1.709196, 1, 1, 1, 1, 1,
2.484872, -0.7088197, 1.251258, 1, 1, 1, 1, 1,
2.562344, -0.4147539, 2.325107, 1, 1, 1, 1, 1,
2.635846, -0.7725058, 3.865628, 1, 1, 1, 1, 1,
2.68121, 1.11605, 1.726219, 1, 1, 1, 1, 1,
2.709443, -1.354239, 0.3778708, 1, 1, 1, 1, 1,
2.770094, -0.8378647, 3.684052, 1, 1, 1, 1, 1
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
var radius = 9.421803;
var distance = 33.09368;
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
mvMatrix.translate( 0.129635, 0.3349147, -0.3608406 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09368);
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
