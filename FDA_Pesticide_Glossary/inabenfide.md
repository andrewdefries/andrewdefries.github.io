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
-2.838191, 1.130058, -1.035212, 1, 0, 0, 1,
-2.721649, -0.0818181, -3.713973, 1, 0.007843138, 0, 1,
-2.716564, 0.1600317, -2.206792, 1, 0.01176471, 0, 1,
-2.696703, 0.05008722, -1.161548, 1, 0.01960784, 0, 1,
-2.659368, -1.174351, -2.567757, 1, 0.02352941, 0, 1,
-2.617315, 0.9072132, -0.8595394, 1, 0.03137255, 0, 1,
-2.603452, -0.5595822, -1.347757, 1, 0.03529412, 0, 1,
-2.573495, -0.6939087, -1.897709, 1, 0.04313726, 0, 1,
-2.569828, -0.655862, -2.647023, 1, 0.04705882, 0, 1,
-2.545406, -1.053602, -4.486606, 1, 0.05490196, 0, 1,
-2.529597, 0.5952458, -2.552608, 1, 0.05882353, 0, 1,
-2.492758, -0.6127267, -0.2431803, 1, 0.06666667, 0, 1,
-2.414603, -1.94769, -2.841584, 1, 0.07058824, 0, 1,
-2.298875, -1.209962, -2.553613, 1, 0.07843138, 0, 1,
-2.270881, 1.296142, 2.013896, 1, 0.08235294, 0, 1,
-2.253418, 0.6515628, -1.153688, 1, 0.09019608, 0, 1,
-2.191212, -1.880653, -1.015945, 1, 0.09411765, 0, 1,
-2.138106, -0.427652, -1.99544, 1, 0.1019608, 0, 1,
-2.127646, 1.225334, -1.605974, 1, 0.1098039, 0, 1,
-2.124422, 0.2240462, -1.84835, 1, 0.1137255, 0, 1,
-2.112766, -0.224846, -1.690925, 1, 0.1215686, 0, 1,
-2.056367, -0.3970042, -2.356133, 1, 0.1254902, 0, 1,
-2.05379, 0.9283044, 0.6370679, 1, 0.1333333, 0, 1,
-2.047898, -1.150119, -2.855227, 1, 0.1372549, 0, 1,
-2.043585, -0.9487289, -3.085189, 1, 0.145098, 0, 1,
-2.043412, 0.2455712, -2.026547, 1, 0.1490196, 0, 1,
-2.037563, -0.6190972, -1.107701, 1, 0.1568628, 0, 1,
-2.03547, -1.545802, -2.858608, 1, 0.1607843, 0, 1,
-2.026679, -0.1817901, -2.291747, 1, 0.1686275, 0, 1,
-1.986623, -0.6279632, -2.708193, 1, 0.172549, 0, 1,
-1.979828, 1.611934, -0.5563484, 1, 0.1803922, 0, 1,
-1.972477, 0.2954139, -1.180554, 1, 0.1843137, 0, 1,
-1.968438, 0.2500163, -0.362886, 1, 0.1921569, 0, 1,
-1.95598, 0.3806072, -1.575086, 1, 0.1960784, 0, 1,
-1.955804, -0.5028117, -1.406264, 1, 0.2039216, 0, 1,
-1.932139, 2.535306, -0.3338487, 1, 0.2117647, 0, 1,
-1.917693, -0.6562749, -1.040538, 1, 0.2156863, 0, 1,
-1.914592, -0.2682436, -0.977263, 1, 0.2235294, 0, 1,
-1.89656, -0.5986809, -0.6225022, 1, 0.227451, 0, 1,
-1.876734, 1.013354, -0.1289499, 1, 0.2352941, 0, 1,
-1.872976, 0.8761355, -2.978639, 1, 0.2392157, 0, 1,
-1.861371, -1.346742, -4.498979, 1, 0.2470588, 0, 1,
-1.852002, 1.469069, -1.036595, 1, 0.2509804, 0, 1,
-1.824127, -0.07067528, -2.584528, 1, 0.2588235, 0, 1,
-1.797448, 0.3432289, -0.5933698, 1, 0.2627451, 0, 1,
-1.790565, -1.808748, -1.755505, 1, 0.2705882, 0, 1,
-1.786284, 0.2627066, -0.5289961, 1, 0.2745098, 0, 1,
-1.783451, -0.7356776, -2.994843, 1, 0.282353, 0, 1,
-1.771139, 0.2767551, -0.1266435, 1, 0.2862745, 0, 1,
-1.746652, -1.354023, -2.240902, 1, 0.2941177, 0, 1,
-1.716925, -1.498578, -1.620147, 1, 0.3019608, 0, 1,
-1.70523, 0.3654479, -1.270823, 1, 0.3058824, 0, 1,
-1.695193, -0.110481, -2.372616, 1, 0.3137255, 0, 1,
-1.691248, 0.3739909, -2.56629, 1, 0.3176471, 0, 1,
-1.67362, -0.5133265, -0.8099257, 1, 0.3254902, 0, 1,
-1.661273, 0.2191029, -1.685143, 1, 0.3294118, 0, 1,
-1.656973, -1.513986, -1.880653, 1, 0.3372549, 0, 1,
-1.648648, -0.5728915, -1.58933, 1, 0.3411765, 0, 1,
-1.648506, 0.2403091, -2.905896, 1, 0.3490196, 0, 1,
-1.641518, -0.6545155, -2.700948, 1, 0.3529412, 0, 1,
-1.636493, 0.7627172, -1.067017, 1, 0.3607843, 0, 1,
-1.636234, 1.360071, -0.5832192, 1, 0.3647059, 0, 1,
-1.619693, 0.2676502, -2.064894, 1, 0.372549, 0, 1,
-1.604657, -1.12431, -2.346166, 1, 0.3764706, 0, 1,
-1.594696, -1.230678, -3.540102, 1, 0.3843137, 0, 1,
-1.567409, 0.1297411, -2.044558, 1, 0.3882353, 0, 1,
-1.566621, -1.300686, -3.195481, 1, 0.3960784, 0, 1,
-1.565869, -0.8378406, -2.001691, 1, 0.4039216, 0, 1,
-1.558447, -0.1956104, -1.670852, 1, 0.4078431, 0, 1,
-1.537213, 1.162918, 0.2748976, 1, 0.4156863, 0, 1,
-1.535998, -0.1711532, -2.690843, 1, 0.4196078, 0, 1,
-1.534822, -0.7161544, -3.133136, 1, 0.427451, 0, 1,
-1.530116, -0.4837742, -0.875268, 1, 0.4313726, 0, 1,
-1.511459, -0.846691, -1.327909, 1, 0.4392157, 0, 1,
-1.505799, -0.2175688, -2.23641, 1, 0.4431373, 0, 1,
-1.492311, -0.6422099, -2.998497, 1, 0.4509804, 0, 1,
-1.479498, 0.5156645, -2.003729, 1, 0.454902, 0, 1,
-1.472039, 0.3488437, -0.1663444, 1, 0.4627451, 0, 1,
-1.469004, 0.2876877, -2.138858, 1, 0.4666667, 0, 1,
-1.465162, -0.1292891, -0.8500187, 1, 0.4745098, 0, 1,
-1.46395, -1.149305, -1.171498, 1, 0.4784314, 0, 1,
-1.457411, 0.3476462, -0.3028197, 1, 0.4862745, 0, 1,
-1.448462, -0.05396634, -0.1312767, 1, 0.4901961, 0, 1,
-1.438117, 1.005007, -1.061882, 1, 0.4980392, 0, 1,
-1.433966, 1.363084, -1.029765, 1, 0.5058824, 0, 1,
-1.427791, 0.9306502, -1.732279, 1, 0.509804, 0, 1,
-1.425503, -0.7248323, -0.7809903, 1, 0.5176471, 0, 1,
-1.422982, 0.7636835, -1.571306, 1, 0.5215687, 0, 1,
-1.418082, 1.078099, -0.1127954, 1, 0.5294118, 0, 1,
-1.417298, -0.7952381, -0.6936505, 1, 0.5333334, 0, 1,
-1.388815, -0.9636575, -1.862306, 1, 0.5411765, 0, 1,
-1.377001, 0.6717599, -2.051647, 1, 0.5450981, 0, 1,
-1.37475, -1.683613, -3.82546, 1, 0.5529412, 0, 1,
-1.36898, 1.349313, 0.1897038, 1, 0.5568628, 0, 1,
-1.366658, -0.4108516, -2.46738, 1, 0.5647059, 0, 1,
-1.346603, 0.7021241, -0.3948573, 1, 0.5686275, 0, 1,
-1.336667, -0.1598758, -1.281203, 1, 0.5764706, 0, 1,
-1.332072, -1.235586, -2.72571, 1, 0.5803922, 0, 1,
-1.313993, 1.549859, -0.446053, 1, 0.5882353, 0, 1,
-1.310782, -1.086823, -1.24768, 1, 0.5921569, 0, 1,
-1.307402, -1.285429, -1.786341, 1, 0.6, 0, 1,
-1.302769, -1.756806, -1.028635, 1, 0.6078432, 0, 1,
-1.301013, 0.4032754, -1.431446, 1, 0.6117647, 0, 1,
-1.29857, 1.069072, -0.5633507, 1, 0.6196079, 0, 1,
-1.278111, 0.09017552, 0.1859192, 1, 0.6235294, 0, 1,
-1.275432, -0.8715209, -2.75204, 1, 0.6313726, 0, 1,
-1.272243, -0.4177914, -3.280269, 1, 0.6352941, 0, 1,
-1.268985, 0.1048745, -1.578066, 1, 0.6431373, 0, 1,
-1.267013, 0.7348028, -0.5701366, 1, 0.6470588, 0, 1,
-1.265627, 0.9111083, -2.702044, 1, 0.654902, 0, 1,
-1.264062, -0.5922122, -2.011381, 1, 0.6588235, 0, 1,
-1.255429, -0.2215447, -1.717995, 1, 0.6666667, 0, 1,
-1.249293, 1.554756, 0.5741019, 1, 0.6705883, 0, 1,
-1.220497, 0.665957, -0.1336321, 1, 0.6784314, 0, 1,
-1.218618, -0.0608774, -1.399687, 1, 0.682353, 0, 1,
-1.212944, -0.7918444, -1.715649, 1, 0.6901961, 0, 1,
-1.210058, -0.9164353, -2.545941, 1, 0.6941177, 0, 1,
-1.204697, -0.05268125, -1.644467, 1, 0.7019608, 0, 1,
-1.20293, 0.5636335, -3.285095, 1, 0.7098039, 0, 1,
-1.201563, -2.392206, -3.52048, 1, 0.7137255, 0, 1,
-1.20146, 0.5902673, -0.6494192, 1, 0.7215686, 0, 1,
-1.200553, 0.07300056, -1.687518, 1, 0.7254902, 0, 1,
-1.199249, -0.09862852, -0.4666065, 1, 0.7333333, 0, 1,
-1.191552, 0.6045924, -2.609385, 1, 0.7372549, 0, 1,
-1.189675, -0.2311911, -2.800858, 1, 0.7450981, 0, 1,
-1.183932, 1.282007, -0.1943514, 1, 0.7490196, 0, 1,
-1.183903, -0.4177361, -2.734616, 1, 0.7568628, 0, 1,
-1.162355, 1.190935, -2.192857, 1, 0.7607843, 0, 1,
-1.15879, 2.063381, -0.8224397, 1, 0.7686275, 0, 1,
-1.149316, 0.766649, -0.9551334, 1, 0.772549, 0, 1,
-1.146343, -0.4594964, -0.7115036, 1, 0.7803922, 0, 1,
-1.136875, 0.03815297, -1.626969, 1, 0.7843137, 0, 1,
-1.13617, -0.7291716, -1.522814, 1, 0.7921569, 0, 1,
-1.132885, -0.3725613, -3.565783, 1, 0.7960784, 0, 1,
-1.132613, -1.191926, -3.211831, 1, 0.8039216, 0, 1,
-1.128893, -2.29812, -2.219886, 1, 0.8117647, 0, 1,
-1.12359, 0.4232159, -0.8760453, 1, 0.8156863, 0, 1,
-1.118951, 0.2145848, -1.612147, 1, 0.8235294, 0, 1,
-1.116852, 0.9052873, -0.9784556, 1, 0.827451, 0, 1,
-1.109661, 1.978175, 0.4659647, 1, 0.8352941, 0, 1,
-1.106014, 0.4475693, -1.545497, 1, 0.8392157, 0, 1,
-1.102592, -0.113126, -0.5537223, 1, 0.8470588, 0, 1,
-1.097562, -0.6465397, -0.9612191, 1, 0.8509804, 0, 1,
-1.082568, 1.042779, -0.6020459, 1, 0.8588235, 0, 1,
-1.078152, 1.891002, -0.07799377, 1, 0.8627451, 0, 1,
-1.072666, -1.436407, -0.6273444, 1, 0.8705882, 0, 1,
-1.071473, 1.037704, -1.399626, 1, 0.8745098, 0, 1,
-1.068119, -0.120104, -0.1390288, 1, 0.8823529, 0, 1,
-1.066785, 0.2296432, -2.525014, 1, 0.8862745, 0, 1,
-1.049004, 0.6515839, -1.547259, 1, 0.8941177, 0, 1,
-1.039297, 0.5492395, 0.757092, 1, 0.8980392, 0, 1,
-1.03093, -0.7957153, -2.030334, 1, 0.9058824, 0, 1,
-1.030856, -0.03144578, -0.5808275, 1, 0.9137255, 0, 1,
-1.029119, 0.3733859, -1.195785, 1, 0.9176471, 0, 1,
-1.026171, -0.507181, -0.9058622, 1, 0.9254902, 0, 1,
-1.023582, -0.7563213, -2.664209, 1, 0.9294118, 0, 1,
-1.020321, -0.7709461, -2.083569, 1, 0.9372549, 0, 1,
-1.01678, 1.192257, 1.548625, 1, 0.9411765, 0, 1,
-1.015787, 1.367561, -1.264845, 1, 0.9490196, 0, 1,
-1.013293, 0.0834889, -1.786182, 1, 0.9529412, 0, 1,
-1.012291, -0.5292265, -2.944518, 1, 0.9607843, 0, 1,
-1.002177, -1.806361, -4.024137, 1, 0.9647059, 0, 1,
-0.9979563, -0.1740151, -1.641011, 1, 0.972549, 0, 1,
-0.9924836, -0.1928711, -0.75506, 1, 0.9764706, 0, 1,
-0.9802691, 0.2634853, -1.391457, 1, 0.9843137, 0, 1,
-0.9776183, -0.439826, -2.482549, 1, 0.9882353, 0, 1,
-0.9774482, 0.944355, -0.2233587, 1, 0.9960784, 0, 1,
-0.9758503, 2.313842, -0.7771303, 0.9960784, 1, 0, 1,
-0.9747784, -1.907449, -1.852989, 0.9921569, 1, 0, 1,
-0.9703982, 0.6839758, 0.07638501, 0.9843137, 1, 0, 1,
-0.9687793, -0.1405536, -1.901813, 0.9803922, 1, 0, 1,
-0.9678692, 0.487911, -1.851792, 0.972549, 1, 0, 1,
-0.9638328, 0.3341474, -1.283081, 0.9686275, 1, 0, 1,
-0.9524714, -1.073856, -4.579289, 0.9607843, 1, 0, 1,
-0.9520202, -0.4741264, -2.073768, 0.9568627, 1, 0, 1,
-0.9518078, -0.6095579, -2.778682, 0.9490196, 1, 0, 1,
-0.9508587, 1.805345, 1.146363, 0.945098, 1, 0, 1,
-0.946039, -0.4885643, -2.827211, 0.9372549, 1, 0, 1,
-0.9402614, 0.944634, -1.866282, 0.9333333, 1, 0, 1,
-0.928742, 0.608271, -1.666056, 0.9254902, 1, 0, 1,
-0.928418, -0.3541764, -2.14349, 0.9215686, 1, 0, 1,
-0.923642, 0.16362, -2.202849, 0.9137255, 1, 0, 1,
-0.9232351, -0.6791343, -2.621097, 0.9098039, 1, 0, 1,
-0.9225571, 1.247167, -0.9224107, 0.9019608, 1, 0, 1,
-0.9195136, 0.1866836, -1.865677, 0.8941177, 1, 0, 1,
-0.9160454, 0.6308154, -0.6430358, 0.8901961, 1, 0, 1,
-0.9159411, -0.3732861, -1.757366, 0.8823529, 1, 0, 1,
-0.9088202, 0.253209, -2.114395, 0.8784314, 1, 0, 1,
-0.9063867, -0.1836903, -0.9373748, 0.8705882, 1, 0, 1,
-0.9037107, 1.073869, -0.5183472, 0.8666667, 1, 0, 1,
-0.9027866, 0.4239279, -0.3234417, 0.8588235, 1, 0, 1,
-0.9012725, 0.1703167, -2.349063, 0.854902, 1, 0, 1,
-0.8969397, 1.213394, 0.3502522, 0.8470588, 1, 0, 1,
-0.888181, 0.8028744, -0.0003981419, 0.8431373, 1, 0, 1,
-0.8836144, 0.1928179, -0.6282749, 0.8352941, 1, 0, 1,
-0.8754679, 1.181366, -0.3950486, 0.8313726, 1, 0, 1,
-0.8734646, 0.5936009, 0.3770618, 0.8235294, 1, 0, 1,
-0.866765, 0.8550526, -0.1313375, 0.8196079, 1, 0, 1,
-0.8615603, 2.107659, -1.234668, 0.8117647, 1, 0, 1,
-0.8615419, 2.05337, -0.8239174, 0.8078431, 1, 0, 1,
-0.8574149, -0.5023981, -2.482164, 0.8, 1, 0, 1,
-0.8553349, -0.5930281, -3.07602, 0.7921569, 1, 0, 1,
-0.8424207, -1.361511, -1.408951, 0.7882353, 1, 0, 1,
-0.8284056, -0.120415, -2.64668, 0.7803922, 1, 0, 1,
-0.8249366, -0.5863325, -2.184458, 0.7764706, 1, 0, 1,
-0.8159524, -0.724587, -1.640978, 0.7686275, 1, 0, 1,
-0.8079748, -1.028164, -2.236605, 0.7647059, 1, 0, 1,
-0.8075366, -0.5451389, -2.599474, 0.7568628, 1, 0, 1,
-0.8005446, -1.356707, -0.9495256, 0.7529412, 1, 0, 1,
-0.799156, -0.8192636, -2.305634, 0.7450981, 1, 0, 1,
-0.7950451, -1.796655, -2.515155, 0.7411765, 1, 0, 1,
-0.7940403, 0.2727776, -0.989803, 0.7333333, 1, 0, 1,
-0.7844324, 0.484791, -1.533962, 0.7294118, 1, 0, 1,
-0.7815594, -0.555262, -2.371097, 0.7215686, 1, 0, 1,
-0.7793103, 1.257959, -0.4566969, 0.7176471, 1, 0, 1,
-0.7761946, 0.6136329, -1.752, 0.7098039, 1, 0, 1,
-0.7741338, -1.494111, -3.931103, 0.7058824, 1, 0, 1,
-0.7700916, -1.697097, -0.7631679, 0.6980392, 1, 0, 1,
-0.7666164, -1.708246, -3.766314, 0.6901961, 1, 0, 1,
-0.7597181, 1.419187, -1.522966, 0.6862745, 1, 0, 1,
-0.7556917, 0.4242996, -1.870263, 0.6784314, 1, 0, 1,
-0.7554964, 1.607995, 0.4712247, 0.6745098, 1, 0, 1,
-0.7497665, -0.01413659, -3.772915, 0.6666667, 1, 0, 1,
-0.7485023, 0.2964244, -0.4225244, 0.6627451, 1, 0, 1,
-0.7384917, 0.7940137, -0.1488423, 0.654902, 1, 0, 1,
-0.7372378, -1.06638, -0.8991292, 0.6509804, 1, 0, 1,
-0.7350314, 0.4678993, -0.3055284, 0.6431373, 1, 0, 1,
-0.7340468, 1.035275, 0.08938794, 0.6392157, 1, 0, 1,
-0.733012, 0.8720946, -1.290109, 0.6313726, 1, 0, 1,
-0.7297133, 0.6936335, 0.1933013, 0.627451, 1, 0, 1,
-0.7214326, 0.6957625, -0.3533472, 0.6196079, 1, 0, 1,
-0.7169339, 0.386233, -0.4009681, 0.6156863, 1, 0, 1,
-0.715786, -1.216894, -2.443705, 0.6078432, 1, 0, 1,
-0.7154657, 1.509211, -0.1111557, 0.6039216, 1, 0, 1,
-0.7147255, -0.1010538, 0.02637861, 0.5960785, 1, 0, 1,
-0.7138491, 0.1210854, 0.2516648, 0.5882353, 1, 0, 1,
-0.7097721, 0.320981, -1.776721, 0.5843138, 1, 0, 1,
-0.7084764, -0.6111283, -3.054877, 0.5764706, 1, 0, 1,
-0.7062334, 0.3804842, -0.5592512, 0.572549, 1, 0, 1,
-0.7017406, 0.9726414, -1.267489, 0.5647059, 1, 0, 1,
-0.7001753, -0.9813072, -2.409258, 0.5607843, 1, 0, 1,
-0.6995308, -1.161218, -1.661413, 0.5529412, 1, 0, 1,
-0.6948739, 1.066783, -0.7164022, 0.5490196, 1, 0, 1,
-0.6906669, 1.580555, -0.4205238, 0.5411765, 1, 0, 1,
-0.682835, -1.353705, -2.573838, 0.5372549, 1, 0, 1,
-0.6802319, 0.05499066, -2.838058, 0.5294118, 1, 0, 1,
-0.6771417, -1.222767, -1.742126, 0.5254902, 1, 0, 1,
-0.6748745, -1.99114, -2.923271, 0.5176471, 1, 0, 1,
-0.6736584, -0.05067273, -1.098485, 0.5137255, 1, 0, 1,
-0.6734567, -0.882748, -4.596877, 0.5058824, 1, 0, 1,
-0.6681772, 0.5085632, -1.514749, 0.5019608, 1, 0, 1,
-0.6647303, 1.3049, -1.035956, 0.4941176, 1, 0, 1,
-0.6608225, 1.137111, -0.9528453, 0.4862745, 1, 0, 1,
-0.6580694, -0.2667321, -3.307418, 0.4823529, 1, 0, 1,
-0.6570861, 0.26735, -1.550972, 0.4745098, 1, 0, 1,
-0.6555102, -0.283888, -1.884036, 0.4705882, 1, 0, 1,
-0.6524177, 0.4041113, -1.098851, 0.4627451, 1, 0, 1,
-0.6448466, -0.3796985, -2.395077, 0.4588235, 1, 0, 1,
-0.6421979, -1.33543, -3.117105, 0.4509804, 1, 0, 1,
-0.6414816, -1.174764, -2.071164, 0.4470588, 1, 0, 1,
-0.639317, 1.642661, 0.5954063, 0.4392157, 1, 0, 1,
-0.6380089, -0.3214144, -1.883413, 0.4352941, 1, 0, 1,
-0.635066, -1.407533, -2.107082, 0.427451, 1, 0, 1,
-0.6346288, -2.100105, -3.820905, 0.4235294, 1, 0, 1,
-0.6319175, -1.117886, -3.188149, 0.4156863, 1, 0, 1,
-0.6318922, -0.006771198, -2.367629, 0.4117647, 1, 0, 1,
-0.6316948, -1.221857, -2.07311, 0.4039216, 1, 0, 1,
-0.6315309, 0.6896821, -0.08452238, 0.3960784, 1, 0, 1,
-0.6294309, -1.440194, -3.94601, 0.3921569, 1, 0, 1,
-0.6245838, -0.0429555, -0.9078744, 0.3843137, 1, 0, 1,
-0.6243086, -2.472056, -2.004095, 0.3803922, 1, 0, 1,
-0.623576, 0.4468775, 0.3461429, 0.372549, 1, 0, 1,
-0.6217477, -0.9815076, -2.383895, 0.3686275, 1, 0, 1,
-0.6210107, 1.308638, 0.3628065, 0.3607843, 1, 0, 1,
-0.61996, -0.9394017, -2.804283, 0.3568628, 1, 0, 1,
-0.615064, -1.23031, -3.343739, 0.3490196, 1, 0, 1,
-0.6146525, 2.760925, -2.326237, 0.345098, 1, 0, 1,
-0.6134882, -1.719419, -2.460544, 0.3372549, 1, 0, 1,
-0.6121583, -0.3461187, -2.767921, 0.3333333, 1, 0, 1,
-0.6119848, 1.561033, -0.5453969, 0.3254902, 1, 0, 1,
-0.6078166, 0.5382355, -0.04149995, 0.3215686, 1, 0, 1,
-0.6076791, -1.076089, -1.671348, 0.3137255, 1, 0, 1,
-0.6070225, -0.1629312, -4.280517, 0.3098039, 1, 0, 1,
-0.6028426, 0.111889, -2.990002, 0.3019608, 1, 0, 1,
-0.6026049, 0.04055839, -2.663367, 0.2941177, 1, 0, 1,
-0.6009063, -0.4627831, -2.036309, 0.2901961, 1, 0, 1,
-0.5949264, 0.7086956, -0.2834783, 0.282353, 1, 0, 1,
-0.5929888, -0.5160758, -2.310342, 0.2784314, 1, 0, 1,
-0.5913303, -2.244275, -1.734729, 0.2705882, 1, 0, 1,
-0.5895208, 0.3544136, -1.180415, 0.2666667, 1, 0, 1,
-0.5856302, -1.177205, -1.799636, 0.2588235, 1, 0, 1,
-0.5855973, 0.5361729, -1.602577, 0.254902, 1, 0, 1,
-0.5853769, -1.335625, -2.651673, 0.2470588, 1, 0, 1,
-0.5844944, 0.8121248, -1.039807, 0.2431373, 1, 0, 1,
-0.5831732, 0.5804446, -2.878036, 0.2352941, 1, 0, 1,
-0.5796911, 0.1012854, -2.004938, 0.2313726, 1, 0, 1,
-0.5710956, 0.6172194, -1.003556, 0.2235294, 1, 0, 1,
-0.5702246, -0.40192, -1.334035, 0.2196078, 1, 0, 1,
-0.5604362, -0.9064161, -3.59803, 0.2117647, 1, 0, 1,
-0.557915, 0.7348052, -1.497637, 0.2078431, 1, 0, 1,
-0.5565163, 0.8378468, 0.5405893, 0.2, 1, 0, 1,
-0.5561709, 0.09760674, -1.736378, 0.1921569, 1, 0, 1,
-0.5556363, 1.200497, -1.232306, 0.1882353, 1, 0, 1,
-0.5524449, -0.7650689, -0.6099821, 0.1803922, 1, 0, 1,
-0.5448331, 1.390373, 1.502834, 0.1764706, 1, 0, 1,
-0.542092, 1.142511, -2.920055, 0.1686275, 1, 0, 1,
-0.5412774, -1.623109, -3.280305, 0.1647059, 1, 0, 1,
-0.5380872, -1.756441, -3.030196, 0.1568628, 1, 0, 1,
-0.5366774, -0.7027707, -2.642147, 0.1529412, 1, 0, 1,
-0.536059, 0.9757652, -1.078903, 0.145098, 1, 0, 1,
-0.5331177, 0.7271065, 1.001324, 0.1411765, 1, 0, 1,
-0.5330321, -0.4817647, -2.136863, 0.1333333, 1, 0, 1,
-0.5199106, 1.488802, -0.5627655, 0.1294118, 1, 0, 1,
-0.5158365, -0.9748363, -2.051829, 0.1215686, 1, 0, 1,
-0.5153174, -0.415068, -1.856749, 0.1176471, 1, 0, 1,
-0.5110565, -0.8245654, -1.635812, 0.1098039, 1, 0, 1,
-0.5088686, 0.2036348, -0.8841907, 0.1058824, 1, 0, 1,
-0.5077016, 0.3511802, -0.9311415, 0.09803922, 1, 0, 1,
-0.5051757, -0.02993043, -1.353044, 0.09019608, 1, 0, 1,
-0.5045521, 0.1210542, -2.813857, 0.08627451, 1, 0, 1,
-0.5004641, 0.6013556, 0.6836896, 0.07843138, 1, 0, 1,
-0.4975177, -0.4910686, -1.251462, 0.07450981, 1, 0, 1,
-0.495461, -0.387113, -0.6811177, 0.06666667, 1, 0, 1,
-0.4931816, -1.217778, -2.026052, 0.0627451, 1, 0, 1,
-0.4884289, -0.1237204, -3.694437, 0.05490196, 1, 0, 1,
-0.4831178, -0.2888317, -2.921673, 0.05098039, 1, 0, 1,
-0.4830278, -1.334849, -2.515197, 0.04313726, 1, 0, 1,
-0.4823507, -0.5090161, -1.950627, 0.03921569, 1, 0, 1,
-0.4813075, 1.438674, -1.690419, 0.03137255, 1, 0, 1,
-0.476231, 0.9143435, -0.5661676, 0.02745098, 1, 0, 1,
-0.4753223, -0.4102078, -0.001609315, 0.01960784, 1, 0, 1,
-0.4749202, 0.880213, -0.4835646, 0.01568628, 1, 0, 1,
-0.4749107, -0.4218136, -3.542987, 0.007843138, 1, 0, 1,
-0.4693345, 0.7356906, 2.59053, 0.003921569, 1, 0, 1,
-0.461805, 0.06258091, -2.551287, 0, 1, 0.003921569, 1,
-0.4535791, -0.3110397, -0.9957197, 0, 1, 0.01176471, 1,
-0.4535633, 1.629686, -0.5639203, 0, 1, 0.01568628, 1,
-0.4513726, -2.227936, -3.939116, 0, 1, 0.02352941, 1,
-0.4429521, 1.383405, 1.05253, 0, 1, 0.02745098, 1,
-0.4421584, 0.2425093, -0.8637675, 0, 1, 0.03529412, 1,
-0.4416528, -0.4939752, -2.376922, 0, 1, 0.03921569, 1,
-0.4397128, -0.4864613, -1.711961, 0, 1, 0.04705882, 1,
-0.4396617, -0.5301505, -2.756432, 0, 1, 0.05098039, 1,
-0.4378559, 0.7829717, -0.01275306, 0, 1, 0.05882353, 1,
-0.4365864, -0.6666624, -4.717916, 0, 1, 0.0627451, 1,
-0.4354538, -2.195316, -2.999708, 0, 1, 0.07058824, 1,
-0.4233969, 0.9901562, 0.05240287, 0, 1, 0.07450981, 1,
-0.4189889, 0.4813409, 1.143889, 0, 1, 0.08235294, 1,
-0.4159265, 0.5325074, -2.614459, 0, 1, 0.08627451, 1,
-0.4141377, -0.4859104, -4.419233, 0, 1, 0.09411765, 1,
-0.4105435, 0.2113628, -3.51995, 0, 1, 0.1019608, 1,
-0.4080999, -1.000606, -3.554842, 0, 1, 0.1058824, 1,
-0.4038481, 0.08850292, -0.263103, 0, 1, 0.1137255, 1,
-0.4034351, 1.377542, 0.09019385, 0, 1, 0.1176471, 1,
-0.4029589, 0.2847668, -1.846352, 0, 1, 0.1254902, 1,
-0.4017392, 0.4404026, 0.003553967, 0, 1, 0.1294118, 1,
-0.394421, -0.1615484, -3.66759, 0, 1, 0.1372549, 1,
-0.3897504, -0.01460177, -2.133065, 0, 1, 0.1411765, 1,
-0.3853084, 0.0555515, -2.140969, 0, 1, 0.1490196, 1,
-0.3847776, 1.275091, -0.4771768, 0, 1, 0.1529412, 1,
-0.3843004, 0.2468709, -0.1446849, 0, 1, 0.1607843, 1,
-0.3805176, -0.03485518, -2.241046, 0, 1, 0.1647059, 1,
-0.3796537, 1.280228, -1.26582, 0, 1, 0.172549, 1,
-0.3750313, -0.3053554, -3.76687, 0, 1, 0.1764706, 1,
-0.3742255, 1.364087, 0.4710631, 0, 1, 0.1843137, 1,
-0.374062, 0.8747323, -0.5647599, 0, 1, 0.1882353, 1,
-0.3717503, 0.4922168, -1.962434, 0, 1, 0.1960784, 1,
-0.3708391, -0.1903714, -2.642639, 0, 1, 0.2039216, 1,
-0.3664861, 0.9569938, 0.4708114, 0, 1, 0.2078431, 1,
-0.3625771, 0.7452602, 0.7846841, 0, 1, 0.2156863, 1,
-0.3598219, -1.22173, -1.576949, 0, 1, 0.2196078, 1,
-0.3525202, 0.7496426, -1.487917, 0, 1, 0.227451, 1,
-0.3491394, -0.2296921, -1.863181, 0, 1, 0.2313726, 1,
-0.3438061, 0.9727832, -1.261331, 0, 1, 0.2392157, 1,
-0.3430743, -0.6347503, -3.780793, 0, 1, 0.2431373, 1,
-0.3413934, -1.824602, -3.880233, 0, 1, 0.2509804, 1,
-0.3402041, -0.2702151, -1.779631, 0, 1, 0.254902, 1,
-0.3381834, 0.5825392, -0.9769976, 0, 1, 0.2627451, 1,
-0.3361808, 0.8781274, -1.247659, 0, 1, 0.2666667, 1,
-0.3344842, 0.7633866, -1.150067, 0, 1, 0.2745098, 1,
-0.3344297, -0.4789884, -3.798879, 0, 1, 0.2784314, 1,
-0.332294, 0.3107259, 0.03930845, 0, 1, 0.2862745, 1,
-0.3223571, -0.08067883, -1.220521, 0, 1, 0.2901961, 1,
-0.3215295, -0.6429295, -3.247282, 0, 1, 0.2980392, 1,
-0.320496, -0.928609, -2.990418, 0, 1, 0.3058824, 1,
-0.3194607, 0.6896713, 0.5086623, 0, 1, 0.3098039, 1,
-0.3184225, 1.322749, 2.173221, 0, 1, 0.3176471, 1,
-0.3155705, 1.563593, 0.5615371, 0, 1, 0.3215686, 1,
-0.3041961, -0.6566197, -4.351311, 0, 1, 0.3294118, 1,
-0.3014016, -0.07493454, -0.8153641, 0, 1, 0.3333333, 1,
-0.300889, -0.486413, -2.819345, 0, 1, 0.3411765, 1,
-0.2991423, -0.3086449, -1.950898, 0, 1, 0.345098, 1,
-0.298489, -0.5736936, -5.261923, 0, 1, 0.3529412, 1,
-0.296201, -1.434399, -2.672209, 0, 1, 0.3568628, 1,
-0.2960361, 0.4635717, -0.2394894, 0, 1, 0.3647059, 1,
-0.2945281, -0.5180029, -3.697659, 0, 1, 0.3686275, 1,
-0.2931125, 0.2122054, -0.114156, 0, 1, 0.3764706, 1,
-0.2889734, -0.4386992, -1.022052, 0, 1, 0.3803922, 1,
-0.2827961, 0.1357114, 0.4574131, 0, 1, 0.3882353, 1,
-0.2791392, 0.6396748, 0.1173491, 0, 1, 0.3921569, 1,
-0.2725076, 0.3362715, -0.7819457, 0, 1, 0.4, 1,
-0.2668567, 1.15127, -1.317149, 0, 1, 0.4078431, 1,
-0.2667564, -1.628265, -4.108173, 0, 1, 0.4117647, 1,
-0.2665733, 0.4383122, -2.390345, 0, 1, 0.4196078, 1,
-0.2656455, -1.09782, -3.448457, 0, 1, 0.4235294, 1,
-0.2652324, 0.2106801, -0.02415149, 0, 1, 0.4313726, 1,
-0.2611721, -0.2642821, -3.123783, 0, 1, 0.4352941, 1,
-0.2583968, -0.02055408, -0.9843825, 0, 1, 0.4431373, 1,
-0.2580236, 0.413928, -0.4984339, 0, 1, 0.4470588, 1,
-0.2567842, 0.2259988, -2.659497, 0, 1, 0.454902, 1,
-0.2559433, -2.406388, -2.241321, 0, 1, 0.4588235, 1,
-0.2542657, 1.320413, -1.582887, 0, 1, 0.4666667, 1,
-0.2474077, 0.5074389, 0.06429959, 0, 1, 0.4705882, 1,
-0.2445338, -0.1183668, -0.7896951, 0, 1, 0.4784314, 1,
-0.2444669, -1.035505, -0.6421621, 0, 1, 0.4823529, 1,
-0.2441447, 0.1777131, -1.315263, 0, 1, 0.4901961, 1,
-0.2412123, -1.038399, -2.549688, 0, 1, 0.4941176, 1,
-0.2365831, 0.06433768, -0.7959363, 0, 1, 0.5019608, 1,
-0.2326167, -0.6211417, -2.460727, 0, 1, 0.509804, 1,
-0.2271371, 0.0196131, -0.899316, 0, 1, 0.5137255, 1,
-0.2247572, -0.3263876, -2.116975, 0, 1, 0.5215687, 1,
-0.2214812, 1.385413, -0.06529611, 0, 1, 0.5254902, 1,
-0.2201935, 0.07832374, -1.560841, 0, 1, 0.5333334, 1,
-0.2126969, -2.461748, -3.164162, 0, 1, 0.5372549, 1,
-0.2104691, -0.5721661, -1.302168, 0, 1, 0.5450981, 1,
-0.2096704, 1.439785, 0.1133156, 0, 1, 0.5490196, 1,
-0.2076676, -0.2310403, -2.950258, 0, 1, 0.5568628, 1,
-0.2073462, 0.8251456, -0.7044422, 0, 1, 0.5607843, 1,
-0.1994745, -0.7418105, -4.142632, 0, 1, 0.5686275, 1,
-0.1974172, -2.419912, -3.827024, 0, 1, 0.572549, 1,
-0.1930775, -0.5336463, -2.735541, 0, 1, 0.5803922, 1,
-0.1926156, 1.869225, 0.3910974, 0, 1, 0.5843138, 1,
-0.1921456, 0.7113824, -1.97389, 0, 1, 0.5921569, 1,
-0.1907499, -1.50293, -1.035558, 0, 1, 0.5960785, 1,
-0.1858902, 0.1711182, -0.2027775, 0, 1, 0.6039216, 1,
-0.1847145, -0.1114723, -1.819443, 0, 1, 0.6117647, 1,
-0.1845102, 0.282197, -1.440452, 0, 1, 0.6156863, 1,
-0.1771337, 0.9215595, -1.085949, 0, 1, 0.6235294, 1,
-0.1737676, 2.430289, -1.835461, 0, 1, 0.627451, 1,
-0.1683666, -1.859832, -3.641374, 0, 1, 0.6352941, 1,
-0.1670367, 0.1831119, -0.9127579, 0, 1, 0.6392157, 1,
-0.1664919, 0.4943015, -0.6859023, 0, 1, 0.6470588, 1,
-0.1610244, -0.6961722, -3.028024, 0, 1, 0.6509804, 1,
-0.1512558, 0.9686974, -1.228536, 0, 1, 0.6588235, 1,
-0.149233, -0.0123452, -4.523324, 0, 1, 0.6627451, 1,
-0.1456021, 1.731474, 0.9650083, 0, 1, 0.6705883, 1,
-0.145017, 0.6212744, -0.573072, 0, 1, 0.6745098, 1,
-0.1367036, -0.7197797, -4.108103, 0, 1, 0.682353, 1,
-0.1357022, -0.2192933, -3.367596, 0, 1, 0.6862745, 1,
-0.1300914, -0.02334038, -1.877308, 0, 1, 0.6941177, 1,
-0.1287869, -2.506524, -3.486402, 0, 1, 0.7019608, 1,
-0.1263225, -1.716893, -3.496434, 0, 1, 0.7058824, 1,
-0.1262439, 0.2273244, -1.23513, 0, 1, 0.7137255, 1,
-0.1256205, -1.908083, -2.741815, 0, 1, 0.7176471, 1,
-0.1236763, 0.4032716, -0.5184665, 0, 1, 0.7254902, 1,
-0.1235637, 1.427329, 0.4148243, 0, 1, 0.7294118, 1,
-0.116251, -0.05549992, -1.030301, 0, 1, 0.7372549, 1,
-0.1155972, -0.5670103, -1.709631, 0, 1, 0.7411765, 1,
-0.1143602, 0.005721983, -1.644913, 0, 1, 0.7490196, 1,
-0.1137543, -2.345862, -4.779453, 0, 1, 0.7529412, 1,
-0.110585, 0.1327354, 0.2521671, 0, 1, 0.7607843, 1,
-0.1067987, 2.693599, 0.1234044, 0, 1, 0.7647059, 1,
-0.1052357, 0.361782, -1.528434, 0, 1, 0.772549, 1,
-0.104917, 0.3254202, 0.5597982, 0, 1, 0.7764706, 1,
-0.09854575, 0.2711144, -1.494673, 0, 1, 0.7843137, 1,
-0.09802478, 0.9002036, -0.7571241, 0, 1, 0.7882353, 1,
-0.0979514, -0.9493366, -3.942183, 0, 1, 0.7960784, 1,
-0.0966403, -0.5037515, -3.396238, 0, 1, 0.8039216, 1,
-0.0952531, 0.9727353, -0.1647616, 0, 1, 0.8078431, 1,
-0.09480871, 0.5416199, -0.4696102, 0, 1, 0.8156863, 1,
-0.09360103, 0.6195387, 0.8057631, 0, 1, 0.8196079, 1,
-0.0929473, -1.906352, -3.310596, 0, 1, 0.827451, 1,
-0.09254552, -1.701887, -3.291375, 0, 1, 0.8313726, 1,
-0.09189669, 1.055015, -1.211659, 0, 1, 0.8392157, 1,
-0.09008965, -0.7690042, -0.6257485, 0, 1, 0.8431373, 1,
-0.08831727, 0.1463957, -0.8322905, 0, 1, 0.8509804, 1,
-0.08786853, -0.1200283, -1.778025, 0, 1, 0.854902, 1,
-0.08674739, -0.02153721, -2.357831, 0, 1, 0.8627451, 1,
-0.08576825, -0.7858734, -3.874671, 0, 1, 0.8666667, 1,
-0.08469259, 1.872995, -0.8036609, 0, 1, 0.8745098, 1,
-0.08462007, -1.211527, -4.32133, 0, 1, 0.8784314, 1,
-0.07299305, 0.1359904, -0.2090037, 0, 1, 0.8862745, 1,
-0.07256112, 0.7826886, 0.1672, 0, 1, 0.8901961, 1,
-0.07227629, 0.4931718, 0.5573538, 0, 1, 0.8980392, 1,
-0.07176863, -1.597498, -1.097096, 0, 1, 0.9058824, 1,
-0.06752411, 0.3351365, -0.6658162, 0, 1, 0.9098039, 1,
-0.06423254, 0.2622328, -0.7934858, 0, 1, 0.9176471, 1,
-0.06063218, -1.137309, -3.720143, 0, 1, 0.9215686, 1,
-0.05155924, 0.175575, -1.114329, 0, 1, 0.9294118, 1,
-0.05003174, 0.766064, -0.2599092, 0, 1, 0.9333333, 1,
-0.04101728, 0.4703071, -0.1304975, 0, 1, 0.9411765, 1,
-0.03897511, -1.651332, -3.459749, 0, 1, 0.945098, 1,
-0.03441522, -1.395627, -1.925106, 0, 1, 0.9529412, 1,
-0.03322805, -0.3590648, -1.889799, 0, 1, 0.9568627, 1,
-0.03263575, -1.50919, -3.269467, 0, 1, 0.9647059, 1,
-0.03145014, 0.5977727, -0.85438, 0, 1, 0.9686275, 1,
-0.02582189, -0.4285894, -0.4219707, 0, 1, 0.9764706, 1,
-0.02368837, 1.621185, -0.3105455, 0, 1, 0.9803922, 1,
-0.02254237, -0.7571879, -3.313332, 0, 1, 0.9882353, 1,
-0.02055063, -0.4123774, -3.276987, 0, 1, 0.9921569, 1,
-0.01972833, 0.1415572, 1.372814, 0, 1, 1, 1,
-0.01706185, -1.321333, -3.676435, 0, 0.9921569, 1, 1,
-0.01300382, 2.016596, 0.4284465, 0, 0.9882353, 1, 1,
-0.01160943, 0.1907642, 0.1283871, 0, 0.9803922, 1, 1,
-0.0103797, -0.4970956, -3.010326, 0, 0.9764706, 1, 1,
-0.00968294, -0.2428169, -2.423709, 0, 0.9686275, 1, 1,
-0.009610905, -0.7104296, -4.428725, 0, 0.9647059, 1, 1,
0.002161752, -0.3887326, 3.114136, 0, 0.9568627, 1, 1,
0.008298231, -1.524898, 2.131434, 0, 0.9529412, 1, 1,
0.009779845, -0.348816, 2.77954, 0, 0.945098, 1, 1,
0.01078376, -1.161262, 2.007104, 0, 0.9411765, 1, 1,
0.01292919, 1.345336, -0.4165662, 0, 0.9333333, 1, 1,
0.01553209, 1.09324, 2.927247, 0, 0.9294118, 1, 1,
0.02776873, 0.09124846, -1.923917, 0, 0.9215686, 1, 1,
0.02880346, -0.2388971, 1.740729, 0, 0.9176471, 1, 1,
0.03120354, 0.3225194, 0.9804608, 0, 0.9098039, 1, 1,
0.03983173, -1.018309, 4.396508, 0, 0.9058824, 1, 1,
0.04441071, -0.9031644, 3.564139, 0, 0.8980392, 1, 1,
0.04567025, 0.005616889, 1.790493, 0, 0.8901961, 1, 1,
0.04659374, -0.8126847, 3.946174, 0, 0.8862745, 1, 1,
0.04994034, 0.6129376, -0.1632807, 0, 0.8784314, 1, 1,
0.05124186, 0.5688397, -1.356207, 0, 0.8745098, 1, 1,
0.05241021, -0.4991273, 3.59666, 0, 0.8666667, 1, 1,
0.05758046, -0.791222, 2.943253, 0, 0.8627451, 1, 1,
0.05968745, -1.146679, 2.936962, 0, 0.854902, 1, 1,
0.0598441, 0.9379014, 0.8988174, 0, 0.8509804, 1, 1,
0.0616394, -1.951636, 0.9251746, 0, 0.8431373, 1, 1,
0.06216819, 1.490276, -0.6223541, 0, 0.8392157, 1, 1,
0.06256273, 0.9712877, 0.896071, 0, 0.8313726, 1, 1,
0.06479383, -0.08596426, 2.782224, 0, 0.827451, 1, 1,
0.06576002, -1.687941, 2.900765, 0, 0.8196079, 1, 1,
0.0707386, -1.684054, 2.623232, 0, 0.8156863, 1, 1,
0.07582574, 0.6371218, 1.545486, 0, 0.8078431, 1, 1,
0.07758544, 1.7101, -0.3104327, 0, 0.8039216, 1, 1,
0.07994951, -0.5294243, 2.260316, 0, 0.7960784, 1, 1,
0.08357126, 0.6309815, -1.034697, 0, 0.7882353, 1, 1,
0.08648585, 0.3482423, -0.2131499, 0, 0.7843137, 1, 1,
0.08842399, -0.5711083, 2.397585, 0, 0.7764706, 1, 1,
0.09064524, 1.619816, -1.117976, 0, 0.772549, 1, 1,
0.09351076, 1.43759, 2.229482, 0, 0.7647059, 1, 1,
0.09642006, -1.0539, 3.975285, 0, 0.7607843, 1, 1,
0.09820851, -0.3307586, 2.835308, 0, 0.7529412, 1, 1,
0.09969657, -0.7228627, 1.962071, 0, 0.7490196, 1, 1,
0.1001974, -0.284921, 1.794382, 0, 0.7411765, 1, 1,
0.102677, -0.1451298, 2.003837, 0, 0.7372549, 1, 1,
0.105349, 0.323622, -0.07933944, 0, 0.7294118, 1, 1,
0.1069617, 0.02664509, 2.365057, 0, 0.7254902, 1, 1,
0.1073473, -1.279884, 2.168822, 0, 0.7176471, 1, 1,
0.1074566, -1.118316, 1.100254, 0, 0.7137255, 1, 1,
0.120054, -1.367635, 2.503347, 0, 0.7058824, 1, 1,
0.1215256, 0.778432, 0.1166476, 0, 0.6980392, 1, 1,
0.1258898, -1.122259, 1.363154, 0, 0.6941177, 1, 1,
0.1267931, 0.357978, -1.14104, 0, 0.6862745, 1, 1,
0.1274626, 1.06934, 0.01050455, 0, 0.682353, 1, 1,
0.1283947, -0.3873828, 3.408637, 0, 0.6745098, 1, 1,
0.1293129, -1.328904, 2.212902, 0, 0.6705883, 1, 1,
0.1296987, 1.820221, -0.8560987, 0, 0.6627451, 1, 1,
0.1300381, 1.546361, 0.7554108, 0, 0.6588235, 1, 1,
0.1334516, 0.8617907, -1.152937, 0, 0.6509804, 1, 1,
0.1372536, -0.7607808, 3.618279, 0, 0.6470588, 1, 1,
0.1406049, 0.8345881, -0.02721083, 0, 0.6392157, 1, 1,
0.1440763, -1.821088, 1.715151, 0, 0.6352941, 1, 1,
0.1473354, -0.3807962, 2.617435, 0, 0.627451, 1, 1,
0.1504715, 1.499025, -1.541923, 0, 0.6235294, 1, 1,
0.1505594, -0.2734714, 1.80066, 0, 0.6156863, 1, 1,
0.1518446, -0.2738206, 1.220329, 0, 0.6117647, 1, 1,
0.1551092, 1.224772, -0.4023935, 0, 0.6039216, 1, 1,
0.1562242, -0.5617383, 3.82619, 0, 0.5960785, 1, 1,
0.1565067, 0.9600315, 0.1187654, 0, 0.5921569, 1, 1,
0.1585183, 0.1756705, 0.08866204, 0, 0.5843138, 1, 1,
0.1587905, -0.6375133, 2.64318, 0, 0.5803922, 1, 1,
0.1593878, -0.30266, 1.794642, 0, 0.572549, 1, 1,
0.1599199, 0.6217837, -0.3059823, 0, 0.5686275, 1, 1,
0.1639647, -0.7312827, 1.933534, 0, 0.5607843, 1, 1,
0.1642786, 0.69312, 0.9618868, 0, 0.5568628, 1, 1,
0.1644909, 1.351874, 0.4062801, 0, 0.5490196, 1, 1,
0.1651185, -0.8790216, 2.880088, 0, 0.5450981, 1, 1,
0.168455, -1.094303, 3.068096, 0, 0.5372549, 1, 1,
0.1707196, 0.4796669, 1.254173, 0, 0.5333334, 1, 1,
0.1714836, -0.07301567, 2.460731, 0, 0.5254902, 1, 1,
0.1718586, 0.09681498, 0.1588238, 0, 0.5215687, 1, 1,
0.1733011, -0.9687251, 3.799485, 0, 0.5137255, 1, 1,
0.1787357, -0.02314575, 1.682919, 0, 0.509804, 1, 1,
0.1824622, -0.6031319, 3.617099, 0, 0.5019608, 1, 1,
0.1857094, -0.3274695, 2.987869, 0, 0.4941176, 1, 1,
0.1858628, -0.8576716, 4.476399, 0, 0.4901961, 1, 1,
0.1865445, -0.9710279, 3.242798, 0, 0.4823529, 1, 1,
0.1867351, 0.5429932, 1.253016, 0, 0.4784314, 1, 1,
0.1868337, 0.03929993, 1.861473, 0, 0.4705882, 1, 1,
0.1889264, 0.2764353, -0.1745914, 0, 0.4666667, 1, 1,
0.1909802, -0.97396, 2.535935, 0, 0.4588235, 1, 1,
0.1916753, 0.2952641, -0.1708072, 0, 0.454902, 1, 1,
0.1976625, 1.199496, 0.1892614, 0, 0.4470588, 1, 1,
0.2015735, 0.3542787, 0.1917527, 0, 0.4431373, 1, 1,
0.2015775, -1.148998, 3.494313, 0, 0.4352941, 1, 1,
0.2033289, -1.093297, 3.770571, 0, 0.4313726, 1, 1,
0.2051886, 1.925415, -1.077408, 0, 0.4235294, 1, 1,
0.2056457, -1.743781, 3.438695, 0, 0.4196078, 1, 1,
0.2064622, 2.528697, -0.1518342, 0, 0.4117647, 1, 1,
0.2113693, -0.3971226, 2.331815, 0, 0.4078431, 1, 1,
0.2143382, 0.1886289, -1.060466, 0, 0.4, 1, 1,
0.2179692, -0.1169209, 2.706214, 0, 0.3921569, 1, 1,
0.2197313, -0.2384412, 2.7089, 0, 0.3882353, 1, 1,
0.2206119, -0.7265038, 3.650563, 0, 0.3803922, 1, 1,
0.2213, -0.2306602, 2.620809, 0, 0.3764706, 1, 1,
0.2224263, -0.05113822, 2.208212, 0, 0.3686275, 1, 1,
0.224982, -1.606653, 3.925946, 0, 0.3647059, 1, 1,
0.2275113, -0.3701026, 3.503902, 0, 0.3568628, 1, 1,
0.2295533, -0.563612, 3.523153, 0, 0.3529412, 1, 1,
0.2300362, 0.2462344, 0.9226233, 0, 0.345098, 1, 1,
0.2310931, -0.5103651, 1.330172, 0, 0.3411765, 1, 1,
0.2330196, -2.581417, 4.119123, 0, 0.3333333, 1, 1,
0.2338321, -0.001601872, 1.666932, 0, 0.3294118, 1, 1,
0.2347101, -1.777703, 2.601215, 0, 0.3215686, 1, 1,
0.2386512, -0.7615156, 1.433889, 0, 0.3176471, 1, 1,
0.2404063, -0.9087141, 2.639377, 0, 0.3098039, 1, 1,
0.2455348, -1.474535, 3.048081, 0, 0.3058824, 1, 1,
0.2495586, 0.4534145, 0.7608542, 0, 0.2980392, 1, 1,
0.2508893, -1.945766, 2.242016, 0, 0.2901961, 1, 1,
0.2519909, 0.3154514, 0.5406415, 0, 0.2862745, 1, 1,
0.252377, -1.809058, 4.809612, 0, 0.2784314, 1, 1,
0.2569304, -0.2831202, 1.872536, 0, 0.2745098, 1, 1,
0.2581324, 1.23184, -1.661624, 0, 0.2666667, 1, 1,
0.2586686, -0.07110989, 1.358698, 0, 0.2627451, 1, 1,
0.260482, -0.3202713, 2.114926, 0, 0.254902, 1, 1,
0.261912, 1.419871, 0.5021379, 0, 0.2509804, 1, 1,
0.2647392, 0.1832914, 2.13578, 0, 0.2431373, 1, 1,
0.2651697, -1.007243, 2.720709, 0, 0.2392157, 1, 1,
0.2686979, 1.349935, -0.2108389, 0, 0.2313726, 1, 1,
0.2692569, -0.2926251, -0.2351159, 0, 0.227451, 1, 1,
0.2713656, 0.04030928, 1.037609, 0, 0.2196078, 1, 1,
0.2741407, 0.8819575, -0.5357365, 0, 0.2156863, 1, 1,
0.2747709, 0.68408, -2.122792, 0, 0.2078431, 1, 1,
0.2779446, -1.533118, 3.494622, 0, 0.2039216, 1, 1,
0.2906174, -1.25819, 3.623722, 0, 0.1960784, 1, 1,
0.2932755, 0.01283609, 0.2038102, 0, 0.1882353, 1, 1,
0.2954952, 0.2382079, 0.9094676, 0, 0.1843137, 1, 1,
0.2989762, 0.2031074, 0.4593349, 0, 0.1764706, 1, 1,
0.299204, -0.476481, 2.434148, 0, 0.172549, 1, 1,
0.3010864, -0.3266876, 1.683169, 0, 0.1647059, 1, 1,
0.301128, 0.123118, 0.5390723, 0, 0.1607843, 1, 1,
0.3042364, 1.057445, -0.6208124, 0, 0.1529412, 1, 1,
0.3080925, 0.9707653, -0.4337414, 0, 0.1490196, 1, 1,
0.3093279, -3.022062, 4.114888, 0, 0.1411765, 1, 1,
0.3138774, 0.3940747, -0.4939938, 0, 0.1372549, 1, 1,
0.3164281, -1.304098, 3.319159, 0, 0.1294118, 1, 1,
0.3190725, -0.1970827, 1.153255, 0, 0.1254902, 1, 1,
0.3242001, 0.05091854, 1.663932, 0, 0.1176471, 1, 1,
0.3387715, -0.1981169, 2.153826, 0, 0.1137255, 1, 1,
0.3416988, 0.8657784, 0.1124748, 0, 0.1058824, 1, 1,
0.344056, 0.5210413, -1.098094, 0, 0.09803922, 1, 1,
0.3523002, -1.789637, 1.988696, 0, 0.09411765, 1, 1,
0.3534746, -0.4769689, 1.889758, 0, 0.08627451, 1, 1,
0.3558561, -0.4645624, 1.284371, 0, 0.08235294, 1, 1,
0.359192, -0.4087514, 1.821665, 0, 0.07450981, 1, 1,
0.3619203, -1.152073, 3.634366, 0, 0.07058824, 1, 1,
0.3661776, -0.3277134, 2.640965, 0, 0.0627451, 1, 1,
0.3708461, 2.072975, 0.4088787, 0, 0.05882353, 1, 1,
0.3726892, -1.821312, 3.014176, 0, 0.05098039, 1, 1,
0.3730386, -0.2753971, 3.554921, 0, 0.04705882, 1, 1,
0.3798599, 1.954984, 0.6537845, 0, 0.03921569, 1, 1,
0.3859585, 0.5950357, 2.140593, 0, 0.03529412, 1, 1,
0.386252, -0.0530215, 2.490321, 0, 0.02745098, 1, 1,
0.3871985, -0.05566619, 1.806699, 0, 0.02352941, 1, 1,
0.3873602, 0.2795027, 0.8189767, 0, 0.01568628, 1, 1,
0.3912467, -1.154317, 2.432426, 0, 0.01176471, 1, 1,
0.3970211, -1.011741, 2.254441, 0, 0.003921569, 1, 1,
0.3983003, -1.628868, -0.1059142, 0.003921569, 0, 1, 1,
0.4112525, 0.6061317, -0.1302652, 0.007843138, 0, 1, 1,
0.4132656, -0.7827817, 4.008195, 0.01568628, 0, 1, 1,
0.4132677, -0.1019613, 1.590009, 0.01960784, 0, 1, 1,
0.4148288, 0.1137789, 1.640822, 0.02745098, 0, 1, 1,
0.4196203, 0.6417972, 0.7731792, 0.03137255, 0, 1, 1,
0.4320187, -0.9041513, 2.402248, 0.03921569, 0, 1, 1,
0.43503, 1.23229, 1.917391, 0.04313726, 0, 1, 1,
0.4425486, 0.680654, 0.1110958, 0.05098039, 0, 1, 1,
0.4490514, -1.587254, 1.170098, 0.05490196, 0, 1, 1,
0.4496657, 0.9417698, 0.2070201, 0.0627451, 0, 1, 1,
0.4523084, -1.69958, 1.60422, 0.06666667, 0, 1, 1,
0.45339, 0.3462877, 1.740519, 0.07450981, 0, 1, 1,
0.4562249, -0.9837678, 2.289804, 0.07843138, 0, 1, 1,
0.4587984, 0.3589091, 1.999729, 0.08627451, 0, 1, 1,
0.4593238, -0.6409865, 1.273226, 0.09019608, 0, 1, 1,
0.4642919, 0.09261504, -0.875542, 0.09803922, 0, 1, 1,
0.4662287, -0.3215759, 3.116334, 0.1058824, 0, 1, 1,
0.466233, 1.784852, 1.100487, 0.1098039, 0, 1, 1,
0.469273, 0.8134528, -1.156683, 0.1176471, 0, 1, 1,
0.471725, 0.4875093, 0.3970459, 0.1215686, 0, 1, 1,
0.4740366, 0.4830091, 0.920258, 0.1294118, 0, 1, 1,
0.4756621, -1.133094, 2.509062, 0.1333333, 0, 1, 1,
0.4791817, -0.7950784, 3.288424, 0.1411765, 0, 1, 1,
0.4822532, -0.5627874, 1.936261, 0.145098, 0, 1, 1,
0.4826298, -1.566587, 3.27395, 0.1529412, 0, 1, 1,
0.4844889, 0.1943289, -0.1423247, 0.1568628, 0, 1, 1,
0.4906429, -0.8111516, 1.569843, 0.1647059, 0, 1, 1,
0.4996859, 1.133053, 1.980128, 0.1686275, 0, 1, 1,
0.5031281, 1.320297, -0.237643, 0.1764706, 0, 1, 1,
0.5033166, 0.1865564, 1.359597, 0.1803922, 0, 1, 1,
0.5040976, 0.7021493, 0.7085186, 0.1882353, 0, 1, 1,
0.5179853, -0.7695383, 2.591097, 0.1921569, 0, 1, 1,
0.5208988, -0.800331, 0.8234406, 0.2, 0, 1, 1,
0.5266072, 0.9593714, 0.2930389, 0.2078431, 0, 1, 1,
0.5282209, 1.359161, 0.2638171, 0.2117647, 0, 1, 1,
0.5303081, 0.3301384, 0.3566077, 0.2196078, 0, 1, 1,
0.5306069, 1.440796, 1.141933, 0.2235294, 0, 1, 1,
0.5335017, -1.355032, 4.369356, 0.2313726, 0, 1, 1,
0.5391158, -0.8899332, 3.445369, 0.2352941, 0, 1, 1,
0.5399876, -0.4976139, 0.8043729, 0.2431373, 0, 1, 1,
0.5426869, 0.3014625, 1.603818, 0.2470588, 0, 1, 1,
0.5438423, 0.02039852, 1.622869, 0.254902, 0, 1, 1,
0.5502449, -1.734838, 3.424721, 0.2588235, 0, 1, 1,
0.555057, 1.301292, -1.80508, 0.2666667, 0, 1, 1,
0.5574857, -0.3590896, 2.603795, 0.2705882, 0, 1, 1,
0.5592124, 0.3466159, 1.410272, 0.2784314, 0, 1, 1,
0.5616462, 1.199742, 0.3346737, 0.282353, 0, 1, 1,
0.5663164, -0.5893161, 2.570031, 0.2901961, 0, 1, 1,
0.5716984, 0.8601045, 1.610295, 0.2941177, 0, 1, 1,
0.5739918, 2.127205, 0.3880447, 0.3019608, 0, 1, 1,
0.5755858, 0.703724, 1.93906, 0.3098039, 0, 1, 1,
0.5764817, -0.4648147, 1.911394, 0.3137255, 0, 1, 1,
0.5798876, 0.06052103, 2.424873, 0.3215686, 0, 1, 1,
0.5863321, 0.6456176, 0.4511532, 0.3254902, 0, 1, 1,
0.5877482, -1.37681, 2.6062, 0.3333333, 0, 1, 1,
0.5896261, 1.559514, -0.2932577, 0.3372549, 0, 1, 1,
0.591724, 1.148691, 0.5934096, 0.345098, 0, 1, 1,
0.5923617, -1.885999, 2.767014, 0.3490196, 0, 1, 1,
0.5929862, 1.287803, 0.4677152, 0.3568628, 0, 1, 1,
0.5948933, -1.973693, 3.839, 0.3607843, 0, 1, 1,
0.5996652, 1.510179, 1.691536, 0.3686275, 0, 1, 1,
0.5998088, 0.4914867, -0.3066823, 0.372549, 0, 1, 1,
0.6044043, -1.636277, 4.623846, 0.3803922, 0, 1, 1,
0.6104335, 1.730295, 0.1139223, 0.3843137, 0, 1, 1,
0.6170091, 1.526471, 1.370594, 0.3921569, 0, 1, 1,
0.6192523, 0.7173454, 1.419655, 0.3960784, 0, 1, 1,
0.6227053, 1.328647, -0.355017, 0.4039216, 0, 1, 1,
0.6253687, 0.1405677, -0.1098542, 0.4117647, 0, 1, 1,
0.6329618, -0.1304073, 1.577495, 0.4156863, 0, 1, 1,
0.6369057, -0.8269285, 2.26728, 0.4235294, 0, 1, 1,
0.6394857, -0.08908653, 0.8363224, 0.427451, 0, 1, 1,
0.6402462, 0.5619655, 0.3087451, 0.4352941, 0, 1, 1,
0.6404529, -1.440485, 5.753421, 0.4392157, 0, 1, 1,
0.6409171, -0.4354326, 3.049308, 0.4470588, 0, 1, 1,
0.6471046, 0.6890962, 0.06184226, 0.4509804, 0, 1, 1,
0.6477052, 1.24851, -0.9322654, 0.4588235, 0, 1, 1,
0.6495306, -1.300565, 1.407075, 0.4627451, 0, 1, 1,
0.6516156, 0.3448039, 0.9340834, 0.4705882, 0, 1, 1,
0.6527404, -1.721801, 2.743125, 0.4745098, 0, 1, 1,
0.6584715, 2.351617, 1.016365, 0.4823529, 0, 1, 1,
0.6622949, 0.8874403, 0.9016893, 0.4862745, 0, 1, 1,
0.6634538, -0.3696437, 3.056169, 0.4941176, 0, 1, 1,
0.6643786, -1.475132, 3.127563, 0.5019608, 0, 1, 1,
0.670167, -0.1964117, 0.6705344, 0.5058824, 0, 1, 1,
0.6760383, 0.8230166, -0.5099655, 0.5137255, 0, 1, 1,
0.677098, -2.654708, 1.719435, 0.5176471, 0, 1, 1,
0.680335, 0.1103432, 0.9762855, 0.5254902, 0, 1, 1,
0.6852102, -0.62555, 4.630309, 0.5294118, 0, 1, 1,
0.6875333, 0.7020257, 0.3774045, 0.5372549, 0, 1, 1,
0.6914229, 0.5334878, 1.519967, 0.5411765, 0, 1, 1,
0.6958369, 0.7502137, 0.2161886, 0.5490196, 0, 1, 1,
0.6973795, 1.488047, 0.5068403, 0.5529412, 0, 1, 1,
0.6986689, -0.9910772, 3.873967, 0.5607843, 0, 1, 1,
0.6991491, -0.9942307, 3.101455, 0.5647059, 0, 1, 1,
0.6999138, -0.1472604, 1.121748, 0.572549, 0, 1, 1,
0.7006519, -0.3229158, 0.4462823, 0.5764706, 0, 1, 1,
0.7032321, -0.7132403, 2.555982, 0.5843138, 0, 1, 1,
0.7188578, 2.327337, 1.128896, 0.5882353, 0, 1, 1,
0.72452, -0.09178346, 0.8489404, 0.5960785, 0, 1, 1,
0.7329608, -1.688061, 3.016362, 0.6039216, 0, 1, 1,
0.7334591, -0.8160507, 1.39051, 0.6078432, 0, 1, 1,
0.7338761, -0.1072158, 0.4149116, 0.6156863, 0, 1, 1,
0.7353379, 1.608801, 0.1374963, 0.6196079, 0, 1, 1,
0.7399344, -0.4042036, 2.635265, 0.627451, 0, 1, 1,
0.7446689, -1.816466, 0.2777971, 0.6313726, 0, 1, 1,
0.7453107, -0.1345798, 0.5437351, 0.6392157, 0, 1, 1,
0.7493318, 0.1259876, 0.4021307, 0.6431373, 0, 1, 1,
0.750362, 2.689075, -0.3066486, 0.6509804, 0, 1, 1,
0.7532912, 1.002037, 0.7992047, 0.654902, 0, 1, 1,
0.7550591, 0.4134583, 2.523698, 0.6627451, 0, 1, 1,
0.7573664, 2.100652, -1.187601, 0.6666667, 0, 1, 1,
0.7588243, 1.211417, 2.117053, 0.6745098, 0, 1, 1,
0.7601552, -0.2183787, 1.231925, 0.6784314, 0, 1, 1,
0.7602844, -1.101376, 2.809089, 0.6862745, 0, 1, 1,
0.7685709, -1.070533, 0.5966811, 0.6901961, 0, 1, 1,
0.7703665, 0.04490567, 1.117823, 0.6980392, 0, 1, 1,
0.7727785, 0.1238818, -0.3028458, 0.7058824, 0, 1, 1,
0.7743513, -0.2688463, 2.200303, 0.7098039, 0, 1, 1,
0.7784365, 1.694315, 2.50777, 0.7176471, 0, 1, 1,
0.779023, 0.3848409, 2.2947, 0.7215686, 0, 1, 1,
0.7813451, -0.3315184, 1.704951, 0.7294118, 0, 1, 1,
0.7832514, 0.8645952, 0.3007657, 0.7333333, 0, 1, 1,
0.783329, 0.7766671, 0.3347332, 0.7411765, 0, 1, 1,
0.7857848, 0.1715122, 2.319796, 0.7450981, 0, 1, 1,
0.7863611, 0.6875911, 0.02685758, 0.7529412, 0, 1, 1,
0.7875273, 0.4966523, -0.05465851, 0.7568628, 0, 1, 1,
0.7890887, 0.05184804, 2.610618, 0.7647059, 0, 1, 1,
0.7945333, -0.4127914, 1.920226, 0.7686275, 0, 1, 1,
0.7972816, -0.8577845, 1.141664, 0.7764706, 0, 1, 1,
0.8013388, -0.6224009, 2.383803, 0.7803922, 0, 1, 1,
0.8041172, -0.3815572, 1.37362, 0.7882353, 0, 1, 1,
0.8091773, -0.9587568, 1.945566, 0.7921569, 0, 1, 1,
0.8122519, -1.05088, 2.669702, 0.8, 0, 1, 1,
0.8168258, -0.2889713, 2.006191, 0.8078431, 0, 1, 1,
0.8168486, -0.5931791, 2.375493, 0.8117647, 0, 1, 1,
0.8192676, 0.3424627, 0.1306229, 0.8196079, 0, 1, 1,
0.8219384, 0.1557748, 0.8023636, 0.8235294, 0, 1, 1,
0.8312247, 1.204302, 0.6976006, 0.8313726, 0, 1, 1,
0.8355808, -0.1833903, 1.355908, 0.8352941, 0, 1, 1,
0.8380291, 0.3697647, 2.858809, 0.8431373, 0, 1, 1,
0.8471341, -0.2970294, 2.041079, 0.8470588, 0, 1, 1,
0.8549457, -0.8860334, 4.460563, 0.854902, 0, 1, 1,
0.858032, -0.5105946, 2.708201, 0.8588235, 0, 1, 1,
0.8588258, -1.124106, 3.090457, 0.8666667, 0, 1, 1,
0.8602016, 0.1765448, 1.082738, 0.8705882, 0, 1, 1,
0.8607918, -0.4044296, 1.320429, 0.8784314, 0, 1, 1,
0.8611259, 0.5276297, 1.108054, 0.8823529, 0, 1, 1,
0.8645152, -0.06926028, 2.77617, 0.8901961, 0, 1, 1,
0.8645296, 0.09116144, 1.592154, 0.8941177, 0, 1, 1,
0.8682852, -1.085295, 1.467462, 0.9019608, 0, 1, 1,
0.8687915, 0.5718933, 1.22746, 0.9098039, 0, 1, 1,
0.8773407, 0.5613223, 0.9518418, 0.9137255, 0, 1, 1,
0.8849337, 0.5329375, 1.984435, 0.9215686, 0, 1, 1,
0.8882696, 0.1360312, 1.959156, 0.9254902, 0, 1, 1,
0.88859, 0.9631441, 0.6984007, 0.9333333, 0, 1, 1,
0.8908049, 1.868015, 0.8416634, 0.9372549, 0, 1, 1,
0.8908617, -0.3060832, 1.65446, 0.945098, 0, 1, 1,
0.8920019, -1.891471, 2.260531, 0.9490196, 0, 1, 1,
0.8969548, 0.7867389, 2.10724, 0.9568627, 0, 1, 1,
0.8969987, -0.01861619, 2.227264, 0.9607843, 0, 1, 1,
0.910926, 0.7103438, -0.8443063, 0.9686275, 0, 1, 1,
0.9142069, -1.266739, 1.580661, 0.972549, 0, 1, 1,
0.9159135, 1.163348, 2.357242, 0.9803922, 0, 1, 1,
0.9178409, -1.306057, 2.557676, 0.9843137, 0, 1, 1,
0.9239954, 0.05025614, 2.73666, 0.9921569, 0, 1, 1,
0.9296297, -1.217492, 3.470625, 0.9960784, 0, 1, 1,
0.9308461, -0.3270868, 2.177112, 1, 0, 0.9960784, 1,
0.9312878, -2.08814, 1.871048, 1, 0, 0.9882353, 1,
0.9318845, -0.475673, 2.75752, 1, 0, 0.9843137, 1,
0.932977, -1.225274, 3.252131, 1, 0, 0.9764706, 1,
0.9374647, 0.8430135, 2.283193, 1, 0, 0.972549, 1,
0.9466389, 0.6902992, 2.653728, 1, 0, 0.9647059, 1,
0.9521989, -0.4237702, 1.711006, 1, 0, 0.9607843, 1,
0.9628919, -1.736995, 2.703811, 1, 0, 0.9529412, 1,
0.9726809, 0.1457157, 3.327339, 1, 0, 0.9490196, 1,
0.9744828, -0.03840751, 1.242226, 1, 0, 0.9411765, 1,
0.9796414, 1.200018, 0.6162467, 1, 0, 0.9372549, 1,
0.983856, -0.7705404, 2.789828, 1, 0, 0.9294118, 1,
0.984214, 2.023694, 0.4787683, 1, 0, 0.9254902, 1,
0.9846177, -2.141751, 2.506149, 1, 0, 0.9176471, 1,
0.9953821, -0.7571142, 1.892679, 1, 0, 0.9137255, 1,
1.005616, -1.23553, 2.198611, 1, 0, 0.9058824, 1,
1.008703, -1.542166, 1.997624, 1, 0, 0.9019608, 1,
1.013565, 0.002905243, 1.75128, 1, 0, 0.8941177, 1,
1.022798, 0.2685406, 0.8482846, 1, 0, 0.8862745, 1,
1.042355, -0.1667881, 2.426823, 1, 0, 0.8823529, 1,
1.045682, 0.03706891, 0.5243901, 1, 0, 0.8745098, 1,
1.053469, 1.494092, -0.09642524, 1, 0, 0.8705882, 1,
1.061838, -0.2389311, 1.494377, 1, 0, 0.8627451, 1,
1.063925, -1.028448, 0.5451553, 1, 0, 0.8588235, 1,
1.067199, 0.6458355, 2.70689, 1, 0, 0.8509804, 1,
1.07691, 0.3006769, 2.430396, 1, 0, 0.8470588, 1,
1.081076, -0.1387447, 2.539409, 1, 0, 0.8392157, 1,
1.081449, -0.3295371, 0.660506, 1, 0, 0.8352941, 1,
1.086759, 0.8479148, 1.220312, 1, 0, 0.827451, 1,
1.086794, -2.209704, 2.682, 1, 0, 0.8235294, 1,
1.088846, -0.3416591, 1.962193, 1, 0, 0.8156863, 1,
1.0895, -0.9028412, 0.9919519, 1, 0, 0.8117647, 1,
1.092283, 0.810584, 0.8900522, 1, 0, 0.8039216, 1,
1.098531, 0.6216485, 1.586643, 1, 0, 0.7960784, 1,
1.103028, -0.8129536, 3.712972, 1, 0, 0.7921569, 1,
1.107872, 0.03092489, 2.08655, 1, 0, 0.7843137, 1,
1.108414, -1.808524, 1.861371, 1, 0, 0.7803922, 1,
1.110215, 1.513745, 0.8427406, 1, 0, 0.772549, 1,
1.110218, -0.3585733, 1.631993, 1, 0, 0.7686275, 1,
1.114266, 0.1798767, 2.379622, 1, 0, 0.7607843, 1,
1.115011, 0.6903017, -0.4836574, 1, 0, 0.7568628, 1,
1.122068, 1.646602, 0.8607936, 1, 0, 0.7490196, 1,
1.124827, 0.3988448, 2.165574, 1, 0, 0.7450981, 1,
1.125883, 1.292699, 1.251677, 1, 0, 0.7372549, 1,
1.132201, -0.1519751, 1.641685, 1, 0, 0.7333333, 1,
1.134205, -0.6138948, 1.299328, 1, 0, 0.7254902, 1,
1.14232, 0.1055113, 2.759799, 1, 0, 0.7215686, 1,
1.148845, -0.01484486, 2.138463, 1, 0, 0.7137255, 1,
1.14991, -1.294688, 1.065103, 1, 0, 0.7098039, 1,
1.153223, 0.7741317, 0.4661662, 1, 0, 0.7019608, 1,
1.155404, -0.1358562, 2.639706, 1, 0, 0.6941177, 1,
1.167593, -0.9735156, 2.846226, 1, 0, 0.6901961, 1,
1.169075, -2.096752, 2.104584, 1, 0, 0.682353, 1,
1.172815, -0.2062875, 1.130244, 1, 0, 0.6784314, 1,
1.182672, -1.043427, 1.12788, 1, 0, 0.6705883, 1,
1.182898, -1.254596, 2.211644, 1, 0, 0.6666667, 1,
1.194451, 0.3463946, 3.026421, 1, 0, 0.6588235, 1,
1.19642, 0.5162926, 1.70899, 1, 0, 0.654902, 1,
1.198674, -0.2071953, 1.022962, 1, 0, 0.6470588, 1,
1.209178, -0.04446761, -0.1530083, 1, 0, 0.6431373, 1,
1.213413, -0.09951999, 3.484689, 1, 0, 0.6352941, 1,
1.220912, 0.2367817, 1.622645, 1, 0, 0.6313726, 1,
1.241729, -0.9479238, 1.953237, 1, 0, 0.6235294, 1,
1.242157, 2.390126, -1.009472, 1, 0, 0.6196079, 1,
1.25102, -0.07114581, 2.25378, 1, 0, 0.6117647, 1,
1.258374, -0.8726497, 2.072647, 1, 0, 0.6078432, 1,
1.270866, 0.4072251, 1.539645, 1, 0, 0.6, 1,
1.278889, 1.760564, 0.1550303, 1, 0, 0.5921569, 1,
1.28222, 0.4294108, 2.60857, 1, 0, 0.5882353, 1,
1.284127, -0.3369064, 0.363836, 1, 0, 0.5803922, 1,
1.299152, -0.1391822, 0.1442716, 1, 0, 0.5764706, 1,
1.300775, -0.9631799, 3.511044, 1, 0, 0.5686275, 1,
1.302538, -0.9685743, 4.238105, 1, 0, 0.5647059, 1,
1.304152, -1.742427, 2.303753, 1, 0, 0.5568628, 1,
1.308092, 1.040737, 3.164676, 1, 0, 0.5529412, 1,
1.313941, 0.5397128, 2.785076, 1, 0, 0.5450981, 1,
1.315376, -0.5875123, 1.405757, 1, 0, 0.5411765, 1,
1.324878, 1.174762, -0.4958022, 1, 0, 0.5333334, 1,
1.327893, 0.8198762, -0.9259871, 1, 0, 0.5294118, 1,
1.329676, -0.2319069, 2.902516, 1, 0, 0.5215687, 1,
1.337173, -0.6465033, 3.156566, 1, 0, 0.5176471, 1,
1.343579, -0.7980132, 2.556414, 1, 0, 0.509804, 1,
1.343967, 0.5521618, -0.4669468, 1, 0, 0.5058824, 1,
1.358716, -0.8286626, 1.010962, 1, 0, 0.4980392, 1,
1.36267, -0.5972331, 1.395828, 1, 0, 0.4901961, 1,
1.36512, 0.202601, 2.577489, 1, 0, 0.4862745, 1,
1.367008, -1.345312, 2.885918, 1, 0, 0.4784314, 1,
1.369232, 0.3296069, 1.760028, 1, 0, 0.4745098, 1,
1.371498, 0.0481086, 2.715816, 1, 0, 0.4666667, 1,
1.376433, -0.01147851, 1.384259, 1, 0, 0.4627451, 1,
1.377889, 0.2819906, 1.169838, 1, 0, 0.454902, 1,
1.411875, -0.4512013, 3.452827, 1, 0, 0.4509804, 1,
1.412462, 0.3373157, 1.573485, 1, 0, 0.4431373, 1,
1.423087, 1.876217, 2.314093, 1, 0, 0.4392157, 1,
1.424787, -0.5149351, 3.27426, 1, 0, 0.4313726, 1,
1.426671, 0.2758712, 1.441988, 1, 0, 0.427451, 1,
1.426854, 0.1892525, 0.6676482, 1, 0, 0.4196078, 1,
1.42788, -0.1808794, 3.238063, 1, 0, 0.4156863, 1,
1.433905, 1.938099, 1.882634, 1, 0, 0.4078431, 1,
1.44375, 0.09210785, 1.951649, 1, 0, 0.4039216, 1,
1.443753, -0.1383621, 3.05917, 1, 0, 0.3960784, 1,
1.446094, -2.304785, 3.240168, 1, 0, 0.3882353, 1,
1.460587, 0.3669428, 1.553367, 1, 0, 0.3843137, 1,
1.476943, 0.06276727, 1.331665, 1, 0, 0.3764706, 1,
1.488561, -0.402338, 2.34524, 1, 0, 0.372549, 1,
1.492904, -1.326748, 1.061672, 1, 0, 0.3647059, 1,
1.511125, 0.6680365, 0.1410217, 1, 0, 0.3607843, 1,
1.512692, -0.5743546, 1.698324, 1, 0, 0.3529412, 1,
1.523057, 0.46202, -0.8889987, 1, 0, 0.3490196, 1,
1.538923, -0.7351869, 3.217997, 1, 0, 0.3411765, 1,
1.588501, -0.4450563, 2.928311, 1, 0, 0.3372549, 1,
1.593198, -0.07053362, 3.143235, 1, 0, 0.3294118, 1,
1.603011, -0.2557553, 3.056342, 1, 0, 0.3254902, 1,
1.607677, 0.2344097, 1.236713, 1, 0, 0.3176471, 1,
1.623941, -0.377537, 0.3144001, 1, 0, 0.3137255, 1,
1.637097, -1.766573, 1.933572, 1, 0, 0.3058824, 1,
1.644757, 0.1997943, 1.457632, 1, 0, 0.2980392, 1,
1.652584, -1.246915, 1.883725, 1, 0, 0.2941177, 1,
1.676978, 0.6830847, 3.010061, 1, 0, 0.2862745, 1,
1.697793, -0.2544988, 2.543118, 1, 0, 0.282353, 1,
1.711556, -1.123158, 0.353172, 1, 0, 0.2745098, 1,
1.714536, 0.9076557, -0.2095614, 1, 0, 0.2705882, 1,
1.715918, -0.3756578, -0.7525802, 1, 0, 0.2627451, 1,
1.739687, -0.3221472, 1.110674, 1, 0, 0.2588235, 1,
1.776759, 0.3831534, 2.818179, 1, 0, 0.2509804, 1,
1.779135, -0.5465178, 2.542262, 1, 0, 0.2470588, 1,
1.793352, 1.404366, 1.27569, 1, 0, 0.2392157, 1,
1.80349, -0.3257482, 0.0480692, 1, 0, 0.2352941, 1,
1.816472, 0.1893239, 0.5781453, 1, 0, 0.227451, 1,
1.829909, 0.1828139, 1.731219, 1, 0, 0.2235294, 1,
1.83041, -0.5200379, 3.125305, 1, 0, 0.2156863, 1,
1.835499, -1.644256, 2.116528, 1, 0, 0.2117647, 1,
1.845164, 0.07231694, 2.105042, 1, 0, 0.2039216, 1,
1.851432, -0.3121459, 0.3555444, 1, 0, 0.1960784, 1,
1.858499, 0.7959273, 1.586828, 1, 0, 0.1921569, 1,
1.859893, 0.6062502, 0.963945, 1, 0, 0.1843137, 1,
1.864662, 0.9068531, 0.2852407, 1, 0, 0.1803922, 1,
1.866798, -1.532421, 3.467339, 1, 0, 0.172549, 1,
1.88302, -0.2445364, 2.539681, 1, 0, 0.1686275, 1,
1.91488, 0.1440224, 0.4190844, 1, 0, 0.1607843, 1,
1.935412, 2.36027, 0.5616956, 1, 0, 0.1568628, 1,
1.954933, 0.2497314, 2.803213, 1, 0, 0.1490196, 1,
1.958286, 0.7499655, 2.639156, 1, 0, 0.145098, 1,
1.973093, -0.4646744, 2.290489, 1, 0, 0.1372549, 1,
1.987408, 0.1540568, 2.927397, 1, 0, 0.1333333, 1,
1.991099, 0.4437645, 2.38542, 1, 0, 0.1254902, 1,
2.004777, -0.1021179, 1.887366, 1, 0, 0.1215686, 1,
2.005941, -0.5296401, 2.220128, 1, 0, 0.1137255, 1,
2.032973, -0.0570726, 1.937524, 1, 0, 0.1098039, 1,
2.034697, 0.1794368, 2.375738, 1, 0, 0.1019608, 1,
2.044642, -0.9796657, 2.936593, 1, 0, 0.09411765, 1,
2.048225, 0.05933768, 1.27215, 1, 0, 0.09019608, 1,
2.061813, 1.241904, 2.139665, 1, 0, 0.08235294, 1,
2.114076, 0.6270624, 2.77791, 1, 0, 0.07843138, 1,
2.135233, -0.216155, 1.803673, 1, 0, 0.07058824, 1,
2.147414, 0.5149781, 1.790026, 1, 0, 0.06666667, 1,
2.177308, -0.1643344, 0.9686999, 1, 0, 0.05882353, 1,
2.192618, -2.133684, 2.056062, 1, 0, 0.05490196, 1,
2.203553, -0.06246198, -0.6320181, 1, 0, 0.04705882, 1,
2.228384, -0.02488311, 2.750535, 1, 0, 0.04313726, 1,
2.28662, -1.21506, 1.633237, 1, 0, 0.03529412, 1,
2.382617, 0.2416033, 2.063576, 1, 0, 0.03137255, 1,
2.543115, -0.9408666, 2.354738, 1, 0, 0.02352941, 1,
2.547038, 0.03526454, 0.7716616, 1, 0, 0.01960784, 1,
2.581439, -0.7628468, 1.916267, 1, 0, 0.01176471, 1,
3.493784, -0.3609543, 2.263976, 1, 0, 0.007843138, 1
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
0.3277966, -4.002278, -7.129024, 0, -0.5, 0.5, 0.5,
0.3277966, -4.002278, -7.129024, 1, -0.5, 0.5, 0.5,
0.3277966, -4.002278, -7.129024, 1, 1.5, 0.5, 0.5,
0.3277966, -4.002278, -7.129024, 0, 1.5, 0.5, 0.5
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
-3.91146, -0.1305685, -7.129024, 0, -0.5, 0.5, 0.5,
-3.91146, -0.1305685, -7.129024, 1, -0.5, 0.5, 0.5,
-3.91146, -0.1305685, -7.129024, 1, 1.5, 0.5, 0.5,
-3.91146, -0.1305685, -7.129024, 0, 1.5, 0.5, 0.5
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
-3.91146, -4.002278, 0.2457488, 0, -0.5, 0.5, 0.5,
-3.91146, -4.002278, 0.2457488, 1, -0.5, 0.5, 0.5,
-3.91146, -4.002278, 0.2457488, 1, 1.5, 0.5, 0.5,
-3.91146, -4.002278, 0.2457488, 0, 1.5, 0.5, 0.5
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
-2, -3.108806, -5.427154,
3, -3.108806, -5.427154,
-2, -3.108806, -5.427154,
-2, -3.257718, -5.710799,
-1, -3.108806, -5.427154,
-1, -3.257718, -5.710799,
0, -3.108806, -5.427154,
0, -3.257718, -5.710799,
1, -3.108806, -5.427154,
1, -3.257718, -5.710799,
2, -3.108806, -5.427154,
2, -3.257718, -5.710799,
3, -3.108806, -5.427154,
3, -3.257718, -5.710799
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
-2, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
-2, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
-2, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
-2, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5,
-1, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
-1, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
-1, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
-1, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5,
0, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
0, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
0, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
0, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5,
1, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
1, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
1, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
1, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5,
2, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
2, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
2, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
2, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5,
3, -3.555542, -6.278089, 0, -0.5, 0.5, 0.5,
3, -3.555542, -6.278089, 1, -0.5, 0.5, 0.5,
3, -3.555542, -6.278089, 1, 1.5, 0.5, 0.5,
3, -3.555542, -6.278089, 0, 1.5, 0.5, 0.5
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
-2.93317, -3, -5.427154,
-2.93317, 2, -5.427154,
-2.93317, -3, -5.427154,
-3.096219, -3, -5.710799,
-2.93317, -2, -5.427154,
-3.096219, -2, -5.710799,
-2.93317, -1, -5.427154,
-3.096219, -1, -5.710799,
-2.93317, 0, -5.427154,
-3.096219, 0, -5.710799,
-2.93317, 1, -5.427154,
-3.096219, 1, -5.710799,
-2.93317, 2, -5.427154,
-3.096219, 2, -5.710799
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
-3.422315, -3, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, -3, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, -3, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, -3, -6.278089, 0, 1.5, 0.5, 0.5,
-3.422315, -2, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, -2, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, -2, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, -2, -6.278089, 0, 1.5, 0.5, 0.5,
-3.422315, -1, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, -1, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, -1, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, -1, -6.278089, 0, 1.5, 0.5, 0.5,
-3.422315, 0, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, 0, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, 0, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, 0, -6.278089, 0, 1.5, 0.5, 0.5,
-3.422315, 1, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, 1, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, 1, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, 1, -6.278089, 0, 1.5, 0.5, 0.5,
-3.422315, 2, -6.278089, 0, -0.5, 0.5, 0.5,
-3.422315, 2, -6.278089, 1, -0.5, 0.5, 0.5,
-3.422315, 2, -6.278089, 1, 1.5, 0.5, 0.5,
-3.422315, 2, -6.278089, 0, 1.5, 0.5, 0.5
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
-2.93317, -3.108806, -4,
-2.93317, -3.108806, 4,
-2.93317, -3.108806, -4,
-3.096219, -3.257718, -4,
-2.93317, -3.108806, -2,
-3.096219, -3.257718, -2,
-2.93317, -3.108806, 0,
-3.096219, -3.257718, 0,
-2.93317, -3.108806, 2,
-3.096219, -3.257718, 2,
-2.93317, -3.108806, 4,
-3.096219, -3.257718, 4
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
-3.422315, -3.555542, -4, 0, -0.5, 0.5, 0.5,
-3.422315, -3.555542, -4, 1, -0.5, 0.5, 0.5,
-3.422315, -3.555542, -4, 1, 1.5, 0.5, 0.5,
-3.422315, -3.555542, -4, 0, 1.5, 0.5, 0.5,
-3.422315, -3.555542, -2, 0, -0.5, 0.5, 0.5,
-3.422315, -3.555542, -2, 1, -0.5, 0.5, 0.5,
-3.422315, -3.555542, -2, 1, 1.5, 0.5, 0.5,
-3.422315, -3.555542, -2, 0, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 0, 0, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 0, 1, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 0, 1, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 0, 0, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 2, 0, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 2, 1, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 2, 1, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 2, 0, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 4, 0, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 4, 1, -0.5, 0.5, 0.5,
-3.422315, -3.555542, 4, 1, 1.5, 0.5, 0.5,
-3.422315, -3.555542, 4, 0, 1.5, 0.5, 0.5
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
-2.93317, -3.108806, -5.427154,
-2.93317, 2.847669, -5.427154,
-2.93317, -3.108806, 5.918651,
-2.93317, 2.847669, 5.918651,
-2.93317, -3.108806, -5.427154,
-2.93317, -3.108806, 5.918651,
-2.93317, 2.847669, -5.427154,
-2.93317, 2.847669, 5.918651,
-2.93317, -3.108806, -5.427154,
3.588763, -3.108806, -5.427154,
-2.93317, -3.108806, 5.918651,
3.588763, -3.108806, 5.918651,
-2.93317, 2.847669, -5.427154,
3.588763, 2.847669, -5.427154,
-2.93317, 2.847669, 5.918651,
3.588763, 2.847669, 5.918651,
3.588763, -3.108806, -5.427154,
3.588763, 2.847669, -5.427154,
3.588763, -3.108806, 5.918651,
3.588763, 2.847669, 5.918651,
3.588763, -3.108806, -5.427154,
3.588763, -3.108806, 5.918651,
3.588763, 2.847669, -5.427154,
3.588763, 2.847669, 5.918651
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
var radius = 7.677863;
var distance = 34.15968;
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
mvMatrix.translate( -0.3277966, 0.1305685, -0.2457488 );
mvMatrix.scale( 1.272852, 1.393686, 0.7316762 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15968);
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
inabenfide<-read.table("inabenfide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-inabenfide$V2
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
y<-inabenfide$V3
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
z<-inabenfide$V4
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
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
-2.838191, 1.130058, -1.035212, 0, 0, 1, 1, 1,
-2.721649, -0.0818181, -3.713973, 1, 0, 0, 1, 1,
-2.716564, 0.1600317, -2.206792, 1, 0, 0, 1, 1,
-2.696703, 0.05008722, -1.161548, 1, 0, 0, 1, 1,
-2.659368, -1.174351, -2.567757, 1, 0, 0, 1, 1,
-2.617315, 0.9072132, -0.8595394, 1, 0, 0, 1, 1,
-2.603452, -0.5595822, -1.347757, 0, 0, 0, 1, 1,
-2.573495, -0.6939087, -1.897709, 0, 0, 0, 1, 1,
-2.569828, -0.655862, -2.647023, 0, 0, 0, 1, 1,
-2.545406, -1.053602, -4.486606, 0, 0, 0, 1, 1,
-2.529597, 0.5952458, -2.552608, 0, 0, 0, 1, 1,
-2.492758, -0.6127267, -0.2431803, 0, 0, 0, 1, 1,
-2.414603, -1.94769, -2.841584, 0, 0, 0, 1, 1,
-2.298875, -1.209962, -2.553613, 1, 1, 1, 1, 1,
-2.270881, 1.296142, 2.013896, 1, 1, 1, 1, 1,
-2.253418, 0.6515628, -1.153688, 1, 1, 1, 1, 1,
-2.191212, -1.880653, -1.015945, 1, 1, 1, 1, 1,
-2.138106, -0.427652, -1.99544, 1, 1, 1, 1, 1,
-2.127646, 1.225334, -1.605974, 1, 1, 1, 1, 1,
-2.124422, 0.2240462, -1.84835, 1, 1, 1, 1, 1,
-2.112766, -0.224846, -1.690925, 1, 1, 1, 1, 1,
-2.056367, -0.3970042, -2.356133, 1, 1, 1, 1, 1,
-2.05379, 0.9283044, 0.6370679, 1, 1, 1, 1, 1,
-2.047898, -1.150119, -2.855227, 1, 1, 1, 1, 1,
-2.043585, -0.9487289, -3.085189, 1, 1, 1, 1, 1,
-2.043412, 0.2455712, -2.026547, 1, 1, 1, 1, 1,
-2.037563, -0.6190972, -1.107701, 1, 1, 1, 1, 1,
-2.03547, -1.545802, -2.858608, 1, 1, 1, 1, 1,
-2.026679, -0.1817901, -2.291747, 0, 0, 1, 1, 1,
-1.986623, -0.6279632, -2.708193, 1, 0, 0, 1, 1,
-1.979828, 1.611934, -0.5563484, 1, 0, 0, 1, 1,
-1.972477, 0.2954139, -1.180554, 1, 0, 0, 1, 1,
-1.968438, 0.2500163, -0.362886, 1, 0, 0, 1, 1,
-1.95598, 0.3806072, -1.575086, 1, 0, 0, 1, 1,
-1.955804, -0.5028117, -1.406264, 0, 0, 0, 1, 1,
-1.932139, 2.535306, -0.3338487, 0, 0, 0, 1, 1,
-1.917693, -0.6562749, -1.040538, 0, 0, 0, 1, 1,
-1.914592, -0.2682436, -0.977263, 0, 0, 0, 1, 1,
-1.89656, -0.5986809, -0.6225022, 0, 0, 0, 1, 1,
-1.876734, 1.013354, -0.1289499, 0, 0, 0, 1, 1,
-1.872976, 0.8761355, -2.978639, 0, 0, 0, 1, 1,
-1.861371, -1.346742, -4.498979, 1, 1, 1, 1, 1,
-1.852002, 1.469069, -1.036595, 1, 1, 1, 1, 1,
-1.824127, -0.07067528, -2.584528, 1, 1, 1, 1, 1,
-1.797448, 0.3432289, -0.5933698, 1, 1, 1, 1, 1,
-1.790565, -1.808748, -1.755505, 1, 1, 1, 1, 1,
-1.786284, 0.2627066, -0.5289961, 1, 1, 1, 1, 1,
-1.783451, -0.7356776, -2.994843, 1, 1, 1, 1, 1,
-1.771139, 0.2767551, -0.1266435, 1, 1, 1, 1, 1,
-1.746652, -1.354023, -2.240902, 1, 1, 1, 1, 1,
-1.716925, -1.498578, -1.620147, 1, 1, 1, 1, 1,
-1.70523, 0.3654479, -1.270823, 1, 1, 1, 1, 1,
-1.695193, -0.110481, -2.372616, 1, 1, 1, 1, 1,
-1.691248, 0.3739909, -2.56629, 1, 1, 1, 1, 1,
-1.67362, -0.5133265, -0.8099257, 1, 1, 1, 1, 1,
-1.661273, 0.2191029, -1.685143, 1, 1, 1, 1, 1,
-1.656973, -1.513986, -1.880653, 0, 0, 1, 1, 1,
-1.648648, -0.5728915, -1.58933, 1, 0, 0, 1, 1,
-1.648506, 0.2403091, -2.905896, 1, 0, 0, 1, 1,
-1.641518, -0.6545155, -2.700948, 1, 0, 0, 1, 1,
-1.636493, 0.7627172, -1.067017, 1, 0, 0, 1, 1,
-1.636234, 1.360071, -0.5832192, 1, 0, 0, 1, 1,
-1.619693, 0.2676502, -2.064894, 0, 0, 0, 1, 1,
-1.604657, -1.12431, -2.346166, 0, 0, 0, 1, 1,
-1.594696, -1.230678, -3.540102, 0, 0, 0, 1, 1,
-1.567409, 0.1297411, -2.044558, 0, 0, 0, 1, 1,
-1.566621, -1.300686, -3.195481, 0, 0, 0, 1, 1,
-1.565869, -0.8378406, -2.001691, 0, 0, 0, 1, 1,
-1.558447, -0.1956104, -1.670852, 0, 0, 0, 1, 1,
-1.537213, 1.162918, 0.2748976, 1, 1, 1, 1, 1,
-1.535998, -0.1711532, -2.690843, 1, 1, 1, 1, 1,
-1.534822, -0.7161544, -3.133136, 1, 1, 1, 1, 1,
-1.530116, -0.4837742, -0.875268, 1, 1, 1, 1, 1,
-1.511459, -0.846691, -1.327909, 1, 1, 1, 1, 1,
-1.505799, -0.2175688, -2.23641, 1, 1, 1, 1, 1,
-1.492311, -0.6422099, -2.998497, 1, 1, 1, 1, 1,
-1.479498, 0.5156645, -2.003729, 1, 1, 1, 1, 1,
-1.472039, 0.3488437, -0.1663444, 1, 1, 1, 1, 1,
-1.469004, 0.2876877, -2.138858, 1, 1, 1, 1, 1,
-1.465162, -0.1292891, -0.8500187, 1, 1, 1, 1, 1,
-1.46395, -1.149305, -1.171498, 1, 1, 1, 1, 1,
-1.457411, 0.3476462, -0.3028197, 1, 1, 1, 1, 1,
-1.448462, -0.05396634, -0.1312767, 1, 1, 1, 1, 1,
-1.438117, 1.005007, -1.061882, 1, 1, 1, 1, 1,
-1.433966, 1.363084, -1.029765, 0, 0, 1, 1, 1,
-1.427791, 0.9306502, -1.732279, 1, 0, 0, 1, 1,
-1.425503, -0.7248323, -0.7809903, 1, 0, 0, 1, 1,
-1.422982, 0.7636835, -1.571306, 1, 0, 0, 1, 1,
-1.418082, 1.078099, -0.1127954, 1, 0, 0, 1, 1,
-1.417298, -0.7952381, -0.6936505, 1, 0, 0, 1, 1,
-1.388815, -0.9636575, -1.862306, 0, 0, 0, 1, 1,
-1.377001, 0.6717599, -2.051647, 0, 0, 0, 1, 1,
-1.37475, -1.683613, -3.82546, 0, 0, 0, 1, 1,
-1.36898, 1.349313, 0.1897038, 0, 0, 0, 1, 1,
-1.366658, -0.4108516, -2.46738, 0, 0, 0, 1, 1,
-1.346603, 0.7021241, -0.3948573, 0, 0, 0, 1, 1,
-1.336667, -0.1598758, -1.281203, 0, 0, 0, 1, 1,
-1.332072, -1.235586, -2.72571, 1, 1, 1, 1, 1,
-1.313993, 1.549859, -0.446053, 1, 1, 1, 1, 1,
-1.310782, -1.086823, -1.24768, 1, 1, 1, 1, 1,
-1.307402, -1.285429, -1.786341, 1, 1, 1, 1, 1,
-1.302769, -1.756806, -1.028635, 1, 1, 1, 1, 1,
-1.301013, 0.4032754, -1.431446, 1, 1, 1, 1, 1,
-1.29857, 1.069072, -0.5633507, 1, 1, 1, 1, 1,
-1.278111, 0.09017552, 0.1859192, 1, 1, 1, 1, 1,
-1.275432, -0.8715209, -2.75204, 1, 1, 1, 1, 1,
-1.272243, -0.4177914, -3.280269, 1, 1, 1, 1, 1,
-1.268985, 0.1048745, -1.578066, 1, 1, 1, 1, 1,
-1.267013, 0.7348028, -0.5701366, 1, 1, 1, 1, 1,
-1.265627, 0.9111083, -2.702044, 1, 1, 1, 1, 1,
-1.264062, -0.5922122, -2.011381, 1, 1, 1, 1, 1,
-1.255429, -0.2215447, -1.717995, 1, 1, 1, 1, 1,
-1.249293, 1.554756, 0.5741019, 0, 0, 1, 1, 1,
-1.220497, 0.665957, -0.1336321, 1, 0, 0, 1, 1,
-1.218618, -0.0608774, -1.399687, 1, 0, 0, 1, 1,
-1.212944, -0.7918444, -1.715649, 1, 0, 0, 1, 1,
-1.210058, -0.9164353, -2.545941, 1, 0, 0, 1, 1,
-1.204697, -0.05268125, -1.644467, 1, 0, 0, 1, 1,
-1.20293, 0.5636335, -3.285095, 0, 0, 0, 1, 1,
-1.201563, -2.392206, -3.52048, 0, 0, 0, 1, 1,
-1.20146, 0.5902673, -0.6494192, 0, 0, 0, 1, 1,
-1.200553, 0.07300056, -1.687518, 0, 0, 0, 1, 1,
-1.199249, -0.09862852, -0.4666065, 0, 0, 0, 1, 1,
-1.191552, 0.6045924, -2.609385, 0, 0, 0, 1, 1,
-1.189675, -0.2311911, -2.800858, 0, 0, 0, 1, 1,
-1.183932, 1.282007, -0.1943514, 1, 1, 1, 1, 1,
-1.183903, -0.4177361, -2.734616, 1, 1, 1, 1, 1,
-1.162355, 1.190935, -2.192857, 1, 1, 1, 1, 1,
-1.15879, 2.063381, -0.8224397, 1, 1, 1, 1, 1,
-1.149316, 0.766649, -0.9551334, 1, 1, 1, 1, 1,
-1.146343, -0.4594964, -0.7115036, 1, 1, 1, 1, 1,
-1.136875, 0.03815297, -1.626969, 1, 1, 1, 1, 1,
-1.13617, -0.7291716, -1.522814, 1, 1, 1, 1, 1,
-1.132885, -0.3725613, -3.565783, 1, 1, 1, 1, 1,
-1.132613, -1.191926, -3.211831, 1, 1, 1, 1, 1,
-1.128893, -2.29812, -2.219886, 1, 1, 1, 1, 1,
-1.12359, 0.4232159, -0.8760453, 1, 1, 1, 1, 1,
-1.118951, 0.2145848, -1.612147, 1, 1, 1, 1, 1,
-1.116852, 0.9052873, -0.9784556, 1, 1, 1, 1, 1,
-1.109661, 1.978175, 0.4659647, 1, 1, 1, 1, 1,
-1.106014, 0.4475693, -1.545497, 0, 0, 1, 1, 1,
-1.102592, -0.113126, -0.5537223, 1, 0, 0, 1, 1,
-1.097562, -0.6465397, -0.9612191, 1, 0, 0, 1, 1,
-1.082568, 1.042779, -0.6020459, 1, 0, 0, 1, 1,
-1.078152, 1.891002, -0.07799377, 1, 0, 0, 1, 1,
-1.072666, -1.436407, -0.6273444, 1, 0, 0, 1, 1,
-1.071473, 1.037704, -1.399626, 0, 0, 0, 1, 1,
-1.068119, -0.120104, -0.1390288, 0, 0, 0, 1, 1,
-1.066785, 0.2296432, -2.525014, 0, 0, 0, 1, 1,
-1.049004, 0.6515839, -1.547259, 0, 0, 0, 1, 1,
-1.039297, 0.5492395, 0.757092, 0, 0, 0, 1, 1,
-1.03093, -0.7957153, -2.030334, 0, 0, 0, 1, 1,
-1.030856, -0.03144578, -0.5808275, 0, 0, 0, 1, 1,
-1.029119, 0.3733859, -1.195785, 1, 1, 1, 1, 1,
-1.026171, -0.507181, -0.9058622, 1, 1, 1, 1, 1,
-1.023582, -0.7563213, -2.664209, 1, 1, 1, 1, 1,
-1.020321, -0.7709461, -2.083569, 1, 1, 1, 1, 1,
-1.01678, 1.192257, 1.548625, 1, 1, 1, 1, 1,
-1.015787, 1.367561, -1.264845, 1, 1, 1, 1, 1,
-1.013293, 0.0834889, -1.786182, 1, 1, 1, 1, 1,
-1.012291, -0.5292265, -2.944518, 1, 1, 1, 1, 1,
-1.002177, -1.806361, -4.024137, 1, 1, 1, 1, 1,
-0.9979563, -0.1740151, -1.641011, 1, 1, 1, 1, 1,
-0.9924836, -0.1928711, -0.75506, 1, 1, 1, 1, 1,
-0.9802691, 0.2634853, -1.391457, 1, 1, 1, 1, 1,
-0.9776183, -0.439826, -2.482549, 1, 1, 1, 1, 1,
-0.9774482, 0.944355, -0.2233587, 1, 1, 1, 1, 1,
-0.9758503, 2.313842, -0.7771303, 1, 1, 1, 1, 1,
-0.9747784, -1.907449, -1.852989, 0, 0, 1, 1, 1,
-0.9703982, 0.6839758, 0.07638501, 1, 0, 0, 1, 1,
-0.9687793, -0.1405536, -1.901813, 1, 0, 0, 1, 1,
-0.9678692, 0.487911, -1.851792, 1, 0, 0, 1, 1,
-0.9638328, 0.3341474, -1.283081, 1, 0, 0, 1, 1,
-0.9524714, -1.073856, -4.579289, 1, 0, 0, 1, 1,
-0.9520202, -0.4741264, -2.073768, 0, 0, 0, 1, 1,
-0.9518078, -0.6095579, -2.778682, 0, 0, 0, 1, 1,
-0.9508587, 1.805345, 1.146363, 0, 0, 0, 1, 1,
-0.946039, -0.4885643, -2.827211, 0, 0, 0, 1, 1,
-0.9402614, 0.944634, -1.866282, 0, 0, 0, 1, 1,
-0.928742, 0.608271, -1.666056, 0, 0, 0, 1, 1,
-0.928418, -0.3541764, -2.14349, 0, 0, 0, 1, 1,
-0.923642, 0.16362, -2.202849, 1, 1, 1, 1, 1,
-0.9232351, -0.6791343, -2.621097, 1, 1, 1, 1, 1,
-0.9225571, 1.247167, -0.9224107, 1, 1, 1, 1, 1,
-0.9195136, 0.1866836, -1.865677, 1, 1, 1, 1, 1,
-0.9160454, 0.6308154, -0.6430358, 1, 1, 1, 1, 1,
-0.9159411, -0.3732861, -1.757366, 1, 1, 1, 1, 1,
-0.9088202, 0.253209, -2.114395, 1, 1, 1, 1, 1,
-0.9063867, -0.1836903, -0.9373748, 1, 1, 1, 1, 1,
-0.9037107, 1.073869, -0.5183472, 1, 1, 1, 1, 1,
-0.9027866, 0.4239279, -0.3234417, 1, 1, 1, 1, 1,
-0.9012725, 0.1703167, -2.349063, 1, 1, 1, 1, 1,
-0.8969397, 1.213394, 0.3502522, 1, 1, 1, 1, 1,
-0.888181, 0.8028744, -0.0003981419, 1, 1, 1, 1, 1,
-0.8836144, 0.1928179, -0.6282749, 1, 1, 1, 1, 1,
-0.8754679, 1.181366, -0.3950486, 1, 1, 1, 1, 1,
-0.8734646, 0.5936009, 0.3770618, 0, 0, 1, 1, 1,
-0.866765, 0.8550526, -0.1313375, 1, 0, 0, 1, 1,
-0.8615603, 2.107659, -1.234668, 1, 0, 0, 1, 1,
-0.8615419, 2.05337, -0.8239174, 1, 0, 0, 1, 1,
-0.8574149, -0.5023981, -2.482164, 1, 0, 0, 1, 1,
-0.8553349, -0.5930281, -3.07602, 1, 0, 0, 1, 1,
-0.8424207, -1.361511, -1.408951, 0, 0, 0, 1, 1,
-0.8284056, -0.120415, -2.64668, 0, 0, 0, 1, 1,
-0.8249366, -0.5863325, -2.184458, 0, 0, 0, 1, 1,
-0.8159524, -0.724587, -1.640978, 0, 0, 0, 1, 1,
-0.8079748, -1.028164, -2.236605, 0, 0, 0, 1, 1,
-0.8075366, -0.5451389, -2.599474, 0, 0, 0, 1, 1,
-0.8005446, -1.356707, -0.9495256, 0, 0, 0, 1, 1,
-0.799156, -0.8192636, -2.305634, 1, 1, 1, 1, 1,
-0.7950451, -1.796655, -2.515155, 1, 1, 1, 1, 1,
-0.7940403, 0.2727776, -0.989803, 1, 1, 1, 1, 1,
-0.7844324, 0.484791, -1.533962, 1, 1, 1, 1, 1,
-0.7815594, -0.555262, -2.371097, 1, 1, 1, 1, 1,
-0.7793103, 1.257959, -0.4566969, 1, 1, 1, 1, 1,
-0.7761946, 0.6136329, -1.752, 1, 1, 1, 1, 1,
-0.7741338, -1.494111, -3.931103, 1, 1, 1, 1, 1,
-0.7700916, -1.697097, -0.7631679, 1, 1, 1, 1, 1,
-0.7666164, -1.708246, -3.766314, 1, 1, 1, 1, 1,
-0.7597181, 1.419187, -1.522966, 1, 1, 1, 1, 1,
-0.7556917, 0.4242996, -1.870263, 1, 1, 1, 1, 1,
-0.7554964, 1.607995, 0.4712247, 1, 1, 1, 1, 1,
-0.7497665, -0.01413659, -3.772915, 1, 1, 1, 1, 1,
-0.7485023, 0.2964244, -0.4225244, 1, 1, 1, 1, 1,
-0.7384917, 0.7940137, -0.1488423, 0, 0, 1, 1, 1,
-0.7372378, -1.06638, -0.8991292, 1, 0, 0, 1, 1,
-0.7350314, 0.4678993, -0.3055284, 1, 0, 0, 1, 1,
-0.7340468, 1.035275, 0.08938794, 1, 0, 0, 1, 1,
-0.733012, 0.8720946, -1.290109, 1, 0, 0, 1, 1,
-0.7297133, 0.6936335, 0.1933013, 1, 0, 0, 1, 1,
-0.7214326, 0.6957625, -0.3533472, 0, 0, 0, 1, 1,
-0.7169339, 0.386233, -0.4009681, 0, 0, 0, 1, 1,
-0.715786, -1.216894, -2.443705, 0, 0, 0, 1, 1,
-0.7154657, 1.509211, -0.1111557, 0, 0, 0, 1, 1,
-0.7147255, -0.1010538, 0.02637861, 0, 0, 0, 1, 1,
-0.7138491, 0.1210854, 0.2516648, 0, 0, 0, 1, 1,
-0.7097721, 0.320981, -1.776721, 0, 0, 0, 1, 1,
-0.7084764, -0.6111283, -3.054877, 1, 1, 1, 1, 1,
-0.7062334, 0.3804842, -0.5592512, 1, 1, 1, 1, 1,
-0.7017406, 0.9726414, -1.267489, 1, 1, 1, 1, 1,
-0.7001753, -0.9813072, -2.409258, 1, 1, 1, 1, 1,
-0.6995308, -1.161218, -1.661413, 1, 1, 1, 1, 1,
-0.6948739, 1.066783, -0.7164022, 1, 1, 1, 1, 1,
-0.6906669, 1.580555, -0.4205238, 1, 1, 1, 1, 1,
-0.682835, -1.353705, -2.573838, 1, 1, 1, 1, 1,
-0.6802319, 0.05499066, -2.838058, 1, 1, 1, 1, 1,
-0.6771417, -1.222767, -1.742126, 1, 1, 1, 1, 1,
-0.6748745, -1.99114, -2.923271, 1, 1, 1, 1, 1,
-0.6736584, -0.05067273, -1.098485, 1, 1, 1, 1, 1,
-0.6734567, -0.882748, -4.596877, 1, 1, 1, 1, 1,
-0.6681772, 0.5085632, -1.514749, 1, 1, 1, 1, 1,
-0.6647303, 1.3049, -1.035956, 1, 1, 1, 1, 1,
-0.6608225, 1.137111, -0.9528453, 0, 0, 1, 1, 1,
-0.6580694, -0.2667321, -3.307418, 1, 0, 0, 1, 1,
-0.6570861, 0.26735, -1.550972, 1, 0, 0, 1, 1,
-0.6555102, -0.283888, -1.884036, 1, 0, 0, 1, 1,
-0.6524177, 0.4041113, -1.098851, 1, 0, 0, 1, 1,
-0.6448466, -0.3796985, -2.395077, 1, 0, 0, 1, 1,
-0.6421979, -1.33543, -3.117105, 0, 0, 0, 1, 1,
-0.6414816, -1.174764, -2.071164, 0, 0, 0, 1, 1,
-0.639317, 1.642661, 0.5954063, 0, 0, 0, 1, 1,
-0.6380089, -0.3214144, -1.883413, 0, 0, 0, 1, 1,
-0.635066, -1.407533, -2.107082, 0, 0, 0, 1, 1,
-0.6346288, -2.100105, -3.820905, 0, 0, 0, 1, 1,
-0.6319175, -1.117886, -3.188149, 0, 0, 0, 1, 1,
-0.6318922, -0.006771198, -2.367629, 1, 1, 1, 1, 1,
-0.6316948, -1.221857, -2.07311, 1, 1, 1, 1, 1,
-0.6315309, 0.6896821, -0.08452238, 1, 1, 1, 1, 1,
-0.6294309, -1.440194, -3.94601, 1, 1, 1, 1, 1,
-0.6245838, -0.0429555, -0.9078744, 1, 1, 1, 1, 1,
-0.6243086, -2.472056, -2.004095, 1, 1, 1, 1, 1,
-0.623576, 0.4468775, 0.3461429, 1, 1, 1, 1, 1,
-0.6217477, -0.9815076, -2.383895, 1, 1, 1, 1, 1,
-0.6210107, 1.308638, 0.3628065, 1, 1, 1, 1, 1,
-0.61996, -0.9394017, -2.804283, 1, 1, 1, 1, 1,
-0.615064, -1.23031, -3.343739, 1, 1, 1, 1, 1,
-0.6146525, 2.760925, -2.326237, 1, 1, 1, 1, 1,
-0.6134882, -1.719419, -2.460544, 1, 1, 1, 1, 1,
-0.6121583, -0.3461187, -2.767921, 1, 1, 1, 1, 1,
-0.6119848, 1.561033, -0.5453969, 1, 1, 1, 1, 1,
-0.6078166, 0.5382355, -0.04149995, 0, 0, 1, 1, 1,
-0.6076791, -1.076089, -1.671348, 1, 0, 0, 1, 1,
-0.6070225, -0.1629312, -4.280517, 1, 0, 0, 1, 1,
-0.6028426, 0.111889, -2.990002, 1, 0, 0, 1, 1,
-0.6026049, 0.04055839, -2.663367, 1, 0, 0, 1, 1,
-0.6009063, -0.4627831, -2.036309, 1, 0, 0, 1, 1,
-0.5949264, 0.7086956, -0.2834783, 0, 0, 0, 1, 1,
-0.5929888, -0.5160758, -2.310342, 0, 0, 0, 1, 1,
-0.5913303, -2.244275, -1.734729, 0, 0, 0, 1, 1,
-0.5895208, 0.3544136, -1.180415, 0, 0, 0, 1, 1,
-0.5856302, -1.177205, -1.799636, 0, 0, 0, 1, 1,
-0.5855973, 0.5361729, -1.602577, 0, 0, 0, 1, 1,
-0.5853769, -1.335625, -2.651673, 0, 0, 0, 1, 1,
-0.5844944, 0.8121248, -1.039807, 1, 1, 1, 1, 1,
-0.5831732, 0.5804446, -2.878036, 1, 1, 1, 1, 1,
-0.5796911, 0.1012854, -2.004938, 1, 1, 1, 1, 1,
-0.5710956, 0.6172194, -1.003556, 1, 1, 1, 1, 1,
-0.5702246, -0.40192, -1.334035, 1, 1, 1, 1, 1,
-0.5604362, -0.9064161, -3.59803, 1, 1, 1, 1, 1,
-0.557915, 0.7348052, -1.497637, 1, 1, 1, 1, 1,
-0.5565163, 0.8378468, 0.5405893, 1, 1, 1, 1, 1,
-0.5561709, 0.09760674, -1.736378, 1, 1, 1, 1, 1,
-0.5556363, 1.200497, -1.232306, 1, 1, 1, 1, 1,
-0.5524449, -0.7650689, -0.6099821, 1, 1, 1, 1, 1,
-0.5448331, 1.390373, 1.502834, 1, 1, 1, 1, 1,
-0.542092, 1.142511, -2.920055, 1, 1, 1, 1, 1,
-0.5412774, -1.623109, -3.280305, 1, 1, 1, 1, 1,
-0.5380872, -1.756441, -3.030196, 1, 1, 1, 1, 1,
-0.5366774, -0.7027707, -2.642147, 0, 0, 1, 1, 1,
-0.536059, 0.9757652, -1.078903, 1, 0, 0, 1, 1,
-0.5331177, 0.7271065, 1.001324, 1, 0, 0, 1, 1,
-0.5330321, -0.4817647, -2.136863, 1, 0, 0, 1, 1,
-0.5199106, 1.488802, -0.5627655, 1, 0, 0, 1, 1,
-0.5158365, -0.9748363, -2.051829, 1, 0, 0, 1, 1,
-0.5153174, -0.415068, -1.856749, 0, 0, 0, 1, 1,
-0.5110565, -0.8245654, -1.635812, 0, 0, 0, 1, 1,
-0.5088686, 0.2036348, -0.8841907, 0, 0, 0, 1, 1,
-0.5077016, 0.3511802, -0.9311415, 0, 0, 0, 1, 1,
-0.5051757, -0.02993043, -1.353044, 0, 0, 0, 1, 1,
-0.5045521, 0.1210542, -2.813857, 0, 0, 0, 1, 1,
-0.5004641, 0.6013556, 0.6836896, 0, 0, 0, 1, 1,
-0.4975177, -0.4910686, -1.251462, 1, 1, 1, 1, 1,
-0.495461, -0.387113, -0.6811177, 1, 1, 1, 1, 1,
-0.4931816, -1.217778, -2.026052, 1, 1, 1, 1, 1,
-0.4884289, -0.1237204, -3.694437, 1, 1, 1, 1, 1,
-0.4831178, -0.2888317, -2.921673, 1, 1, 1, 1, 1,
-0.4830278, -1.334849, -2.515197, 1, 1, 1, 1, 1,
-0.4823507, -0.5090161, -1.950627, 1, 1, 1, 1, 1,
-0.4813075, 1.438674, -1.690419, 1, 1, 1, 1, 1,
-0.476231, 0.9143435, -0.5661676, 1, 1, 1, 1, 1,
-0.4753223, -0.4102078, -0.001609315, 1, 1, 1, 1, 1,
-0.4749202, 0.880213, -0.4835646, 1, 1, 1, 1, 1,
-0.4749107, -0.4218136, -3.542987, 1, 1, 1, 1, 1,
-0.4693345, 0.7356906, 2.59053, 1, 1, 1, 1, 1,
-0.461805, 0.06258091, -2.551287, 1, 1, 1, 1, 1,
-0.4535791, -0.3110397, -0.9957197, 1, 1, 1, 1, 1,
-0.4535633, 1.629686, -0.5639203, 0, 0, 1, 1, 1,
-0.4513726, -2.227936, -3.939116, 1, 0, 0, 1, 1,
-0.4429521, 1.383405, 1.05253, 1, 0, 0, 1, 1,
-0.4421584, 0.2425093, -0.8637675, 1, 0, 0, 1, 1,
-0.4416528, -0.4939752, -2.376922, 1, 0, 0, 1, 1,
-0.4397128, -0.4864613, -1.711961, 1, 0, 0, 1, 1,
-0.4396617, -0.5301505, -2.756432, 0, 0, 0, 1, 1,
-0.4378559, 0.7829717, -0.01275306, 0, 0, 0, 1, 1,
-0.4365864, -0.6666624, -4.717916, 0, 0, 0, 1, 1,
-0.4354538, -2.195316, -2.999708, 0, 0, 0, 1, 1,
-0.4233969, 0.9901562, 0.05240287, 0, 0, 0, 1, 1,
-0.4189889, 0.4813409, 1.143889, 0, 0, 0, 1, 1,
-0.4159265, 0.5325074, -2.614459, 0, 0, 0, 1, 1,
-0.4141377, -0.4859104, -4.419233, 1, 1, 1, 1, 1,
-0.4105435, 0.2113628, -3.51995, 1, 1, 1, 1, 1,
-0.4080999, -1.000606, -3.554842, 1, 1, 1, 1, 1,
-0.4038481, 0.08850292, -0.263103, 1, 1, 1, 1, 1,
-0.4034351, 1.377542, 0.09019385, 1, 1, 1, 1, 1,
-0.4029589, 0.2847668, -1.846352, 1, 1, 1, 1, 1,
-0.4017392, 0.4404026, 0.003553967, 1, 1, 1, 1, 1,
-0.394421, -0.1615484, -3.66759, 1, 1, 1, 1, 1,
-0.3897504, -0.01460177, -2.133065, 1, 1, 1, 1, 1,
-0.3853084, 0.0555515, -2.140969, 1, 1, 1, 1, 1,
-0.3847776, 1.275091, -0.4771768, 1, 1, 1, 1, 1,
-0.3843004, 0.2468709, -0.1446849, 1, 1, 1, 1, 1,
-0.3805176, -0.03485518, -2.241046, 1, 1, 1, 1, 1,
-0.3796537, 1.280228, -1.26582, 1, 1, 1, 1, 1,
-0.3750313, -0.3053554, -3.76687, 1, 1, 1, 1, 1,
-0.3742255, 1.364087, 0.4710631, 0, 0, 1, 1, 1,
-0.374062, 0.8747323, -0.5647599, 1, 0, 0, 1, 1,
-0.3717503, 0.4922168, -1.962434, 1, 0, 0, 1, 1,
-0.3708391, -0.1903714, -2.642639, 1, 0, 0, 1, 1,
-0.3664861, 0.9569938, 0.4708114, 1, 0, 0, 1, 1,
-0.3625771, 0.7452602, 0.7846841, 1, 0, 0, 1, 1,
-0.3598219, -1.22173, -1.576949, 0, 0, 0, 1, 1,
-0.3525202, 0.7496426, -1.487917, 0, 0, 0, 1, 1,
-0.3491394, -0.2296921, -1.863181, 0, 0, 0, 1, 1,
-0.3438061, 0.9727832, -1.261331, 0, 0, 0, 1, 1,
-0.3430743, -0.6347503, -3.780793, 0, 0, 0, 1, 1,
-0.3413934, -1.824602, -3.880233, 0, 0, 0, 1, 1,
-0.3402041, -0.2702151, -1.779631, 0, 0, 0, 1, 1,
-0.3381834, 0.5825392, -0.9769976, 1, 1, 1, 1, 1,
-0.3361808, 0.8781274, -1.247659, 1, 1, 1, 1, 1,
-0.3344842, 0.7633866, -1.150067, 1, 1, 1, 1, 1,
-0.3344297, -0.4789884, -3.798879, 1, 1, 1, 1, 1,
-0.332294, 0.3107259, 0.03930845, 1, 1, 1, 1, 1,
-0.3223571, -0.08067883, -1.220521, 1, 1, 1, 1, 1,
-0.3215295, -0.6429295, -3.247282, 1, 1, 1, 1, 1,
-0.320496, -0.928609, -2.990418, 1, 1, 1, 1, 1,
-0.3194607, 0.6896713, 0.5086623, 1, 1, 1, 1, 1,
-0.3184225, 1.322749, 2.173221, 1, 1, 1, 1, 1,
-0.3155705, 1.563593, 0.5615371, 1, 1, 1, 1, 1,
-0.3041961, -0.6566197, -4.351311, 1, 1, 1, 1, 1,
-0.3014016, -0.07493454, -0.8153641, 1, 1, 1, 1, 1,
-0.300889, -0.486413, -2.819345, 1, 1, 1, 1, 1,
-0.2991423, -0.3086449, -1.950898, 1, 1, 1, 1, 1,
-0.298489, -0.5736936, -5.261923, 0, 0, 1, 1, 1,
-0.296201, -1.434399, -2.672209, 1, 0, 0, 1, 1,
-0.2960361, 0.4635717, -0.2394894, 1, 0, 0, 1, 1,
-0.2945281, -0.5180029, -3.697659, 1, 0, 0, 1, 1,
-0.2931125, 0.2122054, -0.114156, 1, 0, 0, 1, 1,
-0.2889734, -0.4386992, -1.022052, 1, 0, 0, 1, 1,
-0.2827961, 0.1357114, 0.4574131, 0, 0, 0, 1, 1,
-0.2791392, 0.6396748, 0.1173491, 0, 0, 0, 1, 1,
-0.2725076, 0.3362715, -0.7819457, 0, 0, 0, 1, 1,
-0.2668567, 1.15127, -1.317149, 0, 0, 0, 1, 1,
-0.2667564, -1.628265, -4.108173, 0, 0, 0, 1, 1,
-0.2665733, 0.4383122, -2.390345, 0, 0, 0, 1, 1,
-0.2656455, -1.09782, -3.448457, 0, 0, 0, 1, 1,
-0.2652324, 0.2106801, -0.02415149, 1, 1, 1, 1, 1,
-0.2611721, -0.2642821, -3.123783, 1, 1, 1, 1, 1,
-0.2583968, -0.02055408, -0.9843825, 1, 1, 1, 1, 1,
-0.2580236, 0.413928, -0.4984339, 1, 1, 1, 1, 1,
-0.2567842, 0.2259988, -2.659497, 1, 1, 1, 1, 1,
-0.2559433, -2.406388, -2.241321, 1, 1, 1, 1, 1,
-0.2542657, 1.320413, -1.582887, 1, 1, 1, 1, 1,
-0.2474077, 0.5074389, 0.06429959, 1, 1, 1, 1, 1,
-0.2445338, -0.1183668, -0.7896951, 1, 1, 1, 1, 1,
-0.2444669, -1.035505, -0.6421621, 1, 1, 1, 1, 1,
-0.2441447, 0.1777131, -1.315263, 1, 1, 1, 1, 1,
-0.2412123, -1.038399, -2.549688, 1, 1, 1, 1, 1,
-0.2365831, 0.06433768, -0.7959363, 1, 1, 1, 1, 1,
-0.2326167, -0.6211417, -2.460727, 1, 1, 1, 1, 1,
-0.2271371, 0.0196131, -0.899316, 1, 1, 1, 1, 1,
-0.2247572, -0.3263876, -2.116975, 0, 0, 1, 1, 1,
-0.2214812, 1.385413, -0.06529611, 1, 0, 0, 1, 1,
-0.2201935, 0.07832374, -1.560841, 1, 0, 0, 1, 1,
-0.2126969, -2.461748, -3.164162, 1, 0, 0, 1, 1,
-0.2104691, -0.5721661, -1.302168, 1, 0, 0, 1, 1,
-0.2096704, 1.439785, 0.1133156, 1, 0, 0, 1, 1,
-0.2076676, -0.2310403, -2.950258, 0, 0, 0, 1, 1,
-0.2073462, 0.8251456, -0.7044422, 0, 0, 0, 1, 1,
-0.1994745, -0.7418105, -4.142632, 0, 0, 0, 1, 1,
-0.1974172, -2.419912, -3.827024, 0, 0, 0, 1, 1,
-0.1930775, -0.5336463, -2.735541, 0, 0, 0, 1, 1,
-0.1926156, 1.869225, 0.3910974, 0, 0, 0, 1, 1,
-0.1921456, 0.7113824, -1.97389, 0, 0, 0, 1, 1,
-0.1907499, -1.50293, -1.035558, 1, 1, 1, 1, 1,
-0.1858902, 0.1711182, -0.2027775, 1, 1, 1, 1, 1,
-0.1847145, -0.1114723, -1.819443, 1, 1, 1, 1, 1,
-0.1845102, 0.282197, -1.440452, 1, 1, 1, 1, 1,
-0.1771337, 0.9215595, -1.085949, 1, 1, 1, 1, 1,
-0.1737676, 2.430289, -1.835461, 1, 1, 1, 1, 1,
-0.1683666, -1.859832, -3.641374, 1, 1, 1, 1, 1,
-0.1670367, 0.1831119, -0.9127579, 1, 1, 1, 1, 1,
-0.1664919, 0.4943015, -0.6859023, 1, 1, 1, 1, 1,
-0.1610244, -0.6961722, -3.028024, 1, 1, 1, 1, 1,
-0.1512558, 0.9686974, -1.228536, 1, 1, 1, 1, 1,
-0.149233, -0.0123452, -4.523324, 1, 1, 1, 1, 1,
-0.1456021, 1.731474, 0.9650083, 1, 1, 1, 1, 1,
-0.145017, 0.6212744, -0.573072, 1, 1, 1, 1, 1,
-0.1367036, -0.7197797, -4.108103, 1, 1, 1, 1, 1,
-0.1357022, -0.2192933, -3.367596, 0, 0, 1, 1, 1,
-0.1300914, -0.02334038, -1.877308, 1, 0, 0, 1, 1,
-0.1287869, -2.506524, -3.486402, 1, 0, 0, 1, 1,
-0.1263225, -1.716893, -3.496434, 1, 0, 0, 1, 1,
-0.1262439, 0.2273244, -1.23513, 1, 0, 0, 1, 1,
-0.1256205, -1.908083, -2.741815, 1, 0, 0, 1, 1,
-0.1236763, 0.4032716, -0.5184665, 0, 0, 0, 1, 1,
-0.1235637, 1.427329, 0.4148243, 0, 0, 0, 1, 1,
-0.116251, -0.05549992, -1.030301, 0, 0, 0, 1, 1,
-0.1155972, -0.5670103, -1.709631, 0, 0, 0, 1, 1,
-0.1143602, 0.005721983, -1.644913, 0, 0, 0, 1, 1,
-0.1137543, -2.345862, -4.779453, 0, 0, 0, 1, 1,
-0.110585, 0.1327354, 0.2521671, 0, 0, 0, 1, 1,
-0.1067987, 2.693599, 0.1234044, 1, 1, 1, 1, 1,
-0.1052357, 0.361782, -1.528434, 1, 1, 1, 1, 1,
-0.104917, 0.3254202, 0.5597982, 1, 1, 1, 1, 1,
-0.09854575, 0.2711144, -1.494673, 1, 1, 1, 1, 1,
-0.09802478, 0.9002036, -0.7571241, 1, 1, 1, 1, 1,
-0.0979514, -0.9493366, -3.942183, 1, 1, 1, 1, 1,
-0.0966403, -0.5037515, -3.396238, 1, 1, 1, 1, 1,
-0.0952531, 0.9727353, -0.1647616, 1, 1, 1, 1, 1,
-0.09480871, 0.5416199, -0.4696102, 1, 1, 1, 1, 1,
-0.09360103, 0.6195387, 0.8057631, 1, 1, 1, 1, 1,
-0.0929473, -1.906352, -3.310596, 1, 1, 1, 1, 1,
-0.09254552, -1.701887, -3.291375, 1, 1, 1, 1, 1,
-0.09189669, 1.055015, -1.211659, 1, 1, 1, 1, 1,
-0.09008965, -0.7690042, -0.6257485, 1, 1, 1, 1, 1,
-0.08831727, 0.1463957, -0.8322905, 1, 1, 1, 1, 1,
-0.08786853, -0.1200283, -1.778025, 0, 0, 1, 1, 1,
-0.08674739, -0.02153721, -2.357831, 1, 0, 0, 1, 1,
-0.08576825, -0.7858734, -3.874671, 1, 0, 0, 1, 1,
-0.08469259, 1.872995, -0.8036609, 1, 0, 0, 1, 1,
-0.08462007, -1.211527, -4.32133, 1, 0, 0, 1, 1,
-0.07299305, 0.1359904, -0.2090037, 1, 0, 0, 1, 1,
-0.07256112, 0.7826886, 0.1672, 0, 0, 0, 1, 1,
-0.07227629, 0.4931718, 0.5573538, 0, 0, 0, 1, 1,
-0.07176863, -1.597498, -1.097096, 0, 0, 0, 1, 1,
-0.06752411, 0.3351365, -0.6658162, 0, 0, 0, 1, 1,
-0.06423254, 0.2622328, -0.7934858, 0, 0, 0, 1, 1,
-0.06063218, -1.137309, -3.720143, 0, 0, 0, 1, 1,
-0.05155924, 0.175575, -1.114329, 0, 0, 0, 1, 1,
-0.05003174, 0.766064, -0.2599092, 1, 1, 1, 1, 1,
-0.04101728, 0.4703071, -0.1304975, 1, 1, 1, 1, 1,
-0.03897511, -1.651332, -3.459749, 1, 1, 1, 1, 1,
-0.03441522, -1.395627, -1.925106, 1, 1, 1, 1, 1,
-0.03322805, -0.3590648, -1.889799, 1, 1, 1, 1, 1,
-0.03263575, -1.50919, -3.269467, 1, 1, 1, 1, 1,
-0.03145014, 0.5977727, -0.85438, 1, 1, 1, 1, 1,
-0.02582189, -0.4285894, -0.4219707, 1, 1, 1, 1, 1,
-0.02368837, 1.621185, -0.3105455, 1, 1, 1, 1, 1,
-0.02254237, -0.7571879, -3.313332, 1, 1, 1, 1, 1,
-0.02055063, -0.4123774, -3.276987, 1, 1, 1, 1, 1,
-0.01972833, 0.1415572, 1.372814, 1, 1, 1, 1, 1,
-0.01706185, -1.321333, -3.676435, 1, 1, 1, 1, 1,
-0.01300382, 2.016596, 0.4284465, 1, 1, 1, 1, 1,
-0.01160943, 0.1907642, 0.1283871, 1, 1, 1, 1, 1,
-0.0103797, -0.4970956, -3.010326, 0, 0, 1, 1, 1,
-0.00968294, -0.2428169, -2.423709, 1, 0, 0, 1, 1,
-0.009610905, -0.7104296, -4.428725, 1, 0, 0, 1, 1,
0.002161752, -0.3887326, 3.114136, 1, 0, 0, 1, 1,
0.008298231, -1.524898, 2.131434, 1, 0, 0, 1, 1,
0.009779845, -0.348816, 2.77954, 1, 0, 0, 1, 1,
0.01078376, -1.161262, 2.007104, 0, 0, 0, 1, 1,
0.01292919, 1.345336, -0.4165662, 0, 0, 0, 1, 1,
0.01553209, 1.09324, 2.927247, 0, 0, 0, 1, 1,
0.02776873, 0.09124846, -1.923917, 0, 0, 0, 1, 1,
0.02880346, -0.2388971, 1.740729, 0, 0, 0, 1, 1,
0.03120354, 0.3225194, 0.9804608, 0, 0, 0, 1, 1,
0.03983173, -1.018309, 4.396508, 0, 0, 0, 1, 1,
0.04441071, -0.9031644, 3.564139, 1, 1, 1, 1, 1,
0.04567025, 0.005616889, 1.790493, 1, 1, 1, 1, 1,
0.04659374, -0.8126847, 3.946174, 1, 1, 1, 1, 1,
0.04994034, 0.6129376, -0.1632807, 1, 1, 1, 1, 1,
0.05124186, 0.5688397, -1.356207, 1, 1, 1, 1, 1,
0.05241021, -0.4991273, 3.59666, 1, 1, 1, 1, 1,
0.05758046, -0.791222, 2.943253, 1, 1, 1, 1, 1,
0.05968745, -1.146679, 2.936962, 1, 1, 1, 1, 1,
0.0598441, 0.9379014, 0.8988174, 1, 1, 1, 1, 1,
0.0616394, -1.951636, 0.9251746, 1, 1, 1, 1, 1,
0.06216819, 1.490276, -0.6223541, 1, 1, 1, 1, 1,
0.06256273, 0.9712877, 0.896071, 1, 1, 1, 1, 1,
0.06479383, -0.08596426, 2.782224, 1, 1, 1, 1, 1,
0.06576002, -1.687941, 2.900765, 1, 1, 1, 1, 1,
0.0707386, -1.684054, 2.623232, 1, 1, 1, 1, 1,
0.07582574, 0.6371218, 1.545486, 0, 0, 1, 1, 1,
0.07758544, 1.7101, -0.3104327, 1, 0, 0, 1, 1,
0.07994951, -0.5294243, 2.260316, 1, 0, 0, 1, 1,
0.08357126, 0.6309815, -1.034697, 1, 0, 0, 1, 1,
0.08648585, 0.3482423, -0.2131499, 1, 0, 0, 1, 1,
0.08842399, -0.5711083, 2.397585, 1, 0, 0, 1, 1,
0.09064524, 1.619816, -1.117976, 0, 0, 0, 1, 1,
0.09351076, 1.43759, 2.229482, 0, 0, 0, 1, 1,
0.09642006, -1.0539, 3.975285, 0, 0, 0, 1, 1,
0.09820851, -0.3307586, 2.835308, 0, 0, 0, 1, 1,
0.09969657, -0.7228627, 1.962071, 0, 0, 0, 1, 1,
0.1001974, -0.284921, 1.794382, 0, 0, 0, 1, 1,
0.102677, -0.1451298, 2.003837, 0, 0, 0, 1, 1,
0.105349, 0.323622, -0.07933944, 1, 1, 1, 1, 1,
0.1069617, 0.02664509, 2.365057, 1, 1, 1, 1, 1,
0.1073473, -1.279884, 2.168822, 1, 1, 1, 1, 1,
0.1074566, -1.118316, 1.100254, 1, 1, 1, 1, 1,
0.120054, -1.367635, 2.503347, 1, 1, 1, 1, 1,
0.1215256, 0.778432, 0.1166476, 1, 1, 1, 1, 1,
0.1258898, -1.122259, 1.363154, 1, 1, 1, 1, 1,
0.1267931, 0.357978, -1.14104, 1, 1, 1, 1, 1,
0.1274626, 1.06934, 0.01050455, 1, 1, 1, 1, 1,
0.1283947, -0.3873828, 3.408637, 1, 1, 1, 1, 1,
0.1293129, -1.328904, 2.212902, 1, 1, 1, 1, 1,
0.1296987, 1.820221, -0.8560987, 1, 1, 1, 1, 1,
0.1300381, 1.546361, 0.7554108, 1, 1, 1, 1, 1,
0.1334516, 0.8617907, -1.152937, 1, 1, 1, 1, 1,
0.1372536, -0.7607808, 3.618279, 1, 1, 1, 1, 1,
0.1406049, 0.8345881, -0.02721083, 0, 0, 1, 1, 1,
0.1440763, -1.821088, 1.715151, 1, 0, 0, 1, 1,
0.1473354, -0.3807962, 2.617435, 1, 0, 0, 1, 1,
0.1504715, 1.499025, -1.541923, 1, 0, 0, 1, 1,
0.1505594, -0.2734714, 1.80066, 1, 0, 0, 1, 1,
0.1518446, -0.2738206, 1.220329, 1, 0, 0, 1, 1,
0.1551092, 1.224772, -0.4023935, 0, 0, 0, 1, 1,
0.1562242, -0.5617383, 3.82619, 0, 0, 0, 1, 1,
0.1565067, 0.9600315, 0.1187654, 0, 0, 0, 1, 1,
0.1585183, 0.1756705, 0.08866204, 0, 0, 0, 1, 1,
0.1587905, -0.6375133, 2.64318, 0, 0, 0, 1, 1,
0.1593878, -0.30266, 1.794642, 0, 0, 0, 1, 1,
0.1599199, 0.6217837, -0.3059823, 0, 0, 0, 1, 1,
0.1639647, -0.7312827, 1.933534, 1, 1, 1, 1, 1,
0.1642786, 0.69312, 0.9618868, 1, 1, 1, 1, 1,
0.1644909, 1.351874, 0.4062801, 1, 1, 1, 1, 1,
0.1651185, -0.8790216, 2.880088, 1, 1, 1, 1, 1,
0.168455, -1.094303, 3.068096, 1, 1, 1, 1, 1,
0.1707196, 0.4796669, 1.254173, 1, 1, 1, 1, 1,
0.1714836, -0.07301567, 2.460731, 1, 1, 1, 1, 1,
0.1718586, 0.09681498, 0.1588238, 1, 1, 1, 1, 1,
0.1733011, -0.9687251, 3.799485, 1, 1, 1, 1, 1,
0.1787357, -0.02314575, 1.682919, 1, 1, 1, 1, 1,
0.1824622, -0.6031319, 3.617099, 1, 1, 1, 1, 1,
0.1857094, -0.3274695, 2.987869, 1, 1, 1, 1, 1,
0.1858628, -0.8576716, 4.476399, 1, 1, 1, 1, 1,
0.1865445, -0.9710279, 3.242798, 1, 1, 1, 1, 1,
0.1867351, 0.5429932, 1.253016, 1, 1, 1, 1, 1,
0.1868337, 0.03929993, 1.861473, 0, 0, 1, 1, 1,
0.1889264, 0.2764353, -0.1745914, 1, 0, 0, 1, 1,
0.1909802, -0.97396, 2.535935, 1, 0, 0, 1, 1,
0.1916753, 0.2952641, -0.1708072, 1, 0, 0, 1, 1,
0.1976625, 1.199496, 0.1892614, 1, 0, 0, 1, 1,
0.2015735, 0.3542787, 0.1917527, 1, 0, 0, 1, 1,
0.2015775, -1.148998, 3.494313, 0, 0, 0, 1, 1,
0.2033289, -1.093297, 3.770571, 0, 0, 0, 1, 1,
0.2051886, 1.925415, -1.077408, 0, 0, 0, 1, 1,
0.2056457, -1.743781, 3.438695, 0, 0, 0, 1, 1,
0.2064622, 2.528697, -0.1518342, 0, 0, 0, 1, 1,
0.2113693, -0.3971226, 2.331815, 0, 0, 0, 1, 1,
0.2143382, 0.1886289, -1.060466, 0, 0, 0, 1, 1,
0.2179692, -0.1169209, 2.706214, 1, 1, 1, 1, 1,
0.2197313, -0.2384412, 2.7089, 1, 1, 1, 1, 1,
0.2206119, -0.7265038, 3.650563, 1, 1, 1, 1, 1,
0.2213, -0.2306602, 2.620809, 1, 1, 1, 1, 1,
0.2224263, -0.05113822, 2.208212, 1, 1, 1, 1, 1,
0.224982, -1.606653, 3.925946, 1, 1, 1, 1, 1,
0.2275113, -0.3701026, 3.503902, 1, 1, 1, 1, 1,
0.2295533, -0.563612, 3.523153, 1, 1, 1, 1, 1,
0.2300362, 0.2462344, 0.9226233, 1, 1, 1, 1, 1,
0.2310931, -0.5103651, 1.330172, 1, 1, 1, 1, 1,
0.2330196, -2.581417, 4.119123, 1, 1, 1, 1, 1,
0.2338321, -0.001601872, 1.666932, 1, 1, 1, 1, 1,
0.2347101, -1.777703, 2.601215, 1, 1, 1, 1, 1,
0.2386512, -0.7615156, 1.433889, 1, 1, 1, 1, 1,
0.2404063, -0.9087141, 2.639377, 1, 1, 1, 1, 1,
0.2455348, -1.474535, 3.048081, 0, 0, 1, 1, 1,
0.2495586, 0.4534145, 0.7608542, 1, 0, 0, 1, 1,
0.2508893, -1.945766, 2.242016, 1, 0, 0, 1, 1,
0.2519909, 0.3154514, 0.5406415, 1, 0, 0, 1, 1,
0.252377, -1.809058, 4.809612, 1, 0, 0, 1, 1,
0.2569304, -0.2831202, 1.872536, 1, 0, 0, 1, 1,
0.2581324, 1.23184, -1.661624, 0, 0, 0, 1, 1,
0.2586686, -0.07110989, 1.358698, 0, 0, 0, 1, 1,
0.260482, -0.3202713, 2.114926, 0, 0, 0, 1, 1,
0.261912, 1.419871, 0.5021379, 0, 0, 0, 1, 1,
0.2647392, 0.1832914, 2.13578, 0, 0, 0, 1, 1,
0.2651697, -1.007243, 2.720709, 0, 0, 0, 1, 1,
0.2686979, 1.349935, -0.2108389, 0, 0, 0, 1, 1,
0.2692569, -0.2926251, -0.2351159, 1, 1, 1, 1, 1,
0.2713656, 0.04030928, 1.037609, 1, 1, 1, 1, 1,
0.2741407, 0.8819575, -0.5357365, 1, 1, 1, 1, 1,
0.2747709, 0.68408, -2.122792, 1, 1, 1, 1, 1,
0.2779446, -1.533118, 3.494622, 1, 1, 1, 1, 1,
0.2906174, -1.25819, 3.623722, 1, 1, 1, 1, 1,
0.2932755, 0.01283609, 0.2038102, 1, 1, 1, 1, 1,
0.2954952, 0.2382079, 0.9094676, 1, 1, 1, 1, 1,
0.2989762, 0.2031074, 0.4593349, 1, 1, 1, 1, 1,
0.299204, -0.476481, 2.434148, 1, 1, 1, 1, 1,
0.3010864, -0.3266876, 1.683169, 1, 1, 1, 1, 1,
0.301128, 0.123118, 0.5390723, 1, 1, 1, 1, 1,
0.3042364, 1.057445, -0.6208124, 1, 1, 1, 1, 1,
0.3080925, 0.9707653, -0.4337414, 1, 1, 1, 1, 1,
0.3093279, -3.022062, 4.114888, 1, 1, 1, 1, 1,
0.3138774, 0.3940747, -0.4939938, 0, 0, 1, 1, 1,
0.3164281, -1.304098, 3.319159, 1, 0, 0, 1, 1,
0.3190725, -0.1970827, 1.153255, 1, 0, 0, 1, 1,
0.3242001, 0.05091854, 1.663932, 1, 0, 0, 1, 1,
0.3387715, -0.1981169, 2.153826, 1, 0, 0, 1, 1,
0.3416988, 0.8657784, 0.1124748, 1, 0, 0, 1, 1,
0.344056, 0.5210413, -1.098094, 0, 0, 0, 1, 1,
0.3523002, -1.789637, 1.988696, 0, 0, 0, 1, 1,
0.3534746, -0.4769689, 1.889758, 0, 0, 0, 1, 1,
0.3558561, -0.4645624, 1.284371, 0, 0, 0, 1, 1,
0.359192, -0.4087514, 1.821665, 0, 0, 0, 1, 1,
0.3619203, -1.152073, 3.634366, 0, 0, 0, 1, 1,
0.3661776, -0.3277134, 2.640965, 0, 0, 0, 1, 1,
0.3708461, 2.072975, 0.4088787, 1, 1, 1, 1, 1,
0.3726892, -1.821312, 3.014176, 1, 1, 1, 1, 1,
0.3730386, -0.2753971, 3.554921, 1, 1, 1, 1, 1,
0.3798599, 1.954984, 0.6537845, 1, 1, 1, 1, 1,
0.3859585, 0.5950357, 2.140593, 1, 1, 1, 1, 1,
0.386252, -0.0530215, 2.490321, 1, 1, 1, 1, 1,
0.3871985, -0.05566619, 1.806699, 1, 1, 1, 1, 1,
0.3873602, 0.2795027, 0.8189767, 1, 1, 1, 1, 1,
0.3912467, -1.154317, 2.432426, 1, 1, 1, 1, 1,
0.3970211, -1.011741, 2.254441, 1, 1, 1, 1, 1,
0.3983003, -1.628868, -0.1059142, 1, 1, 1, 1, 1,
0.4112525, 0.6061317, -0.1302652, 1, 1, 1, 1, 1,
0.4132656, -0.7827817, 4.008195, 1, 1, 1, 1, 1,
0.4132677, -0.1019613, 1.590009, 1, 1, 1, 1, 1,
0.4148288, 0.1137789, 1.640822, 1, 1, 1, 1, 1,
0.4196203, 0.6417972, 0.7731792, 0, 0, 1, 1, 1,
0.4320187, -0.9041513, 2.402248, 1, 0, 0, 1, 1,
0.43503, 1.23229, 1.917391, 1, 0, 0, 1, 1,
0.4425486, 0.680654, 0.1110958, 1, 0, 0, 1, 1,
0.4490514, -1.587254, 1.170098, 1, 0, 0, 1, 1,
0.4496657, 0.9417698, 0.2070201, 1, 0, 0, 1, 1,
0.4523084, -1.69958, 1.60422, 0, 0, 0, 1, 1,
0.45339, 0.3462877, 1.740519, 0, 0, 0, 1, 1,
0.4562249, -0.9837678, 2.289804, 0, 0, 0, 1, 1,
0.4587984, 0.3589091, 1.999729, 0, 0, 0, 1, 1,
0.4593238, -0.6409865, 1.273226, 0, 0, 0, 1, 1,
0.4642919, 0.09261504, -0.875542, 0, 0, 0, 1, 1,
0.4662287, -0.3215759, 3.116334, 0, 0, 0, 1, 1,
0.466233, 1.784852, 1.100487, 1, 1, 1, 1, 1,
0.469273, 0.8134528, -1.156683, 1, 1, 1, 1, 1,
0.471725, 0.4875093, 0.3970459, 1, 1, 1, 1, 1,
0.4740366, 0.4830091, 0.920258, 1, 1, 1, 1, 1,
0.4756621, -1.133094, 2.509062, 1, 1, 1, 1, 1,
0.4791817, -0.7950784, 3.288424, 1, 1, 1, 1, 1,
0.4822532, -0.5627874, 1.936261, 1, 1, 1, 1, 1,
0.4826298, -1.566587, 3.27395, 1, 1, 1, 1, 1,
0.4844889, 0.1943289, -0.1423247, 1, 1, 1, 1, 1,
0.4906429, -0.8111516, 1.569843, 1, 1, 1, 1, 1,
0.4996859, 1.133053, 1.980128, 1, 1, 1, 1, 1,
0.5031281, 1.320297, -0.237643, 1, 1, 1, 1, 1,
0.5033166, 0.1865564, 1.359597, 1, 1, 1, 1, 1,
0.5040976, 0.7021493, 0.7085186, 1, 1, 1, 1, 1,
0.5179853, -0.7695383, 2.591097, 1, 1, 1, 1, 1,
0.5208988, -0.800331, 0.8234406, 0, 0, 1, 1, 1,
0.5266072, 0.9593714, 0.2930389, 1, 0, 0, 1, 1,
0.5282209, 1.359161, 0.2638171, 1, 0, 0, 1, 1,
0.5303081, 0.3301384, 0.3566077, 1, 0, 0, 1, 1,
0.5306069, 1.440796, 1.141933, 1, 0, 0, 1, 1,
0.5335017, -1.355032, 4.369356, 1, 0, 0, 1, 1,
0.5391158, -0.8899332, 3.445369, 0, 0, 0, 1, 1,
0.5399876, -0.4976139, 0.8043729, 0, 0, 0, 1, 1,
0.5426869, 0.3014625, 1.603818, 0, 0, 0, 1, 1,
0.5438423, 0.02039852, 1.622869, 0, 0, 0, 1, 1,
0.5502449, -1.734838, 3.424721, 0, 0, 0, 1, 1,
0.555057, 1.301292, -1.80508, 0, 0, 0, 1, 1,
0.5574857, -0.3590896, 2.603795, 0, 0, 0, 1, 1,
0.5592124, 0.3466159, 1.410272, 1, 1, 1, 1, 1,
0.5616462, 1.199742, 0.3346737, 1, 1, 1, 1, 1,
0.5663164, -0.5893161, 2.570031, 1, 1, 1, 1, 1,
0.5716984, 0.8601045, 1.610295, 1, 1, 1, 1, 1,
0.5739918, 2.127205, 0.3880447, 1, 1, 1, 1, 1,
0.5755858, 0.703724, 1.93906, 1, 1, 1, 1, 1,
0.5764817, -0.4648147, 1.911394, 1, 1, 1, 1, 1,
0.5798876, 0.06052103, 2.424873, 1, 1, 1, 1, 1,
0.5863321, 0.6456176, 0.4511532, 1, 1, 1, 1, 1,
0.5877482, -1.37681, 2.6062, 1, 1, 1, 1, 1,
0.5896261, 1.559514, -0.2932577, 1, 1, 1, 1, 1,
0.591724, 1.148691, 0.5934096, 1, 1, 1, 1, 1,
0.5923617, -1.885999, 2.767014, 1, 1, 1, 1, 1,
0.5929862, 1.287803, 0.4677152, 1, 1, 1, 1, 1,
0.5948933, -1.973693, 3.839, 1, 1, 1, 1, 1,
0.5996652, 1.510179, 1.691536, 0, 0, 1, 1, 1,
0.5998088, 0.4914867, -0.3066823, 1, 0, 0, 1, 1,
0.6044043, -1.636277, 4.623846, 1, 0, 0, 1, 1,
0.6104335, 1.730295, 0.1139223, 1, 0, 0, 1, 1,
0.6170091, 1.526471, 1.370594, 1, 0, 0, 1, 1,
0.6192523, 0.7173454, 1.419655, 1, 0, 0, 1, 1,
0.6227053, 1.328647, -0.355017, 0, 0, 0, 1, 1,
0.6253687, 0.1405677, -0.1098542, 0, 0, 0, 1, 1,
0.6329618, -0.1304073, 1.577495, 0, 0, 0, 1, 1,
0.6369057, -0.8269285, 2.26728, 0, 0, 0, 1, 1,
0.6394857, -0.08908653, 0.8363224, 0, 0, 0, 1, 1,
0.6402462, 0.5619655, 0.3087451, 0, 0, 0, 1, 1,
0.6404529, -1.440485, 5.753421, 0, 0, 0, 1, 1,
0.6409171, -0.4354326, 3.049308, 1, 1, 1, 1, 1,
0.6471046, 0.6890962, 0.06184226, 1, 1, 1, 1, 1,
0.6477052, 1.24851, -0.9322654, 1, 1, 1, 1, 1,
0.6495306, -1.300565, 1.407075, 1, 1, 1, 1, 1,
0.6516156, 0.3448039, 0.9340834, 1, 1, 1, 1, 1,
0.6527404, -1.721801, 2.743125, 1, 1, 1, 1, 1,
0.6584715, 2.351617, 1.016365, 1, 1, 1, 1, 1,
0.6622949, 0.8874403, 0.9016893, 1, 1, 1, 1, 1,
0.6634538, -0.3696437, 3.056169, 1, 1, 1, 1, 1,
0.6643786, -1.475132, 3.127563, 1, 1, 1, 1, 1,
0.670167, -0.1964117, 0.6705344, 1, 1, 1, 1, 1,
0.6760383, 0.8230166, -0.5099655, 1, 1, 1, 1, 1,
0.677098, -2.654708, 1.719435, 1, 1, 1, 1, 1,
0.680335, 0.1103432, 0.9762855, 1, 1, 1, 1, 1,
0.6852102, -0.62555, 4.630309, 1, 1, 1, 1, 1,
0.6875333, 0.7020257, 0.3774045, 0, 0, 1, 1, 1,
0.6914229, 0.5334878, 1.519967, 1, 0, 0, 1, 1,
0.6958369, 0.7502137, 0.2161886, 1, 0, 0, 1, 1,
0.6973795, 1.488047, 0.5068403, 1, 0, 0, 1, 1,
0.6986689, -0.9910772, 3.873967, 1, 0, 0, 1, 1,
0.6991491, -0.9942307, 3.101455, 1, 0, 0, 1, 1,
0.6999138, -0.1472604, 1.121748, 0, 0, 0, 1, 1,
0.7006519, -0.3229158, 0.4462823, 0, 0, 0, 1, 1,
0.7032321, -0.7132403, 2.555982, 0, 0, 0, 1, 1,
0.7188578, 2.327337, 1.128896, 0, 0, 0, 1, 1,
0.72452, -0.09178346, 0.8489404, 0, 0, 0, 1, 1,
0.7329608, -1.688061, 3.016362, 0, 0, 0, 1, 1,
0.7334591, -0.8160507, 1.39051, 0, 0, 0, 1, 1,
0.7338761, -0.1072158, 0.4149116, 1, 1, 1, 1, 1,
0.7353379, 1.608801, 0.1374963, 1, 1, 1, 1, 1,
0.7399344, -0.4042036, 2.635265, 1, 1, 1, 1, 1,
0.7446689, -1.816466, 0.2777971, 1, 1, 1, 1, 1,
0.7453107, -0.1345798, 0.5437351, 1, 1, 1, 1, 1,
0.7493318, 0.1259876, 0.4021307, 1, 1, 1, 1, 1,
0.750362, 2.689075, -0.3066486, 1, 1, 1, 1, 1,
0.7532912, 1.002037, 0.7992047, 1, 1, 1, 1, 1,
0.7550591, 0.4134583, 2.523698, 1, 1, 1, 1, 1,
0.7573664, 2.100652, -1.187601, 1, 1, 1, 1, 1,
0.7588243, 1.211417, 2.117053, 1, 1, 1, 1, 1,
0.7601552, -0.2183787, 1.231925, 1, 1, 1, 1, 1,
0.7602844, -1.101376, 2.809089, 1, 1, 1, 1, 1,
0.7685709, -1.070533, 0.5966811, 1, 1, 1, 1, 1,
0.7703665, 0.04490567, 1.117823, 1, 1, 1, 1, 1,
0.7727785, 0.1238818, -0.3028458, 0, 0, 1, 1, 1,
0.7743513, -0.2688463, 2.200303, 1, 0, 0, 1, 1,
0.7784365, 1.694315, 2.50777, 1, 0, 0, 1, 1,
0.779023, 0.3848409, 2.2947, 1, 0, 0, 1, 1,
0.7813451, -0.3315184, 1.704951, 1, 0, 0, 1, 1,
0.7832514, 0.8645952, 0.3007657, 1, 0, 0, 1, 1,
0.783329, 0.7766671, 0.3347332, 0, 0, 0, 1, 1,
0.7857848, 0.1715122, 2.319796, 0, 0, 0, 1, 1,
0.7863611, 0.6875911, 0.02685758, 0, 0, 0, 1, 1,
0.7875273, 0.4966523, -0.05465851, 0, 0, 0, 1, 1,
0.7890887, 0.05184804, 2.610618, 0, 0, 0, 1, 1,
0.7945333, -0.4127914, 1.920226, 0, 0, 0, 1, 1,
0.7972816, -0.8577845, 1.141664, 0, 0, 0, 1, 1,
0.8013388, -0.6224009, 2.383803, 1, 1, 1, 1, 1,
0.8041172, -0.3815572, 1.37362, 1, 1, 1, 1, 1,
0.8091773, -0.9587568, 1.945566, 1, 1, 1, 1, 1,
0.8122519, -1.05088, 2.669702, 1, 1, 1, 1, 1,
0.8168258, -0.2889713, 2.006191, 1, 1, 1, 1, 1,
0.8168486, -0.5931791, 2.375493, 1, 1, 1, 1, 1,
0.8192676, 0.3424627, 0.1306229, 1, 1, 1, 1, 1,
0.8219384, 0.1557748, 0.8023636, 1, 1, 1, 1, 1,
0.8312247, 1.204302, 0.6976006, 1, 1, 1, 1, 1,
0.8355808, -0.1833903, 1.355908, 1, 1, 1, 1, 1,
0.8380291, 0.3697647, 2.858809, 1, 1, 1, 1, 1,
0.8471341, -0.2970294, 2.041079, 1, 1, 1, 1, 1,
0.8549457, -0.8860334, 4.460563, 1, 1, 1, 1, 1,
0.858032, -0.5105946, 2.708201, 1, 1, 1, 1, 1,
0.8588258, -1.124106, 3.090457, 1, 1, 1, 1, 1,
0.8602016, 0.1765448, 1.082738, 0, 0, 1, 1, 1,
0.8607918, -0.4044296, 1.320429, 1, 0, 0, 1, 1,
0.8611259, 0.5276297, 1.108054, 1, 0, 0, 1, 1,
0.8645152, -0.06926028, 2.77617, 1, 0, 0, 1, 1,
0.8645296, 0.09116144, 1.592154, 1, 0, 0, 1, 1,
0.8682852, -1.085295, 1.467462, 1, 0, 0, 1, 1,
0.8687915, 0.5718933, 1.22746, 0, 0, 0, 1, 1,
0.8773407, 0.5613223, 0.9518418, 0, 0, 0, 1, 1,
0.8849337, 0.5329375, 1.984435, 0, 0, 0, 1, 1,
0.8882696, 0.1360312, 1.959156, 0, 0, 0, 1, 1,
0.88859, 0.9631441, 0.6984007, 0, 0, 0, 1, 1,
0.8908049, 1.868015, 0.8416634, 0, 0, 0, 1, 1,
0.8908617, -0.3060832, 1.65446, 0, 0, 0, 1, 1,
0.8920019, -1.891471, 2.260531, 1, 1, 1, 1, 1,
0.8969548, 0.7867389, 2.10724, 1, 1, 1, 1, 1,
0.8969987, -0.01861619, 2.227264, 1, 1, 1, 1, 1,
0.910926, 0.7103438, -0.8443063, 1, 1, 1, 1, 1,
0.9142069, -1.266739, 1.580661, 1, 1, 1, 1, 1,
0.9159135, 1.163348, 2.357242, 1, 1, 1, 1, 1,
0.9178409, -1.306057, 2.557676, 1, 1, 1, 1, 1,
0.9239954, 0.05025614, 2.73666, 1, 1, 1, 1, 1,
0.9296297, -1.217492, 3.470625, 1, 1, 1, 1, 1,
0.9308461, -0.3270868, 2.177112, 1, 1, 1, 1, 1,
0.9312878, -2.08814, 1.871048, 1, 1, 1, 1, 1,
0.9318845, -0.475673, 2.75752, 1, 1, 1, 1, 1,
0.932977, -1.225274, 3.252131, 1, 1, 1, 1, 1,
0.9374647, 0.8430135, 2.283193, 1, 1, 1, 1, 1,
0.9466389, 0.6902992, 2.653728, 1, 1, 1, 1, 1,
0.9521989, -0.4237702, 1.711006, 0, 0, 1, 1, 1,
0.9628919, -1.736995, 2.703811, 1, 0, 0, 1, 1,
0.9726809, 0.1457157, 3.327339, 1, 0, 0, 1, 1,
0.9744828, -0.03840751, 1.242226, 1, 0, 0, 1, 1,
0.9796414, 1.200018, 0.6162467, 1, 0, 0, 1, 1,
0.983856, -0.7705404, 2.789828, 1, 0, 0, 1, 1,
0.984214, 2.023694, 0.4787683, 0, 0, 0, 1, 1,
0.9846177, -2.141751, 2.506149, 0, 0, 0, 1, 1,
0.9953821, -0.7571142, 1.892679, 0, 0, 0, 1, 1,
1.005616, -1.23553, 2.198611, 0, 0, 0, 1, 1,
1.008703, -1.542166, 1.997624, 0, 0, 0, 1, 1,
1.013565, 0.002905243, 1.75128, 0, 0, 0, 1, 1,
1.022798, 0.2685406, 0.8482846, 0, 0, 0, 1, 1,
1.042355, -0.1667881, 2.426823, 1, 1, 1, 1, 1,
1.045682, 0.03706891, 0.5243901, 1, 1, 1, 1, 1,
1.053469, 1.494092, -0.09642524, 1, 1, 1, 1, 1,
1.061838, -0.2389311, 1.494377, 1, 1, 1, 1, 1,
1.063925, -1.028448, 0.5451553, 1, 1, 1, 1, 1,
1.067199, 0.6458355, 2.70689, 1, 1, 1, 1, 1,
1.07691, 0.3006769, 2.430396, 1, 1, 1, 1, 1,
1.081076, -0.1387447, 2.539409, 1, 1, 1, 1, 1,
1.081449, -0.3295371, 0.660506, 1, 1, 1, 1, 1,
1.086759, 0.8479148, 1.220312, 1, 1, 1, 1, 1,
1.086794, -2.209704, 2.682, 1, 1, 1, 1, 1,
1.088846, -0.3416591, 1.962193, 1, 1, 1, 1, 1,
1.0895, -0.9028412, 0.9919519, 1, 1, 1, 1, 1,
1.092283, 0.810584, 0.8900522, 1, 1, 1, 1, 1,
1.098531, 0.6216485, 1.586643, 1, 1, 1, 1, 1,
1.103028, -0.8129536, 3.712972, 0, 0, 1, 1, 1,
1.107872, 0.03092489, 2.08655, 1, 0, 0, 1, 1,
1.108414, -1.808524, 1.861371, 1, 0, 0, 1, 1,
1.110215, 1.513745, 0.8427406, 1, 0, 0, 1, 1,
1.110218, -0.3585733, 1.631993, 1, 0, 0, 1, 1,
1.114266, 0.1798767, 2.379622, 1, 0, 0, 1, 1,
1.115011, 0.6903017, -0.4836574, 0, 0, 0, 1, 1,
1.122068, 1.646602, 0.8607936, 0, 0, 0, 1, 1,
1.124827, 0.3988448, 2.165574, 0, 0, 0, 1, 1,
1.125883, 1.292699, 1.251677, 0, 0, 0, 1, 1,
1.132201, -0.1519751, 1.641685, 0, 0, 0, 1, 1,
1.134205, -0.6138948, 1.299328, 0, 0, 0, 1, 1,
1.14232, 0.1055113, 2.759799, 0, 0, 0, 1, 1,
1.148845, -0.01484486, 2.138463, 1, 1, 1, 1, 1,
1.14991, -1.294688, 1.065103, 1, 1, 1, 1, 1,
1.153223, 0.7741317, 0.4661662, 1, 1, 1, 1, 1,
1.155404, -0.1358562, 2.639706, 1, 1, 1, 1, 1,
1.167593, -0.9735156, 2.846226, 1, 1, 1, 1, 1,
1.169075, -2.096752, 2.104584, 1, 1, 1, 1, 1,
1.172815, -0.2062875, 1.130244, 1, 1, 1, 1, 1,
1.182672, -1.043427, 1.12788, 1, 1, 1, 1, 1,
1.182898, -1.254596, 2.211644, 1, 1, 1, 1, 1,
1.194451, 0.3463946, 3.026421, 1, 1, 1, 1, 1,
1.19642, 0.5162926, 1.70899, 1, 1, 1, 1, 1,
1.198674, -0.2071953, 1.022962, 1, 1, 1, 1, 1,
1.209178, -0.04446761, -0.1530083, 1, 1, 1, 1, 1,
1.213413, -0.09951999, 3.484689, 1, 1, 1, 1, 1,
1.220912, 0.2367817, 1.622645, 1, 1, 1, 1, 1,
1.241729, -0.9479238, 1.953237, 0, 0, 1, 1, 1,
1.242157, 2.390126, -1.009472, 1, 0, 0, 1, 1,
1.25102, -0.07114581, 2.25378, 1, 0, 0, 1, 1,
1.258374, -0.8726497, 2.072647, 1, 0, 0, 1, 1,
1.270866, 0.4072251, 1.539645, 1, 0, 0, 1, 1,
1.278889, 1.760564, 0.1550303, 1, 0, 0, 1, 1,
1.28222, 0.4294108, 2.60857, 0, 0, 0, 1, 1,
1.284127, -0.3369064, 0.363836, 0, 0, 0, 1, 1,
1.299152, -0.1391822, 0.1442716, 0, 0, 0, 1, 1,
1.300775, -0.9631799, 3.511044, 0, 0, 0, 1, 1,
1.302538, -0.9685743, 4.238105, 0, 0, 0, 1, 1,
1.304152, -1.742427, 2.303753, 0, 0, 0, 1, 1,
1.308092, 1.040737, 3.164676, 0, 0, 0, 1, 1,
1.313941, 0.5397128, 2.785076, 1, 1, 1, 1, 1,
1.315376, -0.5875123, 1.405757, 1, 1, 1, 1, 1,
1.324878, 1.174762, -0.4958022, 1, 1, 1, 1, 1,
1.327893, 0.8198762, -0.9259871, 1, 1, 1, 1, 1,
1.329676, -0.2319069, 2.902516, 1, 1, 1, 1, 1,
1.337173, -0.6465033, 3.156566, 1, 1, 1, 1, 1,
1.343579, -0.7980132, 2.556414, 1, 1, 1, 1, 1,
1.343967, 0.5521618, -0.4669468, 1, 1, 1, 1, 1,
1.358716, -0.8286626, 1.010962, 1, 1, 1, 1, 1,
1.36267, -0.5972331, 1.395828, 1, 1, 1, 1, 1,
1.36512, 0.202601, 2.577489, 1, 1, 1, 1, 1,
1.367008, -1.345312, 2.885918, 1, 1, 1, 1, 1,
1.369232, 0.3296069, 1.760028, 1, 1, 1, 1, 1,
1.371498, 0.0481086, 2.715816, 1, 1, 1, 1, 1,
1.376433, -0.01147851, 1.384259, 1, 1, 1, 1, 1,
1.377889, 0.2819906, 1.169838, 0, 0, 1, 1, 1,
1.411875, -0.4512013, 3.452827, 1, 0, 0, 1, 1,
1.412462, 0.3373157, 1.573485, 1, 0, 0, 1, 1,
1.423087, 1.876217, 2.314093, 1, 0, 0, 1, 1,
1.424787, -0.5149351, 3.27426, 1, 0, 0, 1, 1,
1.426671, 0.2758712, 1.441988, 1, 0, 0, 1, 1,
1.426854, 0.1892525, 0.6676482, 0, 0, 0, 1, 1,
1.42788, -0.1808794, 3.238063, 0, 0, 0, 1, 1,
1.433905, 1.938099, 1.882634, 0, 0, 0, 1, 1,
1.44375, 0.09210785, 1.951649, 0, 0, 0, 1, 1,
1.443753, -0.1383621, 3.05917, 0, 0, 0, 1, 1,
1.446094, -2.304785, 3.240168, 0, 0, 0, 1, 1,
1.460587, 0.3669428, 1.553367, 0, 0, 0, 1, 1,
1.476943, 0.06276727, 1.331665, 1, 1, 1, 1, 1,
1.488561, -0.402338, 2.34524, 1, 1, 1, 1, 1,
1.492904, -1.326748, 1.061672, 1, 1, 1, 1, 1,
1.511125, 0.6680365, 0.1410217, 1, 1, 1, 1, 1,
1.512692, -0.5743546, 1.698324, 1, 1, 1, 1, 1,
1.523057, 0.46202, -0.8889987, 1, 1, 1, 1, 1,
1.538923, -0.7351869, 3.217997, 1, 1, 1, 1, 1,
1.588501, -0.4450563, 2.928311, 1, 1, 1, 1, 1,
1.593198, -0.07053362, 3.143235, 1, 1, 1, 1, 1,
1.603011, -0.2557553, 3.056342, 1, 1, 1, 1, 1,
1.607677, 0.2344097, 1.236713, 1, 1, 1, 1, 1,
1.623941, -0.377537, 0.3144001, 1, 1, 1, 1, 1,
1.637097, -1.766573, 1.933572, 1, 1, 1, 1, 1,
1.644757, 0.1997943, 1.457632, 1, 1, 1, 1, 1,
1.652584, -1.246915, 1.883725, 1, 1, 1, 1, 1,
1.676978, 0.6830847, 3.010061, 0, 0, 1, 1, 1,
1.697793, -0.2544988, 2.543118, 1, 0, 0, 1, 1,
1.711556, -1.123158, 0.353172, 1, 0, 0, 1, 1,
1.714536, 0.9076557, -0.2095614, 1, 0, 0, 1, 1,
1.715918, -0.3756578, -0.7525802, 1, 0, 0, 1, 1,
1.739687, -0.3221472, 1.110674, 1, 0, 0, 1, 1,
1.776759, 0.3831534, 2.818179, 0, 0, 0, 1, 1,
1.779135, -0.5465178, 2.542262, 0, 0, 0, 1, 1,
1.793352, 1.404366, 1.27569, 0, 0, 0, 1, 1,
1.80349, -0.3257482, 0.0480692, 0, 0, 0, 1, 1,
1.816472, 0.1893239, 0.5781453, 0, 0, 0, 1, 1,
1.829909, 0.1828139, 1.731219, 0, 0, 0, 1, 1,
1.83041, -0.5200379, 3.125305, 0, 0, 0, 1, 1,
1.835499, -1.644256, 2.116528, 1, 1, 1, 1, 1,
1.845164, 0.07231694, 2.105042, 1, 1, 1, 1, 1,
1.851432, -0.3121459, 0.3555444, 1, 1, 1, 1, 1,
1.858499, 0.7959273, 1.586828, 1, 1, 1, 1, 1,
1.859893, 0.6062502, 0.963945, 1, 1, 1, 1, 1,
1.864662, 0.9068531, 0.2852407, 1, 1, 1, 1, 1,
1.866798, -1.532421, 3.467339, 1, 1, 1, 1, 1,
1.88302, -0.2445364, 2.539681, 1, 1, 1, 1, 1,
1.91488, 0.1440224, 0.4190844, 1, 1, 1, 1, 1,
1.935412, 2.36027, 0.5616956, 1, 1, 1, 1, 1,
1.954933, 0.2497314, 2.803213, 1, 1, 1, 1, 1,
1.958286, 0.7499655, 2.639156, 1, 1, 1, 1, 1,
1.973093, -0.4646744, 2.290489, 1, 1, 1, 1, 1,
1.987408, 0.1540568, 2.927397, 1, 1, 1, 1, 1,
1.991099, 0.4437645, 2.38542, 1, 1, 1, 1, 1,
2.004777, -0.1021179, 1.887366, 0, 0, 1, 1, 1,
2.005941, -0.5296401, 2.220128, 1, 0, 0, 1, 1,
2.032973, -0.0570726, 1.937524, 1, 0, 0, 1, 1,
2.034697, 0.1794368, 2.375738, 1, 0, 0, 1, 1,
2.044642, -0.9796657, 2.936593, 1, 0, 0, 1, 1,
2.048225, 0.05933768, 1.27215, 1, 0, 0, 1, 1,
2.061813, 1.241904, 2.139665, 0, 0, 0, 1, 1,
2.114076, 0.6270624, 2.77791, 0, 0, 0, 1, 1,
2.135233, -0.216155, 1.803673, 0, 0, 0, 1, 1,
2.147414, 0.5149781, 1.790026, 0, 0, 0, 1, 1,
2.177308, -0.1643344, 0.9686999, 0, 0, 0, 1, 1,
2.192618, -2.133684, 2.056062, 0, 0, 0, 1, 1,
2.203553, -0.06246198, -0.6320181, 0, 0, 0, 1, 1,
2.228384, -0.02488311, 2.750535, 1, 1, 1, 1, 1,
2.28662, -1.21506, 1.633237, 1, 1, 1, 1, 1,
2.382617, 0.2416033, 2.063576, 1, 1, 1, 1, 1,
2.543115, -0.9408666, 2.354738, 1, 1, 1, 1, 1,
2.547038, 0.03526454, 0.7716616, 1, 1, 1, 1, 1,
2.581439, -0.7628468, 1.916267, 1, 1, 1, 1, 1,
3.493784, -0.3609543, 2.263976, 1, 1, 1, 1, 1
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
var radius = 9.516682;
var distance = 33.42694;
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
mvMatrix.translate( -0.3277967, 0.1305684, -0.2457488 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.42694);
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
