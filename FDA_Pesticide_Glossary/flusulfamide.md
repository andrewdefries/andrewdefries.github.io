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
-3.574145, -1.87572, -1.003104, 1, 0, 0, 1,
-3.094563, -1.148232, -2.448097, 1, 0.007843138, 0, 1,
-2.829105, -0.06869198, -1.275472, 1, 0.01176471, 0, 1,
-2.809094, 1.116328, -0.9485461, 1, 0.01960784, 0, 1,
-2.608604, 1.6525, -1.194233, 1, 0.02352941, 0, 1,
-2.591482, -1.464073, -2.527976, 1, 0.03137255, 0, 1,
-2.577801, -1.157983, -1.798844, 1, 0.03529412, 0, 1,
-2.561656, -0.2578981, -0.7436064, 1, 0.04313726, 0, 1,
-2.505058, -0.1210878, -2.363272, 1, 0.04705882, 0, 1,
-2.478191, 0.3383755, -0.9233006, 1, 0.05490196, 0, 1,
-2.4399, 1.859332, -0.3800701, 1, 0.05882353, 0, 1,
-2.390372, -0.221378, -2.72067, 1, 0.06666667, 0, 1,
-2.386602, 2.033386, -1.159445, 1, 0.07058824, 0, 1,
-2.364467, 0.5688195, -3.219127, 1, 0.07843138, 0, 1,
-2.348832, 1.059752, -1.574655, 1, 0.08235294, 0, 1,
-2.293718, -0.1801669, -0.7822462, 1, 0.09019608, 0, 1,
-2.260119, -0.01898115, -1.963093, 1, 0.09411765, 0, 1,
-2.240568, 0.9867259, -0.9445888, 1, 0.1019608, 0, 1,
-2.214873, -0.1351266, -1.500831, 1, 0.1098039, 0, 1,
-2.200935, 1.32696, 0.5351825, 1, 0.1137255, 0, 1,
-2.200673, 0.3375607, -1.497283, 1, 0.1215686, 0, 1,
-2.193789, -0.2963523, -0.9310898, 1, 0.1254902, 0, 1,
-2.168515, 0.9209385, -0.8084828, 1, 0.1333333, 0, 1,
-2.163028, 0.6483808, -1.20831, 1, 0.1372549, 0, 1,
-2.146312, -0.01735162, -2.121673, 1, 0.145098, 0, 1,
-2.110242, -1.494376, -1.991911, 1, 0.1490196, 0, 1,
-2.101891, -0.9063731, -1.133245, 1, 0.1568628, 0, 1,
-2.092551, -0.1058483, -3.571658, 1, 0.1607843, 0, 1,
-2.092216, 0.7777905, -0.8667567, 1, 0.1686275, 0, 1,
-2.089405, 0.2891292, -1.721231, 1, 0.172549, 0, 1,
-2.072033, -0.08099697, -2.586173, 1, 0.1803922, 0, 1,
-2.050962, 2.261542, -1.260336, 1, 0.1843137, 0, 1,
-2.024365, -0.5900617, -1.067658, 1, 0.1921569, 0, 1,
-2.017792, -1.226083, -1.797357, 1, 0.1960784, 0, 1,
-2.007053, 1.92951, 0.3214394, 1, 0.2039216, 0, 1,
-2.006875, 0.8266237, 0.06248575, 1, 0.2117647, 0, 1,
-2.002702, -1.746666, -2.332819, 1, 0.2156863, 0, 1,
-1.939854, 0.4569609, 0.26107, 1, 0.2235294, 0, 1,
-1.931235, 1.065996, -2.296621, 1, 0.227451, 0, 1,
-1.91893, 0.5351889, -0.4982594, 1, 0.2352941, 0, 1,
-1.910408, -0.6170115, -0.5683066, 1, 0.2392157, 0, 1,
-1.904623, 0.2038686, -2.303091, 1, 0.2470588, 0, 1,
-1.893862, -0.09511301, -3.32346, 1, 0.2509804, 0, 1,
-1.860266, 2.60069, -1.447201, 1, 0.2588235, 0, 1,
-1.838324, 0.6893524, -3.060992, 1, 0.2627451, 0, 1,
-1.833339, 0.02568576, -0.5687247, 1, 0.2705882, 0, 1,
-1.831108, -0.1707268, -1.583395, 1, 0.2745098, 0, 1,
-1.822634, 0.585205, 0.6685091, 1, 0.282353, 0, 1,
-1.819239, -0.3018672, -1.574348, 1, 0.2862745, 0, 1,
-1.818507, 0.4019201, -2.495133, 1, 0.2941177, 0, 1,
-1.806363, -1.066152, -2.563084, 1, 0.3019608, 0, 1,
-1.768312, -0.124603, 0.2141011, 1, 0.3058824, 0, 1,
-1.751917, 1.184954, -1.518215, 1, 0.3137255, 0, 1,
-1.7479, -0.5215348, -1.19487, 1, 0.3176471, 0, 1,
-1.734592, 0.3379443, -0.8023415, 1, 0.3254902, 0, 1,
-1.732703, -0.5009156, -2.775219, 1, 0.3294118, 0, 1,
-1.72125, -0.840687, -2.602192, 1, 0.3372549, 0, 1,
-1.720814, 0.4770939, 0.7739423, 1, 0.3411765, 0, 1,
-1.718616, -0.7774358, -0.1135311, 1, 0.3490196, 0, 1,
-1.703837, 1.440001, -0.3995814, 1, 0.3529412, 0, 1,
-1.70103, 0.8032969, 0.04613559, 1, 0.3607843, 0, 1,
-1.692917, 2.027389, -0.7525547, 1, 0.3647059, 0, 1,
-1.692045, 0.2111453, -0.8019984, 1, 0.372549, 0, 1,
-1.690714, -1.520414, -2.499862, 1, 0.3764706, 0, 1,
-1.690436, 1.386333, -1.614671, 1, 0.3843137, 0, 1,
-1.673832, 1.308764, -0.9687574, 1, 0.3882353, 0, 1,
-1.645289, -1.03909, -3.067424, 1, 0.3960784, 0, 1,
-1.642205, -0.1043905, -1.034231, 1, 0.4039216, 0, 1,
-1.627427, -0.183531, -1.772733, 1, 0.4078431, 0, 1,
-1.613553, 0.1140808, -3.237525, 1, 0.4156863, 0, 1,
-1.613225, 1.064523, -2.17007, 1, 0.4196078, 0, 1,
-1.607133, 2.035247, -2.345356, 1, 0.427451, 0, 1,
-1.604726, -1.890688, -1.888795, 1, 0.4313726, 0, 1,
-1.580418, -0.2414516, -1.559838, 1, 0.4392157, 0, 1,
-1.576637, 0.9947463, -0.8570421, 1, 0.4431373, 0, 1,
-1.573773, 1.635019, -0.7294509, 1, 0.4509804, 0, 1,
-1.569875, 0.5944973, -3.112332, 1, 0.454902, 0, 1,
-1.567357, 0.1869396, -1.605416, 1, 0.4627451, 0, 1,
-1.562852, -0.3789329, -1.663573, 1, 0.4666667, 0, 1,
-1.562773, 2.757715, -2.132427, 1, 0.4745098, 0, 1,
-1.554217, 0.6053532, -1.945674, 1, 0.4784314, 0, 1,
-1.541413, 0.903643, -0.3078767, 1, 0.4862745, 0, 1,
-1.534234, -0.1228768, -2.34845, 1, 0.4901961, 0, 1,
-1.533493, 0.04989168, -1.545495, 1, 0.4980392, 0, 1,
-1.521961, 0.3200569, -0.6931087, 1, 0.5058824, 0, 1,
-1.509129, -0.8292034, 0.2910035, 1, 0.509804, 0, 1,
-1.507276, -0.0383019, -1.409676, 1, 0.5176471, 0, 1,
-1.505351, -1.456138, -1.669637, 1, 0.5215687, 0, 1,
-1.496356, 1.868719, -0.4636458, 1, 0.5294118, 0, 1,
-1.489835, 0.7688319, -1.05275, 1, 0.5333334, 0, 1,
-1.470522, 0.3091151, -1.853675, 1, 0.5411765, 0, 1,
-1.465847, -0.9104756, -1.966104, 1, 0.5450981, 0, 1,
-1.455884, 0.5326995, 0.5323695, 1, 0.5529412, 0, 1,
-1.41617, -1.402771, -3.687812, 1, 0.5568628, 0, 1,
-1.4127, -1.417172, -2.422912, 1, 0.5647059, 0, 1,
-1.411326, 1.31231, -0.4190274, 1, 0.5686275, 0, 1,
-1.409747, -0.02596666, -1.174034, 1, 0.5764706, 0, 1,
-1.399981, 1.425944, -1.964021, 1, 0.5803922, 0, 1,
-1.394712, -0.4891663, -2.565729, 1, 0.5882353, 0, 1,
-1.392901, -0.2588189, -2.505733, 1, 0.5921569, 0, 1,
-1.370691, 0.6798512, 0.8269453, 1, 0.6, 0, 1,
-1.341639, 0.161202, -1.61077, 1, 0.6078432, 0, 1,
-1.336643, 0.7331578, 0.7608857, 1, 0.6117647, 0, 1,
-1.333997, 0.1549854, -1.243402, 1, 0.6196079, 0, 1,
-1.33353, 0.1140413, -2.025077, 1, 0.6235294, 0, 1,
-1.332637, 0.5844423, -1.774926, 1, 0.6313726, 0, 1,
-1.331485, -0.3308076, -2.689176, 1, 0.6352941, 0, 1,
-1.330826, -0.3339202, -1.711354, 1, 0.6431373, 0, 1,
-1.327828, 0.2305184, -1.348773, 1, 0.6470588, 0, 1,
-1.310805, 0.5728868, 0.4980721, 1, 0.654902, 0, 1,
-1.300342, 0.5033845, -0.1911062, 1, 0.6588235, 0, 1,
-1.294677, 1.219993, -0.414393, 1, 0.6666667, 0, 1,
-1.293155, -0.9148567, -2.381368, 1, 0.6705883, 0, 1,
-1.290447, 0.9125201, -1.170561, 1, 0.6784314, 0, 1,
-1.285265, 0.5707681, -1.183437, 1, 0.682353, 0, 1,
-1.280011, 0.9160855, -1.103766, 1, 0.6901961, 0, 1,
-1.266704, -0.582666, -3.274736, 1, 0.6941177, 0, 1,
-1.253503, 2.862916, -0.8723425, 1, 0.7019608, 0, 1,
-1.251975, 0.9857285, -1.912235, 1, 0.7098039, 0, 1,
-1.242692, 0.443379, -0.002504952, 1, 0.7137255, 0, 1,
-1.241836, 0.4389395, -1.375826, 1, 0.7215686, 0, 1,
-1.236376, -2.631865, -0.2521903, 1, 0.7254902, 0, 1,
-1.235774, -0.6317232, -0.5805355, 1, 0.7333333, 0, 1,
-1.235103, -0.7446465, -0.5699702, 1, 0.7372549, 0, 1,
-1.220721, 1.521457, 0.7003278, 1, 0.7450981, 0, 1,
-1.216287, -0.4003525, -2.569485, 1, 0.7490196, 0, 1,
-1.206849, 0.2627368, -1.964687, 1, 0.7568628, 0, 1,
-1.198811, 1.518985, -1.226256, 1, 0.7607843, 0, 1,
-1.19556, -2.207044, -3.908908, 1, 0.7686275, 0, 1,
-1.193142, -0.1437608, -2.297469, 1, 0.772549, 0, 1,
-1.183628, 1.57239, 1.060109, 1, 0.7803922, 0, 1,
-1.17762, 0.2273712, -2.14248, 1, 0.7843137, 0, 1,
-1.17212, -0.6969375, -0.6278008, 1, 0.7921569, 0, 1,
-1.171952, -0.04948342, -0.7382966, 1, 0.7960784, 0, 1,
-1.171767, -0.4554153, -1.946235, 1, 0.8039216, 0, 1,
-1.167346, 0.265433, -1.979439, 1, 0.8117647, 0, 1,
-1.165364, -0.1711915, 0.02880189, 1, 0.8156863, 0, 1,
-1.163827, -1.620739, -1.40511, 1, 0.8235294, 0, 1,
-1.159766, 0.8371217, -0.6670284, 1, 0.827451, 0, 1,
-1.145234, -1.033816, -2.011689, 1, 0.8352941, 0, 1,
-1.141485, 0.4510158, -1.554354, 1, 0.8392157, 0, 1,
-1.137563, -0.7188849, -1.276176, 1, 0.8470588, 0, 1,
-1.133795, -0.1600763, -2.790531, 1, 0.8509804, 0, 1,
-1.130263, 0.6976601, -1.628961, 1, 0.8588235, 0, 1,
-1.127541, 0.2239531, -0.9197795, 1, 0.8627451, 0, 1,
-1.12343, -0.2572155, -1.546498, 1, 0.8705882, 0, 1,
-1.121946, -1.446093, -2.993504, 1, 0.8745098, 0, 1,
-1.120792, -0.6287326, 0.04198893, 1, 0.8823529, 0, 1,
-1.118728, 2.372227, -0.03041796, 1, 0.8862745, 0, 1,
-1.115939, 0.004603902, -1.755091, 1, 0.8941177, 0, 1,
-1.11104, -0.1850929, -2.320776, 1, 0.8980392, 0, 1,
-1.108931, 0.02992706, 1.005126, 1, 0.9058824, 0, 1,
-1.104522, 1.50568, -1.433349, 1, 0.9137255, 0, 1,
-1.103144, 2.013392, -0.5406277, 1, 0.9176471, 0, 1,
-1.09888, 0.8615091, -1.48128, 1, 0.9254902, 0, 1,
-1.096975, 0.1245502, 0.07815111, 1, 0.9294118, 0, 1,
-1.095347, 0.3364292, -1.14603, 1, 0.9372549, 0, 1,
-1.094439, -0.8739293, -2.795456, 1, 0.9411765, 0, 1,
-1.094346, 0.1504289, -3.773367, 1, 0.9490196, 0, 1,
-1.088781, 2.199189, 0.6295353, 1, 0.9529412, 0, 1,
-1.085021, -1.092972, -2.631989, 1, 0.9607843, 0, 1,
-1.082947, 0.4519017, -2.480128, 1, 0.9647059, 0, 1,
-1.082159, -0.243083, -0.8911899, 1, 0.972549, 0, 1,
-1.066249, 0.7347713, -0.8343608, 1, 0.9764706, 0, 1,
-1.063774, 0.8599813, -0.5564478, 1, 0.9843137, 0, 1,
-1.059577, -0.1371449, -1.444776, 1, 0.9882353, 0, 1,
-1.058307, 0.3432911, -2.281013, 1, 0.9960784, 0, 1,
-1.053672, -0.04176565, -0.1202335, 0.9960784, 1, 0, 1,
-1.051973, -1.283473, -4.899337, 0.9921569, 1, 0, 1,
-1.050606, 0.7603823, -1.986759, 0.9843137, 1, 0, 1,
-1.035262, -0.3617823, -0.09213606, 0.9803922, 1, 0, 1,
-1.033764, 0.4921505, -0.233213, 0.972549, 1, 0, 1,
-1.031956, 0.3815191, -0.5061933, 0.9686275, 1, 0, 1,
-1.026999, 0.9868092, 0.5993237, 0.9607843, 1, 0, 1,
-1.022814, 1.186641, -1.001394, 0.9568627, 1, 0, 1,
-1.000044, -0.09083934, -2.002419, 0.9490196, 1, 0, 1,
-0.9959791, -0.4573555, -2.727928, 0.945098, 1, 0, 1,
-0.9939868, -0.06511141, -1.678968, 0.9372549, 1, 0, 1,
-0.9857137, 0.9836524, 1.281473, 0.9333333, 1, 0, 1,
-0.9853988, 0.6790906, -1.103549, 0.9254902, 1, 0, 1,
-0.9713025, 0.827858, -1.631427, 0.9215686, 1, 0, 1,
-0.9694561, -0.1194197, -2.502887, 0.9137255, 1, 0, 1,
-0.965064, 1.376179, -2.620394, 0.9098039, 1, 0, 1,
-0.964623, 0.3210147, -1.542828, 0.9019608, 1, 0, 1,
-0.9641123, -1.021497, -2.158959, 0.8941177, 1, 0, 1,
-0.9611339, -0.05748849, 0.1761107, 0.8901961, 1, 0, 1,
-0.9564689, 1.034318, -0.765346, 0.8823529, 1, 0, 1,
-0.9558093, -0.5977034, -2.845114, 0.8784314, 1, 0, 1,
-0.9541787, -0.3210871, -2.348285, 0.8705882, 1, 0, 1,
-0.9514897, -1.533224, -2.54685, 0.8666667, 1, 0, 1,
-0.9455441, 0.2218946, -1.536757, 0.8588235, 1, 0, 1,
-0.9449716, 2.472122, -1.182036, 0.854902, 1, 0, 1,
-0.9407328, -1.518983, -2.364149, 0.8470588, 1, 0, 1,
-0.9376293, -0.7519827, -2.708371, 0.8431373, 1, 0, 1,
-0.9366157, 1.244582, -2.344192, 0.8352941, 1, 0, 1,
-0.9365401, -0.2035429, -3.054842, 0.8313726, 1, 0, 1,
-0.9337965, 0.2457141, -2.992171, 0.8235294, 1, 0, 1,
-0.9331418, 1.098986, -2.0262, 0.8196079, 1, 0, 1,
-0.9259217, 0.1992522, -1.225607, 0.8117647, 1, 0, 1,
-0.9061209, -0.6165606, -2.179548, 0.8078431, 1, 0, 1,
-0.9005409, -0.1089899, -1.06098, 0.8, 1, 0, 1,
-0.8999088, -0.4738882, -0.7900311, 0.7921569, 1, 0, 1,
-0.8984739, 0.2713387, 1.941804, 0.7882353, 1, 0, 1,
-0.8976113, -0.1609079, -2.520576, 0.7803922, 1, 0, 1,
-0.8965998, -1.008009, -3.910481, 0.7764706, 1, 0, 1,
-0.8851262, -0.9492527, -1.03913, 0.7686275, 1, 0, 1,
-0.8810555, -0.6610797, -0.7090183, 0.7647059, 1, 0, 1,
-0.8739755, 1.307051, -1.183082, 0.7568628, 1, 0, 1,
-0.8663566, -0.1840457, -1.610806, 0.7529412, 1, 0, 1,
-0.8651109, 1.698494, -0.8677215, 0.7450981, 1, 0, 1,
-0.8645136, 0.02402052, -0.3546055, 0.7411765, 1, 0, 1,
-0.8626257, -0.3410088, -1.470685, 0.7333333, 1, 0, 1,
-0.8603449, -1.25981, -2.288807, 0.7294118, 1, 0, 1,
-0.8467141, 0.1530166, -0.5523087, 0.7215686, 1, 0, 1,
-0.8383796, -0.5770773, -1.55962, 0.7176471, 1, 0, 1,
-0.8382612, -0.9415314, -2.414078, 0.7098039, 1, 0, 1,
-0.8211985, 0.180731, -1.903489, 0.7058824, 1, 0, 1,
-0.8169026, -0.8647068, -2.502417, 0.6980392, 1, 0, 1,
-0.8161313, 0.162528, -3.377908, 0.6901961, 1, 0, 1,
-0.8105407, 0.5561247, 1.165298, 0.6862745, 1, 0, 1,
-0.7996109, 1.270353, -1.225171, 0.6784314, 1, 0, 1,
-0.7986285, 1.559739, -1.202573, 0.6745098, 1, 0, 1,
-0.7929556, 0.04690951, -0.3139178, 0.6666667, 1, 0, 1,
-0.7922195, 0.03848829, -2.369066, 0.6627451, 1, 0, 1,
-0.7846479, 1.345226, -0.9474486, 0.654902, 1, 0, 1,
-0.7753906, -0.741735, -3.040442, 0.6509804, 1, 0, 1,
-0.7744317, 0.09066209, -2.44556, 0.6431373, 1, 0, 1,
-0.765328, 0.476842, -0.04538236, 0.6392157, 1, 0, 1,
-0.7605671, -1.374601, -1.795343, 0.6313726, 1, 0, 1,
-0.7583485, -1.225673, -2.718496, 0.627451, 1, 0, 1,
-0.7561852, 0.4549046, -3.198057, 0.6196079, 1, 0, 1,
-0.7467768, 1.113924, -1.002057, 0.6156863, 1, 0, 1,
-0.7409996, -0.09162124, -2.290185, 0.6078432, 1, 0, 1,
-0.7400349, -0.805249, -3.825618, 0.6039216, 1, 0, 1,
-0.7370489, -0.2932622, -0.6397756, 0.5960785, 1, 0, 1,
-0.7368734, -0.2917793, -1.997077, 0.5882353, 1, 0, 1,
-0.7353838, 0.2193953, -2.330628, 0.5843138, 1, 0, 1,
-0.7329661, -1.045559, -1.239959, 0.5764706, 1, 0, 1,
-0.7326536, 0.07007947, -1.482806, 0.572549, 1, 0, 1,
-0.7320886, -0.991552, -4.098418, 0.5647059, 1, 0, 1,
-0.7287478, 0.4459389, -1.478767, 0.5607843, 1, 0, 1,
-0.7245511, 1.340065, -1.283066, 0.5529412, 1, 0, 1,
-0.7232988, -2.231897, -2.86984, 0.5490196, 1, 0, 1,
-0.7205563, -1.199843, -3.073968, 0.5411765, 1, 0, 1,
-0.7190653, -0.5107143, -1.380572, 0.5372549, 1, 0, 1,
-0.7183822, 0.9299262, -0.912505, 0.5294118, 1, 0, 1,
-0.7176559, -0.57134, -3.211186, 0.5254902, 1, 0, 1,
-0.7110628, 0.7746202, 1.230662, 0.5176471, 1, 0, 1,
-0.7097745, -0.4626555, -2.646544, 0.5137255, 1, 0, 1,
-0.7060831, 0.4141286, -0.3402817, 0.5058824, 1, 0, 1,
-0.7030352, -0.961364, -1.728166, 0.5019608, 1, 0, 1,
-0.6986681, -0.6976075, -0.1731303, 0.4941176, 1, 0, 1,
-0.6953445, 2.182614, -0.3392201, 0.4862745, 1, 0, 1,
-0.6910347, 2.155457, -2.554984, 0.4823529, 1, 0, 1,
-0.6846192, 0.7412362, 0.676492, 0.4745098, 1, 0, 1,
-0.6834334, 0.481164, -0.01910987, 0.4705882, 1, 0, 1,
-0.6825629, 0.03742572, -1.698855, 0.4627451, 1, 0, 1,
-0.6780174, 1.218865, 0.5741656, 0.4588235, 1, 0, 1,
-0.6743283, 1.748586, 0.1030821, 0.4509804, 1, 0, 1,
-0.6709787, 0.83867, -1.559624, 0.4470588, 1, 0, 1,
-0.6703205, 0.2922806, 0.06562613, 0.4392157, 1, 0, 1,
-0.6697098, -0.06517207, -2.831127, 0.4352941, 1, 0, 1,
-0.6662486, -0.8989019, -1.834571, 0.427451, 1, 0, 1,
-0.6640674, -0.8182582, -1.028789, 0.4235294, 1, 0, 1,
-0.6614293, 1.451445, -0.6207898, 0.4156863, 1, 0, 1,
-0.6539173, -1.0832, -1.725709, 0.4117647, 1, 0, 1,
-0.6535154, 1.362653, -0.4552699, 0.4039216, 1, 0, 1,
-0.6530817, -0.4185333, -2.558641, 0.3960784, 1, 0, 1,
-0.652323, 0.8009619, 1.787275, 0.3921569, 1, 0, 1,
-0.6474726, -1.036634, -3.637361, 0.3843137, 1, 0, 1,
-0.6465666, 0.5847259, -1.912382, 0.3803922, 1, 0, 1,
-0.644951, -0.03259204, -2.803297, 0.372549, 1, 0, 1,
-0.6449437, 0.4241869, -2.355896, 0.3686275, 1, 0, 1,
-0.6415271, 0.05858113, -2.488897, 0.3607843, 1, 0, 1,
-0.6373996, -0.9307696, -2.958431, 0.3568628, 1, 0, 1,
-0.6372198, -0.6006346, -1.297384, 0.3490196, 1, 0, 1,
-0.6347051, -0.3080885, -1.587138, 0.345098, 1, 0, 1,
-0.5988597, -0.04153088, -1.731454, 0.3372549, 1, 0, 1,
-0.5919744, -0.3523122, -2.734652, 0.3333333, 1, 0, 1,
-0.5911574, -0.8183518, -0.5932887, 0.3254902, 1, 0, 1,
-0.5885691, -0.1014666, -1.075106, 0.3215686, 1, 0, 1,
-0.5802578, -0.4697751, -0.8231667, 0.3137255, 1, 0, 1,
-0.5801983, -1.62582, -2.189746, 0.3098039, 1, 0, 1,
-0.5746492, -0.6762471, -3.740903, 0.3019608, 1, 0, 1,
-0.5720718, 0.1627874, -0.5996801, 0.2941177, 1, 0, 1,
-0.5700517, 0.2068347, -2.589563, 0.2901961, 1, 0, 1,
-0.5684421, 0.5807646, -0.9769065, 0.282353, 1, 0, 1,
-0.5658449, -0.3069852, -2.924054, 0.2784314, 1, 0, 1,
-0.5545641, -1.49673, -3.546733, 0.2705882, 1, 0, 1,
-0.5451403, 0.8545596, -1.396693, 0.2666667, 1, 0, 1,
-0.5432355, 1.342028, -0.7736157, 0.2588235, 1, 0, 1,
-0.5335755, 1.439428, -0.1143732, 0.254902, 1, 0, 1,
-0.5319294, -2.788999, -1.501464, 0.2470588, 1, 0, 1,
-0.5278829, -1.129576, -1.387807, 0.2431373, 1, 0, 1,
-0.527427, 0.2982313, -1.456074, 0.2352941, 1, 0, 1,
-0.526584, 0.4416196, -1.106545, 0.2313726, 1, 0, 1,
-0.5227023, 1.017034, 0.3772071, 0.2235294, 1, 0, 1,
-0.5212547, -0.4274273, -1.788764, 0.2196078, 1, 0, 1,
-0.5195744, -0.5355741, -1.698374, 0.2117647, 1, 0, 1,
-0.5174574, -1.405321, -2.890123, 0.2078431, 1, 0, 1,
-0.5162882, -0.356449, -2.730925, 0.2, 1, 0, 1,
-0.5080266, 1.118009, -0.3274035, 0.1921569, 1, 0, 1,
-0.5035649, 0.2743933, 0.3538261, 0.1882353, 1, 0, 1,
-0.5024099, -0.9142628, -1.889912, 0.1803922, 1, 0, 1,
-0.5015678, -0.3408665, -0.712349, 0.1764706, 1, 0, 1,
-0.5002409, 1.189856, -0.2124578, 0.1686275, 1, 0, 1,
-0.4993079, -1.185656, -4.753102, 0.1647059, 1, 0, 1,
-0.4978181, -0.3130523, -2.336412, 0.1568628, 1, 0, 1,
-0.4977276, 0.897924, 0.6938241, 0.1529412, 1, 0, 1,
-0.4894383, -0.1883936, -2.589477, 0.145098, 1, 0, 1,
-0.4883218, 0.0170203, -0.6093233, 0.1411765, 1, 0, 1,
-0.4850862, -1.838072, -3.249209, 0.1333333, 1, 0, 1,
-0.4810076, 1.71407, 0.02761339, 0.1294118, 1, 0, 1,
-0.4786882, 0.9323089, -1.953144, 0.1215686, 1, 0, 1,
-0.4786802, 0.1617129, -1.441812, 0.1176471, 1, 0, 1,
-0.471642, -1.191197, -3.664305, 0.1098039, 1, 0, 1,
-0.471165, -0.887308, -4.553958, 0.1058824, 1, 0, 1,
-0.4701461, 0.9355687, -1.260825, 0.09803922, 1, 0, 1,
-0.4681709, -0.2261872, -0.1170036, 0.09019608, 1, 0, 1,
-0.4626792, 0.9980118, 0.1878253, 0.08627451, 1, 0, 1,
-0.4585474, 1.771919, -0.07407417, 0.07843138, 1, 0, 1,
-0.4573898, -0.6843512, -1.136412, 0.07450981, 1, 0, 1,
-0.4570205, 0.53833, 0.7653332, 0.06666667, 1, 0, 1,
-0.4556092, -0.421207, -2.112169, 0.0627451, 1, 0, 1,
-0.4543917, -0.6763892, -1.259575, 0.05490196, 1, 0, 1,
-0.4543715, 0.3660581, 0.9410184, 0.05098039, 1, 0, 1,
-0.4490053, -0.7595562, -2.747349, 0.04313726, 1, 0, 1,
-0.4486487, 0.04236866, -1.465772, 0.03921569, 1, 0, 1,
-0.4422571, -2.016906, -3.580659, 0.03137255, 1, 0, 1,
-0.4403402, 0.06419176, -0.611967, 0.02745098, 1, 0, 1,
-0.4378432, -1.465182, -3.151929, 0.01960784, 1, 0, 1,
-0.4357863, -0.2693403, -2.564665, 0.01568628, 1, 0, 1,
-0.4355421, 1.595024, -0.3909443, 0.007843138, 1, 0, 1,
-0.4354447, 0.3658167, -0.4481902, 0.003921569, 1, 0, 1,
-0.4287334, -0.140828, -2.160352, 0, 1, 0.003921569, 1,
-0.4231201, 0.8809845, 0.4087064, 0, 1, 0.01176471, 1,
-0.4227688, 0.2329939, -1.14392, 0, 1, 0.01568628, 1,
-0.4219344, 0.7989087, -1.045952, 0, 1, 0.02352941, 1,
-0.4157282, 0.2540152, 0.1496894, 0, 1, 0.02745098, 1,
-0.4140914, -0.9855381, -4.96224, 0, 1, 0.03529412, 1,
-0.4076699, 0.3691193, -0.6386314, 0, 1, 0.03921569, 1,
-0.4076283, 1.108595, -0.1798103, 0, 1, 0.04705882, 1,
-0.4013428, -0.5178287, -3.356749, 0, 1, 0.05098039, 1,
-0.3996513, 0.9397257, -1.253277, 0, 1, 0.05882353, 1,
-0.3986861, -0.9911268, -1.191678, 0, 1, 0.0627451, 1,
-0.3957668, 1.694685, 1.610936, 0, 1, 0.07058824, 1,
-0.3901066, -1.193146, -4.252485, 0, 1, 0.07450981, 1,
-0.3892861, 0.5612519, 0.4413992, 0, 1, 0.08235294, 1,
-0.3859182, -1.332555, -5.280742, 0, 1, 0.08627451, 1,
-0.3829511, 0.621728, -0.775962, 0, 1, 0.09411765, 1,
-0.3792538, -1.184922, -3.098554, 0, 1, 0.1019608, 1,
-0.3776791, -0.4348775, -3.864851, 0, 1, 0.1058824, 1,
-0.376835, 0.625863, 0.01473524, 0, 1, 0.1137255, 1,
-0.3725022, 0.7970226, -0.3352567, 0, 1, 0.1176471, 1,
-0.3713044, 0.5367347, 0.1297961, 0, 1, 0.1254902, 1,
-0.3671106, -0.6817504, -2.772755, 0, 1, 0.1294118, 1,
-0.3576551, 0.1462106, -2.72512, 0, 1, 0.1372549, 1,
-0.3562483, 0.8034307, 0.1550861, 0, 1, 0.1411765, 1,
-0.3562465, -0.04211969, -2.566358, 0, 1, 0.1490196, 1,
-0.3541778, 0.6938486, -1.55977, 0, 1, 0.1529412, 1,
-0.3508646, -0.2120596, -1.388814, 0, 1, 0.1607843, 1,
-0.3502084, 1.346004, 0.7060071, 0, 1, 0.1647059, 1,
-0.3417623, 0.4403971, -0.388817, 0, 1, 0.172549, 1,
-0.341005, -1.722379, -2.019363, 0, 1, 0.1764706, 1,
-0.3385101, 2.424885, -0.9716244, 0, 1, 0.1843137, 1,
-0.336649, 0.2793981, -1.173817, 0, 1, 0.1882353, 1,
-0.3365197, -0.9736224, -2.607699, 0, 1, 0.1960784, 1,
-0.3340904, -1.150121, -2.092541, 0, 1, 0.2039216, 1,
-0.3337642, -0.7960154, -3.541517, 0, 1, 0.2078431, 1,
-0.3256117, 1.642291, -1.125649, 0, 1, 0.2156863, 1,
-0.3251741, -0.6475022, -2.720276, 0, 1, 0.2196078, 1,
-0.3250755, 0.3188375, -0.4586221, 0, 1, 0.227451, 1,
-0.3238108, -0.1147447, -1.316854, 0, 1, 0.2313726, 1,
-0.3227094, 0.1639092, 0.02552112, 0, 1, 0.2392157, 1,
-0.3226225, -0.6322744, -1.452847, 0, 1, 0.2431373, 1,
-0.3209146, -1.6258, -3.317333, 0, 1, 0.2509804, 1,
-0.3161269, 0.06818467, -0.6406143, 0, 1, 0.254902, 1,
-0.314174, 0.2119736, -2.316627, 0, 1, 0.2627451, 1,
-0.3115453, 1.081378, 0.1600459, 0, 1, 0.2666667, 1,
-0.3065192, 0.419163, -3.144382, 0, 1, 0.2745098, 1,
-0.3019091, -0.1095728, -1.403255, 0, 1, 0.2784314, 1,
-0.3009919, -0.08566121, -1.19172, 0, 1, 0.2862745, 1,
-0.2941649, -0.007285506, -3.362993, 0, 1, 0.2901961, 1,
-0.2906712, 0.8516904, 0.9446096, 0, 1, 0.2980392, 1,
-0.2877126, 2.477246, -1.397476, 0, 1, 0.3058824, 1,
-0.2873847, 0.7383646, -1.139065, 0, 1, 0.3098039, 1,
-0.2856562, 0.1094125, -1.496279, 0, 1, 0.3176471, 1,
-0.2829857, -0.2347392, -0.8840068, 0, 1, 0.3215686, 1,
-0.2799942, 0.6202313, -0.6857755, 0, 1, 0.3294118, 1,
-0.2787814, -0.249875, -0.9138314, 0, 1, 0.3333333, 1,
-0.2785024, 0.1150411, -1.732325, 0, 1, 0.3411765, 1,
-0.2774267, 0.3498199, -2.223554, 0, 1, 0.345098, 1,
-0.2694287, 1.745402, -0.02901247, 0, 1, 0.3529412, 1,
-0.2659678, 1.779082, 0.0333297, 0, 1, 0.3568628, 1,
-0.2653437, -0.5607885, -1.973558, 0, 1, 0.3647059, 1,
-0.2595524, -0.5635505, -5.143688, 0, 1, 0.3686275, 1,
-0.2568569, -0.338563, -3.847163, 0, 1, 0.3764706, 1,
-0.2562778, 1.725785, -0.4098632, 0, 1, 0.3803922, 1,
-0.2541541, 0.4368845, 1.365998, 0, 1, 0.3882353, 1,
-0.2478635, -0.9035243, -2.643129, 0, 1, 0.3921569, 1,
-0.2478384, 0.1335456, -2.743161, 0, 1, 0.4, 1,
-0.2462377, -1.171096, -0.7948429, 0, 1, 0.4078431, 1,
-0.2449004, -1.405204, -5.178409, 0, 1, 0.4117647, 1,
-0.2437226, -0.9588346, -1.902324, 0, 1, 0.4196078, 1,
-0.2432498, 0.09508394, -1.61879, 0, 1, 0.4235294, 1,
-0.2417686, 1.916237, -0.3366137, 0, 1, 0.4313726, 1,
-0.2389926, -0.7541179, -1.759654, 0, 1, 0.4352941, 1,
-0.2367992, -1.042439, -3.465125, 0, 1, 0.4431373, 1,
-0.2358966, -0.2619223, -2.370287, 0, 1, 0.4470588, 1,
-0.2346593, -0.9618129, -2.522074, 0, 1, 0.454902, 1,
-0.231303, -0.7262982, -4.529853, 0, 1, 0.4588235, 1,
-0.2312384, -0.9544242, -2.797284, 0, 1, 0.4666667, 1,
-0.2304009, 0.7755514, 2.379617, 0, 1, 0.4705882, 1,
-0.229279, 0.05153775, 0.6430097, 0, 1, 0.4784314, 1,
-0.2234793, 1.434381, -0.6513487, 0, 1, 0.4823529, 1,
-0.2224888, -0.06368019, -1.960599, 0, 1, 0.4901961, 1,
-0.2203923, -0.00383262, -2.288037, 0, 1, 0.4941176, 1,
-0.2190283, 0.3138412, -1.953487, 0, 1, 0.5019608, 1,
-0.2188405, -0.2584792, -1.940967, 0, 1, 0.509804, 1,
-0.218642, -0.1748554, -4.112276, 0, 1, 0.5137255, 1,
-0.2183556, -1.006958, -2.930915, 0, 1, 0.5215687, 1,
-0.2179425, -0.3046265, -4.432656, 0, 1, 0.5254902, 1,
-0.2079871, -0.5880094, -2.68945, 0, 1, 0.5333334, 1,
-0.2068343, -0.7682348, -5.214162, 0, 1, 0.5372549, 1,
-0.2050767, -0.1558311, -3.007757, 0, 1, 0.5450981, 1,
-0.2043992, 0.8940517, -1.581322, 0, 1, 0.5490196, 1,
-0.2028754, -0.9584875, -3.293808, 0, 1, 0.5568628, 1,
-0.1982228, 0.9513543, 0.5416201, 0, 1, 0.5607843, 1,
-0.1980311, -2.058867, -3.372801, 0, 1, 0.5686275, 1,
-0.1964454, 0.5397786, -0.3072194, 0, 1, 0.572549, 1,
-0.1956511, 0.5502808, -0.6249759, 0, 1, 0.5803922, 1,
-0.1948105, -0.4096669, -1.334869, 0, 1, 0.5843138, 1,
-0.1944623, 1.189736, -0.08203633, 0, 1, 0.5921569, 1,
-0.194289, 1.030359, 0.6138154, 0, 1, 0.5960785, 1,
-0.1936191, 0.3436365, -0.6527295, 0, 1, 0.6039216, 1,
-0.1874833, -0.03872864, -2.123479, 0, 1, 0.6117647, 1,
-0.1839782, -0.754819, -2.74101, 0, 1, 0.6156863, 1,
-0.1795367, 0.03521994, -1.269965, 0, 1, 0.6235294, 1,
-0.1790172, -2.268321, -2.329637, 0, 1, 0.627451, 1,
-0.1750826, -0.05499668, -1.855953, 0, 1, 0.6352941, 1,
-0.174365, -1.550479, -3.163715, 0, 1, 0.6392157, 1,
-0.1723571, -1.451595, -3.344498, 0, 1, 0.6470588, 1,
-0.1709253, 0.4190395, -1.182543, 0, 1, 0.6509804, 1,
-0.1684553, 0.1715684, -0.9790821, 0, 1, 0.6588235, 1,
-0.1652601, 1.022322, -1.575602, 0, 1, 0.6627451, 1,
-0.1631249, -0.7281665, -3.625712, 0, 1, 0.6705883, 1,
-0.1630053, 0.178017, -2.097952, 0, 1, 0.6745098, 1,
-0.1614213, -1.831439, -2.979536, 0, 1, 0.682353, 1,
-0.1605613, -0.304839, -1.742123, 0, 1, 0.6862745, 1,
-0.1568448, 0.5203507, -0.08996287, 0, 1, 0.6941177, 1,
-0.1556801, 1.082715, -0.2870077, 0, 1, 0.7019608, 1,
-0.1536149, 0.9870434, 0.2103545, 0, 1, 0.7058824, 1,
-0.1534657, -0.6226445, -4.068591, 0, 1, 0.7137255, 1,
-0.1457206, 0.1169249, 0.7956129, 0, 1, 0.7176471, 1,
-0.144435, -0.1397883, -1.855344, 0, 1, 0.7254902, 1,
-0.1301913, -0.8080456, -3.287224, 0, 1, 0.7294118, 1,
-0.1285429, 0.01760851, -1.968726, 0, 1, 0.7372549, 1,
-0.1259349, -0.2896679, -3.225262, 0, 1, 0.7411765, 1,
-0.1251817, -0.8927179, -0.6970365, 0, 1, 0.7490196, 1,
-0.1211355, -0.3669405, -3.055473, 0, 1, 0.7529412, 1,
-0.1157514, 1.32758, 0.3615243, 0, 1, 0.7607843, 1,
-0.1148588, 2.272222, -1.344676, 0, 1, 0.7647059, 1,
-0.1126328, -0.06305432, -3.346699, 0, 1, 0.772549, 1,
-0.1109215, -0.2186437, -3.890137, 0, 1, 0.7764706, 1,
-0.1048064, 1.735136, 1.054646, 0, 1, 0.7843137, 1,
-0.1047952, 0.2000448, -0.1811582, 0, 1, 0.7882353, 1,
-0.1034121, -0.4666997, -2.637848, 0, 1, 0.7960784, 1,
-0.09911087, 0.01317737, -0.5773163, 0, 1, 0.8039216, 1,
-0.09835461, -1.689663, -3.221711, 0, 1, 0.8078431, 1,
-0.09441464, 0.2628638, 1.402256, 0, 1, 0.8156863, 1,
-0.09367148, 0.02050219, -2.749057, 0, 1, 0.8196079, 1,
-0.09341753, 0.139552, -0.1542285, 0, 1, 0.827451, 1,
-0.0911255, 0.1109836, -2.383159, 0, 1, 0.8313726, 1,
-0.08849322, -0.5409313, -3.119237, 0, 1, 0.8392157, 1,
-0.08811408, -0.2381798, -2.347714, 0, 1, 0.8431373, 1,
-0.08649376, 0.7813038, -0.545423, 0, 1, 0.8509804, 1,
-0.08557925, -0.5452015, -3.777722, 0, 1, 0.854902, 1,
-0.08492183, 0.544118, 0.6282865, 0, 1, 0.8627451, 1,
-0.08013255, -1.638359, -4.428077, 0, 1, 0.8666667, 1,
-0.07988989, 0.968775, 0.08886191, 0, 1, 0.8745098, 1,
-0.07779894, -0.4602557, -1.140732, 0, 1, 0.8784314, 1,
-0.07557511, 1.348576, 0.9286867, 0, 1, 0.8862745, 1,
-0.07041758, -0.3595661, -1.974044, 0, 1, 0.8901961, 1,
-0.06973984, -0.5618095, -2.538317, 0, 1, 0.8980392, 1,
-0.06892489, 0.1101387, -2.026166, 0, 1, 0.9058824, 1,
-0.05896098, -0.680889, -2.593317, 0, 1, 0.9098039, 1,
-0.05505697, 1.149672, 0.3654136, 0, 1, 0.9176471, 1,
-0.04938806, 0.01401764, -0.7786814, 0, 1, 0.9215686, 1,
-0.04737217, -1.21481, -1.859625, 0, 1, 0.9294118, 1,
-0.04276069, 1.164245, -0.3641171, 0, 1, 0.9333333, 1,
-0.04246754, 0.790543, 0.03987696, 0, 1, 0.9411765, 1,
-0.04177001, 0.479384, -0.2145521, 0, 1, 0.945098, 1,
-0.04107023, 0.9013542, -0.9155248, 0, 1, 0.9529412, 1,
-0.04085219, 1.221692, 0.6777867, 0, 1, 0.9568627, 1,
-0.04063131, -0.01461083, -2.635293, 0, 1, 0.9647059, 1,
-0.04046842, 0.3489339, 0.9904954, 0, 1, 0.9686275, 1,
-0.03513254, 0.6519278, -0.02356585, 0, 1, 0.9764706, 1,
-0.03315232, -0.2964115, -5.110672, 0, 1, 0.9803922, 1,
-0.03303963, 0.2803076, 0.06276096, 0, 1, 0.9882353, 1,
-0.03136196, 1.028533, 0.09487274, 0, 1, 0.9921569, 1,
-0.0296981, 0.3793725, 1.451016, 0, 1, 1, 1,
-0.02800121, -1.094948, -5.350634, 0, 0.9921569, 1, 1,
-0.02775459, 0.176146, -0.1777898, 0, 0.9882353, 1, 1,
-0.02679892, 0.7932088, 0.8263052, 0, 0.9803922, 1, 1,
-0.0242415, -0.1038125, -2.506012, 0, 0.9764706, 1, 1,
-0.02087273, -0.5208726, -1.49334, 0, 0.9686275, 1, 1,
-0.01901957, -1.126004, -4.132151, 0, 0.9647059, 1, 1,
-0.01895727, -0.06083032, -3.541354, 0, 0.9568627, 1, 1,
-0.01817306, 0.007414087, 1.247324, 0, 0.9529412, 1, 1,
-0.01775552, 0.5036815, 0.5274174, 0, 0.945098, 1, 1,
-0.01676137, 0.4200681, 2.033923, 0, 0.9411765, 1, 1,
-0.01426881, 0.4087594, -1.55793, 0, 0.9333333, 1, 1,
-0.01206872, 1.039518, -0.1487588, 0, 0.9294118, 1, 1,
-0.01071949, -0.6529953, -3.210021, 0, 0.9215686, 1, 1,
-0.009893942, -0.500282, -3.435121, 0, 0.9176471, 1, 1,
-0.009223246, 0.03612903, 0.8061298, 0, 0.9098039, 1, 1,
-0.006846237, -0.7399611, -4.471241, 0, 0.9058824, 1, 1,
-0.004486174, -0.4687943, -4.027201, 0, 0.8980392, 1, 1,
0.002769143, 1.683476, 0.7388465, 0, 0.8901961, 1, 1,
0.003554781, -0.3411765, 3.317584, 0, 0.8862745, 1, 1,
0.006502754, -0.3992861, 3.293386, 0, 0.8784314, 1, 1,
0.006650725, -0.5062523, 5.012866, 0, 0.8745098, 1, 1,
0.008030781, 0.1340898, 0.5710312, 0, 0.8666667, 1, 1,
0.017852, 1.170953, 1.154356, 0, 0.8627451, 1, 1,
0.01892143, 0.06568544, 0.2315258, 0, 0.854902, 1, 1,
0.0224576, -0.8289148, 2.210186, 0, 0.8509804, 1, 1,
0.02379516, 1.482612, -0.4137897, 0, 0.8431373, 1, 1,
0.02489763, -1.630293, 4.120278, 0, 0.8392157, 1, 1,
0.03042187, -0.8756765, 4.12581, 0, 0.8313726, 1, 1,
0.03523638, -0.4627716, 4.264031, 0, 0.827451, 1, 1,
0.03845927, -0.03939423, 3.578655, 0, 0.8196079, 1, 1,
0.03914284, 0.3184035, -1.126965, 0, 0.8156863, 1, 1,
0.04508919, -0.2110337, 1.892675, 0, 0.8078431, 1, 1,
0.04568759, -1.200978, 0.8766437, 0, 0.8039216, 1, 1,
0.04819845, -0.3667531, 2.680861, 0, 0.7960784, 1, 1,
0.04899557, 0.07525244, -0.2059734, 0, 0.7882353, 1, 1,
0.04992636, -0.1829666, 1.571733, 0, 0.7843137, 1, 1,
0.05661156, -1.270434, 4.077249, 0, 0.7764706, 1, 1,
0.06376866, -0.4700244, 3.861104, 0, 0.772549, 1, 1,
0.06412661, -0.03590635, 1.192951, 0, 0.7647059, 1, 1,
0.06443125, 0.3508128, 0.06732228, 0, 0.7607843, 1, 1,
0.06514273, -0.2599684, 2.070298, 0, 0.7529412, 1, 1,
0.07004617, -1.132238, 3.183293, 0, 0.7490196, 1, 1,
0.08073725, 0.4547589, 0.1827047, 0, 0.7411765, 1, 1,
0.08272, -1.305058, 2.976613, 0, 0.7372549, 1, 1,
0.08394684, -0.922465, 4.552787, 0, 0.7294118, 1, 1,
0.08665313, 0.3378297, 0.04582851, 0, 0.7254902, 1, 1,
0.08866006, 1.660063, -0.9495476, 0, 0.7176471, 1, 1,
0.08971329, -1.537413, 4.101322, 0, 0.7137255, 1, 1,
0.0931589, 0.5669148, 0.03528326, 0, 0.7058824, 1, 1,
0.09477749, -1.068706, 3.265893, 0, 0.6980392, 1, 1,
0.1021299, 0.3855325, -0.3537615, 0, 0.6941177, 1, 1,
0.1066081, -0.5086414, 2.001566, 0, 0.6862745, 1, 1,
0.1088657, 0.9348986, 0.1748225, 0, 0.682353, 1, 1,
0.1124458, 0.2392915, -0.8209609, 0, 0.6745098, 1, 1,
0.1127881, 1.46267, 0.8477858, 0, 0.6705883, 1, 1,
0.1304242, 0.6170374, 0.6052175, 0, 0.6627451, 1, 1,
0.1414858, -0.5422502, 2.752563, 0, 0.6588235, 1, 1,
0.1441379, -0.3964848, 2.687349, 0, 0.6509804, 1, 1,
0.1507574, -0.2282335, 3.202219, 0, 0.6470588, 1, 1,
0.1534522, 0.7829848, 1.796094, 0, 0.6392157, 1, 1,
0.1559186, -1.729396, 2.11196, 0, 0.6352941, 1, 1,
0.1584036, -0.5624545, 1.755649, 0, 0.627451, 1, 1,
0.1596121, -1.526884, 3.509143, 0, 0.6235294, 1, 1,
0.1713945, -0.7266747, 1.898171, 0, 0.6156863, 1, 1,
0.1739927, -0.40108, 1.657193, 0, 0.6117647, 1, 1,
0.1803874, 0.9707175, 2.291177, 0, 0.6039216, 1, 1,
0.1814249, -0.5557006, 3.264501, 0, 0.5960785, 1, 1,
0.1830256, 1.459063, -1.227078, 0, 0.5921569, 1, 1,
0.1837855, 0.5269678, 1.165682, 0, 0.5843138, 1, 1,
0.1850732, -2.262577, 4.500438, 0, 0.5803922, 1, 1,
0.186812, -0.873617, 3.358101, 0, 0.572549, 1, 1,
0.1874031, 1.741415, -1.011789, 0, 0.5686275, 1, 1,
0.1918343, 1.218328, -0.2081091, 0, 0.5607843, 1, 1,
0.192517, -0.5553755, 2.562425, 0, 0.5568628, 1, 1,
0.1933429, -1.008229, 3.107825, 0, 0.5490196, 1, 1,
0.1956409, 0.8102555, -0.3765941, 0, 0.5450981, 1, 1,
0.1961251, -0.1925786, 1.228281, 0, 0.5372549, 1, 1,
0.1967944, -1.48232, 3.249798, 0, 0.5333334, 1, 1,
0.1976284, -2.815671, 3.60048, 0, 0.5254902, 1, 1,
0.19763, 0.9022366, 1.528275, 0, 0.5215687, 1, 1,
0.1988994, -0.5463773, 2.47704, 0, 0.5137255, 1, 1,
0.1990499, -1.007141, 1.753496, 0, 0.509804, 1, 1,
0.2006169, 1.074846, -0.5401646, 0, 0.5019608, 1, 1,
0.2006669, -0.4411356, 2.571444, 0, 0.4941176, 1, 1,
0.2025788, 1.106073, 1.563606, 0, 0.4901961, 1, 1,
0.2028731, -0.4277458, 2.188717, 0, 0.4823529, 1, 1,
0.2053967, -1.365988, 2.203647, 0, 0.4784314, 1, 1,
0.2062603, -0.4806915, 3.01205, 0, 0.4705882, 1, 1,
0.2076759, 1.050679, 0.09430793, 0, 0.4666667, 1, 1,
0.213955, 0.8104102, -0.2176726, 0, 0.4588235, 1, 1,
0.2199048, -0.4495152, 2.848296, 0, 0.454902, 1, 1,
0.2227684, -1.932279, 2.717656, 0, 0.4470588, 1, 1,
0.2248678, -0.355808, 3.660293, 0, 0.4431373, 1, 1,
0.2256992, -1.412736, 2.170273, 0, 0.4352941, 1, 1,
0.2320596, 0.7168917, 0.472516, 0, 0.4313726, 1, 1,
0.2346185, -1.495113, 4.34685, 0, 0.4235294, 1, 1,
0.2360718, 0.7068956, 0.6173353, 0, 0.4196078, 1, 1,
0.2438182, 0.9912008, -0.6689113, 0, 0.4117647, 1, 1,
0.2448812, -0.7819691, 3.499379, 0, 0.4078431, 1, 1,
0.2458912, -1.420004, 3.568182, 0, 0.4, 1, 1,
0.253865, 2.128854, 1.182896, 0, 0.3921569, 1, 1,
0.2614612, 0.5019282, 2.844032, 0, 0.3882353, 1, 1,
0.2619941, -0.1758243, 2.699363, 0, 0.3803922, 1, 1,
0.263852, 0.2962338, 0.8817582, 0, 0.3764706, 1, 1,
0.2649679, -0.04802788, 0.8285726, 0, 0.3686275, 1, 1,
0.2655126, 2.39967, 0.5700777, 0, 0.3647059, 1, 1,
0.2662973, -0.4886137, 2.978313, 0, 0.3568628, 1, 1,
0.2717593, 0.5019162, 1.132873, 0, 0.3529412, 1, 1,
0.275342, 1.665589, 2.181474, 0, 0.345098, 1, 1,
0.2779214, -0.02425835, 1.499424, 0, 0.3411765, 1, 1,
0.2788894, 0.6449392, -0.3016379, 0, 0.3333333, 1, 1,
0.282369, -1.527259, 3.513346, 0, 0.3294118, 1, 1,
0.2844096, -1.173104, 4.236055, 0, 0.3215686, 1, 1,
0.2889144, 0.9662347, -0.2535027, 0, 0.3176471, 1, 1,
0.2947502, -1.513888, 2.954891, 0, 0.3098039, 1, 1,
0.2971269, 0.3715043, 2.384767, 0, 0.3058824, 1, 1,
0.2985069, 0.6618898, -1.020922, 0, 0.2980392, 1, 1,
0.3013709, 2.772677, 0.5662645, 0, 0.2901961, 1, 1,
0.3033277, 0.8544357, -1.477662, 0, 0.2862745, 1, 1,
0.3045753, 1.009025, 2.182862, 0, 0.2784314, 1, 1,
0.3085181, 0.6784752, -0.2618569, 0, 0.2745098, 1, 1,
0.3094063, -0.6268863, 1.825196, 0, 0.2666667, 1, 1,
0.3184887, -0.1921944, 2.421043, 0, 0.2627451, 1, 1,
0.3187708, 0.9803459, -0.2522664, 0, 0.254902, 1, 1,
0.319123, -0.4833954, 3.470939, 0, 0.2509804, 1, 1,
0.3210503, -0.03374261, 1.328829, 0, 0.2431373, 1, 1,
0.3223432, -0.2230445, 1.813623, 0, 0.2392157, 1, 1,
0.3277409, -0.4482952, 3.643512, 0, 0.2313726, 1, 1,
0.3320028, 0.6768438, 1.586272, 0, 0.227451, 1, 1,
0.334185, 0.5784147, 1.137448, 0, 0.2196078, 1, 1,
0.3424351, -0.06612507, 2.430294, 0, 0.2156863, 1, 1,
0.347104, 1.045153, 0.2015866, 0, 0.2078431, 1, 1,
0.348307, 0.7759681, 0.7218732, 0, 0.2039216, 1, 1,
0.350668, 0.004367117, 0.8222449, 0, 0.1960784, 1, 1,
0.3547898, -0.7919301, 3.610518, 0, 0.1882353, 1, 1,
0.356445, -0.1728195, 1.832536, 0, 0.1843137, 1, 1,
0.358611, 0.4073873, -0.01586375, 0, 0.1764706, 1, 1,
0.3595804, -0.6349314, 2.673124, 0, 0.172549, 1, 1,
0.3636309, 0.5555121, 1.246626, 0, 0.1647059, 1, 1,
0.3653341, 2.116102, 0.04959553, 0, 0.1607843, 1, 1,
0.3659254, -0.466109, 1.043081, 0, 0.1529412, 1, 1,
0.3661603, -0.8775628, 1.003963, 0, 0.1490196, 1, 1,
0.3676888, -1.342339, 1.26552, 0, 0.1411765, 1, 1,
0.3706611, 0.3423546, 0.6681075, 0, 0.1372549, 1, 1,
0.3712476, 1.751099, -0.5738282, 0, 0.1294118, 1, 1,
0.3724745, 1.190428, -0.2534402, 0, 0.1254902, 1, 1,
0.3730559, -1.167387, 3.278478, 0, 0.1176471, 1, 1,
0.3744521, -0.1846133, 2.869586, 0, 0.1137255, 1, 1,
0.37674, -0.7309889, 3.015389, 0, 0.1058824, 1, 1,
0.3846393, -0.7950975, 2.211729, 0, 0.09803922, 1, 1,
0.3852865, 1.190006, 2.129748, 0, 0.09411765, 1, 1,
0.3854575, -1.389198, 2.732956, 0, 0.08627451, 1, 1,
0.3910075, 1.439857, 0.2998768, 0, 0.08235294, 1, 1,
0.3945324, 1.378986, -0.7367464, 0, 0.07450981, 1, 1,
0.3954905, 1.6871, 0.1593878, 0, 0.07058824, 1, 1,
0.3980173, -0.7814441, 3.504705, 0, 0.0627451, 1, 1,
0.39854, -0.6870557, 1.867857, 0, 0.05882353, 1, 1,
0.4002775, 0.8666123, 0.3222448, 0, 0.05098039, 1, 1,
0.4003776, -0.5088583, 3.918391, 0, 0.04705882, 1, 1,
0.4059633, -1.01032, 3.476444, 0, 0.03921569, 1, 1,
0.406544, -1.437396, 4.342677, 0, 0.03529412, 1, 1,
0.4077536, 0.6092998, -0.1165645, 0, 0.02745098, 1, 1,
0.4157684, -0.4688423, 1.777952, 0, 0.02352941, 1, 1,
0.4201892, -0.002245469, 0.9236257, 0, 0.01568628, 1, 1,
0.4234109, -0.9396774, 2.401124, 0, 0.01176471, 1, 1,
0.4236154, -0.4302022, 2.470563, 0, 0.003921569, 1, 1,
0.4295186, -0.420357, 1.940434, 0.003921569, 0, 1, 1,
0.4322576, 1.550671, -0.003360994, 0.007843138, 0, 1, 1,
0.4324954, -0.3457859, 1.709361, 0.01568628, 0, 1, 1,
0.4326491, 0.1706214, 0.398927, 0.01960784, 0, 1, 1,
0.4329101, -0.1848612, 0.8222688, 0.02745098, 0, 1, 1,
0.439944, 1.980819, -0.8722463, 0.03137255, 0, 1, 1,
0.4429186, -0.4444431, 2.364317, 0.03921569, 0, 1, 1,
0.4448588, 0.5460642, -0.5929801, 0.04313726, 0, 1, 1,
0.4456476, 0.4350888, -1.142165, 0.05098039, 0, 1, 1,
0.4459186, -0.5431159, 2.876164, 0.05490196, 0, 1, 1,
0.4496756, -0.1017185, 0.3731839, 0.0627451, 0, 1, 1,
0.44969, -1.906454, 4.696293, 0.06666667, 0, 1, 1,
0.4496963, 2.120802, 1.377836, 0.07450981, 0, 1, 1,
0.4657709, 0.9042876, -1.639176, 0.07843138, 0, 1, 1,
0.4677686, 0.1167104, -0.1118763, 0.08627451, 0, 1, 1,
0.4699698, 0.04605135, 1.50958, 0.09019608, 0, 1, 1,
0.4747147, -0.9248751, 2.581514, 0.09803922, 0, 1, 1,
0.4770158, -0.5449116, 1.798341, 0.1058824, 0, 1, 1,
0.4813519, -1.187131, 5.950458, 0.1098039, 0, 1, 1,
0.4822034, 0.7087424, 1.130646, 0.1176471, 0, 1, 1,
0.4829308, -0.18481, 1.926921, 0.1215686, 0, 1, 1,
0.4883731, 0.6465464, -0.6965517, 0.1294118, 0, 1, 1,
0.4896307, -0.4201703, 2.200215, 0.1333333, 0, 1, 1,
0.4916415, -2.426198, 0.759581, 0.1411765, 0, 1, 1,
0.4978347, -1.956189, 1.343663, 0.145098, 0, 1, 1,
0.5091183, 0.1014584, 1.287633, 0.1529412, 0, 1, 1,
0.5098174, -0.931886, 1.137766, 0.1568628, 0, 1, 1,
0.5141501, 0.715679, 1.321041, 0.1647059, 0, 1, 1,
0.5161974, -1.116585, 2.843884, 0.1686275, 0, 1, 1,
0.5162786, -0.3131422, 2.034129, 0.1764706, 0, 1, 1,
0.5189157, -0.4023764, 3.966424, 0.1803922, 0, 1, 1,
0.519129, 0.4021079, -0.2887566, 0.1882353, 0, 1, 1,
0.5246235, 0.4858764, 0.37549, 0.1921569, 0, 1, 1,
0.5247275, 0.9322661, -0.8602585, 0.2, 0, 1, 1,
0.5256037, -0.4748659, 2.186978, 0.2078431, 0, 1, 1,
0.531808, 1.409222, 0.4196666, 0.2117647, 0, 1, 1,
0.5401542, -0.08632907, 0.0268021, 0.2196078, 0, 1, 1,
0.5481702, -0.5600932, 3.178812, 0.2235294, 0, 1, 1,
0.5506247, -0.5853336, 1.552353, 0.2313726, 0, 1, 1,
0.5588109, 1.377857, -0.1565551, 0.2352941, 0, 1, 1,
0.5679981, -0.6112294, 2.519031, 0.2431373, 0, 1, 1,
0.5683835, 1.719669, -0.170661, 0.2470588, 0, 1, 1,
0.5685696, -1.61622, 1.737186, 0.254902, 0, 1, 1,
0.5706053, 1.091059, -0.9414813, 0.2588235, 0, 1, 1,
0.5765234, -1.636722, 1.363183, 0.2666667, 0, 1, 1,
0.5779204, -0.2839089, 2.353775, 0.2705882, 0, 1, 1,
0.5783309, -0.6777806, 3.054167, 0.2784314, 0, 1, 1,
0.5799824, -0.6354963, 2.960016, 0.282353, 0, 1, 1,
0.5825108, 0.4780385, -1.433012, 0.2901961, 0, 1, 1,
0.5828606, 0.1840797, 1.665806, 0.2941177, 0, 1, 1,
0.5868518, 2.37839, 0.6036305, 0.3019608, 0, 1, 1,
0.5919068, -0.1074954, 1.930428, 0.3098039, 0, 1, 1,
0.5947909, 0.6009609, 1.419255, 0.3137255, 0, 1, 1,
0.5972127, -1.219612, 2.9352, 0.3215686, 0, 1, 1,
0.5995577, -1.342991, 1.505056, 0.3254902, 0, 1, 1,
0.6020764, 1.151774, 1.051604, 0.3333333, 0, 1, 1,
0.6062416, 0.06965081, 1.100165, 0.3372549, 0, 1, 1,
0.6185732, 0.6661428, 1.204566, 0.345098, 0, 1, 1,
0.6251994, -1.196549, 1.861872, 0.3490196, 0, 1, 1,
0.6269595, -1.127288, 2.015129, 0.3568628, 0, 1, 1,
0.6340141, 1.785234, 0.7952724, 0.3607843, 0, 1, 1,
0.6452624, 1.060394, -0.1328073, 0.3686275, 0, 1, 1,
0.6493624, -0.5435883, 1.965, 0.372549, 0, 1, 1,
0.6608921, 0.5299304, 0.4889024, 0.3803922, 0, 1, 1,
0.6635357, 0.3930172, -0.3740734, 0.3843137, 0, 1, 1,
0.680618, -0.9677898, 1.758098, 0.3921569, 0, 1, 1,
0.6873026, -1.242949, 2.424799, 0.3960784, 0, 1, 1,
0.6883082, 1.568248, 1.988978, 0.4039216, 0, 1, 1,
0.6955497, -0.6131947, 2.228899, 0.4117647, 0, 1, 1,
0.6959653, 0.2803013, -0.232099, 0.4156863, 0, 1, 1,
0.7014856, 0.2298491, 0.9240149, 0.4235294, 0, 1, 1,
0.7028022, -0.2458551, 3.161092, 0.427451, 0, 1, 1,
0.7033303, 1.386056, 0.1842852, 0.4352941, 0, 1, 1,
0.7051538, 0.901019, 1.000495, 0.4392157, 0, 1, 1,
0.7119908, -0.6570764, 0.568256, 0.4470588, 0, 1, 1,
0.7160527, -0.7295187, 1.73854, 0.4509804, 0, 1, 1,
0.7212249, -0.3066298, 1.484124, 0.4588235, 0, 1, 1,
0.7232357, -1.670155, 2.250844, 0.4627451, 0, 1, 1,
0.7247207, 1.644388, 1.509439, 0.4705882, 0, 1, 1,
0.7302411, 0.2807239, 4.313798, 0.4745098, 0, 1, 1,
0.7332572, -1.953275, 4.651756, 0.4823529, 0, 1, 1,
0.7346795, 0.9221485, 1.439715, 0.4862745, 0, 1, 1,
0.7366272, -1.418148, 1.00502, 0.4941176, 0, 1, 1,
0.7378597, 0.6184651, 0.5069243, 0.5019608, 0, 1, 1,
0.7385331, -2.04744, 3.61125, 0.5058824, 0, 1, 1,
0.7443014, -0.8280547, 1.360357, 0.5137255, 0, 1, 1,
0.7456955, -0.05229842, 0.7674245, 0.5176471, 0, 1, 1,
0.7473299, -0.7493867, 1.870918, 0.5254902, 0, 1, 1,
0.7519887, -1.73223, 2.660434, 0.5294118, 0, 1, 1,
0.7626447, -0.796087, 1.710659, 0.5372549, 0, 1, 1,
0.764787, -0.4817368, 2.218912, 0.5411765, 0, 1, 1,
0.768878, -0.7699202, 0.9890481, 0.5490196, 0, 1, 1,
0.7755387, -1.062915, 2.51836, 0.5529412, 0, 1, 1,
0.7783381, 1.366536, 1.448527, 0.5607843, 0, 1, 1,
0.7818441, -0.6105796, 2.237069, 0.5647059, 0, 1, 1,
0.7820154, 0.9486489, 0.3630995, 0.572549, 0, 1, 1,
0.7822963, -1.116964, 4.522082, 0.5764706, 0, 1, 1,
0.7840885, 1.411631, 0.1670888, 0.5843138, 0, 1, 1,
0.7864496, -1.021524, 1.243641, 0.5882353, 0, 1, 1,
0.7882284, 0.2347133, 0.7611787, 0.5960785, 0, 1, 1,
0.7900931, -0.5811875, 2.686776, 0.6039216, 0, 1, 1,
0.7912808, 0.3448734, -0.4261742, 0.6078432, 0, 1, 1,
0.7963277, 0.4898524, 0.09806525, 0.6156863, 0, 1, 1,
0.7973521, 2.0092, 1.446194, 0.6196079, 0, 1, 1,
0.7996151, 1.260362, 0.141289, 0.627451, 0, 1, 1,
0.8001664, 0.3446527, 2.746965, 0.6313726, 0, 1, 1,
0.8062562, 2.001935, -1.705891, 0.6392157, 0, 1, 1,
0.8153959, 1.249691, -2.226638, 0.6431373, 0, 1, 1,
0.8160331, -0.2745614, 2.568996, 0.6509804, 0, 1, 1,
0.8192926, -0.1546707, 0.9033788, 0.654902, 0, 1, 1,
0.8203653, 1.210243, 1.830214, 0.6627451, 0, 1, 1,
0.8214816, -1.427396, 3.24126, 0.6666667, 0, 1, 1,
0.8242206, -0.2450578, 0.9138492, 0.6745098, 0, 1, 1,
0.8254302, -0.5889567, 2.917326, 0.6784314, 0, 1, 1,
0.8265874, -0.8527922, 4.000927, 0.6862745, 0, 1, 1,
0.8270235, -0.05242572, 2.539395, 0.6901961, 0, 1, 1,
0.8272338, 1.095747, 2.55949, 0.6980392, 0, 1, 1,
0.8297115, -0.460634, 1.553955, 0.7058824, 0, 1, 1,
0.8318744, -0.5265076, 2.299602, 0.7098039, 0, 1, 1,
0.8336685, -0.9752197, 2.105499, 0.7176471, 0, 1, 1,
0.847069, -0.7589131, 2.114597, 0.7215686, 0, 1, 1,
0.8478351, 0.01923979, 2.412859, 0.7294118, 0, 1, 1,
0.8559987, 1.234257, -0.5437056, 0.7333333, 0, 1, 1,
0.8636276, 0.4047436, 0.7127262, 0.7411765, 0, 1, 1,
0.8779499, 0.6286974, 0.3679343, 0.7450981, 0, 1, 1,
0.8795478, -1.656693, 2.912663, 0.7529412, 0, 1, 1,
0.8828779, 0.8618212, 1.71227, 0.7568628, 0, 1, 1,
0.8860773, 0.9059514, 0.4837371, 0.7647059, 0, 1, 1,
0.8905998, -1.690601, 2.261709, 0.7686275, 0, 1, 1,
0.8908178, -0.6841654, 2.03907, 0.7764706, 0, 1, 1,
0.8911983, 0.3624468, 0.7060795, 0.7803922, 0, 1, 1,
0.8941894, 1.491827, 1.195862, 0.7882353, 0, 1, 1,
0.8954648, 1.625705, -2.129347, 0.7921569, 0, 1, 1,
0.8966375, -0.3332344, 2.257601, 0.8, 0, 1, 1,
0.9121542, 0.1162966, 2.200195, 0.8078431, 0, 1, 1,
0.9158388, -0.4444483, 2.537456, 0.8117647, 0, 1, 1,
0.9231399, 0.4121308, 2.892781, 0.8196079, 0, 1, 1,
0.9269761, -1.322202, 2.499264, 0.8235294, 0, 1, 1,
0.9299921, 1.406217, 2.629175, 0.8313726, 0, 1, 1,
0.9367426, -0.4488062, 1.430249, 0.8352941, 0, 1, 1,
0.9425313, -0.5658125, 2.342496, 0.8431373, 0, 1, 1,
0.9448159, -0.02173466, 2.72372, 0.8470588, 0, 1, 1,
0.9571564, -0.6686518, 1.788739, 0.854902, 0, 1, 1,
0.9597796, -0.1570806, 0.290658, 0.8588235, 0, 1, 1,
0.9675161, 2.131651, -0.3134038, 0.8666667, 0, 1, 1,
0.9712552, -0.2072853, 1.077266, 0.8705882, 0, 1, 1,
0.9801835, 0.4227121, 1.082189, 0.8784314, 0, 1, 1,
0.9836883, -1.306063, 3.476563, 0.8823529, 0, 1, 1,
0.9859531, -0.9236746, 1.807856, 0.8901961, 0, 1, 1,
0.9880656, -2.21225, 3.734575, 0.8941177, 0, 1, 1,
0.9965868, -0.3214153, 2.894068, 0.9019608, 0, 1, 1,
0.9989939, 1.274054, 1.144195, 0.9098039, 0, 1, 1,
1.002607, -0.8293095, 2.463276, 0.9137255, 0, 1, 1,
1.01342, 0.3272647, 1.804162, 0.9215686, 0, 1, 1,
1.017143, 0.9008915, 1.551877, 0.9254902, 0, 1, 1,
1.017915, -1.210389, 2.592874, 0.9333333, 0, 1, 1,
1.019023, -0.8907566, 1.552983, 0.9372549, 0, 1, 1,
1.024815, 1.233907, 1.330238, 0.945098, 0, 1, 1,
1.034742, 0.666933, 0.4463702, 0.9490196, 0, 1, 1,
1.04058, 2.406921, 1.061958, 0.9568627, 0, 1, 1,
1.045038, -0.3284958, 2.243876, 0.9607843, 0, 1, 1,
1.050613, 0.523473, 1.191199, 0.9686275, 0, 1, 1,
1.053745, -0.5290091, -0.005326262, 0.972549, 0, 1, 1,
1.056165, -0.4663942, 1.560238, 0.9803922, 0, 1, 1,
1.057077, 0.9496918, -0.318185, 0.9843137, 0, 1, 1,
1.060616, 0.7354304, 0.733916, 0.9921569, 0, 1, 1,
1.062733, -0.3795188, 1.935446, 0.9960784, 0, 1, 1,
1.076207, 0.6952946, 0.4950457, 1, 0, 0.9960784, 1,
1.081443, 2.138016, 0.07927924, 1, 0, 0.9882353, 1,
1.083799, -1.327432, 2.091665, 1, 0, 0.9843137, 1,
1.085787, 1.109413, 2.198396, 1, 0, 0.9764706, 1,
1.093034, -0.1227157, 1.789779, 1, 0, 0.972549, 1,
1.093904, 0.9030397, 0.07332616, 1, 0, 0.9647059, 1,
1.096644, 0.3754392, 2.188884, 1, 0, 0.9607843, 1,
1.103074, -0.550712, 2.300237, 1, 0, 0.9529412, 1,
1.103518, 0.9287629, 0.1062313, 1, 0, 0.9490196, 1,
1.104908, -0.176258, 1.763107, 1, 0, 0.9411765, 1,
1.108547, 0.1919722, 1.178823, 1, 0, 0.9372549, 1,
1.111679, -0.6246275, 2.029152, 1, 0, 0.9294118, 1,
1.116049, -1.169816, 5.528595, 1, 0, 0.9254902, 1,
1.120599, 0.1139217, 2.073224, 1, 0, 0.9176471, 1,
1.121709, 1.212148, 0.3147763, 1, 0, 0.9137255, 1,
1.124129, 0.609688, 3.228065, 1, 0, 0.9058824, 1,
1.125481, -0.729133, 1.316198, 1, 0, 0.9019608, 1,
1.126908, -0.2249136, 1.868247, 1, 0, 0.8941177, 1,
1.127415, 0.5514221, 1.070781, 1, 0, 0.8862745, 1,
1.129461, 1.12354, -0.6299271, 1, 0, 0.8823529, 1,
1.129793, 0.944528, -0.7527688, 1, 0, 0.8745098, 1,
1.132863, -0.06656533, 0.9017097, 1, 0, 0.8705882, 1,
1.134498, 0.9866996, 0.6556873, 1, 0, 0.8627451, 1,
1.136896, 0.422161, -0.1669689, 1, 0, 0.8588235, 1,
1.138366, -1.073108, 3.017135, 1, 0, 0.8509804, 1,
1.141841, -1.055576, 1.750765, 1, 0, 0.8470588, 1,
1.143209, 0.01011082, 1.114813, 1, 0, 0.8392157, 1,
1.143457, 0.4587154, 1.819099, 1, 0, 0.8352941, 1,
1.14466, -1.268301, 2.631857, 1, 0, 0.827451, 1,
1.154169, -0.6913449, 2.002791, 1, 0, 0.8235294, 1,
1.16012, -1.618644, 0.8974122, 1, 0, 0.8156863, 1,
1.160688, -0.0001100075, 0.5949847, 1, 0, 0.8117647, 1,
1.161168, -0.1252095, 1.652701, 1, 0, 0.8039216, 1,
1.161256, -0.1101352, 1.01875, 1, 0, 0.7960784, 1,
1.163303, -0.4134274, 1.048832, 1, 0, 0.7921569, 1,
1.171318, -1.629131, 3.521105, 1, 0, 0.7843137, 1,
1.172972, -1.549987, 2.426216, 1, 0, 0.7803922, 1,
1.179614, -0.2135337, 0.5265303, 1, 0, 0.772549, 1,
1.187225, -1.028905, 3.067251, 1, 0, 0.7686275, 1,
1.189791, 0.8968543, -0.5269998, 1, 0, 0.7607843, 1,
1.191314, 0.02052158, 1.871166, 1, 0, 0.7568628, 1,
1.194562, -0.4298817, 2.813914, 1, 0, 0.7490196, 1,
1.197515, 0.783821, 1.760378, 1, 0, 0.7450981, 1,
1.200266, -0.8054984, 2.640467, 1, 0, 0.7372549, 1,
1.212457, -0.7533658, 1.742575, 1, 0, 0.7333333, 1,
1.22346, -0.5247927, 1.397703, 1, 0, 0.7254902, 1,
1.231905, 0.9878489, 0.4848709, 1, 0, 0.7215686, 1,
1.236796, 0.1115604, 1.042212, 1, 0, 0.7137255, 1,
1.244993, -0.2339116, 0.03919067, 1, 0, 0.7098039, 1,
1.249669, 0.717763, 0.8209566, 1, 0, 0.7019608, 1,
1.260465, 0.5806512, 0.8493441, 1, 0, 0.6941177, 1,
1.262173, 1.23446, -0.4240391, 1, 0, 0.6901961, 1,
1.273602, 1.282543, 1.155076, 1, 0, 0.682353, 1,
1.279193, -1.912562, 2.406597, 1, 0, 0.6784314, 1,
1.29746, -0.5528764, 3.158665, 1, 0, 0.6705883, 1,
1.301628, 0.4053142, 1.957152, 1, 0, 0.6666667, 1,
1.308124, 0.4400426, 0.4578789, 1, 0, 0.6588235, 1,
1.308518, -0.3573409, 1.401078, 1, 0, 0.654902, 1,
1.311555, 0.8210405, 1.342796, 1, 0, 0.6470588, 1,
1.312613, -0.4051608, 0.04399435, 1, 0, 0.6431373, 1,
1.314615, -0.8769242, 1.502671, 1, 0, 0.6352941, 1,
1.319223, 0.4647688, 3.028724, 1, 0, 0.6313726, 1,
1.329134, -1.272068, 4.091848, 1, 0, 0.6235294, 1,
1.341365, 0.7856844, -0.02286115, 1, 0, 0.6196079, 1,
1.350777, 1.525367, 1.456877, 1, 0, 0.6117647, 1,
1.358938, 0.1739811, 0.9540058, 1, 0, 0.6078432, 1,
1.359088, 0.2892516, 2.19162, 1, 0, 0.6, 1,
1.384291, 0.8605725, 0.9431143, 1, 0, 0.5921569, 1,
1.389975, 1.5012, 0.460949, 1, 0, 0.5882353, 1,
1.393535, -0.4623791, 1.778065, 1, 0, 0.5803922, 1,
1.396713, -1.123731, -0.008926695, 1, 0, 0.5764706, 1,
1.405773, 0.3835024, 0.6603152, 1, 0, 0.5686275, 1,
1.408897, 1.048559, 0.4545792, 1, 0, 0.5647059, 1,
1.413388, -0.3958946, 1.024404, 1, 0, 0.5568628, 1,
1.417344, 1.0503, 1.655197, 1, 0, 0.5529412, 1,
1.418366, -0.7108461, 2.265275, 1, 0, 0.5450981, 1,
1.418677, 0.4900196, 2.781047, 1, 0, 0.5411765, 1,
1.420146, 0.02104036, 2.035513, 1, 0, 0.5333334, 1,
1.42961, -0.9412317, 1.88377, 1, 0, 0.5294118, 1,
1.430966, -0.6940953, 1.736983, 1, 0, 0.5215687, 1,
1.431709, -1.879239, 2.72944, 1, 0, 0.5176471, 1,
1.447632, 0.1591606, 0.7013834, 1, 0, 0.509804, 1,
1.448447, 0.08440797, 1.54322, 1, 0, 0.5058824, 1,
1.44999, -1.511924, 4.144345, 1, 0, 0.4980392, 1,
1.450857, -1.735332, 3.559712, 1, 0, 0.4901961, 1,
1.460819, -0.5507921, 3.533638, 1, 0, 0.4862745, 1,
1.462428, 0.09924043, 1.578154, 1, 0, 0.4784314, 1,
1.462831, 1.184692, 2.316195, 1, 0, 0.4745098, 1,
1.464725, 1.054595, 1.387384, 1, 0, 0.4666667, 1,
1.471893, -1.189617, 2.621523, 1, 0, 0.4627451, 1,
1.482726, 0.2833959, 2.161218, 1, 0, 0.454902, 1,
1.488345, -0.1831878, 1.23477, 1, 0, 0.4509804, 1,
1.498925, -1.280335, 1.732028, 1, 0, 0.4431373, 1,
1.501146, 0.6424235, 1.776199, 1, 0, 0.4392157, 1,
1.515864, -0.6016722, 3.032573, 1, 0, 0.4313726, 1,
1.516054, -0.6074533, 1.798696, 1, 0, 0.427451, 1,
1.519821, -1.187091, 2.208599, 1, 0, 0.4196078, 1,
1.520738, 1.186378, 0.9675169, 1, 0, 0.4156863, 1,
1.526947, -0.6709921, 3.659719, 1, 0, 0.4078431, 1,
1.531764, 0.8058271, -0.07809664, 1, 0, 0.4039216, 1,
1.547742, -0.2416372, 1.245243, 1, 0, 0.3960784, 1,
1.549512, -3.107212, 4.125651, 1, 0, 0.3882353, 1,
1.552567, 0.1286926, 3.798142, 1, 0, 0.3843137, 1,
1.553278, 2.274061, 0.07339411, 1, 0, 0.3764706, 1,
1.553692, 1.028714, 0.4991604, 1, 0, 0.372549, 1,
1.561677, 0.3902132, 0.5172685, 1, 0, 0.3647059, 1,
1.56388, -0.1934183, 0.2936713, 1, 0, 0.3607843, 1,
1.582713, -0.6999121, 1.431723, 1, 0, 0.3529412, 1,
1.595519, 0.1096319, 0.9364018, 1, 0, 0.3490196, 1,
1.601521, 1.156031, 0.8029839, 1, 0, 0.3411765, 1,
1.616593, 1.750543, 0.3727, 1, 0, 0.3372549, 1,
1.616644, 0.4738472, 2.53881, 1, 0, 0.3294118, 1,
1.645008, -0.3789965, 1.920642, 1, 0, 0.3254902, 1,
1.653108, 0.2228829, 1.213305, 1, 0, 0.3176471, 1,
1.653639, -1.350388, 0.04115235, 1, 0, 0.3137255, 1,
1.660724, 0.5678126, 2.240005, 1, 0, 0.3058824, 1,
1.666422, -0.5555354, 1.175645, 1, 0, 0.2980392, 1,
1.676692, 1.72491, -0.3905764, 1, 0, 0.2941177, 1,
1.697994, -1.003089, 1.13495, 1, 0, 0.2862745, 1,
1.699971, 0.7307886, 1.969283, 1, 0, 0.282353, 1,
1.700739, 0.133732, 1.600979, 1, 0, 0.2745098, 1,
1.712076, 0.03585404, 1.612951, 1, 0, 0.2705882, 1,
1.714482, 1.180787, 1.986131, 1, 0, 0.2627451, 1,
1.71955, -0.09414761, 1.751239, 1, 0, 0.2588235, 1,
1.743843, 1.905306, -0.06536198, 1, 0, 0.2509804, 1,
1.763959, 1.324663, 2.453293, 1, 0, 0.2470588, 1,
1.772128, -0.6025686, 0.9517862, 1, 0, 0.2392157, 1,
1.78602, -1.708417, 3.576913, 1, 0, 0.2352941, 1,
1.793839, -1.048975, 1.657135, 1, 0, 0.227451, 1,
1.80479, 0.7888934, 0.2290036, 1, 0, 0.2235294, 1,
1.808459, 0.1847671, 1.963002, 1, 0, 0.2156863, 1,
1.82165, -0.6299909, 1.356588, 1, 0, 0.2117647, 1,
1.832491, 0.4441126, 0.127529, 1, 0, 0.2039216, 1,
1.843086, -1.30118, 3.059499, 1, 0, 0.1960784, 1,
1.865373, 0.2718472, 2.032795, 1, 0, 0.1921569, 1,
1.874212, 1.747243, 0.01622197, 1, 0, 0.1843137, 1,
1.913156, -0.04481672, 0.8306739, 1, 0, 0.1803922, 1,
1.921187, 0.5432363, 1.808448, 1, 0, 0.172549, 1,
1.930204, -0.5548264, 1.54843, 1, 0, 0.1686275, 1,
1.939251, 1.222004, -0.03874081, 1, 0, 0.1607843, 1,
1.973408, -0.3982886, 2.454444, 1, 0, 0.1568628, 1,
1.98614, 0.9075528, 0.8918316, 1, 0, 0.1490196, 1,
1.999981, -0.0995905, 2.25946, 1, 0, 0.145098, 1,
2.013412, 0.1983, 1.633057, 1, 0, 0.1372549, 1,
2.045873, 0.9547737, 2.447003, 1, 0, 0.1333333, 1,
2.059377, 1.326782, 0.9043975, 1, 0, 0.1254902, 1,
2.06394, -1.178087, 1.639417, 1, 0, 0.1215686, 1,
2.081186, 0.00719924, 0.2716767, 1, 0, 0.1137255, 1,
2.090796, 0.5971209, 0.891698, 1, 0, 0.1098039, 1,
2.103478, -0.5827363, 3.407025, 1, 0, 0.1019608, 1,
2.157632, 0.7950271, 0.4275198, 1, 0, 0.09411765, 1,
2.19243, -0.6472868, 1.9395, 1, 0, 0.09019608, 1,
2.193401, 1.022921, 1.368799, 1, 0, 0.08235294, 1,
2.19503, -0.7750208, 2.929711, 1, 0, 0.07843138, 1,
2.20186, -0.2185734, -1.032159, 1, 0, 0.07058824, 1,
2.270149, -0.6743666, 0.4234294, 1, 0, 0.06666667, 1,
2.281044, -1.599729, 3.605138, 1, 0, 0.05882353, 1,
2.331385, -1.355417, 0.6556194, 1, 0, 0.05490196, 1,
2.417916, 0.9778308, 0.6112357, 1, 0, 0.04705882, 1,
2.469715, 0.401222, 0.6844601, 1, 0, 0.04313726, 1,
2.478191, 0.4586013, 1.647767, 1, 0, 0.03529412, 1,
2.531803, -0.1449411, 1.803287, 1, 0, 0.03137255, 1,
2.5804, 0.4078422, 0.9278095, 1, 0, 0.02352941, 1,
2.687769, 0.6060041, 0.05407968, 1, 0, 0.01960784, 1,
2.794144, -1.062043, 3.774982, 1, 0, 0.01176471, 1,
2.794718, 0.6946972, 1.521643, 1, 0, 0.007843138, 1
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
-0.3897133, -4.119149, -7.266169, 0, -0.5, 0.5, 0.5,
-0.3897133, -4.119149, -7.266169, 1, -0.5, 0.5, 0.5,
-0.3897133, -4.119149, -7.266169, 1, 1.5, 0.5, 0.5,
-0.3897133, -4.119149, -7.266169, 0, 1.5, 0.5, 0.5
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
-4.653667, -0.122148, -7.266169, 0, -0.5, 0.5, 0.5,
-4.653667, -0.122148, -7.266169, 1, -0.5, 0.5, 0.5,
-4.653667, -0.122148, -7.266169, 1, 1.5, 0.5, 0.5,
-4.653667, -0.122148, -7.266169, 0, 1.5, 0.5, 0.5
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
-4.653667, -4.119149, 0.299912, 0, -0.5, 0.5, 0.5,
-4.653667, -4.119149, 0.299912, 1, -0.5, 0.5, 0.5,
-4.653667, -4.119149, 0.299912, 1, 1.5, 0.5, 0.5,
-4.653667, -4.119149, 0.299912, 0, 1.5, 0.5, 0.5
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
-3, -3.196764, -5.520151,
2, -3.196764, -5.520151,
-3, -3.196764, -5.520151,
-3, -3.350495, -5.811153,
-2, -3.196764, -5.520151,
-2, -3.350495, -5.811153,
-1, -3.196764, -5.520151,
-1, -3.350495, -5.811153,
0, -3.196764, -5.520151,
0, -3.350495, -5.811153,
1, -3.196764, -5.520151,
1, -3.350495, -5.811153,
2, -3.196764, -5.520151,
2, -3.350495, -5.811153
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
-3, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
-3, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
-3, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
-3, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5,
-2, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
-2, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
-2, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
-2, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5,
-1, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
-1, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
-1, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
-1, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5,
0, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
0, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
0, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
0, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5,
1, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
1, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
1, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
1, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5,
2, -3.657956, -6.39316, 0, -0.5, 0.5, 0.5,
2, -3.657956, -6.39316, 1, -0.5, 0.5, 0.5,
2, -3.657956, -6.39316, 1, 1.5, 0.5, 0.5,
2, -3.657956, -6.39316, 0, 1.5, 0.5, 0.5
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
-3.669678, -3, -5.520151,
-3.669678, 2, -5.520151,
-3.669678, -3, -5.520151,
-3.833676, -3, -5.811153,
-3.669678, -2, -5.520151,
-3.833676, -2, -5.811153,
-3.669678, -1, -5.520151,
-3.833676, -1, -5.811153,
-3.669678, 0, -5.520151,
-3.833676, 0, -5.811153,
-3.669678, 1, -5.520151,
-3.833676, 1, -5.811153,
-3.669678, 2, -5.520151,
-3.833676, 2, -5.811153
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
-4.161673, -3, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, -3, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, -3, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, -3, -6.39316, 0, 1.5, 0.5, 0.5,
-4.161673, -2, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, -2, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, -2, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, -2, -6.39316, 0, 1.5, 0.5, 0.5,
-4.161673, -1, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, -1, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, -1, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, -1, -6.39316, 0, 1.5, 0.5, 0.5,
-4.161673, 0, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, 0, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, 0, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, 0, -6.39316, 0, 1.5, 0.5, 0.5,
-4.161673, 1, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, 1, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, 1, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, 1, -6.39316, 0, 1.5, 0.5, 0.5,
-4.161673, 2, -6.39316, 0, -0.5, 0.5, 0.5,
-4.161673, 2, -6.39316, 1, -0.5, 0.5, 0.5,
-4.161673, 2, -6.39316, 1, 1.5, 0.5, 0.5,
-4.161673, 2, -6.39316, 0, 1.5, 0.5, 0.5
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
-3.669678, -3.196764, -4,
-3.669678, -3.196764, 4,
-3.669678, -3.196764, -4,
-3.833676, -3.350495, -4,
-3.669678, -3.196764, -2,
-3.833676, -3.350495, -2,
-3.669678, -3.196764, 0,
-3.833676, -3.350495, 0,
-3.669678, -3.196764, 2,
-3.833676, -3.350495, 2,
-3.669678, -3.196764, 4,
-3.833676, -3.350495, 4
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
-4.161673, -3.657956, -4, 0, -0.5, 0.5, 0.5,
-4.161673, -3.657956, -4, 1, -0.5, 0.5, 0.5,
-4.161673, -3.657956, -4, 1, 1.5, 0.5, 0.5,
-4.161673, -3.657956, -4, 0, 1.5, 0.5, 0.5,
-4.161673, -3.657956, -2, 0, -0.5, 0.5, 0.5,
-4.161673, -3.657956, -2, 1, -0.5, 0.5, 0.5,
-4.161673, -3.657956, -2, 1, 1.5, 0.5, 0.5,
-4.161673, -3.657956, -2, 0, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 0, 0, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 0, 1, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 0, 1, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 0, 0, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 2, 0, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 2, 1, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 2, 1, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 2, 0, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 4, 0, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 4, 1, -0.5, 0.5, 0.5,
-4.161673, -3.657956, 4, 1, 1.5, 0.5, 0.5,
-4.161673, -3.657956, 4, 0, 1.5, 0.5, 0.5
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
-3.669678, -3.196764, -5.520151,
-3.669678, 2.952468, -5.520151,
-3.669678, -3.196764, 6.119975,
-3.669678, 2.952468, 6.119975,
-3.669678, -3.196764, -5.520151,
-3.669678, -3.196764, 6.119975,
-3.669678, 2.952468, -5.520151,
-3.669678, 2.952468, 6.119975,
-3.669678, -3.196764, -5.520151,
2.890251, -3.196764, -5.520151,
-3.669678, -3.196764, 6.119975,
2.890251, -3.196764, 6.119975,
-3.669678, 2.952468, -5.520151,
2.890251, 2.952468, -5.520151,
-3.669678, 2.952468, 6.119975,
2.890251, 2.952468, 6.119975,
2.890251, -3.196764, -5.520151,
2.890251, 2.952468, -5.520151,
2.890251, -3.196764, 6.119975,
2.890251, 2.952468, 6.119975,
2.890251, -3.196764, -5.520151,
2.890251, -3.196764, 6.119975,
2.890251, 2.952468, -5.520151,
2.890251, 2.952468, 6.119975
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
var radius = 7.854022;
var distance = 34.94343;
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
mvMatrix.translate( 0.3897133, 0.122148, -0.299912 );
mvMatrix.scale( 1.294514, 1.380973, 0.7295387 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94343);
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
flusulfamide<-read.table("flusulfamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flusulfamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
```

```r
y<-flusulfamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
```

```r
z<-flusulfamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'flusulfamide' not found
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
-3.574145, -1.87572, -1.003104, 0, 0, 1, 1, 1,
-3.094563, -1.148232, -2.448097, 1, 0, 0, 1, 1,
-2.829105, -0.06869198, -1.275472, 1, 0, 0, 1, 1,
-2.809094, 1.116328, -0.9485461, 1, 0, 0, 1, 1,
-2.608604, 1.6525, -1.194233, 1, 0, 0, 1, 1,
-2.591482, -1.464073, -2.527976, 1, 0, 0, 1, 1,
-2.577801, -1.157983, -1.798844, 0, 0, 0, 1, 1,
-2.561656, -0.2578981, -0.7436064, 0, 0, 0, 1, 1,
-2.505058, -0.1210878, -2.363272, 0, 0, 0, 1, 1,
-2.478191, 0.3383755, -0.9233006, 0, 0, 0, 1, 1,
-2.4399, 1.859332, -0.3800701, 0, 0, 0, 1, 1,
-2.390372, -0.221378, -2.72067, 0, 0, 0, 1, 1,
-2.386602, 2.033386, -1.159445, 0, 0, 0, 1, 1,
-2.364467, 0.5688195, -3.219127, 1, 1, 1, 1, 1,
-2.348832, 1.059752, -1.574655, 1, 1, 1, 1, 1,
-2.293718, -0.1801669, -0.7822462, 1, 1, 1, 1, 1,
-2.260119, -0.01898115, -1.963093, 1, 1, 1, 1, 1,
-2.240568, 0.9867259, -0.9445888, 1, 1, 1, 1, 1,
-2.214873, -0.1351266, -1.500831, 1, 1, 1, 1, 1,
-2.200935, 1.32696, 0.5351825, 1, 1, 1, 1, 1,
-2.200673, 0.3375607, -1.497283, 1, 1, 1, 1, 1,
-2.193789, -0.2963523, -0.9310898, 1, 1, 1, 1, 1,
-2.168515, 0.9209385, -0.8084828, 1, 1, 1, 1, 1,
-2.163028, 0.6483808, -1.20831, 1, 1, 1, 1, 1,
-2.146312, -0.01735162, -2.121673, 1, 1, 1, 1, 1,
-2.110242, -1.494376, -1.991911, 1, 1, 1, 1, 1,
-2.101891, -0.9063731, -1.133245, 1, 1, 1, 1, 1,
-2.092551, -0.1058483, -3.571658, 1, 1, 1, 1, 1,
-2.092216, 0.7777905, -0.8667567, 0, 0, 1, 1, 1,
-2.089405, 0.2891292, -1.721231, 1, 0, 0, 1, 1,
-2.072033, -0.08099697, -2.586173, 1, 0, 0, 1, 1,
-2.050962, 2.261542, -1.260336, 1, 0, 0, 1, 1,
-2.024365, -0.5900617, -1.067658, 1, 0, 0, 1, 1,
-2.017792, -1.226083, -1.797357, 1, 0, 0, 1, 1,
-2.007053, 1.92951, 0.3214394, 0, 0, 0, 1, 1,
-2.006875, 0.8266237, 0.06248575, 0, 0, 0, 1, 1,
-2.002702, -1.746666, -2.332819, 0, 0, 0, 1, 1,
-1.939854, 0.4569609, 0.26107, 0, 0, 0, 1, 1,
-1.931235, 1.065996, -2.296621, 0, 0, 0, 1, 1,
-1.91893, 0.5351889, -0.4982594, 0, 0, 0, 1, 1,
-1.910408, -0.6170115, -0.5683066, 0, 0, 0, 1, 1,
-1.904623, 0.2038686, -2.303091, 1, 1, 1, 1, 1,
-1.893862, -0.09511301, -3.32346, 1, 1, 1, 1, 1,
-1.860266, 2.60069, -1.447201, 1, 1, 1, 1, 1,
-1.838324, 0.6893524, -3.060992, 1, 1, 1, 1, 1,
-1.833339, 0.02568576, -0.5687247, 1, 1, 1, 1, 1,
-1.831108, -0.1707268, -1.583395, 1, 1, 1, 1, 1,
-1.822634, 0.585205, 0.6685091, 1, 1, 1, 1, 1,
-1.819239, -0.3018672, -1.574348, 1, 1, 1, 1, 1,
-1.818507, 0.4019201, -2.495133, 1, 1, 1, 1, 1,
-1.806363, -1.066152, -2.563084, 1, 1, 1, 1, 1,
-1.768312, -0.124603, 0.2141011, 1, 1, 1, 1, 1,
-1.751917, 1.184954, -1.518215, 1, 1, 1, 1, 1,
-1.7479, -0.5215348, -1.19487, 1, 1, 1, 1, 1,
-1.734592, 0.3379443, -0.8023415, 1, 1, 1, 1, 1,
-1.732703, -0.5009156, -2.775219, 1, 1, 1, 1, 1,
-1.72125, -0.840687, -2.602192, 0, 0, 1, 1, 1,
-1.720814, 0.4770939, 0.7739423, 1, 0, 0, 1, 1,
-1.718616, -0.7774358, -0.1135311, 1, 0, 0, 1, 1,
-1.703837, 1.440001, -0.3995814, 1, 0, 0, 1, 1,
-1.70103, 0.8032969, 0.04613559, 1, 0, 0, 1, 1,
-1.692917, 2.027389, -0.7525547, 1, 0, 0, 1, 1,
-1.692045, 0.2111453, -0.8019984, 0, 0, 0, 1, 1,
-1.690714, -1.520414, -2.499862, 0, 0, 0, 1, 1,
-1.690436, 1.386333, -1.614671, 0, 0, 0, 1, 1,
-1.673832, 1.308764, -0.9687574, 0, 0, 0, 1, 1,
-1.645289, -1.03909, -3.067424, 0, 0, 0, 1, 1,
-1.642205, -0.1043905, -1.034231, 0, 0, 0, 1, 1,
-1.627427, -0.183531, -1.772733, 0, 0, 0, 1, 1,
-1.613553, 0.1140808, -3.237525, 1, 1, 1, 1, 1,
-1.613225, 1.064523, -2.17007, 1, 1, 1, 1, 1,
-1.607133, 2.035247, -2.345356, 1, 1, 1, 1, 1,
-1.604726, -1.890688, -1.888795, 1, 1, 1, 1, 1,
-1.580418, -0.2414516, -1.559838, 1, 1, 1, 1, 1,
-1.576637, 0.9947463, -0.8570421, 1, 1, 1, 1, 1,
-1.573773, 1.635019, -0.7294509, 1, 1, 1, 1, 1,
-1.569875, 0.5944973, -3.112332, 1, 1, 1, 1, 1,
-1.567357, 0.1869396, -1.605416, 1, 1, 1, 1, 1,
-1.562852, -0.3789329, -1.663573, 1, 1, 1, 1, 1,
-1.562773, 2.757715, -2.132427, 1, 1, 1, 1, 1,
-1.554217, 0.6053532, -1.945674, 1, 1, 1, 1, 1,
-1.541413, 0.903643, -0.3078767, 1, 1, 1, 1, 1,
-1.534234, -0.1228768, -2.34845, 1, 1, 1, 1, 1,
-1.533493, 0.04989168, -1.545495, 1, 1, 1, 1, 1,
-1.521961, 0.3200569, -0.6931087, 0, 0, 1, 1, 1,
-1.509129, -0.8292034, 0.2910035, 1, 0, 0, 1, 1,
-1.507276, -0.0383019, -1.409676, 1, 0, 0, 1, 1,
-1.505351, -1.456138, -1.669637, 1, 0, 0, 1, 1,
-1.496356, 1.868719, -0.4636458, 1, 0, 0, 1, 1,
-1.489835, 0.7688319, -1.05275, 1, 0, 0, 1, 1,
-1.470522, 0.3091151, -1.853675, 0, 0, 0, 1, 1,
-1.465847, -0.9104756, -1.966104, 0, 0, 0, 1, 1,
-1.455884, 0.5326995, 0.5323695, 0, 0, 0, 1, 1,
-1.41617, -1.402771, -3.687812, 0, 0, 0, 1, 1,
-1.4127, -1.417172, -2.422912, 0, 0, 0, 1, 1,
-1.411326, 1.31231, -0.4190274, 0, 0, 0, 1, 1,
-1.409747, -0.02596666, -1.174034, 0, 0, 0, 1, 1,
-1.399981, 1.425944, -1.964021, 1, 1, 1, 1, 1,
-1.394712, -0.4891663, -2.565729, 1, 1, 1, 1, 1,
-1.392901, -0.2588189, -2.505733, 1, 1, 1, 1, 1,
-1.370691, 0.6798512, 0.8269453, 1, 1, 1, 1, 1,
-1.341639, 0.161202, -1.61077, 1, 1, 1, 1, 1,
-1.336643, 0.7331578, 0.7608857, 1, 1, 1, 1, 1,
-1.333997, 0.1549854, -1.243402, 1, 1, 1, 1, 1,
-1.33353, 0.1140413, -2.025077, 1, 1, 1, 1, 1,
-1.332637, 0.5844423, -1.774926, 1, 1, 1, 1, 1,
-1.331485, -0.3308076, -2.689176, 1, 1, 1, 1, 1,
-1.330826, -0.3339202, -1.711354, 1, 1, 1, 1, 1,
-1.327828, 0.2305184, -1.348773, 1, 1, 1, 1, 1,
-1.310805, 0.5728868, 0.4980721, 1, 1, 1, 1, 1,
-1.300342, 0.5033845, -0.1911062, 1, 1, 1, 1, 1,
-1.294677, 1.219993, -0.414393, 1, 1, 1, 1, 1,
-1.293155, -0.9148567, -2.381368, 0, 0, 1, 1, 1,
-1.290447, 0.9125201, -1.170561, 1, 0, 0, 1, 1,
-1.285265, 0.5707681, -1.183437, 1, 0, 0, 1, 1,
-1.280011, 0.9160855, -1.103766, 1, 0, 0, 1, 1,
-1.266704, -0.582666, -3.274736, 1, 0, 0, 1, 1,
-1.253503, 2.862916, -0.8723425, 1, 0, 0, 1, 1,
-1.251975, 0.9857285, -1.912235, 0, 0, 0, 1, 1,
-1.242692, 0.443379, -0.002504952, 0, 0, 0, 1, 1,
-1.241836, 0.4389395, -1.375826, 0, 0, 0, 1, 1,
-1.236376, -2.631865, -0.2521903, 0, 0, 0, 1, 1,
-1.235774, -0.6317232, -0.5805355, 0, 0, 0, 1, 1,
-1.235103, -0.7446465, -0.5699702, 0, 0, 0, 1, 1,
-1.220721, 1.521457, 0.7003278, 0, 0, 0, 1, 1,
-1.216287, -0.4003525, -2.569485, 1, 1, 1, 1, 1,
-1.206849, 0.2627368, -1.964687, 1, 1, 1, 1, 1,
-1.198811, 1.518985, -1.226256, 1, 1, 1, 1, 1,
-1.19556, -2.207044, -3.908908, 1, 1, 1, 1, 1,
-1.193142, -0.1437608, -2.297469, 1, 1, 1, 1, 1,
-1.183628, 1.57239, 1.060109, 1, 1, 1, 1, 1,
-1.17762, 0.2273712, -2.14248, 1, 1, 1, 1, 1,
-1.17212, -0.6969375, -0.6278008, 1, 1, 1, 1, 1,
-1.171952, -0.04948342, -0.7382966, 1, 1, 1, 1, 1,
-1.171767, -0.4554153, -1.946235, 1, 1, 1, 1, 1,
-1.167346, 0.265433, -1.979439, 1, 1, 1, 1, 1,
-1.165364, -0.1711915, 0.02880189, 1, 1, 1, 1, 1,
-1.163827, -1.620739, -1.40511, 1, 1, 1, 1, 1,
-1.159766, 0.8371217, -0.6670284, 1, 1, 1, 1, 1,
-1.145234, -1.033816, -2.011689, 1, 1, 1, 1, 1,
-1.141485, 0.4510158, -1.554354, 0, 0, 1, 1, 1,
-1.137563, -0.7188849, -1.276176, 1, 0, 0, 1, 1,
-1.133795, -0.1600763, -2.790531, 1, 0, 0, 1, 1,
-1.130263, 0.6976601, -1.628961, 1, 0, 0, 1, 1,
-1.127541, 0.2239531, -0.9197795, 1, 0, 0, 1, 1,
-1.12343, -0.2572155, -1.546498, 1, 0, 0, 1, 1,
-1.121946, -1.446093, -2.993504, 0, 0, 0, 1, 1,
-1.120792, -0.6287326, 0.04198893, 0, 0, 0, 1, 1,
-1.118728, 2.372227, -0.03041796, 0, 0, 0, 1, 1,
-1.115939, 0.004603902, -1.755091, 0, 0, 0, 1, 1,
-1.11104, -0.1850929, -2.320776, 0, 0, 0, 1, 1,
-1.108931, 0.02992706, 1.005126, 0, 0, 0, 1, 1,
-1.104522, 1.50568, -1.433349, 0, 0, 0, 1, 1,
-1.103144, 2.013392, -0.5406277, 1, 1, 1, 1, 1,
-1.09888, 0.8615091, -1.48128, 1, 1, 1, 1, 1,
-1.096975, 0.1245502, 0.07815111, 1, 1, 1, 1, 1,
-1.095347, 0.3364292, -1.14603, 1, 1, 1, 1, 1,
-1.094439, -0.8739293, -2.795456, 1, 1, 1, 1, 1,
-1.094346, 0.1504289, -3.773367, 1, 1, 1, 1, 1,
-1.088781, 2.199189, 0.6295353, 1, 1, 1, 1, 1,
-1.085021, -1.092972, -2.631989, 1, 1, 1, 1, 1,
-1.082947, 0.4519017, -2.480128, 1, 1, 1, 1, 1,
-1.082159, -0.243083, -0.8911899, 1, 1, 1, 1, 1,
-1.066249, 0.7347713, -0.8343608, 1, 1, 1, 1, 1,
-1.063774, 0.8599813, -0.5564478, 1, 1, 1, 1, 1,
-1.059577, -0.1371449, -1.444776, 1, 1, 1, 1, 1,
-1.058307, 0.3432911, -2.281013, 1, 1, 1, 1, 1,
-1.053672, -0.04176565, -0.1202335, 1, 1, 1, 1, 1,
-1.051973, -1.283473, -4.899337, 0, 0, 1, 1, 1,
-1.050606, 0.7603823, -1.986759, 1, 0, 0, 1, 1,
-1.035262, -0.3617823, -0.09213606, 1, 0, 0, 1, 1,
-1.033764, 0.4921505, -0.233213, 1, 0, 0, 1, 1,
-1.031956, 0.3815191, -0.5061933, 1, 0, 0, 1, 1,
-1.026999, 0.9868092, 0.5993237, 1, 0, 0, 1, 1,
-1.022814, 1.186641, -1.001394, 0, 0, 0, 1, 1,
-1.000044, -0.09083934, -2.002419, 0, 0, 0, 1, 1,
-0.9959791, -0.4573555, -2.727928, 0, 0, 0, 1, 1,
-0.9939868, -0.06511141, -1.678968, 0, 0, 0, 1, 1,
-0.9857137, 0.9836524, 1.281473, 0, 0, 0, 1, 1,
-0.9853988, 0.6790906, -1.103549, 0, 0, 0, 1, 1,
-0.9713025, 0.827858, -1.631427, 0, 0, 0, 1, 1,
-0.9694561, -0.1194197, -2.502887, 1, 1, 1, 1, 1,
-0.965064, 1.376179, -2.620394, 1, 1, 1, 1, 1,
-0.964623, 0.3210147, -1.542828, 1, 1, 1, 1, 1,
-0.9641123, -1.021497, -2.158959, 1, 1, 1, 1, 1,
-0.9611339, -0.05748849, 0.1761107, 1, 1, 1, 1, 1,
-0.9564689, 1.034318, -0.765346, 1, 1, 1, 1, 1,
-0.9558093, -0.5977034, -2.845114, 1, 1, 1, 1, 1,
-0.9541787, -0.3210871, -2.348285, 1, 1, 1, 1, 1,
-0.9514897, -1.533224, -2.54685, 1, 1, 1, 1, 1,
-0.9455441, 0.2218946, -1.536757, 1, 1, 1, 1, 1,
-0.9449716, 2.472122, -1.182036, 1, 1, 1, 1, 1,
-0.9407328, -1.518983, -2.364149, 1, 1, 1, 1, 1,
-0.9376293, -0.7519827, -2.708371, 1, 1, 1, 1, 1,
-0.9366157, 1.244582, -2.344192, 1, 1, 1, 1, 1,
-0.9365401, -0.2035429, -3.054842, 1, 1, 1, 1, 1,
-0.9337965, 0.2457141, -2.992171, 0, 0, 1, 1, 1,
-0.9331418, 1.098986, -2.0262, 1, 0, 0, 1, 1,
-0.9259217, 0.1992522, -1.225607, 1, 0, 0, 1, 1,
-0.9061209, -0.6165606, -2.179548, 1, 0, 0, 1, 1,
-0.9005409, -0.1089899, -1.06098, 1, 0, 0, 1, 1,
-0.8999088, -0.4738882, -0.7900311, 1, 0, 0, 1, 1,
-0.8984739, 0.2713387, 1.941804, 0, 0, 0, 1, 1,
-0.8976113, -0.1609079, -2.520576, 0, 0, 0, 1, 1,
-0.8965998, -1.008009, -3.910481, 0, 0, 0, 1, 1,
-0.8851262, -0.9492527, -1.03913, 0, 0, 0, 1, 1,
-0.8810555, -0.6610797, -0.7090183, 0, 0, 0, 1, 1,
-0.8739755, 1.307051, -1.183082, 0, 0, 0, 1, 1,
-0.8663566, -0.1840457, -1.610806, 0, 0, 0, 1, 1,
-0.8651109, 1.698494, -0.8677215, 1, 1, 1, 1, 1,
-0.8645136, 0.02402052, -0.3546055, 1, 1, 1, 1, 1,
-0.8626257, -0.3410088, -1.470685, 1, 1, 1, 1, 1,
-0.8603449, -1.25981, -2.288807, 1, 1, 1, 1, 1,
-0.8467141, 0.1530166, -0.5523087, 1, 1, 1, 1, 1,
-0.8383796, -0.5770773, -1.55962, 1, 1, 1, 1, 1,
-0.8382612, -0.9415314, -2.414078, 1, 1, 1, 1, 1,
-0.8211985, 0.180731, -1.903489, 1, 1, 1, 1, 1,
-0.8169026, -0.8647068, -2.502417, 1, 1, 1, 1, 1,
-0.8161313, 0.162528, -3.377908, 1, 1, 1, 1, 1,
-0.8105407, 0.5561247, 1.165298, 1, 1, 1, 1, 1,
-0.7996109, 1.270353, -1.225171, 1, 1, 1, 1, 1,
-0.7986285, 1.559739, -1.202573, 1, 1, 1, 1, 1,
-0.7929556, 0.04690951, -0.3139178, 1, 1, 1, 1, 1,
-0.7922195, 0.03848829, -2.369066, 1, 1, 1, 1, 1,
-0.7846479, 1.345226, -0.9474486, 0, 0, 1, 1, 1,
-0.7753906, -0.741735, -3.040442, 1, 0, 0, 1, 1,
-0.7744317, 0.09066209, -2.44556, 1, 0, 0, 1, 1,
-0.765328, 0.476842, -0.04538236, 1, 0, 0, 1, 1,
-0.7605671, -1.374601, -1.795343, 1, 0, 0, 1, 1,
-0.7583485, -1.225673, -2.718496, 1, 0, 0, 1, 1,
-0.7561852, 0.4549046, -3.198057, 0, 0, 0, 1, 1,
-0.7467768, 1.113924, -1.002057, 0, 0, 0, 1, 1,
-0.7409996, -0.09162124, -2.290185, 0, 0, 0, 1, 1,
-0.7400349, -0.805249, -3.825618, 0, 0, 0, 1, 1,
-0.7370489, -0.2932622, -0.6397756, 0, 0, 0, 1, 1,
-0.7368734, -0.2917793, -1.997077, 0, 0, 0, 1, 1,
-0.7353838, 0.2193953, -2.330628, 0, 0, 0, 1, 1,
-0.7329661, -1.045559, -1.239959, 1, 1, 1, 1, 1,
-0.7326536, 0.07007947, -1.482806, 1, 1, 1, 1, 1,
-0.7320886, -0.991552, -4.098418, 1, 1, 1, 1, 1,
-0.7287478, 0.4459389, -1.478767, 1, 1, 1, 1, 1,
-0.7245511, 1.340065, -1.283066, 1, 1, 1, 1, 1,
-0.7232988, -2.231897, -2.86984, 1, 1, 1, 1, 1,
-0.7205563, -1.199843, -3.073968, 1, 1, 1, 1, 1,
-0.7190653, -0.5107143, -1.380572, 1, 1, 1, 1, 1,
-0.7183822, 0.9299262, -0.912505, 1, 1, 1, 1, 1,
-0.7176559, -0.57134, -3.211186, 1, 1, 1, 1, 1,
-0.7110628, 0.7746202, 1.230662, 1, 1, 1, 1, 1,
-0.7097745, -0.4626555, -2.646544, 1, 1, 1, 1, 1,
-0.7060831, 0.4141286, -0.3402817, 1, 1, 1, 1, 1,
-0.7030352, -0.961364, -1.728166, 1, 1, 1, 1, 1,
-0.6986681, -0.6976075, -0.1731303, 1, 1, 1, 1, 1,
-0.6953445, 2.182614, -0.3392201, 0, 0, 1, 1, 1,
-0.6910347, 2.155457, -2.554984, 1, 0, 0, 1, 1,
-0.6846192, 0.7412362, 0.676492, 1, 0, 0, 1, 1,
-0.6834334, 0.481164, -0.01910987, 1, 0, 0, 1, 1,
-0.6825629, 0.03742572, -1.698855, 1, 0, 0, 1, 1,
-0.6780174, 1.218865, 0.5741656, 1, 0, 0, 1, 1,
-0.6743283, 1.748586, 0.1030821, 0, 0, 0, 1, 1,
-0.6709787, 0.83867, -1.559624, 0, 0, 0, 1, 1,
-0.6703205, 0.2922806, 0.06562613, 0, 0, 0, 1, 1,
-0.6697098, -0.06517207, -2.831127, 0, 0, 0, 1, 1,
-0.6662486, -0.8989019, -1.834571, 0, 0, 0, 1, 1,
-0.6640674, -0.8182582, -1.028789, 0, 0, 0, 1, 1,
-0.6614293, 1.451445, -0.6207898, 0, 0, 0, 1, 1,
-0.6539173, -1.0832, -1.725709, 1, 1, 1, 1, 1,
-0.6535154, 1.362653, -0.4552699, 1, 1, 1, 1, 1,
-0.6530817, -0.4185333, -2.558641, 1, 1, 1, 1, 1,
-0.652323, 0.8009619, 1.787275, 1, 1, 1, 1, 1,
-0.6474726, -1.036634, -3.637361, 1, 1, 1, 1, 1,
-0.6465666, 0.5847259, -1.912382, 1, 1, 1, 1, 1,
-0.644951, -0.03259204, -2.803297, 1, 1, 1, 1, 1,
-0.6449437, 0.4241869, -2.355896, 1, 1, 1, 1, 1,
-0.6415271, 0.05858113, -2.488897, 1, 1, 1, 1, 1,
-0.6373996, -0.9307696, -2.958431, 1, 1, 1, 1, 1,
-0.6372198, -0.6006346, -1.297384, 1, 1, 1, 1, 1,
-0.6347051, -0.3080885, -1.587138, 1, 1, 1, 1, 1,
-0.5988597, -0.04153088, -1.731454, 1, 1, 1, 1, 1,
-0.5919744, -0.3523122, -2.734652, 1, 1, 1, 1, 1,
-0.5911574, -0.8183518, -0.5932887, 1, 1, 1, 1, 1,
-0.5885691, -0.1014666, -1.075106, 0, 0, 1, 1, 1,
-0.5802578, -0.4697751, -0.8231667, 1, 0, 0, 1, 1,
-0.5801983, -1.62582, -2.189746, 1, 0, 0, 1, 1,
-0.5746492, -0.6762471, -3.740903, 1, 0, 0, 1, 1,
-0.5720718, 0.1627874, -0.5996801, 1, 0, 0, 1, 1,
-0.5700517, 0.2068347, -2.589563, 1, 0, 0, 1, 1,
-0.5684421, 0.5807646, -0.9769065, 0, 0, 0, 1, 1,
-0.5658449, -0.3069852, -2.924054, 0, 0, 0, 1, 1,
-0.5545641, -1.49673, -3.546733, 0, 0, 0, 1, 1,
-0.5451403, 0.8545596, -1.396693, 0, 0, 0, 1, 1,
-0.5432355, 1.342028, -0.7736157, 0, 0, 0, 1, 1,
-0.5335755, 1.439428, -0.1143732, 0, 0, 0, 1, 1,
-0.5319294, -2.788999, -1.501464, 0, 0, 0, 1, 1,
-0.5278829, -1.129576, -1.387807, 1, 1, 1, 1, 1,
-0.527427, 0.2982313, -1.456074, 1, 1, 1, 1, 1,
-0.526584, 0.4416196, -1.106545, 1, 1, 1, 1, 1,
-0.5227023, 1.017034, 0.3772071, 1, 1, 1, 1, 1,
-0.5212547, -0.4274273, -1.788764, 1, 1, 1, 1, 1,
-0.5195744, -0.5355741, -1.698374, 1, 1, 1, 1, 1,
-0.5174574, -1.405321, -2.890123, 1, 1, 1, 1, 1,
-0.5162882, -0.356449, -2.730925, 1, 1, 1, 1, 1,
-0.5080266, 1.118009, -0.3274035, 1, 1, 1, 1, 1,
-0.5035649, 0.2743933, 0.3538261, 1, 1, 1, 1, 1,
-0.5024099, -0.9142628, -1.889912, 1, 1, 1, 1, 1,
-0.5015678, -0.3408665, -0.712349, 1, 1, 1, 1, 1,
-0.5002409, 1.189856, -0.2124578, 1, 1, 1, 1, 1,
-0.4993079, -1.185656, -4.753102, 1, 1, 1, 1, 1,
-0.4978181, -0.3130523, -2.336412, 1, 1, 1, 1, 1,
-0.4977276, 0.897924, 0.6938241, 0, 0, 1, 1, 1,
-0.4894383, -0.1883936, -2.589477, 1, 0, 0, 1, 1,
-0.4883218, 0.0170203, -0.6093233, 1, 0, 0, 1, 1,
-0.4850862, -1.838072, -3.249209, 1, 0, 0, 1, 1,
-0.4810076, 1.71407, 0.02761339, 1, 0, 0, 1, 1,
-0.4786882, 0.9323089, -1.953144, 1, 0, 0, 1, 1,
-0.4786802, 0.1617129, -1.441812, 0, 0, 0, 1, 1,
-0.471642, -1.191197, -3.664305, 0, 0, 0, 1, 1,
-0.471165, -0.887308, -4.553958, 0, 0, 0, 1, 1,
-0.4701461, 0.9355687, -1.260825, 0, 0, 0, 1, 1,
-0.4681709, -0.2261872, -0.1170036, 0, 0, 0, 1, 1,
-0.4626792, 0.9980118, 0.1878253, 0, 0, 0, 1, 1,
-0.4585474, 1.771919, -0.07407417, 0, 0, 0, 1, 1,
-0.4573898, -0.6843512, -1.136412, 1, 1, 1, 1, 1,
-0.4570205, 0.53833, 0.7653332, 1, 1, 1, 1, 1,
-0.4556092, -0.421207, -2.112169, 1, 1, 1, 1, 1,
-0.4543917, -0.6763892, -1.259575, 1, 1, 1, 1, 1,
-0.4543715, 0.3660581, 0.9410184, 1, 1, 1, 1, 1,
-0.4490053, -0.7595562, -2.747349, 1, 1, 1, 1, 1,
-0.4486487, 0.04236866, -1.465772, 1, 1, 1, 1, 1,
-0.4422571, -2.016906, -3.580659, 1, 1, 1, 1, 1,
-0.4403402, 0.06419176, -0.611967, 1, 1, 1, 1, 1,
-0.4378432, -1.465182, -3.151929, 1, 1, 1, 1, 1,
-0.4357863, -0.2693403, -2.564665, 1, 1, 1, 1, 1,
-0.4355421, 1.595024, -0.3909443, 1, 1, 1, 1, 1,
-0.4354447, 0.3658167, -0.4481902, 1, 1, 1, 1, 1,
-0.4287334, -0.140828, -2.160352, 1, 1, 1, 1, 1,
-0.4231201, 0.8809845, 0.4087064, 1, 1, 1, 1, 1,
-0.4227688, 0.2329939, -1.14392, 0, 0, 1, 1, 1,
-0.4219344, 0.7989087, -1.045952, 1, 0, 0, 1, 1,
-0.4157282, 0.2540152, 0.1496894, 1, 0, 0, 1, 1,
-0.4140914, -0.9855381, -4.96224, 1, 0, 0, 1, 1,
-0.4076699, 0.3691193, -0.6386314, 1, 0, 0, 1, 1,
-0.4076283, 1.108595, -0.1798103, 1, 0, 0, 1, 1,
-0.4013428, -0.5178287, -3.356749, 0, 0, 0, 1, 1,
-0.3996513, 0.9397257, -1.253277, 0, 0, 0, 1, 1,
-0.3986861, -0.9911268, -1.191678, 0, 0, 0, 1, 1,
-0.3957668, 1.694685, 1.610936, 0, 0, 0, 1, 1,
-0.3901066, -1.193146, -4.252485, 0, 0, 0, 1, 1,
-0.3892861, 0.5612519, 0.4413992, 0, 0, 0, 1, 1,
-0.3859182, -1.332555, -5.280742, 0, 0, 0, 1, 1,
-0.3829511, 0.621728, -0.775962, 1, 1, 1, 1, 1,
-0.3792538, -1.184922, -3.098554, 1, 1, 1, 1, 1,
-0.3776791, -0.4348775, -3.864851, 1, 1, 1, 1, 1,
-0.376835, 0.625863, 0.01473524, 1, 1, 1, 1, 1,
-0.3725022, 0.7970226, -0.3352567, 1, 1, 1, 1, 1,
-0.3713044, 0.5367347, 0.1297961, 1, 1, 1, 1, 1,
-0.3671106, -0.6817504, -2.772755, 1, 1, 1, 1, 1,
-0.3576551, 0.1462106, -2.72512, 1, 1, 1, 1, 1,
-0.3562483, 0.8034307, 0.1550861, 1, 1, 1, 1, 1,
-0.3562465, -0.04211969, -2.566358, 1, 1, 1, 1, 1,
-0.3541778, 0.6938486, -1.55977, 1, 1, 1, 1, 1,
-0.3508646, -0.2120596, -1.388814, 1, 1, 1, 1, 1,
-0.3502084, 1.346004, 0.7060071, 1, 1, 1, 1, 1,
-0.3417623, 0.4403971, -0.388817, 1, 1, 1, 1, 1,
-0.341005, -1.722379, -2.019363, 1, 1, 1, 1, 1,
-0.3385101, 2.424885, -0.9716244, 0, 0, 1, 1, 1,
-0.336649, 0.2793981, -1.173817, 1, 0, 0, 1, 1,
-0.3365197, -0.9736224, -2.607699, 1, 0, 0, 1, 1,
-0.3340904, -1.150121, -2.092541, 1, 0, 0, 1, 1,
-0.3337642, -0.7960154, -3.541517, 1, 0, 0, 1, 1,
-0.3256117, 1.642291, -1.125649, 1, 0, 0, 1, 1,
-0.3251741, -0.6475022, -2.720276, 0, 0, 0, 1, 1,
-0.3250755, 0.3188375, -0.4586221, 0, 0, 0, 1, 1,
-0.3238108, -0.1147447, -1.316854, 0, 0, 0, 1, 1,
-0.3227094, 0.1639092, 0.02552112, 0, 0, 0, 1, 1,
-0.3226225, -0.6322744, -1.452847, 0, 0, 0, 1, 1,
-0.3209146, -1.6258, -3.317333, 0, 0, 0, 1, 1,
-0.3161269, 0.06818467, -0.6406143, 0, 0, 0, 1, 1,
-0.314174, 0.2119736, -2.316627, 1, 1, 1, 1, 1,
-0.3115453, 1.081378, 0.1600459, 1, 1, 1, 1, 1,
-0.3065192, 0.419163, -3.144382, 1, 1, 1, 1, 1,
-0.3019091, -0.1095728, -1.403255, 1, 1, 1, 1, 1,
-0.3009919, -0.08566121, -1.19172, 1, 1, 1, 1, 1,
-0.2941649, -0.007285506, -3.362993, 1, 1, 1, 1, 1,
-0.2906712, 0.8516904, 0.9446096, 1, 1, 1, 1, 1,
-0.2877126, 2.477246, -1.397476, 1, 1, 1, 1, 1,
-0.2873847, 0.7383646, -1.139065, 1, 1, 1, 1, 1,
-0.2856562, 0.1094125, -1.496279, 1, 1, 1, 1, 1,
-0.2829857, -0.2347392, -0.8840068, 1, 1, 1, 1, 1,
-0.2799942, 0.6202313, -0.6857755, 1, 1, 1, 1, 1,
-0.2787814, -0.249875, -0.9138314, 1, 1, 1, 1, 1,
-0.2785024, 0.1150411, -1.732325, 1, 1, 1, 1, 1,
-0.2774267, 0.3498199, -2.223554, 1, 1, 1, 1, 1,
-0.2694287, 1.745402, -0.02901247, 0, 0, 1, 1, 1,
-0.2659678, 1.779082, 0.0333297, 1, 0, 0, 1, 1,
-0.2653437, -0.5607885, -1.973558, 1, 0, 0, 1, 1,
-0.2595524, -0.5635505, -5.143688, 1, 0, 0, 1, 1,
-0.2568569, -0.338563, -3.847163, 1, 0, 0, 1, 1,
-0.2562778, 1.725785, -0.4098632, 1, 0, 0, 1, 1,
-0.2541541, 0.4368845, 1.365998, 0, 0, 0, 1, 1,
-0.2478635, -0.9035243, -2.643129, 0, 0, 0, 1, 1,
-0.2478384, 0.1335456, -2.743161, 0, 0, 0, 1, 1,
-0.2462377, -1.171096, -0.7948429, 0, 0, 0, 1, 1,
-0.2449004, -1.405204, -5.178409, 0, 0, 0, 1, 1,
-0.2437226, -0.9588346, -1.902324, 0, 0, 0, 1, 1,
-0.2432498, 0.09508394, -1.61879, 0, 0, 0, 1, 1,
-0.2417686, 1.916237, -0.3366137, 1, 1, 1, 1, 1,
-0.2389926, -0.7541179, -1.759654, 1, 1, 1, 1, 1,
-0.2367992, -1.042439, -3.465125, 1, 1, 1, 1, 1,
-0.2358966, -0.2619223, -2.370287, 1, 1, 1, 1, 1,
-0.2346593, -0.9618129, -2.522074, 1, 1, 1, 1, 1,
-0.231303, -0.7262982, -4.529853, 1, 1, 1, 1, 1,
-0.2312384, -0.9544242, -2.797284, 1, 1, 1, 1, 1,
-0.2304009, 0.7755514, 2.379617, 1, 1, 1, 1, 1,
-0.229279, 0.05153775, 0.6430097, 1, 1, 1, 1, 1,
-0.2234793, 1.434381, -0.6513487, 1, 1, 1, 1, 1,
-0.2224888, -0.06368019, -1.960599, 1, 1, 1, 1, 1,
-0.2203923, -0.00383262, -2.288037, 1, 1, 1, 1, 1,
-0.2190283, 0.3138412, -1.953487, 1, 1, 1, 1, 1,
-0.2188405, -0.2584792, -1.940967, 1, 1, 1, 1, 1,
-0.218642, -0.1748554, -4.112276, 1, 1, 1, 1, 1,
-0.2183556, -1.006958, -2.930915, 0, 0, 1, 1, 1,
-0.2179425, -0.3046265, -4.432656, 1, 0, 0, 1, 1,
-0.2079871, -0.5880094, -2.68945, 1, 0, 0, 1, 1,
-0.2068343, -0.7682348, -5.214162, 1, 0, 0, 1, 1,
-0.2050767, -0.1558311, -3.007757, 1, 0, 0, 1, 1,
-0.2043992, 0.8940517, -1.581322, 1, 0, 0, 1, 1,
-0.2028754, -0.9584875, -3.293808, 0, 0, 0, 1, 1,
-0.1982228, 0.9513543, 0.5416201, 0, 0, 0, 1, 1,
-0.1980311, -2.058867, -3.372801, 0, 0, 0, 1, 1,
-0.1964454, 0.5397786, -0.3072194, 0, 0, 0, 1, 1,
-0.1956511, 0.5502808, -0.6249759, 0, 0, 0, 1, 1,
-0.1948105, -0.4096669, -1.334869, 0, 0, 0, 1, 1,
-0.1944623, 1.189736, -0.08203633, 0, 0, 0, 1, 1,
-0.194289, 1.030359, 0.6138154, 1, 1, 1, 1, 1,
-0.1936191, 0.3436365, -0.6527295, 1, 1, 1, 1, 1,
-0.1874833, -0.03872864, -2.123479, 1, 1, 1, 1, 1,
-0.1839782, -0.754819, -2.74101, 1, 1, 1, 1, 1,
-0.1795367, 0.03521994, -1.269965, 1, 1, 1, 1, 1,
-0.1790172, -2.268321, -2.329637, 1, 1, 1, 1, 1,
-0.1750826, -0.05499668, -1.855953, 1, 1, 1, 1, 1,
-0.174365, -1.550479, -3.163715, 1, 1, 1, 1, 1,
-0.1723571, -1.451595, -3.344498, 1, 1, 1, 1, 1,
-0.1709253, 0.4190395, -1.182543, 1, 1, 1, 1, 1,
-0.1684553, 0.1715684, -0.9790821, 1, 1, 1, 1, 1,
-0.1652601, 1.022322, -1.575602, 1, 1, 1, 1, 1,
-0.1631249, -0.7281665, -3.625712, 1, 1, 1, 1, 1,
-0.1630053, 0.178017, -2.097952, 1, 1, 1, 1, 1,
-0.1614213, -1.831439, -2.979536, 1, 1, 1, 1, 1,
-0.1605613, -0.304839, -1.742123, 0, 0, 1, 1, 1,
-0.1568448, 0.5203507, -0.08996287, 1, 0, 0, 1, 1,
-0.1556801, 1.082715, -0.2870077, 1, 0, 0, 1, 1,
-0.1536149, 0.9870434, 0.2103545, 1, 0, 0, 1, 1,
-0.1534657, -0.6226445, -4.068591, 1, 0, 0, 1, 1,
-0.1457206, 0.1169249, 0.7956129, 1, 0, 0, 1, 1,
-0.144435, -0.1397883, -1.855344, 0, 0, 0, 1, 1,
-0.1301913, -0.8080456, -3.287224, 0, 0, 0, 1, 1,
-0.1285429, 0.01760851, -1.968726, 0, 0, 0, 1, 1,
-0.1259349, -0.2896679, -3.225262, 0, 0, 0, 1, 1,
-0.1251817, -0.8927179, -0.6970365, 0, 0, 0, 1, 1,
-0.1211355, -0.3669405, -3.055473, 0, 0, 0, 1, 1,
-0.1157514, 1.32758, 0.3615243, 0, 0, 0, 1, 1,
-0.1148588, 2.272222, -1.344676, 1, 1, 1, 1, 1,
-0.1126328, -0.06305432, -3.346699, 1, 1, 1, 1, 1,
-0.1109215, -0.2186437, -3.890137, 1, 1, 1, 1, 1,
-0.1048064, 1.735136, 1.054646, 1, 1, 1, 1, 1,
-0.1047952, 0.2000448, -0.1811582, 1, 1, 1, 1, 1,
-0.1034121, -0.4666997, -2.637848, 1, 1, 1, 1, 1,
-0.09911087, 0.01317737, -0.5773163, 1, 1, 1, 1, 1,
-0.09835461, -1.689663, -3.221711, 1, 1, 1, 1, 1,
-0.09441464, 0.2628638, 1.402256, 1, 1, 1, 1, 1,
-0.09367148, 0.02050219, -2.749057, 1, 1, 1, 1, 1,
-0.09341753, 0.139552, -0.1542285, 1, 1, 1, 1, 1,
-0.0911255, 0.1109836, -2.383159, 1, 1, 1, 1, 1,
-0.08849322, -0.5409313, -3.119237, 1, 1, 1, 1, 1,
-0.08811408, -0.2381798, -2.347714, 1, 1, 1, 1, 1,
-0.08649376, 0.7813038, -0.545423, 1, 1, 1, 1, 1,
-0.08557925, -0.5452015, -3.777722, 0, 0, 1, 1, 1,
-0.08492183, 0.544118, 0.6282865, 1, 0, 0, 1, 1,
-0.08013255, -1.638359, -4.428077, 1, 0, 0, 1, 1,
-0.07988989, 0.968775, 0.08886191, 1, 0, 0, 1, 1,
-0.07779894, -0.4602557, -1.140732, 1, 0, 0, 1, 1,
-0.07557511, 1.348576, 0.9286867, 1, 0, 0, 1, 1,
-0.07041758, -0.3595661, -1.974044, 0, 0, 0, 1, 1,
-0.06973984, -0.5618095, -2.538317, 0, 0, 0, 1, 1,
-0.06892489, 0.1101387, -2.026166, 0, 0, 0, 1, 1,
-0.05896098, -0.680889, -2.593317, 0, 0, 0, 1, 1,
-0.05505697, 1.149672, 0.3654136, 0, 0, 0, 1, 1,
-0.04938806, 0.01401764, -0.7786814, 0, 0, 0, 1, 1,
-0.04737217, -1.21481, -1.859625, 0, 0, 0, 1, 1,
-0.04276069, 1.164245, -0.3641171, 1, 1, 1, 1, 1,
-0.04246754, 0.790543, 0.03987696, 1, 1, 1, 1, 1,
-0.04177001, 0.479384, -0.2145521, 1, 1, 1, 1, 1,
-0.04107023, 0.9013542, -0.9155248, 1, 1, 1, 1, 1,
-0.04085219, 1.221692, 0.6777867, 1, 1, 1, 1, 1,
-0.04063131, -0.01461083, -2.635293, 1, 1, 1, 1, 1,
-0.04046842, 0.3489339, 0.9904954, 1, 1, 1, 1, 1,
-0.03513254, 0.6519278, -0.02356585, 1, 1, 1, 1, 1,
-0.03315232, -0.2964115, -5.110672, 1, 1, 1, 1, 1,
-0.03303963, 0.2803076, 0.06276096, 1, 1, 1, 1, 1,
-0.03136196, 1.028533, 0.09487274, 1, 1, 1, 1, 1,
-0.0296981, 0.3793725, 1.451016, 1, 1, 1, 1, 1,
-0.02800121, -1.094948, -5.350634, 1, 1, 1, 1, 1,
-0.02775459, 0.176146, -0.1777898, 1, 1, 1, 1, 1,
-0.02679892, 0.7932088, 0.8263052, 1, 1, 1, 1, 1,
-0.0242415, -0.1038125, -2.506012, 0, 0, 1, 1, 1,
-0.02087273, -0.5208726, -1.49334, 1, 0, 0, 1, 1,
-0.01901957, -1.126004, -4.132151, 1, 0, 0, 1, 1,
-0.01895727, -0.06083032, -3.541354, 1, 0, 0, 1, 1,
-0.01817306, 0.007414087, 1.247324, 1, 0, 0, 1, 1,
-0.01775552, 0.5036815, 0.5274174, 1, 0, 0, 1, 1,
-0.01676137, 0.4200681, 2.033923, 0, 0, 0, 1, 1,
-0.01426881, 0.4087594, -1.55793, 0, 0, 0, 1, 1,
-0.01206872, 1.039518, -0.1487588, 0, 0, 0, 1, 1,
-0.01071949, -0.6529953, -3.210021, 0, 0, 0, 1, 1,
-0.009893942, -0.500282, -3.435121, 0, 0, 0, 1, 1,
-0.009223246, 0.03612903, 0.8061298, 0, 0, 0, 1, 1,
-0.006846237, -0.7399611, -4.471241, 0, 0, 0, 1, 1,
-0.004486174, -0.4687943, -4.027201, 1, 1, 1, 1, 1,
0.002769143, 1.683476, 0.7388465, 1, 1, 1, 1, 1,
0.003554781, -0.3411765, 3.317584, 1, 1, 1, 1, 1,
0.006502754, -0.3992861, 3.293386, 1, 1, 1, 1, 1,
0.006650725, -0.5062523, 5.012866, 1, 1, 1, 1, 1,
0.008030781, 0.1340898, 0.5710312, 1, 1, 1, 1, 1,
0.017852, 1.170953, 1.154356, 1, 1, 1, 1, 1,
0.01892143, 0.06568544, 0.2315258, 1, 1, 1, 1, 1,
0.0224576, -0.8289148, 2.210186, 1, 1, 1, 1, 1,
0.02379516, 1.482612, -0.4137897, 1, 1, 1, 1, 1,
0.02489763, -1.630293, 4.120278, 1, 1, 1, 1, 1,
0.03042187, -0.8756765, 4.12581, 1, 1, 1, 1, 1,
0.03523638, -0.4627716, 4.264031, 1, 1, 1, 1, 1,
0.03845927, -0.03939423, 3.578655, 1, 1, 1, 1, 1,
0.03914284, 0.3184035, -1.126965, 1, 1, 1, 1, 1,
0.04508919, -0.2110337, 1.892675, 0, 0, 1, 1, 1,
0.04568759, -1.200978, 0.8766437, 1, 0, 0, 1, 1,
0.04819845, -0.3667531, 2.680861, 1, 0, 0, 1, 1,
0.04899557, 0.07525244, -0.2059734, 1, 0, 0, 1, 1,
0.04992636, -0.1829666, 1.571733, 1, 0, 0, 1, 1,
0.05661156, -1.270434, 4.077249, 1, 0, 0, 1, 1,
0.06376866, -0.4700244, 3.861104, 0, 0, 0, 1, 1,
0.06412661, -0.03590635, 1.192951, 0, 0, 0, 1, 1,
0.06443125, 0.3508128, 0.06732228, 0, 0, 0, 1, 1,
0.06514273, -0.2599684, 2.070298, 0, 0, 0, 1, 1,
0.07004617, -1.132238, 3.183293, 0, 0, 0, 1, 1,
0.08073725, 0.4547589, 0.1827047, 0, 0, 0, 1, 1,
0.08272, -1.305058, 2.976613, 0, 0, 0, 1, 1,
0.08394684, -0.922465, 4.552787, 1, 1, 1, 1, 1,
0.08665313, 0.3378297, 0.04582851, 1, 1, 1, 1, 1,
0.08866006, 1.660063, -0.9495476, 1, 1, 1, 1, 1,
0.08971329, -1.537413, 4.101322, 1, 1, 1, 1, 1,
0.0931589, 0.5669148, 0.03528326, 1, 1, 1, 1, 1,
0.09477749, -1.068706, 3.265893, 1, 1, 1, 1, 1,
0.1021299, 0.3855325, -0.3537615, 1, 1, 1, 1, 1,
0.1066081, -0.5086414, 2.001566, 1, 1, 1, 1, 1,
0.1088657, 0.9348986, 0.1748225, 1, 1, 1, 1, 1,
0.1124458, 0.2392915, -0.8209609, 1, 1, 1, 1, 1,
0.1127881, 1.46267, 0.8477858, 1, 1, 1, 1, 1,
0.1304242, 0.6170374, 0.6052175, 1, 1, 1, 1, 1,
0.1414858, -0.5422502, 2.752563, 1, 1, 1, 1, 1,
0.1441379, -0.3964848, 2.687349, 1, 1, 1, 1, 1,
0.1507574, -0.2282335, 3.202219, 1, 1, 1, 1, 1,
0.1534522, 0.7829848, 1.796094, 0, 0, 1, 1, 1,
0.1559186, -1.729396, 2.11196, 1, 0, 0, 1, 1,
0.1584036, -0.5624545, 1.755649, 1, 0, 0, 1, 1,
0.1596121, -1.526884, 3.509143, 1, 0, 0, 1, 1,
0.1713945, -0.7266747, 1.898171, 1, 0, 0, 1, 1,
0.1739927, -0.40108, 1.657193, 1, 0, 0, 1, 1,
0.1803874, 0.9707175, 2.291177, 0, 0, 0, 1, 1,
0.1814249, -0.5557006, 3.264501, 0, 0, 0, 1, 1,
0.1830256, 1.459063, -1.227078, 0, 0, 0, 1, 1,
0.1837855, 0.5269678, 1.165682, 0, 0, 0, 1, 1,
0.1850732, -2.262577, 4.500438, 0, 0, 0, 1, 1,
0.186812, -0.873617, 3.358101, 0, 0, 0, 1, 1,
0.1874031, 1.741415, -1.011789, 0, 0, 0, 1, 1,
0.1918343, 1.218328, -0.2081091, 1, 1, 1, 1, 1,
0.192517, -0.5553755, 2.562425, 1, 1, 1, 1, 1,
0.1933429, -1.008229, 3.107825, 1, 1, 1, 1, 1,
0.1956409, 0.8102555, -0.3765941, 1, 1, 1, 1, 1,
0.1961251, -0.1925786, 1.228281, 1, 1, 1, 1, 1,
0.1967944, -1.48232, 3.249798, 1, 1, 1, 1, 1,
0.1976284, -2.815671, 3.60048, 1, 1, 1, 1, 1,
0.19763, 0.9022366, 1.528275, 1, 1, 1, 1, 1,
0.1988994, -0.5463773, 2.47704, 1, 1, 1, 1, 1,
0.1990499, -1.007141, 1.753496, 1, 1, 1, 1, 1,
0.2006169, 1.074846, -0.5401646, 1, 1, 1, 1, 1,
0.2006669, -0.4411356, 2.571444, 1, 1, 1, 1, 1,
0.2025788, 1.106073, 1.563606, 1, 1, 1, 1, 1,
0.2028731, -0.4277458, 2.188717, 1, 1, 1, 1, 1,
0.2053967, -1.365988, 2.203647, 1, 1, 1, 1, 1,
0.2062603, -0.4806915, 3.01205, 0, 0, 1, 1, 1,
0.2076759, 1.050679, 0.09430793, 1, 0, 0, 1, 1,
0.213955, 0.8104102, -0.2176726, 1, 0, 0, 1, 1,
0.2199048, -0.4495152, 2.848296, 1, 0, 0, 1, 1,
0.2227684, -1.932279, 2.717656, 1, 0, 0, 1, 1,
0.2248678, -0.355808, 3.660293, 1, 0, 0, 1, 1,
0.2256992, -1.412736, 2.170273, 0, 0, 0, 1, 1,
0.2320596, 0.7168917, 0.472516, 0, 0, 0, 1, 1,
0.2346185, -1.495113, 4.34685, 0, 0, 0, 1, 1,
0.2360718, 0.7068956, 0.6173353, 0, 0, 0, 1, 1,
0.2438182, 0.9912008, -0.6689113, 0, 0, 0, 1, 1,
0.2448812, -0.7819691, 3.499379, 0, 0, 0, 1, 1,
0.2458912, -1.420004, 3.568182, 0, 0, 0, 1, 1,
0.253865, 2.128854, 1.182896, 1, 1, 1, 1, 1,
0.2614612, 0.5019282, 2.844032, 1, 1, 1, 1, 1,
0.2619941, -0.1758243, 2.699363, 1, 1, 1, 1, 1,
0.263852, 0.2962338, 0.8817582, 1, 1, 1, 1, 1,
0.2649679, -0.04802788, 0.8285726, 1, 1, 1, 1, 1,
0.2655126, 2.39967, 0.5700777, 1, 1, 1, 1, 1,
0.2662973, -0.4886137, 2.978313, 1, 1, 1, 1, 1,
0.2717593, 0.5019162, 1.132873, 1, 1, 1, 1, 1,
0.275342, 1.665589, 2.181474, 1, 1, 1, 1, 1,
0.2779214, -0.02425835, 1.499424, 1, 1, 1, 1, 1,
0.2788894, 0.6449392, -0.3016379, 1, 1, 1, 1, 1,
0.282369, -1.527259, 3.513346, 1, 1, 1, 1, 1,
0.2844096, -1.173104, 4.236055, 1, 1, 1, 1, 1,
0.2889144, 0.9662347, -0.2535027, 1, 1, 1, 1, 1,
0.2947502, -1.513888, 2.954891, 1, 1, 1, 1, 1,
0.2971269, 0.3715043, 2.384767, 0, 0, 1, 1, 1,
0.2985069, 0.6618898, -1.020922, 1, 0, 0, 1, 1,
0.3013709, 2.772677, 0.5662645, 1, 0, 0, 1, 1,
0.3033277, 0.8544357, -1.477662, 1, 0, 0, 1, 1,
0.3045753, 1.009025, 2.182862, 1, 0, 0, 1, 1,
0.3085181, 0.6784752, -0.2618569, 1, 0, 0, 1, 1,
0.3094063, -0.6268863, 1.825196, 0, 0, 0, 1, 1,
0.3184887, -0.1921944, 2.421043, 0, 0, 0, 1, 1,
0.3187708, 0.9803459, -0.2522664, 0, 0, 0, 1, 1,
0.319123, -0.4833954, 3.470939, 0, 0, 0, 1, 1,
0.3210503, -0.03374261, 1.328829, 0, 0, 0, 1, 1,
0.3223432, -0.2230445, 1.813623, 0, 0, 0, 1, 1,
0.3277409, -0.4482952, 3.643512, 0, 0, 0, 1, 1,
0.3320028, 0.6768438, 1.586272, 1, 1, 1, 1, 1,
0.334185, 0.5784147, 1.137448, 1, 1, 1, 1, 1,
0.3424351, -0.06612507, 2.430294, 1, 1, 1, 1, 1,
0.347104, 1.045153, 0.2015866, 1, 1, 1, 1, 1,
0.348307, 0.7759681, 0.7218732, 1, 1, 1, 1, 1,
0.350668, 0.004367117, 0.8222449, 1, 1, 1, 1, 1,
0.3547898, -0.7919301, 3.610518, 1, 1, 1, 1, 1,
0.356445, -0.1728195, 1.832536, 1, 1, 1, 1, 1,
0.358611, 0.4073873, -0.01586375, 1, 1, 1, 1, 1,
0.3595804, -0.6349314, 2.673124, 1, 1, 1, 1, 1,
0.3636309, 0.5555121, 1.246626, 1, 1, 1, 1, 1,
0.3653341, 2.116102, 0.04959553, 1, 1, 1, 1, 1,
0.3659254, -0.466109, 1.043081, 1, 1, 1, 1, 1,
0.3661603, -0.8775628, 1.003963, 1, 1, 1, 1, 1,
0.3676888, -1.342339, 1.26552, 1, 1, 1, 1, 1,
0.3706611, 0.3423546, 0.6681075, 0, 0, 1, 1, 1,
0.3712476, 1.751099, -0.5738282, 1, 0, 0, 1, 1,
0.3724745, 1.190428, -0.2534402, 1, 0, 0, 1, 1,
0.3730559, -1.167387, 3.278478, 1, 0, 0, 1, 1,
0.3744521, -0.1846133, 2.869586, 1, 0, 0, 1, 1,
0.37674, -0.7309889, 3.015389, 1, 0, 0, 1, 1,
0.3846393, -0.7950975, 2.211729, 0, 0, 0, 1, 1,
0.3852865, 1.190006, 2.129748, 0, 0, 0, 1, 1,
0.3854575, -1.389198, 2.732956, 0, 0, 0, 1, 1,
0.3910075, 1.439857, 0.2998768, 0, 0, 0, 1, 1,
0.3945324, 1.378986, -0.7367464, 0, 0, 0, 1, 1,
0.3954905, 1.6871, 0.1593878, 0, 0, 0, 1, 1,
0.3980173, -0.7814441, 3.504705, 0, 0, 0, 1, 1,
0.39854, -0.6870557, 1.867857, 1, 1, 1, 1, 1,
0.4002775, 0.8666123, 0.3222448, 1, 1, 1, 1, 1,
0.4003776, -0.5088583, 3.918391, 1, 1, 1, 1, 1,
0.4059633, -1.01032, 3.476444, 1, 1, 1, 1, 1,
0.406544, -1.437396, 4.342677, 1, 1, 1, 1, 1,
0.4077536, 0.6092998, -0.1165645, 1, 1, 1, 1, 1,
0.4157684, -0.4688423, 1.777952, 1, 1, 1, 1, 1,
0.4201892, -0.002245469, 0.9236257, 1, 1, 1, 1, 1,
0.4234109, -0.9396774, 2.401124, 1, 1, 1, 1, 1,
0.4236154, -0.4302022, 2.470563, 1, 1, 1, 1, 1,
0.4295186, -0.420357, 1.940434, 1, 1, 1, 1, 1,
0.4322576, 1.550671, -0.003360994, 1, 1, 1, 1, 1,
0.4324954, -0.3457859, 1.709361, 1, 1, 1, 1, 1,
0.4326491, 0.1706214, 0.398927, 1, 1, 1, 1, 1,
0.4329101, -0.1848612, 0.8222688, 1, 1, 1, 1, 1,
0.439944, 1.980819, -0.8722463, 0, 0, 1, 1, 1,
0.4429186, -0.4444431, 2.364317, 1, 0, 0, 1, 1,
0.4448588, 0.5460642, -0.5929801, 1, 0, 0, 1, 1,
0.4456476, 0.4350888, -1.142165, 1, 0, 0, 1, 1,
0.4459186, -0.5431159, 2.876164, 1, 0, 0, 1, 1,
0.4496756, -0.1017185, 0.3731839, 1, 0, 0, 1, 1,
0.44969, -1.906454, 4.696293, 0, 0, 0, 1, 1,
0.4496963, 2.120802, 1.377836, 0, 0, 0, 1, 1,
0.4657709, 0.9042876, -1.639176, 0, 0, 0, 1, 1,
0.4677686, 0.1167104, -0.1118763, 0, 0, 0, 1, 1,
0.4699698, 0.04605135, 1.50958, 0, 0, 0, 1, 1,
0.4747147, -0.9248751, 2.581514, 0, 0, 0, 1, 1,
0.4770158, -0.5449116, 1.798341, 0, 0, 0, 1, 1,
0.4813519, -1.187131, 5.950458, 1, 1, 1, 1, 1,
0.4822034, 0.7087424, 1.130646, 1, 1, 1, 1, 1,
0.4829308, -0.18481, 1.926921, 1, 1, 1, 1, 1,
0.4883731, 0.6465464, -0.6965517, 1, 1, 1, 1, 1,
0.4896307, -0.4201703, 2.200215, 1, 1, 1, 1, 1,
0.4916415, -2.426198, 0.759581, 1, 1, 1, 1, 1,
0.4978347, -1.956189, 1.343663, 1, 1, 1, 1, 1,
0.5091183, 0.1014584, 1.287633, 1, 1, 1, 1, 1,
0.5098174, -0.931886, 1.137766, 1, 1, 1, 1, 1,
0.5141501, 0.715679, 1.321041, 1, 1, 1, 1, 1,
0.5161974, -1.116585, 2.843884, 1, 1, 1, 1, 1,
0.5162786, -0.3131422, 2.034129, 1, 1, 1, 1, 1,
0.5189157, -0.4023764, 3.966424, 1, 1, 1, 1, 1,
0.519129, 0.4021079, -0.2887566, 1, 1, 1, 1, 1,
0.5246235, 0.4858764, 0.37549, 1, 1, 1, 1, 1,
0.5247275, 0.9322661, -0.8602585, 0, 0, 1, 1, 1,
0.5256037, -0.4748659, 2.186978, 1, 0, 0, 1, 1,
0.531808, 1.409222, 0.4196666, 1, 0, 0, 1, 1,
0.5401542, -0.08632907, 0.0268021, 1, 0, 0, 1, 1,
0.5481702, -0.5600932, 3.178812, 1, 0, 0, 1, 1,
0.5506247, -0.5853336, 1.552353, 1, 0, 0, 1, 1,
0.5588109, 1.377857, -0.1565551, 0, 0, 0, 1, 1,
0.5679981, -0.6112294, 2.519031, 0, 0, 0, 1, 1,
0.5683835, 1.719669, -0.170661, 0, 0, 0, 1, 1,
0.5685696, -1.61622, 1.737186, 0, 0, 0, 1, 1,
0.5706053, 1.091059, -0.9414813, 0, 0, 0, 1, 1,
0.5765234, -1.636722, 1.363183, 0, 0, 0, 1, 1,
0.5779204, -0.2839089, 2.353775, 0, 0, 0, 1, 1,
0.5783309, -0.6777806, 3.054167, 1, 1, 1, 1, 1,
0.5799824, -0.6354963, 2.960016, 1, 1, 1, 1, 1,
0.5825108, 0.4780385, -1.433012, 1, 1, 1, 1, 1,
0.5828606, 0.1840797, 1.665806, 1, 1, 1, 1, 1,
0.5868518, 2.37839, 0.6036305, 1, 1, 1, 1, 1,
0.5919068, -0.1074954, 1.930428, 1, 1, 1, 1, 1,
0.5947909, 0.6009609, 1.419255, 1, 1, 1, 1, 1,
0.5972127, -1.219612, 2.9352, 1, 1, 1, 1, 1,
0.5995577, -1.342991, 1.505056, 1, 1, 1, 1, 1,
0.6020764, 1.151774, 1.051604, 1, 1, 1, 1, 1,
0.6062416, 0.06965081, 1.100165, 1, 1, 1, 1, 1,
0.6185732, 0.6661428, 1.204566, 1, 1, 1, 1, 1,
0.6251994, -1.196549, 1.861872, 1, 1, 1, 1, 1,
0.6269595, -1.127288, 2.015129, 1, 1, 1, 1, 1,
0.6340141, 1.785234, 0.7952724, 1, 1, 1, 1, 1,
0.6452624, 1.060394, -0.1328073, 0, 0, 1, 1, 1,
0.6493624, -0.5435883, 1.965, 1, 0, 0, 1, 1,
0.6608921, 0.5299304, 0.4889024, 1, 0, 0, 1, 1,
0.6635357, 0.3930172, -0.3740734, 1, 0, 0, 1, 1,
0.680618, -0.9677898, 1.758098, 1, 0, 0, 1, 1,
0.6873026, -1.242949, 2.424799, 1, 0, 0, 1, 1,
0.6883082, 1.568248, 1.988978, 0, 0, 0, 1, 1,
0.6955497, -0.6131947, 2.228899, 0, 0, 0, 1, 1,
0.6959653, 0.2803013, -0.232099, 0, 0, 0, 1, 1,
0.7014856, 0.2298491, 0.9240149, 0, 0, 0, 1, 1,
0.7028022, -0.2458551, 3.161092, 0, 0, 0, 1, 1,
0.7033303, 1.386056, 0.1842852, 0, 0, 0, 1, 1,
0.7051538, 0.901019, 1.000495, 0, 0, 0, 1, 1,
0.7119908, -0.6570764, 0.568256, 1, 1, 1, 1, 1,
0.7160527, -0.7295187, 1.73854, 1, 1, 1, 1, 1,
0.7212249, -0.3066298, 1.484124, 1, 1, 1, 1, 1,
0.7232357, -1.670155, 2.250844, 1, 1, 1, 1, 1,
0.7247207, 1.644388, 1.509439, 1, 1, 1, 1, 1,
0.7302411, 0.2807239, 4.313798, 1, 1, 1, 1, 1,
0.7332572, -1.953275, 4.651756, 1, 1, 1, 1, 1,
0.7346795, 0.9221485, 1.439715, 1, 1, 1, 1, 1,
0.7366272, -1.418148, 1.00502, 1, 1, 1, 1, 1,
0.7378597, 0.6184651, 0.5069243, 1, 1, 1, 1, 1,
0.7385331, -2.04744, 3.61125, 1, 1, 1, 1, 1,
0.7443014, -0.8280547, 1.360357, 1, 1, 1, 1, 1,
0.7456955, -0.05229842, 0.7674245, 1, 1, 1, 1, 1,
0.7473299, -0.7493867, 1.870918, 1, 1, 1, 1, 1,
0.7519887, -1.73223, 2.660434, 1, 1, 1, 1, 1,
0.7626447, -0.796087, 1.710659, 0, 0, 1, 1, 1,
0.764787, -0.4817368, 2.218912, 1, 0, 0, 1, 1,
0.768878, -0.7699202, 0.9890481, 1, 0, 0, 1, 1,
0.7755387, -1.062915, 2.51836, 1, 0, 0, 1, 1,
0.7783381, 1.366536, 1.448527, 1, 0, 0, 1, 1,
0.7818441, -0.6105796, 2.237069, 1, 0, 0, 1, 1,
0.7820154, 0.9486489, 0.3630995, 0, 0, 0, 1, 1,
0.7822963, -1.116964, 4.522082, 0, 0, 0, 1, 1,
0.7840885, 1.411631, 0.1670888, 0, 0, 0, 1, 1,
0.7864496, -1.021524, 1.243641, 0, 0, 0, 1, 1,
0.7882284, 0.2347133, 0.7611787, 0, 0, 0, 1, 1,
0.7900931, -0.5811875, 2.686776, 0, 0, 0, 1, 1,
0.7912808, 0.3448734, -0.4261742, 0, 0, 0, 1, 1,
0.7963277, 0.4898524, 0.09806525, 1, 1, 1, 1, 1,
0.7973521, 2.0092, 1.446194, 1, 1, 1, 1, 1,
0.7996151, 1.260362, 0.141289, 1, 1, 1, 1, 1,
0.8001664, 0.3446527, 2.746965, 1, 1, 1, 1, 1,
0.8062562, 2.001935, -1.705891, 1, 1, 1, 1, 1,
0.8153959, 1.249691, -2.226638, 1, 1, 1, 1, 1,
0.8160331, -0.2745614, 2.568996, 1, 1, 1, 1, 1,
0.8192926, -0.1546707, 0.9033788, 1, 1, 1, 1, 1,
0.8203653, 1.210243, 1.830214, 1, 1, 1, 1, 1,
0.8214816, -1.427396, 3.24126, 1, 1, 1, 1, 1,
0.8242206, -0.2450578, 0.9138492, 1, 1, 1, 1, 1,
0.8254302, -0.5889567, 2.917326, 1, 1, 1, 1, 1,
0.8265874, -0.8527922, 4.000927, 1, 1, 1, 1, 1,
0.8270235, -0.05242572, 2.539395, 1, 1, 1, 1, 1,
0.8272338, 1.095747, 2.55949, 1, 1, 1, 1, 1,
0.8297115, -0.460634, 1.553955, 0, 0, 1, 1, 1,
0.8318744, -0.5265076, 2.299602, 1, 0, 0, 1, 1,
0.8336685, -0.9752197, 2.105499, 1, 0, 0, 1, 1,
0.847069, -0.7589131, 2.114597, 1, 0, 0, 1, 1,
0.8478351, 0.01923979, 2.412859, 1, 0, 0, 1, 1,
0.8559987, 1.234257, -0.5437056, 1, 0, 0, 1, 1,
0.8636276, 0.4047436, 0.7127262, 0, 0, 0, 1, 1,
0.8779499, 0.6286974, 0.3679343, 0, 0, 0, 1, 1,
0.8795478, -1.656693, 2.912663, 0, 0, 0, 1, 1,
0.8828779, 0.8618212, 1.71227, 0, 0, 0, 1, 1,
0.8860773, 0.9059514, 0.4837371, 0, 0, 0, 1, 1,
0.8905998, -1.690601, 2.261709, 0, 0, 0, 1, 1,
0.8908178, -0.6841654, 2.03907, 0, 0, 0, 1, 1,
0.8911983, 0.3624468, 0.7060795, 1, 1, 1, 1, 1,
0.8941894, 1.491827, 1.195862, 1, 1, 1, 1, 1,
0.8954648, 1.625705, -2.129347, 1, 1, 1, 1, 1,
0.8966375, -0.3332344, 2.257601, 1, 1, 1, 1, 1,
0.9121542, 0.1162966, 2.200195, 1, 1, 1, 1, 1,
0.9158388, -0.4444483, 2.537456, 1, 1, 1, 1, 1,
0.9231399, 0.4121308, 2.892781, 1, 1, 1, 1, 1,
0.9269761, -1.322202, 2.499264, 1, 1, 1, 1, 1,
0.9299921, 1.406217, 2.629175, 1, 1, 1, 1, 1,
0.9367426, -0.4488062, 1.430249, 1, 1, 1, 1, 1,
0.9425313, -0.5658125, 2.342496, 1, 1, 1, 1, 1,
0.9448159, -0.02173466, 2.72372, 1, 1, 1, 1, 1,
0.9571564, -0.6686518, 1.788739, 1, 1, 1, 1, 1,
0.9597796, -0.1570806, 0.290658, 1, 1, 1, 1, 1,
0.9675161, 2.131651, -0.3134038, 1, 1, 1, 1, 1,
0.9712552, -0.2072853, 1.077266, 0, 0, 1, 1, 1,
0.9801835, 0.4227121, 1.082189, 1, 0, 0, 1, 1,
0.9836883, -1.306063, 3.476563, 1, 0, 0, 1, 1,
0.9859531, -0.9236746, 1.807856, 1, 0, 0, 1, 1,
0.9880656, -2.21225, 3.734575, 1, 0, 0, 1, 1,
0.9965868, -0.3214153, 2.894068, 1, 0, 0, 1, 1,
0.9989939, 1.274054, 1.144195, 0, 0, 0, 1, 1,
1.002607, -0.8293095, 2.463276, 0, 0, 0, 1, 1,
1.01342, 0.3272647, 1.804162, 0, 0, 0, 1, 1,
1.017143, 0.9008915, 1.551877, 0, 0, 0, 1, 1,
1.017915, -1.210389, 2.592874, 0, 0, 0, 1, 1,
1.019023, -0.8907566, 1.552983, 0, 0, 0, 1, 1,
1.024815, 1.233907, 1.330238, 0, 0, 0, 1, 1,
1.034742, 0.666933, 0.4463702, 1, 1, 1, 1, 1,
1.04058, 2.406921, 1.061958, 1, 1, 1, 1, 1,
1.045038, -0.3284958, 2.243876, 1, 1, 1, 1, 1,
1.050613, 0.523473, 1.191199, 1, 1, 1, 1, 1,
1.053745, -0.5290091, -0.005326262, 1, 1, 1, 1, 1,
1.056165, -0.4663942, 1.560238, 1, 1, 1, 1, 1,
1.057077, 0.9496918, -0.318185, 1, 1, 1, 1, 1,
1.060616, 0.7354304, 0.733916, 1, 1, 1, 1, 1,
1.062733, -0.3795188, 1.935446, 1, 1, 1, 1, 1,
1.076207, 0.6952946, 0.4950457, 1, 1, 1, 1, 1,
1.081443, 2.138016, 0.07927924, 1, 1, 1, 1, 1,
1.083799, -1.327432, 2.091665, 1, 1, 1, 1, 1,
1.085787, 1.109413, 2.198396, 1, 1, 1, 1, 1,
1.093034, -0.1227157, 1.789779, 1, 1, 1, 1, 1,
1.093904, 0.9030397, 0.07332616, 1, 1, 1, 1, 1,
1.096644, 0.3754392, 2.188884, 0, 0, 1, 1, 1,
1.103074, -0.550712, 2.300237, 1, 0, 0, 1, 1,
1.103518, 0.9287629, 0.1062313, 1, 0, 0, 1, 1,
1.104908, -0.176258, 1.763107, 1, 0, 0, 1, 1,
1.108547, 0.1919722, 1.178823, 1, 0, 0, 1, 1,
1.111679, -0.6246275, 2.029152, 1, 0, 0, 1, 1,
1.116049, -1.169816, 5.528595, 0, 0, 0, 1, 1,
1.120599, 0.1139217, 2.073224, 0, 0, 0, 1, 1,
1.121709, 1.212148, 0.3147763, 0, 0, 0, 1, 1,
1.124129, 0.609688, 3.228065, 0, 0, 0, 1, 1,
1.125481, -0.729133, 1.316198, 0, 0, 0, 1, 1,
1.126908, -0.2249136, 1.868247, 0, 0, 0, 1, 1,
1.127415, 0.5514221, 1.070781, 0, 0, 0, 1, 1,
1.129461, 1.12354, -0.6299271, 1, 1, 1, 1, 1,
1.129793, 0.944528, -0.7527688, 1, 1, 1, 1, 1,
1.132863, -0.06656533, 0.9017097, 1, 1, 1, 1, 1,
1.134498, 0.9866996, 0.6556873, 1, 1, 1, 1, 1,
1.136896, 0.422161, -0.1669689, 1, 1, 1, 1, 1,
1.138366, -1.073108, 3.017135, 1, 1, 1, 1, 1,
1.141841, -1.055576, 1.750765, 1, 1, 1, 1, 1,
1.143209, 0.01011082, 1.114813, 1, 1, 1, 1, 1,
1.143457, 0.4587154, 1.819099, 1, 1, 1, 1, 1,
1.14466, -1.268301, 2.631857, 1, 1, 1, 1, 1,
1.154169, -0.6913449, 2.002791, 1, 1, 1, 1, 1,
1.16012, -1.618644, 0.8974122, 1, 1, 1, 1, 1,
1.160688, -0.0001100075, 0.5949847, 1, 1, 1, 1, 1,
1.161168, -0.1252095, 1.652701, 1, 1, 1, 1, 1,
1.161256, -0.1101352, 1.01875, 1, 1, 1, 1, 1,
1.163303, -0.4134274, 1.048832, 0, 0, 1, 1, 1,
1.171318, -1.629131, 3.521105, 1, 0, 0, 1, 1,
1.172972, -1.549987, 2.426216, 1, 0, 0, 1, 1,
1.179614, -0.2135337, 0.5265303, 1, 0, 0, 1, 1,
1.187225, -1.028905, 3.067251, 1, 0, 0, 1, 1,
1.189791, 0.8968543, -0.5269998, 1, 0, 0, 1, 1,
1.191314, 0.02052158, 1.871166, 0, 0, 0, 1, 1,
1.194562, -0.4298817, 2.813914, 0, 0, 0, 1, 1,
1.197515, 0.783821, 1.760378, 0, 0, 0, 1, 1,
1.200266, -0.8054984, 2.640467, 0, 0, 0, 1, 1,
1.212457, -0.7533658, 1.742575, 0, 0, 0, 1, 1,
1.22346, -0.5247927, 1.397703, 0, 0, 0, 1, 1,
1.231905, 0.9878489, 0.4848709, 0, 0, 0, 1, 1,
1.236796, 0.1115604, 1.042212, 1, 1, 1, 1, 1,
1.244993, -0.2339116, 0.03919067, 1, 1, 1, 1, 1,
1.249669, 0.717763, 0.8209566, 1, 1, 1, 1, 1,
1.260465, 0.5806512, 0.8493441, 1, 1, 1, 1, 1,
1.262173, 1.23446, -0.4240391, 1, 1, 1, 1, 1,
1.273602, 1.282543, 1.155076, 1, 1, 1, 1, 1,
1.279193, -1.912562, 2.406597, 1, 1, 1, 1, 1,
1.29746, -0.5528764, 3.158665, 1, 1, 1, 1, 1,
1.301628, 0.4053142, 1.957152, 1, 1, 1, 1, 1,
1.308124, 0.4400426, 0.4578789, 1, 1, 1, 1, 1,
1.308518, -0.3573409, 1.401078, 1, 1, 1, 1, 1,
1.311555, 0.8210405, 1.342796, 1, 1, 1, 1, 1,
1.312613, -0.4051608, 0.04399435, 1, 1, 1, 1, 1,
1.314615, -0.8769242, 1.502671, 1, 1, 1, 1, 1,
1.319223, 0.4647688, 3.028724, 1, 1, 1, 1, 1,
1.329134, -1.272068, 4.091848, 0, 0, 1, 1, 1,
1.341365, 0.7856844, -0.02286115, 1, 0, 0, 1, 1,
1.350777, 1.525367, 1.456877, 1, 0, 0, 1, 1,
1.358938, 0.1739811, 0.9540058, 1, 0, 0, 1, 1,
1.359088, 0.2892516, 2.19162, 1, 0, 0, 1, 1,
1.384291, 0.8605725, 0.9431143, 1, 0, 0, 1, 1,
1.389975, 1.5012, 0.460949, 0, 0, 0, 1, 1,
1.393535, -0.4623791, 1.778065, 0, 0, 0, 1, 1,
1.396713, -1.123731, -0.008926695, 0, 0, 0, 1, 1,
1.405773, 0.3835024, 0.6603152, 0, 0, 0, 1, 1,
1.408897, 1.048559, 0.4545792, 0, 0, 0, 1, 1,
1.413388, -0.3958946, 1.024404, 0, 0, 0, 1, 1,
1.417344, 1.0503, 1.655197, 0, 0, 0, 1, 1,
1.418366, -0.7108461, 2.265275, 1, 1, 1, 1, 1,
1.418677, 0.4900196, 2.781047, 1, 1, 1, 1, 1,
1.420146, 0.02104036, 2.035513, 1, 1, 1, 1, 1,
1.42961, -0.9412317, 1.88377, 1, 1, 1, 1, 1,
1.430966, -0.6940953, 1.736983, 1, 1, 1, 1, 1,
1.431709, -1.879239, 2.72944, 1, 1, 1, 1, 1,
1.447632, 0.1591606, 0.7013834, 1, 1, 1, 1, 1,
1.448447, 0.08440797, 1.54322, 1, 1, 1, 1, 1,
1.44999, -1.511924, 4.144345, 1, 1, 1, 1, 1,
1.450857, -1.735332, 3.559712, 1, 1, 1, 1, 1,
1.460819, -0.5507921, 3.533638, 1, 1, 1, 1, 1,
1.462428, 0.09924043, 1.578154, 1, 1, 1, 1, 1,
1.462831, 1.184692, 2.316195, 1, 1, 1, 1, 1,
1.464725, 1.054595, 1.387384, 1, 1, 1, 1, 1,
1.471893, -1.189617, 2.621523, 1, 1, 1, 1, 1,
1.482726, 0.2833959, 2.161218, 0, 0, 1, 1, 1,
1.488345, -0.1831878, 1.23477, 1, 0, 0, 1, 1,
1.498925, -1.280335, 1.732028, 1, 0, 0, 1, 1,
1.501146, 0.6424235, 1.776199, 1, 0, 0, 1, 1,
1.515864, -0.6016722, 3.032573, 1, 0, 0, 1, 1,
1.516054, -0.6074533, 1.798696, 1, 0, 0, 1, 1,
1.519821, -1.187091, 2.208599, 0, 0, 0, 1, 1,
1.520738, 1.186378, 0.9675169, 0, 0, 0, 1, 1,
1.526947, -0.6709921, 3.659719, 0, 0, 0, 1, 1,
1.531764, 0.8058271, -0.07809664, 0, 0, 0, 1, 1,
1.547742, -0.2416372, 1.245243, 0, 0, 0, 1, 1,
1.549512, -3.107212, 4.125651, 0, 0, 0, 1, 1,
1.552567, 0.1286926, 3.798142, 0, 0, 0, 1, 1,
1.553278, 2.274061, 0.07339411, 1, 1, 1, 1, 1,
1.553692, 1.028714, 0.4991604, 1, 1, 1, 1, 1,
1.561677, 0.3902132, 0.5172685, 1, 1, 1, 1, 1,
1.56388, -0.1934183, 0.2936713, 1, 1, 1, 1, 1,
1.582713, -0.6999121, 1.431723, 1, 1, 1, 1, 1,
1.595519, 0.1096319, 0.9364018, 1, 1, 1, 1, 1,
1.601521, 1.156031, 0.8029839, 1, 1, 1, 1, 1,
1.616593, 1.750543, 0.3727, 1, 1, 1, 1, 1,
1.616644, 0.4738472, 2.53881, 1, 1, 1, 1, 1,
1.645008, -0.3789965, 1.920642, 1, 1, 1, 1, 1,
1.653108, 0.2228829, 1.213305, 1, 1, 1, 1, 1,
1.653639, -1.350388, 0.04115235, 1, 1, 1, 1, 1,
1.660724, 0.5678126, 2.240005, 1, 1, 1, 1, 1,
1.666422, -0.5555354, 1.175645, 1, 1, 1, 1, 1,
1.676692, 1.72491, -0.3905764, 1, 1, 1, 1, 1,
1.697994, -1.003089, 1.13495, 0, 0, 1, 1, 1,
1.699971, 0.7307886, 1.969283, 1, 0, 0, 1, 1,
1.700739, 0.133732, 1.600979, 1, 0, 0, 1, 1,
1.712076, 0.03585404, 1.612951, 1, 0, 0, 1, 1,
1.714482, 1.180787, 1.986131, 1, 0, 0, 1, 1,
1.71955, -0.09414761, 1.751239, 1, 0, 0, 1, 1,
1.743843, 1.905306, -0.06536198, 0, 0, 0, 1, 1,
1.763959, 1.324663, 2.453293, 0, 0, 0, 1, 1,
1.772128, -0.6025686, 0.9517862, 0, 0, 0, 1, 1,
1.78602, -1.708417, 3.576913, 0, 0, 0, 1, 1,
1.793839, -1.048975, 1.657135, 0, 0, 0, 1, 1,
1.80479, 0.7888934, 0.2290036, 0, 0, 0, 1, 1,
1.808459, 0.1847671, 1.963002, 0, 0, 0, 1, 1,
1.82165, -0.6299909, 1.356588, 1, 1, 1, 1, 1,
1.832491, 0.4441126, 0.127529, 1, 1, 1, 1, 1,
1.843086, -1.30118, 3.059499, 1, 1, 1, 1, 1,
1.865373, 0.2718472, 2.032795, 1, 1, 1, 1, 1,
1.874212, 1.747243, 0.01622197, 1, 1, 1, 1, 1,
1.913156, -0.04481672, 0.8306739, 1, 1, 1, 1, 1,
1.921187, 0.5432363, 1.808448, 1, 1, 1, 1, 1,
1.930204, -0.5548264, 1.54843, 1, 1, 1, 1, 1,
1.939251, 1.222004, -0.03874081, 1, 1, 1, 1, 1,
1.973408, -0.3982886, 2.454444, 1, 1, 1, 1, 1,
1.98614, 0.9075528, 0.8918316, 1, 1, 1, 1, 1,
1.999981, -0.0995905, 2.25946, 1, 1, 1, 1, 1,
2.013412, 0.1983, 1.633057, 1, 1, 1, 1, 1,
2.045873, 0.9547737, 2.447003, 1, 1, 1, 1, 1,
2.059377, 1.326782, 0.9043975, 1, 1, 1, 1, 1,
2.06394, -1.178087, 1.639417, 0, 0, 1, 1, 1,
2.081186, 0.00719924, 0.2716767, 1, 0, 0, 1, 1,
2.090796, 0.5971209, 0.891698, 1, 0, 0, 1, 1,
2.103478, -0.5827363, 3.407025, 1, 0, 0, 1, 1,
2.157632, 0.7950271, 0.4275198, 1, 0, 0, 1, 1,
2.19243, -0.6472868, 1.9395, 1, 0, 0, 1, 1,
2.193401, 1.022921, 1.368799, 0, 0, 0, 1, 1,
2.19503, -0.7750208, 2.929711, 0, 0, 0, 1, 1,
2.20186, -0.2185734, -1.032159, 0, 0, 0, 1, 1,
2.270149, -0.6743666, 0.4234294, 0, 0, 0, 1, 1,
2.281044, -1.599729, 3.605138, 0, 0, 0, 1, 1,
2.331385, -1.355417, 0.6556194, 0, 0, 0, 1, 1,
2.417916, 0.9778308, 0.6112357, 0, 0, 0, 1, 1,
2.469715, 0.401222, 0.6844601, 1, 1, 1, 1, 1,
2.478191, 0.4586013, 1.647767, 1, 1, 1, 1, 1,
2.531803, -0.1449411, 1.803287, 1, 1, 1, 1, 1,
2.5804, 0.4078422, 0.9278095, 1, 1, 1, 1, 1,
2.687769, 0.6060041, 0.05407968, 1, 1, 1, 1, 1,
2.794144, -1.062043, 3.774982, 1, 1, 1, 1, 1,
2.794718, 0.6946972, 1.521643, 1, 1, 1, 1, 1
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
var radius = 9.691241;
var distance = 34.04008;
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
mvMatrix.translate( 0.3897133, 0.122148, -0.299912 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04008);
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