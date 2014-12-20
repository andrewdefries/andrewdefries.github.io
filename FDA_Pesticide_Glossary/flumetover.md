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
-3.636338, 0.2686194, -4.092851, 1, 0, 0, 1,
-3.200077, 0.02150325, -1.900046, 1, 0.007843138, 0, 1,
-2.871186, -0.1130558, -2.324377, 1, 0.01176471, 0, 1,
-2.501124, -1.720027, -1.515144, 1, 0.01960784, 0, 1,
-2.494173, -2.121837, -2.435887, 1, 0.02352941, 0, 1,
-2.466552, 0.1940876, -3.064185, 1, 0.03137255, 0, 1,
-2.415022, -0.06437327, -0.7300922, 1, 0.03529412, 0, 1,
-2.314412, 0.3959623, -1.155489, 1, 0.04313726, 0, 1,
-2.311191, 1.145472, -3.504492, 1, 0.04705882, 0, 1,
-2.303725, 0.6351487, -0.1084431, 1, 0.05490196, 0, 1,
-2.268286, -0.8652868, -2.190466, 1, 0.05882353, 0, 1,
-2.264108, -1.227246, -2.690656, 1, 0.06666667, 0, 1,
-2.264028, -0.06137187, -0.1934069, 1, 0.07058824, 0, 1,
-2.199565, 0.2779612, -0.3937359, 1, 0.07843138, 0, 1,
-2.186744, 0.7961841, -0.02181858, 1, 0.08235294, 0, 1,
-2.117536, -0.5196692, -2.712016, 1, 0.09019608, 0, 1,
-2.099721, 0.5695472, -0.3553291, 1, 0.09411765, 0, 1,
-2.077514, -1.27926, -2.444588, 1, 0.1019608, 0, 1,
-2.016629, -0.5338599, -2.421403, 1, 0.1098039, 0, 1,
-1.983365, -1.129212, -1.629431, 1, 0.1137255, 0, 1,
-1.951355, -1.928496, -2.188404, 1, 0.1215686, 0, 1,
-1.90813, -0.6045694, -1.951403, 1, 0.1254902, 0, 1,
-1.903008, 0.9758164, -1.051787, 1, 0.1333333, 0, 1,
-1.884762, -0.8927394, -2.811106, 1, 0.1372549, 0, 1,
-1.856516, 0.6118797, 0.3898034, 1, 0.145098, 0, 1,
-1.851137, 1.964074, 0.5914783, 1, 0.1490196, 0, 1,
-1.840794, -0.5610461, -3.153579, 1, 0.1568628, 0, 1,
-1.839878, 0.03145219, -0.5695251, 1, 0.1607843, 0, 1,
-1.837341, -0.7814233, -1.31444, 1, 0.1686275, 0, 1,
-1.831213, -0.9527185, -2.54811, 1, 0.172549, 0, 1,
-1.7918, -1.129484, -2.128889, 1, 0.1803922, 0, 1,
-1.782608, -0.8198869, -1.013453, 1, 0.1843137, 0, 1,
-1.751491, 0.9649432, 0.01441114, 1, 0.1921569, 0, 1,
-1.738471, 0.1103873, -2.076814, 1, 0.1960784, 0, 1,
-1.735363, 1.038374, 0.2165201, 1, 0.2039216, 0, 1,
-1.731467, -1.01101, -3.68174, 1, 0.2117647, 0, 1,
-1.722526, 1.074251, -1.653168, 1, 0.2156863, 0, 1,
-1.698838, -1.210111, -2.014536, 1, 0.2235294, 0, 1,
-1.678739, -0.1487276, -0.6907693, 1, 0.227451, 0, 1,
-1.668502, 1.401983, -1.377952, 1, 0.2352941, 0, 1,
-1.664713, -0.8648287, -1.984705, 1, 0.2392157, 0, 1,
-1.664244, -1.061203, -1.632442, 1, 0.2470588, 0, 1,
-1.656776, 0.5409821, -0.670284, 1, 0.2509804, 0, 1,
-1.650983, 0.4984763, 0.368666, 1, 0.2588235, 0, 1,
-1.642125, 1.547951, -0.9534019, 1, 0.2627451, 0, 1,
-1.639159, -0.986412, -0.7475357, 1, 0.2705882, 0, 1,
-1.627078, -0.5892565, -3.068254, 1, 0.2745098, 0, 1,
-1.619603, -0.3175508, -0.3778806, 1, 0.282353, 0, 1,
-1.615689, -2.016873, -2.292183, 1, 0.2862745, 0, 1,
-1.613925, 0.3723302, -1.919689, 1, 0.2941177, 0, 1,
-1.610792, -2.182313, -3.330393, 1, 0.3019608, 0, 1,
-1.599895, 1.704869, 0.3534347, 1, 0.3058824, 0, 1,
-1.599124, -0.4212205, -2.447021, 1, 0.3137255, 0, 1,
-1.597599, 1.35271, -0.594528, 1, 0.3176471, 0, 1,
-1.58692, 0.03112173, -1.859971, 1, 0.3254902, 0, 1,
-1.57728, -0.6220229, -0.8932474, 1, 0.3294118, 0, 1,
-1.574365, -0.9826921, -2.618464, 1, 0.3372549, 0, 1,
-1.561212, -1.361084, -2.497934, 1, 0.3411765, 0, 1,
-1.557009, 0.3497103, -1.491496, 1, 0.3490196, 0, 1,
-1.554658, -1.400565, -2.695373, 1, 0.3529412, 0, 1,
-1.552747, 0.03508221, -0.03640994, 1, 0.3607843, 0, 1,
-1.513607, -0.6384928, -0.8243573, 1, 0.3647059, 0, 1,
-1.493319, 0.1486913, -1.115767, 1, 0.372549, 0, 1,
-1.483913, -0.3041007, -1.149741, 1, 0.3764706, 0, 1,
-1.47455, 1.142018, -0.8157328, 1, 0.3843137, 0, 1,
-1.468545, -0.03155782, -2.765165, 1, 0.3882353, 0, 1,
-1.46688, 0.9970931, -3.212529, 1, 0.3960784, 0, 1,
-1.459949, 0.9159414, -0.7849288, 1, 0.4039216, 0, 1,
-1.45964, -0.5496066, -0.3404771, 1, 0.4078431, 0, 1,
-1.459273, -0.1286378, -0.434453, 1, 0.4156863, 0, 1,
-1.458259, 0.3918467, -0.8044793, 1, 0.4196078, 0, 1,
-1.455661, -1.268992, -1.518295, 1, 0.427451, 0, 1,
-1.435001, 0.6802486, -0.829252, 1, 0.4313726, 0, 1,
-1.416594, 0.9990141, -0.3601956, 1, 0.4392157, 0, 1,
-1.413672, -1.388767, -0.2405457, 1, 0.4431373, 0, 1,
-1.411801, 0.005562864, -1.172684, 1, 0.4509804, 0, 1,
-1.407265, -1.255922, -3.111695, 1, 0.454902, 0, 1,
-1.403135, 0.05151856, -1.649537, 1, 0.4627451, 0, 1,
-1.397229, -0.5919375, -2.808562, 1, 0.4666667, 0, 1,
-1.396739, -1.757239, -1.893121, 1, 0.4745098, 0, 1,
-1.390927, -0.2951865, -1.131153, 1, 0.4784314, 0, 1,
-1.388968, 0.3116266, -1.863381, 1, 0.4862745, 0, 1,
-1.383503, -1.796746, -3.94562, 1, 0.4901961, 0, 1,
-1.380584, -1.737071, -1.241308, 1, 0.4980392, 0, 1,
-1.366463, -0.6674575, -2.879059, 1, 0.5058824, 0, 1,
-1.360284, 0.5383771, -0.8943663, 1, 0.509804, 0, 1,
-1.359691, 1.565712, -1.818991, 1, 0.5176471, 0, 1,
-1.356601, 1.081456, -1.72847, 1, 0.5215687, 0, 1,
-1.34272, -1.276427, -1.805521, 1, 0.5294118, 0, 1,
-1.339044, 0.1919105, -2.529719, 1, 0.5333334, 0, 1,
-1.338416, -2.873952, -3.56105, 1, 0.5411765, 0, 1,
-1.33267, 0.7783259, 0.3209264, 1, 0.5450981, 0, 1,
-1.329933, 0.108802, -0.2668274, 1, 0.5529412, 0, 1,
-1.322757, 0.3716831, -1.917477, 1, 0.5568628, 0, 1,
-1.322357, 1.04412, -1.235675, 1, 0.5647059, 0, 1,
-1.320234, 0.2682369, -2.541692, 1, 0.5686275, 0, 1,
-1.315864, 0.3859229, 0.4592642, 1, 0.5764706, 0, 1,
-1.307819, 0.7253211, -0.6253931, 1, 0.5803922, 0, 1,
-1.304082, -0.2812623, -1.871112, 1, 0.5882353, 0, 1,
-1.294752, 0.5907277, -0.7375857, 1, 0.5921569, 0, 1,
-1.283085, -1.733914, -3.48733, 1, 0.6, 0, 1,
-1.273389, -0.5051805, -4.273619, 1, 0.6078432, 0, 1,
-1.269045, -0.1150517, -0.3674626, 1, 0.6117647, 0, 1,
-1.254924, 1.579048, 1.176313, 1, 0.6196079, 0, 1,
-1.250571, -0.9556912, -2.352003, 1, 0.6235294, 0, 1,
-1.24912, -0.7027342, -2.80579, 1, 0.6313726, 0, 1,
-1.248021, 0.410705, -0.6934589, 1, 0.6352941, 0, 1,
-1.246573, -0.5161483, -2.805997, 1, 0.6431373, 0, 1,
-1.241717, 0.9311153, -0.3817975, 1, 0.6470588, 0, 1,
-1.239899, -0.2853785, -2.607685, 1, 0.654902, 0, 1,
-1.231802, -1.710706, -1.793247, 1, 0.6588235, 0, 1,
-1.229684, 0.4661009, -0.9093654, 1, 0.6666667, 0, 1,
-1.214818, -0.04914771, -1.892182, 1, 0.6705883, 0, 1,
-1.211208, -0.1887975, -0.8213601, 1, 0.6784314, 0, 1,
-1.208186, -2.008185, -3.13181, 1, 0.682353, 0, 1,
-1.20582, -0.1074158, -2.479359, 1, 0.6901961, 0, 1,
-1.190811, 1.280908, -0.2724766, 1, 0.6941177, 0, 1,
-1.190694, -0.4476606, -0.338536, 1, 0.7019608, 0, 1,
-1.179435, -0.184891, -1.671214, 1, 0.7098039, 0, 1,
-1.178059, -0.3840809, -2.939979, 1, 0.7137255, 0, 1,
-1.175591, -1.577613, -2.508212, 1, 0.7215686, 0, 1,
-1.175081, -0.1363557, -1.337916, 1, 0.7254902, 0, 1,
-1.172833, 0.5456625, -1.1629, 1, 0.7333333, 0, 1,
-1.170245, -0.2323002, -0.4440754, 1, 0.7372549, 0, 1,
-1.163489, -2.153403, -2.575259, 1, 0.7450981, 0, 1,
-1.162314, -2.153316, -2.629281, 1, 0.7490196, 0, 1,
-1.157423, 2.797498, -0.7585109, 1, 0.7568628, 0, 1,
-1.1444, 1.541823, 0.2069172, 1, 0.7607843, 0, 1,
-1.143406, 0.4297647, -2.010361, 1, 0.7686275, 0, 1,
-1.142161, 0.5227007, -2.740929, 1, 0.772549, 0, 1,
-1.136344, -0.3688579, -2.381103, 1, 0.7803922, 0, 1,
-1.131105, 2.591504, -0.6338297, 1, 0.7843137, 0, 1,
-1.129436, -1.458551, -0.4328179, 1, 0.7921569, 0, 1,
-1.10926, 1.121179, -1.808318, 1, 0.7960784, 0, 1,
-1.107635, 0.8207956, -2.165078, 1, 0.8039216, 0, 1,
-1.088864, 1.744333, -1.176989, 1, 0.8117647, 0, 1,
-1.081408, -0.5543014, -2.729702, 1, 0.8156863, 0, 1,
-1.077168, -0.3076239, -2.667024, 1, 0.8235294, 0, 1,
-1.071084, -0.6643371, -1.496919, 1, 0.827451, 0, 1,
-1.06945, -1.202943, -2.258893, 1, 0.8352941, 0, 1,
-1.068912, -0.8727415, -1.758826, 1, 0.8392157, 0, 1,
-1.068605, -2.066736, -2.954275, 1, 0.8470588, 0, 1,
-1.064708, -0.6134174, -2.280935, 1, 0.8509804, 0, 1,
-1.052967, 0.2596749, -0.8622192, 1, 0.8588235, 0, 1,
-1.044489, 0.1357354, -2.837196, 1, 0.8627451, 0, 1,
-1.03899, 1.49182, 0.2992246, 1, 0.8705882, 0, 1,
-1.035455, -0.4690723, -3.323027, 1, 0.8745098, 0, 1,
-1.029204, 0.3488778, -2.548093, 1, 0.8823529, 0, 1,
-1.025213, -0.8024766, -2.078591, 1, 0.8862745, 0, 1,
-1.024765, 0.7399554, -1.581263, 1, 0.8941177, 0, 1,
-1.022249, 1.725029, -0.3196888, 1, 0.8980392, 0, 1,
-1.021147, 1.463542, 0.6768184, 1, 0.9058824, 0, 1,
-1.021101, -1.139094, -3.142091, 1, 0.9137255, 0, 1,
-1.020851, 1.782953, 0.6996849, 1, 0.9176471, 0, 1,
-1.01702, -0.05050965, -0.6456737, 1, 0.9254902, 0, 1,
-1.014758, -1.230407, -3.363824, 1, 0.9294118, 0, 1,
-1.007236, 0.9229422, 0.06954619, 1, 0.9372549, 0, 1,
-1.005408, 0.3712986, 0.2842562, 1, 0.9411765, 0, 1,
-1.005403, 1.071136, -0.8523042, 1, 0.9490196, 0, 1,
-1.00258, 0.180399, -0.5446445, 1, 0.9529412, 0, 1,
-0.9995833, -0.3098509, -1.476979, 1, 0.9607843, 0, 1,
-0.9967712, -0.305431, -3.8953, 1, 0.9647059, 0, 1,
-0.9951489, 1.077071, -1.138057, 1, 0.972549, 0, 1,
-0.9951429, -0.220456, -3.48764, 1, 0.9764706, 0, 1,
-0.9940233, 1.476626, 0.1313328, 1, 0.9843137, 0, 1,
-0.9930643, 1.431896, 0.005249624, 1, 0.9882353, 0, 1,
-0.9905703, 2.010018, -0.5664256, 1, 0.9960784, 0, 1,
-0.9897843, 0.2905261, -1.119015, 0.9960784, 1, 0, 1,
-0.988353, -0.1127128, -1.923255, 0.9921569, 1, 0, 1,
-0.9877118, -0.5487131, -2.447928, 0.9843137, 1, 0, 1,
-0.9872963, -0.3757381, -1.177264, 0.9803922, 1, 0, 1,
-0.986411, -1.363927, -2.080912, 0.972549, 1, 0, 1,
-0.9707525, 0.2367293, 0.3520776, 0.9686275, 1, 0, 1,
-0.9705275, 1.477737, -0.632028, 0.9607843, 1, 0, 1,
-0.9672986, -0.04164864, -1.318476, 0.9568627, 1, 0, 1,
-0.9571066, -0.4548416, -1.478947, 0.9490196, 1, 0, 1,
-0.946294, -0.3845522, -0.614132, 0.945098, 1, 0, 1,
-0.9459286, -0.2760375, -2.774328, 0.9372549, 1, 0, 1,
-0.9429695, -0.4185044, -2.605116, 0.9333333, 1, 0, 1,
-0.9424228, -0.4138662, -2.04554, 0.9254902, 1, 0, 1,
-0.9423859, -0.5141213, -3.214823, 0.9215686, 1, 0, 1,
-0.9358642, -1.727016, -4.010964, 0.9137255, 1, 0, 1,
-0.9316728, 1.329113, 0.06121646, 0.9098039, 1, 0, 1,
-0.9154929, -0.9481337, -1.17322, 0.9019608, 1, 0, 1,
-0.9149756, 2.032354, -1.507833, 0.8941177, 1, 0, 1,
-0.9126186, 0.07636914, -3.344061, 0.8901961, 1, 0, 1,
-0.9122332, -0.6524416, -1.628729, 0.8823529, 1, 0, 1,
-0.9083219, 0.0002800386, -1.911084, 0.8784314, 1, 0, 1,
-0.9076307, -1.989556, -2.091335, 0.8705882, 1, 0, 1,
-0.9066979, 1.050027, -2.051955, 0.8666667, 1, 0, 1,
-0.9037454, 0.06266095, -2.412384, 0.8588235, 1, 0, 1,
-0.8912476, -0.527005, -3.056102, 0.854902, 1, 0, 1,
-0.8862327, 1.006989, -0.2271043, 0.8470588, 1, 0, 1,
-0.8857195, 3.498522, -0.9158671, 0.8431373, 1, 0, 1,
-0.8856805, -0.6503903, -1.935642, 0.8352941, 1, 0, 1,
-0.8843705, -0.9947078, -2.505656, 0.8313726, 1, 0, 1,
-0.8774908, -0.5025192, -2.004508, 0.8235294, 1, 0, 1,
-0.8772912, 0.6132205, -0.6960062, 0.8196079, 1, 0, 1,
-0.8711676, 0.9434604, -0.06297876, 0.8117647, 1, 0, 1,
-0.8640466, -1.047665, -4.655301, 0.8078431, 1, 0, 1,
-0.8617551, 0.8423189, -2.584699, 0.8, 1, 0, 1,
-0.8616248, -0.3766196, -1.71498, 0.7921569, 1, 0, 1,
-0.8580003, -0.5145677, -0.6119875, 0.7882353, 1, 0, 1,
-0.8568119, 0.4712048, -0.7443663, 0.7803922, 1, 0, 1,
-0.8533526, 0.3116869, -2.922195, 0.7764706, 1, 0, 1,
-0.8433614, -0.7252879, -1.04615, 0.7686275, 1, 0, 1,
-0.8367342, -0.1039301, -1.588083, 0.7647059, 1, 0, 1,
-0.8341234, -1.564548, -3.02092, 0.7568628, 1, 0, 1,
-0.8339939, -0.4957372, -2.302943, 0.7529412, 1, 0, 1,
-0.832829, 0.5769268, -1.95335, 0.7450981, 1, 0, 1,
-0.8317291, -1.047021, -3.145482, 0.7411765, 1, 0, 1,
-0.8316585, 2.671002, -1.553554, 0.7333333, 1, 0, 1,
-0.8310175, 0.4203596, -1.564198, 0.7294118, 1, 0, 1,
-0.8308206, -0.8025351, -2.166446, 0.7215686, 1, 0, 1,
-0.8306719, 0.9902182, -1.224807, 0.7176471, 1, 0, 1,
-0.8252172, -1.108108, -1.713256, 0.7098039, 1, 0, 1,
-0.8125325, 1.100075, 0.2324624, 0.7058824, 1, 0, 1,
-0.809783, 0.03906624, -1.195553, 0.6980392, 1, 0, 1,
-0.8081939, -0.9234239, -2.810534, 0.6901961, 1, 0, 1,
-0.8044022, 0.5705149, -2.389917, 0.6862745, 1, 0, 1,
-0.8041441, -0.6100862, -1.767575, 0.6784314, 1, 0, 1,
-0.803433, 1.184314, 0.3304103, 0.6745098, 1, 0, 1,
-0.8000771, -1.130847, -3.983693, 0.6666667, 1, 0, 1,
-0.7957124, 0.9565958, -2.003316, 0.6627451, 1, 0, 1,
-0.794831, -0.9788724, -3.123487, 0.654902, 1, 0, 1,
-0.7916414, 0.4047549, -0.6306165, 0.6509804, 1, 0, 1,
-0.7893862, 0.6755399, 0.5263595, 0.6431373, 1, 0, 1,
-0.7879378, 0.5633247, -1.511332, 0.6392157, 1, 0, 1,
-0.7873932, -1.638978, -1.215546, 0.6313726, 1, 0, 1,
-0.7807878, 0.01623559, -0.881708, 0.627451, 1, 0, 1,
-0.7768591, -1.238511, -3.072671, 0.6196079, 1, 0, 1,
-0.7754718, 0.6278824, 1.331448, 0.6156863, 1, 0, 1,
-0.7676327, 0.276987, -1.739946, 0.6078432, 1, 0, 1,
-0.7661551, 0.2999502, 0.6834362, 0.6039216, 1, 0, 1,
-0.7648864, -0.03799693, -0.3899929, 0.5960785, 1, 0, 1,
-0.7642282, -0.5965104, -1.614964, 0.5882353, 1, 0, 1,
-0.763665, 0.3345045, -0.4873503, 0.5843138, 1, 0, 1,
-0.7620819, 1.000965, -0.6646349, 0.5764706, 1, 0, 1,
-0.7584983, 0.5312907, -2.465606, 0.572549, 1, 0, 1,
-0.7577712, 0.04248024, -1.421822, 0.5647059, 1, 0, 1,
-0.7574694, -1.537845, -2.567718, 0.5607843, 1, 0, 1,
-0.754688, 1.489198, -1.27314, 0.5529412, 1, 0, 1,
-0.7464432, 0.2505457, -0.7904494, 0.5490196, 1, 0, 1,
-0.7432703, 0.985222, -0.9230157, 0.5411765, 1, 0, 1,
-0.7429287, 1.323365, 0.4170247, 0.5372549, 1, 0, 1,
-0.738826, -2.241432, -3.573619, 0.5294118, 1, 0, 1,
-0.7344934, -0.06663843, -0.730149, 0.5254902, 1, 0, 1,
-0.7328331, -0.3302885, -2.11737, 0.5176471, 1, 0, 1,
-0.7324824, -1.918084, -4.794844, 0.5137255, 1, 0, 1,
-0.7302631, 1.553398, -1.110422, 0.5058824, 1, 0, 1,
-0.7245544, 1.208929, -0.3699317, 0.5019608, 1, 0, 1,
-0.719823, -1.752216, -1.903471, 0.4941176, 1, 0, 1,
-0.7174991, -1.107454, -1.305086, 0.4862745, 1, 0, 1,
-0.714891, 1.595675, -1.127937, 0.4823529, 1, 0, 1,
-0.7133182, -0.3011364, -1.783236, 0.4745098, 1, 0, 1,
-0.7131137, 0.6848935, -0.2997704, 0.4705882, 1, 0, 1,
-0.7117481, 1.755719, -0.2117916, 0.4627451, 1, 0, 1,
-0.7086044, -0.379724, -1.672923, 0.4588235, 1, 0, 1,
-0.702197, -0.2617968, -2.411768, 0.4509804, 1, 0, 1,
-0.7021049, -0.05912931, -1.890837, 0.4470588, 1, 0, 1,
-0.7017704, -0.704585, -4.165914, 0.4392157, 1, 0, 1,
-0.6981982, -0.1369798, -1.701648, 0.4352941, 1, 0, 1,
-0.6953615, 0.3427772, 0.3001344, 0.427451, 1, 0, 1,
-0.6927713, 1.588281, -1.248629, 0.4235294, 1, 0, 1,
-0.6923926, 0.06279481, 1.258965, 0.4156863, 1, 0, 1,
-0.6900313, -0.7969288, -1.831138, 0.4117647, 1, 0, 1,
-0.687662, 0.202151, -1.98973, 0.4039216, 1, 0, 1,
-0.686251, 0.5846919, -2.051129, 0.3960784, 1, 0, 1,
-0.6862051, -1.095728, -3.589572, 0.3921569, 1, 0, 1,
-0.6858968, -0.9634778, -3.056621, 0.3843137, 1, 0, 1,
-0.6815684, -0.02264475, -1.702747, 0.3803922, 1, 0, 1,
-0.6765492, 0.8342375, -0.685982, 0.372549, 1, 0, 1,
-0.671221, -0.4048875, -1.442037, 0.3686275, 1, 0, 1,
-0.670451, -0.2279699, -2.455312, 0.3607843, 1, 0, 1,
-0.668906, 0.9492394, -1.302285, 0.3568628, 1, 0, 1,
-0.6665144, -0.01728989, 0.6051568, 0.3490196, 1, 0, 1,
-0.656544, -0.8648411, -1.269031, 0.345098, 1, 0, 1,
-0.6549402, 0.6975623, 1.182104, 0.3372549, 1, 0, 1,
-0.6541452, -0.2760335, -2.263117, 0.3333333, 1, 0, 1,
-0.6527562, -2.577962, -2.782282, 0.3254902, 1, 0, 1,
-0.6503892, 0.08498843, -1.25854, 0.3215686, 1, 0, 1,
-0.6428501, 0.5974413, 0.3219215, 0.3137255, 1, 0, 1,
-0.6415001, 0.7495576, -1.120482, 0.3098039, 1, 0, 1,
-0.6413678, -0.23395, -3.090127, 0.3019608, 1, 0, 1,
-0.63958, -0.9870043, -3.189248, 0.2941177, 1, 0, 1,
-0.6379235, -0.5341278, -0.171172, 0.2901961, 1, 0, 1,
-0.6375982, 0.2079465, -0.04062276, 0.282353, 1, 0, 1,
-0.6361964, 0.4578131, -0.8466405, 0.2784314, 1, 0, 1,
-0.6358964, 1.499817, 0.1680339, 0.2705882, 1, 0, 1,
-0.6306121, -0.4461098, -2.364189, 0.2666667, 1, 0, 1,
-0.6299074, -1.146122, -2.344184, 0.2588235, 1, 0, 1,
-0.6280611, -1.332168, -3.203671, 0.254902, 1, 0, 1,
-0.6251008, -0.770483, -3.408884, 0.2470588, 1, 0, 1,
-0.6240319, 0.6976069, 0.09498633, 0.2431373, 1, 0, 1,
-0.6229649, 1.467891, 0.4484934, 0.2352941, 1, 0, 1,
-0.6226069, -0.6782889, -2.859184, 0.2313726, 1, 0, 1,
-0.6196864, -0.3787679, -1.036709, 0.2235294, 1, 0, 1,
-0.6185958, -0.4521083, -2.091029, 0.2196078, 1, 0, 1,
-0.6126542, -0.2691881, -3.031408, 0.2117647, 1, 0, 1,
-0.6107568, -1.268118, -1.115088, 0.2078431, 1, 0, 1,
-0.6057379, -1.390107, -4.387753, 0.2, 1, 0, 1,
-0.6054445, 0.9407175, -1.094513, 0.1921569, 1, 0, 1,
-0.6048084, 0.005965708, -2.601767, 0.1882353, 1, 0, 1,
-0.6010377, 0.5146599, -2.30407, 0.1803922, 1, 0, 1,
-0.6004371, -0.6870437, -2.075021, 0.1764706, 1, 0, 1,
-0.5887173, 2.192256, 0.59508, 0.1686275, 1, 0, 1,
-0.5881259, -0.2595413, -1.920945, 0.1647059, 1, 0, 1,
-0.5866086, -1.363987, -2.726276, 0.1568628, 1, 0, 1,
-0.5845712, -1.949555, -2.033286, 0.1529412, 1, 0, 1,
-0.5747643, 0.1587513, -3.748071, 0.145098, 1, 0, 1,
-0.57195, -0.5590772, -1.802469, 0.1411765, 1, 0, 1,
-0.5716295, -0.6694124, -2.558878, 0.1333333, 1, 0, 1,
-0.5705445, -0.8491015, -2.888367, 0.1294118, 1, 0, 1,
-0.5704277, -0.6524027, -2.658188, 0.1215686, 1, 0, 1,
-0.5626306, 0.2529297, 1.017215, 0.1176471, 1, 0, 1,
-0.5618719, -1.557507, -3.848625, 0.1098039, 1, 0, 1,
-0.5603389, -1.055708, -1.185084, 0.1058824, 1, 0, 1,
-0.5570987, -0.5777794, -2.467241, 0.09803922, 1, 0, 1,
-0.5531695, 0.7932203, -1.438822, 0.09019608, 1, 0, 1,
-0.5437401, 0.04092647, -1.572461, 0.08627451, 1, 0, 1,
-0.5421542, -1.064257, -0.9067404, 0.07843138, 1, 0, 1,
-0.541693, -1.697102, -2.068529, 0.07450981, 1, 0, 1,
-0.5364522, 1.541508, -0.3456285, 0.06666667, 1, 0, 1,
-0.5287373, 1.593758, -0.2006595, 0.0627451, 1, 0, 1,
-0.5269821, 0.7547081, -0.2498372, 0.05490196, 1, 0, 1,
-0.5242658, -0.1093614, -1.260994, 0.05098039, 1, 0, 1,
-0.5203986, -1.796294, -1.481529, 0.04313726, 1, 0, 1,
-0.5174365, 0.1453966, -1.530596, 0.03921569, 1, 0, 1,
-0.5046558, 2.923738, -0.5907839, 0.03137255, 1, 0, 1,
-0.5045488, 0.1274051, -2.541215, 0.02745098, 1, 0, 1,
-0.500996, 0.3288517, -2.28299, 0.01960784, 1, 0, 1,
-0.4981011, 0.2121908, -1.305398, 0.01568628, 1, 0, 1,
-0.4908291, -0.2519425, -2.965153, 0.007843138, 1, 0, 1,
-0.4874566, 0.4117962, -0.6850659, 0.003921569, 1, 0, 1,
-0.4842806, -0.06349419, -2.731834, 0, 1, 0.003921569, 1,
-0.4786616, 2.238906, 0.305741, 0, 1, 0.01176471, 1,
-0.4785976, 1.759295, -0.3642939, 0, 1, 0.01568628, 1,
-0.4770696, 0.1950786, -0.8094043, 0, 1, 0.02352941, 1,
-0.4761534, -0.22359, -1.237257, 0, 1, 0.02745098, 1,
-0.4750788, 0.7718428, 0.01972757, 0, 1, 0.03529412, 1,
-0.471566, 0.2185997, -0.2795978, 0, 1, 0.03921569, 1,
-0.4702686, -1.077002, -2.372272, 0, 1, 0.04705882, 1,
-0.464857, 1.210307, -0.5570967, 0, 1, 0.05098039, 1,
-0.4604125, 2.47348, -0.7853274, 0, 1, 0.05882353, 1,
-0.4588035, 0.1957642, -2.354171, 0, 1, 0.0627451, 1,
-0.4585765, -1.357791, -3.690562, 0, 1, 0.07058824, 1,
-0.4579414, 1.53095, -1.917309, 0, 1, 0.07450981, 1,
-0.4548716, 1.127827, -0.781522, 0, 1, 0.08235294, 1,
-0.4510458, -0.6527799, -1.145375, 0, 1, 0.08627451, 1,
-0.4447164, -0.4501438, -3.53765, 0, 1, 0.09411765, 1,
-0.4428864, 0.4903944, -1.10218, 0, 1, 0.1019608, 1,
-0.4390662, -1.208743, -2.612347, 0, 1, 0.1058824, 1,
-0.4373941, -1.132749, -1.762041, 0, 1, 0.1137255, 1,
-0.4346603, -0.3617291, -1.903965, 0, 1, 0.1176471, 1,
-0.424858, 0.7709121, -0.1427219, 0, 1, 0.1254902, 1,
-0.4201463, 1.688763, 0.3044281, 0, 1, 0.1294118, 1,
-0.4138368, 0.1309558, -1.73656, 0, 1, 0.1372549, 1,
-0.4130907, -1.343628, -2.715002, 0, 1, 0.1411765, 1,
-0.4113664, -1.146286, -3.118393, 0, 1, 0.1490196, 1,
-0.408135, -1.051842, -2.173514, 0, 1, 0.1529412, 1,
-0.404214, 0.4188728, 0.1085716, 0, 1, 0.1607843, 1,
-0.4038889, 1.732593, -0.6455493, 0, 1, 0.1647059, 1,
-0.4036948, -1.283274, -2.479777, 0, 1, 0.172549, 1,
-0.4035251, -0.03754324, -0.2106683, 0, 1, 0.1764706, 1,
-0.4029659, 0.1998035, -0.9207123, 0, 1, 0.1843137, 1,
-0.4026464, 2.628976, -1.502423, 0, 1, 0.1882353, 1,
-0.3998446, 2.245537, -1.251544, 0, 1, 0.1960784, 1,
-0.3956282, -0.3232917, -0.4026518, 0, 1, 0.2039216, 1,
-0.3950939, 0.6469513, -0.4676951, 0, 1, 0.2078431, 1,
-0.3942141, 0.3979175, -0.1822858, 0, 1, 0.2156863, 1,
-0.3925988, -0.004640457, -2.674609, 0, 1, 0.2196078, 1,
-0.3891581, 1.279057, -0.1535867, 0, 1, 0.227451, 1,
-0.3891017, -1.541452, -1.705642, 0, 1, 0.2313726, 1,
-0.3863628, 0.206018, -1.705765, 0, 1, 0.2392157, 1,
-0.3795434, 2.07925, 1.926286, 0, 1, 0.2431373, 1,
-0.3793467, -1.186065, -3.437198, 0, 1, 0.2509804, 1,
-0.371004, -1.195182, -2.023363, 0, 1, 0.254902, 1,
-0.368978, -0.5424335, -2.221325, 0, 1, 0.2627451, 1,
-0.3562227, -0.6712629, -2.899835, 0, 1, 0.2666667, 1,
-0.352798, -0.6613484, -1.135212, 0, 1, 0.2745098, 1,
-0.3522443, -0.4167067, -2.622455, 0, 1, 0.2784314, 1,
-0.3515629, 0.8039504, -1.698731, 0, 1, 0.2862745, 1,
-0.3514945, -0.2455122, -1.77291, 0, 1, 0.2901961, 1,
-0.3480279, -0.7032132, -3.436934, 0, 1, 0.2980392, 1,
-0.3476392, -0.1894785, -2.958127, 0, 1, 0.3058824, 1,
-0.3424855, -0.313627, -3.498674, 0, 1, 0.3098039, 1,
-0.3409857, 0.1744628, -1.052934, 0, 1, 0.3176471, 1,
-0.3399774, -0.287016, -2.420332, 0, 1, 0.3215686, 1,
-0.3398391, 1.161659, 0.7549366, 0, 1, 0.3294118, 1,
-0.3395495, 0.6667213, 0.5483507, 0, 1, 0.3333333, 1,
-0.3394825, -1.32537, -2.465157, 0, 1, 0.3411765, 1,
-0.3304015, -0.4632235, -1.624717, 0, 1, 0.345098, 1,
-0.3216798, 1.588241, 2.368308, 0, 1, 0.3529412, 1,
-0.3179292, -0.2836868, -2.349673, 0, 1, 0.3568628, 1,
-0.3109996, 0.2432989, -0.852753, 0, 1, 0.3647059, 1,
-0.3103422, 1.503096, 0.3854291, 0, 1, 0.3686275, 1,
-0.308897, 1.084334, -0.1878606, 0, 1, 0.3764706, 1,
-0.3033177, 0.04917802, -1.163672, 0, 1, 0.3803922, 1,
-0.302543, 1.931397, 0.04069258, 0, 1, 0.3882353, 1,
-0.29906, -1.495354, -3.554503, 0, 1, 0.3921569, 1,
-0.2953149, 0.3154197, -0.0995485, 0, 1, 0.4, 1,
-0.2933368, -1.87246, -1.716408, 0, 1, 0.4078431, 1,
-0.2931521, -0.7339447, -0.7912602, 0, 1, 0.4117647, 1,
-0.2928862, 0.9873701, -1.496955, 0, 1, 0.4196078, 1,
-0.291388, 0.6187017, -1.456755, 0, 1, 0.4235294, 1,
-0.2890903, 0.2905908, 0.2451701, 0, 1, 0.4313726, 1,
-0.2877784, -1.138782, -3.361605, 0, 1, 0.4352941, 1,
-0.283536, -0.07285432, -3.189113, 0, 1, 0.4431373, 1,
-0.2820643, -0.6610762, -2.624716, 0, 1, 0.4470588, 1,
-0.2787153, -0.4427619, -2.317954, 0, 1, 0.454902, 1,
-0.271419, 0.2375658, 0.53835, 0, 1, 0.4588235, 1,
-0.2666149, 0.1492189, -1.665603, 0, 1, 0.4666667, 1,
-0.2663317, -0.4065948, -3.241334, 0, 1, 0.4705882, 1,
-0.2600489, 2.320701, -0.3693722, 0, 1, 0.4784314, 1,
-0.2586385, 0.7080832, -1.767618, 0, 1, 0.4823529, 1,
-0.2534897, -0.4206044, -2.725895, 0, 1, 0.4901961, 1,
-0.2531079, 0.4696579, 0.3636832, 0, 1, 0.4941176, 1,
-0.2484943, 1.133235, -0.2846391, 0, 1, 0.5019608, 1,
-0.2472507, -0.2884623, -4.183349, 0, 1, 0.509804, 1,
-0.246712, -0.4583933, -2.98904, 0, 1, 0.5137255, 1,
-0.2466366, 0.6032992, 0.7361693, 0, 1, 0.5215687, 1,
-0.2458273, 1.244624, 0.6361081, 0, 1, 0.5254902, 1,
-0.2382054, 1.956921, 0.8077842, 0, 1, 0.5333334, 1,
-0.2363965, 1.176816, 0.5298132, 0, 1, 0.5372549, 1,
-0.234813, -2.320814, -2.52204, 0, 1, 0.5450981, 1,
-0.2326422, 0.1828486, -2.302246, 0, 1, 0.5490196, 1,
-0.2288651, -0.3179072, -2.957817, 0, 1, 0.5568628, 1,
-0.2215363, -0.4905745, -3.112117, 0, 1, 0.5607843, 1,
-0.2188888, -0.1410079, -1.525028, 0, 1, 0.5686275, 1,
-0.2152399, -0.2854518, -2.446794, 0, 1, 0.572549, 1,
-0.2089569, 0.2809649, -1.555651, 0, 1, 0.5803922, 1,
-0.2062513, -1.235415, -2.430883, 0, 1, 0.5843138, 1,
-0.2048927, 0.2230468, -0.5279087, 0, 1, 0.5921569, 1,
-0.2048105, -0.4919589, -4.088473, 0, 1, 0.5960785, 1,
-0.1995473, -0.07939775, -3.682031, 0, 1, 0.6039216, 1,
-0.1983516, -0.4490244, -3.794236, 0, 1, 0.6117647, 1,
-0.1967338, 1.876877, -1.262398, 0, 1, 0.6156863, 1,
-0.195446, -0.05044858, -2.322157, 0, 1, 0.6235294, 1,
-0.1947737, 1.421644, -0.006542322, 0, 1, 0.627451, 1,
-0.194315, 0.4549716, -1.742837, 0, 1, 0.6352941, 1,
-0.190904, 1.086192, -0.1156526, 0, 1, 0.6392157, 1,
-0.1905366, -0.9847546, -2.542385, 0, 1, 0.6470588, 1,
-0.1867156, -1.152808, -2.812393, 0, 1, 0.6509804, 1,
-0.1846871, 0.4136082, -1.523882, 0, 1, 0.6588235, 1,
-0.1830457, 1.526009, 0.9046308, 0, 1, 0.6627451, 1,
-0.1813153, -0.8073392, -2.603996, 0, 1, 0.6705883, 1,
-0.1785277, 0.3760906, 0.3685133, 0, 1, 0.6745098, 1,
-0.1763101, 2.305141, -1.2039, 0, 1, 0.682353, 1,
-0.1738565, 1.004616, -0.2229124, 0, 1, 0.6862745, 1,
-0.1722292, -0.4237403, -1.691036, 0, 1, 0.6941177, 1,
-0.1663007, 1.211466, -0.9179039, 0, 1, 0.7019608, 1,
-0.1661679, 0.2346264, -0.5679713, 0, 1, 0.7058824, 1,
-0.1639641, -0.9220083, -2.383697, 0, 1, 0.7137255, 1,
-0.1611195, -0.3110712, -2.346402, 0, 1, 0.7176471, 1,
-0.1554678, -0.9012606, -3.471832, 0, 1, 0.7254902, 1,
-0.1548362, -0.3957373, -3.926046, 0, 1, 0.7294118, 1,
-0.1534055, -0.3818543, -1.156621, 0, 1, 0.7372549, 1,
-0.1425779, 0.5958428, -2.267351, 0, 1, 0.7411765, 1,
-0.1410516, -0.1498174, -1.450712, 0, 1, 0.7490196, 1,
-0.1373017, -0.6271651, -2.408584, 0, 1, 0.7529412, 1,
-0.1370066, 1.856583, -0.2228916, 0, 1, 0.7607843, 1,
-0.1348488, -0.6222572, -2.807147, 0, 1, 0.7647059, 1,
-0.1326816, 1.047139, -1.651724, 0, 1, 0.772549, 1,
-0.1226485, 0.6707161, 0.6240776, 0, 1, 0.7764706, 1,
-0.1221324, -0.8579676, -2.574204, 0, 1, 0.7843137, 1,
-0.1194322, -0.1366127, -3.94541, 0, 1, 0.7882353, 1,
-0.1190382, -0.4342483, -1.237482, 0, 1, 0.7960784, 1,
-0.1089365, -0.4411792, -0.4976441, 0, 1, 0.8039216, 1,
-0.1031933, -1.136892, -1.360545, 0, 1, 0.8078431, 1,
-0.1028637, -0.08287156, -0.6111541, 0, 1, 0.8156863, 1,
-0.1015067, -0.2791042, -3.718573, 0, 1, 0.8196079, 1,
-0.1002635, 0.1893448, -0.2049841, 0, 1, 0.827451, 1,
-0.0991712, -1.368164, -3.069983, 0, 1, 0.8313726, 1,
-0.09699341, 0.2523802, -0.2614782, 0, 1, 0.8392157, 1,
-0.09516941, 1.768059, -0.4770318, 0, 1, 0.8431373, 1,
-0.09252042, -2.034846, -4.100884, 0, 1, 0.8509804, 1,
-0.09211864, -0.02525098, -1.559719, 0, 1, 0.854902, 1,
-0.09134936, -0.5487393, -1.997532, 0, 1, 0.8627451, 1,
-0.08977018, -0.3914244, -2.385529, 0, 1, 0.8666667, 1,
-0.08570542, -0.6094712, -3.79197, 0, 1, 0.8745098, 1,
-0.08227369, -0.210329, -2.657401, 0, 1, 0.8784314, 1,
-0.07276887, 0.7541381, 1.413362, 0, 1, 0.8862745, 1,
-0.06748304, 0.5944619, -0.3181803, 0, 1, 0.8901961, 1,
-0.06613984, -0.9186775, -3.136391, 0, 1, 0.8980392, 1,
-0.06553679, 0.7023544, 0.9237521, 0, 1, 0.9058824, 1,
-0.06523949, -0.2532097, -1.063195, 0, 1, 0.9098039, 1,
-0.06400269, 0.2240562, 2.46751, 0, 1, 0.9176471, 1,
-0.06143729, 1.598275, 0.4440361, 0, 1, 0.9215686, 1,
-0.05447996, 1.60493, -2.120305, 0, 1, 0.9294118, 1,
-0.04944931, 0.2049812, 0.1547325, 0, 1, 0.9333333, 1,
-0.04843427, 0.9171439, 0.7167234, 0, 1, 0.9411765, 1,
-0.03921973, 1.423622, -0.9981125, 0, 1, 0.945098, 1,
-0.03888449, 0.1755871, 0.805456, 0, 1, 0.9529412, 1,
-0.03874497, 0.9183334, 2.605731, 0, 1, 0.9568627, 1,
-0.03854681, 0.8386508, -1.257264, 0, 1, 0.9647059, 1,
-0.03615124, 1.474965, -0.5807897, 0, 1, 0.9686275, 1,
-0.03478798, -0.3241484, -2.869171, 0, 1, 0.9764706, 1,
-0.03467872, -1.489079, -3.49171, 0, 1, 0.9803922, 1,
-0.03451141, 1.61548, 1.011683, 0, 1, 0.9882353, 1,
-0.03292198, -1.622864, -2.869436, 0, 1, 0.9921569, 1,
-0.0320511, -1.015157, -4.017242, 0, 1, 1, 1,
-0.02838124, -1.707946, -3.527678, 0, 0.9921569, 1, 1,
-0.02605905, 0.3273145, 0.8822743, 0, 0.9882353, 1, 1,
-0.02206292, -0.33154, -2.404812, 0, 0.9803922, 1, 1,
-0.01959174, -0.6708824, -3.264548, 0, 0.9764706, 1, 1,
-0.01480411, 0.4263959, -0.8483855, 0, 0.9686275, 1, 1,
-0.01440019, 1.41166, 0.8020872, 0, 0.9647059, 1, 1,
-0.01221125, 0.3826343, 1.393094, 0, 0.9568627, 1, 1,
-0.0065523, -0.361427, -2.074849, 0, 0.9529412, 1, 1,
-0.006513907, -0.8306724, -3.890024, 0, 0.945098, 1, 1,
-0.005378533, -0.01339095, -4.535025, 0, 0.9411765, 1, 1,
-0.005346959, -0.05687816, -3.286809, 0, 0.9333333, 1, 1,
-0.001935944, 0.5895133, 2.110923, 0, 0.9294118, 1, 1,
0.0006107832, -0.7721346, 3.624064, 0, 0.9215686, 1, 1,
0.00248631, 0.9194745, -0.9735695, 0, 0.9176471, 1, 1,
0.008239943, 0.7663773, -0.4815404, 0, 0.9098039, 1, 1,
0.01000731, 0.1627248, 0.08301737, 0, 0.9058824, 1, 1,
0.01318791, -1.115086, 3.548479, 0, 0.8980392, 1, 1,
0.01346439, -1.324336, 4.773537, 0, 0.8901961, 1, 1,
0.01413855, -0.9825928, 5.230731, 0, 0.8862745, 1, 1,
0.01427145, 0.8143784, 1.283489, 0, 0.8784314, 1, 1,
0.01429402, -0.4955288, 0.7421035, 0, 0.8745098, 1, 1,
0.01655937, -0.9455281, 3.500446, 0, 0.8666667, 1, 1,
0.02062516, -0.1740308, 3.411974, 0, 0.8627451, 1, 1,
0.02177781, 0.6082125, -0.7210243, 0, 0.854902, 1, 1,
0.0218274, 0.42088, -0.980279, 0, 0.8509804, 1, 1,
0.02367629, -0.009183374, 1.982468, 0, 0.8431373, 1, 1,
0.02461868, 1.415551, 0.3038938, 0, 0.8392157, 1, 1,
0.02805809, 0.02367648, 0.9302208, 0, 0.8313726, 1, 1,
0.03196044, 0.4449781, -0.9169957, 0, 0.827451, 1, 1,
0.03630387, 1.327497, -0.6823319, 0, 0.8196079, 1, 1,
0.03863578, -0.5576177, 0.8744338, 0, 0.8156863, 1, 1,
0.03985736, -0.9131222, 4.216859, 0, 0.8078431, 1, 1,
0.04639377, -1.763471, 4.451505, 0, 0.8039216, 1, 1,
0.04764405, -0.6150694, 3.959123, 0, 0.7960784, 1, 1,
0.04889394, -0.5788454, 1.518711, 0, 0.7882353, 1, 1,
0.05323264, 0.9232051, -0.2079851, 0, 0.7843137, 1, 1,
0.05470349, -1.379282, 1.495734, 0, 0.7764706, 1, 1,
0.05663664, -0.363229, 2.877899, 0, 0.772549, 1, 1,
0.05761208, -0.6283762, 3.042815, 0, 0.7647059, 1, 1,
0.05784469, -1.80291, 4.426599, 0, 0.7607843, 1, 1,
0.05898411, -0.206983, 1.509655, 0, 0.7529412, 1, 1,
0.06025561, -0.4835678, 3.992998, 0, 0.7490196, 1, 1,
0.06423154, 0.3545602, 1.302721, 0, 0.7411765, 1, 1,
0.06570709, 1.160664, -0.9125205, 0, 0.7372549, 1, 1,
0.06615657, 1.797319, 0.32612, 0, 0.7294118, 1, 1,
0.06711122, -0.381451, 2.692193, 0, 0.7254902, 1, 1,
0.06867135, 0.732387, 0.009534717, 0, 0.7176471, 1, 1,
0.07879381, -0.1610923, 1.908612, 0, 0.7137255, 1, 1,
0.08450102, -1.625084, 5.051652, 0, 0.7058824, 1, 1,
0.08468948, -0.4282394, 2.397319, 0, 0.6980392, 1, 1,
0.08482595, -0.2278544, 2.737448, 0, 0.6941177, 1, 1,
0.0855355, 0.2653969, 0.417578, 0, 0.6862745, 1, 1,
0.08668871, 2.603462, 0.9632022, 0, 0.682353, 1, 1,
0.08712208, -0.6942424, 4.219268, 0, 0.6745098, 1, 1,
0.08777353, -1.48228, 2.827149, 0, 0.6705883, 1, 1,
0.09014334, 1.14604, -0.7016229, 0, 0.6627451, 1, 1,
0.0912882, -0.1783352, 3.28161, 0, 0.6588235, 1, 1,
0.0979237, -1.0978, 3.630891, 0, 0.6509804, 1, 1,
0.09849554, -0.6517613, 1.856665, 0, 0.6470588, 1, 1,
0.1015214, 0.06121785, 1.493297, 0, 0.6392157, 1, 1,
0.1139357, -0.09777366, 1.519903, 0, 0.6352941, 1, 1,
0.114464, 0.4198161, -0.5226272, 0, 0.627451, 1, 1,
0.1149006, -1.596406, 2.729651, 0, 0.6235294, 1, 1,
0.1154998, 0.147209, -0.06950803, 0, 0.6156863, 1, 1,
0.1217836, 1.367368, 0.7630151, 0, 0.6117647, 1, 1,
0.1248989, -0.1343481, 1.344716, 0, 0.6039216, 1, 1,
0.1271046, 0.3442394, 0.7129961, 0, 0.5960785, 1, 1,
0.1273057, 0.288435, 0.6178955, 0, 0.5921569, 1, 1,
0.1284959, 0.8972667, -0.8578956, 0, 0.5843138, 1, 1,
0.1309635, 0.3728652, 2.02051, 0, 0.5803922, 1, 1,
0.1355813, -0.5158654, 2.159252, 0, 0.572549, 1, 1,
0.1366581, -0.1519401, 3.271556, 0, 0.5686275, 1, 1,
0.1421214, -0.114966, 2.090397, 0, 0.5607843, 1, 1,
0.1462649, -0.3265243, 2.392591, 0, 0.5568628, 1, 1,
0.1469856, 1.802088, 0.8848745, 0, 0.5490196, 1, 1,
0.1471845, -0.6225104, 1.62918, 0, 0.5450981, 1, 1,
0.1475113, 0.1360107, -0.5837116, 0, 0.5372549, 1, 1,
0.1534291, -0.9652067, 4.039627, 0, 0.5333334, 1, 1,
0.1534386, 0.3050568, -1.272558, 0, 0.5254902, 1, 1,
0.1554399, 1.000587, -2.126404, 0, 0.5215687, 1, 1,
0.1558576, 0.4770401, 0.4204646, 0, 0.5137255, 1, 1,
0.1578471, -0.2312523, 2.065415, 0, 0.509804, 1, 1,
0.1585828, 0.3829929, -0.2453251, 0, 0.5019608, 1, 1,
0.1616168, 0.02852485, 0.3521515, 0, 0.4941176, 1, 1,
0.1628421, -0.6129074, 2.91729, 0, 0.4901961, 1, 1,
0.1633283, 0.4138574, 1.696037, 0, 0.4823529, 1, 1,
0.1634266, 0.5796779, 0.2271337, 0, 0.4784314, 1, 1,
0.1652076, 0.1063345, 0.3012311, 0, 0.4705882, 1, 1,
0.1658848, -2.005759, 2.074038, 0, 0.4666667, 1, 1,
0.1747238, 2.627105, 0.3182994, 0, 0.4588235, 1, 1,
0.181826, 1.177774, -1.029773, 0, 0.454902, 1, 1,
0.1843138, -1.269361, 3.97664, 0, 0.4470588, 1, 1,
0.1846113, 0.02102858, 1.677351, 0, 0.4431373, 1, 1,
0.1855106, -1.04486, 3.080243, 0, 0.4352941, 1, 1,
0.1874259, -2.401442, 3.327131, 0, 0.4313726, 1, 1,
0.1875431, 0.9205731, -0.3097, 0, 0.4235294, 1, 1,
0.1940852, 0.1261703, 0.8586984, 0, 0.4196078, 1, 1,
0.196166, 0.01588701, 2.9502, 0, 0.4117647, 1, 1,
0.1980623, -1.771737, 3.456652, 0, 0.4078431, 1, 1,
0.2001469, 0.6699057, 1.421048, 0, 0.4, 1, 1,
0.2009845, 0.01575395, -0.3340299, 0, 0.3921569, 1, 1,
0.2042916, 0.5087032, 1.61121, 0, 0.3882353, 1, 1,
0.2060837, 0.8432064, 1.797533, 0, 0.3803922, 1, 1,
0.2069842, -1.784078, 4.095234, 0, 0.3764706, 1, 1,
0.2072133, 0.4551224, -1.257784, 0, 0.3686275, 1, 1,
0.2105923, -0.9654294, 2.541853, 0, 0.3647059, 1, 1,
0.2149032, -1.372772, 4.472812, 0, 0.3568628, 1, 1,
0.2246609, 0.3431495, 1.379613, 0, 0.3529412, 1, 1,
0.2269721, -0.6003477, 4.861035, 0, 0.345098, 1, 1,
0.2282551, -0.5636006, 2.48037, 0, 0.3411765, 1, 1,
0.2301948, -0.4479315, 3.131586, 0, 0.3333333, 1, 1,
0.2319506, -0.3189636, 3.639436, 0, 0.3294118, 1, 1,
0.2373831, 0.731202, -0.3131211, 0, 0.3215686, 1, 1,
0.2382443, -0.8552725, 5.419909, 0, 0.3176471, 1, 1,
0.2461544, -0.9714428, 3.561759, 0, 0.3098039, 1, 1,
0.2529444, 0.09034958, 3.320811, 0, 0.3058824, 1, 1,
0.2543074, -1.787883, 4.822374, 0, 0.2980392, 1, 1,
0.2553443, -0.4578429, 4.6085, 0, 0.2901961, 1, 1,
0.2594537, 0.4683393, 0.390713, 0, 0.2862745, 1, 1,
0.26305, -1.319675, 2.58598, 0, 0.2784314, 1, 1,
0.2635791, -1.078239, 2.616821, 0, 0.2745098, 1, 1,
0.2648275, -1.16507, 3.371205, 0, 0.2666667, 1, 1,
0.2651443, -0.3937334, 2.350838, 0, 0.2627451, 1, 1,
0.2685937, 1.119896, -0.2848129, 0, 0.254902, 1, 1,
0.2722951, -1.066596, 2.792248, 0, 0.2509804, 1, 1,
0.2781718, -0.9788039, 4.135151, 0, 0.2431373, 1, 1,
0.2804725, 1.047824, -0.6696517, 0, 0.2392157, 1, 1,
0.2808566, 1.871383, -0.07288203, 0, 0.2313726, 1, 1,
0.2823526, -1.0027, 3.151285, 0, 0.227451, 1, 1,
0.2858673, 0.3490022, -2.657198, 0, 0.2196078, 1, 1,
0.2880353, -0.1019416, 1.355527, 0, 0.2156863, 1, 1,
0.2920894, 0.2571981, 0.3495494, 0, 0.2078431, 1, 1,
0.2928236, -0.2510304, 3.521613, 0, 0.2039216, 1, 1,
0.2967839, 0.04310242, 1.806161, 0, 0.1960784, 1, 1,
0.2974577, -0.342064, 3.758775, 0, 0.1882353, 1, 1,
0.2989278, -0.3834724, 2.995384, 0, 0.1843137, 1, 1,
0.3012023, -0.2512586, 1.322075, 0, 0.1764706, 1, 1,
0.3028993, -0.001874673, 2.788515, 0, 0.172549, 1, 1,
0.303099, -0.2479376, 3.739787, 0, 0.1647059, 1, 1,
0.3054695, 1.175855, 0.7609407, 0, 0.1607843, 1, 1,
0.3085465, 0.01046904, 0.7509513, 0, 0.1529412, 1, 1,
0.3088504, 1.163627, -0.502463, 0, 0.1490196, 1, 1,
0.3097704, -1.095437, 3.457741, 0, 0.1411765, 1, 1,
0.3145116, -0.004933215, 2.74534, 0, 0.1372549, 1, 1,
0.3199146, 0.6597399, -0.2418261, 0, 0.1294118, 1, 1,
0.3208214, 0.2078277, 1.768868, 0, 0.1254902, 1, 1,
0.3253258, 1.348176, -0.6888223, 0, 0.1176471, 1, 1,
0.3253374, -1.117171, 2.932187, 0, 0.1137255, 1, 1,
0.3274503, -0.1504807, 2.681549, 0, 0.1058824, 1, 1,
0.3276445, -0.6206822, 2.041783, 0, 0.09803922, 1, 1,
0.3328078, -0.9630254, 2.471765, 0, 0.09411765, 1, 1,
0.3372172, -0.567951, 2.65164, 0, 0.08627451, 1, 1,
0.3443784, 0.4829859, 0.5038811, 0, 0.08235294, 1, 1,
0.3452597, 0.7269094, 1.294121, 0, 0.07450981, 1, 1,
0.353587, -2.010516, 4.41822, 0, 0.07058824, 1, 1,
0.3639985, 1.141633, 1.122726, 0, 0.0627451, 1, 1,
0.3657334, -0.4436508, 2.813702, 0, 0.05882353, 1, 1,
0.3668436, 0.1784054, 1.573966, 0, 0.05098039, 1, 1,
0.3737121, -0.6716263, 3.571303, 0, 0.04705882, 1, 1,
0.3744222, -0.167709, 0.5538566, 0, 0.03921569, 1, 1,
0.3748379, -1.537608, 1.773047, 0, 0.03529412, 1, 1,
0.3769547, -1.954967, 3.621927, 0, 0.02745098, 1, 1,
0.3795617, 0.6665576, 0.6276997, 0, 0.02352941, 1, 1,
0.3799354, 0.6416128, 0.6586939, 0, 0.01568628, 1, 1,
0.3850243, -0.7874755, 2.535386, 0, 0.01176471, 1, 1,
0.3924287, -0.1480988, 1.627753, 0, 0.003921569, 1, 1,
0.3935427, 0.1539856, 1.469094, 0.003921569, 0, 1, 1,
0.3951093, -0.7658476, 2.116127, 0.007843138, 0, 1, 1,
0.4044629, 0.9267322, 1.033777, 0.01568628, 0, 1, 1,
0.4046763, 1.244889, -0.8714838, 0.01960784, 0, 1, 1,
0.4084652, 0.1578781, 1.371884, 0.02745098, 0, 1, 1,
0.4124039, -0.3956285, 1.94018, 0.03137255, 0, 1, 1,
0.4163423, -1.427765, 1.323083, 0.03921569, 0, 1, 1,
0.4277316, 0.1424453, 1.498281, 0.04313726, 0, 1, 1,
0.4313318, 0.4450181, 1.310444, 0.05098039, 0, 1, 1,
0.4325997, -0.9981814, 1.971161, 0.05490196, 0, 1, 1,
0.4354574, 0.6771212, 1.102121, 0.0627451, 0, 1, 1,
0.4363699, 0.6204984, 2.581805, 0.06666667, 0, 1, 1,
0.4388307, 0.6391547, 1.958331, 0.07450981, 0, 1, 1,
0.4391826, 1.685334, 0.1915792, 0.07843138, 0, 1, 1,
0.4426544, 0.130807, -0.08874635, 0.08627451, 0, 1, 1,
0.4439869, -0.2810462, 0.5948998, 0.09019608, 0, 1, 1,
0.4456603, -0.6326719, 2.717114, 0.09803922, 0, 1, 1,
0.4486738, 1.196399, 0.7557597, 0.1058824, 0, 1, 1,
0.4490258, 0.2912186, 2.253967, 0.1098039, 0, 1, 1,
0.4510007, -0.5064167, 4.042274, 0.1176471, 0, 1, 1,
0.455686, -0.7554906, 0.8394328, 0.1215686, 0, 1, 1,
0.4594073, -1.31977, 2.171606, 0.1294118, 0, 1, 1,
0.4598068, 1.927822, 0.51886, 0.1333333, 0, 1, 1,
0.4624121, 0.6811197, 1.510923, 0.1411765, 0, 1, 1,
0.4657404, 1.76848, 1.396168, 0.145098, 0, 1, 1,
0.4680618, 1.079084, -1.057151, 0.1529412, 0, 1, 1,
0.4692375, -0.3929751, 1.616465, 0.1568628, 0, 1, 1,
0.4701602, -0.02048826, 2.562813, 0.1647059, 0, 1, 1,
0.4759231, 1.906478, -0.4561202, 0.1686275, 0, 1, 1,
0.4761075, -1.045138, 3.039878, 0.1764706, 0, 1, 1,
0.4810476, -0.9176715, 1.245867, 0.1803922, 0, 1, 1,
0.4856802, -0.8487576, 1.790377, 0.1882353, 0, 1, 1,
0.48659, -1.459114, 2.057541, 0.1921569, 0, 1, 1,
0.4894926, -0.4104167, 1.140959, 0.2, 0, 1, 1,
0.4946926, -1.124247, 1.825336, 0.2078431, 0, 1, 1,
0.4949639, 0.7494921, -0.514611, 0.2117647, 0, 1, 1,
0.4950825, 1.307751, 2.27909, 0.2196078, 0, 1, 1,
0.4952679, -1.552881, 2.629983, 0.2235294, 0, 1, 1,
0.4970688, -1.318037, 3.529787, 0.2313726, 0, 1, 1,
0.4990053, -0.6966131, 1.966361, 0.2352941, 0, 1, 1,
0.5017353, 0.3875562, 0.8297463, 0.2431373, 0, 1, 1,
0.5021772, 1.043565, 1.071581, 0.2470588, 0, 1, 1,
0.5053974, 0.1376145, 1.435632, 0.254902, 0, 1, 1,
0.5062998, -0.1647533, 1.278264, 0.2588235, 0, 1, 1,
0.5072839, -0.2776974, 0.9218481, 0.2666667, 0, 1, 1,
0.5085419, -0.385571, 1.759562, 0.2705882, 0, 1, 1,
0.5207582, -0.3365749, 1.097023, 0.2784314, 0, 1, 1,
0.5249715, 0.6454051, 1.523644, 0.282353, 0, 1, 1,
0.5272886, -0.1219811, 2.141911, 0.2901961, 0, 1, 1,
0.5286118, -0.8018641, 3.337171, 0.2941177, 0, 1, 1,
0.5323244, -0.8149451, 2.292756, 0.3019608, 0, 1, 1,
0.5350907, 0.5438448, 1.211084, 0.3098039, 0, 1, 1,
0.5517913, -0.09259038, 1.076254, 0.3137255, 0, 1, 1,
0.5558342, -1.748992, 2.709455, 0.3215686, 0, 1, 1,
0.5663138, -2.819003, 5.684307, 0.3254902, 0, 1, 1,
0.5670044, 0.2274664, 1.530932, 0.3333333, 0, 1, 1,
0.5673007, -1.47667, 3.572385, 0.3372549, 0, 1, 1,
0.5733555, -0.4995342, 1.223823, 0.345098, 0, 1, 1,
0.5733806, -0.9636446, 3.777849, 0.3490196, 0, 1, 1,
0.5759309, -1.126559, 3.562864, 0.3568628, 0, 1, 1,
0.5779505, 1.600878, -0.09952544, 0.3607843, 0, 1, 1,
0.5781476, 1.01834, -1.253478, 0.3686275, 0, 1, 1,
0.5820513, -0.4734969, 3.323929, 0.372549, 0, 1, 1,
0.5855182, -1.263437, 2.628445, 0.3803922, 0, 1, 1,
0.5880077, 0.469198, 0.7853289, 0.3843137, 0, 1, 1,
0.5891587, -1.58374, 2.099789, 0.3921569, 0, 1, 1,
0.5912834, -0.136703, 0.616716, 0.3960784, 0, 1, 1,
0.5923574, -0.7338165, 2.313508, 0.4039216, 0, 1, 1,
0.5985948, 0.03941499, 1.03353, 0.4117647, 0, 1, 1,
0.5996966, 0.8115824, 0.9677663, 0.4156863, 0, 1, 1,
0.6086235, 0.7662672, 0.6888339, 0.4235294, 0, 1, 1,
0.6099308, 0.5661384, 0.9313815, 0.427451, 0, 1, 1,
0.6207937, -0.4095697, 1.289633, 0.4352941, 0, 1, 1,
0.6236302, -2.093008, 3.841023, 0.4392157, 0, 1, 1,
0.6254068, -1.475773, 2.892797, 0.4470588, 0, 1, 1,
0.6284201, -0.5133862, 0.8219527, 0.4509804, 0, 1, 1,
0.6298549, -1.793687, 3.036125, 0.4588235, 0, 1, 1,
0.6300671, 0.7761865, 0.282082, 0.4627451, 0, 1, 1,
0.6307866, -0.5721637, 1.463041, 0.4705882, 0, 1, 1,
0.6308367, 0.5952544, 0.3338269, 0.4745098, 0, 1, 1,
0.6309752, 1.008299, 0.8321238, 0.4823529, 0, 1, 1,
0.6336097, -1.921405, 2.008771, 0.4862745, 0, 1, 1,
0.6364549, -0.22579, -0.1288254, 0.4941176, 0, 1, 1,
0.6394626, -1.827248, 0.5741026, 0.5019608, 0, 1, 1,
0.6465027, -0.296948, 2.778394, 0.5058824, 0, 1, 1,
0.6482355, -0.2930107, 1.653075, 0.5137255, 0, 1, 1,
0.6518345, -0.2069477, 0.6421363, 0.5176471, 0, 1, 1,
0.6612362, 1.849409, 0.1009842, 0.5254902, 0, 1, 1,
0.6680538, 0.9040481, 2.783254, 0.5294118, 0, 1, 1,
0.6801137, 1.222906, -0.2039335, 0.5372549, 0, 1, 1,
0.6813294, 0.7594949, 0.3856729, 0.5411765, 0, 1, 1,
0.683193, 0.6719698, 1.34407, 0.5490196, 0, 1, 1,
0.6868938, 0.4890481, 0.6429656, 0.5529412, 0, 1, 1,
0.6903449, -1.066997, 2.078629, 0.5607843, 0, 1, 1,
0.6957158, 0.5860209, 0.8776646, 0.5647059, 0, 1, 1,
0.6982498, 0.9257128, 1.447034, 0.572549, 0, 1, 1,
0.7021141, 0.2495002, 1.214285, 0.5764706, 0, 1, 1,
0.7021658, 0.08842311, 3.224718, 0.5843138, 0, 1, 1,
0.716237, 0.8909002, 0.2653404, 0.5882353, 0, 1, 1,
0.7185112, 1.027877, 0.4157902, 0.5960785, 0, 1, 1,
0.7277381, 1.526249, 0.5310832, 0.6039216, 0, 1, 1,
0.7283936, -1.756465, 3.28707, 0.6078432, 0, 1, 1,
0.7377092, -0.8357398, 0.5119283, 0.6156863, 0, 1, 1,
0.7389495, -1.158249, 2.591205, 0.6196079, 0, 1, 1,
0.7396374, -2.047898, 3.583562, 0.627451, 0, 1, 1,
0.7401186, -0.8033665, 1.626355, 0.6313726, 0, 1, 1,
0.7444991, -1.351556, 2.201984, 0.6392157, 0, 1, 1,
0.7457039, 0.5902596, 0.03192428, 0.6431373, 0, 1, 1,
0.7527923, 1.544242, -0.9991275, 0.6509804, 0, 1, 1,
0.7561518, -2.720782, 4.729066, 0.654902, 0, 1, 1,
0.7585559, -0.7684393, 2.655524, 0.6627451, 0, 1, 1,
0.7595305, 0.6612378, 0.7091683, 0.6666667, 0, 1, 1,
0.7600591, -0.8296327, 3.295491, 0.6745098, 0, 1, 1,
0.7605788, -1.401707, 2.995278, 0.6784314, 0, 1, 1,
0.7623154, -1.388378, 2.873941, 0.6862745, 0, 1, 1,
0.7626914, 0.6976175, -0.09213055, 0.6901961, 0, 1, 1,
0.763988, -0.7405711, 2.654772, 0.6980392, 0, 1, 1,
0.7736179, -0.2315254, 2.268194, 0.7058824, 0, 1, 1,
0.7750996, 1.007239, 0.575574, 0.7098039, 0, 1, 1,
0.7763915, 2.487228, 0.5767962, 0.7176471, 0, 1, 1,
0.7796655, -0.06894872, 1.023116, 0.7215686, 0, 1, 1,
0.7803271, -0.2491433, 1.599291, 0.7294118, 0, 1, 1,
0.784756, -0.4302077, 2.195705, 0.7333333, 0, 1, 1,
0.7872955, 0.9071478, 0.2183331, 0.7411765, 0, 1, 1,
0.7913192, -0.8085775, 1.749357, 0.7450981, 0, 1, 1,
0.7964625, 0.2449781, 2.063375, 0.7529412, 0, 1, 1,
0.7970083, -0.7837675, 2.802681, 0.7568628, 0, 1, 1,
0.79816, -0.2203018, 1.834142, 0.7647059, 0, 1, 1,
0.8011953, 0.3037986, 1.128541, 0.7686275, 0, 1, 1,
0.8019052, 0.1884325, 1.615259, 0.7764706, 0, 1, 1,
0.8043775, -0.6695428, 3.221906, 0.7803922, 0, 1, 1,
0.8044513, 1.587109, 0.3076768, 0.7882353, 0, 1, 1,
0.8070714, -0.6605846, 1.384579, 0.7921569, 0, 1, 1,
0.8075636, -1.016207, 2.493734, 0.8, 0, 1, 1,
0.8075816, -0.2735373, 3.297424, 0.8078431, 0, 1, 1,
0.8077915, -1.183034, 1.332928, 0.8117647, 0, 1, 1,
0.8201942, -0.8744282, 3.169242, 0.8196079, 0, 1, 1,
0.8223697, 0.3156198, 1.008253, 0.8235294, 0, 1, 1,
0.8225245, 2.187844, -1.010086, 0.8313726, 0, 1, 1,
0.8233961, -1.024135, 2.344534, 0.8352941, 0, 1, 1,
0.8328285, 0.2425075, 0.3137346, 0.8431373, 0, 1, 1,
0.8363949, -0.4183326, 2.44013, 0.8470588, 0, 1, 1,
0.838437, 1.509413, 0.4940032, 0.854902, 0, 1, 1,
0.8477957, -2.200652, 3.692773, 0.8588235, 0, 1, 1,
0.8495831, -1.51378, 2.692922, 0.8666667, 0, 1, 1,
0.8543372, 0.6531862, 0.8381562, 0.8705882, 0, 1, 1,
0.8623661, 0.7588031, -1.274132, 0.8784314, 0, 1, 1,
0.8660452, 1.044204, 1.09854, 0.8823529, 0, 1, 1,
0.8705209, 0.07256483, 4.343042, 0.8901961, 0, 1, 1,
0.8777005, -0.4015757, 2.217837, 0.8941177, 0, 1, 1,
0.8789928, 1.3795, -0.5145382, 0.9019608, 0, 1, 1,
0.8819817, -0.3048618, 1.702846, 0.9098039, 0, 1, 1,
0.8897073, -0.2215768, 1.615541, 0.9137255, 0, 1, 1,
0.8910906, 0.2853726, 1.734253, 0.9215686, 0, 1, 1,
0.9047447, -0.1385188, 1.653088, 0.9254902, 0, 1, 1,
0.9053838, -1.123758, 1.162135, 0.9333333, 0, 1, 1,
0.9314609, -0.5238051, 2.072398, 0.9372549, 0, 1, 1,
0.9440607, 0.7823705, 0.009847983, 0.945098, 0, 1, 1,
0.9442812, 0.1304334, 1.950482, 0.9490196, 0, 1, 1,
0.9450896, -1.03655, 1.13495, 0.9568627, 0, 1, 1,
0.9476885, -0.06113586, 3.577143, 0.9607843, 0, 1, 1,
0.951683, -0.8014505, 1.418218, 0.9686275, 0, 1, 1,
0.9599613, 0.1479823, 0.3153934, 0.972549, 0, 1, 1,
0.9658121, 0.5343294, -0.0172409, 0.9803922, 0, 1, 1,
0.9658737, -1.508283, 3.138429, 0.9843137, 0, 1, 1,
0.9659863, 1.034499, 0.1963502, 0.9921569, 0, 1, 1,
0.9774895, 0.8078698, 1.611061, 0.9960784, 0, 1, 1,
0.9986229, 1.315165, 1.138222, 1, 0, 0.9960784, 1,
1.005915, -0.06161756, 2.813337, 1, 0, 0.9882353, 1,
1.010115, -0.2540724, 1.528062, 1, 0, 0.9843137, 1,
1.011762, -0.3016855, 2.007693, 1, 0, 0.9764706, 1,
1.019562, -0.5781226, 0.9009364, 1, 0, 0.972549, 1,
1.021107, -1.68752, 2.284567, 1, 0, 0.9647059, 1,
1.021322, -0.3448431, 2.316373, 1, 0, 0.9607843, 1,
1.022681, 0.01594108, 1.513276, 1, 0, 0.9529412, 1,
1.02676, 0.2648272, 3.409598, 1, 0, 0.9490196, 1,
1.02806, -0.2494565, 1.903367, 1, 0, 0.9411765, 1,
1.035264, 1.965685, 1.057691, 1, 0, 0.9372549, 1,
1.0362, 1.691119, 1.710234, 1, 0, 0.9294118, 1,
1.038639, -0.7288964, 0.02945747, 1, 0, 0.9254902, 1,
1.040078, 0.2165157, 1.695156, 1, 0, 0.9176471, 1,
1.046737, 0.5860265, 1.212812, 1, 0, 0.9137255, 1,
1.04774, 0.4891764, 1.30939, 1, 0, 0.9058824, 1,
1.052582, -0.9958957, 2.020122, 1, 0, 0.9019608, 1,
1.053264, -0.9531853, 0.8161446, 1, 0, 0.8941177, 1,
1.060925, 0.4959595, 1.93637, 1, 0, 0.8862745, 1,
1.063505, 0.1090971, 1.460792, 1, 0, 0.8823529, 1,
1.069466, -1.130897, 1.63513, 1, 0, 0.8745098, 1,
1.072048, 0.5671245, -0.2266617, 1, 0, 0.8705882, 1,
1.074772, 0.05281639, 1.110261, 1, 0, 0.8627451, 1,
1.076048, 2.564265, -0.2004484, 1, 0, 0.8588235, 1,
1.078777, -0.1945656, 3.211916, 1, 0, 0.8509804, 1,
1.08313, -3.023391, 1.942704, 1, 0, 0.8470588, 1,
1.097101, 0.5074716, 0.2315297, 1, 0, 0.8392157, 1,
1.098246, -2.074143, 3.862854, 1, 0, 0.8352941, 1,
1.100574, 1.688294, 0.7870969, 1, 0, 0.827451, 1,
1.112091, -1.981894, -0.04615031, 1, 0, 0.8235294, 1,
1.113121, 0.03938376, 1.919731, 1, 0, 0.8156863, 1,
1.120727, -0.989593, 1.880206, 1, 0, 0.8117647, 1,
1.121963, -0.3065924, -0.009642538, 1, 0, 0.8039216, 1,
1.124764, -0.2645164, 1.433864, 1, 0, 0.7960784, 1,
1.128392, 1.125463, 2.254174, 1, 0, 0.7921569, 1,
1.130127, 1.620435, 1.975146, 1, 0, 0.7843137, 1,
1.138487, 0.364816, 3.121638, 1, 0, 0.7803922, 1,
1.145649, -1.752115, 2.436925, 1, 0, 0.772549, 1,
1.151791, -1.094383, 1.673717, 1, 0, 0.7686275, 1,
1.173587, -1.085368, 2.683367, 1, 0, 0.7607843, 1,
1.178113, -0.4333546, 0.7321154, 1, 0, 0.7568628, 1,
1.185751, -1.178937, 2.765054, 1, 0, 0.7490196, 1,
1.18738, -0.7896882, 4.229742, 1, 0, 0.7450981, 1,
1.194567, -0.9565699, 2.486535, 1, 0, 0.7372549, 1,
1.195974, -1.145417, 2.174921, 1, 0, 0.7333333, 1,
1.197145, -0.1681513, 1.90048, 1, 0, 0.7254902, 1,
1.198951, 1.624607, -0.2678982, 1, 0, 0.7215686, 1,
1.200681, -0.3438376, 3.744713, 1, 0, 0.7137255, 1,
1.204441, -1.470831, 3.228373, 1, 0, 0.7098039, 1,
1.217992, 1.151528, 1.186192, 1, 0, 0.7019608, 1,
1.219444, -0.8022303, 3.201277, 1, 0, 0.6941177, 1,
1.227708, -0.2172544, 3.380988, 1, 0, 0.6901961, 1,
1.229298, 0.6450292, 0.6489015, 1, 0, 0.682353, 1,
1.238026, 0.909994, 0.7940074, 1, 0, 0.6784314, 1,
1.239076, 1.830776, 0.5895799, 1, 0, 0.6705883, 1,
1.243859, 0.3481418, 1.028787, 1, 0, 0.6666667, 1,
1.244574, 0.9754153, 0.682485, 1, 0, 0.6588235, 1,
1.252216, -1.417416, 5.477271, 1, 0, 0.654902, 1,
1.253467, -0.8802053, 1.767421, 1, 0, 0.6470588, 1,
1.255102, -0.0920105, 2.061177, 1, 0, 0.6431373, 1,
1.256973, -0.4188931, 2.731955, 1, 0, 0.6352941, 1,
1.258646, 0.8288473, 0.4984636, 1, 0, 0.6313726, 1,
1.269109, -0.5515462, 2.079325, 1, 0, 0.6235294, 1,
1.273671, 2.47793, -1.769676, 1, 0, 0.6196079, 1,
1.283001, 0.3349623, 2.701828, 1, 0, 0.6117647, 1,
1.297093, 1.180855, 2.24255, 1, 0, 0.6078432, 1,
1.300399, 1.804717, -0.2017685, 1, 0, 0.6, 1,
1.302129, -0.3060707, 1.08133, 1, 0, 0.5921569, 1,
1.324328, 0.08685826, 1.757134, 1, 0, 0.5882353, 1,
1.331149, 0.4786407, 1.056411, 1, 0, 0.5803922, 1,
1.340235, 1.149787, 1.337891, 1, 0, 0.5764706, 1,
1.341043, 0.7274389, 0.1889694, 1, 0, 0.5686275, 1,
1.34341, -1.40509, 1.632937, 1, 0, 0.5647059, 1,
1.348157, 1.200041, 1.127558, 1, 0, 0.5568628, 1,
1.355512, 0.2749905, 3.183781, 1, 0, 0.5529412, 1,
1.360475, 0.7943619, 2.443094, 1, 0, 0.5450981, 1,
1.371672, -0.2225208, 0.8003367, 1, 0, 0.5411765, 1,
1.375007, -0.6284554, 1.459186, 1, 0, 0.5333334, 1,
1.378614, -0.1113081, 1.793585, 1, 0, 0.5294118, 1,
1.389406, -0.6135717, 2.062743, 1, 0, 0.5215687, 1,
1.391926, 0.8422557, 0.2183517, 1, 0, 0.5176471, 1,
1.400396, 0.5910509, 0.6523914, 1, 0, 0.509804, 1,
1.403003, 0.2916371, 0.9181864, 1, 0, 0.5058824, 1,
1.406091, 0.6233529, 0.5198301, 1, 0, 0.4980392, 1,
1.406255, -0.1562971, 2.612688, 1, 0, 0.4901961, 1,
1.430895, -0.8686802, 1.831049, 1, 0, 0.4862745, 1,
1.434235, -0.5669832, 2.141089, 1, 0, 0.4784314, 1,
1.439439, -0.3145433, 1.243834, 1, 0, 0.4745098, 1,
1.443653, 0.6216709, 2.723959, 1, 0, 0.4666667, 1,
1.445674, -0.3449296, 3.190849, 1, 0, 0.4627451, 1,
1.450142, 0.7241372, 1.590515, 1, 0, 0.454902, 1,
1.466301, 0.6715956, 0.2022073, 1, 0, 0.4509804, 1,
1.476158, 0.7127188, 2.679567, 1, 0, 0.4431373, 1,
1.478326, 0.215048, 1.740762, 1, 0, 0.4392157, 1,
1.480876, -0.1716912, 1.393175, 1, 0, 0.4313726, 1,
1.482805, 0.5213009, 1.639176, 1, 0, 0.427451, 1,
1.492388, 0.3055606, 0.5993345, 1, 0, 0.4196078, 1,
1.496146, 0.1995155, 1.726353, 1, 0, 0.4156863, 1,
1.500149, -1.159257, 3.183934, 1, 0, 0.4078431, 1,
1.501716, 0.6017371, 0.6483424, 1, 0, 0.4039216, 1,
1.514161, 0.5731729, 2.35662, 1, 0, 0.3960784, 1,
1.514822, 0.2673585, 0.6868312, 1, 0, 0.3882353, 1,
1.520604, 0.9109104, 0.6393774, 1, 0, 0.3843137, 1,
1.537969, -1.059363, 4.324872, 1, 0, 0.3764706, 1,
1.548093, 1.425074, -0.2024769, 1, 0, 0.372549, 1,
1.552152, 0.1592088, 0.1519379, 1, 0, 0.3647059, 1,
1.562999, -0.3598037, 0.836017, 1, 0, 0.3607843, 1,
1.563592, -1.525524, 2.541768, 1, 0, 0.3529412, 1,
1.583295, 0.5756478, 3.277605, 1, 0, 0.3490196, 1,
1.597398, -1.520996, 2.993635, 1, 0, 0.3411765, 1,
1.602684, 1.184625, 1.070933, 1, 0, 0.3372549, 1,
1.609329, 0.2932629, 4.021872, 1, 0, 0.3294118, 1,
1.615299, -0.2857133, 2.972283, 1, 0, 0.3254902, 1,
1.616563, -0.7148268, 1.835363, 1, 0, 0.3176471, 1,
1.620566, 0.7569181, 1.9716, 1, 0, 0.3137255, 1,
1.627632, 1.085274, 0.776712, 1, 0, 0.3058824, 1,
1.628871, 0.9628099, 0.8784758, 1, 0, 0.2980392, 1,
1.638775, -1.013636, 3.692348, 1, 0, 0.2941177, 1,
1.639294, 0.9444437, -0.2649125, 1, 0, 0.2862745, 1,
1.63934, -0.2191628, 1.675711, 1, 0, 0.282353, 1,
1.646646, 0.5806845, 0.1093712, 1, 0, 0.2745098, 1,
1.649179, -0.06376095, 2.684875, 1, 0, 0.2705882, 1,
1.649689, 0.500744, 3.49673, 1, 0, 0.2627451, 1,
1.655213, 0.5691196, 1.83638, 1, 0, 0.2588235, 1,
1.659222, 0.001865149, 3.818936, 1, 0, 0.2509804, 1,
1.66642, 1.060235, 0.542174, 1, 0, 0.2470588, 1,
1.666707, -0.3969073, 1.047216, 1, 0, 0.2392157, 1,
1.684475, 0.4046605, 3.342443, 1, 0, 0.2352941, 1,
1.69821, 0.4127726, 1.249491, 1, 0, 0.227451, 1,
1.698363, 0.01395874, 2.262732, 1, 0, 0.2235294, 1,
1.731125, -0.1336526, 1.695168, 1, 0, 0.2156863, 1,
1.767348, 1.897729, 1.499831, 1, 0, 0.2117647, 1,
1.777041, -2.054536, 1.183619, 1, 0, 0.2039216, 1,
1.801173, -0.017722, 1.577069, 1, 0, 0.1960784, 1,
1.810164, -0.5959899, 1.293581, 1, 0, 0.1921569, 1,
1.818304, 0.3253917, 0.53191, 1, 0, 0.1843137, 1,
1.81868, -1.267448, 1.113462, 1, 0, 0.1803922, 1,
1.8261, -1.411471, 2.665034, 1, 0, 0.172549, 1,
1.836894, 0.826739, 1.327256, 1, 0, 0.1686275, 1,
1.837482, -1.942722, 1.163061, 1, 0, 0.1607843, 1,
1.83835, -2.345163, 3.869098, 1, 0, 0.1568628, 1,
1.887276, 0.09386578, 0.985884, 1, 0, 0.1490196, 1,
1.888179, 0.8569589, 0.2283529, 1, 0, 0.145098, 1,
1.915628, 0.6401348, -0.4069068, 1, 0, 0.1372549, 1,
1.928434, 0.8165405, 0.529318, 1, 0, 0.1333333, 1,
1.933941, -0.2328599, 2.985817, 1, 0, 0.1254902, 1,
1.940848, 0.08597032, 1.301844, 1, 0, 0.1215686, 1,
2.010469, -0.7783303, 2.454653, 1, 0, 0.1137255, 1,
2.022223, -1.760003, 2.591082, 1, 0, 0.1098039, 1,
2.039393, -1.396237, 1.338441, 1, 0, 0.1019608, 1,
2.053716, 0.1665833, 1.739788, 1, 0, 0.09411765, 1,
2.068599, 0.2165146, 1.326842, 1, 0, 0.09019608, 1,
2.069504, 1.227249, 0.4030761, 1, 0, 0.08235294, 1,
2.177692, -1.033239, 1.324667, 1, 0, 0.07843138, 1,
2.277347, -0.3663389, 2.793471, 1, 0, 0.07058824, 1,
2.281266, 2.483236, 1.390304, 1, 0, 0.06666667, 1,
2.284601, 2.191936, 1.580433, 1, 0, 0.05882353, 1,
2.29838, 0.2824952, 0.6446948, 1, 0, 0.05490196, 1,
2.306964, 0.4839259, 2.980374, 1, 0, 0.04705882, 1,
2.374737, 0.2205729, 0.9315031, 1, 0, 0.04313726, 1,
2.388497, 1.534122, 0.4437835, 1, 0, 0.03529412, 1,
2.407216, 0.3852778, 1.099076, 1, 0, 0.03137255, 1,
2.428121, 0.8053944, 3.249538, 1, 0, 0.02352941, 1,
2.680483, 0.1842459, 2.891348, 1, 0, 0.01960784, 1,
2.70528, -1.161711, 1.748017, 1, 0, 0.01176471, 1,
3.064524, -1.560715, 2.252586, 1, 0, 0.007843138, 1
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
-0.2859069, -4.128856, -6.57106, 0, -0.5, 0.5, 0.5,
-0.2859069, -4.128856, -6.57106, 1, -0.5, 0.5, 0.5,
-0.2859069, -4.128856, -6.57106, 1, 1.5, 0.5, 0.5,
-0.2859069, -4.128856, -6.57106, 0, 1.5, 0.5, 0.5
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
-4.772134, 0.2375654, -6.57106, 0, -0.5, 0.5, 0.5,
-4.772134, 0.2375654, -6.57106, 1, -0.5, 0.5, 0.5,
-4.772134, 0.2375654, -6.57106, 1, 1.5, 0.5, 0.5,
-4.772134, 0.2375654, -6.57106, 0, 1.5, 0.5, 0.5
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
-4.772134, -4.128856, 0.4447312, 0, -0.5, 0.5, 0.5,
-4.772134, -4.128856, 0.4447312, 1, -0.5, 0.5, 0.5,
-4.772134, -4.128856, 0.4447312, 1, 1.5, 0.5, 0.5,
-4.772134, -4.128856, 0.4447312, 0, 1.5, 0.5, 0.5
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
-3, -3.12122, -4.952032,
3, -3.12122, -4.952032,
-3, -3.12122, -4.952032,
-3, -3.28916, -5.221869,
-2, -3.12122, -4.952032,
-2, -3.28916, -5.221869,
-1, -3.12122, -4.952032,
-1, -3.28916, -5.221869,
0, -3.12122, -4.952032,
0, -3.28916, -5.221869,
1, -3.12122, -4.952032,
1, -3.28916, -5.221869,
2, -3.12122, -4.952032,
2, -3.28916, -5.221869,
3, -3.12122, -4.952032,
3, -3.28916, -5.221869
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
-3, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
-3, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
-3, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
-3, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
-2, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
-2, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
-2, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
-2, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
-1, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
-1, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
-1, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
-1, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
0, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
0, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
0, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
0, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
1, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
1, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
1, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
1, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
2, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
2, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
2, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
2, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5,
3, -3.625038, -5.761546, 0, -0.5, 0.5, 0.5,
3, -3.625038, -5.761546, 1, -0.5, 0.5, 0.5,
3, -3.625038, -5.761546, 1, 1.5, 0.5, 0.5,
3, -3.625038, -5.761546, 0, 1.5, 0.5, 0.5
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
-3.736851, -3, -4.952032,
-3.736851, 3, -4.952032,
-3.736851, -3, -4.952032,
-3.909398, -3, -5.221869,
-3.736851, -2, -4.952032,
-3.909398, -2, -5.221869,
-3.736851, -1, -4.952032,
-3.909398, -1, -5.221869,
-3.736851, 0, -4.952032,
-3.909398, 0, -5.221869,
-3.736851, 1, -4.952032,
-3.909398, 1, -5.221869,
-3.736851, 2, -4.952032,
-3.909398, 2, -5.221869,
-3.736851, 3, -4.952032,
-3.909398, 3, -5.221869
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
-4.254492, -3, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, -3, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, -3, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, -3, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, -2, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, -2, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, -2, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, -2, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, -1, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, -1, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, -1, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, -1, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, 0, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, 0, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, 0, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, 0, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, 1, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, 1, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, 1, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, 1, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, 2, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, 2, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, 2, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, 2, -5.761546, 0, 1.5, 0.5, 0.5,
-4.254492, 3, -5.761546, 0, -0.5, 0.5, 0.5,
-4.254492, 3, -5.761546, 1, -0.5, 0.5, 0.5,
-4.254492, 3, -5.761546, 1, 1.5, 0.5, 0.5,
-4.254492, 3, -5.761546, 0, 1.5, 0.5, 0.5
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
-3.736851, -3.12122, -4,
-3.736851, -3.12122, 4,
-3.736851, -3.12122, -4,
-3.909398, -3.28916, -4,
-3.736851, -3.12122, -2,
-3.909398, -3.28916, -2,
-3.736851, -3.12122, 0,
-3.909398, -3.28916, 0,
-3.736851, -3.12122, 2,
-3.909398, -3.28916, 2,
-3.736851, -3.12122, 4,
-3.909398, -3.28916, 4
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
-4.254492, -3.625038, -4, 0, -0.5, 0.5, 0.5,
-4.254492, -3.625038, -4, 1, -0.5, 0.5, 0.5,
-4.254492, -3.625038, -4, 1, 1.5, 0.5, 0.5,
-4.254492, -3.625038, -4, 0, 1.5, 0.5, 0.5,
-4.254492, -3.625038, -2, 0, -0.5, 0.5, 0.5,
-4.254492, -3.625038, -2, 1, -0.5, 0.5, 0.5,
-4.254492, -3.625038, -2, 1, 1.5, 0.5, 0.5,
-4.254492, -3.625038, -2, 0, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 0, 0, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 0, 1, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 0, 1, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 0, 0, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 2, 0, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 2, 1, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 2, 1, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 2, 0, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 4, 0, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 4, 1, -0.5, 0.5, 0.5,
-4.254492, -3.625038, 4, 1, 1.5, 0.5, 0.5,
-4.254492, -3.625038, 4, 0, 1.5, 0.5, 0.5
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
-3.736851, -3.12122, -4.952032,
-3.736851, 3.596351, -4.952032,
-3.736851, -3.12122, 5.841494,
-3.736851, 3.596351, 5.841494,
-3.736851, -3.12122, -4.952032,
-3.736851, -3.12122, 5.841494,
-3.736851, 3.596351, -4.952032,
-3.736851, 3.596351, 5.841494,
-3.736851, -3.12122, -4.952032,
3.165037, -3.12122, -4.952032,
-3.736851, -3.12122, 5.841494,
3.165037, -3.12122, 5.841494,
-3.736851, 3.596351, -4.952032,
3.165037, 3.596351, -4.952032,
-3.736851, 3.596351, 5.841494,
3.165037, 3.596351, 5.841494,
3.165037, -3.12122, -4.952032,
3.165037, 3.596351, -4.952032,
3.165037, -3.12122, 5.841494,
3.165037, 3.596351, 5.841494,
3.165037, -3.12122, -4.952032,
3.165037, -3.12122, 5.841494,
3.165037, 3.596351, -4.952032,
3.165037, 3.596351, 5.841494
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
var radius = 7.724505;
var distance = 34.3672;
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
mvMatrix.translate( 0.2859069, -0.2375654, -0.4447312 );
mvMatrix.scale( 1.210087, 1.24329, 0.7737867 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3672);
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
flumetover<-read.table("flumetover.xyz")
```

```
## Error in read.table("flumetover.xyz"): no lines available in input
```

```r
x<-flumetover$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
y<-flumetover$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
```

```r
z<-flumetover$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumetover' not found
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
-3.636338, 0.2686194, -4.092851, 0, 0, 1, 1, 1,
-3.200077, 0.02150325, -1.900046, 1, 0, 0, 1, 1,
-2.871186, -0.1130558, -2.324377, 1, 0, 0, 1, 1,
-2.501124, -1.720027, -1.515144, 1, 0, 0, 1, 1,
-2.494173, -2.121837, -2.435887, 1, 0, 0, 1, 1,
-2.466552, 0.1940876, -3.064185, 1, 0, 0, 1, 1,
-2.415022, -0.06437327, -0.7300922, 0, 0, 0, 1, 1,
-2.314412, 0.3959623, -1.155489, 0, 0, 0, 1, 1,
-2.311191, 1.145472, -3.504492, 0, 0, 0, 1, 1,
-2.303725, 0.6351487, -0.1084431, 0, 0, 0, 1, 1,
-2.268286, -0.8652868, -2.190466, 0, 0, 0, 1, 1,
-2.264108, -1.227246, -2.690656, 0, 0, 0, 1, 1,
-2.264028, -0.06137187, -0.1934069, 0, 0, 0, 1, 1,
-2.199565, 0.2779612, -0.3937359, 1, 1, 1, 1, 1,
-2.186744, 0.7961841, -0.02181858, 1, 1, 1, 1, 1,
-2.117536, -0.5196692, -2.712016, 1, 1, 1, 1, 1,
-2.099721, 0.5695472, -0.3553291, 1, 1, 1, 1, 1,
-2.077514, -1.27926, -2.444588, 1, 1, 1, 1, 1,
-2.016629, -0.5338599, -2.421403, 1, 1, 1, 1, 1,
-1.983365, -1.129212, -1.629431, 1, 1, 1, 1, 1,
-1.951355, -1.928496, -2.188404, 1, 1, 1, 1, 1,
-1.90813, -0.6045694, -1.951403, 1, 1, 1, 1, 1,
-1.903008, 0.9758164, -1.051787, 1, 1, 1, 1, 1,
-1.884762, -0.8927394, -2.811106, 1, 1, 1, 1, 1,
-1.856516, 0.6118797, 0.3898034, 1, 1, 1, 1, 1,
-1.851137, 1.964074, 0.5914783, 1, 1, 1, 1, 1,
-1.840794, -0.5610461, -3.153579, 1, 1, 1, 1, 1,
-1.839878, 0.03145219, -0.5695251, 1, 1, 1, 1, 1,
-1.837341, -0.7814233, -1.31444, 0, 0, 1, 1, 1,
-1.831213, -0.9527185, -2.54811, 1, 0, 0, 1, 1,
-1.7918, -1.129484, -2.128889, 1, 0, 0, 1, 1,
-1.782608, -0.8198869, -1.013453, 1, 0, 0, 1, 1,
-1.751491, 0.9649432, 0.01441114, 1, 0, 0, 1, 1,
-1.738471, 0.1103873, -2.076814, 1, 0, 0, 1, 1,
-1.735363, 1.038374, 0.2165201, 0, 0, 0, 1, 1,
-1.731467, -1.01101, -3.68174, 0, 0, 0, 1, 1,
-1.722526, 1.074251, -1.653168, 0, 0, 0, 1, 1,
-1.698838, -1.210111, -2.014536, 0, 0, 0, 1, 1,
-1.678739, -0.1487276, -0.6907693, 0, 0, 0, 1, 1,
-1.668502, 1.401983, -1.377952, 0, 0, 0, 1, 1,
-1.664713, -0.8648287, -1.984705, 0, 0, 0, 1, 1,
-1.664244, -1.061203, -1.632442, 1, 1, 1, 1, 1,
-1.656776, 0.5409821, -0.670284, 1, 1, 1, 1, 1,
-1.650983, 0.4984763, 0.368666, 1, 1, 1, 1, 1,
-1.642125, 1.547951, -0.9534019, 1, 1, 1, 1, 1,
-1.639159, -0.986412, -0.7475357, 1, 1, 1, 1, 1,
-1.627078, -0.5892565, -3.068254, 1, 1, 1, 1, 1,
-1.619603, -0.3175508, -0.3778806, 1, 1, 1, 1, 1,
-1.615689, -2.016873, -2.292183, 1, 1, 1, 1, 1,
-1.613925, 0.3723302, -1.919689, 1, 1, 1, 1, 1,
-1.610792, -2.182313, -3.330393, 1, 1, 1, 1, 1,
-1.599895, 1.704869, 0.3534347, 1, 1, 1, 1, 1,
-1.599124, -0.4212205, -2.447021, 1, 1, 1, 1, 1,
-1.597599, 1.35271, -0.594528, 1, 1, 1, 1, 1,
-1.58692, 0.03112173, -1.859971, 1, 1, 1, 1, 1,
-1.57728, -0.6220229, -0.8932474, 1, 1, 1, 1, 1,
-1.574365, -0.9826921, -2.618464, 0, 0, 1, 1, 1,
-1.561212, -1.361084, -2.497934, 1, 0, 0, 1, 1,
-1.557009, 0.3497103, -1.491496, 1, 0, 0, 1, 1,
-1.554658, -1.400565, -2.695373, 1, 0, 0, 1, 1,
-1.552747, 0.03508221, -0.03640994, 1, 0, 0, 1, 1,
-1.513607, -0.6384928, -0.8243573, 1, 0, 0, 1, 1,
-1.493319, 0.1486913, -1.115767, 0, 0, 0, 1, 1,
-1.483913, -0.3041007, -1.149741, 0, 0, 0, 1, 1,
-1.47455, 1.142018, -0.8157328, 0, 0, 0, 1, 1,
-1.468545, -0.03155782, -2.765165, 0, 0, 0, 1, 1,
-1.46688, 0.9970931, -3.212529, 0, 0, 0, 1, 1,
-1.459949, 0.9159414, -0.7849288, 0, 0, 0, 1, 1,
-1.45964, -0.5496066, -0.3404771, 0, 0, 0, 1, 1,
-1.459273, -0.1286378, -0.434453, 1, 1, 1, 1, 1,
-1.458259, 0.3918467, -0.8044793, 1, 1, 1, 1, 1,
-1.455661, -1.268992, -1.518295, 1, 1, 1, 1, 1,
-1.435001, 0.6802486, -0.829252, 1, 1, 1, 1, 1,
-1.416594, 0.9990141, -0.3601956, 1, 1, 1, 1, 1,
-1.413672, -1.388767, -0.2405457, 1, 1, 1, 1, 1,
-1.411801, 0.005562864, -1.172684, 1, 1, 1, 1, 1,
-1.407265, -1.255922, -3.111695, 1, 1, 1, 1, 1,
-1.403135, 0.05151856, -1.649537, 1, 1, 1, 1, 1,
-1.397229, -0.5919375, -2.808562, 1, 1, 1, 1, 1,
-1.396739, -1.757239, -1.893121, 1, 1, 1, 1, 1,
-1.390927, -0.2951865, -1.131153, 1, 1, 1, 1, 1,
-1.388968, 0.3116266, -1.863381, 1, 1, 1, 1, 1,
-1.383503, -1.796746, -3.94562, 1, 1, 1, 1, 1,
-1.380584, -1.737071, -1.241308, 1, 1, 1, 1, 1,
-1.366463, -0.6674575, -2.879059, 0, 0, 1, 1, 1,
-1.360284, 0.5383771, -0.8943663, 1, 0, 0, 1, 1,
-1.359691, 1.565712, -1.818991, 1, 0, 0, 1, 1,
-1.356601, 1.081456, -1.72847, 1, 0, 0, 1, 1,
-1.34272, -1.276427, -1.805521, 1, 0, 0, 1, 1,
-1.339044, 0.1919105, -2.529719, 1, 0, 0, 1, 1,
-1.338416, -2.873952, -3.56105, 0, 0, 0, 1, 1,
-1.33267, 0.7783259, 0.3209264, 0, 0, 0, 1, 1,
-1.329933, 0.108802, -0.2668274, 0, 0, 0, 1, 1,
-1.322757, 0.3716831, -1.917477, 0, 0, 0, 1, 1,
-1.322357, 1.04412, -1.235675, 0, 0, 0, 1, 1,
-1.320234, 0.2682369, -2.541692, 0, 0, 0, 1, 1,
-1.315864, 0.3859229, 0.4592642, 0, 0, 0, 1, 1,
-1.307819, 0.7253211, -0.6253931, 1, 1, 1, 1, 1,
-1.304082, -0.2812623, -1.871112, 1, 1, 1, 1, 1,
-1.294752, 0.5907277, -0.7375857, 1, 1, 1, 1, 1,
-1.283085, -1.733914, -3.48733, 1, 1, 1, 1, 1,
-1.273389, -0.5051805, -4.273619, 1, 1, 1, 1, 1,
-1.269045, -0.1150517, -0.3674626, 1, 1, 1, 1, 1,
-1.254924, 1.579048, 1.176313, 1, 1, 1, 1, 1,
-1.250571, -0.9556912, -2.352003, 1, 1, 1, 1, 1,
-1.24912, -0.7027342, -2.80579, 1, 1, 1, 1, 1,
-1.248021, 0.410705, -0.6934589, 1, 1, 1, 1, 1,
-1.246573, -0.5161483, -2.805997, 1, 1, 1, 1, 1,
-1.241717, 0.9311153, -0.3817975, 1, 1, 1, 1, 1,
-1.239899, -0.2853785, -2.607685, 1, 1, 1, 1, 1,
-1.231802, -1.710706, -1.793247, 1, 1, 1, 1, 1,
-1.229684, 0.4661009, -0.9093654, 1, 1, 1, 1, 1,
-1.214818, -0.04914771, -1.892182, 0, 0, 1, 1, 1,
-1.211208, -0.1887975, -0.8213601, 1, 0, 0, 1, 1,
-1.208186, -2.008185, -3.13181, 1, 0, 0, 1, 1,
-1.20582, -0.1074158, -2.479359, 1, 0, 0, 1, 1,
-1.190811, 1.280908, -0.2724766, 1, 0, 0, 1, 1,
-1.190694, -0.4476606, -0.338536, 1, 0, 0, 1, 1,
-1.179435, -0.184891, -1.671214, 0, 0, 0, 1, 1,
-1.178059, -0.3840809, -2.939979, 0, 0, 0, 1, 1,
-1.175591, -1.577613, -2.508212, 0, 0, 0, 1, 1,
-1.175081, -0.1363557, -1.337916, 0, 0, 0, 1, 1,
-1.172833, 0.5456625, -1.1629, 0, 0, 0, 1, 1,
-1.170245, -0.2323002, -0.4440754, 0, 0, 0, 1, 1,
-1.163489, -2.153403, -2.575259, 0, 0, 0, 1, 1,
-1.162314, -2.153316, -2.629281, 1, 1, 1, 1, 1,
-1.157423, 2.797498, -0.7585109, 1, 1, 1, 1, 1,
-1.1444, 1.541823, 0.2069172, 1, 1, 1, 1, 1,
-1.143406, 0.4297647, -2.010361, 1, 1, 1, 1, 1,
-1.142161, 0.5227007, -2.740929, 1, 1, 1, 1, 1,
-1.136344, -0.3688579, -2.381103, 1, 1, 1, 1, 1,
-1.131105, 2.591504, -0.6338297, 1, 1, 1, 1, 1,
-1.129436, -1.458551, -0.4328179, 1, 1, 1, 1, 1,
-1.10926, 1.121179, -1.808318, 1, 1, 1, 1, 1,
-1.107635, 0.8207956, -2.165078, 1, 1, 1, 1, 1,
-1.088864, 1.744333, -1.176989, 1, 1, 1, 1, 1,
-1.081408, -0.5543014, -2.729702, 1, 1, 1, 1, 1,
-1.077168, -0.3076239, -2.667024, 1, 1, 1, 1, 1,
-1.071084, -0.6643371, -1.496919, 1, 1, 1, 1, 1,
-1.06945, -1.202943, -2.258893, 1, 1, 1, 1, 1,
-1.068912, -0.8727415, -1.758826, 0, 0, 1, 1, 1,
-1.068605, -2.066736, -2.954275, 1, 0, 0, 1, 1,
-1.064708, -0.6134174, -2.280935, 1, 0, 0, 1, 1,
-1.052967, 0.2596749, -0.8622192, 1, 0, 0, 1, 1,
-1.044489, 0.1357354, -2.837196, 1, 0, 0, 1, 1,
-1.03899, 1.49182, 0.2992246, 1, 0, 0, 1, 1,
-1.035455, -0.4690723, -3.323027, 0, 0, 0, 1, 1,
-1.029204, 0.3488778, -2.548093, 0, 0, 0, 1, 1,
-1.025213, -0.8024766, -2.078591, 0, 0, 0, 1, 1,
-1.024765, 0.7399554, -1.581263, 0, 0, 0, 1, 1,
-1.022249, 1.725029, -0.3196888, 0, 0, 0, 1, 1,
-1.021147, 1.463542, 0.6768184, 0, 0, 0, 1, 1,
-1.021101, -1.139094, -3.142091, 0, 0, 0, 1, 1,
-1.020851, 1.782953, 0.6996849, 1, 1, 1, 1, 1,
-1.01702, -0.05050965, -0.6456737, 1, 1, 1, 1, 1,
-1.014758, -1.230407, -3.363824, 1, 1, 1, 1, 1,
-1.007236, 0.9229422, 0.06954619, 1, 1, 1, 1, 1,
-1.005408, 0.3712986, 0.2842562, 1, 1, 1, 1, 1,
-1.005403, 1.071136, -0.8523042, 1, 1, 1, 1, 1,
-1.00258, 0.180399, -0.5446445, 1, 1, 1, 1, 1,
-0.9995833, -0.3098509, -1.476979, 1, 1, 1, 1, 1,
-0.9967712, -0.305431, -3.8953, 1, 1, 1, 1, 1,
-0.9951489, 1.077071, -1.138057, 1, 1, 1, 1, 1,
-0.9951429, -0.220456, -3.48764, 1, 1, 1, 1, 1,
-0.9940233, 1.476626, 0.1313328, 1, 1, 1, 1, 1,
-0.9930643, 1.431896, 0.005249624, 1, 1, 1, 1, 1,
-0.9905703, 2.010018, -0.5664256, 1, 1, 1, 1, 1,
-0.9897843, 0.2905261, -1.119015, 1, 1, 1, 1, 1,
-0.988353, -0.1127128, -1.923255, 0, 0, 1, 1, 1,
-0.9877118, -0.5487131, -2.447928, 1, 0, 0, 1, 1,
-0.9872963, -0.3757381, -1.177264, 1, 0, 0, 1, 1,
-0.986411, -1.363927, -2.080912, 1, 0, 0, 1, 1,
-0.9707525, 0.2367293, 0.3520776, 1, 0, 0, 1, 1,
-0.9705275, 1.477737, -0.632028, 1, 0, 0, 1, 1,
-0.9672986, -0.04164864, -1.318476, 0, 0, 0, 1, 1,
-0.9571066, -0.4548416, -1.478947, 0, 0, 0, 1, 1,
-0.946294, -0.3845522, -0.614132, 0, 0, 0, 1, 1,
-0.9459286, -0.2760375, -2.774328, 0, 0, 0, 1, 1,
-0.9429695, -0.4185044, -2.605116, 0, 0, 0, 1, 1,
-0.9424228, -0.4138662, -2.04554, 0, 0, 0, 1, 1,
-0.9423859, -0.5141213, -3.214823, 0, 0, 0, 1, 1,
-0.9358642, -1.727016, -4.010964, 1, 1, 1, 1, 1,
-0.9316728, 1.329113, 0.06121646, 1, 1, 1, 1, 1,
-0.9154929, -0.9481337, -1.17322, 1, 1, 1, 1, 1,
-0.9149756, 2.032354, -1.507833, 1, 1, 1, 1, 1,
-0.9126186, 0.07636914, -3.344061, 1, 1, 1, 1, 1,
-0.9122332, -0.6524416, -1.628729, 1, 1, 1, 1, 1,
-0.9083219, 0.0002800386, -1.911084, 1, 1, 1, 1, 1,
-0.9076307, -1.989556, -2.091335, 1, 1, 1, 1, 1,
-0.9066979, 1.050027, -2.051955, 1, 1, 1, 1, 1,
-0.9037454, 0.06266095, -2.412384, 1, 1, 1, 1, 1,
-0.8912476, -0.527005, -3.056102, 1, 1, 1, 1, 1,
-0.8862327, 1.006989, -0.2271043, 1, 1, 1, 1, 1,
-0.8857195, 3.498522, -0.9158671, 1, 1, 1, 1, 1,
-0.8856805, -0.6503903, -1.935642, 1, 1, 1, 1, 1,
-0.8843705, -0.9947078, -2.505656, 1, 1, 1, 1, 1,
-0.8774908, -0.5025192, -2.004508, 0, 0, 1, 1, 1,
-0.8772912, 0.6132205, -0.6960062, 1, 0, 0, 1, 1,
-0.8711676, 0.9434604, -0.06297876, 1, 0, 0, 1, 1,
-0.8640466, -1.047665, -4.655301, 1, 0, 0, 1, 1,
-0.8617551, 0.8423189, -2.584699, 1, 0, 0, 1, 1,
-0.8616248, -0.3766196, -1.71498, 1, 0, 0, 1, 1,
-0.8580003, -0.5145677, -0.6119875, 0, 0, 0, 1, 1,
-0.8568119, 0.4712048, -0.7443663, 0, 0, 0, 1, 1,
-0.8533526, 0.3116869, -2.922195, 0, 0, 0, 1, 1,
-0.8433614, -0.7252879, -1.04615, 0, 0, 0, 1, 1,
-0.8367342, -0.1039301, -1.588083, 0, 0, 0, 1, 1,
-0.8341234, -1.564548, -3.02092, 0, 0, 0, 1, 1,
-0.8339939, -0.4957372, -2.302943, 0, 0, 0, 1, 1,
-0.832829, 0.5769268, -1.95335, 1, 1, 1, 1, 1,
-0.8317291, -1.047021, -3.145482, 1, 1, 1, 1, 1,
-0.8316585, 2.671002, -1.553554, 1, 1, 1, 1, 1,
-0.8310175, 0.4203596, -1.564198, 1, 1, 1, 1, 1,
-0.8308206, -0.8025351, -2.166446, 1, 1, 1, 1, 1,
-0.8306719, 0.9902182, -1.224807, 1, 1, 1, 1, 1,
-0.8252172, -1.108108, -1.713256, 1, 1, 1, 1, 1,
-0.8125325, 1.100075, 0.2324624, 1, 1, 1, 1, 1,
-0.809783, 0.03906624, -1.195553, 1, 1, 1, 1, 1,
-0.8081939, -0.9234239, -2.810534, 1, 1, 1, 1, 1,
-0.8044022, 0.5705149, -2.389917, 1, 1, 1, 1, 1,
-0.8041441, -0.6100862, -1.767575, 1, 1, 1, 1, 1,
-0.803433, 1.184314, 0.3304103, 1, 1, 1, 1, 1,
-0.8000771, -1.130847, -3.983693, 1, 1, 1, 1, 1,
-0.7957124, 0.9565958, -2.003316, 1, 1, 1, 1, 1,
-0.794831, -0.9788724, -3.123487, 0, 0, 1, 1, 1,
-0.7916414, 0.4047549, -0.6306165, 1, 0, 0, 1, 1,
-0.7893862, 0.6755399, 0.5263595, 1, 0, 0, 1, 1,
-0.7879378, 0.5633247, -1.511332, 1, 0, 0, 1, 1,
-0.7873932, -1.638978, -1.215546, 1, 0, 0, 1, 1,
-0.7807878, 0.01623559, -0.881708, 1, 0, 0, 1, 1,
-0.7768591, -1.238511, -3.072671, 0, 0, 0, 1, 1,
-0.7754718, 0.6278824, 1.331448, 0, 0, 0, 1, 1,
-0.7676327, 0.276987, -1.739946, 0, 0, 0, 1, 1,
-0.7661551, 0.2999502, 0.6834362, 0, 0, 0, 1, 1,
-0.7648864, -0.03799693, -0.3899929, 0, 0, 0, 1, 1,
-0.7642282, -0.5965104, -1.614964, 0, 0, 0, 1, 1,
-0.763665, 0.3345045, -0.4873503, 0, 0, 0, 1, 1,
-0.7620819, 1.000965, -0.6646349, 1, 1, 1, 1, 1,
-0.7584983, 0.5312907, -2.465606, 1, 1, 1, 1, 1,
-0.7577712, 0.04248024, -1.421822, 1, 1, 1, 1, 1,
-0.7574694, -1.537845, -2.567718, 1, 1, 1, 1, 1,
-0.754688, 1.489198, -1.27314, 1, 1, 1, 1, 1,
-0.7464432, 0.2505457, -0.7904494, 1, 1, 1, 1, 1,
-0.7432703, 0.985222, -0.9230157, 1, 1, 1, 1, 1,
-0.7429287, 1.323365, 0.4170247, 1, 1, 1, 1, 1,
-0.738826, -2.241432, -3.573619, 1, 1, 1, 1, 1,
-0.7344934, -0.06663843, -0.730149, 1, 1, 1, 1, 1,
-0.7328331, -0.3302885, -2.11737, 1, 1, 1, 1, 1,
-0.7324824, -1.918084, -4.794844, 1, 1, 1, 1, 1,
-0.7302631, 1.553398, -1.110422, 1, 1, 1, 1, 1,
-0.7245544, 1.208929, -0.3699317, 1, 1, 1, 1, 1,
-0.719823, -1.752216, -1.903471, 1, 1, 1, 1, 1,
-0.7174991, -1.107454, -1.305086, 0, 0, 1, 1, 1,
-0.714891, 1.595675, -1.127937, 1, 0, 0, 1, 1,
-0.7133182, -0.3011364, -1.783236, 1, 0, 0, 1, 1,
-0.7131137, 0.6848935, -0.2997704, 1, 0, 0, 1, 1,
-0.7117481, 1.755719, -0.2117916, 1, 0, 0, 1, 1,
-0.7086044, -0.379724, -1.672923, 1, 0, 0, 1, 1,
-0.702197, -0.2617968, -2.411768, 0, 0, 0, 1, 1,
-0.7021049, -0.05912931, -1.890837, 0, 0, 0, 1, 1,
-0.7017704, -0.704585, -4.165914, 0, 0, 0, 1, 1,
-0.6981982, -0.1369798, -1.701648, 0, 0, 0, 1, 1,
-0.6953615, 0.3427772, 0.3001344, 0, 0, 0, 1, 1,
-0.6927713, 1.588281, -1.248629, 0, 0, 0, 1, 1,
-0.6923926, 0.06279481, 1.258965, 0, 0, 0, 1, 1,
-0.6900313, -0.7969288, -1.831138, 1, 1, 1, 1, 1,
-0.687662, 0.202151, -1.98973, 1, 1, 1, 1, 1,
-0.686251, 0.5846919, -2.051129, 1, 1, 1, 1, 1,
-0.6862051, -1.095728, -3.589572, 1, 1, 1, 1, 1,
-0.6858968, -0.9634778, -3.056621, 1, 1, 1, 1, 1,
-0.6815684, -0.02264475, -1.702747, 1, 1, 1, 1, 1,
-0.6765492, 0.8342375, -0.685982, 1, 1, 1, 1, 1,
-0.671221, -0.4048875, -1.442037, 1, 1, 1, 1, 1,
-0.670451, -0.2279699, -2.455312, 1, 1, 1, 1, 1,
-0.668906, 0.9492394, -1.302285, 1, 1, 1, 1, 1,
-0.6665144, -0.01728989, 0.6051568, 1, 1, 1, 1, 1,
-0.656544, -0.8648411, -1.269031, 1, 1, 1, 1, 1,
-0.6549402, 0.6975623, 1.182104, 1, 1, 1, 1, 1,
-0.6541452, -0.2760335, -2.263117, 1, 1, 1, 1, 1,
-0.6527562, -2.577962, -2.782282, 1, 1, 1, 1, 1,
-0.6503892, 0.08498843, -1.25854, 0, 0, 1, 1, 1,
-0.6428501, 0.5974413, 0.3219215, 1, 0, 0, 1, 1,
-0.6415001, 0.7495576, -1.120482, 1, 0, 0, 1, 1,
-0.6413678, -0.23395, -3.090127, 1, 0, 0, 1, 1,
-0.63958, -0.9870043, -3.189248, 1, 0, 0, 1, 1,
-0.6379235, -0.5341278, -0.171172, 1, 0, 0, 1, 1,
-0.6375982, 0.2079465, -0.04062276, 0, 0, 0, 1, 1,
-0.6361964, 0.4578131, -0.8466405, 0, 0, 0, 1, 1,
-0.6358964, 1.499817, 0.1680339, 0, 0, 0, 1, 1,
-0.6306121, -0.4461098, -2.364189, 0, 0, 0, 1, 1,
-0.6299074, -1.146122, -2.344184, 0, 0, 0, 1, 1,
-0.6280611, -1.332168, -3.203671, 0, 0, 0, 1, 1,
-0.6251008, -0.770483, -3.408884, 0, 0, 0, 1, 1,
-0.6240319, 0.6976069, 0.09498633, 1, 1, 1, 1, 1,
-0.6229649, 1.467891, 0.4484934, 1, 1, 1, 1, 1,
-0.6226069, -0.6782889, -2.859184, 1, 1, 1, 1, 1,
-0.6196864, -0.3787679, -1.036709, 1, 1, 1, 1, 1,
-0.6185958, -0.4521083, -2.091029, 1, 1, 1, 1, 1,
-0.6126542, -0.2691881, -3.031408, 1, 1, 1, 1, 1,
-0.6107568, -1.268118, -1.115088, 1, 1, 1, 1, 1,
-0.6057379, -1.390107, -4.387753, 1, 1, 1, 1, 1,
-0.6054445, 0.9407175, -1.094513, 1, 1, 1, 1, 1,
-0.6048084, 0.005965708, -2.601767, 1, 1, 1, 1, 1,
-0.6010377, 0.5146599, -2.30407, 1, 1, 1, 1, 1,
-0.6004371, -0.6870437, -2.075021, 1, 1, 1, 1, 1,
-0.5887173, 2.192256, 0.59508, 1, 1, 1, 1, 1,
-0.5881259, -0.2595413, -1.920945, 1, 1, 1, 1, 1,
-0.5866086, -1.363987, -2.726276, 1, 1, 1, 1, 1,
-0.5845712, -1.949555, -2.033286, 0, 0, 1, 1, 1,
-0.5747643, 0.1587513, -3.748071, 1, 0, 0, 1, 1,
-0.57195, -0.5590772, -1.802469, 1, 0, 0, 1, 1,
-0.5716295, -0.6694124, -2.558878, 1, 0, 0, 1, 1,
-0.5705445, -0.8491015, -2.888367, 1, 0, 0, 1, 1,
-0.5704277, -0.6524027, -2.658188, 1, 0, 0, 1, 1,
-0.5626306, 0.2529297, 1.017215, 0, 0, 0, 1, 1,
-0.5618719, -1.557507, -3.848625, 0, 0, 0, 1, 1,
-0.5603389, -1.055708, -1.185084, 0, 0, 0, 1, 1,
-0.5570987, -0.5777794, -2.467241, 0, 0, 0, 1, 1,
-0.5531695, 0.7932203, -1.438822, 0, 0, 0, 1, 1,
-0.5437401, 0.04092647, -1.572461, 0, 0, 0, 1, 1,
-0.5421542, -1.064257, -0.9067404, 0, 0, 0, 1, 1,
-0.541693, -1.697102, -2.068529, 1, 1, 1, 1, 1,
-0.5364522, 1.541508, -0.3456285, 1, 1, 1, 1, 1,
-0.5287373, 1.593758, -0.2006595, 1, 1, 1, 1, 1,
-0.5269821, 0.7547081, -0.2498372, 1, 1, 1, 1, 1,
-0.5242658, -0.1093614, -1.260994, 1, 1, 1, 1, 1,
-0.5203986, -1.796294, -1.481529, 1, 1, 1, 1, 1,
-0.5174365, 0.1453966, -1.530596, 1, 1, 1, 1, 1,
-0.5046558, 2.923738, -0.5907839, 1, 1, 1, 1, 1,
-0.5045488, 0.1274051, -2.541215, 1, 1, 1, 1, 1,
-0.500996, 0.3288517, -2.28299, 1, 1, 1, 1, 1,
-0.4981011, 0.2121908, -1.305398, 1, 1, 1, 1, 1,
-0.4908291, -0.2519425, -2.965153, 1, 1, 1, 1, 1,
-0.4874566, 0.4117962, -0.6850659, 1, 1, 1, 1, 1,
-0.4842806, -0.06349419, -2.731834, 1, 1, 1, 1, 1,
-0.4786616, 2.238906, 0.305741, 1, 1, 1, 1, 1,
-0.4785976, 1.759295, -0.3642939, 0, 0, 1, 1, 1,
-0.4770696, 0.1950786, -0.8094043, 1, 0, 0, 1, 1,
-0.4761534, -0.22359, -1.237257, 1, 0, 0, 1, 1,
-0.4750788, 0.7718428, 0.01972757, 1, 0, 0, 1, 1,
-0.471566, 0.2185997, -0.2795978, 1, 0, 0, 1, 1,
-0.4702686, -1.077002, -2.372272, 1, 0, 0, 1, 1,
-0.464857, 1.210307, -0.5570967, 0, 0, 0, 1, 1,
-0.4604125, 2.47348, -0.7853274, 0, 0, 0, 1, 1,
-0.4588035, 0.1957642, -2.354171, 0, 0, 0, 1, 1,
-0.4585765, -1.357791, -3.690562, 0, 0, 0, 1, 1,
-0.4579414, 1.53095, -1.917309, 0, 0, 0, 1, 1,
-0.4548716, 1.127827, -0.781522, 0, 0, 0, 1, 1,
-0.4510458, -0.6527799, -1.145375, 0, 0, 0, 1, 1,
-0.4447164, -0.4501438, -3.53765, 1, 1, 1, 1, 1,
-0.4428864, 0.4903944, -1.10218, 1, 1, 1, 1, 1,
-0.4390662, -1.208743, -2.612347, 1, 1, 1, 1, 1,
-0.4373941, -1.132749, -1.762041, 1, 1, 1, 1, 1,
-0.4346603, -0.3617291, -1.903965, 1, 1, 1, 1, 1,
-0.424858, 0.7709121, -0.1427219, 1, 1, 1, 1, 1,
-0.4201463, 1.688763, 0.3044281, 1, 1, 1, 1, 1,
-0.4138368, 0.1309558, -1.73656, 1, 1, 1, 1, 1,
-0.4130907, -1.343628, -2.715002, 1, 1, 1, 1, 1,
-0.4113664, -1.146286, -3.118393, 1, 1, 1, 1, 1,
-0.408135, -1.051842, -2.173514, 1, 1, 1, 1, 1,
-0.404214, 0.4188728, 0.1085716, 1, 1, 1, 1, 1,
-0.4038889, 1.732593, -0.6455493, 1, 1, 1, 1, 1,
-0.4036948, -1.283274, -2.479777, 1, 1, 1, 1, 1,
-0.4035251, -0.03754324, -0.2106683, 1, 1, 1, 1, 1,
-0.4029659, 0.1998035, -0.9207123, 0, 0, 1, 1, 1,
-0.4026464, 2.628976, -1.502423, 1, 0, 0, 1, 1,
-0.3998446, 2.245537, -1.251544, 1, 0, 0, 1, 1,
-0.3956282, -0.3232917, -0.4026518, 1, 0, 0, 1, 1,
-0.3950939, 0.6469513, -0.4676951, 1, 0, 0, 1, 1,
-0.3942141, 0.3979175, -0.1822858, 1, 0, 0, 1, 1,
-0.3925988, -0.004640457, -2.674609, 0, 0, 0, 1, 1,
-0.3891581, 1.279057, -0.1535867, 0, 0, 0, 1, 1,
-0.3891017, -1.541452, -1.705642, 0, 0, 0, 1, 1,
-0.3863628, 0.206018, -1.705765, 0, 0, 0, 1, 1,
-0.3795434, 2.07925, 1.926286, 0, 0, 0, 1, 1,
-0.3793467, -1.186065, -3.437198, 0, 0, 0, 1, 1,
-0.371004, -1.195182, -2.023363, 0, 0, 0, 1, 1,
-0.368978, -0.5424335, -2.221325, 1, 1, 1, 1, 1,
-0.3562227, -0.6712629, -2.899835, 1, 1, 1, 1, 1,
-0.352798, -0.6613484, -1.135212, 1, 1, 1, 1, 1,
-0.3522443, -0.4167067, -2.622455, 1, 1, 1, 1, 1,
-0.3515629, 0.8039504, -1.698731, 1, 1, 1, 1, 1,
-0.3514945, -0.2455122, -1.77291, 1, 1, 1, 1, 1,
-0.3480279, -0.7032132, -3.436934, 1, 1, 1, 1, 1,
-0.3476392, -0.1894785, -2.958127, 1, 1, 1, 1, 1,
-0.3424855, -0.313627, -3.498674, 1, 1, 1, 1, 1,
-0.3409857, 0.1744628, -1.052934, 1, 1, 1, 1, 1,
-0.3399774, -0.287016, -2.420332, 1, 1, 1, 1, 1,
-0.3398391, 1.161659, 0.7549366, 1, 1, 1, 1, 1,
-0.3395495, 0.6667213, 0.5483507, 1, 1, 1, 1, 1,
-0.3394825, -1.32537, -2.465157, 1, 1, 1, 1, 1,
-0.3304015, -0.4632235, -1.624717, 1, 1, 1, 1, 1,
-0.3216798, 1.588241, 2.368308, 0, 0, 1, 1, 1,
-0.3179292, -0.2836868, -2.349673, 1, 0, 0, 1, 1,
-0.3109996, 0.2432989, -0.852753, 1, 0, 0, 1, 1,
-0.3103422, 1.503096, 0.3854291, 1, 0, 0, 1, 1,
-0.308897, 1.084334, -0.1878606, 1, 0, 0, 1, 1,
-0.3033177, 0.04917802, -1.163672, 1, 0, 0, 1, 1,
-0.302543, 1.931397, 0.04069258, 0, 0, 0, 1, 1,
-0.29906, -1.495354, -3.554503, 0, 0, 0, 1, 1,
-0.2953149, 0.3154197, -0.0995485, 0, 0, 0, 1, 1,
-0.2933368, -1.87246, -1.716408, 0, 0, 0, 1, 1,
-0.2931521, -0.7339447, -0.7912602, 0, 0, 0, 1, 1,
-0.2928862, 0.9873701, -1.496955, 0, 0, 0, 1, 1,
-0.291388, 0.6187017, -1.456755, 0, 0, 0, 1, 1,
-0.2890903, 0.2905908, 0.2451701, 1, 1, 1, 1, 1,
-0.2877784, -1.138782, -3.361605, 1, 1, 1, 1, 1,
-0.283536, -0.07285432, -3.189113, 1, 1, 1, 1, 1,
-0.2820643, -0.6610762, -2.624716, 1, 1, 1, 1, 1,
-0.2787153, -0.4427619, -2.317954, 1, 1, 1, 1, 1,
-0.271419, 0.2375658, 0.53835, 1, 1, 1, 1, 1,
-0.2666149, 0.1492189, -1.665603, 1, 1, 1, 1, 1,
-0.2663317, -0.4065948, -3.241334, 1, 1, 1, 1, 1,
-0.2600489, 2.320701, -0.3693722, 1, 1, 1, 1, 1,
-0.2586385, 0.7080832, -1.767618, 1, 1, 1, 1, 1,
-0.2534897, -0.4206044, -2.725895, 1, 1, 1, 1, 1,
-0.2531079, 0.4696579, 0.3636832, 1, 1, 1, 1, 1,
-0.2484943, 1.133235, -0.2846391, 1, 1, 1, 1, 1,
-0.2472507, -0.2884623, -4.183349, 1, 1, 1, 1, 1,
-0.246712, -0.4583933, -2.98904, 1, 1, 1, 1, 1,
-0.2466366, 0.6032992, 0.7361693, 0, 0, 1, 1, 1,
-0.2458273, 1.244624, 0.6361081, 1, 0, 0, 1, 1,
-0.2382054, 1.956921, 0.8077842, 1, 0, 0, 1, 1,
-0.2363965, 1.176816, 0.5298132, 1, 0, 0, 1, 1,
-0.234813, -2.320814, -2.52204, 1, 0, 0, 1, 1,
-0.2326422, 0.1828486, -2.302246, 1, 0, 0, 1, 1,
-0.2288651, -0.3179072, -2.957817, 0, 0, 0, 1, 1,
-0.2215363, -0.4905745, -3.112117, 0, 0, 0, 1, 1,
-0.2188888, -0.1410079, -1.525028, 0, 0, 0, 1, 1,
-0.2152399, -0.2854518, -2.446794, 0, 0, 0, 1, 1,
-0.2089569, 0.2809649, -1.555651, 0, 0, 0, 1, 1,
-0.2062513, -1.235415, -2.430883, 0, 0, 0, 1, 1,
-0.2048927, 0.2230468, -0.5279087, 0, 0, 0, 1, 1,
-0.2048105, -0.4919589, -4.088473, 1, 1, 1, 1, 1,
-0.1995473, -0.07939775, -3.682031, 1, 1, 1, 1, 1,
-0.1983516, -0.4490244, -3.794236, 1, 1, 1, 1, 1,
-0.1967338, 1.876877, -1.262398, 1, 1, 1, 1, 1,
-0.195446, -0.05044858, -2.322157, 1, 1, 1, 1, 1,
-0.1947737, 1.421644, -0.006542322, 1, 1, 1, 1, 1,
-0.194315, 0.4549716, -1.742837, 1, 1, 1, 1, 1,
-0.190904, 1.086192, -0.1156526, 1, 1, 1, 1, 1,
-0.1905366, -0.9847546, -2.542385, 1, 1, 1, 1, 1,
-0.1867156, -1.152808, -2.812393, 1, 1, 1, 1, 1,
-0.1846871, 0.4136082, -1.523882, 1, 1, 1, 1, 1,
-0.1830457, 1.526009, 0.9046308, 1, 1, 1, 1, 1,
-0.1813153, -0.8073392, -2.603996, 1, 1, 1, 1, 1,
-0.1785277, 0.3760906, 0.3685133, 1, 1, 1, 1, 1,
-0.1763101, 2.305141, -1.2039, 1, 1, 1, 1, 1,
-0.1738565, 1.004616, -0.2229124, 0, 0, 1, 1, 1,
-0.1722292, -0.4237403, -1.691036, 1, 0, 0, 1, 1,
-0.1663007, 1.211466, -0.9179039, 1, 0, 0, 1, 1,
-0.1661679, 0.2346264, -0.5679713, 1, 0, 0, 1, 1,
-0.1639641, -0.9220083, -2.383697, 1, 0, 0, 1, 1,
-0.1611195, -0.3110712, -2.346402, 1, 0, 0, 1, 1,
-0.1554678, -0.9012606, -3.471832, 0, 0, 0, 1, 1,
-0.1548362, -0.3957373, -3.926046, 0, 0, 0, 1, 1,
-0.1534055, -0.3818543, -1.156621, 0, 0, 0, 1, 1,
-0.1425779, 0.5958428, -2.267351, 0, 0, 0, 1, 1,
-0.1410516, -0.1498174, -1.450712, 0, 0, 0, 1, 1,
-0.1373017, -0.6271651, -2.408584, 0, 0, 0, 1, 1,
-0.1370066, 1.856583, -0.2228916, 0, 0, 0, 1, 1,
-0.1348488, -0.6222572, -2.807147, 1, 1, 1, 1, 1,
-0.1326816, 1.047139, -1.651724, 1, 1, 1, 1, 1,
-0.1226485, 0.6707161, 0.6240776, 1, 1, 1, 1, 1,
-0.1221324, -0.8579676, -2.574204, 1, 1, 1, 1, 1,
-0.1194322, -0.1366127, -3.94541, 1, 1, 1, 1, 1,
-0.1190382, -0.4342483, -1.237482, 1, 1, 1, 1, 1,
-0.1089365, -0.4411792, -0.4976441, 1, 1, 1, 1, 1,
-0.1031933, -1.136892, -1.360545, 1, 1, 1, 1, 1,
-0.1028637, -0.08287156, -0.6111541, 1, 1, 1, 1, 1,
-0.1015067, -0.2791042, -3.718573, 1, 1, 1, 1, 1,
-0.1002635, 0.1893448, -0.2049841, 1, 1, 1, 1, 1,
-0.0991712, -1.368164, -3.069983, 1, 1, 1, 1, 1,
-0.09699341, 0.2523802, -0.2614782, 1, 1, 1, 1, 1,
-0.09516941, 1.768059, -0.4770318, 1, 1, 1, 1, 1,
-0.09252042, -2.034846, -4.100884, 1, 1, 1, 1, 1,
-0.09211864, -0.02525098, -1.559719, 0, 0, 1, 1, 1,
-0.09134936, -0.5487393, -1.997532, 1, 0, 0, 1, 1,
-0.08977018, -0.3914244, -2.385529, 1, 0, 0, 1, 1,
-0.08570542, -0.6094712, -3.79197, 1, 0, 0, 1, 1,
-0.08227369, -0.210329, -2.657401, 1, 0, 0, 1, 1,
-0.07276887, 0.7541381, 1.413362, 1, 0, 0, 1, 1,
-0.06748304, 0.5944619, -0.3181803, 0, 0, 0, 1, 1,
-0.06613984, -0.9186775, -3.136391, 0, 0, 0, 1, 1,
-0.06553679, 0.7023544, 0.9237521, 0, 0, 0, 1, 1,
-0.06523949, -0.2532097, -1.063195, 0, 0, 0, 1, 1,
-0.06400269, 0.2240562, 2.46751, 0, 0, 0, 1, 1,
-0.06143729, 1.598275, 0.4440361, 0, 0, 0, 1, 1,
-0.05447996, 1.60493, -2.120305, 0, 0, 0, 1, 1,
-0.04944931, 0.2049812, 0.1547325, 1, 1, 1, 1, 1,
-0.04843427, 0.9171439, 0.7167234, 1, 1, 1, 1, 1,
-0.03921973, 1.423622, -0.9981125, 1, 1, 1, 1, 1,
-0.03888449, 0.1755871, 0.805456, 1, 1, 1, 1, 1,
-0.03874497, 0.9183334, 2.605731, 1, 1, 1, 1, 1,
-0.03854681, 0.8386508, -1.257264, 1, 1, 1, 1, 1,
-0.03615124, 1.474965, -0.5807897, 1, 1, 1, 1, 1,
-0.03478798, -0.3241484, -2.869171, 1, 1, 1, 1, 1,
-0.03467872, -1.489079, -3.49171, 1, 1, 1, 1, 1,
-0.03451141, 1.61548, 1.011683, 1, 1, 1, 1, 1,
-0.03292198, -1.622864, -2.869436, 1, 1, 1, 1, 1,
-0.0320511, -1.015157, -4.017242, 1, 1, 1, 1, 1,
-0.02838124, -1.707946, -3.527678, 1, 1, 1, 1, 1,
-0.02605905, 0.3273145, 0.8822743, 1, 1, 1, 1, 1,
-0.02206292, -0.33154, -2.404812, 1, 1, 1, 1, 1,
-0.01959174, -0.6708824, -3.264548, 0, 0, 1, 1, 1,
-0.01480411, 0.4263959, -0.8483855, 1, 0, 0, 1, 1,
-0.01440019, 1.41166, 0.8020872, 1, 0, 0, 1, 1,
-0.01221125, 0.3826343, 1.393094, 1, 0, 0, 1, 1,
-0.0065523, -0.361427, -2.074849, 1, 0, 0, 1, 1,
-0.006513907, -0.8306724, -3.890024, 1, 0, 0, 1, 1,
-0.005378533, -0.01339095, -4.535025, 0, 0, 0, 1, 1,
-0.005346959, -0.05687816, -3.286809, 0, 0, 0, 1, 1,
-0.001935944, 0.5895133, 2.110923, 0, 0, 0, 1, 1,
0.0006107832, -0.7721346, 3.624064, 0, 0, 0, 1, 1,
0.00248631, 0.9194745, -0.9735695, 0, 0, 0, 1, 1,
0.008239943, 0.7663773, -0.4815404, 0, 0, 0, 1, 1,
0.01000731, 0.1627248, 0.08301737, 0, 0, 0, 1, 1,
0.01318791, -1.115086, 3.548479, 1, 1, 1, 1, 1,
0.01346439, -1.324336, 4.773537, 1, 1, 1, 1, 1,
0.01413855, -0.9825928, 5.230731, 1, 1, 1, 1, 1,
0.01427145, 0.8143784, 1.283489, 1, 1, 1, 1, 1,
0.01429402, -0.4955288, 0.7421035, 1, 1, 1, 1, 1,
0.01655937, -0.9455281, 3.500446, 1, 1, 1, 1, 1,
0.02062516, -0.1740308, 3.411974, 1, 1, 1, 1, 1,
0.02177781, 0.6082125, -0.7210243, 1, 1, 1, 1, 1,
0.0218274, 0.42088, -0.980279, 1, 1, 1, 1, 1,
0.02367629, -0.009183374, 1.982468, 1, 1, 1, 1, 1,
0.02461868, 1.415551, 0.3038938, 1, 1, 1, 1, 1,
0.02805809, 0.02367648, 0.9302208, 1, 1, 1, 1, 1,
0.03196044, 0.4449781, -0.9169957, 1, 1, 1, 1, 1,
0.03630387, 1.327497, -0.6823319, 1, 1, 1, 1, 1,
0.03863578, -0.5576177, 0.8744338, 1, 1, 1, 1, 1,
0.03985736, -0.9131222, 4.216859, 0, 0, 1, 1, 1,
0.04639377, -1.763471, 4.451505, 1, 0, 0, 1, 1,
0.04764405, -0.6150694, 3.959123, 1, 0, 0, 1, 1,
0.04889394, -0.5788454, 1.518711, 1, 0, 0, 1, 1,
0.05323264, 0.9232051, -0.2079851, 1, 0, 0, 1, 1,
0.05470349, -1.379282, 1.495734, 1, 0, 0, 1, 1,
0.05663664, -0.363229, 2.877899, 0, 0, 0, 1, 1,
0.05761208, -0.6283762, 3.042815, 0, 0, 0, 1, 1,
0.05784469, -1.80291, 4.426599, 0, 0, 0, 1, 1,
0.05898411, -0.206983, 1.509655, 0, 0, 0, 1, 1,
0.06025561, -0.4835678, 3.992998, 0, 0, 0, 1, 1,
0.06423154, 0.3545602, 1.302721, 0, 0, 0, 1, 1,
0.06570709, 1.160664, -0.9125205, 0, 0, 0, 1, 1,
0.06615657, 1.797319, 0.32612, 1, 1, 1, 1, 1,
0.06711122, -0.381451, 2.692193, 1, 1, 1, 1, 1,
0.06867135, 0.732387, 0.009534717, 1, 1, 1, 1, 1,
0.07879381, -0.1610923, 1.908612, 1, 1, 1, 1, 1,
0.08450102, -1.625084, 5.051652, 1, 1, 1, 1, 1,
0.08468948, -0.4282394, 2.397319, 1, 1, 1, 1, 1,
0.08482595, -0.2278544, 2.737448, 1, 1, 1, 1, 1,
0.0855355, 0.2653969, 0.417578, 1, 1, 1, 1, 1,
0.08668871, 2.603462, 0.9632022, 1, 1, 1, 1, 1,
0.08712208, -0.6942424, 4.219268, 1, 1, 1, 1, 1,
0.08777353, -1.48228, 2.827149, 1, 1, 1, 1, 1,
0.09014334, 1.14604, -0.7016229, 1, 1, 1, 1, 1,
0.0912882, -0.1783352, 3.28161, 1, 1, 1, 1, 1,
0.0979237, -1.0978, 3.630891, 1, 1, 1, 1, 1,
0.09849554, -0.6517613, 1.856665, 1, 1, 1, 1, 1,
0.1015214, 0.06121785, 1.493297, 0, 0, 1, 1, 1,
0.1139357, -0.09777366, 1.519903, 1, 0, 0, 1, 1,
0.114464, 0.4198161, -0.5226272, 1, 0, 0, 1, 1,
0.1149006, -1.596406, 2.729651, 1, 0, 0, 1, 1,
0.1154998, 0.147209, -0.06950803, 1, 0, 0, 1, 1,
0.1217836, 1.367368, 0.7630151, 1, 0, 0, 1, 1,
0.1248989, -0.1343481, 1.344716, 0, 0, 0, 1, 1,
0.1271046, 0.3442394, 0.7129961, 0, 0, 0, 1, 1,
0.1273057, 0.288435, 0.6178955, 0, 0, 0, 1, 1,
0.1284959, 0.8972667, -0.8578956, 0, 0, 0, 1, 1,
0.1309635, 0.3728652, 2.02051, 0, 0, 0, 1, 1,
0.1355813, -0.5158654, 2.159252, 0, 0, 0, 1, 1,
0.1366581, -0.1519401, 3.271556, 0, 0, 0, 1, 1,
0.1421214, -0.114966, 2.090397, 1, 1, 1, 1, 1,
0.1462649, -0.3265243, 2.392591, 1, 1, 1, 1, 1,
0.1469856, 1.802088, 0.8848745, 1, 1, 1, 1, 1,
0.1471845, -0.6225104, 1.62918, 1, 1, 1, 1, 1,
0.1475113, 0.1360107, -0.5837116, 1, 1, 1, 1, 1,
0.1534291, -0.9652067, 4.039627, 1, 1, 1, 1, 1,
0.1534386, 0.3050568, -1.272558, 1, 1, 1, 1, 1,
0.1554399, 1.000587, -2.126404, 1, 1, 1, 1, 1,
0.1558576, 0.4770401, 0.4204646, 1, 1, 1, 1, 1,
0.1578471, -0.2312523, 2.065415, 1, 1, 1, 1, 1,
0.1585828, 0.3829929, -0.2453251, 1, 1, 1, 1, 1,
0.1616168, 0.02852485, 0.3521515, 1, 1, 1, 1, 1,
0.1628421, -0.6129074, 2.91729, 1, 1, 1, 1, 1,
0.1633283, 0.4138574, 1.696037, 1, 1, 1, 1, 1,
0.1634266, 0.5796779, 0.2271337, 1, 1, 1, 1, 1,
0.1652076, 0.1063345, 0.3012311, 0, 0, 1, 1, 1,
0.1658848, -2.005759, 2.074038, 1, 0, 0, 1, 1,
0.1747238, 2.627105, 0.3182994, 1, 0, 0, 1, 1,
0.181826, 1.177774, -1.029773, 1, 0, 0, 1, 1,
0.1843138, -1.269361, 3.97664, 1, 0, 0, 1, 1,
0.1846113, 0.02102858, 1.677351, 1, 0, 0, 1, 1,
0.1855106, -1.04486, 3.080243, 0, 0, 0, 1, 1,
0.1874259, -2.401442, 3.327131, 0, 0, 0, 1, 1,
0.1875431, 0.9205731, -0.3097, 0, 0, 0, 1, 1,
0.1940852, 0.1261703, 0.8586984, 0, 0, 0, 1, 1,
0.196166, 0.01588701, 2.9502, 0, 0, 0, 1, 1,
0.1980623, -1.771737, 3.456652, 0, 0, 0, 1, 1,
0.2001469, 0.6699057, 1.421048, 0, 0, 0, 1, 1,
0.2009845, 0.01575395, -0.3340299, 1, 1, 1, 1, 1,
0.2042916, 0.5087032, 1.61121, 1, 1, 1, 1, 1,
0.2060837, 0.8432064, 1.797533, 1, 1, 1, 1, 1,
0.2069842, -1.784078, 4.095234, 1, 1, 1, 1, 1,
0.2072133, 0.4551224, -1.257784, 1, 1, 1, 1, 1,
0.2105923, -0.9654294, 2.541853, 1, 1, 1, 1, 1,
0.2149032, -1.372772, 4.472812, 1, 1, 1, 1, 1,
0.2246609, 0.3431495, 1.379613, 1, 1, 1, 1, 1,
0.2269721, -0.6003477, 4.861035, 1, 1, 1, 1, 1,
0.2282551, -0.5636006, 2.48037, 1, 1, 1, 1, 1,
0.2301948, -0.4479315, 3.131586, 1, 1, 1, 1, 1,
0.2319506, -0.3189636, 3.639436, 1, 1, 1, 1, 1,
0.2373831, 0.731202, -0.3131211, 1, 1, 1, 1, 1,
0.2382443, -0.8552725, 5.419909, 1, 1, 1, 1, 1,
0.2461544, -0.9714428, 3.561759, 1, 1, 1, 1, 1,
0.2529444, 0.09034958, 3.320811, 0, 0, 1, 1, 1,
0.2543074, -1.787883, 4.822374, 1, 0, 0, 1, 1,
0.2553443, -0.4578429, 4.6085, 1, 0, 0, 1, 1,
0.2594537, 0.4683393, 0.390713, 1, 0, 0, 1, 1,
0.26305, -1.319675, 2.58598, 1, 0, 0, 1, 1,
0.2635791, -1.078239, 2.616821, 1, 0, 0, 1, 1,
0.2648275, -1.16507, 3.371205, 0, 0, 0, 1, 1,
0.2651443, -0.3937334, 2.350838, 0, 0, 0, 1, 1,
0.2685937, 1.119896, -0.2848129, 0, 0, 0, 1, 1,
0.2722951, -1.066596, 2.792248, 0, 0, 0, 1, 1,
0.2781718, -0.9788039, 4.135151, 0, 0, 0, 1, 1,
0.2804725, 1.047824, -0.6696517, 0, 0, 0, 1, 1,
0.2808566, 1.871383, -0.07288203, 0, 0, 0, 1, 1,
0.2823526, -1.0027, 3.151285, 1, 1, 1, 1, 1,
0.2858673, 0.3490022, -2.657198, 1, 1, 1, 1, 1,
0.2880353, -0.1019416, 1.355527, 1, 1, 1, 1, 1,
0.2920894, 0.2571981, 0.3495494, 1, 1, 1, 1, 1,
0.2928236, -0.2510304, 3.521613, 1, 1, 1, 1, 1,
0.2967839, 0.04310242, 1.806161, 1, 1, 1, 1, 1,
0.2974577, -0.342064, 3.758775, 1, 1, 1, 1, 1,
0.2989278, -0.3834724, 2.995384, 1, 1, 1, 1, 1,
0.3012023, -0.2512586, 1.322075, 1, 1, 1, 1, 1,
0.3028993, -0.001874673, 2.788515, 1, 1, 1, 1, 1,
0.303099, -0.2479376, 3.739787, 1, 1, 1, 1, 1,
0.3054695, 1.175855, 0.7609407, 1, 1, 1, 1, 1,
0.3085465, 0.01046904, 0.7509513, 1, 1, 1, 1, 1,
0.3088504, 1.163627, -0.502463, 1, 1, 1, 1, 1,
0.3097704, -1.095437, 3.457741, 1, 1, 1, 1, 1,
0.3145116, -0.004933215, 2.74534, 0, 0, 1, 1, 1,
0.3199146, 0.6597399, -0.2418261, 1, 0, 0, 1, 1,
0.3208214, 0.2078277, 1.768868, 1, 0, 0, 1, 1,
0.3253258, 1.348176, -0.6888223, 1, 0, 0, 1, 1,
0.3253374, -1.117171, 2.932187, 1, 0, 0, 1, 1,
0.3274503, -0.1504807, 2.681549, 1, 0, 0, 1, 1,
0.3276445, -0.6206822, 2.041783, 0, 0, 0, 1, 1,
0.3328078, -0.9630254, 2.471765, 0, 0, 0, 1, 1,
0.3372172, -0.567951, 2.65164, 0, 0, 0, 1, 1,
0.3443784, 0.4829859, 0.5038811, 0, 0, 0, 1, 1,
0.3452597, 0.7269094, 1.294121, 0, 0, 0, 1, 1,
0.353587, -2.010516, 4.41822, 0, 0, 0, 1, 1,
0.3639985, 1.141633, 1.122726, 0, 0, 0, 1, 1,
0.3657334, -0.4436508, 2.813702, 1, 1, 1, 1, 1,
0.3668436, 0.1784054, 1.573966, 1, 1, 1, 1, 1,
0.3737121, -0.6716263, 3.571303, 1, 1, 1, 1, 1,
0.3744222, -0.167709, 0.5538566, 1, 1, 1, 1, 1,
0.3748379, -1.537608, 1.773047, 1, 1, 1, 1, 1,
0.3769547, -1.954967, 3.621927, 1, 1, 1, 1, 1,
0.3795617, 0.6665576, 0.6276997, 1, 1, 1, 1, 1,
0.3799354, 0.6416128, 0.6586939, 1, 1, 1, 1, 1,
0.3850243, -0.7874755, 2.535386, 1, 1, 1, 1, 1,
0.3924287, -0.1480988, 1.627753, 1, 1, 1, 1, 1,
0.3935427, 0.1539856, 1.469094, 1, 1, 1, 1, 1,
0.3951093, -0.7658476, 2.116127, 1, 1, 1, 1, 1,
0.4044629, 0.9267322, 1.033777, 1, 1, 1, 1, 1,
0.4046763, 1.244889, -0.8714838, 1, 1, 1, 1, 1,
0.4084652, 0.1578781, 1.371884, 1, 1, 1, 1, 1,
0.4124039, -0.3956285, 1.94018, 0, 0, 1, 1, 1,
0.4163423, -1.427765, 1.323083, 1, 0, 0, 1, 1,
0.4277316, 0.1424453, 1.498281, 1, 0, 0, 1, 1,
0.4313318, 0.4450181, 1.310444, 1, 0, 0, 1, 1,
0.4325997, -0.9981814, 1.971161, 1, 0, 0, 1, 1,
0.4354574, 0.6771212, 1.102121, 1, 0, 0, 1, 1,
0.4363699, 0.6204984, 2.581805, 0, 0, 0, 1, 1,
0.4388307, 0.6391547, 1.958331, 0, 0, 0, 1, 1,
0.4391826, 1.685334, 0.1915792, 0, 0, 0, 1, 1,
0.4426544, 0.130807, -0.08874635, 0, 0, 0, 1, 1,
0.4439869, -0.2810462, 0.5948998, 0, 0, 0, 1, 1,
0.4456603, -0.6326719, 2.717114, 0, 0, 0, 1, 1,
0.4486738, 1.196399, 0.7557597, 0, 0, 0, 1, 1,
0.4490258, 0.2912186, 2.253967, 1, 1, 1, 1, 1,
0.4510007, -0.5064167, 4.042274, 1, 1, 1, 1, 1,
0.455686, -0.7554906, 0.8394328, 1, 1, 1, 1, 1,
0.4594073, -1.31977, 2.171606, 1, 1, 1, 1, 1,
0.4598068, 1.927822, 0.51886, 1, 1, 1, 1, 1,
0.4624121, 0.6811197, 1.510923, 1, 1, 1, 1, 1,
0.4657404, 1.76848, 1.396168, 1, 1, 1, 1, 1,
0.4680618, 1.079084, -1.057151, 1, 1, 1, 1, 1,
0.4692375, -0.3929751, 1.616465, 1, 1, 1, 1, 1,
0.4701602, -0.02048826, 2.562813, 1, 1, 1, 1, 1,
0.4759231, 1.906478, -0.4561202, 1, 1, 1, 1, 1,
0.4761075, -1.045138, 3.039878, 1, 1, 1, 1, 1,
0.4810476, -0.9176715, 1.245867, 1, 1, 1, 1, 1,
0.4856802, -0.8487576, 1.790377, 1, 1, 1, 1, 1,
0.48659, -1.459114, 2.057541, 1, 1, 1, 1, 1,
0.4894926, -0.4104167, 1.140959, 0, 0, 1, 1, 1,
0.4946926, -1.124247, 1.825336, 1, 0, 0, 1, 1,
0.4949639, 0.7494921, -0.514611, 1, 0, 0, 1, 1,
0.4950825, 1.307751, 2.27909, 1, 0, 0, 1, 1,
0.4952679, -1.552881, 2.629983, 1, 0, 0, 1, 1,
0.4970688, -1.318037, 3.529787, 1, 0, 0, 1, 1,
0.4990053, -0.6966131, 1.966361, 0, 0, 0, 1, 1,
0.5017353, 0.3875562, 0.8297463, 0, 0, 0, 1, 1,
0.5021772, 1.043565, 1.071581, 0, 0, 0, 1, 1,
0.5053974, 0.1376145, 1.435632, 0, 0, 0, 1, 1,
0.5062998, -0.1647533, 1.278264, 0, 0, 0, 1, 1,
0.5072839, -0.2776974, 0.9218481, 0, 0, 0, 1, 1,
0.5085419, -0.385571, 1.759562, 0, 0, 0, 1, 1,
0.5207582, -0.3365749, 1.097023, 1, 1, 1, 1, 1,
0.5249715, 0.6454051, 1.523644, 1, 1, 1, 1, 1,
0.5272886, -0.1219811, 2.141911, 1, 1, 1, 1, 1,
0.5286118, -0.8018641, 3.337171, 1, 1, 1, 1, 1,
0.5323244, -0.8149451, 2.292756, 1, 1, 1, 1, 1,
0.5350907, 0.5438448, 1.211084, 1, 1, 1, 1, 1,
0.5517913, -0.09259038, 1.076254, 1, 1, 1, 1, 1,
0.5558342, -1.748992, 2.709455, 1, 1, 1, 1, 1,
0.5663138, -2.819003, 5.684307, 1, 1, 1, 1, 1,
0.5670044, 0.2274664, 1.530932, 1, 1, 1, 1, 1,
0.5673007, -1.47667, 3.572385, 1, 1, 1, 1, 1,
0.5733555, -0.4995342, 1.223823, 1, 1, 1, 1, 1,
0.5733806, -0.9636446, 3.777849, 1, 1, 1, 1, 1,
0.5759309, -1.126559, 3.562864, 1, 1, 1, 1, 1,
0.5779505, 1.600878, -0.09952544, 1, 1, 1, 1, 1,
0.5781476, 1.01834, -1.253478, 0, 0, 1, 1, 1,
0.5820513, -0.4734969, 3.323929, 1, 0, 0, 1, 1,
0.5855182, -1.263437, 2.628445, 1, 0, 0, 1, 1,
0.5880077, 0.469198, 0.7853289, 1, 0, 0, 1, 1,
0.5891587, -1.58374, 2.099789, 1, 0, 0, 1, 1,
0.5912834, -0.136703, 0.616716, 1, 0, 0, 1, 1,
0.5923574, -0.7338165, 2.313508, 0, 0, 0, 1, 1,
0.5985948, 0.03941499, 1.03353, 0, 0, 0, 1, 1,
0.5996966, 0.8115824, 0.9677663, 0, 0, 0, 1, 1,
0.6086235, 0.7662672, 0.6888339, 0, 0, 0, 1, 1,
0.6099308, 0.5661384, 0.9313815, 0, 0, 0, 1, 1,
0.6207937, -0.4095697, 1.289633, 0, 0, 0, 1, 1,
0.6236302, -2.093008, 3.841023, 0, 0, 0, 1, 1,
0.6254068, -1.475773, 2.892797, 1, 1, 1, 1, 1,
0.6284201, -0.5133862, 0.8219527, 1, 1, 1, 1, 1,
0.6298549, -1.793687, 3.036125, 1, 1, 1, 1, 1,
0.6300671, 0.7761865, 0.282082, 1, 1, 1, 1, 1,
0.6307866, -0.5721637, 1.463041, 1, 1, 1, 1, 1,
0.6308367, 0.5952544, 0.3338269, 1, 1, 1, 1, 1,
0.6309752, 1.008299, 0.8321238, 1, 1, 1, 1, 1,
0.6336097, -1.921405, 2.008771, 1, 1, 1, 1, 1,
0.6364549, -0.22579, -0.1288254, 1, 1, 1, 1, 1,
0.6394626, -1.827248, 0.5741026, 1, 1, 1, 1, 1,
0.6465027, -0.296948, 2.778394, 1, 1, 1, 1, 1,
0.6482355, -0.2930107, 1.653075, 1, 1, 1, 1, 1,
0.6518345, -0.2069477, 0.6421363, 1, 1, 1, 1, 1,
0.6612362, 1.849409, 0.1009842, 1, 1, 1, 1, 1,
0.6680538, 0.9040481, 2.783254, 1, 1, 1, 1, 1,
0.6801137, 1.222906, -0.2039335, 0, 0, 1, 1, 1,
0.6813294, 0.7594949, 0.3856729, 1, 0, 0, 1, 1,
0.683193, 0.6719698, 1.34407, 1, 0, 0, 1, 1,
0.6868938, 0.4890481, 0.6429656, 1, 0, 0, 1, 1,
0.6903449, -1.066997, 2.078629, 1, 0, 0, 1, 1,
0.6957158, 0.5860209, 0.8776646, 1, 0, 0, 1, 1,
0.6982498, 0.9257128, 1.447034, 0, 0, 0, 1, 1,
0.7021141, 0.2495002, 1.214285, 0, 0, 0, 1, 1,
0.7021658, 0.08842311, 3.224718, 0, 0, 0, 1, 1,
0.716237, 0.8909002, 0.2653404, 0, 0, 0, 1, 1,
0.7185112, 1.027877, 0.4157902, 0, 0, 0, 1, 1,
0.7277381, 1.526249, 0.5310832, 0, 0, 0, 1, 1,
0.7283936, -1.756465, 3.28707, 0, 0, 0, 1, 1,
0.7377092, -0.8357398, 0.5119283, 1, 1, 1, 1, 1,
0.7389495, -1.158249, 2.591205, 1, 1, 1, 1, 1,
0.7396374, -2.047898, 3.583562, 1, 1, 1, 1, 1,
0.7401186, -0.8033665, 1.626355, 1, 1, 1, 1, 1,
0.7444991, -1.351556, 2.201984, 1, 1, 1, 1, 1,
0.7457039, 0.5902596, 0.03192428, 1, 1, 1, 1, 1,
0.7527923, 1.544242, -0.9991275, 1, 1, 1, 1, 1,
0.7561518, -2.720782, 4.729066, 1, 1, 1, 1, 1,
0.7585559, -0.7684393, 2.655524, 1, 1, 1, 1, 1,
0.7595305, 0.6612378, 0.7091683, 1, 1, 1, 1, 1,
0.7600591, -0.8296327, 3.295491, 1, 1, 1, 1, 1,
0.7605788, -1.401707, 2.995278, 1, 1, 1, 1, 1,
0.7623154, -1.388378, 2.873941, 1, 1, 1, 1, 1,
0.7626914, 0.6976175, -0.09213055, 1, 1, 1, 1, 1,
0.763988, -0.7405711, 2.654772, 1, 1, 1, 1, 1,
0.7736179, -0.2315254, 2.268194, 0, 0, 1, 1, 1,
0.7750996, 1.007239, 0.575574, 1, 0, 0, 1, 1,
0.7763915, 2.487228, 0.5767962, 1, 0, 0, 1, 1,
0.7796655, -0.06894872, 1.023116, 1, 0, 0, 1, 1,
0.7803271, -0.2491433, 1.599291, 1, 0, 0, 1, 1,
0.784756, -0.4302077, 2.195705, 1, 0, 0, 1, 1,
0.7872955, 0.9071478, 0.2183331, 0, 0, 0, 1, 1,
0.7913192, -0.8085775, 1.749357, 0, 0, 0, 1, 1,
0.7964625, 0.2449781, 2.063375, 0, 0, 0, 1, 1,
0.7970083, -0.7837675, 2.802681, 0, 0, 0, 1, 1,
0.79816, -0.2203018, 1.834142, 0, 0, 0, 1, 1,
0.8011953, 0.3037986, 1.128541, 0, 0, 0, 1, 1,
0.8019052, 0.1884325, 1.615259, 0, 0, 0, 1, 1,
0.8043775, -0.6695428, 3.221906, 1, 1, 1, 1, 1,
0.8044513, 1.587109, 0.3076768, 1, 1, 1, 1, 1,
0.8070714, -0.6605846, 1.384579, 1, 1, 1, 1, 1,
0.8075636, -1.016207, 2.493734, 1, 1, 1, 1, 1,
0.8075816, -0.2735373, 3.297424, 1, 1, 1, 1, 1,
0.8077915, -1.183034, 1.332928, 1, 1, 1, 1, 1,
0.8201942, -0.8744282, 3.169242, 1, 1, 1, 1, 1,
0.8223697, 0.3156198, 1.008253, 1, 1, 1, 1, 1,
0.8225245, 2.187844, -1.010086, 1, 1, 1, 1, 1,
0.8233961, -1.024135, 2.344534, 1, 1, 1, 1, 1,
0.8328285, 0.2425075, 0.3137346, 1, 1, 1, 1, 1,
0.8363949, -0.4183326, 2.44013, 1, 1, 1, 1, 1,
0.838437, 1.509413, 0.4940032, 1, 1, 1, 1, 1,
0.8477957, -2.200652, 3.692773, 1, 1, 1, 1, 1,
0.8495831, -1.51378, 2.692922, 1, 1, 1, 1, 1,
0.8543372, 0.6531862, 0.8381562, 0, 0, 1, 1, 1,
0.8623661, 0.7588031, -1.274132, 1, 0, 0, 1, 1,
0.8660452, 1.044204, 1.09854, 1, 0, 0, 1, 1,
0.8705209, 0.07256483, 4.343042, 1, 0, 0, 1, 1,
0.8777005, -0.4015757, 2.217837, 1, 0, 0, 1, 1,
0.8789928, 1.3795, -0.5145382, 1, 0, 0, 1, 1,
0.8819817, -0.3048618, 1.702846, 0, 0, 0, 1, 1,
0.8897073, -0.2215768, 1.615541, 0, 0, 0, 1, 1,
0.8910906, 0.2853726, 1.734253, 0, 0, 0, 1, 1,
0.9047447, -0.1385188, 1.653088, 0, 0, 0, 1, 1,
0.9053838, -1.123758, 1.162135, 0, 0, 0, 1, 1,
0.9314609, -0.5238051, 2.072398, 0, 0, 0, 1, 1,
0.9440607, 0.7823705, 0.009847983, 0, 0, 0, 1, 1,
0.9442812, 0.1304334, 1.950482, 1, 1, 1, 1, 1,
0.9450896, -1.03655, 1.13495, 1, 1, 1, 1, 1,
0.9476885, -0.06113586, 3.577143, 1, 1, 1, 1, 1,
0.951683, -0.8014505, 1.418218, 1, 1, 1, 1, 1,
0.9599613, 0.1479823, 0.3153934, 1, 1, 1, 1, 1,
0.9658121, 0.5343294, -0.0172409, 1, 1, 1, 1, 1,
0.9658737, -1.508283, 3.138429, 1, 1, 1, 1, 1,
0.9659863, 1.034499, 0.1963502, 1, 1, 1, 1, 1,
0.9774895, 0.8078698, 1.611061, 1, 1, 1, 1, 1,
0.9986229, 1.315165, 1.138222, 1, 1, 1, 1, 1,
1.005915, -0.06161756, 2.813337, 1, 1, 1, 1, 1,
1.010115, -0.2540724, 1.528062, 1, 1, 1, 1, 1,
1.011762, -0.3016855, 2.007693, 1, 1, 1, 1, 1,
1.019562, -0.5781226, 0.9009364, 1, 1, 1, 1, 1,
1.021107, -1.68752, 2.284567, 1, 1, 1, 1, 1,
1.021322, -0.3448431, 2.316373, 0, 0, 1, 1, 1,
1.022681, 0.01594108, 1.513276, 1, 0, 0, 1, 1,
1.02676, 0.2648272, 3.409598, 1, 0, 0, 1, 1,
1.02806, -0.2494565, 1.903367, 1, 0, 0, 1, 1,
1.035264, 1.965685, 1.057691, 1, 0, 0, 1, 1,
1.0362, 1.691119, 1.710234, 1, 0, 0, 1, 1,
1.038639, -0.7288964, 0.02945747, 0, 0, 0, 1, 1,
1.040078, 0.2165157, 1.695156, 0, 0, 0, 1, 1,
1.046737, 0.5860265, 1.212812, 0, 0, 0, 1, 1,
1.04774, 0.4891764, 1.30939, 0, 0, 0, 1, 1,
1.052582, -0.9958957, 2.020122, 0, 0, 0, 1, 1,
1.053264, -0.9531853, 0.8161446, 0, 0, 0, 1, 1,
1.060925, 0.4959595, 1.93637, 0, 0, 0, 1, 1,
1.063505, 0.1090971, 1.460792, 1, 1, 1, 1, 1,
1.069466, -1.130897, 1.63513, 1, 1, 1, 1, 1,
1.072048, 0.5671245, -0.2266617, 1, 1, 1, 1, 1,
1.074772, 0.05281639, 1.110261, 1, 1, 1, 1, 1,
1.076048, 2.564265, -0.2004484, 1, 1, 1, 1, 1,
1.078777, -0.1945656, 3.211916, 1, 1, 1, 1, 1,
1.08313, -3.023391, 1.942704, 1, 1, 1, 1, 1,
1.097101, 0.5074716, 0.2315297, 1, 1, 1, 1, 1,
1.098246, -2.074143, 3.862854, 1, 1, 1, 1, 1,
1.100574, 1.688294, 0.7870969, 1, 1, 1, 1, 1,
1.112091, -1.981894, -0.04615031, 1, 1, 1, 1, 1,
1.113121, 0.03938376, 1.919731, 1, 1, 1, 1, 1,
1.120727, -0.989593, 1.880206, 1, 1, 1, 1, 1,
1.121963, -0.3065924, -0.009642538, 1, 1, 1, 1, 1,
1.124764, -0.2645164, 1.433864, 1, 1, 1, 1, 1,
1.128392, 1.125463, 2.254174, 0, 0, 1, 1, 1,
1.130127, 1.620435, 1.975146, 1, 0, 0, 1, 1,
1.138487, 0.364816, 3.121638, 1, 0, 0, 1, 1,
1.145649, -1.752115, 2.436925, 1, 0, 0, 1, 1,
1.151791, -1.094383, 1.673717, 1, 0, 0, 1, 1,
1.173587, -1.085368, 2.683367, 1, 0, 0, 1, 1,
1.178113, -0.4333546, 0.7321154, 0, 0, 0, 1, 1,
1.185751, -1.178937, 2.765054, 0, 0, 0, 1, 1,
1.18738, -0.7896882, 4.229742, 0, 0, 0, 1, 1,
1.194567, -0.9565699, 2.486535, 0, 0, 0, 1, 1,
1.195974, -1.145417, 2.174921, 0, 0, 0, 1, 1,
1.197145, -0.1681513, 1.90048, 0, 0, 0, 1, 1,
1.198951, 1.624607, -0.2678982, 0, 0, 0, 1, 1,
1.200681, -0.3438376, 3.744713, 1, 1, 1, 1, 1,
1.204441, -1.470831, 3.228373, 1, 1, 1, 1, 1,
1.217992, 1.151528, 1.186192, 1, 1, 1, 1, 1,
1.219444, -0.8022303, 3.201277, 1, 1, 1, 1, 1,
1.227708, -0.2172544, 3.380988, 1, 1, 1, 1, 1,
1.229298, 0.6450292, 0.6489015, 1, 1, 1, 1, 1,
1.238026, 0.909994, 0.7940074, 1, 1, 1, 1, 1,
1.239076, 1.830776, 0.5895799, 1, 1, 1, 1, 1,
1.243859, 0.3481418, 1.028787, 1, 1, 1, 1, 1,
1.244574, 0.9754153, 0.682485, 1, 1, 1, 1, 1,
1.252216, -1.417416, 5.477271, 1, 1, 1, 1, 1,
1.253467, -0.8802053, 1.767421, 1, 1, 1, 1, 1,
1.255102, -0.0920105, 2.061177, 1, 1, 1, 1, 1,
1.256973, -0.4188931, 2.731955, 1, 1, 1, 1, 1,
1.258646, 0.8288473, 0.4984636, 1, 1, 1, 1, 1,
1.269109, -0.5515462, 2.079325, 0, 0, 1, 1, 1,
1.273671, 2.47793, -1.769676, 1, 0, 0, 1, 1,
1.283001, 0.3349623, 2.701828, 1, 0, 0, 1, 1,
1.297093, 1.180855, 2.24255, 1, 0, 0, 1, 1,
1.300399, 1.804717, -0.2017685, 1, 0, 0, 1, 1,
1.302129, -0.3060707, 1.08133, 1, 0, 0, 1, 1,
1.324328, 0.08685826, 1.757134, 0, 0, 0, 1, 1,
1.331149, 0.4786407, 1.056411, 0, 0, 0, 1, 1,
1.340235, 1.149787, 1.337891, 0, 0, 0, 1, 1,
1.341043, 0.7274389, 0.1889694, 0, 0, 0, 1, 1,
1.34341, -1.40509, 1.632937, 0, 0, 0, 1, 1,
1.348157, 1.200041, 1.127558, 0, 0, 0, 1, 1,
1.355512, 0.2749905, 3.183781, 0, 0, 0, 1, 1,
1.360475, 0.7943619, 2.443094, 1, 1, 1, 1, 1,
1.371672, -0.2225208, 0.8003367, 1, 1, 1, 1, 1,
1.375007, -0.6284554, 1.459186, 1, 1, 1, 1, 1,
1.378614, -0.1113081, 1.793585, 1, 1, 1, 1, 1,
1.389406, -0.6135717, 2.062743, 1, 1, 1, 1, 1,
1.391926, 0.8422557, 0.2183517, 1, 1, 1, 1, 1,
1.400396, 0.5910509, 0.6523914, 1, 1, 1, 1, 1,
1.403003, 0.2916371, 0.9181864, 1, 1, 1, 1, 1,
1.406091, 0.6233529, 0.5198301, 1, 1, 1, 1, 1,
1.406255, -0.1562971, 2.612688, 1, 1, 1, 1, 1,
1.430895, -0.8686802, 1.831049, 1, 1, 1, 1, 1,
1.434235, -0.5669832, 2.141089, 1, 1, 1, 1, 1,
1.439439, -0.3145433, 1.243834, 1, 1, 1, 1, 1,
1.443653, 0.6216709, 2.723959, 1, 1, 1, 1, 1,
1.445674, -0.3449296, 3.190849, 1, 1, 1, 1, 1,
1.450142, 0.7241372, 1.590515, 0, 0, 1, 1, 1,
1.466301, 0.6715956, 0.2022073, 1, 0, 0, 1, 1,
1.476158, 0.7127188, 2.679567, 1, 0, 0, 1, 1,
1.478326, 0.215048, 1.740762, 1, 0, 0, 1, 1,
1.480876, -0.1716912, 1.393175, 1, 0, 0, 1, 1,
1.482805, 0.5213009, 1.639176, 1, 0, 0, 1, 1,
1.492388, 0.3055606, 0.5993345, 0, 0, 0, 1, 1,
1.496146, 0.1995155, 1.726353, 0, 0, 0, 1, 1,
1.500149, -1.159257, 3.183934, 0, 0, 0, 1, 1,
1.501716, 0.6017371, 0.6483424, 0, 0, 0, 1, 1,
1.514161, 0.5731729, 2.35662, 0, 0, 0, 1, 1,
1.514822, 0.2673585, 0.6868312, 0, 0, 0, 1, 1,
1.520604, 0.9109104, 0.6393774, 0, 0, 0, 1, 1,
1.537969, -1.059363, 4.324872, 1, 1, 1, 1, 1,
1.548093, 1.425074, -0.2024769, 1, 1, 1, 1, 1,
1.552152, 0.1592088, 0.1519379, 1, 1, 1, 1, 1,
1.562999, -0.3598037, 0.836017, 1, 1, 1, 1, 1,
1.563592, -1.525524, 2.541768, 1, 1, 1, 1, 1,
1.583295, 0.5756478, 3.277605, 1, 1, 1, 1, 1,
1.597398, -1.520996, 2.993635, 1, 1, 1, 1, 1,
1.602684, 1.184625, 1.070933, 1, 1, 1, 1, 1,
1.609329, 0.2932629, 4.021872, 1, 1, 1, 1, 1,
1.615299, -0.2857133, 2.972283, 1, 1, 1, 1, 1,
1.616563, -0.7148268, 1.835363, 1, 1, 1, 1, 1,
1.620566, 0.7569181, 1.9716, 1, 1, 1, 1, 1,
1.627632, 1.085274, 0.776712, 1, 1, 1, 1, 1,
1.628871, 0.9628099, 0.8784758, 1, 1, 1, 1, 1,
1.638775, -1.013636, 3.692348, 1, 1, 1, 1, 1,
1.639294, 0.9444437, -0.2649125, 0, 0, 1, 1, 1,
1.63934, -0.2191628, 1.675711, 1, 0, 0, 1, 1,
1.646646, 0.5806845, 0.1093712, 1, 0, 0, 1, 1,
1.649179, -0.06376095, 2.684875, 1, 0, 0, 1, 1,
1.649689, 0.500744, 3.49673, 1, 0, 0, 1, 1,
1.655213, 0.5691196, 1.83638, 1, 0, 0, 1, 1,
1.659222, 0.001865149, 3.818936, 0, 0, 0, 1, 1,
1.66642, 1.060235, 0.542174, 0, 0, 0, 1, 1,
1.666707, -0.3969073, 1.047216, 0, 0, 0, 1, 1,
1.684475, 0.4046605, 3.342443, 0, 0, 0, 1, 1,
1.69821, 0.4127726, 1.249491, 0, 0, 0, 1, 1,
1.698363, 0.01395874, 2.262732, 0, 0, 0, 1, 1,
1.731125, -0.1336526, 1.695168, 0, 0, 0, 1, 1,
1.767348, 1.897729, 1.499831, 1, 1, 1, 1, 1,
1.777041, -2.054536, 1.183619, 1, 1, 1, 1, 1,
1.801173, -0.017722, 1.577069, 1, 1, 1, 1, 1,
1.810164, -0.5959899, 1.293581, 1, 1, 1, 1, 1,
1.818304, 0.3253917, 0.53191, 1, 1, 1, 1, 1,
1.81868, -1.267448, 1.113462, 1, 1, 1, 1, 1,
1.8261, -1.411471, 2.665034, 1, 1, 1, 1, 1,
1.836894, 0.826739, 1.327256, 1, 1, 1, 1, 1,
1.837482, -1.942722, 1.163061, 1, 1, 1, 1, 1,
1.83835, -2.345163, 3.869098, 1, 1, 1, 1, 1,
1.887276, 0.09386578, 0.985884, 1, 1, 1, 1, 1,
1.888179, 0.8569589, 0.2283529, 1, 1, 1, 1, 1,
1.915628, 0.6401348, -0.4069068, 1, 1, 1, 1, 1,
1.928434, 0.8165405, 0.529318, 1, 1, 1, 1, 1,
1.933941, -0.2328599, 2.985817, 1, 1, 1, 1, 1,
1.940848, 0.08597032, 1.301844, 0, 0, 1, 1, 1,
2.010469, -0.7783303, 2.454653, 1, 0, 0, 1, 1,
2.022223, -1.760003, 2.591082, 1, 0, 0, 1, 1,
2.039393, -1.396237, 1.338441, 1, 0, 0, 1, 1,
2.053716, 0.1665833, 1.739788, 1, 0, 0, 1, 1,
2.068599, 0.2165146, 1.326842, 1, 0, 0, 1, 1,
2.069504, 1.227249, 0.4030761, 0, 0, 0, 1, 1,
2.177692, -1.033239, 1.324667, 0, 0, 0, 1, 1,
2.277347, -0.3663389, 2.793471, 0, 0, 0, 1, 1,
2.281266, 2.483236, 1.390304, 0, 0, 0, 1, 1,
2.284601, 2.191936, 1.580433, 0, 0, 0, 1, 1,
2.29838, 0.2824952, 0.6446948, 0, 0, 0, 1, 1,
2.306964, 0.4839259, 2.980374, 0, 0, 0, 1, 1,
2.374737, 0.2205729, 0.9315031, 1, 1, 1, 1, 1,
2.388497, 1.534122, 0.4437835, 1, 1, 1, 1, 1,
2.407216, 0.3852778, 1.099076, 1, 1, 1, 1, 1,
2.428121, 0.8053944, 3.249538, 1, 1, 1, 1, 1,
2.680483, 0.1842459, 2.891348, 1, 1, 1, 1, 1,
2.70528, -1.161711, 1.748017, 1, 1, 1, 1, 1,
3.064524, -1.560715, 2.252586, 1, 1, 1, 1, 1
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
var radius = 9.59048;
var distance = 33.68615;
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
mvMatrix.translate( 0.285907, -0.2375653, -0.4447312 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.68615);
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
