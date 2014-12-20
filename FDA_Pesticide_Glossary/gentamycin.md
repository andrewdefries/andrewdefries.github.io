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
-3.218318, 3.149404, 0.524873, 1, 0, 0, 1,
-3.121828, 1.173692, -1.802112, 1, 0.007843138, 0, 1,
-2.885993, 0.2586775, -3.644247, 1, 0.01176471, 0, 1,
-2.865377, 1.76306, 0.4846665, 1, 0.01960784, 0, 1,
-2.813158, -1.680748, -0.3629956, 1, 0.02352941, 0, 1,
-2.710996, -1.765764, -2.826937, 1, 0.03137255, 0, 1,
-2.67768, 1.068686, -2.022959, 1, 0.03529412, 0, 1,
-2.63992, -0.6832213, -0.6255454, 1, 0.04313726, 0, 1,
-2.627033, -0.3344458, -1.058059, 1, 0.04705882, 0, 1,
-2.559439, 0.1522699, -0.9140819, 1, 0.05490196, 0, 1,
-2.542036, 0.852065, -0.05068195, 1, 0.05882353, 0, 1,
-2.511724, -1.274656, -2.162288, 1, 0.06666667, 0, 1,
-2.500602, -1.078705, -1.817056, 1, 0.07058824, 0, 1,
-2.393044, 1.460635, -1.727854, 1, 0.07843138, 0, 1,
-2.389535, 0.6843092, 0.2756238, 1, 0.08235294, 0, 1,
-2.371602, -0.1001338, -1.857904, 1, 0.09019608, 0, 1,
-2.311787, 0.5382853, -0.330601, 1, 0.09411765, 0, 1,
-2.298339, 0.1255441, -1.882608, 1, 0.1019608, 0, 1,
-2.296092, -1.2894, -1.199229, 1, 0.1098039, 0, 1,
-2.29251, -0.201301, 0.3602284, 1, 0.1137255, 0, 1,
-2.239438, -1.777697, -1.931699, 1, 0.1215686, 0, 1,
-2.218984, -0.720395, -2.058923, 1, 0.1254902, 0, 1,
-2.200791, -0.01877981, -0.4686252, 1, 0.1333333, 0, 1,
-2.125919, -0.01303591, -1.974461, 1, 0.1372549, 0, 1,
-2.123233, -2.592118, -2.658337, 1, 0.145098, 0, 1,
-2.093875, 0.3617962, -1.240953, 1, 0.1490196, 0, 1,
-2.087618, 1.033, -1.138542, 1, 0.1568628, 0, 1,
-2.034356, 1.030875, -2.026507, 1, 0.1607843, 0, 1,
-2.008395, -1.163844, -0.6880157, 1, 0.1686275, 0, 1,
-1.990435, 0.2677097, -3.324562, 1, 0.172549, 0, 1,
-1.949171, 1.116636, 0.8535957, 1, 0.1803922, 0, 1,
-1.935894, 0.7914079, -2.261834, 1, 0.1843137, 0, 1,
-1.932354, -0.4768606, -2.05291, 1, 0.1921569, 0, 1,
-1.926186, -1.102081, -1.945088, 1, 0.1960784, 0, 1,
-1.920669, 0.6409901, 0.09343457, 1, 0.2039216, 0, 1,
-1.913825, 0.8593385, -0.07858078, 1, 0.2117647, 0, 1,
-1.88398, -0.7588468, -2.368493, 1, 0.2156863, 0, 1,
-1.873667, 0.4850106, -1.968874, 1, 0.2235294, 0, 1,
-1.862078, 0.5463575, -0.7369813, 1, 0.227451, 0, 1,
-1.857651, -0.652806, -2.689683, 1, 0.2352941, 0, 1,
-1.849564, 0.08673617, -0.9811254, 1, 0.2392157, 0, 1,
-1.846177, 0.9437266, -2.146594, 1, 0.2470588, 0, 1,
-1.846005, -0.3789031, -3.262466, 1, 0.2509804, 0, 1,
-1.835401, -0.7242771, -2.627496, 1, 0.2588235, 0, 1,
-1.83309, -0.08756451, 0.1217334, 1, 0.2627451, 0, 1,
-1.806216, -0.2371389, -2.519536, 1, 0.2705882, 0, 1,
-1.798754, -0.4826765, -0.0977197, 1, 0.2745098, 0, 1,
-1.772568, -1.070128, -2.019629, 1, 0.282353, 0, 1,
-1.768634, -0.3259469, -3.539001, 1, 0.2862745, 0, 1,
-1.755626, -0.3160372, -1.703815, 1, 0.2941177, 0, 1,
-1.754517, 0.4001451, -2.589253, 1, 0.3019608, 0, 1,
-1.748094, -0.117173, 0.7797875, 1, 0.3058824, 0, 1,
-1.710311, 0.3360751, -1.046175, 1, 0.3137255, 0, 1,
-1.695843, -1.506678, -1.25613, 1, 0.3176471, 0, 1,
-1.691721, -0.5674909, -0.8973045, 1, 0.3254902, 0, 1,
-1.663448, -0.2284221, -4.474529, 1, 0.3294118, 0, 1,
-1.656113, 0.6137965, -2.61587, 1, 0.3372549, 0, 1,
-1.643394, 0.3889279, -3.308491, 1, 0.3411765, 0, 1,
-1.627768, -0.1516894, -2.243833, 1, 0.3490196, 0, 1,
-1.626309, 1.405614, -1.695235, 1, 0.3529412, 0, 1,
-1.619452, 0.8681892, -0.4052082, 1, 0.3607843, 0, 1,
-1.618188, 0.690874, -1.276202, 1, 0.3647059, 0, 1,
-1.607922, -0.6568406, -3.044733, 1, 0.372549, 0, 1,
-1.605971, -1.535772, -2.782814, 1, 0.3764706, 0, 1,
-1.603794, 1.612765, -0.999101, 1, 0.3843137, 0, 1,
-1.595073, 0.1192088, -2.572635, 1, 0.3882353, 0, 1,
-1.592371, 0.2705759, -1.996778, 1, 0.3960784, 0, 1,
-1.585913, 2.868634, -1.048417, 1, 0.4039216, 0, 1,
-1.578812, 0.4327088, -1.252733, 1, 0.4078431, 0, 1,
-1.55647, -0.9046841, -2.647144, 1, 0.4156863, 0, 1,
-1.552461, 2.753685, -0.3137695, 1, 0.4196078, 0, 1,
-1.546489, -1.256395, -1.975503, 1, 0.427451, 0, 1,
-1.544911, -1.170983, -1.17322, 1, 0.4313726, 0, 1,
-1.535483, 0.7791991, -1.460231, 1, 0.4392157, 0, 1,
-1.53097, -0.9496855, -1.281902, 1, 0.4431373, 0, 1,
-1.527323, 0.138395, -3.492799, 1, 0.4509804, 0, 1,
-1.520411, -0.04670668, -0.4929753, 1, 0.454902, 0, 1,
-1.51275, -0.7181618, -3.755269, 1, 0.4627451, 0, 1,
-1.508133, -0.8884078, -2.369488, 1, 0.4666667, 0, 1,
-1.497976, -2.043001, -2.065458, 1, 0.4745098, 0, 1,
-1.493339, 0.5137173, 0.432228, 1, 0.4784314, 0, 1,
-1.489145, -1.05321, -3.312059, 1, 0.4862745, 0, 1,
-1.486917, 1.179381, -0.5445861, 1, 0.4901961, 0, 1,
-1.477801, 0.2729962, -2.034488, 1, 0.4980392, 0, 1,
-1.476602, -0.8091556, -1.604426, 1, 0.5058824, 0, 1,
-1.472588, 0.1929185, -0.8574418, 1, 0.509804, 0, 1,
-1.470993, -0.3310088, -2.533638, 1, 0.5176471, 0, 1,
-1.469593, -0.2754684, -1.750916, 1, 0.5215687, 0, 1,
-1.46731, 1.003723, -1.635591, 1, 0.5294118, 0, 1,
-1.453899, -2.025887, -1.738823, 1, 0.5333334, 0, 1,
-1.444889, -0.1633237, -2.684884, 1, 0.5411765, 0, 1,
-1.436546, -1.466038, -1.246631, 1, 0.5450981, 0, 1,
-1.431728, 1.060622, -0.002617844, 1, 0.5529412, 0, 1,
-1.430267, 1.04128, -0.9838213, 1, 0.5568628, 0, 1,
-1.425527, 0.6584638, -2.102339, 1, 0.5647059, 0, 1,
-1.423317, 0.4966913, 0.18415, 1, 0.5686275, 0, 1,
-1.422911, 0.6824161, -0.583044, 1, 0.5764706, 0, 1,
-1.420759, -0.6909228, -3.400884, 1, 0.5803922, 0, 1,
-1.411453, -0.6059349, -1.96028, 1, 0.5882353, 0, 1,
-1.411171, 0.7713289, 1.020646, 1, 0.5921569, 0, 1,
-1.403778, 0.1884838, -0.004609684, 1, 0.6, 0, 1,
-1.402533, 1.805388, 0.72458, 1, 0.6078432, 0, 1,
-1.400132, 0.3859909, -1.839865, 1, 0.6117647, 0, 1,
-1.388498, -0.2146201, -0.5118502, 1, 0.6196079, 0, 1,
-1.383448, 1.760139, 1.386126, 1, 0.6235294, 0, 1,
-1.375062, 0.918125, -0.9337194, 1, 0.6313726, 0, 1,
-1.370419, -0.03483621, -2.245429, 1, 0.6352941, 0, 1,
-1.36256, 0.3187174, -0.8913071, 1, 0.6431373, 0, 1,
-1.358978, 0.4126075, -0.4658077, 1, 0.6470588, 0, 1,
-1.350225, -1.877487, -2.403327, 1, 0.654902, 0, 1,
-1.338956, 0.6808458, -0.801035, 1, 0.6588235, 0, 1,
-1.336388, -0.2429741, -2.038911, 1, 0.6666667, 0, 1,
-1.328174, -1.072105, -2.325947, 1, 0.6705883, 0, 1,
-1.317594, -1.411073, -0.9334334, 1, 0.6784314, 0, 1,
-1.311852, 1.043416, -0.2266669, 1, 0.682353, 0, 1,
-1.306852, 0.08674098, -0.02913362, 1, 0.6901961, 0, 1,
-1.282448, 0.01732998, -1.695558, 1, 0.6941177, 0, 1,
-1.280517, 0.5232553, -0.7386498, 1, 0.7019608, 0, 1,
-1.276043, -1.418693, -4.765644, 1, 0.7098039, 0, 1,
-1.274997, -0.04384717, -1.992327, 1, 0.7137255, 0, 1,
-1.272985, 0.09534425, -1.465411, 1, 0.7215686, 0, 1,
-1.271766, -0.7165262, -1.08611, 1, 0.7254902, 0, 1,
-1.271324, -0.9262438, -2.045943, 1, 0.7333333, 0, 1,
-1.254591, -1.620319, -1.125856, 1, 0.7372549, 0, 1,
-1.250782, 0.8682171, 0.2640853, 1, 0.7450981, 0, 1,
-1.247936, 0.179816, 0.5624173, 1, 0.7490196, 0, 1,
-1.246506, 1.86018, -0.7632595, 1, 0.7568628, 0, 1,
-1.226676, -1.673298, -1.681517, 1, 0.7607843, 0, 1,
-1.224934, -1.440901, -1.948156, 1, 0.7686275, 0, 1,
-1.220999, 1.016184, -2.190056, 1, 0.772549, 0, 1,
-1.204727, 1.526163, 1.14776, 1, 0.7803922, 0, 1,
-1.20283, -0.9945922, -1.720528, 1, 0.7843137, 0, 1,
-1.193774, -0.512687, -0.9007007, 1, 0.7921569, 0, 1,
-1.190178, -0.6175171, -2.837079, 1, 0.7960784, 0, 1,
-1.189237, -0.9384924, -1.76817, 1, 0.8039216, 0, 1,
-1.18921, -0.5570925, -2.794636, 1, 0.8117647, 0, 1,
-1.1882, -0.3270093, -1.516806, 1, 0.8156863, 0, 1,
-1.18008, -0.83271, -1.602868, 1, 0.8235294, 0, 1,
-1.178574, 2.745415, -1.385481, 1, 0.827451, 0, 1,
-1.168777, 0.7325518, -0.6589155, 1, 0.8352941, 0, 1,
-1.157238, 1.228343, 0.1397387, 1, 0.8392157, 0, 1,
-1.150412, 0.8248962, -0.1809162, 1, 0.8470588, 0, 1,
-1.143363, 0.05262844, -1.883418, 1, 0.8509804, 0, 1,
-1.14031, 0.409537, -1.326938, 1, 0.8588235, 0, 1,
-1.137207, -0.2133833, -1.294909, 1, 0.8627451, 0, 1,
-1.128843, -0.3264897, -1.188343, 1, 0.8705882, 0, 1,
-1.124632, -0.1508915, -1.029735, 1, 0.8745098, 0, 1,
-1.123902, 1.14071, -0.1555992, 1, 0.8823529, 0, 1,
-1.113949, -0.0845259, -2.746665, 1, 0.8862745, 0, 1,
-1.109526, -0.04126284, -2.386886, 1, 0.8941177, 0, 1,
-1.106476, 0.4033134, -2.133768, 1, 0.8980392, 0, 1,
-1.106257, -1.530309, -0.3818659, 1, 0.9058824, 0, 1,
-1.10484, -0.3119216, -0.8407104, 1, 0.9137255, 0, 1,
-1.092604, -0.4940134, -1.425096, 1, 0.9176471, 0, 1,
-1.079218, -0.5969099, -2.707482, 1, 0.9254902, 0, 1,
-1.071039, -1.905088, -3.083786, 1, 0.9294118, 0, 1,
-1.068649, -0.9977662, -2.776429, 1, 0.9372549, 0, 1,
-1.06729, 0.2654556, -1.138292, 1, 0.9411765, 0, 1,
-1.066945, -0.1226705, -3.713725, 1, 0.9490196, 0, 1,
-1.04268, -0.09747562, -1.407599, 1, 0.9529412, 0, 1,
-1.033604, -0.8599746, -2.798073, 1, 0.9607843, 0, 1,
-1.027865, 1.823316, 0.4070571, 1, 0.9647059, 0, 1,
-1.023989, 2.184822, -0.5339471, 1, 0.972549, 0, 1,
-1.019271, 0.2937167, -0.9886825, 1, 0.9764706, 0, 1,
-1.01883, 0.3294132, -1.562885, 1, 0.9843137, 0, 1,
-1.018723, -0.6616099, -3.250487, 1, 0.9882353, 0, 1,
-1.009848, -1.234593, -2.75873, 1, 0.9960784, 0, 1,
-1.007722, 0.8293467, 0.4565011, 0.9960784, 1, 0, 1,
-1.003507, -0.01200832, -1.418095, 0.9921569, 1, 0, 1,
-1.003035, 1.557171, -0.8734221, 0.9843137, 1, 0, 1,
-1.000823, -0.2719476, -1.928506, 0.9803922, 1, 0, 1,
-1.000507, -0.8322377, -3.957771, 0.972549, 1, 0, 1,
-0.990666, -0.0525072, -1.352368, 0.9686275, 1, 0, 1,
-0.9880324, -0.4467316, -2.824479, 0.9607843, 1, 0, 1,
-0.9721094, -0.8615195, -2.911251, 0.9568627, 1, 0, 1,
-0.9653617, 2.027151, -0.5490201, 0.9490196, 1, 0, 1,
-0.9548806, -0.303182, -3.900054, 0.945098, 1, 0, 1,
-0.9482177, -1.701944, -3.302478, 0.9372549, 1, 0, 1,
-0.9452583, -0.8204386, -2.873331, 0.9333333, 1, 0, 1,
-0.9385107, 1.563089, -1.431195, 0.9254902, 1, 0, 1,
-0.9372375, -0.0179453, -1.861703, 0.9215686, 1, 0, 1,
-0.9361027, 1.695957, -0.615227, 0.9137255, 1, 0, 1,
-0.9359425, 1.724043, -0.9175787, 0.9098039, 1, 0, 1,
-0.9338292, 0.4734181, -1.49345, 0.9019608, 1, 0, 1,
-0.9307692, 0.945852, 1.485383, 0.8941177, 1, 0, 1,
-0.9180809, -0.1407283, -1.912084, 0.8901961, 1, 0, 1,
-0.9174952, -0.3562145, -0.5157399, 0.8823529, 1, 0, 1,
-0.913447, -0.7158247, -2.617004, 0.8784314, 1, 0, 1,
-0.9110984, -0.3980001, -1.948962, 0.8705882, 1, 0, 1,
-0.9087178, -1.137882, -3.562308, 0.8666667, 1, 0, 1,
-0.9029554, 0.7107164, -2.131094, 0.8588235, 1, 0, 1,
-0.9025562, -0.8928859, -2.301703, 0.854902, 1, 0, 1,
-0.8943067, 0.08849091, -0.9291859, 0.8470588, 1, 0, 1,
-0.8896304, -0.6536098, -3.596517, 0.8431373, 1, 0, 1,
-0.8830851, 1.343702, -2.118283, 0.8352941, 1, 0, 1,
-0.8796203, -0.1726847, -0.1743089, 0.8313726, 1, 0, 1,
-0.8730861, 0.6484657, -1.178244, 0.8235294, 1, 0, 1,
-0.8667073, 0.200688, -0.4906917, 0.8196079, 1, 0, 1,
-0.8663404, -0.4582572, -2.516493, 0.8117647, 1, 0, 1,
-0.8615368, -0.7856436, -1.806223, 0.8078431, 1, 0, 1,
-0.8603081, 0.001863218, -1.320683, 0.8, 1, 0, 1,
-0.8602675, 0.9593267, -0.7879436, 0.7921569, 1, 0, 1,
-0.8572474, 0.2343921, -1.267703, 0.7882353, 1, 0, 1,
-0.8451531, -2.093025, -4.202895, 0.7803922, 1, 0, 1,
-0.8450114, 1.746251, -1.091805, 0.7764706, 1, 0, 1,
-0.8431515, 2.141367, -0.5815361, 0.7686275, 1, 0, 1,
-0.8416575, -0.6959926, -1.045578, 0.7647059, 1, 0, 1,
-0.840439, -0.543054, -1.424821, 0.7568628, 1, 0, 1,
-0.838567, 0.3482254, -0.5693263, 0.7529412, 1, 0, 1,
-0.8373597, -0.7282118, -3.784297, 0.7450981, 1, 0, 1,
-0.8351126, -0.5445529, -2.763746, 0.7411765, 1, 0, 1,
-0.8309682, 0.0005060884, -1.795927, 0.7333333, 1, 0, 1,
-0.8292414, -2.396294, -2.076638, 0.7294118, 1, 0, 1,
-0.8254442, 1.688345, 0.4599179, 0.7215686, 1, 0, 1,
-0.8250363, 0.2928522, -0.7206376, 0.7176471, 1, 0, 1,
-0.8162971, 0.9745893, -0.1493735, 0.7098039, 1, 0, 1,
-0.812813, -0.01365829, -3.695658, 0.7058824, 1, 0, 1,
-0.8093473, -0.5391185, -3.42252, 0.6980392, 1, 0, 1,
-0.8072699, -1.586666, -2.628646, 0.6901961, 1, 0, 1,
-0.8064703, -0.1845927, -1.631263, 0.6862745, 1, 0, 1,
-0.8041278, 0.8457532, -0.7095732, 0.6784314, 1, 0, 1,
-0.7995214, -1.133082, -2.823057, 0.6745098, 1, 0, 1,
-0.7913762, 0.1651568, -2.441993, 0.6666667, 1, 0, 1,
-0.7880555, -0.03348089, -0.7754098, 0.6627451, 1, 0, 1,
-0.7827557, 1.883913, -0.7579435, 0.654902, 1, 0, 1,
-0.7813, 0.6929892, -1.74968, 0.6509804, 1, 0, 1,
-0.7794122, -0.3438702, -2.215869, 0.6431373, 1, 0, 1,
-0.7788473, 1.232178, 1.698991, 0.6392157, 1, 0, 1,
-0.7721477, 0.6539876, -0.8894434, 0.6313726, 1, 0, 1,
-0.7638706, -0.1032983, -3.646779, 0.627451, 1, 0, 1,
-0.7632622, -0.3359127, -0.9927844, 0.6196079, 1, 0, 1,
-0.7577489, -0.6465154, -2.521539, 0.6156863, 1, 0, 1,
-0.7481537, -1.136072, -0.9558736, 0.6078432, 1, 0, 1,
-0.7461464, 0.556522, -2.165215, 0.6039216, 1, 0, 1,
-0.7370546, 0.4424003, -2.868481, 0.5960785, 1, 0, 1,
-0.7370425, 1.378132, 0.351328, 0.5882353, 1, 0, 1,
-0.7358487, -0.5435687, -3.148711, 0.5843138, 1, 0, 1,
-0.7350649, -0.8408926, -3.992925, 0.5764706, 1, 0, 1,
-0.7260948, -0.8621703, -2.983922, 0.572549, 1, 0, 1,
-0.7196219, -1.430441, -2.456512, 0.5647059, 1, 0, 1,
-0.7159234, -0.2631904, -3.835924, 0.5607843, 1, 0, 1,
-0.7150471, 0.02978334, -3.152017, 0.5529412, 1, 0, 1,
-0.710902, 0.2291398, -0.5646082, 0.5490196, 1, 0, 1,
-0.7057172, -0.2528356, -0.4723403, 0.5411765, 1, 0, 1,
-0.6992075, 0.1816121, -1.264571, 0.5372549, 1, 0, 1,
-0.693274, -0.006609112, -1.490579, 0.5294118, 1, 0, 1,
-0.6886677, -0.2307707, -3.834229, 0.5254902, 1, 0, 1,
-0.6805661, 0.04531878, -1.350072, 0.5176471, 1, 0, 1,
-0.6592064, -0.1562154, -1.450855, 0.5137255, 1, 0, 1,
-0.6533677, 0.5671669, 0.9434617, 0.5058824, 1, 0, 1,
-0.6524197, 1.054245, -0.4830059, 0.5019608, 1, 0, 1,
-0.6520208, 0.4317245, -0.4802661, 0.4941176, 1, 0, 1,
-0.6490343, 0.956601, 0.5509933, 0.4862745, 1, 0, 1,
-0.6484429, -1.114944, -3.219193, 0.4823529, 1, 0, 1,
-0.6479219, 0.4920497, -2.235544, 0.4745098, 1, 0, 1,
-0.6424584, -1.106988, -1.647787, 0.4705882, 1, 0, 1,
-0.6406601, -1.333226, -2.250093, 0.4627451, 1, 0, 1,
-0.6381381, 0.4062643, -1.407528, 0.4588235, 1, 0, 1,
-0.6358982, 0.4713283, 0.3808435, 0.4509804, 1, 0, 1,
-0.6308742, -0.2178291, -0.9129841, 0.4470588, 1, 0, 1,
-0.6307758, -0.06430752, -3.288921, 0.4392157, 1, 0, 1,
-0.6258495, -1.55347, -1.907192, 0.4352941, 1, 0, 1,
-0.6240537, 0.6859963, -0.2071474, 0.427451, 1, 0, 1,
-0.6128804, 0.214147, -1.313689, 0.4235294, 1, 0, 1,
-0.6085919, -2.452136, -3.760387, 0.4156863, 1, 0, 1,
-0.6057314, 0.4116297, 0.02474597, 0.4117647, 1, 0, 1,
-0.6041678, 1.285346, 0.6515864, 0.4039216, 1, 0, 1,
-0.6027936, -0.01007985, 0.03418492, 0.3960784, 1, 0, 1,
-0.6014476, -1.329128, -3.01135, 0.3921569, 1, 0, 1,
-0.5976095, 0.1897048, -2.428982, 0.3843137, 1, 0, 1,
-0.5927196, 0.4541045, -2.198082, 0.3803922, 1, 0, 1,
-0.5904481, -0.9505447, -2.67637, 0.372549, 1, 0, 1,
-0.5893228, -0.7010997, -1.774137, 0.3686275, 1, 0, 1,
-0.5864323, -0.467325, -3.984383, 0.3607843, 1, 0, 1,
-0.5815739, 0.3992289, -2.726111, 0.3568628, 1, 0, 1,
-0.5786514, -2.549347, -1.374421, 0.3490196, 1, 0, 1,
-0.5777552, -1.13375, -3.022511, 0.345098, 1, 0, 1,
-0.576041, 0.9632601, -1.541878, 0.3372549, 1, 0, 1,
-0.5745301, 0.6247959, -1.727263, 0.3333333, 1, 0, 1,
-0.5732723, 2.813692, 1.282883, 0.3254902, 1, 0, 1,
-0.5687638, -0.7813411, -3.840977, 0.3215686, 1, 0, 1,
-0.5686874, -0.8314233, -2.485811, 0.3137255, 1, 0, 1,
-0.5636179, -0.834038, -3.083081, 0.3098039, 1, 0, 1,
-0.5618261, 0.478549, -2.272025, 0.3019608, 1, 0, 1,
-0.5604244, -1.346611, -1.718883, 0.2941177, 1, 0, 1,
-0.5525848, 0.5777397, -2.111109, 0.2901961, 1, 0, 1,
-0.5519601, 0.7123544, -0.5952874, 0.282353, 1, 0, 1,
-0.5517648, 0.8009259, -0.2415607, 0.2784314, 1, 0, 1,
-0.5475986, -1.795004, -2.455696, 0.2705882, 1, 0, 1,
-0.54594, -0.5558905, -2.992447, 0.2666667, 1, 0, 1,
-0.5454246, 0.9884218, -1.617932, 0.2588235, 1, 0, 1,
-0.5403947, 1.842258, -0.4423323, 0.254902, 1, 0, 1,
-0.5347018, 0.5692691, -1.998368, 0.2470588, 1, 0, 1,
-0.5325015, 0.01130361, 0.4642909, 0.2431373, 1, 0, 1,
-0.5286087, -0.1736357, -5.236572, 0.2352941, 1, 0, 1,
-0.5224801, 0.5785067, -1.828807, 0.2313726, 1, 0, 1,
-0.521455, -0.09422807, -0.7380985, 0.2235294, 1, 0, 1,
-0.518274, 1.912886, -1.590047, 0.2196078, 1, 0, 1,
-0.5179792, -0.1199668, -1.227894, 0.2117647, 1, 0, 1,
-0.5150176, 1.433154, -0.3988794, 0.2078431, 1, 0, 1,
-0.5133954, -1.147625, -2.53592, 0.2, 1, 0, 1,
-0.5104233, 0.2104041, -2.335356, 0.1921569, 1, 0, 1,
-0.5102487, -0.6157755, -3.339104, 0.1882353, 1, 0, 1,
-0.508282, 0.7976259, -0.4284194, 0.1803922, 1, 0, 1,
-0.5069239, 1.283107, -0.2194581, 0.1764706, 1, 0, 1,
-0.5060026, 0.2356527, -0.5071255, 0.1686275, 1, 0, 1,
-0.4997013, 1.22848, -1.820897, 0.1647059, 1, 0, 1,
-0.4996417, 1.012636, 1.352752, 0.1568628, 1, 0, 1,
-0.493899, 1.014342, -0.7419834, 0.1529412, 1, 0, 1,
-0.4919938, -0.3375258, -0.6426615, 0.145098, 1, 0, 1,
-0.4916316, 0.0572799, 0.2947502, 0.1411765, 1, 0, 1,
-0.4877987, 0.9736656, 1.251237, 0.1333333, 1, 0, 1,
-0.4862381, -1.779831, -3.525412, 0.1294118, 1, 0, 1,
-0.4824834, 1.601366, -1.41287, 0.1215686, 1, 0, 1,
-0.4814107, -2.444601, -3.977263, 0.1176471, 1, 0, 1,
-0.4804324, -0.6556486, -1.417553, 0.1098039, 1, 0, 1,
-0.4798761, -0.4753411, -2.0633, 0.1058824, 1, 0, 1,
-0.4698965, -0.0749144, -3.983633, 0.09803922, 1, 0, 1,
-0.4667791, 0.9047396, -0.1397855, 0.09019608, 1, 0, 1,
-0.4660758, -0.3366857, -1.864858, 0.08627451, 1, 0, 1,
-0.4579379, -0.7480291, -1.264911, 0.07843138, 1, 0, 1,
-0.457044, -0.6438886, -2.297208, 0.07450981, 1, 0, 1,
-0.4560888, -0.04675189, -2.523197, 0.06666667, 1, 0, 1,
-0.4487482, -1.34196, -3.833298, 0.0627451, 1, 0, 1,
-0.443558, 0.1389436, 0.2951458, 0.05490196, 1, 0, 1,
-0.4415179, 1.097402, -1.171946, 0.05098039, 1, 0, 1,
-0.4386947, 1.330629, -0.1139504, 0.04313726, 1, 0, 1,
-0.4229691, 0.3708208, -0.3894202, 0.03921569, 1, 0, 1,
-0.4225838, -0.3345875, -2.855757, 0.03137255, 1, 0, 1,
-0.4168845, -1.842905, -3.123548, 0.02745098, 1, 0, 1,
-0.4167112, 0.6284069, 0.6111496, 0.01960784, 1, 0, 1,
-0.411023, -1.356786, -3.056366, 0.01568628, 1, 0, 1,
-0.4070939, -0.03131536, -2.399473, 0.007843138, 1, 0, 1,
-0.3931269, -0.9807242, -4.236236, 0.003921569, 1, 0, 1,
-0.392554, 1.340354, 0.507359, 0, 1, 0.003921569, 1,
-0.3913313, -1.312883, -2.359181, 0, 1, 0.01176471, 1,
-0.3884666, 1.722901, -1.059586, 0, 1, 0.01568628, 1,
-0.3850071, 0.4095134, -0.4749476, 0, 1, 0.02352941, 1,
-0.3834541, 1.809034, -0.1698446, 0, 1, 0.02745098, 1,
-0.3829458, -0.9436809, -2.963748, 0, 1, 0.03529412, 1,
-0.3794743, 0.2295078, 0.1303238, 0, 1, 0.03921569, 1,
-0.3790995, 0.2194739, -0.5565265, 0, 1, 0.04705882, 1,
-0.377536, 1.885927, -0.3927706, 0, 1, 0.05098039, 1,
-0.3762098, 1.318514, -1.081051, 0, 1, 0.05882353, 1,
-0.37418, -0.7630116, -1.736183, 0, 1, 0.0627451, 1,
-0.3705418, -0.5333602, -3.836774, 0, 1, 0.07058824, 1,
-0.3701017, -1.111043, -2.663748, 0, 1, 0.07450981, 1,
-0.3693289, -0.330337, -2.157873, 0, 1, 0.08235294, 1,
-0.3687266, 1.126771, 0.8492571, 0, 1, 0.08627451, 1,
-0.3652445, 1.470549, -0.5324809, 0, 1, 0.09411765, 1,
-0.3652122, -1.909488, -3.243989, 0, 1, 0.1019608, 1,
-0.3651557, 0.8995894, -0.8200561, 0, 1, 0.1058824, 1,
-0.3616194, 0.7466837, -1.387686, 0, 1, 0.1137255, 1,
-0.3587148, -1.753575, -2.863553, 0, 1, 0.1176471, 1,
-0.3584185, 0.2605645, 0.08910625, 0, 1, 0.1254902, 1,
-0.3550158, -2.255187, -3.081916, 0, 1, 0.1294118, 1,
-0.3518506, -0.2445536, -4.350877, 0, 1, 0.1372549, 1,
-0.3497256, -1.822401, -3.965757, 0, 1, 0.1411765, 1,
-0.3438939, -0.1395988, -0.6753535, 0, 1, 0.1490196, 1,
-0.3379537, -0.6623186, -2.328311, 0, 1, 0.1529412, 1,
-0.3353771, 0.605319, 1.524445, 0, 1, 0.1607843, 1,
-0.3311622, -0.938024, -2.063241, 0, 1, 0.1647059, 1,
-0.3291557, -0.4689979, -2.869859, 0, 1, 0.172549, 1,
-0.3278562, 0.9319609, 0.4084118, 0, 1, 0.1764706, 1,
-0.3268839, -1.306226, -4.044428, 0, 1, 0.1843137, 1,
-0.3263111, 0.5396726, -0.1851688, 0, 1, 0.1882353, 1,
-0.3237299, 0.1951172, 0.5409082, 0, 1, 0.1960784, 1,
-0.3189875, 0.448709, 0.2841494, 0, 1, 0.2039216, 1,
-0.3166187, 0.3442901, -1.501391, 0, 1, 0.2078431, 1,
-0.3137509, -1.256085, -2.839309, 0, 1, 0.2156863, 1,
-0.3137509, -0.428785, 0.0996508, 0, 1, 0.2196078, 1,
-0.3114045, -0.8248171, -3.624164, 0, 1, 0.227451, 1,
-0.3091787, -0.817028, -3.188134, 0, 1, 0.2313726, 1,
-0.3082888, 1.649694, -1.023406, 0, 1, 0.2392157, 1,
-0.307096, -1.166833, -2.507324, 0, 1, 0.2431373, 1,
-0.3045634, -0.4059266, -2.832595, 0, 1, 0.2509804, 1,
-0.3024605, 0.2438614, -0.6391625, 0, 1, 0.254902, 1,
-0.3023001, 0.08272595, -2.573468, 0, 1, 0.2627451, 1,
-0.3014663, 1.545643, 0.8516765, 0, 1, 0.2666667, 1,
-0.2980747, -0.5151321, -4.12606, 0, 1, 0.2745098, 1,
-0.2972946, -0.372667, -1.748541, 0, 1, 0.2784314, 1,
-0.2960183, 0.3731562, 0.1723214, 0, 1, 0.2862745, 1,
-0.2922533, 1.090864, -2.352671, 0, 1, 0.2901961, 1,
-0.2888366, 1.319619, -2.583799, 0, 1, 0.2980392, 1,
-0.2867779, -1.688539, -2.6034, 0, 1, 0.3058824, 1,
-0.2852774, 1.389361, -1.377821, 0, 1, 0.3098039, 1,
-0.2842309, -0.1890787, -2.349222, 0, 1, 0.3176471, 1,
-0.2822349, -0.5689341, -2.495749, 0, 1, 0.3215686, 1,
-0.2796445, 1.212162, -1.49832, 0, 1, 0.3294118, 1,
-0.2742612, -1.356207, -0.4287666, 0, 1, 0.3333333, 1,
-0.2727491, -2.462077, -3.578054, 0, 1, 0.3411765, 1,
-0.2705389, 0.4068275, -0.28131, 0, 1, 0.345098, 1,
-0.2691719, -0.2026228, -1.951843, 0, 1, 0.3529412, 1,
-0.2684125, -0.6766346, -1.395155, 0, 1, 0.3568628, 1,
-0.2676251, -0.1989928, -2.181268, 0, 1, 0.3647059, 1,
-0.2646047, 0.4189177, -1.060956, 0, 1, 0.3686275, 1,
-0.2545286, -0.2189367, -2.795954, 0, 1, 0.3764706, 1,
-0.2541926, -0.06505082, -0.9563008, 0, 1, 0.3803922, 1,
-0.2516158, -0.3208351, -3.64596, 0, 1, 0.3882353, 1,
-0.2506299, -0.9587371, -4.755482, 0, 1, 0.3921569, 1,
-0.2448488, -0.5263019, -4.046368, 0, 1, 0.4, 1,
-0.2403978, -0.7658718, -2.269834, 0, 1, 0.4078431, 1,
-0.2392727, -0.4678782, -1.97038, 0, 1, 0.4117647, 1,
-0.2390527, 1.503229, 1.03599, 0, 1, 0.4196078, 1,
-0.2344625, -0.1577926, -1.238917, 0, 1, 0.4235294, 1,
-0.2313314, 1.183325, -0.9727027, 0, 1, 0.4313726, 1,
-0.2283208, -7.823735e-05, 0.1291679, 0, 1, 0.4352941, 1,
-0.2273569, -1.461568, -4.926353, 0, 1, 0.4431373, 1,
-0.2245702, 2.173067, 0.3268458, 0, 1, 0.4470588, 1,
-0.2182347, 0.3343981, -0.2098016, 0, 1, 0.454902, 1,
-0.2177864, 0.9681461, 2.364542, 0, 1, 0.4588235, 1,
-0.2172254, -1.020691, -2.225974, 0, 1, 0.4666667, 1,
-0.2168753, -0.1534519, -2.612655, 0, 1, 0.4705882, 1,
-0.2141112, -2.497492, -3.71458, 0, 1, 0.4784314, 1,
-0.2128895, 1.026757, 0.1913101, 0, 1, 0.4823529, 1,
-0.2072559, 1.32111, 1.15678, 0, 1, 0.4901961, 1,
-0.206924, -1.299192, -4.018609, 0, 1, 0.4941176, 1,
-0.2014643, 1.788598, -0.2490444, 0, 1, 0.5019608, 1,
-0.1921387, 0.4588205, -1.604214, 0, 1, 0.509804, 1,
-0.1898127, -1.363204, -2.962399, 0, 1, 0.5137255, 1,
-0.1864417, 0.4219924, -1.053005, 0, 1, 0.5215687, 1,
-0.1863884, 0.8092523, -0.9044728, 0, 1, 0.5254902, 1,
-0.186325, -0.4515807, -2.780546, 0, 1, 0.5333334, 1,
-0.1861497, -0.6594219, -3.629185, 0, 1, 0.5372549, 1,
-0.184086, -0.2440604, -1.968629, 0, 1, 0.5450981, 1,
-0.1758401, -0.8130671, -2.910619, 0, 1, 0.5490196, 1,
-0.1750814, 0.9753121, 0.01450318, 0, 1, 0.5568628, 1,
-0.1712578, -0.3353296, -3.601717, 0, 1, 0.5607843, 1,
-0.1698702, 0.3874779, -0.3786798, 0, 1, 0.5686275, 1,
-0.1640369, 0.457853, -0.814857, 0, 1, 0.572549, 1,
-0.1600791, 1.600705, -0.1307656, 0, 1, 0.5803922, 1,
-0.1544097, -1.793457, -3.946996, 0, 1, 0.5843138, 1,
-0.1500816, -0.3499569, -4.477632, 0, 1, 0.5921569, 1,
-0.149655, 0.2956991, -0.05168436, 0, 1, 0.5960785, 1,
-0.1485689, -0.3791814, -2.317473, 0, 1, 0.6039216, 1,
-0.1474158, -0.02796166, -3.177621, 0, 1, 0.6117647, 1,
-0.1453893, -0.8035454, -2.805107, 0, 1, 0.6156863, 1,
-0.1434428, -1.509743, -3.564809, 0, 1, 0.6235294, 1,
-0.1424436, -1.28397, -1.92214, 0, 1, 0.627451, 1,
-0.1377199, -0.00744418, -2.476538, 0, 1, 0.6352941, 1,
-0.1351577, -0.6977714, -3.76175, 0, 1, 0.6392157, 1,
-0.1350635, -0.009345724, -0.5416641, 0, 1, 0.6470588, 1,
-0.1335787, 0.3443869, -0.4247374, 0, 1, 0.6509804, 1,
-0.1328058, 1.31793, 0.2741573, 0, 1, 0.6588235, 1,
-0.1279743, -2.263721, -3.423805, 0, 1, 0.6627451, 1,
-0.1267182, -0.3064885, -2.330227, 0, 1, 0.6705883, 1,
-0.1262548, 0.820725, 0.8306006, 0, 1, 0.6745098, 1,
-0.1228649, 0.2045205, -0.5829269, 0, 1, 0.682353, 1,
-0.1225193, 0.6015833, -1.930424, 0, 1, 0.6862745, 1,
-0.1198571, 1.287595, 0.2201889, 0, 1, 0.6941177, 1,
-0.1146519, 1.998642, -1.22411, 0, 1, 0.7019608, 1,
-0.1125472, 0.509362, -0.7805495, 0, 1, 0.7058824, 1,
-0.109818, -0.4535429, -2.717655, 0, 1, 0.7137255, 1,
-0.1048192, -0.3135436, -2.491309, 0, 1, 0.7176471, 1,
-0.1020514, -0.3290552, -3.713854, 0, 1, 0.7254902, 1,
-0.1013491, 0.3297204, -0.1087112, 0, 1, 0.7294118, 1,
-0.1004658, 0.8230221, 0.3886781, 0, 1, 0.7372549, 1,
-0.09869232, -0.841528, -2.954801, 0, 1, 0.7411765, 1,
-0.09818123, 0.06544043, -1.220716, 0, 1, 0.7490196, 1,
-0.09735201, -0.04434139, -2.568087, 0, 1, 0.7529412, 1,
-0.0960835, 0.3379236, -1.102766, 0, 1, 0.7607843, 1,
-0.09548543, -1.131566, -3.809408, 0, 1, 0.7647059, 1,
-0.09426492, 0.3581923, 0.7569612, 0, 1, 0.772549, 1,
-0.09235403, -0.5007727, -2.456509, 0, 1, 0.7764706, 1,
-0.09035175, 1.334421, -0.01516553, 0, 1, 0.7843137, 1,
-0.08720909, -1.104685, -3.757457, 0, 1, 0.7882353, 1,
-0.08664637, 1.112009, -2.437923, 0, 1, 0.7960784, 1,
-0.08454279, -0.2997152, -1.850495, 0, 1, 0.8039216, 1,
-0.08410438, -0.3697376, -1.808918, 0, 1, 0.8078431, 1,
-0.07907001, 1.066563, 1.200762, 0, 1, 0.8156863, 1,
-0.07646801, 0.4882284, -1.714681, 0, 1, 0.8196079, 1,
-0.07556413, 1.266346, -0.3473061, 0, 1, 0.827451, 1,
-0.06945609, -0.9537055, -3.784419, 0, 1, 0.8313726, 1,
-0.06388433, 2.050814, -1.503085, 0, 1, 0.8392157, 1,
-0.05876504, 0.1080432, -2.736205, 0, 1, 0.8431373, 1,
-0.05858035, 0.5608966, -0.5970198, 0, 1, 0.8509804, 1,
-0.05793934, -0.08013914, -0.571691, 0, 1, 0.854902, 1,
-0.05791393, -0.3132747, -4.326241, 0, 1, 0.8627451, 1,
-0.05564594, 0.4026672, -0.4256026, 0, 1, 0.8666667, 1,
-0.0537098, 0.457797, -0.1928355, 0, 1, 0.8745098, 1,
-0.05353751, -1.087571, -1.821103, 0, 1, 0.8784314, 1,
-0.05214065, 0.2088766, -0.06789985, 0, 1, 0.8862745, 1,
-0.04846754, 0.1041775, 1.523762, 0, 1, 0.8901961, 1,
-0.04563265, 2.34497, -1.651335, 0, 1, 0.8980392, 1,
-0.04305898, -0.7359263, -1.521176, 0, 1, 0.9058824, 1,
-0.04158233, 0.4763516, -1.767745, 0, 1, 0.9098039, 1,
-0.03821479, 0.1682294, 0.7149822, 0, 1, 0.9176471, 1,
-0.03561921, -0.04000499, -2.236685, 0, 1, 0.9215686, 1,
-0.03339119, 1.522267, -0.1300813, 0, 1, 0.9294118, 1,
-0.03325351, -0.611154, -5.044976, 0, 1, 0.9333333, 1,
-0.03229674, 0.2700598, -0.2485134, 0, 1, 0.9411765, 1,
-0.02405236, -1.341859, -1.1883, 0, 1, 0.945098, 1,
-0.02343025, -0.1087568, -3.517045, 0, 1, 0.9529412, 1,
-0.02297733, -1.788214, -2.581819, 0, 1, 0.9568627, 1,
-0.01804726, -0.8025085, -3.270014, 0, 1, 0.9647059, 1,
-0.01759166, 1.766597, 0.6167518, 0, 1, 0.9686275, 1,
-0.01481759, -0.7737072, -2.169174, 0, 1, 0.9764706, 1,
-0.0144156, -0.6294181, -3.29636, 0, 1, 0.9803922, 1,
-0.002690498, 0.441051, 0.2250613, 0, 1, 0.9882353, 1,
-0.0006866639, 1.254778, 1.42279, 0, 1, 0.9921569, 1,
-0.0005380968, 0.6000497, 0.2952431, 0, 1, 1, 1,
0.005781442, -0.1886285, 2.738883, 0, 0.9921569, 1, 1,
0.006633461, -0.1618332, 3.150849, 0, 0.9882353, 1, 1,
0.006961432, 1.318629, 0.0415133, 0, 0.9803922, 1, 1,
0.00822714, 1.296509, -1.277912, 0, 0.9764706, 1, 1,
0.01105056, -0.2792795, 2.933753, 0, 0.9686275, 1, 1,
0.01119512, 2.546891, 0.194318, 0, 0.9647059, 1, 1,
0.01120255, 0.9099084, -0.363728, 0, 0.9568627, 1, 1,
0.01663081, -1.676068, 3.960876, 0, 0.9529412, 1, 1,
0.01775448, -0.4212555, 1.833986, 0, 0.945098, 1, 1,
0.01872136, 0.4911397, 0.332489, 0, 0.9411765, 1, 1,
0.02426084, -1.972484, 3.08357, 0, 0.9333333, 1, 1,
0.02435053, 0.2268748, 0.01365421, 0, 0.9294118, 1, 1,
0.02543421, -1.497896, 1.728406, 0, 0.9215686, 1, 1,
0.02723503, -0.2252196, 2.669258, 0, 0.9176471, 1, 1,
0.0282619, 1.355557, 0.8802909, 0, 0.9098039, 1, 1,
0.0288812, 0.523778, 1.111763, 0, 0.9058824, 1, 1,
0.02951348, -0.6723778, 3.03932, 0, 0.8980392, 1, 1,
0.03022289, 0.7520885, -0.04178214, 0, 0.8901961, 1, 1,
0.03116605, -0.3661426, 3.314856, 0, 0.8862745, 1, 1,
0.03288006, 0.2821573, 0.3559972, 0, 0.8784314, 1, 1,
0.037998, -0.08652566, 1.875939, 0, 0.8745098, 1, 1,
0.04050286, 1.305545, 0.8517441, 0, 0.8666667, 1, 1,
0.04412277, 0.5775445, 1.187456, 0, 0.8627451, 1, 1,
0.05065065, 0.9886062, 0.01533604, 0, 0.854902, 1, 1,
0.05384839, -0.9233454, 2.433709, 0, 0.8509804, 1, 1,
0.05457929, 0.419574, 0.2560545, 0, 0.8431373, 1, 1,
0.05498421, 1.016062, -1.156156, 0, 0.8392157, 1, 1,
0.05987113, -1.239844, 2.87236, 0, 0.8313726, 1, 1,
0.06618936, -2.537339, 2.632574, 0, 0.827451, 1, 1,
0.06670718, 0.6597183, 0.1812265, 0, 0.8196079, 1, 1,
0.06717945, -0.6016058, 2.634257, 0, 0.8156863, 1, 1,
0.06981256, 0.9634449, 1.20401, 0, 0.8078431, 1, 1,
0.07293957, -1.004597, 0.9467199, 0, 0.8039216, 1, 1,
0.07529784, 0.148839, 1.324831, 0, 0.7960784, 1, 1,
0.08062935, -2.718717, 1.643325, 0, 0.7882353, 1, 1,
0.08357278, 1.604169, -0.0123538, 0, 0.7843137, 1, 1,
0.08630113, 0.193756, -1.050943, 0, 0.7764706, 1, 1,
0.08646592, -0.04174232, 1.387684, 0, 0.772549, 1, 1,
0.08945289, 2.228409, 0.48735, 0, 0.7647059, 1, 1,
0.08954784, 1.252088, -0.5859597, 0, 0.7607843, 1, 1,
0.09275554, -1.512424, 4.162968, 0, 0.7529412, 1, 1,
0.09299839, -0.5648442, 3.896009, 0, 0.7490196, 1, 1,
0.09980744, -0.6733696, 2.954923, 0, 0.7411765, 1, 1,
0.1062726, 1.802301, -2.27658, 0, 0.7372549, 1, 1,
0.1086476, 0.2842486, -1.462543, 0, 0.7294118, 1, 1,
0.1092405, 0.5307145, -0.9090512, 0, 0.7254902, 1, 1,
0.1113141, -0.3228288, 1.287145, 0, 0.7176471, 1, 1,
0.1137311, -0.09089633, 3.857211, 0, 0.7137255, 1, 1,
0.117449, 0.04717182, 0.5513686, 0, 0.7058824, 1, 1,
0.1211576, 1.265855, -0.2986185, 0, 0.6980392, 1, 1,
0.1218087, 1.421388, 0.0162043, 0, 0.6941177, 1, 1,
0.1224893, 1.29895, -0.07379575, 0, 0.6862745, 1, 1,
0.1256372, 0.975845, -0.2886572, 0, 0.682353, 1, 1,
0.1257458, -0.8705073, 4.727006, 0, 0.6745098, 1, 1,
0.1272649, 0.9537087, 0.1813154, 0, 0.6705883, 1, 1,
0.1280913, 0.656517, 1.02067, 0, 0.6627451, 1, 1,
0.1437608, 0.3519492, 1.978666, 0, 0.6588235, 1, 1,
0.1472341, 0.5057188, 0.5000421, 0, 0.6509804, 1, 1,
0.1558795, 0.1021773, 1.952826, 0, 0.6470588, 1, 1,
0.1592263, -0.3044378, 1.214247, 0, 0.6392157, 1, 1,
0.1630151, 0.3554123, -1.157749, 0, 0.6352941, 1, 1,
0.1695319, -0.9083857, 3.057626, 0, 0.627451, 1, 1,
0.1715764, 0.4324133, -0.5530992, 0, 0.6235294, 1, 1,
0.1753187, 1.607133, -1.309102, 0, 0.6156863, 1, 1,
0.1790931, -0.2727085, 2.038905, 0, 0.6117647, 1, 1,
0.179225, 1.024383, 2.054428, 0, 0.6039216, 1, 1,
0.1802468, -0.6696772, 2.932589, 0, 0.5960785, 1, 1,
0.1808647, 0.5533962, 0.4494916, 0, 0.5921569, 1, 1,
0.1814675, 0.5847694, 1.310746, 0, 0.5843138, 1, 1,
0.18316, -0.6848643, 3.142058, 0, 0.5803922, 1, 1,
0.1841211, -0.2278256, 2.674743, 0, 0.572549, 1, 1,
0.189965, 0.5196671, 1.250952, 0, 0.5686275, 1, 1,
0.1906606, -0.005638825, 1.994284, 0, 0.5607843, 1, 1,
0.1908408, 0.9622049, -1.501899, 0, 0.5568628, 1, 1,
0.1974275, 1.143638, 0.2964462, 0, 0.5490196, 1, 1,
0.2027441, -0.7019855, 1.553794, 0, 0.5450981, 1, 1,
0.2049642, -0.2209398, 3.095663, 0, 0.5372549, 1, 1,
0.2118208, -0.4303394, 2.516926, 0, 0.5333334, 1, 1,
0.2167228, -0.1639029, 3.340788, 0, 0.5254902, 1, 1,
0.2188426, -0.7632616, 3.479942, 0, 0.5215687, 1, 1,
0.2212084, 0.03356581, -1.030689, 0, 0.5137255, 1, 1,
0.2221726, -1.414606, 2.617379, 0, 0.509804, 1, 1,
0.2226808, -0.008539398, 3.253965, 0, 0.5019608, 1, 1,
0.223432, -0.2545698, 3.434169, 0, 0.4941176, 1, 1,
0.2255094, -0.5570784, 2.237164, 0, 0.4901961, 1, 1,
0.2274873, 1.292245, 2.432435, 0, 0.4823529, 1, 1,
0.2286876, 1.453407, -0.8374076, 0, 0.4784314, 1, 1,
0.2299086, 1.090908, 1.864204, 0, 0.4705882, 1, 1,
0.2319271, 0.1538621, 0.4106742, 0, 0.4666667, 1, 1,
0.2327685, -1.26586, 2.53064, 0, 0.4588235, 1, 1,
0.2353929, -0.3598014, 1.756975, 0, 0.454902, 1, 1,
0.2360347, -0.1819092, 3.410858, 0, 0.4470588, 1, 1,
0.237319, 0.8991376, 0.69029, 0, 0.4431373, 1, 1,
0.239723, 0.7445582, 0.07271069, 0, 0.4352941, 1, 1,
0.2458791, -0.5196669, 2.996184, 0, 0.4313726, 1, 1,
0.2493727, -0.2402531, 4.766729, 0, 0.4235294, 1, 1,
0.2571385, -0.09480079, 3.324181, 0, 0.4196078, 1, 1,
0.2620634, 0.6675077, -0.05514047, 0, 0.4117647, 1, 1,
0.2623831, 0.2121968, 1.757575, 0, 0.4078431, 1, 1,
0.2626908, 2.480212, 0.8869953, 0, 0.4, 1, 1,
0.266418, -1.130884, 1.753381, 0, 0.3921569, 1, 1,
0.2670147, 0.7163187, 1.041929, 0, 0.3882353, 1, 1,
0.2692095, -1.053475, 3.005914, 0, 0.3803922, 1, 1,
0.2698525, -0.2246464, 2.517833, 0, 0.3764706, 1, 1,
0.2703157, 1.298415, -0.4979958, 0, 0.3686275, 1, 1,
0.2807787, 0.8036591, -1.532895, 0, 0.3647059, 1, 1,
0.2828654, 0.3815603, -0.2340115, 0, 0.3568628, 1, 1,
0.2831934, -1.185618, 1.559569, 0, 0.3529412, 1, 1,
0.2842331, 0.9744455, -2.390089, 0, 0.345098, 1, 1,
0.2913144, 0.6997762, -0.1989805, 0, 0.3411765, 1, 1,
0.2956659, 0.395073, -0.7934972, 0, 0.3333333, 1, 1,
0.2957089, -0.3717488, 2.899807, 0, 0.3294118, 1, 1,
0.2979681, -0.03926208, 1.165774, 0, 0.3215686, 1, 1,
0.3004574, 0.4303612, 1.459662, 0, 0.3176471, 1, 1,
0.3008629, 1.217387, 0.1126646, 0, 0.3098039, 1, 1,
0.3023013, -0.8278819, 1.401886, 0, 0.3058824, 1, 1,
0.3051279, -0.1912191, 3.594659, 0, 0.2980392, 1, 1,
0.3159172, 1.949805, 0.6737617, 0, 0.2901961, 1, 1,
0.3199218, -0.3281227, 3.586768, 0, 0.2862745, 1, 1,
0.3200192, 0.3604722, 0.2370546, 0, 0.2784314, 1, 1,
0.3211441, 1.112441, -1.47438, 0, 0.2745098, 1, 1,
0.3219417, 1.152699, 1.09029, 0, 0.2666667, 1, 1,
0.3240216, -0.4385345, 0.848234, 0, 0.2627451, 1, 1,
0.3295401, -0.1256965, 2.606042, 0, 0.254902, 1, 1,
0.3300113, 1.548209, 0.9233158, 0, 0.2509804, 1, 1,
0.3319358, -1.819605, 1.880803, 0, 0.2431373, 1, 1,
0.3327241, -0.4002954, 3.022662, 0, 0.2392157, 1, 1,
0.3331651, -1.080032, 2.477311, 0, 0.2313726, 1, 1,
0.3336094, 0.2878803, 0.9210668, 0, 0.227451, 1, 1,
0.3344275, -0.05689355, 1.319837, 0, 0.2196078, 1, 1,
0.3354017, -0.7503111, 2.510744, 0, 0.2156863, 1, 1,
0.3368603, 0.160606, 0.8873615, 0, 0.2078431, 1, 1,
0.3389915, 0.4512577, 0.61067, 0, 0.2039216, 1, 1,
0.3414328, 1.356809, 2.93587, 0, 0.1960784, 1, 1,
0.3455656, -0.8609738, 4.913105, 0, 0.1882353, 1, 1,
0.3457305, -0.2452344, 1.247277, 0, 0.1843137, 1, 1,
0.3471571, -0.1398253, 1.506366, 0, 0.1764706, 1, 1,
0.3583626, -0.1346401, 2.931329, 0, 0.172549, 1, 1,
0.362565, -1.463328, 2.912759, 0, 0.1647059, 1, 1,
0.3626104, 0.6508055, 0.5080334, 0, 0.1607843, 1, 1,
0.3633373, 0.3431927, 0.9240275, 0, 0.1529412, 1, 1,
0.3646875, 0.6053814, 0.2860288, 0, 0.1490196, 1, 1,
0.3652141, -0.1152397, 1.567469, 0, 0.1411765, 1, 1,
0.3761846, -0.6240908, 2.261071, 0, 0.1372549, 1, 1,
0.376458, -1.224796, 1.937095, 0, 0.1294118, 1, 1,
0.3790689, -0.9473409, 3.382471, 0, 0.1254902, 1, 1,
0.3827682, -0.4638423, 2.588775, 0, 0.1176471, 1, 1,
0.3840195, 0.0959387, 0.65348, 0, 0.1137255, 1, 1,
0.3856949, -1.108325, 2.30617, 0, 0.1058824, 1, 1,
0.3956088, -1.22976, 2.557082, 0, 0.09803922, 1, 1,
0.3997927, -0.3636417, 2.769387, 0, 0.09411765, 1, 1,
0.3999677, 0.9020915, -0.5757377, 0, 0.08627451, 1, 1,
0.4157657, 0.2605017, 0.6396055, 0, 0.08235294, 1, 1,
0.4223711, 0.1729819, -0.1003579, 0, 0.07450981, 1, 1,
0.4241732, 0.3340067, 0.2934177, 0, 0.07058824, 1, 1,
0.4244004, 1.08551, 0.9749331, 0, 0.0627451, 1, 1,
0.425146, -0.2046982, 0.7113965, 0, 0.05882353, 1, 1,
0.4258485, 0.8870302, -0.8152777, 0, 0.05098039, 1, 1,
0.4285481, 1.078323, -0.1940651, 0, 0.04705882, 1, 1,
0.4377984, 0.8999701, 1.797299, 0, 0.03921569, 1, 1,
0.4404078, 0.1260165, 2.34129, 0, 0.03529412, 1, 1,
0.4409315, 0.4561697, -0.2915427, 0, 0.02745098, 1, 1,
0.4491408, -1.303355, 3.58549, 0, 0.02352941, 1, 1,
0.449433, -0.9804423, 2.392603, 0, 0.01568628, 1, 1,
0.4501144, 0.5723176, -0.5839478, 0, 0.01176471, 1, 1,
0.452006, -1.360402, 1.719437, 0, 0.003921569, 1, 1,
0.4523188, -0.043814, 0.9259771, 0.003921569, 0, 1, 1,
0.4545385, -0.8421589, 2.465378, 0.007843138, 0, 1, 1,
0.4578419, -0.608621, 2.798045, 0.01568628, 0, 1, 1,
0.4639123, 0.6408781, -0.7518814, 0.01960784, 0, 1, 1,
0.4666939, 1.285034, 0.530443, 0.02745098, 0, 1, 1,
0.4682681, -1.575005, 3.266264, 0.03137255, 0, 1, 1,
0.4736735, 0.4449943, 1.701004, 0.03921569, 0, 1, 1,
0.4793075, -0.8402539, 1.100872, 0.04313726, 0, 1, 1,
0.4814868, -2.277911, 2.613575, 0.05098039, 0, 1, 1,
0.4827685, -0.1750344, 0.1882103, 0.05490196, 0, 1, 1,
0.491192, -0.5173787, 2.650164, 0.0627451, 0, 1, 1,
0.4913271, 1.106179, 0.2022943, 0.06666667, 0, 1, 1,
0.492047, 0.3107362, 0.1597069, 0.07450981, 0, 1, 1,
0.496987, -0.133554, 1.278757, 0.07843138, 0, 1, 1,
0.5008896, -1.17627, 3.945445, 0.08627451, 0, 1, 1,
0.5034217, 0.8576623, 0.3483569, 0.09019608, 0, 1, 1,
0.5071915, -1.447195, 3.694419, 0.09803922, 0, 1, 1,
0.5087904, 0.8534688, 0.1202698, 0.1058824, 0, 1, 1,
0.5128817, -0.838451, 2.408837, 0.1098039, 0, 1, 1,
0.5143788, -0.8436405, 3.476632, 0.1176471, 0, 1, 1,
0.5230296, 1.708619, -0.6674605, 0.1215686, 0, 1, 1,
0.5246241, -0.8739906, 2.740144, 0.1294118, 0, 1, 1,
0.5247184, 2.525486, -0.6648496, 0.1333333, 0, 1, 1,
0.5279831, 0.9319429, 3.006941, 0.1411765, 0, 1, 1,
0.528505, 0.9146953, 0.4790173, 0.145098, 0, 1, 1,
0.531341, -0.9472839, 1.463246, 0.1529412, 0, 1, 1,
0.5351325, 0.03705149, 1.889148, 0.1568628, 0, 1, 1,
0.5353923, 0.08603794, 0.4784785, 0.1647059, 0, 1, 1,
0.5378076, -0.2647924, 0.7917622, 0.1686275, 0, 1, 1,
0.5391197, 1.437285, 0.5443166, 0.1764706, 0, 1, 1,
0.5395266, 0.05596309, 1.949088, 0.1803922, 0, 1, 1,
0.5399886, -1.024989, 1.026372, 0.1882353, 0, 1, 1,
0.5429493, -0.4934603, 0.5893413, 0.1921569, 0, 1, 1,
0.5437548, 1.203064, -2.320653, 0.2, 0, 1, 1,
0.5493932, 1.619206, -0.2234151, 0.2078431, 0, 1, 1,
0.5523015, 0.8738852, -0.1481683, 0.2117647, 0, 1, 1,
0.5525935, 0.6019686, 1.713932, 0.2196078, 0, 1, 1,
0.5538707, -1.660639, 2.814217, 0.2235294, 0, 1, 1,
0.5549424, 0.01890894, 1.751365, 0.2313726, 0, 1, 1,
0.5574098, 1.242327, 1.522621, 0.2352941, 0, 1, 1,
0.5627784, 0.09458242, 3.303354, 0.2431373, 0, 1, 1,
0.5666378, -0.590241, 0.821983, 0.2470588, 0, 1, 1,
0.5668873, -0.6406963, 2.369904, 0.254902, 0, 1, 1,
0.5687491, 0.4375424, 0.6435375, 0.2588235, 0, 1, 1,
0.572419, -0.9436319, 1.018047, 0.2666667, 0, 1, 1,
0.5735719, -1.44038, 2.557289, 0.2705882, 0, 1, 1,
0.5752376, -0.9076016, 1.653908, 0.2784314, 0, 1, 1,
0.5754987, -1.404655, 4.571119, 0.282353, 0, 1, 1,
0.5815288, -1.298583, 3.51764, 0.2901961, 0, 1, 1,
0.5845543, 0.2556886, 1.519439, 0.2941177, 0, 1, 1,
0.5858422, -0.4768658, 0.1472183, 0.3019608, 0, 1, 1,
0.5858426, 1.581438, 0.6174804, 0.3098039, 0, 1, 1,
0.5872402, -0.4261158, 2.6895, 0.3137255, 0, 1, 1,
0.5877163, 1.069809, 0.9515182, 0.3215686, 0, 1, 1,
0.5884824, -0.246672, 0.9054779, 0.3254902, 0, 1, 1,
0.5886564, -2.198207, 2.391105, 0.3333333, 0, 1, 1,
0.5944214, 0.9301657, 0.9636114, 0.3372549, 0, 1, 1,
0.5968627, 0.4680972, 0.192363, 0.345098, 0, 1, 1,
0.6032341, -1.064173, 2.95149, 0.3490196, 0, 1, 1,
0.6048819, -2.307131, 3.212482, 0.3568628, 0, 1, 1,
0.6136833, -0.5578231, 2.615259, 0.3607843, 0, 1, 1,
0.6162035, 1.174628, -0.1679716, 0.3686275, 0, 1, 1,
0.6202052, -1.246238, 4.926833, 0.372549, 0, 1, 1,
0.624916, 0.3982909, 0.8905719, 0.3803922, 0, 1, 1,
0.6289138, -1.534466, 3.296026, 0.3843137, 0, 1, 1,
0.6313675, -0.542738, 4.365906, 0.3921569, 0, 1, 1,
0.6358989, 2.332678, 1.312549, 0.3960784, 0, 1, 1,
0.6370769, -0.1741463, 2.127065, 0.4039216, 0, 1, 1,
0.6380845, -1.556564, 2.680123, 0.4117647, 0, 1, 1,
0.6383102, -0.5092636, 1.070685, 0.4156863, 0, 1, 1,
0.6392352, -0.4289442, 2.912546, 0.4235294, 0, 1, 1,
0.6397908, 1.141803, -1.180325, 0.427451, 0, 1, 1,
0.6438697, 0.4860499, 0.2463814, 0.4352941, 0, 1, 1,
0.6508607, 0.3611654, 2.241265, 0.4392157, 0, 1, 1,
0.6508918, -1.209615, 2.572376, 0.4470588, 0, 1, 1,
0.6524553, 1.449057, -1.131994, 0.4509804, 0, 1, 1,
0.6627675, 0.9133521, 2.004717, 0.4588235, 0, 1, 1,
0.6631807, -1.200715, 2.457386, 0.4627451, 0, 1, 1,
0.6636715, 0.2131389, 0.7513267, 0.4705882, 0, 1, 1,
0.6725507, 0.2092593, 2.739266, 0.4745098, 0, 1, 1,
0.6753224, 1.757851, 1.161441, 0.4823529, 0, 1, 1,
0.675888, -0.3813697, 4.060335, 0.4862745, 0, 1, 1,
0.6821507, 1.443659, 1.558487, 0.4941176, 0, 1, 1,
0.6857519, -1.208397, 0.8721742, 0.5019608, 0, 1, 1,
0.6861804, -0.6242561, 0.3707657, 0.5058824, 0, 1, 1,
0.6973094, -0.0143522, 2.116632, 0.5137255, 0, 1, 1,
0.6976088, 0.04911169, 0.9945726, 0.5176471, 0, 1, 1,
0.6989537, 0.7510895, 0.5475929, 0.5254902, 0, 1, 1,
0.7029987, 1.784784, 0.4480137, 0.5294118, 0, 1, 1,
0.709017, 1.420449, -0.8617589, 0.5372549, 0, 1, 1,
0.7099622, -0.346379, 1.167699, 0.5411765, 0, 1, 1,
0.7100824, -0.6927459, 1.919666, 0.5490196, 0, 1, 1,
0.7105143, -0.3387755, 0.353199, 0.5529412, 0, 1, 1,
0.7145933, 0.8571873, 2.788624, 0.5607843, 0, 1, 1,
0.7172046, 0.3825027, 2.725868, 0.5647059, 0, 1, 1,
0.7175153, -0.02682491, 1.701748, 0.572549, 0, 1, 1,
0.7179454, -0.05534132, 1.636748, 0.5764706, 0, 1, 1,
0.7203388, 0.8159824, 2.135346, 0.5843138, 0, 1, 1,
0.7279179, 1.512682, -0.4272672, 0.5882353, 0, 1, 1,
0.7358255, 2.358251, -0.9484978, 0.5960785, 0, 1, 1,
0.7398583, -1.174082, 2.750185, 0.6039216, 0, 1, 1,
0.7432925, 1.17426, 1.326408, 0.6078432, 0, 1, 1,
0.7448699, -0.2341906, 2.517857, 0.6156863, 0, 1, 1,
0.7469104, -0.4479125, 1.133622, 0.6196079, 0, 1, 1,
0.7502242, -0.2707146, 2.103543, 0.627451, 0, 1, 1,
0.750811, 0.4137452, 1.373991, 0.6313726, 0, 1, 1,
0.7508601, -0.6295788, 3.592254, 0.6392157, 0, 1, 1,
0.7535839, 1.873888, 1.459511, 0.6431373, 0, 1, 1,
0.7537671, -0.8797297, 2.843836, 0.6509804, 0, 1, 1,
0.7610934, 0.6308504, -0.007315016, 0.654902, 0, 1, 1,
0.7611102, 1.962858, 1.910767, 0.6627451, 0, 1, 1,
0.7711661, 0.3072117, 1.618471, 0.6666667, 0, 1, 1,
0.774625, -0.8342581, 2.552153, 0.6745098, 0, 1, 1,
0.776789, 1.56111, 1.571887, 0.6784314, 0, 1, 1,
0.7773205, -0.6325302, 1.525632, 0.6862745, 0, 1, 1,
0.7785313, -0.3524754, 2.58102, 0.6901961, 0, 1, 1,
0.7809836, 1.139753, 0.9706185, 0.6980392, 0, 1, 1,
0.7814338, 1.106135, -0.01575165, 0.7058824, 0, 1, 1,
0.7820317, -1.116527, 1.693452, 0.7098039, 0, 1, 1,
0.7833624, 1.664031, 0.6525283, 0.7176471, 0, 1, 1,
0.7856886, -0.1242815, 1.396086, 0.7215686, 0, 1, 1,
0.787836, 0.308239, 1.942235, 0.7294118, 0, 1, 1,
0.7960586, -1.1225, 1.971339, 0.7333333, 0, 1, 1,
0.8033871, 0.5780729, 0.352354, 0.7411765, 0, 1, 1,
0.8060157, -3.169681, 1.768978, 0.7450981, 0, 1, 1,
0.8098251, 1.658269, 0.6715703, 0.7529412, 0, 1, 1,
0.8120103, -1.101625, 2.751166, 0.7568628, 0, 1, 1,
0.8173487, 0.6908873, 2.296459, 0.7647059, 0, 1, 1,
0.8176996, -1.328076, 2.837695, 0.7686275, 0, 1, 1,
0.822766, 0.3975888, 0.01902425, 0.7764706, 0, 1, 1,
0.8262175, 0.8317438, -0.4186026, 0.7803922, 0, 1, 1,
0.826399, -0.8111089, 1.534332, 0.7882353, 0, 1, 1,
0.8290775, 0.2477862, 2.929042, 0.7921569, 0, 1, 1,
0.8303359, 0.05009054, 2.069525, 0.8, 0, 1, 1,
0.8350791, -0.606787, 2.549179, 0.8078431, 0, 1, 1,
0.8477371, -1.528852, 2.479789, 0.8117647, 0, 1, 1,
0.8519474, -0.1555854, 0.8573524, 0.8196079, 0, 1, 1,
0.8536214, -1.907447, 2.011683, 0.8235294, 0, 1, 1,
0.8555127, 0.04795479, 3.778722, 0.8313726, 0, 1, 1,
0.8559822, -0.01307162, 2.124744, 0.8352941, 0, 1, 1,
0.8575725, -0.970321, 1.466814, 0.8431373, 0, 1, 1,
0.8590842, 1.870503, -0.3264049, 0.8470588, 0, 1, 1,
0.860245, 0.7047858, -0.5083172, 0.854902, 0, 1, 1,
0.8640081, -0.8408181, 3.461158, 0.8588235, 0, 1, 1,
0.8640342, 0.8618304, 0.9023032, 0.8666667, 0, 1, 1,
0.8688014, 1.471857, 0.03268412, 0.8705882, 0, 1, 1,
0.8695734, 0.9927888, 2.701924, 0.8784314, 0, 1, 1,
0.8707365, 0.6155666, 1.83778, 0.8823529, 0, 1, 1,
0.8713605, -1.48898, 0.480439, 0.8901961, 0, 1, 1,
0.8714898, 0.9105971, 1.20911, 0.8941177, 0, 1, 1,
0.8725999, -0.1322757, 0.535576, 0.9019608, 0, 1, 1,
0.8731472, -0.4960619, 3.230378, 0.9098039, 0, 1, 1,
0.873755, -0.8406615, 1.616578, 0.9137255, 0, 1, 1,
0.8902434, 0.6119715, 1.296187, 0.9215686, 0, 1, 1,
0.9164271, -0.5119768, 2.883729, 0.9254902, 0, 1, 1,
0.929626, -0.04624487, 2.510886, 0.9333333, 0, 1, 1,
0.9335881, -1.314464, 4.918585, 0.9372549, 0, 1, 1,
0.9338477, 0.3037882, 1.116034, 0.945098, 0, 1, 1,
0.9344688, -0.7243134, 0.4655257, 0.9490196, 0, 1, 1,
0.9380097, 1.006416, 0.7472354, 0.9568627, 0, 1, 1,
0.9403238, -0.4811041, 1.94023, 0.9607843, 0, 1, 1,
0.9460487, 0.537544, 1.914146, 0.9686275, 0, 1, 1,
0.9493359, 0.08931885, 1.947883, 0.972549, 0, 1, 1,
0.9603589, 0.9336468, 0.2780324, 0.9803922, 0, 1, 1,
0.9621267, 0.3871855, 0.03027385, 0.9843137, 0, 1, 1,
0.9626008, -0.8935412, 2.112421, 0.9921569, 0, 1, 1,
0.9643752, 0.2528753, 0.8303888, 0.9960784, 0, 1, 1,
0.9681747, 0.09661491, 0.9465057, 1, 0, 0.9960784, 1,
0.9693474, 0.3752329, 1.089995, 1, 0, 0.9882353, 1,
0.9725026, -0.622209, 2.74406, 1, 0, 0.9843137, 1,
0.9817957, 0.5492052, 3.043394, 1, 0, 0.9764706, 1,
0.9821543, 0.8346018, 1.564618, 1, 0, 0.972549, 1,
0.9821959, 1.262363, 1.883648, 1, 0, 0.9647059, 1,
0.9861998, -0.6466399, 1.084208, 1, 0, 0.9607843, 1,
0.9915118, 0.8069251, 0.95586, 1, 0, 0.9529412, 1,
0.9940628, 0.2510734, 0.5436845, 1, 0, 0.9490196, 1,
0.9944055, 0.5810822, 2.415767, 1, 0, 0.9411765, 1,
0.9956136, -0.7142535, 2.118992, 1, 0, 0.9372549, 1,
0.9964567, -0.4773579, 4.882253, 1, 0, 0.9294118, 1,
1.000631, 0.1155524, 1.101795, 1, 0, 0.9254902, 1,
1.005431, 2.186006, 0.6384967, 1, 0, 0.9176471, 1,
1.018261, 0.5027057, 1.244434, 1, 0, 0.9137255, 1,
1.019654, -0.04395425, 2.866352, 1, 0, 0.9058824, 1,
1.024495, 0.3949393, 2.692076, 1, 0, 0.9019608, 1,
1.025109, -0.03472537, 2.372795, 1, 0, 0.8941177, 1,
1.027611, 0.7106416, 2.352097, 1, 0, 0.8862745, 1,
1.037241, 0.9771592, 1.469001, 1, 0, 0.8823529, 1,
1.050048, 1.271458, 1.950469, 1, 0, 0.8745098, 1,
1.050366, -0.05436188, 1.434084, 1, 0, 0.8705882, 1,
1.051087, 0.9596654, 0.8380755, 1, 0, 0.8627451, 1,
1.060123, 0.3875874, 0.9531958, 1, 0, 0.8588235, 1,
1.067916, 1.034923, 1.087908, 1, 0, 0.8509804, 1,
1.070793, 0.5413669, 0.8864603, 1, 0, 0.8470588, 1,
1.083348, -1.077961, 2.089244, 1, 0, 0.8392157, 1,
1.083584, -1.201393, 3.690012, 1, 0, 0.8352941, 1,
1.083843, -1.20646, 2.205044, 1, 0, 0.827451, 1,
1.096993, 0.4828125, 1.821559, 1, 0, 0.8235294, 1,
1.098469, -0.6080074, 2.011354, 1, 0, 0.8156863, 1,
1.101659, 1.331367, -0.4001754, 1, 0, 0.8117647, 1,
1.102329, -1.229944, 2.841807, 1, 0, 0.8039216, 1,
1.103011, 0.293059, 0.980699, 1, 0, 0.7960784, 1,
1.103703, 0.632053, 1.147147, 1, 0, 0.7921569, 1,
1.109626, 0.01662146, 1.708212, 1, 0, 0.7843137, 1,
1.112304, -1.187618, 1.987071, 1, 0, 0.7803922, 1,
1.112888, 1.531093, 0.7846246, 1, 0, 0.772549, 1,
1.116588, -0.3702629, 1.209567, 1, 0, 0.7686275, 1,
1.125156, -2.537357, 2.624254, 1, 0, 0.7607843, 1,
1.127349, -1.438699, 2.520798, 1, 0, 0.7568628, 1,
1.139944, 0.724116, -0.1532566, 1, 0, 0.7490196, 1,
1.150473, -0.04392353, 1.576748, 1, 0, 0.7450981, 1,
1.15219, 1.611596, 0.1163979, 1, 0, 0.7372549, 1,
1.153575, 0.8950037, 3.182215, 1, 0, 0.7333333, 1,
1.159933, -1.793923, 2.234405, 1, 0, 0.7254902, 1,
1.164428, -0.4350467, 3.252506, 1, 0, 0.7215686, 1,
1.176139, 0.5552997, 1.238442, 1, 0, 0.7137255, 1,
1.178595, 1.096392, 0.9857912, 1, 0, 0.7098039, 1,
1.189318, 0.8973876, -0.2453441, 1, 0, 0.7019608, 1,
1.204851, -1.472556, 3.106706, 1, 0, 0.6941177, 1,
1.224135, -0.3856036, 1.367857, 1, 0, 0.6901961, 1,
1.224515, 1.289321, 1.157456, 1, 0, 0.682353, 1,
1.225565, -0.6980249, -0.135615, 1, 0, 0.6784314, 1,
1.226502, 0.2855189, 1.913132, 1, 0, 0.6705883, 1,
1.232131, -2.74296, 2.998085, 1, 0, 0.6666667, 1,
1.23702, 1.510002, 1.480578, 1, 0, 0.6588235, 1,
1.238496, 2.539552, 1.068385, 1, 0, 0.654902, 1,
1.244281, 0.513955, 0.01523915, 1, 0, 0.6470588, 1,
1.249423, 1.233159, 1.191762, 1, 0, 0.6431373, 1,
1.250769, -0.6696182, 1.359141, 1, 0, 0.6352941, 1,
1.251483, 0.001007667, 0.9999931, 1, 0, 0.6313726, 1,
1.252139, 0.8628805, -0.7855278, 1, 0, 0.6235294, 1,
1.253636, 1.394842, 1.879902, 1, 0, 0.6196079, 1,
1.274037, -1.866575, 2.522813, 1, 0, 0.6117647, 1,
1.274383, -1.053614, 2.750089, 1, 0, 0.6078432, 1,
1.274519, -0.1862711, 1.621905, 1, 0, 0.6, 1,
1.281298, 0.8480192, 1.905073, 1, 0, 0.5921569, 1,
1.295527, -0.5883602, 2.886422, 1, 0, 0.5882353, 1,
1.301752, 2.009914, 0.8865027, 1, 0, 0.5803922, 1,
1.30191, -1.544016, 2.378736, 1, 0, 0.5764706, 1,
1.302505, -0.4834189, 2.907086, 1, 0, 0.5686275, 1,
1.313082, -0.6734133, 1.777248, 1, 0, 0.5647059, 1,
1.330114, -0.7975064, 2.365772, 1, 0, 0.5568628, 1,
1.336147, 0.166202, 0.4775772, 1, 0, 0.5529412, 1,
1.347799, -0.5338393, 2.802011, 1, 0, 0.5450981, 1,
1.348111, -0.9985307, 2.491066, 1, 0, 0.5411765, 1,
1.350519, -1.213995, 2.541417, 1, 0, 0.5333334, 1,
1.35138, -0.5662559, 3.109741, 1, 0, 0.5294118, 1,
1.355304, 1.312648, 1.701598, 1, 0, 0.5215687, 1,
1.36, -0.4770201, 1.37794, 1, 0, 0.5176471, 1,
1.361523, -0.2554298, 1.976829, 1, 0, 0.509804, 1,
1.361726, 2.089641, -1.526529, 1, 0, 0.5058824, 1,
1.368334, 0.4197627, 2.055955, 1, 0, 0.4980392, 1,
1.376255, 1.547139, 1.139492, 1, 0, 0.4901961, 1,
1.387691, 0.7032394, 2.064575, 1, 0, 0.4862745, 1,
1.418166, -0.2540253, 1.655541, 1, 0, 0.4784314, 1,
1.424425, 0.121325, 0.8253964, 1, 0, 0.4745098, 1,
1.428379, -1.280426, 2.478966, 1, 0, 0.4666667, 1,
1.436479, 0.6972496, 0.5931999, 1, 0, 0.4627451, 1,
1.448543, -0.6417326, 1.66126, 1, 0, 0.454902, 1,
1.454869, 0.2842955, 1.923969, 1, 0, 0.4509804, 1,
1.458345, -0.2632174, -0.1091743, 1, 0, 0.4431373, 1,
1.459753, 0.7458622, 0.357481, 1, 0, 0.4392157, 1,
1.46039, 0.1518741, 0.06208266, 1, 0, 0.4313726, 1,
1.464657, -0.6687721, 1.320522, 1, 0, 0.427451, 1,
1.466472, 1.436952, 0.9044183, 1, 0, 0.4196078, 1,
1.47554, -0.6907629, 1.322212, 1, 0, 0.4156863, 1,
1.481637, 0.3684214, 2.005522, 1, 0, 0.4078431, 1,
1.484633, 1.815061, 1.213348, 1, 0, 0.4039216, 1,
1.484724, 0.3769624, 0.9680846, 1, 0, 0.3960784, 1,
1.486166, -0.8043994, 0.704855, 1, 0, 0.3882353, 1,
1.486751, -1.863035, 2.159706, 1, 0, 0.3843137, 1,
1.491567, 1.261181, 0.8306831, 1, 0, 0.3764706, 1,
1.498171, 0.5820013, 0.6800805, 1, 0, 0.372549, 1,
1.502031, 0.180154, 2.16011, 1, 0, 0.3647059, 1,
1.508497, -2.558492, 2.852016, 1, 0, 0.3607843, 1,
1.515057, 1.06497, 3.014336, 1, 0, 0.3529412, 1,
1.520279, 0.9056714, 0.7930908, 1, 0, 0.3490196, 1,
1.525778, -0.4411112, 2.500517, 1, 0, 0.3411765, 1,
1.530477, -1.123303, 0.3843148, 1, 0, 0.3372549, 1,
1.55633, -0.7981778, 1.337247, 1, 0, 0.3294118, 1,
1.594605, -0.8287109, 2.544913, 1, 0, 0.3254902, 1,
1.599549, 2.223372, 0.4163618, 1, 0, 0.3176471, 1,
1.603527, -0.1456012, 0.7051529, 1, 0, 0.3137255, 1,
1.612325, 1.199207, 0.5011272, 1, 0, 0.3058824, 1,
1.638793, -0.592905, 2.012944, 1, 0, 0.2980392, 1,
1.650264, 2.11676, -0.5911809, 1, 0, 0.2941177, 1,
1.653587, 1.323078, 2.263648, 1, 0, 0.2862745, 1,
1.654896, 0.2827699, 0.2566509, 1, 0, 0.282353, 1,
1.665833, 2.178375, 1.698304, 1, 0, 0.2745098, 1,
1.670708, -0.9350299, 1.388373, 1, 0, 0.2705882, 1,
1.676563, -0.6504558, 0.5943466, 1, 0, 0.2627451, 1,
1.689075, -0.1367673, 2.116382, 1, 0, 0.2588235, 1,
1.703878, 0.1212313, 2.367285, 1, 0, 0.2509804, 1,
1.708822, -1.17971, 3.827962, 1, 0, 0.2470588, 1,
1.739335, -0.3210234, 0.5505731, 1, 0, 0.2392157, 1,
1.768302, 0.6440498, 1.484052, 1, 0, 0.2352941, 1,
1.776559, 0.8476101, 2.83025, 1, 0, 0.227451, 1,
1.776569, -0.4376114, 1.511861, 1, 0, 0.2235294, 1,
1.807408, 1.796129, 0.9851671, 1, 0, 0.2156863, 1,
1.823735, -0.3254705, -0.2834374, 1, 0, 0.2117647, 1,
1.839674, -0.3843784, 2.262034, 1, 0, 0.2039216, 1,
1.850027, -0.6349142, 1.017979, 1, 0, 0.1960784, 1,
1.865543, 0.9627038, 0.2768641, 1, 0, 0.1921569, 1,
1.874732, 0.1151332, 1.694171, 1, 0, 0.1843137, 1,
1.8754, -0.5292343, -0.01719603, 1, 0, 0.1803922, 1,
1.901877, -0.1536549, -0.1300464, 1, 0, 0.172549, 1,
1.903403, 1.265845, 2.41594, 1, 0, 0.1686275, 1,
1.916099, -0.8240663, 2.4323, 1, 0, 0.1607843, 1,
1.917025, -0.3633794, 0.5195848, 1, 0, 0.1568628, 1,
1.919215, 1.393722, 1.443473, 1, 0, 0.1490196, 1,
1.947809, -1.535633, 2.950942, 1, 0, 0.145098, 1,
1.955436, -0.2894901, 2.464383, 1, 0, 0.1372549, 1,
1.958685, 1.026257, -0.3227728, 1, 0, 0.1333333, 1,
1.999004, -0.7394764, 1.390094, 1, 0, 0.1254902, 1,
2.017635, 1.510221, 0.7240383, 1, 0, 0.1215686, 1,
2.040645, 0.03826052, 0.9971274, 1, 0, 0.1137255, 1,
2.087637, 0.3726001, 1.956888, 1, 0, 0.1098039, 1,
2.155685, 0.2219045, 1.900948, 1, 0, 0.1019608, 1,
2.17292, 1.250221, 0.2958888, 1, 0, 0.09411765, 1,
2.458845, 0.3889937, 0.3134023, 1, 0, 0.09019608, 1,
2.470025, -0.7788538, 3.567663, 1, 0, 0.08235294, 1,
2.49801, -0.6071503, -0.04467374, 1, 0, 0.07843138, 1,
2.510228, -1.847566, 3.94652, 1, 0, 0.07058824, 1,
2.524132, -1.583055, 1.94967, 1, 0, 0.06666667, 1,
2.706651, -0.04118189, 1.715128, 1, 0, 0.05882353, 1,
2.714703, -2.720861, 2.489542, 1, 0, 0.05490196, 1,
2.75813, 1.466009, 1.007167, 1, 0, 0.04705882, 1,
2.759721, -0.8088467, 3.211589, 1, 0, 0.04313726, 1,
2.765513, -0.8129885, 1.633103, 1, 0, 0.03529412, 1,
2.821229, -0.1533892, 1.359362, 1, 0, 0.03137255, 1,
2.892073, -0.1149247, 2.189885, 1, 0, 0.02352941, 1,
2.9263, -0.4572965, 2.618621, 1, 0, 0.01960784, 1,
3.38393, -0.6725007, -0.3395718, 1, 0, 0.01176471, 1,
3.814322, -0.5722075, 2.244928, 1, 0, 0.007843138, 1
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
0.2980019, -4.240767, -6.95927, 0, -0.5, 0.5, 0.5,
0.2980019, -4.240767, -6.95927, 1, -0.5, 0.5, 0.5,
0.2980019, -4.240767, -6.95927, 1, 1.5, 0.5, 0.5,
0.2980019, -4.240767, -6.95927, 0, 1.5, 0.5, 0.5
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
-4.41035, -0.01013851, -6.95927, 0, -0.5, 0.5, 0.5,
-4.41035, -0.01013851, -6.95927, 1, -0.5, 0.5, 0.5,
-4.41035, -0.01013851, -6.95927, 1, 1.5, 0.5, 0.5,
-4.41035, -0.01013851, -6.95927, 0, 1.5, 0.5, 0.5
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
-4.41035, -4.240767, -0.1548696, 0, -0.5, 0.5, 0.5,
-4.41035, -4.240767, -0.1548696, 1, -0.5, 0.5, 0.5,
-4.41035, -4.240767, -0.1548696, 1, 1.5, 0.5, 0.5,
-4.41035, -4.240767, -0.1548696, 0, 1.5, 0.5, 0.5
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
-2, -3.264467, -5.389023,
2, -3.264467, -5.389023,
-2, -3.264467, -5.389023,
-2, -3.427184, -5.650731,
0, -3.264467, -5.389023,
0, -3.427184, -5.650731,
2, -3.264467, -5.389023,
2, -3.427184, -5.650731
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
"0",
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
-2, -3.752617, -6.174147, 0, -0.5, 0.5, 0.5,
-2, -3.752617, -6.174147, 1, -0.5, 0.5, 0.5,
-2, -3.752617, -6.174147, 1, 1.5, 0.5, 0.5,
-2, -3.752617, -6.174147, 0, 1.5, 0.5, 0.5,
0, -3.752617, -6.174147, 0, -0.5, 0.5, 0.5,
0, -3.752617, -6.174147, 1, -0.5, 0.5, 0.5,
0, -3.752617, -6.174147, 1, 1.5, 0.5, 0.5,
0, -3.752617, -6.174147, 0, 1.5, 0.5, 0.5,
2, -3.752617, -6.174147, 0, -0.5, 0.5, 0.5,
2, -3.752617, -6.174147, 1, -0.5, 0.5, 0.5,
2, -3.752617, -6.174147, 1, 1.5, 0.5, 0.5,
2, -3.752617, -6.174147, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.323807, -3, -5.389023,
-3.323807, 3, -5.389023,
-3.323807, -3, -5.389023,
-3.504898, -3, -5.650731,
-3.323807, -2, -5.389023,
-3.504898, -2, -5.650731,
-3.323807, -1, -5.389023,
-3.504898, -1, -5.650731,
-3.323807, 0, -5.389023,
-3.504898, 0, -5.650731,
-3.323807, 1, -5.389023,
-3.504898, 1, -5.650731,
-3.323807, 2, -5.389023,
-3.504898, 2, -5.650731,
-3.323807, 3, -5.389023,
-3.504898, 3, -5.650731
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
-3.867079, -3, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, -3, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, -3, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, -3, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, -2, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, -2, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, -2, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, -2, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, -1, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, -1, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, -1, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, -1, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, 0, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, 0, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, 0, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, 0, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, 1, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, 1, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, 1, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, 1, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, 2, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, 2, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, 2, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, 2, -6.174147, 0, 1.5, 0.5, 0.5,
-3.867079, 3, -6.174147, 0, -0.5, 0.5, 0.5,
-3.867079, 3, -6.174147, 1, -0.5, 0.5, 0.5,
-3.867079, 3, -6.174147, 1, 1.5, 0.5, 0.5,
-3.867079, 3, -6.174147, 0, 1.5, 0.5, 0.5
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
-3.323807, -3.264467, -4,
-3.323807, -3.264467, 4,
-3.323807, -3.264467, -4,
-3.504898, -3.427184, -4,
-3.323807, -3.264467, -2,
-3.504898, -3.427184, -2,
-3.323807, -3.264467, 0,
-3.504898, -3.427184, 0,
-3.323807, -3.264467, 2,
-3.504898, -3.427184, 2,
-3.323807, -3.264467, 4,
-3.504898, -3.427184, 4
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
-3.867079, -3.752617, -4, 0, -0.5, 0.5, 0.5,
-3.867079, -3.752617, -4, 1, -0.5, 0.5, 0.5,
-3.867079, -3.752617, -4, 1, 1.5, 0.5, 0.5,
-3.867079, -3.752617, -4, 0, 1.5, 0.5, 0.5,
-3.867079, -3.752617, -2, 0, -0.5, 0.5, 0.5,
-3.867079, -3.752617, -2, 1, -0.5, 0.5, 0.5,
-3.867079, -3.752617, -2, 1, 1.5, 0.5, 0.5,
-3.867079, -3.752617, -2, 0, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 0, 0, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 0, 1, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 0, 1, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 0, 0, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 2, 0, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 2, 1, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 2, 1, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 2, 0, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 4, 0, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 4, 1, -0.5, 0.5, 0.5,
-3.867079, -3.752617, 4, 1, 1.5, 0.5, 0.5,
-3.867079, -3.752617, 4, 0, 1.5, 0.5, 0.5
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
-3.323807, -3.264467, -5.389023,
-3.323807, 3.24419, -5.389023,
-3.323807, -3.264467, 5.079284,
-3.323807, 3.24419, 5.079284,
-3.323807, -3.264467, -5.389023,
-3.323807, -3.264467, 5.079284,
-3.323807, 3.24419, -5.389023,
-3.323807, 3.24419, 5.079284,
-3.323807, -3.264467, -5.389023,
3.919811, -3.264467, -5.389023,
-3.323807, -3.264467, 5.079284,
3.919811, -3.264467, 5.079284,
-3.323807, 3.24419, -5.389023,
3.919811, 3.24419, -5.389023,
-3.323807, 3.24419, 5.079284,
3.919811, 3.24419, 5.079284,
3.919811, -3.264467, -5.389023,
3.919811, 3.24419, -5.389023,
3.919811, -3.264467, 5.079284,
3.919811, 3.24419, 5.079284,
3.919811, -3.264467, -5.389023,
3.919811, -3.264467, 5.079284,
3.919811, 3.24419, -5.389023,
3.919811, 3.24419, 5.079284
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
var radius = 7.63458;
var distance = 33.96711;
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
mvMatrix.translate( -0.2980019, 0.01013851, 0.1548696 );
mvMatrix.scale( 1.139577, 1.268258, 0.7885379 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96711);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gentamycin<-read.table("gentamycin.xyz")
```

```
## Error in read.table("gentamycin.xyz"): no lines available in input
```

```r
x<-gentamycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
```

```r
y<-gentamycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
```

```r
z<-gentamycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
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
-3.218318, 3.149404, 0.524873, 0, 0, 1, 1, 1,
-3.121828, 1.173692, -1.802112, 1, 0, 0, 1, 1,
-2.885993, 0.2586775, -3.644247, 1, 0, 0, 1, 1,
-2.865377, 1.76306, 0.4846665, 1, 0, 0, 1, 1,
-2.813158, -1.680748, -0.3629956, 1, 0, 0, 1, 1,
-2.710996, -1.765764, -2.826937, 1, 0, 0, 1, 1,
-2.67768, 1.068686, -2.022959, 0, 0, 0, 1, 1,
-2.63992, -0.6832213, -0.6255454, 0, 0, 0, 1, 1,
-2.627033, -0.3344458, -1.058059, 0, 0, 0, 1, 1,
-2.559439, 0.1522699, -0.9140819, 0, 0, 0, 1, 1,
-2.542036, 0.852065, -0.05068195, 0, 0, 0, 1, 1,
-2.511724, -1.274656, -2.162288, 0, 0, 0, 1, 1,
-2.500602, -1.078705, -1.817056, 0, 0, 0, 1, 1,
-2.393044, 1.460635, -1.727854, 1, 1, 1, 1, 1,
-2.389535, 0.6843092, 0.2756238, 1, 1, 1, 1, 1,
-2.371602, -0.1001338, -1.857904, 1, 1, 1, 1, 1,
-2.311787, 0.5382853, -0.330601, 1, 1, 1, 1, 1,
-2.298339, 0.1255441, -1.882608, 1, 1, 1, 1, 1,
-2.296092, -1.2894, -1.199229, 1, 1, 1, 1, 1,
-2.29251, -0.201301, 0.3602284, 1, 1, 1, 1, 1,
-2.239438, -1.777697, -1.931699, 1, 1, 1, 1, 1,
-2.218984, -0.720395, -2.058923, 1, 1, 1, 1, 1,
-2.200791, -0.01877981, -0.4686252, 1, 1, 1, 1, 1,
-2.125919, -0.01303591, -1.974461, 1, 1, 1, 1, 1,
-2.123233, -2.592118, -2.658337, 1, 1, 1, 1, 1,
-2.093875, 0.3617962, -1.240953, 1, 1, 1, 1, 1,
-2.087618, 1.033, -1.138542, 1, 1, 1, 1, 1,
-2.034356, 1.030875, -2.026507, 1, 1, 1, 1, 1,
-2.008395, -1.163844, -0.6880157, 0, 0, 1, 1, 1,
-1.990435, 0.2677097, -3.324562, 1, 0, 0, 1, 1,
-1.949171, 1.116636, 0.8535957, 1, 0, 0, 1, 1,
-1.935894, 0.7914079, -2.261834, 1, 0, 0, 1, 1,
-1.932354, -0.4768606, -2.05291, 1, 0, 0, 1, 1,
-1.926186, -1.102081, -1.945088, 1, 0, 0, 1, 1,
-1.920669, 0.6409901, 0.09343457, 0, 0, 0, 1, 1,
-1.913825, 0.8593385, -0.07858078, 0, 0, 0, 1, 1,
-1.88398, -0.7588468, -2.368493, 0, 0, 0, 1, 1,
-1.873667, 0.4850106, -1.968874, 0, 0, 0, 1, 1,
-1.862078, 0.5463575, -0.7369813, 0, 0, 0, 1, 1,
-1.857651, -0.652806, -2.689683, 0, 0, 0, 1, 1,
-1.849564, 0.08673617, -0.9811254, 0, 0, 0, 1, 1,
-1.846177, 0.9437266, -2.146594, 1, 1, 1, 1, 1,
-1.846005, -0.3789031, -3.262466, 1, 1, 1, 1, 1,
-1.835401, -0.7242771, -2.627496, 1, 1, 1, 1, 1,
-1.83309, -0.08756451, 0.1217334, 1, 1, 1, 1, 1,
-1.806216, -0.2371389, -2.519536, 1, 1, 1, 1, 1,
-1.798754, -0.4826765, -0.0977197, 1, 1, 1, 1, 1,
-1.772568, -1.070128, -2.019629, 1, 1, 1, 1, 1,
-1.768634, -0.3259469, -3.539001, 1, 1, 1, 1, 1,
-1.755626, -0.3160372, -1.703815, 1, 1, 1, 1, 1,
-1.754517, 0.4001451, -2.589253, 1, 1, 1, 1, 1,
-1.748094, -0.117173, 0.7797875, 1, 1, 1, 1, 1,
-1.710311, 0.3360751, -1.046175, 1, 1, 1, 1, 1,
-1.695843, -1.506678, -1.25613, 1, 1, 1, 1, 1,
-1.691721, -0.5674909, -0.8973045, 1, 1, 1, 1, 1,
-1.663448, -0.2284221, -4.474529, 1, 1, 1, 1, 1,
-1.656113, 0.6137965, -2.61587, 0, 0, 1, 1, 1,
-1.643394, 0.3889279, -3.308491, 1, 0, 0, 1, 1,
-1.627768, -0.1516894, -2.243833, 1, 0, 0, 1, 1,
-1.626309, 1.405614, -1.695235, 1, 0, 0, 1, 1,
-1.619452, 0.8681892, -0.4052082, 1, 0, 0, 1, 1,
-1.618188, 0.690874, -1.276202, 1, 0, 0, 1, 1,
-1.607922, -0.6568406, -3.044733, 0, 0, 0, 1, 1,
-1.605971, -1.535772, -2.782814, 0, 0, 0, 1, 1,
-1.603794, 1.612765, -0.999101, 0, 0, 0, 1, 1,
-1.595073, 0.1192088, -2.572635, 0, 0, 0, 1, 1,
-1.592371, 0.2705759, -1.996778, 0, 0, 0, 1, 1,
-1.585913, 2.868634, -1.048417, 0, 0, 0, 1, 1,
-1.578812, 0.4327088, -1.252733, 0, 0, 0, 1, 1,
-1.55647, -0.9046841, -2.647144, 1, 1, 1, 1, 1,
-1.552461, 2.753685, -0.3137695, 1, 1, 1, 1, 1,
-1.546489, -1.256395, -1.975503, 1, 1, 1, 1, 1,
-1.544911, -1.170983, -1.17322, 1, 1, 1, 1, 1,
-1.535483, 0.7791991, -1.460231, 1, 1, 1, 1, 1,
-1.53097, -0.9496855, -1.281902, 1, 1, 1, 1, 1,
-1.527323, 0.138395, -3.492799, 1, 1, 1, 1, 1,
-1.520411, -0.04670668, -0.4929753, 1, 1, 1, 1, 1,
-1.51275, -0.7181618, -3.755269, 1, 1, 1, 1, 1,
-1.508133, -0.8884078, -2.369488, 1, 1, 1, 1, 1,
-1.497976, -2.043001, -2.065458, 1, 1, 1, 1, 1,
-1.493339, 0.5137173, 0.432228, 1, 1, 1, 1, 1,
-1.489145, -1.05321, -3.312059, 1, 1, 1, 1, 1,
-1.486917, 1.179381, -0.5445861, 1, 1, 1, 1, 1,
-1.477801, 0.2729962, -2.034488, 1, 1, 1, 1, 1,
-1.476602, -0.8091556, -1.604426, 0, 0, 1, 1, 1,
-1.472588, 0.1929185, -0.8574418, 1, 0, 0, 1, 1,
-1.470993, -0.3310088, -2.533638, 1, 0, 0, 1, 1,
-1.469593, -0.2754684, -1.750916, 1, 0, 0, 1, 1,
-1.46731, 1.003723, -1.635591, 1, 0, 0, 1, 1,
-1.453899, -2.025887, -1.738823, 1, 0, 0, 1, 1,
-1.444889, -0.1633237, -2.684884, 0, 0, 0, 1, 1,
-1.436546, -1.466038, -1.246631, 0, 0, 0, 1, 1,
-1.431728, 1.060622, -0.002617844, 0, 0, 0, 1, 1,
-1.430267, 1.04128, -0.9838213, 0, 0, 0, 1, 1,
-1.425527, 0.6584638, -2.102339, 0, 0, 0, 1, 1,
-1.423317, 0.4966913, 0.18415, 0, 0, 0, 1, 1,
-1.422911, 0.6824161, -0.583044, 0, 0, 0, 1, 1,
-1.420759, -0.6909228, -3.400884, 1, 1, 1, 1, 1,
-1.411453, -0.6059349, -1.96028, 1, 1, 1, 1, 1,
-1.411171, 0.7713289, 1.020646, 1, 1, 1, 1, 1,
-1.403778, 0.1884838, -0.004609684, 1, 1, 1, 1, 1,
-1.402533, 1.805388, 0.72458, 1, 1, 1, 1, 1,
-1.400132, 0.3859909, -1.839865, 1, 1, 1, 1, 1,
-1.388498, -0.2146201, -0.5118502, 1, 1, 1, 1, 1,
-1.383448, 1.760139, 1.386126, 1, 1, 1, 1, 1,
-1.375062, 0.918125, -0.9337194, 1, 1, 1, 1, 1,
-1.370419, -0.03483621, -2.245429, 1, 1, 1, 1, 1,
-1.36256, 0.3187174, -0.8913071, 1, 1, 1, 1, 1,
-1.358978, 0.4126075, -0.4658077, 1, 1, 1, 1, 1,
-1.350225, -1.877487, -2.403327, 1, 1, 1, 1, 1,
-1.338956, 0.6808458, -0.801035, 1, 1, 1, 1, 1,
-1.336388, -0.2429741, -2.038911, 1, 1, 1, 1, 1,
-1.328174, -1.072105, -2.325947, 0, 0, 1, 1, 1,
-1.317594, -1.411073, -0.9334334, 1, 0, 0, 1, 1,
-1.311852, 1.043416, -0.2266669, 1, 0, 0, 1, 1,
-1.306852, 0.08674098, -0.02913362, 1, 0, 0, 1, 1,
-1.282448, 0.01732998, -1.695558, 1, 0, 0, 1, 1,
-1.280517, 0.5232553, -0.7386498, 1, 0, 0, 1, 1,
-1.276043, -1.418693, -4.765644, 0, 0, 0, 1, 1,
-1.274997, -0.04384717, -1.992327, 0, 0, 0, 1, 1,
-1.272985, 0.09534425, -1.465411, 0, 0, 0, 1, 1,
-1.271766, -0.7165262, -1.08611, 0, 0, 0, 1, 1,
-1.271324, -0.9262438, -2.045943, 0, 0, 0, 1, 1,
-1.254591, -1.620319, -1.125856, 0, 0, 0, 1, 1,
-1.250782, 0.8682171, 0.2640853, 0, 0, 0, 1, 1,
-1.247936, 0.179816, 0.5624173, 1, 1, 1, 1, 1,
-1.246506, 1.86018, -0.7632595, 1, 1, 1, 1, 1,
-1.226676, -1.673298, -1.681517, 1, 1, 1, 1, 1,
-1.224934, -1.440901, -1.948156, 1, 1, 1, 1, 1,
-1.220999, 1.016184, -2.190056, 1, 1, 1, 1, 1,
-1.204727, 1.526163, 1.14776, 1, 1, 1, 1, 1,
-1.20283, -0.9945922, -1.720528, 1, 1, 1, 1, 1,
-1.193774, -0.512687, -0.9007007, 1, 1, 1, 1, 1,
-1.190178, -0.6175171, -2.837079, 1, 1, 1, 1, 1,
-1.189237, -0.9384924, -1.76817, 1, 1, 1, 1, 1,
-1.18921, -0.5570925, -2.794636, 1, 1, 1, 1, 1,
-1.1882, -0.3270093, -1.516806, 1, 1, 1, 1, 1,
-1.18008, -0.83271, -1.602868, 1, 1, 1, 1, 1,
-1.178574, 2.745415, -1.385481, 1, 1, 1, 1, 1,
-1.168777, 0.7325518, -0.6589155, 1, 1, 1, 1, 1,
-1.157238, 1.228343, 0.1397387, 0, 0, 1, 1, 1,
-1.150412, 0.8248962, -0.1809162, 1, 0, 0, 1, 1,
-1.143363, 0.05262844, -1.883418, 1, 0, 0, 1, 1,
-1.14031, 0.409537, -1.326938, 1, 0, 0, 1, 1,
-1.137207, -0.2133833, -1.294909, 1, 0, 0, 1, 1,
-1.128843, -0.3264897, -1.188343, 1, 0, 0, 1, 1,
-1.124632, -0.1508915, -1.029735, 0, 0, 0, 1, 1,
-1.123902, 1.14071, -0.1555992, 0, 0, 0, 1, 1,
-1.113949, -0.0845259, -2.746665, 0, 0, 0, 1, 1,
-1.109526, -0.04126284, -2.386886, 0, 0, 0, 1, 1,
-1.106476, 0.4033134, -2.133768, 0, 0, 0, 1, 1,
-1.106257, -1.530309, -0.3818659, 0, 0, 0, 1, 1,
-1.10484, -0.3119216, -0.8407104, 0, 0, 0, 1, 1,
-1.092604, -0.4940134, -1.425096, 1, 1, 1, 1, 1,
-1.079218, -0.5969099, -2.707482, 1, 1, 1, 1, 1,
-1.071039, -1.905088, -3.083786, 1, 1, 1, 1, 1,
-1.068649, -0.9977662, -2.776429, 1, 1, 1, 1, 1,
-1.06729, 0.2654556, -1.138292, 1, 1, 1, 1, 1,
-1.066945, -0.1226705, -3.713725, 1, 1, 1, 1, 1,
-1.04268, -0.09747562, -1.407599, 1, 1, 1, 1, 1,
-1.033604, -0.8599746, -2.798073, 1, 1, 1, 1, 1,
-1.027865, 1.823316, 0.4070571, 1, 1, 1, 1, 1,
-1.023989, 2.184822, -0.5339471, 1, 1, 1, 1, 1,
-1.019271, 0.2937167, -0.9886825, 1, 1, 1, 1, 1,
-1.01883, 0.3294132, -1.562885, 1, 1, 1, 1, 1,
-1.018723, -0.6616099, -3.250487, 1, 1, 1, 1, 1,
-1.009848, -1.234593, -2.75873, 1, 1, 1, 1, 1,
-1.007722, 0.8293467, 0.4565011, 1, 1, 1, 1, 1,
-1.003507, -0.01200832, -1.418095, 0, 0, 1, 1, 1,
-1.003035, 1.557171, -0.8734221, 1, 0, 0, 1, 1,
-1.000823, -0.2719476, -1.928506, 1, 0, 0, 1, 1,
-1.000507, -0.8322377, -3.957771, 1, 0, 0, 1, 1,
-0.990666, -0.0525072, -1.352368, 1, 0, 0, 1, 1,
-0.9880324, -0.4467316, -2.824479, 1, 0, 0, 1, 1,
-0.9721094, -0.8615195, -2.911251, 0, 0, 0, 1, 1,
-0.9653617, 2.027151, -0.5490201, 0, 0, 0, 1, 1,
-0.9548806, -0.303182, -3.900054, 0, 0, 0, 1, 1,
-0.9482177, -1.701944, -3.302478, 0, 0, 0, 1, 1,
-0.9452583, -0.8204386, -2.873331, 0, 0, 0, 1, 1,
-0.9385107, 1.563089, -1.431195, 0, 0, 0, 1, 1,
-0.9372375, -0.0179453, -1.861703, 0, 0, 0, 1, 1,
-0.9361027, 1.695957, -0.615227, 1, 1, 1, 1, 1,
-0.9359425, 1.724043, -0.9175787, 1, 1, 1, 1, 1,
-0.9338292, 0.4734181, -1.49345, 1, 1, 1, 1, 1,
-0.9307692, 0.945852, 1.485383, 1, 1, 1, 1, 1,
-0.9180809, -0.1407283, -1.912084, 1, 1, 1, 1, 1,
-0.9174952, -0.3562145, -0.5157399, 1, 1, 1, 1, 1,
-0.913447, -0.7158247, -2.617004, 1, 1, 1, 1, 1,
-0.9110984, -0.3980001, -1.948962, 1, 1, 1, 1, 1,
-0.9087178, -1.137882, -3.562308, 1, 1, 1, 1, 1,
-0.9029554, 0.7107164, -2.131094, 1, 1, 1, 1, 1,
-0.9025562, -0.8928859, -2.301703, 1, 1, 1, 1, 1,
-0.8943067, 0.08849091, -0.9291859, 1, 1, 1, 1, 1,
-0.8896304, -0.6536098, -3.596517, 1, 1, 1, 1, 1,
-0.8830851, 1.343702, -2.118283, 1, 1, 1, 1, 1,
-0.8796203, -0.1726847, -0.1743089, 1, 1, 1, 1, 1,
-0.8730861, 0.6484657, -1.178244, 0, 0, 1, 1, 1,
-0.8667073, 0.200688, -0.4906917, 1, 0, 0, 1, 1,
-0.8663404, -0.4582572, -2.516493, 1, 0, 0, 1, 1,
-0.8615368, -0.7856436, -1.806223, 1, 0, 0, 1, 1,
-0.8603081, 0.001863218, -1.320683, 1, 0, 0, 1, 1,
-0.8602675, 0.9593267, -0.7879436, 1, 0, 0, 1, 1,
-0.8572474, 0.2343921, -1.267703, 0, 0, 0, 1, 1,
-0.8451531, -2.093025, -4.202895, 0, 0, 0, 1, 1,
-0.8450114, 1.746251, -1.091805, 0, 0, 0, 1, 1,
-0.8431515, 2.141367, -0.5815361, 0, 0, 0, 1, 1,
-0.8416575, -0.6959926, -1.045578, 0, 0, 0, 1, 1,
-0.840439, -0.543054, -1.424821, 0, 0, 0, 1, 1,
-0.838567, 0.3482254, -0.5693263, 0, 0, 0, 1, 1,
-0.8373597, -0.7282118, -3.784297, 1, 1, 1, 1, 1,
-0.8351126, -0.5445529, -2.763746, 1, 1, 1, 1, 1,
-0.8309682, 0.0005060884, -1.795927, 1, 1, 1, 1, 1,
-0.8292414, -2.396294, -2.076638, 1, 1, 1, 1, 1,
-0.8254442, 1.688345, 0.4599179, 1, 1, 1, 1, 1,
-0.8250363, 0.2928522, -0.7206376, 1, 1, 1, 1, 1,
-0.8162971, 0.9745893, -0.1493735, 1, 1, 1, 1, 1,
-0.812813, -0.01365829, -3.695658, 1, 1, 1, 1, 1,
-0.8093473, -0.5391185, -3.42252, 1, 1, 1, 1, 1,
-0.8072699, -1.586666, -2.628646, 1, 1, 1, 1, 1,
-0.8064703, -0.1845927, -1.631263, 1, 1, 1, 1, 1,
-0.8041278, 0.8457532, -0.7095732, 1, 1, 1, 1, 1,
-0.7995214, -1.133082, -2.823057, 1, 1, 1, 1, 1,
-0.7913762, 0.1651568, -2.441993, 1, 1, 1, 1, 1,
-0.7880555, -0.03348089, -0.7754098, 1, 1, 1, 1, 1,
-0.7827557, 1.883913, -0.7579435, 0, 0, 1, 1, 1,
-0.7813, 0.6929892, -1.74968, 1, 0, 0, 1, 1,
-0.7794122, -0.3438702, -2.215869, 1, 0, 0, 1, 1,
-0.7788473, 1.232178, 1.698991, 1, 0, 0, 1, 1,
-0.7721477, 0.6539876, -0.8894434, 1, 0, 0, 1, 1,
-0.7638706, -0.1032983, -3.646779, 1, 0, 0, 1, 1,
-0.7632622, -0.3359127, -0.9927844, 0, 0, 0, 1, 1,
-0.7577489, -0.6465154, -2.521539, 0, 0, 0, 1, 1,
-0.7481537, -1.136072, -0.9558736, 0, 0, 0, 1, 1,
-0.7461464, 0.556522, -2.165215, 0, 0, 0, 1, 1,
-0.7370546, 0.4424003, -2.868481, 0, 0, 0, 1, 1,
-0.7370425, 1.378132, 0.351328, 0, 0, 0, 1, 1,
-0.7358487, -0.5435687, -3.148711, 0, 0, 0, 1, 1,
-0.7350649, -0.8408926, -3.992925, 1, 1, 1, 1, 1,
-0.7260948, -0.8621703, -2.983922, 1, 1, 1, 1, 1,
-0.7196219, -1.430441, -2.456512, 1, 1, 1, 1, 1,
-0.7159234, -0.2631904, -3.835924, 1, 1, 1, 1, 1,
-0.7150471, 0.02978334, -3.152017, 1, 1, 1, 1, 1,
-0.710902, 0.2291398, -0.5646082, 1, 1, 1, 1, 1,
-0.7057172, -0.2528356, -0.4723403, 1, 1, 1, 1, 1,
-0.6992075, 0.1816121, -1.264571, 1, 1, 1, 1, 1,
-0.693274, -0.006609112, -1.490579, 1, 1, 1, 1, 1,
-0.6886677, -0.2307707, -3.834229, 1, 1, 1, 1, 1,
-0.6805661, 0.04531878, -1.350072, 1, 1, 1, 1, 1,
-0.6592064, -0.1562154, -1.450855, 1, 1, 1, 1, 1,
-0.6533677, 0.5671669, 0.9434617, 1, 1, 1, 1, 1,
-0.6524197, 1.054245, -0.4830059, 1, 1, 1, 1, 1,
-0.6520208, 0.4317245, -0.4802661, 1, 1, 1, 1, 1,
-0.6490343, 0.956601, 0.5509933, 0, 0, 1, 1, 1,
-0.6484429, -1.114944, -3.219193, 1, 0, 0, 1, 1,
-0.6479219, 0.4920497, -2.235544, 1, 0, 0, 1, 1,
-0.6424584, -1.106988, -1.647787, 1, 0, 0, 1, 1,
-0.6406601, -1.333226, -2.250093, 1, 0, 0, 1, 1,
-0.6381381, 0.4062643, -1.407528, 1, 0, 0, 1, 1,
-0.6358982, 0.4713283, 0.3808435, 0, 0, 0, 1, 1,
-0.6308742, -0.2178291, -0.9129841, 0, 0, 0, 1, 1,
-0.6307758, -0.06430752, -3.288921, 0, 0, 0, 1, 1,
-0.6258495, -1.55347, -1.907192, 0, 0, 0, 1, 1,
-0.6240537, 0.6859963, -0.2071474, 0, 0, 0, 1, 1,
-0.6128804, 0.214147, -1.313689, 0, 0, 0, 1, 1,
-0.6085919, -2.452136, -3.760387, 0, 0, 0, 1, 1,
-0.6057314, 0.4116297, 0.02474597, 1, 1, 1, 1, 1,
-0.6041678, 1.285346, 0.6515864, 1, 1, 1, 1, 1,
-0.6027936, -0.01007985, 0.03418492, 1, 1, 1, 1, 1,
-0.6014476, -1.329128, -3.01135, 1, 1, 1, 1, 1,
-0.5976095, 0.1897048, -2.428982, 1, 1, 1, 1, 1,
-0.5927196, 0.4541045, -2.198082, 1, 1, 1, 1, 1,
-0.5904481, -0.9505447, -2.67637, 1, 1, 1, 1, 1,
-0.5893228, -0.7010997, -1.774137, 1, 1, 1, 1, 1,
-0.5864323, -0.467325, -3.984383, 1, 1, 1, 1, 1,
-0.5815739, 0.3992289, -2.726111, 1, 1, 1, 1, 1,
-0.5786514, -2.549347, -1.374421, 1, 1, 1, 1, 1,
-0.5777552, -1.13375, -3.022511, 1, 1, 1, 1, 1,
-0.576041, 0.9632601, -1.541878, 1, 1, 1, 1, 1,
-0.5745301, 0.6247959, -1.727263, 1, 1, 1, 1, 1,
-0.5732723, 2.813692, 1.282883, 1, 1, 1, 1, 1,
-0.5687638, -0.7813411, -3.840977, 0, 0, 1, 1, 1,
-0.5686874, -0.8314233, -2.485811, 1, 0, 0, 1, 1,
-0.5636179, -0.834038, -3.083081, 1, 0, 0, 1, 1,
-0.5618261, 0.478549, -2.272025, 1, 0, 0, 1, 1,
-0.5604244, -1.346611, -1.718883, 1, 0, 0, 1, 1,
-0.5525848, 0.5777397, -2.111109, 1, 0, 0, 1, 1,
-0.5519601, 0.7123544, -0.5952874, 0, 0, 0, 1, 1,
-0.5517648, 0.8009259, -0.2415607, 0, 0, 0, 1, 1,
-0.5475986, -1.795004, -2.455696, 0, 0, 0, 1, 1,
-0.54594, -0.5558905, -2.992447, 0, 0, 0, 1, 1,
-0.5454246, 0.9884218, -1.617932, 0, 0, 0, 1, 1,
-0.5403947, 1.842258, -0.4423323, 0, 0, 0, 1, 1,
-0.5347018, 0.5692691, -1.998368, 0, 0, 0, 1, 1,
-0.5325015, 0.01130361, 0.4642909, 1, 1, 1, 1, 1,
-0.5286087, -0.1736357, -5.236572, 1, 1, 1, 1, 1,
-0.5224801, 0.5785067, -1.828807, 1, 1, 1, 1, 1,
-0.521455, -0.09422807, -0.7380985, 1, 1, 1, 1, 1,
-0.518274, 1.912886, -1.590047, 1, 1, 1, 1, 1,
-0.5179792, -0.1199668, -1.227894, 1, 1, 1, 1, 1,
-0.5150176, 1.433154, -0.3988794, 1, 1, 1, 1, 1,
-0.5133954, -1.147625, -2.53592, 1, 1, 1, 1, 1,
-0.5104233, 0.2104041, -2.335356, 1, 1, 1, 1, 1,
-0.5102487, -0.6157755, -3.339104, 1, 1, 1, 1, 1,
-0.508282, 0.7976259, -0.4284194, 1, 1, 1, 1, 1,
-0.5069239, 1.283107, -0.2194581, 1, 1, 1, 1, 1,
-0.5060026, 0.2356527, -0.5071255, 1, 1, 1, 1, 1,
-0.4997013, 1.22848, -1.820897, 1, 1, 1, 1, 1,
-0.4996417, 1.012636, 1.352752, 1, 1, 1, 1, 1,
-0.493899, 1.014342, -0.7419834, 0, 0, 1, 1, 1,
-0.4919938, -0.3375258, -0.6426615, 1, 0, 0, 1, 1,
-0.4916316, 0.0572799, 0.2947502, 1, 0, 0, 1, 1,
-0.4877987, 0.9736656, 1.251237, 1, 0, 0, 1, 1,
-0.4862381, -1.779831, -3.525412, 1, 0, 0, 1, 1,
-0.4824834, 1.601366, -1.41287, 1, 0, 0, 1, 1,
-0.4814107, -2.444601, -3.977263, 0, 0, 0, 1, 1,
-0.4804324, -0.6556486, -1.417553, 0, 0, 0, 1, 1,
-0.4798761, -0.4753411, -2.0633, 0, 0, 0, 1, 1,
-0.4698965, -0.0749144, -3.983633, 0, 0, 0, 1, 1,
-0.4667791, 0.9047396, -0.1397855, 0, 0, 0, 1, 1,
-0.4660758, -0.3366857, -1.864858, 0, 0, 0, 1, 1,
-0.4579379, -0.7480291, -1.264911, 0, 0, 0, 1, 1,
-0.457044, -0.6438886, -2.297208, 1, 1, 1, 1, 1,
-0.4560888, -0.04675189, -2.523197, 1, 1, 1, 1, 1,
-0.4487482, -1.34196, -3.833298, 1, 1, 1, 1, 1,
-0.443558, 0.1389436, 0.2951458, 1, 1, 1, 1, 1,
-0.4415179, 1.097402, -1.171946, 1, 1, 1, 1, 1,
-0.4386947, 1.330629, -0.1139504, 1, 1, 1, 1, 1,
-0.4229691, 0.3708208, -0.3894202, 1, 1, 1, 1, 1,
-0.4225838, -0.3345875, -2.855757, 1, 1, 1, 1, 1,
-0.4168845, -1.842905, -3.123548, 1, 1, 1, 1, 1,
-0.4167112, 0.6284069, 0.6111496, 1, 1, 1, 1, 1,
-0.411023, -1.356786, -3.056366, 1, 1, 1, 1, 1,
-0.4070939, -0.03131536, -2.399473, 1, 1, 1, 1, 1,
-0.3931269, -0.9807242, -4.236236, 1, 1, 1, 1, 1,
-0.392554, 1.340354, 0.507359, 1, 1, 1, 1, 1,
-0.3913313, -1.312883, -2.359181, 1, 1, 1, 1, 1,
-0.3884666, 1.722901, -1.059586, 0, 0, 1, 1, 1,
-0.3850071, 0.4095134, -0.4749476, 1, 0, 0, 1, 1,
-0.3834541, 1.809034, -0.1698446, 1, 0, 0, 1, 1,
-0.3829458, -0.9436809, -2.963748, 1, 0, 0, 1, 1,
-0.3794743, 0.2295078, 0.1303238, 1, 0, 0, 1, 1,
-0.3790995, 0.2194739, -0.5565265, 1, 0, 0, 1, 1,
-0.377536, 1.885927, -0.3927706, 0, 0, 0, 1, 1,
-0.3762098, 1.318514, -1.081051, 0, 0, 0, 1, 1,
-0.37418, -0.7630116, -1.736183, 0, 0, 0, 1, 1,
-0.3705418, -0.5333602, -3.836774, 0, 0, 0, 1, 1,
-0.3701017, -1.111043, -2.663748, 0, 0, 0, 1, 1,
-0.3693289, -0.330337, -2.157873, 0, 0, 0, 1, 1,
-0.3687266, 1.126771, 0.8492571, 0, 0, 0, 1, 1,
-0.3652445, 1.470549, -0.5324809, 1, 1, 1, 1, 1,
-0.3652122, -1.909488, -3.243989, 1, 1, 1, 1, 1,
-0.3651557, 0.8995894, -0.8200561, 1, 1, 1, 1, 1,
-0.3616194, 0.7466837, -1.387686, 1, 1, 1, 1, 1,
-0.3587148, -1.753575, -2.863553, 1, 1, 1, 1, 1,
-0.3584185, 0.2605645, 0.08910625, 1, 1, 1, 1, 1,
-0.3550158, -2.255187, -3.081916, 1, 1, 1, 1, 1,
-0.3518506, -0.2445536, -4.350877, 1, 1, 1, 1, 1,
-0.3497256, -1.822401, -3.965757, 1, 1, 1, 1, 1,
-0.3438939, -0.1395988, -0.6753535, 1, 1, 1, 1, 1,
-0.3379537, -0.6623186, -2.328311, 1, 1, 1, 1, 1,
-0.3353771, 0.605319, 1.524445, 1, 1, 1, 1, 1,
-0.3311622, -0.938024, -2.063241, 1, 1, 1, 1, 1,
-0.3291557, -0.4689979, -2.869859, 1, 1, 1, 1, 1,
-0.3278562, 0.9319609, 0.4084118, 1, 1, 1, 1, 1,
-0.3268839, -1.306226, -4.044428, 0, 0, 1, 1, 1,
-0.3263111, 0.5396726, -0.1851688, 1, 0, 0, 1, 1,
-0.3237299, 0.1951172, 0.5409082, 1, 0, 0, 1, 1,
-0.3189875, 0.448709, 0.2841494, 1, 0, 0, 1, 1,
-0.3166187, 0.3442901, -1.501391, 1, 0, 0, 1, 1,
-0.3137509, -1.256085, -2.839309, 1, 0, 0, 1, 1,
-0.3137509, -0.428785, 0.0996508, 0, 0, 0, 1, 1,
-0.3114045, -0.8248171, -3.624164, 0, 0, 0, 1, 1,
-0.3091787, -0.817028, -3.188134, 0, 0, 0, 1, 1,
-0.3082888, 1.649694, -1.023406, 0, 0, 0, 1, 1,
-0.307096, -1.166833, -2.507324, 0, 0, 0, 1, 1,
-0.3045634, -0.4059266, -2.832595, 0, 0, 0, 1, 1,
-0.3024605, 0.2438614, -0.6391625, 0, 0, 0, 1, 1,
-0.3023001, 0.08272595, -2.573468, 1, 1, 1, 1, 1,
-0.3014663, 1.545643, 0.8516765, 1, 1, 1, 1, 1,
-0.2980747, -0.5151321, -4.12606, 1, 1, 1, 1, 1,
-0.2972946, -0.372667, -1.748541, 1, 1, 1, 1, 1,
-0.2960183, 0.3731562, 0.1723214, 1, 1, 1, 1, 1,
-0.2922533, 1.090864, -2.352671, 1, 1, 1, 1, 1,
-0.2888366, 1.319619, -2.583799, 1, 1, 1, 1, 1,
-0.2867779, -1.688539, -2.6034, 1, 1, 1, 1, 1,
-0.2852774, 1.389361, -1.377821, 1, 1, 1, 1, 1,
-0.2842309, -0.1890787, -2.349222, 1, 1, 1, 1, 1,
-0.2822349, -0.5689341, -2.495749, 1, 1, 1, 1, 1,
-0.2796445, 1.212162, -1.49832, 1, 1, 1, 1, 1,
-0.2742612, -1.356207, -0.4287666, 1, 1, 1, 1, 1,
-0.2727491, -2.462077, -3.578054, 1, 1, 1, 1, 1,
-0.2705389, 0.4068275, -0.28131, 1, 1, 1, 1, 1,
-0.2691719, -0.2026228, -1.951843, 0, 0, 1, 1, 1,
-0.2684125, -0.6766346, -1.395155, 1, 0, 0, 1, 1,
-0.2676251, -0.1989928, -2.181268, 1, 0, 0, 1, 1,
-0.2646047, 0.4189177, -1.060956, 1, 0, 0, 1, 1,
-0.2545286, -0.2189367, -2.795954, 1, 0, 0, 1, 1,
-0.2541926, -0.06505082, -0.9563008, 1, 0, 0, 1, 1,
-0.2516158, -0.3208351, -3.64596, 0, 0, 0, 1, 1,
-0.2506299, -0.9587371, -4.755482, 0, 0, 0, 1, 1,
-0.2448488, -0.5263019, -4.046368, 0, 0, 0, 1, 1,
-0.2403978, -0.7658718, -2.269834, 0, 0, 0, 1, 1,
-0.2392727, -0.4678782, -1.97038, 0, 0, 0, 1, 1,
-0.2390527, 1.503229, 1.03599, 0, 0, 0, 1, 1,
-0.2344625, -0.1577926, -1.238917, 0, 0, 0, 1, 1,
-0.2313314, 1.183325, -0.9727027, 1, 1, 1, 1, 1,
-0.2283208, -7.823735e-05, 0.1291679, 1, 1, 1, 1, 1,
-0.2273569, -1.461568, -4.926353, 1, 1, 1, 1, 1,
-0.2245702, 2.173067, 0.3268458, 1, 1, 1, 1, 1,
-0.2182347, 0.3343981, -0.2098016, 1, 1, 1, 1, 1,
-0.2177864, 0.9681461, 2.364542, 1, 1, 1, 1, 1,
-0.2172254, -1.020691, -2.225974, 1, 1, 1, 1, 1,
-0.2168753, -0.1534519, -2.612655, 1, 1, 1, 1, 1,
-0.2141112, -2.497492, -3.71458, 1, 1, 1, 1, 1,
-0.2128895, 1.026757, 0.1913101, 1, 1, 1, 1, 1,
-0.2072559, 1.32111, 1.15678, 1, 1, 1, 1, 1,
-0.206924, -1.299192, -4.018609, 1, 1, 1, 1, 1,
-0.2014643, 1.788598, -0.2490444, 1, 1, 1, 1, 1,
-0.1921387, 0.4588205, -1.604214, 1, 1, 1, 1, 1,
-0.1898127, -1.363204, -2.962399, 1, 1, 1, 1, 1,
-0.1864417, 0.4219924, -1.053005, 0, 0, 1, 1, 1,
-0.1863884, 0.8092523, -0.9044728, 1, 0, 0, 1, 1,
-0.186325, -0.4515807, -2.780546, 1, 0, 0, 1, 1,
-0.1861497, -0.6594219, -3.629185, 1, 0, 0, 1, 1,
-0.184086, -0.2440604, -1.968629, 1, 0, 0, 1, 1,
-0.1758401, -0.8130671, -2.910619, 1, 0, 0, 1, 1,
-0.1750814, 0.9753121, 0.01450318, 0, 0, 0, 1, 1,
-0.1712578, -0.3353296, -3.601717, 0, 0, 0, 1, 1,
-0.1698702, 0.3874779, -0.3786798, 0, 0, 0, 1, 1,
-0.1640369, 0.457853, -0.814857, 0, 0, 0, 1, 1,
-0.1600791, 1.600705, -0.1307656, 0, 0, 0, 1, 1,
-0.1544097, -1.793457, -3.946996, 0, 0, 0, 1, 1,
-0.1500816, -0.3499569, -4.477632, 0, 0, 0, 1, 1,
-0.149655, 0.2956991, -0.05168436, 1, 1, 1, 1, 1,
-0.1485689, -0.3791814, -2.317473, 1, 1, 1, 1, 1,
-0.1474158, -0.02796166, -3.177621, 1, 1, 1, 1, 1,
-0.1453893, -0.8035454, -2.805107, 1, 1, 1, 1, 1,
-0.1434428, -1.509743, -3.564809, 1, 1, 1, 1, 1,
-0.1424436, -1.28397, -1.92214, 1, 1, 1, 1, 1,
-0.1377199, -0.00744418, -2.476538, 1, 1, 1, 1, 1,
-0.1351577, -0.6977714, -3.76175, 1, 1, 1, 1, 1,
-0.1350635, -0.009345724, -0.5416641, 1, 1, 1, 1, 1,
-0.1335787, 0.3443869, -0.4247374, 1, 1, 1, 1, 1,
-0.1328058, 1.31793, 0.2741573, 1, 1, 1, 1, 1,
-0.1279743, -2.263721, -3.423805, 1, 1, 1, 1, 1,
-0.1267182, -0.3064885, -2.330227, 1, 1, 1, 1, 1,
-0.1262548, 0.820725, 0.8306006, 1, 1, 1, 1, 1,
-0.1228649, 0.2045205, -0.5829269, 1, 1, 1, 1, 1,
-0.1225193, 0.6015833, -1.930424, 0, 0, 1, 1, 1,
-0.1198571, 1.287595, 0.2201889, 1, 0, 0, 1, 1,
-0.1146519, 1.998642, -1.22411, 1, 0, 0, 1, 1,
-0.1125472, 0.509362, -0.7805495, 1, 0, 0, 1, 1,
-0.109818, -0.4535429, -2.717655, 1, 0, 0, 1, 1,
-0.1048192, -0.3135436, -2.491309, 1, 0, 0, 1, 1,
-0.1020514, -0.3290552, -3.713854, 0, 0, 0, 1, 1,
-0.1013491, 0.3297204, -0.1087112, 0, 0, 0, 1, 1,
-0.1004658, 0.8230221, 0.3886781, 0, 0, 0, 1, 1,
-0.09869232, -0.841528, -2.954801, 0, 0, 0, 1, 1,
-0.09818123, 0.06544043, -1.220716, 0, 0, 0, 1, 1,
-0.09735201, -0.04434139, -2.568087, 0, 0, 0, 1, 1,
-0.0960835, 0.3379236, -1.102766, 0, 0, 0, 1, 1,
-0.09548543, -1.131566, -3.809408, 1, 1, 1, 1, 1,
-0.09426492, 0.3581923, 0.7569612, 1, 1, 1, 1, 1,
-0.09235403, -0.5007727, -2.456509, 1, 1, 1, 1, 1,
-0.09035175, 1.334421, -0.01516553, 1, 1, 1, 1, 1,
-0.08720909, -1.104685, -3.757457, 1, 1, 1, 1, 1,
-0.08664637, 1.112009, -2.437923, 1, 1, 1, 1, 1,
-0.08454279, -0.2997152, -1.850495, 1, 1, 1, 1, 1,
-0.08410438, -0.3697376, -1.808918, 1, 1, 1, 1, 1,
-0.07907001, 1.066563, 1.200762, 1, 1, 1, 1, 1,
-0.07646801, 0.4882284, -1.714681, 1, 1, 1, 1, 1,
-0.07556413, 1.266346, -0.3473061, 1, 1, 1, 1, 1,
-0.06945609, -0.9537055, -3.784419, 1, 1, 1, 1, 1,
-0.06388433, 2.050814, -1.503085, 1, 1, 1, 1, 1,
-0.05876504, 0.1080432, -2.736205, 1, 1, 1, 1, 1,
-0.05858035, 0.5608966, -0.5970198, 1, 1, 1, 1, 1,
-0.05793934, -0.08013914, -0.571691, 0, 0, 1, 1, 1,
-0.05791393, -0.3132747, -4.326241, 1, 0, 0, 1, 1,
-0.05564594, 0.4026672, -0.4256026, 1, 0, 0, 1, 1,
-0.0537098, 0.457797, -0.1928355, 1, 0, 0, 1, 1,
-0.05353751, -1.087571, -1.821103, 1, 0, 0, 1, 1,
-0.05214065, 0.2088766, -0.06789985, 1, 0, 0, 1, 1,
-0.04846754, 0.1041775, 1.523762, 0, 0, 0, 1, 1,
-0.04563265, 2.34497, -1.651335, 0, 0, 0, 1, 1,
-0.04305898, -0.7359263, -1.521176, 0, 0, 0, 1, 1,
-0.04158233, 0.4763516, -1.767745, 0, 0, 0, 1, 1,
-0.03821479, 0.1682294, 0.7149822, 0, 0, 0, 1, 1,
-0.03561921, -0.04000499, -2.236685, 0, 0, 0, 1, 1,
-0.03339119, 1.522267, -0.1300813, 0, 0, 0, 1, 1,
-0.03325351, -0.611154, -5.044976, 1, 1, 1, 1, 1,
-0.03229674, 0.2700598, -0.2485134, 1, 1, 1, 1, 1,
-0.02405236, -1.341859, -1.1883, 1, 1, 1, 1, 1,
-0.02343025, -0.1087568, -3.517045, 1, 1, 1, 1, 1,
-0.02297733, -1.788214, -2.581819, 1, 1, 1, 1, 1,
-0.01804726, -0.8025085, -3.270014, 1, 1, 1, 1, 1,
-0.01759166, 1.766597, 0.6167518, 1, 1, 1, 1, 1,
-0.01481759, -0.7737072, -2.169174, 1, 1, 1, 1, 1,
-0.0144156, -0.6294181, -3.29636, 1, 1, 1, 1, 1,
-0.002690498, 0.441051, 0.2250613, 1, 1, 1, 1, 1,
-0.0006866639, 1.254778, 1.42279, 1, 1, 1, 1, 1,
-0.0005380968, 0.6000497, 0.2952431, 1, 1, 1, 1, 1,
0.005781442, -0.1886285, 2.738883, 1, 1, 1, 1, 1,
0.006633461, -0.1618332, 3.150849, 1, 1, 1, 1, 1,
0.006961432, 1.318629, 0.0415133, 1, 1, 1, 1, 1,
0.00822714, 1.296509, -1.277912, 0, 0, 1, 1, 1,
0.01105056, -0.2792795, 2.933753, 1, 0, 0, 1, 1,
0.01119512, 2.546891, 0.194318, 1, 0, 0, 1, 1,
0.01120255, 0.9099084, -0.363728, 1, 0, 0, 1, 1,
0.01663081, -1.676068, 3.960876, 1, 0, 0, 1, 1,
0.01775448, -0.4212555, 1.833986, 1, 0, 0, 1, 1,
0.01872136, 0.4911397, 0.332489, 0, 0, 0, 1, 1,
0.02426084, -1.972484, 3.08357, 0, 0, 0, 1, 1,
0.02435053, 0.2268748, 0.01365421, 0, 0, 0, 1, 1,
0.02543421, -1.497896, 1.728406, 0, 0, 0, 1, 1,
0.02723503, -0.2252196, 2.669258, 0, 0, 0, 1, 1,
0.0282619, 1.355557, 0.8802909, 0, 0, 0, 1, 1,
0.0288812, 0.523778, 1.111763, 0, 0, 0, 1, 1,
0.02951348, -0.6723778, 3.03932, 1, 1, 1, 1, 1,
0.03022289, 0.7520885, -0.04178214, 1, 1, 1, 1, 1,
0.03116605, -0.3661426, 3.314856, 1, 1, 1, 1, 1,
0.03288006, 0.2821573, 0.3559972, 1, 1, 1, 1, 1,
0.037998, -0.08652566, 1.875939, 1, 1, 1, 1, 1,
0.04050286, 1.305545, 0.8517441, 1, 1, 1, 1, 1,
0.04412277, 0.5775445, 1.187456, 1, 1, 1, 1, 1,
0.05065065, 0.9886062, 0.01533604, 1, 1, 1, 1, 1,
0.05384839, -0.9233454, 2.433709, 1, 1, 1, 1, 1,
0.05457929, 0.419574, 0.2560545, 1, 1, 1, 1, 1,
0.05498421, 1.016062, -1.156156, 1, 1, 1, 1, 1,
0.05987113, -1.239844, 2.87236, 1, 1, 1, 1, 1,
0.06618936, -2.537339, 2.632574, 1, 1, 1, 1, 1,
0.06670718, 0.6597183, 0.1812265, 1, 1, 1, 1, 1,
0.06717945, -0.6016058, 2.634257, 1, 1, 1, 1, 1,
0.06981256, 0.9634449, 1.20401, 0, 0, 1, 1, 1,
0.07293957, -1.004597, 0.9467199, 1, 0, 0, 1, 1,
0.07529784, 0.148839, 1.324831, 1, 0, 0, 1, 1,
0.08062935, -2.718717, 1.643325, 1, 0, 0, 1, 1,
0.08357278, 1.604169, -0.0123538, 1, 0, 0, 1, 1,
0.08630113, 0.193756, -1.050943, 1, 0, 0, 1, 1,
0.08646592, -0.04174232, 1.387684, 0, 0, 0, 1, 1,
0.08945289, 2.228409, 0.48735, 0, 0, 0, 1, 1,
0.08954784, 1.252088, -0.5859597, 0, 0, 0, 1, 1,
0.09275554, -1.512424, 4.162968, 0, 0, 0, 1, 1,
0.09299839, -0.5648442, 3.896009, 0, 0, 0, 1, 1,
0.09980744, -0.6733696, 2.954923, 0, 0, 0, 1, 1,
0.1062726, 1.802301, -2.27658, 0, 0, 0, 1, 1,
0.1086476, 0.2842486, -1.462543, 1, 1, 1, 1, 1,
0.1092405, 0.5307145, -0.9090512, 1, 1, 1, 1, 1,
0.1113141, -0.3228288, 1.287145, 1, 1, 1, 1, 1,
0.1137311, -0.09089633, 3.857211, 1, 1, 1, 1, 1,
0.117449, 0.04717182, 0.5513686, 1, 1, 1, 1, 1,
0.1211576, 1.265855, -0.2986185, 1, 1, 1, 1, 1,
0.1218087, 1.421388, 0.0162043, 1, 1, 1, 1, 1,
0.1224893, 1.29895, -0.07379575, 1, 1, 1, 1, 1,
0.1256372, 0.975845, -0.2886572, 1, 1, 1, 1, 1,
0.1257458, -0.8705073, 4.727006, 1, 1, 1, 1, 1,
0.1272649, 0.9537087, 0.1813154, 1, 1, 1, 1, 1,
0.1280913, 0.656517, 1.02067, 1, 1, 1, 1, 1,
0.1437608, 0.3519492, 1.978666, 1, 1, 1, 1, 1,
0.1472341, 0.5057188, 0.5000421, 1, 1, 1, 1, 1,
0.1558795, 0.1021773, 1.952826, 1, 1, 1, 1, 1,
0.1592263, -0.3044378, 1.214247, 0, 0, 1, 1, 1,
0.1630151, 0.3554123, -1.157749, 1, 0, 0, 1, 1,
0.1695319, -0.9083857, 3.057626, 1, 0, 0, 1, 1,
0.1715764, 0.4324133, -0.5530992, 1, 0, 0, 1, 1,
0.1753187, 1.607133, -1.309102, 1, 0, 0, 1, 1,
0.1790931, -0.2727085, 2.038905, 1, 0, 0, 1, 1,
0.179225, 1.024383, 2.054428, 0, 0, 0, 1, 1,
0.1802468, -0.6696772, 2.932589, 0, 0, 0, 1, 1,
0.1808647, 0.5533962, 0.4494916, 0, 0, 0, 1, 1,
0.1814675, 0.5847694, 1.310746, 0, 0, 0, 1, 1,
0.18316, -0.6848643, 3.142058, 0, 0, 0, 1, 1,
0.1841211, -0.2278256, 2.674743, 0, 0, 0, 1, 1,
0.189965, 0.5196671, 1.250952, 0, 0, 0, 1, 1,
0.1906606, -0.005638825, 1.994284, 1, 1, 1, 1, 1,
0.1908408, 0.9622049, -1.501899, 1, 1, 1, 1, 1,
0.1974275, 1.143638, 0.2964462, 1, 1, 1, 1, 1,
0.2027441, -0.7019855, 1.553794, 1, 1, 1, 1, 1,
0.2049642, -0.2209398, 3.095663, 1, 1, 1, 1, 1,
0.2118208, -0.4303394, 2.516926, 1, 1, 1, 1, 1,
0.2167228, -0.1639029, 3.340788, 1, 1, 1, 1, 1,
0.2188426, -0.7632616, 3.479942, 1, 1, 1, 1, 1,
0.2212084, 0.03356581, -1.030689, 1, 1, 1, 1, 1,
0.2221726, -1.414606, 2.617379, 1, 1, 1, 1, 1,
0.2226808, -0.008539398, 3.253965, 1, 1, 1, 1, 1,
0.223432, -0.2545698, 3.434169, 1, 1, 1, 1, 1,
0.2255094, -0.5570784, 2.237164, 1, 1, 1, 1, 1,
0.2274873, 1.292245, 2.432435, 1, 1, 1, 1, 1,
0.2286876, 1.453407, -0.8374076, 1, 1, 1, 1, 1,
0.2299086, 1.090908, 1.864204, 0, 0, 1, 1, 1,
0.2319271, 0.1538621, 0.4106742, 1, 0, 0, 1, 1,
0.2327685, -1.26586, 2.53064, 1, 0, 0, 1, 1,
0.2353929, -0.3598014, 1.756975, 1, 0, 0, 1, 1,
0.2360347, -0.1819092, 3.410858, 1, 0, 0, 1, 1,
0.237319, 0.8991376, 0.69029, 1, 0, 0, 1, 1,
0.239723, 0.7445582, 0.07271069, 0, 0, 0, 1, 1,
0.2458791, -0.5196669, 2.996184, 0, 0, 0, 1, 1,
0.2493727, -0.2402531, 4.766729, 0, 0, 0, 1, 1,
0.2571385, -0.09480079, 3.324181, 0, 0, 0, 1, 1,
0.2620634, 0.6675077, -0.05514047, 0, 0, 0, 1, 1,
0.2623831, 0.2121968, 1.757575, 0, 0, 0, 1, 1,
0.2626908, 2.480212, 0.8869953, 0, 0, 0, 1, 1,
0.266418, -1.130884, 1.753381, 1, 1, 1, 1, 1,
0.2670147, 0.7163187, 1.041929, 1, 1, 1, 1, 1,
0.2692095, -1.053475, 3.005914, 1, 1, 1, 1, 1,
0.2698525, -0.2246464, 2.517833, 1, 1, 1, 1, 1,
0.2703157, 1.298415, -0.4979958, 1, 1, 1, 1, 1,
0.2807787, 0.8036591, -1.532895, 1, 1, 1, 1, 1,
0.2828654, 0.3815603, -0.2340115, 1, 1, 1, 1, 1,
0.2831934, -1.185618, 1.559569, 1, 1, 1, 1, 1,
0.2842331, 0.9744455, -2.390089, 1, 1, 1, 1, 1,
0.2913144, 0.6997762, -0.1989805, 1, 1, 1, 1, 1,
0.2956659, 0.395073, -0.7934972, 1, 1, 1, 1, 1,
0.2957089, -0.3717488, 2.899807, 1, 1, 1, 1, 1,
0.2979681, -0.03926208, 1.165774, 1, 1, 1, 1, 1,
0.3004574, 0.4303612, 1.459662, 1, 1, 1, 1, 1,
0.3008629, 1.217387, 0.1126646, 1, 1, 1, 1, 1,
0.3023013, -0.8278819, 1.401886, 0, 0, 1, 1, 1,
0.3051279, -0.1912191, 3.594659, 1, 0, 0, 1, 1,
0.3159172, 1.949805, 0.6737617, 1, 0, 0, 1, 1,
0.3199218, -0.3281227, 3.586768, 1, 0, 0, 1, 1,
0.3200192, 0.3604722, 0.2370546, 1, 0, 0, 1, 1,
0.3211441, 1.112441, -1.47438, 1, 0, 0, 1, 1,
0.3219417, 1.152699, 1.09029, 0, 0, 0, 1, 1,
0.3240216, -0.4385345, 0.848234, 0, 0, 0, 1, 1,
0.3295401, -0.1256965, 2.606042, 0, 0, 0, 1, 1,
0.3300113, 1.548209, 0.9233158, 0, 0, 0, 1, 1,
0.3319358, -1.819605, 1.880803, 0, 0, 0, 1, 1,
0.3327241, -0.4002954, 3.022662, 0, 0, 0, 1, 1,
0.3331651, -1.080032, 2.477311, 0, 0, 0, 1, 1,
0.3336094, 0.2878803, 0.9210668, 1, 1, 1, 1, 1,
0.3344275, -0.05689355, 1.319837, 1, 1, 1, 1, 1,
0.3354017, -0.7503111, 2.510744, 1, 1, 1, 1, 1,
0.3368603, 0.160606, 0.8873615, 1, 1, 1, 1, 1,
0.3389915, 0.4512577, 0.61067, 1, 1, 1, 1, 1,
0.3414328, 1.356809, 2.93587, 1, 1, 1, 1, 1,
0.3455656, -0.8609738, 4.913105, 1, 1, 1, 1, 1,
0.3457305, -0.2452344, 1.247277, 1, 1, 1, 1, 1,
0.3471571, -0.1398253, 1.506366, 1, 1, 1, 1, 1,
0.3583626, -0.1346401, 2.931329, 1, 1, 1, 1, 1,
0.362565, -1.463328, 2.912759, 1, 1, 1, 1, 1,
0.3626104, 0.6508055, 0.5080334, 1, 1, 1, 1, 1,
0.3633373, 0.3431927, 0.9240275, 1, 1, 1, 1, 1,
0.3646875, 0.6053814, 0.2860288, 1, 1, 1, 1, 1,
0.3652141, -0.1152397, 1.567469, 1, 1, 1, 1, 1,
0.3761846, -0.6240908, 2.261071, 0, 0, 1, 1, 1,
0.376458, -1.224796, 1.937095, 1, 0, 0, 1, 1,
0.3790689, -0.9473409, 3.382471, 1, 0, 0, 1, 1,
0.3827682, -0.4638423, 2.588775, 1, 0, 0, 1, 1,
0.3840195, 0.0959387, 0.65348, 1, 0, 0, 1, 1,
0.3856949, -1.108325, 2.30617, 1, 0, 0, 1, 1,
0.3956088, -1.22976, 2.557082, 0, 0, 0, 1, 1,
0.3997927, -0.3636417, 2.769387, 0, 0, 0, 1, 1,
0.3999677, 0.9020915, -0.5757377, 0, 0, 0, 1, 1,
0.4157657, 0.2605017, 0.6396055, 0, 0, 0, 1, 1,
0.4223711, 0.1729819, -0.1003579, 0, 0, 0, 1, 1,
0.4241732, 0.3340067, 0.2934177, 0, 0, 0, 1, 1,
0.4244004, 1.08551, 0.9749331, 0, 0, 0, 1, 1,
0.425146, -0.2046982, 0.7113965, 1, 1, 1, 1, 1,
0.4258485, 0.8870302, -0.8152777, 1, 1, 1, 1, 1,
0.4285481, 1.078323, -0.1940651, 1, 1, 1, 1, 1,
0.4377984, 0.8999701, 1.797299, 1, 1, 1, 1, 1,
0.4404078, 0.1260165, 2.34129, 1, 1, 1, 1, 1,
0.4409315, 0.4561697, -0.2915427, 1, 1, 1, 1, 1,
0.4491408, -1.303355, 3.58549, 1, 1, 1, 1, 1,
0.449433, -0.9804423, 2.392603, 1, 1, 1, 1, 1,
0.4501144, 0.5723176, -0.5839478, 1, 1, 1, 1, 1,
0.452006, -1.360402, 1.719437, 1, 1, 1, 1, 1,
0.4523188, -0.043814, 0.9259771, 1, 1, 1, 1, 1,
0.4545385, -0.8421589, 2.465378, 1, 1, 1, 1, 1,
0.4578419, -0.608621, 2.798045, 1, 1, 1, 1, 1,
0.4639123, 0.6408781, -0.7518814, 1, 1, 1, 1, 1,
0.4666939, 1.285034, 0.530443, 1, 1, 1, 1, 1,
0.4682681, -1.575005, 3.266264, 0, 0, 1, 1, 1,
0.4736735, 0.4449943, 1.701004, 1, 0, 0, 1, 1,
0.4793075, -0.8402539, 1.100872, 1, 0, 0, 1, 1,
0.4814868, -2.277911, 2.613575, 1, 0, 0, 1, 1,
0.4827685, -0.1750344, 0.1882103, 1, 0, 0, 1, 1,
0.491192, -0.5173787, 2.650164, 1, 0, 0, 1, 1,
0.4913271, 1.106179, 0.2022943, 0, 0, 0, 1, 1,
0.492047, 0.3107362, 0.1597069, 0, 0, 0, 1, 1,
0.496987, -0.133554, 1.278757, 0, 0, 0, 1, 1,
0.5008896, -1.17627, 3.945445, 0, 0, 0, 1, 1,
0.5034217, 0.8576623, 0.3483569, 0, 0, 0, 1, 1,
0.5071915, -1.447195, 3.694419, 0, 0, 0, 1, 1,
0.5087904, 0.8534688, 0.1202698, 0, 0, 0, 1, 1,
0.5128817, -0.838451, 2.408837, 1, 1, 1, 1, 1,
0.5143788, -0.8436405, 3.476632, 1, 1, 1, 1, 1,
0.5230296, 1.708619, -0.6674605, 1, 1, 1, 1, 1,
0.5246241, -0.8739906, 2.740144, 1, 1, 1, 1, 1,
0.5247184, 2.525486, -0.6648496, 1, 1, 1, 1, 1,
0.5279831, 0.9319429, 3.006941, 1, 1, 1, 1, 1,
0.528505, 0.9146953, 0.4790173, 1, 1, 1, 1, 1,
0.531341, -0.9472839, 1.463246, 1, 1, 1, 1, 1,
0.5351325, 0.03705149, 1.889148, 1, 1, 1, 1, 1,
0.5353923, 0.08603794, 0.4784785, 1, 1, 1, 1, 1,
0.5378076, -0.2647924, 0.7917622, 1, 1, 1, 1, 1,
0.5391197, 1.437285, 0.5443166, 1, 1, 1, 1, 1,
0.5395266, 0.05596309, 1.949088, 1, 1, 1, 1, 1,
0.5399886, -1.024989, 1.026372, 1, 1, 1, 1, 1,
0.5429493, -0.4934603, 0.5893413, 1, 1, 1, 1, 1,
0.5437548, 1.203064, -2.320653, 0, 0, 1, 1, 1,
0.5493932, 1.619206, -0.2234151, 1, 0, 0, 1, 1,
0.5523015, 0.8738852, -0.1481683, 1, 0, 0, 1, 1,
0.5525935, 0.6019686, 1.713932, 1, 0, 0, 1, 1,
0.5538707, -1.660639, 2.814217, 1, 0, 0, 1, 1,
0.5549424, 0.01890894, 1.751365, 1, 0, 0, 1, 1,
0.5574098, 1.242327, 1.522621, 0, 0, 0, 1, 1,
0.5627784, 0.09458242, 3.303354, 0, 0, 0, 1, 1,
0.5666378, -0.590241, 0.821983, 0, 0, 0, 1, 1,
0.5668873, -0.6406963, 2.369904, 0, 0, 0, 1, 1,
0.5687491, 0.4375424, 0.6435375, 0, 0, 0, 1, 1,
0.572419, -0.9436319, 1.018047, 0, 0, 0, 1, 1,
0.5735719, -1.44038, 2.557289, 0, 0, 0, 1, 1,
0.5752376, -0.9076016, 1.653908, 1, 1, 1, 1, 1,
0.5754987, -1.404655, 4.571119, 1, 1, 1, 1, 1,
0.5815288, -1.298583, 3.51764, 1, 1, 1, 1, 1,
0.5845543, 0.2556886, 1.519439, 1, 1, 1, 1, 1,
0.5858422, -0.4768658, 0.1472183, 1, 1, 1, 1, 1,
0.5858426, 1.581438, 0.6174804, 1, 1, 1, 1, 1,
0.5872402, -0.4261158, 2.6895, 1, 1, 1, 1, 1,
0.5877163, 1.069809, 0.9515182, 1, 1, 1, 1, 1,
0.5884824, -0.246672, 0.9054779, 1, 1, 1, 1, 1,
0.5886564, -2.198207, 2.391105, 1, 1, 1, 1, 1,
0.5944214, 0.9301657, 0.9636114, 1, 1, 1, 1, 1,
0.5968627, 0.4680972, 0.192363, 1, 1, 1, 1, 1,
0.6032341, -1.064173, 2.95149, 1, 1, 1, 1, 1,
0.6048819, -2.307131, 3.212482, 1, 1, 1, 1, 1,
0.6136833, -0.5578231, 2.615259, 1, 1, 1, 1, 1,
0.6162035, 1.174628, -0.1679716, 0, 0, 1, 1, 1,
0.6202052, -1.246238, 4.926833, 1, 0, 0, 1, 1,
0.624916, 0.3982909, 0.8905719, 1, 0, 0, 1, 1,
0.6289138, -1.534466, 3.296026, 1, 0, 0, 1, 1,
0.6313675, -0.542738, 4.365906, 1, 0, 0, 1, 1,
0.6358989, 2.332678, 1.312549, 1, 0, 0, 1, 1,
0.6370769, -0.1741463, 2.127065, 0, 0, 0, 1, 1,
0.6380845, -1.556564, 2.680123, 0, 0, 0, 1, 1,
0.6383102, -0.5092636, 1.070685, 0, 0, 0, 1, 1,
0.6392352, -0.4289442, 2.912546, 0, 0, 0, 1, 1,
0.6397908, 1.141803, -1.180325, 0, 0, 0, 1, 1,
0.6438697, 0.4860499, 0.2463814, 0, 0, 0, 1, 1,
0.6508607, 0.3611654, 2.241265, 0, 0, 0, 1, 1,
0.6508918, -1.209615, 2.572376, 1, 1, 1, 1, 1,
0.6524553, 1.449057, -1.131994, 1, 1, 1, 1, 1,
0.6627675, 0.9133521, 2.004717, 1, 1, 1, 1, 1,
0.6631807, -1.200715, 2.457386, 1, 1, 1, 1, 1,
0.6636715, 0.2131389, 0.7513267, 1, 1, 1, 1, 1,
0.6725507, 0.2092593, 2.739266, 1, 1, 1, 1, 1,
0.6753224, 1.757851, 1.161441, 1, 1, 1, 1, 1,
0.675888, -0.3813697, 4.060335, 1, 1, 1, 1, 1,
0.6821507, 1.443659, 1.558487, 1, 1, 1, 1, 1,
0.6857519, -1.208397, 0.8721742, 1, 1, 1, 1, 1,
0.6861804, -0.6242561, 0.3707657, 1, 1, 1, 1, 1,
0.6973094, -0.0143522, 2.116632, 1, 1, 1, 1, 1,
0.6976088, 0.04911169, 0.9945726, 1, 1, 1, 1, 1,
0.6989537, 0.7510895, 0.5475929, 1, 1, 1, 1, 1,
0.7029987, 1.784784, 0.4480137, 1, 1, 1, 1, 1,
0.709017, 1.420449, -0.8617589, 0, 0, 1, 1, 1,
0.7099622, -0.346379, 1.167699, 1, 0, 0, 1, 1,
0.7100824, -0.6927459, 1.919666, 1, 0, 0, 1, 1,
0.7105143, -0.3387755, 0.353199, 1, 0, 0, 1, 1,
0.7145933, 0.8571873, 2.788624, 1, 0, 0, 1, 1,
0.7172046, 0.3825027, 2.725868, 1, 0, 0, 1, 1,
0.7175153, -0.02682491, 1.701748, 0, 0, 0, 1, 1,
0.7179454, -0.05534132, 1.636748, 0, 0, 0, 1, 1,
0.7203388, 0.8159824, 2.135346, 0, 0, 0, 1, 1,
0.7279179, 1.512682, -0.4272672, 0, 0, 0, 1, 1,
0.7358255, 2.358251, -0.9484978, 0, 0, 0, 1, 1,
0.7398583, -1.174082, 2.750185, 0, 0, 0, 1, 1,
0.7432925, 1.17426, 1.326408, 0, 0, 0, 1, 1,
0.7448699, -0.2341906, 2.517857, 1, 1, 1, 1, 1,
0.7469104, -0.4479125, 1.133622, 1, 1, 1, 1, 1,
0.7502242, -0.2707146, 2.103543, 1, 1, 1, 1, 1,
0.750811, 0.4137452, 1.373991, 1, 1, 1, 1, 1,
0.7508601, -0.6295788, 3.592254, 1, 1, 1, 1, 1,
0.7535839, 1.873888, 1.459511, 1, 1, 1, 1, 1,
0.7537671, -0.8797297, 2.843836, 1, 1, 1, 1, 1,
0.7610934, 0.6308504, -0.007315016, 1, 1, 1, 1, 1,
0.7611102, 1.962858, 1.910767, 1, 1, 1, 1, 1,
0.7711661, 0.3072117, 1.618471, 1, 1, 1, 1, 1,
0.774625, -0.8342581, 2.552153, 1, 1, 1, 1, 1,
0.776789, 1.56111, 1.571887, 1, 1, 1, 1, 1,
0.7773205, -0.6325302, 1.525632, 1, 1, 1, 1, 1,
0.7785313, -0.3524754, 2.58102, 1, 1, 1, 1, 1,
0.7809836, 1.139753, 0.9706185, 1, 1, 1, 1, 1,
0.7814338, 1.106135, -0.01575165, 0, 0, 1, 1, 1,
0.7820317, -1.116527, 1.693452, 1, 0, 0, 1, 1,
0.7833624, 1.664031, 0.6525283, 1, 0, 0, 1, 1,
0.7856886, -0.1242815, 1.396086, 1, 0, 0, 1, 1,
0.787836, 0.308239, 1.942235, 1, 0, 0, 1, 1,
0.7960586, -1.1225, 1.971339, 1, 0, 0, 1, 1,
0.8033871, 0.5780729, 0.352354, 0, 0, 0, 1, 1,
0.8060157, -3.169681, 1.768978, 0, 0, 0, 1, 1,
0.8098251, 1.658269, 0.6715703, 0, 0, 0, 1, 1,
0.8120103, -1.101625, 2.751166, 0, 0, 0, 1, 1,
0.8173487, 0.6908873, 2.296459, 0, 0, 0, 1, 1,
0.8176996, -1.328076, 2.837695, 0, 0, 0, 1, 1,
0.822766, 0.3975888, 0.01902425, 0, 0, 0, 1, 1,
0.8262175, 0.8317438, -0.4186026, 1, 1, 1, 1, 1,
0.826399, -0.8111089, 1.534332, 1, 1, 1, 1, 1,
0.8290775, 0.2477862, 2.929042, 1, 1, 1, 1, 1,
0.8303359, 0.05009054, 2.069525, 1, 1, 1, 1, 1,
0.8350791, -0.606787, 2.549179, 1, 1, 1, 1, 1,
0.8477371, -1.528852, 2.479789, 1, 1, 1, 1, 1,
0.8519474, -0.1555854, 0.8573524, 1, 1, 1, 1, 1,
0.8536214, -1.907447, 2.011683, 1, 1, 1, 1, 1,
0.8555127, 0.04795479, 3.778722, 1, 1, 1, 1, 1,
0.8559822, -0.01307162, 2.124744, 1, 1, 1, 1, 1,
0.8575725, -0.970321, 1.466814, 1, 1, 1, 1, 1,
0.8590842, 1.870503, -0.3264049, 1, 1, 1, 1, 1,
0.860245, 0.7047858, -0.5083172, 1, 1, 1, 1, 1,
0.8640081, -0.8408181, 3.461158, 1, 1, 1, 1, 1,
0.8640342, 0.8618304, 0.9023032, 1, 1, 1, 1, 1,
0.8688014, 1.471857, 0.03268412, 0, 0, 1, 1, 1,
0.8695734, 0.9927888, 2.701924, 1, 0, 0, 1, 1,
0.8707365, 0.6155666, 1.83778, 1, 0, 0, 1, 1,
0.8713605, -1.48898, 0.480439, 1, 0, 0, 1, 1,
0.8714898, 0.9105971, 1.20911, 1, 0, 0, 1, 1,
0.8725999, -0.1322757, 0.535576, 1, 0, 0, 1, 1,
0.8731472, -0.4960619, 3.230378, 0, 0, 0, 1, 1,
0.873755, -0.8406615, 1.616578, 0, 0, 0, 1, 1,
0.8902434, 0.6119715, 1.296187, 0, 0, 0, 1, 1,
0.9164271, -0.5119768, 2.883729, 0, 0, 0, 1, 1,
0.929626, -0.04624487, 2.510886, 0, 0, 0, 1, 1,
0.9335881, -1.314464, 4.918585, 0, 0, 0, 1, 1,
0.9338477, 0.3037882, 1.116034, 0, 0, 0, 1, 1,
0.9344688, -0.7243134, 0.4655257, 1, 1, 1, 1, 1,
0.9380097, 1.006416, 0.7472354, 1, 1, 1, 1, 1,
0.9403238, -0.4811041, 1.94023, 1, 1, 1, 1, 1,
0.9460487, 0.537544, 1.914146, 1, 1, 1, 1, 1,
0.9493359, 0.08931885, 1.947883, 1, 1, 1, 1, 1,
0.9603589, 0.9336468, 0.2780324, 1, 1, 1, 1, 1,
0.9621267, 0.3871855, 0.03027385, 1, 1, 1, 1, 1,
0.9626008, -0.8935412, 2.112421, 1, 1, 1, 1, 1,
0.9643752, 0.2528753, 0.8303888, 1, 1, 1, 1, 1,
0.9681747, 0.09661491, 0.9465057, 1, 1, 1, 1, 1,
0.9693474, 0.3752329, 1.089995, 1, 1, 1, 1, 1,
0.9725026, -0.622209, 2.74406, 1, 1, 1, 1, 1,
0.9817957, 0.5492052, 3.043394, 1, 1, 1, 1, 1,
0.9821543, 0.8346018, 1.564618, 1, 1, 1, 1, 1,
0.9821959, 1.262363, 1.883648, 1, 1, 1, 1, 1,
0.9861998, -0.6466399, 1.084208, 0, 0, 1, 1, 1,
0.9915118, 0.8069251, 0.95586, 1, 0, 0, 1, 1,
0.9940628, 0.2510734, 0.5436845, 1, 0, 0, 1, 1,
0.9944055, 0.5810822, 2.415767, 1, 0, 0, 1, 1,
0.9956136, -0.7142535, 2.118992, 1, 0, 0, 1, 1,
0.9964567, -0.4773579, 4.882253, 1, 0, 0, 1, 1,
1.000631, 0.1155524, 1.101795, 0, 0, 0, 1, 1,
1.005431, 2.186006, 0.6384967, 0, 0, 0, 1, 1,
1.018261, 0.5027057, 1.244434, 0, 0, 0, 1, 1,
1.019654, -0.04395425, 2.866352, 0, 0, 0, 1, 1,
1.024495, 0.3949393, 2.692076, 0, 0, 0, 1, 1,
1.025109, -0.03472537, 2.372795, 0, 0, 0, 1, 1,
1.027611, 0.7106416, 2.352097, 0, 0, 0, 1, 1,
1.037241, 0.9771592, 1.469001, 1, 1, 1, 1, 1,
1.050048, 1.271458, 1.950469, 1, 1, 1, 1, 1,
1.050366, -0.05436188, 1.434084, 1, 1, 1, 1, 1,
1.051087, 0.9596654, 0.8380755, 1, 1, 1, 1, 1,
1.060123, 0.3875874, 0.9531958, 1, 1, 1, 1, 1,
1.067916, 1.034923, 1.087908, 1, 1, 1, 1, 1,
1.070793, 0.5413669, 0.8864603, 1, 1, 1, 1, 1,
1.083348, -1.077961, 2.089244, 1, 1, 1, 1, 1,
1.083584, -1.201393, 3.690012, 1, 1, 1, 1, 1,
1.083843, -1.20646, 2.205044, 1, 1, 1, 1, 1,
1.096993, 0.4828125, 1.821559, 1, 1, 1, 1, 1,
1.098469, -0.6080074, 2.011354, 1, 1, 1, 1, 1,
1.101659, 1.331367, -0.4001754, 1, 1, 1, 1, 1,
1.102329, -1.229944, 2.841807, 1, 1, 1, 1, 1,
1.103011, 0.293059, 0.980699, 1, 1, 1, 1, 1,
1.103703, 0.632053, 1.147147, 0, 0, 1, 1, 1,
1.109626, 0.01662146, 1.708212, 1, 0, 0, 1, 1,
1.112304, -1.187618, 1.987071, 1, 0, 0, 1, 1,
1.112888, 1.531093, 0.7846246, 1, 0, 0, 1, 1,
1.116588, -0.3702629, 1.209567, 1, 0, 0, 1, 1,
1.125156, -2.537357, 2.624254, 1, 0, 0, 1, 1,
1.127349, -1.438699, 2.520798, 0, 0, 0, 1, 1,
1.139944, 0.724116, -0.1532566, 0, 0, 0, 1, 1,
1.150473, -0.04392353, 1.576748, 0, 0, 0, 1, 1,
1.15219, 1.611596, 0.1163979, 0, 0, 0, 1, 1,
1.153575, 0.8950037, 3.182215, 0, 0, 0, 1, 1,
1.159933, -1.793923, 2.234405, 0, 0, 0, 1, 1,
1.164428, -0.4350467, 3.252506, 0, 0, 0, 1, 1,
1.176139, 0.5552997, 1.238442, 1, 1, 1, 1, 1,
1.178595, 1.096392, 0.9857912, 1, 1, 1, 1, 1,
1.189318, 0.8973876, -0.2453441, 1, 1, 1, 1, 1,
1.204851, -1.472556, 3.106706, 1, 1, 1, 1, 1,
1.224135, -0.3856036, 1.367857, 1, 1, 1, 1, 1,
1.224515, 1.289321, 1.157456, 1, 1, 1, 1, 1,
1.225565, -0.6980249, -0.135615, 1, 1, 1, 1, 1,
1.226502, 0.2855189, 1.913132, 1, 1, 1, 1, 1,
1.232131, -2.74296, 2.998085, 1, 1, 1, 1, 1,
1.23702, 1.510002, 1.480578, 1, 1, 1, 1, 1,
1.238496, 2.539552, 1.068385, 1, 1, 1, 1, 1,
1.244281, 0.513955, 0.01523915, 1, 1, 1, 1, 1,
1.249423, 1.233159, 1.191762, 1, 1, 1, 1, 1,
1.250769, -0.6696182, 1.359141, 1, 1, 1, 1, 1,
1.251483, 0.001007667, 0.9999931, 1, 1, 1, 1, 1,
1.252139, 0.8628805, -0.7855278, 0, 0, 1, 1, 1,
1.253636, 1.394842, 1.879902, 1, 0, 0, 1, 1,
1.274037, -1.866575, 2.522813, 1, 0, 0, 1, 1,
1.274383, -1.053614, 2.750089, 1, 0, 0, 1, 1,
1.274519, -0.1862711, 1.621905, 1, 0, 0, 1, 1,
1.281298, 0.8480192, 1.905073, 1, 0, 0, 1, 1,
1.295527, -0.5883602, 2.886422, 0, 0, 0, 1, 1,
1.301752, 2.009914, 0.8865027, 0, 0, 0, 1, 1,
1.30191, -1.544016, 2.378736, 0, 0, 0, 1, 1,
1.302505, -0.4834189, 2.907086, 0, 0, 0, 1, 1,
1.313082, -0.6734133, 1.777248, 0, 0, 0, 1, 1,
1.330114, -0.7975064, 2.365772, 0, 0, 0, 1, 1,
1.336147, 0.166202, 0.4775772, 0, 0, 0, 1, 1,
1.347799, -0.5338393, 2.802011, 1, 1, 1, 1, 1,
1.348111, -0.9985307, 2.491066, 1, 1, 1, 1, 1,
1.350519, -1.213995, 2.541417, 1, 1, 1, 1, 1,
1.35138, -0.5662559, 3.109741, 1, 1, 1, 1, 1,
1.355304, 1.312648, 1.701598, 1, 1, 1, 1, 1,
1.36, -0.4770201, 1.37794, 1, 1, 1, 1, 1,
1.361523, -0.2554298, 1.976829, 1, 1, 1, 1, 1,
1.361726, 2.089641, -1.526529, 1, 1, 1, 1, 1,
1.368334, 0.4197627, 2.055955, 1, 1, 1, 1, 1,
1.376255, 1.547139, 1.139492, 1, 1, 1, 1, 1,
1.387691, 0.7032394, 2.064575, 1, 1, 1, 1, 1,
1.418166, -0.2540253, 1.655541, 1, 1, 1, 1, 1,
1.424425, 0.121325, 0.8253964, 1, 1, 1, 1, 1,
1.428379, -1.280426, 2.478966, 1, 1, 1, 1, 1,
1.436479, 0.6972496, 0.5931999, 1, 1, 1, 1, 1,
1.448543, -0.6417326, 1.66126, 0, 0, 1, 1, 1,
1.454869, 0.2842955, 1.923969, 1, 0, 0, 1, 1,
1.458345, -0.2632174, -0.1091743, 1, 0, 0, 1, 1,
1.459753, 0.7458622, 0.357481, 1, 0, 0, 1, 1,
1.46039, 0.1518741, 0.06208266, 1, 0, 0, 1, 1,
1.464657, -0.6687721, 1.320522, 1, 0, 0, 1, 1,
1.466472, 1.436952, 0.9044183, 0, 0, 0, 1, 1,
1.47554, -0.6907629, 1.322212, 0, 0, 0, 1, 1,
1.481637, 0.3684214, 2.005522, 0, 0, 0, 1, 1,
1.484633, 1.815061, 1.213348, 0, 0, 0, 1, 1,
1.484724, 0.3769624, 0.9680846, 0, 0, 0, 1, 1,
1.486166, -0.8043994, 0.704855, 0, 0, 0, 1, 1,
1.486751, -1.863035, 2.159706, 0, 0, 0, 1, 1,
1.491567, 1.261181, 0.8306831, 1, 1, 1, 1, 1,
1.498171, 0.5820013, 0.6800805, 1, 1, 1, 1, 1,
1.502031, 0.180154, 2.16011, 1, 1, 1, 1, 1,
1.508497, -2.558492, 2.852016, 1, 1, 1, 1, 1,
1.515057, 1.06497, 3.014336, 1, 1, 1, 1, 1,
1.520279, 0.9056714, 0.7930908, 1, 1, 1, 1, 1,
1.525778, -0.4411112, 2.500517, 1, 1, 1, 1, 1,
1.530477, -1.123303, 0.3843148, 1, 1, 1, 1, 1,
1.55633, -0.7981778, 1.337247, 1, 1, 1, 1, 1,
1.594605, -0.8287109, 2.544913, 1, 1, 1, 1, 1,
1.599549, 2.223372, 0.4163618, 1, 1, 1, 1, 1,
1.603527, -0.1456012, 0.7051529, 1, 1, 1, 1, 1,
1.612325, 1.199207, 0.5011272, 1, 1, 1, 1, 1,
1.638793, -0.592905, 2.012944, 1, 1, 1, 1, 1,
1.650264, 2.11676, -0.5911809, 1, 1, 1, 1, 1,
1.653587, 1.323078, 2.263648, 0, 0, 1, 1, 1,
1.654896, 0.2827699, 0.2566509, 1, 0, 0, 1, 1,
1.665833, 2.178375, 1.698304, 1, 0, 0, 1, 1,
1.670708, -0.9350299, 1.388373, 1, 0, 0, 1, 1,
1.676563, -0.6504558, 0.5943466, 1, 0, 0, 1, 1,
1.689075, -0.1367673, 2.116382, 1, 0, 0, 1, 1,
1.703878, 0.1212313, 2.367285, 0, 0, 0, 1, 1,
1.708822, -1.17971, 3.827962, 0, 0, 0, 1, 1,
1.739335, -0.3210234, 0.5505731, 0, 0, 0, 1, 1,
1.768302, 0.6440498, 1.484052, 0, 0, 0, 1, 1,
1.776559, 0.8476101, 2.83025, 0, 0, 0, 1, 1,
1.776569, -0.4376114, 1.511861, 0, 0, 0, 1, 1,
1.807408, 1.796129, 0.9851671, 0, 0, 0, 1, 1,
1.823735, -0.3254705, -0.2834374, 1, 1, 1, 1, 1,
1.839674, -0.3843784, 2.262034, 1, 1, 1, 1, 1,
1.850027, -0.6349142, 1.017979, 1, 1, 1, 1, 1,
1.865543, 0.9627038, 0.2768641, 1, 1, 1, 1, 1,
1.874732, 0.1151332, 1.694171, 1, 1, 1, 1, 1,
1.8754, -0.5292343, -0.01719603, 1, 1, 1, 1, 1,
1.901877, -0.1536549, -0.1300464, 1, 1, 1, 1, 1,
1.903403, 1.265845, 2.41594, 1, 1, 1, 1, 1,
1.916099, -0.8240663, 2.4323, 1, 1, 1, 1, 1,
1.917025, -0.3633794, 0.5195848, 1, 1, 1, 1, 1,
1.919215, 1.393722, 1.443473, 1, 1, 1, 1, 1,
1.947809, -1.535633, 2.950942, 1, 1, 1, 1, 1,
1.955436, -0.2894901, 2.464383, 1, 1, 1, 1, 1,
1.958685, 1.026257, -0.3227728, 1, 1, 1, 1, 1,
1.999004, -0.7394764, 1.390094, 1, 1, 1, 1, 1,
2.017635, 1.510221, 0.7240383, 0, 0, 1, 1, 1,
2.040645, 0.03826052, 0.9971274, 1, 0, 0, 1, 1,
2.087637, 0.3726001, 1.956888, 1, 0, 0, 1, 1,
2.155685, 0.2219045, 1.900948, 1, 0, 0, 1, 1,
2.17292, 1.250221, 0.2958888, 1, 0, 0, 1, 1,
2.458845, 0.3889937, 0.3134023, 1, 0, 0, 1, 1,
2.470025, -0.7788538, 3.567663, 0, 0, 0, 1, 1,
2.49801, -0.6071503, -0.04467374, 0, 0, 0, 1, 1,
2.510228, -1.847566, 3.94652, 0, 0, 0, 1, 1,
2.524132, -1.583055, 1.94967, 0, 0, 0, 1, 1,
2.706651, -0.04118189, 1.715128, 0, 0, 0, 1, 1,
2.714703, -2.720861, 2.489542, 0, 0, 0, 1, 1,
2.75813, 1.466009, 1.007167, 0, 0, 0, 1, 1,
2.759721, -0.8088467, 3.211589, 1, 1, 1, 1, 1,
2.765513, -0.8129885, 1.633103, 1, 1, 1, 1, 1,
2.821229, -0.1533892, 1.359362, 1, 1, 1, 1, 1,
2.892073, -0.1149247, 2.189885, 1, 1, 1, 1, 1,
2.9263, -0.4572965, 2.618621, 1, 1, 1, 1, 1,
3.38393, -0.6725007, -0.3395718, 1, 1, 1, 1, 1,
3.814322, -0.5722075, 2.244928, 1, 1, 1, 1, 1
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
var radius = 9.50632;
var distance = 33.39054;
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
mvMatrix.translate( -0.2980018, 0.01013851, 0.1548696 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39054);
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
