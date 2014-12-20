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
-3.206911, 1.126301, -0.6874558, 1, 0, 0, 1,
-3.180259, 0.4852203, -1.514239, 1, 0.007843138, 0, 1,
-3.054883, 0.9305577, -0.3252805, 1, 0.01176471, 0, 1,
-2.955225, -1.195929, -3.934329, 1, 0.01960784, 0, 1,
-2.791392, -0.5284408, -1.539401, 1, 0.02352941, 0, 1,
-2.79067, -1.182258, -1.791886, 1, 0.03137255, 0, 1,
-2.725583, -1.230007, -1.767226, 1, 0.03529412, 0, 1,
-2.482267, -0.519509, -1.529624, 1, 0.04313726, 0, 1,
-2.397825, 0.009425026, -2.838654, 1, 0.04705882, 0, 1,
-2.323711, -1.561995, -2.437906, 1, 0.05490196, 0, 1,
-2.226715, -1.260571, -0.9571961, 1, 0.05882353, 0, 1,
-2.224042, 0.2520936, -3.427232, 1, 0.06666667, 0, 1,
-2.210623, -2.89991, -3.495875, 1, 0.07058824, 0, 1,
-2.181414, 0.1319253, -2.836872, 1, 0.07843138, 0, 1,
-2.180102, -0.9124636, -4.09493, 1, 0.08235294, 0, 1,
-2.172211, -0.8864959, -1.137166, 1, 0.09019608, 0, 1,
-2.133132, -0.5297784, -1.141536, 1, 0.09411765, 0, 1,
-2.123883, 0.1449531, -2.080363, 1, 0.1019608, 0, 1,
-2.120965, 0.54684, -1.305461, 1, 0.1098039, 0, 1,
-2.115833, -0.1196469, -3.000841, 1, 0.1137255, 0, 1,
-2.085876, -1.843826, -0.4661769, 1, 0.1215686, 0, 1,
-2.077564, 0.159868, -1.628547, 1, 0.1254902, 0, 1,
-2.019215, -0.9997502, -2.423848, 1, 0.1333333, 0, 1,
-2.010118, 0.6759475, -1.974624, 1, 0.1372549, 0, 1,
-2.007628, -1.691448, -2.312438, 1, 0.145098, 0, 1,
-1.976527, -0.7894077, 0.009469871, 1, 0.1490196, 0, 1,
-1.933199, 1.221156, 1.144246, 1, 0.1568628, 0, 1,
-1.92605, 0.9872106, -2.019156, 1, 0.1607843, 0, 1,
-1.884707, 0.34951, 1.295086, 1, 0.1686275, 0, 1,
-1.848777, -1.267628, -1.59171, 1, 0.172549, 0, 1,
-1.848288, 1.60497, -2.35788, 1, 0.1803922, 0, 1,
-1.838716, 0.01867031, -3.076704, 1, 0.1843137, 0, 1,
-1.837509, -0.1787166, -3.366482, 1, 0.1921569, 0, 1,
-1.837043, -0.5801276, -1.559759, 1, 0.1960784, 0, 1,
-1.80859, -0.743608, -1.624197, 1, 0.2039216, 0, 1,
-1.797059, -0.7627662, 0.451977, 1, 0.2117647, 0, 1,
-1.787181, 1.531563, -2.174595, 1, 0.2156863, 0, 1,
-1.786276, 0.1561897, -0.8611231, 1, 0.2235294, 0, 1,
-1.78247, 0.2376659, -1.341947, 1, 0.227451, 0, 1,
-1.780479, -0.4834028, -2.83063, 1, 0.2352941, 0, 1,
-1.772922, -0.3312826, -1.092011, 1, 0.2392157, 0, 1,
-1.74333, 0.4436, -3.032193, 1, 0.2470588, 0, 1,
-1.715768, -1.275241, -2.563514, 1, 0.2509804, 0, 1,
-1.685854, -0.01042196, -2.342367, 1, 0.2588235, 0, 1,
-1.675655, -0.483737, 0.5982885, 1, 0.2627451, 0, 1,
-1.675015, 1.758544, -1.483516, 1, 0.2705882, 0, 1,
-1.649507, -0.6968181, -0.7007433, 1, 0.2745098, 0, 1,
-1.645098, -1.108516, -1.84456, 1, 0.282353, 0, 1,
-1.632753, -0.9023536, -1.277065, 1, 0.2862745, 0, 1,
-1.629574, -0.04914625, -1.512517, 1, 0.2941177, 0, 1,
-1.62173, 1.074882, -2.072987, 1, 0.3019608, 0, 1,
-1.61378, -0.05501208, -3.642387, 1, 0.3058824, 0, 1,
-1.611729, -0.1279983, -0.9162814, 1, 0.3137255, 0, 1,
-1.603379, -1.116781, -1.473597, 1, 0.3176471, 0, 1,
-1.590881, 0.813723, -1.229249, 1, 0.3254902, 0, 1,
-1.586426, 0.3061086, -2.264577, 1, 0.3294118, 0, 1,
-1.586342, -0.3637168, -2.354491, 1, 0.3372549, 0, 1,
-1.582519, 0.1587561, -0.9961776, 1, 0.3411765, 0, 1,
-1.581314, -0.8197417, -2.404779, 1, 0.3490196, 0, 1,
-1.563586, 0.7983397, -0.5967876, 1, 0.3529412, 0, 1,
-1.550186, 0.0416105, -1.095886, 1, 0.3607843, 0, 1,
-1.548809, 0.2192543, -0.9410685, 1, 0.3647059, 0, 1,
-1.545004, -0.2673183, -2.830188, 1, 0.372549, 0, 1,
-1.543056, -0.5635844, -1.611096, 1, 0.3764706, 0, 1,
-1.524197, -0.4054701, -2.304657, 1, 0.3843137, 0, 1,
-1.519956, 0.7268887, -0.9620689, 1, 0.3882353, 0, 1,
-1.510815, -0.9710808, -1.82874, 1, 0.3960784, 0, 1,
-1.505794, -1.094736, -0.235387, 1, 0.4039216, 0, 1,
-1.505362, 0.4882892, -3.197865, 1, 0.4078431, 0, 1,
-1.494269, 0.7427691, 0.02007516, 1, 0.4156863, 0, 1,
-1.473232, 0.2730445, 0.714969, 1, 0.4196078, 0, 1,
-1.465779, 0.9239798, -0.6356768, 1, 0.427451, 0, 1,
-1.459877, 0.9679263, 0.4517229, 1, 0.4313726, 0, 1,
-1.456559, -1.436629, -2.035722, 1, 0.4392157, 0, 1,
-1.456389, -0.04000526, -2.028268, 1, 0.4431373, 0, 1,
-1.446092, -0.09728448, -2.918694, 1, 0.4509804, 0, 1,
-1.441417, 0.5892346, -0.527633, 1, 0.454902, 0, 1,
-1.435872, 0.1550949, -1.933517, 1, 0.4627451, 0, 1,
-1.431611, 0.174823, -0.8692695, 1, 0.4666667, 0, 1,
-1.42367, 3.293475, -0.5278104, 1, 0.4745098, 0, 1,
-1.422438, -0.4031231, -0.6675441, 1, 0.4784314, 0, 1,
-1.417451, 0.07188265, -2.135938, 1, 0.4862745, 0, 1,
-1.41538, -0.8707487, -1.516386, 1, 0.4901961, 0, 1,
-1.406737, 1.186455, -0.8418346, 1, 0.4980392, 0, 1,
-1.406667, -0.1574124, -2.116038, 1, 0.5058824, 0, 1,
-1.391355, 0.8393612, -0.2573979, 1, 0.509804, 0, 1,
-1.373576, -0.3526235, 0.8284724, 1, 0.5176471, 0, 1,
-1.368729, -0.8674772, -2.309271, 1, 0.5215687, 0, 1,
-1.367254, 1.806612, 0.3996975, 1, 0.5294118, 0, 1,
-1.363587, 0.8982188, -0.6240095, 1, 0.5333334, 0, 1,
-1.361088, 2.627024, -1.010966, 1, 0.5411765, 0, 1,
-1.360429, -0.4651707, -2.510214, 1, 0.5450981, 0, 1,
-1.359088, -0.7141498, -1.15902, 1, 0.5529412, 0, 1,
-1.351404, -0.8596548, -0.7030482, 1, 0.5568628, 0, 1,
-1.332439, 0.3793452, -0.04900796, 1, 0.5647059, 0, 1,
-1.316589, -2.383715, -2.84169, 1, 0.5686275, 0, 1,
-1.297261, -0.1583721, -1.499717, 1, 0.5764706, 0, 1,
-1.293858, -1.169749, -3.089807, 1, 0.5803922, 0, 1,
-1.290928, -0.0621186, 0.3015674, 1, 0.5882353, 0, 1,
-1.275261, -0.5573881, -1.640436, 1, 0.5921569, 0, 1,
-1.273554, 1.47437, -1.768982, 1, 0.6, 0, 1,
-1.272679, 0.07023213, -1.481187, 1, 0.6078432, 0, 1,
-1.271378, 0.06328268, -1.291389, 1, 0.6117647, 0, 1,
-1.267736, 0.2817985, -2.16654, 1, 0.6196079, 0, 1,
-1.26617, -1.259349, 0.1122901, 1, 0.6235294, 0, 1,
-1.26461, 0.9091851, -0.360055, 1, 0.6313726, 0, 1,
-1.253476, 0.506036, -0.3177988, 1, 0.6352941, 0, 1,
-1.248914, -0.8985178, -1.55569, 1, 0.6431373, 0, 1,
-1.247629, 0.06643411, -1.165642, 1, 0.6470588, 0, 1,
-1.245319, 0.6676226, -2.376784, 1, 0.654902, 0, 1,
-1.242927, 0.2175362, -2.052886, 1, 0.6588235, 0, 1,
-1.231006, 0.2047826, -2.120724, 1, 0.6666667, 0, 1,
-1.227609, 0.3782653, -1.458128, 1, 0.6705883, 0, 1,
-1.225891, 0.4847097, -2.661622, 1, 0.6784314, 0, 1,
-1.224428, -2.529113, -1.912982, 1, 0.682353, 0, 1,
-1.201937, 1.266936, -0.1070373, 1, 0.6901961, 0, 1,
-1.195977, 0.5434009, -0.8009493, 1, 0.6941177, 0, 1,
-1.188844, 1.6783, -1.008305, 1, 0.7019608, 0, 1,
-1.180519, 1.732893, -1.698851, 1, 0.7098039, 0, 1,
-1.176599, 0.1004753, -1.520077, 1, 0.7137255, 0, 1,
-1.166701, 0.7713559, -1.540298, 1, 0.7215686, 0, 1,
-1.157159, 2.138443, -1.660282, 1, 0.7254902, 0, 1,
-1.14519, -0.4075556, -1.676124, 1, 0.7333333, 0, 1,
-1.140131, 0.1948428, -1.225554, 1, 0.7372549, 0, 1,
-1.139934, 1.333784, -2.128715, 1, 0.7450981, 0, 1,
-1.138811, -1.139302, -4.594769, 1, 0.7490196, 0, 1,
-1.12905, 1.01194, 1.155397, 1, 0.7568628, 0, 1,
-1.120688, 0.2322545, -0.762991, 1, 0.7607843, 0, 1,
-1.113435, -2.566799, -3.490076, 1, 0.7686275, 0, 1,
-1.105953, -0.4904014, -0.6523007, 1, 0.772549, 0, 1,
-1.098931, 0.4256534, -0.9344196, 1, 0.7803922, 0, 1,
-1.098827, 0.2231099, -2.096324, 1, 0.7843137, 0, 1,
-1.092265, -0.07454372, -0.9472938, 1, 0.7921569, 0, 1,
-1.088285, 1.228518, 1.170594, 1, 0.7960784, 0, 1,
-1.081385, -1.115224, -1.899503, 1, 0.8039216, 0, 1,
-1.071728, -2.602025, -0.2683975, 1, 0.8117647, 0, 1,
-1.06871, 1.205961, -1.452641, 1, 0.8156863, 0, 1,
-1.067437, -1.968807, -0.8717106, 1, 0.8235294, 0, 1,
-1.06075, 0.9040378, -0.4353278, 1, 0.827451, 0, 1,
-1.057946, -0.5822369, -2.49037, 1, 0.8352941, 0, 1,
-1.056356, 0.4616299, 0.10693, 1, 0.8392157, 0, 1,
-1.052202, 0.742438, 0.1654579, 1, 0.8470588, 0, 1,
-1.04734, -0.1212577, -0.7767315, 1, 0.8509804, 0, 1,
-1.046859, -0.01762236, -0.4305946, 1, 0.8588235, 0, 1,
-1.042759, -0.5487512, -2.922542, 1, 0.8627451, 0, 1,
-1.041628, 1.036952, -1.495712, 1, 0.8705882, 0, 1,
-1.036448, -0.03407789, -3.376339, 1, 0.8745098, 0, 1,
-1.035389, -0.4565671, -2.63814, 1, 0.8823529, 0, 1,
-1.035305, -0.97017, -2.453777, 1, 0.8862745, 0, 1,
-1.035276, 1.040383, -1.994383, 1, 0.8941177, 0, 1,
-1.032033, -1.491213, -1.821991, 1, 0.8980392, 0, 1,
-1.024287, -0.6996762, -1.47243, 1, 0.9058824, 0, 1,
-1.02324, -0.7562236, -1.191777, 1, 0.9137255, 0, 1,
-1.020416, 0.08427018, 0.1181355, 1, 0.9176471, 0, 1,
-1.020111, -0.03912829, -2.378424, 1, 0.9254902, 0, 1,
-1.020064, 0.4100556, -0.8450893, 1, 0.9294118, 0, 1,
-1.019385, 0.1652059, -1.319846, 1, 0.9372549, 0, 1,
-1.016822, 0.03437081, -1.95339, 1, 0.9411765, 0, 1,
-1.014428, -1.849495, -2.185259, 1, 0.9490196, 0, 1,
-1.012971, -0.9799284, -3.227092, 1, 0.9529412, 0, 1,
-1.01008, 0.04301709, -0.8403532, 1, 0.9607843, 0, 1,
-1.005545, 0.3209456, -1.124293, 1, 0.9647059, 0, 1,
-1.004336, 1.459029, 0.9530888, 1, 0.972549, 0, 1,
-1.002266, -1.766055, -3.346546, 1, 0.9764706, 0, 1,
-0.9979753, -0.8214712, -3.524306, 1, 0.9843137, 0, 1,
-0.9967429, 0.5842245, -0.6561291, 1, 0.9882353, 0, 1,
-0.9918627, -0.6317229, -2.219523, 1, 0.9960784, 0, 1,
-0.9879156, -1.835646, -4.395457, 0.9960784, 1, 0, 1,
-0.9845843, 0.2941235, -0.8091152, 0.9921569, 1, 0, 1,
-0.9808912, -1.64757, -0.616806, 0.9843137, 1, 0, 1,
-0.9784806, -0.5789457, -1.273669, 0.9803922, 1, 0, 1,
-0.9745007, -0.2478176, -2.694848, 0.972549, 1, 0, 1,
-0.9724016, 0.4365029, -2.008719, 0.9686275, 1, 0, 1,
-0.9690992, -0.9041897, -1.298077, 0.9607843, 1, 0, 1,
-0.9639822, -0.002550212, -0.5063246, 0.9568627, 1, 0, 1,
-0.9637949, -0.4085597, -0.7181481, 0.9490196, 1, 0, 1,
-0.9637603, 0.6677179, -1.780237, 0.945098, 1, 0, 1,
-0.9621521, 1.097982, -1.045376, 0.9372549, 1, 0, 1,
-0.9571553, -1.630189, -3.143777, 0.9333333, 1, 0, 1,
-0.954478, -0.4886097, -2.549066, 0.9254902, 1, 0, 1,
-0.9529025, 0.6122853, -0.2522811, 0.9215686, 1, 0, 1,
-0.9399109, -0.3409052, -1.043468, 0.9137255, 1, 0, 1,
-0.9375225, 1.548001, 1.119899, 0.9098039, 1, 0, 1,
-0.9274312, 1.053807, -2.085811, 0.9019608, 1, 0, 1,
-0.9241548, -0.6444387, -2.367033, 0.8941177, 1, 0, 1,
-0.9231911, -1.326969, -5.080036, 0.8901961, 1, 0, 1,
-0.9221243, -0.9903462, -2.2074, 0.8823529, 1, 0, 1,
-0.921279, 1.284005, 0.1277594, 0.8784314, 1, 0, 1,
-0.921049, -0.4825546, -2.424127, 0.8705882, 1, 0, 1,
-0.9153473, 0.6738089, -1.984385, 0.8666667, 1, 0, 1,
-0.9145855, -0.3078976, -2.519255, 0.8588235, 1, 0, 1,
-0.9122058, 2.16359, -0.4991221, 0.854902, 1, 0, 1,
-0.9020037, -1.462556, -3.136726, 0.8470588, 1, 0, 1,
-0.9017427, 0.8103424, 1.045187, 0.8431373, 1, 0, 1,
-0.8966467, -1.048127, -2.266552, 0.8352941, 1, 0, 1,
-0.8939753, -0.3694474, -1.724349, 0.8313726, 1, 0, 1,
-0.8924276, 0.3302435, -0.2391857, 0.8235294, 1, 0, 1,
-0.8879405, -1.195416, -4.352998, 0.8196079, 1, 0, 1,
-0.8863613, 1.541842, 0.3832158, 0.8117647, 1, 0, 1,
-0.8823492, 0.1287584, -2.067964, 0.8078431, 1, 0, 1,
-0.8812791, 1.92627, -0.3347197, 0.8, 1, 0, 1,
-0.8803551, -0.2341802, -2.334759, 0.7921569, 1, 0, 1,
-0.8734426, -0.9006237, -2.91598, 0.7882353, 1, 0, 1,
-0.8717981, 2.353595, -0.7775944, 0.7803922, 1, 0, 1,
-0.8691337, 0.8900499, -3.434884, 0.7764706, 1, 0, 1,
-0.8681983, -1.121993, -2.70036, 0.7686275, 1, 0, 1,
-0.8661305, -0.2386201, -1.141906, 0.7647059, 1, 0, 1,
-0.8654175, -0.3614652, -2.333363, 0.7568628, 1, 0, 1,
-0.8635235, -0.01557203, -0.380073, 0.7529412, 1, 0, 1,
-0.8631727, -1.019255, -1.508063, 0.7450981, 1, 0, 1,
-0.8586258, -1.769199, -1.503336, 0.7411765, 1, 0, 1,
-0.857496, -0.1144113, -0.9993696, 0.7333333, 1, 0, 1,
-0.8450548, -0.6720372, -2.289271, 0.7294118, 1, 0, 1,
-0.8443223, -1.094606, -2.228266, 0.7215686, 1, 0, 1,
-0.8429827, 0.6746781, -0.5149292, 0.7176471, 1, 0, 1,
-0.8260316, -1.056761, -4.320943, 0.7098039, 1, 0, 1,
-0.8195775, -0.5541138, -1.97945, 0.7058824, 1, 0, 1,
-0.8075512, -0.5473839, -2.214459, 0.6980392, 1, 0, 1,
-0.8059546, -0.05435231, -1.555102, 0.6901961, 1, 0, 1,
-0.7999837, 0.8877854, 0.5986339, 0.6862745, 1, 0, 1,
-0.7926629, -1.536179, -2.62994, 0.6784314, 1, 0, 1,
-0.7895502, 0.5526437, -1.846428, 0.6745098, 1, 0, 1,
-0.78934, -0.9933838, -2.751981, 0.6666667, 1, 0, 1,
-0.78548, -0.06440669, -3.113259, 0.6627451, 1, 0, 1,
-0.7844983, 0.3989635, -2.356709, 0.654902, 1, 0, 1,
-0.7757713, -0.1948004, -2.254479, 0.6509804, 1, 0, 1,
-0.7744894, -1.091587, -2.359344, 0.6431373, 1, 0, 1,
-0.7700278, -0.4371317, -2.410632, 0.6392157, 1, 0, 1,
-0.7670966, 1.318207, -3.085971, 0.6313726, 1, 0, 1,
-0.7667401, 0.1006929, -1.38493, 0.627451, 1, 0, 1,
-0.7643249, 1.948333, -1.128567, 0.6196079, 1, 0, 1,
-0.7637759, 1.202128, -0.3840134, 0.6156863, 1, 0, 1,
-0.7602288, 0.1623278, -0.7804552, 0.6078432, 1, 0, 1,
-0.7597102, 0.7369381, -0.1223886, 0.6039216, 1, 0, 1,
-0.7552643, -0.7242952, -3.51253, 0.5960785, 1, 0, 1,
-0.753966, -0.2221389, -2.217089, 0.5882353, 1, 0, 1,
-0.7522377, 0.3839961, -0.8158687, 0.5843138, 1, 0, 1,
-0.7470174, -1.427738, -0.781762, 0.5764706, 1, 0, 1,
-0.7450442, 0.9192187, -0.7643839, 0.572549, 1, 0, 1,
-0.7436963, 0.6813692, -0.1146818, 0.5647059, 1, 0, 1,
-0.7416557, 0.2041642, -1.784416, 0.5607843, 1, 0, 1,
-0.7366465, 1.858109, -0.5483644, 0.5529412, 1, 0, 1,
-0.7340314, 0.8221518, 0.3385521, 0.5490196, 1, 0, 1,
-0.7321242, 0.2831689, -1.191962, 0.5411765, 1, 0, 1,
-0.7301893, 0.9442243, -2.304379, 0.5372549, 1, 0, 1,
-0.7292144, 1.041461, -1.832797, 0.5294118, 1, 0, 1,
-0.7289844, -0.511314, 0.1261288, 0.5254902, 1, 0, 1,
-0.7233884, 1.227802, -0.2841825, 0.5176471, 1, 0, 1,
-0.7227647, 0.9727212, 0.221687, 0.5137255, 1, 0, 1,
-0.7224872, -0.8719758, -2.863765, 0.5058824, 1, 0, 1,
-0.7184725, 0.9340581, -0.2114636, 0.5019608, 1, 0, 1,
-0.7167348, 0.2736137, 1.279901, 0.4941176, 1, 0, 1,
-0.7166024, -0.7481983, -2.870734, 0.4862745, 1, 0, 1,
-0.7135538, -1.686026, -2.421595, 0.4823529, 1, 0, 1,
-0.7121221, -0.1502819, -3.381055, 0.4745098, 1, 0, 1,
-0.7107333, -0.7132195, -2.262961, 0.4705882, 1, 0, 1,
-0.7030695, -0.5410112, -2.619123, 0.4627451, 1, 0, 1,
-0.6996342, -1.413837, -2.228858, 0.4588235, 1, 0, 1,
-0.6975952, -0.9282852, -2.542311, 0.4509804, 1, 0, 1,
-0.6964215, 1.076954, -0.1432208, 0.4470588, 1, 0, 1,
-0.6942596, 0.4927574, -1.507458, 0.4392157, 1, 0, 1,
-0.6934475, 1.330597, -0.608665, 0.4352941, 1, 0, 1,
-0.6867083, -0.6030351, -4.727106, 0.427451, 1, 0, 1,
-0.685809, -0.4638105, -2.266612, 0.4235294, 1, 0, 1,
-0.6837348, 0.4376643, -0.1152966, 0.4156863, 1, 0, 1,
-0.6812208, -0.4864413, -2.566545, 0.4117647, 1, 0, 1,
-0.6780302, -0.5171728, -1.202237, 0.4039216, 1, 0, 1,
-0.6694055, 0.174201, -0.3177212, 0.3960784, 1, 0, 1,
-0.6686893, -2.302794, -2.388028, 0.3921569, 1, 0, 1,
-0.6572263, -0.4334173, -1.733715, 0.3843137, 1, 0, 1,
-0.6546773, 1.016813, 0.5456195, 0.3803922, 1, 0, 1,
-0.6533393, 2.750348, -1.08055, 0.372549, 1, 0, 1,
-0.6502053, -0.7701425, -4.499919, 0.3686275, 1, 0, 1,
-0.6457769, -1.17307, -3.420424, 0.3607843, 1, 0, 1,
-0.6436711, 0.7126616, 0.4068245, 0.3568628, 1, 0, 1,
-0.643618, 2.782729, 0.6312079, 0.3490196, 1, 0, 1,
-0.6394517, -1.361889, -3.911669, 0.345098, 1, 0, 1,
-0.6392448, 0.3761944, -0.04673112, 0.3372549, 1, 0, 1,
-0.6372008, -0.1218594, -0.4092712, 0.3333333, 1, 0, 1,
-0.6369912, 1.311632, -1.16694, 0.3254902, 1, 0, 1,
-0.6333013, -1.01341, -2.07466, 0.3215686, 1, 0, 1,
-0.6310378, -0.09440427, -3.23313, 0.3137255, 1, 0, 1,
-0.6291971, -0.06524255, -1.425186, 0.3098039, 1, 0, 1,
-0.6282793, -0.05658388, -1.564448, 0.3019608, 1, 0, 1,
-0.6191487, -0.9670607, -1.133508, 0.2941177, 1, 0, 1,
-0.6176419, 0.6891038, 0.02256118, 0.2901961, 1, 0, 1,
-0.6139722, 0.9097829, -1.379268, 0.282353, 1, 0, 1,
-0.6131873, -2.324085, -4.576589, 0.2784314, 1, 0, 1,
-0.6096896, 0.08991411, -1.505851, 0.2705882, 1, 0, 1,
-0.6049491, -0.1733326, -1.490932, 0.2666667, 1, 0, 1,
-0.6035029, -0.2656679, -0.3939161, 0.2588235, 1, 0, 1,
-0.5972984, -1.04024, -2.133556, 0.254902, 1, 0, 1,
-0.5952489, 0.2406568, -3.193737, 0.2470588, 1, 0, 1,
-0.5892164, -1.160809, -4.011211, 0.2431373, 1, 0, 1,
-0.589193, 2.307741, -0.9028008, 0.2352941, 1, 0, 1,
-0.58696, 0.1991073, -2.631044, 0.2313726, 1, 0, 1,
-0.5867361, -0.1533236, -2.965009, 0.2235294, 1, 0, 1,
-0.5853008, 0.8264262, -0.174981, 0.2196078, 1, 0, 1,
-0.5847917, -0.001250218, -1.633385, 0.2117647, 1, 0, 1,
-0.5821457, 0.223874, -1.147886, 0.2078431, 1, 0, 1,
-0.5788653, 0.4478343, 0.8426392, 0.2, 1, 0, 1,
-0.5774937, -0.6293278, -2.753688, 0.1921569, 1, 0, 1,
-0.5650613, 1.059869, -0.8431499, 0.1882353, 1, 0, 1,
-0.5634091, 0.5663345, -0.5991385, 0.1803922, 1, 0, 1,
-0.5625718, -2.876904, -3.331826, 0.1764706, 1, 0, 1,
-0.5593336, -0.302853, -3.136353, 0.1686275, 1, 0, 1,
-0.5469129, 0.008475286, -2.77359, 0.1647059, 1, 0, 1,
-0.546667, 1.372595, -0.5588052, 0.1568628, 1, 0, 1,
-0.5439152, -1.757759, -2.907355, 0.1529412, 1, 0, 1,
-0.5420256, -0.2696524, -2.450207, 0.145098, 1, 0, 1,
-0.5357705, 1.513829, -0.1365512, 0.1411765, 1, 0, 1,
-0.5342928, 0.6135727, 0.1234812, 0.1333333, 1, 0, 1,
-0.5331126, 0.7754672, 0.4291412, 0.1294118, 1, 0, 1,
-0.5292886, -0.4816216, -1.776345, 0.1215686, 1, 0, 1,
-0.5292515, -0.4564004, -1.06781, 0.1176471, 1, 0, 1,
-0.5291538, 0.4347997, -2.223888, 0.1098039, 1, 0, 1,
-0.5279041, 0.5797557, -0.8902525, 0.1058824, 1, 0, 1,
-0.5226315, -0.2132944, -3.045857, 0.09803922, 1, 0, 1,
-0.5224704, 0.682057, -1.108627, 0.09019608, 1, 0, 1,
-0.5217313, -1.385544, -1.530222, 0.08627451, 1, 0, 1,
-0.5214077, -0.5955575, -1.903519, 0.07843138, 1, 0, 1,
-0.5182238, 0.2938202, -1.652516, 0.07450981, 1, 0, 1,
-0.5179524, -0.4495903, -1.204765, 0.06666667, 1, 0, 1,
-0.5173944, 0.07758486, 0.09901329, 0.0627451, 1, 0, 1,
-0.5170459, 0.1481577, 0.402818, 0.05490196, 1, 0, 1,
-0.5168837, -1.148552, -3.313766, 0.05098039, 1, 0, 1,
-0.5154838, -1.784355, -2.944998, 0.04313726, 1, 0, 1,
-0.5150313, -1.648506, -1.679107, 0.03921569, 1, 0, 1,
-0.5113035, 0.6730266, -1.84661, 0.03137255, 1, 0, 1,
-0.5105432, 2.614248, 0.582575, 0.02745098, 1, 0, 1,
-0.5096523, -1.277546, -2.700042, 0.01960784, 1, 0, 1,
-0.5066315, 0.1290534, 0.3599152, 0.01568628, 1, 0, 1,
-0.5060593, 0.2050913, -0.8610287, 0.007843138, 1, 0, 1,
-0.5053284, 1.737049, -0.3987619, 0.003921569, 1, 0, 1,
-0.5043042, 0.2062247, -0.8235738, 0, 1, 0.003921569, 1,
-0.4990473, -1.019406, -3.468585, 0, 1, 0.01176471, 1,
-0.4952615, -0.2808081, -1.989178, 0, 1, 0.01568628, 1,
-0.492087, -1.080733, -3.395581, 0, 1, 0.02352941, 1,
-0.4878965, -0.9596319, -2.513109, 0, 1, 0.02745098, 1,
-0.4864746, 1.285308, -0.2532555, 0, 1, 0.03529412, 1,
-0.4861391, -0.1726647, -0.4531839, 0, 1, 0.03921569, 1,
-0.4852275, 0.0666941, -1.019258, 0, 1, 0.04705882, 1,
-0.4837521, 0.6099012, -2.228983, 0, 1, 0.05098039, 1,
-0.4810766, -0.1157092, -1.756884, 0, 1, 0.05882353, 1,
-0.4808724, 0.5727646, -1.127477, 0, 1, 0.0627451, 1,
-0.4808007, 0.9891638, -0.8761281, 0, 1, 0.07058824, 1,
-0.4772673, -1.047514, -2.38904, 0, 1, 0.07450981, 1,
-0.4769807, 0.1438777, -0.9285335, 0, 1, 0.08235294, 1,
-0.4689725, -1.342064, -5.20173, 0, 1, 0.08627451, 1,
-0.4634976, 0.2099637, -1.812051, 0, 1, 0.09411765, 1,
-0.4608658, 1.262481, -0.9748126, 0, 1, 0.1019608, 1,
-0.4551774, -0.5725297, -4.146478, 0, 1, 0.1058824, 1,
-0.4498688, -2.207601, -3.274173, 0, 1, 0.1137255, 1,
-0.4496345, 0.4369165, -2.11276, 0, 1, 0.1176471, 1,
-0.4491507, 1.475079, -0.215847, 0, 1, 0.1254902, 1,
-0.4460015, 0.001774076, -0.8956929, 0, 1, 0.1294118, 1,
-0.4455454, -0.6507066, -1.564013, 0, 1, 0.1372549, 1,
-0.4451623, 0.2373932, 0.9576358, 0, 1, 0.1411765, 1,
-0.4419403, 0.6518158, -0.8778903, 0, 1, 0.1490196, 1,
-0.4384863, 0.06600588, -0.494458, 0, 1, 0.1529412, 1,
-0.4375127, 0.3672118, -1.905739, 0, 1, 0.1607843, 1,
-0.4362427, 0.3899062, 0.9999578, 0, 1, 0.1647059, 1,
-0.4362169, 0.3576621, -2.275511, 0, 1, 0.172549, 1,
-0.4288477, 2.779568, 1.151974, 0, 1, 0.1764706, 1,
-0.4273577, 0.6891816, -1.271872, 0, 1, 0.1843137, 1,
-0.4236453, -0.07642503, -0.8232296, 0, 1, 0.1882353, 1,
-0.423203, 1.165145, 0.6380485, 0, 1, 0.1960784, 1,
-0.4208201, -0.5251757, -2.019717, 0, 1, 0.2039216, 1,
-0.4177139, 0.9944071, 0.9266153, 0, 1, 0.2078431, 1,
-0.4173577, -0.403261, -2.047568, 0, 1, 0.2156863, 1,
-0.4127521, 0.06351966, -2.927108, 0, 1, 0.2196078, 1,
-0.4066532, 0.3314402, 0.7971681, 0, 1, 0.227451, 1,
-0.4059647, -0.4096618, -2.404129, 0, 1, 0.2313726, 1,
-0.4031666, 0.5477505, -0.6968136, 0, 1, 0.2392157, 1,
-0.4024613, -1.293191, -4.793347, 0, 1, 0.2431373, 1,
-0.4002221, 0.7902933, 2.327242, 0, 1, 0.2509804, 1,
-0.3959271, 0.2927527, -1.39856, 0, 1, 0.254902, 1,
-0.3954357, -0.119525, -3.125918, 0, 1, 0.2627451, 1,
-0.3906547, 3.029759, -1.959713, 0, 1, 0.2666667, 1,
-0.3898677, -2.104235, -4.554183, 0, 1, 0.2745098, 1,
-0.3893021, -0.3961635, -2.777975, 0, 1, 0.2784314, 1,
-0.3847465, 1.056053, -1.012659, 0, 1, 0.2862745, 1,
-0.3842088, -0.298892, -1.680876, 0, 1, 0.2901961, 1,
-0.3838709, -1.376963, -2.744816, 0, 1, 0.2980392, 1,
-0.3824013, 2.068261, 0.8577304, 0, 1, 0.3058824, 1,
-0.3820529, -0.3731062, -3.758205, 0, 1, 0.3098039, 1,
-0.3708878, -0.01513329, -2.190159, 0, 1, 0.3176471, 1,
-0.3659864, 1.201015, 1.782059, 0, 1, 0.3215686, 1,
-0.348455, -0.8469455, -2.274457, 0, 1, 0.3294118, 1,
-0.3416824, -2.761871, -3.711611, 0, 1, 0.3333333, 1,
-0.3402205, -0.8142197, -4.179375, 0, 1, 0.3411765, 1,
-0.336719, 0.07164277, -0.2562053, 0, 1, 0.345098, 1,
-0.3234424, -0.9246387, -2.673841, 0, 1, 0.3529412, 1,
-0.3188704, 2.5233, 0.2512141, 0, 1, 0.3568628, 1,
-0.3180415, -0.4226826, -2.810512, 0, 1, 0.3647059, 1,
-0.3171791, -0.8538595, -3.447475, 0, 1, 0.3686275, 1,
-0.3152642, 1.287516, -1.469629, 0, 1, 0.3764706, 1,
-0.3143025, -0.431942, -2.574815, 0, 1, 0.3803922, 1,
-0.3130629, -0.6523249, -3.751889, 0, 1, 0.3882353, 1,
-0.3095469, 0.2379854, -1.761304, 0, 1, 0.3921569, 1,
-0.3046225, -3.398267, -3.051067, 0, 1, 0.4, 1,
-0.3032402, 0.339145, 0.2206622, 0, 1, 0.4078431, 1,
-0.299992, 0.4815941, 0.03447746, 0, 1, 0.4117647, 1,
-0.2965199, -0.2160911, -1.246225, 0, 1, 0.4196078, 1,
-0.2950163, -0.5487306, -1.648723, 0, 1, 0.4235294, 1,
-0.2900862, 1.147251, 0.4306491, 0, 1, 0.4313726, 1,
-0.2855165, -0.5090916, -2.184642, 0, 1, 0.4352941, 1,
-0.2852491, 1.171424, -0.6498678, 0, 1, 0.4431373, 1,
-0.279236, 1.146479, 0.1787615, 0, 1, 0.4470588, 1,
-0.2779413, 0.1550003, -1.976709, 0, 1, 0.454902, 1,
-0.2744626, -0.06665269, -3.152292, 0, 1, 0.4588235, 1,
-0.2742248, 0.1336327, -2.460786, 0, 1, 0.4666667, 1,
-0.2710085, -0.1972867, -0.4715277, 0, 1, 0.4705882, 1,
-0.2695752, -1.011262, -3.965345, 0, 1, 0.4784314, 1,
-0.2678645, 0.8717715, -1.055064, 0, 1, 0.4823529, 1,
-0.2593315, -0.5239704, -1.649505, 0, 1, 0.4901961, 1,
-0.258422, 0.7407278, -0.9070105, 0, 1, 0.4941176, 1,
-0.2565562, 0.347933, -1.639839, 0, 1, 0.5019608, 1,
-0.2546514, -0.6407993, -2.917663, 0, 1, 0.509804, 1,
-0.2539549, 0.7757856, -0.1004273, 0, 1, 0.5137255, 1,
-0.2513236, 0.2503591, -1.768087, 0, 1, 0.5215687, 1,
-0.2501502, 0.4808482, -0.1889722, 0, 1, 0.5254902, 1,
-0.243355, -0.8071619, -2.988201, 0, 1, 0.5333334, 1,
-0.2432725, 0.2278356, -2.422542, 0, 1, 0.5372549, 1,
-0.2411151, -0.2440317, -2.122346, 0, 1, 0.5450981, 1,
-0.2392997, 0.6463601, -1.451911, 0, 1, 0.5490196, 1,
-0.2272378, -0.3675705, -2.974257, 0, 1, 0.5568628, 1,
-0.2230185, 0.01790753, -0.9457627, 0, 1, 0.5607843, 1,
-0.2216967, 0.7739227, -0.8845891, 0, 1, 0.5686275, 1,
-0.2209269, -2.745196, -2.333126, 0, 1, 0.572549, 1,
-0.2158428, -0.0624158, -2.65062, 0, 1, 0.5803922, 1,
-0.2042198, -0.2485827, -3.347043, 0, 1, 0.5843138, 1,
-0.2013253, -0.1418093, -3.823258, 0, 1, 0.5921569, 1,
-0.1992736, 0.1881449, -2.574754, 0, 1, 0.5960785, 1,
-0.1951182, 0.941631, 0.783545, 0, 1, 0.6039216, 1,
-0.1948918, 1.299752, 0.4741684, 0, 1, 0.6117647, 1,
-0.194626, 0.4428479, -0.06721739, 0, 1, 0.6156863, 1,
-0.1918341, -1.9973, -1.949516, 0, 1, 0.6235294, 1,
-0.1878377, 2.135726, -1.381778, 0, 1, 0.627451, 1,
-0.1871784, -1.176821, -4.32549, 0, 1, 0.6352941, 1,
-0.1809946, -0.8386223, -2.305241, 0, 1, 0.6392157, 1,
-0.1780275, 0.5532776, 1.429974, 0, 1, 0.6470588, 1,
-0.1778116, 0.5334143, 0.09906357, 0, 1, 0.6509804, 1,
-0.1775472, -1.086906, -1.089803, 0, 1, 0.6588235, 1,
-0.1692286, 0.2515724, -1.024524, 0, 1, 0.6627451, 1,
-0.1650328, 0.5123276, 0.5592006, 0, 1, 0.6705883, 1,
-0.1626856, -0.1312556, -1.877327, 0, 1, 0.6745098, 1,
-0.1626192, 1.454279, 0.7346358, 0, 1, 0.682353, 1,
-0.1488525, 0.9200377, -0.806843, 0, 1, 0.6862745, 1,
-0.1482431, -0.7825781, -4.326251, 0, 1, 0.6941177, 1,
-0.1349805, -0.5374011, -2.228835, 0, 1, 0.7019608, 1,
-0.1347201, -1.603546, -1.157022, 0, 1, 0.7058824, 1,
-0.1327327, 1.251535, 1.291451, 0, 1, 0.7137255, 1,
-0.1309809, 0.08584202, -0.6074845, 0, 1, 0.7176471, 1,
-0.130662, 0.1147054, -1.075835, 0, 1, 0.7254902, 1,
-0.130651, 0.5042987, 0.82265, 0, 1, 0.7294118, 1,
-0.1266014, -0.8262062, -1.546043, 0, 1, 0.7372549, 1,
-0.1262539, -0.9523457, -1.942672, 0, 1, 0.7411765, 1,
-0.1259602, 0.3391845, -1.000165, 0, 1, 0.7490196, 1,
-0.1241363, 0.04490642, -1.218797, 0, 1, 0.7529412, 1,
-0.1233586, -0.4070106, -2.653088, 0, 1, 0.7607843, 1,
-0.1227175, 0.397791, -0.9764702, 0, 1, 0.7647059, 1,
-0.122396, 0.7329025, 0.9788607, 0, 1, 0.772549, 1,
-0.1218287, -0.8041676, -2.235282, 0, 1, 0.7764706, 1,
-0.1168961, -1.146158, -2.01853, 0, 1, 0.7843137, 1,
-0.1139875, 0.7675959, 0.2972176, 0, 1, 0.7882353, 1,
-0.1134574, -0.8569185, -3.382776, 0, 1, 0.7960784, 1,
-0.1099003, 1.059154, -2.013201, 0, 1, 0.8039216, 1,
-0.1092395, 0.48951, -3.318249, 0, 1, 0.8078431, 1,
-0.106834, -0.4191849, -2.750823, 0, 1, 0.8156863, 1,
-0.1032544, 0.2803055, -1.565917, 0, 1, 0.8196079, 1,
-0.1019972, -0.9491892, -1.756918, 0, 1, 0.827451, 1,
-0.09927853, -0.6523666, -4.206022, 0, 1, 0.8313726, 1,
-0.09291609, 0.5787669, 1.086455, 0, 1, 0.8392157, 1,
-0.09178148, 0.5004751, -1.998624, 0, 1, 0.8431373, 1,
-0.08964683, -0.8251182, -2.283271, 0, 1, 0.8509804, 1,
-0.08394845, -1.373631, -1.505549, 0, 1, 0.854902, 1,
-0.08202007, -0.6068345, -1.883526, 0, 1, 0.8627451, 1,
-0.08066621, -0.8613493, -1.883775, 0, 1, 0.8666667, 1,
-0.0769093, 2.940237, -1.99543, 0, 1, 0.8745098, 1,
-0.07175847, 0.7517117, 0.2866308, 0, 1, 0.8784314, 1,
-0.06925336, 1.422862, -0.2218791, 0, 1, 0.8862745, 1,
-0.05689991, 1.644582, 0.1786677, 0, 1, 0.8901961, 1,
-0.04913257, 0.4627279, -0.1191151, 0, 1, 0.8980392, 1,
-0.04849014, -0.7517409, -1.640857, 0, 1, 0.9058824, 1,
-0.0380819, -0.0440182, -2.164357, 0, 1, 0.9098039, 1,
-0.03658744, -0.2074386, -2.34969, 0, 1, 0.9176471, 1,
-0.03637749, -1.502501, -2.943355, 0, 1, 0.9215686, 1,
-0.03169445, -0.4249727, -2.559979, 0, 1, 0.9294118, 1,
-0.03013376, -1.649816, -3.590761, 0, 1, 0.9333333, 1,
-0.03011995, -0.1030246, -2.529222, 0, 1, 0.9411765, 1,
-0.02698576, 0.8281663, 0.2751361, 0, 1, 0.945098, 1,
-0.023389, 2.049036, -0.4771177, 0, 1, 0.9529412, 1,
-0.02158049, -0.9068261, -4.636089, 0, 1, 0.9568627, 1,
-0.01901446, -0.9436521, -2.811495, 0, 1, 0.9647059, 1,
-0.01748739, -1.456705, -2.771496, 0, 1, 0.9686275, 1,
-0.0154108, 0.1224314, -1.484235, 0, 1, 0.9764706, 1,
-0.01430135, 0.2120652, -1.983214, 0, 1, 0.9803922, 1,
-0.01366449, 0.2888352, -0.7772926, 0, 1, 0.9882353, 1,
-0.01021019, -0.1021724, -4.00355, 0, 1, 0.9921569, 1,
-0.01000861, -0.07942925, -2.637383, 0, 1, 1, 1,
-0.00998427, 0.5472528, 0.6135539, 0, 0.9921569, 1, 1,
-0.002765181, -1.560785, -3.444146, 0, 0.9882353, 1, 1,
-0.001230053, -0.5154339, -4.695855, 0, 0.9803922, 1, 1,
-0.0006839222, -1.139391, -3.451116, 0, 0.9764706, 1, 1,
-0.0002505879, -0.005053903, -3.758229, 0, 0.9686275, 1, 1,
0.0003750536, -0.3770871, 2.81215, 0, 0.9647059, 1, 1,
0.001183291, 1.632793, 0.877705, 0, 0.9568627, 1, 1,
0.001429313, 0.6688911, -0.5152359, 0, 0.9529412, 1, 1,
0.006819288, -0.583029, 2.729953, 0, 0.945098, 1, 1,
0.01052762, -0.9863861, 3.351362, 0, 0.9411765, 1, 1,
0.01184998, -1.203939, 3.827233, 0, 0.9333333, 1, 1,
0.01253464, 1.49753, -1.518166, 0, 0.9294118, 1, 1,
0.01428886, 2.123578, -0.9419912, 0, 0.9215686, 1, 1,
0.01431144, 0.664862, 0.05057941, 0, 0.9176471, 1, 1,
0.01590978, -0.9839873, 3.674024, 0, 0.9098039, 1, 1,
0.01900813, -0.1729253, 1.786964, 0, 0.9058824, 1, 1,
0.02174691, -1.568378, 4.242163, 0, 0.8980392, 1, 1,
0.02621598, 1.373768, -2.607407, 0, 0.8901961, 1, 1,
0.02760807, -0.2714804, 4.729267, 0, 0.8862745, 1, 1,
0.02963787, -1.513654, 1.732273, 0, 0.8784314, 1, 1,
0.03229988, -0.420793, 1.791199, 0, 0.8745098, 1, 1,
0.03319989, 0.5403159, 0.9557266, 0, 0.8666667, 1, 1,
0.03565278, 0.3644826, -2.456534, 0, 0.8627451, 1, 1,
0.03689626, -1.204695, 3.950466, 0, 0.854902, 1, 1,
0.03727705, 0.3525437, -1.170932, 0, 0.8509804, 1, 1,
0.03887355, 0.7383875, -0.8333465, 0, 0.8431373, 1, 1,
0.03904133, -0.4783236, 3.118482, 0, 0.8392157, 1, 1,
0.03936125, 2.382141, 0.3716106, 0, 0.8313726, 1, 1,
0.0399231, 0.3472046, -0.5457936, 0, 0.827451, 1, 1,
0.04159421, 1.566706, -0.1666206, 0, 0.8196079, 1, 1,
0.04472353, 0.7036082, -0.27915, 0, 0.8156863, 1, 1,
0.04657063, 0.4147923, 0.7890761, 0, 0.8078431, 1, 1,
0.0487835, -1.047343, 3.587329, 0, 0.8039216, 1, 1,
0.0507369, -0.4130397, 3.207745, 0, 0.7960784, 1, 1,
0.05129327, -0.8386981, 3.420865, 0, 0.7882353, 1, 1,
0.05196421, -0.6698749, 2.989434, 0, 0.7843137, 1, 1,
0.05370048, 0.4890687, 0.4209906, 0, 0.7764706, 1, 1,
0.05772182, -0.4340385, 4.143163, 0, 0.772549, 1, 1,
0.06213802, -2.241195, 2.341066, 0, 0.7647059, 1, 1,
0.06379859, 0.7736073, 0.236959, 0, 0.7607843, 1, 1,
0.06838799, 1.586638, 1.613136, 0, 0.7529412, 1, 1,
0.06998051, 0.1883849, 1.115707, 0, 0.7490196, 1, 1,
0.07294074, 0.3131136, 0.3046008, 0, 0.7411765, 1, 1,
0.07405942, 0.3860838, 1.971394, 0, 0.7372549, 1, 1,
0.07527394, 0.4823186, 0.7957937, 0, 0.7294118, 1, 1,
0.07561198, 1.465791, 2.654098, 0, 0.7254902, 1, 1,
0.08189396, -0.6730906, 1.845305, 0, 0.7176471, 1, 1,
0.08274546, -0.1508504, 2.520613, 0, 0.7137255, 1, 1,
0.0842528, -2.273768, 4.325145, 0, 0.7058824, 1, 1,
0.09263759, -0.8323021, 3.189549, 0, 0.6980392, 1, 1,
0.09628197, 0.9929402, 0.8974714, 0, 0.6941177, 1, 1,
0.09812108, 0.5990813, -0.5297849, 0, 0.6862745, 1, 1,
0.1025093, -1.614732, 2.350268, 0, 0.682353, 1, 1,
0.1044245, -0.3703098, 3.458063, 0, 0.6745098, 1, 1,
0.1045309, -0.9196818, 3.51659, 0, 0.6705883, 1, 1,
0.1052075, -0.5217423, 1.031868, 0, 0.6627451, 1, 1,
0.1063893, 1.994994, 0.2012261, 0, 0.6588235, 1, 1,
0.1164462, -0.8439869, 1.299057, 0, 0.6509804, 1, 1,
0.1185494, 0.7414782, 1.161303, 0, 0.6470588, 1, 1,
0.1239667, 0.2563991, 1.347969, 0, 0.6392157, 1, 1,
0.1283015, 0.5264781, 0.4318374, 0, 0.6352941, 1, 1,
0.130431, 0.07047631, 0.7664328, 0, 0.627451, 1, 1,
0.1338635, 1.17469, -0.03440685, 0, 0.6235294, 1, 1,
0.1358581, -0.6947694, 0.7705181, 0, 0.6156863, 1, 1,
0.1359016, -0.8264587, 2.825301, 0, 0.6117647, 1, 1,
0.1361226, 1.03089, 2.354773, 0, 0.6039216, 1, 1,
0.1365232, -0.09984417, 1.710627, 0, 0.5960785, 1, 1,
0.1374312, 0.1119101, 0.5920032, 0, 0.5921569, 1, 1,
0.1427722, -0.7770088, 4.196778, 0, 0.5843138, 1, 1,
0.1431055, -0.5122377, 3.367709, 0, 0.5803922, 1, 1,
0.1455142, 0.583624, -1.036376, 0, 0.572549, 1, 1,
0.1460558, -0.7717146, 1.762153, 0, 0.5686275, 1, 1,
0.146368, 0.1093359, 0.952828, 0, 0.5607843, 1, 1,
0.1506172, -0.178612, 2.242723, 0, 0.5568628, 1, 1,
0.1509697, -0.4032321, 2.417834, 0, 0.5490196, 1, 1,
0.1524918, 1.394644, -0.3671544, 0, 0.5450981, 1, 1,
0.1545591, 0.2293415, 1.211202, 0, 0.5372549, 1, 1,
0.1549764, -0.5894415, 2.053064, 0, 0.5333334, 1, 1,
0.1561359, 0.07864553, 0.9447478, 0, 0.5254902, 1, 1,
0.1622209, -0.1609152, 3.249068, 0, 0.5215687, 1, 1,
0.1695046, 0.05767154, 2.341558, 0, 0.5137255, 1, 1,
0.172316, -0.5769234, 2.094741, 0, 0.509804, 1, 1,
0.1737471, -0.350373, 4.359927, 0, 0.5019608, 1, 1,
0.176837, 0.02969624, 0.004923836, 0, 0.4941176, 1, 1,
0.1776902, 1.358088, -0.1245723, 0, 0.4901961, 1, 1,
0.182691, -0.8236113, 3.654841, 0, 0.4823529, 1, 1,
0.1942067, -0.318255, 3.273856, 0, 0.4784314, 1, 1,
0.1998334, 0.1583708, -0.4807277, 0, 0.4705882, 1, 1,
0.2066504, -1.205339, 4.15554, 0, 0.4666667, 1, 1,
0.2147543, 0.732282, -0.5607548, 0, 0.4588235, 1, 1,
0.2189229, -1.11513, 3.884955, 0, 0.454902, 1, 1,
0.2204124, -2.577832, 2.503145, 0, 0.4470588, 1, 1,
0.2216431, -3.439338, 5.160403, 0, 0.4431373, 1, 1,
0.2222229, 1.586893, 0.6976001, 0, 0.4352941, 1, 1,
0.2241172, -1.241808, 3.490254, 0, 0.4313726, 1, 1,
0.2264301, -0.1166807, 0.6504038, 0, 0.4235294, 1, 1,
0.2264591, 1.338473, -0.1924757, 0, 0.4196078, 1, 1,
0.2320136, -0.2047421, 0.5164351, 0, 0.4117647, 1, 1,
0.2334834, 0.8110688, 0.0005006504, 0, 0.4078431, 1, 1,
0.2397823, -0.9775621, 5.11526, 0, 0.4, 1, 1,
0.2430621, 0.1982793, 1.475567, 0, 0.3921569, 1, 1,
0.2452111, 0.547712, 0.7478587, 0, 0.3882353, 1, 1,
0.248516, -0.2836074, 1.658751, 0, 0.3803922, 1, 1,
0.2514267, -1.705717, 2.703793, 0, 0.3764706, 1, 1,
0.2523423, -0.4895208, 3.757021, 0, 0.3686275, 1, 1,
0.2533405, 0.3964983, 0.5107327, 0, 0.3647059, 1, 1,
0.2576799, -1.315907, 1.922261, 0, 0.3568628, 1, 1,
0.2588534, -0.002969399, 0.8467754, 0, 0.3529412, 1, 1,
0.2613271, 1.640578, 0.04475315, 0, 0.345098, 1, 1,
0.2615442, 0.1273479, 1.951725, 0, 0.3411765, 1, 1,
0.2647089, 1.472276, 0.8046511, 0, 0.3333333, 1, 1,
0.2687505, -1.670159, 1.838976, 0, 0.3294118, 1, 1,
0.2704867, -2.134931, 5.078529, 0, 0.3215686, 1, 1,
0.2721117, -0.2846787, 3.357656, 0, 0.3176471, 1, 1,
0.2804047, 0.9043702, -0.6525738, 0, 0.3098039, 1, 1,
0.288136, 0.1181437, 0.7755064, 0, 0.3058824, 1, 1,
0.2881564, -0.2787152, 3.183154, 0, 0.2980392, 1, 1,
0.2896536, 0.4846345, 1.542351, 0, 0.2901961, 1, 1,
0.3012686, 2.115577, -0.3068978, 0, 0.2862745, 1, 1,
0.3023599, -1.09841, 1.582582, 0, 0.2784314, 1, 1,
0.30408, -1.001388, 1.975452, 0, 0.2745098, 1, 1,
0.3048311, 0.0975334, 0.08684644, 0, 0.2666667, 1, 1,
0.3089863, 0.5929929, 1.540312, 0, 0.2627451, 1, 1,
0.3119249, -0.1471555, 1.991567, 0, 0.254902, 1, 1,
0.3211891, -1.086514, 2.244691, 0, 0.2509804, 1, 1,
0.3233561, 0.2039254, -0.7609499, 0, 0.2431373, 1, 1,
0.3246447, -0.7968495, 3.722095, 0, 0.2392157, 1, 1,
0.3270282, -0.2008201, 3.476498, 0, 0.2313726, 1, 1,
0.3289502, -1.37761, 4.457609, 0, 0.227451, 1, 1,
0.331509, -0.2873845, 0.6305631, 0, 0.2196078, 1, 1,
0.3319719, -0.9660039, 3.166185, 0, 0.2156863, 1, 1,
0.3346149, -0.119811, 2.899491, 0, 0.2078431, 1, 1,
0.3356734, 0.6731172, 1.317501, 0, 0.2039216, 1, 1,
0.3414162, 0.6802534, 1.920129, 0, 0.1960784, 1, 1,
0.3469421, 0.8034325, -2.302763, 0, 0.1882353, 1, 1,
0.3494995, -0.9142483, 2.493197, 0, 0.1843137, 1, 1,
0.367665, 0.235554, 2.54905, 0, 0.1764706, 1, 1,
0.3700884, -1.435549, 2.144797, 0, 0.172549, 1, 1,
0.3706698, -1.108411, 3.283234, 0, 0.1647059, 1, 1,
0.3810865, -0.6318226, 3.163527, 0, 0.1607843, 1, 1,
0.3845749, -0.8999828, 1.814761, 0, 0.1529412, 1, 1,
0.3930184, 1.496498, 0.4961798, 0, 0.1490196, 1, 1,
0.3944774, 0.9846143, -2.187121, 0, 0.1411765, 1, 1,
0.3999386, 0.1757971, 2.398949, 0, 0.1372549, 1, 1,
0.4067574, -0.536215, 0.7294727, 0, 0.1294118, 1, 1,
0.406857, 0.168101, -0.5378677, 0, 0.1254902, 1, 1,
0.4103537, 0.06580745, 1.64266, 0, 0.1176471, 1, 1,
0.4128928, -0.01851857, 0.8598212, 0, 0.1137255, 1, 1,
0.415427, 0.4921002, -0.7006298, 0, 0.1058824, 1, 1,
0.4169272, 0.0411626, 3.283806, 0, 0.09803922, 1, 1,
0.4179872, 0.3856825, 0.1367286, 0, 0.09411765, 1, 1,
0.4184559, -0.5594941, 3.383754, 0, 0.08627451, 1, 1,
0.4205436, -1.25375, 3.515061, 0, 0.08235294, 1, 1,
0.4217603, -2.673639, 3.941787, 0, 0.07450981, 1, 1,
0.4230938, -0.1551744, 0.9452921, 0, 0.07058824, 1, 1,
0.4236176, -1.276591, 4.455601, 0, 0.0627451, 1, 1,
0.4271412, 0.8653994, 0.9127771, 0, 0.05882353, 1, 1,
0.4284122, 0.3107536, 1.493643, 0, 0.05098039, 1, 1,
0.4298944, -0.6155657, 1.700058, 0, 0.04705882, 1, 1,
0.4308286, 0.03632102, 1.293032, 0, 0.03921569, 1, 1,
0.4321085, 1.92816, 1.185042, 0, 0.03529412, 1, 1,
0.434744, -0.3296439, 0.6891382, 0, 0.02745098, 1, 1,
0.4361963, -1.067583, 3.855249, 0, 0.02352941, 1, 1,
0.4380296, -0.06988864, 1.545114, 0, 0.01568628, 1, 1,
0.4386024, 1.66176, 0.3093019, 0, 0.01176471, 1, 1,
0.4403438, -0.5143141, 2.021953, 0, 0.003921569, 1, 1,
0.4409747, 0.6795607, 1.295967, 0.003921569, 0, 1, 1,
0.4409993, -0.09684286, 2.367665, 0.007843138, 0, 1, 1,
0.4424328, 1.398255, -2.705768, 0.01568628, 0, 1, 1,
0.4455817, -0.7623205, 2.488389, 0.01960784, 0, 1, 1,
0.4490684, 0.5270275, 2.435755, 0.02745098, 0, 1, 1,
0.450359, 0.4638655, 0.1685239, 0.03137255, 0, 1, 1,
0.453044, -1.818038, 2.779197, 0.03921569, 0, 1, 1,
0.4578221, -0.7814719, 3.385523, 0.04313726, 0, 1, 1,
0.4617473, 1.156177, 2.291168, 0.05098039, 0, 1, 1,
0.4637938, -1.023032, 3.474756, 0.05490196, 0, 1, 1,
0.467274, 1.120372, 0.2281034, 0.0627451, 0, 1, 1,
0.4717767, 1.203901, 0.7338424, 0.06666667, 0, 1, 1,
0.4792507, 0.2073322, 2.091159, 0.07450981, 0, 1, 1,
0.4797174, 1.181447, 1.363815, 0.07843138, 0, 1, 1,
0.4820684, -0.2375258, 3.022115, 0.08627451, 0, 1, 1,
0.4851802, -0.8235543, 2.950078, 0.09019608, 0, 1, 1,
0.4869071, 3.286467, -0.318568, 0.09803922, 0, 1, 1,
0.4894913, -1.237231, 3.03212, 0.1058824, 0, 1, 1,
0.4899651, -1.486514, 3.505703, 0.1098039, 0, 1, 1,
0.4932219, -0.1107236, 1.939212, 0.1176471, 0, 1, 1,
0.4951755, 0.1012998, 0.144773, 0.1215686, 0, 1, 1,
0.4977743, 1.998029, 0.8381988, 0.1294118, 0, 1, 1,
0.4994925, -0.1620963, 1.926917, 0.1333333, 0, 1, 1,
0.5005447, 1.51995, 0.7466542, 0.1411765, 0, 1, 1,
0.5017987, 0.2419115, 0.6819158, 0.145098, 0, 1, 1,
0.5024093, -0.08590585, 1.792165, 0.1529412, 0, 1, 1,
0.5035195, -1.124919, 1.953497, 0.1568628, 0, 1, 1,
0.5045828, -0.7975323, 3.397042, 0.1647059, 0, 1, 1,
0.5130959, 0.7002456, 0.9250779, 0.1686275, 0, 1, 1,
0.5155638, -0.2660672, 1.188549, 0.1764706, 0, 1, 1,
0.5160999, 0.3788368, -0.2305953, 0.1803922, 0, 1, 1,
0.5187042, 0.3729923, 0.6046394, 0.1882353, 0, 1, 1,
0.5249629, -0.400933, 2.597445, 0.1921569, 0, 1, 1,
0.5278484, 0.8278067, -0.3333681, 0.2, 0, 1, 1,
0.5286335, 3.289287, -0.1338628, 0.2078431, 0, 1, 1,
0.5313355, -1.415584, 2.196703, 0.2117647, 0, 1, 1,
0.5346287, -0.2232014, 0.8005386, 0.2196078, 0, 1, 1,
0.5348344, -0.4689503, 0.2083471, 0.2235294, 0, 1, 1,
0.5353017, -2.342636, 0.8744486, 0.2313726, 0, 1, 1,
0.5359238, 1.003166, 0.078224, 0.2352941, 0, 1, 1,
0.5393897, -0.02573775, 0.4175184, 0.2431373, 0, 1, 1,
0.5449414, -0.1689025, 3.436361, 0.2470588, 0, 1, 1,
0.5454644, -0.7449185, 0.9248326, 0.254902, 0, 1, 1,
0.5458261, 0.7161853, 0.222948, 0.2588235, 0, 1, 1,
0.5462255, -0.08915302, 2.00031, 0.2666667, 0, 1, 1,
0.5467342, -0.8746945, 2.405241, 0.2705882, 0, 1, 1,
0.5473672, 0.4092557, 1.062943, 0.2784314, 0, 1, 1,
0.5518307, -1.065737, 4.357269, 0.282353, 0, 1, 1,
0.5534037, -0.662228, 1.454691, 0.2901961, 0, 1, 1,
0.5575554, -1.844808, 2.156533, 0.2941177, 0, 1, 1,
0.5613253, -0.7839978, 2.40709, 0.3019608, 0, 1, 1,
0.5625608, -0.3381926, 1.621539, 0.3098039, 0, 1, 1,
0.5698317, 1.753228, 0.04392084, 0.3137255, 0, 1, 1,
0.5706222, -0.3059314, 1.963108, 0.3215686, 0, 1, 1,
0.5734886, -0.003177369, 1.392558, 0.3254902, 0, 1, 1,
0.5762503, 0.6163386, 2.018031, 0.3333333, 0, 1, 1,
0.5774762, 1.277618, 0.2390288, 0.3372549, 0, 1, 1,
0.5784071, -0.8000627, 2.365656, 0.345098, 0, 1, 1,
0.583146, 0.3159737, 2.339634, 0.3490196, 0, 1, 1,
0.5894918, -0.07062266, 0.9199065, 0.3568628, 0, 1, 1,
0.5895165, -0.2802345, 0.2768287, 0.3607843, 0, 1, 1,
0.6078937, 1.203557, -0.04044396, 0.3686275, 0, 1, 1,
0.6097785, -2.092342, 3.954835, 0.372549, 0, 1, 1,
0.6137415, 0.3059539, 2.212306, 0.3803922, 0, 1, 1,
0.6137739, -0.2231642, 2.601884, 0.3843137, 0, 1, 1,
0.623755, 0.4997036, 0.956679, 0.3921569, 0, 1, 1,
0.6259226, -1.493447, 3.656939, 0.3960784, 0, 1, 1,
0.6282504, -0.2891362, 1.499399, 0.4039216, 0, 1, 1,
0.6303455, 0.2252401, 1.571023, 0.4117647, 0, 1, 1,
0.6308005, -0.9269921, 3.636806, 0.4156863, 0, 1, 1,
0.6329078, 0.6712621, 2.158334, 0.4235294, 0, 1, 1,
0.6366171, 1.499203, 0.06351165, 0.427451, 0, 1, 1,
0.6419025, -0.4851932, 4.20177, 0.4352941, 0, 1, 1,
0.6420427, 0.1862727, 1.188133, 0.4392157, 0, 1, 1,
0.6425912, 0.5132651, 0.6398312, 0.4470588, 0, 1, 1,
0.6440014, 0.08326025, 1.223319, 0.4509804, 0, 1, 1,
0.6485446, 0.06981274, 1.650382, 0.4588235, 0, 1, 1,
0.6497212, -0.3219759, 3.130504, 0.4627451, 0, 1, 1,
0.6589563, 0.4209594, 0.3441783, 0.4705882, 0, 1, 1,
0.6590556, 0.262465, 1.400931, 0.4745098, 0, 1, 1,
0.6605371, -0.8496922, 2.61762, 0.4823529, 0, 1, 1,
0.661143, 0.6654432, 0.6460358, 0.4862745, 0, 1, 1,
0.6643267, 0.3770527, 0.7977855, 0.4941176, 0, 1, 1,
0.6660833, 0.3017258, 2.546344, 0.5019608, 0, 1, 1,
0.6667373, -1.238845, 2.295293, 0.5058824, 0, 1, 1,
0.6695235, -1.643797, 3.384616, 0.5137255, 0, 1, 1,
0.6703514, 0.3027405, 0.9337436, 0.5176471, 0, 1, 1,
0.6753107, 0.1768012, 0.5881721, 0.5254902, 0, 1, 1,
0.6763312, -0.7413051, 1.117056, 0.5294118, 0, 1, 1,
0.6874418, -0.1317306, -0.1860874, 0.5372549, 0, 1, 1,
0.6952505, -0.04850673, 2.269209, 0.5411765, 0, 1, 1,
0.6954509, 0.6372622, 0.7566101, 0.5490196, 0, 1, 1,
0.6982383, 0.04835988, -0.1658446, 0.5529412, 0, 1, 1,
0.7003576, 1.050916, -0.3733061, 0.5607843, 0, 1, 1,
0.7022318, 0.9997023, -0.2012139, 0.5647059, 0, 1, 1,
0.7044161, -0.1469817, 2.227487, 0.572549, 0, 1, 1,
0.7056271, 0.4660785, 2.418565, 0.5764706, 0, 1, 1,
0.7074853, 0.7718169, -0.8394819, 0.5843138, 0, 1, 1,
0.7100576, 0.119458, 2.015342, 0.5882353, 0, 1, 1,
0.7134633, 0.1948012, 1.071704, 0.5960785, 0, 1, 1,
0.7134712, 0.3935125, 0.5378554, 0.6039216, 0, 1, 1,
0.715262, 1.727234, -0.1499391, 0.6078432, 0, 1, 1,
0.7224181, -0.1327218, 4.937813, 0.6156863, 0, 1, 1,
0.7236607, -1.004028, 2.439115, 0.6196079, 0, 1, 1,
0.7237437, -0.426027, 1.071911, 0.627451, 0, 1, 1,
0.7262257, -0.7578008, 2.228097, 0.6313726, 0, 1, 1,
0.7313775, -1.45736, 3.83995, 0.6392157, 0, 1, 1,
0.7325982, -1.011994, 1.566038, 0.6431373, 0, 1, 1,
0.7356731, 2.09703, 1.368307, 0.6509804, 0, 1, 1,
0.7360913, 0.9177682, 0.7694243, 0.654902, 0, 1, 1,
0.7378063, 0.6636771, 1.00996, 0.6627451, 0, 1, 1,
0.7383471, -1.975551, 3.218502, 0.6666667, 0, 1, 1,
0.7475748, -0.05512845, 2.655584, 0.6745098, 0, 1, 1,
0.7512856, 0.6979169, 2.474714, 0.6784314, 0, 1, 1,
0.7626745, -1.549755, 2.627839, 0.6862745, 0, 1, 1,
0.7646307, 1.182294, 0.6737894, 0.6901961, 0, 1, 1,
0.7664979, -0.7113273, 2.72621, 0.6980392, 0, 1, 1,
0.7697076, 0.7161556, 1.433185, 0.7058824, 0, 1, 1,
0.7725052, -0.6914757, 1.336509, 0.7098039, 0, 1, 1,
0.7739061, -1.737972, 2.701923, 0.7176471, 0, 1, 1,
0.7743039, 1.596992, 1.449119, 0.7215686, 0, 1, 1,
0.7748175, -0.3831837, 3.235173, 0.7294118, 0, 1, 1,
0.7781349, 0.01672655, 1.485056, 0.7333333, 0, 1, 1,
0.7830245, 0.07267992, 0.51474, 0.7411765, 0, 1, 1,
0.788309, -0.1898079, 1.470925, 0.7450981, 0, 1, 1,
0.7950553, 0.9530329, 0.5721877, 0.7529412, 0, 1, 1,
0.8065264, -0.6624695, 1.95074, 0.7568628, 0, 1, 1,
0.8088011, -0.01111129, 1.637066, 0.7647059, 0, 1, 1,
0.8095055, -0.6738587, 3.513301, 0.7686275, 0, 1, 1,
0.8142453, -0.4883239, 0.8112396, 0.7764706, 0, 1, 1,
0.8202475, -1.465714, 3.020688, 0.7803922, 0, 1, 1,
0.8227283, -0.09812962, 1.592895, 0.7882353, 0, 1, 1,
0.8274895, 0.2932338, 0.3326981, 0.7921569, 0, 1, 1,
0.8380768, -0.443914, -0.014511, 0.8, 0, 1, 1,
0.8383841, 1.16584, 1.047665, 0.8078431, 0, 1, 1,
0.8593223, -0.1860265, 3.563941, 0.8117647, 0, 1, 1,
0.8640348, -0.3166563, 4.579876, 0.8196079, 0, 1, 1,
0.8649248, 0.08339534, 1.336288, 0.8235294, 0, 1, 1,
0.865445, -1.524436, 2.705046, 0.8313726, 0, 1, 1,
0.872268, 0.5272353, 2.726613, 0.8352941, 0, 1, 1,
0.8728702, 0.0387867, 0.9706307, 0.8431373, 0, 1, 1,
0.8729677, -0.003955509, 2.393586, 0.8470588, 0, 1, 1,
0.8876334, -1.74315, 2.656006, 0.854902, 0, 1, 1,
0.8887873, 0.5223514, 0.797021, 0.8588235, 0, 1, 1,
0.9024875, 0.2902814, 0.3916556, 0.8666667, 0, 1, 1,
0.9058791, 0.3189466, 1.767824, 0.8705882, 0, 1, 1,
0.907886, -1.300597, 1.600188, 0.8784314, 0, 1, 1,
0.9162537, -0.198976, 1.094289, 0.8823529, 0, 1, 1,
0.9181696, 0.3582574, -0.712768, 0.8901961, 0, 1, 1,
0.9197857, -0.55967, 1.628461, 0.8941177, 0, 1, 1,
0.9201131, -1.20468, 3.122844, 0.9019608, 0, 1, 1,
0.9209234, -0.1213785, 2.407179, 0.9098039, 0, 1, 1,
0.9262719, 0.2947599, 0.04915861, 0.9137255, 0, 1, 1,
0.9323722, -0.9146575, 3.15641, 0.9215686, 0, 1, 1,
0.9332963, 0.2326061, 0.865125, 0.9254902, 0, 1, 1,
0.9370104, 0.3051212, 0.4195247, 0.9333333, 0, 1, 1,
0.9435117, -0.567723, 2.964764, 0.9372549, 0, 1, 1,
0.9533132, -0.1817874, 0.9996032, 0.945098, 0, 1, 1,
0.9539104, 1.139169, -0.7348953, 0.9490196, 0, 1, 1,
0.9542226, -0.06937758, 2.501597, 0.9568627, 0, 1, 1,
0.9571892, -0.2690062, 0.6344227, 0.9607843, 0, 1, 1,
0.9582187, 1.698637, 0.5883064, 0.9686275, 0, 1, 1,
0.9599551, -0.01415065, 1.354393, 0.972549, 0, 1, 1,
0.9638478, 0.621228, 0.2126722, 0.9803922, 0, 1, 1,
0.9645564, 0.1714821, 0.8316028, 0.9843137, 0, 1, 1,
0.964626, 1.072119, 1.003261, 0.9921569, 0, 1, 1,
0.9686573, 0.9200622, 0.6332906, 0.9960784, 0, 1, 1,
0.9774882, -0.3612069, 2.610061, 1, 0, 0.9960784, 1,
0.9792863, -0.5565033, 1.373482, 1, 0, 0.9882353, 1,
0.9818354, -0.3018596, 2.242269, 1, 0, 0.9843137, 1,
0.9820744, 1.653643, 2.064186, 1, 0, 0.9764706, 1,
0.9825094, 0.6101338, -0.0918587, 1, 0, 0.972549, 1,
0.9877985, -0.5785986, 0.6708611, 1, 0, 0.9647059, 1,
0.9885135, -1.188701, 1.347347, 1, 0, 0.9607843, 1,
0.9895844, -0.6826558, 2.695366, 1, 0, 0.9529412, 1,
0.9905202, 0.2458921, 1.258171, 1, 0, 0.9490196, 1,
0.9909011, 0.1154858, 0.731366, 1, 0, 0.9411765, 1,
1.00838, 0.230342, 2.070681, 1, 0, 0.9372549, 1,
1.0086, 0.1228322, 0.1647149, 1, 0, 0.9294118, 1,
1.0147, 0.7339414, 0.4394253, 1, 0, 0.9254902, 1,
1.01777, 0.3551212, -0.5831762, 1, 0, 0.9176471, 1,
1.024528, -0.6495817, 3.427183, 1, 0, 0.9137255, 1,
1.025974, -0.8381275, 1.506277, 1, 0, 0.9058824, 1,
1.032448, 2.373639, 1.461684, 1, 0, 0.9019608, 1,
1.042131, -1.285406, 0.1334426, 1, 0, 0.8941177, 1,
1.043942, 0.08247283, 1.594575, 1, 0, 0.8862745, 1,
1.046255, -0.2984557, 0.6219816, 1, 0, 0.8823529, 1,
1.047485, -0.9360297, 1.801912, 1, 0, 0.8745098, 1,
1.059175, -0.202057, 0.5498908, 1, 0, 0.8705882, 1,
1.060212, -0.6479049, 3.157607, 1, 0, 0.8627451, 1,
1.066948, -0.5543433, 2.765867, 1, 0, 0.8588235, 1,
1.067085, -0.7754754, 0.3592618, 1, 0, 0.8509804, 1,
1.067302, -1.87164, 1.921469, 1, 0, 0.8470588, 1,
1.071965, -1.68926, 1.989246, 1, 0, 0.8392157, 1,
1.073716, -0.2206678, 0.7720876, 1, 0, 0.8352941, 1,
1.074172, -1.175724, 2.170534, 1, 0, 0.827451, 1,
1.076068, -0.3863444, 0.3237783, 1, 0, 0.8235294, 1,
1.0781, -1.400606, 1.576708, 1, 0, 0.8156863, 1,
1.078996, -0.7902375, 2.980384, 1, 0, 0.8117647, 1,
1.084593, -0.9610487, 4.17622, 1, 0, 0.8039216, 1,
1.08835, 0.6765949, 1.477995, 1, 0, 0.7960784, 1,
1.089676, 0.262394, 0.3357408, 1, 0, 0.7921569, 1,
1.093145, 1.066811, 0.1575271, 1, 0, 0.7843137, 1,
1.093875, 0.01558559, 1.142383, 1, 0, 0.7803922, 1,
1.106151, 0.3728738, 1.279827, 1, 0, 0.772549, 1,
1.118057, 1.850852, 1.644584, 1, 0, 0.7686275, 1,
1.130428, 2.342099, 0.03993325, 1, 0, 0.7607843, 1,
1.131783, -0.1046091, 2.660872, 1, 0, 0.7568628, 1,
1.148616, 0.00945978, 1.822091, 1, 0, 0.7490196, 1,
1.151762, 0.4813949, 0.3240369, 1, 0, 0.7450981, 1,
1.163888, 1.494112, 1.389753, 1, 0, 0.7372549, 1,
1.180192, -0.2904612, 1.365735, 1, 0, 0.7333333, 1,
1.1829, -1.11434, 1.876709, 1, 0, 0.7254902, 1,
1.186434, -0.3758821, 1.450286, 1, 0, 0.7215686, 1,
1.18664, 0.3694634, 1.579232, 1, 0, 0.7137255, 1,
1.198309, 0.9798403, 2.192035, 1, 0, 0.7098039, 1,
1.198434, 0.06584067, 1.685656, 1, 0, 0.7019608, 1,
1.203321, -0.07832006, 0.7927247, 1, 0, 0.6941177, 1,
1.206403, 1.752674, 0.6785277, 1, 0, 0.6901961, 1,
1.208666, -0.9959198, 1.806403, 1, 0, 0.682353, 1,
1.224454, 1.112716, 1.701723, 1, 0, 0.6784314, 1,
1.230493, -0.364466, 2.800089, 1, 0, 0.6705883, 1,
1.234326, 1.124661, -0.6215875, 1, 0, 0.6666667, 1,
1.236275, 1.132562, -0.8237769, 1, 0, 0.6588235, 1,
1.238072, -0.6968012, 3.236113, 1, 0, 0.654902, 1,
1.240326, 0.7860828, 1.184785, 1, 0, 0.6470588, 1,
1.249012, -0.3133921, 2.342483, 1, 0, 0.6431373, 1,
1.263546, 2.269776, -0.9728231, 1, 0, 0.6352941, 1,
1.267591, -0.107334, 1.071469, 1, 0, 0.6313726, 1,
1.268028, 0.2970515, -0.1142474, 1, 0, 0.6235294, 1,
1.272439, -0.4270357, 1.255869, 1, 0, 0.6196079, 1,
1.276151, -0.3871216, 1.137425, 1, 0, 0.6117647, 1,
1.280329, 0.6541607, 0.9187643, 1, 0, 0.6078432, 1,
1.281558, 0.2920834, 1.497995, 1, 0, 0.6, 1,
1.282417, -1.910169, 2.91901, 1, 0, 0.5921569, 1,
1.283005, 0.7207506, 3.416972, 1, 0, 0.5882353, 1,
1.288146, 0.09308307, 2.691872, 1, 0, 0.5803922, 1,
1.295153, 0.2135202, 0.6138709, 1, 0, 0.5764706, 1,
1.296645, 1.400669, 1.307831, 1, 0, 0.5686275, 1,
1.296813, -0.05335104, 0.05262515, 1, 0, 0.5647059, 1,
1.297771, -1.017741, 2.267095, 1, 0, 0.5568628, 1,
1.299543, 0.743522, 0.6391416, 1, 0, 0.5529412, 1,
1.303588, 0.2363984, 2.608079, 1, 0, 0.5450981, 1,
1.3087, -0.4664559, 3.201822, 1, 0, 0.5411765, 1,
1.314776, -1.386489, 1.233731, 1, 0, 0.5333334, 1,
1.332932, -1.641012, 2.015201, 1, 0, 0.5294118, 1,
1.342108, 0.2251643, 2.140353, 1, 0, 0.5215687, 1,
1.344058, 0.8487522, 0.9433174, 1, 0, 0.5176471, 1,
1.344207, -0.678624, 0.1789558, 1, 0, 0.509804, 1,
1.354217, -0.5446516, 1.239875, 1, 0, 0.5058824, 1,
1.380202, -0.1650248, 2.217805, 1, 0, 0.4980392, 1,
1.383983, 0.4648286, 2.91885, 1, 0, 0.4901961, 1,
1.387086, 0.935893, -0.7270544, 1, 0, 0.4862745, 1,
1.390956, -1.330605, 2.650666, 1, 0, 0.4784314, 1,
1.393255, 0.2119498, 1.158009, 1, 0, 0.4745098, 1,
1.404886, -0.0920885, 3.049415, 1, 0, 0.4666667, 1,
1.409631, 0.308786, 1.968695, 1, 0, 0.4627451, 1,
1.409804, 1.676171, 1.631162, 1, 0, 0.454902, 1,
1.440317, 0.3530531, 0.3354495, 1, 0, 0.4509804, 1,
1.444233, -1.886436, 1.213095, 1, 0, 0.4431373, 1,
1.449868, 0.8087632, 1.707788, 1, 0, 0.4392157, 1,
1.460094, 0.3863683, 0.8941488, 1, 0, 0.4313726, 1,
1.460886, -0.632601, 2.778784, 1, 0, 0.427451, 1,
1.464629, -1.029668, 2.263621, 1, 0, 0.4196078, 1,
1.480964, -0.529269, 3.357131, 1, 0, 0.4156863, 1,
1.484275, -0.469517, 1.522048, 1, 0, 0.4078431, 1,
1.515361, 0.3104975, 2.931828, 1, 0, 0.4039216, 1,
1.516249, -1.221242, 2.577582, 1, 0, 0.3960784, 1,
1.569355, -0.8525664, 2.766971, 1, 0, 0.3882353, 1,
1.570484, 1.764632, -1.181608, 1, 0, 0.3843137, 1,
1.577621, 0.05017073, 1.986967, 1, 0, 0.3764706, 1,
1.581861, -0.8994146, 1.442028, 1, 0, 0.372549, 1,
1.587275, 0.3474905, 1.663729, 1, 0, 0.3647059, 1,
1.593467, 0.1647861, 0.207536, 1, 0, 0.3607843, 1,
1.596077, 0.2135384, 0.333845, 1, 0, 0.3529412, 1,
1.603998, -1.0993, 0.1986924, 1, 0, 0.3490196, 1,
1.605569, -0.9210817, 2.85098, 1, 0, 0.3411765, 1,
1.606471, 0.1174315, 4.097829, 1, 0, 0.3372549, 1,
1.620749, -2.463666, 1.138795, 1, 0, 0.3294118, 1,
1.627189, -0.9404966, 4.1359, 1, 0, 0.3254902, 1,
1.636169, -0.03791311, 0.6445519, 1, 0, 0.3176471, 1,
1.659382, 0.8167399, 0.4725904, 1, 0, 0.3137255, 1,
1.665072, -0.179511, 0.6125235, 1, 0, 0.3058824, 1,
1.667343, -0.1883546, -0.06359496, 1, 0, 0.2980392, 1,
1.701619, 0.2396598, 1.608698, 1, 0, 0.2941177, 1,
1.7212, 0.4861175, 2.645366, 1, 0, 0.2862745, 1,
1.730372, 0.01072933, 1.950124, 1, 0, 0.282353, 1,
1.741102, -0.842082, 1.589679, 1, 0, 0.2745098, 1,
1.759925, 1.021156, 3.221659, 1, 0, 0.2705882, 1,
1.770053, -0.6014464, 2.452374, 1, 0, 0.2627451, 1,
1.775961, -1.321531, 2.330111, 1, 0, 0.2588235, 1,
1.783829, 2.387837, -0.1996218, 1, 0, 0.2509804, 1,
1.79456, -0.1349642, 2.336397, 1, 0, 0.2470588, 1,
1.794985, -1.444615, 2.636458, 1, 0, 0.2392157, 1,
1.813514, 0.5866056, 1.026842, 1, 0, 0.2352941, 1,
1.813827, 0.4453556, 2.828137, 1, 0, 0.227451, 1,
1.818222, 0.321492, 3.563034, 1, 0, 0.2235294, 1,
1.819664, -1.251887, 4.187413, 1, 0, 0.2156863, 1,
1.821706, -0.8644513, 0.4070302, 1, 0, 0.2117647, 1,
1.829935, 0.3869079, 1.865516, 1, 0, 0.2039216, 1,
1.841469, 1.574756, 2.218877, 1, 0, 0.1960784, 1,
1.845973, -1.063109, 2.831298, 1, 0, 0.1921569, 1,
1.850834, -0.05950221, 1.793646, 1, 0, 0.1843137, 1,
1.876695, 0.2591109, 1.532335, 1, 0, 0.1803922, 1,
1.879935, 1.405967, 1.830647, 1, 0, 0.172549, 1,
1.890599, -0.6105014, 2.365622, 1, 0, 0.1686275, 1,
1.902837, -0.04548174, 0.6131169, 1, 0, 0.1607843, 1,
1.925492, -0.8817314, 1.099093, 1, 0, 0.1568628, 1,
1.93389, -0.3442549, 1.357377, 1, 0, 0.1490196, 1,
1.936866, -0.532355, 1.90034, 1, 0, 0.145098, 1,
1.942214, -0.7368181, 0.897035, 1, 0, 0.1372549, 1,
1.963624, -0.7473772, 3.195389, 1, 0, 0.1333333, 1,
1.9755, 0.7378571, -0.4358796, 1, 0, 0.1254902, 1,
1.983576, -0.1975515, 3.712035, 1, 0, 0.1215686, 1,
2.134232, -0.9982128, 2.102765, 1, 0, 0.1137255, 1,
2.149448, 0.5478649, 1.561863, 1, 0, 0.1098039, 1,
2.157644, -0.8701919, 1.113711, 1, 0, 0.1019608, 1,
2.174678, 1.225559, 1.217097, 1, 0, 0.09411765, 1,
2.191644, -0.2518027, -0.2923471, 1, 0, 0.09019608, 1,
2.270465, 1.229535, 1.974351, 1, 0, 0.08235294, 1,
2.289583, -0.04821905, 1.665336, 1, 0, 0.07843138, 1,
2.289711, -0.04454586, 2.158986, 1, 0, 0.07058824, 1,
2.359641, 0.8410552, 1.76439, 1, 0, 0.06666667, 1,
2.361209, 1.181057, -1.589761, 1, 0, 0.05882353, 1,
2.388901, -1.372414, 4.128272, 1, 0, 0.05490196, 1,
2.411413, 0.3262311, 1.029361, 1, 0, 0.04705882, 1,
2.420913, 0.1725088, 1.005037, 1, 0, 0.04313726, 1,
2.531843, -0.3664185, 1.56471, 1, 0, 0.03529412, 1,
2.68918, -1.963589, 2.897121, 1, 0, 0.03137255, 1,
2.70078, 0.5596443, 2.791238, 1, 0, 0.02352941, 1,
2.869023, 2.575948, 0.04699756, 1, 0, 0.01960784, 1,
3.10508, -0.3696432, 1.500788, 1, 0, 0.01176471, 1,
3.117326, 0.576997, 1.895048, 1, 0, 0.007843138, 1
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
-0.04479229, -4.58055, -6.958111, 0, -0.5, 0.5, 0.5,
-0.04479229, -4.58055, -6.958111, 1, -0.5, 0.5, 0.5,
-0.04479229, -4.58055, -6.958111, 1, 1.5, 0.5, 0.5,
-0.04479229, -4.58055, -6.958111, 0, 1.5, 0.5, 0.5
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
-4.278869, -0.07293153, -6.958111, 0, -0.5, 0.5, 0.5,
-4.278869, -0.07293153, -6.958111, 1, -0.5, 0.5, 0.5,
-4.278869, -0.07293153, -6.958111, 1, 1.5, 0.5, 0.5,
-4.278869, -0.07293153, -6.958111, 0, 1.5, 0.5, 0.5
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
-4.278869, -4.58055, -0.02066326, 0, -0.5, 0.5, 0.5,
-4.278869, -4.58055, -0.02066326, 1, -0.5, 0.5, 0.5,
-4.278869, -4.58055, -0.02066326, 1, 1.5, 0.5, 0.5,
-4.278869, -4.58055, -0.02066326, 0, 1.5, 0.5, 0.5
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
-3, -3.540331, -5.357162,
3, -3.540331, -5.357162,
-3, -3.540331, -5.357162,
-3, -3.713701, -5.623987,
-2, -3.540331, -5.357162,
-2, -3.713701, -5.623987,
-1, -3.540331, -5.357162,
-1, -3.713701, -5.623987,
0, -3.540331, -5.357162,
0, -3.713701, -5.623987,
1, -3.540331, -5.357162,
1, -3.713701, -5.623987,
2, -3.540331, -5.357162,
2, -3.713701, -5.623987,
3, -3.540331, -5.357162,
3, -3.713701, -5.623987
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
-3, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
-3, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
-3, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
-3, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
-2, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
-2, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
-2, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
-2, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
-1, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
-1, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
-1, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
-1, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
0, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
0, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
0, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
0, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
1, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
1, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
1, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
1, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
2, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
2, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
2, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
2, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5,
3, -4.060441, -6.157637, 0, -0.5, 0.5, 0.5,
3, -4.060441, -6.157637, 1, -0.5, 0.5, 0.5,
3, -4.060441, -6.157637, 1, 1.5, 0.5, 0.5,
3, -4.060441, -6.157637, 0, 1.5, 0.5, 0.5
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
-3.301775, -3, -5.357162,
-3.301775, 3, -5.357162,
-3.301775, -3, -5.357162,
-3.464624, -3, -5.623987,
-3.301775, -2, -5.357162,
-3.464624, -2, -5.623987,
-3.301775, -1, -5.357162,
-3.464624, -1, -5.623987,
-3.301775, 0, -5.357162,
-3.464624, 0, -5.623987,
-3.301775, 1, -5.357162,
-3.464624, 1, -5.623987,
-3.301775, 2, -5.357162,
-3.464624, 2, -5.623987,
-3.301775, 3, -5.357162,
-3.464624, 3, -5.623987
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
-3.790322, -3, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, -3, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, -3, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, -3, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, -2, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, -2, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, -2, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, -2, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, -1, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, -1, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, -1, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, -1, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, 0, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, 0, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, 0, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, 0, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, 1, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, 1, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, 1, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, 1, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, 2, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, 2, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, 2, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, 2, -6.157637, 0, 1.5, 0.5, 0.5,
-3.790322, 3, -6.157637, 0, -0.5, 0.5, 0.5,
-3.790322, 3, -6.157637, 1, -0.5, 0.5, 0.5,
-3.790322, 3, -6.157637, 1, 1.5, 0.5, 0.5,
-3.790322, 3, -6.157637, 0, 1.5, 0.5, 0.5
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
-3.301775, -3.540331, -4,
-3.301775, -3.540331, 4,
-3.301775, -3.540331, -4,
-3.464624, -3.713701, -4,
-3.301775, -3.540331, -2,
-3.464624, -3.713701, -2,
-3.301775, -3.540331, 0,
-3.464624, -3.713701, 0,
-3.301775, -3.540331, 2,
-3.464624, -3.713701, 2,
-3.301775, -3.540331, 4,
-3.464624, -3.713701, 4
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
-3.790322, -4.060441, -4, 0, -0.5, 0.5, 0.5,
-3.790322, -4.060441, -4, 1, -0.5, 0.5, 0.5,
-3.790322, -4.060441, -4, 1, 1.5, 0.5, 0.5,
-3.790322, -4.060441, -4, 0, 1.5, 0.5, 0.5,
-3.790322, -4.060441, -2, 0, -0.5, 0.5, 0.5,
-3.790322, -4.060441, -2, 1, -0.5, 0.5, 0.5,
-3.790322, -4.060441, -2, 1, 1.5, 0.5, 0.5,
-3.790322, -4.060441, -2, 0, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 0, 0, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 0, 1, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 0, 1, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 0, 0, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 2, 0, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 2, 1, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 2, 1, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 2, 0, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 4, 0, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 4, 1, -0.5, 0.5, 0.5,
-3.790322, -4.060441, 4, 1, 1.5, 0.5, 0.5,
-3.790322, -4.060441, 4, 0, 1.5, 0.5, 0.5
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
-3.301775, -3.540331, -5.357162,
-3.301775, 3.394468, -5.357162,
-3.301775, -3.540331, 5.315835,
-3.301775, 3.394468, 5.315835,
-3.301775, -3.540331, -5.357162,
-3.301775, -3.540331, 5.315835,
-3.301775, 3.394468, -5.357162,
-3.301775, 3.394468, 5.315835,
-3.301775, -3.540331, -5.357162,
3.21219, -3.540331, -5.357162,
-3.301775, -3.540331, 5.315835,
3.21219, -3.540331, 5.315835,
-3.301775, 3.394468, -5.357162,
3.21219, 3.394468, -5.357162,
-3.301775, 3.394468, 5.315835,
3.21219, 3.394468, 5.315835,
3.21219, -3.540331, -5.357162,
3.21219, 3.394468, -5.357162,
3.21219, -3.540331, 5.315835,
3.21219, 3.394468, 5.315835,
3.21219, -3.540331, -5.357162,
3.21219, -3.540331, 5.315835,
3.21219, 3.394468, -5.357162,
3.21219, 3.394468, 5.315835
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
var radius = 7.634915;
var distance = 33.9686;
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
mvMatrix.translate( 0.04479229, 0.07293153, 0.02066326 );
mvMatrix.scale( 1.26728, 1.190376, 0.7734491 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9686);
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
dimethyl_(E)-1-methy<-read.table("dimethyl_(E)-1-methy.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethyl_(E)-1-methy$V2
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
```

```r
y<-dimethyl_(E)-1-methy$V3
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
```

```r
z<-dimethyl_(E)-1-methy$V4
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
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
-3.206911, 1.126301, -0.6874558, 0, 0, 1, 1, 1,
-3.180259, 0.4852203, -1.514239, 1, 0, 0, 1, 1,
-3.054883, 0.9305577, -0.3252805, 1, 0, 0, 1, 1,
-2.955225, -1.195929, -3.934329, 1, 0, 0, 1, 1,
-2.791392, -0.5284408, -1.539401, 1, 0, 0, 1, 1,
-2.79067, -1.182258, -1.791886, 1, 0, 0, 1, 1,
-2.725583, -1.230007, -1.767226, 0, 0, 0, 1, 1,
-2.482267, -0.519509, -1.529624, 0, 0, 0, 1, 1,
-2.397825, 0.009425026, -2.838654, 0, 0, 0, 1, 1,
-2.323711, -1.561995, -2.437906, 0, 0, 0, 1, 1,
-2.226715, -1.260571, -0.9571961, 0, 0, 0, 1, 1,
-2.224042, 0.2520936, -3.427232, 0, 0, 0, 1, 1,
-2.210623, -2.89991, -3.495875, 0, 0, 0, 1, 1,
-2.181414, 0.1319253, -2.836872, 1, 1, 1, 1, 1,
-2.180102, -0.9124636, -4.09493, 1, 1, 1, 1, 1,
-2.172211, -0.8864959, -1.137166, 1, 1, 1, 1, 1,
-2.133132, -0.5297784, -1.141536, 1, 1, 1, 1, 1,
-2.123883, 0.1449531, -2.080363, 1, 1, 1, 1, 1,
-2.120965, 0.54684, -1.305461, 1, 1, 1, 1, 1,
-2.115833, -0.1196469, -3.000841, 1, 1, 1, 1, 1,
-2.085876, -1.843826, -0.4661769, 1, 1, 1, 1, 1,
-2.077564, 0.159868, -1.628547, 1, 1, 1, 1, 1,
-2.019215, -0.9997502, -2.423848, 1, 1, 1, 1, 1,
-2.010118, 0.6759475, -1.974624, 1, 1, 1, 1, 1,
-2.007628, -1.691448, -2.312438, 1, 1, 1, 1, 1,
-1.976527, -0.7894077, 0.009469871, 1, 1, 1, 1, 1,
-1.933199, 1.221156, 1.144246, 1, 1, 1, 1, 1,
-1.92605, 0.9872106, -2.019156, 1, 1, 1, 1, 1,
-1.884707, 0.34951, 1.295086, 0, 0, 1, 1, 1,
-1.848777, -1.267628, -1.59171, 1, 0, 0, 1, 1,
-1.848288, 1.60497, -2.35788, 1, 0, 0, 1, 1,
-1.838716, 0.01867031, -3.076704, 1, 0, 0, 1, 1,
-1.837509, -0.1787166, -3.366482, 1, 0, 0, 1, 1,
-1.837043, -0.5801276, -1.559759, 1, 0, 0, 1, 1,
-1.80859, -0.743608, -1.624197, 0, 0, 0, 1, 1,
-1.797059, -0.7627662, 0.451977, 0, 0, 0, 1, 1,
-1.787181, 1.531563, -2.174595, 0, 0, 0, 1, 1,
-1.786276, 0.1561897, -0.8611231, 0, 0, 0, 1, 1,
-1.78247, 0.2376659, -1.341947, 0, 0, 0, 1, 1,
-1.780479, -0.4834028, -2.83063, 0, 0, 0, 1, 1,
-1.772922, -0.3312826, -1.092011, 0, 0, 0, 1, 1,
-1.74333, 0.4436, -3.032193, 1, 1, 1, 1, 1,
-1.715768, -1.275241, -2.563514, 1, 1, 1, 1, 1,
-1.685854, -0.01042196, -2.342367, 1, 1, 1, 1, 1,
-1.675655, -0.483737, 0.5982885, 1, 1, 1, 1, 1,
-1.675015, 1.758544, -1.483516, 1, 1, 1, 1, 1,
-1.649507, -0.6968181, -0.7007433, 1, 1, 1, 1, 1,
-1.645098, -1.108516, -1.84456, 1, 1, 1, 1, 1,
-1.632753, -0.9023536, -1.277065, 1, 1, 1, 1, 1,
-1.629574, -0.04914625, -1.512517, 1, 1, 1, 1, 1,
-1.62173, 1.074882, -2.072987, 1, 1, 1, 1, 1,
-1.61378, -0.05501208, -3.642387, 1, 1, 1, 1, 1,
-1.611729, -0.1279983, -0.9162814, 1, 1, 1, 1, 1,
-1.603379, -1.116781, -1.473597, 1, 1, 1, 1, 1,
-1.590881, 0.813723, -1.229249, 1, 1, 1, 1, 1,
-1.586426, 0.3061086, -2.264577, 1, 1, 1, 1, 1,
-1.586342, -0.3637168, -2.354491, 0, 0, 1, 1, 1,
-1.582519, 0.1587561, -0.9961776, 1, 0, 0, 1, 1,
-1.581314, -0.8197417, -2.404779, 1, 0, 0, 1, 1,
-1.563586, 0.7983397, -0.5967876, 1, 0, 0, 1, 1,
-1.550186, 0.0416105, -1.095886, 1, 0, 0, 1, 1,
-1.548809, 0.2192543, -0.9410685, 1, 0, 0, 1, 1,
-1.545004, -0.2673183, -2.830188, 0, 0, 0, 1, 1,
-1.543056, -0.5635844, -1.611096, 0, 0, 0, 1, 1,
-1.524197, -0.4054701, -2.304657, 0, 0, 0, 1, 1,
-1.519956, 0.7268887, -0.9620689, 0, 0, 0, 1, 1,
-1.510815, -0.9710808, -1.82874, 0, 0, 0, 1, 1,
-1.505794, -1.094736, -0.235387, 0, 0, 0, 1, 1,
-1.505362, 0.4882892, -3.197865, 0, 0, 0, 1, 1,
-1.494269, 0.7427691, 0.02007516, 1, 1, 1, 1, 1,
-1.473232, 0.2730445, 0.714969, 1, 1, 1, 1, 1,
-1.465779, 0.9239798, -0.6356768, 1, 1, 1, 1, 1,
-1.459877, 0.9679263, 0.4517229, 1, 1, 1, 1, 1,
-1.456559, -1.436629, -2.035722, 1, 1, 1, 1, 1,
-1.456389, -0.04000526, -2.028268, 1, 1, 1, 1, 1,
-1.446092, -0.09728448, -2.918694, 1, 1, 1, 1, 1,
-1.441417, 0.5892346, -0.527633, 1, 1, 1, 1, 1,
-1.435872, 0.1550949, -1.933517, 1, 1, 1, 1, 1,
-1.431611, 0.174823, -0.8692695, 1, 1, 1, 1, 1,
-1.42367, 3.293475, -0.5278104, 1, 1, 1, 1, 1,
-1.422438, -0.4031231, -0.6675441, 1, 1, 1, 1, 1,
-1.417451, 0.07188265, -2.135938, 1, 1, 1, 1, 1,
-1.41538, -0.8707487, -1.516386, 1, 1, 1, 1, 1,
-1.406737, 1.186455, -0.8418346, 1, 1, 1, 1, 1,
-1.406667, -0.1574124, -2.116038, 0, 0, 1, 1, 1,
-1.391355, 0.8393612, -0.2573979, 1, 0, 0, 1, 1,
-1.373576, -0.3526235, 0.8284724, 1, 0, 0, 1, 1,
-1.368729, -0.8674772, -2.309271, 1, 0, 0, 1, 1,
-1.367254, 1.806612, 0.3996975, 1, 0, 0, 1, 1,
-1.363587, 0.8982188, -0.6240095, 1, 0, 0, 1, 1,
-1.361088, 2.627024, -1.010966, 0, 0, 0, 1, 1,
-1.360429, -0.4651707, -2.510214, 0, 0, 0, 1, 1,
-1.359088, -0.7141498, -1.15902, 0, 0, 0, 1, 1,
-1.351404, -0.8596548, -0.7030482, 0, 0, 0, 1, 1,
-1.332439, 0.3793452, -0.04900796, 0, 0, 0, 1, 1,
-1.316589, -2.383715, -2.84169, 0, 0, 0, 1, 1,
-1.297261, -0.1583721, -1.499717, 0, 0, 0, 1, 1,
-1.293858, -1.169749, -3.089807, 1, 1, 1, 1, 1,
-1.290928, -0.0621186, 0.3015674, 1, 1, 1, 1, 1,
-1.275261, -0.5573881, -1.640436, 1, 1, 1, 1, 1,
-1.273554, 1.47437, -1.768982, 1, 1, 1, 1, 1,
-1.272679, 0.07023213, -1.481187, 1, 1, 1, 1, 1,
-1.271378, 0.06328268, -1.291389, 1, 1, 1, 1, 1,
-1.267736, 0.2817985, -2.16654, 1, 1, 1, 1, 1,
-1.26617, -1.259349, 0.1122901, 1, 1, 1, 1, 1,
-1.26461, 0.9091851, -0.360055, 1, 1, 1, 1, 1,
-1.253476, 0.506036, -0.3177988, 1, 1, 1, 1, 1,
-1.248914, -0.8985178, -1.55569, 1, 1, 1, 1, 1,
-1.247629, 0.06643411, -1.165642, 1, 1, 1, 1, 1,
-1.245319, 0.6676226, -2.376784, 1, 1, 1, 1, 1,
-1.242927, 0.2175362, -2.052886, 1, 1, 1, 1, 1,
-1.231006, 0.2047826, -2.120724, 1, 1, 1, 1, 1,
-1.227609, 0.3782653, -1.458128, 0, 0, 1, 1, 1,
-1.225891, 0.4847097, -2.661622, 1, 0, 0, 1, 1,
-1.224428, -2.529113, -1.912982, 1, 0, 0, 1, 1,
-1.201937, 1.266936, -0.1070373, 1, 0, 0, 1, 1,
-1.195977, 0.5434009, -0.8009493, 1, 0, 0, 1, 1,
-1.188844, 1.6783, -1.008305, 1, 0, 0, 1, 1,
-1.180519, 1.732893, -1.698851, 0, 0, 0, 1, 1,
-1.176599, 0.1004753, -1.520077, 0, 0, 0, 1, 1,
-1.166701, 0.7713559, -1.540298, 0, 0, 0, 1, 1,
-1.157159, 2.138443, -1.660282, 0, 0, 0, 1, 1,
-1.14519, -0.4075556, -1.676124, 0, 0, 0, 1, 1,
-1.140131, 0.1948428, -1.225554, 0, 0, 0, 1, 1,
-1.139934, 1.333784, -2.128715, 0, 0, 0, 1, 1,
-1.138811, -1.139302, -4.594769, 1, 1, 1, 1, 1,
-1.12905, 1.01194, 1.155397, 1, 1, 1, 1, 1,
-1.120688, 0.2322545, -0.762991, 1, 1, 1, 1, 1,
-1.113435, -2.566799, -3.490076, 1, 1, 1, 1, 1,
-1.105953, -0.4904014, -0.6523007, 1, 1, 1, 1, 1,
-1.098931, 0.4256534, -0.9344196, 1, 1, 1, 1, 1,
-1.098827, 0.2231099, -2.096324, 1, 1, 1, 1, 1,
-1.092265, -0.07454372, -0.9472938, 1, 1, 1, 1, 1,
-1.088285, 1.228518, 1.170594, 1, 1, 1, 1, 1,
-1.081385, -1.115224, -1.899503, 1, 1, 1, 1, 1,
-1.071728, -2.602025, -0.2683975, 1, 1, 1, 1, 1,
-1.06871, 1.205961, -1.452641, 1, 1, 1, 1, 1,
-1.067437, -1.968807, -0.8717106, 1, 1, 1, 1, 1,
-1.06075, 0.9040378, -0.4353278, 1, 1, 1, 1, 1,
-1.057946, -0.5822369, -2.49037, 1, 1, 1, 1, 1,
-1.056356, 0.4616299, 0.10693, 0, 0, 1, 1, 1,
-1.052202, 0.742438, 0.1654579, 1, 0, 0, 1, 1,
-1.04734, -0.1212577, -0.7767315, 1, 0, 0, 1, 1,
-1.046859, -0.01762236, -0.4305946, 1, 0, 0, 1, 1,
-1.042759, -0.5487512, -2.922542, 1, 0, 0, 1, 1,
-1.041628, 1.036952, -1.495712, 1, 0, 0, 1, 1,
-1.036448, -0.03407789, -3.376339, 0, 0, 0, 1, 1,
-1.035389, -0.4565671, -2.63814, 0, 0, 0, 1, 1,
-1.035305, -0.97017, -2.453777, 0, 0, 0, 1, 1,
-1.035276, 1.040383, -1.994383, 0, 0, 0, 1, 1,
-1.032033, -1.491213, -1.821991, 0, 0, 0, 1, 1,
-1.024287, -0.6996762, -1.47243, 0, 0, 0, 1, 1,
-1.02324, -0.7562236, -1.191777, 0, 0, 0, 1, 1,
-1.020416, 0.08427018, 0.1181355, 1, 1, 1, 1, 1,
-1.020111, -0.03912829, -2.378424, 1, 1, 1, 1, 1,
-1.020064, 0.4100556, -0.8450893, 1, 1, 1, 1, 1,
-1.019385, 0.1652059, -1.319846, 1, 1, 1, 1, 1,
-1.016822, 0.03437081, -1.95339, 1, 1, 1, 1, 1,
-1.014428, -1.849495, -2.185259, 1, 1, 1, 1, 1,
-1.012971, -0.9799284, -3.227092, 1, 1, 1, 1, 1,
-1.01008, 0.04301709, -0.8403532, 1, 1, 1, 1, 1,
-1.005545, 0.3209456, -1.124293, 1, 1, 1, 1, 1,
-1.004336, 1.459029, 0.9530888, 1, 1, 1, 1, 1,
-1.002266, -1.766055, -3.346546, 1, 1, 1, 1, 1,
-0.9979753, -0.8214712, -3.524306, 1, 1, 1, 1, 1,
-0.9967429, 0.5842245, -0.6561291, 1, 1, 1, 1, 1,
-0.9918627, -0.6317229, -2.219523, 1, 1, 1, 1, 1,
-0.9879156, -1.835646, -4.395457, 1, 1, 1, 1, 1,
-0.9845843, 0.2941235, -0.8091152, 0, 0, 1, 1, 1,
-0.9808912, -1.64757, -0.616806, 1, 0, 0, 1, 1,
-0.9784806, -0.5789457, -1.273669, 1, 0, 0, 1, 1,
-0.9745007, -0.2478176, -2.694848, 1, 0, 0, 1, 1,
-0.9724016, 0.4365029, -2.008719, 1, 0, 0, 1, 1,
-0.9690992, -0.9041897, -1.298077, 1, 0, 0, 1, 1,
-0.9639822, -0.002550212, -0.5063246, 0, 0, 0, 1, 1,
-0.9637949, -0.4085597, -0.7181481, 0, 0, 0, 1, 1,
-0.9637603, 0.6677179, -1.780237, 0, 0, 0, 1, 1,
-0.9621521, 1.097982, -1.045376, 0, 0, 0, 1, 1,
-0.9571553, -1.630189, -3.143777, 0, 0, 0, 1, 1,
-0.954478, -0.4886097, -2.549066, 0, 0, 0, 1, 1,
-0.9529025, 0.6122853, -0.2522811, 0, 0, 0, 1, 1,
-0.9399109, -0.3409052, -1.043468, 1, 1, 1, 1, 1,
-0.9375225, 1.548001, 1.119899, 1, 1, 1, 1, 1,
-0.9274312, 1.053807, -2.085811, 1, 1, 1, 1, 1,
-0.9241548, -0.6444387, -2.367033, 1, 1, 1, 1, 1,
-0.9231911, -1.326969, -5.080036, 1, 1, 1, 1, 1,
-0.9221243, -0.9903462, -2.2074, 1, 1, 1, 1, 1,
-0.921279, 1.284005, 0.1277594, 1, 1, 1, 1, 1,
-0.921049, -0.4825546, -2.424127, 1, 1, 1, 1, 1,
-0.9153473, 0.6738089, -1.984385, 1, 1, 1, 1, 1,
-0.9145855, -0.3078976, -2.519255, 1, 1, 1, 1, 1,
-0.9122058, 2.16359, -0.4991221, 1, 1, 1, 1, 1,
-0.9020037, -1.462556, -3.136726, 1, 1, 1, 1, 1,
-0.9017427, 0.8103424, 1.045187, 1, 1, 1, 1, 1,
-0.8966467, -1.048127, -2.266552, 1, 1, 1, 1, 1,
-0.8939753, -0.3694474, -1.724349, 1, 1, 1, 1, 1,
-0.8924276, 0.3302435, -0.2391857, 0, 0, 1, 1, 1,
-0.8879405, -1.195416, -4.352998, 1, 0, 0, 1, 1,
-0.8863613, 1.541842, 0.3832158, 1, 0, 0, 1, 1,
-0.8823492, 0.1287584, -2.067964, 1, 0, 0, 1, 1,
-0.8812791, 1.92627, -0.3347197, 1, 0, 0, 1, 1,
-0.8803551, -0.2341802, -2.334759, 1, 0, 0, 1, 1,
-0.8734426, -0.9006237, -2.91598, 0, 0, 0, 1, 1,
-0.8717981, 2.353595, -0.7775944, 0, 0, 0, 1, 1,
-0.8691337, 0.8900499, -3.434884, 0, 0, 0, 1, 1,
-0.8681983, -1.121993, -2.70036, 0, 0, 0, 1, 1,
-0.8661305, -0.2386201, -1.141906, 0, 0, 0, 1, 1,
-0.8654175, -0.3614652, -2.333363, 0, 0, 0, 1, 1,
-0.8635235, -0.01557203, -0.380073, 0, 0, 0, 1, 1,
-0.8631727, -1.019255, -1.508063, 1, 1, 1, 1, 1,
-0.8586258, -1.769199, -1.503336, 1, 1, 1, 1, 1,
-0.857496, -0.1144113, -0.9993696, 1, 1, 1, 1, 1,
-0.8450548, -0.6720372, -2.289271, 1, 1, 1, 1, 1,
-0.8443223, -1.094606, -2.228266, 1, 1, 1, 1, 1,
-0.8429827, 0.6746781, -0.5149292, 1, 1, 1, 1, 1,
-0.8260316, -1.056761, -4.320943, 1, 1, 1, 1, 1,
-0.8195775, -0.5541138, -1.97945, 1, 1, 1, 1, 1,
-0.8075512, -0.5473839, -2.214459, 1, 1, 1, 1, 1,
-0.8059546, -0.05435231, -1.555102, 1, 1, 1, 1, 1,
-0.7999837, 0.8877854, 0.5986339, 1, 1, 1, 1, 1,
-0.7926629, -1.536179, -2.62994, 1, 1, 1, 1, 1,
-0.7895502, 0.5526437, -1.846428, 1, 1, 1, 1, 1,
-0.78934, -0.9933838, -2.751981, 1, 1, 1, 1, 1,
-0.78548, -0.06440669, -3.113259, 1, 1, 1, 1, 1,
-0.7844983, 0.3989635, -2.356709, 0, 0, 1, 1, 1,
-0.7757713, -0.1948004, -2.254479, 1, 0, 0, 1, 1,
-0.7744894, -1.091587, -2.359344, 1, 0, 0, 1, 1,
-0.7700278, -0.4371317, -2.410632, 1, 0, 0, 1, 1,
-0.7670966, 1.318207, -3.085971, 1, 0, 0, 1, 1,
-0.7667401, 0.1006929, -1.38493, 1, 0, 0, 1, 1,
-0.7643249, 1.948333, -1.128567, 0, 0, 0, 1, 1,
-0.7637759, 1.202128, -0.3840134, 0, 0, 0, 1, 1,
-0.7602288, 0.1623278, -0.7804552, 0, 0, 0, 1, 1,
-0.7597102, 0.7369381, -0.1223886, 0, 0, 0, 1, 1,
-0.7552643, -0.7242952, -3.51253, 0, 0, 0, 1, 1,
-0.753966, -0.2221389, -2.217089, 0, 0, 0, 1, 1,
-0.7522377, 0.3839961, -0.8158687, 0, 0, 0, 1, 1,
-0.7470174, -1.427738, -0.781762, 1, 1, 1, 1, 1,
-0.7450442, 0.9192187, -0.7643839, 1, 1, 1, 1, 1,
-0.7436963, 0.6813692, -0.1146818, 1, 1, 1, 1, 1,
-0.7416557, 0.2041642, -1.784416, 1, 1, 1, 1, 1,
-0.7366465, 1.858109, -0.5483644, 1, 1, 1, 1, 1,
-0.7340314, 0.8221518, 0.3385521, 1, 1, 1, 1, 1,
-0.7321242, 0.2831689, -1.191962, 1, 1, 1, 1, 1,
-0.7301893, 0.9442243, -2.304379, 1, 1, 1, 1, 1,
-0.7292144, 1.041461, -1.832797, 1, 1, 1, 1, 1,
-0.7289844, -0.511314, 0.1261288, 1, 1, 1, 1, 1,
-0.7233884, 1.227802, -0.2841825, 1, 1, 1, 1, 1,
-0.7227647, 0.9727212, 0.221687, 1, 1, 1, 1, 1,
-0.7224872, -0.8719758, -2.863765, 1, 1, 1, 1, 1,
-0.7184725, 0.9340581, -0.2114636, 1, 1, 1, 1, 1,
-0.7167348, 0.2736137, 1.279901, 1, 1, 1, 1, 1,
-0.7166024, -0.7481983, -2.870734, 0, 0, 1, 1, 1,
-0.7135538, -1.686026, -2.421595, 1, 0, 0, 1, 1,
-0.7121221, -0.1502819, -3.381055, 1, 0, 0, 1, 1,
-0.7107333, -0.7132195, -2.262961, 1, 0, 0, 1, 1,
-0.7030695, -0.5410112, -2.619123, 1, 0, 0, 1, 1,
-0.6996342, -1.413837, -2.228858, 1, 0, 0, 1, 1,
-0.6975952, -0.9282852, -2.542311, 0, 0, 0, 1, 1,
-0.6964215, 1.076954, -0.1432208, 0, 0, 0, 1, 1,
-0.6942596, 0.4927574, -1.507458, 0, 0, 0, 1, 1,
-0.6934475, 1.330597, -0.608665, 0, 0, 0, 1, 1,
-0.6867083, -0.6030351, -4.727106, 0, 0, 0, 1, 1,
-0.685809, -0.4638105, -2.266612, 0, 0, 0, 1, 1,
-0.6837348, 0.4376643, -0.1152966, 0, 0, 0, 1, 1,
-0.6812208, -0.4864413, -2.566545, 1, 1, 1, 1, 1,
-0.6780302, -0.5171728, -1.202237, 1, 1, 1, 1, 1,
-0.6694055, 0.174201, -0.3177212, 1, 1, 1, 1, 1,
-0.6686893, -2.302794, -2.388028, 1, 1, 1, 1, 1,
-0.6572263, -0.4334173, -1.733715, 1, 1, 1, 1, 1,
-0.6546773, 1.016813, 0.5456195, 1, 1, 1, 1, 1,
-0.6533393, 2.750348, -1.08055, 1, 1, 1, 1, 1,
-0.6502053, -0.7701425, -4.499919, 1, 1, 1, 1, 1,
-0.6457769, -1.17307, -3.420424, 1, 1, 1, 1, 1,
-0.6436711, 0.7126616, 0.4068245, 1, 1, 1, 1, 1,
-0.643618, 2.782729, 0.6312079, 1, 1, 1, 1, 1,
-0.6394517, -1.361889, -3.911669, 1, 1, 1, 1, 1,
-0.6392448, 0.3761944, -0.04673112, 1, 1, 1, 1, 1,
-0.6372008, -0.1218594, -0.4092712, 1, 1, 1, 1, 1,
-0.6369912, 1.311632, -1.16694, 1, 1, 1, 1, 1,
-0.6333013, -1.01341, -2.07466, 0, 0, 1, 1, 1,
-0.6310378, -0.09440427, -3.23313, 1, 0, 0, 1, 1,
-0.6291971, -0.06524255, -1.425186, 1, 0, 0, 1, 1,
-0.6282793, -0.05658388, -1.564448, 1, 0, 0, 1, 1,
-0.6191487, -0.9670607, -1.133508, 1, 0, 0, 1, 1,
-0.6176419, 0.6891038, 0.02256118, 1, 0, 0, 1, 1,
-0.6139722, 0.9097829, -1.379268, 0, 0, 0, 1, 1,
-0.6131873, -2.324085, -4.576589, 0, 0, 0, 1, 1,
-0.6096896, 0.08991411, -1.505851, 0, 0, 0, 1, 1,
-0.6049491, -0.1733326, -1.490932, 0, 0, 0, 1, 1,
-0.6035029, -0.2656679, -0.3939161, 0, 0, 0, 1, 1,
-0.5972984, -1.04024, -2.133556, 0, 0, 0, 1, 1,
-0.5952489, 0.2406568, -3.193737, 0, 0, 0, 1, 1,
-0.5892164, -1.160809, -4.011211, 1, 1, 1, 1, 1,
-0.589193, 2.307741, -0.9028008, 1, 1, 1, 1, 1,
-0.58696, 0.1991073, -2.631044, 1, 1, 1, 1, 1,
-0.5867361, -0.1533236, -2.965009, 1, 1, 1, 1, 1,
-0.5853008, 0.8264262, -0.174981, 1, 1, 1, 1, 1,
-0.5847917, -0.001250218, -1.633385, 1, 1, 1, 1, 1,
-0.5821457, 0.223874, -1.147886, 1, 1, 1, 1, 1,
-0.5788653, 0.4478343, 0.8426392, 1, 1, 1, 1, 1,
-0.5774937, -0.6293278, -2.753688, 1, 1, 1, 1, 1,
-0.5650613, 1.059869, -0.8431499, 1, 1, 1, 1, 1,
-0.5634091, 0.5663345, -0.5991385, 1, 1, 1, 1, 1,
-0.5625718, -2.876904, -3.331826, 1, 1, 1, 1, 1,
-0.5593336, -0.302853, -3.136353, 1, 1, 1, 1, 1,
-0.5469129, 0.008475286, -2.77359, 1, 1, 1, 1, 1,
-0.546667, 1.372595, -0.5588052, 1, 1, 1, 1, 1,
-0.5439152, -1.757759, -2.907355, 0, 0, 1, 1, 1,
-0.5420256, -0.2696524, -2.450207, 1, 0, 0, 1, 1,
-0.5357705, 1.513829, -0.1365512, 1, 0, 0, 1, 1,
-0.5342928, 0.6135727, 0.1234812, 1, 0, 0, 1, 1,
-0.5331126, 0.7754672, 0.4291412, 1, 0, 0, 1, 1,
-0.5292886, -0.4816216, -1.776345, 1, 0, 0, 1, 1,
-0.5292515, -0.4564004, -1.06781, 0, 0, 0, 1, 1,
-0.5291538, 0.4347997, -2.223888, 0, 0, 0, 1, 1,
-0.5279041, 0.5797557, -0.8902525, 0, 0, 0, 1, 1,
-0.5226315, -0.2132944, -3.045857, 0, 0, 0, 1, 1,
-0.5224704, 0.682057, -1.108627, 0, 0, 0, 1, 1,
-0.5217313, -1.385544, -1.530222, 0, 0, 0, 1, 1,
-0.5214077, -0.5955575, -1.903519, 0, 0, 0, 1, 1,
-0.5182238, 0.2938202, -1.652516, 1, 1, 1, 1, 1,
-0.5179524, -0.4495903, -1.204765, 1, 1, 1, 1, 1,
-0.5173944, 0.07758486, 0.09901329, 1, 1, 1, 1, 1,
-0.5170459, 0.1481577, 0.402818, 1, 1, 1, 1, 1,
-0.5168837, -1.148552, -3.313766, 1, 1, 1, 1, 1,
-0.5154838, -1.784355, -2.944998, 1, 1, 1, 1, 1,
-0.5150313, -1.648506, -1.679107, 1, 1, 1, 1, 1,
-0.5113035, 0.6730266, -1.84661, 1, 1, 1, 1, 1,
-0.5105432, 2.614248, 0.582575, 1, 1, 1, 1, 1,
-0.5096523, -1.277546, -2.700042, 1, 1, 1, 1, 1,
-0.5066315, 0.1290534, 0.3599152, 1, 1, 1, 1, 1,
-0.5060593, 0.2050913, -0.8610287, 1, 1, 1, 1, 1,
-0.5053284, 1.737049, -0.3987619, 1, 1, 1, 1, 1,
-0.5043042, 0.2062247, -0.8235738, 1, 1, 1, 1, 1,
-0.4990473, -1.019406, -3.468585, 1, 1, 1, 1, 1,
-0.4952615, -0.2808081, -1.989178, 0, 0, 1, 1, 1,
-0.492087, -1.080733, -3.395581, 1, 0, 0, 1, 1,
-0.4878965, -0.9596319, -2.513109, 1, 0, 0, 1, 1,
-0.4864746, 1.285308, -0.2532555, 1, 0, 0, 1, 1,
-0.4861391, -0.1726647, -0.4531839, 1, 0, 0, 1, 1,
-0.4852275, 0.0666941, -1.019258, 1, 0, 0, 1, 1,
-0.4837521, 0.6099012, -2.228983, 0, 0, 0, 1, 1,
-0.4810766, -0.1157092, -1.756884, 0, 0, 0, 1, 1,
-0.4808724, 0.5727646, -1.127477, 0, 0, 0, 1, 1,
-0.4808007, 0.9891638, -0.8761281, 0, 0, 0, 1, 1,
-0.4772673, -1.047514, -2.38904, 0, 0, 0, 1, 1,
-0.4769807, 0.1438777, -0.9285335, 0, 0, 0, 1, 1,
-0.4689725, -1.342064, -5.20173, 0, 0, 0, 1, 1,
-0.4634976, 0.2099637, -1.812051, 1, 1, 1, 1, 1,
-0.4608658, 1.262481, -0.9748126, 1, 1, 1, 1, 1,
-0.4551774, -0.5725297, -4.146478, 1, 1, 1, 1, 1,
-0.4498688, -2.207601, -3.274173, 1, 1, 1, 1, 1,
-0.4496345, 0.4369165, -2.11276, 1, 1, 1, 1, 1,
-0.4491507, 1.475079, -0.215847, 1, 1, 1, 1, 1,
-0.4460015, 0.001774076, -0.8956929, 1, 1, 1, 1, 1,
-0.4455454, -0.6507066, -1.564013, 1, 1, 1, 1, 1,
-0.4451623, 0.2373932, 0.9576358, 1, 1, 1, 1, 1,
-0.4419403, 0.6518158, -0.8778903, 1, 1, 1, 1, 1,
-0.4384863, 0.06600588, -0.494458, 1, 1, 1, 1, 1,
-0.4375127, 0.3672118, -1.905739, 1, 1, 1, 1, 1,
-0.4362427, 0.3899062, 0.9999578, 1, 1, 1, 1, 1,
-0.4362169, 0.3576621, -2.275511, 1, 1, 1, 1, 1,
-0.4288477, 2.779568, 1.151974, 1, 1, 1, 1, 1,
-0.4273577, 0.6891816, -1.271872, 0, 0, 1, 1, 1,
-0.4236453, -0.07642503, -0.8232296, 1, 0, 0, 1, 1,
-0.423203, 1.165145, 0.6380485, 1, 0, 0, 1, 1,
-0.4208201, -0.5251757, -2.019717, 1, 0, 0, 1, 1,
-0.4177139, 0.9944071, 0.9266153, 1, 0, 0, 1, 1,
-0.4173577, -0.403261, -2.047568, 1, 0, 0, 1, 1,
-0.4127521, 0.06351966, -2.927108, 0, 0, 0, 1, 1,
-0.4066532, 0.3314402, 0.7971681, 0, 0, 0, 1, 1,
-0.4059647, -0.4096618, -2.404129, 0, 0, 0, 1, 1,
-0.4031666, 0.5477505, -0.6968136, 0, 0, 0, 1, 1,
-0.4024613, -1.293191, -4.793347, 0, 0, 0, 1, 1,
-0.4002221, 0.7902933, 2.327242, 0, 0, 0, 1, 1,
-0.3959271, 0.2927527, -1.39856, 0, 0, 0, 1, 1,
-0.3954357, -0.119525, -3.125918, 1, 1, 1, 1, 1,
-0.3906547, 3.029759, -1.959713, 1, 1, 1, 1, 1,
-0.3898677, -2.104235, -4.554183, 1, 1, 1, 1, 1,
-0.3893021, -0.3961635, -2.777975, 1, 1, 1, 1, 1,
-0.3847465, 1.056053, -1.012659, 1, 1, 1, 1, 1,
-0.3842088, -0.298892, -1.680876, 1, 1, 1, 1, 1,
-0.3838709, -1.376963, -2.744816, 1, 1, 1, 1, 1,
-0.3824013, 2.068261, 0.8577304, 1, 1, 1, 1, 1,
-0.3820529, -0.3731062, -3.758205, 1, 1, 1, 1, 1,
-0.3708878, -0.01513329, -2.190159, 1, 1, 1, 1, 1,
-0.3659864, 1.201015, 1.782059, 1, 1, 1, 1, 1,
-0.348455, -0.8469455, -2.274457, 1, 1, 1, 1, 1,
-0.3416824, -2.761871, -3.711611, 1, 1, 1, 1, 1,
-0.3402205, -0.8142197, -4.179375, 1, 1, 1, 1, 1,
-0.336719, 0.07164277, -0.2562053, 1, 1, 1, 1, 1,
-0.3234424, -0.9246387, -2.673841, 0, 0, 1, 1, 1,
-0.3188704, 2.5233, 0.2512141, 1, 0, 0, 1, 1,
-0.3180415, -0.4226826, -2.810512, 1, 0, 0, 1, 1,
-0.3171791, -0.8538595, -3.447475, 1, 0, 0, 1, 1,
-0.3152642, 1.287516, -1.469629, 1, 0, 0, 1, 1,
-0.3143025, -0.431942, -2.574815, 1, 0, 0, 1, 1,
-0.3130629, -0.6523249, -3.751889, 0, 0, 0, 1, 1,
-0.3095469, 0.2379854, -1.761304, 0, 0, 0, 1, 1,
-0.3046225, -3.398267, -3.051067, 0, 0, 0, 1, 1,
-0.3032402, 0.339145, 0.2206622, 0, 0, 0, 1, 1,
-0.299992, 0.4815941, 0.03447746, 0, 0, 0, 1, 1,
-0.2965199, -0.2160911, -1.246225, 0, 0, 0, 1, 1,
-0.2950163, -0.5487306, -1.648723, 0, 0, 0, 1, 1,
-0.2900862, 1.147251, 0.4306491, 1, 1, 1, 1, 1,
-0.2855165, -0.5090916, -2.184642, 1, 1, 1, 1, 1,
-0.2852491, 1.171424, -0.6498678, 1, 1, 1, 1, 1,
-0.279236, 1.146479, 0.1787615, 1, 1, 1, 1, 1,
-0.2779413, 0.1550003, -1.976709, 1, 1, 1, 1, 1,
-0.2744626, -0.06665269, -3.152292, 1, 1, 1, 1, 1,
-0.2742248, 0.1336327, -2.460786, 1, 1, 1, 1, 1,
-0.2710085, -0.1972867, -0.4715277, 1, 1, 1, 1, 1,
-0.2695752, -1.011262, -3.965345, 1, 1, 1, 1, 1,
-0.2678645, 0.8717715, -1.055064, 1, 1, 1, 1, 1,
-0.2593315, -0.5239704, -1.649505, 1, 1, 1, 1, 1,
-0.258422, 0.7407278, -0.9070105, 1, 1, 1, 1, 1,
-0.2565562, 0.347933, -1.639839, 1, 1, 1, 1, 1,
-0.2546514, -0.6407993, -2.917663, 1, 1, 1, 1, 1,
-0.2539549, 0.7757856, -0.1004273, 1, 1, 1, 1, 1,
-0.2513236, 0.2503591, -1.768087, 0, 0, 1, 1, 1,
-0.2501502, 0.4808482, -0.1889722, 1, 0, 0, 1, 1,
-0.243355, -0.8071619, -2.988201, 1, 0, 0, 1, 1,
-0.2432725, 0.2278356, -2.422542, 1, 0, 0, 1, 1,
-0.2411151, -0.2440317, -2.122346, 1, 0, 0, 1, 1,
-0.2392997, 0.6463601, -1.451911, 1, 0, 0, 1, 1,
-0.2272378, -0.3675705, -2.974257, 0, 0, 0, 1, 1,
-0.2230185, 0.01790753, -0.9457627, 0, 0, 0, 1, 1,
-0.2216967, 0.7739227, -0.8845891, 0, 0, 0, 1, 1,
-0.2209269, -2.745196, -2.333126, 0, 0, 0, 1, 1,
-0.2158428, -0.0624158, -2.65062, 0, 0, 0, 1, 1,
-0.2042198, -0.2485827, -3.347043, 0, 0, 0, 1, 1,
-0.2013253, -0.1418093, -3.823258, 0, 0, 0, 1, 1,
-0.1992736, 0.1881449, -2.574754, 1, 1, 1, 1, 1,
-0.1951182, 0.941631, 0.783545, 1, 1, 1, 1, 1,
-0.1948918, 1.299752, 0.4741684, 1, 1, 1, 1, 1,
-0.194626, 0.4428479, -0.06721739, 1, 1, 1, 1, 1,
-0.1918341, -1.9973, -1.949516, 1, 1, 1, 1, 1,
-0.1878377, 2.135726, -1.381778, 1, 1, 1, 1, 1,
-0.1871784, -1.176821, -4.32549, 1, 1, 1, 1, 1,
-0.1809946, -0.8386223, -2.305241, 1, 1, 1, 1, 1,
-0.1780275, 0.5532776, 1.429974, 1, 1, 1, 1, 1,
-0.1778116, 0.5334143, 0.09906357, 1, 1, 1, 1, 1,
-0.1775472, -1.086906, -1.089803, 1, 1, 1, 1, 1,
-0.1692286, 0.2515724, -1.024524, 1, 1, 1, 1, 1,
-0.1650328, 0.5123276, 0.5592006, 1, 1, 1, 1, 1,
-0.1626856, -0.1312556, -1.877327, 1, 1, 1, 1, 1,
-0.1626192, 1.454279, 0.7346358, 1, 1, 1, 1, 1,
-0.1488525, 0.9200377, -0.806843, 0, 0, 1, 1, 1,
-0.1482431, -0.7825781, -4.326251, 1, 0, 0, 1, 1,
-0.1349805, -0.5374011, -2.228835, 1, 0, 0, 1, 1,
-0.1347201, -1.603546, -1.157022, 1, 0, 0, 1, 1,
-0.1327327, 1.251535, 1.291451, 1, 0, 0, 1, 1,
-0.1309809, 0.08584202, -0.6074845, 1, 0, 0, 1, 1,
-0.130662, 0.1147054, -1.075835, 0, 0, 0, 1, 1,
-0.130651, 0.5042987, 0.82265, 0, 0, 0, 1, 1,
-0.1266014, -0.8262062, -1.546043, 0, 0, 0, 1, 1,
-0.1262539, -0.9523457, -1.942672, 0, 0, 0, 1, 1,
-0.1259602, 0.3391845, -1.000165, 0, 0, 0, 1, 1,
-0.1241363, 0.04490642, -1.218797, 0, 0, 0, 1, 1,
-0.1233586, -0.4070106, -2.653088, 0, 0, 0, 1, 1,
-0.1227175, 0.397791, -0.9764702, 1, 1, 1, 1, 1,
-0.122396, 0.7329025, 0.9788607, 1, 1, 1, 1, 1,
-0.1218287, -0.8041676, -2.235282, 1, 1, 1, 1, 1,
-0.1168961, -1.146158, -2.01853, 1, 1, 1, 1, 1,
-0.1139875, 0.7675959, 0.2972176, 1, 1, 1, 1, 1,
-0.1134574, -0.8569185, -3.382776, 1, 1, 1, 1, 1,
-0.1099003, 1.059154, -2.013201, 1, 1, 1, 1, 1,
-0.1092395, 0.48951, -3.318249, 1, 1, 1, 1, 1,
-0.106834, -0.4191849, -2.750823, 1, 1, 1, 1, 1,
-0.1032544, 0.2803055, -1.565917, 1, 1, 1, 1, 1,
-0.1019972, -0.9491892, -1.756918, 1, 1, 1, 1, 1,
-0.09927853, -0.6523666, -4.206022, 1, 1, 1, 1, 1,
-0.09291609, 0.5787669, 1.086455, 1, 1, 1, 1, 1,
-0.09178148, 0.5004751, -1.998624, 1, 1, 1, 1, 1,
-0.08964683, -0.8251182, -2.283271, 1, 1, 1, 1, 1,
-0.08394845, -1.373631, -1.505549, 0, 0, 1, 1, 1,
-0.08202007, -0.6068345, -1.883526, 1, 0, 0, 1, 1,
-0.08066621, -0.8613493, -1.883775, 1, 0, 0, 1, 1,
-0.0769093, 2.940237, -1.99543, 1, 0, 0, 1, 1,
-0.07175847, 0.7517117, 0.2866308, 1, 0, 0, 1, 1,
-0.06925336, 1.422862, -0.2218791, 1, 0, 0, 1, 1,
-0.05689991, 1.644582, 0.1786677, 0, 0, 0, 1, 1,
-0.04913257, 0.4627279, -0.1191151, 0, 0, 0, 1, 1,
-0.04849014, -0.7517409, -1.640857, 0, 0, 0, 1, 1,
-0.0380819, -0.0440182, -2.164357, 0, 0, 0, 1, 1,
-0.03658744, -0.2074386, -2.34969, 0, 0, 0, 1, 1,
-0.03637749, -1.502501, -2.943355, 0, 0, 0, 1, 1,
-0.03169445, -0.4249727, -2.559979, 0, 0, 0, 1, 1,
-0.03013376, -1.649816, -3.590761, 1, 1, 1, 1, 1,
-0.03011995, -0.1030246, -2.529222, 1, 1, 1, 1, 1,
-0.02698576, 0.8281663, 0.2751361, 1, 1, 1, 1, 1,
-0.023389, 2.049036, -0.4771177, 1, 1, 1, 1, 1,
-0.02158049, -0.9068261, -4.636089, 1, 1, 1, 1, 1,
-0.01901446, -0.9436521, -2.811495, 1, 1, 1, 1, 1,
-0.01748739, -1.456705, -2.771496, 1, 1, 1, 1, 1,
-0.0154108, 0.1224314, -1.484235, 1, 1, 1, 1, 1,
-0.01430135, 0.2120652, -1.983214, 1, 1, 1, 1, 1,
-0.01366449, 0.2888352, -0.7772926, 1, 1, 1, 1, 1,
-0.01021019, -0.1021724, -4.00355, 1, 1, 1, 1, 1,
-0.01000861, -0.07942925, -2.637383, 1, 1, 1, 1, 1,
-0.00998427, 0.5472528, 0.6135539, 1, 1, 1, 1, 1,
-0.002765181, -1.560785, -3.444146, 1, 1, 1, 1, 1,
-0.001230053, -0.5154339, -4.695855, 1, 1, 1, 1, 1,
-0.0006839222, -1.139391, -3.451116, 0, 0, 1, 1, 1,
-0.0002505879, -0.005053903, -3.758229, 1, 0, 0, 1, 1,
0.0003750536, -0.3770871, 2.81215, 1, 0, 0, 1, 1,
0.001183291, 1.632793, 0.877705, 1, 0, 0, 1, 1,
0.001429313, 0.6688911, -0.5152359, 1, 0, 0, 1, 1,
0.006819288, -0.583029, 2.729953, 1, 0, 0, 1, 1,
0.01052762, -0.9863861, 3.351362, 0, 0, 0, 1, 1,
0.01184998, -1.203939, 3.827233, 0, 0, 0, 1, 1,
0.01253464, 1.49753, -1.518166, 0, 0, 0, 1, 1,
0.01428886, 2.123578, -0.9419912, 0, 0, 0, 1, 1,
0.01431144, 0.664862, 0.05057941, 0, 0, 0, 1, 1,
0.01590978, -0.9839873, 3.674024, 0, 0, 0, 1, 1,
0.01900813, -0.1729253, 1.786964, 0, 0, 0, 1, 1,
0.02174691, -1.568378, 4.242163, 1, 1, 1, 1, 1,
0.02621598, 1.373768, -2.607407, 1, 1, 1, 1, 1,
0.02760807, -0.2714804, 4.729267, 1, 1, 1, 1, 1,
0.02963787, -1.513654, 1.732273, 1, 1, 1, 1, 1,
0.03229988, -0.420793, 1.791199, 1, 1, 1, 1, 1,
0.03319989, 0.5403159, 0.9557266, 1, 1, 1, 1, 1,
0.03565278, 0.3644826, -2.456534, 1, 1, 1, 1, 1,
0.03689626, -1.204695, 3.950466, 1, 1, 1, 1, 1,
0.03727705, 0.3525437, -1.170932, 1, 1, 1, 1, 1,
0.03887355, 0.7383875, -0.8333465, 1, 1, 1, 1, 1,
0.03904133, -0.4783236, 3.118482, 1, 1, 1, 1, 1,
0.03936125, 2.382141, 0.3716106, 1, 1, 1, 1, 1,
0.0399231, 0.3472046, -0.5457936, 1, 1, 1, 1, 1,
0.04159421, 1.566706, -0.1666206, 1, 1, 1, 1, 1,
0.04472353, 0.7036082, -0.27915, 1, 1, 1, 1, 1,
0.04657063, 0.4147923, 0.7890761, 0, 0, 1, 1, 1,
0.0487835, -1.047343, 3.587329, 1, 0, 0, 1, 1,
0.0507369, -0.4130397, 3.207745, 1, 0, 0, 1, 1,
0.05129327, -0.8386981, 3.420865, 1, 0, 0, 1, 1,
0.05196421, -0.6698749, 2.989434, 1, 0, 0, 1, 1,
0.05370048, 0.4890687, 0.4209906, 1, 0, 0, 1, 1,
0.05772182, -0.4340385, 4.143163, 0, 0, 0, 1, 1,
0.06213802, -2.241195, 2.341066, 0, 0, 0, 1, 1,
0.06379859, 0.7736073, 0.236959, 0, 0, 0, 1, 1,
0.06838799, 1.586638, 1.613136, 0, 0, 0, 1, 1,
0.06998051, 0.1883849, 1.115707, 0, 0, 0, 1, 1,
0.07294074, 0.3131136, 0.3046008, 0, 0, 0, 1, 1,
0.07405942, 0.3860838, 1.971394, 0, 0, 0, 1, 1,
0.07527394, 0.4823186, 0.7957937, 1, 1, 1, 1, 1,
0.07561198, 1.465791, 2.654098, 1, 1, 1, 1, 1,
0.08189396, -0.6730906, 1.845305, 1, 1, 1, 1, 1,
0.08274546, -0.1508504, 2.520613, 1, 1, 1, 1, 1,
0.0842528, -2.273768, 4.325145, 1, 1, 1, 1, 1,
0.09263759, -0.8323021, 3.189549, 1, 1, 1, 1, 1,
0.09628197, 0.9929402, 0.8974714, 1, 1, 1, 1, 1,
0.09812108, 0.5990813, -0.5297849, 1, 1, 1, 1, 1,
0.1025093, -1.614732, 2.350268, 1, 1, 1, 1, 1,
0.1044245, -0.3703098, 3.458063, 1, 1, 1, 1, 1,
0.1045309, -0.9196818, 3.51659, 1, 1, 1, 1, 1,
0.1052075, -0.5217423, 1.031868, 1, 1, 1, 1, 1,
0.1063893, 1.994994, 0.2012261, 1, 1, 1, 1, 1,
0.1164462, -0.8439869, 1.299057, 1, 1, 1, 1, 1,
0.1185494, 0.7414782, 1.161303, 1, 1, 1, 1, 1,
0.1239667, 0.2563991, 1.347969, 0, 0, 1, 1, 1,
0.1283015, 0.5264781, 0.4318374, 1, 0, 0, 1, 1,
0.130431, 0.07047631, 0.7664328, 1, 0, 0, 1, 1,
0.1338635, 1.17469, -0.03440685, 1, 0, 0, 1, 1,
0.1358581, -0.6947694, 0.7705181, 1, 0, 0, 1, 1,
0.1359016, -0.8264587, 2.825301, 1, 0, 0, 1, 1,
0.1361226, 1.03089, 2.354773, 0, 0, 0, 1, 1,
0.1365232, -0.09984417, 1.710627, 0, 0, 0, 1, 1,
0.1374312, 0.1119101, 0.5920032, 0, 0, 0, 1, 1,
0.1427722, -0.7770088, 4.196778, 0, 0, 0, 1, 1,
0.1431055, -0.5122377, 3.367709, 0, 0, 0, 1, 1,
0.1455142, 0.583624, -1.036376, 0, 0, 0, 1, 1,
0.1460558, -0.7717146, 1.762153, 0, 0, 0, 1, 1,
0.146368, 0.1093359, 0.952828, 1, 1, 1, 1, 1,
0.1506172, -0.178612, 2.242723, 1, 1, 1, 1, 1,
0.1509697, -0.4032321, 2.417834, 1, 1, 1, 1, 1,
0.1524918, 1.394644, -0.3671544, 1, 1, 1, 1, 1,
0.1545591, 0.2293415, 1.211202, 1, 1, 1, 1, 1,
0.1549764, -0.5894415, 2.053064, 1, 1, 1, 1, 1,
0.1561359, 0.07864553, 0.9447478, 1, 1, 1, 1, 1,
0.1622209, -0.1609152, 3.249068, 1, 1, 1, 1, 1,
0.1695046, 0.05767154, 2.341558, 1, 1, 1, 1, 1,
0.172316, -0.5769234, 2.094741, 1, 1, 1, 1, 1,
0.1737471, -0.350373, 4.359927, 1, 1, 1, 1, 1,
0.176837, 0.02969624, 0.004923836, 1, 1, 1, 1, 1,
0.1776902, 1.358088, -0.1245723, 1, 1, 1, 1, 1,
0.182691, -0.8236113, 3.654841, 1, 1, 1, 1, 1,
0.1942067, -0.318255, 3.273856, 1, 1, 1, 1, 1,
0.1998334, 0.1583708, -0.4807277, 0, 0, 1, 1, 1,
0.2066504, -1.205339, 4.15554, 1, 0, 0, 1, 1,
0.2147543, 0.732282, -0.5607548, 1, 0, 0, 1, 1,
0.2189229, -1.11513, 3.884955, 1, 0, 0, 1, 1,
0.2204124, -2.577832, 2.503145, 1, 0, 0, 1, 1,
0.2216431, -3.439338, 5.160403, 1, 0, 0, 1, 1,
0.2222229, 1.586893, 0.6976001, 0, 0, 0, 1, 1,
0.2241172, -1.241808, 3.490254, 0, 0, 0, 1, 1,
0.2264301, -0.1166807, 0.6504038, 0, 0, 0, 1, 1,
0.2264591, 1.338473, -0.1924757, 0, 0, 0, 1, 1,
0.2320136, -0.2047421, 0.5164351, 0, 0, 0, 1, 1,
0.2334834, 0.8110688, 0.0005006504, 0, 0, 0, 1, 1,
0.2397823, -0.9775621, 5.11526, 0, 0, 0, 1, 1,
0.2430621, 0.1982793, 1.475567, 1, 1, 1, 1, 1,
0.2452111, 0.547712, 0.7478587, 1, 1, 1, 1, 1,
0.248516, -0.2836074, 1.658751, 1, 1, 1, 1, 1,
0.2514267, -1.705717, 2.703793, 1, 1, 1, 1, 1,
0.2523423, -0.4895208, 3.757021, 1, 1, 1, 1, 1,
0.2533405, 0.3964983, 0.5107327, 1, 1, 1, 1, 1,
0.2576799, -1.315907, 1.922261, 1, 1, 1, 1, 1,
0.2588534, -0.002969399, 0.8467754, 1, 1, 1, 1, 1,
0.2613271, 1.640578, 0.04475315, 1, 1, 1, 1, 1,
0.2615442, 0.1273479, 1.951725, 1, 1, 1, 1, 1,
0.2647089, 1.472276, 0.8046511, 1, 1, 1, 1, 1,
0.2687505, -1.670159, 1.838976, 1, 1, 1, 1, 1,
0.2704867, -2.134931, 5.078529, 1, 1, 1, 1, 1,
0.2721117, -0.2846787, 3.357656, 1, 1, 1, 1, 1,
0.2804047, 0.9043702, -0.6525738, 1, 1, 1, 1, 1,
0.288136, 0.1181437, 0.7755064, 0, 0, 1, 1, 1,
0.2881564, -0.2787152, 3.183154, 1, 0, 0, 1, 1,
0.2896536, 0.4846345, 1.542351, 1, 0, 0, 1, 1,
0.3012686, 2.115577, -0.3068978, 1, 0, 0, 1, 1,
0.3023599, -1.09841, 1.582582, 1, 0, 0, 1, 1,
0.30408, -1.001388, 1.975452, 1, 0, 0, 1, 1,
0.3048311, 0.0975334, 0.08684644, 0, 0, 0, 1, 1,
0.3089863, 0.5929929, 1.540312, 0, 0, 0, 1, 1,
0.3119249, -0.1471555, 1.991567, 0, 0, 0, 1, 1,
0.3211891, -1.086514, 2.244691, 0, 0, 0, 1, 1,
0.3233561, 0.2039254, -0.7609499, 0, 0, 0, 1, 1,
0.3246447, -0.7968495, 3.722095, 0, 0, 0, 1, 1,
0.3270282, -0.2008201, 3.476498, 0, 0, 0, 1, 1,
0.3289502, -1.37761, 4.457609, 1, 1, 1, 1, 1,
0.331509, -0.2873845, 0.6305631, 1, 1, 1, 1, 1,
0.3319719, -0.9660039, 3.166185, 1, 1, 1, 1, 1,
0.3346149, -0.119811, 2.899491, 1, 1, 1, 1, 1,
0.3356734, 0.6731172, 1.317501, 1, 1, 1, 1, 1,
0.3414162, 0.6802534, 1.920129, 1, 1, 1, 1, 1,
0.3469421, 0.8034325, -2.302763, 1, 1, 1, 1, 1,
0.3494995, -0.9142483, 2.493197, 1, 1, 1, 1, 1,
0.367665, 0.235554, 2.54905, 1, 1, 1, 1, 1,
0.3700884, -1.435549, 2.144797, 1, 1, 1, 1, 1,
0.3706698, -1.108411, 3.283234, 1, 1, 1, 1, 1,
0.3810865, -0.6318226, 3.163527, 1, 1, 1, 1, 1,
0.3845749, -0.8999828, 1.814761, 1, 1, 1, 1, 1,
0.3930184, 1.496498, 0.4961798, 1, 1, 1, 1, 1,
0.3944774, 0.9846143, -2.187121, 1, 1, 1, 1, 1,
0.3999386, 0.1757971, 2.398949, 0, 0, 1, 1, 1,
0.4067574, -0.536215, 0.7294727, 1, 0, 0, 1, 1,
0.406857, 0.168101, -0.5378677, 1, 0, 0, 1, 1,
0.4103537, 0.06580745, 1.64266, 1, 0, 0, 1, 1,
0.4128928, -0.01851857, 0.8598212, 1, 0, 0, 1, 1,
0.415427, 0.4921002, -0.7006298, 1, 0, 0, 1, 1,
0.4169272, 0.0411626, 3.283806, 0, 0, 0, 1, 1,
0.4179872, 0.3856825, 0.1367286, 0, 0, 0, 1, 1,
0.4184559, -0.5594941, 3.383754, 0, 0, 0, 1, 1,
0.4205436, -1.25375, 3.515061, 0, 0, 0, 1, 1,
0.4217603, -2.673639, 3.941787, 0, 0, 0, 1, 1,
0.4230938, -0.1551744, 0.9452921, 0, 0, 0, 1, 1,
0.4236176, -1.276591, 4.455601, 0, 0, 0, 1, 1,
0.4271412, 0.8653994, 0.9127771, 1, 1, 1, 1, 1,
0.4284122, 0.3107536, 1.493643, 1, 1, 1, 1, 1,
0.4298944, -0.6155657, 1.700058, 1, 1, 1, 1, 1,
0.4308286, 0.03632102, 1.293032, 1, 1, 1, 1, 1,
0.4321085, 1.92816, 1.185042, 1, 1, 1, 1, 1,
0.434744, -0.3296439, 0.6891382, 1, 1, 1, 1, 1,
0.4361963, -1.067583, 3.855249, 1, 1, 1, 1, 1,
0.4380296, -0.06988864, 1.545114, 1, 1, 1, 1, 1,
0.4386024, 1.66176, 0.3093019, 1, 1, 1, 1, 1,
0.4403438, -0.5143141, 2.021953, 1, 1, 1, 1, 1,
0.4409747, 0.6795607, 1.295967, 1, 1, 1, 1, 1,
0.4409993, -0.09684286, 2.367665, 1, 1, 1, 1, 1,
0.4424328, 1.398255, -2.705768, 1, 1, 1, 1, 1,
0.4455817, -0.7623205, 2.488389, 1, 1, 1, 1, 1,
0.4490684, 0.5270275, 2.435755, 1, 1, 1, 1, 1,
0.450359, 0.4638655, 0.1685239, 0, 0, 1, 1, 1,
0.453044, -1.818038, 2.779197, 1, 0, 0, 1, 1,
0.4578221, -0.7814719, 3.385523, 1, 0, 0, 1, 1,
0.4617473, 1.156177, 2.291168, 1, 0, 0, 1, 1,
0.4637938, -1.023032, 3.474756, 1, 0, 0, 1, 1,
0.467274, 1.120372, 0.2281034, 1, 0, 0, 1, 1,
0.4717767, 1.203901, 0.7338424, 0, 0, 0, 1, 1,
0.4792507, 0.2073322, 2.091159, 0, 0, 0, 1, 1,
0.4797174, 1.181447, 1.363815, 0, 0, 0, 1, 1,
0.4820684, -0.2375258, 3.022115, 0, 0, 0, 1, 1,
0.4851802, -0.8235543, 2.950078, 0, 0, 0, 1, 1,
0.4869071, 3.286467, -0.318568, 0, 0, 0, 1, 1,
0.4894913, -1.237231, 3.03212, 0, 0, 0, 1, 1,
0.4899651, -1.486514, 3.505703, 1, 1, 1, 1, 1,
0.4932219, -0.1107236, 1.939212, 1, 1, 1, 1, 1,
0.4951755, 0.1012998, 0.144773, 1, 1, 1, 1, 1,
0.4977743, 1.998029, 0.8381988, 1, 1, 1, 1, 1,
0.4994925, -0.1620963, 1.926917, 1, 1, 1, 1, 1,
0.5005447, 1.51995, 0.7466542, 1, 1, 1, 1, 1,
0.5017987, 0.2419115, 0.6819158, 1, 1, 1, 1, 1,
0.5024093, -0.08590585, 1.792165, 1, 1, 1, 1, 1,
0.5035195, -1.124919, 1.953497, 1, 1, 1, 1, 1,
0.5045828, -0.7975323, 3.397042, 1, 1, 1, 1, 1,
0.5130959, 0.7002456, 0.9250779, 1, 1, 1, 1, 1,
0.5155638, -0.2660672, 1.188549, 1, 1, 1, 1, 1,
0.5160999, 0.3788368, -0.2305953, 1, 1, 1, 1, 1,
0.5187042, 0.3729923, 0.6046394, 1, 1, 1, 1, 1,
0.5249629, -0.400933, 2.597445, 1, 1, 1, 1, 1,
0.5278484, 0.8278067, -0.3333681, 0, 0, 1, 1, 1,
0.5286335, 3.289287, -0.1338628, 1, 0, 0, 1, 1,
0.5313355, -1.415584, 2.196703, 1, 0, 0, 1, 1,
0.5346287, -0.2232014, 0.8005386, 1, 0, 0, 1, 1,
0.5348344, -0.4689503, 0.2083471, 1, 0, 0, 1, 1,
0.5353017, -2.342636, 0.8744486, 1, 0, 0, 1, 1,
0.5359238, 1.003166, 0.078224, 0, 0, 0, 1, 1,
0.5393897, -0.02573775, 0.4175184, 0, 0, 0, 1, 1,
0.5449414, -0.1689025, 3.436361, 0, 0, 0, 1, 1,
0.5454644, -0.7449185, 0.9248326, 0, 0, 0, 1, 1,
0.5458261, 0.7161853, 0.222948, 0, 0, 0, 1, 1,
0.5462255, -0.08915302, 2.00031, 0, 0, 0, 1, 1,
0.5467342, -0.8746945, 2.405241, 0, 0, 0, 1, 1,
0.5473672, 0.4092557, 1.062943, 1, 1, 1, 1, 1,
0.5518307, -1.065737, 4.357269, 1, 1, 1, 1, 1,
0.5534037, -0.662228, 1.454691, 1, 1, 1, 1, 1,
0.5575554, -1.844808, 2.156533, 1, 1, 1, 1, 1,
0.5613253, -0.7839978, 2.40709, 1, 1, 1, 1, 1,
0.5625608, -0.3381926, 1.621539, 1, 1, 1, 1, 1,
0.5698317, 1.753228, 0.04392084, 1, 1, 1, 1, 1,
0.5706222, -0.3059314, 1.963108, 1, 1, 1, 1, 1,
0.5734886, -0.003177369, 1.392558, 1, 1, 1, 1, 1,
0.5762503, 0.6163386, 2.018031, 1, 1, 1, 1, 1,
0.5774762, 1.277618, 0.2390288, 1, 1, 1, 1, 1,
0.5784071, -0.8000627, 2.365656, 1, 1, 1, 1, 1,
0.583146, 0.3159737, 2.339634, 1, 1, 1, 1, 1,
0.5894918, -0.07062266, 0.9199065, 1, 1, 1, 1, 1,
0.5895165, -0.2802345, 0.2768287, 1, 1, 1, 1, 1,
0.6078937, 1.203557, -0.04044396, 0, 0, 1, 1, 1,
0.6097785, -2.092342, 3.954835, 1, 0, 0, 1, 1,
0.6137415, 0.3059539, 2.212306, 1, 0, 0, 1, 1,
0.6137739, -0.2231642, 2.601884, 1, 0, 0, 1, 1,
0.623755, 0.4997036, 0.956679, 1, 0, 0, 1, 1,
0.6259226, -1.493447, 3.656939, 1, 0, 0, 1, 1,
0.6282504, -0.2891362, 1.499399, 0, 0, 0, 1, 1,
0.6303455, 0.2252401, 1.571023, 0, 0, 0, 1, 1,
0.6308005, -0.9269921, 3.636806, 0, 0, 0, 1, 1,
0.6329078, 0.6712621, 2.158334, 0, 0, 0, 1, 1,
0.6366171, 1.499203, 0.06351165, 0, 0, 0, 1, 1,
0.6419025, -0.4851932, 4.20177, 0, 0, 0, 1, 1,
0.6420427, 0.1862727, 1.188133, 0, 0, 0, 1, 1,
0.6425912, 0.5132651, 0.6398312, 1, 1, 1, 1, 1,
0.6440014, 0.08326025, 1.223319, 1, 1, 1, 1, 1,
0.6485446, 0.06981274, 1.650382, 1, 1, 1, 1, 1,
0.6497212, -0.3219759, 3.130504, 1, 1, 1, 1, 1,
0.6589563, 0.4209594, 0.3441783, 1, 1, 1, 1, 1,
0.6590556, 0.262465, 1.400931, 1, 1, 1, 1, 1,
0.6605371, -0.8496922, 2.61762, 1, 1, 1, 1, 1,
0.661143, 0.6654432, 0.6460358, 1, 1, 1, 1, 1,
0.6643267, 0.3770527, 0.7977855, 1, 1, 1, 1, 1,
0.6660833, 0.3017258, 2.546344, 1, 1, 1, 1, 1,
0.6667373, -1.238845, 2.295293, 1, 1, 1, 1, 1,
0.6695235, -1.643797, 3.384616, 1, 1, 1, 1, 1,
0.6703514, 0.3027405, 0.9337436, 1, 1, 1, 1, 1,
0.6753107, 0.1768012, 0.5881721, 1, 1, 1, 1, 1,
0.6763312, -0.7413051, 1.117056, 1, 1, 1, 1, 1,
0.6874418, -0.1317306, -0.1860874, 0, 0, 1, 1, 1,
0.6952505, -0.04850673, 2.269209, 1, 0, 0, 1, 1,
0.6954509, 0.6372622, 0.7566101, 1, 0, 0, 1, 1,
0.6982383, 0.04835988, -0.1658446, 1, 0, 0, 1, 1,
0.7003576, 1.050916, -0.3733061, 1, 0, 0, 1, 1,
0.7022318, 0.9997023, -0.2012139, 1, 0, 0, 1, 1,
0.7044161, -0.1469817, 2.227487, 0, 0, 0, 1, 1,
0.7056271, 0.4660785, 2.418565, 0, 0, 0, 1, 1,
0.7074853, 0.7718169, -0.8394819, 0, 0, 0, 1, 1,
0.7100576, 0.119458, 2.015342, 0, 0, 0, 1, 1,
0.7134633, 0.1948012, 1.071704, 0, 0, 0, 1, 1,
0.7134712, 0.3935125, 0.5378554, 0, 0, 0, 1, 1,
0.715262, 1.727234, -0.1499391, 0, 0, 0, 1, 1,
0.7224181, -0.1327218, 4.937813, 1, 1, 1, 1, 1,
0.7236607, -1.004028, 2.439115, 1, 1, 1, 1, 1,
0.7237437, -0.426027, 1.071911, 1, 1, 1, 1, 1,
0.7262257, -0.7578008, 2.228097, 1, 1, 1, 1, 1,
0.7313775, -1.45736, 3.83995, 1, 1, 1, 1, 1,
0.7325982, -1.011994, 1.566038, 1, 1, 1, 1, 1,
0.7356731, 2.09703, 1.368307, 1, 1, 1, 1, 1,
0.7360913, 0.9177682, 0.7694243, 1, 1, 1, 1, 1,
0.7378063, 0.6636771, 1.00996, 1, 1, 1, 1, 1,
0.7383471, -1.975551, 3.218502, 1, 1, 1, 1, 1,
0.7475748, -0.05512845, 2.655584, 1, 1, 1, 1, 1,
0.7512856, 0.6979169, 2.474714, 1, 1, 1, 1, 1,
0.7626745, -1.549755, 2.627839, 1, 1, 1, 1, 1,
0.7646307, 1.182294, 0.6737894, 1, 1, 1, 1, 1,
0.7664979, -0.7113273, 2.72621, 1, 1, 1, 1, 1,
0.7697076, 0.7161556, 1.433185, 0, 0, 1, 1, 1,
0.7725052, -0.6914757, 1.336509, 1, 0, 0, 1, 1,
0.7739061, -1.737972, 2.701923, 1, 0, 0, 1, 1,
0.7743039, 1.596992, 1.449119, 1, 0, 0, 1, 1,
0.7748175, -0.3831837, 3.235173, 1, 0, 0, 1, 1,
0.7781349, 0.01672655, 1.485056, 1, 0, 0, 1, 1,
0.7830245, 0.07267992, 0.51474, 0, 0, 0, 1, 1,
0.788309, -0.1898079, 1.470925, 0, 0, 0, 1, 1,
0.7950553, 0.9530329, 0.5721877, 0, 0, 0, 1, 1,
0.8065264, -0.6624695, 1.95074, 0, 0, 0, 1, 1,
0.8088011, -0.01111129, 1.637066, 0, 0, 0, 1, 1,
0.8095055, -0.6738587, 3.513301, 0, 0, 0, 1, 1,
0.8142453, -0.4883239, 0.8112396, 0, 0, 0, 1, 1,
0.8202475, -1.465714, 3.020688, 1, 1, 1, 1, 1,
0.8227283, -0.09812962, 1.592895, 1, 1, 1, 1, 1,
0.8274895, 0.2932338, 0.3326981, 1, 1, 1, 1, 1,
0.8380768, -0.443914, -0.014511, 1, 1, 1, 1, 1,
0.8383841, 1.16584, 1.047665, 1, 1, 1, 1, 1,
0.8593223, -0.1860265, 3.563941, 1, 1, 1, 1, 1,
0.8640348, -0.3166563, 4.579876, 1, 1, 1, 1, 1,
0.8649248, 0.08339534, 1.336288, 1, 1, 1, 1, 1,
0.865445, -1.524436, 2.705046, 1, 1, 1, 1, 1,
0.872268, 0.5272353, 2.726613, 1, 1, 1, 1, 1,
0.8728702, 0.0387867, 0.9706307, 1, 1, 1, 1, 1,
0.8729677, -0.003955509, 2.393586, 1, 1, 1, 1, 1,
0.8876334, -1.74315, 2.656006, 1, 1, 1, 1, 1,
0.8887873, 0.5223514, 0.797021, 1, 1, 1, 1, 1,
0.9024875, 0.2902814, 0.3916556, 1, 1, 1, 1, 1,
0.9058791, 0.3189466, 1.767824, 0, 0, 1, 1, 1,
0.907886, -1.300597, 1.600188, 1, 0, 0, 1, 1,
0.9162537, -0.198976, 1.094289, 1, 0, 0, 1, 1,
0.9181696, 0.3582574, -0.712768, 1, 0, 0, 1, 1,
0.9197857, -0.55967, 1.628461, 1, 0, 0, 1, 1,
0.9201131, -1.20468, 3.122844, 1, 0, 0, 1, 1,
0.9209234, -0.1213785, 2.407179, 0, 0, 0, 1, 1,
0.9262719, 0.2947599, 0.04915861, 0, 0, 0, 1, 1,
0.9323722, -0.9146575, 3.15641, 0, 0, 0, 1, 1,
0.9332963, 0.2326061, 0.865125, 0, 0, 0, 1, 1,
0.9370104, 0.3051212, 0.4195247, 0, 0, 0, 1, 1,
0.9435117, -0.567723, 2.964764, 0, 0, 0, 1, 1,
0.9533132, -0.1817874, 0.9996032, 0, 0, 0, 1, 1,
0.9539104, 1.139169, -0.7348953, 1, 1, 1, 1, 1,
0.9542226, -0.06937758, 2.501597, 1, 1, 1, 1, 1,
0.9571892, -0.2690062, 0.6344227, 1, 1, 1, 1, 1,
0.9582187, 1.698637, 0.5883064, 1, 1, 1, 1, 1,
0.9599551, -0.01415065, 1.354393, 1, 1, 1, 1, 1,
0.9638478, 0.621228, 0.2126722, 1, 1, 1, 1, 1,
0.9645564, 0.1714821, 0.8316028, 1, 1, 1, 1, 1,
0.964626, 1.072119, 1.003261, 1, 1, 1, 1, 1,
0.9686573, 0.9200622, 0.6332906, 1, 1, 1, 1, 1,
0.9774882, -0.3612069, 2.610061, 1, 1, 1, 1, 1,
0.9792863, -0.5565033, 1.373482, 1, 1, 1, 1, 1,
0.9818354, -0.3018596, 2.242269, 1, 1, 1, 1, 1,
0.9820744, 1.653643, 2.064186, 1, 1, 1, 1, 1,
0.9825094, 0.6101338, -0.0918587, 1, 1, 1, 1, 1,
0.9877985, -0.5785986, 0.6708611, 1, 1, 1, 1, 1,
0.9885135, -1.188701, 1.347347, 0, 0, 1, 1, 1,
0.9895844, -0.6826558, 2.695366, 1, 0, 0, 1, 1,
0.9905202, 0.2458921, 1.258171, 1, 0, 0, 1, 1,
0.9909011, 0.1154858, 0.731366, 1, 0, 0, 1, 1,
1.00838, 0.230342, 2.070681, 1, 0, 0, 1, 1,
1.0086, 0.1228322, 0.1647149, 1, 0, 0, 1, 1,
1.0147, 0.7339414, 0.4394253, 0, 0, 0, 1, 1,
1.01777, 0.3551212, -0.5831762, 0, 0, 0, 1, 1,
1.024528, -0.6495817, 3.427183, 0, 0, 0, 1, 1,
1.025974, -0.8381275, 1.506277, 0, 0, 0, 1, 1,
1.032448, 2.373639, 1.461684, 0, 0, 0, 1, 1,
1.042131, -1.285406, 0.1334426, 0, 0, 0, 1, 1,
1.043942, 0.08247283, 1.594575, 0, 0, 0, 1, 1,
1.046255, -0.2984557, 0.6219816, 1, 1, 1, 1, 1,
1.047485, -0.9360297, 1.801912, 1, 1, 1, 1, 1,
1.059175, -0.202057, 0.5498908, 1, 1, 1, 1, 1,
1.060212, -0.6479049, 3.157607, 1, 1, 1, 1, 1,
1.066948, -0.5543433, 2.765867, 1, 1, 1, 1, 1,
1.067085, -0.7754754, 0.3592618, 1, 1, 1, 1, 1,
1.067302, -1.87164, 1.921469, 1, 1, 1, 1, 1,
1.071965, -1.68926, 1.989246, 1, 1, 1, 1, 1,
1.073716, -0.2206678, 0.7720876, 1, 1, 1, 1, 1,
1.074172, -1.175724, 2.170534, 1, 1, 1, 1, 1,
1.076068, -0.3863444, 0.3237783, 1, 1, 1, 1, 1,
1.0781, -1.400606, 1.576708, 1, 1, 1, 1, 1,
1.078996, -0.7902375, 2.980384, 1, 1, 1, 1, 1,
1.084593, -0.9610487, 4.17622, 1, 1, 1, 1, 1,
1.08835, 0.6765949, 1.477995, 1, 1, 1, 1, 1,
1.089676, 0.262394, 0.3357408, 0, 0, 1, 1, 1,
1.093145, 1.066811, 0.1575271, 1, 0, 0, 1, 1,
1.093875, 0.01558559, 1.142383, 1, 0, 0, 1, 1,
1.106151, 0.3728738, 1.279827, 1, 0, 0, 1, 1,
1.118057, 1.850852, 1.644584, 1, 0, 0, 1, 1,
1.130428, 2.342099, 0.03993325, 1, 0, 0, 1, 1,
1.131783, -0.1046091, 2.660872, 0, 0, 0, 1, 1,
1.148616, 0.00945978, 1.822091, 0, 0, 0, 1, 1,
1.151762, 0.4813949, 0.3240369, 0, 0, 0, 1, 1,
1.163888, 1.494112, 1.389753, 0, 0, 0, 1, 1,
1.180192, -0.2904612, 1.365735, 0, 0, 0, 1, 1,
1.1829, -1.11434, 1.876709, 0, 0, 0, 1, 1,
1.186434, -0.3758821, 1.450286, 0, 0, 0, 1, 1,
1.18664, 0.3694634, 1.579232, 1, 1, 1, 1, 1,
1.198309, 0.9798403, 2.192035, 1, 1, 1, 1, 1,
1.198434, 0.06584067, 1.685656, 1, 1, 1, 1, 1,
1.203321, -0.07832006, 0.7927247, 1, 1, 1, 1, 1,
1.206403, 1.752674, 0.6785277, 1, 1, 1, 1, 1,
1.208666, -0.9959198, 1.806403, 1, 1, 1, 1, 1,
1.224454, 1.112716, 1.701723, 1, 1, 1, 1, 1,
1.230493, -0.364466, 2.800089, 1, 1, 1, 1, 1,
1.234326, 1.124661, -0.6215875, 1, 1, 1, 1, 1,
1.236275, 1.132562, -0.8237769, 1, 1, 1, 1, 1,
1.238072, -0.6968012, 3.236113, 1, 1, 1, 1, 1,
1.240326, 0.7860828, 1.184785, 1, 1, 1, 1, 1,
1.249012, -0.3133921, 2.342483, 1, 1, 1, 1, 1,
1.263546, 2.269776, -0.9728231, 1, 1, 1, 1, 1,
1.267591, -0.107334, 1.071469, 1, 1, 1, 1, 1,
1.268028, 0.2970515, -0.1142474, 0, 0, 1, 1, 1,
1.272439, -0.4270357, 1.255869, 1, 0, 0, 1, 1,
1.276151, -0.3871216, 1.137425, 1, 0, 0, 1, 1,
1.280329, 0.6541607, 0.9187643, 1, 0, 0, 1, 1,
1.281558, 0.2920834, 1.497995, 1, 0, 0, 1, 1,
1.282417, -1.910169, 2.91901, 1, 0, 0, 1, 1,
1.283005, 0.7207506, 3.416972, 0, 0, 0, 1, 1,
1.288146, 0.09308307, 2.691872, 0, 0, 0, 1, 1,
1.295153, 0.2135202, 0.6138709, 0, 0, 0, 1, 1,
1.296645, 1.400669, 1.307831, 0, 0, 0, 1, 1,
1.296813, -0.05335104, 0.05262515, 0, 0, 0, 1, 1,
1.297771, -1.017741, 2.267095, 0, 0, 0, 1, 1,
1.299543, 0.743522, 0.6391416, 0, 0, 0, 1, 1,
1.303588, 0.2363984, 2.608079, 1, 1, 1, 1, 1,
1.3087, -0.4664559, 3.201822, 1, 1, 1, 1, 1,
1.314776, -1.386489, 1.233731, 1, 1, 1, 1, 1,
1.332932, -1.641012, 2.015201, 1, 1, 1, 1, 1,
1.342108, 0.2251643, 2.140353, 1, 1, 1, 1, 1,
1.344058, 0.8487522, 0.9433174, 1, 1, 1, 1, 1,
1.344207, -0.678624, 0.1789558, 1, 1, 1, 1, 1,
1.354217, -0.5446516, 1.239875, 1, 1, 1, 1, 1,
1.380202, -0.1650248, 2.217805, 1, 1, 1, 1, 1,
1.383983, 0.4648286, 2.91885, 1, 1, 1, 1, 1,
1.387086, 0.935893, -0.7270544, 1, 1, 1, 1, 1,
1.390956, -1.330605, 2.650666, 1, 1, 1, 1, 1,
1.393255, 0.2119498, 1.158009, 1, 1, 1, 1, 1,
1.404886, -0.0920885, 3.049415, 1, 1, 1, 1, 1,
1.409631, 0.308786, 1.968695, 1, 1, 1, 1, 1,
1.409804, 1.676171, 1.631162, 0, 0, 1, 1, 1,
1.440317, 0.3530531, 0.3354495, 1, 0, 0, 1, 1,
1.444233, -1.886436, 1.213095, 1, 0, 0, 1, 1,
1.449868, 0.8087632, 1.707788, 1, 0, 0, 1, 1,
1.460094, 0.3863683, 0.8941488, 1, 0, 0, 1, 1,
1.460886, -0.632601, 2.778784, 1, 0, 0, 1, 1,
1.464629, -1.029668, 2.263621, 0, 0, 0, 1, 1,
1.480964, -0.529269, 3.357131, 0, 0, 0, 1, 1,
1.484275, -0.469517, 1.522048, 0, 0, 0, 1, 1,
1.515361, 0.3104975, 2.931828, 0, 0, 0, 1, 1,
1.516249, -1.221242, 2.577582, 0, 0, 0, 1, 1,
1.569355, -0.8525664, 2.766971, 0, 0, 0, 1, 1,
1.570484, 1.764632, -1.181608, 0, 0, 0, 1, 1,
1.577621, 0.05017073, 1.986967, 1, 1, 1, 1, 1,
1.581861, -0.8994146, 1.442028, 1, 1, 1, 1, 1,
1.587275, 0.3474905, 1.663729, 1, 1, 1, 1, 1,
1.593467, 0.1647861, 0.207536, 1, 1, 1, 1, 1,
1.596077, 0.2135384, 0.333845, 1, 1, 1, 1, 1,
1.603998, -1.0993, 0.1986924, 1, 1, 1, 1, 1,
1.605569, -0.9210817, 2.85098, 1, 1, 1, 1, 1,
1.606471, 0.1174315, 4.097829, 1, 1, 1, 1, 1,
1.620749, -2.463666, 1.138795, 1, 1, 1, 1, 1,
1.627189, -0.9404966, 4.1359, 1, 1, 1, 1, 1,
1.636169, -0.03791311, 0.6445519, 1, 1, 1, 1, 1,
1.659382, 0.8167399, 0.4725904, 1, 1, 1, 1, 1,
1.665072, -0.179511, 0.6125235, 1, 1, 1, 1, 1,
1.667343, -0.1883546, -0.06359496, 1, 1, 1, 1, 1,
1.701619, 0.2396598, 1.608698, 1, 1, 1, 1, 1,
1.7212, 0.4861175, 2.645366, 0, 0, 1, 1, 1,
1.730372, 0.01072933, 1.950124, 1, 0, 0, 1, 1,
1.741102, -0.842082, 1.589679, 1, 0, 0, 1, 1,
1.759925, 1.021156, 3.221659, 1, 0, 0, 1, 1,
1.770053, -0.6014464, 2.452374, 1, 0, 0, 1, 1,
1.775961, -1.321531, 2.330111, 1, 0, 0, 1, 1,
1.783829, 2.387837, -0.1996218, 0, 0, 0, 1, 1,
1.79456, -0.1349642, 2.336397, 0, 0, 0, 1, 1,
1.794985, -1.444615, 2.636458, 0, 0, 0, 1, 1,
1.813514, 0.5866056, 1.026842, 0, 0, 0, 1, 1,
1.813827, 0.4453556, 2.828137, 0, 0, 0, 1, 1,
1.818222, 0.321492, 3.563034, 0, 0, 0, 1, 1,
1.819664, -1.251887, 4.187413, 0, 0, 0, 1, 1,
1.821706, -0.8644513, 0.4070302, 1, 1, 1, 1, 1,
1.829935, 0.3869079, 1.865516, 1, 1, 1, 1, 1,
1.841469, 1.574756, 2.218877, 1, 1, 1, 1, 1,
1.845973, -1.063109, 2.831298, 1, 1, 1, 1, 1,
1.850834, -0.05950221, 1.793646, 1, 1, 1, 1, 1,
1.876695, 0.2591109, 1.532335, 1, 1, 1, 1, 1,
1.879935, 1.405967, 1.830647, 1, 1, 1, 1, 1,
1.890599, -0.6105014, 2.365622, 1, 1, 1, 1, 1,
1.902837, -0.04548174, 0.6131169, 1, 1, 1, 1, 1,
1.925492, -0.8817314, 1.099093, 1, 1, 1, 1, 1,
1.93389, -0.3442549, 1.357377, 1, 1, 1, 1, 1,
1.936866, -0.532355, 1.90034, 1, 1, 1, 1, 1,
1.942214, -0.7368181, 0.897035, 1, 1, 1, 1, 1,
1.963624, -0.7473772, 3.195389, 1, 1, 1, 1, 1,
1.9755, 0.7378571, -0.4358796, 1, 1, 1, 1, 1,
1.983576, -0.1975515, 3.712035, 0, 0, 1, 1, 1,
2.134232, -0.9982128, 2.102765, 1, 0, 0, 1, 1,
2.149448, 0.5478649, 1.561863, 1, 0, 0, 1, 1,
2.157644, -0.8701919, 1.113711, 1, 0, 0, 1, 1,
2.174678, 1.225559, 1.217097, 1, 0, 0, 1, 1,
2.191644, -0.2518027, -0.2923471, 1, 0, 0, 1, 1,
2.270465, 1.229535, 1.974351, 0, 0, 0, 1, 1,
2.289583, -0.04821905, 1.665336, 0, 0, 0, 1, 1,
2.289711, -0.04454586, 2.158986, 0, 0, 0, 1, 1,
2.359641, 0.8410552, 1.76439, 0, 0, 0, 1, 1,
2.361209, 1.181057, -1.589761, 0, 0, 0, 1, 1,
2.388901, -1.372414, 4.128272, 0, 0, 0, 1, 1,
2.411413, 0.3262311, 1.029361, 0, 0, 0, 1, 1,
2.420913, 0.1725088, 1.005037, 1, 1, 1, 1, 1,
2.531843, -0.3664185, 1.56471, 1, 1, 1, 1, 1,
2.68918, -1.963589, 2.897121, 1, 1, 1, 1, 1,
2.70078, 0.5596443, 2.791238, 1, 1, 1, 1, 1,
2.869023, 2.575948, 0.04699756, 1, 1, 1, 1, 1,
3.10508, -0.3696432, 1.500788, 1, 1, 1, 1, 1,
3.117326, 0.576997, 1.895048, 1, 1, 1, 1, 1
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
var radius = 9.500481;
var distance = 33.37004;
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
mvMatrix.translate( 0.04479218, 0.07293177, 0.02066326 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37004);
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
