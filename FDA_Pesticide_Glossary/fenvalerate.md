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
-3.410862, -1.628948, -2.494107, 1, 0, 0, 1,
-2.753182, -0.2644191, -1.115131, 1, 0.007843138, 0, 1,
-2.723289, 0.8659602, -1.7385, 1, 0.01176471, 0, 1,
-2.714276, -1.445965, -0.08097894, 1, 0.01960784, 0, 1,
-2.699372, -2.375274, -1.215988, 1, 0.02352941, 0, 1,
-2.697531, -2.358604, -2.848017, 1, 0.03137255, 0, 1,
-2.630579, 0.933719, -0.160275, 1, 0.03529412, 0, 1,
-2.595498, -0.1975073, -3.449558, 1, 0.04313726, 0, 1,
-2.522784, -0.9812762, -2.410726, 1, 0.04705882, 0, 1,
-2.502522, -1.178375, -0.4766593, 1, 0.05490196, 0, 1,
-2.376335, 1.003032, -2.027306, 1, 0.05882353, 0, 1,
-2.368687, -1.866545, -1.619933, 1, 0.06666667, 0, 1,
-2.348311, 1.097807, -0.2395232, 1, 0.07058824, 0, 1,
-2.299275, 2.313986, -1.301306, 1, 0.07843138, 0, 1,
-2.266089, 0.1909707, -0.9411653, 1, 0.08235294, 0, 1,
-2.251165, -0.5693676, 0.1958918, 1, 0.09019608, 0, 1,
-2.236845, 0.8869349, -0.7078544, 1, 0.09411765, 0, 1,
-2.235823, 2.213404, -1.361978, 1, 0.1019608, 0, 1,
-2.229056, -1.641626, -2.462732, 1, 0.1098039, 0, 1,
-2.227273, 0.9069148, -1.374825, 1, 0.1137255, 0, 1,
-2.16146, -0.7344836, -4.008584, 1, 0.1215686, 0, 1,
-2.150503, -0.3566875, -2.093414, 1, 0.1254902, 0, 1,
-2.097225, 0.1876531, -0.4598439, 1, 0.1333333, 0, 1,
-2.040826, -2.544325, -2.735634, 1, 0.1372549, 0, 1,
-2.02281, 0.6182799, 0.3437741, 1, 0.145098, 0, 1,
-2.015182, -0.2263369, -2.313215, 1, 0.1490196, 0, 1,
-1.993731, 0.3900175, -1.263253, 1, 0.1568628, 0, 1,
-1.987033, 0.1159045, -2.253501, 1, 0.1607843, 0, 1,
-1.943213, 0.4642006, -1.306224, 1, 0.1686275, 0, 1,
-1.911, 1.129897, -0.7425525, 1, 0.172549, 0, 1,
-1.880989, 1.515572, 0.2950707, 1, 0.1803922, 0, 1,
-1.867828, -0.3550218, -1.628583, 1, 0.1843137, 0, 1,
-1.856004, -0.1152874, -0.7984725, 1, 0.1921569, 0, 1,
-1.826538, -0.8072706, 0.3175331, 1, 0.1960784, 0, 1,
-1.823628, -1.107989, -1.760088, 1, 0.2039216, 0, 1,
-1.819552, -0.2298993, -3.385839, 1, 0.2117647, 0, 1,
-1.817799, -0.07972308, -0.3613441, 1, 0.2156863, 0, 1,
-1.805598, -0.5640579, 0.7651992, 1, 0.2235294, 0, 1,
-1.802208, -0.9900242, -2.40438, 1, 0.227451, 0, 1,
-1.791101, 0.6762893, -1.761496, 1, 0.2352941, 0, 1,
-1.787512, -0.4703288, -0.8895249, 1, 0.2392157, 0, 1,
-1.761094, 0.9369045, -1.387601, 1, 0.2470588, 0, 1,
-1.760807, -0.9081448, -3.707864, 1, 0.2509804, 0, 1,
-1.741883, -0.3964452, -2.947854, 1, 0.2588235, 0, 1,
-1.741388, -0.6391375, -0.5069528, 1, 0.2627451, 0, 1,
-1.729704, 0.2455131, -0.9571778, 1, 0.2705882, 0, 1,
-1.715676, 1.065227, -0.7163689, 1, 0.2745098, 0, 1,
-1.710645, -1.295801, -1.653564, 1, 0.282353, 0, 1,
-1.6817, -0.8362991, -3.178377, 1, 0.2862745, 0, 1,
-1.661544, -0.01552342, -2.957505, 1, 0.2941177, 0, 1,
-1.655205, 0.2226362, -1.054912, 1, 0.3019608, 0, 1,
-1.653149, 1.188015, -0.9794099, 1, 0.3058824, 0, 1,
-1.646257, -0.8014321, -4.275629, 1, 0.3137255, 0, 1,
-1.636707, 1.439633, 0.5859582, 1, 0.3176471, 0, 1,
-1.635618, -0.1384742, -2.600516, 1, 0.3254902, 0, 1,
-1.627969, 0.5215454, -2.617878, 1, 0.3294118, 0, 1,
-1.625696, -0.4342379, -1.11595, 1, 0.3372549, 0, 1,
-1.623642, 1.170011, -2.330029, 1, 0.3411765, 0, 1,
-1.619628, -0.523342, -2.433968, 1, 0.3490196, 0, 1,
-1.617949, -0.8305297, -2.482213, 1, 0.3529412, 0, 1,
-1.615098, 0.4615422, -0.9998267, 1, 0.3607843, 0, 1,
-1.604249, 0.1841019, -1.741679, 1, 0.3647059, 0, 1,
-1.581896, 0.6665082, -0.7606892, 1, 0.372549, 0, 1,
-1.572459, 0.04010475, -1.828147, 1, 0.3764706, 0, 1,
-1.561166, 0.8896753, -1.401827, 1, 0.3843137, 0, 1,
-1.538753, -0.4586653, -1.831918, 1, 0.3882353, 0, 1,
-1.525454, 0.6108302, 0.01057719, 1, 0.3960784, 0, 1,
-1.512295, -1.169232, -3.168486, 1, 0.4039216, 0, 1,
-1.497541, 0.5513262, -2.172688, 1, 0.4078431, 0, 1,
-1.482129, 1.876724, -0.841272, 1, 0.4156863, 0, 1,
-1.46738, 0.2362469, -2.404924, 1, 0.4196078, 0, 1,
-1.434529, 2.988148, -1.415059, 1, 0.427451, 0, 1,
-1.430402, 0.3451133, -0.02060579, 1, 0.4313726, 0, 1,
-1.425117, -1.005493, -2.175722, 1, 0.4392157, 0, 1,
-1.42287, 0.4934559, -1.554345, 1, 0.4431373, 0, 1,
-1.42242, 0.2086344, -1.648042, 1, 0.4509804, 0, 1,
-1.415935, -1.151205, -1.015444, 1, 0.454902, 0, 1,
-1.407555, 0.5945318, -1.139281, 1, 0.4627451, 0, 1,
-1.400435, 0.05881683, -0.6441768, 1, 0.4666667, 0, 1,
-1.391136, 0.840985, -1.980239, 1, 0.4745098, 0, 1,
-1.390647, -0.2914197, -2.454651, 1, 0.4784314, 0, 1,
-1.384692, 1.576395, -0.4871166, 1, 0.4862745, 0, 1,
-1.384537, -1.362046, -3.544509, 1, 0.4901961, 0, 1,
-1.358019, 0.7163812, -0.7861391, 1, 0.4980392, 0, 1,
-1.357852, 2.04283, -3.38985, 1, 0.5058824, 0, 1,
-1.357514, 0.4872386, -1.175379, 1, 0.509804, 0, 1,
-1.349577, 0.7120723, -1.024564, 1, 0.5176471, 0, 1,
-1.347344, 0.8530291, -2.321956, 1, 0.5215687, 0, 1,
-1.345801, -1.019865, -1.057833, 1, 0.5294118, 0, 1,
-1.34041, -1.361392, -1.291297, 1, 0.5333334, 0, 1,
-1.328705, 0.01093884, -1.780784, 1, 0.5411765, 0, 1,
-1.320421, 0.05427154, -2.380601, 1, 0.5450981, 0, 1,
-1.313951, 0.7656679, -0.9823522, 1, 0.5529412, 0, 1,
-1.307883, -0.4960369, -2.163519, 1, 0.5568628, 0, 1,
-1.298415, -1.157429, -1.915812, 1, 0.5647059, 0, 1,
-1.285049, -0.2728155, -1.845424, 1, 0.5686275, 0, 1,
-1.282, 0.5506806, -1.748214, 1, 0.5764706, 0, 1,
-1.276293, 2.206931, -0.6787469, 1, 0.5803922, 0, 1,
-1.27338, -0.4202017, -2.894186, 1, 0.5882353, 0, 1,
-1.27308, 3.250638, -0.5790755, 1, 0.5921569, 0, 1,
-1.268843, -0.3585025, -2.352903, 1, 0.6, 0, 1,
-1.268796, 2.262328, -0.7220479, 1, 0.6078432, 0, 1,
-1.268093, 0.03367963, -1.86943, 1, 0.6117647, 0, 1,
-1.263869, 0.8944886, 1.128729, 1, 0.6196079, 0, 1,
-1.263864, 0.05093812, -1.811894, 1, 0.6235294, 0, 1,
-1.257998, 0.4045152, -0.202501, 1, 0.6313726, 0, 1,
-1.25435, 0.1765647, -0.2409699, 1, 0.6352941, 0, 1,
-1.241211, -0.4220004, -1.965619, 1, 0.6431373, 0, 1,
-1.240298, -1.8055, -3.804039, 1, 0.6470588, 0, 1,
-1.239316, -1.912662, -4.871311, 1, 0.654902, 0, 1,
-1.231099, -1.069917, -3.093887, 1, 0.6588235, 0, 1,
-1.198198, -1.321244, -2.353168, 1, 0.6666667, 0, 1,
-1.196697, -0.2047484, -2.206357, 1, 0.6705883, 0, 1,
-1.194027, 0.5922149, -0.8005937, 1, 0.6784314, 0, 1,
-1.192032, 1.174688, -0.07509819, 1, 0.682353, 0, 1,
-1.188857, -0.6119542, -0.9523364, 1, 0.6901961, 0, 1,
-1.183416, -1.473833, -3.540993, 1, 0.6941177, 0, 1,
-1.161698, -0.440717, -0.4516369, 1, 0.7019608, 0, 1,
-1.152679, -1.138712, -3.808955, 1, 0.7098039, 0, 1,
-1.144005, 1.014959, -0.3836273, 1, 0.7137255, 0, 1,
-1.138607, 0.1899188, -1.750641, 1, 0.7215686, 0, 1,
-1.13281, 0.2719096, -1.410688, 1, 0.7254902, 0, 1,
-1.132767, 0.6231571, -0.9972799, 1, 0.7333333, 0, 1,
-1.131834, 0.6576065, -1.640759, 1, 0.7372549, 0, 1,
-1.121433, -1.477267, -3.100785, 1, 0.7450981, 0, 1,
-1.116297, 0.6092758, -1.205977, 1, 0.7490196, 0, 1,
-1.11127, -0.8786805, -2.808797, 1, 0.7568628, 0, 1,
-1.108365, 1.225121, 0.6243915, 1, 0.7607843, 0, 1,
-1.108355, 0.1910906, -1.645263, 1, 0.7686275, 0, 1,
-1.106292, -0.328857, -0.9355311, 1, 0.772549, 0, 1,
-1.104174, -2.553416, -2.577474, 1, 0.7803922, 0, 1,
-1.101004, 1.544473, -2.800987, 1, 0.7843137, 0, 1,
-1.093673, 1.402197, -0.3358854, 1, 0.7921569, 0, 1,
-1.091337, -0.07182088, -1.3963, 1, 0.7960784, 0, 1,
-1.079845, 1.772311, -1.382492, 1, 0.8039216, 0, 1,
-1.078232, -0.7054937, -2.408789, 1, 0.8117647, 0, 1,
-1.077453, 0.2246403, -3.940483, 1, 0.8156863, 0, 1,
-1.073265, 0.0555877, -2.395411, 1, 0.8235294, 0, 1,
-1.071717, -0.8333652, -2.824009, 1, 0.827451, 0, 1,
-1.06894, -1.254599, -2.851281, 1, 0.8352941, 0, 1,
-1.06715, 1.12457, 0.8851198, 1, 0.8392157, 0, 1,
-1.067007, -0.3668928, -1.937205, 1, 0.8470588, 0, 1,
-1.053888, -0.1134701, -1.911679, 1, 0.8509804, 0, 1,
-1.044745, 0.1420157, -0.4277223, 1, 0.8588235, 0, 1,
-1.041868, 0.3707935, -0.05658833, 1, 0.8627451, 0, 1,
-1.04031, -0.8949295, -1.542633, 1, 0.8705882, 0, 1,
-1.037533, -0.4903314, -2.391764, 1, 0.8745098, 0, 1,
-1.037058, 1.149343, -0.8129103, 1, 0.8823529, 0, 1,
-1.035441, 0.8053852, 0.1221737, 1, 0.8862745, 0, 1,
-1.032917, -0.4253844, -1.269903, 1, 0.8941177, 0, 1,
-1.029063, -0.2342386, -1.953956, 1, 0.8980392, 0, 1,
-1.026152, 2.193545, 0.6143683, 1, 0.9058824, 0, 1,
-1.024279, 0.319335, 0.02170357, 1, 0.9137255, 0, 1,
-1.022527, 1.176243, -1.16555, 1, 0.9176471, 0, 1,
-1.01335, 1.35702, -0.06426005, 1, 0.9254902, 0, 1,
-1.010828, 0.6061814, -3.760679, 1, 0.9294118, 0, 1,
-1.009893, 0.4277935, -0.4013016, 1, 0.9372549, 0, 1,
-1.009559, 0.9910485, -0.7989677, 1, 0.9411765, 0, 1,
-1.009465, 1.077909, -1.373285, 1, 0.9490196, 0, 1,
-1.006559, -0.06429554, -2.644032, 1, 0.9529412, 0, 1,
-1.00565, -0.9545701, -3.511836, 1, 0.9607843, 0, 1,
-1.000046, 1.074751, -1.091581, 1, 0.9647059, 0, 1,
-0.999651, -0.9674438, -3.456214, 1, 0.972549, 0, 1,
-0.9988084, 0.009383262, -1.782875, 1, 0.9764706, 0, 1,
-0.9962536, 1.497, 0.535348, 1, 0.9843137, 0, 1,
-0.9935328, -1.665628, -3.839852, 1, 0.9882353, 0, 1,
-0.9895157, 0.2604983, -1.336007, 1, 0.9960784, 0, 1,
-0.9879356, 0.01413484, -2.028497, 0.9960784, 1, 0, 1,
-0.9834176, -0.5935673, -2.522913, 0.9921569, 1, 0, 1,
-0.9811709, 1.8122, 0.3304904, 0.9843137, 1, 0, 1,
-0.9780472, 2.117745, -0.2651266, 0.9803922, 1, 0, 1,
-0.9777308, 0.4102419, -2.16275, 0.972549, 1, 0, 1,
-0.9750118, -2.839442, -0.8699315, 0.9686275, 1, 0, 1,
-0.9726576, -1.190871, -2.83794, 0.9607843, 1, 0, 1,
-0.9726514, 0.001450664, -1.566467, 0.9568627, 1, 0, 1,
-0.9512281, 0.7765754, -3.313042, 0.9490196, 1, 0, 1,
-0.9510099, -0.6112369, -4.18959, 0.945098, 1, 0, 1,
-0.9498605, 1.654171, -1.022176, 0.9372549, 1, 0, 1,
-0.9447162, 1.359265, -0.945277, 0.9333333, 1, 0, 1,
-0.9446782, 2.057518, 0.5015284, 0.9254902, 1, 0, 1,
-0.9403294, -0.4712374, -0.5859006, 0.9215686, 1, 0, 1,
-0.9380904, 2.304471, -3.396199, 0.9137255, 1, 0, 1,
-0.9324887, 2.423037, -0.0801983, 0.9098039, 1, 0, 1,
-0.9316521, 0.7446809, -0.6279244, 0.9019608, 1, 0, 1,
-0.9204012, 0.2877841, -1.821971, 0.8941177, 1, 0, 1,
-0.9200103, 2.485654, 0.876242, 0.8901961, 1, 0, 1,
-0.9196633, -0.5922714, -3.376864, 0.8823529, 1, 0, 1,
-0.91726, 0.4514222, -1.277072, 0.8784314, 1, 0, 1,
-0.9152266, 1.456342, -2.240824, 0.8705882, 1, 0, 1,
-0.9092351, 0.9410702, 0.3807136, 0.8666667, 1, 0, 1,
-0.9068674, 2.836562, -1.070715, 0.8588235, 1, 0, 1,
-0.9057332, -1.801618, -3.608971, 0.854902, 1, 0, 1,
-0.8918149, 1.836006, 0.5685546, 0.8470588, 1, 0, 1,
-0.8881845, -2.227404, -1.454946, 0.8431373, 1, 0, 1,
-0.8770652, 0.1048636, -1.477755, 0.8352941, 1, 0, 1,
-0.8618197, -0.284022, -0.9679407, 0.8313726, 1, 0, 1,
-0.8611479, -1.927371, -2.818786, 0.8235294, 1, 0, 1,
-0.8608667, -0.696965, -1.932158, 0.8196079, 1, 0, 1,
-0.8560094, -1.267508, -3.10047, 0.8117647, 1, 0, 1,
-0.8538625, -1.104935, -3.192101, 0.8078431, 1, 0, 1,
-0.8536929, 0.4984834, -3.087574, 0.8, 1, 0, 1,
-0.8435157, 1.448722, -2.66179, 0.7921569, 1, 0, 1,
-0.8412918, 1.272778, -0.1022764, 0.7882353, 1, 0, 1,
-0.8347239, 0.4380316, -0.9208456, 0.7803922, 1, 0, 1,
-0.8339681, 2.172532, -0.524159, 0.7764706, 1, 0, 1,
-0.8323951, -0.8428487, -1.188453, 0.7686275, 1, 0, 1,
-0.8266845, 0.5548648, -0.7075725, 0.7647059, 1, 0, 1,
-0.8181486, 0.09147172, -2.430965, 0.7568628, 1, 0, 1,
-0.8170435, -0.6166341, -2.146927, 0.7529412, 1, 0, 1,
-0.8106491, 0.1732643, -1.489569, 0.7450981, 1, 0, 1,
-0.8102271, -1.245598, -4.723816, 0.7411765, 1, 0, 1,
-0.8099321, -1.838687, -2.707187, 0.7333333, 1, 0, 1,
-0.8077494, -1.033347, -3.777347, 0.7294118, 1, 0, 1,
-0.797924, -0.50547, -2.538327, 0.7215686, 1, 0, 1,
-0.7940229, -0.3973528, -2.410956, 0.7176471, 1, 0, 1,
-0.7897826, 1.516646, -0.04467852, 0.7098039, 1, 0, 1,
-0.7814018, 0.01144174, -1.997993, 0.7058824, 1, 0, 1,
-0.7808866, -1.275953, -2.019403, 0.6980392, 1, 0, 1,
-0.7736346, 0.04115044, -1.392715, 0.6901961, 1, 0, 1,
-0.7708957, 1.017079, 0.247788, 0.6862745, 1, 0, 1,
-0.7661048, -0.8658903, -3.103438, 0.6784314, 1, 0, 1,
-0.7656993, -0.577659, -1.620382, 0.6745098, 1, 0, 1,
-0.7611777, 0.5067894, -0.4968097, 0.6666667, 1, 0, 1,
-0.7611725, -0.09137871, -2.948652, 0.6627451, 1, 0, 1,
-0.7606183, -0.1356864, -2.570174, 0.654902, 1, 0, 1,
-0.7518632, -0.3447417, -1.833476, 0.6509804, 1, 0, 1,
-0.7469645, -0.1256223, -0.7883243, 0.6431373, 1, 0, 1,
-0.7463363, 0.499386, -1.520869, 0.6392157, 1, 0, 1,
-0.7421501, -1.413176, -1.886287, 0.6313726, 1, 0, 1,
-0.7353979, -0.01733383, -0.6200169, 0.627451, 1, 0, 1,
-0.7330254, -0.7418647, -1.656155, 0.6196079, 1, 0, 1,
-0.7283493, 1.86213, 0.4370816, 0.6156863, 1, 0, 1,
-0.7274556, 1.147724, 0.6258375, 0.6078432, 1, 0, 1,
-0.7200661, 0.04812787, -1.817914, 0.6039216, 1, 0, 1,
-0.7172834, -0.7458794, -2.000793, 0.5960785, 1, 0, 1,
-0.7169194, 1.702644, -2.122475, 0.5882353, 1, 0, 1,
-0.7167048, -0.2834157, -0.4405408, 0.5843138, 1, 0, 1,
-0.7152078, -1.716943, -2.666174, 0.5764706, 1, 0, 1,
-0.7119961, -0.5802263, -2.977125, 0.572549, 1, 0, 1,
-0.7107106, 0.4765399, 0.255479, 0.5647059, 1, 0, 1,
-0.7036816, 0.9777594, -0.8454785, 0.5607843, 1, 0, 1,
-0.7035976, -0.3092901, -1.253163, 0.5529412, 1, 0, 1,
-0.7011585, 0.6770887, 1.54982, 0.5490196, 1, 0, 1,
-0.6997878, -1.361731, -2.468801, 0.5411765, 1, 0, 1,
-0.6981812, -0.9619194, -0.6161327, 0.5372549, 1, 0, 1,
-0.6943834, -0.5217643, -1.388502, 0.5294118, 1, 0, 1,
-0.6925519, 1.39759, 0.1410153, 0.5254902, 1, 0, 1,
-0.6899385, -0.6223197, -2.190248, 0.5176471, 1, 0, 1,
-0.6888359, -0.6226389, -2.725278, 0.5137255, 1, 0, 1,
-0.6881386, 0.8558817, -0.6758728, 0.5058824, 1, 0, 1,
-0.685304, -0.5910141, -1.896881, 0.5019608, 1, 0, 1,
-0.6802356, 0.4916503, -2.76608, 0.4941176, 1, 0, 1,
-0.6760762, 1.474234, 0.6349461, 0.4862745, 1, 0, 1,
-0.6625749, -0.7214284, -4.186428, 0.4823529, 1, 0, 1,
-0.6616403, -0.530896, -1.405575, 0.4745098, 1, 0, 1,
-0.6567335, 0.8972272, -0.04230065, 0.4705882, 1, 0, 1,
-0.6559753, 0.3805924, 1.30601, 0.4627451, 1, 0, 1,
-0.6548146, -0.5294486, -2.381351, 0.4588235, 1, 0, 1,
-0.6513523, -1.324214, -3.14973, 0.4509804, 1, 0, 1,
-0.6501544, -0.2787182, -2.173762, 0.4470588, 1, 0, 1,
-0.6437246, 1.923915, 0.2057668, 0.4392157, 1, 0, 1,
-0.6401155, 1.916297, 0.9527653, 0.4352941, 1, 0, 1,
-0.6301745, 2.216551, -0.4816019, 0.427451, 1, 0, 1,
-0.6298193, -0.4374179, -2.159694, 0.4235294, 1, 0, 1,
-0.6292303, 0.3509972, -0.5667623, 0.4156863, 1, 0, 1,
-0.6249259, 1.363031, -0.5415403, 0.4117647, 1, 0, 1,
-0.6211597, 0.3168465, -1.966165, 0.4039216, 1, 0, 1,
-0.6135479, -1.108949, -0.7408026, 0.3960784, 1, 0, 1,
-0.6118389, -0.6608912, -2.872414, 0.3921569, 1, 0, 1,
-0.6105152, 0.6202734, -0.8123261, 0.3843137, 1, 0, 1,
-0.6090465, 0.988447, -2.082959, 0.3803922, 1, 0, 1,
-0.6076827, -0.7961729, -5.110501, 0.372549, 1, 0, 1,
-0.6051859, 1.93388, -0.7814013, 0.3686275, 1, 0, 1,
-0.6050553, 0.02638996, 0.2337709, 0.3607843, 1, 0, 1,
-0.6048191, -0.7562616, -2.577642, 0.3568628, 1, 0, 1,
-0.6027513, 1.558226, 0.135467, 0.3490196, 1, 0, 1,
-0.6019769, -0.5263037, -2.653814, 0.345098, 1, 0, 1,
-0.6015096, -0.6781073, -3.25703, 0.3372549, 1, 0, 1,
-0.590849, 1.071362, -0.004454325, 0.3333333, 1, 0, 1,
-0.5805267, -0.5416583, -3.538917, 0.3254902, 1, 0, 1,
-0.5797123, 0.7723547, 0.8807396, 0.3215686, 1, 0, 1,
-0.5712216, 0.1067228, -2.344263, 0.3137255, 1, 0, 1,
-0.5704128, 0.4786648, -1.607141, 0.3098039, 1, 0, 1,
-0.5680169, 0.1596873, -1.586218, 0.3019608, 1, 0, 1,
-0.5660707, 0.5790375, -0.09296066, 0.2941177, 1, 0, 1,
-0.564276, -0.5651006, -3.485456, 0.2901961, 1, 0, 1,
-0.56398, -0.3846067, -1.509627, 0.282353, 1, 0, 1,
-0.5633201, 0.5477668, 0.5278879, 0.2784314, 1, 0, 1,
-0.5629812, -0.5292428, -2.8318, 0.2705882, 1, 0, 1,
-0.5622932, -0.8937936, -2.545969, 0.2666667, 1, 0, 1,
-0.5598341, -0.4805286, -2.795626, 0.2588235, 1, 0, 1,
-0.5558149, 0.9398576, -1.406999, 0.254902, 1, 0, 1,
-0.5527329, 1.007299, 1.167673, 0.2470588, 1, 0, 1,
-0.552227, -0.2880393, -1.470584, 0.2431373, 1, 0, 1,
-0.5506139, -0.4006783, -3.540835, 0.2352941, 1, 0, 1,
-0.5505149, 0.6593342, -2.888493, 0.2313726, 1, 0, 1,
-0.5489654, 0.5327486, -0.4188775, 0.2235294, 1, 0, 1,
-0.5470374, -0.3188896, -2.21517, 0.2196078, 1, 0, 1,
-0.5451755, 0.9283933, -0.03820885, 0.2117647, 1, 0, 1,
-0.5424599, 1.046595, 0.837421, 0.2078431, 1, 0, 1,
-0.5366105, 0.4853214, -1.236986, 0.2, 1, 0, 1,
-0.5224715, 1.020823, -1.526371, 0.1921569, 1, 0, 1,
-0.521631, 0.8543687, -2.248576, 0.1882353, 1, 0, 1,
-0.5103022, -0.7087431, -4.049259, 0.1803922, 1, 0, 1,
-0.5053677, -0.8313754, -1.565997, 0.1764706, 1, 0, 1,
-0.498708, 0.9053514, -0.4751481, 0.1686275, 1, 0, 1,
-0.498604, 1.491536, -0.8443249, 0.1647059, 1, 0, 1,
-0.4985749, 0.2002551, -1.521342, 0.1568628, 1, 0, 1,
-0.4968423, -0.3600015, -1.752404, 0.1529412, 1, 0, 1,
-0.4954277, 0.5452933, 2.003896, 0.145098, 1, 0, 1,
-0.4951545, -0.8216067, -3.108384, 0.1411765, 1, 0, 1,
-0.4916491, 1.176886, 0.7277407, 0.1333333, 1, 0, 1,
-0.4880997, 0.05834007, -1.957339, 0.1294118, 1, 0, 1,
-0.4871322, -0.603883, -0.9878978, 0.1215686, 1, 0, 1,
-0.4819014, -1.176781, -3.784647, 0.1176471, 1, 0, 1,
-0.470769, -0.6014963, -2.01436, 0.1098039, 1, 0, 1,
-0.4675952, 0.09873918, -1.560717, 0.1058824, 1, 0, 1,
-0.4653211, 0.2859233, -1.401722, 0.09803922, 1, 0, 1,
-0.4627025, -0.4871528, -0.9068149, 0.09019608, 1, 0, 1,
-0.4595621, 0.6801603, -0.710946, 0.08627451, 1, 0, 1,
-0.4561721, 0.5049703, -0.4765483, 0.07843138, 1, 0, 1,
-0.4503776, -0.8881896, -2.640768, 0.07450981, 1, 0, 1,
-0.4478632, 1.678373, -0.4274151, 0.06666667, 1, 0, 1,
-0.4459749, -1.087685, -4.289145, 0.0627451, 1, 0, 1,
-0.4420831, 0.4177223, -1.675089, 0.05490196, 1, 0, 1,
-0.4400585, -0.7600932, -2.016018, 0.05098039, 1, 0, 1,
-0.4391855, -0.4557782, -1.669396, 0.04313726, 1, 0, 1,
-0.4311547, 0.6343718, -0.7098888, 0.03921569, 1, 0, 1,
-0.4306197, 1.85382, 0.046036, 0.03137255, 1, 0, 1,
-0.4276747, 0.01141645, -1.218114, 0.02745098, 1, 0, 1,
-0.4265703, -0.3646546, -3.806266, 0.01960784, 1, 0, 1,
-0.4263387, -0.4893278, -2.725877, 0.01568628, 1, 0, 1,
-0.425723, 0.601765, -0.5478227, 0.007843138, 1, 0, 1,
-0.4250607, -0.4370631, -3.557676, 0.003921569, 1, 0, 1,
-0.4164963, 1.111025, -0.4847615, 0, 1, 0.003921569, 1,
-0.409681, 0.4980415, -2.272447, 0, 1, 0.01176471, 1,
-0.4087835, -0.3865936, -2.741173, 0, 1, 0.01568628, 1,
-0.402228, 1.345306, -1.563393, 0, 1, 0.02352941, 1,
-0.4020694, 0.4834427, -0.6987072, 0, 1, 0.02745098, 1,
-0.3993474, 1.097332, -0.5366123, 0, 1, 0.03529412, 1,
-0.3974696, -0.4096175, -3.815682, 0, 1, 0.03921569, 1,
-0.3927394, 0.6215013, -1.074463, 0, 1, 0.04705882, 1,
-0.3900576, -0.2475533, -1.116536, 0, 1, 0.05098039, 1,
-0.3898818, 1.22618, -1.37062, 0, 1, 0.05882353, 1,
-0.3892175, 0.2488688, -1.742737, 0, 1, 0.0627451, 1,
-0.3873231, 1.002421, -1.15749, 0, 1, 0.07058824, 1,
-0.3865907, 0.9621366, -1.003378, 0, 1, 0.07450981, 1,
-0.3839852, 0.3850349, -1.254964, 0, 1, 0.08235294, 1,
-0.3820128, 0.651049, -1.229907, 0, 1, 0.08627451, 1,
-0.3753148, -1.301959, -1.456212, 0, 1, 0.09411765, 1,
-0.3606743, 0.4939243, -0.406301, 0, 1, 0.1019608, 1,
-0.3602678, -0.1779198, -1.515728, 0, 1, 0.1058824, 1,
-0.3601901, 0.8338742, -0.3912401, 0, 1, 0.1137255, 1,
-0.3567781, 0.7033218, -0.4260708, 0, 1, 0.1176471, 1,
-0.3553423, 1.13523, 1.533799, 0, 1, 0.1254902, 1,
-0.3551326, -2.285473, -3.487969, 0, 1, 0.1294118, 1,
-0.3517444, -0.1930784, -2.155447, 0, 1, 0.1372549, 1,
-0.3479398, 0.5850164, 0.6620069, 0, 1, 0.1411765, 1,
-0.3346951, -1.022053, -3.188475, 0, 1, 0.1490196, 1,
-0.3319143, 0.60962, 0.4604651, 0, 1, 0.1529412, 1,
-0.3316428, -0.695888, -3.649058, 0, 1, 0.1607843, 1,
-0.3288368, -0.4744805, -1.476314, 0, 1, 0.1647059, 1,
-0.3284172, 1.220193, -0.1923421, 0, 1, 0.172549, 1,
-0.3275539, -0.4462076, -2.87332, 0, 1, 0.1764706, 1,
-0.3259832, -0.4290774, -1.419332, 0, 1, 0.1843137, 1,
-0.3228669, -2.19792, -2.991155, 0, 1, 0.1882353, 1,
-0.3224054, 0.8748298, 0.03552913, 0, 1, 0.1960784, 1,
-0.3212515, 1.199095, -0.5079854, 0, 1, 0.2039216, 1,
-0.3207628, -0.193482, -2.341114, 0, 1, 0.2078431, 1,
-0.3194256, -0.5551218, -3.486204, 0, 1, 0.2156863, 1,
-0.3189722, -1.747766, -3.379947, 0, 1, 0.2196078, 1,
-0.3085445, 1.201933, -1.218008, 0, 1, 0.227451, 1,
-0.3073369, 0.4024125, -1.765679, 0, 1, 0.2313726, 1,
-0.3065076, 0.9735357, -0.03293939, 0, 1, 0.2392157, 1,
-0.3051801, -0.9864379, -2.211946, 0, 1, 0.2431373, 1,
-0.2997055, 0.130492, -0.6077666, 0, 1, 0.2509804, 1,
-0.2996473, -0.2538181, -2.442664, 0, 1, 0.254902, 1,
-0.2981182, 1.187063, -0.6743752, 0, 1, 0.2627451, 1,
-0.2972499, 2.796451, -1.38425, 0, 1, 0.2666667, 1,
-0.2959343, 1.606602, 1.217061, 0, 1, 0.2745098, 1,
-0.2955512, 1.44117, -0.08660787, 0, 1, 0.2784314, 1,
-0.2939824, -0.1051532, -2.910112, 0, 1, 0.2862745, 1,
-0.2932125, -1.046417, -2.90735, 0, 1, 0.2901961, 1,
-0.2928411, 0.3385834, 1.306572, 0, 1, 0.2980392, 1,
-0.2855559, -1.107492, -1.817598, 0, 1, 0.3058824, 1,
-0.268479, 0.4986393, -1.810403, 0, 1, 0.3098039, 1,
-0.267996, -1.652934, -2.720052, 0, 1, 0.3176471, 1,
-0.2668017, 0.9900844, -1.637597, 0, 1, 0.3215686, 1,
-0.2652866, 0.6600218, -1.166834, 0, 1, 0.3294118, 1,
-0.2636766, -1.985328, -3.026595, 0, 1, 0.3333333, 1,
-0.2631267, 0.8821537, 0.09467872, 0, 1, 0.3411765, 1,
-0.2607391, -0.7173116, -2.109774, 0, 1, 0.345098, 1,
-0.2601193, 0.7186069, -0.7456691, 0, 1, 0.3529412, 1,
-0.2493745, -1.502112, -2.612262, 0, 1, 0.3568628, 1,
-0.2489334, -0.1104091, -0.1279749, 0, 1, 0.3647059, 1,
-0.2422616, 1.269279, -0.8712555, 0, 1, 0.3686275, 1,
-0.2418638, -0.1488663, -0.7106858, 0, 1, 0.3764706, 1,
-0.2404445, -1.788058, -3.489351, 0, 1, 0.3803922, 1,
-0.2393891, -1.758693, -2.227008, 0, 1, 0.3882353, 1,
-0.2388777, -0.4852664, -3.29311, 0, 1, 0.3921569, 1,
-0.2379681, -0.7988222, -3.81411, 0, 1, 0.4, 1,
-0.2354974, 0.08857544, -0.972502, 0, 1, 0.4078431, 1,
-0.2315363, 1.420522, -0.657133, 0, 1, 0.4117647, 1,
-0.2253358, 0.3015152, -1.555353, 0, 1, 0.4196078, 1,
-0.224917, -0.3350326, -3.570918, 0, 1, 0.4235294, 1,
-0.2248063, -0.7897102, -0.1927084, 0, 1, 0.4313726, 1,
-0.2209911, 0.9430233, -1.557533, 0, 1, 0.4352941, 1,
-0.2203382, -0.8860492, -2.528403, 0, 1, 0.4431373, 1,
-0.2158536, -0.8584993, -2.873826, 0, 1, 0.4470588, 1,
-0.2141066, 0.2889784, -1.483556, 0, 1, 0.454902, 1,
-0.2086809, -0.9161862, -2.371717, 0, 1, 0.4588235, 1,
-0.2059965, -0.348017, -3.162198, 0, 1, 0.4666667, 1,
-0.2033327, 1.722448, 0.07187328, 0, 1, 0.4705882, 1,
-0.2033006, -0.2535005, -2.478351, 0, 1, 0.4784314, 1,
-0.2026953, -0.5259532, -2.489215, 0, 1, 0.4823529, 1,
-0.1997705, -0.4396451, -1.069596, 0, 1, 0.4901961, 1,
-0.1990106, -1.304976, -4.89705, 0, 1, 0.4941176, 1,
-0.1956768, 1.071156, 0.9245912, 0, 1, 0.5019608, 1,
-0.1891172, -1.030966, -3.175195, 0, 1, 0.509804, 1,
-0.1889638, -0.6127976, -1.901881, 0, 1, 0.5137255, 1,
-0.1882106, 0.6329421, 0.7874233, 0, 1, 0.5215687, 1,
-0.1866567, -0.472793, -1.460855, 0, 1, 0.5254902, 1,
-0.1795927, -0.4072377, -1.842196, 0, 1, 0.5333334, 1,
-0.1734823, 0.5675954, -1.000288, 0, 1, 0.5372549, 1,
-0.1704198, 0.5085952, -4.198878, 0, 1, 0.5450981, 1,
-0.1694181, -1.61815, -2.982251, 0, 1, 0.5490196, 1,
-0.1682144, 1.702007, -0.5856656, 0, 1, 0.5568628, 1,
-0.1679136, -1.881318, -4.499216, 0, 1, 0.5607843, 1,
-0.1609599, -0.554578, -4.151955, 0, 1, 0.5686275, 1,
-0.1597413, 0.758557, -0.7015486, 0, 1, 0.572549, 1,
-0.1594778, -0.6044581, -3.036718, 0, 1, 0.5803922, 1,
-0.1593329, -0.1397128, -3.463362, 0, 1, 0.5843138, 1,
-0.1582368, 0.1572017, -2.808436, 0, 1, 0.5921569, 1,
-0.1552107, 1.105759, 1.046534, 0, 1, 0.5960785, 1,
-0.152899, -1.189324, -2.555512, 0, 1, 0.6039216, 1,
-0.1526531, 1.255596, -1.487774, 0, 1, 0.6117647, 1,
-0.1512612, 1.334162, 0.2686228, 0, 1, 0.6156863, 1,
-0.1445635, -0.6342092, -0.8290282, 0, 1, 0.6235294, 1,
-0.1421899, 0.3528488, -0.2636021, 0, 1, 0.627451, 1,
-0.1409653, -1.286852, -3.553073, 0, 1, 0.6352941, 1,
-0.1371387, -0.8372636, -3.97924, 0, 1, 0.6392157, 1,
-0.1293485, 0.6027339, -0.6196872, 0, 1, 0.6470588, 1,
-0.127372, 0.0614543, -0.9008349, 0, 1, 0.6509804, 1,
-0.113436, -0.2254212, -2.593391, 0, 1, 0.6588235, 1,
-0.1084382, 0.2398668, -0.6624635, 0, 1, 0.6627451, 1,
-0.10761, 0.2809518, 0.09145685, 0, 1, 0.6705883, 1,
-0.1053119, 0.03162159, -2.670405, 0, 1, 0.6745098, 1,
-0.1033409, 0.6842746, -1.870921, 0, 1, 0.682353, 1,
-0.09824883, 1.098583, 0.3604521, 0, 1, 0.6862745, 1,
-0.09598755, 0.3331739, 0.7956247, 0, 1, 0.6941177, 1,
-0.09597392, -0.4469638, -4.45515, 0, 1, 0.7019608, 1,
-0.09100363, 0.4900047, 0.7099382, 0, 1, 0.7058824, 1,
-0.09041267, 0.9802681, -0.566791, 0, 1, 0.7137255, 1,
-0.08989028, -0.06039092, -2.592224, 0, 1, 0.7176471, 1,
-0.08716541, 0.1810345, -1.253911, 0, 1, 0.7254902, 1,
-0.08707666, -0.7603835, -2.934801, 0, 1, 0.7294118, 1,
-0.07926378, -0.06348621, -2.171375, 0, 1, 0.7372549, 1,
-0.07836647, 1.532357, 1.420385, 0, 1, 0.7411765, 1,
-0.07728235, 0.1045529, 0.3635504, 0, 1, 0.7490196, 1,
-0.07256139, -1.251119, -2.719313, 0, 1, 0.7529412, 1,
-0.06363948, -2.278854, -2.790906, 0, 1, 0.7607843, 1,
-0.05874445, 0.1130688, -1.868011, 0, 1, 0.7647059, 1,
-0.05476269, -0.3903499, -3.81129, 0, 1, 0.772549, 1,
-0.05205644, -1.376844, -3.556582, 0, 1, 0.7764706, 1,
-0.0464628, 1.09376, -0.6500648, 0, 1, 0.7843137, 1,
-0.04166816, -0.3226832, -0.9924464, 0, 1, 0.7882353, 1,
-0.04026719, -1.568819, -2.557981, 0, 1, 0.7960784, 1,
-0.03580922, -1.73944, -4.891999, 0, 1, 0.8039216, 1,
-0.03036554, -0.3722147, -1.759324, 0, 1, 0.8078431, 1,
-0.02768964, -0.517893, -4.005465, 0, 1, 0.8156863, 1,
-0.02716368, -0.8609099, -2.715335, 0, 1, 0.8196079, 1,
-0.02432131, -0.395797, -3.201207, 0, 1, 0.827451, 1,
-0.02198173, 0.5742588, -1.488353, 0, 1, 0.8313726, 1,
-0.02097642, 1.656587, 0.5378724, 0, 1, 0.8392157, 1,
-0.01618782, -0.19568, -4.548812, 0, 1, 0.8431373, 1,
-0.01561432, -1.021503, -2.573066, 0, 1, 0.8509804, 1,
-0.01491342, 0.7875513, 0.1701809, 0, 1, 0.854902, 1,
-0.01249858, -1.344209, -2.601813, 0, 1, 0.8627451, 1,
-0.00999502, -1.360596, -3.034115, 0, 1, 0.8666667, 1,
-0.003169467, -0.8142735, -3.881583, 0, 1, 0.8745098, 1,
0.001740199, -1.379824, 3.914736, 0, 1, 0.8784314, 1,
0.003516373, -1.464535, 2.738268, 0, 1, 0.8862745, 1,
0.007231406, -1.028716, 1.00231, 0, 1, 0.8901961, 1,
0.009359322, 0.09779376, -0.8546604, 0, 1, 0.8980392, 1,
0.009935671, 0.3063642, 0.1819841, 0, 1, 0.9058824, 1,
0.01089562, 0.4761509, 1.133582, 0, 1, 0.9098039, 1,
0.01291902, 0.05829329, 0.1719824, 0, 1, 0.9176471, 1,
0.01479704, 0.7027379, 0.2902971, 0, 1, 0.9215686, 1,
0.0148702, -0.2879409, 3.261667, 0, 1, 0.9294118, 1,
0.0172735, 0.3579473, -1.804009, 0, 1, 0.9333333, 1,
0.01822805, -1.203428, 2.885664, 0, 1, 0.9411765, 1,
0.01876841, 0.2361887, -2.008511, 0, 1, 0.945098, 1,
0.02006872, 0.5290021, -1.451439, 0, 1, 0.9529412, 1,
0.02058096, 0.1025796, -1.457347, 0, 1, 0.9568627, 1,
0.02207674, -0.7646157, 4.258201, 0, 1, 0.9647059, 1,
0.02379246, -1.05728, 2.866139, 0, 1, 0.9686275, 1,
0.02652544, 0.4073459, 0.3810406, 0, 1, 0.9764706, 1,
0.02701197, 1.054685, -1.641504, 0, 1, 0.9803922, 1,
0.02741903, 0.3120181, 0.1541681, 0, 1, 0.9882353, 1,
0.03171869, -0.1417789, 3.423969, 0, 1, 0.9921569, 1,
0.03289288, 0.8645176, -1.509571, 0, 1, 1, 1,
0.03846363, -0.9959384, 3.509381, 0, 0.9921569, 1, 1,
0.04079417, 0.5219943, 1.081574, 0, 0.9882353, 1, 1,
0.04392369, -1.183383, 3.382027, 0, 0.9803922, 1, 1,
0.04731673, -1.81644, 2.615641, 0, 0.9764706, 1, 1,
0.04756513, -0.3643484, 2.083032, 0, 0.9686275, 1, 1,
0.04773509, 2.292236, 0.6825476, 0, 0.9647059, 1, 1,
0.04833301, 0.4929312, -0.6122708, 0, 0.9568627, 1, 1,
0.04980117, -0.2942945, 3.65843, 0, 0.9529412, 1, 1,
0.05007853, 0.5077777, 0.09320305, 0, 0.945098, 1, 1,
0.05219879, 0.550052, 0.2359348, 0, 0.9411765, 1, 1,
0.05338433, 0.08757272, 2.815608, 0, 0.9333333, 1, 1,
0.05496514, -1.416906, 3.948222, 0, 0.9294118, 1, 1,
0.06005031, 0.4352458, -1.221759, 0, 0.9215686, 1, 1,
0.06150085, 0.05148162, -1.295122, 0, 0.9176471, 1, 1,
0.06173369, -0.2096503, 2.287927, 0, 0.9098039, 1, 1,
0.06526378, -1.017083, 1.458716, 0, 0.9058824, 1, 1,
0.06689237, 0.2095689, 0.7289429, 0, 0.8980392, 1, 1,
0.07814587, -0.03603002, 4.120249, 0, 0.8901961, 1, 1,
0.0784709, -0.8425299, 4.139239, 0, 0.8862745, 1, 1,
0.07927629, 0.9143434, 1.193482, 0, 0.8784314, 1, 1,
0.08005263, 2.026621, -1.17206, 0, 0.8745098, 1, 1,
0.08136874, 0.7650096, -0.197608, 0, 0.8666667, 1, 1,
0.08313917, -0.7499481, 2.219662, 0, 0.8627451, 1, 1,
0.08381303, 0.7594107, -0.09866316, 0, 0.854902, 1, 1,
0.0854954, 0.4706808, 0.6638694, 0, 0.8509804, 1, 1,
0.08759582, 0.6138018, 2.156013, 0, 0.8431373, 1, 1,
0.08841023, 1.039241, -0.07083808, 0, 0.8392157, 1, 1,
0.08902096, -0.3163552, 2.636437, 0, 0.8313726, 1, 1,
0.08985373, -0.6143272, 2.443393, 0, 0.827451, 1, 1,
0.09104352, -1.70636, 4.203707, 0, 0.8196079, 1, 1,
0.09239636, -0.2374489, 1.627268, 0, 0.8156863, 1, 1,
0.09356318, -0.1624942, 1.651603, 0, 0.8078431, 1, 1,
0.099757, 1.382298, -0.6505281, 0, 0.8039216, 1, 1,
0.1006254, -0.3408136, 1.851568, 0, 0.7960784, 1, 1,
0.1007862, -0.411463, 2.182559, 0, 0.7882353, 1, 1,
0.1023063, 1.281147, -1.649654, 0, 0.7843137, 1, 1,
0.10741, -0.6520739, 3.470467, 0, 0.7764706, 1, 1,
0.1103033, 0.3815707, -1.528641, 0, 0.772549, 1, 1,
0.1105399, -0.3934512, 2.818335, 0, 0.7647059, 1, 1,
0.1147666, 2.177196, 0.9507859, 0, 0.7607843, 1, 1,
0.1147995, 0.5924699, 0.1667088, 0, 0.7529412, 1, 1,
0.1177185, -0.3317957, 2.818592, 0, 0.7490196, 1, 1,
0.1200747, -0.6543618, 3.614944, 0, 0.7411765, 1, 1,
0.120418, 1.751105, 2.707664, 0, 0.7372549, 1, 1,
0.121732, -0.8191974, 5.437857, 0, 0.7294118, 1, 1,
0.1278775, 1.180246, 1.005705, 0, 0.7254902, 1, 1,
0.1282236, 1.22874, 0.1595707, 0, 0.7176471, 1, 1,
0.1292915, -0.08863062, 2.891674, 0, 0.7137255, 1, 1,
0.1308255, 1.408164, 1.036737, 0, 0.7058824, 1, 1,
0.1314979, -0.9546101, 2.773694, 0, 0.6980392, 1, 1,
0.1321711, -1.456816, 2.77511, 0, 0.6941177, 1, 1,
0.1328655, -0.3012749, 2.894884, 0, 0.6862745, 1, 1,
0.1411634, -1.287119, 2.3281, 0, 0.682353, 1, 1,
0.1412582, 1.034873, -0.7140113, 0, 0.6745098, 1, 1,
0.1416877, 0.8270714, 2.308944, 0, 0.6705883, 1, 1,
0.1440025, -0.3378931, 1.87982, 0, 0.6627451, 1, 1,
0.1583859, 0.3114206, 0.3238844, 0, 0.6588235, 1, 1,
0.1611973, -1.264736, 3.144223, 0, 0.6509804, 1, 1,
0.1622589, -1.005592, 0.8050962, 0, 0.6470588, 1, 1,
0.1673293, -0.03512919, 2.436893, 0, 0.6392157, 1, 1,
0.1732389, 0.2287336, -0.02371192, 0, 0.6352941, 1, 1,
0.1741433, 0.569162, 0.1588522, 0, 0.627451, 1, 1,
0.1770763, 0.491814, 1.099525, 0, 0.6235294, 1, 1,
0.17978, -2.074155, 2.799272, 0, 0.6156863, 1, 1,
0.1813807, 0.1094164, 3.223398, 0, 0.6117647, 1, 1,
0.1841506, 0.329177, 0.001058358, 0, 0.6039216, 1, 1,
0.1861304, -0.3039666, 1.775197, 0, 0.5960785, 1, 1,
0.1876449, -0.3476416, 3.001303, 0, 0.5921569, 1, 1,
0.1903025, 1.32059, 2.143717, 0, 0.5843138, 1, 1,
0.190484, 2.208826, 0.8682241, 0, 0.5803922, 1, 1,
0.192746, 0.8515585, 0.1595733, 0, 0.572549, 1, 1,
0.1951272, 1.178651, -0.9048262, 0, 0.5686275, 1, 1,
0.1986783, -1.09326, 2.291528, 0, 0.5607843, 1, 1,
0.1990817, -1.570416, 3.716807, 0, 0.5568628, 1, 1,
0.1994946, 0.533777, 1.829103, 0, 0.5490196, 1, 1,
0.2080339, 0.7388304, 1.267249, 0, 0.5450981, 1, 1,
0.2177684, 1.611617, -1.72404, 0, 0.5372549, 1, 1,
0.2221957, 1.396812, 1.359382, 0, 0.5333334, 1, 1,
0.2230706, 0.1752593, 1.113114, 0, 0.5254902, 1, 1,
0.2235792, 0.7009563, 0.9591857, 0, 0.5215687, 1, 1,
0.2244044, 0.2345155, 1.11903, 0, 0.5137255, 1, 1,
0.2252916, 0.127447, -0.9348426, 0, 0.509804, 1, 1,
0.2307236, 1.468775, -0.4181387, 0, 0.5019608, 1, 1,
0.2308064, 1.147615, 0.1367652, 0, 0.4941176, 1, 1,
0.2382037, -1.003714, 2.030123, 0, 0.4901961, 1, 1,
0.2390698, -0.3960329, 0.0309863, 0, 0.4823529, 1, 1,
0.2413774, -0.4282423, 1.034506, 0, 0.4784314, 1, 1,
0.2427574, 1.23319, 0.8142514, 0, 0.4705882, 1, 1,
0.2443791, -0.04372568, 2.284758, 0, 0.4666667, 1, 1,
0.244484, 1.489007, 0.2421347, 0, 0.4588235, 1, 1,
0.2488295, -0.06550621, 1.603345, 0, 0.454902, 1, 1,
0.2512441, -0.7306099, 5.10172, 0, 0.4470588, 1, 1,
0.2522453, -1.540632, 4.427863, 0, 0.4431373, 1, 1,
0.2595782, -1.202968, 2.710184, 0, 0.4352941, 1, 1,
0.261183, -0.5494704, 3.385478, 0, 0.4313726, 1, 1,
0.2652397, -1.064221, 3.680698, 0, 0.4235294, 1, 1,
0.2751853, 1.403357, 1.414716, 0, 0.4196078, 1, 1,
0.2770272, 0.4584251, -0.5243779, 0, 0.4117647, 1, 1,
0.2773423, -1.155566, 3.152631, 0, 0.4078431, 1, 1,
0.2810098, 0.5348356, 2.159244, 0, 0.4, 1, 1,
0.2815687, 0.5804217, 2.212048, 0, 0.3921569, 1, 1,
0.2835826, -1.290581, 2.487149, 0, 0.3882353, 1, 1,
0.2856191, -2.26385, 2.626432, 0, 0.3803922, 1, 1,
0.2891666, -0.5132523, 1.911886, 0, 0.3764706, 1, 1,
0.2955624, 0.3988292, 1.663823, 0, 0.3686275, 1, 1,
0.2963446, 0.5945342, 0.392011, 0, 0.3647059, 1, 1,
0.3087297, 0.6324582, -0.07822552, 0, 0.3568628, 1, 1,
0.3089001, -1.835461, 2.386072, 0, 0.3529412, 1, 1,
0.3124655, -1.686301, 2.501087, 0, 0.345098, 1, 1,
0.3165543, -1.266037, 1.819879, 0, 0.3411765, 1, 1,
0.3234623, 1.282689, 0.2862302, 0, 0.3333333, 1, 1,
0.3240233, 0.6841668, 0.4021445, 0, 0.3294118, 1, 1,
0.3301683, -1.517731, 3.776949, 0, 0.3215686, 1, 1,
0.3324569, 0.2447147, 1.543551, 0, 0.3176471, 1, 1,
0.3427565, 1.272993, -1.406136, 0, 0.3098039, 1, 1,
0.34755, -0.1899814, 1.695777, 0, 0.3058824, 1, 1,
0.3476207, -0.437163, 2.877601, 0, 0.2980392, 1, 1,
0.3491212, 0.006306056, 2.018849, 0, 0.2901961, 1, 1,
0.3505914, -0.5547594, 1.640594, 0, 0.2862745, 1, 1,
0.3511821, -0.259037, 1.133694, 0, 0.2784314, 1, 1,
0.354096, -1.065235, 3.454912, 0, 0.2745098, 1, 1,
0.3592916, -0.6241741, 2.440165, 0, 0.2666667, 1, 1,
0.3635277, -0.541895, 3.320321, 0, 0.2627451, 1, 1,
0.3638337, 0.9178287, 0.2766273, 0, 0.254902, 1, 1,
0.3674832, 1.24843, 0.0264444, 0, 0.2509804, 1, 1,
0.3692164, 0.1380585, -0.2182794, 0, 0.2431373, 1, 1,
0.3751974, 0.5176268, 1.56031, 0, 0.2392157, 1, 1,
0.3753704, 0.02056283, 1.803177, 0, 0.2313726, 1, 1,
0.3780835, 1.378152, -0.2996326, 0, 0.227451, 1, 1,
0.3797339, -0.7228342, 3.768207, 0, 0.2196078, 1, 1,
0.3868369, 1.421026, 0.7345001, 0, 0.2156863, 1, 1,
0.387311, 0.2898057, -0.5998636, 0, 0.2078431, 1, 1,
0.3885276, 2.293624, 0.3099836, 0, 0.2039216, 1, 1,
0.3887158, 0.5793532, -0.599626, 0, 0.1960784, 1, 1,
0.3919564, -1.431829, 3.869967, 0, 0.1882353, 1, 1,
0.3963842, -0.5136348, 2.124198, 0, 0.1843137, 1, 1,
0.4013218, -1.586109, 2.728754, 0, 0.1764706, 1, 1,
0.4019663, -1.01422, 3.747862, 0, 0.172549, 1, 1,
0.4051937, -0.04469204, 2.742051, 0, 0.1647059, 1, 1,
0.4053108, 0.8051063, -0.4986593, 0, 0.1607843, 1, 1,
0.4056129, -1.460503, 1.541401, 0, 0.1529412, 1, 1,
0.4118848, -0.6080964, 3.372843, 0, 0.1490196, 1, 1,
0.4148809, -0.2732351, 2.565126, 0, 0.1411765, 1, 1,
0.4268336, -0.264258, 3.178663, 0, 0.1372549, 1, 1,
0.4268884, 1.114029, 0.179691, 0, 0.1294118, 1, 1,
0.4291119, -0.7577127, 2.273648, 0, 0.1254902, 1, 1,
0.4310786, 0.4714099, 0.7649422, 0, 0.1176471, 1, 1,
0.4366772, 0.8964971, 1.487357, 0, 0.1137255, 1, 1,
0.4380115, 0.112023, 0.09596632, 0, 0.1058824, 1, 1,
0.4381426, -0.9373333, 1.153432, 0, 0.09803922, 1, 1,
0.4395907, -1.314692, 3.674998, 0, 0.09411765, 1, 1,
0.444499, -0.684826, 2.27268, 0, 0.08627451, 1, 1,
0.4454894, -0.4674196, 1.801236, 0, 0.08235294, 1, 1,
0.4479721, 0.9450036, 0.3464722, 0, 0.07450981, 1, 1,
0.4494254, -0.6601948, 2.264196, 0, 0.07058824, 1, 1,
0.4507375, 0.3314202, 3.289284, 0, 0.0627451, 1, 1,
0.4527702, -0.8898336, 2.728075, 0, 0.05882353, 1, 1,
0.4527879, -0.112153, 3.346213, 0, 0.05098039, 1, 1,
0.4547818, 0.4641328, 1.031661, 0, 0.04705882, 1, 1,
0.4560547, 0.07283291, 1.558173, 0, 0.03921569, 1, 1,
0.4585088, 0.2042381, 2.612691, 0, 0.03529412, 1, 1,
0.4627568, -1.496529, 2.541678, 0, 0.02745098, 1, 1,
0.4644147, 1.076283, 0.871128, 0, 0.02352941, 1, 1,
0.4691459, 0.6058939, -0.02068885, 0, 0.01568628, 1, 1,
0.4753, -0.7596397, 3.424095, 0, 0.01176471, 1, 1,
0.476248, 1.73062, 1.00075, 0, 0.003921569, 1, 1,
0.4776164, 1.220089, 1.266886, 0.003921569, 0, 1, 1,
0.4808788, -0.6956854, 3.464483, 0.007843138, 0, 1, 1,
0.4860532, -0.8548129, 3.114065, 0.01568628, 0, 1, 1,
0.4872119, 0.314914, 2.398789, 0.01960784, 0, 1, 1,
0.4931429, -0.6558183, 2.76598, 0.02745098, 0, 1, 1,
0.4932029, -0.551572, 0.2598497, 0.03137255, 0, 1, 1,
0.4940243, 0.109745, 0.3398416, 0.03921569, 0, 1, 1,
0.4973926, -1.706478, 2.751658, 0.04313726, 0, 1, 1,
0.4991951, 0.07971046, 2.798391, 0.05098039, 0, 1, 1,
0.4994454, 0.2896947, 0.3986887, 0.05490196, 0, 1, 1,
0.504351, -0.7300656, 1.925719, 0.0627451, 0, 1, 1,
0.5096976, 0.5180025, 0.1099056, 0.06666667, 0, 1, 1,
0.510893, -1.287455, 0.7020626, 0.07450981, 0, 1, 1,
0.5136032, 1.297858, 0.8028615, 0.07843138, 0, 1, 1,
0.5159302, -0.1346569, 0.5997528, 0.08627451, 0, 1, 1,
0.5197461, 1.071025, 0.2194217, 0.09019608, 0, 1, 1,
0.5209471, -0.2673537, 1.112715, 0.09803922, 0, 1, 1,
0.5250962, 0.0370744, 1.806872, 0.1058824, 0, 1, 1,
0.525287, -0.01500521, 3.041963, 0.1098039, 0, 1, 1,
0.5255004, 2.106407, 0.3685281, 0.1176471, 0, 1, 1,
0.5267211, 0.4744969, 0.8215518, 0.1215686, 0, 1, 1,
0.5392436, -0.6954948, 2.651472, 0.1294118, 0, 1, 1,
0.5445371, -0.8445815, 1.987241, 0.1333333, 0, 1, 1,
0.5463451, 0.9404442, 0.5918906, 0.1411765, 0, 1, 1,
0.5467389, 0.001569668, 0.3488479, 0.145098, 0, 1, 1,
0.5477566, -0.51932, 1.734028, 0.1529412, 0, 1, 1,
0.5519726, -0.8882174, 3.335215, 0.1568628, 0, 1, 1,
0.5541052, 0.7864606, -0.1641624, 0.1647059, 0, 1, 1,
0.554239, 2.397043, 1.572943, 0.1686275, 0, 1, 1,
0.5578271, 0.003882653, 0.5127385, 0.1764706, 0, 1, 1,
0.5614684, -1.589319, 2.187146, 0.1803922, 0, 1, 1,
0.5652759, 0.3383793, 1.38341, 0.1882353, 0, 1, 1,
0.5652897, -0.9521311, 1.49306, 0.1921569, 0, 1, 1,
0.5655572, 0.6563193, 1.441231, 0.2, 0, 1, 1,
0.566469, -0.3731359, 2.705999, 0.2078431, 0, 1, 1,
0.5714023, 0.004033626, 0.7197805, 0.2117647, 0, 1, 1,
0.5733837, 0.3166585, 1.97976, 0.2196078, 0, 1, 1,
0.5799155, 1.12042, 1.602494, 0.2235294, 0, 1, 1,
0.5800557, -0.2982411, 2.209342, 0.2313726, 0, 1, 1,
0.5815767, 0.3800518, 0.2920376, 0.2352941, 0, 1, 1,
0.5870696, -0.9571406, 2.758267, 0.2431373, 0, 1, 1,
0.5870996, -0.1832661, 3.905188, 0.2470588, 0, 1, 1,
0.5874761, -1.253221, 2.750452, 0.254902, 0, 1, 1,
0.5904109, 0.3041162, 2.669099, 0.2588235, 0, 1, 1,
0.5939943, -0.2710676, 3.151546, 0.2666667, 0, 1, 1,
0.5987366, 1.276491, 0.0898046, 0.2705882, 0, 1, 1,
0.6046756, 1.409211, -0.8014207, 0.2784314, 0, 1, 1,
0.6058081, -0.4999115, 2.417555, 0.282353, 0, 1, 1,
0.6061395, 0.01824224, 1.607892, 0.2901961, 0, 1, 1,
0.6076531, 1.265303, -0.9166331, 0.2941177, 0, 1, 1,
0.6085954, -0.8271632, 1.494766, 0.3019608, 0, 1, 1,
0.6094663, -1.218878, -0.1821714, 0.3098039, 0, 1, 1,
0.6130488, -0.8931478, 2.638391, 0.3137255, 0, 1, 1,
0.6131607, -1.796622, 3.298456, 0.3215686, 0, 1, 1,
0.6143671, 1.694567, -0.05123672, 0.3254902, 0, 1, 1,
0.6153418, -0.162268, 2.498263, 0.3333333, 0, 1, 1,
0.623427, 1.199323, 0.4980459, 0.3372549, 0, 1, 1,
0.6272941, -0.2176164, 0.3040642, 0.345098, 0, 1, 1,
0.6283097, -1.15541, 2.314379, 0.3490196, 0, 1, 1,
0.6283616, -0.3848167, 1.907688, 0.3568628, 0, 1, 1,
0.6342996, -0.1754535, 2.243366, 0.3607843, 0, 1, 1,
0.6391982, 0.5554776, 1.352351, 0.3686275, 0, 1, 1,
0.6417093, 0.74817, 1.572193, 0.372549, 0, 1, 1,
0.6418122, 0.4860428, 1.836615, 0.3803922, 0, 1, 1,
0.6425549, 0.7773269, -1.006958, 0.3843137, 0, 1, 1,
0.6430768, 0.3489501, 3.217946, 0.3921569, 0, 1, 1,
0.6442484, 1.753621, -1.512873, 0.3960784, 0, 1, 1,
0.6492096, -0.2912174, 3.226717, 0.4039216, 0, 1, 1,
0.6509683, -0.2813871, 2.529268, 0.4117647, 0, 1, 1,
0.6518544, -1.223187, 3.150735, 0.4156863, 0, 1, 1,
0.6521969, -1.429905, 2.357992, 0.4235294, 0, 1, 1,
0.6535428, 0.2369026, 2.572312, 0.427451, 0, 1, 1,
0.6536791, 0.6138076, -0.9669712, 0.4352941, 0, 1, 1,
0.6539801, 1.267326, 1.25525, 0.4392157, 0, 1, 1,
0.6563394, 0.5849991, 1.470938, 0.4470588, 0, 1, 1,
0.6578355, -0.3790732, 2.383825, 0.4509804, 0, 1, 1,
0.6601162, -0.2415358, 2.488536, 0.4588235, 0, 1, 1,
0.6651827, -0.1046986, 1.40889, 0.4627451, 0, 1, 1,
0.6703962, 2.194718, 0.5038021, 0.4705882, 0, 1, 1,
0.6738194, 0.7981238, 1.06966, 0.4745098, 0, 1, 1,
0.678331, -0.1158268, 1.001715, 0.4823529, 0, 1, 1,
0.6801757, -1.763383, 2.937342, 0.4862745, 0, 1, 1,
0.6819352, 0.2017312, 1.590291, 0.4941176, 0, 1, 1,
0.6819848, 1.686114, 0.9088191, 0.5019608, 0, 1, 1,
0.6833931, -0.380898, 1.103683, 0.5058824, 0, 1, 1,
0.684498, -1.287547, 2.560366, 0.5137255, 0, 1, 1,
0.6866797, -1.384011, 2.426341, 0.5176471, 0, 1, 1,
0.6871904, -0.8701262, 2.827322, 0.5254902, 0, 1, 1,
0.6872879, -0.2394599, 1.369708, 0.5294118, 0, 1, 1,
0.687553, 0.3564287, 1.352505, 0.5372549, 0, 1, 1,
0.700882, -0.8952563, 3.80268, 0.5411765, 0, 1, 1,
0.7070217, -1.493878, 2.458523, 0.5490196, 0, 1, 1,
0.7070219, -0.2886606, 2.057904, 0.5529412, 0, 1, 1,
0.710785, -1.418871, 3.595793, 0.5607843, 0, 1, 1,
0.71385, -0.623229, 3.506997, 0.5647059, 0, 1, 1,
0.7225456, -0.002890326, 1.720706, 0.572549, 0, 1, 1,
0.7270011, 1.343687, -0.4635491, 0.5764706, 0, 1, 1,
0.7317231, -0.07341589, 1.759328, 0.5843138, 0, 1, 1,
0.7318939, 0.1705059, 3.280308, 0.5882353, 0, 1, 1,
0.7323789, -2.545408, 3.390788, 0.5960785, 0, 1, 1,
0.7350393, 1.654758, 2.64419, 0.6039216, 0, 1, 1,
0.7393604, -1.313556, 3.145499, 0.6078432, 0, 1, 1,
0.7436904, -1.756628, 4.255997, 0.6156863, 0, 1, 1,
0.7444015, 0.3424684, 1.181512, 0.6196079, 0, 1, 1,
0.7459711, -0.8866966, 3.268093, 0.627451, 0, 1, 1,
0.7469234, 0.4915366, 1.483867, 0.6313726, 0, 1, 1,
0.7477414, -0.8735092, 2.833373, 0.6392157, 0, 1, 1,
0.7482337, 0.9818986, 1.121411, 0.6431373, 0, 1, 1,
0.7483918, 0.4260414, 1.926167, 0.6509804, 0, 1, 1,
0.7496276, 1.081893, -0.2859652, 0.654902, 0, 1, 1,
0.7504318, 0.403647, -0.05255353, 0.6627451, 0, 1, 1,
0.7511126, 1.310723, -0.8974068, 0.6666667, 0, 1, 1,
0.7516981, 0.7840546, 1.553244, 0.6745098, 0, 1, 1,
0.7531638, -1.059529, 1.229522, 0.6784314, 0, 1, 1,
0.7555522, 0.1270134, 2.031603, 0.6862745, 0, 1, 1,
0.7559351, -1.739967, 1.579999, 0.6901961, 0, 1, 1,
0.7623676, -0.8349054, 1.572213, 0.6980392, 0, 1, 1,
0.7646789, -0.9420587, 2.708871, 0.7058824, 0, 1, 1,
0.7706507, 0.8242171, 0.5528895, 0.7098039, 0, 1, 1,
0.7775347, 0.6659688, 1.078041, 0.7176471, 0, 1, 1,
0.7780394, 1.728377, -0.2630309, 0.7215686, 0, 1, 1,
0.778775, -0.9623545, 3.143014, 0.7294118, 0, 1, 1,
0.7802308, 0.6676824, 1.893092, 0.7333333, 0, 1, 1,
0.7826288, 0.3616733, -0.360252, 0.7411765, 0, 1, 1,
0.7833387, -0.2318248, 3.786724, 0.7450981, 0, 1, 1,
0.7846209, 1.042168, -0.9031436, 0.7529412, 0, 1, 1,
0.7907791, 0.02643753, 1.515379, 0.7568628, 0, 1, 1,
0.7940182, 0.5430281, 2.846813, 0.7647059, 0, 1, 1,
0.7994647, -0.2072298, 2.917048, 0.7686275, 0, 1, 1,
0.7997038, 0.02234434, 1.177989, 0.7764706, 0, 1, 1,
0.8009376, -0.6338215, 2.693639, 0.7803922, 0, 1, 1,
0.8104466, -0.3425635, 1.002612, 0.7882353, 0, 1, 1,
0.810739, 2.016928, 0.5777938, 0.7921569, 0, 1, 1,
0.815924, -0.5523254, 0.9778514, 0.8, 0, 1, 1,
0.8188905, -1.751379, 2.695539, 0.8078431, 0, 1, 1,
0.8228912, 0.7096179, 0.7163576, 0.8117647, 0, 1, 1,
0.8259429, 0.525975, 2.07954, 0.8196079, 0, 1, 1,
0.8300782, -0.6056439, 0.8908689, 0.8235294, 0, 1, 1,
0.8356164, -0.008199066, 1.088348, 0.8313726, 0, 1, 1,
0.858157, -1.132967, 2.473976, 0.8352941, 0, 1, 1,
0.8667036, -0.9154981, 1.860372, 0.8431373, 0, 1, 1,
0.8729115, -1.22561, 2.251556, 0.8470588, 0, 1, 1,
0.879557, -1.110367, 1.461623, 0.854902, 0, 1, 1,
0.8798829, 0.6653826, 0.6990172, 0.8588235, 0, 1, 1,
0.8871501, 0.5260658, 0.2427172, 0.8666667, 0, 1, 1,
0.887169, -0.2190921, 1.72317, 0.8705882, 0, 1, 1,
0.887729, -1.029274, 1.939887, 0.8784314, 0, 1, 1,
0.8897302, -1.226706, 4.59123, 0.8823529, 0, 1, 1,
0.8897849, 0.1231726, 1.454252, 0.8901961, 0, 1, 1,
0.8939888, -0.9333649, 1.016244, 0.8941177, 0, 1, 1,
0.8980181, 0.4767573, 0.2222443, 0.9019608, 0, 1, 1,
0.9003587, -2.273804, 4.019238, 0.9098039, 0, 1, 1,
0.9056334, -1.093256, 2.246917, 0.9137255, 0, 1, 1,
0.9124481, 0.2672131, 2.351475, 0.9215686, 0, 1, 1,
0.923042, 0.3483205, 1.239504, 0.9254902, 0, 1, 1,
0.9247121, -1.171702, 2.628444, 0.9333333, 0, 1, 1,
0.9257193, 0.7001098, 1.244091, 0.9372549, 0, 1, 1,
0.9265723, 0.156082, 1.536582, 0.945098, 0, 1, 1,
0.9280577, 0.8240517, 2.301029, 0.9490196, 0, 1, 1,
0.9315351, 0.1032771, 0.8455361, 0.9568627, 0, 1, 1,
0.9317021, -0.8399086, 2.653141, 0.9607843, 0, 1, 1,
0.9330925, -0.242644, 3.165867, 0.9686275, 0, 1, 1,
0.9449298, -1.71515, 4.351428, 0.972549, 0, 1, 1,
0.9473108, 0.8950332, 2.350238, 0.9803922, 0, 1, 1,
0.9497749, -0.09819683, 1.207498, 0.9843137, 0, 1, 1,
0.951059, 0.1615015, 2.686283, 0.9921569, 0, 1, 1,
0.9550924, -1.312609, 2.454741, 0.9960784, 0, 1, 1,
0.9628015, 1.168453, -0.2074843, 1, 0, 0.9960784, 1,
0.9635554, 0.04099845, 3.079457, 1, 0, 0.9882353, 1,
0.9649451, -0.2235701, 0.5702641, 1, 0, 0.9843137, 1,
0.9656084, -1.014119, 2.149582, 1, 0, 0.9764706, 1,
0.9679485, -0.05650994, 0.5462946, 1, 0, 0.972549, 1,
0.9692928, 0.6288862, 0.8720371, 1, 0, 0.9647059, 1,
0.9705663, -1.243393, 2.373174, 1, 0, 0.9607843, 1,
0.9713407, 1.027561, 0.3898143, 1, 0, 0.9529412, 1,
0.9880137, 1.502308, -0.1347924, 1, 0, 0.9490196, 1,
0.9913887, 1.120888, -0.7674155, 1, 0, 0.9411765, 1,
0.9966895, -0.5038289, 2.048884, 1, 0, 0.9372549, 1,
0.9976426, 1.640623, 2.014995, 1, 0, 0.9294118, 1,
1.003331, 0.05977891, 2.579345, 1, 0, 0.9254902, 1,
1.00377, -1.038377, 1.946262, 1, 0, 0.9176471, 1,
1.004466, 0.117932, 2.486779, 1, 0, 0.9137255, 1,
1.004747, 1.457221, -0.05569188, 1, 0, 0.9058824, 1,
1.020571, 1.633798, 1.07182, 1, 0, 0.9019608, 1,
1.022371, -1.590972, 2.458631, 1, 0, 0.8941177, 1,
1.023388, 0.5009978, 1.938642, 1, 0, 0.8862745, 1,
1.034035, 1.52104, 1.279471, 1, 0, 0.8823529, 1,
1.038199, 0.6314847, 2.147185, 1, 0, 0.8745098, 1,
1.052943, -0.7712054, 0.7416704, 1, 0, 0.8705882, 1,
1.054238, -0.220063, 1.046771, 1, 0, 0.8627451, 1,
1.054246, -0.2211143, 2.164988, 1, 0, 0.8588235, 1,
1.054559, 1.948044, 0.5519602, 1, 0, 0.8509804, 1,
1.066481, 0.1841524, 2.766249, 1, 0, 0.8470588, 1,
1.077109, 0.4404445, 1.487019, 1, 0, 0.8392157, 1,
1.079859, -0.1782678, 1.324711, 1, 0, 0.8352941, 1,
1.086087, -1.752162, 4.35639, 1, 0, 0.827451, 1,
1.087202, 0.8732043, 1.236844, 1, 0, 0.8235294, 1,
1.089352, -1.167434, 1.921521, 1, 0, 0.8156863, 1,
1.093989, 0.9137859, 1.401698, 1, 0, 0.8117647, 1,
1.099329, -0.5952109, 1.907151, 1, 0, 0.8039216, 1,
1.109085, -0.1910001, 2.333578, 1, 0, 0.7960784, 1,
1.10924, -0.5488551, 4.193253, 1, 0, 0.7921569, 1,
1.11187, 0.9088464, 2.952448, 1, 0, 0.7843137, 1,
1.113895, -0.9877599, 1.916874, 1, 0, 0.7803922, 1,
1.122256, -0.3583233, 2.93779, 1, 0, 0.772549, 1,
1.125622, -0.03738772, 3.554564, 1, 0, 0.7686275, 1,
1.12877, 0.01531112, 2.039213, 1, 0, 0.7607843, 1,
1.13692, 0.427345, -0.0021798, 1, 0, 0.7568628, 1,
1.142472, -0.228359, 2.120588, 1, 0, 0.7490196, 1,
1.147242, 0.2760884, -0.1763778, 1, 0, 0.7450981, 1,
1.153009, -1.099263, 2.460812, 1, 0, 0.7372549, 1,
1.153135, -0.3822806, 2.698311, 1, 0, 0.7333333, 1,
1.155315, -0.9804262, 0.9666895, 1, 0, 0.7254902, 1,
1.157665, 0.05107769, 1.568528, 1, 0, 0.7215686, 1,
1.169477, -0.3181508, 2.555906, 1, 0, 0.7137255, 1,
1.180779, 0.9251546, 0.9120985, 1, 0, 0.7098039, 1,
1.188574, 0.2710413, 1.81103, 1, 0, 0.7019608, 1,
1.189534, -0.6836797, 2.771692, 1, 0, 0.6941177, 1,
1.192223, -0.7474154, 0.8025247, 1, 0, 0.6901961, 1,
1.194984, -0.6250312, 1.12713, 1, 0, 0.682353, 1,
1.1985, -1.37992, 1.876505, 1, 0, 0.6784314, 1,
1.208267, 0.4932194, 0.7703038, 1, 0, 0.6705883, 1,
1.213453, 0.290589, 0.09744515, 1, 0, 0.6666667, 1,
1.218295, -0.2585908, 2.391662, 1, 0, 0.6588235, 1,
1.227219, 1.062987, 0.5288522, 1, 0, 0.654902, 1,
1.23551, 0.01976368, 2.264225, 1, 0, 0.6470588, 1,
1.23678, -2.349591, 2.238333, 1, 0, 0.6431373, 1,
1.237075, -0.002084023, 1.718719, 1, 0, 0.6352941, 1,
1.237946, -0.8401049, 1.762953, 1, 0, 0.6313726, 1,
1.242586, 1.605654, -0.310063, 1, 0, 0.6235294, 1,
1.243465, 0.2684473, 1.560813, 1, 0, 0.6196079, 1,
1.269916, 1.435022, 0.4864269, 1, 0, 0.6117647, 1,
1.270008, 0.393817, 2.530481, 1, 0, 0.6078432, 1,
1.285791, 0.1139667, 1.531507, 1, 0, 0.6, 1,
1.289912, -0.04361279, 2.066098, 1, 0, 0.5921569, 1,
1.308056, 0.4852045, 1.614965, 1, 0, 0.5882353, 1,
1.308601, 0.156271, 1.08583, 1, 0, 0.5803922, 1,
1.308776, -0.5211911, 2.50036, 1, 0, 0.5764706, 1,
1.308962, 0.4550264, 0.3497829, 1, 0, 0.5686275, 1,
1.310384, -0.6667948, 1.945708, 1, 0, 0.5647059, 1,
1.314894, 0.6317675, 1.56377, 1, 0, 0.5568628, 1,
1.324965, 0.5381563, 1.732871, 1, 0, 0.5529412, 1,
1.326331, 0.5540645, 0.5680332, 1, 0, 0.5450981, 1,
1.334623, -0.4308491, 2.515811, 1, 0, 0.5411765, 1,
1.339388, -2.578821, 2.832875, 1, 0, 0.5333334, 1,
1.34384, -1.03692, 3.350571, 1, 0, 0.5294118, 1,
1.356778, 1.135641, -0.3742964, 1, 0, 0.5215687, 1,
1.358997, -0.2441784, 0.6725259, 1, 0, 0.5176471, 1,
1.376257, 0.5428014, 0.1313892, 1, 0, 0.509804, 1,
1.377026, -2.348777, 2.100908, 1, 0, 0.5058824, 1,
1.378741, 0.6642729, 0.5161964, 1, 0, 0.4980392, 1,
1.381335, -0.5760909, 4.236551, 1, 0, 0.4901961, 1,
1.383185, -0.6510617, 0.703687, 1, 0, 0.4862745, 1,
1.384226, -1.526636, 2.094494, 1, 0, 0.4784314, 1,
1.392387, 0.7761968, -0.4010612, 1, 0, 0.4745098, 1,
1.398747, -0.3900524, 2.561061, 1, 0, 0.4666667, 1,
1.412264, 0.8840582, -0.1381781, 1, 0, 0.4627451, 1,
1.423075, 0.7541409, 2.234463, 1, 0, 0.454902, 1,
1.423667, -0.1847958, 2.353598, 1, 0, 0.4509804, 1,
1.427654, -1.273893, 3.801644, 1, 0, 0.4431373, 1,
1.429152, -0.6871601, 3.490808, 1, 0, 0.4392157, 1,
1.437792, 1.136838, 0.8582751, 1, 0, 0.4313726, 1,
1.444445, 0.953822, -0.3622494, 1, 0, 0.427451, 1,
1.462122, 2.237718, 2.293078, 1, 0, 0.4196078, 1,
1.478661, 0.6626766, 1.68047, 1, 0, 0.4156863, 1,
1.495265, -0.1171642, 1.071983, 1, 0, 0.4078431, 1,
1.499083, 0.2282914, 1.42354, 1, 0, 0.4039216, 1,
1.501552, -0.4697955, 2.699394, 1, 0, 0.3960784, 1,
1.506939, -1.556754, 4.374842, 1, 0, 0.3882353, 1,
1.513499, -1.306116, 1.698032, 1, 0, 0.3843137, 1,
1.51377, 1.032459, 0.9882894, 1, 0, 0.3764706, 1,
1.516352, 0.3343457, 1.543772, 1, 0, 0.372549, 1,
1.522138, 0.5903418, -0.1452403, 1, 0, 0.3647059, 1,
1.523973, -1.308153, 3.836028, 1, 0, 0.3607843, 1,
1.550179, -0.3191847, 1.856246, 1, 0, 0.3529412, 1,
1.551422, 1.360041, 0.9806212, 1, 0, 0.3490196, 1,
1.557129, -0.7543289, 1.799052, 1, 0, 0.3411765, 1,
1.564072, 1.505329, 1.360352, 1, 0, 0.3372549, 1,
1.576863, -0.4869308, 2.612144, 1, 0, 0.3294118, 1,
1.580739, 1.188838, -0.1873116, 1, 0, 0.3254902, 1,
1.583167, -0.5212724, 1.299267, 1, 0, 0.3176471, 1,
1.589375, 0.1245811, 2.32294, 1, 0, 0.3137255, 1,
1.612955, 0.08595503, 2.989217, 1, 0, 0.3058824, 1,
1.613492, 1.998698, 0.3209598, 1, 0, 0.2980392, 1,
1.617219, -0.8140287, 1.945995, 1, 0, 0.2941177, 1,
1.631556, -0.3385242, 1.141753, 1, 0, 0.2862745, 1,
1.645975, -0.9673505, 1.562524, 1, 0, 0.282353, 1,
1.660098, -0.1070242, 1.497763, 1, 0, 0.2745098, 1,
1.685167, 2.117465, 0.8615742, 1, 0, 0.2705882, 1,
1.694864, 0.4965782, 3.059405, 1, 0, 0.2627451, 1,
1.70361, 0.5556063, -0.1377805, 1, 0, 0.2588235, 1,
1.708025, 1.464137, 0.8019105, 1, 0, 0.2509804, 1,
1.714732, 0.5166368, 0.7235502, 1, 0, 0.2470588, 1,
1.733386, 1.895031, 1.511813, 1, 0, 0.2392157, 1,
1.742457, -0.8533658, 1.295016, 1, 0, 0.2352941, 1,
1.74683, 0.3640727, 1.62294, 1, 0, 0.227451, 1,
1.775939, 0.04337527, 1.73226, 1, 0, 0.2235294, 1,
1.810079, -1.132324, 2.019238, 1, 0, 0.2156863, 1,
1.82015, -1.543827, 2.304258, 1, 0, 0.2117647, 1,
1.824576, 1.689674, 0.731144, 1, 0, 0.2039216, 1,
1.829402, -0.7509655, 0.7139592, 1, 0, 0.1960784, 1,
1.830598, 0.7712273, 0.3657903, 1, 0, 0.1921569, 1,
1.842216, -1.124009, 3.665192, 1, 0, 0.1843137, 1,
1.849574, 0.313477, 1.151276, 1, 0, 0.1803922, 1,
1.864188, 1.340584, 2.095917, 1, 0, 0.172549, 1,
1.886899, 0.08224987, 1.98231, 1, 0, 0.1686275, 1,
1.888572, -0.08065263, 1.344781, 1, 0, 0.1607843, 1,
1.905735, -0.3487158, 1.235976, 1, 0, 0.1568628, 1,
1.908925, -0.3303704, -0.4862629, 1, 0, 0.1490196, 1,
1.924127, 0.8238345, 0.6278461, 1, 0, 0.145098, 1,
1.924533, -0.08405598, 2.542803, 1, 0, 0.1372549, 1,
1.932844, 1.014692, 0.3929101, 1, 0, 0.1333333, 1,
1.934514, 0.7111461, 0.7136058, 1, 0, 0.1254902, 1,
1.939313, 0.316648, 2.557431, 1, 0, 0.1215686, 1,
1.952381, -2.157942, 0.8733765, 1, 0, 0.1137255, 1,
1.961891, -1.669032, 0.8204958, 1, 0, 0.1098039, 1,
1.972114, 1.257928, -1.851092, 1, 0, 0.1019608, 1,
2.005654, -0.01728752, 2.463799, 1, 0, 0.09411765, 1,
2.013676, -0.1995828, 1.900108, 1, 0, 0.09019608, 1,
2.016995, -0.7249849, 1.261968, 1, 0, 0.08235294, 1,
2.034705, -1.511491, 2.738129, 1, 0, 0.07843138, 1,
2.036757, -0.7243187, 1.951377, 1, 0, 0.07058824, 1,
2.064009, -0.1396275, 2.252902, 1, 0, 0.06666667, 1,
2.065504, 1.033436, -0.4265852, 1, 0, 0.05882353, 1,
2.123291, 1.774516, 2.184761, 1, 0, 0.05490196, 1,
2.232154, -0.03910549, 1.23294, 1, 0, 0.04705882, 1,
2.269452, -0.3420038, 1.536873, 1, 0, 0.04313726, 1,
2.293082, 1.119511, 0.2967093, 1, 0, 0.03529412, 1,
2.31805, -0.5105669, 2.956182, 1, 0, 0.03137255, 1,
2.345847, 0.8988519, 0.5847159, 1, 0, 0.02352941, 1,
2.421272, 0.5743874, 0.3349177, 1, 0, 0.01960784, 1,
2.523836, -0.3589198, 0.9005902, 1, 0, 0.01176471, 1,
3.58681, -0.7632749, 0.7226063, 1, 0, 0.007843138, 1
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
0.08797407, -3.87171, -6.898448, 0, -0.5, 0.5, 0.5,
0.08797407, -3.87171, -6.898448, 1, -0.5, 0.5, 0.5,
0.08797407, -3.87171, -6.898448, 1, 1.5, 0.5, 0.5,
0.08797407, -3.87171, -6.898448, 0, 1.5, 0.5, 0.5
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
-4.596967, 0.2055979, -6.898448, 0, -0.5, 0.5, 0.5,
-4.596967, 0.2055979, -6.898448, 1, -0.5, 0.5, 0.5,
-4.596967, 0.2055979, -6.898448, 1, 1.5, 0.5, 0.5,
-4.596967, 0.2055979, -6.898448, 0, 1.5, 0.5, 0.5
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
-4.596967, -3.87171, 0.1636779, 0, -0.5, 0.5, 0.5,
-4.596967, -3.87171, 0.1636779, 1, -0.5, 0.5, 0.5,
-4.596967, -3.87171, 0.1636779, 1, 1.5, 0.5, 0.5,
-4.596967, -3.87171, 0.1636779, 0, 1.5, 0.5, 0.5
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
-3, -2.930793, -5.268726,
3, -2.930793, -5.268726,
-3, -2.930793, -5.268726,
-3, -3.087612, -5.540346,
-2, -2.930793, -5.268726,
-2, -3.087612, -5.540346,
-1, -2.930793, -5.268726,
-1, -3.087612, -5.540346,
0, -2.930793, -5.268726,
0, -3.087612, -5.540346,
1, -2.930793, -5.268726,
1, -3.087612, -5.540346,
2, -2.930793, -5.268726,
2, -3.087612, -5.540346,
3, -2.930793, -5.268726,
3, -3.087612, -5.540346
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
-3, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
-3, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
-3, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
-3, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
-2, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
-2, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
-2, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
-2, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
-1, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
-1, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
-1, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
-1, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
0, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
0, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
0, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
0, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
1, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
1, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
1, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
1, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
2, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
2, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
2, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
2, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5,
3, -3.401252, -6.083587, 0, -0.5, 0.5, 0.5,
3, -3.401252, -6.083587, 1, -0.5, 0.5, 0.5,
3, -3.401252, -6.083587, 1, 1.5, 0.5, 0.5,
3, -3.401252, -6.083587, 0, 1.5, 0.5, 0.5
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
-3.515827, -2, -5.268726,
-3.515827, 3, -5.268726,
-3.515827, -2, -5.268726,
-3.696017, -2, -5.540346,
-3.515827, -1, -5.268726,
-3.696017, -1, -5.540346,
-3.515827, 0, -5.268726,
-3.696017, 0, -5.540346,
-3.515827, 1, -5.268726,
-3.696017, 1, -5.540346,
-3.515827, 2, -5.268726,
-3.696017, 2, -5.540346,
-3.515827, 3, -5.268726,
-3.696017, 3, -5.540346
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
-4.056397, -2, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, -2, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, -2, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, -2, -6.083587, 0, 1.5, 0.5, 0.5,
-4.056397, -1, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, -1, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, -1, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, -1, -6.083587, 0, 1.5, 0.5, 0.5,
-4.056397, 0, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, 0, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, 0, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, 0, -6.083587, 0, 1.5, 0.5, 0.5,
-4.056397, 1, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, 1, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, 1, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, 1, -6.083587, 0, 1.5, 0.5, 0.5,
-4.056397, 2, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, 2, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, 2, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, 2, -6.083587, 0, 1.5, 0.5, 0.5,
-4.056397, 3, -6.083587, 0, -0.5, 0.5, 0.5,
-4.056397, 3, -6.083587, 1, -0.5, 0.5, 0.5,
-4.056397, 3, -6.083587, 1, 1.5, 0.5, 0.5,
-4.056397, 3, -6.083587, 0, 1.5, 0.5, 0.5
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
-3.515827, -2.930793, -4,
-3.515827, -2.930793, 4,
-3.515827, -2.930793, -4,
-3.696017, -3.087612, -4,
-3.515827, -2.930793, -2,
-3.696017, -3.087612, -2,
-3.515827, -2.930793, 0,
-3.696017, -3.087612, 0,
-3.515827, -2.930793, 2,
-3.696017, -3.087612, 2,
-3.515827, -2.930793, 4,
-3.696017, -3.087612, 4
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
-4.056397, -3.401252, -4, 0, -0.5, 0.5, 0.5,
-4.056397, -3.401252, -4, 1, -0.5, 0.5, 0.5,
-4.056397, -3.401252, -4, 1, 1.5, 0.5, 0.5,
-4.056397, -3.401252, -4, 0, 1.5, 0.5, 0.5,
-4.056397, -3.401252, -2, 0, -0.5, 0.5, 0.5,
-4.056397, -3.401252, -2, 1, -0.5, 0.5, 0.5,
-4.056397, -3.401252, -2, 1, 1.5, 0.5, 0.5,
-4.056397, -3.401252, -2, 0, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 0, 0, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 0, 1, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 0, 1, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 0, 0, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 2, 0, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 2, 1, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 2, 1, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 2, 0, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 4, 0, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 4, 1, -0.5, 0.5, 0.5,
-4.056397, -3.401252, 4, 1, 1.5, 0.5, 0.5,
-4.056397, -3.401252, 4, 0, 1.5, 0.5, 0.5
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
-3.515827, -2.930793, -5.268726,
-3.515827, 3.341989, -5.268726,
-3.515827, -2.930793, 5.596082,
-3.515827, 3.341989, 5.596082,
-3.515827, -2.930793, -5.268726,
-3.515827, -2.930793, 5.596082,
-3.515827, 3.341989, -5.268726,
-3.515827, 3.341989, 5.596082,
-3.515827, -2.930793, -5.268726,
3.691775, -2.930793, -5.268726,
-3.515827, -2.930793, 5.596082,
3.691775, -2.930793, 5.596082,
-3.515827, 3.341989, -5.268726,
3.691775, 3.341989, -5.268726,
-3.515827, 3.341989, 5.596082,
3.691775, 3.341989, 5.596082,
3.691775, -2.930793, -5.268726,
3.691775, 3.341989, -5.268726,
3.691775, -2.930793, 5.596082,
3.691775, 3.341989, 5.596082,
3.691775, -2.930793, -5.268726,
3.691775, -2.930793, 5.596082,
3.691775, 3.341989, -5.268726,
3.691775, 3.341989, 5.596082
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
var radius = 7.72597;
var distance = 34.37371;
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
mvMatrix.translate( -0.08797407, -0.2055979, -0.1636779 );
mvMatrix.scale( 1.15898, 1.331701, 0.7688557 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.37371);
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
fenvalerate<-read.table("fenvalerate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenvalerate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
y<-fenvalerate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
z<-fenvalerate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
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
-3.410862, -1.628948, -2.494107, 0, 0, 1, 1, 1,
-2.753182, -0.2644191, -1.115131, 1, 0, 0, 1, 1,
-2.723289, 0.8659602, -1.7385, 1, 0, 0, 1, 1,
-2.714276, -1.445965, -0.08097894, 1, 0, 0, 1, 1,
-2.699372, -2.375274, -1.215988, 1, 0, 0, 1, 1,
-2.697531, -2.358604, -2.848017, 1, 0, 0, 1, 1,
-2.630579, 0.933719, -0.160275, 0, 0, 0, 1, 1,
-2.595498, -0.1975073, -3.449558, 0, 0, 0, 1, 1,
-2.522784, -0.9812762, -2.410726, 0, 0, 0, 1, 1,
-2.502522, -1.178375, -0.4766593, 0, 0, 0, 1, 1,
-2.376335, 1.003032, -2.027306, 0, 0, 0, 1, 1,
-2.368687, -1.866545, -1.619933, 0, 0, 0, 1, 1,
-2.348311, 1.097807, -0.2395232, 0, 0, 0, 1, 1,
-2.299275, 2.313986, -1.301306, 1, 1, 1, 1, 1,
-2.266089, 0.1909707, -0.9411653, 1, 1, 1, 1, 1,
-2.251165, -0.5693676, 0.1958918, 1, 1, 1, 1, 1,
-2.236845, 0.8869349, -0.7078544, 1, 1, 1, 1, 1,
-2.235823, 2.213404, -1.361978, 1, 1, 1, 1, 1,
-2.229056, -1.641626, -2.462732, 1, 1, 1, 1, 1,
-2.227273, 0.9069148, -1.374825, 1, 1, 1, 1, 1,
-2.16146, -0.7344836, -4.008584, 1, 1, 1, 1, 1,
-2.150503, -0.3566875, -2.093414, 1, 1, 1, 1, 1,
-2.097225, 0.1876531, -0.4598439, 1, 1, 1, 1, 1,
-2.040826, -2.544325, -2.735634, 1, 1, 1, 1, 1,
-2.02281, 0.6182799, 0.3437741, 1, 1, 1, 1, 1,
-2.015182, -0.2263369, -2.313215, 1, 1, 1, 1, 1,
-1.993731, 0.3900175, -1.263253, 1, 1, 1, 1, 1,
-1.987033, 0.1159045, -2.253501, 1, 1, 1, 1, 1,
-1.943213, 0.4642006, -1.306224, 0, 0, 1, 1, 1,
-1.911, 1.129897, -0.7425525, 1, 0, 0, 1, 1,
-1.880989, 1.515572, 0.2950707, 1, 0, 0, 1, 1,
-1.867828, -0.3550218, -1.628583, 1, 0, 0, 1, 1,
-1.856004, -0.1152874, -0.7984725, 1, 0, 0, 1, 1,
-1.826538, -0.8072706, 0.3175331, 1, 0, 0, 1, 1,
-1.823628, -1.107989, -1.760088, 0, 0, 0, 1, 1,
-1.819552, -0.2298993, -3.385839, 0, 0, 0, 1, 1,
-1.817799, -0.07972308, -0.3613441, 0, 0, 0, 1, 1,
-1.805598, -0.5640579, 0.7651992, 0, 0, 0, 1, 1,
-1.802208, -0.9900242, -2.40438, 0, 0, 0, 1, 1,
-1.791101, 0.6762893, -1.761496, 0, 0, 0, 1, 1,
-1.787512, -0.4703288, -0.8895249, 0, 0, 0, 1, 1,
-1.761094, 0.9369045, -1.387601, 1, 1, 1, 1, 1,
-1.760807, -0.9081448, -3.707864, 1, 1, 1, 1, 1,
-1.741883, -0.3964452, -2.947854, 1, 1, 1, 1, 1,
-1.741388, -0.6391375, -0.5069528, 1, 1, 1, 1, 1,
-1.729704, 0.2455131, -0.9571778, 1, 1, 1, 1, 1,
-1.715676, 1.065227, -0.7163689, 1, 1, 1, 1, 1,
-1.710645, -1.295801, -1.653564, 1, 1, 1, 1, 1,
-1.6817, -0.8362991, -3.178377, 1, 1, 1, 1, 1,
-1.661544, -0.01552342, -2.957505, 1, 1, 1, 1, 1,
-1.655205, 0.2226362, -1.054912, 1, 1, 1, 1, 1,
-1.653149, 1.188015, -0.9794099, 1, 1, 1, 1, 1,
-1.646257, -0.8014321, -4.275629, 1, 1, 1, 1, 1,
-1.636707, 1.439633, 0.5859582, 1, 1, 1, 1, 1,
-1.635618, -0.1384742, -2.600516, 1, 1, 1, 1, 1,
-1.627969, 0.5215454, -2.617878, 1, 1, 1, 1, 1,
-1.625696, -0.4342379, -1.11595, 0, 0, 1, 1, 1,
-1.623642, 1.170011, -2.330029, 1, 0, 0, 1, 1,
-1.619628, -0.523342, -2.433968, 1, 0, 0, 1, 1,
-1.617949, -0.8305297, -2.482213, 1, 0, 0, 1, 1,
-1.615098, 0.4615422, -0.9998267, 1, 0, 0, 1, 1,
-1.604249, 0.1841019, -1.741679, 1, 0, 0, 1, 1,
-1.581896, 0.6665082, -0.7606892, 0, 0, 0, 1, 1,
-1.572459, 0.04010475, -1.828147, 0, 0, 0, 1, 1,
-1.561166, 0.8896753, -1.401827, 0, 0, 0, 1, 1,
-1.538753, -0.4586653, -1.831918, 0, 0, 0, 1, 1,
-1.525454, 0.6108302, 0.01057719, 0, 0, 0, 1, 1,
-1.512295, -1.169232, -3.168486, 0, 0, 0, 1, 1,
-1.497541, 0.5513262, -2.172688, 0, 0, 0, 1, 1,
-1.482129, 1.876724, -0.841272, 1, 1, 1, 1, 1,
-1.46738, 0.2362469, -2.404924, 1, 1, 1, 1, 1,
-1.434529, 2.988148, -1.415059, 1, 1, 1, 1, 1,
-1.430402, 0.3451133, -0.02060579, 1, 1, 1, 1, 1,
-1.425117, -1.005493, -2.175722, 1, 1, 1, 1, 1,
-1.42287, 0.4934559, -1.554345, 1, 1, 1, 1, 1,
-1.42242, 0.2086344, -1.648042, 1, 1, 1, 1, 1,
-1.415935, -1.151205, -1.015444, 1, 1, 1, 1, 1,
-1.407555, 0.5945318, -1.139281, 1, 1, 1, 1, 1,
-1.400435, 0.05881683, -0.6441768, 1, 1, 1, 1, 1,
-1.391136, 0.840985, -1.980239, 1, 1, 1, 1, 1,
-1.390647, -0.2914197, -2.454651, 1, 1, 1, 1, 1,
-1.384692, 1.576395, -0.4871166, 1, 1, 1, 1, 1,
-1.384537, -1.362046, -3.544509, 1, 1, 1, 1, 1,
-1.358019, 0.7163812, -0.7861391, 1, 1, 1, 1, 1,
-1.357852, 2.04283, -3.38985, 0, 0, 1, 1, 1,
-1.357514, 0.4872386, -1.175379, 1, 0, 0, 1, 1,
-1.349577, 0.7120723, -1.024564, 1, 0, 0, 1, 1,
-1.347344, 0.8530291, -2.321956, 1, 0, 0, 1, 1,
-1.345801, -1.019865, -1.057833, 1, 0, 0, 1, 1,
-1.34041, -1.361392, -1.291297, 1, 0, 0, 1, 1,
-1.328705, 0.01093884, -1.780784, 0, 0, 0, 1, 1,
-1.320421, 0.05427154, -2.380601, 0, 0, 0, 1, 1,
-1.313951, 0.7656679, -0.9823522, 0, 0, 0, 1, 1,
-1.307883, -0.4960369, -2.163519, 0, 0, 0, 1, 1,
-1.298415, -1.157429, -1.915812, 0, 0, 0, 1, 1,
-1.285049, -0.2728155, -1.845424, 0, 0, 0, 1, 1,
-1.282, 0.5506806, -1.748214, 0, 0, 0, 1, 1,
-1.276293, 2.206931, -0.6787469, 1, 1, 1, 1, 1,
-1.27338, -0.4202017, -2.894186, 1, 1, 1, 1, 1,
-1.27308, 3.250638, -0.5790755, 1, 1, 1, 1, 1,
-1.268843, -0.3585025, -2.352903, 1, 1, 1, 1, 1,
-1.268796, 2.262328, -0.7220479, 1, 1, 1, 1, 1,
-1.268093, 0.03367963, -1.86943, 1, 1, 1, 1, 1,
-1.263869, 0.8944886, 1.128729, 1, 1, 1, 1, 1,
-1.263864, 0.05093812, -1.811894, 1, 1, 1, 1, 1,
-1.257998, 0.4045152, -0.202501, 1, 1, 1, 1, 1,
-1.25435, 0.1765647, -0.2409699, 1, 1, 1, 1, 1,
-1.241211, -0.4220004, -1.965619, 1, 1, 1, 1, 1,
-1.240298, -1.8055, -3.804039, 1, 1, 1, 1, 1,
-1.239316, -1.912662, -4.871311, 1, 1, 1, 1, 1,
-1.231099, -1.069917, -3.093887, 1, 1, 1, 1, 1,
-1.198198, -1.321244, -2.353168, 1, 1, 1, 1, 1,
-1.196697, -0.2047484, -2.206357, 0, 0, 1, 1, 1,
-1.194027, 0.5922149, -0.8005937, 1, 0, 0, 1, 1,
-1.192032, 1.174688, -0.07509819, 1, 0, 0, 1, 1,
-1.188857, -0.6119542, -0.9523364, 1, 0, 0, 1, 1,
-1.183416, -1.473833, -3.540993, 1, 0, 0, 1, 1,
-1.161698, -0.440717, -0.4516369, 1, 0, 0, 1, 1,
-1.152679, -1.138712, -3.808955, 0, 0, 0, 1, 1,
-1.144005, 1.014959, -0.3836273, 0, 0, 0, 1, 1,
-1.138607, 0.1899188, -1.750641, 0, 0, 0, 1, 1,
-1.13281, 0.2719096, -1.410688, 0, 0, 0, 1, 1,
-1.132767, 0.6231571, -0.9972799, 0, 0, 0, 1, 1,
-1.131834, 0.6576065, -1.640759, 0, 0, 0, 1, 1,
-1.121433, -1.477267, -3.100785, 0, 0, 0, 1, 1,
-1.116297, 0.6092758, -1.205977, 1, 1, 1, 1, 1,
-1.11127, -0.8786805, -2.808797, 1, 1, 1, 1, 1,
-1.108365, 1.225121, 0.6243915, 1, 1, 1, 1, 1,
-1.108355, 0.1910906, -1.645263, 1, 1, 1, 1, 1,
-1.106292, -0.328857, -0.9355311, 1, 1, 1, 1, 1,
-1.104174, -2.553416, -2.577474, 1, 1, 1, 1, 1,
-1.101004, 1.544473, -2.800987, 1, 1, 1, 1, 1,
-1.093673, 1.402197, -0.3358854, 1, 1, 1, 1, 1,
-1.091337, -0.07182088, -1.3963, 1, 1, 1, 1, 1,
-1.079845, 1.772311, -1.382492, 1, 1, 1, 1, 1,
-1.078232, -0.7054937, -2.408789, 1, 1, 1, 1, 1,
-1.077453, 0.2246403, -3.940483, 1, 1, 1, 1, 1,
-1.073265, 0.0555877, -2.395411, 1, 1, 1, 1, 1,
-1.071717, -0.8333652, -2.824009, 1, 1, 1, 1, 1,
-1.06894, -1.254599, -2.851281, 1, 1, 1, 1, 1,
-1.06715, 1.12457, 0.8851198, 0, 0, 1, 1, 1,
-1.067007, -0.3668928, -1.937205, 1, 0, 0, 1, 1,
-1.053888, -0.1134701, -1.911679, 1, 0, 0, 1, 1,
-1.044745, 0.1420157, -0.4277223, 1, 0, 0, 1, 1,
-1.041868, 0.3707935, -0.05658833, 1, 0, 0, 1, 1,
-1.04031, -0.8949295, -1.542633, 1, 0, 0, 1, 1,
-1.037533, -0.4903314, -2.391764, 0, 0, 0, 1, 1,
-1.037058, 1.149343, -0.8129103, 0, 0, 0, 1, 1,
-1.035441, 0.8053852, 0.1221737, 0, 0, 0, 1, 1,
-1.032917, -0.4253844, -1.269903, 0, 0, 0, 1, 1,
-1.029063, -0.2342386, -1.953956, 0, 0, 0, 1, 1,
-1.026152, 2.193545, 0.6143683, 0, 0, 0, 1, 1,
-1.024279, 0.319335, 0.02170357, 0, 0, 0, 1, 1,
-1.022527, 1.176243, -1.16555, 1, 1, 1, 1, 1,
-1.01335, 1.35702, -0.06426005, 1, 1, 1, 1, 1,
-1.010828, 0.6061814, -3.760679, 1, 1, 1, 1, 1,
-1.009893, 0.4277935, -0.4013016, 1, 1, 1, 1, 1,
-1.009559, 0.9910485, -0.7989677, 1, 1, 1, 1, 1,
-1.009465, 1.077909, -1.373285, 1, 1, 1, 1, 1,
-1.006559, -0.06429554, -2.644032, 1, 1, 1, 1, 1,
-1.00565, -0.9545701, -3.511836, 1, 1, 1, 1, 1,
-1.000046, 1.074751, -1.091581, 1, 1, 1, 1, 1,
-0.999651, -0.9674438, -3.456214, 1, 1, 1, 1, 1,
-0.9988084, 0.009383262, -1.782875, 1, 1, 1, 1, 1,
-0.9962536, 1.497, 0.535348, 1, 1, 1, 1, 1,
-0.9935328, -1.665628, -3.839852, 1, 1, 1, 1, 1,
-0.9895157, 0.2604983, -1.336007, 1, 1, 1, 1, 1,
-0.9879356, 0.01413484, -2.028497, 1, 1, 1, 1, 1,
-0.9834176, -0.5935673, -2.522913, 0, 0, 1, 1, 1,
-0.9811709, 1.8122, 0.3304904, 1, 0, 0, 1, 1,
-0.9780472, 2.117745, -0.2651266, 1, 0, 0, 1, 1,
-0.9777308, 0.4102419, -2.16275, 1, 0, 0, 1, 1,
-0.9750118, -2.839442, -0.8699315, 1, 0, 0, 1, 1,
-0.9726576, -1.190871, -2.83794, 1, 0, 0, 1, 1,
-0.9726514, 0.001450664, -1.566467, 0, 0, 0, 1, 1,
-0.9512281, 0.7765754, -3.313042, 0, 0, 0, 1, 1,
-0.9510099, -0.6112369, -4.18959, 0, 0, 0, 1, 1,
-0.9498605, 1.654171, -1.022176, 0, 0, 0, 1, 1,
-0.9447162, 1.359265, -0.945277, 0, 0, 0, 1, 1,
-0.9446782, 2.057518, 0.5015284, 0, 0, 0, 1, 1,
-0.9403294, -0.4712374, -0.5859006, 0, 0, 0, 1, 1,
-0.9380904, 2.304471, -3.396199, 1, 1, 1, 1, 1,
-0.9324887, 2.423037, -0.0801983, 1, 1, 1, 1, 1,
-0.9316521, 0.7446809, -0.6279244, 1, 1, 1, 1, 1,
-0.9204012, 0.2877841, -1.821971, 1, 1, 1, 1, 1,
-0.9200103, 2.485654, 0.876242, 1, 1, 1, 1, 1,
-0.9196633, -0.5922714, -3.376864, 1, 1, 1, 1, 1,
-0.91726, 0.4514222, -1.277072, 1, 1, 1, 1, 1,
-0.9152266, 1.456342, -2.240824, 1, 1, 1, 1, 1,
-0.9092351, 0.9410702, 0.3807136, 1, 1, 1, 1, 1,
-0.9068674, 2.836562, -1.070715, 1, 1, 1, 1, 1,
-0.9057332, -1.801618, -3.608971, 1, 1, 1, 1, 1,
-0.8918149, 1.836006, 0.5685546, 1, 1, 1, 1, 1,
-0.8881845, -2.227404, -1.454946, 1, 1, 1, 1, 1,
-0.8770652, 0.1048636, -1.477755, 1, 1, 1, 1, 1,
-0.8618197, -0.284022, -0.9679407, 1, 1, 1, 1, 1,
-0.8611479, -1.927371, -2.818786, 0, 0, 1, 1, 1,
-0.8608667, -0.696965, -1.932158, 1, 0, 0, 1, 1,
-0.8560094, -1.267508, -3.10047, 1, 0, 0, 1, 1,
-0.8538625, -1.104935, -3.192101, 1, 0, 0, 1, 1,
-0.8536929, 0.4984834, -3.087574, 1, 0, 0, 1, 1,
-0.8435157, 1.448722, -2.66179, 1, 0, 0, 1, 1,
-0.8412918, 1.272778, -0.1022764, 0, 0, 0, 1, 1,
-0.8347239, 0.4380316, -0.9208456, 0, 0, 0, 1, 1,
-0.8339681, 2.172532, -0.524159, 0, 0, 0, 1, 1,
-0.8323951, -0.8428487, -1.188453, 0, 0, 0, 1, 1,
-0.8266845, 0.5548648, -0.7075725, 0, 0, 0, 1, 1,
-0.8181486, 0.09147172, -2.430965, 0, 0, 0, 1, 1,
-0.8170435, -0.6166341, -2.146927, 0, 0, 0, 1, 1,
-0.8106491, 0.1732643, -1.489569, 1, 1, 1, 1, 1,
-0.8102271, -1.245598, -4.723816, 1, 1, 1, 1, 1,
-0.8099321, -1.838687, -2.707187, 1, 1, 1, 1, 1,
-0.8077494, -1.033347, -3.777347, 1, 1, 1, 1, 1,
-0.797924, -0.50547, -2.538327, 1, 1, 1, 1, 1,
-0.7940229, -0.3973528, -2.410956, 1, 1, 1, 1, 1,
-0.7897826, 1.516646, -0.04467852, 1, 1, 1, 1, 1,
-0.7814018, 0.01144174, -1.997993, 1, 1, 1, 1, 1,
-0.7808866, -1.275953, -2.019403, 1, 1, 1, 1, 1,
-0.7736346, 0.04115044, -1.392715, 1, 1, 1, 1, 1,
-0.7708957, 1.017079, 0.247788, 1, 1, 1, 1, 1,
-0.7661048, -0.8658903, -3.103438, 1, 1, 1, 1, 1,
-0.7656993, -0.577659, -1.620382, 1, 1, 1, 1, 1,
-0.7611777, 0.5067894, -0.4968097, 1, 1, 1, 1, 1,
-0.7611725, -0.09137871, -2.948652, 1, 1, 1, 1, 1,
-0.7606183, -0.1356864, -2.570174, 0, 0, 1, 1, 1,
-0.7518632, -0.3447417, -1.833476, 1, 0, 0, 1, 1,
-0.7469645, -0.1256223, -0.7883243, 1, 0, 0, 1, 1,
-0.7463363, 0.499386, -1.520869, 1, 0, 0, 1, 1,
-0.7421501, -1.413176, -1.886287, 1, 0, 0, 1, 1,
-0.7353979, -0.01733383, -0.6200169, 1, 0, 0, 1, 1,
-0.7330254, -0.7418647, -1.656155, 0, 0, 0, 1, 1,
-0.7283493, 1.86213, 0.4370816, 0, 0, 0, 1, 1,
-0.7274556, 1.147724, 0.6258375, 0, 0, 0, 1, 1,
-0.7200661, 0.04812787, -1.817914, 0, 0, 0, 1, 1,
-0.7172834, -0.7458794, -2.000793, 0, 0, 0, 1, 1,
-0.7169194, 1.702644, -2.122475, 0, 0, 0, 1, 1,
-0.7167048, -0.2834157, -0.4405408, 0, 0, 0, 1, 1,
-0.7152078, -1.716943, -2.666174, 1, 1, 1, 1, 1,
-0.7119961, -0.5802263, -2.977125, 1, 1, 1, 1, 1,
-0.7107106, 0.4765399, 0.255479, 1, 1, 1, 1, 1,
-0.7036816, 0.9777594, -0.8454785, 1, 1, 1, 1, 1,
-0.7035976, -0.3092901, -1.253163, 1, 1, 1, 1, 1,
-0.7011585, 0.6770887, 1.54982, 1, 1, 1, 1, 1,
-0.6997878, -1.361731, -2.468801, 1, 1, 1, 1, 1,
-0.6981812, -0.9619194, -0.6161327, 1, 1, 1, 1, 1,
-0.6943834, -0.5217643, -1.388502, 1, 1, 1, 1, 1,
-0.6925519, 1.39759, 0.1410153, 1, 1, 1, 1, 1,
-0.6899385, -0.6223197, -2.190248, 1, 1, 1, 1, 1,
-0.6888359, -0.6226389, -2.725278, 1, 1, 1, 1, 1,
-0.6881386, 0.8558817, -0.6758728, 1, 1, 1, 1, 1,
-0.685304, -0.5910141, -1.896881, 1, 1, 1, 1, 1,
-0.6802356, 0.4916503, -2.76608, 1, 1, 1, 1, 1,
-0.6760762, 1.474234, 0.6349461, 0, 0, 1, 1, 1,
-0.6625749, -0.7214284, -4.186428, 1, 0, 0, 1, 1,
-0.6616403, -0.530896, -1.405575, 1, 0, 0, 1, 1,
-0.6567335, 0.8972272, -0.04230065, 1, 0, 0, 1, 1,
-0.6559753, 0.3805924, 1.30601, 1, 0, 0, 1, 1,
-0.6548146, -0.5294486, -2.381351, 1, 0, 0, 1, 1,
-0.6513523, -1.324214, -3.14973, 0, 0, 0, 1, 1,
-0.6501544, -0.2787182, -2.173762, 0, 0, 0, 1, 1,
-0.6437246, 1.923915, 0.2057668, 0, 0, 0, 1, 1,
-0.6401155, 1.916297, 0.9527653, 0, 0, 0, 1, 1,
-0.6301745, 2.216551, -0.4816019, 0, 0, 0, 1, 1,
-0.6298193, -0.4374179, -2.159694, 0, 0, 0, 1, 1,
-0.6292303, 0.3509972, -0.5667623, 0, 0, 0, 1, 1,
-0.6249259, 1.363031, -0.5415403, 1, 1, 1, 1, 1,
-0.6211597, 0.3168465, -1.966165, 1, 1, 1, 1, 1,
-0.6135479, -1.108949, -0.7408026, 1, 1, 1, 1, 1,
-0.6118389, -0.6608912, -2.872414, 1, 1, 1, 1, 1,
-0.6105152, 0.6202734, -0.8123261, 1, 1, 1, 1, 1,
-0.6090465, 0.988447, -2.082959, 1, 1, 1, 1, 1,
-0.6076827, -0.7961729, -5.110501, 1, 1, 1, 1, 1,
-0.6051859, 1.93388, -0.7814013, 1, 1, 1, 1, 1,
-0.6050553, 0.02638996, 0.2337709, 1, 1, 1, 1, 1,
-0.6048191, -0.7562616, -2.577642, 1, 1, 1, 1, 1,
-0.6027513, 1.558226, 0.135467, 1, 1, 1, 1, 1,
-0.6019769, -0.5263037, -2.653814, 1, 1, 1, 1, 1,
-0.6015096, -0.6781073, -3.25703, 1, 1, 1, 1, 1,
-0.590849, 1.071362, -0.004454325, 1, 1, 1, 1, 1,
-0.5805267, -0.5416583, -3.538917, 1, 1, 1, 1, 1,
-0.5797123, 0.7723547, 0.8807396, 0, 0, 1, 1, 1,
-0.5712216, 0.1067228, -2.344263, 1, 0, 0, 1, 1,
-0.5704128, 0.4786648, -1.607141, 1, 0, 0, 1, 1,
-0.5680169, 0.1596873, -1.586218, 1, 0, 0, 1, 1,
-0.5660707, 0.5790375, -0.09296066, 1, 0, 0, 1, 1,
-0.564276, -0.5651006, -3.485456, 1, 0, 0, 1, 1,
-0.56398, -0.3846067, -1.509627, 0, 0, 0, 1, 1,
-0.5633201, 0.5477668, 0.5278879, 0, 0, 0, 1, 1,
-0.5629812, -0.5292428, -2.8318, 0, 0, 0, 1, 1,
-0.5622932, -0.8937936, -2.545969, 0, 0, 0, 1, 1,
-0.5598341, -0.4805286, -2.795626, 0, 0, 0, 1, 1,
-0.5558149, 0.9398576, -1.406999, 0, 0, 0, 1, 1,
-0.5527329, 1.007299, 1.167673, 0, 0, 0, 1, 1,
-0.552227, -0.2880393, -1.470584, 1, 1, 1, 1, 1,
-0.5506139, -0.4006783, -3.540835, 1, 1, 1, 1, 1,
-0.5505149, 0.6593342, -2.888493, 1, 1, 1, 1, 1,
-0.5489654, 0.5327486, -0.4188775, 1, 1, 1, 1, 1,
-0.5470374, -0.3188896, -2.21517, 1, 1, 1, 1, 1,
-0.5451755, 0.9283933, -0.03820885, 1, 1, 1, 1, 1,
-0.5424599, 1.046595, 0.837421, 1, 1, 1, 1, 1,
-0.5366105, 0.4853214, -1.236986, 1, 1, 1, 1, 1,
-0.5224715, 1.020823, -1.526371, 1, 1, 1, 1, 1,
-0.521631, 0.8543687, -2.248576, 1, 1, 1, 1, 1,
-0.5103022, -0.7087431, -4.049259, 1, 1, 1, 1, 1,
-0.5053677, -0.8313754, -1.565997, 1, 1, 1, 1, 1,
-0.498708, 0.9053514, -0.4751481, 1, 1, 1, 1, 1,
-0.498604, 1.491536, -0.8443249, 1, 1, 1, 1, 1,
-0.4985749, 0.2002551, -1.521342, 1, 1, 1, 1, 1,
-0.4968423, -0.3600015, -1.752404, 0, 0, 1, 1, 1,
-0.4954277, 0.5452933, 2.003896, 1, 0, 0, 1, 1,
-0.4951545, -0.8216067, -3.108384, 1, 0, 0, 1, 1,
-0.4916491, 1.176886, 0.7277407, 1, 0, 0, 1, 1,
-0.4880997, 0.05834007, -1.957339, 1, 0, 0, 1, 1,
-0.4871322, -0.603883, -0.9878978, 1, 0, 0, 1, 1,
-0.4819014, -1.176781, -3.784647, 0, 0, 0, 1, 1,
-0.470769, -0.6014963, -2.01436, 0, 0, 0, 1, 1,
-0.4675952, 0.09873918, -1.560717, 0, 0, 0, 1, 1,
-0.4653211, 0.2859233, -1.401722, 0, 0, 0, 1, 1,
-0.4627025, -0.4871528, -0.9068149, 0, 0, 0, 1, 1,
-0.4595621, 0.6801603, -0.710946, 0, 0, 0, 1, 1,
-0.4561721, 0.5049703, -0.4765483, 0, 0, 0, 1, 1,
-0.4503776, -0.8881896, -2.640768, 1, 1, 1, 1, 1,
-0.4478632, 1.678373, -0.4274151, 1, 1, 1, 1, 1,
-0.4459749, -1.087685, -4.289145, 1, 1, 1, 1, 1,
-0.4420831, 0.4177223, -1.675089, 1, 1, 1, 1, 1,
-0.4400585, -0.7600932, -2.016018, 1, 1, 1, 1, 1,
-0.4391855, -0.4557782, -1.669396, 1, 1, 1, 1, 1,
-0.4311547, 0.6343718, -0.7098888, 1, 1, 1, 1, 1,
-0.4306197, 1.85382, 0.046036, 1, 1, 1, 1, 1,
-0.4276747, 0.01141645, -1.218114, 1, 1, 1, 1, 1,
-0.4265703, -0.3646546, -3.806266, 1, 1, 1, 1, 1,
-0.4263387, -0.4893278, -2.725877, 1, 1, 1, 1, 1,
-0.425723, 0.601765, -0.5478227, 1, 1, 1, 1, 1,
-0.4250607, -0.4370631, -3.557676, 1, 1, 1, 1, 1,
-0.4164963, 1.111025, -0.4847615, 1, 1, 1, 1, 1,
-0.409681, 0.4980415, -2.272447, 1, 1, 1, 1, 1,
-0.4087835, -0.3865936, -2.741173, 0, 0, 1, 1, 1,
-0.402228, 1.345306, -1.563393, 1, 0, 0, 1, 1,
-0.4020694, 0.4834427, -0.6987072, 1, 0, 0, 1, 1,
-0.3993474, 1.097332, -0.5366123, 1, 0, 0, 1, 1,
-0.3974696, -0.4096175, -3.815682, 1, 0, 0, 1, 1,
-0.3927394, 0.6215013, -1.074463, 1, 0, 0, 1, 1,
-0.3900576, -0.2475533, -1.116536, 0, 0, 0, 1, 1,
-0.3898818, 1.22618, -1.37062, 0, 0, 0, 1, 1,
-0.3892175, 0.2488688, -1.742737, 0, 0, 0, 1, 1,
-0.3873231, 1.002421, -1.15749, 0, 0, 0, 1, 1,
-0.3865907, 0.9621366, -1.003378, 0, 0, 0, 1, 1,
-0.3839852, 0.3850349, -1.254964, 0, 0, 0, 1, 1,
-0.3820128, 0.651049, -1.229907, 0, 0, 0, 1, 1,
-0.3753148, -1.301959, -1.456212, 1, 1, 1, 1, 1,
-0.3606743, 0.4939243, -0.406301, 1, 1, 1, 1, 1,
-0.3602678, -0.1779198, -1.515728, 1, 1, 1, 1, 1,
-0.3601901, 0.8338742, -0.3912401, 1, 1, 1, 1, 1,
-0.3567781, 0.7033218, -0.4260708, 1, 1, 1, 1, 1,
-0.3553423, 1.13523, 1.533799, 1, 1, 1, 1, 1,
-0.3551326, -2.285473, -3.487969, 1, 1, 1, 1, 1,
-0.3517444, -0.1930784, -2.155447, 1, 1, 1, 1, 1,
-0.3479398, 0.5850164, 0.6620069, 1, 1, 1, 1, 1,
-0.3346951, -1.022053, -3.188475, 1, 1, 1, 1, 1,
-0.3319143, 0.60962, 0.4604651, 1, 1, 1, 1, 1,
-0.3316428, -0.695888, -3.649058, 1, 1, 1, 1, 1,
-0.3288368, -0.4744805, -1.476314, 1, 1, 1, 1, 1,
-0.3284172, 1.220193, -0.1923421, 1, 1, 1, 1, 1,
-0.3275539, -0.4462076, -2.87332, 1, 1, 1, 1, 1,
-0.3259832, -0.4290774, -1.419332, 0, 0, 1, 1, 1,
-0.3228669, -2.19792, -2.991155, 1, 0, 0, 1, 1,
-0.3224054, 0.8748298, 0.03552913, 1, 0, 0, 1, 1,
-0.3212515, 1.199095, -0.5079854, 1, 0, 0, 1, 1,
-0.3207628, -0.193482, -2.341114, 1, 0, 0, 1, 1,
-0.3194256, -0.5551218, -3.486204, 1, 0, 0, 1, 1,
-0.3189722, -1.747766, -3.379947, 0, 0, 0, 1, 1,
-0.3085445, 1.201933, -1.218008, 0, 0, 0, 1, 1,
-0.3073369, 0.4024125, -1.765679, 0, 0, 0, 1, 1,
-0.3065076, 0.9735357, -0.03293939, 0, 0, 0, 1, 1,
-0.3051801, -0.9864379, -2.211946, 0, 0, 0, 1, 1,
-0.2997055, 0.130492, -0.6077666, 0, 0, 0, 1, 1,
-0.2996473, -0.2538181, -2.442664, 0, 0, 0, 1, 1,
-0.2981182, 1.187063, -0.6743752, 1, 1, 1, 1, 1,
-0.2972499, 2.796451, -1.38425, 1, 1, 1, 1, 1,
-0.2959343, 1.606602, 1.217061, 1, 1, 1, 1, 1,
-0.2955512, 1.44117, -0.08660787, 1, 1, 1, 1, 1,
-0.2939824, -0.1051532, -2.910112, 1, 1, 1, 1, 1,
-0.2932125, -1.046417, -2.90735, 1, 1, 1, 1, 1,
-0.2928411, 0.3385834, 1.306572, 1, 1, 1, 1, 1,
-0.2855559, -1.107492, -1.817598, 1, 1, 1, 1, 1,
-0.268479, 0.4986393, -1.810403, 1, 1, 1, 1, 1,
-0.267996, -1.652934, -2.720052, 1, 1, 1, 1, 1,
-0.2668017, 0.9900844, -1.637597, 1, 1, 1, 1, 1,
-0.2652866, 0.6600218, -1.166834, 1, 1, 1, 1, 1,
-0.2636766, -1.985328, -3.026595, 1, 1, 1, 1, 1,
-0.2631267, 0.8821537, 0.09467872, 1, 1, 1, 1, 1,
-0.2607391, -0.7173116, -2.109774, 1, 1, 1, 1, 1,
-0.2601193, 0.7186069, -0.7456691, 0, 0, 1, 1, 1,
-0.2493745, -1.502112, -2.612262, 1, 0, 0, 1, 1,
-0.2489334, -0.1104091, -0.1279749, 1, 0, 0, 1, 1,
-0.2422616, 1.269279, -0.8712555, 1, 0, 0, 1, 1,
-0.2418638, -0.1488663, -0.7106858, 1, 0, 0, 1, 1,
-0.2404445, -1.788058, -3.489351, 1, 0, 0, 1, 1,
-0.2393891, -1.758693, -2.227008, 0, 0, 0, 1, 1,
-0.2388777, -0.4852664, -3.29311, 0, 0, 0, 1, 1,
-0.2379681, -0.7988222, -3.81411, 0, 0, 0, 1, 1,
-0.2354974, 0.08857544, -0.972502, 0, 0, 0, 1, 1,
-0.2315363, 1.420522, -0.657133, 0, 0, 0, 1, 1,
-0.2253358, 0.3015152, -1.555353, 0, 0, 0, 1, 1,
-0.224917, -0.3350326, -3.570918, 0, 0, 0, 1, 1,
-0.2248063, -0.7897102, -0.1927084, 1, 1, 1, 1, 1,
-0.2209911, 0.9430233, -1.557533, 1, 1, 1, 1, 1,
-0.2203382, -0.8860492, -2.528403, 1, 1, 1, 1, 1,
-0.2158536, -0.8584993, -2.873826, 1, 1, 1, 1, 1,
-0.2141066, 0.2889784, -1.483556, 1, 1, 1, 1, 1,
-0.2086809, -0.9161862, -2.371717, 1, 1, 1, 1, 1,
-0.2059965, -0.348017, -3.162198, 1, 1, 1, 1, 1,
-0.2033327, 1.722448, 0.07187328, 1, 1, 1, 1, 1,
-0.2033006, -0.2535005, -2.478351, 1, 1, 1, 1, 1,
-0.2026953, -0.5259532, -2.489215, 1, 1, 1, 1, 1,
-0.1997705, -0.4396451, -1.069596, 1, 1, 1, 1, 1,
-0.1990106, -1.304976, -4.89705, 1, 1, 1, 1, 1,
-0.1956768, 1.071156, 0.9245912, 1, 1, 1, 1, 1,
-0.1891172, -1.030966, -3.175195, 1, 1, 1, 1, 1,
-0.1889638, -0.6127976, -1.901881, 1, 1, 1, 1, 1,
-0.1882106, 0.6329421, 0.7874233, 0, 0, 1, 1, 1,
-0.1866567, -0.472793, -1.460855, 1, 0, 0, 1, 1,
-0.1795927, -0.4072377, -1.842196, 1, 0, 0, 1, 1,
-0.1734823, 0.5675954, -1.000288, 1, 0, 0, 1, 1,
-0.1704198, 0.5085952, -4.198878, 1, 0, 0, 1, 1,
-0.1694181, -1.61815, -2.982251, 1, 0, 0, 1, 1,
-0.1682144, 1.702007, -0.5856656, 0, 0, 0, 1, 1,
-0.1679136, -1.881318, -4.499216, 0, 0, 0, 1, 1,
-0.1609599, -0.554578, -4.151955, 0, 0, 0, 1, 1,
-0.1597413, 0.758557, -0.7015486, 0, 0, 0, 1, 1,
-0.1594778, -0.6044581, -3.036718, 0, 0, 0, 1, 1,
-0.1593329, -0.1397128, -3.463362, 0, 0, 0, 1, 1,
-0.1582368, 0.1572017, -2.808436, 0, 0, 0, 1, 1,
-0.1552107, 1.105759, 1.046534, 1, 1, 1, 1, 1,
-0.152899, -1.189324, -2.555512, 1, 1, 1, 1, 1,
-0.1526531, 1.255596, -1.487774, 1, 1, 1, 1, 1,
-0.1512612, 1.334162, 0.2686228, 1, 1, 1, 1, 1,
-0.1445635, -0.6342092, -0.8290282, 1, 1, 1, 1, 1,
-0.1421899, 0.3528488, -0.2636021, 1, 1, 1, 1, 1,
-0.1409653, -1.286852, -3.553073, 1, 1, 1, 1, 1,
-0.1371387, -0.8372636, -3.97924, 1, 1, 1, 1, 1,
-0.1293485, 0.6027339, -0.6196872, 1, 1, 1, 1, 1,
-0.127372, 0.0614543, -0.9008349, 1, 1, 1, 1, 1,
-0.113436, -0.2254212, -2.593391, 1, 1, 1, 1, 1,
-0.1084382, 0.2398668, -0.6624635, 1, 1, 1, 1, 1,
-0.10761, 0.2809518, 0.09145685, 1, 1, 1, 1, 1,
-0.1053119, 0.03162159, -2.670405, 1, 1, 1, 1, 1,
-0.1033409, 0.6842746, -1.870921, 1, 1, 1, 1, 1,
-0.09824883, 1.098583, 0.3604521, 0, 0, 1, 1, 1,
-0.09598755, 0.3331739, 0.7956247, 1, 0, 0, 1, 1,
-0.09597392, -0.4469638, -4.45515, 1, 0, 0, 1, 1,
-0.09100363, 0.4900047, 0.7099382, 1, 0, 0, 1, 1,
-0.09041267, 0.9802681, -0.566791, 1, 0, 0, 1, 1,
-0.08989028, -0.06039092, -2.592224, 1, 0, 0, 1, 1,
-0.08716541, 0.1810345, -1.253911, 0, 0, 0, 1, 1,
-0.08707666, -0.7603835, -2.934801, 0, 0, 0, 1, 1,
-0.07926378, -0.06348621, -2.171375, 0, 0, 0, 1, 1,
-0.07836647, 1.532357, 1.420385, 0, 0, 0, 1, 1,
-0.07728235, 0.1045529, 0.3635504, 0, 0, 0, 1, 1,
-0.07256139, -1.251119, -2.719313, 0, 0, 0, 1, 1,
-0.06363948, -2.278854, -2.790906, 0, 0, 0, 1, 1,
-0.05874445, 0.1130688, -1.868011, 1, 1, 1, 1, 1,
-0.05476269, -0.3903499, -3.81129, 1, 1, 1, 1, 1,
-0.05205644, -1.376844, -3.556582, 1, 1, 1, 1, 1,
-0.0464628, 1.09376, -0.6500648, 1, 1, 1, 1, 1,
-0.04166816, -0.3226832, -0.9924464, 1, 1, 1, 1, 1,
-0.04026719, -1.568819, -2.557981, 1, 1, 1, 1, 1,
-0.03580922, -1.73944, -4.891999, 1, 1, 1, 1, 1,
-0.03036554, -0.3722147, -1.759324, 1, 1, 1, 1, 1,
-0.02768964, -0.517893, -4.005465, 1, 1, 1, 1, 1,
-0.02716368, -0.8609099, -2.715335, 1, 1, 1, 1, 1,
-0.02432131, -0.395797, -3.201207, 1, 1, 1, 1, 1,
-0.02198173, 0.5742588, -1.488353, 1, 1, 1, 1, 1,
-0.02097642, 1.656587, 0.5378724, 1, 1, 1, 1, 1,
-0.01618782, -0.19568, -4.548812, 1, 1, 1, 1, 1,
-0.01561432, -1.021503, -2.573066, 1, 1, 1, 1, 1,
-0.01491342, 0.7875513, 0.1701809, 0, 0, 1, 1, 1,
-0.01249858, -1.344209, -2.601813, 1, 0, 0, 1, 1,
-0.00999502, -1.360596, -3.034115, 1, 0, 0, 1, 1,
-0.003169467, -0.8142735, -3.881583, 1, 0, 0, 1, 1,
0.001740199, -1.379824, 3.914736, 1, 0, 0, 1, 1,
0.003516373, -1.464535, 2.738268, 1, 0, 0, 1, 1,
0.007231406, -1.028716, 1.00231, 0, 0, 0, 1, 1,
0.009359322, 0.09779376, -0.8546604, 0, 0, 0, 1, 1,
0.009935671, 0.3063642, 0.1819841, 0, 0, 0, 1, 1,
0.01089562, 0.4761509, 1.133582, 0, 0, 0, 1, 1,
0.01291902, 0.05829329, 0.1719824, 0, 0, 0, 1, 1,
0.01479704, 0.7027379, 0.2902971, 0, 0, 0, 1, 1,
0.0148702, -0.2879409, 3.261667, 0, 0, 0, 1, 1,
0.0172735, 0.3579473, -1.804009, 1, 1, 1, 1, 1,
0.01822805, -1.203428, 2.885664, 1, 1, 1, 1, 1,
0.01876841, 0.2361887, -2.008511, 1, 1, 1, 1, 1,
0.02006872, 0.5290021, -1.451439, 1, 1, 1, 1, 1,
0.02058096, 0.1025796, -1.457347, 1, 1, 1, 1, 1,
0.02207674, -0.7646157, 4.258201, 1, 1, 1, 1, 1,
0.02379246, -1.05728, 2.866139, 1, 1, 1, 1, 1,
0.02652544, 0.4073459, 0.3810406, 1, 1, 1, 1, 1,
0.02701197, 1.054685, -1.641504, 1, 1, 1, 1, 1,
0.02741903, 0.3120181, 0.1541681, 1, 1, 1, 1, 1,
0.03171869, -0.1417789, 3.423969, 1, 1, 1, 1, 1,
0.03289288, 0.8645176, -1.509571, 1, 1, 1, 1, 1,
0.03846363, -0.9959384, 3.509381, 1, 1, 1, 1, 1,
0.04079417, 0.5219943, 1.081574, 1, 1, 1, 1, 1,
0.04392369, -1.183383, 3.382027, 1, 1, 1, 1, 1,
0.04731673, -1.81644, 2.615641, 0, 0, 1, 1, 1,
0.04756513, -0.3643484, 2.083032, 1, 0, 0, 1, 1,
0.04773509, 2.292236, 0.6825476, 1, 0, 0, 1, 1,
0.04833301, 0.4929312, -0.6122708, 1, 0, 0, 1, 1,
0.04980117, -0.2942945, 3.65843, 1, 0, 0, 1, 1,
0.05007853, 0.5077777, 0.09320305, 1, 0, 0, 1, 1,
0.05219879, 0.550052, 0.2359348, 0, 0, 0, 1, 1,
0.05338433, 0.08757272, 2.815608, 0, 0, 0, 1, 1,
0.05496514, -1.416906, 3.948222, 0, 0, 0, 1, 1,
0.06005031, 0.4352458, -1.221759, 0, 0, 0, 1, 1,
0.06150085, 0.05148162, -1.295122, 0, 0, 0, 1, 1,
0.06173369, -0.2096503, 2.287927, 0, 0, 0, 1, 1,
0.06526378, -1.017083, 1.458716, 0, 0, 0, 1, 1,
0.06689237, 0.2095689, 0.7289429, 1, 1, 1, 1, 1,
0.07814587, -0.03603002, 4.120249, 1, 1, 1, 1, 1,
0.0784709, -0.8425299, 4.139239, 1, 1, 1, 1, 1,
0.07927629, 0.9143434, 1.193482, 1, 1, 1, 1, 1,
0.08005263, 2.026621, -1.17206, 1, 1, 1, 1, 1,
0.08136874, 0.7650096, -0.197608, 1, 1, 1, 1, 1,
0.08313917, -0.7499481, 2.219662, 1, 1, 1, 1, 1,
0.08381303, 0.7594107, -0.09866316, 1, 1, 1, 1, 1,
0.0854954, 0.4706808, 0.6638694, 1, 1, 1, 1, 1,
0.08759582, 0.6138018, 2.156013, 1, 1, 1, 1, 1,
0.08841023, 1.039241, -0.07083808, 1, 1, 1, 1, 1,
0.08902096, -0.3163552, 2.636437, 1, 1, 1, 1, 1,
0.08985373, -0.6143272, 2.443393, 1, 1, 1, 1, 1,
0.09104352, -1.70636, 4.203707, 1, 1, 1, 1, 1,
0.09239636, -0.2374489, 1.627268, 1, 1, 1, 1, 1,
0.09356318, -0.1624942, 1.651603, 0, 0, 1, 1, 1,
0.099757, 1.382298, -0.6505281, 1, 0, 0, 1, 1,
0.1006254, -0.3408136, 1.851568, 1, 0, 0, 1, 1,
0.1007862, -0.411463, 2.182559, 1, 0, 0, 1, 1,
0.1023063, 1.281147, -1.649654, 1, 0, 0, 1, 1,
0.10741, -0.6520739, 3.470467, 1, 0, 0, 1, 1,
0.1103033, 0.3815707, -1.528641, 0, 0, 0, 1, 1,
0.1105399, -0.3934512, 2.818335, 0, 0, 0, 1, 1,
0.1147666, 2.177196, 0.9507859, 0, 0, 0, 1, 1,
0.1147995, 0.5924699, 0.1667088, 0, 0, 0, 1, 1,
0.1177185, -0.3317957, 2.818592, 0, 0, 0, 1, 1,
0.1200747, -0.6543618, 3.614944, 0, 0, 0, 1, 1,
0.120418, 1.751105, 2.707664, 0, 0, 0, 1, 1,
0.121732, -0.8191974, 5.437857, 1, 1, 1, 1, 1,
0.1278775, 1.180246, 1.005705, 1, 1, 1, 1, 1,
0.1282236, 1.22874, 0.1595707, 1, 1, 1, 1, 1,
0.1292915, -0.08863062, 2.891674, 1, 1, 1, 1, 1,
0.1308255, 1.408164, 1.036737, 1, 1, 1, 1, 1,
0.1314979, -0.9546101, 2.773694, 1, 1, 1, 1, 1,
0.1321711, -1.456816, 2.77511, 1, 1, 1, 1, 1,
0.1328655, -0.3012749, 2.894884, 1, 1, 1, 1, 1,
0.1411634, -1.287119, 2.3281, 1, 1, 1, 1, 1,
0.1412582, 1.034873, -0.7140113, 1, 1, 1, 1, 1,
0.1416877, 0.8270714, 2.308944, 1, 1, 1, 1, 1,
0.1440025, -0.3378931, 1.87982, 1, 1, 1, 1, 1,
0.1583859, 0.3114206, 0.3238844, 1, 1, 1, 1, 1,
0.1611973, -1.264736, 3.144223, 1, 1, 1, 1, 1,
0.1622589, -1.005592, 0.8050962, 1, 1, 1, 1, 1,
0.1673293, -0.03512919, 2.436893, 0, 0, 1, 1, 1,
0.1732389, 0.2287336, -0.02371192, 1, 0, 0, 1, 1,
0.1741433, 0.569162, 0.1588522, 1, 0, 0, 1, 1,
0.1770763, 0.491814, 1.099525, 1, 0, 0, 1, 1,
0.17978, -2.074155, 2.799272, 1, 0, 0, 1, 1,
0.1813807, 0.1094164, 3.223398, 1, 0, 0, 1, 1,
0.1841506, 0.329177, 0.001058358, 0, 0, 0, 1, 1,
0.1861304, -0.3039666, 1.775197, 0, 0, 0, 1, 1,
0.1876449, -0.3476416, 3.001303, 0, 0, 0, 1, 1,
0.1903025, 1.32059, 2.143717, 0, 0, 0, 1, 1,
0.190484, 2.208826, 0.8682241, 0, 0, 0, 1, 1,
0.192746, 0.8515585, 0.1595733, 0, 0, 0, 1, 1,
0.1951272, 1.178651, -0.9048262, 0, 0, 0, 1, 1,
0.1986783, -1.09326, 2.291528, 1, 1, 1, 1, 1,
0.1990817, -1.570416, 3.716807, 1, 1, 1, 1, 1,
0.1994946, 0.533777, 1.829103, 1, 1, 1, 1, 1,
0.2080339, 0.7388304, 1.267249, 1, 1, 1, 1, 1,
0.2177684, 1.611617, -1.72404, 1, 1, 1, 1, 1,
0.2221957, 1.396812, 1.359382, 1, 1, 1, 1, 1,
0.2230706, 0.1752593, 1.113114, 1, 1, 1, 1, 1,
0.2235792, 0.7009563, 0.9591857, 1, 1, 1, 1, 1,
0.2244044, 0.2345155, 1.11903, 1, 1, 1, 1, 1,
0.2252916, 0.127447, -0.9348426, 1, 1, 1, 1, 1,
0.2307236, 1.468775, -0.4181387, 1, 1, 1, 1, 1,
0.2308064, 1.147615, 0.1367652, 1, 1, 1, 1, 1,
0.2382037, -1.003714, 2.030123, 1, 1, 1, 1, 1,
0.2390698, -0.3960329, 0.0309863, 1, 1, 1, 1, 1,
0.2413774, -0.4282423, 1.034506, 1, 1, 1, 1, 1,
0.2427574, 1.23319, 0.8142514, 0, 0, 1, 1, 1,
0.2443791, -0.04372568, 2.284758, 1, 0, 0, 1, 1,
0.244484, 1.489007, 0.2421347, 1, 0, 0, 1, 1,
0.2488295, -0.06550621, 1.603345, 1, 0, 0, 1, 1,
0.2512441, -0.7306099, 5.10172, 1, 0, 0, 1, 1,
0.2522453, -1.540632, 4.427863, 1, 0, 0, 1, 1,
0.2595782, -1.202968, 2.710184, 0, 0, 0, 1, 1,
0.261183, -0.5494704, 3.385478, 0, 0, 0, 1, 1,
0.2652397, -1.064221, 3.680698, 0, 0, 0, 1, 1,
0.2751853, 1.403357, 1.414716, 0, 0, 0, 1, 1,
0.2770272, 0.4584251, -0.5243779, 0, 0, 0, 1, 1,
0.2773423, -1.155566, 3.152631, 0, 0, 0, 1, 1,
0.2810098, 0.5348356, 2.159244, 0, 0, 0, 1, 1,
0.2815687, 0.5804217, 2.212048, 1, 1, 1, 1, 1,
0.2835826, -1.290581, 2.487149, 1, 1, 1, 1, 1,
0.2856191, -2.26385, 2.626432, 1, 1, 1, 1, 1,
0.2891666, -0.5132523, 1.911886, 1, 1, 1, 1, 1,
0.2955624, 0.3988292, 1.663823, 1, 1, 1, 1, 1,
0.2963446, 0.5945342, 0.392011, 1, 1, 1, 1, 1,
0.3087297, 0.6324582, -0.07822552, 1, 1, 1, 1, 1,
0.3089001, -1.835461, 2.386072, 1, 1, 1, 1, 1,
0.3124655, -1.686301, 2.501087, 1, 1, 1, 1, 1,
0.3165543, -1.266037, 1.819879, 1, 1, 1, 1, 1,
0.3234623, 1.282689, 0.2862302, 1, 1, 1, 1, 1,
0.3240233, 0.6841668, 0.4021445, 1, 1, 1, 1, 1,
0.3301683, -1.517731, 3.776949, 1, 1, 1, 1, 1,
0.3324569, 0.2447147, 1.543551, 1, 1, 1, 1, 1,
0.3427565, 1.272993, -1.406136, 1, 1, 1, 1, 1,
0.34755, -0.1899814, 1.695777, 0, 0, 1, 1, 1,
0.3476207, -0.437163, 2.877601, 1, 0, 0, 1, 1,
0.3491212, 0.006306056, 2.018849, 1, 0, 0, 1, 1,
0.3505914, -0.5547594, 1.640594, 1, 0, 0, 1, 1,
0.3511821, -0.259037, 1.133694, 1, 0, 0, 1, 1,
0.354096, -1.065235, 3.454912, 1, 0, 0, 1, 1,
0.3592916, -0.6241741, 2.440165, 0, 0, 0, 1, 1,
0.3635277, -0.541895, 3.320321, 0, 0, 0, 1, 1,
0.3638337, 0.9178287, 0.2766273, 0, 0, 0, 1, 1,
0.3674832, 1.24843, 0.0264444, 0, 0, 0, 1, 1,
0.3692164, 0.1380585, -0.2182794, 0, 0, 0, 1, 1,
0.3751974, 0.5176268, 1.56031, 0, 0, 0, 1, 1,
0.3753704, 0.02056283, 1.803177, 0, 0, 0, 1, 1,
0.3780835, 1.378152, -0.2996326, 1, 1, 1, 1, 1,
0.3797339, -0.7228342, 3.768207, 1, 1, 1, 1, 1,
0.3868369, 1.421026, 0.7345001, 1, 1, 1, 1, 1,
0.387311, 0.2898057, -0.5998636, 1, 1, 1, 1, 1,
0.3885276, 2.293624, 0.3099836, 1, 1, 1, 1, 1,
0.3887158, 0.5793532, -0.599626, 1, 1, 1, 1, 1,
0.3919564, -1.431829, 3.869967, 1, 1, 1, 1, 1,
0.3963842, -0.5136348, 2.124198, 1, 1, 1, 1, 1,
0.4013218, -1.586109, 2.728754, 1, 1, 1, 1, 1,
0.4019663, -1.01422, 3.747862, 1, 1, 1, 1, 1,
0.4051937, -0.04469204, 2.742051, 1, 1, 1, 1, 1,
0.4053108, 0.8051063, -0.4986593, 1, 1, 1, 1, 1,
0.4056129, -1.460503, 1.541401, 1, 1, 1, 1, 1,
0.4118848, -0.6080964, 3.372843, 1, 1, 1, 1, 1,
0.4148809, -0.2732351, 2.565126, 1, 1, 1, 1, 1,
0.4268336, -0.264258, 3.178663, 0, 0, 1, 1, 1,
0.4268884, 1.114029, 0.179691, 1, 0, 0, 1, 1,
0.4291119, -0.7577127, 2.273648, 1, 0, 0, 1, 1,
0.4310786, 0.4714099, 0.7649422, 1, 0, 0, 1, 1,
0.4366772, 0.8964971, 1.487357, 1, 0, 0, 1, 1,
0.4380115, 0.112023, 0.09596632, 1, 0, 0, 1, 1,
0.4381426, -0.9373333, 1.153432, 0, 0, 0, 1, 1,
0.4395907, -1.314692, 3.674998, 0, 0, 0, 1, 1,
0.444499, -0.684826, 2.27268, 0, 0, 0, 1, 1,
0.4454894, -0.4674196, 1.801236, 0, 0, 0, 1, 1,
0.4479721, 0.9450036, 0.3464722, 0, 0, 0, 1, 1,
0.4494254, -0.6601948, 2.264196, 0, 0, 0, 1, 1,
0.4507375, 0.3314202, 3.289284, 0, 0, 0, 1, 1,
0.4527702, -0.8898336, 2.728075, 1, 1, 1, 1, 1,
0.4527879, -0.112153, 3.346213, 1, 1, 1, 1, 1,
0.4547818, 0.4641328, 1.031661, 1, 1, 1, 1, 1,
0.4560547, 0.07283291, 1.558173, 1, 1, 1, 1, 1,
0.4585088, 0.2042381, 2.612691, 1, 1, 1, 1, 1,
0.4627568, -1.496529, 2.541678, 1, 1, 1, 1, 1,
0.4644147, 1.076283, 0.871128, 1, 1, 1, 1, 1,
0.4691459, 0.6058939, -0.02068885, 1, 1, 1, 1, 1,
0.4753, -0.7596397, 3.424095, 1, 1, 1, 1, 1,
0.476248, 1.73062, 1.00075, 1, 1, 1, 1, 1,
0.4776164, 1.220089, 1.266886, 1, 1, 1, 1, 1,
0.4808788, -0.6956854, 3.464483, 1, 1, 1, 1, 1,
0.4860532, -0.8548129, 3.114065, 1, 1, 1, 1, 1,
0.4872119, 0.314914, 2.398789, 1, 1, 1, 1, 1,
0.4931429, -0.6558183, 2.76598, 1, 1, 1, 1, 1,
0.4932029, -0.551572, 0.2598497, 0, 0, 1, 1, 1,
0.4940243, 0.109745, 0.3398416, 1, 0, 0, 1, 1,
0.4973926, -1.706478, 2.751658, 1, 0, 0, 1, 1,
0.4991951, 0.07971046, 2.798391, 1, 0, 0, 1, 1,
0.4994454, 0.2896947, 0.3986887, 1, 0, 0, 1, 1,
0.504351, -0.7300656, 1.925719, 1, 0, 0, 1, 1,
0.5096976, 0.5180025, 0.1099056, 0, 0, 0, 1, 1,
0.510893, -1.287455, 0.7020626, 0, 0, 0, 1, 1,
0.5136032, 1.297858, 0.8028615, 0, 0, 0, 1, 1,
0.5159302, -0.1346569, 0.5997528, 0, 0, 0, 1, 1,
0.5197461, 1.071025, 0.2194217, 0, 0, 0, 1, 1,
0.5209471, -0.2673537, 1.112715, 0, 0, 0, 1, 1,
0.5250962, 0.0370744, 1.806872, 0, 0, 0, 1, 1,
0.525287, -0.01500521, 3.041963, 1, 1, 1, 1, 1,
0.5255004, 2.106407, 0.3685281, 1, 1, 1, 1, 1,
0.5267211, 0.4744969, 0.8215518, 1, 1, 1, 1, 1,
0.5392436, -0.6954948, 2.651472, 1, 1, 1, 1, 1,
0.5445371, -0.8445815, 1.987241, 1, 1, 1, 1, 1,
0.5463451, 0.9404442, 0.5918906, 1, 1, 1, 1, 1,
0.5467389, 0.001569668, 0.3488479, 1, 1, 1, 1, 1,
0.5477566, -0.51932, 1.734028, 1, 1, 1, 1, 1,
0.5519726, -0.8882174, 3.335215, 1, 1, 1, 1, 1,
0.5541052, 0.7864606, -0.1641624, 1, 1, 1, 1, 1,
0.554239, 2.397043, 1.572943, 1, 1, 1, 1, 1,
0.5578271, 0.003882653, 0.5127385, 1, 1, 1, 1, 1,
0.5614684, -1.589319, 2.187146, 1, 1, 1, 1, 1,
0.5652759, 0.3383793, 1.38341, 1, 1, 1, 1, 1,
0.5652897, -0.9521311, 1.49306, 1, 1, 1, 1, 1,
0.5655572, 0.6563193, 1.441231, 0, 0, 1, 1, 1,
0.566469, -0.3731359, 2.705999, 1, 0, 0, 1, 1,
0.5714023, 0.004033626, 0.7197805, 1, 0, 0, 1, 1,
0.5733837, 0.3166585, 1.97976, 1, 0, 0, 1, 1,
0.5799155, 1.12042, 1.602494, 1, 0, 0, 1, 1,
0.5800557, -0.2982411, 2.209342, 1, 0, 0, 1, 1,
0.5815767, 0.3800518, 0.2920376, 0, 0, 0, 1, 1,
0.5870696, -0.9571406, 2.758267, 0, 0, 0, 1, 1,
0.5870996, -0.1832661, 3.905188, 0, 0, 0, 1, 1,
0.5874761, -1.253221, 2.750452, 0, 0, 0, 1, 1,
0.5904109, 0.3041162, 2.669099, 0, 0, 0, 1, 1,
0.5939943, -0.2710676, 3.151546, 0, 0, 0, 1, 1,
0.5987366, 1.276491, 0.0898046, 0, 0, 0, 1, 1,
0.6046756, 1.409211, -0.8014207, 1, 1, 1, 1, 1,
0.6058081, -0.4999115, 2.417555, 1, 1, 1, 1, 1,
0.6061395, 0.01824224, 1.607892, 1, 1, 1, 1, 1,
0.6076531, 1.265303, -0.9166331, 1, 1, 1, 1, 1,
0.6085954, -0.8271632, 1.494766, 1, 1, 1, 1, 1,
0.6094663, -1.218878, -0.1821714, 1, 1, 1, 1, 1,
0.6130488, -0.8931478, 2.638391, 1, 1, 1, 1, 1,
0.6131607, -1.796622, 3.298456, 1, 1, 1, 1, 1,
0.6143671, 1.694567, -0.05123672, 1, 1, 1, 1, 1,
0.6153418, -0.162268, 2.498263, 1, 1, 1, 1, 1,
0.623427, 1.199323, 0.4980459, 1, 1, 1, 1, 1,
0.6272941, -0.2176164, 0.3040642, 1, 1, 1, 1, 1,
0.6283097, -1.15541, 2.314379, 1, 1, 1, 1, 1,
0.6283616, -0.3848167, 1.907688, 1, 1, 1, 1, 1,
0.6342996, -0.1754535, 2.243366, 1, 1, 1, 1, 1,
0.6391982, 0.5554776, 1.352351, 0, 0, 1, 1, 1,
0.6417093, 0.74817, 1.572193, 1, 0, 0, 1, 1,
0.6418122, 0.4860428, 1.836615, 1, 0, 0, 1, 1,
0.6425549, 0.7773269, -1.006958, 1, 0, 0, 1, 1,
0.6430768, 0.3489501, 3.217946, 1, 0, 0, 1, 1,
0.6442484, 1.753621, -1.512873, 1, 0, 0, 1, 1,
0.6492096, -0.2912174, 3.226717, 0, 0, 0, 1, 1,
0.6509683, -0.2813871, 2.529268, 0, 0, 0, 1, 1,
0.6518544, -1.223187, 3.150735, 0, 0, 0, 1, 1,
0.6521969, -1.429905, 2.357992, 0, 0, 0, 1, 1,
0.6535428, 0.2369026, 2.572312, 0, 0, 0, 1, 1,
0.6536791, 0.6138076, -0.9669712, 0, 0, 0, 1, 1,
0.6539801, 1.267326, 1.25525, 0, 0, 0, 1, 1,
0.6563394, 0.5849991, 1.470938, 1, 1, 1, 1, 1,
0.6578355, -0.3790732, 2.383825, 1, 1, 1, 1, 1,
0.6601162, -0.2415358, 2.488536, 1, 1, 1, 1, 1,
0.6651827, -0.1046986, 1.40889, 1, 1, 1, 1, 1,
0.6703962, 2.194718, 0.5038021, 1, 1, 1, 1, 1,
0.6738194, 0.7981238, 1.06966, 1, 1, 1, 1, 1,
0.678331, -0.1158268, 1.001715, 1, 1, 1, 1, 1,
0.6801757, -1.763383, 2.937342, 1, 1, 1, 1, 1,
0.6819352, 0.2017312, 1.590291, 1, 1, 1, 1, 1,
0.6819848, 1.686114, 0.9088191, 1, 1, 1, 1, 1,
0.6833931, -0.380898, 1.103683, 1, 1, 1, 1, 1,
0.684498, -1.287547, 2.560366, 1, 1, 1, 1, 1,
0.6866797, -1.384011, 2.426341, 1, 1, 1, 1, 1,
0.6871904, -0.8701262, 2.827322, 1, 1, 1, 1, 1,
0.6872879, -0.2394599, 1.369708, 1, 1, 1, 1, 1,
0.687553, 0.3564287, 1.352505, 0, 0, 1, 1, 1,
0.700882, -0.8952563, 3.80268, 1, 0, 0, 1, 1,
0.7070217, -1.493878, 2.458523, 1, 0, 0, 1, 1,
0.7070219, -0.2886606, 2.057904, 1, 0, 0, 1, 1,
0.710785, -1.418871, 3.595793, 1, 0, 0, 1, 1,
0.71385, -0.623229, 3.506997, 1, 0, 0, 1, 1,
0.7225456, -0.002890326, 1.720706, 0, 0, 0, 1, 1,
0.7270011, 1.343687, -0.4635491, 0, 0, 0, 1, 1,
0.7317231, -0.07341589, 1.759328, 0, 0, 0, 1, 1,
0.7318939, 0.1705059, 3.280308, 0, 0, 0, 1, 1,
0.7323789, -2.545408, 3.390788, 0, 0, 0, 1, 1,
0.7350393, 1.654758, 2.64419, 0, 0, 0, 1, 1,
0.7393604, -1.313556, 3.145499, 0, 0, 0, 1, 1,
0.7436904, -1.756628, 4.255997, 1, 1, 1, 1, 1,
0.7444015, 0.3424684, 1.181512, 1, 1, 1, 1, 1,
0.7459711, -0.8866966, 3.268093, 1, 1, 1, 1, 1,
0.7469234, 0.4915366, 1.483867, 1, 1, 1, 1, 1,
0.7477414, -0.8735092, 2.833373, 1, 1, 1, 1, 1,
0.7482337, 0.9818986, 1.121411, 1, 1, 1, 1, 1,
0.7483918, 0.4260414, 1.926167, 1, 1, 1, 1, 1,
0.7496276, 1.081893, -0.2859652, 1, 1, 1, 1, 1,
0.7504318, 0.403647, -0.05255353, 1, 1, 1, 1, 1,
0.7511126, 1.310723, -0.8974068, 1, 1, 1, 1, 1,
0.7516981, 0.7840546, 1.553244, 1, 1, 1, 1, 1,
0.7531638, -1.059529, 1.229522, 1, 1, 1, 1, 1,
0.7555522, 0.1270134, 2.031603, 1, 1, 1, 1, 1,
0.7559351, -1.739967, 1.579999, 1, 1, 1, 1, 1,
0.7623676, -0.8349054, 1.572213, 1, 1, 1, 1, 1,
0.7646789, -0.9420587, 2.708871, 0, 0, 1, 1, 1,
0.7706507, 0.8242171, 0.5528895, 1, 0, 0, 1, 1,
0.7775347, 0.6659688, 1.078041, 1, 0, 0, 1, 1,
0.7780394, 1.728377, -0.2630309, 1, 0, 0, 1, 1,
0.778775, -0.9623545, 3.143014, 1, 0, 0, 1, 1,
0.7802308, 0.6676824, 1.893092, 1, 0, 0, 1, 1,
0.7826288, 0.3616733, -0.360252, 0, 0, 0, 1, 1,
0.7833387, -0.2318248, 3.786724, 0, 0, 0, 1, 1,
0.7846209, 1.042168, -0.9031436, 0, 0, 0, 1, 1,
0.7907791, 0.02643753, 1.515379, 0, 0, 0, 1, 1,
0.7940182, 0.5430281, 2.846813, 0, 0, 0, 1, 1,
0.7994647, -0.2072298, 2.917048, 0, 0, 0, 1, 1,
0.7997038, 0.02234434, 1.177989, 0, 0, 0, 1, 1,
0.8009376, -0.6338215, 2.693639, 1, 1, 1, 1, 1,
0.8104466, -0.3425635, 1.002612, 1, 1, 1, 1, 1,
0.810739, 2.016928, 0.5777938, 1, 1, 1, 1, 1,
0.815924, -0.5523254, 0.9778514, 1, 1, 1, 1, 1,
0.8188905, -1.751379, 2.695539, 1, 1, 1, 1, 1,
0.8228912, 0.7096179, 0.7163576, 1, 1, 1, 1, 1,
0.8259429, 0.525975, 2.07954, 1, 1, 1, 1, 1,
0.8300782, -0.6056439, 0.8908689, 1, 1, 1, 1, 1,
0.8356164, -0.008199066, 1.088348, 1, 1, 1, 1, 1,
0.858157, -1.132967, 2.473976, 1, 1, 1, 1, 1,
0.8667036, -0.9154981, 1.860372, 1, 1, 1, 1, 1,
0.8729115, -1.22561, 2.251556, 1, 1, 1, 1, 1,
0.879557, -1.110367, 1.461623, 1, 1, 1, 1, 1,
0.8798829, 0.6653826, 0.6990172, 1, 1, 1, 1, 1,
0.8871501, 0.5260658, 0.2427172, 1, 1, 1, 1, 1,
0.887169, -0.2190921, 1.72317, 0, 0, 1, 1, 1,
0.887729, -1.029274, 1.939887, 1, 0, 0, 1, 1,
0.8897302, -1.226706, 4.59123, 1, 0, 0, 1, 1,
0.8897849, 0.1231726, 1.454252, 1, 0, 0, 1, 1,
0.8939888, -0.9333649, 1.016244, 1, 0, 0, 1, 1,
0.8980181, 0.4767573, 0.2222443, 1, 0, 0, 1, 1,
0.9003587, -2.273804, 4.019238, 0, 0, 0, 1, 1,
0.9056334, -1.093256, 2.246917, 0, 0, 0, 1, 1,
0.9124481, 0.2672131, 2.351475, 0, 0, 0, 1, 1,
0.923042, 0.3483205, 1.239504, 0, 0, 0, 1, 1,
0.9247121, -1.171702, 2.628444, 0, 0, 0, 1, 1,
0.9257193, 0.7001098, 1.244091, 0, 0, 0, 1, 1,
0.9265723, 0.156082, 1.536582, 0, 0, 0, 1, 1,
0.9280577, 0.8240517, 2.301029, 1, 1, 1, 1, 1,
0.9315351, 0.1032771, 0.8455361, 1, 1, 1, 1, 1,
0.9317021, -0.8399086, 2.653141, 1, 1, 1, 1, 1,
0.9330925, -0.242644, 3.165867, 1, 1, 1, 1, 1,
0.9449298, -1.71515, 4.351428, 1, 1, 1, 1, 1,
0.9473108, 0.8950332, 2.350238, 1, 1, 1, 1, 1,
0.9497749, -0.09819683, 1.207498, 1, 1, 1, 1, 1,
0.951059, 0.1615015, 2.686283, 1, 1, 1, 1, 1,
0.9550924, -1.312609, 2.454741, 1, 1, 1, 1, 1,
0.9628015, 1.168453, -0.2074843, 1, 1, 1, 1, 1,
0.9635554, 0.04099845, 3.079457, 1, 1, 1, 1, 1,
0.9649451, -0.2235701, 0.5702641, 1, 1, 1, 1, 1,
0.9656084, -1.014119, 2.149582, 1, 1, 1, 1, 1,
0.9679485, -0.05650994, 0.5462946, 1, 1, 1, 1, 1,
0.9692928, 0.6288862, 0.8720371, 1, 1, 1, 1, 1,
0.9705663, -1.243393, 2.373174, 0, 0, 1, 1, 1,
0.9713407, 1.027561, 0.3898143, 1, 0, 0, 1, 1,
0.9880137, 1.502308, -0.1347924, 1, 0, 0, 1, 1,
0.9913887, 1.120888, -0.7674155, 1, 0, 0, 1, 1,
0.9966895, -0.5038289, 2.048884, 1, 0, 0, 1, 1,
0.9976426, 1.640623, 2.014995, 1, 0, 0, 1, 1,
1.003331, 0.05977891, 2.579345, 0, 0, 0, 1, 1,
1.00377, -1.038377, 1.946262, 0, 0, 0, 1, 1,
1.004466, 0.117932, 2.486779, 0, 0, 0, 1, 1,
1.004747, 1.457221, -0.05569188, 0, 0, 0, 1, 1,
1.020571, 1.633798, 1.07182, 0, 0, 0, 1, 1,
1.022371, -1.590972, 2.458631, 0, 0, 0, 1, 1,
1.023388, 0.5009978, 1.938642, 0, 0, 0, 1, 1,
1.034035, 1.52104, 1.279471, 1, 1, 1, 1, 1,
1.038199, 0.6314847, 2.147185, 1, 1, 1, 1, 1,
1.052943, -0.7712054, 0.7416704, 1, 1, 1, 1, 1,
1.054238, -0.220063, 1.046771, 1, 1, 1, 1, 1,
1.054246, -0.2211143, 2.164988, 1, 1, 1, 1, 1,
1.054559, 1.948044, 0.5519602, 1, 1, 1, 1, 1,
1.066481, 0.1841524, 2.766249, 1, 1, 1, 1, 1,
1.077109, 0.4404445, 1.487019, 1, 1, 1, 1, 1,
1.079859, -0.1782678, 1.324711, 1, 1, 1, 1, 1,
1.086087, -1.752162, 4.35639, 1, 1, 1, 1, 1,
1.087202, 0.8732043, 1.236844, 1, 1, 1, 1, 1,
1.089352, -1.167434, 1.921521, 1, 1, 1, 1, 1,
1.093989, 0.9137859, 1.401698, 1, 1, 1, 1, 1,
1.099329, -0.5952109, 1.907151, 1, 1, 1, 1, 1,
1.109085, -0.1910001, 2.333578, 1, 1, 1, 1, 1,
1.10924, -0.5488551, 4.193253, 0, 0, 1, 1, 1,
1.11187, 0.9088464, 2.952448, 1, 0, 0, 1, 1,
1.113895, -0.9877599, 1.916874, 1, 0, 0, 1, 1,
1.122256, -0.3583233, 2.93779, 1, 0, 0, 1, 1,
1.125622, -0.03738772, 3.554564, 1, 0, 0, 1, 1,
1.12877, 0.01531112, 2.039213, 1, 0, 0, 1, 1,
1.13692, 0.427345, -0.0021798, 0, 0, 0, 1, 1,
1.142472, -0.228359, 2.120588, 0, 0, 0, 1, 1,
1.147242, 0.2760884, -0.1763778, 0, 0, 0, 1, 1,
1.153009, -1.099263, 2.460812, 0, 0, 0, 1, 1,
1.153135, -0.3822806, 2.698311, 0, 0, 0, 1, 1,
1.155315, -0.9804262, 0.9666895, 0, 0, 0, 1, 1,
1.157665, 0.05107769, 1.568528, 0, 0, 0, 1, 1,
1.169477, -0.3181508, 2.555906, 1, 1, 1, 1, 1,
1.180779, 0.9251546, 0.9120985, 1, 1, 1, 1, 1,
1.188574, 0.2710413, 1.81103, 1, 1, 1, 1, 1,
1.189534, -0.6836797, 2.771692, 1, 1, 1, 1, 1,
1.192223, -0.7474154, 0.8025247, 1, 1, 1, 1, 1,
1.194984, -0.6250312, 1.12713, 1, 1, 1, 1, 1,
1.1985, -1.37992, 1.876505, 1, 1, 1, 1, 1,
1.208267, 0.4932194, 0.7703038, 1, 1, 1, 1, 1,
1.213453, 0.290589, 0.09744515, 1, 1, 1, 1, 1,
1.218295, -0.2585908, 2.391662, 1, 1, 1, 1, 1,
1.227219, 1.062987, 0.5288522, 1, 1, 1, 1, 1,
1.23551, 0.01976368, 2.264225, 1, 1, 1, 1, 1,
1.23678, -2.349591, 2.238333, 1, 1, 1, 1, 1,
1.237075, -0.002084023, 1.718719, 1, 1, 1, 1, 1,
1.237946, -0.8401049, 1.762953, 1, 1, 1, 1, 1,
1.242586, 1.605654, -0.310063, 0, 0, 1, 1, 1,
1.243465, 0.2684473, 1.560813, 1, 0, 0, 1, 1,
1.269916, 1.435022, 0.4864269, 1, 0, 0, 1, 1,
1.270008, 0.393817, 2.530481, 1, 0, 0, 1, 1,
1.285791, 0.1139667, 1.531507, 1, 0, 0, 1, 1,
1.289912, -0.04361279, 2.066098, 1, 0, 0, 1, 1,
1.308056, 0.4852045, 1.614965, 0, 0, 0, 1, 1,
1.308601, 0.156271, 1.08583, 0, 0, 0, 1, 1,
1.308776, -0.5211911, 2.50036, 0, 0, 0, 1, 1,
1.308962, 0.4550264, 0.3497829, 0, 0, 0, 1, 1,
1.310384, -0.6667948, 1.945708, 0, 0, 0, 1, 1,
1.314894, 0.6317675, 1.56377, 0, 0, 0, 1, 1,
1.324965, 0.5381563, 1.732871, 0, 0, 0, 1, 1,
1.326331, 0.5540645, 0.5680332, 1, 1, 1, 1, 1,
1.334623, -0.4308491, 2.515811, 1, 1, 1, 1, 1,
1.339388, -2.578821, 2.832875, 1, 1, 1, 1, 1,
1.34384, -1.03692, 3.350571, 1, 1, 1, 1, 1,
1.356778, 1.135641, -0.3742964, 1, 1, 1, 1, 1,
1.358997, -0.2441784, 0.6725259, 1, 1, 1, 1, 1,
1.376257, 0.5428014, 0.1313892, 1, 1, 1, 1, 1,
1.377026, -2.348777, 2.100908, 1, 1, 1, 1, 1,
1.378741, 0.6642729, 0.5161964, 1, 1, 1, 1, 1,
1.381335, -0.5760909, 4.236551, 1, 1, 1, 1, 1,
1.383185, -0.6510617, 0.703687, 1, 1, 1, 1, 1,
1.384226, -1.526636, 2.094494, 1, 1, 1, 1, 1,
1.392387, 0.7761968, -0.4010612, 1, 1, 1, 1, 1,
1.398747, -0.3900524, 2.561061, 1, 1, 1, 1, 1,
1.412264, 0.8840582, -0.1381781, 1, 1, 1, 1, 1,
1.423075, 0.7541409, 2.234463, 0, 0, 1, 1, 1,
1.423667, -0.1847958, 2.353598, 1, 0, 0, 1, 1,
1.427654, -1.273893, 3.801644, 1, 0, 0, 1, 1,
1.429152, -0.6871601, 3.490808, 1, 0, 0, 1, 1,
1.437792, 1.136838, 0.8582751, 1, 0, 0, 1, 1,
1.444445, 0.953822, -0.3622494, 1, 0, 0, 1, 1,
1.462122, 2.237718, 2.293078, 0, 0, 0, 1, 1,
1.478661, 0.6626766, 1.68047, 0, 0, 0, 1, 1,
1.495265, -0.1171642, 1.071983, 0, 0, 0, 1, 1,
1.499083, 0.2282914, 1.42354, 0, 0, 0, 1, 1,
1.501552, -0.4697955, 2.699394, 0, 0, 0, 1, 1,
1.506939, -1.556754, 4.374842, 0, 0, 0, 1, 1,
1.513499, -1.306116, 1.698032, 0, 0, 0, 1, 1,
1.51377, 1.032459, 0.9882894, 1, 1, 1, 1, 1,
1.516352, 0.3343457, 1.543772, 1, 1, 1, 1, 1,
1.522138, 0.5903418, -0.1452403, 1, 1, 1, 1, 1,
1.523973, -1.308153, 3.836028, 1, 1, 1, 1, 1,
1.550179, -0.3191847, 1.856246, 1, 1, 1, 1, 1,
1.551422, 1.360041, 0.9806212, 1, 1, 1, 1, 1,
1.557129, -0.7543289, 1.799052, 1, 1, 1, 1, 1,
1.564072, 1.505329, 1.360352, 1, 1, 1, 1, 1,
1.576863, -0.4869308, 2.612144, 1, 1, 1, 1, 1,
1.580739, 1.188838, -0.1873116, 1, 1, 1, 1, 1,
1.583167, -0.5212724, 1.299267, 1, 1, 1, 1, 1,
1.589375, 0.1245811, 2.32294, 1, 1, 1, 1, 1,
1.612955, 0.08595503, 2.989217, 1, 1, 1, 1, 1,
1.613492, 1.998698, 0.3209598, 1, 1, 1, 1, 1,
1.617219, -0.8140287, 1.945995, 1, 1, 1, 1, 1,
1.631556, -0.3385242, 1.141753, 0, 0, 1, 1, 1,
1.645975, -0.9673505, 1.562524, 1, 0, 0, 1, 1,
1.660098, -0.1070242, 1.497763, 1, 0, 0, 1, 1,
1.685167, 2.117465, 0.8615742, 1, 0, 0, 1, 1,
1.694864, 0.4965782, 3.059405, 1, 0, 0, 1, 1,
1.70361, 0.5556063, -0.1377805, 1, 0, 0, 1, 1,
1.708025, 1.464137, 0.8019105, 0, 0, 0, 1, 1,
1.714732, 0.5166368, 0.7235502, 0, 0, 0, 1, 1,
1.733386, 1.895031, 1.511813, 0, 0, 0, 1, 1,
1.742457, -0.8533658, 1.295016, 0, 0, 0, 1, 1,
1.74683, 0.3640727, 1.62294, 0, 0, 0, 1, 1,
1.775939, 0.04337527, 1.73226, 0, 0, 0, 1, 1,
1.810079, -1.132324, 2.019238, 0, 0, 0, 1, 1,
1.82015, -1.543827, 2.304258, 1, 1, 1, 1, 1,
1.824576, 1.689674, 0.731144, 1, 1, 1, 1, 1,
1.829402, -0.7509655, 0.7139592, 1, 1, 1, 1, 1,
1.830598, 0.7712273, 0.3657903, 1, 1, 1, 1, 1,
1.842216, -1.124009, 3.665192, 1, 1, 1, 1, 1,
1.849574, 0.313477, 1.151276, 1, 1, 1, 1, 1,
1.864188, 1.340584, 2.095917, 1, 1, 1, 1, 1,
1.886899, 0.08224987, 1.98231, 1, 1, 1, 1, 1,
1.888572, -0.08065263, 1.344781, 1, 1, 1, 1, 1,
1.905735, -0.3487158, 1.235976, 1, 1, 1, 1, 1,
1.908925, -0.3303704, -0.4862629, 1, 1, 1, 1, 1,
1.924127, 0.8238345, 0.6278461, 1, 1, 1, 1, 1,
1.924533, -0.08405598, 2.542803, 1, 1, 1, 1, 1,
1.932844, 1.014692, 0.3929101, 1, 1, 1, 1, 1,
1.934514, 0.7111461, 0.7136058, 1, 1, 1, 1, 1,
1.939313, 0.316648, 2.557431, 0, 0, 1, 1, 1,
1.952381, -2.157942, 0.8733765, 1, 0, 0, 1, 1,
1.961891, -1.669032, 0.8204958, 1, 0, 0, 1, 1,
1.972114, 1.257928, -1.851092, 1, 0, 0, 1, 1,
2.005654, -0.01728752, 2.463799, 1, 0, 0, 1, 1,
2.013676, -0.1995828, 1.900108, 1, 0, 0, 1, 1,
2.016995, -0.7249849, 1.261968, 0, 0, 0, 1, 1,
2.034705, -1.511491, 2.738129, 0, 0, 0, 1, 1,
2.036757, -0.7243187, 1.951377, 0, 0, 0, 1, 1,
2.064009, -0.1396275, 2.252902, 0, 0, 0, 1, 1,
2.065504, 1.033436, -0.4265852, 0, 0, 0, 1, 1,
2.123291, 1.774516, 2.184761, 0, 0, 0, 1, 1,
2.232154, -0.03910549, 1.23294, 0, 0, 0, 1, 1,
2.269452, -0.3420038, 1.536873, 1, 1, 1, 1, 1,
2.293082, 1.119511, 0.2967093, 1, 1, 1, 1, 1,
2.31805, -0.5105669, 2.956182, 1, 1, 1, 1, 1,
2.345847, 0.8988519, 0.5847159, 1, 1, 1, 1, 1,
2.421272, 0.5743874, 0.3349177, 1, 1, 1, 1, 1,
2.523836, -0.3589198, 0.9005902, 1, 1, 1, 1, 1,
3.58681, -0.7632749, 0.7226063, 1, 1, 1, 1, 1
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
var radius = 9.587508;
var distance = 33.67571;
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
mvMatrix.translate( -0.08797407, -0.2055979, -0.1636779 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.67571);
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
