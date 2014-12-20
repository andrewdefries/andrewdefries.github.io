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
-3.508672, 0.4337582, -2.847231, 1, 0, 0, 1,
-2.90576, 0.9515873, -1.30587, 1, 0.007843138, 0, 1,
-2.80168, -0.004001008, -1.833466, 1, 0.01176471, 0, 1,
-2.771685, -0.5575392, -2.237224, 1, 0.01960784, 0, 1,
-2.72032, 1.091487, -2.286144, 1, 0.02352941, 0, 1,
-2.67298, 1.520534, -3.301275, 1, 0.03137255, 0, 1,
-2.597854, 0.3269413, -1.471839, 1, 0.03529412, 0, 1,
-2.379565, -1.155833, -1.795347, 1, 0.04313726, 0, 1,
-2.376202, 0.008021215, -1.210059, 1, 0.04705882, 0, 1,
-2.338006, 1.342651, -0.407019, 1, 0.05490196, 0, 1,
-2.331957, -1.076848, 0.8497481, 1, 0.05882353, 0, 1,
-2.310439, 1.04622, -2.206289, 1, 0.06666667, 0, 1,
-2.289395, 0.9084443, -2.35527, 1, 0.07058824, 0, 1,
-2.270985, 0.1168619, -1.532674, 1, 0.07843138, 0, 1,
-2.264793, -1.187894, -2.452023, 1, 0.08235294, 0, 1,
-2.261191, 0.2309654, -1.241197, 1, 0.09019608, 0, 1,
-2.248292, 0.9939525, -1.098641, 1, 0.09411765, 0, 1,
-2.241604, 0.129604, -0.5510002, 1, 0.1019608, 0, 1,
-2.230934, 0.6867934, 0.3565278, 1, 0.1098039, 0, 1,
-2.229613, -0.686033, -2.731771, 1, 0.1137255, 0, 1,
-2.176982, 1.241658, -1.942428, 1, 0.1215686, 0, 1,
-2.161344, 0.07749129, -0.2672693, 1, 0.1254902, 0, 1,
-2.131124, 0.5705782, -0.9536024, 1, 0.1333333, 0, 1,
-2.120435, -0.3465618, -0.7928134, 1, 0.1372549, 0, 1,
-2.102731, -0.280135, -0.05042199, 1, 0.145098, 0, 1,
-2.090466, -1.758193, -3.022242, 1, 0.1490196, 0, 1,
-2.085397, -0.9104181, -1.734107, 1, 0.1568628, 0, 1,
-2.074725, -0.07084626, -0.8056462, 1, 0.1607843, 0, 1,
-2.056778, -0.3006738, -2.456916, 1, 0.1686275, 0, 1,
-2.036406, 1.81804, -1.434484, 1, 0.172549, 0, 1,
-2.035315, -1.339541, -1.13722, 1, 0.1803922, 0, 1,
-2.007979, 0.3390583, -0.8041353, 1, 0.1843137, 0, 1,
-1.99899, 1.011678, -1.833251, 1, 0.1921569, 0, 1,
-1.995549, 0.9575834, -1.319181, 1, 0.1960784, 0, 1,
-1.993855, 0.2814154, -0.2594227, 1, 0.2039216, 0, 1,
-1.979199, 1.890685, -1.622146, 1, 0.2117647, 0, 1,
-1.979076, 0.002751835, -1.840705, 1, 0.2156863, 0, 1,
-1.946942, 0.2205098, -1.686771, 1, 0.2235294, 0, 1,
-1.934335, -0.6343648, -0.7141582, 1, 0.227451, 0, 1,
-1.898019, 1.42063, -1.333802, 1, 0.2352941, 0, 1,
-1.839523, -0.1465298, -3.351154, 1, 0.2392157, 0, 1,
-1.834202, -1.263871, -2.104193, 1, 0.2470588, 0, 1,
-1.833433, -0.3581408, -2.773287, 1, 0.2509804, 0, 1,
-1.823246, -0.2565099, -2.143395, 1, 0.2588235, 0, 1,
-1.821298, 0.08792599, -1.55145, 1, 0.2627451, 0, 1,
-1.807687, -0.8557366, -3.610018, 1, 0.2705882, 0, 1,
-1.805171, -0.6338575, -3.949251, 1, 0.2745098, 0, 1,
-1.793159, -1.158312, -1.41449, 1, 0.282353, 0, 1,
-1.77995, -1.504842, -2.252639, 1, 0.2862745, 0, 1,
-1.777925, -0.326447, -1.299176, 1, 0.2941177, 0, 1,
-1.771759, -0.3896952, -1.115178, 1, 0.3019608, 0, 1,
-1.759979, -0.8653719, -3.361974, 1, 0.3058824, 0, 1,
-1.757725, -0.2770204, -2.029398, 1, 0.3137255, 0, 1,
-1.743536, -1.712369, -1.155706, 1, 0.3176471, 0, 1,
-1.740877, -0.1621154, -1.233349, 1, 0.3254902, 0, 1,
-1.740262, 0.607599, -1.724733, 1, 0.3294118, 0, 1,
-1.72261, -0.5323593, -1.572628, 1, 0.3372549, 0, 1,
-1.698508, -0.5336751, -2.499104, 1, 0.3411765, 0, 1,
-1.687521, -0.4060225, -3.198735, 1, 0.3490196, 0, 1,
-1.677238, -0.4407212, -0.8799146, 1, 0.3529412, 0, 1,
-1.676891, -1.873822, -3.372937, 1, 0.3607843, 0, 1,
-1.669465, -0.6594899, -1.190727, 1, 0.3647059, 0, 1,
-1.663468, 1.089712, -0.01572752, 1, 0.372549, 0, 1,
-1.646321, -0.9722387, -3.659434, 1, 0.3764706, 0, 1,
-1.637802, -0.7990777, -1.414357, 1, 0.3843137, 0, 1,
-1.628539, 0.7046592, -1.173859, 1, 0.3882353, 0, 1,
-1.625931, -0.8382986, -2.837014, 1, 0.3960784, 0, 1,
-1.622258, -0.1722417, -1.392059, 1, 0.4039216, 0, 1,
-1.612406, 1.015029, -1.859255, 1, 0.4078431, 0, 1,
-1.594277, 0.592876, 0.4264095, 1, 0.4156863, 0, 1,
-1.592818, -0.4507549, -1.248655, 1, 0.4196078, 0, 1,
-1.580671, 2.089562, -0.06887621, 1, 0.427451, 0, 1,
-1.567446, -0.4438369, -1.632512, 1, 0.4313726, 0, 1,
-1.562394, -1.326863, -2.312205, 1, 0.4392157, 0, 1,
-1.551563, 1.605446, -2.363733, 1, 0.4431373, 0, 1,
-1.551121, 0.7487587, -1.875911, 1, 0.4509804, 0, 1,
-1.551073, -0.3121597, -0.7972536, 1, 0.454902, 0, 1,
-1.528673, -0.113693, -2.691172, 1, 0.4627451, 0, 1,
-1.527772, -0.1290768, -1.653359, 1, 0.4666667, 0, 1,
-1.525395, -1.105098, -2.217268, 1, 0.4745098, 0, 1,
-1.501999, 1.289266, -0.9857502, 1, 0.4784314, 0, 1,
-1.493001, -1.127311, -3.150368, 1, 0.4862745, 0, 1,
-1.472071, 0.6518347, -1.032596, 1, 0.4901961, 0, 1,
-1.469287, -0.7874369, -2.416705, 1, 0.4980392, 0, 1,
-1.467113, 0.8387379, -1.277261, 1, 0.5058824, 0, 1,
-1.45586, -1.297837, -2.131623, 1, 0.509804, 0, 1,
-1.452399, 1.413596, -2.798291, 1, 0.5176471, 0, 1,
-1.440288, 2.125472, -0.9250299, 1, 0.5215687, 0, 1,
-1.427575, -0.9431733, -2.22012, 1, 0.5294118, 0, 1,
-1.427333, 1.63224, 0.1963999, 1, 0.5333334, 0, 1,
-1.422876, 0.2711612, -1.973027, 1, 0.5411765, 0, 1,
-1.418245, -0.8743274, -1.066711, 1, 0.5450981, 0, 1,
-1.416368, -1.055094, -1.165987, 1, 0.5529412, 0, 1,
-1.413894, -0.5407631, -2.520977, 1, 0.5568628, 0, 1,
-1.412375, 0.8450027, 0.6046068, 1, 0.5647059, 0, 1,
-1.403108, 1.794328, -2.408357, 1, 0.5686275, 0, 1,
-1.397683, 1.219672, -2.221989, 1, 0.5764706, 0, 1,
-1.388666, 0.1249277, -0.3177983, 1, 0.5803922, 0, 1,
-1.380592, -1.046729, -2.519358, 1, 0.5882353, 0, 1,
-1.380106, 0.9380348, -2.548951, 1, 0.5921569, 0, 1,
-1.375454, 0.4518578, -1.88615, 1, 0.6, 0, 1,
-1.371394, -0.4692807, -2.403196, 1, 0.6078432, 0, 1,
-1.361808, 0.5138689, -2.199434, 1, 0.6117647, 0, 1,
-1.361214, -1.279969, -1.992571, 1, 0.6196079, 0, 1,
-1.360881, 0.3708516, -2.155153, 1, 0.6235294, 0, 1,
-1.35819, 0.6235131, -2.510257, 1, 0.6313726, 0, 1,
-1.349208, 0.2191083, -0.7721784, 1, 0.6352941, 0, 1,
-1.348704, -1.069057, -2.274278, 1, 0.6431373, 0, 1,
-1.347059, -1.564694, -1.440223, 1, 0.6470588, 0, 1,
-1.346372, -0.2731149, -0.8463951, 1, 0.654902, 0, 1,
-1.339664, -3.716373, -3.590516, 1, 0.6588235, 0, 1,
-1.339107, -0.9783959, -1.693894, 1, 0.6666667, 0, 1,
-1.336963, 2.109759, -1.400534, 1, 0.6705883, 0, 1,
-1.330299, 0.760677, -0.9534656, 1, 0.6784314, 0, 1,
-1.328388, -1.219188, -1.715285, 1, 0.682353, 0, 1,
-1.320749, 1.785854, -1.733977, 1, 0.6901961, 0, 1,
-1.307553, 1.317278, 0.8404149, 1, 0.6941177, 0, 1,
-1.307224, 0.5820855, -0.4352315, 1, 0.7019608, 0, 1,
-1.304757, 0.2178215, -1.586354, 1, 0.7098039, 0, 1,
-1.297132, 0.03582059, -0.6708598, 1, 0.7137255, 0, 1,
-1.280979, -0.4533989, -1.444956, 1, 0.7215686, 0, 1,
-1.273114, 0.8796472, -1.624957, 1, 0.7254902, 0, 1,
-1.27046, 0.987387, -1.624618, 1, 0.7333333, 0, 1,
-1.263404, -0.3787786, -1.606827, 1, 0.7372549, 0, 1,
-1.263267, -1.41357, -1.387555, 1, 0.7450981, 0, 1,
-1.25679, 1.763142, 0.261986, 1, 0.7490196, 0, 1,
-1.255847, 0.5536624, -1.524352, 1, 0.7568628, 0, 1,
-1.254333, 0.8994085, -1.329421, 1, 0.7607843, 0, 1,
-1.247006, -0.03172125, -0.7867112, 1, 0.7686275, 0, 1,
-1.240793, -1.36613, -1.93882, 1, 0.772549, 0, 1,
-1.214798, 0.4073148, -0.5072988, 1, 0.7803922, 0, 1,
-1.20402, -0.01484899, -2.379658, 1, 0.7843137, 0, 1,
-1.202897, 0.7946665, -1.989614, 1, 0.7921569, 0, 1,
-1.2011, 0.6062464, -2.805125, 1, 0.7960784, 0, 1,
-1.177626, -1.022884, 0.2876881, 1, 0.8039216, 0, 1,
-1.173911, -0.3545173, -0.5429239, 1, 0.8117647, 0, 1,
-1.170711, -0.4068302, -0.06435408, 1, 0.8156863, 0, 1,
-1.160159, -1.524366, -2.496583, 1, 0.8235294, 0, 1,
-1.153802, 0.6193002, -1.157482, 1, 0.827451, 0, 1,
-1.139226, 0.6720422, -1.850374, 1, 0.8352941, 0, 1,
-1.133041, -1.0207, -1.820815, 1, 0.8392157, 0, 1,
-1.127064, 0.3998983, -0.5607861, 1, 0.8470588, 0, 1,
-1.126818, 0.8433889, -0.3513561, 1, 0.8509804, 0, 1,
-1.12674, -0.2177825, -1.860384, 1, 0.8588235, 0, 1,
-1.121488, 0.04633844, -2.085409, 1, 0.8627451, 0, 1,
-1.118997, -1.590264, -1.623127, 1, 0.8705882, 0, 1,
-1.098276, -0.4439752, -1.67718, 1, 0.8745098, 0, 1,
-1.076418, -0.4922568, -1.764242, 1, 0.8823529, 0, 1,
-1.071838, 0.0637733, -1.88008, 1, 0.8862745, 0, 1,
-1.068663, -1.102193, -3.622469, 1, 0.8941177, 0, 1,
-1.068044, -0.4765742, -1.734677, 1, 0.8980392, 0, 1,
-1.067165, -0.9489591, -3.297128, 1, 0.9058824, 0, 1,
-1.056427, -0.5914801, -0.4991818, 1, 0.9137255, 0, 1,
-1.046495, -0.8047829, -1.579202, 1, 0.9176471, 0, 1,
-1.046211, -1.014614, -3.455806, 1, 0.9254902, 0, 1,
-1.04202, -1.55502, -0.3163032, 1, 0.9294118, 0, 1,
-1.037801, -0.339152, -1.399699, 1, 0.9372549, 0, 1,
-1.034326, -1.051678, -1.561346, 1, 0.9411765, 0, 1,
-1.031317, 1.712088, 1.399257, 1, 0.9490196, 0, 1,
-1.029496, -0.007078265, -2.363437, 1, 0.9529412, 0, 1,
-1.026402, -1.877325, -2.866374, 1, 0.9607843, 0, 1,
-1.025098, 0.2097514, -1.742543, 1, 0.9647059, 0, 1,
-1.023422, -0.3705318, -1.072128, 1, 0.972549, 0, 1,
-1.022427, -1.752747, -3.674275, 1, 0.9764706, 0, 1,
-1.007363, -1.306874, -3.273349, 1, 0.9843137, 0, 1,
-1.006478, -0.7560762, -3.187121, 1, 0.9882353, 0, 1,
-1.005459, 0.3242563, -2.510442, 1, 0.9960784, 0, 1,
-0.9929972, 0.837747, -1.265567, 0.9960784, 1, 0, 1,
-0.9903893, -1.080306, -3.923288, 0.9921569, 1, 0, 1,
-0.9899029, -1.101844, -2.509883, 0.9843137, 1, 0, 1,
-0.9890226, 1.161527, -1.47903, 0.9803922, 1, 0, 1,
-0.9889951, -0.7979198, -2.352493, 0.972549, 1, 0, 1,
-0.9829242, 0.4706399, -0.7018506, 0.9686275, 1, 0, 1,
-0.9769889, -0.7304119, -2.235221, 0.9607843, 1, 0, 1,
-0.9703452, -1.865835, -2.452756, 0.9568627, 1, 0, 1,
-0.9559054, 2.518933, -1.473008, 0.9490196, 1, 0, 1,
-0.9495147, -0.3115647, -1.807221, 0.945098, 1, 0, 1,
-0.9413128, 1.448153, -1.099055, 0.9372549, 1, 0, 1,
-0.9405599, 1.834376, 0.1877231, 0.9333333, 1, 0, 1,
-0.9402592, -0.08575211, -0.6629142, 0.9254902, 1, 0, 1,
-0.9393483, -0.5502703, -1.515915, 0.9215686, 1, 0, 1,
-0.9344613, -0.5614851, -1.396569, 0.9137255, 1, 0, 1,
-0.9336936, 0.5504107, -2.847771, 0.9098039, 1, 0, 1,
-0.9336081, -1.45515, -2.081455, 0.9019608, 1, 0, 1,
-0.9319172, 0.04482342, -1.498725, 0.8941177, 1, 0, 1,
-0.9231498, -1.526964, -1.515827, 0.8901961, 1, 0, 1,
-0.9154901, -0.06880634, 0.2716856, 0.8823529, 1, 0, 1,
-0.9135628, 0.007463031, -0.4681889, 0.8784314, 1, 0, 1,
-0.8952265, 0.7497469, -2.773943, 0.8705882, 1, 0, 1,
-0.8910246, 0.05985377, -0.2492919, 0.8666667, 1, 0, 1,
-0.8833297, 0.4382443, -3.137584, 0.8588235, 1, 0, 1,
-0.8758046, -0.2815866, -2.408698, 0.854902, 1, 0, 1,
-0.8737311, 0.7560005, -0.7116364, 0.8470588, 1, 0, 1,
-0.8736903, -0.8954102, -2.988424, 0.8431373, 1, 0, 1,
-0.8723642, -1.352564, -2.378702, 0.8352941, 1, 0, 1,
-0.870771, 1.016159, -0.7547843, 0.8313726, 1, 0, 1,
-0.8705839, -0.8620192, -2.011813, 0.8235294, 1, 0, 1,
-0.8669151, 0.3913853, -0.8826089, 0.8196079, 1, 0, 1,
-0.8643135, -0.633081, -3.122164, 0.8117647, 1, 0, 1,
-0.8604946, -0.0864898, -1.777483, 0.8078431, 1, 0, 1,
-0.8567846, 1.049294, 0.04110101, 0.8, 1, 0, 1,
-0.8505294, 0.5428256, 0.07188606, 0.7921569, 1, 0, 1,
-0.8504379, 1.015049, -1.141896, 0.7882353, 1, 0, 1,
-0.8452697, 0.257841, -1.401534, 0.7803922, 1, 0, 1,
-0.8448412, -0.00719438, -2.343647, 0.7764706, 1, 0, 1,
-0.8378041, 1.453434, -1.567027, 0.7686275, 1, 0, 1,
-0.832404, -0.6681217, -2.167868, 0.7647059, 1, 0, 1,
-0.8316967, 0.5646693, -0.5815296, 0.7568628, 1, 0, 1,
-0.82393, -0.6408604, -2.950066, 0.7529412, 1, 0, 1,
-0.8233222, -2.229358, -1.346509, 0.7450981, 1, 0, 1,
-0.8229116, -1.975783, -4.170644, 0.7411765, 1, 0, 1,
-0.8215339, 0.08583003, -1.125614, 0.7333333, 1, 0, 1,
-0.8157986, -1.079964, -2.000974, 0.7294118, 1, 0, 1,
-0.8092596, 0.2624536, -2.678381, 0.7215686, 1, 0, 1,
-0.8078847, -1.992193, -2.553513, 0.7176471, 1, 0, 1,
-0.80599, 0.7358018, -1.650145, 0.7098039, 1, 0, 1,
-0.8051194, 0.2782083, 1.586611, 0.7058824, 1, 0, 1,
-0.8041929, -0.9257129, -2.468417, 0.6980392, 1, 0, 1,
-0.8014001, 2.378161, -0.6206279, 0.6901961, 1, 0, 1,
-0.7897623, -0.05461149, -1.530527, 0.6862745, 1, 0, 1,
-0.7807603, 0.4163709, -2.915264, 0.6784314, 1, 0, 1,
-0.7629878, -0.9128785, -2.174967, 0.6745098, 1, 0, 1,
-0.7617534, -1.428475, -2.14831, 0.6666667, 1, 0, 1,
-0.7540013, -1.919759, -3.592536, 0.6627451, 1, 0, 1,
-0.7515324, 0.2557285, -0.8659195, 0.654902, 1, 0, 1,
-0.7427996, 0.05605169, -1.993188, 0.6509804, 1, 0, 1,
-0.7272872, -1.058848, -3.390967, 0.6431373, 1, 0, 1,
-0.7241064, -1.182402, -2.222271, 0.6392157, 1, 0, 1,
-0.7237423, 0.5212108, -1.87171, 0.6313726, 1, 0, 1,
-0.7229543, 1.523754, -1.036793, 0.627451, 1, 0, 1,
-0.7178464, -0.9672132, -1.825632, 0.6196079, 1, 0, 1,
-0.7175491, 1.566691, 0.250986, 0.6156863, 1, 0, 1,
-0.7153739, 0.5488736, -2.830703, 0.6078432, 1, 0, 1,
-0.7134441, -0.2810985, -3.673219, 0.6039216, 1, 0, 1,
-0.7113237, -0.2874499, -1.601733, 0.5960785, 1, 0, 1,
-0.7074294, -0.8134502, -3.043836, 0.5882353, 1, 0, 1,
-0.7062869, 0.9933442, -1.042413, 0.5843138, 1, 0, 1,
-0.7050509, -1.157894, -2.387064, 0.5764706, 1, 0, 1,
-0.7039496, 1.120849, -0.7209702, 0.572549, 1, 0, 1,
-0.700156, 0.5608488, 0.1958215, 0.5647059, 1, 0, 1,
-0.6970783, 0.2878047, -1.232222, 0.5607843, 1, 0, 1,
-0.6914707, -0.1746165, -2.410364, 0.5529412, 1, 0, 1,
-0.6876636, 0.8205535, 1.962951, 0.5490196, 1, 0, 1,
-0.6855899, 0.2814218, -2.174294, 0.5411765, 1, 0, 1,
-0.6842817, 0.11706, -2.102548, 0.5372549, 1, 0, 1,
-0.6823313, 0.5065912, -0.06247218, 0.5294118, 1, 0, 1,
-0.6801676, -0.1008817, -1.138493, 0.5254902, 1, 0, 1,
-0.6784755, -0.2043615, -1.562155, 0.5176471, 1, 0, 1,
-0.6724712, -0.6781682, -1.57731, 0.5137255, 1, 0, 1,
-0.6669897, -0.5973788, -2.991498, 0.5058824, 1, 0, 1,
-0.6657195, 0.2498354, -0.4044672, 0.5019608, 1, 0, 1,
-0.6647837, -0.05407682, -2.009083, 0.4941176, 1, 0, 1,
-0.6647505, 0.4497378, -1.066144, 0.4862745, 1, 0, 1,
-0.663422, 1.090537, -0.8168405, 0.4823529, 1, 0, 1,
-0.6622455, 0.9019087, -0.6155186, 0.4745098, 1, 0, 1,
-0.6506428, 0.3706967, -0.6704246, 0.4705882, 1, 0, 1,
-0.6493592, 0.1920742, -0.8161433, 0.4627451, 1, 0, 1,
-0.6487355, -0.5096204, -3.178687, 0.4588235, 1, 0, 1,
-0.6477996, -0.120939, 1.428343, 0.4509804, 1, 0, 1,
-0.6387548, 0.5583134, 0.1934031, 0.4470588, 1, 0, 1,
-0.6372074, 1.471475, 0.07744195, 0.4392157, 1, 0, 1,
-0.634479, 2.292129, -1.504601, 0.4352941, 1, 0, 1,
-0.6319402, 1.190591, -0.5442747, 0.427451, 1, 0, 1,
-0.6187412, -1.36983, -3.789298, 0.4235294, 1, 0, 1,
-0.6184586, -0.4060078, -2.114528, 0.4156863, 1, 0, 1,
-0.6151613, 0.06684702, -1.786318, 0.4117647, 1, 0, 1,
-0.6144437, 0.6143969, 2.05045, 0.4039216, 1, 0, 1,
-0.613346, -0.2664852, -2.227418, 0.3960784, 1, 0, 1,
-0.6111822, -1.074649, -1.847868, 0.3921569, 1, 0, 1,
-0.6097164, -0.006594139, -1.083302, 0.3843137, 1, 0, 1,
-0.6059762, -0.6211734, -2.759447, 0.3803922, 1, 0, 1,
-0.6048444, 0.3895807, -1.381267, 0.372549, 1, 0, 1,
-0.6003705, 1.603432, -0.04649446, 0.3686275, 1, 0, 1,
-0.5993742, 0.9291964, 1.077852, 0.3607843, 1, 0, 1,
-0.593882, -1.948042, -3.285297, 0.3568628, 1, 0, 1,
-0.5817854, 0.1216183, -1.410508, 0.3490196, 1, 0, 1,
-0.5772735, 0.8665948, -0.9275571, 0.345098, 1, 0, 1,
-0.5770429, -0.4493525, -2.139167, 0.3372549, 1, 0, 1,
-0.5756341, -0.7015492, -3.995476, 0.3333333, 1, 0, 1,
-0.5750722, -1.658615, -0.5871322, 0.3254902, 1, 0, 1,
-0.574413, -1.184187, -0.5193989, 0.3215686, 1, 0, 1,
-0.5731418, 0.0508725, -1.666541, 0.3137255, 1, 0, 1,
-0.5719965, -1.130416, -4.095504, 0.3098039, 1, 0, 1,
-0.5526285, -0.1884497, -0.5741342, 0.3019608, 1, 0, 1,
-0.5495045, -0.1094156, -2.199841, 0.2941177, 1, 0, 1,
-0.5477738, -0.2322423, -2.744204, 0.2901961, 1, 0, 1,
-0.5466523, 0.359778, -2.280256, 0.282353, 1, 0, 1,
-0.5420417, 0.6666204, 0.8834779, 0.2784314, 1, 0, 1,
-0.5408885, -1.161778, -1.952855, 0.2705882, 1, 0, 1,
-0.5406036, 0.3087459, 0.5033783, 0.2666667, 1, 0, 1,
-0.5379198, -0.3747816, -3.207527, 0.2588235, 1, 0, 1,
-0.5377019, 0.32573, -2.112335, 0.254902, 1, 0, 1,
-0.5364233, 1.341603, 0.2956671, 0.2470588, 1, 0, 1,
-0.5362827, -0.27293, -2.057119, 0.2431373, 1, 0, 1,
-0.5341701, -0.2252329, -1.751452, 0.2352941, 1, 0, 1,
-0.5325313, 1.107548, 2.295361, 0.2313726, 1, 0, 1,
-0.5307155, -1.986888, -2.218444, 0.2235294, 1, 0, 1,
-0.5306108, 0.2332915, -1.994557, 0.2196078, 1, 0, 1,
-0.5296167, -0.1772259, -1.511831, 0.2117647, 1, 0, 1,
-0.5239273, 0.4967873, -0.832763, 0.2078431, 1, 0, 1,
-0.5196176, 0.5285903, 0.2694064, 0.2, 1, 0, 1,
-0.5162217, -0.003046095, -2.691433, 0.1921569, 1, 0, 1,
-0.5159775, 0.81929, -1.315452, 0.1882353, 1, 0, 1,
-0.5137706, 1.645812, -1.182484, 0.1803922, 1, 0, 1,
-0.5124496, 0.03293674, -1.77777, 0.1764706, 1, 0, 1,
-0.509354, -0.4114735, -2.917731, 0.1686275, 1, 0, 1,
-0.507561, 1.696396, -2.346407, 0.1647059, 1, 0, 1,
-0.5052702, -0.4447747, 0.02870544, 0.1568628, 1, 0, 1,
-0.5033445, 0.9793014, -2.278668, 0.1529412, 1, 0, 1,
-0.5031354, -0.9473765, -3.480146, 0.145098, 1, 0, 1,
-0.5025734, 0.8376554, -1.461479, 0.1411765, 1, 0, 1,
-0.4960252, -1.063178, -3.667524, 0.1333333, 1, 0, 1,
-0.4934768, 0.5511241, -2.292948, 0.1294118, 1, 0, 1,
-0.4925038, 0.0788666, -1.031338, 0.1215686, 1, 0, 1,
-0.4885257, -1.669771, -2.241821, 0.1176471, 1, 0, 1,
-0.4871789, 0.2380645, -0.9668785, 0.1098039, 1, 0, 1,
-0.4844704, -0.9825413, -2.979492, 0.1058824, 1, 0, 1,
-0.4814393, -0.3669616, -0.6030995, 0.09803922, 1, 0, 1,
-0.4778026, -0.5078528, -1.76751, 0.09019608, 1, 0, 1,
-0.4752216, 0.08175952, -1.846672, 0.08627451, 1, 0, 1,
-0.4751716, -0.3269059, -1.889778, 0.07843138, 1, 0, 1,
-0.4691686, 0.7658144, 0.6603295, 0.07450981, 1, 0, 1,
-0.4639943, -2.204076, -4.692017, 0.06666667, 1, 0, 1,
-0.46315, 0.9900135, -1.392218, 0.0627451, 1, 0, 1,
-0.462911, -1.187161, -1.253896, 0.05490196, 1, 0, 1,
-0.4618839, 0.1392857, -2.003484, 0.05098039, 1, 0, 1,
-0.46083, -0.3749125, -1.475301, 0.04313726, 1, 0, 1,
-0.4598356, 0.3690106, -1.932471, 0.03921569, 1, 0, 1,
-0.4592523, 0.3657813, -1.086423, 0.03137255, 1, 0, 1,
-0.4578672, 1.610071, 0.9211995, 0.02745098, 1, 0, 1,
-0.4536647, 0.4981174, 1.661962, 0.01960784, 1, 0, 1,
-0.4533603, 0.7621342, -0.7692171, 0.01568628, 1, 0, 1,
-0.451995, -0.04299313, -1.542709, 0.007843138, 1, 0, 1,
-0.4504988, -0.9538767, -3.217021, 0.003921569, 1, 0, 1,
-0.4395601, -0.1089685, -2.067093, 0, 1, 0.003921569, 1,
-0.439495, 0.02246011, -2.149434, 0, 1, 0.01176471, 1,
-0.4267157, 1.485834, 1.650661, 0, 1, 0.01568628, 1,
-0.4251815, 0.5175472, -1.643967, 0, 1, 0.02352941, 1,
-0.4247154, 0.3042592, -0.4893019, 0, 1, 0.02745098, 1,
-0.4229589, -0.01251992, -3.584109, 0, 1, 0.03529412, 1,
-0.4222791, -1.385586, -1.966195, 0, 1, 0.03921569, 1,
-0.4211894, 0.1538498, -0.9416829, 0, 1, 0.04705882, 1,
-0.4151296, -2.002961, -2.289186, 0, 1, 0.05098039, 1,
-0.3999871, 1.104527, -1.074604, 0, 1, 0.05882353, 1,
-0.3922626, -0.6816968, -1.567901, 0, 1, 0.0627451, 1,
-0.3910725, -2.01383, -3.756063, 0, 1, 0.07058824, 1,
-0.3889525, -0.4253198, -2.466044, 0, 1, 0.07450981, 1,
-0.3880057, -1.572472, -2.690567, 0, 1, 0.08235294, 1,
-0.3875096, -1.141073, -2.90974, 0, 1, 0.08627451, 1,
-0.3835781, -1.601001, -1.972796, 0, 1, 0.09411765, 1,
-0.3816077, -0.02806849, -2.827697, 0, 1, 0.1019608, 1,
-0.3801228, -0.6950808, -3.15864, 0, 1, 0.1058824, 1,
-0.3791186, 1.313584, -1.036588, 0, 1, 0.1137255, 1,
-0.3785014, 0.7853438, 1.053773, 0, 1, 0.1176471, 1,
-0.3742591, -0.447493, -2.023107, 0, 1, 0.1254902, 1,
-0.3733594, -1.600307, -4.059489, 0, 1, 0.1294118, 1,
-0.3722737, 1.470486, -1.016291, 0, 1, 0.1372549, 1,
-0.3719874, -0.104514, -0.3744611, 0, 1, 0.1411765, 1,
-0.3713634, 0.4333421, 1.042022, 0, 1, 0.1490196, 1,
-0.3676515, 0.3304544, 0.07576276, 0, 1, 0.1529412, 1,
-0.3620307, -1.179761, -4.260861, 0, 1, 0.1607843, 1,
-0.3606683, -0.3757696, -0.06992883, 0, 1, 0.1647059, 1,
-0.3587949, -0.07328824, -1.853314, 0, 1, 0.172549, 1,
-0.3518963, -0.3211265, -1.511182, 0, 1, 0.1764706, 1,
-0.343765, 0.6024362, -1.318997, 0, 1, 0.1843137, 1,
-0.337716, 0.3992717, -1.879777, 0, 1, 0.1882353, 1,
-0.3376628, -1.273188, -2.050732, 0, 1, 0.1960784, 1,
-0.3374536, 0.3980415, -1.598566, 0, 1, 0.2039216, 1,
-0.332151, 1.447382, 1.779026, 0, 1, 0.2078431, 1,
-0.3307895, 0.1881559, -1.780341, 0, 1, 0.2156863, 1,
-0.3251534, -0.08861475, -2.568911, 0, 1, 0.2196078, 1,
-0.3251056, -0.3646548, -0.1577851, 0, 1, 0.227451, 1,
-0.3213412, 0.3161566, -1.178253, 0, 1, 0.2313726, 1,
-0.320737, -0.0948104, -1.353085, 0, 1, 0.2392157, 1,
-0.3157836, 0.8873942, -0.6140619, 0, 1, 0.2431373, 1,
-0.3145367, -0.4938135, -0.8898733, 0, 1, 0.2509804, 1,
-0.3144008, 0.04959187, 1.665778, 0, 1, 0.254902, 1,
-0.312077, 0.3916468, 0.7745835, 0, 1, 0.2627451, 1,
-0.3099622, 0.196992, -1.75939, 0, 1, 0.2666667, 1,
-0.3091004, -3.281865, -0.3227545, 0, 1, 0.2745098, 1,
-0.3067525, 0.2215015, -1.36326, 0, 1, 0.2784314, 1,
-0.305157, -0.9899389, -3.288373, 0, 1, 0.2862745, 1,
-0.303863, 0.1146881, -1.432633, 0, 1, 0.2901961, 1,
-0.2968166, -0.1043782, -3.900632, 0, 1, 0.2980392, 1,
-0.2956342, 2.119988, -0.8033077, 0, 1, 0.3058824, 1,
-0.2953769, 0.9100556, 0.195364, 0, 1, 0.3098039, 1,
-0.2952494, -0.9969794, -1.410873, 0, 1, 0.3176471, 1,
-0.288479, -0.5469688, -2.408753, 0, 1, 0.3215686, 1,
-0.287087, -0.3309272, -1.41827, 0, 1, 0.3294118, 1,
-0.2859963, 0.5016656, -1.705432, 0, 1, 0.3333333, 1,
-0.2826614, -0.5355181, -0.8872116, 0, 1, 0.3411765, 1,
-0.2817282, -0.08642336, -2.035438, 0, 1, 0.345098, 1,
-0.2692798, -1.390694, -3.572338, 0, 1, 0.3529412, 1,
-0.2612864, -1.293765, -2.604011, 0, 1, 0.3568628, 1,
-0.2569877, -0.1087304, -2.154379, 0, 1, 0.3647059, 1,
-0.254148, 0.06139323, -1.33891, 0, 1, 0.3686275, 1,
-0.2527027, 0.6841364, 0.4130772, 0, 1, 0.3764706, 1,
-0.2511993, 0.2421131, 0.6155478, 0, 1, 0.3803922, 1,
-0.2473988, -1.537325, -1.217661, 0, 1, 0.3882353, 1,
-0.2473328, 0.1624764, -2.07305, 0, 1, 0.3921569, 1,
-0.2429425, -1.619455, -3.010057, 0, 1, 0.4, 1,
-0.2429348, -1.778782, -3.185668, 0, 1, 0.4078431, 1,
-0.2383445, -1.437059, -3.546113, 0, 1, 0.4117647, 1,
-0.2372322, -1.379069, -3.446653, 0, 1, 0.4196078, 1,
-0.2352317, 0.8918272, -1.145584, 0, 1, 0.4235294, 1,
-0.2316071, -0.09770159, -2.1118, 0, 1, 0.4313726, 1,
-0.2307454, 2.695184, 0.9969375, 0, 1, 0.4352941, 1,
-0.2283304, -1.072716, -3.644194, 0, 1, 0.4431373, 1,
-0.2279577, 0.7163946, 0.08558857, 0, 1, 0.4470588, 1,
-0.2279137, 0.2291305, -0.106318, 0, 1, 0.454902, 1,
-0.227028, 1.028581, 0.2252018, 0, 1, 0.4588235, 1,
-0.2264569, 1.391611, 0.5232626, 0, 1, 0.4666667, 1,
-0.2184116, 1.332484, -2.036508, 0, 1, 0.4705882, 1,
-0.2160274, -0.009948117, -1.440976, 0, 1, 0.4784314, 1,
-0.2155691, -0.6010405, -3.751587, 0, 1, 0.4823529, 1,
-0.2131925, 0.06085537, -2.161399, 0, 1, 0.4901961, 1,
-0.2130296, 1.346326, 2.361876, 0, 1, 0.4941176, 1,
-0.2067869, -0.6607602, -2.865677, 0, 1, 0.5019608, 1,
-0.200504, -1.748449, -2.018985, 0, 1, 0.509804, 1,
-0.2000447, -1.754182, -3.138694, 0, 1, 0.5137255, 1,
-0.199389, 0.6960161, 0.1550563, 0, 1, 0.5215687, 1,
-0.1968286, -0.157002, -1.199743, 0, 1, 0.5254902, 1,
-0.1950449, 0.930784, 0.5175989, 0, 1, 0.5333334, 1,
-0.1937787, -0.01839209, -1.292773, 0, 1, 0.5372549, 1,
-0.1889596, -0.4251655, -3.793658, 0, 1, 0.5450981, 1,
-0.1879673, 0.6174406, 1.112553, 0, 1, 0.5490196, 1,
-0.1843837, -1.00309, -3.346017, 0, 1, 0.5568628, 1,
-0.1842295, 0.9303631, 0.2250906, 0, 1, 0.5607843, 1,
-0.1806725, 0.6275254, 1.400736, 0, 1, 0.5686275, 1,
-0.1800616, 0.863688, -1.153334, 0, 1, 0.572549, 1,
-0.1773803, 0.6432176, -0.3726183, 0, 1, 0.5803922, 1,
-0.1739082, 0.2196339, -1.373197, 0, 1, 0.5843138, 1,
-0.1737038, 0.8953948, 1.986476, 0, 1, 0.5921569, 1,
-0.1710907, -0.0476304, -2.118653, 0, 1, 0.5960785, 1,
-0.1698935, -0.8897171, -2.682955, 0, 1, 0.6039216, 1,
-0.1664882, 0.3943097, -0.6896093, 0, 1, 0.6117647, 1,
-0.1651364, -1.000002, -3.099818, 0, 1, 0.6156863, 1,
-0.1649846, -0.3251247, -2.992034, 0, 1, 0.6235294, 1,
-0.164534, 0.05356054, -1.919618, 0, 1, 0.627451, 1,
-0.1644871, 0.5719506, -1.659845, 0, 1, 0.6352941, 1,
-0.1592991, 0.5728214, 0.08737742, 0, 1, 0.6392157, 1,
-0.1589675, 0.4820216, -3.053253, 0, 1, 0.6470588, 1,
-0.1539726, 0.8617542, 1.165081, 0, 1, 0.6509804, 1,
-0.1500281, -1.242384, -3.759659, 0, 1, 0.6588235, 1,
-0.1463031, -1.705144, -3.198741, 0, 1, 0.6627451, 1,
-0.1437529, -0.2463206, -2.219851, 0, 1, 0.6705883, 1,
-0.1383901, -0.9445899, -2.499419, 0, 1, 0.6745098, 1,
-0.1364417, -0.439135, -3.082202, 0, 1, 0.682353, 1,
-0.135439, -0.9769368, -2.829035, 0, 1, 0.6862745, 1,
-0.1327153, -0.7084818, -2.649044, 0, 1, 0.6941177, 1,
-0.1326249, 1.540745, 0.5614495, 0, 1, 0.7019608, 1,
-0.1290748, -0.8675896, -2.884371, 0, 1, 0.7058824, 1,
-0.1234254, 1.377568, -0.08238313, 0, 1, 0.7137255, 1,
-0.1190288, -0.7107844, -4.233463, 0, 1, 0.7176471, 1,
-0.1135054, -0.4574853, -4.066379, 0, 1, 0.7254902, 1,
-0.1108376, -0.7267007, -2.111865, 0, 1, 0.7294118, 1,
-0.1103308, -1.773838, -2.203535, 0, 1, 0.7372549, 1,
-0.1101217, -1.557865, -2.624013, 0, 1, 0.7411765, 1,
-0.1061681, 0.02498294, -2.202676, 0, 1, 0.7490196, 1,
-0.102911, -0.9430404, -3.067897, 0, 1, 0.7529412, 1,
-0.09911298, 0.04004053, -1.390347, 0, 1, 0.7607843, 1,
-0.09789142, -0.7600527, -3.307036, 0, 1, 0.7647059, 1,
-0.09689054, 0.9031786, 0.7178194, 0, 1, 0.772549, 1,
-0.08674585, 0.2931732, 1.105065, 0, 1, 0.7764706, 1,
-0.0858897, 0.6736216, 0.6607662, 0, 1, 0.7843137, 1,
-0.08204497, -1.366928, -4.126827, 0, 1, 0.7882353, 1,
-0.0708697, 0.9634883, -0.2151814, 0, 1, 0.7960784, 1,
-0.06999972, 1.747828, -0.07238932, 0, 1, 0.8039216, 1,
-0.05165172, -0.957617, -4.20677, 0, 1, 0.8078431, 1,
-0.04906934, 0.6325884, -0.07767148, 0, 1, 0.8156863, 1,
-0.04446714, 0.2292183, -0.269306, 0, 1, 0.8196079, 1,
-0.04431634, -0.05089928, -1.825871, 0, 1, 0.827451, 1,
-0.04332568, -1.427737, -2.604023, 0, 1, 0.8313726, 1,
-0.04216885, -0.1149999, -4.280543, 0, 1, 0.8392157, 1,
-0.04114413, 0.9287573, -0.3212634, 0, 1, 0.8431373, 1,
-0.03919374, -0.05211336, -3.094578, 0, 1, 0.8509804, 1,
-0.03862653, -2.645231, -3.741256, 0, 1, 0.854902, 1,
-0.03840088, -1.927296, -4.056071, 0, 1, 0.8627451, 1,
-0.03729161, 0.6462827, -1.530918, 0, 1, 0.8666667, 1,
-0.03713705, -1.249915, -3.813246, 0, 1, 0.8745098, 1,
-0.03410933, 0.1447484, 1.890497, 0, 1, 0.8784314, 1,
-0.02902159, -1.601347, -4.344101, 0, 1, 0.8862745, 1,
-0.02511751, -1.166865, -4.538637, 0, 1, 0.8901961, 1,
-0.02133109, -1.484207, -3.583081, 0, 1, 0.8980392, 1,
-0.0208826, -0.1044941, -3.190951, 0, 1, 0.9058824, 1,
-0.01966875, -0.3710338, -3.986067, 0, 1, 0.9098039, 1,
-0.01440437, -0.6948245, -2.361263, 0, 1, 0.9176471, 1,
-0.0138507, -0.5354506, -1.794496, 0, 1, 0.9215686, 1,
-0.01281871, 0.4699342, -0.7606258, 0, 1, 0.9294118, 1,
-0.009842387, -1.363559, -3.643809, 0, 1, 0.9333333, 1,
-0.008084015, 0.5667532, -1.075066, 0, 1, 0.9411765, 1,
-0.001676662, -0.5761001, -3.18656, 0, 1, 0.945098, 1,
0.001973256, 1.020998, 0.3557583, 0, 1, 0.9529412, 1,
0.00198738, 0.6037077, 0.2946445, 0, 1, 0.9568627, 1,
0.003265549, 0.2338079, 2.23192, 0, 1, 0.9647059, 1,
0.004572518, -0.211862, 3.652371, 0, 1, 0.9686275, 1,
0.01296799, -0.497841, 2.759428, 0, 1, 0.9764706, 1,
0.01343874, 0.1068731, -0.4537165, 0, 1, 0.9803922, 1,
0.01693594, 0.6969999, -1.048323, 0, 1, 0.9882353, 1,
0.01693912, -1.933061, 2.500014, 0, 1, 0.9921569, 1,
0.02143708, 2.301038, 1.068876, 0, 1, 1, 1,
0.02177555, -0.4037648, 2.725314, 0, 0.9921569, 1, 1,
0.02181376, 0.5906539, 0.195689, 0, 0.9882353, 1, 1,
0.02576043, 0.06572682, -0.4053823, 0, 0.9803922, 1, 1,
0.02955362, -0.3739148, 2.50364, 0, 0.9764706, 1, 1,
0.03063324, 1.002855, -0.9269621, 0, 0.9686275, 1, 1,
0.03067469, -1.284557, 1.58258, 0, 0.9647059, 1, 1,
0.03301957, 0.9959337, 0.5432355, 0, 0.9568627, 1, 1,
0.03613112, 0.343486, 0.8850993, 0, 0.9529412, 1, 1,
0.03816155, -1.02347, 2.462493, 0, 0.945098, 1, 1,
0.04048761, -0.86097, 4.568864, 0, 0.9411765, 1, 1,
0.04684218, -0.1003457, 3.432125, 0, 0.9333333, 1, 1,
0.04712557, 1.208698, -1.691127, 0, 0.9294118, 1, 1,
0.05524564, -1.507648, 3.46597, 0, 0.9215686, 1, 1,
0.05799717, -0.4107836, 3.132171, 0, 0.9176471, 1, 1,
0.05863146, -0.005479677, 3.060712, 0, 0.9098039, 1, 1,
0.05877893, 0.9799162, 0.4414273, 0, 0.9058824, 1, 1,
0.06167644, 0.6574474, 0.4725222, 0, 0.8980392, 1, 1,
0.06519534, -0.6464373, 3.35216, 0, 0.8901961, 1, 1,
0.0711843, 1.663561, 1.301194, 0, 0.8862745, 1, 1,
0.0730671, 0.2918847, -1.366168, 0, 0.8784314, 1, 1,
0.07417282, -0.4534539, 3.781162, 0, 0.8745098, 1, 1,
0.07615818, -1.880682, 3.210038, 0, 0.8666667, 1, 1,
0.07982592, -0.8245786, 4.000916, 0, 0.8627451, 1, 1,
0.08433365, 0.3044305, -0.6296129, 0, 0.854902, 1, 1,
0.08433706, 0.9166418, -0.6316901, 0, 0.8509804, 1, 1,
0.08530159, 1.468127, 1.556686, 0, 0.8431373, 1, 1,
0.08535974, 0.1206158, 2.069174, 0, 0.8392157, 1, 1,
0.085493, -0.6282523, 3.590373, 0, 0.8313726, 1, 1,
0.08619145, 0.2003203, -0.1679177, 0, 0.827451, 1, 1,
0.08753947, 1.445938, -1.174057, 0, 0.8196079, 1, 1,
0.09005255, -0.2581308, 1.7203, 0, 0.8156863, 1, 1,
0.09080807, -0.5368581, 4.152178, 0, 0.8078431, 1, 1,
0.09481595, -0.2237232, 3.096578, 0, 0.8039216, 1, 1,
0.09885308, 1.245929, 0.3752703, 0, 0.7960784, 1, 1,
0.09956575, 1.745744, 0.06056312, 0, 0.7882353, 1, 1,
0.1005123, 1.294659, 0.7143298, 0, 0.7843137, 1, 1,
0.1021712, -2.030193, 2.860558, 0, 0.7764706, 1, 1,
0.1100704, -0.7434334, 4.01203, 0, 0.772549, 1, 1,
0.1165582, -0.08314516, 3.324609, 0, 0.7647059, 1, 1,
0.1170821, 1.23524, 0.7740614, 0, 0.7607843, 1, 1,
0.1276231, -0.330681, 3.225149, 0, 0.7529412, 1, 1,
0.1282119, -0.355072, 1.97352, 0, 0.7490196, 1, 1,
0.1287379, -0.375484, 2.397838, 0, 0.7411765, 1, 1,
0.1366037, 0.4111376, -2.074495, 0, 0.7372549, 1, 1,
0.1368392, 0.06668659, 0.7913416, 0, 0.7294118, 1, 1,
0.138887, 0.9988421, 0.520864, 0, 0.7254902, 1, 1,
0.1407378, -0.1537441, 2.652333, 0, 0.7176471, 1, 1,
0.141538, -0.3455924, 2.741703, 0, 0.7137255, 1, 1,
0.1425085, -0.7321467, 2.061732, 0, 0.7058824, 1, 1,
0.1427024, 1.057079, -0.8374386, 0, 0.6980392, 1, 1,
0.1483448, -0.8814868, 3.515401, 0, 0.6941177, 1, 1,
0.1500883, -0.1375544, 2.495468, 0, 0.6862745, 1, 1,
0.1563828, 2.095409, -2.212175, 0, 0.682353, 1, 1,
0.1593432, 0.6438724, 0.1134927, 0, 0.6745098, 1, 1,
0.1623108, -1.769375, 2.490198, 0, 0.6705883, 1, 1,
0.1686099, -0.7428835, 2.344688, 0, 0.6627451, 1, 1,
0.1705336, 0.2413387, 2.14677, 0, 0.6588235, 1, 1,
0.1714138, -0.3463454, 3.019743, 0, 0.6509804, 1, 1,
0.1746953, 0.06206293, 1.027656, 0, 0.6470588, 1, 1,
0.1763679, -0.6360704, 3.458916, 0, 0.6392157, 1, 1,
0.1794939, -1.869558, 2.649264, 0, 0.6352941, 1, 1,
0.1800753, 0.1839035, -0.6572067, 0, 0.627451, 1, 1,
0.1817054, -0.3855413, 1.211855, 0, 0.6235294, 1, 1,
0.1835479, 1.429461, 1.133621, 0, 0.6156863, 1, 1,
0.1874372, -0.6665031, 2.326012, 0, 0.6117647, 1, 1,
0.1875797, 1.110438, 1.241452, 0, 0.6039216, 1, 1,
0.1889557, 0.5746095, 0.2109979, 0, 0.5960785, 1, 1,
0.1902301, -0.2583069, 2.22572, 0, 0.5921569, 1, 1,
0.1928592, -0.1877597, 2.30758, 0, 0.5843138, 1, 1,
0.1959507, -0.6120715, 3.98058, 0, 0.5803922, 1, 1,
0.196527, -1.009596, 3.735827, 0, 0.572549, 1, 1,
0.1989468, 0.1903518, -0.4269304, 0, 0.5686275, 1, 1,
0.2024466, -0.5318054, 2.800157, 0, 0.5607843, 1, 1,
0.2031895, 1.42395, -1.293948, 0, 0.5568628, 1, 1,
0.2051716, 1.206391, 0.3134997, 0, 0.5490196, 1, 1,
0.2070828, -0.4024656, 2.077756, 0, 0.5450981, 1, 1,
0.2107507, -0.4256282, 4.26185, 0, 0.5372549, 1, 1,
0.2144834, -1.604458, 4.044989, 0, 0.5333334, 1, 1,
0.2254496, -0.873202, 1.76522, 0, 0.5254902, 1, 1,
0.227641, 0.06892022, 1.251508, 0, 0.5215687, 1, 1,
0.230642, 2.872519, 0.3610744, 0, 0.5137255, 1, 1,
0.231182, -0.5255101, 2.548867, 0, 0.509804, 1, 1,
0.2341996, -1.027807, 3.005469, 0, 0.5019608, 1, 1,
0.238464, -0.7762588, 2.825429, 0, 0.4941176, 1, 1,
0.2452149, -0.2321705, 1.626013, 0, 0.4901961, 1, 1,
0.245686, 0.2447107, 0.8664371, 0, 0.4823529, 1, 1,
0.2527353, 1.080602, -1.204201, 0, 0.4784314, 1, 1,
0.252955, 0.2921344, -0.685165, 0, 0.4705882, 1, 1,
0.253609, -1.23442, 3.063234, 0, 0.4666667, 1, 1,
0.2560465, -0.9573167, 1.672727, 0, 0.4588235, 1, 1,
0.25758, 0.742431, 0.6905443, 0, 0.454902, 1, 1,
0.2576447, -0.2912324, 3.45434, 0, 0.4470588, 1, 1,
0.2585817, 0.8435018, -0.1212938, 0, 0.4431373, 1, 1,
0.260383, 0.5414797, 0.2003966, 0, 0.4352941, 1, 1,
0.2662351, 1.399693, -2.016858, 0, 0.4313726, 1, 1,
0.2687258, -0.4184471, 1.850595, 0, 0.4235294, 1, 1,
0.2738323, 0.4900663, 0.4371492, 0, 0.4196078, 1, 1,
0.2743311, 2.342854, -1.224199, 0, 0.4117647, 1, 1,
0.281827, -1.126429, 2.906676, 0, 0.4078431, 1, 1,
0.2819281, 1.410469, -1.017626, 0, 0.4, 1, 1,
0.285407, 0.166551, 1.094005, 0, 0.3921569, 1, 1,
0.2888466, -1.456589, 2.474947, 0, 0.3882353, 1, 1,
0.2950197, -0.001646826, 2.596519, 0, 0.3803922, 1, 1,
0.2955627, 3.087144, -0.7373805, 0, 0.3764706, 1, 1,
0.2956494, -0.3117482, 3.283983, 0, 0.3686275, 1, 1,
0.2977404, 0.05586579, 1.62435, 0, 0.3647059, 1, 1,
0.3004516, -0.2526639, 1.620921, 0, 0.3568628, 1, 1,
0.3012827, -0.7468702, 1.411837, 0, 0.3529412, 1, 1,
0.3031622, -0.8220353, 2.697542, 0, 0.345098, 1, 1,
0.3035473, 1.966486, 0.1355691, 0, 0.3411765, 1, 1,
0.3039907, -0.9080445, 2.74784, 0, 0.3333333, 1, 1,
0.3042885, -0.7530435, 4.068433, 0, 0.3294118, 1, 1,
0.3043698, -0.3851907, 1.694207, 0, 0.3215686, 1, 1,
0.305572, 0.9275342, 0.1989749, 0, 0.3176471, 1, 1,
0.308576, -0.1523759, 2.531219, 0, 0.3098039, 1, 1,
0.3115267, 0.2128339, 1.718165, 0, 0.3058824, 1, 1,
0.3128512, -0.2078465, 3.285537, 0, 0.2980392, 1, 1,
0.3155757, 0.8578007, 0.01450119, 0, 0.2901961, 1, 1,
0.3165473, -1.633709, 3.507318, 0, 0.2862745, 1, 1,
0.3204221, -3.21544, 4.450826, 0, 0.2784314, 1, 1,
0.3239604, 0.5903945, 1.506096, 0, 0.2745098, 1, 1,
0.3240261, 0.3829677, 2.046589, 0, 0.2666667, 1, 1,
0.3277252, -0.4820361, 0.5864341, 0, 0.2627451, 1, 1,
0.3301196, -0.6605844, 1.315779, 0, 0.254902, 1, 1,
0.336602, -0.9884105, 5.036884, 0, 0.2509804, 1, 1,
0.3374828, 1.567085, 0.217067, 0, 0.2431373, 1, 1,
0.338282, 1.666713, 1.082344, 0, 0.2392157, 1, 1,
0.3466433, -0.1251618, 2.118699, 0, 0.2313726, 1, 1,
0.3550808, -1.540826, 2.834499, 0, 0.227451, 1, 1,
0.3587428, -0.8786816, 3.932464, 0, 0.2196078, 1, 1,
0.3624236, 0.5131788, -0.7132231, 0, 0.2156863, 1, 1,
0.3639088, -1.297611, 3.016717, 0, 0.2078431, 1, 1,
0.3680809, -1.357603, 2.267238, 0, 0.2039216, 1, 1,
0.3683588, 2.648822, -0.3164554, 0, 0.1960784, 1, 1,
0.3687589, -0.5415826, 2.472765, 0, 0.1882353, 1, 1,
0.3727404, 0.4549857, 2.414019, 0, 0.1843137, 1, 1,
0.3780243, -0.490104, 2.69165, 0, 0.1764706, 1, 1,
0.379799, 0.1207809, 0.06205069, 0, 0.172549, 1, 1,
0.382996, 0.741246, -1.956029, 0, 0.1647059, 1, 1,
0.3852061, 0.5138912, 1.18335, 0, 0.1607843, 1, 1,
0.3860834, 1.042046, -0.5122722, 0, 0.1529412, 1, 1,
0.3861943, -0.4959863, 3.656536, 0, 0.1490196, 1, 1,
0.3865302, 0.7714245, 0.4652286, 0, 0.1411765, 1, 1,
0.3887508, 1.35085, 0.7204195, 0, 0.1372549, 1, 1,
0.3894512, -1.144785, 1.74662, 0, 0.1294118, 1, 1,
0.3936108, 0.05244973, -0.2222467, 0, 0.1254902, 1, 1,
0.3955097, 0.1996821, 2.91119, 0, 0.1176471, 1, 1,
0.3989639, 1.300931, 0.339992, 0, 0.1137255, 1, 1,
0.4050779, 0.2787304, 0.6016206, 0, 0.1058824, 1, 1,
0.4073402, -1.089261, 3.395146, 0, 0.09803922, 1, 1,
0.4089947, -0.4491358, 3.62918, 0, 0.09411765, 1, 1,
0.4108588, 0.1470833, 2.219926, 0, 0.08627451, 1, 1,
0.412685, 0.05370709, 2.539348, 0, 0.08235294, 1, 1,
0.4151064, 0.1292843, 3.652391, 0, 0.07450981, 1, 1,
0.4201945, -1.202356, 3.714266, 0, 0.07058824, 1, 1,
0.4296064, -0.2188357, 2.287607, 0, 0.0627451, 1, 1,
0.4297781, 0.9053836, -0.7372234, 0, 0.05882353, 1, 1,
0.4321564, -0.4619747, 2.584266, 0, 0.05098039, 1, 1,
0.4380474, 0.9832675, -0.2481994, 0, 0.04705882, 1, 1,
0.4382298, -0.1254569, 2.54529, 0, 0.03921569, 1, 1,
0.4386142, -0.319199, 0.8745881, 0, 0.03529412, 1, 1,
0.4394471, 0.3050661, 0.916068, 0, 0.02745098, 1, 1,
0.4394489, -1.266139, 2.995439, 0, 0.02352941, 1, 1,
0.4413825, 0.316747, 2.466133, 0, 0.01568628, 1, 1,
0.4423751, 0.1379597, 0.7185421, 0, 0.01176471, 1, 1,
0.4444778, -0.810664, 1.425848, 0, 0.003921569, 1, 1,
0.4495175, -0.5797029, 4.58456, 0.003921569, 0, 1, 1,
0.4516146, -0.7047238, 3.451205, 0.007843138, 0, 1, 1,
0.4553394, -0.5042633, 3.014237, 0.01568628, 0, 1, 1,
0.4595879, -0.4494873, 2.925756, 0.01960784, 0, 1, 1,
0.4647171, -0.06084803, 0.1217187, 0.02745098, 0, 1, 1,
0.4649035, 1.21169, 0.1618876, 0.03137255, 0, 1, 1,
0.4673682, 0.5231351, 0.06286075, 0.03921569, 0, 1, 1,
0.4696645, 0.4756086, 0.4473508, 0.04313726, 0, 1, 1,
0.473765, 0.1271088, 3.38777, 0.05098039, 0, 1, 1,
0.4739817, 0.9718173, -1.504473, 0.05490196, 0, 1, 1,
0.4744839, 0.693118, 0.5948949, 0.0627451, 0, 1, 1,
0.4782012, 1.223326, 0.2983911, 0.06666667, 0, 1, 1,
0.4783962, 1.133762, -0.5182521, 0.07450981, 0, 1, 1,
0.4788201, -2.28204, 2.789522, 0.07843138, 0, 1, 1,
0.4789782, 0.4861409, 1.636137, 0.08627451, 0, 1, 1,
0.4796278, -0.2976653, 1.605945, 0.09019608, 0, 1, 1,
0.4809165, 0.7121987, 0.4356773, 0.09803922, 0, 1, 1,
0.4821053, 0.006084722, 1.945347, 0.1058824, 0, 1, 1,
0.4901856, 0.5376593, 1.105156, 0.1098039, 0, 1, 1,
0.492361, 0.05824845, 2.892034, 0.1176471, 0, 1, 1,
0.498693, -0.5116049, 0.9766456, 0.1215686, 0, 1, 1,
0.4996214, -0.3014345, 2.510677, 0.1294118, 0, 1, 1,
0.5007179, -0.5097798, 2.528231, 0.1333333, 0, 1, 1,
0.5050683, 0.9549299, 0.715583, 0.1411765, 0, 1, 1,
0.5069028, -0.3859842, 2.148365, 0.145098, 0, 1, 1,
0.5086938, -1.584231, 1.799332, 0.1529412, 0, 1, 1,
0.508944, 0.5513015, 1.426744, 0.1568628, 0, 1, 1,
0.5107083, -1.598718, 1.802975, 0.1647059, 0, 1, 1,
0.524729, 0.7402408, 0.2068279, 0.1686275, 0, 1, 1,
0.5283599, -0.4564417, 2.656131, 0.1764706, 0, 1, 1,
0.5403913, 0.272052, 0.4634627, 0.1803922, 0, 1, 1,
0.5424348, -1.113437, 2.678607, 0.1882353, 0, 1, 1,
0.5457981, -1.637137, 2.36813, 0.1921569, 0, 1, 1,
0.5459999, -0.5384513, 2.232604, 0.2, 0, 1, 1,
0.5472388, 1.686035, 1.233572, 0.2078431, 0, 1, 1,
0.5477017, 0.2645845, 0.627908, 0.2117647, 0, 1, 1,
0.5482228, -1.010153, 3.906179, 0.2196078, 0, 1, 1,
0.5484074, 0.6099534, -0.3450171, 0.2235294, 0, 1, 1,
0.5507835, 1.873446, 1.5164, 0.2313726, 0, 1, 1,
0.5512357, -1.536008, 1.004116, 0.2352941, 0, 1, 1,
0.5539274, -1.138511, 2.973627, 0.2431373, 0, 1, 1,
0.5539535, 2.35235, -2.385451, 0.2470588, 0, 1, 1,
0.5556713, -0.3218349, 0.3480066, 0.254902, 0, 1, 1,
0.5567407, 0.7933226, 0.6998453, 0.2588235, 0, 1, 1,
0.5572073, 0.1750956, 2.702806, 0.2666667, 0, 1, 1,
0.5596353, -0.1190877, 2.702146, 0.2705882, 0, 1, 1,
0.5635977, 0.5321193, 1.765777, 0.2784314, 0, 1, 1,
0.5725388, 0.08833423, 1.216956, 0.282353, 0, 1, 1,
0.5861357, 0.4788263, 2.512732, 0.2901961, 0, 1, 1,
0.5910196, 1.077804, 0.1562951, 0.2941177, 0, 1, 1,
0.5910603, -1.856635, 3.339465, 0.3019608, 0, 1, 1,
0.5916775, 0.4102093, 0.4332969, 0.3098039, 0, 1, 1,
0.5954111, -0.4342179, 3.513883, 0.3137255, 0, 1, 1,
0.5975413, -2.228075, 3.636128, 0.3215686, 0, 1, 1,
0.5986974, 0.9524448, 0.1116465, 0.3254902, 0, 1, 1,
0.6027632, 0.7257698, 1.701603, 0.3333333, 0, 1, 1,
0.6067983, 1.055773, -0.7025337, 0.3372549, 0, 1, 1,
0.6078246, 0.7449113, 3.131264, 0.345098, 0, 1, 1,
0.619902, 0.06125902, 0.4175994, 0.3490196, 0, 1, 1,
0.6217865, -0.166783, 0.4559784, 0.3568628, 0, 1, 1,
0.624319, 0.9948109, 1.756882, 0.3607843, 0, 1, 1,
0.6290503, -2.350429, 3.813007, 0.3686275, 0, 1, 1,
0.6311792, 0.07020936, 1.723984, 0.372549, 0, 1, 1,
0.6313304, -0.1270635, 2.827626, 0.3803922, 0, 1, 1,
0.637953, 0.5731686, -0.06538896, 0.3843137, 0, 1, 1,
0.6416883, 0.07416835, 1.658871, 0.3921569, 0, 1, 1,
0.6452719, -1.920582, 2.354049, 0.3960784, 0, 1, 1,
0.656183, 0.3059465, 1.931212, 0.4039216, 0, 1, 1,
0.6563898, -0.2182409, 1.586533, 0.4117647, 0, 1, 1,
0.6570172, 0.549378, 0.5415142, 0.4156863, 0, 1, 1,
0.6618795, 0.2630723, 0.563526, 0.4235294, 0, 1, 1,
0.6641044, -0.7432147, 1.295722, 0.427451, 0, 1, 1,
0.6663768, -0.5295246, 1.039286, 0.4352941, 0, 1, 1,
0.6685438, -0.02743039, 1.159633, 0.4392157, 0, 1, 1,
0.6709925, 0.6815996, 0.1402811, 0.4470588, 0, 1, 1,
0.6727718, -1.682128, 3.138852, 0.4509804, 0, 1, 1,
0.6738544, -0.4435286, 3.721755, 0.4588235, 0, 1, 1,
0.6753659, -0.05315597, 2.753381, 0.4627451, 0, 1, 1,
0.6828468, -0.2621625, 1.925074, 0.4705882, 0, 1, 1,
0.6850821, 0.9132896, 1.077931, 0.4745098, 0, 1, 1,
0.6876095, -0.6731188, 1.281847, 0.4823529, 0, 1, 1,
0.6887846, -0.4381848, -0.1993551, 0.4862745, 0, 1, 1,
0.689526, 0.8203807, 2.319135, 0.4941176, 0, 1, 1,
0.694979, -0.3381405, 3.332123, 0.5019608, 0, 1, 1,
0.6959221, -0.8055634, 2.487843, 0.5058824, 0, 1, 1,
0.6972895, -2.124298, 1.163834, 0.5137255, 0, 1, 1,
0.6988683, 0.4549114, 2.297888, 0.5176471, 0, 1, 1,
0.7061343, -0.364217, 2.347042, 0.5254902, 0, 1, 1,
0.7089036, 0.9066439, -0.8800942, 0.5294118, 0, 1, 1,
0.7099999, -2.349484, 3.617912, 0.5372549, 0, 1, 1,
0.7107617, 0.6035553, 0.39474, 0.5411765, 0, 1, 1,
0.7135101, -0.4772067, 1.271527, 0.5490196, 0, 1, 1,
0.7161459, 0.9472644, 0.6585777, 0.5529412, 0, 1, 1,
0.7166396, -0.2796809, 1.964215, 0.5607843, 0, 1, 1,
0.7172536, -2.757609, 3.417763, 0.5647059, 0, 1, 1,
0.7236344, 1.679337, 0.5745844, 0.572549, 0, 1, 1,
0.7274173, -1.063717, 1.56331, 0.5764706, 0, 1, 1,
0.7274646, 1.545978, -0.4115202, 0.5843138, 0, 1, 1,
0.7328303, 0.9496769, -0.6913125, 0.5882353, 0, 1, 1,
0.7339481, 0.748236, 0.5471672, 0.5960785, 0, 1, 1,
0.7366593, -0.9606926, 4.159798, 0.6039216, 0, 1, 1,
0.7384053, -1.642437, 1.330294, 0.6078432, 0, 1, 1,
0.7512078, 0.3303716, 1.759985, 0.6156863, 0, 1, 1,
0.7525274, -0.3887868, 2.562623, 0.6196079, 0, 1, 1,
0.7537536, 0.003700006, 0.8647051, 0.627451, 0, 1, 1,
0.7597986, 0.6566995, 0.8495318, 0.6313726, 0, 1, 1,
0.7607602, 0.1569437, 1.246043, 0.6392157, 0, 1, 1,
0.7637761, -0.05928816, 0.3845023, 0.6431373, 0, 1, 1,
0.7698246, 0.2477162, 2.416479, 0.6509804, 0, 1, 1,
0.7736539, -1.01761, 1.160561, 0.654902, 0, 1, 1,
0.7745628, -1.618798, 2.659382, 0.6627451, 0, 1, 1,
0.7796997, 0.4636458, 3.078995, 0.6666667, 0, 1, 1,
0.7812533, -1.026976, 1.66964, 0.6745098, 0, 1, 1,
0.7834442, -1.058382, 3.222314, 0.6784314, 0, 1, 1,
0.7849089, -1.754913, 2.161331, 0.6862745, 0, 1, 1,
0.7934956, -0.04501511, 2.43667, 0.6901961, 0, 1, 1,
0.8010929, -0.8303105, 2.036136, 0.6980392, 0, 1, 1,
0.804066, -1.738026, 3.044862, 0.7058824, 0, 1, 1,
0.8042848, -0.2542926, 2.679317, 0.7098039, 0, 1, 1,
0.8050311, 1.349138, -0.821279, 0.7176471, 0, 1, 1,
0.8087366, 0.3014604, 1.072407, 0.7215686, 0, 1, 1,
0.8112965, -0.5897464, 0.957935, 0.7294118, 0, 1, 1,
0.8119291, 1.680626, 2.135037, 0.7333333, 0, 1, 1,
0.8128836, -0.2656434, 2.69346, 0.7411765, 0, 1, 1,
0.8136256, 0.3369581, 1.654796, 0.7450981, 0, 1, 1,
0.815109, -0.2514509, 2.469387, 0.7529412, 0, 1, 1,
0.8177589, -0.3889766, 2.809198, 0.7568628, 0, 1, 1,
0.8188654, -0.6920404, 2.109705, 0.7647059, 0, 1, 1,
0.8315337, 0.1733388, 0.4264281, 0.7686275, 0, 1, 1,
0.8321907, -0.8370193, 1.938665, 0.7764706, 0, 1, 1,
0.8333507, -1.246619, 1.215746, 0.7803922, 0, 1, 1,
0.8385832, 0.09427819, 0.9462566, 0.7882353, 0, 1, 1,
0.8414357, -1.889189, 4.959207, 0.7921569, 0, 1, 1,
0.851903, 0.6663284, -0.004236716, 0.8, 0, 1, 1,
0.8570495, 1.478059, 0.09041478, 0.8078431, 0, 1, 1,
0.8620926, 1.301193, 2.662996, 0.8117647, 0, 1, 1,
0.8644736, -0.2587943, 0.9395353, 0.8196079, 0, 1, 1,
0.8676544, -0.2010499, 1.010468, 0.8235294, 0, 1, 1,
0.8693876, 0.8879288, -0.2702501, 0.8313726, 0, 1, 1,
0.8703241, -0.7241852, 3.814699, 0.8352941, 0, 1, 1,
0.8747554, 0.739118, 0.4035799, 0.8431373, 0, 1, 1,
0.879949, -0.6154855, 1.652806, 0.8470588, 0, 1, 1,
0.8801203, -0.03979368, 2.935513, 0.854902, 0, 1, 1,
0.8801762, -1.838492, 1.257086, 0.8588235, 0, 1, 1,
0.8842152, -1.045829, 3.806427, 0.8666667, 0, 1, 1,
0.8866146, -1.734345, 4.328346, 0.8705882, 0, 1, 1,
0.8919276, -0.005544358, 1.047581, 0.8784314, 0, 1, 1,
0.8999949, -1.629279, 3.43277, 0.8823529, 0, 1, 1,
0.9008247, 0.07986578, 3.473342, 0.8901961, 0, 1, 1,
0.911881, -1.518032, 0.445544, 0.8941177, 0, 1, 1,
0.9128344, 0.7502771, -0.02119633, 0.9019608, 0, 1, 1,
0.9172032, -0.9286937, 2.368194, 0.9098039, 0, 1, 1,
0.9205837, 0.2680152, 2.474887, 0.9137255, 0, 1, 1,
0.9253531, 0.03336246, 0.9963216, 0.9215686, 0, 1, 1,
0.9293771, 0.524902, 1.900381, 0.9254902, 0, 1, 1,
0.9305353, -0.04034935, 2.585279, 0.9333333, 0, 1, 1,
0.9312972, 0.8411512, 1.0676, 0.9372549, 0, 1, 1,
0.9315896, -0.08902809, 1.566002, 0.945098, 0, 1, 1,
0.9357353, 0.6238434, 2.512038, 0.9490196, 0, 1, 1,
0.947692, -0.6215954, 3.370127, 0.9568627, 0, 1, 1,
0.9570173, -0.737273, 0.7000771, 0.9607843, 0, 1, 1,
0.9591283, -0.4983636, 3.398384, 0.9686275, 0, 1, 1,
0.9616445, -0.2359417, 2.162445, 0.972549, 0, 1, 1,
0.96218, 0.4080714, 0.2791215, 0.9803922, 0, 1, 1,
0.9624806, -0.3693832, 2.964746, 0.9843137, 0, 1, 1,
0.9632685, 0.1872175, 1.722097, 0.9921569, 0, 1, 1,
0.9682127, 0.5010059, 0.7923294, 0.9960784, 0, 1, 1,
0.9685044, -0.6115789, 3.114721, 1, 0, 0.9960784, 1,
0.9706829, 0.4059395, 1.139519, 1, 0, 0.9882353, 1,
0.9710519, 0.1367942, 0.1253971, 1, 0, 0.9843137, 1,
0.9754809, 1.491406, -0.4209227, 1, 0, 0.9764706, 1,
0.993371, 0.8458449, 0.8272564, 1, 0, 0.972549, 1,
0.9972214, 1.020588, 2.127521, 1, 0, 0.9647059, 1,
0.9992597, 0.4187633, 0.9411882, 1, 0, 0.9607843, 1,
1.010323, -1.312465, 4.344203, 1, 0, 0.9529412, 1,
1.015225, 0.9137502, -0.2372492, 1, 0, 0.9490196, 1,
1.017264, 0.2074248, 2.027681, 1, 0, 0.9411765, 1,
1.018261, -0.3619691, 0.5711536, 1, 0, 0.9372549, 1,
1.025516, 1.281785, 0.4426284, 1, 0, 0.9294118, 1,
1.032318, -0.8418674, 3.50352, 1, 0, 0.9254902, 1,
1.034051, -0.0977725, 2.231557, 1, 0, 0.9176471, 1,
1.038683, -0.5634116, 1.385194, 1, 0, 0.9137255, 1,
1.042882, -0.9559929, 2.173522, 1, 0, 0.9058824, 1,
1.052539, 2.158934, 0.9575068, 1, 0, 0.9019608, 1,
1.052773, -0.5215856, 2.225128, 1, 0, 0.8941177, 1,
1.057725, -1.065307, 4.376071, 1, 0, 0.8862745, 1,
1.06898, -1.086791, 2.938225, 1, 0, 0.8823529, 1,
1.077524, 0.7681025, -0.580268, 1, 0, 0.8745098, 1,
1.078613, -0.009266693, -0.5980489, 1, 0, 0.8705882, 1,
1.079794, -0.4777416, 2.381711, 1, 0, 0.8627451, 1,
1.08002, 0.7188559, 1.168258, 1, 0, 0.8588235, 1,
1.081808, -0.7570407, 1.423593, 1, 0, 0.8509804, 1,
1.086791, 1.234079, 1.955773, 1, 0, 0.8470588, 1,
1.088599, -0.7324902, 3.338175, 1, 0, 0.8392157, 1,
1.109546, 0.109853, 2.853791, 1, 0, 0.8352941, 1,
1.10982, -0.2979966, 4.234493, 1, 0, 0.827451, 1,
1.1116, -0.541584, 0.4182371, 1, 0, 0.8235294, 1,
1.115307, -2.658034, 1.704764, 1, 0, 0.8156863, 1,
1.118786, -0.5825175, 1.905288, 1, 0, 0.8117647, 1,
1.125375, -0.4000244, 1.92211, 1, 0, 0.8039216, 1,
1.13919, 1.149475, 0.1062751, 1, 0, 0.7960784, 1,
1.144144, 0.002492901, 2.169484, 1, 0, 0.7921569, 1,
1.158361, -0.009461267, 0.8998206, 1, 0, 0.7843137, 1,
1.158706, -0.7076026, 1.50118, 1, 0, 0.7803922, 1,
1.161177, -0.32512, -0.6910145, 1, 0, 0.772549, 1,
1.177077, 1.46464, -1.692472, 1, 0, 0.7686275, 1,
1.180585, 0.2385444, 1.388096, 1, 0, 0.7607843, 1,
1.181974, -0.1592886, -0.2198125, 1, 0, 0.7568628, 1,
1.187309, -0.3445003, 2.348121, 1, 0, 0.7490196, 1,
1.202243, 0.2927771, 1.3358, 1, 0, 0.7450981, 1,
1.20704, -0.8377905, 1.93102, 1, 0, 0.7372549, 1,
1.21101, 0.6596001, 0.4437028, 1, 0, 0.7333333, 1,
1.214029, 1.137756, 2.265677, 1, 0, 0.7254902, 1,
1.214077, 0.05589028, 2.576381, 1, 0, 0.7215686, 1,
1.219157, 1.78788, -0.7249171, 1, 0, 0.7137255, 1,
1.222955, -0.3466657, 1.680343, 1, 0, 0.7098039, 1,
1.224092, -1.244466, 2.108043, 1, 0, 0.7019608, 1,
1.232626, -0.211188, 1.507915, 1, 0, 0.6941177, 1,
1.24295, 0.8755223, -0.1948683, 1, 0, 0.6901961, 1,
1.247601, -0.2970181, 0.7429262, 1, 0, 0.682353, 1,
1.262962, 0.7516456, 0.5680587, 1, 0, 0.6784314, 1,
1.293642, 0.4472803, 2.518107, 1, 0, 0.6705883, 1,
1.296656, 1.39087, 0.7931378, 1, 0, 0.6666667, 1,
1.299659, -0.6469101, 4.689366, 1, 0, 0.6588235, 1,
1.310612, -0.004310508, 1.999785, 1, 0, 0.654902, 1,
1.32241, 0.6508664, 2.53065, 1, 0, 0.6470588, 1,
1.334384, 0.7258295, 2.123098, 1, 0, 0.6431373, 1,
1.335125, -1.581235, 2.525799, 1, 0, 0.6352941, 1,
1.337632, 0.6059508, 3.538918, 1, 0, 0.6313726, 1,
1.350157, -0.7488653, 2.799158, 1, 0, 0.6235294, 1,
1.351471, -0.9716204, 1.344108, 1, 0, 0.6196079, 1,
1.35208, -0.08091789, 1.054312, 1, 0, 0.6117647, 1,
1.358241, -1.401967, 1.091959, 1, 0, 0.6078432, 1,
1.363085, 0.5615631, 0.5529804, 1, 0, 0.6, 1,
1.374552, 0.8436862, 1.678823, 1, 0, 0.5921569, 1,
1.382472, 1.667726, 3.663403, 1, 0, 0.5882353, 1,
1.389836, 0.5260555, 1.922357, 1, 0, 0.5803922, 1,
1.394611, 0.9647316, -0.3280725, 1, 0, 0.5764706, 1,
1.403149, -0.9928501, 2.048876, 1, 0, 0.5686275, 1,
1.403993, -1.30865, 2.903884, 1, 0, 0.5647059, 1,
1.407065, 0.4968596, 0.1198505, 1, 0, 0.5568628, 1,
1.41038, -1.460909, 3.786305, 1, 0, 0.5529412, 1,
1.41114, -0.5052698, 1.253499, 1, 0, 0.5450981, 1,
1.413334, 0.8639295, 1.642215, 1, 0, 0.5411765, 1,
1.425613, -0.521529, 1.988572, 1, 0, 0.5333334, 1,
1.428438, -0.1591485, 2.535434, 1, 0, 0.5294118, 1,
1.43911, -0.910242, 2.91771, 1, 0, 0.5215687, 1,
1.439707, -0.1965137, 0.8988929, 1, 0, 0.5176471, 1,
1.441622, -0.4576941, 1.378084, 1, 0, 0.509804, 1,
1.442317, 1.77223, 1.055207, 1, 0, 0.5058824, 1,
1.446376, -0.7559365, 0.5040298, 1, 0, 0.4980392, 1,
1.448649, 1.674816, -0.3340586, 1, 0, 0.4901961, 1,
1.456213, -0.3641421, 1.235965, 1, 0, 0.4862745, 1,
1.457405, -1.379032, 1.694584, 1, 0, 0.4784314, 1,
1.459444, -0.3990586, 1.026128, 1, 0, 0.4745098, 1,
1.461701, 0.02845779, 2.876339, 1, 0, 0.4666667, 1,
1.462469, -1.194753, 3.255538, 1, 0, 0.4627451, 1,
1.465896, 0.8861576, 1.823798, 1, 0, 0.454902, 1,
1.481245, 0.2318703, 0.8458993, 1, 0, 0.4509804, 1,
1.482711, -0.5608009, 2.097008, 1, 0, 0.4431373, 1,
1.483794, 2.206702, 0.2574192, 1, 0, 0.4392157, 1,
1.487941, 0.6063522, 1.959692, 1, 0, 0.4313726, 1,
1.494918, -0.5360447, 3.008147, 1, 0, 0.427451, 1,
1.499988, 0.7006963, 0.9756162, 1, 0, 0.4196078, 1,
1.500082, -0.08350198, 1.022892, 1, 0, 0.4156863, 1,
1.505398, -2.383621, 1.710309, 1, 0, 0.4078431, 1,
1.508975, 1.447262, 1.551205, 1, 0, 0.4039216, 1,
1.521939, -0.5009962, 1.393345, 1, 0, 0.3960784, 1,
1.523576, -0.9366216, 2.554936, 1, 0, 0.3882353, 1,
1.526679, -0.3190088, 1.324202, 1, 0, 0.3843137, 1,
1.53517, -0.3622653, 3.066658, 1, 0, 0.3764706, 1,
1.542792, 0.5918046, 1.41837, 1, 0, 0.372549, 1,
1.54684, 0.1556478, 1.576984, 1, 0, 0.3647059, 1,
1.563019, -2.437426, 3.481376, 1, 0, 0.3607843, 1,
1.573135, 0.8692631, 1.259547, 1, 0, 0.3529412, 1,
1.579372, -0.8985021, 1.270456, 1, 0, 0.3490196, 1,
1.586705, -0.1021993, 3.521465, 1, 0, 0.3411765, 1,
1.592147, -0.04208752, 1.519244, 1, 0, 0.3372549, 1,
1.615825, -1.245695, 0.2495662, 1, 0, 0.3294118, 1,
1.619898, 1.501697, 0.7136295, 1, 0, 0.3254902, 1,
1.622088, 0.1677616, 1.433162, 1, 0, 0.3176471, 1,
1.650922, 0.4282037, 0.7816211, 1, 0, 0.3137255, 1,
1.670831, 0.3650658, 3.54276, 1, 0, 0.3058824, 1,
1.675164, -0.3940599, 2.226376, 1, 0, 0.2980392, 1,
1.681617, -0.5725358, -0.6188688, 1, 0, 0.2941177, 1,
1.691524, 1.285208, -0.03038951, 1, 0, 0.2862745, 1,
1.699422, 0.7120117, 1.443666, 1, 0, 0.282353, 1,
1.705885, 0.5128193, 1.934856, 1, 0, 0.2745098, 1,
1.709777, 0.3323625, 2.139984, 1, 0, 0.2705882, 1,
1.727215, 0.0132149, 2.030123, 1, 0, 0.2627451, 1,
1.732244, -0.2373797, 1.795905, 1, 0, 0.2588235, 1,
1.747007, -0.4576815, 3.15635, 1, 0, 0.2509804, 1,
1.748876, 0.4123308, 1.92979, 1, 0, 0.2470588, 1,
1.754495, -1.185853, 2.437292, 1, 0, 0.2392157, 1,
1.767038, -1.42873, 1.352259, 1, 0, 0.2352941, 1,
1.768554, 0.745487, 3.01048, 1, 0, 0.227451, 1,
1.769111, 0.3946453, 0.8563305, 1, 0, 0.2235294, 1,
1.77201, 1.064564, 0.3414259, 1, 0, 0.2156863, 1,
1.782344, -2.016103, 0.9214851, 1, 0, 0.2117647, 1,
1.795887, -1.491432, 0.5298835, 1, 0, 0.2039216, 1,
1.81003, 0.2578816, 2.29135, 1, 0, 0.1960784, 1,
1.820413, 2.325155, 2.705228, 1, 0, 0.1921569, 1,
1.824593, -0.2860083, 0.4912763, 1, 0, 0.1843137, 1,
1.827848, 1.271125, 0.1659035, 1, 0, 0.1803922, 1,
1.833894, -1.264353, 3.630925, 1, 0, 0.172549, 1,
1.839251, 0.7029439, 1.797805, 1, 0, 0.1686275, 1,
1.853534, 1.13624, 2.129897, 1, 0, 0.1607843, 1,
1.856101, -0.3115835, 0.9139851, 1, 0, 0.1568628, 1,
1.87093, -0.7921729, 1.683643, 1, 0, 0.1490196, 1,
1.895848, -0.1342301, 1.267035, 1, 0, 0.145098, 1,
1.918873, 2.455746, 2.218354, 1, 0, 0.1372549, 1,
1.92023, -0.6641862, 2.925117, 1, 0, 0.1333333, 1,
1.924133, -1.129436, 2.535862, 1, 0, 0.1254902, 1,
1.929203, -1.307363, 1.867747, 1, 0, 0.1215686, 1,
1.958403, 0.3548576, 1.215854, 1, 0, 0.1137255, 1,
1.976287, 0.1734768, 0.9096738, 1, 0, 0.1098039, 1,
1.980837, -0.516907, 4.200995, 1, 0, 0.1019608, 1,
2.0151, 1.220275, 0.2392822, 1, 0, 0.09411765, 1,
2.034675, -0.4725908, 3.278973, 1, 0, 0.09019608, 1,
2.068781, 2.655246, 1.006733, 1, 0, 0.08235294, 1,
2.09062, -0.2564909, 0.6800672, 1, 0, 0.07843138, 1,
2.119086, -0.04215952, 1.211861, 1, 0, 0.07058824, 1,
2.168479, -1.357587, 4.125171, 1, 0, 0.06666667, 1,
2.187409, -1.285245, 2.430892, 1, 0, 0.05882353, 1,
2.20961, -0.4084457, 2.128027, 1, 0, 0.05490196, 1,
2.334578, -0.5333126, 1.217406, 1, 0, 0.04705882, 1,
2.395023, -1.124201, 2.550879, 1, 0, 0.04313726, 1,
2.43228, -0.547752, 1.726318, 1, 0, 0.03529412, 1,
2.470069, 0.3523702, 2.487682, 1, 0, 0.03137255, 1,
2.511233, -1.239752, 1.071129, 1, 0, 0.02352941, 1,
2.664315, 0.4483041, 2.528267, 1, 0, 0.01960784, 1,
2.85482, 0.4610294, 0.8930648, 1, 0, 0.01176471, 1,
2.961539, -0.350835, 2.292301, 1, 0, 0.007843138, 1
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
-0.2735665, -4.869569, -6.341066, 0, -0.5, 0.5, 0.5,
-0.2735665, -4.869569, -6.341066, 1, -0.5, 0.5, 0.5,
-0.2735665, -4.869569, -6.341066, 1, 1.5, 0.5, 0.5,
-0.2735665, -4.869569, -6.341066, 0, 1.5, 0.5, 0.5
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
-4.605372, -0.3146147, -6.341066, 0, -0.5, 0.5, 0.5,
-4.605372, -0.3146147, -6.341066, 1, -0.5, 0.5, 0.5,
-4.605372, -0.3146147, -6.341066, 1, 1.5, 0.5, 0.5,
-4.605372, -0.3146147, -6.341066, 0, 1.5, 0.5, 0.5
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
-4.605372, -4.869569, 0.1724336, 0, -0.5, 0.5, 0.5,
-4.605372, -4.869569, 0.1724336, 1, -0.5, 0.5, 0.5,
-4.605372, -4.869569, 0.1724336, 1, 1.5, 0.5, 0.5,
-4.605372, -4.869569, 0.1724336, 0, 1.5, 0.5, 0.5
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
-3, -3.818426, -4.837951,
2, -3.818426, -4.837951,
-3, -3.818426, -4.837951,
-3, -3.993616, -5.08847,
-2, -3.818426, -4.837951,
-2, -3.993616, -5.08847,
-1, -3.818426, -4.837951,
-1, -3.993616, -5.08847,
0, -3.818426, -4.837951,
0, -3.993616, -5.08847,
1, -3.818426, -4.837951,
1, -3.993616, -5.08847,
2, -3.818426, -4.837951,
2, -3.993616, -5.08847
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
-3, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
-3, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
-3, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
-3, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5,
-2, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
-2, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
-2, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
-2, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5,
-1, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
-1, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
-1, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
-1, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5,
0, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
0, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
0, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
0, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5,
1, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
1, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
1, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
1, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5,
2, -4.343997, -5.589508, 0, -0.5, 0.5, 0.5,
2, -4.343997, -5.589508, 1, -0.5, 0.5, 0.5,
2, -4.343997, -5.589508, 1, 1.5, 0.5, 0.5,
2, -4.343997, -5.589508, 0, 1.5, 0.5, 0.5
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
-3.605725, -3, -4.837951,
-3.605725, 3, -4.837951,
-3.605725, -3, -4.837951,
-3.772333, -3, -5.08847,
-3.605725, -2, -4.837951,
-3.772333, -2, -5.08847,
-3.605725, -1, -4.837951,
-3.772333, -1, -5.08847,
-3.605725, 0, -4.837951,
-3.772333, 0, -5.08847,
-3.605725, 1, -4.837951,
-3.772333, 1, -5.08847,
-3.605725, 2, -4.837951,
-3.772333, 2, -5.08847,
-3.605725, 3, -4.837951,
-3.772333, 3, -5.08847
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
-4.105548, -3, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, -3, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, -3, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, -3, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, -2, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, -2, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, -2, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, -2, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, -1, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, -1, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, -1, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, -1, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, 0, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, 0, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, 0, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, 0, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, 1, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, 1, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, 1, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, 1, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, 2, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, 2, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, 2, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, 2, -5.589508, 0, 1.5, 0.5, 0.5,
-4.105548, 3, -5.589508, 0, -0.5, 0.5, 0.5,
-4.105548, 3, -5.589508, 1, -0.5, 0.5, 0.5,
-4.105548, 3, -5.589508, 1, 1.5, 0.5, 0.5,
-4.105548, 3, -5.589508, 0, 1.5, 0.5, 0.5
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
-3.605725, -3.818426, -4,
-3.605725, -3.818426, 4,
-3.605725, -3.818426, -4,
-3.772333, -3.993616, -4,
-3.605725, -3.818426, -2,
-3.772333, -3.993616, -2,
-3.605725, -3.818426, 0,
-3.772333, -3.993616, 0,
-3.605725, -3.818426, 2,
-3.772333, -3.993616, 2,
-3.605725, -3.818426, 4,
-3.772333, -3.993616, 4
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
-4.105548, -4.343997, -4, 0, -0.5, 0.5, 0.5,
-4.105548, -4.343997, -4, 1, -0.5, 0.5, 0.5,
-4.105548, -4.343997, -4, 1, 1.5, 0.5, 0.5,
-4.105548, -4.343997, -4, 0, 1.5, 0.5, 0.5,
-4.105548, -4.343997, -2, 0, -0.5, 0.5, 0.5,
-4.105548, -4.343997, -2, 1, -0.5, 0.5, 0.5,
-4.105548, -4.343997, -2, 1, 1.5, 0.5, 0.5,
-4.105548, -4.343997, -2, 0, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 0, 0, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 0, 1, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 0, 1, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 0, 0, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 2, 0, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 2, 1, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 2, 1, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 2, 0, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 4, 0, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 4, 1, -0.5, 0.5, 0.5,
-4.105548, -4.343997, 4, 1, 1.5, 0.5, 0.5,
-4.105548, -4.343997, 4, 0, 1.5, 0.5, 0.5
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
-3.605725, -3.818426, -4.837951,
-3.605725, 3.189196, -4.837951,
-3.605725, -3.818426, 5.182818,
-3.605725, 3.189196, 5.182818,
-3.605725, -3.818426, -4.837951,
-3.605725, -3.818426, 5.182818,
-3.605725, 3.189196, -4.837951,
-3.605725, 3.189196, 5.182818,
-3.605725, -3.818426, -4.837951,
3.058592, -3.818426, -4.837951,
-3.605725, -3.818426, 5.182818,
3.058592, -3.818426, 5.182818,
-3.605725, 3.189196, -4.837951,
3.058592, 3.189196, -4.837951,
-3.605725, 3.189196, 5.182818,
3.058592, 3.189196, 5.182818,
3.058592, -3.818426, -4.837951,
3.058592, 3.189196, -4.837951,
3.058592, -3.818426, 5.182818,
3.058592, 3.189196, 5.182818,
3.058592, -3.818426, -4.837951,
3.058592, -3.818426, 5.182818,
3.058592, 3.189196, -4.837951,
3.058592, 3.189196, 5.182818
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
var radius = 7.436256;
var distance = 33.08474;
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
mvMatrix.translate( 0.2735665, 0.3146147, -0.1724336 );
mvMatrix.scale( 1.206459, 1.147354, 0.8023562 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08474);
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
fenbuconazole<-read.table("fenbuconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenbuconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
```

```r
y<-fenbuconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
```

```r
z<-fenbuconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
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
-3.508672, 0.4337582, -2.847231, 0, 0, 1, 1, 1,
-2.90576, 0.9515873, -1.30587, 1, 0, 0, 1, 1,
-2.80168, -0.004001008, -1.833466, 1, 0, 0, 1, 1,
-2.771685, -0.5575392, -2.237224, 1, 0, 0, 1, 1,
-2.72032, 1.091487, -2.286144, 1, 0, 0, 1, 1,
-2.67298, 1.520534, -3.301275, 1, 0, 0, 1, 1,
-2.597854, 0.3269413, -1.471839, 0, 0, 0, 1, 1,
-2.379565, -1.155833, -1.795347, 0, 0, 0, 1, 1,
-2.376202, 0.008021215, -1.210059, 0, 0, 0, 1, 1,
-2.338006, 1.342651, -0.407019, 0, 0, 0, 1, 1,
-2.331957, -1.076848, 0.8497481, 0, 0, 0, 1, 1,
-2.310439, 1.04622, -2.206289, 0, 0, 0, 1, 1,
-2.289395, 0.9084443, -2.35527, 0, 0, 0, 1, 1,
-2.270985, 0.1168619, -1.532674, 1, 1, 1, 1, 1,
-2.264793, -1.187894, -2.452023, 1, 1, 1, 1, 1,
-2.261191, 0.2309654, -1.241197, 1, 1, 1, 1, 1,
-2.248292, 0.9939525, -1.098641, 1, 1, 1, 1, 1,
-2.241604, 0.129604, -0.5510002, 1, 1, 1, 1, 1,
-2.230934, 0.6867934, 0.3565278, 1, 1, 1, 1, 1,
-2.229613, -0.686033, -2.731771, 1, 1, 1, 1, 1,
-2.176982, 1.241658, -1.942428, 1, 1, 1, 1, 1,
-2.161344, 0.07749129, -0.2672693, 1, 1, 1, 1, 1,
-2.131124, 0.5705782, -0.9536024, 1, 1, 1, 1, 1,
-2.120435, -0.3465618, -0.7928134, 1, 1, 1, 1, 1,
-2.102731, -0.280135, -0.05042199, 1, 1, 1, 1, 1,
-2.090466, -1.758193, -3.022242, 1, 1, 1, 1, 1,
-2.085397, -0.9104181, -1.734107, 1, 1, 1, 1, 1,
-2.074725, -0.07084626, -0.8056462, 1, 1, 1, 1, 1,
-2.056778, -0.3006738, -2.456916, 0, 0, 1, 1, 1,
-2.036406, 1.81804, -1.434484, 1, 0, 0, 1, 1,
-2.035315, -1.339541, -1.13722, 1, 0, 0, 1, 1,
-2.007979, 0.3390583, -0.8041353, 1, 0, 0, 1, 1,
-1.99899, 1.011678, -1.833251, 1, 0, 0, 1, 1,
-1.995549, 0.9575834, -1.319181, 1, 0, 0, 1, 1,
-1.993855, 0.2814154, -0.2594227, 0, 0, 0, 1, 1,
-1.979199, 1.890685, -1.622146, 0, 0, 0, 1, 1,
-1.979076, 0.002751835, -1.840705, 0, 0, 0, 1, 1,
-1.946942, 0.2205098, -1.686771, 0, 0, 0, 1, 1,
-1.934335, -0.6343648, -0.7141582, 0, 0, 0, 1, 1,
-1.898019, 1.42063, -1.333802, 0, 0, 0, 1, 1,
-1.839523, -0.1465298, -3.351154, 0, 0, 0, 1, 1,
-1.834202, -1.263871, -2.104193, 1, 1, 1, 1, 1,
-1.833433, -0.3581408, -2.773287, 1, 1, 1, 1, 1,
-1.823246, -0.2565099, -2.143395, 1, 1, 1, 1, 1,
-1.821298, 0.08792599, -1.55145, 1, 1, 1, 1, 1,
-1.807687, -0.8557366, -3.610018, 1, 1, 1, 1, 1,
-1.805171, -0.6338575, -3.949251, 1, 1, 1, 1, 1,
-1.793159, -1.158312, -1.41449, 1, 1, 1, 1, 1,
-1.77995, -1.504842, -2.252639, 1, 1, 1, 1, 1,
-1.777925, -0.326447, -1.299176, 1, 1, 1, 1, 1,
-1.771759, -0.3896952, -1.115178, 1, 1, 1, 1, 1,
-1.759979, -0.8653719, -3.361974, 1, 1, 1, 1, 1,
-1.757725, -0.2770204, -2.029398, 1, 1, 1, 1, 1,
-1.743536, -1.712369, -1.155706, 1, 1, 1, 1, 1,
-1.740877, -0.1621154, -1.233349, 1, 1, 1, 1, 1,
-1.740262, 0.607599, -1.724733, 1, 1, 1, 1, 1,
-1.72261, -0.5323593, -1.572628, 0, 0, 1, 1, 1,
-1.698508, -0.5336751, -2.499104, 1, 0, 0, 1, 1,
-1.687521, -0.4060225, -3.198735, 1, 0, 0, 1, 1,
-1.677238, -0.4407212, -0.8799146, 1, 0, 0, 1, 1,
-1.676891, -1.873822, -3.372937, 1, 0, 0, 1, 1,
-1.669465, -0.6594899, -1.190727, 1, 0, 0, 1, 1,
-1.663468, 1.089712, -0.01572752, 0, 0, 0, 1, 1,
-1.646321, -0.9722387, -3.659434, 0, 0, 0, 1, 1,
-1.637802, -0.7990777, -1.414357, 0, 0, 0, 1, 1,
-1.628539, 0.7046592, -1.173859, 0, 0, 0, 1, 1,
-1.625931, -0.8382986, -2.837014, 0, 0, 0, 1, 1,
-1.622258, -0.1722417, -1.392059, 0, 0, 0, 1, 1,
-1.612406, 1.015029, -1.859255, 0, 0, 0, 1, 1,
-1.594277, 0.592876, 0.4264095, 1, 1, 1, 1, 1,
-1.592818, -0.4507549, -1.248655, 1, 1, 1, 1, 1,
-1.580671, 2.089562, -0.06887621, 1, 1, 1, 1, 1,
-1.567446, -0.4438369, -1.632512, 1, 1, 1, 1, 1,
-1.562394, -1.326863, -2.312205, 1, 1, 1, 1, 1,
-1.551563, 1.605446, -2.363733, 1, 1, 1, 1, 1,
-1.551121, 0.7487587, -1.875911, 1, 1, 1, 1, 1,
-1.551073, -0.3121597, -0.7972536, 1, 1, 1, 1, 1,
-1.528673, -0.113693, -2.691172, 1, 1, 1, 1, 1,
-1.527772, -0.1290768, -1.653359, 1, 1, 1, 1, 1,
-1.525395, -1.105098, -2.217268, 1, 1, 1, 1, 1,
-1.501999, 1.289266, -0.9857502, 1, 1, 1, 1, 1,
-1.493001, -1.127311, -3.150368, 1, 1, 1, 1, 1,
-1.472071, 0.6518347, -1.032596, 1, 1, 1, 1, 1,
-1.469287, -0.7874369, -2.416705, 1, 1, 1, 1, 1,
-1.467113, 0.8387379, -1.277261, 0, 0, 1, 1, 1,
-1.45586, -1.297837, -2.131623, 1, 0, 0, 1, 1,
-1.452399, 1.413596, -2.798291, 1, 0, 0, 1, 1,
-1.440288, 2.125472, -0.9250299, 1, 0, 0, 1, 1,
-1.427575, -0.9431733, -2.22012, 1, 0, 0, 1, 1,
-1.427333, 1.63224, 0.1963999, 1, 0, 0, 1, 1,
-1.422876, 0.2711612, -1.973027, 0, 0, 0, 1, 1,
-1.418245, -0.8743274, -1.066711, 0, 0, 0, 1, 1,
-1.416368, -1.055094, -1.165987, 0, 0, 0, 1, 1,
-1.413894, -0.5407631, -2.520977, 0, 0, 0, 1, 1,
-1.412375, 0.8450027, 0.6046068, 0, 0, 0, 1, 1,
-1.403108, 1.794328, -2.408357, 0, 0, 0, 1, 1,
-1.397683, 1.219672, -2.221989, 0, 0, 0, 1, 1,
-1.388666, 0.1249277, -0.3177983, 1, 1, 1, 1, 1,
-1.380592, -1.046729, -2.519358, 1, 1, 1, 1, 1,
-1.380106, 0.9380348, -2.548951, 1, 1, 1, 1, 1,
-1.375454, 0.4518578, -1.88615, 1, 1, 1, 1, 1,
-1.371394, -0.4692807, -2.403196, 1, 1, 1, 1, 1,
-1.361808, 0.5138689, -2.199434, 1, 1, 1, 1, 1,
-1.361214, -1.279969, -1.992571, 1, 1, 1, 1, 1,
-1.360881, 0.3708516, -2.155153, 1, 1, 1, 1, 1,
-1.35819, 0.6235131, -2.510257, 1, 1, 1, 1, 1,
-1.349208, 0.2191083, -0.7721784, 1, 1, 1, 1, 1,
-1.348704, -1.069057, -2.274278, 1, 1, 1, 1, 1,
-1.347059, -1.564694, -1.440223, 1, 1, 1, 1, 1,
-1.346372, -0.2731149, -0.8463951, 1, 1, 1, 1, 1,
-1.339664, -3.716373, -3.590516, 1, 1, 1, 1, 1,
-1.339107, -0.9783959, -1.693894, 1, 1, 1, 1, 1,
-1.336963, 2.109759, -1.400534, 0, 0, 1, 1, 1,
-1.330299, 0.760677, -0.9534656, 1, 0, 0, 1, 1,
-1.328388, -1.219188, -1.715285, 1, 0, 0, 1, 1,
-1.320749, 1.785854, -1.733977, 1, 0, 0, 1, 1,
-1.307553, 1.317278, 0.8404149, 1, 0, 0, 1, 1,
-1.307224, 0.5820855, -0.4352315, 1, 0, 0, 1, 1,
-1.304757, 0.2178215, -1.586354, 0, 0, 0, 1, 1,
-1.297132, 0.03582059, -0.6708598, 0, 0, 0, 1, 1,
-1.280979, -0.4533989, -1.444956, 0, 0, 0, 1, 1,
-1.273114, 0.8796472, -1.624957, 0, 0, 0, 1, 1,
-1.27046, 0.987387, -1.624618, 0, 0, 0, 1, 1,
-1.263404, -0.3787786, -1.606827, 0, 0, 0, 1, 1,
-1.263267, -1.41357, -1.387555, 0, 0, 0, 1, 1,
-1.25679, 1.763142, 0.261986, 1, 1, 1, 1, 1,
-1.255847, 0.5536624, -1.524352, 1, 1, 1, 1, 1,
-1.254333, 0.8994085, -1.329421, 1, 1, 1, 1, 1,
-1.247006, -0.03172125, -0.7867112, 1, 1, 1, 1, 1,
-1.240793, -1.36613, -1.93882, 1, 1, 1, 1, 1,
-1.214798, 0.4073148, -0.5072988, 1, 1, 1, 1, 1,
-1.20402, -0.01484899, -2.379658, 1, 1, 1, 1, 1,
-1.202897, 0.7946665, -1.989614, 1, 1, 1, 1, 1,
-1.2011, 0.6062464, -2.805125, 1, 1, 1, 1, 1,
-1.177626, -1.022884, 0.2876881, 1, 1, 1, 1, 1,
-1.173911, -0.3545173, -0.5429239, 1, 1, 1, 1, 1,
-1.170711, -0.4068302, -0.06435408, 1, 1, 1, 1, 1,
-1.160159, -1.524366, -2.496583, 1, 1, 1, 1, 1,
-1.153802, 0.6193002, -1.157482, 1, 1, 1, 1, 1,
-1.139226, 0.6720422, -1.850374, 1, 1, 1, 1, 1,
-1.133041, -1.0207, -1.820815, 0, 0, 1, 1, 1,
-1.127064, 0.3998983, -0.5607861, 1, 0, 0, 1, 1,
-1.126818, 0.8433889, -0.3513561, 1, 0, 0, 1, 1,
-1.12674, -0.2177825, -1.860384, 1, 0, 0, 1, 1,
-1.121488, 0.04633844, -2.085409, 1, 0, 0, 1, 1,
-1.118997, -1.590264, -1.623127, 1, 0, 0, 1, 1,
-1.098276, -0.4439752, -1.67718, 0, 0, 0, 1, 1,
-1.076418, -0.4922568, -1.764242, 0, 0, 0, 1, 1,
-1.071838, 0.0637733, -1.88008, 0, 0, 0, 1, 1,
-1.068663, -1.102193, -3.622469, 0, 0, 0, 1, 1,
-1.068044, -0.4765742, -1.734677, 0, 0, 0, 1, 1,
-1.067165, -0.9489591, -3.297128, 0, 0, 0, 1, 1,
-1.056427, -0.5914801, -0.4991818, 0, 0, 0, 1, 1,
-1.046495, -0.8047829, -1.579202, 1, 1, 1, 1, 1,
-1.046211, -1.014614, -3.455806, 1, 1, 1, 1, 1,
-1.04202, -1.55502, -0.3163032, 1, 1, 1, 1, 1,
-1.037801, -0.339152, -1.399699, 1, 1, 1, 1, 1,
-1.034326, -1.051678, -1.561346, 1, 1, 1, 1, 1,
-1.031317, 1.712088, 1.399257, 1, 1, 1, 1, 1,
-1.029496, -0.007078265, -2.363437, 1, 1, 1, 1, 1,
-1.026402, -1.877325, -2.866374, 1, 1, 1, 1, 1,
-1.025098, 0.2097514, -1.742543, 1, 1, 1, 1, 1,
-1.023422, -0.3705318, -1.072128, 1, 1, 1, 1, 1,
-1.022427, -1.752747, -3.674275, 1, 1, 1, 1, 1,
-1.007363, -1.306874, -3.273349, 1, 1, 1, 1, 1,
-1.006478, -0.7560762, -3.187121, 1, 1, 1, 1, 1,
-1.005459, 0.3242563, -2.510442, 1, 1, 1, 1, 1,
-0.9929972, 0.837747, -1.265567, 1, 1, 1, 1, 1,
-0.9903893, -1.080306, -3.923288, 0, 0, 1, 1, 1,
-0.9899029, -1.101844, -2.509883, 1, 0, 0, 1, 1,
-0.9890226, 1.161527, -1.47903, 1, 0, 0, 1, 1,
-0.9889951, -0.7979198, -2.352493, 1, 0, 0, 1, 1,
-0.9829242, 0.4706399, -0.7018506, 1, 0, 0, 1, 1,
-0.9769889, -0.7304119, -2.235221, 1, 0, 0, 1, 1,
-0.9703452, -1.865835, -2.452756, 0, 0, 0, 1, 1,
-0.9559054, 2.518933, -1.473008, 0, 0, 0, 1, 1,
-0.9495147, -0.3115647, -1.807221, 0, 0, 0, 1, 1,
-0.9413128, 1.448153, -1.099055, 0, 0, 0, 1, 1,
-0.9405599, 1.834376, 0.1877231, 0, 0, 0, 1, 1,
-0.9402592, -0.08575211, -0.6629142, 0, 0, 0, 1, 1,
-0.9393483, -0.5502703, -1.515915, 0, 0, 0, 1, 1,
-0.9344613, -0.5614851, -1.396569, 1, 1, 1, 1, 1,
-0.9336936, 0.5504107, -2.847771, 1, 1, 1, 1, 1,
-0.9336081, -1.45515, -2.081455, 1, 1, 1, 1, 1,
-0.9319172, 0.04482342, -1.498725, 1, 1, 1, 1, 1,
-0.9231498, -1.526964, -1.515827, 1, 1, 1, 1, 1,
-0.9154901, -0.06880634, 0.2716856, 1, 1, 1, 1, 1,
-0.9135628, 0.007463031, -0.4681889, 1, 1, 1, 1, 1,
-0.8952265, 0.7497469, -2.773943, 1, 1, 1, 1, 1,
-0.8910246, 0.05985377, -0.2492919, 1, 1, 1, 1, 1,
-0.8833297, 0.4382443, -3.137584, 1, 1, 1, 1, 1,
-0.8758046, -0.2815866, -2.408698, 1, 1, 1, 1, 1,
-0.8737311, 0.7560005, -0.7116364, 1, 1, 1, 1, 1,
-0.8736903, -0.8954102, -2.988424, 1, 1, 1, 1, 1,
-0.8723642, -1.352564, -2.378702, 1, 1, 1, 1, 1,
-0.870771, 1.016159, -0.7547843, 1, 1, 1, 1, 1,
-0.8705839, -0.8620192, -2.011813, 0, 0, 1, 1, 1,
-0.8669151, 0.3913853, -0.8826089, 1, 0, 0, 1, 1,
-0.8643135, -0.633081, -3.122164, 1, 0, 0, 1, 1,
-0.8604946, -0.0864898, -1.777483, 1, 0, 0, 1, 1,
-0.8567846, 1.049294, 0.04110101, 1, 0, 0, 1, 1,
-0.8505294, 0.5428256, 0.07188606, 1, 0, 0, 1, 1,
-0.8504379, 1.015049, -1.141896, 0, 0, 0, 1, 1,
-0.8452697, 0.257841, -1.401534, 0, 0, 0, 1, 1,
-0.8448412, -0.00719438, -2.343647, 0, 0, 0, 1, 1,
-0.8378041, 1.453434, -1.567027, 0, 0, 0, 1, 1,
-0.832404, -0.6681217, -2.167868, 0, 0, 0, 1, 1,
-0.8316967, 0.5646693, -0.5815296, 0, 0, 0, 1, 1,
-0.82393, -0.6408604, -2.950066, 0, 0, 0, 1, 1,
-0.8233222, -2.229358, -1.346509, 1, 1, 1, 1, 1,
-0.8229116, -1.975783, -4.170644, 1, 1, 1, 1, 1,
-0.8215339, 0.08583003, -1.125614, 1, 1, 1, 1, 1,
-0.8157986, -1.079964, -2.000974, 1, 1, 1, 1, 1,
-0.8092596, 0.2624536, -2.678381, 1, 1, 1, 1, 1,
-0.8078847, -1.992193, -2.553513, 1, 1, 1, 1, 1,
-0.80599, 0.7358018, -1.650145, 1, 1, 1, 1, 1,
-0.8051194, 0.2782083, 1.586611, 1, 1, 1, 1, 1,
-0.8041929, -0.9257129, -2.468417, 1, 1, 1, 1, 1,
-0.8014001, 2.378161, -0.6206279, 1, 1, 1, 1, 1,
-0.7897623, -0.05461149, -1.530527, 1, 1, 1, 1, 1,
-0.7807603, 0.4163709, -2.915264, 1, 1, 1, 1, 1,
-0.7629878, -0.9128785, -2.174967, 1, 1, 1, 1, 1,
-0.7617534, -1.428475, -2.14831, 1, 1, 1, 1, 1,
-0.7540013, -1.919759, -3.592536, 1, 1, 1, 1, 1,
-0.7515324, 0.2557285, -0.8659195, 0, 0, 1, 1, 1,
-0.7427996, 0.05605169, -1.993188, 1, 0, 0, 1, 1,
-0.7272872, -1.058848, -3.390967, 1, 0, 0, 1, 1,
-0.7241064, -1.182402, -2.222271, 1, 0, 0, 1, 1,
-0.7237423, 0.5212108, -1.87171, 1, 0, 0, 1, 1,
-0.7229543, 1.523754, -1.036793, 1, 0, 0, 1, 1,
-0.7178464, -0.9672132, -1.825632, 0, 0, 0, 1, 1,
-0.7175491, 1.566691, 0.250986, 0, 0, 0, 1, 1,
-0.7153739, 0.5488736, -2.830703, 0, 0, 0, 1, 1,
-0.7134441, -0.2810985, -3.673219, 0, 0, 0, 1, 1,
-0.7113237, -0.2874499, -1.601733, 0, 0, 0, 1, 1,
-0.7074294, -0.8134502, -3.043836, 0, 0, 0, 1, 1,
-0.7062869, 0.9933442, -1.042413, 0, 0, 0, 1, 1,
-0.7050509, -1.157894, -2.387064, 1, 1, 1, 1, 1,
-0.7039496, 1.120849, -0.7209702, 1, 1, 1, 1, 1,
-0.700156, 0.5608488, 0.1958215, 1, 1, 1, 1, 1,
-0.6970783, 0.2878047, -1.232222, 1, 1, 1, 1, 1,
-0.6914707, -0.1746165, -2.410364, 1, 1, 1, 1, 1,
-0.6876636, 0.8205535, 1.962951, 1, 1, 1, 1, 1,
-0.6855899, 0.2814218, -2.174294, 1, 1, 1, 1, 1,
-0.6842817, 0.11706, -2.102548, 1, 1, 1, 1, 1,
-0.6823313, 0.5065912, -0.06247218, 1, 1, 1, 1, 1,
-0.6801676, -0.1008817, -1.138493, 1, 1, 1, 1, 1,
-0.6784755, -0.2043615, -1.562155, 1, 1, 1, 1, 1,
-0.6724712, -0.6781682, -1.57731, 1, 1, 1, 1, 1,
-0.6669897, -0.5973788, -2.991498, 1, 1, 1, 1, 1,
-0.6657195, 0.2498354, -0.4044672, 1, 1, 1, 1, 1,
-0.6647837, -0.05407682, -2.009083, 1, 1, 1, 1, 1,
-0.6647505, 0.4497378, -1.066144, 0, 0, 1, 1, 1,
-0.663422, 1.090537, -0.8168405, 1, 0, 0, 1, 1,
-0.6622455, 0.9019087, -0.6155186, 1, 0, 0, 1, 1,
-0.6506428, 0.3706967, -0.6704246, 1, 0, 0, 1, 1,
-0.6493592, 0.1920742, -0.8161433, 1, 0, 0, 1, 1,
-0.6487355, -0.5096204, -3.178687, 1, 0, 0, 1, 1,
-0.6477996, -0.120939, 1.428343, 0, 0, 0, 1, 1,
-0.6387548, 0.5583134, 0.1934031, 0, 0, 0, 1, 1,
-0.6372074, 1.471475, 0.07744195, 0, 0, 0, 1, 1,
-0.634479, 2.292129, -1.504601, 0, 0, 0, 1, 1,
-0.6319402, 1.190591, -0.5442747, 0, 0, 0, 1, 1,
-0.6187412, -1.36983, -3.789298, 0, 0, 0, 1, 1,
-0.6184586, -0.4060078, -2.114528, 0, 0, 0, 1, 1,
-0.6151613, 0.06684702, -1.786318, 1, 1, 1, 1, 1,
-0.6144437, 0.6143969, 2.05045, 1, 1, 1, 1, 1,
-0.613346, -0.2664852, -2.227418, 1, 1, 1, 1, 1,
-0.6111822, -1.074649, -1.847868, 1, 1, 1, 1, 1,
-0.6097164, -0.006594139, -1.083302, 1, 1, 1, 1, 1,
-0.6059762, -0.6211734, -2.759447, 1, 1, 1, 1, 1,
-0.6048444, 0.3895807, -1.381267, 1, 1, 1, 1, 1,
-0.6003705, 1.603432, -0.04649446, 1, 1, 1, 1, 1,
-0.5993742, 0.9291964, 1.077852, 1, 1, 1, 1, 1,
-0.593882, -1.948042, -3.285297, 1, 1, 1, 1, 1,
-0.5817854, 0.1216183, -1.410508, 1, 1, 1, 1, 1,
-0.5772735, 0.8665948, -0.9275571, 1, 1, 1, 1, 1,
-0.5770429, -0.4493525, -2.139167, 1, 1, 1, 1, 1,
-0.5756341, -0.7015492, -3.995476, 1, 1, 1, 1, 1,
-0.5750722, -1.658615, -0.5871322, 1, 1, 1, 1, 1,
-0.574413, -1.184187, -0.5193989, 0, 0, 1, 1, 1,
-0.5731418, 0.0508725, -1.666541, 1, 0, 0, 1, 1,
-0.5719965, -1.130416, -4.095504, 1, 0, 0, 1, 1,
-0.5526285, -0.1884497, -0.5741342, 1, 0, 0, 1, 1,
-0.5495045, -0.1094156, -2.199841, 1, 0, 0, 1, 1,
-0.5477738, -0.2322423, -2.744204, 1, 0, 0, 1, 1,
-0.5466523, 0.359778, -2.280256, 0, 0, 0, 1, 1,
-0.5420417, 0.6666204, 0.8834779, 0, 0, 0, 1, 1,
-0.5408885, -1.161778, -1.952855, 0, 0, 0, 1, 1,
-0.5406036, 0.3087459, 0.5033783, 0, 0, 0, 1, 1,
-0.5379198, -0.3747816, -3.207527, 0, 0, 0, 1, 1,
-0.5377019, 0.32573, -2.112335, 0, 0, 0, 1, 1,
-0.5364233, 1.341603, 0.2956671, 0, 0, 0, 1, 1,
-0.5362827, -0.27293, -2.057119, 1, 1, 1, 1, 1,
-0.5341701, -0.2252329, -1.751452, 1, 1, 1, 1, 1,
-0.5325313, 1.107548, 2.295361, 1, 1, 1, 1, 1,
-0.5307155, -1.986888, -2.218444, 1, 1, 1, 1, 1,
-0.5306108, 0.2332915, -1.994557, 1, 1, 1, 1, 1,
-0.5296167, -0.1772259, -1.511831, 1, 1, 1, 1, 1,
-0.5239273, 0.4967873, -0.832763, 1, 1, 1, 1, 1,
-0.5196176, 0.5285903, 0.2694064, 1, 1, 1, 1, 1,
-0.5162217, -0.003046095, -2.691433, 1, 1, 1, 1, 1,
-0.5159775, 0.81929, -1.315452, 1, 1, 1, 1, 1,
-0.5137706, 1.645812, -1.182484, 1, 1, 1, 1, 1,
-0.5124496, 0.03293674, -1.77777, 1, 1, 1, 1, 1,
-0.509354, -0.4114735, -2.917731, 1, 1, 1, 1, 1,
-0.507561, 1.696396, -2.346407, 1, 1, 1, 1, 1,
-0.5052702, -0.4447747, 0.02870544, 1, 1, 1, 1, 1,
-0.5033445, 0.9793014, -2.278668, 0, 0, 1, 1, 1,
-0.5031354, -0.9473765, -3.480146, 1, 0, 0, 1, 1,
-0.5025734, 0.8376554, -1.461479, 1, 0, 0, 1, 1,
-0.4960252, -1.063178, -3.667524, 1, 0, 0, 1, 1,
-0.4934768, 0.5511241, -2.292948, 1, 0, 0, 1, 1,
-0.4925038, 0.0788666, -1.031338, 1, 0, 0, 1, 1,
-0.4885257, -1.669771, -2.241821, 0, 0, 0, 1, 1,
-0.4871789, 0.2380645, -0.9668785, 0, 0, 0, 1, 1,
-0.4844704, -0.9825413, -2.979492, 0, 0, 0, 1, 1,
-0.4814393, -0.3669616, -0.6030995, 0, 0, 0, 1, 1,
-0.4778026, -0.5078528, -1.76751, 0, 0, 0, 1, 1,
-0.4752216, 0.08175952, -1.846672, 0, 0, 0, 1, 1,
-0.4751716, -0.3269059, -1.889778, 0, 0, 0, 1, 1,
-0.4691686, 0.7658144, 0.6603295, 1, 1, 1, 1, 1,
-0.4639943, -2.204076, -4.692017, 1, 1, 1, 1, 1,
-0.46315, 0.9900135, -1.392218, 1, 1, 1, 1, 1,
-0.462911, -1.187161, -1.253896, 1, 1, 1, 1, 1,
-0.4618839, 0.1392857, -2.003484, 1, 1, 1, 1, 1,
-0.46083, -0.3749125, -1.475301, 1, 1, 1, 1, 1,
-0.4598356, 0.3690106, -1.932471, 1, 1, 1, 1, 1,
-0.4592523, 0.3657813, -1.086423, 1, 1, 1, 1, 1,
-0.4578672, 1.610071, 0.9211995, 1, 1, 1, 1, 1,
-0.4536647, 0.4981174, 1.661962, 1, 1, 1, 1, 1,
-0.4533603, 0.7621342, -0.7692171, 1, 1, 1, 1, 1,
-0.451995, -0.04299313, -1.542709, 1, 1, 1, 1, 1,
-0.4504988, -0.9538767, -3.217021, 1, 1, 1, 1, 1,
-0.4395601, -0.1089685, -2.067093, 1, 1, 1, 1, 1,
-0.439495, 0.02246011, -2.149434, 1, 1, 1, 1, 1,
-0.4267157, 1.485834, 1.650661, 0, 0, 1, 1, 1,
-0.4251815, 0.5175472, -1.643967, 1, 0, 0, 1, 1,
-0.4247154, 0.3042592, -0.4893019, 1, 0, 0, 1, 1,
-0.4229589, -0.01251992, -3.584109, 1, 0, 0, 1, 1,
-0.4222791, -1.385586, -1.966195, 1, 0, 0, 1, 1,
-0.4211894, 0.1538498, -0.9416829, 1, 0, 0, 1, 1,
-0.4151296, -2.002961, -2.289186, 0, 0, 0, 1, 1,
-0.3999871, 1.104527, -1.074604, 0, 0, 0, 1, 1,
-0.3922626, -0.6816968, -1.567901, 0, 0, 0, 1, 1,
-0.3910725, -2.01383, -3.756063, 0, 0, 0, 1, 1,
-0.3889525, -0.4253198, -2.466044, 0, 0, 0, 1, 1,
-0.3880057, -1.572472, -2.690567, 0, 0, 0, 1, 1,
-0.3875096, -1.141073, -2.90974, 0, 0, 0, 1, 1,
-0.3835781, -1.601001, -1.972796, 1, 1, 1, 1, 1,
-0.3816077, -0.02806849, -2.827697, 1, 1, 1, 1, 1,
-0.3801228, -0.6950808, -3.15864, 1, 1, 1, 1, 1,
-0.3791186, 1.313584, -1.036588, 1, 1, 1, 1, 1,
-0.3785014, 0.7853438, 1.053773, 1, 1, 1, 1, 1,
-0.3742591, -0.447493, -2.023107, 1, 1, 1, 1, 1,
-0.3733594, -1.600307, -4.059489, 1, 1, 1, 1, 1,
-0.3722737, 1.470486, -1.016291, 1, 1, 1, 1, 1,
-0.3719874, -0.104514, -0.3744611, 1, 1, 1, 1, 1,
-0.3713634, 0.4333421, 1.042022, 1, 1, 1, 1, 1,
-0.3676515, 0.3304544, 0.07576276, 1, 1, 1, 1, 1,
-0.3620307, -1.179761, -4.260861, 1, 1, 1, 1, 1,
-0.3606683, -0.3757696, -0.06992883, 1, 1, 1, 1, 1,
-0.3587949, -0.07328824, -1.853314, 1, 1, 1, 1, 1,
-0.3518963, -0.3211265, -1.511182, 1, 1, 1, 1, 1,
-0.343765, 0.6024362, -1.318997, 0, 0, 1, 1, 1,
-0.337716, 0.3992717, -1.879777, 1, 0, 0, 1, 1,
-0.3376628, -1.273188, -2.050732, 1, 0, 0, 1, 1,
-0.3374536, 0.3980415, -1.598566, 1, 0, 0, 1, 1,
-0.332151, 1.447382, 1.779026, 1, 0, 0, 1, 1,
-0.3307895, 0.1881559, -1.780341, 1, 0, 0, 1, 1,
-0.3251534, -0.08861475, -2.568911, 0, 0, 0, 1, 1,
-0.3251056, -0.3646548, -0.1577851, 0, 0, 0, 1, 1,
-0.3213412, 0.3161566, -1.178253, 0, 0, 0, 1, 1,
-0.320737, -0.0948104, -1.353085, 0, 0, 0, 1, 1,
-0.3157836, 0.8873942, -0.6140619, 0, 0, 0, 1, 1,
-0.3145367, -0.4938135, -0.8898733, 0, 0, 0, 1, 1,
-0.3144008, 0.04959187, 1.665778, 0, 0, 0, 1, 1,
-0.312077, 0.3916468, 0.7745835, 1, 1, 1, 1, 1,
-0.3099622, 0.196992, -1.75939, 1, 1, 1, 1, 1,
-0.3091004, -3.281865, -0.3227545, 1, 1, 1, 1, 1,
-0.3067525, 0.2215015, -1.36326, 1, 1, 1, 1, 1,
-0.305157, -0.9899389, -3.288373, 1, 1, 1, 1, 1,
-0.303863, 0.1146881, -1.432633, 1, 1, 1, 1, 1,
-0.2968166, -0.1043782, -3.900632, 1, 1, 1, 1, 1,
-0.2956342, 2.119988, -0.8033077, 1, 1, 1, 1, 1,
-0.2953769, 0.9100556, 0.195364, 1, 1, 1, 1, 1,
-0.2952494, -0.9969794, -1.410873, 1, 1, 1, 1, 1,
-0.288479, -0.5469688, -2.408753, 1, 1, 1, 1, 1,
-0.287087, -0.3309272, -1.41827, 1, 1, 1, 1, 1,
-0.2859963, 0.5016656, -1.705432, 1, 1, 1, 1, 1,
-0.2826614, -0.5355181, -0.8872116, 1, 1, 1, 1, 1,
-0.2817282, -0.08642336, -2.035438, 1, 1, 1, 1, 1,
-0.2692798, -1.390694, -3.572338, 0, 0, 1, 1, 1,
-0.2612864, -1.293765, -2.604011, 1, 0, 0, 1, 1,
-0.2569877, -0.1087304, -2.154379, 1, 0, 0, 1, 1,
-0.254148, 0.06139323, -1.33891, 1, 0, 0, 1, 1,
-0.2527027, 0.6841364, 0.4130772, 1, 0, 0, 1, 1,
-0.2511993, 0.2421131, 0.6155478, 1, 0, 0, 1, 1,
-0.2473988, -1.537325, -1.217661, 0, 0, 0, 1, 1,
-0.2473328, 0.1624764, -2.07305, 0, 0, 0, 1, 1,
-0.2429425, -1.619455, -3.010057, 0, 0, 0, 1, 1,
-0.2429348, -1.778782, -3.185668, 0, 0, 0, 1, 1,
-0.2383445, -1.437059, -3.546113, 0, 0, 0, 1, 1,
-0.2372322, -1.379069, -3.446653, 0, 0, 0, 1, 1,
-0.2352317, 0.8918272, -1.145584, 0, 0, 0, 1, 1,
-0.2316071, -0.09770159, -2.1118, 1, 1, 1, 1, 1,
-0.2307454, 2.695184, 0.9969375, 1, 1, 1, 1, 1,
-0.2283304, -1.072716, -3.644194, 1, 1, 1, 1, 1,
-0.2279577, 0.7163946, 0.08558857, 1, 1, 1, 1, 1,
-0.2279137, 0.2291305, -0.106318, 1, 1, 1, 1, 1,
-0.227028, 1.028581, 0.2252018, 1, 1, 1, 1, 1,
-0.2264569, 1.391611, 0.5232626, 1, 1, 1, 1, 1,
-0.2184116, 1.332484, -2.036508, 1, 1, 1, 1, 1,
-0.2160274, -0.009948117, -1.440976, 1, 1, 1, 1, 1,
-0.2155691, -0.6010405, -3.751587, 1, 1, 1, 1, 1,
-0.2131925, 0.06085537, -2.161399, 1, 1, 1, 1, 1,
-0.2130296, 1.346326, 2.361876, 1, 1, 1, 1, 1,
-0.2067869, -0.6607602, -2.865677, 1, 1, 1, 1, 1,
-0.200504, -1.748449, -2.018985, 1, 1, 1, 1, 1,
-0.2000447, -1.754182, -3.138694, 1, 1, 1, 1, 1,
-0.199389, 0.6960161, 0.1550563, 0, 0, 1, 1, 1,
-0.1968286, -0.157002, -1.199743, 1, 0, 0, 1, 1,
-0.1950449, 0.930784, 0.5175989, 1, 0, 0, 1, 1,
-0.1937787, -0.01839209, -1.292773, 1, 0, 0, 1, 1,
-0.1889596, -0.4251655, -3.793658, 1, 0, 0, 1, 1,
-0.1879673, 0.6174406, 1.112553, 1, 0, 0, 1, 1,
-0.1843837, -1.00309, -3.346017, 0, 0, 0, 1, 1,
-0.1842295, 0.9303631, 0.2250906, 0, 0, 0, 1, 1,
-0.1806725, 0.6275254, 1.400736, 0, 0, 0, 1, 1,
-0.1800616, 0.863688, -1.153334, 0, 0, 0, 1, 1,
-0.1773803, 0.6432176, -0.3726183, 0, 0, 0, 1, 1,
-0.1739082, 0.2196339, -1.373197, 0, 0, 0, 1, 1,
-0.1737038, 0.8953948, 1.986476, 0, 0, 0, 1, 1,
-0.1710907, -0.0476304, -2.118653, 1, 1, 1, 1, 1,
-0.1698935, -0.8897171, -2.682955, 1, 1, 1, 1, 1,
-0.1664882, 0.3943097, -0.6896093, 1, 1, 1, 1, 1,
-0.1651364, -1.000002, -3.099818, 1, 1, 1, 1, 1,
-0.1649846, -0.3251247, -2.992034, 1, 1, 1, 1, 1,
-0.164534, 0.05356054, -1.919618, 1, 1, 1, 1, 1,
-0.1644871, 0.5719506, -1.659845, 1, 1, 1, 1, 1,
-0.1592991, 0.5728214, 0.08737742, 1, 1, 1, 1, 1,
-0.1589675, 0.4820216, -3.053253, 1, 1, 1, 1, 1,
-0.1539726, 0.8617542, 1.165081, 1, 1, 1, 1, 1,
-0.1500281, -1.242384, -3.759659, 1, 1, 1, 1, 1,
-0.1463031, -1.705144, -3.198741, 1, 1, 1, 1, 1,
-0.1437529, -0.2463206, -2.219851, 1, 1, 1, 1, 1,
-0.1383901, -0.9445899, -2.499419, 1, 1, 1, 1, 1,
-0.1364417, -0.439135, -3.082202, 1, 1, 1, 1, 1,
-0.135439, -0.9769368, -2.829035, 0, 0, 1, 1, 1,
-0.1327153, -0.7084818, -2.649044, 1, 0, 0, 1, 1,
-0.1326249, 1.540745, 0.5614495, 1, 0, 0, 1, 1,
-0.1290748, -0.8675896, -2.884371, 1, 0, 0, 1, 1,
-0.1234254, 1.377568, -0.08238313, 1, 0, 0, 1, 1,
-0.1190288, -0.7107844, -4.233463, 1, 0, 0, 1, 1,
-0.1135054, -0.4574853, -4.066379, 0, 0, 0, 1, 1,
-0.1108376, -0.7267007, -2.111865, 0, 0, 0, 1, 1,
-0.1103308, -1.773838, -2.203535, 0, 0, 0, 1, 1,
-0.1101217, -1.557865, -2.624013, 0, 0, 0, 1, 1,
-0.1061681, 0.02498294, -2.202676, 0, 0, 0, 1, 1,
-0.102911, -0.9430404, -3.067897, 0, 0, 0, 1, 1,
-0.09911298, 0.04004053, -1.390347, 0, 0, 0, 1, 1,
-0.09789142, -0.7600527, -3.307036, 1, 1, 1, 1, 1,
-0.09689054, 0.9031786, 0.7178194, 1, 1, 1, 1, 1,
-0.08674585, 0.2931732, 1.105065, 1, 1, 1, 1, 1,
-0.0858897, 0.6736216, 0.6607662, 1, 1, 1, 1, 1,
-0.08204497, -1.366928, -4.126827, 1, 1, 1, 1, 1,
-0.0708697, 0.9634883, -0.2151814, 1, 1, 1, 1, 1,
-0.06999972, 1.747828, -0.07238932, 1, 1, 1, 1, 1,
-0.05165172, -0.957617, -4.20677, 1, 1, 1, 1, 1,
-0.04906934, 0.6325884, -0.07767148, 1, 1, 1, 1, 1,
-0.04446714, 0.2292183, -0.269306, 1, 1, 1, 1, 1,
-0.04431634, -0.05089928, -1.825871, 1, 1, 1, 1, 1,
-0.04332568, -1.427737, -2.604023, 1, 1, 1, 1, 1,
-0.04216885, -0.1149999, -4.280543, 1, 1, 1, 1, 1,
-0.04114413, 0.9287573, -0.3212634, 1, 1, 1, 1, 1,
-0.03919374, -0.05211336, -3.094578, 1, 1, 1, 1, 1,
-0.03862653, -2.645231, -3.741256, 0, 0, 1, 1, 1,
-0.03840088, -1.927296, -4.056071, 1, 0, 0, 1, 1,
-0.03729161, 0.6462827, -1.530918, 1, 0, 0, 1, 1,
-0.03713705, -1.249915, -3.813246, 1, 0, 0, 1, 1,
-0.03410933, 0.1447484, 1.890497, 1, 0, 0, 1, 1,
-0.02902159, -1.601347, -4.344101, 1, 0, 0, 1, 1,
-0.02511751, -1.166865, -4.538637, 0, 0, 0, 1, 1,
-0.02133109, -1.484207, -3.583081, 0, 0, 0, 1, 1,
-0.0208826, -0.1044941, -3.190951, 0, 0, 0, 1, 1,
-0.01966875, -0.3710338, -3.986067, 0, 0, 0, 1, 1,
-0.01440437, -0.6948245, -2.361263, 0, 0, 0, 1, 1,
-0.0138507, -0.5354506, -1.794496, 0, 0, 0, 1, 1,
-0.01281871, 0.4699342, -0.7606258, 0, 0, 0, 1, 1,
-0.009842387, -1.363559, -3.643809, 1, 1, 1, 1, 1,
-0.008084015, 0.5667532, -1.075066, 1, 1, 1, 1, 1,
-0.001676662, -0.5761001, -3.18656, 1, 1, 1, 1, 1,
0.001973256, 1.020998, 0.3557583, 1, 1, 1, 1, 1,
0.00198738, 0.6037077, 0.2946445, 1, 1, 1, 1, 1,
0.003265549, 0.2338079, 2.23192, 1, 1, 1, 1, 1,
0.004572518, -0.211862, 3.652371, 1, 1, 1, 1, 1,
0.01296799, -0.497841, 2.759428, 1, 1, 1, 1, 1,
0.01343874, 0.1068731, -0.4537165, 1, 1, 1, 1, 1,
0.01693594, 0.6969999, -1.048323, 1, 1, 1, 1, 1,
0.01693912, -1.933061, 2.500014, 1, 1, 1, 1, 1,
0.02143708, 2.301038, 1.068876, 1, 1, 1, 1, 1,
0.02177555, -0.4037648, 2.725314, 1, 1, 1, 1, 1,
0.02181376, 0.5906539, 0.195689, 1, 1, 1, 1, 1,
0.02576043, 0.06572682, -0.4053823, 1, 1, 1, 1, 1,
0.02955362, -0.3739148, 2.50364, 0, 0, 1, 1, 1,
0.03063324, 1.002855, -0.9269621, 1, 0, 0, 1, 1,
0.03067469, -1.284557, 1.58258, 1, 0, 0, 1, 1,
0.03301957, 0.9959337, 0.5432355, 1, 0, 0, 1, 1,
0.03613112, 0.343486, 0.8850993, 1, 0, 0, 1, 1,
0.03816155, -1.02347, 2.462493, 1, 0, 0, 1, 1,
0.04048761, -0.86097, 4.568864, 0, 0, 0, 1, 1,
0.04684218, -0.1003457, 3.432125, 0, 0, 0, 1, 1,
0.04712557, 1.208698, -1.691127, 0, 0, 0, 1, 1,
0.05524564, -1.507648, 3.46597, 0, 0, 0, 1, 1,
0.05799717, -0.4107836, 3.132171, 0, 0, 0, 1, 1,
0.05863146, -0.005479677, 3.060712, 0, 0, 0, 1, 1,
0.05877893, 0.9799162, 0.4414273, 0, 0, 0, 1, 1,
0.06167644, 0.6574474, 0.4725222, 1, 1, 1, 1, 1,
0.06519534, -0.6464373, 3.35216, 1, 1, 1, 1, 1,
0.0711843, 1.663561, 1.301194, 1, 1, 1, 1, 1,
0.0730671, 0.2918847, -1.366168, 1, 1, 1, 1, 1,
0.07417282, -0.4534539, 3.781162, 1, 1, 1, 1, 1,
0.07615818, -1.880682, 3.210038, 1, 1, 1, 1, 1,
0.07982592, -0.8245786, 4.000916, 1, 1, 1, 1, 1,
0.08433365, 0.3044305, -0.6296129, 1, 1, 1, 1, 1,
0.08433706, 0.9166418, -0.6316901, 1, 1, 1, 1, 1,
0.08530159, 1.468127, 1.556686, 1, 1, 1, 1, 1,
0.08535974, 0.1206158, 2.069174, 1, 1, 1, 1, 1,
0.085493, -0.6282523, 3.590373, 1, 1, 1, 1, 1,
0.08619145, 0.2003203, -0.1679177, 1, 1, 1, 1, 1,
0.08753947, 1.445938, -1.174057, 1, 1, 1, 1, 1,
0.09005255, -0.2581308, 1.7203, 1, 1, 1, 1, 1,
0.09080807, -0.5368581, 4.152178, 0, 0, 1, 1, 1,
0.09481595, -0.2237232, 3.096578, 1, 0, 0, 1, 1,
0.09885308, 1.245929, 0.3752703, 1, 0, 0, 1, 1,
0.09956575, 1.745744, 0.06056312, 1, 0, 0, 1, 1,
0.1005123, 1.294659, 0.7143298, 1, 0, 0, 1, 1,
0.1021712, -2.030193, 2.860558, 1, 0, 0, 1, 1,
0.1100704, -0.7434334, 4.01203, 0, 0, 0, 1, 1,
0.1165582, -0.08314516, 3.324609, 0, 0, 0, 1, 1,
0.1170821, 1.23524, 0.7740614, 0, 0, 0, 1, 1,
0.1276231, -0.330681, 3.225149, 0, 0, 0, 1, 1,
0.1282119, -0.355072, 1.97352, 0, 0, 0, 1, 1,
0.1287379, -0.375484, 2.397838, 0, 0, 0, 1, 1,
0.1366037, 0.4111376, -2.074495, 0, 0, 0, 1, 1,
0.1368392, 0.06668659, 0.7913416, 1, 1, 1, 1, 1,
0.138887, 0.9988421, 0.520864, 1, 1, 1, 1, 1,
0.1407378, -0.1537441, 2.652333, 1, 1, 1, 1, 1,
0.141538, -0.3455924, 2.741703, 1, 1, 1, 1, 1,
0.1425085, -0.7321467, 2.061732, 1, 1, 1, 1, 1,
0.1427024, 1.057079, -0.8374386, 1, 1, 1, 1, 1,
0.1483448, -0.8814868, 3.515401, 1, 1, 1, 1, 1,
0.1500883, -0.1375544, 2.495468, 1, 1, 1, 1, 1,
0.1563828, 2.095409, -2.212175, 1, 1, 1, 1, 1,
0.1593432, 0.6438724, 0.1134927, 1, 1, 1, 1, 1,
0.1623108, -1.769375, 2.490198, 1, 1, 1, 1, 1,
0.1686099, -0.7428835, 2.344688, 1, 1, 1, 1, 1,
0.1705336, 0.2413387, 2.14677, 1, 1, 1, 1, 1,
0.1714138, -0.3463454, 3.019743, 1, 1, 1, 1, 1,
0.1746953, 0.06206293, 1.027656, 1, 1, 1, 1, 1,
0.1763679, -0.6360704, 3.458916, 0, 0, 1, 1, 1,
0.1794939, -1.869558, 2.649264, 1, 0, 0, 1, 1,
0.1800753, 0.1839035, -0.6572067, 1, 0, 0, 1, 1,
0.1817054, -0.3855413, 1.211855, 1, 0, 0, 1, 1,
0.1835479, 1.429461, 1.133621, 1, 0, 0, 1, 1,
0.1874372, -0.6665031, 2.326012, 1, 0, 0, 1, 1,
0.1875797, 1.110438, 1.241452, 0, 0, 0, 1, 1,
0.1889557, 0.5746095, 0.2109979, 0, 0, 0, 1, 1,
0.1902301, -0.2583069, 2.22572, 0, 0, 0, 1, 1,
0.1928592, -0.1877597, 2.30758, 0, 0, 0, 1, 1,
0.1959507, -0.6120715, 3.98058, 0, 0, 0, 1, 1,
0.196527, -1.009596, 3.735827, 0, 0, 0, 1, 1,
0.1989468, 0.1903518, -0.4269304, 0, 0, 0, 1, 1,
0.2024466, -0.5318054, 2.800157, 1, 1, 1, 1, 1,
0.2031895, 1.42395, -1.293948, 1, 1, 1, 1, 1,
0.2051716, 1.206391, 0.3134997, 1, 1, 1, 1, 1,
0.2070828, -0.4024656, 2.077756, 1, 1, 1, 1, 1,
0.2107507, -0.4256282, 4.26185, 1, 1, 1, 1, 1,
0.2144834, -1.604458, 4.044989, 1, 1, 1, 1, 1,
0.2254496, -0.873202, 1.76522, 1, 1, 1, 1, 1,
0.227641, 0.06892022, 1.251508, 1, 1, 1, 1, 1,
0.230642, 2.872519, 0.3610744, 1, 1, 1, 1, 1,
0.231182, -0.5255101, 2.548867, 1, 1, 1, 1, 1,
0.2341996, -1.027807, 3.005469, 1, 1, 1, 1, 1,
0.238464, -0.7762588, 2.825429, 1, 1, 1, 1, 1,
0.2452149, -0.2321705, 1.626013, 1, 1, 1, 1, 1,
0.245686, 0.2447107, 0.8664371, 1, 1, 1, 1, 1,
0.2527353, 1.080602, -1.204201, 1, 1, 1, 1, 1,
0.252955, 0.2921344, -0.685165, 0, 0, 1, 1, 1,
0.253609, -1.23442, 3.063234, 1, 0, 0, 1, 1,
0.2560465, -0.9573167, 1.672727, 1, 0, 0, 1, 1,
0.25758, 0.742431, 0.6905443, 1, 0, 0, 1, 1,
0.2576447, -0.2912324, 3.45434, 1, 0, 0, 1, 1,
0.2585817, 0.8435018, -0.1212938, 1, 0, 0, 1, 1,
0.260383, 0.5414797, 0.2003966, 0, 0, 0, 1, 1,
0.2662351, 1.399693, -2.016858, 0, 0, 0, 1, 1,
0.2687258, -0.4184471, 1.850595, 0, 0, 0, 1, 1,
0.2738323, 0.4900663, 0.4371492, 0, 0, 0, 1, 1,
0.2743311, 2.342854, -1.224199, 0, 0, 0, 1, 1,
0.281827, -1.126429, 2.906676, 0, 0, 0, 1, 1,
0.2819281, 1.410469, -1.017626, 0, 0, 0, 1, 1,
0.285407, 0.166551, 1.094005, 1, 1, 1, 1, 1,
0.2888466, -1.456589, 2.474947, 1, 1, 1, 1, 1,
0.2950197, -0.001646826, 2.596519, 1, 1, 1, 1, 1,
0.2955627, 3.087144, -0.7373805, 1, 1, 1, 1, 1,
0.2956494, -0.3117482, 3.283983, 1, 1, 1, 1, 1,
0.2977404, 0.05586579, 1.62435, 1, 1, 1, 1, 1,
0.3004516, -0.2526639, 1.620921, 1, 1, 1, 1, 1,
0.3012827, -0.7468702, 1.411837, 1, 1, 1, 1, 1,
0.3031622, -0.8220353, 2.697542, 1, 1, 1, 1, 1,
0.3035473, 1.966486, 0.1355691, 1, 1, 1, 1, 1,
0.3039907, -0.9080445, 2.74784, 1, 1, 1, 1, 1,
0.3042885, -0.7530435, 4.068433, 1, 1, 1, 1, 1,
0.3043698, -0.3851907, 1.694207, 1, 1, 1, 1, 1,
0.305572, 0.9275342, 0.1989749, 1, 1, 1, 1, 1,
0.308576, -0.1523759, 2.531219, 1, 1, 1, 1, 1,
0.3115267, 0.2128339, 1.718165, 0, 0, 1, 1, 1,
0.3128512, -0.2078465, 3.285537, 1, 0, 0, 1, 1,
0.3155757, 0.8578007, 0.01450119, 1, 0, 0, 1, 1,
0.3165473, -1.633709, 3.507318, 1, 0, 0, 1, 1,
0.3204221, -3.21544, 4.450826, 1, 0, 0, 1, 1,
0.3239604, 0.5903945, 1.506096, 1, 0, 0, 1, 1,
0.3240261, 0.3829677, 2.046589, 0, 0, 0, 1, 1,
0.3277252, -0.4820361, 0.5864341, 0, 0, 0, 1, 1,
0.3301196, -0.6605844, 1.315779, 0, 0, 0, 1, 1,
0.336602, -0.9884105, 5.036884, 0, 0, 0, 1, 1,
0.3374828, 1.567085, 0.217067, 0, 0, 0, 1, 1,
0.338282, 1.666713, 1.082344, 0, 0, 0, 1, 1,
0.3466433, -0.1251618, 2.118699, 0, 0, 0, 1, 1,
0.3550808, -1.540826, 2.834499, 1, 1, 1, 1, 1,
0.3587428, -0.8786816, 3.932464, 1, 1, 1, 1, 1,
0.3624236, 0.5131788, -0.7132231, 1, 1, 1, 1, 1,
0.3639088, -1.297611, 3.016717, 1, 1, 1, 1, 1,
0.3680809, -1.357603, 2.267238, 1, 1, 1, 1, 1,
0.3683588, 2.648822, -0.3164554, 1, 1, 1, 1, 1,
0.3687589, -0.5415826, 2.472765, 1, 1, 1, 1, 1,
0.3727404, 0.4549857, 2.414019, 1, 1, 1, 1, 1,
0.3780243, -0.490104, 2.69165, 1, 1, 1, 1, 1,
0.379799, 0.1207809, 0.06205069, 1, 1, 1, 1, 1,
0.382996, 0.741246, -1.956029, 1, 1, 1, 1, 1,
0.3852061, 0.5138912, 1.18335, 1, 1, 1, 1, 1,
0.3860834, 1.042046, -0.5122722, 1, 1, 1, 1, 1,
0.3861943, -0.4959863, 3.656536, 1, 1, 1, 1, 1,
0.3865302, 0.7714245, 0.4652286, 1, 1, 1, 1, 1,
0.3887508, 1.35085, 0.7204195, 0, 0, 1, 1, 1,
0.3894512, -1.144785, 1.74662, 1, 0, 0, 1, 1,
0.3936108, 0.05244973, -0.2222467, 1, 0, 0, 1, 1,
0.3955097, 0.1996821, 2.91119, 1, 0, 0, 1, 1,
0.3989639, 1.300931, 0.339992, 1, 0, 0, 1, 1,
0.4050779, 0.2787304, 0.6016206, 1, 0, 0, 1, 1,
0.4073402, -1.089261, 3.395146, 0, 0, 0, 1, 1,
0.4089947, -0.4491358, 3.62918, 0, 0, 0, 1, 1,
0.4108588, 0.1470833, 2.219926, 0, 0, 0, 1, 1,
0.412685, 0.05370709, 2.539348, 0, 0, 0, 1, 1,
0.4151064, 0.1292843, 3.652391, 0, 0, 0, 1, 1,
0.4201945, -1.202356, 3.714266, 0, 0, 0, 1, 1,
0.4296064, -0.2188357, 2.287607, 0, 0, 0, 1, 1,
0.4297781, 0.9053836, -0.7372234, 1, 1, 1, 1, 1,
0.4321564, -0.4619747, 2.584266, 1, 1, 1, 1, 1,
0.4380474, 0.9832675, -0.2481994, 1, 1, 1, 1, 1,
0.4382298, -0.1254569, 2.54529, 1, 1, 1, 1, 1,
0.4386142, -0.319199, 0.8745881, 1, 1, 1, 1, 1,
0.4394471, 0.3050661, 0.916068, 1, 1, 1, 1, 1,
0.4394489, -1.266139, 2.995439, 1, 1, 1, 1, 1,
0.4413825, 0.316747, 2.466133, 1, 1, 1, 1, 1,
0.4423751, 0.1379597, 0.7185421, 1, 1, 1, 1, 1,
0.4444778, -0.810664, 1.425848, 1, 1, 1, 1, 1,
0.4495175, -0.5797029, 4.58456, 1, 1, 1, 1, 1,
0.4516146, -0.7047238, 3.451205, 1, 1, 1, 1, 1,
0.4553394, -0.5042633, 3.014237, 1, 1, 1, 1, 1,
0.4595879, -0.4494873, 2.925756, 1, 1, 1, 1, 1,
0.4647171, -0.06084803, 0.1217187, 1, 1, 1, 1, 1,
0.4649035, 1.21169, 0.1618876, 0, 0, 1, 1, 1,
0.4673682, 0.5231351, 0.06286075, 1, 0, 0, 1, 1,
0.4696645, 0.4756086, 0.4473508, 1, 0, 0, 1, 1,
0.473765, 0.1271088, 3.38777, 1, 0, 0, 1, 1,
0.4739817, 0.9718173, -1.504473, 1, 0, 0, 1, 1,
0.4744839, 0.693118, 0.5948949, 1, 0, 0, 1, 1,
0.4782012, 1.223326, 0.2983911, 0, 0, 0, 1, 1,
0.4783962, 1.133762, -0.5182521, 0, 0, 0, 1, 1,
0.4788201, -2.28204, 2.789522, 0, 0, 0, 1, 1,
0.4789782, 0.4861409, 1.636137, 0, 0, 0, 1, 1,
0.4796278, -0.2976653, 1.605945, 0, 0, 0, 1, 1,
0.4809165, 0.7121987, 0.4356773, 0, 0, 0, 1, 1,
0.4821053, 0.006084722, 1.945347, 0, 0, 0, 1, 1,
0.4901856, 0.5376593, 1.105156, 1, 1, 1, 1, 1,
0.492361, 0.05824845, 2.892034, 1, 1, 1, 1, 1,
0.498693, -0.5116049, 0.9766456, 1, 1, 1, 1, 1,
0.4996214, -0.3014345, 2.510677, 1, 1, 1, 1, 1,
0.5007179, -0.5097798, 2.528231, 1, 1, 1, 1, 1,
0.5050683, 0.9549299, 0.715583, 1, 1, 1, 1, 1,
0.5069028, -0.3859842, 2.148365, 1, 1, 1, 1, 1,
0.5086938, -1.584231, 1.799332, 1, 1, 1, 1, 1,
0.508944, 0.5513015, 1.426744, 1, 1, 1, 1, 1,
0.5107083, -1.598718, 1.802975, 1, 1, 1, 1, 1,
0.524729, 0.7402408, 0.2068279, 1, 1, 1, 1, 1,
0.5283599, -0.4564417, 2.656131, 1, 1, 1, 1, 1,
0.5403913, 0.272052, 0.4634627, 1, 1, 1, 1, 1,
0.5424348, -1.113437, 2.678607, 1, 1, 1, 1, 1,
0.5457981, -1.637137, 2.36813, 1, 1, 1, 1, 1,
0.5459999, -0.5384513, 2.232604, 0, 0, 1, 1, 1,
0.5472388, 1.686035, 1.233572, 1, 0, 0, 1, 1,
0.5477017, 0.2645845, 0.627908, 1, 0, 0, 1, 1,
0.5482228, -1.010153, 3.906179, 1, 0, 0, 1, 1,
0.5484074, 0.6099534, -0.3450171, 1, 0, 0, 1, 1,
0.5507835, 1.873446, 1.5164, 1, 0, 0, 1, 1,
0.5512357, -1.536008, 1.004116, 0, 0, 0, 1, 1,
0.5539274, -1.138511, 2.973627, 0, 0, 0, 1, 1,
0.5539535, 2.35235, -2.385451, 0, 0, 0, 1, 1,
0.5556713, -0.3218349, 0.3480066, 0, 0, 0, 1, 1,
0.5567407, 0.7933226, 0.6998453, 0, 0, 0, 1, 1,
0.5572073, 0.1750956, 2.702806, 0, 0, 0, 1, 1,
0.5596353, -0.1190877, 2.702146, 0, 0, 0, 1, 1,
0.5635977, 0.5321193, 1.765777, 1, 1, 1, 1, 1,
0.5725388, 0.08833423, 1.216956, 1, 1, 1, 1, 1,
0.5861357, 0.4788263, 2.512732, 1, 1, 1, 1, 1,
0.5910196, 1.077804, 0.1562951, 1, 1, 1, 1, 1,
0.5910603, -1.856635, 3.339465, 1, 1, 1, 1, 1,
0.5916775, 0.4102093, 0.4332969, 1, 1, 1, 1, 1,
0.5954111, -0.4342179, 3.513883, 1, 1, 1, 1, 1,
0.5975413, -2.228075, 3.636128, 1, 1, 1, 1, 1,
0.5986974, 0.9524448, 0.1116465, 1, 1, 1, 1, 1,
0.6027632, 0.7257698, 1.701603, 1, 1, 1, 1, 1,
0.6067983, 1.055773, -0.7025337, 1, 1, 1, 1, 1,
0.6078246, 0.7449113, 3.131264, 1, 1, 1, 1, 1,
0.619902, 0.06125902, 0.4175994, 1, 1, 1, 1, 1,
0.6217865, -0.166783, 0.4559784, 1, 1, 1, 1, 1,
0.624319, 0.9948109, 1.756882, 1, 1, 1, 1, 1,
0.6290503, -2.350429, 3.813007, 0, 0, 1, 1, 1,
0.6311792, 0.07020936, 1.723984, 1, 0, 0, 1, 1,
0.6313304, -0.1270635, 2.827626, 1, 0, 0, 1, 1,
0.637953, 0.5731686, -0.06538896, 1, 0, 0, 1, 1,
0.6416883, 0.07416835, 1.658871, 1, 0, 0, 1, 1,
0.6452719, -1.920582, 2.354049, 1, 0, 0, 1, 1,
0.656183, 0.3059465, 1.931212, 0, 0, 0, 1, 1,
0.6563898, -0.2182409, 1.586533, 0, 0, 0, 1, 1,
0.6570172, 0.549378, 0.5415142, 0, 0, 0, 1, 1,
0.6618795, 0.2630723, 0.563526, 0, 0, 0, 1, 1,
0.6641044, -0.7432147, 1.295722, 0, 0, 0, 1, 1,
0.6663768, -0.5295246, 1.039286, 0, 0, 0, 1, 1,
0.6685438, -0.02743039, 1.159633, 0, 0, 0, 1, 1,
0.6709925, 0.6815996, 0.1402811, 1, 1, 1, 1, 1,
0.6727718, -1.682128, 3.138852, 1, 1, 1, 1, 1,
0.6738544, -0.4435286, 3.721755, 1, 1, 1, 1, 1,
0.6753659, -0.05315597, 2.753381, 1, 1, 1, 1, 1,
0.6828468, -0.2621625, 1.925074, 1, 1, 1, 1, 1,
0.6850821, 0.9132896, 1.077931, 1, 1, 1, 1, 1,
0.6876095, -0.6731188, 1.281847, 1, 1, 1, 1, 1,
0.6887846, -0.4381848, -0.1993551, 1, 1, 1, 1, 1,
0.689526, 0.8203807, 2.319135, 1, 1, 1, 1, 1,
0.694979, -0.3381405, 3.332123, 1, 1, 1, 1, 1,
0.6959221, -0.8055634, 2.487843, 1, 1, 1, 1, 1,
0.6972895, -2.124298, 1.163834, 1, 1, 1, 1, 1,
0.6988683, 0.4549114, 2.297888, 1, 1, 1, 1, 1,
0.7061343, -0.364217, 2.347042, 1, 1, 1, 1, 1,
0.7089036, 0.9066439, -0.8800942, 1, 1, 1, 1, 1,
0.7099999, -2.349484, 3.617912, 0, 0, 1, 1, 1,
0.7107617, 0.6035553, 0.39474, 1, 0, 0, 1, 1,
0.7135101, -0.4772067, 1.271527, 1, 0, 0, 1, 1,
0.7161459, 0.9472644, 0.6585777, 1, 0, 0, 1, 1,
0.7166396, -0.2796809, 1.964215, 1, 0, 0, 1, 1,
0.7172536, -2.757609, 3.417763, 1, 0, 0, 1, 1,
0.7236344, 1.679337, 0.5745844, 0, 0, 0, 1, 1,
0.7274173, -1.063717, 1.56331, 0, 0, 0, 1, 1,
0.7274646, 1.545978, -0.4115202, 0, 0, 0, 1, 1,
0.7328303, 0.9496769, -0.6913125, 0, 0, 0, 1, 1,
0.7339481, 0.748236, 0.5471672, 0, 0, 0, 1, 1,
0.7366593, -0.9606926, 4.159798, 0, 0, 0, 1, 1,
0.7384053, -1.642437, 1.330294, 0, 0, 0, 1, 1,
0.7512078, 0.3303716, 1.759985, 1, 1, 1, 1, 1,
0.7525274, -0.3887868, 2.562623, 1, 1, 1, 1, 1,
0.7537536, 0.003700006, 0.8647051, 1, 1, 1, 1, 1,
0.7597986, 0.6566995, 0.8495318, 1, 1, 1, 1, 1,
0.7607602, 0.1569437, 1.246043, 1, 1, 1, 1, 1,
0.7637761, -0.05928816, 0.3845023, 1, 1, 1, 1, 1,
0.7698246, 0.2477162, 2.416479, 1, 1, 1, 1, 1,
0.7736539, -1.01761, 1.160561, 1, 1, 1, 1, 1,
0.7745628, -1.618798, 2.659382, 1, 1, 1, 1, 1,
0.7796997, 0.4636458, 3.078995, 1, 1, 1, 1, 1,
0.7812533, -1.026976, 1.66964, 1, 1, 1, 1, 1,
0.7834442, -1.058382, 3.222314, 1, 1, 1, 1, 1,
0.7849089, -1.754913, 2.161331, 1, 1, 1, 1, 1,
0.7934956, -0.04501511, 2.43667, 1, 1, 1, 1, 1,
0.8010929, -0.8303105, 2.036136, 1, 1, 1, 1, 1,
0.804066, -1.738026, 3.044862, 0, 0, 1, 1, 1,
0.8042848, -0.2542926, 2.679317, 1, 0, 0, 1, 1,
0.8050311, 1.349138, -0.821279, 1, 0, 0, 1, 1,
0.8087366, 0.3014604, 1.072407, 1, 0, 0, 1, 1,
0.8112965, -0.5897464, 0.957935, 1, 0, 0, 1, 1,
0.8119291, 1.680626, 2.135037, 1, 0, 0, 1, 1,
0.8128836, -0.2656434, 2.69346, 0, 0, 0, 1, 1,
0.8136256, 0.3369581, 1.654796, 0, 0, 0, 1, 1,
0.815109, -0.2514509, 2.469387, 0, 0, 0, 1, 1,
0.8177589, -0.3889766, 2.809198, 0, 0, 0, 1, 1,
0.8188654, -0.6920404, 2.109705, 0, 0, 0, 1, 1,
0.8315337, 0.1733388, 0.4264281, 0, 0, 0, 1, 1,
0.8321907, -0.8370193, 1.938665, 0, 0, 0, 1, 1,
0.8333507, -1.246619, 1.215746, 1, 1, 1, 1, 1,
0.8385832, 0.09427819, 0.9462566, 1, 1, 1, 1, 1,
0.8414357, -1.889189, 4.959207, 1, 1, 1, 1, 1,
0.851903, 0.6663284, -0.004236716, 1, 1, 1, 1, 1,
0.8570495, 1.478059, 0.09041478, 1, 1, 1, 1, 1,
0.8620926, 1.301193, 2.662996, 1, 1, 1, 1, 1,
0.8644736, -0.2587943, 0.9395353, 1, 1, 1, 1, 1,
0.8676544, -0.2010499, 1.010468, 1, 1, 1, 1, 1,
0.8693876, 0.8879288, -0.2702501, 1, 1, 1, 1, 1,
0.8703241, -0.7241852, 3.814699, 1, 1, 1, 1, 1,
0.8747554, 0.739118, 0.4035799, 1, 1, 1, 1, 1,
0.879949, -0.6154855, 1.652806, 1, 1, 1, 1, 1,
0.8801203, -0.03979368, 2.935513, 1, 1, 1, 1, 1,
0.8801762, -1.838492, 1.257086, 1, 1, 1, 1, 1,
0.8842152, -1.045829, 3.806427, 1, 1, 1, 1, 1,
0.8866146, -1.734345, 4.328346, 0, 0, 1, 1, 1,
0.8919276, -0.005544358, 1.047581, 1, 0, 0, 1, 1,
0.8999949, -1.629279, 3.43277, 1, 0, 0, 1, 1,
0.9008247, 0.07986578, 3.473342, 1, 0, 0, 1, 1,
0.911881, -1.518032, 0.445544, 1, 0, 0, 1, 1,
0.9128344, 0.7502771, -0.02119633, 1, 0, 0, 1, 1,
0.9172032, -0.9286937, 2.368194, 0, 0, 0, 1, 1,
0.9205837, 0.2680152, 2.474887, 0, 0, 0, 1, 1,
0.9253531, 0.03336246, 0.9963216, 0, 0, 0, 1, 1,
0.9293771, 0.524902, 1.900381, 0, 0, 0, 1, 1,
0.9305353, -0.04034935, 2.585279, 0, 0, 0, 1, 1,
0.9312972, 0.8411512, 1.0676, 0, 0, 0, 1, 1,
0.9315896, -0.08902809, 1.566002, 0, 0, 0, 1, 1,
0.9357353, 0.6238434, 2.512038, 1, 1, 1, 1, 1,
0.947692, -0.6215954, 3.370127, 1, 1, 1, 1, 1,
0.9570173, -0.737273, 0.7000771, 1, 1, 1, 1, 1,
0.9591283, -0.4983636, 3.398384, 1, 1, 1, 1, 1,
0.9616445, -0.2359417, 2.162445, 1, 1, 1, 1, 1,
0.96218, 0.4080714, 0.2791215, 1, 1, 1, 1, 1,
0.9624806, -0.3693832, 2.964746, 1, 1, 1, 1, 1,
0.9632685, 0.1872175, 1.722097, 1, 1, 1, 1, 1,
0.9682127, 0.5010059, 0.7923294, 1, 1, 1, 1, 1,
0.9685044, -0.6115789, 3.114721, 1, 1, 1, 1, 1,
0.9706829, 0.4059395, 1.139519, 1, 1, 1, 1, 1,
0.9710519, 0.1367942, 0.1253971, 1, 1, 1, 1, 1,
0.9754809, 1.491406, -0.4209227, 1, 1, 1, 1, 1,
0.993371, 0.8458449, 0.8272564, 1, 1, 1, 1, 1,
0.9972214, 1.020588, 2.127521, 1, 1, 1, 1, 1,
0.9992597, 0.4187633, 0.9411882, 0, 0, 1, 1, 1,
1.010323, -1.312465, 4.344203, 1, 0, 0, 1, 1,
1.015225, 0.9137502, -0.2372492, 1, 0, 0, 1, 1,
1.017264, 0.2074248, 2.027681, 1, 0, 0, 1, 1,
1.018261, -0.3619691, 0.5711536, 1, 0, 0, 1, 1,
1.025516, 1.281785, 0.4426284, 1, 0, 0, 1, 1,
1.032318, -0.8418674, 3.50352, 0, 0, 0, 1, 1,
1.034051, -0.0977725, 2.231557, 0, 0, 0, 1, 1,
1.038683, -0.5634116, 1.385194, 0, 0, 0, 1, 1,
1.042882, -0.9559929, 2.173522, 0, 0, 0, 1, 1,
1.052539, 2.158934, 0.9575068, 0, 0, 0, 1, 1,
1.052773, -0.5215856, 2.225128, 0, 0, 0, 1, 1,
1.057725, -1.065307, 4.376071, 0, 0, 0, 1, 1,
1.06898, -1.086791, 2.938225, 1, 1, 1, 1, 1,
1.077524, 0.7681025, -0.580268, 1, 1, 1, 1, 1,
1.078613, -0.009266693, -0.5980489, 1, 1, 1, 1, 1,
1.079794, -0.4777416, 2.381711, 1, 1, 1, 1, 1,
1.08002, 0.7188559, 1.168258, 1, 1, 1, 1, 1,
1.081808, -0.7570407, 1.423593, 1, 1, 1, 1, 1,
1.086791, 1.234079, 1.955773, 1, 1, 1, 1, 1,
1.088599, -0.7324902, 3.338175, 1, 1, 1, 1, 1,
1.109546, 0.109853, 2.853791, 1, 1, 1, 1, 1,
1.10982, -0.2979966, 4.234493, 1, 1, 1, 1, 1,
1.1116, -0.541584, 0.4182371, 1, 1, 1, 1, 1,
1.115307, -2.658034, 1.704764, 1, 1, 1, 1, 1,
1.118786, -0.5825175, 1.905288, 1, 1, 1, 1, 1,
1.125375, -0.4000244, 1.92211, 1, 1, 1, 1, 1,
1.13919, 1.149475, 0.1062751, 1, 1, 1, 1, 1,
1.144144, 0.002492901, 2.169484, 0, 0, 1, 1, 1,
1.158361, -0.009461267, 0.8998206, 1, 0, 0, 1, 1,
1.158706, -0.7076026, 1.50118, 1, 0, 0, 1, 1,
1.161177, -0.32512, -0.6910145, 1, 0, 0, 1, 1,
1.177077, 1.46464, -1.692472, 1, 0, 0, 1, 1,
1.180585, 0.2385444, 1.388096, 1, 0, 0, 1, 1,
1.181974, -0.1592886, -0.2198125, 0, 0, 0, 1, 1,
1.187309, -0.3445003, 2.348121, 0, 0, 0, 1, 1,
1.202243, 0.2927771, 1.3358, 0, 0, 0, 1, 1,
1.20704, -0.8377905, 1.93102, 0, 0, 0, 1, 1,
1.21101, 0.6596001, 0.4437028, 0, 0, 0, 1, 1,
1.214029, 1.137756, 2.265677, 0, 0, 0, 1, 1,
1.214077, 0.05589028, 2.576381, 0, 0, 0, 1, 1,
1.219157, 1.78788, -0.7249171, 1, 1, 1, 1, 1,
1.222955, -0.3466657, 1.680343, 1, 1, 1, 1, 1,
1.224092, -1.244466, 2.108043, 1, 1, 1, 1, 1,
1.232626, -0.211188, 1.507915, 1, 1, 1, 1, 1,
1.24295, 0.8755223, -0.1948683, 1, 1, 1, 1, 1,
1.247601, -0.2970181, 0.7429262, 1, 1, 1, 1, 1,
1.262962, 0.7516456, 0.5680587, 1, 1, 1, 1, 1,
1.293642, 0.4472803, 2.518107, 1, 1, 1, 1, 1,
1.296656, 1.39087, 0.7931378, 1, 1, 1, 1, 1,
1.299659, -0.6469101, 4.689366, 1, 1, 1, 1, 1,
1.310612, -0.004310508, 1.999785, 1, 1, 1, 1, 1,
1.32241, 0.6508664, 2.53065, 1, 1, 1, 1, 1,
1.334384, 0.7258295, 2.123098, 1, 1, 1, 1, 1,
1.335125, -1.581235, 2.525799, 1, 1, 1, 1, 1,
1.337632, 0.6059508, 3.538918, 1, 1, 1, 1, 1,
1.350157, -0.7488653, 2.799158, 0, 0, 1, 1, 1,
1.351471, -0.9716204, 1.344108, 1, 0, 0, 1, 1,
1.35208, -0.08091789, 1.054312, 1, 0, 0, 1, 1,
1.358241, -1.401967, 1.091959, 1, 0, 0, 1, 1,
1.363085, 0.5615631, 0.5529804, 1, 0, 0, 1, 1,
1.374552, 0.8436862, 1.678823, 1, 0, 0, 1, 1,
1.382472, 1.667726, 3.663403, 0, 0, 0, 1, 1,
1.389836, 0.5260555, 1.922357, 0, 0, 0, 1, 1,
1.394611, 0.9647316, -0.3280725, 0, 0, 0, 1, 1,
1.403149, -0.9928501, 2.048876, 0, 0, 0, 1, 1,
1.403993, -1.30865, 2.903884, 0, 0, 0, 1, 1,
1.407065, 0.4968596, 0.1198505, 0, 0, 0, 1, 1,
1.41038, -1.460909, 3.786305, 0, 0, 0, 1, 1,
1.41114, -0.5052698, 1.253499, 1, 1, 1, 1, 1,
1.413334, 0.8639295, 1.642215, 1, 1, 1, 1, 1,
1.425613, -0.521529, 1.988572, 1, 1, 1, 1, 1,
1.428438, -0.1591485, 2.535434, 1, 1, 1, 1, 1,
1.43911, -0.910242, 2.91771, 1, 1, 1, 1, 1,
1.439707, -0.1965137, 0.8988929, 1, 1, 1, 1, 1,
1.441622, -0.4576941, 1.378084, 1, 1, 1, 1, 1,
1.442317, 1.77223, 1.055207, 1, 1, 1, 1, 1,
1.446376, -0.7559365, 0.5040298, 1, 1, 1, 1, 1,
1.448649, 1.674816, -0.3340586, 1, 1, 1, 1, 1,
1.456213, -0.3641421, 1.235965, 1, 1, 1, 1, 1,
1.457405, -1.379032, 1.694584, 1, 1, 1, 1, 1,
1.459444, -0.3990586, 1.026128, 1, 1, 1, 1, 1,
1.461701, 0.02845779, 2.876339, 1, 1, 1, 1, 1,
1.462469, -1.194753, 3.255538, 1, 1, 1, 1, 1,
1.465896, 0.8861576, 1.823798, 0, 0, 1, 1, 1,
1.481245, 0.2318703, 0.8458993, 1, 0, 0, 1, 1,
1.482711, -0.5608009, 2.097008, 1, 0, 0, 1, 1,
1.483794, 2.206702, 0.2574192, 1, 0, 0, 1, 1,
1.487941, 0.6063522, 1.959692, 1, 0, 0, 1, 1,
1.494918, -0.5360447, 3.008147, 1, 0, 0, 1, 1,
1.499988, 0.7006963, 0.9756162, 0, 0, 0, 1, 1,
1.500082, -0.08350198, 1.022892, 0, 0, 0, 1, 1,
1.505398, -2.383621, 1.710309, 0, 0, 0, 1, 1,
1.508975, 1.447262, 1.551205, 0, 0, 0, 1, 1,
1.521939, -0.5009962, 1.393345, 0, 0, 0, 1, 1,
1.523576, -0.9366216, 2.554936, 0, 0, 0, 1, 1,
1.526679, -0.3190088, 1.324202, 0, 0, 0, 1, 1,
1.53517, -0.3622653, 3.066658, 1, 1, 1, 1, 1,
1.542792, 0.5918046, 1.41837, 1, 1, 1, 1, 1,
1.54684, 0.1556478, 1.576984, 1, 1, 1, 1, 1,
1.563019, -2.437426, 3.481376, 1, 1, 1, 1, 1,
1.573135, 0.8692631, 1.259547, 1, 1, 1, 1, 1,
1.579372, -0.8985021, 1.270456, 1, 1, 1, 1, 1,
1.586705, -0.1021993, 3.521465, 1, 1, 1, 1, 1,
1.592147, -0.04208752, 1.519244, 1, 1, 1, 1, 1,
1.615825, -1.245695, 0.2495662, 1, 1, 1, 1, 1,
1.619898, 1.501697, 0.7136295, 1, 1, 1, 1, 1,
1.622088, 0.1677616, 1.433162, 1, 1, 1, 1, 1,
1.650922, 0.4282037, 0.7816211, 1, 1, 1, 1, 1,
1.670831, 0.3650658, 3.54276, 1, 1, 1, 1, 1,
1.675164, -0.3940599, 2.226376, 1, 1, 1, 1, 1,
1.681617, -0.5725358, -0.6188688, 1, 1, 1, 1, 1,
1.691524, 1.285208, -0.03038951, 0, 0, 1, 1, 1,
1.699422, 0.7120117, 1.443666, 1, 0, 0, 1, 1,
1.705885, 0.5128193, 1.934856, 1, 0, 0, 1, 1,
1.709777, 0.3323625, 2.139984, 1, 0, 0, 1, 1,
1.727215, 0.0132149, 2.030123, 1, 0, 0, 1, 1,
1.732244, -0.2373797, 1.795905, 1, 0, 0, 1, 1,
1.747007, -0.4576815, 3.15635, 0, 0, 0, 1, 1,
1.748876, 0.4123308, 1.92979, 0, 0, 0, 1, 1,
1.754495, -1.185853, 2.437292, 0, 0, 0, 1, 1,
1.767038, -1.42873, 1.352259, 0, 0, 0, 1, 1,
1.768554, 0.745487, 3.01048, 0, 0, 0, 1, 1,
1.769111, 0.3946453, 0.8563305, 0, 0, 0, 1, 1,
1.77201, 1.064564, 0.3414259, 0, 0, 0, 1, 1,
1.782344, -2.016103, 0.9214851, 1, 1, 1, 1, 1,
1.795887, -1.491432, 0.5298835, 1, 1, 1, 1, 1,
1.81003, 0.2578816, 2.29135, 1, 1, 1, 1, 1,
1.820413, 2.325155, 2.705228, 1, 1, 1, 1, 1,
1.824593, -0.2860083, 0.4912763, 1, 1, 1, 1, 1,
1.827848, 1.271125, 0.1659035, 1, 1, 1, 1, 1,
1.833894, -1.264353, 3.630925, 1, 1, 1, 1, 1,
1.839251, 0.7029439, 1.797805, 1, 1, 1, 1, 1,
1.853534, 1.13624, 2.129897, 1, 1, 1, 1, 1,
1.856101, -0.3115835, 0.9139851, 1, 1, 1, 1, 1,
1.87093, -0.7921729, 1.683643, 1, 1, 1, 1, 1,
1.895848, -0.1342301, 1.267035, 1, 1, 1, 1, 1,
1.918873, 2.455746, 2.218354, 1, 1, 1, 1, 1,
1.92023, -0.6641862, 2.925117, 1, 1, 1, 1, 1,
1.924133, -1.129436, 2.535862, 1, 1, 1, 1, 1,
1.929203, -1.307363, 1.867747, 0, 0, 1, 1, 1,
1.958403, 0.3548576, 1.215854, 1, 0, 0, 1, 1,
1.976287, 0.1734768, 0.9096738, 1, 0, 0, 1, 1,
1.980837, -0.516907, 4.200995, 1, 0, 0, 1, 1,
2.0151, 1.220275, 0.2392822, 1, 0, 0, 1, 1,
2.034675, -0.4725908, 3.278973, 1, 0, 0, 1, 1,
2.068781, 2.655246, 1.006733, 0, 0, 0, 1, 1,
2.09062, -0.2564909, 0.6800672, 0, 0, 0, 1, 1,
2.119086, -0.04215952, 1.211861, 0, 0, 0, 1, 1,
2.168479, -1.357587, 4.125171, 0, 0, 0, 1, 1,
2.187409, -1.285245, 2.430892, 0, 0, 0, 1, 1,
2.20961, -0.4084457, 2.128027, 0, 0, 0, 1, 1,
2.334578, -0.5333126, 1.217406, 0, 0, 0, 1, 1,
2.395023, -1.124201, 2.550879, 1, 1, 1, 1, 1,
2.43228, -0.547752, 1.726318, 1, 1, 1, 1, 1,
2.470069, 0.3523702, 2.487682, 1, 1, 1, 1, 1,
2.511233, -1.239752, 1.071129, 1, 1, 1, 1, 1,
2.664315, 0.4483041, 2.528267, 1, 1, 1, 1, 1,
2.85482, 0.4610294, 0.8930648, 1, 1, 1, 1, 1,
2.961539, -0.350835, 2.292301, 1, 1, 1, 1, 1
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
var radius = 9.314563;
var distance = 32.71701;
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
mvMatrix.translate( 0.2735666, 0.3146145, -0.1724336 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.71701);
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
