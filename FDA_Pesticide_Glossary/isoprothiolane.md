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
-3.792177, -0.7485461, -1.608803, 1, 0, 0, 1,
-2.892335, -0.064966, 0.5563542, 1, 0.007843138, 0, 1,
-2.863749, -1.707579, -3.52568, 1, 0.01176471, 0, 1,
-2.816917, 0.4816814, -1.556219, 1, 0.01960784, 0, 1,
-2.728331, -0.8361616, -1.843734, 1, 0.02352941, 0, 1,
-2.650204, -1.380908, -3.511614, 1, 0.03137255, 0, 1,
-2.611623, 0.04751312, -3.37236, 1, 0.03529412, 0, 1,
-2.589897, -0.01050535, -2.968365, 1, 0.04313726, 0, 1,
-2.439425, 0.263954, -2.40706, 1, 0.04705882, 0, 1,
-2.419934, -0.5886388, -0.9763954, 1, 0.05490196, 0, 1,
-2.368525, 0.007413883, -2.529678, 1, 0.05882353, 0, 1,
-2.355555, -1.32821, -3.286477, 1, 0.06666667, 0, 1,
-2.317832, -0.1116626, -1.398844, 1, 0.07058824, 0, 1,
-2.301294, 1.562808, -1.862083, 1, 0.07843138, 0, 1,
-2.261563, 0.382011, -1.887291, 1, 0.08235294, 0, 1,
-2.258477, 0.836924, -1.485325, 1, 0.09019608, 0, 1,
-2.18975, 0.131685, -2.974985, 1, 0.09411765, 0, 1,
-2.167261, -0.1285897, -2.746242, 1, 0.1019608, 0, 1,
-2.136319, 1.077662, -2.138285, 1, 0.1098039, 0, 1,
-2.130699, -1.634244, -2.503428, 1, 0.1137255, 0, 1,
-2.106476, -1.531428, -0.7661673, 1, 0.1215686, 0, 1,
-2.098636, 0.355001, -1.578263, 1, 0.1254902, 0, 1,
-2.087193, 0.4935928, -0.4394302, 1, 0.1333333, 0, 1,
-2.075953, -1.046579, -3.002042, 1, 0.1372549, 0, 1,
-2.055115, -0.9980149, -3.314246, 1, 0.145098, 0, 1,
-2.044704, -1.289822, -3.655525, 1, 0.1490196, 0, 1,
-2.014569, -1.346698, -3.919276, 1, 0.1568628, 0, 1,
-1.983537, -1.154372, -3.169077, 1, 0.1607843, 0, 1,
-1.974139, -0.2139864, -3.228414, 1, 0.1686275, 0, 1,
-1.956331, 0.458927, -0.1493752, 1, 0.172549, 0, 1,
-1.948185, -0.9429818, -2.332386, 1, 0.1803922, 0, 1,
-1.938672, -0.152016, -0.2771481, 1, 0.1843137, 0, 1,
-1.925514, -1.266324, -2.88349, 1, 0.1921569, 0, 1,
-1.914874, -1.035241, -2.33224, 1, 0.1960784, 0, 1,
-1.885765, 1.466004, 0.8242294, 1, 0.2039216, 0, 1,
-1.883204, 0.9164525, -0.8297932, 1, 0.2117647, 0, 1,
-1.872199, -1.943906, -1.685713, 1, 0.2156863, 0, 1,
-1.87191, -0.1890378, -1.643332, 1, 0.2235294, 0, 1,
-1.864583, 0.2231254, -2.034365, 1, 0.227451, 0, 1,
-1.845552, -1.075069, -2.464252, 1, 0.2352941, 0, 1,
-1.820172, -0.5933999, -2.323908, 1, 0.2392157, 0, 1,
-1.812613, -1.262573, -1.558694, 1, 0.2470588, 0, 1,
-1.791043, 0.2513926, 0.1567412, 1, 0.2509804, 0, 1,
-1.768845, 0.5055613, -1.972294, 1, 0.2588235, 0, 1,
-1.756691, 0.2834723, -0.6538677, 1, 0.2627451, 0, 1,
-1.721676, 0.1765397, -1.024958, 1, 0.2705882, 0, 1,
-1.707301, 2.342412, -1.370491, 1, 0.2745098, 0, 1,
-1.694737, 0.8424917, 0.2935501, 1, 0.282353, 0, 1,
-1.679657, 1.020027, -0.1166102, 1, 0.2862745, 0, 1,
-1.657161, 0.3600566, -1.643551, 1, 0.2941177, 0, 1,
-1.638428, 1.251486, -0.02807481, 1, 0.3019608, 0, 1,
-1.633496, 2.734587, -0.2828698, 1, 0.3058824, 0, 1,
-1.623125, -1.488037, -2.804491, 1, 0.3137255, 0, 1,
-1.610501, 0.4027738, -2.833698, 1, 0.3176471, 0, 1,
-1.608722, 0.4459126, -0.7874566, 1, 0.3254902, 0, 1,
-1.604673, -0.9337365, -1.604352, 1, 0.3294118, 0, 1,
-1.555655, 0.7685399, 0.8646504, 1, 0.3372549, 0, 1,
-1.553145, -0.7233148, -2.317694, 1, 0.3411765, 0, 1,
-1.543949, -0.7280543, -0.1517041, 1, 0.3490196, 0, 1,
-1.539193, 0.6501065, -2.564569, 1, 0.3529412, 0, 1,
-1.534585, 1.926566, -0.5525392, 1, 0.3607843, 0, 1,
-1.525664, 0.2510688, 0.4387363, 1, 0.3647059, 0, 1,
-1.521742, 1.591572, -1.362946, 1, 0.372549, 0, 1,
-1.509633, -0.6401049, -0.6726414, 1, 0.3764706, 0, 1,
-1.505255, -1.033165, -2.103516, 1, 0.3843137, 0, 1,
-1.486068, -1.102786, -3.053732, 1, 0.3882353, 0, 1,
-1.484618, -0.8203617, -1.057753, 1, 0.3960784, 0, 1,
-1.480035, -0.5518664, -1.829522, 1, 0.4039216, 0, 1,
-1.477122, 0.2395497, -1.579387, 1, 0.4078431, 0, 1,
-1.472724, 0.5688484, -2.304277, 1, 0.4156863, 0, 1,
-1.468768, -0.1562366, -0.4227573, 1, 0.4196078, 0, 1,
-1.468333, 0.1933972, -2.409739, 1, 0.427451, 0, 1,
-1.456972, 0.5068638, -0.5375922, 1, 0.4313726, 0, 1,
-1.453687, 0.07287437, -0.1712964, 1, 0.4392157, 0, 1,
-1.433263, 1.778382, -1.994614, 1, 0.4431373, 0, 1,
-1.423818, 1.979481, -2.326395, 1, 0.4509804, 0, 1,
-1.415456, -0.131068, -4.644025, 1, 0.454902, 0, 1,
-1.410716, -0.6055642, -0.7207524, 1, 0.4627451, 0, 1,
-1.399919, 0.2915508, -0.3626584, 1, 0.4666667, 0, 1,
-1.396483, -1.460424, -2.868685, 1, 0.4745098, 0, 1,
-1.365365, 0.2388297, -1.60972, 1, 0.4784314, 0, 1,
-1.362609, -1.295166, -2.543211, 1, 0.4862745, 0, 1,
-1.361188, -1.611697, -3.762717, 1, 0.4901961, 0, 1,
-1.358537, 0.9740456, -0.6655717, 1, 0.4980392, 0, 1,
-1.349649, -0.8396018, -2.145702, 1, 0.5058824, 0, 1,
-1.348805, -1.292877, -3.035402, 1, 0.509804, 0, 1,
-1.347222, -0.5622729, -3.469589, 1, 0.5176471, 0, 1,
-1.331088, 0.2863897, -1.475267, 1, 0.5215687, 0, 1,
-1.330423, 0.887859, 0.06381255, 1, 0.5294118, 0, 1,
-1.324116, 1.737237, -0.9005748, 1, 0.5333334, 0, 1,
-1.319145, -0.1923538, -1.743219, 1, 0.5411765, 0, 1,
-1.315856, -0.2815949, -1.2288, 1, 0.5450981, 0, 1,
-1.314178, 1.001663, -0.5361148, 1, 0.5529412, 0, 1,
-1.310688, -0.4193856, -2.383236, 1, 0.5568628, 0, 1,
-1.29604, 2.059595, 0.8262706, 1, 0.5647059, 0, 1,
-1.29155, -0.7176409, -0.9838839, 1, 0.5686275, 0, 1,
-1.282819, 0.4589471, -0.3571038, 1, 0.5764706, 0, 1,
-1.270746, 0.6453706, -1.381175, 1, 0.5803922, 0, 1,
-1.262731, -0.1886408, -2.660635, 1, 0.5882353, 0, 1,
-1.256607, 0.2616888, -0.5653878, 1, 0.5921569, 0, 1,
-1.252006, -0.3277276, -0.8312665, 1, 0.6, 0, 1,
-1.247537, 2.991551, -1.144324, 1, 0.6078432, 0, 1,
-1.244148, -0.422015, -1.673109, 1, 0.6117647, 0, 1,
-1.24076, -0.107754, -1.76696, 1, 0.6196079, 0, 1,
-1.237054, 0.5359026, -2.13186, 1, 0.6235294, 0, 1,
-1.234403, 1.362486, -1.897228, 1, 0.6313726, 0, 1,
-1.232526, 0.9635341, 0.09190936, 1, 0.6352941, 0, 1,
-1.227611, -0.6426305, -1.685267, 1, 0.6431373, 0, 1,
-1.217469, -1.097785, -3.78671, 1, 0.6470588, 0, 1,
-1.213286, -0.2403378, -2.178985, 1, 0.654902, 0, 1,
-1.209517, -1.159056, -0.5686913, 1, 0.6588235, 0, 1,
-1.20918, 1.337865, 0.5373999, 1, 0.6666667, 0, 1,
-1.207338, 0.3070328, -0.7065113, 1, 0.6705883, 0, 1,
-1.197731, -2.08266, -1.8287, 1, 0.6784314, 0, 1,
-1.197353, -0.3182295, -1.157287, 1, 0.682353, 0, 1,
-1.196544, -1.385293, -3.456448, 1, 0.6901961, 0, 1,
-1.191099, -2.076897, -1.403628, 1, 0.6941177, 0, 1,
-1.188444, 0.469173, -2.321579, 1, 0.7019608, 0, 1,
-1.186749, 0.8500186, 2.40482, 1, 0.7098039, 0, 1,
-1.185826, 2.42695, -0.305938, 1, 0.7137255, 0, 1,
-1.185081, -0.2790181, -0.5516453, 1, 0.7215686, 0, 1,
-1.182273, 0.4880284, -0.3282262, 1, 0.7254902, 0, 1,
-1.142515, 0.893416, -0.8084263, 1, 0.7333333, 0, 1,
-1.138291, -0.6993325, -0.7206677, 1, 0.7372549, 0, 1,
-1.137422, -0.280172, -1.198882, 1, 0.7450981, 0, 1,
-1.134507, -0.7393604, -1.987544, 1, 0.7490196, 0, 1,
-1.133682, 1.211585, -2.116644, 1, 0.7568628, 0, 1,
-1.131153, 0.06546351, -0.7552221, 1, 0.7607843, 0, 1,
-1.130989, 1.765262, 1.521423e-05, 1, 0.7686275, 0, 1,
-1.118986, -0.3033431, -1.923829, 1, 0.772549, 0, 1,
-1.114418, 1.011961, -0.3878126, 1, 0.7803922, 0, 1,
-1.112055, -1.038472, -3.094647, 1, 0.7843137, 0, 1,
-1.111841, -1.756155, -2.376627, 1, 0.7921569, 0, 1,
-1.109685, -0.4355688, -2.989131, 1, 0.7960784, 0, 1,
-1.095887, 0.2383983, -1.758308, 1, 0.8039216, 0, 1,
-1.078905, 0.1649467, -1.171194, 1, 0.8117647, 0, 1,
-1.070083, 0.3866196, -1.027956, 1, 0.8156863, 0, 1,
-1.064326, -1.019765, -1.494517, 1, 0.8235294, 0, 1,
-1.064278, 1.379429, 0.7044654, 1, 0.827451, 0, 1,
-1.060254, -0.2463533, -0.7413207, 1, 0.8352941, 0, 1,
-1.038707, -0.002769014, -0.4583226, 1, 0.8392157, 0, 1,
-1.029964, -0.2296415, -1.941409, 1, 0.8470588, 0, 1,
-1.020745, -0.3860177, -3.780301, 1, 0.8509804, 0, 1,
-1.019932, 0.3510631, -1.22735, 1, 0.8588235, 0, 1,
-1.019882, -0.563783, -3.524498, 1, 0.8627451, 0, 1,
-1.008868, -0.4797568, -1.791898, 1, 0.8705882, 0, 1,
-1.008572, -1.419567, -2.61128, 1, 0.8745098, 0, 1,
-1.004772, 1.740465, -0.6186671, 1, 0.8823529, 0, 1,
-0.9993695, -0.3837091, 0.01801766, 1, 0.8862745, 0, 1,
-0.99914, -0.957266, -3.356659, 1, 0.8941177, 0, 1,
-0.9966092, -1.945108, -1.859869, 1, 0.8980392, 0, 1,
-0.9851478, -0.09572038, -1.652241, 1, 0.9058824, 0, 1,
-0.9850765, -0.8634432, -3.794187, 1, 0.9137255, 0, 1,
-0.9795482, 0.2969418, -2.883092, 1, 0.9176471, 0, 1,
-0.9767241, 0.8621715, -1.882335, 1, 0.9254902, 0, 1,
-0.9751895, -2.12528, -2.421858, 1, 0.9294118, 0, 1,
-0.9675271, 0.5523992, 1.286562, 1, 0.9372549, 0, 1,
-0.9621251, -0.003040455, -0.7636063, 1, 0.9411765, 0, 1,
-0.9596021, -0.8866692, -2.719796, 1, 0.9490196, 0, 1,
-0.9559069, 0.5997727, 0.2769416, 1, 0.9529412, 0, 1,
-0.9473029, 0.8545396, 0.1616094, 1, 0.9607843, 0, 1,
-0.9463988, -0.5302624, -2.151795, 1, 0.9647059, 0, 1,
-0.9432463, -0.6923662, -3.304901, 1, 0.972549, 0, 1,
-0.9338474, -0.7129033, -1.922548, 1, 0.9764706, 0, 1,
-0.9271426, -1.505987, -2.705517, 1, 0.9843137, 0, 1,
-0.9230279, 0.6293321, -0.6038674, 1, 0.9882353, 0, 1,
-0.9159876, -0.6118485, -2.609741, 1, 0.9960784, 0, 1,
-0.9105008, 0.1051571, -1.619435, 0.9960784, 1, 0, 1,
-0.9099491, 0.1400872, -0.01551022, 0.9921569, 1, 0, 1,
-0.8957157, -0.585622, -2.931952, 0.9843137, 1, 0, 1,
-0.8942958, -0.6238047, -2.790717, 0.9803922, 1, 0, 1,
-0.8922874, -1.823824, -4.01256, 0.972549, 1, 0, 1,
-0.8919152, 0.3837101, -1.375613, 0.9686275, 1, 0, 1,
-0.8894491, -0.2821921, -1.786336, 0.9607843, 1, 0, 1,
-0.888376, -1.420011, -2.459565, 0.9568627, 1, 0, 1,
-0.8611537, 0.6891205, 0.4254294, 0.9490196, 1, 0, 1,
-0.8588329, 0.8826455, -2.156641, 0.945098, 1, 0, 1,
-0.8560789, 0.3279766, -2.128461, 0.9372549, 1, 0, 1,
-0.8509886, -0.01224258, 0.8542227, 0.9333333, 1, 0, 1,
-0.8430252, -0.5874851, -1.956613, 0.9254902, 1, 0, 1,
-0.8307493, -0.6344016, -2.159157, 0.9215686, 1, 0, 1,
-0.8292904, -1.101594, -2.800692, 0.9137255, 1, 0, 1,
-0.8274279, -0.5382312, -2.308156, 0.9098039, 1, 0, 1,
-0.8266706, -0.6692516, -1.922374, 0.9019608, 1, 0, 1,
-0.8198175, -1.639956, -1.746354, 0.8941177, 1, 0, 1,
-0.819231, 0.2497556, 0.234469, 0.8901961, 1, 0, 1,
-0.8032455, 0.454585, -1.254433, 0.8823529, 1, 0, 1,
-0.8010249, 2.178365, 0.04609757, 0.8784314, 1, 0, 1,
-0.7972794, 0.2700206, -2.774106, 0.8705882, 1, 0, 1,
-0.7905775, -0.2131549, -2.425452, 0.8666667, 1, 0, 1,
-0.7892776, -0.1716621, -2.281389, 0.8588235, 1, 0, 1,
-0.782436, 2.219176, -0.4731887, 0.854902, 1, 0, 1,
-0.7817051, -0.9882189, -1.810128, 0.8470588, 1, 0, 1,
-0.7810951, 0.1841701, -2.491481, 0.8431373, 1, 0, 1,
-0.7779867, -1.533711, -3.53363, 0.8352941, 1, 0, 1,
-0.7530629, 0.2579463, -0.06430997, 0.8313726, 1, 0, 1,
-0.7517325, 0.1041249, -0.6343269, 0.8235294, 1, 0, 1,
-0.7465794, 0.2122891, -1.433964, 0.8196079, 1, 0, 1,
-0.7448152, 1.302924, -0.6361927, 0.8117647, 1, 0, 1,
-0.7441623, 0.6663766, -2.703572, 0.8078431, 1, 0, 1,
-0.7408575, 1.496731, -0.03794998, 0.8, 1, 0, 1,
-0.7361762, -0.8303043, -2.609855, 0.7921569, 1, 0, 1,
-0.7335467, -0.6646006, -2.064705, 0.7882353, 1, 0, 1,
-0.732967, 2.381761, -0.2333802, 0.7803922, 1, 0, 1,
-0.7329399, -1.745966, -4.062942, 0.7764706, 1, 0, 1,
-0.7327889, -1.09866, -2.234906, 0.7686275, 1, 0, 1,
-0.729064, 0.2314418, -0.5464811, 0.7647059, 1, 0, 1,
-0.7277795, -0.1162452, -2.885709, 0.7568628, 1, 0, 1,
-0.7263383, 1.125594, 0.7905723, 0.7529412, 1, 0, 1,
-0.7217602, -1.514752, -3.576306, 0.7450981, 1, 0, 1,
-0.7160056, -0.5880348, -0.9998894, 0.7411765, 1, 0, 1,
-0.7102165, 0.614412, -1.110941, 0.7333333, 1, 0, 1,
-0.7095638, -1.863945, -3.622915, 0.7294118, 1, 0, 1,
-0.7060083, 0.831715, -0.4788228, 0.7215686, 1, 0, 1,
-0.7052484, -0.8626009, -3.803375, 0.7176471, 1, 0, 1,
-0.7021363, -1.146101, -2.954496, 0.7098039, 1, 0, 1,
-0.7010447, 0.6493543, 0.6324752, 0.7058824, 1, 0, 1,
-0.6914948, 1.590891, -0.6212181, 0.6980392, 1, 0, 1,
-0.6892833, 0.9960912, -1.873413, 0.6901961, 1, 0, 1,
-0.6849695, 0.00714467, -0.3397436, 0.6862745, 1, 0, 1,
-0.6814763, -1.702189, -1.552853, 0.6784314, 1, 0, 1,
-0.6774255, -1.944326, -1.150965, 0.6745098, 1, 0, 1,
-0.6742818, 0.4766777, -0.03008609, 0.6666667, 1, 0, 1,
-0.6741299, -0.9284211, -2.510667, 0.6627451, 1, 0, 1,
-0.6739784, -1.494915, -3.095114, 0.654902, 1, 0, 1,
-0.6726155, 1.396763, -0.2783425, 0.6509804, 1, 0, 1,
-0.6720685, -0.4696921, -2.160272, 0.6431373, 1, 0, 1,
-0.6693985, -0.569893, -2.542925, 0.6392157, 1, 0, 1,
-0.6689462, -0.4252286, -2.077947, 0.6313726, 1, 0, 1,
-0.665986, 0.3492875, -0.8554513, 0.627451, 1, 0, 1,
-0.6592678, -0.5729944, -2.584116, 0.6196079, 1, 0, 1,
-0.6494497, 0.6557013, -0.5435427, 0.6156863, 1, 0, 1,
-0.6446373, 0.1479582, -0.6181431, 0.6078432, 1, 0, 1,
-0.6440082, 1.444708, 0.05474491, 0.6039216, 1, 0, 1,
-0.6439337, -1.546871, -3.760167, 0.5960785, 1, 0, 1,
-0.6406567, 0.01561225, -0.2708913, 0.5882353, 1, 0, 1,
-0.6352389, 0.9455902, -0.4916649, 0.5843138, 1, 0, 1,
-0.6335888, 0.799707, -0.7834179, 0.5764706, 1, 0, 1,
-0.6328216, 0.06015366, -0.6626372, 0.572549, 1, 0, 1,
-0.6246653, 1.376008, -0.7318248, 0.5647059, 1, 0, 1,
-0.6239957, -1.361747, -3.762787, 0.5607843, 1, 0, 1,
-0.6226578, -0.4848518, -2.204389, 0.5529412, 1, 0, 1,
-0.622418, -0.9160368, -2.111248, 0.5490196, 1, 0, 1,
-0.6156992, -1.215449, -0.8905661, 0.5411765, 1, 0, 1,
-0.6115265, 0.8061304, -0.1670411, 0.5372549, 1, 0, 1,
-0.6115025, -0.1830698, -2.943377, 0.5294118, 1, 0, 1,
-0.6077447, -0.8146882, -2.385674, 0.5254902, 1, 0, 1,
-0.5845127, 0.9045129, -1.109825, 0.5176471, 1, 0, 1,
-0.5799098, -1.912041, -2.365518, 0.5137255, 1, 0, 1,
-0.5766568, 0.3368374, -1.917915, 0.5058824, 1, 0, 1,
-0.5755228, -0.3789252, -3.482881, 0.5019608, 1, 0, 1,
-0.5706785, 0.5713674, 1.344193, 0.4941176, 1, 0, 1,
-0.5648887, -1.172057, -2.434276, 0.4862745, 1, 0, 1,
-0.5617796, 0.7803303, -2.255153, 0.4823529, 1, 0, 1,
-0.5541427, -0.7545273, -2.186486, 0.4745098, 1, 0, 1,
-0.5526422, 1.744663, 0.5773397, 0.4705882, 1, 0, 1,
-0.5518364, 0.3965062, -1.252102, 0.4627451, 1, 0, 1,
-0.5517107, -0.3145142, -1.901811, 0.4588235, 1, 0, 1,
-0.5513423, -1.167039, -2.600442, 0.4509804, 1, 0, 1,
-0.5507311, 0.9103886, 0.6569957, 0.4470588, 1, 0, 1,
-0.5405432, -0.5612344, -1.904873, 0.4392157, 1, 0, 1,
-0.5405326, -0.3303608, -2.794701, 0.4352941, 1, 0, 1,
-0.5369784, 0.6971338, -0.8519709, 0.427451, 1, 0, 1,
-0.527298, -1.970674, -3.621617, 0.4235294, 1, 0, 1,
-0.5256232, 0.4204468, -0.2621424, 0.4156863, 1, 0, 1,
-0.5247061, -1.373478, -1.118952, 0.4117647, 1, 0, 1,
-0.5182438, 0.6904082, -1.496772, 0.4039216, 1, 0, 1,
-0.5179738, -1.42189, -3.779154, 0.3960784, 1, 0, 1,
-0.5159054, 0.2739956, -0.5224034, 0.3921569, 1, 0, 1,
-0.5136997, 0.5241399, -0.08890149, 0.3843137, 1, 0, 1,
-0.5110769, -1.57757, -2.783447, 0.3803922, 1, 0, 1,
-0.5052747, -0.8469991, -3.103168, 0.372549, 1, 0, 1,
-0.5021379, 1.108433, -0.34616, 0.3686275, 1, 0, 1,
-0.5018666, 0.8840484, -2.710176, 0.3607843, 1, 0, 1,
-0.4931296, 0.1686193, -0.9428621, 0.3568628, 1, 0, 1,
-0.4895401, 0.1129628, -1.771218, 0.3490196, 1, 0, 1,
-0.4866436, -1.4676, -1.450829, 0.345098, 1, 0, 1,
-0.4860174, -1.893957, -0.8885899, 0.3372549, 1, 0, 1,
-0.4846904, -0.4121252, -1.850957, 0.3333333, 1, 0, 1,
-0.4844041, -0.6371759, -3.150091, 0.3254902, 1, 0, 1,
-0.4838252, -0.4121077, -1.541894, 0.3215686, 1, 0, 1,
-0.4800488, 0.7584505, -0.8952619, 0.3137255, 1, 0, 1,
-0.4711507, 0.2690751, -2.983355, 0.3098039, 1, 0, 1,
-0.470247, 1.099799, -0.8482007, 0.3019608, 1, 0, 1,
-0.470165, 0.1382219, -0.5505989, 0.2941177, 1, 0, 1,
-0.4696361, 0.004393274, -0.5587477, 0.2901961, 1, 0, 1,
-0.4609832, 0.7228131, -1.930275, 0.282353, 1, 0, 1,
-0.4591845, -0.4759305, -2.036782, 0.2784314, 1, 0, 1,
-0.4591001, -0.4362015, -3.45612, 0.2705882, 1, 0, 1,
-0.4590139, -1.902117, -2.385047, 0.2666667, 1, 0, 1,
-0.4575345, -0.2419626, -2.646096, 0.2588235, 1, 0, 1,
-0.4573561, -1.671464, -3.514902, 0.254902, 1, 0, 1,
-0.4515724, 0.3909377, -1.151041, 0.2470588, 1, 0, 1,
-0.4501786, -1.032099, -2.01526, 0.2431373, 1, 0, 1,
-0.4440877, 1.412923, -1.336468, 0.2352941, 1, 0, 1,
-0.4432079, 2.189318, 0.7427319, 0.2313726, 1, 0, 1,
-0.4407164, -1.720836, -3.939943, 0.2235294, 1, 0, 1,
-0.4358078, -0.1246619, -1.92673, 0.2196078, 1, 0, 1,
-0.435246, 0.6403646, 0.7338453, 0.2117647, 1, 0, 1,
-0.4310154, 0.2016274, -0.9533381, 0.2078431, 1, 0, 1,
-0.4285998, -0.8488446, -1.969092, 0.2, 1, 0, 1,
-0.4232244, 1.916053, 0.3622642, 0.1921569, 1, 0, 1,
-0.4218724, 1.744845, -0.7887301, 0.1882353, 1, 0, 1,
-0.421001, -0.6187598, -4.331954, 0.1803922, 1, 0, 1,
-0.4206864, 2.215163, -0.7503091, 0.1764706, 1, 0, 1,
-0.4188975, -0.2110068, -1.082177, 0.1686275, 1, 0, 1,
-0.4148832, 0.9446408, -0.4390254, 0.1647059, 1, 0, 1,
-0.4140607, 1.078623, -0.4102049, 0.1568628, 1, 0, 1,
-0.4132209, 1.201915, 1.205316, 0.1529412, 1, 0, 1,
-0.4129411, 0.2565178, -0.6555682, 0.145098, 1, 0, 1,
-0.412304, -0.02322728, -0.2119025, 0.1411765, 1, 0, 1,
-0.4100432, -0.005368402, -2.019199, 0.1333333, 1, 0, 1,
-0.4081779, -1.232932, -3.858667, 0.1294118, 1, 0, 1,
-0.4044966, 0.443156, 0.5997526, 0.1215686, 1, 0, 1,
-0.4039717, -0.7253733, -3.482916, 0.1176471, 1, 0, 1,
-0.4031698, -0.2127111, -2.470472, 0.1098039, 1, 0, 1,
-0.4013632, 1.505485, -0.2334586, 0.1058824, 1, 0, 1,
-0.4012628, -0.2523977, -2.347438, 0.09803922, 1, 0, 1,
-0.4011558, -0.9889885, -3.546059, 0.09019608, 1, 0, 1,
-0.3960231, 0.7154851, -0.8707663, 0.08627451, 1, 0, 1,
-0.3942496, 0.2779423, -1.918086, 0.07843138, 1, 0, 1,
-0.3897963, 0.2373218, 0.4051101, 0.07450981, 1, 0, 1,
-0.387374, -0.7617834, -2.491438, 0.06666667, 1, 0, 1,
-0.3831455, 0.2520084, -3.075505, 0.0627451, 1, 0, 1,
-0.383058, -0.09597252, -2.294567, 0.05490196, 1, 0, 1,
-0.3814506, -1.00204, -3.305535, 0.05098039, 1, 0, 1,
-0.3792109, -0.7135564, -3.166389, 0.04313726, 1, 0, 1,
-0.378968, -0.3302563, -0.6733477, 0.03921569, 1, 0, 1,
-0.3736163, -0.10521, -1.007585, 0.03137255, 1, 0, 1,
-0.3717737, 0.4651427, -0.3683044, 0.02745098, 1, 0, 1,
-0.3717017, 1.136875, 0.4481441, 0.01960784, 1, 0, 1,
-0.362841, -1.357179, -2.432082, 0.01568628, 1, 0, 1,
-0.3613251, 0.2912237, -0.7590703, 0.007843138, 1, 0, 1,
-0.3597597, -0.6272174, -1.999691, 0.003921569, 1, 0, 1,
-0.3550149, -0.1102643, -1.578231, 0, 1, 0.003921569, 1,
-0.354611, -0.04404027, -1.000054, 0, 1, 0.01176471, 1,
-0.3534807, -0.3504599, -3.274313, 0, 1, 0.01568628, 1,
-0.3528066, 0.0719093, -0.5139347, 0, 1, 0.02352941, 1,
-0.3517358, 0.5736933, -0.8884844, 0, 1, 0.02745098, 1,
-0.3491922, -1.550365, -2.159876, 0, 1, 0.03529412, 1,
-0.3474124, -0.2640086, -2.871298, 0, 1, 0.03921569, 1,
-0.342228, 0.2196136, -2.351579, 0, 1, 0.04705882, 1,
-0.341211, -0.1546094, -0.7883462, 0, 1, 0.05098039, 1,
-0.3373917, -1.395486, -3.95883, 0, 1, 0.05882353, 1,
-0.3322973, -0.6469334, -3.903591, 0, 1, 0.0627451, 1,
-0.3305898, -1.416979, -3.958196, 0, 1, 0.07058824, 1,
-0.3299778, 0.4986817, -1.217155, 0, 1, 0.07450981, 1,
-0.329925, -0.7462002, -5.491531, 0, 1, 0.08235294, 1,
-0.325969, -0.9882499, -4.116998, 0, 1, 0.08627451, 1,
-0.3248727, 1.760097, 2.014448, 0, 1, 0.09411765, 1,
-0.3237583, 1.286957, -1.115852, 0, 1, 0.1019608, 1,
-0.3237359, -0.1665057, -0.9436496, 0, 1, 0.1058824, 1,
-0.3218956, 1.240976, 0.5500433, 0, 1, 0.1137255, 1,
-0.3215504, -0.7993711, -2.710118, 0, 1, 0.1176471, 1,
-0.3198628, -0.3228843, -4.463731, 0, 1, 0.1254902, 1,
-0.314963, 0.6251308, 0.2991302, 0, 1, 0.1294118, 1,
-0.3149506, -1.103102, -1.668701, 0, 1, 0.1372549, 1,
-0.3118896, 0.2575959, -2.335626, 0, 1, 0.1411765, 1,
-0.310495, -0.8193974, -1.869971, 0, 1, 0.1490196, 1,
-0.3069239, 1.050767, 0.3434246, 0, 1, 0.1529412, 1,
-0.3052095, 0.8437515, 0.3067295, 0, 1, 0.1607843, 1,
-0.3041224, 1.14344, -2.904425, 0, 1, 0.1647059, 1,
-0.2994718, -1.84534, -2.784702, 0, 1, 0.172549, 1,
-0.2992769, -0.8992496, -5.344123, 0, 1, 0.1764706, 1,
-0.2988773, -0.7924441, -2.649416, 0, 1, 0.1843137, 1,
-0.2980417, 0.9524353, -0.2504929, 0, 1, 0.1882353, 1,
-0.2966718, 1.214103, -0.9328856, 0, 1, 0.1960784, 1,
-0.2964334, -1.212641, -2.904005, 0, 1, 0.2039216, 1,
-0.2908461, -0.441324, -2.745285, 0, 1, 0.2078431, 1,
-0.2869717, -0.3973822, -2.4994, 0, 1, 0.2156863, 1,
-0.2813716, -0.9912483, -3.661477, 0, 1, 0.2196078, 1,
-0.2811547, -0.6118717, -2.492029, 0, 1, 0.227451, 1,
-0.2788818, 1.519173, -0.5891125, 0, 1, 0.2313726, 1,
-0.2742675, 1.043176, 1.275746, 0, 1, 0.2392157, 1,
-0.2738262, -0.08931068, -2.795279, 0, 1, 0.2431373, 1,
-0.2725953, -0.0006567213, -2.020063, 0, 1, 0.2509804, 1,
-0.2714615, 0.442326, 0.7479626, 0, 1, 0.254902, 1,
-0.2693981, -0.3753853, -2.664253, 0, 1, 0.2627451, 1,
-0.2693813, 0.2667726, -1.092674, 0, 1, 0.2666667, 1,
-0.2650608, 2.438424, -0.109938, 0, 1, 0.2745098, 1,
-0.2582037, -1.336723, -3.67239, 0, 1, 0.2784314, 1,
-0.2580473, 0.7499801, -0.3580864, 0, 1, 0.2862745, 1,
-0.2554511, 0.6162843, -1.232681, 0, 1, 0.2901961, 1,
-0.2534169, 0.1424643, -1.895955, 0, 1, 0.2980392, 1,
-0.249856, 0.09493177, 0.1878177, 0, 1, 0.3058824, 1,
-0.2469512, -0.951206, -3.933432, 0, 1, 0.3098039, 1,
-0.2466772, -1.631192, -3.219254, 0, 1, 0.3176471, 1,
-0.2458285, 1.123735, 1.529591, 0, 1, 0.3215686, 1,
-0.2449186, -0.5286106, -3.388546, 0, 1, 0.3294118, 1,
-0.2438021, 0.8424932, 0.4624992, 0, 1, 0.3333333, 1,
-0.2397909, -1.641322, -1.540569, 0, 1, 0.3411765, 1,
-0.2391375, 0.4777486, -1.344766, 0, 1, 0.345098, 1,
-0.2379405, 0.3514798, 0.190566, 0, 1, 0.3529412, 1,
-0.2316714, -0.7249902, -3.419572, 0, 1, 0.3568628, 1,
-0.2313691, 0.8828585, -1.870059, 0, 1, 0.3647059, 1,
-0.2311221, 0.2777222, -0.6525049, 0, 1, 0.3686275, 1,
-0.2291988, -0.2827437, -2.370301, 0, 1, 0.3764706, 1,
-0.2281303, 0.6851593, -0.5778994, 0, 1, 0.3803922, 1,
-0.2266435, 1.084275, -0.4917232, 0, 1, 0.3882353, 1,
-0.2205359, 0.6268494, -0.1287472, 0, 1, 0.3921569, 1,
-0.2196819, 0.7059243, 1.279545, 0, 1, 0.4, 1,
-0.2182508, -0.3687873, -0.9219934, 0, 1, 0.4078431, 1,
-0.2176322, -1.342751, -3.661059, 0, 1, 0.4117647, 1,
-0.2135409, -1.287089, -3.394383, 0, 1, 0.4196078, 1,
-0.203651, -1.695768, -3.958016, 0, 1, 0.4235294, 1,
-0.2036402, -1.003961, -3.293202, 0, 1, 0.4313726, 1,
-0.2017396, 2.174865, -0.4642243, 0, 1, 0.4352941, 1,
-0.1973296, 0.9035493, 0.7475151, 0, 1, 0.4431373, 1,
-0.1958071, 0.4982887, -0.3421713, 0, 1, 0.4470588, 1,
-0.1853333, -0.4689186, -2.712162, 0, 1, 0.454902, 1,
-0.184013, 0.5458858, -0.03708788, 0, 1, 0.4588235, 1,
-0.178773, -0.1522563, -2.177776, 0, 1, 0.4666667, 1,
-0.1774715, -0.8298671, -1.797305, 0, 1, 0.4705882, 1,
-0.1759914, 0.5948043, -0.6664465, 0, 1, 0.4784314, 1,
-0.1724673, -1.10232, -3.404826, 0, 1, 0.4823529, 1,
-0.1706163, -0.121623, -1.686359, 0, 1, 0.4901961, 1,
-0.1698267, -0.5965505, -4.02969, 0, 1, 0.4941176, 1,
-0.1693602, -0.1427846, -1.630629, 0, 1, 0.5019608, 1,
-0.1663241, -1.090245, -2.904524, 0, 1, 0.509804, 1,
-0.1652381, 1.034692, 0.1542961, 0, 1, 0.5137255, 1,
-0.1615257, 1.066242, -0.7667713, 0, 1, 0.5215687, 1,
-0.161346, -0.4018956, -3.851013, 0, 1, 0.5254902, 1,
-0.1474406, 1.76513, -0.3473243, 0, 1, 0.5333334, 1,
-0.1469316, -0.5900837, -2.331374, 0, 1, 0.5372549, 1,
-0.1458027, 0.9507418, 1.763744, 0, 1, 0.5450981, 1,
-0.1446284, -2.613904, -4.240169, 0, 1, 0.5490196, 1,
-0.1432903, 0.2566444, -1.030479, 0, 1, 0.5568628, 1,
-0.1420768, 0.7809682, 1.546599, 0, 1, 0.5607843, 1,
-0.1419026, -2.120606, -2.849565, 0, 1, 0.5686275, 1,
-0.1410588, 2.509923, 0.6686619, 0, 1, 0.572549, 1,
-0.1400197, 0.9497609, -0.1682764, 0, 1, 0.5803922, 1,
-0.1373298, -1.381461, -3.066357, 0, 1, 0.5843138, 1,
-0.1348933, 0.9900185, -1.292397, 0, 1, 0.5921569, 1,
-0.1340871, 0.3280612, -0.9105139, 0, 1, 0.5960785, 1,
-0.127094, 0.2749697, -0.1045121, 0, 1, 0.6039216, 1,
-0.1269874, -1.381392, -2.297214, 0, 1, 0.6117647, 1,
-0.1250661, 1.127005, -0.9350474, 0, 1, 0.6156863, 1,
-0.1242017, -0.06529505, -0.4706115, 0, 1, 0.6235294, 1,
-0.1233373, -1.490798, -3.891333, 0, 1, 0.627451, 1,
-0.1223513, 0.7329899, -0.4863729, 0, 1, 0.6352941, 1,
-0.12086, 0.4296357, -0.3757597, 0, 1, 0.6392157, 1,
-0.1199484, -1.349929, -2.224649, 0, 1, 0.6470588, 1,
-0.1191333, 0.3280742, -0.6391492, 0, 1, 0.6509804, 1,
-0.1140539, -1.657286, -5.645996, 0, 1, 0.6588235, 1,
-0.1110415, 0.3892698, -0.1414747, 0, 1, 0.6627451, 1,
-0.1059043, 0.4846727, -0.6129878, 0, 1, 0.6705883, 1,
-0.1033316, -1.255458, -4.369262, 0, 1, 0.6745098, 1,
-0.1019867, 0.2088902, -1.564873, 0, 1, 0.682353, 1,
-0.09735731, -0.3850739, -2.035606, 0, 1, 0.6862745, 1,
-0.09723891, 0.101197, -1.107481, 0, 1, 0.6941177, 1,
-0.0929077, -1.083108, -3.296203, 0, 1, 0.7019608, 1,
-0.09015668, -0.9929652, -2.742649, 0, 1, 0.7058824, 1,
-0.08960777, 1.535243, -0.3456697, 0, 1, 0.7137255, 1,
-0.08413367, -1.029951, -1.563651, 0, 1, 0.7176471, 1,
-0.0809962, 0.264267, -1.764257, 0, 1, 0.7254902, 1,
-0.08092127, -0.3898405, -4.489718, 0, 1, 0.7294118, 1,
-0.07970861, -1.056875, -2.285301, 0, 1, 0.7372549, 1,
-0.07953063, 0.8364969, -1.31418, 0, 1, 0.7411765, 1,
-0.07939909, -1.275901, -3.07397, 0, 1, 0.7490196, 1,
-0.0741018, 0.5287882, -0.4446293, 0, 1, 0.7529412, 1,
-0.07144207, -0.779587, -0.9507862, 0, 1, 0.7607843, 1,
-0.07005813, 2.168538, -0.1119691, 0, 1, 0.7647059, 1,
-0.06690551, -0.3546226, -3.802415, 0, 1, 0.772549, 1,
-0.0654435, -0.9788042, -4.165695, 0, 1, 0.7764706, 1,
-0.06512517, 0.06117205, -0.9697897, 0, 1, 0.7843137, 1,
-0.06352621, 0.8506958, -1.586059, 0, 1, 0.7882353, 1,
-0.06237721, 1.202612, -1.102042, 0, 1, 0.7960784, 1,
-0.0602314, -1.932262, -2.84082, 0, 1, 0.8039216, 1,
-0.05947216, 1.358053, -0.7504622, 0, 1, 0.8078431, 1,
-0.05764733, 0.1313345, -0.620138, 0, 1, 0.8156863, 1,
-0.05763673, -0.4462043, -4.586524, 0, 1, 0.8196079, 1,
-0.0559508, 0.440363, -0.9344725, 0, 1, 0.827451, 1,
-0.04962967, -1.500525, -1.41343, 0, 1, 0.8313726, 1,
-0.04912613, 0.2320752, -0.8885459, 0, 1, 0.8392157, 1,
-0.03871301, -0.1973301, -1.465244, 0, 1, 0.8431373, 1,
-0.03561357, -0.4068039, -1.53824, 0, 1, 0.8509804, 1,
-0.03353281, 2.168028, -0.2424171, 0, 1, 0.854902, 1,
-0.0301809, -1.882933, -5.036101, 0, 1, 0.8627451, 1,
-0.02695937, 0.7428815, -0.8837537, 0, 1, 0.8666667, 1,
-0.0268908, 1.277213, -0.8474894, 0, 1, 0.8745098, 1,
-0.02658322, -0.5172827, -3.416051, 0, 1, 0.8784314, 1,
-0.02565345, 0.1513709, -0.5982789, 0, 1, 0.8862745, 1,
-0.02461308, -0.7532139, -4.010354, 0, 1, 0.8901961, 1,
-0.0244216, -1.05856, -2.314463, 0, 1, 0.8980392, 1,
-0.02426559, -0.5668656, -1.990848, 0, 1, 0.9058824, 1,
-0.02357697, -0.4907359, -2.814389, 0, 1, 0.9098039, 1,
-0.02052201, -0.7579144, -2.385693, 0, 1, 0.9176471, 1,
-0.01554847, -1.293676, -2.660067, 0, 1, 0.9215686, 1,
-0.01310137, 2.272795, -0.7762018, 0, 1, 0.9294118, 1,
-0.0123732, 0.1922887, -0.1266894, 0, 1, 0.9333333, 1,
-0.00996889, -0.6720223, -3.343954, 0, 1, 0.9411765, 1,
-0.00784644, 0.4980547, 0.6966087, 0, 1, 0.945098, 1,
-0.006295545, 2.273895, 0.2218642, 0, 1, 0.9529412, 1,
-0.00574643, -0.9724828, -2.647266, 0, 1, 0.9568627, 1,
-0.003243237, -0.9014954, -2.421706, 0, 1, 0.9647059, 1,
-0.002355052, 0.6049148, -0.6819854, 0, 1, 0.9686275, 1,
0.00336877, 1.151756, 0.9409101, 0, 1, 0.9764706, 1,
0.005251064, -0.5259934, 4.087098, 0, 1, 0.9803922, 1,
0.007387828, 1.236444, -1.694131, 0, 1, 0.9882353, 1,
0.007804888, -1.430513, 4.264591, 0, 1, 0.9921569, 1,
0.01078912, 1.670255, -0.329155, 0, 1, 1, 1,
0.01535233, 0.460517, 0.9434905, 0, 0.9921569, 1, 1,
0.01614091, 0.5936995, 1.539281, 0, 0.9882353, 1, 1,
0.0188716, 1.363613, 1.745122, 0, 0.9803922, 1, 1,
0.0261798, -0.8309357, 2.355149, 0, 0.9764706, 1, 1,
0.02703936, -0.6131904, 5.537218, 0, 0.9686275, 1, 1,
0.02963182, 1.80627, -0.2304915, 0, 0.9647059, 1, 1,
0.02991966, -0.644774, 2.540477, 0, 0.9568627, 1, 1,
0.03066261, -1.275579, 2.337558, 0, 0.9529412, 1, 1,
0.03256224, 1.259534, -0.07111466, 0, 0.945098, 1, 1,
0.03260243, -0.4115023, 1.00207, 0, 0.9411765, 1, 1,
0.03335077, 0.1770135, 1.35631, 0, 0.9333333, 1, 1,
0.0355343, -0.2962986, 4.064385, 0, 0.9294118, 1, 1,
0.0357228, -1.764979, 3.674613, 0, 0.9215686, 1, 1,
0.03807735, -0.6546278, 2.752479, 0, 0.9176471, 1, 1,
0.04004119, 0.3571427, 1.361121, 0, 0.9098039, 1, 1,
0.04041921, 1.564108, 2.239157, 0, 0.9058824, 1, 1,
0.04092165, 0.8767335, -0.6564787, 0, 0.8980392, 1, 1,
0.04371222, -1.634463, 4.903942, 0, 0.8901961, 1, 1,
0.04599061, 0.7601041, 0.2024177, 0, 0.8862745, 1, 1,
0.05206386, -0.6010844, 3.852906, 0, 0.8784314, 1, 1,
0.05268217, 0.1509909, 0.3165658, 0, 0.8745098, 1, 1,
0.05493324, 2.372405, 0.05153898, 0, 0.8666667, 1, 1,
0.05740048, 0.763185, -1.406568, 0, 0.8627451, 1, 1,
0.06056905, -1.811394, 1.571141, 0, 0.854902, 1, 1,
0.06110873, -0.9857492, 2.494531, 0, 0.8509804, 1, 1,
0.06164195, -0.4364456, 1.31458, 0, 0.8431373, 1, 1,
0.06606452, -0.1139434, 3.22571, 0, 0.8392157, 1, 1,
0.07244311, -0.9041005, 3.278993, 0, 0.8313726, 1, 1,
0.07564191, 0.9667818, 1.516803, 0, 0.827451, 1, 1,
0.07686967, 0.3036837, -2.123736, 0, 0.8196079, 1, 1,
0.07696568, 0.8103572, 3.251145, 0, 0.8156863, 1, 1,
0.07843584, -0.5991049, 2.333649, 0, 0.8078431, 1, 1,
0.07950939, 0.9019886, 0.3371858, 0, 0.8039216, 1, 1,
0.07990266, 0.7859302, -0.982112, 0, 0.7960784, 1, 1,
0.08192808, 0.4291795, 0.5130624, 0, 0.7882353, 1, 1,
0.08292505, -0.6115037, 2.859056, 0, 0.7843137, 1, 1,
0.08594307, -0.473224, 2.959366, 0, 0.7764706, 1, 1,
0.08739607, -0.3009638, 2.551786, 0, 0.772549, 1, 1,
0.09076174, 0.4646832, -0.3122852, 0, 0.7647059, 1, 1,
0.09248662, -0.6706067, 3.447978, 0, 0.7607843, 1, 1,
0.09293918, -1.097109, 2.273021, 0, 0.7529412, 1, 1,
0.09685495, 1.304515, -3.020481, 0, 0.7490196, 1, 1,
0.09748236, -1.525961, 2.643891, 0, 0.7411765, 1, 1,
0.1006233, -0.3028369, 4.248624, 0, 0.7372549, 1, 1,
0.1037639, 0.1249947, 1.517707, 0, 0.7294118, 1, 1,
0.10647, 0.1811519, -1.651132, 0, 0.7254902, 1, 1,
0.1070149, 0.9027169, -0.9494215, 0, 0.7176471, 1, 1,
0.1086167, 0.004038541, 0.7266284, 0, 0.7137255, 1, 1,
0.1119179, 2.538666, -1.619912, 0, 0.7058824, 1, 1,
0.1124129, 0.121743, -0.5276368, 0, 0.6980392, 1, 1,
0.1135647, 3.233346, 0.918503, 0, 0.6941177, 1, 1,
0.1137328, 0.1444857, -1.490196, 0, 0.6862745, 1, 1,
0.1166597, -0.8434994, 4.333957, 0, 0.682353, 1, 1,
0.1170769, -0.4171573, 4.16256, 0, 0.6745098, 1, 1,
0.1232813, 2.508956, -0.4067237, 0, 0.6705883, 1, 1,
0.1279044, 1.173592, -0.7499192, 0, 0.6627451, 1, 1,
0.1290212, -0.7858446, 4.750056, 0, 0.6588235, 1, 1,
0.1291543, -0.453673, 1.880458, 0, 0.6509804, 1, 1,
0.1302138, 3.425411, 0.8278351, 0, 0.6470588, 1, 1,
0.1307707, -0.6764956, 1.873792, 0, 0.6392157, 1, 1,
0.1308536, 1.009308, 0.6627146, 0, 0.6352941, 1, 1,
0.1339101, -0.8945817, 3.662777, 0, 0.627451, 1, 1,
0.1341179, -1.937878, 2.868075, 0, 0.6235294, 1, 1,
0.1401711, -0.6048773, 1.905033, 0, 0.6156863, 1, 1,
0.1423821, -0.2907965, 2.589067, 0, 0.6117647, 1, 1,
0.1428237, 1.682564, 0.1798624, 0, 0.6039216, 1, 1,
0.145131, -0.5619619, 3.929843, 0, 0.5960785, 1, 1,
0.1452625, 0.1117567, 0.79158, 0, 0.5921569, 1, 1,
0.147233, -0.427772, 2.458177, 0, 0.5843138, 1, 1,
0.1494758, 0.5108107, -1.626948, 0, 0.5803922, 1, 1,
0.1498468, 0.2622624, -0.7746711, 0, 0.572549, 1, 1,
0.1508686, -1.062897, 1.871506, 0, 0.5686275, 1, 1,
0.1557165, -2.137074, 5.219381, 0, 0.5607843, 1, 1,
0.1580383, -1.121146, 2.84809, 0, 0.5568628, 1, 1,
0.1616674, -0.6541914, 3.26364, 0, 0.5490196, 1, 1,
0.1657066, -0.4720727, 1.879778, 0, 0.5450981, 1, 1,
0.1808844, 0.1558884, 0.4961859, 0, 0.5372549, 1, 1,
0.1886463, -1.076439, 1.730797, 0, 0.5333334, 1, 1,
0.1910978, -0.3818576, 3.566573, 0, 0.5254902, 1, 1,
0.2079758, 0.6845386, -0.7508112, 0, 0.5215687, 1, 1,
0.2127406, 0.1409018, 1.352817, 0, 0.5137255, 1, 1,
0.2134028, -0.4197693, 2.53281, 0, 0.509804, 1, 1,
0.2181123, 0.4913739, 0.9539886, 0, 0.5019608, 1, 1,
0.2198718, -1.14079, 1.683189, 0, 0.4941176, 1, 1,
0.2213894, -0.2477485, 1.637159, 0, 0.4901961, 1, 1,
0.2258272, 1.144519, 0.576735, 0, 0.4823529, 1, 1,
0.2321066, 0.4549674, 0.9414492, 0, 0.4784314, 1, 1,
0.2327006, -0.8978359, 1.66014, 0, 0.4705882, 1, 1,
0.2363908, -0.4335117, 2.932827, 0, 0.4666667, 1, 1,
0.2367021, 0.1370106, 0.6116083, 0, 0.4588235, 1, 1,
0.2370422, -0.5700459, 1.867435, 0, 0.454902, 1, 1,
0.2391565, 0.1884731, 2.471784, 0, 0.4470588, 1, 1,
0.2495572, -0.5965102, 1.921109, 0, 0.4431373, 1, 1,
0.2505985, -1.983211, 2.983149, 0, 0.4352941, 1, 1,
0.2527949, -0.2249981, 2.56763, 0, 0.4313726, 1, 1,
0.256718, -0.06370018, -0.3920915, 0, 0.4235294, 1, 1,
0.2596931, 0.6322311, 0.661665, 0, 0.4196078, 1, 1,
0.262138, -1.288502, 2.526381, 0, 0.4117647, 1, 1,
0.2657842, 0.006473996, 0.08994514, 0, 0.4078431, 1, 1,
0.2671039, -1.197875, 3.404481, 0, 0.4, 1, 1,
0.2703165, 0.4252523, 1.27836, 0, 0.3921569, 1, 1,
0.2706742, -0.5234855, 3.705649, 0, 0.3882353, 1, 1,
0.2707344, 1.257674, -1.150036, 0, 0.3803922, 1, 1,
0.2709623, -0.6892004, 4.089766, 0, 0.3764706, 1, 1,
0.2714854, -1.551903, 3.318802, 0, 0.3686275, 1, 1,
0.2725954, -0.4022096, 0.2860156, 0, 0.3647059, 1, 1,
0.2770059, 0.2176732, 1.61674, 0, 0.3568628, 1, 1,
0.2844906, 0.04867116, -0.7613767, 0, 0.3529412, 1, 1,
0.2865447, 0.2291258, 1.93139, 0, 0.345098, 1, 1,
0.2889566, -1.269332, 2.555116, 0, 0.3411765, 1, 1,
0.2899477, 0.3288428, 1.216091, 0, 0.3333333, 1, 1,
0.2917426, -0.749615, 2.847618, 0, 0.3294118, 1, 1,
0.2922985, -1.249753, 3.369082, 0, 0.3215686, 1, 1,
0.2938876, 0.02860842, 0.7397187, 0, 0.3176471, 1, 1,
0.295285, 0.3635668, 1.207963, 0, 0.3098039, 1, 1,
0.2983629, -0.5251702, 2.193251, 0, 0.3058824, 1, 1,
0.2991562, -0.6736183, 1.800787, 0, 0.2980392, 1, 1,
0.2994305, -0.5797058, 1.544915, 0, 0.2901961, 1, 1,
0.2994309, 0.2189225, 0.6184328, 0, 0.2862745, 1, 1,
0.3033422, 1.871423, -0.5306736, 0, 0.2784314, 1, 1,
0.3072994, -2.655388, 4.138268, 0, 0.2745098, 1, 1,
0.3114521, -1.447068, 3.450264, 0, 0.2666667, 1, 1,
0.3134949, -2.716762, 3.273898, 0, 0.2627451, 1, 1,
0.3137424, -0.9476718, 2.429703, 0, 0.254902, 1, 1,
0.314267, 0.856777, 0.891389, 0, 0.2509804, 1, 1,
0.316177, -0.2675878, 2.774885, 0, 0.2431373, 1, 1,
0.324293, 0.5943421, 0.9053783, 0, 0.2392157, 1, 1,
0.3273335, 0.4279422, 2.741074, 0, 0.2313726, 1, 1,
0.3324451, 0.1193396, 0.7505202, 0, 0.227451, 1, 1,
0.3331196, -1.152415, 2.012206, 0, 0.2196078, 1, 1,
0.3332539, -0.2551641, 2.560505, 0, 0.2156863, 1, 1,
0.3335686, -1.546497, 3.993874, 0, 0.2078431, 1, 1,
0.3375277, 0.4111862, 2.480939, 0, 0.2039216, 1, 1,
0.3387728, -0.6847188, 3.991938, 0, 0.1960784, 1, 1,
0.3410968, 1.153253, 1.664755, 0, 0.1882353, 1, 1,
0.341478, -0.1793857, 1.978562, 0, 0.1843137, 1, 1,
0.3429788, 1.648555, -0.3085526, 0, 0.1764706, 1, 1,
0.3488487, -0.07615808, 1.530163, 0, 0.172549, 1, 1,
0.3496553, -0.5846013, 4.956077, 0, 0.1647059, 1, 1,
0.3504288, -1.224512, 3.411277, 0, 0.1607843, 1, 1,
0.3537171, -2.44761, 2.8891, 0, 0.1529412, 1, 1,
0.3550815, 0.4106431, -0.3954319, 0, 0.1490196, 1, 1,
0.3556566, 0.02085006, -0.2648118, 0, 0.1411765, 1, 1,
0.3585642, 0.5829995, 0.7483364, 0, 0.1372549, 1, 1,
0.3603025, -1.398072, 3.127425, 0, 0.1294118, 1, 1,
0.3625965, -0.2600526, 1.667582, 0, 0.1254902, 1, 1,
0.3631004, -0.5812535, 2.618181, 0, 0.1176471, 1, 1,
0.3637249, -0.03387959, 1.757441, 0, 0.1137255, 1, 1,
0.3683743, 1.107143, -0.3322978, 0, 0.1058824, 1, 1,
0.3737058, -0.6748133, 0.369223, 0, 0.09803922, 1, 1,
0.3744732, -0.1342187, 2.253784, 0, 0.09411765, 1, 1,
0.3785692, -0.02690741, 1.275307, 0, 0.08627451, 1, 1,
0.3798188, -2.102421, 3.363755, 0, 0.08235294, 1, 1,
0.3923801, -0.7591861, 2.542165, 0, 0.07450981, 1, 1,
0.4022783, 0.04358001, 1.421529, 0, 0.07058824, 1, 1,
0.4026165, -0.4492261, 1.231767, 0, 0.0627451, 1, 1,
0.4030635, -1.11735, 2.724163, 0, 0.05882353, 1, 1,
0.407726, 0.5857553, 0.2976142, 0, 0.05098039, 1, 1,
0.4126062, 2.053073, 0.6822199, 0, 0.04705882, 1, 1,
0.4130385, -0.1733039, 1.71243, 0, 0.03921569, 1, 1,
0.4137723, -1.029643, 3.29941, 0, 0.03529412, 1, 1,
0.4144943, 0.6103623, 0.08702678, 0, 0.02745098, 1, 1,
0.4163184, -1.523535, 2.970226, 0, 0.02352941, 1, 1,
0.4186407, 0.2673109, -0.1042792, 0, 0.01568628, 1, 1,
0.4253616, -0.3438366, 3.280198, 0, 0.01176471, 1, 1,
0.4256732, 1.481332, 0.1526887, 0, 0.003921569, 1, 1,
0.4262438, -1.933596, 3.044846, 0.003921569, 0, 1, 1,
0.4319297, -2.517516, 2.103933, 0.007843138, 0, 1, 1,
0.4332322, -1.097991, 3.144468, 0.01568628, 0, 1, 1,
0.4385256, 1.092369, -0.8315187, 0.01960784, 0, 1, 1,
0.4463457, -0.7557256, 4.571996, 0.02745098, 0, 1, 1,
0.4483161, 0.1406864, 0.7835065, 0.03137255, 0, 1, 1,
0.4502839, -1.030491, 4.183912, 0.03921569, 0, 1, 1,
0.4603911, 0.8021654, 0.8306226, 0.04313726, 0, 1, 1,
0.4614752, 0.2352402, 2.322684, 0.05098039, 0, 1, 1,
0.4624163, -0.4880062, 2.62998, 0.05490196, 0, 1, 1,
0.4647904, -0.0536791, 2.481959, 0.0627451, 0, 1, 1,
0.4661782, -0.7830011, 2.241315, 0.06666667, 0, 1, 1,
0.4680948, 2.312056, -0.170826, 0.07450981, 0, 1, 1,
0.4697626, -1.138967, 1.752546, 0.07843138, 0, 1, 1,
0.4706801, 0.07036963, 2.189043, 0.08627451, 0, 1, 1,
0.4743212, 0.7411667, -0.3284555, 0.09019608, 0, 1, 1,
0.477446, 0.2953835, 3.12136, 0.09803922, 0, 1, 1,
0.4802077, -1.655639, 3.068228, 0.1058824, 0, 1, 1,
0.4847252, -0.02046746, 0.6066124, 0.1098039, 0, 1, 1,
0.4857107, -1.154865, 1.647916, 0.1176471, 0, 1, 1,
0.4917143, -1.445821, 3.068934, 0.1215686, 0, 1, 1,
0.4920821, -0.3814667, 2.921887, 0.1294118, 0, 1, 1,
0.4944154, 0.6543436, 0.08218446, 0.1333333, 0, 1, 1,
0.4951027, -0.5708448, 3.967277, 0.1411765, 0, 1, 1,
0.4969619, 0.727185, 0.3966908, 0.145098, 0, 1, 1,
0.4982521, -1.05009, 1.363288, 0.1529412, 0, 1, 1,
0.498275, 0.06952471, 2.319863, 0.1568628, 0, 1, 1,
0.5030767, 0.4068163, 0.3333396, 0.1647059, 0, 1, 1,
0.5035045, -0.3485865, 2.793898, 0.1686275, 0, 1, 1,
0.503899, -1.897038, 2.777895, 0.1764706, 0, 1, 1,
0.505985, -1.04121, -0.1336426, 0.1803922, 0, 1, 1,
0.5078393, -0.1480699, 1.56198, 0.1882353, 0, 1, 1,
0.5099856, -1.98632, 3.276277, 0.1921569, 0, 1, 1,
0.5102249, 1.360108, -0.9011201, 0.2, 0, 1, 1,
0.5107051, -0.6394657, 2.980449, 0.2078431, 0, 1, 1,
0.5176021, -0.8396547, 2.151496, 0.2117647, 0, 1, 1,
0.5189303, 0.2491006, 0.973593, 0.2196078, 0, 1, 1,
0.5195791, 0.7519355, -0.2563507, 0.2235294, 0, 1, 1,
0.5219398, 1.165543, 0.4518088, 0.2313726, 0, 1, 1,
0.5222892, -0.8486897, 3.755617, 0.2352941, 0, 1, 1,
0.5284223, 0.8269241, 1.521278, 0.2431373, 0, 1, 1,
0.5301379, -0.3938604, 0.241474, 0.2470588, 0, 1, 1,
0.5360277, 0.6353568, -0.2702897, 0.254902, 0, 1, 1,
0.5409226, 0.5220427, 1.906009, 0.2588235, 0, 1, 1,
0.5481533, 0.4530681, -0.1411966, 0.2666667, 0, 1, 1,
0.5508515, 0.1708439, 1.618697, 0.2705882, 0, 1, 1,
0.5580092, -1.823965, 3.412633, 0.2784314, 0, 1, 1,
0.5605502, -1.227713, 2.987303, 0.282353, 0, 1, 1,
0.5658064, 2.154065, 1.000506, 0.2901961, 0, 1, 1,
0.5675595, -0.5519274, 2.632996, 0.2941177, 0, 1, 1,
0.586127, 0.6539547, -0.2813945, 0.3019608, 0, 1, 1,
0.5880134, 0.7652194, 1.054799, 0.3098039, 0, 1, 1,
0.5880865, 2.611164, -1.358798, 0.3137255, 0, 1, 1,
0.5885895, 1.586637, 2.247765, 0.3215686, 0, 1, 1,
0.5914516, 0.4383235, 1.082626, 0.3254902, 0, 1, 1,
0.5924997, 1.135729, 0.8986744, 0.3333333, 0, 1, 1,
0.6016458, 0.5657149, 2.36829, 0.3372549, 0, 1, 1,
0.6036676, 0.01366321, 1.792762, 0.345098, 0, 1, 1,
0.614203, -0.2462599, -1.463227, 0.3490196, 0, 1, 1,
0.6203564, 3.175646, 1.244586, 0.3568628, 0, 1, 1,
0.6308548, 2.513995, -1.864878, 0.3607843, 0, 1, 1,
0.6359819, 0.1987294, 1.45624, 0.3686275, 0, 1, 1,
0.6370839, -0.5822119, 1.829239, 0.372549, 0, 1, 1,
0.6382017, 0.4236591, 1.582365, 0.3803922, 0, 1, 1,
0.6418695, 0.4138459, 1.711299, 0.3843137, 0, 1, 1,
0.6458626, 0.9184441, 1.050726, 0.3921569, 0, 1, 1,
0.6520979, -1.004009, 2.705785, 0.3960784, 0, 1, 1,
0.6564085, 1.433468, 1.464709, 0.4039216, 0, 1, 1,
0.656755, -0.7268482, 2.840898, 0.4117647, 0, 1, 1,
0.6575181, -0.612335, 3.620293, 0.4156863, 0, 1, 1,
0.6582393, -0.7259636, 1.136024, 0.4235294, 0, 1, 1,
0.6726652, 2.028456, 0.5679045, 0.427451, 0, 1, 1,
0.6728676, 0.3410857, 1.249404, 0.4352941, 0, 1, 1,
0.6739818, 0.3962465, 1.922037, 0.4392157, 0, 1, 1,
0.677991, 0.4635463, 2.412535, 0.4470588, 0, 1, 1,
0.6791152, -0.5905058, 0.4182287, 0.4509804, 0, 1, 1,
0.6832784, -2.424627, 4.703501, 0.4588235, 0, 1, 1,
0.6883895, 0.501493, 1.460651, 0.4627451, 0, 1, 1,
0.6936281, -0.1677491, 2.624972, 0.4705882, 0, 1, 1,
0.7007748, 0.9161664, 0.6248534, 0.4745098, 0, 1, 1,
0.7060746, -1.217988, 1.816178, 0.4823529, 0, 1, 1,
0.7086565, 1.738058, 2.118493, 0.4862745, 0, 1, 1,
0.7090764, 2.237949, -1.560478, 0.4941176, 0, 1, 1,
0.7160641, 0.5173571, 1.628662, 0.5019608, 0, 1, 1,
0.7179349, 0.8881381, 0.678502, 0.5058824, 0, 1, 1,
0.7241099, -0.6421403, 1.979267, 0.5137255, 0, 1, 1,
0.7277731, -0.552442, 2.52484, 0.5176471, 0, 1, 1,
0.7308912, 0.4614099, 0.4801622, 0.5254902, 0, 1, 1,
0.7361807, 0.6935042, -0.01325588, 0.5294118, 0, 1, 1,
0.7456886, 1.349933, 0.6342952, 0.5372549, 0, 1, 1,
0.7459822, -0.456165, 3.051682, 0.5411765, 0, 1, 1,
0.7469205, 1.758968, 0.6108, 0.5490196, 0, 1, 1,
0.7522812, -0.4952013, 0.7563907, 0.5529412, 0, 1, 1,
0.7540036, -0.04997711, 2.701119, 0.5607843, 0, 1, 1,
0.7625263, -1.314564, 0.3746423, 0.5647059, 0, 1, 1,
0.7673893, 0.4962126, -0.06039586, 0.572549, 0, 1, 1,
0.7683419, 0.8529056, 0.9585806, 0.5764706, 0, 1, 1,
0.7702753, -1.664424, 3.701512, 0.5843138, 0, 1, 1,
0.7705933, -0.342593, 2.411605, 0.5882353, 0, 1, 1,
0.7785318, -0.3303752, 1.594997, 0.5960785, 0, 1, 1,
0.7837324, 0.6700419, 1.199071, 0.6039216, 0, 1, 1,
0.7849029, -1.284785, 2.248335, 0.6078432, 0, 1, 1,
0.791099, -2.454861, 3.0916, 0.6156863, 0, 1, 1,
0.7939824, 0.7178216, 0.9575126, 0.6196079, 0, 1, 1,
0.7944254, 0.3187186, 1.310733, 0.627451, 0, 1, 1,
0.7962402, 0.1316734, 1.452168, 0.6313726, 0, 1, 1,
0.7969047, -0.09143505, 1.522078, 0.6392157, 0, 1, 1,
0.7972406, -0.7523076, 1.236229, 0.6431373, 0, 1, 1,
0.8019239, 1.192991, 0.5151411, 0.6509804, 0, 1, 1,
0.8058991, -0.03975893, 1.361354, 0.654902, 0, 1, 1,
0.8059744, -1.820222, 3.270405, 0.6627451, 0, 1, 1,
0.8063883, 0.007575645, 3.233933, 0.6666667, 0, 1, 1,
0.8065055, -2.097367, 1.708095, 0.6745098, 0, 1, 1,
0.8066245, 1.526147, -0.9960859, 0.6784314, 0, 1, 1,
0.8085515, -0.7476342, 1.382212, 0.6862745, 0, 1, 1,
0.8113735, 1.421703, 0.7990966, 0.6901961, 0, 1, 1,
0.8115835, 0.2706461, 1.43771, 0.6980392, 0, 1, 1,
0.8121801, -0.4030079, 2.602228, 0.7058824, 0, 1, 1,
0.81734, 0.1199409, 2.10316, 0.7098039, 0, 1, 1,
0.8191997, -0.7330891, 1.921023, 0.7176471, 0, 1, 1,
0.8217446, 0.5993394, 2.320874, 0.7215686, 0, 1, 1,
0.8299401, -0.2571014, 2.562566, 0.7294118, 0, 1, 1,
0.8305842, 0.282684, 0.8249952, 0.7333333, 0, 1, 1,
0.8308311, -0.3731248, 3.30626, 0.7411765, 0, 1, 1,
0.8381717, -0.05178504, 2.145774, 0.7450981, 0, 1, 1,
0.8382383, -0.2192018, 2.335232, 0.7529412, 0, 1, 1,
0.840557, -0.1498246, 1.532298, 0.7568628, 0, 1, 1,
0.8466311, -0.6888365, 0.1520477, 0.7647059, 0, 1, 1,
0.8474487, 1.881608, 1.05085, 0.7686275, 0, 1, 1,
0.8487452, 1.866451, 1.503082, 0.7764706, 0, 1, 1,
0.8515101, 0.8717377, 0.4706176, 0.7803922, 0, 1, 1,
0.8529014, 1.580445, 0.8031639, 0.7882353, 0, 1, 1,
0.8541887, 0.03775028, 2.194791, 0.7921569, 0, 1, 1,
0.8604771, -0.22653, 2.957628, 0.8, 0, 1, 1,
0.8636389, -1.444921, 3.025605, 0.8078431, 0, 1, 1,
0.8642203, 0.3948934, 1.054116, 0.8117647, 0, 1, 1,
0.8674785, 0.3396527, 0.6711956, 0.8196079, 0, 1, 1,
0.8691949, 0.5908899, -1.006061, 0.8235294, 0, 1, 1,
0.8703756, 0.9647195, -0.6104488, 0.8313726, 0, 1, 1,
0.8710147, -1.190818, 2.454125, 0.8352941, 0, 1, 1,
0.8743628, 0.6595277, 1.044022, 0.8431373, 0, 1, 1,
0.8757442, -0.244232, -0.3132457, 0.8470588, 0, 1, 1,
0.8775828, 1.533614, 1.509276, 0.854902, 0, 1, 1,
0.8843964, 0.1139824, 0.7865116, 0.8588235, 0, 1, 1,
0.8852799, -1.275899, 1.154625, 0.8666667, 0, 1, 1,
0.8870924, -2.479077, 3.070556, 0.8705882, 0, 1, 1,
0.8876817, -0.4510454, 1.733491, 0.8784314, 0, 1, 1,
0.8910822, -0.8321987, 1.871965, 0.8823529, 0, 1, 1,
0.8936989, 1.304176, 0.1066007, 0.8901961, 0, 1, 1,
0.8971762, 0.6787452, 1.016337, 0.8941177, 0, 1, 1,
0.8988251, -3.075848, 3.3226, 0.9019608, 0, 1, 1,
0.9017352, -1.274375, 1.895281, 0.9098039, 0, 1, 1,
0.9024212, -0.6632034, 4.552874, 0.9137255, 0, 1, 1,
0.9029229, -0.8354328, 2.347281, 0.9215686, 0, 1, 1,
0.9038064, 1.73631, -0.4848735, 0.9254902, 0, 1, 1,
0.905595, -0.8118881, 2.788535, 0.9333333, 0, 1, 1,
0.9085964, -0.5760478, 3.821372, 0.9372549, 0, 1, 1,
0.9165028, 1.133132, 0.5039829, 0.945098, 0, 1, 1,
0.9196593, -1.00157, 1.852939, 0.9490196, 0, 1, 1,
0.9226739, 1.478418, 0.4482462, 0.9568627, 0, 1, 1,
0.9231984, 0.4204466, 1.753777, 0.9607843, 0, 1, 1,
0.9233673, -0.6498133, 2.493445, 0.9686275, 0, 1, 1,
0.9289366, 0.416017, 2.162478, 0.972549, 0, 1, 1,
0.9401722, -0.5645557, 2.275639, 0.9803922, 0, 1, 1,
0.9495767, -0.5206251, 0.5979813, 0.9843137, 0, 1, 1,
0.950308, 1.253943, -1.330156, 0.9921569, 0, 1, 1,
0.9532839, -1.770944, 3.731987, 0.9960784, 0, 1, 1,
0.9535932, 0.4940128, 1.603369, 1, 0, 0.9960784, 1,
0.9578038, 0.5440345, 0.6750426, 1, 0, 0.9882353, 1,
0.960098, -0.7133396, 3.766162, 1, 0, 0.9843137, 1,
0.9622866, 0.1123369, 2.623562, 1, 0, 0.9764706, 1,
0.9623468, 1.079531, -0.2347958, 1, 0, 0.972549, 1,
0.9625559, -1.454587, 0.7392434, 1, 0, 0.9647059, 1,
0.9634719, -1.895028, 1.319125, 1, 0, 0.9607843, 1,
0.9687338, -0.003675998, 0.9120828, 1, 0, 0.9529412, 1,
0.969348, 1.129427, 1.691381, 1, 0, 0.9490196, 1,
0.9743495, 2.215272, 0.5966496, 1, 0, 0.9411765, 1,
0.9806453, 1.105203, 2.008464, 1, 0, 0.9372549, 1,
0.9853879, -1.400401, 2.255986, 1, 0, 0.9294118, 1,
0.9906394, -0.51601, 2.249058, 1, 0, 0.9254902, 1,
0.9950461, -0.7660943, 2.435205, 1, 0, 0.9176471, 1,
1.000417, 1.500269, 0.4198009, 1, 0, 0.9137255, 1,
1.004756, -0.9058971, 3.363187, 1, 0, 0.9058824, 1,
1.009593, 1.573413, -0.8120769, 1, 0, 0.9019608, 1,
1.0117, -0.3066677, 2.309741, 1, 0, 0.8941177, 1,
1.015367, -0.1283553, 1.821077, 1, 0, 0.8862745, 1,
1.025449, -0.7770907, 3.198803, 1, 0, 0.8823529, 1,
1.033202, 0.6480974, 0.1543938, 1, 0, 0.8745098, 1,
1.033738, -0.5601423, 1.886867, 1, 0, 0.8705882, 1,
1.034438, 0.1752713, 0.78628, 1, 0, 0.8627451, 1,
1.037469, -1.801314, 4.900728, 1, 0, 0.8588235, 1,
1.04138, 0.5878421, 2.051378, 1, 0, 0.8509804, 1,
1.042418, 0.2826446, 1.187823, 1, 0, 0.8470588, 1,
1.04259, 0.08645654, 2.481229, 1, 0, 0.8392157, 1,
1.044039, -0.09093118, -0.0001623716, 1, 0, 0.8352941, 1,
1.048978, 0.2081319, -0.1025959, 1, 0, 0.827451, 1,
1.050722, -1.822455, -0.1662108, 1, 0, 0.8235294, 1,
1.057465, -1.130524, 0.3527603, 1, 0, 0.8156863, 1,
1.074017, -0.8433278, 2.885078, 1, 0, 0.8117647, 1,
1.074735, -0.3329976, 1.098152, 1, 0, 0.8039216, 1,
1.078478, 1.680833, 2.311765, 1, 0, 0.7960784, 1,
1.080421, -1.114816, 3.398603, 1, 0, 0.7921569, 1,
1.085039, -2.650948, 3.267044, 1, 0, 0.7843137, 1,
1.091189, -0.4583844, 0.7096834, 1, 0, 0.7803922, 1,
1.092258, -0.64077, 3.189669, 1, 0, 0.772549, 1,
1.09586, 1.762607, 1.822852, 1, 0, 0.7686275, 1,
1.099069, -0.7048705, 0.6161249, 1, 0, 0.7607843, 1,
1.100541, -2.583462, 2.298355, 1, 0, 0.7568628, 1,
1.111524, -1.255911, 0.7679048, 1, 0, 0.7490196, 1,
1.113341, -1.426027, 2.635329, 1, 0, 0.7450981, 1,
1.120598, 1.216775, 1.575943, 1, 0, 0.7372549, 1,
1.127596, 0.2507348, 2.419025, 1, 0, 0.7333333, 1,
1.132079, -0.2809184, 2.054661, 1, 0, 0.7254902, 1,
1.135143, -0.4659539, 2.330255, 1, 0, 0.7215686, 1,
1.139195, 1.313773, 0.958592, 1, 0, 0.7137255, 1,
1.144241, 1.039879, 2.903857, 1, 0, 0.7098039, 1,
1.160561, 0.9544153, 1.274813, 1, 0, 0.7019608, 1,
1.160681, 1.08997, 1.03885, 1, 0, 0.6941177, 1,
1.167134, -1.762948, 1.447295, 1, 0, 0.6901961, 1,
1.176306, 0.03481679, 1.730126, 1, 0, 0.682353, 1,
1.180515, 1.510445, 0.2815406, 1, 0, 0.6784314, 1,
1.182724, -1.62454, 2.681082, 1, 0, 0.6705883, 1,
1.189161, -1.364173, 2.584444, 1, 0, 0.6666667, 1,
1.196486, 1.6177, 2.402483, 1, 0, 0.6588235, 1,
1.19944, 0.4943776, -0.2883087, 1, 0, 0.654902, 1,
1.199573, 0.516412, -0.4029249, 1, 0, 0.6470588, 1,
1.208078, -0.8134629, 3.69946, 1, 0, 0.6431373, 1,
1.209877, -2.710147, 4.056116, 1, 0, 0.6352941, 1,
1.213944, -0.9783652, 2.619475, 1, 0, 0.6313726, 1,
1.215861, -0.5388659, 1.657304, 1, 0, 0.6235294, 1,
1.220838, -2.259274, 3.090381, 1, 0, 0.6196079, 1,
1.221689, 1.585273, 0.860634, 1, 0, 0.6117647, 1,
1.222124, 1.278999, -0.1156803, 1, 0, 0.6078432, 1,
1.222639, -0.7103953, 1.28662, 1, 0, 0.6, 1,
1.225473, -0.8192869, 0.888317, 1, 0, 0.5921569, 1,
1.22572, 0.8047929, 0.2198761, 1, 0, 0.5882353, 1,
1.232664, -1.388852, 2.520749, 1, 0, 0.5803922, 1,
1.23365, -0.04721433, 1.124436, 1, 0, 0.5764706, 1,
1.240471, -0.09311127, 3.860399, 1, 0, 0.5686275, 1,
1.241035, 0.7520599, 2.305689, 1, 0, 0.5647059, 1,
1.242303, -1.336555, 2.185191, 1, 0, 0.5568628, 1,
1.242405, 0.1505565, -0.2568412, 1, 0, 0.5529412, 1,
1.242613, -1.788121, 2.734749, 1, 0, 0.5450981, 1,
1.244379, 0.5476547, 0.4667957, 1, 0, 0.5411765, 1,
1.251363, -0.2983518, 2.391873, 1, 0, 0.5333334, 1,
1.255445, 0.392595, 3.852664, 1, 0, 0.5294118, 1,
1.262637, -0.7105131, 1.277735, 1, 0, 0.5215687, 1,
1.2658, -0.827089, 2.643462, 1, 0, 0.5176471, 1,
1.266967, 0.5105075, 0.6690331, 1, 0, 0.509804, 1,
1.270443, -0.9671521, 3.80246, 1, 0, 0.5058824, 1,
1.278113, -0.119256, -0.2045289, 1, 0, 0.4980392, 1,
1.284113, 0.7993038, -0.1799346, 1, 0, 0.4901961, 1,
1.285764, 0.2265743, 2.267755, 1, 0, 0.4862745, 1,
1.310712, -0.6706675, 1.397969, 1, 0, 0.4784314, 1,
1.317834, -0.6051694, 1.750715, 1, 0, 0.4745098, 1,
1.326658, -0.2936798, 2.371334, 1, 0, 0.4666667, 1,
1.344452, -0.449304, 3.877638, 1, 0, 0.4627451, 1,
1.371882, -1.186832, 1.6127, 1, 0, 0.454902, 1,
1.396087, -2.823272, 2.373138, 1, 0, 0.4509804, 1,
1.398439, -0.921104, 2.922939, 1, 0, 0.4431373, 1,
1.417505, 1.344594, 0.08524319, 1, 0, 0.4392157, 1,
1.419381, -0.9461366, 1.326753, 1, 0, 0.4313726, 1,
1.420473, -0.3809612, 2.132003, 1, 0, 0.427451, 1,
1.427521, 0.8839354, 1.023187, 1, 0, 0.4196078, 1,
1.440923, 0.1302544, 0.5994681, 1, 0, 0.4156863, 1,
1.443102, 2.069774, 1.4173, 1, 0, 0.4078431, 1,
1.44964, 1.740493, 0.158668, 1, 0, 0.4039216, 1,
1.464172, -0.6134707, 1.412581, 1, 0, 0.3960784, 1,
1.467277, -1.626107, 1.631887, 1, 0, 0.3882353, 1,
1.472268, -0.2558292, 1.737619, 1, 0, 0.3843137, 1,
1.478433, 0.677691, 0.06856511, 1, 0, 0.3764706, 1,
1.488364, -0.5982331, 1.089218, 1, 0, 0.372549, 1,
1.493652, 1.172295, 1.606426, 1, 0, 0.3647059, 1,
1.493791, 0.4739291, 0.2603528, 1, 0, 0.3607843, 1,
1.504431, 2.240904, 0.382459, 1, 0, 0.3529412, 1,
1.528781, -0.9536002, 2.009013, 1, 0, 0.3490196, 1,
1.53054, 0.7327192, 1.179446, 1, 0, 0.3411765, 1,
1.531418, 1.390097, 0.8744601, 1, 0, 0.3372549, 1,
1.532104, -0.9957828, 0.4062656, 1, 0, 0.3294118, 1,
1.54247, -0.1361984, 2.932112, 1, 0, 0.3254902, 1,
1.545775, 1.430887, 0.8740703, 1, 0, 0.3176471, 1,
1.546077, -1.324534, 1.999195, 1, 0, 0.3137255, 1,
1.55022, -0.2397411, 1.620585, 1, 0, 0.3058824, 1,
1.550346, 1.694107, -0.573168, 1, 0, 0.2980392, 1,
1.563286, 0.6457708, 1.892565, 1, 0, 0.2941177, 1,
1.567568, -0.1173798, 0.1610071, 1, 0, 0.2862745, 1,
1.569695, -0.2231569, 0.5802148, 1, 0, 0.282353, 1,
1.5901, -1.1105, 0.5192538, 1, 0, 0.2745098, 1,
1.596126, 1.051261, -0.1824948, 1, 0, 0.2705882, 1,
1.606599, 1.939397, 1.326615, 1, 0, 0.2627451, 1,
1.606838, 1.745189, 0.7146979, 1, 0, 0.2588235, 1,
1.607074, -1.226633, 2.160413, 1, 0, 0.2509804, 1,
1.621765, 0.4702572, 0.5708919, 1, 0, 0.2470588, 1,
1.625539, -0.1246683, 0.8776715, 1, 0, 0.2392157, 1,
1.650367, -1.38965, 2.148741, 1, 0, 0.2352941, 1,
1.65152, 0.9117653, 2.196817, 1, 0, 0.227451, 1,
1.667925, 0.223213, 1.224669, 1, 0, 0.2235294, 1,
1.713183, 0.8293915, -0.9567889, 1, 0, 0.2156863, 1,
1.742418, 1.03475, 1.432492, 1, 0, 0.2117647, 1,
1.766903, 0.6108267, 0.9272381, 1, 0, 0.2039216, 1,
1.77498, -1.296353, 1.878852, 1, 0, 0.1960784, 1,
1.77897, -2.258395, 3.826303, 1, 0, 0.1921569, 1,
1.793422, 0.1405865, 1.461704, 1, 0, 0.1843137, 1,
1.795741, -0.2836904, 0.7938316, 1, 0, 0.1803922, 1,
1.831275, -1.596581, 1.267758, 1, 0, 0.172549, 1,
1.86589, -0.3767623, 2.130217, 1, 0, 0.1686275, 1,
1.872147, -0.6899729, 0.8294091, 1, 0, 0.1607843, 1,
1.895443, -0.4134282, 1.42066, 1, 0, 0.1568628, 1,
1.900971, 1.450374, -0.7462839, 1, 0, 0.1490196, 1,
1.914967, 1.719188, 1.700444, 1, 0, 0.145098, 1,
1.927676, 0.4549476, -1.371195, 1, 0, 0.1372549, 1,
1.92953, -0.6554493, 1.498317, 1, 0, 0.1333333, 1,
1.98154, -1.673906, 1.061082, 1, 0, 0.1254902, 1,
1.983084, 0.6916826, -0.3782305, 1, 0, 0.1215686, 1,
2.041093, -0.7407022, 2.831405, 1, 0, 0.1137255, 1,
2.091231, -0.5421702, 4.604251, 1, 0, 0.1098039, 1,
2.091277, -0.6375133, 1.346053, 1, 0, 0.1019608, 1,
2.13249, 0.2115963, 2.001499, 1, 0, 0.09411765, 1,
2.138569, 1.515686, 3.125626, 1, 0, 0.09019608, 1,
2.140136, 0.2076868, 1.569612, 1, 0, 0.08235294, 1,
2.16802, 0.5143155, 1.556742, 1, 0, 0.07843138, 1,
2.198321, -0.01562962, 2.289227, 1, 0, 0.07058824, 1,
2.203945, 0.01063472, 3.337684, 1, 0, 0.06666667, 1,
2.273268, -0.6052905, 3.068939, 1, 0, 0.05882353, 1,
2.334552, -0.008246964, 0.07884239, 1, 0, 0.05490196, 1,
2.362294, 0.6597482, 0.0296796, 1, 0, 0.04705882, 1,
2.39042, -0.09575164, 3.213589, 1, 0, 0.04313726, 1,
2.491139, -0.08757121, 0.04582283, 1, 0, 0.03529412, 1,
2.537803, -0.8415003, 1.260964, 1, 0, 0.03137255, 1,
2.577428, 1.200265, 1.538304, 1, 0, 0.02352941, 1,
2.698739, 1.606942, 1.51784, 1, 0, 0.01960784, 1,
3.005043, 0.8222522, 2.131032, 1, 0, 0.01176471, 1,
3.006151, 0.808089, 1.371193, 1, 0, 0.007843138, 1
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
-0.3930128, -4.177812, -7.541551, 0, -0.5, 0.5, 0.5,
-0.3930128, -4.177812, -7.541551, 1, -0.5, 0.5, 0.5,
-0.3930128, -4.177812, -7.541551, 1, 1.5, 0.5, 0.5,
-0.3930128, -4.177812, -7.541551, 0, 1.5, 0.5, 0.5
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
-4.944493, 0.1747811, -7.541551, 0, -0.5, 0.5, 0.5,
-4.944493, 0.1747811, -7.541551, 1, -0.5, 0.5, 0.5,
-4.944493, 0.1747811, -7.541551, 1, 1.5, 0.5, 0.5,
-4.944493, 0.1747811, -7.541551, 0, 1.5, 0.5, 0.5
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
-4.944493, -4.177812, -0.05438924, 0, -0.5, 0.5, 0.5,
-4.944493, -4.177812, -0.05438924, 1, -0.5, 0.5, 0.5,
-4.944493, -4.177812, -0.05438924, 1, 1.5, 0.5, 0.5,
-4.944493, -4.177812, -0.05438924, 0, 1.5, 0.5, 0.5
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
-3, -3.173367, -5.813744,
3, -3.173367, -5.813744,
-3, -3.173367, -5.813744,
-3, -3.340775, -6.101712,
-2, -3.173367, -5.813744,
-2, -3.340775, -6.101712,
-1, -3.173367, -5.813744,
-1, -3.340775, -6.101712,
0, -3.173367, -5.813744,
0, -3.340775, -6.101712,
1, -3.173367, -5.813744,
1, -3.340775, -6.101712,
2, -3.173367, -5.813744,
2, -3.340775, -6.101712,
3, -3.173367, -5.813744,
3, -3.340775, -6.101712
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
-3, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
-3, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
-3, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
-3, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
-2, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
-2, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
-2, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
-2, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
-1, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
-1, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
-1, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
-1, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
0, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
0, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
0, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
0, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
1, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
1, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
1, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
1, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
2, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
2, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
2, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
2, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5,
3, -3.67559, -6.677648, 0, -0.5, 0.5, 0.5,
3, -3.67559, -6.677648, 1, -0.5, 0.5, 0.5,
3, -3.67559, -6.677648, 1, 1.5, 0.5, 0.5,
3, -3.67559, -6.677648, 0, 1.5, 0.5, 0.5
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
-3.894152, -3, -5.813744,
-3.894152, 3, -5.813744,
-3.894152, -3, -5.813744,
-4.069209, -3, -6.101712,
-3.894152, -2, -5.813744,
-4.069209, -2, -6.101712,
-3.894152, -1, -5.813744,
-4.069209, -1, -6.101712,
-3.894152, 0, -5.813744,
-4.069209, 0, -6.101712,
-3.894152, 1, -5.813744,
-4.069209, 1, -6.101712,
-3.894152, 2, -5.813744,
-4.069209, 2, -6.101712,
-3.894152, 3, -5.813744,
-4.069209, 3, -6.101712
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
-4.419322, -3, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, -3, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, -3, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, -3, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, -2, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, -2, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, -2, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, -2, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, -1, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, -1, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, -1, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, -1, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, 0, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, 0, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, 0, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, 0, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, 1, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, 1, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, 1, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, 1, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, 2, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, 2, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, 2, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, 2, -6.677648, 0, 1.5, 0.5, 0.5,
-4.419322, 3, -6.677648, 0, -0.5, 0.5, 0.5,
-4.419322, 3, -6.677648, 1, -0.5, 0.5, 0.5,
-4.419322, 3, -6.677648, 1, 1.5, 0.5, 0.5,
-4.419322, 3, -6.677648, 0, 1.5, 0.5, 0.5
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
-3.894152, -3.173367, -4,
-3.894152, -3.173367, 4,
-3.894152, -3.173367, -4,
-4.069209, -3.340775, -4,
-3.894152, -3.173367, -2,
-4.069209, -3.340775, -2,
-3.894152, -3.173367, 0,
-4.069209, -3.340775, 0,
-3.894152, -3.173367, 2,
-4.069209, -3.340775, 2,
-3.894152, -3.173367, 4,
-4.069209, -3.340775, 4
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
-4.419322, -3.67559, -4, 0, -0.5, 0.5, 0.5,
-4.419322, -3.67559, -4, 1, -0.5, 0.5, 0.5,
-4.419322, -3.67559, -4, 1, 1.5, 0.5, 0.5,
-4.419322, -3.67559, -4, 0, 1.5, 0.5, 0.5,
-4.419322, -3.67559, -2, 0, -0.5, 0.5, 0.5,
-4.419322, -3.67559, -2, 1, -0.5, 0.5, 0.5,
-4.419322, -3.67559, -2, 1, 1.5, 0.5, 0.5,
-4.419322, -3.67559, -2, 0, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 0, 0, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 0, 1, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 0, 1, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 0, 0, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 2, 0, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 2, 1, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 2, 1, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 2, 0, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 4, 0, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 4, 1, -0.5, 0.5, 0.5,
-4.419322, -3.67559, 4, 1, 1.5, 0.5, 0.5,
-4.419322, -3.67559, 4, 0, 1.5, 0.5, 0.5
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
-3.894152, -3.173367, -5.813744,
-3.894152, 3.522929, -5.813744,
-3.894152, -3.173367, 5.704966,
-3.894152, 3.522929, 5.704966,
-3.894152, -3.173367, -5.813744,
-3.894152, -3.173367, 5.704966,
-3.894152, 3.522929, -5.813744,
-3.894152, 3.522929, 5.704966,
-3.894152, -3.173367, -5.813744,
3.108126, -3.173367, -5.813744,
-3.894152, -3.173367, 5.704966,
3.108126, -3.173367, 5.704966,
-3.894152, 3.522929, -5.813744,
3.108126, 3.522929, -5.813744,
-3.894152, 3.522929, 5.704966,
3.108126, 3.522929, 5.704966,
3.108126, -3.173367, -5.813744,
3.108126, 3.522929, -5.813744,
3.108126, -3.173367, 5.704966,
3.108126, 3.522929, 5.704966,
3.108126, -3.173367, -5.813744,
3.108126, -3.173367, 5.704966,
3.108126, 3.522929, -5.813744,
3.108126, 3.522929, 5.704966
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
var radius = 8.037303;
var distance = 35.75887;
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
mvMatrix.translate( 0.3930128, -0.1747811, 0.05438924 );
mvMatrix.scale( 1.241037, 1.297746, 0.7544325 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75887);
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
isoprothiolane<-read.table("isoprothiolane.xyz")
```

```
## Error in read.table("isoprothiolane.xyz"): no lines available in input
```

```r
x<-isoprothiolane$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
y<-isoprothiolane$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
z<-isoprothiolane$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
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
-3.792177, -0.7485461, -1.608803, 0, 0, 1, 1, 1,
-2.892335, -0.064966, 0.5563542, 1, 0, 0, 1, 1,
-2.863749, -1.707579, -3.52568, 1, 0, 0, 1, 1,
-2.816917, 0.4816814, -1.556219, 1, 0, 0, 1, 1,
-2.728331, -0.8361616, -1.843734, 1, 0, 0, 1, 1,
-2.650204, -1.380908, -3.511614, 1, 0, 0, 1, 1,
-2.611623, 0.04751312, -3.37236, 0, 0, 0, 1, 1,
-2.589897, -0.01050535, -2.968365, 0, 0, 0, 1, 1,
-2.439425, 0.263954, -2.40706, 0, 0, 0, 1, 1,
-2.419934, -0.5886388, -0.9763954, 0, 0, 0, 1, 1,
-2.368525, 0.007413883, -2.529678, 0, 0, 0, 1, 1,
-2.355555, -1.32821, -3.286477, 0, 0, 0, 1, 1,
-2.317832, -0.1116626, -1.398844, 0, 0, 0, 1, 1,
-2.301294, 1.562808, -1.862083, 1, 1, 1, 1, 1,
-2.261563, 0.382011, -1.887291, 1, 1, 1, 1, 1,
-2.258477, 0.836924, -1.485325, 1, 1, 1, 1, 1,
-2.18975, 0.131685, -2.974985, 1, 1, 1, 1, 1,
-2.167261, -0.1285897, -2.746242, 1, 1, 1, 1, 1,
-2.136319, 1.077662, -2.138285, 1, 1, 1, 1, 1,
-2.130699, -1.634244, -2.503428, 1, 1, 1, 1, 1,
-2.106476, -1.531428, -0.7661673, 1, 1, 1, 1, 1,
-2.098636, 0.355001, -1.578263, 1, 1, 1, 1, 1,
-2.087193, 0.4935928, -0.4394302, 1, 1, 1, 1, 1,
-2.075953, -1.046579, -3.002042, 1, 1, 1, 1, 1,
-2.055115, -0.9980149, -3.314246, 1, 1, 1, 1, 1,
-2.044704, -1.289822, -3.655525, 1, 1, 1, 1, 1,
-2.014569, -1.346698, -3.919276, 1, 1, 1, 1, 1,
-1.983537, -1.154372, -3.169077, 1, 1, 1, 1, 1,
-1.974139, -0.2139864, -3.228414, 0, 0, 1, 1, 1,
-1.956331, 0.458927, -0.1493752, 1, 0, 0, 1, 1,
-1.948185, -0.9429818, -2.332386, 1, 0, 0, 1, 1,
-1.938672, -0.152016, -0.2771481, 1, 0, 0, 1, 1,
-1.925514, -1.266324, -2.88349, 1, 0, 0, 1, 1,
-1.914874, -1.035241, -2.33224, 1, 0, 0, 1, 1,
-1.885765, 1.466004, 0.8242294, 0, 0, 0, 1, 1,
-1.883204, 0.9164525, -0.8297932, 0, 0, 0, 1, 1,
-1.872199, -1.943906, -1.685713, 0, 0, 0, 1, 1,
-1.87191, -0.1890378, -1.643332, 0, 0, 0, 1, 1,
-1.864583, 0.2231254, -2.034365, 0, 0, 0, 1, 1,
-1.845552, -1.075069, -2.464252, 0, 0, 0, 1, 1,
-1.820172, -0.5933999, -2.323908, 0, 0, 0, 1, 1,
-1.812613, -1.262573, -1.558694, 1, 1, 1, 1, 1,
-1.791043, 0.2513926, 0.1567412, 1, 1, 1, 1, 1,
-1.768845, 0.5055613, -1.972294, 1, 1, 1, 1, 1,
-1.756691, 0.2834723, -0.6538677, 1, 1, 1, 1, 1,
-1.721676, 0.1765397, -1.024958, 1, 1, 1, 1, 1,
-1.707301, 2.342412, -1.370491, 1, 1, 1, 1, 1,
-1.694737, 0.8424917, 0.2935501, 1, 1, 1, 1, 1,
-1.679657, 1.020027, -0.1166102, 1, 1, 1, 1, 1,
-1.657161, 0.3600566, -1.643551, 1, 1, 1, 1, 1,
-1.638428, 1.251486, -0.02807481, 1, 1, 1, 1, 1,
-1.633496, 2.734587, -0.2828698, 1, 1, 1, 1, 1,
-1.623125, -1.488037, -2.804491, 1, 1, 1, 1, 1,
-1.610501, 0.4027738, -2.833698, 1, 1, 1, 1, 1,
-1.608722, 0.4459126, -0.7874566, 1, 1, 1, 1, 1,
-1.604673, -0.9337365, -1.604352, 1, 1, 1, 1, 1,
-1.555655, 0.7685399, 0.8646504, 0, 0, 1, 1, 1,
-1.553145, -0.7233148, -2.317694, 1, 0, 0, 1, 1,
-1.543949, -0.7280543, -0.1517041, 1, 0, 0, 1, 1,
-1.539193, 0.6501065, -2.564569, 1, 0, 0, 1, 1,
-1.534585, 1.926566, -0.5525392, 1, 0, 0, 1, 1,
-1.525664, 0.2510688, 0.4387363, 1, 0, 0, 1, 1,
-1.521742, 1.591572, -1.362946, 0, 0, 0, 1, 1,
-1.509633, -0.6401049, -0.6726414, 0, 0, 0, 1, 1,
-1.505255, -1.033165, -2.103516, 0, 0, 0, 1, 1,
-1.486068, -1.102786, -3.053732, 0, 0, 0, 1, 1,
-1.484618, -0.8203617, -1.057753, 0, 0, 0, 1, 1,
-1.480035, -0.5518664, -1.829522, 0, 0, 0, 1, 1,
-1.477122, 0.2395497, -1.579387, 0, 0, 0, 1, 1,
-1.472724, 0.5688484, -2.304277, 1, 1, 1, 1, 1,
-1.468768, -0.1562366, -0.4227573, 1, 1, 1, 1, 1,
-1.468333, 0.1933972, -2.409739, 1, 1, 1, 1, 1,
-1.456972, 0.5068638, -0.5375922, 1, 1, 1, 1, 1,
-1.453687, 0.07287437, -0.1712964, 1, 1, 1, 1, 1,
-1.433263, 1.778382, -1.994614, 1, 1, 1, 1, 1,
-1.423818, 1.979481, -2.326395, 1, 1, 1, 1, 1,
-1.415456, -0.131068, -4.644025, 1, 1, 1, 1, 1,
-1.410716, -0.6055642, -0.7207524, 1, 1, 1, 1, 1,
-1.399919, 0.2915508, -0.3626584, 1, 1, 1, 1, 1,
-1.396483, -1.460424, -2.868685, 1, 1, 1, 1, 1,
-1.365365, 0.2388297, -1.60972, 1, 1, 1, 1, 1,
-1.362609, -1.295166, -2.543211, 1, 1, 1, 1, 1,
-1.361188, -1.611697, -3.762717, 1, 1, 1, 1, 1,
-1.358537, 0.9740456, -0.6655717, 1, 1, 1, 1, 1,
-1.349649, -0.8396018, -2.145702, 0, 0, 1, 1, 1,
-1.348805, -1.292877, -3.035402, 1, 0, 0, 1, 1,
-1.347222, -0.5622729, -3.469589, 1, 0, 0, 1, 1,
-1.331088, 0.2863897, -1.475267, 1, 0, 0, 1, 1,
-1.330423, 0.887859, 0.06381255, 1, 0, 0, 1, 1,
-1.324116, 1.737237, -0.9005748, 1, 0, 0, 1, 1,
-1.319145, -0.1923538, -1.743219, 0, 0, 0, 1, 1,
-1.315856, -0.2815949, -1.2288, 0, 0, 0, 1, 1,
-1.314178, 1.001663, -0.5361148, 0, 0, 0, 1, 1,
-1.310688, -0.4193856, -2.383236, 0, 0, 0, 1, 1,
-1.29604, 2.059595, 0.8262706, 0, 0, 0, 1, 1,
-1.29155, -0.7176409, -0.9838839, 0, 0, 0, 1, 1,
-1.282819, 0.4589471, -0.3571038, 0, 0, 0, 1, 1,
-1.270746, 0.6453706, -1.381175, 1, 1, 1, 1, 1,
-1.262731, -0.1886408, -2.660635, 1, 1, 1, 1, 1,
-1.256607, 0.2616888, -0.5653878, 1, 1, 1, 1, 1,
-1.252006, -0.3277276, -0.8312665, 1, 1, 1, 1, 1,
-1.247537, 2.991551, -1.144324, 1, 1, 1, 1, 1,
-1.244148, -0.422015, -1.673109, 1, 1, 1, 1, 1,
-1.24076, -0.107754, -1.76696, 1, 1, 1, 1, 1,
-1.237054, 0.5359026, -2.13186, 1, 1, 1, 1, 1,
-1.234403, 1.362486, -1.897228, 1, 1, 1, 1, 1,
-1.232526, 0.9635341, 0.09190936, 1, 1, 1, 1, 1,
-1.227611, -0.6426305, -1.685267, 1, 1, 1, 1, 1,
-1.217469, -1.097785, -3.78671, 1, 1, 1, 1, 1,
-1.213286, -0.2403378, -2.178985, 1, 1, 1, 1, 1,
-1.209517, -1.159056, -0.5686913, 1, 1, 1, 1, 1,
-1.20918, 1.337865, 0.5373999, 1, 1, 1, 1, 1,
-1.207338, 0.3070328, -0.7065113, 0, 0, 1, 1, 1,
-1.197731, -2.08266, -1.8287, 1, 0, 0, 1, 1,
-1.197353, -0.3182295, -1.157287, 1, 0, 0, 1, 1,
-1.196544, -1.385293, -3.456448, 1, 0, 0, 1, 1,
-1.191099, -2.076897, -1.403628, 1, 0, 0, 1, 1,
-1.188444, 0.469173, -2.321579, 1, 0, 0, 1, 1,
-1.186749, 0.8500186, 2.40482, 0, 0, 0, 1, 1,
-1.185826, 2.42695, -0.305938, 0, 0, 0, 1, 1,
-1.185081, -0.2790181, -0.5516453, 0, 0, 0, 1, 1,
-1.182273, 0.4880284, -0.3282262, 0, 0, 0, 1, 1,
-1.142515, 0.893416, -0.8084263, 0, 0, 0, 1, 1,
-1.138291, -0.6993325, -0.7206677, 0, 0, 0, 1, 1,
-1.137422, -0.280172, -1.198882, 0, 0, 0, 1, 1,
-1.134507, -0.7393604, -1.987544, 1, 1, 1, 1, 1,
-1.133682, 1.211585, -2.116644, 1, 1, 1, 1, 1,
-1.131153, 0.06546351, -0.7552221, 1, 1, 1, 1, 1,
-1.130989, 1.765262, 1.521423e-05, 1, 1, 1, 1, 1,
-1.118986, -0.3033431, -1.923829, 1, 1, 1, 1, 1,
-1.114418, 1.011961, -0.3878126, 1, 1, 1, 1, 1,
-1.112055, -1.038472, -3.094647, 1, 1, 1, 1, 1,
-1.111841, -1.756155, -2.376627, 1, 1, 1, 1, 1,
-1.109685, -0.4355688, -2.989131, 1, 1, 1, 1, 1,
-1.095887, 0.2383983, -1.758308, 1, 1, 1, 1, 1,
-1.078905, 0.1649467, -1.171194, 1, 1, 1, 1, 1,
-1.070083, 0.3866196, -1.027956, 1, 1, 1, 1, 1,
-1.064326, -1.019765, -1.494517, 1, 1, 1, 1, 1,
-1.064278, 1.379429, 0.7044654, 1, 1, 1, 1, 1,
-1.060254, -0.2463533, -0.7413207, 1, 1, 1, 1, 1,
-1.038707, -0.002769014, -0.4583226, 0, 0, 1, 1, 1,
-1.029964, -0.2296415, -1.941409, 1, 0, 0, 1, 1,
-1.020745, -0.3860177, -3.780301, 1, 0, 0, 1, 1,
-1.019932, 0.3510631, -1.22735, 1, 0, 0, 1, 1,
-1.019882, -0.563783, -3.524498, 1, 0, 0, 1, 1,
-1.008868, -0.4797568, -1.791898, 1, 0, 0, 1, 1,
-1.008572, -1.419567, -2.61128, 0, 0, 0, 1, 1,
-1.004772, 1.740465, -0.6186671, 0, 0, 0, 1, 1,
-0.9993695, -0.3837091, 0.01801766, 0, 0, 0, 1, 1,
-0.99914, -0.957266, -3.356659, 0, 0, 0, 1, 1,
-0.9966092, -1.945108, -1.859869, 0, 0, 0, 1, 1,
-0.9851478, -0.09572038, -1.652241, 0, 0, 0, 1, 1,
-0.9850765, -0.8634432, -3.794187, 0, 0, 0, 1, 1,
-0.9795482, 0.2969418, -2.883092, 1, 1, 1, 1, 1,
-0.9767241, 0.8621715, -1.882335, 1, 1, 1, 1, 1,
-0.9751895, -2.12528, -2.421858, 1, 1, 1, 1, 1,
-0.9675271, 0.5523992, 1.286562, 1, 1, 1, 1, 1,
-0.9621251, -0.003040455, -0.7636063, 1, 1, 1, 1, 1,
-0.9596021, -0.8866692, -2.719796, 1, 1, 1, 1, 1,
-0.9559069, 0.5997727, 0.2769416, 1, 1, 1, 1, 1,
-0.9473029, 0.8545396, 0.1616094, 1, 1, 1, 1, 1,
-0.9463988, -0.5302624, -2.151795, 1, 1, 1, 1, 1,
-0.9432463, -0.6923662, -3.304901, 1, 1, 1, 1, 1,
-0.9338474, -0.7129033, -1.922548, 1, 1, 1, 1, 1,
-0.9271426, -1.505987, -2.705517, 1, 1, 1, 1, 1,
-0.9230279, 0.6293321, -0.6038674, 1, 1, 1, 1, 1,
-0.9159876, -0.6118485, -2.609741, 1, 1, 1, 1, 1,
-0.9105008, 0.1051571, -1.619435, 1, 1, 1, 1, 1,
-0.9099491, 0.1400872, -0.01551022, 0, 0, 1, 1, 1,
-0.8957157, -0.585622, -2.931952, 1, 0, 0, 1, 1,
-0.8942958, -0.6238047, -2.790717, 1, 0, 0, 1, 1,
-0.8922874, -1.823824, -4.01256, 1, 0, 0, 1, 1,
-0.8919152, 0.3837101, -1.375613, 1, 0, 0, 1, 1,
-0.8894491, -0.2821921, -1.786336, 1, 0, 0, 1, 1,
-0.888376, -1.420011, -2.459565, 0, 0, 0, 1, 1,
-0.8611537, 0.6891205, 0.4254294, 0, 0, 0, 1, 1,
-0.8588329, 0.8826455, -2.156641, 0, 0, 0, 1, 1,
-0.8560789, 0.3279766, -2.128461, 0, 0, 0, 1, 1,
-0.8509886, -0.01224258, 0.8542227, 0, 0, 0, 1, 1,
-0.8430252, -0.5874851, -1.956613, 0, 0, 0, 1, 1,
-0.8307493, -0.6344016, -2.159157, 0, 0, 0, 1, 1,
-0.8292904, -1.101594, -2.800692, 1, 1, 1, 1, 1,
-0.8274279, -0.5382312, -2.308156, 1, 1, 1, 1, 1,
-0.8266706, -0.6692516, -1.922374, 1, 1, 1, 1, 1,
-0.8198175, -1.639956, -1.746354, 1, 1, 1, 1, 1,
-0.819231, 0.2497556, 0.234469, 1, 1, 1, 1, 1,
-0.8032455, 0.454585, -1.254433, 1, 1, 1, 1, 1,
-0.8010249, 2.178365, 0.04609757, 1, 1, 1, 1, 1,
-0.7972794, 0.2700206, -2.774106, 1, 1, 1, 1, 1,
-0.7905775, -0.2131549, -2.425452, 1, 1, 1, 1, 1,
-0.7892776, -0.1716621, -2.281389, 1, 1, 1, 1, 1,
-0.782436, 2.219176, -0.4731887, 1, 1, 1, 1, 1,
-0.7817051, -0.9882189, -1.810128, 1, 1, 1, 1, 1,
-0.7810951, 0.1841701, -2.491481, 1, 1, 1, 1, 1,
-0.7779867, -1.533711, -3.53363, 1, 1, 1, 1, 1,
-0.7530629, 0.2579463, -0.06430997, 1, 1, 1, 1, 1,
-0.7517325, 0.1041249, -0.6343269, 0, 0, 1, 1, 1,
-0.7465794, 0.2122891, -1.433964, 1, 0, 0, 1, 1,
-0.7448152, 1.302924, -0.6361927, 1, 0, 0, 1, 1,
-0.7441623, 0.6663766, -2.703572, 1, 0, 0, 1, 1,
-0.7408575, 1.496731, -0.03794998, 1, 0, 0, 1, 1,
-0.7361762, -0.8303043, -2.609855, 1, 0, 0, 1, 1,
-0.7335467, -0.6646006, -2.064705, 0, 0, 0, 1, 1,
-0.732967, 2.381761, -0.2333802, 0, 0, 0, 1, 1,
-0.7329399, -1.745966, -4.062942, 0, 0, 0, 1, 1,
-0.7327889, -1.09866, -2.234906, 0, 0, 0, 1, 1,
-0.729064, 0.2314418, -0.5464811, 0, 0, 0, 1, 1,
-0.7277795, -0.1162452, -2.885709, 0, 0, 0, 1, 1,
-0.7263383, 1.125594, 0.7905723, 0, 0, 0, 1, 1,
-0.7217602, -1.514752, -3.576306, 1, 1, 1, 1, 1,
-0.7160056, -0.5880348, -0.9998894, 1, 1, 1, 1, 1,
-0.7102165, 0.614412, -1.110941, 1, 1, 1, 1, 1,
-0.7095638, -1.863945, -3.622915, 1, 1, 1, 1, 1,
-0.7060083, 0.831715, -0.4788228, 1, 1, 1, 1, 1,
-0.7052484, -0.8626009, -3.803375, 1, 1, 1, 1, 1,
-0.7021363, -1.146101, -2.954496, 1, 1, 1, 1, 1,
-0.7010447, 0.6493543, 0.6324752, 1, 1, 1, 1, 1,
-0.6914948, 1.590891, -0.6212181, 1, 1, 1, 1, 1,
-0.6892833, 0.9960912, -1.873413, 1, 1, 1, 1, 1,
-0.6849695, 0.00714467, -0.3397436, 1, 1, 1, 1, 1,
-0.6814763, -1.702189, -1.552853, 1, 1, 1, 1, 1,
-0.6774255, -1.944326, -1.150965, 1, 1, 1, 1, 1,
-0.6742818, 0.4766777, -0.03008609, 1, 1, 1, 1, 1,
-0.6741299, -0.9284211, -2.510667, 1, 1, 1, 1, 1,
-0.6739784, -1.494915, -3.095114, 0, 0, 1, 1, 1,
-0.6726155, 1.396763, -0.2783425, 1, 0, 0, 1, 1,
-0.6720685, -0.4696921, -2.160272, 1, 0, 0, 1, 1,
-0.6693985, -0.569893, -2.542925, 1, 0, 0, 1, 1,
-0.6689462, -0.4252286, -2.077947, 1, 0, 0, 1, 1,
-0.665986, 0.3492875, -0.8554513, 1, 0, 0, 1, 1,
-0.6592678, -0.5729944, -2.584116, 0, 0, 0, 1, 1,
-0.6494497, 0.6557013, -0.5435427, 0, 0, 0, 1, 1,
-0.6446373, 0.1479582, -0.6181431, 0, 0, 0, 1, 1,
-0.6440082, 1.444708, 0.05474491, 0, 0, 0, 1, 1,
-0.6439337, -1.546871, -3.760167, 0, 0, 0, 1, 1,
-0.6406567, 0.01561225, -0.2708913, 0, 0, 0, 1, 1,
-0.6352389, 0.9455902, -0.4916649, 0, 0, 0, 1, 1,
-0.6335888, 0.799707, -0.7834179, 1, 1, 1, 1, 1,
-0.6328216, 0.06015366, -0.6626372, 1, 1, 1, 1, 1,
-0.6246653, 1.376008, -0.7318248, 1, 1, 1, 1, 1,
-0.6239957, -1.361747, -3.762787, 1, 1, 1, 1, 1,
-0.6226578, -0.4848518, -2.204389, 1, 1, 1, 1, 1,
-0.622418, -0.9160368, -2.111248, 1, 1, 1, 1, 1,
-0.6156992, -1.215449, -0.8905661, 1, 1, 1, 1, 1,
-0.6115265, 0.8061304, -0.1670411, 1, 1, 1, 1, 1,
-0.6115025, -0.1830698, -2.943377, 1, 1, 1, 1, 1,
-0.6077447, -0.8146882, -2.385674, 1, 1, 1, 1, 1,
-0.5845127, 0.9045129, -1.109825, 1, 1, 1, 1, 1,
-0.5799098, -1.912041, -2.365518, 1, 1, 1, 1, 1,
-0.5766568, 0.3368374, -1.917915, 1, 1, 1, 1, 1,
-0.5755228, -0.3789252, -3.482881, 1, 1, 1, 1, 1,
-0.5706785, 0.5713674, 1.344193, 1, 1, 1, 1, 1,
-0.5648887, -1.172057, -2.434276, 0, 0, 1, 1, 1,
-0.5617796, 0.7803303, -2.255153, 1, 0, 0, 1, 1,
-0.5541427, -0.7545273, -2.186486, 1, 0, 0, 1, 1,
-0.5526422, 1.744663, 0.5773397, 1, 0, 0, 1, 1,
-0.5518364, 0.3965062, -1.252102, 1, 0, 0, 1, 1,
-0.5517107, -0.3145142, -1.901811, 1, 0, 0, 1, 1,
-0.5513423, -1.167039, -2.600442, 0, 0, 0, 1, 1,
-0.5507311, 0.9103886, 0.6569957, 0, 0, 0, 1, 1,
-0.5405432, -0.5612344, -1.904873, 0, 0, 0, 1, 1,
-0.5405326, -0.3303608, -2.794701, 0, 0, 0, 1, 1,
-0.5369784, 0.6971338, -0.8519709, 0, 0, 0, 1, 1,
-0.527298, -1.970674, -3.621617, 0, 0, 0, 1, 1,
-0.5256232, 0.4204468, -0.2621424, 0, 0, 0, 1, 1,
-0.5247061, -1.373478, -1.118952, 1, 1, 1, 1, 1,
-0.5182438, 0.6904082, -1.496772, 1, 1, 1, 1, 1,
-0.5179738, -1.42189, -3.779154, 1, 1, 1, 1, 1,
-0.5159054, 0.2739956, -0.5224034, 1, 1, 1, 1, 1,
-0.5136997, 0.5241399, -0.08890149, 1, 1, 1, 1, 1,
-0.5110769, -1.57757, -2.783447, 1, 1, 1, 1, 1,
-0.5052747, -0.8469991, -3.103168, 1, 1, 1, 1, 1,
-0.5021379, 1.108433, -0.34616, 1, 1, 1, 1, 1,
-0.5018666, 0.8840484, -2.710176, 1, 1, 1, 1, 1,
-0.4931296, 0.1686193, -0.9428621, 1, 1, 1, 1, 1,
-0.4895401, 0.1129628, -1.771218, 1, 1, 1, 1, 1,
-0.4866436, -1.4676, -1.450829, 1, 1, 1, 1, 1,
-0.4860174, -1.893957, -0.8885899, 1, 1, 1, 1, 1,
-0.4846904, -0.4121252, -1.850957, 1, 1, 1, 1, 1,
-0.4844041, -0.6371759, -3.150091, 1, 1, 1, 1, 1,
-0.4838252, -0.4121077, -1.541894, 0, 0, 1, 1, 1,
-0.4800488, 0.7584505, -0.8952619, 1, 0, 0, 1, 1,
-0.4711507, 0.2690751, -2.983355, 1, 0, 0, 1, 1,
-0.470247, 1.099799, -0.8482007, 1, 0, 0, 1, 1,
-0.470165, 0.1382219, -0.5505989, 1, 0, 0, 1, 1,
-0.4696361, 0.004393274, -0.5587477, 1, 0, 0, 1, 1,
-0.4609832, 0.7228131, -1.930275, 0, 0, 0, 1, 1,
-0.4591845, -0.4759305, -2.036782, 0, 0, 0, 1, 1,
-0.4591001, -0.4362015, -3.45612, 0, 0, 0, 1, 1,
-0.4590139, -1.902117, -2.385047, 0, 0, 0, 1, 1,
-0.4575345, -0.2419626, -2.646096, 0, 0, 0, 1, 1,
-0.4573561, -1.671464, -3.514902, 0, 0, 0, 1, 1,
-0.4515724, 0.3909377, -1.151041, 0, 0, 0, 1, 1,
-0.4501786, -1.032099, -2.01526, 1, 1, 1, 1, 1,
-0.4440877, 1.412923, -1.336468, 1, 1, 1, 1, 1,
-0.4432079, 2.189318, 0.7427319, 1, 1, 1, 1, 1,
-0.4407164, -1.720836, -3.939943, 1, 1, 1, 1, 1,
-0.4358078, -0.1246619, -1.92673, 1, 1, 1, 1, 1,
-0.435246, 0.6403646, 0.7338453, 1, 1, 1, 1, 1,
-0.4310154, 0.2016274, -0.9533381, 1, 1, 1, 1, 1,
-0.4285998, -0.8488446, -1.969092, 1, 1, 1, 1, 1,
-0.4232244, 1.916053, 0.3622642, 1, 1, 1, 1, 1,
-0.4218724, 1.744845, -0.7887301, 1, 1, 1, 1, 1,
-0.421001, -0.6187598, -4.331954, 1, 1, 1, 1, 1,
-0.4206864, 2.215163, -0.7503091, 1, 1, 1, 1, 1,
-0.4188975, -0.2110068, -1.082177, 1, 1, 1, 1, 1,
-0.4148832, 0.9446408, -0.4390254, 1, 1, 1, 1, 1,
-0.4140607, 1.078623, -0.4102049, 1, 1, 1, 1, 1,
-0.4132209, 1.201915, 1.205316, 0, 0, 1, 1, 1,
-0.4129411, 0.2565178, -0.6555682, 1, 0, 0, 1, 1,
-0.412304, -0.02322728, -0.2119025, 1, 0, 0, 1, 1,
-0.4100432, -0.005368402, -2.019199, 1, 0, 0, 1, 1,
-0.4081779, -1.232932, -3.858667, 1, 0, 0, 1, 1,
-0.4044966, 0.443156, 0.5997526, 1, 0, 0, 1, 1,
-0.4039717, -0.7253733, -3.482916, 0, 0, 0, 1, 1,
-0.4031698, -0.2127111, -2.470472, 0, 0, 0, 1, 1,
-0.4013632, 1.505485, -0.2334586, 0, 0, 0, 1, 1,
-0.4012628, -0.2523977, -2.347438, 0, 0, 0, 1, 1,
-0.4011558, -0.9889885, -3.546059, 0, 0, 0, 1, 1,
-0.3960231, 0.7154851, -0.8707663, 0, 0, 0, 1, 1,
-0.3942496, 0.2779423, -1.918086, 0, 0, 0, 1, 1,
-0.3897963, 0.2373218, 0.4051101, 1, 1, 1, 1, 1,
-0.387374, -0.7617834, -2.491438, 1, 1, 1, 1, 1,
-0.3831455, 0.2520084, -3.075505, 1, 1, 1, 1, 1,
-0.383058, -0.09597252, -2.294567, 1, 1, 1, 1, 1,
-0.3814506, -1.00204, -3.305535, 1, 1, 1, 1, 1,
-0.3792109, -0.7135564, -3.166389, 1, 1, 1, 1, 1,
-0.378968, -0.3302563, -0.6733477, 1, 1, 1, 1, 1,
-0.3736163, -0.10521, -1.007585, 1, 1, 1, 1, 1,
-0.3717737, 0.4651427, -0.3683044, 1, 1, 1, 1, 1,
-0.3717017, 1.136875, 0.4481441, 1, 1, 1, 1, 1,
-0.362841, -1.357179, -2.432082, 1, 1, 1, 1, 1,
-0.3613251, 0.2912237, -0.7590703, 1, 1, 1, 1, 1,
-0.3597597, -0.6272174, -1.999691, 1, 1, 1, 1, 1,
-0.3550149, -0.1102643, -1.578231, 1, 1, 1, 1, 1,
-0.354611, -0.04404027, -1.000054, 1, 1, 1, 1, 1,
-0.3534807, -0.3504599, -3.274313, 0, 0, 1, 1, 1,
-0.3528066, 0.0719093, -0.5139347, 1, 0, 0, 1, 1,
-0.3517358, 0.5736933, -0.8884844, 1, 0, 0, 1, 1,
-0.3491922, -1.550365, -2.159876, 1, 0, 0, 1, 1,
-0.3474124, -0.2640086, -2.871298, 1, 0, 0, 1, 1,
-0.342228, 0.2196136, -2.351579, 1, 0, 0, 1, 1,
-0.341211, -0.1546094, -0.7883462, 0, 0, 0, 1, 1,
-0.3373917, -1.395486, -3.95883, 0, 0, 0, 1, 1,
-0.3322973, -0.6469334, -3.903591, 0, 0, 0, 1, 1,
-0.3305898, -1.416979, -3.958196, 0, 0, 0, 1, 1,
-0.3299778, 0.4986817, -1.217155, 0, 0, 0, 1, 1,
-0.329925, -0.7462002, -5.491531, 0, 0, 0, 1, 1,
-0.325969, -0.9882499, -4.116998, 0, 0, 0, 1, 1,
-0.3248727, 1.760097, 2.014448, 1, 1, 1, 1, 1,
-0.3237583, 1.286957, -1.115852, 1, 1, 1, 1, 1,
-0.3237359, -0.1665057, -0.9436496, 1, 1, 1, 1, 1,
-0.3218956, 1.240976, 0.5500433, 1, 1, 1, 1, 1,
-0.3215504, -0.7993711, -2.710118, 1, 1, 1, 1, 1,
-0.3198628, -0.3228843, -4.463731, 1, 1, 1, 1, 1,
-0.314963, 0.6251308, 0.2991302, 1, 1, 1, 1, 1,
-0.3149506, -1.103102, -1.668701, 1, 1, 1, 1, 1,
-0.3118896, 0.2575959, -2.335626, 1, 1, 1, 1, 1,
-0.310495, -0.8193974, -1.869971, 1, 1, 1, 1, 1,
-0.3069239, 1.050767, 0.3434246, 1, 1, 1, 1, 1,
-0.3052095, 0.8437515, 0.3067295, 1, 1, 1, 1, 1,
-0.3041224, 1.14344, -2.904425, 1, 1, 1, 1, 1,
-0.2994718, -1.84534, -2.784702, 1, 1, 1, 1, 1,
-0.2992769, -0.8992496, -5.344123, 1, 1, 1, 1, 1,
-0.2988773, -0.7924441, -2.649416, 0, 0, 1, 1, 1,
-0.2980417, 0.9524353, -0.2504929, 1, 0, 0, 1, 1,
-0.2966718, 1.214103, -0.9328856, 1, 0, 0, 1, 1,
-0.2964334, -1.212641, -2.904005, 1, 0, 0, 1, 1,
-0.2908461, -0.441324, -2.745285, 1, 0, 0, 1, 1,
-0.2869717, -0.3973822, -2.4994, 1, 0, 0, 1, 1,
-0.2813716, -0.9912483, -3.661477, 0, 0, 0, 1, 1,
-0.2811547, -0.6118717, -2.492029, 0, 0, 0, 1, 1,
-0.2788818, 1.519173, -0.5891125, 0, 0, 0, 1, 1,
-0.2742675, 1.043176, 1.275746, 0, 0, 0, 1, 1,
-0.2738262, -0.08931068, -2.795279, 0, 0, 0, 1, 1,
-0.2725953, -0.0006567213, -2.020063, 0, 0, 0, 1, 1,
-0.2714615, 0.442326, 0.7479626, 0, 0, 0, 1, 1,
-0.2693981, -0.3753853, -2.664253, 1, 1, 1, 1, 1,
-0.2693813, 0.2667726, -1.092674, 1, 1, 1, 1, 1,
-0.2650608, 2.438424, -0.109938, 1, 1, 1, 1, 1,
-0.2582037, -1.336723, -3.67239, 1, 1, 1, 1, 1,
-0.2580473, 0.7499801, -0.3580864, 1, 1, 1, 1, 1,
-0.2554511, 0.6162843, -1.232681, 1, 1, 1, 1, 1,
-0.2534169, 0.1424643, -1.895955, 1, 1, 1, 1, 1,
-0.249856, 0.09493177, 0.1878177, 1, 1, 1, 1, 1,
-0.2469512, -0.951206, -3.933432, 1, 1, 1, 1, 1,
-0.2466772, -1.631192, -3.219254, 1, 1, 1, 1, 1,
-0.2458285, 1.123735, 1.529591, 1, 1, 1, 1, 1,
-0.2449186, -0.5286106, -3.388546, 1, 1, 1, 1, 1,
-0.2438021, 0.8424932, 0.4624992, 1, 1, 1, 1, 1,
-0.2397909, -1.641322, -1.540569, 1, 1, 1, 1, 1,
-0.2391375, 0.4777486, -1.344766, 1, 1, 1, 1, 1,
-0.2379405, 0.3514798, 0.190566, 0, 0, 1, 1, 1,
-0.2316714, -0.7249902, -3.419572, 1, 0, 0, 1, 1,
-0.2313691, 0.8828585, -1.870059, 1, 0, 0, 1, 1,
-0.2311221, 0.2777222, -0.6525049, 1, 0, 0, 1, 1,
-0.2291988, -0.2827437, -2.370301, 1, 0, 0, 1, 1,
-0.2281303, 0.6851593, -0.5778994, 1, 0, 0, 1, 1,
-0.2266435, 1.084275, -0.4917232, 0, 0, 0, 1, 1,
-0.2205359, 0.6268494, -0.1287472, 0, 0, 0, 1, 1,
-0.2196819, 0.7059243, 1.279545, 0, 0, 0, 1, 1,
-0.2182508, -0.3687873, -0.9219934, 0, 0, 0, 1, 1,
-0.2176322, -1.342751, -3.661059, 0, 0, 0, 1, 1,
-0.2135409, -1.287089, -3.394383, 0, 0, 0, 1, 1,
-0.203651, -1.695768, -3.958016, 0, 0, 0, 1, 1,
-0.2036402, -1.003961, -3.293202, 1, 1, 1, 1, 1,
-0.2017396, 2.174865, -0.4642243, 1, 1, 1, 1, 1,
-0.1973296, 0.9035493, 0.7475151, 1, 1, 1, 1, 1,
-0.1958071, 0.4982887, -0.3421713, 1, 1, 1, 1, 1,
-0.1853333, -0.4689186, -2.712162, 1, 1, 1, 1, 1,
-0.184013, 0.5458858, -0.03708788, 1, 1, 1, 1, 1,
-0.178773, -0.1522563, -2.177776, 1, 1, 1, 1, 1,
-0.1774715, -0.8298671, -1.797305, 1, 1, 1, 1, 1,
-0.1759914, 0.5948043, -0.6664465, 1, 1, 1, 1, 1,
-0.1724673, -1.10232, -3.404826, 1, 1, 1, 1, 1,
-0.1706163, -0.121623, -1.686359, 1, 1, 1, 1, 1,
-0.1698267, -0.5965505, -4.02969, 1, 1, 1, 1, 1,
-0.1693602, -0.1427846, -1.630629, 1, 1, 1, 1, 1,
-0.1663241, -1.090245, -2.904524, 1, 1, 1, 1, 1,
-0.1652381, 1.034692, 0.1542961, 1, 1, 1, 1, 1,
-0.1615257, 1.066242, -0.7667713, 0, 0, 1, 1, 1,
-0.161346, -0.4018956, -3.851013, 1, 0, 0, 1, 1,
-0.1474406, 1.76513, -0.3473243, 1, 0, 0, 1, 1,
-0.1469316, -0.5900837, -2.331374, 1, 0, 0, 1, 1,
-0.1458027, 0.9507418, 1.763744, 1, 0, 0, 1, 1,
-0.1446284, -2.613904, -4.240169, 1, 0, 0, 1, 1,
-0.1432903, 0.2566444, -1.030479, 0, 0, 0, 1, 1,
-0.1420768, 0.7809682, 1.546599, 0, 0, 0, 1, 1,
-0.1419026, -2.120606, -2.849565, 0, 0, 0, 1, 1,
-0.1410588, 2.509923, 0.6686619, 0, 0, 0, 1, 1,
-0.1400197, 0.9497609, -0.1682764, 0, 0, 0, 1, 1,
-0.1373298, -1.381461, -3.066357, 0, 0, 0, 1, 1,
-0.1348933, 0.9900185, -1.292397, 0, 0, 0, 1, 1,
-0.1340871, 0.3280612, -0.9105139, 1, 1, 1, 1, 1,
-0.127094, 0.2749697, -0.1045121, 1, 1, 1, 1, 1,
-0.1269874, -1.381392, -2.297214, 1, 1, 1, 1, 1,
-0.1250661, 1.127005, -0.9350474, 1, 1, 1, 1, 1,
-0.1242017, -0.06529505, -0.4706115, 1, 1, 1, 1, 1,
-0.1233373, -1.490798, -3.891333, 1, 1, 1, 1, 1,
-0.1223513, 0.7329899, -0.4863729, 1, 1, 1, 1, 1,
-0.12086, 0.4296357, -0.3757597, 1, 1, 1, 1, 1,
-0.1199484, -1.349929, -2.224649, 1, 1, 1, 1, 1,
-0.1191333, 0.3280742, -0.6391492, 1, 1, 1, 1, 1,
-0.1140539, -1.657286, -5.645996, 1, 1, 1, 1, 1,
-0.1110415, 0.3892698, -0.1414747, 1, 1, 1, 1, 1,
-0.1059043, 0.4846727, -0.6129878, 1, 1, 1, 1, 1,
-0.1033316, -1.255458, -4.369262, 1, 1, 1, 1, 1,
-0.1019867, 0.2088902, -1.564873, 1, 1, 1, 1, 1,
-0.09735731, -0.3850739, -2.035606, 0, 0, 1, 1, 1,
-0.09723891, 0.101197, -1.107481, 1, 0, 0, 1, 1,
-0.0929077, -1.083108, -3.296203, 1, 0, 0, 1, 1,
-0.09015668, -0.9929652, -2.742649, 1, 0, 0, 1, 1,
-0.08960777, 1.535243, -0.3456697, 1, 0, 0, 1, 1,
-0.08413367, -1.029951, -1.563651, 1, 0, 0, 1, 1,
-0.0809962, 0.264267, -1.764257, 0, 0, 0, 1, 1,
-0.08092127, -0.3898405, -4.489718, 0, 0, 0, 1, 1,
-0.07970861, -1.056875, -2.285301, 0, 0, 0, 1, 1,
-0.07953063, 0.8364969, -1.31418, 0, 0, 0, 1, 1,
-0.07939909, -1.275901, -3.07397, 0, 0, 0, 1, 1,
-0.0741018, 0.5287882, -0.4446293, 0, 0, 0, 1, 1,
-0.07144207, -0.779587, -0.9507862, 0, 0, 0, 1, 1,
-0.07005813, 2.168538, -0.1119691, 1, 1, 1, 1, 1,
-0.06690551, -0.3546226, -3.802415, 1, 1, 1, 1, 1,
-0.0654435, -0.9788042, -4.165695, 1, 1, 1, 1, 1,
-0.06512517, 0.06117205, -0.9697897, 1, 1, 1, 1, 1,
-0.06352621, 0.8506958, -1.586059, 1, 1, 1, 1, 1,
-0.06237721, 1.202612, -1.102042, 1, 1, 1, 1, 1,
-0.0602314, -1.932262, -2.84082, 1, 1, 1, 1, 1,
-0.05947216, 1.358053, -0.7504622, 1, 1, 1, 1, 1,
-0.05764733, 0.1313345, -0.620138, 1, 1, 1, 1, 1,
-0.05763673, -0.4462043, -4.586524, 1, 1, 1, 1, 1,
-0.0559508, 0.440363, -0.9344725, 1, 1, 1, 1, 1,
-0.04962967, -1.500525, -1.41343, 1, 1, 1, 1, 1,
-0.04912613, 0.2320752, -0.8885459, 1, 1, 1, 1, 1,
-0.03871301, -0.1973301, -1.465244, 1, 1, 1, 1, 1,
-0.03561357, -0.4068039, -1.53824, 1, 1, 1, 1, 1,
-0.03353281, 2.168028, -0.2424171, 0, 0, 1, 1, 1,
-0.0301809, -1.882933, -5.036101, 1, 0, 0, 1, 1,
-0.02695937, 0.7428815, -0.8837537, 1, 0, 0, 1, 1,
-0.0268908, 1.277213, -0.8474894, 1, 0, 0, 1, 1,
-0.02658322, -0.5172827, -3.416051, 1, 0, 0, 1, 1,
-0.02565345, 0.1513709, -0.5982789, 1, 0, 0, 1, 1,
-0.02461308, -0.7532139, -4.010354, 0, 0, 0, 1, 1,
-0.0244216, -1.05856, -2.314463, 0, 0, 0, 1, 1,
-0.02426559, -0.5668656, -1.990848, 0, 0, 0, 1, 1,
-0.02357697, -0.4907359, -2.814389, 0, 0, 0, 1, 1,
-0.02052201, -0.7579144, -2.385693, 0, 0, 0, 1, 1,
-0.01554847, -1.293676, -2.660067, 0, 0, 0, 1, 1,
-0.01310137, 2.272795, -0.7762018, 0, 0, 0, 1, 1,
-0.0123732, 0.1922887, -0.1266894, 1, 1, 1, 1, 1,
-0.00996889, -0.6720223, -3.343954, 1, 1, 1, 1, 1,
-0.00784644, 0.4980547, 0.6966087, 1, 1, 1, 1, 1,
-0.006295545, 2.273895, 0.2218642, 1, 1, 1, 1, 1,
-0.00574643, -0.9724828, -2.647266, 1, 1, 1, 1, 1,
-0.003243237, -0.9014954, -2.421706, 1, 1, 1, 1, 1,
-0.002355052, 0.6049148, -0.6819854, 1, 1, 1, 1, 1,
0.00336877, 1.151756, 0.9409101, 1, 1, 1, 1, 1,
0.005251064, -0.5259934, 4.087098, 1, 1, 1, 1, 1,
0.007387828, 1.236444, -1.694131, 1, 1, 1, 1, 1,
0.007804888, -1.430513, 4.264591, 1, 1, 1, 1, 1,
0.01078912, 1.670255, -0.329155, 1, 1, 1, 1, 1,
0.01535233, 0.460517, 0.9434905, 1, 1, 1, 1, 1,
0.01614091, 0.5936995, 1.539281, 1, 1, 1, 1, 1,
0.0188716, 1.363613, 1.745122, 1, 1, 1, 1, 1,
0.0261798, -0.8309357, 2.355149, 0, 0, 1, 1, 1,
0.02703936, -0.6131904, 5.537218, 1, 0, 0, 1, 1,
0.02963182, 1.80627, -0.2304915, 1, 0, 0, 1, 1,
0.02991966, -0.644774, 2.540477, 1, 0, 0, 1, 1,
0.03066261, -1.275579, 2.337558, 1, 0, 0, 1, 1,
0.03256224, 1.259534, -0.07111466, 1, 0, 0, 1, 1,
0.03260243, -0.4115023, 1.00207, 0, 0, 0, 1, 1,
0.03335077, 0.1770135, 1.35631, 0, 0, 0, 1, 1,
0.0355343, -0.2962986, 4.064385, 0, 0, 0, 1, 1,
0.0357228, -1.764979, 3.674613, 0, 0, 0, 1, 1,
0.03807735, -0.6546278, 2.752479, 0, 0, 0, 1, 1,
0.04004119, 0.3571427, 1.361121, 0, 0, 0, 1, 1,
0.04041921, 1.564108, 2.239157, 0, 0, 0, 1, 1,
0.04092165, 0.8767335, -0.6564787, 1, 1, 1, 1, 1,
0.04371222, -1.634463, 4.903942, 1, 1, 1, 1, 1,
0.04599061, 0.7601041, 0.2024177, 1, 1, 1, 1, 1,
0.05206386, -0.6010844, 3.852906, 1, 1, 1, 1, 1,
0.05268217, 0.1509909, 0.3165658, 1, 1, 1, 1, 1,
0.05493324, 2.372405, 0.05153898, 1, 1, 1, 1, 1,
0.05740048, 0.763185, -1.406568, 1, 1, 1, 1, 1,
0.06056905, -1.811394, 1.571141, 1, 1, 1, 1, 1,
0.06110873, -0.9857492, 2.494531, 1, 1, 1, 1, 1,
0.06164195, -0.4364456, 1.31458, 1, 1, 1, 1, 1,
0.06606452, -0.1139434, 3.22571, 1, 1, 1, 1, 1,
0.07244311, -0.9041005, 3.278993, 1, 1, 1, 1, 1,
0.07564191, 0.9667818, 1.516803, 1, 1, 1, 1, 1,
0.07686967, 0.3036837, -2.123736, 1, 1, 1, 1, 1,
0.07696568, 0.8103572, 3.251145, 1, 1, 1, 1, 1,
0.07843584, -0.5991049, 2.333649, 0, 0, 1, 1, 1,
0.07950939, 0.9019886, 0.3371858, 1, 0, 0, 1, 1,
0.07990266, 0.7859302, -0.982112, 1, 0, 0, 1, 1,
0.08192808, 0.4291795, 0.5130624, 1, 0, 0, 1, 1,
0.08292505, -0.6115037, 2.859056, 1, 0, 0, 1, 1,
0.08594307, -0.473224, 2.959366, 1, 0, 0, 1, 1,
0.08739607, -0.3009638, 2.551786, 0, 0, 0, 1, 1,
0.09076174, 0.4646832, -0.3122852, 0, 0, 0, 1, 1,
0.09248662, -0.6706067, 3.447978, 0, 0, 0, 1, 1,
0.09293918, -1.097109, 2.273021, 0, 0, 0, 1, 1,
0.09685495, 1.304515, -3.020481, 0, 0, 0, 1, 1,
0.09748236, -1.525961, 2.643891, 0, 0, 0, 1, 1,
0.1006233, -0.3028369, 4.248624, 0, 0, 0, 1, 1,
0.1037639, 0.1249947, 1.517707, 1, 1, 1, 1, 1,
0.10647, 0.1811519, -1.651132, 1, 1, 1, 1, 1,
0.1070149, 0.9027169, -0.9494215, 1, 1, 1, 1, 1,
0.1086167, 0.004038541, 0.7266284, 1, 1, 1, 1, 1,
0.1119179, 2.538666, -1.619912, 1, 1, 1, 1, 1,
0.1124129, 0.121743, -0.5276368, 1, 1, 1, 1, 1,
0.1135647, 3.233346, 0.918503, 1, 1, 1, 1, 1,
0.1137328, 0.1444857, -1.490196, 1, 1, 1, 1, 1,
0.1166597, -0.8434994, 4.333957, 1, 1, 1, 1, 1,
0.1170769, -0.4171573, 4.16256, 1, 1, 1, 1, 1,
0.1232813, 2.508956, -0.4067237, 1, 1, 1, 1, 1,
0.1279044, 1.173592, -0.7499192, 1, 1, 1, 1, 1,
0.1290212, -0.7858446, 4.750056, 1, 1, 1, 1, 1,
0.1291543, -0.453673, 1.880458, 1, 1, 1, 1, 1,
0.1302138, 3.425411, 0.8278351, 1, 1, 1, 1, 1,
0.1307707, -0.6764956, 1.873792, 0, 0, 1, 1, 1,
0.1308536, 1.009308, 0.6627146, 1, 0, 0, 1, 1,
0.1339101, -0.8945817, 3.662777, 1, 0, 0, 1, 1,
0.1341179, -1.937878, 2.868075, 1, 0, 0, 1, 1,
0.1401711, -0.6048773, 1.905033, 1, 0, 0, 1, 1,
0.1423821, -0.2907965, 2.589067, 1, 0, 0, 1, 1,
0.1428237, 1.682564, 0.1798624, 0, 0, 0, 1, 1,
0.145131, -0.5619619, 3.929843, 0, 0, 0, 1, 1,
0.1452625, 0.1117567, 0.79158, 0, 0, 0, 1, 1,
0.147233, -0.427772, 2.458177, 0, 0, 0, 1, 1,
0.1494758, 0.5108107, -1.626948, 0, 0, 0, 1, 1,
0.1498468, 0.2622624, -0.7746711, 0, 0, 0, 1, 1,
0.1508686, -1.062897, 1.871506, 0, 0, 0, 1, 1,
0.1557165, -2.137074, 5.219381, 1, 1, 1, 1, 1,
0.1580383, -1.121146, 2.84809, 1, 1, 1, 1, 1,
0.1616674, -0.6541914, 3.26364, 1, 1, 1, 1, 1,
0.1657066, -0.4720727, 1.879778, 1, 1, 1, 1, 1,
0.1808844, 0.1558884, 0.4961859, 1, 1, 1, 1, 1,
0.1886463, -1.076439, 1.730797, 1, 1, 1, 1, 1,
0.1910978, -0.3818576, 3.566573, 1, 1, 1, 1, 1,
0.2079758, 0.6845386, -0.7508112, 1, 1, 1, 1, 1,
0.2127406, 0.1409018, 1.352817, 1, 1, 1, 1, 1,
0.2134028, -0.4197693, 2.53281, 1, 1, 1, 1, 1,
0.2181123, 0.4913739, 0.9539886, 1, 1, 1, 1, 1,
0.2198718, -1.14079, 1.683189, 1, 1, 1, 1, 1,
0.2213894, -0.2477485, 1.637159, 1, 1, 1, 1, 1,
0.2258272, 1.144519, 0.576735, 1, 1, 1, 1, 1,
0.2321066, 0.4549674, 0.9414492, 1, 1, 1, 1, 1,
0.2327006, -0.8978359, 1.66014, 0, 0, 1, 1, 1,
0.2363908, -0.4335117, 2.932827, 1, 0, 0, 1, 1,
0.2367021, 0.1370106, 0.6116083, 1, 0, 0, 1, 1,
0.2370422, -0.5700459, 1.867435, 1, 0, 0, 1, 1,
0.2391565, 0.1884731, 2.471784, 1, 0, 0, 1, 1,
0.2495572, -0.5965102, 1.921109, 1, 0, 0, 1, 1,
0.2505985, -1.983211, 2.983149, 0, 0, 0, 1, 1,
0.2527949, -0.2249981, 2.56763, 0, 0, 0, 1, 1,
0.256718, -0.06370018, -0.3920915, 0, 0, 0, 1, 1,
0.2596931, 0.6322311, 0.661665, 0, 0, 0, 1, 1,
0.262138, -1.288502, 2.526381, 0, 0, 0, 1, 1,
0.2657842, 0.006473996, 0.08994514, 0, 0, 0, 1, 1,
0.2671039, -1.197875, 3.404481, 0, 0, 0, 1, 1,
0.2703165, 0.4252523, 1.27836, 1, 1, 1, 1, 1,
0.2706742, -0.5234855, 3.705649, 1, 1, 1, 1, 1,
0.2707344, 1.257674, -1.150036, 1, 1, 1, 1, 1,
0.2709623, -0.6892004, 4.089766, 1, 1, 1, 1, 1,
0.2714854, -1.551903, 3.318802, 1, 1, 1, 1, 1,
0.2725954, -0.4022096, 0.2860156, 1, 1, 1, 1, 1,
0.2770059, 0.2176732, 1.61674, 1, 1, 1, 1, 1,
0.2844906, 0.04867116, -0.7613767, 1, 1, 1, 1, 1,
0.2865447, 0.2291258, 1.93139, 1, 1, 1, 1, 1,
0.2889566, -1.269332, 2.555116, 1, 1, 1, 1, 1,
0.2899477, 0.3288428, 1.216091, 1, 1, 1, 1, 1,
0.2917426, -0.749615, 2.847618, 1, 1, 1, 1, 1,
0.2922985, -1.249753, 3.369082, 1, 1, 1, 1, 1,
0.2938876, 0.02860842, 0.7397187, 1, 1, 1, 1, 1,
0.295285, 0.3635668, 1.207963, 1, 1, 1, 1, 1,
0.2983629, -0.5251702, 2.193251, 0, 0, 1, 1, 1,
0.2991562, -0.6736183, 1.800787, 1, 0, 0, 1, 1,
0.2994305, -0.5797058, 1.544915, 1, 0, 0, 1, 1,
0.2994309, 0.2189225, 0.6184328, 1, 0, 0, 1, 1,
0.3033422, 1.871423, -0.5306736, 1, 0, 0, 1, 1,
0.3072994, -2.655388, 4.138268, 1, 0, 0, 1, 1,
0.3114521, -1.447068, 3.450264, 0, 0, 0, 1, 1,
0.3134949, -2.716762, 3.273898, 0, 0, 0, 1, 1,
0.3137424, -0.9476718, 2.429703, 0, 0, 0, 1, 1,
0.314267, 0.856777, 0.891389, 0, 0, 0, 1, 1,
0.316177, -0.2675878, 2.774885, 0, 0, 0, 1, 1,
0.324293, 0.5943421, 0.9053783, 0, 0, 0, 1, 1,
0.3273335, 0.4279422, 2.741074, 0, 0, 0, 1, 1,
0.3324451, 0.1193396, 0.7505202, 1, 1, 1, 1, 1,
0.3331196, -1.152415, 2.012206, 1, 1, 1, 1, 1,
0.3332539, -0.2551641, 2.560505, 1, 1, 1, 1, 1,
0.3335686, -1.546497, 3.993874, 1, 1, 1, 1, 1,
0.3375277, 0.4111862, 2.480939, 1, 1, 1, 1, 1,
0.3387728, -0.6847188, 3.991938, 1, 1, 1, 1, 1,
0.3410968, 1.153253, 1.664755, 1, 1, 1, 1, 1,
0.341478, -0.1793857, 1.978562, 1, 1, 1, 1, 1,
0.3429788, 1.648555, -0.3085526, 1, 1, 1, 1, 1,
0.3488487, -0.07615808, 1.530163, 1, 1, 1, 1, 1,
0.3496553, -0.5846013, 4.956077, 1, 1, 1, 1, 1,
0.3504288, -1.224512, 3.411277, 1, 1, 1, 1, 1,
0.3537171, -2.44761, 2.8891, 1, 1, 1, 1, 1,
0.3550815, 0.4106431, -0.3954319, 1, 1, 1, 1, 1,
0.3556566, 0.02085006, -0.2648118, 1, 1, 1, 1, 1,
0.3585642, 0.5829995, 0.7483364, 0, 0, 1, 1, 1,
0.3603025, -1.398072, 3.127425, 1, 0, 0, 1, 1,
0.3625965, -0.2600526, 1.667582, 1, 0, 0, 1, 1,
0.3631004, -0.5812535, 2.618181, 1, 0, 0, 1, 1,
0.3637249, -0.03387959, 1.757441, 1, 0, 0, 1, 1,
0.3683743, 1.107143, -0.3322978, 1, 0, 0, 1, 1,
0.3737058, -0.6748133, 0.369223, 0, 0, 0, 1, 1,
0.3744732, -0.1342187, 2.253784, 0, 0, 0, 1, 1,
0.3785692, -0.02690741, 1.275307, 0, 0, 0, 1, 1,
0.3798188, -2.102421, 3.363755, 0, 0, 0, 1, 1,
0.3923801, -0.7591861, 2.542165, 0, 0, 0, 1, 1,
0.4022783, 0.04358001, 1.421529, 0, 0, 0, 1, 1,
0.4026165, -0.4492261, 1.231767, 0, 0, 0, 1, 1,
0.4030635, -1.11735, 2.724163, 1, 1, 1, 1, 1,
0.407726, 0.5857553, 0.2976142, 1, 1, 1, 1, 1,
0.4126062, 2.053073, 0.6822199, 1, 1, 1, 1, 1,
0.4130385, -0.1733039, 1.71243, 1, 1, 1, 1, 1,
0.4137723, -1.029643, 3.29941, 1, 1, 1, 1, 1,
0.4144943, 0.6103623, 0.08702678, 1, 1, 1, 1, 1,
0.4163184, -1.523535, 2.970226, 1, 1, 1, 1, 1,
0.4186407, 0.2673109, -0.1042792, 1, 1, 1, 1, 1,
0.4253616, -0.3438366, 3.280198, 1, 1, 1, 1, 1,
0.4256732, 1.481332, 0.1526887, 1, 1, 1, 1, 1,
0.4262438, -1.933596, 3.044846, 1, 1, 1, 1, 1,
0.4319297, -2.517516, 2.103933, 1, 1, 1, 1, 1,
0.4332322, -1.097991, 3.144468, 1, 1, 1, 1, 1,
0.4385256, 1.092369, -0.8315187, 1, 1, 1, 1, 1,
0.4463457, -0.7557256, 4.571996, 1, 1, 1, 1, 1,
0.4483161, 0.1406864, 0.7835065, 0, 0, 1, 1, 1,
0.4502839, -1.030491, 4.183912, 1, 0, 0, 1, 1,
0.4603911, 0.8021654, 0.8306226, 1, 0, 0, 1, 1,
0.4614752, 0.2352402, 2.322684, 1, 0, 0, 1, 1,
0.4624163, -0.4880062, 2.62998, 1, 0, 0, 1, 1,
0.4647904, -0.0536791, 2.481959, 1, 0, 0, 1, 1,
0.4661782, -0.7830011, 2.241315, 0, 0, 0, 1, 1,
0.4680948, 2.312056, -0.170826, 0, 0, 0, 1, 1,
0.4697626, -1.138967, 1.752546, 0, 0, 0, 1, 1,
0.4706801, 0.07036963, 2.189043, 0, 0, 0, 1, 1,
0.4743212, 0.7411667, -0.3284555, 0, 0, 0, 1, 1,
0.477446, 0.2953835, 3.12136, 0, 0, 0, 1, 1,
0.4802077, -1.655639, 3.068228, 0, 0, 0, 1, 1,
0.4847252, -0.02046746, 0.6066124, 1, 1, 1, 1, 1,
0.4857107, -1.154865, 1.647916, 1, 1, 1, 1, 1,
0.4917143, -1.445821, 3.068934, 1, 1, 1, 1, 1,
0.4920821, -0.3814667, 2.921887, 1, 1, 1, 1, 1,
0.4944154, 0.6543436, 0.08218446, 1, 1, 1, 1, 1,
0.4951027, -0.5708448, 3.967277, 1, 1, 1, 1, 1,
0.4969619, 0.727185, 0.3966908, 1, 1, 1, 1, 1,
0.4982521, -1.05009, 1.363288, 1, 1, 1, 1, 1,
0.498275, 0.06952471, 2.319863, 1, 1, 1, 1, 1,
0.5030767, 0.4068163, 0.3333396, 1, 1, 1, 1, 1,
0.5035045, -0.3485865, 2.793898, 1, 1, 1, 1, 1,
0.503899, -1.897038, 2.777895, 1, 1, 1, 1, 1,
0.505985, -1.04121, -0.1336426, 1, 1, 1, 1, 1,
0.5078393, -0.1480699, 1.56198, 1, 1, 1, 1, 1,
0.5099856, -1.98632, 3.276277, 1, 1, 1, 1, 1,
0.5102249, 1.360108, -0.9011201, 0, 0, 1, 1, 1,
0.5107051, -0.6394657, 2.980449, 1, 0, 0, 1, 1,
0.5176021, -0.8396547, 2.151496, 1, 0, 0, 1, 1,
0.5189303, 0.2491006, 0.973593, 1, 0, 0, 1, 1,
0.5195791, 0.7519355, -0.2563507, 1, 0, 0, 1, 1,
0.5219398, 1.165543, 0.4518088, 1, 0, 0, 1, 1,
0.5222892, -0.8486897, 3.755617, 0, 0, 0, 1, 1,
0.5284223, 0.8269241, 1.521278, 0, 0, 0, 1, 1,
0.5301379, -0.3938604, 0.241474, 0, 0, 0, 1, 1,
0.5360277, 0.6353568, -0.2702897, 0, 0, 0, 1, 1,
0.5409226, 0.5220427, 1.906009, 0, 0, 0, 1, 1,
0.5481533, 0.4530681, -0.1411966, 0, 0, 0, 1, 1,
0.5508515, 0.1708439, 1.618697, 0, 0, 0, 1, 1,
0.5580092, -1.823965, 3.412633, 1, 1, 1, 1, 1,
0.5605502, -1.227713, 2.987303, 1, 1, 1, 1, 1,
0.5658064, 2.154065, 1.000506, 1, 1, 1, 1, 1,
0.5675595, -0.5519274, 2.632996, 1, 1, 1, 1, 1,
0.586127, 0.6539547, -0.2813945, 1, 1, 1, 1, 1,
0.5880134, 0.7652194, 1.054799, 1, 1, 1, 1, 1,
0.5880865, 2.611164, -1.358798, 1, 1, 1, 1, 1,
0.5885895, 1.586637, 2.247765, 1, 1, 1, 1, 1,
0.5914516, 0.4383235, 1.082626, 1, 1, 1, 1, 1,
0.5924997, 1.135729, 0.8986744, 1, 1, 1, 1, 1,
0.6016458, 0.5657149, 2.36829, 1, 1, 1, 1, 1,
0.6036676, 0.01366321, 1.792762, 1, 1, 1, 1, 1,
0.614203, -0.2462599, -1.463227, 1, 1, 1, 1, 1,
0.6203564, 3.175646, 1.244586, 1, 1, 1, 1, 1,
0.6308548, 2.513995, -1.864878, 1, 1, 1, 1, 1,
0.6359819, 0.1987294, 1.45624, 0, 0, 1, 1, 1,
0.6370839, -0.5822119, 1.829239, 1, 0, 0, 1, 1,
0.6382017, 0.4236591, 1.582365, 1, 0, 0, 1, 1,
0.6418695, 0.4138459, 1.711299, 1, 0, 0, 1, 1,
0.6458626, 0.9184441, 1.050726, 1, 0, 0, 1, 1,
0.6520979, -1.004009, 2.705785, 1, 0, 0, 1, 1,
0.6564085, 1.433468, 1.464709, 0, 0, 0, 1, 1,
0.656755, -0.7268482, 2.840898, 0, 0, 0, 1, 1,
0.6575181, -0.612335, 3.620293, 0, 0, 0, 1, 1,
0.6582393, -0.7259636, 1.136024, 0, 0, 0, 1, 1,
0.6726652, 2.028456, 0.5679045, 0, 0, 0, 1, 1,
0.6728676, 0.3410857, 1.249404, 0, 0, 0, 1, 1,
0.6739818, 0.3962465, 1.922037, 0, 0, 0, 1, 1,
0.677991, 0.4635463, 2.412535, 1, 1, 1, 1, 1,
0.6791152, -0.5905058, 0.4182287, 1, 1, 1, 1, 1,
0.6832784, -2.424627, 4.703501, 1, 1, 1, 1, 1,
0.6883895, 0.501493, 1.460651, 1, 1, 1, 1, 1,
0.6936281, -0.1677491, 2.624972, 1, 1, 1, 1, 1,
0.7007748, 0.9161664, 0.6248534, 1, 1, 1, 1, 1,
0.7060746, -1.217988, 1.816178, 1, 1, 1, 1, 1,
0.7086565, 1.738058, 2.118493, 1, 1, 1, 1, 1,
0.7090764, 2.237949, -1.560478, 1, 1, 1, 1, 1,
0.7160641, 0.5173571, 1.628662, 1, 1, 1, 1, 1,
0.7179349, 0.8881381, 0.678502, 1, 1, 1, 1, 1,
0.7241099, -0.6421403, 1.979267, 1, 1, 1, 1, 1,
0.7277731, -0.552442, 2.52484, 1, 1, 1, 1, 1,
0.7308912, 0.4614099, 0.4801622, 1, 1, 1, 1, 1,
0.7361807, 0.6935042, -0.01325588, 1, 1, 1, 1, 1,
0.7456886, 1.349933, 0.6342952, 0, 0, 1, 1, 1,
0.7459822, -0.456165, 3.051682, 1, 0, 0, 1, 1,
0.7469205, 1.758968, 0.6108, 1, 0, 0, 1, 1,
0.7522812, -0.4952013, 0.7563907, 1, 0, 0, 1, 1,
0.7540036, -0.04997711, 2.701119, 1, 0, 0, 1, 1,
0.7625263, -1.314564, 0.3746423, 1, 0, 0, 1, 1,
0.7673893, 0.4962126, -0.06039586, 0, 0, 0, 1, 1,
0.7683419, 0.8529056, 0.9585806, 0, 0, 0, 1, 1,
0.7702753, -1.664424, 3.701512, 0, 0, 0, 1, 1,
0.7705933, -0.342593, 2.411605, 0, 0, 0, 1, 1,
0.7785318, -0.3303752, 1.594997, 0, 0, 0, 1, 1,
0.7837324, 0.6700419, 1.199071, 0, 0, 0, 1, 1,
0.7849029, -1.284785, 2.248335, 0, 0, 0, 1, 1,
0.791099, -2.454861, 3.0916, 1, 1, 1, 1, 1,
0.7939824, 0.7178216, 0.9575126, 1, 1, 1, 1, 1,
0.7944254, 0.3187186, 1.310733, 1, 1, 1, 1, 1,
0.7962402, 0.1316734, 1.452168, 1, 1, 1, 1, 1,
0.7969047, -0.09143505, 1.522078, 1, 1, 1, 1, 1,
0.7972406, -0.7523076, 1.236229, 1, 1, 1, 1, 1,
0.8019239, 1.192991, 0.5151411, 1, 1, 1, 1, 1,
0.8058991, -0.03975893, 1.361354, 1, 1, 1, 1, 1,
0.8059744, -1.820222, 3.270405, 1, 1, 1, 1, 1,
0.8063883, 0.007575645, 3.233933, 1, 1, 1, 1, 1,
0.8065055, -2.097367, 1.708095, 1, 1, 1, 1, 1,
0.8066245, 1.526147, -0.9960859, 1, 1, 1, 1, 1,
0.8085515, -0.7476342, 1.382212, 1, 1, 1, 1, 1,
0.8113735, 1.421703, 0.7990966, 1, 1, 1, 1, 1,
0.8115835, 0.2706461, 1.43771, 1, 1, 1, 1, 1,
0.8121801, -0.4030079, 2.602228, 0, 0, 1, 1, 1,
0.81734, 0.1199409, 2.10316, 1, 0, 0, 1, 1,
0.8191997, -0.7330891, 1.921023, 1, 0, 0, 1, 1,
0.8217446, 0.5993394, 2.320874, 1, 0, 0, 1, 1,
0.8299401, -0.2571014, 2.562566, 1, 0, 0, 1, 1,
0.8305842, 0.282684, 0.8249952, 1, 0, 0, 1, 1,
0.8308311, -0.3731248, 3.30626, 0, 0, 0, 1, 1,
0.8381717, -0.05178504, 2.145774, 0, 0, 0, 1, 1,
0.8382383, -0.2192018, 2.335232, 0, 0, 0, 1, 1,
0.840557, -0.1498246, 1.532298, 0, 0, 0, 1, 1,
0.8466311, -0.6888365, 0.1520477, 0, 0, 0, 1, 1,
0.8474487, 1.881608, 1.05085, 0, 0, 0, 1, 1,
0.8487452, 1.866451, 1.503082, 0, 0, 0, 1, 1,
0.8515101, 0.8717377, 0.4706176, 1, 1, 1, 1, 1,
0.8529014, 1.580445, 0.8031639, 1, 1, 1, 1, 1,
0.8541887, 0.03775028, 2.194791, 1, 1, 1, 1, 1,
0.8604771, -0.22653, 2.957628, 1, 1, 1, 1, 1,
0.8636389, -1.444921, 3.025605, 1, 1, 1, 1, 1,
0.8642203, 0.3948934, 1.054116, 1, 1, 1, 1, 1,
0.8674785, 0.3396527, 0.6711956, 1, 1, 1, 1, 1,
0.8691949, 0.5908899, -1.006061, 1, 1, 1, 1, 1,
0.8703756, 0.9647195, -0.6104488, 1, 1, 1, 1, 1,
0.8710147, -1.190818, 2.454125, 1, 1, 1, 1, 1,
0.8743628, 0.6595277, 1.044022, 1, 1, 1, 1, 1,
0.8757442, -0.244232, -0.3132457, 1, 1, 1, 1, 1,
0.8775828, 1.533614, 1.509276, 1, 1, 1, 1, 1,
0.8843964, 0.1139824, 0.7865116, 1, 1, 1, 1, 1,
0.8852799, -1.275899, 1.154625, 1, 1, 1, 1, 1,
0.8870924, -2.479077, 3.070556, 0, 0, 1, 1, 1,
0.8876817, -0.4510454, 1.733491, 1, 0, 0, 1, 1,
0.8910822, -0.8321987, 1.871965, 1, 0, 0, 1, 1,
0.8936989, 1.304176, 0.1066007, 1, 0, 0, 1, 1,
0.8971762, 0.6787452, 1.016337, 1, 0, 0, 1, 1,
0.8988251, -3.075848, 3.3226, 1, 0, 0, 1, 1,
0.9017352, -1.274375, 1.895281, 0, 0, 0, 1, 1,
0.9024212, -0.6632034, 4.552874, 0, 0, 0, 1, 1,
0.9029229, -0.8354328, 2.347281, 0, 0, 0, 1, 1,
0.9038064, 1.73631, -0.4848735, 0, 0, 0, 1, 1,
0.905595, -0.8118881, 2.788535, 0, 0, 0, 1, 1,
0.9085964, -0.5760478, 3.821372, 0, 0, 0, 1, 1,
0.9165028, 1.133132, 0.5039829, 0, 0, 0, 1, 1,
0.9196593, -1.00157, 1.852939, 1, 1, 1, 1, 1,
0.9226739, 1.478418, 0.4482462, 1, 1, 1, 1, 1,
0.9231984, 0.4204466, 1.753777, 1, 1, 1, 1, 1,
0.9233673, -0.6498133, 2.493445, 1, 1, 1, 1, 1,
0.9289366, 0.416017, 2.162478, 1, 1, 1, 1, 1,
0.9401722, -0.5645557, 2.275639, 1, 1, 1, 1, 1,
0.9495767, -0.5206251, 0.5979813, 1, 1, 1, 1, 1,
0.950308, 1.253943, -1.330156, 1, 1, 1, 1, 1,
0.9532839, -1.770944, 3.731987, 1, 1, 1, 1, 1,
0.9535932, 0.4940128, 1.603369, 1, 1, 1, 1, 1,
0.9578038, 0.5440345, 0.6750426, 1, 1, 1, 1, 1,
0.960098, -0.7133396, 3.766162, 1, 1, 1, 1, 1,
0.9622866, 0.1123369, 2.623562, 1, 1, 1, 1, 1,
0.9623468, 1.079531, -0.2347958, 1, 1, 1, 1, 1,
0.9625559, -1.454587, 0.7392434, 1, 1, 1, 1, 1,
0.9634719, -1.895028, 1.319125, 0, 0, 1, 1, 1,
0.9687338, -0.003675998, 0.9120828, 1, 0, 0, 1, 1,
0.969348, 1.129427, 1.691381, 1, 0, 0, 1, 1,
0.9743495, 2.215272, 0.5966496, 1, 0, 0, 1, 1,
0.9806453, 1.105203, 2.008464, 1, 0, 0, 1, 1,
0.9853879, -1.400401, 2.255986, 1, 0, 0, 1, 1,
0.9906394, -0.51601, 2.249058, 0, 0, 0, 1, 1,
0.9950461, -0.7660943, 2.435205, 0, 0, 0, 1, 1,
1.000417, 1.500269, 0.4198009, 0, 0, 0, 1, 1,
1.004756, -0.9058971, 3.363187, 0, 0, 0, 1, 1,
1.009593, 1.573413, -0.8120769, 0, 0, 0, 1, 1,
1.0117, -0.3066677, 2.309741, 0, 0, 0, 1, 1,
1.015367, -0.1283553, 1.821077, 0, 0, 0, 1, 1,
1.025449, -0.7770907, 3.198803, 1, 1, 1, 1, 1,
1.033202, 0.6480974, 0.1543938, 1, 1, 1, 1, 1,
1.033738, -0.5601423, 1.886867, 1, 1, 1, 1, 1,
1.034438, 0.1752713, 0.78628, 1, 1, 1, 1, 1,
1.037469, -1.801314, 4.900728, 1, 1, 1, 1, 1,
1.04138, 0.5878421, 2.051378, 1, 1, 1, 1, 1,
1.042418, 0.2826446, 1.187823, 1, 1, 1, 1, 1,
1.04259, 0.08645654, 2.481229, 1, 1, 1, 1, 1,
1.044039, -0.09093118, -0.0001623716, 1, 1, 1, 1, 1,
1.048978, 0.2081319, -0.1025959, 1, 1, 1, 1, 1,
1.050722, -1.822455, -0.1662108, 1, 1, 1, 1, 1,
1.057465, -1.130524, 0.3527603, 1, 1, 1, 1, 1,
1.074017, -0.8433278, 2.885078, 1, 1, 1, 1, 1,
1.074735, -0.3329976, 1.098152, 1, 1, 1, 1, 1,
1.078478, 1.680833, 2.311765, 1, 1, 1, 1, 1,
1.080421, -1.114816, 3.398603, 0, 0, 1, 1, 1,
1.085039, -2.650948, 3.267044, 1, 0, 0, 1, 1,
1.091189, -0.4583844, 0.7096834, 1, 0, 0, 1, 1,
1.092258, -0.64077, 3.189669, 1, 0, 0, 1, 1,
1.09586, 1.762607, 1.822852, 1, 0, 0, 1, 1,
1.099069, -0.7048705, 0.6161249, 1, 0, 0, 1, 1,
1.100541, -2.583462, 2.298355, 0, 0, 0, 1, 1,
1.111524, -1.255911, 0.7679048, 0, 0, 0, 1, 1,
1.113341, -1.426027, 2.635329, 0, 0, 0, 1, 1,
1.120598, 1.216775, 1.575943, 0, 0, 0, 1, 1,
1.127596, 0.2507348, 2.419025, 0, 0, 0, 1, 1,
1.132079, -0.2809184, 2.054661, 0, 0, 0, 1, 1,
1.135143, -0.4659539, 2.330255, 0, 0, 0, 1, 1,
1.139195, 1.313773, 0.958592, 1, 1, 1, 1, 1,
1.144241, 1.039879, 2.903857, 1, 1, 1, 1, 1,
1.160561, 0.9544153, 1.274813, 1, 1, 1, 1, 1,
1.160681, 1.08997, 1.03885, 1, 1, 1, 1, 1,
1.167134, -1.762948, 1.447295, 1, 1, 1, 1, 1,
1.176306, 0.03481679, 1.730126, 1, 1, 1, 1, 1,
1.180515, 1.510445, 0.2815406, 1, 1, 1, 1, 1,
1.182724, -1.62454, 2.681082, 1, 1, 1, 1, 1,
1.189161, -1.364173, 2.584444, 1, 1, 1, 1, 1,
1.196486, 1.6177, 2.402483, 1, 1, 1, 1, 1,
1.19944, 0.4943776, -0.2883087, 1, 1, 1, 1, 1,
1.199573, 0.516412, -0.4029249, 1, 1, 1, 1, 1,
1.208078, -0.8134629, 3.69946, 1, 1, 1, 1, 1,
1.209877, -2.710147, 4.056116, 1, 1, 1, 1, 1,
1.213944, -0.9783652, 2.619475, 1, 1, 1, 1, 1,
1.215861, -0.5388659, 1.657304, 0, 0, 1, 1, 1,
1.220838, -2.259274, 3.090381, 1, 0, 0, 1, 1,
1.221689, 1.585273, 0.860634, 1, 0, 0, 1, 1,
1.222124, 1.278999, -0.1156803, 1, 0, 0, 1, 1,
1.222639, -0.7103953, 1.28662, 1, 0, 0, 1, 1,
1.225473, -0.8192869, 0.888317, 1, 0, 0, 1, 1,
1.22572, 0.8047929, 0.2198761, 0, 0, 0, 1, 1,
1.232664, -1.388852, 2.520749, 0, 0, 0, 1, 1,
1.23365, -0.04721433, 1.124436, 0, 0, 0, 1, 1,
1.240471, -0.09311127, 3.860399, 0, 0, 0, 1, 1,
1.241035, 0.7520599, 2.305689, 0, 0, 0, 1, 1,
1.242303, -1.336555, 2.185191, 0, 0, 0, 1, 1,
1.242405, 0.1505565, -0.2568412, 0, 0, 0, 1, 1,
1.242613, -1.788121, 2.734749, 1, 1, 1, 1, 1,
1.244379, 0.5476547, 0.4667957, 1, 1, 1, 1, 1,
1.251363, -0.2983518, 2.391873, 1, 1, 1, 1, 1,
1.255445, 0.392595, 3.852664, 1, 1, 1, 1, 1,
1.262637, -0.7105131, 1.277735, 1, 1, 1, 1, 1,
1.2658, -0.827089, 2.643462, 1, 1, 1, 1, 1,
1.266967, 0.5105075, 0.6690331, 1, 1, 1, 1, 1,
1.270443, -0.9671521, 3.80246, 1, 1, 1, 1, 1,
1.278113, -0.119256, -0.2045289, 1, 1, 1, 1, 1,
1.284113, 0.7993038, -0.1799346, 1, 1, 1, 1, 1,
1.285764, 0.2265743, 2.267755, 1, 1, 1, 1, 1,
1.310712, -0.6706675, 1.397969, 1, 1, 1, 1, 1,
1.317834, -0.6051694, 1.750715, 1, 1, 1, 1, 1,
1.326658, -0.2936798, 2.371334, 1, 1, 1, 1, 1,
1.344452, -0.449304, 3.877638, 1, 1, 1, 1, 1,
1.371882, -1.186832, 1.6127, 0, 0, 1, 1, 1,
1.396087, -2.823272, 2.373138, 1, 0, 0, 1, 1,
1.398439, -0.921104, 2.922939, 1, 0, 0, 1, 1,
1.417505, 1.344594, 0.08524319, 1, 0, 0, 1, 1,
1.419381, -0.9461366, 1.326753, 1, 0, 0, 1, 1,
1.420473, -0.3809612, 2.132003, 1, 0, 0, 1, 1,
1.427521, 0.8839354, 1.023187, 0, 0, 0, 1, 1,
1.440923, 0.1302544, 0.5994681, 0, 0, 0, 1, 1,
1.443102, 2.069774, 1.4173, 0, 0, 0, 1, 1,
1.44964, 1.740493, 0.158668, 0, 0, 0, 1, 1,
1.464172, -0.6134707, 1.412581, 0, 0, 0, 1, 1,
1.467277, -1.626107, 1.631887, 0, 0, 0, 1, 1,
1.472268, -0.2558292, 1.737619, 0, 0, 0, 1, 1,
1.478433, 0.677691, 0.06856511, 1, 1, 1, 1, 1,
1.488364, -0.5982331, 1.089218, 1, 1, 1, 1, 1,
1.493652, 1.172295, 1.606426, 1, 1, 1, 1, 1,
1.493791, 0.4739291, 0.2603528, 1, 1, 1, 1, 1,
1.504431, 2.240904, 0.382459, 1, 1, 1, 1, 1,
1.528781, -0.9536002, 2.009013, 1, 1, 1, 1, 1,
1.53054, 0.7327192, 1.179446, 1, 1, 1, 1, 1,
1.531418, 1.390097, 0.8744601, 1, 1, 1, 1, 1,
1.532104, -0.9957828, 0.4062656, 1, 1, 1, 1, 1,
1.54247, -0.1361984, 2.932112, 1, 1, 1, 1, 1,
1.545775, 1.430887, 0.8740703, 1, 1, 1, 1, 1,
1.546077, -1.324534, 1.999195, 1, 1, 1, 1, 1,
1.55022, -0.2397411, 1.620585, 1, 1, 1, 1, 1,
1.550346, 1.694107, -0.573168, 1, 1, 1, 1, 1,
1.563286, 0.6457708, 1.892565, 1, 1, 1, 1, 1,
1.567568, -0.1173798, 0.1610071, 0, 0, 1, 1, 1,
1.569695, -0.2231569, 0.5802148, 1, 0, 0, 1, 1,
1.5901, -1.1105, 0.5192538, 1, 0, 0, 1, 1,
1.596126, 1.051261, -0.1824948, 1, 0, 0, 1, 1,
1.606599, 1.939397, 1.326615, 1, 0, 0, 1, 1,
1.606838, 1.745189, 0.7146979, 1, 0, 0, 1, 1,
1.607074, -1.226633, 2.160413, 0, 0, 0, 1, 1,
1.621765, 0.4702572, 0.5708919, 0, 0, 0, 1, 1,
1.625539, -0.1246683, 0.8776715, 0, 0, 0, 1, 1,
1.650367, -1.38965, 2.148741, 0, 0, 0, 1, 1,
1.65152, 0.9117653, 2.196817, 0, 0, 0, 1, 1,
1.667925, 0.223213, 1.224669, 0, 0, 0, 1, 1,
1.713183, 0.8293915, -0.9567889, 0, 0, 0, 1, 1,
1.742418, 1.03475, 1.432492, 1, 1, 1, 1, 1,
1.766903, 0.6108267, 0.9272381, 1, 1, 1, 1, 1,
1.77498, -1.296353, 1.878852, 1, 1, 1, 1, 1,
1.77897, -2.258395, 3.826303, 1, 1, 1, 1, 1,
1.793422, 0.1405865, 1.461704, 1, 1, 1, 1, 1,
1.795741, -0.2836904, 0.7938316, 1, 1, 1, 1, 1,
1.831275, -1.596581, 1.267758, 1, 1, 1, 1, 1,
1.86589, -0.3767623, 2.130217, 1, 1, 1, 1, 1,
1.872147, -0.6899729, 0.8294091, 1, 1, 1, 1, 1,
1.895443, -0.4134282, 1.42066, 1, 1, 1, 1, 1,
1.900971, 1.450374, -0.7462839, 1, 1, 1, 1, 1,
1.914967, 1.719188, 1.700444, 1, 1, 1, 1, 1,
1.927676, 0.4549476, -1.371195, 1, 1, 1, 1, 1,
1.92953, -0.6554493, 1.498317, 1, 1, 1, 1, 1,
1.98154, -1.673906, 1.061082, 1, 1, 1, 1, 1,
1.983084, 0.6916826, -0.3782305, 0, 0, 1, 1, 1,
2.041093, -0.7407022, 2.831405, 1, 0, 0, 1, 1,
2.091231, -0.5421702, 4.604251, 1, 0, 0, 1, 1,
2.091277, -0.6375133, 1.346053, 1, 0, 0, 1, 1,
2.13249, 0.2115963, 2.001499, 1, 0, 0, 1, 1,
2.138569, 1.515686, 3.125626, 1, 0, 0, 1, 1,
2.140136, 0.2076868, 1.569612, 0, 0, 0, 1, 1,
2.16802, 0.5143155, 1.556742, 0, 0, 0, 1, 1,
2.198321, -0.01562962, 2.289227, 0, 0, 0, 1, 1,
2.203945, 0.01063472, 3.337684, 0, 0, 0, 1, 1,
2.273268, -0.6052905, 3.068939, 0, 0, 0, 1, 1,
2.334552, -0.008246964, 0.07884239, 0, 0, 0, 1, 1,
2.362294, 0.6597482, 0.0296796, 0, 0, 0, 1, 1,
2.39042, -0.09575164, 3.213589, 1, 1, 1, 1, 1,
2.491139, -0.08757121, 0.04582283, 1, 1, 1, 1, 1,
2.537803, -0.8415003, 1.260964, 1, 1, 1, 1, 1,
2.577428, 1.200265, 1.538304, 1, 1, 1, 1, 1,
2.698739, 1.606942, 1.51784, 1, 1, 1, 1, 1,
3.005043, 0.8222522, 2.131032, 1, 1, 1, 1, 1,
3.006151, 0.808089, 1.371193, 1, 1, 1, 1, 1
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
var radius = 9.892039;
var distance = 34.74537;
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
mvMatrix.translate( 0.3930128, -0.1747808, 0.05438924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74537);
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
