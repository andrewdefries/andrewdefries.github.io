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
-3.521164, 2.058259, -0.5926752, 1, 0, 0, 1,
-2.985403, -0.2411618, -3.016844, 1, 0.007843138, 0, 1,
-2.967513, 0.3053573, -1.777443, 1, 0.01176471, 0, 1,
-2.781925, -0.9509393, -2.163065, 1, 0.01960784, 0, 1,
-2.695751, 0.04442158, -2.592991, 1, 0.02352941, 0, 1,
-2.585057, 1.648874, -2.249208, 1, 0.03137255, 0, 1,
-2.561964, -1.262311, -2.202895, 1, 0.03529412, 0, 1,
-2.538894, -1.220572, -0.7618431, 1, 0.04313726, 0, 1,
-2.506514, 0.4320334, 0.4752668, 1, 0.04705882, 0, 1,
-2.485782, 1.788366, -1.820033, 1, 0.05490196, 0, 1,
-2.45864, -2.504038, -3.423074, 1, 0.05882353, 0, 1,
-2.429399, 1.52556, -0.4917518, 1, 0.06666667, 0, 1,
-2.418589, -0.1895456, -0.02831113, 1, 0.07058824, 0, 1,
-2.352724, 0.2210764, -1.638039, 1, 0.07843138, 0, 1,
-2.325778, 1.208583, -0.6912137, 1, 0.08235294, 0, 1,
-2.310645, -0.7996681, -2.487649, 1, 0.09019608, 0, 1,
-2.289157, -0.4740269, -1.779619, 1, 0.09411765, 0, 1,
-2.279305, 0.3441642, 0.4102043, 1, 0.1019608, 0, 1,
-2.274294, 2.800485, -1.406038, 1, 0.1098039, 0, 1,
-2.266528, -0.6565273, -2.386078, 1, 0.1137255, 0, 1,
-2.25633, -0.1679636, -0.3088159, 1, 0.1215686, 0, 1,
-2.245927, -1.775974, -1.074885, 1, 0.1254902, 0, 1,
-2.205601, -2.19242, -2.103595, 1, 0.1333333, 0, 1,
-2.197119, -0.05754226, -1.849322, 1, 0.1372549, 0, 1,
-2.195743, -2.619916, -4.45584, 1, 0.145098, 0, 1,
-2.162965, 0.6204047, -2.885829, 1, 0.1490196, 0, 1,
-2.156227, -0.1822613, -3.096043, 1, 0.1568628, 0, 1,
-2.129321, 1.047839, -0.7795677, 1, 0.1607843, 0, 1,
-2.11661, 0.2159021, -2.637735, 1, 0.1686275, 0, 1,
-2.100131, -0.5095878, -2.399405, 1, 0.172549, 0, 1,
-2.078465, -0.5570181, -1.837978, 1, 0.1803922, 0, 1,
-2.075444, 1.485883, -1.032851, 1, 0.1843137, 0, 1,
-2.051178, 0.7007791, -2.238011, 1, 0.1921569, 0, 1,
-1.998057, -0.01990577, -1.228271, 1, 0.1960784, 0, 1,
-1.951384, 0.2358815, -2.240153, 1, 0.2039216, 0, 1,
-1.93598, 0.09780672, -1.001339, 1, 0.2117647, 0, 1,
-1.929664, 0.006090685, -0.4953976, 1, 0.2156863, 0, 1,
-1.913636, 0.6556402, -1.372188, 1, 0.2235294, 0, 1,
-1.897322, -1.419049, -2.833055, 1, 0.227451, 0, 1,
-1.888647, 0.974727, -0.2688053, 1, 0.2352941, 0, 1,
-1.874526, 0.2590733, -2.050954, 1, 0.2392157, 0, 1,
-1.860336, -1.703031, -2.846171, 1, 0.2470588, 0, 1,
-1.857557, -1.930724, -2.888331, 1, 0.2509804, 0, 1,
-1.835526, -0.1119891, 0.1586008, 1, 0.2588235, 0, 1,
-1.830154, 1.171263, -0.01329976, 1, 0.2627451, 0, 1,
-1.815923, 0.648544, -1.395481, 1, 0.2705882, 0, 1,
-1.809578, -1.049556, -0.8934038, 1, 0.2745098, 0, 1,
-1.805996, 0.9549611, -1.923271, 1, 0.282353, 0, 1,
-1.796757, 1.488702, -0.511253, 1, 0.2862745, 0, 1,
-1.794489, -0.6348296, -2.779295, 1, 0.2941177, 0, 1,
-1.792198, -0.9157424, -2.07627, 1, 0.3019608, 0, 1,
-1.781456, 0.01544874, -1.201562, 1, 0.3058824, 0, 1,
-1.763874, 0.7780581, -1.848994, 1, 0.3137255, 0, 1,
-1.747643, 0.7095039, -1.12757, 1, 0.3176471, 0, 1,
-1.725159, -0.3339334, -2.846391, 1, 0.3254902, 0, 1,
-1.719807, -1.098868, -2.639492, 1, 0.3294118, 0, 1,
-1.716907, -0.7564915, -3.005302, 1, 0.3372549, 0, 1,
-1.706937, 0.4396723, -2.111045, 1, 0.3411765, 0, 1,
-1.701162, -1.263452, -2.246485, 1, 0.3490196, 0, 1,
-1.695722, -0.4094227, -3.14517, 1, 0.3529412, 0, 1,
-1.695174, 0.04641665, 0.2486322, 1, 0.3607843, 0, 1,
-1.690784, 0.01745303, -2.120942, 1, 0.3647059, 0, 1,
-1.689751, -0.2911394, -1.642144, 1, 0.372549, 0, 1,
-1.683711, -0.8180125, -1.515733, 1, 0.3764706, 0, 1,
-1.667788, 0.2064292, -0.7592499, 1, 0.3843137, 0, 1,
-1.659714, 1.041476, -1.863363, 1, 0.3882353, 0, 1,
-1.657904, 0.4547539, -2.076846, 1, 0.3960784, 0, 1,
-1.657303, -0.1480744, -2.241378, 1, 0.4039216, 0, 1,
-1.642715, 0.1760225, -0.4219298, 1, 0.4078431, 0, 1,
-1.642586, 0.4713584, -1.746578, 1, 0.4156863, 0, 1,
-1.620633, 0.2054548, 0.7506135, 1, 0.4196078, 0, 1,
-1.613532, 2.534124, 0.765983, 1, 0.427451, 0, 1,
-1.606225, 1.153248, 0.02053799, 1, 0.4313726, 0, 1,
-1.586816, 0.1535665, -2.83137, 1, 0.4392157, 0, 1,
-1.540261, 0.8788815, -1.838138, 1, 0.4431373, 0, 1,
-1.519814, -0.1328573, -1.955454, 1, 0.4509804, 0, 1,
-1.511126, -2.142231, -4.136101, 1, 0.454902, 0, 1,
-1.470717, 0.9358689, -0.9672422, 1, 0.4627451, 0, 1,
-1.458761, -0.8660111, 0.5601941, 1, 0.4666667, 0, 1,
-1.445821, 0.6826481, 0.2555129, 1, 0.4745098, 0, 1,
-1.444137, 1.461357, -0.9302981, 1, 0.4784314, 0, 1,
-1.443156, 1.659102, -1.44703, 1, 0.4862745, 0, 1,
-1.439971, 0.1739777, -2.46736, 1, 0.4901961, 0, 1,
-1.422906, -0.582481, -2.712404, 1, 0.4980392, 0, 1,
-1.401954, 0.6612436, -0.2608529, 1, 0.5058824, 0, 1,
-1.399877, 0.7741252, -1.46532, 1, 0.509804, 0, 1,
-1.396406, -1.416522, -1.948475, 1, 0.5176471, 0, 1,
-1.393835, -0.5545748, -2.881643, 1, 0.5215687, 0, 1,
-1.392158, 0.928807, -0.7248248, 1, 0.5294118, 0, 1,
-1.387579, -0.1656195, -1.098121, 1, 0.5333334, 0, 1,
-1.370086, -0.6935523, -2.815641, 1, 0.5411765, 0, 1,
-1.365502, 2.421288, -0.4288054, 1, 0.5450981, 0, 1,
-1.364087, 0.6743048, -2.762827, 1, 0.5529412, 0, 1,
-1.362146, -0.1755397, -0.7329118, 1, 0.5568628, 0, 1,
-1.360227, -0.2817194, -1.009745, 1, 0.5647059, 0, 1,
-1.349509, -0.6051441, -2.192631, 1, 0.5686275, 0, 1,
-1.349017, -0.2471095, -1.583621, 1, 0.5764706, 0, 1,
-1.33867, -0.6341154, -0.7640833, 1, 0.5803922, 0, 1,
-1.336667, 1.019612, -1.423404, 1, 0.5882353, 0, 1,
-1.336128, -0.8820699, -1.917973, 1, 0.5921569, 0, 1,
-1.334008, -0.6700525, -1.819404, 1, 0.6, 0, 1,
-1.331012, 0.8846619, -0.8868352, 1, 0.6078432, 0, 1,
-1.330436, -0.8021147, -1.746755, 1, 0.6117647, 0, 1,
-1.328882, 0.3442917, -1.455414, 1, 0.6196079, 0, 1,
-1.32277, -0.09592594, -2.279859, 1, 0.6235294, 0, 1,
-1.321153, 0.05282956, -0.3253945, 1, 0.6313726, 0, 1,
-1.319042, 0.5834421, -1.330457, 1, 0.6352941, 0, 1,
-1.313534, 0.3403372, 1.394572, 1, 0.6431373, 0, 1,
-1.311338, 0.1451879, -1.244725, 1, 0.6470588, 0, 1,
-1.308263, 0.9924206, -1.340576, 1, 0.654902, 0, 1,
-1.289783, 0.1013226, -2.276484, 1, 0.6588235, 0, 1,
-1.281926, 2.345934, 0.7523743, 1, 0.6666667, 0, 1,
-1.278794, 1.704136, -1.392224, 1, 0.6705883, 0, 1,
-1.276008, -0.4350257, -1.278433, 1, 0.6784314, 0, 1,
-1.258624, 0.2467743, -2.089986, 1, 0.682353, 0, 1,
-1.246677, -1.89558, -3.435378, 1, 0.6901961, 0, 1,
-1.234861, -1.426495, -1.090674, 1, 0.6941177, 0, 1,
-1.22725, -0.7912999, -1.643111, 1, 0.7019608, 0, 1,
-1.221217, 0.02198612, -1.149844, 1, 0.7098039, 0, 1,
-1.220383, 0.326399, 0.06161024, 1, 0.7137255, 0, 1,
-1.220024, -0.3195755, -1.444733, 1, 0.7215686, 0, 1,
-1.215864, -1.39914, -1.51857, 1, 0.7254902, 0, 1,
-1.215394, -0.8609053, -2.070428, 1, 0.7333333, 0, 1,
-1.214413, 1.045132, -1.950907, 1, 0.7372549, 0, 1,
-1.211469, -2.042325, -3.838214, 1, 0.7450981, 0, 1,
-1.191136, 1.610619, -0.8347254, 1, 0.7490196, 0, 1,
-1.190986, 0.7213963, -0.1648772, 1, 0.7568628, 0, 1,
-1.18612, 0.8601423, -1.654969, 1, 0.7607843, 0, 1,
-1.179029, 0.06958393, -1.618535, 1, 0.7686275, 0, 1,
-1.178287, 0.3458385, -1.948255, 1, 0.772549, 0, 1,
-1.178281, 0.7637821, -1.693651, 1, 0.7803922, 0, 1,
-1.171318, -1.778002, -2.184787, 1, 0.7843137, 0, 1,
-1.171174, 0.9860708, 0.7953573, 1, 0.7921569, 0, 1,
-1.167229, -0.09242743, -1.010137, 1, 0.7960784, 0, 1,
-1.166964, 0.9157525, 0.5837573, 1, 0.8039216, 0, 1,
-1.164976, -1.346009, -2.820746, 1, 0.8117647, 0, 1,
-1.163733, 1.894658, -0.5949498, 1, 0.8156863, 0, 1,
-1.163721, 1.944766, -0.5932801, 1, 0.8235294, 0, 1,
-1.157789, -0.3009447, -2.461011, 1, 0.827451, 0, 1,
-1.157411, -0.1307948, -1.421533, 1, 0.8352941, 0, 1,
-1.153383, 0.6084532, 0.6281341, 1, 0.8392157, 0, 1,
-1.152744, -2.423343, -3.456042, 1, 0.8470588, 0, 1,
-1.134189, -0.9890547, 0.02305403, 1, 0.8509804, 0, 1,
-1.132967, -0.4223728, -2.704803, 1, 0.8588235, 0, 1,
-1.123374, 1.693665, -1.396297, 1, 0.8627451, 0, 1,
-1.121473, -1.010784, -1.977013, 1, 0.8705882, 0, 1,
-1.121256, 0.07025459, -2.61259, 1, 0.8745098, 0, 1,
-1.120264, -0.3941336, -2.289334, 1, 0.8823529, 0, 1,
-1.116949, 0.862683, 0.1000776, 1, 0.8862745, 0, 1,
-1.11288, 1.139158, -0.398569, 1, 0.8941177, 0, 1,
-1.10833, -0.9241973, -2.305255, 1, 0.8980392, 0, 1,
-1.106473, -1.774053, -2.933282, 1, 0.9058824, 0, 1,
-1.099265, 0.5988786, -0.5063564, 1, 0.9137255, 0, 1,
-1.097533, 0.4951107, -3.174536, 1, 0.9176471, 0, 1,
-1.095791, 0.9012174, -0.768658, 1, 0.9254902, 0, 1,
-1.092637, -0.7836821, -2.02654, 1, 0.9294118, 0, 1,
-1.0894, -0.3725307, -3.633103, 1, 0.9372549, 0, 1,
-1.064338, 0.04965289, -1.45375, 1, 0.9411765, 0, 1,
-1.062487, -1.13324, -3.001664, 1, 0.9490196, 0, 1,
-1.053866, -0.1207574, -2.93685, 1, 0.9529412, 0, 1,
-1.053709, 0.5682079, -0.7761721, 1, 0.9607843, 0, 1,
-1.050207, 0.4273169, -0.7870408, 1, 0.9647059, 0, 1,
-1.046121, 0.9125288, -2.096762, 1, 0.972549, 0, 1,
-1.042475, -0.4167283, -1.906119, 1, 0.9764706, 0, 1,
-1.035057, 1.075544, -2.040743, 1, 0.9843137, 0, 1,
-1.03505, -0.2191222, -2.140044, 1, 0.9882353, 0, 1,
-1.029429, 1.349597, 0.3933374, 1, 0.9960784, 0, 1,
-1.028119, 1.045482, -1.648951, 0.9960784, 1, 0, 1,
-1.026674, 1.988272, -1.241976, 0.9921569, 1, 0, 1,
-1.025695, -1.684898, -1.098526, 0.9843137, 1, 0, 1,
-1.018283, 0.3574888, -0.3359105, 0.9803922, 1, 0, 1,
-1.016003, 0.9478904, -1.374865, 0.972549, 1, 0, 1,
-1.01114, 0.5573998, -2.150301, 0.9686275, 1, 0, 1,
-1.010631, 0.6377159, -1.075669, 0.9607843, 1, 0, 1,
-1.009511, 0.1108733, -2.99286, 0.9568627, 1, 0, 1,
-1.001773, -2.026218, -1.936555, 0.9490196, 1, 0, 1,
-0.9998445, -0.4078673, -2.033935, 0.945098, 1, 0, 1,
-0.9996683, -0.6932396, -2.526323, 0.9372549, 1, 0, 1,
-0.998551, 0.2745883, -2.940032, 0.9333333, 1, 0, 1,
-0.9918831, -1.245219, -3.346961, 0.9254902, 1, 0, 1,
-0.9904435, 0.016724, -1.888987, 0.9215686, 1, 0, 1,
-0.987351, -0.7755421, -4.494122, 0.9137255, 1, 0, 1,
-0.9860189, 0.2686426, -1.953667, 0.9098039, 1, 0, 1,
-0.9798832, -1.986355, -3.05701, 0.9019608, 1, 0, 1,
-0.9770611, -0.8889294, -0.9213312, 0.8941177, 1, 0, 1,
-0.9754376, -0.7622758, -2.149553, 0.8901961, 1, 0, 1,
-0.9702436, 1.073965, -1.914137, 0.8823529, 1, 0, 1,
-0.9694074, -0.0445551, -1.286523, 0.8784314, 1, 0, 1,
-0.9655266, 0.5345678, -1.043446, 0.8705882, 1, 0, 1,
-0.9650548, 0.6082885, -2.04482, 0.8666667, 1, 0, 1,
-0.9608069, 0.8600027, 0.2268254, 0.8588235, 1, 0, 1,
-0.9571295, -1.259585, -3.564245, 0.854902, 1, 0, 1,
-0.9489228, -1.213987, -2.642915, 0.8470588, 1, 0, 1,
-0.9487453, 0.2421347, 0.5286475, 0.8431373, 1, 0, 1,
-0.9467381, 0.5938776, -1.153994, 0.8352941, 1, 0, 1,
-0.9427747, -0.9464793, -1.54848, 0.8313726, 1, 0, 1,
-0.9349463, 0.1935121, -2.8039, 0.8235294, 1, 0, 1,
-0.9328375, -0.226391, -0.8580908, 0.8196079, 1, 0, 1,
-0.9318037, -0.8583928, -3.701207, 0.8117647, 1, 0, 1,
-0.9289317, 0.2399483, -1.524495, 0.8078431, 1, 0, 1,
-0.9277467, 1.34229, -0.022093, 0.8, 1, 0, 1,
-0.9261706, 0.698579, -1.047115, 0.7921569, 1, 0, 1,
-0.9261702, -1.519411, -3.299848, 0.7882353, 1, 0, 1,
-0.9224854, 1.894359, 0.07729892, 0.7803922, 1, 0, 1,
-0.9194777, 0.2642543, -1.635624, 0.7764706, 1, 0, 1,
-0.9138805, 0.337624, -1.297438, 0.7686275, 1, 0, 1,
-0.9118353, -0.386804, -2.338292, 0.7647059, 1, 0, 1,
-0.9113324, -2.851107, -3.654347, 0.7568628, 1, 0, 1,
-0.9087203, -0.04105449, -0.697542, 0.7529412, 1, 0, 1,
-0.9083484, -0.01572915, -0.07998635, 0.7450981, 1, 0, 1,
-0.9055763, 0.4296243, -1.321634, 0.7411765, 1, 0, 1,
-0.9040883, -2.616209, -2.39073, 0.7333333, 1, 0, 1,
-0.900838, -0.1491737, -1.307325, 0.7294118, 1, 0, 1,
-0.8981743, 1.010914, -0.1439665, 0.7215686, 1, 0, 1,
-0.895797, 0.2555549, -1.546161, 0.7176471, 1, 0, 1,
-0.8950868, 0.5747661, -0.06161941, 0.7098039, 1, 0, 1,
-0.8939331, 0.3147309, -0.6957217, 0.7058824, 1, 0, 1,
-0.8937998, 0.4700193, -1.975942, 0.6980392, 1, 0, 1,
-0.8917941, 1.077111, 0.9152287, 0.6901961, 1, 0, 1,
-0.890869, -1.214261, -3.526929, 0.6862745, 1, 0, 1,
-0.8843127, 1.028993, 0.01960175, 0.6784314, 1, 0, 1,
-0.8821424, -1.128142, -1.888621, 0.6745098, 1, 0, 1,
-0.8731236, -1.011314, -1.875491, 0.6666667, 1, 0, 1,
-0.8687823, -0.4172404, -1.007962, 0.6627451, 1, 0, 1,
-0.8667496, -1.474723, -2.382898, 0.654902, 1, 0, 1,
-0.8664057, 1.382329, -0.8237516, 0.6509804, 1, 0, 1,
-0.8660669, -1.401993, -2.043545, 0.6431373, 1, 0, 1,
-0.8599228, 0.824169, -0.8169148, 0.6392157, 1, 0, 1,
-0.8597332, 0.1882178, -0.8440577, 0.6313726, 1, 0, 1,
-0.8569246, 0.9876495, -0.8163549, 0.627451, 1, 0, 1,
-0.8563541, -1.126745, -3.840356, 0.6196079, 1, 0, 1,
-0.8524994, -0.6728021, -1.57864, 0.6156863, 1, 0, 1,
-0.8518137, -0.4883024, -1.81533, 0.6078432, 1, 0, 1,
-0.8503552, 0.8684009, -2.476958, 0.6039216, 1, 0, 1,
-0.8489878, 0.8245205, -1.738782, 0.5960785, 1, 0, 1,
-0.8456202, -0.239571, -0.1523831, 0.5882353, 1, 0, 1,
-0.840462, -2.271285, -3.316504, 0.5843138, 1, 0, 1,
-0.833967, -0.5406193, -1.238452, 0.5764706, 1, 0, 1,
-0.8312835, 0.1948323, -1.37043, 0.572549, 1, 0, 1,
-0.8226182, 1.766551, -1.757753, 0.5647059, 1, 0, 1,
-0.8188139, 0.09462111, -0.7569456, 0.5607843, 1, 0, 1,
-0.8185542, 0.5680832, 0.7617303, 0.5529412, 1, 0, 1,
-0.8185096, -0.9280952, -4.995091, 0.5490196, 1, 0, 1,
-0.8163891, 0.2876651, -0.8196243, 0.5411765, 1, 0, 1,
-0.8148954, -0.9061644, -1.018819, 0.5372549, 1, 0, 1,
-0.8096656, -1.328276, -3.515378, 0.5294118, 1, 0, 1,
-0.8036124, 2.207761, 0.2235271, 0.5254902, 1, 0, 1,
-0.8021344, -0.3142196, -0.3172082, 0.5176471, 1, 0, 1,
-0.800942, 0.05770142, -2.400438, 0.5137255, 1, 0, 1,
-0.8003363, 0.1231972, -0.9038593, 0.5058824, 1, 0, 1,
-0.7969149, -1.101786, -1.586065, 0.5019608, 1, 0, 1,
-0.7951081, 0.3806975, -0.5724912, 0.4941176, 1, 0, 1,
-0.7891332, -1.588581, -2.797432, 0.4862745, 1, 0, 1,
-0.7850155, 0.4645759, -2.076492, 0.4823529, 1, 0, 1,
-0.7779593, 1.132249, -0.8792686, 0.4745098, 1, 0, 1,
-0.775293, 0.03945703, -1.954314, 0.4705882, 1, 0, 1,
-0.7732756, -0.1636528, -0.9391541, 0.4627451, 1, 0, 1,
-0.7716379, 1.405068, 1.560681, 0.4588235, 1, 0, 1,
-0.770256, 0.5604273, -0.09724477, 0.4509804, 1, 0, 1,
-0.7670904, -0.7774495, -2.656644, 0.4470588, 1, 0, 1,
-0.7653108, -0.1081414, 0.2862534, 0.4392157, 1, 0, 1,
-0.7639216, -0.1831083, -1.926905, 0.4352941, 1, 0, 1,
-0.7630112, 1.360448, -0.2261354, 0.427451, 1, 0, 1,
-0.7615919, -0.6105888, -2.322997, 0.4235294, 1, 0, 1,
-0.7595431, -1.139889, -2.819511, 0.4156863, 1, 0, 1,
-0.7591424, 1.947224, -0.1517406, 0.4117647, 1, 0, 1,
-0.756142, 0.3433483, -2.737558, 0.4039216, 1, 0, 1,
-0.7554507, -0.684121, -1.629782, 0.3960784, 1, 0, 1,
-0.749139, 0.1892855, -1.042756, 0.3921569, 1, 0, 1,
-0.7483591, 0.1750935, -2.467862, 0.3843137, 1, 0, 1,
-0.7451758, -2.318822, -0.4781233, 0.3803922, 1, 0, 1,
-0.7373576, -1.205804, -4.383544, 0.372549, 1, 0, 1,
-0.7346048, 0.4392853, -1.252727, 0.3686275, 1, 0, 1,
-0.7177169, 0.05223232, -0.5345479, 0.3607843, 1, 0, 1,
-0.7148966, -2.04517, -1.814067, 0.3568628, 1, 0, 1,
-0.7118285, -0.8008008, -0.9909889, 0.3490196, 1, 0, 1,
-0.7067759, -0.8723807, -4.065813, 0.345098, 1, 0, 1,
-0.7067147, -1.012543, -2.777581, 0.3372549, 1, 0, 1,
-0.7016675, 1.037225, 0.32827, 0.3333333, 1, 0, 1,
-0.6996248, 0.3113194, 0.201502, 0.3254902, 1, 0, 1,
-0.6956819, 1.748488, 0.8869323, 0.3215686, 1, 0, 1,
-0.6932088, -0.501687, -2.767488, 0.3137255, 1, 0, 1,
-0.6908484, -1.622934, -1.966921, 0.3098039, 1, 0, 1,
-0.6874261, 0.06936991, -2.337836, 0.3019608, 1, 0, 1,
-0.6859639, 0.5613237, -0.7724395, 0.2941177, 1, 0, 1,
-0.6817371, -0.6482103, -3.434808, 0.2901961, 1, 0, 1,
-0.677505, 0.3454027, -1.155908, 0.282353, 1, 0, 1,
-0.676881, 0.9068795, -0.1322826, 0.2784314, 1, 0, 1,
-0.6750029, -0.1204607, -1.224007, 0.2705882, 1, 0, 1,
-0.672468, -0.4145114, -1.078644, 0.2666667, 1, 0, 1,
-0.6723462, -0.3511888, -0.7042262, 0.2588235, 1, 0, 1,
-0.6692905, 1.870919, -2.438177, 0.254902, 1, 0, 1,
-0.6614797, -0.2293009, 0.01185921, 0.2470588, 1, 0, 1,
-0.6614788, 1.957093, -1.197043, 0.2431373, 1, 0, 1,
-0.6570353, 1.211011, -1.041315, 0.2352941, 1, 0, 1,
-0.6567607, 1.416856, -1.854329, 0.2313726, 1, 0, 1,
-0.6496135, -0.8401929, -0.9852847, 0.2235294, 1, 0, 1,
-0.6479321, -0.9984723, -4.142921, 0.2196078, 1, 0, 1,
-0.6478183, 1.299234, 0.7993968, 0.2117647, 1, 0, 1,
-0.6463256, -0.8407655, -2.694401, 0.2078431, 1, 0, 1,
-0.6446713, 0.778188, -0.2111227, 0.2, 1, 0, 1,
-0.6431754, -0.670326, -1.910574, 0.1921569, 1, 0, 1,
-0.6418888, 0.8247663, -1.690043, 0.1882353, 1, 0, 1,
-0.6351038, 0.2072056, -2.662861, 0.1803922, 1, 0, 1,
-0.6324254, -1.290401, -3.570575, 0.1764706, 1, 0, 1,
-0.6282906, -2.304017, -3.203235, 0.1686275, 1, 0, 1,
-0.6269525, -0.4014386, -2.611095, 0.1647059, 1, 0, 1,
-0.6258843, 1.146552, 1.364261, 0.1568628, 1, 0, 1,
-0.6247854, 0.4654087, 0.1973458, 0.1529412, 1, 0, 1,
-0.6233401, -0.2760499, -1.313053, 0.145098, 1, 0, 1,
-0.6190513, -0.03833875, -0.3301887, 0.1411765, 1, 0, 1,
-0.6173615, -1.575967, -2.149564, 0.1333333, 1, 0, 1,
-0.6150855, -0.1711589, -1.50118, 0.1294118, 1, 0, 1,
-0.6081866, -0.9045948, -3.275404, 0.1215686, 1, 0, 1,
-0.6066044, -1.306496, -3.203469, 0.1176471, 1, 0, 1,
-0.6035296, 0.737088, 0.999393, 0.1098039, 1, 0, 1,
-0.5958731, 1.36351, -1.036819, 0.1058824, 1, 0, 1,
-0.5917609, 0.1305671, -0.562865, 0.09803922, 1, 0, 1,
-0.588315, -1.057006, -1.75943, 0.09019608, 1, 0, 1,
-0.5860484, 1.666272, -2.200543, 0.08627451, 1, 0, 1,
-0.5858974, -1.363704, -1.911181, 0.07843138, 1, 0, 1,
-0.5844951, 0.3097718, -0.3853512, 0.07450981, 1, 0, 1,
-0.5818713, 0.0505172, -2.985345, 0.06666667, 1, 0, 1,
-0.5794979, -2.134612, -2.172839, 0.0627451, 1, 0, 1,
-0.5753307, 1.276701, 1.04382, 0.05490196, 1, 0, 1,
-0.5724023, -0.4507862, -1.365033, 0.05098039, 1, 0, 1,
-0.5705302, 1.547704, -0.7740541, 0.04313726, 1, 0, 1,
-0.5678615, -0.3086531, -2.896247, 0.03921569, 1, 0, 1,
-0.5672637, -0.2879998, -1.863526, 0.03137255, 1, 0, 1,
-0.5666165, -1.058824, -1.776387, 0.02745098, 1, 0, 1,
-0.5642561, 0.3398587, -0.007333242, 0.01960784, 1, 0, 1,
-0.5628925, 0.3913387, 1.490094, 0.01568628, 1, 0, 1,
-0.5558171, -0.1388946, 1.023901, 0.007843138, 1, 0, 1,
-0.5534706, 0.432264, -2.195687, 0.003921569, 1, 0, 1,
-0.5518176, 0.5096642, 0.8516388, 0, 1, 0.003921569, 1,
-0.5500273, 0.9518767, 1.190496, 0, 1, 0.01176471, 1,
-0.5499786, -0.02598779, -2.660815, 0, 1, 0.01568628, 1,
-0.5488895, 0.8914635, -0.7747802, 0, 1, 0.02352941, 1,
-0.5476937, -0.6295598, -2.087656, 0, 1, 0.02745098, 1,
-0.5457606, -0.7481806, -3.315856, 0, 1, 0.03529412, 1,
-0.5373613, 0.3952962, -0.5462601, 0, 1, 0.03921569, 1,
-0.5366626, -0.146694, 0.5160289, 0, 1, 0.04705882, 1,
-0.5330471, 0.2424477, -2.400131, 0, 1, 0.05098039, 1,
-0.5313388, 0.1121617, -3.0674, 0, 1, 0.05882353, 1,
-0.5309845, 2.331759, 0.5290863, 0, 1, 0.0627451, 1,
-0.5284411, -0.8421245, -2.895787, 0, 1, 0.07058824, 1,
-0.5275823, -0.5647976, -2.718985, 0, 1, 0.07450981, 1,
-0.5270492, -1.145491, -2.968197, 0, 1, 0.08235294, 1,
-0.5251741, 1.707711, -0.5122759, 0, 1, 0.08627451, 1,
-0.5241228, -0.002801028, -1.08533, 0, 1, 0.09411765, 1,
-0.5199319, 0.98455, -0.7109972, 0, 1, 0.1019608, 1,
-0.5096246, 1.599678, 1.1282, 0, 1, 0.1058824, 1,
-0.5024806, -0.4596679, -3.693101, 0, 1, 0.1137255, 1,
-0.5007716, 1.414911, -0.6994252, 0, 1, 0.1176471, 1,
-0.4984321, -0.5749186, -2.123337, 0, 1, 0.1254902, 1,
-0.4931941, -1.327395, -2.427417, 0, 1, 0.1294118, 1,
-0.4927846, 0.3585432, -0.5954085, 0, 1, 0.1372549, 1,
-0.4888896, -1.486117, -3.287185, 0, 1, 0.1411765, 1,
-0.4832866, 0.6030492, 0.1159128, 0, 1, 0.1490196, 1,
-0.4800048, -0.3327254, -2.402452, 0, 1, 0.1529412, 1,
-0.4781133, 1.795731, -0.2117786, 0, 1, 0.1607843, 1,
-0.476408, 0.04863675, -2.457466, 0, 1, 0.1647059, 1,
-0.4761656, 0.6848523, -2.600443, 0, 1, 0.172549, 1,
-0.4750649, -0.5054421, -3.8386, 0, 1, 0.1764706, 1,
-0.4733631, 2.048008, -1.402113, 0, 1, 0.1843137, 1,
-0.4733012, -0.458994, -4.217457, 0, 1, 0.1882353, 1,
-0.468612, -0.4976931, -5.020438, 0, 1, 0.1960784, 1,
-0.4657896, 0.07697301, -1.890168, 0, 1, 0.2039216, 1,
-0.4617109, 1.135896, 0.2241848, 0, 1, 0.2078431, 1,
-0.4610867, -1.911315, -1.005653, 0, 1, 0.2156863, 1,
-0.4579025, 0.1704811, -1.147144, 0, 1, 0.2196078, 1,
-0.4514945, 1.086138, 0.9882597, 0, 1, 0.227451, 1,
-0.4454814, -0.3537758, -3.050795, 0, 1, 0.2313726, 1,
-0.4444784, -0.03314706, -3.02881, 0, 1, 0.2392157, 1,
-0.4444177, 1.187239, 0.4354876, 0, 1, 0.2431373, 1,
-0.4441707, 1.28678, -1.096508, 0, 1, 0.2509804, 1,
-0.4424329, -0.9217764, -2.521473, 0, 1, 0.254902, 1,
-0.432656, -0.8954142, -2.480714, 0, 1, 0.2627451, 1,
-0.4280935, 0.0748123, -1.322945, 0, 1, 0.2666667, 1,
-0.4269807, -0.4561562, -3.374365, 0, 1, 0.2745098, 1,
-0.4158521, -2.16213, -3.008705, 0, 1, 0.2784314, 1,
-0.4115588, 1.462556, 0.4197486, 0, 1, 0.2862745, 1,
-0.4101957, -0.1361575, -3.197751, 0, 1, 0.2901961, 1,
-0.4066502, 0.932157, -0.7142238, 0, 1, 0.2980392, 1,
-0.401339, -0.09023318, -1.869761, 0, 1, 0.3058824, 1,
-0.3907166, -1.956254, -2.403699, 0, 1, 0.3098039, 1,
-0.3888631, 0.4852827, -0.6092709, 0, 1, 0.3176471, 1,
-0.3876933, 2.403115, -0.9393963, 0, 1, 0.3215686, 1,
-0.3858645, 0.8929302, 0.348404, 0, 1, 0.3294118, 1,
-0.3850784, 0.4344996, -1.553504, 0, 1, 0.3333333, 1,
-0.3811401, -0.9437985, -2.064895, 0, 1, 0.3411765, 1,
-0.3790737, -0.09329561, -2.639501, 0, 1, 0.345098, 1,
-0.3782503, -1.293311, -2.802724, 0, 1, 0.3529412, 1,
-0.3769966, -1.274957, -3.589371, 0, 1, 0.3568628, 1,
-0.3760499, 1.517513, -2.245503, 0, 1, 0.3647059, 1,
-0.373293, 1.17602, 0.5700047, 0, 1, 0.3686275, 1,
-0.3724114, -0.815956, -5.034292, 0, 1, 0.3764706, 1,
-0.3721572, 1.034992, -0.004506544, 0, 1, 0.3803922, 1,
-0.3674994, 0.3579298, -1.726889, 0, 1, 0.3882353, 1,
-0.367074, 0.1885568, -0.1319117, 0, 1, 0.3921569, 1,
-0.3653899, -0.2306855, -2.114921, 0, 1, 0.4, 1,
-0.3653713, -1.50631, -3.303261, 0, 1, 0.4078431, 1,
-0.3644487, 0.4994925, -2.407898, 0, 1, 0.4117647, 1,
-0.3636959, -0.9939612, 1.105333, 0, 1, 0.4196078, 1,
-0.3606017, -0.6337057, -2.478422, 0, 1, 0.4235294, 1,
-0.3565038, 1.086799, -1.004047, 0, 1, 0.4313726, 1,
-0.3559217, -0.4066368, -3.404588, 0, 1, 0.4352941, 1,
-0.3505751, -0.9453151, -2.979229, 0, 1, 0.4431373, 1,
-0.3496566, -0.7054581, -3.148856, 0, 1, 0.4470588, 1,
-0.3463546, 0.5060562, -0.1591544, 0, 1, 0.454902, 1,
-0.3448926, 0.872456, -0.01737133, 0, 1, 0.4588235, 1,
-0.338351, -0.2420163, -0.8235584, 0, 1, 0.4666667, 1,
-0.3362309, -1.354568, -3.088153, 0, 1, 0.4705882, 1,
-0.3355792, 0.8645363, -0.3788891, 0, 1, 0.4784314, 1,
-0.3350914, -0.2079516, -1.541135, 0, 1, 0.4823529, 1,
-0.3279247, 0.8091749, 0.3616397, 0, 1, 0.4901961, 1,
-0.3141869, 0.3320573, -3.850785, 0, 1, 0.4941176, 1,
-0.3141862, -1.044511, -4.618446, 0, 1, 0.5019608, 1,
-0.311158, 0.6003229, -1.994808, 0, 1, 0.509804, 1,
-0.3094613, 0.3132263, -1.312429, 0, 1, 0.5137255, 1,
-0.3083625, 0.0749035, -1.975385, 0, 1, 0.5215687, 1,
-0.2977454, 0.8612152, -2.15365, 0, 1, 0.5254902, 1,
-0.2910731, 1.094756, 0.1637412, 0, 1, 0.5333334, 1,
-0.2862742, 0.5148549, -2.273748, 0, 1, 0.5372549, 1,
-0.2859123, -0.2620798, -2.712039, 0, 1, 0.5450981, 1,
-0.2831877, 1.974386, -0.8028515, 0, 1, 0.5490196, 1,
-0.2807344, 0.01481526, -1.725526, 0, 1, 0.5568628, 1,
-0.2710926, 0.9183437, 1.281703, 0, 1, 0.5607843, 1,
-0.2687868, -0.6205587, -4.08276, 0, 1, 0.5686275, 1,
-0.2657897, 0.2496297, -0.7275226, 0, 1, 0.572549, 1,
-0.263866, -0.4584814, -3.952705, 0, 1, 0.5803922, 1,
-0.2635878, -1.845345, -1.767731, 0, 1, 0.5843138, 1,
-0.2598089, 1.358023, -0.8226166, 0, 1, 0.5921569, 1,
-0.2572259, -0.8826537, -2.039702, 0, 1, 0.5960785, 1,
-0.255062, -0.6206089, -0.9606738, 0, 1, 0.6039216, 1,
-0.2544556, 0.6850193, -0.963586, 0, 1, 0.6117647, 1,
-0.2533147, 0.8939967, -0.4675395, 0, 1, 0.6156863, 1,
-0.2514054, -0.4686736, -3.744428, 0, 1, 0.6235294, 1,
-0.250113, -2.134226, -3.354832, 0, 1, 0.627451, 1,
-0.240018, -0.8579763, -3.852727, 0, 1, 0.6352941, 1,
-0.23283, 1.02381, -1.745892, 0, 1, 0.6392157, 1,
-0.2299571, 0.8457974, -0.2226266, 0, 1, 0.6470588, 1,
-0.2288643, -0.0215076, -1.724416, 0, 1, 0.6509804, 1,
-0.2276648, -0.07280146, -3.683248, 0, 1, 0.6588235, 1,
-0.2245857, 0.03650883, 1.541582, 0, 1, 0.6627451, 1,
-0.2216785, 0.5628743, 1.297739, 0, 1, 0.6705883, 1,
-0.218981, -1.983493, -2.262602, 0, 1, 0.6745098, 1,
-0.2179979, 1.588048, -0.2960371, 0, 1, 0.682353, 1,
-0.2172505, 0.8313311, 0.4299186, 0, 1, 0.6862745, 1,
-0.2148077, -1.727428, -3.942048, 0, 1, 0.6941177, 1,
-0.2133558, -0.3395929, -4.005419, 0, 1, 0.7019608, 1,
-0.2098206, 1.274936, -0.2355964, 0, 1, 0.7058824, 1,
-0.2090945, -0.8084173, -2.20107, 0, 1, 0.7137255, 1,
-0.2089937, -0.2968163, -1.927631, 0, 1, 0.7176471, 1,
-0.203864, 1.562261, 2.035303, 0, 1, 0.7254902, 1,
-0.2037554, 2.709937, 0.5304164, 0, 1, 0.7294118, 1,
-0.1978495, -0.1097671, -2.910332, 0, 1, 0.7372549, 1,
-0.1962712, 0.7256414, -2.303747, 0, 1, 0.7411765, 1,
-0.1942657, -0.802201, -3.745744, 0, 1, 0.7490196, 1,
-0.1924572, -1.247402, -5.482426, 0, 1, 0.7529412, 1,
-0.1879828, -0.3416228, -3.604579, 0, 1, 0.7607843, 1,
-0.1845165, -0.9120756, -3.24836, 0, 1, 0.7647059, 1,
-0.1841799, -0.8840718, -2.264576, 0, 1, 0.772549, 1,
-0.1831696, 2.277951, -0.8032563, 0, 1, 0.7764706, 1,
-0.1827221, 0.4889201, 0.01820436, 0, 1, 0.7843137, 1,
-0.1813546, 0.1899435, -0.9047, 0, 1, 0.7882353, 1,
-0.178798, -1.789808, -2.922426, 0, 1, 0.7960784, 1,
-0.1780187, -0.1978071, -2.242602, 0, 1, 0.8039216, 1,
-0.1779085, 0.3456491, -0.8573993, 0, 1, 0.8078431, 1,
-0.1776616, -0.1619028, -3.320418, 0, 1, 0.8156863, 1,
-0.1717967, 0.7966539, 0.5259264, 0, 1, 0.8196079, 1,
-0.1686982, -0.8691525, -0.7320852, 0, 1, 0.827451, 1,
-0.164721, -0.2289886, -3.120937, 0, 1, 0.8313726, 1,
-0.1594347, -0.521906, -2.205847, 0, 1, 0.8392157, 1,
-0.1572617, -2.33274, -3.005168, 0, 1, 0.8431373, 1,
-0.1570327, 0.1860742, -1.850275, 0, 1, 0.8509804, 1,
-0.1558482, -1.361847, -2.943805, 0, 1, 0.854902, 1,
-0.1520758, 2.854272, 0.8258083, 0, 1, 0.8627451, 1,
-0.1484714, -2.254675, -2.568455, 0, 1, 0.8666667, 1,
-0.148351, -1.606916, -2.047769, 0, 1, 0.8745098, 1,
-0.1471653, -0.1400946, -3.189726, 0, 1, 0.8784314, 1,
-0.1471304, -0.3205418, -2.41978, 0, 1, 0.8862745, 1,
-0.1453604, -0.6472186, -2.147692, 0, 1, 0.8901961, 1,
-0.1451887, -0.7676763, -1.779391, 0, 1, 0.8980392, 1,
-0.1417971, -0.5026747, -1.708453, 0, 1, 0.9058824, 1,
-0.1377278, 0.7719073, 1.410741, 0, 1, 0.9098039, 1,
-0.1337925, -0.1038756, -1.713529, 0, 1, 0.9176471, 1,
-0.1337413, 0.1476506, -1.226761, 0, 1, 0.9215686, 1,
-0.1312213, -0.4906884, -1.067279, 0, 1, 0.9294118, 1,
-0.129917, 1.115659, 0.4529278, 0, 1, 0.9333333, 1,
-0.1282483, 2.09753, 0.4280947, 0, 1, 0.9411765, 1,
-0.1256717, 0.5879125, -0.9643055, 0, 1, 0.945098, 1,
-0.1245739, -1.490497, -4.079238, 0, 1, 0.9529412, 1,
-0.1233977, 1.143348, 0.9924445, 0, 1, 0.9568627, 1,
-0.1170215, 0.7426957, 0.5423951, 0, 1, 0.9647059, 1,
-0.1155973, -0.07036584, -0.573487, 0, 1, 0.9686275, 1,
-0.1123366, -0.7601078, -1.837221, 0, 1, 0.9764706, 1,
-0.1107887, -1.284685, -2.959672, 0, 1, 0.9803922, 1,
-0.109214, -0.9135266, -2.610538, 0, 1, 0.9882353, 1,
-0.1065108, -0.2054168, -3.009748, 0, 1, 0.9921569, 1,
-0.1019204, -0.4139577, -3.213871, 0, 1, 1, 1,
-0.1015008, 1.643961, -1.569716, 0, 0.9921569, 1, 1,
-0.09420066, -2.749841, -3.332212, 0, 0.9882353, 1, 1,
-0.09151985, 1.062224, -1.101451, 0, 0.9803922, 1, 1,
-0.08893318, -0.7735659, -1.803094, 0, 0.9764706, 1, 1,
-0.0835386, 0.4215494, -0.0799891, 0, 0.9686275, 1, 1,
-0.08162051, 0.2133685, -0.1554297, 0, 0.9647059, 1, 1,
-0.08159277, 0.2613895, -1.747681, 0, 0.9568627, 1, 1,
-0.0718983, 0.4402115, -0.6439116, 0, 0.9529412, 1, 1,
-0.07171797, 0.06443565, -1.628356, 0, 0.945098, 1, 1,
-0.07092223, -0.7735053, -3.18845, 0, 0.9411765, 1, 1,
-0.07058696, -0.2733673, -2.769783, 0, 0.9333333, 1, 1,
-0.06987084, 0.01733811, -1.407689, 0, 0.9294118, 1, 1,
-0.06084126, -1.256581, -2.764824, 0, 0.9215686, 1, 1,
-0.06038361, 0.03177347, 0.4918069, 0, 0.9176471, 1, 1,
-0.05964991, -1.389213, -2.480916, 0, 0.9098039, 1, 1,
-0.05074696, -0.8478324, -1.364519, 0, 0.9058824, 1, 1,
-0.05062333, -0.5776309, -3.397292, 0, 0.8980392, 1, 1,
-0.04623434, 0.8212143, 1.178958, 0, 0.8901961, 1, 1,
-0.04308198, -0.3635823, -1.541694, 0, 0.8862745, 1, 1,
-0.04264294, -0.4118703, -3.609714, 0, 0.8784314, 1, 1,
-0.03816561, -1.014127, -3.276392, 0, 0.8745098, 1, 1,
-0.0300063, 0.1555205, 1.501679, 0, 0.8666667, 1, 1,
-0.02517326, 2.275439, 0.5755937, 0, 0.8627451, 1, 1,
-0.02449173, 0.2742406, -0.01880058, 0, 0.854902, 1, 1,
-0.02017947, -1.124911, -0.923243, 0, 0.8509804, 1, 1,
-0.0183208, 1.57205, -1.576653, 0, 0.8431373, 1, 1,
-0.01536134, -0.1322571, -3.468207, 0, 0.8392157, 1, 1,
-0.0145361, 0.1540696, 0.130358, 0, 0.8313726, 1, 1,
-0.01358335, 0.5802767, 1.553754, 0, 0.827451, 1, 1,
-0.01337749, 0.4484242, -0.6663565, 0, 0.8196079, 1, 1,
-0.01209179, -0.07911006, -3.043077, 0, 0.8156863, 1, 1,
-0.01027733, -0.0392963, -2.595359, 0, 0.8078431, 1, 1,
-0.009287162, -0.05252105, -3.123996, 0, 0.8039216, 1, 1,
-0.007989154, 1.835869, -0.6308931, 0, 0.7960784, 1, 1,
-0.005753485, -0.8416873, -3.151141, 0, 0.7882353, 1, 1,
-0.004227198, -1.283427, -4.545043, 0, 0.7843137, 1, 1,
-0.002279795, -0.01478596, -3.729024, 0, 0.7764706, 1, 1,
-0.0006902207, -1.461386, -2.224311, 0, 0.772549, 1, 1,
-0.0006178221, -1.053902, -3.984971, 0, 0.7647059, 1, 1,
1.907245e-05, 1.639909, 0.7297421, 0, 0.7607843, 1, 1,
0.00172285, 0.8989005, -1.563986, 0, 0.7529412, 1, 1,
0.005438471, 0.8247073, -0.1021951, 0, 0.7490196, 1, 1,
0.00580895, -0.4514042, 4.131579, 0, 0.7411765, 1, 1,
0.01071509, -0.2594237, 2.273116, 0, 0.7372549, 1, 1,
0.01523317, 0.481462, -0.3646926, 0, 0.7294118, 1, 1,
0.01651297, -0.2124544, 4.552159, 0, 0.7254902, 1, 1,
0.01780656, 0.6435921, -2.46828, 0, 0.7176471, 1, 1,
0.01828268, -0.5345262, 4.479043, 0, 0.7137255, 1, 1,
0.01935587, -0.9900143, 3.564596, 0, 0.7058824, 1, 1,
0.02777296, -1.02066, 3.402639, 0, 0.6980392, 1, 1,
0.03068637, -0.9317788, 1.063026, 0, 0.6941177, 1, 1,
0.03642569, -1.720866, 3.905161, 0, 0.6862745, 1, 1,
0.04026406, 2.621565, -0.639383, 0, 0.682353, 1, 1,
0.04068439, -1.211571, 3.000082, 0, 0.6745098, 1, 1,
0.04201433, -0.2281047, 3.818269, 0, 0.6705883, 1, 1,
0.04314147, -1.618944, 2.648336, 0, 0.6627451, 1, 1,
0.04753142, 0.1486526, 2.207798, 0, 0.6588235, 1, 1,
0.04817923, 2.133826, 0.2182523, 0, 0.6509804, 1, 1,
0.05042006, -0.4489223, 5.033017, 0, 0.6470588, 1, 1,
0.05118031, 0.9037325, -2.001244, 0, 0.6392157, 1, 1,
0.05220574, -2.537273, 3.430448, 0, 0.6352941, 1, 1,
0.05237762, 2.371678, -0.4761352, 0, 0.627451, 1, 1,
0.05296291, -1.581965, 3.708605, 0, 0.6235294, 1, 1,
0.05828786, -0.7495466, 3.023412, 0, 0.6156863, 1, 1,
0.06100411, 0.3666763, 0.614611, 0, 0.6117647, 1, 1,
0.06416237, 0.5468487, 1.378684, 0, 0.6039216, 1, 1,
0.06575041, -0.7630443, 3.284966, 0, 0.5960785, 1, 1,
0.06631385, -0.800047, 2.562403, 0, 0.5921569, 1, 1,
0.06636646, 0.8695486, 0.6465745, 0, 0.5843138, 1, 1,
0.07064178, 0.8177977, -1.083327, 0, 0.5803922, 1, 1,
0.07225237, -1.386406, 2.049216, 0, 0.572549, 1, 1,
0.07329227, 0.7819384, 0.55542, 0, 0.5686275, 1, 1,
0.07452803, -0.4380433, 3.927741, 0, 0.5607843, 1, 1,
0.07453608, 0.4700565, 0.1126807, 0, 0.5568628, 1, 1,
0.07933149, -0.8126044, 5.532788, 0, 0.5490196, 1, 1,
0.08405124, 2.17107, 1.182612, 0, 0.5450981, 1, 1,
0.08437387, 1.039145, -0.2404244, 0, 0.5372549, 1, 1,
0.08934764, -0.6461114, 1.664144, 0, 0.5333334, 1, 1,
0.09402268, -0.6244636, 3.927399, 0, 0.5254902, 1, 1,
0.09509047, -0.4055731, 3.148206, 0, 0.5215687, 1, 1,
0.09530301, 0.8877215, 0.006369987, 0, 0.5137255, 1, 1,
0.1024324, -0.1101305, 1.915716, 0, 0.509804, 1, 1,
0.1075002, -1.604377, 3.262785, 0, 0.5019608, 1, 1,
0.1126822, -0.1331557, 2.919065, 0, 0.4941176, 1, 1,
0.1132488, 0.9950253, 2.434232, 0, 0.4901961, 1, 1,
0.1141404, 0.7634215, -0.06366636, 0, 0.4823529, 1, 1,
0.1143584, 0.1594211, 0.4482113, 0, 0.4784314, 1, 1,
0.1146552, -1.086291, 2.014578, 0, 0.4705882, 1, 1,
0.1185745, -0.4672465, 3.079175, 0, 0.4666667, 1, 1,
0.1191199, 0.2067077, 1.673329, 0, 0.4588235, 1, 1,
0.119488, -0.9104397, 3.357009, 0, 0.454902, 1, 1,
0.1201729, -1.857322, 2.867744, 0, 0.4470588, 1, 1,
0.1204138, -0.5738319, 3.368336, 0, 0.4431373, 1, 1,
0.1276383, -0.4994527, 2.011699, 0, 0.4352941, 1, 1,
0.1322165, 0.07029323, 0.9835978, 0, 0.4313726, 1, 1,
0.1378111, 0.6940721, 0.1931627, 0, 0.4235294, 1, 1,
0.1380942, 0.6181819, 0.6189443, 0, 0.4196078, 1, 1,
0.1395495, 1.747222, -1.278697, 0, 0.4117647, 1, 1,
0.1465444, -0.1069212, 1.155488, 0, 0.4078431, 1, 1,
0.1481784, 0.1156016, -0.7021694, 0, 0.4, 1, 1,
0.1518528, 0.6091437, 0.105828, 0, 0.3921569, 1, 1,
0.152263, -1.333269, 3.193943, 0, 0.3882353, 1, 1,
0.1653608, -1.763902, 3.009542, 0, 0.3803922, 1, 1,
0.1674903, -1.396081, 4.275218, 0, 0.3764706, 1, 1,
0.1690648, -0.4253577, 3.003896, 0, 0.3686275, 1, 1,
0.1708524, -1.577773, 1.32116, 0, 0.3647059, 1, 1,
0.1718937, 0.7220216, -1.592263, 0, 0.3568628, 1, 1,
0.1726953, 0.819804, -0.35839, 0, 0.3529412, 1, 1,
0.1755162, -2.03047, 3.20241, 0, 0.345098, 1, 1,
0.1798712, -0.1509956, 1.964118, 0, 0.3411765, 1, 1,
0.1804453, -0.08899768, 1.563695, 0, 0.3333333, 1, 1,
0.1827954, -0.9849319, 1.228461, 0, 0.3294118, 1, 1,
0.1856682, 0.63559, 0.769469, 0, 0.3215686, 1, 1,
0.1878991, -0.6235086, 3.158246, 0, 0.3176471, 1, 1,
0.1894918, -1.26958, 2.953219, 0, 0.3098039, 1, 1,
0.1902578, -1.081039, 3.263675, 0, 0.3058824, 1, 1,
0.1918487, -1.949769, 4.420496, 0, 0.2980392, 1, 1,
0.1959894, 0.06210605, 1.803516, 0, 0.2901961, 1, 1,
0.1962999, -0.1328127, 3.873717, 0, 0.2862745, 1, 1,
0.2031022, -0.2739979, 2.811781, 0, 0.2784314, 1, 1,
0.2090616, 0.943285, 0.04511568, 0, 0.2745098, 1, 1,
0.2096901, 0.3825748, 0.02742339, 0, 0.2666667, 1, 1,
0.2101777, -0.8082622, 2.320907, 0, 0.2627451, 1, 1,
0.2103583, 0.06017277, 1.24419, 0, 0.254902, 1, 1,
0.2239435, 0.6662571, 1.385175, 0, 0.2509804, 1, 1,
0.2247769, 0.9016066, 0.3356291, 0, 0.2431373, 1, 1,
0.2253052, -0.4564618, 4.293931, 0, 0.2392157, 1, 1,
0.2257179, -0.01337114, 0.2947953, 0, 0.2313726, 1, 1,
0.2269619, 1.828113, -1.638861, 0, 0.227451, 1, 1,
0.2270056, -1.69356, 2.387908, 0, 0.2196078, 1, 1,
0.2276979, -0.8912577, 2.885392, 0, 0.2156863, 1, 1,
0.2352958, -1.340367, 2.454714, 0, 0.2078431, 1, 1,
0.2369592, -1.488927, 2.863249, 0, 0.2039216, 1, 1,
0.2379412, -0.3847911, 2.041474, 0, 0.1960784, 1, 1,
0.2434478, -0.5224668, 3.117066, 0, 0.1882353, 1, 1,
0.2456207, -1.906064, 2.209836, 0, 0.1843137, 1, 1,
0.2496116, -0.6862866, 3.831743, 0, 0.1764706, 1, 1,
0.2513037, -0.4616222, 3.262679, 0, 0.172549, 1, 1,
0.2536492, 0.6119221, 1.104745, 0, 0.1647059, 1, 1,
0.2539056, 1.094506, -0.4674736, 0, 0.1607843, 1, 1,
0.2568828, -0.2301282, 2.321096, 0, 0.1529412, 1, 1,
0.2580806, -1.475424, 2.864043, 0, 0.1490196, 1, 1,
0.2597776, 0.3860323, 1.606609, 0, 0.1411765, 1, 1,
0.2628199, 0.952842, -0.1766126, 0, 0.1372549, 1, 1,
0.2652984, -0.01973405, 0.7186286, 0, 0.1294118, 1, 1,
0.2706422, 0.8995781, -1.642794, 0, 0.1254902, 1, 1,
0.2741068, 1.606725, -0.4106095, 0, 0.1176471, 1, 1,
0.2746601, -1.001491, 2.986816, 0, 0.1137255, 1, 1,
0.27792, 0.274005, 0.6019382, 0, 0.1058824, 1, 1,
0.289001, 0.7548268, -1.012967, 0, 0.09803922, 1, 1,
0.292001, -0.9318804, 3.821589, 0, 0.09411765, 1, 1,
0.2959428, 1.686811, -0.6373537, 0, 0.08627451, 1, 1,
0.295977, -0.2683645, 1.78833, 0, 0.08235294, 1, 1,
0.2967334, -0.8540843, 2.808382, 0, 0.07450981, 1, 1,
0.2969294, -0.5333885, 2.403228, 0, 0.07058824, 1, 1,
0.300648, 0.8924946, 1.228363, 0, 0.0627451, 1, 1,
0.3011894, 0.7525982, 0.6528163, 0, 0.05882353, 1, 1,
0.301585, -0.4541925, 0.6577195, 0, 0.05098039, 1, 1,
0.305682, 0.7211987, 0.2019117, 0, 0.04705882, 1, 1,
0.308413, -0.0561449, 1.223583, 0, 0.03921569, 1, 1,
0.3127517, -0.409312, 2.186734, 0, 0.03529412, 1, 1,
0.3162651, -0.4483918, 1.897435, 0, 0.02745098, 1, 1,
0.3222967, 1.063197, 0.1170386, 0, 0.02352941, 1, 1,
0.3233632, 0.5700762, -0.302984, 0, 0.01568628, 1, 1,
0.326179, 2.269255, 0.3594314, 0, 0.01176471, 1, 1,
0.3282975, 1.073581, 0.4321482, 0, 0.003921569, 1, 1,
0.3287105, -0.917767, 3.71454, 0.003921569, 0, 1, 1,
0.333775, 0.9732586, 0.5278367, 0.007843138, 0, 1, 1,
0.3368746, 0.6186309, 1.393717, 0.01568628, 0, 1, 1,
0.340222, -0.2683777, 2.987456, 0.01960784, 0, 1, 1,
0.3435166, 1.87376, 1.304422, 0.02745098, 0, 1, 1,
0.3446879, -0.6432932, 2.757795, 0.03137255, 0, 1, 1,
0.3449762, -0.03909287, 1.403518, 0.03921569, 0, 1, 1,
0.3471995, -0.1863599, 2.535676, 0.04313726, 0, 1, 1,
0.3499967, -1.02726, 1.05749, 0.05098039, 0, 1, 1,
0.3534809, 0.3558259, -1.526313, 0.05490196, 0, 1, 1,
0.3535735, 0.2258897, 1.457983, 0.0627451, 0, 1, 1,
0.3574648, 0.002524364, 0.4053428, 0.06666667, 0, 1, 1,
0.3600063, -1.029765, 2.886617, 0.07450981, 0, 1, 1,
0.3606216, -0.04981028, 0.6875076, 0.07843138, 0, 1, 1,
0.3707619, 1.047564, 0.268164, 0.08627451, 0, 1, 1,
0.3719995, -0.6759031, 2.370404, 0.09019608, 0, 1, 1,
0.3725063, 1.381761, 0.7776936, 0.09803922, 0, 1, 1,
0.3741229, 0.6207435, 1.27083, 0.1058824, 0, 1, 1,
0.3766034, 0.6078625, -0.2967988, 0.1098039, 0, 1, 1,
0.376961, -0.9818588, 2.92718, 0.1176471, 0, 1, 1,
0.3779962, -0.4587478, 1.830092, 0.1215686, 0, 1, 1,
0.378746, 0.6104372, 2.607879, 0.1294118, 0, 1, 1,
0.3797573, -1.800368, 2.437383, 0.1333333, 0, 1, 1,
0.379782, -1.291977, 2.532716, 0.1411765, 0, 1, 1,
0.3811297, 1.71883, 1.672254, 0.145098, 0, 1, 1,
0.381131, -0.6735389, 2.792691, 0.1529412, 0, 1, 1,
0.3814551, -0.5852636, 4.981055, 0.1568628, 0, 1, 1,
0.381743, -0.08774965, -0.4722488, 0.1647059, 0, 1, 1,
0.3838014, -0.9568337, 2.15408, 0.1686275, 0, 1, 1,
0.3859376, -1.500563, 1.267121, 0.1764706, 0, 1, 1,
0.3864541, 1.168749, -0.4632849, 0.1803922, 0, 1, 1,
0.3868018, 1.145396, 1.250869, 0.1882353, 0, 1, 1,
0.3895579, -1.657662, 2.124244, 0.1921569, 0, 1, 1,
0.3940657, -0.4292905, 3.96711, 0.2, 0, 1, 1,
0.3953032, 2.34035, -1.866847, 0.2078431, 0, 1, 1,
0.3953145, -1.096602, 3.42687, 0.2117647, 0, 1, 1,
0.3964743, 0.2756447, 0.4634123, 0.2196078, 0, 1, 1,
0.3999898, -1.705222, 2.280526, 0.2235294, 0, 1, 1,
0.4031625, -0.4493432, 2.784208, 0.2313726, 0, 1, 1,
0.4055514, 2.650578, 0.5071452, 0.2352941, 0, 1, 1,
0.4103061, 1.306826, -0.06568733, 0.2431373, 0, 1, 1,
0.411814, 0.3528601, 0.9290209, 0.2470588, 0, 1, 1,
0.4144617, 2.384152, -0.4343258, 0.254902, 0, 1, 1,
0.4183747, -0.5164597, 3.468258, 0.2588235, 0, 1, 1,
0.419282, 0.6557283, 1.660847, 0.2666667, 0, 1, 1,
0.4239152, -0.1513473, 1.470326, 0.2705882, 0, 1, 1,
0.4274571, -0.712952, 3.597569, 0.2784314, 0, 1, 1,
0.4282315, 2.430978, 2.127542, 0.282353, 0, 1, 1,
0.4314463, -2.357134, 3.033329, 0.2901961, 0, 1, 1,
0.4401172, -0.2196156, 2.307772, 0.2941177, 0, 1, 1,
0.4416249, 1.338124, 0.3036823, 0.3019608, 0, 1, 1,
0.4438933, 0.385994, 1.4813, 0.3098039, 0, 1, 1,
0.4469708, -0.963326, 3.098367, 0.3137255, 0, 1, 1,
0.4490308, 0.5178286, -0.08312511, 0.3215686, 0, 1, 1,
0.4495976, 1.192289, -1.125415, 0.3254902, 0, 1, 1,
0.4518603, -1.309178, 3.332866, 0.3333333, 0, 1, 1,
0.4524143, 0.4488918, 0.5458205, 0.3372549, 0, 1, 1,
0.4542639, 1.083299, 0.6215099, 0.345098, 0, 1, 1,
0.4580951, -0.5469823, 1.313588, 0.3490196, 0, 1, 1,
0.4626402, 0.5878238, 1.293826, 0.3568628, 0, 1, 1,
0.4651365, 0.8751368, 0.4714932, 0.3607843, 0, 1, 1,
0.4658612, 1.501597, -0.2602651, 0.3686275, 0, 1, 1,
0.4682318, 0.4147034, 0.3061492, 0.372549, 0, 1, 1,
0.4773211, -2.07573, 2.726566, 0.3803922, 0, 1, 1,
0.4826358, -0.9840246, 3.095872, 0.3843137, 0, 1, 1,
0.4829729, 0.1793048, 0.580147, 0.3921569, 0, 1, 1,
0.4869375, 0.5800536, 0.1326872, 0.3960784, 0, 1, 1,
0.4977709, -0.1699789, 0.600772, 0.4039216, 0, 1, 1,
0.4984712, 0.8096454, 1.677948, 0.4117647, 0, 1, 1,
0.4988883, -0.9422475, 4.053848, 0.4156863, 0, 1, 1,
0.5070433, 0.1724455, 1.681898, 0.4235294, 0, 1, 1,
0.5079794, -0.2456675, 2.227528, 0.427451, 0, 1, 1,
0.5089785, 0.3711824, 1.94338, 0.4352941, 0, 1, 1,
0.5103385, -1.354187, 2.564755, 0.4392157, 0, 1, 1,
0.5185418, 0.246582, 0.7495963, 0.4470588, 0, 1, 1,
0.5192872, 0.9630344, 0.7194464, 0.4509804, 0, 1, 1,
0.5467783, -2.791484, 6.089553, 0.4588235, 0, 1, 1,
0.5471804, 0.1070943, 2.130793, 0.4627451, 0, 1, 1,
0.5487387, -0.1618488, 1.106746, 0.4705882, 0, 1, 1,
0.5492269, -0.8693975, 2.156403, 0.4745098, 0, 1, 1,
0.5499738, -1.778268, 3.505566, 0.4823529, 0, 1, 1,
0.5516624, -1.728663, 3.23345, 0.4862745, 0, 1, 1,
0.5516657, 0.1813, 2.370921, 0.4941176, 0, 1, 1,
0.553982, 0.5124771, -2.052225, 0.5019608, 0, 1, 1,
0.5584897, 0.6730291, 0.04705883, 0.5058824, 0, 1, 1,
0.5595728, -0.06305289, 0.8870164, 0.5137255, 0, 1, 1,
0.5619455, 0.6825063, 2.197839, 0.5176471, 0, 1, 1,
0.5670009, 0.3631691, -0.2337646, 0.5254902, 0, 1, 1,
0.567139, -0.7498073, 1.600735, 0.5294118, 0, 1, 1,
0.573477, -0.3480411, 3.15954, 0.5372549, 0, 1, 1,
0.5800664, -1.870584, 2.878546, 0.5411765, 0, 1, 1,
0.5844834, 1.812578, -0.6623654, 0.5490196, 0, 1, 1,
0.5851716, -0.3506416, 1.364118, 0.5529412, 0, 1, 1,
0.5886303, -0.2801115, 0.9882643, 0.5607843, 0, 1, 1,
0.6000898, -0.6876369, 1.291775, 0.5647059, 0, 1, 1,
0.6038677, 0.3829404, 0.8941961, 0.572549, 0, 1, 1,
0.6067311, 0.7603828, 0.4652656, 0.5764706, 0, 1, 1,
0.6083574, -1.17543, 2.100637, 0.5843138, 0, 1, 1,
0.6150283, 0.484829, 1.260363, 0.5882353, 0, 1, 1,
0.617111, 0.004557873, 3.324902, 0.5960785, 0, 1, 1,
0.618383, -0.4653312, 3.44511, 0.6039216, 0, 1, 1,
0.6196598, 0.04483736, 0.1965235, 0.6078432, 0, 1, 1,
0.6201779, -0.5930229, 2.951516, 0.6156863, 0, 1, 1,
0.6224905, -0.03432254, 1.274589, 0.6196079, 0, 1, 1,
0.623564, 0.6853069, 0.798192, 0.627451, 0, 1, 1,
0.6244124, -1.285066, 2.543496, 0.6313726, 0, 1, 1,
0.6260215, 0.2802742, 1.269757, 0.6392157, 0, 1, 1,
0.628891, 1.353325, -0.9100202, 0.6431373, 0, 1, 1,
0.6387187, 1.09494, 0.1851535, 0.6509804, 0, 1, 1,
0.6406256, -0.4019015, 2.358875, 0.654902, 0, 1, 1,
0.6417857, -1.003633, 2.920445, 0.6627451, 0, 1, 1,
0.642167, -0.1732578, 2.668635, 0.6666667, 0, 1, 1,
0.6446339, -0.9180726, 2.919703, 0.6745098, 0, 1, 1,
0.6458179, -1.00743, 2.989022, 0.6784314, 0, 1, 1,
0.6494883, -0.1122585, 0.6721421, 0.6862745, 0, 1, 1,
0.6499444, 0.2234985, 1.238399, 0.6901961, 0, 1, 1,
0.6587233, -0.4049852, 1.671983, 0.6980392, 0, 1, 1,
0.6588216, -1.179371, 2.016257, 0.7058824, 0, 1, 1,
0.6672475, -0.5699845, 0.1308482, 0.7098039, 0, 1, 1,
0.6767803, -0.9008338, 2.601303, 0.7176471, 0, 1, 1,
0.683744, -1.337601, 2.323873, 0.7215686, 0, 1, 1,
0.6969781, -0.4067998, 2.190819, 0.7294118, 0, 1, 1,
0.6979897, -0.2793123, 1.784494, 0.7333333, 0, 1, 1,
0.6983466, -2.375344, 0.9177992, 0.7411765, 0, 1, 1,
0.7006681, -1.713416, 4.447234, 0.7450981, 0, 1, 1,
0.7055048, 0.8969038, -0.7310344, 0.7529412, 0, 1, 1,
0.7117031, -1.680378, 2.933116, 0.7568628, 0, 1, 1,
0.7123798, 0.4534436, 1.991761, 0.7647059, 0, 1, 1,
0.7133853, 0.09156448, -1.249769, 0.7686275, 0, 1, 1,
0.7144356, 0.5196276, 1.190321, 0.7764706, 0, 1, 1,
0.7147083, -0.1937318, 1.825877, 0.7803922, 0, 1, 1,
0.720508, -0.7195578, 2.915959, 0.7882353, 0, 1, 1,
0.7312748, -0.6924405, 2.881089, 0.7921569, 0, 1, 1,
0.7361563, 1.441679, -0.1156283, 0.8, 0, 1, 1,
0.7409398, 0.6719998, 2.685852, 0.8078431, 0, 1, 1,
0.7448959, -0.1449203, 1.436884, 0.8117647, 0, 1, 1,
0.7453871, 0.5838258, -0.6463119, 0.8196079, 0, 1, 1,
0.7490144, -0.254455, 3.359478, 0.8235294, 0, 1, 1,
0.762559, 1.069277, 1.039213, 0.8313726, 0, 1, 1,
0.763046, 0.872026, 0.1699103, 0.8352941, 0, 1, 1,
0.7697921, -0.469671, 2.554964, 0.8431373, 0, 1, 1,
0.7775937, -0.2428367, 1.412997, 0.8470588, 0, 1, 1,
0.7776472, -1.088201, 1.517361, 0.854902, 0, 1, 1,
0.7785584, 0.6585488, -0.05732271, 0.8588235, 0, 1, 1,
0.780387, -1.755935, 1.514517, 0.8666667, 0, 1, 1,
0.7833948, 2.950654, 0.5162869, 0.8705882, 0, 1, 1,
0.7877889, -0.7686925, 3.956442, 0.8784314, 0, 1, 1,
0.7878072, 0.3726924, 0.8583867, 0.8823529, 0, 1, 1,
0.7923132, -0.7341686, 0.7407521, 0.8901961, 0, 1, 1,
0.8051416, 0.7449032, 1.772359, 0.8941177, 0, 1, 1,
0.8084751, 0.557649, 1.27024, 0.9019608, 0, 1, 1,
0.8112409, -0.6953544, 0.686709, 0.9098039, 0, 1, 1,
0.8209921, 0.9007252, 0.02953714, 0.9137255, 0, 1, 1,
0.824886, -0.9426246, 4.178511, 0.9215686, 0, 1, 1,
0.8253112, -0.574983, 2.785996, 0.9254902, 0, 1, 1,
0.8343619, -1.563758, 4.520085, 0.9333333, 0, 1, 1,
0.8346349, -1.387499, 3.286793, 0.9372549, 0, 1, 1,
0.8350819, 0.6346968, -0.02290924, 0.945098, 0, 1, 1,
0.8371685, 1.575164, 0.1592929, 0.9490196, 0, 1, 1,
0.8386666, -1.544031, 3.132683, 0.9568627, 0, 1, 1,
0.8423377, -0.4941489, 1.195234, 0.9607843, 0, 1, 1,
0.8431678, -1.201628, 3.616432, 0.9686275, 0, 1, 1,
0.8445627, 1.561667, -0.2714365, 0.972549, 0, 1, 1,
0.8476573, -0.7437895, 1.963064, 0.9803922, 0, 1, 1,
0.8505896, 0.1901172, 1.844742, 0.9843137, 0, 1, 1,
0.8568907, 0.399856, 1.847152, 0.9921569, 0, 1, 1,
0.8599997, 1.356875, 1.764035, 0.9960784, 0, 1, 1,
0.8698477, 0.5030318, 1.341937, 1, 0, 0.9960784, 1,
0.8772532, 0.5597807, 1.343624, 1, 0, 0.9882353, 1,
0.8790322, 0.5902805, -0.7693722, 1, 0, 0.9843137, 1,
0.8870562, -0.8929158, 1.381055, 1, 0, 0.9764706, 1,
0.8946925, -0.5574255, 1.731989, 1, 0, 0.972549, 1,
0.9140747, 0.2195406, 0.9098992, 1, 0, 0.9647059, 1,
0.9161133, 0.7600574, -0.8090546, 1, 0, 0.9607843, 1,
0.921136, -0.4095421, 1.723786, 1, 0, 0.9529412, 1,
0.9275349, 0.7288426, 2.142671, 1, 0, 0.9490196, 1,
0.9524758, 0.7669901, 2.141756, 1, 0, 0.9411765, 1,
0.9527737, 1.174399, 0.335388, 1, 0, 0.9372549, 1,
0.9577166, -0.5465029, 0.6394327, 1, 0, 0.9294118, 1,
0.9603927, -0.1718609, 1.71189, 1, 0, 0.9254902, 1,
0.9655584, -0.8841857, 2.087486, 1, 0, 0.9176471, 1,
0.9657429, 0.2691016, 0.7667278, 1, 0, 0.9137255, 1,
0.9686183, 1.182578, -0.3025312, 1, 0, 0.9058824, 1,
0.9770702, 0.8272579, -1.105424, 1, 0, 0.9019608, 1,
0.9859837, 2.173264, -1.64063, 1, 0, 0.8941177, 1,
0.9907369, 0.4487869, 2.822596, 1, 0, 0.8862745, 1,
1.00419, -0.04707683, 1.411961, 1, 0, 0.8823529, 1,
1.007934, 0.4440259, 3.016779, 1, 0, 0.8745098, 1,
1.022401, -0.1678933, 2.694375, 1, 0, 0.8705882, 1,
1.024447, -1.344803, 3.583467, 1, 0, 0.8627451, 1,
1.031861, -1.371658, 0.8054373, 1, 0, 0.8588235, 1,
1.037353, 0.950492, 0.1420807, 1, 0, 0.8509804, 1,
1.041919, -1.368445, 2.066996, 1, 0, 0.8470588, 1,
1.046782, 1.025303, -1.125848, 1, 0, 0.8392157, 1,
1.04766, 0.1402444, 1.735837, 1, 0, 0.8352941, 1,
1.049542, -1.689008, 3.740877, 1, 0, 0.827451, 1,
1.054422, -0.06785505, 0.936262, 1, 0, 0.8235294, 1,
1.070283, 2.264499, 1.734254, 1, 0, 0.8156863, 1,
1.077629, 0.165067, 1.020219, 1, 0, 0.8117647, 1,
1.079389, 1.527639, 0.6424342, 1, 0, 0.8039216, 1,
1.082013, 0.7369529, 1.869657, 1, 0, 0.7960784, 1,
1.090968, -1.17007, 2.15539, 1, 0, 0.7921569, 1,
1.095771, -1.127326, 3.009613, 1, 0, 0.7843137, 1,
1.09931, -0.1320524, 1.573057, 1, 0, 0.7803922, 1,
1.100769, 0.02837676, 2.777647, 1, 0, 0.772549, 1,
1.101246, 0.6541305, 1.5878, 1, 0, 0.7686275, 1,
1.103273, -1.209631, 2.524771, 1, 0, 0.7607843, 1,
1.107493, 0.3876263, 0.9487916, 1, 0, 0.7568628, 1,
1.113235, -0.4438872, 1.275064, 1, 0, 0.7490196, 1,
1.114193, -0.1471532, 2.359751, 1, 0, 0.7450981, 1,
1.119159, -0.6337529, 2.15582, 1, 0, 0.7372549, 1,
1.119985, 0.1013932, 2.002092, 1, 0, 0.7333333, 1,
1.136826, -1.511197, 4.236213, 1, 0, 0.7254902, 1,
1.137202, -0.3126405, 2.52661, 1, 0, 0.7215686, 1,
1.142413, 0.274315, 1.458258, 1, 0, 0.7137255, 1,
1.145333, 0.5084435, 1.765611, 1, 0, 0.7098039, 1,
1.154718, 0.9565487, 0.8938177, 1, 0, 0.7019608, 1,
1.156637, 1.631537, 1.655727, 1, 0, 0.6941177, 1,
1.159621, -2.672897, 4.013386, 1, 0, 0.6901961, 1,
1.160471, -1.492098, 3.76182, 1, 0, 0.682353, 1,
1.162591, -0.2733827, 2.318836, 1, 0, 0.6784314, 1,
1.173952, 0.5152743, 0.1639975, 1, 0, 0.6705883, 1,
1.177455, 0.3446679, 1.621528, 1, 0, 0.6666667, 1,
1.193658, -0.7247201, 2.62625, 1, 0, 0.6588235, 1,
1.210388, -1.166328, 1.121041, 1, 0, 0.654902, 1,
1.210552, 1.051663, 0.4306903, 1, 0, 0.6470588, 1,
1.211093, -0.3392306, 0.8989094, 1, 0, 0.6431373, 1,
1.211994, -1.481611, 1.112729, 1, 0, 0.6352941, 1,
1.226474, -0.4541296, 1.779088, 1, 0, 0.6313726, 1,
1.23558, 0.01015096, 0.5368285, 1, 0, 0.6235294, 1,
1.238998, -0.3554609, 1.56514, 1, 0, 0.6196079, 1,
1.243167, 0.5760875, 0.5113345, 1, 0, 0.6117647, 1,
1.253305, -2.644367, 1.571435, 1, 0, 0.6078432, 1,
1.272761, -0.8772503, 1.484614, 1, 0, 0.6, 1,
1.274298, -1.191876, 3.743217, 1, 0, 0.5921569, 1,
1.279613, -1.40786, 2.577721, 1, 0, 0.5882353, 1,
1.283412, 0.7980077, 0.4277783, 1, 0, 0.5803922, 1,
1.290087, 0.5963427, 2.288268, 1, 0, 0.5764706, 1,
1.295975, 0.6637606, 0.3439078, 1, 0, 0.5686275, 1,
1.295984, 0.6335425, 2.127882, 1, 0, 0.5647059, 1,
1.296958, -1.191873, 3.492764, 1, 0, 0.5568628, 1,
1.306488, 0.9789108, 2.794477, 1, 0, 0.5529412, 1,
1.307914, 0.1576649, 0.4643711, 1, 0, 0.5450981, 1,
1.308736, 0.09409791, 2.166269, 1, 0, 0.5411765, 1,
1.310669, 0.1349821, 1.436715, 1, 0, 0.5333334, 1,
1.31503, -1.021749, 1.398851, 1, 0, 0.5294118, 1,
1.329063, 0.86876, 2.855795, 1, 0, 0.5215687, 1,
1.331895, -1.779835, -0.06059229, 1, 0, 0.5176471, 1,
1.333975, -1.312838, 3.631702, 1, 0, 0.509804, 1,
1.349328, -0.6310764, 2.412313, 1, 0, 0.5058824, 1,
1.361868, -1.085709, 2.60278, 1, 0, 0.4980392, 1,
1.362302, 0.2091792, 0.7865578, 1, 0, 0.4901961, 1,
1.365342, -0.8488694, 2.416697, 1, 0, 0.4862745, 1,
1.403017, 0.5255728, 2.259171, 1, 0, 0.4784314, 1,
1.4049, 1.556541, 0.4197112, 1, 0, 0.4745098, 1,
1.409759, 1.351559, 2.827285, 1, 0, 0.4666667, 1,
1.411244, 0.852006, -0.6656641, 1, 0, 0.4627451, 1,
1.421789, 1.630775, 0.8317297, 1, 0, 0.454902, 1,
1.429038, -0.3589533, 1.300009, 1, 0, 0.4509804, 1,
1.429627, -1.359499, 4.230049, 1, 0, 0.4431373, 1,
1.43221, -0.4574683, 2.682185, 1, 0, 0.4392157, 1,
1.437597, 0.9674443, 2.682978, 1, 0, 0.4313726, 1,
1.454232, -0.3618559, 1.341832, 1, 0, 0.427451, 1,
1.481898, -0.001202436, 0.6962272, 1, 0, 0.4196078, 1,
1.490678, -2.234256, 3.76646, 1, 0, 0.4156863, 1,
1.493683, -1.417691, 2.244012, 1, 0, 0.4078431, 1,
1.50195, 0.2931021, 2.156939, 1, 0, 0.4039216, 1,
1.535734, -0.3205487, 4.016387, 1, 0, 0.3960784, 1,
1.55746, -0.02530632, 1.340546, 1, 0, 0.3882353, 1,
1.558791, -0.7889557, 1.907781, 1, 0, 0.3843137, 1,
1.566057, 0.5957181, 0.6015607, 1, 0, 0.3764706, 1,
1.576178, -1.513722, 2.960861, 1, 0, 0.372549, 1,
1.57805, 1.624983, 2.861033, 1, 0, 0.3647059, 1,
1.579221, 0.1306854, 3.483733, 1, 0, 0.3607843, 1,
1.583273, 1.544389, 0.9211885, 1, 0, 0.3529412, 1,
1.595912, -1.1553, 2.160559, 1, 0, 0.3490196, 1,
1.60499, 0.9037163, 1.390676, 1, 0, 0.3411765, 1,
1.607085, 1.019731, 1.539256, 1, 0, 0.3372549, 1,
1.610812, 0.6521206, 1.109523, 1, 0, 0.3294118, 1,
1.613587, -0.5442038, 1.937441, 1, 0, 0.3254902, 1,
1.630536, 0.005311897, 1.365971, 1, 0, 0.3176471, 1,
1.636798, 1.352849, 0.9155747, 1, 0, 0.3137255, 1,
1.65029, -0.8164505, 0.8903744, 1, 0, 0.3058824, 1,
1.653232, -0.1056139, 2.971181, 1, 0, 0.2980392, 1,
1.659769, 0.4505545, 2.79082, 1, 0, 0.2941177, 1,
1.670206, -0.6284237, 2.444725, 1, 0, 0.2862745, 1,
1.672016, 0.4158488, 0.848254, 1, 0, 0.282353, 1,
1.673244, 0.2568632, 2.700747, 1, 0, 0.2745098, 1,
1.679992, 0.4249909, 0.3492395, 1, 0, 0.2705882, 1,
1.691496, 0.5521722, -0.4139263, 1, 0, 0.2627451, 1,
1.693022, -0.787376, 2.366619, 1, 0, 0.2588235, 1,
1.705637, -0.1312757, 2.805437, 1, 0, 0.2509804, 1,
1.707011, -2.031145, 2.884434, 1, 0, 0.2470588, 1,
1.712815, -0.9903631, 2.217206, 1, 0, 0.2392157, 1,
1.716876, -0.4567997, 0.7055041, 1, 0, 0.2352941, 1,
1.720316, 0.9868217, 2.506231, 1, 0, 0.227451, 1,
1.761033, 0.1517895, 3.166464, 1, 0, 0.2235294, 1,
1.784664, -0.7053783, -0.09139875, 1, 0, 0.2156863, 1,
1.78701, -0.5408283, 0.275714, 1, 0, 0.2117647, 1,
1.806964, -1.672763, 0.7627624, 1, 0, 0.2039216, 1,
1.825225, -1.647777, 1.868433, 1, 0, 0.1960784, 1,
1.847376, 0.1004463, 1.233077, 1, 0, 0.1921569, 1,
1.848626, 0.4826477, 0.7818706, 1, 0, 0.1843137, 1,
1.857679, -0.4199557, 3.139832, 1, 0, 0.1803922, 1,
1.877438, -1.739423, 3.97044, 1, 0, 0.172549, 1,
1.885609, 0.1038803, 2.390693, 1, 0, 0.1686275, 1,
1.906026, -0.01183434, -0.1489631, 1, 0, 0.1607843, 1,
1.90635, -0.3841765, 0.8567649, 1, 0, 0.1568628, 1,
1.931356, 1.104002, 0.1014731, 1, 0, 0.1490196, 1,
1.946164, -0.4036541, 1.292206, 1, 0, 0.145098, 1,
1.958863, -2.203715, 2.957297, 1, 0, 0.1372549, 1,
1.968657, 1.190515, -0.6513115, 1, 0, 0.1333333, 1,
1.973103, -0.006096285, 0.4165568, 1, 0, 0.1254902, 1,
1.987818, -0.2351534, 3.085889, 1, 0, 0.1215686, 1,
2.06255, -1.853431, 2.499909, 1, 0, 0.1137255, 1,
2.090062, -0.6336349, 1.957434, 1, 0, 0.1098039, 1,
2.093757, -0.3093261, 1.232279, 1, 0, 0.1019608, 1,
2.121227, -0.4589056, 2.865614, 1, 0, 0.09411765, 1,
2.134513, -0.5648192, 2.557208, 1, 0, 0.09019608, 1,
2.162206, -0.4615296, 0.5467786, 1, 0, 0.08235294, 1,
2.227294, 0.5457759, 0.9121478, 1, 0, 0.07843138, 1,
2.237042, -0.9755492, 2.905719, 1, 0, 0.07058824, 1,
2.248185, -1.356366, 1.787223, 1, 0, 0.06666667, 1,
2.296875, -0.08668595, 1.244817, 1, 0, 0.05882353, 1,
2.307233, 0.01346942, 1.816213, 1, 0, 0.05490196, 1,
2.42962, 0.8517123, 0.6554725, 1, 0, 0.04705882, 1,
2.460131, 0.9103938, 0.5327247, 1, 0, 0.04313726, 1,
2.53416, 0.305199, 2.299759, 1, 0, 0.03529412, 1,
2.620986, -0.7189861, 2.186333, 1, 0, 0.03137255, 1,
2.758755, 0.02179226, 2.058009, 1, 0, 0.02352941, 1,
2.775022, 1.822258, 0.7546088, 1, 0, 0.01960784, 1,
2.79047, 2.036148, -1.578298, 1, 0, 0.01176471, 1,
3.251311, 1.389687, -0.4587899, 1, 0, 0.007843138, 1
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
-0.1349262, -3.834506, -7.443877, 0, -0.5, 0.5, 0.5,
-0.1349262, -3.834506, -7.443877, 1, -0.5, 0.5, 0.5,
-0.1349262, -3.834506, -7.443877, 1, 1.5, 0.5, 0.5,
-0.1349262, -3.834506, -7.443877, 0, 1.5, 0.5, 0.5
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
-4.669098, 0.04977334, -7.443877, 0, -0.5, 0.5, 0.5,
-4.669098, 0.04977334, -7.443877, 1, -0.5, 0.5, 0.5,
-4.669098, 0.04977334, -7.443877, 1, 1.5, 0.5, 0.5,
-4.669098, 0.04977334, -7.443877, 0, 1.5, 0.5, 0.5
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
-4.669098, -3.834506, 0.3035634, 0, -0.5, 0.5, 0.5,
-4.669098, -3.834506, 0.3035634, 1, -0.5, 0.5, 0.5,
-4.669098, -3.834506, 0.3035634, 1, 1.5, 0.5, 0.5,
-4.669098, -3.834506, 0.3035634, 0, 1.5, 0.5, 0.5
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
-3, -2.938134, -5.656006,
3, -2.938134, -5.656006,
-3, -2.938134, -5.656006,
-3, -3.087529, -5.953984,
-2, -2.938134, -5.656006,
-2, -3.087529, -5.953984,
-1, -2.938134, -5.656006,
-1, -3.087529, -5.953984,
0, -2.938134, -5.656006,
0, -3.087529, -5.953984,
1, -2.938134, -5.656006,
1, -3.087529, -5.953984,
2, -2.938134, -5.656006,
2, -3.087529, -5.953984,
3, -2.938134, -5.656006,
3, -3.087529, -5.953984
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
-3, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
-3, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
-3, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
-3, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
-2, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
-2, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
-2, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
-2, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
-1, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
-1, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
-1, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
-1, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
0, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
0, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
0, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
0, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
1, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
1, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
1, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
1, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
2, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
2, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
2, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
2, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5,
3, -3.38632, -6.549941, 0, -0.5, 0.5, 0.5,
3, -3.38632, -6.549941, 1, -0.5, 0.5, 0.5,
3, -3.38632, -6.549941, 1, 1.5, 0.5, 0.5,
3, -3.38632, -6.549941, 0, 1.5, 0.5, 0.5
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
-3.622751, -2, -5.656006,
-3.622751, 2, -5.656006,
-3.622751, -2, -5.656006,
-3.797142, -2, -5.953984,
-3.622751, -1, -5.656006,
-3.797142, -1, -5.953984,
-3.622751, 0, -5.656006,
-3.797142, 0, -5.953984,
-3.622751, 1, -5.656006,
-3.797142, 1, -5.953984,
-3.622751, 2, -5.656006,
-3.797142, 2, -5.953984
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
-4.145925, -2, -6.549941, 0, -0.5, 0.5, 0.5,
-4.145925, -2, -6.549941, 1, -0.5, 0.5, 0.5,
-4.145925, -2, -6.549941, 1, 1.5, 0.5, 0.5,
-4.145925, -2, -6.549941, 0, 1.5, 0.5, 0.5,
-4.145925, -1, -6.549941, 0, -0.5, 0.5, 0.5,
-4.145925, -1, -6.549941, 1, -0.5, 0.5, 0.5,
-4.145925, -1, -6.549941, 1, 1.5, 0.5, 0.5,
-4.145925, -1, -6.549941, 0, 1.5, 0.5, 0.5,
-4.145925, 0, -6.549941, 0, -0.5, 0.5, 0.5,
-4.145925, 0, -6.549941, 1, -0.5, 0.5, 0.5,
-4.145925, 0, -6.549941, 1, 1.5, 0.5, 0.5,
-4.145925, 0, -6.549941, 0, 1.5, 0.5, 0.5,
-4.145925, 1, -6.549941, 0, -0.5, 0.5, 0.5,
-4.145925, 1, -6.549941, 1, -0.5, 0.5, 0.5,
-4.145925, 1, -6.549941, 1, 1.5, 0.5, 0.5,
-4.145925, 1, -6.549941, 0, 1.5, 0.5, 0.5,
-4.145925, 2, -6.549941, 0, -0.5, 0.5, 0.5,
-4.145925, 2, -6.549941, 1, -0.5, 0.5, 0.5,
-4.145925, 2, -6.549941, 1, 1.5, 0.5, 0.5,
-4.145925, 2, -6.549941, 0, 1.5, 0.5, 0.5
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
-3.622751, -2.938134, -4,
-3.622751, -2.938134, 6,
-3.622751, -2.938134, -4,
-3.797142, -3.087529, -4,
-3.622751, -2.938134, -2,
-3.797142, -3.087529, -2,
-3.622751, -2.938134, 0,
-3.797142, -3.087529, 0,
-3.622751, -2.938134, 2,
-3.797142, -3.087529, 2,
-3.622751, -2.938134, 4,
-3.797142, -3.087529, 4,
-3.622751, -2.938134, 6,
-3.797142, -3.087529, 6
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
"4",
"6"
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
-4.145925, -3.38632, -4, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, -4, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, -4, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, -4, 0, 1.5, 0.5, 0.5,
-4.145925, -3.38632, -2, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, -2, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, -2, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, -2, 0, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 0, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 0, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 0, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 0, 0, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 2, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 2, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 2, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 2, 0, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 4, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 4, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 4, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 4, 0, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 6, 0, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 6, 1, -0.5, 0.5, 0.5,
-4.145925, -3.38632, 6, 1, 1.5, 0.5, 0.5,
-4.145925, -3.38632, 6, 0, 1.5, 0.5, 0.5
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
-3.622751, -2.938134, -5.656006,
-3.622751, 3.03768, -5.656006,
-3.622751, -2.938134, 6.263133,
-3.622751, 3.03768, 6.263133,
-3.622751, -2.938134, -5.656006,
-3.622751, -2.938134, 6.263133,
-3.622751, 3.03768, -5.656006,
-3.622751, 3.03768, 6.263133,
-3.622751, -2.938134, -5.656006,
3.352898, -2.938134, -5.656006,
-3.622751, -2.938134, 6.263133,
3.352898, -2.938134, 6.263133,
-3.622751, 3.03768, -5.656006,
3.352898, 3.03768, -5.656006,
-3.622751, 3.03768, 6.263133,
3.352898, 3.03768, 6.263133,
3.352898, -2.938134, -5.656006,
3.352898, 3.03768, -5.656006,
3.352898, -2.938134, 6.263133,
3.352898, 3.03768, 6.263133,
3.352898, -2.938134, -5.656006,
3.352898, -2.938134, 6.263133,
3.352898, 3.03768, -5.656006,
3.352898, 3.03768, 6.263133
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
var radius = 8.035226;
var distance = 35.74963;
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
mvMatrix.translate( 0.1349262, -0.04977334, -0.3035634 );
mvMatrix.scale( 1.245453, 1.453834, 0.7288986 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74963);
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
diethylthiocarbamate<-read.table("diethylthiocarbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethylthiocarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
```

```r
y<-diethylthiocarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
```

```r
z<-diethylthiocarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
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
-3.521164, 2.058259, -0.5926752, 0, 0, 1, 1, 1,
-2.985403, -0.2411618, -3.016844, 1, 0, 0, 1, 1,
-2.967513, 0.3053573, -1.777443, 1, 0, 0, 1, 1,
-2.781925, -0.9509393, -2.163065, 1, 0, 0, 1, 1,
-2.695751, 0.04442158, -2.592991, 1, 0, 0, 1, 1,
-2.585057, 1.648874, -2.249208, 1, 0, 0, 1, 1,
-2.561964, -1.262311, -2.202895, 0, 0, 0, 1, 1,
-2.538894, -1.220572, -0.7618431, 0, 0, 0, 1, 1,
-2.506514, 0.4320334, 0.4752668, 0, 0, 0, 1, 1,
-2.485782, 1.788366, -1.820033, 0, 0, 0, 1, 1,
-2.45864, -2.504038, -3.423074, 0, 0, 0, 1, 1,
-2.429399, 1.52556, -0.4917518, 0, 0, 0, 1, 1,
-2.418589, -0.1895456, -0.02831113, 0, 0, 0, 1, 1,
-2.352724, 0.2210764, -1.638039, 1, 1, 1, 1, 1,
-2.325778, 1.208583, -0.6912137, 1, 1, 1, 1, 1,
-2.310645, -0.7996681, -2.487649, 1, 1, 1, 1, 1,
-2.289157, -0.4740269, -1.779619, 1, 1, 1, 1, 1,
-2.279305, 0.3441642, 0.4102043, 1, 1, 1, 1, 1,
-2.274294, 2.800485, -1.406038, 1, 1, 1, 1, 1,
-2.266528, -0.6565273, -2.386078, 1, 1, 1, 1, 1,
-2.25633, -0.1679636, -0.3088159, 1, 1, 1, 1, 1,
-2.245927, -1.775974, -1.074885, 1, 1, 1, 1, 1,
-2.205601, -2.19242, -2.103595, 1, 1, 1, 1, 1,
-2.197119, -0.05754226, -1.849322, 1, 1, 1, 1, 1,
-2.195743, -2.619916, -4.45584, 1, 1, 1, 1, 1,
-2.162965, 0.6204047, -2.885829, 1, 1, 1, 1, 1,
-2.156227, -0.1822613, -3.096043, 1, 1, 1, 1, 1,
-2.129321, 1.047839, -0.7795677, 1, 1, 1, 1, 1,
-2.11661, 0.2159021, -2.637735, 0, 0, 1, 1, 1,
-2.100131, -0.5095878, -2.399405, 1, 0, 0, 1, 1,
-2.078465, -0.5570181, -1.837978, 1, 0, 0, 1, 1,
-2.075444, 1.485883, -1.032851, 1, 0, 0, 1, 1,
-2.051178, 0.7007791, -2.238011, 1, 0, 0, 1, 1,
-1.998057, -0.01990577, -1.228271, 1, 0, 0, 1, 1,
-1.951384, 0.2358815, -2.240153, 0, 0, 0, 1, 1,
-1.93598, 0.09780672, -1.001339, 0, 0, 0, 1, 1,
-1.929664, 0.006090685, -0.4953976, 0, 0, 0, 1, 1,
-1.913636, 0.6556402, -1.372188, 0, 0, 0, 1, 1,
-1.897322, -1.419049, -2.833055, 0, 0, 0, 1, 1,
-1.888647, 0.974727, -0.2688053, 0, 0, 0, 1, 1,
-1.874526, 0.2590733, -2.050954, 0, 0, 0, 1, 1,
-1.860336, -1.703031, -2.846171, 1, 1, 1, 1, 1,
-1.857557, -1.930724, -2.888331, 1, 1, 1, 1, 1,
-1.835526, -0.1119891, 0.1586008, 1, 1, 1, 1, 1,
-1.830154, 1.171263, -0.01329976, 1, 1, 1, 1, 1,
-1.815923, 0.648544, -1.395481, 1, 1, 1, 1, 1,
-1.809578, -1.049556, -0.8934038, 1, 1, 1, 1, 1,
-1.805996, 0.9549611, -1.923271, 1, 1, 1, 1, 1,
-1.796757, 1.488702, -0.511253, 1, 1, 1, 1, 1,
-1.794489, -0.6348296, -2.779295, 1, 1, 1, 1, 1,
-1.792198, -0.9157424, -2.07627, 1, 1, 1, 1, 1,
-1.781456, 0.01544874, -1.201562, 1, 1, 1, 1, 1,
-1.763874, 0.7780581, -1.848994, 1, 1, 1, 1, 1,
-1.747643, 0.7095039, -1.12757, 1, 1, 1, 1, 1,
-1.725159, -0.3339334, -2.846391, 1, 1, 1, 1, 1,
-1.719807, -1.098868, -2.639492, 1, 1, 1, 1, 1,
-1.716907, -0.7564915, -3.005302, 0, 0, 1, 1, 1,
-1.706937, 0.4396723, -2.111045, 1, 0, 0, 1, 1,
-1.701162, -1.263452, -2.246485, 1, 0, 0, 1, 1,
-1.695722, -0.4094227, -3.14517, 1, 0, 0, 1, 1,
-1.695174, 0.04641665, 0.2486322, 1, 0, 0, 1, 1,
-1.690784, 0.01745303, -2.120942, 1, 0, 0, 1, 1,
-1.689751, -0.2911394, -1.642144, 0, 0, 0, 1, 1,
-1.683711, -0.8180125, -1.515733, 0, 0, 0, 1, 1,
-1.667788, 0.2064292, -0.7592499, 0, 0, 0, 1, 1,
-1.659714, 1.041476, -1.863363, 0, 0, 0, 1, 1,
-1.657904, 0.4547539, -2.076846, 0, 0, 0, 1, 1,
-1.657303, -0.1480744, -2.241378, 0, 0, 0, 1, 1,
-1.642715, 0.1760225, -0.4219298, 0, 0, 0, 1, 1,
-1.642586, 0.4713584, -1.746578, 1, 1, 1, 1, 1,
-1.620633, 0.2054548, 0.7506135, 1, 1, 1, 1, 1,
-1.613532, 2.534124, 0.765983, 1, 1, 1, 1, 1,
-1.606225, 1.153248, 0.02053799, 1, 1, 1, 1, 1,
-1.586816, 0.1535665, -2.83137, 1, 1, 1, 1, 1,
-1.540261, 0.8788815, -1.838138, 1, 1, 1, 1, 1,
-1.519814, -0.1328573, -1.955454, 1, 1, 1, 1, 1,
-1.511126, -2.142231, -4.136101, 1, 1, 1, 1, 1,
-1.470717, 0.9358689, -0.9672422, 1, 1, 1, 1, 1,
-1.458761, -0.8660111, 0.5601941, 1, 1, 1, 1, 1,
-1.445821, 0.6826481, 0.2555129, 1, 1, 1, 1, 1,
-1.444137, 1.461357, -0.9302981, 1, 1, 1, 1, 1,
-1.443156, 1.659102, -1.44703, 1, 1, 1, 1, 1,
-1.439971, 0.1739777, -2.46736, 1, 1, 1, 1, 1,
-1.422906, -0.582481, -2.712404, 1, 1, 1, 1, 1,
-1.401954, 0.6612436, -0.2608529, 0, 0, 1, 1, 1,
-1.399877, 0.7741252, -1.46532, 1, 0, 0, 1, 1,
-1.396406, -1.416522, -1.948475, 1, 0, 0, 1, 1,
-1.393835, -0.5545748, -2.881643, 1, 0, 0, 1, 1,
-1.392158, 0.928807, -0.7248248, 1, 0, 0, 1, 1,
-1.387579, -0.1656195, -1.098121, 1, 0, 0, 1, 1,
-1.370086, -0.6935523, -2.815641, 0, 0, 0, 1, 1,
-1.365502, 2.421288, -0.4288054, 0, 0, 0, 1, 1,
-1.364087, 0.6743048, -2.762827, 0, 0, 0, 1, 1,
-1.362146, -0.1755397, -0.7329118, 0, 0, 0, 1, 1,
-1.360227, -0.2817194, -1.009745, 0, 0, 0, 1, 1,
-1.349509, -0.6051441, -2.192631, 0, 0, 0, 1, 1,
-1.349017, -0.2471095, -1.583621, 0, 0, 0, 1, 1,
-1.33867, -0.6341154, -0.7640833, 1, 1, 1, 1, 1,
-1.336667, 1.019612, -1.423404, 1, 1, 1, 1, 1,
-1.336128, -0.8820699, -1.917973, 1, 1, 1, 1, 1,
-1.334008, -0.6700525, -1.819404, 1, 1, 1, 1, 1,
-1.331012, 0.8846619, -0.8868352, 1, 1, 1, 1, 1,
-1.330436, -0.8021147, -1.746755, 1, 1, 1, 1, 1,
-1.328882, 0.3442917, -1.455414, 1, 1, 1, 1, 1,
-1.32277, -0.09592594, -2.279859, 1, 1, 1, 1, 1,
-1.321153, 0.05282956, -0.3253945, 1, 1, 1, 1, 1,
-1.319042, 0.5834421, -1.330457, 1, 1, 1, 1, 1,
-1.313534, 0.3403372, 1.394572, 1, 1, 1, 1, 1,
-1.311338, 0.1451879, -1.244725, 1, 1, 1, 1, 1,
-1.308263, 0.9924206, -1.340576, 1, 1, 1, 1, 1,
-1.289783, 0.1013226, -2.276484, 1, 1, 1, 1, 1,
-1.281926, 2.345934, 0.7523743, 1, 1, 1, 1, 1,
-1.278794, 1.704136, -1.392224, 0, 0, 1, 1, 1,
-1.276008, -0.4350257, -1.278433, 1, 0, 0, 1, 1,
-1.258624, 0.2467743, -2.089986, 1, 0, 0, 1, 1,
-1.246677, -1.89558, -3.435378, 1, 0, 0, 1, 1,
-1.234861, -1.426495, -1.090674, 1, 0, 0, 1, 1,
-1.22725, -0.7912999, -1.643111, 1, 0, 0, 1, 1,
-1.221217, 0.02198612, -1.149844, 0, 0, 0, 1, 1,
-1.220383, 0.326399, 0.06161024, 0, 0, 0, 1, 1,
-1.220024, -0.3195755, -1.444733, 0, 0, 0, 1, 1,
-1.215864, -1.39914, -1.51857, 0, 0, 0, 1, 1,
-1.215394, -0.8609053, -2.070428, 0, 0, 0, 1, 1,
-1.214413, 1.045132, -1.950907, 0, 0, 0, 1, 1,
-1.211469, -2.042325, -3.838214, 0, 0, 0, 1, 1,
-1.191136, 1.610619, -0.8347254, 1, 1, 1, 1, 1,
-1.190986, 0.7213963, -0.1648772, 1, 1, 1, 1, 1,
-1.18612, 0.8601423, -1.654969, 1, 1, 1, 1, 1,
-1.179029, 0.06958393, -1.618535, 1, 1, 1, 1, 1,
-1.178287, 0.3458385, -1.948255, 1, 1, 1, 1, 1,
-1.178281, 0.7637821, -1.693651, 1, 1, 1, 1, 1,
-1.171318, -1.778002, -2.184787, 1, 1, 1, 1, 1,
-1.171174, 0.9860708, 0.7953573, 1, 1, 1, 1, 1,
-1.167229, -0.09242743, -1.010137, 1, 1, 1, 1, 1,
-1.166964, 0.9157525, 0.5837573, 1, 1, 1, 1, 1,
-1.164976, -1.346009, -2.820746, 1, 1, 1, 1, 1,
-1.163733, 1.894658, -0.5949498, 1, 1, 1, 1, 1,
-1.163721, 1.944766, -0.5932801, 1, 1, 1, 1, 1,
-1.157789, -0.3009447, -2.461011, 1, 1, 1, 1, 1,
-1.157411, -0.1307948, -1.421533, 1, 1, 1, 1, 1,
-1.153383, 0.6084532, 0.6281341, 0, 0, 1, 1, 1,
-1.152744, -2.423343, -3.456042, 1, 0, 0, 1, 1,
-1.134189, -0.9890547, 0.02305403, 1, 0, 0, 1, 1,
-1.132967, -0.4223728, -2.704803, 1, 0, 0, 1, 1,
-1.123374, 1.693665, -1.396297, 1, 0, 0, 1, 1,
-1.121473, -1.010784, -1.977013, 1, 0, 0, 1, 1,
-1.121256, 0.07025459, -2.61259, 0, 0, 0, 1, 1,
-1.120264, -0.3941336, -2.289334, 0, 0, 0, 1, 1,
-1.116949, 0.862683, 0.1000776, 0, 0, 0, 1, 1,
-1.11288, 1.139158, -0.398569, 0, 0, 0, 1, 1,
-1.10833, -0.9241973, -2.305255, 0, 0, 0, 1, 1,
-1.106473, -1.774053, -2.933282, 0, 0, 0, 1, 1,
-1.099265, 0.5988786, -0.5063564, 0, 0, 0, 1, 1,
-1.097533, 0.4951107, -3.174536, 1, 1, 1, 1, 1,
-1.095791, 0.9012174, -0.768658, 1, 1, 1, 1, 1,
-1.092637, -0.7836821, -2.02654, 1, 1, 1, 1, 1,
-1.0894, -0.3725307, -3.633103, 1, 1, 1, 1, 1,
-1.064338, 0.04965289, -1.45375, 1, 1, 1, 1, 1,
-1.062487, -1.13324, -3.001664, 1, 1, 1, 1, 1,
-1.053866, -0.1207574, -2.93685, 1, 1, 1, 1, 1,
-1.053709, 0.5682079, -0.7761721, 1, 1, 1, 1, 1,
-1.050207, 0.4273169, -0.7870408, 1, 1, 1, 1, 1,
-1.046121, 0.9125288, -2.096762, 1, 1, 1, 1, 1,
-1.042475, -0.4167283, -1.906119, 1, 1, 1, 1, 1,
-1.035057, 1.075544, -2.040743, 1, 1, 1, 1, 1,
-1.03505, -0.2191222, -2.140044, 1, 1, 1, 1, 1,
-1.029429, 1.349597, 0.3933374, 1, 1, 1, 1, 1,
-1.028119, 1.045482, -1.648951, 1, 1, 1, 1, 1,
-1.026674, 1.988272, -1.241976, 0, 0, 1, 1, 1,
-1.025695, -1.684898, -1.098526, 1, 0, 0, 1, 1,
-1.018283, 0.3574888, -0.3359105, 1, 0, 0, 1, 1,
-1.016003, 0.9478904, -1.374865, 1, 0, 0, 1, 1,
-1.01114, 0.5573998, -2.150301, 1, 0, 0, 1, 1,
-1.010631, 0.6377159, -1.075669, 1, 0, 0, 1, 1,
-1.009511, 0.1108733, -2.99286, 0, 0, 0, 1, 1,
-1.001773, -2.026218, -1.936555, 0, 0, 0, 1, 1,
-0.9998445, -0.4078673, -2.033935, 0, 0, 0, 1, 1,
-0.9996683, -0.6932396, -2.526323, 0, 0, 0, 1, 1,
-0.998551, 0.2745883, -2.940032, 0, 0, 0, 1, 1,
-0.9918831, -1.245219, -3.346961, 0, 0, 0, 1, 1,
-0.9904435, 0.016724, -1.888987, 0, 0, 0, 1, 1,
-0.987351, -0.7755421, -4.494122, 1, 1, 1, 1, 1,
-0.9860189, 0.2686426, -1.953667, 1, 1, 1, 1, 1,
-0.9798832, -1.986355, -3.05701, 1, 1, 1, 1, 1,
-0.9770611, -0.8889294, -0.9213312, 1, 1, 1, 1, 1,
-0.9754376, -0.7622758, -2.149553, 1, 1, 1, 1, 1,
-0.9702436, 1.073965, -1.914137, 1, 1, 1, 1, 1,
-0.9694074, -0.0445551, -1.286523, 1, 1, 1, 1, 1,
-0.9655266, 0.5345678, -1.043446, 1, 1, 1, 1, 1,
-0.9650548, 0.6082885, -2.04482, 1, 1, 1, 1, 1,
-0.9608069, 0.8600027, 0.2268254, 1, 1, 1, 1, 1,
-0.9571295, -1.259585, -3.564245, 1, 1, 1, 1, 1,
-0.9489228, -1.213987, -2.642915, 1, 1, 1, 1, 1,
-0.9487453, 0.2421347, 0.5286475, 1, 1, 1, 1, 1,
-0.9467381, 0.5938776, -1.153994, 1, 1, 1, 1, 1,
-0.9427747, -0.9464793, -1.54848, 1, 1, 1, 1, 1,
-0.9349463, 0.1935121, -2.8039, 0, 0, 1, 1, 1,
-0.9328375, -0.226391, -0.8580908, 1, 0, 0, 1, 1,
-0.9318037, -0.8583928, -3.701207, 1, 0, 0, 1, 1,
-0.9289317, 0.2399483, -1.524495, 1, 0, 0, 1, 1,
-0.9277467, 1.34229, -0.022093, 1, 0, 0, 1, 1,
-0.9261706, 0.698579, -1.047115, 1, 0, 0, 1, 1,
-0.9261702, -1.519411, -3.299848, 0, 0, 0, 1, 1,
-0.9224854, 1.894359, 0.07729892, 0, 0, 0, 1, 1,
-0.9194777, 0.2642543, -1.635624, 0, 0, 0, 1, 1,
-0.9138805, 0.337624, -1.297438, 0, 0, 0, 1, 1,
-0.9118353, -0.386804, -2.338292, 0, 0, 0, 1, 1,
-0.9113324, -2.851107, -3.654347, 0, 0, 0, 1, 1,
-0.9087203, -0.04105449, -0.697542, 0, 0, 0, 1, 1,
-0.9083484, -0.01572915, -0.07998635, 1, 1, 1, 1, 1,
-0.9055763, 0.4296243, -1.321634, 1, 1, 1, 1, 1,
-0.9040883, -2.616209, -2.39073, 1, 1, 1, 1, 1,
-0.900838, -0.1491737, -1.307325, 1, 1, 1, 1, 1,
-0.8981743, 1.010914, -0.1439665, 1, 1, 1, 1, 1,
-0.895797, 0.2555549, -1.546161, 1, 1, 1, 1, 1,
-0.8950868, 0.5747661, -0.06161941, 1, 1, 1, 1, 1,
-0.8939331, 0.3147309, -0.6957217, 1, 1, 1, 1, 1,
-0.8937998, 0.4700193, -1.975942, 1, 1, 1, 1, 1,
-0.8917941, 1.077111, 0.9152287, 1, 1, 1, 1, 1,
-0.890869, -1.214261, -3.526929, 1, 1, 1, 1, 1,
-0.8843127, 1.028993, 0.01960175, 1, 1, 1, 1, 1,
-0.8821424, -1.128142, -1.888621, 1, 1, 1, 1, 1,
-0.8731236, -1.011314, -1.875491, 1, 1, 1, 1, 1,
-0.8687823, -0.4172404, -1.007962, 1, 1, 1, 1, 1,
-0.8667496, -1.474723, -2.382898, 0, 0, 1, 1, 1,
-0.8664057, 1.382329, -0.8237516, 1, 0, 0, 1, 1,
-0.8660669, -1.401993, -2.043545, 1, 0, 0, 1, 1,
-0.8599228, 0.824169, -0.8169148, 1, 0, 0, 1, 1,
-0.8597332, 0.1882178, -0.8440577, 1, 0, 0, 1, 1,
-0.8569246, 0.9876495, -0.8163549, 1, 0, 0, 1, 1,
-0.8563541, -1.126745, -3.840356, 0, 0, 0, 1, 1,
-0.8524994, -0.6728021, -1.57864, 0, 0, 0, 1, 1,
-0.8518137, -0.4883024, -1.81533, 0, 0, 0, 1, 1,
-0.8503552, 0.8684009, -2.476958, 0, 0, 0, 1, 1,
-0.8489878, 0.8245205, -1.738782, 0, 0, 0, 1, 1,
-0.8456202, -0.239571, -0.1523831, 0, 0, 0, 1, 1,
-0.840462, -2.271285, -3.316504, 0, 0, 0, 1, 1,
-0.833967, -0.5406193, -1.238452, 1, 1, 1, 1, 1,
-0.8312835, 0.1948323, -1.37043, 1, 1, 1, 1, 1,
-0.8226182, 1.766551, -1.757753, 1, 1, 1, 1, 1,
-0.8188139, 0.09462111, -0.7569456, 1, 1, 1, 1, 1,
-0.8185542, 0.5680832, 0.7617303, 1, 1, 1, 1, 1,
-0.8185096, -0.9280952, -4.995091, 1, 1, 1, 1, 1,
-0.8163891, 0.2876651, -0.8196243, 1, 1, 1, 1, 1,
-0.8148954, -0.9061644, -1.018819, 1, 1, 1, 1, 1,
-0.8096656, -1.328276, -3.515378, 1, 1, 1, 1, 1,
-0.8036124, 2.207761, 0.2235271, 1, 1, 1, 1, 1,
-0.8021344, -0.3142196, -0.3172082, 1, 1, 1, 1, 1,
-0.800942, 0.05770142, -2.400438, 1, 1, 1, 1, 1,
-0.8003363, 0.1231972, -0.9038593, 1, 1, 1, 1, 1,
-0.7969149, -1.101786, -1.586065, 1, 1, 1, 1, 1,
-0.7951081, 0.3806975, -0.5724912, 1, 1, 1, 1, 1,
-0.7891332, -1.588581, -2.797432, 0, 0, 1, 1, 1,
-0.7850155, 0.4645759, -2.076492, 1, 0, 0, 1, 1,
-0.7779593, 1.132249, -0.8792686, 1, 0, 0, 1, 1,
-0.775293, 0.03945703, -1.954314, 1, 0, 0, 1, 1,
-0.7732756, -0.1636528, -0.9391541, 1, 0, 0, 1, 1,
-0.7716379, 1.405068, 1.560681, 1, 0, 0, 1, 1,
-0.770256, 0.5604273, -0.09724477, 0, 0, 0, 1, 1,
-0.7670904, -0.7774495, -2.656644, 0, 0, 0, 1, 1,
-0.7653108, -0.1081414, 0.2862534, 0, 0, 0, 1, 1,
-0.7639216, -0.1831083, -1.926905, 0, 0, 0, 1, 1,
-0.7630112, 1.360448, -0.2261354, 0, 0, 0, 1, 1,
-0.7615919, -0.6105888, -2.322997, 0, 0, 0, 1, 1,
-0.7595431, -1.139889, -2.819511, 0, 0, 0, 1, 1,
-0.7591424, 1.947224, -0.1517406, 1, 1, 1, 1, 1,
-0.756142, 0.3433483, -2.737558, 1, 1, 1, 1, 1,
-0.7554507, -0.684121, -1.629782, 1, 1, 1, 1, 1,
-0.749139, 0.1892855, -1.042756, 1, 1, 1, 1, 1,
-0.7483591, 0.1750935, -2.467862, 1, 1, 1, 1, 1,
-0.7451758, -2.318822, -0.4781233, 1, 1, 1, 1, 1,
-0.7373576, -1.205804, -4.383544, 1, 1, 1, 1, 1,
-0.7346048, 0.4392853, -1.252727, 1, 1, 1, 1, 1,
-0.7177169, 0.05223232, -0.5345479, 1, 1, 1, 1, 1,
-0.7148966, -2.04517, -1.814067, 1, 1, 1, 1, 1,
-0.7118285, -0.8008008, -0.9909889, 1, 1, 1, 1, 1,
-0.7067759, -0.8723807, -4.065813, 1, 1, 1, 1, 1,
-0.7067147, -1.012543, -2.777581, 1, 1, 1, 1, 1,
-0.7016675, 1.037225, 0.32827, 1, 1, 1, 1, 1,
-0.6996248, 0.3113194, 0.201502, 1, 1, 1, 1, 1,
-0.6956819, 1.748488, 0.8869323, 0, 0, 1, 1, 1,
-0.6932088, -0.501687, -2.767488, 1, 0, 0, 1, 1,
-0.6908484, -1.622934, -1.966921, 1, 0, 0, 1, 1,
-0.6874261, 0.06936991, -2.337836, 1, 0, 0, 1, 1,
-0.6859639, 0.5613237, -0.7724395, 1, 0, 0, 1, 1,
-0.6817371, -0.6482103, -3.434808, 1, 0, 0, 1, 1,
-0.677505, 0.3454027, -1.155908, 0, 0, 0, 1, 1,
-0.676881, 0.9068795, -0.1322826, 0, 0, 0, 1, 1,
-0.6750029, -0.1204607, -1.224007, 0, 0, 0, 1, 1,
-0.672468, -0.4145114, -1.078644, 0, 0, 0, 1, 1,
-0.6723462, -0.3511888, -0.7042262, 0, 0, 0, 1, 1,
-0.6692905, 1.870919, -2.438177, 0, 0, 0, 1, 1,
-0.6614797, -0.2293009, 0.01185921, 0, 0, 0, 1, 1,
-0.6614788, 1.957093, -1.197043, 1, 1, 1, 1, 1,
-0.6570353, 1.211011, -1.041315, 1, 1, 1, 1, 1,
-0.6567607, 1.416856, -1.854329, 1, 1, 1, 1, 1,
-0.6496135, -0.8401929, -0.9852847, 1, 1, 1, 1, 1,
-0.6479321, -0.9984723, -4.142921, 1, 1, 1, 1, 1,
-0.6478183, 1.299234, 0.7993968, 1, 1, 1, 1, 1,
-0.6463256, -0.8407655, -2.694401, 1, 1, 1, 1, 1,
-0.6446713, 0.778188, -0.2111227, 1, 1, 1, 1, 1,
-0.6431754, -0.670326, -1.910574, 1, 1, 1, 1, 1,
-0.6418888, 0.8247663, -1.690043, 1, 1, 1, 1, 1,
-0.6351038, 0.2072056, -2.662861, 1, 1, 1, 1, 1,
-0.6324254, -1.290401, -3.570575, 1, 1, 1, 1, 1,
-0.6282906, -2.304017, -3.203235, 1, 1, 1, 1, 1,
-0.6269525, -0.4014386, -2.611095, 1, 1, 1, 1, 1,
-0.6258843, 1.146552, 1.364261, 1, 1, 1, 1, 1,
-0.6247854, 0.4654087, 0.1973458, 0, 0, 1, 1, 1,
-0.6233401, -0.2760499, -1.313053, 1, 0, 0, 1, 1,
-0.6190513, -0.03833875, -0.3301887, 1, 0, 0, 1, 1,
-0.6173615, -1.575967, -2.149564, 1, 0, 0, 1, 1,
-0.6150855, -0.1711589, -1.50118, 1, 0, 0, 1, 1,
-0.6081866, -0.9045948, -3.275404, 1, 0, 0, 1, 1,
-0.6066044, -1.306496, -3.203469, 0, 0, 0, 1, 1,
-0.6035296, 0.737088, 0.999393, 0, 0, 0, 1, 1,
-0.5958731, 1.36351, -1.036819, 0, 0, 0, 1, 1,
-0.5917609, 0.1305671, -0.562865, 0, 0, 0, 1, 1,
-0.588315, -1.057006, -1.75943, 0, 0, 0, 1, 1,
-0.5860484, 1.666272, -2.200543, 0, 0, 0, 1, 1,
-0.5858974, -1.363704, -1.911181, 0, 0, 0, 1, 1,
-0.5844951, 0.3097718, -0.3853512, 1, 1, 1, 1, 1,
-0.5818713, 0.0505172, -2.985345, 1, 1, 1, 1, 1,
-0.5794979, -2.134612, -2.172839, 1, 1, 1, 1, 1,
-0.5753307, 1.276701, 1.04382, 1, 1, 1, 1, 1,
-0.5724023, -0.4507862, -1.365033, 1, 1, 1, 1, 1,
-0.5705302, 1.547704, -0.7740541, 1, 1, 1, 1, 1,
-0.5678615, -0.3086531, -2.896247, 1, 1, 1, 1, 1,
-0.5672637, -0.2879998, -1.863526, 1, 1, 1, 1, 1,
-0.5666165, -1.058824, -1.776387, 1, 1, 1, 1, 1,
-0.5642561, 0.3398587, -0.007333242, 1, 1, 1, 1, 1,
-0.5628925, 0.3913387, 1.490094, 1, 1, 1, 1, 1,
-0.5558171, -0.1388946, 1.023901, 1, 1, 1, 1, 1,
-0.5534706, 0.432264, -2.195687, 1, 1, 1, 1, 1,
-0.5518176, 0.5096642, 0.8516388, 1, 1, 1, 1, 1,
-0.5500273, 0.9518767, 1.190496, 1, 1, 1, 1, 1,
-0.5499786, -0.02598779, -2.660815, 0, 0, 1, 1, 1,
-0.5488895, 0.8914635, -0.7747802, 1, 0, 0, 1, 1,
-0.5476937, -0.6295598, -2.087656, 1, 0, 0, 1, 1,
-0.5457606, -0.7481806, -3.315856, 1, 0, 0, 1, 1,
-0.5373613, 0.3952962, -0.5462601, 1, 0, 0, 1, 1,
-0.5366626, -0.146694, 0.5160289, 1, 0, 0, 1, 1,
-0.5330471, 0.2424477, -2.400131, 0, 0, 0, 1, 1,
-0.5313388, 0.1121617, -3.0674, 0, 0, 0, 1, 1,
-0.5309845, 2.331759, 0.5290863, 0, 0, 0, 1, 1,
-0.5284411, -0.8421245, -2.895787, 0, 0, 0, 1, 1,
-0.5275823, -0.5647976, -2.718985, 0, 0, 0, 1, 1,
-0.5270492, -1.145491, -2.968197, 0, 0, 0, 1, 1,
-0.5251741, 1.707711, -0.5122759, 0, 0, 0, 1, 1,
-0.5241228, -0.002801028, -1.08533, 1, 1, 1, 1, 1,
-0.5199319, 0.98455, -0.7109972, 1, 1, 1, 1, 1,
-0.5096246, 1.599678, 1.1282, 1, 1, 1, 1, 1,
-0.5024806, -0.4596679, -3.693101, 1, 1, 1, 1, 1,
-0.5007716, 1.414911, -0.6994252, 1, 1, 1, 1, 1,
-0.4984321, -0.5749186, -2.123337, 1, 1, 1, 1, 1,
-0.4931941, -1.327395, -2.427417, 1, 1, 1, 1, 1,
-0.4927846, 0.3585432, -0.5954085, 1, 1, 1, 1, 1,
-0.4888896, -1.486117, -3.287185, 1, 1, 1, 1, 1,
-0.4832866, 0.6030492, 0.1159128, 1, 1, 1, 1, 1,
-0.4800048, -0.3327254, -2.402452, 1, 1, 1, 1, 1,
-0.4781133, 1.795731, -0.2117786, 1, 1, 1, 1, 1,
-0.476408, 0.04863675, -2.457466, 1, 1, 1, 1, 1,
-0.4761656, 0.6848523, -2.600443, 1, 1, 1, 1, 1,
-0.4750649, -0.5054421, -3.8386, 1, 1, 1, 1, 1,
-0.4733631, 2.048008, -1.402113, 0, 0, 1, 1, 1,
-0.4733012, -0.458994, -4.217457, 1, 0, 0, 1, 1,
-0.468612, -0.4976931, -5.020438, 1, 0, 0, 1, 1,
-0.4657896, 0.07697301, -1.890168, 1, 0, 0, 1, 1,
-0.4617109, 1.135896, 0.2241848, 1, 0, 0, 1, 1,
-0.4610867, -1.911315, -1.005653, 1, 0, 0, 1, 1,
-0.4579025, 0.1704811, -1.147144, 0, 0, 0, 1, 1,
-0.4514945, 1.086138, 0.9882597, 0, 0, 0, 1, 1,
-0.4454814, -0.3537758, -3.050795, 0, 0, 0, 1, 1,
-0.4444784, -0.03314706, -3.02881, 0, 0, 0, 1, 1,
-0.4444177, 1.187239, 0.4354876, 0, 0, 0, 1, 1,
-0.4441707, 1.28678, -1.096508, 0, 0, 0, 1, 1,
-0.4424329, -0.9217764, -2.521473, 0, 0, 0, 1, 1,
-0.432656, -0.8954142, -2.480714, 1, 1, 1, 1, 1,
-0.4280935, 0.0748123, -1.322945, 1, 1, 1, 1, 1,
-0.4269807, -0.4561562, -3.374365, 1, 1, 1, 1, 1,
-0.4158521, -2.16213, -3.008705, 1, 1, 1, 1, 1,
-0.4115588, 1.462556, 0.4197486, 1, 1, 1, 1, 1,
-0.4101957, -0.1361575, -3.197751, 1, 1, 1, 1, 1,
-0.4066502, 0.932157, -0.7142238, 1, 1, 1, 1, 1,
-0.401339, -0.09023318, -1.869761, 1, 1, 1, 1, 1,
-0.3907166, -1.956254, -2.403699, 1, 1, 1, 1, 1,
-0.3888631, 0.4852827, -0.6092709, 1, 1, 1, 1, 1,
-0.3876933, 2.403115, -0.9393963, 1, 1, 1, 1, 1,
-0.3858645, 0.8929302, 0.348404, 1, 1, 1, 1, 1,
-0.3850784, 0.4344996, -1.553504, 1, 1, 1, 1, 1,
-0.3811401, -0.9437985, -2.064895, 1, 1, 1, 1, 1,
-0.3790737, -0.09329561, -2.639501, 1, 1, 1, 1, 1,
-0.3782503, -1.293311, -2.802724, 0, 0, 1, 1, 1,
-0.3769966, -1.274957, -3.589371, 1, 0, 0, 1, 1,
-0.3760499, 1.517513, -2.245503, 1, 0, 0, 1, 1,
-0.373293, 1.17602, 0.5700047, 1, 0, 0, 1, 1,
-0.3724114, -0.815956, -5.034292, 1, 0, 0, 1, 1,
-0.3721572, 1.034992, -0.004506544, 1, 0, 0, 1, 1,
-0.3674994, 0.3579298, -1.726889, 0, 0, 0, 1, 1,
-0.367074, 0.1885568, -0.1319117, 0, 0, 0, 1, 1,
-0.3653899, -0.2306855, -2.114921, 0, 0, 0, 1, 1,
-0.3653713, -1.50631, -3.303261, 0, 0, 0, 1, 1,
-0.3644487, 0.4994925, -2.407898, 0, 0, 0, 1, 1,
-0.3636959, -0.9939612, 1.105333, 0, 0, 0, 1, 1,
-0.3606017, -0.6337057, -2.478422, 0, 0, 0, 1, 1,
-0.3565038, 1.086799, -1.004047, 1, 1, 1, 1, 1,
-0.3559217, -0.4066368, -3.404588, 1, 1, 1, 1, 1,
-0.3505751, -0.9453151, -2.979229, 1, 1, 1, 1, 1,
-0.3496566, -0.7054581, -3.148856, 1, 1, 1, 1, 1,
-0.3463546, 0.5060562, -0.1591544, 1, 1, 1, 1, 1,
-0.3448926, 0.872456, -0.01737133, 1, 1, 1, 1, 1,
-0.338351, -0.2420163, -0.8235584, 1, 1, 1, 1, 1,
-0.3362309, -1.354568, -3.088153, 1, 1, 1, 1, 1,
-0.3355792, 0.8645363, -0.3788891, 1, 1, 1, 1, 1,
-0.3350914, -0.2079516, -1.541135, 1, 1, 1, 1, 1,
-0.3279247, 0.8091749, 0.3616397, 1, 1, 1, 1, 1,
-0.3141869, 0.3320573, -3.850785, 1, 1, 1, 1, 1,
-0.3141862, -1.044511, -4.618446, 1, 1, 1, 1, 1,
-0.311158, 0.6003229, -1.994808, 1, 1, 1, 1, 1,
-0.3094613, 0.3132263, -1.312429, 1, 1, 1, 1, 1,
-0.3083625, 0.0749035, -1.975385, 0, 0, 1, 1, 1,
-0.2977454, 0.8612152, -2.15365, 1, 0, 0, 1, 1,
-0.2910731, 1.094756, 0.1637412, 1, 0, 0, 1, 1,
-0.2862742, 0.5148549, -2.273748, 1, 0, 0, 1, 1,
-0.2859123, -0.2620798, -2.712039, 1, 0, 0, 1, 1,
-0.2831877, 1.974386, -0.8028515, 1, 0, 0, 1, 1,
-0.2807344, 0.01481526, -1.725526, 0, 0, 0, 1, 1,
-0.2710926, 0.9183437, 1.281703, 0, 0, 0, 1, 1,
-0.2687868, -0.6205587, -4.08276, 0, 0, 0, 1, 1,
-0.2657897, 0.2496297, -0.7275226, 0, 0, 0, 1, 1,
-0.263866, -0.4584814, -3.952705, 0, 0, 0, 1, 1,
-0.2635878, -1.845345, -1.767731, 0, 0, 0, 1, 1,
-0.2598089, 1.358023, -0.8226166, 0, 0, 0, 1, 1,
-0.2572259, -0.8826537, -2.039702, 1, 1, 1, 1, 1,
-0.255062, -0.6206089, -0.9606738, 1, 1, 1, 1, 1,
-0.2544556, 0.6850193, -0.963586, 1, 1, 1, 1, 1,
-0.2533147, 0.8939967, -0.4675395, 1, 1, 1, 1, 1,
-0.2514054, -0.4686736, -3.744428, 1, 1, 1, 1, 1,
-0.250113, -2.134226, -3.354832, 1, 1, 1, 1, 1,
-0.240018, -0.8579763, -3.852727, 1, 1, 1, 1, 1,
-0.23283, 1.02381, -1.745892, 1, 1, 1, 1, 1,
-0.2299571, 0.8457974, -0.2226266, 1, 1, 1, 1, 1,
-0.2288643, -0.0215076, -1.724416, 1, 1, 1, 1, 1,
-0.2276648, -0.07280146, -3.683248, 1, 1, 1, 1, 1,
-0.2245857, 0.03650883, 1.541582, 1, 1, 1, 1, 1,
-0.2216785, 0.5628743, 1.297739, 1, 1, 1, 1, 1,
-0.218981, -1.983493, -2.262602, 1, 1, 1, 1, 1,
-0.2179979, 1.588048, -0.2960371, 1, 1, 1, 1, 1,
-0.2172505, 0.8313311, 0.4299186, 0, 0, 1, 1, 1,
-0.2148077, -1.727428, -3.942048, 1, 0, 0, 1, 1,
-0.2133558, -0.3395929, -4.005419, 1, 0, 0, 1, 1,
-0.2098206, 1.274936, -0.2355964, 1, 0, 0, 1, 1,
-0.2090945, -0.8084173, -2.20107, 1, 0, 0, 1, 1,
-0.2089937, -0.2968163, -1.927631, 1, 0, 0, 1, 1,
-0.203864, 1.562261, 2.035303, 0, 0, 0, 1, 1,
-0.2037554, 2.709937, 0.5304164, 0, 0, 0, 1, 1,
-0.1978495, -0.1097671, -2.910332, 0, 0, 0, 1, 1,
-0.1962712, 0.7256414, -2.303747, 0, 0, 0, 1, 1,
-0.1942657, -0.802201, -3.745744, 0, 0, 0, 1, 1,
-0.1924572, -1.247402, -5.482426, 0, 0, 0, 1, 1,
-0.1879828, -0.3416228, -3.604579, 0, 0, 0, 1, 1,
-0.1845165, -0.9120756, -3.24836, 1, 1, 1, 1, 1,
-0.1841799, -0.8840718, -2.264576, 1, 1, 1, 1, 1,
-0.1831696, 2.277951, -0.8032563, 1, 1, 1, 1, 1,
-0.1827221, 0.4889201, 0.01820436, 1, 1, 1, 1, 1,
-0.1813546, 0.1899435, -0.9047, 1, 1, 1, 1, 1,
-0.178798, -1.789808, -2.922426, 1, 1, 1, 1, 1,
-0.1780187, -0.1978071, -2.242602, 1, 1, 1, 1, 1,
-0.1779085, 0.3456491, -0.8573993, 1, 1, 1, 1, 1,
-0.1776616, -0.1619028, -3.320418, 1, 1, 1, 1, 1,
-0.1717967, 0.7966539, 0.5259264, 1, 1, 1, 1, 1,
-0.1686982, -0.8691525, -0.7320852, 1, 1, 1, 1, 1,
-0.164721, -0.2289886, -3.120937, 1, 1, 1, 1, 1,
-0.1594347, -0.521906, -2.205847, 1, 1, 1, 1, 1,
-0.1572617, -2.33274, -3.005168, 1, 1, 1, 1, 1,
-0.1570327, 0.1860742, -1.850275, 1, 1, 1, 1, 1,
-0.1558482, -1.361847, -2.943805, 0, 0, 1, 1, 1,
-0.1520758, 2.854272, 0.8258083, 1, 0, 0, 1, 1,
-0.1484714, -2.254675, -2.568455, 1, 0, 0, 1, 1,
-0.148351, -1.606916, -2.047769, 1, 0, 0, 1, 1,
-0.1471653, -0.1400946, -3.189726, 1, 0, 0, 1, 1,
-0.1471304, -0.3205418, -2.41978, 1, 0, 0, 1, 1,
-0.1453604, -0.6472186, -2.147692, 0, 0, 0, 1, 1,
-0.1451887, -0.7676763, -1.779391, 0, 0, 0, 1, 1,
-0.1417971, -0.5026747, -1.708453, 0, 0, 0, 1, 1,
-0.1377278, 0.7719073, 1.410741, 0, 0, 0, 1, 1,
-0.1337925, -0.1038756, -1.713529, 0, 0, 0, 1, 1,
-0.1337413, 0.1476506, -1.226761, 0, 0, 0, 1, 1,
-0.1312213, -0.4906884, -1.067279, 0, 0, 0, 1, 1,
-0.129917, 1.115659, 0.4529278, 1, 1, 1, 1, 1,
-0.1282483, 2.09753, 0.4280947, 1, 1, 1, 1, 1,
-0.1256717, 0.5879125, -0.9643055, 1, 1, 1, 1, 1,
-0.1245739, -1.490497, -4.079238, 1, 1, 1, 1, 1,
-0.1233977, 1.143348, 0.9924445, 1, 1, 1, 1, 1,
-0.1170215, 0.7426957, 0.5423951, 1, 1, 1, 1, 1,
-0.1155973, -0.07036584, -0.573487, 1, 1, 1, 1, 1,
-0.1123366, -0.7601078, -1.837221, 1, 1, 1, 1, 1,
-0.1107887, -1.284685, -2.959672, 1, 1, 1, 1, 1,
-0.109214, -0.9135266, -2.610538, 1, 1, 1, 1, 1,
-0.1065108, -0.2054168, -3.009748, 1, 1, 1, 1, 1,
-0.1019204, -0.4139577, -3.213871, 1, 1, 1, 1, 1,
-0.1015008, 1.643961, -1.569716, 1, 1, 1, 1, 1,
-0.09420066, -2.749841, -3.332212, 1, 1, 1, 1, 1,
-0.09151985, 1.062224, -1.101451, 1, 1, 1, 1, 1,
-0.08893318, -0.7735659, -1.803094, 0, 0, 1, 1, 1,
-0.0835386, 0.4215494, -0.0799891, 1, 0, 0, 1, 1,
-0.08162051, 0.2133685, -0.1554297, 1, 0, 0, 1, 1,
-0.08159277, 0.2613895, -1.747681, 1, 0, 0, 1, 1,
-0.0718983, 0.4402115, -0.6439116, 1, 0, 0, 1, 1,
-0.07171797, 0.06443565, -1.628356, 1, 0, 0, 1, 1,
-0.07092223, -0.7735053, -3.18845, 0, 0, 0, 1, 1,
-0.07058696, -0.2733673, -2.769783, 0, 0, 0, 1, 1,
-0.06987084, 0.01733811, -1.407689, 0, 0, 0, 1, 1,
-0.06084126, -1.256581, -2.764824, 0, 0, 0, 1, 1,
-0.06038361, 0.03177347, 0.4918069, 0, 0, 0, 1, 1,
-0.05964991, -1.389213, -2.480916, 0, 0, 0, 1, 1,
-0.05074696, -0.8478324, -1.364519, 0, 0, 0, 1, 1,
-0.05062333, -0.5776309, -3.397292, 1, 1, 1, 1, 1,
-0.04623434, 0.8212143, 1.178958, 1, 1, 1, 1, 1,
-0.04308198, -0.3635823, -1.541694, 1, 1, 1, 1, 1,
-0.04264294, -0.4118703, -3.609714, 1, 1, 1, 1, 1,
-0.03816561, -1.014127, -3.276392, 1, 1, 1, 1, 1,
-0.0300063, 0.1555205, 1.501679, 1, 1, 1, 1, 1,
-0.02517326, 2.275439, 0.5755937, 1, 1, 1, 1, 1,
-0.02449173, 0.2742406, -0.01880058, 1, 1, 1, 1, 1,
-0.02017947, -1.124911, -0.923243, 1, 1, 1, 1, 1,
-0.0183208, 1.57205, -1.576653, 1, 1, 1, 1, 1,
-0.01536134, -0.1322571, -3.468207, 1, 1, 1, 1, 1,
-0.0145361, 0.1540696, 0.130358, 1, 1, 1, 1, 1,
-0.01358335, 0.5802767, 1.553754, 1, 1, 1, 1, 1,
-0.01337749, 0.4484242, -0.6663565, 1, 1, 1, 1, 1,
-0.01209179, -0.07911006, -3.043077, 1, 1, 1, 1, 1,
-0.01027733, -0.0392963, -2.595359, 0, 0, 1, 1, 1,
-0.009287162, -0.05252105, -3.123996, 1, 0, 0, 1, 1,
-0.007989154, 1.835869, -0.6308931, 1, 0, 0, 1, 1,
-0.005753485, -0.8416873, -3.151141, 1, 0, 0, 1, 1,
-0.004227198, -1.283427, -4.545043, 1, 0, 0, 1, 1,
-0.002279795, -0.01478596, -3.729024, 1, 0, 0, 1, 1,
-0.0006902207, -1.461386, -2.224311, 0, 0, 0, 1, 1,
-0.0006178221, -1.053902, -3.984971, 0, 0, 0, 1, 1,
1.907245e-05, 1.639909, 0.7297421, 0, 0, 0, 1, 1,
0.00172285, 0.8989005, -1.563986, 0, 0, 0, 1, 1,
0.005438471, 0.8247073, -0.1021951, 0, 0, 0, 1, 1,
0.00580895, -0.4514042, 4.131579, 0, 0, 0, 1, 1,
0.01071509, -0.2594237, 2.273116, 0, 0, 0, 1, 1,
0.01523317, 0.481462, -0.3646926, 1, 1, 1, 1, 1,
0.01651297, -0.2124544, 4.552159, 1, 1, 1, 1, 1,
0.01780656, 0.6435921, -2.46828, 1, 1, 1, 1, 1,
0.01828268, -0.5345262, 4.479043, 1, 1, 1, 1, 1,
0.01935587, -0.9900143, 3.564596, 1, 1, 1, 1, 1,
0.02777296, -1.02066, 3.402639, 1, 1, 1, 1, 1,
0.03068637, -0.9317788, 1.063026, 1, 1, 1, 1, 1,
0.03642569, -1.720866, 3.905161, 1, 1, 1, 1, 1,
0.04026406, 2.621565, -0.639383, 1, 1, 1, 1, 1,
0.04068439, -1.211571, 3.000082, 1, 1, 1, 1, 1,
0.04201433, -0.2281047, 3.818269, 1, 1, 1, 1, 1,
0.04314147, -1.618944, 2.648336, 1, 1, 1, 1, 1,
0.04753142, 0.1486526, 2.207798, 1, 1, 1, 1, 1,
0.04817923, 2.133826, 0.2182523, 1, 1, 1, 1, 1,
0.05042006, -0.4489223, 5.033017, 1, 1, 1, 1, 1,
0.05118031, 0.9037325, -2.001244, 0, 0, 1, 1, 1,
0.05220574, -2.537273, 3.430448, 1, 0, 0, 1, 1,
0.05237762, 2.371678, -0.4761352, 1, 0, 0, 1, 1,
0.05296291, -1.581965, 3.708605, 1, 0, 0, 1, 1,
0.05828786, -0.7495466, 3.023412, 1, 0, 0, 1, 1,
0.06100411, 0.3666763, 0.614611, 1, 0, 0, 1, 1,
0.06416237, 0.5468487, 1.378684, 0, 0, 0, 1, 1,
0.06575041, -0.7630443, 3.284966, 0, 0, 0, 1, 1,
0.06631385, -0.800047, 2.562403, 0, 0, 0, 1, 1,
0.06636646, 0.8695486, 0.6465745, 0, 0, 0, 1, 1,
0.07064178, 0.8177977, -1.083327, 0, 0, 0, 1, 1,
0.07225237, -1.386406, 2.049216, 0, 0, 0, 1, 1,
0.07329227, 0.7819384, 0.55542, 0, 0, 0, 1, 1,
0.07452803, -0.4380433, 3.927741, 1, 1, 1, 1, 1,
0.07453608, 0.4700565, 0.1126807, 1, 1, 1, 1, 1,
0.07933149, -0.8126044, 5.532788, 1, 1, 1, 1, 1,
0.08405124, 2.17107, 1.182612, 1, 1, 1, 1, 1,
0.08437387, 1.039145, -0.2404244, 1, 1, 1, 1, 1,
0.08934764, -0.6461114, 1.664144, 1, 1, 1, 1, 1,
0.09402268, -0.6244636, 3.927399, 1, 1, 1, 1, 1,
0.09509047, -0.4055731, 3.148206, 1, 1, 1, 1, 1,
0.09530301, 0.8877215, 0.006369987, 1, 1, 1, 1, 1,
0.1024324, -0.1101305, 1.915716, 1, 1, 1, 1, 1,
0.1075002, -1.604377, 3.262785, 1, 1, 1, 1, 1,
0.1126822, -0.1331557, 2.919065, 1, 1, 1, 1, 1,
0.1132488, 0.9950253, 2.434232, 1, 1, 1, 1, 1,
0.1141404, 0.7634215, -0.06366636, 1, 1, 1, 1, 1,
0.1143584, 0.1594211, 0.4482113, 1, 1, 1, 1, 1,
0.1146552, -1.086291, 2.014578, 0, 0, 1, 1, 1,
0.1185745, -0.4672465, 3.079175, 1, 0, 0, 1, 1,
0.1191199, 0.2067077, 1.673329, 1, 0, 0, 1, 1,
0.119488, -0.9104397, 3.357009, 1, 0, 0, 1, 1,
0.1201729, -1.857322, 2.867744, 1, 0, 0, 1, 1,
0.1204138, -0.5738319, 3.368336, 1, 0, 0, 1, 1,
0.1276383, -0.4994527, 2.011699, 0, 0, 0, 1, 1,
0.1322165, 0.07029323, 0.9835978, 0, 0, 0, 1, 1,
0.1378111, 0.6940721, 0.1931627, 0, 0, 0, 1, 1,
0.1380942, 0.6181819, 0.6189443, 0, 0, 0, 1, 1,
0.1395495, 1.747222, -1.278697, 0, 0, 0, 1, 1,
0.1465444, -0.1069212, 1.155488, 0, 0, 0, 1, 1,
0.1481784, 0.1156016, -0.7021694, 0, 0, 0, 1, 1,
0.1518528, 0.6091437, 0.105828, 1, 1, 1, 1, 1,
0.152263, -1.333269, 3.193943, 1, 1, 1, 1, 1,
0.1653608, -1.763902, 3.009542, 1, 1, 1, 1, 1,
0.1674903, -1.396081, 4.275218, 1, 1, 1, 1, 1,
0.1690648, -0.4253577, 3.003896, 1, 1, 1, 1, 1,
0.1708524, -1.577773, 1.32116, 1, 1, 1, 1, 1,
0.1718937, 0.7220216, -1.592263, 1, 1, 1, 1, 1,
0.1726953, 0.819804, -0.35839, 1, 1, 1, 1, 1,
0.1755162, -2.03047, 3.20241, 1, 1, 1, 1, 1,
0.1798712, -0.1509956, 1.964118, 1, 1, 1, 1, 1,
0.1804453, -0.08899768, 1.563695, 1, 1, 1, 1, 1,
0.1827954, -0.9849319, 1.228461, 1, 1, 1, 1, 1,
0.1856682, 0.63559, 0.769469, 1, 1, 1, 1, 1,
0.1878991, -0.6235086, 3.158246, 1, 1, 1, 1, 1,
0.1894918, -1.26958, 2.953219, 1, 1, 1, 1, 1,
0.1902578, -1.081039, 3.263675, 0, 0, 1, 1, 1,
0.1918487, -1.949769, 4.420496, 1, 0, 0, 1, 1,
0.1959894, 0.06210605, 1.803516, 1, 0, 0, 1, 1,
0.1962999, -0.1328127, 3.873717, 1, 0, 0, 1, 1,
0.2031022, -0.2739979, 2.811781, 1, 0, 0, 1, 1,
0.2090616, 0.943285, 0.04511568, 1, 0, 0, 1, 1,
0.2096901, 0.3825748, 0.02742339, 0, 0, 0, 1, 1,
0.2101777, -0.8082622, 2.320907, 0, 0, 0, 1, 1,
0.2103583, 0.06017277, 1.24419, 0, 0, 0, 1, 1,
0.2239435, 0.6662571, 1.385175, 0, 0, 0, 1, 1,
0.2247769, 0.9016066, 0.3356291, 0, 0, 0, 1, 1,
0.2253052, -0.4564618, 4.293931, 0, 0, 0, 1, 1,
0.2257179, -0.01337114, 0.2947953, 0, 0, 0, 1, 1,
0.2269619, 1.828113, -1.638861, 1, 1, 1, 1, 1,
0.2270056, -1.69356, 2.387908, 1, 1, 1, 1, 1,
0.2276979, -0.8912577, 2.885392, 1, 1, 1, 1, 1,
0.2352958, -1.340367, 2.454714, 1, 1, 1, 1, 1,
0.2369592, -1.488927, 2.863249, 1, 1, 1, 1, 1,
0.2379412, -0.3847911, 2.041474, 1, 1, 1, 1, 1,
0.2434478, -0.5224668, 3.117066, 1, 1, 1, 1, 1,
0.2456207, -1.906064, 2.209836, 1, 1, 1, 1, 1,
0.2496116, -0.6862866, 3.831743, 1, 1, 1, 1, 1,
0.2513037, -0.4616222, 3.262679, 1, 1, 1, 1, 1,
0.2536492, 0.6119221, 1.104745, 1, 1, 1, 1, 1,
0.2539056, 1.094506, -0.4674736, 1, 1, 1, 1, 1,
0.2568828, -0.2301282, 2.321096, 1, 1, 1, 1, 1,
0.2580806, -1.475424, 2.864043, 1, 1, 1, 1, 1,
0.2597776, 0.3860323, 1.606609, 1, 1, 1, 1, 1,
0.2628199, 0.952842, -0.1766126, 0, 0, 1, 1, 1,
0.2652984, -0.01973405, 0.7186286, 1, 0, 0, 1, 1,
0.2706422, 0.8995781, -1.642794, 1, 0, 0, 1, 1,
0.2741068, 1.606725, -0.4106095, 1, 0, 0, 1, 1,
0.2746601, -1.001491, 2.986816, 1, 0, 0, 1, 1,
0.27792, 0.274005, 0.6019382, 1, 0, 0, 1, 1,
0.289001, 0.7548268, -1.012967, 0, 0, 0, 1, 1,
0.292001, -0.9318804, 3.821589, 0, 0, 0, 1, 1,
0.2959428, 1.686811, -0.6373537, 0, 0, 0, 1, 1,
0.295977, -0.2683645, 1.78833, 0, 0, 0, 1, 1,
0.2967334, -0.8540843, 2.808382, 0, 0, 0, 1, 1,
0.2969294, -0.5333885, 2.403228, 0, 0, 0, 1, 1,
0.300648, 0.8924946, 1.228363, 0, 0, 0, 1, 1,
0.3011894, 0.7525982, 0.6528163, 1, 1, 1, 1, 1,
0.301585, -0.4541925, 0.6577195, 1, 1, 1, 1, 1,
0.305682, 0.7211987, 0.2019117, 1, 1, 1, 1, 1,
0.308413, -0.0561449, 1.223583, 1, 1, 1, 1, 1,
0.3127517, -0.409312, 2.186734, 1, 1, 1, 1, 1,
0.3162651, -0.4483918, 1.897435, 1, 1, 1, 1, 1,
0.3222967, 1.063197, 0.1170386, 1, 1, 1, 1, 1,
0.3233632, 0.5700762, -0.302984, 1, 1, 1, 1, 1,
0.326179, 2.269255, 0.3594314, 1, 1, 1, 1, 1,
0.3282975, 1.073581, 0.4321482, 1, 1, 1, 1, 1,
0.3287105, -0.917767, 3.71454, 1, 1, 1, 1, 1,
0.333775, 0.9732586, 0.5278367, 1, 1, 1, 1, 1,
0.3368746, 0.6186309, 1.393717, 1, 1, 1, 1, 1,
0.340222, -0.2683777, 2.987456, 1, 1, 1, 1, 1,
0.3435166, 1.87376, 1.304422, 1, 1, 1, 1, 1,
0.3446879, -0.6432932, 2.757795, 0, 0, 1, 1, 1,
0.3449762, -0.03909287, 1.403518, 1, 0, 0, 1, 1,
0.3471995, -0.1863599, 2.535676, 1, 0, 0, 1, 1,
0.3499967, -1.02726, 1.05749, 1, 0, 0, 1, 1,
0.3534809, 0.3558259, -1.526313, 1, 0, 0, 1, 1,
0.3535735, 0.2258897, 1.457983, 1, 0, 0, 1, 1,
0.3574648, 0.002524364, 0.4053428, 0, 0, 0, 1, 1,
0.3600063, -1.029765, 2.886617, 0, 0, 0, 1, 1,
0.3606216, -0.04981028, 0.6875076, 0, 0, 0, 1, 1,
0.3707619, 1.047564, 0.268164, 0, 0, 0, 1, 1,
0.3719995, -0.6759031, 2.370404, 0, 0, 0, 1, 1,
0.3725063, 1.381761, 0.7776936, 0, 0, 0, 1, 1,
0.3741229, 0.6207435, 1.27083, 0, 0, 0, 1, 1,
0.3766034, 0.6078625, -0.2967988, 1, 1, 1, 1, 1,
0.376961, -0.9818588, 2.92718, 1, 1, 1, 1, 1,
0.3779962, -0.4587478, 1.830092, 1, 1, 1, 1, 1,
0.378746, 0.6104372, 2.607879, 1, 1, 1, 1, 1,
0.3797573, -1.800368, 2.437383, 1, 1, 1, 1, 1,
0.379782, -1.291977, 2.532716, 1, 1, 1, 1, 1,
0.3811297, 1.71883, 1.672254, 1, 1, 1, 1, 1,
0.381131, -0.6735389, 2.792691, 1, 1, 1, 1, 1,
0.3814551, -0.5852636, 4.981055, 1, 1, 1, 1, 1,
0.381743, -0.08774965, -0.4722488, 1, 1, 1, 1, 1,
0.3838014, -0.9568337, 2.15408, 1, 1, 1, 1, 1,
0.3859376, -1.500563, 1.267121, 1, 1, 1, 1, 1,
0.3864541, 1.168749, -0.4632849, 1, 1, 1, 1, 1,
0.3868018, 1.145396, 1.250869, 1, 1, 1, 1, 1,
0.3895579, -1.657662, 2.124244, 1, 1, 1, 1, 1,
0.3940657, -0.4292905, 3.96711, 0, 0, 1, 1, 1,
0.3953032, 2.34035, -1.866847, 1, 0, 0, 1, 1,
0.3953145, -1.096602, 3.42687, 1, 0, 0, 1, 1,
0.3964743, 0.2756447, 0.4634123, 1, 0, 0, 1, 1,
0.3999898, -1.705222, 2.280526, 1, 0, 0, 1, 1,
0.4031625, -0.4493432, 2.784208, 1, 0, 0, 1, 1,
0.4055514, 2.650578, 0.5071452, 0, 0, 0, 1, 1,
0.4103061, 1.306826, -0.06568733, 0, 0, 0, 1, 1,
0.411814, 0.3528601, 0.9290209, 0, 0, 0, 1, 1,
0.4144617, 2.384152, -0.4343258, 0, 0, 0, 1, 1,
0.4183747, -0.5164597, 3.468258, 0, 0, 0, 1, 1,
0.419282, 0.6557283, 1.660847, 0, 0, 0, 1, 1,
0.4239152, -0.1513473, 1.470326, 0, 0, 0, 1, 1,
0.4274571, -0.712952, 3.597569, 1, 1, 1, 1, 1,
0.4282315, 2.430978, 2.127542, 1, 1, 1, 1, 1,
0.4314463, -2.357134, 3.033329, 1, 1, 1, 1, 1,
0.4401172, -0.2196156, 2.307772, 1, 1, 1, 1, 1,
0.4416249, 1.338124, 0.3036823, 1, 1, 1, 1, 1,
0.4438933, 0.385994, 1.4813, 1, 1, 1, 1, 1,
0.4469708, -0.963326, 3.098367, 1, 1, 1, 1, 1,
0.4490308, 0.5178286, -0.08312511, 1, 1, 1, 1, 1,
0.4495976, 1.192289, -1.125415, 1, 1, 1, 1, 1,
0.4518603, -1.309178, 3.332866, 1, 1, 1, 1, 1,
0.4524143, 0.4488918, 0.5458205, 1, 1, 1, 1, 1,
0.4542639, 1.083299, 0.6215099, 1, 1, 1, 1, 1,
0.4580951, -0.5469823, 1.313588, 1, 1, 1, 1, 1,
0.4626402, 0.5878238, 1.293826, 1, 1, 1, 1, 1,
0.4651365, 0.8751368, 0.4714932, 1, 1, 1, 1, 1,
0.4658612, 1.501597, -0.2602651, 0, 0, 1, 1, 1,
0.4682318, 0.4147034, 0.3061492, 1, 0, 0, 1, 1,
0.4773211, -2.07573, 2.726566, 1, 0, 0, 1, 1,
0.4826358, -0.9840246, 3.095872, 1, 0, 0, 1, 1,
0.4829729, 0.1793048, 0.580147, 1, 0, 0, 1, 1,
0.4869375, 0.5800536, 0.1326872, 1, 0, 0, 1, 1,
0.4977709, -0.1699789, 0.600772, 0, 0, 0, 1, 1,
0.4984712, 0.8096454, 1.677948, 0, 0, 0, 1, 1,
0.4988883, -0.9422475, 4.053848, 0, 0, 0, 1, 1,
0.5070433, 0.1724455, 1.681898, 0, 0, 0, 1, 1,
0.5079794, -0.2456675, 2.227528, 0, 0, 0, 1, 1,
0.5089785, 0.3711824, 1.94338, 0, 0, 0, 1, 1,
0.5103385, -1.354187, 2.564755, 0, 0, 0, 1, 1,
0.5185418, 0.246582, 0.7495963, 1, 1, 1, 1, 1,
0.5192872, 0.9630344, 0.7194464, 1, 1, 1, 1, 1,
0.5467783, -2.791484, 6.089553, 1, 1, 1, 1, 1,
0.5471804, 0.1070943, 2.130793, 1, 1, 1, 1, 1,
0.5487387, -0.1618488, 1.106746, 1, 1, 1, 1, 1,
0.5492269, -0.8693975, 2.156403, 1, 1, 1, 1, 1,
0.5499738, -1.778268, 3.505566, 1, 1, 1, 1, 1,
0.5516624, -1.728663, 3.23345, 1, 1, 1, 1, 1,
0.5516657, 0.1813, 2.370921, 1, 1, 1, 1, 1,
0.553982, 0.5124771, -2.052225, 1, 1, 1, 1, 1,
0.5584897, 0.6730291, 0.04705883, 1, 1, 1, 1, 1,
0.5595728, -0.06305289, 0.8870164, 1, 1, 1, 1, 1,
0.5619455, 0.6825063, 2.197839, 1, 1, 1, 1, 1,
0.5670009, 0.3631691, -0.2337646, 1, 1, 1, 1, 1,
0.567139, -0.7498073, 1.600735, 1, 1, 1, 1, 1,
0.573477, -0.3480411, 3.15954, 0, 0, 1, 1, 1,
0.5800664, -1.870584, 2.878546, 1, 0, 0, 1, 1,
0.5844834, 1.812578, -0.6623654, 1, 0, 0, 1, 1,
0.5851716, -0.3506416, 1.364118, 1, 0, 0, 1, 1,
0.5886303, -0.2801115, 0.9882643, 1, 0, 0, 1, 1,
0.6000898, -0.6876369, 1.291775, 1, 0, 0, 1, 1,
0.6038677, 0.3829404, 0.8941961, 0, 0, 0, 1, 1,
0.6067311, 0.7603828, 0.4652656, 0, 0, 0, 1, 1,
0.6083574, -1.17543, 2.100637, 0, 0, 0, 1, 1,
0.6150283, 0.484829, 1.260363, 0, 0, 0, 1, 1,
0.617111, 0.004557873, 3.324902, 0, 0, 0, 1, 1,
0.618383, -0.4653312, 3.44511, 0, 0, 0, 1, 1,
0.6196598, 0.04483736, 0.1965235, 0, 0, 0, 1, 1,
0.6201779, -0.5930229, 2.951516, 1, 1, 1, 1, 1,
0.6224905, -0.03432254, 1.274589, 1, 1, 1, 1, 1,
0.623564, 0.6853069, 0.798192, 1, 1, 1, 1, 1,
0.6244124, -1.285066, 2.543496, 1, 1, 1, 1, 1,
0.6260215, 0.2802742, 1.269757, 1, 1, 1, 1, 1,
0.628891, 1.353325, -0.9100202, 1, 1, 1, 1, 1,
0.6387187, 1.09494, 0.1851535, 1, 1, 1, 1, 1,
0.6406256, -0.4019015, 2.358875, 1, 1, 1, 1, 1,
0.6417857, -1.003633, 2.920445, 1, 1, 1, 1, 1,
0.642167, -0.1732578, 2.668635, 1, 1, 1, 1, 1,
0.6446339, -0.9180726, 2.919703, 1, 1, 1, 1, 1,
0.6458179, -1.00743, 2.989022, 1, 1, 1, 1, 1,
0.6494883, -0.1122585, 0.6721421, 1, 1, 1, 1, 1,
0.6499444, 0.2234985, 1.238399, 1, 1, 1, 1, 1,
0.6587233, -0.4049852, 1.671983, 1, 1, 1, 1, 1,
0.6588216, -1.179371, 2.016257, 0, 0, 1, 1, 1,
0.6672475, -0.5699845, 0.1308482, 1, 0, 0, 1, 1,
0.6767803, -0.9008338, 2.601303, 1, 0, 0, 1, 1,
0.683744, -1.337601, 2.323873, 1, 0, 0, 1, 1,
0.6969781, -0.4067998, 2.190819, 1, 0, 0, 1, 1,
0.6979897, -0.2793123, 1.784494, 1, 0, 0, 1, 1,
0.6983466, -2.375344, 0.9177992, 0, 0, 0, 1, 1,
0.7006681, -1.713416, 4.447234, 0, 0, 0, 1, 1,
0.7055048, 0.8969038, -0.7310344, 0, 0, 0, 1, 1,
0.7117031, -1.680378, 2.933116, 0, 0, 0, 1, 1,
0.7123798, 0.4534436, 1.991761, 0, 0, 0, 1, 1,
0.7133853, 0.09156448, -1.249769, 0, 0, 0, 1, 1,
0.7144356, 0.5196276, 1.190321, 0, 0, 0, 1, 1,
0.7147083, -0.1937318, 1.825877, 1, 1, 1, 1, 1,
0.720508, -0.7195578, 2.915959, 1, 1, 1, 1, 1,
0.7312748, -0.6924405, 2.881089, 1, 1, 1, 1, 1,
0.7361563, 1.441679, -0.1156283, 1, 1, 1, 1, 1,
0.7409398, 0.6719998, 2.685852, 1, 1, 1, 1, 1,
0.7448959, -0.1449203, 1.436884, 1, 1, 1, 1, 1,
0.7453871, 0.5838258, -0.6463119, 1, 1, 1, 1, 1,
0.7490144, -0.254455, 3.359478, 1, 1, 1, 1, 1,
0.762559, 1.069277, 1.039213, 1, 1, 1, 1, 1,
0.763046, 0.872026, 0.1699103, 1, 1, 1, 1, 1,
0.7697921, -0.469671, 2.554964, 1, 1, 1, 1, 1,
0.7775937, -0.2428367, 1.412997, 1, 1, 1, 1, 1,
0.7776472, -1.088201, 1.517361, 1, 1, 1, 1, 1,
0.7785584, 0.6585488, -0.05732271, 1, 1, 1, 1, 1,
0.780387, -1.755935, 1.514517, 1, 1, 1, 1, 1,
0.7833948, 2.950654, 0.5162869, 0, 0, 1, 1, 1,
0.7877889, -0.7686925, 3.956442, 1, 0, 0, 1, 1,
0.7878072, 0.3726924, 0.8583867, 1, 0, 0, 1, 1,
0.7923132, -0.7341686, 0.7407521, 1, 0, 0, 1, 1,
0.8051416, 0.7449032, 1.772359, 1, 0, 0, 1, 1,
0.8084751, 0.557649, 1.27024, 1, 0, 0, 1, 1,
0.8112409, -0.6953544, 0.686709, 0, 0, 0, 1, 1,
0.8209921, 0.9007252, 0.02953714, 0, 0, 0, 1, 1,
0.824886, -0.9426246, 4.178511, 0, 0, 0, 1, 1,
0.8253112, -0.574983, 2.785996, 0, 0, 0, 1, 1,
0.8343619, -1.563758, 4.520085, 0, 0, 0, 1, 1,
0.8346349, -1.387499, 3.286793, 0, 0, 0, 1, 1,
0.8350819, 0.6346968, -0.02290924, 0, 0, 0, 1, 1,
0.8371685, 1.575164, 0.1592929, 1, 1, 1, 1, 1,
0.8386666, -1.544031, 3.132683, 1, 1, 1, 1, 1,
0.8423377, -0.4941489, 1.195234, 1, 1, 1, 1, 1,
0.8431678, -1.201628, 3.616432, 1, 1, 1, 1, 1,
0.8445627, 1.561667, -0.2714365, 1, 1, 1, 1, 1,
0.8476573, -0.7437895, 1.963064, 1, 1, 1, 1, 1,
0.8505896, 0.1901172, 1.844742, 1, 1, 1, 1, 1,
0.8568907, 0.399856, 1.847152, 1, 1, 1, 1, 1,
0.8599997, 1.356875, 1.764035, 1, 1, 1, 1, 1,
0.8698477, 0.5030318, 1.341937, 1, 1, 1, 1, 1,
0.8772532, 0.5597807, 1.343624, 1, 1, 1, 1, 1,
0.8790322, 0.5902805, -0.7693722, 1, 1, 1, 1, 1,
0.8870562, -0.8929158, 1.381055, 1, 1, 1, 1, 1,
0.8946925, -0.5574255, 1.731989, 1, 1, 1, 1, 1,
0.9140747, 0.2195406, 0.9098992, 1, 1, 1, 1, 1,
0.9161133, 0.7600574, -0.8090546, 0, 0, 1, 1, 1,
0.921136, -0.4095421, 1.723786, 1, 0, 0, 1, 1,
0.9275349, 0.7288426, 2.142671, 1, 0, 0, 1, 1,
0.9524758, 0.7669901, 2.141756, 1, 0, 0, 1, 1,
0.9527737, 1.174399, 0.335388, 1, 0, 0, 1, 1,
0.9577166, -0.5465029, 0.6394327, 1, 0, 0, 1, 1,
0.9603927, -0.1718609, 1.71189, 0, 0, 0, 1, 1,
0.9655584, -0.8841857, 2.087486, 0, 0, 0, 1, 1,
0.9657429, 0.2691016, 0.7667278, 0, 0, 0, 1, 1,
0.9686183, 1.182578, -0.3025312, 0, 0, 0, 1, 1,
0.9770702, 0.8272579, -1.105424, 0, 0, 0, 1, 1,
0.9859837, 2.173264, -1.64063, 0, 0, 0, 1, 1,
0.9907369, 0.4487869, 2.822596, 0, 0, 0, 1, 1,
1.00419, -0.04707683, 1.411961, 1, 1, 1, 1, 1,
1.007934, 0.4440259, 3.016779, 1, 1, 1, 1, 1,
1.022401, -0.1678933, 2.694375, 1, 1, 1, 1, 1,
1.024447, -1.344803, 3.583467, 1, 1, 1, 1, 1,
1.031861, -1.371658, 0.8054373, 1, 1, 1, 1, 1,
1.037353, 0.950492, 0.1420807, 1, 1, 1, 1, 1,
1.041919, -1.368445, 2.066996, 1, 1, 1, 1, 1,
1.046782, 1.025303, -1.125848, 1, 1, 1, 1, 1,
1.04766, 0.1402444, 1.735837, 1, 1, 1, 1, 1,
1.049542, -1.689008, 3.740877, 1, 1, 1, 1, 1,
1.054422, -0.06785505, 0.936262, 1, 1, 1, 1, 1,
1.070283, 2.264499, 1.734254, 1, 1, 1, 1, 1,
1.077629, 0.165067, 1.020219, 1, 1, 1, 1, 1,
1.079389, 1.527639, 0.6424342, 1, 1, 1, 1, 1,
1.082013, 0.7369529, 1.869657, 1, 1, 1, 1, 1,
1.090968, -1.17007, 2.15539, 0, 0, 1, 1, 1,
1.095771, -1.127326, 3.009613, 1, 0, 0, 1, 1,
1.09931, -0.1320524, 1.573057, 1, 0, 0, 1, 1,
1.100769, 0.02837676, 2.777647, 1, 0, 0, 1, 1,
1.101246, 0.6541305, 1.5878, 1, 0, 0, 1, 1,
1.103273, -1.209631, 2.524771, 1, 0, 0, 1, 1,
1.107493, 0.3876263, 0.9487916, 0, 0, 0, 1, 1,
1.113235, -0.4438872, 1.275064, 0, 0, 0, 1, 1,
1.114193, -0.1471532, 2.359751, 0, 0, 0, 1, 1,
1.119159, -0.6337529, 2.15582, 0, 0, 0, 1, 1,
1.119985, 0.1013932, 2.002092, 0, 0, 0, 1, 1,
1.136826, -1.511197, 4.236213, 0, 0, 0, 1, 1,
1.137202, -0.3126405, 2.52661, 0, 0, 0, 1, 1,
1.142413, 0.274315, 1.458258, 1, 1, 1, 1, 1,
1.145333, 0.5084435, 1.765611, 1, 1, 1, 1, 1,
1.154718, 0.9565487, 0.8938177, 1, 1, 1, 1, 1,
1.156637, 1.631537, 1.655727, 1, 1, 1, 1, 1,
1.159621, -2.672897, 4.013386, 1, 1, 1, 1, 1,
1.160471, -1.492098, 3.76182, 1, 1, 1, 1, 1,
1.162591, -0.2733827, 2.318836, 1, 1, 1, 1, 1,
1.173952, 0.5152743, 0.1639975, 1, 1, 1, 1, 1,
1.177455, 0.3446679, 1.621528, 1, 1, 1, 1, 1,
1.193658, -0.7247201, 2.62625, 1, 1, 1, 1, 1,
1.210388, -1.166328, 1.121041, 1, 1, 1, 1, 1,
1.210552, 1.051663, 0.4306903, 1, 1, 1, 1, 1,
1.211093, -0.3392306, 0.8989094, 1, 1, 1, 1, 1,
1.211994, -1.481611, 1.112729, 1, 1, 1, 1, 1,
1.226474, -0.4541296, 1.779088, 1, 1, 1, 1, 1,
1.23558, 0.01015096, 0.5368285, 0, 0, 1, 1, 1,
1.238998, -0.3554609, 1.56514, 1, 0, 0, 1, 1,
1.243167, 0.5760875, 0.5113345, 1, 0, 0, 1, 1,
1.253305, -2.644367, 1.571435, 1, 0, 0, 1, 1,
1.272761, -0.8772503, 1.484614, 1, 0, 0, 1, 1,
1.274298, -1.191876, 3.743217, 1, 0, 0, 1, 1,
1.279613, -1.40786, 2.577721, 0, 0, 0, 1, 1,
1.283412, 0.7980077, 0.4277783, 0, 0, 0, 1, 1,
1.290087, 0.5963427, 2.288268, 0, 0, 0, 1, 1,
1.295975, 0.6637606, 0.3439078, 0, 0, 0, 1, 1,
1.295984, 0.6335425, 2.127882, 0, 0, 0, 1, 1,
1.296958, -1.191873, 3.492764, 0, 0, 0, 1, 1,
1.306488, 0.9789108, 2.794477, 0, 0, 0, 1, 1,
1.307914, 0.1576649, 0.4643711, 1, 1, 1, 1, 1,
1.308736, 0.09409791, 2.166269, 1, 1, 1, 1, 1,
1.310669, 0.1349821, 1.436715, 1, 1, 1, 1, 1,
1.31503, -1.021749, 1.398851, 1, 1, 1, 1, 1,
1.329063, 0.86876, 2.855795, 1, 1, 1, 1, 1,
1.331895, -1.779835, -0.06059229, 1, 1, 1, 1, 1,
1.333975, -1.312838, 3.631702, 1, 1, 1, 1, 1,
1.349328, -0.6310764, 2.412313, 1, 1, 1, 1, 1,
1.361868, -1.085709, 2.60278, 1, 1, 1, 1, 1,
1.362302, 0.2091792, 0.7865578, 1, 1, 1, 1, 1,
1.365342, -0.8488694, 2.416697, 1, 1, 1, 1, 1,
1.403017, 0.5255728, 2.259171, 1, 1, 1, 1, 1,
1.4049, 1.556541, 0.4197112, 1, 1, 1, 1, 1,
1.409759, 1.351559, 2.827285, 1, 1, 1, 1, 1,
1.411244, 0.852006, -0.6656641, 1, 1, 1, 1, 1,
1.421789, 1.630775, 0.8317297, 0, 0, 1, 1, 1,
1.429038, -0.3589533, 1.300009, 1, 0, 0, 1, 1,
1.429627, -1.359499, 4.230049, 1, 0, 0, 1, 1,
1.43221, -0.4574683, 2.682185, 1, 0, 0, 1, 1,
1.437597, 0.9674443, 2.682978, 1, 0, 0, 1, 1,
1.454232, -0.3618559, 1.341832, 1, 0, 0, 1, 1,
1.481898, -0.001202436, 0.6962272, 0, 0, 0, 1, 1,
1.490678, -2.234256, 3.76646, 0, 0, 0, 1, 1,
1.493683, -1.417691, 2.244012, 0, 0, 0, 1, 1,
1.50195, 0.2931021, 2.156939, 0, 0, 0, 1, 1,
1.535734, -0.3205487, 4.016387, 0, 0, 0, 1, 1,
1.55746, -0.02530632, 1.340546, 0, 0, 0, 1, 1,
1.558791, -0.7889557, 1.907781, 0, 0, 0, 1, 1,
1.566057, 0.5957181, 0.6015607, 1, 1, 1, 1, 1,
1.576178, -1.513722, 2.960861, 1, 1, 1, 1, 1,
1.57805, 1.624983, 2.861033, 1, 1, 1, 1, 1,
1.579221, 0.1306854, 3.483733, 1, 1, 1, 1, 1,
1.583273, 1.544389, 0.9211885, 1, 1, 1, 1, 1,
1.595912, -1.1553, 2.160559, 1, 1, 1, 1, 1,
1.60499, 0.9037163, 1.390676, 1, 1, 1, 1, 1,
1.607085, 1.019731, 1.539256, 1, 1, 1, 1, 1,
1.610812, 0.6521206, 1.109523, 1, 1, 1, 1, 1,
1.613587, -0.5442038, 1.937441, 1, 1, 1, 1, 1,
1.630536, 0.005311897, 1.365971, 1, 1, 1, 1, 1,
1.636798, 1.352849, 0.9155747, 1, 1, 1, 1, 1,
1.65029, -0.8164505, 0.8903744, 1, 1, 1, 1, 1,
1.653232, -0.1056139, 2.971181, 1, 1, 1, 1, 1,
1.659769, 0.4505545, 2.79082, 1, 1, 1, 1, 1,
1.670206, -0.6284237, 2.444725, 0, 0, 1, 1, 1,
1.672016, 0.4158488, 0.848254, 1, 0, 0, 1, 1,
1.673244, 0.2568632, 2.700747, 1, 0, 0, 1, 1,
1.679992, 0.4249909, 0.3492395, 1, 0, 0, 1, 1,
1.691496, 0.5521722, -0.4139263, 1, 0, 0, 1, 1,
1.693022, -0.787376, 2.366619, 1, 0, 0, 1, 1,
1.705637, -0.1312757, 2.805437, 0, 0, 0, 1, 1,
1.707011, -2.031145, 2.884434, 0, 0, 0, 1, 1,
1.712815, -0.9903631, 2.217206, 0, 0, 0, 1, 1,
1.716876, -0.4567997, 0.7055041, 0, 0, 0, 1, 1,
1.720316, 0.9868217, 2.506231, 0, 0, 0, 1, 1,
1.761033, 0.1517895, 3.166464, 0, 0, 0, 1, 1,
1.784664, -0.7053783, -0.09139875, 0, 0, 0, 1, 1,
1.78701, -0.5408283, 0.275714, 1, 1, 1, 1, 1,
1.806964, -1.672763, 0.7627624, 1, 1, 1, 1, 1,
1.825225, -1.647777, 1.868433, 1, 1, 1, 1, 1,
1.847376, 0.1004463, 1.233077, 1, 1, 1, 1, 1,
1.848626, 0.4826477, 0.7818706, 1, 1, 1, 1, 1,
1.857679, -0.4199557, 3.139832, 1, 1, 1, 1, 1,
1.877438, -1.739423, 3.97044, 1, 1, 1, 1, 1,
1.885609, 0.1038803, 2.390693, 1, 1, 1, 1, 1,
1.906026, -0.01183434, -0.1489631, 1, 1, 1, 1, 1,
1.90635, -0.3841765, 0.8567649, 1, 1, 1, 1, 1,
1.931356, 1.104002, 0.1014731, 1, 1, 1, 1, 1,
1.946164, -0.4036541, 1.292206, 1, 1, 1, 1, 1,
1.958863, -2.203715, 2.957297, 1, 1, 1, 1, 1,
1.968657, 1.190515, -0.6513115, 1, 1, 1, 1, 1,
1.973103, -0.006096285, 0.4165568, 1, 1, 1, 1, 1,
1.987818, -0.2351534, 3.085889, 0, 0, 1, 1, 1,
2.06255, -1.853431, 2.499909, 1, 0, 0, 1, 1,
2.090062, -0.6336349, 1.957434, 1, 0, 0, 1, 1,
2.093757, -0.3093261, 1.232279, 1, 0, 0, 1, 1,
2.121227, -0.4589056, 2.865614, 1, 0, 0, 1, 1,
2.134513, -0.5648192, 2.557208, 1, 0, 0, 1, 1,
2.162206, -0.4615296, 0.5467786, 0, 0, 0, 1, 1,
2.227294, 0.5457759, 0.9121478, 0, 0, 0, 1, 1,
2.237042, -0.9755492, 2.905719, 0, 0, 0, 1, 1,
2.248185, -1.356366, 1.787223, 0, 0, 0, 1, 1,
2.296875, -0.08668595, 1.244817, 0, 0, 0, 1, 1,
2.307233, 0.01346942, 1.816213, 0, 0, 0, 1, 1,
2.42962, 0.8517123, 0.6554725, 0, 0, 0, 1, 1,
2.460131, 0.9103938, 0.5327247, 1, 1, 1, 1, 1,
2.53416, 0.305199, 2.299759, 1, 1, 1, 1, 1,
2.620986, -0.7189861, 2.186333, 1, 1, 1, 1, 1,
2.758755, 0.02179226, 2.058009, 1, 1, 1, 1, 1,
2.775022, 1.822258, 0.7546088, 1, 1, 1, 1, 1,
2.79047, 2.036148, -1.578298, 1, 1, 1, 1, 1,
3.251311, 1.389687, -0.4587899, 1, 1, 1, 1, 1
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
var radius = 9.869741;
var distance = 34.66705;
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
mvMatrix.translate( 0.1349263, -0.04977334, -0.3035634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66705);
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
