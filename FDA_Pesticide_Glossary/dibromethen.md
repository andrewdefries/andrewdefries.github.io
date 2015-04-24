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
-3.66671, -1.875075, 0.1134443, 1, 0, 0, 1,
-2.899255, -0.2915961, -2.057434, 1, 0.007843138, 0, 1,
-2.765607, 0.197202, -2.998181, 1, 0.01176471, 0, 1,
-2.679374, -2.991313, -4.363869, 1, 0.01960784, 0, 1,
-2.472195, -1.210675, -1.841549, 1, 0.02352941, 0, 1,
-2.42048, 0.3666161, -1.053597, 1, 0.03137255, 0, 1,
-2.328569, -2.263203, -2.119282, 1, 0.03529412, 0, 1,
-2.323471, 0.1646381, -1.319797, 1, 0.04313726, 0, 1,
-2.278592, -1.00889, -1.08074, 1, 0.04705882, 0, 1,
-2.265537, -0.554263, -2.713029, 1, 0.05490196, 0, 1,
-2.220634, 2.3388, -1.641144, 1, 0.05882353, 0, 1,
-2.217969, 0.358017, -2.063523, 1, 0.06666667, 0, 1,
-2.176798, -0.7773938, -1.773667, 1, 0.07058824, 0, 1,
-2.136271, 0.8775043, -1.434679, 1, 0.07843138, 0, 1,
-2.118165, -1.070765, -1.765089, 1, 0.08235294, 0, 1,
-2.090344, 1.862648, 0.9098078, 1, 0.09019608, 0, 1,
-2.049205, 0.09411474, -0.4048659, 1, 0.09411765, 0, 1,
-2.028068, 0.7867573, -1.256343, 1, 0.1019608, 0, 1,
-2.017989, 0.4202442, -0.6670363, 1, 0.1098039, 0, 1,
-2.016752, -0.3991516, 0.259807, 1, 0.1137255, 0, 1,
-2.01554, 0.7684844, -2.148302, 1, 0.1215686, 0, 1,
-2.009068, -0.7045141, -1.609559, 1, 0.1254902, 0, 1,
-2.000028, -0.9074024, -1.908158, 1, 0.1333333, 0, 1,
-1.985484, -0.9693508, -2.791276, 1, 0.1372549, 0, 1,
-1.952566, -2.802058, -2.037478, 1, 0.145098, 0, 1,
-1.914237, -1.73802, -3.277605, 1, 0.1490196, 0, 1,
-1.89829, 0.03285449, -1.254407, 1, 0.1568628, 0, 1,
-1.883088, 0.9338658, -1.025244, 1, 0.1607843, 0, 1,
-1.86813, 0.8478805, -1.533119, 1, 0.1686275, 0, 1,
-1.856282, -1.576209, -2.009328, 1, 0.172549, 0, 1,
-1.836853, -0.1728733, -4.245355, 1, 0.1803922, 0, 1,
-1.835544, 0.2675302, -2.458478, 1, 0.1843137, 0, 1,
-1.831531, 0.5383773, -2.410002, 1, 0.1921569, 0, 1,
-1.80521, -0.2270735, -1.149514, 1, 0.1960784, 0, 1,
-1.782963, -2.166449, -2.05569, 1, 0.2039216, 0, 1,
-1.779609, 0.1884721, -0.3777867, 1, 0.2117647, 0, 1,
-1.778256, -0.3698782, -0.9270532, 1, 0.2156863, 0, 1,
-1.773941, -0.06556096, -0.9096725, 1, 0.2235294, 0, 1,
-1.736477, -0.5693477, -2.562909, 1, 0.227451, 0, 1,
-1.719063, 0.3261844, -1.410255, 1, 0.2352941, 0, 1,
-1.703772, 0.3963909, -1.350472, 1, 0.2392157, 0, 1,
-1.654535, -2.298657, -2.037121, 1, 0.2470588, 0, 1,
-1.652549, -1.057536, -2.807687, 1, 0.2509804, 0, 1,
-1.649641, -1.04714, -2.133171, 1, 0.2588235, 0, 1,
-1.649497, -0.8486389, -1.619861, 1, 0.2627451, 0, 1,
-1.635855, -0.07901186, -3.169047, 1, 0.2705882, 0, 1,
-1.626552, -2.38019, -2.038738, 1, 0.2745098, 0, 1,
-1.620671, -1.073249, -3.05699, 1, 0.282353, 0, 1,
-1.610291, 1.957614, -1.678546, 1, 0.2862745, 0, 1,
-1.595416, 1.098997, -0.7675356, 1, 0.2941177, 0, 1,
-1.592091, 0.3193752, -1.952252, 1, 0.3019608, 0, 1,
-1.568573, 0.831885, -1.958955, 1, 0.3058824, 0, 1,
-1.562594, 0.7126628, -1.691073, 1, 0.3137255, 0, 1,
-1.559388, 0.1147121, -1.982147, 1, 0.3176471, 0, 1,
-1.555309, -0.3685076, -4.261963, 1, 0.3254902, 0, 1,
-1.55187, 0.4418093, -0.6744631, 1, 0.3294118, 0, 1,
-1.547912, -0.9303545, -2.210822, 1, 0.3372549, 0, 1,
-1.547603, 0.6380807, -1.738355, 1, 0.3411765, 0, 1,
-1.546686, -0.456642, 0.03569455, 1, 0.3490196, 0, 1,
-1.53768, 1.398413, 0.0273131, 1, 0.3529412, 0, 1,
-1.535219, -0.09438078, -3.098291, 1, 0.3607843, 0, 1,
-1.535061, -1.705685, -3.02601, 1, 0.3647059, 0, 1,
-1.532648, -1.199292, -0.5557771, 1, 0.372549, 0, 1,
-1.528544, 0.3756134, -2.415111, 1, 0.3764706, 0, 1,
-1.520299, -1.601346, -3.400856, 1, 0.3843137, 0, 1,
-1.516914, 0.003719418, -0.3930626, 1, 0.3882353, 0, 1,
-1.50551, -0.3806892, -1.882411, 1, 0.3960784, 0, 1,
-1.48866, 0.9641068, -0.3388208, 1, 0.4039216, 0, 1,
-1.479361, 1.299287, -0.9335089, 1, 0.4078431, 0, 1,
-1.477086, -1.313509, -3.216037, 1, 0.4156863, 0, 1,
-1.470929, 0.5976529, 0.8825843, 1, 0.4196078, 0, 1,
-1.46515, -0.05593108, -2.934372, 1, 0.427451, 0, 1,
-1.459336, 0.3214215, -2.601222, 1, 0.4313726, 0, 1,
-1.449786, 0.2166987, -2.469462, 1, 0.4392157, 0, 1,
-1.442049, -0.7040277, -2.774086, 1, 0.4431373, 0, 1,
-1.436, -0.1032503, -2.530169, 1, 0.4509804, 0, 1,
-1.431942, -0.7919379, -2.235935, 1, 0.454902, 0, 1,
-1.430306, -2.10704, -3.097641, 1, 0.4627451, 0, 1,
-1.415501, -0.9561882, -1.418327, 1, 0.4666667, 0, 1,
-1.41429, 0.3505964, -1.06054, 1, 0.4745098, 0, 1,
-1.41344, -0.6852669, -0.5460126, 1, 0.4784314, 0, 1,
-1.405696, -1.019042, -1.08624, 1, 0.4862745, 0, 1,
-1.404674, -0.2758676, -3.076206, 1, 0.4901961, 0, 1,
-1.386198, -0.618192, -3.099107, 1, 0.4980392, 0, 1,
-1.382161, -0.5591762, -0.5050223, 1, 0.5058824, 0, 1,
-1.361357, 1.118973, -0.850159, 1, 0.509804, 0, 1,
-1.359543, 0.2105156, -1.295704, 1, 0.5176471, 0, 1,
-1.347063, 1.226161, -0.1274372, 1, 0.5215687, 0, 1,
-1.344399, 0.08457024, -2.13389, 1, 0.5294118, 0, 1,
-1.341294, 1.484571, -1.008609, 1, 0.5333334, 0, 1,
-1.339263, 1.310885, 1.554625, 1, 0.5411765, 0, 1,
-1.337886, -0.1854021, -2.589446, 1, 0.5450981, 0, 1,
-1.326003, 0.2789379, -2.320156, 1, 0.5529412, 0, 1,
-1.324901, -0.1491351, -3.572103, 1, 0.5568628, 0, 1,
-1.320099, -1.27627, -2.865904, 1, 0.5647059, 0, 1,
-1.318275, 1.035257, -1.947001, 1, 0.5686275, 0, 1,
-1.300576, 1.564197, -1.959836, 1, 0.5764706, 0, 1,
-1.298761, 0.627454, -1.452587, 1, 0.5803922, 0, 1,
-1.291702, -0.5415586, -2.148318, 1, 0.5882353, 0, 1,
-1.276938, 0.4976952, -3.03306, 1, 0.5921569, 0, 1,
-1.276398, -0.7773319, -2.565807, 1, 0.6, 0, 1,
-1.26562, 1.989462, -0.8987595, 1, 0.6078432, 0, 1,
-1.264067, -0.6271843, -3.586804, 1, 0.6117647, 0, 1,
-1.264051, -0.06994886, -0.727143, 1, 0.6196079, 0, 1,
-1.261023, 0.06282818, 0.01110101, 1, 0.6235294, 0, 1,
-1.258826, -1.278518, -2.768809, 1, 0.6313726, 0, 1,
-1.258014, -0.9141521, -3.377735, 1, 0.6352941, 0, 1,
-1.250764, 1.452641, -0.5873249, 1, 0.6431373, 0, 1,
-1.240219, -0.3641937, -2.212492, 1, 0.6470588, 0, 1,
-1.233435, -1.495704, -3.34805, 1, 0.654902, 0, 1,
-1.233386, -0.7287936, -2.39405, 1, 0.6588235, 0, 1,
-1.227705, -0.2471864, -1.704642, 1, 0.6666667, 0, 1,
-1.226193, -0.8253499, -2.38973, 1, 0.6705883, 0, 1,
-1.225915, 0.5068303, -1.59138, 1, 0.6784314, 0, 1,
-1.224306, -0.4181085, -1.806973, 1, 0.682353, 0, 1,
-1.223966, -0.4968504, -1.335183, 1, 0.6901961, 0, 1,
-1.22241, -0.2167606, -1.275906, 1, 0.6941177, 0, 1,
-1.219145, 0.3135187, -0.6336842, 1, 0.7019608, 0, 1,
-1.218316, -0.6185214, -2.126032, 1, 0.7098039, 0, 1,
-1.217204, -1.108194, -2.745897, 1, 0.7137255, 0, 1,
-1.196691, -0.6230971, -2.624927, 1, 0.7215686, 0, 1,
-1.193786, -0.5784931, -2.278455, 1, 0.7254902, 0, 1,
-1.19235, -1.142464, -3.739631, 1, 0.7333333, 0, 1,
-1.191968, -0.3705858, -2.142074, 1, 0.7372549, 0, 1,
-1.186128, -0.8086972, -2.473851, 1, 0.7450981, 0, 1,
-1.171333, -0.816334, -3.002604, 1, 0.7490196, 0, 1,
-1.163365, -1.522351, -2.803532, 1, 0.7568628, 0, 1,
-1.161105, 1.255206, -1.498759, 1, 0.7607843, 0, 1,
-1.146013, -0.2463333, -1.978808, 1, 0.7686275, 0, 1,
-1.145989, -1.286155, -1.790474, 1, 0.772549, 0, 1,
-1.1413, -0.1299901, -1.473595, 1, 0.7803922, 0, 1,
-1.119272, -1.08992, -2.828742, 1, 0.7843137, 0, 1,
-1.117598, -0.8019429, -2.099111, 1, 0.7921569, 0, 1,
-1.116183, -0.1493076, -2.769272, 1, 0.7960784, 0, 1,
-1.11239, -0.2792847, -0.2558714, 1, 0.8039216, 0, 1,
-1.092314, -0.9151632, -1.262096, 1, 0.8117647, 0, 1,
-1.084954, -1.952648, -4.071555, 1, 0.8156863, 0, 1,
-1.079597, 0.1960475, -2.923568, 1, 0.8235294, 0, 1,
-1.078048, 0.5319542, -0.7206612, 1, 0.827451, 0, 1,
-1.074263, -0.07244629, -1.789403, 1, 0.8352941, 0, 1,
-1.073836, 1.220794, -0.799379, 1, 0.8392157, 0, 1,
-1.070086, -1.089477, -3.156096, 1, 0.8470588, 0, 1,
-1.067478, -0.493564, -3.270652, 1, 0.8509804, 0, 1,
-1.067292, 0.9296355, 1.336771, 1, 0.8588235, 0, 1,
-1.06294, 0.586394, 0.1462057, 1, 0.8627451, 0, 1,
-1.056928, -1.52063, -3.638546, 1, 0.8705882, 0, 1,
-1.052783, -0.2230197, -1.432497, 1, 0.8745098, 0, 1,
-1.050984, 1.214133, 0.06441166, 1, 0.8823529, 0, 1,
-1.050602, 0.5707559, -1.15109, 1, 0.8862745, 0, 1,
-1.050227, 2.242587, -0.6206715, 1, 0.8941177, 0, 1,
-1.049701, -0.6009751, -0.06644963, 1, 0.8980392, 0, 1,
-1.045292, 2.178859, -1.374756, 1, 0.9058824, 0, 1,
-1.043715, 0.1983765, -2.166108, 1, 0.9137255, 0, 1,
-1.036191, -0.4626658, -2.045966, 1, 0.9176471, 0, 1,
-1.02924, 1.03005, -1.395946, 1, 0.9254902, 0, 1,
-1.026362, -1.014609, -3.372942, 1, 0.9294118, 0, 1,
-1.023702, 1.974234, -0.5404664, 1, 0.9372549, 0, 1,
-1.023509, 0.6723096, -0.303158, 1, 0.9411765, 0, 1,
-1.023144, -0.8346914, -2.394307, 1, 0.9490196, 0, 1,
-1.0097, 1.446289, -0.2742685, 1, 0.9529412, 0, 1,
-1.009444, -1.567354, -0.669732, 1, 0.9607843, 0, 1,
-1.009185, -0.07166854, -1.711745, 1, 0.9647059, 0, 1,
-1.008559, -0.7482534, -1.397921, 1, 0.972549, 0, 1,
-1.003793, 0.4048983, -1.286055, 1, 0.9764706, 0, 1,
-1.003745, -0.7347309, -1.379635, 1, 0.9843137, 0, 1,
-0.9983765, 0.9014684, 0.5293738, 1, 0.9882353, 0, 1,
-0.994361, 0.3764311, 0.01749147, 1, 0.9960784, 0, 1,
-0.9896955, 0.2754057, -2.402506, 0.9960784, 1, 0, 1,
-0.9872235, 1.69605, -0.295904, 0.9921569, 1, 0, 1,
-0.9833711, -0.05476369, -2.296959, 0.9843137, 1, 0, 1,
-0.9762793, 0.01705417, -2.031199, 0.9803922, 1, 0, 1,
-0.9725196, 1.794485, 1.61731, 0.972549, 1, 0, 1,
-0.9638248, 1.742969, -0.8298509, 0.9686275, 1, 0, 1,
-0.960255, 1.025582, 0.3258275, 0.9607843, 1, 0, 1,
-0.9509836, 0.2207949, -0.4197266, 0.9568627, 1, 0, 1,
-0.94683, -0.07143731, -1.114091, 0.9490196, 1, 0, 1,
-0.9387102, -0.2129076, -0.7608716, 0.945098, 1, 0, 1,
-0.9371472, 0.5369819, -1.491942, 0.9372549, 1, 0, 1,
-0.9309233, 2.342743, -1.057738, 0.9333333, 1, 0, 1,
-0.9281162, 0.3492653, -0.6177863, 0.9254902, 1, 0, 1,
-0.915557, 0.06068474, -3.479308, 0.9215686, 1, 0, 1,
-0.9140294, 1.646535, 0.5317042, 0.9137255, 1, 0, 1,
-0.9083856, -0.4332414, -1.206751, 0.9098039, 1, 0, 1,
-0.9074833, -0.2995913, -0.7163684, 0.9019608, 1, 0, 1,
-0.9035804, -0.08247416, -0.3275081, 0.8941177, 1, 0, 1,
-0.9002765, -0.4415157, -1.727549, 0.8901961, 1, 0, 1,
-0.894618, 0.6233671, -0.5769972, 0.8823529, 1, 0, 1,
-0.882965, 0.1048174, -1.613959, 0.8784314, 1, 0, 1,
-0.8812012, -0.1846014, -2.267046, 0.8705882, 1, 0, 1,
-0.8808694, -0.844646, -2.941938, 0.8666667, 1, 0, 1,
-0.878338, 0.1819293, 0.173369, 0.8588235, 1, 0, 1,
-0.8769664, -1.573872, -1.619401, 0.854902, 1, 0, 1,
-0.8725901, 0.3254181, -0.5029686, 0.8470588, 1, 0, 1,
-0.8718373, -0.2218794, -3.167315, 0.8431373, 1, 0, 1,
-0.8692966, 0.5338643, -0.5699004, 0.8352941, 1, 0, 1,
-0.8543124, 0.9349818, -1.963261, 0.8313726, 1, 0, 1,
-0.8436346, -1.560714, -6.035049, 0.8235294, 1, 0, 1,
-0.8428305, 0.433389, -2.252921, 0.8196079, 1, 0, 1,
-0.8336363, -0.9954354, -3.304211, 0.8117647, 1, 0, 1,
-0.8223276, 1.11915, -0.9751996, 0.8078431, 1, 0, 1,
-0.8091859, 0.01658911, -0.9941006, 0.8, 1, 0, 1,
-0.8091424, -1.911899, -1.057261, 0.7921569, 1, 0, 1,
-0.8075482, -0.3685911, -0.9874632, 0.7882353, 1, 0, 1,
-0.8071343, 0.2299428, -1.992524, 0.7803922, 1, 0, 1,
-0.8062389, -0.2650696, -2.974068, 0.7764706, 1, 0, 1,
-0.8054998, 0.2986356, -1.264508, 0.7686275, 1, 0, 1,
-0.804222, -0.5799494, -1.587351, 0.7647059, 1, 0, 1,
-0.8017942, 1.253981, -0.5181388, 0.7568628, 1, 0, 1,
-0.800624, 0.1879082, -0.6241964, 0.7529412, 1, 0, 1,
-0.7877321, 1.704597, -1.558588, 0.7450981, 1, 0, 1,
-0.7763484, 0.1944771, -1.296569, 0.7411765, 1, 0, 1,
-0.7692087, 0.08190452, -1.287493, 0.7333333, 1, 0, 1,
-0.7683712, 2.86831, -2.465851, 0.7294118, 1, 0, 1,
-0.7666305, -2.326864, -0.7541856, 0.7215686, 1, 0, 1,
-0.766524, -0.4996045, -1.760939, 0.7176471, 1, 0, 1,
-0.7654105, 1.084919, 0.2934099, 0.7098039, 1, 0, 1,
-0.7649649, 0.2826372, 0.2852586, 0.7058824, 1, 0, 1,
-0.7647916, -0.02216686, -1.382466, 0.6980392, 1, 0, 1,
-0.7646559, 0.9018621, -1.069285, 0.6901961, 1, 0, 1,
-0.7637705, 1.046659, 0.7371546, 0.6862745, 1, 0, 1,
-0.763041, 1.611524, 0.2500014, 0.6784314, 1, 0, 1,
-0.7448913, 1.16662, -1.572457, 0.6745098, 1, 0, 1,
-0.7438568, -0.3087111, -1.587587, 0.6666667, 1, 0, 1,
-0.7417631, 2.141234, -0.2041703, 0.6627451, 1, 0, 1,
-0.737496, -0.4340204, -2.378676, 0.654902, 1, 0, 1,
-0.735755, 1.557159, 0.01076095, 0.6509804, 1, 0, 1,
-0.7294819, -0.8730746, -2.312224, 0.6431373, 1, 0, 1,
-0.7274214, -0.3608291, -1.891495, 0.6392157, 1, 0, 1,
-0.7215374, -0.4089154, -1.640141, 0.6313726, 1, 0, 1,
-0.7213379, 0.1048403, -1.21133, 0.627451, 1, 0, 1,
-0.7190725, -0.6281168, -3.392493, 0.6196079, 1, 0, 1,
-0.7085289, -1.129413, -2.902024, 0.6156863, 1, 0, 1,
-0.7074038, -1.644822, -2.953224, 0.6078432, 1, 0, 1,
-0.7059984, -0.5010833, -1.84366, 0.6039216, 1, 0, 1,
-0.7026884, 0.07813628, -1.662523, 0.5960785, 1, 0, 1,
-0.7012578, -0.07671449, -0.0715397, 0.5882353, 1, 0, 1,
-0.6892212, -0.1158479, -0.8931516, 0.5843138, 1, 0, 1,
-0.6856887, -0.5905343, -3.456227, 0.5764706, 1, 0, 1,
-0.6780974, 0.1557322, -1.941555, 0.572549, 1, 0, 1,
-0.6777167, -0.5980281, -1.465406, 0.5647059, 1, 0, 1,
-0.6776714, -0.2729387, -0.4493958, 0.5607843, 1, 0, 1,
-0.6739036, -1.143088, -2.367396, 0.5529412, 1, 0, 1,
-0.6726764, 0.8533481, -1.396255, 0.5490196, 1, 0, 1,
-0.6683769, 0.8430537, -0.7492836, 0.5411765, 1, 0, 1,
-0.6670683, -0.04973903, -1.249816, 0.5372549, 1, 0, 1,
-0.6652203, -0.4891377, -1.862223, 0.5294118, 1, 0, 1,
-0.6646295, -2.909463, -1.573471, 0.5254902, 1, 0, 1,
-0.6645922, -0.8442897, -2.039036, 0.5176471, 1, 0, 1,
-0.6557192, -0.9046568, -3.208296, 0.5137255, 1, 0, 1,
-0.6526358, 0.9504228, -1.17381, 0.5058824, 1, 0, 1,
-0.648742, -0.6708066, -4.189861, 0.5019608, 1, 0, 1,
-0.6484156, -0.3437141, -2.396429, 0.4941176, 1, 0, 1,
-0.6460718, 0.4721328, -0.3755617, 0.4862745, 1, 0, 1,
-0.6456849, -0.8648357, -2.162401, 0.4823529, 1, 0, 1,
-0.6452019, -0.4286455, -2.48771, 0.4745098, 1, 0, 1,
-0.6402258, -0.4983587, -2.526613, 0.4705882, 1, 0, 1,
-0.6393918, 2.446742, 0.04002484, 0.4627451, 1, 0, 1,
-0.6351318, 0.6280652, 2.083187, 0.4588235, 1, 0, 1,
-0.632548, -0.3923153, -3.392628, 0.4509804, 1, 0, 1,
-0.6253898, -2.13808, -1.98149, 0.4470588, 1, 0, 1,
-0.619776, -2.365963, -2.690572, 0.4392157, 1, 0, 1,
-0.6171065, 1.093613, 1.340866, 0.4352941, 1, 0, 1,
-0.6169564, 1.971731, -0.2781731, 0.427451, 1, 0, 1,
-0.6125564, -0.6949468, -2.417111, 0.4235294, 1, 0, 1,
-0.6104105, 0.4971857, -1.229874, 0.4156863, 1, 0, 1,
-0.6097229, -0.2938689, -3.034922, 0.4117647, 1, 0, 1,
-0.5990643, -0.8888091, -2.83037, 0.4039216, 1, 0, 1,
-0.5980104, -0.8822758, -0.9755417, 0.3960784, 1, 0, 1,
-0.5924255, -0.99577, -1.705289, 0.3921569, 1, 0, 1,
-0.5863075, -0.01895678, -0.3579921, 0.3843137, 1, 0, 1,
-0.5835475, 1.140201, 0.09081311, 0.3803922, 1, 0, 1,
-0.5793276, -1.772122, -4.181398, 0.372549, 1, 0, 1,
-0.5775257, 0.03640703, 0.6251672, 0.3686275, 1, 0, 1,
-0.5765586, -1.475035, -2.554391, 0.3607843, 1, 0, 1,
-0.5712997, -1.920982, -3.896481, 0.3568628, 1, 0, 1,
-0.5620144, 0.4415289, -0.7904607, 0.3490196, 1, 0, 1,
-0.5594694, 0.001210733, -3.023028, 0.345098, 1, 0, 1,
-0.5574748, 0.5408718, -1.634341, 0.3372549, 1, 0, 1,
-0.5536342, -0.5409125, -1.551221, 0.3333333, 1, 0, 1,
-0.5515286, -0.1085121, -0.9152029, 0.3254902, 1, 0, 1,
-0.5484219, -0.3885344, -0.1001025, 0.3215686, 1, 0, 1,
-0.5449106, -0.3030824, -0.7658673, 0.3137255, 1, 0, 1,
-0.5443058, -0.2390086, -1.591618, 0.3098039, 1, 0, 1,
-0.5426831, -0.9749311, -2.392503, 0.3019608, 1, 0, 1,
-0.5420148, 0.1355626, -2.806347, 0.2941177, 1, 0, 1,
-0.5419798, -0.8809003, -1.365301, 0.2901961, 1, 0, 1,
-0.5372099, -1.133505, -1.915644, 0.282353, 1, 0, 1,
-0.5277498, -0.3370952, -1.244583, 0.2784314, 1, 0, 1,
-0.5259156, -0.2355051, -2.366157, 0.2705882, 1, 0, 1,
-0.5186512, 0.2713916, -0.7706667, 0.2666667, 1, 0, 1,
-0.5155182, -0.4053018, -1.563297, 0.2588235, 1, 0, 1,
-0.5146988, 1.238758, 1.093699, 0.254902, 1, 0, 1,
-0.5057227, 1.170418, -1.322796, 0.2470588, 1, 0, 1,
-0.5051969, 0.08998322, -1.34352, 0.2431373, 1, 0, 1,
-0.5049118, 0.8176541, -1.484997, 0.2352941, 1, 0, 1,
-0.503115, -0.8851793, -3.655968, 0.2313726, 1, 0, 1,
-0.5019388, 1.337733, 2.135172, 0.2235294, 1, 0, 1,
-0.4993369, -0.2023957, -1.218598, 0.2196078, 1, 0, 1,
-0.4954313, -1.740936, -3.385419, 0.2117647, 1, 0, 1,
-0.4864105, -0.1033551, -0.8892466, 0.2078431, 1, 0, 1,
-0.4852602, -1.919752, -0.7587938, 0.2, 1, 0, 1,
-0.4799017, 0.619011, -2.460043, 0.1921569, 1, 0, 1,
-0.4767304, 0.01507878, -1.051636, 0.1882353, 1, 0, 1,
-0.4710353, -2.042717, -2.65091, 0.1803922, 1, 0, 1,
-0.4693887, 2.592844, -0.8081464, 0.1764706, 1, 0, 1,
-0.4680636, -0.6525211, -4.3173, 0.1686275, 1, 0, 1,
-0.4661109, 0.2199832, -2.357901, 0.1647059, 1, 0, 1,
-0.4660244, -0.1633388, -0.1699866, 0.1568628, 1, 0, 1,
-0.4652446, -0.3427835, -2.959119, 0.1529412, 1, 0, 1,
-0.4624127, 1.916632, 0.1154745, 0.145098, 1, 0, 1,
-0.4577507, 2.324158, -0.5747814, 0.1411765, 1, 0, 1,
-0.4551695, 0.9083275, -0.9305248, 0.1333333, 1, 0, 1,
-0.4503559, -0.1309544, 0.4880194, 0.1294118, 1, 0, 1,
-0.4483453, 0.9030407, 0.3470653, 0.1215686, 1, 0, 1,
-0.4417188, 0.198418, -2.480037, 0.1176471, 1, 0, 1,
-0.4397295, -0.6003733, -1.518569, 0.1098039, 1, 0, 1,
-0.4394862, -1.447504, -2.523753, 0.1058824, 1, 0, 1,
-0.4373601, -0.3419097, -1.200436, 0.09803922, 1, 0, 1,
-0.434892, -0.1134176, -1.118264, 0.09019608, 1, 0, 1,
-0.4302185, -0.9910625, -2.590047, 0.08627451, 1, 0, 1,
-0.4235134, -0.9546338, -3.961183, 0.07843138, 1, 0, 1,
-0.4232328, -1.05506, -3.243531, 0.07450981, 1, 0, 1,
-0.4172881, -0.7466732, -1.573071, 0.06666667, 1, 0, 1,
-0.4098364, -1.632015, -1.732409, 0.0627451, 1, 0, 1,
-0.4067096, -0.3053052, -2.649277, 0.05490196, 1, 0, 1,
-0.4041775, -0.69757, -3.460674, 0.05098039, 1, 0, 1,
-0.4040319, 0.3870805, -1.404507, 0.04313726, 1, 0, 1,
-0.4037928, -1.084127, -2.999432, 0.03921569, 1, 0, 1,
-0.4027045, 1.069355, -1.088464, 0.03137255, 1, 0, 1,
-0.3988115, 0.2127596, -1.585308, 0.02745098, 1, 0, 1,
-0.3925516, 1.457705, 1.329005, 0.01960784, 1, 0, 1,
-0.3901091, -1.745535, -3.351545, 0.01568628, 1, 0, 1,
-0.3897871, 1.752837, -1.633533, 0.007843138, 1, 0, 1,
-0.3892371, 0.3056807, -0.8063132, 0.003921569, 1, 0, 1,
-0.3868455, 1.297677, -0.8698682, 0, 1, 0.003921569, 1,
-0.3868445, 2.455323, 0.2979244, 0, 1, 0.01176471, 1,
-0.384069, 1.841328, 0.2481779, 0, 1, 0.01568628, 1,
-0.3803889, 0.4805973, -2.625283, 0, 1, 0.02352941, 1,
-0.3779742, 1.41503, -0.5561934, 0, 1, 0.02745098, 1,
-0.372661, 1.542684, -0.697561, 0, 1, 0.03529412, 1,
-0.36975, 0.4025519, 0.58606, 0, 1, 0.03921569, 1,
-0.3696547, 0.2904968, -1.674194, 0, 1, 0.04705882, 1,
-0.3666613, 0.653486, -0.5187433, 0, 1, 0.05098039, 1,
-0.3628674, -0.6510294, -4.672581, 0, 1, 0.05882353, 1,
-0.3623553, -0.5164043, -3.184937, 0, 1, 0.0627451, 1,
-0.3602505, 1.226111, -2.278937, 0, 1, 0.07058824, 1,
-0.355773, -0.01923842, -3.60552, 0, 1, 0.07450981, 1,
-0.3519268, -1.200233, -2.476667, 0, 1, 0.08235294, 1,
-0.3485934, -2.215629, -4.604385, 0, 1, 0.08627451, 1,
-0.3376701, -0.1327883, -0.3043192, 0, 1, 0.09411765, 1,
-0.3327997, 1.881159, 2.166262, 0, 1, 0.1019608, 1,
-0.3299714, -0.5177166, -2.408512, 0, 1, 0.1058824, 1,
-0.3278076, 0.5330224, 0.3839694, 0, 1, 0.1137255, 1,
-0.3263288, 0.228025, -1.505754, 0, 1, 0.1176471, 1,
-0.3248735, 0.3733785, 1.391733, 0, 1, 0.1254902, 1,
-0.3202141, -0.2095237, -2.476304, 0, 1, 0.1294118, 1,
-0.3198729, -1.24621, -3.382893, 0, 1, 0.1372549, 1,
-0.3186665, -0.9851769, -2.762772, 0, 1, 0.1411765, 1,
-0.3176918, 2.090642, 0.01432396, 0, 1, 0.1490196, 1,
-0.3176452, -0.111294, -0.5821846, 0, 1, 0.1529412, 1,
-0.3112742, 0.6376094, -0.4700197, 0, 1, 0.1607843, 1,
-0.3104994, 0.3702913, -1.435418, 0, 1, 0.1647059, 1,
-0.3103901, 0.265712, -0.9006888, 0, 1, 0.172549, 1,
-0.3063656, -1.712212, -1.703163, 0, 1, 0.1764706, 1,
-0.3057863, -1.113402, -2.814302, 0, 1, 0.1843137, 1,
-0.305096, 0.8609502, 0.8757008, 0, 1, 0.1882353, 1,
-0.3031008, 0.7522363, -0.09303674, 0, 1, 0.1960784, 1,
-0.3016655, -0.3424166, -2.782273, 0, 1, 0.2039216, 1,
-0.2992122, -0.6583967, -3.434352, 0, 1, 0.2078431, 1,
-0.2980194, -0.5266783, -2.037904, 0, 1, 0.2156863, 1,
-0.2967177, 0.1384648, -0.4823723, 0, 1, 0.2196078, 1,
-0.2898875, -0.6787329, -2.37203, 0, 1, 0.227451, 1,
-0.2879585, 0.4804243, -2.097052, 0, 1, 0.2313726, 1,
-0.2871225, -0.5535859, -2.982404, 0, 1, 0.2392157, 1,
-0.2833358, -1.889845, -3.47003, 0, 1, 0.2431373, 1,
-0.2802926, 1.741391, 0.1855059, 0, 1, 0.2509804, 1,
-0.2788655, -0.1019014, -1.987012, 0, 1, 0.254902, 1,
-0.2778969, -0.6324874, -2.846741, 0, 1, 0.2627451, 1,
-0.2756755, 0.3447705, 0.4356966, 0, 1, 0.2666667, 1,
-0.2724948, -0.1888889, -3.074326, 0, 1, 0.2745098, 1,
-0.2700761, 0.5588354, -0.7343792, 0, 1, 0.2784314, 1,
-0.2669913, -0.7990027, -4.508035, 0, 1, 0.2862745, 1,
-0.2648861, 0.5436359, -0.6685254, 0, 1, 0.2901961, 1,
-0.2644232, -1.354276, -2.7898, 0, 1, 0.2980392, 1,
-0.2615182, -1.096949, -2.762153, 0, 1, 0.3058824, 1,
-0.2589342, 0.0512266, -1.723352, 0, 1, 0.3098039, 1,
-0.2586346, -0.9974848, -0.5543576, 0, 1, 0.3176471, 1,
-0.254439, 1.766354, -0.2851886, 0, 1, 0.3215686, 1,
-0.2490875, 0.3495947, 0.3479794, 0, 1, 0.3294118, 1,
-0.2476215, -0.5024783, -1.674692, 0, 1, 0.3333333, 1,
-0.2451143, -0.7042576, -2.324735, 0, 1, 0.3411765, 1,
-0.243938, 1.792167, 1.189454, 0, 1, 0.345098, 1,
-0.2437043, 0.2960658, -0.001925167, 0, 1, 0.3529412, 1,
-0.2433483, 0.7201083, -0.9079342, 0, 1, 0.3568628, 1,
-0.2415586, 0.2475989, -0.8686935, 0, 1, 0.3647059, 1,
-0.2408474, 0.3239167, 0.6563584, 0, 1, 0.3686275, 1,
-0.2385072, 0.558421, 0.6272719, 0, 1, 0.3764706, 1,
-0.2373551, -0.2616564, -1.894087, 0, 1, 0.3803922, 1,
-0.2345359, -1.100766, -2.249595, 0, 1, 0.3882353, 1,
-0.2319952, -2.639595, -4.644936, 0, 1, 0.3921569, 1,
-0.2309511, 0.1652389, -1.023864, 0, 1, 0.4, 1,
-0.2303958, -0.3885057, -4.202631, 0, 1, 0.4078431, 1,
-0.2291508, 0.3693921, -1.389568, 0, 1, 0.4117647, 1,
-0.2271581, -1.032161, -4.16266, 0, 1, 0.4196078, 1,
-0.2254469, -0.3885916, -2.89563, 0, 1, 0.4235294, 1,
-0.2252341, 0.8684852, 0.7669851, 0, 1, 0.4313726, 1,
-0.2207057, -0.6608672, -3.358935, 0, 1, 0.4352941, 1,
-0.2188028, -1.334649, -4.349703, 0, 1, 0.4431373, 1,
-0.218005, 0.8653421, -1.487584, 0, 1, 0.4470588, 1,
-0.2166106, 0.1791295, -0.1654067, 0, 1, 0.454902, 1,
-0.2140168, -0.4674681, -3.826438, 0, 1, 0.4588235, 1,
-0.2100864, -0.3787285, -1.56125, 0, 1, 0.4666667, 1,
-0.2076528, 1.93728, 1.504928, 0, 1, 0.4705882, 1,
-0.2066108, -0.5395209, -2.583592, 0, 1, 0.4784314, 1,
-0.2036196, 0.5076732, -0.1655833, 0, 1, 0.4823529, 1,
-0.2031965, 1.069484, 0.5656866, 0, 1, 0.4901961, 1,
-0.1962904, 2.0265, 0.3056189, 0, 1, 0.4941176, 1,
-0.1942223, -0.9670054, -2.806419, 0, 1, 0.5019608, 1,
-0.1907027, 1.023887, 0.3307998, 0, 1, 0.509804, 1,
-0.1890733, 1.215468, 1.445433, 0, 1, 0.5137255, 1,
-0.1875176, 0.09772561, -0.9983938, 0, 1, 0.5215687, 1,
-0.1733212, -1.654348, -2.228899, 0, 1, 0.5254902, 1,
-0.1729177, 0.6729879, -0.6829467, 0, 1, 0.5333334, 1,
-0.1724102, 0.7836843, -0.2833042, 0, 1, 0.5372549, 1,
-0.1708115, -2.018506, -4.21585, 0, 1, 0.5450981, 1,
-0.1665964, -0.3530928, -2.31832, 0, 1, 0.5490196, 1,
-0.16535, 0.7018846, -1.333138, 0, 1, 0.5568628, 1,
-0.1632036, -0.2148934, -3.054623, 0, 1, 0.5607843, 1,
-0.1600124, -0.7946457, -2.638808, 0, 1, 0.5686275, 1,
-0.1462845, -0.04642744, -2.188865, 0, 1, 0.572549, 1,
-0.1439361, -0.2243798, -1.875492, 0, 1, 0.5803922, 1,
-0.1380235, 1.39471, 0.8143569, 0, 1, 0.5843138, 1,
-0.1378888, -1.244781, -3.777861, 0, 1, 0.5921569, 1,
-0.1359773, 0.7351251, 1.113953, 0, 1, 0.5960785, 1,
-0.1352581, 1.61442, -0.5570258, 0, 1, 0.6039216, 1,
-0.1343811, 1.390041, -0.5099882, 0, 1, 0.6117647, 1,
-0.1269319, 0.3049027, 0.1292234, 0, 1, 0.6156863, 1,
-0.1240822, -0.2585959, -2.019677, 0, 1, 0.6235294, 1,
-0.1239407, 0.9928185, 0.5989593, 0, 1, 0.627451, 1,
-0.1217128, 0.2779467, -1.732084, 0, 1, 0.6352941, 1,
-0.121024, -1.322208, -3.567168, 0, 1, 0.6392157, 1,
-0.1205989, -0.2962694, -2.938276, 0, 1, 0.6470588, 1,
-0.1186478, 0.6164873, 0.9249804, 0, 1, 0.6509804, 1,
-0.1176963, 1.169814, -1.147913, 0, 1, 0.6588235, 1,
-0.1149794, 0.8206689, -0.9213477, 0, 1, 0.6627451, 1,
-0.106976, -0.3992144, -1.294583, 0, 1, 0.6705883, 1,
-0.1003925, 0.2954756, -0.2750597, 0, 1, 0.6745098, 1,
-0.09770464, -0.709384, -3.207025, 0, 1, 0.682353, 1,
-0.09395792, -1.170939, -2.081419, 0, 1, 0.6862745, 1,
-0.09320664, 0.3019839, 0.223003, 0, 1, 0.6941177, 1,
-0.08933249, 0.1981793, 0.8336293, 0, 1, 0.7019608, 1,
-0.08634426, -1.189314, -2.914402, 0, 1, 0.7058824, 1,
-0.08048722, -0.5273494, -2.64368, 0, 1, 0.7137255, 1,
-0.07656734, -0.3543456, -3.24393, 0, 1, 0.7176471, 1,
-0.07468996, -0.890266, -2.719718, 0, 1, 0.7254902, 1,
-0.06733222, 0.4817396, 0.4831342, 0, 1, 0.7294118, 1,
-0.0672984, 0.6724155, 1.105608, 0, 1, 0.7372549, 1,
-0.06618357, -0.3388898, -2.504536, 0, 1, 0.7411765, 1,
-0.06467534, 0.731696, -2.137328, 0, 1, 0.7490196, 1,
-0.0626834, 1.746414, -0.3090509, 0, 1, 0.7529412, 1,
-0.06249789, -0.1348389, -2.093096, 0, 1, 0.7607843, 1,
-0.05929262, 0.5960073, 0.3330409, 0, 1, 0.7647059, 1,
-0.05892389, 0.0963938, -0.7809258, 0, 1, 0.772549, 1,
-0.0565151, 0.03179559, -2.31235, 0, 1, 0.7764706, 1,
-0.04891713, 0.6581759, 0.5333567, 0, 1, 0.7843137, 1,
-0.04568155, -0.959053, -0.8336281, 0, 1, 0.7882353, 1,
-0.0406023, 1.639098, -1.825402, 0, 1, 0.7960784, 1,
-0.0371657, -2.16525, -3.224319, 0, 1, 0.8039216, 1,
-0.03497338, 0.3472821, 0.3011986, 0, 1, 0.8078431, 1,
-0.03189084, 3.116122, 0.02003778, 0, 1, 0.8156863, 1,
-0.02883281, -1.114267, -3.451499, 0, 1, 0.8196079, 1,
-0.02824789, 0.4430296, 0.2000854, 0, 1, 0.827451, 1,
-0.02648489, 0.5704345, -0.5925273, 0, 1, 0.8313726, 1,
-0.02605129, -1.674448, -4.086298, 0, 1, 0.8392157, 1,
-0.02315557, -0.6557464, -2.928398, 0, 1, 0.8431373, 1,
-0.0188894, 1.423244, 0.9028645, 0, 1, 0.8509804, 1,
-0.01652091, 0.09604868, -0.1179632, 0, 1, 0.854902, 1,
-0.01545477, 0.8269055, 0.3987372, 0, 1, 0.8627451, 1,
-0.01456971, -1.280935, -2.134312, 0, 1, 0.8666667, 1,
-0.01359631, -1.692026, -3.30266, 0, 1, 0.8745098, 1,
-0.012741, 0.6909262, 0.5961684, 0, 1, 0.8784314, 1,
-0.01152133, -0.5957018, -5.015544, 0, 1, 0.8862745, 1,
-0.00864033, -0.6949338, -3.853733, 0, 1, 0.8901961, 1,
-0.006387997, -0.9945927, -2.425983, 0, 1, 0.8980392, 1,
-0.00625199, -0.05266612, -4.442782, 0, 1, 0.9058824, 1,
-0.001329886, 0.4939447, -1.311821, 0, 1, 0.9098039, 1,
-0.001280513, 0.8759578, -0.6780981, 0, 1, 0.9176471, 1,
0.003027366, -0.7237149, 3.22083, 0, 1, 0.9215686, 1,
0.003330313, 0.8631523, -0.3043646, 0, 1, 0.9294118, 1,
0.00456191, -0.0074599, 2.358857, 0, 1, 0.9333333, 1,
0.008044156, -1.403618, 2.94784, 0, 1, 0.9411765, 1,
0.01098744, -0.9418082, 1.908586, 0, 1, 0.945098, 1,
0.01605763, 0.5476727, 1.074644, 0, 1, 0.9529412, 1,
0.01718773, 1.042372, -0.1245512, 0, 1, 0.9568627, 1,
0.01767838, -0.2159099, 4.032674, 0, 1, 0.9647059, 1,
0.01851102, 0.6072406, -0.7143772, 0, 1, 0.9686275, 1,
0.01880058, 1.228135, 0.5619708, 0, 1, 0.9764706, 1,
0.02688973, 1.002874, 2.353754, 0, 1, 0.9803922, 1,
0.02717688, 1.196608, 0.5648329, 0, 1, 0.9882353, 1,
0.02890414, 0.1815193, 1.092971, 0, 1, 0.9921569, 1,
0.0368846, -1.163927, 3.418234, 0, 1, 1, 1,
0.03770277, 0.8057348, -1.16875, 0, 0.9921569, 1, 1,
0.03859437, -0.2214639, 1.19057, 0, 0.9882353, 1, 1,
0.04009034, -0.6976029, 3.061089, 0, 0.9803922, 1, 1,
0.045664, -0.3438587, 2.992493, 0, 0.9764706, 1, 1,
0.04688535, -0.4645327, 4.187909, 0, 0.9686275, 1, 1,
0.04791785, -0.8018089, 3.033095, 0, 0.9647059, 1, 1,
0.04795401, 0.871035, 0.4857109, 0, 0.9568627, 1, 1,
0.04923633, -1.72335, 4.09681, 0, 0.9529412, 1, 1,
0.0518304, 0.3034115, 0.0491198, 0, 0.945098, 1, 1,
0.05189886, -1.204722, 2.463517, 0, 0.9411765, 1, 1,
0.05193754, -0.8483595, 3.045433, 0, 0.9333333, 1, 1,
0.05415476, -0.5060987, 4.197101, 0, 0.9294118, 1, 1,
0.05614865, 0.7352766, -0.3404962, 0, 0.9215686, 1, 1,
0.05630996, 1.408288, -0.4635833, 0, 0.9176471, 1, 1,
0.05900692, -0.4346892, 3.669564, 0, 0.9098039, 1, 1,
0.06343937, -0.6715739, 3.748203, 0, 0.9058824, 1, 1,
0.06383598, -1.382974, 4.410103, 0, 0.8980392, 1, 1,
0.06581338, 0.4241824, -0.1142776, 0, 0.8901961, 1, 1,
0.06582045, -0.3900864, 3.556434, 0, 0.8862745, 1, 1,
0.06709287, -0.6275887, 1.991521, 0, 0.8784314, 1, 1,
0.06783153, 1.315555, -0.9049168, 0, 0.8745098, 1, 1,
0.06811013, 1.149103, -0.8738726, 0, 0.8666667, 1, 1,
0.06892842, -2.051652, 4.287097, 0, 0.8627451, 1, 1,
0.07510593, 1.092034, -0.4245526, 0, 0.854902, 1, 1,
0.08014946, 0.2660687, 0.663601, 0, 0.8509804, 1, 1,
0.08022036, 0.1591658, 1.210237, 0, 0.8431373, 1, 1,
0.08232594, -1.692413, 3.94392, 0, 0.8392157, 1, 1,
0.08632481, 0.2792851, -0.4305288, 0, 0.8313726, 1, 1,
0.08656195, 0.6741619, 0.761354, 0, 0.827451, 1, 1,
0.08673801, 0.08149269, 2.846905, 0, 0.8196079, 1, 1,
0.08846559, -1.733563, 3.656222, 0, 0.8156863, 1, 1,
0.08872321, 0.2355614, -0.724394, 0, 0.8078431, 1, 1,
0.09902204, -0.3989546, 2.437842, 0, 0.8039216, 1, 1,
0.1003198, -2.18401, 3.851843, 0, 0.7960784, 1, 1,
0.1010002, -1.849172, 3.061713, 0, 0.7882353, 1, 1,
0.1027574, -1.5269, 3.580968, 0, 0.7843137, 1, 1,
0.1028072, -2.690067, 2.010404, 0, 0.7764706, 1, 1,
0.1031221, -1.089531, 1.317312, 0, 0.772549, 1, 1,
0.103519, 0.05336765, 0.9329966, 0, 0.7647059, 1, 1,
0.1063203, 1.632994, -0.1416969, 0, 0.7607843, 1, 1,
0.1083718, -0.1833092, 4.043485, 0, 0.7529412, 1, 1,
0.108782, 0.9660904, 0.6116538, 0, 0.7490196, 1, 1,
0.1119628, -0.878879, 3.969681, 0, 0.7411765, 1, 1,
0.1132382, -0.0721259, 3.070968, 0, 0.7372549, 1, 1,
0.1194377, -1.490708, 3.5676, 0, 0.7294118, 1, 1,
0.1204049, -1.566146, 3.160754, 0, 0.7254902, 1, 1,
0.1252297, 0.4989008, 0.5904543, 0, 0.7176471, 1, 1,
0.1255036, -0.6850125, 3.292665, 0, 0.7137255, 1, 1,
0.1272297, -0.6478109, 1.082547, 0, 0.7058824, 1, 1,
0.1274351, -1.767624, 3.222711, 0, 0.6980392, 1, 1,
0.1364706, 0.8724507, -1.027352, 0, 0.6941177, 1, 1,
0.1375549, 0.475347, -0.4971668, 0, 0.6862745, 1, 1,
0.1380168, -0.3359686, 2.549544, 0, 0.682353, 1, 1,
0.1384485, 0.4032772, 0.4227975, 0, 0.6745098, 1, 1,
0.1423254, 1.268119, 0.6736067, 0, 0.6705883, 1, 1,
0.146164, -0.8433887, 1.928496, 0, 0.6627451, 1, 1,
0.1474906, -0.5030612, 3.354977, 0, 0.6588235, 1, 1,
0.1481899, -1.087546, 2.264774, 0, 0.6509804, 1, 1,
0.1518483, -1.213643, 2.573517, 0, 0.6470588, 1, 1,
0.1527565, -0.3949144, 1.030758, 0, 0.6392157, 1, 1,
0.1593135, 2.216373, 0.3500287, 0, 0.6352941, 1, 1,
0.1612487, -1.383299, 2.611807, 0, 0.627451, 1, 1,
0.1646252, -1.594251, 2.223259, 0, 0.6235294, 1, 1,
0.1714012, 0.3799189, 0.7911318, 0, 0.6156863, 1, 1,
0.1793402, -2.181267, 4.019966, 0, 0.6117647, 1, 1,
0.1804194, -0.6015042, 2.635108, 0, 0.6039216, 1, 1,
0.184201, -1.095766, 2.392141, 0, 0.5960785, 1, 1,
0.1843031, -0.59485, 2.713718, 0, 0.5921569, 1, 1,
0.1922769, 0.927079, 0.6476634, 0, 0.5843138, 1, 1,
0.1923101, -2.157866, 2.887684, 0, 0.5803922, 1, 1,
0.1952482, 0.5244282, 0.9604231, 0, 0.572549, 1, 1,
0.1957671, 0.6947963, 0.3481378, 0, 0.5686275, 1, 1,
0.2006852, 0.8922624, 0.5680736, 0, 0.5607843, 1, 1,
0.2016476, -0.4653296, 1.083172, 0, 0.5568628, 1, 1,
0.2017607, 1.952209, -1.629908, 0, 0.5490196, 1, 1,
0.2035971, -2.328585, 0.6345251, 0, 0.5450981, 1, 1,
0.2069493, -1.557074, 3.898795, 0, 0.5372549, 1, 1,
0.2095827, 0.6520517, 0.8076976, 0, 0.5333334, 1, 1,
0.2110695, 0.9255651, -1.813515, 0, 0.5254902, 1, 1,
0.2130506, 1.136779, 0.3512037, 0, 0.5215687, 1, 1,
0.2196032, 0.1047006, 2.059476, 0, 0.5137255, 1, 1,
0.2202516, -0.1367165, 2.31282, 0, 0.509804, 1, 1,
0.2205039, 0.2626773, 1.640053, 0, 0.5019608, 1, 1,
0.2242474, -0.4297471, 2.639325, 0, 0.4941176, 1, 1,
0.2280953, 1.359101, 2.71595, 0, 0.4901961, 1, 1,
0.2290887, -1.588502, 2.991374, 0, 0.4823529, 1, 1,
0.2303171, 0.6444926, 1.8527, 0, 0.4784314, 1, 1,
0.2310661, 0.9378757, -0.2085601, 0, 0.4705882, 1, 1,
0.2313961, 1.702225, -0.02191141, 0, 0.4666667, 1, 1,
0.2325841, 1.737914, -1.102378, 0, 0.4588235, 1, 1,
0.2356089, -0.8356664, 3.251818, 0, 0.454902, 1, 1,
0.2357511, -0.5008854, 3.720366, 0, 0.4470588, 1, 1,
0.2399728, -0.2186833, 3.656762, 0, 0.4431373, 1, 1,
0.2417159, -1.398746, 2.986162, 0, 0.4352941, 1, 1,
0.2437653, 0.2429341, 2.818367, 0, 0.4313726, 1, 1,
0.2448014, 0.01606498, 2.300792, 0, 0.4235294, 1, 1,
0.2464062, 0.5174068, 0.3673003, 0, 0.4196078, 1, 1,
0.2470715, 0.2959595, 1.032226, 0, 0.4117647, 1, 1,
0.2479381, -0.8809834, 3.8869, 0, 0.4078431, 1, 1,
0.2495827, 1.851583, -0.6937302, 0, 0.4, 1, 1,
0.2513065, 0.2329451, 0.2209888, 0, 0.3921569, 1, 1,
0.2517236, 1.097065, 0.4956475, 0, 0.3882353, 1, 1,
0.2563645, 0.2565151, 1.292145, 0, 0.3803922, 1, 1,
0.2578983, -0.1834847, 3.8652, 0, 0.3764706, 1, 1,
0.2593278, -0.6201922, 3.787466, 0, 0.3686275, 1, 1,
0.2608819, -2.016376, 2.485682, 0, 0.3647059, 1, 1,
0.2614768, 0.2751692, -2.141893, 0, 0.3568628, 1, 1,
0.2617531, -0.4581491, 2.995704, 0, 0.3529412, 1, 1,
0.2678148, -0.1003137, 1.236568, 0, 0.345098, 1, 1,
0.2683126, 1.547542, 1.067108, 0, 0.3411765, 1, 1,
0.2686865, 1.003629, 1.086951, 0, 0.3333333, 1, 1,
0.2696247, -0.470007, 2.823875, 0, 0.3294118, 1, 1,
0.2703117, -0.5243967, 3.479101, 0, 0.3215686, 1, 1,
0.2704154, 0.9050567, -1.550037, 0, 0.3176471, 1, 1,
0.2704665, -0.4909587, 0.3468442, 0, 0.3098039, 1, 1,
0.2734624, -1.003538, 1.263427, 0, 0.3058824, 1, 1,
0.2761773, -0.4268857, 0.895789, 0, 0.2980392, 1, 1,
0.2782483, 0.5858702, 0.4618512, 0, 0.2901961, 1, 1,
0.2808936, -0.9122758, 2.5491, 0, 0.2862745, 1, 1,
0.281134, -0.8095654, 3.349784, 0, 0.2784314, 1, 1,
0.2855581, 1.348288, -0.1300063, 0, 0.2745098, 1, 1,
0.2858914, -0.02051347, 1.658555, 0, 0.2666667, 1, 1,
0.2866158, -0.183315, 0.8658215, 0, 0.2627451, 1, 1,
0.2885451, -1.030111, 1.704314, 0, 0.254902, 1, 1,
0.2896155, 0.7290601, -0.02871311, 0, 0.2509804, 1, 1,
0.2999467, -0.9391618, 4.604465, 0, 0.2431373, 1, 1,
0.3105429, 0.3371266, 2.650032, 0, 0.2392157, 1, 1,
0.3113897, 0.4611861, 1.28124, 0, 0.2313726, 1, 1,
0.3127593, 0.2086367, 1.408892, 0, 0.227451, 1, 1,
0.3130583, 0.5468072, 2.105958, 0, 0.2196078, 1, 1,
0.3147187, -1.19031, 0.7178541, 0, 0.2156863, 1, 1,
0.3148789, 0.288818, -0.3362313, 0, 0.2078431, 1, 1,
0.3152907, 0.7093707, -0.5264195, 0, 0.2039216, 1, 1,
0.3166785, 0.2650557, 0.4607578, 0, 0.1960784, 1, 1,
0.3193159, -0.08613429, 2.53866, 0, 0.1882353, 1, 1,
0.3239416, -0.8448916, 1.739609, 0, 0.1843137, 1, 1,
0.3259487, -1.253906, 3.289752, 0, 0.1764706, 1, 1,
0.3309773, 0.3795686, 2.280918, 0, 0.172549, 1, 1,
0.331423, -1.800734, 3.53335, 0, 0.1647059, 1, 1,
0.3334995, -1.108435, 3.557639, 0, 0.1607843, 1, 1,
0.3363665, -0.2770724, 2.568004, 0, 0.1529412, 1, 1,
0.3379461, 0.02681838, 0.9138179, 0, 0.1490196, 1, 1,
0.3389081, 1.154306, 1.196632, 0, 0.1411765, 1, 1,
0.3441631, 1.141415, -0.2103135, 0, 0.1372549, 1, 1,
0.3556817, 1.010458, 0.396892, 0, 0.1294118, 1, 1,
0.3560267, 1.234114, -0.4715722, 0, 0.1254902, 1, 1,
0.356424, -0.04536537, 1.211632, 0, 0.1176471, 1, 1,
0.3595276, 0.8627429, 0.5796664, 0, 0.1137255, 1, 1,
0.3602128, 0.9466488, -0.2459303, 0, 0.1058824, 1, 1,
0.3645112, 0.8118349, 0.1158953, 0, 0.09803922, 1, 1,
0.3685829, 0.1178592, 0.9471518, 0, 0.09411765, 1, 1,
0.368846, -0.6814282, 3.605863, 0, 0.08627451, 1, 1,
0.3691963, -0.3588957, 3.62413, 0, 0.08235294, 1, 1,
0.3750924, 1.723695, -0.7089524, 0, 0.07450981, 1, 1,
0.3812758, 0.62374, 1.274163, 0, 0.07058824, 1, 1,
0.3854403, -0.1823303, 1.886885, 0, 0.0627451, 1, 1,
0.3891706, 0.7971283, 1.70003, 0, 0.05882353, 1, 1,
0.3927079, -0.4434406, 3.417296, 0, 0.05098039, 1, 1,
0.3946981, -0.5612468, 2.859915, 0, 0.04705882, 1, 1,
0.3948917, -0.7200503, 0.3874843, 0, 0.03921569, 1, 1,
0.3995586, -0.8230649, 3.193181, 0, 0.03529412, 1, 1,
0.407957, -0.9729756, 2.141615, 0, 0.02745098, 1, 1,
0.4090687, 0.3814175, 2.374003, 0, 0.02352941, 1, 1,
0.4097911, -1.437475, 3.928692, 0, 0.01568628, 1, 1,
0.409945, -1.671955, 3.081219, 0, 0.01176471, 1, 1,
0.4118416, 0.4383294, 0.5301468, 0, 0.003921569, 1, 1,
0.4123555, 1.083226, 0.95485, 0.003921569, 0, 1, 1,
0.4157563, 1.296586, 0.02309951, 0.007843138, 0, 1, 1,
0.4188788, 0.8161175, 0.3158972, 0.01568628, 0, 1, 1,
0.4242074, 0.4724965, 0.9988897, 0.01960784, 0, 1, 1,
0.4249074, -1.480416, 2.72614, 0.02745098, 0, 1, 1,
0.4267024, 0.7871641, 1.095706, 0.03137255, 0, 1, 1,
0.4268449, 0.1218168, -1.013586, 0.03921569, 0, 1, 1,
0.4273097, 0.1497354, 2.487412, 0.04313726, 0, 1, 1,
0.4388608, 1.007224, 0.1385618, 0.05098039, 0, 1, 1,
0.4404731, -0.1390829, 0.9057196, 0.05490196, 0, 1, 1,
0.4499795, 0.387269, 1.981972, 0.0627451, 0, 1, 1,
0.4507447, 1.338898, -2.496485, 0.06666667, 0, 1, 1,
0.4513806, -0.849403, 3.592987, 0.07450981, 0, 1, 1,
0.4534647, -0.001382653, 0.9707013, 0.07843138, 0, 1, 1,
0.4557303, -0.6717044, 2.793013, 0.08627451, 0, 1, 1,
0.4584246, 0.5164689, 1.463161, 0.09019608, 0, 1, 1,
0.4612751, 0.7436967, 0.5319166, 0.09803922, 0, 1, 1,
0.4687101, -0.7646307, 2.404608, 0.1058824, 0, 1, 1,
0.4689417, -0.6367711, 1.120405, 0.1098039, 0, 1, 1,
0.4716938, 1.041943, 0.4587623, 0.1176471, 0, 1, 1,
0.4718101, -0.01972014, 2.947624, 0.1215686, 0, 1, 1,
0.4733344, -2.373908, 2.723729, 0.1294118, 0, 1, 1,
0.4798449, -1.189251, 3.509569, 0.1333333, 0, 1, 1,
0.4861036, 1.560491, 2.834096, 0.1411765, 0, 1, 1,
0.4865922, -0.07937975, 2.313979, 0.145098, 0, 1, 1,
0.4894288, 1.601618, 0.5145969, 0.1529412, 0, 1, 1,
0.4914577, -0.3377449, 1.361301, 0.1568628, 0, 1, 1,
0.4950804, 0.1703544, 2.20845, 0.1647059, 0, 1, 1,
0.4998256, 0.2742709, -0.2512805, 0.1686275, 0, 1, 1,
0.5021353, 0.07862776, 0.01094353, 0.1764706, 0, 1, 1,
0.5036534, 0.5680009, 2.043627, 0.1803922, 0, 1, 1,
0.5044278, 2.516872, 1.203826, 0.1882353, 0, 1, 1,
0.5111436, -1.287548, 1.659702, 0.1921569, 0, 1, 1,
0.5136739, -0.03141107, 1.04972, 0.2, 0, 1, 1,
0.5172902, -0.933031, 3.797304, 0.2078431, 0, 1, 1,
0.5179003, 0.5345351, 1.64137, 0.2117647, 0, 1, 1,
0.5197292, 2.313176, -1.236357, 0.2196078, 0, 1, 1,
0.5198665, -1.294675, 2.733423, 0.2235294, 0, 1, 1,
0.5217938, 1.133628, -0.2572512, 0.2313726, 0, 1, 1,
0.5226302, -0.4176781, 1.711376, 0.2352941, 0, 1, 1,
0.5261824, -0.1967288, -0.1452526, 0.2431373, 0, 1, 1,
0.527169, 0.6533609, -0.8587698, 0.2470588, 0, 1, 1,
0.528203, -0.8598343, 4.085937, 0.254902, 0, 1, 1,
0.5300238, 0.5331147, 0.6074622, 0.2588235, 0, 1, 1,
0.5340602, -0.3748103, 2.24018, 0.2666667, 0, 1, 1,
0.5387291, 3.216907, 0.6473458, 0.2705882, 0, 1, 1,
0.543334, -0.6716427, 3.775595, 0.2784314, 0, 1, 1,
0.5454818, 0.1940547, 2.433417, 0.282353, 0, 1, 1,
0.5502142, 2.744674, 0.8362143, 0.2901961, 0, 1, 1,
0.5510622, -0.7468799, 3.91651, 0.2941177, 0, 1, 1,
0.5511243, 1.020076, 3.50999, 0.3019608, 0, 1, 1,
0.5516302, 0.3865432, 2.580721, 0.3098039, 0, 1, 1,
0.558405, 0.9579058, -0.7140635, 0.3137255, 0, 1, 1,
0.5601367, -1.902175, 3.421399, 0.3215686, 0, 1, 1,
0.568294, -0.1077155, 2.166051, 0.3254902, 0, 1, 1,
0.5716672, -0.3214983, 3.636819, 0.3333333, 0, 1, 1,
0.5878908, 1.173964, 0.2110516, 0.3372549, 0, 1, 1,
0.5885854, 1.28861, 2.433534, 0.345098, 0, 1, 1,
0.5914709, 0.6986476, -0.06912022, 0.3490196, 0, 1, 1,
0.5974305, -2.142866, 4.073672, 0.3568628, 0, 1, 1,
0.6039515, -0.2155432, 1.48052, 0.3607843, 0, 1, 1,
0.6072964, -0.5241848, 1.80424, 0.3686275, 0, 1, 1,
0.6132071, 0.3496684, 1.21798, 0.372549, 0, 1, 1,
0.6167109, -1.416478, 3.273683, 0.3803922, 0, 1, 1,
0.620224, -0.04252482, 1.067667, 0.3843137, 0, 1, 1,
0.6202711, -0.8154224, 2.415366, 0.3921569, 0, 1, 1,
0.6231941, 1.12171, 0.3882754, 0.3960784, 0, 1, 1,
0.6266993, 0.2000239, 0.9595194, 0.4039216, 0, 1, 1,
0.6273388, -1.754333, 2.215237, 0.4117647, 0, 1, 1,
0.627622, -2.395334, 2.452726, 0.4156863, 0, 1, 1,
0.6359459, -0.5158037, 4.14742, 0.4235294, 0, 1, 1,
0.637591, -0.3127506, 1.627915, 0.427451, 0, 1, 1,
0.6424744, 1.427775, -0.02744765, 0.4352941, 0, 1, 1,
0.6459048, -0.1218979, 1.74987, 0.4392157, 0, 1, 1,
0.6463394, 0.8751012, 1.385064, 0.4470588, 0, 1, 1,
0.6496962, -0.23623, 1.882132, 0.4509804, 0, 1, 1,
0.6519826, -0.221731, 2.275338, 0.4588235, 0, 1, 1,
0.6537271, -1.134409, 2.732361, 0.4627451, 0, 1, 1,
0.6552998, 0.631335, -0.1779839, 0.4705882, 0, 1, 1,
0.6567256, -1.134859, 3.004266, 0.4745098, 0, 1, 1,
0.6624491, -0.8637617, 1.8643, 0.4823529, 0, 1, 1,
0.674844, 0.7970027, 1.262819, 0.4862745, 0, 1, 1,
0.6804659, 0.08728965, 2.32273, 0.4941176, 0, 1, 1,
0.6844871, 0.6735445, 2.599635, 0.5019608, 0, 1, 1,
0.689409, 0.2613143, 2.256151, 0.5058824, 0, 1, 1,
0.7030018, 0.5102615, 0.4339751, 0.5137255, 0, 1, 1,
0.7056777, -0.1194281, 2.66611, 0.5176471, 0, 1, 1,
0.7116724, 0.0526236, 2.395398, 0.5254902, 0, 1, 1,
0.7151196, 1.391521, -0.4852339, 0.5294118, 0, 1, 1,
0.7171236, 0.1526104, -0.5432106, 0.5372549, 0, 1, 1,
0.7174773, -0.7051266, 1.501138, 0.5411765, 0, 1, 1,
0.719979, -0.1679148, 2.407376, 0.5490196, 0, 1, 1,
0.7206145, -0.2281433, 2.379749, 0.5529412, 0, 1, 1,
0.7276236, 0.5149304, 0.9271402, 0.5607843, 0, 1, 1,
0.7282571, -1.773771, 4.036221, 0.5647059, 0, 1, 1,
0.7307969, -0.3506512, 2.341978, 0.572549, 0, 1, 1,
0.7375062, -0.1319898, 2.993554, 0.5764706, 0, 1, 1,
0.7400521, -0.003553753, 1.560555, 0.5843138, 0, 1, 1,
0.741842, -1.511103, 1.940966, 0.5882353, 0, 1, 1,
0.7419183, 0.6669664, 0.8659682, 0.5960785, 0, 1, 1,
0.7456075, -1.742339, 2.837168, 0.6039216, 0, 1, 1,
0.7564331, 2.448809, 1.077461, 0.6078432, 0, 1, 1,
0.759613, -1.124122, 1.956727, 0.6156863, 0, 1, 1,
0.7646971, 0.7772596, 1.945163, 0.6196079, 0, 1, 1,
0.7654825, -1.085486, 2.203298, 0.627451, 0, 1, 1,
0.7706524, -1.766839, 2.666842, 0.6313726, 0, 1, 1,
0.7760793, 1.12502, -0.3111222, 0.6392157, 0, 1, 1,
0.7803181, -0.4199154, 2.163927, 0.6431373, 0, 1, 1,
0.7856941, 0.5744674, -0.5182133, 0.6509804, 0, 1, 1,
0.786283, 0.8306384, -0.05465021, 0.654902, 0, 1, 1,
0.7878032, 0.6405028, 0.125911, 0.6627451, 0, 1, 1,
0.7919919, -0.0171218, 1.218315, 0.6666667, 0, 1, 1,
0.7964035, 1.199451, -0.7954188, 0.6745098, 0, 1, 1,
0.7965177, 0.717972, 2.217856, 0.6784314, 0, 1, 1,
0.7971532, 0.3713748, 1.271798, 0.6862745, 0, 1, 1,
0.7998198, 2.221718, 0.3762444, 0.6901961, 0, 1, 1,
0.8025953, -1.544765, 1.955144, 0.6980392, 0, 1, 1,
0.8048548, 1.306314, -0.5258656, 0.7058824, 0, 1, 1,
0.8063146, 0.7985089, 0.07863966, 0.7098039, 0, 1, 1,
0.808082, 1.140242, 0.3178311, 0.7176471, 0, 1, 1,
0.8093002, -1.18613, 4.352775, 0.7215686, 0, 1, 1,
0.8114731, 1.614644, 1.987156, 0.7294118, 0, 1, 1,
0.8175124, 0.7488331, -0.8805227, 0.7333333, 0, 1, 1,
0.8191421, -0.4929951, 2.909934, 0.7411765, 0, 1, 1,
0.8225484, 0.1281386, 3.138889, 0.7450981, 0, 1, 1,
0.8248993, 0.2261494, 2.495636, 0.7529412, 0, 1, 1,
0.8257673, 2.015272, 1.268564, 0.7568628, 0, 1, 1,
0.8338236, 0.1702918, 0.4535581, 0.7647059, 0, 1, 1,
0.8374764, 1.178536, 0.1661322, 0.7686275, 0, 1, 1,
0.8485556, -1.050026, 2.083114, 0.7764706, 0, 1, 1,
0.8494555, -0.2178191, 2.004561, 0.7803922, 0, 1, 1,
0.8543457, -0.1735951, 2.650622, 0.7882353, 0, 1, 1,
0.8544248, -1.17894, 1.43216, 0.7921569, 0, 1, 1,
0.8554718, -0.3357482, 2.72689, 0.8, 0, 1, 1,
0.8601035, 0.5841282, 1.260625, 0.8078431, 0, 1, 1,
0.8605208, 0.3097263, 2.284542, 0.8117647, 0, 1, 1,
0.8613725, 0.5593174, 0.4884166, 0.8196079, 0, 1, 1,
0.8615277, -0.5662314, 1.077825, 0.8235294, 0, 1, 1,
0.8691346, -0.7902088, 3.515024, 0.8313726, 0, 1, 1,
0.8710214, -1.995455, 2.693999, 0.8352941, 0, 1, 1,
0.8715888, 0.2363828, 3.035849, 0.8431373, 0, 1, 1,
0.8721825, 0.1476199, 1.902202, 0.8470588, 0, 1, 1,
0.8772839, 0.7421737, 0.7874326, 0.854902, 0, 1, 1,
0.8774731, -0.8106703, 1.00531, 0.8588235, 0, 1, 1,
0.878746, -1.409019, 2.458013, 0.8666667, 0, 1, 1,
0.8812261, -1.127013, 1.593415, 0.8705882, 0, 1, 1,
0.8824608, -1.145272, 2.283956, 0.8784314, 0, 1, 1,
0.8845628, 1.778503, 1.324531, 0.8823529, 0, 1, 1,
0.8858823, -0.4250806, 3.508318, 0.8901961, 0, 1, 1,
0.8951271, -0.8883265, 1.202855, 0.8941177, 0, 1, 1,
0.9118631, -0.4647838, 2.415137, 0.9019608, 0, 1, 1,
0.9156474, -0.3451311, 2.224854, 0.9098039, 0, 1, 1,
0.921114, -0.4427023, 2.128461, 0.9137255, 0, 1, 1,
0.9211701, 1.250197, 1.613267, 0.9215686, 0, 1, 1,
0.9224348, -1.029853, 1.370572, 0.9254902, 0, 1, 1,
0.9301811, -0.1346718, 1.89822, 0.9333333, 0, 1, 1,
0.9406889, 0.7124302, 0.298244, 0.9372549, 0, 1, 1,
0.9435555, 0.9557779, 0.1442035, 0.945098, 0, 1, 1,
0.9471188, 0.04120885, 2.805527, 0.9490196, 0, 1, 1,
0.9476695, -0.3051645, 1.855585, 0.9568627, 0, 1, 1,
0.9528092, 0.4811333, 1.771259, 0.9607843, 0, 1, 1,
0.9548737, -0.6371129, 2.91589, 0.9686275, 0, 1, 1,
0.9619532, -0.6138217, 1.102561, 0.972549, 0, 1, 1,
0.9641836, -0.2459417, 0.9973143, 0.9803922, 0, 1, 1,
0.9685917, -0.6692834, 2.9868, 0.9843137, 0, 1, 1,
0.9702384, -0.07764076, 2.073689, 0.9921569, 0, 1, 1,
0.9756476, 0.1414884, 1.343413, 0.9960784, 0, 1, 1,
0.9787024, -0.8430383, 0.7964092, 1, 0, 0.9960784, 1,
0.9832674, -0.2859332, 2.381068, 1, 0, 0.9882353, 1,
0.9841526, 0.2532459, 0.6795576, 1, 0, 0.9843137, 1,
0.9855092, 0.09880559, -0.153166, 1, 0, 0.9764706, 1,
0.9896245, -0.7448254, 1.432128, 1, 0, 0.972549, 1,
0.9930336, 0.3477956, 2.830754, 1, 0, 0.9647059, 1,
0.9955826, 0.1522989, 1.461446, 1, 0, 0.9607843, 1,
1.000225, -0.2624894, 4.645872, 1, 0, 0.9529412, 1,
1.003111, -1.743131, 4.055069, 1, 0, 0.9490196, 1,
1.0052, -0.2236646, 3.265401, 1, 0, 0.9411765, 1,
1.006595, 0.7584315, -0.3065539, 1, 0, 0.9372549, 1,
1.011297, 1.522528, -0.6539678, 1, 0, 0.9294118, 1,
1.012091, 0.03699626, 0.7111744, 1, 0, 0.9254902, 1,
1.015997, -0.1545062, 1.945969, 1, 0, 0.9176471, 1,
1.016215, 0.7928962, 0.4109839, 1, 0, 0.9137255, 1,
1.028704, -1.301903, 2.652969, 1, 0, 0.9058824, 1,
1.030989, 0.5643569, 0.6464537, 1, 0, 0.9019608, 1,
1.041021, -1.817269, 5.873134, 1, 0, 0.8941177, 1,
1.04596, -0.5588775, 2.225966, 1, 0, 0.8862745, 1,
1.047905, 0.5425152, 2.214645, 1, 0, 0.8823529, 1,
1.051456, -1.035363, 3.09895, 1, 0, 0.8745098, 1,
1.052459, 0.287527, 0.9875172, 1, 0, 0.8705882, 1,
1.056933, -1.225431, 2.605128, 1, 0, 0.8627451, 1,
1.057941, 0.8419758, 0.2990698, 1, 0, 0.8588235, 1,
1.058275, -0.2527229, 2.183066, 1, 0, 0.8509804, 1,
1.058513, 0.4319082, -0.07411842, 1, 0, 0.8470588, 1,
1.065755, 0.6694922, -0.04272066, 1, 0, 0.8392157, 1,
1.070002, -1.02027, 0.9203337, 1, 0, 0.8352941, 1,
1.073723, -0.3547705, 0.3678445, 1, 0, 0.827451, 1,
1.074765, 0.8265261, 1.185748, 1, 0, 0.8235294, 1,
1.079774, 3.164452, 1.024647, 1, 0, 0.8156863, 1,
1.080775, 3.360375, -0.1383704, 1, 0, 0.8117647, 1,
1.080857, -1.186378, 3.04122, 1, 0, 0.8039216, 1,
1.085362, -0.6188268, 2.222503, 1, 0, 0.7960784, 1,
1.08624, -1.26583, 3.048769, 1, 0, 0.7921569, 1,
1.090066, -1.599141, 3.461506, 1, 0, 0.7843137, 1,
1.095804, 1.313423, 1.100793, 1, 0, 0.7803922, 1,
1.096745, 0.4885144, 0.5282637, 1, 0, 0.772549, 1,
1.097011, -0.5585813, 3.875257, 1, 0, 0.7686275, 1,
1.097962, 1.255028, -0.03197464, 1, 0, 0.7607843, 1,
1.106763, -1.987141, 2.513655, 1, 0, 0.7568628, 1,
1.115092, -1.427577, 3.877444, 1, 0, 0.7490196, 1,
1.126727, -0.3203506, 0.5897653, 1, 0, 0.7450981, 1,
1.128773, 1.492828, 1.529934, 1, 0, 0.7372549, 1,
1.142156, 1.33015, 1.067854, 1, 0, 0.7333333, 1,
1.146597, -0.6093001, 1.256525, 1, 0, 0.7254902, 1,
1.150343, 1.345572, 0.6514848, 1, 0, 0.7215686, 1,
1.152741, 0.433655, 1.748305, 1, 0, 0.7137255, 1,
1.171226, -0.1943735, 0.9887359, 1, 0, 0.7098039, 1,
1.173857, 0.9899895, -0.6994013, 1, 0, 0.7019608, 1,
1.177873, -1.358104, 2.626299, 1, 0, 0.6941177, 1,
1.179126, 2.209245, 1.675072, 1, 0, 0.6901961, 1,
1.18304, 0.3576162, 0.7355996, 1, 0, 0.682353, 1,
1.183633, -0.03046487, 3.018395, 1, 0, 0.6784314, 1,
1.195618, 1.794484, 0.8549361, 1, 0, 0.6705883, 1,
1.211998, -0.8006917, 0.6554052, 1, 0, 0.6666667, 1,
1.216128, -0.08631178, 0.4860427, 1, 0, 0.6588235, 1,
1.218524, -0.9445879, 2.264012, 1, 0, 0.654902, 1,
1.221798, -2.220924, 2.702187, 1, 0, 0.6470588, 1,
1.227812, -1.147079, 2.014243, 1, 0, 0.6431373, 1,
1.233311, -0.9208858, 3.107658, 1, 0, 0.6352941, 1,
1.246968, 0.2030424, 2.193729, 1, 0, 0.6313726, 1,
1.247512, -1.667947, 1.829028, 1, 0, 0.6235294, 1,
1.260629, 0.7163308, 1.973571, 1, 0, 0.6196079, 1,
1.268604, -2.076343, 1.893783, 1, 0, 0.6117647, 1,
1.268797, -1.294965, 1.627221, 1, 0, 0.6078432, 1,
1.269414, -0.6032254, 2.472554, 1, 0, 0.6, 1,
1.27126, 1.381691, 0.8645467, 1, 0, 0.5921569, 1,
1.286197, -1.538444, 1.441301, 1, 0, 0.5882353, 1,
1.292294, 0.382093, 0.8538564, 1, 0, 0.5803922, 1,
1.29445, -1.008797, 2.493176, 1, 0, 0.5764706, 1,
1.294625, 0.2709586, 0.02067139, 1, 0, 0.5686275, 1,
1.297442, 0.7366406, -0.2686569, 1, 0, 0.5647059, 1,
1.303088, 0.5366931, 1.837903, 1, 0, 0.5568628, 1,
1.314125, 1.639658, -0.4438279, 1, 0, 0.5529412, 1,
1.316208, 0.6318148, 1.018455, 1, 0, 0.5450981, 1,
1.316668, -1.065438, 1.892121, 1, 0, 0.5411765, 1,
1.332113, 0.318498, 2.078109, 1, 0, 0.5333334, 1,
1.347165, 0.2664425, 1.229269, 1, 0, 0.5294118, 1,
1.350983, -0.5178313, 3.301147, 1, 0, 0.5215687, 1,
1.352675, 1.175793, 2.764017, 1, 0, 0.5176471, 1,
1.35369, -0.9793904, 4.798201, 1, 0, 0.509804, 1,
1.353784, -0.5666722, 2.092736, 1, 0, 0.5058824, 1,
1.362305, 1.357445, 0.3058406, 1, 0, 0.4980392, 1,
1.370286, -0.2252719, 1.276412, 1, 0, 0.4901961, 1,
1.380031, -1.173818, 2.445647, 1, 0, 0.4862745, 1,
1.381615, -1.810408, 3.996211, 1, 0, 0.4784314, 1,
1.387717, 0.6670063, 0.411415, 1, 0, 0.4745098, 1,
1.389718, -0.347497, 1.748452, 1, 0, 0.4666667, 1,
1.391093, -1.047712, 1.079382, 1, 0, 0.4627451, 1,
1.3934, -0.1158947, 2.258327, 1, 0, 0.454902, 1,
1.396301, 0.06654767, 3.019997, 1, 0, 0.4509804, 1,
1.398913, 0.74225, 0.5175885, 1, 0, 0.4431373, 1,
1.400332, -0.3502233, 3.073986, 1, 0, 0.4392157, 1,
1.405556, -0.8858225, 1.629191, 1, 0, 0.4313726, 1,
1.408345, -0.2227693, 0.4468888, 1, 0, 0.427451, 1,
1.411486, 0.08259794, 0.4427672, 1, 0, 0.4196078, 1,
1.418932, 1.104255, 0.5960279, 1, 0, 0.4156863, 1,
1.422555, -0.9711941, 1.410399, 1, 0, 0.4078431, 1,
1.434731, 2.633277, 0.3189951, 1, 0, 0.4039216, 1,
1.436992, 1.536123, 0.5896196, 1, 0, 0.3960784, 1,
1.443027, 2.231581, 1.223775, 1, 0, 0.3882353, 1,
1.446985, 0.4586157, 1.524948, 1, 0, 0.3843137, 1,
1.455852, -2.009678, 1.424027, 1, 0, 0.3764706, 1,
1.461074, 0.5905809, 1.746839, 1, 0, 0.372549, 1,
1.466862, 0.8489296, 0.9290659, 1, 0, 0.3647059, 1,
1.497636, 0.0833848, 1.098189, 1, 0, 0.3607843, 1,
1.504282, -0.8742232, 2.989854, 1, 0, 0.3529412, 1,
1.516331, 0.2590517, 0.1356437, 1, 0, 0.3490196, 1,
1.517692, 0.5169364, 2.166933, 1, 0, 0.3411765, 1,
1.517839, -0.4267985, 2.696441, 1, 0, 0.3372549, 1,
1.518212, 0.4616356, 1.432921, 1, 0, 0.3294118, 1,
1.521949, -1.439323, 1.494759, 1, 0, 0.3254902, 1,
1.528166, 0.9839656, 1.804702, 1, 0, 0.3176471, 1,
1.532885, -2.920611, 2.391269, 1, 0, 0.3137255, 1,
1.540032, -1.078208, 2.007024, 1, 0, 0.3058824, 1,
1.550751, -1.212161, 2.782762, 1, 0, 0.2980392, 1,
1.553241, -1.680496, 2.329929, 1, 0, 0.2941177, 1,
1.593897, -1.152317, 3.654432, 1, 0, 0.2862745, 1,
1.594518, 0.7640652, 0.0775484, 1, 0, 0.282353, 1,
1.604988, 1.878109, -0.8805704, 1, 0, 0.2745098, 1,
1.606002, 0.0513506, 3.620456, 1, 0, 0.2705882, 1,
1.606633, 0.2465348, 1.922161, 1, 0, 0.2627451, 1,
1.619748, 0.4133872, 3.577939, 1, 0, 0.2588235, 1,
1.622111, -0.8025554, 2.069896, 1, 0, 0.2509804, 1,
1.636451, -0.1299822, 2.408926, 1, 0, 0.2470588, 1,
1.638245, 0.6622742, 1.577448, 1, 0, 0.2392157, 1,
1.676103, 1.641681, 0.1581268, 1, 0, 0.2352941, 1,
1.684412, -1.267334, 1.241681, 1, 0, 0.227451, 1,
1.717083, 0.6521207, 1.741108, 1, 0, 0.2235294, 1,
1.724998, -0.7639895, 2.119542, 1, 0, 0.2156863, 1,
1.742363, 0.8108649, 0.1246009, 1, 0, 0.2117647, 1,
1.759065, 1.967385, 0.3347307, 1, 0, 0.2039216, 1,
1.759707, 1.470629, -0.3875618, 1, 0, 0.1960784, 1,
1.761073, -0.6797096, 2.066702, 1, 0, 0.1921569, 1,
1.770276, 0.963259, 0.1104443, 1, 0, 0.1843137, 1,
1.779304, -0.6567382, 1.634364, 1, 0, 0.1803922, 1,
1.780123, 2.637682, 0.1988502, 1, 0, 0.172549, 1,
1.793686, -1.063341, 1.100259, 1, 0, 0.1686275, 1,
1.818635, -0.7025881, 1.158267, 1, 0, 0.1607843, 1,
1.854799, -2.102757, 1.846253, 1, 0, 0.1568628, 1,
1.882363, -0.7024276, 2.842096, 1, 0, 0.1490196, 1,
1.895277, 1.429525, 1.158247, 1, 0, 0.145098, 1,
1.896762, 2.140349, -0.5859898, 1, 0, 0.1372549, 1,
1.916406, -0.6301373, 3.450322, 1, 0, 0.1333333, 1,
1.933046, -0.7028176, 2.728536, 1, 0, 0.1254902, 1,
1.937735, -1.092871, 2.249021, 1, 0, 0.1215686, 1,
1.982738, -0.7667792, 1.832447, 1, 0, 0.1137255, 1,
2.001576, -0.2290885, 0.9020868, 1, 0, 0.1098039, 1,
2.028495, -0.3708758, 2.95818, 1, 0, 0.1019608, 1,
2.043743, -0.4516028, 1.838556, 1, 0, 0.09411765, 1,
2.050876, -1.236825, 2.745049, 1, 0, 0.09019608, 1,
2.095745, 0.3262538, 2.420725, 1, 0, 0.08235294, 1,
2.104617, 1.698149, -0.7348302, 1, 0, 0.07843138, 1,
2.141739, 0.2185066, 2.239851, 1, 0, 0.07058824, 1,
2.154791, 0.1368052, 0.3930066, 1, 0, 0.06666667, 1,
2.221184, -0.8198875, 4.111987, 1, 0, 0.05882353, 1,
2.224127, -0.9616028, 2.120656, 1, 0, 0.05490196, 1,
2.349307, 0.9199422, -0.01882137, 1, 0, 0.04705882, 1,
2.366449, 0.6296976, 1.243596, 1, 0, 0.04313726, 1,
2.372113, -0.2826999, 2.3161, 1, 0, 0.03529412, 1,
2.406005, -0.9590971, 2.157241, 1, 0, 0.03137255, 1,
2.429278, 0.5918305, 1.616692, 1, 0, 0.02352941, 1,
2.647002, 1.719178, -0.4775056, 1, 0, 0.01960784, 1,
2.710593, -0.6623753, 0.9636744, 1, 0, 0.01176471, 1,
3.249088, 0.8474114, 0.72126, 1, 0, 0.007843138, 1
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
-0.2088109, -4.067924, -8.053486, 0, -0.5, 0.5, 0.5,
-0.2088109, -4.067924, -8.053486, 1, -0.5, 0.5, 0.5,
-0.2088109, -4.067924, -8.053486, 1, 1.5, 0.5, 0.5,
-0.2088109, -4.067924, -8.053486, 0, 1.5, 0.5, 0.5
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
-4.838938, 0.1845311, -8.053486, 0, -0.5, 0.5, 0.5,
-4.838938, 0.1845311, -8.053486, 1, -0.5, 0.5, 0.5,
-4.838938, 0.1845311, -8.053486, 1, 1.5, 0.5, 0.5,
-4.838938, 0.1845311, -8.053486, 0, 1.5, 0.5, 0.5
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
-4.838938, -4.067924, -0.08095765, 0, -0.5, 0.5, 0.5,
-4.838938, -4.067924, -0.08095765, 1, -0.5, 0.5, 0.5,
-4.838938, -4.067924, -0.08095765, 1, 1.5, 0.5, 0.5,
-4.838938, -4.067924, -0.08095765, 0, 1.5, 0.5, 0.5
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
-3, -3.086588, -6.213672,
3, -3.086588, -6.213672,
-3, -3.086588, -6.213672,
-3, -3.250144, -6.520308,
-2, -3.086588, -6.213672,
-2, -3.250144, -6.520308,
-1, -3.086588, -6.213672,
-1, -3.250144, -6.520308,
0, -3.086588, -6.213672,
0, -3.250144, -6.520308,
1, -3.086588, -6.213672,
1, -3.250144, -6.520308,
2, -3.086588, -6.213672,
2, -3.250144, -6.520308,
3, -3.086588, -6.213672,
3, -3.250144, -6.520308
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
-3, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
-3, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
-3, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
-3, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
-2, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
-2, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
-2, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
-2, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
-1, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
-1, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
-1, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
-1, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
0, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
0, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
0, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
0, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
1, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
1, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
1, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
1, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
2, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
2, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
2, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
2, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5,
3, -3.577256, -7.133579, 0, -0.5, 0.5, 0.5,
3, -3.577256, -7.133579, 1, -0.5, 0.5, 0.5,
3, -3.577256, -7.133579, 1, 1.5, 0.5, 0.5,
3, -3.577256, -7.133579, 0, 1.5, 0.5, 0.5
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
-3.770447, -2, -6.213672,
-3.770447, 3, -6.213672,
-3.770447, -2, -6.213672,
-3.948529, -2, -6.520308,
-3.770447, -1, -6.213672,
-3.948529, -1, -6.520308,
-3.770447, 0, -6.213672,
-3.948529, 0, -6.520308,
-3.770447, 1, -6.213672,
-3.948529, 1, -6.520308,
-3.770447, 2, -6.213672,
-3.948529, 2, -6.520308,
-3.770447, 3, -6.213672,
-3.948529, 3, -6.520308
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
-4.304692, -2, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, -2, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, -2, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, -2, -7.133579, 0, 1.5, 0.5, 0.5,
-4.304692, -1, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, -1, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, -1, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, -1, -7.133579, 0, 1.5, 0.5, 0.5,
-4.304692, 0, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, 0, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, 0, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, 0, -7.133579, 0, 1.5, 0.5, 0.5,
-4.304692, 1, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, 1, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, 1, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, 1, -7.133579, 0, 1.5, 0.5, 0.5,
-4.304692, 2, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, 2, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, 2, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, 2, -7.133579, 0, 1.5, 0.5, 0.5,
-4.304692, 3, -7.133579, 0, -0.5, 0.5, 0.5,
-4.304692, 3, -7.133579, 1, -0.5, 0.5, 0.5,
-4.304692, 3, -7.133579, 1, 1.5, 0.5, 0.5,
-4.304692, 3, -7.133579, 0, 1.5, 0.5, 0.5
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
-3.770447, -3.086588, -6,
-3.770447, -3.086588, 4,
-3.770447, -3.086588, -6,
-3.948529, -3.250144, -6,
-3.770447, -3.086588, -4,
-3.948529, -3.250144, -4,
-3.770447, -3.086588, -2,
-3.948529, -3.250144, -2,
-3.770447, -3.086588, 0,
-3.948529, -3.250144, 0,
-3.770447, -3.086588, 2,
-3.948529, -3.250144, 2,
-3.770447, -3.086588, 4,
-3.948529, -3.250144, 4
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
-4.304692, -3.577256, -6, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -6, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -6, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, -6, 0, 1.5, 0.5, 0.5,
-4.304692, -3.577256, -4, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -4, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -4, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, -4, 0, 1.5, 0.5, 0.5,
-4.304692, -3.577256, -2, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -2, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, -2, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, -2, 0, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 0, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 0, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 0, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 0, 0, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 2, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 2, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 2, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 2, 0, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 4, 0, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 4, 1, -0.5, 0.5, 0.5,
-4.304692, -3.577256, 4, 1, 1.5, 0.5, 0.5,
-4.304692, -3.577256, 4, 0, 1.5, 0.5, 0.5
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
-3.770447, -3.086588, -6.213672,
-3.770447, 3.45565, -6.213672,
-3.770447, -3.086588, 6.051756,
-3.770447, 3.45565, 6.051756,
-3.770447, -3.086588, -6.213672,
-3.770447, -3.086588, 6.051756,
-3.770447, 3.45565, -6.213672,
-3.770447, 3.45565, 6.051756,
-3.770447, -3.086588, -6.213672,
3.352825, -3.086588, -6.213672,
-3.770447, -3.086588, 6.051756,
3.352825, -3.086588, 6.051756,
-3.770447, 3.45565, -6.213672,
3.352825, 3.45565, -6.213672,
-3.770447, 3.45565, 6.051756,
3.352825, 3.45565, 6.051756,
3.352825, -3.086588, -6.213672,
3.352825, 3.45565, -6.213672,
3.352825, -3.086588, 6.051756,
3.352825, 3.45565, 6.051756,
3.352825, -3.086588, -6.213672,
3.352825, -3.086588, 6.051756,
3.352825, 3.45565, -6.213672,
3.352825, 3.45565, 6.051756
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
var radius = 8.340746;
var distance = 37.10892;
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
mvMatrix.translate( 0.2088109, -0.1845311, 0.08095765 );
mvMatrix.scale( 1.266016, 1.378455, 0.7352518 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.10892);
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
dibromethen<-read.table("dibromethen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dibromethen$V2
```

```
## Error in eval(expr, envir, enclos): object 'dibromethen' not found
```

```r
y<-dibromethen$V3
```

```
## Error in eval(expr, envir, enclos): object 'dibromethen' not found
```

```r
z<-dibromethen$V4
```

```
## Error in eval(expr, envir, enclos): object 'dibromethen' not found
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
-3.66671, -1.875075, 0.1134443, 0, 0, 1, 1, 1,
-2.899255, -0.2915961, -2.057434, 1, 0, 0, 1, 1,
-2.765607, 0.197202, -2.998181, 1, 0, 0, 1, 1,
-2.679374, -2.991313, -4.363869, 1, 0, 0, 1, 1,
-2.472195, -1.210675, -1.841549, 1, 0, 0, 1, 1,
-2.42048, 0.3666161, -1.053597, 1, 0, 0, 1, 1,
-2.328569, -2.263203, -2.119282, 0, 0, 0, 1, 1,
-2.323471, 0.1646381, -1.319797, 0, 0, 0, 1, 1,
-2.278592, -1.00889, -1.08074, 0, 0, 0, 1, 1,
-2.265537, -0.554263, -2.713029, 0, 0, 0, 1, 1,
-2.220634, 2.3388, -1.641144, 0, 0, 0, 1, 1,
-2.217969, 0.358017, -2.063523, 0, 0, 0, 1, 1,
-2.176798, -0.7773938, -1.773667, 0, 0, 0, 1, 1,
-2.136271, 0.8775043, -1.434679, 1, 1, 1, 1, 1,
-2.118165, -1.070765, -1.765089, 1, 1, 1, 1, 1,
-2.090344, 1.862648, 0.9098078, 1, 1, 1, 1, 1,
-2.049205, 0.09411474, -0.4048659, 1, 1, 1, 1, 1,
-2.028068, 0.7867573, -1.256343, 1, 1, 1, 1, 1,
-2.017989, 0.4202442, -0.6670363, 1, 1, 1, 1, 1,
-2.016752, -0.3991516, 0.259807, 1, 1, 1, 1, 1,
-2.01554, 0.7684844, -2.148302, 1, 1, 1, 1, 1,
-2.009068, -0.7045141, -1.609559, 1, 1, 1, 1, 1,
-2.000028, -0.9074024, -1.908158, 1, 1, 1, 1, 1,
-1.985484, -0.9693508, -2.791276, 1, 1, 1, 1, 1,
-1.952566, -2.802058, -2.037478, 1, 1, 1, 1, 1,
-1.914237, -1.73802, -3.277605, 1, 1, 1, 1, 1,
-1.89829, 0.03285449, -1.254407, 1, 1, 1, 1, 1,
-1.883088, 0.9338658, -1.025244, 1, 1, 1, 1, 1,
-1.86813, 0.8478805, -1.533119, 0, 0, 1, 1, 1,
-1.856282, -1.576209, -2.009328, 1, 0, 0, 1, 1,
-1.836853, -0.1728733, -4.245355, 1, 0, 0, 1, 1,
-1.835544, 0.2675302, -2.458478, 1, 0, 0, 1, 1,
-1.831531, 0.5383773, -2.410002, 1, 0, 0, 1, 1,
-1.80521, -0.2270735, -1.149514, 1, 0, 0, 1, 1,
-1.782963, -2.166449, -2.05569, 0, 0, 0, 1, 1,
-1.779609, 0.1884721, -0.3777867, 0, 0, 0, 1, 1,
-1.778256, -0.3698782, -0.9270532, 0, 0, 0, 1, 1,
-1.773941, -0.06556096, -0.9096725, 0, 0, 0, 1, 1,
-1.736477, -0.5693477, -2.562909, 0, 0, 0, 1, 1,
-1.719063, 0.3261844, -1.410255, 0, 0, 0, 1, 1,
-1.703772, 0.3963909, -1.350472, 0, 0, 0, 1, 1,
-1.654535, -2.298657, -2.037121, 1, 1, 1, 1, 1,
-1.652549, -1.057536, -2.807687, 1, 1, 1, 1, 1,
-1.649641, -1.04714, -2.133171, 1, 1, 1, 1, 1,
-1.649497, -0.8486389, -1.619861, 1, 1, 1, 1, 1,
-1.635855, -0.07901186, -3.169047, 1, 1, 1, 1, 1,
-1.626552, -2.38019, -2.038738, 1, 1, 1, 1, 1,
-1.620671, -1.073249, -3.05699, 1, 1, 1, 1, 1,
-1.610291, 1.957614, -1.678546, 1, 1, 1, 1, 1,
-1.595416, 1.098997, -0.7675356, 1, 1, 1, 1, 1,
-1.592091, 0.3193752, -1.952252, 1, 1, 1, 1, 1,
-1.568573, 0.831885, -1.958955, 1, 1, 1, 1, 1,
-1.562594, 0.7126628, -1.691073, 1, 1, 1, 1, 1,
-1.559388, 0.1147121, -1.982147, 1, 1, 1, 1, 1,
-1.555309, -0.3685076, -4.261963, 1, 1, 1, 1, 1,
-1.55187, 0.4418093, -0.6744631, 1, 1, 1, 1, 1,
-1.547912, -0.9303545, -2.210822, 0, 0, 1, 1, 1,
-1.547603, 0.6380807, -1.738355, 1, 0, 0, 1, 1,
-1.546686, -0.456642, 0.03569455, 1, 0, 0, 1, 1,
-1.53768, 1.398413, 0.0273131, 1, 0, 0, 1, 1,
-1.535219, -0.09438078, -3.098291, 1, 0, 0, 1, 1,
-1.535061, -1.705685, -3.02601, 1, 0, 0, 1, 1,
-1.532648, -1.199292, -0.5557771, 0, 0, 0, 1, 1,
-1.528544, 0.3756134, -2.415111, 0, 0, 0, 1, 1,
-1.520299, -1.601346, -3.400856, 0, 0, 0, 1, 1,
-1.516914, 0.003719418, -0.3930626, 0, 0, 0, 1, 1,
-1.50551, -0.3806892, -1.882411, 0, 0, 0, 1, 1,
-1.48866, 0.9641068, -0.3388208, 0, 0, 0, 1, 1,
-1.479361, 1.299287, -0.9335089, 0, 0, 0, 1, 1,
-1.477086, -1.313509, -3.216037, 1, 1, 1, 1, 1,
-1.470929, 0.5976529, 0.8825843, 1, 1, 1, 1, 1,
-1.46515, -0.05593108, -2.934372, 1, 1, 1, 1, 1,
-1.459336, 0.3214215, -2.601222, 1, 1, 1, 1, 1,
-1.449786, 0.2166987, -2.469462, 1, 1, 1, 1, 1,
-1.442049, -0.7040277, -2.774086, 1, 1, 1, 1, 1,
-1.436, -0.1032503, -2.530169, 1, 1, 1, 1, 1,
-1.431942, -0.7919379, -2.235935, 1, 1, 1, 1, 1,
-1.430306, -2.10704, -3.097641, 1, 1, 1, 1, 1,
-1.415501, -0.9561882, -1.418327, 1, 1, 1, 1, 1,
-1.41429, 0.3505964, -1.06054, 1, 1, 1, 1, 1,
-1.41344, -0.6852669, -0.5460126, 1, 1, 1, 1, 1,
-1.405696, -1.019042, -1.08624, 1, 1, 1, 1, 1,
-1.404674, -0.2758676, -3.076206, 1, 1, 1, 1, 1,
-1.386198, -0.618192, -3.099107, 1, 1, 1, 1, 1,
-1.382161, -0.5591762, -0.5050223, 0, 0, 1, 1, 1,
-1.361357, 1.118973, -0.850159, 1, 0, 0, 1, 1,
-1.359543, 0.2105156, -1.295704, 1, 0, 0, 1, 1,
-1.347063, 1.226161, -0.1274372, 1, 0, 0, 1, 1,
-1.344399, 0.08457024, -2.13389, 1, 0, 0, 1, 1,
-1.341294, 1.484571, -1.008609, 1, 0, 0, 1, 1,
-1.339263, 1.310885, 1.554625, 0, 0, 0, 1, 1,
-1.337886, -0.1854021, -2.589446, 0, 0, 0, 1, 1,
-1.326003, 0.2789379, -2.320156, 0, 0, 0, 1, 1,
-1.324901, -0.1491351, -3.572103, 0, 0, 0, 1, 1,
-1.320099, -1.27627, -2.865904, 0, 0, 0, 1, 1,
-1.318275, 1.035257, -1.947001, 0, 0, 0, 1, 1,
-1.300576, 1.564197, -1.959836, 0, 0, 0, 1, 1,
-1.298761, 0.627454, -1.452587, 1, 1, 1, 1, 1,
-1.291702, -0.5415586, -2.148318, 1, 1, 1, 1, 1,
-1.276938, 0.4976952, -3.03306, 1, 1, 1, 1, 1,
-1.276398, -0.7773319, -2.565807, 1, 1, 1, 1, 1,
-1.26562, 1.989462, -0.8987595, 1, 1, 1, 1, 1,
-1.264067, -0.6271843, -3.586804, 1, 1, 1, 1, 1,
-1.264051, -0.06994886, -0.727143, 1, 1, 1, 1, 1,
-1.261023, 0.06282818, 0.01110101, 1, 1, 1, 1, 1,
-1.258826, -1.278518, -2.768809, 1, 1, 1, 1, 1,
-1.258014, -0.9141521, -3.377735, 1, 1, 1, 1, 1,
-1.250764, 1.452641, -0.5873249, 1, 1, 1, 1, 1,
-1.240219, -0.3641937, -2.212492, 1, 1, 1, 1, 1,
-1.233435, -1.495704, -3.34805, 1, 1, 1, 1, 1,
-1.233386, -0.7287936, -2.39405, 1, 1, 1, 1, 1,
-1.227705, -0.2471864, -1.704642, 1, 1, 1, 1, 1,
-1.226193, -0.8253499, -2.38973, 0, 0, 1, 1, 1,
-1.225915, 0.5068303, -1.59138, 1, 0, 0, 1, 1,
-1.224306, -0.4181085, -1.806973, 1, 0, 0, 1, 1,
-1.223966, -0.4968504, -1.335183, 1, 0, 0, 1, 1,
-1.22241, -0.2167606, -1.275906, 1, 0, 0, 1, 1,
-1.219145, 0.3135187, -0.6336842, 1, 0, 0, 1, 1,
-1.218316, -0.6185214, -2.126032, 0, 0, 0, 1, 1,
-1.217204, -1.108194, -2.745897, 0, 0, 0, 1, 1,
-1.196691, -0.6230971, -2.624927, 0, 0, 0, 1, 1,
-1.193786, -0.5784931, -2.278455, 0, 0, 0, 1, 1,
-1.19235, -1.142464, -3.739631, 0, 0, 0, 1, 1,
-1.191968, -0.3705858, -2.142074, 0, 0, 0, 1, 1,
-1.186128, -0.8086972, -2.473851, 0, 0, 0, 1, 1,
-1.171333, -0.816334, -3.002604, 1, 1, 1, 1, 1,
-1.163365, -1.522351, -2.803532, 1, 1, 1, 1, 1,
-1.161105, 1.255206, -1.498759, 1, 1, 1, 1, 1,
-1.146013, -0.2463333, -1.978808, 1, 1, 1, 1, 1,
-1.145989, -1.286155, -1.790474, 1, 1, 1, 1, 1,
-1.1413, -0.1299901, -1.473595, 1, 1, 1, 1, 1,
-1.119272, -1.08992, -2.828742, 1, 1, 1, 1, 1,
-1.117598, -0.8019429, -2.099111, 1, 1, 1, 1, 1,
-1.116183, -0.1493076, -2.769272, 1, 1, 1, 1, 1,
-1.11239, -0.2792847, -0.2558714, 1, 1, 1, 1, 1,
-1.092314, -0.9151632, -1.262096, 1, 1, 1, 1, 1,
-1.084954, -1.952648, -4.071555, 1, 1, 1, 1, 1,
-1.079597, 0.1960475, -2.923568, 1, 1, 1, 1, 1,
-1.078048, 0.5319542, -0.7206612, 1, 1, 1, 1, 1,
-1.074263, -0.07244629, -1.789403, 1, 1, 1, 1, 1,
-1.073836, 1.220794, -0.799379, 0, 0, 1, 1, 1,
-1.070086, -1.089477, -3.156096, 1, 0, 0, 1, 1,
-1.067478, -0.493564, -3.270652, 1, 0, 0, 1, 1,
-1.067292, 0.9296355, 1.336771, 1, 0, 0, 1, 1,
-1.06294, 0.586394, 0.1462057, 1, 0, 0, 1, 1,
-1.056928, -1.52063, -3.638546, 1, 0, 0, 1, 1,
-1.052783, -0.2230197, -1.432497, 0, 0, 0, 1, 1,
-1.050984, 1.214133, 0.06441166, 0, 0, 0, 1, 1,
-1.050602, 0.5707559, -1.15109, 0, 0, 0, 1, 1,
-1.050227, 2.242587, -0.6206715, 0, 0, 0, 1, 1,
-1.049701, -0.6009751, -0.06644963, 0, 0, 0, 1, 1,
-1.045292, 2.178859, -1.374756, 0, 0, 0, 1, 1,
-1.043715, 0.1983765, -2.166108, 0, 0, 0, 1, 1,
-1.036191, -0.4626658, -2.045966, 1, 1, 1, 1, 1,
-1.02924, 1.03005, -1.395946, 1, 1, 1, 1, 1,
-1.026362, -1.014609, -3.372942, 1, 1, 1, 1, 1,
-1.023702, 1.974234, -0.5404664, 1, 1, 1, 1, 1,
-1.023509, 0.6723096, -0.303158, 1, 1, 1, 1, 1,
-1.023144, -0.8346914, -2.394307, 1, 1, 1, 1, 1,
-1.0097, 1.446289, -0.2742685, 1, 1, 1, 1, 1,
-1.009444, -1.567354, -0.669732, 1, 1, 1, 1, 1,
-1.009185, -0.07166854, -1.711745, 1, 1, 1, 1, 1,
-1.008559, -0.7482534, -1.397921, 1, 1, 1, 1, 1,
-1.003793, 0.4048983, -1.286055, 1, 1, 1, 1, 1,
-1.003745, -0.7347309, -1.379635, 1, 1, 1, 1, 1,
-0.9983765, 0.9014684, 0.5293738, 1, 1, 1, 1, 1,
-0.994361, 0.3764311, 0.01749147, 1, 1, 1, 1, 1,
-0.9896955, 0.2754057, -2.402506, 1, 1, 1, 1, 1,
-0.9872235, 1.69605, -0.295904, 0, 0, 1, 1, 1,
-0.9833711, -0.05476369, -2.296959, 1, 0, 0, 1, 1,
-0.9762793, 0.01705417, -2.031199, 1, 0, 0, 1, 1,
-0.9725196, 1.794485, 1.61731, 1, 0, 0, 1, 1,
-0.9638248, 1.742969, -0.8298509, 1, 0, 0, 1, 1,
-0.960255, 1.025582, 0.3258275, 1, 0, 0, 1, 1,
-0.9509836, 0.2207949, -0.4197266, 0, 0, 0, 1, 1,
-0.94683, -0.07143731, -1.114091, 0, 0, 0, 1, 1,
-0.9387102, -0.2129076, -0.7608716, 0, 0, 0, 1, 1,
-0.9371472, 0.5369819, -1.491942, 0, 0, 0, 1, 1,
-0.9309233, 2.342743, -1.057738, 0, 0, 0, 1, 1,
-0.9281162, 0.3492653, -0.6177863, 0, 0, 0, 1, 1,
-0.915557, 0.06068474, -3.479308, 0, 0, 0, 1, 1,
-0.9140294, 1.646535, 0.5317042, 1, 1, 1, 1, 1,
-0.9083856, -0.4332414, -1.206751, 1, 1, 1, 1, 1,
-0.9074833, -0.2995913, -0.7163684, 1, 1, 1, 1, 1,
-0.9035804, -0.08247416, -0.3275081, 1, 1, 1, 1, 1,
-0.9002765, -0.4415157, -1.727549, 1, 1, 1, 1, 1,
-0.894618, 0.6233671, -0.5769972, 1, 1, 1, 1, 1,
-0.882965, 0.1048174, -1.613959, 1, 1, 1, 1, 1,
-0.8812012, -0.1846014, -2.267046, 1, 1, 1, 1, 1,
-0.8808694, -0.844646, -2.941938, 1, 1, 1, 1, 1,
-0.878338, 0.1819293, 0.173369, 1, 1, 1, 1, 1,
-0.8769664, -1.573872, -1.619401, 1, 1, 1, 1, 1,
-0.8725901, 0.3254181, -0.5029686, 1, 1, 1, 1, 1,
-0.8718373, -0.2218794, -3.167315, 1, 1, 1, 1, 1,
-0.8692966, 0.5338643, -0.5699004, 1, 1, 1, 1, 1,
-0.8543124, 0.9349818, -1.963261, 1, 1, 1, 1, 1,
-0.8436346, -1.560714, -6.035049, 0, 0, 1, 1, 1,
-0.8428305, 0.433389, -2.252921, 1, 0, 0, 1, 1,
-0.8336363, -0.9954354, -3.304211, 1, 0, 0, 1, 1,
-0.8223276, 1.11915, -0.9751996, 1, 0, 0, 1, 1,
-0.8091859, 0.01658911, -0.9941006, 1, 0, 0, 1, 1,
-0.8091424, -1.911899, -1.057261, 1, 0, 0, 1, 1,
-0.8075482, -0.3685911, -0.9874632, 0, 0, 0, 1, 1,
-0.8071343, 0.2299428, -1.992524, 0, 0, 0, 1, 1,
-0.8062389, -0.2650696, -2.974068, 0, 0, 0, 1, 1,
-0.8054998, 0.2986356, -1.264508, 0, 0, 0, 1, 1,
-0.804222, -0.5799494, -1.587351, 0, 0, 0, 1, 1,
-0.8017942, 1.253981, -0.5181388, 0, 0, 0, 1, 1,
-0.800624, 0.1879082, -0.6241964, 0, 0, 0, 1, 1,
-0.7877321, 1.704597, -1.558588, 1, 1, 1, 1, 1,
-0.7763484, 0.1944771, -1.296569, 1, 1, 1, 1, 1,
-0.7692087, 0.08190452, -1.287493, 1, 1, 1, 1, 1,
-0.7683712, 2.86831, -2.465851, 1, 1, 1, 1, 1,
-0.7666305, -2.326864, -0.7541856, 1, 1, 1, 1, 1,
-0.766524, -0.4996045, -1.760939, 1, 1, 1, 1, 1,
-0.7654105, 1.084919, 0.2934099, 1, 1, 1, 1, 1,
-0.7649649, 0.2826372, 0.2852586, 1, 1, 1, 1, 1,
-0.7647916, -0.02216686, -1.382466, 1, 1, 1, 1, 1,
-0.7646559, 0.9018621, -1.069285, 1, 1, 1, 1, 1,
-0.7637705, 1.046659, 0.7371546, 1, 1, 1, 1, 1,
-0.763041, 1.611524, 0.2500014, 1, 1, 1, 1, 1,
-0.7448913, 1.16662, -1.572457, 1, 1, 1, 1, 1,
-0.7438568, -0.3087111, -1.587587, 1, 1, 1, 1, 1,
-0.7417631, 2.141234, -0.2041703, 1, 1, 1, 1, 1,
-0.737496, -0.4340204, -2.378676, 0, 0, 1, 1, 1,
-0.735755, 1.557159, 0.01076095, 1, 0, 0, 1, 1,
-0.7294819, -0.8730746, -2.312224, 1, 0, 0, 1, 1,
-0.7274214, -0.3608291, -1.891495, 1, 0, 0, 1, 1,
-0.7215374, -0.4089154, -1.640141, 1, 0, 0, 1, 1,
-0.7213379, 0.1048403, -1.21133, 1, 0, 0, 1, 1,
-0.7190725, -0.6281168, -3.392493, 0, 0, 0, 1, 1,
-0.7085289, -1.129413, -2.902024, 0, 0, 0, 1, 1,
-0.7074038, -1.644822, -2.953224, 0, 0, 0, 1, 1,
-0.7059984, -0.5010833, -1.84366, 0, 0, 0, 1, 1,
-0.7026884, 0.07813628, -1.662523, 0, 0, 0, 1, 1,
-0.7012578, -0.07671449, -0.0715397, 0, 0, 0, 1, 1,
-0.6892212, -0.1158479, -0.8931516, 0, 0, 0, 1, 1,
-0.6856887, -0.5905343, -3.456227, 1, 1, 1, 1, 1,
-0.6780974, 0.1557322, -1.941555, 1, 1, 1, 1, 1,
-0.6777167, -0.5980281, -1.465406, 1, 1, 1, 1, 1,
-0.6776714, -0.2729387, -0.4493958, 1, 1, 1, 1, 1,
-0.6739036, -1.143088, -2.367396, 1, 1, 1, 1, 1,
-0.6726764, 0.8533481, -1.396255, 1, 1, 1, 1, 1,
-0.6683769, 0.8430537, -0.7492836, 1, 1, 1, 1, 1,
-0.6670683, -0.04973903, -1.249816, 1, 1, 1, 1, 1,
-0.6652203, -0.4891377, -1.862223, 1, 1, 1, 1, 1,
-0.6646295, -2.909463, -1.573471, 1, 1, 1, 1, 1,
-0.6645922, -0.8442897, -2.039036, 1, 1, 1, 1, 1,
-0.6557192, -0.9046568, -3.208296, 1, 1, 1, 1, 1,
-0.6526358, 0.9504228, -1.17381, 1, 1, 1, 1, 1,
-0.648742, -0.6708066, -4.189861, 1, 1, 1, 1, 1,
-0.6484156, -0.3437141, -2.396429, 1, 1, 1, 1, 1,
-0.6460718, 0.4721328, -0.3755617, 0, 0, 1, 1, 1,
-0.6456849, -0.8648357, -2.162401, 1, 0, 0, 1, 1,
-0.6452019, -0.4286455, -2.48771, 1, 0, 0, 1, 1,
-0.6402258, -0.4983587, -2.526613, 1, 0, 0, 1, 1,
-0.6393918, 2.446742, 0.04002484, 1, 0, 0, 1, 1,
-0.6351318, 0.6280652, 2.083187, 1, 0, 0, 1, 1,
-0.632548, -0.3923153, -3.392628, 0, 0, 0, 1, 1,
-0.6253898, -2.13808, -1.98149, 0, 0, 0, 1, 1,
-0.619776, -2.365963, -2.690572, 0, 0, 0, 1, 1,
-0.6171065, 1.093613, 1.340866, 0, 0, 0, 1, 1,
-0.6169564, 1.971731, -0.2781731, 0, 0, 0, 1, 1,
-0.6125564, -0.6949468, -2.417111, 0, 0, 0, 1, 1,
-0.6104105, 0.4971857, -1.229874, 0, 0, 0, 1, 1,
-0.6097229, -0.2938689, -3.034922, 1, 1, 1, 1, 1,
-0.5990643, -0.8888091, -2.83037, 1, 1, 1, 1, 1,
-0.5980104, -0.8822758, -0.9755417, 1, 1, 1, 1, 1,
-0.5924255, -0.99577, -1.705289, 1, 1, 1, 1, 1,
-0.5863075, -0.01895678, -0.3579921, 1, 1, 1, 1, 1,
-0.5835475, 1.140201, 0.09081311, 1, 1, 1, 1, 1,
-0.5793276, -1.772122, -4.181398, 1, 1, 1, 1, 1,
-0.5775257, 0.03640703, 0.6251672, 1, 1, 1, 1, 1,
-0.5765586, -1.475035, -2.554391, 1, 1, 1, 1, 1,
-0.5712997, -1.920982, -3.896481, 1, 1, 1, 1, 1,
-0.5620144, 0.4415289, -0.7904607, 1, 1, 1, 1, 1,
-0.5594694, 0.001210733, -3.023028, 1, 1, 1, 1, 1,
-0.5574748, 0.5408718, -1.634341, 1, 1, 1, 1, 1,
-0.5536342, -0.5409125, -1.551221, 1, 1, 1, 1, 1,
-0.5515286, -0.1085121, -0.9152029, 1, 1, 1, 1, 1,
-0.5484219, -0.3885344, -0.1001025, 0, 0, 1, 1, 1,
-0.5449106, -0.3030824, -0.7658673, 1, 0, 0, 1, 1,
-0.5443058, -0.2390086, -1.591618, 1, 0, 0, 1, 1,
-0.5426831, -0.9749311, -2.392503, 1, 0, 0, 1, 1,
-0.5420148, 0.1355626, -2.806347, 1, 0, 0, 1, 1,
-0.5419798, -0.8809003, -1.365301, 1, 0, 0, 1, 1,
-0.5372099, -1.133505, -1.915644, 0, 0, 0, 1, 1,
-0.5277498, -0.3370952, -1.244583, 0, 0, 0, 1, 1,
-0.5259156, -0.2355051, -2.366157, 0, 0, 0, 1, 1,
-0.5186512, 0.2713916, -0.7706667, 0, 0, 0, 1, 1,
-0.5155182, -0.4053018, -1.563297, 0, 0, 0, 1, 1,
-0.5146988, 1.238758, 1.093699, 0, 0, 0, 1, 1,
-0.5057227, 1.170418, -1.322796, 0, 0, 0, 1, 1,
-0.5051969, 0.08998322, -1.34352, 1, 1, 1, 1, 1,
-0.5049118, 0.8176541, -1.484997, 1, 1, 1, 1, 1,
-0.503115, -0.8851793, -3.655968, 1, 1, 1, 1, 1,
-0.5019388, 1.337733, 2.135172, 1, 1, 1, 1, 1,
-0.4993369, -0.2023957, -1.218598, 1, 1, 1, 1, 1,
-0.4954313, -1.740936, -3.385419, 1, 1, 1, 1, 1,
-0.4864105, -0.1033551, -0.8892466, 1, 1, 1, 1, 1,
-0.4852602, -1.919752, -0.7587938, 1, 1, 1, 1, 1,
-0.4799017, 0.619011, -2.460043, 1, 1, 1, 1, 1,
-0.4767304, 0.01507878, -1.051636, 1, 1, 1, 1, 1,
-0.4710353, -2.042717, -2.65091, 1, 1, 1, 1, 1,
-0.4693887, 2.592844, -0.8081464, 1, 1, 1, 1, 1,
-0.4680636, -0.6525211, -4.3173, 1, 1, 1, 1, 1,
-0.4661109, 0.2199832, -2.357901, 1, 1, 1, 1, 1,
-0.4660244, -0.1633388, -0.1699866, 1, 1, 1, 1, 1,
-0.4652446, -0.3427835, -2.959119, 0, 0, 1, 1, 1,
-0.4624127, 1.916632, 0.1154745, 1, 0, 0, 1, 1,
-0.4577507, 2.324158, -0.5747814, 1, 0, 0, 1, 1,
-0.4551695, 0.9083275, -0.9305248, 1, 0, 0, 1, 1,
-0.4503559, -0.1309544, 0.4880194, 1, 0, 0, 1, 1,
-0.4483453, 0.9030407, 0.3470653, 1, 0, 0, 1, 1,
-0.4417188, 0.198418, -2.480037, 0, 0, 0, 1, 1,
-0.4397295, -0.6003733, -1.518569, 0, 0, 0, 1, 1,
-0.4394862, -1.447504, -2.523753, 0, 0, 0, 1, 1,
-0.4373601, -0.3419097, -1.200436, 0, 0, 0, 1, 1,
-0.434892, -0.1134176, -1.118264, 0, 0, 0, 1, 1,
-0.4302185, -0.9910625, -2.590047, 0, 0, 0, 1, 1,
-0.4235134, -0.9546338, -3.961183, 0, 0, 0, 1, 1,
-0.4232328, -1.05506, -3.243531, 1, 1, 1, 1, 1,
-0.4172881, -0.7466732, -1.573071, 1, 1, 1, 1, 1,
-0.4098364, -1.632015, -1.732409, 1, 1, 1, 1, 1,
-0.4067096, -0.3053052, -2.649277, 1, 1, 1, 1, 1,
-0.4041775, -0.69757, -3.460674, 1, 1, 1, 1, 1,
-0.4040319, 0.3870805, -1.404507, 1, 1, 1, 1, 1,
-0.4037928, -1.084127, -2.999432, 1, 1, 1, 1, 1,
-0.4027045, 1.069355, -1.088464, 1, 1, 1, 1, 1,
-0.3988115, 0.2127596, -1.585308, 1, 1, 1, 1, 1,
-0.3925516, 1.457705, 1.329005, 1, 1, 1, 1, 1,
-0.3901091, -1.745535, -3.351545, 1, 1, 1, 1, 1,
-0.3897871, 1.752837, -1.633533, 1, 1, 1, 1, 1,
-0.3892371, 0.3056807, -0.8063132, 1, 1, 1, 1, 1,
-0.3868455, 1.297677, -0.8698682, 1, 1, 1, 1, 1,
-0.3868445, 2.455323, 0.2979244, 1, 1, 1, 1, 1,
-0.384069, 1.841328, 0.2481779, 0, 0, 1, 1, 1,
-0.3803889, 0.4805973, -2.625283, 1, 0, 0, 1, 1,
-0.3779742, 1.41503, -0.5561934, 1, 0, 0, 1, 1,
-0.372661, 1.542684, -0.697561, 1, 0, 0, 1, 1,
-0.36975, 0.4025519, 0.58606, 1, 0, 0, 1, 1,
-0.3696547, 0.2904968, -1.674194, 1, 0, 0, 1, 1,
-0.3666613, 0.653486, -0.5187433, 0, 0, 0, 1, 1,
-0.3628674, -0.6510294, -4.672581, 0, 0, 0, 1, 1,
-0.3623553, -0.5164043, -3.184937, 0, 0, 0, 1, 1,
-0.3602505, 1.226111, -2.278937, 0, 0, 0, 1, 1,
-0.355773, -0.01923842, -3.60552, 0, 0, 0, 1, 1,
-0.3519268, -1.200233, -2.476667, 0, 0, 0, 1, 1,
-0.3485934, -2.215629, -4.604385, 0, 0, 0, 1, 1,
-0.3376701, -0.1327883, -0.3043192, 1, 1, 1, 1, 1,
-0.3327997, 1.881159, 2.166262, 1, 1, 1, 1, 1,
-0.3299714, -0.5177166, -2.408512, 1, 1, 1, 1, 1,
-0.3278076, 0.5330224, 0.3839694, 1, 1, 1, 1, 1,
-0.3263288, 0.228025, -1.505754, 1, 1, 1, 1, 1,
-0.3248735, 0.3733785, 1.391733, 1, 1, 1, 1, 1,
-0.3202141, -0.2095237, -2.476304, 1, 1, 1, 1, 1,
-0.3198729, -1.24621, -3.382893, 1, 1, 1, 1, 1,
-0.3186665, -0.9851769, -2.762772, 1, 1, 1, 1, 1,
-0.3176918, 2.090642, 0.01432396, 1, 1, 1, 1, 1,
-0.3176452, -0.111294, -0.5821846, 1, 1, 1, 1, 1,
-0.3112742, 0.6376094, -0.4700197, 1, 1, 1, 1, 1,
-0.3104994, 0.3702913, -1.435418, 1, 1, 1, 1, 1,
-0.3103901, 0.265712, -0.9006888, 1, 1, 1, 1, 1,
-0.3063656, -1.712212, -1.703163, 1, 1, 1, 1, 1,
-0.3057863, -1.113402, -2.814302, 0, 0, 1, 1, 1,
-0.305096, 0.8609502, 0.8757008, 1, 0, 0, 1, 1,
-0.3031008, 0.7522363, -0.09303674, 1, 0, 0, 1, 1,
-0.3016655, -0.3424166, -2.782273, 1, 0, 0, 1, 1,
-0.2992122, -0.6583967, -3.434352, 1, 0, 0, 1, 1,
-0.2980194, -0.5266783, -2.037904, 1, 0, 0, 1, 1,
-0.2967177, 0.1384648, -0.4823723, 0, 0, 0, 1, 1,
-0.2898875, -0.6787329, -2.37203, 0, 0, 0, 1, 1,
-0.2879585, 0.4804243, -2.097052, 0, 0, 0, 1, 1,
-0.2871225, -0.5535859, -2.982404, 0, 0, 0, 1, 1,
-0.2833358, -1.889845, -3.47003, 0, 0, 0, 1, 1,
-0.2802926, 1.741391, 0.1855059, 0, 0, 0, 1, 1,
-0.2788655, -0.1019014, -1.987012, 0, 0, 0, 1, 1,
-0.2778969, -0.6324874, -2.846741, 1, 1, 1, 1, 1,
-0.2756755, 0.3447705, 0.4356966, 1, 1, 1, 1, 1,
-0.2724948, -0.1888889, -3.074326, 1, 1, 1, 1, 1,
-0.2700761, 0.5588354, -0.7343792, 1, 1, 1, 1, 1,
-0.2669913, -0.7990027, -4.508035, 1, 1, 1, 1, 1,
-0.2648861, 0.5436359, -0.6685254, 1, 1, 1, 1, 1,
-0.2644232, -1.354276, -2.7898, 1, 1, 1, 1, 1,
-0.2615182, -1.096949, -2.762153, 1, 1, 1, 1, 1,
-0.2589342, 0.0512266, -1.723352, 1, 1, 1, 1, 1,
-0.2586346, -0.9974848, -0.5543576, 1, 1, 1, 1, 1,
-0.254439, 1.766354, -0.2851886, 1, 1, 1, 1, 1,
-0.2490875, 0.3495947, 0.3479794, 1, 1, 1, 1, 1,
-0.2476215, -0.5024783, -1.674692, 1, 1, 1, 1, 1,
-0.2451143, -0.7042576, -2.324735, 1, 1, 1, 1, 1,
-0.243938, 1.792167, 1.189454, 1, 1, 1, 1, 1,
-0.2437043, 0.2960658, -0.001925167, 0, 0, 1, 1, 1,
-0.2433483, 0.7201083, -0.9079342, 1, 0, 0, 1, 1,
-0.2415586, 0.2475989, -0.8686935, 1, 0, 0, 1, 1,
-0.2408474, 0.3239167, 0.6563584, 1, 0, 0, 1, 1,
-0.2385072, 0.558421, 0.6272719, 1, 0, 0, 1, 1,
-0.2373551, -0.2616564, -1.894087, 1, 0, 0, 1, 1,
-0.2345359, -1.100766, -2.249595, 0, 0, 0, 1, 1,
-0.2319952, -2.639595, -4.644936, 0, 0, 0, 1, 1,
-0.2309511, 0.1652389, -1.023864, 0, 0, 0, 1, 1,
-0.2303958, -0.3885057, -4.202631, 0, 0, 0, 1, 1,
-0.2291508, 0.3693921, -1.389568, 0, 0, 0, 1, 1,
-0.2271581, -1.032161, -4.16266, 0, 0, 0, 1, 1,
-0.2254469, -0.3885916, -2.89563, 0, 0, 0, 1, 1,
-0.2252341, 0.8684852, 0.7669851, 1, 1, 1, 1, 1,
-0.2207057, -0.6608672, -3.358935, 1, 1, 1, 1, 1,
-0.2188028, -1.334649, -4.349703, 1, 1, 1, 1, 1,
-0.218005, 0.8653421, -1.487584, 1, 1, 1, 1, 1,
-0.2166106, 0.1791295, -0.1654067, 1, 1, 1, 1, 1,
-0.2140168, -0.4674681, -3.826438, 1, 1, 1, 1, 1,
-0.2100864, -0.3787285, -1.56125, 1, 1, 1, 1, 1,
-0.2076528, 1.93728, 1.504928, 1, 1, 1, 1, 1,
-0.2066108, -0.5395209, -2.583592, 1, 1, 1, 1, 1,
-0.2036196, 0.5076732, -0.1655833, 1, 1, 1, 1, 1,
-0.2031965, 1.069484, 0.5656866, 1, 1, 1, 1, 1,
-0.1962904, 2.0265, 0.3056189, 1, 1, 1, 1, 1,
-0.1942223, -0.9670054, -2.806419, 1, 1, 1, 1, 1,
-0.1907027, 1.023887, 0.3307998, 1, 1, 1, 1, 1,
-0.1890733, 1.215468, 1.445433, 1, 1, 1, 1, 1,
-0.1875176, 0.09772561, -0.9983938, 0, 0, 1, 1, 1,
-0.1733212, -1.654348, -2.228899, 1, 0, 0, 1, 1,
-0.1729177, 0.6729879, -0.6829467, 1, 0, 0, 1, 1,
-0.1724102, 0.7836843, -0.2833042, 1, 0, 0, 1, 1,
-0.1708115, -2.018506, -4.21585, 1, 0, 0, 1, 1,
-0.1665964, -0.3530928, -2.31832, 1, 0, 0, 1, 1,
-0.16535, 0.7018846, -1.333138, 0, 0, 0, 1, 1,
-0.1632036, -0.2148934, -3.054623, 0, 0, 0, 1, 1,
-0.1600124, -0.7946457, -2.638808, 0, 0, 0, 1, 1,
-0.1462845, -0.04642744, -2.188865, 0, 0, 0, 1, 1,
-0.1439361, -0.2243798, -1.875492, 0, 0, 0, 1, 1,
-0.1380235, 1.39471, 0.8143569, 0, 0, 0, 1, 1,
-0.1378888, -1.244781, -3.777861, 0, 0, 0, 1, 1,
-0.1359773, 0.7351251, 1.113953, 1, 1, 1, 1, 1,
-0.1352581, 1.61442, -0.5570258, 1, 1, 1, 1, 1,
-0.1343811, 1.390041, -0.5099882, 1, 1, 1, 1, 1,
-0.1269319, 0.3049027, 0.1292234, 1, 1, 1, 1, 1,
-0.1240822, -0.2585959, -2.019677, 1, 1, 1, 1, 1,
-0.1239407, 0.9928185, 0.5989593, 1, 1, 1, 1, 1,
-0.1217128, 0.2779467, -1.732084, 1, 1, 1, 1, 1,
-0.121024, -1.322208, -3.567168, 1, 1, 1, 1, 1,
-0.1205989, -0.2962694, -2.938276, 1, 1, 1, 1, 1,
-0.1186478, 0.6164873, 0.9249804, 1, 1, 1, 1, 1,
-0.1176963, 1.169814, -1.147913, 1, 1, 1, 1, 1,
-0.1149794, 0.8206689, -0.9213477, 1, 1, 1, 1, 1,
-0.106976, -0.3992144, -1.294583, 1, 1, 1, 1, 1,
-0.1003925, 0.2954756, -0.2750597, 1, 1, 1, 1, 1,
-0.09770464, -0.709384, -3.207025, 1, 1, 1, 1, 1,
-0.09395792, -1.170939, -2.081419, 0, 0, 1, 1, 1,
-0.09320664, 0.3019839, 0.223003, 1, 0, 0, 1, 1,
-0.08933249, 0.1981793, 0.8336293, 1, 0, 0, 1, 1,
-0.08634426, -1.189314, -2.914402, 1, 0, 0, 1, 1,
-0.08048722, -0.5273494, -2.64368, 1, 0, 0, 1, 1,
-0.07656734, -0.3543456, -3.24393, 1, 0, 0, 1, 1,
-0.07468996, -0.890266, -2.719718, 0, 0, 0, 1, 1,
-0.06733222, 0.4817396, 0.4831342, 0, 0, 0, 1, 1,
-0.0672984, 0.6724155, 1.105608, 0, 0, 0, 1, 1,
-0.06618357, -0.3388898, -2.504536, 0, 0, 0, 1, 1,
-0.06467534, 0.731696, -2.137328, 0, 0, 0, 1, 1,
-0.0626834, 1.746414, -0.3090509, 0, 0, 0, 1, 1,
-0.06249789, -0.1348389, -2.093096, 0, 0, 0, 1, 1,
-0.05929262, 0.5960073, 0.3330409, 1, 1, 1, 1, 1,
-0.05892389, 0.0963938, -0.7809258, 1, 1, 1, 1, 1,
-0.0565151, 0.03179559, -2.31235, 1, 1, 1, 1, 1,
-0.04891713, 0.6581759, 0.5333567, 1, 1, 1, 1, 1,
-0.04568155, -0.959053, -0.8336281, 1, 1, 1, 1, 1,
-0.0406023, 1.639098, -1.825402, 1, 1, 1, 1, 1,
-0.0371657, -2.16525, -3.224319, 1, 1, 1, 1, 1,
-0.03497338, 0.3472821, 0.3011986, 1, 1, 1, 1, 1,
-0.03189084, 3.116122, 0.02003778, 1, 1, 1, 1, 1,
-0.02883281, -1.114267, -3.451499, 1, 1, 1, 1, 1,
-0.02824789, 0.4430296, 0.2000854, 1, 1, 1, 1, 1,
-0.02648489, 0.5704345, -0.5925273, 1, 1, 1, 1, 1,
-0.02605129, -1.674448, -4.086298, 1, 1, 1, 1, 1,
-0.02315557, -0.6557464, -2.928398, 1, 1, 1, 1, 1,
-0.0188894, 1.423244, 0.9028645, 1, 1, 1, 1, 1,
-0.01652091, 0.09604868, -0.1179632, 0, 0, 1, 1, 1,
-0.01545477, 0.8269055, 0.3987372, 1, 0, 0, 1, 1,
-0.01456971, -1.280935, -2.134312, 1, 0, 0, 1, 1,
-0.01359631, -1.692026, -3.30266, 1, 0, 0, 1, 1,
-0.012741, 0.6909262, 0.5961684, 1, 0, 0, 1, 1,
-0.01152133, -0.5957018, -5.015544, 1, 0, 0, 1, 1,
-0.00864033, -0.6949338, -3.853733, 0, 0, 0, 1, 1,
-0.006387997, -0.9945927, -2.425983, 0, 0, 0, 1, 1,
-0.00625199, -0.05266612, -4.442782, 0, 0, 0, 1, 1,
-0.001329886, 0.4939447, -1.311821, 0, 0, 0, 1, 1,
-0.001280513, 0.8759578, -0.6780981, 0, 0, 0, 1, 1,
0.003027366, -0.7237149, 3.22083, 0, 0, 0, 1, 1,
0.003330313, 0.8631523, -0.3043646, 0, 0, 0, 1, 1,
0.00456191, -0.0074599, 2.358857, 1, 1, 1, 1, 1,
0.008044156, -1.403618, 2.94784, 1, 1, 1, 1, 1,
0.01098744, -0.9418082, 1.908586, 1, 1, 1, 1, 1,
0.01605763, 0.5476727, 1.074644, 1, 1, 1, 1, 1,
0.01718773, 1.042372, -0.1245512, 1, 1, 1, 1, 1,
0.01767838, -0.2159099, 4.032674, 1, 1, 1, 1, 1,
0.01851102, 0.6072406, -0.7143772, 1, 1, 1, 1, 1,
0.01880058, 1.228135, 0.5619708, 1, 1, 1, 1, 1,
0.02688973, 1.002874, 2.353754, 1, 1, 1, 1, 1,
0.02717688, 1.196608, 0.5648329, 1, 1, 1, 1, 1,
0.02890414, 0.1815193, 1.092971, 1, 1, 1, 1, 1,
0.0368846, -1.163927, 3.418234, 1, 1, 1, 1, 1,
0.03770277, 0.8057348, -1.16875, 1, 1, 1, 1, 1,
0.03859437, -0.2214639, 1.19057, 1, 1, 1, 1, 1,
0.04009034, -0.6976029, 3.061089, 1, 1, 1, 1, 1,
0.045664, -0.3438587, 2.992493, 0, 0, 1, 1, 1,
0.04688535, -0.4645327, 4.187909, 1, 0, 0, 1, 1,
0.04791785, -0.8018089, 3.033095, 1, 0, 0, 1, 1,
0.04795401, 0.871035, 0.4857109, 1, 0, 0, 1, 1,
0.04923633, -1.72335, 4.09681, 1, 0, 0, 1, 1,
0.0518304, 0.3034115, 0.0491198, 1, 0, 0, 1, 1,
0.05189886, -1.204722, 2.463517, 0, 0, 0, 1, 1,
0.05193754, -0.8483595, 3.045433, 0, 0, 0, 1, 1,
0.05415476, -0.5060987, 4.197101, 0, 0, 0, 1, 1,
0.05614865, 0.7352766, -0.3404962, 0, 0, 0, 1, 1,
0.05630996, 1.408288, -0.4635833, 0, 0, 0, 1, 1,
0.05900692, -0.4346892, 3.669564, 0, 0, 0, 1, 1,
0.06343937, -0.6715739, 3.748203, 0, 0, 0, 1, 1,
0.06383598, -1.382974, 4.410103, 1, 1, 1, 1, 1,
0.06581338, 0.4241824, -0.1142776, 1, 1, 1, 1, 1,
0.06582045, -0.3900864, 3.556434, 1, 1, 1, 1, 1,
0.06709287, -0.6275887, 1.991521, 1, 1, 1, 1, 1,
0.06783153, 1.315555, -0.9049168, 1, 1, 1, 1, 1,
0.06811013, 1.149103, -0.8738726, 1, 1, 1, 1, 1,
0.06892842, -2.051652, 4.287097, 1, 1, 1, 1, 1,
0.07510593, 1.092034, -0.4245526, 1, 1, 1, 1, 1,
0.08014946, 0.2660687, 0.663601, 1, 1, 1, 1, 1,
0.08022036, 0.1591658, 1.210237, 1, 1, 1, 1, 1,
0.08232594, -1.692413, 3.94392, 1, 1, 1, 1, 1,
0.08632481, 0.2792851, -0.4305288, 1, 1, 1, 1, 1,
0.08656195, 0.6741619, 0.761354, 1, 1, 1, 1, 1,
0.08673801, 0.08149269, 2.846905, 1, 1, 1, 1, 1,
0.08846559, -1.733563, 3.656222, 1, 1, 1, 1, 1,
0.08872321, 0.2355614, -0.724394, 0, 0, 1, 1, 1,
0.09902204, -0.3989546, 2.437842, 1, 0, 0, 1, 1,
0.1003198, -2.18401, 3.851843, 1, 0, 0, 1, 1,
0.1010002, -1.849172, 3.061713, 1, 0, 0, 1, 1,
0.1027574, -1.5269, 3.580968, 1, 0, 0, 1, 1,
0.1028072, -2.690067, 2.010404, 1, 0, 0, 1, 1,
0.1031221, -1.089531, 1.317312, 0, 0, 0, 1, 1,
0.103519, 0.05336765, 0.9329966, 0, 0, 0, 1, 1,
0.1063203, 1.632994, -0.1416969, 0, 0, 0, 1, 1,
0.1083718, -0.1833092, 4.043485, 0, 0, 0, 1, 1,
0.108782, 0.9660904, 0.6116538, 0, 0, 0, 1, 1,
0.1119628, -0.878879, 3.969681, 0, 0, 0, 1, 1,
0.1132382, -0.0721259, 3.070968, 0, 0, 0, 1, 1,
0.1194377, -1.490708, 3.5676, 1, 1, 1, 1, 1,
0.1204049, -1.566146, 3.160754, 1, 1, 1, 1, 1,
0.1252297, 0.4989008, 0.5904543, 1, 1, 1, 1, 1,
0.1255036, -0.6850125, 3.292665, 1, 1, 1, 1, 1,
0.1272297, -0.6478109, 1.082547, 1, 1, 1, 1, 1,
0.1274351, -1.767624, 3.222711, 1, 1, 1, 1, 1,
0.1364706, 0.8724507, -1.027352, 1, 1, 1, 1, 1,
0.1375549, 0.475347, -0.4971668, 1, 1, 1, 1, 1,
0.1380168, -0.3359686, 2.549544, 1, 1, 1, 1, 1,
0.1384485, 0.4032772, 0.4227975, 1, 1, 1, 1, 1,
0.1423254, 1.268119, 0.6736067, 1, 1, 1, 1, 1,
0.146164, -0.8433887, 1.928496, 1, 1, 1, 1, 1,
0.1474906, -0.5030612, 3.354977, 1, 1, 1, 1, 1,
0.1481899, -1.087546, 2.264774, 1, 1, 1, 1, 1,
0.1518483, -1.213643, 2.573517, 1, 1, 1, 1, 1,
0.1527565, -0.3949144, 1.030758, 0, 0, 1, 1, 1,
0.1593135, 2.216373, 0.3500287, 1, 0, 0, 1, 1,
0.1612487, -1.383299, 2.611807, 1, 0, 0, 1, 1,
0.1646252, -1.594251, 2.223259, 1, 0, 0, 1, 1,
0.1714012, 0.3799189, 0.7911318, 1, 0, 0, 1, 1,
0.1793402, -2.181267, 4.019966, 1, 0, 0, 1, 1,
0.1804194, -0.6015042, 2.635108, 0, 0, 0, 1, 1,
0.184201, -1.095766, 2.392141, 0, 0, 0, 1, 1,
0.1843031, -0.59485, 2.713718, 0, 0, 0, 1, 1,
0.1922769, 0.927079, 0.6476634, 0, 0, 0, 1, 1,
0.1923101, -2.157866, 2.887684, 0, 0, 0, 1, 1,
0.1952482, 0.5244282, 0.9604231, 0, 0, 0, 1, 1,
0.1957671, 0.6947963, 0.3481378, 0, 0, 0, 1, 1,
0.2006852, 0.8922624, 0.5680736, 1, 1, 1, 1, 1,
0.2016476, -0.4653296, 1.083172, 1, 1, 1, 1, 1,
0.2017607, 1.952209, -1.629908, 1, 1, 1, 1, 1,
0.2035971, -2.328585, 0.6345251, 1, 1, 1, 1, 1,
0.2069493, -1.557074, 3.898795, 1, 1, 1, 1, 1,
0.2095827, 0.6520517, 0.8076976, 1, 1, 1, 1, 1,
0.2110695, 0.9255651, -1.813515, 1, 1, 1, 1, 1,
0.2130506, 1.136779, 0.3512037, 1, 1, 1, 1, 1,
0.2196032, 0.1047006, 2.059476, 1, 1, 1, 1, 1,
0.2202516, -0.1367165, 2.31282, 1, 1, 1, 1, 1,
0.2205039, 0.2626773, 1.640053, 1, 1, 1, 1, 1,
0.2242474, -0.4297471, 2.639325, 1, 1, 1, 1, 1,
0.2280953, 1.359101, 2.71595, 1, 1, 1, 1, 1,
0.2290887, -1.588502, 2.991374, 1, 1, 1, 1, 1,
0.2303171, 0.6444926, 1.8527, 1, 1, 1, 1, 1,
0.2310661, 0.9378757, -0.2085601, 0, 0, 1, 1, 1,
0.2313961, 1.702225, -0.02191141, 1, 0, 0, 1, 1,
0.2325841, 1.737914, -1.102378, 1, 0, 0, 1, 1,
0.2356089, -0.8356664, 3.251818, 1, 0, 0, 1, 1,
0.2357511, -0.5008854, 3.720366, 1, 0, 0, 1, 1,
0.2399728, -0.2186833, 3.656762, 1, 0, 0, 1, 1,
0.2417159, -1.398746, 2.986162, 0, 0, 0, 1, 1,
0.2437653, 0.2429341, 2.818367, 0, 0, 0, 1, 1,
0.2448014, 0.01606498, 2.300792, 0, 0, 0, 1, 1,
0.2464062, 0.5174068, 0.3673003, 0, 0, 0, 1, 1,
0.2470715, 0.2959595, 1.032226, 0, 0, 0, 1, 1,
0.2479381, -0.8809834, 3.8869, 0, 0, 0, 1, 1,
0.2495827, 1.851583, -0.6937302, 0, 0, 0, 1, 1,
0.2513065, 0.2329451, 0.2209888, 1, 1, 1, 1, 1,
0.2517236, 1.097065, 0.4956475, 1, 1, 1, 1, 1,
0.2563645, 0.2565151, 1.292145, 1, 1, 1, 1, 1,
0.2578983, -0.1834847, 3.8652, 1, 1, 1, 1, 1,
0.2593278, -0.6201922, 3.787466, 1, 1, 1, 1, 1,
0.2608819, -2.016376, 2.485682, 1, 1, 1, 1, 1,
0.2614768, 0.2751692, -2.141893, 1, 1, 1, 1, 1,
0.2617531, -0.4581491, 2.995704, 1, 1, 1, 1, 1,
0.2678148, -0.1003137, 1.236568, 1, 1, 1, 1, 1,
0.2683126, 1.547542, 1.067108, 1, 1, 1, 1, 1,
0.2686865, 1.003629, 1.086951, 1, 1, 1, 1, 1,
0.2696247, -0.470007, 2.823875, 1, 1, 1, 1, 1,
0.2703117, -0.5243967, 3.479101, 1, 1, 1, 1, 1,
0.2704154, 0.9050567, -1.550037, 1, 1, 1, 1, 1,
0.2704665, -0.4909587, 0.3468442, 1, 1, 1, 1, 1,
0.2734624, -1.003538, 1.263427, 0, 0, 1, 1, 1,
0.2761773, -0.4268857, 0.895789, 1, 0, 0, 1, 1,
0.2782483, 0.5858702, 0.4618512, 1, 0, 0, 1, 1,
0.2808936, -0.9122758, 2.5491, 1, 0, 0, 1, 1,
0.281134, -0.8095654, 3.349784, 1, 0, 0, 1, 1,
0.2855581, 1.348288, -0.1300063, 1, 0, 0, 1, 1,
0.2858914, -0.02051347, 1.658555, 0, 0, 0, 1, 1,
0.2866158, -0.183315, 0.8658215, 0, 0, 0, 1, 1,
0.2885451, -1.030111, 1.704314, 0, 0, 0, 1, 1,
0.2896155, 0.7290601, -0.02871311, 0, 0, 0, 1, 1,
0.2999467, -0.9391618, 4.604465, 0, 0, 0, 1, 1,
0.3105429, 0.3371266, 2.650032, 0, 0, 0, 1, 1,
0.3113897, 0.4611861, 1.28124, 0, 0, 0, 1, 1,
0.3127593, 0.2086367, 1.408892, 1, 1, 1, 1, 1,
0.3130583, 0.5468072, 2.105958, 1, 1, 1, 1, 1,
0.3147187, -1.19031, 0.7178541, 1, 1, 1, 1, 1,
0.3148789, 0.288818, -0.3362313, 1, 1, 1, 1, 1,
0.3152907, 0.7093707, -0.5264195, 1, 1, 1, 1, 1,
0.3166785, 0.2650557, 0.4607578, 1, 1, 1, 1, 1,
0.3193159, -0.08613429, 2.53866, 1, 1, 1, 1, 1,
0.3239416, -0.8448916, 1.739609, 1, 1, 1, 1, 1,
0.3259487, -1.253906, 3.289752, 1, 1, 1, 1, 1,
0.3309773, 0.3795686, 2.280918, 1, 1, 1, 1, 1,
0.331423, -1.800734, 3.53335, 1, 1, 1, 1, 1,
0.3334995, -1.108435, 3.557639, 1, 1, 1, 1, 1,
0.3363665, -0.2770724, 2.568004, 1, 1, 1, 1, 1,
0.3379461, 0.02681838, 0.9138179, 1, 1, 1, 1, 1,
0.3389081, 1.154306, 1.196632, 1, 1, 1, 1, 1,
0.3441631, 1.141415, -0.2103135, 0, 0, 1, 1, 1,
0.3556817, 1.010458, 0.396892, 1, 0, 0, 1, 1,
0.3560267, 1.234114, -0.4715722, 1, 0, 0, 1, 1,
0.356424, -0.04536537, 1.211632, 1, 0, 0, 1, 1,
0.3595276, 0.8627429, 0.5796664, 1, 0, 0, 1, 1,
0.3602128, 0.9466488, -0.2459303, 1, 0, 0, 1, 1,
0.3645112, 0.8118349, 0.1158953, 0, 0, 0, 1, 1,
0.3685829, 0.1178592, 0.9471518, 0, 0, 0, 1, 1,
0.368846, -0.6814282, 3.605863, 0, 0, 0, 1, 1,
0.3691963, -0.3588957, 3.62413, 0, 0, 0, 1, 1,
0.3750924, 1.723695, -0.7089524, 0, 0, 0, 1, 1,
0.3812758, 0.62374, 1.274163, 0, 0, 0, 1, 1,
0.3854403, -0.1823303, 1.886885, 0, 0, 0, 1, 1,
0.3891706, 0.7971283, 1.70003, 1, 1, 1, 1, 1,
0.3927079, -0.4434406, 3.417296, 1, 1, 1, 1, 1,
0.3946981, -0.5612468, 2.859915, 1, 1, 1, 1, 1,
0.3948917, -0.7200503, 0.3874843, 1, 1, 1, 1, 1,
0.3995586, -0.8230649, 3.193181, 1, 1, 1, 1, 1,
0.407957, -0.9729756, 2.141615, 1, 1, 1, 1, 1,
0.4090687, 0.3814175, 2.374003, 1, 1, 1, 1, 1,
0.4097911, -1.437475, 3.928692, 1, 1, 1, 1, 1,
0.409945, -1.671955, 3.081219, 1, 1, 1, 1, 1,
0.4118416, 0.4383294, 0.5301468, 1, 1, 1, 1, 1,
0.4123555, 1.083226, 0.95485, 1, 1, 1, 1, 1,
0.4157563, 1.296586, 0.02309951, 1, 1, 1, 1, 1,
0.4188788, 0.8161175, 0.3158972, 1, 1, 1, 1, 1,
0.4242074, 0.4724965, 0.9988897, 1, 1, 1, 1, 1,
0.4249074, -1.480416, 2.72614, 1, 1, 1, 1, 1,
0.4267024, 0.7871641, 1.095706, 0, 0, 1, 1, 1,
0.4268449, 0.1218168, -1.013586, 1, 0, 0, 1, 1,
0.4273097, 0.1497354, 2.487412, 1, 0, 0, 1, 1,
0.4388608, 1.007224, 0.1385618, 1, 0, 0, 1, 1,
0.4404731, -0.1390829, 0.9057196, 1, 0, 0, 1, 1,
0.4499795, 0.387269, 1.981972, 1, 0, 0, 1, 1,
0.4507447, 1.338898, -2.496485, 0, 0, 0, 1, 1,
0.4513806, -0.849403, 3.592987, 0, 0, 0, 1, 1,
0.4534647, -0.001382653, 0.9707013, 0, 0, 0, 1, 1,
0.4557303, -0.6717044, 2.793013, 0, 0, 0, 1, 1,
0.4584246, 0.5164689, 1.463161, 0, 0, 0, 1, 1,
0.4612751, 0.7436967, 0.5319166, 0, 0, 0, 1, 1,
0.4687101, -0.7646307, 2.404608, 0, 0, 0, 1, 1,
0.4689417, -0.6367711, 1.120405, 1, 1, 1, 1, 1,
0.4716938, 1.041943, 0.4587623, 1, 1, 1, 1, 1,
0.4718101, -0.01972014, 2.947624, 1, 1, 1, 1, 1,
0.4733344, -2.373908, 2.723729, 1, 1, 1, 1, 1,
0.4798449, -1.189251, 3.509569, 1, 1, 1, 1, 1,
0.4861036, 1.560491, 2.834096, 1, 1, 1, 1, 1,
0.4865922, -0.07937975, 2.313979, 1, 1, 1, 1, 1,
0.4894288, 1.601618, 0.5145969, 1, 1, 1, 1, 1,
0.4914577, -0.3377449, 1.361301, 1, 1, 1, 1, 1,
0.4950804, 0.1703544, 2.20845, 1, 1, 1, 1, 1,
0.4998256, 0.2742709, -0.2512805, 1, 1, 1, 1, 1,
0.5021353, 0.07862776, 0.01094353, 1, 1, 1, 1, 1,
0.5036534, 0.5680009, 2.043627, 1, 1, 1, 1, 1,
0.5044278, 2.516872, 1.203826, 1, 1, 1, 1, 1,
0.5111436, -1.287548, 1.659702, 1, 1, 1, 1, 1,
0.5136739, -0.03141107, 1.04972, 0, 0, 1, 1, 1,
0.5172902, -0.933031, 3.797304, 1, 0, 0, 1, 1,
0.5179003, 0.5345351, 1.64137, 1, 0, 0, 1, 1,
0.5197292, 2.313176, -1.236357, 1, 0, 0, 1, 1,
0.5198665, -1.294675, 2.733423, 1, 0, 0, 1, 1,
0.5217938, 1.133628, -0.2572512, 1, 0, 0, 1, 1,
0.5226302, -0.4176781, 1.711376, 0, 0, 0, 1, 1,
0.5261824, -0.1967288, -0.1452526, 0, 0, 0, 1, 1,
0.527169, 0.6533609, -0.8587698, 0, 0, 0, 1, 1,
0.528203, -0.8598343, 4.085937, 0, 0, 0, 1, 1,
0.5300238, 0.5331147, 0.6074622, 0, 0, 0, 1, 1,
0.5340602, -0.3748103, 2.24018, 0, 0, 0, 1, 1,
0.5387291, 3.216907, 0.6473458, 0, 0, 0, 1, 1,
0.543334, -0.6716427, 3.775595, 1, 1, 1, 1, 1,
0.5454818, 0.1940547, 2.433417, 1, 1, 1, 1, 1,
0.5502142, 2.744674, 0.8362143, 1, 1, 1, 1, 1,
0.5510622, -0.7468799, 3.91651, 1, 1, 1, 1, 1,
0.5511243, 1.020076, 3.50999, 1, 1, 1, 1, 1,
0.5516302, 0.3865432, 2.580721, 1, 1, 1, 1, 1,
0.558405, 0.9579058, -0.7140635, 1, 1, 1, 1, 1,
0.5601367, -1.902175, 3.421399, 1, 1, 1, 1, 1,
0.568294, -0.1077155, 2.166051, 1, 1, 1, 1, 1,
0.5716672, -0.3214983, 3.636819, 1, 1, 1, 1, 1,
0.5878908, 1.173964, 0.2110516, 1, 1, 1, 1, 1,
0.5885854, 1.28861, 2.433534, 1, 1, 1, 1, 1,
0.5914709, 0.6986476, -0.06912022, 1, 1, 1, 1, 1,
0.5974305, -2.142866, 4.073672, 1, 1, 1, 1, 1,
0.6039515, -0.2155432, 1.48052, 1, 1, 1, 1, 1,
0.6072964, -0.5241848, 1.80424, 0, 0, 1, 1, 1,
0.6132071, 0.3496684, 1.21798, 1, 0, 0, 1, 1,
0.6167109, -1.416478, 3.273683, 1, 0, 0, 1, 1,
0.620224, -0.04252482, 1.067667, 1, 0, 0, 1, 1,
0.6202711, -0.8154224, 2.415366, 1, 0, 0, 1, 1,
0.6231941, 1.12171, 0.3882754, 1, 0, 0, 1, 1,
0.6266993, 0.2000239, 0.9595194, 0, 0, 0, 1, 1,
0.6273388, -1.754333, 2.215237, 0, 0, 0, 1, 1,
0.627622, -2.395334, 2.452726, 0, 0, 0, 1, 1,
0.6359459, -0.5158037, 4.14742, 0, 0, 0, 1, 1,
0.637591, -0.3127506, 1.627915, 0, 0, 0, 1, 1,
0.6424744, 1.427775, -0.02744765, 0, 0, 0, 1, 1,
0.6459048, -0.1218979, 1.74987, 0, 0, 0, 1, 1,
0.6463394, 0.8751012, 1.385064, 1, 1, 1, 1, 1,
0.6496962, -0.23623, 1.882132, 1, 1, 1, 1, 1,
0.6519826, -0.221731, 2.275338, 1, 1, 1, 1, 1,
0.6537271, -1.134409, 2.732361, 1, 1, 1, 1, 1,
0.6552998, 0.631335, -0.1779839, 1, 1, 1, 1, 1,
0.6567256, -1.134859, 3.004266, 1, 1, 1, 1, 1,
0.6624491, -0.8637617, 1.8643, 1, 1, 1, 1, 1,
0.674844, 0.7970027, 1.262819, 1, 1, 1, 1, 1,
0.6804659, 0.08728965, 2.32273, 1, 1, 1, 1, 1,
0.6844871, 0.6735445, 2.599635, 1, 1, 1, 1, 1,
0.689409, 0.2613143, 2.256151, 1, 1, 1, 1, 1,
0.7030018, 0.5102615, 0.4339751, 1, 1, 1, 1, 1,
0.7056777, -0.1194281, 2.66611, 1, 1, 1, 1, 1,
0.7116724, 0.0526236, 2.395398, 1, 1, 1, 1, 1,
0.7151196, 1.391521, -0.4852339, 1, 1, 1, 1, 1,
0.7171236, 0.1526104, -0.5432106, 0, 0, 1, 1, 1,
0.7174773, -0.7051266, 1.501138, 1, 0, 0, 1, 1,
0.719979, -0.1679148, 2.407376, 1, 0, 0, 1, 1,
0.7206145, -0.2281433, 2.379749, 1, 0, 0, 1, 1,
0.7276236, 0.5149304, 0.9271402, 1, 0, 0, 1, 1,
0.7282571, -1.773771, 4.036221, 1, 0, 0, 1, 1,
0.7307969, -0.3506512, 2.341978, 0, 0, 0, 1, 1,
0.7375062, -0.1319898, 2.993554, 0, 0, 0, 1, 1,
0.7400521, -0.003553753, 1.560555, 0, 0, 0, 1, 1,
0.741842, -1.511103, 1.940966, 0, 0, 0, 1, 1,
0.7419183, 0.6669664, 0.8659682, 0, 0, 0, 1, 1,
0.7456075, -1.742339, 2.837168, 0, 0, 0, 1, 1,
0.7564331, 2.448809, 1.077461, 0, 0, 0, 1, 1,
0.759613, -1.124122, 1.956727, 1, 1, 1, 1, 1,
0.7646971, 0.7772596, 1.945163, 1, 1, 1, 1, 1,
0.7654825, -1.085486, 2.203298, 1, 1, 1, 1, 1,
0.7706524, -1.766839, 2.666842, 1, 1, 1, 1, 1,
0.7760793, 1.12502, -0.3111222, 1, 1, 1, 1, 1,
0.7803181, -0.4199154, 2.163927, 1, 1, 1, 1, 1,
0.7856941, 0.5744674, -0.5182133, 1, 1, 1, 1, 1,
0.786283, 0.8306384, -0.05465021, 1, 1, 1, 1, 1,
0.7878032, 0.6405028, 0.125911, 1, 1, 1, 1, 1,
0.7919919, -0.0171218, 1.218315, 1, 1, 1, 1, 1,
0.7964035, 1.199451, -0.7954188, 1, 1, 1, 1, 1,
0.7965177, 0.717972, 2.217856, 1, 1, 1, 1, 1,
0.7971532, 0.3713748, 1.271798, 1, 1, 1, 1, 1,
0.7998198, 2.221718, 0.3762444, 1, 1, 1, 1, 1,
0.8025953, -1.544765, 1.955144, 1, 1, 1, 1, 1,
0.8048548, 1.306314, -0.5258656, 0, 0, 1, 1, 1,
0.8063146, 0.7985089, 0.07863966, 1, 0, 0, 1, 1,
0.808082, 1.140242, 0.3178311, 1, 0, 0, 1, 1,
0.8093002, -1.18613, 4.352775, 1, 0, 0, 1, 1,
0.8114731, 1.614644, 1.987156, 1, 0, 0, 1, 1,
0.8175124, 0.7488331, -0.8805227, 1, 0, 0, 1, 1,
0.8191421, -0.4929951, 2.909934, 0, 0, 0, 1, 1,
0.8225484, 0.1281386, 3.138889, 0, 0, 0, 1, 1,
0.8248993, 0.2261494, 2.495636, 0, 0, 0, 1, 1,
0.8257673, 2.015272, 1.268564, 0, 0, 0, 1, 1,
0.8338236, 0.1702918, 0.4535581, 0, 0, 0, 1, 1,
0.8374764, 1.178536, 0.1661322, 0, 0, 0, 1, 1,
0.8485556, -1.050026, 2.083114, 0, 0, 0, 1, 1,
0.8494555, -0.2178191, 2.004561, 1, 1, 1, 1, 1,
0.8543457, -0.1735951, 2.650622, 1, 1, 1, 1, 1,
0.8544248, -1.17894, 1.43216, 1, 1, 1, 1, 1,
0.8554718, -0.3357482, 2.72689, 1, 1, 1, 1, 1,
0.8601035, 0.5841282, 1.260625, 1, 1, 1, 1, 1,
0.8605208, 0.3097263, 2.284542, 1, 1, 1, 1, 1,
0.8613725, 0.5593174, 0.4884166, 1, 1, 1, 1, 1,
0.8615277, -0.5662314, 1.077825, 1, 1, 1, 1, 1,
0.8691346, -0.7902088, 3.515024, 1, 1, 1, 1, 1,
0.8710214, -1.995455, 2.693999, 1, 1, 1, 1, 1,
0.8715888, 0.2363828, 3.035849, 1, 1, 1, 1, 1,
0.8721825, 0.1476199, 1.902202, 1, 1, 1, 1, 1,
0.8772839, 0.7421737, 0.7874326, 1, 1, 1, 1, 1,
0.8774731, -0.8106703, 1.00531, 1, 1, 1, 1, 1,
0.878746, -1.409019, 2.458013, 1, 1, 1, 1, 1,
0.8812261, -1.127013, 1.593415, 0, 0, 1, 1, 1,
0.8824608, -1.145272, 2.283956, 1, 0, 0, 1, 1,
0.8845628, 1.778503, 1.324531, 1, 0, 0, 1, 1,
0.8858823, -0.4250806, 3.508318, 1, 0, 0, 1, 1,
0.8951271, -0.8883265, 1.202855, 1, 0, 0, 1, 1,
0.9118631, -0.4647838, 2.415137, 1, 0, 0, 1, 1,
0.9156474, -0.3451311, 2.224854, 0, 0, 0, 1, 1,
0.921114, -0.4427023, 2.128461, 0, 0, 0, 1, 1,
0.9211701, 1.250197, 1.613267, 0, 0, 0, 1, 1,
0.9224348, -1.029853, 1.370572, 0, 0, 0, 1, 1,
0.9301811, -0.1346718, 1.89822, 0, 0, 0, 1, 1,
0.9406889, 0.7124302, 0.298244, 0, 0, 0, 1, 1,
0.9435555, 0.9557779, 0.1442035, 0, 0, 0, 1, 1,
0.9471188, 0.04120885, 2.805527, 1, 1, 1, 1, 1,
0.9476695, -0.3051645, 1.855585, 1, 1, 1, 1, 1,
0.9528092, 0.4811333, 1.771259, 1, 1, 1, 1, 1,
0.9548737, -0.6371129, 2.91589, 1, 1, 1, 1, 1,
0.9619532, -0.6138217, 1.102561, 1, 1, 1, 1, 1,
0.9641836, -0.2459417, 0.9973143, 1, 1, 1, 1, 1,
0.9685917, -0.6692834, 2.9868, 1, 1, 1, 1, 1,
0.9702384, -0.07764076, 2.073689, 1, 1, 1, 1, 1,
0.9756476, 0.1414884, 1.343413, 1, 1, 1, 1, 1,
0.9787024, -0.8430383, 0.7964092, 1, 1, 1, 1, 1,
0.9832674, -0.2859332, 2.381068, 1, 1, 1, 1, 1,
0.9841526, 0.2532459, 0.6795576, 1, 1, 1, 1, 1,
0.9855092, 0.09880559, -0.153166, 1, 1, 1, 1, 1,
0.9896245, -0.7448254, 1.432128, 1, 1, 1, 1, 1,
0.9930336, 0.3477956, 2.830754, 1, 1, 1, 1, 1,
0.9955826, 0.1522989, 1.461446, 0, 0, 1, 1, 1,
1.000225, -0.2624894, 4.645872, 1, 0, 0, 1, 1,
1.003111, -1.743131, 4.055069, 1, 0, 0, 1, 1,
1.0052, -0.2236646, 3.265401, 1, 0, 0, 1, 1,
1.006595, 0.7584315, -0.3065539, 1, 0, 0, 1, 1,
1.011297, 1.522528, -0.6539678, 1, 0, 0, 1, 1,
1.012091, 0.03699626, 0.7111744, 0, 0, 0, 1, 1,
1.015997, -0.1545062, 1.945969, 0, 0, 0, 1, 1,
1.016215, 0.7928962, 0.4109839, 0, 0, 0, 1, 1,
1.028704, -1.301903, 2.652969, 0, 0, 0, 1, 1,
1.030989, 0.5643569, 0.6464537, 0, 0, 0, 1, 1,
1.041021, -1.817269, 5.873134, 0, 0, 0, 1, 1,
1.04596, -0.5588775, 2.225966, 0, 0, 0, 1, 1,
1.047905, 0.5425152, 2.214645, 1, 1, 1, 1, 1,
1.051456, -1.035363, 3.09895, 1, 1, 1, 1, 1,
1.052459, 0.287527, 0.9875172, 1, 1, 1, 1, 1,
1.056933, -1.225431, 2.605128, 1, 1, 1, 1, 1,
1.057941, 0.8419758, 0.2990698, 1, 1, 1, 1, 1,
1.058275, -0.2527229, 2.183066, 1, 1, 1, 1, 1,
1.058513, 0.4319082, -0.07411842, 1, 1, 1, 1, 1,
1.065755, 0.6694922, -0.04272066, 1, 1, 1, 1, 1,
1.070002, -1.02027, 0.9203337, 1, 1, 1, 1, 1,
1.073723, -0.3547705, 0.3678445, 1, 1, 1, 1, 1,
1.074765, 0.8265261, 1.185748, 1, 1, 1, 1, 1,
1.079774, 3.164452, 1.024647, 1, 1, 1, 1, 1,
1.080775, 3.360375, -0.1383704, 1, 1, 1, 1, 1,
1.080857, -1.186378, 3.04122, 1, 1, 1, 1, 1,
1.085362, -0.6188268, 2.222503, 1, 1, 1, 1, 1,
1.08624, -1.26583, 3.048769, 0, 0, 1, 1, 1,
1.090066, -1.599141, 3.461506, 1, 0, 0, 1, 1,
1.095804, 1.313423, 1.100793, 1, 0, 0, 1, 1,
1.096745, 0.4885144, 0.5282637, 1, 0, 0, 1, 1,
1.097011, -0.5585813, 3.875257, 1, 0, 0, 1, 1,
1.097962, 1.255028, -0.03197464, 1, 0, 0, 1, 1,
1.106763, -1.987141, 2.513655, 0, 0, 0, 1, 1,
1.115092, -1.427577, 3.877444, 0, 0, 0, 1, 1,
1.126727, -0.3203506, 0.5897653, 0, 0, 0, 1, 1,
1.128773, 1.492828, 1.529934, 0, 0, 0, 1, 1,
1.142156, 1.33015, 1.067854, 0, 0, 0, 1, 1,
1.146597, -0.6093001, 1.256525, 0, 0, 0, 1, 1,
1.150343, 1.345572, 0.6514848, 0, 0, 0, 1, 1,
1.152741, 0.433655, 1.748305, 1, 1, 1, 1, 1,
1.171226, -0.1943735, 0.9887359, 1, 1, 1, 1, 1,
1.173857, 0.9899895, -0.6994013, 1, 1, 1, 1, 1,
1.177873, -1.358104, 2.626299, 1, 1, 1, 1, 1,
1.179126, 2.209245, 1.675072, 1, 1, 1, 1, 1,
1.18304, 0.3576162, 0.7355996, 1, 1, 1, 1, 1,
1.183633, -0.03046487, 3.018395, 1, 1, 1, 1, 1,
1.195618, 1.794484, 0.8549361, 1, 1, 1, 1, 1,
1.211998, -0.8006917, 0.6554052, 1, 1, 1, 1, 1,
1.216128, -0.08631178, 0.4860427, 1, 1, 1, 1, 1,
1.218524, -0.9445879, 2.264012, 1, 1, 1, 1, 1,
1.221798, -2.220924, 2.702187, 1, 1, 1, 1, 1,
1.227812, -1.147079, 2.014243, 1, 1, 1, 1, 1,
1.233311, -0.9208858, 3.107658, 1, 1, 1, 1, 1,
1.246968, 0.2030424, 2.193729, 1, 1, 1, 1, 1,
1.247512, -1.667947, 1.829028, 0, 0, 1, 1, 1,
1.260629, 0.7163308, 1.973571, 1, 0, 0, 1, 1,
1.268604, -2.076343, 1.893783, 1, 0, 0, 1, 1,
1.268797, -1.294965, 1.627221, 1, 0, 0, 1, 1,
1.269414, -0.6032254, 2.472554, 1, 0, 0, 1, 1,
1.27126, 1.381691, 0.8645467, 1, 0, 0, 1, 1,
1.286197, -1.538444, 1.441301, 0, 0, 0, 1, 1,
1.292294, 0.382093, 0.8538564, 0, 0, 0, 1, 1,
1.29445, -1.008797, 2.493176, 0, 0, 0, 1, 1,
1.294625, 0.2709586, 0.02067139, 0, 0, 0, 1, 1,
1.297442, 0.7366406, -0.2686569, 0, 0, 0, 1, 1,
1.303088, 0.5366931, 1.837903, 0, 0, 0, 1, 1,
1.314125, 1.639658, -0.4438279, 0, 0, 0, 1, 1,
1.316208, 0.6318148, 1.018455, 1, 1, 1, 1, 1,
1.316668, -1.065438, 1.892121, 1, 1, 1, 1, 1,
1.332113, 0.318498, 2.078109, 1, 1, 1, 1, 1,
1.347165, 0.2664425, 1.229269, 1, 1, 1, 1, 1,
1.350983, -0.5178313, 3.301147, 1, 1, 1, 1, 1,
1.352675, 1.175793, 2.764017, 1, 1, 1, 1, 1,
1.35369, -0.9793904, 4.798201, 1, 1, 1, 1, 1,
1.353784, -0.5666722, 2.092736, 1, 1, 1, 1, 1,
1.362305, 1.357445, 0.3058406, 1, 1, 1, 1, 1,
1.370286, -0.2252719, 1.276412, 1, 1, 1, 1, 1,
1.380031, -1.173818, 2.445647, 1, 1, 1, 1, 1,
1.381615, -1.810408, 3.996211, 1, 1, 1, 1, 1,
1.387717, 0.6670063, 0.411415, 1, 1, 1, 1, 1,
1.389718, -0.347497, 1.748452, 1, 1, 1, 1, 1,
1.391093, -1.047712, 1.079382, 1, 1, 1, 1, 1,
1.3934, -0.1158947, 2.258327, 0, 0, 1, 1, 1,
1.396301, 0.06654767, 3.019997, 1, 0, 0, 1, 1,
1.398913, 0.74225, 0.5175885, 1, 0, 0, 1, 1,
1.400332, -0.3502233, 3.073986, 1, 0, 0, 1, 1,
1.405556, -0.8858225, 1.629191, 1, 0, 0, 1, 1,
1.408345, -0.2227693, 0.4468888, 1, 0, 0, 1, 1,
1.411486, 0.08259794, 0.4427672, 0, 0, 0, 1, 1,
1.418932, 1.104255, 0.5960279, 0, 0, 0, 1, 1,
1.422555, -0.9711941, 1.410399, 0, 0, 0, 1, 1,
1.434731, 2.633277, 0.3189951, 0, 0, 0, 1, 1,
1.436992, 1.536123, 0.5896196, 0, 0, 0, 1, 1,
1.443027, 2.231581, 1.223775, 0, 0, 0, 1, 1,
1.446985, 0.4586157, 1.524948, 0, 0, 0, 1, 1,
1.455852, -2.009678, 1.424027, 1, 1, 1, 1, 1,
1.461074, 0.5905809, 1.746839, 1, 1, 1, 1, 1,
1.466862, 0.8489296, 0.9290659, 1, 1, 1, 1, 1,
1.497636, 0.0833848, 1.098189, 1, 1, 1, 1, 1,
1.504282, -0.8742232, 2.989854, 1, 1, 1, 1, 1,
1.516331, 0.2590517, 0.1356437, 1, 1, 1, 1, 1,
1.517692, 0.5169364, 2.166933, 1, 1, 1, 1, 1,
1.517839, -0.4267985, 2.696441, 1, 1, 1, 1, 1,
1.518212, 0.4616356, 1.432921, 1, 1, 1, 1, 1,
1.521949, -1.439323, 1.494759, 1, 1, 1, 1, 1,
1.528166, 0.9839656, 1.804702, 1, 1, 1, 1, 1,
1.532885, -2.920611, 2.391269, 1, 1, 1, 1, 1,
1.540032, -1.078208, 2.007024, 1, 1, 1, 1, 1,
1.550751, -1.212161, 2.782762, 1, 1, 1, 1, 1,
1.553241, -1.680496, 2.329929, 1, 1, 1, 1, 1,
1.593897, -1.152317, 3.654432, 0, 0, 1, 1, 1,
1.594518, 0.7640652, 0.0775484, 1, 0, 0, 1, 1,
1.604988, 1.878109, -0.8805704, 1, 0, 0, 1, 1,
1.606002, 0.0513506, 3.620456, 1, 0, 0, 1, 1,
1.606633, 0.2465348, 1.922161, 1, 0, 0, 1, 1,
1.619748, 0.4133872, 3.577939, 1, 0, 0, 1, 1,
1.622111, -0.8025554, 2.069896, 0, 0, 0, 1, 1,
1.636451, -0.1299822, 2.408926, 0, 0, 0, 1, 1,
1.638245, 0.6622742, 1.577448, 0, 0, 0, 1, 1,
1.676103, 1.641681, 0.1581268, 0, 0, 0, 1, 1,
1.684412, -1.267334, 1.241681, 0, 0, 0, 1, 1,
1.717083, 0.6521207, 1.741108, 0, 0, 0, 1, 1,
1.724998, -0.7639895, 2.119542, 0, 0, 0, 1, 1,
1.742363, 0.8108649, 0.1246009, 1, 1, 1, 1, 1,
1.759065, 1.967385, 0.3347307, 1, 1, 1, 1, 1,
1.759707, 1.470629, -0.3875618, 1, 1, 1, 1, 1,
1.761073, -0.6797096, 2.066702, 1, 1, 1, 1, 1,
1.770276, 0.963259, 0.1104443, 1, 1, 1, 1, 1,
1.779304, -0.6567382, 1.634364, 1, 1, 1, 1, 1,
1.780123, 2.637682, 0.1988502, 1, 1, 1, 1, 1,
1.793686, -1.063341, 1.100259, 1, 1, 1, 1, 1,
1.818635, -0.7025881, 1.158267, 1, 1, 1, 1, 1,
1.854799, -2.102757, 1.846253, 1, 1, 1, 1, 1,
1.882363, -0.7024276, 2.842096, 1, 1, 1, 1, 1,
1.895277, 1.429525, 1.158247, 1, 1, 1, 1, 1,
1.896762, 2.140349, -0.5859898, 1, 1, 1, 1, 1,
1.916406, -0.6301373, 3.450322, 1, 1, 1, 1, 1,
1.933046, -0.7028176, 2.728536, 1, 1, 1, 1, 1,
1.937735, -1.092871, 2.249021, 0, 0, 1, 1, 1,
1.982738, -0.7667792, 1.832447, 1, 0, 0, 1, 1,
2.001576, -0.2290885, 0.9020868, 1, 0, 0, 1, 1,
2.028495, -0.3708758, 2.95818, 1, 0, 0, 1, 1,
2.043743, -0.4516028, 1.838556, 1, 0, 0, 1, 1,
2.050876, -1.236825, 2.745049, 1, 0, 0, 1, 1,
2.095745, 0.3262538, 2.420725, 0, 0, 0, 1, 1,
2.104617, 1.698149, -0.7348302, 0, 0, 0, 1, 1,
2.141739, 0.2185066, 2.239851, 0, 0, 0, 1, 1,
2.154791, 0.1368052, 0.3930066, 0, 0, 0, 1, 1,
2.221184, -0.8198875, 4.111987, 0, 0, 0, 1, 1,
2.224127, -0.9616028, 2.120656, 0, 0, 0, 1, 1,
2.349307, 0.9199422, -0.01882137, 0, 0, 0, 1, 1,
2.366449, 0.6296976, 1.243596, 1, 1, 1, 1, 1,
2.372113, -0.2826999, 2.3161, 1, 1, 1, 1, 1,
2.406005, -0.9590971, 2.157241, 1, 1, 1, 1, 1,
2.429278, 0.5918305, 1.616692, 1, 1, 1, 1, 1,
2.647002, 1.719178, -0.4775056, 1, 1, 1, 1, 1,
2.710593, -0.6623753, 0.9636744, 1, 1, 1, 1, 1,
3.249088, 0.8474114, 0.72126, 1, 1, 1, 1, 1
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
var radius = 10.18139;
var distance = 35.76168;
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
mvMatrix.translate( 0.2088108, -0.1845311, 0.08095765 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.76168);
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