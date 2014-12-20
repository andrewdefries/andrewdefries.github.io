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
-3.294487, 0.8320695, -2.225533, 1, 0, 0, 1,
-2.828617, -1.251207, -3.692013, 1, 0.007843138, 0, 1,
-2.654105, 0.2684176, -0.7105072, 1, 0.01176471, 0, 1,
-2.644598, 1.16412, -2.595249, 1, 0.01960784, 0, 1,
-2.480856, 0.8935776, 0.759076, 1, 0.02352941, 0, 1,
-2.43919, 0.6949974, -1.461555, 1, 0.03137255, 0, 1,
-2.431461, 1.540775, -3.437493, 1, 0.03529412, 0, 1,
-2.399042, -0.5318419, -2.491688, 1, 0.04313726, 0, 1,
-2.395603, 0.1100983, -1.788513, 1, 0.04705882, 0, 1,
-2.380278, -0.2048362, -3.14469, 1, 0.05490196, 0, 1,
-2.379996, -0.4873056, -2.117881, 1, 0.05882353, 0, 1,
-2.340976, -1.263, -3.820612, 1, 0.06666667, 0, 1,
-2.325905, -0.4091031, 0.0162089, 1, 0.07058824, 0, 1,
-2.294763, 1.136026, 0.5123188, 1, 0.07843138, 0, 1,
-2.294307, 0.6496116, -0.8524686, 1, 0.08235294, 0, 1,
-2.267417, 0.3185941, -0.9655221, 1, 0.09019608, 0, 1,
-2.259863, 0.3457953, -1.540092, 1, 0.09411765, 0, 1,
-2.193084, 0.05725859, -1.621877, 1, 0.1019608, 0, 1,
-2.1796, -1.34877, -1.542055, 1, 0.1098039, 0, 1,
-2.102033, -1.453776, -1.664019, 1, 0.1137255, 0, 1,
-2.097772, -0.2017138, -0.3967261, 1, 0.1215686, 0, 1,
-2.078355, -0.06364129, -0.3324288, 1, 0.1254902, 0, 1,
-2.000646, 0.9303961, -1.067566, 1, 0.1333333, 0, 1,
-1.980545, -0.1457579, -1.478052, 1, 0.1372549, 0, 1,
-1.956465, 0.1588535, -1.29731, 1, 0.145098, 0, 1,
-1.889703, -1.096208, -1.703973, 1, 0.1490196, 0, 1,
-1.881033, 0.2885916, -1.756959, 1, 0.1568628, 0, 1,
-1.879596, 0.4516598, -1.758186, 1, 0.1607843, 0, 1,
-1.863362, 0.04785694, -2.117611, 1, 0.1686275, 0, 1,
-1.856138, 0.5232574, -0.8158342, 1, 0.172549, 0, 1,
-1.853778, 0.6097574, -1.04296, 1, 0.1803922, 0, 1,
-1.84231, -1.501429, -2.561645, 1, 0.1843137, 0, 1,
-1.838375, -0.968385, -0.7855279, 1, 0.1921569, 0, 1,
-1.788289, 1.818648, -1.626891, 1, 0.1960784, 0, 1,
-1.776014, 0.7624424, -1.440178, 1, 0.2039216, 0, 1,
-1.747138, 2.904894, -0.1550961, 1, 0.2117647, 0, 1,
-1.746643, 1.090507, -1.829811, 1, 0.2156863, 0, 1,
-1.735751, 1.709914, -1.205269, 1, 0.2235294, 0, 1,
-1.725285, -0.871698, -2.539118, 1, 0.227451, 0, 1,
-1.720162, 1.051684, -0.8670226, 1, 0.2352941, 0, 1,
-1.709754, -0.01764692, -2.554257, 1, 0.2392157, 0, 1,
-1.703456, 0.8867651, -0.3003175, 1, 0.2470588, 0, 1,
-1.701486, 0.4288117, -0.5877028, 1, 0.2509804, 0, 1,
-1.694502, -0.9971642, -1.514704, 1, 0.2588235, 0, 1,
-1.69191, -1.389344, -3.667452, 1, 0.2627451, 0, 1,
-1.684065, -0.5872976, -0.5181478, 1, 0.2705882, 0, 1,
-1.67683, 0.9627679, -1.029524, 1, 0.2745098, 0, 1,
-1.67037, 0.487219, -1.189348, 1, 0.282353, 0, 1,
-1.670262, 0.2020856, -2.156605, 1, 0.2862745, 0, 1,
-1.665897, -2.567107, -1.270573, 1, 0.2941177, 0, 1,
-1.664299, -0.737054, -2.588969, 1, 0.3019608, 0, 1,
-1.655536, -1.169142, -2.223299, 1, 0.3058824, 0, 1,
-1.652715, -1.113448, -2.742261, 1, 0.3137255, 0, 1,
-1.649532, -0.4820693, -0.9967732, 1, 0.3176471, 0, 1,
-1.634103, -0.08665347, -1.433898, 1, 0.3254902, 0, 1,
-1.601431, -0.5132598, 0.7583205, 1, 0.3294118, 0, 1,
-1.600523, 0.6142517, 0.3904578, 1, 0.3372549, 0, 1,
-1.593331, -2.293547, -2.968946, 1, 0.3411765, 0, 1,
-1.591715, -1.308999, -0.6876624, 1, 0.3490196, 0, 1,
-1.583046, 0.2580474, -1.070432, 1, 0.3529412, 0, 1,
-1.582474, -2.037271, -3.304212, 1, 0.3607843, 0, 1,
-1.581826, -0.6763799, -1.210468, 1, 0.3647059, 0, 1,
-1.580305, 0.07133287, -3.089482, 1, 0.372549, 0, 1,
-1.554309, 0.9277648, -0.464915, 1, 0.3764706, 0, 1,
-1.524346, -0.4667649, 0.4208384, 1, 0.3843137, 0, 1,
-1.496208, -2.786722, -1.118487, 1, 0.3882353, 0, 1,
-1.493392, 2.027879, 0.2936732, 1, 0.3960784, 0, 1,
-1.480397, 0.9106681, -0.2664362, 1, 0.4039216, 0, 1,
-1.476111, -0.9995533, -4.529841, 1, 0.4078431, 0, 1,
-1.475495, -0.6472195, -1.090605, 1, 0.4156863, 0, 1,
-1.46977, 1.605424, 1.083827, 1, 0.4196078, 0, 1,
-1.463724, 0.2264845, -1.387073, 1, 0.427451, 0, 1,
-1.46368, -1.051046, -2.661313, 1, 0.4313726, 0, 1,
-1.458863, -0.01923494, -2.055242, 1, 0.4392157, 0, 1,
-1.455555, -1.323062, -3.434046, 1, 0.4431373, 0, 1,
-1.4434, 1.752003, -2.0003, 1, 0.4509804, 0, 1,
-1.433937, -1.240626, -2.906101, 1, 0.454902, 0, 1,
-1.433697, 0.1168622, -2.129214, 1, 0.4627451, 0, 1,
-1.43147, -1.156211, -1.172123, 1, 0.4666667, 0, 1,
-1.430771, -0.5823892, -2.94463, 1, 0.4745098, 0, 1,
-1.429549, 1.023026, 0.2155064, 1, 0.4784314, 0, 1,
-1.424845, 0.8990577, -0.4854885, 1, 0.4862745, 0, 1,
-1.421394, 1.91208, 1.042567, 1, 0.4901961, 0, 1,
-1.414164, -0.1343318, -2.493622, 1, 0.4980392, 0, 1,
-1.405194, 0.4237383, 0.219049, 1, 0.5058824, 0, 1,
-1.403654, -0.8430094, -2.781827, 1, 0.509804, 0, 1,
-1.402499, -0.1758682, -3.404961, 1, 0.5176471, 0, 1,
-1.397272, 1.488082, 0.5166882, 1, 0.5215687, 0, 1,
-1.389998, 0.2879175, -1.101982, 1, 0.5294118, 0, 1,
-1.382804, 0.3664283, -1.489118, 1, 0.5333334, 0, 1,
-1.379696, -1.16286, -2.188645, 1, 0.5411765, 0, 1,
-1.373781, -0.7134361, -1.493185, 1, 0.5450981, 0, 1,
-1.371923, 1.259323, 0.1644651, 1, 0.5529412, 0, 1,
-1.369482, 0.5929961, 0.09510367, 1, 0.5568628, 0, 1,
-1.366701, 0.784588, 0.5718759, 1, 0.5647059, 0, 1,
-1.363576, -0.1816685, -2.297275, 1, 0.5686275, 0, 1,
-1.354034, 0.50921, -0.7861174, 1, 0.5764706, 0, 1,
-1.341911, 1.095147, -0.8641768, 1, 0.5803922, 0, 1,
-1.336748, 0.6313257, -1.83572, 1, 0.5882353, 0, 1,
-1.335835, -1.16852, -3.488248, 1, 0.5921569, 0, 1,
-1.332855, 0.4847206, -1.643078, 1, 0.6, 0, 1,
-1.293439, -0.3196958, -0.09379302, 1, 0.6078432, 0, 1,
-1.292102, -1.345101, -2.188063, 1, 0.6117647, 0, 1,
-1.275458, 1.470962, 0.1745817, 1, 0.6196079, 0, 1,
-1.263689, -0.2977253, 0.6410244, 1, 0.6235294, 0, 1,
-1.26299, -1.357573, -2.527457, 1, 0.6313726, 0, 1,
-1.258958, -0.3982863, -3.566319, 1, 0.6352941, 0, 1,
-1.255568, -0.8893579, -2.727526, 1, 0.6431373, 0, 1,
-1.252753, -0.4595814, -1.731551, 1, 0.6470588, 0, 1,
-1.249669, 1.276311, 2.060782, 1, 0.654902, 0, 1,
-1.248591, 0.5738744, -1.488705, 1, 0.6588235, 0, 1,
-1.245441, 0.7580904, -0.6894174, 1, 0.6666667, 0, 1,
-1.245157, 1.319579, -0.2178087, 1, 0.6705883, 0, 1,
-1.240983, -1.255361, -1.931207, 1, 0.6784314, 0, 1,
-1.231377, -0.05815108, -1.526193, 1, 0.682353, 0, 1,
-1.221203, -0.3509516, -2.68628, 1, 0.6901961, 0, 1,
-1.219177, 1.146138, -1.489833, 1, 0.6941177, 0, 1,
-1.21514, -0.4836993, -2.02481, 1, 0.7019608, 0, 1,
-1.212731, 0.407879, -3.321116, 1, 0.7098039, 0, 1,
-1.207655, 0.6458489, -0.404844, 1, 0.7137255, 0, 1,
-1.204474, -0.319455, -1.953544, 1, 0.7215686, 0, 1,
-1.202396, -0.1790936, -4.250096, 1, 0.7254902, 0, 1,
-1.189834, 0.01751785, -2.155764, 1, 0.7333333, 0, 1,
-1.183138, 1.173145, -1.27952, 1, 0.7372549, 0, 1,
-1.18131, -0.535005, -2.066051, 1, 0.7450981, 0, 1,
-1.173662, -0.2694861, -1.188739, 1, 0.7490196, 0, 1,
-1.173258, -0.3671434, -2.397865, 1, 0.7568628, 0, 1,
-1.163416, -0.2883264, -1.797538, 1, 0.7607843, 0, 1,
-1.163259, 0.967801, -1.152819, 1, 0.7686275, 0, 1,
-1.158306, -0.7883416, -1.610351, 1, 0.772549, 0, 1,
-1.157552, -0.7169948, -1.799849, 1, 0.7803922, 0, 1,
-1.143641, 0.1625408, -1.320054, 1, 0.7843137, 0, 1,
-1.142726, -0.7612203, -2.898574, 1, 0.7921569, 0, 1,
-1.14019, -0.3660151, -3.039549, 1, 0.7960784, 0, 1,
-1.138059, -0.2905167, -0.5568029, 1, 0.8039216, 0, 1,
-1.133081, 0.4346176, -1.386522, 1, 0.8117647, 0, 1,
-1.129134, -1.027533, -1.906995, 1, 0.8156863, 0, 1,
-1.122619, -0.8155571, 0.3894903, 1, 0.8235294, 0, 1,
-1.11734, 1.38265, -0.4316503, 1, 0.827451, 0, 1,
-1.11314, -1.795513, -1.994639, 1, 0.8352941, 0, 1,
-1.108117, 0.5118439, -0.9770536, 1, 0.8392157, 0, 1,
-1.104058, 1.31688, -2.243933, 1, 0.8470588, 0, 1,
-1.100119, -0.4129629, -1.383699, 1, 0.8509804, 0, 1,
-1.091961, -0.5964935, 0.1824861, 1, 0.8588235, 0, 1,
-1.088299, -0.1574285, -2.610667, 1, 0.8627451, 0, 1,
-1.087124, -2.184722, -2.316923, 1, 0.8705882, 0, 1,
-1.081962, -1.16161, -2.207659, 1, 0.8745098, 0, 1,
-1.06999, 0.5540338, -2.43395, 1, 0.8823529, 0, 1,
-1.050479, 0.9120722, -1.087825, 1, 0.8862745, 0, 1,
-1.049718, -1.073163, -2.113558, 1, 0.8941177, 0, 1,
-1.043835, -0.6919166, -4.643967, 1, 0.8980392, 0, 1,
-1.042809, 1.300536, -2.470917, 1, 0.9058824, 0, 1,
-1.037165, 1.805749, 0.6504059, 1, 0.9137255, 0, 1,
-1.03673, -0.1889512, -1.447535, 1, 0.9176471, 0, 1,
-1.03603, 0.1187512, -0.02621797, 1, 0.9254902, 0, 1,
-1.025578, 0.2206565, 0.2109221, 1, 0.9294118, 0, 1,
-1.020069, 0.4697049, -1.014273, 1, 0.9372549, 0, 1,
-1.019948, -0.2228328, -1.823309, 1, 0.9411765, 0, 1,
-1.018521, 0.2985123, -1.959041, 1, 0.9490196, 0, 1,
-1.017425, -0.6310388, -0.9787611, 1, 0.9529412, 0, 1,
-1.016818, 1.167925, -1.553721, 1, 0.9607843, 0, 1,
-1.014753, 0.3962858, 0.614372, 1, 0.9647059, 0, 1,
-1.013186, 0.2822545, -0.7266389, 1, 0.972549, 0, 1,
-1.001383, -0.07673788, -1.301722, 1, 0.9764706, 0, 1,
-0.9987264, 0.7845646, -1.014621, 1, 0.9843137, 0, 1,
-0.9953755, 0.7273865, -2.078939, 1, 0.9882353, 0, 1,
-0.979995, 0.3580088, -1.595674, 1, 0.9960784, 0, 1,
-0.9781256, 1.583157, -0.6825554, 0.9960784, 1, 0, 1,
-0.9756537, -0.6047851, -1.564265, 0.9921569, 1, 0, 1,
-0.9741128, -0.5994706, -3.4993, 0.9843137, 1, 0, 1,
-0.9732539, 0.2616017, -1.781569, 0.9803922, 1, 0, 1,
-0.9629, -0.4419404, -2.734475, 0.972549, 1, 0, 1,
-0.9607255, 0.4550916, -0.8321944, 0.9686275, 1, 0, 1,
-0.9516129, -1.015448, -1.675579, 0.9607843, 1, 0, 1,
-0.9447888, 1.160547, -0.2641669, 0.9568627, 1, 0, 1,
-0.9348879, -1.465369, -1.810043, 0.9490196, 1, 0, 1,
-0.9344749, 1.800798, -0.6530904, 0.945098, 1, 0, 1,
-0.9264346, -0.07158857, -3.057244, 0.9372549, 1, 0, 1,
-0.9252184, 1.789531, -1.339987, 0.9333333, 1, 0, 1,
-0.9237704, 1.009268, -1.193389, 0.9254902, 1, 0, 1,
-0.9230243, 0.6791152, -0.1918969, 0.9215686, 1, 0, 1,
-0.9221048, 0.7220032, -0.8838295, 0.9137255, 1, 0, 1,
-0.9203309, -0.6017636, -3.421116, 0.9098039, 1, 0, 1,
-0.9186054, -0.5513282, -2.207763, 0.9019608, 1, 0, 1,
-0.9180204, 1.36987, -1.191565, 0.8941177, 1, 0, 1,
-0.9073287, 1.150669, -0.904546, 0.8901961, 1, 0, 1,
-0.9043225, 0.9259163, -2.892715, 0.8823529, 1, 0, 1,
-0.9041864, 1.449964, -1.430754, 0.8784314, 1, 0, 1,
-0.903574, -0.7215363, -2.740016, 0.8705882, 1, 0, 1,
-0.9022796, 0.006913843, -2.401725, 0.8666667, 1, 0, 1,
-0.9017307, -2.293877, -3.209031, 0.8588235, 1, 0, 1,
-0.89985, 0.2808185, -2.923909, 0.854902, 1, 0, 1,
-0.8965378, 0.3124374, -2.085944, 0.8470588, 1, 0, 1,
-0.8964636, 2.199627, -2.338523, 0.8431373, 1, 0, 1,
-0.887179, 1.065975, -0.6885053, 0.8352941, 1, 0, 1,
-0.8862385, 0.5870768, -1.622036, 0.8313726, 1, 0, 1,
-0.8857879, -1.515647, 0.4817758, 0.8235294, 1, 0, 1,
-0.8851616, 0.8351955, -0.7581421, 0.8196079, 1, 0, 1,
-0.8843956, 0.5506484, 0.05084803, 0.8117647, 1, 0, 1,
-0.8829795, -0.5915463, -1.642761, 0.8078431, 1, 0, 1,
-0.88063, -0.9049188, -1.293377, 0.8, 1, 0, 1,
-0.8788231, 0.09785177, -2.469669, 0.7921569, 1, 0, 1,
-0.873614, 2.201081, -0.7672116, 0.7882353, 1, 0, 1,
-0.8704421, 1.24907, -0.3898681, 0.7803922, 1, 0, 1,
-0.8606344, 1.980556, -0.3079434, 0.7764706, 1, 0, 1,
-0.8599826, -0.3789724, -1.762666, 0.7686275, 1, 0, 1,
-0.854911, 1.377816, -1.615258, 0.7647059, 1, 0, 1,
-0.8419074, -0.8449724, -3.780619, 0.7568628, 1, 0, 1,
-0.83244, -0.3998456, -3.706521, 0.7529412, 1, 0, 1,
-0.832284, 0.7826142, -0.4630005, 0.7450981, 1, 0, 1,
-0.830434, 1.564272, -0.6281589, 0.7411765, 1, 0, 1,
-0.8282165, -1.267038, -2.300368, 0.7333333, 1, 0, 1,
-0.8237199, -0.2689327, -2.37227, 0.7294118, 1, 0, 1,
-0.8224622, 0.837333, -1.382116, 0.7215686, 1, 0, 1,
-0.8188686, -0.4783456, -1.997503, 0.7176471, 1, 0, 1,
-0.8166013, 0.0735923, -0.8903224, 0.7098039, 1, 0, 1,
-0.8162044, 0.2069457, -1.556745, 0.7058824, 1, 0, 1,
-0.8159786, -0.9665386, -1.520582, 0.6980392, 1, 0, 1,
-0.8154277, 0.7847923, -2.087125, 0.6901961, 1, 0, 1,
-0.8137273, -1.510483, -2.76298, 0.6862745, 1, 0, 1,
-0.8101782, 0.2709531, -1.239053, 0.6784314, 1, 0, 1,
-0.8060346, 1.910913, 0.7951244, 0.6745098, 1, 0, 1,
-0.8054335, -0.04541158, -2.028374, 0.6666667, 1, 0, 1,
-0.7995065, 1.009216, -2.138006, 0.6627451, 1, 0, 1,
-0.7984914, -0.7078118, -1.184902, 0.654902, 1, 0, 1,
-0.7960842, -0.8621764, -1.303661, 0.6509804, 1, 0, 1,
-0.7951484, -0.6628607, -1.412445, 0.6431373, 1, 0, 1,
-0.7915972, 0.584878, -0.5262864, 0.6392157, 1, 0, 1,
-0.7886536, -1.424924, -4.463782, 0.6313726, 1, 0, 1,
-0.7837732, -0.4297455, -2.132188, 0.627451, 1, 0, 1,
-0.7799565, -0.1665141, -0.9831501, 0.6196079, 1, 0, 1,
-0.7757483, -1.044146, -1.122278, 0.6156863, 1, 0, 1,
-0.7627103, 1.771238, 0.8549759, 0.6078432, 1, 0, 1,
-0.7540221, 1.68946, -0.6109664, 0.6039216, 1, 0, 1,
-0.7521863, -1.135485, -4.126402, 0.5960785, 1, 0, 1,
-0.7521393, -0.03757183, -1.899338, 0.5882353, 1, 0, 1,
-0.7508777, -0.08791876, -1.490835, 0.5843138, 1, 0, 1,
-0.749069, -0.007155362, -2.588671, 0.5764706, 1, 0, 1,
-0.7477722, 0.07485233, -0.8895287, 0.572549, 1, 0, 1,
-0.7445549, 1.379277, 0.8565217, 0.5647059, 1, 0, 1,
-0.7431436, 2.061328, -1.244573, 0.5607843, 1, 0, 1,
-0.7431127, -0.7796983, -2.139056, 0.5529412, 1, 0, 1,
-0.7420552, -1.056091, -1.430603, 0.5490196, 1, 0, 1,
-0.7413707, 1.16741, 0.2081716, 0.5411765, 1, 0, 1,
-0.736953, 0.4844495, 0.2668274, 0.5372549, 1, 0, 1,
-0.7357291, -1.083117, -1.278036, 0.5294118, 1, 0, 1,
-0.7349958, -1.142307, -4.504654, 0.5254902, 1, 0, 1,
-0.7339367, 0.2496063, -2.335278, 0.5176471, 1, 0, 1,
-0.7324614, -0.2245636, -0.6174424, 0.5137255, 1, 0, 1,
-0.7287807, -0.333901, -0.8054771, 0.5058824, 1, 0, 1,
-0.7265723, 0.3620568, -0.6624932, 0.5019608, 1, 0, 1,
-0.723956, -0.06390592, -0.6451821, 0.4941176, 1, 0, 1,
-0.7223011, 0.8745061, -1.185533, 0.4862745, 1, 0, 1,
-0.7181805, -0.3356361, -2.396667, 0.4823529, 1, 0, 1,
-0.7176209, -0.347276, -3.951098, 0.4745098, 1, 0, 1,
-0.7173564, -2.127287, -1.529143, 0.4705882, 1, 0, 1,
-0.7126809, -0.4982174, -2.539154, 0.4627451, 1, 0, 1,
-0.7117342, 1.269709, 0.5986398, 0.4588235, 1, 0, 1,
-0.7022075, 1.024082, -2.414221, 0.4509804, 1, 0, 1,
-0.7000787, 1.458166, -0.3047326, 0.4470588, 1, 0, 1,
-0.6892543, -0.7317591, -2.241223, 0.4392157, 1, 0, 1,
-0.6892069, 1.522891, -0.2799452, 0.4352941, 1, 0, 1,
-0.6877205, 1.964461, -1.584213, 0.427451, 1, 0, 1,
-0.6876895, 0.2505738, -0.7508113, 0.4235294, 1, 0, 1,
-0.6849704, -0.3093431, -2.107951, 0.4156863, 1, 0, 1,
-0.6811539, -0.4713165, -1.405355, 0.4117647, 1, 0, 1,
-0.6801697, 0.05943419, -0.8431392, 0.4039216, 1, 0, 1,
-0.6720296, -0.1939582, -1.553366, 0.3960784, 1, 0, 1,
-0.6703563, -1.109003, -2.726204, 0.3921569, 1, 0, 1,
-0.6684693, 1.182535, -1.737958, 0.3843137, 1, 0, 1,
-0.6659962, -0.2486035, -2.433481, 0.3803922, 1, 0, 1,
-0.6626975, -0.716823, -4.631009, 0.372549, 1, 0, 1,
-0.6586452, 0.09485244, -0.3275487, 0.3686275, 1, 0, 1,
-0.6557015, 0.5261075, 1.378336, 0.3607843, 1, 0, 1,
-0.6516751, -0.3869585, -3.070139, 0.3568628, 1, 0, 1,
-0.6489248, -0.4899638, -2.033218, 0.3490196, 1, 0, 1,
-0.6417107, -0.1782141, -2.224223, 0.345098, 1, 0, 1,
-0.6376355, -0.1553122, -2.714195, 0.3372549, 1, 0, 1,
-0.6364592, 0.5311268, -1.688067, 0.3333333, 1, 0, 1,
-0.6240024, 0.8153719, -1.588109, 0.3254902, 1, 0, 1,
-0.6206862, 0.4233996, -3.56757, 0.3215686, 1, 0, 1,
-0.6090698, -0.234194, -1.161423, 0.3137255, 1, 0, 1,
-0.6082853, 1.950196, 0.1183603, 0.3098039, 1, 0, 1,
-0.6075577, -0.3950754, -1.526337, 0.3019608, 1, 0, 1,
-0.6021955, 1.508281, 0.8894428, 0.2941177, 1, 0, 1,
-0.5966631, -0.6864761, -2.507699, 0.2901961, 1, 0, 1,
-0.5957388, -0.4252381, -3.568307, 0.282353, 1, 0, 1,
-0.5949237, -1.789544, -4.044445, 0.2784314, 1, 0, 1,
-0.5942308, 1.3812, -0.5127097, 0.2705882, 1, 0, 1,
-0.5933022, 0.5023618, -1.126328, 0.2666667, 1, 0, 1,
-0.590692, -0.5215573, -1.77545, 0.2588235, 1, 0, 1,
-0.5845286, 1.581899, -1.618709, 0.254902, 1, 0, 1,
-0.5760798, -0.4713931, -1.958763, 0.2470588, 1, 0, 1,
-0.5745807, 0.2875822, -1.309904, 0.2431373, 1, 0, 1,
-0.5736544, 0.8777268, -0.6569761, 0.2352941, 1, 0, 1,
-0.5720167, 0.5419137, -0.2931881, 0.2313726, 1, 0, 1,
-0.5684295, 0.6836482, -0.8755665, 0.2235294, 1, 0, 1,
-0.5671501, -0.4007485, -1.856568, 0.2196078, 1, 0, 1,
-0.5664085, -0.001792241, -2.066335, 0.2117647, 1, 0, 1,
-0.5656245, -0.2101274, -2.346846, 0.2078431, 1, 0, 1,
-0.5616467, 0.9776841, 1.062024, 0.2, 1, 0, 1,
-0.5605124, 1.102941, 0.3279572, 0.1921569, 1, 0, 1,
-0.5548369, 0.1888235, -1.758981, 0.1882353, 1, 0, 1,
-0.5486302, -1.650768, -1.37143, 0.1803922, 1, 0, 1,
-0.547578, -0.9108782, -0.3994994, 0.1764706, 1, 0, 1,
-0.5378989, 0.7056519, 1.615944, 0.1686275, 1, 0, 1,
-0.5357792, 0.2437052, -2.539492, 0.1647059, 1, 0, 1,
-0.5330183, -0.03276646, -0.5931981, 0.1568628, 1, 0, 1,
-0.5297744, -0.4652553, -3.123765, 0.1529412, 1, 0, 1,
-0.5222985, -0.7343099, -2.864996, 0.145098, 1, 0, 1,
-0.5193123, 1.456281, -1.302957, 0.1411765, 1, 0, 1,
-0.5177647, -0.01539534, -1.087173, 0.1333333, 1, 0, 1,
-0.517469, -0.155855, -0.9370922, 0.1294118, 1, 0, 1,
-0.5173387, -1.258697, -2.832049, 0.1215686, 1, 0, 1,
-0.5161367, 1.148645, -1.462368, 0.1176471, 1, 0, 1,
-0.5152766, -0.3830237, -2.211128, 0.1098039, 1, 0, 1,
-0.5127749, -0.6862527, -1.851481, 0.1058824, 1, 0, 1,
-0.5122433, 0.978274, -1.841152, 0.09803922, 1, 0, 1,
-0.5102212, 0.1891261, -2.256229, 0.09019608, 1, 0, 1,
-0.5090876, -0.5917838, -4.096244, 0.08627451, 1, 0, 1,
-0.5064959, 0.5335312, 0.3048467, 0.07843138, 1, 0, 1,
-0.5012035, -0.7726482, -1.245266, 0.07450981, 1, 0, 1,
-0.4978207, -0.154516, -3.203319, 0.06666667, 1, 0, 1,
-0.4971873, -0.2571165, -2.596657, 0.0627451, 1, 0, 1,
-0.4921915, -0.2557216, -1.31523, 0.05490196, 1, 0, 1,
-0.491857, -0.3898034, -1.42802, 0.05098039, 1, 0, 1,
-0.4893507, 0.05514538, -0.7305277, 0.04313726, 1, 0, 1,
-0.4829485, -1.151582, -1.349129, 0.03921569, 1, 0, 1,
-0.4805509, 0.4552028, -1.7918, 0.03137255, 1, 0, 1,
-0.476694, -0.7904397, -2.041718, 0.02745098, 1, 0, 1,
-0.4756199, 0.2220825, 0.5990443, 0.01960784, 1, 0, 1,
-0.4744966, -0.7966862, -2.833397, 0.01568628, 1, 0, 1,
-0.4726437, 0.1055456, -2.762854, 0.007843138, 1, 0, 1,
-0.4707257, -0.5899796, -3.515265, 0.003921569, 1, 0, 1,
-0.4697293, 2.22669, -1.574624, 0, 1, 0.003921569, 1,
-0.4665349, -0.03482544, -1.674037, 0, 1, 0.01176471, 1,
-0.4590615, 1.189318, 1.472919, 0, 1, 0.01568628, 1,
-0.4586575, -0.3769501, -3.309562, 0, 1, 0.02352941, 1,
-0.4553406, 0.1435076, -1.516524, 0, 1, 0.02745098, 1,
-0.4551342, 1.195715, 1.056626, 0, 1, 0.03529412, 1,
-0.4511765, -0.6492838, -1.950639, 0, 1, 0.03921569, 1,
-0.4487208, -0.4980322, -2.503424, 0, 1, 0.04705882, 1,
-0.44729, -0.04865084, -1.847486, 0, 1, 0.05098039, 1,
-0.4447406, -0.2024521, -2.421828, 0, 1, 0.05882353, 1,
-0.444358, 1.155754, 0.5205721, 0, 1, 0.0627451, 1,
-0.4404042, -0.2595086, -3.577468, 0, 1, 0.07058824, 1,
-0.4375159, 0.5859985, -0.4871346, 0, 1, 0.07450981, 1,
-0.4371212, -0.7754022, -3.214227, 0, 1, 0.08235294, 1,
-0.4342782, -0.02877879, -2.799844, 0, 1, 0.08627451, 1,
-0.4322045, -1.397061, -3.621402, 0, 1, 0.09411765, 1,
-0.4316081, -2.062534, -3.907454, 0, 1, 0.1019608, 1,
-0.4315325, -1.204035, -3.241021, 0, 1, 0.1058824, 1,
-0.4314093, 0.9056326, -0.106456, 0, 1, 0.1137255, 1,
-0.4298202, 0.5942219, -0.7039275, 0, 1, 0.1176471, 1,
-0.4259622, 0.4472319, -0.2510852, 0, 1, 0.1254902, 1,
-0.425632, -0.3871146, -2.7914, 0, 1, 0.1294118, 1,
-0.4254572, 0.1415851, -2.407213, 0, 1, 0.1372549, 1,
-0.4211711, 1.152515, -0.4396617, 0, 1, 0.1411765, 1,
-0.4204237, 0.2060625, -1.366005, 0, 1, 0.1490196, 1,
-0.4181913, 0.681524, -1.162484, 0, 1, 0.1529412, 1,
-0.4174361, 1.502332, 0.1517492, 0, 1, 0.1607843, 1,
-0.4036524, 0.2729656, -0.4971679, 0, 1, 0.1647059, 1,
-0.4006106, -1.161072, -1.741694, 0, 1, 0.172549, 1,
-0.3992688, 0.2835894, -2.11904, 0, 1, 0.1764706, 1,
-0.3793741, -0.006317887, -1.356082, 0, 1, 0.1843137, 1,
-0.377253, 0.1611557, 0.6860978, 0, 1, 0.1882353, 1,
-0.3748203, -0.1393281, -1.460525, 0, 1, 0.1960784, 1,
-0.3728449, -0.2006937, -3.058959, 0, 1, 0.2039216, 1,
-0.3701642, 0.5739751, -2.059833, 0, 1, 0.2078431, 1,
-0.3689017, -0.283533, -1.664032, 0, 1, 0.2156863, 1,
-0.3637194, -1.367728, -1.505719, 0, 1, 0.2196078, 1,
-0.3627653, -2.109792, -0.8866338, 0, 1, 0.227451, 1,
-0.3593929, -1.113222, -3.311825, 0, 1, 0.2313726, 1,
-0.3541704, 0.7585421, 0.09440445, 0, 1, 0.2392157, 1,
-0.353359, -0.56089, -1.768403, 0, 1, 0.2431373, 1,
-0.350581, -1.005227, -2.258229, 0, 1, 0.2509804, 1,
-0.3460783, -0.4120669, -0.9657745, 0, 1, 0.254902, 1,
-0.3451485, -1.372309, -3.935167, 0, 1, 0.2627451, 1,
-0.3443953, 0.04781157, -0.1879191, 0, 1, 0.2666667, 1,
-0.3435485, -0.5076606, -2.259246, 0, 1, 0.2745098, 1,
-0.3431593, 0.3458152, 0.9811617, 0, 1, 0.2784314, 1,
-0.3430908, -0.4547638, -1.99968, 0, 1, 0.2862745, 1,
-0.3418209, 0.9616187, -1.180398, 0, 1, 0.2901961, 1,
-0.3353712, 0.841741, 1.697402, 0, 1, 0.2980392, 1,
-0.3351913, -0.2777253, -1.675389, 0, 1, 0.3058824, 1,
-0.3344471, -0.02328207, -1.604426, 0, 1, 0.3098039, 1,
-0.3245418, 2.214259, 1.197366, 0, 1, 0.3176471, 1,
-0.3236057, 0.6512855, -1.084273, 0, 1, 0.3215686, 1,
-0.3212941, 1.107725, -0.7388129, 0, 1, 0.3294118, 1,
-0.3201053, -2.799797, -3.324235, 0, 1, 0.3333333, 1,
-0.3199981, -1.410412, -3.47413, 0, 1, 0.3411765, 1,
-0.317854, -2.152262, -2.963651, 0, 1, 0.345098, 1,
-0.3151407, -0.2486884, -0.6116499, 0, 1, 0.3529412, 1,
-0.3138931, 0.9481049, 0.05504652, 0, 1, 0.3568628, 1,
-0.3117246, 0.06708451, -1.427686, 0, 1, 0.3647059, 1,
-0.3051341, -0.6737731, -2.652333, 0, 1, 0.3686275, 1,
-0.3050993, 0.6357657, -0.2768507, 0, 1, 0.3764706, 1,
-0.3023491, 1.276649, -1.944539, 0, 1, 0.3803922, 1,
-0.3001679, -1.465598, -2.771025, 0, 1, 0.3882353, 1,
-0.2971054, -0.4950571, -1.299139, 0, 1, 0.3921569, 1,
-0.2951011, -1.056004, -2.915554, 0, 1, 0.4, 1,
-0.2907448, -0.06613909, -0.0972074, 0, 1, 0.4078431, 1,
-0.2887538, 0.4327411, -0.2569348, 0, 1, 0.4117647, 1,
-0.2882864, -1.710519, -2.140501, 0, 1, 0.4196078, 1,
-0.2877414, -1.863015, -3.199829, 0, 1, 0.4235294, 1,
-0.2875338, 0.5268496, 0.7228153, 0, 1, 0.4313726, 1,
-0.284653, -0.8124662, -1.757836, 0, 1, 0.4352941, 1,
-0.2739266, -1.100361, -3.77517, 0, 1, 0.4431373, 1,
-0.2729729, -0.9320882, -2.056241, 0, 1, 0.4470588, 1,
-0.266084, -0.005867475, -0.4840513, 0, 1, 0.454902, 1,
-0.26266, 0.3444357, -0.5540894, 0, 1, 0.4588235, 1,
-0.2620005, 0.8243353, -0.3046121, 0, 1, 0.4666667, 1,
-0.2567175, 0.6948949, -0.1045454, 0, 1, 0.4705882, 1,
-0.2498602, -1.138356, -2.69859, 0, 1, 0.4784314, 1,
-0.2493958, 0.05022451, -0.8063816, 0, 1, 0.4823529, 1,
-0.2490441, -1.291106, -3.084461, 0, 1, 0.4901961, 1,
-0.2440021, -0.6204993, -3.083402, 0, 1, 0.4941176, 1,
-0.2426065, -0.9097349, -3.511983, 0, 1, 0.5019608, 1,
-0.2370533, 0.2334649, -0.4179038, 0, 1, 0.509804, 1,
-0.2369159, 0.8722897, -0.07527824, 0, 1, 0.5137255, 1,
-0.2363321, 0.6958537, 0.4550054, 0, 1, 0.5215687, 1,
-0.2339805, 0.00310275, -3.569574, 0, 1, 0.5254902, 1,
-0.2325693, -0.2293458, -3.78592, 0, 1, 0.5333334, 1,
-0.2307469, 0.7179046, 1.029483, 0, 1, 0.5372549, 1,
-0.2282912, -1.437769, -4.891902, 0, 1, 0.5450981, 1,
-0.2206176, 1.652045, 0.6038661, 0, 1, 0.5490196, 1,
-0.2205239, -0.5357775, -3.75831, 0, 1, 0.5568628, 1,
-0.219519, -1.846491, -4.226074, 0, 1, 0.5607843, 1,
-0.215593, 0.1198784, -2.478494, 0, 1, 0.5686275, 1,
-0.2132277, 0.8377717, -1.13264, 0, 1, 0.572549, 1,
-0.210998, -0.04173061, -1.810724, 0, 1, 0.5803922, 1,
-0.2094229, 1.583256, -0.9991587, 0, 1, 0.5843138, 1,
-0.2093655, -0.7550179, -1.873924, 0, 1, 0.5921569, 1,
-0.2089034, -0.8336904, -2.913061, 0, 1, 0.5960785, 1,
-0.2078428, -0.8315011, -2.352899, 0, 1, 0.6039216, 1,
-0.2035301, 0.6350797, -1.490607, 0, 1, 0.6117647, 1,
-0.2026001, -1.267703, -2.489661, 0, 1, 0.6156863, 1,
-0.2017486, 0.08574559, -0.9279314, 0, 1, 0.6235294, 1,
-0.200672, -0.05071046, -0.408226, 0, 1, 0.627451, 1,
-0.1976753, 0.2417699, -1.27023, 0, 1, 0.6352941, 1,
-0.1970354, 1.32603, -2.387162, 0, 1, 0.6392157, 1,
-0.1961034, -1.461265, -4.754971, 0, 1, 0.6470588, 1,
-0.1960706, -0.7537901, -2.243791, 0, 1, 0.6509804, 1,
-0.1954674, -0.3091494, -2.130508, 0, 1, 0.6588235, 1,
-0.1939585, -1.443112, -3.896196, 0, 1, 0.6627451, 1,
-0.1923717, -0.6027582, -2.230571, 0, 1, 0.6705883, 1,
-0.1913781, 1.097399, -0.238334, 0, 1, 0.6745098, 1,
-0.1907431, -0.5096038, -2.64333, 0, 1, 0.682353, 1,
-0.1798023, -0.4762112, -3.66323, 0, 1, 0.6862745, 1,
-0.1777211, -0.6178342, -2.161542, 0, 1, 0.6941177, 1,
-0.1734676, -0.2658819, -2.958567, 0, 1, 0.7019608, 1,
-0.1717837, -0.136999, -2.473766, 0, 1, 0.7058824, 1,
-0.1712095, -0.7516608, -3.598871, 0, 1, 0.7137255, 1,
-0.1685375, 0.5557647, 1.061864, 0, 1, 0.7176471, 1,
-0.1602787, -0.9437081, -1.458499, 0, 1, 0.7254902, 1,
-0.1485581, 0.5842502, -1.304764, 0, 1, 0.7294118, 1,
-0.1473495, -1.134229, -2.918725, 0, 1, 0.7372549, 1,
-0.1464948, -0.100929, -1.756429, 0, 1, 0.7411765, 1,
-0.1463113, 0.906356, -1.832673, 0, 1, 0.7490196, 1,
-0.1452808, -0.4026534, -2.28093, 0, 1, 0.7529412, 1,
-0.1435971, 0.7639629, -0.6046683, 0, 1, 0.7607843, 1,
-0.1350323, -0.04671082, -2.226247, 0, 1, 0.7647059, 1,
-0.1333364, -0.175773, -3.825545, 0, 1, 0.772549, 1,
-0.1308609, -1.046218, -2.283612, 0, 1, 0.7764706, 1,
-0.1302051, -1.288016, -4.860789, 0, 1, 0.7843137, 1,
-0.1296872, 0.5406671, 0.9098777, 0, 1, 0.7882353, 1,
-0.118074, -0.9695213, -0.6696425, 0, 1, 0.7960784, 1,
-0.1115108, 1.354911, -1.968012, 0, 1, 0.8039216, 1,
-0.1082596, 0.6688917, -1.115433, 0, 1, 0.8078431, 1,
-0.1053676, 0.1775846, 0.341141, 0, 1, 0.8156863, 1,
-0.09694239, 0.8201291, -0.02072626, 0, 1, 0.8196079, 1,
-0.09638175, -1.520869, -3.075489, 0, 1, 0.827451, 1,
-0.09378965, 0.7664578, 0.1458709, 0, 1, 0.8313726, 1,
-0.09310157, -0.03202553, -3.182195, 0, 1, 0.8392157, 1,
-0.08948168, 0.03633372, -2.506855, 0, 1, 0.8431373, 1,
-0.08868199, 0.769986, -0.630028, 0, 1, 0.8509804, 1,
-0.08708781, 0.4098518, 0.8856446, 0, 1, 0.854902, 1,
-0.07965203, 2.171581, -1.471873, 0, 1, 0.8627451, 1,
-0.07865065, -1.790213, -3.700225, 0, 1, 0.8666667, 1,
-0.07653975, -0.8364158, -3.313213, 0, 1, 0.8745098, 1,
-0.07615817, 0.7254493, -2.656484, 0, 1, 0.8784314, 1,
-0.07089282, -0.1296754, -2.603703, 0, 1, 0.8862745, 1,
-0.07029588, 0.5891392, -1.620174, 0, 1, 0.8901961, 1,
-0.06970056, 0.0004189635, -2.642157, 0, 1, 0.8980392, 1,
-0.06899206, -0.4933583, -2.96868, 0, 1, 0.9058824, 1,
-0.06260902, -0.5288275, -2.810203, 0, 1, 0.9098039, 1,
-0.05986166, 0.3534317, 0.3612015, 0, 1, 0.9176471, 1,
-0.05957424, 0.5789186, -1.059144, 0, 1, 0.9215686, 1,
-0.05496954, -0.2807937, -3.381401, 0, 1, 0.9294118, 1,
-0.04760053, -1.638764, -1.527417, 0, 1, 0.9333333, 1,
-0.03664307, 0.162744, 0.7247564, 0, 1, 0.9411765, 1,
-0.03361623, 0.7682748, -0.808818, 0, 1, 0.945098, 1,
-0.02929253, 1.659734, -0.4862243, 0, 1, 0.9529412, 1,
-0.02852402, 0.2044142, -0.7514687, 0, 1, 0.9568627, 1,
-0.02822047, 0.04338273, -0.6224534, 0, 1, 0.9647059, 1,
-0.02809166, -2.021876, -4.675612, 0, 1, 0.9686275, 1,
-0.02765606, 0.2605459, 0.6131405, 0, 1, 0.9764706, 1,
-0.02280679, -2.201168, -1.343795, 0, 1, 0.9803922, 1,
-0.02061144, 0.7913367, -2.126855, 0, 1, 0.9882353, 1,
-0.01938082, 1.486127, -0.7669639, 0, 1, 0.9921569, 1,
-0.01824053, 0.2624221, -1.00244, 0, 1, 1, 1,
-0.01647586, 0.5846974, -1.320981, 0, 0.9921569, 1, 1,
-0.008703542, 0.3676631, -1.365295, 0, 0.9882353, 1, 1,
-0.006409867, 0.3120224, 0.7630436, 0, 0.9803922, 1, 1,
0.00115373, 0.3163129, -0.8957334, 0, 0.9764706, 1, 1,
0.002228689, -0.3110234, 3.159982, 0, 0.9686275, 1, 1,
0.00415851, 1.316102, 1.10565, 0, 0.9647059, 1, 1,
0.007458925, -1.238674, 2.979823, 0, 0.9568627, 1, 1,
0.007658319, -0.3078821, 2.98608, 0, 0.9529412, 1, 1,
0.01133912, 0.7803483, 0.6405295, 0, 0.945098, 1, 1,
0.01394033, -1.200065, 1.232785, 0, 0.9411765, 1, 1,
0.0175714, -1.144866, 3.941145, 0, 0.9333333, 1, 1,
0.018431, -2.184792, 1.461677, 0, 0.9294118, 1, 1,
0.0233726, 1.39658, 0.5720738, 0, 0.9215686, 1, 1,
0.02657227, -0.5714527, 3.351815, 0, 0.9176471, 1, 1,
0.03128057, -1.079696, 1.780976, 0, 0.9098039, 1, 1,
0.03166642, -1.049102, 3.302795, 0, 0.9058824, 1, 1,
0.03335809, 0.5391876, 0.634184, 0, 0.8980392, 1, 1,
0.03446227, 0.3536579, -1.135139, 0, 0.8901961, 1, 1,
0.03583998, 0.2590229, 0.5397701, 0, 0.8862745, 1, 1,
0.03595332, -0.2676995, 2.95766, 0, 0.8784314, 1, 1,
0.05124123, -0.4012277, 2.94585, 0, 0.8745098, 1, 1,
0.05305158, -0.2118473, 4.312098, 0, 0.8666667, 1, 1,
0.05430099, -0.8337054, 2.955757, 0, 0.8627451, 1, 1,
0.05480029, 0.1472095, 0.6013547, 0, 0.854902, 1, 1,
0.05679832, 0.5535005, -0.8721023, 0, 0.8509804, 1, 1,
0.05754103, 0.9782115, 0.8894601, 0, 0.8431373, 1, 1,
0.0589366, 0.4208749, -0.1251421, 0, 0.8392157, 1, 1,
0.06208195, 0.3226117, 1.665448, 0, 0.8313726, 1, 1,
0.06269144, 1.005492, -0.3976432, 0, 0.827451, 1, 1,
0.0641287, -1.299019, 4.133576, 0, 0.8196079, 1, 1,
0.06546039, -0.06402961, 3.644763, 0, 0.8156863, 1, 1,
0.06563926, -0.6307349, 4.546316, 0, 0.8078431, 1, 1,
0.0684804, 1.080561, -1.083693, 0, 0.8039216, 1, 1,
0.07441238, -0.5924209, 4.47961, 0, 0.7960784, 1, 1,
0.07669984, -1.654935, 2.343235, 0, 0.7882353, 1, 1,
0.07823834, 0.3303231, 0.4688657, 0, 0.7843137, 1, 1,
0.0836378, -0.7885588, 1.97809, 0, 0.7764706, 1, 1,
0.08974438, -0.9484389, 1.890197, 0, 0.772549, 1, 1,
0.09043328, 0.9711307, -1.739499, 0, 0.7647059, 1, 1,
0.09140126, -2.50153, 4.20258, 0, 0.7607843, 1, 1,
0.09503475, 1.146966, -0.006262587, 0, 0.7529412, 1, 1,
0.09904639, -0.1342794, 1.415468, 0, 0.7490196, 1, 1,
0.1000482, 0.5443602, -0.7605784, 0, 0.7411765, 1, 1,
0.1000955, 0.03293913, 0.8996435, 0, 0.7372549, 1, 1,
0.1057125, 0.6257568, 1.914464, 0, 0.7294118, 1, 1,
0.1112084, -1.098161, 1.424332, 0, 0.7254902, 1, 1,
0.1158886, -2.646816, 2.759676, 0, 0.7176471, 1, 1,
0.1214159, 0.8560574, 0.02725492, 0, 0.7137255, 1, 1,
0.1224906, -0.5008436, 3.499969, 0, 0.7058824, 1, 1,
0.1230675, -1.927502, 2.44358, 0, 0.6980392, 1, 1,
0.1289464, -0.5376017, 1.201655, 0, 0.6941177, 1, 1,
0.1293175, -0.1562238, 2.300887, 0, 0.6862745, 1, 1,
0.1316674, 0.4289314, 1.007935, 0, 0.682353, 1, 1,
0.1328817, 0.3910637, 0.8921734, 0, 0.6745098, 1, 1,
0.1334189, 0.2253209, 0.5090203, 0, 0.6705883, 1, 1,
0.1348013, 1.096301, 0.6823559, 0, 0.6627451, 1, 1,
0.1353551, 0.4581321, -1.295528, 0, 0.6588235, 1, 1,
0.1369748, -0.1656603, 3.798466, 0, 0.6509804, 1, 1,
0.1420142, -0.4476815, 2.123241, 0, 0.6470588, 1, 1,
0.1430585, -0.8170052, 4.17218, 0, 0.6392157, 1, 1,
0.1433762, 1.267337, 0.7714867, 0, 0.6352941, 1, 1,
0.1465014, -0.9307718, 2.535327, 0, 0.627451, 1, 1,
0.1481653, 1.130688, -0.504482, 0, 0.6235294, 1, 1,
0.1506156, -0.4262028, 4.168273, 0, 0.6156863, 1, 1,
0.1536372, -0.01772876, 1.860526, 0, 0.6117647, 1, 1,
0.158163, -0.3450674, 3.231785, 0, 0.6039216, 1, 1,
0.1591913, -1.045279, 2.439878, 0, 0.5960785, 1, 1,
0.16033, 0.05450987, 1.625615, 0, 0.5921569, 1, 1,
0.1616887, 0.9056354, -0.5472986, 0, 0.5843138, 1, 1,
0.1620767, -0.6739272, 3.151557, 0, 0.5803922, 1, 1,
0.1639374, 0.2403882, 0.2471228, 0, 0.572549, 1, 1,
0.1641599, 0.3439234, 0.9274351, 0, 0.5686275, 1, 1,
0.164801, 0.2065397, -0.5429285, 0, 0.5607843, 1, 1,
0.1648923, -1.698749, 2.008079, 0, 0.5568628, 1, 1,
0.16529, -0.1605474, 2.522897, 0, 0.5490196, 1, 1,
0.1653575, -0.4924305, 3.07237, 0, 0.5450981, 1, 1,
0.1668542, 0.5299088, 0.8902366, 0, 0.5372549, 1, 1,
0.167836, -1.627631, 1.988654, 0, 0.5333334, 1, 1,
0.1710548, 0.3218195, 0.3409383, 0, 0.5254902, 1, 1,
0.1751075, 0.8919399, 0.5460377, 0, 0.5215687, 1, 1,
0.1753504, 1.325113, 0.8476012, 0, 0.5137255, 1, 1,
0.1786426, 0.6405187, 0.3382649, 0, 0.509804, 1, 1,
0.1790668, -0.2715653, 2.106937, 0, 0.5019608, 1, 1,
0.1794475, -1.127354, 3.398118, 0, 0.4941176, 1, 1,
0.190366, -0.5655454, 2.038699, 0, 0.4901961, 1, 1,
0.195446, 0.8129193, 1.513507, 0, 0.4823529, 1, 1,
0.1968553, -0.2227639, 2.545446, 0, 0.4784314, 1, 1,
0.2031475, -0.8672906, 3.136291, 0, 0.4705882, 1, 1,
0.2054649, -0.9650687, 3.861848, 0, 0.4666667, 1, 1,
0.2068194, 0.6612442, 1.216581, 0, 0.4588235, 1, 1,
0.2147602, 0.1051172, 0.9992214, 0, 0.454902, 1, 1,
0.216682, 0.7738147, -0.1692136, 0, 0.4470588, 1, 1,
0.2178288, -0.1960129, 2.292493, 0, 0.4431373, 1, 1,
0.2187351, 2.202313, 0.8690104, 0, 0.4352941, 1, 1,
0.2192494, -2.049301, 1.446737, 0, 0.4313726, 1, 1,
0.2297361, -0.7654248, 1.913882, 0, 0.4235294, 1, 1,
0.2300538, 1.445803, 0.5652401, 0, 0.4196078, 1, 1,
0.2319026, -1.904625, 3.023072, 0, 0.4117647, 1, 1,
0.23534, 1.57241, -0.8468262, 0, 0.4078431, 1, 1,
0.2404844, -1.642725, 3.210799, 0, 0.4, 1, 1,
0.2407965, 1.421136, -0.9056233, 0, 0.3921569, 1, 1,
0.2431602, -0.3573065, 3.288411, 0, 0.3882353, 1, 1,
0.2441719, -0.4251084, 2.257528, 0, 0.3803922, 1, 1,
0.2449582, -0.1842107, 1.703488, 0, 0.3764706, 1, 1,
0.2465096, 0.830691, -0.2061571, 0, 0.3686275, 1, 1,
0.2467088, -0.4808613, 0.3103665, 0, 0.3647059, 1, 1,
0.2504137, 0.352802, -0.3270426, 0, 0.3568628, 1, 1,
0.2557787, 0.4978321, 0.2316533, 0, 0.3529412, 1, 1,
0.2561417, 0.02687215, 1.432254, 0, 0.345098, 1, 1,
0.2563649, 0.003263871, 2.095244, 0, 0.3411765, 1, 1,
0.2589197, -0.2686229, 1.887695, 0, 0.3333333, 1, 1,
0.2593625, 0.957581, -0.1613187, 0, 0.3294118, 1, 1,
0.2612942, -1.124547, 3.830636, 0, 0.3215686, 1, 1,
0.2629858, 0.1918505, 1.718094, 0, 0.3176471, 1, 1,
0.2641976, -0.2255756, 1.302651, 0, 0.3098039, 1, 1,
0.2642533, -2.043044, 3.389851, 0, 0.3058824, 1, 1,
0.2656447, -0.934098, 4.478916, 0, 0.2980392, 1, 1,
0.2673955, 0.881945, 1.417613, 0, 0.2901961, 1, 1,
0.2776951, -0.4045821, 2.064535, 0, 0.2862745, 1, 1,
0.2784144, -0.07675597, 0.651037, 0, 0.2784314, 1, 1,
0.2785121, 0.2858154, 1.206418, 0, 0.2745098, 1, 1,
0.2798646, -0.7476274, 5.587209, 0, 0.2666667, 1, 1,
0.281862, -0.2354491, 2.379208, 0, 0.2627451, 1, 1,
0.2819478, -0.088048, 1.813102, 0, 0.254902, 1, 1,
0.2828301, -1.61503, 2.075513, 0, 0.2509804, 1, 1,
0.2876443, -0.4693211, 1.82619, 0, 0.2431373, 1, 1,
0.2877768, 1.010092, -1.051788, 0, 0.2392157, 1, 1,
0.2885807, -0.3532697, 1.876815, 0, 0.2313726, 1, 1,
0.289191, -0.5244573, 2.43941, 0, 0.227451, 1, 1,
0.2950178, -0.004827631, 0.04429869, 0, 0.2196078, 1, 1,
0.2953138, 1.586333, 0.4193616, 0, 0.2156863, 1, 1,
0.2979818, 0.1403851, 2.324753, 0, 0.2078431, 1, 1,
0.3016881, -0.9673575, 2.375731, 0, 0.2039216, 1, 1,
0.3033787, -0.005681138, 1.454602, 0, 0.1960784, 1, 1,
0.3104594, -0.8814809, 4.000415, 0, 0.1882353, 1, 1,
0.3112077, -0.1264198, 2.334292, 0, 0.1843137, 1, 1,
0.3115499, 0.6360635, 0.8328884, 0, 0.1764706, 1, 1,
0.3135989, 0.6518478, 0.5830415, 0, 0.172549, 1, 1,
0.3175657, 0.3758121, -0.1122825, 0, 0.1647059, 1, 1,
0.3192004, 0.4859465, -1.468356, 0, 0.1607843, 1, 1,
0.3203587, 0.546243, -1.244612, 0, 0.1529412, 1, 1,
0.3270221, 0.6157597, -0.3252741, 0, 0.1490196, 1, 1,
0.3295624, -0.7509776, 4.759965, 0, 0.1411765, 1, 1,
0.3311858, -0.4253714, 1.933738, 0, 0.1372549, 1, 1,
0.3320691, -1.092061, 2.235495, 0, 0.1294118, 1, 1,
0.3323395, 1.425075, 0.01437063, 0, 0.1254902, 1, 1,
0.3324806, 1.552333, -0.5815198, 0, 0.1176471, 1, 1,
0.3410392, 0.8847835, 0.006612316, 0, 0.1137255, 1, 1,
0.3418255, -0.2004423, 1.296588, 0, 0.1058824, 1, 1,
0.3464987, -0.8576885, 2.420401, 0, 0.09803922, 1, 1,
0.3474005, -1.048732, 3.182595, 0, 0.09411765, 1, 1,
0.3478333, -0.246291, 1.932452, 0, 0.08627451, 1, 1,
0.3548263, -2.388197, 2.121318, 0, 0.08235294, 1, 1,
0.3581536, 1.417849, 1.632671, 0, 0.07450981, 1, 1,
0.3589206, -0.8842784, 4.130205, 0, 0.07058824, 1, 1,
0.3595689, 0.2733628, 0.6476849, 0, 0.0627451, 1, 1,
0.3674255, -0.9003902, 3.829984, 0, 0.05882353, 1, 1,
0.372969, -0.1921459, 2.953943, 0, 0.05098039, 1, 1,
0.3752979, 0.5172905, 1.052297, 0, 0.04705882, 1, 1,
0.3782758, -0.6753157, 4.091825, 0, 0.03921569, 1, 1,
0.378696, 0.9277348, 1.038552, 0, 0.03529412, 1, 1,
0.3806049, 1.039384, 0.08246956, 0, 0.02745098, 1, 1,
0.3845385, -0.7133635, 3.798898, 0, 0.02352941, 1, 1,
0.3846448, 1.666144, 0.9292033, 0, 0.01568628, 1, 1,
0.3861914, 0.4227951, 0.7217835, 0, 0.01176471, 1, 1,
0.391839, 0.06825456, 1.89378, 0, 0.003921569, 1, 1,
0.3968122, -0.7199055, 4.498998, 0.003921569, 0, 1, 1,
0.396856, -0.1837106, 2.552992, 0.007843138, 0, 1, 1,
0.4013881, -0.1198026, 1.463737, 0.01568628, 0, 1, 1,
0.4099614, -0.06466341, 1.550697, 0.01960784, 0, 1, 1,
0.4131372, 0.1267022, 0.5500733, 0.02745098, 0, 1, 1,
0.4161486, -1.541036, 1.653821, 0.03137255, 0, 1, 1,
0.424825, 0.3152671, 1.609606, 0.03921569, 0, 1, 1,
0.4278313, 0.1610829, 2.826473, 0.04313726, 0, 1, 1,
0.4310759, 0.1279162, 0.03582443, 0.05098039, 0, 1, 1,
0.433325, -0.5727252, 2.173372, 0.05490196, 0, 1, 1,
0.4342146, 0.8749514, 1.470016, 0.0627451, 0, 1, 1,
0.4425703, -0.6744131, 3.194428, 0.06666667, 0, 1, 1,
0.4451251, 0.8064672, 0.971691, 0.07450981, 0, 1, 1,
0.4467441, 0.1057632, 1.654261, 0.07843138, 0, 1, 1,
0.4498027, -0.7316583, -0.01140975, 0.08627451, 0, 1, 1,
0.4504726, -0.4406687, 2.306333, 0.09019608, 0, 1, 1,
0.4532368, -1.700334, 2.608554, 0.09803922, 0, 1, 1,
0.454937, -0.1458054, 2.982376, 0.1058824, 0, 1, 1,
0.4562033, 1.270419, 0.5109599, 0.1098039, 0, 1, 1,
0.4584943, 0.619078, -1.805778, 0.1176471, 0, 1, 1,
0.4635693, 0.8162371, 0.4624993, 0.1215686, 0, 1, 1,
0.4651013, -1.37123, 2.930989, 0.1294118, 0, 1, 1,
0.4685192, -0.1509396, 1.750851, 0.1333333, 0, 1, 1,
0.4813485, -0.2588242, 1.956915, 0.1411765, 0, 1, 1,
0.4894651, -0.5334567, 2.852682, 0.145098, 0, 1, 1,
0.4922075, -0.07926808, 0.1586219, 0.1529412, 0, 1, 1,
0.5018156, -1.390189, 4.217021, 0.1568628, 0, 1, 1,
0.5024192, 1.562072, 0.1990305, 0.1647059, 0, 1, 1,
0.5072831, 0.89876, 1.457724, 0.1686275, 0, 1, 1,
0.5073543, 0.5117568, 2.005104, 0.1764706, 0, 1, 1,
0.5091425, 0.9828311, -0.3871119, 0.1803922, 0, 1, 1,
0.5155413, -0.002418973, 1.601435, 0.1882353, 0, 1, 1,
0.5164313, 0.5460605, 0.7768778, 0.1921569, 0, 1, 1,
0.5185093, -1.22776, 3.448534, 0.2, 0, 1, 1,
0.5231365, 0.8344692, 2.017169, 0.2078431, 0, 1, 1,
0.5241612, -1.697061, 2.546478, 0.2117647, 0, 1, 1,
0.5254579, -0.0926863, 0.1146562, 0.2196078, 0, 1, 1,
0.5256026, -0.4702212, 3.454306, 0.2235294, 0, 1, 1,
0.5273947, -0.8510011, 3.421795, 0.2313726, 0, 1, 1,
0.5350592, 0.6839812, -0.3915801, 0.2352941, 0, 1, 1,
0.5427881, 0.9942487, -0.6949438, 0.2431373, 0, 1, 1,
0.5442688, 0.5587984, 1.662466, 0.2470588, 0, 1, 1,
0.5447562, 0.2753431, -0.5504667, 0.254902, 0, 1, 1,
0.546881, 1.463884, 3.139334, 0.2588235, 0, 1, 1,
0.5532709, 0.1505773, 2.747394, 0.2666667, 0, 1, 1,
0.5597044, 0.6270402, 1.591555, 0.2705882, 0, 1, 1,
0.5639502, -0.3391257, 0.8561879, 0.2784314, 0, 1, 1,
0.5663127, 1.024161, 0.8677202, 0.282353, 0, 1, 1,
0.566985, -0.3789094, 1.91886, 0.2901961, 0, 1, 1,
0.5713362, -0.05350697, 1.01243, 0.2941177, 0, 1, 1,
0.5739481, 0.221269, 3.254002, 0.3019608, 0, 1, 1,
0.5740536, 0.1042326, 0.8967975, 0.3098039, 0, 1, 1,
0.5747272, 0.4180492, 1.46152, 0.3137255, 0, 1, 1,
0.5755222, -0.374329, 2.917105, 0.3215686, 0, 1, 1,
0.5789783, -1.361108, 1.607146, 0.3254902, 0, 1, 1,
0.5840675, -0.411477, 0.8688008, 0.3333333, 0, 1, 1,
0.5870397, 0.3708683, 1.281945, 0.3372549, 0, 1, 1,
0.5878603, -1.227511, 3.751496, 0.345098, 0, 1, 1,
0.5892292, -0.1189099, 1.088, 0.3490196, 0, 1, 1,
0.589626, 0.041005, 1.184149, 0.3568628, 0, 1, 1,
0.5964361, -0.2044276, 1.865202, 0.3607843, 0, 1, 1,
0.5975822, -1.798278, 1.447581, 0.3686275, 0, 1, 1,
0.6005142, 0.1716827, -0.06753761, 0.372549, 0, 1, 1,
0.6042296, 0.9996565, 1.060186, 0.3803922, 0, 1, 1,
0.6108739, -0.6306252, 2.011235, 0.3843137, 0, 1, 1,
0.6111693, 1.454885, -0.7514687, 0.3921569, 0, 1, 1,
0.6139261, -0.3233493, 1.175594, 0.3960784, 0, 1, 1,
0.6243781, -1.869694, 2.904379, 0.4039216, 0, 1, 1,
0.625658, 1.855142, 0.6855644, 0.4117647, 0, 1, 1,
0.6294915, -0.2998108, 2.72377, 0.4156863, 0, 1, 1,
0.642427, 0.537076, 1.274598, 0.4235294, 0, 1, 1,
0.6455038, -0.8348438, 0.7616051, 0.427451, 0, 1, 1,
0.6479264, 0.0391284, 2.509071, 0.4352941, 0, 1, 1,
0.6498832, -0.1938837, 1.707829, 0.4392157, 0, 1, 1,
0.6527141, -0.2659622, 3.005138, 0.4470588, 0, 1, 1,
0.6575605, 0.4822978, 0.892232, 0.4509804, 0, 1, 1,
0.6596889, 0.0114366, 0.9962665, 0.4588235, 0, 1, 1,
0.6642532, 0.824012, 1.583901, 0.4627451, 0, 1, 1,
0.6669984, -0.3618465, 2.151482, 0.4705882, 0, 1, 1,
0.6699867, -1.514032, 1.484898, 0.4745098, 0, 1, 1,
0.6743473, -1.516391, 2.577955, 0.4823529, 0, 1, 1,
0.6785336, -2.991334, 3.534749, 0.4862745, 0, 1, 1,
0.6816549, 0.4333448, 1.378727, 0.4941176, 0, 1, 1,
0.6849087, 1.269264, 1.083117, 0.5019608, 0, 1, 1,
0.6854973, -2.05055, 2.626473, 0.5058824, 0, 1, 1,
0.687111, 0.4250023, 0.7578877, 0.5137255, 0, 1, 1,
0.689007, -1.924621, 3.600258, 0.5176471, 0, 1, 1,
0.6894446, -0.8894157, 3.57605, 0.5254902, 0, 1, 1,
0.6900835, 0.8070352, -0.425175, 0.5294118, 0, 1, 1,
0.693064, 0.4263717, -0.463858, 0.5372549, 0, 1, 1,
0.6944529, -0.8955763, 4.054227, 0.5411765, 0, 1, 1,
0.6948254, 0.3743354, -0.40707, 0.5490196, 0, 1, 1,
0.6953884, -0.268578, 3.582503, 0.5529412, 0, 1, 1,
0.6963914, -1.059897, 4.394354, 0.5607843, 0, 1, 1,
0.6990576, 1.245676, 1.219686, 0.5647059, 0, 1, 1,
0.7000594, -1.138975, 3.164703, 0.572549, 0, 1, 1,
0.7022335, 2.242721, 0.6272531, 0.5764706, 0, 1, 1,
0.7050797, 0.5406483, 0.2077274, 0.5843138, 0, 1, 1,
0.7089515, 0.3235691, 0.4840512, 0.5882353, 0, 1, 1,
0.71028, 0.1502931, 1.101025, 0.5960785, 0, 1, 1,
0.7111333, 0.2877391, 0.568355, 0.6039216, 0, 1, 1,
0.718069, -2.806262, 5.026158, 0.6078432, 0, 1, 1,
0.720081, -0.3542766, 4.769452, 0.6156863, 0, 1, 1,
0.7232721, 0.9982319, -0.9593705, 0.6196079, 0, 1, 1,
0.7258358, 0.3193736, -0.1632866, 0.627451, 0, 1, 1,
0.7302349, -0.9954039, 1.254858, 0.6313726, 0, 1, 1,
0.7331098, -0.4772969, 2.947431, 0.6392157, 0, 1, 1,
0.7336624, 0.2106358, 0.8221044, 0.6431373, 0, 1, 1,
0.7378709, 1.173555, -0.8981835, 0.6509804, 0, 1, 1,
0.7432331, 0.7738333, 1.067532, 0.654902, 0, 1, 1,
0.7454521, -2.029904, 1.602621, 0.6627451, 0, 1, 1,
0.7527997, -1.545903, 2.647557, 0.6666667, 0, 1, 1,
0.7558858, 0.3263849, 0.277838, 0.6745098, 0, 1, 1,
0.7635691, 0.8138855, 1.850586, 0.6784314, 0, 1, 1,
0.7656907, 0.7418633, 0.5957623, 0.6862745, 0, 1, 1,
0.7681056, -0.06803191, 1.700745, 0.6901961, 0, 1, 1,
0.7758096, 0.4862124, 2.112343, 0.6980392, 0, 1, 1,
0.777719, 0.3770207, 0.7976047, 0.7058824, 0, 1, 1,
0.7874826, 0.700348, -0.9667938, 0.7098039, 0, 1, 1,
0.7917352, 1.205564, -1.187167, 0.7176471, 0, 1, 1,
0.7925014, -1.009578, 2.849636, 0.7215686, 0, 1, 1,
0.7963995, 0.2772546, 1.188448, 0.7294118, 0, 1, 1,
0.7964157, 0.5264017, 1.203896, 0.7333333, 0, 1, 1,
0.8016596, -1.183987, 1.48101, 0.7411765, 0, 1, 1,
0.8056485, -0.3381451, 0.7504556, 0.7450981, 0, 1, 1,
0.81639, 0.6379139, 1.58171, 0.7529412, 0, 1, 1,
0.8184419, 0.4246638, -0.3207501, 0.7568628, 0, 1, 1,
0.8192233, -0.97895, 1.782155, 0.7647059, 0, 1, 1,
0.8206917, -0.7458891, 2.06626, 0.7686275, 0, 1, 1,
0.8208758, 0.6459072, 1.046785, 0.7764706, 0, 1, 1,
0.8209465, 0.6985604, 0.6877127, 0.7803922, 0, 1, 1,
0.8217531, -0.1872537, 2.4758, 0.7882353, 0, 1, 1,
0.8329049, 0.291138, -1.999139, 0.7921569, 0, 1, 1,
0.8340398, -0.3668166, 2.110459, 0.8, 0, 1, 1,
0.8359952, 0.2450118, 2.392653, 0.8078431, 0, 1, 1,
0.8374729, -1.621982, 0.2499754, 0.8117647, 0, 1, 1,
0.8379145, 1.47408, 0.08273899, 0.8196079, 0, 1, 1,
0.8426834, 0.378096, 2.745453, 0.8235294, 0, 1, 1,
0.844656, 0.7353773, 0.8349178, 0.8313726, 0, 1, 1,
0.8509184, 0.2992349, 0.5787244, 0.8352941, 0, 1, 1,
0.8527815, -0.5605343, 1.689151, 0.8431373, 0, 1, 1,
0.8786784, -1.764217, 2.881761, 0.8470588, 0, 1, 1,
0.8824761, 0.7202766, 0.6588864, 0.854902, 0, 1, 1,
0.885523, 0.4499548, 1.47378, 0.8588235, 0, 1, 1,
0.8878672, 1.43389, 0.6215917, 0.8666667, 0, 1, 1,
0.8898235, 1.014124, 2.143356, 0.8705882, 0, 1, 1,
0.8940282, 0.5334695, 1.588313, 0.8784314, 0, 1, 1,
0.8943858, -0.3245681, 2.706933, 0.8823529, 0, 1, 1,
0.8970897, -1.225555, 2.105777, 0.8901961, 0, 1, 1,
0.8984231, 0.8677672, 2.27171, 0.8941177, 0, 1, 1,
0.9120576, 0.8627154, 0.7564023, 0.9019608, 0, 1, 1,
0.921984, -0.7271898, 1.685209, 0.9098039, 0, 1, 1,
0.9229875, -1.322538, 2.02006, 0.9137255, 0, 1, 1,
0.9275719, 0.4074953, 1.09806, 0.9215686, 0, 1, 1,
0.929279, -0.5868235, 4.589496, 0.9254902, 0, 1, 1,
0.9302529, -0.05689469, 0.4409012, 0.9333333, 0, 1, 1,
0.931992, 0.1581473, 2.695347, 0.9372549, 0, 1, 1,
0.9333086, -0.09589949, 2.821485, 0.945098, 0, 1, 1,
0.936698, 0.2690183, 0.4921271, 0.9490196, 0, 1, 1,
0.9426268, -0.4642063, 4.798578, 0.9568627, 0, 1, 1,
0.9428738, -0.6327885, 1.666495, 0.9607843, 0, 1, 1,
0.9446651, 2.436714, 0.3544525, 0.9686275, 0, 1, 1,
0.9461228, 0.2286482, 2.073772, 0.972549, 0, 1, 1,
0.9488665, 1.35013, 0.1202651, 0.9803922, 0, 1, 1,
0.9519506, -2.064823, 4.274935, 0.9843137, 0, 1, 1,
0.9550478, 0.5600276, 1.649185, 0.9921569, 0, 1, 1,
0.9609093, 0.1788046, 2.47035, 0.9960784, 0, 1, 1,
0.9612245, -0.4339084, 2.120555, 1, 0, 0.9960784, 1,
0.9633963, -0.1140674, 1.043818, 1, 0, 0.9882353, 1,
0.9639358, -0.09572067, 0.9863982, 1, 0, 0.9843137, 1,
0.9649587, 1.520089, 0.8382853, 1, 0, 0.9764706, 1,
0.9671214, 0.2788935, 4.415364, 1, 0, 0.972549, 1,
0.9688517, 0.5104969, 1.964774, 1, 0, 0.9647059, 1,
0.9689668, -2.024277, 2.578791, 1, 0, 0.9607843, 1,
0.9689672, 0.390149, 3.236524, 1, 0, 0.9529412, 1,
0.9690401, -1.474682, 3.299999, 1, 0, 0.9490196, 1,
0.970521, 1.756943, -0.2367124, 1, 0, 0.9411765, 1,
0.9720894, 0.388608, 1.246726, 1, 0, 0.9372549, 1,
0.9768192, -0.1815053, 1.475178, 1, 0, 0.9294118, 1,
0.9780746, -1.443639, 3.516097, 1, 0, 0.9254902, 1,
0.9804401, 0.1037772, 1.909323, 1, 0, 0.9176471, 1,
0.9828705, -0.8874421, 1.935414, 1, 0, 0.9137255, 1,
0.9882324, -0.5277922, 1.176847, 1, 0, 0.9058824, 1,
0.9970458, -0.0578447, 1.300311, 1, 0, 0.9019608, 1,
1.004133, -0.8762066, 0.1818278, 1, 0, 0.8941177, 1,
1.005305, -0.2186319, 1.003078, 1, 0, 0.8862745, 1,
1.006885, -1.157111, 1.867362, 1, 0, 0.8823529, 1,
1.007165, -0.1811448, 0.4633991, 1, 0, 0.8745098, 1,
1.009624, 1.306795, 0.7977696, 1, 0, 0.8705882, 1,
1.013244, 0.9508063, 0.5362161, 1, 0, 0.8627451, 1,
1.016912, -2.18755, 1.981197, 1, 0, 0.8588235, 1,
1.020875, 0.9324679, 0.4284348, 1, 0, 0.8509804, 1,
1.024052, 0.7700786, 2.12572, 1, 0, 0.8470588, 1,
1.025284, 0.6269448, 1.382827, 1, 0, 0.8392157, 1,
1.031399, -0.494165, -0.2184155, 1, 0, 0.8352941, 1,
1.035004, 0.6337188, 1.403472, 1, 0, 0.827451, 1,
1.037473, -1.618925, 3.267365, 1, 0, 0.8235294, 1,
1.046408, -0.4414274, 1.071535, 1, 0, 0.8156863, 1,
1.047395, -1.290231, 4.334152, 1, 0, 0.8117647, 1,
1.051192, 0.5236169, -0.6138998, 1, 0, 0.8039216, 1,
1.062688, 0.510572, 2.365532, 1, 0, 0.7960784, 1,
1.066298, 2.211763, -0.1955533, 1, 0, 0.7921569, 1,
1.078228, 0.08203676, 0.5268061, 1, 0, 0.7843137, 1,
1.07921, -0.7204782, 2.195853, 1, 0, 0.7803922, 1,
1.083829, 1.830869, 0.5353591, 1, 0, 0.772549, 1,
1.08661, -1.730339, 0.8757963, 1, 0, 0.7686275, 1,
1.089407, 1.281474, 1.528676, 1, 0, 0.7607843, 1,
1.089516, 0.7015098, 0.8835298, 1, 0, 0.7568628, 1,
1.096399, -1.218149, 3.584707, 1, 0, 0.7490196, 1,
1.097056, 1.848878, 1.379532, 1, 0, 0.7450981, 1,
1.097213, 0.004119242, 1.889598, 1, 0, 0.7372549, 1,
1.098356, -0.005288824, 3.443234, 1, 0, 0.7333333, 1,
1.099786, 1.168786, 0.822464, 1, 0, 0.7254902, 1,
1.102276, 2.236322, 0.3252109, 1, 0, 0.7215686, 1,
1.104043, 1.660534, 1.09721, 1, 0, 0.7137255, 1,
1.109104, -0.8576053, 4.310406, 1, 0, 0.7098039, 1,
1.110685, 1.021067, 1.60794, 1, 0, 0.7019608, 1,
1.120419, 1.376811, -0.08118174, 1, 0, 0.6941177, 1,
1.131069, -1.415931, 1.030975, 1, 0, 0.6901961, 1,
1.134811, 0.2843641, 2.480021, 1, 0, 0.682353, 1,
1.157898, 0.758615, -1.253425, 1, 0, 0.6784314, 1,
1.169909, 0.3389663, 2.138171, 1, 0, 0.6705883, 1,
1.170164, -1.869965, 3.561491, 1, 0, 0.6666667, 1,
1.178588, -1.355989, 2.679734, 1, 0, 0.6588235, 1,
1.192931, -0.5319806, 1.458252, 1, 0, 0.654902, 1,
1.193787, -0.439173, 1.209808, 1, 0, 0.6470588, 1,
1.197352, -1.315109, 2.283912, 1, 0, 0.6431373, 1,
1.200032, -0.07966591, 0.2079384, 1, 0, 0.6352941, 1,
1.200827, 2.136116, -0.2587653, 1, 0, 0.6313726, 1,
1.214634, -0.07671763, 2.121701, 1, 0, 0.6235294, 1,
1.217538, 0.6089746, 1.272798, 1, 0, 0.6196079, 1,
1.222056, -0.8628488, 2.508242, 1, 0, 0.6117647, 1,
1.22761, -0.6169532, 2.086295, 1, 0, 0.6078432, 1,
1.228795, -0.3617433, 2.524998, 1, 0, 0.6, 1,
1.228927, 0.461422, 2.234666, 1, 0, 0.5921569, 1,
1.236037, 0.4507154, -0.1685161, 1, 0, 0.5882353, 1,
1.237632, 1.393323, 2.379874, 1, 0, 0.5803922, 1,
1.24881, 0.06868041, 1.219755, 1, 0, 0.5764706, 1,
1.254213, 1.600435, 0.4612408, 1, 0, 0.5686275, 1,
1.270774, -0.2762819, 1.100543, 1, 0, 0.5647059, 1,
1.276098, -0.3646801, 2.363714, 1, 0, 0.5568628, 1,
1.283772, -0.02391731, 0.418104, 1, 0, 0.5529412, 1,
1.284796, -1.365624, 2.287119, 1, 0, 0.5450981, 1,
1.285469, -0.2082725, 2.50038, 1, 0, 0.5411765, 1,
1.286036, -1.408588, 2.16867, 1, 0, 0.5333334, 1,
1.288856, 0.3663793, 0.8223614, 1, 0, 0.5294118, 1,
1.291333, -0.8533114, 0.6491546, 1, 0, 0.5215687, 1,
1.298341, -0.42767, 4.408195, 1, 0, 0.5176471, 1,
1.307702, 0.06141795, 0.07620722, 1, 0, 0.509804, 1,
1.307805, -0.398847, 1.958531, 1, 0, 0.5058824, 1,
1.311139, 0.4897995, 0.7100036, 1, 0, 0.4980392, 1,
1.311294, 0.1153373, 2.353474, 1, 0, 0.4901961, 1,
1.314884, -0.2061589, 1.367681, 1, 0, 0.4862745, 1,
1.319845, -0.2433573, 1.062904, 1, 0, 0.4784314, 1,
1.327582, -0.7889008, 2.129644, 1, 0, 0.4745098, 1,
1.336808, -1.193464, 2.926647, 1, 0, 0.4666667, 1,
1.348684, 0.3426598, 1.000379, 1, 0, 0.4627451, 1,
1.364575, -0.5112127, 2.7183, 1, 0, 0.454902, 1,
1.364616, 0.2781015, 1.791593, 1, 0, 0.4509804, 1,
1.368483, -0.3179822, 1.245806, 1, 0, 0.4431373, 1,
1.368929, 0.778401, 2.735594, 1, 0, 0.4392157, 1,
1.372234, 1.234429, -0.3616726, 1, 0, 0.4313726, 1,
1.384763, 0.6621251, 2.134578, 1, 0, 0.427451, 1,
1.386291, -0.6768365, 2.1171, 1, 0, 0.4196078, 1,
1.398424, 0.2679903, 0.3566552, 1, 0, 0.4156863, 1,
1.399648, -0.604049, 3.138768, 1, 0, 0.4078431, 1,
1.402255, 1.073548, 1.226216, 1, 0, 0.4039216, 1,
1.409452, 0.04973704, 2.022184, 1, 0, 0.3960784, 1,
1.420532, 1.230384, -0.7940356, 1, 0, 0.3882353, 1,
1.428504, -1.428263, 1.19214, 1, 0, 0.3843137, 1,
1.441138, -0.7676311, 2.498557, 1, 0, 0.3764706, 1,
1.460831, 0.6468759, -1.423709, 1, 0, 0.372549, 1,
1.463821, 0.2415965, 0.8229097, 1, 0, 0.3647059, 1,
1.469064, 1.743223, -1.139227, 1, 0, 0.3607843, 1,
1.472929, -0.812562, 2.932911, 1, 0, 0.3529412, 1,
1.47358, 0.9668699, 1.768707, 1, 0, 0.3490196, 1,
1.48193, -1.214496, 1.510924, 1, 0, 0.3411765, 1,
1.484636, 1.537966, 1.237496, 1, 0, 0.3372549, 1,
1.48831, 0.2300458, 0.5735844, 1, 0, 0.3294118, 1,
1.494826, -1.577764, 3.405095, 1, 0, 0.3254902, 1,
1.50552, 0.3579797, 1.353997, 1, 0, 0.3176471, 1,
1.508195, 0.2614307, 0.9695756, 1, 0, 0.3137255, 1,
1.516764, 0.3180684, 0.4896494, 1, 0, 0.3058824, 1,
1.541713, 0.01149436, 0.2522519, 1, 0, 0.2980392, 1,
1.556983, -2.763837, 1.360241, 1, 0, 0.2941177, 1,
1.568665, -1.208074, 1.436126, 1, 0, 0.2862745, 1,
1.570786, -0.1163059, 2.325246, 1, 0, 0.282353, 1,
1.572323, 2.090931, 1.878839, 1, 0, 0.2745098, 1,
1.574092, -0.7292975, 1.288538, 1, 0, 0.2705882, 1,
1.585008, 1.240089, 1.174694, 1, 0, 0.2627451, 1,
1.590978, 1.606404, 0.1966749, 1, 0, 0.2588235, 1,
1.591604, -0.8099432, 1.787937, 1, 0, 0.2509804, 1,
1.606377, 2.323002, -0.0863659, 1, 0, 0.2470588, 1,
1.609127, -1.179095, 3.333994, 1, 0, 0.2392157, 1,
1.644161, -0.8971071, 2.546064, 1, 0, 0.2352941, 1,
1.648115, -0.08066441, 2.891631, 1, 0, 0.227451, 1,
1.6728, 0.5555738, 0.6257421, 1, 0, 0.2235294, 1,
1.715489, -0.9855415, 1.804002, 1, 0, 0.2156863, 1,
1.717858, 0.7385336, 2.268176, 1, 0, 0.2117647, 1,
1.719225, -0.2711765, 2.557161, 1, 0, 0.2039216, 1,
1.723113, -1.253439, 3.392763, 1, 0, 0.1960784, 1,
1.728272, -0.6045735, 1.597264, 1, 0, 0.1921569, 1,
1.731011, 1.400385, -0.7524367, 1, 0, 0.1843137, 1,
1.754546, 0.07324844, 3.240765, 1, 0, 0.1803922, 1,
1.771177, 0.1138605, -0.1035424, 1, 0, 0.172549, 1,
1.802053, 0.164993, 0.8401602, 1, 0, 0.1686275, 1,
1.813953, -1.920565, 3.324675, 1, 0, 0.1607843, 1,
1.820115, 0.6703219, 1.996107, 1, 0, 0.1568628, 1,
1.875946, 0.6342739, 1.326636, 1, 0, 0.1490196, 1,
1.880843, -0.6301074, 2.837842, 1, 0, 0.145098, 1,
1.894585, -0.2171955, 1.048442, 1, 0, 0.1372549, 1,
1.910988, 2.516721, 0.374734, 1, 0, 0.1333333, 1,
1.969175, 0.1515862, 1.848486, 1, 0, 0.1254902, 1,
1.99011, -0.4531314, 0.3828936, 1, 0, 0.1215686, 1,
1.990851, -1.184297, 2.297278, 1, 0, 0.1137255, 1,
2.002246, 2.35488, 1.303375, 1, 0, 0.1098039, 1,
2.008164, 0.5523288, -0.04016197, 1, 0, 0.1019608, 1,
2.02002, -0.955756, 3.543839, 1, 0, 0.09411765, 1,
2.020268, -1.056474, 1.553897, 1, 0, 0.09019608, 1,
2.061524, -0.05665467, 2.133303, 1, 0, 0.08235294, 1,
2.06317, -1.178905, 2.371842, 1, 0, 0.07843138, 1,
2.093792, -0.3960145, 0.8315788, 1, 0, 0.07058824, 1,
2.162013, 0.3118966, 1.846965, 1, 0, 0.06666667, 1,
2.208382, -0.1075668, 2.438628, 1, 0, 0.05882353, 1,
2.235185, 1.255618, 1.653815, 1, 0, 0.05490196, 1,
2.342434, 1.572115, 1.105103, 1, 0, 0.04705882, 1,
2.480829, 1.670156, 0.5809885, 1, 0, 0.04313726, 1,
2.521929, 1.284467, 1.561362, 1, 0, 0.03529412, 1,
2.575464, -0.5911579, 1.848535, 1, 0, 0.03137255, 1,
2.713499, -1.520098, 2.424392, 1, 0, 0.02352941, 1,
2.826354, -0.04705729, 0.188637, 1, 0, 0.01960784, 1,
2.861449, -0.5535724, 0.3921651, 1, 0, 0.01176471, 1,
3.111141, 0.7086912, -0.2149001, 1, 0, 0.007843138, 1
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
-0.09167302, -3.990745, -6.668111, 0, -0.5, 0.5, 0.5,
-0.09167302, -3.990745, -6.668111, 1, -0.5, 0.5, 0.5,
-0.09167302, -3.990745, -6.668111, 1, 1.5, 0.5, 0.5,
-0.09167302, -3.990745, -6.668111, 0, 1.5, 0.5, 0.5
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
-4.380241, -0.0432198, -6.668111, 0, -0.5, 0.5, 0.5,
-4.380241, -0.0432198, -6.668111, 1, -0.5, 0.5, 0.5,
-4.380241, -0.0432198, -6.668111, 1, 1.5, 0.5, 0.5,
-4.380241, -0.0432198, -6.668111, 0, 1.5, 0.5, 0.5
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
-4.380241, -3.990745, 0.3476536, 0, -0.5, 0.5, 0.5,
-4.380241, -3.990745, 0.3476536, 1, -0.5, 0.5, 0.5,
-4.380241, -3.990745, 0.3476536, 1, 1.5, 0.5, 0.5,
-4.380241, -3.990745, 0.3476536, 0, 1.5, 0.5, 0.5
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
-3, -3.079777, -5.049088,
3, -3.079777, -5.049088,
-3, -3.079777, -5.049088,
-3, -3.231605, -5.318926,
-2, -3.079777, -5.049088,
-2, -3.231605, -5.318926,
-1, -3.079777, -5.049088,
-1, -3.231605, -5.318926,
0, -3.079777, -5.049088,
0, -3.231605, -5.318926,
1, -3.079777, -5.049088,
1, -3.231605, -5.318926,
2, -3.079777, -5.049088,
2, -3.231605, -5.318926,
3, -3.079777, -5.049088,
3, -3.231605, -5.318926
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
-3, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
-3, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
-3, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
-3, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
-2, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
-2, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
-2, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
-2, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
-1, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
-1, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
-1, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
-1, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
0, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
0, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
0, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
0, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
1, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
1, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
1, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
1, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
2, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
2, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
2, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
2, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5,
3, -3.535261, -5.8586, 0, -0.5, 0.5, 0.5,
3, -3.535261, -5.8586, 1, -0.5, 0.5, 0.5,
3, -3.535261, -5.8586, 1, 1.5, 0.5, 0.5,
3, -3.535261, -5.8586, 0, 1.5, 0.5, 0.5
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
-3.390572, -2, -5.049088,
-3.390572, 2, -5.049088,
-3.390572, -2, -5.049088,
-3.555517, -2, -5.318926,
-3.390572, -1, -5.049088,
-3.555517, -1, -5.318926,
-3.390572, 0, -5.049088,
-3.555517, 0, -5.318926,
-3.390572, 1, -5.049088,
-3.555517, 1, -5.318926,
-3.390572, 2, -5.049088,
-3.555517, 2, -5.318926
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
-3.885407, -2, -5.8586, 0, -0.5, 0.5, 0.5,
-3.885407, -2, -5.8586, 1, -0.5, 0.5, 0.5,
-3.885407, -2, -5.8586, 1, 1.5, 0.5, 0.5,
-3.885407, -2, -5.8586, 0, 1.5, 0.5, 0.5,
-3.885407, -1, -5.8586, 0, -0.5, 0.5, 0.5,
-3.885407, -1, -5.8586, 1, -0.5, 0.5, 0.5,
-3.885407, -1, -5.8586, 1, 1.5, 0.5, 0.5,
-3.885407, -1, -5.8586, 0, 1.5, 0.5, 0.5,
-3.885407, 0, -5.8586, 0, -0.5, 0.5, 0.5,
-3.885407, 0, -5.8586, 1, -0.5, 0.5, 0.5,
-3.885407, 0, -5.8586, 1, 1.5, 0.5, 0.5,
-3.885407, 0, -5.8586, 0, 1.5, 0.5, 0.5,
-3.885407, 1, -5.8586, 0, -0.5, 0.5, 0.5,
-3.885407, 1, -5.8586, 1, -0.5, 0.5, 0.5,
-3.885407, 1, -5.8586, 1, 1.5, 0.5, 0.5,
-3.885407, 1, -5.8586, 0, 1.5, 0.5, 0.5,
-3.885407, 2, -5.8586, 0, -0.5, 0.5, 0.5,
-3.885407, 2, -5.8586, 1, -0.5, 0.5, 0.5,
-3.885407, 2, -5.8586, 1, 1.5, 0.5, 0.5,
-3.885407, 2, -5.8586, 0, 1.5, 0.5, 0.5
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
-3.390572, -3.079777, -4,
-3.390572, -3.079777, 4,
-3.390572, -3.079777, -4,
-3.555517, -3.231605, -4,
-3.390572, -3.079777, -2,
-3.555517, -3.231605, -2,
-3.390572, -3.079777, 0,
-3.555517, -3.231605, 0,
-3.390572, -3.079777, 2,
-3.555517, -3.231605, 2,
-3.390572, -3.079777, 4,
-3.555517, -3.231605, 4
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
-3.885407, -3.535261, -4, 0, -0.5, 0.5, 0.5,
-3.885407, -3.535261, -4, 1, -0.5, 0.5, 0.5,
-3.885407, -3.535261, -4, 1, 1.5, 0.5, 0.5,
-3.885407, -3.535261, -4, 0, 1.5, 0.5, 0.5,
-3.885407, -3.535261, -2, 0, -0.5, 0.5, 0.5,
-3.885407, -3.535261, -2, 1, -0.5, 0.5, 0.5,
-3.885407, -3.535261, -2, 1, 1.5, 0.5, 0.5,
-3.885407, -3.535261, -2, 0, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 0, 0, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 0, 1, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 0, 1, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 0, 0, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 2, 0, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 2, 1, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 2, 1, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 2, 0, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 4, 0, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 4, 1, -0.5, 0.5, 0.5,
-3.885407, -3.535261, 4, 1, 1.5, 0.5, 0.5,
-3.885407, -3.535261, 4, 0, 1.5, 0.5, 0.5
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
-3.390572, -3.079777, -5.049088,
-3.390572, 2.993338, -5.049088,
-3.390572, -3.079777, 5.744396,
-3.390572, 2.993338, 5.744396,
-3.390572, -3.079777, -5.049088,
-3.390572, -3.079777, 5.744396,
-3.390572, 2.993338, -5.049088,
-3.390572, 2.993338, 5.744396,
-3.390572, -3.079777, -5.049088,
3.207226, -3.079777, -5.049088,
-3.390572, -3.079777, 5.744396,
3.207226, -3.079777, 5.744396,
-3.390572, 2.993338, -5.049088,
3.207226, 2.993338, -5.049088,
-3.390572, 2.993338, 5.744396,
3.207226, 2.993338, 5.744396,
3.207226, -3.079777, -5.049088,
3.207226, 2.993338, -5.049088,
3.207226, -3.079777, 5.744396,
3.207226, 2.993338, 5.744396,
3.207226, -3.079777, -5.049088,
3.207226, -3.079777, 5.744396,
3.207226, 2.993338, -5.049088,
3.207226, 2.993338, 5.744396
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
var radius = 7.493119;
var distance = 33.33773;
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
mvMatrix.translate( 0.09167302, 0.0432198, -0.3476536 );
mvMatrix.scale( 1.227941, 1.334028, 0.7506109 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.33773);
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
metconazole<-read.table("metconazole.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
y<-metconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
```

```r
z<-metconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'metconazole' not found
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
-3.294487, 0.8320695, -2.225533, 0, 0, 1, 1, 1,
-2.828617, -1.251207, -3.692013, 1, 0, 0, 1, 1,
-2.654105, 0.2684176, -0.7105072, 1, 0, 0, 1, 1,
-2.644598, 1.16412, -2.595249, 1, 0, 0, 1, 1,
-2.480856, 0.8935776, 0.759076, 1, 0, 0, 1, 1,
-2.43919, 0.6949974, -1.461555, 1, 0, 0, 1, 1,
-2.431461, 1.540775, -3.437493, 0, 0, 0, 1, 1,
-2.399042, -0.5318419, -2.491688, 0, 0, 0, 1, 1,
-2.395603, 0.1100983, -1.788513, 0, 0, 0, 1, 1,
-2.380278, -0.2048362, -3.14469, 0, 0, 0, 1, 1,
-2.379996, -0.4873056, -2.117881, 0, 0, 0, 1, 1,
-2.340976, -1.263, -3.820612, 0, 0, 0, 1, 1,
-2.325905, -0.4091031, 0.0162089, 0, 0, 0, 1, 1,
-2.294763, 1.136026, 0.5123188, 1, 1, 1, 1, 1,
-2.294307, 0.6496116, -0.8524686, 1, 1, 1, 1, 1,
-2.267417, 0.3185941, -0.9655221, 1, 1, 1, 1, 1,
-2.259863, 0.3457953, -1.540092, 1, 1, 1, 1, 1,
-2.193084, 0.05725859, -1.621877, 1, 1, 1, 1, 1,
-2.1796, -1.34877, -1.542055, 1, 1, 1, 1, 1,
-2.102033, -1.453776, -1.664019, 1, 1, 1, 1, 1,
-2.097772, -0.2017138, -0.3967261, 1, 1, 1, 1, 1,
-2.078355, -0.06364129, -0.3324288, 1, 1, 1, 1, 1,
-2.000646, 0.9303961, -1.067566, 1, 1, 1, 1, 1,
-1.980545, -0.1457579, -1.478052, 1, 1, 1, 1, 1,
-1.956465, 0.1588535, -1.29731, 1, 1, 1, 1, 1,
-1.889703, -1.096208, -1.703973, 1, 1, 1, 1, 1,
-1.881033, 0.2885916, -1.756959, 1, 1, 1, 1, 1,
-1.879596, 0.4516598, -1.758186, 1, 1, 1, 1, 1,
-1.863362, 0.04785694, -2.117611, 0, 0, 1, 1, 1,
-1.856138, 0.5232574, -0.8158342, 1, 0, 0, 1, 1,
-1.853778, 0.6097574, -1.04296, 1, 0, 0, 1, 1,
-1.84231, -1.501429, -2.561645, 1, 0, 0, 1, 1,
-1.838375, -0.968385, -0.7855279, 1, 0, 0, 1, 1,
-1.788289, 1.818648, -1.626891, 1, 0, 0, 1, 1,
-1.776014, 0.7624424, -1.440178, 0, 0, 0, 1, 1,
-1.747138, 2.904894, -0.1550961, 0, 0, 0, 1, 1,
-1.746643, 1.090507, -1.829811, 0, 0, 0, 1, 1,
-1.735751, 1.709914, -1.205269, 0, 0, 0, 1, 1,
-1.725285, -0.871698, -2.539118, 0, 0, 0, 1, 1,
-1.720162, 1.051684, -0.8670226, 0, 0, 0, 1, 1,
-1.709754, -0.01764692, -2.554257, 0, 0, 0, 1, 1,
-1.703456, 0.8867651, -0.3003175, 1, 1, 1, 1, 1,
-1.701486, 0.4288117, -0.5877028, 1, 1, 1, 1, 1,
-1.694502, -0.9971642, -1.514704, 1, 1, 1, 1, 1,
-1.69191, -1.389344, -3.667452, 1, 1, 1, 1, 1,
-1.684065, -0.5872976, -0.5181478, 1, 1, 1, 1, 1,
-1.67683, 0.9627679, -1.029524, 1, 1, 1, 1, 1,
-1.67037, 0.487219, -1.189348, 1, 1, 1, 1, 1,
-1.670262, 0.2020856, -2.156605, 1, 1, 1, 1, 1,
-1.665897, -2.567107, -1.270573, 1, 1, 1, 1, 1,
-1.664299, -0.737054, -2.588969, 1, 1, 1, 1, 1,
-1.655536, -1.169142, -2.223299, 1, 1, 1, 1, 1,
-1.652715, -1.113448, -2.742261, 1, 1, 1, 1, 1,
-1.649532, -0.4820693, -0.9967732, 1, 1, 1, 1, 1,
-1.634103, -0.08665347, -1.433898, 1, 1, 1, 1, 1,
-1.601431, -0.5132598, 0.7583205, 1, 1, 1, 1, 1,
-1.600523, 0.6142517, 0.3904578, 0, 0, 1, 1, 1,
-1.593331, -2.293547, -2.968946, 1, 0, 0, 1, 1,
-1.591715, -1.308999, -0.6876624, 1, 0, 0, 1, 1,
-1.583046, 0.2580474, -1.070432, 1, 0, 0, 1, 1,
-1.582474, -2.037271, -3.304212, 1, 0, 0, 1, 1,
-1.581826, -0.6763799, -1.210468, 1, 0, 0, 1, 1,
-1.580305, 0.07133287, -3.089482, 0, 0, 0, 1, 1,
-1.554309, 0.9277648, -0.464915, 0, 0, 0, 1, 1,
-1.524346, -0.4667649, 0.4208384, 0, 0, 0, 1, 1,
-1.496208, -2.786722, -1.118487, 0, 0, 0, 1, 1,
-1.493392, 2.027879, 0.2936732, 0, 0, 0, 1, 1,
-1.480397, 0.9106681, -0.2664362, 0, 0, 0, 1, 1,
-1.476111, -0.9995533, -4.529841, 0, 0, 0, 1, 1,
-1.475495, -0.6472195, -1.090605, 1, 1, 1, 1, 1,
-1.46977, 1.605424, 1.083827, 1, 1, 1, 1, 1,
-1.463724, 0.2264845, -1.387073, 1, 1, 1, 1, 1,
-1.46368, -1.051046, -2.661313, 1, 1, 1, 1, 1,
-1.458863, -0.01923494, -2.055242, 1, 1, 1, 1, 1,
-1.455555, -1.323062, -3.434046, 1, 1, 1, 1, 1,
-1.4434, 1.752003, -2.0003, 1, 1, 1, 1, 1,
-1.433937, -1.240626, -2.906101, 1, 1, 1, 1, 1,
-1.433697, 0.1168622, -2.129214, 1, 1, 1, 1, 1,
-1.43147, -1.156211, -1.172123, 1, 1, 1, 1, 1,
-1.430771, -0.5823892, -2.94463, 1, 1, 1, 1, 1,
-1.429549, 1.023026, 0.2155064, 1, 1, 1, 1, 1,
-1.424845, 0.8990577, -0.4854885, 1, 1, 1, 1, 1,
-1.421394, 1.91208, 1.042567, 1, 1, 1, 1, 1,
-1.414164, -0.1343318, -2.493622, 1, 1, 1, 1, 1,
-1.405194, 0.4237383, 0.219049, 0, 0, 1, 1, 1,
-1.403654, -0.8430094, -2.781827, 1, 0, 0, 1, 1,
-1.402499, -0.1758682, -3.404961, 1, 0, 0, 1, 1,
-1.397272, 1.488082, 0.5166882, 1, 0, 0, 1, 1,
-1.389998, 0.2879175, -1.101982, 1, 0, 0, 1, 1,
-1.382804, 0.3664283, -1.489118, 1, 0, 0, 1, 1,
-1.379696, -1.16286, -2.188645, 0, 0, 0, 1, 1,
-1.373781, -0.7134361, -1.493185, 0, 0, 0, 1, 1,
-1.371923, 1.259323, 0.1644651, 0, 0, 0, 1, 1,
-1.369482, 0.5929961, 0.09510367, 0, 0, 0, 1, 1,
-1.366701, 0.784588, 0.5718759, 0, 0, 0, 1, 1,
-1.363576, -0.1816685, -2.297275, 0, 0, 0, 1, 1,
-1.354034, 0.50921, -0.7861174, 0, 0, 0, 1, 1,
-1.341911, 1.095147, -0.8641768, 1, 1, 1, 1, 1,
-1.336748, 0.6313257, -1.83572, 1, 1, 1, 1, 1,
-1.335835, -1.16852, -3.488248, 1, 1, 1, 1, 1,
-1.332855, 0.4847206, -1.643078, 1, 1, 1, 1, 1,
-1.293439, -0.3196958, -0.09379302, 1, 1, 1, 1, 1,
-1.292102, -1.345101, -2.188063, 1, 1, 1, 1, 1,
-1.275458, 1.470962, 0.1745817, 1, 1, 1, 1, 1,
-1.263689, -0.2977253, 0.6410244, 1, 1, 1, 1, 1,
-1.26299, -1.357573, -2.527457, 1, 1, 1, 1, 1,
-1.258958, -0.3982863, -3.566319, 1, 1, 1, 1, 1,
-1.255568, -0.8893579, -2.727526, 1, 1, 1, 1, 1,
-1.252753, -0.4595814, -1.731551, 1, 1, 1, 1, 1,
-1.249669, 1.276311, 2.060782, 1, 1, 1, 1, 1,
-1.248591, 0.5738744, -1.488705, 1, 1, 1, 1, 1,
-1.245441, 0.7580904, -0.6894174, 1, 1, 1, 1, 1,
-1.245157, 1.319579, -0.2178087, 0, 0, 1, 1, 1,
-1.240983, -1.255361, -1.931207, 1, 0, 0, 1, 1,
-1.231377, -0.05815108, -1.526193, 1, 0, 0, 1, 1,
-1.221203, -0.3509516, -2.68628, 1, 0, 0, 1, 1,
-1.219177, 1.146138, -1.489833, 1, 0, 0, 1, 1,
-1.21514, -0.4836993, -2.02481, 1, 0, 0, 1, 1,
-1.212731, 0.407879, -3.321116, 0, 0, 0, 1, 1,
-1.207655, 0.6458489, -0.404844, 0, 0, 0, 1, 1,
-1.204474, -0.319455, -1.953544, 0, 0, 0, 1, 1,
-1.202396, -0.1790936, -4.250096, 0, 0, 0, 1, 1,
-1.189834, 0.01751785, -2.155764, 0, 0, 0, 1, 1,
-1.183138, 1.173145, -1.27952, 0, 0, 0, 1, 1,
-1.18131, -0.535005, -2.066051, 0, 0, 0, 1, 1,
-1.173662, -0.2694861, -1.188739, 1, 1, 1, 1, 1,
-1.173258, -0.3671434, -2.397865, 1, 1, 1, 1, 1,
-1.163416, -0.2883264, -1.797538, 1, 1, 1, 1, 1,
-1.163259, 0.967801, -1.152819, 1, 1, 1, 1, 1,
-1.158306, -0.7883416, -1.610351, 1, 1, 1, 1, 1,
-1.157552, -0.7169948, -1.799849, 1, 1, 1, 1, 1,
-1.143641, 0.1625408, -1.320054, 1, 1, 1, 1, 1,
-1.142726, -0.7612203, -2.898574, 1, 1, 1, 1, 1,
-1.14019, -0.3660151, -3.039549, 1, 1, 1, 1, 1,
-1.138059, -0.2905167, -0.5568029, 1, 1, 1, 1, 1,
-1.133081, 0.4346176, -1.386522, 1, 1, 1, 1, 1,
-1.129134, -1.027533, -1.906995, 1, 1, 1, 1, 1,
-1.122619, -0.8155571, 0.3894903, 1, 1, 1, 1, 1,
-1.11734, 1.38265, -0.4316503, 1, 1, 1, 1, 1,
-1.11314, -1.795513, -1.994639, 1, 1, 1, 1, 1,
-1.108117, 0.5118439, -0.9770536, 0, 0, 1, 1, 1,
-1.104058, 1.31688, -2.243933, 1, 0, 0, 1, 1,
-1.100119, -0.4129629, -1.383699, 1, 0, 0, 1, 1,
-1.091961, -0.5964935, 0.1824861, 1, 0, 0, 1, 1,
-1.088299, -0.1574285, -2.610667, 1, 0, 0, 1, 1,
-1.087124, -2.184722, -2.316923, 1, 0, 0, 1, 1,
-1.081962, -1.16161, -2.207659, 0, 0, 0, 1, 1,
-1.06999, 0.5540338, -2.43395, 0, 0, 0, 1, 1,
-1.050479, 0.9120722, -1.087825, 0, 0, 0, 1, 1,
-1.049718, -1.073163, -2.113558, 0, 0, 0, 1, 1,
-1.043835, -0.6919166, -4.643967, 0, 0, 0, 1, 1,
-1.042809, 1.300536, -2.470917, 0, 0, 0, 1, 1,
-1.037165, 1.805749, 0.6504059, 0, 0, 0, 1, 1,
-1.03673, -0.1889512, -1.447535, 1, 1, 1, 1, 1,
-1.03603, 0.1187512, -0.02621797, 1, 1, 1, 1, 1,
-1.025578, 0.2206565, 0.2109221, 1, 1, 1, 1, 1,
-1.020069, 0.4697049, -1.014273, 1, 1, 1, 1, 1,
-1.019948, -0.2228328, -1.823309, 1, 1, 1, 1, 1,
-1.018521, 0.2985123, -1.959041, 1, 1, 1, 1, 1,
-1.017425, -0.6310388, -0.9787611, 1, 1, 1, 1, 1,
-1.016818, 1.167925, -1.553721, 1, 1, 1, 1, 1,
-1.014753, 0.3962858, 0.614372, 1, 1, 1, 1, 1,
-1.013186, 0.2822545, -0.7266389, 1, 1, 1, 1, 1,
-1.001383, -0.07673788, -1.301722, 1, 1, 1, 1, 1,
-0.9987264, 0.7845646, -1.014621, 1, 1, 1, 1, 1,
-0.9953755, 0.7273865, -2.078939, 1, 1, 1, 1, 1,
-0.979995, 0.3580088, -1.595674, 1, 1, 1, 1, 1,
-0.9781256, 1.583157, -0.6825554, 1, 1, 1, 1, 1,
-0.9756537, -0.6047851, -1.564265, 0, 0, 1, 1, 1,
-0.9741128, -0.5994706, -3.4993, 1, 0, 0, 1, 1,
-0.9732539, 0.2616017, -1.781569, 1, 0, 0, 1, 1,
-0.9629, -0.4419404, -2.734475, 1, 0, 0, 1, 1,
-0.9607255, 0.4550916, -0.8321944, 1, 0, 0, 1, 1,
-0.9516129, -1.015448, -1.675579, 1, 0, 0, 1, 1,
-0.9447888, 1.160547, -0.2641669, 0, 0, 0, 1, 1,
-0.9348879, -1.465369, -1.810043, 0, 0, 0, 1, 1,
-0.9344749, 1.800798, -0.6530904, 0, 0, 0, 1, 1,
-0.9264346, -0.07158857, -3.057244, 0, 0, 0, 1, 1,
-0.9252184, 1.789531, -1.339987, 0, 0, 0, 1, 1,
-0.9237704, 1.009268, -1.193389, 0, 0, 0, 1, 1,
-0.9230243, 0.6791152, -0.1918969, 0, 0, 0, 1, 1,
-0.9221048, 0.7220032, -0.8838295, 1, 1, 1, 1, 1,
-0.9203309, -0.6017636, -3.421116, 1, 1, 1, 1, 1,
-0.9186054, -0.5513282, -2.207763, 1, 1, 1, 1, 1,
-0.9180204, 1.36987, -1.191565, 1, 1, 1, 1, 1,
-0.9073287, 1.150669, -0.904546, 1, 1, 1, 1, 1,
-0.9043225, 0.9259163, -2.892715, 1, 1, 1, 1, 1,
-0.9041864, 1.449964, -1.430754, 1, 1, 1, 1, 1,
-0.903574, -0.7215363, -2.740016, 1, 1, 1, 1, 1,
-0.9022796, 0.006913843, -2.401725, 1, 1, 1, 1, 1,
-0.9017307, -2.293877, -3.209031, 1, 1, 1, 1, 1,
-0.89985, 0.2808185, -2.923909, 1, 1, 1, 1, 1,
-0.8965378, 0.3124374, -2.085944, 1, 1, 1, 1, 1,
-0.8964636, 2.199627, -2.338523, 1, 1, 1, 1, 1,
-0.887179, 1.065975, -0.6885053, 1, 1, 1, 1, 1,
-0.8862385, 0.5870768, -1.622036, 1, 1, 1, 1, 1,
-0.8857879, -1.515647, 0.4817758, 0, 0, 1, 1, 1,
-0.8851616, 0.8351955, -0.7581421, 1, 0, 0, 1, 1,
-0.8843956, 0.5506484, 0.05084803, 1, 0, 0, 1, 1,
-0.8829795, -0.5915463, -1.642761, 1, 0, 0, 1, 1,
-0.88063, -0.9049188, -1.293377, 1, 0, 0, 1, 1,
-0.8788231, 0.09785177, -2.469669, 1, 0, 0, 1, 1,
-0.873614, 2.201081, -0.7672116, 0, 0, 0, 1, 1,
-0.8704421, 1.24907, -0.3898681, 0, 0, 0, 1, 1,
-0.8606344, 1.980556, -0.3079434, 0, 0, 0, 1, 1,
-0.8599826, -0.3789724, -1.762666, 0, 0, 0, 1, 1,
-0.854911, 1.377816, -1.615258, 0, 0, 0, 1, 1,
-0.8419074, -0.8449724, -3.780619, 0, 0, 0, 1, 1,
-0.83244, -0.3998456, -3.706521, 0, 0, 0, 1, 1,
-0.832284, 0.7826142, -0.4630005, 1, 1, 1, 1, 1,
-0.830434, 1.564272, -0.6281589, 1, 1, 1, 1, 1,
-0.8282165, -1.267038, -2.300368, 1, 1, 1, 1, 1,
-0.8237199, -0.2689327, -2.37227, 1, 1, 1, 1, 1,
-0.8224622, 0.837333, -1.382116, 1, 1, 1, 1, 1,
-0.8188686, -0.4783456, -1.997503, 1, 1, 1, 1, 1,
-0.8166013, 0.0735923, -0.8903224, 1, 1, 1, 1, 1,
-0.8162044, 0.2069457, -1.556745, 1, 1, 1, 1, 1,
-0.8159786, -0.9665386, -1.520582, 1, 1, 1, 1, 1,
-0.8154277, 0.7847923, -2.087125, 1, 1, 1, 1, 1,
-0.8137273, -1.510483, -2.76298, 1, 1, 1, 1, 1,
-0.8101782, 0.2709531, -1.239053, 1, 1, 1, 1, 1,
-0.8060346, 1.910913, 0.7951244, 1, 1, 1, 1, 1,
-0.8054335, -0.04541158, -2.028374, 1, 1, 1, 1, 1,
-0.7995065, 1.009216, -2.138006, 1, 1, 1, 1, 1,
-0.7984914, -0.7078118, -1.184902, 0, 0, 1, 1, 1,
-0.7960842, -0.8621764, -1.303661, 1, 0, 0, 1, 1,
-0.7951484, -0.6628607, -1.412445, 1, 0, 0, 1, 1,
-0.7915972, 0.584878, -0.5262864, 1, 0, 0, 1, 1,
-0.7886536, -1.424924, -4.463782, 1, 0, 0, 1, 1,
-0.7837732, -0.4297455, -2.132188, 1, 0, 0, 1, 1,
-0.7799565, -0.1665141, -0.9831501, 0, 0, 0, 1, 1,
-0.7757483, -1.044146, -1.122278, 0, 0, 0, 1, 1,
-0.7627103, 1.771238, 0.8549759, 0, 0, 0, 1, 1,
-0.7540221, 1.68946, -0.6109664, 0, 0, 0, 1, 1,
-0.7521863, -1.135485, -4.126402, 0, 0, 0, 1, 1,
-0.7521393, -0.03757183, -1.899338, 0, 0, 0, 1, 1,
-0.7508777, -0.08791876, -1.490835, 0, 0, 0, 1, 1,
-0.749069, -0.007155362, -2.588671, 1, 1, 1, 1, 1,
-0.7477722, 0.07485233, -0.8895287, 1, 1, 1, 1, 1,
-0.7445549, 1.379277, 0.8565217, 1, 1, 1, 1, 1,
-0.7431436, 2.061328, -1.244573, 1, 1, 1, 1, 1,
-0.7431127, -0.7796983, -2.139056, 1, 1, 1, 1, 1,
-0.7420552, -1.056091, -1.430603, 1, 1, 1, 1, 1,
-0.7413707, 1.16741, 0.2081716, 1, 1, 1, 1, 1,
-0.736953, 0.4844495, 0.2668274, 1, 1, 1, 1, 1,
-0.7357291, -1.083117, -1.278036, 1, 1, 1, 1, 1,
-0.7349958, -1.142307, -4.504654, 1, 1, 1, 1, 1,
-0.7339367, 0.2496063, -2.335278, 1, 1, 1, 1, 1,
-0.7324614, -0.2245636, -0.6174424, 1, 1, 1, 1, 1,
-0.7287807, -0.333901, -0.8054771, 1, 1, 1, 1, 1,
-0.7265723, 0.3620568, -0.6624932, 1, 1, 1, 1, 1,
-0.723956, -0.06390592, -0.6451821, 1, 1, 1, 1, 1,
-0.7223011, 0.8745061, -1.185533, 0, 0, 1, 1, 1,
-0.7181805, -0.3356361, -2.396667, 1, 0, 0, 1, 1,
-0.7176209, -0.347276, -3.951098, 1, 0, 0, 1, 1,
-0.7173564, -2.127287, -1.529143, 1, 0, 0, 1, 1,
-0.7126809, -0.4982174, -2.539154, 1, 0, 0, 1, 1,
-0.7117342, 1.269709, 0.5986398, 1, 0, 0, 1, 1,
-0.7022075, 1.024082, -2.414221, 0, 0, 0, 1, 1,
-0.7000787, 1.458166, -0.3047326, 0, 0, 0, 1, 1,
-0.6892543, -0.7317591, -2.241223, 0, 0, 0, 1, 1,
-0.6892069, 1.522891, -0.2799452, 0, 0, 0, 1, 1,
-0.6877205, 1.964461, -1.584213, 0, 0, 0, 1, 1,
-0.6876895, 0.2505738, -0.7508113, 0, 0, 0, 1, 1,
-0.6849704, -0.3093431, -2.107951, 0, 0, 0, 1, 1,
-0.6811539, -0.4713165, -1.405355, 1, 1, 1, 1, 1,
-0.6801697, 0.05943419, -0.8431392, 1, 1, 1, 1, 1,
-0.6720296, -0.1939582, -1.553366, 1, 1, 1, 1, 1,
-0.6703563, -1.109003, -2.726204, 1, 1, 1, 1, 1,
-0.6684693, 1.182535, -1.737958, 1, 1, 1, 1, 1,
-0.6659962, -0.2486035, -2.433481, 1, 1, 1, 1, 1,
-0.6626975, -0.716823, -4.631009, 1, 1, 1, 1, 1,
-0.6586452, 0.09485244, -0.3275487, 1, 1, 1, 1, 1,
-0.6557015, 0.5261075, 1.378336, 1, 1, 1, 1, 1,
-0.6516751, -0.3869585, -3.070139, 1, 1, 1, 1, 1,
-0.6489248, -0.4899638, -2.033218, 1, 1, 1, 1, 1,
-0.6417107, -0.1782141, -2.224223, 1, 1, 1, 1, 1,
-0.6376355, -0.1553122, -2.714195, 1, 1, 1, 1, 1,
-0.6364592, 0.5311268, -1.688067, 1, 1, 1, 1, 1,
-0.6240024, 0.8153719, -1.588109, 1, 1, 1, 1, 1,
-0.6206862, 0.4233996, -3.56757, 0, 0, 1, 1, 1,
-0.6090698, -0.234194, -1.161423, 1, 0, 0, 1, 1,
-0.6082853, 1.950196, 0.1183603, 1, 0, 0, 1, 1,
-0.6075577, -0.3950754, -1.526337, 1, 0, 0, 1, 1,
-0.6021955, 1.508281, 0.8894428, 1, 0, 0, 1, 1,
-0.5966631, -0.6864761, -2.507699, 1, 0, 0, 1, 1,
-0.5957388, -0.4252381, -3.568307, 0, 0, 0, 1, 1,
-0.5949237, -1.789544, -4.044445, 0, 0, 0, 1, 1,
-0.5942308, 1.3812, -0.5127097, 0, 0, 0, 1, 1,
-0.5933022, 0.5023618, -1.126328, 0, 0, 0, 1, 1,
-0.590692, -0.5215573, -1.77545, 0, 0, 0, 1, 1,
-0.5845286, 1.581899, -1.618709, 0, 0, 0, 1, 1,
-0.5760798, -0.4713931, -1.958763, 0, 0, 0, 1, 1,
-0.5745807, 0.2875822, -1.309904, 1, 1, 1, 1, 1,
-0.5736544, 0.8777268, -0.6569761, 1, 1, 1, 1, 1,
-0.5720167, 0.5419137, -0.2931881, 1, 1, 1, 1, 1,
-0.5684295, 0.6836482, -0.8755665, 1, 1, 1, 1, 1,
-0.5671501, -0.4007485, -1.856568, 1, 1, 1, 1, 1,
-0.5664085, -0.001792241, -2.066335, 1, 1, 1, 1, 1,
-0.5656245, -0.2101274, -2.346846, 1, 1, 1, 1, 1,
-0.5616467, 0.9776841, 1.062024, 1, 1, 1, 1, 1,
-0.5605124, 1.102941, 0.3279572, 1, 1, 1, 1, 1,
-0.5548369, 0.1888235, -1.758981, 1, 1, 1, 1, 1,
-0.5486302, -1.650768, -1.37143, 1, 1, 1, 1, 1,
-0.547578, -0.9108782, -0.3994994, 1, 1, 1, 1, 1,
-0.5378989, 0.7056519, 1.615944, 1, 1, 1, 1, 1,
-0.5357792, 0.2437052, -2.539492, 1, 1, 1, 1, 1,
-0.5330183, -0.03276646, -0.5931981, 1, 1, 1, 1, 1,
-0.5297744, -0.4652553, -3.123765, 0, 0, 1, 1, 1,
-0.5222985, -0.7343099, -2.864996, 1, 0, 0, 1, 1,
-0.5193123, 1.456281, -1.302957, 1, 0, 0, 1, 1,
-0.5177647, -0.01539534, -1.087173, 1, 0, 0, 1, 1,
-0.517469, -0.155855, -0.9370922, 1, 0, 0, 1, 1,
-0.5173387, -1.258697, -2.832049, 1, 0, 0, 1, 1,
-0.5161367, 1.148645, -1.462368, 0, 0, 0, 1, 1,
-0.5152766, -0.3830237, -2.211128, 0, 0, 0, 1, 1,
-0.5127749, -0.6862527, -1.851481, 0, 0, 0, 1, 1,
-0.5122433, 0.978274, -1.841152, 0, 0, 0, 1, 1,
-0.5102212, 0.1891261, -2.256229, 0, 0, 0, 1, 1,
-0.5090876, -0.5917838, -4.096244, 0, 0, 0, 1, 1,
-0.5064959, 0.5335312, 0.3048467, 0, 0, 0, 1, 1,
-0.5012035, -0.7726482, -1.245266, 1, 1, 1, 1, 1,
-0.4978207, -0.154516, -3.203319, 1, 1, 1, 1, 1,
-0.4971873, -0.2571165, -2.596657, 1, 1, 1, 1, 1,
-0.4921915, -0.2557216, -1.31523, 1, 1, 1, 1, 1,
-0.491857, -0.3898034, -1.42802, 1, 1, 1, 1, 1,
-0.4893507, 0.05514538, -0.7305277, 1, 1, 1, 1, 1,
-0.4829485, -1.151582, -1.349129, 1, 1, 1, 1, 1,
-0.4805509, 0.4552028, -1.7918, 1, 1, 1, 1, 1,
-0.476694, -0.7904397, -2.041718, 1, 1, 1, 1, 1,
-0.4756199, 0.2220825, 0.5990443, 1, 1, 1, 1, 1,
-0.4744966, -0.7966862, -2.833397, 1, 1, 1, 1, 1,
-0.4726437, 0.1055456, -2.762854, 1, 1, 1, 1, 1,
-0.4707257, -0.5899796, -3.515265, 1, 1, 1, 1, 1,
-0.4697293, 2.22669, -1.574624, 1, 1, 1, 1, 1,
-0.4665349, -0.03482544, -1.674037, 1, 1, 1, 1, 1,
-0.4590615, 1.189318, 1.472919, 0, 0, 1, 1, 1,
-0.4586575, -0.3769501, -3.309562, 1, 0, 0, 1, 1,
-0.4553406, 0.1435076, -1.516524, 1, 0, 0, 1, 1,
-0.4551342, 1.195715, 1.056626, 1, 0, 0, 1, 1,
-0.4511765, -0.6492838, -1.950639, 1, 0, 0, 1, 1,
-0.4487208, -0.4980322, -2.503424, 1, 0, 0, 1, 1,
-0.44729, -0.04865084, -1.847486, 0, 0, 0, 1, 1,
-0.4447406, -0.2024521, -2.421828, 0, 0, 0, 1, 1,
-0.444358, 1.155754, 0.5205721, 0, 0, 0, 1, 1,
-0.4404042, -0.2595086, -3.577468, 0, 0, 0, 1, 1,
-0.4375159, 0.5859985, -0.4871346, 0, 0, 0, 1, 1,
-0.4371212, -0.7754022, -3.214227, 0, 0, 0, 1, 1,
-0.4342782, -0.02877879, -2.799844, 0, 0, 0, 1, 1,
-0.4322045, -1.397061, -3.621402, 1, 1, 1, 1, 1,
-0.4316081, -2.062534, -3.907454, 1, 1, 1, 1, 1,
-0.4315325, -1.204035, -3.241021, 1, 1, 1, 1, 1,
-0.4314093, 0.9056326, -0.106456, 1, 1, 1, 1, 1,
-0.4298202, 0.5942219, -0.7039275, 1, 1, 1, 1, 1,
-0.4259622, 0.4472319, -0.2510852, 1, 1, 1, 1, 1,
-0.425632, -0.3871146, -2.7914, 1, 1, 1, 1, 1,
-0.4254572, 0.1415851, -2.407213, 1, 1, 1, 1, 1,
-0.4211711, 1.152515, -0.4396617, 1, 1, 1, 1, 1,
-0.4204237, 0.2060625, -1.366005, 1, 1, 1, 1, 1,
-0.4181913, 0.681524, -1.162484, 1, 1, 1, 1, 1,
-0.4174361, 1.502332, 0.1517492, 1, 1, 1, 1, 1,
-0.4036524, 0.2729656, -0.4971679, 1, 1, 1, 1, 1,
-0.4006106, -1.161072, -1.741694, 1, 1, 1, 1, 1,
-0.3992688, 0.2835894, -2.11904, 1, 1, 1, 1, 1,
-0.3793741, -0.006317887, -1.356082, 0, 0, 1, 1, 1,
-0.377253, 0.1611557, 0.6860978, 1, 0, 0, 1, 1,
-0.3748203, -0.1393281, -1.460525, 1, 0, 0, 1, 1,
-0.3728449, -0.2006937, -3.058959, 1, 0, 0, 1, 1,
-0.3701642, 0.5739751, -2.059833, 1, 0, 0, 1, 1,
-0.3689017, -0.283533, -1.664032, 1, 0, 0, 1, 1,
-0.3637194, -1.367728, -1.505719, 0, 0, 0, 1, 1,
-0.3627653, -2.109792, -0.8866338, 0, 0, 0, 1, 1,
-0.3593929, -1.113222, -3.311825, 0, 0, 0, 1, 1,
-0.3541704, 0.7585421, 0.09440445, 0, 0, 0, 1, 1,
-0.353359, -0.56089, -1.768403, 0, 0, 0, 1, 1,
-0.350581, -1.005227, -2.258229, 0, 0, 0, 1, 1,
-0.3460783, -0.4120669, -0.9657745, 0, 0, 0, 1, 1,
-0.3451485, -1.372309, -3.935167, 1, 1, 1, 1, 1,
-0.3443953, 0.04781157, -0.1879191, 1, 1, 1, 1, 1,
-0.3435485, -0.5076606, -2.259246, 1, 1, 1, 1, 1,
-0.3431593, 0.3458152, 0.9811617, 1, 1, 1, 1, 1,
-0.3430908, -0.4547638, -1.99968, 1, 1, 1, 1, 1,
-0.3418209, 0.9616187, -1.180398, 1, 1, 1, 1, 1,
-0.3353712, 0.841741, 1.697402, 1, 1, 1, 1, 1,
-0.3351913, -0.2777253, -1.675389, 1, 1, 1, 1, 1,
-0.3344471, -0.02328207, -1.604426, 1, 1, 1, 1, 1,
-0.3245418, 2.214259, 1.197366, 1, 1, 1, 1, 1,
-0.3236057, 0.6512855, -1.084273, 1, 1, 1, 1, 1,
-0.3212941, 1.107725, -0.7388129, 1, 1, 1, 1, 1,
-0.3201053, -2.799797, -3.324235, 1, 1, 1, 1, 1,
-0.3199981, -1.410412, -3.47413, 1, 1, 1, 1, 1,
-0.317854, -2.152262, -2.963651, 1, 1, 1, 1, 1,
-0.3151407, -0.2486884, -0.6116499, 0, 0, 1, 1, 1,
-0.3138931, 0.9481049, 0.05504652, 1, 0, 0, 1, 1,
-0.3117246, 0.06708451, -1.427686, 1, 0, 0, 1, 1,
-0.3051341, -0.6737731, -2.652333, 1, 0, 0, 1, 1,
-0.3050993, 0.6357657, -0.2768507, 1, 0, 0, 1, 1,
-0.3023491, 1.276649, -1.944539, 1, 0, 0, 1, 1,
-0.3001679, -1.465598, -2.771025, 0, 0, 0, 1, 1,
-0.2971054, -0.4950571, -1.299139, 0, 0, 0, 1, 1,
-0.2951011, -1.056004, -2.915554, 0, 0, 0, 1, 1,
-0.2907448, -0.06613909, -0.0972074, 0, 0, 0, 1, 1,
-0.2887538, 0.4327411, -0.2569348, 0, 0, 0, 1, 1,
-0.2882864, -1.710519, -2.140501, 0, 0, 0, 1, 1,
-0.2877414, -1.863015, -3.199829, 0, 0, 0, 1, 1,
-0.2875338, 0.5268496, 0.7228153, 1, 1, 1, 1, 1,
-0.284653, -0.8124662, -1.757836, 1, 1, 1, 1, 1,
-0.2739266, -1.100361, -3.77517, 1, 1, 1, 1, 1,
-0.2729729, -0.9320882, -2.056241, 1, 1, 1, 1, 1,
-0.266084, -0.005867475, -0.4840513, 1, 1, 1, 1, 1,
-0.26266, 0.3444357, -0.5540894, 1, 1, 1, 1, 1,
-0.2620005, 0.8243353, -0.3046121, 1, 1, 1, 1, 1,
-0.2567175, 0.6948949, -0.1045454, 1, 1, 1, 1, 1,
-0.2498602, -1.138356, -2.69859, 1, 1, 1, 1, 1,
-0.2493958, 0.05022451, -0.8063816, 1, 1, 1, 1, 1,
-0.2490441, -1.291106, -3.084461, 1, 1, 1, 1, 1,
-0.2440021, -0.6204993, -3.083402, 1, 1, 1, 1, 1,
-0.2426065, -0.9097349, -3.511983, 1, 1, 1, 1, 1,
-0.2370533, 0.2334649, -0.4179038, 1, 1, 1, 1, 1,
-0.2369159, 0.8722897, -0.07527824, 1, 1, 1, 1, 1,
-0.2363321, 0.6958537, 0.4550054, 0, 0, 1, 1, 1,
-0.2339805, 0.00310275, -3.569574, 1, 0, 0, 1, 1,
-0.2325693, -0.2293458, -3.78592, 1, 0, 0, 1, 1,
-0.2307469, 0.7179046, 1.029483, 1, 0, 0, 1, 1,
-0.2282912, -1.437769, -4.891902, 1, 0, 0, 1, 1,
-0.2206176, 1.652045, 0.6038661, 1, 0, 0, 1, 1,
-0.2205239, -0.5357775, -3.75831, 0, 0, 0, 1, 1,
-0.219519, -1.846491, -4.226074, 0, 0, 0, 1, 1,
-0.215593, 0.1198784, -2.478494, 0, 0, 0, 1, 1,
-0.2132277, 0.8377717, -1.13264, 0, 0, 0, 1, 1,
-0.210998, -0.04173061, -1.810724, 0, 0, 0, 1, 1,
-0.2094229, 1.583256, -0.9991587, 0, 0, 0, 1, 1,
-0.2093655, -0.7550179, -1.873924, 0, 0, 0, 1, 1,
-0.2089034, -0.8336904, -2.913061, 1, 1, 1, 1, 1,
-0.2078428, -0.8315011, -2.352899, 1, 1, 1, 1, 1,
-0.2035301, 0.6350797, -1.490607, 1, 1, 1, 1, 1,
-0.2026001, -1.267703, -2.489661, 1, 1, 1, 1, 1,
-0.2017486, 0.08574559, -0.9279314, 1, 1, 1, 1, 1,
-0.200672, -0.05071046, -0.408226, 1, 1, 1, 1, 1,
-0.1976753, 0.2417699, -1.27023, 1, 1, 1, 1, 1,
-0.1970354, 1.32603, -2.387162, 1, 1, 1, 1, 1,
-0.1961034, -1.461265, -4.754971, 1, 1, 1, 1, 1,
-0.1960706, -0.7537901, -2.243791, 1, 1, 1, 1, 1,
-0.1954674, -0.3091494, -2.130508, 1, 1, 1, 1, 1,
-0.1939585, -1.443112, -3.896196, 1, 1, 1, 1, 1,
-0.1923717, -0.6027582, -2.230571, 1, 1, 1, 1, 1,
-0.1913781, 1.097399, -0.238334, 1, 1, 1, 1, 1,
-0.1907431, -0.5096038, -2.64333, 1, 1, 1, 1, 1,
-0.1798023, -0.4762112, -3.66323, 0, 0, 1, 1, 1,
-0.1777211, -0.6178342, -2.161542, 1, 0, 0, 1, 1,
-0.1734676, -0.2658819, -2.958567, 1, 0, 0, 1, 1,
-0.1717837, -0.136999, -2.473766, 1, 0, 0, 1, 1,
-0.1712095, -0.7516608, -3.598871, 1, 0, 0, 1, 1,
-0.1685375, 0.5557647, 1.061864, 1, 0, 0, 1, 1,
-0.1602787, -0.9437081, -1.458499, 0, 0, 0, 1, 1,
-0.1485581, 0.5842502, -1.304764, 0, 0, 0, 1, 1,
-0.1473495, -1.134229, -2.918725, 0, 0, 0, 1, 1,
-0.1464948, -0.100929, -1.756429, 0, 0, 0, 1, 1,
-0.1463113, 0.906356, -1.832673, 0, 0, 0, 1, 1,
-0.1452808, -0.4026534, -2.28093, 0, 0, 0, 1, 1,
-0.1435971, 0.7639629, -0.6046683, 0, 0, 0, 1, 1,
-0.1350323, -0.04671082, -2.226247, 1, 1, 1, 1, 1,
-0.1333364, -0.175773, -3.825545, 1, 1, 1, 1, 1,
-0.1308609, -1.046218, -2.283612, 1, 1, 1, 1, 1,
-0.1302051, -1.288016, -4.860789, 1, 1, 1, 1, 1,
-0.1296872, 0.5406671, 0.9098777, 1, 1, 1, 1, 1,
-0.118074, -0.9695213, -0.6696425, 1, 1, 1, 1, 1,
-0.1115108, 1.354911, -1.968012, 1, 1, 1, 1, 1,
-0.1082596, 0.6688917, -1.115433, 1, 1, 1, 1, 1,
-0.1053676, 0.1775846, 0.341141, 1, 1, 1, 1, 1,
-0.09694239, 0.8201291, -0.02072626, 1, 1, 1, 1, 1,
-0.09638175, -1.520869, -3.075489, 1, 1, 1, 1, 1,
-0.09378965, 0.7664578, 0.1458709, 1, 1, 1, 1, 1,
-0.09310157, -0.03202553, -3.182195, 1, 1, 1, 1, 1,
-0.08948168, 0.03633372, -2.506855, 1, 1, 1, 1, 1,
-0.08868199, 0.769986, -0.630028, 1, 1, 1, 1, 1,
-0.08708781, 0.4098518, 0.8856446, 0, 0, 1, 1, 1,
-0.07965203, 2.171581, -1.471873, 1, 0, 0, 1, 1,
-0.07865065, -1.790213, -3.700225, 1, 0, 0, 1, 1,
-0.07653975, -0.8364158, -3.313213, 1, 0, 0, 1, 1,
-0.07615817, 0.7254493, -2.656484, 1, 0, 0, 1, 1,
-0.07089282, -0.1296754, -2.603703, 1, 0, 0, 1, 1,
-0.07029588, 0.5891392, -1.620174, 0, 0, 0, 1, 1,
-0.06970056, 0.0004189635, -2.642157, 0, 0, 0, 1, 1,
-0.06899206, -0.4933583, -2.96868, 0, 0, 0, 1, 1,
-0.06260902, -0.5288275, -2.810203, 0, 0, 0, 1, 1,
-0.05986166, 0.3534317, 0.3612015, 0, 0, 0, 1, 1,
-0.05957424, 0.5789186, -1.059144, 0, 0, 0, 1, 1,
-0.05496954, -0.2807937, -3.381401, 0, 0, 0, 1, 1,
-0.04760053, -1.638764, -1.527417, 1, 1, 1, 1, 1,
-0.03664307, 0.162744, 0.7247564, 1, 1, 1, 1, 1,
-0.03361623, 0.7682748, -0.808818, 1, 1, 1, 1, 1,
-0.02929253, 1.659734, -0.4862243, 1, 1, 1, 1, 1,
-0.02852402, 0.2044142, -0.7514687, 1, 1, 1, 1, 1,
-0.02822047, 0.04338273, -0.6224534, 1, 1, 1, 1, 1,
-0.02809166, -2.021876, -4.675612, 1, 1, 1, 1, 1,
-0.02765606, 0.2605459, 0.6131405, 1, 1, 1, 1, 1,
-0.02280679, -2.201168, -1.343795, 1, 1, 1, 1, 1,
-0.02061144, 0.7913367, -2.126855, 1, 1, 1, 1, 1,
-0.01938082, 1.486127, -0.7669639, 1, 1, 1, 1, 1,
-0.01824053, 0.2624221, -1.00244, 1, 1, 1, 1, 1,
-0.01647586, 0.5846974, -1.320981, 1, 1, 1, 1, 1,
-0.008703542, 0.3676631, -1.365295, 1, 1, 1, 1, 1,
-0.006409867, 0.3120224, 0.7630436, 1, 1, 1, 1, 1,
0.00115373, 0.3163129, -0.8957334, 0, 0, 1, 1, 1,
0.002228689, -0.3110234, 3.159982, 1, 0, 0, 1, 1,
0.00415851, 1.316102, 1.10565, 1, 0, 0, 1, 1,
0.007458925, -1.238674, 2.979823, 1, 0, 0, 1, 1,
0.007658319, -0.3078821, 2.98608, 1, 0, 0, 1, 1,
0.01133912, 0.7803483, 0.6405295, 1, 0, 0, 1, 1,
0.01394033, -1.200065, 1.232785, 0, 0, 0, 1, 1,
0.0175714, -1.144866, 3.941145, 0, 0, 0, 1, 1,
0.018431, -2.184792, 1.461677, 0, 0, 0, 1, 1,
0.0233726, 1.39658, 0.5720738, 0, 0, 0, 1, 1,
0.02657227, -0.5714527, 3.351815, 0, 0, 0, 1, 1,
0.03128057, -1.079696, 1.780976, 0, 0, 0, 1, 1,
0.03166642, -1.049102, 3.302795, 0, 0, 0, 1, 1,
0.03335809, 0.5391876, 0.634184, 1, 1, 1, 1, 1,
0.03446227, 0.3536579, -1.135139, 1, 1, 1, 1, 1,
0.03583998, 0.2590229, 0.5397701, 1, 1, 1, 1, 1,
0.03595332, -0.2676995, 2.95766, 1, 1, 1, 1, 1,
0.05124123, -0.4012277, 2.94585, 1, 1, 1, 1, 1,
0.05305158, -0.2118473, 4.312098, 1, 1, 1, 1, 1,
0.05430099, -0.8337054, 2.955757, 1, 1, 1, 1, 1,
0.05480029, 0.1472095, 0.6013547, 1, 1, 1, 1, 1,
0.05679832, 0.5535005, -0.8721023, 1, 1, 1, 1, 1,
0.05754103, 0.9782115, 0.8894601, 1, 1, 1, 1, 1,
0.0589366, 0.4208749, -0.1251421, 1, 1, 1, 1, 1,
0.06208195, 0.3226117, 1.665448, 1, 1, 1, 1, 1,
0.06269144, 1.005492, -0.3976432, 1, 1, 1, 1, 1,
0.0641287, -1.299019, 4.133576, 1, 1, 1, 1, 1,
0.06546039, -0.06402961, 3.644763, 1, 1, 1, 1, 1,
0.06563926, -0.6307349, 4.546316, 0, 0, 1, 1, 1,
0.0684804, 1.080561, -1.083693, 1, 0, 0, 1, 1,
0.07441238, -0.5924209, 4.47961, 1, 0, 0, 1, 1,
0.07669984, -1.654935, 2.343235, 1, 0, 0, 1, 1,
0.07823834, 0.3303231, 0.4688657, 1, 0, 0, 1, 1,
0.0836378, -0.7885588, 1.97809, 1, 0, 0, 1, 1,
0.08974438, -0.9484389, 1.890197, 0, 0, 0, 1, 1,
0.09043328, 0.9711307, -1.739499, 0, 0, 0, 1, 1,
0.09140126, -2.50153, 4.20258, 0, 0, 0, 1, 1,
0.09503475, 1.146966, -0.006262587, 0, 0, 0, 1, 1,
0.09904639, -0.1342794, 1.415468, 0, 0, 0, 1, 1,
0.1000482, 0.5443602, -0.7605784, 0, 0, 0, 1, 1,
0.1000955, 0.03293913, 0.8996435, 0, 0, 0, 1, 1,
0.1057125, 0.6257568, 1.914464, 1, 1, 1, 1, 1,
0.1112084, -1.098161, 1.424332, 1, 1, 1, 1, 1,
0.1158886, -2.646816, 2.759676, 1, 1, 1, 1, 1,
0.1214159, 0.8560574, 0.02725492, 1, 1, 1, 1, 1,
0.1224906, -0.5008436, 3.499969, 1, 1, 1, 1, 1,
0.1230675, -1.927502, 2.44358, 1, 1, 1, 1, 1,
0.1289464, -0.5376017, 1.201655, 1, 1, 1, 1, 1,
0.1293175, -0.1562238, 2.300887, 1, 1, 1, 1, 1,
0.1316674, 0.4289314, 1.007935, 1, 1, 1, 1, 1,
0.1328817, 0.3910637, 0.8921734, 1, 1, 1, 1, 1,
0.1334189, 0.2253209, 0.5090203, 1, 1, 1, 1, 1,
0.1348013, 1.096301, 0.6823559, 1, 1, 1, 1, 1,
0.1353551, 0.4581321, -1.295528, 1, 1, 1, 1, 1,
0.1369748, -0.1656603, 3.798466, 1, 1, 1, 1, 1,
0.1420142, -0.4476815, 2.123241, 1, 1, 1, 1, 1,
0.1430585, -0.8170052, 4.17218, 0, 0, 1, 1, 1,
0.1433762, 1.267337, 0.7714867, 1, 0, 0, 1, 1,
0.1465014, -0.9307718, 2.535327, 1, 0, 0, 1, 1,
0.1481653, 1.130688, -0.504482, 1, 0, 0, 1, 1,
0.1506156, -0.4262028, 4.168273, 1, 0, 0, 1, 1,
0.1536372, -0.01772876, 1.860526, 1, 0, 0, 1, 1,
0.158163, -0.3450674, 3.231785, 0, 0, 0, 1, 1,
0.1591913, -1.045279, 2.439878, 0, 0, 0, 1, 1,
0.16033, 0.05450987, 1.625615, 0, 0, 0, 1, 1,
0.1616887, 0.9056354, -0.5472986, 0, 0, 0, 1, 1,
0.1620767, -0.6739272, 3.151557, 0, 0, 0, 1, 1,
0.1639374, 0.2403882, 0.2471228, 0, 0, 0, 1, 1,
0.1641599, 0.3439234, 0.9274351, 0, 0, 0, 1, 1,
0.164801, 0.2065397, -0.5429285, 1, 1, 1, 1, 1,
0.1648923, -1.698749, 2.008079, 1, 1, 1, 1, 1,
0.16529, -0.1605474, 2.522897, 1, 1, 1, 1, 1,
0.1653575, -0.4924305, 3.07237, 1, 1, 1, 1, 1,
0.1668542, 0.5299088, 0.8902366, 1, 1, 1, 1, 1,
0.167836, -1.627631, 1.988654, 1, 1, 1, 1, 1,
0.1710548, 0.3218195, 0.3409383, 1, 1, 1, 1, 1,
0.1751075, 0.8919399, 0.5460377, 1, 1, 1, 1, 1,
0.1753504, 1.325113, 0.8476012, 1, 1, 1, 1, 1,
0.1786426, 0.6405187, 0.3382649, 1, 1, 1, 1, 1,
0.1790668, -0.2715653, 2.106937, 1, 1, 1, 1, 1,
0.1794475, -1.127354, 3.398118, 1, 1, 1, 1, 1,
0.190366, -0.5655454, 2.038699, 1, 1, 1, 1, 1,
0.195446, 0.8129193, 1.513507, 1, 1, 1, 1, 1,
0.1968553, -0.2227639, 2.545446, 1, 1, 1, 1, 1,
0.2031475, -0.8672906, 3.136291, 0, 0, 1, 1, 1,
0.2054649, -0.9650687, 3.861848, 1, 0, 0, 1, 1,
0.2068194, 0.6612442, 1.216581, 1, 0, 0, 1, 1,
0.2147602, 0.1051172, 0.9992214, 1, 0, 0, 1, 1,
0.216682, 0.7738147, -0.1692136, 1, 0, 0, 1, 1,
0.2178288, -0.1960129, 2.292493, 1, 0, 0, 1, 1,
0.2187351, 2.202313, 0.8690104, 0, 0, 0, 1, 1,
0.2192494, -2.049301, 1.446737, 0, 0, 0, 1, 1,
0.2297361, -0.7654248, 1.913882, 0, 0, 0, 1, 1,
0.2300538, 1.445803, 0.5652401, 0, 0, 0, 1, 1,
0.2319026, -1.904625, 3.023072, 0, 0, 0, 1, 1,
0.23534, 1.57241, -0.8468262, 0, 0, 0, 1, 1,
0.2404844, -1.642725, 3.210799, 0, 0, 0, 1, 1,
0.2407965, 1.421136, -0.9056233, 1, 1, 1, 1, 1,
0.2431602, -0.3573065, 3.288411, 1, 1, 1, 1, 1,
0.2441719, -0.4251084, 2.257528, 1, 1, 1, 1, 1,
0.2449582, -0.1842107, 1.703488, 1, 1, 1, 1, 1,
0.2465096, 0.830691, -0.2061571, 1, 1, 1, 1, 1,
0.2467088, -0.4808613, 0.3103665, 1, 1, 1, 1, 1,
0.2504137, 0.352802, -0.3270426, 1, 1, 1, 1, 1,
0.2557787, 0.4978321, 0.2316533, 1, 1, 1, 1, 1,
0.2561417, 0.02687215, 1.432254, 1, 1, 1, 1, 1,
0.2563649, 0.003263871, 2.095244, 1, 1, 1, 1, 1,
0.2589197, -0.2686229, 1.887695, 1, 1, 1, 1, 1,
0.2593625, 0.957581, -0.1613187, 1, 1, 1, 1, 1,
0.2612942, -1.124547, 3.830636, 1, 1, 1, 1, 1,
0.2629858, 0.1918505, 1.718094, 1, 1, 1, 1, 1,
0.2641976, -0.2255756, 1.302651, 1, 1, 1, 1, 1,
0.2642533, -2.043044, 3.389851, 0, 0, 1, 1, 1,
0.2656447, -0.934098, 4.478916, 1, 0, 0, 1, 1,
0.2673955, 0.881945, 1.417613, 1, 0, 0, 1, 1,
0.2776951, -0.4045821, 2.064535, 1, 0, 0, 1, 1,
0.2784144, -0.07675597, 0.651037, 1, 0, 0, 1, 1,
0.2785121, 0.2858154, 1.206418, 1, 0, 0, 1, 1,
0.2798646, -0.7476274, 5.587209, 0, 0, 0, 1, 1,
0.281862, -0.2354491, 2.379208, 0, 0, 0, 1, 1,
0.2819478, -0.088048, 1.813102, 0, 0, 0, 1, 1,
0.2828301, -1.61503, 2.075513, 0, 0, 0, 1, 1,
0.2876443, -0.4693211, 1.82619, 0, 0, 0, 1, 1,
0.2877768, 1.010092, -1.051788, 0, 0, 0, 1, 1,
0.2885807, -0.3532697, 1.876815, 0, 0, 0, 1, 1,
0.289191, -0.5244573, 2.43941, 1, 1, 1, 1, 1,
0.2950178, -0.004827631, 0.04429869, 1, 1, 1, 1, 1,
0.2953138, 1.586333, 0.4193616, 1, 1, 1, 1, 1,
0.2979818, 0.1403851, 2.324753, 1, 1, 1, 1, 1,
0.3016881, -0.9673575, 2.375731, 1, 1, 1, 1, 1,
0.3033787, -0.005681138, 1.454602, 1, 1, 1, 1, 1,
0.3104594, -0.8814809, 4.000415, 1, 1, 1, 1, 1,
0.3112077, -0.1264198, 2.334292, 1, 1, 1, 1, 1,
0.3115499, 0.6360635, 0.8328884, 1, 1, 1, 1, 1,
0.3135989, 0.6518478, 0.5830415, 1, 1, 1, 1, 1,
0.3175657, 0.3758121, -0.1122825, 1, 1, 1, 1, 1,
0.3192004, 0.4859465, -1.468356, 1, 1, 1, 1, 1,
0.3203587, 0.546243, -1.244612, 1, 1, 1, 1, 1,
0.3270221, 0.6157597, -0.3252741, 1, 1, 1, 1, 1,
0.3295624, -0.7509776, 4.759965, 1, 1, 1, 1, 1,
0.3311858, -0.4253714, 1.933738, 0, 0, 1, 1, 1,
0.3320691, -1.092061, 2.235495, 1, 0, 0, 1, 1,
0.3323395, 1.425075, 0.01437063, 1, 0, 0, 1, 1,
0.3324806, 1.552333, -0.5815198, 1, 0, 0, 1, 1,
0.3410392, 0.8847835, 0.006612316, 1, 0, 0, 1, 1,
0.3418255, -0.2004423, 1.296588, 1, 0, 0, 1, 1,
0.3464987, -0.8576885, 2.420401, 0, 0, 0, 1, 1,
0.3474005, -1.048732, 3.182595, 0, 0, 0, 1, 1,
0.3478333, -0.246291, 1.932452, 0, 0, 0, 1, 1,
0.3548263, -2.388197, 2.121318, 0, 0, 0, 1, 1,
0.3581536, 1.417849, 1.632671, 0, 0, 0, 1, 1,
0.3589206, -0.8842784, 4.130205, 0, 0, 0, 1, 1,
0.3595689, 0.2733628, 0.6476849, 0, 0, 0, 1, 1,
0.3674255, -0.9003902, 3.829984, 1, 1, 1, 1, 1,
0.372969, -0.1921459, 2.953943, 1, 1, 1, 1, 1,
0.3752979, 0.5172905, 1.052297, 1, 1, 1, 1, 1,
0.3782758, -0.6753157, 4.091825, 1, 1, 1, 1, 1,
0.378696, 0.9277348, 1.038552, 1, 1, 1, 1, 1,
0.3806049, 1.039384, 0.08246956, 1, 1, 1, 1, 1,
0.3845385, -0.7133635, 3.798898, 1, 1, 1, 1, 1,
0.3846448, 1.666144, 0.9292033, 1, 1, 1, 1, 1,
0.3861914, 0.4227951, 0.7217835, 1, 1, 1, 1, 1,
0.391839, 0.06825456, 1.89378, 1, 1, 1, 1, 1,
0.3968122, -0.7199055, 4.498998, 1, 1, 1, 1, 1,
0.396856, -0.1837106, 2.552992, 1, 1, 1, 1, 1,
0.4013881, -0.1198026, 1.463737, 1, 1, 1, 1, 1,
0.4099614, -0.06466341, 1.550697, 1, 1, 1, 1, 1,
0.4131372, 0.1267022, 0.5500733, 1, 1, 1, 1, 1,
0.4161486, -1.541036, 1.653821, 0, 0, 1, 1, 1,
0.424825, 0.3152671, 1.609606, 1, 0, 0, 1, 1,
0.4278313, 0.1610829, 2.826473, 1, 0, 0, 1, 1,
0.4310759, 0.1279162, 0.03582443, 1, 0, 0, 1, 1,
0.433325, -0.5727252, 2.173372, 1, 0, 0, 1, 1,
0.4342146, 0.8749514, 1.470016, 1, 0, 0, 1, 1,
0.4425703, -0.6744131, 3.194428, 0, 0, 0, 1, 1,
0.4451251, 0.8064672, 0.971691, 0, 0, 0, 1, 1,
0.4467441, 0.1057632, 1.654261, 0, 0, 0, 1, 1,
0.4498027, -0.7316583, -0.01140975, 0, 0, 0, 1, 1,
0.4504726, -0.4406687, 2.306333, 0, 0, 0, 1, 1,
0.4532368, -1.700334, 2.608554, 0, 0, 0, 1, 1,
0.454937, -0.1458054, 2.982376, 0, 0, 0, 1, 1,
0.4562033, 1.270419, 0.5109599, 1, 1, 1, 1, 1,
0.4584943, 0.619078, -1.805778, 1, 1, 1, 1, 1,
0.4635693, 0.8162371, 0.4624993, 1, 1, 1, 1, 1,
0.4651013, -1.37123, 2.930989, 1, 1, 1, 1, 1,
0.4685192, -0.1509396, 1.750851, 1, 1, 1, 1, 1,
0.4813485, -0.2588242, 1.956915, 1, 1, 1, 1, 1,
0.4894651, -0.5334567, 2.852682, 1, 1, 1, 1, 1,
0.4922075, -0.07926808, 0.1586219, 1, 1, 1, 1, 1,
0.5018156, -1.390189, 4.217021, 1, 1, 1, 1, 1,
0.5024192, 1.562072, 0.1990305, 1, 1, 1, 1, 1,
0.5072831, 0.89876, 1.457724, 1, 1, 1, 1, 1,
0.5073543, 0.5117568, 2.005104, 1, 1, 1, 1, 1,
0.5091425, 0.9828311, -0.3871119, 1, 1, 1, 1, 1,
0.5155413, -0.002418973, 1.601435, 1, 1, 1, 1, 1,
0.5164313, 0.5460605, 0.7768778, 1, 1, 1, 1, 1,
0.5185093, -1.22776, 3.448534, 0, 0, 1, 1, 1,
0.5231365, 0.8344692, 2.017169, 1, 0, 0, 1, 1,
0.5241612, -1.697061, 2.546478, 1, 0, 0, 1, 1,
0.5254579, -0.0926863, 0.1146562, 1, 0, 0, 1, 1,
0.5256026, -0.4702212, 3.454306, 1, 0, 0, 1, 1,
0.5273947, -0.8510011, 3.421795, 1, 0, 0, 1, 1,
0.5350592, 0.6839812, -0.3915801, 0, 0, 0, 1, 1,
0.5427881, 0.9942487, -0.6949438, 0, 0, 0, 1, 1,
0.5442688, 0.5587984, 1.662466, 0, 0, 0, 1, 1,
0.5447562, 0.2753431, -0.5504667, 0, 0, 0, 1, 1,
0.546881, 1.463884, 3.139334, 0, 0, 0, 1, 1,
0.5532709, 0.1505773, 2.747394, 0, 0, 0, 1, 1,
0.5597044, 0.6270402, 1.591555, 0, 0, 0, 1, 1,
0.5639502, -0.3391257, 0.8561879, 1, 1, 1, 1, 1,
0.5663127, 1.024161, 0.8677202, 1, 1, 1, 1, 1,
0.566985, -0.3789094, 1.91886, 1, 1, 1, 1, 1,
0.5713362, -0.05350697, 1.01243, 1, 1, 1, 1, 1,
0.5739481, 0.221269, 3.254002, 1, 1, 1, 1, 1,
0.5740536, 0.1042326, 0.8967975, 1, 1, 1, 1, 1,
0.5747272, 0.4180492, 1.46152, 1, 1, 1, 1, 1,
0.5755222, -0.374329, 2.917105, 1, 1, 1, 1, 1,
0.5789783, -1.361108, 1.607146, 1, 1, 1, 1, 1,
0.5840675, -0.411477, 0.8688008, 1, 1, 1, 1, 1,
0.5870397, 0.3708683, 1.281945, 1, 1, 1, 1, 1,
0.5878603, -1.227511, 3.751496, 1, 1, 1, 1, 1,
0.5892292, -0.1189099, 1.088, 1, 1, 1, 1, 1,
0.589626, 0.041005, 1.184149, 1, 1, 1, 1, 1,
0.5964361, -0.2044276, 1.865202, 1, 1, 1, 1, 1,
0.5975822, -1.798278, 1.447581, 0, 0, 1, 1, 1,
0.6005142, 0.1716827, -0.06753761, 1, 0, 0, 1, 1,
0.6042296, 0.9996565, 1.060186, 1, 0, 0, 1, 1,
0.6108739, -0.6306252, 2.011235, 1, 0, 0, 1, 1,
0.6111693, 1.454885, -0.7514687, 1, 0, 0, 1, 1,
0.6139261, -0.3233493, 1.175594, 1, 0, 0, 1, 1,
0.6243781, -1.869694, 2.904379, 0, 0, 0, 1, 1,
0.625658, 1.855142, 0.6855644, 0, 0, 0, 1, 1,
0.6294915, -0.2998108, 2.72377, 0, 0, 0, 1, 1,
0.642427, 0.537076, 1.274598, 0, 0, 0, 1, 1,
0.6455038, -0.8348438, 0.7616051, 0, 0, 0, 1, 1,
0.6479264, 0.0391284, 2.509071, 0, 0, 0, 1, 1,
0.6498832, -0.1938837, 1.707829, 0, 0, 0, 1, 1,
0.6527141, -0.2659622, 3.005138, 1, 1, 1, 1, 1,
0.6575605, 0.4822978, 0.892232, 1, 1, 1, 1, 1,
0.6596889, 0.0114366, 0.9962665, 1, 1, 1, 1, 1,
0.6642532, 0.824012, 1.583901, 1, 1, 1, 1, 1,
0.6669984, -0.3618465, 2.151482, 1, 1, 1, 1, 1,
0.6699867, -1.514032, 1.484898, 1, 1, 1, 1, 1,
0.6743473, -1.516391, 2.577955, 1, 1, 1, 1, 1,
0.6785336, -2.991334, 3.534749, 1, 1, 1, 1, 1,
0.6816549, 0.4333448, 1.378727, 1, 1, 1, 1, 1,
0.6849087, 1.269264, 1.083117, 1, 1, 1, 1, 1,
0.6854973, -2.05055, 2.626473, 1, 1, 1, 1, 1,
0.687111, 0.4250023, 0.7578877, 1, 1, 1, 1, 1,
0.689007, -1.924621, 3.600258, 1, 1, 1, 1, 1,
0.6894446, -0.8894157, 3.57605, 1, 1, 1, 1, 1,
0.6900835, 0.8070352, -0.425175, 1, 1, 1, 1, 1,
0.693064, 0.4263717, -0.463858, 0, 0, 1, 1, 1,
0.6944529, -0.8955763, 4.054227, 1, 0, 0, 1, 1,
0.6948254, 0.3743354, -0.40707, 1, 0, 0, 1, 1,
0.6953884, -0.268578, 3.582503, 1, 0, 0, 1, 1,
0.6963914, -1.059897, 4.394354, 1, 0, 0, 1, 1,
0.6990576, 1.245676, 1.219686, 1, 0, 0, 1, 1,
0.7000594, -1.138975, 3.164703, 0, 0, 0, 1, 1,
0.7022335, 2.242721, 0.6272531, 0, 0, 0, 1, 1,
0.7050797, 0.5406483, 0.2077274, 0, 0, 0, 1, 1,
0.7089515, 0.3235691, 0.4840512, 0, 0, 0, 1, 1,
0.71028, 0.1502931, 1.101025, 0, 0, 0, 1, 1,
0.7111333, 0.2877391, 0.568355, 0, 0, 0, 1, 1,
0.718069, -2.806262, 5.026158, 0, 0, 0, 1, 1,
0.720081, -0.3542766, 4.769452, 1, 1, 1, 1, 1,
0.7232721, 0.9982319, -0.9593705, 1, 1, 1, 1, 1,
0.7258358, 0.3193736, -0.1632866, 1, 1, 1, 1, 1,
0.7302349, -0.9954039, 1.254858, 1, 1, 1, 1, 1,
0.7331098, -0.4772969, 2.947431, 1, 1, 1, 1, 1,
0.7336624, 0.2106358, 0.8221044, 1, 1, 1, 1, 1,
0.7378709, 1.173555, -0.8981835, 1, 1, 1, 1, 1,
0.7432331, 0.7738333, 1.067532, 1, 1, 1, 1, 1,
0.7454521, -2.029904, 1.602621, 1, 1, 1, 1, 1,
0.7527997, -1.545903, 2.647557, 1, 1, 1, 1, 1,
0.7558858, 0.3263849, 0.277838, 1, 1, 1, 1, 1,
0.7635691, 0.8138855, 1.850586, 1, 1, 1, 1, 1,
0.7656907, 0.7418633, 0.5957623, 1, 1, 1, 1, 1,
0.7681056, -0.06803191, 1.700745, 1, 1, 1, 1, 1,
0.7758096, 0.4862124, 2.112343, 1, 1, 1, 1, 1,
0.777719, 0.3770207, 0.7976047, 0, 0, 1, 1, 1,
0.7874826, 0.700348, -0.9667938, 1, 0, 0, 1, 1,
0.7917352, 1.205564, -1.187167, 1, 0, 0, 1, 1,
0.7925014, -1.009578, 2.849636, 1, 0, 0, 1, 1,
0.7963995, 0.2772546, 1.188448, 1, 0, 0, 1, 1,
0.7964157, 0.5264017, 1.203896, 1, 0, 0, 1, 1,
0.8016596, -1.183987, 1.48101, 0, 0, 0, 1, 1,
0.8056485, -0.3381451, 0.7504556, 0, 0, 0, 1, 1,
0.81639, 0.6379139, 1.58171, 0, 0, 0, 1, 1,
0.8184419, 0.4246638, -0.3207501, 0, 0, 0, 1, 1,
0.8192233, -0.97895, 1.782155, 0, 0, 0, 1, 1,
0.8206917, -0.7458891, 2.06626, 0, 0, 0, 1, 1,
0.8208758, 0.6459072, 1.046785, 0, 0, 0, 1, 1,
0.8209465, 0.6985604, 0.6877127, 1, 1, 1, 1, 1,
0.8217531, -0.1872537, 2.4758, 1, 1, 1, 1, 1,
0.8329049, 0.291138, -1.999139, 1, 1, 1, 1, 1,
0.8340398, -0.3668166, 2.110459, 1, 1, 1, 1, 1,
0.8359952, 0.2450118, 2.392653, 1, 1, 1, 1, 1,
0.8374729, -1.621982, 0.2499754, 1, 1, 1, 1, 1,
0.8379145, 1.47408, 0.08273899, 1, 1, 1, 1, 1,
0.8426834, 0.378096, 2.745453, 1, 1, 1, 1, 1,
0.844656, 0.7353773, 0.8349178, 1, 1, 1, 1, 1,
0.8509184, 0.2992349, 0.5787244, 1, 1, 1, 1, 1,
0.8527815, -0.5605343, 1.689151, 1, 1, 1, 1, 1,
0.8786784, -1.764217, 2.881761, 1, 1, 1, 1, 1,
0.8824761, 0.7202766, 0.6588864, 1, 1, 1, 1, 1,
0.885523, 0.4499548, 1.47378, 1, 1, 1, 1, 1,
0.8878672, 1.43389, 0.6215917, 1, 1, 1, 1, 1,
0.8898235, 1.014124, 2.143356, 0, 0, 1, 1, 1,
0.8940282, 0.5334695, 1.588313, 1, 0, 0, 1, 1,
0.8943858, -0.3245681, 2.706933, 1, 0, 0, 1, 1,
0.8970897, -1.225555, 2.105777, 1, 0, 0, 1, 1,
0.8984231, 0.8677672, 2.27171, 1, 0, 0, 1, 1,
0.9120576, 0.8627154, 0.7564023, 1, 0, 0, 1, 1,
0.921984, -0.7271898, 1.685209, 0, 0, 0, 1, 1,
0.9229875, -1.322538, 2.02006, 0, 0, 0, 1, 1,
0.9275719, 0.4074953, 1.09806, 0, 0, 0, 1, 1,
0.929279, -0.5868235, 4.589496, 0, 0, 0, 1, 1,
0.9302529, -0.05689469, 0.4409012, 0, 0, 0, 1, 1,
0.931992, 0.1581473, 2.695347, 0, 0, 0, 1, 1,
0.9333086, -0.09589949, 2.821485, 0, 0, 0, 1, 1,
0.936698, 0.2690183, 0.4921271, 1, 1, 1, 1, 1,
0.9426268, -0.4642063, 4.798578, 1, 1, 1, 1, 1,
0.9428738, -0.6327885, 1.666495, 1, 1, 1, 1, 1,
0.9446651, 2.436714, 0.3544525, 1, 1, 1, 1, 1,
0.9461228, 0.2286482, 2.073772, 1, 1, 1, 1, 1,
0.9488665, 1.35013, 0.1202651, 1, 1, 1, 1, 1,
0.9519506, -2.064823, 4.274935, 1, 1, 1, 1, 1,
0.9550478, 0.5600276, 1.649185, 1, 1, 1, 1, 1,
0.9609093, 0.1788046, 2.47035, 1, 1, 1, 1, 1,
0.9612245, -0.4339084, 2.120555, 1, 1, 1, 1, 1,
0.9633963, -0.1140674, 1.043818, 1, 1, 1, 1, 1,
0.9639358, -0.09572067, 0.9863982, 1, 1, 1, 1, 1,
0.9649587, 1.520089, 0.8382853, 1, 1, 1, 1, 1,
0.9671214, 0.2788935, 4.415364, 1, 1, 1, 1, 1,
0.9688517, 0.5104969, 1.964774, 1, 1, 1, 1, 1,
0.9689668, -2.024277, 2.578791, 0, 0, 1, 1, 1,
0.9689672, 0.390149, 3.236524, 1, 0, 0, 1, 1,
0.9690401, -1.474682, 3.299999, 1, 0, 0, 1, 1,
0.970521, 1.756943, -0.2367124, 1, 0, 0, 1, 1,
0.9720894, 0.388608, 1.246726, 1, 0, 0, 1, 1,
0.9768192, -0.1815053, 1.475178, 1, 0, 0, 1, 1,
0.9780746, -1.443639, 3.516097, 0, 0, 0, 1, 1,
0.9804401, 0.1037772, 1.909323, 0, 0, 0, 1, 1,
0.9828705, -0.8874421, 1.935414, 0, 0, 0, 1, 1,
0.9882324, -0.5277922, 1.176847, 0, 0, 0, 1, 1,
0.9970458, -0.0578447, 1.300311, 0, 0, 0, 1, 1,
1.004133, -0.8762066, 0.1818278, 0, 0, 0, 1, 1,
1.005305, -0.2186319, 1.003078, 0, 0, 0, 1, 1,
1.006885, -1.157111, 1.867362, 1, 1, 1, 1, 1,
1.007165, -0.1811448, 0.4633991, 1, 1, 1, 1, 1,
1.009624, 1.306795, 0.7977696, 1, 1, 1, 1, 1,
1.013244, 0.9508063, 0.5362161, 1, 1, 1, 1, 1,
1.016912, -2.18755, 1.981197, 1, 1, 1, 1, 1,
1.020875, 0.9324679, 0.4284348, 1, 1, 1, 1, 1,
1.024052, 0.7700786, 2.12572, 1, 1, 1, 1, 1,
1.025284, 0.6269448, 1.382827, 1, 1, 1, 1, 1,
1.031399, -0.494165, -0.2184155, 1, 1, 1, 1, 1,
1.035004, 0.6337188, 1.403472, 1, 1, 1, 1, 1,
1.037473, -1.618925, 3.267365, 1, 1, 1, 1, 1,
1.046408, -0.4414274, 1.071535, 1, 1, 1, 1, 1,
1.047395, -1.290231, 4.334152, 1, 1, 1, 1, 1,
1.051192, 0.5236169, -0.6138998, 1, 1, 1, 1, 1,
1.062688, 0.510572, 2.365532, 1, 1, 1, 1, 1,
1.066298, 2.211763, -0.1955533, 0, 0, 1, 1, 1,
1.078228, 0.08203676, 0.5268061, 1, 0, 0, 1, 1,
1.07921, -0.7204782, 2.195853, 1, 0, 0, 1, 1,
1.083829, 1.830869, 0.5353591, 1, 0, 0, 1, 1,
1.08661, -1.730339, 0.8757963, 1, 0, 0, 1, 1,
1.089407, 1.281474, 1.528676, 1, 0, 0, 1, 1,
1.089516, 0.7015098, 0.8835298, 0, 0, 0, 1, 1,
1.096399, -1.218149, 3.584707, 0, 0, 0, 1, 1,
1.097056, 1.848878, 1.379532, 0, 0, 0, 1, 1,
1.097213, 0.004119242, 1.889598, 0, 0, 0, 1, 1,
1.098356, -0.005288824, 3.443234, 0, 0, 0, 1, 1,
1.099786, 1.168786, 0.822464, 0, 0, 0, 1, 1,
1.102276, 2.236322, 0.3252109, 0, 0, 0, 1, 1,
1.104043, 1.660534, 1.09721, 1, 1, 1, 1, 1,
1.109104, -0.8576053, 4.310406, 1, 1, 1, 1, 1,
1.110685, 1.021067, 1.60794, 1, 1, 1, 1, 1,
1.120419, 1.376811, -0.08118174, 1, 1, 1, 1, 1,
1.131069, -1.415931, 1.030975, 1, 1, 1, 1, 1,
1.134811, 0.2843641, 2.480021, 1, 1, 1, 1, 1,
1.157898, 0.758615, -1.253425, 1, 1, 1, 1, 1,
1.169909, 0.3389663, 2.138171, 1, 1, 1, 1, 1,
1.170164, -1.869965, 3.561491, 1, 1, 1, 1, 1,
1.178588, -1.355989, 2.679734, 1, 1, 1, 1, 1,
1.192931, -0.5319806, 1.458252, 1, 1, 1, 1, 1,
1.193787, -0.439173, 1.209808, 1, 1, 1, 1, 1,
1.197352, -1.315109, 2.283912, 1, 1, 1, 1, 1,
1.200032, -0.07966591, 0.2079384, 1, 1, 1, 1, 1,
1.200827, 2.136116, -0.2587653, 1, 1, 1, 1, 1,
1.214634, -0.07671763, 2.121701, 0, 0, 1, 1, 1,
1.217538, 0.6089746, 1.272798, 1, 0, 0, 1, 1,
1.222056, -0.8628488, 2.508242, 1, 0, 0, 1, 1,
1.22761, -0.6169532, 2.086295, 1, 0, 0, 1, 1,
1.228795, -0.3617433, 2.524998, 1, 0, 0, 1, 1,
1.228927, 0.461422, 2.234666, 1, 0, 0, 1, 1,
1.236037, 0.4507154, -0.1685161, 0, 0, 0, 1, 1,
1.237632, 1.393323, 2.379874, 0, 0, 0, 1, 1,
1.24881, 0.06868041, 1.219755, 0, 0, 0, 1, 1,
1.254213, 1.600435, 0.4612408, 0, 0, 0, 1, 1,
1.270774, -0.2762819, 1.100543, 0, 0, 0, 1, 1,
1.276098, -0.3646801, 2.363714, 0, 0, 0, 1, 1,
1.283772, -0.02391731, 0.418104, 0, 0, 0, 1, 1,
1.284796, -1.365624, 2.287119, 1, 1, 1, 1, 1,
1.285469, -0.2082725, 2.50038, 1, 1, 1, 1, 1,
1.286036, -1.408588, 2.16867, 1, 1, 1, 1, 1,
1.288856, 0.3663793, 0.8223614, 1, 1, 1, 1, 1,
1.291333, -0.8533114, 0.6491546, 1, 1, 1, 1, 1,
1.298341, -0.42767, 4.408195, 1, 1, 1, 1, 1,
1.307702, 0.06141795, 0.07620722, 1, 1, 1, 1, 1,
1.307805, -0.398847, 1.958531, 1, 1, 1, 1, 1,
1.311139, 0.4897995, 0.7100036, 1, 1, 1, 1, 1,
1.311294, 0.1153373, 2.353474, 1, 1, 1, 1, 1,
1.314884, -0.2061589, 1.367681, 1, 1, 1, 1, 1,
1.319845, -0.2433573, 1.062904, 1, 1, 1, 1, 1,
1.327582, -0.7889008, 2.129644, 1, 1, 1, 1, 1,
1.336808, -1.193464, 2.926647, 1, 1, 1, 1, 1,
1.348684, 0.3426598, 1.000379, 1, 1, 1, 1, 1,
1.364575, -0.5112127, 2.7183, 0, 0, 1, 1, 1,
1.364616, 0.2781015, 1.791593, 1, 0, 0, 1, 1,
1.368483, -0.3179822, 1.245806, 1, 0, 0, 1, 1,
1.368929, 0.778401, 2.735594, 1, 0, 0, 1, 1,
1.372234, 1.234429, -0.3616726, 1, 0, 0, 1, 1,
1.384763, 0.6621251, 2.134578, 1, 0, 0, 1, 1,
1.386291, -0.6768365, 2.1171, 0, 0, 0, 1, 1,
1.398424, 0.2679903, 0.3566552, 0, 0, 0, 1, 1,
1.399648, -0.604049, 3.138768, 0, 0, 0, 1, 1,
1.402255, 1.073548, 1.226216, 0, 0, 0, 1, 1,
1.409452, 0.04973704, 2.022184, 0, 0, 0, 1, 1,
1.420532, 1.230384, -0.7940356, 0, 0, 0, 1, 1,
1.428504, -1.428263, 1.19214, 0, 0, 0, 1, 1,
1.441138, -0.7676311, 2.498557, 1, 1, 1, 1, 1,
1.460831, 0.6468759, -1.423709, 1, 1, 1, 1, 1,
1.463821, 0.2415965, 0.8229097, 1, 1, 1, 1, 1,
1.469064, 1.743223, -1.139227, 1, 1, 1, 1, 1,
1.472929, -0.812562, 2.932911, 1, 1, 1, 1, 1,
1.47358, 0.9668699, 1.768707, 1, 1, 1, 1, 1,
1.48193, -1.214496, 1.510924, 1, 1, 1, 1, 1,
1.484636, 1.537966, 1.237496, 1, 1, 1, 1, 1,
1.48831, 0.2300458, 0.5735844, 1, 1, 1, 1, 1,
1.494826, -1.577764, 3.405095, 1, 1, 1, 1, 1,
1.50552, 0.3579797, 1.353997, 1, 1, 1, 1, 1,
1.508195, 0.2614307, 0.9695756, 1, 1, 1, 1, 1,
1.516764, 0.3180684, 0.4896494, 1, 1, 1, 1, 1,
1.541713, 0.01149436, 0.2522519, 1, 1, 1, 1, 1,
1.556983, -2.763837, 1.360241, 1, 1, 1, 1, 1,
1.568665, -1.208074, 1.436126, 0, 0, 1, 1, 1,
1.570786, -0.1163059, 2.325246, 1, 0, 0, 1, 1,
1.572323, 2.090931, 1.878839, 1, 0, 0, 1, 1,
1.574092, -0.7292975, 1.288538, 1, 0, 0, 1, 1,
1.585008, 1.240089, 1.174694, 1, 0, 0, 1, 1,
1.590978, 1.606404, 0.1966749, 1, 0, 0, 1, 1,
1.591604, -0.8099432, 1.787937, 0, 0, 0, 1, 1,
1.606377, 2.323002, -0.0863659, 0, 0, 0, 1, 1,
1.609127, -1.179095, 3.333994, 0, 0, 0, 1, 1,
1.644161, -0.8971071, 2.546064, 0, 0, 0, 1, 1,
1.648115, -0.08066441, 2.891631, 0, 0, 0, 1, 1,
1.6728, 0.5555738, 0.6257421, 0, 0, 0, 1, 1,
1.715489, -0.9855415, 1.804002, 0, 0, 0, 1, 1,
1.717858, 0.7385336, 2.268176, 1, 1, 1, 1, 1,
1.719225, -0.2711765, 2.557161, 1, 1, 1, 1, 1,
1.723113, -1.253439, 3.392763, 1, 1, 1, 1, 1,
1.728272, -0.6045735, 1.597264, 1, 1, 1, 1, 1,
1.731011, 1.400385, -0.7524367, 1, 1, 1, 1, 1,
1.754546, 0.07324844, 3.240765, 1, 1, 1, 1, 1,
1.771177, 0.1138605, -0.1035424, 1, 1, 1, 1, 1,
1.802053, 0.164993, 0.8401602, 1, 1, 1, 1, 1,
1.813953, -1.920565, 3.324675, 1, 1, 1, 1, 1,
1.820115, 0.6703219, 1.996107, 1, 1, 1, 1, 1,
1.875946, 0.6342739, 1.326636, 1, 1, 1, 1, 1,
1.880843, -0.6301074, 2.837842, 1, 1, 1, 1, 1,
1.894585, -0.2171955, 1.048442, 1, 1, 1, 1, 1,
1.910988, 2.516721, 0.374734, 1, 1, 1, 1, 1,
1.969175, 0.1515862, 1.848486, 1, 1, 1, 1, 1,
1.99011, -0.4531314, 0.3828936, 0, 0, 1, 1, 1,
1.990851, -1.184297, 2.297278, 1, 0, 0, 1, 1,
2.002246, 2.35488, 1.303375, 1, 0, 0, 1, 1,
2.008164, 0.5523288, -0.04016197, 1, 0, 0, 1, 1,
2.02002, -0.955756, 3.543839, 1, 0, 0, 1, 1,
2.020268, -1.056474, 1.553897, 1, 0, 0, 1, 1,
2.061524, -0.05665467, 2.133303, 0, 0, 0, 1, 1,
2.06317, -1.178905, 2.371842, 0, 0, 0, 1, 1,
2.093792, -0.3960145, 0.8315788, 0, 0, 0, 1, 1,
2.162013, 0.3118966, 1.846965, 0, 0, 0, 1, 1,
2.208382, -0.1075668, 2.438628, 0, 0, 0, 1, 1,
2.235185, 1.255618, 1.653815, 0, 0, 0, 1, 1,
2.342434, 1.572115, 1.105103, 0, 0, 0, 1, 1,
2.480829, 1.670156, 0.5809885, 1, 1, 1, 1, 1,
2.521929, 1.284467, 1.561362, 1, 1, 1, 1, 1,
2.575464, -0.5911579, 1.848535, 1, 1, 1, 1, 1,
2.713499, -1.520098, 2.424392, 1, 1, 1, 1, 1,
2.826354, -0.04705729, 0.188637, 1, 1, 1, 1, 1,
2.861449, -0.5535724, 0.3921651, 1, 1, 1, 1, 1,
3.111141, 0.7086912, -0.2149001, 1, 1, 1, 1, 1
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
var radius = 9.345684;
var distance = 32.82632;
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
mvMatrix.translate( 0.09167314, 0.0432198, -0.3476536 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.82632);
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
