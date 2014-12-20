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
-3.259062, -0.1982119, -2.896266, 1, 0, 0, 1,
-2.985301, -0.149159, -3.027974, 1, 0.007843138, 0, 1,
-2.88792, -1.689432, -1.485101, 1, 0.01176471, 0, 1,
-2.774065, 0.2300244, -2.709264, 1, 0.01960784, 0, 1,
-2.67162, 0.01500059, -4.033006, 1, 0.02352941, 0, 1,
-2.667727, -0.1661622, -1.316376, 1, 0.03137255, 0, 1,
-2.628953, -1.631971, -2.893129, 1, 0.03529412, 0, 1,
-2.424214, 1.036398, -0.7442386, 1, 0.04313726, 0, 1,
-2.422275, -2.366454, -2.559837, 1, 0.04705882, 0, 1,
-2.374242, -1.756213, -3.170647, 1, 0.05490196, 0, 1,
-2.37287, 0.1785616, -1.721155, 1, 0.05882353, 0, 1,
-2.315773, -0.9782509, -2.324949, 1, 0.06666667, 0, 1,
-2.284472, 1.271961, -0.3083933, 1, 0.07058824, 0, 1,
-2.198583, 1.024173, -1.965346, 1, 0.07843138, 0, 1,
-2.180493, -0.4706391, -1.867515, 1, 0.08235294, 0, 1,
-2.177123, -0.009292932, -1.920724, 1, 0.09019608, 0, 1,
-2.174419, -0.6408947, -1.770837, 1, 0.09411765, 0, 1,
-2.164124, -1.092839, -3.027248, 1, 0.1019608, 0, 1,
-2.121511, -1.271758, -1.485232, 1, 0.1098039, 0, 1,
-2.092605, 1.076528, -0.7730557, 1, 0.1137255, 0, 1,
-2.088754, 0.4543722, 0.1478861, 1, 0.1215686, 0, 1,
-2.03868, -0.1869309, -1.660145, 1, 0.1254902, 0, 1,
-2.027863, -0.7519224, -0.6112526, 1, 0.1333333, 0, 1,
-2.022901, 0.8216341, -2.472586, 1, 0.1372549, 0, 1,
-1.975081, -0.3583402, -2.918377, 1, 0.145098, 0, 1,
-1.940446, -0.4530104, -0.9577919, 1, 0.1490196, 0, 1,
-1.904058, -0.2404297, -3.067256, 1, 0.1568628, 0, 1,
-1.900561, -1.325924, -1.872612, 1, 0.1607843, 0, 1,
-1.895573, 1.156303, -2.033028, 1, 0.1686275, 0, 1,
-1.893056, 0.08534371, -1.517005, 1, 0.172549, 0, 1,
-1.870366, 1.872353, -2.298375, 1, 0.1803922, 0, 1,
-1.850848, -0.2387324, -1.383993, 1, 0.1843137, 0, 1,
-1.84304, 0.249658, -0.7129964, 1, 0.1921569, 0, 1,
-1.840713, 0.5863087, -2.384907, 1, 0.1960784, 0, 1,
-1.837931, 1.500767, -0.9385002, 1, 0.2039216, 0, 1,
-1.829834, 0.9707236, 0.6372455, 1, 0.2117647, 0, 1,
-1.828454, -0.1341462, -0.7228059, 1, 0.2156863, 0, 1,
-1.825494, -1.51238, -2.181203, 1, 0.2235294, 0, 1,
-1.806238, 1.229193, -1.236036, 1, 0.227451, 0, 1,
-1.802364, 0.1553503, 0.185091, 1, 0.2352941, 0, 1,
-1.792257, 1.034891, -0.8142408, 1, 0.2392157, 0, 1,
-1.790115, 0.228187, -2.17507, 1, 0.2470588, 0, 1,
-1.757299, 0.007036098, -0.7157958, 1, 0.2509804, 0, 1,
-1.753454, -1.174301, -2.718759, 1, 0.2588235, 0, 1,
-1.735665, -1.618351, -3.309569, 1, 0.2627451, 0, 1,
-1.730755, 1.550988, -1.208446, 1, 0.2705882, 0, 1,
-1.725922, -0.08478562, -3.064383, 1, 0.2745098, 0, 1,
-1.725054, -0.04426096, -2.129328, 1, 0.282353, 0, 1,
-1.705491, -2.229498, -2.682465, 1, 0.2862745, 0, 1,
-1.698768, 0.6123343, -0.2833127, 1, 0.2941177, 0, 1,
-1.687633, 1.567176, 0.5616968, 1, 0.3019608, 0, 1,
-1.67728, 0.161226, -0.4555518, 1, 0.3058824, 0, 1,
-1.669471, 0.9578084, -1.99937, 1, 0.3137255, 0, 1,
-1.667109, -0.03245901, -3.519244, 1, 0.3176471, 0, 1,
-1.654681, 3.059403, -0.4682925, 1, 0.3254902, 0, 1,
-1.653389, 0.7983475, -1.395165, 1, 0.3294118, 0, 1,
-1.650297, 0.1335329, -0.7590886, 1, 0.3372549, 0, 1,
-1.611511, -0.5796624, -2.202778, 1, 0.3411765, 0, 1,
-1.609618, 1.965385, -0.03446022, 1, 0.3490196, 0, 1,
-1.609583, 0.05693559, -2.674244, 1, 0.3529412, 0, 1,
-1.609529, -0.5073804, -1.916855, 1, 0.3607843, 0, 1,
-1.605635, 1.471077, -0.2691187, 1, 0.3647059, 0, 1,
-1.565904, -1.548442, -1.562964, 1, 0.372549, 0, 1,
-1.564206, 0.02322657, -1.672166, 1, 0.3764706, 0, 1,
-1.559022, 0.3047415, -1.929664, 1, 0.3843137, 0, 1,
-1.558648, 0.08489946, -1.801889, 1, 0.3882353, 0, 1,
-1.543812, 0.08854111, -0.4616114, 1, 0.3960784, 0, 1,
-1.532588, -0.4049466, -1.675265, 1, 0.4039216, 0, 1,
-1.52913, 0.2720395, -1.381511, 1, 0.4078431, 0, 1,
-1.524523, 1.301362, -0.1292451, 1, 0.4156863, 0, 1,
-1.514106, -0.5962463, 0.3170991, 1, 0.4196078, 0, 1,
-1.511904, -2.006604, -3.04738, 1, 0.427451, 0, 1,
-1.503867, 0.8853215, 0.6180154, 1, 0.4313726, 0, 1,
-1.502848, 0.4173742, -2.534586, 1, 0.4392157, 0, 1,
-1.477106, 0.3028088, -0.6482569, 1, 0.4431373, 0, 1,
-1.47415, -0.3287534, -0.5999939, 1, 0.4509804, 0, 1,
-1.46873, -0.5732232, -2.544384, 1, 0.454902, 0, 1,
-1.46796, -0.550832, -2.320542, 1, 0.4627451, 0, 1,
-1.455821, 1.080106, -0.7169331, 1, 0.4666667, 0, 1,
-1.455021, 0.1127255, -2.232547, 1, 0.4745098, 0, 1,
-1.441579, -0.7313296, -0.8933635, 1, 0.4784314, 0, 1,
-1.436533, -1.578853, -1.344686, 1, 0.4862745, 0, 1,
-1.433439, 0.5633982, -0.485441, 1, 0.4901961, 0, 1,
-1.433074, -1.15319, -2.878396, 1, 0.4980392, 0, 1,
-1.431134, 0.6044124, 0.2586747, 1, 0.5058824, 0, 1,
-1.430723, 1.654721, -1.102248, 1, 0.509804, 0, 1,
-1.420742, 0.545179, -1.207425, 1, 0.5176471, 0, 1,
-1.419166, 0.8146667, -1.14929, 1, 0.5215687, 0, 1,
-1.416419, 0.1303246, 0.4093114, 1, 0.5294118, 0, 1,
-1.415377, -1.271073, -3.148552, 1, 0.5333334, 0, 1,
-1.413926, -0.4186305, -2.667485, 1, 0.5411765, 0, 1,
-1.413106, 0.6235903, -2.219741, 1, 0.5450981, 0, 1,
-1.402943, 0.8334631, -0.534214, 1, 0.5529412, 0, 1,
-1.396913, 1.361274, -0.1416602, 1, 0.5568628, 0, 1,
-1.390245, -0.9984283, -4.079238, 1, 0.5647059, 0, 1,
-1.389288, 2.0092, 0.2067666, 1, 0.5686275, 0, 1,
-1.387016, -0.1832951, -1.677306, 1, 0.5764706, 0, 1,
-1.375965, 0.485756, 0.7023742, 1, 0.5803922, 0, 1,
-1.375873, -0.2307485, -1.755582, 1, 0.5882353, 0, 1,
-1.375165, -0.5943865, -3.234303, 1, 0.5921569, 0, 1,
-1.350962, -0.2638698, -2.800919, 1, 0.6, 0, 1,
-1.350205, 0.7203645, -2.305082, 1, 0.6078432, 0, 1,
-1.348265, -1.606913, -0.9894252, 1, 0.6117647, 0, 1,
-1.347063, -0.4517105, -0.786056, 1, 0.6196079, 0, 1,
-1.346983, -1.78306, -1.657571, 1, 0.6235294, 0, 1,
-1.344624, 0.3167227, -0.5308001, 1, 0.6313726, 0, 1,
-1.330427, 0.4453574, -1.846976, 1, 0.6352941, 0, 1,
-1.325206, 0.6242667, -2.676014, 1, 0.6431373, 0, 1,
-1.32362, -1.342143, -3.693269, 1, 0.6470588, 0, 1,
-1.317859, 0.4972142, -1.022834, 1, 0.654902, 0, 1,
-1.317623, -0.4454965, -2.888438, 1, 0.6588235, 0, 1,
-1.316599, -0.157884, -2.286725, 1, 0.6666667, 0, 1,
-1.31653, 0.2166402, -0.6639768, 1, 0.6705883, 0, 1,
-1.308337, 0.9838856, -1.799154, 1, 0.6784314, 0, 1,
-1.305796, -0.4913521, -3.022367, 1, 0.682353, 0, 1,
-1.301748, 0.4495664, -1.849059, 1, 0.6901961, 0, 1,
-1.29944, 1.426458, -0.9917899, 1, 0.6941177, 0, 1,
-1.296877, 0.8560523, -0.2339457, 1, 0.7019608, 0, 1,
-1.293659, 0.8043579, -0.8454174, 1, 0.7098039, 0, 1,
-1.287801, -1.288329, -1.533123, 1, 0.7137255, 0, 1,
-1.282412, -1.22086, -2.052032, 1, 0.7215686, 0, 1,
-1.280806, -0.6211255, -3.394769, 1, 0.7254902, 0, 1,
-1.280452, 0.2270843, -0.4407543, 1, 0.7333333, 0, 1,
-1.275329, 0.2069404, -4.458629, 1, 0.7372549, 0, 1,
-1.267834, 0.6240852, -0.1480486, 1, 0.7450981, 0, 1,
-1.265678, 0.8620331, -2.029281, 1, 0.7490196, 0, 1,
-1.254982, 0.404226, -0.7680314, 1, 0.7568628, 0, 1,
-1.251098, -1.361241, -4.557631, 1, 0.7607843, 0, 1,
-1.247039, 1.448797, -1.845296, 1, 0.7686275, 0, 1,
-1.242563, 0.3570218, 0.3341392, 1, 0.772549, 0, 1,
-1.237729, 0.498396, -0.3906851, 1, 0.7803922, 0, 1,
-1.236975, -0.271117, -3.21611, 1, 0.7843137, 0, 1,
-1.232019, 0.3124811, -1.290661, 1, 0.7921569, 0, 1,
-1.231007, -1.28476, -2.095906, 1, 0.7960784, 0, 1,
-1.230801, 1.275413, -2.569563, 1, 0.8039216, 0, 1,
-1.221595, 0.2062628, -1.999144, 1, 0.8117647, 0, 1,
-1.218279, -0.7886617, -3.618026, 1, 0.8156863, 0, 1,
-1.214971, 0.2301632, -0.8944896, 1, 0.8235294, 0, 1,
-1.214204, -0.2785721, -1.838086, 1, 0.827451, 0, 1,
-1.195318, 0.4570805, 0.314682, 1, 0.8352941, 0, 1,
-1.188832, 0.2946706, -0.26341, 1, 0.8392157, 0, 1,
-1.188319, -0.4538034, -2.372013, 1, 0.8470588, 0, 1,
-1.183723, 0.5813866, 0.157701, 1, 0.8509804, 0, 1,
-1.183056, -0.3949611, -3.185126, 1, 0.8588235, 0, 1,
-1.180097, -1.678555, -3.18399, 1, 0.8627451, 0, 1,
-1.1754, -0.589211, -2.586605, 1, 0.8705882, 0, 1,
-1.174852, 1.73466, 1.324409, 1, 0.8745098, 0, 1,
-1.163199, 1.729225, -1.076901, 1, 0.8823529, 0, 1,
-1.16271, 1.152072, -1.930001, 1, 0.8862745, 0, 1,
-1.161754, -1.281372, -1.952879, 1, 0.8941177, 0, 1,
-1.158998, 0.8831495, 0.3901342, 1, 0.8980392, 0, 1,
-1.156241, -0.2996822, -3.522978, 1, 0.9058824, 0, 1,
-1.151888, -0.7672631, -2.367651, 1, 0.9137255, 0, 1,
-1.149546, -0.6491306, -1.794668, 1, 0.9176471, 0, 1,
-1.148984, -1.513371, -1.443408, 1, 0.9254902, 0, 1,
-1.148557, 1.136195, -0.9231892, 1, 0.9294118, 0, 1,
-1.147237, -0.7648861, -2.10551, 1, 0.9372549, 0, 1,
-1.141389, -2.087461, -3.376662, 1, 0.9411765, 0, 1,
-1.138881, 1.05385, -2.320694, 1, 0.9490196, 0, 1,
-1.135286, 0.6239442, -1.469401, 1, 0.9529412, 0, 1,
-1.131688, 0.5754198, -0.8636671, 1, 0.9607843, 0, 1,
-1.127659, 0.1569978, -0.8159975, 1, 0.9647059, 0, 1,
-1.116792, -0.4371141, -3.960716, 1, 0.972549, 0, 1,
-1.113206, -0.9726681, -1.938113, 1, 0.9764706, 0, 1,
-1.101134, 0.4986494, -0.7802292, 1, 0.9843137, 0, 1,
-1.096799, -0.3296524, -1.906149, 1, 0.9882353, 0, 1,
-1.095658, 0.3166806, -0.7806752, 1, 0.9960784, 0, 1,
-1.093315, 1.135583, 2.12065, 0.9960784, 1, 0, 1,
-1.083492, 1.251853, -0.6559823, 0.9921569, 1, 0, 1,
-1.080524, 0.1261245, -1.000167, 0.9843137, 1, 0, 1,
-1.072163, -1.155632, -3.240988, 0.9803922, 1, 0, 1,
-1.066501, -0.2999602, -0.9451542, 0.972549, 1, 0, 1,
-1.060812, -1.436495, -3.305214, 0.9686275, 1, 0, 1,
-1.057171, -0.5420702, -2.438407, 0.9607843, 1, 0, 1,
-1.051668, -0.3194755, -2.52609, 0.9568627, 1, 0, 1,
-1.050727, 0.9599218, -0.3303052, 0.9490196, 1, 0, 1,
-1.050068, -0.4213574, -0.874123, 0.945098, 1, 0, 1,
-1.049196, -2.422534, -3.983594, 0.9372549, 1, 0, 1,
-1.043779, -0.3185851, -3.128564, 0.9333333, 1, 0, 1,
-1.035407, -0.07402496, -2.8562, 0.9254902, 1, 0, 1,
-1.027899, 1.410503, 1.520782, 0.9215686, 1, 0, 1,
-1.027296, -0.4814734, -3.509395, 0.9137255, 1, 0, 1,
-1.013366, -0.5887425, -2.382246, 0.9098039, 1, 0, 1,
-1.00783, 1.121373, -1.802177, 0.9019608, 1, 0, 1,
-1.007053, -0.5285887, -2.580061, 0.8941177, 1, 0, 1,
-1.002851, -1.086918, -0.6639848, 0.8901961, 1, 0, 1,
-0.9994911, 0.4206806, -3.807032, 0.8823529, 1, 0, 1,
-0.9907343, 0.1588506, -1.489929, 0.8784314, 1, 0, 1,
-0.9898437, 0.8666809, -2.048606, 0.8705882, 1, 0, 1,
-0.9849122, -1.195601, -2.785331, 0.8666667, 1, 0, 1,
-0.9838009, -1.635385, -2.952143, 0.8588235, 1, 0, 1,
-0.9814371, -1.098374, -0.06455416, 0.854902, 1, 0, 1,
-0.9782035, -2.157214, -1.84396, 0.8470588, 1, 0, 1,
-0.9752013, -0.4319224, -3.076151, 0.8431373, 1, 0, 1,
-0.9750929, -0.7236087, -2.768318, 0.8352941, 1, 0, 1,
-0.9747704, 0.7238107, -0.6145453, 0.8313726, 1, 0, 1,
-0.9704211, 1.771314, -0.8792439, 0.8235294, 1, 0, 1,
-0.968883, 1.314399, -1.009576, 0.8196079, 1, 0, 1,
-0.9363573, 0.3873228, -1.669937, 0.8117647, 1, 0, 1,
-0.9273119, -0.7477038, -2.415079, 0.8078431, 1, 0, 1,
-0.9252456, 0.6465142, 1.017597, 0.8, 1, 0, 1,
-0.9239191, -0.6596698, -2.989361, 0.7921569, 1, 0, 1,
-0.9207744, 2.360159, -1.038567, 0.7882353, 1, 0, 1,
-0.8980443, -1.037144, -4.320756, 0.7803922, 1, 0, 1,
-0.8941892, 0.3982123, -1.553755, 0.7764706, 1, 0, 1,
-0.8919789, -0.6135412, -1.753096, 0.7686275, 1, 0, 1,
-0.8900065, -0.7653433, -4.677083, 0.7647059, 1, 0, 1,
-0.8884403, 0.1269009, -3.555166, 0.7568628, 1, 0, 1,
-0.8809466, 1.250549, -0.884638, 0.7529412, 1, 0, 1,
-0.8757478, -0.08398007, -1.316626, 0.7450981, 1, 0, 1,
-0.8728775, 1.803859, -2.445724, 0.7411765, 1, 0, 1,
-0.8702977, 0.834359, -2.403612, 0.7333333, 1, 0, 1,
-0.8700123, 0.7227826, -1.161849, 0.7294118, 1, 0, 1,
-0.8610897, -1.892406, -3.551873, 0.7215686, 1, 0, 1,
-0.8510672, 1.701494, -0.9675102, 0.7176471, 1, 0, 1,
-0.8502488, -0.4953023, -2.122309, 0.7098039, 1, 0, 1,
-0.8435369, 0.296029, -1.127899, 0.7058824, 1, 0, 1,
-0.8365804, -2.039652, -1.411119, 0.6980392, 1, 0, 1,
-0.8280997, -0.2683058, -3.25915, 0.6901961, 1, 0, 1,
-0.8179045, 1.045843, 0.0346452, 0.6862745, 1, 0, 1,
-0.814964, -0.9239364, -1.425508, 0.6784314, 1, 0, 1,
-0.8083959, 1.342693, 0.8702884, 0.6745098, 1, 0, 1,
-0.8012941, 1.524946, -1.502816, 0.6666667, 1, 0, 1,
-0.7936466, 0.048873, -1.386987, 0.6627451, 1, 0, 1,
-0.7875108, 1.07058, 0.9040818, 0.654902, 1, 0, 1,
-0.7869372, -0.6808719, -1.65036, 0.6509804, 1, 0, 1,
-0.778754, -1.908465, -1.275789, 0.6431373, 1, 0, 1,
-0.7779406, -0.518528, -1.897914, 0.6392157, 1, 0, 1,
-0.7765352, -0.8784706, -1.811427, 0.6313726, 1, 0, 1,
-0.7757691, -0.3898491, -2.890242, 0.627451, 1, 0, 1,
-0.7744624, -0.615922, -1.930045, 0.6196079, 1, 0, 1,
-0.7671342, 3.809555, -0.69412, 0.6156863, 1, 0, 1,
-0.7663049, 0.03546437, -0.9943349, 0.6078432, 1, 0, 1,
-0.7641882, -0.627507, -2.334485, 0.6039216, 1, 0, 1,
-0.76162, 0.1330235, -2.604411, 0.5960785, 1, 0, 1,
-0.761535, 0.4956995, 0.9435464, 0.5882353, 1, 0, 1,
-0.7571821, 0.2443127, -2.031826, 0.5843138, 1, 0, 1,
-0.7551357, 1.108019, -0.855622, 0.5764706, 1, 0, 1,
-0.7465853, -0.2459119, -1.853882, 0.572549, 1, 0, 1,
-0.7432557, -1.369057, -1.601885, 0.5647059, 1, 0, 1,
-0.7432489, 0.3686122, -1.319369, 0.5607843, 1, 0, 1,
-0.7430428, 1.983498, -0.9507273, 0.5529412, 1, 0, 1,
-0.7418067, 1.377039, 0.7985606, 0.5490196, 1, 0, 1,
-0.740217, 0.785374, -1.014897, 0.5411765, 1, 0, 1,
-0.7349418, 2.33124, 0.4515608, 0.5372549, 1, 0, 1,
-0.7332091, 1.372661, -2.06767, 0.5294118, 1, 0, 1,
-0.7312071, 0.8527338, -0.2585028, 0.5254902, 1, 0, 1,
-0.7310851, 0.1505796, -0.2429555, 0.5176471, 1, 0, 1,
-0.730262, 0.257353, -1.611879, 0.5137255, 1, 0, 1,
-0.7253681, -0.01575156, 0.1452869, 0.5058824, 1, 0, 1,
-0.7244782, -0.1531384, -1.253206, 0.5019608, 1, 0, 1,
-0.7200285, -1.261287, -2.975301, 0.4941176, 1, 0, 1,
-0.7188268, -0.6216585, -2.421054, 0.4862745, 1, 0, 1,
-0.7169392, -1.095294, -3.683146, 0.4823529, 1, 0, 1,
-0.7158874, -0.3342162, -1.690688, 0.4745098, 1, 0, 1,
-0.713963, -1.305369, -1.181213, 0.4705882, 1, 0, 1,
-0.7126229, 0.4779546, -0.7650162, 0.4627451, 1, 0, 1,
-0.7108396, 1.069641, 2.052476, 0.4588235, 1, 0, 1,
-0.7075772, -0.6776438, -4.647469, 0.4509804, 1, 0, 1,
-0.6964737, -2.695397, -3.161139, 0.4470588, 1, 0, 1,
-0.6961409, -0.8536223, -1.166271, 0.4392157, 1, 0, 1,
-0.6957921, -1.763803, -2.384828, 0.4352941, 1, 0, 1,
-0.6948133, -1.218932, -1.963594, 0.427451, 1, 0, 1,
-0.6869627, -0.737039, -2.105469, 0.4235294, 1, 0, 1,
-0.6815098, -0.6323879, -2.464403, 0.4156863, 1, 0, 1,
-0.6787782, 0.3928065, 0.3295032, 0.4117647, 1, 0, 1,
-0.6727683, -1.419322, -3.270051, 0.4039216, 1, 0, 1,
-0.6682765, 0.5161197, -1.358558, 0.3960784, 1, 0, 1,
-0.6679999, 0.3065929, -0.7917067, 0.3921569, 1, 0, 1,
-0.6635589, 1.184186, 0.1297003, 0.3843137, 1, 0, 1,
-0.6540478, -0.1441038, -2.541269, 0.3803922, 1, 0, 1,
-0.6535783, -0.2129129, -2.623294, 0.372549, 1, 0, 1,
-0.6524515, 1.576013, 0.4535284, 0.3686275, 1, 0, 1,
-0.652161, -0.4236646, -1.621674, 0.3607843, 1, 0, 1,
-0.6508085, -0.3478048, -1.235802, 0.3568628, 1, 0, 1,
-0.6491489, -0.5502345, -0.6940364, 0.3490196, 1, 0, 1,
-0.6440762, 0.8604436, 0.4614955, 0.345098, 1, 0, 1,
-0.6387691, -0.3383711, -3.031643, 0.3372549, 1, 0, 1,
-0.636689, 0.3580439, -1.267228, 0.3333333, 1, 0, 1,
-0.6343728, 1.257714, 0.1995826, 0.3254902, 1, 0, 1,
-0.6236959, 0.5907114, -0.9237934, 0.3215686, 1, 0, 1,
-0.6166186, -0.9545577, -2.854009, 0.3137255, 1, 0, 1,
-0.6133972, 1.959868, -0.7056417, 0.3098039, 1, 0, 1,
-0.6121466, -1.036357, -2.769062, 0.3019608, 1, 0, 1,
-0.601748, 1.316, -1.341567, 0.2941177, 1, 0, 1,
-0.6000409, -0.2031759, -1.85869, 0.2901961, 1, 0, 1,
-0.5979559, -0.4302806, -2.107173, 0.282353, 1, 0, 1,
-0.5965984, -0.9844825, -3.489111, 0.2784314, 1, 0, 1,
-0.5939318, 0.8657555, -0.7934241, 0.2705882, 1, 0, 1,
-0.5906667, 0.8073354, -1.847621, 0.2666667, 1, 0, 1,
-0.589292, -0.9419593, -2.12055, 0.2588235, 1, 0, 1,
-0.5851887, -1.666776, -3.125474, 0.254902, 1, 0, 1,
-0.5829328, -0.3672323, -2.564119, 0.2470588, 1, 0, 1,
-0.5827395, -0.1280374, -1.166656, 0.2431373, 1, 0, 1,
-0.5794218, 0.6585426, -1.14154, 0.2352941, 1, 0, 1,
-0.5757248, 0.5315972, -0.2898591, 0.2313726, 1, 0, 1,
-0.5743764, 0.5653701, -0.762891, 0.2235294, 1, 0, 1,
-0.5577781, 0.6660609, -0.4627456, 0.2196078, 1, 0, 1,
-0.5532076, 1.057071, 0.4006185, 0.2117647, 1, 0, 1,
-0.5528556, 1.325441, -0.8016461, 0.2078431, 1, 0, 1,
-0.5486749, -0.3014056, -2.071187, 0.2, 1, 0, 1,
-0.5348935, -0.6147588, -3.427058, 0.1921569, 1, 0, 1,
-0.5323222, -0.2893837, -2.268497, 0.1882353, 1, 0, 1,
-0.5245839, -0.190112, -3.318389, 0.1803922, 1, 0, 1,
-0.5213464, 0.1806979, -0.9506043, 0.1764706, 1, 0, 1,
-0.5184501, 0.3610483, -0.2430961, 0.1686275, 1, 0, 1,
-0.5173183, 1.105652, -1.39464, 0.1647059, 1, 0, 1,
-0.5169892, 1.108282, -1.458897, 0.1568628, 1, 0, 1,
-0.5163248, 0.2458554, -1.908708, 0.1529412, 1, 0, 1,
-0.5160496, -0.4518971, -1.145893, 0.145098, 1, 0, 1,
-0.5155383, -0.6169571, -2.191067, 0.1411765, 1, 0, 1,
-0.5120067, -0.7917399, -1.898772, 0.1333333, 1, 0, 1,
-0.5104964, -0.283852, -2.802488, 0.1294118, 1, 0, 1,
-0.5094301, -0.7623158, -2.600879, 0.1215686, 1, 0, 1,
-0.5067835, -1.634058, -1.142117, 0.1176471, 1, 0, 1,
-0.4977031, -0.6018928, -4.356468, 0.1098039, 1, 0, 1,
-0.4965903, -0.6391789, -3.650832, 0.1058824, 1, 0, 1,
-0.4903415, 0.5361828, 0.5253066, 0.09803922, 1, 0, 1,
-0.4861492, -0.6187364, -3.924632, 0.09019608, 1, 0, 1,
-0.4830173, 0.1170087, 0.2176067, 0.08627451, 1, 0, 1,
-0.4827937, 0.8444723, 0.419704, 0.07843138, 1, 0, 1,
-0.4813784, -0.7902845, -3.791152, 0.07450981, 1, 0, 1,
-0.481264, -1.844423, -2.248296, 0.06666667, 1, 0, 1,
-0.4786176, -0.0435511, -2.730809, 0.0627451, 1, 0, 1,
-0.4783955, 0.9187706, 0.4503355, 0.05490196, 1, 0, 1,
-0.4704118, 0.524862, 0.1323249, 0.05098039, 1, 0, 1,
-0.463259, -0.1306399, -1.19226, 0.04313726, 1, 0, 1,
-0.4630173, -1.812283, -4.152979, 0.03921569, 1, 0, 1,
-0.4623535, 0.5319566, -1.873549, 0.03137255, 1, 0, 1,
-0.4616252, -1.363621, -2.730635, 0.02745098, 1, 0, 1,
-0.461335, -0.3557838, -3.339597, 0.01960784, 1, 0, 1,
-0.4579317, 2.638985, 0.1299604, 0.01568628, 1, 0, 1,
-0.4571263, -0.5462399, -2.642339, 0.007843138, 1, 0, 1,
-0.4563676, 0.8884755, 0.7468026, 0.003921569, 1, 0, 1,
-0.4560808, -0.0947886, -1.952334, 0, 1, 0.003921569, 1,
-0.4554579, 0.6311402, -0.5505958, 0, 1, 0.01176471, 1,
-0.4505082, 0.6344005, -1.774578, 0, 1, 0.01568628, 1,
-0.4498666, -1.578093, -4.588221, 0, 1, 0.02352941, 1,
-0.4495474, 0.4548826, -1.478943, 0, 1, 0.02745098, 1,
-0.449271, -0.1903208, -2.025664, 0, 1, 0.03529412, 1,
-0.4487534, 1.507101, -1.977289, 0, 1, 0.03921569, 1,
-0.4480293, 0.04317226, -1.8255, 0, 1, 0.04705882, 1,
-0.446963, 0.2716431, -1.191954, 0, 1, 0.05098039, 1,
-0.4467152, -0.7955205, -3.662665, 0, 1, 0.05882353, 1,
-0.4464287, -0.1964575, -5.448256, 0, 1, 0.0627451, 1,
-0.4459465, -1.433704, -4.163756, 0, 1, 0.07058824, 1,
-0.4439351, 1.427675, -0.8127948, 0, 1, 0.07450981, 1,
-0.4437898, 0.1698424, 0.2325197, 0, 1, 0.08235294, 1,
-0.441488, 3.582822, -1.61384, 0, 1, 0.08627451, 1,
-0.4376069, 0.6991324, -0.4202715, 0, 1, 0.09411765, 1,
-0.4364343, -0.004240565, 0.736396, 0, 1, 0.1019608, 1,
-0.4299554, 0.212934, -0.9778172, 0, 1, 0.1058824, 1,
-0.4232829, -0.1845458, -1.661365, 0, 1, 0.1137255, 1,
-0.4226467, -1.926391, -1.225767, 0, 1, 0.1176471, 1,
-0.4186837, -0.4052757, -4.461861, 0, 1, 0.1254902, 1,
-0.4148247, -1.616107, -3.854871, 0, 1, 0.1294118, 1,
-0.4135587, -1.517925, -3.6884, 0, 1, 0.1372549, 1,
-0.4092214, 1.061983, 0.8069205, 0, 1, 0.1411765, 1,
-0.4068018, -1.597723, -1.416256, 0, 1, 0.1490196, 1,
-0.4065328, 0.998193, -0.3972858, 0, 1, 0.1529412, 1,
-0.406103, 1.054126, 0.593156, 0, 1, 0.1607843, 1,
-0.4056277, 1.730804, -0.6622249, 0, 1, 0.1647059, 1,
-0.4046196, -1.673993, -2.518042, 0, 1, 0.172549, 1,
-0.4018927, -0.3843208, -2.482745, 0, 1, 0.1764706, 1,
-0.4018286, 0.5726165, -1.33374, 0, 1, 0.1843137, 1,
-0.3989076, 1.394626, -0.08045632, 0, 1, 0.1882353, 1,
-0.3976094, -1.178343, -2.216724, 0, 1, 0.1960784, 1,
-0.3936088, 0.7807328, 1.375191, 0, 1, 0.2039216, 1,
-0.3902736, -0.2748809, -2.589292, 0, 1, 0.2078431, 1,
-0.3900372, -0.7403389, -2.641585, 0, 1, 0.2156863, 1,
-0.3881332, -1.032117, -3.2459, 0, 1, 0.2196078, 1,
-0.3837974, 0.08858061, -1.091558, 0, 1, 0.227451, 1,
-0.3815457, -0.7135624, -2.734388, 0, 1, 0.2313726, 1,
-0.3814386, -0.5926325, -1.111276, 0, 1, 0.2392157, 1,
-0.3792534, -1.10479, -4.415256, 0, 1, 0.2431373, 1,
-0.379133, -1.256916, -2.518641, 0, 1, 0.2509804, 1,
-0.3767836, 0.3217432, -1.403, 0, 1, 0.254902, 1,
-0.3747073, 0.221671, -2.924623, 0, 1, 0.2627451, 1,
-0.3731416, 0.5943251, -0.4635621, 0, 1, 0.2666667, 1,
-0.3655647, 0.6555972, -0.4844946, 0, 1, 0.2745098, 1,
-0.3630221, -0.4143019, -2.649028, 0, 1, 0.2784314, 1,
-0.351807, 0.02441317, -1.378626, 0, 1, 0.2862745, 1,
-0.3499845, 0.1690053, -1.557764, 0, 1, 0.2901961, 1,
-0.3455354, -0.1982134, -1.667036, 0, 1, 0.2980392, 1,
-0.3446234, 1.299562, 0.8888175, 0, 1, 0.3058824, 1,
-0.3439844, 1.168065, -0.8429183, 0, 1, 0.3098039, 1,
-0.3411808, -0.1655835, -2.380458, 0, 1, 0.3176471, 1,
-0.3408745, -0.1361797, -2.434506, 0, 1, 0.3215686, 1,
-0.3394488, -1.182323, -0.8412505, 0, 1, 0.3294118, 1,
-0.3345739, 0.008825713, -2.807896, 0, 1, 0.3333333, 1,
-0.3304377, -1.8617, -1.064399, 0, 1, 0.3411765, 1,
-0.3303657, 1.029963, -2.06091, 0, 1, 0.345098, 1,
-0.3279707, 0.6238828, 0.8966863, 0, 1, 0.3529412, 1,
-0.3224401, -2.577347, -2.303041, 0, 1, 0.3568628, 1,
-0.3192041, -1.157246, -2.553231, 0, 1, 0.3647059, 1,
-0.3183497, 0.02617594, -1.827177, 0, 1, 0.3686275, 1,
-0.3171884, -0.252028, -1.248745, 0, 1, 0.3764706, 1,
-0.3149504, 0.7850823, -1.853389, 0, 1, 0.3803922, 1,
-0.313003, 0.7380262, 0.8350665, 0, 1, 0.3882353, 1,
-0.3111304, -0.6983985, -4.327416, 0, 1, 0.3921569, 1,
-0.3105327, -0.8752213, -3.642501, 0, 1, 0.4, 1,
-0.3035915, 0.5115082, -0.004243535, 0, 1, 0.4078431, 1,
-0.3025749, -1.561806, -4.602576, 0, 1, 0.4117647, 1,
-0.300584, -1.148279, -1.885291, 0, 1, 0.4196078, 1,
-0.2995684, -0.04458049, -0.1650424, 0, 1, 0.4235294, 1,
-0.2941, 0.2392948, 0.1453995, 0, 1, 0.4313726, 1,
-0.2921113, 0.8478887, 0.1225304, 0, 1, 0.4352941, 1,
-0.2902034, -1.314631, -2.24311, 0, 1, 0.4431373, 1,
-0.2841641, 0.5805401, 0.04526367, 0, 1, 0.4470588, 1,
-0.2837121, 1.769705, 0.06226002, 0, 1, 0.454902, 1,
-0.2771209, 0.05345546, -1.325063, 0, 1, 0.4588235, 1,
-0.2751164, 1.543107, -0.2767749, 0, 1, 0.4666667, 1,
-0.2722554, -0.9115498, -3.811981, 0, 1, 0.4705882, 1,
-0.2713677, 1.339296, -0.650559, 0, 1, 0.4784314, 1,
-0.2665093, -1.290192, -3.371411, 0, 1, 0.4823529, 1,
-0.2648984, 1.438045, 0.6183719, 0, 1, 0.4901961, 1,
-0.2640775, -1.255535, -1.977981, 0, 1, 0.4941176, 1,
-0.2635951, 0.3279188, -1.025184, 0, 1, 0.5019608, 1,
-0.2629985, -0.24672, -1.756974, 0, 1, 0.509804, 1,
-0.2611116, 0.3555854, -0.9984516, 0, 1, 0.5137255, 1,
-0.2563443, 0.02289245, -0.5523139, 0, 1, 0.5215687, 1,
-0.2552302, 0.3042985, -0.2010639, 0, 1, 0.5254902, 1,
-0.2538574, 1.648235, -0.418956, 0, 1, 0.5333334, 1,
-0.2512992, 1.569745, 0.1148194, 0, 1, 0.5372549, 1,
-0.2508267, -1.090546, -3.994286, 0, 1, 0.5450981, 1,
-0.2502703, 0.06695996, 0.2539274, 0, 1, 0.5490196, 1,
-0.2407822, 1.314863, -0.2043657, 0, 1, 0.5568628, 1,
-0.2374059, -0.8420694, -1.082221, 0, 1, 0.5607843, 1,
-0.2311703, 0.6833819, 1.701262, 0, 1, 0.5686275, 1,
-0.2307121, 0.4655323, -0.3766526, 0, 1, 0.572549, 1,
-0.229114, 0.7610693, 1.043031, 0, 1, 0.5803922, 1,
-0.2285466, -1.332578, -4.088283, 0, 1, 0.5843138, 1,
-0.2261967, 0.207489, -0.1223206, 0, 1, 0.5921569, 1,
-0.2246187, 0.5865155, 0.984399, 0, 1, 0.5960785, 1,
-0.2233386, 0.03756544, -1.229873, 0, 1, 0.6039216, 1,
-0.2222322, 1.221919, -2.425437, 0, 1, 0.6117647, 1,
-0.2207842, 3.295264, 0.3245595, 0, 1, 0.6156863, 1,
-0.2199193, 0.2331091, -0.4067681, 0, 1, 0.6235294, 1,
-0.2198259, 0.03135692, -2.703338, 0, 1, 0.627451, 1,
-0.2172256, -0.9025345, -3.998033, 0, 1, 0.6352941, 1,
-0.2148133, -2.049886, -4.166487, 0, 1, 0.6392157, 1,
-0.212316, 0.5636876, 0.2573535, 0, 1, 0.6470588, 1,
-0.2077902, 0.4935576, 0.473744, 0, 1, 0.6509804, 1,
-0.2048609, -0.1877248, -2.605458, 0, 1, 0.6588235, 1,
-0.1970392, 2.381154, 0.2801263, 0, 1, 0.6627451, 1,
-0.1969841, -0.4317454, -2.081865, 0, 1, 0.6705883, 1,
-0.1963638, -0.9731385, -1.38105, 0, 1, 0.6745098, 1,
-0.1908874, -1.395602, -3.343193, 0, 1, 0.682353, 1,
-0.1838679, -0.1036615, -1.332311, 0, 1, 0.6862745, 1,
-0.181375, 1.612745, 1.041925, 0, 1, 0.6941177, 1,
-0.1779622, -0.1435432, -2.642323, 0, 1, 0.7019608, 1,
-0.1776221, 1.041809, 1.769815, 0, 1, 0.7058824, 1,
-0.1751764, 0.5291826, -0.01489899, 0, 1, 0.7137255, 1,
-0.1710415, 0.1080451, -1.874525, 0, 1, 0.7176471, 1,
-0.1653511, 0.3857109, -0.4422187, 0, 1, 0.7254902, 1,
-0.1628525, -1.96016, -2.454936, 0, 1, 0.7294118, 1,
-0.1619587, -1.480434, -1.668458, 0, 1, 0.7372549, 1,
-0.1586066, -1.525024, -1.146971, 0, 1, 0.7411765, 1,
-0.1529386, 0.5582976, 0.5073496, 0, 1, 0.7490196, 1,
-0.1499261, 0.4747531, 0.9446009, 0, 1, 0.7529412, 1,
-0.1485644, -0.8412724, -2.258298, 0, 1, 0.7607843, 1,
-0.146173, -0.9330872, -3.746396, 0, 1, 0.7647059, 1,
-0.146005, 0.6094042, 0.163413, 0, 1, 0.772549, 1,
-0.1452503, 0.2740557, -0.3595456, 0, 1, 0.7764706, 1,
-0.1433083, 0.4900229, -1.760459, 0, 1, 0.7843137, 1,
-0.1423449, 1.283625, -0.1500537, 0, 1, 0.7882353, 1,
-0.1402837, 2.53754, 0.7419033, 0, 1, 0.7960784, 1,
-0.1370125, -1.603287, -1.412742, 0, 1, 0.8039216, 1,
-0.1362934, -0.07229814, -3.033382, 0, 1, 0.8078431, 1,
-0.1349538, -2.59124, -0.7473264, 0, 1, 0.8156863, 1,
-0.1324596, 1.375137, -0.7636743, 0, 1, 0.8196079, 1,
-0.1294646, -1.227029, -3.497795, 0, 1, 0.827451, 1,
-0.1249775, 0.7598261, -1.147348, 0, 1, 0.8313726, 1,
-0.1247279, 0.1515942, -0.8081197, 0, 1, 0.8392157, 1,
-0.1176711, 0.7733544, -0.7617705, 0, 1, 0.8431373, 1,
-0.1078957, -0.9065048, -2.400582, 0, 1, 0.8509804, 1,
-0.1078488, -0.948306, -3.468298, 0, 1, 0.854902, 1,
-0.1015324, 1.643324, -0.7535223, 0, 1, 0.8627451, 1,
-0.09645353, 0.8714626, 0.08171251, 0, 1, 0.8666667, 1,
-0.09577675, 0.8971813, -0.3897326, 0, 1, 0.8745098, 1,
-0.09106887, -1.309816, -2.914829, 0, 1, 0.8784314, 1,
-0.08797008, -0.7729562, -4.411505, 0, 1, 0.8862745, 1,
-0.08776796, -0.3761904, -2.610735, 0, 1, 0.8901961, 1,
-0.08629595, -1.77387, -3.146697, 0, 1, 0.8980392, 1,
-0.08394638, -0.1981445, -4.074552, 0, 1, 0.9058824, 1,
-0.07617781, 0.3996834, -0.583295, 0, 1, 0.9098039, 1,
-0.07438246, 1.337665, 0.01827853, 0, 1, 0.9176471, 1,
-0.0729688, -2.776292, -1.412927, 0, 1, 0.9215686, 1,
-0.07244735, -1.206927, -1.907243, 0, 1, 0.9294118, 1,
-0.06943546, -0.03394101, -1.309936, 0, 1, 0.9333333, 1,
-0.06168175, 0.6575658, -2.345437, 0, 1, 0.9411765, 1,
-0.06047, 0.7233676, -0.4379074, 0, 1, 0.945098, 1,
-0.06030043, 1.253241, 0.1919981, 0, 1, 0.9529412, 1,
-0.05749626, -2.999429, -3.022585, 0, 1, 0.9568627, 1,
-0.05136271, -0.4174591, -3.430608, 0, 1, 0.9647059, 1,
-0.04391202, 1.131162, 0.01253984, 0, 1, 0.9686275, 1,
-0.04301636, -2.446934, -3.753243, 0, 1, 0.9764706, 1,
-0.04176553, -1.571484, -3.30034, 0, 1, 0.9803922, 1,
-0.03916087, 0.4243772, -1.08016, 0, 1, 0.9882353, 1,
-0.03897763, 0.0334684, -0.3920397, 0, 1, 0.9921569, 1,
-0.03862756, 0.563276, -0.7471235, 0, 1, 1, 1,
-0.03710987, -0.5989801, -3.015213, 0, 0.9921569, 1, 1,
-0.03454, 0.923174, 0.3157948, 0, 0.9882353, 1, 1,
-0.03428632, 0.6496821, -0.3030107, 0, 0.9803922, 1, 1,
-0.02632449, 2.055651, -0.5869504, 0, 0.9764706, 1, 1,
-0.02618443, -0.07264801, -1.905045, 0, 0.9686275, 1, 1,
-0.02611088, 0.5097682, -1.183959, 0, 0.9647059, 1, 1,
-0.02044042, -0.1165059, -2.419214, 0, 0.9568627, 1, 1,
-0.01958349, 0.3660394, 0.4027354, 0, 0.9529412, 1, 1,
-0.01845799, 1.432458, -1.120933, 0, 0.945098, 1, 1,
-0.01613232, -0.5238141, -3.057062, 0, 0.9411765, 1, 1,
-0.01492243, -0.1120941, -2.628472, 0, 0.9333333, 1, 1,
-0.0142908, -0.2480308, -3.571494, 0, 0.9294118, 1, 1,
-0.008606729, -2.106139, -3.274741, 0, 0.9215686, 1, 1,
-0.006005479, -0.06167538, -2.626735, 0, 0.9176471, 1, 1,
-0.001278694, -0.9830888, -1.304064, 0, 0.9098039, 1, 1,
0.002704438, 0.1035954, 0.5693808, 0, 0.9058824, 1, 1,
0.006086975, 1.387378, 1.194046, 0, 0.8980392, 1, 1,
0.006329415, -0.7708066, 3.246619, 0, 0.8901961, 1, 1,
0.007186492, -0.5895093, 3.569223, 0, 0.8862745, 1, 1,
0.007361456, 0.2981572, 1.02165, 0, 0.8784314, 1, 1,
0.00785367, -0.677487, 4.470906, 0, 0.8745098, 1, 1,
0.007978938, 0.6027062, 1.398752, 0, 0.8666667, 1, 1,
0.00849443, 0.5316184, -0.1220187, 0, 0.8627451, 1, 1,
0.00927794, 0.882485, -0.8741243, 0, 0.854902, 1, 1,
0.0104089, -0.2428745, 3.807399, 0, 0.8509804, 1, 1,
0.01212557, -1.309954, 3.243972, 0, 0.8431373, 1, 1,
0.01372398, -0.8152834, 2.748756, 0, 0.8392157, 1, 1,
0.01667802, -0.5729373, 1.655542, 0, 0.8313726, 1, 1,
0.01777207, -0.2739466, 4.556235, 0, 0.827451, 1, 1,
0.01967614, 0.6838, 1.467033, 0, 0.8196079, 1, 1,
0.0329728, 1.271232, -0.495009, 0, 0.8156863, 1, 1,
0.03307227, 0.3329264, -0.04863277, 0, 0.8078431, 1, 1,
0.03626674, 0.7594694, 0.6845388, 0, 0.8039216, 1, 1,
0.03657485, -1.040119, 2.832724, 0, 0.7960784, 1, 1,
0.04077826, -0.6784842, 3.115695, 0, 0.7882353, 1, 1,
0.05133267, -0.5817536, 2.162626, 0, 0.7843137, 1, 1,
0.05173342, 0.02638132, 1.962996, 0, 0.7764706, 1, 1,
0.05291632, -0.4419379, 3.901592, 0, 0.772549, 1, 1,
0.05686479, -1.474586, 3.938386, 0, 0.7647059, 1, 1,
0.06360573, -0.1556318, 1.824455, 0, 0.7607843, 1, 1,
0.07014086, -1.092088, 2.827065, 0, 0.7529412, 1, 1,
0.07317667, -0.7551309, 2.183766, 0, 0.7490196, 1, 1,
0.07363609, 0.7068014, 0.08187586, 0, 0.7411765, 1, 1,
0.0840163, 0.7061284, -1.642814, 0, 0.7372549, 1, 1,
0.08498631, 0.3754523, 0.1371556, 0, 0.7294118, 1, 1,
0.0854254, 0.0430261, -0.00739922, 0, 0.7254902, 1, 1,
0.08627614, 1.070617, 0.7988983, 0, 0.7176471, 1, 1,
0.09006509, 1.55046, 1.280609, 0, 0.7137255, 1, 1,
0.09022535, 0.3823607, -0.07370298, 0, 0.7058824, 1, 1,
0.09422438, -0.3929344, 2.751255, 0, 0.6980392, 1, 1,
0.09984735, -0.6686314, 2.309638, 0, 0.6941177, 1, 1,
0.1071631, 1.859011, 0.4382688, 0, 0.6862745, 1, 1,
0.1106653, 0.05925466, 1.229114, 0, 0.682353, 1, 1,
0.114414, -1.112512, 2.439558, 0, 0.6745098, 1, 1,
0.1149161, -1.160993, 2.965035, 0, 0.6705883, 1, 1,
0.1181005, 0.4563631, 1.787885, 0, 0.6627451, 1, 1,
0.1185304, 0.839761, -1.340068, 0, 0.6588235, 1, 1,
0.1266014, 1.518782, -0.5816164, 0, 0.6509804, 1, 1,
0.1366188, -0.5995503, 3.308662, 0, 0.6470588, 1, 1,
0.1369206, 1.071713, 1.285299, 0, 0.6392157, 1, 1,
0.1382008, -0.3031508, 2.628432, 0, 0.6352941, 1, 1,
0.1385886, 0.4760465, 1.734794, 0, 0.627451, 1, 1,
0.1415634, -0.02924246, 0.9451795, 0, 0.6235294, 1, 1,
0.1493081, 0.375547, 1.380152, 0, 0.6156863, 1, 1,
0.1528855, 0.01589771, 0.3822534, 0, 0.6117647, 1, 1,
0.1531565, 0.4224446, 0.5404891, 0, 0.6039216, 1, 1,
0.1537409, 0.3841283, 0.977233, 0, 0.5960785, 1, 1,
0.1602668, -0.631369, 2.905235, 0, 0.5921569, 1, 1,
0.1612271, -0.3544819, 2.076052, 0, 0.5843138, 1, 1,
0.1626949, -1.845673, 3.405633, 0, 0.5803922, 1, 1,
0.1677927, -0.1612643, 1.067587, 0, 0.572549, 1, 1,
0.1685795, -0.2472296, 2.016152, 0, 0.5686275, 1, 1,
0.1686654, 1.69273, 1.850243, 0, 0.5607843, 1, 1,
0.1756911, -2.583212, 2.873173, 0, 0.5568628, 1, 1,
0.1813251, 0.9971232, 0.06475528, 0, 0.5490196, 1, 1,
0.1845861, -2.584134, 4.264668, 0, 0.5450981, 1, 1,
0.1876254, -1.521246, 3.428027, 0, 0.5372549, 1, 1,
0.1904638, 0.3523008, -0.4330101, 0, 0.5333334, 1, 1,
0.19137, 0.7338737, -1.519733, 0, 0.5254902, 1, 1,
0.1927959, -0.7331272, 1.773437, 0, 0.5215687, 1, 1,
0.194529, 0.07463749, 2.028514, 0, 0.5137255, 1, 1,
0.1983, -0.8973925, 1.25143, 0, 0.509804, 1, 1,
0.2038564, 0.7756047, 0.1299584, 0, 0.5019608, 1, 1,
0.2040091, -0.01966151, 1.582287, 0, 0.4941176, 1, 1,
0.2047151, -0.6655111, 1.619176, 0, 0.4901961, 1, 1,
0.2059599, -0.726787, 2.422612, 0, 0.4823529, 1, 1,
0.2065229, 0.4177396, -0.102996, 0, 0.4784314, 1, 1,
0.2085426, 0.1178416, 0.1352885, 0, 0.4705882, 1, 1,
0.2136524, -1.04702, 2.578751, 0, 0.4666667, 1, 1,
0.2159495, -0.7887411, 3.567202, 0, 0.4588235, 1, 1,
0.2252492, -0.1831315, 1.268449, 0, 0.454902, 1, 1,
0.2265402, -0.747546, 3.155185, 0, 0.4470588, 1, 1,
0.2320346, 0.04365794, 1.104635, 0, 0.4431373, 1, 1,
0.232124, 0.05863787, 1.893183, 0, 0.4352941, 1, 1,
0.2337727, -1.491755, 3.429387, 0, 0.4313726, 1, 1,
0.234257, -0.411328, 2.857785, 0, 0.4235294, 1, 1,
0.2374803, 1.316368, 0.888329, 0, 0.4196078, 1, 1,
0.2425693, -0.3006133, 3.245507, 0, 0.4117647, 1, 1,
0.2429962, 0.1707794, 0.8398004, 0, 0.4078431, 1, 1,
0.2444263, -0.1232674, 0.8238881, 0, 0.4, 1, 1,
0.2444485, -0.7657198, 1.835156, 0, 0.3921569, 1, 1,
0.2458566, -1.214764, 1.741187, 0, 0.3882353, 1, 1,
0.2461027, 0.659812, 0.609372, 0, 0.3803922, 1, 1,
0.2470475, -1.325239, 3.154119, 0, 0.3764706, 1, 1,
0.2479093, -1.553416, 2.080414, 0, 0.3686275, 1, 1,
0.2493561, 1.224194, -0.1133024, 0, 0.3647059, 1, 1,
0.2516588, 0.6958595, -0.3052834, 0, 0.3568628, 1, 1,
0.2532736, -0.6074891, 2.992041, 0, 0.3529412, 1, 1,
0.2572255, -0.3929993, 1.252452, 0, 0.345098, 1, 1,
0.2669132, -0.6591849, 2.49566, 0, 0.3411765, 1, 1,
0.267316, -1.926154, 3.449493, 0, 0.3333333, 1, 1,
0.2706598, -1.167897, 3.223217, 0, 0.3294118, 1, 1,
0.2713597, 0.1557134, 1.283079, 0, 0.3215686, 1, 1,
0.2715442, -1.153819, 2.076803, 0, 0.3176471, 1, 1,
0.2720873, 0.7894361, -0.9875708, 0, 0.3098039, 1, 1,
0.2734425, -1.071013, 5.085061, 0, 0.3058824, 1, 1,
0.2743075, -0.09078968, 1.974794, 0, 0.2980392, 1, 1,
0.2774959, -0.04453481, 2.530656, 0, 0.2901961, 1, 1,
0.2816645, 1.444032, -0.7288568, 0, 0.2862745, 1, 1,
0.284242, -0.223634, 1.896618, 0, 0.2784314, 1, 1,
0.2848769, 1.697101, 0.3127003, 0, 0.2745098, 1, 1,
0.294396, 0.1487222, 1.613484, 0, 0.2666667, 1, 1,
0.2964251, 0.205518, 0.5093287, 0, 0.2627451, 1, 1,
0.3000261, -1.546685, 2.451341, 0, 0.254902, 1, 1,
0.3023109, -0.01529615, 2.22287, 0, 0.2509804, 1, 1,
0.3048326, -0.425983, 0.9368631, 0, 0.2431373, 1, 1,
0.3071034, 0.4897832, 1.176579, 0, 0.2392157, 1, 1,
0.3080303, -1.673693, 2.121554, 0, 0.2313726, 1, 1,
0.3082701, -0.4440219, 4.294205, 0, 0.227451, 1, 1,
0.308459, 0.6899057, 0.4085791, 0, 0.2196078, 1, 1,
0.3125482, -0.8383325, 0.3977748, 0, 0.2156863, 1, 1,
0.3152038, 0.212114, 0.3703227, 0, 0.2078431, 1, 1,
0.3201134, -0.3487913, 3.54081, 0, 0.2039216, 1, 1,
0.3226247, -0.9358253, 1.5198, 0, 0.1960784, 1, 1,
0.3252744, 1.250119, -0.4498896, 0, 0.1882353, 1, 1,
0.326299, 0.07956029, 2.181776, 0, 0.1843137, 1, 1,
0.3317102, -0.5426818, 4.396445, 0, 0.1764706, 1, 1,
0.332656, -0.4784222, 1.853096, 0, 0.172549, 1, 1,
0.3328976, 1.119617, -0.1968351, 0, 0.1647059, 1, 1,
0.3332448, 0.2012964, 1.710215, 0, 0.1607843, 1, 1,
0.3341002, -1.119437, 3.548278, 0, 0.1529412, 1, 1,
0.3369796, -0.4502267, 2.107014, 0, 0.1490196, 1, 1,
0.3420812, 1.873824, -0.9639727, 0, 0.1411765, 1, 1,
0.3458964, 0.7210943, 0.5654373, 0, 0.1372549, 1, 1,
0.3464728, 0.9371535, -1.640054, 0, 0.1294118, 1, 1,
0.347401, -0.4797809, 1.922091, 0, 0.1254902, 1, 1,
0.3546871, 0.2215674, 0.8108197, 0, 0.1176471, 1, 1,
0.3557666, -0.3864459, 3.501676, 0, 0.1137255, 1, 1,
0.3621199, -0.3235941, 2.071575, 0, 0.1058824, 1, 1,
0.3646946, -1.183385, 3.098482, 0, 0.09803922, 1, 1,
0.3651983, -1.425795, 3.043703, 0, 0.09411765, 1, 1,
0.3675763, -0.4343186, 0.7998407, 0, 0.08627451, 1, 1,
0.370267, 0.1585815, 1.313999, 0, 0.08235294, 1, 1,
0.3707541, 1.302959, -0.1058779, 0, 0.07450981, 1, 1,
0.3712962, 0.2612853, 0.7346392, 0, 0.07058824, 1, 1,
0.375002, -2.042522, 1.409143, 0, 0.0627451, 1, 1,
0.3827622, 1.128373, -0.3399363, 0, 0.05882353, 1, 1,
0.38308, -0.151033, 1.82131, 0, 0.05098039, 1, 1,
0.3845295, -1.389651, 4.215935, 0, 0.04705882, 1, 1,
0.3977258, 0.6429697, -1.476346, 0, 0.03921569, 1, 1,
0.4017666, 0.7015959, -1.193925, 0, 0.03529412, 1, 1,
0.4017874, 1.043952, 0.3556021, 0, 0.02745098, 1, 1,
0.4052176, -0.5950734, 1.36998, 0, 0.02352941, 1, 1,
0.407846, 0.3400726, -0.8760992, 0, 0.01568628, 1, 1,
0.4087794, -0.1718336, 3.167509, 0, 0.01176471, 1, 1,
0.4089582, -0.8091075, 4.415197, 0, 0.003921569, 1, 1,
0.4097083, 0.6245327, -0.1599996, 0.003921569, 0, 1, 1,
0.4097644, 0.07314938, 0.5509912, 0.007843138, 0, 1, 1,
0.4097972, -1.060526, 1.951153, 0.01568628, 0, 1, 1,
0.4103329, 0.8018793, -1.037142, 0.01960784, 0, 1, 1,
0.4107649, 0.7227767, 0.8514009, 0.02745098, 0, 1, 1,
0.4162018, -0.009964579, 3.484846, 0.03137255, 0, 1, 1,
0.421863, 0.277314, 1.281775, 0.03921569, 0, 1, 1,
0.4247925, -0.6760135, 2.596412, 0.04313726, 0, 1, 1,
0.4267434, -0.844357, 3.268877, 0.05098039, 0, 1, 1,
0.4323822, 0.5676817, 2.087062, 0.05490196, 0, 1, 1,
0.4329766, 1.026987, -1.525648, 0.0627451, 0, 1, 1,
0.4340675, 0.4317099, 1.90107, 0.06666667, 0, 1, 1,
0.4343528, -0.6230485, 2.990591, 0.07450981, 0, 1, 1,
0.4353477, 0.4054599, 2.111938, 0.07843138, 0, 1, 1,
0.4413698, -0.3964261, 2.191611, 0.08627451, 0, 1, 1,
0.4451416, 0.7375787, 1.584784, 0.09019608, 0, 1, 1,
0.4517998, 0.8371684, 1.40663, 0.09803922, 0, 1, 1,
0.4518679, 0.4170504, 1.113474, 0.1058824, 0, 1, 1,
0.4545251, -0.09573457, 2.201065, 0.1098039, 0, 1, 1,
0.4582934, 0.658776, 2.166331, 0.1176471, 0, 1, 1,
0.4594555, -2.31951, 1.562562, 0.1215686, 0, 1, 1,
0.4624388, -0.05220632, 2.71234, 0.1294118, 0, 1, 1,
0.4671975, -1.076587, 1.844406, 0.1333333, 0, 1, 1,
0.4967977, 0.4292942, 0.6133367, 0.1411765, 0, 1, 1,
0.4976328, -0.2884709, 0.894084, 0.145098, 0, 1, 1,
0.497708, -0.3896399, 1.804872, 0.1529412, 0, 1, 1,
0.5125315, -1.163365, 3.582933, 0.1568628, 0, 1, 1,
0.5176268, 0.09495942, 0.05763929, 0.1647059, 0, 1, 1,
0.5179191, 0.2724048, 0.7805799, 0.1686275, 0, 1, 1,
0.5253087, 0.1937388, 3.089121, 0.1764706, 0, 1, 1,
0.5305682, -1.397829, 1.321359, 0.1803922, 0, 1, 1,
0.530919, -1.143535, 1.429747, 0.1882353, 0, 1, 1,
0.5347567, -0.5355299, 2.625409, 0.1921569, 0, 1, 1,
0.5365332, 0.6688806, 1.77484, 0.2, 0, 1, 1,
0.5379122, -2.021636, 3.417842, 0.2078431, 0, 1, 1,
0.538397, -1.784457, 3.06656, 0.2117647, 0, 1, 1,
0.5406128, 0.3005797, 1.929362, 0.2196078, 0, 1, 1,
0.5428679, 0.02453421, -0.0079827, 0.2235294, 0, 1, 1,
0.5491901, -0.02103839, 0.3662081, 0.2313726, 0, 1, 1,
0.555119, 1.067292, 0.7165045, 0.2352941, 0, 1, 1,
0.5587456, 1.152458, -0.6663284, 0.2431373, 0, 1, 1,
0.5598367, -2.244317, -0.4316014, 0.2470588, 0, 1, 1,
0.5625738, -1.096203, 1.261628, 0.254902, 0, 1, 1,
0.5628302, 0.5478703, 0.9816086, 0.2588235, 0, 1, 1,
0.5629191, 0.01782298, 0.7060212, 0.2666667, 0, 1, 1,
0.5664765, -1.623478, 2.564407, 0.2705882, 0, 1, 1,
0.5725104, 0.665159, 0.396715, 0.2784314, 0, 1, 1,
0.5750241, 0.5755098, 2.308648, 0.282353, 0, 1, 1,
0.5818831, -1.160708, 1.956641, 0.2901961, 0, 1, 1,
0.5828772, -0.9882529, 3.610012, 0.2941177, 0, 1, 1,
0.5844859, -1.014871, 4.448174, 0.3019608, 0, 1, 1,
0.5871195, 0.9873639, 1.958499, 0.3098039, 0, 1, 1,
0.5891983, 0.8527264, -0.3322146, 0.3137255, 0, 1, 1,
0.5898042, 1.109821, 0.7878538, 0.3215686, 0, 1, 1,
0.5951415, -1.50524, 3.981601, 0.3254902, 0, 1, 1,
0.596823, 0.4827329, 2.744886, 0.3333333, 0, 1, 1,
0.5971865, 0.8758226, 0.604821, 0.3372549, 0, 1, 1,
0.5997737, -0.2911356, 1.721707, 0.345098, 0, 1, 1,
0.6004065, 0.2606066, 0.9086146, 0.3490196, 0, 1, 1,
0.6040618, -0.05282232, 0.9110326, 0.3568628, 0, 1, 1,
0.6072862, 0.04492502, 2.638617, 0.3607843, 0, 1, 1,
0.608398, 0.8075776, 2.281004, 0.3686275, 0, 1, 1,
0.6086724, -0.02211983, 1.106396, 0.372549, 0, 1, 1,
0.6092173, 1.071431, 1.007137, 0.3803922, 0, 1, 1,
0.6136599, -1.20118, 3.505367, 0.3843137, 0, 1, 1,
0.6141832, 0.6235182, 0.7313532, 0.3921569, 0, 1, 1,
0.6158304, 0.01755309, 0.1464356, 0.3960784, 0, 1, 1,
0.617866, -0.5207504, 3.262787, 0.4039216, 0, 1, 1,
0.6214411, -0.2513351, 0.9365559, 0.4117647, 0, 1, 1,
0.6261308, 0.9233682, 1.123577, 0.4156863, 0, 1, 1,
0.6304798, 1.419655, 1.086287, 0.4235294, 0, 1, 1,
0.6363583, -0.6020781, 1.553833, 0.427451, 0, 1, 1,
0.6437994, 1.223747, 0.6187776, 0.4352941, 0, 1, 1,
0.6442662, -0.7284475, 2.494753, 0.4392157, 0, 1, 1,
0.6444184, 0.03847379, 2.666628, 0.4470588, 0, 1, 1,
0.6450515, 1.52712, -0.5631831, 0.4509804, 0, 1, 1,
0.6489472, -0.04379382, 2.883707, 0.4588235, 0, 1, 1,
0.6499678, -0.3158942, 0.4521087, 0.4627451, 0, 1, 1,
0.6542104, -0.3507818, 1.730383, 0.4705882, 0, 1, 1,
0.6553679, -0.1343838, 1.144913, 0.4745098, 0, 1, 1,
0.6712564, -0.7045175, 2.990402, 0.4823529, 0, 1, 1,
0.6733593, -0.5300639, 1.859489, 0.4862745, 0, 1, 1,
0.6781121, 0.09433252, 2.577652, 0.4941176, 0, 1, 1,
0.6784385, 0.04122445, 1.277136, 0.5019608, 0, 1, 1,
0.678794, 0.05044507, 3.690778, 0.5058824, 0, 1, 1,
0.6800346, 0.4468259, 2.209517, 0.5137255, 0, 1, 1,
0.6830677, 0.8535522, 0.4092855, 0.5176471, 0, 1, 1,
0.6832405, -0.5297425, 1.506908, 0.5254902, 0, 1, 1,
0.6870174, 0.4080788, 1.200565, 0.5294118, 0, 1, 1,
0.6898124, -0.5441296, 1.592026, 0.5372549, 0, 1, 1,
0.6952205, -0.8154266, 2.029242, 0.5411765, 0, 1, 1,
0.6982132, -0.8684945, 2.732651, 0.5490196, 0, 1, 1,
0.6986845, -1.370495, 1.920156, 0.5529412, 0, 1, 1,
0.6987772, -1.08491, 1.914837, 0.5607843, 0, 1, 1,
0.7005479, 0.1355723, 1.535844, 0.5647059, 0, 1, 1,
0.7046102, -0.8831618, 0.6643998, 0.572549, 0, 1, 1,
0.7082849, -0.4420771, 2.640233, 0.5764706, 0, 1, 1,
0.7109973, -0.6476243, 2.175135, 0.5843138, 0, 1, 1,
0.7133197, -0.5444357, 0.3754706, 0.5882353, 0, 1, 1,
0.7224867, 0.9504892, -2.608438, 0.5960785, 0, 1, 1,
0.7267337, -1.526132, 4.614453, 0.6039216, 0, 1, 1,
0.7269969, 1.831859, 0.2147348, 0.6078432, 0, 1, 1,
0.7301709, -1.435513, 1.285159, 0.6156863, 0, 1, 1,
0.7320735, 0.07130206, 1.147641, 0.6196079, 0, 1, 1,
0.7404805, 0.5883971, 0.7231551, 0.627451, 0, 1, 1,
0.7468434, 0.3584202, 0.6236748, 0.6313726, 0, 1, 1,
0.7523109, -0.7062114, 3.504457, 0.6392157, 0, 1, 1,
0.768429, -1.665902, 4.260702, 0.6431373, 0, 1, 1,
0.7705843, 0.4646809, 1.852621, 0.6509804, 0, 1, 1,
0.7732262, -0.9655976, 0.488907, 0.654902, 0, 1, 1,
0.7774642, -0.9522904, 3.094119, 0.6627451, 0, 1, 1,
0.7785904, -0.9597967, 1.74642, 0.6666667, 0, 1, 1,
0.78074, 0.8398398, -0.5656975, 0.6745098, 0, 1, 1,
0.7847174, -0.7793998, 3.591682, 0.6784314, 0, 1, 1,
0.7866576, 0.9302614, 0.01384676, 0.6862745, 0, 1, 1,
0.7926949, -2.465989, 2.768611, 0.6901961, 0, 1, 1,
0.7959512, 0.5534711, -0.06060623, 0.6980392, 0, 1, 1,
0.7987646, -2.97825, 2.094543, 0.7058824, 0, 1, 1,
0.8109266, -0.2486032, 2.712407, 0.7098039, 0, 1, 1,
0.8140752, 0.7491161, 0.9969569, 0.7176471, 0, 1, 1,
0.8229194, 0.7997029, -0.5838197, 0.7215686, 0, 1, 1,
0.8271713, -0.1914696, 2.688171, 0.7294118, 0, 1, 1,
0.8290681, -0.9879968, 2.067991, 0.7333333, 0, 1, 1,
0.8326067, -2.336204, 3.525753, 0.7411765, 0, 1, 1,
0.838567, -0.4585766, 3.267456, 0.7450981, 0, 1, 1,
0.8389885, -0.7598697, 2.067033, 0.7529412, 0, 1, 1,
0.842149, 0.844447, -0.28711, 0.7568628, 0, 1, 1,
0.8476313, 0.7289754, 1.024435, 0.7647059, 0, 1, 1,
0.8489395, 0.609759, 1.270564, 0.7686275, 0, 1, 1,
0.8491414, 1.366659, -0.6125538, 0.7764706, 0, 1, 1,
0.8492484, -1.035206, 2.077424, 0.7803922, 0, 1, 1,
0.8529636, 1.437887, -0.6817767, 0.7882353, 0, 1, 1,
0.8601974, -0.9228916, 3.148394, 0.7921569, 0, 1, 1,
0.8606949, -1.011731, 1.746628, 0.8, 0, 1, 1,
0.8607523, -0.7868661, 2.689263, 0.8078431, 0, 1, 1,
0.8661729, -0.8249285, 1.930465, 0.8117647, 0, 1, 1,
0.870177, -1.323128, 3.113876, 0.8196079, 0, 1, 1,
0.876747, 1.566865, -0.09693176, 0.8235294, 0, 1, 1,
0.8774027, -2.556955, 0.4719789, 0.8313726, 0, 1, 1,
0.8779765, 0.4019975, 1.788794, 0.8352941, 0, 1, 1,
0.8786641, 0.5872459, 3.358624, 0.8431373, 0, 1, 1,
0.8812029, -1.787196, 3.080579, 0.8470588, 0, 1, 1,
0.8835564, -1.030021, 2.350572, 0.854902, 0, 1, 1,
0.8906078, -0.2808071, 3.737842, 0.8588235, 0, 1, 1,
0.8943274, 0.3812178, 0.5935767, 0.8666667, 0, 1, 1,
0.8948346, 0.08701865, 1.797447, 0.8705882, 0, 1, 1,
0.8969861, 0.3837875, 0.1748948, 0.8784314, 0, 1, 1,
0.8992671, -1.100141, 4.629159, 0.8823529, 0, 1, 1,
0.9049895, 1.269807, 0.8415282, 0.8901961, 0, 1, 1,
0.9063879, -0.6937531, 1.768059, 0.8941177, 0, 1, 1,
0.9069266, -0.1738931, 2.364402, 0.9019608, 0, 1, 1,
0.9165147, -0.5658837, 2.524513, 0.9098039, 0, 1, 1,
0.9171386, -0.08986794, 2.878942, 0.9137255, 0, 1, 1,
0.9174373, -1.16029, 2.683561, 0.9215686, 0, 1, 1,
0.9234926, -0.7775378, 2.69855, 0.9254902, 0, 1, 1,
0.9239223, -0.4576292, 2.791742, 0.9333333, 0, 1, 1,
0.9239703, 0.3810378, 0.05009801, 0.9372549, 0, 1, 1,
0.926235, 1.019329, 2.679803, 0.945098, 0, 1, 1,
0.9273906, 0.3351646, 2.247608, 0.9490196, 0, 1, 1,
0.9356942, 0.1396194, 1.351317, 0.9568627, 0, 1, 1,
0.937005, -0.1482945, 2.297918, 0.9607843, 0, 1, 1,
0.9374798, 1.574012, 1.41275, 0.9686275, 0, 1, 1,
0.9379927, 0.2832039, 0.1235198, 0.972549, 0, 1, 1,
0.9441184, -1.020601, 2.782528, 0.9803922, 0, 1, 1,
0.9507819, 0.1902016, 1.403178, 0.9843137, 0, 1, 1,
0.9511074, 0.1012241, 3.345724, 0.9921569, 0, 1, 1,
0.9554287, 0.7445464, 2.069239, 0.9960784, 0, 1, 1,
0.9646457, -0.2066378, 3.140229, 1, 0, 0.9960784, 1,
0.9703987, -1.474731, 0.4289233, 1, 0, 0.9882353, 1,
0.9717016, 0.7489615, 1.387977, 1, 0, 0.9843137, 1,
0.9782998, -0.2030817, 1.538792, 1, 0, 0.9764706, 1,
0.9873981, 2.114179, 0.6714711, 1, 0, 0.972549, 1,
0.9917831, -0.6797026, 0.1774809, 1, 0, 0.9647059, 1,
1.000674, 0.4218508, 1.418777, 1, 0, 0.9607843, 1,
1.002429, -1.097895, 4.25943, 1, 0, 0.9529412, 1,
1.004672, -0.2384418, 1.445942, 1, 0, 0.9490196, 1,
1.008344, 0.5369135, 0.8172923, 1, 0, 0.9411765, 1,
1.011976, 1.506056, 1.178543, 1, 0, 0.9372549, 1,
1.016714, 0.4699205, 0.6424351, 1, 0, 0.9294118, 1,
1.019781, 2.45528, -0.8901078, 1, 0, 0.9254902, 1,
1.022195, -0.03323597, 2.379651, 1, 0, 0.9176471, 1,
1.034747, -1.302792, 1.860913, 1, 0, 0.9137255, 1,
1.053556, 1.050279, 0.04142792, 1, 0, 0.9058824, 1,
1.053592, 0.1104001, 0.07684123, 1, 0, 0.9019608, 1,
1.058515, 1.690046, 0.5936196, 1, 0, 0.8941177, 1,
1.062494, -1.195301, 1.175998, 1, 0, 0.8862745, 1,
1.065207, -1.368825, 2.15284, 1, 0, 0.8823529, 1,
1.074169, 0.466657, 3.111426, 1, 0, 0.8745098, 1,
1.077052, -0.780166, 1.227236, 1, 0, 0.8705882, 1,
1.096556, 0.5201358, 1.346444, 1, 0, 0.8627451, 1,
1.097849, 0.5714773, -0.003075291, 1, 0, 0.8588235, 1,
1.100096, 1.425069, 1.260258, 1, 0, 0.8509804, 1,
1.106133, -0.7232497, 1.038738, 1, 0, 0.8470588, 1,
1.117678, 1.178008, -0.01614015, 1, 0, 0.8392157, 1,
1.119201, -0.5358225, 1.522619, 1, 0, 0.8352941, 1,
1.124386, -1.221025, 1.922588, 1, 0, 0.827451, 1,
1.133407, 0.2143872, 1.61483, 1, 0, 0.8235294, 1,
1.138632, -0.946955, 3.512806, 1, 0, 0.8156863, 1,
1.140792, -0.3684477, 3.226248, 1, 0, 0.8117647, 1,
1.147584, -0.139867, 2.547378, 1, 0, 0.8039216, 1,
1.150906, 1.089469, 0.1467413, 1, 0, 0.7960784, 1,
1.15624, -0.9370282, 2.011106, 1, 0, 0.7921569, 1,
1.158095, -0.4381486, 2.003008, 1, 0, 0.7843137, 1,
1.159702, 0.3372451, 1.327011, 1, 0, 0.7803922, 1,
1.164158, -0.9815045, 3.211908, 1, 0, 0.772549, 1,
1.165834, 0.4703974, 3.334017, 1, 0, 0.7686275, 1,
1.171903, 0.3225539, -0.2917208, 1, 0, 0.7607843, 1,
1.190945, 0.6217632, 1.752587, 1, 0, 0.7568628, 1,
1.191357, -0.4990619, 0.802093, 1, 0, 0.7490196, 1,
1.192674, -0.6404626, 0.2214849, 1, 0, 0.7450981, 1,
1.213052, -0.8240231, 2.632319, 1, 0, 0.7372549, 1,
1.227329, 0.08744799, 0.10601, 1, 0, 0.7333333, 1,
1.230498, 1.411011, 1.187571, 1, 0, 0.7254902, 1,
1.230909, 0.3229502, 0.5970715, 1, 0, 0.7215686, 1,
1.231877, 0.2530401, 1.655435, 1, 0, 0.7137255, 1,
1.233217, 0.6057612, 1.857102, 1, 0, 0.7098039, 1,
1.242911, -0.4660132, 0.2971857, 1, 0, 0.7019608, 1,
1.24902, 1.688186, -1.076531, 1, 0, 0.6941177, 1,
1.252049, 0.9862829, 1.298646, 1, 0, 0.6901961, 1,
1.253323, 0.5032858, 1.240457, 1, 0, 0.682353, 1,
1.256345, 0.8431963, -1.054987, 1, 0, 0.6784314, 1,
1.266314, 0.2145133, 1.205973, 1, 0, 0.6705883, 1,
1.266624, -0.5838662, 1.782016, 1, 0, 0.6666667, 1,
1.282069, -0.9270421, 3.178003, 1, 0, 0.6588235, 1,
1.288946, -0.9541329, 1.823594, 1, 0, 0.654902, 1,
1.301909, -1.918389, 4.087964, 1, 0, 0.6470588, 1,
1.302005, -0.3873464, 1.974604, 1, 0, 0.6431373, 1,
1.318941, 1.218653, 0.5836849, 1, 0, 0.6352941, 1,
1.322708, 0.4553708, 1.253643, 1, 0, 0.6313726, 1,
1.355805, -0.9069502, 1.059737, 1, 0, 0.6235294, 1,
1.359932, -0.3516756, -0.2390545, 1, 0, 0.6196079, 1,
1.364468, -0.96521, 3.017315, 1, 0, 0.6117647, 1,
1.367965, -0.04701898, 5.227052, 1, 0, 0.6078432, 1,
1.371076, -0.442083, 1.07272, 1, 0, 0.6, 1,
1.375126, -0.9018291, 0.8006098, 1, 0, 0.5921569, 1,
1.375702, 1.21859, 0.6219248, 1, 0, 0.5882353, 1,
1.378843, 0.236879, 2.304561, 1, 0, 0.5803922, 1,
1.385349, -0.810876, 0.7097662, 1, 0, 0.5764706, 1,
1.397539, -0.5610927, 1.104963, 1, 0, 0.5686275, 1,
1.413704, -0.6217902, 1.621909, 1, 0, 0.5647059, 1,
1.415803, 2.932895, -0.3678859, 1, 0, 0.5568628, 1,
1.449837, -1.441591, 1.777406, 1, 0, 0.5529412, 1,
1.454052, 0.8424951, 1.480207, 1, 0, 0.5450981, 1,
1.464855, -0.9127222, 1.058437, 1, 0, 0.5411765, 1,
1.474069, 0.6607649, 1.935253, 1, 0, 0.5333334, 1,
1.477262, -0.05090579, 3.029803, 1, 0, 0.5294118, 1,
1.479224, -0.8883064, 1.004512, 1, 0, 0.5215687, 1,
1.47929, 0.3112666, 0.1414634, 1, 0, 0.5176471, 1,
1.495519, -0.7142969, 0.7574028, 1, 0, 0.509804, 1,
1.498691, -0.9522008, 1.196517, 1, 0, 0.5058824, 1,
1.500046, 0.1773485, 0.8916861, 1, 0, 0.4980392, 1,
1.501161, 1.338587, 0.7789943, 1, 0, 0.4901961, 1,
1.51957, -0.4092709, -0.4119068, 1, 0, 0.4862745, 1,
1.522285, -0.2451538, 1.16238, 1, 0, 0.4784314, 1,
1.523823, 0.01581932, 1.571897, 1, 0, 0.4745098, 1,
1.529653, 2.143865, 0.5502079, 1, 0, 0.4666667, 1,
1.532011, -0.9995404, 2.210038, 1, 0, 0.4627451, 1,
1.539702, -0.7284737, 2.994267, 1, 0, 0.454902, 1,
1.542674, 0.008643987, 1.123121, 1, 0, 0.4509804, 1,
1.552896, 0.3854181, 0.444022, 1, 0, 0.4431373, 1,
1.55657, 0.7560451, 0.9641629, 1, 0, 0.4392157, 1,
1.558179, 1.503933, 1.634769, 1, 0, 0.4313726, 1,
1.561067, 1.772493, 0.1362172, 1, 0, 0.427451, 1,
1.561313, -1.36509, 1.02692, 1, 0, 0.4196078, 1,
1.563803, -0.5365684, 2.676958, 1, 0, 0.4156863, 1,
1.577375, 1.6282, 0.6129206, 1, 0, 0.4078431, 1,
1.578021, -1.827689, 3.583349, 1, 0, 0.4039216, 1,
1.579378, -0.9469899, 2.56408, 1, 0, 0.3960784, 1,
1.580303, -0.5941427, 2.508149, 1, 0, 0.3882353, 1,
1.587081, 0.6631718, 1.054101, 1, 0, 0.3843137, 1,
1.60243, -0.1535808, -1.472903, 1, 0, 0.3764706, 1,
1.611921, 0.511782, 0.7391462, 1, 0, 0.372549, 1,
1.614182, 0.5652763, -0.4566987, 1, 0, 0.3647059, 1,
1.617658, 0.008518733, 2.271529, 1, 0, 0.3607843, 1,
1.631154, 1.289551, 1.10384, 1, 0, 0.3529412, 1,
1.63184, 1.334528, 0.816867, 1, 0, 0.3490196, 1,
1.635779, 0.1763706, 1.422121, 1, 0, 0.3411765, 1,
1.637501, -0.6082096, 3.85617, 1, 0, 0.3372549, 1,
1.64809, 0.7355891, -0.07454847, 1, 0, 0.3294118, 1,
1.658228, 0.6059349, 1.420552, 1, 0, 0.3254902, 1,
1.659281, 0.9353964, 1.401136, 1, 0, 0.3176471, 1,
1.668341, 0.871296, 0.6869684, 1, 0, 0.3137255, 1,
1.6799, 0.07084889, 2.237422, 1, 0, 0.3058824, 1,
1.701501, 0.258031, 1.626239, 1, 0, 0.2980392, 1,
1.704961, -0.9046872, 2.0595, 1, 0, 0.2941177, 1,
1.710926, -1.874415, 1.781535, 1, 0, 0.2862745, 1,
1.712113, 1.745214, 1.187384, 1, 0, 0.282353, 1,
1.716723, -1.031797, 3.115628, 1, 0, 0.2745098, 1,
1.730736, -0.7976849, 2.480258, 1, 0, 0.2705882, 1,
1.731909, -0.4650068, 1.159232, 1, 0, 0.2627451, 1,
1.747272, -0.6664525, 2.406906, 1, 0, 0.2588235, 1,
1.752024, 0.7774195, 1.701873, 1, 0, 0.2509804, 1,
1.771171, 0.2391732, 0.5205592, 1, 0, 0.2470588, 1,
1.779847, 0.05190329, 0.768696, 1, 0, 0.2392157, 1,
1.780113, 1.525521, 1.485233, 1, 0, 0.2352941, 1,
1.786383, -0.9204959, 2.352284, 1, 0, 0.227451, 1,
1.790054, -2.094499, 3.372822, 1, 0, 0.2235294, 1,
1.814857, 0.8595544, 1.847059, 1, 0, 0.2156863, 1,
1.826093, 1.207892, -1.205135, 1, 0, 0.2117647, 1,
1.874116, 0.7439289, 1.036307, 1, 0, 0.2039216, 1,
1.881629, 0.1022219, 0.8712705, 1, 0, 0.1960784, 1,
1.895072, -0.1336523, 0.8810138, 1, 0, 0.1921569, 1,
1.90169, 0.4594052, 1.4341, 1, 0, 0.1843137, 1,
1.914119, -1.283059, 2.82469, 1, 0, 0.1803922, 1,
1.927013, -0.3744602, 4.628646, 1, 0, 0.172549, 1,
1.92911, 0.1405526, 1.757107, 1, 0, 0.1686275, 1,
1.945303, -0.4599987, 2.380753, 1, 0, 0.1607843, 1,
1.958504, -1.13544, 0.6176379, 1, 0, 0.1568628, 1,
1.960189, -0.7124863, 1.878743, 1, 0, 0.1490196, 1,
1.970555, 1.25231, 1.201213, 1, 0, 0.145098, 1,
1.976488, 0.6685499, 1.061399, 1, 0, 0.1372549, 1,
2.037326, 0.2659701, 3.46458, 1, 0, 0.1333333, 1,
2.040186, 1.063284, 1.197523, 1, 0, 0.1254902, 1,
2.07549, -1.685159, 2.611794, 1, 0, 0.1215686, 1,
2.087913, -0.102538, 0.6928713, 1, 0, 0.1137255, 1,
2.101798, 0.2907951, 1.845998, 1, 0, 0.1098039, 1,
2.109885, 1.229124, 0.6399472, 1, 0, 0.1019608, 1,
2.165428, 0.05659577, 2.491124, 1, 0, 0.09411765, 1,
2.16561, 0.5735947, 3.266821, 1, 0, 0.09019608, 1,
2.174542, -0.4994543, 3.38978, 1, 0, 0.08235294, 1,
2.182824, 0.6212036, 1.877545, 1, 0, 0.07843138, 1,
2.18932, -0.1481231, -1.127, 1, 0, 0.07058824, 1,
2.221616, 1.008785, 0.9301879, 1, 0, 0.06666667, 1,
2.312874, -0.1150454, 2.00259, 1, 0, 0.05882353, 1,
2.320106, 0.323835, 1.235748, 1, 0, 0.05490196, 1,
2.325292, -1.856796, 0.5659459, 1, 0, 0.04705882, 1,
2.334799, -1.849488, 3.471362, 1, 0, 0.04313726, 1,
2.353145, -0.701304, 0.6648099, 1, 0, 0.03529412, 1,
2.558493, -0.6234918, 1.058955, 1, 0, 0.03137255, 1,
2.633543, -0.05586473, 2.921416, 1, 0, 0.02352941, 1,
2.654456, -2.379221, 1.370275, 1, 0, 0.01960784, 1,
2.736671, 0.3387055, 1.537494, 1, 0, 0.01176471, 1,
2.960148, -0.7009453, 2.147458, 1, 0, 0.007843138, 1
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
-0.1494572, -4.153552, -7.257721, 0, -0.5, 0.5, 0.5,
-0.1494572, -4.153552, -7.257721, 1, -0.5, 0.5, 0.5,
-0.1494572, -4.153552, -7.257721, 1, 1.5, 0.5, 0.5,
-0.1494572, -4.153552, -7.257721, 0, 1.5, 0.5, 0.5
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
-4.313218, 0.405063, -7.257721, 0, -0.5, 0.5, 0.5,
-4.313218, 0.405063, -7.257721, 1, -0.5, 0.5, 0.5,
-4.313218, 0.405063, -7.257721, 1, 1.5, 0.5, 0.5,
-4.313218, 0.405063, -7.257721, 0, 1.5, 0.5, 0.5
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
-4.313218, -4.153552, -0.1106024, 0, -0.5, 0.5, 0.5,
-4.313218, -4.153552, -0.1106024, 1, -0.5, 0.5, 0.5,
-4.313218, -4.153552, -0.1106024, 1, 1.5, 0.5, 0.5,
-4.313218, -4.153552, -0.1106024, 0, 1.5, 0.5, 0.5
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
-3, -3.101564, -5.608386,
2, -3.101564, -5.608386,
-3, -3.101564, -5.608386,
-3, -3.276895, -5.883276,
-2, -3.101564, -5.608386,
-2, -3.276895, -5.883276,
-1, -3.101564, -5.608386,
-1, -3.276895, -5.883276,
0, -3.101564, -5.608386,
0, -3.276895, -5.883276,
1, -3.101564, -5.608386,
1, -3.276895, -5.883276,
2, -3.101564, -5.608386,
2, -3.276895, -5.883276
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
-3, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
-3, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
-3, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
-3, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5,
-2, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
-2, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
-2, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
-2, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5,
-1, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
-1, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
-1, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
-1, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5,
0, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
0, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
0, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
0, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5,
1, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
1, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
1, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
1, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5,
2, -3.627558, -6.433053, 0, -0.5, 0.5, 0.5,
2, -3.627558, -6.433053, 1, -0.5, 0.5, 0.5,
2, -3.627558, -6.433053, 1, 1.5, 0.5, 0.5,
2, -3.627558, -6.433053, 0, 1.5, 0.5, 0.5
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
-3.35235, -2, -5.608386,
-3.35235, 3, -5.608386,
-3.35235, -2, -5.608386,
-3.512495, -2, -5.883276,
-3.35235, -1, -5.608386,
-3.512495, -1, -5.883276,
-3.35235, 0, -5.608386,
-3.512495, 0, -5.883276,
-3.35235, 1, -5.608386,
-3.512495, 1, -5.883276,
-3.35235, 2, -5.608386,
-3.512495, 2, -5.883276,
-3.35235, 3, -5.608386,
-3.512495, 3, -5.883276
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
-3.832784, -2, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, -2, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, -2, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, -2, -6.433053, 0, 1.5, 0.5, 0.5,
-3.832784, -1, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, -1, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, -1, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, -1, -6.433053, 0, 1.5, 0.5, 0.5,
-3.832784, 0, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, 0, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, 0, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, 0, -6.433053, 0, 1.5, 0.5, 0.5,
-3.832784, 1, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, 1, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, 1, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, 1, -6.433053, 0, 1.5, 0.5, 0.5,
-3.832784, 2, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, 2, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, 2, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, 2, -6.433053, 0, 1.5, 0.5, 0.5,
-3.832784, 3, -6.433053, 0, -0.5, 0.5, 0.5,
-3.832784, 3, -6.433053, 1, -0.5, 0.5, 0.5,
-3.832784, 3, -6.433053, 1, 1.5, 0.5, 0.5,
-3.832784, 3, -6.433053, 0, 1.5, 0.5, 0.5
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
-3.35235, -3.101564, -4,
-3.35235, -3.101564, 4,
-3.35235, -3.101564, -4,
-3.512495, -3.276895, -4,
-3.35235, -3.101564, -2,
-3.512495, -3.276895, -2,
-3.35235, -3.101564, 0,
-3.512495, -3.276895, 0,
-3.35235, -3.101564, 2,
-3.512495, -3.276895, 2,
-3.35235, -3.101564, 4,
-3.512495, -3.276895, 4
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
-3.832784, -3.627558, -4, 0, -0.5, 0.5, 0.5,
-3.832784, -3.627558, -4, 1, -0.5, 0.5, 0.5,
-3.832784, -3.627558, -4, 1, 1.5, 0.5, 0.5,
-3.832784, -3.627558, -4, 0, 1.5, 0.5, 0.5,
-3.832784, -3.627558, -2, 0, -0.5, 0.5, 0.5,
-3.832784, -3.627558, -2, 1, -0.5, 0.5, 0.5,
-3.832784, -3.627558, -2, 1, 1.5, 0.5, 0.5,
-3.832784, -3.627558, -2, 0, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 0, 0, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 0, 1, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 0, 1, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 0, 0, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 2, 0, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 2, 1, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 2, 1, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 2, 0, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 4, 0, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 4, 1, -0.5, 0.5, 0.5,
-3.832784, -3.627558, 4, 1, 1.5, 0.5, 0.5,
-3.832784, -3.627558, 4, 0, 1.5, 0.5, 0.5
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
-3.35235, -3.101564, -5.608386,
-3.35235, 3.91169, -5.608386,
-3.35235, -3.101564, 5.387181,
-3.35235, 3.91169, 5.387181,
-3.35235, -3.101564, -5.608386,
-3.35235, -3.101564, 5.387181,
-3.35235, 3.91169, -5.608386,
-3.35235, 3.91169, 5.387181,
-3.35235, -3.101564, -5.608386,
3.053436, -3.101564, -5.608386,
-3.35235, -3.101564, 5.387181,
3.053436, -3.101564, 5.387181,
-3.35235, 3.91169, -5.608386,
3.053436, 3.91169, -5.608386,
-3.35235, 3.91169, 5.387181,
3.053436, 3.91169, 5.387181,
3.053436, -3.101564, -5.608386,
3.053436, 3.91169, -5.608386,
3.053436, -3.101564, 5.387181,
3.053436, 3.91169, 5.387181,
3.053436, -3.101564, -5.608386,
3.053436, -3.101564, 5.387181,
3.053436, 3.91169, -5.608386,
3.053436, 3.91169, 5.387181
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
var radius = 7.758764;
var distance = 34.51962;
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
mvMatrix.translate( 0.1494572, -0.405063, 0.1106024 );
mvMatrix.scale( 1.309586, 1.196153, 0.7629372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51962);
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
ditolyl_ether<-read.table("ditolyl_ether.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ditolyl_ether$V2
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
```

```r
y<-ditolyl_ether$V3
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
```

```r
z<-ditolyl_ether$V4
```

```
## Error in eval(expr, envir, enclos): object 'ditolyl_ether' not found
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
-3.259062, -0.1982119, -2.896266, 0, 0, 1, 1, 1,
-2.985301, -0.149159, -3.027974, 1, 0, 0, 1, 1,
-2.88792, -1.689432, -1.485101, 1, 0, 0, 1, 1,
-2.774065, 0.2300244, -2.709264, 1, 0, 0, 1, 1,
-2.67162, 0.01500059, -4.033006, 1, 0, 0, 1, 1,
-2.667727, -0.1661622, -1.316376, 1, 0, 0, 1, 1,
-2.628953, -1.631971, -2.893129, 0, 0, 0, 1, 1,
-2.424214, 1.036398, -0.7442386, 0, 0, 0, 1, 1,
-2.422275, -2.366454, -2.559837, 0, 0, 0, 1, 1,
-2.374242, -1.756213, -3.170647, 0, 0, 0, 1, 1,
-2.37287, 0.1785616, -1.721155, 0, 0, 0, 1, 1,
-2.315773, -0.9782509, -2.324949, 0, 0, 0, 1, 1,
-2.284472, 1.271961, -0.3083933, 0, 0, 0, 1, 1,
-2.198583, 1.024173, -1.965346, 1, 1, 1, 1, 1,
-2.180493, -0.4706391, -1.867515, 1, 1, 1, 1, 1,
-2.177123, -0.009292932, -1.920724, 1, 1, 1, 1, 1,
-2.174419, -0.6408947, -1.770837, 1, 1, 1, 1, 1,
-2.164124, -1.092839, -3.027248, 1, 1, 1, 1, 1,
-2.121511, -1.271758, -1.485232, 1, 1, 1, 1, 1,
-2.092605, 1.076528, -0.7730557, 1, 1, 1, 1, 1,
-2.088754, 0.4543722, 0.1478861, 1, 1, 1, 1, 1,
-2.03868, -0.1869309, -1.660145, 1, 1, 1, 1, 1,
-2.027863, -0.7519224, -0.6112526, 1, 1, 1, 1, 1,
-2.022901, 0.8216341, -2.472586, 1, 1, 1, 1, 1,
-1.975081, -0.3583402, -2.918377, 1, 1, 1, 1, 1,
-1.940446, -0.4530104, -0.9577919, 1, 1, 1, 1, 1,
-1.904058, -0.2404297, -3.067256, 1, 1, 1, 1, 1,
-1.900561, -1.325924, -1.872612, 1, 1, 1, 1, 1,
-1.895573, 1.156303, -2.033028, 0, 0, 1, 1, 1,
-1.893056, 0.08534371, -1.517005, 1, 0, 0, 1, 1,
-1.870366, 1.872353, -2.298375, 1, 0, 0, 1, 1,
-1.850848, -0.2387324, -1.383993, 1, 0, 0, 1, 1,
-1.84304, 0.249658, -0.7129964, 1, 0, 0, 1, 1,
-1.840713, 0.5863087, -2.384907, 1, 0, 0, 1, 1,
-1.837931, 1.500767, -0.9385002, 0, 0, 0, 1, 1,
-1.829834, 0.9707236, 0.6372455, 0, 0, 0, 1, 1,
-1.828454, -0.1341462, -0.7228059, 0, 0, 0, 1, 1,
-1.825494, -1.51238, -2.181203, 0, 0, 0, 1, 1,
-1.806238, 1.229193, -1.236036, 0, 0, 0, 1, 1,
-1.802364, 0.1553503, 0.185091, 0, 0, 0, 1, 1,
-1.792257, 1.034891, -0.8142408, 0, 0, 0, 1, 1,
-1.790115, 0.228187, -2.17507, 1, 1, 1, 1, 1,
-1.757299, 0.007036098, -0.7157958, 1, 1, 1, 1, 1,
-1.753454, -1.174301, -2.718759, 1, 1, 1, 1, 1,
-1.735665, -1.618351, -3.309569, 1, 1, 1, 1, 1,
-1.730755, 1.550988, -1.208446, 1, 1, 1, 1, 1,
-1.725922, -0.08478562, -3.064383, 1, 1, 1, 1, 1,
-1.725054, -0.04426096, -2.129328, 1, 1, 1, 1, 1,
-1.705491, -2.229498, -2.682465, 1, 1, 1, 1, 1,
-1.698768, 0.6123343, -0.2833127, 1, 1, 1, 1, 1,
-1.687633, 1.567176, 0.5616968, 1, 1, 1, 1, 1,
-1.67728, 0.161226, -0.4555518, 1, 1, 1, 1, 1,
-1.669471, 0.9578084, -1.99937, 1, 1, 1, 1, 1,
-1.667109, -0.03245901, -3.519244, 1, 1, 1, 1, 1,
-1.654681, 3.059403, -0.4682925, 1, 1, 1, 1, 1,
-1.653389, 0.7983475, -1.395165, 1, 1, 1, 1, 1,
-1.650297, 0.1335329, -0.7590886, 0, 0, 1, 1, 1,
-1.611511, -0.5796624, -2.202778, 1, 0, 0, 1, 1,
-1.609618, 1.965385, -0.03446022, 1, 0, 0, 1, 1,
-1.609583, 0.05693559, -2.674244, 1, 0, 0, 1, 1,
-1.609529, -0.5073804, -1.916855, 1, 0, 0, 1, 1,
-1.605635, 1.471077, -0.2691187, 1, 0, 0, 1, 1,
-1.565904, -1.548442, -1.562964, 0, 0, 0, 1, 1,
-1.564206, 0.02322657, -1.672166, 0, 0, 0, 1, 1,
-1.559022, 0.3047415, -1.929664, 0, 0, 0, 1, 1,
-1.558648, 0.08489946, -1.801889, 0, 0, 0, 1, 1,
-1.543812, 0.08854111, -0.4616114, 0, 0, 0, 1, 1,
-1.532588, -0.4049466, -1.675265, 0, 0, 0, 1, 1,
-1.52913, 0.2720395, -1.381511, 0, 0, 0, 1, 1,
-1.524523, 1.301362, -0.1292451, 1, 1, 1, 1, 1,
-1.514106, -0.5962463, 0.3170991, 1, 1, 1, 1, 1,
-1.511904, -2.006604, -3.04738, 1, 1, 1, 1, 1,
-1.503867, 0.8853215, 0.6180154, 1, 1, 1, 1, 1,
-1.502848, 0.4173742, -2.534586, 1, 1, 1, 1, 1,
-1.477106, 0.3028088, -0.6482569, 1, 1, 1, 1, 1,
-1.47415, -0.3287534, -0.5999939, 1, 1, 1, 1, 1,
-1.46873, -0.5732232, -2.544384, 1, 1, 1, 1, 1,
-1.46796, -0.550832, -2.320542, 1, 1, 1, 1, 1,
-1.455821, 1.080106, -0.7169331, 1, 1, 1, 1, 1,
-1.455021, 0.1127255, -2.232547, 1, 1, 1, 1, 1,
-1.441579, -0.7313296, -0.8933635, 1, 1, 1, 1, 1,
-1.436533, -1.578853, -1.344686, 1, 1, 1, 1, 1,
-1.433439, 0.5633982, -0.485441, 1, 1, 1, 1, 1,
-1.433074, -1.15319, -2.878396, 1, 1, 1, 1, 1,
-1.431134, 0.6044124, 0.2586747, 0, 0, 1, 1, 1,
-1.430723, 1.654721, -1.102248, 1, 0, 0, 1, 1,
-1.420742, 0.545179, -1.207425, 1, 0, 0, 1, 1,
-1.419166, 0.8146667, -1.14929, 1, 0, 0, 1, 1,
-1.416419, 0.1303246, 0.4093114, 1, 0, 0, 1, 1,
-1.415377, -1.271073, -3.148552, 1, 0, 0, 1, 1,
-1.413926, -0.4186305, -2.667485, 0, 0, 0, 1, 1,
-1.413106, 0.6235903, -2.219741, 0, 0, 0, 1, 1,
-1.402943, 0.8334631, -0.534214, 0, 0, 0, 1, 1,
-1.396913, 1.361274, -0.1416602, 0, 0, 0, 1, 1,
-1.390245, -0.9984283, -4.079238, 0, 0, 0, 1, 1,
-1.389288, 2.0092, 0.2067666, 0, 0, 0, 1, 1,
-1.387016, -0.1832951, -1.677306, 0, 0, 0, 1, 1,
-1.375965, 0.485756, 0.7023742, 1, 1, 1, 1, 1,
-1.375873, -0.2307485, -1.755582, 1, 1, 1, 1, 1,
-1.375165, -0.5943865, -3.234303, 1, 1, 1, 1, 1,
-1.350962, -0.2638698, -2.800919, 1, 1, 1, 1, 1,
-1.350205, 0.7203645, -2.305082, 1, 1, 1, 1, 1,
-1.348265, -1.606913, -0.9894252, 1, 1, 1, 1, 1,
-1.347063, -0.4517105, -0.786056, 1, 1, 1, 1, 1,
-1.346983, -1.78306, -1.657571, 1, 1, 1, 1, 1,
-1.344624, 0.3167227, -0.5308001, 1, 1, 1, 1, 1,
-1.330427, 0.4453574, -1.846976, 1, 1, 1, 1, 1,
-1.325206, 0.6242667, -2.676014, 1, 1, 1, 1, 1,
-1.32362, -1.342143, -3.693269, 1, 1, 1, 1, 1,
-1.317859, 0.4972142, -1.022834, 1, 1, 1, 1, 1,
-1.317623, -0.4454965, -2.888438, 1, 1, 1, 1, 1,
-1.316599, -0.157884, -2.286725, 1, 1, 1, 1, 1,
-1.31653, 0.2166402, -0.6639768, 0, 0, 1, 1, 1,
-1.308337, 0.9838856, -1.799154, 1, 0, 0, 1, 1,
-1.305796, -0.4913521, -3.022367, 1, 0, 0, 1, 1,
-1.301748, 0.4495664, -1.849059, 1, 0, 0, 1, 1,
-1.29944, 1.426458, -0.9917899, 1, 0, 0, 1, 1,
-1.296877, 0.8560523, -0.2339457, 1, 0, 0, 1, 1,
-1.293659, 0.8043579, -0.8454174, 0, 0, 0, 1, 1,
-1.287801, -1.288329, -1.533123, 0, 0, 0, 1, 1,
-1.282412, -1.22086, -2.052032, 0, 0, 0, 1, 1,
-1.280806, -0.6211255, -3.394769, 0, 0, 0, 1, 1,
-1.280452, 0.2270843, -0.4407543, 0, 0, 0, 1, 1,
-1.275329, 0.2069404, -4.458629, 0, 0, 0, 1, 1,
-1.267834, 0.6240852, -0.1480486, 0, 0, 0, 1, 1,
-1.265678, 0.8620331, -2.029281, 1, 1, 1, 1, 1,
-1.254982, 0.404226, -0.7680314, 1, 1, 1, 1, 1,
-1.251098, -1.361241, -4.557631, 1, 1, 1, 1, 1,
-1.247039, 1.448797, -1.845296, 1, 1, 1, 1, 1,
-1.242563, 0.3570218, 0.3341392, 1, 1, 1, 1, 1,
-1.237729, 0.498396, -0.3906851, 1, 1, 1, 1, 1,
-1.236975, -0.271117, -3.21611, 1, 1, 1, 1, 1,
-1.232019, 0.3124811, -1.290661, 1, 1, 1, 1, 1,
-1.231007, -1.28476, -2.095906, 1, 1, 1, 1, 1,
-1.230801, 1.275413, -2.569563, 1, 1, 1, 1, 1,
-1.221595, 0.2062628, -1.999144, 1, 1, 1, 1, 1,
-1.218279, -0.7886617, -3.618026, 1, 1, 1, 1, 1,
-1.214971, 0.2301632, -0.8944896, 1, 1, 1, 1, 1,
-1.214204, -0.2785721, -1.838086, 1, 1, 1, 1, 1,
-1.195318, 0.4570805, 0.314682, 1, 1, 1, 1, 1,
-1.188832, 0.2946706, -0.26341, 0, 0, 1, 1, 1,
-1.188319, -0.4538034, -2.372013, 1, 0, 0, 1, 1,
-1.183723, 0.5813866, 0.157701, 1, 0, 0, 1, 1,
-1.183056, -0.3949611, -3.185126, 1, 0, 0, 1, 1,
-1.180097, -1.678555, -3.18399, 1, 0, 0, 1, 1,
-1.1754, -0.589211, -2.586605, 1, 0, 0, 1, 1,
-1.174852, 1.73466, 1.324409, 0, 0, 0, 1, 1,
-1.163199, 1.729225, -1.076901, 0, 0, 0, 1, 1,
-1.16271, 1.152072, -1.930001, 0, 0, 0, 1, 1,
-1.161754, -1.281372, -1.952879, 0, 0, 0, 1, 1,
-1.158998, 0.8831495, 0.3901342, 0, 0, 0, 1, 1,
-1.156241, -0.2996822, -3.522978, 0, 0, 0, 1, 1,
-1.151888, -0.7672631, -2.367651, 0, 0, 0, 1, 1,
-1.149546, -0.6491306, -1.794668, 1, 1, 1, 1, 1,
-1.148984, -1.513371, -1.443408, 1, 1, 1, 1, 1,
-1.148557, 1.136195, -0.9231892, 1, 1, 1, 1, 1,
-1.147237, -0.7648861, -2.10551, 1, 1, 1, 1, 1,
-1.141389, -2.087461, -3.376662, 1, 1, 1, 1, 1,
-1.138881, 1.05385, -2.320694, 1, 1, 1, 1, 1,
-1.135286, 0.6239442, -1.469401, 1, 1, 1, 1, 1,
-1.131688, 0.5754198, -0.8636671, 1, 1, 1, 1, 1,
-1.127659, 0.1569978, -0.8159975, 1, 1, 1, 1, 1,
-1.116792, -0.4371141, -3.960716, 1, 1, 1, 1, 1,
-1.113206, -0.9726681, -1.938113, 1, 1, 1, 1, 1,
-1.101134, 0.4986494, -0.7802292, 1, 1, 1, 1, 1,
-1.096799, -0.3296524, -1.906149, 1, 1, 1, 1, 1,
-1.095658, 0.3166806, -0.7806752, 1, 1, 1, 1, 1,
-1.093315, 1.135583, 2.12065, 1, 1, 1, 1, 1,
-1.083492, 1.251853, -0.6559823, 0, 0, 1, 1, 1,
-1.080524, 0.1261245, -1.000167, 1, 0, 0, 1, 1,
-1.072163, -1.155632, -3.240988, 1, 0, 0, 1, 1,
-1.066501, -0.2999602, -0.9451542, 1, 0, 0, 1, 1,
-1.060812, -1.436495, -3.305214, 1, 0, 0, 1, 1,
-1.057171, -0.5420702, -2.438407, 1, 0, 0, 1, 1,
-1.051668, -0.3194755, -2.52609, 0, 0, 0, 1, 1,
-1.050727, 0.9599218, -0.3303052, 0, 0, 0, 1, 1,
-1.050068, -0.4213574, -0.874123, 0, 0, 0, 1, 1,
-1.049196, -2.422534, -3.983594, 0, 0, 0, 1, 1,
-1.043779, -0.3185851, -3.128564, 0, 0, 0, 1, 1,
-1.035407, -0.07402496, -2.8562, 0, 0, 0, 1, 1,
-1.027899, 1.410503, 1.520782, 0, 0, 0, 1, 1,
-1.027296, -0.4814734, -3.509395, 1, 1, 1, 1, 1,
-1.013366, -0.5887425, -2.382246, 1, 1, 1, 1, 1,
-1.00783, 1.121373, -1.802177, 1, 1, 1, 1, 1,
-1.007053, -0.5285887, -2.580061, 1, 1, 1, 1, 1,
-1.002851, -1.086918, -0.6639848, 1, 1, 1, 1, 1,
-0.9994911, 0.4206806, -3.807032, 1, 1, 1, 1, 1,
-0.9907343, 0.1588506, -1.489929, 1, 1, 1, 1, 1,
-0.9898437, 0.8666809, -2.048606, 1, 1, 1, 1, 1,
-0.9849122, -1.195601, -2.785331, 1, 1, 1, 1, 1,
-0.9838009, -1.635385, -2.952143, 1, 1, 1, 1, 1,
-0.9814371, -1.098374, -0.06455416, 1, 1, 1, 1, 1,
-0.9782035, -2.157214, -1.84396, 1, 1, 1, 1, 1,
-0.9752013, -0.4319224, -3.076151, 1, 1, 1, 1, 1,
-0.9750929, -0.7236087, -2.768318, 1, 1, 1, 1, 1,
-0.9747704, 0.7238107, -0.6145453, 1, 1, 1, 1, 1,
-0.9704211, 1.771314, -0.8792439, 0, 0, 1, 1, 1,
-0.968883, 1.314399, -1.009576, 1, 0, 0, 1, 1,
-0.9363573, 0.3873228, -1.669937, 1, 0, 0, 1, 1,
-0.9273119, -0.7477038, -2.415079, 1, 0, 0, 1, 1,
-0.9252456, 0.6465142, 1.017597, 1, 0, 0, 1, 1,
-0.9239191, -0.6596698, -2.989361, 1, 0, 0, 1, 1,
-0.9207744, 2.360159, -1.038567, 0, 0, 0, 1, 1,
-0.8980443, -1.037144, -4.320756, 0, 0, 0, 1, 1,
-0.8941892, 0.3982123, -1.553755, 0, 0, 0, 1, 1,
-0.8919789, -0.6135412, -1.753096, 0, 0, 0, 1, 1,
-0.8900065, -0.7653433, -4.677083, 0, 0, 0, 1, 1,
-0.8884403, 0.1269009, -3.555166, 0, 0, 0, 1, 1,
-0.8809466, 1.250549, -0.884638, 0, 0, 0, 1, 1,
-0.8757478, -0.08398007, -1.316626, 1, 1, 1, 1, 1,
-0.8728775, 1.803859, -2.445724, 1, 1, 1, 1, 1,
-0.8702977, 0.834359, -2.403612, 1, 1, 1, 1, 1,
-0.8700123, 0.7227826, -1.161849, 1, 1, 1, 1, 1,
-0.8610897, -1.892406, -3.551873, 1, 1, 1, 1, 1,
-0.8510672, 1.701494, -0.9675102, 1, 1, 1, 1, 1,
-0.8502488, -0.4953023, -2.122309, 1, 1, 1, 1, 1,
-0.8435369, 0.296029, -1.127899, 1, 1, 1, 1, 1,
-0.8365804, -2.039652, -1.411119, 1, 1, 1, 1, 1,
-0.8280997, -0.2683058, -3.25915, 1, 1, 1, 1, 1,
-0.8179045, 1.045843, 0.0346452, 1, 1, 1, 1, 1,
-0.814964, -0.9239364, -1.425508, 1, 1, 1, 1, 1,
-0.8083959, 1.342693, 0.8702884, 1, 1, 1, 1, 1,
-0.8012941, 1.524946, -1.502816, 1, 1, 1, 1, 1,
-0.7936466, 0.048873, -1.386987, 1, 1, 1, 1, 1,
-0.7875108, 1.07058, 0.9040818, 0, 0, 1, 1, 1,
-0.7869372, -0.6808719, -1.65036, 1, 0, 0, 1, 1,
-0.778754, -1.908465, -1.275789, 1, 0, 0, 1, 1,
-0.7779406, -0.518528, -1.897914, 1, 0, 0, 1, 1,
-0.7765352, -0.8784706, -1.811427, 1, 0, 0, 1, 1,
-0.7757691, -0.3898491, -2.890242, 1, 0, 0, 1, 1,
-0.7744624, -0.615922, -1.930045, 0, 0, 0, 1, 1,
-0.7671342, 3.809555, -0.69412, 0, 0, 0, 1, 1,
-0.7663049, 0.03546437, -0.9943349, 0, 0, 0, 1, 1,
-0.7641882, -0.627507, -2.334485, 0, 0, 0, 1, 1,
-0.76162, 0.1330235, -2.604411, 0, 0, 0, 1, 1,
-0.761535, 0.4956995, 0.9435464, 0, 0, 0, 1, 1,
-0.7571821, 0.2443127, -2.031826, 0, 0, 0, 1, 1,
-0.7551357, 1.108019, -0.855622, 1, 1, 1, 1, 1,
-0.7465853, -0.2459119, -1.853882, 1, 1, 1, 1, 1,
-0.7432557, -1.369057, -1.601885, 1, 1, 1, 1, 1,
-0.7432489, 0.3686122, -1.319369, 1, 1, 1, 1, 1,
-0.7430428, 1.983498, -0.9507273, 1, 1, 1, 1, 1,
-0.7418067, 1.377039, 0.7985606, 1, 1, 1, 1, 1,
-0.740217, 0.785374, -1.014897, 1, 1, 1, 1, 1,
-0.7349418, 2.33124, 0.4515608, 1, 1, 1, 1, 1,
-0.7332091, 1.372661, -2.06767, 1, 1, 1, 1, 1,
-0.7312071, 0.8527338, -0.2585028, 1, 1, 1, 1, 1,
-0.7310851, 0.1505796, -0.2429555, 1, 1, 1, 1, 1,
-0.730262, 0.257353, -1.611879, 1, 1, 1, 1, 1,
-0.7253681, -0.01575156, 0.1452869, 1, 1, 1, 1, 1,
-0.7244782, -0.1531384, -1.253206, 1, 1, 1, 1, 1,
-0.7200285, -1.261287, -2.975301, 1, 1, 1, 1, 1,
-0.7188268, -0.6216585, -2.421054, 0, 0, 1, 1, 1,
-0.7169392, -1.095294, -3.683146, 1, 0, 0, 1, 1,
-0.7158874, -0.3342162, -1.690688, 1, 0, 0, 1, 1,
-0.713963, -1.305369, -1.181213, 1, 0, 0, 1, 1,
-0.7126229, 0.4779546, -0.7650162, 1, 0, 0, 1, 1,
-0.7108396, 1.069641, 2.052476, 1, 0, 0, 1, 1,
-0.7075772, -0.6776438, -4.647469, 0, 0, 0, 1, 1,
-0.6964737, -2.695397, -3.161139, 0, 0, 0, 1, 1,
-0.6961409, -0.8536223, -1.166271, 0, 0, 0, 1, 1,
-0.6957921, -1.763803, -2.384828, 0, 0, 0, 1, 1,
-0.6948133, -1.218932, -1.963594, 0, 0, 0, 1, 1,
-0.6869627, -0.737039, -2.105469, 0, 0, 0, 1, 1,
-0.6815098, -0.6323879, -2.464403, 0, 0, 0, 1, 1,
-0.6787782, 0.3928065, 0.3295032, 1, 1, 1, 1, 1,
-0.6727683, -1.419322, -3.270051, 1, 1, 1, 1, 1,
-0.6682765, 0.5161197, -1.358558, 1, 1, 1, 1, 1,
-0.6679999, 0.3065929, -0.7917067, 1, 1, 1, 1, 1,
-0.6635589, 1.184186, 0.1297003, 1, 1, 1, 1, 1,
-0.6540478, -0.1441038, -2.541269, 1, 1, 1, 1, 1,
-0.6535783, -0.2129129, -2.623294, 1, 1, 1, 1, 1,
-0.6524515, 1.576013, 0.4535284, 1, 1, 1, 1, 1,
-0.652161, -0.4236646, -1.621674, 1, 1, 1, 1, 1,
-0.6508085, -0.3478048, -1.235802, 1, 1, 1, 1, 1,
-0.6491489, -0.5502345, -0.6940364, 1, 1, 1, 1, 1,
-0.6440762, 0.8604436, 0.4614955, 1, 1, 1, 1, 1,
-0.6387691, -0.3383711, -3.031643, 1, 1, 1, 1, 1,
-0.636689, 0.3580439, -1.267228, 1, 1, 1, 1, 1,
-0.6343728, 1.257714, 0.1995826, 1, 1, 1, 1, 1,
-0.6236959, 0.5907114, -0.9237934, 0, 0, 1, 1, 1,
-0.6166186, -0.9545577, -2.854009, 1, 0, 0, 1, 1,
-0.6133972, 1.959868, -0.7056417, 1, 0, 0, 1, 1,
-0.6121466, -1.036357, -2.769062, 1, 0, 0, 1, 1,
-0.601748, 1.316, -1.341567, 1, 0, 0, 1, 1,
-0.6000409, -0.2031759, -1.85869, 1, 0, 0, 1, 1,
-0.5979559, -0.4302806, -2.107173, 0, 0, 0, 1, 1,
-0.5965984, -0.9844825, -3.489111, 0, 0, 0, 1, 1,
-0.5939318, 0.8657555, -0.7934241, 0, 0, 0, 1, 1,
-0.5906667, 0.8073354, -1.847621, 0, 0, 0, 1, 1,
-0.589292, -0.9419593, -2.12055, 0, 0, 0, 1, 1,
-0.5851887, -1.666776, -3.125474, 0, 0, 0, 1, 1,
-0.5829328, -0.3672323, -2.564119, 0, 0, 0, 1, 1,
-0.5827395, -0.1280374, -1.166656, 1, 1, 1, 1, 1,
-0.5794218, 0.6585426, -1.14154, 1, 1, 1, 1, 1,
-0.5757248, 0.5315972, -0.2898591, 1, 1, 1, 1, 1,
-0.5743764, 0.5653701, -0.762891, 1, 1, 1, 1, 1,
-0.5577781, 0.6660609, -0.4627456, 1, 1, 1, 1, 1,
-0.5532076, 1.057071, 0.4006185, 1, 1, 1, 1, 1,
-0.5528556, 1.325441, -0.8016461, 1, 1, 1, 1, 1,
-0.5486749, -0.3014056, -2.071187, 1, 1, 1, 1, 1,
-0.5348935, -0.6147588, -3.427058, 1, 1, 1, 1, 1,
-0.5323222, -0.2893837, -2.268497, 1, 1, 1, 1, 1,
-0.5245839, -0.190112, -3.318389, 1, 1, 1, 1, 1,
-0.5213464, 0.1806979, -0.9506043, 1, 1, 1, 1, 1,
-0.5184501, 0.3610483, -0.2430961, 1, 1, 1, 1, 1,
-0.5173183, 1.105652, -1.39464, 1, 1, 1, 1, 1,
-0.5169892, 1.108282, -1.458897, 1, 1, 1, 1, 1,
-0.5163248, 0.2458554, -1.908708, 0, 0, 1, 1, 1,
-0.5160496, -0.4518971, -1.145893, 1, 0, 0, 1, 1,
-0.5155383, -0.6169571, -2.191067, 1, 0, 0, 1, 1,
-0.5120067, -0.7917399, -1.898772, 1, 0, 0, 1, 1,
-0.5104964, -0.283852, -2.802488, 1, 0, 0, 1, 1,
-0.5094301, -0.7623158, -2.600879, 1, 0, 0, 1, 1,
-0.5067835, -1.634058, -1.142117, 0, 0, 0, 1, 1,
-0.4977031, -0.6018928, -4.356468, 0, 0, 0, 1, 1,
-0.4965903, -0.6391789, -3.650832, 0, 0, 0, 1, 1,
-0.4903415, 0.5361828, 0.5253066, 0, 0, 0, 1, 1,
-0.4861492, -0.6187364, -3.924632, 0, 0, 0, 1, 1,
-0.4830173, 0.1170087, 0.2176067, 0, 0, 0, 1, 1,
-0.4827937, 0.8444723, 0.419704, 0, 0, 0, 1, 1,
-0.4813784, -0.7902845, -3.791152, 1, 1, 1, 1, 1,
-0.481264, -1.844423, -2.248296, 1, 1, 1, 1, 1,
-0.4786176, -0.0435511, -2.730809, 1, 1, 1, 1, 1,
-0.4783955, 0.9187706, 0.4503355, 1, 1, 1, 1, 1,
-0.4704118, 0.524862, 0.1323249, 1, 1, 1, 1, 1,
-0.463259, -0.1306399, -1.19226, 1, 1, 1, 1, 1,
-0.4630173, -1.812283, -4.152979, 1, 1, 1, 1, 1,
-0.4623535, 0.5319566, -1.873549, 1, 1, 1, 1, 1,
-0.4616252, -1.363621, -2.730635, 1, 1, 1, 1, 1,
-0.461335, -0.3557838, -3.339597, 1, 1, 1, 1, 1,
-0.4579317, 2.638985, 0.1299604, 1, 1, 1, 1, 1,
-0.4571263, -0.5462399, -2.642339, 1, 1, 1, 1, 1,
-0.4563676, 0.8884755, 0.7468026, 1, 1, 1, 1, 1,
-0.4560808, -0.0947886, -1.952334, 1, 1, 1, 1, 1,
-0.4554579, 0.6311402, -0.5505958, 1, 1, 1, 1, 1,
-0.4505082, 0.6344005, -1.774578, 0, 0, 1, 1, 1,
-0.4498666, -1.578093, -4.588221, 1, 0, 0, 1, 1,
-0.4495474, 0.4548826, -1.478943, 1, 0, 0, 1, 1,
-0.449271, -0.1903208, -2.025664, 1, 0, 0, 1, 1,
-0.4487534, 1.507101, -1.977289, 1, 0, 0, 1, 1,
-0.4480293, 0.04317226, -1.8255, 1, 0, 0, 1, 1,
-0.446963, 0.2716431, -1.191954, 0, 0, 0, 1, 1,
-0.4467152, -0.7955205, -3.662665, 0, 0, 0, 1, 1,
-0.4464287, -0.1964575, -5.448256, 0, 0, 0, 1, 1,
-0.4459465, -1.433704, -4.163756, 0, 0, 0, 1, 1,
-0.4439351, 1.427675, -0.8127948, 0, 0, 0, 1, 1,
-0.4437898, 0.1698424, 0.2325197, 0, 0, 0, 1, 1,
-0.441488, 3.582822, -1.61384, 0, 0, 0, 1, 1,
-0.4376069, 0.6991324, -0.4202715, 1, 1, 1, 1, 1,
-0.4364343, -0.004240565, 0.736396, 1, 1, 1, 1, 1,
-0.4299554, 0.212934, -0.9778172, 1, 1, 1, 1, 1,
-0.4232829, -0.1845458, -1.661365, 1, 1, 1, 1, 1,
-0.4226467, -1.926391, -1.225767, 1, 1, 1, 1, 1,
-0.4186837, -0.4052757, -4.461861, 1, 1, 1, 1, 1,
-0.4148247, -1.616107, -3.854871, 1, 1, 1, 1, 1,
-0.4135587, -1.517925, -3.6884, 1, 1, 1, 1, 1,
-0.4092214, 1.061983, 0.8069205, 1, 1, 1, 1, 1,
-0.4068018, -1.597723, -1.416256, 1, 1, 1, 1, 1,
-0.4065328, 0.998193, -0.3972858, 1, 1, 1, 1, 1,
-0.406103, 1.054126, 0.593156, 1, 1, 1, 1, 1,
-0.4056277, 1.730804, -0.6622249, 1, 1, 1, 1, 1,
-0.4046196, -1.673993, -2.518042, 1, 1, 1, 1, 1,
-0.4018927, -0.3843208, -2.482745, 1, 1, 1, 1, 1,
-0.4018286, 0.5726165, -1.33374, 0, 0, 1, 1, 1,
-0.3989076, 1.394626, -0.08045632, 1, 0, 0, 1, 1,
-0.3976094, -1.178343, -2.216724, 1, 0, 0, 1, 1,
-0.3936088, 0.7807328, 1.375191, 1, 0, 0, 1, 1,
-0.3902736, -0.2748809, -2.589292, 1, 0, 0, 1, 1,
-0.3900372, -0.7403389, -2.641585, 1, 0, 0, 1, 1,
-0.3881332, -1.032117, -3.2459, 0, 0, 0, 1, 1,
-0.3837974, 0.08858061, -1.091558, 0, 0, 0, 1, 1,
-0.3815457, -0.7135624, -2.734388, 0, 0, 0, 1, 1,
-0.3814386, -0.5926325, -1.111276, 0, 0, 0, 1, 1,
-0.3792534, -1.10479, -4.415256, 0, 0, 0, 1, 1,
-0.379133, -1.256916, -2.518641, 0, 0, 0, 1, 1,
-0.3767836, 0.3217432, -1.403, 0, 0, 0, 1, 1,
-0.3747073, 0.221671, -2.924623, 1, 1, 1, 1, 1,
-0.3731416, 0.5943251, -0.4635621, 1, 1, 1, 1, 1,
-0.3655647, 0.6555972, -0.4844946, 1, 1, 1, 1, 1,
-0.3630221, -0.4143019, -2.649028, 1, 1, 1, 1, 1,
-0.351807, 0.02441317, -1.378626, 1, 1, 1, 1, 1,
-0.3499845, 0.1690053, -1.557764, 1, 1, 1, 1, 1,
-0.3455354, -0.1982134, -1.667036, 1, 1, 1, 1, 1,
-0.3446234, 1.299562, 0.8888175, 1, 1, 1, 1, 1,
-0.3439844, 1.168065, -0.8429183, 1, 1, 1, 1, 1,
-0.3411808, -0.1655835, -2.380458, 1, 1, 1, 1, 1,
-0.3408745, -0.1361797, -2.434506, 1, 1, 1, 1, 1,
-0.3394488, -1.182323, -0.8412505, 1, 1, 1, 1, 1,
-0.3345739, 0.008825713, -2.807896, 1, 1, 1, 1, 1,
-0.3304377, -1.8617, -1.064399, 1, 1, 1, 1, 1,
-0.3303657, 1.029963, -2.06091, 1, 1, 1, 1, 1,
-0.3279707, 0.6238828, 0.8966863, 0, 0, 1, 1, 1,
-0.3224401, -2.577347, -2.303041, 1, 0, 0, 1, 1,
-0.3192041, -1.157246, -2.553231, 1, 0, 0, 1, 1,
-0.3183497, 0.02617594, -1.827177, 1, 0, 0, 1, 1,
-0.3171884, -0.252028, -1.248745, 1, 0, 0, 1, 1,
-0.3149504, 0.7850823, -1.853389, 1, 0, 0, 1, 1,
-0.313003, 0.7380262, 0.8350665, 0, 0, 0, 1, 1,
-0.3111304, -0.6983985, -4.327416, 0, 0, 0, 1, 1,
-0.3105327, -0.8752213, -3.642501, 0, 0, 0, 1, 1,
-0.3035915, 0.5115082, -0.004243535, 0, 0, 0, 1, 1,
-0.3025749, -1.561806, -4.602576, 0, 0, 0, 1, 1,
-0.300584, -1.148279, -1.885291, 0, 0, 0, 1, 1,
-0.2995684, -0.04458049, -0.1650424, 0, 0, 0, 1, 1,
-0.2941, 0.2392948, 0.1453995, 1, 1, 1, 1, 1,
-0.2921113, 0.8478887, 0.1225304, 1, 1, 1, 1, 1,
-0.2902034, -1.314631, -2.24311, 1, 1, 1, 1, 1,
-0.2841641, 0.5805401, 0.04526367, 1, 1, 1, 1, 1,
-0.2837121, 1.769705, 0.06226002, 1, 1, 1, 1, 1,
-0.2771209, 0.05345546, -1.325063, 1, 1, 1, 1, 1,
-0.2751164, 1.543107, -0.2767749, 1, 1, 1, 1, 1,
-0.2722554, -0.9115498, -3.811981, 1, 1, 1, 1, 1,
-0.2713677, 1.339296, -0.650559, 1, 1, 1, 1, 1,
-0.2665093, -1.290192, -3.371411, 1, 1, 1, 1, 1,
-0.2648984, 1.438045, 0.6183719, 1, 1, 1, 1, 1,
-0.2640775, -1.255535, -1.977981, 1, 1, 1, 1, 1,
-0.2635951, 0.3279188, -1.025184, 1, 1, 1, 1, 1,
-0.2629985, -0.24672, -1.756974, 1, 1, 1, 1, 1,
-0.2611116, 0.3555854, -0.9984516, 1, 1, 1, 1, 1,
-0.2563443, 0.02289245, -0.5523139, 0, 0, 1, 1, 1,
-0.2552302, 0.3042985, -0.2010639, 1, 0, 0, 1, 1,
-0.2538574, 1.648235, -0.418956, 1, 0, 0, 1, 1,
-0.2512992, 1.569745, 0.1148194, 1, 0, 0, 1, 1,
-0.2508267, -1.090546, -3.994286, 1, 0, 0, 1, 1,
-0.2502703, 0.06695996, 0.2539274, 1, 0, 0, 1, 1,
-0.2407822, 1.314863, -0.2043657, 0, 0, 0, 1, 1,
-0.2374059, -0.8420694, -1.082221, 0, 0, 0, 1, 1,
-0.2311703, 0.6833819, 1.701262, 0, 0, 0, 1, 1,
-0.2307121, 0.4655323, -0.3766526, 0, 0, 0, 1, 1,
-0.229114, 0.7610693, 1.043031, 0, 0, 0, 1, 1,
-0.2285466, -1.332578, -4.088283, 0, 0, 0, 1, 1,
-0.2261967, 0.207489, -0.1223206, 0, 0, 0, 1, 1,
-0.2246187, 0.5865155, 0.984399, 1, 1, 1, 1, 1,
-0.2233386, 0.03756544, -1.229873, 1, 1, 1, 1, 1,
-0.2222322, 1.221919, -2.425437, 1, 1, 1, 1, 1,
-0.2207842, 3.295264, 0.3245595, 1, 1, 1, 1, 1,
-0.2199193, 0.2331091, -0.4067681, 1, 1, 1, 1, 1,
-0.2198259, 0.03135692, -2.703338, 1, 1, 1, 1, 1,
-0.2172256, -0.9025345, -3.998033, 1, 1, 1, 1, 1,
-0.2148133, -2.049886, -4.166487, 1, 1, 1, 1, 1,
-0.212316, 0.5636876, 0.2573535, 1, 1, 1, 1, 1,
-0.2077902, 0.4935576, 0.473744, 1, 1, 1, 1, 1,
-0.2048609, -0.1877248, -2.605458, 1, 1, 1, 1, 1,
-0.1970392, 2.381154, 0.2801263, 1, 1, 1, 1, 1,
-0.1969841, -0.4317454, -2.081865, 1, 1, 1, 1, 1,
-0.1963638, -0.9731385, -1.38105, 1, 1, 1, 1, 1,
-0.1908874, -1.395602, -3.343193, 1, 1, 1, 1, 1,
-0.1838679, -0.1036615, -1.332311, 0, 0, 1, 1, 1,
-0.181375, 1.612745, 1.041925, 1, 0, 0, 1, 1,
-0.1779622, -0.1435432, -2.642323, 1, 0, 0, 1, 1,
-0.1776221, 1.041809, 1.769815, 1, 0, 0, 1, 1,
-0.1751764, 0.5291826, -0.01489899, 1, 0, 0, 1, 1,
-0.1710415, 0.1080451, -1.874525, 1, 0, 0, 1, 1,
-0.1653511, 0.3857109, -0.4422187, 0, 0, 0, 1, 1,
-0.1628525, -1.96016, -2.454936, 0, 0, 0, 1, 1,
-0.1619587, -1.480434, -1.668458, 0, 0, 0, 1, 1,
-0.1586066, -1.525024, -1.146971, 0, 0, 0, 1, 1,
-0.1529386, 0.5582976, 0.5073496, 0, 0, 0, 1, 1,
-0.1499261, 0.4747531, 0.9446009, 0, 0, 0, 1, 1,
-0.1485644, -0.8412724, -2.258298, 0, 0, 0, 1, 1,
-0.146173, -0.9330872, -3.746396, 1, 1, 1, 1, 1,
-0.146005, 0.6094042, 0.163413, 1, 1, 1, 1, 1,
-0.1452503, 0.2740557, -0.3595456, 1, 1, 1, 1, 1,
-0.1433083, 0.4900229, -1.760459, 1, 1, 1, 1, 1,
-0.1423449, 1.283625, -0.1500537, 1, 1, 1, 1, 1,
-0.1402837, 2.53754, 0.7419033, 1, 1, 1, 1, 1,
-0.1370125, -1.603287, -1.412742, 1, 1, 1, 1, 1,
-0.1362934, -0.07229814, -3.033382, 1, 1, 1, 1, 1,
-0.1349538, -2.59124, -0.7473264, 1, 1, 1, 1, 1,
-0.1324596, 1.375137, -0.7636743, 1, 1, 1, 1, 1,
-0.1294646, -1.227029, -3.497795, 1, 1, 1, 1, 1,
-0.1249775, 0.7598261, -1.147348, 1, 1, 1, 1, 1,
-0.1247279, 0.1515942, -0.8081197, 1, 1, 1, 1, 1,
-0.1176711, 0.7733544, -0.7617705, 1, 1, 1, 1, 1,
-0.1078957, -0.9065048, -2.400582, 1, 1, 1, 1, 1,
-0.1078488, -0.948306, -3.468298, 0, 0, 1, 1, 1,
-0.1015324, 1.643324, -0.7535223, 1, 0, 0, 1, 1,
-0.09645353, 0.8714626, 0.08171251, 1, 0, 0, 1, 1,
-0.09577675, 0.8971813, -0.3897326, 1, 0, 0, 1, 1,
-0.09106887, -1.309816, -2.914829, 1, 0, 0, 1, 1,
-0.08797008, -0.7729562, -4.411505, 1, 0, 0, 1, 1,
-0.08776796, -0.3761904, -2.610735, 0, 0, 0, 1, 1,
-0.08629595, -1.77387, -3.146697, 0, 0, 0, 1, 1,
-0.08394638, -0.1981445, -4.074552, 0, 0, 0, 1, 1,
-0.07617781, 0.3996834, -0.583295, 0, 0, 0, 1, 1,
-0.07438246, 1.337665, 0.01827853, 0, 0, 0, 1, 1,
-0.0729688, -2.776292, -1.412927, 0, 0, 0, 1, 1,
-0.07244735, -1.206927, -1.907243, 0, 0, 0, 1, 1,
-0.06943546, -0.03394101, -1.309936, 1, 1, 1, 1, 1,
-0.06168175, 0.6575658, -2.345437, 1, 1, 1, 1, 1,
-0.06047, 0.7233676, -0.4379074, 1, 1, 1, 1, 1,
-0.06030043, 1.253241, 0.1919981, 1, 1, 1, 1, 1,
-0.05749626, -2.999429, -3.022585, 1, 1, 1, 1, 1,
-0.05136271, -0.4174591, -3.430608, 1, 1, 1, 1, 1,
-0.04391202, 1.131162, 0.01253984, 1, 1, 1, 1, 1,
-0.04301636, -2.446934, -3.753243, 1, 1, 1, 1, 1,
-0.04176553, -1.571484, -3.30034, 1, 1, 1, 1, 1,
-0.03916087, 0.4243772, -1.08016, 1, 1, 1, 1, 1,
-0.03897763, 0.0334684, -0.3920397, 1, 1, 1, 1, 1,
-0.03862756, 0.563276, -0.7471235, 1, 1, 1, 1, 1,
-0.03710987, -0.5989801, -3.015213, 1, 1, 1, 1, 1,
-0.03454, 0.923174, 0.3157948, 1, 1, 1, 1, 1,
-0.03428632, 0.6496821, -0.3030107, 1, 1, 1, 1, 1,
-0.02632449, 2.055651, -0.5869504, 0, 0, 1, 1, 1,
-0.02618443, -0.07264801, -1.905045, 1, 0, 0, 1, 1,
-0.02611088, 0.5097682, -1.183959, 1, 0, 0, 1, 1,
-0.02044042, -0.1165059, -2.419214, 1, 0, 0, 1, 1,
-0.01958349, 0.3660394, 0.4027354, 1, 0, 0, 1, 1,
-0.01845799, 1.432458, -1.120933, 1, 0, 0, 1, 1,
-0.01613232, -0.5238141, -3.057062, 0, 0, 0, 1, 1,
-0.01492243, -0.1120941, -2.628472, 0, 0, 0, 1, 1,
-0.0142908, -0.2480308, -3.571494, 0, 0, 0, 1, 1,
-0.008606729, -2.106139, -3.274741, 0, 0, 0, 1, 1,
-0.006005479, -0.06167538, -2.626735, 0, 0, 0, 1, 1,
-0.001278694, -0.9830888, -1.304064, 0, 0, 0, 1, 1,
0.002704438, 0.1035954, 0.5693808, 0, 0, 0, 1, 1,
0.006086975, 1.387378, 1.194046, 1, 1, 1, 1, 1,
0.006329415, -0.7708066, 3.246619, 1, 1, 1, 1, 1,
0.007186492, -0.5895093, 3.569223, 1, 1, 1, 1, 1,
0.007361456, 0.2981572, 1.02165, 1, 1, 1, 1, 1,
0.00785367, -0.677487, 4.470906, 1, 1, 1, 1, 1,
0.007978938, 0.6027062, 1.398752, 1, 1, 1, 1, 1,
0.00849443, 0.5316184, -0.1220187, 1, 1, 1, 1, 1,
0.00927794, 0.882485, -0.8741243, 1, 1, 1, 1, 1,
0.0104089, -0.2428745, 3.807399, 1, 1, 1, 1, 1,
0.01212557, -1.309954, 3.243972, 1, 1, 1, 1, 1,
0.01372398, -0.8152834, 2.748756, 1, 1, 1, 1, 1,
0.01667802, -0.5729373, 1.655542, 1, 1, 1, 1, 1,
0.01777207, -0.2739466, 4.556235, 1, 1, 1, 1, 1,
0.01967614, 0.6838, 1.467033, 1, 1, 1, 1, 1,
0.0329728, 1.271232, -0.495009, 1, 1, 1, 1, 1,
0.03307227, 0.3329264, -0.04863277, 0, 0, 1, 1, 1,
0.03626674, 0.7594694, 0.6845388, 1, 0, 0, 1, 1,
0.03657485, -1.040119, 2.832724, 1, 0, 0, 1, 1,
0.04077826, -0.6784842, 3.115695, 1, 0, 0, 1, 1,
0.05133267, -0.5817536, 2.162626, 1, 0, 0, 1, 1,
0.05173342, 0.02638132, 1.962996, 1, 0, 0, 1, 1,
0.05291632, -0.4419379, 3.901592, 0, 0, 0, 1, 1,
0.05686479, -1.474586, 3.938386, 0, 0, 0, 1, 1,
0.06360573, -0.1556318, 1.824455, 0, 0, 0, 1, 1,
0.07014086, -1.092088, 2.827065, 0, 0, 0, 1, 1,
0.07317667, -0.7551309, 2.183766, 0, 0, 0, 1, 1,
0.07363609, 0.7068014, 0.08187586, 0, 0, 0, 1, 1,
0.0840163, 0.7061284, -1.642814, 0, 0, 0, 1, 1,
0.08498631, 0.3754523, 0.1371556, 1, 1, 1, 1, 1,
0.0854254, 0.0430261, -0.00739922, 1, 1, 1, 1, 1,
0.08627614, 1.070617, 0.7988983, 1, 1, 1, 1, 1,
0.09006509, 1.55046, 1.280609, 1, 1, 1, 1, 1,
0.09022535, 0.3823607, -0.07370298, 1, 1, 1, 1, 1,
0.09422438, -0.3929344, 2.751255, 1, 1, 1, 1, 1,
0.09984735, -0.6686314, 2.309638, 1, 1, 1, 1, 1,
0.1071631, 1.859011, 0.4382688, 1, 1, 1, 1, 1,
0.1106653, 0.05925466, 1.229114, 1, 1, 1, 1, 1,
0.114414, -1.112512, 2.439558, 1, 1, 1, 1, 1,
0.1149161, -1.160993, 2.965035, 1, 1, 1, 1, 1,
0.1181005, 0.4563631, 1.787885, 1, 1, 1, 1, 1,
0.1185304, 0.839761, -1.340068, 1, 1, 1, 1, 1,
0.1266014, 1.518782, -0.5816164, 1, 1, 1, 1, 1,
0.1366188, -0.5995503, 3.308662, 1, 1, 1, 1, 1,
0.1369206, 1.071713, 1.285299, 0, 0, 1, 1, 1,
0.1382008, -0.3031508, 2.628432, 1, 0, 0, 1, 1,
0.1385886, 0.4760465, 1.734794, 1, 0, 0, 1, 1,
0.1415634, -0.02924246, 0.9451795, 1, 0, 0, 1, 1,
0.1493081, 0.375547, 1.380152, 1, 0, 0, 1, 1,
0.1528855, 0.01589771, 0.3822534, 1, 0, 0, 1, 1,
0.1531565, 0.4224446, 0.5404891, 0, 0, 0, 1, 1,
0.1537409, 0.3841283, 0.977233, 0, 0, 0, 1, 1,
0.1602668, -0.631369, 2.905235, 0, 0, 0, 1, 1,
0.1612271, -0.3544819, 2.076052, 0, 0, 0, 1, 1,
0.1626949, -1.845673, 3.405633, 0, 0, 0, 1, 1,
0.1677927, -0.1612643, 1.067587, 0, 0, 0, 1, 1,
0.1685795, -0.2472296, 2.016152, 0, 0, 0, 1, 1,
0.1686654, 1.69273, 1.850243, 1, 1, 1, 1, 1,
0.1756911, -2.583212, 2.873173, 1, 1, 1, 1, 1,
0.1813251, 0.9971232, 0.06475528, 1, 1, 1, 1, 1,
0.1845861, -2.584134, 4.264668, 1, 1, 1, 1, 1,
0.1876254, -1.521246, 3.428027, 1, 1, 1, 1, 1,
0.1904638, 0.3523008, -0.4330101, 1, 1, 1, 1, 1,
0.19137, 0.7338737, -1.519733, 1, 1, 1, 1, 1,
0.1927959, -0.7331272, 1.773437, 1, 1, 1, 1, 1,
0.194529, 0.07463749, 2.028514, 1, 1, 1, 1, 1,
0.1983, -0.8973925, 1.25143, 1, 1, 1, 1, 1,
0.2038564, 0.7756047, 0.1299584, 1, 1, 1, 1, 1,
0.2040091, -0.01966151, 1.582287, 1, 1, 1, 1, 1,
0.2047151, -0.6655111, 1.619176, 1, 1, 1, 1, 1,
0.2059599, -0.726787, 2.422612, 1, 1, 1, 1, 1,
0.2065229, 0.4177396, -0.102996, 1, 1, 1, 1, 1,
0.2085426, 0.1178416, 0.1352885, 0, 0, 1, 1, 1,
0.2136524, -1.04702, 2.578751, 1, 0, 0, 1, 1,
0.2159495, -0.7887411, 3.567202, 1, 0, 0, 1, 1,
0.2252492, -0.1831315, 1.268449, 1, 0, 0, 1, 1,
0.2265402, -0.747546, 3.155185, 1, 0, 0, 1, 1,
0.2320346, 0.04365794, 1.104635, 1, 0, 0, 1, 1,
0.232124, 0.05863787, 1.893183, 0, 0, 0, 1, 1,
0.2337727, -1.491755, 3.429387, 0, 0, 0, 1, 1,
0.234257, -0.411328, 2.857785, 0, 0, 0, 1, 1,
0.2374803, 1.316368, 0.888329, 0, 0, 0, 1, 1,
0.2425693, -0.3006133, 3.245507, 0, 0, 0, 1, 1,
0.2429962, 0.1707794, 0.8398004, 0, 0, 0, 1, 1,
0.2444263, -0.1232674, 0.8238881, 0, 0, 0, 1, 1,
0.2444485, -0.7657198, 1.835156, 1, 1, 1, 1, 1,
0.2458566, -1.214764, 1.741187, 1, 1, 1, 1, 1,
0.2461027, 0.659812, 0.609372, 1, 1, 1, 1, 1,
0.2470475, -1.325239, 3.154119, 1, 1, 1, 1, 1,
0.2479093, -1.553416, 2.080414, 1, 1, 1, 1, 1,
0.2493561, 1.224194, -0.1133024, 1, 1, 1, 1, 1,
0.2516588, 0.6958595, -0.3052834, 1, 1, 1, 1, 1,
0.2532736, -0.6074891, 2.992041, 1, 1, 1, 1, 1,
0.2572255, -0.3929993, 1.252452, 1, 1, 1, 1, 1,
0.2669132, -0.6591849, 2.49566, 1, 1, 1, 1, 1,
0.267316, -1.926154, 3.449493, 1, 1, 1, 1, 1,
0.2706598, -1.167897, 3.223217, 1, 1, 1, 1, 1,
0.2713597, 0.1557134, 1.283079, 1, 1, 1, 1, 1,
0.2715442, -1.153819, 2.076803, 1, 1, 1, 1, 1,
0.2720873, 0.7894361, -0.9875708, 1, 1, 1, 1, 1,
0.2734425, -1.071013, 5.085061, 0, 0, 1, 1, 1,
0.2743075, -0.09078968, 1.974794, 1, 0, 0, 1, 1,
0.2774959, -0.04453481, 2.530656, 1, 0, 0, 1, 1,
0.2816645, 1.444032, -0.7288568, 1, 0, 0, 1, 1,
0.284242, -0.223634, 1.896618, 1, 0, 0, 1, 1,
0.2848769, 1.697101, 0.3127003, 1, 0, 0, 1, 1,
0.294396, 0.1487222, 1.613484, 0, 0, 0, 1, 1,
0.2964251, 0.205518, 0.5093287, 0, 0, 0, 1, 1,
0.3000261, -1.546685, 2.451341, 0, 0, 0, 1, 1,
0.3023109, -0.01529615, 2.22287, 0, 0, 0, 1, 1,
0.3048326, -0.425983, 0.9368631, 0, 0, 0, 1, 1,
0.3071034, 0.4897832, 1.176579, 0, 0, 0, 1, 1,
0.3080303, -1.673693, 2.121554, 0, 0, 0, 1, 1,
0.3082701, -0.4440219, 4.294205, 1, 1, 1, 1, 1,
0.308459, 0.6899057, 0.4085791, 1, 1, 1, 1, 1,
0.3125482, -0.8383325, 0.3977748, 1, 1, 1, 1, 1,
0.3152038, 0.212114, 0.3703227, 1, 1, 1, 1, 1,
0.3201134, -0.3487913, 3.54081, 1, 1, 1, 1, 1,
0.3226247, -0.9358253, 1.5198, 1, 1, 1, 1, 1,
0.3252744, 1.250119, -0.4498896, 1, 1, 1, 1, 1,
0.326299, 0.07956029, 2.181776, 1, 1, 1, 1, 1,
0.3317102, -0.5426818, 4.396445, 1, 1, 1, 1, 1,
0.332656, -0.4784222, 1.853096, 1, 1, 1, 1, 1,
0.3328976, 1.119617, -0.1968351, 1, 1, 1, 1, 1,
0.3332448, 0.2012964, 1.710215, 1, 1, 1, 1, 1,
0.3341002, -1.119437, 3.548278, 1, 1, 1, 1, 1,
0.3369796, -0.4502267, 2.107014, 1, 1, 1, 1, 1,
0.3420812, 1.873824, -0.9639727, 1, 1, 1, 1, 1,
0.3458964, 0.7210943, 0.5654373, 0, 0, 1, 1, 1,
0.3464728, 0.9371535, -1.640054, 1, 0, 0, 1, 1,
0.347401, -0.4797809, 1.922091, 1, 0, 0, 1, 1,
0.3546871, 0.2215674, 0.8108197, 1, 0, 0, 1, 1,
0.3557666, -0.3864459, 3.501676, 1, 0, 0, 1, 1,
0.3621199, -0.3235941, 2.071575, 1, 0, 0, 1, 1,
0.3646946, -1.183385, 3.098482, 0, 0, 0, 1, 1,
0.3651983, -1.425795, 3.043703, 0, 0, 0, 1, 1,
0.3675763, -0.4343186, 0.7998407, 0, 0, 0, 1, 1,
0.370267, 0.1585815, 1.313999, 0, 0, 0, 1, 1,
0.3707541, 1.302959, -0.1058779, 0, 0, 0, 1, 1,
0.3712962, 0.2612853, 0.7346392, 0, 0, 0, 1, 1,
0.375002, -2.042522, 1.409143, 0, 0, 0, 1, 1,
0.3827622, 1.128373, -0.3399363, 1, 1, 1, 1, 1,
0.38308, -0.151033, 1.82131, 1, 1, 1, 1, 1,
0.3845295, -1.389651, 4.215935, 1, 1, 1, 1, 1,
0.3977258, 0.6429697, -1.476346, 1, 1, 1, 1, 1,
0.4017666, 0.7015959, -1.193925, 1, 1, 1, 1, 1,
0.4017874, 1.043952, 0.3556021, 1, 1, 1, 1, 1,
0.4052176, -0.5950734, 1.36998, 1, 1, 1, 1, 1,
0.407846, 0.3400726, -0.8760992, 1, 1, 1, 1, 1,
0.4087794, -0.1718336, 3.167509, 1, 1, 1, 1, 1,
0.4089582, -0.8091075, 4.415197, 1, 1, 1, 1, 1,
0.4097083, 0.6245327, -0.1599996, 1, 1, 1, 1, 1,
0.4097644, 0.07314938, 0.5509912, 1, 1, 1, 1, 1,
0.4097972, -1.060526, 1.951153, 1, 1, 1, 1, 1,
0.4103329, 0.8018793, -1.037142, 1, 1, 1, 1, 1,
0.4107649, 0.7227767, 0.8514009, 1, 1, 1, 1, 1,
0.4162018, -0.009964579, 3.484846, 0, 0, 1, 1, 1,
0.421863, 0.277314, 1.281775, 1, 0, 0, 1, 1,
0.4247925, -0.6760135, 2.596412, 1, 0, 0, 1, 1,
0.4267434, -0.844357, 3.268877, 1, 0, 0, 1, 1,
0.4323822, 0.5676817, 2.087062, 1, 0, 0, 1, 1,
0.4329766, 1.026987, -1.525648, 1, 0, 0, 1, 1,
0.4340675, 0.4317099, 1.90107, 0, 0, 0, 1, 1,
0.4343528, -0.6230485, 2.990591, 0, 0, 0, 1, 1,
0.4353477, 0.4054599, 2.111938, 0, 0, 0, 1, 1,
0.4413698, -0.3964261, 2.191611, 0, 0, 0, 1, 1,
0.4451416, 0.7375787, 1.584784, 0, 0, 0, 1, 1,
0.4517998, 0.8371684, 1.40663, 0, 0, 0, 1, 1,
0.4518679, 0.4170504, 1.113474, 0, 0, 0, 1, 1,
0.4545251, -0.09573457, 2.201065, 1, 1, 1, 1, 1,
0.4582934, 0.658776, 2.166331, 1, 1, 1, 1, 1,
0.4594555, -2.31951, 1.562562, 1, 1, 1, 1, 1,
0.4624388, -0.05220632, 2.71234, 1, 1, 1, 1, 1,
0.4671975, -1.076587, 1.844406, 1, 1, 1, 1, 1,
0.4967977, 0.4292942, 0.6133367, 1, 1, 1, 1, 1,
0.4976328, -0.2884709, 0.894084, 1, 1, 1, 1, 1,
0.497708, -0.3896399, 1.804872, 1, 1, 1, 1, 1,
0.5125315, -1.163365, 3.582933, 1, 1, 1, 1, 1,
0.5176268, 0.09495942, 0.05763929, 1, 1, 1, 1, 1,
0.5179191, 0.2724048, 0.7805799, 1, 1, 1, 1, 1,
0.5253087, 0.1937388, 3.089121, 1, 1, 1, 1, 1,
0.5305682, -1.397829, 1.321359, 1, 1, 1, 1, 1,
0.530919, -1.143535, 1.429747, 1, 1, 1, 1, 1,
0.5347567, -0.5355299, 2.625409, 1, 1, 1, 1, 1,
0.5365332, 0.6688806, 1.77484, 0, 0, 1, 1, 1,
0.5379122, -2.021636, 3.417842, 1, 0, 0, 1, 1,
0.538397, -1.784457, 3.06656, 1, 0, 0, 1, 1,
0.5406128, 0.3005797, 1.929362, 1, 0, 0, 1, 1,
0.5428679, 0.02453421, -0.0079827, 1, 0, 0, 1, 1,
0.5491901, -0.02103839, 0.3662081, 1, 0, 0, 1, 1,
0.555119, 1.067292, 0.7165045, 0, 0, 0, 1, 1,
0.5587456, 1.152458, -0.6663284, 0, 0, 0, 1, 1,
0.5598367, -2.244317, -0.4316014, 0, 0, 0, 1, 1,
0.5625738, -1.096203, 1.261628, 0, 0, 0, 1, 1,
0.5628302, 0.5478703, 0.9816086, 0, 0, 0, 1, 1,
0.5629191, 0.01782298, 0.7060212, 0, 0, 0, 1, 1,
0.5664765, -1.623478, 2.564407, 0, 0, 0, 1, 1,
0.5725104, 0.665159, 0.396715, 1, 1, 1, 1, 1,
0.5750241, 0.5755098, 2.308648, 1, 1, 1, 1, 1,
0.5818831, -1.160708, 1.956641, 1, 1, 1, 1, 1,
0.5828772, -0.9882529, 3.610012, 1, 1, 1, 1, 1,
0.5844859, -1.014871, 4.448174, 1, 1, 1, 1, 1,
0.5871195, 0.9873639, 1.958499, 1, 1, 1, 1, 1,
0.5891983, 0.8527264, -0.3322146, 1, 1, 1, 1, 1,
0.5898042, 1.109821, 0.7878538, 1, 1, 1, 1, 1,
0.5951415, -1.50524, 3.981601, 1, 1, 1, 1, 1,
0.596823, 0.4827329, 2.744886, 1, 1, 1, 1, 1,
0.5971865, 0.8758226, 0.604821, 1, 1, 1, 1, 1,
0.5997737, -0.2911356, 1.721707, 1, 1, 1, 1, 1,
0.6004065, 0.2606066, 0.9086146, 1, 1, 1, 1, 1,
0.6040618, -0.05282232, 0.9110326, 1, 1, 1, 1, 1,
0.6072862, 0.04492502, 2.638617, 1, 1, 1, 1, 1,
0.608398, 0.8075776, 2.281004, 0, 0, 1, 1, 1,
0.6086724, -0.02211983, 1.106396, 1, 0, 0, 1, 1,
0.6092173, 1.071431, 1.007137, 1, 0, 0, 1, 1,
0.6136599, -1.20118, 3.505367, 1, 0, 0, 1, 1,
0.6141832, 0.6235182, 0.7313532, 1, 0, 0, 1, 1,
0.6158304, 0.01755309, 0.1464356, 1, 0, 0, 1, 1,
0.617866, -0.5207504, 3.262787, 0, 0, 0, 1, 1,
0.6214411, -0.2513351, 0.9365559, 0, 0, 0, 1, 1,
0.6261308, 0.9233682, 1.123577, 0, 0, 0, 1, 1,
0.6304798, 1.419655, 1.086287, 0, 0, 0, 1, 1,
0.6363583, -0.6020781, 1.553833, 0, 0, 0, 1, 1,
0.6437994, 1.223747, 0.6187776, 0, 0, 0, 1, 1,
0.6442662, -0.7284475, 2.494753, 0, 0, 0, 1, 1,
0.6444184, 0.03847379, 2.666628, 1, 1, 1, 1, 1,
0.6450515, 1.52712, -0.5631831, 1, 1, 1, 1, 1,
0.6489472, -0.04379382, 2.883707, 1, 1, 1, 1, 1,
0.6499678, -0.3158942, 0.4521087, 1, 1, 1, 1, 1,
0.6542104, -0.3507818, 1.730383, 1, 1, 1, 1, 1,
0.6553679, -0.1343838, 1.144913, 1, 1, 1, 1, 1,
0.6712564, -0.7045175, 2.990402, 1, 1, 1, 1, 1,
0.6733593, -0.5300639, 1.859489, 1, 1, 1, 1, 1,
0.6781121, 0.09433252, 2.577652, 1, 1, 1, 1, 1,
0.6784385, 0.04122445, 1.277136, 1, 1, 1, 1, 1,
0.678794, 0.05044507, 3.690778, 1, 1, 1, 1, 1,
0.6800346, 0.4468259, 2.209517, 1, 1, 1, 1, 1,
0.6830677, 0.8535522, 0.4092855, 1, 1, 1, 1, 1,
0.6832405, -0.5297425, 1.506908, 1, 1, 1, 1, 1,
0.6870174, 0.4080788, 1.200565, 1, 1, 1, 1, 1,
0.6898124, -0.5441296, 1.592026, 0, 0, 1, 1, 1,
0.6952205, -0.8154266, 2.029242, 1, 0, 0, 1, 1,
0.6982132, -0.8684945, 2.732651, 1, 0, 0, 1, 1,
0.6986845, -1.370495, 1.920156, 1, 0, 0, 1, 1,
0.6987772, -1.08491, 1.914837, 1, 0, 0, 1, 1,
0.7005479, 0.1355723, 1.535844, 1, 0, 0, 1, 1,
0.7046102, -0.8831618, 0.6643998, 0, 0, 0, 1, 1,
0.7082849, -0.4420771, 2.640233, 0, 0, 0, 1, 1,
0.7109973, -0.6476243, 2.175135, 0, 0, 0, 1, 1,
0.7133197, -0.5444357, 0.3754706, 0, 0, 0, 1, 1,
0.7224867, 0.9504892, -2.608438, 0, 0, 0, 1, 1,
0.7267337, -1.526132, 4.614453, 0, 0, 0, 1, 1,
0.7269969, 1.831859, 0.2147348, 0, 0, 0, 1, 1,
0.7301709, -1.435513, 1.285159, 1, 1, 1, 1, 1,
0.7320735, 0.07130206, 1.147641, 1, 1, 1, 1, 1,
0.7404805, 0.5883971, 0.7231551, 1, 1, 1, 1, 1,
0.7468434, 0.3584202, 0.6236748, 1, 1, 1, 1, 1,
0.7523109, -0.7062114, 3.504457, 1, 1, 1, 1, 1,
0.768429, -1.665902, 4.260702, 1, 1, 1, 1, 1,
0.7705843, 0.4646809, 1.852621, 1, 1, 1, 1, 1,
0.7732262, -0.9655976, 0.488907, 1, 1, 1, 1, 1,
0.7774642, -0.9522904, 3.094119, 1, 1, 1, 1, 1,
0.7785904, -0.9597967, 1.74642, 1, 1, 1, 1, 1,
0.78074, 0.8398398, -0.5656975, 1, 1, 1, 1, 1,
0.7847174, -0.7793998, 3.591682, 1, 1, 1, 1, 1,
0.7866576, 0.9302614, 0.01384676, 1, 1, 1, 1, 1,
0.7926949, -2.465989, 2.768611, 1, 1, 1, 1, 1,
0.7959512, 0.5534711, -0.06060623, 1, 1, 1, 1, 1,
0.7987646, -2.97825, 2.094543, 0, 0, 1, 1, 1,
0.8109266, -0.2486032, 2.712407, 1, 0, 0, 1, 1,
0.8140752, 0.7491161, 0.9969569, 1, 0, 0, 1, 1,
0.8229194, 0.7997029, -0.5838197, 1, 0, 0, 1, 1,
0.8271713, -0.1914696, 2.688171, 1, 0, 0, 1, 1,
0.8290681, -0.9879968, 2.067991, 1, 0, 0, 1, 1,
0.8326067, -2.336204, 3.525753, 0, 0, 0, 1, 1,
0.838567, -0.4585766, 3.267456, 0, 0, 0, 1, 1,
0.8389885, -0.7598697, 2.067033, 0, 0, 0, 1, 1,
0.842149, 0.844447, -0.28711, 0, 0, 0, 1, 1,
0.8476313, 0.7289754, 1.024435, 0, 0, 0, 1, 1,
0.8489395, 0.609759, 1.270564, 0, 0, 0, 1, 1,
0.8491414, 1.366659, -0.6125538, 0, 0, 0, 1, 1,
0.8492484, -1.035206, 2.077424, 1, 1, 1, 1, 1,
0.8529636, 1.437887, -0.6817767, 1, 1, 1, 1, 1,
0.8601974, -0.9228916, 3.148394, 1, 1, 1, 1, 1,
0.8606949, -1.011731, 1.746628, 1, 1, 1, 1, 1,
0.8607523, -0.7868661, 2.689263, 1, 1, 1, 1, 1,
0.8661729, -0.8249285, 1.930465, 1, 1, 1, 1, 1,
0.870177, -1.323128, 3.113876, 1, 1, 1, 1, 1,
0.876747, 1.566865, -0.09693176, 1, 1, 1, 1, 1,
0.8774027, -2.556955, 0.4719789, 1, 1, 1, 1, 1,
0.8779765, 0.4019975, 1.788794, 1, 1, 1, 1, 1,
0.8786641, 0.5872459, 3.358624, 1, 1, 1, 1, 1,
0.8812029, -1.787196, 3.080579, 1, 1, 1, 1, 1,
0.8835564, -1.030021, 2.350572, 1, 1, 1, 1, 1,
0.8906078, -0.2808071, 3.737842, 1, 1, 1, 1, 1,
0.8943274, 0.3812178, 0.5935767, 1, 1, 1, 1, 1,
0.8948346, 0.08701865, 1.797447, 0, 0, 1, 1, 1,
0.8969861, 0.3837875, 0.1748948, 1, 0, 0, 1, 1,
0.8992671, -1.100141, 4.629159, 1, 0, 0, 1, 1,
0.9049895, 1.269807, 0.8415282, 1, 0, 0, 1, 1,
0.9063879, -0.6937531, 1.768059, 1, 0, 0, 1, 1,
0.9069266, -0.1738931, 2.364402, 1, 0, 0, 1, 1,
0.9165147, -0.5658837, 2.524513, 0, 0, 0, 1, 1,
0.9171386, -0.08986794, 2.878942, 0, 0, 0, 1, 1,
0.9174373, -1.16029, 2.683561, 0, 0, 0, 1, 1,
0.9234926, -0.7775378, 2.69855, 0, 0, 0, 1, 1,
0.9239223, -0.4576292, 2.791742, 0, 0, 0, 1, 1,
0.9239703, 0.3810378, 0.05009801, 0, 0, 0, 1, 1,
0.926235, 1.019329, 2.679803, 0, 0, 0, 1, 1,
0.9273906, 0.3351646, 2.247608, 1, 1, 1, 1, 1,
0.9356942, 0.1396194, 1.351317, 1, 1, 1, 1, 1,
0.937005, -0.1482945, 2.297918, 1, 1, 1, 1, 1,
0.9374798, 1.574012, 1.41275, 1, 1, 1, 1, 1,
0.9379927, 0.2832039, 0.1235198, 1, 1, 1, 1, 1,
0.9441184, -1.020601, 2.782528, 1, 1, 1, 1, 1,
0.9507819, 0.1902016, 1.403178, 1, 1, 1, 1, 1,
0.9511074, 0.1012241, 3.345724, 1, 1, 1, 1, 1,
0.9554287, 0.7445464, 2.069239, 1, 1, 1, 1, 1,
0.9646457, -0.2066378, 3.140229, 1, 1, 1, 1, 1,
0.9703987, -1.474731, 0.4289233, 1, 1, 1, 1, 1,
0.9717016, 0.7489615, 1.387977, 1, 1, 1, 1, 1,
0.9782998, -0.2030817, 1.538792, 1, 1, 1, 1, 1,
0.9873981, 2.114179, 0.6714711, 1, 1, 1, 1, 1,
0.9917831, -0.6797026, 0.1774809, 1, 1, 1, 1, 1,
1.000674, 0.4218508, 1.418777, 0, 0, 1, 1, 1,
1.002429, -1.097895, 4.25943, 1, 0, 0, 1, 1,
1.004672, -0.2384418, 1.445942, 1, 0, 0, 1, 1,
1.008344, 0.5369135, 0.8172923, 1, 0, 0, 1, 1,
1.011976, 1.506056, 1.178543, 1, 0, 0, 1, 1,
1.016714, 0.4699205, 0.6424351, 1, 0, 0, 1, 1,
1.019781, 2.45528, -0.8901078, 0, 0, 0, 1, 1,
1.022195, -0.03323597, 2.379651, 0, 0, 0, 1, 1,
1.034747, -1.302792, 1.860913, 0, 0, 0, 1, 1,
1.053556, 1.050279, 0.04142792, 0, 0, 0, 1, 1,
1.053592, 0.1104001, 0.07684123, 0, 0, 0, 1, 1,
1.058515, 1.690046, 0.5936196, 0, 0, 0, 1, 1,
1.062494, -1.195301, 1.175998, 0, 0, 0, 1, 1,
1.065207, -1.368825, 2.15284, 1, 1, 1, 1, 1,
1.074169, 0.466657, 3.111426, 1, 1, 1, 1, 1,
1.077052, -0.780166, 1.227236, 1, 1, 1, 1, 1,
1.096556, 0.5201358, 1.346444, 1, 1, 1, 1, 1,
1.097849, 0.5714773, -0.003075291, 1, 1, 1, 1, 1,
1.100096, 1.425069, 1.260258, 1, 1, 1, 1, 1,
1.106133, -0.7232497, 1.038738, 1, 1, 1, 1, 1,
1.117678, 1.178008, -0.01614015, 1, 1, 1, 1, 1,
1.119201, -0.5358225, 1.522619, 1, 1, 1, 1, 1,
1.124386, -1.221025, 1.922588, 1, 1, 1, 1, 1,
1.133407, 0.2143872, 1.61483, 1, 1, 1, 1, 1,
1.138632, -0.946955, 3.512806, 1, 1, 1, 1, 1,
1.140792, -0.3684477, 3.226248, 1, 1, 1, 1, 1,
1.147584, -0.139867, 2.547378, 1, 1, 1, 1, 1,
1.150906, 1.089469, 0.1467413, 1, 1, 1, 1, 1,
1.15624, -0.9370282, 2.011106, 0, 0, 1, 1, 1,
1.158095, -0.4381486, 2.003008, 1, 0, 0, 1, 1,
1.159702, 0.3372451, 1.327011, 1, 0, 0, 1, 1,
1.164158, -0.9815045, 3.211908, 1, 0, 0, 1, 1,
1.165834, 0.4703974, 3.334017, 1, 0, 0, 1, 1,
1.171903, 0.3225539, -0.2917208, 1, 0, 0, 1, 1,
1.190945, 0.6217632, 1.752587, 0, 0, 0, 1, 1,
1.191357, -0.4990619, 0.802093, 0, 0, 0, 1, 1,
1.192674, -0.6404626, 0.2214849, 0, 0, 0, 1, 1,
1.213052, -0.8240231, 2.632319, 0, 0, 0, 1, 1,
1.227329, 0.08744799, 0.10601, 0, 0, 0, 1, 1,
1.230498, 1.411011, 1.187571, 0, 0, 0, 1, 1,
1.230909, 0.3229502, 0.5970715, 0, 0, 0, 1, 1,
1.231877, 0.2530401, 1.655435, 1, 1, 1, 1, 1,
1.233217, 0.6057612, 1.857102, 1, 1, 1, 1, 1,
1.242911, -0.4660132, 0.2971857, 1, 1, 1, 1, 1,
1.24902, 1.688186, -1.076531, 1, 1, 1, 1, 1,
1.252049, 0.9862829, 1.298646, 1, 1, 1, 1, 1,
1.253323, 0.5032858, 1.240457, 1, 1, 1, 1, 1,
1.256345, 0.8431963, -1.054987, 1, 1, 1, 1, 1,
1.266314, 0.2145133, 1.205973, 1, 1, 1, 1, 1,
1.266624, -0.5838662, 1.782016, 1, 1, 1, 1, 1,
1.282069, -0.9270421, 3.178003, 1, 1, 1, 1, 1,
1.288946, -0.9541329, 1.823594, 1, 1, 1, 1, 1,
1.301909, -1.918389, 4.087964, 1, 1, 1, 1, 1,
1.302005, -0.3873464, 1.974604, 1, 1, 1, 1, 1,
1.318941, 1.218653, 0.5836849, 1, 1, 1, 1, 1,
1.322708, 0.4553708, 1.253643, 1, 1, 1, 1, 1,
1.355805, -0.9069502, 1.059737, 0, 0, 1, 1, 1,
1.359932, -0.3516756, -0.2390545, 1, 0, 0, 1, 1,
1.364468, -0.96521, 3.017315, 1, 0, 0, 1, 1,
1.367965, -0.04701898, 5.227052, 1, 0, 0, 1, 1,
1.371076, -0.442083, 1.07272, 1, 0, 0, 1, 1,
1.375126, -0.9018291, 0.8006098, 1, 0, 0, 1, 1,
1.375702, 1.21859, 0.6219248, 0, 0, 0, 1, 1,
1.378843, 0.236879, 2.304561, 0, 0, 0, 1, 1,
1.385349, -0.810876, 0.7097662, 0, 0, 0, 1, 1,
1.397539, -0.5610927, 1.104963, 0, 0, 0, 1, 1,
1.413704, -0.6217902, 1.621909, 0, 0, 0, 1, 1,
1.415803, 2.932895, -0.3678859, 0, 0, 0, 1, 1,
1.449837, -1.441591, 1.777406, 0, 0, 0, 1, 1,
1.454052, 0.8424951, 1.480207, 1, 1, 1, 1, 1,
1.464855, -0.9127222, 1.058437, 1, 1, 1, 1, 1,
1.474069, 0.6607649, 1.935253, 1, 1, 1, 1, 1,
1.477262, -0.05090579, 3.029803, 1, 1, 1, 1, 1,
1.479224, -0.8883064, 1.004512, 1, 1, 1, 1, 1,
1.47929, 0.3112666, 0.1414634, 1, 1, 1, 1, 1,
1.495519, -0.7142969, 0.7574028, 1, 1, 1, 1, 1,
1.498691, -0.9522008, 1.196517, 1, 1, 1, 1, 1,
1.500046, 0.1773485, 0.8916861, 1, 1, 1, 1, 1,
1.501161, 1.338587, 0.7789943, 1, 1, 1, 1, 1,
1.51957, -0.4092709, -0.4119068, 1, 1, 1, 1, 1,
1.522285, -0.2451538, 1.16238, 1, 1, 1, 1, 1,
1.523823, 0.01581932, 1.571897, 1, 1, 1, 1, 1,
1.529653, 2.143865, 0.5502079, 1, 1, 1, 1, 1,
1.532011, -0.9995404, 2.210038, 1, 1, 1, 1, 1,
1.539702, -0.7284737, 2.994267, 0, 0, 1, 1, 1,
1.542674, 0.008643987, 1.123121, 1, 0, 0, 1, 1,
1.552896, 0.3854181, 0.444022, 1, 0, 0, 1, 1,
1.55657, 0.7560451, 0.9641629, 1, 0, 0, 1, 1,
1.558179, 1.503933, 1.634769, 1, 0, 0, 1, 1,
1.561067, 1.772493, 0.1362172, 1, 0, 0, 1, 1,
1.561313, -1.36509, 1.02692, 0, 0, 0, 1, 1,
1.563803, -0.5365684, 2.676958, 0, 0, 0, 1, 1,
1.577375, 1.6282, 0.6129206, 0, 0, 0, 1, 1,
1.578021, -1.827689, 3.583349, 0, 0, 0, 1, 1,
1.579378, -0.9469899, 2.56408, 0, 0, 0, 1, 1,
1.580303, -0.5941427, 2.508149, 0, 0, 0, 1, 1,
1.587081, 0.6631718, 1.054101, 0, 0, 0, 1, 1,
1.60243, -0.1535808, -1.472903, 1, 1, 1, 1, 1,
1.611921, 0.511782, 0.7391462, 1, 1, 1, 1, 1,
1.614182, 0.5652763, -0.4566987, 1, 1, 1, 1, 1,
1.617658, 0.008518733, 2.271529, 1, 1, 1, 1, 1,
1.631154, 1.289551, 1.10384, 1, 1, 1, 1, 1,
1.63184, 1.334528, 0.816867, 1, 1, 1, 1, 1,
1.635779, 0.1763706, 1.422121, 1, 1, 1, 1, 1,
1.637501, -0.6082096, 3.85617, 1, 1, 1, 1, 1,
1.64809, 0.7355891, -0.07454847, 1, 1, 1, 1, 1,
1.658228, 0.6059349, 1.420552, 1, 1, 1, 1, 1,
1.659281, 0.9353964, 1.401136, 1, 1, 1, 1, 1,
1.668341, 0.871296, 0.6869684, 1, 1, 1, 1, 1,
1.6799, 0.07084889, 2.237422, 1, 1, 1, 1, 1,
1.701501, 0.258031, 1.626239, 1, 1, 1, 1, 1,
1.704961, -0.9046872, 2.0595, 1, 1, 1, 1, 1,
1.710926, -1.874415, 1.781535, 0, 0, 1, 1, 1,
1.712113, 1.745214, 1.187384, 1, 0, 0, 1, 1,
1.716723, -1.031797, 3.115628, 1, 0, 0, 1, 1,
1.730736, -0.7976849, 2.480258, 1, 0, 0, 1, 1,
1.731909, -0.4650068, 1.159232, 1, 0, 0, 1, 1,
1.747272, -0.6664525, 2.406906, 1, 0, 0, 1, 1,
1.752024, 0.7774195, 1.701873, 0, 0, 0, 1, 1,
1.771171, 0.2391732, 0.5205592, 0, 0, 0, 1, 1,
1.779847, 0.05190329, 0.768696, 0, 0, 0, 1, 1,
1.780113, 1.525521, 1.485233, 0, 0, 0, 1, 1,
1.786383, -0.9204959, 2.352284, 0, 0, 0, 1, 1,
1.790054, -2.094499, 3.372822, 0, 0, 0, 1, 1,
1.814857, 0.8595544, 1.847059, 0, 0, 0, 1, 1,
1.826093, 1.207892, -1.205135, 1, 1, 1, 1, 1,
1.874116, 0.7439289, 1.036307, 1, 1, 1, 1, 1,
1.881629, 0.1022219, 0.8712705, 1, 1, 1, 1, 1,
1.895072, -0.1336523, 0.8810138, 1, 1, 1, 1, 1,
1.90169, 0.4594052, 1.4341, 1, 1, 1, 1, 1,
1.914119, -1.283059, 2.82469, 1, 1, 1, 1, 1,
1.927013, -0.3744602, 4.628646, 1, 1, 1, 1, 1,
1.92911, 0.1405526, 1.757107, 1, 1, 1, 1, 1,
1.945303, -0.4599987, 2.380753, 1, 1, 1, 1, 1,
1.958504, -1.13544, 0.6176379, 1, 1, 1, 1, 1,
1.960189, -0.7124863, 1.878743, 1, 1, 1, 1, 1,
1.970555, 1.25231, 1.201213, 1, 1, 1, 1, 1,
1.976488, 0.6685499, 1.061399, 1, 1, 1, 1, 1,
2.037326, 0.2659701, 3.46458, 1, 1, 1, 1, 1,
2.040186, 1.063284, 1.197523, 1, 1, 1, 1, 1,
2.07549, -1.685159, 2.611794, 0, 0, 1, 1, 1,
2.087913, -0.102538, 0.6928713, 1, 0, 0, 1, 1,
2.101798, 0.2907951, 1.845998, 1, 0, 0, 1, 1,
2.109885, 1.229124, 0.6399472, 1, 0, 0, 1, 1,
2.165428, 0.05659577, 2.491124, 1, 0, 0, 1, 1,
2.16561, 0.5735947, 3.266821, 1, 0, 0, 1, 1,
2.174542, -0.4994543, 3.38978, 0, 0, 0, 1, 1,
2.182824, 0.6212036, 1.877545, 0, 0, 0, 1, 1,
2.18932, -0.1481231, -1.127, 0, 0, 0, 1, 1,
2.221616, 1.008785, 0.9301879, 0, 0, 0, 1, 1,
2.312874, -0.1150454, 2.00259, 0, 0, 0, 1, 1,
2.320106, 0.323835, 1.235748, 0, 0, 0, 1, 1,
2.325292, -1.856796, 0.5659459, 0, 0, 0, 1, 1,
2.334799, -1.849488, 3.471362, 1, 1, 1, 1, 1,
2.353145, -0.701304, 0.6648099, 1, 1, 1, 1, 1,
2.558493, -0.6234918, 1.058955, 1, 1, 1, 1, 1,
2.633543, -0.05586473, 2.921416, 1, 1, 1, 1, 1,
2.654456, -2.379221, 1.370275, 1, 1, 1, 1, 1,
2.736671, 0.3387055, 1.537494, 1, 1, 1, 1, 1,
2.960148, -0.7009453, 2.147458, 1, 1, 1, 1, 1
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
var radius = 9.618194;
var distance = 33.7835;
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
mvMatrix.translate( 0.1494571, -0.4050629, 0.1106024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7835);
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
