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
-3.012676, 1.26681, -0.784816, 1, 0, 0, 1,
-3.009129, 0.07954453, -0.130696, 1, 0.007843138, 0, 1,
-2.79192, 0.8247178, -2.218472, 1, 0.01176471, 0, 1,
-2.696352, -2.376763, -1.199166, 1, 0.01960784, 0, 1,
-2.6604, -0.04187003, -1.238223, 1, 0.02352941, 0, 1,
-2.616263, 0.6653757, -0.908215, 1, 0.03137255, 0, 1,
-2.528603, -0.4780664, -1.482499, 1, 0.03529412, 0, 1,
-2.498403, -0.7088383, -3.121614, 1, 0.04313726, 0, 1,
-2.49359, 0.3773356, -1.035691, 1, 0.04705882, 0, 1,
-2.436589, -0.3134506, -4.129025, 1, 0.05490196, 0, 1,
-2.374964, 0.8089887, -1.179339, 1, 0.05882353, 0, 1,
-2.323959, -0.3465413, -0.6540347, 1, 0.06666667, 0, 1,
-2.295726, 0.02301522, -0.8186933, 1, 0.07058824, 0, 1,
-2.246389, -0.5480673, -0.9413002, 1, 0.07843138, 0, 1,
-2.230869, -0.9035131, -2.60509, 1, 0.08235294, 0, 1,
-2.230178, -0.1079334, -4.019971, 1, 0.09019608, 0, 1,
-2.225359, 0.5490953, 0.8813578, 1, 0.09411765, 0, 1,
-2.22034, 1.005834, -1.101172, 1, 0.1019608, 0, 1,
-2.200982, -0.764118, -2.058131, 1, 0.1098039, 0, 1,
-2.191212, 0.3659812, -0.5037525, 1, 0.1137255, 0, 1,
-2.18461, -0.4130639, -0.8169163, 1, 0.1215686, 0, 1,
-2.155295, 0.1236077, -1.816152, 1, 0.1254902, 0, 1,
-2.150475, 0.2303808, -1.44153, 1, 0.1333333, 0, 1,
-2.068941, -0.2000744, -2.078053, 1, 0.1372549, 0, 1,
-2.044156, -1.736232, -3.516218, 1, 0.145098, 0, 1,
-2.042794, 1.510483, -1.819354, 1, 0.1490196, 0, 1,
-1.98944, -0.1010091, -2.103531, 1, 0.1568628, 0, 1,
-1.984839, 1.589686, -0.9195631, 1, 0.1607843, 0, 1,
-1.968404, -0.1308957, -0.007340818, 1, 0.1686275, 0, 1,
-1.959033, 1.641756, -0.2897693, 1, 0.172549, 0, 1,
-1.940502, -0.3367513, -0.1494531, 1, 0.1803922, 0, 1,
-1.923631, -0.0272879, -1.981772, 1, 0.1843137, 0, 1,
-1.909159, -1.46839, -2.282192, 1, 0.1921569, 0, 1,
-1.894931, 0.323488, -2.858635, 1, 0.1960784, 0, 1,
-1.885561, -0.8576517, -0.5631792, 1, 0.2039216, 0, 1,
-1.868246, -0.4233808, -1.911558, 1, 0.2117647, 0, 1,
-1.815923, 1.908153, -1.140776, 1, 0.2156863, 0, 1,
-1.79414, -0.7347256, -2.181897, 1, 0.2235294, 0, 1,
-1.790457, -1.560087, -3.138279, 1, 0.227451, 0, 1,
-1.779596, -0.7084545, -2.048986, 1, 0.2352941, 0, 1,
-1.764228, 0.2263039, 0.1031592, 1, 0.2392157, 0, 1,
-1.743531, 0.3195007, -1.90196, 1, 0.2470588, 0, 1,
-1.726232, -0.5023301, -2.674303, 1, 0.2509804, 0, 1,
-1.722622, -1.308311, -1.955719, 1, 0.2588235, 0, 1,
-1.722212, -0.2964247, -0.2481182, 1, 0.2627451, 0, 1,
-1.709511, -0.734448, -3.019388, 1, 0.2705882, 0, 1,
-1.709362, 0.612616, -1.695075, 1, 0.2745098, 0, 1,
-1.707307, 1.005646, -1.762993, 1, 0.282353, 0, 1,
-1.702692, -0.07909098, -2.406065, 1, 0.2862745, 0, 1,
-1.700765, -0.2375053, -1.033141, 1, 0.2941177, 0, 1,
-1.699666, 0.4625992, -1.55492, 1, 0.3019608, 0, 1,
-1.676003, 0.8308614, -2.951221, 1, 0.3058824, 0, 1,
-1.674315, -0.6043035, -2.221766, 1, 0.3137255, 0, 1,
-1.673552, 1.398958, -0.0875672, 1, 0.3176471, 0, 1,
-1.672803, -0.8235933, -2.591656, 1, 0.3254902, 0, 1,
-1.671374, 0.1586959, -2.121792, 1, 0.3294118, 0, 1,
-1.670997, 0.277368, 0.1088289, 1, 0.3372549, 0, 1,
-1.652234, -1.155966, -1.456562, 1, 0.3411765, 0, 1,
-1.647849, -1.142088, -0.6656483, 1, 0.3490196, 0, 1,
-1.642858, -0.645469, -1.407557, 1, 0.3529412, 0, 1,
-1.642373, 0.3182945, -1.478482, 1, 0.3607843, 0, 1,
-1.63131, -0.8840381, -1.207513, 1, 0.3647059, 0, 1,
-1.630035, -1.49621, -1.386212, 1, 0.372549, 0, 1,
-1.620239, 2.269441, -0.1721112, 1, 0.3764706, 0, 1,
-1.605638, 0.7818233, -0.8862817, 1, 0.3843137, 0, 1,
-1.584921, -0.6480454, -2.67399, 1, 0.3882353, 0, 1,
-1.583332, -1.78845, -2.743083, 1, 0.3960784, 0, 1,
-1.579044, -0.1187446, -1.670005, 1, 0.4039216, 0, 1,
-1.57437, 0.7198658, -2.581232, 1, 0.4078431, 0, 1,
-1.57425, -0.0167198, -3.422279, 1, 0.4156863, 0, 1,
-1.569874, 0.253571, -1.7579, 1, 0.4196078, 0, 1,
-1.569346, 0.5328013, -1.685114, 1, 0.427451, 0, 1,
-1.566918, 0.1582773, -2.241448, 1, 0.4313726, 0, 1,
-1.557048, -2.165286, -2.925799, 1, 0.4392157, 0, 1,
-1.534274, 1.069384, -1.54034, 1, 0.4431373, 0, 1,
-1.53066, -0.8253728, -3.239273, 1, 0.4509804, 0, 1,
-1.524244, -0.526236, -1.625352, 1, 0.454902, 0, 1,
-1.507452, 0.1444159, -1.96427, 1, 0.4627451, 0, 1,
-1.503515, -0.5862072, -1.916477, 1, 0.4666667, 0, 1,
-1.48447, 1.04348, -0.6231462, 1, 0.4745098, 0, 1,
-1.476887, -0.8407789, -2.599423, 1, 0.4784314, 0, 1,
-1.476502, 0.962791, 0.1877324, 1, 0.4862745, 0, 1,
-1.472698, -0.806583, -4.636208, 1, 0.4901961, 0, 1,
-1.472348, 0.1955167, -1.220137, 1, 0.4980392, 0, 1,
-1.46903, -0.8624039, -2.236099, 1, 0.5058824, 0, 1,
-1.465748, -1.103121, -1.872038, 1, 0.509804, 0, 1,
-1.443018, -1.657336, -2.939728, 1, 0.5176471, 0, 1,
-1.439422, 0.03036218, -1.309694, 1, 0.5215687, 0, 1,
-1.432327, -1.621966, -3.543113, 1, 0.5294118, 0, 1,
-1.430759, -0.8580604, -3.151102, 1, 0.5333334, 0, 1,
-1.430198, 1.0898, 0.3993462, 1, 0.5411765, 0, 1,
-1.429542, -0.84115, -2.810853, 1, 0.5450981, 0, 1,
-1.42885, -0.7177134, -1.948398, 1, 0.5529412, 0, 1,
-1.42812, -1.974403, -1.754481, 1, 0.5568628, 0, 1,
-1.425192, -0.1431465, -2.229536, 1, 0.5647059, 0, 1,
-1.419426, -1.399928, -3.899001, 1, 0.5686275, 0, 1,
-1.41268, -0.7626328, -3.520282, 1, 0.5764706, 0, 1,
-1.409893, 1.118169, 1.825914, 1, 0.5803922, 0, 1,
-1.405519, -0.989333, -0.5485227, 1, 0.5882353, 0, 1,
-1.38121, -0.8060842, -2.390703, 1, 0.5921569, 0, 1,
-1.377482, -1.140645, -1.386208, 1, 0.6, 0, 1,
-1.368001, -1.754737, -3.094726, 1, 0.6078432, 0, 1,
-1.363939, -0.7823002, -3.321641, 1, 0.6117647, 0, 1,
-1.356858, 0.4460086, -2.100226, 1, 0.6196079, 0, 1,
-1.353996, -0.1857941, -4.446903, 1, 0.6235294, 0, 1,
-1.351209, -1.940126, -5.270048, 1, 0.6313726, 0, 1,
-1.345184, -1.574666, -2.323961, 1, 0.6352941, 0, 1,
-1.331994, -0.2096028, -0.04729094, 1, 0.6431373, 0, 1,
-1.320958, -0.827741, -2.375776, 1, 0.6470588, 0, 1,
-1.319211, 1.20459, 0.06316224, 1, 0.654902, 0, 1,
-1.315281, 2.065017, 0.7708541, 1, 0.6588235, 0, 1,
-1.308075, -0.8777894, -0.9551829, 1, 0.6666667, 0, 1,
-1.306188, -1.291916, -3.1692, 1, 0.6705883, 0, 1,
-1.303197, 0.02832945, -2.606193, 1, 0.6784314, 0, 1,
-1.302165, -0.6691646, -1.602003, 1, 0.682353, 0, 1,
-1.29144, 0.4754732, -1.243319, 1, 0.6901961, 0, 1,
-1.282487, -0.6785907, -1.350428, 1, 0.6941177, 0, 1,
-1.280527, 0.5990289, -1.853949, 1, 0.7019608, 0, 1,
-1.27354, 1.161959, -0.3930738, 1, 0.7098039, 0, 1,
-1.26658, -0.04442098, -1.690264, 1, 0.7137255, 0, 1,
-1.262507, -1.230863, -0.6536903, 1, 0.7215686, 0, 1,
-1.258604, 0.4142315, -0.9628654, 1, 0.7254902, 0, 1,
-1.255918, 0.02189424, 0.2945864, 1, 0.7333333, 0, 1,
-1.24381, -0.2871236, -2.323393, 1, 0.7372549, 0, 1,
-1.243245, 1.064492, -0.849822, 1, 0.7450981, 0, 1,
-1.240409, 0.01175495, 0.1411843, 1, 0.7490196, 0, 1,
-1.230261, 0.7216294, -1.709482, 1, 0.7568628, 0, 1,
-1.224049, 1.063257, -0.638201, 1, 0.7607843, 0, 1,
-1.220175, -1.433189, -2.204106, 1, 0.7686275, 0, 1,
-1.207499, -0.5635983, -2.748924, 1, 0.772549, 0, 1,
-1.204377, -0.3640299, -0.8066431, 1, 0.7803922, 0, 1,
-1.195698, -0.1350667, -1.473452, 1, 0.7843137, 0, 1,
-1.192671, 0.06094921, 0.07547551, 1, 0.7921569, 0, 1,
-1.188783, 0.1376641, -0.07699217, 1, 0.7960784, 0, 1,
-1.184751, 0.9346349, -1.996629, 1, 0.8039216, 0, 1,
-1.164728, 0.1167515, -1.967367, 1, 0.8117647, 0, 1,
-1.135075, -2.543377, -1.753207, 1, 0.8156863, 0, 1,
-1.132311, 1.254541, 0.9882292, 1, 0.8235294, 0, 1,
-1.115024, -0.3632974, -0.8738872, 1, 0.827451, 0, 1,
-1.108601, -0.07672462, -2.399641, 1, 0.8352941, 0, 1,
-1.096351, -1.380491, -2.12171, 1, 0.8392157, 0, 1,
-1.091223, 0.4052724, -1.535277, 1, 0.8470588, 0, 1,
-1.088124, 0.01919763, -2.806811, 1, 0.8509804, 0, 1,
-1.087281, -0.05648612, -1.709071, 1, 0.8588235, 0, 1,
-1.082361, -0.756104, -1.928354, 1, 0.8627451, 0, 1,
-1.082299, 1.317126, -0.1594711, 1, 0.8705882, 0, 1,
-1.072945, -1.308955, -3.460016, 1, 0.8745098, 0, 1,
-1.07246, 1.266621, -1.774684, 1, 0.8823529, 0, 1,
-1.07171, -0.6117489, -2.091619, 1, 0.8862745, 0, 1,
-1.06924, 0.2708867, -0.7216271, 1, 0.8941177, 0, 1,
-1.067485, 1.098799, -0.05805308, 1, 0.8980392, 0, 1,
-1.067361, 1.561226, 0.2749133, 1, 0.9058824, 0, 1,
-1.059588, -0.4076407, -1.806232, 1, 0.9137255, 0, 1,
-1.049947, -0.296731, -1.77241, 1, 0.9176471, 0, 1,
-1.049912, -0.5297595, -1.995625, 1, 0.9254902, 0, 1,
-1.045682, 1.21139, -1.304166, 1, 0.9294118, 0, 1,
-1.045121, 0.838881, -0.2836103, 1, 0.9372549, 0, 1,
-1.03313, -0.5564293, -1.2572, 1, 0.9411765, 0, 1,
-1.032836, 0.01816491, -2.006806, 1, 0.9490196, 0, 1,
-1.029779, 0.7330294, -1.290058, 1, 0.9529412, 0, 1,
-1.022815, 0.6210098, -0.6523979, 1, 0.9607843, 0, 1,
-1.020444, -0.9423463, -2.168148, 1, 0.9647059, 0, 1,
-1.004697, 0.8823878, 0.04837322, 1, 0.972549, 0, 1,
-1.003943, 0.793458, -0.9977029, 1, 0.9764706, 0, 1,
-0.9977744, 0.00301746, -2.31951, 1, 0.9843137, 0, 1,
-0.9935881, 1.225111, 1.485611, 1, 0.9882353, 0, 1,
-0.9890184, -1.300041, -3.053346, 1, 0.9960784, 0, 1,
-0.9857978, 1.07146, -1.719183, 0.9960784, 1, 0, 1,
-0.9851229, -0.5582828, -1.746109, 0.9921569, 1, 0, 1,
-0.9826533, 1.729804, -0.1365125, 0.9843137, 1, 0, 1,
-0.9825345, 0.8521314, -3.541583, 0.9803922, 1, 0, 1,
-0.9816962, 0.001021654, -2.729351, 0.972549, 1, 0, 1,
-0.9649034, -0.3271082, -3.127459, 0.9686275, 1, 0, 1,
-0.9617094, 0.5468719, -0.323184, 0.9607843, 1, 0, 1,
-0.9608267, 0.8652537, 0.09536154, 0.9568627, 1, 0, 1,
-0.9594587, 0.07800962, -0.9899043, 0.9490196, 1, 0, 1,
-0.9528311, -0.4854431, -0.9468549, 0.945098, 1, 0, 1,
-0.9511046, 0.8925514, -0.1687611, 0.9372549, 1, 0, 1,
-0.9482673, 1.418462, 1.075178, 0.9333333, 1, 0, 1,
-0.9477925, 1.034473, -0.6845481, 0.9254902, 1, 0, 1,
-0.9426091, 0.9101278, -0.08281802, 0.9215686, 1, 0, 1,
-0.9403744, -0.1150841, -3.079016, 0.9137255, 1, 0, 1,
-0.933743, 1.306076, -0.3208703, 0.9098039, 1, 0, 1,
-0.9308777, 0.6569628, -2.767627, 0.9019608, 1, 0, 1,
-0.9306237, 1.847625, -0.2876659, 0.8941177, 1, 0, 1,
-0.9228978, 2.117885, 0.9339249, 0.8901961, 1, 0, 1,
-0.9166645, 0.7079719, -1.176086, 0.8823529, 1, 0, 1,
-0.9145156, 0.07246001, -3.37806, 0.8784314, 1, 0, 1,
-0.9107383, 0.4054557, -0.47363, 0.8705882, 1, 0, 1,
-0.9100449, 1.107234, -1.523208, 0.8666667, 1, 0, 1,
-0.9020966, 0.1478815, -0.08770777, 0.8588235, 1, 0, 1,
-0.8981663, 0.753161, -1.918056, 0.854902, 1, 0, 1,
-0.8973086, -2.611942, -1.361537, 0.8470588, 1, 0, 1,
-0.8936094, 0.7452456, -0.3634662, 0.8431373, 1, 0, 1,
-0.8875297, -0.4353656, -3.957358, 0.8352941, 1, 0, 1,
-0.8856395, -2.684147, -4.339207, 0.8313726, 1, 0, 1,
-0.8787387, 0.5795687, -2.26371, 0.8235294, 1, 0, 1,
-0.8774522, 0.05902873, -1.830914, 0.8196079, 1, 0, 1,
-0.8709393, -1.190267, -2.873582, 0.8117647, 1, 0, 1,
-0.8702559, -0.7805731, -2.642493, 0.8078431, 1, 0, 1,
-0.865453, -0.1112657, -2.077394, 0.8, 1, 0, 1,
-0.864855, -0.379337, 0.1373435, 0.7921569, 1, 0, 1,
-0.8616055, -0.07845411, -2.327875, 0.7882353, 1, 0, 1,
-0.8592062, -1.175031, -2.814544, 0.7803922, 1, 0, 1,
-0.8575246, 0.303188, -0.7101781, 0.7764706, 1, 0, 1,
-0.8574572, 0.8980958, -0.07009582, 0.7686275, 1, 0, 1,
-0.8567241, 0.7165363, -1.937502, 0.7647059, 1, 0, 1,
-0.8438882, 0.7037145, -0.7642356, 0.7568628, 1, 0, 1,
-0.8401102, 0.4434797, -0.4433194, 0.7529412, 1, 0, 1,
-0.8359062, 0.7181118, -1.209102, 0.7450981, 1, 0, 1,
-0.8299556, 0.1340685, -1.699123, 0.7411765, 1, 0, 1,
-0.8292686, -2.455733, -0.685277, 0.7333333, 1, 0, 1,
-0.8290451, 0.01840292, -2.38626, 0.7294118, 1, 0, 1,
-0.8288959, -0.6423611, -2.688326, 0.7215686, 1, 0, 1,
-0.8186595, 0.5859763, -1.203738, 0.7176471, 1, 0, 1,
-0.8144023, -1.31185, -3.697802, 0.7098039, 1, 0, 1,
-0.8104779, 0.2785634, -0.9709074, 0.7058824, 1, 0, 1,
-0.8075521, 0.1226912, -2.25091, 0.6980392, 1, 0, 1,
-0.8031414, -1.801138, -2.494657, 0.6901961, 1, 0, 1,
-0.8010162, 2.385158, -0.1633297, 0.6862745, 1, 0, 1,
-0.7941661, 0.8603995, -1.076479, 0.6784314, 1, 0, 1,
-0.7859948, -0.7282454, -2.137201, 0.6745098, 1, 0, 1,
-0.7792479, 0.3836734, -1.157084, 0.6666667, 1, 0, 1,
-0.7786068, 1.334307, 1.147576, 0.6627451, 1, 0, 1,
-0.7754592, -0.2474939, -0.619716, 0.654902, 1, 0, 1,
-0.7698073, -0.5744025, -0.06315335, 0.6509804, 1, 0, 1,
-0.7696993, 0.881276, -0.8708866, 0.6431373, 1, 0, 1,
-0.757221, -0.3583051, -0.9428514, 0.6392157, 1, 0, 1,
-0.7543184, 0.4815031, -1.428679, 0.6313726, 1, 0, 1,
-0.7516237, 1.785712, -0.2060769, 0.627451, 1, 0, 1,
-0.7445859, -0.3120223, -0.2965412, 0.6196079, 1, 0, 1,
-0.742086, 0.03159825, -1.554345, 0.6156863, 1, 0, 1,
-0.7408264, -0.3133814, -2.743039, 0.6078432, 1, 0, 1,
-0.7381908, 0.6136066, -1.467985, 0.6039216, 1, 0, 1,
-0.7381093, 0.9756005, -0.18913, 0.5960785, 1, 0, 1,
-0.7380709, -1.940876, -3.760779, 0.5882353, 1, 0, 1,
-0.7374818, 0.4669868, -1.068256, 0.5843138, 1, 0, 1,
-0.736199, -0.5163323, -2.835265, 0.5764706, 1, 0, 1,
-0.7312807, 1.486961, -0.6571544, 0.572549, 1, 0, 1,
-0.7285401, 0.3637597, -0.0490136, 0.5647059, 1, 0, 1,
-0.721517, -0.3863678, -0.6033744, 0.5607843, 1, 0, 1,
-0.7199661, -0.4042597, -2.402739, 0.5529412, 1, 0, 1,
-0.7177199, 0.8017206, 1.837775, 0.5490196, 1, 0, 1,
-0.7164891, 0.5113814, -2.37162, 0.5411765, 1, 0, 1,
-0.7112542, 1.127615, -2.8011, 0.5372549, 1, 0, 1,
-0.7107832, -0.4846163, -0.4904073, 0.5294118, 1, 0, 1,
-0.7092544, -2.307212, -2.184792, 0.5254902, 1, 0, 1,
-0.7064767, -1.354154, -3.143882, 0.5176471, 1, 0, 1,
-0.7003565, -0.778407, -2.15008, 0.5137255, 1, 0, 1,
-0.6998665, -0.8121739, -2.808117, 0.5058824, 1, 0, 1,
-0.6899504, -0.8517365, -2.230069, 0.5019608, 1, 0, 1,
-0.6835236, 1.126321, -1.146801, 0.4941176, 1, 0, 1,
-0.683232, -1.239262, -2.599498, 0.4862745, 1, 0, 1,
-0.6797093, 0.3903884, -1.046582, 0.4823529, 1, 0, 1,
-0.6768776, 0.5771001, -0.7481166, 0.4745098, 1, 0, 1,
-0.6768061, 0.2971613, -1.256014, 0.4705882, 1, 0, 1,
-0.6763154, -0.4056713, -2.387892, 0.4627451, 1, 0, 1,
-0.6703286, -0.1089049, 0.9446574, 0.4588235, 1, 0, 1,
-0.6695365, -0.9467538, -3.770732, 0.4509804, 1, 0, 1,
-0.6688756, -0.7086941, -3.317972, 0.4470588, 1, 0, 1,
-0.6642541, -0.8401774, -4.623364, 0.4392157, 1, 0, 1,
-0.6631263, -1.477214, -3.012598, 0.4352941, 1, 0, 1,
-0.6620885, -0.7636282, -0.4278828, 0.427451, 1, 0, 1,
-0.6603845, 0.1735481, -1.016794, 0.4235294, 1, 0, 1,
-0.6575127, 0.4743357, -1.46538, 0.4156863, 1, 0, 1,
-0.6550841, -2.056015, -1.206776, 0.4117647, 1, 0, 1,
-0.6542652, -0.080318, -1.968775, 0.4039216, 1, 0, 1,
-0.64605, 0.7893075, -2.160721, 0.3960784, 1, 0, 1,
-0.6417336, -0.3744238, -4.29371, 0.3921569, 1, 0, 1,
-0.6328724, 0.5889271, -0.7618933, 0.3843137, 1, 0, 1,
-0.6303987, 0.6409283, -2.773434, 0.3803922, 1, 0, 1,
-0.6224425, 1.251416, -2.765232, 0.372549, 1, 0, 1,
-0.6220145, -0.2555204, -1.317718, 0.3686275, 1, 0, 1,
-0.621776, 0.945519, -0.6254293, 0.3607843, 1, 0, 1,
-0.6217071, -1.004316, -2.573585, 0.3568628, 1, 0, 1,
-0.6145059, -1.84283, -3.160414, 0.3490196, 1, 0, 1,
-0.6107667, 1.280366, -0.2350221, 0.345098, 1, 0, 1,
-0.6039305, 0.9611938, -0.07101464, 0.3372549, 1, 0, 1,
-0.6032102, -1.22474, -1.905071, 0.3333333, 1, 0, 1,
-0.5977803, 0.09185003, -0.3868647, 0.3254902, 1, 0, 1,
-0.5920677, -0.5619465, -1.555223, 0.3215686, 1, 0, 1,
-0.5855556, 0.1594155, -1.079597, 0.3137255, 1, 0, 1,
-0.584527, -0.2837903, -3.20902, 0.3098039, 1, 0, 1,
-0.572542, 0.007018223, -2.594991, 0.3019608, 1, 0, 1,
-0.569662, 0.7779986, -2.226734, 0.2941177, 1, 0, 1,
-0.5674728, 2.003361, 0.5612041, 0.2901961, 1, 0, 1,
-0.5641646, -0.4024985, -3.02869, 0.282353, 1, 0, 1,
-0.5569649, 0.65115, -0.6016124, 0.2784314, 1, 0, 1,
-0.5555864, -0.4187057, -2.854682, 0.2705882, 1, 0, 1,
-0.5537194, 0.02109246, -1.056828, 0.2666667, 1, 0, 1,
-0.5512282, -1.847568, -1.71774, 0.2588235, 1, 0, 1,
-0.5512118, -0.7153159, -2.03801, 0.254902, 1, 0, 1,
-0.5462509, -0.7985383, -3.181689, 0.2470588, 1, 0, 1,
-0.5401433, 0.155029, -0.794386, 0.2431373, 1, 0, 1,
-0.5401228, -0.7759629, -2.954706, 0.2352941, 1, 0, 1,
-0.5395002, 1.219754, -0.3758957, 0.2313726, 1, 0, 1,
-0.5387761, 0.8834896, -1.59555, 0.2235294, 1, 0, 1,
-0.5385177, -0.02122036, -1.945123, 0.2196078, 1, 0, 1,
-0.5371575, -1.095867, -1.656429, 0.2117647, 1, 0, 1,
-0.5358235, -0.03958171, -2.558366, 0.2078431, 1, 0, 1,
-0.5354433, -2.104844, -4.012254, 0.2, 1, 0, 1,
-0.5299212, 1.08374, -3.010712, 0.1921569, 1, 0, 1,
-0.529653, -0.2041264, -1.367023, 0.1882353, 1, 0, 1,
-0.5281093, 0.5855834, -1.66001, 0.1803922, 1, 0, 1,
-0.5223154, -0.1450572, -2.953267, 0.1764706, 1, 0, 1,
-0.5219769, -0.5321712, -2.1619, 0.1686275, 1, 0, 1,
-0.5202711, -0.2477176, -3.261475, 0.1647059, 1, 0, 1,
-0.5200694, -0.5131133, -2.861959, 0.1568628, 1, 0, 1,
-0.517356, 0.05656365, -0.9881133, 0.1529412, 1, 0, 1,
-0.51156, 1.749485, 0.3443945, 0.145098, 1, 0, 1,
-0.5103992, 0.05913851, -2.21023, 0.1411765, 1, 0, 1,
-0.5082721, 0.6413448, -1.477524, 0.1333333, 1, 0, 1,
-0.5080952, 0.1917237, -0.5978583, 0.1294118, 1, 0, 1,
-0.5079123, 0.4515916, -1.641097, 0.1215686, 1, 0, 1,
-0.5035751, -1.97733, -1.187204, 0.1176471, 1, 0, 1,
-0.5025425, -0.7578158, -1.756349, 0.1098039, 1, 0, 1,
-0.5016069, 0.8472345, 0.09505601, 0.1058824, 1, 0, 1,
-0.5008513, 1.363733, -0.4067544, 0.09803922, 1, 0, 1,
-0.5001017, -1.513694, -4.675259, 0.09019608, 1, 0, 1,
-0.5000752, 0.019262, -0.9158058, 0.08627451, 1, 0, 1,
-0.4993923, -0.08520883, -2.724447, 0.07843138, 1, 0, 1,
-0.4991761, 0.8023226, 2.76623, 0.07450981, 1, 0, 1,
-0.490219, 0.8661337, -1.823899, 0.06666667, 1, 0, 1,
-0.4876907, -0.1384366, -0.4750411, 0.0627451, 1, 0, 1,
-0.4837694, 0.7873486, -0.4578937, 0.05490196, 1, 0, 1,
-0.4817429, 2.264538, -1.893703, 0.05098039, 1, 0, 1,
-0.4787075, 0.7759353, 0.1920149, 0.04313726, 1, 0, 1,
-0.4782951, -0.01524826, -0.7578148, 0.03921569, 1, 0, 1,
-0.4775737, 1.087429, -1.189947, 0.03137255, 1, 0, 1,
-0.4755855, 1.151801, -1.8633, 0.02745098, 1, 0, 1,
-0.4728916, -0.4133061, -2.640758, 0.01960784, 1, 0, 1,
-0.4714372, 0.4610381, -1.480291, 0.01568628, 1, 0, 1,
-0.4707071, 1.081244, -0.3756564, 0.007843138, 1, 0, 1,
-0.4703147, -2.099033, -2.992158, 0.003921569, 1, 0, 1,
-0.4694526, -1.194559, -2.684398, 0, 1, 0.003921569, 1,
-0.4685497, -0.535489, -3.578579, 0, 1, 0.01176471, 1,
-0.4617453, -1.713193, -2.348459, 0, 1, 0.01568628, 1,
-0.4610513, 0.3786435, -1.186687, 0, 1, 0.02352941, 1,
-0.457889, 0.6319224, -0.1223657, 0, 1, 0.02745098, 1,
-0.45717, 0.236394, -1.495324, 0, 1, 0.03529412, 1,
-0.454913, 1.227892, -1.766564, 0, 1, 0.03921569, 1,
-0.4536977, 0.7578672, -1.320913, 0, 1, 0.04705882, 1,
-0.4531652, -0.08966328, -1.898497, 0, 1, 0.05098039, 1,
-0.4476113, -0.622698, -0.980029, 0, 1, 0.05882353, 1,
-0.4415965, -0.2280911, -1.852414, 0, 1, 0.0627451, 1,
-0.441376, 2.681843, -1.791566, 0, 1, 0.07058824, 1,
-0.4409239, -0.4061086, -0.8613923, 0, 1, 0.07450981, 1,
-0.4408508, 0.7146699, 0.7520697, 0, 1, 0.08235294, 1,
-0.4367909, 0.9810605, -1.71732, 0, 1, 0.08627451, 1,
-0.4362408, 0.9546736, -1.424027, 0, 1, 0.09411765, 1,
-0.4348782, 0.05434546, -2.231767, 0, 1, 0.1019608, 1,
-0.4338749, -0.7468557, -2.511184, 0, 1, 0.1058824, 1,
-0.4311868, 1.430291, -0.678609, 0, 1, 0.1137255, 1,
-0.4289482, 0.1714689, -1.723667, 0, 1, 0.1176471, 1,
-0.4159247, 1.098245, -0.1772639, 0, 1, 0.1254902, 1,
-0.4136237, -2.123164, -3.269489, 0, 1, 0.1294118, 1,
-0.4071379, 1.023765, -0.06640662, 0, 1, 0.1372549, 1,
-0.3972576, 1.178836, -1.238516, 0, 1, 0.1411765, 1,
-0.3922871, 0.5938462, 1.802708, 0, 1, 0.1490196, 1,
-0.3913801, 1.734067, 1.06638, 0, 1, 0.1529412, 1,
-0.389771, 0.1754306, -1.977574, 0, 1, 0.1607843, 1,
-0.388337, -1.172775, -2.074079, 0, 1, 0.1647059, 1,
-0.3866819, 0.139257, -0.3407281, 0, 1, 0.172549, 1,
-0.3863299, -0.4177438, -3.056479, 0, 1, 0.1764706, 1,
-0.3820506, 0.4957805, 0.6406316, 0, 1, 0.1843137, 1,
-0.3818469, -0.5427917, -2.114214, 0, 1, 0.1882353, 1,
-0.3798098, -0.336873, -2.998687, 0, 1, 0.1960784, 1,
-0.3739387, -0.3966554, -3.875783, 0, 1, 0.2039216, 1,
-0.3732249, -0.660121, -2.689653, 0, 1, 0.2078431, 1,
-0.3716265, -0.08256739, -2.180933, 0, 1, 0.2156863, 1,
-0.3695132, 0.751501, 0.2953692, 0, 1, 0.2196078, 1,
-0.3692077, 1.348794, 2.66972, 0, 1, 0.227451, 1,
-0.3691669, -0.6996, -2.811488, 0, 1, 0.2313726, 1,
-0.3611557, 0.1181031, 0.2686709, 0, 1, 0.2392157, 1,
-0.35876, -0.8320702, -4.656383, 0, 1, 0.2431373, 1,
-0.351452, -0.3749635, -1.281143, 0, 1, 0.2509804, 1,
-0.3500391, 1.11402, -0.6804625, 0, 1, 0.254902, 1,
-0.3471902, -0.8786206, -2.907622, 0, 1, 0.2627451, 1,
-0.3456462, 0.5033274, -1.119634, 0, 1, 0.2666667, 1,
-0.3406323, -1.329388, -4.061325, 0, 1, 0.2745098, 1,
-0.337225, -2.194737, -4.116649, 0, 1, 0.2784314, 1,
-0.3367365, -0.9940692, -2.665757, 0, 1, 0.2862745, 1,
-0.3299028, 0.69548, 0.8997389, 0, 1, 0.2901961, 1,
-0.3285225, -2.742996, -3.727364, 0, 1, 0.2980392, 1,
-0.3240082, -0.8944743, -3.003429, 0, 1, 0.3058824, 1,
-0.3222368, 0.6038587, -1.308657, 0, 1, 0.3098039, 1,
-0.3219827, 0.491228, -0.1136714, 0, 1, 0.3176471, 1,
-0.319416, -1.332896, -3.128249, 0, 1, 0.3215686, 1,
-0.3166213, -0.4382561, -3.887407, 0, 1, 0.3294118, 1,
-0.3115545, 1.214428, -2.217589, 0, 1, 0.3333333, 1,
-0.311018, 1.10339, 0.7221609, 0, 1, 0.3411765, 1,
-0.3109291, 0.1836701, -1.125035, 0, 1, 0.345098, 1,
-0.3103925, -2.999434, -2.571112, 0, 1, 0.3529412, 1,
-0.3079767, -0.5342225, -1.818966, 0, 1, 0.3568628, 1,
-0.3074915, 0.774009, -0.7940574, 0, 1, 0.3647059, 1,
-0.3003167, 1.285962, 0.3804778, 0, 1, 0.3686275, 1,
-0.3002634, 0.2622096, 1.457467, 0, 1, 0.3764706, 1,
-0.3002166, -0.08493195, -1.443145, 0, 1, 0.3803922, 1,
-0.2986094, 0.6148353, 0.2320205, 0, 1, 0.3882353, 1,
-0.2942481, 2.602338, 0.1190943, 0, 1, 0.3921569, 1,
-0.2940983, 0.2340828, -1.171406, 0, 1, 0.4, 1,
-0.2905894, -0.9023098, -2.753472, 0, 1, 0.4078431, 1,
-0.2904584, -0.5406119, -1.295859, 0, 1, 0.4117647, 1,
-0.286858, 0.4612905, 0.3735151, 0, 1, 0.4196078, 1,
-0.2858931, 0.7948825, -0.8700994, 0, 1, 0.4235294, 1,
-0.2825266, 0.09641239, 0.06125095, 0, 1, 0.4313726, 1,
-0.2719951, -0.4237975, -2.554076, 0, 1, 0.4352941, 1,
-0.2717461, 1.77566, 1.468146, 0, 1, 0.4431373, 1,
-0.2658252, -1.507809, -3.024279, 0, 1, 0.4470588, 1,
-0.2652989, 1.061905, 0.3337271, 0, 1, 0.454902, 1,
-0.2608268, 0.3475653, 0.2305494, 0, 1, 0.4588235, 1,
-0.2599895, 0.5988106, -0.677982, 0, 1, 0.4666667, 1,
-0.2473698, 1.874919, 0.3474801, 0, 1, 0.4705882, 1,
-0.2452309, 0.4879619, -0.2446672, 0, 1, 0.4784314, 1,
-0.2402327, -0.8368582, -2.571805, 0, 1, 0.4823529, 1,
-0.2378993, -0.3859371, -3.945231, 0, 1, 0.4901961, 1,
-0.2330899, -0.1398562, -1.799497, 0, 1, 0.4941176, 1,
-0.2312368, -1.0744, -2.767457, 0, 1, 0.5019608, 1,
-0.2311059, -0.4870333, -2.861467, 0, 1, 0.509804, 1,
-0.2288001, 0.1836733, -0.4637929, 0, 1, 0.5137255, 1,
-0.2266126, -0.6656511, -2.592913, 0, 1, 0.5215687, 1,
-0.2219156, 0.2263222, -0.8315266, 0, 1, 0.5254902, 1,
-0.2200848, -0.4290283, -1.314159, 0, 1, 0.5333334, 1,
-0.2188133, -0.5723328, -2.123855, 0, 1, 0.5372549, 1,
-0.2165852, -0.5612578, -3.424704, 0, 1, 0.5450981, 1,
-0.2145221, -0.6401429, -1.082744, 0, 1, 0.5490196, 1,
-0.2128579, -0.09494179, -1.639151, 0, 1, 0.5568628, 1,
-0.2034082, -1.308926, -2.51409, 0, 1, 0.5607843, 1,
-0.1989277, -1.199419, -4.361946, 0, 1, 0.5686275, 1,
-0.1921599, -0.133937, -2.949127, 0, 1, 0.572549, 1,
-0.1916378, 1.72357, -0.5857082, 0, 1, 0.5803922, 1,
-0.1908966, 0.2225407, -0.4621865, 0, 1, 0.5843138, 1,
-0.1894761, 0.6615101, 0.6227504, 0, 1, 0.5921569, 1,
-0.1861155, -0.4468083, -3.109895, 0, 1, 0.5960785, 1,
-0.181694, 0.1533338, -1.265887, 0, 1, 0.6039216, 1,
-0.1778685, -0.3135475, -1.778726, 0, 1, 0.6117647, 1,
-0.1744563, -0.7501855, -1.556628, 0, 1, 0.6156863, 1,
-0.1742102, 0.2579735, 0.3602782, 0, 1, 0.6235294, 1,
-0.1713925, -0.7695934, -1.645688, 0, 1, 0.627451, 1,
-0.1683746, -1.501046, -2.144427, 0, 1, 0.6352941, 1,
-0.1675648, 0.6808395, -0.7567538, 0, 1, 0.6392157, 1,
-0.1596596, -0.4226434, -3.047612, 0, 1, 0.6470588, 1,
-0.1580233, -0.293807, -2.375362, 0, 1, 0.6509804, 1,
-0.1565849, 1.491848, -0.815832, 0, 1, 0.6588235, 1,
-0.1509948, 1.72511, 1.018193, 0, 1, 0.6627451, 1,
-0.1479241, -0.1957283, -2.604587, 0, 1, 0.6705883, 1,
-0.1415151, -0.5134491, -4.292598, 0, 1, 0.6745098, 1,
-0.1398691, -0.1224097, -3.175364, 0, 1, 0.682353, 1,
-0.1390361, 1.121329, -0.8112197, 0, 1, 0.6862745, 1,
-0.1354035, -1.288275, -3.072166, 0, 1, 0.6941177, 1,
-0.1323841, 1.753702, 0.8056635, 0, 1, 0.7019608, 1,
-0.1263765, 0.01484768, -0.4107606, 0, 1, 0.7058824, 1,
-0.1251901, -0.578271, -2.946924, 0, 1, 0.7137255, 1,
-0.1251176, -1.023127, -2.194486, 0, 1, 0.7176471, 1,
-0.1247523, 2.132332, -0.2072325, 0, 1, 0.7254902, 1,
-0.1236979, -1.406026, -1.856621, 0, 1, 0.7294118, 1,
-0.1202117, 1.40704, -0.4400814, 0, 1, 0.7372549, 1,
-0.118846, 0.457169, 0.7451052, 0, 1, 0.7411765, 1,
-0.1188099, 0.5506965, -0.02542412, 0, 1, 0.7490196, 1,
-0.1184406, -0.6964057, -3.717896, 0, 1, 0.7529412, 1,
-0.11489, 2.193474, 0.19435, 0, 1, 0.7607843, 1,
-0.1139658, 0.4811026, -2.047468, 0, 1, 0.7647059, 1,
-0.1135957, -0.2042035, -1.617405, 0, 1, 0.772549, 1,
-0.1104122, -0.09787488, -2.780293, 0, 1, 0.7764706, 1,
-0.1099583, 0.2701079, -0.3423173, 0, 1, 0.7843137, 1,
-0.1095099, -1.594008, -3.662542, 0, 1, 0.7882353, 1,
-0.1078838, 0.09507579, 0.06609652, 0, 1, 0.7960784, 1,
-0.1068453, -0.8877716, -2.02083, 0, 1, 0.8039216, 1,
-0.1063777, 0.03792319, -1.754973, 0, 1, 0.8078431, 1,
-0.1029018, 0.6172644, 0.6093951, 0, 1, 0.8156863, 1,
-0.1001096, 0.4210264, -1.914342, 0, 1, 0.8196079, 1,
-0.09955353, -1.429902, -3.392326, 0, 1, 0.827451, 1,
-0.09774278, -1.246448, -5.058166, 0, 1, 0.8313726, 1,
-0.09548312, -1.22709, -2.263966, 0, 1, 0.8392157, 1,
-0.09314741, 0.6348588, -0.7776992, 0, 1, 0.8431373, 1,
-0.09036736, 0.1689333, -0.07554618, 0, 1, 0.8509804, 1,
-0.08151394, -1.053391, -3.223853, 0, 1, 0.854902, 1,
-0.0766172, -1.556816, -4.102559, 0, 1, 0.8627451, 1,
-0.07622847, 1.234612, 0.2532443, 0, 1, 0.8666667, 1,
-0.07435901, -0.1477602, -3.331445, 0, 1, 0.8745098, 1,
-0.06485148, -1.747474, -2.214747, 0, 1, 0.8784314, 1,
-0.05896626, 0.1286674, 0.3448211, 0, 1, 0.8862745, 1,
-0.05500204, -0.4916798, -4.521025, 0, 1, 0.8901961, 1,
-0.02914295, -0.1777989, -1.562618, 0, 1, 0.8980392, 1,
-0.02522858, 0.5142834, -0.3842146, 0, 1, 0.9058824, 1,
-0.02384399, -0.3447766, -3.524991, 0, 1, 0.9098039, 1,
-0.0233782, 1.087405, 0.6319994, 0, 1, 0.9176471, 1,
-0.01726446, 0.4592035, -0.765066, 0, 1, 0.9215686, 1,
-0.01560003, -0.5532315, -2.069234, 0, 1, 0.9294118, 1,
-0.01456299, -1.206307, -3.010518, 0, 1, 0.9333333, 1,
-0.01184263, 0.6305192, 1.089161, 0, 1, 0.9411765, 1,
-0.0101876, -0.1681172, -4.074005, 0, 1, 0.945098, 1,
-0.009187504, -1.061303, -3.739663, 0, 1, 0.9529412, 1,
-0.009142842, -1.312533, -3.93082, 0, 1, 0.9568627, 1,
0.002007824, -0.4381002, 2.372802, 0, 1, 0.9647059, 1,
0.002936231, 0.1012548, 1.076437, 0, 1, 0.9686275, 1,
0.01916938, -1.983553, 0.7900652, 0, 1, 0.9764706, 1,
0.02016312, -0.8436334, 4.611751, 0, 1, 0.9803922, 1,
0.02046978, 0.8531419, 0.8183193, 0, 1, 0.9882353, 1,
0.0206301, 0.07947476, -0.800397, 0, 1, 0.9921569, 1,
0.02104946, -0.6681005, 2.442544, 0, 1, 1, 1,
0.02201332, -0.8040575, 3.101243, 0, 0.9921569, 1, 1,
0.02564631, -0.05859588, 4.261283, 0, 0.9882353, 1, 1,
0.02721427, 1.586493, 1.004285, 0, 0.9803922, 1, 1,
0.02742767, -0.5027532, 2.060195, 0, 0.9764706, 1, 1,
0.03253664, -1.494701, 3.75577, 0, 0.9686275, 1, 1,
0.03280878, -0.1264967, 2.641278, 0, 0.9647059, 1, 1,
0.03448827, -0.3332812, 3.807143, 0, 0.9568627, 1, 1,
0.04070304, 0.06888837, 0.9215286, 0, 0.9529412, 1, 1,
0.04363165, 1.070789, 1.902612, 0, 0.945098, 1, 1,
0.04584719, -2.12367, 3.818457, 0, 0.9411765, 1, 1,
0.04721996, 1.008875, 0.7933095, 0, 0.9333333, 1, 1,
0.04845244, 0.05955257, 0.539516, 0, 0.9294118, 1, 1,
0.04925635, 3.073703, 0.5928947, 0, 0.9215686, 1, 1,
0.05547895, 0.01697692, 1.924624, 0, 0.9176471, 1, 1,
0.05605988, 1.689448, -0.2536858, 0, 0.9098039, 1, 1,
0.05818059, 0.479307, -0.9192079, 0, 0.9058824, 1, 1,
0.06017492, -1.059434, 1.826148, 0, 0.8980392, 1, 1,
0.06018964, -0.401898, 1.783124, 0, 0.8901961, 1, 1,
0.0631792, -1.018303, 3.545341, 0, 0.8862745, 1, 1,
0.06483661, 0.1780722, 0.975042, 0, 0.8784314, 1, 1,
0.06822594, -1.890165, 1.907862, 0, 0.8745098, 1, 1,
0.07177999, 0.06504416, 1.408888, 0, 0.8666667, 1, 1,
0.07310018, 0.1519188, 1.219522, 0, 0.8627451, 1, 1,
0.07374857, 0.418189, -0.1210443, 0, 0.854902, 1, 1,
0.07762802, 2.176034, 0.5656138, 0, 0.8509804, 1, 1,
0.08286848, -0.9260917, 3.619802, 0, 0.8431373, 1, 1,
0.0844089, -1.235932, 2.721179, 0, 0.8392157, 1, 1,
0.08468034, 0.2741196, -0.6497211, 0, 0.8313726, 1, 1,
0.08516917, 0.3669668, -0.7898855, 0, 0.827451, 1, 1,
0.08853954, 0.4086502, -0.6519188, 0, 0.8196079, 1, 1,
0.08885203, 1.275, 2.152405, 0, 0.8156863, 1, 1,
0.09142541, -0.6468424, 0.9933286, 0, 0.8078431, 1, 1,
0.09267707, 0.5244926, 1.122636, 0, 0.8039216, 1, 1,
0.1004588, -0.1270375, 3.813389, 0, 0.7960784, 1, 1,
0.1015843, -0.57275, 3.663359, 0, 0.7882353, 1, 1,
0.1063852, -0.6512486, 2.646353, 0, 0.7843137, 1, 1,
0.1066398, -0.3936006, 1.993348, 0, 0.7764706, 1, 1,
0.1093188, 2.157909, 1.103129, 0, 0.772549, 1, 1,
0.1100352, -0.8194125, 3.64457, 0, 0.7647059, 1, 1,
0.1107588, -1.639568, 3.371798, 0, 0.7607843, 1, 1,
0.1135658, -0.4191316, 1.71755, 0, 0.7529412, 1, 1,
0.1151254, 0.2731303, 0.5855271, 0, 0.7490196, 1, 1,
0.1272886, -0.727964, 3.831472, 0, 0.7411765, 1, 1,
0.1376141, 0.5808105, -0.4657424, 0, 0.7372549, 1, 1,
0.1433459, -0.8011845, 2.36945, 0, 0.7294118, 1, 1,
0.1470562, -0.4741331, 3.827297, 0, 0.7254902, 1, 1,
0.1571831, 0.196458, 0.8272794, 0, 0.7176471, 1, 1,
0.1628953, 0.3075911, 1.2271, 0, 0.7137255, 1, 1,
0.1720449, -1.389112, 4.47053, 0, 0.7058824, 1, 1,
0.1763202, 1.975792, -0.9116789, 0, 0.6980392, 1, 1,
0.1771869, -0.8852422, 5.5591, 0, 0.6941177, 1, 1,
0.1779282, 1.399385, -1.036578, 0, 0.6862745, 1, 1,
0.1788052, 1.209557, 2.262397, 0, 0.682353, 1, 1,
0.1812991, 0.7637255, -0.3894622, 0, 0.6745098, 1, 1,
0.1815055, -0.08511772, 0.2219256, 0, 0.6705883, 1, 1,
0.1824345, 1.647434, 0.9204481, 0, 0.6627451, 1, 1,
0.1835825, -0.001740978, 1.400982, 0, 0.6588235, 1, 1,
0.1941425, 0.6358271, -0.2431384, 0, 0.6509804, 1, 1,
0.1989093, -1.018026, 4.223725, 0, 0.6470588, 1, 1,
0.1992891, -0.08684494, 2.689474, 0, 0.6392157, 1, 1,
0.2084518, 0.6993049, 2.486913, 0, 0.6352941, 1, 1,
0.209972, -0.4414556, 2.309141, 0, 0.627451, 1, 1,
0.2116211, -1.427408, 2.252697, 0, 0.6235294, 1, 1,
0.213632, -1.591578, 4.581367, 0, 0.6156863, 1, 1,
0.2136651, -2.346857, 1.780185, 0, 0.6117647, 1, 1,
0.2146076, 0.8629712, -1.098622, 0, 0.6039216, 1, 1,
0.2161055, -0.7628232, 2.864867, 0, 0.5960785, 1, 1,
0.2162045, 0.3621722, -0.6108976, 0, 0.5921569, 1, 1,
0.2238473, -0.9391683, 2.517865, 0, 0.5843138, 1, 1,
0.225157, -0.1527416, 2.528991, 0, 0.5803922, 1, 1,
0.2270751, 0.5719496, 0.8891177, 0, 0.572549, 1, 1,
0.2298161, -1.233711, 1.575625, 0, 0.5686275, 1, 1,
0.2371029, -0.6148006, 3.887903, 0, 0.5607843, 1, 1,
0.2381994, 0.1769927, 1.934048, 0, 0.5568628, 1, 1,
0.242311, 0.2779891, 0.4954401, 0, 0.5490196, 1, 1,
0.2444599, -0.5454867, 3.473028, 0, 0.5450981, 1, 1,
0.2468035, -0.431292, 4.80056, 0, 0.5372549, 1, 1,
0.2511605, 1.54701, -1.572286, 0, 0.5333334, 1, 1,
0.2663332, 2.00752, -0.6972858, 0, 0.5254902, 1, 1,
0.270646, 0.6982342, -0.9523742, 0, 0.5215687, 1, 1,
0.2715947, 0.2415451, 1.354406, 0, 0.5137255, 1, 1,
0.272094, 0.7888311, 0.05645306, 0, 0.509804, 1, 1,
0.2739034, -1.018903, 1.925283, 0, 0.5019608, 1, 1,
0.2748258, 0.5628005, -0.6482077, 0, 0.4941176, 1, 1,
0.2813934, 0.3254564, 2.865945, 0, 0.4901961, 1, 1,
0.2817189, -0.1453936, 1.834148, 0, 0.4823529, 1, 1,
0.2819208, 2.540906, -0.2232653, 0, 0.4784314, 1, 1,
0.2830979, -0.8185086, 3.366296, 0, 0.4705882, 1, 1,
0.2942536, 0.07142972, 0.2643285, 0, 0.4666667, 1, 1,
0.2945127, 0.7729348, 1.064055, 0, 0.4588235, 1, 1,
0.2950802, -1.350378, 4.473815, 0, 0.454902, 1, 1,
0.2969981, 0.6242304, 1.821963, 0, 0.4470588, 1, 1,
0.2975428, 1.382707, -0.09933908, 0, 0.4431373, 1, 1,
0.2976882, -0.937049, 5.342569, 0, 0.4352941, 1, 1,
0.2979222, 1.443471, 0.5403429, 0, 0.4313726, 1, 1,
0.2979565, 1.375482, 0.3212404, 0, 0.4235294, 1, 1,
0.3003076, 1.132348, -1.185395, 0, 0.4196078, 1, 1,
0.3034478, -1.079876, 2.602753, 0, 0.4117647, 1, 1,
0.3035792, 1.889072, -0.3337611, 0, 0.4078431, 1, 1,
0.3042478, 0.7979984, -1.155792, 0, 0.4, 1, 1,
0.3054507, -0.5017794, 3.527658, 0, 0.3921569, 1, 1,
0.306266, -0.9331388, 3.009055, 0, 0.3882353, 1, 1,
0.3069899, 0.357892, -0.04228936, 0, 0.3803922, 1, 1,
0.3086858, -1.463743, 3.042977, 0, 0.3764706, 1, 1,
0.3088146, -0.6255789, 3.100796, 0, 0.3686275, 1, 1,
0.3104838, 1.629887, 0.7209096, 0, 0.3647059, 1, 1,
0.314732, 0.9480658, -0.0168601, 0, 0.3568628, 1, 1,
0.3175543, -1.029507, 0.862755, 0, 0.3529412, 1, 1,
0.3189894, 0.5863914, -0.700717, 0, 0.345098, 1, 1,
0.3229596, -0.03532689, 0.4961325, 0, 0.3411765, 1, 1,
0.3286741, 1.318667, 1.910123, 0, 0.3333333, 1, 1,
0.3325166, -0.9807883, 2.819246, 0, 0.3294118, 1, 1,
0.3423895, -0.2810416, 1.65134, 0, 0.3215686, 1, 1,
0.3494177, -0.8709357, 3.539799, 0, 0.3176471, 1, 1,
0.3529241, 1.876338, 1.455444, 0, 0.3098039, 1, 1,
0.358368, -1.600769, 3.613029, 0, 0.3058824, 1, 1,
0.3595159, -1.235872, 2.879303, 0, 0.2980392, 1, 1,
0.3604531, -2.010939, 3.753262, 0, 0.2901961, 1, 1,
0.3621862, 1.240328, 0.1618187, 0, 0.2862745, 1, 1,
0.3651035, 1.181326, -1.283572, 0, 0.2784314, 1, 1,
0.3729446, 1.65891, 0.8335249, 0, 0.2745098, 1, 1,
0.3738333, -0.2135738, 3.496795, 0, 0.2666667, 1, 1,
0.3767609, -0.03256354, 3.812037, 0, 0.2627451, 1, 1,
0.3775397, 1.186281, -0.2590471, 0, 0.254902, 1, 1,
0.3776127, 1.496077, 0.6438329, 0, 0.2509804, 1, 1,
0.3787647, 0.9340798, 0.225558, 0, 0.2431373, 1, 1,
0.3818238, -1.251016, 3.071463, 0, 0.2392157, 1, 1,
0.3872338, 2.840378, 0.08422019, 0, 0.2313726, 1, 1,
0.3904988, 0.6841169, -0.1144006, 0, 0.227451, 1, 1,
0.3994645, 1.548487, 0.9967898, 0, 0.2196078, 1, 1,
0.4002987, -0.4580866, 4.030377, 0, 0.2156863, 1, 1,
0.4034556, 0.9119303, 0.2406828, 0, 0.2078431, 1, 1,
0.4075539, 0.8835803, 0.01209839, 0, 0.2039216, 1, 1,
0.4083774, 0.5251371, 0.5211197, 0, 0.1960784, 1, 1,
0.4095117, -0.4715172, 2.094266, 0, 0.1882353, 1, 1,
0.4102119, 0.1325647, 0.06694876, 0, 0.1843137, 1, 1,
0.4138343, 0.4132512, -0.2546354, 0, 0.1764706, 1, 1,
0.4144556, 0.1327728, 1.123379, 0, 0.172549, 1, 1,
0.420517, 1.071559, 1.335535, 0, 0.1647059, 1, 1,
0.4248827, -0.01170247, 1.741901, 0, 0.1607843, 1, 1,
0.4255639, 0.2141282, 0.9402779, 0, 0.1529412, 1, 1,
0.4257278, 0.5752047, 1.018565, 0, 0.1490196, 1, 1,
0.4273825, 1.192261, 0.8790649, 0, 0.1411765, 1, 1,
0.4341454, -0.889326, 3.439703, 0, 0.1372549, 1, 1,
0.4347506, 1.383807, 1.578655, 0, 0.1294118, 1, 1,
0.4370818, 0.2152642, 2.173779, 0, 0.1254902, 1, 1,
0.4392403, -0.6146774, 2.158782, 0, 0.1176471, 1, 1,
0.4409094, 0.8464792, -0.3036814, 0, 0.1137255, 1, 1,
0.4497421, 1.27926, -0.4956415, 0, 0.1058824, 1, 1,
0.4516959, -0.3976277, 1.209902, 0, 0.09803922, 1, 1,
0.4561337, -0.1834717, 2.449663, 0, 0.09411765, 1, 1,
0.4590091, -0.1188928, 1.252687, 0, 0.08627451, 1, 1,
0.4604973, 0.9053213, -0.2539326, 0, 0.08235294, 1, 1,
0.4611304, 1.004634, 0.2118374, 0, 0.07450981, 1, 1,
0.4613256, -1.210156, 3.221354, 0, 0.07058824, 1, 1,
0.4662225, -0.4857621, 3.307462, 0, 0.0627451, 1, 1,
0.4685912, 0.65164, 0.7490664, 0, 0.05882353, 1, 1,
0.4689121, -1.060031, 2.951863, 0, 0.05098039, 1, 1,
0.475391, -0.6564075, 2.666432, 0, 0.04705882, 1, 1,
0.477116, 2.115812, -0.7240375, 0, 0.03921569, 1, 1,
0.4799061, 0.6617313, 0.1616696, 0, 0.03529412, 1, 1,
0.4812126, -0.8046758, 1.337337, 0, 0.02745098, 1, 1,
0.4812886, 0.2353649, 0.8771578, 0, 0.02352941, 1, 1,
0.4846855, 0.5921593, 1.335205, 0, 0.01568628, 1, 1,
0.4848574, 1.195854, 3.140835, 0, 0.01176471, 1, 1,
0.4896047, 0.5038908, 2.348699, 0, 0.003921569, 1, 1,
0.4909594, 0.2630153, 1.773561, 0.003921569, 0, 1, 1,
0.4931243, 1.151264, 0.3439597, 0.007843138, 0, 1, 1,
0.4934289, 1.839302, 1.117793, 0.01568628, 0, 1, 1,
0.4945383, -1.898939, 3.791009, 0.01960784, 0, 1, 1,
0.4986676, -1.35796, 3.238942, 0.02745098, 0, 1, 1,
0.5046402, 0.3434512, 1.595603, 0.03137255, 0, 1, 1,
0.5065976, -1.681069, 0.4011356, 0.03921569, 0, 1, 1,
0.5074548, -0.9785728, 5.4189, 0.04313726, 0, 1, 1,
0.5087715, 0.8830875, 1.002684, 0.05098039, 0, 1, 1,
0.5215655, 0.7862959, -0.1336755, 0.05490196, 0, 1, 1,
0.5245731, 1.733631, -1.01651, 0.0627451, 0, 1, 1,
0.5281995, 0.4350501, 2.594942, 0.06666667, 0, 1, 1,
0.5405837, -1.547611, 3.524637, 0.07450981, 0, 1, 1,
0.5450422, -0.9993179, 1.787201, 0.07843138, 0, 1, 1,
0.550282, -0.1140018, 0.9977646, 0.08627451, 0, 1, 1,
0.550657, 0.2453431, 1.497293, 0.09019608, 0, 1, 1,
0.5515941, -0.8298534, 1.449586, 0.09803922, 0, 1, 1,
0.5540733, 0.08720709, 1.922256, 0.1058824, 0, 1, 1,
0.5544963, -0.3745345, 2.985089, 0.1098039, 0, 1, 1,
0.5550941, -0.2070175, -0.06532042, 0.1176471, 0, 1, 1,
0.5568233, 0.5020008, 1.175196, 0.1215686, 0, 1, 1,
0.5571818, -0.7417277, 2.541493, 0.1294118, 0, 1, 1,
0.5573378, -0.1303975, 3.345295, 0.1333333, 0, 1, 1,
0.5579578, 0.940551, -0.295282, 0.1411765, 0, 1, 1,
0.558924, -1.840353, 2.960352, 0.145098, 0, 1, 1,
0.5604367, -0.3070956, 1.630822, 0.1529412, 0, 1, 1,
0.5605231, 0.5522711, -0.4387754, 0.1568628, 0, 1, 1,
0.5617019, 0.002211888, 0.009480515, 0.1647059, 0, 1, 1,
0.5640566, 0.996982, -0.2493528, 0.1686275, 0, 1, 1,
0.5705401, 1.039464, -0.2983626, 0.1764706, 0, 1, 1,
0.5724493, -0.07561053, 2.459701, 0.1803922, 0, 1, 1,
0.5741278, -1.821683, 3.057534, 0.1882353, 0, 1, 1,
0.5756747, 0.7838994, -0.4479781, 0.1921569, 0, 1, 1,
0.5786983, 0.8416745, 2.700518, 0.2, 0, 1, 1,
0.5804454, 2.391941, 0.940506, 0.2078431, 0, 1, 1,
0.5808558, -0.4202723, 3.501153, 0.2117647, 0, 1, 1,
0.5862672, 1.760062, -0.6329039, 0.2196078, 0, 1, 1,
0.5934018, 1.452097, 2.133029, 0.2235294, 0, 1, 1,
0.5939638, 0.5536079, -1.708093, 0.2313726, 0, 1, 1,
0.5949657, -1.395397, 1.597922, 0.2352941, 0, 1, 1,
0.5970137, 0.7441866, -0.8424031, 0.2431373, 0, 1, 1,
0.6022001, -2.908496, 3.355427, 0.2470588, 0, 1, 1,
0.6034028, -0.9661353, 2.542501, 0.254902, 0, 1, 1,
0.6065993, 0.2477331, 1.171877, 0.2588235, 0, 1, 1,
0.6081471, -0.9959688, 2.229073, 0.2666667, 0, 1, 1,
0.6091784, -0.2005205, 1.587266, 0.2705882, 0, 1, 1,
0.6115376, 0.4641089, 0.3691603, 0.2784314, 0, 1, 1,
0.6156753, -0.0926683, 2.370083, 0.282353, 0, 1, 1,
0.6209187, 0.6711109, 0.3001041, 0.2901961, 0, 1, 1,
0.6272826, 0.7484803, -0.1401485, 0.2941177, 0, 1, 1,
0.6311451, 0.6580796, 1.359065, 0.3019608, 0, 1, 1,
0.6323727, -0.2004542, 2.508456, 0.3098039, 0, 1, 1,
0.6345417, -0.3100286, 1.836523, 0.3137255, 0, 1, 1,
0.6371605, 0.6304362, -0.3490363, 0.3215686, 0, 1, 1,
0.6395907, 0.3968188, -2.80977, 0.3254902, 0, 1, 1,
0.6412795, -1.370532, 2.234524, 0.3333333, 0, 1, 1,
0.6431302, 1.176004, 1.077735, 0.3372549, 0, 1, 1,
0.6453816, 2.658782, -0.4488227, 0.345098, 0, 1, 1,
0.6463762, 0.7648576, 0.706677, 0.3490196, 0, 1, 1,
0.6464978, 0.2883405, 2.236964, 0.3568628, 0, 1, 1,
0.6583495, -2.087827, 4.099741, 0.3607843, 0, 1, 1,
0.658882, 1.513746, -0.1594004, 0.3686275, 0, 1, 1,
0.6614541, 0.5529369, 2.010187, 0.372549, 0, 1, 1,
0.6624612, -0.7233611, 1.446961, 0.3803922, 0, 1, 1,
0.6626866, 0.2143162, 1.515126, 0.3843137, 0, 1, 1,
0.6632213, -0.4373852, 1.660772, 0.3921569, 0, 1, 1,
0.6642939, -0.6933651, 2.469525, 0.3960784, 0, 1, 1,
0.672586, -0.4794076, 2.283752, 0.4039216, 0, 1, 1,
0.6787491, 0.9881682, 0.8334144, 0.4117647, 0, 1, 1,
0.6806201, 0.7652014, 0.4649255, 0.4156863, 0, 1, 1,
0.6885585, 0.1945789, 2.650545, 0.4235294, 0, 1, 1,
0.6923676, 1.297183, 1.109702, 0.427451, 0, 1, 1,
0.6935447, -1.290191, 1.790058, 0.4352941, 0, 1, 1,
0.6975148, 0.4522445, 1.095355, 0.4392157, 0, 1, 1,
0.6981226, 0.2886564, 0.8205976, 0.4470588, 0, 1, 1,
0.6982143, -0.6750359, 3.135708, 0.4509804, 0, 1, 1,
0.7077202, -1.540374, 4.041379, 0.4588235, 0, 1, 1,
0.7100361, 1.073917, 0.6899605, 0.4627451, 0, 1, 1,
0.7110879, 0.8167696, 0.7836117, 0.4705882, 0, 1, 1,
0.7212667, -0.3407877, 1.688769, 0.4745098, 0, 1, 1,
0.7218537, 1.318163, 0.5689839, 0.4823529, 0, 1, 1,
0.722888, -0.3397682, 1.429006, 0.4862745, 0, 1, 1,
0.7232485, 1.437304, 0.3079894, 0.4941176, 0, 1, 1,
0.7232566, -2.699669, 3.634626, 0.5019608, 0, 1, 1,
0.7314659, -0.0346342, 1.752092, 0.5058824, 0, 1, 1,
0.7323949, -0.3334591, 0.5614918, 0.5137255, 0, 1, 1,
0.733542, 2.576283, 1.212636, 0.5176471, 0, 1, 1,
0.7414357, -1.043935, 5.019061, 0.5254902, 0, 1, 1,
0.7437435, 0.7372469, 1.379569, 0.5294118, 0, 1, 1,
0.7470891, 0.3423913, 0.5898868, 0.5372549, 0, 1, 1,
0.7471894, -0.02825341, 2.574675, 0.5411765, 0, 1, 1,
0.7486968, -1.663923, 4.802555, 0.5490196, 0, 1, 1,
0.7551983, 0.3947783, 2.020314, 0.5529412, 0, 1, 1,
0.7583441, -0.2955352, 1.771405, 0.5607843, 0, 1, 1,
0.7610909, 2.149611, -0.7681635, 0.5647059, 0, 1, 1,
0.761377, -0.9628473, 3.355137, 0.572549, 0, 1, 1,
0.7649972, 0.5801981, 1.681853, 0.5764706, 0, 1, 1,
0.7759924, -2.724482, 3.770806, 0.5843138, 0, 1, 1,
0.7762442, 0.2604483, 2.135424, 0.5882353, 0, 1, 1,
0.7770078, 0.3177904, 1.959239, 0.5960785, 0, 1, 1,
0.7818351, 0.158396, 1.601023, 0.6039216, 0, 1, 1,
0.7907832, -0.1301097, 0.216147, 0.6078432, 0, 1, 1,
0.7949059, 1.005322, -0.9785181, 0.6156863, 0, 1, 1,
0.7987646, -0.3819433, 3.52099, 0.6196079, 0, 1, 1,
0.8028159, 1.069534, -0.2242313, 0.627451, 0, 1, 1,
0.8040906, 0.1909016, 0.9030929, 0.6313726, 0, 1, 1,
0.804231, 1.043306, -0.1804904, 0.6392157, 0, 1, 1,
0.8061709, -0.4172455, 1.450196, 0.6431373, 0, 1, 1,
0.8114613, 0.5898932, 0.8624422, 0.6509804, 0, 1, 1,
0.8118966, -0.3354628, 2.499563, 0.654902, 0, 1, 1,
0.8134163, 0.7316404, -0.386607, 0.6627451, 0, 1, 1,
0.816462, 0.6205415, 0.2964233, 0.6666667, 0, 1, 1,
0.8204968, -0.8482176, 1.434369, 0.6745098, 0, 1, 1,
0.8226586, -2.220032, 2.203964, 0.6784314, 0, 1, 1,
0.8270826, -0.9720131, 1.052321, 0.6862745, 0, 1, 1,
0.8351548, -0.3299085, 3.682945, 0.6901961, 0, 1, 1,
0.8353288, 0.9892899, 0.8078349, 0.6980392, 0, 1, 1,
0.8376665, 0.2818804, 0.3858004, 0.7058824, 0, 1, 1,
0.8388527, 0.07385096, 3.287271, 0.7098039, 0, 1, 1,
0.8494396, -2.01183, 2.703581, 0.7176471, 0, 1, 1,
0.8513156, 0.2149263, 0.6028302, 0.7215686, 0, 1, 1,
0.8516577, -3.013155, 3.405693, 0.7294118, 0, 1, 1,
0.8526115, -0.210278, 1.918398, 0.7333333, 0, 1, 1,
0.8549488, 2.080156, -0.2294941, 0.7411765, 0, 1, 1,
0.8568439, -0.8361334, 4.249801, 0.7450981, 0, 1, 1,
0.865091, 0.14791, 0.5897892, 0.7529412, 0, 1, 1,
0.8651832, -0.5168046, 1.61637, 0.7568628, 0, 1, 1,
0.8677097, -0.8714623, 4.038623, 0.7647059, 0, 1, 1,
0.8699831, -0.2574005, 2.192076, 0.7686275, 0, 1, 1,
0.8747598, 0.8607332, 0.4960329, 0.7764706, 0, 1, 1,
0.876826, 0.7782677, 0.5376669, 0.7803922, 0, 1, 1,
0.8775175, -2.791784, 4.65292, 0.7882353, 0, 1, 1,
0.8924549, 1.282122, 0.0359348, 0.7921569, 0, 1, 1,
0.8932483, 0.1292109, 1.866107, 0.8, 0, 1, 1,
0.893353, 1.593714, -0.8876877, 0.8078431, 0, 1, 1,
0.8953558, -0.6774175, 4.333918, 0.8117647, 0, 1, 1,
0.9124239, -0.1607669, 3.762365, 0.8196079, 0, 1, 1,
0.9132276, -1.819845, 3.153979, 0.8235294, 0, 1, 1,
0.9220577, -0.2280174, 2.027775, 0.8313726, 0, 1, 1,
0.9289393, 1.273865, 1.391481, 0.8352941, 0, 1, 1,
0.9364679, 1.04537, 0.6321407, 0.8431373, 0, 1, 1,
0.9422052, -1.281338, 3.764062, 0.8470588, 0, 1, 1,
0.9430879, -0.05210959, 2.403875, 0.854902, 0, 1, 1,
0.9465884, 0.4646039, -0.7051386, 0.8588235, 0, 1, 1,
0.9497017, 0.7342272, 1.903622, 0.8666667, 0, 1, 1,
0.9538334, -1.254831, 1.3483, 0.8705882, 0, 1, 1,
0.9697852, -0.8515368, 2.869567, 0.8784314, 0, 1, 1,
0.9734225, 0.3042437, 0.9371446, 0.8823529, 0, 1, 1,
0.9764559, -0.8156301, 1.237592, 0.8901961, 0, 1, 1,
0.9809533, 0.9785203, 0.9119037, 0.8941177, 0, 1, 1,
0.9820758, 0.6910705, 1.693624, 0.9019608, 0, 1, 1,
0.9840119, 0.5752931, 1.645542, 0.9098039, 0, 1, 1,
0.9898093, -0.5683754, 1.558316, 0.9137255, 0, 1, 1,
0.9953408, 0.08253946, 1.415159, 0.9215686, 0, 1, 1,
0.9967526, 0.383619, 2.378294, 0.9254902, 0, 1, 1,
0.997109, -0.3507186, 2.066358, 0.9333333, 0, 1, 1,
1.001392, -0.871057, 4.294865, 0.9372549, 0, 1, 1,
1.004742, -0.4148566, 2.395457, 0.945098, 0, 1, 1,
1.007773, -0.4325092, 1.890449, 0.9490196, 0, 1, 1,
1.0078, 0.6841575, 1.224495, 0.9568627, 0, 1, 1,
1.008332, -0.2432364, 0.6951334, 0.9607843, 0, 1, 1,
1.009248, 0.7963612, 0.1690283, 0.9686275, 0, 1, 1,
1.011185, 0.7113808, 0.6801355, 0.972549, 0, 1, 1,
1.013767, 0.9073579, 2.25864, 0.9803922, 0, 1, 1,
1.015482, 1.681722, 1.720695, 0.9843137, 0, 1, 1,
1.026955, -1.521644, 3.163327, 0.9921569, 0, 1, 1,
1.03949, 1.165866, -0.1745912, 0.9960784, 0, 1, 1,
1.047105, 1.166005, 0.4495665, 1, 0, 0.9960784, 1,
1.051401, 0.6732021, 0.4535787, 1, 0, 0.9882353, 1,
1.059545, 0.4712751, 0.9980769, 1, 0, 0.9843137, 1,
1.060581, 0.0741047, 0.8266124, 1, 0, 0.9764706, 1,
1.060844, 2.551978, -0.4606641, 1, 0, 0.972549, 1,
1.066464, -0.02747202, 1.137398, 1, 0, 0.9647059, 1,
1.070243, 0.5582123, 1.41873, 1, 0, 0.9607843, 1,
1.070554, -0.3629897, 2.732528, 1, 0, 0.9529412, 1,
1.079008, -1.001291, 2.631358, 1, 0, 0.9490196, 1,
1.082613, 0.08389823, 2.958546, 1, 0, 0.9411765, 1,
1.094428, -0.07438646, 0.4473504, 1, 0, 0.9372549, 1,
1.095976, 0.91222, 1.071172, 1, 0, 0.9294118, 1,
1.099606, 1.475341, 2.390222, 1, 0, 0.9254902, 1,
1.100694, 0.6541545, 0.7173081, 1, 0, 0.9176471, 1,
1.108283, -0.2665753, 2.480211, 1, 0, 0.9137255, 1,
1.110173, -0.730967, -0.5576864, 1, 0, 0.9058824, 1,
1.114733, -1.03782, 2.376213, 1, 0, 0.9019608, 1,
1.117125, 0.06032148, 1.932623, 1, 0, 0.8941177, 1,
1.121993, -0.3863865, 1.829051, 1, 0, 0.8862745, 1,
1.12372, -1.089119, 2.756896, 1, 0, 0.8823529, 1,
1.136318, -1.678291, 3.602838, 1, 0, 0.8745098, 1,
1.1369, -0.3959412, 2.036652, 1, 0, 0.8705882, 1,
1.13703, 0.1807846, -0.2744047, 1, 0, 0.8627451, 1,
1.138918, 1.132009, -0.2260566, 1, 0, 0.8588235, 1,
1.139537, 0.2607781, 1.725277, 1, 0, 0.8509804, 1,
1.143062, 0.2296922, 0.9360652, 1, 0, 0.8470588, 1,
1.148212, 0.4249657, 3.081977, 1, 0, 0.8392157, 1,
1.161131, 1.109737, 0.8838736, 1, 0, 0.8352941, 1,
1.161484, 0.9413647, -0.9184773, 1, 0, 0.827451, 1,
1.164042, 0.8264974, 0.9481262, 1, 0, 0.8235294, 1,
1.174701, 1.402839, 0.2548642, 1, 0, 0.8156863, 1,
1.175374, -0.8038314, 3.566763, 1, 0, 0.8117647, 1,
1.178276, -0.6418329, 1.467993, 1, 0, 0.8039216, 1,
1.181593, 0.3884135, 0.9799043, 1, 0, 0.7960784, 1,
1.183598, -0.721076, 2.798648, 1, 0, 0.7921569, 1,
1.18516, 2.002231, 0.7115654, 1, 0, 0.7843137, 1,
1.187084, 0.06898602, -0.7307547, 1, 0, 0.7803922, 1,
1.191623, 0.857234, 1.309159, 1, 0, 0.772549, 1,
1.192014, -2.181151, 3.460293, 1, 0, 0.7686275, 1,
1.20523, -0.3228259, 2.602055, 1, 0, 0.7607843, 1,
1.231682, -1.231612, 2.464281, 1, 0, 0.7568628, 1,
1.232004, -0.01784387, 0.8543444, 1, 0, 0.7490196, 1,
1.234191, -0.3535921, 1.070127, 1, 0, 0.7450981, 1,
1.246413, -0.5783049, 0.9029812, 1, 0, 0.7372549, 1,
1.249211, -0.02001553, 2.560971, 1, 0, 0.7333333, 1,
1.251122, -1.212473, 2.71777, 1, 0, 0.7254902, 1,
1.260919, 0.5593988, -0.4764318, 1, 0, 0.7215686, 1,
1.262224, -1.389139, 1.49276, 1, 0, 0.7137255, 1,
1.268932, 1.22435, 1.390557, 1, 0, 0.7098039, 1,
1.279346, 1.028568, -1.695509, 1, 0, 0.7019608, 1,
1.28012, -0.5300021, 2.480287, 1, 0, 0.6941177, 1,
1.287064, -0.7663358, 1.090554, 1, 0, 0.6901961, 1,
1.288469, 0.8784819, 2.970736, 1, 0, 0.682353, 1,
1.290707, -1.330394, 3.657296, 1, 0, 0.6784314, 1,
1.298716, 0.6829171, 1.545233, 1, 0, 0.6705883, 1,
1.299897, 0.8919845, 1.241078, 1, 0, 0.6666667, 1,
1.303551, 1.507973, 0.007273593, 1, 0, 0.6588235, 1,
1.305397, -0.4625475, 3.156409, 1, 0, 0.654902, 1,
1.309666, 1.137437, 2.378852, 1, 0, 0.6470588, 1,
1.316272, -1.597474, 1.664323, 1, 0, 0.6431373, 1,
1.317548, -1.179819, 2.700541, 1, 0, 0.6352941, 1,
1.317664, 0.5986066, 0.2048286, 1, 0, 0.6313726, 1,
1.319108, -2.376152, 2.096999, 1, 0, 0.6235294, 1,
1.32114, 1.509931, -0.4314709, 1, 0, 0.6196079, 1,
1.323341, -0.197918, 2.303152, 1, 0, 0.6117647, 1,
1.340499, 1.982332, -0.2078465, 1, 0, 0.6078432, 1,
1.346226, -1.195123, 3.352158, 1, 0, 0.6, 1,
1.350263, -1.502883, 3.5393, 1, 0, 0.5921569, 1,
1.35286, 0.273821, 0.9586198, 1, 0, 0.5882353, 1,
1.363855, 1.040464, 1.186907, 1, 0, 0.5803922, 1,
1.365484, 0.4514315, 1.751593, 1, 0, 0.5764706, 1,
1.366393, -1.109433, 2.603072, 1, 0, 0.5686275, 1,
1.388079, -0.04668992, 1.377963, 1, 0, 0.5647059, 1,
1.389957, -0.5361252, 0.6936746, 1, 0, 0.5568628, 1,
1.400112, 1.596148, 0.04507448, 1, 0, 0.5529412, 1,
1.400371, -0.2918894, -0.2831155, 1, 0, 0.5450981, 1,
1.409711, -0.7692969, 0.2846897, 1, 0, 0.5411765, 1,
1.427548, -1.929349, 1.705718, 1, 0, 0.5333334, 1,
1.42856, -0.4043873, 2.482791, 1, 0, 0.5294118, 1,
1.433193, -0.3599311, 0.9087915, 1, 0, 0.5215687, 1,
1.43341, 0.1028653, 1.352409, 1, 0, 0.5176471, 1,
1.43457, 0.8933864, 0.8460197, 1, 0, 0.509804, 1,
1.444206, 0.7781554, -0.8286853, 1, 0, 0.5058824, 1,
1.444956, -0.1785605, 1.181826, 1, 0, 0.4980392, 1,
1.45417, 0.1258857, 1.645844, 1, 0, 0.4901961, 1,
1.460232, -0.09114811, 1.579996, 1, 0, 0.4862745, 1,
1.461978, -1.029518, 2.135724, 1, 0, 0.4784314, 1,
1.465771, 2.07221, 0.4350388, 1, 0, 0.4745098, 1,
1.472696, 0.4337403, 0.767417, 1, 0, 0.4666667, 1,
1.473281, -0.6689841, 3.864231, 1, 0, 0.4627451, 1,
1.477779, 1.600741, 1.362778, 1, 0, 0.454902, 1,
1.480061, -0.3745385, 2.684815, 1, 0, 0.4509804, 1,
1.483775, 0.1965526, 1.464321, 1, 0, 0.4431373, 1,
1.48439, -2.001806, 2.28613, 1, 0, 0.4392157, 1,
1.495696, -2.213847, 2.653569, 1, 0, 0.4313726, 1,
1.513708, 0.626179, 1.720705, 1, 0, 0.427451, 1,
1.528473, -0.1325813, -0.1821797, 1, 0, 0.4196078, 1,
1.528914, -1.003643, 1.611434, 1, 0, 0.4156863, 1,
1.541944, 0.5631471, 1.225706, 1, 0, 0.4078431, 1,
1.544582, 1.715379, 0.3469141, 1, 0, 0.4039216, 1,
1.551038, -1.518496, 2.937464, 1, 0, 0.3960784, 1,
1.55346, 0.6988167, 2.364938, 1, 0, 0.3882353, 1,
1.5591, 0.8716158, 0.9798978, 1, 0, 0.3843137, 1,
1.582116, -0.9052932, 1.790626, 1, 0, 0.3764706, 1,
1.586482, 0.6307516, 1.275343, 1, 0, 0.372549, 1,
1.587334, 1.953663, -0.05975888, 1, 0, 0.3647059, 1,
1.587685, 0.6738985, 1.289908, 1, 0, 0.3607843, 1,
1.606646, -0.5267012, 2.789846, 1, 0, 0.3529412, 1,
1.609949, -1.253999, 2.502483, 1, 0, 0.3490196, 1,
1.620234, 0.8684981, 0.8560598, 1, 0, 0.3411765, 1,
1.625323, -0.619329, 3.483536, 1, 0, 0.3372549, 1,
1.633997, 1.120879, 1.616982, 1, 0, 0.3294118, 1,
1.639777, -0.1062863, 1.651275, 1, 0, 0.3254902, 1,
1.649152, -0.06919979, 0.5451865, 1, 0, 0.3176471, 1,
1.650301, -1.661593, 3.32786, 1, 0, 0.3137255, 1,
1.652563, 0.6863405, 3.179794, 1, 0, 0.3058824, 1,
1.658303, 2.393602, -0.9761447, 1, 0, 0.2980392, 1,
1.666416, 0.2898087, 1.306294, 1, 0, 0.2941177, 1,
1.669567, 1.07016, -0.4865813, 1, 0, 0.2862745, 1,
1.674554, -1.379585, 2.687184, 1, 0, 0.282353, 1,
1.677519, 0.3398157, 3.228284, 1, 0, 0.2745098, 1,
1.682266, 0.6666095, 1.452371, 1, 0, 0.2705882, 1,
1.701377, 0.1965596, -0.3838426, 1, 0, 0.2627451, 1,
1.701921, -0.6388144, 1.91731, 1, 0, 0.2588235, 1,
1.707544, 1.507802, -0.09800363, 1, 0, 0.2509804, 1,
1.712144, -0.2283721, 0.638395, 1, 0, 0.2470588, 1,
1.726786, 0.4144142, 1.248128, 1, 0, 0.2392157, 1,
1.730325, -1.042105, 1.571997, 1, 0, 0.2352941, 1,
1.74592, 0.6978309, 0.3347797, 1, 0, 0.227451, 1,
1.757563, -0.3875353, 1.645681, 1, 0, 0.2235294, 1,
1.769651, 0.3374885, 3.56132, 1, 0, 0.2156863, 1,
1.778222, -0.4581676, 2.907393, 1, 0, 0.2117647, 1,
1.786581, -0.2309584, 1.063573, 1, 0, 0.2039216, 1,
1.851297, -0.7961192, 0.5707573, 1, 0, 0.1960784, 1,
1.853159, -0.2934748, 0.2414249, 1, 0, 0.1921569, 1,
1.855128, 0.6618201, 2.949203, 1, 0, 0.1843137, 1,
1.862448, -1.467011, 0.8246993, 1, 0, 0.1803922, 1,
1.86392, -0.5786452, 2.116834, 1, 0, 0.172549, 1,
1.885285, 0.9594544, 2.459007, 1, 0, 0.1686275, 1,
1.910168, 0.1575775, 1.513047, 1, 0, 0.1607843, 1,
1.911658, 0.8635544, 0.3558127, 1, 0, 0.1568628, 1,
1.921735, 0.7937008, 1.093962, 1, 0, 0.1490196, 1,
1.941208, -1.000738, 3.977764, 1, 0, 0.145098, 1,
1.961759, 0.2023946, 0.1406713, 1, 0, 0.1372549, 1,
1.980244, 0.9922438, 0.6906856, 1, 0, 0.1333333, 1,
1.992459, 0.1826739, 3.548691, 1, 0, 0.1254902, 1,
2.062631, 0.4862435, 0.6381118, 1, 0, 0.1215686, 1,
2.079605, 1.913237, 0.6184831, 1, 0, 0.1137255, 1,
2.107339, 0.6047465, 1.393746, 1, 0, 0.1098039, 1,
2.123689, -1.400069, 1.579938, 1, 0, 0.1019608, 1,
2.126766, 0.2606496, 2.090103, 1, 0, 0.09411765, 1,
2.164152, 0.3022569, 1.620553, 1, 0, 0.09019608, 1,
2.212175, -1.987326, 0.8666974, 1, 0, 0.08235294, 1,
2.257188, -1.206708, 3.667144, 1, 0, 0.07843138, 1,
2.288262, -0.3632554, 2.244766, 1, 0, 0.07058824, 1,
2.361837, 1.427695, 3.423322, 1, 0, 0.06666667, 1,
2.3927, 0.9265451, 0.3753491, 1, 0, 0.05882353, 1,
2.429475, 0.17183, 2.087702, 1, 0, 0.05490196, 1,
2.574344, -1.027913, 1.893555, 1, 0, 0.04705882, 1,
2.644198, -0.6670159, 2.06946, 1, 0, 0.04313726, 1,
2.763906, -1.441088, 2.969293, 1, 0, 0.03529412, 1,
2.818665, -2.464058, 3.414088, 1, 0, 0.03137255, 1,
2.923502, 0.5987352, 1.941546, 1, 0, 0.02352941, 1,
2.94338, -0.1308189, 1.621049, 1, 0, 0.01960784, 1,
3.005932, 0.5986148, 1.891963, 1, 0, 0.01176471, 1,
3.888304, 0.4476464, 2.71196, 1, 0, 0.007843138, 1
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
0.4378142, -4.044877, -7.105589, 0, -0.5, 0.5, 0.5,
0.4378142, -4.044877, -7.105589, 1, -0.5, 0.5, 0.5,
0.4378142, -4.044877, -7.105589, 1, 1.5, 0.5, 0.5,
0.4378142, -4.044877, -7.105589, 0, 1.5, 0.5, 0.5
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
-4.182392, 0.03027439, -7.105589, 0, -0.5, 0.5, 0.5,
-4.182392, 0.03027439, -7.105589, 1, -0.5, 0.5, 0.5,
-4.182392, 0.03027439, -7.105589, 1, 1.5, 0.5, 0.5,
-4.182392, 0.03027439, -7.105589, 0, 1.5, 0.5, 0.5
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
-4.182392, -4.044877, 0.144526, 0, -0.5, 0.5, 0.5,
-4.182392, -4.044877, 0.144526, 1, -0.5, 0.5, 0.5,
-4.182392, -4.044877, 0.144526, 1, 1.5, 0.5, 0.5,
-4.182392, -4.044877, 0.144526, 0, 1.5, 0.5, 0.5
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
-3, -3.104457, -5.432486,
3, -3.104457, -5.432486,
-3, -3.104457, -5.432486,
-3, -3.261194, -5.711336,
-2, -3.104457, -5.432486,
-2, -3.261194, -5.711336,
-1, -3.104457, -5.432486,
-1, -3.261194, -5.711336,
0, -3.104457, -5.432486,
0, -3.261194, -5.711336,
1, -3.104457, -5.432486,
1, -3.261194, -5.711336,
2, -3.104457, -5.432486,
2, -3.261194, -5.711336,
3, -3.104457, -5.432486,
3, -3.261194, -5.711336
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
-3, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
-3, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
-3, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
-3, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
-2, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
-2, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
-2, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
-2, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
-1, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
-1, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
-1, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
-1, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
0, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
0, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
0, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
0, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
1, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
1, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
1, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
1, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
2, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
2, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
2, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
2, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5,
3, -3.574667, -6.269037, 0, -0.5, 0.5, 0.5,
3, -3.574667, -6.269037, 1, -0.5, 0.5, 0.5,
3, -3.574667, -6.269037, 1, 1.5, 0.5, 0.5,
3, -3.574667, -6.269037, 0, 1.5, 0.5, 0.5
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
-3.11619, -3, -5.432486,
-3.11619, 3, -5.432486,
-3.11619, -3, -5.432486,
-3.293891, -3, -5.711336,
-3.11619, -2, -5.432486,
-3.293891, -2, -5.711336,
-3.11619, -1, -5.432486,
-3.293891, -1, -5.711336,
-3.11619, 0, -5.432486,
-3.293891, 0, -5.711336,
-3.11619, 1, -5.432486,
-3.293891, 1, -5.711336,
-3.11619, 2, -5.432486,
-3.293891, 2, -5.711336,
-3.11619, 3, -5.432486,
-3.293891, 3, -5.711336
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
-3.649291, -3, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, -3, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, -3, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, -3, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, -2, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, -2, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, -2, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, -2, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, -1, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, -1, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, -1, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, -1, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, 0, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, 0, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, 0, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, 0, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, 1, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, 1, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, 1, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, 1, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, 2, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, 2, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, 2, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, 2, -6.269037, 0, 1.5, 0.5, 0.5,
-3.649291, 3, -6.269037, 0, -0.5, 0.5, 0.5,
-3.649291, 3, -6.269037, 1, -0.5, 0.5, 0.5,
-3.649291, 3, -6.269037, 1, 1.5, 0.5, 0.5,
-3.649291, 3, -6.269037, 0, 1.5, 0.5, 0.5
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
-3.11619, -3.104457, -4,
-3.11619, -3.104457, 4,
-3.11619, -3.104457, -4,
-3.293891, -3.261194, -4,
-3.11619, -3.104457, -2,
-3.293891, -3.261194, -2,
-3.11619, -3.104457, 0,
-3.293891, -3.261194, 0,
-3.11619, -3.104457, 2,
-3.293891, -3.261194, 2,
-3.11619, -3.104457, 4,
-3.293891, -3.261194, 4
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
-3.649291, -3.574667, -4, 0, -0.5, 0.5, 0.5,
-3.649291, -3.574667, -4, 1, -0.5, 0.5, 0.5,
-3.649291, -3.574667, -4, 1, 1.5, 0.5, 0.5,
-3.649291, -3.574667, -4, 0, 1.5, 0.5, 0.5,
-3.649291, -3.574667, -2, 0, -0.5, 0.5, 0.5,
-3.649291, -3.574667, -2, 1, -0.5, 0.5, 0.5,
-3.649291, -3.574667, -2, 1, 1.5, 0.5, 0.5,
-3.649291, -3.574667, -2, 0, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 0, 0, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 0, 1, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 0, 1, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 0, 0, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 2, 0, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 2, 1, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 2, 1, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 2, 0, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 4, 0, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 4, 1, -0.5, 0.5, 0.5,
-3.649291, -3.574667, 4, 1, 1.5, 0.5, 0.5,
-3.649291, -3.574667, 4, 0, 1.5, 0.5, 0.5
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
-3.11619, -3.104457, -5.432486,
-3.11619, 3.165006, -5.432486,
-3.11619, -3.104457, 5.721538,
-3.11619, 3.165006, 5.721538,
-3.11619, -3.104457, -5.432486,
-3.11619, -3.104457, 5.721538,
-3.11619, 3.165006, -5.432486,
-3.11619, 3.165006, 5.721538,
-3.11619, -3.104457, -5.432486,
3.991819, -3.104457, -5.432486,
-3.11619, -3.104457, 5.721538,
3.991819, -3.104457, 5.721538,
-3.11619, 3.165006, -5.432486,
3.991819, 3.165006, -5.432486,
-3.11619, 3.165006, 5.721538,
3.991819, 3.165006, 5.721538,
3.991819, -3.104457, -5.432486,
3.991819, 3.165006, -5.432486,
3.991819, -3.104457, 5.721538,
3.991819, 3.165006, 5.721538,
3.991819, -3.104457, -5.432486,
3.991819, -3.104457, 5.721538,
3.991819, 3.165006, -5.432486,
3.991819, 3.165006, 5.721538
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
var radius = 7.815881;
var distance = 34.77374;
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
mvMatrix.translate( -0.4378142, -0.03027439, -0.144526 );
mvMatrix.scale( 1.188896, 1.347912, 0.7576355 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.77374);
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
ethylene_dibromide_1<-read.table("ethylene_dibromide_1.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethylene_dibromide_1$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
y<-ethylene_dibromide_1$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
z<-ethylene_dibromide_1$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
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
-3.012676, 1.26681, -0.784816, 0, 0, 1, 1, 1,
-3.009129, 0.07954453, -0.130696, 1, 0, 0, 1, 1,
-2.79192, 0.8247178, -2.218472, 1, 0, 0, 1, 1,
-2.696352, -2.376763, -1.199166, 1, 0, 0, 1, 1,
-2.6604, -0.04187003, -1.238223, 1, 0, 0, 1, 1,
-2.616263, 0.6653757, -0.908215, 1, 0, 0, 1, 1,
-2.528603, -0.4780664, -1.482499, 0, 0, 0, 1, 1,
-2.498403, -0.7088383, -3.121614, 0, 0, 0, 1, 1,
-2.49359, 0.3773356, -1.035691, 0, 0, 0, 1, 1,
-2.436589, -0.3134506, -4.129025, 0, 0, 0, 1, 1,
-2.374964, 0.8089887, -1.179339, 0, 0, 0, 1, 1,
-2.323959, -0.3465413, -0.6540347, 0, 0, 0, 1, 1,
-2.295726, 0.02301522, -0.8186933, 0, 0, 0, 1, 1,
-2.246389, -0.5480673, -0.9413002, 1, 1, 1, 1, 1,
-2.230869, -0.9035131, -2.60509, 1, 1, 1, 1, 1,
-2.230178, -0.1079334, -4.019971, 1, 1, 1, 1, 1,
-2.225359, 0.5490953, 0.8813578, 1, 1, 1, 1, 1,
-2.22034, 1.005834, -1.101172, 1, 1, 1, 1, 1,
-2.200982, -0.764118, -2.058131, 1, 1, 1, 1, 1,
-2.191212, 0.3659812, -0.5037525, 1, 1, 1, 1, 1,
-2.18461, -0.4130639, -0.8169163, 1, 1, 1, 1, 1,
-2.155295, 0.1236077, -1.816152, 1, 1, 1, 1, 1,
-2.150475, 0.2303808, -1.44153, 1, 1, 1, 1, 1,
-2.068941, -0.2000744, -2.078053, 1, 1, 1, 1, 1,
-2.044156, -1.736232, -3.516218, 1, 1, 1, 1, 1,
-2.042794, 1.510483, -1.819354, 1, 1, 1, 1, 1,
-1.98944, -0.1010091, -2.103531, 1, 1, 1, 1, 1,
-1.984839, 1.589686, -0.9195631, 1, 1, 1, 1, 1,
-1.968404, -0.1308957, -0.007340818, 0, 0, 1, 1, 1,
-1.959033, 1.641756, -0.2897693, 1, 0, 0, 1, 1,
-1.940502, -0.3367513, -0.1494531, 1, 0, 0, 1, 1,
-1.923631, -0.0272879, -1.981772, 1, 0, 0, 1, 1,
-1.909159, -1.46839, -2.282192, 1, 0, 0, 1, 1,
-1.894931, 0.323488, -2.858635, 1, 0, 0, 1, 1,
-1.885561, -0.8576517, -0.5631792, 0, 0, 0, 1, 1,
-1.868246, -0.4233808, -1.911558, 0, 0, 0, 1, 1,
-1.815923, 1.908153, -1.140776, 0, 0, 0, 1, 1,
-1.79414, -0.7347256, -2.181897, 0, 0, 0, 1, 1,
-1.790457, -1.560087, -3.138279, 0, 0, 0, 1, 1,
-1.779596, -0.7084545, -2.048986, 0, 0, 0, 1, 1,
-1.764228, 0.2263039, 0.1031592, 0, 0, 0, 1, 1,
-1.743531, 0.3195007, -1.90196, 1, 1, 1, 1, 1,
-1.726232, -0.5023301, -2.674303, 1, 1, 1, 1, 1,
-1.722622, -1.308311, -1.955719, 1, 1, 1, 1, 1,
-1.722212, -0.2964247, -0.2481182, 1, 1, 1, 1, 1,
-1.709511, -0.734448, -3.019388, 1, 1, 1, 1, 1,
-1.709362, 0.612616, -1.695075, 1, 1, 1, 1, 1,
-1.707307, 1.005646, -1.762993, 1, 1, 1, 1, 1,
-1.702692, -0.07909098, -2.406065, 1, 1, 1, 1, 1,
-1.700765, -0.2375053, -1.033141, 1, 1, 1, 1, 1,
-1.699666, 0.4625992, -1.55492, 1, 1, 1, 1, 1,
-1.676003, 0.8308614, -2.951221, 1, 1, 1, 1, 1,
-1.674315, -0.6043035, -2.221766, 1, 1, 1, 1, 1,
-1.673552, 1.398958, -0.0875672, 1, 1, 1, 1, 1,
-1.672803, -0.8235933, -2.591656, 1, 1, 1, 1, 1,
-1.671374, 0.1586959, -2.121792, 1, 1, 1, 1, 1,
-1.670997, 0.277368, 0.1088289, 0, 0, 1, 1, 1,
-1.652234, -1.155966, -1.456562, 1, 0, 0, 1, 1,
-1.647849, -1.142088, -0.6656483, 1, 0, 0, 1, 1,
-1.642858, -0.645469, -1.407557, 1, 0, 0, 1, 1,
-1.642373, 0.3182945, -1.478482, 1, 0, 0, 1, 1,
-1.63131, -0.8840381, -1.207513, 1, 0, 0, 1, 1,
-1.630035, -1.49621, -1.386212, 0, 0, 0, 1, 1,
-1.620239, 2.269441, -0.1721112, 0, 0, 0, 1, 1,
-1.605638, 0.7818233, -0.8862817, 0, 0, 0, 1, 1,
-1.584921, -0.6480454, -2.67399, 0, 0, 0, 1, 1,
-1.583332, -1.78845, -2.743083, 0, 0, 0, 1, 1,
-1.579044, -0.1187446, -1.670005, 0, 0, 0, 1, 1,
-1.57437, 0.7198658, -2.581232, 0, 0, 0, 1, 1,
-1.57425, -0.0167198, -3.422279, 1, 1, 1, 1, 1,
-1.569874, 0.253571, -1.7579, 1, 1, 1, 1, 1,
-1.569346, 0.5328013, -1.685114, 1, 1, 1, 1, 1,
-1.566918, 0.1582773, -2.241448, 1, 1, 1, 1, 1,
-1.557048, -2.165286, -2.925799, 1, 1, 1, 1, 1,
-1.534274, 1.069384, -1.54034, 1, 1, 1, 1, 1,
-1.53066, -0.8253728, -3.239273, 1, 1, 1, 1, 1,
-1.524244, -0.526236, -1.625352, 1, 1, 1, 1, 1,
-1.507452, 0.1444159, -1.96427, 1, 1, 1, 1, 1,
-1.503515, -0.5862072, -1.916477, 1, 1, 1, 1, 1,
-1.48447, 1.04348, -0.6231462, 1, 1, 1, 1, 1,
-1.476887, -0.8407789, -2.599423, 1, 1, 1, 1, 1,
-1.476502, 0.962791, 0.1877324, 1, 1, 1, 1, 1,
-1.472698, -0.806583, -4.636208, 1, 1, 1, 1, 1,
-1.472348, 0.1955167, -1.220137, 1, 1, 1, 1, 1,
-1.46903, -0.8624039, -2.236099, 0, 0, 1, 1, 1,
-1.465748, -1.103121, -1.872038, 1, 0, 0, 1, 1,
-1.443018, -1.657336, -2.939728, 1, 0, 0, 1, 1,
-1.439422, 0.03036218, -1.309694, 1, 0, 0, 1, 1,
-1.432327, -1.621966, -3.543113, 1, 0, 0, 1, 1,
-1.430759, -0.8580604, -3.151102, 1, 0, 0, 1, 1,
-1.430198, 1.0898, 0.3993462, 0, 0, 0, 1, 1,
-1.429542, -0.84115, -2.810853, 0, 0, 0, 1, 1,
-1.42885, -0.7177134, -1.948398, 0, 0, 0, 1, 1,
-1.42812, -1.974403, -1.754481, 0, 0, 0, 1, 1,
-1.425192, -0.1431465, -2.229536, 0, 0, 0, 1, 1,
-1.419426, -1.399928, -3.899001, 0, 0, 0, 1, 1,
-1.41268, -0.7626328, -3.520282, 0, 0, 0, 1, 1,
-1.409893, 1.118169, 1.825914, 1, 1, 1, 1, 1,
-1.405519, -0.989333, -0.5485227, 1, 1, 1, 1, 1,
-1.38121, -0.8060842, -2.390703, 1, 1, 1, 1, 1,
-1.377482, -1.140645, -1.386208, 1, 1, 1, 1, 1,
-1.368001, -1.754737, -3.094726, 1, 1, 1, 1, 1,
-1.363939, -0.7823002, -3.321641, 1, 1, 1, 1, 1,
-1.356858, 0.4460086, -2.100226, 1, 1, 1, 1, 1,
-1.353996, -0.1857941, -4.446903, 1, 1, 1, 1, 1,
-1.351209, -1.940126, -5.270048, 1, 1, 1, 1, 1,
-1.345184, -1.574666, -2.323961, 1, 1, 1, 1, 1,
-1.331994, -0.2096028, -0.04729094, 1, 1, 1, 1, 1,
-1.320958, -0.827741, -2.375776, 1, 1, 1, 1, 1,
-1.319211, 1.20459, 0.06316224, 1, 1, 1, 1, 1,
-1.315281, 2.065017, 0.7708541, 1, 1, 1, 1, 1,
-1.308075, -0.8777894, -0.9551829, 1, 1, 1, 1, 1,
-1.306188, -1.291916, -3.1692, 0, 0, 1, 1, 1,
-1.303197, 0.02832945, -2.606193, 1, 0, 0, 1, 1,
-1.302165, -0.6691646, -1.602003, 1, 0, 0, 1, 1,
-1.29144, 0.4754732, -1.243319, 1, 0, 0, 1, 1,
-1.282487, -0.6785907, -1.350428, 1, 0, 0, 1, 1,
-1.280527, 0.5990289, -1.853949, 1, 0, 0, 1, 1,
-1.27354, 1.161959, -0.3930738, 0, 0, 0, 1, 1,
-1.26658, -0.04442098, -1.690264, 0, 0, 0, 1, 1,
-1.262507, -1.230863, -0.6536903, 0, 0, 0, 1, 1,
-1.258604, 0.4142315, -0.9628654, 0, 0, 0, 1, 1,
-1.255918, 0.02189424, 0.2945864, 0, 0, 0, 1, 1,
-1.24381, -0.2871236, -2.323393, 0, 0, 0, 1, 1,
-1.243245, 1.064492, -0.849822, 0, 0, 0, 1, 1,
-1.240409, 0.01175495, 0.1411843, 1, 1, 1, 1, 1,
-1.230261, 0.7216294, -1.709482, 1, 1, 1, 1, 1,
-1.224049, 1.063257, -0.638201, 1, 1, 1, 1, 1,
-1.220175, -1.433189, -2.204106, 1, 1, 1, 1, 1,
-1.207499, -0.5635983, -2.748924, 1, 1, 1, 1, 1,
-1.204377, -0.3640299, -0.8066431, 1, 1, 1, 1, 1,
-1.195698, -0.1350667, -1.473452, 1, 1, 1, 1, 1,
-1.192671, 0.06094921, 0.07547551, 1, 1, 1, 1, 1,
-1.188783, 0.1376641, -0.07699217, 1, 1, 1, 1, 1,
-1.184751, 0.9346349, -1.996629, 1, 1, 1, 1, 1,
-1.164728, 0.1167515, -1.967367, 1, 1, 1, 1, 1,
-1.135075, -2.543377, -1.753207, 1, 1, 1, 1, 1,
-1.132311, 1.254541, 0.9882292, 1, 1, 1, 1, 1,
-1.115024, -0.3632974, -0.8738872, 1, 1, 1, 1, 1,
-1.108601, -0.07672462, -2.399641, 1, 1, 1, 1, 1,
-1.096351, -1.380491, -2.12171, 0, 0, 1, 1, 1,
-1.091223, 0.4052724, -1.535277, 1, 0, 0, 1, 1,
-1.088124, 0.01919763, -2.806811, 1, 0, 0, 1, 1,
-1.087281, -0.05648612, -1.709071, 1, 0, 0, 1, 1,
-1.082361, -0.756104, -1.928354, 1, 0, 0, 1, 1,
-1.082299, 1.317126, -0.1594711, 1, 0, 0, 1, 1,
-1.072945, -1.308955, -3.460016, 0, 0, 0, 1, 1,
-1.07246, 1.266621, -1.774684, 0, 0, 0, 1, 1,
-1.07171, -0.6117489, -2.091619, 0, 0, 0, 1, 1,
-1.06924, 0.2708867, -0.7216271, 0, 0, 0, 1, 1,
-1.067485, 1.098799, -0.05805308, 0, 0, 0, 1, 1,
-1.067361, 1.561226, 0.2749133, 0, 0, 0, 1, 1,
-1.059588, -0.4076407, -1.806232, 0, 0, 0, 1, 1,
-1.049947, -0.296731, -1.77241, 1, 1, 1, 1, 1,
-1.049912, -0.5297595, -1.995625, 1, 1, 1, 1, 1,
-1.045682, 1.21139, -1.304166, 1, 1, 1, 1, 1,
-1.045121, 0.838881, -0.2836103, 1, 1, 1, 1, 1,
-1.03313, -0.5564293, -1.2572, 1, 1, 1, 1, 1,
-1.032836, 0.01816491, -2.006806, 1, 1, 1, 1, 1,
-1.029779, 0.7330294, -1.290058, 1, 1, 1, 1, 1,
-1.022815, 0.6210098, -0.6523979, 1, 1, 1, 1, 1,
-1.020444, -0.9423463, -2.168148, 1, 1, 1, 1, 1,
-1.004697, 0.8823878, 0.04837322, 1, 1, 1, 1, 1,
-1.003943, 0.793458, -0.9977029, 1, 1, 1, 1, 1,
-0.9977744, 0.00301746, -2.31951, 1, 1, 1, 1, 1,
-0.9935881, 1.225111, 1.485611, 1, 1, 1, 1, 1,
-0.9890184, -1.300041, -3.053346, 1, 1, 1, 1, 1,
-0.9857978, 1.07146, -1.719183, 1, 1, 1, 1, 1,
-0.9851229, -0.5582828, -1.746109, 0, 0, 1, 1, 1,
-0.9826533, 1.729804, -0.1365125, 1, 0, 0, 1, 1,
-0.9825345, 0.8521314, -3.541583, 1, 0, 0, 1, 1,
-0.9816962, 0.001021654, -2.729351, 1, 0, 0, 1, 1,
-0.9649034, -0.3271082, -3.127459, 1, 0, 0, 1, 1,
-0.9617094, 0.5468719, -0.323184, 1, 0, 0, 1, 1,
-0.9608267, 0.8652537, 0.09536154, 0, 0, 0, 1, 1,
-0.9594587, 0.07800962, -0.9899043, 0, 0, 0, 1, 1,
-0.9528311, -0.4854431, -0.9468549, 0, 0, 0, 1, 1,
-0.9511046, 0.8925514, -0.1687611, 0, 0, 0, 1, 1,
-0.9482673, 1.418462, 1.075178, 0, 0, 0, 1, 1,
-0.9477925, 1.034473, -0.6845481, 0, 0, 0, 1, 1,
-0.9426091, 0.9101278, -0.08281802, 0, 0, 0, 1, 1,
-0.9403744, -0.1150841, -3.079016, 1, 1, 1, 1, 1,
-0.933743, 1.306076, -0.3208703, 1, 1, 1, 1, 1,
-0.9308777, 0.6569628, -2.767627, 1, 1, 1, 1, 1,
-0.9306237, 1.847625, -0.2876659, 1, 1, 1, 1, 1,
-0.9228978, 2.117885, 0.9339249, 1, 1, 1, 1, 1,
-0.9166645, 0.7079719, -1.176086, 1, 1, 1, 1, 1,
-0.9145156, 0.07246001, -3.37806, 1, 1, 1, 1, 1,
-0.9107383, 0.4054557, -0.47363, 1, 1, 1, 1, 1,
-0.9100449, 1.107234, -1.523208, 1, 1, 1, 1, 1,
-0.9020966, 0.1478815, -0.08770777, 1, 1, 1, 1, 1,
-0.8981663, 0.753161, -1.918056, 1, 1, 1, 1, 1,
-0.8973086, -2.611942, -1.361537, 1, 1, 1, 1, 1,
-0.8936094, 0.7452456, -0.3634662, 1, 1, 1, 1, 1,
-0.8875297, -0.4353656, -3.957358, 1, 1, 1, 1, 1,
-0.8856395, -2.684147, -4.339207, 1, 1, 1, 1, 1,
-0.8787387, 0.5795687, -2.26371, 0, 0, 1, 1, 1,
-0.8774522, 0.05902873, -1.830914, 1, 0, 0, 1, 1,
-0.8709393, -1.190267, -2.873582, 1, 0, 0, 1, 1,
-0.8702559, -0.7805731, -2.642493, 1, 0, 0, 1, 1,
-0.865453, -0.1112657, -2.077394, 1, 0, 0, 1, 1,
-0.864855, -0.379337, 0.1373435, 1, 0, 0, 1, 1,
-0.8616055, -0.07845411, -2.327875, 0, 0, 0, 1, 1,
-0.8592062, -1.175031, -2.814544, 0, 0, 0, 1, 1,
-0.8575246, 0.303188, -0.7101781, 0, 0, 0, 1, 1,
-0.8574572, 0.8980958, -0.07009582, 0, 0, 0, 1, 1,
-0.8567241, 0.7165363, -1.937502, 0, 0, 0, 1, 1,
-0.8438882, 0.7037145, -0.7642356, 0, 0, 0, 1, 1,
-0.8401102, 0.4434797, -0.4433194, 0, 0, 0, 1, 1,
-0.8359062, 0.7181118, -1.209102, 1, 1, 1, 1, 1,
-0.8299556, 0.1340685, -1.699123, 1, 1, 1, 1, 1,
-0.8292686, -2.455733, -0.685277, 1, 1, 1, 1, 1,
-0.8290451, 0.01840292, -2.38626, 1, 1, 1, 1, 1,
-0.8288959, -0.6423611, -2.688326, 1, 1, 1, 1, 1,
-0.8186595, 0.5859763, -1.203738, 1, 1, 1, 1, 1,
-0.8144023, -1.31185, -3.697802, 1, 1, 1, 1, 1,
-0.8104779, 0.2785634, -0.9709074, 1, 1, 1, 1, 1,
-0.8075521, 0.1226912, -2.25091, 1, 1, 1, 1, 1,
-0.8031414, -1.801138, -2.494657, 1, 1, 1, 1, 1,
-0.8010162, 2.385158, -0.1633297, 1, 1, 1, 1, 1,
-0.7941661, 0.8603995, -1.076479, 1, 1, 1, 1, 1,
-0.7859948, -0.7282454, -2.137201, 1, 1, 1, 1, 1,
-0.7792479, 0.3836734, -1.157084, 1, 1, 1, 1, 1,
-0.7786068, 1.334307, 1.147576, 1, 1, 1, 1, 1,
-0.7754592, -0.2474939, -0.619716, 0, 0, 1, 1, 1,
-0.7698073, -0.5744025, -0.06315335, 1, 0, 0, 1, 1,
-0.7696993, 0.881276, -0.8708866, 1, 0, 0, 1, 1,
-0.757221, -0.3583051, -0.9428514, 1, 0, 0, 1, 1,
-0.7543184, 0.4815031, -1.428679, 1, 0, 0, 1, 1,
-0.7516237, 1.785712, -0.2060769, 1, 0, 0, 1, 1,
-0.7445859, -0.3120223, -0.2965412, 0, 0, 0, 1, 1,
-0.742086, 0.03159825, -1.554345, 0, 0, 0, 1, 1,
-0.7408264, -0.3133814, -2.743039, 0, 0, 0, 1, 1,
-0.7381908, 0.6136066, -1.467985, 0, 0, 0, 1, 1,
-0.7381093, 0.9756005, -0.18913, 0, 0, 0, 1, 1,
-0.7380709, -1.940876, -3.760779, 0, 0, 0, 1, 1,
-0.7374818, 0.4669868, -1.068256, 0, 0, 0, 1, 1,
-0.736199, -0.5163323, -2.835265, 1, 1, 1, 1, 1,
-0.7312807, 1.486961, -0.6571544, 1, 1, 1, 1, 1,
-0.7285401, 0.3637597, -0.0490136, 1, 1, 1, 1, 1,
-0.721517, -0.3863678, -0.6033744, 1, 1, 1, 1, 1,
-0.7199661, -0.4042597, -2.402739, 1, 1, 1, 1, 1,
-0.7177199, 0.8017206, 1.837775, 1, 1, 1, 1, 1,
-0.7164891, 0.5113814, -2.37162, 1, 1, 1, 1, 1,
-0.7112542, 1.127615, -2.8011, 1, 1, 1, 1, 1,
-0.7107832, -0.4846163, -0.4904073, 1, 1, 1, 1, 1,
-0.7092544, -2.307212, -2.184792, 1, 1, 1, 1, 1,
-0.7064767, -1.354154, -3.143882, 1, 1, 1, 1, 1,
-0.7003565, -0.778407, -2.15008, 1, 1, 1, 1, 1,
-0.6998665, -0.8121739, -2.808117, 1, 1, 1, 1, 1,
-0.6899504, -0.8517365, -2.230069, 1, 1, 1, 1, 1,
-0.6835236, 1.126321, -1.146801, 1, 1, 1, 1, 1,
-0.683232, -1.239262, -2.599498, 0, 0, 1, 1, 1,
-0.6797093, 0.3903884, -1.046582, 1, 0, 0, 1, 1,
-0.6768776, 0.5771001, -0.7481166, 1, 0, 0, 1, 1,
-0.6768061, 0.2971613, -1.256014, 1, 0, 0, 1, 1,
-0.6763154, -0.4056713, -2.387892, 1, 0, 0, 1, 1,
-0.6703286, -0.1089049, 0.9446574, 1, 0, 0, 1, 1,
-0.6695365, -0.9467538, -3.770732, 0, 0, 0, 1, 1,
-0.6688756, -0.7086941, -3.317972, 0, 0, 0, 1, 1,
-0.6642541, -0.8401774, -4.623364, 0, 0, 0, 1, 1,
-0.6631263, -1.477214, -3.012598, 0, 0, 0, 1, 1,
-0.6620885, -0.7636282, -0.4278828, 0, 0, 0, 1, 1,
-0.6603845, 0.1735481, -1.016794, 0, 0, 0, 1, 1,
-0.6575127, 0.4743357, -1.46538, 0, 0, 0, 1, 1,
-0.6550841, -2.056015, -1.206776, 1, 1, 1, 1, 1,
-0.6542652, -0.080318, -1.968775, 1, 1, 1, 1, 1,
-0.64605, 0.7893075, -2.160721, 1, 1, 1, 1, 1,
-0.6417336, -0.3744238, -4.29371, 1, 1, 1, 1, 1,
-0.6328724, 0.5889271, -0.7618933, 1, 1, 1, 1, 1,
-0.6303987, 0.6409283, -2.773434, 1, 1, 1, 1, 1,
-0.6224425, 1.251416, -2.765232, 1, 1, 1, 1, 1,
-0.6220145, -0.2555204, -1.317718, 1, 1, 1, 1, 1,
-0.621776, 0.945519, -0.6254293, 1, 1, 1, 1, 1,
-0.6217071, -1.004316, -2.573585, 1, 1, 1, 1, 1,
-0.6145059, -1.84283, -3.160414, 1, 1, 1, 1, 1,
-0.6107667, 1.280366, -0.2350221, 1, 1, 1, 1, 1,
-0.6039305, 0.9611938, -0.07101464, 1, 1, 1, 1, 1,
-0.6032102, -1.22474, -1.905071, 1, 1, 1, 1, 1,
-0.5977803, 0.09185003, -0.3868647, 1, 1, 1, 1, 1,
-0.5920677, -0.5619465, -1.555223, 0, 0, 1, 1, 1,
-0.5855556, 0.1594155, -1.079597, 1, 0, 0, 1, 1,
-0.584527, -0.2837903, -3.20902, 1, 0, 0, 1, 1,
-0.572542, 0.007018223, -2.594991, 1, 0, 0, 1, 1,
-0.569662, 0.7779986, -2.226734, 1, 0, 0, 1, 1,
-0.5674728, 2.003361, 0.5612041, 1, 0, 0, 1, 1,
-0.5641646, -0.4024985, -3.02869, 0, 0, 0, 1, 1,
-0.5569649, 0.65115, -0.6016124, 0, 0, 0, 1, 1,
-0.5555864, -0.4187057, -2.854682, 0, 0, 0, 1, 1,
-0.5537194, 0.02109246, -1.056828, 0, 0, 0, 1, 1,
-0.5512282, -1.847568, -1.71774, 0, 0, 0, 1, 1,
-0.5512118, -0.7153159, -2.03801, 0, 0, 0, 1, 1,
-0.5462509, -0.7985383, -3.181689, 0, 0, 0, 1, 1,
-0.5401433, 0.155029, -0.794386, 1, 1, 1, 1, 1,
-0.5401228, -0.7759629, -2.954706, 1, 1, 1, 1, 1,
-0.5395002, 1.219754, -0.3758957, 1, 1, 1, 1, 1,
-0.5387761, 0.8834896, -1.59555, 1, 1, 1, 1, 1,
-0.5385177, -0.02122036, -1.945123, 1, 1, 1, 1, 1,
-0.5371575, -1.095867, -1.656429, 1, 1, 1, 1, 1,
-0.5358235, -0.03958171, -2.558366, 1, 1, 1, 1, 1,
-0.5354433, -2.104844, -4.012254, 1, 1, 1, 1, 1,
-0.5299212, 1.08374, -3.010712, 1, 1, 1, 1, 1,
-0.529653, -0.2041264, -1.367023, 1, 1, 1, 1, 1,
-0.5281093, 0.5855834, -1.66001, 1, 1, 1, 1, 1,
-0.5223154, -0.1450572, -2.953267, 1, 1, 1, 1, 1,
-0.5219769, -0.5321712, -2.1619, 1, 1, 1, 1, 1,
-0.5202711, -0.2477176, -3.261475, 1, 1, 1, 1, 1,
-0.5200694, -0.5131133, -2.861959, 1, 1, 1, 1, 1,
-0.517356, 0.05656365, -0.9881133, 0, 0, 1, 1, 1,
-0.51156, 1.749485, 0.3443945, 1, 0, 0, 1, 1,
-0.5103992, 0.05913851, -2.21023, 1, 0, 0, 1, 1,
-0.5082721, 0.6413448, -1.477524, 1, 0, 0, 1, 1,
-0.5080952, 0.1917237, -0.5978583, 1, 0, 0, 1, 1,
-0.5079123, 0.4515916, -1.641097, 1, 0, 0, 1, 1,
-0.5035751, -1.97733, -1.187204, 0, 0, 0, 1, 1,
-0.5025425, -0.7578158, -1.756349, 0, 0, 0, 1, 1,
-0.5016069, 0.8472345, 0.09505601, 0, 0, 0, 1, 1,
-0.5008513, 1.363733, -0.4067544, 0, 0, 0, 1, 1,
-0.5001017, -1.513694, -4.675259, 0, 0, 0, 1, 1,
-0.5000752, 0.019262, -0.9158058, 0, 0, 0, 1, 1,
-0.4993923, -0.08520883, -2.724447, 0, 0, 0, 1, 1,
-0.4991761, 0.8023226, 2.76623, 1, 1, 1, 1, 1,
-0.490219, 0.8661337, -1.823899, 1, 1, 1, 1, 1,
-0.4876907, -0.1384366, -0.4750411, 1, 1, 1, 1, 1,
-0.4837694, 0.7873486, -0.4578937, 1, 1, 1, 1, 1,
-0.4817429, 2.264538, -1.893703, 1, 1, 1, 1, 1,
-0.4787075, 0.7759353, 0.1920149, 1, 1, 1, 1, 1,
-0.4782951, -0.01524826, -0.7578148, 1, 1, 1, 1, 1,
-0.4775737, 1.087429, -1.189947, 1, 1, 1, 1, 1,
-0.4755855, 1.151801, -1.8633, 1, 1, 1, 1, 1,
-0.4728916, -0.4133061, -2.640758, 1, 1, 1, 1, 1,
-0.4714372, 0.4610381, -1.480291, 1, 1, 1, 1, 1,
-0.4707071, 1.081244, -0.3756564, 1, 1, 1, 1, 1,
-0.4703147, -2.099033, -2.992158, 1, 1, 1, 1, 1,
-0.4694526, -1.194559, -2.684398, 1, 1, 1, 1, 1,
-0.4685497, -0.535489, -3.578579, 1, 1, 1, 1, 1,
-0.4617453, -1.713193, -2.348459, 0, 0, 1, 1, 1,
-0.4610513, 0.3786435, -1.186687, 1, 0, 0, 1, 1,
-0.457889, 0.6319224, -0.1223657, 1, 0, 0, 1, 1,
-0.45717, 0.236394, -1.495324, 1, 0, 0, 1, 1,
-0.454913, 1.227892, -1.766564, 1, 0, 0, 1, 1,
-0.4536977, 0.7578672, -1.320913, 1, 0, 0, 1, 1,
-0.4531652, -0.08966328, -1.898497, 0, 0, 0, 1, 1,
-0.4476113, -0.622698, -0.980029, 0, 0, 0, 1, 1,
-0.4415965, -0.2280911, -1.852414, 0, 0, 0, 1, 1,
-0.441376, 2.681843, -1.791566, 0, 0, 0, 1, 1,
-0.4409239, -0.4061086, -0.8613923, 0, 0, 0, 1, 1,
-0.4408508, 0.7146699, 0.7520697, 0, 0, 0, 1, 1,
-0.4367909, 0.9810605, -1.71732, 0, 0, 0, 1, 1,
-0.4362408, 0.9546736, -1.424027, 1, 1, 1, 1, 1,
-0.4348782, 0.05434546, -2.231767, 1, 1, 1, 1, 1,
-0.4338749, -0.7468557, -2.511184, 1, 1, 1, 1, 1,
-0.4311868, 1.430291, -0.678609, 1, 1, 1, 1, 1,
-0.4289482, 0.1714689, -1.723667, 1, 1, 1, 1, 1,
-0.4159247, 1.098245, -0.1772639, 1, 1, 1, 1, 1,
-0.4136237, -2.123164, -3.269489, 1, 1, 1, 1, 1,
-0.4071379, 1.023765, -0.06640662, 1, 1, 1, 1, 1,
-0.3972576, 1.178836, -1.238516, 1, 1, 1, 1, 1,
-0.3922871, 0.5938462, 1.802708, 1, 1, 1, 1, 1,
-0.3913801, 1.734067, 1.06638, 1, 1, 1, 1, 1,
-0.389771, 0.1754306, -1.977574, 1, 1, 1, 1, 1,
-0.388337, -1.172775, -2.074079, 1, 1, 1, 1, 1,
-0.3866819, 0.139257, -0.3407281, 1, 1, 1, 1, 1,
-0.3863299, -0.4177438, -3.056479, 1, 1, 1, 1, 1,
-0.3820506, 0.4957805, 0.6406316, 0, 0, 1, 1, 1,
-0.3818469, -0.5427917, -2.114214, 1, 0, 0, 1, 1,
-0.3798098, -0.336873, -2.998687, 1, 0, 0, 1, 1,
-0.3739387, -0.3966554, -3.875783, 1, 0, 0, 1, 1,
-0.3732249, -0.660121, -2.689653, 1, 0, 0, 1, 1,
-0.3716265, -0.08256739, -2.180933, 1, 0, 0, 1, 1,
-0.3695132, 0.751501, 0.2953692, 0, 0, 0, 1, 1,
-0.3692077, 1.348794, 2.66972, 0, 0, 0, 1, 1,
-0.3691669, -0.6996, -2.811488, 0, 0, 0, 1, 1,
-0.3611557, 0.1181031, 0.2686709, 0, 0, 0, 1, 1,
-0.35876, -0.8320702, -4.656383, 0, 0, 0, 1, 1,
-0.351452, -0.3749635, -1.281143, 0, 0, 0, 1, 1,
-0.3500391, 1.11402, -0.6804625, 0, 0, 0, 1, 1,
-0.3471902, -0.8786206, -2.907622, 1, 1, 1, 1, 1,
-0.3456462, 0.5033274, -1.119634, 1, 1, 1, 1, 1,
-0.3406323, -1.329388, -4.061325, 1, 1, 1, 1, 1,
-0.337225, -2.194737, -4.116649, 1, 1, 1, 1, 1,
-0.3367365, -0.9940692, -2.665757, 1, 1, 1, 1, 1,
-0.3299028, 0.69548, 0.8997389, 1, 1, 1, 1, 1,
-0.3285225, -2.742996, -3.727364, 1, 1, 1, 1, 1,
-0.3240082, -0.8944743, -3.003429, 1, 1, 1, 1, 1,
-0.3222368, 0.6038587, -1.308657, 1, 1, 1, 1, 1,
-0.3219827, 0.491228, -0.1136714, 1, 1, 1, 1, 1,
-0.319416, -1.332896, -3.128249, 1, 1, 1, 1, 1,
-0.3166213, -0.4382561, -3.887407, 1, 1, 1, 1, 1,
-0.3115545, 1.214428, -2.217589, 1, 1, 1, 1, 1,
-0.311018, 1.10339, 0.7221609, 1, 1, 1, 1, 1,
-0.3109291, 0.1836701, -1.125035, 1, 1, 1, 1, 1,
-0.3103925, -2.999434, -2.571112, 0, 0, 1, 1, 1,
-0.3079767, -0.5342225, -1.818966, 1, 0, 0, 1, 1,
-0.3074915, 0.774009, -0.7940574, 1, 0, 0, 1, 1,
-0.3003167, 1.285962, 0.3804778, 1, 0, 0, 1, 1,
-0.3002634, 0.2622096, 1.457467, 1, 0, 0, 1, 1,
-0.3002166, -0.08493195, -1.443145, 1, 0, 0, 1, 1,
-0.2986094, 0.6148353, 0.2320205, 0, 0, 0, 1, 1,
-0.2942481, 2.602338, 0.1190943, 0, 0, 0, 1, 1,
-0.2940983, 0.2340828, -1.171406, 0, 0, 0, 1, 1,
-0.2905894, -0.9023098, -2.753472, 0, 0, 0, 1, 1,
-0.2904584, -0.5406119, -1.295859, 0, 0, 0, 1, 1,
-0.286858, 0.4612905, 0.3735151, 0, 0, 0, 1, 1,
-0.2858931, 0.7948825, -0.8700994, 0, 0, 0, 1, 1,
-0.2825266, 0.09641239, 0.06125095, 1, 1, 1, 1, 1,
-0.2719951, -0.4237975, -2.554076, 1, 1, 1, 1, 1,
-0.2717461, 1.77566, 1.468146, 1, 1, 1, 1, 1,
-0.2658252, -1.507809, -3.024279, 1, 1, 1, 1, 1,
-0.2652989, 1.061905, 0.3337271, 1, 1, 1, 1, 1,
-0.2608268, 0.3475653, 0.2305494, 1, 1, 1, 1, 1,
-0.2599895, 0.5988106, -0.677982, 1, 1, 1, 1, 1,
-0.2473698, 1.874919, 0.3474801, 1, 1, 1, 1, 1,
-0.2452309, 0.4879619, -0.2446672, 1, 1, 1, 1, 1,
-0.2402327, -0.8368582, -2.571805, 1, 1, 1, 1, 1,
-0.2378993, -0.3859371, -3.945231, 1, 1, 1, 1, 1,
-0.2330899, -0.1398562, -1.799497, 1, 1, 1, 1, 1,
-0.2312368, -1.0744, -2.767457, 1, 1, 1, 1, 1,
-0.2311059, -0.4870333, -2.861467, 1, 1, 1, 1, 1,
-0.2288001, 0.1836733, -0.4637929, 1, 1, 1, 1, 1,
-0.2266126, -0.6656511, -2.592913, 0, 0, 1, 1, 1,
-0.2219156, 0.2263222, -0.8315266, 1, 0, 0, 1, 1,
-0.2200848, -0.4290283, -1.314159, 1, 0, 0, 1, 1,
-0.2188133, -0.5723328, -2.123855, 1, 0, 0, 1, 1,
-0.2165852, -0.5612578, -3.424704, 1, 0, 0, 1, 1,
-0.2145221, -0.6401429, -1.082744, 1, 0, 0, 1, 1,
-0.2128579, -0.09494179, -1.639151, 0, 0, 0, 1, 1,
-0.2034082, -1.308926, -2.51409, 0, 0, 0, 1, 1,
-0.1989277, -1.199419, -4.361946, 0, 0, 0, 1, 1,
-0.1921599, -0.133937, -2.949127, 0, 0, 0, 1, 1,
-0.1916378, 1.72357, -0.5857082, 0, 0, 0, 1, 1,
-0.1908966, 0.2225407, -0.4621865, 0, 0, 0, 1, 1,
-0.1894761, 0.6615101, 0.6227504, 0, 0, 0, 1, 1,
-0.1861155, -0.4468083, -3.109895, 1, 1, 1, 1, 1,
-0.181694, 0.1533338, -1.265887, 1, 1, 1, 1, 1,
-0.1778685, -0.3135475, -1.778726, 1, 1, 1, 1, 1,
-0.1744563, -0.7501855, -1.556628, 1, 1, 1, 1, 1,
-0.1742102, 0.2579735, 0.3602782, 1, 1, 1, 1, 1,
-0.1713925, -0.7695934, -1.645688, 1, 1, 1, 1, 1,
-0.1683746, -1.501046, -2.144427, 1, 1, 1, 1, 1,
-0.1675648, 0.6808395, -0.7567538, 1, 1, 1, 1, 1,
-0.1596596, -0.4226434, -3.047612, 1, 1, 1, 1, 1,
-0.1580233, -0.293807, -2.375362, 1, 1, 1, 1, 1,
-0.1565849, 1.491848, -0.815832, 1, 1, 1, 1, 1,
-0.1509948, 1.72511, 1.018193, 1, 1, 1, 1, 1,
-0.1479241, -0.1957283, -2.604587, 1, 1, 1, 1, 1,
-0.1415151, -0.5134491, -4.292598, 1, 1, 1, 1, 1,
-0.1398691, -0.1224097, -3.175364, 1, 1, 1, 1, 1,
-0.1390361, 1.121329, -0.8112197, 0, 0, 1, 1, 1,
-0.1354035, -1.288275, -3.072166, 1, 0, 0, 1, 1,
-0.1323841, 1.753702, 0.8056635, 1, 0, 0, 1, 1,
-0.1263765, 0.01484768, -0.4107606, 1, 0, 0, 1, 1,
-0.1251901, -0.578271, -2.946924, 1, 0, 0, 1, 1,
-0.1251176, -1.023127, -2.194486, 1, 0, 0, 1, 1,
-0.1247523, 2.132332, -0.2072325, 0, 0, 0, 1, 1,
-0.1236979, -1.406026, -1.856621, 0, 0, 0, 1, 1,
-0.1202117, 1.40704, -0.4400814, 0, 0, 0, 1, 1,
-0.118846, 0.457169, 0.7451052, 0, 0, 0, 1, 1,
-0.1188099, 0.5506965, -0.02542412, 0, 0, 0, 1, 1,
-0.1184406, -0.6964057, -3.717896, 0, 0, 0, 1, 1,
-0.11489, 2.193474, 0.19435, 0, 0, 0, 1, 1,
-0.1139658, 0.4811026, -2.047468, 1, 1, 1, 1, 1,
-0.1135957, -0.2042035, -1.617405, 1, 1, 1, 1, 1,
-0.1104122, -0.09787488, -2.780293, 1, 1, 1, 1, 1,
-0.1099583, 0.2701079, -0.3423173, 1, 1, 1, 1, 1,
-0.1095099, -1.594008, -3.662542, 1, 1, 1, 1, 1,
-0.1078838, 0.09507579, 0.06609652, 1, 1, 1, 1, 1,
-0.1068453, -0.8877716, -2.02083, 1, 1, 1, 1, 1,
-0.1063777, 0.03792319, -1.754973, 1, 1, 1, 1, 1,
-0.1029018, 0.6172644, 0.6093951, 1, 1, 1, 1, 1,
-0.1001096, 0.4210264, -1.914342, 1, 1, 1, 1, 1,
-0.09955353, -1.429902, -3.392326, 1, 1, 1, 1, 1,
-0.09774278, -1.246448, -5.058166, 1, 1, 1, 1, 1,
-0.09548312, -1.22709, -2.263966, 1, 1, 1, 1, 1,
-0.09314741, 0.6348588, -0.7776992, 1, 1, 1, 1, 1,
-0.09036736, 0.1689333, -0.07554618, 1, 1, 1, 1, 1,
-0.08151394, -1.053391, -3.223853, 0, 0, 1, 1, 1,
-0.0766172, -1.556816, -4.102559, 1, 0, 0, 1, 1,
-0.07622847, 1.234612, 0.2532443, 1, 0, 0, 1, 1,
-0.07435901, -0.1477602, -3.331445, 1, 0, 0, 1, 1,
-0.06485148, -1.747474, -2.214747, 1, 0, 0, 1, 1,
-0.05896626, 0.1286674, 0.3448211, 1, 0, 0, 1, 1,
-0.05500204, -0.4916798, -4.521025, 0, 0, 0, 1, 1,
-0.02914295, -0.1777989, -1.562618, 0, 0, 0, 1, 1,
-0.02522858, 0.5142834, -0.3842146, 0, 0, 0, 1, 1,
-0.02384399, -0.3447766, -3.524991, 0, 0, 0, 1, 1,
-0.0233782, 1.087405, 0.6319994, 0, 0, 0, 1, 1,
-0.01726446, 0.4592035, -0.765066, 0, 0, 0, 1, 1,
-0.01560003, -0.5532315, -2.069234, 0, 0, 0, 1, 1,
-0.01456299, -1.206307, -3.010518, 1, 1, 1, 1, 1,
-0.01184263, 0.6305192, 1.089161, 1, 1, 1, 1, 1,
-0.0101876, -0.1681172, -4.074005, 1, 1, 1, 1, 1,
-0.009187504, -1.061303, -3.739663, 1, 1, 1, 1, 1,
-0.009142842, -1.312533, -3.93082, 1, 1, 1, 1, 1,
0.002007824, -0.4381002, 2.372802, 1, 1, 1, 1, 1,
0.002936231, 0.1012548, 1.076437, 1, 1, 1, 1, 1,
0.01916938, -1.983553, 0.7900652, 1, 1, 1, 1, 1,
0.02016312, -0.8436334, 4.611751, 1, 1, 1, 1, 1,
0.02046978, 0.8531419, 0.8183193, 1, 1, 1, 1, 1,
0.0206301, 0.07947476, -0.800397, 1, 1, 1, 1, 1,
0.02104946, -0.6681005, 2.442544, 1, 1, 1, 1, 1,
0.02201332, -0.8040575, 3.101243, 1, 1, 1, 1, 1,
0.02564631, -0.05859588, 4.261283, 1, 1, 1, 1, 1,
0.02721427, 1.586493, 1.004285, 1, 1, 1, 1, 1,
0.02742767, -0.5027532, 2.060195, 0, 0, 1, 1, 1,
0.03253664, -1.494701, 3.75577, 1, 0, 0, 1, 1,
0.03280878, -0.1264967, 2.641278, 1, 0, 0, 1, 1,
0.03448827, -0.3332812, 3.807143, 1, 0, 0, 1, 1,
0.04070304, 0.06888837, 0.9215286, 1, 0, 0, 1, 1,
0.04363165, 1.070789, 1.902612, 1, 0, 0, 1, 1,
0.04584719, -2.12367, 3.818457, 0, 0, 0, 1, 1,
0.04721996, 1.008875, 0.7933095, 0, 0, 0, 1, 1,
0.04845244, 0.05955257, 0.539516, 0, 0, 0, 1, 1,
0.04925635, 3.073703, 0.5928947, 0, 0, 0, 1, 1,
0.05547895, 0.01697692, 1.924624, 0, 0, 0, 1, 1,
0.05605988, 1.689448, -0.2536858, 0, 0, 0, 1, 1,
0.05818059, 0.479307, -0.9192079, 0, 0, 0, 1, 1,
0.06017492, -1.059434, 1.826148, 1, 1, 1, 1, 1,
0.06018964, -0.401898, 1.783124, 1, 1, 1, 1, 1,
0.0631792, -1.018303, 3.545341, 1, 1, 1, 1, 1,
0.06483661, 0.1780722, 0.975042, 1, 1, 1, 1, 1,
0.06822594, -1.890165, 1.907862, 1, 1, 1, 1, 1,
0.07177999, 0.06504416, 1.408888, 1, 1, 1, 1, 1,
0.07310018, 0.1519188, 1.219522, 1, 1, 1, 1, 1,
0.07374857, 0.418189, -0.1210443, 1, 1, 1, 1, 1,
0.07762802, 2.176034, 0.5656138, 1, 1, 1, 1, 1,
0.08286848, -0.9260917, 3.619802, 1, 1, 1, 1, 1,
0.0844089, -1.235932, 2.721179, 1, 1, 1, 1, 1,
0.08468034, 0.2741196, -0.6497211, 1, 1, 1, 1, 1,
0.08516917, 0.3669668, -0.7898855, 1, 1, 1, 1, 1,
0.08853954, 0.4086502, -0.6519188, 1, 1, 1, 1, 1,
0.08885203, 1.275, 2.152405, 1, 1, 1, 1, 1,
0.09142541, -0.6468424, 0.9933286, 0, 0, 1, 1, 1,
0.09267707, 0.5244926, 1.122636, 1, 0, 0, 1, 1,
0.1004588, -0.1270375, 3.813389, 1, 0, 0, 1, 1,
0.1015843, -0.57275, 3.663359, 1, 0, 0, 1, 1,
0.1063852, -0.6512486, 2.646353, 1, 0, 0, 1, 1,
0.1066398, -0.3936006, 1.993348, 1, 0, 0, 1, 1,
0.1093188, 2.157909, 1.103129, 0, 0, 0, 1, 1,
0.1100352, -0.8194125, 3.64457, 0, 0, 0, 1, 1,
0.1107588, -1.639568, 3.371798, 0, 0, 0, 1, 1,
0.1135658, -0.4191316, 1.71755, 0, 0, 0, 1, 1,
0.1151254, 0.2731303, 0.5855271, 0, 0, 0, 1, 1,
0.1272886, -0.727964, 3.831472, 0, 0, 0, 1, 1,
0.1376141, 0.5808105, -0.4657424, 0, 0, 0, 1, 1,
0.1433459, -0.8011845, 2.36945, 1, 1, 1, 1, 1,
0.1470562, -0.4741331, 3.827297, 1, 1, 1, 1, 1,
0.1571831, 0.196458, 0.8272794, 1, 1, 1, 1, 1,
0.1628953, 0.3075911, 1.2271, 1, 1, 1, 1, 1,
0.1720449, -1.389112, 4.47053, 1, 1, 1, 1, 1,
0.1763202, 1.975792, -0.9116789, 1, 1, 1, 1, 1,
0.1771869, -0.8852422, 5.5591, 1, 1, 1, 1, 1,
0.1779282, 1.399385, -1.036578, 1, 1, 1, 1, 1,
0.1788052, 1.209557, 2.262397, 1, 1, 1, 1, 1,
0.1812991, 0.7637255, -0.3894622, 1, 1, 1, 1, 1,
0.1815055, -0.08511772, 0.2219256, 1, 1, 1, 1, 1,
0.1824345, 1.647434, 0.9204481, 1, 1, 1, 1, 1,
0.1835825, -0.001740978, 1.400982, 1, 1, 1, 1, 1,
0.1941425, 0.6358271, -0.2431384, 1, 1, 1, 1, 1,
0.1989093, -1.018026, 4.223725, 1, 1, 1, 1, 1,
0.1992891, -0.08684494, 2.689474, 0, 0, 1, 1, 1,
0.2084518, 0.6993049, 2.486913, 1, 0, 0, 1, 1,
0.209972, -0.4414556, 2.309141, 1, 0, 0, 1, 1,
0.2116211, -1.427408, 2.252697, 1, 0, 0, 1, 1,
0.213632, -1.591578, 4.581367, 1, 0, 0, 1, 1,
0.2136651, -2.346857, 1.780185, 1, 0, 0, 1, 1,
0.2146076, 0.8629712, -1.098622, 0, 0, 0, 1, 1,
0.2161055, -0.7628232, 2.864867, 0, 0, 0, 1, 1,
0.2162045, 0.3621722, -0.6108976, 0, 0, 0, 1, 1,
0.2238473, -0.9391683, 2.517865, 0, 0, 0, 1, 1,
0.225157, -0.1527416, 2.528991, 0, 0, 0, 1, 1,
0.2270751, 0.5719496, 0.8891177, 0, 0, 0, 1, 1,
0.2298161, -1.233711, 1.575625, 0, 0, 0, 1, 1,
0.2371029, -0.6148006, 3.887903, 1, 1, 1, 1, 1,
0.2381994, 0.1769927, 1.934048, 1, 1, 1, 1, 1,
0.242311, 0.2779891, 0.4954401, 1, 1, 1, 1, 1,
0.2444599, -0.5454867, 3.473028, 1, 1, 1, 1, 1,
0.2468035, -0.431292, 4.80056, 1, 1, 1, 1, 1,
0.2511605, 1.54701, -1.572286, 1, 1, 1, 1, 1,
0.2663332, 2.00752, -0.6972858, 1, 1, 1, 1, 1,
0.270646, 0.6982342, -0.9523742, 1, 1, 1, 1, 1,
0.2715947, 0.2415451, 1.354406, 1, 1, 1, 1, 1,
0.272094, 0.7888311, 0.05645306, 1, 1, 1, 1, 1,
0.2739034, -1.018903, 1.925283, 1, 1, 1, 1, 1,
0.2748258, 0.5628005, -0.6482077, 1, 1, 1, 1, 1,
0.2813934, 0.3254564, 2.865945, 1, 1, 1, 1, 1,
0.2817189, -0.1453936, 1.834148, 1, 1, 1, 1, 1,
0.2819208, 2.540906, -0.2232653, 1, 1, 1, 1, 1,
0.2830979, -0.8185086, 3.366296, 0, 0, 1, 1, 1,
0.2942536, 0.07142972, 0.2643285, 1, 0, 0, 1, 1,
0.2945127, 0.7729348, 1.064055, 1, 0, 0, 1, 1,
0.2950802, -1.350378, 4.473815, 1, 0, 0, 1, 1,
0.2969981, 0.6242304, 1.821963, 1, 0, 0, 1, 1,
0.2975428, 1.382707, -0.09933908, 1, 0, 0, 1, 1,
0.2976882, -0.937049, 5.342569, 0, 0, 0, 1, 1,
0.2979222, 1.443471, 0.5403429, 0, 0, 0, 1, 1,
0.2979565, 1.375482, 0.3212404, 0, 0, 0, 1, 1,
0.3003076, 1.132348, -1.185395, 0, 0, 0, 1, 1,
0.3034478, -1.079876, 2.602753, 0, 0, 0, 1, 1,
0.3035792, 1.889072, -0.3337611, 0, 0, 0, 1, 1,
0.3042478, 0.7979984, -1.155792, 0, 0, 0, 1, 1,
0.3054507, -0.5017794, 3.527658, 1, 1, 1, 1, 1,
0.306266, -0.9331388, 3.009055, 1, 1, 1, 1, 1,
0.3069899, 0.357892, -0.04228936, 1, 1, 1, 1, 1,
0.3086858, -1.463743, 3.042977, 1, 1, 1, 1, 1,
0.3088146, -0.6255789, 3.100796, 1, 1, 1, 1, 1,
0.3104838, 1.629887, 0.7209096, 1, 1, 1, 1, 1,
0.314732, 0.9480658, -0.0168601, 1, 1, 1, 1, 1,
0.3175543, -1.029507, 0.862755, 1, 1, 1, 1, 1,
0.3189894, 0.5863914, -0.700717, 1, 1, 1, 1, 1,
0.3229596, -0.03532689, 0.4961325, 1, 1, 1, 1, 1,
0.3286741, 1.318667, 1.910123, 1, 1, 1, 1, 1,
0.3325166, -0.9807883, 2.819246, 1, 1, 1, 1, 1,
0.3423895, -0.2810416, 1.65134, 1, 1, 1, 1, 1,
0.3494177, -0.8709357, 3.539799, 1, 1, 1, 1, 1,
0.3529241, 1.876338, 1.455444, 1, 1, 1, 1, 1,
0.358368, -1.600769, 3.613029, 0, 0, 1, 1, 1,
0.3595159, -1.235872, 2.879303, 1, 0, 0, 1, 1,
0.3604531, -2.010939, 3.753262, 1, 0, 0, 1, 1,
0.3621862, 1.240328, 0.1618187, 1, 0, 0, 1, 1,
0.3651035, 1.181326, -1.283572, 1, 0, 0, 1, 1,
0.3729446, 1.65891, 0.8335249, 1, 0, 0, 1, 1,
0.3738333, -0.2135738, 3.496795, 0, 0, 0, 1, 1,
0.3767609, -0.03256354, 3.812037, 0, 0, 0, 1, 1,
0.3775397, 1.186281, -0.2590471, 0, 0, 0, 1, 1,
0.3776127, 1.496077, 0.6438329, 0, 0, 0, 1, 1,
0.3787647, 0.9340798, 0.225558, 0, 0, 0, 1, 1,
0.3818238, -1.251016, 3.071463, 0, 0, 0, 1, 1,
0.3872338, 2.840378, 0.08422019, 0, 0, 0, 1, 1,
0.3904988, 0.6841169, -0.1144006, 1, 1, 1, 1, 1,
0.3994645, 1.548487, 0.9967898, 1, 1, 1, 1, 1,
0.4002987, -0.4580866, 4.030377, 1, 1, 1, 1, 1,
0.4034556, 0.9119303, 0.2406828, 1, 1, 1, 1, 1,
0.4075539, 0.8835803, 0.01209839, 1, 1, 1, 1, 1,
0.4083774, 0.5251371, 0.5211197, 1, 1, 1, 1, 1,
0.4095117, -0.4715172, 2.094266, 1, 1, 1, 1, 1,
0.4102119, 0.1325647, 0.06694876, 1, 1, 1, 1, 1,
0.4138343, 0.4132512, -0.2546354, 1, 1, 1, 1, 1,
0.4144556, 0.1327728, 1.123379, 1, 1, 1, 1, 1,
0.420517, 1.071559, 1.335535, 1, 1, 1, 1, 1,
0.4248827, -0.01170247, 1.741901, 1, 1, 1, 1, 1,
0.4255639, 0.2141282, 0.9402779, 1, 1, 1, 1, 1,
0.4257278, 0.5752047, 1.018565, 1, 1, 1, 1, 1,
0.4273825, 1.192261, 0.8790649, 1, 1, 1, 1, 1,
0.4341454, -0.889326, 3.439703, 0, 0, 1, 1, 1,
0.4347506, 1.383807, 1.578655, 1, 0, 0, 1, 1,
0.4370818, 0.2152642, 2.173779, 1, 0, 0, 1, 1,
0.4392403, -0.6146774, 2.158782, 1, 0, 0, 1, 1,
0.4409094, 0.8464792, -0.3036814, 1, 0, 0, 1, 1,
0.4497421, 1.27926, -0.4956415, 1, 0, 0, 1, 1,
0.4516959, -0.3976277, 1.209902, 0, 0, 0, 1, 1,
0.4561337, -0.1834717, 2.449663, 0, 0, 0, 1, 1,
0.4590091, -0.1188928, 1.252687, 0, 0, 0, 1, 1,
0.4604973, 0.9053213, -0.2539326, 0, 0, 0, 1, 1,
0.4611304, 1.004634, 0.2118374, 0, 0, 0, 1, 1,
0.4613256, -1.210156, 3.221354, 0, 0, 0, 1, 1,
0.4662225, -0.4857621, 3.307462, 0, 0, 0, 1, 1,
0.4685912, 0.65164, 0.7490664, 1, 1, 1, 1, 1,
0.4689121, -1.060031, 2.951863, 1, 1, 1, 1, 1,
0.475391, -0.6564075, 2.666432, 1, 1, 1, 1, 1,
0.477116, 2.115812, -0.7240375, 1, 1, 1, 1, 1,
0.4799061, 0.6617313, 0.1616696, 1, 1, 1, 1, 1,
0.4812126, -0.8046758, 1.337337, 1, 1, 1, 1, 1,
0.4812886, 0.2353649, 0.8771578, 1, 1, 1, 1, 1,
0.4846855, 0.5921593, 1.335205, 1, 1, 1, 1, 1,
0.4848574, 1.195854, 3.140835, 1, 1, 1, 1, 1,
0.4896047, 0.5038908, 2.348699, 1, 1, 1, 1, 1,
0.4909594, 0.2630153, 1.773561, 1, 1, 1, 1, 1,
0.4931243, 1.151264, 0.3439597, 1, 1, 1, 1, 1,
0.4934289, 1.839302, 1.117793, 1, 1, 1, 1, 1,
0.4945383, -1.898939, 3.791009, 1, 1, 1, 1, 1,
0.4986676, -1.35796, 3.238942, 1, 1, 1, 1, 1,
0.5046402, 0.3434512, 1.595603, 0, 0, 1, 1, 1,
0.5065976, -1.681069, 0.4011356, 1, 0, 0, 1, 1,
0.5074548, -0.9785728, 5.4189, 1, 0, 0, 1, 1,
0.5087715, 0.8830875, 1.002684, 1, 0, 0, 1, 1,
0.5215655, 0.7862959, -0.1336755, 1, 0, 0, 1, 1,
0.5245731, 1.733631, -1.01651, 1, 0, 0, 1, 1,
0.5281995, 0.4350501, 2.594942, 0, 0, 0, 1, 1,
0.5405837, -1.547611, 3.524637, 0, 0, 0, 1, 1,
0.5450422, -0.9993179, 1.787201, 0, 0, 0, 1, 1,
0.550282, -0.1140018, 0.9977646, 0, 0, 0, 1, 1,
0.550657, 0.2453431, 1.497293, 0, 0, 0, 1, 1,
0.5515941, -0.8298534, 1.449586, 0, 0, 0, 1, 1,
0.5540733, 0.08720709, 1.922256, 0, 0, 0, 1, 1,
0.5544963, -0.3745345, 2.985089, 1, 1, 1, 1, 1,
0.5550941, -0.2070175, -0.06532042, 1, 1, 1, 1, 1,
0.5568233, 0.5020008, 1.175196, 1, 1, 1, 1, 1,
0.5571818, -0.7417277, 2.541493, 1, 1, 1, 1, 1,
0.5573378, -0.1303975, 3.345295, 1, 1, 1, 1, 1,
0.5579578, 0.940551, -0.295282, 1, 1, 1, 1, 1,
0.558924, -1.840353, 2.960352, 1, 1, 1, 1, 1,
0.5604367, -0.3070956, 1.630822, 1, 1, 1, 1, 1,
0.5605231, 0.5522711, -0.4387754, 1, 1, 1, 1, 1,
0.5617019, 0.002211888, 0.009480515, 1, 1, 1, 1, 1,
0.5640566, 0.996982, -0.2493528, 1, 1, 1, 1, 1,
0.5705401, 1.039464, -0.2983626, 1, 1, 1, 1, 1,
0.5724493, -0.07561053, 2.459701, 1, 1, 1, 1, 1,
0.5741278, -1.821683, 3.057534, 1, 1, 1, 1, 1,
0.5756747, 0.7838994, -0.4479781, 1, 1, 1, 1, 1,
0.5786983, 0.8416745, 2.700518, 0, 0, 1, 1, 1,
0.5804454, 2.391941, 0.940506, 1, 0, 0, 1, 1,
0.5808558, -0.4202723, 3.501153, 1, 0, 0, 1, 1,
0.5862672, 1.760062, -0.6329039, 1, 0, 0, 1, 1,
0.5934018, 1.452097, 2.133029, 1, 0, 0, 1, 1,
0.5939638, 0.5536079, -1.708093, 1, 0, 0, 1, 1,
0.5949657, -1.395397, 1.597922, 0, 0, 0, 1, 1,
0.5970137, 0.7441866, -0.8424031, 0, 0, 0, 1, 1,
0.6022001, -2.908496, 3.355427, 0, 0, 0, 1, 1,
0.6034028, -0.9661353, 2.542501, 0, 0, 0, 1, 1,
0.6065993, 0.2477331, 1.171877, 0, 0, 0, 1, 1,
0.6081471, -0.9959688, 2.229073, 0, 0, 0, 1, 1,
0.6091784, -0.2005205, 1.587266, 0, 0, 0, 1, 1,
0.6115376, 0.4641089, 0.3691603, 1, 1, 1, 1, 1,
0.6156753, -0.0926683, 2.370083, 1, 1, 1, 1, 1,
0.6209187, 0.6711109, 0.3001041, 1, 1, 1, 1, 1,
0.6272826, 0.7484803, -0.1401485, 1, 1, 1, 1, 1,
0.6311451, 0.6580796, 1.359065, 1, 1, 1, 1, 1,
0.6323727, -0.2004542, 2.508456, 1, 1, 1, 1, 1,
0.6345417, -0.3100286, 1.836523, 1, 1, 1, 1, 1,
0.6371605, 0.6304362, -0.3490363, 1, 1, 1, 1, 1,
0.6395907, 0.3968188, -2.80977, 1, 1, 1, 1, 1,
0.6412795, -1.370532, 2.234524, 1, 1, 1, 1, 1,
0.6431302, 1.176004, 1.077735, 1, 1, 1, 1, 1,
0.6453816, 2.658782, -0.4488227, 1, 1, 1, 1, 1,
0.6463762, 0.7648576, 0.706677, 1, 1, 1, 1, 1,
0.6464978, 0.2883405, 2.236964, 1, 1, 1, 1, 1,
0.6583495, -2.087827, 4.099741, 1, 1, 1, 1, 1,
0.658882, 1.513746, -0.1594004, 0, 0, 1, 1, 1,
0.6614541, 0.5529369, 2.010187, 1, 0, 0, 1, 1,
0.6624612, -0.7233611, 1.446961, 1, 0, 0, 1, 1,
0.6626866, 0.2143162, 1.515126, 1, 0, 0, 1, 1,
0.6632213, -0.4373852, 1.660772, 1, 0, 0, 1, 1,
0.6642939, -0.6933651, 2.469525, 1, 0, 0, 1, 1,
0.672586, -0.4794076, 2.283752, 0, 0, 0, 1, 1,
0.6787491, 0.9881682, 0.8334144, 0, 0, 0, 1, 1,
0.6806201, 0.7652014, 0.4649255, 0, 0, 0, 1, 1,
0.6885585, 0.1945789, 2.650545, 0, 0, 0, 1, 1,
0.6923676, 1.297183, 1.109702, 0, 0, 0, 1, 1,
0.6935447, -1.290191, 1.790058, 0, 0, 0, 1, 1,
0.6975148, 0.4522445, 1.095355, 0, 0, 0, 1, 1,
0.6981226, 0.2886564, 0.8205976, 1, 1, 1, 1, 1,
0.6982143, -0.6750359, 3.135708, 1, 1, 1, 1, 1,
0.7077202, -1.540374, 4.041379, 1, 1, 1, 1, 1,
0.7100361, 1.073917, 0.6899605, 1, 1, 1, 1, 1,
0.7110879, 0.8167696, 0.7836117, 1, 1, 1, 1, 1,
0.7212667, -0.3407877, 1.688769, 1, 1, 1, 1, 1,
0.7218537, 1.318163, 0.5689839, 1, 1, 1, 1, 1,
0.722888, -0.3397682, 1.429006, 1, 1, 1, 1, 1,
0.7232485, 1.437304, 0.3079894, 1, 1, 1, 1, 1,
0.7232566, -2.699669, 3.634626, 1, 1, 1, 1, 1,
0.7314659, -0.0346342, 1.752092, 1, 1, 1, 1, 1,
0.7323949, -0.3334591, 0.5614918, 1, 1, 1, 1, 1,
0.733542, 2.576283, 1.212636, 1, 1, 1, 1, 1,
0.7414357, -1.043935, 5.019061, 1, 1, 1, 1, 1,
0.7437435, 0.7372469, 1.379569, 1, 1, 1, 1, 1,
0.7470891, 0.3423913, 0.5898868, 0, 0, 1, 1, 1,
0.7471894, -0.02825341, 2.574675, 1, 0, 0, 1, 1,
0.7486968, -1.663923, 4.802555, 1, 0, 0, 1, 1,
0.7551983, 0.3947783, 2.020314, 1, 0, 0, 1, 1,
0.7583441, -0.2955352, 1.771405, 1, 0, 0, 1, 1,
0.7610909, 2.149611, -0.7681635, 1, 0, 0, 1, 1,
0.761377, -0.9628473, 3.355137, 0, 0, 0, 1, 1,
0.7649972, 0.5801981, 1.681853, 0, 0, 0, 1, 1,
0.7759924, -2.724482, 3.770806, 0, 0, 0, 1, 1,
0.7762442, 0.2604483, 2.135424, 0, 0, 0, 1, 1,
0.7770078, 0.3177904, 1.959239, 0, 0, 0, 1, 1,
0.7818351, 0.158396, 1.601023, 0, 0, 0, 1, 1,
0.7907832, -0.1301097, 0.216147, 0, 0, 0, 1, 1,
0.7949059, 1.005322, -0.9785181, 1, 1, 1, 1, 1,
0.7987646, -0.3819433, 3.52099, 1, 1, 1, 1, 1,
0.8028159, 1.069534, -0.2242313, 1, 1, 1, 1, 1,
0.8040906, 0.1909016, 0.9030929, 1, 1, 1, 1, 1,
0.804231, 1.043306, -0.1804904, 1, 1, 1, 1, 1,
0.8061709, -0.4172455, 1.450196, 1, 1, 1, 1, 1,
0.8114613, 0.5898932, 0.8624422, 1, 1, 1, 1, 1,
0.8118966, -0.3354628, 2.499563, 1, 1, 1, 1, 1,
0.8134163, 0.7316404, -0.386607, 1, 1, 1, 1, 1,
0.816462, 0.6205415, 0.2964233, 1, 1, 1, 1, 1,
0.8204968, -0.8482176, 1.434369, 1, 1, 1, 1, 1,
0.8226586, -2.220032, 2.203964, 1, 1, 1, 1, 1,
0.8270826, -0.9720131, 1.052321, 1, 1, 1, 1, 1,
0.8351548, -0.3299085, 3.682945, 1, 1, 1, 1, 1,
0.8353288, 0.9892899, 0.8078349, 1, 1, 1, 1, 1,
0.8376665, 0.2818804, 0.3858004, 0, 0, 1, 1, 1,
0.8388527, 0.07385096, 3.287271, 1, 0, 0, 1, 1,
0.8494396, -2.01183, 2.703581, 1, 0, 0, 1, 1,
0.8513156, 0.2149263, 0.6028302, 1, 0, 0, 1, 1,
0.8516577, -3.013155, 3.405693, 1, 0, 0, 1, 1,
0.8526115, -0.210278, 1.918398, 1, 0, 0, 1, 1,
0.8549488, 2.080156, -0.2294941, 0, 0, 0, 1, 1,
0.8568439, -0.8361334, 4.249801, 0, 0, 0, 1, 1,
0.865091, 0.14791, 0.5897892, 0, 0, 0, 1, 1,
0.8651832, -0.5168046, 1.61637, 0, 0, 0, 1, 1,
0.8677097, -0.8714623, 4.038623, 0, 0, 0, 1, 1,
0.8699831, -0.2574005, 2.192076, 0, 0, 0, 1, 1,
0.8747598, 0.8607332, 0.4960329, 0, 0, 0, 1, 1,
0.876826, 0.7782677, 0.5376669, 1, 1, 1, 1, 1,
0.8775175, -2.791784, 4.65292, 1, 1, 1, 1, 1,
0.8924549, 1.282122, 0.0359348, 1, 1, 1, 1, 1,
0.8932483, 0.1292109, 1.866107, 1, 1, 1, 1, 1,
0.893353, 1.593714, -0.8876877, 1, 1, 1, 1, 1,
0.8953558, -0.6774175, 4.333918, 1, 1, 1, 1, 1,
0.9124239, -0.1607669, 3.762365, 1, 1, 1, 1, 1,
0.9132276, -1.819845, 3.153979, 1, 1, 1, 1, 1,
0.9220577, -0.2280174, 2.027775, 1, 1, 1, 1, 1,
0.9289393, 1.273865, 1.391481, 1, 1, 1, 1, 1,
0.9364679, 1.04537, 0.6321407, 1, 1, 1, 1, 1,
0.9422052, -1.281338, 3.764062, 1, 1, 1, 1, 1,
0.9430879, -0.05210959, 2.403875, 1, 1, 1, 1, 1,
0.9465884, 0.4646039, -0.7051386, 1, 1, 1, 1, 1,
0.9497017, 0.7342272, 1.903622, 1, 1, 1, 1, 1,
0.9538334, -1.254831, 1.3483, 0, 0, 1, 1, 1,
0.9697852, -0.8515368, 2.869567, 1, 0, 0, 1, 1,
0.9734225, 0.3042437, 0.9371446, 1, 0, 0, 1, 1,
0.9764559, -0.8156301, 1.237592, 1, 0, 0, 1, 1,
0.9809533, 0.9785203, 0.9119037, 1, 0, 0, 1, 1,
0.9820758, 0.6910705, 1.693624, 1, 0, 0, 1, 1,
0.9840119, 0.5752931, 1.645542, 0, 0, 0, 1, 1,
0.9898093, -0.5683754, 1.558316, 0, 0, 0, 1, 1,
0.9953408, 0.08253946, 1.415159, 0, 0, 0, 1, 1,
0.9967526, 0.383619, 2.378294, 0, 0, 0, 1, 1,
0.997109, -0.3507186, 2.066358, 0, 0, 0, 1, 1,
1.001392, -0.871057, 4.294865, 0, 0, 0, 1, 1,
1.004742, -0.4148566, 2.395457, 0, 0, 0, 1, 1,
1.007773, -0.4325092, 1.890449, 1, 1, 1, 1, 1,
1.0078, 0.6841575, 1.224495, 1, 1, 1, 1, 1,
1.008332, -0.2432364, 0.6951334, 1, 1, 1, 1, 1,
1.009248, 0.7963612, 0.1690283, 1, 1, 1, 1, 1,
1.011185, 0.7113808, 0.6801355, 1, 1, 1, 1, 1,
1.013767, 0.9073579, 2.25864, 1, 1, 1, 1, 1,
1.015482, 1.681722, 1.720695, 1, 1, 1, 1, 1,
1.026955, -1.521644, 3.163327, 1, 1, 1, 1, 1,
1.03949, 1.165866, -0.1745912, 1, 1, 1, 1, 1,
1.047105, 1.166005, 0.4495665, 1, 1, 1, 1, 1,
1.051401, 0.6732021, 0.4535787, 1, 1, 1, 1, 1,
1.059545, 0.4712751, 0.9980769, 1, 1, 1, 1, 1,
1.060581, 0.0741047, 0.8266124, 1, 1, 1, 1, 1,
1.060844, 2.551978, -0.4606641, 1, 1, 1, 1, 1,
1.066464, -0.02747202, 1.137398, 1, 1, 1, 1, 1,
1.070243, 0.5582123, 1.41873, 0, 0, 1, 1, 1,
1.070554, -0.3629897, 2.732528, 1, 0, 0, 1, 1,
1.079008, -1.001291, 2.631358, 1, 0, 0, 1, 1,
1.082613, 0.08389823, 2.958546, 1, 0, 0, 1, 1,
1.094428, -0.07438646, 0.4473504, 1, 0, 0, 1, 1,
1.095976, 0.91222, 1.071172, 1, 0, 0, 1, 1,
1.099606, 1.475341, 2.390222, 0, 0, 0, 1, 1,
1.100694, 0.6541545, 0.7173081, 0, 0, 0, 1, 1,
1.108283, -0.2665753, 2.480211, 0, 0, 0, 1, 1,
1.110173, -0.730967, -0.5576864, 0, 0, 0, 1, 1,
1.114733, -1.03782, 2.376213, 0, 0, 0, 1, 1,
1.117125, 0.06032148, 1.932623, 0, 0, 0, 1, 1,
1.121993, -0.3863865, 1.829051, 0, 0, 0, 1, 1,
1.12372, -1.089119, 2.756896, 1, 1, 1, 1, 1,
1.136318, -1.678291, 3.602838, 1, 1, 1, 1, 1,
1.1369, -0.3959412, 2.036652, 1, 1, 1, 1, 1,
1.13703, 0.1807846, -0.2744047, 1, 1, 1, 1, 1,
1.138918, 1.132009, -0.2260566, 1, 1, 1, 1, 1,
1.139537, 0.2607781, 1.725277, 1, 1, 1, 1, 1,
1.143062, 0.2296922, 0.9360652, 1, 1, 1, 1, 1,
1.148212, 0.4249657, 3.081977, 1, 1, 1, 1, 1,
1.161131, 1.109737, 0.8838736, 1, 1, 1, 1, 1,
1.161484, 0.9413647, -0.9184773, 1, 1, 1, 1, 1,
1.164042, 0.8264974, 0.9481262, 1, 1, 1, 1, 1,
1.174701, 1.402839, 0.2548642, 1, 1, 1, 1, 1,
1.175374, -0.8038314, 3.566763, 1, 1, 1, 1, 1,
1.178276, -0.6418329, 1.467993, 1, 1, 1, 1, 1,
1.181593, 0.3884135, 0.9799043, 1, 1, 1, 1, 1,
1.183598, -0.721076, 2.798648, 0, 0, 1, 1, 1,
1.18516, 2.002231, 0.7115654, 1, 0, 0, 1, 1,
1.187084, 0.06898602, -0.7307547, 1, 0, 0, 1, 1,
1.191623, 0.857234, 1.309159, 1, 0, 0, 1, 1,
1.192014, -2.181151, 3.460293, 1, 0, 0, 1, 1,
1.20523, -0.3228259, 2.602055, 1, 0, 0, 1, 1,
1.231682, -1.231612, 2.464281, 0, 0, 0, 1, 1,
1.232004, -0.01784387, 0.8543444, 0, 0, 0, 1, 1,
1.234191, -0.3535921, 1.070127, 0, 0, 0, 1, 1,
1.246413, -0.5783049, 0.9029812, 0, 0, 0, 1, 1,
1.249211, -0.02001553, 2.560971, 0, 0, 0, 1, 1,
1.251122, -1.212473, 2.71777, 0, 0, 0, 1, 1,
1.260919, 0.5593988, -0.4764318, 0, 0, 0, 1, 1,
1.262224, -1.389139, 1.49276, 1, 1, 1, 1, 1,
1.268932, 1.22435, 1.390557, 1, 1, 1, 1, 1,
1.279346, 1.028568, -1.695509, 1, 1, 1, 1, 1,
1.28012, -0.5300021, 2.480287, 1, 1, 1, 1, 1,
1.287064, -0.7663358, 1.090554, 1, 1, 1, 1, 1,
1.288469, 0.8784819, 2.970736, 1, 1, 1, 1, 1,
1.290707, -1.330394, 3.657296, 1, 1, 1, 1, 1,
1.298716, 0.6829171, 1.545233, 1, 1, 1, 1, 1,
1.299897, 0.8919845, 1.241078, 1, 1, 1, 1, 1,
1.303551, 1.507973, 0.007273593, 1, 1, 1, 1, 1,
1.305397, -0.4625475, 3.156409, 1, 1, 1, 1, 1,
1.309666, 1.137437, 2.378852, 1, 1, 1, 1, 1,
1.316272, -1.597474, 1.664323, 1, 1, 1, 1, 1,
1.317548, -1.179819, 2.700541, 1, 1, 1, 1, 1,
1.317664, 0.5986066, 0.2048286, 1, 1, 1, 1, 1,
1.319108, -2.376152, 2.096999, 0, 0, 1, 1, 1,
1.32114, 1.509931, -0.4314709, 1, 0, 0, 1, 1,
1.323341, -0.197918, 2.303152, 1, 0, 0, 1, 1,
1.340499, 1.982332, -0.2078465, 1, 0, 0, 1, 1,
1.346226, -1.195123, 3.352158, 1, 0, 0, 1, 1,
1.350263, -1.502883, 3.5393, 1, 0, 0, 1, 1,
1.35286, 0.273821, 0.9586198, 0, 0, 0, 1, 1,
1.363855, 1.040464, 1.186907, 0, 0, 0, 1, 1,
1.365484, 0.4514315, 1.751593, 0, 0, 0, 1, 1,
1.366393, -1.109433, 2.603072, 0, 0, 0, 1, 1,
1.388079, -0.04668992, 1.377963, 0, 0, 0, 1, 1,
1.389957, -0.5361252, 0.6936746, 0, 0, 0, 1, 1,
1.400112, 1.596148, 0.04507448, 0, 0, 0, 1, 1,
1.400371, -0.2918894, -0.2831155, 1, 1, 1, 1, 1,
1.409711, -0.7692969, 0.2846897, 1, 1, 1, 1, 1,
1.427548, -1.929349, 1.705718, 1, 1, 1, 1, 1,
1.42856, -0.4043873, 2.482791, 1, 1, 1, 1, 1,
1.433193, -0.3599311, 0.9087915, 1, 1, 1, 1, 1,
1.43341, 0.1028653, 1.352409, 1, 1, 1, 1, 1,
1.43457, 0.8933864, 0.8460197, 1, 1, 1, 1, 1,
1.444206, 0.7781554, -0.8286853, 1, 1, 1, 1, 1,
1.444956, -0.1785605, 1.181826, 1, 1, 1, 1, 1,
1.45417, 0.1258857, 1.645844, 1, 1, 1, 1, 1,
1.460232, -0.09114811, 1.579996, 1, 1, 1, 1, 1,
1.461978, -1.029518, 2.135724, 1, 1, 1, 1, 1,
1.465771, 2.07221, 0.4350388, 1, 1, 1, 1, 1,
1.472696, 0.4337403, 0.767417, 1, 1, 1, 1, 1,
1.473281, -0.6689841, 3.864231, 1, 1, 1, 1, 1,
1.477779, 1.600741, 1.362778, 0, 0, 1, 1, 1,
1.480061, -0.3745385, 2.684815, 1, 0, 0, 1, 1,
1.483775, 0.1965526, 1.464321, 1, 0, 0, 1, 1,
1.48439, -2.001806, 2.28613, 1, 0, 0, 1, 1,
1.495696, -2.213847, 2.653569, 1, 0, 0, 1, 1,
1.513708, 0.626179, 1.720705, 1, 0, 0, 1, 1,
1.528473, -0.1325813, -0.1821797, 0, 0, 0, 1, 1,
1.528914, -1.003643, 1.611434, 0, 0, 0, 1, 1,
1.541944, 0.5631471, 1.225706, 0, 0, 0, 1, 1,
1.544582, 1.715379, 0.3469141, 0, 0, 0, 1, 1,
1.551038, -1.518496, 2.937464, 0, 0, 0, 1, 1,
1.55346, 0.6988167, 2.364938, 0, 0, 0, 1, 1,
1.5591, 0.8716158, 0.9798978, 0, 0, 0, 1, 1,
1.582116, -0.9052932, 1.790626, 1, 1, 1, 1, 1,
1.586482, 0.6307516, 1.275343, 1, 1, 1, 1, 1,
1.587334, 1.953663, -0.05975888, 1, 1, 1, 1, 1,
1.587685, 0.6738985, 1.289908, 1, 1, 1, 1, 1,
1.606646, -0.5267012, 2.789846, 1, 1, 1, 1, 1,
1.609949, -1.253999, 2.502483, 1, 1, 1, 1, 1,
1.620234, 0.8684981, 0.8560598, 1, 1, 1, 1, 1,
1.625323, -0.619329, 3.483536, 1, 1, 1, 1, 1,
1.633997, 1.120879, 1.616982, 1, 1, 1, 1, 1,
1.639777, -0.1062863, 1.651275, 1, 1, 1, 1, 1,
1.649152, -0.06919979, 0.5451865, 1, 1, 1, 1, 1,
1.650301, -1.661593, 3.32786, 1, 1, 1, 1, 1,
1.652563, 0.6863405, 3.179794, 1, 1, 1, 1, 1,
1.658303, 2.393602, -0.9761447, 1, 1, 1, 1, 1,
1.666416, 0.2898087, 1.306294, 1, 1, 1, 1, 1,
1.669567, 1.07016, -0.4865813, 0, 0, 1, 1, 1,
1.674554, -1.379585, 2.687184, 1, 0, 0, 1, 1,
1.677519, 0.3398157, 3.228284, 1, 0, 0, 1, 1,
1.682266, 0.6666095, 1.452371, 1, 0, 0, 1, 1,
1.701377, 0.1965596, -0.3838426, 1, 0, 0, 1, 1,
1.701921, -0.6388144, 1.91731, 1, 0, 0, 1, 1,
1.707544, 1.507802, -0.09800363, 0, 0, 0, 1, 1,
1.712144, -0.2283721, 0.638395, 0, 0, 0, 1, 1,
1.726786, 0.4144142, 1.248128, 0, 0, 0, 1, 1,
1.730325, -1.042105, 1.571997, 0, 0, 0, 1, 1,
1.74592, 0.6978309, 0.3347797, 0, 0, 0, 1, 1,
1.757563, -0.3875353, 1.645681, 0, 0, 0, 1, 1,
1.769651, 0.3374885, 3.56132, 0, 0, 0, 1, 1,
1.778222, -0.4581676, 2.907393, 1, 1, 1, 1, 1,
1.786581, -0.2309584, 1.063573, 1, 1, 1, 1, 1,
1.851297, -0.7961192, 0.5707573, 1, 1, 1, 1, 1,
1.853159, -0.2934748, 0.2414249, 1, 1, 1, 1, 1,
1.855128, 0.6618201, 2.949203, 1, 1, 1, 1, 1,
1.862448, -1.467011, 0.8246993, 1, 1, 1, 1, 1,
1.86392, -0.5786452, 2.116834, 1, 1, 1, 1, 1,
1.885285, 0.9594544, 2.459007, 1, 1, 1, 1, 1,
1.910168, 0.1575775, 1.513047, 1, 1, 1, 1, 1,
1.911658, 0.8635544, 0.3558127, 1, 1, 1, 1, 1,
1.921735, 0.7937008, 1.093962, 1, 1, 1, 1, 1,
1.941208, -1.000738, 3.977764, 1, 1, 1, 1, 1,
1.961759, 0.2023946, 0.1406713, 1, 1, 1, 1, 1,
1.980244, 0.9922438, 0.6906856, 1, 1, 1, 1, 1,
1.992459, 0.1826739, 3.548691, 1, 1, 1, 1, 1,
2.062631, 0.4862435, 0.6381118, 0, 0, 1, 1, 1,
2.079605, 1.913237, 0.6184831, 1, 0, 0, 1, 1,
2.107339, 0.6047465, 1.393746, 1, 0, 0, 1, 1,
2.123689, -1.400069, 1.579938, 1, 0, 0, 1, 1,
2.126766, 0.2606496, 2.090103, 1, 0, 0, 1, 1,
2.164152, 0.3022569, 1.620553, 1, 0, 0, 1, 1,
2.212175, -1.987326, 0.8666974, 0, 0, 0, 1, 1,
2.257188, -1.206708, 3.667144, 0, 0, 0, 1, 1,
2.288262, -0.3632554, 2.244766, 0, 0, 0, 1, 1,
2.361837, 1.427695, 3.423322, 0, 0, 0, 1, 1,
2.3927, 0.9265451, 0.3753491, 0, 0, 0, 1, 1,
2.429475, 0.17183, 2.087702, 0, 0, 0, 1, 1,
2.574344, -1.027913, 1.893555, 0, 0, 0, 1, 1,
2.644198, -0.6670159, 2.06946, 1, 1, 1, 1, 1,
2.763906, -1.441088, 2.969293, 1, 1, 1, 1, 1,
2.818665, -2.464058, 3.414088, 1, 1, 1, 1, 1,
2.923502, 0.5987352, 1.941546, 1, 1, 1, 1, 1,
2.94338, -0.1308189, 1.621049, 1, 1, 1, 1, 1,
3.005932, 0.5986148, 1.891963, 1, 1, 1, 1, 1,
3.888304, 0.4476464, 2.71196, 1, 1, 1, 1, 1
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
var radius = 9.67143;
var distance = 33.97049;
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
mvMatrix.translate( -0.4378142, -0.03027439, -0.144526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97049);
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
