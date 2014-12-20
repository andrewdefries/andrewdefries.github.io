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
-2.880528, 2.560036, -0.1188515, 1, 0, 0, 1,
-2.654973, 0.2658394, -2.410121, 1, 0.007843138, 0, 1,
-2.62399, -0.3843051, -1.820446, 1, 0.01176471, 0, 1,
-2.460821, 0.9792442, -1.004663, 1, 0.01960784, 0, 1,
-2.432439, 0.122575, 0.2056493, 1, 0.02352941, 0, 1,
-2.426469, 0.3382782, -2.23111, 1, 0.03137255, 0, 1,
-2.363859, -0.1449922, 1.637966, 1, 0.03529412, 0, 1,
-2.268958, -1.304549, -3.071118, 1, 0.04313726, 0, 1,
-2.24565, -0.1728936, -3.280461, 1, 0.04705882, 0, 1,
-2.234531, 0.5138914, 0.1557786, 1, 0.05490196, 0, 1,
-2.207435, -0.5580546, -2.817532, 1, 0.05882353, 0, 1,
-2.182836, -1.313084, -0.5784305, 1, 0.06666667, 0, 1,
-2.179167, 2.129867, 0.06869482, 1, 0.07058824, 0, 1,
-2.156554, -2.824285, -1.922763, 1, 0.07843138, 0, 1,
-2.155167, 0.8917849, 0.09805343, 1, 0.08235294, 0, 1,
-2.15386, 0.7834795, -1.305596, 1, 0.09019608, 0, 1,
-2.144753, 0.2969576, -0.7148339, 1, 0.09411765, 0, 1,
-2.137152, -0.4611448, -1.084917, 1, 0.1019608, 0, 1,
-2.11184, -0.2587931, -1.249651, 1, 0.1098039, 0, 1,
-2.104577, -1.048729, -2.321058, 1, 0.1137255, 0, 1,
-2.066674, -0.3529097, -0.8540858, 1, 0.1215686, 0, 1,
-2.061062, -1.712609, -1.782395, 1, 0.1254902, 0, 1,
-2.036075, 0.9770278, -2.14514, 1, 0.1333333, 0, 1,
-2.015006, -0.4383914, -2.010315, 1, 0.1372549, 0, 1,
-2.007968, -0.01963915, -1.332255, 1, 0.145098, 0, 1,
-2.003664, -1.519594, -2.868694, 1, 0.1490196, 0, 1,
-2.00208, -0.5855251, -1.115661, 1, 0.1568628, 0, 1,
-1.987722, 0.2483762, -0.5263262, 1, 0.1607843, 0, 1,
-1.968211, 0.1057633, -0.9619682, 1, 0.1686275, 0, 1,
-1.964948, -0.3120889, -2.295133, 1, 0.172549, 0, 1,
-1.959448, -1.037883, -1.290996, 1, 0.1803922, 0, 1,
-1.956013, 0.1378561, -1.412635, 1, 0.1843137, 0, 1,
-1.949108, 0.2900839, -1.138615, 1, 0.1921569, 0, 1,
-1.946933, -0.6831788, -1.072671, 1, 0.1960784, 0, 1,
-1.926847, 0.3208421, -0.6605216, 1, 0.2039216, 0, 1,
-1.912526, -1.080286, -3.244206, 1, 0.2117647, 0, 1,
-1.912322, -0.1454128, -1.498116, 1, 0.2156863, 0, 1,
-1.899955, -0.6742867, -2.144566, 1, 0.2235294, 0, 1,
-1.898901, 0.870229, -1.417696, 1, 0.227451, 0, 1,
-1.848086, 0.3997415, -1.361204, 1, 0.2352941, 0, 1,
-1.833263, -1.906781, -3.254196, 1, 0.2392157, 0, 1,
-1.829334, -0.1871443, -1.448832, 1, 0.2470588, 0, 1,
-1.816261, 0.7885546, -1.101124, 1, 0.2509804, 0, 1,
-1.810942, 0.4798917, -1.208362, 1, 0.2588235, 0, 1,
-1.810922, -0.2811611, -0.2473689, 1, 0.2627451, 0, 1,
-1.798642, -1.34423, -1.792303, 1, 0.2705882, 0, 1,
-1.789994, -1.10612, -2.787512, 1, 0.2745098, 0, 1,
-1.757227, 0.168878, -2.350168, 1, 0.282353, 0, 1,
-1.754144, -1.041128, -2.440641, 1, 0.2862745, 0, 1,
-1.75223, -1.356405, -1.361713, 1, 0.2941177, 0, 1,
-1.730394, 0.9342214, -1.63194, 1, 0.3019608, 0, 1,
-1.721029, 1.517191, -0.5904638, 1, 0.3058824, 0, 1,
-1.712645, -0.4774344, -1.41595, 1, 0.3137255, 0, 1,
-1.706795, -1.019176, -2.834228, 1, 0.3176471, 0, 1,
-1.691182, 1.357892, -1.628708, 1, 0.3254902, 0, 1,
-1.660761, -0.3449346, -1.041808, 1, 0.3294118, 0, 1,
-1.647434, 0.8785839, 0.4908938, 1, 0.3372549, 0, 1,
-1.641649, 1.176279, -1.669259, 1, 0.3411765, 0, 1,
-1.630926, 1.297263, -0.8172994, 1, 0.3490196, 0, 1,
-1.622204, -0.6667247, -1.955363, 1, 0.3529412, 0, 1,
-1.621777, -0.7062452, -1.916801, 1, 0.3607843, 0, 1,
-1.59637, -1.132122, -0.929621, 1, 0.3647059, 0, 1,
-1.573465, 0.1935996, -1.361308, 1, 0.372549, 0, 1,
-1.546713, -1.199379, -1.497468, 1, 0.3764706, 0, 1,
-1.543111, -2.257151, -2.972843, 1, 0.3843137, 0, 1,
-1.5338, 0.3805735, -1.23582, 1, 0.3882353, 0, 1,
-1.511867, 0.4990484, -0.8988225, 1, 0.3960784, 0, 1,
-1.509571, 0.4474166, -0.3823144, 1, 0.4039216, 0, 1,
-1.494729, 0.5365896, 0.1892435, 1, 0.4078431, 0, 1,
-1.475852, -0.2395295, -0.8720871, 1, 0.4156863, 0, 1,
-1.472174, 0.04628373, -3.088191, 1, 0.4196078, 0, 1,
-1.462915, -1.865867, -2.183023, 1, 0.427451, 0, 1,
-1.46274, -1.304684, -2.956438, 1, 0.4313726, 0, 1,
-1.459089, 1.088771, 0.4482561, 1, 0.4392157, 0, 1,
-1.448649, 0.8955868, -1.976215, 1, 0.4431373, 0, 1,
-1.426858, -0.355956, -2.453495, 1, 0.4509804, 0, 1,
-1.425443, -0.7901544, -2.184695, 1, 0.454902, 0, 1,
-1.421764, 1.373434, -0.4457161, 1, 0.4627451, 0, 1,
-1.392712, 0.902817, -1.080919, 1, 0.4666667, 0, 1,
-1.3907, 0.9782742, -0.329817, 1, 0.4745098, 0, 1,
-1.380461, 1.052839, -0.0866721, 1, 0.4784314, 0, 1,
-1.380344, -0.5352358, -0.1985027, 1, 0.4862745, 0, 1,
-1.377658, 0.1020238, -0.5124321, 1, 0.4901961, 0, 1,
-1.372334, 0.8660183, -0.7646738, 1, 0.4980392, 0, 1,
-1.344249, 0.114866, -1.006461, 1, 0.5058824, 0, 1,
-1.342212, 0.6282621, 0.5546123, 1, 0.509804, 0, 1,
-1.333309, -0.3548452, -1.010677, 1, 0.5176471, 0, 1,
-1.328545, -0.774994, -0.8920611, 1, 0.5215687, 0, 1,
-1.326169, 1.087055, 1.204509, 1, 0.5294118, 0, 1,
-1.322995, 0.5179082, -1.371635, 1, 0.5333334, 0, 1,
-1.316988, 0.08950846, -2.045884, 1, 0.5411765, 0, 1,
-1.289521, 1.169222, -1.454355, 1, 0.5450981, 0, 1,
-1.285351, 1.166855, -1.165693, 1, 0.5529412, 0, 1,
-1.276739, -1.232089, -1.685592, 1, 0.5568628, 0, 1,
-1.273073, -0.4347079, -2.363789, 1, 0.5647059, 0, 1,
-1.268731, 1.715172, -0.7881154, 1, 0.5686275, 0, 1,
-1.263292, 1.042806, 0.04829947, 1, 0.5764706, 0, 1,
-1.263062, 0.04988946, -2.484211, 1, 0.5803922, 0, 1,
-1.259829, 1.064179, -0.8205687, 1, 0.5882353, 0, 1,
-1.257794, -1.312235, -2.59269, 1, 0.5921569, 0, 1,
-1.250614, -0.3309858, -2.534905, 1, 0.6, 0, 1,
-1.245325, -0.7753012, -4.119493, 1, 0.6078432, 0, 1,
-1.224089, 0.01124947, -2.489559, 1, 0.6117647, 0, 1,
-1.221215, 0.4583213, -0.1591373, 1, 0.6196079, 0, 1,
-1.21924, 0.04033202, -1.487782, 1, 0.6235294, 0, 1,
-1.218415, 0.213994, -3.071537, 1, 0.6313726, 0, 1,
-1.214419, 0.7806739, -1.698753, 1, 0.6352941, 0, 1,
-1.204343, 0.6543075, -1.365759, 1, 0.6431373, 0, 1,
-1.202694, 0.06732507, -3.225344, 1, 0.6470588, 0, 1,
-1.200685, -1.052622, -3.245484, 1, 0.654902, 0, 1,
-1.19976, 0.3503561, -1.294778, 1, 0.6588235, 0, 1,
-1.19613, -1.270311, -2.611431, 1, 0.6666667, 0, 1,
-1.178797, 0.3091371, -1.723348, 1, 0.6705883, 0, 1,
-1.176607, 0.6640104, -1.767869, 1, 0.6784314, 0, 1,
-1.174057, -0.3787816, -1.215077, 1, 0.682353, 0, 1,
-1.173449, 1.162307, -1.158868, 1, 0.6901961, 0, 1,
-1.172772, -0.6240798, -0.6293086, 1, 0.6941177, 0, 1,
-1.172177, -0.5306626, -3.35566, 1, 0.7019608, 0, 1,
-1.164865, 0.170599, -1.6411, 1, 0.7098039, 0, 1,
-1.164192, -0.8659316, -2.342056, 1, 0.7137255, 0, 1,
-1.163025, -0.3240833, -3.649164, 1, 0.7215686, 0, 1,
-1.161446, -0.7905054, -2.696427, 1, 0.7254902, 0, 1,
-1.14725, -1.208268, -2.49188, 1, 0.7333333, 0, 1,
-1.133752, -1.415967, -3.682713, 1, 0.7372549, 0, 1,
-1.130561, -0.4794214, -1.494462, 1, 0.7450981, 0, 1,
-1.126164, -0.7288253, -1.618628, 1, 0.7490196, 0, 1,
-1.11867, 0.8859687, -0.9273632, 1, 0.7568628, 0, 1,
-1.116613, 0.01683069, -0.1617661, 1, 0.7607843, 0, 1,
-1.110765, -0.3384229, -2.19778, 1, 0.7686275, 0, 1,
-1.108223, 0.03350685, 0.06648479, 1, 0.772549, 0, 1,
-1.107308, 0.3007136, -2.455559, 1, 0.7803922, 0, 1,
-1.092689, 0.06144493, -0.358163, 1, 0.7843137, 0, 1,
-1.084771, 0.3102518, -2.907803, 1, 0.7921569, 0, 1,
-1.075468, -1.492286, -2.7323, 1, 0.7960784, 0, 1,
-1.073043, 0.4462179, -2.524416, 1, 0.8039216, 0, 1,
-1.066233, -2.072316, -3.557571, 1, 0.8117647, 0, 1,
-1.064343, 0.04882336, -1.510617, 1, 0.8156863, 0, 1,
-1.056801, -0.8407638, -3.043584, 1, 0.8235294, 0, 1,
-1.049586, -0.7399706, -2.149194, 1, 0.827451, 0, 1,
-1.043835, -0.5172132, -2.050526, 1, 0.8352941, 0, 1,
-1.038802, -0.3001752, -3.321292, 1, 0.8392157, 0, 1,
-1.014904, -1.067693, -4.282255, 1, 0.8470588, 0, 1,
-1.009044, -0.2215865, -2.555145, 1, 0.8509804, 0, 1,
-1.005272, 1.547097, 1.105396, 1, 0.8588235, 0, 1,
-1.001068, 0.099458, -0.6900883, 1, 0.8627451, 0, 1,
-1.000047, 0.7008092, -2.476154, 1, 0.8705882, 0, 1,
-0.9949793, -0.1832363, -2.61545, 1, 0.8745098, 0, 1,
-0.9949371, -0.3542516, -0.6973186, 1, 0.8823529, 0, 1,
-0.992884, 1.41332, -0.1514159, 1, 0.8862745, 0, 1,
-0.9841979, -0.1115308, -1.504694, 1, 0.8941177, 0, 1,
-0.9820939, -0.1622008, -0.7763857, 1, 0.8980392, 0, 1,
-0.9820606, -0.09023149, -1.432306, 1, 0.9058824, 0, 1,
-0.9782291, 1.069943, 0.03157849, 1, 0.9137255, 0, 1,
-0.9766839, 0.6834021, 0.4743091, 1, 0.9176471, 0, 1,
-0.9751888, 1.284561, 1.023134, 1, 0.9254902, 0, 1,
-0.974125, 0.8234609, -1.056474, 1, 0.9294118, 0, 1,
-0.9737853, -0.2251179, -2.942233, 1, 0.9372549, 0, 1,
-0.9718016, -0.03074972, -3.09149, 1, 0.9411765, 0, 1,
-0.9712585, 1.491027, -0.3926218, 1, 0.9490196, 0, 1,
-0.970006, 0.6763868, -1.336043, 1, 0.9529412, 0, 1,
-0.9696917, 1.412957, 0.4265929, 1, 0.9607843, 0, 1,
-0.9688931, 0.03188614, -3.782185, 1, 0.9647059, 0, 1,
-0.9632034, 1.820441, 0.6552387, 1, 0.972549, 0, 1,
-0.963094, -0.4712369, -2.661026, 1, 0.9764706, 0, 1,
-0.9567607, -0.7600977, -2.355004, 1, 0.9843137, 0, 1,
-0.9560404, -0.3486147, -1.539456, 1, 0.9882353, 0, 1,
-0.9535897, 0.3498386, -2.11799, 1, 0.9960784, 0, 1,
-0.9529639, -0.1230973, -2.662343, 0.9960784, 1, 0, 1,
-0.9448614, -1.265329, -0.8265618, 0.9921569, 1, 0, 1,
-0.9442587, -0.8832676, -2.673898, 0.9843137, 1, 0, 1,
-0.938488, -0.2909564, -2.790864, 0.9803922, 1, 0, 1,
-0.9349676, -0.1867693, -1.242322, 0.972549, 1, 0, 1,
-0.9347309, -0.8180428, -2.116515, 0.9686275, 1, 0, 1,
-0.9319694, -0.94707, -1.843886, 0.9607843, 1, 0, 1,
-0.9274669, -0.8693504, -2.415736, 0.9568627, 1, 0, 1,
-0.9268344, 0.11673, -0.1247467, 0.9490196, 1, 0, 1,
-0.9242758, -0.2072453, -0.1386775, 0.945098, 1, 0, 1,
-0.9220465, -1.16217, -3.850084, 0.9372549, 1, 0, 1,
-0.9180252, 0.3679714, -2.36789, 0.9333333, 1, 0, 1,
-0.9138505, 0.3272986, -1.892812, 0.9254902, 1, 0, 1,
-0.9044468, -0.8663142, -1.23449, 0.9215686, 1, 0, 1,
-0.9010305, 0.1285079, -1.836436, 0.9137255, 1, 0, 1,
-0.8995427, -0.2837532, -1.814113, 0.9098039, 1, 0, 1,
-0.899196, -0.7861709, -1.212393, 0.9019608, 1, 0, 1,
-0.8922478, -0.4177137, -3.101499, 0.8941177, 1, 0, 1,
-0.8919217, 0.07360387, -1.043496, 0.8901961, 1, 0, 1,
-0.8857728, -1.441396, -3.831451, 0.8823529, 1, 0, 1,
-0.8847633, -0.9578633, -1.699808, 0.8784314, 1, 0, 1,
-0.8817694, 1.258254, -2.669726, 0.8705882, 1, 0, 1,
-0.8738099, -0.05344293, -1.799271, 0.8666667, 1, 0, 1,
-0.8712872, 1.494442, 0.1237478, 0.8588235, 1, 0, 1,
-0.8668564, 1.395792, -0.08656963, 0.854902, 1, 0, 1,
-0.8601834, 1.750468, 0.2059235, 0.8470588, 1, 0, 1,
-0.8597848, -0.7745931, -1.24335, 0.8431373, 1, 0, 1,
-0.8576804, -1.939954, -3.640208, 0.8352941, 1, 0, 1,
-0.8562858, 0.4947886, -2.122424, 0.8313726, 1, 0, 1,
-0.8541477, -1.644424, -2.541167, 0.8235294, 1, 0, 1,
-0.8493939, -1.269994, -3.844746, 0.8196079, 1, 0, 1,
-0.8492759, -0.2321917, -1.825425, 0.8117647, 1, 0, 1,
-0.8387294, 2.066885, -0.447355, 0.8078431, 1, 0, 1,
-0.8384539, -0.7208022, -4.740143, 0.8, 1, 0, 1,
-0.8213085, 1.091442, -2.401815, 0.7921569, 1, 0, 1,
-0.81915, 0.9607713, 0.2831343, 0.7882353, 1, 0, 1,
-0.8154803, 2.006489, -1.074505, 0.7803922, 1, 0, 1,
-0.8081641, 0.3036608, -0.8207141, 0.7764706, 1, 0, 1,
-0.8078592, -0.1116876, -1.002717, 0.7686275, 1, 0, 1,
-0.8036603, -1.188568, -1.457174, 0.7647059, 1, 0, 1,
-0.8031825, -0.4501655, -2.018899, 0.7568628, 1, 0, 1,
-0.8008822, 0.1749184, -0.5175376, 0.7529412, 1, 0, 1,
-0.7995021, 0.134359, -3.591067, 0.7450981, 1, 0, 1,
-0.7926646, -1.591407, -1.796161, 0.7411765, 1, 0, 1,
-0.7902112, 0.7793252, 0.5470065, 0.7333333, 1, 0, 1,
-0.7901992, 0.6659418, -2.332183, 0.7294118, 1, 0, 1,
-0.7741058, 0.6628986, -1.172992, 0.7215686, 1, 0, 1,
-0.7714225, -1.287102, -3.386269, 0.7176471, 1, 0, 1,
-0.7708641, -0.3272992, -2.183527, 0.7098039, 1, 0, 1,
-0.7547844, -0.7044163, -0.7400135, 0.7058824, 1, 0, 1,
-0.7530414, 0.2605448, -0.5531694, 0.6980392, 1, 0, 1,
-0.7509345, -0.5838779, -1.410068, 0.6901961, 1, 0, 1,
-0.7477203, 0.8844914, 0.03648892, 0.6862745, 1, 0, 1,
-0.7419856, 0.2085238, -1.701799, 0.6784314, 1, 0, 1,
-0.7364292, 0.6144385, 0.00621771, 0.6745098, 1, 0, 1,
-0.7339497, -0.9811932, -3.267659, 0.6666667, 1, 0, 1,
-0.7317334, 0.3366333, -0.9383138, 0.6627451, 1, 0, 1,
-0.7293282, -0.06778445, -1.000061, 0.654902, 1, 0, 1,
-0.727173, 0.766616, 0.6888606, 0.6509804, 1, 0, 1,
-0.723365, 1.587804, -0.4502188, 0.6431373, 1, 0, 1,
-0.7213248, 1.060114, -1.743351, 0.6392157, 1, 0, 1,
-0.7136857, -0.4200207, -1.837972, 0.6313726, 1, 0, 1,
-0.7135525, 0.6609786, -1.089274, 0.627451, 1, 0, 1,
-0.7071087, 0.513121, -1.147346, 0.6196079, 1, 0, 1,
-0.7050822, -1.203922, -4.47451, 0.6156863, 1, 0, 1,
-0.7023749, -0.0299162, -2.09878, 0.6078432, 1, 0, 1,
-0.7017586, 0.3535691, -0.6342728, 0.6039216, 1, 0, 1,
-0.6848579, 0.6067258, 0.5178617, 0.5960785, 1, 0, 1,
-0.6800331, -0.4885371, -1.437486, 0.5882353, 1, 0, 1,
-0.6799924, 0.567984, -0.57095, 0.5843138, 1, 0, 1,
-0.6787526, 2.288197, -1.385953, 0.5764706, 1, 0, 1,
-0.6764919, -0.3095599, -1.532095, 0.572549, 1, 0, 1,
-0.6737049, 0.1391914, -0.5835921, 0.5647059, 1, 0, 1,
-0.6689574, -1.152236, -3.09529, 0.5607843, 1, 0, 1,
-0.6669701, 1.787407, 0.3759392, 0.5529412, 1, 0, 1,
-0.6652467, -0.854778, -4.918193, 0.5490196, 1, 0, 1,
-0.6637616, 0.09362559, -0.05451844, 0.5411765, 1, 0, 1,
-0.6622207, -1.99444, -3.523249, 0.5372549, 1, 0, 1,
-0.6596578, 1.932733, -1.165028, 0.5294118, 1, 0, 1,
-0.6578406, 1.251104, -0.01498412, 0.5254902, 1, 0, 1,
-0.6494919, -0.3692769, -0.2005682, 0.5176471, 1, 0, 1,
-0.6477666, 1.330377, 0.6668015, 0.5137255, 1, 0, 1,
-0.6455006, -0.117896, -2.526886, 0.5058824, 1, 0, 1,
-0.6438733, -1.931449, -3.106183, 0.5019608, 1, 0, 1,
-0.6426322, 1.713066, -1.555747, 0.4941176, 1, 0, 1,
-0.6390216, 1.484651, -2.025944, 0.4862745, 1, 0, 1,
-0.6371682, -0.8050855, -1.59678, 0.4823529, 1, 0, 1,
-0.6362848, -1.725434, -2.444693, 0.4745098, 1, 0, 1,
-0.6362824, -0.6864392, -1.75758, 0.4705882, 1, 0, 1,
-0.6304968, 0.4840369, -0.9688608, 0.4627451, 1, 0, 1,
-0.6270969, -0.4129744, -1.342435, 0.4588235, 1, 0, 1,
-0.625055, 2.300171, 1.194547, 0.4509804, 1, 0, 1,
-0.6161451, -0.4055457, -1.861193, 0.4470588, 1, 0, 1,
-0.6153047, 0.7508627, -0.4212923, 0.4392157, 1, 0, 1,
-0.6151562, 0.2145042, -2.206699, 0.4352941, 1, 0, 1,
-0.6144183, 0.7977837, 0.01113782, 0.427451, 1, 0, 1,
-0.6097776, -0.6310482, -2.669047, 0.4235294, 1, 0, 1,
-0.6064246, 0.3580399, -1.634621, 0.4156863, 1, 0, 1,
-0.6063529, 1.01063, -0.6408376, 0.4117647, 1, 0, 1,
-0.6040156, 1.249256, -0.3524011, 0.4039216, 1, 0, 1,
-0.6022033, 0.1282263, -2.012517, 0.3960784, 1, 0, 1,
-0.6016062, 0.6105207, -0.6653888, 0.3921569, 1, 0, 1,
-0.5998367, -0.3485584, -3.157725, 0.3843137, 1, 0, 1,
-0.5995345, -0.7147549, -2.490839, 0.3803922, 1, 0, 1,
-0.5988612, -0.9527004, -1.622432, 0.372549, 1, 0, 1,
-0.597317, 1.065814, -0.9283905, 0.3686275, 1, 0, 1,
-0.5915216, 0.6723812, -2.403243, 0.3607843, 1, 0, 1,
-0.5870253, 0.5167283, -0.4022762, 0.3568628, 1, 0, 1,
-0.5835983, -1.075873, -1.312081, 0.3490196, 1, 0, 1,
-0.5810577, 0.7852744, 0.2560751, 0.345098, 1, 0, 1,
-0.5783576, -0.2457696, -1.705942, 0.3372549, 1, 0, 1,
-0.5761008, -0.2159415, -2.047258, 0.3333333, 1, 0, 1,
-0.5743374, 1.662369, -0.4258991, 0.3254902, 1, 0, 1,
-0.5722311, -1.046532, -2.529559, 0.3215686, 1, 0, 1,
-0.5676298, -0.622945, -2.02265, 0.3137255, 1, 0, 1,
-0.5581362, -0.1504948, -0.8759453, 0.3098039, 1, 0, 1,
-0.557996, 0.3392354, -0.6175875, 0.3019608, 1, 0, 1,
-0.5564425, -0.9269031, -2.068225, 0.2941177, 1, 0, 1,
-0.5542663, 0.8447689, -1.432869, 0.2901961, 1, 0, 1,
-0.5539032, -1.685043, -2.096723, 0.282353, 1, 0, 1,
-0.551894, 0.7527797, -0.376591, 0.2784314, 1, 0, 1,
-0.5483841, 0.6357465, 0.3190458, 0.2705882, 1, 0, 1,
-0.5474019, -0.331091, -1.969674, 0.2666667, 1, 0, 1,
-0.5431282, 0.07491162, -1.393582, 0.2588235, 1, 0, 1,
-0.5416319, 0.1104175, -1.887027, 0.254902, 1, 0, 1,
-0.5398883, 0.6587951, -1.175734, 0.2470588, 1, 0, 1,
-0.5372593, 1.949308, 0.560396, 0.2431373, 1, 0, 1,
-0.5300773, 0.1225062, -1.313222, 0.2352941, 1, 0, 1,
-0.5282803, -0.7714398, -5.09284, 0.2313726, 1, 0, 1,
-0.5268544, -0.03354177, -2.795792, 0.2235294, 1, 0, 1,
-0.524837, 0.3881338, -0.9558545, 0.2196078, 1, 0, 1,
-0.5232196, -1.505122, -1.957411, 0.2117647, 1, 0, 1,
-0.5163561, 1.6775, -0.02832981, 0.2078431, 1, 0, 1,
-0.514671, -1.486016, -2.891756, 0.2, 1, 0, 1,
-0.5133371, -0.125424, -1.708998, 0.1921569, 1, 0, 1,
-0.5111392, 1.152143, -1.974326, 0.1882353, 1, 0, 1,
-0.5105142, 0.3970435, 0.4869423, 0.1803922, 1, 0, 1,
-0.5091608, 0.5099417, -2.456799, 0.1764706, 1, 0, 1,
-0.5030339, -1.253788, -2.275834, 0.1686275, 1, 0, 1,
-0.5029802, 0.8438045, -2.089444, 0.1647059, 1, 0, 1,
-0.4983946, -0.1018732, 0.05135331, 0.1568628, 1, 0, 1,
-0.4947695, 0.3701357, -0.2075377, 0.1529412, 1, 0, 1,
-0.4939942, -0.6518285, -2.517696, 0.145098, 1, 0, 1,
-0.4921535, -0.2437031, -2.321335, 0.1411765, 1, 0, 1,
-0.4909704, -0.5165553, -2.538292, 0.1333333, 1, 0, 1,
-0.4872775, 0.1285369, -1.961722, 0.1294118, 1, 0, 1,
-0.4856224, 0.3748568, 0.6902297, 0.1215686, 1, 0, 1,
-0.4854134, -1.702562, -1.993563, 0.1176471, 1, 0, 1,
-0.4826372, -2.01123, -3.11014, 0.1098039, 1, 0, 1,
-0.48112, 0.09012914, -0.5696205, 0.1058824, 1, 0, 1,
-0.4783757, 1.098435, -1.638488, 0.09803922, 1, 0, 1,
-0.4761571, 0.4802543, -1.559419, 0.09019608, 1, 0, 1,
-0.4692616, -0.6848513, -3.144161, 0.08627451, 1, 0, 1,
-0.4667929, 1.287454, 0.3702277, 0.07843138, 1, 0, 1,
-0.4665396, -1.383308, -3.354299, 0.07450981, 1, 0, 1,
-0.4642898, -0.1366519, -0.3787695, 0.06666667, 1, 0, 1,
-0.4616427, 0.07658036, -2.680031, 0.0627451, 1, 0, 1,
-0.459035, 1.81141, -0.08920994, 0.05490196, 1, 0, 1,
-0.4570658, 0.5288685, -0.3351643, 0.05098039, 1, 0, 1,
-0.4509445, -0.2434054, -2.460735, 0.04313726, 1, 0, 1,
-0.4415253, 0.7051507, -0.9201342, 0.03921569, 1, 0, 1,
-0.4403335, -0.388288, -2.304826, 0.03137255, 1, 0, 1,
-0.4400877, 1.805917, 0.5254391, 0.02745098, 1, 0, 1,
-0.4388487, 0.2895197, -1.675005, 0.01960784, 1, 0, 1,
-0.4387208, 2.3179, -1.050194, 0.01568628, 1, 0, 1,
-0.4356436, -0.6721265, -3.000239, 0.007843138, 1, 0, 1,
-0.4332159, -1.424385, -2.368103, 0.003921569, 1, 0, 1,
-0.4320464, 2.876529, -0.08361805, 0, 1, 0.003921569, 1,
-0.4299056, 1.336883, -0.03536995, 0, 1, 0.01176471, 1,
-0.423556, 1.790335, -2.203974, 0, 1, 0.01568628, 1,
-0.4224639, -0.215005, -3.066119, 0, 1, 0.02352941, 1,
-0.420907, -1.321807, -3.098965, 0, 1, 0.02745098, 1,
-0.4201763, -1.256828, -3.814334, 0, 1, 0.03529412, 1,
-0.4172786, 1.032145, 1.840053, 0, 1, 0.03921569, 1,
-0.4171722, 1.201924, -1.289181, 0, 1, 0.04705882, 1,
-0.4156674, 0.7393194, -0.4660489, 0, 1, 0.05098039, 1,
-0.4145725, 0.9381942, 1.147468, 0, 1, 0.05882353, 1,
-0.4088606, -0.9797785, -2.887606, 0, 1, 0.0627451, 1,
-0.4002239, -0.20837, -0.05502044, 0, 1, 0.07058824, 1,
-0.3847333, 0.9116132, 0.08983795, 0, 1, 0.07450981, 1,
-0.3837724, 0.7279909, 0.3510887, 0, 1, 0.08235294, 1,
-0.3825423, 1.050182, 0.4566058, 0, 1, 0.08627451, 1,
-0.3811175, -0.07686045, -1.746779, 0, 1, 0.09411765, 1,
-0.3809091, -1.741886, -3.531007, 0, 1, 0.1019608, 1,
-0.3773771, 1.218996, 0.6432607, 0, 1, 0.1058824, 1,
-0.3766854, -0.08937068, -1.60807, 0, 1, 0.1137255, 1,
-0.3700714, -1.498171, -2.803605, 0, 1, 0.1176471, 1,
-0.367954, -0.6309379, -3.983335, 0, 1, 0.1254902, 1,
-0.3670758, 0.5148782, 0.836495, 0, 1, 0.1294118, 1,
-0.3670284, -0.7419655, -3.185529, 0, 1, 0.1372549, 1,
-0.3646049, 0.4199814, 0.4307327, 0, 1, 0.1411765, 1,
-0.3644341, -0.04557695, -3.210035, 0, 1, 0.1490196, 1,
-0.3609436, 1.273705, -0.1726789, 0, 1, 0.1529412, 1,
-0.3602612, -1.417337, -2.639819, 0, 1, 0.1607843, 1,
-0.3600457, -0.2526047, -2.320722, 0, 1, 0.1647059, 1,
-0.359818, -0.6214224, -3.675473, 0, 1, 0.172549, 1,
-0.3545794, -0.65754, -1.913682, 0, 1, 0.1764706, 1,
-0.3481612, -0.7574429, -1.623806, 0, 1, 0.1843137, 1,
-0.3431844, 0.8003763, -0.009091472, 0, 1, 0.1882353, 1,
-0.3426049, -1.936203, -2.3367, 0, 1, 0.1960784, 1,
-0.3406498, 0.7532518, -0.1426563, 0, 1, 0.2039216, 1,
-0.340322, -1.539125, -3.380457, 0, 1, 0.2078431, 1,
-0.3385965, 0.4625526, 0.8720875, 0, 1, 0.2156863, 1,
-0.335804, -1.035073, -1.530311, 0, 1, 0.2196078, 1,
-0.3313587, 0.5684642, -1.931804, 0, 1, 0.227451, 1,
-0.3306828, -0.9134166, -4.537868, 0, 1, 0.2313726, 1,
-0.3261392, 1.964305, 1.728122, 0, 1, 0.2392157, 1,
-0.3231168, -0.4377827, -2.536773, 0, 1, 0.2431373, 1,
-0.3221225, -0.3773094, -4.337995, 0, 1, 0.2509804, 1,
-0.3220898, 0.1572556, -0.2909996, 0, 1, 0.254902, 1,
-0.3181356, -0.5076643, -3.774544, 0, 1, 0.2627451, 1,
-0.3090991, 1.422973, -0.7656121, 0, 1, 0.2666667, 1,
-0.3088965, 0.2959242, -1.880363, 0, 1, 0.2745098, 1,
-0.3004342, 1.206239, 0.5351538, 0, 1, 0.2784314, 1,
-0.2888005, 0.7705426, -2.033983, 0, 1, 0.2862745, 1,
-0.288074, 1.098835, -1.072839, 0, 1, 0.2901961, 1,
-0.2860769, -0.9761916, -3.062702, 0, 1, 0.2980392, 1,
-0.2817615, 1.209795, -0.5821015, 0, 1, 0.3058824, 1,
-0.2798694, -1.02221, -2.42353, 0, 1, 0.3098039, 1,
-0.2778222, -0.01747168, -2.173119, 0, 1, 0.3176471, 1,
-0.2769874, -0.9779152, -4.982802, 0, 1, 0.3215686, 1,
-0.276811, 2.107948, 0.7033713, 0, 1, 0.3294118, 1,
-0.26156, -0.9513977, -2.186792, 0, 1, 0.3333333, 1,
-0.261424, -0.2486898, -1.262548, 0, 1, 0.3411765, 1,
-0.2588313, 0.4100074, -1.433005, 0, 1, 0.345098, 1,
-0.2482537, -0.7015054, -2.353989, 0, 1, 0.3529412, 1,
-0.2426252, -0.1691192, -2.252283, 0, 1, 0.3568628, 1,
-0.2414917, -0.2389994, -3.339938, 0, 1, 0.3647059, 1,
-0.2391888, -1.09654, -3.972198, 0, 1, 0.3686275, 1,
-0.2320962, -1.539821, -2.284362, 0, 1, 0.3764706, 1,
-0.2247617, -0.5800611, -2.423188, 0, 1, 0.3803922, 1,
-0.2169991, 0.2732284, 0.4702467, 0, 1, 0.3882353, 1,
-0.2167506, 0.03641743, -1.162858, 0, 1, 0.3921569, 1,
-0.216236, -0.488054, -2.63042, 0, 1, 0.4, 1,
-0.2150876, -0.3236719, -1.797919, 0, 1, 0.4078431, 1,
-0.2150235, 0.4825509, -0.9583547, 0, 1, 0.4117647, 1,
-0.2108118, -0.7502722, -1.575087, 0, 1, 0.4196078, 1,
-0.2052338, -0.221357, -1.989008, 0, 1, 0.4235294, 1,
-0.2001077, -1.997815, -2.72194, 0, 1, 0.4313726, 1,
-0.1988696, -1.160501, -2.790624, 0, 1, 0.4352941, 1,
-0.1955177, 0.9733725, -1.697464, 0, 1, 0.4431373, 1,
-0.1953415, -0.5977405, -2.188957, 0, 1, 0.4470588, 1,
-0.1915115, 1.08393, -0.8335524, 0, 1, 0.454902, 1,
-0.191406, 0.8318666, -1.176258, 0, 1, 0.4588235, 1,
-0.1895927, 0.7591454, -0.3556585, 0, 1, 0.4666667, 1,
-0.1874549, -0.7230975, -1.822739, 0, 1, 0.4705882, 1,
-0.1825815, 1.559849, 1.41701, 0, 1, 0.4784314, 1,
-0.1803976, 0.0871172, 0.7881764, 0, 1, 0.4823529, 1,
-0.1771813, 0.9173076, -0.9959658, 0, 1, 0.4901961, 1,
-0.1733869, 1.672728, 0.6606048, 0, 1, 0.4941176, 1,
-0.1673359, 0.39799, -1.44537, 0, 1, 0.5019608, 1,
-0.1634869, -0.5409436, -2.320761, 0, 1, 0.509804, 1,
-0.1602324, -0.7573785, -3.112316, 0, 1, 0.5137255, 1,
-0.1590928, -1.452623, -3.513123, 0, 1, 0.5215687, 1,
-0.1586356, -0.9182871, -0.9062572, 0, 1, 0.5254902, 1,
-0.1556849, 0.2746277, -0.7127297, 0, 1, 0.5333334, 1,
-0.1508714, -0.9147104, -1.739741, 0, 1, 0.5372549, 1,
-0.1484774, 0.5041733, -1.741144, 0, 1, 0.5450981, 1,
-0.147693, -0.6994669, -1.991088, 0, 1, 0.5490196, 1,
-0.1457064, 0.5710778, -1.30774, 0, 1, 0.5568628, 1,
-0.1452955, -0.9444293, -3.482842, 0, 1, 0.5607843, 1,
-0.1444757, -0.05181665, -1.47505, 0, 1, 0.5686275, 1,
-0.1417572, 0.2249483, -1.858479, 0, 1, 0.572549, 1,
-0.1357, 1.338964, 0.22394, 0, 1, 0.5803922, 1,
-0.1344845, -0.6118297, -3.124649, 0, 1, 0.5843138, 1,
-0.1326997, 0.841337, 0.5019631, 0, 1, 0.5921569, 1,
-0.1240239, 1.039119, 1.840412, 0, 1, 0.5960785, 1,
-0.1164727, 0.5970261, -0.9504706, 0, 1, 0.6039216, 1,
-0.1140309, 1.397933, 1.403292, 0, 1, 0.6117647, 1,
-0.112248, -0.5577921, -3.459996, 0, 1, 0.6156863, 1,
-0.1111283, -1.359462, -2.432874, 0, 1, 0.6235294, 1,
-0.1101239, 0.5559328, -1.099175, 0, 1, 0.627451, 1,
-0.1062433, -1.305945, -3.142055, 0, 1, 0.6352941, 1,
-0.1011377, 0.05948271, -1.707272, 0, 1, 0.6392157, 1,
-0.1005678, 1.103272, -0.5403988, 0, 1, 0.6470588, 1,
-0.09968709, -1.50634, -4.149904, 0, 1, 0.6509804, 1,
-0.09842172, -0.8653412, -3.151481, 0, 1, 0.6588235, 1,
-0.09782632, -1.844549, -4.54254, 0, 1, 0.6627451, 1,
-0.09691003, 0.0211819, -2.596926, 0, 1, 0.6705883, 1,
-0.09400236, 0.4252398, 0.197112, 0, 1, 0.6745098, 1,
-0.09042845, -0.05442347, -2.316521, 0, 1, 0.682353, 1,
-0.08693957, -0.6488468, -0.1760175, 0, 1, 0.6862745, 1,
-0.07884074, 0.1870353, -1.524822, 0, 1, 0.6941177, 1,
-0.07714725, 1.346354, -1.034906, 0, 1, 0.7019608, 1,
-0.0728685, -0.1559191, -1.690047, 0, 1, 0.7058824, 1,
-0.07182413, -0.6362958, -3.464349, 0, 1, 0.7137255, 1,
-0.07085533, -0.3457859, -2.344621, 0, 1, 0.7176471, 1,
-0.06342734, 0.2745866, -0.6748446, 0, 1, 0.7254902, 1,
-0.06238773, 0.1638124, -1.375543, 0, 1, 0.7294118, 1,
-0.05297881, -0.2756065, -2.060177, 0, 1, 0.7372549, 1,
-0.05182952, -0.7986623, -0.719986, 0, 1, 0.7411765, 1,
-0.04609029, 0.07121474, -1.628147, 0, 1, 0.7490196, 1,
-0.04344362, 0.440851, 1.210086, 0, 1, 0.7529412, 1,
-0.03970328, -1.109001, -1.551516, 0, 1, 0.7607843, 1,
-0.0393182, -0.3133759, -1.901319, 0, 1, 0.7647059, 1,
-0.03706981, 0.4996341, 2.307129, 0, 1, 0.772549, 1,
-0.03379176, 0.2553777, -0.1324738, 0, 1, 0.7764706, 1,
-0.03346383, -1.070758, -1.82904, 0, 1, 0.7843137, 1,
-0.03301515, -0.298112, -2.018339, 0, 1, 0.7882353, 1,
-0.03020058, 2.242966, 0.1455757, 0, 1, 0.7960784, 1,
-0.02649468, -0.03804801, -4.829757, 0, 1, 0.8039216, 1,
-0.02640661, 0.427514, -1.124819, 0, 1, 0.8078431, 1,
-0.02364383, -1.080083, -3.835186, 0, 1, 0.8156863, 1,
-0.01838841, 0.1774866, 0.03328295, 0, 1, 0.8196079, 1,
-0.01734591, 0.6775325, 0.9009785, 0, 1, 0.827451, 1,
-0.01400802, 0.9469903, -0.8732804, 0, 1, 0.8313726, 1,
-0.01149412, 0.6598399, 0.8136196, 0, 1, 0.8392157, 1,
-0.006768453, -0.381138, -2.851497, 0, 1, 0.8431373, 1,
-0.006279482, -0.06960762, -2.311407, 0, 1, 0.8509804, 1,
-0.002424375, 0.2552479, 0.8417584, 0, 1, 0.854902, 1,
-0.0003537111, 0.6452096, -1.77702, 0, 1, 0.8627451, 1,
0.004659355, -1.809818, 5.230726, 0, 1, 0.8666667, 1,
0.007864969, -0.4347818, 1.290623, 0, 1, 0.8745098, 1,
0.01346529, 0.2167558, -1.680063, 0, 1, 0.8784314, 1,
0.01517851, 1.702198, -1.021536, 0, 1, 0.8862745, 1,
0.01584527, -0.357898, 3.323384, 0, 1, 0.8901961, 1,
0.01727874, 0.6006401, 0.8221188, 0, 1, 0.8980392, 1,
0.02356196, 0.4240605, 1.7088, 0, 1, 0.9058824, 1,
0.02941821, 1.394665, 1.218053, 0, 1, 0.9098039, 1,
0.02993682, -0.4799611, 3.106326, 0, 1, 0.9176471, 1,
0.03216575, -1.354693, 3.181471, 0, 1, 0.9215686, 1,
0.0342531, -3.120686, 3.256829, 0, 1, 0.9294118, 1,
0.03576997, 1.799849, 0.03105798, 0, 1, 0.9333333, 1,
0.03693961, -2.402564, 1.365637, 0, 1, 0.9411765, 1,
0.04156446, -1.179042, 5.14226, 0, 1, 0.945098, 1,
0.04548892, -2.145172, 3.335369, 0, 1, 0.9529412, 1,
0.04821509, -1.966473, 2.61954, 0, 1, 0.9568627, 1,
0.04891048, 0.164336, -0.4212968, 0, 1, 0.9647059, 1,
0.05035195, 1.482454, 0.4942226, 0, 1, 0.9686275, 1,
0.0506587, -0.5764485, 4.639781, 0, 1, 0.9764706, 1,
0.05181833, -1.111688, 1.557886, 0, 1, 0.9803922, 1,
0.05262946, -0.2151673, 4.67507, 0, 1, 0.9882353, 1,
0.05357646, 0.1810824, 1.463815, 0, 1, 0.9921569, 1,
0.05374853, 0.4092354, 0.6540076, 0, 1, 1, 1,
0.05383158, -1.011237, 1.764981, 0, 0.9921569, 1, 1,
0.05437104, 0.2372031, 0.8519123, 0, 0.9882353, 1, 1,
0.05475532, 2.407092, 1.689795, 0, 0.9803922, 1, 1,
0.05510452, 0.1538028, 2.388244, 0, 0.9764706, 1, 1,
0.06577985, 1.763052, 0.4154498, 0, 0.9686275, 1, 1,
0.07037685, 0.1771019, -0.9551707, 0, 0.9647059, 1, 1,
0.0770181, -0.2062398, 0.8845251, 0, 0.9568627, 1, 1,
0.07752646, 0.1736369, -0.2450622, 0, 0.9529412, 1, 1,
0.07912353, -0.2825728, 3.980738, 0, 0.945098, 1, 1,
0.08026151, 1.289187, -0.9598538, 0, 0.9411765, 1, 1,
0.08323146, -0.8757858, 2.59291, 0, 0.9333333, 1, 1,
0.08503283, 0.4922607, 0.5147061, 0, 0.9294118, 1, 1,
0.08626968, 0.6497061, 1.548332, 0, 0.9215686, 1, 1,
0.08630141, -0.56278, 3.467772, 0, 0.9176471, 1, 1,
0.08678693, 1.533041, 1.363362, 0, 0.9098039, 1, 1,
0.08849854, 0.1517418, -0.0454522, 0, 0.9058824, 1, 1,
0.0887135, 0.2052247, -0.6587042, 0, 0.8980392, 1, 1,
0.09453319, -0.3725047, 1.243349, 0, 0.8901961, 1, 1,
0.09734296, 0.0005798404, 1.652999, 0, 0.8862745, 1, 1,
0.09821833, 1.200021, -0.1703766, 0, 0.8784314, 1, 1,
0.1009466, 0.4399352, 1.081365, 0, 0.8745098, 1, 1,
0.1020555, -1.364742, 2.717756, 0, 0.8666667, 1, 1,
0.1089469, -0.6132128, 2.579975, 0, 0.8627451, 1, 1,
0.1104133, -0.2166806, 1.07539, 0, 0.854902, 1, 1,
0.1112973, 0.03450561, 0.6742007, 0, 0.8509804, 1, 1,
0.1147569, -0.9705069, 2.115104, 0, 0.8431373, 1, 1,
0.1152439, -0.6321658, 3.92479, 0, 0.8392157, 1, 1,
0.1167547, -0.9525941, 3.444018, 0, 0.8313726, 1, 1,
0.1206333, 0.141161, 0.8444943, 0, 0.827451, 1, 1,
0.1231435, -0.3243516, 3.817449, 0, 0.8196079, 1, 1,
0.1294204, 0.5161071, 1.556885, 0, 0.8156863, 1, 1,
0.1300474, -1.190649, 1.64535, 0, 0.8078431, 1, 1,
0.1314033, 1.065489, 1.333644, 0, 0.8039216, 1, 1,
0.1315675, 2.320079, -0.4765142, 0, 0.7960784, 1, 1,
0.1320234, 0.3721602, 1.257197, 0, 0.7882353, 1, 1,
0.1376925, -0.3917557, 3.661722, 0, 0.7843137, 1, 1,
0.1436473, 0.1005683, -0.927704, 0, 0.7764706, 1, 1,
0.1441962, 0.4504208, 1.420399, 0, 0.772549, 1, 1,
0.1463662, -0.648069, 1.876378, 0, 0.7647059, 1, 1,
0.1469889, -0.4788502, 2.030208, 0, 0.7607843, 1, 1,
0.1533433, -0.3957275, 1.559903, 0, 0.7529412, 1, 1,
0.154131, -2.361231, 3.181634, 0, 0.7490196, 1, 1,
0.1551363, 0.4408965, 1.519403, 0, 0.7411765, 1, 1,
0.1569493, -0.6401637, 2.401755, 0, 0.7372549, 1, 1,
0.1582607, -0.3706979, 1.826979, 0, 0.7294118, 1, 1,
0.1593762, 0.6255116, -0.3262739, 0, 0.7254902, 1, 1,
0.1609367, 1.10067, -0.09990898, 0, 0.7176471, 1, 1,
0.1612023, -0.8603953, 2.125213, 0, 0.7137255, 1, 1,
0.1613978, 0.05107002, 1.261401, 0, 0.7058824, 1, 1,
0.1642229, -0.3269125, 3.302464, 0, 0.6980392, 1, 1,
0.1650356, 1.249896, 1.689666, 0, 0.6941177, 1, 1,
0.1657233, 0.2085921, 3.187011, 0, 0.6862745, 1, 1,
0.1660114, 0.9455839, 0.5847381, 0, 0.682353, 1, 1,
0.1670314, -0.828546, 3.28814, 0, 0.6745098, 1, 1,
0.1682734, -0.8024411, 4.367787, 0, 0.6705883, 1, 1,
0.1710425, 1.141301, -0.9396331, 0, 0.6627451, 1, 1,
0.1779828, -0.6488605, 4.658072, 0, 0.6588235, 1, 1,
0.182407, 0.1612232, 0.5968187, 0, 0.6509804, 1, 1,
0.1842126, -0.1964843, 3.385491, 0, 0.6470588, 1, 1,
0.1849246, -0.0270644, 1.66249, 0, 0.6392157, 1, 1,
0.1870085, -0.6288562, 2.432574, 0, 0.6352941, 1, 1,
0.1871654, -1.297936, 2.948176, 0, 0.627451, 1, 1,
0.199196, 0.7587506, 0.1202101, 0, 0.6235294, 1, 1,
0.203671, 0.1858563, 1.217219, 0, 0.6156863, 1, 1,
0.2038638, -0.4985987, 2.867391, 0, 0.6117647, 1, 1,
0.2059322, 0.306662, -0.1702925, 0, 0.6039216, 1, 1,
0.2070336, -1.026734, 2.991441, 0, 0.5960785, 1, 1,
0.2091179, -0.5091899, 2.174263, 0, 0.5921569, 1, 1,
0.2092602, 0.8401282, -0.7091044, 0, 0.5843138, 1, 1,
0.2100475, 0.8625886, 1.323426, 0, 0.5803922, 1, 1,
0.2136132, -0.1334048, 2.957443, 0, 0.572549, 1, 1,
0.2153307, -0.6842909, 2.358025, 0, 0.5686275, 1, 1,
0.2218958, 1.763127, 0.4552444, 0, 0.5607843, 1, 1,
0.2219081, -0.4295692, 3.713755, 0, 0.5568628, 1, 1,
0.2223014, -0.58094, 1.78062, 0, 0.5490196, 1, 1,
0.2251814, 0.6895077, 1.355814, 0, 0.5450981, 1, 1,
0.2279505, -2.213626, 3.733883, 0, 0.5372549, 1, 1,
0.232472, 1.89074, 1.93652, 0, 0.5333334, 1, 1,
0.2339607, 0.2779827, 0.1195101, 0, 0.5254902, 1, 1,
0.241178, -0.558594, 2.866481, 0, 0.5215687, 1, 1,
0.2480608, -0.2632442, 2.930391, 0, 0.5137255, 1, 1,
0.253365, -0.09603996, 1.495061, 0, 0.509804, 1, 1,
0.2536556, -0.2157333, 2.194572, 0, 0.5019608, 1, 1,
0.2538375, 0.4138786, -0.3071923, 0, 0.4941176, 1, 1,
0.2539973, -1.056054, 1.777161, 0, 0.4901961, 1, 1,
0.2608269, -0.983558, 3.410189, 0, 0.4823529, 1, 1,
0.2615622, -1.264423, 3.096382, 0, 0.4784314, 1, 1,
0.2644031, 0.4596877, 0.02274046, 0, 0.4705882, 1, 1,
0.2654177, 1.349983, 0.07816336, 0, 0.4666667, 1, 1,
0.2658718, 1.638746, 0.3390397, 0, 0.4588235, 1, 1,
0.2670487, -1.148832, 2.261403, 0, 0.454902, 1, 1,
0.2729055, 0.04761053, 2.177604, 0, 0.4470588, 1, 1,
0.2729307, 2.083747, 1.996669, 0, 0.4431373, 1, 1,
0.2759256, 0.8510652, 0.5417152, 0, 0.4352941, 1, 1,
0.2781384, 0.1707468, 0.7920784, 0, 0.4313726, 1, 1,
0.280374, -0.3159891, 3.405588, 0, 0.4235294, 1, 1,
0.2804737, -0.1073375, 3.782319, 0, 0.4196078, 1, 1,
0.2828321, -0.9292131, 3.572497, 0, 0.4117647, 1, 1,
0.2849477, 1.322911, 1.173766, 0, 0.4078431, 1, 1,
0.2878871, 0.5014052, 1.213705, 0, 0.4, 1, 1,
0.2902643, -1.941759, 2.770845, 0, 0.3921569, 1, 1,
0.2906429, -0.3333289, 2.530185, 0, 0.3882353, 1, 1,
0.2967063, -0.6431749, 2.966122, 0, 0.3803922, 1, 1,
0.2973224, -0.6148039, 3.546791, 0, 0.3764706, 1, 1,
0.2993217, 0.3562433, 1.337982, 0, 0.3686275, 1, 1,
0.3022144, 0.4356655, 2.124245, 0, 0.3647059, 1, 1,
0.3044093, 1.698363, -0.9993349, 0, 0.3568628, 1, 1,
0.3087536, 0.2886444, -1.931929, 0, 0.3529412, 1, 1,
0.3095079, -0.9977531, 2.500985, 0, 0.345098, 1, 1,
0.3200538, -1.073549, 1.560282, 0, 0.3411765, 1, 1,
0.3238462, -0.1636155, 2.778498, 0, 0.3333333, 1, 1,
0.330667, 1.500969, -0.1846911, 0, 0.3294118, 1, 1,
0.3322329, 0.4842384, 0.5918801, 0, 0.3215686, 1, 1,
0.3366616, 0.2240896, 1.665982, 0, 0.3176471, 1, 1,
0.3395944, -0.5231071, 1.792214, 0, 0.3098039, 1, 1,
0.3398945, -0.02106597, 0.3312079, 0, 0.3058824, 1, 1,
0.3433365, -0.2375567, 2.318378, 0, 0.2980392, 1, 1,
0.3523839, 0.7692076, 0.6440615, 0, 0.2901961, 1, 1,
0.3546469, -0.09763308, 0.5395899, 0, 0.2862745, 1, 1,
0.3573727, -0.8011119, 2.155789, 0, 0.2784314, 1, 1,
0.3613647, -0.2868092, 1.956706, 0, 0.2745098, 1, 1,
0.3617744, -1.074211, 4.19546, 0, 0.2666667, 1, 1,
0.3639627, -0.2985302, 3.422744, 0, 0.2627451, 1, 1,
0.3642712, 0.8686814, 0.6560813, 0, 0.254902, 1, 1,
0.3711052, 0.8539446, 1.335927, 0, 0.2509804, 1, 1,
0.3765669, -2.597554, 1.374331, 0, 0.2431373, 1, 1,
0.3774373, 0.392661, 1.59683, 0, 0.2392157, 1, 1,
0.380446, 1.052746, 0.2892686, 0, 0.2313726, 1, 1,
0.3833309, -0.1735009, 1.897509, 0, 0.227451, 1, 1,
0.3854389, 0.3485011, 1.811242, 0, 0.2196078, 1, 1,
0.393197, 0.3495073, 3.146104, 0, 0.2156863, 1, 1,
0.3960953, -1.472114, 2.607451, 0, 0.2078431, 1, 1,
0.4000832, 0.1175045, 1.587658, 0, 0.2039216, 1, 1,
0.4006004, 1.743921, 0.3535146, 0, 0.1960784, 1, 1,
0.4011961, -0.2957361, 3.707164, 0, 0.1882353, 1, 1,
0.4060553, -0.55509, 1.968692, 0, 0.1843137, 1, 1,
0.4070945, 2.394368, -0.11521, 0, 0.1764706, 1, 1,
0.4076598, -0.600974, 3.710574, 0, 0.172549, 1, 1,
0.4089565, 1.025553, -2.002948, 0, 0.1647059, 1, 1,
0.4108074, 1.468954, -0.3086599, 0, 0.1607843, 1, 1,
0.4167209, -0.7409305, 2.865469, 0, 0.1529412, 1, 1,
0.419843, 1.755576, -0.4788909, 0, 0.1490196, 1, 1,
0.4199785, -0.2955348, 1.048673, 0, 0.1411765, 1, 1,
0.4216216, 0.3571432, 0.8341274, 0, 0.1372549, 1, 1,
0.4326934, -0.5507197, 2.764498, 0, 0.1294118, 1, 1,
0.4431553, -0.279625, 0.7131603, 0, 0.1254902, 1, 1,
0.4463044, 0.3026591, 1.477259, 0, 0.1176471, 1, 1,
0.4498639, 0.711112, 2.121313, 0, 0.1137255, 1, 1,
0.4513918, 0.690106, 1.170395, 0, 0.1058824, 1, 1,
0.452829, 0.8269247, 1.462067, 0, 0.09803922, 1, 1,
0.4541683, 0.2013642, 2.065418, 0, 0.09411765, 1, 1,
0.4562338, -1.234139, 3.436092, 0, 0.08627451, 1, 1,
0.4579816, -0.03735868, 2.219805, 0, 0.08235294, 1, 1,
0.4581966, -0.2706737, 2.238292, 0, 0.07450981, 1, 1,
0.4618824, -1.272779, 2.147803, 0, 0.07058824, 1, 1,
0.4621226, -0.410399, 2.610393, 0, 0.0627451, 1, 1,
0.4635705, 1.365147, -0.08085909, 0, 0.05882353, 1, 1,
0.4656053, -0.4816139, 2.772178, 0, 0.05098039, 1, 1,
0.4687052, 0.2139047, -0.4989721, 0, 0.04705882, 1, 1,
0.4700406, 1.0538, 0.9033871, 0, 0.03921569, 1, 1,
0.4768926, -0.2371732, 3.945823, 0, 0.03529412, 1, 1,
0.480538, 0.4750921, 1.016019, 0, 0.02745098, 1, 1,
0.4838619, 0.4704295, 0.3213864, 0, 0.02352941, 1, 1,
0.4847185, 1.816053, 1.142156, 0, 0.01568628, 1, 1,
0.4874698, 0.02401486, -0.3298931, 0, 0.01176471, 1, 1,
0.4903232, -1.157933, 2.685893, 0, 0.003921569, 1, 1,
0.4922985, 1.528217, 1.247951, 0.003921569, 0, 1, 1,
0.4947271, 0.1085618, 0.4576593, 0.007843138, 0, 1, 1,
0.5137955, 0.7323667, 1.2497, 0.01568628, 0, 1, 1,
0.5317787, 0.7717373, -0.4431921, 0.01960784, 0, 1, 1,
0.5323365, -1.12488, 2.609125, 0.02745098, 0, 1, 1,
0.5330108, -2.083229, 2.733589, 0.03137255, 0, 1, 1,
0.5350986, 1.947735, -0.4354179, 0.03921569, 0, 1, 1,
0.5395262, 0.1791354, 0.2897692, 0.04313726, 0, 1, 1,
0.5432319, -0.3594805, 3.027517, 0.05098039, 0, 1, 1,
0.5436439, -0.2649793, 4.46686, 0.05490196, 0, 1, 1,
0.5437403, 0.6627058, -0.6170886, 0.0627451, 0, 1, 1,
0.5490709, -1.976547, 4.802014, 0.06666667, 0, 1, 1,
0.5584559, 0.1923326, 0.1064141, 0.07450981, 0, 1, 1,
0.5588284, -0.5183887, 2.98567, 0.07843138, 0, 1, 1,
0.5590397, -0.2192708, 3.118222, 0.08627451, 0, 1, 1,
0.559764, 0.01718799, 1.811106, 0.09019608, 0, 1, 1,
0.5612803, -0.8583543, 2.361214, 0.09803922, 0, 1, 1,
0.5632712, -0.07250083, 1.989062, 0.1058824, 0, 1, 1,
0.5782201, 0.02017039, 2.152562, 0.1098039, 0, 1, 1,
0.579464, 0.9572113, 1.551319, 0.1176471, 0, 1, 1,
0.5816221, 1.27686, 1.257407, 0.1215686, 0, 1, 1,
0.5847686, -0.4807757, 2.165869, 0.1294118, 0, 1, 1,
0.5858139, 0.3962663, 1.132112, 0.1333333, 0, 1, 1,
0.5919526, -0.5919727, 2.164193, 0.1411765, 0, 1, 1,
0.6029927, -0.3234558, -0.08158047, 0.145098, 0, 1, 1,
0.6045227, -1.881901, 3.955967, 0.1529412, 0, 1, 1,
0.6057873, 0.2460199, 2.55387, 0.1568628, 0, 1, 1,
0.6065504, -0.2924489, 3.430409, 0.1647059, 0, 1, 1,
0.6075886, -0.7456905, 1.303481, 0.1686275, 0, 1, 1,
0.6119053, -1.514827, 3.906145, 0.1764706, 0, 1, 1,
0.6132252, 0.6091875, 1.074973, 0.1803922, 0, 1, 1,
0.6159517, -0.4120094, 2.132854, 0.1882353, 0, 1, 1,
0.6215386, 0.08106165, -0.6320041, 0.1921569, 0, 1, 1,
0.6219192, 0.3448313, 1.602363, 0.2, 0, 1, 1,
0.6225227, 0.05640833, 2.962864, 0.2078431, 0, 1, 1,
0.6246063, -1.091026, 2.303504, 0.2117647, 0, 1, 1,
0.6250489, 1.143607, 0.00947244, 0.2196078, 0, 1, 1,
0.6262082, 0.548035, 0.1302058, 0.2235294, 0, 1, 1,
0.626728, -0.1134062, 2.838152, 0.2313726, 0, 1, 1,
0.6289491, -0.02323149, 1.927427, 0.2352941, 0, 1, 1,
0.6311117, 1.508178, 0.2394994, 0.2431373, 0, 1, 1,
0.6332561, 1.211485, 0.8454009, 0.2470588, 0, 1, 1,
0.6358644, 2.260613, -0.1637007, 0.254902, 0, 1, 1,
0.6366043, -0.5559125, 1.392079, 0.2588235, 0, 1, 1,
0.6417831, -1.738793, 2.611039, 0.2666667, 0, 1, 1,
0.6425079, -0.4896027, 2.075361, 0.2705882, 0, 1, 1,
0.643732, 0.4902987, 1.685506, 0.2784314, 0, 1, 1,
0.6448022, -0.499855, 0.6608506, 0.282353, 0, 1, 1,
0.6462844, 0.08306906, 2.437302, 0.2901961, 0, 1, 1,
0.6463627, 0.9806516, 1.683245, 0.2941177, 0, 1, 1,
0.6473722, -0.2052338, 0.6143913, 0.3019608, 0, 1, 1,
0.6481132, 0.3183679, 2.368017, 0.3098039, 0, 1, 1,
0.6557053, 0.1541564, 1.918017, 0.3137255, 0, 1, 1,
0.6558136, 0.2264255, 2.097657, 0.3215686, 0, 1, 1,
0.6559111, 0.62067, 1.892089, 0.3254902, 0, 1, 1,
0.6570404, -0.1231419, 1.127084, 0.3333333, 0, 1, 1,
0.6648312, 0.4000084, 1.070857, 0.3372549, 0, 1, 1,
0.6730652, -0.2236117, 0.9473932, 0.345098, 0, 1, 1,
0.675342, -0.591807, 1.554793, 0.3490196, 0, 1, 1,
0.6787351, -0.7787311, 3.43716, 0.3568628, 0, 1, 1,
0.6795628, 1.650752, 1.806378, 0.3607843, 0, 1, 1,
0.6809208, -0.5624317, 1.917387, 0.3686275, 0, 1, 1,
0.6820915, -0.899246, 5.232279, 0.372549, 0, 1, 1,
0.6823693, 0.8360392, -1.111698, 0.3803922, 0, 1, 1,
0.6823926, -1.073823, 1.429062, 0.3843137, 0, 1, 1,
0.6859114, 0.008146896, 2.452344, 0.3921569, 0, 1, 1,
0.6864213, 1.279417, 0.3148773, 0.3960784, 0, 1, 1,
0.6897304, 0.3853066, 1.11093, 0.4039216, 0, 1, 1,
0.6929989, -0.5222404, 1.783985, 0.4117647, 0, 1, 1,
0.7050253, 0.4334511, 2.418057, 0.4156863, 0, 1, 1,
0.7127607, -0.7405154, 2.596976, 0.4235294, 0, 1, 1,
0.7171323, -1.218774, 1.795107, 0.427451, 0, 1, 1,
0.7223939, -0.2464973, 2.913811, 0.4352941, 0, 1, 1,
0.7326505, 0.01999012, -0.4676602, 0.4392157, 0, 1, 1,
0.736092, -0.1793449, 1.430885, 0.4470588, 0, 1, 1,
0.7364596, 0.07972615, 1.40337, 0.4509804, 0, 1, 1,
0.7370583, -0.8436787, 1.116994, 0.4588235, 0, 1, 1,
0.739476, 0.4070102, 0.3064126, 0.4627451, 0, 1, 1,
0.7413517, -0.4530073, 0.6685885, 0.4705882, 0, 1, 1,
0.7413658, 0.5209944, 1.805853, 0.4745098, 0, 1, 1,
0.7431918, -0.9760599, 4.339511, 0.4823529, 0, 1, 1,
0.751538, -0.2636242, 0.2694369, 0.4862745, 0, 1, 1,
0.7555915, 1.17535, 0.4894693, 0.4941176, 0, 1, 1,
0.7560021, 1.122462, 0.7284033, 0.5019608, 0, 1, 1,
0.756366, 0.8556076, 1.299472, 0.5058824, 0, 1, 1,
0.7645528, -0.4664242, 3.131212, 0.5137255, 0, 1, 1,
0.7646565, -0.9647216, 3.422826, 0.5176471, 0, 1, 1,
0.7685429, -1.062658, 3.396434, 0.5254902, 0, 1, 1,
0.7704987, 0.6068463, 0.2957197, 0.5294118, 0, 1, 1,
0.7722586, -0.281008, 1.058797, 0.5372549, 0, 1, 1,
0.7740299, 0.8019946, 0.6478565, 0.5411765, 0, 1, 1,
0.7766114, -0.9617927, 2.892484, 0.5490196, 0, 1, 1,
0.7771295, 1.131884, 0.2909021, 0.5529412, 0, 1, 1,
0.7840265, -0.2395058, 1.726203, 0.5607843, 0, 1, 1,
0.7842848, 0.8965812, 1.647543, 0.5647059, 0, 1, 1,
0.7866809, -0.9860436, 3.1314, 0.572549, 0, 1, 1,
0.7932633, 0.4131394, 1.913917, 0.5764706, 0, 1, 1,
0.7989247, -1.693367, 1.283674, 0.5843138, 0, 1, 1,
0.8056591, -1.181718, 0.2580474, 0.5882353, 0, 1, 1,
0.8091229, 0.1327863, 3.708252, 0.5960785, 0, 1, 1,
0.8098214, 0.4166571, 1.031209, 0.6039216, 0, 1, 1,
0.8146123, 0.7793107, 0.4732358, 0.6078432, 0, 1, 1,
0.8153774, 1.752027, 0.3623387, 0.6156863, 0, 1, 1,
0.8157133, 0.1262522, 2.477401, 0.6196079, 0, 1, 1,
0.8159261, 0.4029824, -0.2505475, 0.627451, 0, 1, 1,
0.8167972, 0.8345265, 1.841101, 0.6313726, 0, 1, 1,
0.818299, 0.8604196, 0.9972371, 0.6392157, 0, 1, 1,
0.8189614, -0.3092885, 2.636867, 0.6431373, 0, 1, 1,
0.8211235, 0.4954313, 0.8647171, 0.6509804, 0, 1, 1,
0.8212275, -1.174378, 3.227338, 0.654902, 0, 1, 1,
0.8224073, 0.4416352, 0.5876796, 0.6627451, 0, 1, 1,
0.8227789, 0.7768857, -1.50283, 0.6666667, 0, 1, 1,
0.8237138, 0.2070693, 1.189307, 0.6745098, 0, 1, 1,
0.8267782, -0.3584365, 1.173756, 0.6784314, 0, 1, 1,
0.8288482, 0.02557235, 0.3541435, 0.6862745, 0, 1, 1,
0.8363118, -0.4142213, 0.9976637, 0.6901961, 0, 1, 1,
0.840392, 2.102503, -1.825189, 0.6980392, 0, 1, 1,
0.8425137, 0.5257135, 0.1717467, 0.7058824, 0, 1, 1,
0.8437018, -0.03370713, 2.014452, 0.7098039, 0, 1, 1,
0.8458381, 1.714728, 0.6678262, 0.7176471, 0, 1, 1,
0.8550571, -0.8800681, -0.1685752, 0.7215686, 0, 1, 1,
0.8559376, 0.5393735, 0.6164647, 0.7294118, 0, 1, 1,
0.8561296, -0.7256843, 2.194459, 0.7333333, 0, 1, 1,
0.8625584, 0.1808342, 1.92664, 0.7411765, 0, 1, 1,
0.8669715, -0.5369583, 2.572724, 0.7450981, 0, 1, 1,
0.8697991, -0.2207778, 1.889509, 0.7529412, 0, 1, 1,
0.871846, 0.07579405, 2.287971, 0.7568628, 0, 1, 1,
0.8827448, -1.455522, 1.227789, 0.7647059, 0, 1, 1,
0.896668, -0.2914497, 1.212998, 0.7686275, 0, 1, 1,
0.8974918, 0.1204462, -0.5426078, 0.7764706, 0, 1, 1,
0.8982378, 0.05640088, 2.807172, 0.7803922, 0, 1, 1,
0.8991816, 0.5691031, -0.7774833, 0.7882353, 0, 1, 1,
0.9016412, 0.09607261, 2.177846, 0.7921569, 0, 1, 1,
0.9059188, 1.025492, 0.8292666, 0.8, 0, 1, 1,
0.9072142, -1.160818, 3.68062, 0.8078431, 0, 1, 1,
0.9091657, 0.3712474, 0.6906636, 0.8117647, 0, 1, 1,
0.9093203, 2.187569, -0.6890957, 0.8196079, 0, 1, 1,
0.9113836, -0.05680848, 1.09963, 0.8235294, 0, 1, 1,
0.9118139, -0.7048227, 1.783144, 0.8313726, 0, 1, 1,
0.913656, 1.390281, 0.733401, 0.8352941, 0, 1, 1,
0.9209501, 0.4562858, 0.8214569, 0.8431373, 0, 1, 1,
0.9219301, 0.5481933, -0.01208205, 0.8470588, 0, 1, 1,
0.9288771, -0.4182759, 1.299156, 0.854902, 0, 1, 1,
0.9357865, 0.106137, 1.686145, 0.8588235, 0, 1, 1,
0.9405016, 1.315066, -0.5042323, 0.8666667, 0, 1, 1,
0.9438128, 0.7793873, 0.818526, 0.8705882, 0, 1, 1,
0.9463035, 0.8944827, -0.0688179, 0.8784314, 0, 1, 1,
0.9494143, 0.1815127, 1.278608, 0.8823529, 0, 1, 1,
0.9504581, 1.33018, 0.5429095, 0.8901961, 0, 1, 1,
0.952051, 0.9446904, 1.71042, 0.8941177, 0, 1, 1,
0.9537079, -1.844521, 2.993605, 0.9019608, 0, 1, 1,
0.9578218, -0.9684584, 2.284382, 0.9098039, 0, 1, 1,
0.9620213, -1.981264, 3.798054, 0.9137255, 0, 1, 1,
0.9639924, -1.292783, 5.542102, 0.9215686, 0, 1, 1,
0.9687204, -0.2552843, 1.164619, 0.9254902, 0, 1, 1,
0.9756794, -0.3238668, 1.443644, 0.9333333, 0, 1, 1,
0.9793163, 1.07333, 1.418128, 0.9372549, 0, 1, 1,
0.9817582, 0.6408108, 1.732746, 0.945098, 0, 1, 1,
0.9835607, -1.014954, 2.332262, 0.9490196, 0, 1, 1,
0.9849741, -0.3965717, 0.262401, 0.9568627, 0, 1, 1,
0.9856234, 1.384945, 0.4835504, 0.9607843, 0, 1, 1,
0.9857079, 1.342224, -0.5387129, 0.9686275, 0, 1, 1,
0.9893903, -0.4288537, 2.60504, 0.972549, 0, 1, 1,
0.9949754, 1.921799, 0.1312682, 0.9803922, 0, 1, 1,
0.9955158, -0.4374319, 1.109903, 0.9843137, 0, 1, 1,
1.005528, 0.7568529, 1.52616, 0.9921569, 0, 1, 1,
1.006264, 1.111117, 1.789115, 0.9960784, 0, 1, 1,
1.007356, -0.379956, 3.053195, 1, 0, 0.9960784, 1,
1.010231, -1.107025, 2.790104, 1, 0, 0.9882353, 1,
1.015241, 0.4785461, 0.3354381, 1, 0, 0.9843137, 1,
1.01806, -0.9593508, 1.699335, 1, 0, 0.9764706, 1,
1.019809, 2.790316, -0.8667418, 1, 0, 0.972549, 1,
1.022461, -1.986448, 4.939662, 1, 0, 0.9647059, 1,
1.028351, -0.1024705, 1.992338, 1, 0, 0.9607843, 1,
1.032078, -1.073521, 1.890151, 1, 0, 0.9529412, 1,
1.032941, 0.3490601, 1.121502, 1, 0, 0.9490196, 1,
1.033149, -1.064367, 2.593376, 1, 0, 0.9411765, 1,
1.039773, -0.3134547, 1.466043, 1, 0, 0.9372549, 1,
1.052894, 0.4746743, 1.768212, 1, 0, 0.9294118, 1,
1.054014, 0.1034247, 2.363101, 1, 0, 0.9254902, 1,
1.058444, -1.382146, 2.029221, 1, 0, 0.9176471, 1,
1.058797, 1.54148, 0.2934346, 1, 0, 0.9137255, 1,
1.071459, -1.230572, 1.184857, 1, 0, 0.9058824, 1,
1.076067, -0.2397579, 1.139264, 1, 0, 0.9019608, 1,
1.077088, 0.6019044, 0.9531798, 1, 0, 0.8941177, 1,
1.078819, 1.254783, -0.5892376, 1, 0, 0.8862745, 1,
1.084123, -1.575939, 2.732583, 1, 0, 0.8823529, 1,
1.084614, 2.287432, -0.4059996, 1, 0, 0.8745098, 1,
1.088247, -1.339563, 3.555118, 1, 0, 0.8705882, 1,
1.088462, -0.8538409, 2.037389, 1, 0, 0.8627451, 1,
1.091977, 1.124903, -0.225624, 1, 0, 0.8588235, 1,
1.093356, -0.6640638, 3.447825, 1, 0, 0.8509804, 1,
1.093901, -0.3496678, 0.452525, 1, 0, 0.8470588, 1,
1.094216, -1.04798, 1.255139, 1, 0, 0.8392157, 1,
1.105388, 0.5255055, -0.7922149, 1, 0, 0.8352941, 1,
1.113492, -0.7448293, 1.681174, 1, 0, 0.827451, 1,
1.114644, 1.713628, -0.8685722, 1, 0, 0.8235294, 1,
1.116989, -1.699681, 4.131559, 1, 0, 0.8156863, 1,
1.117618, 0.3898339, 1.396704, 1, 0, 0.8117647, 1,
1.123534, -1.036797, 1.04262, 1, 0, 0.8039216, 1,
1.125702, -0.4947745, 3.137175, 1, 0, 0.7960784, 1,
1.125932, -0.4507088, 2.653498, 1, 0, 0.7921569, 1,
1.128364, -0.4488192, 1.858441, 1, 0, 0.7843137, 1,
1.144871, 0.1185433, 2.660719, 1, 0, 0.7803922, 1,
1.146708, 0.9926654, 2.882434, 1, 0, 0.772549, 1,
1.157642, 1.429124, 0.7074517, 1, 0, 0.7686275, 1,
1.160618, -1.196671, 2.112348, 1, 0, 0.7607843, 1,
1.161737, -0.6324629, 0.04508068, 1, 0, 0.7568628, 1,
1.163939, 0.3695368, 2.220979, 1, 0, 0.7490196, 1,
1.16425, -0.06461474, 2.584567, 1, 0, 0.7450981, 1,
1.171509, 0.3292572, 1.012693, 1, 0, 0.7372549, 1,
1.176316, -0.7117607, 1.702436, 1, 0, 0.7333333, 1,
1.191243, -0.7470781, 2.008713, 1, 0, 0.7254902, 1,
1.197019, -0.5257197, 2.190953, 1, 0, 0.7215686, 1,
1.202214, 0.1852532, 1.694995, 1, 0, 0.7137255, 1,
1.208029, 0.06492604, 1.443862, 1, 0, 0.7098039, 1,
1.212062, 1.148429, 0.7013296, 1, 0, 0.7019608, 1,
1.213223, 0.9266233, -0.1583015, 1, 0, 0.6941177, 1,
1.21646, 0.08051987, 1.43564, 1, 0, 0.6901961, 1,
1.219584, 0.3895535, 2.855947, 1, 0, 0.682353, 1,
1.224159, 1.130557, -0.8152885, 1, 0, 0.6784314, 1,
1.22463, -0.07318685, 2.961691, 1, 0, 0.6705883, 1,
1.224715, 0.6151868, 0.4402107, 1, 0, 0.6666667, 1,
1.226795, 1.37535, -0.381333, 1, 0, 0.6588235, 1,
1.226975, -0.2838017, 3.331148, 1, 0, 0.654902, 1,
1.232412, 0.4399308, 2.193701, 1, 0, 0.6470588, 1,
1.249861, -0.1745556, 3.60138, 1, 0, 0.6431373, 1,
1.253027, -0.3258294, 1.682714, 1, 0, 0.6352941, 1,
1.25509, 0.1936863, 2.992926, 1, 0, 0.6313726, 1,
1.255437, -1.243613, 1.954465, 1, 0, 0.6235294, 1,
1.258098, 0.3911053, 1.75323, 1, 0, 0.6196079, 1,
1.269918, -1.494839, 1.979455, 1, 0, 0.6117647, 1,
1.270263, -1.79811, 3.454731, 1, 0, 0.6078432, 1,
1.270432, 0.02959438, 0.8740135, 1, 0, 0.6, 1,
1.279419, 0.8669565, 0.6884587, 1, 0, 0.5921569, 1,
1.280275, -0.5195155, -0.2106209, 1, 0, 0.5882353, 1,
1.280396, 0.7693222, 1.156286, 1, 0, 0.5803922, 1,
1.289901, -2.212574, 2.468518, 1, 0, 0.5764706, 1,
1.29877, -2.821432, 3.559862, 1, 0, 0.5686275, 1,
1.302322, -0.271412, 1.953839, 1, 0, 0.5647059, 1,
1.305935, -0.509255, 2.549138, 1, 0, 0.5568628, 1,
1.310388, -0.9795926, 2.046615, 1, 0, 0.5529412, 1,
1.321882, 0.8473063, 0.4799976, 1, 0, 0.5450981, 1,
1.330512, -0.2975041, 2.689375, 1, 0, 0.5411765, 1,
1.333632, 0.5483461, 0.6664508, 1, 0, 0.5333334, 1,
1.33495, -0.6259393, 1.260311, 1, 0, 0.5294118, 1,
1.338655, -0.6497603, 2.51918, 1, 0, 0.5215687, 1,
1.36233, 1.548585, -0.2014006, 1, 0, 0.5176471, 1,
1.363305, -1.528327, 3.057012, 1, 0, 0.509804, 1,
1.365796, -0.01084736, 0.1905429, 1, 0, 0.5058824, 1,
1.377767, 1.036536, -0.6969907, 1, 0, 0.4980392, 1,
1.380082, -0.6374088, 1.541797, 1, 0, 0.4901961, 1,
1.393782, 1.171947, -0.009078858, 1, 0, 0.4862745, 1,
1.394297, -0.09954579, 2.811178, 1, 0, 0.4784314, 1,
1.398048, 1.5722, 1.026046, 1, 0, 0.4745098, 1,
1.409377, 1.467326, 0.428822, 1, 0, 0.4666667, 1,
1.432329, -1.079788, 2.114209, 1, 0, 0.4627451, 1,
1.439245, -0.3491206, 0.9835757, 1, 0, 0.454902, 1,
1.442516, 1.68174, 0.1710897, 1, 0, 0.4509804, 1,
1.444605, 0.6136004, -0.7307497, 1, 0, 0.4431373, 1,
1.445166, 2.045855, -1.801547, 1, 0, 0.4392157, 1,
1.462697, 0.4195106, 1.412368, 1, 0, 0.4313726, 1,
1.465014, -1.401325, 0.9404551, 1, 0, 0.427451, 1,
1.468897, 2.278613, -0.3757119, 1, 0, 0.4196078, 1,
1.480217, -0.1228924, 0.1876386, 1, 0, 0.4156863, 1,
1.482828, -0.1721053, 2.320034, 1, 0, 0.4078431, 1,
1.487758, 1.172016, 1.192679, 1, 0, 0.4039216, 1,
1.500183, 0.5287861, 1.568218, 1, 0, 0.3960784, 1,
1.50413, 0.3193094, 0.8032603, 1, 0, 0.3882353, 1,
1.508547, 1.705745, 0.03619406, 1, 0, 0.3843137, 1,
1.517304, 0.1329915, 1.904176, 1, 0, 0.3764706, 1,
1.518654, -0.7210505, 1.309602, 1, 0, 0.372549, 1,
1.526559, 0.7450176, -0.3713681, 1, 0, 0.3647059, 1,
1.54602, 0.2711559, 0.5125527, 1, 0, 0.3607843, 1,
1.555478, 0.09245899, 1.492973, 1, 0, 0.3529412, 1,
1.562596, -1.569354, 1.956942, 1, 0, 0.3490196, 1,
1.564655, -0.1881861, 1.834595, 1, 0, 0.3411765, 1,
1.5753, -3.33349, 2.682072, 1, 0, 0.3372549, 1,
1.59421, 0.4629419, 1.356737, 1, 0, 0.3294118, 1,
1.595371, -1.071269, 1.175598, 1, 0, 0.3254902, 1,
1.5961, -0.7302451, 2.496394, 1, 0, 0.3176471, 1,
1.62628, -0.05523764, 1.389451, 1, 0, 0.3137255, 1,
1.628065, 0.2631194, 2.121213, 1, 0, 0.3058824, 1,
1.633854, -0.3041594, 2.497581, 1, 0, 0.2980392, 1,
1.635237, -0.2122855, 3.537871, 1, 0, 0.2941177, 1,
1.638691, 0.3571649, -0.355502, 1, 0, 0.2862745, 1,
1.652605, -0.9481444, 1.376075, 1, 0, 0.282353, 1,
1.653832, -0.4584821, 0.5706891, 1, 0, 0.2745098, 1,
1.683754, -1.011922, 3.580469, 1, 0, 0.2705882, 1,
1.70069, 1.357288, 1.42751, 1, 0, 0.2627451, 1,
1.708401, -0.0296929, 0.9998527, 1, 0, 0.2588235, 1,
1.752943, 0.8583393, 0.8858108, 1, 0, 0.2509804, 1,
1.761802, -1.074923, 1.838484, 1, 0, 0.2470588, 1,
1.769277, 0.02142581, 2.656717, 1, 0, 0.2392157, 1,
1.775215, 0.9763924, 1.721466, 1, 0, 0.2352941, 1,
1.795133, -0.2928962, 2.080341, 1, 0, 0.227451, 1,
1.796639, -0.1691208, 0.3798889, 1, 0, 0.2235294, 1,
1.803044, 0.5508298, 0.5348099, 1, 0, 0.2156863, 1,
1.813575, -0.1302618, 0.04046071, 1, 0, 0.2117647, 1,
1.829354, 1.34838, 1.524207, 1, 0, 0.2039216, 1,
1.833035, -0.402613, 2.676921, 1, 0, 0.1960784, 1,
1.840752, 0.1951398, 2.344025, 1, 0, 0.1921569, 1,
1.872664, -0.3607861, 1.539904, 1, 0, 0.1843137, 1,
1.873353, 1.301481, 2.815552, 1, 0, 0.1803922, 1,
1.945981, 0.2861856, 2.447927, 1, 0, 0.172549, 1,
1.948682, 0.7801749, 0.01004763, 1, 0, 0.1686275, 1,
1.954098, -0.4773315, 1.196257, 1, 0, 0.1607843, 1,
1.955701, -0.5401952, 1.186836, 1, 0, 0.1568628, 1,
1.965994, 0.6852667, 0.5164733, 1, 0, 0.1490196, 1,
2.04229, 0.1570524, 2.460651, 1, 0, 0.145098, 1,
2.066817, -1.622191, 3.443426, 1, 0, 0.1372549, 1,
2.119081, -1.429768, 2.509375, 1, 0, 0.1333333, 1,
2.120217, 0.3689403, 2.706471, 1, 0, 0.1254902, 1,
2.155322, -1.705216, 2.674115, 1, 0, 0.1215686, 1,
2.174812, 1.230295, 2.399434, 1, 0, 0.1137255, 1,
2.223285, 0.5583205, 0.4471343, 1, 0, 0.1098039, 1,
2.254363, 0.3278959, 3.959563, 1, 0, 0.1019608, 1,
2.262488, 0.4057531, -0.5131549, 1, 0, 0.09411765, 1,
2.298171, 0.5342277, 1.753096, 1, 0, 0.09019608, 1,
2.306451, 0.2070442, 1.838967, 1, 0, 0.08235294, 1,
2.30869, -0.8806394, 2.327343, 1, 0, 0.07843138, 1,
2.360252, -1.301333, 2.927037, 1, 0, 0.07058824, 1,
2.394235, -0.2685072, 0.6518141, 1, 0, 0.06666667, 1,
2.402789, 2.500208, 1.095904, 1, 0, 0.05882353, 1,
2.413142, -1.816777, 1.387528, 1, 0, 0.05490196, 1,
2.456314, 0.6997957, 0.8200238, 1, 0, 0.04705882, 1,
2.474158, -1.122106, 3.813877, 1, 0, 0.04313726, 1,
2.517743, -0.3403609, 1.530597, 1, 0, 0.03529412, 1,
2.733298, -1.274636, 2.344225, 1, 0, 0.03137255, 1,
2.786199, -1.01451, 2.700907, 1, 0, 0.02352941, 1,
2.956129, -0.6185989, -1.069404, 1, 0, 0.01960784, 1,
2.998737, 0.4447465, 1.528884, 1, 0, 0.01176471, 1,
3.641494, 0.3717477, 1.11934, 1, 0, 0.007843138, 1
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
0.3804829, -4.386088, -6.895463, 0, -0.5, 0.5, 0.5,
0.3804829, -4.386088, -6.895463, 1, -0.5, 0.5, 0.5,
0.3804829, -4.386088, -6.895463, 1, 1.5, 0.5, 0.5,
0.3804829, -4.386088, -6.895463, 0, 1.5, 0.5, 0.5
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
-3.986011, -0.2284803, -6.895463, 0, -0.5, 0.5, 0.5,
-3.986011, -0.2284803, -6.895463, 1, -0.5, 0.5, 0.5,
-3.986011, -0.2284803, -6.895463, 1, 1.5, 0.5, 0.5,
-3.986011, -0.2284803, -6.895463, 0, 1.5, 0.5, 0.5
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
-3.986011, -4.386088, 0.2246313, 0, -0.5, 0.5, 0.5,
-3.986011, -4.386088, 0.2246313, 1, -0.5, 0.5, 0.5,
-3.986011, -4.386088, 0.2246313, 1, 1.5, 0.5, 0.5,
-3.986011, -4.386088, 0.2246313, 0, 1.5, 0.5, 0.5
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
-2, -3.42664, -5.252364,
3, -3.42664, -5.252364,
-2, -3.42664, -5.252364,
-2, -3.586548, -5.526214,
-1, -3.42664, -5.252364,
-1, -3.586548, -5.526214,
0, -3.42664, -5.252364,
0, -3.586548, -5.526214,
1, -3.42664, -5.252364,
1, -3.586548, -5.526214,
2, -3.42664, -5.252364,
2, -3.586548, -5.526214,
3, -3.42664, -5.252364,
3, -3.586548, -5.526214
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
-2, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
-2, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
-2, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
-2, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5,
-1, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
-1, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
-1, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
-1, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5,
0, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
0, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
0, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
0, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5,
1, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
1, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
1, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
1, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5,
2, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
2, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
2, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
2, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5,
3, -3.906364, -6.073913, 0, -0.5, 0.5, 0.5,
3, -3.906364, -6.073913, 1, -0.5, 0.5, 0.5,
3, -3.906364, -6.073913, 1, 1.5, 0.5, 0.5,
3, -3.906364, -6.073913, 0, 1.5, 0.5, 0.5
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
-2.978359, -3, -5.252364,
-2.978359, 2, -5.252364,
-2.978359, -3, -5.252364,
-3.146301, -3, -5.526214,
-2.978359, -2, -5.252364,
-3.146301, -2, -5.526214,
-2.978359, -1, -5.252364,
-3.146301, -1, -5.526214,
-2.978359, 0, -5.252364,
-3.146301, 0, -5.526214,
-2.978359, 1, -5.252364,
-3.146301, 1, -5.526214,
-2.978359, 2, -5.252364,
-3.146301, 2, -5.526214
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
-3.482185, -3, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, -3, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, -3, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, -3, -6.073913, 0, 1.5, 0.5, 0.5,
-3.482185, -2, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, -2, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, -2, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, -2, -6.073913, 0, 1.5, 0.5, 0.5,
-3.482185, -1, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, -1, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, -1, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, -1, -6.073913, 0, 1.5, 0.5, 0.5,
-3.482185, 0, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, 0, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, 0, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, 0, -6.073913, 0, 1.5, 0.5, 0.5,
-3.482185, 1, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, 1, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, 1, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, 1, -6.073913, 0, 1.5, 0.5, 0.5,
-3.482185, 2, -6.073913, 0, -0.5, 0.5, 0.5,
-3.482185, 2, -6.073913, 1, -0.5, 0.5, 0.5,
-3.482185, 2, -6.073913, 1, 1.5, 0.5, 0.5,
-3.482185, 2, -6.073913, 0, 1.5, 0.5, 0.5
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
-2.978359, -3.42664, -4,
-2.978359, -3.42664, 4,
-2.978359, -3.42664, -4,
-3.146301, -3.586548, -4,
-2.978359, -3.42664, -2,
-3.146301, -3.586548, -2,
-2.978359, -3.42664, 0,
-3.146301, -3.586548, 0,
-2.978359, -3.42664, 2,
-3.146301, -3.586548, 2,
-2.978359, -3.42664, 4,
-3.146301, -3.586548, 4
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
-3.482185, -3.906364, -4, 0, -0.5, 0.5, 0.5,
-3.482185, -3.906364, -4, 1, -0.5, 0.5, 0.5,
-3.482185, -3.906364, -4, 1, 1.5, 0.5, 0.5,
-3.482185, -3.906364, -4, 0, 1.5, 0.5, 0.5,
-3.482185, -3.906364, -2, 0, -0.5, 0.5, 0.5,
-3.482185, -3.906364, -2, 1, -0.5, 0.5, 0.5,
-3.482185, -3.906364, -2, 1, 1.5, 0.5, 0.5,
-3.482185, -3.906364, -2, 0, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 0, 0, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 0, 1, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 0, 1, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 0, 0, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 2, 0, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 2, 1, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 2, 1, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 2, 0, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 4, 0, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 4, 1, -0.5, 0.5, 0.5,
-3.482185, -3.906364, 4, 1, 1.5, 0.5, 0.5,
-3.482185, -3.906364, 4, 0, 1.5, 0.5, 0.5
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
-2.978359, -3.42664, -5.252364,
-2.978359, 2.96968, -5.252364,
-2.978359, -3.42664, 5.701626,
-2.978359, 2.96968, 5.701626,
-2.978359, -3.42664, -5.252364,
-2.978359, -3.42664, 5.701626,
-2.978359, 2.96968, -5.252364,
-2.978359, 2.96968, 5.701626,
-2.978359, -3.42664, -5.252364,
3.739325, -3.42664, -5.252364,
-2.978359, -3.42664, 5.701626,
3.739325, -3.42664, 5.701626,
-2.978359, 2.96968, -5.252364,
3.739325, 2.96968, -5.252364,
-2.978359, 2.96968, 5.701626,
3.739325, 2.96968, 5.701626,
3.739325, -3.42664, -5.252364,
3.739325, 2.96968, -5.252364,
3.739325, -3.42664, 5.701626,
3.739325, 2.96968, 5.701626,
3.739325, -3.42664, -5.252364,
3.739325, -3.42664, 5.701626,
3.739325, 2.96968, -5.252364,
3.739325, 2.96968, 5.701626
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
var radius = 7.664623;
var distance = 34.10077;
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
mvMatrix.translate( -0.3804829, 0.2284803, -0.2246313 );
mvMatrix.scale( 1.233631, 1.295611, 0.7565408 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10077);
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
ethofumesate<-read.table("ethofumesate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethofumesate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
y<-ethofumesate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
z<-ethofumesate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
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
-2.880528, 2.560036, -0.1188515, 0, 0, 1, 1, 1,
-2.654973, 0.2658394, -2.410121, 1, 0, 0, 1, 1,
-2.62399, -0.3843051, -1.820446, 1, 0, 0, 1, 1,
-2.460821, 0.9792442, -1.004663, 1, 0, 0, 1, 1,
-2.432439, 0.122575, 0.2056493, 1, 0, 0, 1, 1,
-2.426469, 0.3382782, -2.23111, 1, 0, 0, 1, 1,
-2.363859, -0.1449922, 1.637966, 0, 0, 0, 1, 1,
-2.268958, -1.304549, -3.071118, 0, 0, 0, 1, 1,
-2.24565, -0.1728936, -3.280461, 0, 0, 0, 1, 1,
-2.234531, 0.5138914, 0.1557786, 0, 0, 0, 1, 1,
-2.207435, -0.5580546, -2.817532, 0, 0, 0, 1, 1,
-2.182836, -1.313084, -0.5784305, 0, 0, 0, 1, 1,
-2.179167, 2.129867, 0.06869482, 0, 0, 0, 1, 1,
-2.156554, -2.824285, -1.922763, 1, 1, 1, 1, 1,
-2.155167, 0.8917849, 0.09805343, 1, 1, 1, 1, 1,
-2.15386, 0.7834795, -1.305596, 1, 1, 1, 1, 1,
-2.144753, 0.2969576, -0.7148339, 1, 1, 1, 1, 1,
-2.137152, -0.4611448, -1.084917, 1, 1, 1, 1, 1,
-2.11184, -0.2587931, -1.249651, 1, 1, 1, 1, 1,
-2.104577, -1.048729, -2.321058, 1, 1, 1, 1, 1,
-2.066674, -0.3529097, -0.8540858, 1, 1, 1, 1, 1,
-2.061062, -1.712609, -1.782395, 1, 1, 1, 1, 1,
-2.036075, 0.9770278, -2.14514, 1, 1, 1, 1, 1,
-2.015006, -0.4383914, -2.010315, 1, 1, 1, 1, 1,
-2.007968, -0.01963915, -1.332255, 1, 1, 1, 1, 1,
-2.003664, -1.519594, -2.868694, 1, 1, 1, 1, 1,
-2.00208, -0.5855251, -1.115661, 1, 1, 1, 1, 1,
-1.987722, 0.2483762, -0.5263262, 1, 1, 1, 1, 1,
-1.968211, 0.1057633, -0.9619682, 0, 0, 1, 1, 1,
-1.964948, -0.3120889, -2.295133, 1, 0, 0, 1, 1,
-1.959448, -1.037883, -1.290996, 1, 0, 0, 1, 1,
-1.956013, 0.1378561, -1.412635, 1, 0, 0, 1, 1,
-1.949108, 0.2900839, -1.138615, 1, 0, 0, 1, 1,
-1.946933, -0.6831788, -1.072671, 1, 0, 0, 1, 1,
-1.926847, 0.3208421, -0.6605216, 0, 0, 0, 1, 1,
-1.912526, -1.080286, -3.244206, 0, 0, 0, 1, 1,
-1.912322, -0.1454128, -1.498116, 0, 0, 0, 1, 1,
-1.899955, -0.6742867, -2.144566, 0, 0, 0, 1, 1,
-1.898901, 0.870229, -1.417696, 0, 0, 0, 1, 1,
-1.848086, 0.3997415, -1.361204, 0, 0, 0, 1, 1,
-1.833263, -1.906781, -3.254196, 0, 0, 0, 1, 1,
-1.829334, -0.1871443, -1.448832, 1, 1, 1, 1, 1,
-1.816261, 0.7885546, -1.101124, 1, 1, 1, 1, 1,
-1.810942, 0.4798917, -1.208362, 1, 1, 1, 1, 1,
-1.810922, -0.2811611, -0.2473689, 1, 1, 1, 1, 1,
-1.798642, -1.34423, -1.792303, 1, 1, 1, 1, 1,
-1.789994, -1.10612, -2.787512, 1, 1, 1, 1, 1,
-1.757227, 0.168878, -2.350168, 1, 1, 1, 1, 1,
-1.754144, -1.041128, -2.440641, 1, 1, 1, 1, 1,
-1.75223, -1.356405, -1.361713, 1, 1, 1, 1, 1,
-1.730394, 0.9342214, -1.63194, 1, 1, 1, 1, 1,
-1.721029, 1.517191, -0.5904638, 1, 1, 1, 1, 1,
-1.712645, -0.4774344, -1.41595, 1, 1, 1, 1, 1,
-1.706795, -1.019176, -2.834228, 1, 1, 1, 1, 1,
-1.691182, 1.357892, -1.628708, 1, 1, 1, 1, 1,
-1.660761, -0.3449346, -1.041808, 1, 1, 1, 1, 1,
-1.647434, 0.8785839, 0.4908938, 0, 0, 1, 1, 1,
-1.641649, 1.176279, -1.669259, 1, 0, 0, 1, 1,
-1.630926, 1.297263, -0.8172994, 1, 0, 0, 1, 1,
-1.622204, -0.6667247, -1.955363, 1, 0, 0, 1, 1,
-1.621777, -0.7062452, -1.916801, 1, 0, 0, 1, 1,
-1.59637, -1.132122, -0.929621, 1, 0, 0, 1, 1,
-1.573465, 0.1935996, -1.361308, 0, 0, 0, 1, 1,
-1.546713, -1.199379, -1.497468, 0, 0, 0, 1, 1,
-1.543111, -2.257151, -2.972843, 0, 0, 0, 1, 1,
-1.5338, 0.3805735, -1.23582, 0, 0, 0, 1, 1,
-1.511867, 0.4990484, -0.8988225, 0, 0, 0, 1, 1,
-1.509571, 0.4474166, -0.3823144, 0, 0, 0, 1, 1,
-1.494729, 0.5365896, 0.1892435, 0, 0, 0, 1, 1,
-1.475852, -0.2395295, -0.8720871, 1, 1, 1, 1, 1,
-1.472174, 0.04628373, -3.088191, 1, 1, 1, 1, 1,
-1.462915, -1.865867, -2.183023, 1, 1, 1, 1, 1,
-1.46274, -1.304684, -2.956438, 1, 1, 1, 1, 1,
-1.459089, 1.088771, 0.4482561, 1, 1, 1, 1, 1,
-1.448649, 0.8955868, -1.976215, 1, 1, 1, 1, 1,
-1.426858, -0.355956, -2.453495, 1, 1, 1, 1, 1,
-1.425443, -0.7901544, -2.184695, 1, 1, 1, 1, 1,
-1.421764, 1.373434, -0.4457161, 1, 1, 1, 1, 1,
-1.392712, 0.902817, -1.080919, 1, 1, 1, 1, 1,
-1.3907, 0.9782742, -0.329817, 1, 1, 1, 1, 1,
-1.380461, 1.052839, -0.0866721, 1, 1, 1, 1, 1,
-1.380344, -0.5352358, -0.1985027, 1, 1, 1, 1, 1,
-1.377658, 0.1020238, -0.5124321, 1, 1, 1, 1, 1,
-1.372334, 0.8660183, -0.7646738, 1, 1, 1, 1, 1,
-1.344249, 0.114866, -1.006461, 0, 0, 1, 1, 1,
-1.342212, 0.6282621, 0.5546123, 1, 0, 0, 1, 1,
-1.333309, -0.3548452, -1.010677, 1, 0, 0, 1, 1,
-1.328545, -0.774994, -0.8920611, 1, 0, 0, 1, 1,
-1.326169, 1.087055, 1.204509, 1, 0, 0, 1, 1,
-1.322995, 0.5179082, -1.371635, 1, 0, 0, 1, 1,
-1.316988, 0.08950846, -2.045884, 0, 0, 0, 1, 1,
-1.289521, 1.169222, -1.454355, 0, 0, 0, 1, 1,
-1.285351, 1.166855, -1.165693, 0, 0, 0, 1, 1,
-1.276739, -1.232089, -1.685592, 0, 0, 0, 1, 1,
-1.273073, -0.4347079, -2.363789, 0, 0, 0, 1, 1,
-1.268731, 1.715172, -0.7881154, 0, 0, 0, 1, 1,
-1.263292, 1.042806, 0.04829947, 0, 0, 0, 1, 1,
-1.263062, 0.04988946, -2.484211, 1, 1, 1, 1, 1,
-1.259829, 1.064179, -0.8205687, 1, 1, 1, 1, 1,
-1.257794, -1.312235, -2.59269, 1, 1, 1, 1, 1,
-1.250614, -0.3309858, -2.534905, 1, 1, 1, 1, 1,
-1.245325, -0.7753012, -4.119493, 1, 1, 1, 1, 1,
-1.224089, 0.01124947, -2.489559, 1, 1, 1, 1, 1,
-1.221215, 0.4583213, -0.1591373, 1, 1, 1, 1, 1,
-1.21924, 0.04033202, -1.487782, 1, 1, 1, 1, 1,
-1.218415, 0.213994, -3.071537, 1, 1, 1, 1, 1,
-1.214419, 0.7806739, -1.698753, 1, 1, 1, 1, 1,
-1.204343, 0.6543075, -1.365759, 1, 1, 1, 1, 1,
-1.202694, 0.06732507, -3.225344, 1, 1, 1, 1, 1,
-1.200685, -1.052622, -3.245484, 1, 1, 1, 1, 1,
-1.19976, 0.3503561, -1.294778, 1, 1, 1, 1, 1,
-1.19613, -1.270311, -2.611431, 1, 1, 1, 1, 1,
-1.178797, 0.3091371, -1.723348, 0, 0, 1, 1, 1,
-1.176607, 0.6640104, -1.767869, 1, 0, 0, 1, 1,
-1.174057, -0.3787816, -1.215077, 1, 0, 0, 1, 1,
-1.173449, 1.162307, -1.158868, 1, 0, 0, 1, 1,
-1.172772, -0.6240798, -0.6293086, 1, 0, 0, 1, 1,
-1.172177, -0.5306626, -3.35566, 1, 0, 0, 1, 1,
-1.164865, 0.170599, -1.6411, 0, 0, 0, 1, 1,
-1.164192, -0.8659316, -2.342056, 0, 0, 0, 1, 1,
-1.163025, -0.3240833, -3.649164, 0, 0, 0, 1, 1,
-1.161446, -0.7905054, -2.696427, 0, 0, 0, 1, 1,
-1.14725, -1.208268, -2.49188, 0, 0, 0, 1, 1,
-1.133752, -1.415967, -3.682713, 0, 0, 0, 1, 1,
-1.130561, -0.4794214, -1.494462, 0, 0, 0, 1, 1,
-1.126164, -0.7288253, -1.618628, 1, 1, 1, 1, 1,
-1.11867, 0.8859687, -0.9273632, 1, 1, 1, 1, 1,
-1.116613, 0.01683069, -0.1617661, 1, 1, 1, 1, 1,
-1.110765, -0.3384229, -2.19778, 1, 1, 1, 1, 1,
-1.108223, 0.03350685, 0.06648479, 1, 1, 1, 1, 1,
-1.107308, 0.3007136, -2.455559, 1, 1, 1, 1, 1,
-1.092689, 0.06144493, -0.358163, 1, 1, 1, 1, 1,
-1.084771, 0.3102518, -2.907803, 1, 1, 1, 1, 1,
-1.075468, -1.492286, -2.7323, 1, 1, 1, 1, 1,
-1.073043, 0.4462179, -2.524416, 1, 1, 1, 1, 1,
-1.066233, -2.072316, -3.557571, 1, 1, 1, 1, 1,
-1.064343, 0.04882336, -1.510617, 1, 1, 1, 1, 1,
-1.056801, -0.8407638, -3.043584, 1, 1, 1, 1, 1,
-1.049586, -0.7399706, -2.149194, 1, 1, 1, 1, 1,
-1.043835, -0.5172132, -2.050526, 1, 1, 1, 1, 1,
-1.038802, -0.3001752, -3.321292, 0, 0, 1, 1, 1,
-1.014904, -1.067693, -4.282255, 1, 0, 0, 1, 1,
-1.009044, -0.2215865, -2.555145, 1, 0, 0, 1, 1,
-1.005272, 1.547097, 1.105396, 1, 0, 0, 1, 1,
-1.001068, 0.099458, -0.6900883, 1, 0, 0, 1, 1,
-1.000047, 0.7008092, -2.476154, 1, 0, 0, 1, 1,
-0.9949793, -0.1832363, -2.61545, 0, 0, 0, 1, 1,
-0.9949371, -0.3542516, -0.6973186, 0, 0, 0, 1, 1,
-0.992884, 1.41332, -0.1514159, 0, 0, 0, 1, 1,
-0.9841979, -0.1115308, -1.504694, 0, 0, 0, 1, 1,
-0.9820939, -0.1622008, -0.7763857, 0, 0, 0, 1, 1,
-0.9820606, -0.09023149, -1.432306, 0, 0, 0, 1, 1,
-0.9782291, 1.069943, 0.03157849, 0, 0, 0, 1, 1,
-0.9766839, 0.6834021, 0.4743091, 1, 1, 1, 1, 1,
-0.9751888, 1.284561, 1.023134, 1, 1, 1, 1, 1,
-0.974125, 0.8234609, -1.056474, 1, 1, 1, 1, 1,
-0.9737853, -0.2251179, -2.942233, 1, 1, 1, 1, 1,
-0.9718016, -0.03074972, -3.09149, 1, 1, 1, 1, 1,
-0.9712585, 1.491027, -0.3926218, 1, 1, 1, 1, 1,
-0.970006, 0.6763868, -1.336043, 1, 1, 1, 1, 1,
-0.9696917, 1.412957, 0.4265929, 1, 1, 1, 1, 1,
-0.9688931, 0.03188614, -3.782185, 1, 1, 1, 1, 1,
-0.9632034, 1.820441, 0.6552387, 1, 1, 1, 1, 1,
-0.963094, -0.4712369, -2.661026, 1, 1, 1, 1, 1,
-0.9567607, -0.7600977, -2.355004, 1, 1, 1, 1, 1,
-0.9560404, -0.3486147, -1.539456, 1, 1, 1, 1, 1,
-0.9535897, 0.3498386, -2.11799, 1, 1, 1, 1, 1,
-0.9529639, -0.1230973, -2.662343, 1, 1, 1, 1, 1,
-0.9448614, -1.265329, -0.8265618, 0, 0, 1, 1, 1,
-0.9442587, -0.8832676, -2.673898, 1, 0, 0, 1, 1,
-0.938488, -0.2909564, -2.790864, 1, 0, 0, 1, 1,
-0.9349676, -0.1867693, -1.242322, 1, 0, 0, 1, 1,
-0.9347309, -0.8180428, -2.116515, 1, 0, 0, 1, 1,
-0.9319694, -0.94707, -1.843886, 1, 0, 0, 1, 1,
-0.9274669, -0.8693504, -2.415736, 0, 0, 0, 1, 1,
-0.9268344, 0.11673, -0.1247467, 0, 0, 0, 1, 1,
-0.9242758, -0.2072453, -0.1386775, 0, 0, 0, 1, 1,
-0.9220465, -1.16217, -3.850084, 0, 0, 0, 1, 1,
-0.9180252, 0.3679714, -2.36789, 0, 0, 0, 1, 1,
-0.9138505, 0.3272986, -1.892812, 0, 0, 0, 1, 1,
-0.9044468, -0.8663142, -1.23449, 0, 0, 0, 1, 1,
-0.9010305, 0.1285079, -1.836436, 1, 1, 1, 1, 1,
-0.8995427, -0.2837532, -1.814113, 1, 1, 1, 1, 1,
-0.899196, -0.7861709, -1.212393, 1, 1, 1, 1, 1,
-0.8922478, -0.4177137, -3.101499, 1, 1, 1, 1, 1,
-0.8919217, 0.07360387, -1.043496, 1, 1, 1, 1, 1,
-0.8857728, -1.441396, -3.831451, 1, 1, 1, 1, 1,
-0.8847633, -0.9578633, -1.699808, 1, 1, 1, 1, 1,
-0.8817694, 1.258254, -2.669726, 1, 1, 1, 1, 1,
-0.8738099, -0.05344293, -1.799271, 1, 1, 1, 1, 1,
-0.8712872, 1.494442, 0.1237478, 1, 1, 1, 1, 1,
-0.8668564, 1.395792, -0.08656963, 1, 1, 1, 1, 1,
-0.8601834, 1.750468, 0.2059235, 1, 1, 1, 1, 1,
-0.8597848, -0.7745931, -1.24335, 1, 1, 1, 1, 1,
-0.8576804, -1.939954, -3.640208, 1, 1, 1, 1, 1,
-0.8562858, 0.4947886, -2.122424, 1, 1, 1, 1, 1,
-0.8541477, -1.644424, -2.541167, 0, 0, 1, 1, 1,
-0.8493939, -1.269994, -3.844746, 1, 0, 0, 1, 1,
-0.8492759, -0.2321917, -1.825425, 1, 0, 0, 1, 1,
-0.8387294, 2.066885, -0.447355, 1, 0, 0, 1, 1,
-0.8384539, -0.7208022, -4.740143, 1, 0, 0, 1, 1,
-0.8213085, 1.091442, -2.401815, 1, 0, 0, 1, 1,
-0.81915, 0.9607713, 0.2831343, 0, 0, 0, 1, 1,
-0.8154803, 2.006489, -1.074505, 0, 0, 0, 1, 1,
-0.8081641, 0.3036608, -0.8207141, 0, 0, 0, 1, 1,
-0.8078592, -0.1116876, -1.002717, 0, 0, 0, 1, 1,
-0.8036603, -1.188568, -1.457174, 0, 0, 0, 1, 1,
-0.8031825, -0.4501655, -2.018899, 0, 0, 0, 1, 1,
-0.8008822, 0.1749184, -0.5175376, 0, 0, 0, 1, 1,
-0.7995021, 0.134359, -3.591067, 1, 1, 1, 1, 1,
-0.7926646, -1.591407, -1.796161, 1, 1, 1, 1, 1,
-0.7902112, 0.7793252, 0.5470065, 1, 1, 1, 1, 1,
-0.7901992, 0.6659418, -2.332183, 1, 1, 1, 1, 1,
-0.7741058, 0.6628986, -1.172992, 1, 1, 1, 1, 1,
-0.7714225, -1.287102, -3.386269, 1, 1, 1, 1, 1,
-0.7708641, -0.3272992, -2.183527, 1, 1, 1, 1, 1,
-0.7547844, -0.7044163, -0.7400135, 1, 1, 1, 1, 1,
-0.7530414, 0.2605448, -0.5531694, 1, 1, 1, 1, 1,
-0.7509345, -0.5838779, -1.410068, 1, 1, 1, 1, 1,
-0.7477203, 0.8844914, 0.03648892, 1, 1, 1, 1, 1,
-0.7419856, 0.2085238, -1.701799, 1, 1, 1, 1, 1,
-0.7364292, 0.6144385, 0.00621771, 1, 1, 1, 1, 1,
-0.7339497, -0.9811932, -3.267659, 1, 1, 1, 1, 1,
-0.7317334, 0.3366333, -0.9383138, 1, 1, 1, 1, 1,
-0.7293282, -0.06778445, -1.000061, 0, 0, 1, 1, 1,
-0.727173, 0.766616, 0.6888606, 1, 0, 0, 1, 1,
-0.723365, 1.587804, -0.4502188, 1, 0, 0, 1, 1,
-0.7213248, 1.060114, -1.743351, 1, 0, 0, 1, 1,
-0.7136857, -0.4200207, -1.837972, 1, 0, 0, 1, 1,
-0.7135525, 0.6609786, -1.089274, 1, 0, 0, 1, 1,
-0.7071087, 0.513121, -1.147346, 0, 0, 0, 1, 1,
-0.7050822, -1.203922, -4.47451, 0, 0, 0, 1, 1,
-0.7023749, -0.0299162, -2.09878, 0, 0, 0, 1, 1,
-0.7017586, 0.3535691, -0.6342728, 0, 0, 0, 1, 1,
-0.6848579, 0.6067258, 0.5178617, 0, 0, 0, 1, 1,
-0.6800331, -0.4885371, -1.437486, 0, 0, 0, 1, 1,
-0.6799924, 0.567984, -0.57095, 0, 0, 0, 1, 1,
-0.6787526, 2.288197, -1.385953, 1, 1, 1, 1, 1,
-0.6764919, -0.3095599, -1.532095, 1, 1, 1, 1, 1,
-0.6737049, 0.1391914, -0.5835921, 1, 1, 1, 1, 1,
-0.6689574, -1.152236, -3.09529, 1, 1, 1, 1, 1,
-0.6669701, 1.787407, 0.3759392, 1, 1, 1, 1, 1,
-0.6652467, -0.854778, -4.918193, 1, 1, 1, 1, 1,
-0.6637616, 0.09362559, -0.05451844, 1, 1, 1, 1, 1,
-0.6622207, -1.99444, -3.523249, 1, 1, 1, 1, 1,
-0.6596578, 1.932733, -1.165028, 1, 1, 1, 1, 1,
-0.6578406, 1.251104, -0.01498412, 1, 1, 1, 1, 1,
-0.6494919, -0.3692769, -0.2005682, 1, 1, 1, 1, 1,
-0.6477666, 1.330377, 0.6668015, 1, 1, 1, 1, 1,
-0.6455006, -0.117896, -2.526886, 1, 1, 1, 1, 1,
-0.6438733, -1.931449, -3.106183, 1, 1, 1, 1, 1,
-0.6426322, 1.713066, -1.555747, 1, 1, 1, 1, 1,
-0.6390216, 1.484651, -2.025944, 0, 0, 1, 1, 1,
-0.6371682, -0.8050855, -1.59678, 1, 0, 0, 1, 1,
-0.6362848, -1.725434, -2.444693, 1, 0, 0, 1, 1,
-0.6362824, -0.6864392, -1.75758, 1, 0, 0, 1, 1,
-0.6304968, 0.4840369, -0.9688608, 1, 0, 0, 1, 1,
-0.6270969, -0.4129744, -1.342435, 1, 0, 0, 1, 1,
-0.625055, 2.300171, 1.194547, 0, 0, 0, 1, 1,
-0.6161451, -0.4055457, -1.861193, 0, 0, 0, 1, 1,
-0.6153047, 0.7508627, -0.4212923, 0, 0, 0, 1, 1,
-0.6151562, 0.2145042, -2.206699, 0, 0, 0, 1, 1,
-0.6144183, 0.7977837, 0.01113782, 0, 0, 0, 1, 1,
-0.6097776, -0.6310482, -2.669047, 0, 0, 0, 1, 1,
-0.6064246, 0.3580399, -1.634621, 0, 0, 0, 1, 1,
-0.6063529, 1.01063, -0.6408376, 1, 1, 1, 1, 1,
-0.6040156, 1.249256, -0.3524011, 1, 1, 1, 1, 1,
-0.6022033, 0.1282263, -2.012517, 1, 1, 1, 1, 1,
-0.6016062, 0.6105207, -0.6653888, 1, 1, 1, 1, 1,
-0.5998367, -0.3485584, -3.157725, 1, 1, 1, 1, 1,
-0.5995345, -0.7147549, -2.490839, 1, 1, 1, 1, 1,
-0.5988612, -0.9527004, -1.622432, 1, 1, 1, 1, 1,
-0.597317, 1.065814, -0.9283905, 1, 1, 1, 1, 1,
-0.5915216, 0.6723812, -2.403243, 1, 1, 1, 1, 1,
-0.5870253, 0.5167283, -0.4022762, 1, 1, 1, 1, 1,
-0.5835983, -1.075873, -1.312081, 1, 1, 1, 1, 1,
-0.5810577, 0.7852744, 0.2560751, 1, 1, 1, 1, 1,
-0.5783576, -0.2457696, -1.705942, 1, 1, 1, 1, 1,
-0.5761008, -0.2159415, -2.047258, 1, 1, 1, 1, 1,
-0.5743374, 1.662369, -0.4258991, 1, 1, 1, 1, 1,
-0.5722311, -1.046532, -2.529559, 0, 0, 1, 1, 1,
-0.5676298, -0.622945, -2.02265, 1, 0, 0, 1, 1,
-0.5581362, -0.1504948, -0.8759453, 1, 0, 0, 1, 1,
-0.557996, 0.3392354, -0.6175875, 1, 0, 0, 1, 1,
-0.5564425, -0.9269031, -2.068225, 1, 0, 0, 1, 1,
-0.5542663, 0.8447689, -1.432869, 1, 0, 0, 1, 1,
-0.5539032, -1.685043, -2.096723, 0, 0, 0, 1, 1,
-0.551894, 0.7527797, -0.376591, 0, 0, 0, 1, 1,
-0.5483841, 0.6357465, 0.3190458, 0, 0, 0, 1, 1,
-0.5474019, -0.331091, -1.969674, 0, 0, 0, 1, 1,
-0.5431282, 0.07491162, -1.393582, 0, 0, 0, 1, 1,
-0.5416319, 0.1104175, -1.887027, 0, 0, 0, 1, 1,
-0.5398883, 0.6587951, -1.175734, 0, 0, 0, 1, 1,
-0.5372593, 1.949308, 0.560396, 1, 1, 1, 1, 1,
-0.5300773, 0.1225062, -1.313222, 1, 1, 1, 1, 1,
-0.5282803, -0.7714398, -5.09284, 1, 1, 1, 1, 1,
-0.5268544, -0.03354177, -2.795792, 1, 1, 1, 1, 1,
-0.524837, 0.3881338, -0.9558545, 1, 1, 1, 1, 1,
-0.5232196, -1.505122, -1.957411, 1, 1, 1, 1, 1,
-0.5163561, 1.6775, -0.02832981, 1, 1, 1, 1, 1,
-0.514671, -1.486016, -2.891756, 1, 1, 1, 1, 1,
-0.5133371, -0.125424, -1.708998, 1, 1, 1, 1, 1,
-0.5111392, 1.152143, -1.974326, 1, 1, 1, 1, 1,
-0.5105142, 0.3970435, 0.4869423, 1, 1, 1, 1, 1,
-0.5091608, 0.5099417, -2.456799, 1, 1, 1, 1, 1,
-0.5030339, -1.253788, -2.275834, 1, 1, 1, 1, 1,
-0.5029802, 0.8438045, -2.089444, 1, 1, 1, 1, 1,
-0.4983946, -0.1018732, 0.05135331, 1, 1, 1, 1, 1,
-0.4947695, 0.3701357, -0.2075377, 0, 0, 1, 1, 1,
-0.4939942, -0.6518285, -2.517696, 1, 0, 0, 1, 1,
-0.4921535, -0.2437031, -2.321335, 1, 0, 0, 1, 1,
-0.4909704, -0.5165553, -2.538292, 1, 0, 0, 1, 1,
-0.4872775, 0.1285369, -1.961722, 1, 0, 0, 1, 1,
-0.4856224, 0.3748568, 0.6902297, 1, 0, 0, 1, 1,
-0.4854134, -1.702562, -1.993563, 0, 0, 0, 1, 1,
-0.4826372, -2.01123, -3.11014, 0, 0, 0, 1, 1,
-0.48112, 0.09012914, -0.5696205, 0, 0, 0, 1, 1,
-0.4783757, 1.098435, -1.638488, 0, 0, 0, 1, 1,
-0.4761571, 0.4802543, -1.559419, 0, 0, 0, 1, 1,
-0.4692616, -0.6848513, -3.144161, 0, 0, 0, 1, 1,
-0.4667929, 1.287454, 0.3702277, 0, 0, 0, 1, 1,
-0.4665396, -1.383308, -3.354299, 1, 1, 1, 1, 1,
-0.4642898, -0.1366519, -0.3787695, 1, 1, 1, 1, 1,
-0.4616427, 0.07658036, -2.680031, 1, 1, 1, 1, 1,
-0.459035, 1.81141, -0.08920994, 1, 1, 1, 1, 1,
-0.4570658, 0.5288685, -0.3351643, 1, 1, 1, 1, 1,
-0.4509445, -0.2434054, -2.460735, 1, 1, 1, 1, 1,
-0.4415253, 0.7051507, -0.9201342, 1, 1, 1, 1, 1,
-0.4403335, -0.388288, -2.304826, 1, 1, 1, 1, 1,
-0.4400877, 1.805917, 0.5254391, 1, 1, 1, 1, 1,
-0.4388487, 0.2895197, -1.675005, 1, 1, 1, 1, 1,
-0.4387208, 2.3179, -1.050194, 1, 1, 1, 1, 1,
-0.4356436, -0.6721265, -3.000239, 1, 1, 1, 1, 1,
-0.4332159, -1.424385, -2.368103, 1, 1, 1, 1, 1,
-0.4320464, 2.876529, -0.08361805, 1, 1, 1, 1, 1,
-0.4299056, 1.336883, -0.03536995, 1, 1, 1, 1, 1,
-0.423556, 1.790335, -2.203974, 0, 0, 1, 1, 1,
-0.4224639, -0.215005, -3.066119, 1, 0, 0, 1, 1,
-0.420907, -1.321807, -3.098965, 1, 0, 0, 1, 1,
-0.4201763, -1.256828, -3.814334, 1, 0, 0, 1, 1,
-0.4172786, 1.032145, 1.840053, 1, 0, 0, 1, 1,
-0.4171722, 1.201924, -1.289181, 1, 0, 0, 1, 1,
-0.4156674, 0.7393194, -0.4660489, 0, 0, 0, 1, 1,
-0.4145725, 0.9381942, 1.147468, 0, 0, 0, 1, 1,
-0.4088606, -0.9797785, -2.887606, 0, 0, 0, 1, 1,
-0.4002239, -0.20837, -0.05502044, 0, 0, 0, 1, 1,
-0.3847333, 0.9116132, 0.08983795, 0, 0, 0, 1, 1,
-0.3837724, 0.7279909, 0.3510887, 0, 0, 0, 1, 1,
-0.3825423, 1.050182, 0.4566058, 0, 0, 0, 1, 1,
-0.3811175, -0.07686045, -1.746779, 1, 1, 1, 1, 1,
-0.3809091, -1.741886, -3.531007, 1, 1, 1, 1, 1,
-0.3773771, 1.218996, 0.6432607, 1, 1, 1, 1, 1,
-0.3766854, -0.08937068, -1.60807, 1, 1, 1, 1, 1,
-0.3700714, -1.498171, -2.803605, 1, 1, 1, 1, 1,
-0.367954, -0.6309379, -3.983335, 1, 1, 1, 1, 1,
-0.3670758, 0.5148782, 0.836495, 1, 1, 1, 1, 1,
-0.3670284, -0.7419655, -3.185529, 1, 1, 1, 1, 1,
-0.3646049, 0.4199814, 0.4307327, 1, 1, 1, 1, 1,
-0.3644341, -0.04557695, -3.210035, 1, 1, 1, 1, 1,
-0.3609436, 1.273705, -0.1726789, 1, 1, 1, 1, 1,
-0.3602612, -1.417337, -2.639819, 1, 1, 1, 1, 1,
-0.3600457, -0.2526047, -2.320722, 1, 1, 1, 1, 1,
-0.359818, -0.6214224, -3.675473, 1, 1, 1, 1, 1,
-0.3545794, -0.65754, -1.913682, 1, 1, 1, 1, 1,
-0.3481612, -0.7574429, -1.623806, 0, 0, 1, 1, 1,
-0.3431844, 0.8003763, -0.009091472, 1, 0, 0, 1, 1,
-0.3426049, -1.936203, -2.3367, 1, 0, 0, 1, 1,
-0.3406498, 0.7532518, -0.1426563, 1, 0, 0, 1, 1,
-0.340322, -1.539125, -3.380457, 1, 0, 0, 1, 1,
-0.3385965, 0.4625526, 0.8720875, 1, 0, 0, 1, 1,
-0.335804, -1.035073, -1.530311, 0, 0, 0, 1, 1,
-0.3313587, 0.5684642, -1.931804, 0, 0, 0, 1, 1,
-0.3306828, -0.9134166, -4.537868, 0, 0, 0, 1, 1,
-0.3261392, 1.964305, 1.728122, 0, 0, 0, 1, 1,
-0.3231168, -0.4377827, -2.536773, 0, 0, 0, 1, 1,
-0.3221225, -0.3773094, -4.337995, 0, 0, 0, 1, 1,
-0.3220898, 0.1572556, -0.2909996, 0, 0, 0, 1, 1,
-0.3181356, -0.5076643, -3.774544, 1, 1, 1, 1, 1,
-0.3090991, 1.422973, -0.7656121, 1, 1, 1, 1, 1,
-0.3088965, 0.2959242, -1.880363, 1, 1, 1, 1, 1,
-0.3004342, 1.206239, 0.5351538, 1, 1, 1, 1, 1,
-0.2888005, 0.7705426, -2.033983, 1, 1, 1, 1, 1,
-0.288074, 1.098835, -1.072839, 1, 1, 1, 1, 1,
-0.2860769, -0.9761916, -3.062702, 1, 1, 1, 1, 1,
-0.2817615, 1.209795, -0.5821015, 1, 1, 1, 1, 1,
-0.2798694, -1.02221, -2.42353, 1, 1, 1, 1, 1,
-0.2778222, -0.01747168, -2.173119, 1, 1, 1, 1, 1,
-0.2769874, -0.9779152, -4.982802, 1, 1, 1, 1, 1,
-0.276811, 2.107948, 0.7033713, 1, 1, 1, 1, 1,
-0.26156, -0.9513977, -2.186792, 1, 1, 1, 1, 1,
-0.261424, -0.2486898, -1.262548, 1, 1, 1, 1, 1,
-0.2588313, 0.4100074, -1.433005, 1, 1, 1, 1, 1,
-0.2482537, -0.7015054, -2.353989, 0, 0, 1, 1, 1,
-0.2426252, -0.1691192, -2.252283, 1, 0, 0, 1, 1,
-0.2414917, -0.2389994, -3.339938, 1, 0, 0, 1, 1,
-0.2391888, -1.09654, -3.972198, 1, 0, 0, 1, 1,
-0.2320962, -1.539821, -2.284362, 1, 0, 0, 1, 1,
-0.2247617, -0.5800611, -2.423188, 1, 0, 0, 1, 1,
-0.2169991, 0.2732284, 0.4702467, 0, 0, 0, 1, 1,
-0.2167506, 0.03641743, -1.162858, 0, 0, 0, 1, 1,
-0.216236, -0.488054, -2.63042, 0, 0, 0, 1, 1,
-0.2150876, -0.3236719, -1.797919, 0, 0, 0, 1, 1,
-0.2150235, 0.4825509, -0.9583547, 0, 0, 0, 1, 1,
-0.2108118, -0.7502722, -1.575087, 0, 0, 0, 1, 1,
-0.2052338, -0.221357, -1.989008, 0, 0, 0, 1, 1,
-0.2001077, -1.997815, -2.72194, 1, 1, 1, 1, 1,
-0.1988696, -1.160501, -2.790624, 1, 1, 1, 1, 1,
-0.1955177, 0.9733725, -1.697464, 1, 1, 1, 1, 1,
-0.1953415, -0.5977405, -2.188957, 1, 1, 1, 1, 1,
-0.1915115, 1.08393, -0.8335524, 1, 1, 1, 1, 1,
-0.191406, 0.8318666, -1.176258, 1, 1, 1, 1, 1,
-0.1895927, 0.7591454, -0.3556585, 1, 1, 1, 1, 1,
-0.1874549, -0.7230975, -1.822739, 1, 1, 1, 1, 1,
-0.1825815, 1.559849, 1.41701, 1, 1, 1, 1, 1,
-0.1803976, 0.0871172, 0.7881764, 1, 1, 1, 1, 1,
-0.1771813, 0.9173076, -0.9959658, 1, 1, 1, 1, 1,
-0.1733869, 1.672728, 0.6606048, 1, 1, 1, 1, 1,
-0.1673359, 0.39799, -1.44537, 1, 1, 1, 1, 1,
-0.1634869, -0.5409436, -2.320761, 1, 1, 1, 1, 1,
-0.1602324, -0.7573785, -3.112316, 1, 1, 1, 1, 1,
-0.1590928, -1.452623, -3.513123, 0, 0, 1, 1, 1,
-0.1586356, -0.9182871, -0.9062572, 1, 0, 0, 1, 1,
-0.1556849, 0.2746277, -0.7127297, 1, 0, 0, 1, 1,
-0.1508714, -0.9147104, -1.739741, 1, 0, 0, 1, 1,
-0.1484774, 0.5041733, -1.741144, 1, 0, 0, 1, 1,
-0.147693, -0.6994669, -1.991088, 1, 0, 0, 1, 1,
-0.1457064, 0.5710778, -1.30774, 0, 0, 0, 1, 1,
-0.1452955, -0.9444293, -3.482842, 0, 0, 0, 1, 1,
-0.1444757, -0.05181665, -1.47505, 0, 0, 0, 1, 1,
-0.1417572, 0.2249483, -1.858479, 0, 0, 0, 1, 1,
-0.1357, 1.338964, 0.22394, 0, 0, 0, 1, 1,
-0.1344845, -0.6118297, -3.124649, 0, 0, 0, 1, 1,
-0.1326997, 0.841337, 0.5019631, 0, 0, 0, 1, 1,
-0.1240239, 1.039119, 1.840412, 1, 1, 1, 1, 1,
-0.1164727, 0.5970261, -0.9504706, 1, 1, 1, 1, 1,
-0.1140309, 1.397933, 1.403292, 1, 1, 1, 1, 1,
-0.112248, -0.5577921, -3.459996, 1, 1, 1, 1, 1,
-0.1111283, -1.359462, -2.432874, 1, 1, 1, 1, 1,
-0.1101239, 0.5559328, -1.099175, 1, 1, 1, 1, 1,
-0.1062433, -1.305945, -3.142055, 1, 1, 1, 1, 1,
-0.1011377, 0.05948271, -1.707272, 1, 1, 1, 1, 1,
-0.1005678, 1.103272, -0.5403988, 1, 1, 1, 1, 1,
-0.09968709, -1.50634, -4.149904, 1, 1, 1, 1, 1,
-0.09842172, -0.8653412, -3.151481, 1, 1, 1, 1, 1,
-0.09782632, -1.844549, -4.54254, 1, 1, 1, 1, 1,
-0.09691003, 0.0211819, -2.596926, 1, 1, 1, 1, 1,
-0.09400236, 0.4252398, 0.197112, 1, 1, 1, 1, 1,
-0.09042845, -0.05442347, -2.316521, 1, 1, 1, 1, 1,
-0.08693957, -0.6488468, -0.1760175, 0, 0, 1, 1, 1,
-0.07884074, 0.1870353, -1.524822, 1, 0, 0, 1, 1,
-0.07714725, 1.346354, -1.034906, 1, 0, 0, 1, 1,
-0.0728685, -0.1559191, -1.690047, 1, 0, 0, 1, 1,
-0.07182413, -0.6362958, -3.464349, 1, 0, 0, 1, 1,
-0.07085533, -0.3457859, -2.344621, 1, 0, 0, 1, 1,
-0.06342734, 0.2745866, -0.6748446, 0, 0, 0, 1, 1,
-0.06238773, 0.1638124, -1.375543, 0, 0, 0, 1, 1,
-0.05297881, -0.2756065, -2.060177, 0, 0, 0, 1, 1,
-0.05182952, -0.7986623, -0.719986, 0, 0, 0, 1, 1,
-0.04609029, 0.07121474, -1.628147, 0, 0, 0, 1, 1,
-0.04344362, 0.440851, 1.210086, 0, 0, 0, 1, 1,
-0.03970328, -1.109001, -1.551516, 0, 0, 0, 1, 1,
-0.0393182, -0.3133759, -1.901319, 1, 1, 1, 1, 1,
-0.03706981, 0.4996341, 2.307129, 1, 1, 1, 1, 1,
-0.03379176, 0.2553777, -0.1324738, 1, 1, 1, 1, 1,
-0.03346383, -1.070758, -1.82904, 1, 1, 1, 1, 1,
-0.03301515, -0.298112, -2.018339, 1, 1, 1, 1, 1,
-0.03020058, 2.242966, 0.1455757, 1, 1, 1, 1, 1,
-0.02649468, -0.03804801, -4.829757, 1, 1, 1, 1, 1,
-0.02640661, 0.427514, -1.124819, 1, 1, 1, 1, 1,
-0.02364383, -1.080083, -3.835186, 1, 1, 1, 1, 1,
-0.01838841, 0.1774866, 0.03328295, 1, 1, 1, 1, 1,
-0.01734591, 0.6775325, 0.9009785, 1, 1, 1, 1, 1,
-0.01400802, 0.9469903, -0.8732804, 1, 1, 1, 1, 1,
-0.01149412, 0.6598399, 0.8136196, 1, 1, 1, 1, 1,
-0.006768453, -0.381138, -2.851497, 1, 1, 1, 1, 1,
-0.006279482, -0.06960762, -2.311407, 1, 1, 1, 1, 1,
-0.002424375, 0.2552479, 0.8417584, 0, 0, 1, 1, 1,
-0.0003537111, 0.6452096, -1.77702, 1, 0, 0, 1, 1,
0.004659355, -1.809818, 5.230726, 1, 0, 0, 1, 1,
0.007864969, -0.4347818, 1.290623, 1, 0, 0, 1, 1,
0.01346529, 0.2167558, -1.680063, 1, 0, 0, 1, 1,
0.01517851, 1.702198, -1.021536, 1, 0, 0, 1, 1,
0.01584527, -0.357898, 3.323384, 0, 0, 0, 1, 1,
0.01727874, 0.6006401, 0.8221188, 0, 0, 0, 1, 1,
0.02356196, 0.4240605, 1.7088, 0, 0, 0, 1, 1,
0.02941821, 1.394665, 1.218053, 0, 0, 0, 1, 1,
0.02993682, -0.4799611, 3.106326, 0, 0, 0, 1, 1,
0.03216575, -1.354693, 3.181471, 0, 0, 0, 1, 1,
0.0342531, -3.120686, 3.256829, 0, 0, 0, 1, 1,
0.03576997, 1.799849, 0.03105798, 1, 1, 1, 1, 1,
0.03693961, -2.402564, 1.365637, 1, 1, 1, 1, 1,
0.04156446, -1.179042, 5.14226, 1, 1, 1, 1, 1,
0.04548892, -2.145172, 3.335369, 1, 1, 1, 1, 1,
0.04821509, -1.966473, 2.61954, 1, 1, 1, 1, 1,
0.04891048, 0.164336, -0.4212968, 1, 1, 1, 1, 1,
0.05035195, 1.482454, 0.4942226, 1, 1, 1, 1, 1,
0.0506587, -0.5764485, 4.639781, 1, 1, 1, 1, 1,
0.05181833, -1.111688, 1.557886, 1, 1, 1, 1, 1,
0.05262946, -0.2151673, 4.67507, 1, 1, 1, 1, 1,
0.05357646, 0.1810824, 1.463815, 1, 1, 1, 1, 1,
0.05374853, 0.4092354, 0.6540076, 1, 1, 1, 1, 1,
0.05383158, -1.011237, 1.764981, 1, 1, 1, 1, 1,
0.05437104, 0.2372031, 0.8519123, 1, 1, 1, 1, 1,
0.05475532, 2.407092, 1.689795, 1, 1, 1, 1, 1,
0.05510452, 0.1538028, 2.388244, 0, 0, 1, 1, 1,
0.06577985, 1.763052, 0.4154498, 1, 0, 0, 1, 1,
0.07037685, 0.1771019, -0.9551707, 1, 0, 0, 1, 1,
0.0770181, -0.2062398, 0.8845251, 1, 0, 0, 1, 1,
0.07752646, 0.1736369, -0.2450622, 1, 0, 0, 1, 1,
0.07912353, -0.2825728, 3.980738, 1, 0, 0, 1, 1,
0.08026151, 1.289187, -0.9598538, 0, 0, 0, 1, 1,
0.08323146, -0.8757858, 2.59291, 0, 0, 0, 1, 1,
0.08503283, 0.4922607, 0.5147061, 0, 0, 0, 1, 1,
0.08626968, 0.6497061, 1.548332, 0, 0, 0, 1, 1,
0.08630141, -0.56278, 3.467772, 0, 0, 0, 1, 1,
0.08678693, 1.533041, 1.363362, 0, 0, 0, 1, 1,
0.08849854, 0.1517418, -0.0454522, 0, 0, 0, 1, 1,
0.0887135, 0.2052247, -0.6587042, 1, 1, 1, 1, 1,
0.09453319, -0.3725047, 1.243349, 1, 1, 1, 1, 1,
0.09734296, 0.0005798404, 1.652999, 1, 1, 1, 1, 1,
0.09821833, 1.200021, -0.1703766, 1, 1, 1, 1, 1,
0.1009466, 0.4399352, 1.081365, 1, 1, 1, 1, 1,
0.1020555, -1.364742, 2.717756, 1, 1, 1, 1, 1,
0.1089469, -0.6132128, 2.579975, 1, 1, 1, 1, 1,
0.1104133, -0.2166806, 1.07539, 1, 1, 1, 1, 1,
0.1112973, 0.03450561, 0.6742007, 1, 1, 1, 1, 1,
0.1147569, -0.9705069, 2.115104, 1, 1, 1, 1, 1,
0.1152439, -0.6321658, 3.92479, 1, 1, 1, 1, 1,
0.1167547, -0.9525941, 3.444018, 1, 1, 1, 1, 1,
0.1206333, 0.141161, 0.8444943, 1, 1, 1, 1, 1,
0.1231435, -0.3243516, 3.817449, 1, 1, 1, 1, 1,
0.1294204, 0.5161071, 1.556885, 1, 1, 1, 1, 1,
0.1300474, -1.190649, 1.64535, 0, 0, 1, 1, 1,
0.1314033, 1.065489, 1.333644, 1, 0, 0, 1, 1,
0.1315675, 2.320079, -0.4765142, 1, 0, 0, 1, 1,
0.1320234, 0.3721602, 1.257197, 1, 0, 0, 1, 1,
0.1376925, -0.3917557, 3.661722, 1, 0, 0, 1, 1,
0.1436473, 0.1005683, -0.927704, 1, 0, 0, 1, 1,
0.1441962, 0.4504208, 1.420399, 0, 0, 0, 1, 1,
0.1463662, -0.648069, 1.876378, 0, 0, 0, 1, 1,
0.1469889, -0.4788502, 2.030208, 0, 0, 0, 1, 1,
0.1533433, -0.3957275, 1.559903, 0, 0, 0, 1, 1,
0.154131, -2.361231, 3.181634, 0, 0, 0, 1, 1,
0.1551363, 0.4408965, 1.519403, 0, 0, 0, 1, 1,
0.1569493, -0.6401637, 2.401755, 0, 0, 0, 1, 1,
0.1582607, -0.3706979, 1.826979, 1, 1, 1, 1, 1,
0.1593762, 0.6255116, -0.3262739, 1, 1, 1, 1, 1,
0.1609367, 1.10067, -0.09990898, 1, 1, 1, 1, 1,
0.1612023, -0.8603953, 2.125213, 1, 1, 1, 1, 1,
0.1613978, 0.05107002, 1.261401, 1, 1, 1, 1, 1,
0.1642229, -0.3269125, 3.302464, 1, 1, 1, 1, 1,
0.1650356, 1.249896, 1.689666, 1, 1, 1, 1, 1,
0.1657233, 0.2085921, 3.187011, 1, 1, 1, 1, 1,
0.1660114, 0.9455839, 0.5847381, 1, 1, 1, 1, 1,
0.1670314, -0.828546, 3.28814, 1, 1, 1, 1, 1,
0.1682734, -0.8024411, 4.367787, 1, 1, 1, 1, 1,
0.1710425, 1.141301, -0.9396331, 1, 1, 1, 1, 1,
0.1779828, -0.6488605, 4.658072, 1, 1, 1, 1, 1,
0.182407, 0.1612232, 0.5968187, 1, 1, 1, 1, 1,
0.1842126, -0.1964843, 3.385491, 1, 1, 1, 1, 1,
0.1849246, -0.0270644, 1.66249, 0, 0, 1, 1, 1,
0.1870085, -0.6288562, 2.432574, 1, 0, 0, 1, 1,
0.1871654, -1.297936, 2.948176, 1, 0, 0, 1, 1,
0.199196, 0.7587506, 0.1202101, 1, 0, 0, 1, 1,
0.203671, 0.1858563, 1.217219, 1, 0, 0, 1, 1,
0.2038638, -0.4985987, 2.867391, 1, 0, 0, 1, 1,
0.2059322, 0.306662, -0.1702925, 0, 0, 0, 1, 1,
0.2070336, -1.026734, 2.991441, 0, 0, 0, 1, 1,
0.2091179, -0.5091899, 2.174263, 0, 0, 0, 1, 1,
0.2092602, 0.8401282, -0.7091044, 0, 0, 0, 1, 1,
0.2100475, 0.8625886, 1.323426, 0, 0, 0, 1, 1,
0.2136132, -0.1334048, 2.957443, 0, 0, 0, 1, 1,
0.2153307, -0.6842909, 2.358025, 0, 0, 0, 1, 1,
0.2218958, 1.763127, 0.4552444, 1, 1, 1, 1, 1,
0.2219081, -0.4295692, 3.713755, 1, 1, 1, 1, 1,
0.2223014, -0.58094, 1.78062, 1, 1, 1, 1, 1,
0.2251814, 0.6895077, 1.355814, 1, 1, 1, 1, 1,
0.2279505, -2.213626, 3.733883, 1, 1, 1, 1, 1,
0.232472, 1.89074, 1.93652, 1, 1, 1, 1, 1,
0.2339607, 0.2779827, 0.1195101, 1, 1, 1, 1, 1,
0.241178, -0.558594, 2.866481, 1, 1, 1, 1, 1,
0.2480608, -0.2632442, 2.930391, 1, 1, 1, 1, 1,
0.253365, -0.09603996, 1.495061, 1, 1, 1, 1, 1,
0.2536556, -0.2157333, 2.194572, 1, 1, 1, 1, 1,
0.2538375, 0.4138786, -0.3071923, 1, 1, 1, 1, 1,
0.2539973, -1.056054, 1.777161, 1, 1, 1, 1, 1,
0.2608269, -0.983558, 3.410189, 1, 1, 1, 1, 1,
0.2615622, -1.264423, 3.096382, 1, 1, 1, 1, 1,
0.2644031, 0.4596877, 0.02274046, 0, 0, 1, 1, 1,
0.2654177, 1.349983, 0.07816336, 1, 0, 0, 1, 1,
0.2658718, 1.638746, 0.3390397, 1, 0, 0, 1, 1,
0.2670487, -1.148832, 2.261403, 1, 0, 0, 1, 1,
0.2729055, 0.04761053, 2.177604, 1, 0, 0, 1, 1,
0.2729307, 2.083747, 1.996669, 1, 0, 0, 1, 1,
0.2759256, 0.8510652, 0.5417152, 0, 0, 0, 1, 1,
0.2781384, 0.1707468, 0.7920784, 0, 0, 0, 1, 1,
0.280374, -0.3159891, 3.405588, 0, 0, 0, 1, 1,
0.2804737, -0.1073375, 3.782319, 0, 0, 0, 1, 1,
0.2828321, -0.9292131, 3.572497, 0, 0, 0, 1, 1,
0.2849477, 1.322911, 1.173766, 0, 0, 0, 1, 1,
0.2878871, 0.5014052, 1.213705, 0, 0, 0, 1, 1,
0.2902643, -1.941759, 2.770845, 1, 1, 1, 1, 1,
0.2906429, -0.3333289, 2.530185, 1, 1, 1, 1, 1,
0.2967063, -0.6431749, 2.966122, 1, 1, 1, 1, 1,
0.2973224, -0.6148039, 3.546791, 1, 1, 1, 1, 1,
0.2993217, 0.3562433, 1.337982, 1, 1, 1, 1, 1,
0.3022144, 0.4356655, 2.124245, 1, 1, 1, 1, 1,
0.3044093, 1.698363, -0.9993349, 1, 1, 1, 1, 1,
0.3087536, 0.2886444, -1.931929, 1, 1, 1, 1, 1,
0.3095079, -0.9977531, 2.500985, 1, 1, 1, 1, 1,
0.3200538, -1.073549, 1.560282, 1, 1, 1, 1, 1,
0.3238462, -0.1636155, 2.778498, 1, 1, 1, 1, 1,
0.330667, 1.500969, -0.1846911, 1, 1, 1, 1, 1,
0.3322329, 0.4842384, 0.5918801, 1, 1, 1, 1, 1,
0.3366616, 0.2240896, 1.665982, 1, 1, 1, 1, 1,
0.3395944, -0.5231071, 1.792214, 1, 1, 1, 1, 1,
0.3398945, -0.02106597, 0.3312079, 0, 0, 1, 1, 1,
0.3433365, -0.2375567, 2.318378, 1, 0, 0, 1, 1,
0.3523839, 0.7692076, 0.6440615, 1, 0, 0, 1, 1,
0.3546469, -0.09763308, 0.5395899, 1, 0, 0, 1, 1,
0.3573727, -0.8011119, 2.155789, 1, 0, 0, 1, 1,
0.3613647, -0.2868092, 1.956706, 1, 0, 0, 1, 1,
0.3617744, -1.074211, 4.19546, 0, 0, 0, 1, 1,
0.3639627, -0.2985302, 3.422744, 0, 0, 0, 1, 1,
0.3642712, 0.8686814, 0.6560813, 0, 0, 0, 1, 1,
0.3711052, 0.8539446, 1.335927, 0, 0, 0, 1, 1,
0.3765669, -2.597554, 1.374331, 0, 0, 0, 1, 1,
0.3774373, 0.392661, 1.59683, 0, 0, 0, 1, 1,
0.380446, 1.052746, 0.2892686, 0, 0, 0, 1, 1,
0.3833309, -0.1735009, 1.897509, 1, 1, 1, 1, 1,
0.3854389, 0.3485011, 1.811242, 1, 1, 1, 1, 1,
0.393197, 0.3495073, 3.146104, 1, 1, 1, 1, 1,
0.3960953, -1.472114, 2.607451, 1, 1, 1, 1, 1,
0.4000832, 0.1175045, 1.587658, 1, 1, 1, 1, 1,
0.4006004, 1.743921, 0.3535146, 1, 1, 1, 1, 1,
0.4011961, -0.2957361, 3.707164, 1, 1, 1, 1, 1,
0.4060553, -0.55509, 1.968692, 1, 1, 1, 1, 1,
0.4070945, 2.394368, -0.11521, 1, 1, 1, 1, 1,
0.4076598, -0.600974, 3.710574, 1, 1, 1, 1, 1,
0.4089565, 1.025553, -2.002948, 1, 1, 1, 1, 1,
0.4108074, 1.468954, -0.3086599, 1, 1, 1, 1, 1,
0.4167209, -0.7409305, 2.865469, 1, 1, 1, 1, 1,
0.419843, 1.755576, -0.4788909, 1, 1, 1, 1, 1,
0.4199785, -0.2955348, 1.048673, 1, 1, 1, 1, 1,
0.4216216, 0.3571432, 0.8341274, 0, 0, 1, 1, 1,
0.4326934, -0.5507197, 2.764498, 1, 0, 0, 1, 1,
0.4431553, -0.279625, 0.7131603, 1, 0, 0, 1, 1,
0.4463044, 0.3026591, 1.477259, 1, 0, 0, 1, 1,
0.4498639, 0.711112, 2.121313, 1, 0, 0, 1, 1,
0.4513918, 0.690106, 1.170395, 1, 0, 0, 1, 1,
0.452829, 0.8269247, 1.462067, 0, 0, 0, 1, 1,
0.4541683, 0.2013642, 2.065418, 0, 0, 0, 1, 1,
0.4562338, -1.234139, 3.436092, 0, 0, 0, 1, 1,
0.4579816, -0.03735868, 2.219805, 0, 0, 0, 1, 1,
0.4581966, -0.2706737, 2.238292, 0, 0, 0, 1, 1,
0.4618824, -1.272779, 2.147803, 0, 0, 0, 1, 1,
0.4621226, -0.410399, 2.610393, 0, 0, 0, 1, 1,
0.4635705, 1.365147, -0.08085909, 1, 1, 1, 1, 1,
0.4656053, -0.4816139, 2.772178, 1, 1, 1, 1, 1,
0.4687052, 0.2139047, -0.4989721, 1, 1, 1, 1, 1,
0.4700406, 1.0538, 0.9033871, 1, 1, 1, 1, 1,
0.4768926, -0.2371732, 3.945823, 1, 1, 1, 1, 1,
0.480538, 0.4750921, 1.016019, 1, 1, 1, 1, 1,
0.4838619, 0.4704295, 0.3213864, 1, 1, 1, 1, 1,
0.4847185, 1.816053, 1.142156, 1, 1, 1, 1, 1,
0.4874698, 0.02401486, -0.3298931, 1, 1, 1, 1, 1,
0.4903232, -1.157933, 2.685893, 1, 1, 1, 1, 1,
0.4922985, 1.528217, 1.247951, 1, 1, 1, 1, 1,
0.4947271, 0.1085618, 0.4576593, 1, 1, 1, 1, 1,
0.5137955, 0.7323667, 1.2497, 1, 1, 1, 1, 1,
0.5317787, 0.7717373, -0.4431921, 1, 1, 1, 1, 1,
0.5323365, -1.12488, 2.609125, 1, 1, 1, 1, 1,
0.5330108, -2.083229, 2.733589, 0, 0, 1, 1, 1,
0.5350986, 1.947735, -0.4354179, 1, 0, 0, 1, 1,
0.5395262, 0.1791354, 0.2897692, 1, 0, 0, 1, 1,
0.5432319, -0.3594805, 3.027517, 1, 0, 0, 1, 1,
0.5436439, -0.2649793, 4.46686, 1, 0, 0, 1, 1,
0.5437403, 0.6627058, -0.6170886, 1, 0, 0, 1, 1,
0.5490709, -1.976547, 4.802014, 0, 0, 0, 1, 1,
0.5584559, 0.1923326, 0.1064141, 0, 0, 0, 1, 1,
0.5588284, -0.5183887, 2.98567, 0, 0, 0, 1, 1,
0.5590397, -0.2192708, 3.118222, 0, 0, 0, 1, 1,
0.559764, 0.01718799, 1.811106, 0, 0, 0, 1, 1,
0.5612803, -0.8583543, 2.361214, 0, 0, 0, 1, 1,
0.5632712, -0.07250083, 1.989062, 0, 0, 0, 1, 1,
0.5782201, 0.02017039, 2.152562, 1, 1, 1, 1, 1,
0.579464, 0.9572113, 1.551319, 1, 1, 1, 1, 1,
0.5816221, 1.27686, 1.257407, 1, 1, 1, 1, 1,
0.5847686, -0.4807757, 2.165869, 1, 1, 1, 1, 1,
0.5858139, 0.3962663, 1.132112, 1, 1, 1, 1, 1,
0.5919526, -0.5919727, 2.164193, 1, 1, 1, 1, 1,
0.6029927, -0.3234558, -0.08158047, 1, 1, 1, 1, 1,
0.6045227, -1.881901, 3.955967, 1, 1, 1, 1, 1,
0.6057873, 0.2460199, 2.55387, 1, 1, 1, 1, 1,
0.6065504, -0.2924489, 3.430409, 1, 1, 1, 1, 1,
0.6075886, -0.7456905, 1.303481, 1, 1, 1, 1, 1,
0.6119053, -1.514827, 3.906145, 1, 1, 1, 1, 1,
0.6132252, 0.6091875, 1.074973, 1, 1, 1, 1, 1,
0.6159517, -0.4120094, 2.132854, 1, 1, 1, 1, 1,
0.6215386, 0.08106165, -0.6320041, 1, 1, 1, 1, 1,
0.6219192, 0.3448313, 1.602363, 0, 0, 1, 1, 1,
0.6225227, 0.05640833, 2.962864, 1, 0, 0, 1, 1,
0.6246063, -1.091026, 2.303504, 1, 0, 0, 1, 1,
0.6250489, 1.143607, 0.00947244, 1, 0, 0, 1, 1,
0.6262082, 0.548035, 0.1302058, 1, 0, 0, 1, 1,
0.626728, -0.1134062, 2.838152, 1, 0, 0, 1, 1,
0.6289491, -0.02323149, 1.927427, 0, 0, 0, 1, 1,
0.6311117, 1.508178, 0.2394994, 0, 0, 0, 1, 1,
0.6332561, 1.211485, 0.8454009, 0, 0, 0, 1, 1,
0.6358644, 2.260613, -0.1637007, 0, 0, 0, 1, 1,
0.6366043, -0.5559125, 1.392079, 0, 0, 0, 1, 1,
0.6417831, -1.738793, 2.611039, 0, 0, 0, 1, 1,
0.6425079, -0.4896027, 2.075361, 0, 0, 0, 1, 1,
0.643732, 0.4902987, 1.685506, 1, 1, 1, 1, 1,
0.6448022, -0.499855, 0.6608506, 1, 1, 1, 1, 1,
0.6462844, 0.08306906, 2.437302, 1, 1, 1, 1, 1,
0.6463627, 0.9806516, 1.683245, 1, 1, 1, 1, 1,
0.6473722, -0.2052338, 0.6143913, 1, 1, 1, 1, 1,
0.6481132, 0.3183679, 2.368017, 1, 1, 1, 1, 1,
0.6557053, 0.1541564, 1.918017, 1, 1, 1, 1, 1,
0.6558136, 0.2264255, 2.097657, 1, 1, 1, 1, 1,
0.6559111, 0.62067, 1.892089, 1, 1, 1, 1, 1,
0.6570404, -0.1231419, 1.127084, 1, 1, 1, 1, 1,
0.6648312, 0.4000084, 1.070857, 1, 1, 1, 1, 1,
0.6730652, -0.2236117, 0.9473932, 1, 1, 1, 1, 1,
0.675342, -0.591807, 1.554793, 1, 1, 1, 1, 1,
0.6787351, -0.7787311, 3.43716, 1, 1, 1, 1, 1,
0.6795628, 1.650752, 1.806378, 1, 1, 1, 1, 1,
0.6809208, -0.5624317, 1.917387, 0, 0, 1, 1, 1,
0.6820915, -0.899246, 5.232279, 1, 0, 0, 1, 1,
0.6823693, 0.8360392, -1.111698, 1, 0, 0, 1, 1,
0.6823926, -1.073823, 1.429062, 1, 0, 0, 1, 1,
0.6859114, 0.008146896, 2.452344, 1, 0, 0, 1, 1,
0.6864213, 1.279417, 0.3148773, 1, 0, 0, 1, 1,
0.6897304, 0.3853066, 1.11093, 0, 0, 0, 1, 1,
0.6929989, -0.5222404, 1.783985, 0, 0, 0, 1, 1,
0.7050253, 0.4334511, 2.418057, 0, 0, 0, 1, 1,
0.7127607, -0.7405154, 2.596976, 0, 0, 0, 1, 1,
0.7171323, -1.218774, 1.795107, 0, 0, 0, 1, 1,
0.7223939, -0.2464973, 2.913811, 0, 0, 0, 1, 1,
0.7326505, 0.01999012, -0.4676602, 0, 0, 0, 1, 1,
0.736092, -0.1793449, 1.430885, 1, 1, 1, 1, 1,
0.7364596, 0.07972615, 1.40337, 1, 1, 1, 1, 1,
0.7370583, -0.8436787, 1.116994, 1, 1, 1, 1, 1,
0.739476, 0.4070102, 0.3064126, 1, 1, 1, 1, 1,
0.7413517, -0.4530073, 0.6685885, 1, 1, 1, 1, 1,
0.7413658, 0.5209944, 1.805853, 1, 1, 1, 1, 1,
0.7431918, -0.9760599, 4.339511, 1, 1, 1, 1, 1,
0.751538, -0.2636242, 0.2694369, 1, 1, 1, 1, 1,
0.7555915, 1.17535, 0.4894693, 1, 1, 1, 1, 1,
0.7560021, 1.122462, 0.7284033, 1, 1, 1, 1, 1,
0.756366, 0.8556076, 1.299472, 1, 1, 1, 1, 1,
0.7645528, -0.4664242, 3.131212, 1, 1, 1, 1, 1,
0.7646565, -0.9647216, 3.422826, 1, 1, 1, 1, 1,
0.7685429, -1.062658, 3.396434, 1, 1, 1, 1, 1,
0.7704987, 0.6068463, 0.2957197, 1, 1, 1, 1, 1,
0.7722586, -0.281008, 1.058797, 0, 0, 1, 1, 1,
0.7740299, 0.8019946, 0.6478565, 1, 0, 0, 1, 1,
0.7766114, -0.9617927, 2.892484, 1, 0, 0, 1, 1,
0.7771295, 1.131884, 0.2909021, 1, 0, 0, 1, 1,
0.7840265, -0.2395058, 1.726203, 1, 0, 0, 1, 1,
0.7842848, 0.8965812, 1.647543, 1, 0, 0, 1, 1,
0.7866809, -0.9860436, 3.1314, 0, 0, 0, 1, 1,
0.7932633, 0.4131394, 1.913917, 0, 0, 0, 1, 1,
0.7989247, -1.693367, 1.283674, 0, 0, 0, 1, 1,
0.8056591, -1.181718, 0.2580474, 0, 0, 0, 1, 1,
0.8091229, 0.1327863, 3.708252, 0, 0, 0, 1, 1,
0.8098214, 0.4166571, 1.031209, 0, 0, 0, 1, 1,
0.8146123, 0.7793107, 0.4732358, 0, 0, 0, 1, 1,
0.8153774, 1.752027, 0.3623387, 1, 1, 1, 1, 1,
0.8157133, 0.1262522, 2.477401, 1, 1, 1, 1, 1,
0.8159261, 0.4029824, -0.2505475, 1, 1, 1, 1, 1,
0.8167972, 0.8345265, 1.841101, 1, 1, 1, 1, 1,
0.818299, 0.8604196, 0.9972371, 1, 1, 1, 1, 1,
0.8189614, -0.3092885, 2.636867, 1, 1, 1, 1, 1,
0.8211235, 0.4954313, 0.8647171, 1, 1, 1, 1, 1,
0.8212275, -1.174378, 3.227338, 1, 1, 1, 1, 1,
0.8224073, 0.4416352, 0.5876796, 1, 1, 1, 1, 1,
0.8227789, 0.7768857, -1.50283, 1, 1, 1, 1, 1,
0.8237138, 0.2070693, 1.189307, 1, 1, 1, 1, 1,
0.8267782, -0.3584365, 1.173756, 1, 1, 1, 1, 1,
0.8288482, 0.02557235, 0.3541435, 1, 1, 1, 1, 1,
0.8363118, -0.4142213, 0.9976637, 1, 1, 1, 1, 1,
0.840392, 2.102503, -1.825189, 1, 1, 1, 1, 1,
0.8425137, 0.5257135, 0.1717467, 0, 0, 1, 1, 1,
0.8437018, -0.03370713, 2.014452, 1, 0, 0, 1, 1,
0.8458381, 1.714728, 0.6678262, 1, 0, 0, 1, 1,
0.8550571, -0.8800681, -0.1685752, 1, 0, 0, 1, 1,
0.8559376, 0.5393735, 0.6164647, 1, 0, 0, 1, 1,
0.8561296, -0.7256843, 2.194459, 1, 0, 0, 1, 1,
0.8625584, 0.1808342, 1.92664, 0, 0, 0, 1, 1,
0.8669715, -0.5369583, 2.572724, 0, 0, 0, 1, 1,
0.8697991, -0.2207778, 1.889509, 0, 0, 0, 1, 1,
0.871846, 0.07579405, 2.287971, 0, 0, 0, 1, 1,
0.8827448, -1.455522, 1.227789, 0, 0, 0, 1, 1,
0.896668, -0.2914497, 1.212998, 0, 0, 0, 1, 1,
0.8974918, 0.1204462, -0.5426078, 0, 0, 0, 1, 1,
0.8982378, 0.05640088, 2.807172, 1, 1, 1, 1, 1,
0.8991816, 0.5691031, -0.7774833, 1, 1, 1, 1, 1,
0.9016412, 0.09607261, 2.177846, 1, 1, 1, 1, 1,
0.9059188, 1.025492, 0.8292666, 1, 1, 1, 1, 1,
0.9072142, -1.160818, 3.68062, 1, 1, 1, 1, 1,
0.9091657, 0.3712474, 0.6906636, 1, 1, 1, 1, 1,
0.9093203, 2.187569, -0.6890957, 1, 1, 1, 1, 1,
0.9113836, -0.05680848, 1.09963, 1, 1, 1, 1, 1,
0.9118139, -0.7048227, 1.783144, 1, 1, 1, 1, 1,
0.913656, 1.390281, 0.733401, 1, 1, 1, 1, 1,
0.9209501, 0.4562858, 0.8214569, 1, 1, 1, 1, 1,
0.9219301, 0.5481933, -0.01208205, 1, 1, 1, 1, 1,
0.9288771, -0.4182759, 1.299156, 1, 1, 1, 1, 1,
0.9357865, 0.106137, 1.686145, 1, 1, 1, 1, 1,
0.9405016, 1.315066, -0.5042323, 1, 1, 1, 1, 1,
0.9438128, 0.7793873, 0.818526, 0, 0, 1, 1, 1,
0.9463035, 0.8944827, -0.0688179, 1, 0, 0, 1, 1,
0.9494143, 0.1815127, 1.278608, 1, 0, 0, 1, 1,
0.9504581, 1.33018, 0.5429095, 1, 0, 0, 1, 1,
0.952051, 0.9446904, 1.71042, 1, 0, 0, 1, 1,
0.9537079, -1.844521, 2.993605, 1, 0, 0, 1, 1,
0.9578218, -0.9684584, 2.284382, 0, 0, 0, 1, 1,
0.9620213, -1.981264, 3.798054, 0, 0, 0, 1, 1,
0.9639924, -1.292783, 5.542102, 0, 0, 0, 1, 1,
0.9687204, -0.2552843, 1.164619, 0, 0, 0, 1, 1,
0.9756794, -0.3238668, 1.443644, 0, 0, 0, 1, 1,
0.9793163, 1.07333, 1.418128, 0, 0, 0, 1, 1,
0.9817582, 0.6408108, 1.732746, 0, 0, 0, 1, 1,
0.9835607, -1.014954, 2.332262, 1, 1, 1, 1, 1,
0.9849741, -0.3965717, 0.262401, 1, 1, 1, 1, 1,
0.9856234, 1.384945, 0.4835504, 1, 1, 1, 1, 1,
0.9857079, 1.342224, -0.5387129, 1, 1, 1, 1, 1,
0.9893903, -0.4288537, 2.60504, 1, 1, 1, 1, 1,
0.9949754, 1.921799, 0.1312682, 1, 1, 1, 1, 1,
0.9955158, -0.4374319, 1.109903, 1, 1, 1, 1, 1,
1.005528, 0.7568529, 1.52616, 1, 1, 1, 1, 1,
1.006264, 1.111117, 1.789115, 1, 1, 1, 1, 1,
1.007356, -0.379956, 3.053195, 1, 1, 1, 1, 1,
1.010231, -1.107025, 2.790104, 1, 1, 1, 1, 1,
1.015241, 0.4785461, 0.3354381, 1, 1, 1, 1, 1,
1.01806, -0.9593508, 1.699335, 1, 1, 1, 1, 1,
1.019809, 2.790316, -0.8667418, 1, 1, 1, 1, 1,
1.022461, -1.986448, 4.939662, 1, 1, 1, 1, 1,
1.028351, -0.1024705, 1.992338, 0, 0, 1, 1, 1,
1.032078, -1.073521, 1.890151, 1, 0, 0, 1, 1,
1.032941, 0.3490601, 1.121502, 1, 0, 0, 1, 1,
1.033149, -1.064367, 2.593376, 1, 0, 0, 1, 1,
1.039773, -0.3134547, 1.466043, 1, 0, 0, 1, 1,
1.052894, 0.4746743, 1.768212, 1, 0, 0, 1, 1,
1.054014, 0.1034247, 2.363101, 0, 0, 0, 1, 1,
1.058444, -1.382146, 2.029221, 0, 0, 0, 1, 1,
1.058797, 1.54148, 0.2934346, 0, 0, 0, 1, 1,
1.071459, -1.230572, 1.184857, 0, 0, 0, 1, 1,
1.076067, -0.2397579, 1.139264, 0, 0, 0, 1, 1,
1.077088, 0.6019044, 0.9531798, 0, 0, 0, 1, 1,
1.078819, 1.254783, -0.5892376, 0, 0, 0, 1, 1,
1.084123, -1.575939, 2.732583, 1, 1, 1, 1, 1,
1.084614, 2.287432, -0.4059996, 1, 1, 1, 1, 1,
1.088247, -1.339563, 3.555118, 1, 1, 1, 1, 1,
1.088462, -0.8538409, 2.037389, 1, 1, 1, 1, 1,
1.091977, 1.124903, -0.225624, 1, 1, 1, 1, 1,
1.093356, -0.6640638, 3.447825, 1, 1, 1, 1, 1,
1.093901, -0.3496678, 0.452525, 1, 1, 1, 1, 1,
1.094216, -1.04798, 1.255139, 1, 1, 1, 1, 1,
1.105388, 0.5255055, -0.7922149, 1, 1, 1, 1, 1,
1.113492, -0.7448293, 1.681174, 1, 1, 1, 1, 1,
1.114644, 1.713628, -0.8685722, 1, 1, 1, 1, 1,
1.116989, -1.699681, 4.131559, 1, 1, 1, 1, 1,
1.117618, 0.3898339, 1.396704, 1, 1, 1, 1, 1,
1.123534, -1.036797, 1.04262, 1, 1, 1, 1, 1,
1.125702, -0.4947745, 3.137175, 1, 1, 1, 1, 1,
1.125932, -0.4507088, 2.653498, 0, 0, 1, 1, 1,
1.128364, -0.4488192, 1.858441, 1, 0, 0, 1, 1,
1.144871, 0.1185433, 2.660719, 1, 0, 0, 1, 1,
1.146708, 0.9926654, 2.882434, 1, 0, 0, 1, 1,
1.157642, 1.429124, 0.7074517, 1, 0, 0, 1, 1,
1.160618, -1.196671, 2.112348, 1, 0, 0, 1, 1,
1.161737, -0.6324629, 0.04508068, 0, 0, 0, 1, 1,
1.163939, 0.3695368, 2.220979, 0, 0, 0, 1, 1,
1.16425, -0.06461474, 2.584567, 0, 0, 0, 1, 1,
1.171509, 0.3292572, 1.012693, 0, 0, 0, 1, 1,
1.176316, -0.7117607, 1.702436, 0, 0, 0, 1, 1,
1.191243, -0.7470781, 2.008713, 0, 0, 0, 1, 1,
1.197019, -0.5257197, 2.190953, 0, 0, 0, 1, 1,
1.202214, 0.1852532, 1.694995, 1, 1, 1, 1, 1,
1.208029, 0.06492604, 1.443862, 1, 1, 1, 1, 1,
1.212062, 1.148429, 0.7013296, 1, 1, 1, 1, 1,
1.213223, 0.9266233, -0.1583015, 1, 1, 1, 1, 1,
1.21646, 0.08051987, 1.43564, 1, 1, 1, 1, 1,
1.219584, 0.3895535, 2.855947, 1, 1, 1, 1, 1,
1.224159, 1.130557, -0.8152885, 1, 1, 1, 1, 1,
1.22463, -0.07318685, 2.961691, 1, 1, 1, 1, 1,
1.224715, 0.6151868, 0.4402107, 1, 1, 1, 1, 1,
1.226795, 1.37535, -0.381333, 1, 1, 1, 1, 1,
1.226975, -0.2838017, 3.331148, 1, 1, 1, 1, 1,
1.232412, 0.4399308, 2.193701, 1, 1, 1, 1, 1,
1.249861, -0.1745556, 3.60138, 1, 1, 1, 1, 1,
1.253027, -0.3258294, 1.682714, 1, 1, 1, 1, 1,
1.25509, 0.1936863, 2.992926, 1, 1, 1, 1, 1,
1.255437, -1.243613, 1.954465, 0, 0, 1, 1, 1,
1.258098, 0.3911053, 1.75323, 1, 0, 0, 1, 1,
1.269918, -1.494839, 1.979455, 1, 0, 0, 1, 1,
1.270263, -1.79811, 3.454731, 1, 0, 0, 1, 1,
1.270432, 0.02959438, 0.8740135, 1, 0, 0, 1, 1,
1.279419, 0.8669565, 0.6884587, 1, 0, 0, 1, 1,
1.280275, -0.5195155, -0.2106209, 0, 0, 0, 1, 1,
1.280396, 0.7693222, 1.156286, 0, 0, 0, 1, 1,
1.289901, -2.212574, 2.468518, 0, 0, 0, 1, 1,
1.29877, -2.821432, 3.559862, 0, 0, 0, 1, 1,
1.302322, -0.271412, 1.953839, 0, 0, 0, 1, 1,
1.305935, -0.509255, 2.549138, 0, 0, 0, 1, 1,
1.310388, -0.9795926, 2.046615, 0, 0, 0, 1, 1,
1.321882, 0.8473063, 0.4799976, 1, 1, 1, 1, 1,
1.330512, -0.2975041, 2.689375, 1, 1, 1, 1, 1,
1.333632, 0.5483461, 0.6664508, 1, 1, 1, 1, 1,
1.33495, -0.6259393, 1.260311, 1, 1, 1, 1, 1,
1.338655, -0.6497603, 2.51918, 1, 1, 1, 1, 1,
1.36233, 1.548585, -0.2014006, 1, 1, 1, 1, 1,
1.363305, -1.528327, 3.057012, 1, 1, 1, 1, 1,
1.365796, -0.01084736, 0.1905429, 1, 1, 1, 1, 1,
1.377767, 1.036536, -0.6969907, 1, 1, 1, 1, 1,
1.380082, -0.6374088, 1.541797, 1, 1, 1, 1, 1,
1.393782, 1.171947, -0.009078858, 1, 1, 1, 1, 1,
1.394297, -0.09954579, 2.811178, 1, 1, 1, 1, 1,
1.398048, 1.5722, 1.026046, 1, 1, 1, 1, 1,
1.409377, 1.467326, 0.428822, 1, 1, 1, 1, 1,
1.432329, -1.079788, 2.114209, 1, 1, 1, 1, 1,
1.439245, -0.3491206, 0.9835757, 0, 0, 1, 1, 1,
1.442516, 1.68174, 0.1710897, 1, 0, 0, 1, 1,
1.444605, 0.6136004, -0.7307497, 1, 0, 0, 1, 1,
1.445166, 2.045855, -1.801547, 1, 0, 0, 1, 1,
1.462697, 0.4195106, 1.412368, 1, 0, 0, 1, 1,
1.465014, -1.401325, 0.9404551, 1, 0, 0, 1, 1,
1.468897, 2.278613, -0.3757119, 0, 0, 0, 1, 1,
1.480217, -0.1228924, 0.1876386, 0, 0, 0, 1, 1,
1.482828, -0.1721053, 2.320034, 0, 0, 0, 1, 1,
1.487758, 1.172016, 1.192679, 0, 0, 0, 1, 1,
1.500183, 0.5287861, 1.568218, 0, 0, 0, 1, 1,
1.50413, 0.3193094, 0.8032603, 0, 0, 0, 1, 1,
1.508547, 1.705745, 0.03619406, 0, 0, 0, 1, 1,
1.517304, 0.1329915, 1.904176, 1, 1, 1, 1, 1,
1.518654, -0.7210505, 1.309602, 1, 1, 1, 1, 1,
1.526559, 0.7450176, -0.3713681, 1, 1, 1, 1, 1,
1.54602, 0.2711559, 0.5125527, 1, 1, 1, 1, 1,
1.555478, 0.09245899, 1.492973, 1, 1, 1, 1, 1,
1.562596, -1.569354, 1.956942, 1, 1, 1, 1, 1,
1.564655, -0.1881861, 1.834595, 1, 1, 1, 1, 1,
1.5753, -3.33349, 2.682072, 1, 1, 1, 1, 1,
1.59421, 0.4629419, 1.356737, 1, 1, 1, 1, 1,
1.595371, -1.071269, 1.175598, 1, 1, 1, 1, 1,
1.5961, -0.7302451, 2.496394, 1, 1, 1, 1, 1,
1.62628, -0.05523764, 1.389451, 1, 1, 1, 1, 1,
1.628065, 0.2631194, 2.121213, 1, 1, 1, 1, 1,
1.633854, -0.3041594, 2.497581, 1, 1, 1, 1, 1,
1.635237, -0.2122855, 3.537871, 1, 1, 1, 1, 1,
1.638691, 0.3571649, -0.355502, 0, 0, 1, 1, 1,
1.652605, -0.9481444, 1.376075, 1, 0, 0, 1, 1,
1.653832, -0.4584821, 0.5706891, 1, 0, 0, 1, 1,
1.683754, -1.011922, 3.580469, 1, 0, 0, 1, 1,
1.70069, 1.357288, 1.42751, 1, 0, 0, 1, 1,
1.708401, -0.0296929, 0.9998527, 1, 0, 0, 1, 1,
1.752943, 0.8583393, 0.8858108, 0, 0, 0, 1, 1,
1.761802, -1.074923, 1.838484, 0, 0, 0, 1, 1,
1.769277, 0.02142581, 2.656717, 0, 0, 0, 1, 1,
1.775215, 0.9763924, 1.721466, 0, 0, 0, 1, 1,
1.795133, -0.2928962, 2.080341, 0, 0, 0, 1, 1,
1.796639, -0.1691208, 0.3798889, 0, 0, 0, 1, 1,
1.803044, 0.5508298, 0.5348099, 0, 0, 0, 1, 1,
1.813575, -0.1302618, 0.04046071, 1, 1, 1, 1, 1,
1.829354, 1.34838, 1.524207, 1, 1, 1, 1, 1,
1.833035, -0.402613, 2.676921, 1, 1, 1, 1, 1,
1.840752, 0.1951398, 2.344025, 1, 1, 1, 1, 1,
1.872664, -0.3607861, 1.539904, 1, 1, 1, 1, 1,
1.873353, 1.301481, 2.815552, 1, 1, 1, 1, 1,
1.945981, 0.2861856, 2.447927, 1, 1, 1, 1, 1,
1.948682, 0.7801749, 0.01004763, 1, 1, 1, 1, 1,
1.954098, -0.4773315, 1.196257, 1, 1, 1, 1, 1,
1.955701, -0.5401952, 1.186836, 1, 1, 1, 1, 1,
1.965994, 0.6852667, 0.5164733, 1, 1, 1, 1, 1,
2.04229, 0.1570524, 2.460651, 1, 1, 1, 1, 1,
2.066817, -1.622191, 3.443426, 1, 1, 1, 1, 1,
2.119081, -1.429768, 2.509375, 1, 1, 1, 1, 1,
2.120217, 0.3689403, 2.706471, 1, 1, 1, 1, 1,
2.155322, -1.705216, 2.674115, 0, 0, 1, 1, 1,
2.174812, 1.230295, 2.399434, 1, 0, 0, 1, 1,
2.223285, 0.5583205, 0.4471343, 1, 0, 0, 1, 1,
2.254363, 0.3278959, 3.959563, 1, 0, 0, 1, 1,
2.262488, 0.4057531, -0.5131549, 1, 0, 0, 1, 1,
2.298171, 0.5342277, 1.753096, 1, 0, 0, 1, 1,
2.306451, 0.2070442, 1.838967, 0, 0, 0, 1, 1,
2.30869, -0.8806394, 2.327343, 0, 0, 0, 1, 1,
2.360252, -1.301333, 2.927037, 0, 0, 0, 1, 1,
2.394235, -0.2685072, 0.6518141, 0, 0, 0, 1, 1,
2.402789, 2.500208, 1.095904, 0, 0, 0, 1, 1,
2.413142, -1.816777, 1.387528, 0, 0, 0, 1, 1,
2.456314, 0.6997957, 0.8200238, 0, 0, 0, 1, 1,
2.474158, -1.122106, 3.813877, 1, 1, 1, 1, 1,
2.517743, -0.3403609, 1.530597, 1, 1, 1, 1, 1,
2.733298, -1.274636, 2.344225, 1, 1, 1, 1, 1,
2.786199, -1.01451, 2.700907, 1, 1, 1, 1, 1,
2.956129, -0.6185989, -1.069404, 1, 1, 1, 1, 1,
2.998737, 0.4447465, 1.528884, 1, 1, 1, 1, 1,
3.641494, 0.3717477, 1.11934, 1, 1, 1, 1, 1
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
var radius = 9.521055;
var distance = 33.4423;
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
mvMatrix.translate( -0.3804829, 0.2284803, -0.2246313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.4423);
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
