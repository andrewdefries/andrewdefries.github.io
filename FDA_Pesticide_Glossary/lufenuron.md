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
-2.876397, 1.039689, 1.09963, 1, 0, 0, 1,
-2.720889, 0.2263969, -0.5891573, 1, 0.007843138, 0, 1,
-2.675396, 0.7417846, -0.7036789, 1, 0.01176471, 0, 1,
-2.666735, 2.843659, -0.2951149, 1, 0.01960784, 0, 1,
-2.61446, 1.367943, -2.535475, 1, 0.02352941, 0, 1,
-2.503261, 0.8095291, -1.411033, 1, 0.03137255, 0, 1,
-2.490589, 0.9025384, -2.359825, 1, 0.03529412, 0, 1,
-2.474432, 1.931564, -1.271843, 1, 0.04313726, 0, 1,
-2.390106, -1.423638, -1.929909, 1, 0.04705882, 0, 1,
-2.365843, 1.141737, 0.7459647, 1, 0.05490196, 0, 1,
-2.360022, -0.8651254, -1.059181, 1, 0.05882353, 0, 1,
-2.238923, 0.7346045, -1.2043, 1, 0.06666667, 0, 1,
-2.235217, 0.2513958, -1.941443, 1, 0.07058824, 0, 1,
-2.206923, -1.534482, -2.174939, 1, 0.07843138, 0, 1,
-2.189744, 1.04064, -2.981073, 1, 0.08235294, 0, 1,
-2.186263, 0.189226, 0.4592596, 1, 0.09019608, 0, 1,
-2.13717, 0.5094217, 0.1930992, 1, 0.09411765, 0, 1,
-2.085324, -0.1245497, -0.9683506, 1, 0.1019608, 0, 1,
-2.030612, -0.3232539, -1.096145, 1, 0.1098039, 0, 1,
-1.95092, 0.833206, -0.8959738, 1, 0.1137255, 0, 1,
-1.947193, 0.006166606, -1.538555, 1, 0.1215686, 0, 1,
-1.891072, -0.08985537, -1.991703, 1, 0.1254902, 0, 1,
-1.873658, 0.8780056, -1.459704, 1, 0.1333333, 0, 1,
-1.866192, 0.3592046, -1.366338, 1, 0.1372549, 0, 1,
-1.858539, -1.138846, -2.416554, 1, 0.145098, 0, 1,
-1.846911, 0.8133655, -1.360058, 1, 0.1490196, 0, 1,
-1.8452, 0.0238356, -2.750291, 1, 0.1568628, 0, 1,
-1.83938, 0.7055043, -1.049207, 1, 0.1607843, 0, 1,
-1.785536, -0.009613096, -3.150227, 1, 0.1686275, 0, 1,
-1.7797, 0.1308777, -0.08313785, 1, 0.172549, 0, 1,
-1.776148, -0.6918646, -3.282609, 1, 0.1803922, 0, 1,
-1.775882, -1.096038, -2.599006, 1, 0.1843137, 0, 1,
-1.74578, -1.054963, -2.381747, 1, 0.1921569, 0, 1,
-1.734168, -1.21713, -2.544413, 1, 0.1960784, 0, 1,
-1.709962, -1.253587, -0.8650125, 1, 0.2039216, 0, 1,
-1.703441, 0.4086642, -1.195415, 1, 0.2117647, 0, 1,
-1.672077, -1.432439, -1.70819, 1, 0.2156863, 0, 1,
-1.653874, 0.0213997, -2.703228, 1, 0.2235294, 0, 1,
-1.647393, 1.254248, -1.022282, 1, 0.227451, 0, 1,
-1.638583, 0.6543884, -1.152194, 1, 0.2352941, 0, 1,
-1.633795, 0.3598734, -1.092915, 1, 0.2392157, 0, 1,
-1.624649, 0.4830696, -1.818545, 1, 0.2470588, 0, 1,
-1.608051, 1.854902, -0.8851786, 1, 0.2509804, 0, 1,
-1.604434, 0.5880885, -1.970086, 1, 0.2588235, 0, 1,
-1.597634, -0.5559177, -2.762798, 1, 0.2627451, 0, 1,
-1.590971, 0.3660168, -1.266565, 1, 0.2705882, 0, 1,
-1.585879, -0.6950718, -1.101393, 1, 0.2745098, 0, 1,
-1.58545, -1.131803, -2.031191, 1, 0.282353, 0, 1,
-1.582738, 0.3287495, -2.768305, 1, 0.2862745, 0, 1,
-1.580614, -0.8315027, -2.35669, 1, 0.2941177, 0, 1,
-1.567479, 0.2348794, -1.237427, 1, 0.3019608, 0, 1,
-1.564413, 1.377833, 0.2691765, 1, 0.3058824, 0, 1,
-1.559622, 1.221058, -0.8673927, 1, 0.3137255, 0, 1,
-1.549582, -0.720112, -1.240083, 1, 0.3176471, 0, 1,
-1.542235, -1.35422, -2.718891, 1, 0.3254902, 0, 1,
-1.522078, -0.9502594, -2.241129, 1, 0.3294118, 0, 1,
-1.510595, -2.787333, -3.141142, 1, 0.3372549, 0, 1,
-1.506868, -1.378946, -1.824464, 1, 0.3411765, 0, 1,
-1.500136, 1.471086, -0.9657415, 1, 0.3490196, 0, 1,
-1.484855, 0.6198428, -1.360772, 1, 0.3529412, 0, 1,
-1.47091, -0.9178144, -2.565005, 1, 0.3607843, 0, 1,
-1.461746, 1.075565, -0.1869597, 1, 0.3647059, 0, 1,
-1.45624, -2.311777, -1.385281, 1, 0.372549, 0, 1,
-1.453189, 0.9316037, -1.251607, 1, 0.3764706, 0, 1,
-1.442922, 0.3886914, -2.069095, 1, 0.3843137, 0, 1,
-1.436702, 0.1137324, -2.131217, 1, 0.3882353, 0, 1,
-1.43008, 1.197767, -0.2173754, 1, 0.3960784, 0, 1,
-1.425759, -1.303626, -0.8839731, 1, 0.4039216, 0, 1,
-1.423477, 1.480091, -1.281402, 1, 0.4078431, 0, 1,
-1.419751, -0.1734372, -3.688656, 1, 0.4156863, 0, 1,
-1.417225, -1.729026, -1.96019, 1, 0.4196078, 0, 1,
-1.41681, 1.073274, -0.3341834, 1, 0.427451, 0, 1,
-1.41662, -0.08461606, -3.029606, 1, 0.4313726, 0, 1,
-1.412571, -1.973955, -3.746804, 1, 0.4392157, 0, 1,
-1.400026, -1.156505, -3.1231, 1, 0.4431373, 0, 1,
-1.394704, -0.5911309, -0.9287301, 1, 0.4509804, 0, 1,
-1.389442, -0.8021729, -0.00070357, 1, 0.454902, 0, 1,
-1.367936, -0.2148798, -2.086698, 1, 0.4627451, 0, 1,
-1.360313, 0.1793339, -2.568733, 1, 0.4666667, 0, 1,
-1.358892, 0.3984599, -1.488049, 1, 0.4745098, 0, 1,
-1.356371, 0.9835366, -2.759966, 1, 0.4784314, 0, 1,
-1.351018, -1.922561, -1.988065, 1, 0.4862745, 0, 1,
-1.349058, -0.1920906, -0.9729069, 1, 0.4901961, 0, 1,
-1.343795, 0.3630493, -1.641965, 1, 0.4980392, 0, 1,
-1.34341, 1.327903, -0.6445846, 1, 0.5058824, 0, 1,
-1.34334, 0.2202315, -1.70476, 1, 0.509804, 0, 1,
-1.338737, 0.7820351, -1.976291, 1, 0.5176471, 0, 1,
-1.337195, 1.350367, -1.346218, 1, 0.5215687, 0, 1,
-1.329631, 0.5371778, -1.106772, 1, 0.5294118, 0, 1,
-1.323715, -0.3694499, -1.802261, 1, 0.5333334, 0, 1,
-1.322912, 0.9897684, -1.495784, 1, 0.5411765, 0, 1,
-1.32235, -0.8294014, -1.991436, 1, 0.5450981, 0, 1,
-1.313311, 1.855233, -1.206003, 1, 0.5529412, 0, 1,
-1.307292, 0.5494146, -1.869198, 1, 0.5568628, 0, 1,
-1.300364, -1.018786, -1.189319, 1, 0.5647059, 0, 1,
-1.295742, -1.605908, -2.124126, 1, 0.5686275, 0, 1,
-1.28933, -1.189652, -2.223361, 1, 0.5764706, 0, 1,
-1.275785, -2.285345, -3.267395, 1, 0.5803922, 0, 1,
-1.273132, -0.06123602, -2.089863, 1, 0.5882353, 0, 1,
-1.271364, 0.2122665, -1.789172, 1, 0.5921569, 0, 1,
-1.262321, 1.123708, -0.4100259, 1, 0.6, 0, 1,
-1.261232, 0.5396441, -2.112649, 1, 0.6078432, 0, 1,
-1.258323, -0.256734, -0.8290444, 1, 0.6117647, 0, 1,
-1.256454, -0.4145494, -0.6318182, 1, 0.6196079, 0, 1,
-1.239592, 0.1818952, -1.976802, 1, 0.6235294, 0, 1,
-1.237124, 0.5634609, -2.462828, 1, 0.6313726, 0, 1,
-1.236808, 0.2296916, -1.434052, 1, 0.6352941, 0, 1,
-1.230328, -0.8143507, -2.418632, 1, 0.6431373, 0, 1,
-1.216874, 0.07296671, -2.032608, 1, 0.6470588, 0, 1,
-1.212128, -1.073373, -3.972325, 1, 0.654902, 0, 1,
-1.209487, 0.08190475, -1.077307, 1, 0.6588235, 0, 1,
-1.208837, 1.98568, 1.214126, 1, 0.6666667, 0, 1,
-1.20306, -0.01654568, -0.8011538, 1, 0.6705883, 0, 1,
-1.185165, 2.1683, -0.7213055, 1, 0.6784314, 0, 1,
-1.181742, 0.4900967, -1.318142, 1, 0.682353, 0, 1,
-1.171761, 0.9435856, -0.05333499, 1, 0.6901961, 0, 1,
-1.155093, 0.2202763, -1.887492, 1, 0.6941177, 0, 1,
-1.144547, -0.6046413, -2.445611, 1, 0.7019608, 0, 1,
-1.138861, 0.5920293, -1.154237, 1, 0.7098039, 0, 1,
-1.130273, 2.386363, -1.67316, 1, 0.7137255, 0, 1,
-1.122379, 0.07604004, -1.835065, 1, 0.7215686, 0, 1,
-1.119253, 1.236721, -0.4233353, 1, 0.7254902, 0, 1,
-1.118076, -2.293197, -1.86056, 1, 0.7333333, 0, 1,
-1.111258, 0.6497625, -2.015038, 1, 0.7372549, 0, 1,
-1.091678, 0.8113884, -1.230637, 1, 0.7450981, 0, 1,
-1.086905, 0.5462303, -0.7727315, 1, 0.7490196, 0, 1,
-1.086442, 0.1790232, -0.535699, 1, 0.7568628, 0, 1,
-1.084262, 1.160995, -1.702978, 1, 0.7607843, 0, 1,
-1.083228, -0.3411984, -2.092355, 1, 0.7686275, 0, 1,
-1.074857, 0.2852827, -0.9927816, 1, 0.772549, 0, 1,
-1.07409, 0.7103705, -1.013411, 1, 0.7803922, 0, 1,
-1.062466, 0.8324789, 0.1577917, 1, 0.7843137, 0, 1,
-1.05757, 0.1351717, -2.443981, 1, 0.7921569, 0, 1,
-1.055163, -0.5285652, -0.631399, 1, 0.7960784, 0, 1,
-1.053314, 0.4008547, -0.6297093, 1, 0.8039216, 0, 1,
-1.039771, 0.2343995, -0.7402698, 1, 0.8117647, 0, 1,
-1.029605, -0.160271, -2.039492, 1, 0.8156863, 0, 1,
-1.023714, -0.8959317, -2.927657, 1, 0.8235294, 0, 1,
-1.022696, 0.1178334, 0.6902744, 1, 0.827451, 0, 1,
-1.008006, -1.085649, -2.372622, 1, 0.8352941, 0, 1,
-1.007834, 0.09483457, 0.05519543, 1, 0.8392157, 0, 1,
-1.005011, 0.07611812, 0.09238082, 1, 0.8470588, 0, 1,
-0.9992343, -0.5694999, -0.7187062, 1, 0.8509804, 0, 1,
-0.9889591, 0.9961989, 0.7008263, 1, 0.8588235, 0, 1,
-0.9842512, -0.5583469, -1.944585, 1, 0.8627451, 0, 1,
-0.9766793, 0.744162, -0.959669, 1, 0.8705882, 0, 1,
-0.9754527, 0.3619007, -1.918716, 1, 0.8745098, 0, 1,
-0.9689173, -0.5337743, -2.898821, 1, 0.8823529, 0, 1,
-0.9687228, -0.1292009, -1.587249, 1, 0.8862745, 0, 1,
-0.9554491, -1.232999, -2.261709, 1, 0.8941177, 0, 1,
-0.9495137, -0.488321, -2.552202, 1, 0.8980392, 0, 1,
-0.9481876, -0.5799227, -3.277526, 1, 0.9058824, 0, 1,
-0.9275302, 0.2961037, -1.359561, 1, 0.9137255, 0, 1,
-0.9196188, 0.4316695, 1.792826, 1, 0.9176471, 0, 1,
-0.9180712, 0.663746, -3.715214, 1, 0.9254902, 0, 1,
-0.9046887, 0.3395897, -0.9782313, 1, 0.9294118, 0, 1,
-0.9028795, -0.08617179, -3.043378, 1, 0.9372549, 0, 1,
-0.9022834, 0.5414204, -1.554283, 1, 0.9411765, 0, 1,
-0.900629, 0.3502403, -1.94654, 1, 0.9490196, 0, 1,
-0.89359, 2.195371, -1.541462, 1, 0.9529412, 0, 1,
-0.8923287, 0.4712066, -0.3318949, 1, 0.9607843, 0, 1,
-0.8893426, 0.6996906, -1.570104, 1, 0.9647059, 0, 1,
-0.8873797, 0.3072459, -1.279672, 1, 0.972549, 0, 1,
-0.8793784, -1.661023, -1.379161, 1, 0.9764706, 0, 1,
-0.8786841, 0.09038673, -1.075171, 1, 0.9843137, 0, 1,
-0.8732441, 0.3882326, -1.252496, 1, 0.9882353, 0, 1,
-0.8731548, -1.032334, -2.491741, 1, 0.9960784, 0, 1,
-0.8676242, -0.1358598, -1.797848, 0.9960784, 1, 0, 1,
-0.8667065, 0.1933329, -2.08969, 0.9921569, 1, 0, 1,
-0.8665913, 0.02980452, -1.664382, 0.9843137, 1, 0, 1,
-0.8657834, -1.188588, -2.841575, 0.9803922, 1, 0, 1,
-0.8580769, -0.06008207, -3.207491, 0.972549, 1, 0, 1,
-0.8561842, -0.5370145, -2.328716, 0.9686275, 1, 0, 1,
-0.8509608, -0.9619435, -2.981478, 0.9607843, 1, 0, 1,
-0.8471193, 2.803789, -0.03562988, 0.9568627, 1, 0, 1,
-0.8406615, -0.3711513, -2.020154, 0.9490196, 1, 0, 1,
-0.8365053, 2.264646, -0.5387118, 0.945098, 1, 0, 1,
-0.8327675, -1.035854, -1.298795, 0.9372549, 1, 0, 1,
-0.830061, 1.418168, -1.953482, 0.9333333, 1, 0, 1,
-0.8275715, 1.446417, -1.954165, 0.9254902, 1, 0, 1,
-0.826118, -1.004717, -2.457511, 0.9215686, 1, 0, 1,
-0.825487, -0.4902477, -2.494332, 0.9137255, 1, 0, 1,
-0.8247209, 0.172311, -1.781585, 0.9098039, 1, 0, 1,
-0.8176587, 0.1606941, -0.8187004, 0.9019608, 1, 0, 1,
-0.8137111, 0.137498, -2.330501, 0.8941177, 1, 0, 1,
-0.8113088, 1.849618, -1.176978, 0.8901961, 1, 0, 1,
-0.8090285, -0.2240501, -2.697491, 0.8823529, 1, 0, 1,
-0.8071792, 1.197451, -1.790829, 0.8784314, 1, 0, 1,
-0.8036641, 0.006429942, -2.148367, 0.8705882, 1, 0, 1,
-0.8032765, -0.5479375, -2.902333, 0.8666667, 1, 0, 1,
-0.796699, -0.1765143, -0.7916236, 0.8588235, 1, 0, 1,
-0.7929648, 0.1266233, -2.000905, 0.854902, 1, 0, 1,
-0.7895813, 0.7865785, -1.317105, 0.8470588, 1, 0, 1,
-0.7894089, 0.6453703, -2.163046, 0.8431373, 1, 0, 1,
-0.7883255, -0.3907429, -0.6910897, 0.8352941, 1, 0, 1,
-0.7827132, -1.808783, -2.471384, 0.8313726, 1, 0, 1,
-0.7791083, 0.5973864, -1.90325, 0.8235294, 1, 0, 1,
-0.775897, 0.1420274, -3.002759, 0.8196079, 1, 0, 1,
-0.7593015, -0.2254985, -3.006983, 0.8117647, 1, 0, 1,
-0.7563152, -0.4461754, -2.37837, 0.8078431, 1, 0, 1,
-0.7531928, -0.2602375, -2.001481, 0.8, 1, 0, 1,
-0.7484479, 0.2575283, -0.3159224, 0.7921569, 1, 0, 1,
-0.748181, -0.02477328, -2.457937, 0.7882353, 1, 0, 1,
-0.7460196, -0.1889752, -2.310839, 0.7803922, 1, 0, 1,
-0.7456079, -0.2454705, -1.085779, 0.7764706, 1, 0, 1,
-0.7359038, -0.6002899, -3.487818, 0.7686275, 1, 0, 1,
-0.7286463, 1.649519, -0.6302886, 0.7647059, 1, 0, 1,
-0.7271259, -0.762198, -2.064828, 0.7568628, 1, 0, 1,
-0.7233939, -1.419075, -1.077033, 0.7529412, 1, 0, 1,
-0.7086732, 0.9839537, -1.870384, 0.7450981, 1, 0, 1,
-0.7084626, 0.8937452, -1.571658, 0.7411765, 1, 0, 1,
-0.7059051, -0.6372278, -1.873155, 0.7333333, 1, 0, 1,
-0.7040806, 0.9065944, -0.6249837, 0.7294118, 1, 0, 1,
-0.6985744, 0.9468099, -0.1533329, 0.7215686, 1, 0, 1,
-0.6964569, -1.203025, -2.625387, 0.7176471, 1, 0, 1,
-0.6953336, 0.1294112, -0.3411622, 0.7098039, 1, 0, 1,
-0.6915604, 0.4270274, -2.273233, 0.7058824, 1, 0, 1,
-0.6902187, -1.628202, -4.312896, 0.6980392, 1, 0, 1,
-0.6868553, 0.2967838, -0.7206412, 0.6901961, 1, 0, 1,
-0.6850231, 0.7366688, -2.775874, 0.6862745, 1, 0, 1,
-0.6842942, -0.103384, -1.313671, 0.6784314, 1, 0, 1,
-0.681911, -0.7667774, -2.709458, 0.6745098, 1, 0, 1,
-0.6774244, 0.163417, 0.1197498, 0.6666667, 1, 0, 1,
-0.6677089, -0.7581879, -1.615706, 0.6627451, 1, 0, 1,
-0.667704, 0.2527817, -1.267265, 0.654902, 1, 0, 1,
-0.663074, 0.104206, -1.941067, 0.6509804, 1, 0, 1,
-0.6629019, -0.7102629, -3.849909, 0.6431373, 1, 0, 1,
-0.6537517, -0.7431996, -1.414654, 0.6392157, 1, 0, 1,
-0.6535378, -0.0298697, -3.282556, 0.6313726, 1, 0, 1,
-0.6526176, 0.9343615, -0.9974657, 0.627451, 1, 0, 1,
-0.6521742, -0.5819398, -1.629399, 0.6196079, 1, 0, 1,
-0.6502118, 1.46245, -0.06801834, 0.6156863, 1, 0, 1,
-0.64775, -0.1957934, -1.726081, 0.6078432, 1, 0, 1,
-0.6428492, 0.7236698, -1.220791, 0.6039216, 1, 0, 1,
-0.6420218, -1.850638, -3.793038, 0.5960785, 1, 0, 1,
-0.6410391, 0.03107623, -1.532853, 0.5882353, 1, 0, 1,
-0.6395653, -0.3152592, -2.827291, 0.5843138, 1, 0, 1,
-0.6330253, -1.970024, -2.819969, 0.5764706, 1, 0, 1,
-0.6327351, -0.7753321, -0.6619574, 0.572549, 1, 0, 1,
-0.6316702, 1.205848, -0.7623274, 0.5647059, 1, 0, 1,
-0.6303757, 0.6886395, -0.4729903, 0.5607843, 1, 0, 1,
-0.6299234, -0.5255709, -2.844581, 0.5529412, 1, 0, 1,
-0.628426, 0.2021348, -0.7297853, 0.5490196, 1, 0, 1,
-0.6276345, 0.9983234, 0.2054599, 0.5411765, 1, 0, 1,
-0.6274384, 1.204373, 0.1720572, 0.5372549, 1, 0, 1,
-0.6266623, -0.7199162, -1.276832, 0.5294118, 1, 0, 1,
-0.6252301, 0.201761, -0.2161911, 0.5254902, 1, 0, 1,
-0.6202351, -1.199351, -1.553639, 0.5176471, 1, 0, 1,
-0.6163448, -0.7509621, -2.459465, 0.5137255, 1, 0, 1,
-0.6127273, -0.4391504, -3.556077, 0.5058824, 1, 0, 1,
-0.6109551, -2.062672, -3.007439, 0.5019608, 1, 0, 1,
-0.6083817, -0.2163111, -3.240222, 0.4941176, 1, 0, 1,
-0.6065236, -0.1710215, -0.9244383, 0.4862745, 1, 0, 1,
-0.6063353, -2.710592, -4.50778, 0.4823529, 1, 0, 1,
-0.6040154, 1.065054, -0.8498929, 0.4745098, 1, 0, 1,
-0.6016921, 0.5078312, -0.2459904, 0.4705882, 1, 0, 1,
-0.6014181, -0.8599562, -2.601676, 0.4627451, 1, 0, 1,
-0.5992354, -0.8801606, -1.820924, 0.4588235, 1, 0, 1,
-0.5950127, 0.05608435, -2.269387, 0.4509804, 1, 0, 1,
-0.5912975, 0.7826814, -0.1463214, 0.4470588, 1, 0, 1,
-0.5911928, -0.9067101, -1.897819, 0.4392157, 1, 0, 1,
-0.586998, 0.1341444, 0.1062232, 0.4352941, 1, 0, 1,
-0.5855487, -0.7182333, -1.743836, 0.427451, 1, 0, 1,
-0.5854085, -1.477903, -4.444776, 0.4235294, 1, 0, 1,
-0.5821119, 0.1123106, -0.9205021, 0.4156863, 1, 0, 1,
-0.5798204, -0.2602818, -2.939476, 0.4117647, 1, 0, 1,
-0.5785192, 1.311256, 0.7742543, 0.4039216, 1, 0, 1,
-0.5755549, 0.1685332, -1.153889, 0.3960784, 1, 0, 1,
-0.5681741, -0.6550142, -2.093844, 0.3921569, 1, 0, 1,
-0.5657244, -0.0404317, -1.089197, 0.3843137, 1, 0, 1,
-0.5652614, 1.02382, 0.8800622, 0.3803922, 1, 0, 1,
-0.5643976, 1.619999, 0.4660822, 0.372549, 1, 0, 1,
-0.563777, 0.2363559, -0.3962373, 0.3686275, 1, 0, 1,
-0.5481659, 0.319754, -0.192329, 0.3607843, 1, 0, 1,
-0.5453849, -0.6869625, -1.033788, 0.3568628, 1, 0, 1,
-0.544958, 1.202836, -2.065855, 0.3490196, 1, 0, 1,
-0.5347504, -0.7122781, -2.693694, 0.345098, 1, 0, 1,
-0.5189506, 0.8998214, -0.9726341, 0.3372549, 1, 0, 1,
-0.5172291, 0.4854053, -1.773814, 0.3333333, 1, 0, 1,
-0.5085217, -1.210705, -3.824967, 0.3254902, 1, 0, 1,
-0.5059358, 0.9095824, -0.02543818, 0.3215686, 1, 0, 1,
-0.5021722, 0.3338088, 0.947648, 0.3137255, 1, 0, 1,
-0.5000396, -0.2357741, -2.090756, 0.3098039, 1, 0, 1,
-0.49762, 1.414183, -2.149157, 0.3019608, 1, 0, 1,
-0.4972946, -0.5599878, -1.839372, 0.2941177, 1, 0, 1,
-0.4967564, 0.7811629, -1.760115, 0.2901961, 1, 0, 1,
-0.4937761, 0.8464813, 1.067181, 0.282353, 1, 0, 1,
-0.4851798, -0.03641629, -1.95245, 0.2784314, 1, 0, 1,
-0.4851143, -0.1527775, -1.405104, 0.2705882, 1, 0, 1,
-0.4828979, 1.478391, -0.1698648, 0.2666667, 1, 0, 1,
-0.4786372, 0.9221873, 0.377503, 0.2588235, 1, 0, 1,
-0.4778685, -2.188128, -2.797827, 0.254902, 1, 0, 1,
-0.4772551, -0.3082687, -2.000056, 0.2470588, 1, 0, 1,
-0.4736102, 0.3172083, -0.2737833, 0.2431373, 1, 0, 1,
-0.4719579, -0.9240662, -2.466749, 0.2352941, 1, 0, 1,
-0.4704484, -0.4248226, -4.2594, 0.2313726, 1, 0, 1,
-0.4670953, -0.4198642, -1.575816, 0.2235294, 1, 0, 1,
-0.466529, -1.185293, -2.599212, 0.2196078, 1, 0, 1,
-0.4592428, 0.1780914, -1.980109, 0.2117647, 1, 0, 1,
-0.4590935, 0.674747, 0.3461021, 0.2078431, 1, 0, 1,
-0.4567621, 1.104783, 0.7699565, 0.2, 1, 0, 1,
-0.4538301, 0.9070284, -0.1882417, 0.1921569, 1, 0, 1,
-0.4490831, -0.507772, -0.8593627, 0.1882353, 1, 0, 1,
-0.4482298, -0.5979491, -2.518005, 0.1803922, 1, 0, 1,
-0.4477442, -0.02344571, -1.848992, 0.1764706, 1, 0, 1,
-0.4459269, 1.758691, -1.157905, 0.1686275, 1, 0, 1,
-0.443274, -0.4561501, -2.577716, 0.1647059, 1, 0, 1,
-0.4428048, -0.4801673, -1.24052, 0.1568628, 1, 0, 1,
-0.4390972, -0.1225362, -2.860354, 0.1529412, 1, 0, 1,
-0.4390027, -0.3781785, -0.1859003, 0.145098, 1, 0, 1,
-0.4379483, -1.064704, -2.544605, 0.1411765, 1, 0, 1,
-0.4377044, -0.5686519, -3.784778, 0.1333333, 1, 0, 1,
-0.4372965, 0.5402246, 0.8793575, 0.1294118, 1, 0, 1,
-0.4342921, 0.6928093, -0.2023684, 0.1215686, 1, 0, 1,
-0.4333613, 0.5623701, -1.067916, 0.1176471, 1, 0, 1,
-0.426182, -1.04288, -2.535459, 0.1098039, 1, 0, 1,
-0.4243892, 0.006451919, -1.281015, 0.1058824, 1, 0, 1,
-0.4179731, -0.7047898, -1.016966, 0.09803922, 1, 0, 1,
-0.4148682, 0.1473507, -1.423578, 0.09019608, 1, 0, 1,
-0.4139966, 0.6980687, -1.34852, 0.08627451, 1, 0, 1,
-0.4139913, 1.523319, 0.1154659, 0.07843138, 1, 0, 1,
-0.4097898, 0.2716835, -0.4232343, 0.07450981, 1, 0, 1,
-0.4095167, 0.09510724, -1.211388, 0.06666667, 1, 0, 1,
-0.4056838, 2.146603, 0.3121634, 0.0627451, 1, 0, 1,
-0.4047946, -1.416167, -4.253457, 0.05490196, 1, 0, 1,
-0.4017422, 1.890507, 1.597254, 0.05098039, 1, 0, 1,
-0.400694, -1.057391, -3.92386, 0.04313726, 1, 0, 1,
-0.3985869, 0.9254655, 0.8677711, 0.03921569, 1, 0, 1,
-0.3917897, 0.5535689, -0.007682045, 0.03137255, 1, 0, 1,
-0.3905173, -0.8427387, -1.397238, 0.02745098, 1, 0, 1,
-0.3848008, 0.6565362, -0.6389263, 0.01960784, 1, 0, 1,
-0.3845313, 0.380071, -1.44745, 0.01568628, 1, 0, 1,
-0.3803687, 0.6993383, 0.6997508, 0.007843138, 1, 0, 1,
-0.3802892, -2.823318, -4.542296, 0.003921569, 1, 0, 1,
-0.3769909, 0.5776731, -2.261503, 0, 1, 0.003921569, 1,
-0.3754386, -1.041768, -3.996028, 0, 1, 0.01176471, 1,
-0.3737718, -0.7706468, -2.551556, 0, 1, 0.01568628, 1,
-0.3702622, 1.019043, -1.54696, 0, 1, 0.02352941, 1,
-0.3699215, 0.5521255, -1.03846, 0, 1, 0.02745098, 1,
-0.3693541, 1.087045, 1.149626, 0, 1, 0.03529412, 1,
-0.3691982, 1.1792, -0.5650071, 0, 1, 0.03921569, 1,
-0.3691564, 0.5256695, -0.8204693, 0, 1, 0.04705882, 1,
-0.3660941, -1.514337, -2.536475, 0, 1, 0.05098039, 1,
-0.3654307, 1.367958, 0.321173, 0, 1, 0.05882353, 1,
-0.363483, 0.7043418, -0.6177026, 0, 1, 0.0627451, 1,
-0.3615629, -1.036068, -3.49498, 0, 1, 0.07058824, 1,
-0.3555975, -0.8599929, -3.035168, 0, 1, 0.07450981, 1,
-0.3531691, -0.7230654, -3.890562, 0, 1, 0.08235294, 1,
-0.3489318, 0.7274827, -1.233281, 0, 1, 0.08627451, 1,
-0.3472194, 0.6493648, 0.555127, 0, 1, 0.09411765, 1,
-0.3365007, 1.47817, 0.7047934, 0, 1, 0.1019608, 1,
-0.3326674, 0.6442418, 0.07289707, 0, 1, 0.1058824, 1,
-0.3294209, -0.8478833, -3.177974, 0, 1, 0.1137255, 1,
-0.3255699, -0.5528514, -2.056653, 0, 1, 0.1176471, 1,
-0.3210255, 0.1317958, -1.633813, 0, 1, 0.1254902, 1,
-0.3206462, -1.048422, -3.187736, 0, 1, 0.1294118, 1,
-0.3180905, -0.6602042, -1.290596, 0, 1, 0.1372549, 1,
-0.3145775, -0.4693846, -3.266878, 0, 1, 0.1411765, 1,
-0.3125646, -1.405906, -1.720818, 0, 1, 0.1490196, 1,
-0.311063, 0.477651, -0.1252113, 0, 1, 0.1529412, 1,
-0.3049161, 0.7577038, -0.359747, 0, 1, 0.1607843, 1,
-0.3022474, 0.8941131, 1.326388, 0, 1, 0.1647059, 1,
-0.3021514, 2.57532, 0.7767971, 0, 1, 0.172549, 1,
-0.3013861, 0.629764, -0.3735412, 0, 1, 0.1764706, 1,
-0.2990586, -0.3715702, -1.785545, 0, 1, 0.1843137, 1,
-0.29675, -0.5444975, -1.715786, 0, 1, 0.1882353, 1,
-0.2903119, -0.2762174, -3.518248, 0, 1, 0.1960784, 1,
-0.2896584, 0.1744669, -1.153036, 0, 1, 0.2039216, 1,
-0.2880495, 1.046533, 0.8726975, 0, 1, 0.2078431, 1,
-0.2817751, 1.119696, 0.9106364, 0, 1, 0.2156863, 1,
-0.2772215, 0.7471258, -1.025052, 0, 1, 0.2196078, 1,
-0.2769865, 1.506104, 1.311733, 0, 1, 0.227451, 1,
-0.2755803, -0.7630901, -3.345416, 0, 1, 0.2313726, 1,
-0.2736299, 0.6331902, -1.289145, 0, 1, 0.2392157, 1,
-0.2709113, 1.998851, -1.332389, 0, 1, 0.2431373, 1,
-0.2622366, -0.5926242, -4.341248, 0, 1, 0.2509804, 1,
-0.2541196, 1.456974, 0.9393399, 0, 1, 0.254902, 1,
-0.253127, 0.8922944, -0.7959028, 0, 1, 0.2627451, 1,
-0.2421637, -1.776245, -3.080677, 0, 1, 0.2666667, 1,
-0.2412453, -0.3223193, -2.100393, 0, 1, 0.2745098, 1,
-0.2400258, 1.654698, -0.4458988, 0, 1, 0.2784314, 1,
-0.2379969, -0.7661921, -1.179751, 0, 1, 0.2862745, 1,
-0.2373422, 0.2812135, -7.1915e-05, 0, 1, 0.2901961, 1,
-0.236736, 1.046868, -1.577464, 0, 1, 0.2980392, 1,
-0.2348656, 0.6326956, -0.1378878, 0, 1, 0.3058824, 1,
-0.231507, -0.4691426, -2.905001, 0, 1, 0.3098039, 1,
-0.2236981, 0.3843378, -1.565001, 0, 1, 0.3176471, 1,
-0.2222929, -0.1472595, -3.753649, 0, 1, 0.3215686, 1,
-0.2211343, 1.165532, 0.6874991, 0, 1, 0.3294118, 1,
-0.2173964, 0.5851025, -2.960148, 0, 1, 0.3333333, 1,
-0.2163216, 0.08392397, -1.659993, 0, 1, 0.3411765, 1,
-0.2122995, -0.6481041, -3.896044, 0, 1, 0.345098, 1,
-0.2093431, 2.186686, -1.362312, 0, 1, 0.3529412, 1,
-0.2074425, 0.4172102, -0.8313261, 0, 1, 0.3568628, 1,
-0.2042755, -1.237534, -2.091383, 0, 1, 0.3647059, 1,
-0.2041176, -1.308051, -2.594784, 0, 1, 0.3686275, 1,
-0.2037802, -1.090599, -2.42953, 0, 1, 0.3764706, 1,
-0.2033586, 0.6908122, 0.1098134, 0, 1, 0.3803922, 1,
-0.1987393, -0.2536989, -3.943863, 0, 1, 0.3882353, 1,
-0.1935177, -0.6262743, -0.8909062, 0, 1, 0.3921569, 1,
-0.192424, 1.232126, 1.43716, 0, 1, 0.4, 1,
-0.1919476, -0.4576839, -0.9272848, 0, 1, 0.4078431, 1,
-0.1891547, -1.09188, -2.302663, 0, 1, 0.4117647, 1,
-0.1842447, 0.3010083, 0.02042154, 0, 1, 0.4196078, 1,
-0.1829617, -0.2897162, -1.71946, 0, 1, 0.4235294, 1,
-0.1825185, 0.2417277, 0.1076079, 0, 1, 0.4313726, 1,
-0.1736416, -1.020831, -3.5384, 0, 1, 0.4352941, 1,
-0.171471, 0.3593326, -2.632382, 0, 1, 0.4431373, 1,
-0.1714298, 0.2735033, -0.232181, 0, 1, 0.4470588, 1,
-0.1677494, 0.09027313, -1.231718, 0, 1, 0.454902, 1,
-0.1564636, -0.5892088, -4.906024, 0, 1, 0.4588235, 1,
-0.1545412, -0.06519275, -1.385873, 0, 1, 0.4666667, 1,
-0.1499716, -1.296545, -2.765393, 0, 1, 0.4705882, 1,
-0.1448323, 0.4932012, -1.44453, 0, 1, 0.4784314, 1,
-0.139871, -0.6554602, -3.387381, 0, 1, 0.4823529, 1,
-0.1356602, -0.9347321, -2.425454, 0, 1, 0.4901961, 1,
-0.1331595, 1.628587, 0.6822419, 0, 1, 0.4941176, 1,
-0.130495, -0.4974651, -4.757754, 0, 1, 0.5019608, 1,
-0.1227542, 0.3837433, 0.08705314, 0, 1, 0.509804, 1,
-0.1222962, 0.8895604, -1.053565, 0, 1, 0.5137255, 1,
-0.1216288, -0.3908445, -3.898672, 0, 1, 0.5215687, 1,
-0.1209121, 0.2099355, 1.539423, 0, 1, 0.5254902, 1,
-0.1180495, 0.1417938, -0.4814376, 0, 1, 0.5333334, 1,
-0.1150766, 0.3761513, 0.09850866, 0, 1, 0.5372549, 1,
-0.114949, 0.5391828, -0.6559342, 0, 1, 0.5450981, 1,
-0.1145259, -0.04814839, -1.859761, 0, 1, 0.5490196, 1,
-0.1031765, -0.5204668, -3.918474, 0, 1, 0.5568628, 1,
-0.09595985, 0.3913072, -0.3109035, 0, 1, 0.5607843, 1,
-0.09532244, -0.3760572, -2.871188, 0, 1, 0.5686275, 1,
-0.09432097, -0.9459785, -3.067569, 0, 1, 0.572549, 1,
-0.09394061, -2.213608, -1.344867, 0, 1, 0.5803922, 1,
-0.09310658, -0.4832819, -3.587747, 0, 1, 0.5843138, 1,
-0.0922472, 0.8707514, -1.299858, 0, 1, 0.5921569, 1,
-0.09093119, 0.658004, -0.7593871, 0, 1, 0.5960785, 1,
-0.08567768, -1.081511, -2.149651, 0, 1, 0.6039216, 1,
-0.08231399, -0.02147143, -1.678752, 0, 1, 0.6117647, 1,
-0.07798523, 0.7803648, -1.392128, 0, 1, 0.6156863, 1,
-0.07369053, -0.3199244, -4.108581, 0, 1, 0.6235294, 1,
-0.07266487, -0.8126663, -1.481169, 0, 1, 0.627451, 1,
-0.05973563, -0.4549591, -3.197886, 0, 1, 0.6352941, 1,
-0.05962206, 0.6325669, -0.8292142, 0, 1, 0.6392157, 1,
-0.05602355, -0.8681273, -4.358776, 0, 1, 0.6470588, 1,
-0.04608167, -1.444561, -3.234803, 0, 1, 0.6509804, 1,
-0.04433826, -0.5500372, -2.251969, 0, 1, 0.6588235, 1,
-0.04084128, -0.0198676, -0.9656336, 0, 1, 0.6627451, 1,
-0.03976542, 1.813323, 1.444224, 0, 1, 0.6705883, 1,
-0.03711674, -0.7053711, -3.436016, 0, 1, 0.6745098, 1,
-0.0343223, -2.810713, -4.898657, 0, 1, 0.682353, 1,
-0.03228863, -0.6917033, -1.681198, 0, 1, 0.6862745, 1,
-0.02903826, -0.5824502, -1.963708, 0, 1, 0.6941177, 1,
-0.02813293, 0.3895301, -0.6214722, 0, 1, 0.7019608, 1,
-0.02730337, -0.258706, -3.735051, 0, 1, 0.7058824, 1,
-0.02547513, -2.919126, -1.720373, 0, 1, 0.7137255, 1,
-0.02508174, -0.0756174, -0.1984769, 0, 1, 0.7176471, 1,
-0.02216096, -1.302601, -1.790689, 0, 1, 0.7254902, 1,
-0.01363783, -1.970389, -1.415286, 0, 1, 0.7294118, 1,
-0.01089198, 0.4698397, -0.9611968, 0, 1, 0.7372549, 1,
-0.009813735, 0.8549796, -0.01348522, 0, 1, 0.7411765, 1,
-0.009603912, -0.1667567, -1.952993, 0, 1, 0.7490196, 1,
-0.007356957, -0.6195147, -2.857215, 0, 1, 0.7529412, 1,
-0.007228222, -0.2912549, -3.572934, 0, 1, 0.7607843, 1,
-0.007117372, 1.519352, -0.05824725, 0, 1, 0.7647059, 1,
-0.005555736, 0.4171807, 1.038165, 0, 1, 0.772549, 1,
6.342489e-05, 1.522313, 0.7564849, 0, 1, 0.7764706, 1,
0.002177359, -0.2262258, 4.261074, 0, 1, 0.7843137, 1,
0.005984712, -2.058331, 2.648973, 0, 1, 0.7882353, 1,
0.007023195, 1.571084, -0.3228327, 0, 1, 0.7960784, 1,
0.007804275, 1.432204, 0.5286168, 0, 1, 0.8039216, 1,
0.009697933, 1.04003, -0.6230111, 0, 1, 0.8078431, 1,
0.01225722, 0.3446727, 0.1428003, 0, 1, 0.8156863, 1,
0.01249114, -0.4500958, 3.06393, 0, 1, 0.8196079, 1,
0.0154357, -0.7652854, 3.942329, 0, 1, 0.827451, 1,
0.01729215, 1.619586, -0.2694249, 0, 1, 0.8313726, 1,
0.01808745, 2.431809, -0.950704, 0, 1, 0.8392157, 1,
0.01890167, 0.7988217, -0.242648, 0, 1, 0.8431373, 1,
0.02260215, -0.03196047, 2.940277, 0, 1, 0.8509804, 1,
0.02598184, -1.624133, 3.115221, 0, 1, 0.854902, 1,
0.02747963, 0.7492959, 1.406037, 0, 1, 0.8627451, 1,
0.02802281, 1.268575, 0.7673103, 0, 1, 0.8666667, 1,
0.02896443, 0.5779518, 0.4926222, 0, 1, 0.8745098, 1,
0.03277587, -0.04409271, 3.153644, 0, 1, 0.8784314, 1,
0.0329068, 1.257523, 1.958293, 0, 1, 0.8862745, 1,
0.03430337, 2.144953, 0.3725212, 0, 1, 0.8901961, 1,
0.04099246, -0.2685316, 1.818334, 0, 1, 0.8980392, 1,
0.04153444, 0.470895, 1.15853, 0, 1, 0.9058824, 1,
0.04238442, -0.7513359, 2.283099, 0, 1, 0.9098039, 1,
0.04630079, 2.311751, 0.07508918, 0, 1, 0.9176471, 1,
0.05160928, 0.9236987, -0.8564461, 0, 1, 0.9215686, 1,
0.05569963, 0.928652, 0.2409862, 0, 1, 0.9294118, 1,
0.05613719, -0.5680721, 2.703966, 0, 1, 0.9333333, 1,
0.056691, -1.207262, 2.06622, 0, 1, 0.9411765, 1,
0.05702693, 0.7032006, 0.7440479, 0, 1, 0.945098, 1,
0.05961226, 1.92216, -1.390445, 0, 1, 0.9529412, 1,
0.06258295, -0.3508085, 1.513659, 0, 1, 0.9568627, 1,
0.06264127, 0.5866038, -2.198812, 0, 1, 0.9647059, 1,
0.06545637, -2.542339, 2.213835, 0, 1, 0.9686275, 1,
0.06868222, 1.043284, -0.76006, 0, 1, 0.9764706, 1,
0.07202733, 0.8039885, -1.716716, 0, 1, 0.9803922, 1,
0.07581882, 0.4307971, 0.4385333, 0, 1, 0.9882353, 1,
0.08070172, 1.386584, -0.8172249, 0, 1, 0.9921569, 1,
0.08086684, 2.145355, -1.057961, 0, 1, 1, 1,
0.08307347, 0.6673055, -0.195082, 0, 0.9921569, 1, 1,
0.08910932, -0.7519972, 2.753982, 0, 0.9882353, 1, 1,
0.09160824, -1.48942, 2.199979, 0, 0.9803922, 1, 1,
0.09330769, 0.94738, 0.6628662, 0, 0.9764706, 1, 1,
0.09478638, -1.605402, 2.416972, 0, 0.9686275, 1, 1,
0.1038171, -0.128634, 4.642306, 0, 0.9647059, 1, 1,
0.1048915, -0.4404137, 4.62871, 0, 0.9568627, 1, 1,
0.1056109, 1.546039, -0.9915659, 0, 0.9529412, 1, 1,
0.1070069, 2.165102, -0.02902078, 0, 0.945098, 1, 1,
0.1087259, 1.097358, -0.2390874, 0, 0.9411765, 1, 1,
0.1099917, -0.4489568, 3.744596, 0, 0.9333333, 1, 1,
0.1149165, -0.2135421, 2.313154, 0, 0.9294118, 1, 1,
0.1201028, -1.258709, 1.994621, 0, 0.9215686, 1, 1,
0.1218868, 1.226672, 0.1644886, 0, 0.9176471, 1, 1,
0.1244529, 1.632669, -0.2396031, 0, 0.9098039, 1, 1,
0.1246854, 0.4215522, -0.5795332, 0, 0.9058824, 1, 1,
0.1270434, 0.01197538, 2.115935, 0, 0.8980392, 1, 1,
0.1296652, 0.8259879, 1.154784, 0, 0.8901961, 1, 1,
0.137425, 0.6261492, 0.2897405, 0, 0.8862745, 1, 1,
0.1380308, -0.195095, 2.30336, 0, 0.8784314, 1, 1,
0.1383003, -1.012077, 3.361307, 0, 0.8745098, 1, 1,
0.1407748, 0.9502035, 1.443872, 0, 0.8666667, 1, 1,
0.141191, 0.2486591, 0.1025077, 0, 0.8627451, 1, 1,
0.1482755, -1.390826, 2.718245, 0, 0.854902, 1, 1,
0.14928, -0.1227916, 3.5316, 0, 0.8509804, 1, 1,
0.1514095, 0.02787818, 2.730156, 0, 0.8431373, 1, 1,
0.1527919, -0.9119462, 3.292142, 0, 0.8392157, 1, 1,
0.1529139, -1.725286, 4.333135, 0, 0.8313726, 1, 1,
0.1566026, -1.233447, 4.085808, 0, 0.827451, 1, 1,
0.1571927, 0.7072601, -0.8347479, 0, 0.8196079, 1, 1,
0.1588689, -0.04204104, 1.580131, 0, 0.8156863, 1, 1,
0.1588975, -0.3256493, 3.799397, 0, 0.8078431, 1, 1,
0.1633296, 1.152399, -0.01643969, 0, 0.8039216, 1, 1,
0.1649836, -1.424006, 3.021391, 0, 0.7960784, 1, 1,
0.1669483, -0.4641522, 3.383077, 0, 0.7882353, 1, 1,
0.1670558, 0.7974085, 0.8242123, 0, 0.7843137, 1, 1,
0.1678119, -0.09039799, 3.328873, 0, 0.7764706, 1, 1,
0.1704532, -1.67537, 5.033411, 0, 0.772549, 1, 1,
0.1780298, 1.30285, 1.443545, 0, 0.7647059, 1, 1,
0.178916, -0.6932788, 3.368192, 0, 0.7607843, 1, 1,
0.178975, 1.146521, 0.5111197, 0, 0.7529412, 1, 1,
0.1813056, 0.08908635, 1.892756, 0, 0.7490196, 1, 1,
0.183636, 0.7289709, 0.5897568, 0, 0.7411765, 1, 1,
0.1852024, -0.334977, 3.106186, 0, 0.7372549, 1, 1,
0.185656, 0.4125908, -0.828233, 0, 0.7294118, 1, 1,
0.1870117, 0.794757, -0.3776508, 0, 0.7254902, 1, 1,
0.1885676, -0.6274507, 3.058447, 0, 0.7176471, 1, 1,
0.1887094, 0.5970477, 1.170781, 0, 0.7137255, 1, 1,
0.1889001, -0.3268818, 2.184676, 0, 0.7058824, 1, 1,
0.1914207, -0.6924064, 1.720305, 0, 0.6980392, 1, 1,
0.1928576, -0.3518046, 1.226036, 0, 0.6941177, 1, 1,
0.195808, -1.04846, 3.39875, 0, 0.6862745, 1, 1,
0.1983979, -1.001301, 3.090781, 0, 0.682353, 1, 1,
0.2011485, -0.1238176, 2.886608, 0, 0.6745098, 1, 1,
0.2016108, 0.4298316, -0.3771776, 0, 0.6705883, 1, 1,
0.2019961, -0.01771529, 1.531784, 0, 0.6627451, 1, 1,
0.2053836, -2.561637, 5.157734, 0, 0.6588235, 1, 1,
0.2104214, -1.104475, 1.964701, 0, 0.6509804, 1, 1,
0.2119485, -0.5744048, 2.462406, 0, 0.6470588, 1, 1,
0.2124434, -1.564885, 1.272156, 0, 0.6392157, 1, 1,
0.212543, 0.8460929, -2.703273, 0, 0.6352941, 1, 1,
0.2128481, -0.09032641, 3.082195, 0, 0.627451, 1, 1,
0.2138365, 1.59639, 0.7706996, 0, 0.6235294, 1, 1,
0.217602, -1.596514, 5.169976, 0, 0.6156863, 1, 1,
0.2209526, 0.3353116, 0.4484673, 0, 0.6117647, 1, 1,
0.2223969, 0.1290175, 0.3015543, 0, 0.6039216, 1, 1,
0.2229291, -0.1989238, 0.3603659, 0, 0.5960785, 1, 1,
0.2244278, 2.40589, 0.4811524, 0, 0.5921569, 1, 1,
0.2288299, 0.2193487, 1.79909, 0, 0.5843138, 1, 1,
0.231851, 0.7542028, 0.7033132, 0, 0.5803922, 1, 1,
0.234892, -1.257461, 3.120187, 0, 0.572549, 1, 1,
0.237175, -1.725784, 2.028283, 0, 0.5686275, 1, 1,
0.237981, 0.2717606, 1.305729, 0, 0.5607843, 1, 1,
0.2423883, -0.1713842, 2.792957, 0, 0.5568628, 1, 1,
0.2425261, 0.1039285, 1.49831, 0, 0.5490196, 1, 1,
0.2468256, 0.2492719, -0.05843052, 0, 0.5450981, 1, 1,
0.2493142, 2.664596, -0.3722592, 0, 0.5372549, 1, 1,
0.2566186, -0.3238046, 2.473196, 0, 0.5333334, 1, 1,
0.2583451, 1.094787, 0.6825776, 0, 0.5254902, 1, 1,
0.2601012, -1.125091, 3.568271, 0, 0.5215687, 1, 1,
0.2604929, -0.6656879, 3.987977, 0, 0.5137255, 1, 1,
0.2622319, -1.090307, 3.289359, 0, 0.509804, 1, 1,
0.2632126, 1.012116, 0.3014507, 0, 0.5019608, 1, 1,
0.2668117, 0.1320857, 0.1475761, 0, 0.4941176, 1, 1,
0.2669028, 1.455351, -1.65303, 0, 0.4901961, 1, 1,
0.272355, 1.166764, 1.523462, 0, 0.4823529, 1, 1,
0.2740514, -0.3109853, 2.025183, 0, 0.4784314, 1, 1,
0.2741233, -1.442054, 4.146418, 0, 0.4705882, 1, 1,
0.2764755, -0.5091515, 2.224685, 0, 0.4666667, 1, 1,
0.2778708, -0.1768811, 0.5698727, 0, 0.4588235, 1, 1,
0.27903, 0.8763438, -0.3998778, 0, 0.454902, 1, 1,
0.2793761, 2.472138, 0.2187518, 0, 0.4470588, 1, 1,
0.2799683, -1.935908, 2.775633, 0, 0.4431373, 1, 1,
0.2800876, -1.894624, 3.837259, 0, 0.4352941, 1, 1,
0.2845298, -1.717644, 3.990577, 0, 0.4313726, 1, 1,
0.2865973, -1.530948, 2.013728, 0, 0.4235294, 1, 1,
0.2889214, 1.899934, 0.1515897, 0, 0.4196078, 1, 1,
0.2917954, -2.235842, 2.224732, 0, 0.4117647, 1, 1,
0.2947216, 1.026314, 0.3160841, 0, 0.4078431, 1, 1,
0.2966614, -0.9575794, 1.629573, 0, 0.4, 1, 1,
0.2988321, -0.1954565, 3.023752, 0, 0.3921569, 1, 1,
0.3004288, -0.7012734, 4.030698, 0, 0.3882353, 1, 1,
0.3054205, -0.5882871, 1.50875, 0, 0.3803922, 1, 1,
0.3064961, -0.5170727, 3.362073, 0, 0.3764706, 1, 1,
0.3066918, -0.3673968, 3.997266, 0, 0.3686275, 1, 1,
0.312266, -1.017526, 4.970569, 0, 0.3647059, 1, 1,
0.3138254, -0.08775783, 1.59579, 0, 0.3568628, 1, 1,
0.3142127, -0.02752361, 1.256158, 0, 0.3529412, 1, 1,
0.3167718, 0.08881143, 2.261956, 0, 0.345098, 1, 1,
0.3177776, -0.1616389, 1.962064, 0, 0.3411765, 1, 1,
0.3229079, 1.011084, 2.05209, 0, 0.3333333, 1, 1,
0.3275932, 0.1897145, 0.3295144, 0, 0.3294118, 1, 1,
0.3318959, -0.782115, 1.344736, 0, 0.3215686, 1, 1,
0.3382577, -1.11611, 4.243515, 0, 0.3176471, 1, 1,
0.3406584, -0.04722989, -0.3306453, 0, 0.3098039, 1, 1,
0.3419834, -1.635391, 2.756101, 0, 0.3058824, 1, 1,
0.3445031, 1.848416, 0.823305, 0, 0.2980392, 1, 1,
0.3467984, -0.4362088, 3.349817, 0, 0.2901961, 1, 1,
0.3557928, -1.544768, 2.604034, 0, 0.2862745, 1, 1,
0.3558418, 0.2400286, 0.8232644, 0, 0.2784314, 1, 1,
0.3594899, -1.133665, 2.538291, 0, 0.2745098, 1, 1,
0.3604763, -0.5425271, 4.068328, 0, 0.2666667, 1, 1,
0.3630292, -1.371437, 2.819006, 0, 0.2627451, 1, 1,
0.3655804, -0.06342588, 1.867652, 0, 0.254902, 1, 1,
0.3657598, -0.4416938, 2.215217, 0, 0.2509804, 1, 1,
0.3674663, -2.058627, 4.072402, 0, 0.2431373, 1, 1,
0.3677986, 0.1172941, 1.142896, 0, 0.2392157, 1, 1,
0.3692268, 0.9345435, 0.8152642, 0, 0.2313726, 1, 1,
0.3705967, 0.6435497, 0.6089846, 0, 0.227451, 1, 1,
0.3741741, -1.087988, 1.01628, 0, 0.2196078, 1, 1,
0.3763804, -0.3596729, 2.171661, 0, 0.2156863, 1, 1,
0.3816377, -0.334533, 1.087628, 0, 0.2078431, 1, 1,
0.3878422, -1.510013, 1.998831, 0, 0.2039216, 1, 1,
0.3906422, -1.632945, 1.318096, 0, 0.1960784, 1, 1,
0.3950276, 0.4773907, -0.4333066, 0, 0.1882353, 1, 1,
0.4012842, -0.7332816, 2.230807, 0, 0.1843137, 1, 1,
0.4016887, -1.021481, 3.595468, 0, 0.1764706, 1, 1,
0.4022854, -0.8176439, 2.631575, 0, 0.172549, 1, 1,
0.4033976, 0.2635473, 0.1830958, 0, 0.1647059, 1, 1,
0.4040155, -1.066747, 2.905469, 0, 0.1607843, 1, 1,
0.4058831, -1.623693, 2.937346, 0, 0.1529412, 1, 1,
0.4079148, -1.401289, 1.768281, 0, 0.1490196, 1, 1,
0.4117563, -0.01391418, 1.07512, 0, 0.1411765, 1, 1,
0.4135502, -1.953405, 3.800826, 0, 0.1372549, 1, 1,
0.4235454, 0.7654704, 0.5185486, 0, 0.1294118, 1, 1,
0.4252486, 0.2767096, 1.153836, 0, 0.1254902, 1, 1,
0.4433936, 0.159288, 0.6578985, 0, 0.1176471, 1, 1,
0.4465178, -0.7077936, 3.889869, 0, 0.1137255, 1, 1,
0.4497647, 0.5314169, -0.5699014, 0, 0.1058824, 1, 1,
0.450659, -0.4804725, 0.5553983, 0, 0.09803922, 1, 1,
0.4536299, 1.771341, -0.3262272, 0, 0.09411765, 1, 1,
0.4552689, 0.2954554, 0.8956656, 0, 0.08627451, 1, 1,
0.4563749, 0.7426962, 0.07658372, 0, 0.08235294, 1, 1,
0.4569465, 0.3045019, 2.293037, 0, 0.07450981, 1, 1,
0.4569742, 1.297309, 0.259841, 0, 0.07058824, 1, 1,
0.4625953, 1.354373, 0.2034108, 0, 0.0627451, 1, 1,
0.4651949, 1.074028, -0.0371969, 0, 0.05882353, 1, 1,
0.4661529, -0.3141902, 3.164094, 0, 0.05098039, 1, 1,
0.4704817, 0.5396366, 0.5252979, 0, 0.04705882, 1, 1,
0.4723903, 0.9914399, -0.8284147, 0, 0.03921569, 1, 1,
0.4812189, -0.3348061, 2.159144, 0, 0.03529412, 1, 1,
0.4820907, 0.3155005, 0.8137115, 0, 0.02745098, 1, 1,
0.4828737, -0.4883048, 1.660346, 0, 0.02352941, 1, 1,
0.4851479, -1.822659, 1.825002, 0, 0.01568628, 1, 1,
0.4860466, 0.4173817, -0.3174319, 0, 0.01176471, 1, 1,
0.4918019, 0.1087271, 1.281616, 0, 0.003921569, 1, 1,
0.4921443, -1.500364, 1.690951, 0.003921569, 0, 1, 1,
0.4930157, -0.856012, 3.816441, 0.007843138, 0, 1, 1,
0.4939626, 0.5104374, 1.458096, 0.01568628, 0, 1, 1,
0.4963898, 0.3016871, -0.6629457, 0.01960784, 0, 1, 1,
0.4975122, -1.26994, 1.529439, 0.02745098, 0, 1, 1,
0.4989439, 1.25694, -0.5397637, 0.03137255, 0, 1, 1,
0.5010755, 1.258608, -0.4621255, 0.03921569, 0, 1, 1,
0.5029365, -1.191475, 2.717101, 0.04313726, 0, 1, 1,
0.5051984, -0.1165621, 1.462953, 0.05098039, 0, 1, 1,
0.5059994, -0.05050761, 1.107516, 0.05490196, 0, 1, 1,
0.5065914, 0.2593137, 1.15562, 0.0627451, 0, 1, 1,
0.5074147, 3.07026, 0.7790416, 0.06666667, 0, 1, 1,
0.5089925, 1.54443, 0.2547058, 0.07450981, 0, 1, 1,
0.5092924, -0.4795048, 3.479565, 0.07843138, 0, 1, 1,
0.5094114, 0.2572395, 0.647416, 0.08627451, 0, 1, 1,
0.5102395, -0.4843255, 1.974517, 0.09019608, 0, 1, 1,
0.5127923, 0.7829651, 0.9518583, 0.09803922, 0, 1, 1,
0.5139136, -0.5497109, 1.363068, 0.1058824, 0, 1, 1,
0.5225749, 0.2943318, -0.4307412, 0.1098039, 0, 1, 1,
0.5248317, 0.3549356, 1.47143, 0.1176471, 0, 1, 1,
0.5269019, -1.418593, 1.813901, 0.1215686, 0, 1, 1,
0.5283462, 2.111895, 1.553285, 0.1294118, 0, 1, 1,
0.5285341, -0.3384256, 3.333993, 0.1333333, 0, 1, 1,
0.532751, 0.2623145, -0.1658425, 0.1411765, 0, 1, 1,
0.5358739, -0.8210268, 3.966795, 0.145098, 0, 1, 1,
0.5366591, -1.741456, 3.546528, 0.1529412, 0, 1, 1,
0.5441129, -1.672227, 3.266712, 0.1568628, 0, 1, 1,
0.5491403, 1.515895, 1.367483, 0.1647059, 0, 1, 1,
0.551849, 0.5488373, -0.07066447, 0.1686275, 0, 1, 1,
0.5625975, -0.1286218, 2.135792, 0.1764706, 0, 1, 1,
0.5662123, -0.1651537, 2.587893, 0.1803922, 0, 1, 1,
0.5672528, 1.762681, 1.335797, 0.1882353, 0, 1, 1,
0.5729533, 0.9618817, 2.351079, 0.1921569, 0, 1, 1,
0.574869, -1.523538, 3.740827, 0.2, 0, 1, 1,
0.5795437, 0.08477513, 0.7806917, 0.2078431, 0, 1, 1,
0.584771, 1.399367, -0.02418482, 0.2117647, 0, 1, 1,
0.5882735, -1.433408, 3.853632, 0.2196078, 0, 1, 1,
0.5900487, -1.287848, 1.26127, 0.2235294, 0, 1, 1,
0.5905517, -0.02402813, 1.849942, 0.2313726, 0, 1, 1,
0.5954039, 0.7883759, -0.8505817, 0.2352941, 0, 1, 1,
0.5987464, 0.1478598, 0.6177633, 0.2431373, 0, 1, 1,
0.5995457, 0.1383598, 0.8533375, 0.2470588, 0, 1, 1,
0.6013924, 0.4424483, 0.4721514, 0.254902, 0, 1, 1,
0.6248866, -1.495701, 3.180465, 0.2588235, 0, 1, 1,
0.6252838, 0.7402601, -1.359258, 0.2666667, 0, 1, 1,
0.6274117, 1.530854, 1.169095, 0.2705882, 0, 1, 1,
0.6277879, -0.6215904, 2.936786, 0.2784314, 0, 1, 1,
0.6337831, -1.079117, 3.738505, 0.282353, 0, 1, 1,
0.6353524, 1.014162, 0.4628983, 0.2901961, 0, 1, 1,
0.6430038, -1.689076, 2.671336, 0.2941177, 0, 1, 1,
0.6442255, 0.4661412, 0.9173165, 0.3019608, 0, 1, 1,
0.6451758, -0.459246, 1.716811, 0.3098039, 0, 1, 1,
0.6471099, -1.21148, 3.313507, 0.3137255, 0, 1, 1,
0.647661, -1.776515, 2.142381, 0.3215686, 0, 1, 1,
0.6490474, 0.7994397, 0.224043, 0.3254902, 0, 1, 1,
0.6528949, -1.469502, 4.425833, 0.3333333, 0, 1, 1,
0.6530181, -0.6863211, 3.322747, 0.3372549, 0, 1, 1,
0.6603822, 0.6166099, 2.415435, 0.345098, 0, 1, 1,
0.6607625, 0.5692509, -0.3269771, 0.3490196, 0, 1, 1,
0.6618211, 1.049867, 1.228658, 0.3568628, 0, 1, 1,
0.6649339, -0.9423609, 1.254694, 0.3607843, 0, 1, 1,
0.6820625, 1.006886, -0.9647546, 0.3686275, 0, 1, 1,
0.688063, 1.369234, 0.4595908, 0.372549, 0, 1, 1,
0.6903443, 0.2086905, 0.2971573, 0.3803922, 0, 1, 1,
0.6917731, 0.5295094, -0.7093642, 0.3843137, 0, 1, 1,
0.6980298, 0.557777, 0.6542326, 0.3921569, 0, 1, 1,
0.7032779, -0.02456639, 0.5626685, 0.3960784, 0, 1, 1,
0.7055735, 0.0608759, 0.8955564, 0.4039216, 0, 1, 1,
0.7119959, -0.5307965, 2.876245, 0.4117647, 0, 1, 1,
0.7167205, -0.2402896, 1.357483, 0.4156863, 0, 1, 1,
0.7227052, -0.2330293, 3.052293, 0.4235294, 0, 1, 1,
0.7228548, 0.3395335, 1.904692, 0.427451, 0, 1, 1,
0.7237832, 0.2026246, 1.761394, 0.4352941, 0, 1, 1,
0.726107, 0.01096238, 2.960524, 0.4392157, 0, 1, 1,
0.7286608, -0.6841409, 1.263661, 0.4470588, 0, 1, 1,
0.7301309, 2.981627, 1.497202, 0.4509804, 0, 1, 1,
0.7326783, -0.7371954, 3.129219, 0.4588235, 0, 1, 1,
0.7327959, -0.9782632, 1.450205, 0.4627451, 0, 1, 1,
0.7347291, -0.6101141, 2.282785, 0.4705882, 0, 1, 1,
0.7350616, -2.619152, 2.952756, 0.4745098, 0, 1, 1,
0.7359768, 2.41442, 0.100569, 0.4823529, 0, 1, 1,
0.7409284, 1.912048, 0.6871894, 0.4862745, 0, 1, 1,
0.7433735, 0.8763914, 0.1402226, 0.4941176, 0, 1, 1,
0.7455382, 0.8150014, 1.994334, 0.5019608, 0, 1, 1,
0.7509359, 0.1571803, -0.7039529, 0.5058824, 0, 1, 1,
0.7516203, 0.29057, 1.849248, 0.5137255, 0, 1, 1,
0.7543101, -1.570237, 3.177157, 0.5176471, 0, 1, 1,
0.7548524, -0.2240431, 1.210546, 0.5254902, 0, 1, 1,
0.755215, -0.1101913, 1.382779, 0.5294118, 0, 1, 1,
0.7573905, 1.053041, -1.022407, 0.5372549, 0, 1, 1,
0.7575297, 1.334069, 1.083898, 0.5411765, 0, 1, 1,
0.7613357, -0.4001413, 0.8042157, 0.5490196, 0, 1, 1,
0.7634604, 0.0473939, 1.972392, 0.5529412, 0, 1, 1,
0.7651814, 0.6526636, -0.001973064, 0.5607843, 0, 1, 1,
0.768016, 0.1174644, 2.002115, 0.5647059, 0, 1, 1,
0.7723548, -0.6009808, 2.090549, 0.572549, 0, 1, 1,
0.7759197, 1.108513, 0.7651597, 0.5764706, 0, 1, 1,
0.7759383, -0.1111065, 2.320736, 0.5843138, 0, 1, 1,
0.777431, 0.7902304, 2.104606, 0.5882353, 0, 1, 1,
0.7806373, 0.7496299, 1.510858, 0.5960785, 0, 1, 1,
0.7811127, 1.933124, 1.468529, 0.6039216, 0, 1, 1,
0.7833061, 1.710787, 1.818753, 0.6078432, 0, 1, 1,
0.7965345, -0.2447742, 1.128082, 0.6156863, 0, 1, 1,
0.7985871, -0.9291798, 1.090825, 0.6196079, 0, 1, 1,
0.7994772, 1.638562, 0.3784003, 0.627451, 0, 1, 1,
0.8030508, -0.1473844, 3.503462, 0.6313726, 0, 1, 1,
0.8037978, -2.2115, 0.5558835, 0.6392157, 0, 1, 1,
0.811523, 0.8944541, 1.843166, 0.6431373, 0, 1, 1,
0.8145956, -1.071962, 2.015769, 0.6509804, 0, 1, 1,
0.8146868, 0.4936467, 1.702981, 0.654902, 0, 1, 1,
0.8218933, 0.1949167, 2.849549, 0.6627451, 0, 1, 1,
0.8220522, 0.6544505, 1.241696, 0.6666667, 0, 1, 1,
0.8229539, -0.2870286, 3.009617, 0.6745098, 0, 1, 1,
0.8241185, -0.4918386, 1.997864, 0.6784314, 0, 1, 1,
0.8374503, -0.8311311, 2.093265, 0.6862745, 0, 1, 1,
0.8399354, 1.52424, 0.4795439, 0.6901961, 0, 1, 1,
0.8404567, 0.05585343, 2.989207, 0.6980392, 0, 1, 1,
0.8412178, -2.198282, 2.884079, 0.7058824, 0, 1, 1,
0.842613, -1.123463, 3.527097, 0.7098039, 0, 1, 1,
0.8499255, -0.5971131, 2.09708, 0.7176471, 0, 1, 1,
0.8511713, 0.01051071, 0.5441024, 0.7215686, 0, 1, 1,
0.8532318, -1.297385, 3.920717, 0.7294118, 0, 1, 1,
0.8540782, -0.361125, 2.282012, 0.7333333, 0, 1, 1,
0.8611729, 2.038533, 0.1194177, 0.7411765, 0, 1, 1,
0.8665654, -0.9069532, 3.378671, 0.7450981, 0, 1, 1,
0.8667919, -0.8017291, 4.12987, 0.7529412, 0, 1, 1,
0.8704756, -0.3902329, 2.075602, 0.7568628, 0, 1, 1,
0.8756263, 0.2069389, 1.415811, 0.7647059, 0, 1, 1,
0.885324, -1.802665, 2.188138, 0.7686275, 0, 1, 1,
0.8896714, -1.332005, 2.651729, 0.7764706, 0, 1, 1,
0.8952698, -1.425833, 2.094809, 0.7803922, 0, 1, 1,
0.8955852, 0.3342246, 1.049712, 0.7882353, 0, 1, 1,
0.8993467, 0.06528459, 2.495795, 0.7921569, 0, 1, 1,
0.9041428, 1.259186, 1.239699, 0.8, 0, 1, 1,
0.9072948, -0.6990249, 1.65326, 0.8078431, 0, 1, 1,
0.9111031, -0.4997469, 1.982543, 0.8117647, 0, 1, 1,
0.911388, -1.35794, 0.7244216, 0.8196079, 0, 1, 1,
0.9175845, -1.269637, 1.390857, 0.8235294, 0, 1, 1,
0.9288841, 1.25737, 1.713729, 0.8313726, 0, 1, 1,
0.9339452, 1.046848, 1.447238, 0.8352941, 0, 1, 1,
0.9350362, -0.7388822, 2.247098, 0.8431373, 0, 1, 1,
0.937859, 0.04834841, 3.040655, 0.8470588, 0, 1, 1,
0.9449766, -1.569953, 3.413358, 0.854902, 0, 1, 1,
0.9482649, -0.474734, 0.8497102, 0.8588235, 0, 1, 1,
0.9494138, -0.2825731, 2.125112, 0.8666667, 0, 1, 1,
0.9513077, 0.2797316, -0.084409, 0.8705882, 0, 1, 1,
0.9563519, 1.002404, 0.05526247, 0.8784314, 0, 1, 1,
0.9568294, -1.271467, 2.881329, 0.8823529, 0, 1, 1,
0.9835691, -0.2397512, 1.335509, 0.8901961, 0, 1, 1,
0.985626, -0.5507526, 1.792851, 0.8941177, 0, 1, 1,
0.9889708, -0.3784178, 1.33077, 0.9019608, 0, 1, 1,
0.9905803, 0.1390351, 2.813754, 0.9098039, 0, 1, 1,
0.9967099, -0.8218867, 0.6099581, 0.9137255, 0, 1, 1,
0.9970267, 0.5143103, 0.02584347, 0.9215686, 0, 1, 1,
0.9992438, -1.289991, 2.59694, 0.9254902, 0, 1, 1,
1.006338, 0.7246336, 0.7626671, 0.9333333, 0, 1, 1,
1.011463, -1.668054, 3.718049, 0.9372549, 0, 1, 1,
1.019542, -1.239379, 2.239161, 0.945098, 0, 1, 1,
1.033096, -0.7294546, 0.903556, 0.9490196, 0, 1, 1,
1.033245, 0.5260888, 0.4659548, 0.9568627, 0, 1, 1,
1.033651, -0.7364213, 3.151956, 0.9607843, 0, 1, 1,
1.034993, 0.09470429, 0.9862915, 0.9686275, 0, 1, 1,
1.037278, 0.9256819, -0.2106576, 0.972549, 0, 1, 1,
1.038419, 0.1688417, 1.914685, 0.9803922, 0, 1, 1,
1.041418, -1.377599, 2.872471, 0.9843137, 0, 1, 1,
1.043959, 0.7239885, 0.3980052, 0.9921569, 0, 1, 1,
1.055976, -1.740552, 2.591881, 0.9960784, 0, 1, 1,
1.064043, 0.9488206, 0.4032309, 1, 0, 0.9960784, 1,
1.065897, -0.5549811, 3.663225, 1, 0, 0.9882353, 1,
1.066639, 0.1195412, 2.454405, 1, 0, 0.9843137, 1,
1.071975, 1.725056, 2.642166, 1, 0, 0.9764706, 1,
1.073404, -0.5604916, 2.599388, 1, 0, 0.972549, 1,
1.075498, 0.5745293, 1.335045, 1, 0, 0.9647059, 1,
1.083553, -0.4601883, 0.5340757, 1, 0, 0.9607843, 1,
1.085586, -0.7920251, 1.450373, 1, 0, 0.9529412, 1,
1.101399, -2.381368, 4.811175, 1, 0, 0.9490196, 1,
1.111534, 1.393739, -0.1410109, 1, 0, 0.9411765, 1,
1.114996, 0.3802523, 2.843056, 1, 0, 0.9372549, 1,
1.121342, 0.1906884, 1.929358, 1, 0, 0.9294118, 1,
1.125073, -0.9020294, 2.556539, 1, 0, 0.9254902, 1,
1.131551, -0.708657, 3.423027, 1, 0, 0.9176471, 1,
1.143862, 0.03566235, 1.224057, 1, 0, 0.9137255, 1,
1.144536, -0.6803759, 1.67595, 1, 0, 0.9058824, 1,
1.153604, -0.6913148, 0.3189589, 1, 0, 0.9019608, 1,
1.157745, 1.393268, 0.8379743, 1, 0, 0.8941177, 1,
1.160129, -0.4675017, 2.645837, 1, 0, 0.8862745, 1,
1.162649, 0.3321531, 0.1548202, 1, 0, 0.8823529, 1,
1.165683, 0.0673035, 0.8918582, 1, 0, 0.8745098, 1,
1.174141, 0.737816, 0.5358383, 1, 0, 0.8705882, 1,
1.17709, 0.3512635, 1.393539, 1, 0, 0.8627451, 1,
1.182271, 0.3204332, 4.030116, 1, 0, 0.8588235, 1,
1.186203, 0.1047361, 0.7860807, 1, 0, 0.8509804, 1,
1.186376, 0.541405, 0.8902009, 1, 0, 0.8470588, 1,
1.192914, 0.516892, 1.927412, 1, 0, 0.8392157, 1,
1.195757, -0.6342117, 0.839972, 1, 0, 0.8352941, 1,
1.204632, 1.7725, 0.6016319, 1, 0, 0.827451, 1,
1.209189, -0.5873112, 3.456963, 1, 0, 0.8235294, 1,
1.210735, 0.1496479, 1.21434, 1, 0, 0.8156863, 1,
1.215307, 0.5240714, 3.372314, 1, 0, 0.8117647, 1,
1.222313, 0.3540424, 1.18658, 1, 0, 0.8039216, 1,
1.226764, -0.9112024, 1.095737, 1, 0, 0.7960784, 1,
1.235644, -2.710462, 1.685428, 1, 0, 0.7921569, 1,
1.240344, 0.1404543, 1.826334, 1, 0, 0.7843137, 1,
1.240519, 0.1799399, 0.3667023, 1, 0, 0.7803922, 1,
1.248676, -0.713832, 0.2227621, 1, 0, 0.772549, 1,
1.252901, -1.528245, 2.748396, 1, 0, 0.7686275, 1,
1.260381, -0.6612193, 2.24046, 1, 0, 0.7607843, 1,
1.271331, 0.8613917, 1.819045, 1, 0, 0.7568628, 1,
1.272612, -1.009381, 0.8254821, 1, 0, 0.7490196, 1,
1.276858, -1.125741, 3.159576, 1, 0, 0.7450981, 1,
1.284231, -1.160523, 2.735142, 1, 0, 0.7372549, 1,
1.289384, 1.062063, -0.2699237, 1, 0, 0.7333333, 1,
1.289622, 0.4235981, 2.413828, 1, 0, 0.7254902, 1,
1.289849, -0.1193782, 2.367235, 1, 0, 0.7215686, 1,
1.290155, 0.1544653, 2.041083, 1, 0, 0.7137255, 1,
1.292731, 0.4726716, 2.96063, 1, 0, 0.7098039, 1,
1.296597, 0.6419119, 0.577395, 1, 0, 0.7019608, 1,
1.299091, -1.351651, 3.174933, 1, 0, 0.6941177, 1,
1.300203, -0.9371238, 1.898908, 1, 0, 0.6901961, 1,
1.30132, -0.0134855, 2.266227, 1, 0, 0.682353, 1,
1.302196, -0.756528, 1.090077, 1, 0, 0.6784314, 1,
1.306246, 1.055871, -0.4863937, 1, 0, 0.6705883, 1,
1.307128, -1.030669, 1.583493, 1, 0, 0.6666667, 1,
1.308607, 0.9149644, 0.8556746, 1, 0, 0.6588235, 1,
1.308925, -2.331554, 2.785693, 1, 0, 0.654902, 1,
1.310154, -0.4515832, 2.869144, 1, 0, 0.6470588, 1,
1.31495, 0.6968545, 1.347816, 1, 0, 0.6431373, 1,
1.319187, -0.4031606, 3.15119, 1, 0, 0.6352941, 1,
1.345535, 1.273076, 3.111788, 1, 0, 0.6313726, 1,
1.347359, 0.5031117, 1.609448, 1, 0, 0.6235294, 1,
1.354155, 0.5052338, 1.186951, 1, 0, 0.6196079, 1,
1.356721, -0.5381767, 1.392065, 1, 0, 0.6117647, 1,
1.358317, -0.3571526, 4.136782, 1, 0, 0.6078432, 1,
1.363286, -0.1462474, 2.482816, 1, 0, 0.6, 1,
1.366549, 0.04078773, 1.257618, 1, 0, 0.5921569, 1,
1.366835, -1.140972, 0.6786574, 1, 0, 0.5882353, 1,
1.374954, -0.3948912, 2.726123, 1, 0, 0.5803922, 1,
1.380636, 0.9464889, 1.180128, 1, 0, 0.5764706, 1,
1.385202, -0.3284188, 1.704193, 1, 0, 0.5686275, 1,
1.387225, 1.341052, 2.133274, 1, 0, 0.5647059, 1,
1.387803, -1.421443, 1.921316, 1, 0, 0.5568628, 1,
1.397962, -1.006693, 1.674083, 1, 0, 0.5529412, 1,
1.39997, 0.609085, 2.434017, 1, 0, 0.5450981, 1,
1.404928, 0.03383475, 2.642904, 1, 0, 0.5411765, 1,
1.416234, 0.4873343, 1.945325, 1, 0, 0.5333334, 1,
1.418634, 0.5185621, 1.646832, 1, 0, 0.5294118, 1,
1.425127, 1.063528, 1.405176, 1, 0, 0.5215687, 1,
1.425911, -0.4956522, 2.798276, 1, 0, 0.5176471, 1,
1.430698, 0.8246179, 1.6702, 1, 0, 0.509804, 1,
1.431893, -0.3866906, 1.639235, 1, 0, 0.5058824, 1,
1.433092, -0.9731706, 1.628085, 1, 0, 0.4980392, 1,
1.437796, -2.075229, 2.185761, 1, 0, 0.4901961, 1,
1.443745, 0.01972771, 1.92839, 1, 0, 0.4862745, 1,
1.444579, -0.3103128, 1.374135, 1, 0, 0.4784314, 1,
1.446415, -0.1820347, 1.254797, 1, 0, 0.4745098, 1,
1.448292, 0.5455621, -0.4071627, 1, 0, 0.4666667, 1,
1.451987, -1.06589, 2.257975, 1, 0, 0.4627451, 1,
1.463685, 1.237782, -0.6250846, 1, 0, 0.454902, 1,
1.489983, -0.09629695, 1.283798, 1, 0, 0.4509804, 1,
1.505088, 0.2141215, 1.527384, 1, 0, 0.4431373, 1,
1.517546, 1.248757, 1.967485, 1, 0, 0.4392157, 1,
1.527152, 0.7702245, 1.847197, 1, 0, 0.4313726, 1,
1.534174, -2.596272, 1.732343, 1, 0, 0.427451, 1,
1.549206, -1.723262, 0.719406, 1, 0, 0.4196078, 1,
1.589246, 1.184005, 2.17341, 1, 0, 0.4156863, 1,
1.590329, -0.8692414, 3.718612, 1, 0, 0.4078431, 1,
1.597547, 0.6463936, 1.770218, 1, 0, 0.4039216, 1,
1.603024, -0.2552819, 1.351335, 1, 0, 0.3960784, 1,
1.607775, -1.080693, 2.166951, 1, 0, 0.3882353, 1,
1.608288, 1.097559, 2.501321, 1, 0, 0.3843137, 1,
1.637462, -1.423059, 1.574908, 1, 0, 0.3764706, 1,
1.638954, 0.09307952, 2.687206, 1, 0, 0.372549, 1,
1.651617, 0.01936289, 0.1544709, 1, 0, 0.3647059, 1,
1.654539, -1.689272, 0.05287329, 1, 0, 0.3607843, 1,
1.655497, 0.5482083, 0.9608399, 1, 0, 0.3529412, 1,
1.667404, 0.0008940031, 0.1305889, 1, 0, 0.3490196, 1,
1.669611, -0.5478135, 1.25683, 1, 0, 0.3411765, 1,
1.675801, 0.8107381, 0.5038757, 1, 0, 0.3372549, 1,
1.679215, -0.1691655, 1.454215, 1, 0, 0.3294118, 1,
1.681376, -0.2888145, 2.557286, 1, 0, 0.3254902, 1,
1.684022, 0.2794223, 1.415341, 1, 0, 0.3176471, 1,
1.692089, 0.7071124, 1.86226, 1, 0, 0.3137255, 1,
1.695972, -1.990218, 2.165385, 1, 0, 0.3058824, 1,
1.708697, 1.080029, 1.212654, 1, 0, 0.2980392, 1,
1.725715, 0.6161509, 3.379884, 1, 0, 0.2941177, 1,
1.726903, -1.009403, 1.431431, 1, 0, 0.2862745, 1,
1.761582, -1.085444, 1.078907, 1, 0, 0.282353, 1,
1.782969, 0.605166, 2.405324, 1, 0, 0.2745098, 1,
1.78799, -1.719193, 2.670634, 1, 0, 0.2705882, 1,
1.794141, 0.3344301, 3.193844, 1, 0, 0.2627451, 1,
1.796229, 0.1765885, 1.881652, 1, 0, 0.2588235, 1,
1.813388, 1.338868, 1.784688, 1, 0, 0.2509804, 1,
1.818032, -1.114227, 1.759726, 1, 0, 0.2470588, 1,
1.837131, -0.8726239, -0.1754134, 1, 0, 0.2392157, 1,
1.842799, -0.01715951, 2.016729, 1, 0, 0.2352941, 1,
1.846267, -0.1036285, 0.1559582, 1, 0, 0.227451, 1,
1.850251, 0.05171894, 0.9666204, 1, 0, 0.2235294, 1,
1.862102, -1.844114, 2.509857, 1, 0, 0.2156863, 1,
1.881416, -2.409519, 2.248417, 1, 0, 0.2117647, 1,
1.897202, 0.5732093, -0.168036, 1, 0, 0.2039216, 1,
1.956238, -0.3545184, 3.927954, 1, 0, 0.1960784, 1,
1.956917, -1.203339, 2.3318, 1, 0, 0.1921569, 1,
1.957643, 0.836717, 0.3499855, 1, 0, 0.1843137, 1,
1.977414, -0.5253285, 1.559539, 1, 0, 0.1803922, 1,
1.979999, -0.6778094, 3.374541, 1, 0, 0.172549, 1,
1.986666, 1.506154, 1.35556, 1, 0, 0.1686275, 1,
1.992265, 0.2355959, 1.89687, 1, 0, 0.1607843, 1,
2.004432, 1.370463, 0.5712494, 1, 0, 0.1568628, 1,
2.011648, -1.361036, 1.684484, 1, 0, 0.1490196, 1,
2.036461, -0.6128985, 1.511938, 1, 0, 0.145098, 1,
2.051747, -0.1901666, 2.592313, 1, 0, 0.1372549, 1,
2.053687, -0.4860801, 2.870459, 1, 0, 0.1333333, 1,
2.07678, -0.2604227, 3.387723, 1, 0, 0.1254902, 1,
2.103511, 0.8608535, 1.138195, 1, 0, 0.1215686, 1,
2.127386, 0.708537, 2.172148, 1, 0, 0.1137255, 1,
2.138273, -0.2639674, 2.348662, 1, 0, 0.1098039, 1,
2.164256, -1.444362, 2.845551, 1, 0, 0.1019608, 1,
2.18448, -0.2958927, 0.2946202, 1, 0, 0.09411765, 1,
2.212697, 0.2465876, 2.383165, 1, 0, 0.09019608, 1,
2.243991, 0.9318181, 0.8534098, 1, 0, 0.08235294, 1,
2.255223, 0.5594875, 1.992421, 1, 0, 0.07843138, 1,
2.379303, -0.8373397, 2.796139, 1, 0, 0.07058824, 1,
2.457095, 0.7096733, -1.417487, 1, 0, 0.06666667, 1,
2.487948, 0.2546555, 0.6772691, 1, 0, 0.05882353, 1,
2.573328, 0.5294299, -0.942304, 1, 0, 0.05490196, 1,
2.588813, 0.5983269, 0.09691396, 1, 0, 0.04705882, 1,
2.762679, 1.28593, 0.952359, 1, 0, 0.04313726, 1,
2.774157, 0.65214, 1.766931, 1, 0, 0.03529412, 1,
2.789275, 0.1934807, 1.590144, 1, 0, 0.03137255, 1,
2.808589, -0.4230025, 1.289968, 1, 0, 0.02352941, 1,
2.929051, 0.4949471, 2.060423, 1, 0, 0.01960784, 1,
3.056741, 0.8027377, 0.5948243, 1, 0, 0.01176471, 1,
3.376868, 0.1659559, -0.08839675, 1, 0, 0.007843138, 1
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
0.2502356, -3.934326, -6.613906, 0, -0.5, 0.5, 0.5,
0.2502356, -3.934326, -6.613906, 1, -0.5, 0.5, 0.5,
0.2502356, -3.934326, -6.613906, 1, 1.5, 0.5, 0.5,
0.2502356, -3.934326, -6.613906, 0, 1.5, 0.5, 0.5
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
-3.936325, 0.07556725, -6.613906, 0, -0.5, 0.5, 0.5,
-3.936325, 0.07556725, -6.613906, 1, -0.5, 0.5, 0.5,
-3.936325, 0.07556725, -6.613906, 1, 1.5, 0.5, 0.5,
-3.936325, 0.07556725, -6.613906, 0, 1.5, 0.5, 0.5
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
-3.936325, -3.934326, 0.1319757, 0, -0.5, 0.5, 0.5,
-3.936325, -3.934326, 0.1319757, 1, -0.5, 0.5, 0.5,
-3.936325, -3.934326, 0.1319757, 1, 1.5, 0.5, 0.5,
-3.936325, -3.934326, 0.1319757, 0, 1.5, 0.5, 0.5
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
-2, -3.008966, -5.057165,
3, -3.008966, -5.057165,
-2, -3.008966, -5.057165,
-2, -3.163193, -5.316621,
-1, -3.008966, -5.057165,
-1, -3.163193, -5.316621,
0, -3.008966, -5.057165,
0, -3.163193, -5.316621,
1, -3.008966, -5.057165,
1, -3.163193, -5.316621,
2, -3.008966, -5.057165,
2, -3.163193, -5.316621,
3, -3.008966, -5.057165,
3, -3.163193, -5.316621
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
-2, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
-2, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
-2, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
-2, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5,
-1, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
-1, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
-1, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
-1, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5,
0, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
0, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
0, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
0, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5,
1, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
1, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
1, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
1, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5,
2, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
2, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
2, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
2, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5,
3, -3.471646, -5.835536, 0, -0.5, 0.5, 0.5,
3, -3.471646, -5.835536, 1, -0.5, 0.5, 0.5,
3, -3.471646, -5.835536, 1, 1.5, 0.5, 0.5,
3, -3.471646, -5.835536, 0, 1.5, 0.5, 0.5
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
-2.970196, -2, -5.057165,
-2.970196, 3, -5.057165,
-2.970196, -2, -5.057165,
-3.131217, -2, -5.316621,
-2.970196, -1, -5.057165,
-3.131217, -1, -5.316621,
-2.970196, 0, -5.057165,
-3.131217, 0, -5.316621,
-2.970196, 1, -5.057165,
-3.131217, 1, -5.316621,
-2.970196, 2, -5.057165,
-3.131217, 2, -5.316621,
-2.970196, 3, -5.057165,
-3.131217, 3, -5.316621
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
-3.45326, -2, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, -2, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, -2, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, -2, -5.835536, 0, 1.5, 0.5, 0.5,
-3.45326, -1, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, -1, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, -1, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, -1, -5.835536, 0, 1.5, 0.5, 0.5,
-3.45326, 0, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, 0, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, 0, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, 0, -5.835536, 0, 1.5, 0.5, 0.5,
-3.45326, 1, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, 1, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, 1, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, 1, -5.835536, 0, 1.5, 0.5, 0.5,
-3.45326, 2, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, 2, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, 2, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, 2, -5.835536, 0, 1.5, 0.5, 0.5,
-3.45326, 3, -5.835536, 0, -0.5, 0.5, 0.5,
-3.45326, 3, -5.835536, 1, -0.5, 0.5, 0.5,
-3.45326, 3, -5.835536, 1, 1.5, 0.5, 0.5,
-3.45326, 3, -5.835536, 0, 1.5, 0.5, 0.5
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
-2.970196, -3.008966, -4,
-2.970196, -3.008966, 4,
-2.970196, -3.008966, -4,
-3.131217, -3.163193, -4,
-2.970196, -3.008966, -2,
-3.131217, -3.163193, -2,
-2.970196, -3.008966, 0,
-3.131217, -3.163193, 0,
-2.970196, -3.008966, 2,
-3.131217, -3.163193, 2,
-2.970196, -3.008966, 4,
-3.131217, -3.163193, 4
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
-3.45326, -3.471646, -4, 0, -0.5, 0.5, 0.5,
-3.45326, -3.471646, -4, 1, -0.5, 0.5, 0.5,
-3.45326, -3.471646, -4, 1, 1.5, 0.5, 0.5,
-3.45326, -3.471646, -4, 0, 1.5, 0.5, 0.5,
-3.45326, -3.471646, -2, 0, -0.5, 0.5, 0.5,
-3.45326, -3.471646, -2, 1, -0.5, 0.5, 0.5,
-3.45326, -3.471646, -2, 1, 1.5, 0.5, 0.5,
-3.45326, -3.471646, -2, 0, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 0, 0, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 0, 1, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 0, 1, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 0, 0, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 2, 0, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 2, 1, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 2, 1, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 2, 0, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 4, 0, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 4, 1, -0.5, 0.5, 0.5,
-3.45326, -3.471646, 4, 1, 1.5, 0.5, 0.5,
-3.45326, -3.471646, 4, 0, 1.5, 0.5, 0.5
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
-2.970196, -3.008966, -5.057165,
-2.970196, 3.160101, -5.057165,
-2.970196, -3.008966, 5.321116,
-2.970196, 3.160101, 5.321116,
-2.970196, -3.008966, -5.057165,
-2.970196, -3.008966, 5.321116,
-2.970196, 3.160101, -5.057165,
-2.970196, 3.160101, 5.321116,
-2.970196, -3.008966, -5.057165,
3.470667, -3.008966, -5.057165,
-2.970196, -3.008966, 5.321116,
3.470667, -3.008966, 5.321116,
-2.970196, 3.160101, -5.057165,
3.470667, 3.160101, -5.057165,
-2.970196, 3.160101, 5.321116,
3.470667, 3.160101, 5.321116,
3.470667, -3.008966, -5.057165,
3.470667, 3.160101, -5.057165,
3.470667, -3.008966, 5.321116,
3.470667, 3.160101, 5.321116,
3.470667, -3.008966, -5.057165,
3.470667, -3.008966, 5.321116,
3.470667, 3.160101, -5.057165,
3.470667, 3.160101, 5.321116
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
var radius = 7.30697;
var distance = 32.50953;
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
mvMatrix.translate( -0.2502356, -0.07556725, -0.1319757 );
mvMatrix.scale( 1.226612, 1.280654, 0.7612474 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.50953);
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
lufenuron<-read.table("lufenuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lufenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
y<-lufenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
```

```r
z<-lufenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'lufenuron' not found
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
-2.876397, 1.039689, 1.09963, 0, 0, 1, 1, 1,
-2.720889, 0.2263969, -0.5891573, 1, 0, 0, 1, 1,
-2.675396, 0.7417846, -0.7036789, 1, 0, 0, 1, 1,
-2.666735, 2.843659, -0.2951149, 1, 0, 0, 1, 1,
-2.61446, 1.367943, -2.535475, 1, 0, 0, 1, 1,
-2.503261, 0.8095291, -1.411033, 1, 0, 0, 1, 1,
-2.490589, 0.9025384, -2.359825, 0, 0, 0, 1, 1,
-2.474432, 1.931564, -1.271843, 0, 0, 0, 1, 1,
-2.390106, -1.423638, -1.929909, 0, 0, 0, 1, 1,
-2.365843, 1.141737, 0.7459647, 0, 0, 0, 1, 1,
-2.360022, -0.8651254, -1.059181, 0, 0, 0, 1, 1,
-2.238923, 0.7346045, -1.2043, 0, 0, 0, 1, 1,
-2.235217, 0.2513958, -1.941443, 0, 0, 0, 1, 1,
-2.206923, -1.534482, -2.174939, 1, 1, 1, 1, 1,
-2.189744, 1.04064, -2.981073, 1, 1, 1, 1, 1,
-2.186263, 0.189226, 0.4592596, 1, 1, 1, 1, 1,
-2.13717, 0.5094217, 0.1930992, 1, 1, 1, 1, 1,
-2.085324, -0.1245497, -0.9683506, 1, 1, 1, 1, 1,
-2.030612, -0.3232539, -1.096145, 1, 1, 1, 1, 1,
-1.95092, 0.833206, -0.8959738, 1, 1, 1, 1, 1,
-1.947193, 0.006166606, -1.538555, 1, 1, 1, 1, 1,
-1.891072, -0.08985537, -1.991703, 1, 1, 1, 1, 1,
-1.873658, 0.8780056, -1.459704, 1, 1, 1, 1, 1,
-1.866192, 0.3592046, -1.366338, 1, 1, 1, 1, 1,
-1.858539, -1.138846, -2.416554, 1, 1, 1, 1, 1,
-1.846911, 0.8133655, -1.360058, 1, 1, 1, 1, 1,
-1.8452, 0.0238356, -2.750291, 1, 1, 1, 1, 1,
-1.83938, 0.7055043, -1.049207, 1, 1, 1, 1, 1,
-1.785536, -0.009613096, -3.150227, 0, 0, 1, 1, 1,
-1.7797, 0.1308777, -0.08313785, 1, 0, 0, 1, 1,
-1.776148, -0.6918646, -3.282609, 1, 0, 0, 1, 1,
-1.775882, -1.096038, -2.599006, 1, 0, 0, 1, 1,
-1.74578, -1.054963, -2.381747, 1, 0, 0, 1, 1,
-1.734168, -1.21713, -2.544413, 1, 0, 0, 1, 1,
-1.709962, -1.253587, -0.8650125, 0, 0, 0, 1, 1,
-1.703441, 0.4086642, -1.195415, 0, 0, 0, 1, 1,
-1.672077, -1.432439, -1.70819, 0, 0, 0, 1, 1,
-1.653874, 0.0213997, -2.703228, 0, 0, 0, 1, 1,
-1.647393, 1.254248, -1.022282, 0, 0, 0, 1, 1,
-1.638583, 0.6543884, -1.152194, 0, 0, 0, 1, 1,
-1.633795, 0.3598734, -1.092915, 0, 0, 0, 1, 1,
-1.624649, 0.4830696, -1.818545, 1, 1, 1, 1, 1,
-1.608051, 1.854902, -0.8851786, 1, 1, 1, 1, 1,
-1.604434, 0.5880885, -1.970086, 1, 1, 1, 1, 1,
-1.597634, -0.5559177, -2.762798, 1, 1, 1, 1, 1,
-1.590971, 0.3660168, -1.266565, 1, 1, 1, 1, 1,
-1.585879, -0.6950718, -1.101393, 1, 1, 1, 1, 1,
-1.58545, -1.131803, -2.031191, 1, 1, 1, 1, 1,
-1.582738, 0.3287495, -2.768305, 1, 1, 1, 1, 1,
-1.580614, -0.8315027, -2.35669, 1, 1, 1, 1, 1,
-1.567479, 0.2348794, -1.237427, 1, 1, 1, 1, 1,
-1.564413, 1.377833, 0.2691765, 1, 1, 1, 1, 1,
-1.559622, 1.221058, -0.8673927, 1, 1, 1, 1, 1,
-1.549582, -0.720112, -1.240083, 1, 1, 1, 1, 1,
-1.542235, -1.35422, -2.718891, 1, 1, 1, 1, 1,
-1.522078, -0.9502594, -2.241129, 1, 1, 1, 1, 1,
-1.510595, -2.787333, -3.141142, 0, 0, 1, 1, 1,
-1.506868, -1.378946, -1.824464, 1, 0, 0, 1, 1,
-1.500136, 1.471086, -0.9657415, 1, 0, 0, 1, 1,
-1.484855, 0.6198428, -1.360772, 1, 0, 0, 1, 1,
-1.47091, -0.9178144, -2.565005, 1, 0, 0, 1, 1,
-1.461746, 1.075565, -0.1869597, 1, 0, 0, 1, 1,
-1.45624, -2.311777, -1.385281, 0, 0, 0, 1, 1,
-1.453189, 0.9316037, -1.251607, 0, 0, 0, 1, 1,
-1.442922, 0.3886914, -2.069095, 0, 0, 0, 1, 1,
-1.436702, 0.1137324, -2.131217, 0, 0, 0, 1, 1,
-1.43008, 1.197767, -0.2173754, 0, 0, 0, 1, 1,
-1.425759, -1.303626, -0.8839731, 0, 0, 0, 1, 1,
-1.423477, 1.480091, -1.281402, 0, 0, 0, 1, 1,
-1.419751, -0.1734372, -3.688656, 1, 1, 1, 1, 1,
-1.417225, -1.729026, -1.96019, 1, 1, 1, 1, 1,
-1.41681, 1.073274, -0.3341834, 1, 1, 1, 1, 1,
-1.41662, -0.08461606, -3.029606, 1, 1, 1, 1, 1,
-1.412571, -1.973955, -3.746804, 1, 1, 1, 1, 1,
-1.400026, -1.156505, -3.1231, 1, 1, 1, 1, 1,
-1.394704, -0.5911309, -0.9287301, 1, 1, 1, 1, 1,
-1.389442, -0.8021729, -0.00070357, 1, 1, 1, 1, 1,
-1.367936, -0.2148798, -2.086698, 1, 1, 1, 1, 1,
-1.360313, 0.1793339, -2.568733, 1, 1, 1, 1, 1,
-1.358892, 0.3984599, -1.488049, 1, 1, 1, 1, 1,
-1.356371, 0.9835366, -2.759966, 1, 1, 1, 1, 1,
-1.351018, -1.922561, -1.988065, 1, 1, 1, 1, 1,
-1.349058, -0.1920906, -0.9729069, 1, 1, 1, 1, 1,
-1.343795, 0.3630493, -1.641965, 1, 1, 1, 1, 1,
-1.34341, 1.327903, -0.6445846, 0, 0, 1, 1, 1,
-1.34334, 0.2202315, -1.70476, 1, 0, 0, 1, 1,
-1.338737, 0.7820351, -1.976291, 1, 0, 0, 1, 1,
-1.337195, 1.350367, -1.346218, 1, 0, 0, 1, 1,
-1.329631, 0.5371778, -1.106772, 1, 0, 0, 1, 1,
-1.323715, -0.3694499, -1.802261, 1, 0, 0, 1, 1,
-1.322912, 0.9897684, -1.495784, 0, 0, 0, 1, 1,
-1.32235, -0.8294014, -1.991436, 0, 0, 0, 1, 1,
-1.313311, 1.855233, -1.206003, 0, 0, 0, 1, 1,
-1.307292, 0.5494146, -1.869198, 0, 0, 0, 1, 1,
-1.300364, -1.018786, -1.189319, 0, 0, 0, 1, 1,
-1.295742, -1.605908, -2.124126, 0, 0, 0, 1, 1,
-1.28933, -1.189652, -2.223361, 0, 0, 0, 1, 1,
-1.275785, -2.285345, -3.267395, 1, 1, 1, 1, 1,
-1.273132, -0.06123602, -2.089863, 1, 1, 1, 1, 1,
-1.271364, 0.2122665, -1.789172, 1, 1, 1, 1, 1,
-1.262321, 1.123708, -0.4100259, 1, 1, 1, 1, 1,
-1.261232, 0.5396441, -2.112649, 1, 1, 1, 1, 1,
-1.258323, -0.256734, -0.8290444, 1, 1, 1, 1, 1,
-1.256454, -0.4145494, -0.6318182, 1, 1, 1, 1, 1,
-1.239592, 0.1818952, -1.976802, 1, 1, 1, 1, 1,
-1.237124, 0.5634609, -2.462828, 1, 1, 1, 1, 1,
-1.236808, 0.2296916, -1.434052, 1, 1, 1, 1, 1,
-1.230328, -0.8143507, -2.418632, 1, 1, 1, 1, 1,
-1.216874, 0.07296671, -2.032608, 1, 1, 1, 1, 1,
-1.212128, -1.073373, -3.972325, 1, 1, 1, 1, 1,
-1.209487, 0.08190475, -1.077307, 1, 1, 1, 1, 1,
-1.208837, 1.98568, 1.214126, 1, 1, 1, 1, 1,
-1.20306, -0.01654568, -0.8011538, 0, 0, 1, 1, 1,
-1.185165, 2.1683, -0.7213055, 1, 0, 0, 1, 1,
-1.181742, 0.4900967, -1.318142, 1, 0, 0, 1, 1,
-1.171761, 0.9435856, -0.05333499, 1, 0, 0, 1, 1,
-1.155093, 0.2202763, -1.887492, 1, 0, 0, 1, 1,
-1.144547, -0.6046413, -2.445611, 1, 0, 0, 1, 1,
-1.138861, 0.5920293, -1.154237, 0, 0, 0, 1, 1,
-1.130273, 2.386363, -1.67316, 0, 0, 0, 1, 1,
-1.122379, 0.07604004, -1.835065, 0, 0, 0, 1, 1,
-1.119253, 1.236721, -0.4233353, 0, 0, 0, 1, 1,
-1.118076, -2.293197, -1.86056, 0, 0, 0, 1, 1,
-1.111258, 0.6497625, -2.015038, 0, 0, 0, 1, 1,
-1.091678, 0.8113884, -1.230637, 0, 0, 0, 1, 1,
-1.086905, 0.5462303, -0.7727315, 1, 1, 1, 1, 1,
-1.086442, 0.1790232, -0.535699, 1, 1, 1, 1, 1,
-1.084262, 1.160995, -1.702978, 1, 1, 1, 1, 1,
-1.083228, -0.3411984, -2.092355, 1, 1, 1, 1, 1,
-1.074857, 0.2852827, -0.9927816, 1, 1, 1, 1, 1,
-1.07409, 0.7103705, -1.013411, 1, 1, 1, 1, 1,
-1.062466, 0.8324789, 0.1577917, 1, 1, 1, 1, 1,
-1.05757, 0.1351717, -2.443981, 1, 1, 1, 1, 1,
-1.055163, -0.5285652, -0.631399, 1, 1, 1, 1, 1,
-1.053314, 0.4008547, -0.6297093, 1, 1, 1, 1, 1,
-1.039771, 0.2343995, -0.7402698, 1, 1, 1, 1, 1,
-1.029605, -0.160271, -2.039492, 1, 1, 1, 1, 1,
-1.023714, -0.8959317, -2.927657, 1, 1, 1, 1, 1,
-1.022696, 0.1178334, 0.6902744, 1, 1, 1, 1, 1,
-1.008006, -1.085649, -2.372622, 1, 1, 1, 1, 1,
-1.007834, 0.09483457, 0.05519543, 0, 0, 1, 1, 1,
-1.005011, 0.07611812, 0.09238082, 1, 0, 0, 1, 1,
-0.9992343, -0.5694999, -0.7187062, 1, 0, 0, 1, 1,
-0.9889591, 0.9961989, 0.7008263, 1, 0, 0, 1, 1,
-0.9842512, -0.5583469, -1.944585, 1, 0, 0, 1, 1,
-0.9766793, 0.744162, -0.959669, 1, 0, 0, 1, 1,
-0.9754527, 0.3619007, -1.918716, 0, 0, 0, 1, 1,
-0.9689173, -0.5337743, -2.898821, 0, 0, 0, 1, 1,
-0.9687228, -0.1292009, -1.587249, 0, 0, 0, 1, 1,
-0.9554491, -1.232999, -2.261709, 0, 0, 0, 1, 1,
-0.9495137, -0.488321, -2.552202, 0, 0, 0, 1, 1,
-0.9481876, -0.5799227, -3.277526, 0, 0, 0, 1, 1,
-0.9275302, 0.2961037, -1.359561, 0, 0, 0, 1, 1,
-0.9196188, 0.4316695, 1.792826, 1, 1, 1, 1, 1,
-0.9180712, 0.663746, -3.715214, 1, 1, 1, 1, 1,
-0.9046887, 0.3395897, -0.9782313, 1, 1, 1, 1, 1,
-0.9028795, -0.08617179, -3.043378, 1, 1, 1, 1, 1,
-0.9022834, 0.5414204, -1.554283, 1, 1, 1, 1, 1,
-0.900629, 0.3502403, -1.94654, 1, 1, 1, 1, 1,
-0.89359, 2.195371, -1.541462, 1, 1, 1, 1, 1,
-0.8923287, 0.4712066, -0.3318949, 1, 1, 1, 1, 1,
-0.8893426, 0.6996906, -1.570104, 1, 1, 1, 1, 1,
-0.8873797, 0.3072459, -1.279672, 1, 1, 1, 1, 1,
-0.8793784, -1.661023, -1.379161, 1, 1, 1, 1, 1,
-0.8786841, 0.09038673, -1.075171, 1, 1, 1, 1, 1,
-0.8732441, 0.3882326, -1.252496, 1, 1, 1, 1, 1,
-0.8731548, -1.032334, -2.491741, 1, 1, 1, 1, 1,
-0.8676242, -0.1358598, -1.797848, 1, 1, 1, 1, 1,
-0.8667065, 0.1933329, -2.08969, 0, 0, 1, 1, 1,
-0.8665913, 0.02980452, -1.664382, 1, 0, 0, 1, 1,
-0.8657834, -1.188588, -2.841575, 1, 0, 0, 1, 1,
-0.8580769, -0.06008207, -3.207491, 1, 0, 0, 1, 1,
-0.8561842, -0.5370145, -2.328716, 1, 0, 0, 1, 1,
-0.8509608, -0.9619435, -2.981478, 1, 0, 0, 1, 1,
-0.8471193, 2.803789, -0.03562988, 0, 0, 0, 1, 1,
-0.8406615, -0.3711513, -2.020154, 0, 0, 0, 1, 1,
-0.8365053, 2.264646, -0.5387118, 0, 0, 0, 1, 1,
-0.8327675, -1.035854, -1.298795, 0, 0, 0, 1, 1,
-0.830061, 1.418168, -1.953482, 0, 0, 0, 1, 1,
-0.8275715, 1.446417, -1.954165, 0, 0, 0, 1, 1,
-0.826118, -1.004717, -2.457511, 0, 0, 0, 1, 1,
-0.825487, -0.4902477, -2.494332, 1, 1, 1, 1, 1,
-0.8247209, 0.172311, -1.781585, 1, 1, 1, 1, 1,
-0.8176587, 0.1606941, -0.8187004, 1, 1, 1, 1, 1,
-0.8137111, 0.137498, -2.330501, 1, 1, 1, 1, 1,
-0.8113088, 1.849618, -1.176978, 1, 1, 1, 1, 1,
-0.8090285, -0.2240501, -2.697491, 1, 1, 1, 1, 1,
-0.8071792, 1.197451, -1.790829, 1, 1, 1, 1, 1,
-0.8036641, 0.006429942, -2.148367, 1, 1, 1, 1, 1,
-0.8032765, -0.5479375, -2.902333, 1, 1, 1, 1, 1,
-0.796699, -0.1765143, -0.7916236, 1, 1, 1, 1, 1,
-0.7929648, 0.1266233, -2.000905, 1, 1, 1, 1, 1,
-0.7895813, 0.7865785, -1.317105, 1, 1, 1, 1, 1,
-0.7894089, 0.6453703, -2.163046, 1, 1, 1, 1, 1,
-0.7883255, -0.3907429, -0.6910897, 1, 1, 1, 1, 1,
-0.7827132, -1.808783, -2.471384, 1, 1, 1, 1, 1,
-0.7791083, 0.5973864, -1.90325, 0, 0, 1, 1, 1,
-0.775897, 0.1420274, -3.002759, 1, 0, 0, 1, 1,
-0.7593015, -0.2254985, -3.006983, 1, 0, 0, 1, 1,
-0.7563152, -0.4461754, -2.37837, 1, 0, 0, 1, 1,
-0.7531928, -0.2602375, -2.001481, 1, 0, 0, 1, 1,
-0.7484479, 0.2575283, -0.3159224, 1, 0, 0, 1, 1,
-0.748181, -0.02477328, -2.457937, 0, 0, 0, 1, 1,
-0.7460196, -0.1889752, -2.310839, 0, 0, 0, 1, 1,
-0.7456079, -0.2454705, -1.085779, 0, 0, 0, 1, 1,
-0.7359038, -0.6002899, -3.487818, 0, 0, 0, 1, 1,
-0.7286463, 1.649519, -0.6302886, 0, 0, 0, 1, 1,
-0.7271259, -0.762198, -2.064828, 0, 0, 0, 1, 1,
-0.7233939, -1.419075, -1.077033, 0, 0, 0, 1, 1,
-0.7086732, 0.9839537, -1.870384, 1, 1, 1, 1, 1,
-0.7084626, 0.8937452, -1.571658, 1, 1, 1, 1, 1,
-0.7059051, -0.6372278, -1.873155, 1, 1, 1, 1, 1,
-0.7040806, 0.9065944, -0.6249837, 1, 1, 1, 1, 1,
-0.6985744, 0.9468099, -0.1533329, 1, 1, 1, 1, 1,
-0.6964569, -1.203025, -2.625387, 1, 1, 1, 1, 1,
-0.6953336, 0.1294112, -0.3411622, 1, 1, 1, 1, 1,
-0.6915604, 0.4270274, -2.273233, 1, 1, 1, 1, 1,
-0.6902187, -1.628202, -4.312896, 1, 1, 1, 1, 1,
-0.6868553, 0.2967838, -0.7206412, 1, 1, 1, 1, 1,
-0.6850231, 0.7366688, -2.775874, 1, 1, 1, 1, 1,
-0.6842942, -0.103384, -1.313671, 1, 1, 1, 1, 1,
-0.681911, -0.7667774, -2.709458, 1, 1, 1, 1, 1,
-0.6774244, 0.163417, 0.1197498, 1, 1, 1, 1, 1,
-0.6677089, -0.7581879, -1.615706, 1, 1, 1, 1, 1,
-0.667704, 0.2527817, -1.267265, 0, 0, 1, 1, 1,
-0.663074, 0.104206, -1.941067, 1, 0, 0, 1, 1,
-0.6629019, -0.7102629, -3.849909, 1, 0, 0, 1, 1,
-0.6537517, -0.7431996, -1.414654, 1, 0, 0, 1, 1,
-0.6535378, -0.0298697, -3.282556, 1, 0, 0, 1, 1,
-0.6526176, 0.9343615, -0.9974657, 1, 0, 0, 1, 1,
-0.6521742, -0.5819398, -1.629399, 0, 0, 0, 1, 1,
-0.6502118, 1.46245, -0.06801834, 0, 0, 0, 1, 1,
-0.64775, -0.1957934, -1.726081, 0, 0, 0, 1, 1,
-0.6428492, 0.7236698, -1.220791, 0, 0, 0, 1, 1,
-0.6420218, -1.850638, -3.793038, 0, 0, 0, 1, 1,
-0.6410391, 0.03107623, -1.532853, 0, 0, 0, 1, 1,
-0.6395653, -0.3152592, -2.827291, 0, 0, 0, 1, 1,
-0.6330253, -1.970024, -2.819969, 1, 1, 1, 1, 1,
-0.6327351, -0.7753321, -0.6619574, 1, 1, 1, 1, 1,
-0.6316702, 1.205848, -0.7623274, 1, 1, 1, 1, 1,
-0.6303757, 0.6886395, -0.4729903, 1, 1, 1, 1, 1,
-0.6299234, -0.5255709, -2.844581, 1, 1, 1, 1, 1,
-0.628426, 0.2021348, -0.7297853, 1, 1, 1, 1, 1,
-0.6276345, 0.9983234, 0.2054599, 1, 1, 1, 1, 1,
-0.6274384, 1.204373, 0.1720572, 1, 1, 1, 1, 1,
-0.6266623, -0.7199162, -1.276832, 1, 1, 1, 1, 1,
-0.6252301, 0.201761, -0.2161911, 1, 1, 1, 1, 1,
-0.6202351, -1.199351, -1.553639, 1, 1, 1, 1, 1,
-0.6163448, -0.7509621, -2.459465, 1, 1, 1, 1, 1,
-0.6127273, -0.4391504, -3.556077, 1, 1, 1, 1, 1,
-0.6109551, -2.062672, -3.007439, 1, 1, 1, 1, 1,
-0.6083817, -0.2163111, -3.240222, 1, 1, 1, 1, 1,
-0.6065236, -0.1710215, -0.9244383, 0, 0, 1, 1, 1,
-0.6063353, -2.710592, -4.50778, 1, 0, 0, 1, 1,
-0.6040154, 1.065054, -0.8498929, 1, 0, 0, 1, 1,
-0.6016921, 0.5078312, -0.2459904, 1, 0, 0, 1, 1,
-0.6014181, -0.8599562, -2.601676, 1, 0, 0, 1, 1,
-0.5992354, -0.8801606, -1.820924, 1, 0, 0, 1, 1,
-0.5950127, 0.05608435, -2.269387, 0, 0, 0, 1, 1,
-0.5912975, 0.7826814, -0.1463214, 0, 0, 0, 1, 1,
-0.5911928, -0.9067101, -1.897819, 0, 0, 0, 1, 1,
-0.586998, 0.1341444, 0.1062232, 0, 0, 0, 1, 1,
-0.5855487, -0.7182333, -1.743836, 0, 0, 0, 1, 1,
-0.5854085, -1.477903, -4.444776, 0, 0, 0, 1, 1,
-0.5821119, 0.1123106, -0.9205021, 0, 0, 0, 1, 1,
-0.5798204, -0.2602818, -2.939476, 1, 1, 1, 1, 1,
-0.5785192, 1.311256, 0.7742543, 1, 1, 1, 1, 1,
-0.5755549, 0.1685332, -1.153889, 1, 1, 1, 1, 1,
-0.5681741, -0.6550142, -2.093844, 1, 1, 1, 1, 1,
-0.5657244, -0.0404317, -1.089197, 1, 1, 1, 1, 1,
-0.5652614, 1.02382, 0.8800622, 1, 1, 1, 1, 1,
-0.5643976, 1.619999, 0.4660822, 1, 1, 1, 1, 1,
-0.563777, 0.2363559, -0.3962373, 1, 1, 1, 1, 1,
-0.5481659, 0.319754, -0.192329, 1, 1, 1, 1, 1,
-0.5453849, -0.6869625, -1.033788, 1, 1, 1, 1, 1,
-0.544958, 1.202836, -2.065855, 1, 1, 1, 1, 1,
-0.5347504, -0.7122781, -2.693694, 1, 1, 1, 1, 1,
-0.5189506, 0.8998214, -0.9726341, 1, 1, 1, 1, 1,
-0.5172291, 0.4854053, -1.773814, 1, 1, 1, 1, 1,
-0.5085217, -1.210705, -3.824967, 1, 1, 1, 1, 1,
-0.5059358, 0.9095824, -0.02543818, 0, 0, 1, 1, 1,
-0.5021722, 0.3338088, 0.947648, 1, 0, 0, 1, 1,
-0.5000396, -0.2357741, -2.090756, 1, 0, 0, 1, 1,
-0.49762, 1.414183, -2.149157, 1, 0, 0, 1, 1,
-0.4972946, -0.5599878, -1.839372, 1, 0, 0, 1, 1,
-0.4967564, 0.7811629, -1.760115, 1, 0, 0, 1, 1,
-0.4937761, 0.8464813, 1.067181, 0, 0, 0, 1, 1,
-0.4851798, -0.03641629, -1.95245, 0, 0, 0, 1, 1,
-0.4851143, -0.1527775, -1.405104, 0, 0, 0, 1, 1,
-0.4828979, 1.478391, -0.1698648, 0, 0, 0, 1, 1,
-0.4786372, 0.9221873, 0.377503, 0, 0, 0, 1, 1,
-0.4778685, -2.188128, -2.797827, 0, 0, 0, 1, 1,
-0.4772551, -0.3082687, -2.000056, 0, 0, 0, 1, 1,
-0.4736102, 0.3172083, -0.2737833, 1, 1, 1, 1, 1,
-0.4719579, -0.9240662, -2.466749, 1, 1, 1, 1, 1,
-0.4704484, -0.4248226, -4.2594, 1, 1, 1, 1, 1,
-0.4670953, -0.4198642, -1.575816, 1, 1, 1, 1, 1,
-0.466529, -1.185293, -2.599212, 1, 1, 1, 1, 1,
-0.4592428, 0.1780914, -1.980109, 1, 1, 1, 1, 1,
-0.4590935, 0.674747, 0.3461021, 1, 1, 1, 1, 1,
-0.4567621, 1.104783, 0.7699565, 1, 1, 1, 1, 1,
-0.4538301, 0.9070284, -0.1882417, 1, 1, 1, 1, 1,
-0.4490831, -0.507772, -0.8593627, 1, 1, 1, 1, 1,
-0.4482298, -0.5979491, -2.518005, 1, 1, 1, 1, 1,
-0.4477442, -0.02344571, -1.848992, 1, 1, 1, 1, 1,
-0.4459269, 1.758691, -1.157905, 1, 1, 1, 1, 1,
-0.443274, -0.4561501, -2.577716, 1, 1, 1, 1, 1,
-0.4428048, -0.4801673, -1.24052, 1, 1, 1, 1, 1,
-0.4390972, -0.1225362, -2.860354, 0, 0, 1, 1, 1,
-0.4390027, -0.3781785, -0.1859003, 1, 0, 0, 1, 1,
-0.4379483, -1.064704, -2.544605, 1, 0, 0, 1, 1,
-0.4377044, -0.5686519, -3.784778, 1, 0, 0, 1, 1,
-0.4372965, 0.5402246, 0.8793575, 1, 0, 0, 1, 1,
-0.4342921, 0.6928093, -0.2023684, 1, 0, 0, 1, 1,
-0.4333613, 0.5623701, -1.067916, 0, 0, 0, 1, 1,
-0.426182, -1.04288, -2.535459, 0, 0, 0, 1, 1,
-0.4243892, 0.006451919, -1.281015, 0, 0, 0, 1, 1,
-0.4179731, -0.7047898, -1.016966, 0, 0, 0, 1, 1,
-0.4148682, 0.1473507, -1.423578, 0, 0, 0, 1, 1,
-0.4139966, 0.6980687, -1.34852, 0, 0, 0, 1, 1,
-0.4139913, 1.523319, 0.1154659, 0, 0, 0, 1, 1,
-0.4097898, 0.2716835, -0.4232343, 1, 1, 1, 1, 1,
-0.4095167, 0.09510724, -1.211388, 1, 1, 1, 1, 1,
-0.4056838, 2.146603, 0.3121634, 1, 1, 1, 1, 1,
-0.4047946, -1.416167, -4.253457, 1, 1, 1, 1, 1,
-0.4017422, 1.890507, 1.597254, 1, 1, 1, 1, 1,
-0.400694, -1.057391, -3.92386, 1, 1, 1, 1, 1,
-0.3985869, 0.9254655, 0.8677711, 1, 1, 1, 1, 1,
-0.3917897, 0.5535689, -0.007682045, 1, 1, 1, 1, 1,
-0.3905173, -0.8427387, -1.397238, 1, 1, 1, 1, 1,
-0.3848008, 0.6565362, -0.6389263, 1, 1, 1, 1, 1,
-0.3845313, 0.380071, -1.44745, 1, 1, 1, 1, 1,
-0.3803687, 0.6993383, 0.6997508, 1, 1, 1, 1, 1,
-0.3802892, -2.823318, -4.542296, 1, 1, 1, 1, 1,
-0.3769909, 0.5776731, -2.261503, 1, 1, 1, 1, 1,
-0.3754386, -1.041768, -3.996028, 1, 1, 1, 1, 1,
-0.3737718, -0.7706468, -2.551556, 0, 0, 1, 1, 1,
-0.3702622, 1.019043, -1.54696, 1, 0, 0, 1, 1,
-0.3699215, 0.5521255, -1.03846, 1, 0, 0, 1, 1,
-0.3693541, 1.087045, 1.149626, 1, 0, 0, 1, 1,
-0.3691982, 1.1792, -0.5650071, 1, 0, 0, 1, 1,
-0.3691564, 0.5256695, -0.8204693, 1, 0, 0, 1, 1,
-0.3660941, -1.514337, -2.536475, 0, 0, 0, 1, 1,
-0.3654307, 1.367958, 0.321173, 0, 0, 0, 1, 1,
-0.363483, 0.7043418, -0.6177026, 0, 0, 0, 1, 1,
-0.3615629, -1.036068, -3.49498, 0, 0, 0, 1, 1,
-0.3555975, -0.8599929, -3.035168, 0, 0, 0, 1, 1,
-0.3531691, -0.7230654, -3.890562, 0, 0, 0, 1, 1,
-0.3489318, 0.7274827, -1.233281, 0, 0, 0, 1, 1,
-0.3472194, 0.6493648, 0.555127, 1, 1, 1, 1, 1,
-0.3365007, 1.47817, 0.7047934, 1, 1, 1, 1, 1,
-0.3326674, 0.6442418, 0.07289707, 1, 1, 1, 1, 1,
-0.3294209, -0.8478833, -3.177974, 1, 1, 1, 1, 1,
-0.3255699, -0.5528514, -2.056653, 1, 1, 1, 1, 1,
-0.3210255, 0.1317958, -1.633813, 1, 1, 1, 1, 1,
-0.3206462, -1.048422, -3.187736, 1, 1, 1, 1, 1,
-0.3180905, -0.6602042, -1.290596, 1, 1, 1, 1, 1,
-0.3145775, -0.4693846, -3.266878, 1, 1, 1, 1, 1,
-0.3125646, -1.405906, -1.720818, 1, 1, 1, 1, 1,
-0.311063, 0.477651, -0.1252113, 1, 1, 1, 1, 1,
-0.3049161, 0.7577038, -0.359747, 1, 1, 1, 1, 1,
-0.3022474, 0.8941131, 1.326388, 1, 1, 1, 1, 1,
-0.3021514, 2.57532, 0.7767971, 1, 1, 1, 1, 1,
-0.3013861, 0.629764, -0.3735412, 1, 1, 1, 1, 1,
-0.2990586, -0.3715702, -1.785545, 0, 0, 1, 1, 1,
-0.29675, -0.5444975, -1.715786, 1, 0, 0, 1, 1,
-0.2903119, -0.2762174, -3.518248, 1, 0, 0, 1, 1,
-0.2896584, 0.1744669, -1.153036, 1, 0, 0, 1, 1,
-0.2880495, 1.046533, 0.8726975, 1, 0, 0, 1, 1,
-0.2817751, 1.119696, 0.9106364, 1, 0, 0, 1, 1,
-0.2772215, 0.7471258, -1.025052, 0, 0, 0, 1, 1,
-0.2769865, 1.506104, 1.311733, 0, 0, 0, 1, 1,
-0.2755803, -0.7630901, -3.345416, 0, 0, 0, 1, 1,
-0.2736299, 0.6331902, -1.289145, 0, 0, 0, 1, 1,
-0.2709113, 1.998851, -1.332389, 0, 0, 0, 1, 1,
-0.2622366, -0.5926242, -4.341248, 0, 0, 0, 1, 1,
-0.2541196, 1.456974, 0.9393399, 0, 0, 0, 1, 1,
-0.253127, 0.8922944, -0.7959028, 1, 1, 1, 1, 1,
-0.2421637, -1.776245, -3.080677, 1, 1, 1, 1, 1,
-0.2412453, -0.3223193, -2.100393, 1, 1, 1, 1, 1,
-0.2400258, 1.654698, -0.4458988, 1, 1, 1, 1, 1,
-0.2379969, -0.7661921, -1.179751, 1, 1, 1, 1, 1,
-0.2373422, 0.2812135, -7.1915e-05, 1, 1, 1, 1, 1,
-0.236736, 1.046868, -1.577464, 1, 1, 1, 1, 1,
-0.2348656, 0.6326956, -0.1378878, 1, 1, 1, 1, 1,
-0.231507, -0.4691426, -2.905001, 1, 1, 1, 1, 1,
-0.2236981, 0.3843378, -1.565001, 1, 1, 1, 1, 1,
-0.2222929, -0.1472595, -3.753649, 1, 1, 1, 1, 1,
-0.2211343, 1.165532, 0.6874991, 1, 1, 1, 1, 1,
-0.2173964, 0.5851025, -2.960148, 1, 1, 1, 1, 1,
-0.2163216, 0.08392397, -1.659993, 1, 1, 1, 1, 1,
-0.2122995, -0.6481041, -3.896044, 1, 1, 1, 1, 1,
-0.2093431, 2.186686, -1.362312, 0, 0, 1, 1, 1,
-0.2074425, 0.4172102, -0.8313261, 1, 0, 0, 1, 1,
-0.2042755, -1.237534, -2.091383, 1, 0, 0, 1, 1,
-0.2041176, -1.308051, -2.594784, 1, 0, 0, 1, 1,
-0.2037802, -1.090599, -2.42953, 1, 0, 0, 1, 1,
-0.2033586, 0.6908122, 0.1098134, 1, 0, 0, 1, 1,
-0.1987393, -0.2536989, -3.943863, 0, 0, 0, 1, 1,
-0.1935177, -0.6262743, -0.8909062, 0, 0, 0, 1, 1,
-0.192424, 1.232126, 1.43716, 0, 0, 0, 1, 1,
-0.1919476, -0.4576839, -0.9272848, 0, 0, 0, 1, 1,
-0.1891547, -1.09188, -2.302663, 0, 0, 0, 1, 1,
-0.1842447, 0.3010083, 0.02042154, 0, 0, 0, 1, 1,
-0.1829617, -0.2897162, -1.71946, 0, 0, 0, 1, 1,
-0.1825185, 0.2417277, 0.1076079, 1, 1, 1, 1, 1,
-0.1736416, -1.020831, -3.5384, 1, 1, 1, 1, 1,
-0.171471, 0.3593326, -2.632382, 1, 1, 1, 1, 1,
-0.1714298, 0.2735033, -0.232181, 1, 1, 1, 1, 1,
-0.1677494, 0.09027313, -1.231718, 1, 1, 1, 1, 1,
-0.1564636, -0.5892088, -4.906024, 1, 1, 1, 1, 1,
-0.1545412, -0.06519275, -1.385873, 1, 1, 1, 1, 1,
-0.1499716, -1.296545, -2.765393, 1, 1, 1, 1, 1,
-0.1448323, 0.4932012, -1.44453, 1, 1, 1, 1, 1,
-0.139871, -0.6554602, -3.387381, 1, 1, 1, 1, 1,
-0.1356602, -0.9347321, -2.425454, 1, 1, 1, 1, 1,
-0.1331595, 1.628587, 0.6822419, 1, 1, 1, 1, 1,
-0.130495, -0.4974651, -4.757754, 1, 1, 1, 1, 1,
-0.1227542, 0.3837433, 0.08705314, 1, 1, 1, 1, 1,
-0.1222962, 0.8895604, -1.053565, 1, 1, 1, 1, 1,
-0.1216288, -0.3908445, -3.898672, 0, 0, 1, 1, 1,
-0.1209121, 0.2099355, 1.539423, 1, 0, 0, 1, 1,
-0.1180495, 0.1417938, -0.4814376, 1, 0, 0, 1, 1,
-0.1150766, 0.3761513, 0.09850866, 1, 0, 0, 1, 1,
-0.114949, 0.5391828, -0.6559342, 1, 0, 0, 1, 1,
-0.1145259, -0.04814839, -1.859761, 1, 0, 0, 1, 1,
-0.1031765, -0.5204668, -3.918474, 0, 0, 0, 1, 1,
-0.09595985, 0.3913072, -0.3109035, 0, 0, 0, 1, 1,
-0.09532244, -0.3760572, -2.871188, 0, 0, 0, 1, 1,
-0.09432097, -0.9459785, -3.067569, 0, 0, 0, 1, 1,
-0.09394061, -2.213608, -1.344867, 0, 0, 0, 1, 1,
-0.09310658, -0.4832819, -3.587747, 0, 0, 0, 1, 1,
-0.0922472, 0.8707514, -1.299858, 0, 0, 0, 1, 1,
-0.09093119, 0.658004, -0.7593871, 1, 1, 1, 1, 1,
-0.08567768, -1.081511, -2.149651, 1, 1, 1, 1, 1,
-0.08231399, -0.02147143, -1.678752, 1, 1, 1, 1, 1,
-0.07798523, 0.7803648, -1.392128, 1, 1, 1, 1, 1,
-0.07369053, -0.3199244, -4.108581, 1, 1, 1, 1, 1,
-0.07266487, -0.8126663, -1.481169, 1, 1, 1, 1, 1,
-0.05973563, -0.4549591, -3.197886, 1, 1, 1, 1, 1,
-0.05962206, 0.6325669, -0.8292142, 1, 1, 1, 1, 1,
-0.05602355, -0.8681273, -4.358776, 1, 1, 1, 1, 1,
-0.04608167, -1.444561, -3.234803, 1, 1, 1, 1, 1,
-0.04433826, -0.5500372, -2.251969, 1, 1, 1, 1, 1,
-0.04084128, -0.0198676, -0.9656336, 1, 1, 1, 1, 1,
-0.03976542, 1.813323, 1.444224, 1, 1, 1, 1, 1,
-0.03711674, -0.7053711, -3.436016, 1, 1, 1, 1, 1,
-0.0343223, -2.810713, -4.898657, 1, 1, 1, 1, 1,
-0.03228863, -0.6917033, -1.681198, 0, 0, 1, 1, 1,
-0.02903826, -0.5824502, -1.963708, 1, 0, 0, 1, 1,
-0.02813293, 0.3895301, -0.6214722, 1, 0, 0, 1, 1,
-0.02730337, -0.258706, -3.735051, 1, 0, 0, 1, 1,
-0.02547513, -2.919126, -1.720373, 1, 0, 0, 1, 1,
-0.02508174, -0.0756174, -0.1984769, 1, 0, 0, 1, 1,
-0.02216096, -1.302601, -1.790689, 0, 0, 0, 1, 1,
-0.01363783, -1.970389, -1.415286, 0, 0, 0, 1, 1,
-0.01089198, 0.4698397, -0.9611968, 0, 0, 0, 1, 1,
-0.009813735, 0.8549796, -0.01348522, 0, 0, 0, 1, 1,
-0.009603912, -0.1667567, -1.952993, 0, 0, 0, 1, 1,
-0.007356957, -0.6195147, -2.857215, 0, 0, 0, 1, 1,
-0.007228222, -0.2912549, -3.572934, 0, 0, 0, 1, 1,
-0.007117372, 1.519352, -0.05824725, 1, 1, 1, 1, 1,
-0.005555736, 0.4171807, 1.038165, 1, 1, 1, 1, 1,
6.342489e-05, 1.522313, 0.7564849, 1, 1, 1, 1, 1,
0.002177359, -0.2262258, 4.261074, 1, 1, 1, 1, 1,
0.005984712, -2.058331, 2.648973, 1, 1, 1, 1, 1,
0.007023195, 1.571084, -0.3228327, 1, 1, 1, 1, 1,
0.007804275, 1.432204, 0.5286168, 1, 1, 1, 1, 1,
0.009697933, 1.04003, -0.6230111, 1, 1, 1, 1, 1,
0.01225722, 0.3446727, 0.1428003, 1, 1, 1, 1, 1,
0.01249114, -0.4500958, 3.06393, 1, 1, 1, 1, 1,
0.0154357, -0.7652854, 3.942329, 1, 1, 1, 1, 1,
0.01729215, 1.619586, -0.2694249, 1, 1, 1, 1, 1,
0.01808745, 2.431809, -0.950704, 1, 1, 1, 1, 1,
0.01890167, 0.7988217, -0.242648, 1, 1, 1, 1, 1,
0.02260215, -0.03196047, 2.940277, 1, 1, 1, 1, 1,
0.02598184, -1.624133, 3.115221, 0, 0, 1, 1, 1,
0.02747963, 0.7492959, 1.406037, 1, 0, 0, 1, 1,
0.02802281, 1.268575, 0.7673103, 1, 0, 0, 1, 1,
0.02896443, 0.5779518, 0.4926222, 1, 0, 0, 1, 1,
0.03277587, -0.04409271, 3.153644, 1, 0, 0, 1, 1,
0.0329068, 1.257523, 1.958293, 1, 0, 0, 1, 1,
0.03430337, 2.144953, 0.3725212, 0, 0, 0, 1, 1,
0.04099246, -0.2685316, 1.818334, 0, 0, 0, 1, 1,
0.04153444, 0.470895, 1.15853, 0, 0, 0, 1, 1,
0.04238442, -0.7513359, 2.283099, 0, 0, 0, 1, 1,
0.04630079, 2.311751, 0.07508918, 0, 0, 0, 1, 1,
0.05160928, 0.9236987, -0.8564461, 0, 0, 0, 1, 1,
0.05569963, 0.928652, 0.2409862, 0, 0, 0, 1, 1,
0.05613719, -0.5680721, 2.703966, 1, 1, 1, 1, 1,
0.056691, -1.207262, 2.06622, 1, 1, 1, 1, 1,
0.05702693, 0.7032006, 0.7440479, 1, 1, 1, 1, 1,
0.05961226, 1.92216, -1.390445, 1, 1, 1, 1, 1,
0.06258295, -0.3508085, 1.513659, 1, 1, 1, 1, 1,
0.06264127, 0.5866038, -2.198812, 1, 1, 1, 1, 1,
0.06545637, -2.542339, 2.213835, 1, 1, 1, 1, 1,
0.06868222, 1.043284, -0.76006, 1, 1, 1, 1, 1,
0.07202733, 0.8039885, -1.716716, 1, 1, 1, 1, 1,
0.07581882, 0.4307971, 0.4385333, 1, 1, 1, 1, 1,
0.08070172, 1.386584, -0.8172249, 1, 1, 1, 1, 1,
0.08086684, 2.145355, -1.057961, 1, 1, 1, 1, 1,
0.08307347, 0.6673055, -0.195082, 1, 1, 1, 1, 1,
0.08910932, -0.7519972, 2.753982, 1, 1, 1, 1, 1,
0.09160824, -1.48942, 2.199979, 1, 1, 1, 1, 1,
0.09330769, 0.94738, 0.6628662, 0, 0, 1, 1, 1,
0.09478638, -1.605402, 2.416972, 1, 0, 0, 1, 1,
0.1038171, -0.128634, 4.642306, 1, 0, 0, 1, 1,
0.1048915, -0.4404137, 4.62871, 1, 0, 0, 1, 1,
0.1056109, 1.546039, -0.9915659, 1, 0, 0, 1, 1,
0.1070069, 2.165102, -0.02902078, 1, 0, 0, 1, 1,
0.1087259, 1.097358, -0.2390874, 0, 0, 0, 1, 1,
0.1099917, -0.4489568, 3.744596, 0, 0, 0, 1, 1,
0.1149165, -0.2135421, 2.313154, 0, 0, 0, 1, 1,
0.1201028, -1.258709, 1.994621, 0, 0, 0, 1, 1,
0.1218868, 1.226672, 0.1644886, 0, 0, 0, 1, 1,
0.1244529, 1.632669, -0.2396031, 0, 0, 0, 1, 1,
0.1246854, 0.4215522, -0.5795332, 0, 0, 0, 1, 1,
0.1270434, 0.01197538, 2.115935, 1, 1, 1, 1, 1,
0.1296652, 0.8259879, 1.154784, 1, 1, 1, 1, 1,
0.137425, 0.6261492, 0.2897405, 1, 1, 1, 1, 1,
0.1380308, -0.195095, 2.30336, 1, 1, 1, 1, 1,
0.1383003, -1.012077, 3.361307, 1, 1, 1, 1, 1,
0.1407748, 0.9502035, 1.443872, 1, 1, 1, 1, 1,
0.141191, 0.2486591, 0.1025077, 1, 1, 1, 1, 1,
0.1482755, -1.390826, 2.718245, 1, 1, 1, 1, 1,
0.14928, -0.1227916, 3.5316, 1, 1, 1, 1, 1,
0.1514095, 0.02787818, 2.730156, 1, 1, 1, 1, 1,
0.1527919, -0.9119462, 3.292142, 1, 1, 1, 1, 1,
0.1529139, -1.725286, 4.333135, 1, 1, 1, 1, 1,
0.1566026, -1.233447, 4.085808, 1, 1, 1, 1, 1,
0.1571927, 0.7072601, -0.8347479, 1, 1, 1, 1, 1,
0.1588689, -0.04204104, 1.580131, 1, 1, 1, 1, 1,
0.1588975, -0.3256493, 3.799397, 0, 0, 1, 1, 1,
0.1633296, 1.152399, -0.01643969, 1, 0, 0, 1, 1,
0.1649836, -1.424006, 3.021391, 1, 0, 0, 1, 1,
0.1669483, -0.4641522, 3.383077, 1, 0, 0, 1, 1,
0.1670558, 0.7974085, 0.8242123, 1, 0, 0, 1, 1,
0.1678119, -0.09039799, 3.328873, 1, 0, 0, 1, 1,
0.1704532, -1.67537, 5.033411, 0, 0, 0, 1, 1,
0.1780298, 1.30285, 1.443545, 0, 0, 0, 1, 1,
0.178916, -0.6932788, 3.368192, 0, 0, 0, 1, 1,
0.178975, 1.146521, 0.5111197, 0, 0, 0, 1, 1,
0.1813056, 0.08908635, 1.892756, 0, 0, 0, 1, 1,
0.183636, 0.7289709, 0.5897568, 0, 0, 0, 1, 1,
0.1852024, -0.334977, 3.106186, 0, 0, 0, 1, 1,
0.185656, 0.4125908, -0.828233, 1, 1, 1, 1, 1,
0.1870117, 0.794757, -0.3776508, 1, 1, 1, 1, 1,
0.1885676, -0.6274507, 3.058447, 1, 1, 1, 1, 1,
0.1887094, 0.5970477, 1.170781, 1, 1, 1, 1, 1,
0.1889001, -0.3268818, 2.184676, 1, 1, 1, 1, 1,
0.1914207, -0.6924064, 1.720305, 1, 1, 1, 1, 1,
0.1928576, -0.3518046, 1.226036, 1, 1, 1, 1, 1,
0.195808, -1.04846, 3.39875, 1, 1, 1, 1, 1,
0.1983979, -1.001301, 3.090781, 1, 1, 1, 1, 1,
0.2011485, -0.1238176, 2.886608, 1, 1, 1, 1, 1,
0.2016108, 0.4298316, -0.3771776, 1, 1, 1, 1, 1,
0.2019961, -0.01771529, 1.531784, 1, 1, 1, 1, 1,
0.2053836, -2.561637, 5.157734, 1, 1, 1, 1, 1,
0.2104214, -1.104475, 1.964701, 1, 1, 1, 1, 1,
0.2119485, -0.5744048, 2.462406, 1, 1, 1, 1, 1,
0.2124434, -1.564885, 1.272156, 0, 0, 1, 1, 1,
0.212543, 0.8460929, -2.703273, 1, 0, 0, 1, 1,
0.2128481, -0.09032641, 3.082195, 1, 0, 0, 1, 1,
0.2138365, 1.59639, 0.7706996, 1, 0, 0, 1, 1,
0.217602, -1.596514, 5.169976, 1, 0, 0, 1, 1,
0.2209526, 0.3353116, 0.4484673, 1, 0, 0, 1, 1,
0.2223969, 0.1290175, 0.3015543, 0, 0, 0, 1, 1,
0.2229291, -0.1989238, 0.3603659, 0, 0, 0, 1, 1,
0.2244278, 2.40589, 0.4811524, 0, 0, 0, 1, 1,
0.2288299, 0.2193487, 1.79909, 0, 0, 0, 1, 1,
0.231851, 0.7542028, 0.7033132, 0, 0, 0, 1, 1,
0.234892, -1.257461, 3.120187, 0, 0, 0, 1, 1,
0.237175, -1.725784, 2.028283, 0, 0, 0, 1, 1,
0.237981, 0.2717606, 1.305729, 1, 1, 1, 1, 1,
0.2423883, -0.1713842, 2.792957, 1, 1, 1, 1, 1,
0.2425261, 0.1039285, 1.49831, 1, 1, 1, 1, 1,
0.2468256, 0.2492719, -0.05843052, 1, 1, 1, 1, 1,
0.2493142, 2.664596, -0.3722592, 1, 1, 1, 1, 1,
0.2566186, -0.3238046, 2.473196, 1, 1, 1, 1, 1,
0.2583451, 1.094787, 0.6825776, 1, 1, 1, 1, 1,
0.2601012, -1.125091, 3.568271, 1, 1, 1, 1, 1,
0.2604929, -0.6656879, 3.987977, 1, 1, 1, 1, 1,
0.2622319, -1.090307, 3.289359, 1, 1, 1, 1, 1,
0.2632126, 1.012116, 0.3014507, 1, 1, 1, 1, 1,
0.2668117, 0.1320857, 0.1475761, 1, 1, 1, 1, 1,
0.2669028, 1.455351, -1.65303, 1, 1, 1, 1, 1,
0.272355, 1.166764, 1.523462, 1, 1, 1, 1, 1,
0.2740514, -0.3109853, 2.025183, 1, 1, 1, 1, 1,
0.2741233, -1.442054, 4.146418, 0, 0, 1, 1, 1,
0.2764755, -0.5091515, 2.224685, 1, 0, 0, 1, 1,
0.2778708, -0.1768811, 0.5698727, 1, 0, 0, 1, 1,
0.27903, 0.8763438, -0.3998778, 1, 0, 0, 1, 1,
0.2793761, 2.472138, 0.2187518, 1, 0, 0, 1, 1,
0.2799683, -1.935908, 2.775633, 1, 0, 0, 1, 1,
0.2800876, -1.894624, 3.837259, 0, 0, 0, 1, 1,
0.2845298, -1.717644, 3.990577, 0, 0, 0, 1, 1,
0.2865973, -1.530948, 2.013728, 0, 0, 0, 1, 1,
0.2889214, 1.899934, 0.1515897, 0, 0, 0, 1, 1,
0.2917954, -2.235842, 2.224732, 0, 0, 0, 1, 1,
0.2947216, 1.026314, 0.3160841, 0, 0, 0, 1, 1,
0.2966614, -0.9575794, 1.629573, 0, 0, 0, 1, 1,
0.2988321, -0.1954565, 3.023752, 1, 1, 1, 1, 1,
0.3004288, -0.7012734, 4.030698, 1, 1, 1, 1, 1,
0.3054205, -0.5882871, 1.50875, 1, 1, 1, 1, 1,
0.3064961, -0.5170727, 3.362073, 1, 1, 1, 1, 1,
0.3066918, -0.3673968, 3.997266, 1, 1, 1, 1, 1,
0.312266, -1.017526, 4.970569, 1, 1, 1, 1, 1,
0.3138254, -0.08775783, 1.59579, 1, 1, 1, 1, 1,
0.3142127, -0.02752361, 1.256158, 1, 1, 1, 1, 1,
0.3167718, 0.08881143, 2.261956, 1, 1, 1, 1, 1,
0.3177776, -0.1616389, 1.962064, 1, 1, 1, 1, 1,
0.3229079, 1.011084, 2.05209, 1, 1, 1, 1, 1,
0.3275932, 0.1897145, 0.3295144, 1, 1, 1, 1, 1,
0.3318959, -0.782115, 1.344736, 1, 1, 1, 1, 1,
0.3382577, -1.11611, 4.243515, 1, 1, 1, 1, 1,
0.3406584, -0.04722989, -0.3306453, 1, 1, 1, 1, 1,
0.3419834, -1.635391, 2.756101, 0, 0, 1, 1, 1,
0.3445031, 1.848416, 0.823305, 1, 0, 0, 1, 1,
0.3467984, -0.4362088, 3.349817, 1, 0, 0, 1, 1,
0.3557928, -1.544768, 2.604034, 1, 0, 0, 1, 1,
0.3558418, 0.2400286, 0.8232644, 1, 0, 0, 1, 1,
0.3594899, -1.133665, 2.538291, 1, 0, 0, 1, 1,
0.3604763, -0.5425271, 4.068328, 0, 0, 0, 1, 1,
0.3630292, -1.371437, 2.819006, 0, 0, 0, 1, 1,
0.3655804, -0.06342588, 1.867652, 0, 0, 0, 1, 1,
0.3657598, -0.4416938, 2.215217, 0, 0, 0, 1, 1,
0.3674663, -2.058627, 4.072402, 0, 0, 0, 1, 1,
0.3677986, 0.1172941, 1.142896, 0, 0, 0, 1, 1,
0.3692268, 0.9345435, 0.8152642, 0, 0, 0, 1, 1,
0.3705967, 0.6435497, 0.6089846, 1, 1, 1, 1, 1,
0.3741741, -1.087988, 1.01628, 1, 1, 1, 1, 1,
0.3763804, -0.3596729, 2.171661, 1, 1, 1, 1, 1,
0.3816377, -0.334533, 1.087628, 1, 1, 1, 1, 1,
0.3878422, -1.510013, 1.998831, 1, 1, 1, 1, 1,
0.3906422, -1.632945, 1.318096, 1, 1, 1, 1, 1,
0.3950276, 0.4773907, -0.4333066, 1, 1, 1, 1, 1,
0.4012842, -0.7332816, 2.230807, 1, 1, 1, 1, 1,
0.4016887, -1.021481, 3.595468, 1, 1, 1, 1, 1,
0.4022854, -0.8176439, 2.631575, 1, 1, 1, 1, 1,
0.4033976, 0.2635473, 0.1830958, 1, 1, 1, 1, 1,
0.4040155, -1.066747, 2.905469, 1, 1, 1, 1, 1,
0.4058831, -1.623693, 2.937346, 1, 1, 1, 1, 1,
0.4079148, -1.401289, 1.768281, 1, 1, 1, 1, 1,
0.4117563, -0.01391418, 1.07512, 1, 1, 1, 1, 1,
0.4135502, -1.953405, 3.800826, 0, 0, 1, 1, 1,
0.4235454, 0.7654704, 0.5185486, 1, 0, 0, 1, 1,
0.4252486, 0.2767096, 1.153836, 1, 0, 0, 1, 1,
0.4433936, 0.159288, 0.6578985, 1, 0, 0, 1, 1,
0.4465178, -0.7077936, 3.889869, 1, 0, 0, 1, 1,
0.4497647, 0.5314169, -0.5699014, 1, 0, 0, 1, 1,
0.450659, -0.4804725, 0.5553983, 0, 0, 0, 1, 1,
0.4536299, 1.771341, -0.3262272, 0, 0, 0, 1, 1,
0.4552689, 0.2954554, 0.8956656, 0, 0, 0, 1, 1,
0.4563749, 0.7426962, 0.07658372, 0, 0, 0, 1, 1,
0.4569465, 0.3045019, 2.293037, 0, 0, 0, 1, 1,
0.4569742, 1.297309, 0.259841, 0, 0, 0, 1, 1,
0.4625953, 1.354373, 0.2034108, 0, 0, 0, 1, 1,
0.4651949, 1.074028, -0.0371969, 1, 1, 1, 1, 1,
0.4661529, -0.3141902, 3.164094, 1, 1, 1, 1, 1,
0.4704817, 0.5396366, 0.5252979, 1, 1, 1, 1, 1,
0.4723903, 0.9914399, -0.8284147, 1, 1, 1, 1, 1,
0.4812189, -0.3348061, 2.159144, 1, 1, 1, 1, 1,
0.4820907, 0.3155005, 0.8137115, 1, 1, 1, 1, 1,
0.4828737, -0.4883048, 1.660346, 1, 1, 1, 1, 1,
0.4851479, -1.822659, 1.825002, 1, 1, 1, 1, 1,
0.4860466, 0.4173817, -0.3174319, 1, 1, 1, 1, 1,
0.4918019, 0.1087271, 1.281616, 1, 1, 1, 1, 1,
0.4921443, -1.500364, 1.690951, 1, 1, 1, 1, 1,
0.4930157, -0.856012, 3.816441, 1, 1, 1, 1, 1,
0.4939626, 0.5104374, 1.458096, 1, 1, 1, 1, 1,
0.4963898, 0.3016871, -0.6629457, 1, 1, 1, 1, 1,
0.4975122, -1.26994, 1.529439, 1, 1, 1, 1, 1,
0.4989439, 1.25694, -0.5397637, 0, 0, 1, 1, 1,
0.5010755, 1.258608, -0.4621255, 1, 0, 0, 1, 1,
0.5029365, -1.191475, 2.717101, 1, 0, 0, 1, 1,
0.5051984, -0.1165621, 1.462953, 1, 0, 0, 1, 1,
0.5059994, -0.05050761, 1.107516, 1, 0, 0, 1, 1,
0.5065914, 0.2593137, 1.15562, 1, 0, 0, 1, 1,
0.5074147, 3.07026, 0.7790416, 0, 0, 0, 1, 1,
0.5089925, 1.54443, 0.2547058, 0, 0, 0, 1, 1,
0.5092924, -0.4795048, 3.479565, 0, 0, 0, 1, 1,
0.5094114, 0.2572395, 0.647416, 0, 0, 0, 1, 1,
0.5102395, -0.4843255, 1.974517, 0, 0, 0, 1, 1,
0.5127923, 0.7829651, 0.9518583, 0, 0, 0, 1, 1,
0.5139136, -0.5497109, 1.363068, 0, 0, 0, 1, 1,
0.5225749, 0.2943318, -0.4307412, 1, 1, 1, 1, 1,
0.5248317, 0.3549356, 1.47143, 1, 1, 1, 1, 1,
0.5269019, -1.418593, 1.813901, 1, 1, 1, 1, 1,
0.5283462, 2.111895, 1.553285, 1, 1, 1, 1, 1,
0.5285341, -0.3384256, 3.333993, 1, 1, 1, 1, 1,
0.532751, 0.2623145, -0.1658425, 1, 1, 1, 1, 1,
0.5358739, -0.8210268, 3.966795, 1, 1, 1, 1, 1,
0.5366591, -1.741456, 3.546528, 1, 1, 1, 1, 1,
0.5441129, -1.672227, 3.266712, 1, 1, 1, 1, 1,
0.5491403, 1.515895, 1.367483, 1, 1, 1, 1, 1,
0.551849, 0.5488373, -0.07066447, 1, 1, 1, 1, 1,
0.5625975, -0.1286218, 2.135792, 1, 1, 1, 1, 1,
0.5662123, -0.1651537, 2.587893, 1, 1, 1, 1, 1,
0.5672528, 1.762681, 1.335797, 1, 1, 1, 1, 1,
0.5729533, 0.9618817, 2.351079, 1, 1, 1, 1, 1,
0.574869, -1.523538, 3.740827, 0, 0, 1, 1, 1,
0.5795437, 0.08477513, 0.7806917, 1, 0, 0, 1, 1,
0.584771, 1.399367, -0.02418482, 1, 0, 0, 1, 1,
0.5882735, -1.433408, 3.853632, 1, 0, 0, 1, 1,
0.5900487, -1.287848, 1.26127, 1, 0, 0, 1, 1,
0.5905517, -0.02402813, 1.849942, 1, 0, 0, 1, 1,
0.5954039, 0.7883759, -0.8505817, 0, 0, 0, 1, 1,
0.5987464, 0.1478598, 0.6177633, 0, 0, 0, 1, 1,
0.5995457, 0.1383598, 0.8533375, 0, 0, 0, 1, 1,
0.6013924, 0.4424483, 0.4721514, 0, 0, 0, 1, 1,
0.6248866, -1.495701, 3.180465, 0, 0, 0, 1, 1,
0.6252838, 0.7402601, -1.359258, 0, 0, 0, 1, 1,
0.6274117, 1.530854, 1.169095, 0, 0, 0, 1, 1,
0.6277879, -0.6215904, 2.936786, 1, 1, 1, 1, 1,
0.6337831, -1.079117, 3.738505, 1, 1, 1, 1, 1,
0.6353524, 1.014162, 0.4628983, 1, 1, 1, 1, 1,
0.6430038, -1.689076, 2.671336, 1, 1, 1, 1, 1,
0.6442255, 0.4661412, 0.9173165, 1, 1, 1, 1, 1,
0.6451758, -0.459246, 1.716811, 1, 1, 1, 1, 1,
0.6471099, -1.21148, 3.313507, 1, 1, 1, 1, 1,
0.647661, -1.776515, 2.142381, 1, 1, 1, 1, 1,
0.6490474, 0.7994397, 0.224043, 1, 1, 1, 1, 1,
0.6528949, -1.469502, 4.425833, 1, 1, 1, 1, 1,
0.6530181, -0.6863211, 3.322747, 1, 1, 1, 1, 1,
0.6603822, 0.6166099, 2.415435, 1, 1, 1, 1, 1,
0.6607625, 0.5692509, -0.3269771, 1, 1, 1, 1, 1,
0.6618211, 1.049867, 1.228658, 1, 1, 1, 1, 1,
0.6649339, -0.9423609, 1.254694, 1, 1, 1, 1, 1,
0.6820625, 1.006886, -0.9647546, 0, 0, 1, 1, 1,
0.688063, 1.369234, 0.4595908, 1, 0, 0, 1, 1,
0.6903443, 0.2086905, 0.2971573, 1, 0, 0, 1, 1,
0.6917731, 0.5295094, -0.7093642, 1, 0, 0, 1, 1,
0.6980298, 0.557777, 0.6542326, 1, 0, 0, 1, 1,
0.7032779, -0.02456639, 0.5626685, 1, 0, 0, 1, 1,
0.7055735, 0.0608759, 0.8955564, 0, 0, 0, 1, 1,
0.7119959, -0.5307965, 2.876245, 0, 0, 0, 1, 1,
0.7167205, -0.2402896, 1.357483, 0, 0, 0, 1, 1,
0.7227052, -0.2330293, 3.052293, 0, 0, 0, 1, 1,
0.7228548, 0.3395335, 1.904692, 0, 0, 0, 1, 1,
0.7237832, 0.2026246, 1.761394, 0, 0, 0, 1, 1,
0.726107, 0.01096238, 2.960524, 0, 0, 0, 1, 1,
0.7286608, -0.6841409, 1.263661, 1, 1, 1, 1, 1,
0.7301309, 2.981627, 1.497202, 1, 1, 1, 1, 1,
0.7326783, -0.7371954, 3.129219, 1, 1, 1, 1, 1,
0.7327959, -0.9782632, 1.450205, 1, 1, 1, 1, 1,
0.7347291, -0.6101141, 2.282785, 1, 1, 1, 1, 1,
0.7350616, -2.619152, 2.952756, 1, 1, 1, 1, 1,
0.7359768, 2.41442, 0.100569, 1, 1, 1, 1, 1,
0.7409284, 1.912048, 0.6871894, 1, 1, 1, 1, 1,
0.7433735, 0.8763914, 0.1402226, 1, 1, 1, 1, 1,
0.7455382, 0.8150014, 1.994334, 1, 1, 1, 1, 1,
0.7509359, 0.1571803, -0.7039529, 1, 1, 1, 1, 1,
0.7516203, 0.29057, 1.849248, 1, 1, 1, 1, 1,
0.7543101, -1.570237, 3.177157, 1, 1, 1, 1, 1,
0.7548524, -0.2240431, 1.210546, 1, 1, 1, 1, 1,
0.755215, -0.1101913, 1.382779, 1, 1, 1, 1, 1,
0.7573905, 1.053041, -1.022407, 0, 0, 1, 1, 1,
0.7575297, 1.334069, 1.083898, 1, 0, 0, 1, 1,
0.7613357, -0.4001413, 0.8042157, 1, 0, 0, 1, 1,
0.7634604, 0.0473939, 1.972392, 1, 0, 0, 1, 1,
0.7651814, 0.6526636, -0.001973064, 1, 0, 0, 1, 1,
0.768016, 0.1174644, 2.002115, 1, 0, 0, 1, 1,
0.7723548, -0.6009808, 2.090549, 0, 0, 0, 1, 1,
0.7759197, 1.108513, 0.7651597, 0, 0, 0, 1, 1,
0.7759383, -0.1111065, 2.320736, 0, 0, 0, 1, 1,
0.777431, 0.7902304, 2.104606, 0, 0, 0, 1, 1,
0.7806373, 0.7496299, 1.510858, 0, 0, 0, 1, 1,
0.7811127, 1.933124, 1.468529, 0, 0, 0, 1, 1,
0.7833061, 1.710787, 1.818753, 0, 0, 0, 1, 1,
0.7965345, -0.2447742, 1.128082, 1, 1, 1, 1, 1,
0.7985871, -0.9291798, 1.090825, 1, 1, 1, 1, 1,
0.7994772, 1.638562, 0.3784003, 1, 1, 1, 1, 1,
0.8030508, -0.1473844, 3.503462, 1, 1, 1, 1, 1,
0.8037978, -2.2115, 0.5558835, 1, 1, 1, 1, 1,
0.811523, 0.8944541, 1.843166, 1, 1, 1, 1, 1,
0.8145956, -1.071962, 2.015769, 1, 1, 1, 1, 1,
0.8146868, 0.4936467, 1.702981, 1, 1, 1, 1, 1,
0.8218933, 0.1949167, 2.849549, 1, 1, 1, 1, 1,
0.8220522, 0.6544505, 1.241696, 1, 1, 1, 1, 1,
0.8229539, -0.2870286, 3.009617, 1, 1, 1, 1, 1,
0.8241185, -0.4918386, 1.997864, 1, 1, 1, 1, 1,
0.8374503, -0.8311311, 2.093265, 1, 1, 1, 1, 1,
0.8399354, 1.52424, 0.4795439, 1, 1, 1, 1, 1,
0.8404567, 0.05585343, 2.989207, 1, 1, 1, 1, 1,
0.8412178, -2.198282, 2.884079, 0, 0, 1, 1, 1,
0.842613, -1.123463, 3.527097, 1, 0, 0, 1, 1,
0.8499255, -0.5971131, 2.09708, 1, 0, 0, 1, 1,
0.8511713, 0.01051071, 0.5441024, 1, 0, 0, 1, 1,
0.8532318, -1.297385, 3.920717, 1, 0, 0, 1, 1,
0.8540782, -0.361125, 2.282012, 1, 0, 0, 1, 1,
0.8611729, 2.038533, 0.1194177, 0, 0, 0, 1, 1,
0.8665654, -0.9069532, 3.378671, 0, 0, 0, 1, 1,
0.8667919, -0.8017291, 4.12987, 0, 0, 0, 1, 1,
0.8704756, -0.3902329, 2.075602, 0, 0, 0, 1, 1,
0.8756263, 0.2069389, 1.415811, 0, 0, 0, 1, 1,
0.885324, -1.802665, 2.188138, 0, 0, 0, 1, 1,
0.8896714, -1.332005, 2.651729, 0, 0, 0, 1, 1,
0.8952698, -1.425833, 2.094809, 1, 1, 1, 1, 1,
0.8955852, 0.3342246, 1.049712, 1, 1, 1, 1, 1,
0.8993467, 0.06528459, 2.495795, 1, 1, 1, 1, 1,
0.9041428, 1.259186, 1.239699, 1, 1, 1, 1, 1,
0.9072948, -0.6990249, 1.65326, 1, 1, 1, 1, 1,
0.9111031, -0.4997469, 1.982543, 1, 1, 1, 1, 1,
0.911388, -1.35794, 0.7244216, 1, 1, 1, 1, 1,
0.9175845, -1.269637, 1.390857, 1, 1, 1, 1, 1,
0.9288841, 1.25737, 1.713729, 1, 1, 1, 1, 1,
0.9339452, 1.046848, 1.447238, 1, 1, 1, 1, 1,
0.9350362, -0.7388822, 2.247098, 1, 1, 1, 1, 1,
0.937859, 0.04834841, 3.040655, 1, 1, 1, 1, 1,
0.9449766, -1.569953, 3.413358, 1, 1, 1, 1, 1,
0.9482649, -0.474734, 0.8497102, 1, 1, 1, 1, 1,
0.9494138, -0.2825731, 2.125112, 1, 1, 1, 1, 1,
0.9513077, 0.2797316, -0.084409, 0, 0, 1, 1, 1,
0.9563519, 1.002404, 0.05526247, 1, 0, 0, 1, 1,
0.9568294, -1.271467, 2.881329, 1, 0, 0, 1, 1,
0.9835691, -0.2397512, 1.335509, 1, 0, 0, 1, 1,
0.985626, -0.5507526, 1.792851, 1, 0, 0, 1, 1,
0.9889708, -0.3784178, 1.33077, 1, 0, 0, 1, 1,
0.9905803, 0.1390351, 2.813754, 0, 0, 0, 1, 1,
0.9967099, -0.8218867, 0.6099581, 0, 0, 0, 1, 1,
0.9970267, 0.5143103, 0.02584347, 0, 0, 0, 1, 1,
0.9992438, -1.289991, 2.59694, 0, 0, 0, 1, 1,
1.006338, 0.7246336, 0.7626671, 0, 0, 0, 1, 1,
1.011463, -1.668054, 3.718049, 0, 0, 0, 1, 1,
1.019542, -1.239379, 2.239161, 0, 0, 0, 1, 1,
1.033096, -0.7294546, 0.903556, 1, 1, 1, 1, 1,
1.033245, 0.5260888, 0.4659548, 1, 1, 1, 1, 1,
1.033651, -0.7364213, 3.151956, 1, 1, 1, 1, 1,
1.034993, 0.09470429, 0.9862915, 1, 1, 1, 1, 1,
1.037278, 0.9256819, -0.2106576, 1, 1, 1, 1, 1,
1.038419, 0.1688417, 1.914685, 1, 1, 1, 1, 1,
1.041418, -1.377599, 2.872471, 1, 1, 1, 1, 1,
1.043959, 0.7239885, 0.3980052, 1, 1, 1, 1, 1,
1.055976, -1.740552, 2.591881, 1, 1, 1, 1, 1,
1.064043, 0.9488206, 0.4032309, 1, 1, 1, 1, 1,
1.065897, -0.5549811, 3.663225, 1, 1, 1, 1, 1,
1.066639, 0.1195412, 2.454405, 1, 1, 1, 1, 1,
1.071975, 1.725056, 2.642166, 1, 1, 1, 1, 1,
1.073404, -0.5604916, 2.599388, 1, 1, 1, 1, 1,
1.075498, 0.5745293, 1.335045, 1, 1, 1, 1, 1,
1.083553, -0.4601883, 0.5340757, 0, 0, 1, 1, 1,
1.085586, -0.7920251, 1.450373, 1, 0, 0, 1, 1,
1.101399, -2.381368, 4.811175, 1, 0, 0, 1, 1,
1.111534, 1.393739, -0.1410109, 1, 0, 0, 1, 1,
1.114996, 0.3802523, 2.843056, 1, 0, 0, 1, 1,
1.121342, 0.1906884, 1.929358, 1, 0, 0, 1, 1,
1.125073, -0.9020294, 2.556539, 0, 0, 0, 1, 1,
1.131551, -0.708657, 3.423027, 0, 0, 0, 1, 1,
1.143862, 0.03566235, 1.224057, 0, 0, 0, 1, 1,
1.144536, -0.6803759, 1.67595, 0, 0, 0, 1, 1,
1.153604, -0.6913148, 0.3189589, 0, 0, 0, 1, 1,
1.157745, 1.393268, 0.8379743, 0, 0, 0, 1, 1,
1.160129, -0.4675017, 2.645837, 0, 0, 0, 1, 1,
1.162649, 0.3321531, 0.1548202, 1, 1, 1, 1, 1,
1.165683, 0.0673035, 0.8918582, 1, 1, 1, 1, 1,
1.174141, 0.737816, 0.5358383, 1, 1, 1, 1, 1,
1.17709, 0.3512635, 1.393539, 1, 1, 1, 1, 1,
1.182271, 0.3204332, 4.030116, 1, 1, 1, 1, 1,
1.186203, 0.1047361, 0.7860807, 1, 1, 1, 1, 1,
1.186376, 0.541405, 0.8902009, 1, 1, 1, 1, 1,
1.192914, 0.516892, 1.927412, 1, 1, 1, 1, 1,
1.195757, -0.6342117, 0.839972, 1, 1, 1, 1, 1,
1.204632, 1.7725, 0.6016319, 1, 1, 1, 1, 1,
1.209189, -0.5873112, 3.456963, 1, 1, 1, 1, 1,
1.210735, 0.1496479, 1.21434, 1, 1, 1, 1, 1,
1.215307, 0.5240714, 3.372314, 1, 1, 1, 1, 1,
1.222313, 0.3540424, 1.18658, 1, 1, 1, 1, 1,
1.226764, -0.9112024, 1.095737, 1, 1, 1, 1, 1,
1.235644, -2.710462, 1.685428, 0, 0, 1, 1, 1,
1.240344, 0.1404543, 1.826334, 1, 0, 0, 1, 1,
1.240519, 0.1799399, 0.3667023, 1, 0, 0, 1, 1,
1.248676, -0.713832, 0.2227621, 1, 0, 0, 1, 1,
1.252901, -1.528245, 2.748396, 1, 0, 0, 1, 1,
1.260381, -0.6612193, 2.24046, 1, 0, 0, 1, 1,
1.271331, 0.8613917, 1.819045, 0, 0, 0, 1, 1,
1.272612, -1.009381, 0.8254821, 0, 0, 0, 1, 1,
1.276858, -1.125741, 3.159576, 0, 0, 0, 1, 1,
1.284231, -1.160523, 2.735142, 0, 0, 0, 1, 1,
1.289384, 1.062063, -0.2699237, 0, 0, 0, 1, 1,
1.289622, 0.4235981, 2.413828, 0, 0, 0, 1, 1,
1.289849, -0.1193782, 2.367235, 0, 0, 0, 1, 1,
1.290155, 0.1544653, 2.041083, 1, 1, 1, 1, 1,
1.292731, 0.4726716, 2.96063, 1, 1, 1, 1, 1,
1.296597, 0.6419119, 0.577395, 1, 1, 1, 1, 1,
1.299091, -1.351651, 3.174933, 1, 1, 1, 1, 1,
1.300203, -0.9371238, 1.898908, 1, 1, 1, 1, 1,
1.30132, -0.0134855, 2.266227, 1, 1, 1, 1, 1,
1.302196, -0.756528, 1.090077, 1, 1, 1, 1, 1,
1.306246, 1.055871, -0.4863937, 1, 1, 1, 1, 1,
1.307128, -1.030669, 1.583493, 1, 1, 1, 1, 1,
1.308607, 0.9149644, 0.8556746, 1, 1, 1, 1, 1,
1.308925, -2.331554, 2.785693, 1, 1, 1, 1, 1,
1.310154, -0.4515832, 2.869144, 1, 1, 1, 1, 1,
1.31495, 0.6968545, 1.347816, 1, 1, 1, 1, 1,
1.319187, -0.4031606, 3.15119, 1, 1, 1, 1, 1,
1.345535, 1.273076, 3.111788, 1, 1, 1, 1, 1,
1.347359, 0.5031117, 1.609448, 0, 0, 1, 1, 1,
1.354155, 0.5052338, 1.186951, 1, 0, 0, 1, 1,
1.356721, -0.5381767, 1.392065, 1, 0, 0, 1, 1,
1.358317, -0.3571526, 4.136782, 1, 0, 0, 1, 1,
1.363286, -0.1462474, 2.482816, 1, 0, 0, 1, 1,
1.366549, 0.04078773, 1.257618, 1, 0, 0, 1, 1,
1.366835, -1.140972, 0.6786574, 0, 0, 0, 1, 1,
1.374954, -0.3948912, 2.726123, 0, 0, 0, 1, 1,
1.380636, 0.9464889, 1.180128, 0, 0, 0, 1, 1,
1.385202, -0.3284188, 1.704193, 0, 0, 0, 1, 1,
1.387225, 1.341052, 2.133274, 0, 0, 0, 1, 1,
1.387803, -1.421443, 1.921316, 0, 0, 0, 1, 1,
1.397962, -1.006693, 1.674083, 0, 0, 0, 1, 1,
1.39997, 0.609085, 2.434017, 1, 1, 1, 1, 1,
1.404928, 0.03383475, 2.642904, 1, 1, 1, 1, 1,
1.416234, 0.4873343, 1.945325, 1, 1, 1, 1, 1,
1.418634, 0.5185621, 1.646832, 1, 1, 1, 1, 1,
1.425127, 1.063528, 1.405176, 1, 1, 1, 1, 1,
1.425911, -0.4956522, 2.798276, 1, 1, 1, 1, 1,
1.430698, 0.8246179, 1.6702, 1, 1, 1, 1, 1,
1.431893, -0.3866906, 1.639235, 1, 1, 1, 1, 1,
1.433092, -0.9731706, 1.628085, 1, 1, 1, 1, 1,
1.437796, -2.075229, 2.185761, 1, 1, 1, 1, 1,
1.443745, 0.01972771, 1.92839, 1, 1, 1, 1, 1,
1.444579, -0.3103128, 1.374135, 1, 1, 1, 1, 1,
1.446415, -0.1820347, 1.254797, 1, 1, 1, 1, 1,
1.448292, 0.5455621, -0.4071627, 1, 1, 1, 1, 1,
1.451987, -1.06589, 2.257975, 1, 1, 1, 1, 1,
1.463685, 1.237782, -0.6250846, 0, 0, 1, 1, 1,
1.489983, -0.09629695, 1.283798, 1, 0, 0, 1, 1,
1.505088, 0.2141215, 1.527384, 1, 0, 0, 1, 1,
1.517546, 1.248757, 1.967485, 1, 0, 0, 1, 1,
1.527152, 0.7702245, 1.847197, 1, 0, 0, 1, 1,
1.534174, -2.596272, 1.732343, 1, 0, 0, 1, 1,
1.549206, -1.723262, 0.719406, 0, 0, 0, 1, 1,
1.589246, 1.184005, 2.17341, 0, 0, 0, 1, 1,
1.590329, -0.8692414, 3.718612, 0, 0, 0, 1, 1,
1.597547, 0.6463936, 1.770218, 0, 0, 0, 1, 1,
1.603024, -0.2552819, 1.351335, 0, 0, 0, 1, 1,
1.607775, -1.080693, 2.166951, 0, 0, 0, 1, 1,
1.608288, 1.097559, 2.501321, 0, 0, 0, 1, 1,
1.637462, -1.423059, 1.574908, 1, 1, 1, 1, 1,
1.638954, 0.09307952, 2.687206, 1, 1, 1, 1, 1,
1.651617, 0.01936289, 0.1544709, 1, 1, 1, 1, 1,
1.654539, -1.689272, 0.05287329, 1, 1, 1, 1, 1,
1.655497, 0.5482083, 0.9608399, 1, 1, 1, 1, 1,
1.667404, 0.0008940031, 0.1305889, 1, 1, 1, 1, 1,
1.669611, -0.5478135, 1.25683, 1, 1, 1, 1, 1,
1.675801, 0.8107381, 0.5038757, 1, 1, 1, 1, 1,
1.679215, -0.1691655, 1.454215, 1, 1, 1, 1, 1,
1.681376, -0.2888145, 2.557286, 1, 1, 1, 1, 1,
1.684022, 0.2794223, 1.415341, 1, 1, 1, 1, 1,
1.692089, 0.7071124, 1.86226, 1, 1, 1, 1, 1,
1.695972, -1.990218, 2.165385, 1, 1, 1, 1, 1,
1.708697, 1.080029, 1.212654, 1, 1, 1, 1, 1,
1.725715, 0.6161509, 3.379884, 1, 1, 1, 1, 1,
1.726903, -1.009403, 1.431431, 0, 0, 1, 1, 1,
1.761582, -1.085444, 1.078907, 1, 0, 0, 1, 1,
1.782969, 0.605166, 2.405324, 1, 0, 0, 1, 1,
1.78799, -1.719193, 2.670634, 1, 0, 0, 1, 1,
1.794141, 0.3344301, 3.193844, 1, 0, 0, 1, 1,
1.796229, 0.1765885, 1.881652, 1, 0, 0, 1, 1,
1.813388, 1.338868, 1.784688, 0, 0, 0, 1, 1,
1.818032, -1.114227, 1.759726, 0, 0, 0, 1, 1,
1.837131, -0.8726239, -0.1754134, 0, 0, 0, 1, 1,
1.842799, -0.01715951, 2.016729, 0, 0, 0, 1, 1,
1.846267, -0.1036285, 0.1559582, 0, 0, 0, 1, 1,
1.850251, 0.05171894, 0.9666204, 0, 0, 0, 1, 1,
1.862102, -1.844114, 2.509857, 0, 0, 0, 1, 1,
1.881416, -2.409519, 2.248417, 1, 1, 1, 1, 1,
1.897202, 0.5732093, -0.168036, 1, 1, 1, 1, 1,
1.956238, -0.3545184, 3.927954, 1, 1, 1, 1, 1,
1.956917, -1.203339, 2.3318, 1, 1, 1, 1, 1,
1.957643, 0.836717, 0.3499855, 1, 1, 1, 1, 1,
1.977414, -0.5253285, 1.559539, 1, 1, 1, 1, 1,
1.979999, -0.6778094, 3.374541, 1, 1, 1, 1, 1,
1.986666, 1.506154, 1.35556, 1, 1, 1, 1, 1,
1.992265, 0.2355959, 1.89687, 1, 1, 1, 1, 1,
2.004432, 1.370463, 0.5712494, 1, 1, 1, 1, 1,
2.011648, -1.361036, 1.684484, 1, 1, 1, 1, 1,
2.036461, -0.6128985, 1.511938, 1, 1, 1, 1, 1,
2.051747, -0.1901666, 2.592313, 1, 1, 1, 1, 1,
2.053687, -0.4860801, 2.870459, 1, 1, 1, 1, 1,
2.07678, -0.2604227, 3.387723, 1, 1, 1, 1, 1,
2.103511, 0.8608535, 1.138195, 0, 0, 1, 1, 1,
2.127386, 0.708537, 2.172148, 1, 0, 0, 1, 1,
2.138273, -0.2639674, 2.348662, 1, 0, 0, 1, 1,
2.164256, -1.444362, 2.845551, 1, 0, 0, 1, 1,
2.18448, -0.2958927, 0.2946202, 1, 0, 0, 1, 1,
2.212697, 0.2465876, 2.383165, 1, 0, 0, 1, 1,
2.243991, 0.9318181, 0.8534098, 0, 0, 0, 1, 1,
2.255223, 0.5594875, 1.992421, 0, 0, 0, 1, 1,
2.379303, -0.8373397, 2.796139, 0, 0, 0, 1, 1,
2.457095, 0.7096733, -1.417487, 0, 0, 0, 1, 1,
2.487948, 0.2546555, 0.6772691, 0, 0, 0, 1, 1,
2.573328, 0.5294299, -0.942304, 0, 0, 0, 1, 1,
2.588813, 0.5983269, 0.09691396, 0, 0, 0, 1, 1,
2.762679, 1.28593, 0.952359, 1, 1, 1, 1, 1,
2.774157, 0.65214, 1.766931, 1, 1, 1, 1, 1,
2.789275, 0.1934807, 1.590144, 1, 1, 1, 1, 1,
2.808589, -0.4230025, 1.289968, 1, 1, 1, 1, 1,
2.929051, 0.4949471, 2.060423, 1, 1, 1, 1, 1,
3.056741, 0.8027377, 0.5948243, 1, 1, 1, 1, 1,
3.376868, 0.1659559, -0.08839675, 1, 1, 1, 1, 1
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
var radius = 9.166645;
var distance = 32.19745;
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
mvMatrix.translate( -0.2502356, -0.07556725, -0.1319757 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.19745);
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
