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
-2.906369, -1.478913, -3.296232, 1, 0, 0, 1,
-2.80067, 0.480663, -3.116016, 1, 0.007843138, 0, 1,
-2.582241, 1.436178, 0.3492849, 1, 0.01176471, 0, 1,
-2.532769, 1.106663, 1.103977, 1, 0.01960784, 0, 1,
-2.386477, 0.6689473, -0.4679749, 1, 0.02352941, 0, 1,
-2.344807, -1.328098, -3.026686, 1, 0.03137255, 0, 1,
-2.337562, -1.152837, -1.295061, 1, 0.03529412, 0, 1,
-2.327996, -0.3075849, -2.70548, 1, 0.04313726, 0, 1,
-2.322933, -1.739605, -2.7753, 1, 0.04705882, 0, 1,
-2.241425, 0.1356595, -1.799508, 1, 0.05490196, 0, 1,
-2.206259, -0.2203854, -2.323456, 1, 0.05882353, 0, 1,
-2.1864, 0.1929133, -1.251275, 1, 0.06666667, 0, 1,
-2.173439, 0.006771572, -0.5088063, 1, 0.07058824, 0, 1,
-2.166921, -0.06569817, -1.929646, 1, 0.07843138, 0, 1,
-2.148613, -0.1756381, -2.810635, 1, 0.08235294, 0, 1,
-2.141494, 0.9748575, -1.844638, 1, 0.09019608, 0, 1,
-2.133092, 1.713702, -2.197058, 1, 0.09411765, 0, 1,
-2.132809, 0.08555642, -1.771791, 1, 0.1019608, 0, 1,
-2.12, -0.09110626, -2.22744, 1, 0.1098039, 0, 1,
-2.03103, 0.2011334, -1.638604, 1, 0.1137255, 0, 1,
-2.028006, 0.4592512, -0.9709073, 1, 0.1215686, 0, 1,
-2.009739, -0.5682712, -3.09596, 1, 0.1254902, 0, 1,
-1.966526, -0.2775449, -2.582753, 1, 0.1333333, 0, 1,
-1.949852, 2.870075, -1.651358, 1, 0.1372549, 0, 1,
-1.934831, 0.2151248, -1.230644, 1, 0.145098, 0, 1,
-1.933264, -1.978201, -2.56615, 1, 0.1490196, 0, 1,
-1.92849, -0.4087897, -2.189504, 1, 0.1568628, 0, 1,
-1.91951, 0.4660432, -0.7401652, 1, 0.1607843, 0, 1,
-1.918661, -1.576375, -2.134064, 1, 0.1686275, 0, 1,
-1.907584, 1.076669, -0.06341079, 1, 0.172549, 0, 1,
-1.884863, -0.4565844, -3.254999, 1, 0.1803922, 0, 1,
-1.88233, 1.410674, -0.7681278, 1, 0.1843137, 0, 1,
-1.86693, 0.1710397, -1.58848, 1, 0.1921569, 0, 1,
-1.851777, -0.2640091, -1.655005, 1, 0.1960784, 0, 1,
-1.839767, -0.5414196, -3.054135, 1, 0.2039216, 0, 1,
-1.838083, 0.6281417, -2.420273, 1, 0.2117647, 0, 1,
-1.833924, -0.200436, -1.607088, 1, 0.2156863, 0, 1,
-1.83045, 2.32046, 0.08357858, 1, 0.2235294, 0, 1,
-1.813762, 0.06074132, -1.133874, 1, 0.227451, 0, 1,
-1.802069, -1.936109, -2.559301, 1, 0.2352941, 0, 1,
-1.795501, 1.459893, -1.277611, 1, 0.2392157, 0, 1,
-1.783926, 0.9716396, 0.03957121, 1, 0.2470588, 0, 1,
-1.7784, 0.278857, -1.017904, 1, 0.2509804, 0, 1,
-1.758969, 1.30866, 0.4209274, 1, 0.2588235, 0, 1,
-1.748995, -1.770728, -2.010538, 1, 0.2627451, 0, 1,
-1.727782, -1.250457, -1.908512, 1, 0.2705882, 0, 1,
-1.715024, -1.052933, -3.341132, 1, 0.2745098, 0, 1,
-1.713876, -2.085704, -2.745952, 1, 0.282353, 0, 1,
-1.705594, 0.9277444, -1.441862, 1, 0.2862745, 0, 1,
-1.700148, -1.714113, 0.4762469, 1, 0.2941177, 0, 1,
-1.695252, 0.636035, -0.8389859, 1, 0.3019608, 0, 1,
-1.686753, 0.1403091, -1.988345, 1, 0.3058824, 0, 1,
-1.685294, 0.6728989, 0.2044358, 1, 0.3137255, 0, 1,
-1.677397, -1.202628, -0.8971065, 1, 0.3176471, 0, 1,
-1.673408, -1.950349, -1.498266, 1, 0.3254902, 0, 1,
-1.61494, 0.2785249, -1.815678, 1, 0.3294118, 0, 1,
-1.614376, -0.04973732, -1.786103, 1, 0.3372549, 0, 1,
-1.580522, 0.6804897, -2.353408, 1, 0.3411765, 0, 1,
-1.575712, -0.9226294, -2.04647, 1, 0.3490196, 0, 1,
-1.563674, -0.5982524, -1.628574, 1, 0.3529412, 0, 1,
-1.551107, 2.092235, 0.6516786, 1, 0.3607843, 0, 1,
-1.546286, -0.5064665, -3.353468, 1, 0.3647059, 0, 1,
-1.524768, 0.6210076, 0.1936421, 1, 0.372549, 0, 1,
-1.522307, 0.3773675, -1.889451, 1, 0.3764706, 0, 1,
-1.492442, 2.38574, -0.03472305, 1, 0.3843137, 0, 1,
-1.492126, -0.7843262, -1.149593, 1, 0.3882353, 0, 1,
-1.485265, 0.9841499, -1.024722, 1, 0.3960784, 0, 1,
-1.476312, -0.8630479, -1.569205, 1, 0.4039216, 0, 1,
-1.475743, -2.019065, -2.318554, 1, 0.4078431, 0, 1,
-1.474279, 0.1659811, 0.2013241, 1, 0.4156863, 0, 1,
-1.464733, -1.591973, -2.036976, 1, 0.4196078, 0, 1,
-1.456703, -1.059339, -1.939631, 1, 0.427451, 0, 1,
-1.45538, 0.8796698, 0.08169973, 1, 0.4313726, 0, 1,
-1.446213, 1.170695, -0.6741832, 1, 0.4392157, 0, 1,
-1.445578, -0.3555021, -0.9337388, 1, 0.4431373, 0, 1,
-1.43267, 0.8986203, -0.6661252, 1, 0.4509804, 0, 1,
-1.416278, 0.2814185, -2.046787, 1, 0.454902, 0, 1,
-1.415641, -0.1460163, -1.94132, 1, 0.4627451, 0, 1,
-1.41252, -0.1873321, -1.389111, 1, 0.4666667, 0, 1,
-1.411354, 0.3438978, 0.5968344, 1, 0.4745098, 0, 1,
-1.407778, -1.801104, -0.955694, 1, 0.4784314, 0, 1,
-1.40437, 1.42048, 0.2209323, 1, 0.4862745, 0, 1,
-1.395384, 0.7820483, -1.764085, 1, 0.4901961, 0, 1,
-1.386305, -0.5631418, -3.558625, 1, 0.4980392, 0, 1,
-1.384128, 1.228093, -1.830451, 1, 0.5058824, 0, 1,
-1.382687, 1.051435, -0.8466694, 1, 0.509804, 0, 1,
-1.377897, 0.1059091, -0.5821694, 1, 0.5176471, 0, 1,
-1.370831, -0.2469309, -2.005247, 1, 0.5215687, 0, 1,
-1.369796, -0.5322887, -1.234173, 1, 0.5294118, 0, 1,
-1.347824, 0.8748226, 0.1032321, 1, 0.5333334, 0, 1,
-1.344771, 0.3633442, -1.561118, 1, 0.5411765, 0, 1,
-1.344733, -0.3577558, -1.670751, 1, 0.5450981, 0, 1,
-1.337579, -0.05305509, -2.104046, 1, 0.5529412, 0, 1,
-1.337577, 0.4376398, -0.9931482, 1, 0.5568628, 0, 1,
-1.3358, -1.831272, -2.343084, 1, 0.5647059, 0, 1,
-1.332523, 0.5403761, -0.7126655, 1, 0.5686275, 0, 1,
-1.327668, -2.053758, -2.552418, 1, 0.5764706, 0, 1,
-1.315315, 1.550989, 1.178476, 1, 0.5803922, 0, 1,
-1.311901, 0.6304771, -2.77377, 1, 0.5882353, 0, 1,
-1.309001, 0.6843846, -0.7267839, 1, 0.5921569, 0, 1,
-1.29439, -0.5157474, -1.694622, 1, 0.6, 0, 1,
-1.29005, -0.02521921, -1.331749, 1, 0.6078432, 0, 1,
-1.28657, 0.2819954, -2.718057, 1, 0.6117647, 0, 1,
-1.286264, -1.059844, -3.455353, 1, 0.6196079, 0, 1,
-1.282995, 0.5314545, -2.696376, 1, 0.6235294, 0, 1,
-1.281148, 0.5360325, -1.150512, 1, 0.6313726, 0, 1,
-1.272695, 0.636125, -3.239166, 1, 0.6352941, 0, 1,
-1.261004, -0.3143472, -2.816116, 1, 0.6431373, 0, 1,
-1.260607, 1.046455, -0.8619079, 1, 0.6470588, 0, 1,
-1.256995, 0.7322081, -0.7213163, 1, 0.654902, 0, 1,
-1.25645, 2.157786, -0.06537289, 1, 0.6588235, 0, 1,
-1.25569, 1.091446, -1.085661, 1, 0.6666667, 0, 1,
-1.244877, 1.277166, -1.898836, 1, 0.6705883, 0, 1,
-1.237988, 0.7098403, -1.527147, 1, 0.6784314, 0, 1,
-1.236912, -1.343976, -1.199689, 1, 0.682353, 0, 1,
-1.236681, 0.910424, -1.152107, 1, 0.6901961, 0, 1,
-1.222975, -1.50772, -3.778841, 1, 0.6941177, 0, 1,
-1.217893, -0.3866594, -1.554779, 1, 0.7019608, 0, 1,
-1.215126, 0.5899169, -1.766968, 1, 0.7098039, 0, 1,
-1.210489, 0.1661076, -2.360788, 1, 0.7137255, 0, 1,
-1.202134, -0.03462419, -1.3483, 1, 0.7215686, 0, 1,
-1.200008, 0.6763586, -0.2289332, 1, 0.7254902, 0, 1,
-1.197345, 0.05034023, -2.274457, 1, 0.7333333, 0, 1,
-1.188004, -1.459177, -3.218705, 1, 0.7372549, 0, 1,
-1.18764, 0.440142, -2.487953, 1, 0.7450981, 0, 1,
-1.187284, 0.9153256, -0.4893368, 1, 0.7490196, 0, 1,
-1.18607, -0.08527805, -0.955775, 1, 0.7568628, 0, 1,
-1.182538, -0.5564185, -1.902072, 1, 0.7607843, 0, 1,
-1.162935, -0.1194459, -2.447008, 1, 0.7686275, 0, 1,
-1.162297, -0.524408, 0.1122638, 1, 0.772549, 0, 1,
-1.162145, -0.4920416, -1.738473, 1, 0.7803922, 0, 1,
-1.16013, -0.6681675, -1.834821, 1, 0.7843137, 0, 1,
-1.147929, 1.637472, -3.295626, 1, 0.7921569, 0, 1,
-1.140855, 2.36201, 0.931926, 1, 0.7960784, 0, 1,
-1.138362, 0.02747579, -0.4255247, 1, 0.8039216, 0, 1,
-1.136655, 0.1171695, -2.686494, 1, 0.8117647, 0, 1,
-1.135736, -1.384385, -3.328532, 1, 0.8156863, 0, 1,
-1.128736, -1.7741, -2.394933, 1, 0.8235294, 0, 1,
-1.126407, -0.2292362, -4.152668, 1, 0.827451, 0, 1,
-1.125688, -0.5808421, -3.086808, 1, 0.8352941, 0, 1,
-1.12439, -0.2569242, -1.749956, 1, 0.8392157, 0, 1,
-1.122134, 0.7045077, 0.375471, 1, 0.8470588, 0, 1,
-1.117682, 0.2542403, -1.954513, 1, 0.8509804, 0, 1,
-1.116539, -0.00410432, -1.822055, 1, 0.8588235, 0, 1,
-1.115114, -1.117421, -2.422166, 1, 0.8627451, 0, 1,
-1.111868, -0.7329039, -2.847908, 1, 0.8705882, 0, 1,
-1.089659, 0.09260817, -1.218306, 1, 0.8745098, 0, 1,
-1.08791, -0.7960808, -2.860123, 1, 0.8823529, 0, 1,
-1.080108, -1.92356, -1.730071, 1, 0.8862745, 0, 1,
-1.076351, -1.128822, -1.842947, 1, 0.8941177, 0, 1,
-1.076158, -1.311171, -0.8618243, 1, 0.8980392, 0, 1,
-1.0696, 1.565878, -1.737751, 1, 0.9058824, 0, 1,
-1.068002, -1.032934, -2.637467, 1, 0.9137255, 0, 1,
-1.055226, -1.228458, -3.617121, 1, 0.9176471, 0, 1,
-1.053262, 0.3882025, -2.359377, 1, 0.9254902, 0, 1,
-1.047787, 1.021196, -0.9896253, 1, 0.9294118, 0, 1,
-1.0453, -1.074289, -1.588529, 1, 0.9372549, 0, 1,
-1.039332, -1.230078, -4.133988, 1, 0.9411765, 0, 1,
-1.033372, 0.5653836, -0.5225751, 1, 0.9490196, 0, 1,
-1.029429, 2.172309, -0.7082256, 1, 0.9529412, 0, 1,
-1.025202, 1.368081, 0.3938517, 1, 0.9607843, 0, 1,
-1.019312, -0.910105, -3.230676, 1, 0.9647059, 0, 1,
-1.015965, -1.263402, -2.039327, 1, 0.972549, 0, 1,
-1.012956, 0.2806473, -0.353223, 1, 0.9764706, 0, 1,
-1.011384, 1.207544, 0.1842317, 1, 0.9843137, 0, 1,
-1.005983, 0.6147941, 0.7713419, 1, 0.9882353, 0, 1,
-1.00177, 1.373006, -0.8145245, 1, 0.9960784, 0, 1,
-1.00052, -1.083578, -0.9131793, 0.9960784, 1, 0, 1,
-0.991324, 2.21835, 0.4447503, 0.9921569, 1, 0, 1,
-0.9900947, -1.479208, -3.3382, 0.9843137, 1, 0, 1,
-0.9803943, 1.448169, -0.8663938, 0.9803922, 1, 0, 1,
-0.9795775, -0.7796862, -2.167057, 0.972549, 1, 0, 1,
-0.9753827, -0.1552041, 0.1134772, 0.9686275, 1, 0, 1,
-0.9708281, -0.5767473, -3.416648, 0.9607843, 1, 0, 1,
-0.9587934, 0.5266495, -0.5179406, 0.9568627, 1, 0, 1,
-0.9537946, -1.23365, -3.717221, 0.9490196, 1, 0, 1,
-0.9515864, 0.3548585, -1.464665, 0.945098, 1, 0, 1,
-0.9478301, -1.272527, -2.379529, 0.9372549, 1, 0, 1,
-0.9412842, 0.4595439, -2.349599, 0.9333333, 1, 0, 1,
-0.9377709, 0.9854714, -0.2235782, 0.9254902, 1, 0, 1,
-0.9372453, 0.8510606, -0.5430942, 0.9215686, 1, 0, 1,
-0.934875, -0.7681938, -0.2988902, 0.9137255, 1, 0, 1,
-0.9335341, -0.5467429, -1.221407, 0.9098039, 1, 0, 1,
-0.926299, 2.112396, -0.9732467, 0.9019608, 1, 0, 1,
-0.9223588, -0.01855484, -0.551756, 0.8941177, 1, 0, 1,
-0.9195779, 2.218656, -0.4782427, 0.8901961, 1, 0, 1,
-0.9128773, 0.2245673, -1.914051, 0.8823529, 1, 0, 1,
-0.9081844, -1.406441, -3.319516, 0.8784314, 1, 0, 1,
-0.9030579, 0.2135967, -1.089573, 0.8705882, 1, 0, 1,
-0.8962294, -1.219039, -3.078107, 0.8666667, 1, 0, 1,
-0.895602, -0.4835776, -0.6147557, 0.8588235, 1, 0, 1,
-0.8865457, -2.322348, -2.894276, 0.854902, 1, 0, 1,
-0.8848552, -0.8389941, -1.207741, 0.8470588, 1, 0, 1,
-0.8758502, 0.8768334, 0.09025332, 0.8431373, 1, 0, 1,
-0.8741428, -0.4909823, -3.315062, 0.8352941, 1, 0, 1,
-0.8739907, 0.5845054, -1.645817, 0.8313726, 1, 0, 1,
-0.8718309, 2.386923, -1.150997, 0.8235294, 1, 0, 1,
-0.8711451, 0.94993, -0.3900354, 0.8196079, 1, 0, 1,
-0.8677239, -1.228886, -3.163398, 0.8117647, 1, 0, 1,
-0.8605748, -0.1530442, -2.27141, 0.8078431, 1, 0, 1,
-0.8537456, 1.142224, -1.273453, 0.8, 1, 0, 1,
-0.8434592, -1.894924, -3.555704, 0.7921569, 1, 0, 1,
-0.8422626, -0.8706182, -2.650584, 0.7882353, 1, 0, 1,
-0.8414801, -1.118296, -2.114604, 0.7803922, 1, 0, 1,
-0.8255053, -0.4310582, -3.718361, 0.7764706, 1, 0, 1,
-0.8252814, -0.6140451, -3.188355, 0.7686275, 1, 0, 1,
-0.8186322, 1.402605, -0.3887134, 0.7647059, 1, 0, 1,
-0.8159387, 0.3835571, -1.494602, 0.7568628, 1, 0, 1,
-0.8106704, 1.743285, -2.117354, 0.7529412, 1, 0, 1,
-0.8085302, -1.05025, -2.205522, 0.7450981, 1, 0, 1,
-0.7998886, 0.3619955, -1.505257, 0.7411765, 1, 0, 1,
-0.7974966, -1.821725, -3.920876, 0.7333333, 1, 0, 1,
-0.7958329, -1.287448, -3.495888, 0.7294118, 1, 0, 1,
-0.7855949, 1.738012, 0.7026221, 0.7215686, 1, 0, 1,
-0.7809225, -0.3805788, -3.069713, 0.7176471, 1, 0, 1,
-0.7744215, -2.18694, -2.134645, 0.7098039, 1, 0, 1,
-0.7625634, 0.6811027, -0.5749954, 0.7058824, 1, 0, 1,
-0.7563379, 1.748345, 0.2022331, 0.6980392, 1, 0, 1,
-0.7546141, -1.841463, -3.610096, 0.6901961, 1, 0, 1,
-0.7527282, -0.6076296, -2.025635, 0.6862745, 1, 0, 1,
-0.751117, 0.1692012, -2.140211, 0.6784314, 1, 0, 1,
-0.7459067, -1.177655, -1.528436, 0.6745098, 1, 0, 1,
-0.7436631, -0.4098345, -2.571673, 0.6666667, 1, 0, 1,
-0.7431257, 0.7087031, -1.071231, 0.6627451, 1, 0, 1,
-0.7395878, 0.0101576, -1.913669, 0.654902, 1, 0, 1,
-0.7372575, -0.06695496, -1.526719, 0.6509804, 1, 0, 1,
-0.730388, 1.150635, 1.21701, 0.6431373, 1, 0, 1,
-0.7234189, 0.2531328, -2.499071, 0.6392157, 1, 0, 1,
-0.7198443, -2.057731, -1.933869, 0.6313726, 1, 0, 1,
-0.7193112, -0.02454701, -0.8782807, 0.627451, 1, 0, 1,
-0.7179882, 0.4603544, -1.942571, 0.6196079, 1, 0, 1,
-0.7164142, 1.476406, -1.48952, 0.6156863, 1, 0, 1,
-0.7150845, 0.5407914, -0.0350557, 0.6078432, 1, 0, 1,
-0.7150059, -0.1694277, -1.243026, 0.6039216, 1, 0, 1,
-0.7119353, -0.3969395, -3.335285, 0.5960785, 1, 0, 1,
-0.7098989, 0.5691097, -0.9701422, 0.5882353, 1, 0, 1,
-0.7098135, -0.1015426, -1.92324, 0.5843138, 1, 0, 1,
-0.7098055, -0.1434425, -2.713313, 0.5764706, 1, 0, 1,
-0.699855, -0.5177594, -0.9133671, 0.572549, 1, 0, 1,
-0.6989247, 0.9226484, -2.481996, 0.5647059, 1, 0, 1,
-0.692628, 0.4855805, -0.5168031, 0.5607843, 1, 0, 1,
-0.6901438, 0.2693703, -1.688473, 0.5529412, 1, 0, 1,
-0.6896248, 1.189028, 1.961384, 0.5490196, 1, 0, 1,
-0.6881625, -0.259644, 0.8997011, 0.5411765, 1, 0, 1,
-0.6822742, -1.262577, -4.558896, 0.5372549, 1, 0, 1,
-0.6802856, -0.5216208, -4.170718, 0.5294118, 1, 0, 1,
-0.6766707, 1.61123, -0.5247042, 0.5254902, 1, 0, 1,
-0.6749822, 0.8984778, -1.262106, 0.5176471, 1, 0, 1,
-0.6723535, -0.5443645, -2.606979, 0.5137255, 1, 0, 1,
-0.6709617, 0.5187728, -1.032607, 0.5058824, 1, 0, 1,
-0.6692796, -0.8684603, -3.806003, 0.5019608, 1, 0, 1,
-0.6663173, -0.4669061, -2.795199, 0.4941176, 1, 0, 1,
-0.6577299, -0.03008459, -1.626598, 0.4862745, 1, 0, 1,
-0.654973, 1.068858, -1.051052, 0.4823529, 1, 0, 1,
-0.6537824, -1.746306, -2.928991, 0.4745098, 1, 0, 1,
-0.6530873, 0.5315183, -2.759032, 0.4705882, 1, 0, 1,
-0.6347748, 1.169091, 1.469677, 0.4627451, 1, 0, 1,
-0.6303626, -0.5005052, -2.809482, 0.4588235, 1, 0, 1,
-0.626161, 0.6777938, -2.784938, 0.4509804, 1, 0, 1,
-0.6225657, 0.550833, -0.2846199, 0.4470588, 1, 0, 1,
-0.6223012, 0.4266995, -1.099585, 0.4392157, 1, 0, 1,
-0.620961, -1.26632, -3.494482, 0.4352941, 1, 0, 1,
-0.6195701, 1.368915, -0.8338307, 0.427451, 1, 0, 1,
-0.6145175, 2.468871, -0.0636407, 0.4235294, 1, 0, 1,
-0.6135232, -0.06888558, -3.173866, 0.4156863, 1, 0, 1,
-0.6092282, -0.6156597, -1.496908, 0.4117647, 1, 0, 1,
-0.6088398, 1.618875, -1.358947, 0.4039216, 1, 0, 1,
-0.6076384, -0.5774575, -0.6380693, 0.3960784, 1, 0, 1,
-0.606461, -0.566366, -2.391656, 0.3921569, 1, 0, 1,
-0.6044927, -1.411551, -1.961313, 0.3843137, 1, 0, 1,
-0.6017879, 0.3977293, -1.378359, 0.3803922, 1, 0, 1,
-0.598011, -1.633295, -2.222996, 0.372549, 1, 0, 1,
-0.5936021, -1.020033, -2.535734, 0.3686275, 1, 0, 1,
-0.5838056, 1.551301, 0.4567836, 0.3607843, 1, 0, 1,
-0.5830151, 1.429268, -0.8203666, 0.3568628, 1, 0, 1,
-0.5785204, -0.09871633, -1.497893, 0.3490196, 1, 0, 1,
-0.5777599, -0.4143052, -1.055919, 0.345098, 1, 0, 1,
-0.5777124, 0.4417477, -1.05225, 0.3372549, 1, 0, 1,
-0.5772181, 0.2881111, -0.8985616, 0.3333333, 1, 0, 1,
-0.5734402, 0.6332803, 0.8183513, 0.3254902, 1, 0, 1,
-0.5673122, 0.4265445, -1.166859, 0.3215686, 1, 0, 1,
-0.5635305, 1.095968, -0.898542, 0.3137255, 1, 0, 1,
-0.5609028, -0.8553641, 0.3567199, 0.3098039, 1, 0, 1,
-0.5572593, -0.7422881, -1.843791, 0.3019608, 1, 0, 1,
-0.5493538, -0.5248981, -1.432788, 0.2941177, 1, 0, 1,
-0.5482532, 0.8052855, -0.4439602, 0.2901961, 1, 0, 1,
-0.5437915, -0.6001375, -1.161258, 0.282353, 1, 0, 1,
-0.5427233, 0.6306233, -0.2339085, 0.2784314, 1, 0, 1,
-0.529783, -0.06899827, -0.7266179, 0.2705882, 1, 0, 1,
-0.5289477, -0.6890717, -0.3258098, 0.2666667, 1, 0, 1,
-0.5288647, 0.2069098, -1.537646, 0.2588235, 1, 0, 1,
-0.5250968, -1.751451, -3.752346, 0.254902, 1, 0, 1,
-0.5224941, -1.303853, -2.745949, 0.2470588, 1, 0, 1,
-0.5214821, 0.5030521, 0.07591794, 0.2431373, 1, 0, 1,
-0.5198205, -0.5897871, -2.741139, 0.2352941, 1, 0, 1,
-0.5197546, -1.624178, -2.338596, 0.2313726, 1, 0, 1,
-0.5095892, -1.316142, -1.973851, 0.2235294, 1, 0, 1,
-0.5093532, -1.39312, -4.304037, 0.2196078, 1, 0, 1,
-0.5077332, -0.5926333, -3.787132, 0.2117647, 1, 0, 1,
-0.4916796, 0.2073893, -1.173966, 0.2078431, 1, 0, 1,
-0.4801957, 0.3214272, -0.8026433, 0.2, 1, 0, 1,
-0.4740869, -0.8829076, -3.292141, 0.1921569, 1, 0, 1,
-0.4731175, 0.6036698, -0.6182012, 0.1882353, 1, 0, 1,
-0.4674792, 0.207576, -0.4290631, 0.1803922, 1, 0, 1,
-0.4656796, 0.5484492, -0.2116482, 0.1764706, 1, 0, 1,
-0.4654097, -1.15509, -3.409639, 0.1686275, 1, 0, 1,
-0.4639274, 1.014239, 1.109455, 0.1647059, 1, 0, 1,
-0.4637973, -0.1186056, -2.374893, 0.1568628, 1, 0, 1,
-0.4545265, -0.7312095, -3.325792, 0.1529412, 1, 0, 1,
-0.4526783, -0.4036705, -2.475603, 0.145098, 1, 0, 1,
-0.4517641, 1.348489, -2.294688, 0.1411765, 1, 0, 1,
-0.4468534, 0.6562793, -0.003979262, 0.1333333, 1, 0, 1,
-0.4462097, -0.3697726, -2.664066, 0.1294118, 1, 0, 1,
-0.4457287, 0.9020745, -0.3585359, 0.1215686, 1, 0, 1,
-0.4450969, -0.4342391, -2.125982, 0.1176471, 1, 0, 1,
-0.4402274, -0.5886973, -0.8962889, 0.1098039, 1, 0, 1,
-0.4397462, 0.2013136, -1.621634, 0.1058824, 1, 0, 1,
-0.4385188, 0.2559452, 0.2815349, 0.09803922, 1, 0, 1,
-0.4360708, -0.04151915, -1.160948, 0.09019608, 1, 0, 1,
-0.4335379, -2.381731, -4.211727, 0.08627451, 1, 0, 1,
-0.4307299, 0.8862279, 0.1366215, 0.07843138, 1, 0, 1,
-0.4296424, 0.02712427, -2.010169, 0.07450981, 1, 0, 1,
-0.4268071, 0.5683724, 0.9706807, 0.06666667, 1, 0, 1,
-0.4262533, 0.2152357, 0.6258426, 0.0627451, 1, 0, 1,
-0.4260531, 0.3627212, 0.7725198, 0.05490196, 1, 0, 1,
-0.4258258, 0.4532088, 0.9431539, 0.05098039, 1, 0, 1,
-0.423313, 0.3372458, -2.816093, 0.04313726, 1, 0, 1,
-0.423063, -0.7952767, -2.432238, 0.03921569, 1, 0, 1,
-0.4176427, 0.9417083, -1.583073, 0.03137255, 1, 0, 1,
-0.4154387, 0.5455201, -0.6193103, 0.02745098, 1, 0, 1,
-0.414869, -0.4668373, -1.873226, 0.01960784, 1, 0, 1,
-0.3978937, 1.211024, -0.3076634, 0.01568628, 1, 0, 1,
-0.3894344, -0.4759936, -4.00438, 0.007843138, 1, 0, 1,
-0.3881921, -1.184433, -3.99502, 0.003921569, 1, 0, 1,
-0.3776825, -0.1309066, -3.600278, 0, 1, 0.003921569, 1,
-0.3752734, 0.4715579, 1.800346, 0, 1, 0.01176471, 1,
-0.3725219, -0.8270321, -1.709556, 0, 1, 0.01568628, 1,
-0.3627239, -1.030146, -1.219398, 0, 1, 0.02352941, 1,
-0.3626298, -0.3941552, -0.4668438, 0, 1, 0.02745098, 1,
-0.3608373, 1.266513, -1.979954, 0, 1, 0.03529412, 1,
-0.358747, -1.403751, -2.213417, 0, 1, 0.03921569, 1,
-0.3580551, -0.661467, -2.038284, 0, 1, 0.04705882, 1,
-0.3571105, -0.2499786, -2.527553, 0, 1, 0.05098039, 1,
-0.3562818, 0.9905667, -2.14669, 0, 1, 0.05882353, 1,
-0.3473786, 0.1704266, -0.149618, 0, 1, 0.0627451, 1,
-0.3454325, -1.224801, -2.565794, 0, 1, 0.07058824, 1,
-0.3438803, 0.8692087, -0.4730911, 0, 1, 0.07450981, 1,
-0.3430764, -0.8708899, -3.966186, 0, 1, 0.08235294, 1,
-0.3421545, -1.602616, -2.563402, 0, 1, 0.08627451, 1,
-0.340883, -0.9389725, -3.309664, 0, 1, 0.09411765, 1,
-0.3399107, 1.300219, 0.7128302, 0, 1, 0.1019608, 1,
-0.3387665, 1.113196, -1.069422, 0, 1, 0.1058824, 1,
-0.3376524, 0.08377238, -0.5610007, 0, 1, 0.1137255, 1,
-0.3338294, 0.5242519, -0.5991018, 0, 1, 0.1176471, 1,
-0.3324862, 0.7340655, -1.192227, 0, 1, 0.1254902, 1,
-0.3196101, 1.131685, 0.8773544, 0, 1, 0.1294118, 1,
-0.3147853, -0.2998101, -2.990455, 0, 1, 0.1372549, 1,
-0.3083239, -0.3661433, -1.429179, 0, 1, 0.1411765, 1,
-0.305786, -1.203058, -2.503852, 0, 1, 0.1490196, 1,
-0.3046508, 0.902968, -0.04464837, 0, 1, 0.1529412, 1,
-0.302308, 1.008023, 0.9183125, 0, 1, 0.1607843, 1,
-0.3015662, 1.063506, 0.409029, 0, 1, 0.1647059, 1,
-0.3004495, -1.161177, -3.350497, 0, 1, 0.172549, 1,
-0.2976792, 0.8181893, -0.5286081, 0, 1, 0.1764706, 1,
-0.2930269, 2.670221, -1.110167, 0, 1, 0.1843137, 1,
-0.2913532, -0.8185775, -3.475931, 0, 1, 0.1882353, 1,
-0.2862215, 0.8255451, 0.02914037, 0, 1, 0.1960784, 1,
-0.2758445, -0.8388093, -3.335935, 0, 1, 0.2039216, 1,
-0.2726851, 0.1712527, -0.734298, 0, 1, 0.2078431, 1,
-0.2660221, 0.7116275, 0.5074704, 0, 1, 0.2156863, 1,
-0.2584161, -0.9570326, -2.633089, 0, 1, 0.2196078, 1,
-0.2584002, 0.1325695, -2.390757, 0, 1, 0.227451, 1,
-0.2572053, -1.225432, -3.88773, 0, 1, 0.2313726, 1,
-0.2567405, 0.5554089, -1.142785, 0, 1, 0.2392157, 1,
-0.2549046, -1.275843, -2.519943, 0, 1, 0.2431373, 1,
-0.2535087, -0.3813944, -1.952183, 0, 1, 0.2509804, 1,
-0.2529441, 0.5734261, -2.068544, 0, 1, 0.254902, 1,
-0.2478408, -0.144355, -0.07455477, 0, 1, 0.2627451, 1,
-0.2474393, 1.391113, 0.5074918, 0, 1, 0.2666667, 1,
-0.2425979, -1.681459, -3.278761, 0, 1, 0.2745098, 1,
-0.2419408, 0.2699386, -1.462548, 0, 1, 0.2784314, 1,
-0.2400336, 0.1523748, 0.6885603, 0, 1, 0.2862745, 1,
-0.2398838, 1.178855, -1.020409, 0, 1, 0.2901961, 1,
-0.2392515, 0.2654686, 1.54656, 0, 1, 0.2980392, 1,
-0.2388559, 0.2377583, -1.13247, 0, 1, 0.3058824, 1,
-0.2387932, -0.7166092, -2.472569, 0, 1, 0.3098039, 1,
-0.2384287, 1.413887, -0.1351447, 0, 1, 0.3176471, 1,
-0.237111, -0.3301841, -3.440899, 0, 1, 0.3215686, 1,
-0.2365188, -0.9025993, -3.99312, 0, 1, 0.3294118, 1,
-0.2352993, -1.169161, -1.285455, 0, 1, 0.3333333, 1,
-0.2252151, -0.203676, -2.705569, 0, 1, 0.3411765, 1,
-0.2246554, 0.8074278, 0.3274126, 0, 1, 0.345098, 1,
-0.2229125, 0.9504033, -2.851732, 0, 1, 0.3529412, 1,
-0.2167232, 0.06969377, -1.380308, 0, 1, 0.3568628, 1,
-0.2120195, -1.535144, -2.316406, 0, 1, 0.3647059, 1,
-0.2099107, -0.6700562, -1.310578, 0, 1, 0.3686275, 1,
-0.208041, 0.3813685, -1.501671, 0, 1, 0.3764706, 1,
-0.2045034, 1.858184, 0.7145169, 0, 1, 0.3803922, 1,
-0.2040277, 0.3956124, 0.9148803, 0, 1, 0.3882353, 1,
-0.2036463, 2.467178, 0.002303173, 0, 1, 0.3921569, 1,
-0.2026589, -1.198289, -3.199397, 0, 1, 0.4, 1,
-0.2024409, -0.5658862, -2.478468, 0, 1, 0.4078431, 1,
-0.1964815, -0.1192973, 0.2535341, 0, 1, 0.4117647, 1,
-0.1942301, 0.9079793, -0.01570043, 0, 1, 0.4196078, 1,
-0.1939781, -1.184455, -1.975094, 0, 1, 0.4235294, 1,
-0.1926815, 1.676082, 1.70958, 0, 1, 0.4313726, 1,
-0.1922252, -0.09835891, -1.555872, 0, 1, 0.4352941, 1,
-0.1909482, 0.1043038, -2.173966, 0, 1, 0.4431373, 1,
-0.1845777, 0.5283998, -0.9929149, 0, 1, 0.4470588, 1,
-0.1845158, -0.2203302, -1.312657, 0, 1, 0.454902, 1,
-0.1790231, -1.488381, -3.304178, 0, 1, 0.4588235, 1,
-0.1788641, -0.9968138, -3.366756, 0, 1, 0.4666667, 1,
-0.1762161, 0.7335501, -1.041931, 0, 1, 0.4705882, 1,
-0.173515, -1.060121, -2.38684, 0, 1, 0.4784314, 1,
-0.1665171, 0.1146198, -3.393729, 0, 1, 0.4823529, 1,
-0.1643136, 1.061992, -0.1618101, 0, 1, 0.4901961, 1,
-0.163534, 0.6548376, -1.387738, 0, 1, 0.4941176, 1,
-0.1611079, -0.05541168, -2.546037, 0, 1, 0.5019608, 1,
-0.1464303, 0.694432, -0.5666864, 0, 1, 0.509804, 1,
-0.1463078, -1.085876, -1.751651, 0, 1, 0.5137255, 1,
-0.1374239, -0.764904, -3.139529, 0, 1, 0.5215687, 1,
-0.1372894, 0.5993114, -1.521557, 0, 1, 0.5254902, 1,
-0.133032, 0.8000363, 1.180744, 0, 1, 0.5333334, 1,
-0.1280427, -0.2258147, -2.45542, 0, 1, 0.5372549, 1,
-0.1272797, 0.6401312, -0.04798764, 0, 1, 0.5450981, 1,
-0.1270054, -0.4659435, -3.843313, 0, 1, 0.5490196, 1,
-0.1248583, 0.07958928, -0.4499435, 0, 1, 0.5568628, 1,
-0.1231178, 0.7109528, 0.3461995, 0, 1, 0.5607843, 1,
-0.1226893, -1.051383, -4.012477, 0, 1, 0.5686275, 1,
-0.1182145, 0.2588217, -0.1799945, 0, 1, 0.572549, 1,
-0.1170925, -1.349438, -3.288008, 0, 1, 0.5803922, 1,
-0.1162364, -0.7923158, -2.44823, 0, 1, 0.5843138, 1,
-0.1155226, 2.143259, -1.109502, 0, 1, 0.5921569, 1,
-0.1148324, 0.8352196, -1.937867, 0, 1, 0.5960785, 1,
-0.1123855, 1.339332, 1.281941, 0, 1, 0.6039216, 1,
-0.110635, 0.7238033, -0.886665, 0, 1, 0.6117647, 1,
-0.1103964, -0.7501508, -1.684636, 0, 1, 0.6156863, 1,
-0.1051312, 0.7866861, 0.6014466, 0, 1, 0.6235294, 1,
-0.1003679, -2.418109, -3.861953, 0, 1, 0.627451, 1,
-0.0856253, -0.03455939, -1.628576, 0, 1, 0.6352941, 1,
-0.07999153, -1.706308, -2.106622, 0, 1, 0.6392157, 1,
-0.07865191, -0.25461, -2.781129, 0, 1, 0.6470588, 1,
-0.07852206, 1.695123, -0.6488738, 0, 1, 0.6509804, 1,
-0.07740981, -1.021112, -4.077188, 0, 1, 0.6588235, 1,
-0.07125727, 1.156358, -0.0648751, 0, 1, 0.6627451, 1,
-0.06821904, -0.4797301, -3.911569, 0, 1, 0.6705883, 1,
-0.06800737, -1.350517, -4.567925, 0, 1, 0.6745098, 1,
-0.05599975, -0.3420799, -2.374197, 0, 1, 0.682353, 1,
-0.05070808, 0.6692734, -1.713657, 0, 1, 0.6862745, 1,
-0.04945524, -1.489793, -1.448752, 0, 1, 0.6941177, 1,
-0.04746582, 0.07675989, -0.356011, 0, 1, 0.7019608, 1,
-0.04571898, -0.3316132, -2.760033, 0, 1, 0.7058824, 1,
-0.03982989, -0.06159721, -2.66903, 0, 1, 0.7137255, 1,
-0.03668936, -0.5115622, -2.056817, 0, 1, 0.7176471, 1,
-0.03496046, -0.04915389, -1.590589, 0, 1, 0.7254902, 1,
-0.03448166, -0.416378, -3.515194, 0, 1, 0.7294118, 1,
-0.03261339, 0.338788, 0.1216005, 0, 1, 0.7372549, 1,
-0.02987616, 1.738702, 0.2505224, 0, 1, 0.7411765, 1,
-0.02274338, 1.514432, -0.732313, 0, 1, 0.7490196, 1,
-0.02231683, -2.457144, -1.967997, 0, 1, 0.7529412, 1,
-0.01762345, 0.931107, 0.6571665, 0, 1, 0.7607843, 1,
-0.01692996, -0.3587267, -4.643602, 0, 1, 0.7647059, 1,
-0.01607826, 2.07332, 0.528367, 0, 1, 0.772549, 1,
-0.01512591, 0.1381903, -0.2772413, 0, 1, 0.7764706, 1,
-0.01353656, 0.7955566, -0.2294848, 0, 1, 0.7843137, 1,
-0.004523894, 1.626541, -0.7982291, 0, 1, 0.7882353, 1,
0.005263496, -0.08955875, 2.617283, 0, 1, 0.7960784, 1,
0.006477006, 0.7288334, -0.2510889, 0, 1, 0.8039216, 1,
0.007637449, 0.6974267, -1.116988, 0, 1, 0.8078431, 1,
0.008327041, -0.2237237, 2.666802, 0, 1, 0.8156863, 1,
0.008725359, 0.280436, -1.69262, 0, 1, 0.8196079, 1,
0.01147871, -0.758965, 1.761547, 0, 1, 0.827451, 1,
0.0118016, 0.6074589, -0.09493455, 0, 1, 0.8313726, 1,
0.01223168, 1.261945, -0.1767135, 0, 1, 0.8392157, 1,
0.01291813, -1.705488, 1.68472, 0, 1, 0.8431373, 1,
0.01458034, 1.445591, 0.7023782, 0, 1, 0.8509804, 1,
0.01488059, 0.8908796, 1.85946, 0, 1, 0.854902, 1,
0.0161782, -0.8940484, 3.492635, 0, 1, 0.8627451, 1,
0.01678916, -1.203591, 1.791773, 0, 1, 0.8666667, 1,
0.01779605, -0.8661333, 2.122962, 0, 1, 0.8745098, 1,
0.02415774, 1.856872, -1.089852, 0, 1, 0.8784314, 1,
0.02924991, 0.2361458, 0.6620298, 0, 1, 0.8862745, 1,
0.03072371, 1.369545, 2.714195, 0, 1, 0.8901961, 1,
0.03164993, 0.4354826, 1.175533, 0, 1, 0.8980392, 1,
0.03469393, 0.5427881, -0.6578199, 0, 1, 0.9058824, 1,
0.03646035, 1.417293, 0.6501487, 0, 1, 0.9098039, 1,
0.04008323, 0.3015097, 2.087554, 0, 1, 0.9176471, 1,
0.04355159, -0.498495, 4.184251, 0, 1, 0.9215686, 1,
0.04572732, 2.284899, 1.182935, 0, 1, 0.9294118, 1,
0.04665085, 0.003544348, 0.01526299, 0, 1, 0.9333333, 1,
0.05542118, 0.873226, -0.7569617, 0, 1, 0.9411765, 1,
0.06063222, 1.422878, 0.7639081, 0, 1, 0.945098, 1,
0.06082264, -1.123561, 4.042943, 0, 1, 0.9529412, 1,
0.07188136, 0.4192997, 1.436535, 0, 1, 0.9568627, 1,
0.07454126, 0.5807289, -0.5696706, 0, 1, 0.9647059, 1,
0.07803184, -1.109528, 1.575593, 0, 1, 0.9686275, 1,
0.0789389, 0.4739905, -0.4301339, 0, 1, 0.9764706, 1,
0.08207478, -0.1667832, 4.18007, 0, 1, 0.9803922, 1,
0.08556411, 1.447736, 1.032239, 0, 1, 0.9882353, 1,
0.09389672, 0.4810946, -1.025695, 0, 1, 0.9921569, 1,
0.09397633, 0.6287223, -0.2312639, 0, 1, 1, 1,
0.09491224, -0.9190955, 3.503609, 0, 0.9921569, 1, 1,
0.1022717, -0.5958797, 2.174552, 0, 0.9882353, 1, 1,
0.1049229, 0.8126808, -0.121383, 0, 0.9803922, 1, 1,
0.1056506, 1.206833, -0.3352283, 0, 0.9764706, 1, 1,
0.1062041, -0.5637301, 1.133584, 0, 0.9686275, 1, 1,
0.1089492, -0.7781282, 3.007483, 0, 0.9647059, 1, 1,
0.1119151, 2.109715, 0.8971452, 0, 0.9568627, 1, 1,
0.1145821, -0.7721465, 4.512055, 0, 0.9529412, 1, 1,
0.1151885, 2.186054, 0.8701211, 0, 0.945098, 1, 1,
0.1160497, 0.9539022, 2.326475, 0, 0.9411765, 1, 1,
0.1171675, 2.927512, 1.607765, 0, 0.9333333, 1, 1,
0.1188859, -0.6278054, 0.6764193, 0, 0.9294118, 1, 1,
0.1261258, -1.869854, 4.446946, 0, 0.9215686, 1, 1,
0.1291213, 1.356864, 0.9817505, 0, 0.9176471, 1, 1,
0.1292728, 0.3806282, -0.3599482, 0, 0.9098039, 1, 1,
0.1315396, 1.564629, 0.3747171, 0, 0.9058824, 1, 1,
0.1332428, 2.127584, 0.7008064, 0, 0.8980392, 1, 1,
0.1342525, -0.7693632, 2.687352, 0, 0.8901961, 1, 1,
0.1361028, 2.161288, 1.31441, 0, 0.8862745, 1, 1,
0.1362843, -0.4480148, 3.252278, 0, 0.8784314, 1, 1,
0.1387452, -0.1911547, 0.5153374, 0, 0.8745098, 1, 1,
0.1427244, -0.3394333, 3.485464, 0, 0.8666667, 1, 1,
0.1462704, -0.6408762, 2.196432, 0, 0.8627451, 1, 1,
0.1469114, -0.7357833, 1.625735, 0, 0.854902, 1, 1,
0.1470539, -0.2259451, 2.029424, 0, 0.8509804, 1, 1,
0.1475243, -1.28681, 4.090665, 0, 0.8431373, 1, 1,
0.1521643, 0.7551644, 0.6581393, 0, 0.8392157, 1, 1,
0.1525403, -1.210718, 3.148692, 0, 0.8313726, 1, 1,
0.15257, 0.3204189, 1.257758, 0, 0.827451, 1, 1,
0.1538745, 0.5813657, -1.362223, 0, 0.8196079, 1, 1,
0.1539239, 2.111314, 0.4260917, 0, 0.8156863, 1, 1,
0.1571603, 0.2789296, 0.8565206, 0, 0.8078431, 1, 1,
0.1574084, 0.8014427, -1.237374, 0, 0.8039216, 1, 1,
0.1620181, 0.1614149, 0.2476602, 0, 0.7960784, 1, 1,
0.1659691, 0.4463802, 0.01029331, 0, 0.7882353, 1, 1,
0.1665158, 1.632518, 0.6146606, 0, 0.7843137, 1, 1,
0.1665167, 0.5129056, -0.9073607, 0, 0.7764706, 1, 1,
0.1681296, -0.723901, 4.340135, 0, 0.772549, 1, 1,
0.1701674, 0.5333558, -0.8374129, 0, 0.7647059, 1, 1,
0.1704521, -0.2643538, 0.9149798, 0, 0.7607843, 1, 1,
0.1707657, 0.3788207, 1.289135, 0, 0.7529412, 1, 1,
0.171658, 1.181503, 1.214267, 0, 0.7490196, 1, 1,
0.1783914, -0.2797892, 1.800051, 0, 0.7411765, 1, 1,
0.1862637, -1.105159, 3.133765, 0, 0.7372549, 1, 1,
0.1865913, 0.6399468, -0.7902722, 0, 0.7294118, 1, 1,
0.1871093, 0.4629141, 0.744859, 0, 0.7254902, 1, 1,
0.188252, -1.635104, 1.228774, 0, 0.7176471, 1, 1,
0.1888514, 1.293469, 0.52908, 0, 0.7137255, 1, 1,
0.1900451, 1.717396, 0.6279213, 0, 0.7058824, 1, 1,
0.1903955, -1.47265, 2.301624, 0, 0.6980392, 1, 1,
0.1942129, 0.7789689, 0.8003257, 0, 0.6941177, 1, 1,
0.1950641, 0.03114951, 1.430325, 0, 0.6862745, 1, 1,
0.1956709, -1.353995, 3.073661, 0, 0.682353, 1, 1,
0.1966421, 0.5150614, 3.42985, 0, 0.6745098, 1, 1,
0.1971628, -0.4454913, 0.8793166, 0, 0.6705883, 1, 1,
0.1982686, 0.2453685, 2.939693, 0, 0.6627451, 1, 1,
0.2001164, -0.9473218, 1.275898, 0, 0.6588235, 1, 1,
0.2009583, -0.595554, 2.673418, 0, 0.6509804, 1, 1,
0.2039978, -0.9898902, 2.670792, 0, 0.6470588, 1, 1,
0.2050266, 0.07669466, -0.007914099, 0, 0.6392157, 1, 1,
0.2056852, -0.04872554, 1.898799, 0, 0.6352941, 1, 1,
0.2058562, -0.8510662, 4.755479, 0, 0.627451, 1, 1,
0.2074704, 2.101298, 0.08018196, 0, 0.6235294, 1, 1,
0.2088853, -0.5997629, 4.691147, 0, 0.6156863, 1, 1,
0.2119918, 0.8154548, 1.359561, 0, 0.6117647, 1, 1,
0.2124201, -0.5467339, 2.224211, 0, 0.6039216, 1, 1,
0.2147656, -0.232623, 2.241715, 0, 0.5960785, 1, 1,
0.2150537, 1.166791, 0.3574769, 0, 0.5921569, 1, 1,
0.2160839, 0.4616692, 0.09116646, 0, 0.5843138, 1, 1,
0.2167706, 0.6808496, 0.7457406, 0, 0.5803922, 1, 1,
0.2209184, -0.7781149, 2.938467, 0, 0.572549, 1, 1,
0.2232624, 0.9122607, -1.864704, 0, 0.5686275, 1, 1,
0.2254317, 1.317427, 2.53327, 0, 0.5607843, 1, 1,
0.2291484, -2.525456, 1.575022, 0, 0.5568628, 1, 1,
0.2309244, -0.9432893, 1.682562, 0, 0.5490196, 1, 1,
0.2326085, -0.8769103, 1.601321, 0, 0.5450981, 1, 1,
0.2337236, -1.009871, 2.343652, 0, 0.5372549, 1, 1,
0.2347218, 1.186443, 0.4010024, 0, 0.5333334, 1, 1,
0.2351132, 0.6389992, 0.02580471, 0, 0.5254902, 1, 1,
0.2359805, -0.2941895, 2.739805, 0, 0.5215687, 1, 1,
0.2375869, 0.7722522, -0.3082861, 0, 0.5137255, 1, 1,
0.2401257, 0.9976512, -0.25049, 0, 0.509804, 1, 1,
0.2448467, -0.08729352, 3.132849, 0, 0.5019608, 1, 1,
0.2454967, -0.5873595, 3.240017, 0, 0.4941176, 1, 1,
0.2473973, 0.2242745, 0.2022273, 0, 0.4901961, 1, 1,
0.2480894, 0.2358397, 1.019354, 0, 0.4823529, 1, 1,
0.2492077, 1.655689, -0.4509918, 0, 0.4784314, 1, 1,
0.2502952, 0.0576219, 2.802784, 0, 0.4705882, 1, 1,
0.2553228, -1.094675, 3.485002, 0, 0.4666667, 1, 1,
0.2559557, -0.68082, 3.211408, 0, 0.4588235, 1, 1,
0.257605, -0.6674894, 1.409004, 0, 0.454902, 1, 1,
0.2576068, -2.517461, 3.034969, 0, 0.4470588, 1, 1,
0.2586867, -0.7076468, 4.013898, 0, 0.4431373, 1, 1,
0.2595409, -1.492495, 3.318813, 0, 0.4352941, 1, 1,
0.2634695, -0.3069679, 2.850175, 0, 0.4313726, 1, 1,
0.2634923, -2.630782, 3.369457, 0, 0.4235294, 1, 1,
0.2654574, -0.9947506, 1.470631, 0, 0.4196078, 1, 1,
0.2659784, -0.3386234, 2.364118, 0, 0.4117647, 1, 1,
0.267159, -0.03160029, 1.590201, 0, 0.4078431, 1, 1,
0.2673942, 0.9505996, -0.4415297, 0, 0.4, 1, 1,
0.2675169, 2.643849, 1.932213, 0, 0.3921569, 1, 1,
0.2690284, 1.284776, 1.289371, 0, 0.3882353, 1, 1,
0.272643, -0.4749588, 1.598234, 0, 0.3803922, 1, 1,
0.2784871, 0.9796647, 0.531795, 0, 0.3764706, 1, 1,
0.2792964, -1.688639, 2.664506, 0, 0.3686275, 1, 1,
0.2818415, 1.302245, 0.6491004, 0, 0.3647059, 1, 1,
0.287485, 0.165167, 0.395029, 0, 0.3568628, 1, 1,
0.2893367, -1.186629, 3.739998, 0, 0.3529412, 1, 1,
0.2928185, -2.06319, 3.213486, 0, 0.345098, 1, 1,
0.2942994, -0.8419557, 1.882705, 0, 0.3411765, 1, 1,
0.3019553, -2.126357, 2.879591, 0, 0.3333333, 1, 1,
0.3031043, 0.3490042, 1.252836, 0, 0.3294118, 1, 1,
0.3038241, -0.4097275, 1.890818, 0, 0.3215686, 1, 1,
0.3074427, -1.291492, 4.43783, 0, 0.3176471, 1, 1,
0.3081613, -0.9351742, 3.027012, 0, 0.3098039, 1, 1,
0.3133496, 1.063045, 1.307809, 0, 0.3058824, 1, 1,
0.3164786, -2.964962, 3.251217, 0, 0.2980392, 1, 1,
0.3246556, -1.091222, 4.165515, 0, 0.2901961, 1, 1,
0.3292682, -1.365541, 3.692224, 0, 0.2862745, 1, 1,
0.3330387, -1.922579, 2.672352, 0, 0.2784314, 1, 1,
0.3367026, 1.7156, 0.9479232, 0, 0.2745098, 1, 1,
0.3374951, -0.1209112, 1.038305, 0, 0.2666667, 1, 1,
0.3412829, 0.8844835, 1.901814, 0, 0.2627451, 1, 1,
0.3486843, 0.3310547, -1.067997, 0, 0.254902, 1, 1,
0.3489273, -0.75718, 3.484331, 0, 0.2509804, 1, 1,
0.349991, 1.231958, 2.688899, 0, 0.2431373, 1, 1,
0.3572089, -0.6512277, 1.204807, 0, 0.2392157, 1, 1,
0.3587213, -0.4028438, 0.7307339, 0, 0.2313726, 1, 1,
0.35964, 0.2793068, 1.257609, 0, 0.227451, 1, 1,
0.361869, -0.6579927, 3.571902, 0, 0.2196078, 1, 1,
0.3696944, -0.05555269, 1.100245, 0, 0.2156863, 1, 1,
0.3733042, 1.103721, 0.661087, 0, 0.2078431, 1, 1,
0.3755564, -1.101224, 4.37837, 0, 0.2039216, 1, 1,
0.3770815, 0.4978967, 0.60009, 0, 0.1960784, 1, 1,
0.3814249, -0.1927094, 2.723141, 0, 0.1882353, 1, 1,
0.3831292, 0.3708692, 2.522942, 0, 0.1843137, 1, 1,
0.3860267, -0.9023983, 2.267109, 0, 0.1764706, 1, 1,
0.3890879, 0.4694255, -0.004280788, 0, 0.172549, 1, 1,
0.3976122, 0.5070537, 0.9322661, 0, 0.1647059, 1, 1,
0.3989207, 0.3658299, -0.1674815, 0, 0.1607843, 1, 1,
0.3991105, -0.01130862, 2.563097, 0, 0.1529412, 1, 1,
0.4005248, -1.094425, 3.556395, 0, 0.1490196, 1, 1,
0.4015323, -0.7794116, 2.812519, 0, 0.1411765, 1, 1,
0.4056874, 1.004242, 0.1062846, 0, 0.1372549, 1, 1,
0.4060693, -1.468356, 2.664711, 0, 0.1294118, 1, 1,
0.4119478, 0.5050325, 1.026162, 0, 0.1254902, 1, 1,
0.4133488, 0.7454464, 0.8833035, 0, 0.1176471, 1, 1,
0.4137203, -0.3044915, 3.792717, 0, 0.1137255, 1, 1,
0.415502, -0.7696391, 2.859665, 0, 0.1058824, 1, 1,
0.4205313, -0.6123391, 4.782788, 0, 0.09803922, 1, 1,
0.4228272, -1.412358, 1.519154, 0, 0.09411765, 1, 1,
0.4233012, -0.3099886, 2.814569, 0, 0.08627451, 1, 1,
0.4244544, 0.8542498, 0.2648728, 0, 0.08235294, 1, 1,
0.4246374, -0.4145451, 1.474553, 0, 0.07450981, 1, 1,
0.4258767, 1.011526, 1.104491, 0, 0.07058824, 1, 1,
0.4289907, 0.1237383, 1.800991, 0, 0.0627451, 1, 1,
0.4294596, 0.9167499, 0.719933, 0, 0.05882353, 1, 1,
0.4299223, 0.4042268, 3.470879, 0, 0.05098039, 1, 1,
0.4314306, -0.4681665, 3.597063, 0, 0.04705882, 1, 1,
0.4383766, -0.3431257, 2.018016, 0, 0.03921569, 1, 1,
0.4399534, -1.613995, 3.537963, 0, 0.03529412, 1, 1,
0.4443898, -0.9796579, 1.101212, 0, 0.02745098, 1, 1,
0.4506045, 1.312795, -0.5913047, 0, 0.02352941, 1, 1,
0.4510711, 0.6113457, -1.284214, 0, 0.01568628, 1, 1,
0.4544386, -0.7273644, 4.098846, 0, 0.01176471, 1, 1,
0.4561163, 0.261551, 2.14004, 0, 0.003921569, 1, 1,
0.4644999, 0.3544132, 1.151165, 0.003921569, 0, 1, 1,
0.4646527, -0.1176866, 0.4879553, 0.007843138, 0, 1, 1,
0.4648859, 0.2775765, 1.945237, 0.01568628, 0, 1, 1,
0.4650136, 1.422177, 0.1244368, 0.01960784, 0, 1, 1,
0.465723, -0.9735445, 4.1077, 0.02745098, 0, 1, 1,
0.465818, 0.3570144, -0.9901214, 0.03137255, 0, 1, 1,
0.4673056, -0.4185737, 3.522259, 0.03921569, 0, 1, 1,
0.4673193, -0.02871936, 2.731266, 0.04313726, 0, 1, 1,
0.4840107, -1.291825, 1.625709, 0.05098039, 0, 1, 1,
0.4842264, -1.464388, 2.679902, 0.05490196, 0, 1, 1,
0.4932256, -0.1979605, 0.876172, 0.0627451, 0, 1, 1,
0.4934124, -0.8834463, 2.38879, 0.06666667, 0, 1, 1,
0.4947909, -0.8515363, 3.08248, 0.07450981, 0, 1, 1,
0.4966778, -0.4031861, 0.9177112, 0.07843138, 0, 1, 1,
0.5012752, 0.0850498, 1.403886, 0.08627451, 0, 1, 1,
0.5031436, 1.5725, -0.8390091, 0.09019608, 0, 1, 1,
0.5031616, -0.5765983, 1.778304, 0.09803922, 0, 1, 1,
0.5067738, -0.7224634, 1.062564, 0.1058824, 0, 1, 1,
0.508409, -0.8680009, 1.314335, 0.1098039, 0, 1, 1,
0.5090331, -0.2910231, 0.7790883, 0.1176471, 0, 1, 1,
0.5156611, 0.6744201, 2.196984, 0.1215686, 0, 1, 1,
0.5162808, -0.4841693, 3.688291, 0.1294118, 0, 1, 1,
0.5204646, -1.207466, 3.534194, 0.1333333, 0, 1, 1,
0.5235397, 2.207841, -0.9002301, 0.1411765, 0, 1, 1,
0.5261868, -0.6098478, 2.297355, 0.145098, 0, 1, 1,
0.5350519, 0.1744484, 2.907196, 0.1529412, 0, 1, 1,
0.5392654, 1.929194, 0.09358122, 0.1568628, 0, 1, 1,
0.5413081, 0.253306, 1.681523, 0.1647059, 0, 1, 1,
0.543667, 0.6342083, 1.935786, 0.1686275, 0, 1, 1,
0.5459272, -0.7741783, 4.335048, 0.1764706, 0, 1, 1,
0.5481588, 1.794585, 2.037413, 0.1803922, 0, 1, 1,
0.5496667, 0.06382348, 1.743096, 0.1882353, 0, 1, 1,
0.5505816, -0.2177792, 2.021847, 0.1921569, 0, 1, 1,
0.5536461, 0.9829658, 0.6921191, 0.2, 0, 1, 1,
0.554119, 0.2581117, 0.4919791, 0.2078431, 0, 1, 1,
0.5554535, 0.6454839, 0.2898615, 0.2117647, 0, 1, 1,
0.5590988, 0.4518397, 0.3538564, 0.2196078, 0, 1, 1,
0.5600194, -0.4208018, 0.9803076, 0.2235294, 0, 1, 1,
0.5616404, -0.5789195, 2.616964, 0.2313726, 0, 1, 1,
0.5636325, 1.554277, 0.6744963, 0.2352941, 0, 1, 1,
0.5772553, -0.7951856, 3.917087, 0.2431373, 0, 1, 1,
0.5789381, -0.1347616, 4.083952, 0.2470588, 0, 1, 1,
0.582084, -0.4682403, 4.005774, 0.254902, 0, 1, 1,
0.5826135, -0.05507388, 2.313595, 0.2588235, 0, 1, 1,
0.5909722, -0.4093705, 1.17788, 0.2666667, 0, 1, 1,
0.5913376, -0.2632547, 2.778579, 0.2705882, 0, 1, 1,
0.5915124, 0.4416615, 2.464931, 0.2784314, 0, 1, 1,
0.595611, -0.0222384, 0.6991262, 0.282353, 0, 1, 1,
0.6027734, 0.2417307, -0.0007466358, 0.2901961, 0, 1, 1,
0.6030903, 0.3167256, 1.266243, 0.2941177, 0, 1, 1,
0.6051545, -0.2589044, 2.050624, 0.3019608, 0, 1, 1,
0.6059399, 1.00165, 0.2574538, 0.3098039, 0, 1, 1,
0.6260325, -0.4301212, 1.968977, 0.3137255, 0, 1, 1,
0.6296583, 0.003304174, 2.943907, 0.3215686, 0, 1, 1,
0.6314533, -0.07599368, -0.3066303, 0.3254902, 0, 1, 1,
0.6326983, 2.285651, 0.9946903, 0.3333333, 0, 1, 1,
0.6340817, 0.2091904, 1.110428, 0.3372549, 0, 1, 1,
0.6369045, -1.108293, 1.673926, 0.345098, 0, 1, 1,
0.6445881, 2.258917, -0.1551479, 0.3490196, 0, 1, 1,
0.6457413, -1.123551, 1.915124, 0.3568628, 0, 1, 1,
0.6483603, -2.01597, 4.268664, 0.3607843, 0, 1, 1,
0.6491489, 0.09079558, 1.169531, 0.3686275, 0, 1, 1,
0.6498629, 0.1696014, -0.1728711, 0.372549, 0, 1, 1,
0.6521513, 0.3901576, 1.66976, 0.3803922, 0, 1, 1,
0.6529916, 0.5638101, 0.7209871, 0.3843137, 0, 1, 1,
0.658178, 1.315684, 1.420867, 0.3921569, 0, 1, 1,
0.658886, -0.9844238, 3.530791, 0.3960784, 0, 1, 1,
0.6673002, 0.08759233, 0.008890493, 0.4039216, 0, 1, 1,
0.671878, 1.28879, 0.4291808, 0.4117647, 0, 1, 1,
0.6764303, 2.445793, 1.24541, 0.4156863, 0, 1, 1,
0.6777417, 0.7953609, 0.8089341, 0.4235294, 0, 1, 1,
0.6828277, -0.04708182, 0.5592803, 0.427451, 0, 1, 1,
0.6844545, 1.545163, -0.467976, 0.4352941, 0, 1, 1,
0.6852617, 0.1080403, 2.396663, 0.4392157, 0, 1, 1,
0.6885644, -0.1327321, 0.6139274, 0.4470588, 0, 1, 1,
0.7000577, 0.3860448, 1.076216, 0.4509804, 0, 1, 1,
0.7031422, 0.3445564, -0.3898263, 0.4588235, 0, 1, 1,
0.7051849, 1.535966, 0.3926378, 0.4627451, 0, 1, 1,
0.7160655, 0.2637528, 0.2788552, 0.4705882, 0, 1, 1,
0.7235163, 0.6003229, 1.740307, 0.4745098, 0, 1, 1,
0.7322093, 1.147202, 1.299086, 0.4823529, 0, 1, 1,
0.7381912, -0.01107611, 1.563556, 0.4862745, 0, 1, 1,
0.7552527, 0.3327256, 0.270425, 0.4941176, 0, 1, 1,
0.7553397, 0.1038305, 3.269584, 0.5019608, 0, 1, 1,
0.7556342, -1.274646, 1.549435, 0.5058824, 0, 1, 1,
0.7581691, -1.472599, 2.151002, 0.5137255, 0, 1, 1,
0.7616661, -1.094448, 2.703309, 0.5176471, 0, 1, 1,
0.7643126, -0.5144465, 3.807664, 0.5254902, 0, 1, 1,
0.7724648, -0.7574229, 2.396972, 0.5294118, 0, 1, 1,
0.7734013, 0.4293518, 1.467307, 0.5372549, 0, 1, 1,
0.7744132, -0.9284095, 3.418579, 0.5411765, 0, 1, 1,
0.7747824, 0.00593532, 1.557559, 0.5490196, 0, 1, 1,
0.775837, 0.1751556, 0.2711119, 0.5529412, 0, 1, 1,
0.7889091, -1.20992, 2.318719, 0.5607843, 0, 1, 1,
0.7899711, 0.6486923, -0.1809505, 0.5647059, 0, 1, 1,
0.7931712, -0.4140536, 2.906438, 0.572549, 0, 1, 1,
0.7953607, -1.733588, 3.636411, 0.5764706, 0, 1, 1,
0.8083504, -0.6316808, 4.294009, 0.5843138, 0, 1, 1,
0.8095556, -0.002302641, 1.175005, 0.5882353, 0, 1, 1,
0.8108085, 2.220497, 0.9466634, 0.5960785, 0, 1, 1,
0.8120465, 1.994607, 1.999039, 0.6039216, 0, 1, 1,
0.8124622, -0.2995853, 3.926082, 0.6078432, 0, 1, 1,
0.8165372, 1.485627, 0.1186003, 0.6156863, 0, 1, 1,
0.8167065, 0.9656574, -0.2921405, 0.6196079, 0, 1, 1,
0.8199852, 0.566974, 0.7636614, 0.627451, 0, 1, 1,
0.8253252, -0.7188351, 2.595631, 0.6313726, 0, 1, 1,
0.8279763, 0.523128, 0.4498406, 0.6392157, 0, 1, 1,
0.8382025, -0.8831272, 3.159144, 0.6431373, 0, 1, 1,
0.8415018, -0.4833792, 1.151272, 0.6509804, 0, 1, 1,
0.8463972, -0.5213167, 1.39088, 0.654902, 0, 1, 1,
0.8475689, 1.558106, 1.723103, 0.6627451, 0, 1, 1,
0.8495311, 0.3446648, 0.6102049, 0.6666667, 0, 1, 1,
0.8530931, 1.3856, 0.05077045, 0.6745098, 0, 1, 1,
0.8546387, 0.7662616, 0.439017, 0.6784314, 0, 1, 1,
0.8556952, -0.09046698, 3.570512, 0.6862745, 0, 1, 1,
0.8628815, -1.254309, 2.72113, 0.6901961, 0, 1, 1,
0.8629514, -0.5099915, 1.098138, 0.6980392, 0, 1, 1,
0.8645521, 0.6031262, 1.693958, 0.7058824, 0, 1, 1,
0.8693029, -0.7451777, 1.967484, 0.7098039, 0, 1, 1,
0.8712773, 1.634439, -1.140758, 0.7176471, 0, 1, 1,
0.8718122, -0.04799604, 3.372763, 0.7215686, 0, 1, 1,
0.8746378, 0.897005, 0.591217, 0.7294118, 0, 1, 1,
0.877528, 0.3100833, -0.2112681, 0.7333333, 0, 1, 1,
0.8782491, -0.2003125, 2.874518, 0.7411765, 0, 1, 1,
0.8785382, -0.5709174, 2.171279, 0.7450981, 0, 1, 1,
0.8792079, -0.4384769, 1.10124, 0.7529412, 0, 1, 1,
0.882812, -0.4894988, 1.247645, 0.7568628, 0, 1, 1,
0.8894863, 0.01919846, 0.9955207, 0.7647059, 0, 1, 1,
0.8916997, 0.8384727, 1.975061, 0.7686275, 0, 1, 1,
0.8951093, -0.2904672, 1.536376, 0.7764706, 0, 1, 1,
0.8954099, 0.8413721, 2.106894, 0.7803922, 0, 1, 1,
0.9008081, 0.2818718, 0.753256, 0.7882353, 0, 1, 1,
0.9018884, -0.4921495, 2.684815, 0.7921569, 0, 1, 1,
0.9033055, 1.767087, 1.726194, 0.8, 0, 1, 1,
0.9042153, 0.5181355, 1.483286, 0.8078431, 0, 1, 1,
0.9279068, -0.5238478, 3.068765, 0.8117647, 0, 1, 1,
0.932236, 1.336308, 0.7553491, 0.8196079, 0, 1, 1,
0.932362, -0.7072588, 3.071349, 0.8235294, 0, 1, 1,
0.9342623, -1.493369, 3.764008, 0.8313726, 0, 1, 1,
0.9469323, 0.4080497, 0.9452698, 0.8352941, 0, 1, 1,
0.9484844, -1.999393, 2.595258, 0.8431373, 0, 1, 1,
0.9551626, 0.8732427, 0.3279747, 0.8470588, 0, 1, 1,
0.9564855, 1.915996, -1.730998, 0.854902, 0, 1, 1,
0.9601465, 0.6381508, 0.1690241, 0.8588235, 0, 1, 1,
0.9634108, 1.025704, -0.2081427, 0.8666667, 0, 1, 1,
0.9654514, -0.07860477, 1.283143, 0.8705882, 0, 1, 1,
0.9677163, -0.09481101, 2.480254, 0.8784314, 0, 1, 1,
0.9681206, 0.2716939, 0.6167577, 0.8823529, 0, 1, 1,
0.970513, -1.848124, 1.752567, 0.8901961, 0, 1, 1,
0.9720515, -0.07147621, 2.443893, 0.8941177, 0, 1, 1,
0.9721133, 1.45558, 1.304958, 0.9019608, 0, 1, 1,
0.9759822, -0.4957664, 1.075101, 0.9098039, 0, 1, 1,
0.9789714, -1.080216, 1.383639, 0.9137255, 0, 1, 1,
0.9823472, 0.3985481, 1.040233, 0.9215686, 0, 1, 1,
0.9870995, 0.07564265, 2.297942, 0.9254902, 0, 1, 1,
0.9876917, -0.09964754, 0.3551341, 0.9333333, 0, 1, 1,
0.9880326, -0.1216204, 0.3839115, 0.9372549, 0, 1, 1,
0.9880824, 1.083589, 2.600452, 0.945098, 0, 1, 1,
0.9881772, -1.274305, 1.501502, 0.9490196, 0, 1, 1,
0.9909511, 0.3227797, 0.5809968, 0.9568627, 0, 1, 1,
0.9948962, 1.405778, 1.226741, 0.9607843, 0, 1, 1,
0.9962167, -0.3525957, 0.002344074, 0.9686275, 0, 1, 1,
1.003277, 0.03045928, -0.3973477, 0.972549, 0, 1, 1,
1.011353, -0.7337137, 3.280185, 0.9803922, 0, 1, 1,
1.018145, 0.5665736, -0.01433345, 0.9843137, 0, 1, 1,
1.022742, -1.197528, 2.234628, 0.9921569, 0, 1, 1,
1.024932, -0.3751557, 1.123297, 0.9960784, 0, 1, 1,
1.025947, -0.8544726, 3.659192, 1, 0, 0.9960784, 1,
1.039714, 1.382641, 0.8632365, 1, 0, 0.9882353, 1,
1.040799, -0.5986921, 2.013856, 1, 0, 0.9843137, 1,
1.041528, 0.289091, 3.443576, 1, 0, 0.9764706, 1,
1.045959, 0.3065427, 1.358747, 1, 0, 0.972549, 1,
1.04728, -0.6795212, 2.561588, 1, 0, 0.9647059, 1,
1.051788, -1.211698, 1.716972, 1, 0, 0.9607843, 1,
1.053715, -1.428338, 1.914693, 1, 0, 0.9529412, 1,
1.05611, 1.056533, 1.812796, 1, 0, 0.9490196, 1,
1.063, 0.7275195, 2.542458, 1, 0, 0.9411765, 1,
1.063962, 0.03955097, 0.8035925, 1, 0, 0.9372549, 1,
1.069931, 1.146102, 0.2408817, 1, 0, 0.9294118, 1,
1.072436, 1.394458, 0.03528154, 1, 0, 0.9254902, 1,
1.072517, -0.7003285, 1.749171, 1, 0, 0.9176471, 1,
1.074566, -0.5816827, 2.224452, 1, 0, 0.9137255, 1,
1.091344, -1.439737, 1.605447, 1, 0, 0.9058824, 1,
1.096169, -0.3749106, 3.209707, 1, 0, 0.9019608, 1,
1.104539, -1.452904, 1.269908, 1, 0, 0.8941177, 1,
1.112351, -2.097519, 2.564004, 1, 0, 0.8862745, 1,
1.119484, 0.6858866, 1.248005, 1, 0, 0.8823529, 1,
1.124552, -0.6401784, 1.844028, 1, 0, 0.8745098, 1,
1.135182, -2.139803, 2.023816, 1, 0, 0.8705882, 1,
1.13763, -1.712301, 2.529895, 1, 0, 0.8627451, 1,
1.145231, 0.550324, 1.393077, 1, 0, 0.8588235, 1,
1.146616, 0.5090092, 1.239102, 1, 0, 0.8509804, 1,
1.14664, -0.2770401, 1.179275, 1, 0, 0.8470588, 1,
1.152791, 2.442664, -0.37228, 1, 0, 0.8392157, 1,
1.158691, -0.6371648, 0.6840922, 1, 0, 0.8352941, 1,
1.160726, 0.2469689, -0.1352085, 1, 0, 0.827451, 1,
1.161136, -1.209226, 3.448595, 1, 0, 0.8235294, 1,
1.167251, -0.1174697, 2.033064, 1, 0, 0.8156863, 1,
1.180405, -0.2550403, 1.901411, 1, 0, 0.8117647, 1,
1.185767, 0.2768806, 0.2017422, 1, 0, 0.8039216, 1,
1.186613, 0.111056, 3.827669, 1, 0, 0.7960784, 1,
1.18684, -0.2699625, 2.479725, 1, 0, 0.7921569, 1,
1.188511, 1.277225, -0.1055909, 1, 0, 0.7843137, 1,
1.192895, 0.006364468, 3.303809, 1, 0, 0.7803922, 1,
1.198295, 0.5505847, 0.3323164, 1, 0, 0.772549, 1,
1.211636, -1.689013, 2.690341, 1, 0, 0.7686275, 1,
1.229865, 0.03315449, 0.9581851, 1, 0, 0.7607843, 1,
1.230388, -0.4460314, 1.766217, 1, 0, 0.7568628, 1,
1.240517, 0.3674189, 0.829657, 1, 0, 0.7490196, 1,
1.245054, -1.7534, 2.415955, 1, 0, 0.7450981, 1,
1.257385, 0.3892519, 0.7033961, 1, 0, 0.7372549, 1,
1.261841, 1.340847, 0.8492716, 1, 0, 0.7333333, 1,
1.2622, -1.116913, 2.385633, 1, 0, 0.7254902, 1,
1.264783, 0.6007059, 0.3464483, 1, 0, 0.7215686, 1,
1.265647, -0.6312853, 0.450235, 1, 0, 0.7137255, 1,
1.265993, -0.6058127, 2.204981, 1, 0, 0.7098039, 1,
1.275801, 1.277063, 1.306828, 1, 0, 0.7019608, 1,
1.277642, -1.232761, 2.615477, 1, 0, 0.6941177, 1,
1.279792, -0.8526406, 2.679487, 1, 0, 0.6901961, 1,
1.287481, -0.5937954, 2.053186, 1, 0, 0.682353, 1,
1.288569, -0.3160097, 3.099944, 1, 0, 0.6784314, 1,
1.294968, 1.102953, 1.218715, 1, 0, 0.6705883, 1,
1.297843, 0.6018389, 0.1158594, 1, 0, 0.6666667, 1,
1.301158, -0.7702379, 1.883928, 1, 0, 0.6588235, 1,
1.302495, 0.3300375, 1.055944, 1, 0, 0.654902, 1,
1.303904, -0.7126852, 1.616428, 1, 0, 0.6470588, 1,
1.306441, -0.1394899, 1.823293, 1, 0, 0.6431373, 1,
1.315656, 0.6176603, 1.12065, 1, 0, 0.6352941, 1,
1.318708, -0.3273374, 2.263546, 1, 0, 0.6313726, 1,
1.322486, -0.2095464, 2.782579, 1, 0, 0.6235294, 1,
1.334359, 0.9939374, 0.1742595, 1, 0, 0.6196079, 1,
1.334403, -0.498989, 2.0146, 1, 0, 0.6117647, 1,
1.343531, -0.08969811, 2.215897, 1, 0, 0.6078432, 1,
1.344533, -0.6526219, 0.6354197, 1, 0, 0.6, 1,
1.354258, -0.8334671, 3.410002, 1, 0, 0.5921569, 1,
1.354985, -0.9148979, 2.703859, 1, 0, 0.5882353, 1,
1.357769, -1.476559, 2.241698, 1, 0, 0.5803922, 1,
1.370427, -0.3347802, 1.576075, 1, 0, 0.5764706, 1,
1.373132, -1.456845, 3.292733, 1, 0, 0.5686275, 1,
1.377302, 1.315102, 0.8030031, 1, 0, 0.5647059, 1,
1.379943, 2.01136, 1.175377, 1, 0, 0.5568628, 1,
1.385301, 0.8274413, 1.75308, 1, 0, 0.5529412, 1,
1.397612, -1.585265, 2.396595, 1, 0, 0.5450981, 1,
1.404221, -0.1267743, 1.938165, 1, 0, 0.5411765, 1,
1.406346, 0.7976998, 1.16446, 1, 0, 0.5333334, 1,
1.417809, -1.551201, 2.239955, 1, 0, 0.5294118, 1,
1.421209, -0.08948757, 1.487359, 1, 0, 0.5215687, 1,
1.435343, -1.572359, 2.87062, 1, 0, 0.5176471, 1,
1.444983, 2.510145, 0.2890333, 1, 0, 0.509804, 1,
1.459472, -0.09217408, 0.6512839, 1, 0, 0.5058824, 1,
1.480083, -0.4156669, 0.3712133, 1, 0, 0.4980392, 1,
1.493859, 0.04007043, 1.939375, 1, 0, 0.4901961, 1,
1.494075, 0.9182642, -0.9650509, 1, 0, 0.4862745, 1,
1.496891, -1.929454, 1.269124, 1, 0, 0.4784314, 1,
1.499813, -0.9358802, 2.115526, 1, 0, 0.4745098, 1,
1.520831, -1.835603, 3.124632, 1, 0, 0.4666667, 1,
1.522322, -0.6823786, 2.339078, 1, 0, 0.4627451, 1,
1.53384, 0.6962339, 2.319139, 1, 0, 0.454902, 1,
1.535149, 0.5361229, 1.799507, 1, 0, 0.4509804, 1,
1.544862, 1.931615, 1.093021, 1, 0, 0.4431373, 1,
1.545277, 0.4931054, 1.377124, 1, 0, 0.4392157, 1,
1.54993, -0.09539902, 0.8901899, 1, 0, 0.4313726, 1,
1.553529, -1.057712, 0.7561353, 1, 0, 0.427451, 1,
1.558457, 1.367493, -0.08845947, 1, 0, 0.4196078, 1,
1.570112, 2.21, 1.042176, 1, 0, 0.4156863, 1,
1.570941, -1.66934, 3.043289, 1, 0, 0.4078431, 1,
1.577552, -0.8708977, 1.920707, 1, 0, 0.4039216, 1,
1.585208, 0.450383, 2.029484, 1, 0, 0.3960784, 1,
1.593619, -1.521213, 2.36722, 1, 0, 0.3882353, 1,
1.596011, -1.632276, 2.436485, 1, 0, 0.3843137, 1,
1.599975, 1.012799, 0.6786574, 1, 0, 0.3764706, 1,
1.623225, -0.2500957, 2.480163, 1, 0, 0.372549, 1,
1.633955, 0.3270099, 0.5240726, 1, 0, 0.3647059, 1,
1.64801, 0.5742247, 1.169846, 1, 0, 0.3607843, 1,
1.65486, 1.206549, 0.6671026, 1, 0, 0.3529412, 1,
1.655124, 0.2875205, 0.2798223, 1, 0, 0.3490196, 1,
1.655982, -0.36575, 1.33858, 1, 0, 0.3411765, 1,
1.663661, -0.5461079, 0.8588682, 1, 0, 0.3372549, 1,
1.675153, -0.9286786, 3.019916, 1, 0, 0.3294118, 1,
1.69105, 1.320694, 0.6626445, 1, 0, 0.3254902, 1,
1.692748, -1.55983, 3.629186, 1, 0, 0.3176471, 1,
1.706273, 0.234277, 2.221975, 1, 0, 0.3137255, 1,
1.742718, -0.7651806, 1.693047, 1, 0, 0.3058824, 1,
1.74443, 1.355778, 1.007513, 1, 0, 0.2980392, 1,
1.745259, 0.7520565, 0.4320375, 1, 0, 0.2941177, 1,
1.747232, 0.8255146, 0.5506333, 1, 0, 0.2862745, 1,
1.784084, 0.9806337, 1.265835, 1, 0, 0.282353, 1,
1.786179, 0.7248356, 2.449762, 1, 0, 0.2745098, 1,
1.791384, -0.6564884, 2.465514, 1, 0, 0.2705882, 1,
1.805275, -0.6641558, 1.530795, 1, 0, 0.2627451, 1,
1.847461, 1.241566, -0.40732, 1, 0, 0.2588235, 1,
1.853586, 1.065152, 1.674864, 1, 0, 0.2509804, 1,
1.861187, 0.05839463, 0.7839115, 1, 0, 0.2470588, 1,
1.86163, 1.005372, -0.195207, 1, 0, 0.2392157, 1,
1.864583, 0.578817, 2.010715, 1, 0, 0.2352941, 1,
1.878604, -1.222205, 2.218347, 1, 0, 0.227451, 1,
1.898167, 0.4685895, 0.05934083, 1, 0, 0.2235294, 1,
1.90229, 0.9164867, -0.02102879, 1, 0, 0.2156863, 1,
1.948995, -2.024445, 4.074736, 1, 0, 0.2117647, 1,
1.95707, -1.645965, 1.399953, 1, 0, 0.2039216, 1,
1.967783, 0.4684997, 1.299791, 1, 0, 0.1960784, 1,
1.998077, 0.9274033, 0.934094, 1, 0, 0.1921569, 1,
2.016179, -0.08385866, 0.9145685, 1, 0, 0.1843137, 1,
2.023011, -0.4832762, 1.657718, 1, 0, 0.1803922, 1,
2.035362, -1.80672, 0.9528027, 1, 0, 0.172549, 1,
2.039594, -0.1999278, 4.835136, 1, 0, 0.1686275, 1,
2.060536, -0.3844656, 2.404135, 1, 0, 0.1607843, 1,
2.061624, 0.521045, 1.615044, 1, 0, 0.1568628, 1,
2.069082, 0.7856527, 0.181482, 1, 0, 0.1490196, 1,
2.077011, 0.4904356, 1.584903, 1, 0, 0.145098, 1,
2.08044, 1.350355, -2.079368, 1, 0, 0.1372549, 1,
2.091965, -0.5793357, -0.03584224, 1, 0, 0.1333333, 1,
2.097108, -1.435098, 3.583159, 1, 0, 0.1254902, 1,
2.155507, -1.482992, 1.043976, 1, 0, 0.1215686, 1,
2.185395, -2.205303, 2.150813, 1, 0, 0.1137255, 1,
2.243189, 0.5123609, 1.416397, 1, 0, 0.1098039, 1,
2.299675, 0.04980753, 1.722028, 1, 0, 0.1019608, 1,
2.318823, 0.3332126, -1.508671, 1, 0, 0.09411765, 1,
2.324065, 0.312299, 2.04889, 1, 0, 0.09019608, 1,
2.377894, -0.8701428, 1.177724, 1, 0, 0.08235294, 1,
2.380998, -2.006721, 1.973137, 1, 0, 0.07843138, 1,
2.467408, 0.7753929, 2.114403, 1, 0, 0.07058824, 1,
2.536884, 0.8652005, 1.316652, 1, 0, 0.06666667, 1,
2.61755, -1.271623, 2.286543, 1, 0, 0.05882353, 1,
2.671371, -1.135683, 2.041612, 1, 0, 0.05490196, 1,
2.67157, 0.01307504, 0.03970071, 1, 0, 0.04705882, 1,
2.708337, 2.007546, 0.1234208, 1, 0, 0.04313726, 1,
2.825164, -0.8372192, 2.31546, 1, 0, 0.03529412, 1,
2.883502, -0.1054748, 0.3272632, 1, 0, 0.03137255, 1,
2.935188, 0.6343831, 1.722768, 1, 0, 0.02352941, 1,
2.947902, 0.5372185, 0.8782197, 1, 0, 0.01960784, 1,
2.962278, 1.161813, -0.1399053, 1, 0, 0.01176471, 1,
3.016764, 0.03663691, 2.669408, 1, 0, 0.007843138, 1
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
0.05519736, -3.963737, -6.250248, 0, -0.5, 0.5, 0.5,
0.05519736, -3.963737, -6.250248, 1, -0.5, 0.5, 0.5,
0.05519736, -3.963737, -6.250248, 1, 1.5, 0.5, 0.5,
0.05519736, -3.963737, -6.250248, 0, 1.5, 0.5, 0.5
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
-3.91034, -0.01872492, -6.250248, 0, -0.5, 0.5, 0.5,
-3.91034, -0.01872492, -6.250248, 1, -0.5, 0.5, 0.5,
-3.91034, -0.01872492, -6.250248, 1, 1.5, 0.5, 0.5,
-3.91034, -0.01872492, -6.250248, 0, 1.5, 0.5, 0.5
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
-3.91034, -3.963737, 0.09576702, 0, -0.5, 0.5, 0.5,
-3.91034, -3.963737, 0.09576702, 1, -0.5, 0.5, 0.5,
-3.91034, -3.963737, 0.09576702, 1, 1.5, 0.5, 0.5,
-3.91034, -3.963737, 0.09576702, 0, 1.5, 0.5, 0.5
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
-2, -3.053349, -4.785783,
3, -3.053349, -4.785783,
-2, -3.053349, -4.785783,
-2, -3.205081, -5.029861,
-1, -3.053349, -4.785783,
-1, -3.205081, -5.029861,
0, -3.053349, -4.785783,
0, -3.205081, -5.029861,
1, -3.053349, -4.785783,
1, -3.205081, -5.029861,
2, -3.053349, -4.785783,
2, -3.205081, -5.029861,
3, -3.053349, -4.785783,
3, -3.205081, -5.029861
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
-2, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
-2, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
-2, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
-2, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5,
-1, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
-1, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
-1, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
-1, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5,
0, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
0, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
0, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
0, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5,
1, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
1, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
1, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
1, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5,
2, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
2, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
2, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
2, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5,
3, -3.508543, -5.518016, 0, -0.5, 0.5, 0.5,
3, -3.508543, -5.518016, 1, -0.5, 0.5, 0.5,
3, -3.508543, -5.518016, 1, 1.5, 0.5, 0.5,
3, -3.508543, -5.518016, 0, 1.5, 0.5, 0.5
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
-2.995216, -2, -4.785783,
-2.995216, 2, -4.785783,
-2.995216, -2, -4.785783,
-3.147737, -2, -5.029861,
-2.995216, -1, -4.785783,
-3.147737, -1, -5.029861,
-2.995216, 0, -4.785783,
-3.147737, 0, -5.029861,
-2.995216, 1, -4.785783,
-3.147737, 1, -5.029861,
-2.995216, 2, -4.785783,
-3.147737, 2, -5.029861
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
-3.452778, -2, -5.518016, 0, -0.5, 0.5, 0.5,
-3.452778, -2, -5.518016, 1, -0.5, 0.5, 0.5,
-3.452778, -2, -5.518016, 1, 1.5, 0.5, 0.5,
-3.452778, -2, -5.518016, 0, 1.5, 0.5, 0.5,
-3.452778, -1, -5.518016, 0, -0.5, 0.5, 0.5,
-3.452778, -1, -5.518016, 1, -0.5, 0.5, 0.5,
-3.452778, -1, -5.518016, 1, 1.5, 0.5, 0.5,
-3.452778, -1, -5.518016, 0, 1.5, 0.5, 0.5,
-3.452778, 0, -5.518016, 0, -0.5, 0.5, 0.5,
-3.452778, 0, -5.518016, 1, -0.5, 0.5, 0.5,
-3.452778, 0, -5.518016, 1, 1.5, 0.5, 0.5,
-3.452778, 0, -5.518016, 0, 1.5, 0.5, 0.5,
-3.452778, 1, -5.518016, 0, -0.5, 0.5, 0.5,
-3.452778, 1, -5.518016, 1, -0.5, 0.5, 0.5,
-3.452778, 1, -5.518016, 1, 1.5, 0.5, 0.5,
-3.452778, 1, -5.518016, 0, 1.5, 0.5, 0.5,
-3.452778, 2, -5.518016, 0, -0.5, 0.5, 0.5,
-3.452778, 2, -5.518016, 1, -0.5, 0.5, 0.5,
-3.452778, 2, -5.518016, 1, 1.5, 0.5, 0.5,
-3.452778, 2, -5.518016, 0, 1.5, 0.5, 0.5
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
-2.995216, -3.053349, -4,
-2.995216, -3.053349, 4,
-2.995216, -3.053349, -4,
-3.147737, -3.205081, -4,
-2.995216, -3.053349, -2,
-3.147737, -3.205081, -2,
-2.995216, -3.053349, 0,
-3.147737, -3.205081, 0,
-2.995216, -3.053349, 2,
-3.147737, -3.205081, 2,
-2.995216, -3.053349, 4,
-3.147737, -3.205081, 4
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
-3.452778, -3.508543, -4, 0, -0.5, 0.5, 0.5,
-3.452778, -3.508543, -4, 1, -0.5, 0.5, 0.5,
-3.452778, -3.508543, -4, 1, 1.5, 0.5, 0.5,
-3.452778, -3.508543, -4, 0, 1.5, 0.5, 0.5,
-3.452778, -3.508543, -2, 0, -0.5, 0.5, 0.5,
-3.452778, -3.508543, -2, 1, -0.5, 0.5, 0.5,
-3.452778, -3.508543, -2, 1, 1.5, 0.5, 0.5,
-3.452778, -3.508543, -2, 0, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 0, 0, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 0, 1, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 0, 1, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 0, 0, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 2, 0, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 2, 1, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 2, 1, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 2, 0, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 4, 0, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 4, 1, -0.5, 0.5, 0.5,
-3.452778, -3.508543, 4, 1, 1.5, 0.5, 0.5,
-3.452778, -3.508543, 4, 0, 1.5, 0.5, 0.5
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
-2.995216, -3.053349, -4.785783,
-2.995216, 3.015899, -4.785783,
-2.995216, -3.053349, 4.977317,
-2.995216, 3.015899, 4.977317,
-2.995216, -3.053349, -4.785783,
-2.995216, -3.053349, 4.977317,
-2.995216, 3.015899, -4.785783,
-2.995216, 3.015899, 4.977317,
-2.995216, -3.053349, -4.785783,
3.105611, -3.053349, -4.785783,
-2.995216, -3.053349, 4.977317,
3.105611, -3.053349, 4.977317,
-2.995216, 3.015899, -4.785783,
3.105611, 3.015899, -4.785783,
-2.995216, 3.015899, 4.977317,
3.105611, 3.015899, 4.977317,
3.105611, -3.053349, -4.785783,
3.105611, 3.015899, -4.785783,
3.105611, -3.053349, 4.977317,
3.105611, 3.015899, 4.977317,
3.105611, -3.053349, -4.785783,
3.105611, -3.053349, 4.977317,
3.105611, 3.015899, -4.785783,
3.105611, 3.015899, 4.977317
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
var radius = 6.949425;
var distance = 30.91878;
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
mvMatrix.translate( -0.05519736, 0.01872492, -0.09576702 );
mvMatrix.scale( 1.231612, 1.23802, 0.7696176 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -30.91878);
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
hydrogen_cyanide_hyd<-read.table("hydrogen_cyanide_hyd.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydrogen_cyanide_hyd$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydrogen_cyanide_hyd' not found
```

```r
y<-hydrogen_cyanide_hyd$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydrogen_cyanide_hyd' not found
```

```r
z<-hydrogen_cyanide_hyd$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydrogen_cyanide_hyd' not found
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
-2.906369, -1.478913, -3.296232, 0, 0, 1, 1, 1,
-2.80067, 0.480663, -3.116016, 1, 0, 0, 1, 1,
-2.582241, 1.436178, 0.3492849, 1, 0, 0, 1, 1,
-2.532769, 1.106663, 1.103977, 1, 0, 0, 1, 1,
-2.386477, 0.6689473, -0.4679749, 1, 0, 0, 1, 1,
-2.344807, -1.328098, -3.026686, 1, 0, 0, 1, 1,
-2.337562, -1.152837, -1.295061, 0, 0, 0, 1, 1,
-2.327996, -0.3075849, -2.70548, 0, 0, 0, 1, 1,
-2.322933, -1.739605, -2.7753, 0, 0, 0, 1, 1,
-2.241425, 0.1356595, -1.799508, 0, 0, 0, 1, 1,
-2.206259, -0.2203854, -2.323456, 0, 0, 0, 1, 1,
-2.1864, 0.1929133, -1.251275, 0, 0, 0, 1, 1,
-2.173439, 0.006771572, -0.5088063, 0, 0, 0, 1, 1,
-2.166921, -0.06569817, -1.929646, 1, 1, 1, 1, 1,
-2.148613, -0.1756381, -2.810635, 1, 1, 1, 1, 1,
-2.141494, 0.9748575, -1.844638, 1, 1, 1, 1, 1,
-2.133092, 1.713702, -2.197058, 1, 1, 1, 1, 1,
-2.132809, 0.08555642, -1.771791, 1, 1, 1, 1, 1,
-2.12, -0.09110626, -2.22744, 1, 1, 1, 1, 1,
-2.03103, 0.2011334, -1.638604, 1, 1, 1, 1, 1,
-2.028006, 0.4592512, -0.9709073, 1, 1, 1, 1, 1,
-2.009739, -0.5682712, -3.09596, 1, 1, 1, 1, 1,
-1.966526, -0.2775449, -2.582753, 1, 1, 1, 1, 1,
-1.949852, 2.870075, -1.651358, 1, 1, 1, 1, 1,
-1.934831, 0.2151248, -1.230644, 1, 1, 1, 1, 1,
-1.933264, -1.978201, -2.56615, 1, 1, 1, 1, 1,
-1.92849, -0.4087897, -2.189504, 1, 1, 1, 1, 1,
-1.91951, 0.4660432, -0.7401652, 1, 1, 1, 1, 1,
-1.918661, -1.576375, -2.134064, 0, 0, 1, 1, 1,
-1.907584, 1.076669, -0.06341079, 1, 0, 0, 1, 1,
-1.884863, -0.4565844, -3.254999, 1, 0, 0, 1, 1,
-1.88233, 1.410674, -0.7681278, 1, 0, 0, 1, 1,
-1.86693, 0.1710397, -1.58848, 1, 0, 0, 1, 1,
-1.851777, -0.2640091, -1.655005, 1, 0, 0, 1, 1,
-1.839767, -0.5414196, -3.054135, 0, 0, 0, 1, 1,
-1.838083, 0.6281417, -2.420273, 0, 0, 0, 1, 1,
-1.833924, -0.200436, -1.607088, 0, 0, 0, 1, 1,
-1.83045, 2.32046, 0.08357858, 0, 0, 0, 1, 1,
-1.813762, 0.06074132, -1.133874, 0, 0, 0, 1, 1,
-1.802069, -1.936109, -2.559301, 0, 0, 0, 1, 1,
-1.795501, 1.459893, -1.277611, 0, 0, 0, 1, 1,
-1.783926, 0.9716396, 0.03957121, 1, 1, 1, 1, 1,
-1.7784, 0.278857, -1.017904, 1, 1, 1, 1, 1,
-1.758969, 1.30866, 0.4209274, 1, 1, 1, 1, 1,
-1.748995, -1.770728, -2.010538, 1, 1, 1, 1, 1,
-1.727782, -1.250457, -1.908512, 1, 1, 1, 1, 1,
-1.715024, -1.052933, -3.341132, 1, 1, 1, 1, 1,
-1.713876, -2.085704, -2.745952, 1, 1, 1, 1, 1,
-1.705594, 0.9277444, -1.441862, 1, 1, 1, 1, 1,
-1.700148, -1.714113, 0.4762469, 1, 1, 1, 1, 1,
-1.695252, 0.636035, -0.8389859, 1, 1, 1, 1, 1,
-1.686753, 0.1403091, -1.988345, 1, 1, 1, 1, 1,
-1.685294, 0.6728989, 0.2044358, 1, 1, 1, 1, 1,
-1.677397, -1.202628, -0.8971065, 1, 1, 1, 1, 1,
-1.673408, -1.950349, -1.498266, 1, 1, 1, 1, 1,
-1.61494, 0.2785249, -1.815678, 1, 1, 1, 1, 1,
-1.614376, -0.04973732, -1.786103, 0, 0, 1, 1, 1,
-1.580522, 0.6804897, -2.353408, 1, 0, 0, 1, 1,
-1.575712, -0.9226294, -2.04647, 1, 0, 0, 1, 1,
-1.563674, -0.5982524, -1.628574, 1, 0, 0, 1, 1,
-1.551107, 2.092235, 0.6516786, 1, 0, 0, 1, 1,
-1.546286, -0.5064665, -3.353468, 1, 0, 0, 1, 1,
-1.524768, 0.6210076, 0.1936421, 0, 0, 0, 1, 1,
-1.522307, 0.3773675, -1.889451, 0, 0, 0, 1, 1,
-1.492442, 2.38574, -0.03472305, 0, 0, 0, 1, 1,
-1.492126, -0.7843262, -1.149593, 0, 0, 0, 1, 1,
-1.485265, 0.9841499, -1.024722, 0, 0, 0, 1, 1,
-1.476312, -0.8630479, -1.569205, 0, 0, 0, 1, 1,
-1.475743, -2.019065, -2.318554, 0, 0, 0, 1, 1,
-1.474279, 0.1659811, 0.2013241, 1, 1, 1, 1, 1,
-1.464733, -1.591973, -2.036976, 1, 1, 1, 1, 1,
-1.456703, -1.059339, -1.939631, 1, 1, 1, 1, 1,
-1.45538, 0.8796698, 0.08169973, 1, 1, 1, 1, 1,
-1.446213, 1.170695, -0.6741832, 1, 1, 1, 1, 1,
-1.445578, -0.3555021, -0.9337388, 1, 1, 1, 1, 1,
-1.43267, 0.8986203, -0.6661252, 1, 1, 1, 1, 1,
-1.416278, 0.2814185, -2.046787, 1, 1, 1, 1, 1,
-1.415641, -0.1460163, -1.94132, 1, 1, 1, 1, 1,
-1.41252, -0.1873321, -1.389111, 1, 1, 1, 1, 1,
-1.411354, 0.3438978, 0.5968344, 1, 1, 1, 1, 1,
-1.407778, -1.801104, -0.955694, 1, 1, 1, 1, 1,
-1.40437, 1.42048, 0.2209323, 1, 1, 1, 1, 1,
-1.395384, 0.7820483, -1.764085, 1, 1, 1, 1, 1,
-1.386305, -0.5631418, -3.558625, 1, 1, 1, 1, 1,
-1.384128, 1.228093, -1.830451, 0, 0, 1, 1, 1,
-1.382687, 1.051435, -0.8466694, 1, 0, 0, 1, 1,
-1.377897, 0.1059091, -0.5821694, 1, 0, 0, 1, 1,
-1.370831, -0.2469309, -2.005247, 1, 0, 0, 1, 1,
-1.369796, -0.5322887, -1.234173, 1, 0, 0, 1, 1,
-1.347824, 0.8748226, 0.1032321, 1, 0, 0, 1, 1,
-1.344771, 0.3633442, -1.561118, 0, 0, 0, 1, 1,
-1.344733, -0.3577558, -1.670751, 0, 0, 0, 1, 1,
-1.337579, -0.05305509, -2.104046, 0, 0, 0, 1, 1,
-1.337577, 0.4376398, -0.9931482, 0, 0, 0, 1, 1,
-1.3358, -1.831272, -2.343084, 0, 0, 0, 1, 1,
-1.332523, 0.5403761, -0.7126655, 0, 0, 0, 1, 1,
-1.327668, -2.053758, -2.552418, 0, 0, 0, 1, 1,
-1.315315, 1.550989, 1.178476, 1, 1, 1, 1, 1,
-1.311901, 0.6304771, -2.77377, 1, 1, 1, 1, 1,
-1.309001, 0.6843846, -0.7267839, 1, 1, 1, 1, 1,
-1.29439, -0.5157474, -1.694622, 1, 1, 1, 1, 1,
-1.29005, -0.02521921, -1.331749, 1, 1, 1, 1, 1,
-1.28657, 0.2819954, -2.718057, 1, 1, 1, 1, 1,
-1.286264, -1.059844, -3.455353, 1, 1, 1, 1, 1,
-1.282995, 0.5314545, -2.696376, 1, 1, 1, 1, 1,
-1.281148, 0.5360325, -1.150512, 1, 1, 1, 1, 1,
-1.272695, 0.636125, -3.239166, 1, 1, 1, 1, 1,
-1.261004, -0.3143472, -2.816116, 1, 1, 1, 1, 1,
-1.260607, 1.046455, -0.8619079, 1, 1, 1, 1, 1,
-1.256995, 0.7322081, -0.7213163, 1, 1, 1, 1, 1,
-1.25645, 2.157786, -0.06537289, 1, 1, 1, 1, 1,
-1.25569, 1.091446, -1.085661, 1, 1, 1, 1, 1,
-1.244877, 1.277166, -1.898836, 0, 0, 1, 1, 1,
-1.237988, 0.7098403, -1.527147, 1, 0, 0, 1, 1,
-1.236912, -1.343976, -1.199689, 1, 0, 0, 1, 1,
-1.236681, 0.910424, -1.152107, 1, 0, 0, 1, 1,
-1.222975, -1.50772, -3.778841, 1, 0, 0, 1, 1,
-1.217893, -0.3866594, -1.554779, 1, 0, 0, 1, 1,
-1.215126, 0.5899169, -1.766968, 0, 0, 0, 1, 1,
-1.210489, 0.1661076, -2.360788, 0, 0, 0, 1, 1,
-1.202134, -0.03462419, -1.3483, 0, 0, 0, 1, 1,
-1.200008, 0.6763586, -0.2289332, 0, 0, 0, 1, 1,
-1.197345, 0.05034023, -2.274457, 0, 0, 0, 1, 1,
-1.188004, -1.459177, -3.218705, 0, 0, 0, 1, 1,
-1.18764, 0.440142, -2.487953, 0, 0, 0, 1, 1,
-1.187284, 0.9153256, -0.4893368, 1, 1, 1, 1, 1,
-1.18607, -0.08527805, -0.955775, 1, 1, 1, 1, 1,
-1.182538, -0.5564185, -1.902072, 1, 1, 1, 1, 1,
-1.162935, -0.1194459, -2.447008, 1, 1, 1, 1, 1,
-1.162297, -0.524408, 0.1122638, 1, 1, 1, 1, 1,
-1.162145, -0.4920416, -1.738473, 1, 1, 1, 1, 1,
-1.16013, -0.6681675, -1.834821, 1, 1, 1, 1, 1,
-1.147929, 1.637472, -3.295626, 1, 1, 1, 1, 1,
-1.140855, 2.36201, 0.931926, 1, 1, 1, 1, 1,
-1.138362, 0.02747579, -0.4255247, 1, 1, 1, 1, 1,
-1.136655, 0.1171695, -2.686494, 1, 1, 1, 1, 1,
-1.135736, -1.384385, -3.328532, 1, 1, 1, 1, 1,
-1.128736, -1.7741, -2.394933, 1, 1, 1, 1, 1,
-1.126407, -0.2292362, -4.152668, 1, 1, 1, 1, 1,
-1.125688, -0.5808421, -3.086808, 1, 1, 1, 1, 1,
-1.12439, -0.2569242, -1.749956, 0, 0, 1, 1, 1,
-1.122134, 0.7045077, 0.375471, 1, 0, 0, 1, 1,
-1.117682, 0.2542403, -1.954513, 1, 0, 0, 1, 1,
-1.116539, -0.00410432, -1.822055, 1, 0, 0, 1, 1,
-1.115114, -1.117421, -2.422166, 1, 0, 0, 1, 1,
-1.111868, -0.7329039, -2.847908, 1, 0, 0, 1, 1,
-1.089659, 0.09260817, -1.218306, 0, 0, 0, 1, 1,
-1.08791, -0.7960808, -2.860123, 0, 0, 0, 1, 1,
-1.080108, -1.92356, -1.730071, 0, 0, 0, 1, 1,
-1.076351, -1.128822, -1.842947, 0, 0, 0, 1, 1,
-1.076158, -1.311171, -0.8618243, 0, 0, 0, 1, 1,
-1.0696, 1.565878, -1.737751, 0, 0, 0, 1, 1,
-1.068002, -1.032934, -2.637467, 0, 0, 0, 1, 1,
-1.055226, -1.228458, -3.617121, 1, 1, 1, 1, 1,
-1.053262, 0.3882025, -2.359377, 1, 1, 1, 1, 1,
-1.047787, 1.021196, -0.9896253, 1, 1, 1, 1, 1,
-1.0453, -1.074289, -1.588529, 1, 1, 1, 1, 1,
-1.039332, -1.230078, -4.133988, 1, 1, 1, 1, 1,
-1.033372, 0.5653836, -0.5225751, 1, 1, 1, 1, 1,
-1.029429, 2.172309, -0.7082256, 1, 1, 1, 1, 1,
-1.025202, 1.368081, 0.3938517, 1, 1, 1, 1, 1,
-1.019312, -0.910105, -3.230676, 1, 1, 1, 1, 1,
-1.015965, -1.263402, -2.039327, 1, 1, 1, 1, 1,
-1.012956, 0.2806473, -0.353223, 1, 1, 1, 1, 1,
-1.011384, 1.207544, 0.1842317, 1, 1, 1, 1, 1,
-1.005983, 0.6147941, 0.7713419, 1, 1, 1, 1, 1,
-1.00177, 1.373006, -0.8145245, 1, 1, 1, 1, 1,
-1.00052, -1.083578, -0.9131793, 1, 1, 1, 1, 1,
-0.991324, 2.21835, 0.4447503, 0, 0, 1, 1, 1,
-0.9900947, -1.479208, -3.3382, 1, 0, 0, 1, 1,
-0.9803943, 1.448169, -0.8663938, 1, 0, 0, 1, 1,
-0.9795775, -0.7796862, -2.167057, 1, 0, 0, 1, 1,
-0.9753827, -0.1552041, 0.1134772, 1, 0, 0, 1, 1,
-0.9708281, -0.5767473, -3.416648, 1, 0, 0, 1, 1,
-0.9587934, 0.5266495, -0.5179406, 0, 0, 0, 1, 1,
-0.9537946, -1.23365, -3.717221, 0, 0, 0, 1, 1,
-0.9515864, 0.3548585, -1.464665, 0, 0, 0, 1, 1,
-0.9478301, -1.272527, -2.379529, 0, 0, 0, 1, 1,
-0.9412842, 0.4595439, -2.349599, 0, 0, 0, 1, 1,
-0.9377709, 0.9854714, -0.2235782, 0, 0, 0, 1, 1,
-0.9372453, 0.8510606, -0.5430942, 0, 0, 0, 1, 1,
-0.934875, -0.7681938, -0.2988902, 1, 1, 1, 1, 1,
-0.9335341, -0.5467429, -1.221407, 1, 1, 1, 1, 1,
-0.926299, 2.112396, -0.9732467, 1, 1, 1, 1, 1,
-0.9223588, -0.01855484, -0.551756, 1, 1, 1, 1, 1,
-0.9195779, 2.218656, -0.4782427, 1, 1, 1, 1, 1,
-0.9128773, 0.2245673, -1.914051, 1, 1, 1, 1, 1,
-0.9081844, -1.406441, -3.319516, 1, 1, 1, 1, 1,
-0.9030579, 0.2135967, -1.089573, 1, 1, 1, 1, 1,
-0.8962294, -1.219039, -3.078107, 1, 1, 1, 1, 1,
-0.895602, -0.4835776, -0.6147557, 1, 1, 1, 1, 1,
-0.8865457, -2.322348, -2.894276, 1, 1, 1, 1, 1,
-0.8848552, -0.8389941, -1.207741, 1, 1, 1, 1, 1,
-0.8758502, 0.8768334, 0.09025332, 1, 1, 1, 1, 1,
-0.8741428, -0.4909823, -3.315062, 1, 1, 1, 1, 1,
-0.8739907, 0.5845054, -1.645817, 1, 1, 1, 1, 1,
-0.8718309, 2.386923, -1.150997, 0, 0, 1, 1, 1,
-0.8711451, 0.94993, -0.3900354, 1, 0, 0, 1, 1,
-0.8677239, -1.228886, -3.163398, 1, 0, 0, 1, 1,
-0.8605748, -0.1530442, -2.27141, 1, 0, 0, 1, 1,
-0.8537456, 1.142224, -1.273453, 1, 0, 0, 1, 1,
-0.8434592, -1.894924, -3.555704, 1, 0, 0, 1, 1,
-0.8422626, -0.8706182, -2.650584, 0, 0, 0, 1, 1,
-0.8414801, -1.118296, -2.114604, 0, 0, 0, 1, 1,
-0.8255053, -0.4310582, -3.718361, 0, 0, 0, 1, 1,
-0.8252814, -0.6140451, -3.188355, 0, 0, 0, 1, 1,
-0.8186322, 1.402605, -0.3887134, 0, 0, 0, 1, 1,
-0.8159387, 0.3835571, -1.494602, 0, 0, 0, 1, 1,
-0.8106704, 1.743285, -2.117354, 0, 0, 0, 1, 1,
-0.8085302, -1.05025, -2.205522, 1, 1, 1, 1, 1,
-0.7998886, 0.3619955, -1.505257, 1, 1, 1, 1, 1,
-0.7974966, -1.821725, -3.920876, 1, 1, 1, 1, 1,
-0.7958329, -1.287448, -3.495888, 1, 1, 1, 1, 1,
-0.7855949, 1.738012, 0.7026221, 1, 1, 1, 1, 1,
-0.7809225, -0.3805788, -3.069713, 1, 1, 1, 1, 1,
-0.7744215, -2.18694, -2.134645, 1, 1, 1, 1, 1,
-0.7625634, 0.6811027, -0.5749954, 1, 1, 1, 1, 1,
-0.7563379, 1.748345, 0.2022331, 1, 1, 1, 1, 1,
-0.7546141, -1.841463, -3.610096, 1, 1, 1, 1, 1,
-0.7527282, -0.6076296, -2.025635, 1, 1, 1, 1, 1,
-0.751117, 0.1692012, -2.140211, 1, 1, 1, 1, 1,
-0.7459067, -1.177655, -1.528436, 1, 1, 1, 1, 1,
-0.7436631, -0.4098345, -2.571673, 1, 1, 1, 1, 1,
-0.7431257, 0.7087031, -1.071231, 1, 1, 1, 1, 1,
-0.7395878, 0.0101576, -1.913669, 0, 0, 1, 1, 1,
-0.7372575, -0.06695496, -1.526719, 1, 0, 0, 1, 1,
-0.730388, 1.150635, 1.21701, 1, 0, 0, 1, 1,
-0.7234189, 0.2531328, -2.499071, 1, 0, 0, 1, 1,
-0.7198443, -2.057731, -1.933869, 1, 0, 0, 1, 1,
-0.7193112, -0.02454701, -0.8782807, 1, 0, 0, 1, 1,
-0.7179882, 0.4603544, -1.942571, 0, 0, 0, 1, 1,
-0.7164142, 1.476406, -1.48952, 0, 0, 0, 1, 1,
-0.7150845, 0.5407914, -0.0350557, 0, 0, 0, 1, 1,
-0.7150059, -0.1694277, -1.243026, 0, 0, 0, 1, 1,
-0.7119353, -0.3969395, -3.335285, 0, 0, 0, 1, 1,
-0.7098989, 0.5691097, -0.9701422, 0, 0, 0, 1, 1,
-0.7098135, -0.1015426, -1.92324, 0, 0, 0, 1, 1,
-0.7098055, -0.1434425, -2.713313, 1, 1, 1, 1, 1,
-0.699855, -0.5177594, -0.9133671, 1, 1, 1, 1, 1,
-0.6989247, 0.9226484, -2.481996, 1, 1, 1, 1, 1,
-0.692628, 0.4855805, -0.5168031, 1, 1, 1, 1, 1,
-0.6901438, 0.2693703, -1.688473, 1, 1, 1, 1, 1,
-0.6896248, 1.189028, 1.961384, 1, 1, 1, 1, 1,
-0.6881625, -0.259644, 0.8997011, 1, 1, 1, 1, 1,
-0.6822742, -1.262577, -4.558896, 1, 1, 1, 1, 1,
-0.6802856, -0.5216208, -4.170718, 1, 1, 1, 1, 1,
-0.6766707, 1.61123, -0.5247042, 1, 1, 1, 1, 1,
-0.6749822, 0.8984778, -1.262106, 1, 1, 1, 1, 1,
-0.6723535, -0.5443645, -2.606979, 1, 1, 1, 1, 1,
-0.6709617, 0.5187728, -1.032607, 1, 1, 1, 1, 1,
-0.6692796, -0.8684603, -3.806003, 1, 1, 1, 1, 1,
-0.6663173, -0.4669061, -2.795199, 1, 1, 1, 1, 1,
-0.6577299, -0.03008459, -1.626598, 0, 0, 1, 1, 1,
-0.654973, 1.068858, -1.051052, 1, 0, 0, 1, 1,
-0.6537824, -1.746306, -2.928991, 1, 0, 0, 1, 1,
-0.6530873, 0.5315183, -2.759032, 1, 0, 0, 1, 1,
-0.6347748, 1.169091, 1.469677, 1, 0, 0, 1, 1,
-0.6303626, -0.5005052, -2.809482, 1, 0, 0, 1, 1,
-0.626161, 0.6777938, -2.784938, 0, 0, 0, 1, 1,
-0.6225657, 0.550833, -0.2846199, 0, 0, 0, 1, 1,
-0.6223012, 0.4266995, -1.099585, 0, 0, 0, 1, 1,
-0.620961, -1.26632, -3.494482, 0, 0, 0, 1, 1,
-0.6195701, 1.368915, -0.8338307, 0, 0, 0, 1, 1,
-0.6145175, 2.468871, -0.0636407, 0, 0, 0, 1, 1,
-0.6135232, -0.06888558, -3.173866, 0, 0, 0, 1, 1,
-0.6092282, -0.6156597, -1.496908, 1, 1, 1, 1, 1,
-0.6088398, 1.618875, -1.358947, 1, 1, 1, 1, 1,
-0.6076384, -0.5774575, -0.6380693, 1, 1, 1, 1, 1,
-0.606461, -0.566366, -2.391656, 1, 1, 1, 1, 1,
-0.6044927, -1.411551, -1.961313, 1, 1, 1, 1, 1,
-0.6017879, 0.3977293, -1.378359, 1, 1, 1, 1, 1,
-0.598011, -1.633295, -2.222996, 1, 1, 1, 1, 1,
-0.5936021, -1.020033, -2.535734, 1, 1, 1, 1, 1,
-0.5838056, 1.551301, 0.4567836, 1, 1, 1, 1, 1,
-0.5830151, 1.429268, -0.8203666, 1, 1, 1, 1, 1,
-0.5785204, -0.09871633, -1.497893, 1, 1, 1, 1, 1,
-0.5777599, -0.4143052, -1.055919, 1, 1, 1, 1, 1,
-0.5777124, 0.4417477, -1.05225, 1, 1, 1, 1, 1,
-0.5772181, 0.2881111, -0.8985616, 1, 1, 1, 1, 1,
-0.5734402, 0.6332803, 0.8183513, 1, 1, 1, 1, 1,
-0.5673122, 0.4265445, -1.166859, 0, 0, 1, 1, 1,
-0.5635305, 1.095968, -0.898542, 1, 0, 0, 1, 1,
-0.5609028, -0.8553641, 0.3567199, 1, 0, 0, 1, 1,
-0.5572593, -0.7422881, -1.843791, 1, 0, 0, 1, 1,
-0.5493538, -0.5248981, -1.432788, 1, 0, 0, 1, 1,
-0.5482532, 0.8052855, -0.4439602, 1, 0, 0, 1, 1,
-0.5437915, -0.6001375, -1.161258, 0, 0, 0, 1, 1,
-0.5427233, 0.6306233, -0.2339085, 0, 0, 0, 1, 1,
-0.529783, -0.06899827, -0.7266179, 0, 0, 0, 1, 1,
-0.5289477, -0.6890717, -0.3258098, 0, 0, 0, 1, 1,
-0.5288647, 0.2069098, -1.537646, 0, 0, 0, 1, 1,
-0.5250968, -1.751451, -3.752346, 0, 0, 0, 1, 1,
-0.5224941, -1.303853, -2.745949, 0, 0, 0, 1, 1,
-0.5214821, 0.5030521, 0.07591794, 1, 1, 1, 1, 1,
-0.5198205, -0.5897871, -2.741139, 1, 1, 1, 1, 1,
-0.5197546, -1.624178, -2.338596, 1, 1, 1, 1, 1,
-0.5095892, -1.316142, -1.973851, 1, 1, 1, 1, 1,
-0.5093532, -1.39312, -4.304037, 1, 1, 1, 1, 1,
-0.5077332, -0.5926333, -3.787132, 1, 1, 1, 1, 1,
-0.4916796, 0.2073893, -1.173966, 1, 1, 1, 1, 1,
-0.4801957, 0.3214272, -0.8026433, 1, 1, 1, 1, 1,
-0.4740869, -0.8829076, -3.292141, 1, 1, 1, 1, 1,
-0.4731175, 0.6036698, -0.6182012, 1, 1, 1, 1, 1,
-0.4674792, 0.207576, -0.4290631, 1, 1, 1, 1, 1,
-0.4656796, 0.5484492, -0.2116482, 1, 1, 1, 1, 1,
-0.4654097, -1.15509, -3.409639, 1, 1, 1, 1, 1,
-0.4639274, 1.014239, 1.109455, 1, 1, 1, 1, 1,
-0.4637973, -0.1186056, -2.374893, 1, 1, 1, 1, 1,
-0.4545265, -0.7312095, -3.325792, 0, 0, 1, 1, 1,
-0.4526783, -0.4036705, -2.475603, 1, 0, 0, 1, 1,
-0.4517641, 1.348489, -2.294688, 1, 0, 0, 1, 1,
-0.4468534, 0.6562793, -0.003979262, 1, 0, 0, 1, 1,
-0.4462097, -0.3697726, -2.664066, 1, 0, 0, 1, 1,
-0.4457287, 0.9020745, -0.3585359, 1, 0, 0, 1, 1,
-0.4450969, -0.4342391, -2.125982, 0, 0, 0, 1, 1,
-0.4402274, -0.5886973, -0.8962889, 0, 0, 0, 1, 1,
-0.4397462, 0.2013136, -1.621634, 0, 0, 0, 1, 1,
-0.4385188, 0.2559452, 0.2815349, 0, 0, 0, 1, 1,
-0.4360708, -0.04151915, -1.160948, 0, 0, 0, 1, 1,
-0.4335379, -2.381731, -4.211727, 0, 0, 0, 1, 1,
-0.4307299, 0.8862279, 0.1366215, 0, 0, 0, 1, 1,
-0.4296424, 0.02712427, -2.010169, 1, 1, 1, 1, 1,
-0.4268071, 0.5683724, 0.9706807, 1, 1, 1, 1, 1,
-0.4262533, 0.2152357, 0.6258426, 1, 1, 1, 1, 1,
-0.4260531, 0.3627212, 0.7725198, 1, 1, 1, 1, 1,
-0.4258258, 0.4532088, 0.9431539, 1, 1, 1, 1, 1,
-0.423313, 0.3372458, -2.816093, 1, 1, 1, 1, 1,
-0.423063, -0.7952767, -2.432238, 1, 1, 1, 1, 1,
-0.4176427, 0.9417083, -1.583073, 1, 1, 1, 1, 1,
-0.4154387, 0.5455201, -0.6193103, 1, 1, 1, 1, 1,
-0.414869, -0.4668373, -1.873226, 1, 1, 1, 1, 1,
-0.3978937, 1.211024, -0.3076634, 1, 1, 1, 1, 1,
-0.3894344, -0.4759936, -4.00438, 1, 1, 1, 1, 1,
-0.3881921, -1.184433, -3.99502, 1, 1, 1, 1, 1,
-0.3776825, -0.1309066, -3.600278, 1, 1, 1, 1, 1,
-0.3752734, 0.4715579, 1.800346, 1, 1, 1, 1, 1,
-0.3725219, -0.8270321, -1.709556, 0, 0, 1, 1, 1,
-0.3627239, -1.030146, -1.219398, 1, 0, 0, 1, 1,
-0.3626298, -0.3941552, -0.4668438, 1, 0, 0, 1, 1,
-0.3608373, 1.266513, -1.979954, 1, 0, 0, 1, 1,
-0.358747, -1.403751, -2.213417, 1, 0, 0, 1, 1,
-0.3580551, -0.661467, -2.038284, 1, 0, 0, 1, 1,
-0.3571105, -0.2499786, -2.527553, 0, 0, 0, 1, 1,
-0.3562818, 0.9905667, -2.14669, 0, 0, 0, 1, 1,
-0.3473786, 0.1704266, -0.149618, 0, 0, 0, 1, 1,
-0.3454325, -1.224801, -2.565794, 0, 0, 0, 1, 1,
-0.3438803, 0.8692087, -0.4730911, 0, 0, 0, 1, 1,
-0.3430764, -0.8708899, -3.966186, 0, 0, 0, 1, 1,
-0.3421545, -1.602616, -2.563402, 0, 0, 0, 1, 1,
-0.340883, -0.9389725, -3.309664, 1, 1, 1, 1, 1,
-0.3399107, 1.300219, 0.7128302, 1, 1, 1, 1, 1,
-0.3387665, 1.113196, -1.069422, 1, 1, 1, 1, 1,
-0.3376524, 0.08377238, -0.5610007, 1, 1, 1, 1, 1,
-0.3338294, 0.5242519, -0.5991018, 1, 1, 1, 1, 1,
-0.3324862, 0.7340655, -1.192227, 1, 1, 1, 1, 1,
-0.3196101, 1.131685, 0.8773544, 1, 1, 1, 1, 1,
-0.3147853, -0.2998101, -2.990455, 1, 1, 1, 1, 1,
-0.3083239, -0.3661433, -1.429179, 1, 1, 1, 1, 1,
-0.305786, -1.203058, -2.503852, 1, 1, 1, 1, 1,
-0.3046508, 0.902968, -0.04464837, 1, 1, 1, 1, 1,
-0.302308, 1.008023, 0.9183125, 1, 1, 1, 1, 1,
-0.3015662, 1.063506, 0.409029, 1, 1, 1, 1, 1,
-0.3004495, -1.161177, -3.350497, 1, 1, 1, 1, 1,
-0.2976792, 0.8181893, -0.5286081, 1, 1, 1, 1, 1,
-0.2930269, 2.670221, -1.110167, 0, 0, 1, 1, 1,
-0.2913532, -0.8185775, -3.475931, 1, 0, 0, 1, 1,
-0.2862215, 0.8255451, 0.02914037, 1, 0, 0, 1, 1,
-0.2758445, -0.8388093, -3.335935, 1, 0, 0, 1, 1,
-0.2726851, 0.1712527, -0.734298, 1, 0, 0, 1, 1,
-0.2660221, 0.7116275, 0.5074704, 1, 0, 0, 1, 1,
-0.2584161, -0.9570326, -2.633089, 0, 0, 0, 1, 1,
-0.2584002, 0.1325695, -2.390757, 0, 0, 0, 1, 1,
-0.2572053, -1.225432, -3.88773, 0, 0, 0, 1, 1,
-0.2567405, 0.5554089, -1.142785, 0, 0, 0, 1, 1,
-0.2549046, -1.275843, -2.519943, 0, 0, 0, 1, 1,
-0.2535087, -0.3813944, -1.952183, 0, 0, 0, 1, 1,
-0.2529441, 0.5734261, -2.068544, 0, 0, 0, 1, 1,
-0.2478408, -0.144355, -0.07455477, 1, 1, 1, 1, 1,
-0.2474393, 1.391113, 0.5074918, 1, 1, 1, 1, 1,
-0.2425979, -1.681459, -3.278761, 1, 1, 1, 1, 1,
-0.2419408, 0.2699386, -1.462548, 1, 1, 1, 1, 1,
-0.2400336, 0.1523748, 0.6885603, 1, 1, 1, 1, 1,
-0.2398838, 1.178855, -1.020409, 1, 1, 1, 1, 1,
-0.2392515, 0.2654686, 1.54656, 1, 1, 1, 1, 1,
-0.2388559, 0.2377583, -1.13247, 1, 1, 1, 1, 1,
-0.2387932, -0.7166092, -2.472569, 1, 1, 1, 1, 1,
-0.2384287, 1.413887, -0.1351447, 1, 1, 1, 1, 1,
-0.237111, -0.3301841, -3.440899, 1, 1, 1, 1, 1,
-0.2365188, -0.9025993, -3.99312, 1, 1, 1, 1, 1,
-0.2352993, -1.169161, -1.285455, 1, 1, 1, 1, 1,
-0.2252151, -0.203676, -2.705569, 1, 1, 1, 1, 1,
-0.2246554, 0.8074278, 0.3274126, 1, 1, 1, 1, 1,
-0.2229125, 0.9504033, -2.851732, 0, 0, 1, 1, 1,
-0.2167232, 0.06969377, -1.380308, 1, 0, 0, 1, 1,
-0.2120195, -1.535144, -2.316406, 1, 0, 0, 1, 1,
-0.2099107, -0.6700562, -1.310578, 1, 0, 0, 1, 1,
-0.208041, 0.3813685, -1.501671, 1, 0, 0, 1, 1,
-0.2045034, 1.858184, 0.7145169, 1, 0, 0, 1, 1,
-0.2040277, 0.3956124, 0.9148803, 0, 0, 0, 1, 1,
-0.2036463, 2.467178, 0.002303173, 0, 0, 0, 1, 1,
-0.2026589, -1.198289, -3.199397, 0, 0, 0, 1, 1,
-0.2024409, -0.5658862, -2.478468, 0, 0, 0, 1, 1,
-0.1964815, -0.1192973, 0.2535341, 0, 0, 0, 1, 1,
-0.1942301, 0.9079793, -0.01570043, 0, 0, 0, 1, 1,
-0.1939781, -1.184455, -1.975094, 0, 0, 0, 1, 1,
-0.1926815, 1.676082, 1.70958, 1, 1, 1, 1, 1,
-0.1922252, -0.09835891, -1.555872, 1, 1, 1, 1, 1,
-0.1909482, 0.1043038, -2.173966, 1, 1, 1, 1, 1,
-0.1845777, 0.5283998, -0.9929149, 1, 1, 1, 1, 1,
-0.1845158, -0.2203302, -1.312657, 1, 1, 1, 1, 1,
-0.1790231, -1.488381, -3.304178, 1, 1, 1, 1, 1,
-0.1788641, -0.9968138, -3.366756, 1, 1, 1, 1, 1,
-0.1762161, 0.7335501, -1.041931, 1, 1, 1, 1, 1,
-0.173515, -1.060121, -2.38684, 1, 1, 1, 1, 1,
-0.1665171, 0.1146198, -3.393729, 1, 1, 1, 1, 1,
-0.1643136, 1.061992, -0.1618101, 1, 1, 1, 1, 1,
-0.163534, 0.6548376, -1.387738, 1, 1, 1, 1, 1,
-0.1611079, -0.05541168, -2.546037, 1, 1, 1, 1, 1,
-0.1464303, 0.694432, -0.5666864, 1, 1, 1, 1, 1,
-0.1463078, -1.085876, -1.751651, 1, 1, 1, 1, 1,
-0.1374239, -0.764904, -3.139529, 0, 0, 1, 1, 1,
-0.1372894, 0.5993114, -1.521557, 1, 0, 0, 1, 1,
-0.133032, 0.8000363, 1.180744, 1, 0, 0, 1, 1,
-0.1280427, -0.2258147, -2.45542, 1, 0, 0, 1, 1,
-0.1272797, 0.6401312, -0.04798764, 1, 0, 0, 1, 1,
-0.1270054, -0.4659435, -3.843313, 1, 0, 0, 1, 1,
-0.1248583, 0.07958928, -0.4499435, 0, 0, 0, 1, 1,
-0.1231178, 0.7109528, 0.3461995, 0, 0, 0, 1, 1,
-0.1226893, -1.051383, -4.012477, 0, 0, 0, 1, 1,
-0.1182145, 0.2588217, -0.1799945, 0, 0, 0, 1, 1,
-0.1170925, -1.349438, -3.288008, 0, 0, 0, 1, 1,
-0.1162364, -0.7923158, -2.44823, 0, 0, 0, 1, 1,
-0.1155226, 2.143259, -1.109502, 0, 0, 0, 1, 1,
-0.1148324, 0.8352196, -1.937867, 1, 1, 1, 1, 1,
-0.1123855, 1.339332, 1.281941, 1, 1, 1, 1, 1,
-0.110635, 0.7238033, -0.886665, 1, 1, 1, 1, 1,
-0.1103964, -0.7501508, -1.684636, 1, 1, 1, 1, 1,
-0.1051312, 0.7866861, 0.6014466, 1, 1, 1, 1, 1,
-0.1003679, -2.418109, -3.861953, 1, 1, 1, 1, 1,
-0.0856253, -0.03455939, -1.628576, 1, 1, 1, 1, 1,
-0.07999153, -1.706308, -2.106622, 1, 1, 1, 1, 1,
-0.07865191, -0.25461, -2.781129, 1, 1, 1, 1, 1,
-0.07852206, 1.695123, -0.6488738, 1, 1, 1, 1, 1,
-0.07740981, -1.021112, -4.077188, 1, 1, 1, 1, 1,
-0.07125727, 1.156358, -0.0648751, 1, 1, 1, 1, 1,
-0.06821904, -0.4797301, -3.911569, 1, 1, 1, 1, 1,
-0.06800737, -1.350517, -4.567925, 1, 1, 1, 1, 1,
-0.05599975, -0.3420799, -2.374197, 1, 1, 1, 1, 1,
-0.05070808, 0.6692734, -1.713657, 0, 0, 1, 1, 1,
-0.04945524, -1.489793, -1.448752, 1, 0, 0, 1, 1,
-0.04746582, 0.07675989, -0.356011, 1, 0, 0, 1, 1,
-0.04571898, -0.3316132, -2.760033, 1, 0, 0, 1, 1,
-0.03982989, -0.06159721, -2.66903, 1, 0, 0, 1, 1,
-0.03668936, -0.5115622, -2.056817, 1, 0, 0, 1, 1,
-0.03496046, -0.04915389, -1.590589, 0, 0, 0, 1, 1,
-0.03448166, -0.416378, -3.515194, 0, 0, 0, 1, 1,
-0.03261339, 0.338788, 0.1216005, 0, 0, 0, 1, 1,
-0.02987616, 1.738702, 0.2505224, 0, 0, 0, 1, 1,
-0.02274338, 1.514432, -0.732313, 0, 0, 0, 1, 1,
-0.02231683, -2.457144, -1.967997, 0, 0, 0, 1, 1,
-0.01762345, 0.931107, 0.6571665, 0, 0, 0, 1, 1,
-0.01692996, -0.3587267, -4.643602, 1, 1, 1, 1, 1,
-0.01607826, 2.07332, 0.528367, 1, 1, 1, 1, 1,
-0.01512591, 0.1381903, -0.2772413, 1, 1, 1, 1, 1,
-0.01353656, 0.7955566, -0.2294848, 1, 1, 1, 1, 1,
-0.004523894, 1.626541, -0.7982291, 1, 1, 1, 1, 1,
0.005263496, -0.08955875, 2.617283, 1, 1, 1, 1, 1,
0.006477006, 0.7288334, -0.2510889, 1, 1, 1, 1, 1,
0.007637449, 0.6974267, -1.116988, 1, 1, 1, 1, 1,
0.008327041, -0.2237237, 2.666802, 1, 1, 1, 1, 1,
0.008725359, 0.280436, -1.69262, 1, 1, 1, 1, 1,
0.01147871, -0.758965, 1.761547, 1, 1, 1, 1, 1,
0.0118016, 0.6074589, -0.09493455, 1, 1, 1, 1, 1,
0.01223168, 1.261945, -0.1767135, 1, 1, 1, 1, 1,
0.01291813, -1.705488, 1.68472, 1, 1, 1, 1, 1,
0.01458034, 1.445591, 0.7023782, 1, 1, 1, 1, 1,
0.01488059, 0.8908796, 1.85946, 0, 0, 1, 1, 1,
0.0161782, -0.8940484, 3.492635, 1, 0, 0, 1, 1,
0.01678916, -1.203591, 1.791773, 1, 0, 0, 1, 1,
0.01779605, -0.8661333, 2.122962, 1, 0, 0, 1, 1,
0.02415774, 1.856872, -1.089852, 1, 0, 0, 1, 1,
0.02924991, 0.2361458, 0.6620298, 1, 0, 0, 1, 1,
0.03072371, 1.369545, 2.714195, 0, 0, 0, 1, 1,
0.03164993, 0.4354826, 1.175533, 0, 0, 0, 1, 1,
0.03469393, 0.5427881, -0.6578199, 0, 0, 0, 1, 1,
0.03646035, 1.417293, 0.6501487, 0, 0, 0, 1, 1,
0.04008323, 0.3015097, 2.087554, 0, 0, 0, 1, 1,
0.04355159, -0.498495, 4.184251, 0, 0, 0, 1, 1,
0.04572732, 2.284899, 1.182935, 0, 0, 0, 1, 1,
0.04665085, 0.003544348, 0.01526299, 1, 1, 1, 1, 1,
0.05542118, 0.873226, -0.7569617, 1, 1, 1, 1, 1,
0.06063222, 1.422878, 0.7639081, 1, 1, 1, 1, 1,
0.06082264, -1.123561, 4.042943, 1, 1, 1, 1, 1,
0.07188136, 0.4192997, 1.436535, 1, 1, 1, 1, 1,
0.07454126, 0.5807289, -0.5696706, 1, 1, 1, 1, 1,
0.07803184, -1.109528, 1.575593, 1, 1, 1, 1, 1,
0.0789389, 0.4739905, -0.4301339, 1, 1, 1, 1, 1,
0.08207478, -0.1667832, 4.18007, 1, 1, 1, 1, 1,
0.08556411, 1.447736, 1.032239, 1, 1, 1, 1, 1,
0.09389672, 0.4810946, -1.025695, 1, 1, 1, 1, 1,
0.09397633, 0.6287223, -0.2312639, 1, 1, 1, 1, 1,
0.09491224, -0.9190955, 3.503609, 1, 1, 1, 1, 1,
0.1022717, -0.5958797, 2.174552, 1, 1, 1, 1, 1,
0.1049229, 0.8126808, -0.121383, 1, 1, 1, 1, 1,
0.1056506, 1.206833, -0.3352283, 0, 0, 1, 1, 1,
0.1062041, -0.5637301, 1.133584, 1, 0, 0, 1, 1,
0.1089492, -0.7781282, 3.007483, 1, 0, 0, 1, 1,
0.1119151, 2.109715, 0.8971452, 1, 0, 0, 1, 1,
0.1145821, -0.7721465, 4.512055, 1, 0, 0, 1, 1,
0.1151885, 2.186054, 0.8701211, 1, 0, 0, 1, 1,
0.1160497, 0.9539022, 2.326475, 0, 0, 0, 1, 1,
0.1171675, 2.927512, 1.607765, 0, 0, 0, 1, 1,
0.1188859, -0.6278054, 0.6764193, 0, 0, 0, 1, 1,
0.1261258, -1.869854, 4.446946, 0, 0, 0, 1, 1,
0.1291213, 1.356864, 0.9817505, 0, 0, 0, 1, 1,
0.1292728, 0.3806282, -0.3599482, 0, 0, 0, 1, 1,
0.1315396, 1.564629, 0.3747171, 0, 0, 0, 1, 1,
0.1332428, 2.127584, 0.7008064, 1, 1, 1, 1, 1,
0.1342525, -0.7693632, 2.687352, 1, 1, 1, 1, 1,
0.1361028, 2.161288, 1.31441, 1, 1, 1, 1, 1,
0.1362843, -0.4480148, 3.252278, 1, 1, 1, 1, 1,
0.1387452, -0.1911547, 0.5153374, 1, 1, 1, 1, 1,
0.1427244, -0.3394333, 3.485464, 1, 1, 1, 1, 1,
0.1462704, -0.6408762, 2.196432, 1, 1, 1, 1, 1,
0.1469114, -0.7357833, 1.625735, 1, 1, 1, 1, 1,
0.1470539, -0.2259451, 2.029424, 1, 1, 1, 1, 1,
0.1475243, -1.28681, 4.090665, 1, 1, 1, 1, 1,
0.1521643, 0.7551644, 0.6581393, 1, 1, 1, 1, 1,
0.1525403, -1.210718, 3.148692, 1, 1, 1, 1, 1,
0.15257, 0.3204189, 1.257758, 1, 1, 1, 1, 1,
0.1538745, 0.5813657, -1.362223, 1, 1, 1, 1, 1,
0.1539239, 2.111314, 0.4260917, 1, 1, 1, 1, 1,
0.1571603, 0.2789296, 0.8565206, 0, 0, 1, 1, 1,
0.1574084, 0.8014427, -1.237374, 1, 0, 0, 1, 1,
0.1620181, 0.1614149, 0.2476602, 1, 0, 0, 1, 1,
0.1659691, 0.4463802, 0.01029331, 1, 0, 0, 1, 1,
0.1665158, 1.632518, 0.6146606, 1, 0, 0, 1, 1,
0.1665167, 0.5129056, -0.9073607, 1, 0, 0, 1, 1,
0.1681296, -0.723901, 4.340135, 0, 0, 0, 1, 1,
0.1701674, 0.5333558, -0.8374129, 0, 0, 0, 1, 1,
0.1704521, -0.2643538, 0.9149798, 0, 0, 0, 1, 1,
0.1707657, 0.3788207, 1.289135, 0, 0, 0, 1, 1,
0.171658, 1.181503, 1.214267, 0, 0, 0, 1, 1,
0.1783914, -0.2797892, 1.800051, 0, 0, 0, 1, 1,
0.1862637, -1.105159, 3.133765, 0, 0, 0, 1, 1,
0.1865913, 0.6399468, -0.7902722, 1, 1, 1, 1, 1,
0.1871093, 0.4629141, 0.744859, 1, 1, 1, 1, 1,
0.188252, -1.635104, 1.228774, 1, 1, 1, 1, 1,
0.1888514, 1.293469, 0.52908, 1, 1, 1, 1, 1,
0.1900451, 1.717396, 0.6279213, 1, 1, 1, 1, 1,
0.1903955, -1.47265, 2.301624, 1, 1, 1, 1, 1,
0.1942129, 0.7789689, 0.8003257, 1, 1, 1, 1, 1,
0.1950641, 0.03114951, 1.430325, 1, 1, 1, 1, 1,
0.1956709, -1.353995, 3.073661, 1, 1, 1, 1, 1,
0.1966421, 0.5150614, 3.42985, 1, 1, 1, 1, 1,
0.1971628, -0.4454913, 0.8793166, 1, 1, 1, 1, 1,
0.1982686, 0.2453685, 2.939693, 1, 1, 1, 1, 1,
0.2001164, -0.9473218, 1.275898, 1, 1, 1, 1, 1,
0.2009583, -0.595554, 2.673418, 1, 1, 1, 1, 1,
0.2039978, -0.9898902, 2.670792, 1, 1, 1, 1, 1,
0.2050266, 0.07669466, -0.007914099, 0, 0, 1, 1, 1,
0.2056852, -0.04872554, 1.898799, 1, 0, 0, 1, 1,
0.2058562, -0.8510662, 4.755479, 1, 0, 0, 1, 1,
0.2074704, 2.101298, 0.08018196, 1, 0, 0, 1, 1,
0.2088853, -0.5997629, 4.691147, 1, 0, 0, 1, 1,
0.2119918, 0.8154548, 1.359561, 1, 0, 0, 1, 1,
0.2124201, -0.5467339, 2.224211, 0, 0, 0, 1, 1,
0.2147656, -0.232623, 2.241715, 0, 0, 0, 1, 1,
0.2150537, 1.166791, 0.3574769, 0, 0, 0, 1, 1,
0.2160839, 0.4616692, 0.09116646, 0, 0, 0, 1, 1,
0.2167706, 0.6808496, 0.7457406, 0, 0, 0, 1, 1,
0.2209184, -0.7781149, 2.938467, 0, 0, 0, 1, 1,
0.2232624, 0.9122607, -1.864704, 0, 0, 0, 1, 1,
0.2254317, 1.317427, 2.53327, 1, 1, 1, 1, 1,
0.2291484, -2.525456, 1.575022, 1, 1, 1, 1, 1,
0.2309244, -0.9432893, 1.682562, 1, 1, 1, 1, 1,
0.2326085, -0.8769103, 1.601321, 1, 1, 1, 1, 1,
0.2337236, -1.009871, 2.343652, 1, 1, 1, 1, 1,
0.2347218, 1.186443, 0.4010024, 1, 1, 1, 1, 1,
0.2351132, 0.6389992, 0.02580471, 1, 1, 1, 1, 1,
0.2359805, -0.2941895, 2.739805, 1, 1, 1, 1, 1,
0.2375869, 0.7722522, -0.3082861, 1, 1, 1, 1, 1,
0.2401257, 0.9976512, -0.25049, 1, 1, 1, 1, 1,
0.2448467, -0.08729352, 3.132849, 1, 1, 1, 1, 1,
0.2454967, -0.5873595, 3.240017, 1, 1, 1, 1, 1,
0.2473973, 0.2242745, 0.2022273, 1, 1, 1, 1, 1,
0.2480894, 0.2358397, 1.019354, 1, 1, 1, 1, 1,
0.2492077, 1.655689, -0.4509918, 1, 1, 1, 1, 1,
0.2502952, 0.0576219, 2.802784, 0, 0, 1, 1, 1,
0.2553228, -1.094675, 3.485002, 1, 0, 0, 1, 1,
0.2559557, -0.68082, 3.211408, 1, 0, 0, 1, 1,
0.257605, -0.6674894, 1.409004, 1, 0, 0, 1, 1,
0.2576068, -2.517461, 3.034969, 1, 0, 0, 1, 1,
0.2586867, -0.7076468, 4.013898, 1, 0, 0, 1, 1,
0.2595409, -1.492495, 3.318813, 0, 0, 0, 1, 1,
0.2634695, -0.3069679, 2.850175, 0, 0, 0, 1, 1,
0.2634923, -2.630782, 3.369457, 0, 0, 0, 1, 1,
0.2654574, -0.9947506, 1.470631, 0, 0, 0, 1, 1,
0.2659784, -0.3386234, 2.364118, 0, 0, 0, 1, 1,
0.267159, -0.03160029, 1.590201, 0, 0, 0, 1, 1,
0.2673942, 0.9505996, -0.4415297, 0, 0, 0, 1, 1,
0.2675169, 2.643849, 1.932213, 1, 1, 1, 1, 1,
0.2690284, 1.284776, 1.289371, 1, 1, 1, 1, 1,
0.272643, -0.4749588, 1.598234, 1, 1, 1, 1, 1,
0.2784871, 0.9796647, 0.531795, 1, 1, 1, 1, 1,
0.2792964, -1.688639, 2.664506, 1, 1, 1, 1, 1,
0.2818415, 1.302245, 0.6491004, 1, 1, 1, 1, 1,
0.287485, 0.165167, 0.395029, 1, 1, 1, 1, 1,
0.2893367, -1.186629, 3.739998, 1, 1, 1, 1, 1,
0.2928185, -2.06319, 3.213486, 1, 1, 1, 1, 1,
0.2942994, -0.8419557, 1.882705, 1, 1, 1, 1, 1,
0.3019553, -2.126357, 2.879591, 1, 1, 1, 1, 1,
0.3031043, 0.3490042, 1.252836, 1, 1, 1, 1, 1,
0.3038241, -0.4097275, 1.890818, 1, 1, 1, 1, 1,
0.3074427, -1.291492, 4.43783, 1, 1, 1, 1, 1,
0.3081613, -0.9351742, 3.027012, 1, 1, 1, 1, 1,
0.3133496, 1.063045, 1.307809, 0, 0, 1, 1, 1,
0.3164786, -2.964962, 3.251217, 1, 0, 0, 1, 1,
0.3246556, -1.091222, 4.165515, 1, 0, 0, 1, 1,
0.3292682, -1.365541, 3.692224, 1, 0, 0, 1, 1,
0.3330387, -1.922579, 2.672352, 1, 0, 0, 1, 1,
0.3367026, 1.7156, 0.9479232, 1, 0, 0, 1, 1,
0.3374951, -0.1209112, 1.038305, 0, 0, 0, 1, 1,
0.3412829, 0.8844835, 1.901814, 0, 0, 0, 1, 1,
0.3486843, 0.3310547, -1.067997, 0, 0, 0, 1, 1,
0.3489273, -0.75718, 3.484331, 0, 0, 0, 1, 1,
0.349991, 1.231958, 2.688899, 0, 0, 0, 1, 1,
0.3572089, -0.6512277, 1.204807, 0, 0, 0, 1, 1,
0.3587213, -0.4028438, 0.7307339, 0, 0, 0, 1, 1,
0.35964, 0.2793068, 1.257609, 1, 1, 1, 1, 1,
0.361869, -0.6579927, 3.571902, 1, 1, 1, 1, 1,
0.3696944, -0.05555269, 1.100245, 1, 1, 1, 1, 1,
0.3733042, 1.103721, 0.661087, 1, 1, 1, 1, 1,
0.3755564, -1.101224, 4.37837, 1, 1, 1, 1, 1,
0.3770815, 0.4978967, 0.60009, 1, 1, 1, 1, 1,
0.3814249, -0.1927094, 2.723141, 1, 1, 1, 1, 1,
0.3831292, 0.3708692, 2.522942, 1, 1, 1, 1, 1,
0.3860267, -0.9023983, 2.267109, 1, 1, 1, 1, 1,
0.3890879, 0.4694255, -0.004280788, 1, 1, 1, 1, 1,
0.3976122, 0.5070537, 0.9322661, 1, 1, 1, 1, 1,
0.3989207, 0.3658299, -0.1674815, 1, 1, 1, 1, 1,
0.3991105, -0.01130862, 2.563097, 1, 1, 1, 1, 1,
0.4005248, -1.094425, 3.556395, 1, 1, 1, 1, 1,
0.4015323, -0.7794116, 2.812519, 1, 1, 1, 1, 1,
0.4056874, 1.004242, 0.1062846, 0, 0, 1, 1, 1,
0.4060693, -1.468356, 2.664711, 1, 0, 0, 1, 1,
0.4119478, 0.5050325, 1.026162, 1, 0, 0, 1, 1,
0.4133488, 0.7454464, 0.8833035, 1, 0, 0, 1, 1,
0.4137203, -0.3044915, 3.792717, 1, 0, 0, 1, 1,
0.415502, -0.7696391, 2.859665, 1, 0, 0, 1, 1,
0.4205313, -0.6123391, 4.782788, 0, 0, 0, 1, 1,
0.4228272, -1.412358, 1.519154, 0, 0, 0, 1, 1,
0.4233012, -0.3099886, 2.814569, 0, 0, 0, 1, 1,
0.4244544, 0.8542498, 0.2648728, 0, 0, 0, 1, 1,
0.4246374, -0.4145451, 1.474553, 0, 0, 0, 1, 1,
0.4258767, 1.011526, 1.104491, 0, 0, 0, 1, 1,
0.4289907, 0.1237383, 1.800991, 0, 0, 0, 1, 1,
0.4294596, 0.9167499, 0.719933, 1, 1, 1, 1, 1,
0.4299223, 0.4042268, 3.470879, 1, 1, 1, 1, 1,
0.4314306, -0.4681665, 3.597063, 1, 1, 1, 1, 1,
0.4383766, -0.3431257, 2.018016, 1, 1, 1, 1, 1,
0.4399534, -1.613995, 3.537963, 1, 1, 1, 1, 1,
0.4443898, -0.9796579, 1.101212, 1, 1, 1, 1, 1,
0.4506045, 1.312795, -0.5913047, 1, 1, 1, 1, 1,
0.4510711, 0.6113457, -1.284214, 1, 1, 1, 1, 1,
0.4544386, -0.7273644, 4.098846, 1, 1, 1, 1, 1,
0.4561163, 0.261551, 2.14004, 1, 1, 1, 1, 1,
0.4644999, 0.3544132, 1.151165, 1, 1, 1, 1, 1,
0.4646527, -0.1176866, 0.4879553, 1, 1, 1, 1, 1,
0.4648859, 0.2775765, 1.945237, 1, 1, 1, 1, 1,
0.4650136, 1.422177, 0.1244368, 1, 1, 1, 1, 1,
0.465723, -0.9735445, 4.1077, 1, 1, 1, 1, 1,
0.465818, 0.3570144, -0.9901214, 0, 0, 1, 1, 1,
0.4673056, -0.4185737, 3.522259, 1, 0, 0, 1, 1,
0.4673193, -0.02871936, 2.731266, 1, 0, 0, 1, 1,
0.4840107, -1.291825, 1.625709, 1, 0, 0, 1, 1,
0.4842264, -1.464388, 2.679902, 1, 0, 0, 1, 1,
0.4932256, -0.1979605, 0.876172, 1, 0, 0, 1, 1,
0.4934124, -0.8834463, 2.38879, 0, 0, 0, 1, 1,
0.4947909, -0.8515363, 3.08248, 0, 0, 0, 1, 1,
0.4966778, -0.4031861, 0.9177112, 0, 0, 0, 1, 1,
0.5012752, 0.0850498, 1.403886, 0, 0, 0, 1, 1,
0.5031436, 1.5725, -0.8390091, 0, 0, 0, 1, 1,
0.5031616, -0.5765983, 1.778304, 0, 0, 0, 1, 1,
0.5067738, -0.7224634, 1.062564, 0, 0, 0, 1, 1,
0.508409, -0.8680009, 1.314335, 1, 1, 1, 1, 1,
0.5090331, -0.2910231, 0.7790883, 1, 1, 1, 1, 1,
0.5156611, 0.6744201, 2.196984, 1, 1, 1, 1, 1,
0.5162808, -0.4841693, 3.688291, 1, 1, 1, 1, 1,
0.5204646, -1.207466, 3.534194, 1, 1, 1, 1, 1,
0.5235397, 2.207841, -0.9002301, 1, 1, 1, 1, 1,
0.5261868, -0.6098478, 2.297355, 1, 1, 1, 1, 1,
0.5350519, 0.1744484, 2.907196, 1, 1, 1, 1, 1,
0.5392654, 1.929194, 0.09358122, 1, 1, 1, 1, 1,
0.5413081, 0.253306, 1.681523, 1, 1, 1, 1, 1,
0.543667, 0.6342083, 1.935786, 1, 1, 1, 1, 1,
0.5459272, -0.7741783, 4.335048, 1, 1, 1, 1, 1,
0.5481588, 1.794585, 2.037413, 1, 1, 1, 1, 1,
0.5496667, 0.06382348, 1.743096, 1, 1, 1, 1, 1,
0.5505816, -0.2177792, 2.021847, 1, 1, 1, 1, 1,
0.5536461, 0.9829658, 0.6921191, 0, 0, 1, 1, 1,
0.554119, 0.2581117, 0.4919791, 1, 0, 0, 1, 1,
0.5554535, 0.6454839, 0.2898615, 1, 0, 0, 1, 1,
0.5590988, 0.4518397, 0.3538564, 1, 0, 0, 1, 1,
0.5600194, -0.4208018, 0.9803076, 1, 0, 0, 1, 1,
0.5616404, -0.5789195, 2.616964, 1, 0, 0, 1, 1,
0.5636325, 1.554277, 0.6744963, 0, 0, 0, 1, 1,
0.5772553, -0.7951856, 3.917087, 0, 0, 0, 1, 1,
0.5789381, -0.1347616, 4.083952, 0, 0, 0, 1, 1,
0.582084, -0.4682403, 4.005774, 0, 0, 0, 1, 1,
0.5826135, -0.05507388, 2.313595, 0, 0, 0, 1, 1,
0.5909722, -0.4093705, 1.17788, 0, 0, 0, 1, 1,
0.5913376, -0.2632547, 2.778579, 0, 0, 0, 1, 1,
0.5915124, 0.4416615, 2.464931, 1, 1, 1, 1, 1,
0.595611, -0.0222384, 0.6991262, 1, 1, 1, 1, 1,
0.6027734, 0.2417307, -0.0007466358, 1, 1, 1, 1, 1,
0.6030903, 0.3167256, 1.266243, 1, 1, 1, 1, 1,
0.6051545, -0.2589044, 2.050624, 1, 1, 1, 1, 1,
0.6059399, 1.00165, 0.2574538, 1, 1, 1, 1, 1,
0.6260325, -0.4301212, 1.968977, 1, 1, 1, 1, 1,
0.6296583, 0.003304174, 2.943907, 1, 1, 1, 1, 1,
0.6314533, -0.07599368, -0.3066303, 1, 1, 1, 1, 1,
0.6326983, 2.285651, 0.9946903, 1, 1, 1, 1, 1,
0.6340817, 0.2091904, 1.110428, 1, 1, 1, 1, 1,
0.6369045, -1.108293, 1.673926, 1, 1, 1, 1, 1,
0.6445881, 2.258917, -0.1551479, 1, 1, 1, 1, 1,
0.6457413, -1.123551, 1.915124, 1, 1, 1, 1, 1,
0.6483603, -2.01597, 4.268664, 1, 1, 1, 1, 1,
0.6491489, 0.09079558, 1.169531, 0, 0, 1, 1, 1,
0.6498629, 0.1696014, -0.1728711, 1, 0, 0, 1, 1,
0.6521513, 0.3901576, 1.66976, 1, 0, 0, 1, 1,
0.6529916, 0.5638101, 0.7209871, 1, 0, 0, 1, 1,
0.658178, 1.315684, 1.420867, 1, 0, 0, 1, 1,
0.658886, -0.9844238, 3.530791, 1, 0, 0, 1, 1,
0.6673002, 0.08759233, 0.008890493, 0, 0, 0, 1, 1,
0.671878, 1.28879, 0.4291808, 0, 0, 0, 1, 1,
0.6764303, 2.445793, 1.24541, 0, 0, 0, 1, 1,
0.6777417, 0.7953609, 0.8089341, 0, 0, 0, 1, 1,
0.6828277, -0.04708182, 0.5592803, 0, 0, 0, 1, 1,
0.6844545, 1.545163, -0.467976, 0, 0, 0, 1, 1,
0.6852617, 0.1080403, 2.396663, 0, 0, 0, 1, 1,
0.6885644, -0.1327321, 0.6139274, 1, 1, 1, 1, 1,
0.7000577, 0.3860448, 1.076216, 1, 1, 1, 1, 1,
0.7031422, 0.3445564, -0.3898263, 1, 1, 1, 1, 1,
0.7051849, 1.535966, 0.3926378, 1, 1, 1, 1, 1,
0.7160655, 0.2637528, 0.2788552, 1, 1, 1, 1, 1,
0.7235163, 0.6003229, 1.740307, 1, 1, 1, 1, 1,
0.7322093, 1.147202, 1.299086, 1, 1, 1, 1, 1,
0.7381912, -0.01107611, 1.563556, 1, 1, 1, 1, 1,
0.7552527, 0.3327256, 0.270425, 1, 1, 1, 1, 1,
0.7553397, 0.1038305, 3.269584, 1, 1, 1, 1, 1,
0.7556342, -1.274646, 1.549435, 1, 1, 1, 1, 1,
0.7581691, -1.472599, 2.151002, 1, 1, 1, 1, 1,
0.7616661, -1.094448, 2.703309, 1, 1, 1, 1, 1,
0.7643126, -0.5144465, 3.807664, 1, 1, 1, 1, 1,
0.7724648, -0.7574229, 2.396972, 1, 1, 1, 1, 1,
0.7734013, 0.4293518, 1.467307, 0, 0, 1, 1, 1,
0.7744132, -0.9284095, 3.418579, 1, 0, 0, 1, 1,
0.7747824, 0.00593532, 1.557559, 1, 0, 0, 1, 1,
0.775837, 0.1751556, 0.2711119, 1, 0, 0, 1, 1,
0.7889091, -1.20992, 2.318719, 1, 0, 0, 1, 1,
0.7899711, 0.6486923, -0.1809505, 1, 0, 0, 1, 1,
0.7931712, -0.4140536, 2.906438, 0, 0, 0, 1, 1,
0.7953607, -1.733588, 3.636411, 0, 0, 0, 1, 1,
0.8083504, -0.6316808, 4.294009, 0, 0, 0, 1, 1,
0.8095556, -0.002302641, 1.175005, 0, 0, 0, 1, 1,
0.8108085, 2.220497, 0.9466634, 0, 0, 0, 1, 1,
0.8120465, 1.994607, 1.999039, 0, 0, 0, 1, 1,
0.8124622, -0.2995853, 3.926082, 0, 0, 0, 1, 1,
0.8165372, 1.485627, 0.1186003, 1, 1, 1, 1, 1,
0.8167065, 0.9656574, -0.2921405, 1, 1, 1, 1, 1,
0.8199852, 0.566974, 0.7636614, 1, 1, 1, 1, 1,
0.8253252, -0.7188351, 2.595631, 1, 1, 1, 1, 1,
0.8279763, 0.523128, 0.4498406, 1, 1, 1, 1, 1,
0.8382025, -0.8831272, 3.159144, 1, 1, 1, 1, 1,
0.8415018, -0.4833792, 1.151272, 1, 1, 1, 1, 1,
0.8463972, -0.5213167, 1.39088, 1, 1, 1, 1, 1,
0.8475689, 1.558106, 1.723103, 1, 1, 1, 1, 1,
0.8495311, 0.3446648, 0.6102049, 1, 1, 1, 1, 1,
0.8530931, 1.3856, 0.05077045, 1, 1, 1, 1, 1,
0.8546387, 0.7662616, 0.439017, 1, 1, 1, 1, 1,
0.8556952, -0.09046698, 3.570512, 1, 1, 1, 1, 1,
0.8628815, -1.254309, 2.72113, 1, 1, 1, 1, 1,
0.8629514, -0.5099915, 1.098138, 1, 1, 1, 1, 1,
0.8645521, 0.6031262, 1.693958, 0, 0, 1, 1, 1,
0.8693029, -0.7451777, 1.967484, 1, 0, 0, 1, 1,
0.8712773, 1.634439, -1.140758, 1, 0, 0, 1, 1,
0.8718122, -0.04799604, 3.372763, 1, 0, 0, 1, 1,
0.8746378, 0.897005, 0.591217, 1, 0, 0, 1, 1,
0.877528, 0.3100833, -0.2112681, 1, 0, 0, 1, 1,
0.8782491, -0.2003125, 2.874518, 0, 0, 0, 1, 1,
0.8785382, -0.5709174, 2.171279, 0, 0, 0, 1, 1,
0.8792079, -0.4384769, 1.10124, 0, 0, 0, 1, 1,
0.882812, -0.4894988, 1.247645, 0, 0, 0, 1, 1,
0.8894863, 0.01919846, 0.9955207, 0, 0, 0, 1, 1,
0.8916997, 0.8384727, 1.975061, 0, 0, 0, 1, 1,
0.8951093, -0.2904672, 1.536376, 0, 0, 0, 1, 1,
0.8954099, 0.8413721, 2.106894, 1, 1, 1, 1, 1,
0.9008081, 0.2818718, 0.753256, 1, 1, 1, 1, 1,
0.9018884, -0.4921495, 2.684815, 1, 1, 1, 1, 1,
0.9033055, 1.767087, 1.726194, 1, 1, 1, 1, 1,
0.9042153, 0.5181355, 1.483286, 1, 1, 1, 1, 1,
0.9279068, -0.5238478, 3.068765, 1, 1, 1, 1, 1,
0.932236, 1.336308, 0.7553491, 1, 1, 1, 1, 1,
0.932362, -0.7072588, 3.071349, 1, 1, 1, 1, 1,
0.9342623, -1.493369, 3.764008, 1, 1, 1, 1, 1,
0.9469323, 0.4080497, 0.9452698, 1, 1, 1, 1, 1,
0.9484844, -1.999393, 2.595258, 1, 1, 1, 1, 1,
0.9551626, 0.8732427, 0.3279747, 1, 1, 1, 1, 1,
0.9564855, 1.915996, -1.730998, 1, 1, 1, 1, 1,
0.9601465, 0.6381508, 0.1690241, 1, 1, 1, 1, 1,
0.9634108, 1.025704, -0.2081427, 1, 1, 1, 1, 1,
0.9654514, -0.07860477, 1.283143, 0, 0, 1, 1, 1,
0.9677163, -0.09481101, 2.480254, 1, 0, 0, 1, 1,
0.9681206, 0.2716939, 0.6167577, 1, 0, 0, 1, 1,
0.970513, -1.848124, 1.752567, 1, 0, 0, 1, 1,
0.9720515, -0.07147621, 2.443893, 1, 0, 0, 1, 1,
0.9721133, 1.45558, 1.304958, 1, 0, 0, 1, 1,
0.9759822, -0.4957664, 1.075101, 0, 0, 0, 1, 1,
0.9789714, -1.080216, 1.383639, 0, 0, 0, 1, 1,
0.9823472, 0.3985481, 1.040233, 0, 0, 0, 1, 1,
0.9870995, 0.07564265, 2.297942, 0, 0, 0, 1, 1,
0.9876917, -0.09964754, 0.3551341, 0, 0, 0, 1, 1,
0.9880326, -0.1216204, 0.3839115, 0, 0, 0, 1, 1,
0.9880824, 1.083589, 2.600452, 0, 0, 0, 1, 1,
0.9881772, -1.274305, 1.501502, 1, 1, 1, 1, 1,
0.9909511, 0.3227797, 0.5809968, 1, 1, 1, 1, 1,
0.9948962, 1.405778, 1.226741, 1, 1, 1, 1, 1,
0.9962167, -0.3525957, 0.002344074, 1, 1, 1, 1, 1,
1.003277, 0.03045928, -0.3973477, 1, 1, 1, 1, 1,
1.011353, -0.7337137, 3.280185, 1, 1, 1, 1, 1,
1.018145, 0.5665736, -0.01433345, 1, 1, 1, 1, 1,
1.022742, -1.197528, 2.234628, 1, 1, 1, 1, 1,
1.024932, -0.3751557, 1.123297, 1, 1, 1, 1, 1,
1.025947, -0.8544726, 3.659192, 1, 1, 1, 1, 1,
1.039714, 1.382641, 0.8632365, 1, 1, 1, 1, 1,
1.040799, -0.5986921, 2.013856, 1, 1, 1, 1, 1,
1.041528, 0.289091, 3.443576, 1, 1, 1, 1, 1,
1.045959, 0.3065427, 1.358747, 1, 1, 1, 1, 1,
1.04728, -0.6795212, 2.561588, 1, 1, 1, 1, 1,
1.051788, -1.211698, 1.716972, 0, 0, 1, 1, 1,
1.053715, -1.428338, 1.914693, 1, 0, 0, 1, 1,
1.05611, 1.056533, 1.812796, 1, 0, 0, 1, 1,
1.063, 0.7275195, 2.542458, 1, 0, 0, 1, 1,
1.063962, 0.03955097, 0.8035925, 1, 0, 0, 1, 1,
1.069931, 1.146102, 0.2408817, 1, 0, 0, 1, 1,
1.072436, 1.394458, 0.03528154, 0, 0, 0, 1, 1,
1.072517, -0.7003285, 1.749171, 0, 0, 0, 1, 1,
1.074566, -0.5816827, 2.224452, 0, 0, 0, 1, 1,
1.091344, -1.439737, 1.605447, 0, 0, 0, 1, 1,
1.096169, -0.3749106, 3.209707, 0, 0, 0, 1, 1,
1.104539, -1.452904, 1.269908, 0, 0, 0, 1, 1,
1.112351, -2.097519, 2.564004, 0, 0, 0, 1, 1,
1.119484, 0.6858866, 1.248005, 1, 1, 1, 1, 1,
1.124552, -0.6401784, 1.844028, 1, 1, 1, 1, 1,
1.135182, -2.139803, 2.023816, 1, 1, 1, 1, 1,
1.13763, -1.712301, 2.529895, 1, 1, 1, 1, 1,
1.145231, 0.550324, 1.393077, 1, 1, 1, 1, 1,
1.146616, 0.5090092, 1.239102, 1, 1, 1, 1, 1,
1.14664, -0.2770401, 1.179275, 1, 1, 1, 1, 1,
1.152791, 2.442664, -0.37228, 1, 1, 1, 1, 1,
1.158691, -0.6371648, 0.6840922, 1, 1, 1, 1, 1,
1.160726, 0.2469689, -0.1352085, 1, 1, 1, 1, 1,
1.161136, -1.209226, 3.448595, 1, 1, 1, 1, 1,
1.167251, -0.1174697, 2.033064, 1, 1, 1, 1, 1,
1.180405, -0.2550403, 1.901411, 1, 1, 1, 1, 1,
1.185767, 0.2768806, 0.2017422, 1, 1, 1, 1, 1,
1.186613, 0.111056, 3.827669, 1, 1, 1, 1, 1,
1.18684, -0.2699625, 2.479725, 0, 0, 1, 1, 1,
1.188511, 1.277225, -0.1055909, 1, 0, 0, 1, 1,
1.192895, 0.006364468, 3.303809, 1, 0, 0, 1, 1,
1.198295, 0.5505847, 0.3323164, 1, 0, 0, 1, 1,
1.211636, -1.689013, 2.690341, 1, 0, 0, 1, 1,
1.229865, 0.03315449, 0.9581851, 1, 0, 0, 1, 1,
1.230388, -0.4460314, 1.766217, 0, 0, 0, 1, 1,
1.240517, 0.3674189, 0.829657, 0, 0, 0, 1, 1,
1.245054, -1.7534, 2.415955, 0, 0, 0, 1, 1,
1.257385, 0.3892519, 0.7033961, 0, 0, 0, 1, 1,
1.261841, 1.340847, 0.8492716, 0, 0, 0, 1, 1,
1.2622, -1.116913, 2.385633, 0, 0, 0, 1, 1,
1.264783, 0.6007059, 0.3464483, 0, 0, 0, 1, 1,
1.265647, -0.6312853, 0.450235, 1, 1, 1, 1, 1,
1.265993, -0.6058127, 2.204981, 1, 1, 1, 1, 1,
1.275801, 1.277063, 1.306828, 1, 1, 1, 1, 1,
1.277642, -1.232761, 2.615477, 1, 1, 1, 1, 1,
1.279792, -0.8526406, 2.679487, 1, 1, 1, 1, 1,
1.287481, -0.5937954, 2.053186, 1, 1, 1, 1, 1,
1.288569, -0.3160097, 3.099944, 1, 1, 1, 1, 1,
1.294968, 1.102953, 1.218715, 1, 1, 1, 1, 1,
1.297843, 0.6018389, 0.1158594, 1, 1, 1, 1, 1,
1.301158, -0.7702379, 1.883928, 1, 1, 1, 1, 1,
1.302495, 0.3300375, 1.055944, 1, 1, 1, 1, 1,
1.303904, -0.7126852, 1.616428, 1, 1, 1, 1, 1,
1.306441, -0.1394899, 1.823293, 1, 1, 1, 1, 1,
1.315656, 0.6176603, 1.12065, 1, 1, 1, 1, 1,
1.318708, -0.3273374, 2.263546, 1, 1, 1, 1, 1,
1.322486, -0.2095464, 2.782579, 0, 0, 1, 1, 1,
1.334359, 0.9939374, 0.1742595, 1, 0, 0, 1, 1,
1.334403, -0.498989, 2.0146, 1, 0, 0, 1, 1,
1.343531, -0.08969811, 2.215897, 1, 0, 0, 1, 1,
1.344533, -0.6526219, 0.6354197, 1, 0, 0, 1, 1,
1.354258, -0.8334671, 3.410002, 1, 0, 0, 1, 1,
1.354985, -0.9148979, 2.703859, 0, 0, 0, 1, 1,
1.357769, -1.476559, 2.241698, 0, 0, 0, 1, 1,
1.370427, -0.3347802, 1.576075, 0, 0, 0, 1, 1,
1.373132, -1.456845, 3.292733, 0, 0, 0, 1, 1,
1.377302, 1.315102, 0.8030031, 0, 0, 0, 1, 1,
1.379943, 2.01136, 1.175377, 0, 0, 0, 1, 1,
1.385301, 0.8274413, 1.75308, 0, 0, 0, 1, 1,
1.397612, -1.585265, 2.396595, 1, 1, 1, 1, 1,
1.404221, -0.1267743, 1.938165, 1, 1, 1, 1, 1,
1.406346, 0.7976998, 1.16446, 1, 1, 1, 1, 1,
1.417809, -1.551201, 2.239955, 1, 1, 1, 1, 1,
1.421209, -0.08948757, 1.487359, 1, 1, 1, 1, 1,
1.435343, -1.572359, 2.87062, 1, 1, 1, 1, 1,
1.444983, 2.510145, 0.2890333, 1, 1, 1, 1, 1,
1.459472, -0.09217408, 0.6512839, 1, 1, 1, 1, 1,
1.480083, -0.4156669, 0.3712133, 1, 1, 1, 1, 1,
1.493859, 0.04007043, 1.939375, 1, 1, 1, 1, 1,
1.494075, 0.9182642, -0.9650509, 1, 1, 1, 1, 1,
1.496891, -1.929454, 1.269124, 1, 1, 1, 1, 1,
1.499813, -0.9358802, 2.115526, 1, 1, 1, 1, 1,
1.520831, -1.835603, 3.124632, 1, 1, 1, 1, 1,
1.522322, -0.6823786, 2.339078, 1, 1, 1, 1, 1,
1.53384, 0.6962339, 2.319139, 0, 0, 1, 1, 1,
1.535149, 0.5361229, 1.799507, 1, 0, 0, 1, 1,
1.544862, 1.931615, 1.093021, 1, 0, 0, 1, 1,
1.545277, 0.4931054, 1.377124, 1, 0, 0, 1, 1,
1.54993, -0.09539902, 0.8901899, 1, 0, 0, 1, 1,
1.553529, -1.057712, 0.7561353, 1, 0, 0, 1, 1,
1.558457, 1.367493, -0.08845947, 0, 0, 0, 1, 1,
1.570112, 2.21, 1.042176, 0, 0, 0, 1, 1,
1.570941, -1.66934, 3.043289, 0, 0, 0, 1, 1,
1.577552, -0.8708977, 1.920707, 0, 0, 0, 1, 1,
1.585208, 0.450383, 2.029484, 0, 0, 0, 1, 1,
1.593619, -1.521213, 2.36722, 0, 0, 0, 1, 1,
1.596011, -1.632276, 2.436485, 0, 0, 0, 1, 1,
1.599975, 1.012799, 0.6786574, 1, 1, 1, 1, 1,
1.623225, -0.2500957, 2.480163, 1, 1, 1, 1, 1,
1.633955, 0.3270099, 0.5240726, 1, 1, 1, 1, 1,
1.64801, 0.5742247, 1.169846, 1, 1, 1, 1, 1,
1.65486, 1.206549, 0.6671026, 1, 1, 1, 1, 1,
1.655124, 0.2875205, 0.2798223, 1, 1, 1, 1, 1,
1.655982, -0.36575, 1.33858, 1, 1, 1, 1, 1,
1.663661, -0.5461079, 0.8588682, 1, 1, 1, 1, 1,
1.675153, -0.9286786, 3.019916, 1, 1, 1, 1, 1,
1.69105, 1.320694, 0.6626445, 1, 1, 1, 1, 1,
1.692748, -1.55983, 3.629186, 1, 1, 1, 1, 1,
1.706273, 0.234277, 2.221975, 1, 1, 1, 1, 1,
1.742718, -0.7651806, 1.693047, 1, 1, 1, 1, 1,
1.74443, 1.355778, 1.007513, 1, 1, 1, 1, 1,
1.745259, 0.7520565, 0.4320375, 1, 1, 1, 1, 1,
1.747232, 0.8255146, 0.5506333, 0, 0, 1, 1, 1,
1.784084, 0.9806337, 1.265835, 1, 0, 0, 1, 1,
1.786179, 0.7248356, 2.449762, 1, 0, 0, 1, 1,
1.791384, -0.6564884, 2.465514, 1, 0, 0, 1, 1,
1.805275, -0.6641558, 1.530795, 1, 0, 0, 1, 1,
1.847461, 1.241566, -0.40732, 1, 0, 0, 1, 1,
1.853586, 1.065152, 1.674864, 0, 0, 0, 1, 1,
1.861187, 0.05839463, 0.7839115, 0, 0, 0, 1, 1,
1.86163, 1.005372, -0.195207, 0, 0, 0, 1, 1,
1.864583, 0.578817, 2.010715, 0, 0, 0, 1, 1,
1.878604, -1.222205, 2.218347, 0, 0, 0, 1, 1,
1.898167, 0.4685895, 0.05934083, 0, 0, 0, 1, 1,
1.90229, 0.9164867, -0.02102879, 0, 0, 0, 1, 1,
1.948995, -2.024445, 4.074736, 1, 1, 1, 1, 1,
1.95707, -1.645965, 1.399953, 1, 1, 1, 1, 1,
1.967783, 0.4684997, 1.299791, 1, 1, 1, 1, 1,
1.998077, 0.9274033, 0.934094, 1, 1, 1, 1, 1,
2.016179, -0.08385866, 0.9145685, 1, 1, 1, 1, 1,
2.023011, -0.4832762, 1.657718, 1, 1, 1, 1, 1,
2.035362, -1.80672, 0.9528027, 1, 1, 1, 1, 1,
2.039594, -0.1999278, 4.835136, 1, 1, 1, 1, 1,
2.060536, -0.3844656, 2.404135, 1, 1, 1, 1, 1,
2.061624, 0.521045, 1.615044, 1, 1, 1, 1, 1,
2.069082, 0.7856527, 0.181482, 1, 1, 1, 1, 1,
2.077011, 0.4904356, 1.584903, 1, 1, 1, 1, 1,
2.08044, 1.350355, -2.079368, 1, 1, 1, 1, 1,
2.091965, -0.5793357, -0.03584224, 1, 1, 1, 1, 1,
2.097108, -1.435098, 3.583159, 1, 1, 1, 1, 1,
2.155507, -1.482992, 1.043976, 0, 0, 1, 1, 1,
2.185395, -2.205303, 2.150813, 1, 0, 0, 1, 1,
2.243189, 0.5123609, 1.416397, 1, 0, 0, 1, 1,
2.299675, 0.04980753, 1.722028, 1, 0, 0, 1, 1,
2.318823, 0.3332126, -1.508671, 1, 0, 0, 1, 1,
2.324065, 0.312299, 2.04889, 1, 0, 0, 1, 1,
2.377894, -0.8701428, 1.177724, 0, 0, 0, 1, 1,
2.380998, -2.006721, 1.973137, 0, 0, 0, 1, 1,
2.467408, 0.7753929, 2.114403, 0, 0, 0, 1, 1,
2.536884, 0.8652005, 1.316652, 0, 0, 0, 1, 1,
2.61755, -1.271623, 2.286543, 0, 0, 0, 1, 1,
2.671371, -1.135683, 2.041612, 0, 0, 0, 1, 1,
2.67157, 0.01307504, 0.03970071, 0, 0, 0, 1, 1,
2.708337, 2.007546, 0.1234208, 1, 1, 1, 1, 1,
2.825164, -0.8372192, 2.31546, 1, 1, 1, 1, 1,
2.883502, -0.1054748, 0.3272632, 1, 1, 1, 1, 1,
2.935188, 0.6343831, 1.722768, 1, 1, 1, 1, 1,
2.947902, 0.5372185, 0.8782197, 1, 1, 1, 1, 1,
2.962278, 1.161813, -0.1399053, 1, 1, 1, 1, 1,
3.016764, 0.03663691, 2.669408, 1, 1, 1, 1, 1
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
var radius = 8.814231;
var distance = 30.95961;
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
mvMatrix.translate( -0.05519724, 0.01872492, -0.09576702 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -30.95961);
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
