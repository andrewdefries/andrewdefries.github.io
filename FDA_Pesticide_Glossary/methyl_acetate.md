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
-3.513249, -0.2678381, -0.9157435, 1, 0, 0, 1,
-3.258704, -0.4256468, -0.7066342, 1, 0.007843138, 0, 1,
-3.186906, 0.3117456, -1.733423, 1, 0.01176471, 0, 1,
-2.743726, 1.069142, -1.597469, 1, 0.01960784, 0, 1,
-2.705136, 0.9814095, -2.057814, 1, 0.02352941, 0, 1,
-2.512178, -1.075324, -3.181232, 1, 0.03137255, 0, 1,
-2.490002, 0.966936, -3.095805, 1, 0.03529412, 0, 1,
-2.316423, -1.263617, -1.752352, 1, 0.04313726, 0, 1,
-2.271168, 1.354424, -1.555311, 1, 0.04705882, 0, 1,
-2.241187, 0.2092575, -2.439672, 1, 0.05490196, 0, 1,
-2.235671, -0.1229525, -0.7396961, 1, 0.05882353, 0, 1,
-2.202999, 0.5720425, 1.772778, 1, 0.06666667, 0, 1,
-2.157652, 0.1760543, -2.0809, 1, 0.07058824, 0, 1,
-2.121727, -0.2435685, -1.146541, 1, 0.07843138, 0, 1,
-2.118894, -0.2224075, -2.961333, 1, 0.08235294, 0, 1,
-2.113921, -0.8909954, -1.367508, 1, 0.09019608, 0, 1,
-2.069441, 0.3581361, -1.308889, 1, 0.09411765, 0, 1,
-2.054317, -0.6442197, -2.977585, 1, 0.1019608, 0, 1,
-2.041322, -1.682444, -0.953636, 1, 0.1098039, 0, 1,
-2.034829, -1.633025, -1.226468, 1, 0.1137255, 0, 1,
-2.02888, -0.2838426, -2.797071, 1, 0.1215686, 0, 1,
-2.003648, 1.461374, -0.8273937, 1, 0.1254902, 0, 1,
-1.996671, -0.08298266, -0.2821061, 1, 0.1333333, 0, 1,
-1.989757, 0.6095001, -0.2636611, 1, 0.1372549, 0, 1,
-1.972238, 0.4547029, -2.745977, 1, 0.145098, 0, 1,
-1.932535, 0.7264656, -2.561184, 1, 0.1490196, 0, 1,
-1.920134, 0.9012961, 1.511518, 1, 0.1568628, 0, 1,
-1.87579, 0.3418542, -2.469078, 1, 0.1607843, 0, 1,
-1.848835, 0.8536319, 0.1537026, 1, 0.1686275, 0, 1,
-1.842273, -0.4303778, -2.664074, 1, 0.172549, 0, 1,
-1.803766, -0.3353459, -1.597134, 1, 0.1803922, 0, 1,
-1.774926, 1.503409, -1.343684, 1, 0.1843137, 0, 1,
-1.763284, -1.232666, -0.9589273, 1, 0.1921569, 0, 1,
-1.756813, -1.008267, -2.109368, 1, 0.1960784, 0, 1,
-1.755932, -0.6476958, -1.925331, 1, 0.2039216, 0, 1,
-1.738156, -0.9618332, -1.81234, 1, 0.2117647, 0, 1,
-1.738071, -0.9919142, -2.247797, 1, 0.2156863, 0, 1,
-1.737129, 1.370353, 0.2443181, 1, 0.2235294, 0, 1,
-1.736272, 0.4758768, -0.3830427, 1, 0.227451, 0, 1,
-1.72359, 1.26507, 0.4272718, 1, 0.2352941, 0, 1,
-1.722247, -0.5237173, -0.7493917, 1, 0.2392157, 0, 1,
-1.720346, 0.3151086, -0.4648179, 1, 0.2470588, 0, 1,
-1.670191, 0.5528131, 0.9135098, 1, 0.2509804, 0, 1,
-1.639032, 0.105392, -1.663129, 1, 0.2588235, 0, 1,
-1.637726, 0.5326076, -2.963446, 1, 0.2627451, 0, 1,
-1.621448, -0.03751916, 0.09921675, 1, 0.2705882, 0, 1,
-1.61806, -1.013917, -2.571546, 1, 0.2745098, 0, 1,
-1.617645, -0.880515, -1.865136, 1, 0.282353, 0, 1,
-1.592318, 0.6761927, -2.363343, 1, 0.2862745, 0, 1,
-1.591701, 0.5871485, -0.4278133, 1, 0.2941177, 0, 1,
-1.591232, -0.679265, -1.470918, 1, 0.3019608, 0, 1,
-1.588031, -0.78411, -3.516899, 1, 0.3058824, 0, 1,
-1.584322, 0.3520634, -1.631541, 1, 0.3137255, 0, 1,
-1.580285, 0.8041754, -1.467829, 1, 0.3176471, 0, 1,
-1.576171, -0.2885409, -2.109794, 1, 0.3254902, 0, 1,
-1.559349, 2.354217, -1.795986, 1, 0.3294118, 0, 1,
-1.554729, -1.699015, -3.175759, 1, 0.3372549, 0, 1,
-1.546807, -0.3012144, -3.008139, 1, 0.3411765, 0, 1,
-1.546044, -0.1514904, -1.521331, 1, 0.3490196, 0, 1,
-1.539613, -0.754855, -0.3209724, 1, 0.3529412, 0, 1,
-1.538162, -0.05101109, -2.828215, 1, 0.3607843, 0, 1,
-1.524826, -0.4462677, -1.317946, 1, 0.3647059, 0, 1,
-1.508631, -1.46683, -0.8650741, 1, 0.372549, 0, 1,
-1.503706, 1.33246, -1.859954, 1, 0.3764706, 0, 1,
-1.477766, -0.115003, -1.655507, 1, 0.3843137, 0, 1,
-1.457442, 0.7635173, -3.395867, 1, 0.3882353, 0, 1,
-1.449901, 0.4584788, -1.51987, 1, 0.3960784, 0, 1,
-1.444025, -0.2691719, -0.3986471, 1, 0.4039216, 0, 1,
-1.413215, -2.359367, -2.229522, 1, 0.4078431, 0, 1,
-1.41295, -1.573302, -2.775149, 1, 0.4156863, 0, 1,
-1.409552, 1.472733, -0.9101601, 1, 0.4196078, 0, 1,
-1.408907, -1.68841, -2.017705, 1, 0.427451, 0, 1,
-1.400125, -0.6469617, -1.196988, 1, 0.4313726, 0, 1,
-1.385946, -0.5662952, -1.125937, 1, 0.4392157, 0, 1,
-1.373109, 0.3543471, -0.3600134, 1, 0.4431373, 0, 1,
-1.371471, -0.805557, -2.713852, 1, 0.4509804, 0, 1,
-1.369762, -0.02254252, -0.8595623, 1, 0.454902, 0, 1,
-1.364248, -1.209135, -2.873577, 1, 0.4627451, 0, 1,
-1.363826, -0.949599, -2.794569, 1, 0.4666667, 0, 1,
-1.363392, -1.319825, -2.812199, 1, 0.4745098, 0, 1,
-1.361581, 1.090906, -0.2382275, 1, 0.4784314, 0, 1,
-1.35679, -0.2524411, -4.101076, 1, 0.4862745, 0, 1,
-1.355422, -0.2741559, -1.415735, 1, 0.4901961, 0, 1,
-1.354554, -0.7247882, -0.1209988, 1, 0.4980392, 0, 1,
-1.344752, -0.366413, -0.6728395, 1, 0.5058824, 0, 1,
-1.3437, -0.2718284, -1.447909, 1, 0.509804, 0, 1,
-1.339217, -0.5744155, -1.002932, 1, 0.5176471, 0, 1,
-1.33424, -0.3336475, -3.723612, 1, 0.5215687, 0, 1,
-1.334131, -1.069922, -0.3789405, 1, 0.5294118, 0, 1,
-1.333088, 1.356892, 0.07339178, 1, 0.5333334, 0, 1,
-1.324518, -0.005292082, -1.92749, 1, 0.5411765, 0, 1,
-1.318348, 1.979975, -0.6992146, 1, 0.5450981, 0, 1,
-1.316355, -1.192724, -3.415871, 1, 0.5529412, 0, 1,
-1.303248, -0.2805333, -3.209844, 1, 0.5568628, 0, 1,
-1.301522, 0.4431015, -1.083068, 1, 0.5647059, 0, 1,
-1.300539, -0.5911703, -3.402076, 1, 0.5686275, 0, 1,
-1.298673, -0.1354494, -1.974422, 1, 0.5764706, 0, 1,
-1.288141, 0.04305929, -1.291757, 1, 0.5803922, 0, 1,
-1.274275, -1.195503, -3.114407, 1, 0.5882353, 0, 1,
-1.264046, 0.5985987, -1.19299, 1, 0.5921569, 0, 1,
-1.261564, -0.9938034, -2.411158, 1, 0.6, 0, 1,
-1.253981, -0.1040942, -1.643734, 1, 0.6078432, 0, 1,
-1.252108, -0.2576469, -1.212255, 1, 0.6117647, 0, 1,
-1.23798, -0.2302628, -0.09841931, 1, 0.6196079, 0, 1,
-1.227734, 0.05860003, 0.0063043, 1, 0.6235294, 0, 1,
-1.218427, -1.105324, -0.9527751, 1, 0.6313726, 0, 1,
-1.214646, -1.061314, -2.593288, 1, 0.6352941, 0, 1,
-1.206345, 0.5717216, -1.713494, 1, 0.6431373, 0, 1,
-1.20625, 0.01633048, -0.07815478, 1, 0.6470588, 0, 1,
-1.1935, 0.5265471, -2.49072, 1, 0.654902, 0, 1,
-1.192548, -0.6051657, -2.128933, 1, 0.6588235, 0, 1,
-1.18126, 0.141141, -1.955716, 1, 0.6666667, 0, 1,
-1.170926, -2.891953, -1.883024, 1, 0.6705883, 0, 1,
-1.160908, 0.1564392, -2.887199, 1, 0.6784314, 0, 1,
-1.157399, 0.01116844, -0.7482942, 1, 0.682353, 0, 1,
-1.157333, 0.7117215, -0.5216379, 1, 0.6901961, 0, 1,
-1.141037, 0.7700833, -1.06913, 1, 0.6941177, 0, 1,
-1.13953, 1.461418, -1.122532, 1, 0.7019608, 0, 1,
-1.139299, -1.354072, -1.72113, 1, 0.7098039, 0, 1,
-1.136765, 0.170339, -0.490345, 1, 0.7137255, 0, 1,
-1.134434, 0.6641015, -1.585358, 1, 0.7215686, 0, 1,
-1.128114, 0.04604569, 0.5179988, 1, 0.7254902, 0, 1,
-1.125278, 0.7005879, -0.059557, 1, 0.7333333, 0, 1,
-1.120659, 0.4314179, -0.7486222, 1, 0.7372549, 0, 1,
-1.120352, 1.015182, 1.207348, 1, 0.7450981, 0, 1,
-1.119486, -1.106723, -3.292162, 1, 0.7490196, 0, 1,
-1.112228, -1.104468, -2.572883, 1, 0.7568628, 0, 1,
-1.111697, -2.014963, -3.420203, 1, 0.7607843, 0, 1,
-1.105614, -0.6874364, -1.996544, 1, 0.7686275, 0, 1,
-1.10357, 0.5110492, -0.3399583, 1, 0.772549, 0, 1,
-1.103024, 0.7682073, -1.006279, 1, 0.7803922, 0, 1,
-1.10267, 1.554907, -2.3221, 1, 0.7843137, 0, 1,
-1.097819, 0.2060674, -1.39985, 1, 0.7921569, 0, 1,
-1.096942, -0.8555818, -1.242578, 1, 0.7960784, 0, 1,
-1.096275, -0.3218927, -2.311577, 1, 0.8039216, 0, 1,
-1.093875, 0.1263442, -1.279834, 1, 0.8117647, 0, 1,
-1.088993, -0.3012322, -2.082411, 1, 0.8156863, 0, 1,
-1.07771, -0.9368421, -3.121665, 1, 0.8235294, 0, 1,
-1.072412, -1.052614, -1.345274, 1, 0.827451, 0, 1,
-1.067455, -0.614594, -1.705344, 1, 0.8352941, 0, 1,
-1.064659, -1.377131, -2.297594, 1, 0.8392157, 0, 1,
-1.055831, 0.03283009, -3.477056, 1, 0.8470588, 0, 1,
-1.053322, 0.2711454, -2.301929, 1, 0.8509804, 0, 1,
-1.052886, -0.1516484, -1.000343, 1, 0.8588235, 0, 1,
-1.051568, 2.479627, 0.1150876, 1, 0.8627451, 0, 1,
-1.047948, -2.185816, -1.934331, 1, 0.8705882, 0, 1,
-1.04779, -1.294792, -2.516787, 1, 0.8745098, 0, 1,
-1.042454, -0.8058383, -3.92293, 1, 0.8823529, 0, 1,
-1.041276, 0.8792263, -1.96689, 1, 0.8862745, 0, 1,
-1.018988, -1.070289, -2.024324, 1, 0.8941177, 0, 1,
-1.015503, -0.5594338, -1.649677, 1, 0.8980392, 0, 1,
-1.014498, -0.01328338, -1.711192, 1, 0.9058824, 0, 1,
-0.9916321, -0.7881343, -3.856903, 1, 0.9137255, 0, 1,
-0.9914569, -0.06224668, -1.878803, 1, 0.9176471, 0, 1,
-0.9882882, 0.2164647, -0.1104477, 1, 0.9254902, 0, 1,
-0.9732895, -0.6627538, -3.002797, 1, 0.9294118, 0, 1,
-0.9722264, -0.4768861, -2.877115, 1, 0.9372549, 0, 1,
-0.9710795, 0.3607709, -1.277084, 1, 0.9411765, 0, 1,
-0.9679121, -0.9631642, -1.304322, 1, 0.9490196, 0, 1,
-0.9627085, -0.5635439, -2.829933, 1, 0.9529412, 0, 1,
-0.9622356, 0.2984485, -3.178805, 1, 0.9607843, 0, 1,
-0.9619197, -1.107732, -3.741574, 1, 0.9647059, 0, 1,
-0.9530894, 0.7457405, -1.173209, 1, 0.972549, 0, 1,
-0.9520087, -0.00542207, -2.425355, 1, 0.9764706, 0, 1,
-0.9496767, -0.1123691, -2.886117, 1, 0.9843137, 0, 1,
-0.9468999, 0.3822098, -2.103568, 1, 0.9882353, 0, 1,
-0.9357151, 0.1498091, -0.0580738, 1, 0.9960784, 0, 1,
-0.9336497, -0.6105808, -1.762701, 0.9960784, 1, 0, 1,
-0.932988, -0.104887, -2.658483, 0.9921569, 1, 0, 1,
-0.9266754, 1.971643, -1.594294, 0.9843137, 1, 0, 1,
-0.9230022, 0.6799643, -0.5409685, 0.9803922, 1, 0, 1,
-0.9212093, -0.149758, -0.5901053, 0.972549, 1, 0, 1,
-0.9099437, 1.079275, -0.5843008, 0.9686275, 1, 0, 1,
-0.9076359, -0.1410828, -2.094569, 0.9607843, 1, 0, 1,
-0.9036134, 1.508622, -0.9758723, 0.9568627, 1, 0, 1,
-0.9035257, 0.9441156, -0.1185879, 0.9490196, 1, 0, 1,
-0.9011746, -0.5935428, -2.417352, 0.945098, 1, 0, 1,
-0.90015, -0.7342091, -1.365017, 0.9372549, 1, 0, 1,
-0.8993081, 0.7855653, -1.371208, 0.9333333, 1, 0, 1,
-0.8936224, -0.634467, -2.176675, 0.9254902, 1, 0, 1,
-0.8889927, -1.128801, -2.282288, 0.9215686, 1, 0, 1,
-0.8885006, -1.52437, -3.981515, 0.9137255, 1, 0, 1,
-0.8880746, -0.9695185, -2.39843, 0.9098039, 1, 0, 1,
-0.8819713, 0.214876, -2.2066, 0.9019608, 1, 0, 1,
-0.8817995, 0.7130156, -1.837403, 0.8941177, 1, 0, 1,
-0.8817617, -0.6354269, -0.4587399, 0.8901961, 1, 0, 1,
-0.8808101, 0.7137933, -0.5424674, 0.8823529, 1, 0, 1,
-0.8754158, 0.8870233, -0.5466569, 0.8784314, 1, 0, 1,
-0.8747003, -2.068897, -3.567113, 0.8705882, 1, 0, 1,
-0.8730291, -1.656265, -3.906127, 0.8666667, 1, 0, 1,
-0.868667, -0.7308842, -4.310202, 0.8588235, 1, 0, 1,
-0.864819, -0.2474407, -3.258829, 0.854902, 1, 0, 1,
-0.8625853, 0.8342924, -1.89373, 0.8470588, 1, 0, 1,
-0.8525001, -1.167067, -2.29889, 0.8431373, 1, 0, 1,
-0.8441388, -0.0753829, -3.413596, 0.8352941, 1, 0, 1,
-0.8415993, -1.226052, -2.145951, 0.8313726, 1, 0, 1,
-0.8394079, -0.003270123, -1.281497, 0.8235294, 1, 0, 1,
-0.8384719, -1.443733, -1.812102, 0.8196079, 1, 0, 1,
-0.8302734, -1.808437, -0.6769662, 0.8117647, 1, 0, 1,
-0.8270963, 1.027183, -0.3403814, 0.8078431, 1, 0, 1,
-0.8247809, 0.1805934, -1.767105, 0.8, 1, 0, 1,
-0.8187506, 0.3026024, -2.084306, 0.7921569, 1, 0, 1,
-0.8176091, 0.4778065, -0.5526872, 0.7882353, 1, 0, 1,
-0.8127236, 1.046942, 0.8358406, 0.7803922, 1, 0, 1,
-0.8126524, 0.7910166, 0.6581608, 0.7764706, 1, 0, 1,
-0.8071612, 1.554164, -1.046032, 0.7686275, 1, 0, 1,
-0.8041337, 0.7154605, -0.3053039, 0.7647059, 1, 0, 1,
-0.8036529, -0.1842606, 0.2279512, 0.7568628, 1, 0, 1,
-0.7979505, 0.5121951, 0.1698578, 0.7529412, 1, 0, 1,
-0.7970508, -2.546721, -3.228863, 0.7450981, 1, 0, 1,
-0.7951283, 0.9908803, -1.997708, 0.7411765, 1, 0, 1,
-0.7940794, -0.8497134, -3.379466, 0.7333333, 1, 0, 1,
-0.7928593, -1.521657, -2.556921, 0.7294118, 1, 0, 1,
-0.790862, -0.806768, -2.822987, 0.7215686, 1, 0, 1,
-0.7899652, -0.2170768, -0.8782339, 0.7176471, 1, 0, 1,
-0.7896378, 0.2694893, -1.480207, 0.7098039, 1, 0, 1,
-0.7878606, 1.119081, -1.451687, 0.7058824, 1, 0, 1,
-0.7820258, -0.3917499, -1.351483, 0.6980392, 1, 0, 1,
-0.7815903, -0.9416023, -2.330255, 0.6901961, 1, 0, 1,
-0.773747, 0.1880288, -1.430606, 0.6862745, 1, 0, 1,
-0.7679495, -0.1301381, -0.6942123, 0.6784314, 1, 0, 1,
-0.7671196, 0.2426792, -3.035003, 0.6745098, 1, 0, 1,
-0.7655776, -1.049952, -1.800607, 0.6666667, 1, 0, 1,
-0.7613079, 0.3951536, -2.069211, 0.6627451, 1, 0, 1,
-0.756375, 0.3931181, 0.3792676, 0.654902, 1, 0, 1,
-0.7559974, -0.3646798, -1.924556, 0.6509804, 1, 0, 1,
-0.7480786, 0.6716146, -2.455447, 0.6431373, 1, 0, 1,
-0.7442039, 0.9703594, -2.318341, 0.6392157, 1, 0, 1,
-0.7430869, -0.391297, -1.762657, 0.6313726, 1, 0, 1,
-0.7414243, -0.1192868, -3.317476, 0.627451, 1, 0, 1,
-0.7404252, 1.110798, -0.1223612, 0.6196079, 1, 0, 1,
-0.732805, 1.582884, -0.5844201, 0.6156863, 1, 0, 1,
-0.7243457, -1.923277, -3.994957, 0.6078432, 1, 0, 1,
-0.7207063, -1.162941, -2.127571, 0.6039216, 1, 0, 1,
-0.7199513, 0.6394309, -1.695385, 0.5960785, 1, 0, 1,
-0.718565, 1.106258, -1.445303, 0.5882353, 1, 0, 1,
-0.7170979, -0.3148849, -3.025579, 0.5843138, 1, 0, 1,
-0.7154172, -0.5658658, -1.885662, 0.5764706, 1, 0, 1,
-0.7033545, 1.303721, 1.666537, 0.572549, 1, 0, 1,
-0.6977497, -1.632658, -2.495312, 0.5647059, 1, 0, 1,
-0.6958978, -0.1696375, -1.056821, 0.5607843, 1, 0, 1,
-0.6918849, 1.272432, 1.014684, 0.5529412, 1, 0, 1,
-0.6879564, 2.062234, -0.9815363, 0.5490196, 1, 0, 1,
-0.6861205, 0.6828933, -0.8407547, 0.5411765, 1, 0, 1,
-0.6815687, 0.3306121, 1.088787, 0.5372549, 1, 0, 1,
-0.6813875, 0.1659312, -2.355936, 0.5294118, 1, 0, 1,
-0.6794937, 1.250447, 0.3030786, 0.5254902, 1, 0, 1,
-0.676003, 2.111361, -0.9059547, 0.5176471, 1, 0, 1,
-0.6706164, -2.069994, -0.8995371, 0.5137255, 1, 0, 1,
-0.669458, -0.5365548, -0.2105765, 0.5058824, 1, 0, 1,
-0.668692, -0.289394, -0.3285547, 0.5019608, 1, 0, 1,
-0.6627847, -0.812286, -3.153817, 0.4941176, 1, 0, 1,
-0.6579915, 1.431667, -2.246516, 0.4862745, 1, 0, 1,
-0.6575906, -0.2268104, -3.101246, 0.4823529, 1, 0, 1,
-0.6573738, 1.209319, -1.289908, 0.4745098, 1, 0, 1,
-0.6560236, -0.1487049, -0.6065646, 0.4705882, 1, 0, 1,
-0.6544445, 1.726135, 1.166103, 0.4627451, 1, 0, 1,
-0.6518179, 0.447463, -1.369094, 0.4588235, 1, 0, 1,
-0.6515605, 0.4987656, 0.07306099, 0.4509804, 1, 0, 1,
-0.6514806, 1.376522, -0.5753082, 0.4470588, 1, 0, 1,
-0.6467136, 1.205446, 0.6699463, 0.4392157, 1, 0, 1,
-0.643266, 0.712488, -0.3497121, 0.4352941, 1, 0, 1,
-0.6432647, -0.1235944, -2.799515, 0.427451, 1, 0, 1,
-0.6406112, -1.351673, -2.778732, 0.4235294, 1, 0, 1,
-0.6349391, -1.121134, -2.882416, 0.4156863, 1, 0, 1,
-0.6249273, 1.281492, -0.6094479, 0.4117647, 1, 0, 1,
-0.6213067, 0.6499673, -1.915445, 0.4039216, 1, 0, 1,
-0.6208336, 0.1828538, -2.117214, 0.3960784, 1, 0, 1,
-0.6149321, 1.341872, 0.3598471, 0.3921569, 1, 0, 1,
-0.6078665, -1.593171, -4.90951, 0.3843137, 1, 0, 1,
-0.6065453, -0.9777973, -3.949759, 0.3803922, 1, 0, 1,
-0.6038477, 1.674886, 0.3792545, 0.372549, 1, 0, 1,
-0.6030727, -0.4395082, -3.615055, 0.3686275, 1, 0, 1,
-0.6024982, -1.460906, -2.127502, 0.3607843, 1, 0, 1,
-0.5998688, 0.5969931, -0.5706199, 0.3568628, 1, 0, 1,
-0.5889722, 0.3843844, -2.090225, 0.3490196, 1, 0, 1,
-0.5863264, 1.034865, -0.7482631, 0.345098, 1, 0, 1,
-0.5840642, -0.3645123, -2.183692, 0.3372549, 1, 0, 1,
-0.5834045, 0.7840058, -0.95807, 0.3333333, 1, 0, 1,
-0.5827223, 0.4533445, -1.701787, 0.3254902, 1, 0, 1,
-0.5824487, -1.483825, -2.572083, 0.3215686, 1, 0, 1,
-0.5781616, -1.542949, -2.846685, 0.3137255, 1, 0, 1,
-0.5752674, 0.6223452, -0.3414069, 0.3098039, 1, 0, 1,
-0.5711157, 0.05628093, -1.397569, 0.3019608, 1, 0, 1,
-0.5658446, -2.001506, -4.513995, 0.2941177, 1, 0, 1,
-0.5627362, 0.1389171, -1.44744, 0.2901961, 1, 0, 1,
-0.5620938, 1.752104, -0.2247687, 0.282353, 1, 0, 1,
-0.5610827, -2.149309, -2.655864, 0.2784314, 1, 0, 1,
-0.5594369, 2.22865, 0.9969399, 0.2705882, 1, 0, 1,
-0.5542549, -1.315942, -3.083776, 0.2666667, 1, 0, 1,
-0.5427215, 1.595137, -0.9344638, 0.2588235, 1, 0, 1,
-0.5365212, -0.7792585, -4.612855, 0.254902, 1, 0, 1,
-0.5312588, -0.1192208, -0.8329194, 0.2470588, 1, 0, 1,
-0.5290476, -1.996395, -0.7389573, 0.2431373, 1, 0, 1,
-0.5273004, -0.7622457, -2.053406, 0.2352941, 1, 0, 1,
-0.5249134, -0.6798052, -0.3323166, 0.2313726, 1, 0, 1,
-0.5248218, 1.63586, -0.548103, 0.2235294, 1, 0, 1,
-0.5204873, -1.98511, -2.756268, 0.2196078, 1, 0, 1,
-0.5162112, -0.4031909, -3.373718, 0.2117647, 1, 0, 1,
-0.5137714, -0.02384374, -0.6458488, 0.2078431, 1, 0, 1,
-0.5093905, 1.055657, -1.970481, 0.2, 1, 0, 1,
-0.5058988, 1.148883, -0.1785684, 0.1921569, 1, 0, 1,
-0.5033824, 0.7542914, -0.2183299, 0.1882353, 1, 0, 1,
-0.4990281, 1.668867, -1.084368, 0.1803922, 1, 0, 1,
-0.4916276, -0.9682701, -1.954728, 0.1764706, 1, 0, 1,
-0.4844763, 0.1463893, -2.582556, 0.1686275, 1, 0, 1,
-0.4843723, -1.117914, -3.215427, 0.1647059, 1, 0, 1,
-0.4762987, -0.1537774, -2.33977, 0.1568628, 1, 0, 1,
-0.4731491, -0.5088333, -2.975605, 0.1529412, 1, 0, 1,
-0.4660813, -0.126621, -1.869964, 0.145098, 1, 0, 1,
-0.4645353, 0.2573004, -1.886876, 0.1411765, 1, 0, 1,
-0.4616036, 0.3534447, -1.384801, 0.1333333, 1, 0, 1,
-0.458818, -0.9758735, -1.723187, 0.1294118, 1, 0, 1,
-0.4585846, 1.410535, -0.2739581, 0.1215686, 1, 0, 1,
-0.4584235, 0.06142159, -0.5049666, 0.1176471, 1, 0, 1,
-0.4562784, 1.659413, -1.754611, 0.1098039, 1, 0, 1,
-0.4562074, 0.1932352, -0.6157311, 0.1058824, 1, 0, 1,
-0.455898, -0.5475785, -2.489134, 0.09803922, 1, 0, 1,
-0.453366, -0.976953, -2.551543, 0.09019608, 1, 0, 1,
-0.4527874, 0.09979196, -0.2370312, 0.08627451, 1, 0, 1,
-0.4505304, 1.22639, -1.333663, 0.07843138, 1, 0, 1,
-0.4481849, 2.086216, 0.1093406, 0.07450981, 1, 0, 1,
-0.4436557, -0.5926265, -3.009368, 0.06666667, 1, 0, 1,
-0.4411953, 0.6958725, 0.07545558, 0.0627451, 1, 0, 1,
-0.4390821, 2.076349, -1.426322, 0.05490196, 1, 0, 1,
-0.4350216, 0.4997039, -1.350031, 0.05098039, 1, 0, 1,
-0.4337001, 1.242929, 0.4693673, 0.04313726, 1, 0, 1,
-0.4313937, 2.03597, -0.05916051, 0.03921569, 1, 0, 1,
-0.4312674, 2.156034, -0.147311, 0.03137255, 1, 0, 1,
-0.4285242, 0.6370832, -1.000957, 0.02745098, 1, 0, 1,
-0.4275179, -0.1779389, -2.989932, 0.01960784, 1, 0, 1,
-0.4274366, -0.4709356, -2.297566, 0.01568628, 1, 0, 1,
-0.427037, -0.1004543, -2.228831, 0.007843138, 1, 0, 1,
-0.4264604, 0.2393454, -0.1121674, 0.003921569, 1, 0, 1,
-0.4151886, -0.4703573, -2.86331, 0, 1, 0.003921569, 1,
-0.4121098, 1.289119, -0.5801609, 0, 1, 0.01176471, 1,
-0.411913, -0.5428244, -0.9245333, 0, 1, 0.01568628, 1,
-0.4088342, -0.5875034, -4.258589, 0, 1, 0.02352941, 1,
-0.4047898, 0.0009355288, -1.798442, 0, 1, 0.02745098, 1,
-0.4036066, 0.8863991, 0.3936613, 0, 1, 0.03529412, 1,
-0.4016104, -1.884103, -3.370988, 0, 1, 0.03921569, 1,
-0.3992448, 0.7631551, -1.019784, 0, 1, 0.04705882, 1,
-0.3938571, 0.6016, -1.850495, 0, 1, 0.05098039, 1,
-0.3875884, 0.08345756, -1.222281, 0, 1, 0.05882353, 1,
-0.3806095, 0.4466491, 0.1898738, 0, 1, 0.0627451, 1,
-0.3779585, -0.0940706, -2.254174, 0, 1, 0.07058824, 1,
-0.3764322, -2.046799, -2.084981, 0, 1, 0.07450981, 1,
-0.3729159, -0.7850023, -2.165744, 0, 1, 0.08235294, 1,
-0.3705461, -0.9288719, -2.367833, 0, 1, 0.08627451, 1,
-0.3703773, 0.06934142, -0.4748431, 0, 1, 0.09411765, 1,
-0.3698198, -0.4506164, -2.752481, 0, 1, 0.1019608, 1,
-0.3692319, -0.9270034, -3.205529, 0, 1, 0.1058824, 1,
-0.3628435, -0.07069458, -1.301554, 0, 1, 0.1137255, 1,
-0.3622471, -0.8508468, -2.809294, 0, 1, 0.1176471, 1,
-0.3610007, -0.68251, -2.767959, 0, 1, 0.1254902, 1,
-0.3547333, 0.7081605, -1.060916, 0, 1, 0.1294118, 1,
-0.354696, 0.03660564, -1.183737, 0, 1, 0.1372549, 1,
-0.35292, -1.611849, -2.979704, 0, 1, 0.1411765, 1,
-0.3503326, -0.8022082, -3.552342, 0, 1, 0.1490196, 1,
-0.3451243, 1.207487, -0.2864268, 0, 1, 0.1529412, 1,
-0.3414076, 0.4618836, -1.19575, 0, 1, 0.1607843, 1,
-0.3389094, -1.404183, -1.622794, 0, 1, 0.1647059, 1,
-0.3379866, 0.1743101, -1.767043, 0, 1, 0.172549, 1,
-0.3373697, 0.2163614, -0.5962504, 0, 1, 0.1764706, 1,
-0.3324078, 1.170532, 1.052372, 0, 1, 0.1843137, 1,
-0.3316416, -0.4080039, -2.099304, 0, 1, 0.1882353, 1,
-0.3266126, 0.5536364, -0.1704404, 0, 1, 0.1960784, 1,
-0.3209168, 0.9050791, 1.069634, 0, 1, 0.2039216, 1,
-0.3164501, -0.5119054, -2.416325, 0, 1, 0.2078431, 1,
-0.3158055, -1.026222, -2.342609, 0, 1, 0.2156863, 1,
-0.3127795, -0.3424483, -1.972677, 0, 1, 0.2196078, 1,
-0.3120142, 0.7954009, -1.680971, 0, 1, 0.227451, 1,
-0.3098386, -0.1160557, -3.555165, 0, 1, 0.2313726, 1,
-0.307579, -1.652534, -3.905161, 0, 1, 0.2392157, 1,
-0.3046149, 0.9737341, 0.01699941, 0, 1, 0.2431373, 1,
-0.303358, 0.9862479, -1.03909, 0, 1, 0.2509804, 1,
-0.3018436, -1.347315, -2.559903, 0, 1, 0.254902, 1,
-0.2965922, -1.34961, -3.401345, 0, 1, 0.2627451, 1,
-0.2948856, -0.8200772, -1.759675, 0, 1, 0.2666667, 1,
-0.2916166, -0.01256249, -1.219865, 0, 1, 0.2745098, 1,
-0.2912254, -0.3104726, -0.914937, 0, 1, 0.2784314, 1,
-0.2906, -1.540285, -3.130674, 0, 1, 0.2862745, 1,
-0.2894671, 0.9312363, -1.339939, 0, 1, 0.2901961, 1,
-0.2851804, -0.6389441, -3.694192, 0, 1, 0.2980392, 1,
-0.2806833, 1.724474, -1.44121, 0, 1, 0.3058824, 1,
-0.2768465, 0.6843039, -2.10252, 0, 1, 0.3098039, 1,
-0.2764134, 1.097705, 0.5713162, 0, 1, 0.3176471, 1,
-0.2748315, 1.112811, -0.9126632, 0, 1, 0.3215686, 1,
-0.2723736, 1.348923, -1.459323, 0, 1, 0.3294118, 1,
-0.2681641, -0.5451922, -1.458147, 0, 1, 0.3333333, 1,
-0.2672486, 1.327891, -0.880428, 0, 1, 0.3411765, 1,
-0.2659003, -0.469148, -3.227443, 0, 1, 0.345098, 1,
-0.265338, 1.984743, 0.6651846, 0, 1, 0.3529412, 1,
-0.2575015, -0.3478229, -1.654017, 0, 1, 0.3568628, 1,
-0.2554969, -0.2101711, -2.347101, 0, 1, 0.3647059, 1,
-0.2549042, -0.1913689, -2.251181, 0, 1, 0.3686275, 1,
-0.2519422, -0.1090596, -1.625027, 0, 1, 0.3764706, 1,
-0.2513237, -0.8691992, -1.478391, 0, 1, 0.3803922, 1,
-0.2502609, -1.295953, -2.416096, 0, 1, 0.3882353, 1,
-0.2497244, 1.795591, -0.5972659, 0, 1, 0.3921569, 1,
-0.2482329, -1.642354, -5.074365, 0, 1, 0.4, 1,
-0.2473159, 0.2651782, 0.4084791, 0, 1, 0.4078431, 1,
-0.2451908, 0.7568277, -2.386611, 0, 1, 0.4117647, 1,
-0.2442147, -0.8766263, -1.986885, 0, 1, 0.4196078, 1,
-0.2439924, -0.6104186, -3.408126, 0, 1, 0.4235294, 1,
-0.2431586, -1.528445, -2.868211, 0, 1, 0.4313726, 1,
-0.2350895, 0.2955943, 0.92476, 0, 1, 0.4352941, 1,
-0.2316345, -1.036232, -2.794766, 0, 1, 0.4431373, 1,
-0.2312221, 1.538969, -0.4321434, 0, 1, 0.4470588, 1,
-0.2310518, -0.7704363, -2.908994, 0, 1, 0.454902, 1,
-0.2299581, -0.7648938, -2.205054, 0, 1, 0.4588235, 1,
-0.2285086, 0.001785105, -2.324007, 0, 1, 0.4666667, 1,
-0.2277667, 1.180848, -0.05116718, 0, 1, 0.4705882, 1,
-0.2235289, -2.080886, -2.011894, 0, 1, 0.4784314, 1,
-0.2192425, -0.5092576, -4.502453, 0, 1, 0.4823529, 1,
-0.2159401, 0.02090707, -1.362841, 0, 1, 0.4901961, 1,
-0.2156562, -0.07447062, -2.066107, 0, 1, 0.4941176, 1,
-0.2152305, 2.296228, 2.060211, 0, 1, 0.5019608, 1,
-0.21467, 1.2334, -0.2051356, 0, 1, 0.509804, 1,
-0.2095808, 1.022683, -0.9815661, 0, 1, 0.5137255, 1,
-0.2085639, -0.658883, -2.286059, 0, 1, 0.5215687, 1,
-0.2012096, 0.07228458, -0.8731112, 0, 1, 0.5254902, 1,
-0.1961016, -0.2424018, -3.520677, 0, 1, 0.5333334, 1,
-0.1955629, -0.5063519, -2.975023, 0, 1, 0.5372549, 1,
-0.1910536, -1.776384, -2.522453, 0, 1, 0.5450981, 1,
-0.182603, -0.7271578, -2.746662, 0, 1, 0.5490196, 1,
-0.1821602, -0.3418447, -4.016172, 0, 1, 0.5568628, 1,
-0.1815547, -1.134459, -2.533874, 0, 1, 0.5607843, 1,
-0.1811148, 0.2623035, -1.244119, 0, 1, 0.5686275, 1,
-0.1805107, 0.240699, 1.795282, 0, 1, 0.572549, 1,
-0.1802484, 0.8326733, 3.040047, 0, 1, 0.5803922, 1,
-0.1787052, -0.7235876, -3.065542, 0, 1, 0.5843138, 1,
-0.1749563, 0.05188427, -0.3999934, 0, 1, 0.5921569, 1,
-0.1748446, -0.9887578, -2.95617, 0, 1, 0.5960785, 1,
-0.1746571, 0.3935769, -0.05743079, 0, 1, 0.6039216, 1,
-0.172417, -0.1931697, -4.239722, 0, 1, 0.6117647, 1,
-0.1705982, 1.01133, -2.427445, 0, 1, 0.6156863, 1,
-0.1698083, 0.6147396, -0.8645563, 0, 1, 0.6235294, 1,
-0.1680009, -0.8179737, -3.541202, 0, 1, 0.627451, 1,
-0.1639396, 1.31058, -0.6432578, 0, 1, 0.6352941, 1,
-0.1628452, -0.2964295, -2.937897, 0, 1, 0.6392157, 1,
-0.1626694, -0.1214369, -1.319521, 0, 1, 0.6470588, 1,
-0.1466982, 1.897903, -1.228315, 0, 1, 0.6509804, 1,
-0.1448888, 0.91598, -1.72386, 0, 1, 0.6588235, 1,
-0.1400526, 2.105023, -0.3771915, 0, 1, 0.6627451, 1,
-0.1388116, -1.481998, -2.312136, 0, 1, 0.6705883, 1,
-0.1387216, -0.913783, -2.481147, 0, 1, 0.6745098, 1,
-0.1310052, -1.732788, -1.430951, 0, 1, 0.682353, 1,
-0.1302987, -1.718128, -4.782451, 0, 1, 0.6862745, 1,
-0.1279986, -1.007951, -3.125988, 0, 1, 0.6941177, 1,
-0.1278083, -0.7381614, -2.482157, 0, 1, 0.7019608, 1,
-0.125878, 1.047988, -2.057237, 0, 1, 0.7058824, 1,
-0.1239439, 0.8210566, 1.138278, 0, 1, 0.7137255, 1,
-0.1237638, 0.3807563, 0.8315246, 0, 1, 0.7176471, 1,
-0.1234337, 0.1346095, 0.8343841, 0, 1, 0.7254902, 1,
-0.1146265, -0.0288972, -2.086728, 0, 1, 0.7294118, 1,
-0.1109125, -0.2350193, -4.293925, 0, 1, 0.7372549, 1,
-0.1101959, -0.9198902, -2.903199, 0, 1, 0.7411765, 1,
-0.1095503, -0.03934796, -2.700453, 0, 1, 0.7490196, 1,
-0.1074659, 2.244026, 0.586983, 0, 1, 0.7529412, 1,
-0.1056608, 0.2460065, -0.7972826, 0, 1, 0.7607843, 1,
-0.1044124, 1.300305, -0.4671966, 0, 1, 0.7647059, 1,
-0.1031262, 1.356761, 0.3861864, 0, 1, 0.772549, 1,
-0.09992845, -1.844069, -1.988413, 0, 1, 0.7764706, 1,
-0.09575368, 0.3920088, -0.8429509, 0, 1, 0.7843137, 1,
-0.09544351, -0.5495456, -3.71287, 0, 1, 0.7882353, 1,
-0.08821495, -0.1044014, -2.531137, 0, 1, 0.7960784, 1,
-0.08762213, 0.6855083, 0.2546016, 0, 1, 0.8039216, 1,
-0.08247277, 1.184296, -0.1566035, 0, 1, 0.8078431, 1,
-0.07206753, 0.5962821, 1.141523, 0, 1, 0.8156863, 1,
-0.06968205, -0.3292385, -3.032004, 0, 1, 0.8196079, 1,
-0.05023839, -0.5525924, -3.348955, 0, 1, 0.827451, 1,
-0.0493369, -0.5524693, -2.74763, 0, 1, 0.8313726, 1,
-0.03444772, -1.346572, -3.192291, 0, 1, 0.8392157, 1,
-0.03289296, 0.3661894, -0.7415587, 0, 1, 0.8431373, 1,
-0.02865327, 1.014049, 2.402978, 0, 1, 0.8509804, 1,
-0.02718799, 0.7679271, 0.4810371, 0, 1, 0.854902, 1,
-0.02647991, -0.415099, -2.076436, 0, 1, 0.8627451, 1,
-0.02281511, 0.2109303, -0.6552079, 0, 1, 0.8666667, 1,
-0.008134207, -0.6682483, -5.193515, 0, 1, 0.8745098, 1,
-0.006352653, -0.6938426, -1.674805, 0, 1, 0.8784314, 1,
-0.004721272, 0.4931839, -0.3485075, 0, 1, 0.8862745, 1,
-0.003444283, -0.7212852, -3.903818, 0, 1, 0.8901961, 1,
-0.003391977, 0.6836401, 0.2633692, 0, 1, 0.8980392, 1,
-0.00240491, -1.032297, -4.47206, 0, 1, 0.9058824, 1,
-0.001766098, -0.8571504, -1.747531, 0, 1, 0.9098039, 1,
-0.00055357, 1.314169, 1.148604, 0, 1, 0.9176471, 1,
0.0001488072, 0.3685668, 0.5785447, 0, 1, 0.9215686, 1,
0.001551982, 1.130839, 0.3484934, 0, 1, 0.9294118, 1,
0.001581321, 1.0768, -1.659173, 0, 1, 0.9333333, 1,
0.00329202, -0.008582694, 2.836401, 0, 1, 0.9411765, 1,
0.005253688, -1.50819, 2.777973, 0, 1, 0.945098, 1,
0.01030346, 0.4564411, 1.111148, 0, 1, 0.9529412, 1,
0.01522586, 0.9882717, 1.28826, 0, 1, 0.9568627, 1,
0.01647731, -0.8923314, 4.162684, 0, 1, 0.9647059, 1,
0.02730966, 1.426835, 0.9563459, 0, 1, 0.9686275, 1,
0.02878767, -0.684293, 1.787947, 0, 1, 0.9764706, 1,
0.03214528, 0.06337167, 1.464392, 0, 1, 0.9803922, 1,
0.03397256, 1.258435, 0.8149332, 0, 1, 0.9882353, 1,
0.04209816, 0.1641178, 0.5172487, 0, 1, 0.9921569, 1,
0.04330511, 0.01178818, -0.5250812, 0, 1, 1, 1,
0.04430071, 1.175479, -0.789739, 0, 0.9921569, 1, 1,
0.04633745, 2.774702, -0.9560221, 0, 0.9882353, 1, 1,
0.04699524, -0.460876, 4.257947, 0, 0.9803922, 1, 1,
0.04714575, -1.748055, 5.110505, 0, 0.9764706, 1, 1,
0.04750909, 1.712327, -0.427826, 0, 0.9686275, 1, 1,
0.04892093, -0.7494487, 2.073374, 0, 0.9647059, 1, 1,
0.05008686, -0.6510966, 3.339941, 0, 0.9568627, 1, 1,
0.05058107, 0.4414796, -0.5164593, 0, 0.9529412, 1, 1,
0.05192793, 0.2332726, 0.2207602, 0, 0.945098, 1, 1,
0.0546346, -0.5945908, 3.563705, 0, 0.9411765, 1, 1,
0.0551935, 0.6292979, -1.078548, 0, 0.9333333, 1, 1,
0.05648005, 0.4894488, -0.7428359, 0, 0.9294118, 1, 1,
0.05683884, -1.028216, 1.997035, 0, 0.9215686, 1, 1,
0.05876338, 1.656219, -0.925724, 0, 0.9176471, 1, 1,
0.06063489, 2.381899, 1.01755, 0, 0.9098039, 1, 1,
0.0609045, -1.406361, 2.828456, 0, 0.9058824, 1, 1,
0.06292258, -0.1535378, 3.434033, 0, 0.8980392, 1, 1,
0.06500459, -0.9463129, 2.717059, 0, 0.8901961, 1, 1,
0.06662641, 0.5372605, 0.3430617, 0, 0.8862745, 1, 1,
0.06725021, 0.4417441, 2.307203, 0, 0.8784314, 1, 1,
0.07018766, 1.56248, 0.7050952, 0, 0.8745098, 1, 1,
0.07513871, 1.932173, 0.4458531, 0, 0.8666667, 1, 1,
0.07563997, 0.6551704, 0.5692378, 0, 0.8627451, 1, 1,
0.07848021, 0.3974906, -0.3018937, 0, 0.854902, 1, 1,
0.08175665, -0.496694, 2.358068, 0, 0.8509804, 1, 1,
0.08307897, -0.738843, 1.742862, 0, 0.8431373, 1, 1,
0.08378457, 0.9591866, 1.106813, 0, 0.8392157, 1, 1,
0.08513919, 0.5665894, -0.1168107, 0, 0.8313726, 1, 1,
0.08929333, -1.715558, 4.584029, 0, 0.827451, 1, 1,
0.09361333, -1.121627, 2.625761, 0, 0.8196079, 1, 1,
0.09506077, 0.2250564, -1.260918, 0, 0.8156863, 1, 1,
0.09603124, -0.8683938, 4.41887, 0, 0.8078431, 1, 1,
0.09671902, -0.5323248, 2.863774, 0, 0.8039216, 1, 1,
0.098589, 2.889049, -1.415403, 0, 0.7960784, 1, 1,
0.1004607, 1.976708, 0.4174861, 0, 0.7882353, 1, 1,
0.1007824, -1.650512, 3.783992, 0, 0.7843137, 1, 1,
0.1012497, -0.5987861, 0.09410723, 0, 0.7764706, 1, 1,
0.1017005, -0.1126146, 2.045942, 0, 0.772549, 1, 1,
0.1033644, -0.08484258, 1.748306, 0, 0.7647059, 1, 1,
0.1040816, -0.6252251, 3.364722, 0, 0.7607843, 1, 1,
0.1052216, -0.7907456, 1.901401, 0, 0.7529412, 1, 1,
0.1056722, 0.5533562, 0.3542242, 0, 0.7490196, 1, 1,
0.1122796, 1.924486, 0.271502, 0, 0.7411765, 1, 1,
0.1218331, 1.156944, 1.438906, 0, 0.7372549, 1, 1,
0.1223024, -0.1588783, 3.502408, 0, 0.7294118, 1, 1,
0.1233259, -0.7250929, 3.273777, 0, 0.7254902, 1, 1,
0.125118, -0.6722518, 4.655746, 0, 0.7176471, 1, 1,
0.1268172, -0.2512151, 3.735065, 0, 0.7137255, 1, 1,
0.12847, 0.4157555, -0.2859998, 0, 0.7058824, 1, 1,
0.1365151, -2.039465, 3.257525, 0, 0.6980392, 1, 1,
0.1400239, 0.009443842, 0.3629707, 0, 0.6941177, 1, 1,
0.1451494, 0.1798337, 0.3336738, 0, 0.6862745, 1, 1,
0.1538984, -0.7647092, 4.010236, 0, 0.682353, 1, 1,
0.1546941, 0.4741688, 0.9331292, 0, 0.6745098, 1, 1,
0.1583673, 2.044066, -0.07955092, 0, 0.6705883, 1, 1,
0.1611618, -1.00557, 2.304896, 0, 0.6627451, 1, 1,
0.1652545, 0.245483, -0.4687415, 0, 0.6588235, 1, 1,
0.1710633, 0.05281132, 2.128339, 0, 0.6509804, 1, 1,
0.1732171, 0.1906114, 0.8512104, 0, 0.6470588, 1, 1,
0.1732644, 0.3840278, 0.8542461, 0, 0.6392157, 1, 1,
0.1768143, -0.6005501, 3.000902, 0, 0.6352941, 1, 1,
0.1771224, -0.9847708, 2.906787, 0, 0.627451, 1, 1,
0.1789484, -1.035814, 3.709773, 0, 0.6235294, 1, 1,
0.1811457, -0.6209254, 2.91359, 0, 0.6156863, 1, 1,
0.1814567, -0.01067539, 2.522281, 0, 0.6117647, 1, 1,
0.1820493, 0.4961376, -1.295871, 0, 0.6039216, 1, 1,
0.1916923, -0.09644656, 2.242929, 0, 0.5960785, 1, 1,
0.1936445, -1.01125, 2.251792, 0, 0.5921569, 1, 1,
0.1940752, -0.9185907, 1.603554, 0, 0.5843138, 1, 1,
0.199219, 1.528383, 1.192312, 0, 0.5803922, 1, 1,
0.2031066, 1.454133, -0.2730928, 0, 0.572549, 1, 1,
0.2060943, -1.102992, 3.096848, 0, 0.5686275, 1, 1,
0.2078116, 0.0001275776, 0.4194663, 0, 0.5607843, 1, 1,
0.209897, 2.317356, 0.6220657, 0, 0.5568628, 1, 1,
0.2125337, -2.229947, 4.444075, 0, 0.5490196, 1, 1,
0.2128865, 0.1410492, 1.097944, 0, 0.5450981, 1, 1,
0.2173617, 2.296265, -0.6164765, 0, 0.5372549, 1, 1,
0.2234447, 0.06731054, 3.087005, 0, 0.5333334, 1, 1,
0.224263, 1.999321, 0.8396366, 0, 0.5254902, 1, 1,
0.2245744, -0.6222386, 4.034091, 0, 0.5215687, 1, 1,
0.2250639, 1.624583, 0.2017525, 0, 0.5137255, 1, 1,
0.2328353, 0.2003623, -0.9352512, 0, 0.509804, 1, 1,
0.2332233, -1.128359, 2.513424, 0, 0.5019608, 1, 1,
0.2332665, 0.1070119, 0.1818293, 0, 0.4941176, 1, 1,
0.2333596, 0.1216865, 0.08269738, 0, 0.4901961, 1, 1,
0.2336313, -0.2205715, 3.187446, 0, 0.4823529, 1, 1,
0.2344598, -1.220098, 2.011657, 0, 0.4784314, 1, 1,
0.2367031, -0.2876578, 2.400161, 0, 0.4705882, 1, 1,
0.2368452, -0.2895769, 3.59514, 0, 0.4666667, 1, 1,
0.2368685, 1.514658, 0.1314763, 0, 0.4588235, 1, 1,
0.243502, 0.2628198, 1.301732, 0, 0.454902, 1, 1,
0.2551611, -1.86066, 3.036554, 0, 0.4470588, 1, 1,
0.2551704, -0.4781373, 1.568919, 0, 0.4431373, 1, 1,
0.2558848, -1.739754, 2.141965, 0, 0.4352941, 1, 1,
0.2627016, -0.547876, 1.669909, 0, 0.4313726, 1, 1,
0.2646115, 1.139756, -1.029413, 0, 0.4235294, 1, 1,
0.2661369, -2.140499, 3.520753, 0, 0.4196078, 1, 1,
0.2680744, 1.254341, -1.179915, 0, 0.4117647, 1, 1,
0.2701002, -0.1513283, 2.755426, 0, 0.4078431, 1, 1,
0.2752644, -0.0254031, 2.749976, 0, 0.4, 1, 1,
0.2764829, -0.8828078, 2.716965, 0, 0.3921569, 1, 1,
0.2803931, -0.5587929, 3.564516, 0, 0.3882353, 1, 1,
0.2812145, -0.2068645, 0.8844219, 0, 0.3803922, 1, 1,
0.2814739, 1.30196, 1.124734, 0, 0.3764706, 1, 1,
0.2851952, -0.4549473, 2.248072, 0, 0.3686275, 1, 1,
0.287579, 0.8636873, -0.6836277, 0, 0.3647059, 1, 1,
0.2894768, 0.2537637, 1.746238, 0, 0.3568628, 1, 1,
0.293511, -0.3778647, 2.073908, 0, 0.3529412, 1, 1,
0.2971807, 0.8034371, -1.304978, 0, 0.345098, 1, 1,
0.2972847, -0.8586352, 4.593792, 0, 0.3411765, 1, 1,
0.298519, 0.5214007, 0.2695221, 0, 0.3333333, 1, 1,
0.30181, -0.9816346, 2.228927, 0, 0.3294118, 1, 1,
0.3032242, -0.9014178, 1.378937, 0, 0.3215686, 1, 1,
0.304321, 0.6772395, -0.163168, 0, 0.3176471, 1, 1,
0.305157, 0.1263486, 0.13367, 0, 0.3098039, 1, 1,
0.3114815, -0.1349057, -0.1640598, 0, 0.3058824, 1, 1,
0.3157431, -0.4182094, 2.685603, 0, 0.2980392, 1, 1,
0.3188154, -0.8153104, 3.452592, 0, 0.2901961, 1, 1,
0.3201731, 0.4839469, 2.617192, 0, 0.2862745, 1, 1,
0.3269653, -0.4816336, 3.599906, 0, 0.2784314, 1, 1,
0.3278939, -0.6366284, 0.5347641, 0, 0.2745098, 1, 1,
0.329172, -1.508201, 2.667742, 0, 0.2666667, 1, 1,
0.3308193, -0.1490858, 2.969516, 0, 0.2627451, 1, 1,
0.3308368, -0.1917233, 0.9629405, 0, 0.254902, 1, 1,
0.3453671, 2.406736, -1.591033, 0, 0.2509804, 1, 1,
0.351274, 0.2973505, -0.01600512, 0, 0.2431373, 1, 1,
0.353223, -1.212122, 3.067401, 0, 0.2392157, 1, 1,
0.3551004, -1.076726, 3.737472, 0, 0.2313726, 1, 1,
0.3603385, -1.062221, 2.996052, 0, 0.227451, 1, 1,
0.3616895, -0.1526117, 0.5830786, 0, 0.2196078, 1, 1,
0.3617225, -0.3933143, 1.115822, 0, 0.2156863, 1, 1,
0.364826, 1.337336, 0.440113, 0, 0.2078431, 1, 1,
0.3670225, -0.5000709, 3.949313, 0, 0.2039216, 1, 1,
0.3682258, 0.2219907, 1.371652, 0, 0.1960784, 1, 1,
0.3700062, -0.2556696, 3.386687, 0, 0.1882353, 1, 1,
0.3738689, 0.3313294, 0.8185958, 0, 0.1843137, 1, 1,
0.3743182, -0.5599914, 2.866446, 0, 0.1764706, 1, 1,
0.3754871, 0.8288633, 0.6265129, 0, 0.172549, 1, 1,
0.3781876, -0.1615929, 3.727067, 0, 0.1647059, 1, 1,
0.3802953, 0.001443062, 2.555687, 0, 0.1607843, 1, 1,
0.3819295, 0.09824537, 2.09835, 0, 0.1529412, 1, 1,
0.3837263, 1.281749, 1.030004, 0, 0.1490196, 1, 1,
0.3866298, -0.005101497, 4.761693, 0, 0.1411765, 1, 1,
0.3893463, 0.9793947, 0.8630232, 0, 0.1372549, 1, 1,
0.3928748, -1.176383, 2.534439, 0, 0.1294118, 1, 1,
0.3976827, -0.7700477, 1.83784, 0, 0.1254902, 1, 1,
0.3985831, 0.09847188, 1.631925, 0, 0.1176471, 1, 1,
0.402784, 1.076726, -0.3654089, 0, 0.1137255, 1, 1,
0.4123766, -0.08853825, 4.161178, 0, 0.1058824, 1, 1,
0.4124759, -0.4421626, 1.601451, 0, 0.09803922, 1, 1,
0.4173574, -0.809989, 3.398736, 0, 0.09411765, 1, 1,
0.4225414, -0.628201, 1.765424, 0, 0.08627451, 1, 1,
0.4225657, -2.008546, 3.623598, 0, 0.08235294, 1, 1,
0.4310502, 0.118602, 1.617729, 0, 0.07450981, 1, 1,
0.4319541, 1.014069, 0.4507945, 0, 0.07058824, 1, 1,
0.4326352, 0.03879535, -0.4121613, 0, 0.0627451, 1, 1,
0.4340782, -0.670297, 3.385893, 0, 0.05882353, 1, 1,
0.4341227, -0.9715642, 2.875797, 0, 0.05098039, 1, 1,
0.4350973, -0.7033148, 3.659796, 0, 0.04705882, 1, 1,
0.4357166, -2.027256, 2.154614, 0, 0.03921569, 1, 1,
0.435953, 0.6592745, 0.7068542, 0, 0.03529412, 1, 1,
0.4382962, -1.546459, 2.420351, 0, 0.02745098, 1, 1,
0.4392118, -0.881384, 1.805332, 0, 0.02352941, 1, 1,
0.4399545, 0.01210727, 2.347596, 0, 0.01568628, 1, 1,
0.4422725, 0.1731683, 0.6417319, 0, 0.01176471, 1, 1,
0.4455775, 0.02015875, 0.7157133, 0, 0.003921569, 1, 1,
0.4490836, -0.191926, 2.777995, 0.003921569, 0, 1, 1,
0.4510201, -2.025466, 1.96727, 0.007843138, 0, 1, 1,
0.4560944, 1.471393, -0.5087965, 0.01568628, 0, 1, 1,
0.4593068, -0.4137028, 3.302043, 0.01960784, 0, 1, 1,
0.4611136, 0.9884706, 0.300444, 0.02745098, 0, 1, 1,
0.4623934, 0.7375652, 0.9441231, 0.03137255, 0, 1, 1,
0.4710767, -0.6392936, 2.883465, 0.03921569, 0, 1, 1,
0.4760425, 0.9530614, -0.1738659, 0.04313726, 0, 1, 1,
0.4770116, -1.267142, 3.984272, 0.05098039, 0, 1, 1,
0.4833725, 0.2818586, 2.4447, 0.05490196, 0, 1, 1,
0.4851606, 0.5013405, 1.049729, 0.0627451, 0, 1, 1,
0.4890636, 1.15049, 2.380649, 0.06666667, 0, 1, 1,
0.4905361, -0.4234506, 2.6667, 0.07450981, 0, 1, 1,
0.490908, -1.323456, 0.9602175, 0.07843138, 0, 1, 1,
0.4954027, 0.6157382, 2.375035, 0.08627451, 0, 1, 1,
0.4969848, -0.9980269, 3.467346, 0.09019608, 0, 1, 1,
0.5025201, -0.4950266, 5.048811, 0.09803922, 0, 1, 1,
0.5026907, -0.5570913, 1.720388, 0.1058824, 0, 1, 1,
0.5064471, 0.8668497, 0.84597, 0.1098039, 0, 1, 1,
0.507422, 0.2830088, 0.5692285, 0.1176471, 0, 1, 1,
0.5105339, 1.464287, -0.9267057, 0.1215686, 0, 1, 1,
0.511361, 0.9347743, -0.03410546, 0.1294118, 0, 1, 1,
0.5134043, -1.466816, 2.372254, 0.1333333, 0, 1, 1,
0.5151781, 0.999653, 1.521618, 0.1411765, 0, 1, 1,
0.5241362, -1.274069, 3.162915, 0.145098, 0, 1, 1,
0.5257663, -0.5863466, 3.582494, 0.1529412, 0, 1, 1,
0.5290709, -0.4707003, 2.313962, 0.1568628, 0, 1, 1,
0.5353317, 0.2835239, 1.030244, 0.1647059, 0, 1, 1,
0.5406661, 0.5014868, 3.53657, 0.1686275, 0, 1, 1,
0.5446932, -0.2286926, 2.239635, 0.1764706, 0, 1, 1,
0.5461001, -0.9832619, 1.850385, 0.1803922, 0, 1, 1,
0.5461568, 0.03934417, 2.159569, 0.1882353, 0, 1, 1,
0.5470082, -0.4699681, 0.4253124, 0.1921569, 0, 1, 1,
0.5535507, 0.3191827, 0.704082, 0.2, 0, 1, 1,
0.5536486, 0.8454849, -0.07351258, 0.2078431, 0, 1, 1,
0.5539616, 0.9603941, 1.003031, 0.2117647, 0, 1, 1,
0.5547137, 0.1828117, 0.01168857, 0.2196078, 0, 1, 1,
0.5566185, 1.62225, 1.256017, 0.2235294, 0, 1, 1,
0.5572312, 0.3273664, -0.5229944, 0.2313726, 0, 1, 1,
0.5585158, 0.579527, 0.8967726, 0.2352941, 0, 1, 1,
0.5647654, -0.5444176, 1.436696, 0.2431373, 0, 1, 1,
0.5651203, -0.6986166, 1.168229, 0.2470588, 0, 1, 1,
0.5660626, 1.9994, -2.057334, 0.254902, 0, 1, 1,
0.5700267, 0.1983185, 3.886768, 0.2588235, 0, 1, 1,
0.5733155, -0.9789732, 2.211729, 0.2666667, 0, 1, 1,
0.5822123, 0.9111682, 1.786833, 0.2705882, 0, 1, 1,
0.5836252, -1.222892, 3.489836, 0.2784314, 0, 1, 1,
0.5876335, -0.9897366, 2.425233, 0.282353, 0, 1, 1,
0.5895287, 1.375412, -0.9139434, 0.2901961, 0, 1, 1,
0.5899973, -1.039079, 2.549567, 0.2941177, 0, 1, 1,
0.5905427, 1.069167, 0.2877786, 0.3019608, 0, 1, 1,
0.5918168, 0.1766531, 0.335218, 0.3098039, 0, 1, 1,
0.5973616, 0.4640649, 0.2754858, 0.3137255, 0, 1, 1,
0.6041267, -0.354231, 3.384982, 0.3215686, 0, 1, 1,
0.605729, 0.8239715, 0.09446857, 0.3254902, 0, 1, 1,
0.6065202, -0.9953851, 2.80676, 0.3333333, 0, 1, 1,
0.6146911, -0.3023291, 0.3133583, 0.3372549, 0, 1, 1,
0.620129, -0.1436251, 0.2359786, 0.345098, 0, 1, 1,
0.6207797, -1.182881, 3.151917, 0.3490196, 0, 1, 1,
0.6221442, -0.4574753, 1.969217, 0.3568628, 0, 1, 1,
0.6232429, -0.5773659, 1.078641, 0.3607843, 0, 1, 1,
0.6246738, 1.608529, 0.6336847, 0.3686275, 0, 1, 1,
0.6260563, 1.713601, 1.824013, 0.372549, 0, 1, 1,
0.6269482, 0.05341505, 1.68447, 0.3803922, 0, 1, 1,
0.6309381, 2.448755, 0.07177537, 0.3843137, 0, 1, 1,
0.631606, -0.7413641, 2.39185, 0.3921569, 0, 1, 1,
0.6346802, 0.7626993, 0.9381987, 0.3960784, 0, 1, 1,
0.6359584, 0.8672522, 0.5359133, 0.4039216, 0, 1, 1,
0.6366383, 1.118764, -1.757017, 0.4117647, 0, 1, 1,
0.6415881, 0.1092755, 4.19375, 0.4156863, 0, 1, 1,
0.6432028, -0.5112165, 2.107034, 0.4235294, 0, 1, 1,
0.6452914, 0.3716438, 0.04568785, 0.427451, 0, 1, 1,
0.6487448, -0.375908, 3.118857, 0.4352941, 0, 1, 1,
0.6514229, 0.1918732, 1.975456, 0.4392157, 0, 1, 1,
0.6516249, -1.937504, 1.15979, 0.4470588, 0, 1, 1,
0.6523042, 1.088745, 0.1005081, 0.4509804, 0, 1, 1,
0.6546044, 1.252818, -0.006861517, 0.4588235, 0, 1, 1,
0.6611533, 1.309897, 0.9020088, 0.4627451, 0, 1, 1,
0.6651507, 0.9521165, -0.3638099, 0.4705882, 0, 1, 1,
0.670607, 1.859206, 0.9091662, 0.4745098, 0, 1, 1,
0.6722445, 0.07645632, 1.577306, 0.4823529, 0, 1, 1,
0.6727582, 1.49862, 1.858076, 0.4862745, 0, 1, 1,
0.6736242, 1.184774, 0.6684961, 0.4941176, 0, 1, 1,
0.6759738, -1.87933, 2.18184, 0.5019608, 0, 1, 1,
0.684745, -0.1908303, 2.829986, 0.5058824, 0, 1, 1,
0.6897985, -1.222469, 2.310137, 0.5137255, 0, 1, 1,
0.6965677, 2.064847, -0.8310504, 0.5176471, 0, 1, 1,
0.7026638, -2.074609, 2.460096, 0.5254902, 0, 1, 1,
0.7029546, 1.081616, 0.663666, 0.5294118, 0, 1, 1,
0.7105252, -0.1090457, 1.242659, 0.5372549, 0, 1, 1,
0.7126355, 0.5504919, 0.8696502, 0.5411765, 0, 1, 1,
0.7166342, -1.230381, 2.909726, 0.5490196, 0, 1, 1,
0.7209967, 1.176597, 0.5132161, 0.5529412, 0, 1, 1,
0.7236795, 1.743777, -0.6940392, 0.5607843, 0, 1, 1,
0.7381778, 0.1786554, 1.22605, 0.5647059, 0, 1, 1,
0.7381979, -1.307752, 2.808439, 0.572549, 0, 1, 1,
0.738652, 0.2303139, 0.2271406, 0.5764706, 0, 1, 1,
0.7392409, -1.335651, 2.686389, 0.5843138, 0, 1, 1,
0.7392919, 0.4654109, 0.2530598, 0.5882353, 0, 1, 1,
0.7410222, -0.4380997, 2.860209, 0.5960785, 0, 1, 1,
0.7428688, 0.6433733, 1.042564, 0.6039216, 0, 1, 1,
0.7445896, -0.05923761, 3.41353, 0.6078432, 0, 1, 1,
0.7465473, 0.4405632, 1.240134, 0.6156863, 0, 1, 1,
0.7518598, 0.05545413, 1.128225, 0.6196079, 0, 1, 1,
0.7533608, -1.102931, 3.179821, 0.627451, 0, 1, 1,
0.7548537, 0.8208247, -0.2078027, 0.6313726, 0, 1, 1,
0.7645969, -0.4030943, 2.348192, 0.6392157, 0, 1, 1,
0.7692211, 0.2245879, 1.398708, 0.6431373, 0, 1, 1,
0.7721907, 0.7538626, 0.8560898, 0.6509804, 0, 1, 1,
0.7836279, -0.2493345, 2.598535, 0.654902, 0, 1, 1,
0.7860613, -1.417299, 3.082725, 0.6627451, 0, 1, 1,
0.7882022, -1.716219, 4.538286, 0.6666667, 0, 1, 1,
0.7886981, -2.00272, 3.265409, 0.6745098, 0, 1, 1,
0.7947294, -1.107791, 4.464258, 0.6784314, 0, 1, 1,
0.7955611, -1.145402, 0.7373317, 0.6862745, 0, 1, 1,
0.7966872, 0.6491207, 1.449819, 0.6901961, 0, 1, 1,
0.7971641, 1.048218, 1.14074, 0.6980392, 0, 1, 1,
0.8002249, 1.224501, 1.698895, 0.7058824, 0, 1, 1,
0.8101397, 0.1727201, 0.6487907, 0.7098039, 0, 1, 1,
0.8110408, -1.101476, 2.310381, 0.7176471, 0, 1, 1,
0.8126292, 1.082142, -1.644967, 0.7215686, 0, 1, 1,
0.8207788, -0.5657795, 2.469166, 0.7294118, 0, 1, 1,
0.8273709, -0.8006964, 0.9315442, 0.7333333, 0, 1, 1,
0.8281412, 1.602065, 0.4481116, 0.7411765, 0, 1, 1,
0.829056, -1.239393, 2.379615, 0.7450981, 0, 1, 1,
0.8300771, 1.174488, 3.301273, 0.7529412, 0, 1, 1,
0.8314146, -0.4296852, 0.5698665, 0.7568628, 0, 1, 1,
0.8321278, -0.623781, 0.3404533, 0.7647059, 0, 1, 1,
0.8357186, 1.00836, 0.1055363, 0.7686275, 0, 1, 1,
0.8367087, 0.5376396, 1.451608, 0.7764706, 0, 1, 1,
0.8368685, -1.211052, 1.278274, 0.7803922, 0, 1, 1,
0.8471492, -0.2481046, 1.755342, 0.7882353, 0, 1, 1,
0.8473523, 0.4170177, 2.857596, 0.7921569, 0, 1, 1,
0.8507572, 0.8645819, 0.7046638, 0.8, 0, 1, 1,
0.8546038, 0.06439932, 1.693412, 0.8078431, 0, 1, 1,
0.8567912, -2.573721, 3.110438, 0.8117647, 0, 1, 1,
0.8571132, -2.01681, 1.420174, 0.8196079, 0, 1, 1,
0.8579508, -0.00414544, 3.387823, 0.8235294, 0, 1, 1,
0.866756, -1.85923, 3.58071, 0.8313726, 0, 1, 1,
0.8676593, 1.140942, 0.2383289, 0.8352941, 0, 1, 1,
0.8698642, -0.8015787, 3.974711, 0.8431373, 0, 1, 1,
0.8706294, -0.1648845, 1.011451, 0.8470588, 0, 1, 1,
0.8738444, 0.1891111, 2.08712, 0.854902, 0, 1, 1,
0.8777981, 2.292365, 1.685931, 0.8588235, 0, 1, 1,
0.8791199, 1.771186, 0.2849706, 0.8666667, 0, 1, 1,
0.8815953, -0.1796427, 2.202601, 0.8705882, 0, 1, 1,
0.8865975, -0.5886421, 1.846058, 0.8784314, 0, 1, 1,
0.8891534, -0.1055776, 3.305488, 0.8823529, 0, 1, 1,
0.8946617, -1.133739, 3.745112, 0.8901961, 0, 1, 1,
0.9045085, 0.2665068, 0.451176, 0.8941177, 0, 1, 1,
0.9069105, -1.108296, 2.608002, 0.9019608, 0, 1, 1,
0.9079046, -0.1691571, 4.089008, 0.9098039, 0, 1, 1,
0.9119443, 1.040153, 0.8792962, 0.9137255, 0, 1, 1,
0.9176431, -0.02308871, 1.713035, 0.9215686, 0, 1, 1,
0.9211593, -0.1369214, 3.325398, 0.9254902, 0, 1, 1,
0.9263996, -0.5099065, 2.797602, 0.9333333, 0, 1, 1,
0.9282349, 0.4323324, 2.050135, 0.9372549, 0, 1, 1,
0.9316544, 0.4258077, 0.375961, 0.945098, 0, 1, 1,
0.9340823, -0.625219, 3.195864, 0.9490196, 0, 1, 1,
0.9368272, 2.403862, 0.1358716, 0.9568627, 0, 1, 1,
0.9370521, -1.930745, 2.428576, 0.9607843, 0, 1, 1,
0.9424231, 0.01301884, 1.606374, 0.9686275, 0, 1, 1,
0.9438928, -2.469486, 3.460195, 0.972549, 0, 1, 1,
0.9525968, 0.4189101, 0.1086465, 0.9803922, 0, 1, 1,
0.9600566, -0.2655492, 4.125065, 0.9843137, 0, 1, 1,
0.9649069, -0.07090186, 1.607472, 0.9921569, 0, 1, 1,
0.9651204, -0.8472033, 1.805033, 0.9960784, 0, 1, 1,
0.9722998, -1.355792, 3.322708, 1, 0, 0.9960784, 1,
0.9773684, -0.7968073, 2.611333, 1, 0, 0.9882353, 1,
0.9850224, -0.8403971, 1.731117, 1, 0, 0.9843137, 1,
0.9873189, -0.3907378, 1.854957, 1, 0, 0.9764706, 1,
0.9921976, 0.4931252, 2.418345, 1, 0, 0.972549, 1,
1.001863, 0.7020598, -0.3928121, 1, 0, 0.9647059, 1,
1.003382, -0.6654708, 2.294486, 1, 0, 0.9607843, 1,
1.010113, 0.4189892, -0.8222547, 1, 0, 0.9529412, 1,
1.011192, 0.4716576, 0.9992263, 1, 0, 0.9490196, 1,
1.015154, 0.04151858, 0.3726682, 1, 0, 0.9411765, 1,
1.015979, -1.00238, 2.85987, 1, 0, 0.9372549, 1,
1.017247, 0.5113003, -0.0126925, 1, 0, 0.9294118, 1,
1.018551, 0.3997796, 1.108344, 1, 0, 0.9254902, 1,
1.018664, -0.5103993, 1.440352, 1, 0, 0.9176471, 1,
1.018782, -1.122438, 2.060103, 1, 0, 0.9137255, 1,
1.025731, -0.04585445, 1.951837, 1, 0, 0.9058824, 1,
1.026456, -0.4601774, 2.882239, 1, 0, 0.9019608, 1,
1.029562, 0.3440521, 0.7414323, 1, 0, 0.8941177, 1,
1.033651, -1.88536, 3.963486, 1, 0, 0.8862745, 1,
1.033954, -0.6462198, 3.33974, 1, 0, 0.8823529, 1,
1.039887, -0.4093134, 2.189932, 1, 0, 0.8745098, 1,
1.040575, 0.3331586, 0.9752517, 1, 0, 0.8705882, 1,
1.045238, -1.781744, 3.225343, 1, 0, 0.8627451, 1,
1.04782, 0.3758593, 1.763453, 1, 0, 0.8588235, 1,
1.049342, -2.953055, 3.406021, 1, 0, 0.8509804, 1,
1.058753, 0.2866374, 2.509952, 1, 0, 0.8470588, 1,
1.075468, 0.3104929, 0.9365726, 1, 0, 0.8392157, 1,
1.076896, 1.978021, 0.411158, 1, 0, 0.8352941, 1,
1.083278, 1.426726, 1.16295, 1, 0, 0.827451, 1,
1.083573, 0.3867384, 0.8675755, 1, 0, 0.8235294, 1,
1.099392, 0.3183919, -0.2947674, 1, 0, 0.8156863, 1,
1.108018, -0.0001473557, -0.3564182, 1, 0, 0.8117647, 1,
1.112298, 1.502025, -0.4360724, 1, 0, 0.8039216, 1,
1.11393, -1.264476, 2.763499, 1, 0, 0.7960784, 1,
1.143075, 0.05460079, 4.116563, 1, 0, 0.7921569, 1,
1.143417, 1.271816, -0.09404875, 1, 0, 0.7843137, 1,
1.147103, -0.04968058, 2.766393, 1, 0, 0.7803922, 1,
1.151433, -1.603492, 1.98414, 1, 0, 0.772549, 1,
1.156904, -0.1634653, 2.123344, 1, 0, 0.7686275, 1,
1.156965, -0.3862718, 4.316589, 1, 0, 0.7607843, 1,
1.159469, -0.5623392, 1.834738, 1, 0, 0.7568628, 1,
1.161442, 0.9737657, 0.2230872, 1, 0, 0.7490196, 1,
1.16261, -0.2248987, 1.83873, 1, 0, 0.7450981, 1,
1.175063, -0.5629075, 1.673621, 1, 0, 0.7372549, 1,
1.194754, 0.5933565, 0.2646878, 1, 0, 0.7333333, 1,
1.194821, -1.094538, 2.110357, 1, 0, 0.7254902, 1,
1.199718, -2.603143, 4.797763, 1, 0, 0.7215686, 1,
1.204275, -0.2755584, 1.78699, 1, 0, 0.7137255, 1,
1.204493, 0.1267869, 1.464799, 1, 0, 0.7098039, 1,
1.22648, 0.6888809, 0.7010892, 1, 0, 0.7019608, 1,
1.228314, -0.02937166, 0.1808044, 1, 0, 0.6941177, 1,
1.233632, 0.4285356, 2.373034, 1, 0, 0.6901961, 1,
1.238211, -0.6548771, 2.808534, 1, 0, 0.682353, 1,
1.243608, -0.8161945, 3.254452, 1, 0, 0.6784314, 1,
1.255703, 0.5532913, 1.535079, 1, 0, 0.6705883, 1,
1.259593, -1.181487, 2.718661, 1, 0, 0.6666667, 1,
1.259881, -0.9396064, 2.131722, 1, 0, 0.6588235, 1,
1.260168, 0.6452313, -0.3533756, 1, 0, 0.654902, 1,
1.261961, 1.470551, 0.7444084, 1, 0, 0.6470588, 1,
1.26534, -1.748599, 1.566348, 1, 0, 0.6431373, 1,
1.27035, -1.567738, 2.510227, 1, 0, 0.6352941, 1,
1.286031, -0.4784442, 0.9074625, 1, 0, 0.6313726, 1,
1.295413, -0.5546647, 1.858206, 1, 0, 0.6235294, 1,
1.29825, 0.1463703, 1.099147, 1, 0, 0.6196079, 1,
1.299263, -1.183293, 1.968248, 1, 0, 0.6117647, 1,
1.302769, -2.136265, 3.054506, 1, 0, 0.6078432, 1,
1.315972, 0.3485348, -0.2477264, 1, 0, 0.6, 1,
1.319885, 1.117655, 0.4420501, 1, 0, 0.5921569, 1,
1.34232, -1.00455, 3.469486, 1, 0, 0.5882353, 1,
1.345749, -0.04774549, -0.2262577, 1, 0, 0.5803922, 1,
1.356748, -1.414305, 1.467125, 1, 0, 0.5764706, 1,
1.360225, -0.6670719, 2.304427, 1, 0, 0.5686275, 1,
1.367636, -0.1725379, 1.593803, 1, 0, 0.5647059, 1,
1.37743, -0.9839742, 2.464075, 1, 0, 0.5568628, 1,
1.390272, -0.2377178, 2.283199, 1, 0, 0.5529412, 1,
1.395532, 0.6234241, 1.024482, 1, 0, 0.5450981, 1,
1.395542, 2.074239, 0.5159041, 1, 0, 0.5411765, 1,
1.407194, 1.762961, 0.4940867, 1, 0, 0.5333334, 1,
1.407199, -0.5579751, 1.803673, 1, 0, 0.5294118, 1,
1.416414, -0.5284314, 2.7095, 1, 0, 0.5215687, 1,
1.418004, -0.2444655, 2.990264, 1, 0, 0.5176471, 1,
1.422305, -0.4813881, 0.1414048, 1, 0, 0.509804, 1,
1.435845, 1.553974, 1.956823, 1, 0, 0.5058824, 1,
1.437378, -1.036244, 2.767476, 1, 0, 0.4980392, 1,
1.439939, 1.456422, 1.070892, 1, 0, 0.4901961, 1,
1.440201, -0.1022834, 1.535164, 1, 0, 0.4862745, 1,
1.475306, -1.658298, 3.592075, 1, 0, 0.4784314, 1,
1.475379, -1.040094, 2.77258, 1, 0, 0.4745098, 1,
1.478164, -1.047904, 4.295088, 1, 0, 0.4666667, 1,
1.481861, -0.6302999, 2.255506, 1, 0, 0.4627451, 1,
1.502896, -0.09239433, 2.490631, 1, 0, 0.454902, 1,
1.508065, 0.0776444, 1.476898, 1, 0, 0.4509804, 1,
1.510536, 0.3733817, 0.4118315, 1, 0, 0.4431373, 1,
1.515312, 1.699399, 1.273577, 1, 0, 0.4392157, 1,
1.523608, -1.182205, 2.049832, 1, 0, 0.4313726, 1,
1.528872, -0.3601153, 1.361628, 1, 0, 0.427451, 1,
1.530184, -0.4204283, 2.171117, 1, 0, 0.4196078, 1,
1.536081, -0.2512885, 2.824268, 1, 0, 0.4156863, 1,
1.538768, -0.2597016, 1.122097, 1, 0, 0.4078431, 1,
1.553158, 0.05842239, 2.518821, 1, 0, 0.4039216, 1,
1.567307, -0.6388189, 0.6297479, 1, 0, 0.3960784, 1,
1.577879, 0.6827219, 2.073698, 1, 0, 0.3882353, 1,
1.58903, 0.9059224, -0.1121391, 1, 0, 0.3843137, 1,
1.60204, -0.04149868, 1.449791, 1, 0, 0.3764706, 1,
1.603735, 0.2122332, 2.616617, 1, 0, 0.372549, 1,
1.606798, -1.155857, 2.278695, 1, 0, 0.3647059, 1,
1.63233, -1.340781, 1.939347, 1, 0, 0.3607843, 1,
1.667007, 1.212016, 0.6694846, 1, 0, 0.3529412, 1,
1.667773, -0.6331132, 0.9762076, 1, 0, 0.3490196, 1,
1.687183, -0.1635159, 2.343539, 1, 0, 0.3411765, 1,
1.691015, -1.194801, 1.558945, 1, 0, 0.3372549, 1,
1.693565, 0.3837117, 2.487777, 1, 0, 0.3294118, 1,
1.705602, -0.31313, 2.59171, 1, 0, 0.3254902, 1,
1.713924, -0.6163471, 3.251645, 1, 0, 0.3176471, 1,
1.715664, 0.1601178, 1.046613, 1, 0, 0.3137255, 1,
1.740745, -1.585398, 2.105776, 1, 0, 0.3058824, 1,
1.752314, 1.873814, -0.5747696, 1, 0, 0.2980392, 1,
1.752577, -0.9850847, 0.968658, 1, 0, 0.2941177, 1,
1.776068, -0.76147, 1.177677, 1, 0, 0.2862745, 1,
1.789597, 0.4363322, 0.3310032, 1, 0, 0.282353, 1,
1.794187, -0.2564174, 2.512596, 1, 0, 0.2745098, 1,
1.795594, 0.2852596, 0.9225066, 1, 0, 0.2705882, 1,
1.798254, -0.810847, 3.653976, 1, 0, 0.2627451, 1,
1.806354, 0.8536098, 0.3080524, 1, 0, 0.2588235, 1,
1.820925, -0.7214608, 1.348766, 1, 0, 0.2509804, 1,
1.829847, -0.02641511, -0.04213774, 1, 0, 0.2470588, 1,
1.831599, 0.6669211, 1.967462, 1, 0, 0.2392157, 1,
1.835818, -0.1666004, 2.92726, 1, 0, 0.2352941, 1,
1.842966, 0.9593819, 0.4858729, 1, 0, 0.227451, 1,
1.846714, 0.4565617, 1.14345, 1, 0, 0.2235294, 1,
1.874847, -0.6243725, 3.657236, 1, 0, 0.2156863, 1,
1.900765, 0.05416711, 2.508963, 1, 0, 0.2117647, 1,
1.901446, 1.214508, 1.174554, 1, 0, 0.2039216, 1,
1.903376, -1.874925, 3.855999, 1, 0, 0.1960784, 1,
1.916408, -0.8404038, 1.833293, 1, 0, 0.1921569, 1,
1.947486, -2.596827, 2.494247, 1, 0, 0.1843137, 1,
1.972093, 0.8280284, 1.879693, 1, 0, 0.1803922, 1,
1.982207, 1.198457, 0.7570963, 1, 0, 0.172549, 1,
1.987175, 0.892424, 0.6182003, 1, 0, 0.1686275, 1,
1.987899, 0.6782506, 0.6886318, 1, 0, 0.1607843, 1,
1.988506, -0.483537, 1.590463, 1, 0, 0.1568628, 1,
1.989222, 0.2564413, 1.855181, 1, 0, 0.1490196, 1,
2.005645, 0.47812, 1.853589, 1, 0, 0.145098, 1,
2.007671, -0.1799084, 1.603625, 1, 0, 0.1372549, 1,
2.010617, -0.3782251, 2.399505, 1, 0, 0.1333333, 1,
2.01606, 0.1738603, 2.130773, 1, 0, 0.1254902, 1,
2.018769, -0.1430398, 1.489254, 1, 0, 0.1215686, 1,
2.018874, 0.01717686, 0.4751532, 1, 0, 0.1137255, 1,
2.050079, 0.3569554, 1.752356, 1, 0, 0.1098039, 1,
2.060148, 1.092993, 1.337376, 1, 0, 0.1019608, 1,
2.067731, -0.5032106, 3.616763, 1, 0, 0.09411765, 1,
2.114948, -0.2481231, 2.182731, 1, 0, 0.09019608, 1,
2.129756, -1.069687, 2.323553, 1, 0, 0.08235294, 1,
2.239955, -0.4746265, 3.439262, 1, 0, 0.07843138, 1,
2.269038, 0.3472085, 3.524956, 1, 0, 0.07058824, 1,
2.27667, -0.1730425, 0.2911199, 1, 0, 0.06666667, 1,
2.346646, -0.793698, 3.290602, 1, 0, 0.05882353, 1,
2.454772, -0.5255918, 0.8011205, 1, 0, 0.05490196, 1,
2.542819, 0.03896614, 1.463482, 1, 0, 0.04705882, 1,
2.587383, 0.2811066, 3.528132, 1, 0, 0.04313726, 1,
2.631189, 0.1637029, 1.444141, 1, 0, 0.03529412, 1,
2.657921, 1.754538, -0.5796194, 1, 0, 0.03137255, 1,
2.688695, -2.575512, 2.635921, 1, 0, 0.02352941, 1,
2.813594, -1.309311, 1.189678, 1, 0, 0.01960784, 1,
2.96379, -0.7690579, 3.067212, 1, 0, 0.01176471, 1,
3.320221, -0.6338914, 1.369604, 1, 0, 0.007843138, 1
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
-0.09651363, -3.943292, -6.940047, 0, -0.5, 0.5, 0.5,
-0.09651363, -3.943292, -6.940047, 1, -0.5, 0.5, 0.5,
-0.09651363, -3.943292, -6.940047, 1, 1.5, 0.5, 0.5,
-0.09651363, -3.943292, -6.940047, 0, 1.5, 0.5, 0.5
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
-4.671522, -0.03200328, -6.940047, 0, -0.5, 0.5, 0.5,
-4.671522, -0.03200328, -6.940047, 1, -0.5, 0.5, 0.5,
-4.671522, -0.03200328, -6.940047, 1, 1.5, 0.5, 0.5,
-4.671522, -0.03200328, -6.940047, 0, 1.5, 0.5, 0.5
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
-4.671522, -3.943292, -0.04150534, 0, -0.5, 0.5, 0.5,
-4.671522, -3.943292, -0.04150534, 1, -0.5, 0.5, 0.5,
-4.671522, -3.943292, -0.04150534, 1, 1.5, 0.5, 0.5,
-4.671522, -3.943292, -0.04150534, 0, 1.5, 0.5, 0.5
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
-3, -3.040687, -5.348075,
3, -3.040687, -5.348075,
-3, -3.040687, -5.348075,
-3, -3.191121, -5.613404,
-2, -3.040687, -5.348075,
-2, -3.191121, -5.613404,
-1, -3.040687, -5.348075,
-1, -3.191121, -5.613404,
0, -3.040687, -5.348075,
0, -3.191121, -5.613404,
1, -3.040687, -5.348075,
1, -3.191121, -5.613404,
2, -3.040687, -5.348075,
2, -3.191121, -5.613404,
3, -3.040687, -5.348075,
3, -3.191121, -5.613404
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
-3, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
-3, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
-3, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
-3, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
-2, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
-2, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
-2, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
-2, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
-1, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
-1, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
-1, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
-1, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
0, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
0, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
0, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
0, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
1, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
1, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
1, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
1, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
2, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
2, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
2, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
2, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5,
3, -3.491989, -6.144061, 0, -0.5, 0.5, 0.5,
3, -3.491989, -6.144061, 1, -0.5, 0.5, 0.5,
3, -3.491989, -6.144061, 1, 1.5, 0.5, 0.5,
3, -3.491989, -6.144061, 0, 1.5, 0.5, 0.5
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
-3.615751, -2, -5.348075,
-3.615751, 2, -5.348075,
-3.615751, -2, -5.348075,
-3.791713, -2, -5.613404,
-3.615751, -1, -5.348075,
-3.791713, -1, -5.613404,
-3.615751, 0, -5.348075,
-3.791713, 0, -5.613404,
-3.615751, 1, -5.348075,
-3.791713, 1, -5.613404,
-3.615751, 2, -5.348075,
-3.791713, 2, -5.613404
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
-4.143636, -2, -6.144061, 0, -0.5, 0.5, 0.5,
-4.143636, -2, -6.144061, 1, -0.5, 0.5, 0.5,
-4.143636, -2, -6.144061, 1, 1.5, 0.5, 0.5,
-4.143636, -2, -6.144061, 0, 1.5, 0.5, 0.5,
-4.143636, -1, -6.144061, 0, -0.5, 0.5, 0.5,
-4.143636, -1, -6.144061, 1, -0.5, 0.5, 0.5,
-4.143636, -1, -6.144061, 1, 1.5, 0.5, 0.5,
-4.143636, -1, -6.144061, 0, 1.5, 0.5, 0.5,
-4.143636, 0, -6.144061, 0, -0.5, 0.5, 0.5,
-4.143636, 0, -6.144061, 1, -0.5, 0.5, 0.5,
-4.143636, 0, -6.144061, 1, 1.5, 0.5, 0.5,
-4.143636, 0, -6.144061, 0, 1.5, 0.5, 0.5,
-4.143636, 1, -6.144061, 0, -0.5, 0.5, 0.5,
-4.143636, 1, -6.144061, 1, -0.5, 0.5, 0.5,
-4.143636, 1, -6.144061, 1, 1.5, 0.5, 0.5,
-4.143636, 1, -6.144061, 0, 1.5, 0.5, 0.5,
-4.143636, 2, -6.144061, 0, -0.5, 0.5, 0.5,
-4.143636, 2, -6.144061, 1, -0.5, 0.5, 0.5,
-4.143636, 2, -6.144061, 1, 1.5, 0.5, 0.5,
-4.143636, 2, -6.144061, 0, 1.5, 0.5, 0.5
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
-3.615751, -3.040687, -4,
-3.615751, -3.040687, 4,
-3.615751, -3.040687, -4,
-3.791713, -3.191121, -4,
-3.615751, -3.040687, -2,
-3.791713, -3.191121, -2,
-3.615751, -3.040687, 0,
-3.791713, -3.191121, 0,
-3.615751, -3.040687, 2,
-3.791713, -3.191121, 2,
-3.615751, -3.040687, 4,
-3.791713, -3.191121, 4
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
-4.143636, -3.491989, -4, 0, -0.5, 0.5, 0.5,
-4.143636, -3.491989, -4, 1, -0.5, 0.5, 0.5,
-4.143636, -3.491989, -4, 1, 1.5, 0.5, 0.5,
-4.143636, -3.491989, -4, 0, 1.5, 0.5, 0.5,
-4.143636, -3.491989, -2, 0, -0.5, 0.5, 0.5,
-4.143636, -3.491989, -2, 1, -0.5, 0.5, 0.5,
-4.143636, -3.491989, -2, 1, 1.5, 0.5, 0.5,
-4.143636, -3.491989, -2, 0, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 0, 0, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 0, 1, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 0, 1, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 0, 0, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 2, 0, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 2, 1, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 2, 1, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 2, 0, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 4, 0, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 4, 1, -0.5, 0.5, 0.5,
-4.143636, -3.491989, 4, 1, 1.5, 0.5, 0.5,
-4.143636, -3.491989, 4, 0, 1.5, 0.5, 0.5
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
-3.615751, -3.040687, -5.348075,
-3.615751, 2.97668, -5.348075,
-3.615751, -3.040687, 5.265065,
-3.615751, 2.97668, 5.265065,
-3.615751, -3.040687, -5.348075,
-3.615751, -3.040687, 5.265065,
-3.615751, 2.97668, -5.348075,
-3.615751, 2.97668, 5.265065,
-3.615751, -3.040687, -5.348075,
3.422724, -3.040687, -5.348075,
-3.615751, -3.040687, 5.265065,
3.422724, -3.040687, 5.265065,
-3.615751, 2.97668, -5.348075,
3.422724, 2.97668, -5.348075,
-3.615751, 2.97668, 5.265065,
3.422724, 2.97668, 5.265065,
3.422724, -3.040687, -5.348075,
3.422724, 2.97668, -5.348075,
3.422724, -3.040687, 5.265065,
3.422724, 2.97668, 5.265065,
3.422724, -3.040687, -5.348075,
3.422724, -3.040687, 5.265065,
3.422724, 2.97668, -5.348075,
3.422724, 2.97668, 5.265065
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
var radius = 7.521123;
var distance = 33.46233;
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
mvMatrix.translate( 0.09651363, 0.03200328, 0.04150534 );
mvMatrix.scale( 1.155362, 1.351419, 0.7662186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46233);
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
methyl_acetate<-read.table("methyl_acetate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_acetate' not found
```

```r
y<-methyl_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_acetate' not found
```

```r
z<-methyl_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_acetate' not found
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
-3.513249, -0.2678381, -0.9157435, 0, 0, 1, 1, 1,
-3.258704, -0.4256468, -0.7066342, 1, 0, 0, 1, 1,
-3.186906, 0.3117456, -1.733423, 1, 0, 0, 1, 1,
-2.743726, 1.069142, -1.597469, 1, 0, 0, 1, 1,
-2.705136, 0.9814095, -2.057814, 1, 0, 0, 1, 1,
-2.512178, -1.075324, -3.181232, 1, 0, 0, 1, 1,
-2.490002, 0.966936, -3.095805, 0, 0, 0, 1, 1,
-2.316423, -1.263617, -1.752352, 0, 0, 0, 1, 1,
-2.271168, 1.354424, -1.555311, 0, 0, 0, 1, 1,
-2.241187, 0.2092575, -2.439672, 0, 0, 0, 1, 1,
-2.235671, -0.1229525, -0.7396961, 0, 0, 0, 1, 1,
-2.202999, 0.5720425, 1.772778, 0, 0, 0, 1, 1,
-2.157652, 0.1760543, -2.0809, 0, 0, 0, 1, 1,
-2.121727, -0.2435685, -1.146541, 1, 1, 1, 1, 1,
-2.118894, -0.2224075, -2.961333, 1, 1, 1, 1, 1,
-2.113921, -0.8909954, -1.367508, 1, 1, 1, 1, 1,
-2.069441, 0.3581361, -1.308889, 1, 1, 1, 1, 1,
-2.054317, -0.6442197, -2.977585, 1, 1, 1, 1, 1,
-2.041322, -1.682444, -0.953636, 1, 1, 1, 1, 1,
-2.034829, -1.633025, -1.226468, 1, 1, 1, 1, 1,
-2.02888, -0.2838426, -2.797071, 1, 1, 1, 1, 1,
-2.003648, 1.461374, -0.8273937, 1, 1, 1, 1, 1,
-1.996671, -0.08298266, -0.2821061, 1, 1, 1, 1, 1,
-1.989757, 0.6095001, -0.2636611, 1, 1, 1, 1, 1,
-1.972238, 0.4547029, -2.745977, 1, 1, 1, 1, 1,
-1.932535, 0.7264656, -2.561184, 1, 1, 1, 1, 1,
-1.920134, 0.9012961, 1.511518, 1, 1, 1, 1, 1,
-1.87579, 0.3418542, -2.469078, 1, 1, 1, 1, 1,
-1.848835, 0.8536319, 0.1537026, 0, 0, 1, 1, 1,
-1.842273, -0.4303778, -2.664074, 1, 0, 0, 1, 1,
-1.803766, -0.3353459, -1.597134, 1, 0, 0, 1, 1,
-1.774926, 1.503409, -1.343684, 1, 0, 0, 1, 1,
-1.763284, -1.232666, -0.9589273, 1, 0, 0, 1, 1,
-1.756813, -1.008267, -2.109368, 1, 0, 0, 1, 1,
-1.755932, -0.6476958, -1.925331, 0, 0, 0, 1, 1,
-1.738156, -0.9618332, -1.81234, 0, 0, 0, 1, 1,
-1.738071, -0.9919142, -2.247797, 0, 0, 0, 1, 1,
-1.737129, 1.370353, 0.2443181, 0, 0, 0, 1, 1,
-1.736272, 0.4758768, -0.3830427, 0, 0, 0, 1, 1,
-1.72359, 1.26507, 0.4272718, 0, 0, 0, 1, 1,
-1.722247, -0.5237173, -0.7493917, 0, 0, 0, 1, 1,
-1.720346, 0.3151086, -0.4648179, 1, 1, 1, 1, 1,
-1.670191, 0.5528131, 0.9135098, 1, 1, 1, 1, 1,
-1.639032, 0.105392, -1.663129, 1, 1, 1, 1, 1,
-1.637726, 0.5326076, -2.963446, 1, 1, 1, 1, 1,
-1.621448, -0.03751916, 0.09921675, 1, 1, 1, 1, 1,
-1.61806, -1.013917, -2.571546, 1, 1, 1, 1, 1,
-1.617645, -0.880515, -1.865136, 1, 1, 1, 1, 1,
-1.592318, 0.6761927, -2.363343, 1, 1, 1, 1, 1,
-1.591701, 0.5871485, -0.4278133, 1, 1, 1, 1, 1,
-1.591232, -0.679265, -1.470918, 1, 1, 1, 1, 1,
-1.588031, -0.78411, -3.516899, 1, 1, 1, 1, 1,
-1.584322, 0.3520634, -1.631541, 1, 1, 1, 1, 1,
-1.580285, 0.8041754, -1.467829, 1, 1, 1, 1, 1,
-1.576171, -0.2885409, -2.109794, 1, 1, 1, 1, 1,
-1.559349, 2.354217, -1.795986, 1, 1, 1, 1, 1,
-1.554729, -1.699015, -3.175759, 0, 0, 1, 1, 1,
-1.546807, -0.3012144, -3.008139, 1, 0, 0, 1, 1,
-1.546044, -0.1514904, -1.521331, 1, 0, 0, 1, 1,
-1.539613, -0.754855, -0.3209724, 1, 0, 0, 1, 1,
-1.538162, -0.05101109, -2.828215, 1, 0, 0, 1, 1,
-1.524826, -0.4462677, -1.317946, 1, 0, 0, 1, 1,
-1.508631, -1.46683, -0.8650741, 0, 0, 0, 1, 1,
-1.503706, 1.33246, -1.859954, 0, 0, 0, 1, 1,
-1.477766, -0.115003, -1.655507, 0, 0, 0, 1, 1,
-1.457442, 0.7635173, -3.395867, 0, 0, 0, 1, 1,
-1.449901, 0.4584788, -1.51987, 0, 0, 0, 1, 1,
-1.444025, -0.2691719, -0.3986471, 0, 0, 0, 1, 1,
-1.413215, -2.359367, -2.229522, 0, 0, 0, 1, 1,
-1.41295, -1.573302, -2.775149, 1, 1, 1, 1, 1,
-1.409552, 1.472733, -0.9101601, 1, 1, 1, 1, 1,
-1.408907, -1.68841, -2.017705, 1, 1, 1, 1, 1,
-1.400125, -0.6469617, -1.196988, 1, 1, 1, 1, 1,
-1.385946, -0.5662952, -1.125937, 1, 1, 1, 1, 1,
-1.373109, 0.3543471, -0.3600134, 1, 1, 1, 1, 1,
-1.371471, -0.805557, -2.713852, 1, 1, 1, 1, 1,
-1.369762, -0.02254252, -0.8595623, 1, 1, 1, 1, 1,
-1.364248, -1.209135, -2.873577, 1, 1, 1, 1, 1,
-1.363826, -0.949599, -2.794569, 1, 1, 1, 1, 1,
-1.363392, -1.319825, -2.812199, 1, 1, 1, 1, 1,
-1.361581, 1.090906, -0.2382275, 1, 1, 1, 1, 1,
-1.35679, -0.2524411, -4.101076, 1, 1, 1, 1, 1,
-1.355422, -0.2741559, -1.415735, 1, 1, 1, 1, 1,
-1.354554, -0.7247882, -0.1209988, 1, 1, 1, 1, 1,
-1.344752, -0.366413, -0.6728395, 0, 0, 1, 1, 1,
-1.3437, -0.2718284, -1.447909, 1, 0, 0, 1, 1,
-1.339217, -0.5744155, -1.002932, 1, 0, 0, 1, 1,
-1.33424, -0.3336475, -3.723612, 1, 0, 0, 1, 1,
-1.334131, -1.069922, -0.3789405, 1, 0, 0, 1, 1,
-1.333088, 1.356892, 0.07339178, 1, 0, 0, 1, 1,
-1.324518, -0.005292082, -1.92749, 0, 0, 0, 1, 1,
-1.318348, 1.979975, -0.6992146, 0, 0, 0, 1, 1,
-1.316355, -1.192724, -3.415871, 0, 0, 0, 1, 1,
-1.303248, -0.2805333, -3.209844, 0, 0, 0, 1, 1,
-1.301522, 0.4431015, -1.083068, 0, 0, 0, 1, 1,
-1.300539, -0.5911703, -3.402076, 0, 0, 0, 1, 1,
-1.298673, -0.1354494, -1.974422, 0, 0, 0, 1, 1,
-1.288141, 0.04305929, -1.291757, 1, 1, 1, 1, 1,
-1.274275, -1.195503, -3.114407, 1, 1, 1, 1, 1,
-1.264046, 0.5985987, -1.19299, 1, 1, 1, 1, 1,
-1.261564, -0.9938034, -2.411158, 1, 1, 1, 1, 1,
-1.253981, -0.1040942, -1.643734, 1, 1, 1, 1, 1,
-1.252108, -0.2576469, -1.212255, 1, 1, 1, 1, 1,
-1.23798, -0.2302628, -0.09841931, 1, 1, 1, 1, 1,
-1.227734, 0.05860003, 0.0063043, 1, 1, 1, 1, 1,
-1.218427, -1.105324, -0.9527751, 1, 1, 1, 1, 1,
-1.214646, -1.061314, -2.593288, 1, 1, 1, 1, 1,
-1.206345, 0.5717216, -1.713494, 1, 1, 1, 1, 1,
-1.20625, 0.01633048, -0.07815478, 1, 1, 1, 1, 1,
-1.1935, 0.5265471, -2.49072, 1, 1, 1, 1, 1,
-1.192548, -0.6051657, -2.128933, 1, 1, 1, 1, 1,
-1.18126, 0.141141, -1.955716, 1, 1, 1, 1, 1,
-1.170926, -2.891953, -1.883024, 0, 0, 1, 1, 1,
-1.160908, 0.1564392, -2.887199, 1, 0, 0, 1, 1,
-1.157399, 0.01116844, -0.7482942, 1, 0, 0, 1, 1,
-1.157333, 0.7117215, -0.5216379, 1, 0, 0, 1, 1,
-1.141037, 0.7700833, -1.06913, 1, 0, 0, 1, 1,
-1.13953, 1.461418, -1.122532, 1, 0, 0, 1, 1,
-1.139299, -1.354072, -1.72113, 0, 0, 0, 1, 1,
-1.136765, 0.170339, -0.490345, 0, 0, 0, 1, 1,
-1.134434, 0.6641015, -1.585358, 0, 0, 0, 1, 1,
-1.128114, 0.04604569, 0.5179988, 0, 0, 0, 1, 1,
-1.125278, 0.7005879, -0.059557, 0, 0, 0, 1, 1,
-1.120659, 0.4314179, -0.7486222, 0, 0, 0, 1, 1,
-1.120352, 1.015182, 1.207348, 0, 0, 0, 1, 1,
-1.119486, -1.106723, -3.292162, 1, 1, 1, 1, 1,
-1.112228, -1.104468, -2.572883, 1, 1, 1, 1, 1,
-1.111697, -2.014963, -3.420203, 1, 1, 1, 1, 1,
-1.105614, -0.6874364, -1.996544, 1, 1, 1, 1, 1,
-1.10357, 0.5110492, -0.3399583, 1, 1, 1, 1, 1,
-1.103024, 0.7682073, -1.006279, 1, 1, 1, 1, 1,
-1.10267, 1.554907, -2.3221, 1, 1, 1, 1, 1,
-1.097819, 0.2060674, -1.39985, 1, 1, 1, 1, 1,
-1.096942, -0.8555818, -1.242578, 1, 1, 1, 1, 1,
-1.096275, -0.3218927, -2.311577, 1, 1, 1, 1, 1,
-1.093875, 0.1263442, -1.279834, 1, 1, 1, 1, 1,
-1.088993, -0.3012322, -2.082411, 1, 1, 1, 1, 1,
-1.07771, -0.9368421, -3.121665, 1, 1, 1, 1, 1,
-1.072412, -1.052614, -1.345274, 1, 1, 1, 1, 1,
-1.067455, -0.614594, -1.705344, 1, 1, 1, 1, 1,
-1.064659, -1.377131, -2.297594, 0, 0, 1, 1, 1,
-1.055831, 0.03283009, -3.477056, 1, 0, 0, 1, 1,
-1.053322, 0.2711454, -2.301929, 1, 0, 0, 1, 1,
-1.052886, -0.1516484, -1.000343, 1, 0, 0, 1, 1,
-1.051568, 2.479627, 0.1150876, 1, 0, 0, 1, 1,
-1.047948, -2.185816, -1.934331, 1, 0, 0, 1, 1,
-1.04779, -1.294792, -2.516787, 0, 0, 0, 1, 1,
-1.042454, -0.8058383, -3.92293, 0, 0, 0, 1, 1,
-1.041276, 0.8792263, -1.96689, 0, 0, 0, 1, 1,
-1.018988, -1.070289, -2.024324, 0, 0, 0, 1, 1,
-1.015503, -0.5594338, -1.649677, 0, 0, 0, 1, 1,
-1.014498, -0.01328338, -1.711192, 0, 0, 0, 1, 1,
-0.9916321, -0.7881343, -3.856903, 0, 0, 0, 1, 1,
-0.9914569, -0.06224668, -1.878803, 1, 1, 1, 1, 1,
-0.9882882, 0.2164647, -0.1104477, 1, 1, 1, 1, 1,
-0.9732895, -0.6627538, -3.002797, 1, 1, 1, 1, 1,
-0.9722264, -0.4768861, -2.877115, 1, 1, 1, 1, 1,
-0.9710795, 0.3607709, -1.277084, 1, 1, 1, 1, 1,
-0.9679121, -0.9631642, -1.304322, 1, 1, 1, 1, 1,
-0.9627085, -0.5635439, -2.829933, 1, 1, 1, 1, 1,
-0.9622356, 0.2984485, -3.178805, 1, 1, 1, 1, 1,
-0.9619197, -1.107732, -3.741574, 1, 1, 1, 1, 1,
-0.9530894, 0.7457405, -1.173209, 1, 1, 1, 1, 1,
-0.9520087, -0.00542207, -2.425355, 1, 1, 1, 1, 1,
-0.9496767, -0.1123691, -2.886117, 1, 1, 1, 1, 1,
-0.9468999, 0.3822098, -2.103568, 1, 1, 1, 1, 1,
-0.9357151, 0.1498091, -0.0580738, 1, 1, 1, 1, 1,
-0.9336497, -0.6105808, -1.762701, 1, 1, 1, 1, 1,
-0.932988, -0.104887, -2.658483, 0, 0, 1, 1, 1,
-0.9266754, 1.971643, -1.594294, 1, 0, 0, 1, 1,
-0.9230022, 0.6799643, -0.5409685, 1, 0, 0, 1, 1,
-0.9212093, -0.149758, -0.5901053, 1, 0, 0, 1, 1,
-0.9099437, 1.079275, -0.5843008, 1, 0, 0, 1, 1,
-0.9076359, -0.1410828, -2.094569, 1, 0, 0, 1, 1,
-0.9036134, 1.508622, -0.9758723, 0, 0, 0, 1, 1,
-0.9035257, 0.9441156, -0.1185879, 0, 0, 0, 1, 1,
-0.9011746, -0.5935428, -2.417352, 0, 0, 0, 1, 1,
-0.90015, -0.7342091, -1.365017, 0, 0, 0, 1, 1,
-0.8993081, 0.7855653, -1.371208, 0, 0, 0, 1, 1,
-0.8936224, -0.634467, -2.176675, 0, 0, 0, 1, 1,
-0.8889927, -1.128801, -2.282288, 0, 0, 0, 1, 1,
-0.8885006, -1.52437, -3.981515, 1, 1, 1, 1, 1,
-0.8880746, -0.9695185, -2.39843, 1, 1, 1, 1, 1,
-0.8819713, 0.214876, -2.2066, 1, 1, 1, 1, 1,
-0.8817995, 0.7130156, -1.837403, 1, 1, 1, 1, 1,
-0.8817617, -0.6354269, -0.4587399, 1, 1, 1, 1, 1,
-0.8808101, 0.7137933, -0.5424674, 1, 1, 1, 1, 1,
-0.8754158, 0.8870233, -0.5466569, 1, 1, 1, 1, 1,
-0.8747003, -2.068897, -3.567113, 1, 1, 1, 1, 1,
-0.8730291, -1.656265, -3.906127, 1, 1, 1, 1, 1,
-0.868667, -0.7308842, -4.310202, 1, 1, 1, 1, 1,
-0.864819, -0.2474407, -3.258829, 1, 1, 1, 1, 1,
-0.8625853, 0.8342924, -1.89373, 1, 1, 1, 1, 1,
-0.8525001, -1.167067, -2.29889, 1, 1, 1, 1, 1,
-0.8441388, -0.0753829, -3.413596, 1, 1, 1, 1, 1,
-0.8415993, -1.226052, -2.145951, 1, 1, 1, 1, 1,
-0.8394079, -0.003270123, -1.281497, 0, 0, 1, 1, 1,
-0.8384719, -1.443733, -1.812102, 1, 0, 0, 1, 1,
-0.8302734, -1.808437, -0.6769662, 1, 0, 0, 1, 1,
-0.8270963, 1.027183, -0.3403814, 1, 0, 0, 1, 1,
-0.8247809, 0.1805934, -1.767105, 1, 0, 0, 1, 1,
-0.8187506, 0.3026024, -2.084306, 1, 0, 0, 1, 1,
-0.8176091, 0.4778065, -0.5526872, 0, 0, 0, 1, 1,
-0.8127236, 1.046942, 0.8358406, 0, 0, 0, 1, 1,
-0.8126524, 0.7910166, 0.6581608, 0, 0, 0, 1, 1,
-0.8071612, 1.554164, -1.046032, 0, 0, 0, 1, 1,
-0.8041337, 0.7154605, -0.3053039, 0, 0, 0, 1, 1,
-0.8036529, -0.1842606, 0.2279512, 0, 0, 0, 1, 1,
-0.7979505, 0.5121951, 0.1698578, 0, 0, 0, 1, 1,
-0.7970508, -2.546721, -3.228863, 1, 1, 1, 1, 1,
-0.7951283, 0.9908803, -1.997708, 1, 1, 1, 1, 1,
-0.7940794, -0.8497134, -3.379466, 1, 1, 1, 1, 1,
-0.7928593, -1.521657, -2.556921, 1, 1, 1, 1, 1,
-0.790862, -0.806768, -2.822987, 1, 1, 1, 1, 1,
-0.7899652, -0.2170768, -0.8782339, 1, 1, 1, 1, 1,
-0.7896378, 0.2694893, -1.480207, 1, 1, 1, 1, 1,
-0.7878606, 1.119081, -1.451687, 1, 1, 1, 1, 1,
-0.7820258, -0.3917499, -1.351483, 1, 1, 1, 1, 1,
-0.7815903, -0.9416023, -2.330255, 1, 1, 1, 1, 1,
-0.773747, 0.1880288, -1.430606, 1, 1, 1, 1, 1,
-0.7679495, -0.1301381, -0.6942123, 1, 1, 1, 1, 1,
-0.7671196, 0.2426792, -3.035003, 1, 1, 1, 1, 1,
-0.7655776, -1.049952, -1.800607, 1, 1, 1, 1, 1,
-0.7613079, 0.3951536, -2.069211, 1, 1, 1, 1, 1,
-0.756375, 0.3931181, 0.3792676, 0, 0, 1, 1, 1,
-0.7559974, -0.3646798, -1.924556, 1, 0, 0, 1, 1,
-0.7480786, 0.6716146, -2.455447, 1, 0, 0, 1, 1,
-0.7442039, 0.9703594, -2.318341, 1, 0, 0, 1, 1,
-0.7430869, -0.391297, -1.762657, 1, 0, 0, 1, 1,
-0.7414243, -0.1192868, -3.317476, 1, 0, 0, 1, 1,
-0.7404252, 1.110798, -0.1223612, 0, 0, 0, 1, 1,
-0.732805, 1.582884, -0.5844201, 0, 0, 0, 1, 1,
-0.7243457, -1.923277, -3.994957, 0, 0, 0, 1, 1,
-0.7207063, -1.162941, -2.127571, 0, 0, 0, 1, 1,
-0.7199513, 0.6394309, -1.695385, 0, 0, 0, 1, 1,
-0.718565, 1.106258, -1.445303, 0, 0, 0, 1, 1,
-0.7170979, -0.3148849, -3.025579, 0, 0, 0, 1, 1,
-0.7154172, -0.5658658, -1.885662, 1, 1, 1, 1, 1,
-0.7033545, 1.303721, 1.666537, 1, 1, 1, 1, 1,
-0.6977497, -1.632658, -2.495312, 1, 1, 1, 1, 1,
-0.6958978, -0.1696375, -1.056821, 1, 1, 1, 1, 1,
-0.6918849, 1.272432, 1.014684, 1, 1, 1, 1, 1,
-0.6879564, 2.062234, -0.9815363, 1, 1, 1, 1, 1,
-0.6861205, 0.6828933, -0.8407547, 1, 1, 1, 1, 1,
-0.6815687, 0.3306121, 1.088787, 1, 1, 1, 1, 1,
-0.6813875, 0.1659312, -2.355936, 1, 1, 1, 1, 1,
-0.6794937, 1.250447, 0.3030786, 1, 1, 1, 1, 1,
-0.676003, 2.111361, -0.9059547, 1, 1, 1, 1, 1,
-0.6706164, -2.069994, -0.8995371, 1, 1, 1, 1, 1,
-0.669458, -0.5365548, -0.2105765, 1, 1, 1, 1, 1,
-0.668692, -0.289394, -0.3285547, 1, 1, 1, 1, 1,
-0.6627847, -0.812286, -3.153817, 1, 1, 1, 1, 1,
-0.6579915, 1.431667, -2.246516, 0, 0, 1, 1, 1,
-0.6575906, -0.2268104, -3.101246, 1, 0, 0, 1, 1,
-0.6573738, 1.209319, -1.289908, 1, 0, 0, 1, 1,
-0.6560236, -0.1487049, -0.6065646, 1, 0, 0, 1, 1,
-0.6544445, 1.726135, 1.166103, 1, 0, 0, 1, 1,
-0.6518179, 0.447463, -1.369094, 1, 0, 0, 1, 1,
-0.6515605, 0.4987656, 0.07306099, 0, 0, 0, 1, 1,
-0.6514806, 1.376522, -0.5753082, 0, 0, 0, 1, 1,
-0.6467136, 1.205446, 0.6699463, 0, 0, 0, 1, 1,
-0.643266, 0.712488, -0.3497121, 0, 0, 0, 1, 1,
-0.6432647, -0.1235944, -2.799515, 0, 0, 0, 1, 1,
-0.6406112, -1.351673, -2.778732, 0, 0, 0, 1, 1,
-0.6349391, -1.121134, -2.882416, 0, 0, 0, 1, 1,
-0.6249273, 1.281492, -0.6094479, 1, 1, 1, 1, 1,
-0.6213067, 0.6499673, -1.915445, 1, 1, 1, 1, 1,
-0.6208336, 0.1828538, -2.117214, 1, 1, 1, 1, 1,
-0.6149321, 1.341872, 0.3598471, 1, 1, 1, 1, 1,
-0.6078665, -1.593171, -4.90951, 1, 1, 1, 1, 1,
-0.6065453, -0.9777973, -3.949759, 1, 1, 1, 1, 1,
-0.6038477, 1.674886, 0.3792545, 1, 1, 1, 1, 1,
-0.6030727, -0.4395082, -3.615055, 1, 1, 1, 1, 1,
-0.6024982, -1.460906, -2.127502, 1, 1, 1, 1, 1,
-0.5998688, 0.5969931, -0.5706199, 1, 1, 1, 1, 1,
-0.5889722, 0.3843844, -2.090225, 1, 1, 1, 1, 1,
-0.5863264, 1.034865, -0.7482631, 1, 1, 1, 1, 1,
-0.5840642, -0.3645123, -2.183692, 1, 1, 1, 1, 1,
-0.5834045, 0.7840058, -0.95807, 1, 1, 1, 1, 1,
-0.5827223, 0.4533445, -1.701787, 1, 1, 1, 1, 1,
-0.5824487, -1.483825, -2.572083, 0, 0, 1, 1, 1,
-0.5781616, -1.542949, -2.846685, 1, 0, 0, 1, 1,
-0.5752674, 0.6223452, -0.3414069, 1, 0, 0, 1, 1,
-0.5711157, 0.05628093, -1.397569, 1, 0, 0, 1, 1,
-0.5658446, -2.001506, -4.513995, 1, 0, 0, 1, 1,
-0.5627362, 0.1389171, -1.44744, 1, 0, 0, 1, 1,
-0.5620938, 1.752104, -0.2247687, 0, 0, 0, 1, 1,
-0.5610827, -2.149309, -2.655864, 0, 0, 0, 1, 1,
-0.5594369, 2.22865, 0.9969399, 0, 0, 0, 1, 1,
-0.5542549, -1.315942, -3.083776, 0, 0, 0, 1, 1,
-0.5427215, 1.595137, -0.9344638, 0, 0, 0, 1, 1,
-0.5365212, -0.7792585, -4.612855, 0, 0, 0, 1, 1,
-0.5312588, -0.1192208, -0.8329194, 0, 0, 0, 1, 1,
-0.5290476, -1.996395, -0.7389573, 1, 1, 1, 1, 1,
-0.5273004, -0.7622457, -2.053406, 1, 1, 1, 1, 1,
-0.5249134, -0.6798052, -0.3323166, 1, 1, 1, 1, 1,
-0.5248218, 1.63586, -0.548103, 1, 1, 1, 1, 1,
-0.5204873, -1.98511, -2.756268, 1, 1, 1, 1, 1,
-0.5162112, -0.4031909, -3.373718, 1, 1, 1, 1, 1,
-0.5137714, -0.02384374, -0.6458488, 1, 1, 1, 1, 1,
-0.5093905, 1.055657, -1.970481, 1, 1, 1, 1, 1,
-0.5058988, 1.148883, -0.1785684, 1, 1, 1, 1, 1,
-0.5033824, 0.7542914, -0.2183299, 1, 1, 1, 1, 1,
-0.4990281, 1.668867, -1.084368, 1, 1, 1, 1, 1,
-0.4916276, -0.9682701, -1.954728, 1, 1, 1, 1, 1,
-0.4844763, 0.1463893, -2.582556, 1, 1, 1, 1, 1,
-0.4843723, -1.117914, -3.215427, 1, 1, 1, 1, 1,
-0.4762987, -0.1537774, -2.33977, 1, 1, 1, 1, 1,
-0.4731491, -0.5088333, -2.975605, 0, 0, 1, 1, 1,
-0.4660813, -0.126621, -1.869964, 1, 0, 0, 1, 1,
-0.4645353, 0.2573004, -1.886876, 1, 0, 0, 1, 1,
-0.4616036, 0.3534447, -1.384801, 1, 0, 0, 1, 1,
-0.458818, -0.9758735, -1.723187, 1, 0, 0, 1, 1,
-0.4585846, 1.410535, -0.2739581, 1, 0, 0, 1, 1,
-0.4584235, 0.06142159, -0.5049666, 0, 0, 0, 1, 1,
-0.4562784, 1.659413, -1.754611, 0, 0, 0, 1, 1,
-0.4562074, 0.1932352, -0.6157311, 0, 0, 0, 1, 1,
-0.455898, -0.5475785, -2.489134, 0, 0, 0, 1, 1,
-0.453366, -0.976953, -2.551543, 0, 0, 0, 1, 1,
-0.4527874, 0.09979196, -0.2370312, 0, 0, 0, 1, 1,
-0.4505304, 1.22639, -1.333663, 0, 0, 0, 1, 1,
-0.4481849, 2.086216, 0.1093406, 1, 1, 1, 1, 1,
-0.4436557, -0.5926265, -3.009368, 1, 1, 1, 1, 1,
-0.4411953, 0.6958725, 0.07545558, 1, 1, 1, 1, 1,
-0.4390821, 2.076349, -1.426322, 1, 1, 1, 1, 1,
-0.4350216, 0.4997039, -1.350031, 1, 1, 1, 1, 1,
-0.4337001, 1.242929, 0.4693673, 1, 1, 1, 1, 1,
-0.4313937, 2.03597, -0.05916051, 1, 1, 1, 1, 1,
-0.4312674, 2.156034, -0.147311, 1, 1, 1, 1, 1,
-0.4285242, 0.6370832, -1.000957, 1, 1, 1, 1, 1,
-0.4275179, -0.1779389, -2.989932, 1, 1, 1, 1, 1,
-0.4274366, -0.4709356, -2.297566, 1, 1, 1, 1, 1,
-0.427037, -0.1004543, -2.228831, 1, 1, 1, 1, 1,
-0.4264604, 0.2393454, -0.1121674, 1, 1, 1, 1, 1,
-0.4151886, -0.4703573, -2.86331, 1, 1, 1, 1, 1,
-0.4121098, 1.289119, -0.5801609, 1, 1, 1, 1, 1,
-0.411913, -0.5428244, -0.9245333, 0, 0, 1, 1, 1,
-0.4088342, -0.5875034, -4.258589, 1, 0, 0, 1, 1,
-0.4047898, 0.0009355288, -1.798442, 1, 0, 0, 1, 1,
-0.4036066, 0.8863991, 0.3936613, 1, 0, 0, 1, 1,
-0.4016104, -1.884103, -3.370988, 1, 0, 0, 1, 1,
-0.3992448, 0.7631551, -1.019784, 1, 0, 0, 1, 1,
-0.3938571, 0.6016, -1.850495, 0, 0, 0, 1, 1,
-0.3875884, 0.08345756, -1.222281, 0, 0, 0, 1, 1,
-0.3806095, 0.4466491, 0.1898738, 0, 0, 0, 1, 1,
-0.3779585, -0.0940706, -2.254174, 0, 0, 0, 1, 1,
-0.3764322, -2.046799, -2.084981, 0, 0, 0, 1, 1,
-0.3729159, -0.7850023, -2.165744, 0, 0, 0, 1, 1,
-0.3705461, -0.9288719, -2.367833, 0, 0, 0, 1, 1,
-0.3703773, 0.06934142, -0.4748431, 1, 1, 1, 1, 1,
-0.3698198, -0.4506164, -2.752481, 1, 1, 1, 1, 1,
-0.3692319, -0.9270034, -3.205529, 1, 1, 1, 1, 1,
-0.3628435, -0.07069458, -1.301554, 1, 1, 1, 1, 1,
-0.3622471, -0.8508468, -2.809294, 1, 1, 1, 1, 1,
-0.3610007, -0.68251, -2.767959, 1, 1, 1, 1, 1,
-0.3547333, 0.7081605, -1.060916, 1, 1, 1, 1, 1,
-0.354696, 0.03660564, -1.183737, 1, 1, 1, 1, 1,
-0.35292, -1.611849, -2.979704, 1, 1, 1, 1, 1,
-0.3503326, -0.8022082, -3.552342, 1, 1, 1, 1, 1,
-0.3451243, 1.207487, -0.2864268, 1, 1, 1, 1, 1,
-0.3414076, 0.4618836, -1.19575, 1, 1, 1, 1, 1,
-0.3389094, -1.404183, -1.622794, 1, 1, 1, 1, 1,
-0.3379866, 0.1743101, -1.767043, 1, 1, 1, 1, 1,
-0.3373697, 0.2163614, -0.5962504, 1, 1, 1, 1, 1,
-0.3324078, 1.170532, 1.052372, 0, 0, 1, 1, 1,
-0.3316416, -0.4080039, -2.099304, 1, 0, 0, 1, 1,
-0.3266126, 0.5536364, -0.1704404, 1, 0, 0, 1, 1,
-0.3209168, 0.9050791, 1.069634, 1, 0, 0, 1, 1,
-0.3164501, -0.5119054, -2.416325, 1, 0, 0, 1, 1,
-0.3158055, -1.026222, -2.342609, 1, 0, 0, 1, 1,
-0.3127795, -0.3424483, -1.972677, 0, 0, 0, 1, 1,
-0.3120142, 0.7954009, -1.680971, 0, 0, 0, 1, 1,
-0.3098386, -0.1160557, -3.555165, 0, 0, 0, 1, 1,
-0.307579, -1.652534, -3.905161, 0, 0, 0, 1, 1,
-0.3046149, 0.9737341, 0.01699941, 0, 0, 0, 1, 1,
-0.303358, 0.9862479, -1.03909, 0, 0, 0, 1, 1,
-0.3018436, -1.347315, -2.559903, 0, 0, 0, 1, 1,
-0.2965922, -1.34961, -3.401345, 1, 1, 1, 1, 1,
-0.2948856, -0.8200772, -1.759675, 1, 1, 1, 1, 1,
-0.2916166, -0.01256249, -1.219865, 1, 1, 1, 1, 1,
-0.2912254, -0.3104726, -0.914937, 1, 1, 1, 1, 1,
-0.2906, -1.540285, -3.130674, 1, 1, 1, 1, 1,
-0.2894671, 0.9312363, -1.339939, 1, 1, 1, 1, 1,
-0.2851804, -0.6389441, -3.694192, 1, 1, 1, 1, 1,
-0.2806833, 1.724474, -1.44121, 1, 1, 1, 1, 1,
-0.2768465, 0.6843039, -2.10252, 1, 1, 1, 1, 1,
-0.2764134, 1.097705, 0.5713162, 1, 1, 1, 1, 1,
-0.2748315, 1.112811, -0.9126632, 1, 1, 1, 1, 1,
-0.2723736, 1.348923, -1.459323, 1, 1, 1, 1, 1,
-0.2681641, -0.5451922, -1.458147, 1, 1, 1, 1, 1,
-0.2672486, 1.327891, -0.880428, 1, 1, 1, 1, 1,
-0.2659003, -0.469148, -3.227443, 1, 1, 1, 1, 1,
-0.265338, 1.984743, 0.6651846, 0, 0, 1, 1, 1,
-0.2575015, -0.3478229, -1.654017, 1, 0, 0, 1, 1,
-0.2554969, -0.2101711, -2.347101, 1, 0, 0, 1, 1,
-0.2549042, -0.1913689, -2.251181, 1, 0, 0, 1, 1,
-0.2519422, -0.1090596, -1.625027, 1, 0, 0, 1, 1,
-0.2513237, -0.8691992, -1.478391, 1, 0, 0, 1, 1,
-0.2502609, -1.295953, -2.416096, 0, 0, 0, 1, 1,
-0.2497244, 1.795591, -0.5972659, 0, 0, 0, 1, 1,
-0.2482329, -1.642354, -5.074365, 0, 0, 0, 1, 1,
-0.2473159, 0.2651782, 0.4084791, 0, 0, 0, 1, 1,
-0.2451908, 0.7568277, -2.386611, 0, 0, 0, 1, 1,
-0.2442147, -0.8766263, -1.986885, 0, 0, 0, 1, 1,
-0.2439924, -0.6104186, -3.408126, 0, 0, 0, 1, 1,
-0.2431586, -1.528445, -2.868211, 1, 1, 1, 1, 1,
-0.2350895, 0.2955943, 0.92476, 1, 1, 1, 1, 1,
-0.2316345, -1.036232, -2.794766, 1, 1, 1, 1, 1,
-0.2312221, 1.538969, -0.4321434, 1, 1, 1, 1, 1,
-0.2310518, -0.7704363, -2.908994, 1, 1, 1, 1, 1,
-0.2299581, -0.7648938, -2.205054, 1, 1, 1, 1, 1,
-0.2285086, 0.001785105, -2.324007, 1, 1, 1, 1, 1,
-0.2277667, 1.180848, -0.05116718, 1, 1, 1, 1, 1,
-0.2235289, -2.080886, -2.011894, 1, 1, 1, 1, 1,
-0.2192425, -0.5092576, -4.502453, 1, 1, 1, 1, 1,
-0.2159401, 0.02090707, -1.362841, 1, 1, 1, 1, 1,
-0.2156562, -0.07447062, -2.066107, 1, 1, 1, 1, 1,
-0.2152305, 2.296228, 2.060211, 1, 1, 1, 1, 1,
-0.21467, 1.2334, -0.2051356, 1, 1, 1, 1, 1,
-0.2095808, 1.022683, -0.9815661, 1, 1, 1, 1, 1,
-0.2085639, -0.658883, -2.286059, 0, 0, 1, 1, 1,
-0.2012096, 0.07228458, -0.8731112, 1, 0, 0, 1, 1,
-0.1961016, -0.2424018, -3.520677, 1, 0, 0, 1, 1,
-0.1955629, -0.5063519, -2.975023, 1, 0, 0, 1, 1,
-0.1910536, -1.776384, -2.522453, 1, 0, 0, 1, 1,
-0.182603, -0.7271578, -2.746662, 1, 0, 0, 1, 1,
-0.1821602, -0.3418447, -4.016172, 0, 0, 0, 1, 1,
-0.1815547, -1.134459, -2.533874, 0, 0, 0, 1, 1,
-0.1811148, 0.2623035, -1.244119, 0, 0, 0, 1, 1,
-0.1805107, 0.240699, 1.795282, 0, 0, 0, 1, 1,
-0.1802484, 0.8326733, 3.040047, 0, 0, 0, 1, 1,
-0.1787052, -0.7235876, -3.065542, 0, 0, 0, 1, 1,
-0.1749563, 0.05188427, -0.3999934, 0, 0, 0, 1, 1,
-0.1748446, -0.9887578, -2.95617, 1, 1, 1, 1, 1,
-0.1746571, 0.3935769, -0.05743079, 1, 1, 1, 1, 1,
-0.172417, -0.1931697, -4.239722, 1, 1, 1, 1, 1,
-0.1705982, 1.01133, -2.427445, 1, 1, 1, 1, 1,
-0.1698083, 0.6147396, -0.8645563, 1, 1, 1, 1, 1,
-0.1680009, -0.8179737, -3.541202, 1, 1, 1, 1, 1,
-0.1639396, 1.31058, -0.6432578, 1, 1, 1, 1, 1,
-0.1628452, -0.2964295, -2.937897, 1, 1, 1, 1, 1,
-0.1626694, -0.1214369, -1.319521, 1, 1, 1, 1, 1,
-0.1466982, 1.897903, -1.228315, 1, 1, 1, 1, 1,
-0.1448888, 0.91598, -1.72386, 1, 1, 1, 1, 1,
-0.1400526, 2.105023, -0.3771915, 1, 1, 1, 1, 1,
-0.1388116, -1.481998, -2.312136, 1, 1, 1, 1, 1,
-0.1387216, -0.913783, -2.481147, 1, 1, 1, 1, 1,
-0.1310052, -1.732788, -1.430951, 1, 1, 1, 1, 1,
-0.1302987, -1.718128, -4.782451, 0, 0, 1, 1, 1,
-0.1279986, -1.007951, -3.125988, 1, 0, 0, 1, 1,
-0.1278083, -0.7381614, -2.482157, 1, 0, 0, 1, 1,
-0.125878, 1.047988, -2.057237, 1, 0, 0, 1, 1,
-0.1239439, 0.8210566, 1.138278, 1, 0, 0, 1, 1,
-0.1237638, 0.3807563, 0.8315246, 1, 0, 0, 1, 1,
-0.1234337, 0.1346095, 0.8343841, 0, 0, 0, 1, 1,
-0.1146265, -0.0288972, -2.086728, 0, 0, 0, 1, 1,
-0.1109125, -0.2350193, -4.293925, 0, 0, 0, 1, 1,
-0.1101959, -0.9198902, -2.903199, 0, 0, 0, 1, 1,
-0.1095503, -0.03934796, -2.700453, 0, 0, 0, 1, 1,
-0.1074659, 2.244026, 0.586983, 0, 0, 0, 1, 1,
-0.1056608, 0.2460065, -0.7972826, 0, 0, 0, 1, 1,
-0.1044124, 1.300305, -0.4671966, 1, 1, 1, 1, 1,
-0.1031262, 1.356761, 0.3861864, 1, 1, 1, 1, 1,
-0.09992845, -1.844069, -1.988413, 1, 1, 1, 1, 1,
-0.09575368, 0.3920088, -0.8429509, 1, 1, 1, 1, 1,
-0.09544351, -0.5495456, -3.71287, 1, 1, 1, 1, 1,
-0.08821495, -0.1044014, -2.531137, 1, 1, 1, 1, 1,
-0.08762213, 0.6855083, 0.2546016, 1, 1, 1, 1, 1,
-0.08247277, 1.184296, -0.1566035, 1, 1, 1, 1, 1,
-0.07206753, 0.5962821, 1.141523, 1, 1, 1, 1, 1,
-0.06968205, -0.3292385, -3.032004, 1, 1, 1, 1, 1,
-0.05023839, -0.5525924, -3.348955, 1, 1, 1, 1, 1,
-0.0493369, -0.5524693, -2.74763, 1, 1, 1, 1, 1,
-0.03444772, -1.346572, -3.192291, 1, 1, 1, 1, 1,
-0.03289296, 0.3661894, -0.7415587, 1, 1, 1, 1, 1,
-0.02865327, 1.014049, 2.402978, 1, 1, 1, 1, 1,
-0.02718799, 0.7679271, 0.4810371, 0, 0, 1, 1, 1,
-0.02647991, -0.415099, -2.076436, 1, 0, 0, 1, 1,
-0.02281511, 0.2109303, -0.6552079, 1, 0, 0, 1, 1,
-0.008134207, -0.6682483, -5.193515, 1, 0, 0, 1, 1,
-0.006352653, -0.6938426, -1.674805, 1, 0, 0, 1, 1,
-0.004721272, 0.4931839, -0.3485075, 1, 0, 0, 1, 1,
-0.003444283, -0.7212852, -3.903818, 0, 0, 0, 1, 1,
-0.003391977, 0.6836401, 0.2633692, 0, 0, 0, 1, 1,
-0.00240491, -1.032297, -4.47206, 0, 0, 0, 1, 1,
-0.001766098, -0.8571504, -1.747531, 0, 0, 0, 1, 1,
-0.00055357, 1.314169, 1.148604, 0, 0, 0, 1, 1,
0.0001488072, 0.3685668, 0.5785447, 0, 0, 0, 1, 1,
0.001551982, 1.130839, 0.3484934, 0, 0, 0, 1, 1,
0.001581321, 1.0768, -1.659173, 1, 1, 1, 1, 1,
0.00329202, -0.008582694, 2.836401, 1, 1, 1, 1, 1,
0.005253688, -1.50819, 2.777973, 1, 1, 1, 1, 1,
0.01030346, 0.4564411, 1.111148, 1, 1, 1, 1, 1,
0.01522586, 0.9882717, 1.28826, 1, 1, 1, 1, 1,
0.01647731, -0.8923314, 4.162684, 1, 1, 1, 1, 1,
0.02730966, 1.426835, 0.9563459, 1, 1, 1, 1, 1,
0.02878767, -0.684293, 1.787947, 1, 1, 1, 1, 1,
0.03214528, 0.06337167, 1.464392, 1, 1, 1, 1, 1,
0.03397256, 1.258435, 0.8149332, 1, 1, 1, 1, 1,
0.04209816, 0.1641178, 0.5172487, 1, 1, 1, 1, 1,
0.04330511, 0.01178818, -0.5250812, 1, 1, 1, 1, 1,
0.04430071, 1.175479, -0.789739, 1, 1, 1, 1, 1,
0.04633745, 2.774702, -0.9560221, 1, 1, 1, 1, 1,
0.04699524, -0.460876, 4.257947, 1, 1, 1, 1, 1,
0.04714575, -1.748055, 5.110505, 0, 0, 1, 1, 1,
0.04750909, 1.712327, -0.427826, 1, 0, 0, 1, 1,
0.04892093, -0.7494487, 2.073374, 1, 0, 0, 1, 1,
0.05008686, -0.6510966, 3.339941, 1, 0, 0, 1, 1,
0.05058107, 0.4414796, -0.5164593, 1, 0, 0, 1, 1,
0.05192793, 0.2332726, 0.2207602, 1, 0, 0, 1, 1,
0.0546346, -0.5945908, 3.563705, 0, 0, 0, 1, 1,
0.0551935, 0.6292979, -1.078548, 0, 0, 0, 1, 1,
0.05648005, 0.4894488, -0.7428359, 0, 0, 0, 1, 1,
0.05683884, -1.028216, 1.997035, 0, 0, 0, 1, 1,
0.05876338, 1.656219, -0.925724, 0, 0, 0, 1, 1,
0.06063489, 2.381899, 1.01755, 0, 0, 0, 1, 1,
0.0609045, -1.406361, 2.828456, 0, 0, 0, 1, 1,
0.06292258, -0.1535378, 3.434033, 1, 1, 1, 1, 1,
0.06500459, -0.9463129, 2.717059, 1, 1, 1, 1, 1,
0.06662641, 0.5372605, 0.3430617, 1, 1, 1, 1, 1,
0.06725021, 0.4417441, 2.307203, 1, 1, 1, 1, 1,
0.07018766, 1.56248, 0.7050952, 1, 1, 1, 1, 1,
0.07513871, 1.932173, 0.4458531, 1, 1, 1, 1, 1,
0.07563997, 0.6551704, 0.5692378, 1, 1, 1, 1, 1,
0.07848021, 0.3974906, -0.3018937, 1, 1, 1, 1, 1,
0.08175665, -0.496694, 2.358068, 1, 1, 1, 1, 1,
0.08307897, -0.738843, 1.742862, 1, 1, 1, 1, 1,
0.08378457, 0.9591866, 1.106813, 1, 1, 1, 1, 1,
0.08513919, 0.5665894, -0.1168107, 1, 1, 1, 1, 1,
0.08929333, -1.715558, 4.584029, 1, 1, 1, 1, 1,
0.09361333, -1.121627, 2.625761, 1, 1, 1, 1, 1,
0.09506077, 0.2250564, -1.260918, 1, 1, 1, 1, 1,
0.09603124, -0.8683938, 4.41887, 0, 0, 1, 1, 1,
0.09671902, -0.5323248, 2.863774, 1, 0, 0, 1, 1,
0.098589, 2.889049, -1.415403, 1, 0, 0, 1, 1,
0.1004607, 1.976708, 0.4174861, 1, 0, 0, 1, 1,
0.1007824, -1.650512, 3.783992, 1, 0, 0, 1, 1,
0.1012497, -0.5987861, 0.09410723, 1, 0, 0, 1, 1,
0.1017005, -0.1126146, 2.045942, 0, 0, 0, 1, 1,
0.1033644, -0.08484258, 1.748306, 0, 0, 0, 1, 1,
0.1040816, -0.6252251, 3.364722, 0, 0, 0, 1, 1,
0.1052216, -0.7907456, 1.901401, 0, 0, 0, 1, 1,
0.1056722, 0.5533562, 0.3542242, 0, 0, 0, 1, 1,
0.1122796, 1.924486, 0.271502, 0, 0, 0, 1, 1,
0.1218331, 1.156944, 1.438906, 0, 0, 0, 1, 1,
0.1223024, -0.1588783, 3.502408, 1, 1, 1, 1, 1,
0.1233259, -0.7250929, 3.273777, 1, 1, 1, 1, 1,
0.125118, -0.6722518, 4.655746, 1, 1, 1, 1, 1,
0.1268172, -0.2512151, 3.735065, 1, 1, 1, 1, 1,
0.12847, 0.4157555, -0.2859998, 1, 1, 1, 1, 1,
0.1365151, -2.039465, 3.257525, 1, 1, 1, 1, 1,
0.1400239, 0.009443842, 0.3629707, 1, 1, 1, 1, 1,
0.1451494, 0.1798337, 0.3336738, 1, 1, 1, 1, 1,
0.1538984, -0.7647092, 4.010236, 1, 1, 1, 1, 1,
0.1546941, 0.4741688, 0.9331292, 1, 1, 1, 1, 1,
0.1583673, 2.044066, -0.07955092, 1, 1, 1, 1, 1,
0.1611618, -1.00557, 2.304896, 1, 1, 1, 1, 1,
0.1652545, 0.245483, -0.4687415, 1, 1, 1, 1, 1,
0.1710633, 0.05281132, 2.128339, 1, 1, 1, 1, 1,
0.1732171, 0.1906114, 0.8512104, 1, 1, 1, 1, 1,
0.1732644, 0.3840278, 0.8542461, 0, 0, 1, 1, 1,
0.1768143, -0.6005501, 3.000902, 1, 0, 0, 1, 1,
0.1771224, -0.9847708, 2.906787, 1, 0, 0, 1, 1,
0.1789484, -1.035814, 3.709773, 1, 0, 0, 1, 1,
0.1811457, -0.6209254, 2.91359, 1, 0, 0, 1, 1,
0.1814567, -0.01067539, 2.522281, 1, 0, 0, 1, 1,
0.1820493, 0.4961376, -1.295871, 0, 0, 0, 1, 1,
0.1916923, -0.09644656, 2.242929, 0, 0, 0, 1, 1,
0.1936445, -1.01125, 2.251792, 0, 0, 0, 1, 1,
0.1940752, -0.9185907, 1.603554, 0, 0, 0, 1, 1,
0.199219, 1.528383, 1.192312, 0, 0, 0, 1, 1,
0.2031066, 1.454133, -0.2730928, 0, 0, 0, 1, 1,
0.2060943, -1.102992, 3.096848, 0, 0, 0, 1, 1,
0.2078116, 0.0001275776, 0.4194663, 1, 1, 1, 1, 1,
0.209897, 2.317356, 0.6220657, 1, 1, 1, 1, 1,
0.2125337, -2.229947, 4.444075, 1, 1, 1, 1, 1,
0.2128865, 0.1410492, 1.097944, 1, 1, 1, 1, 1,
0.2173617, 2.296265, -0.6164765, 1, 1, 1, 1, 1,
0.2234447, 0.06731054, 3.087005, 1, 1, 1, 1, 1,
0.224263, 1.999321, 0.8396366, 1, 1, 1, 1, 1,
0.2245744, -0.6222386, 4.034091, 1, 1, 1, 1, 1,
0.2250639, 1.624583, 0.2017525, 1, 1, 1, 1, 1,
0.2328353, 0.2003623, -0.9352512, 1, 1, 1, 1, 1,
0.2332233, -1.128359, 2.513424, 1, 1, 1, 1, 1,
0.2332665, 0.1070119, 0.1818293, 1, 1, 1, 1, 1,
0.2333596, 0.1216865, 0.08269738, 1, 1, 1, 1, 1,
0.2336313, -0.2205715, 3.187446, 1, 1, 1, 1, 1,
0.2344598, -1.220098, 2.011657, 1, 1, 1, 1, 1,
0.2367031, -0.2876578, 2.400161, 0, 0, 1, 1, 1,
0.2368452, -0.2895769, 3.59514, 1, 0, 0, 1, 1,
0.2368685, 1.514658, 0.1314763, 1, 0, 0, 1, 1,
0.243502, 0.2628198, 1.301732, 1, 0, 0, 1, 1,
0.2551611, -1.86066, 3.036554, 1, 0, 0, 1, 1,
0.2551704, -0.4781373, 1.568919, 1, 0, 0, 1, 1,
0.2558848, -1.739754, 2.141965, 0, 0, 0, 1, 1,
0.2627016, -0.547876, 1.669909, 0, 0, 0, 1, 1,
0.2646115, 1.139756, -1.029413, 0, 0, 0, 1, 1,
0.2661369, -2.140499, 3.520753, 0, 0, 0, 1, 1,
0.2680744, 1.254341, -1.179915, 0, 0, 0, 1, 1,
0.2701002, -0.1513283, 2.755426, 0, 0, 0, 1, 1,
0.2752644, -0.0254031, 2.749976, 0, 0, 0, 1, 1,
0.2764829, -0.8828078, 2.716965, 1, 1, 1, 1, 1,
0.2803931, -0.5587929, 3.564516, 1, 1, 1, 1, 1,
0.2812145, -0.2068645, 0.8844219, 1, 1, 1, 1, 1,
0.2814739, 1.30196, 1.124734, 1, 1, 1, 1, 1,
0.2851952, -0.4549473, 2.248072, 1, 1, 1, 1, 1,
0.287579, 0.8636873, -0.6836277, 1, 1, 1, 1, 1,
0.2894768, 0.2537637, 1.746238, 1, 1, 1, 1, 1,
0.293511, -0.3778647, 2.073908, 1, 1, 1, 1, 1,
0.2971807, 0.8034371, -1.304978, 1, 1, 1, 1, 1,
0.2972847, -0.8586352, 4.593792, 1, 1, 1, 1, 1,
0.298519, 0.5214007, 0.2695221, 1, 1, 1, 1, 1,
0.30181, -0.9816346, 2.228927, 1, 1, 1, 1, 1,
0.3032242, -0.9014178, 1.378937, 1, 1, 1, 1, 1,
0.304321, 0.6772395, -0.163168, 1, 1, 1, 1, 1,
0.305157, 0.1263486, 0.13367, 1, 1, 1, 1, 1,
0.3114815, -0.1349057, -0.1640598, 0, 0, 1, 1, 1,
0.3157431, -0.4182094, 2.685603, 1, 0, 0, 1, 1,
0.3188154, -0.8153104, 3.452592, 1, 0, 0, 1, 1,
0.3201731, 0.4839469, 2.617192, 1, 0, 0, 1, 1,
0.3269653, -0.4816336, 3.599906, 1, 0, 0, 1, 1,
0.3278939, -0.6366284, 0.5347641, 1, 0, 0, 1, 1,
0.329172, -1.508201, 2.667742, 0, 0, 0, 1, 1,
0.3308193, -0.1490858, 2.969516, 0, 0, 0, 1, 1,
0.3308368, -0.1917233, 0.9629405, 0, 0, 0, 1, 1,
0.3453671, 2.406736, -1.591033, 0, 0, 0, 1, 1,
0.351274, 0.2973505, -0.01600512, 0, 0, 0, 1, 1,
0.353223, -1.212122, 3.067401, 0, 0, 0, 1, 1,
0.3551004, -1.076726, 3.737472, 0, 0, 0, 1, 1,
0.3603385, -1.062221, 2.996052, 1, 1, 1, 1, 1,
0.3616895, -0.1526117, 0.5830786, 1, 1, 1, 1, 1,
0.3617225, -0.3933143, 1.115822, 1, 1, 1, 1, 1,
0.364826, 1.337336, 0.440113, 1, 1, 1, 1, 1,
0.3670225, -0.5000709, 3.949313, 1, 1, 1, 1, 1,
0.3682258, 0.2219907, 1.371652, 1, 1, 1, 1, 1,
0.3700062, -0.2556696, 3.386687, 1, 1, 1, 1, 1,
0.3738689, 0.3313294, 0.8185958, 1, 1, 1, 1, 1,
0.3743182, -0.5599914, 2.866446, 1, 1, 1, 1, 1,
0.3754871, 0.8288633, 0.6265129, 1, 1, 1, 1, 1,
0.3781876, -0.1615929, 3.727067, 1, 1, 1, 1, 1,
0.3802953, 0.001443062, 2.555687, 1, 1, 1, 1, 1,
0.3819295, 0.09824537, 2.09835, 1, 1, 1, 1, 1,
0.3837263, 1.281749, 1.030004, 1, 1, 1, 1, 1,
0.3866298, -0.005101497, 4.761693, 1, 1, 1, 1, 1,
0.3893463, 0.9793947, 0.8630232, 0, 0, 1, 1, 1,
0.3928748, -1.176383, 2.534439, 1, 0, 0, 1, 1,
0.3976827, -0.7700477, 1.83784, 1, 0, 0, 1, 1,
0.3985831, 0.09847188, 1.631925, 1, 0, 0, 1, 1,
0.402784, 1.076726, -0.3654089, 1, 0, 0, 1, 1,
0.4123766, -0.08853825, 4.161178, 1, 0, 0, 1, 1,
0.4124759, -0.4421626, 1.601451, 0, 0, 0, 1, 1,
0.4173574, -0.809989, 3.398736, 0, 0, 0, 1, 1,
0.4225414, -0.628201, 1.765424, 0, 0, 0, 1, 1,
0.4225657, -2.008546, 3.623598, 0, 0, 0, 1, 1,
0.4310502, 0.118602, 1.617729, 0, 0, 0, 1, 1,
0.4319541, 1.014069, 0.4507945, 0, 0, 0, 1, 1,
0.4326352, 0.03879535, -0.4121613, 0, 0, 0, 1, 1,
0.4340782, -0.670297, 3.385893, 1, 1, 1, 1, 1,
0.4341227, -0.9715642, 2.875797, 1, 1, 1, 1, 1,
0.4350973, -0.7033148, 3.659796, 1, 1, 1, 1, 1,
0.4357166, -2.027256, 2.154614, 1, 1, 1, 1, 1,
0.435953, 0.6592745, 0.7068542, 1, 1, 1, 1, 1,
0.4382962, -1.546459, 2.420351, 1, 1, 1, 1, 1,
0.4392118, -0.881384, 1.805332, 1, 1, 1, 1, 1,
0.4399545, 0.01210727, 2.347596, 1, 1, 1, 1, 1,
0.4422725, 0.1731683, 0.6417319, 1, 1, 1, 1, 1,
0.4455775, 0.02015875, 0.7157133, 1, 1, 1, 1, 1,
0.4490836, -0.191926, 2.777995, 1, 1, 1, 1, 1,
0.4510201, -2.025466, 1.96727, 1, 1, 1, 1, 1,
0.4560944, 1.471393, -0.5087965, 1, 1, 1, 1, 1,
0.4593068, -0.4137028, 3.302043, 1, 1, 1, 1, 1,
0.4611136, 0.9884706, 0.300444, 1, 1, 1, 1, 1,
0.4623934, 0.7375652, 0.9441231, 0, 0, 1, 1, 1,
0.4710767, -0.6392936, 2.883465, 1, 0, 0, 1, 1,
0.4760425, 0.9530614, -0.1738659, 1, 0, 0, 1, 1,
0.4770116, -1.267142, 3.984272, 1, 0, 0, 1, 1,
0.4833725, 0.2818586, 2.4447, 1, 0, 0, 1, 1,
0.4851606, 0.5013405, 1.049729, 1, 0, 0, 1, 1,
0.4890636, 1.15049, 2.380649, 0, 0, 0, 1, 1,
0.4905361, -0.4234506, 2.6667, 0, 0, 0, 1, 1,
0.490908, -1.323456, 0.9602175, 0, 0, 0, 1, 1,
0.4954027, 0.6157382, 2.375035, 0, 0, 0, 1, 1,
0.4969848, -0.9980269, 3.467346, 0, 0, 0, 1, 1,
0.5025201, -0.4950266, 5.048811, 0, 0, 0, 1, 1,
0.5026907, -0.5570913, 1.720388, 0, 0, 0, 1, 1,
0.5064471, 0.8668497, 0.84597, 1, 1, 1, 1, 1,
0.507422, 0.2830088, 0.5692285, 1, 1, 1, 1, 1,
0.5105339, 1.464287, -0.9267057, 1, 1, 1, 1, 1,
0.511361, 0.9347743, -0.03410546, 1, 1, 1, 1, 1,
0.5134043, -1.466816, 2.372254, 1, 1, 1, 1, 1,
0.5151781, 0.999653, 1.521618, 1, 1, 1, 1, 1,
0.5241362, -1.274069, 3.162915, 1, 1, 1, 1, 1,
0.5257663, -0.5863466, 3.582494, 1, 1, 1, 1, 1,
0.5290709, -0.4707003, 2.313962, 1, 1, 1, 1, 1,
0.5353317, 0.2835239, 1.030244, 1, 1, 1, 1, 1,
0.5406661, 0.5014868, 3.53657, 1, 1, 1, 1, 1,
0.5446932, -0.2286926, 2.239635, 1, 1, 1, 1, 1,
0.5461001, -0.9832619, 1.850385, 1, 1, 1, 1, 1,
0.5461568, 0.03934417, 2.159569, 1, 1, 1, 1, 1,
0.5470082, -0.4699681, 0.4253124, 1, 1, 1, 1, 1,
0.5535507, 0.3191827, 0.704082, 0, 0, 1, 1, 1,
0.5536486, 0.8454849, -0.07351258, 1, 0, 0, 1, 1,
0.5539616, 0.9603941, 1.003031, 1, 0, 0, 1, 1,
0.5547137, 0.1828117, 0.01168857, 1, 0, 0, 1, 1,
0.5566185, 1.62225, 1.256017, 1, 0, 0, 1, 1,
0.5572312, 0.3273664, -0.5229944, 1, 0, 0, 1, 1,
0.5585158, 0.579527, 0.8967726, 0, 0, 0, 1, 1,
0.5647654, -0.5444176, 1.436696, 0, 0, 0, 1, 1,
0.5651203, -0.6986166, 1.168229, 0, 0, 0, 1, 1,
0.5660626, 1.9994, -2.057334, 0, 0, 0, 1, 1,
0.5700267, 0.1983185, 3.886768, 0, 0, 0, 1, 1,
0.5733155, -0.9789732, 2.211729, 0, 0, 0, 1, 1,
0.5822123, 0.9111682, 1.786833, 0, 0, 0, 1, 1,
0.5836252, -1.222892, 3.489836, 1, 1, 1, 1, 1,
0.5876335, -0.9897366, 2.425233, 1, 1, 1, 1, 1,
0.5895287, 1.375412, -0.9139434, 1, 1, 1, 1, 1,
0.5899973, -1.039079, 2.549567, 1, 1, 1, 1, 1,
0.5905427, 1.069167, 0.2877786, 1, 1, 1, 1, 1,
0.5918168, 0.1766531, 0.335218, 1, 1, 1, 1, 1,
0.5973616, 0.4640649, 0.2754858, 1, 1, 1, 1, 1,
0.6041267, -0.354231, 3.384982, 1, 1, 1, 1, 1,
0.605729, 0.8239715, 0.09446857, 1, 1, 1, 1, 1,
0.6065202, -0.9953851, 2.80676, 1, 1, 1, 1, 1,
0.6146911, -0.3023291, 0.3133583, 1, 1, 1, 1, 1,
0.620129, -0.1436251, 0.2359786, 1, 1, 1, 1, 1,
0.6207797, -1.182881, 3.151917, 1, 1, 1, 1, 1,
0.6221442, -0.4574753, 1.969217, 1, 1, 1, 1, 1,
0.6232429, -0.5773659, 1.078641, 1, 1, 1, 1, 1,
0.6246738, 1.608529, 0.6336847, 0, 0, 1, 1, 1,
0.6260563, 1.713601, 1.824013, 1, 0, 0, 1, 1,
0.6269482, 0.05341505, 1.68447, 1, 0, 0, 1, 1,
0.6309381, 2.448755, 0.07177537, 1, 0, 0, 1, 1,
0.631606, -0.7413641, 2.39185, 1, 0, 0, 1, 1,
0.6346802, 0.7626993, 0.9381987, 1, 0, 0, 1, 1,
0.6359584, 0.8672522, 0.5359133, 0, 0, 0, 1, 1,
0.6366383, 1.118764, -1.757017, 0, 0, 0, 1, 1,
0.6415881, 0.1092755, 4.19375, 0, 0, 0, 1, 1,
0.6432028, -0.5112165, 2.107034, 0, 0, 0, 1, 1,
0.6452914, 0.3716438, 0.04568785, 0, 0, 0, 1, 1,
0.6487448, -0.375908, 3.118857, 0, 0, 0, 1, 1,
0.6514229, 0.1918732, 1.975456, 0, 0, 0, 1, 1,
0.6516249, -1.937504, 1.15979, 1, 1, 1, 1, 1,
0.6523042, 1.088745, 0.1005081, 1, 1, 1, 1, 1,
0.6546044, 1.252818, -0.006861517, 1, 1, 1, 1, 1,
0.6611533, 1.309897, 0.9020088, 1, 1, 1, 1, 1,
0.6651507, 0.9521165, -0.3638099, 1, 1, 1, 1, 1,
0.670607, 1.859206, 0.9091662, 1, 1, 1, 1, 1,
0.6722445, 0.07645632, 1.577306, 1, 1, 1, 1, 1,
0.6727582, 1.49862, 1.858076, 1, 1, 1, 1, 1,
0.6736242, 1.184774, 0.6684961, 1, 1, 1, 1, 1,
0.6759738, -1.87933, 2.18184, 1, 1, 1, 1, 1,
0.684745, -0.1908303, 2.829986, 1, 1, 1, 1, 1,
0.6897985, -1.222469, 2.310137, 1, 1, 1, 1, 1,
0.6965677, 2.064847, -0.8310504, 1, 1, 1, 1, 1,
0.7026638, -2.074609, 2.460096, 1, 1, 1, 1, 1,
0.7029546, 1.081616, 0.663666, 1, 1, 1, 1, 1,
0.7105252, -0.1090457, 1.242659, 0, 0, 1, 1, 1,
0.7126355, 0.5504919, 0.8696502, 1, 0, 0, 1, 1,
0.7166342, -1.230381, 2.909726, 1, 0, 0, 1, 1,
0.7209967, 1.176597, 0.5132161, 1, 0, 0, 1, 1,
0.7236795, 1.743777, -0.6940392, 1, 0, 0, 1, 1,
0.7381778, 0.1786554, 1.22605, 1, 0, 0, 1, 1,
0.7381979, -1.307752, 2.808439, 0, 0, 0, 1, 1,
0.738652, 0.2303139, 0.2271406, 0, 0, 0, 1, 1,
0.7392409, -1.335651, 2.686389, 0, 0, 0, 1, 1,
0.7392919, 0.4654109, 0.2530598, 0, 0, 0, 1, 1,
0.7410222, -0.4380997, 2.860209, 0, 0, 0, 1, 1,
0.7428688, 0.6433733, 1.042564, 0, 0, 0, 1, 1,
0.7445896, -0.05923761, 3.41353, 0, 0, 0, 1, 1,
0.7465473, 0.4405632, 1.240134, 1, 1, 1, 1, 1,
0.7518598, 0.05545413, 1.128225, 1, 1, 1, 1, 1,
0.7533608, -1.102931, 3.179821, 1, 1, 1, 1, 1,
0.7548537, 0.8208247, -0.2078027, 1, 1, 1, 1, 1,
0.7645969, -0.4030943, 2.348192, 1, 1, 1, 1, 1,
0.7692211, 0.2245879, 1.398708, 1, 1, 1, 1, 1,
0.7721907, 0.7538626, 0.8560898, 1, 1, 1, 1, 1,
0.7836279, -0.2493345, 2.598535, 1, 1, 1, 1, 1,
0.7860613, -1.417299, 3.082725, 1, 1, 1, 1, 1,
0.7882022, -1.716219, 4.538286, 1, 1, 1, 1, 1,
0.7886981, -2.00272, 3.265409, 1, 1, 1, 1, 1,
0.7947294, -1.107791, 4.464258, 1, 1, 1, 1, 1,
0.7955611, -1.145402, 0.7373317, 1, 1, 1, 1, 1,
0.7966872, 0.6491207, 1.449819, 1, 1, 1, 1, 1,
0.7971641, 1.048218, 1.14074, 1, 1, 1, 1, 1,
0.8002249, 1.224501, 1.698895, 0, 0, 1, 1, 1,
0.8101397, 0.1727201, 0.6487907, 1, 0, 0, 1, 1,
0.8110408, -1.101476, 2.310381, 1, 0, 0, 1, 1,
0.8126292, 1.082142, -1.644967, 1, 0, 0, 1, 1,
0.8207788, -0.5657795, 2.469166, 1, 0, 0, 1, 1,
0.8273709, -0.8006964, 0.9315442, 1, 0, 0, 1, 1,
0.8281412, 1.602065, 0.4481116, 0, 0, 0, 1, 1,
0.829056, -1.239393, 2.379615, 0, 0, 0, 1, 1,
0.8300771, 1.174488, 3.301273, 0, 0, 0, 1, 1,
0.8314146, -0.4296852, 0.5698665, 0, 0, 0, 1, 1,
0.8321278, -0.623781, 0.3404533, 0, 0, 0, 1, 1,
0.8357186, 1.00836, 0.1055363, 0, 0, 0, 1, 1,
0.8367087, 0.5376396, 1.451608, 0, 0, 0, 1, 1,
0.8368685, -1.211052, 1.278274, 1, 1, 1, 1, 1,
0.8471492, -0.2481046, 1.755342, 1, 1, 1, 1, 1,
0.8473523, 0.4170177, 2.857596, 1, 1, 1, 1, 1,
0.8507572, 0.8645819, 0.7046638, 1, 1, 1, 1, 1,
0.8546038, 0.06439932, 1.693412, 1, 1, 1, 1, 1,
0.8567912, -2.573721, 3.110438, 1, 1, 1, 1, 1,
0.8571132, -2.01681, 1.420174, 1, 1, 1, 1, 1,
0.8579508, -0.00414544, 3.387823, 1, 1, 1, 1, 1,
0.866756, -1.85923, 3.58071, 1, 1, 1, 1, 1,
0.8676593, 1.140942, 0.2383289, 1, 1, 1, 1, 1,
0.8698642, -0.8015787, 3.974711, 1, 1, 1, 1, 1,
0.8706294, -0.1648845, 1.011451, 1, 1, 1, 1, 1,
0.8738444, 0.1891111, 2.08712, 1, 1, 1, 1, 1,
0.8777981, 2.292365, 1.685931, 1, 1, 1, 1, 1,
0.8791199, 1.771186, 0.2849706, 1, 1, 1, 1, 1,
0.8815953, -0.1796427, 2.202601, 0, 0, 1, 1, 1,
0.8865975, -0.5886421, 1.846058, 1, 0, 0, 1, 1,
0.8891534, -0.1055776, 3.305488, 1, 0, 0, 1, 1,
0.8946617, -1.133739, 3.745112, 1, 0, 0, 1, 1,
0.9045085, 0.2665068, 0.451176, 1, 0, 0, 1, 1,
0.9069105, -1.108296, 2.608002, 1, 0, 0, 1, 1,
0.9079046, -0.1691571, 4.089008, 0, 0, 0, 1, 1,
0.9119443, 1.040153, 0.8792962, 0, 0, 0, 1, 1,
0.9176431, -0.02308871, 1.713035, 0, 0, 0, 1, 1,
0.9211593, -0.1369214, 3.325398, 0, 0, 0, 1, 1,
0.9263996, -0.5099065, 2.797602, 0, 0, 0, 1, 1,
0.9282349, 0.4323324, 2.050135, 0, 0, 0, 1, 1,
0.9316544, 0.4258077, 0.375961, 0, 0, 0, 1, 1,
0.9340823, -0.625219, 3.195864, 1, 1, 1, 1, 1,
0.9368272, 2.403862, 0.1358716, 1, 1, 1, 1, 1,
0.9370521, -1.930745, 2.428576, 1, 1, 1, 1, 1,
0.9424231, 0.01301884, 1.606374, 1, 1, 1, 1, 1,
0.9438928, -2.469486, 3.460195, 1, 1, 1, 1, 1,
0.9525968, 0.4189101, 0.1086465, 1, 1, 1, 1, 1,
0.9600566, -0.2655492, 4.125065, 1, 1, 1, 1, 1,
0.9649069, -0.07090186, 1.607472, 1, 1, 1, 1, 1,
0.9651204, -0.8472033, 1.805033, 1, 1, 1, 1, 1,
0.9722998, -1.355792, 3.322708, 1, 1, 1, 1, 1,
0.9773684, -0.7968073, 2.611333, 1, 1, 1, 1, 1,
0.9850224, -0.8403971, 1.731117, 1, 1, 1, 1, 1,
0.9873189, -0.3907378, 1.854957, 1, 1, 1, 1, 1,
0.9921976, 0.4931252, 2.418345, 1, 1, 1, 1, 1,
1.001863, 0.7020598, -0.3928121, 1, 1, 1, 1, 1,
1.003382, -0.6654708, 2.294486, 0, 0, 1, 1, 1,
1.010113, 0.4189892, -0.8222547, 1, 0, 0, 1, 1,
1.011192, 0.4716576, 0.9992263, 1, 0, 0, 1, 1,
1.015154, 0.04151858, 0.3726682, 1, 0, 0, 1, 1,
1.015979, -1.00238, 2.85987, 1, 0, 0, 1, 1,
1.017247, 0.5113003, -0.0126925, 1, 0, 0, 1, 1,
1.018551, 0.3997796, 1.108344, 0, 0, 0, 1, 1,
1.018664, -0.5103993, 1.440352, 0, 0, 0, 1, 1,
1.018782, -1.122438, 2.060103, 0, 0, 0, 1, 1,
1.025731, -0.04585445, 1.951837, 0, 0, 0, 1, 1,
1.026456, -0.4601774, 2.882239, 0, 0, 0, 1, 1,
1.029562, 0.3440521, 0.7414323, 0, 0, 0, 1, 1,
1.033651, -1.88536, 3.963486, 0, 0, 0, 1, 1,
1.033954, -0.6462198, 3.33974, 1, 1, 1, 1, 1,
1.039887, -0.4093134, 2.189932, 1, 1, 1, 1, 1,
1.040575, 0.3331586, 0.9752517, 1, 1, 1, 1, 1,
1.045238, -1.781744, 3.225343, 1, 1, 1, 1, 1,
1.04782, 0.3758593, 1.763453, 1, 1, 1, 1, 1,
1.049342, -2.953055, 3.406021, 1, 1, 1, 1, 1,
1.058753, 0.2866374, 2.509952, 1, 1, 1, 1, 1,
1.075468, 0.3104929, 0.9365726, 1, 1, 1, 1, 1,
1.076896, 1.978021, 0.411158, 1, 1, 1, 1, 1,
1.083278, 1.426726, 1.16295, 1, 1, 1, 1, 1,
1.083573, 0.3867384, 0.8675755, 1, 1, 1, 1, 1,
1.099392, 0.3183919, -0.2947674, 1, 1, 1, 1, 1,
1.108018, -0.0001473557, -0.3564182, 1, 1, 1, 1, 1,
1.112298, 1.502025, -0.4360724, 1, 1, 1, 1, 1,
1.11393, -1.264476, 2.763499, 1, 1, 1, 1, 1,
1.143075, 0.05460079, 4.116563, 0, 0, 1, 1, 1,
1.143417, 1.271816, -0.09404875, 1, 0, 0, 1, 1,
1.147103, -0.04968058, 2.766393, 1, 0, 0, 1, 1,
1.151433, -1.603492, 1.98414, 1, 0, 0, 1, 1,
1.156904, -0.1634653, 2.123344, 1, 0, 0, 1, 1,
1.156965, -0.3862718, 4.316589, 1, 0, 0, 1, 1,
1.159469, -0.5623392, 1.834738, 0, 0, 0, 1, 1,
1.161442, 0.9737657, 0.2230872, 0, 0, 0, 1, 1,
1.16261, -0.2248987, 1.83873, 0, 0, 0, 1, 1,
1.175063, -0.5629075, 1.673621, 0, 0, 0, 1, 1,
1.194754, 0.5933565, 0.2646878, 0, 0, 0, 1, 1,
1.194821, -1.094538, 2.110357, 0, 0, 0, 1, 1,
1.199718, -2.603143, 4.797763, 0, 0, 0, 1, 1,
1.204275, -0.2755584, 1.78699, 1, 1, 1, 1, 1,
1.204493, 0.1267869, 1.464799, 1, 1, 1, 1, 1,
1.22648, 0.6888809, 0.7010892, 1, 1, 1, 1, 1,
1.228314, -0.02937166, 0.1808044, 1, 1, 1, 1, 1,
1.233632, 0.4285356, 2.373034, 1, 1, 1, 1, 1,
1.238211, -0.6548771, 2.808534, 1, 1, 1, 1, 1,
1.243608, -0.8161945, 3.254452, 1, 1, 1, 1, 1,
1.255703, 0.5532913, 1.535079, 1, 1, 1, 1, 1,
1.259593, -1.181487, 2.718661, 1, 1, 1, 1, 1,
1.259881, -0.9396064, 2.131722, 1, 1, 1, 1, 1,
1.260168, 0.6452313, -0.3533756, 1, 1, 1, 1, 1,
1.261961, 1.470551, 0.7444084, 1, 1, 1, 1, 1,
1.26534, -1.748599, 1.566348, 1, 1, 1, 1, 1,
1.27035, -1.567738, 2.510227, 1, 1, 1, 1, 1,
1.286031, -0.4784442, 0.9074625, 1, 1, 1, 1, 1,
1.295413, -0.5546647, 1.858206, 0, 0, 1, 1, 1,
1.29825, 0.1463703, 1.099147, 1, 0, 0, 1, 1,
1.299263, -1.183293, 1.968248, 1, 0, 0, 1, 1,
1.302769, -2.136265, 3.054506, 1, 0, 0, 1, 1,
1.315972, 0.3485348, -0.2477264, 1, 0, 0, 1, 1,
1.319885, 1.117655, 0.4420501, 1, 0, 0, 1, 1,
1.34232, -1.00455, 3.469486, 0, 0, 0, 1, 1,
1.345749, -0.04774549, -0.2262577, 0, 0, 0, 1, 1,
1.356748, -1.414305, 1.467125, 0, 0, 0, 1, 1,
1.360225, -0.6670719, 2.304427, 0, 0, 0, 1, 1,
1.367636, -0.1725379, 1.593803, 0, 0, 0, 1, 1,
1.37743, -0.9839742, 2.464075, 0, 0, 0, 1, 1,
1.390272, -0.2377178, 2.283199, 0, 0, 0, 1, 1,
1.395532, 0.6234241, 1.024482, 1, 1, 1, 1, 1,
1.395542, 2.074239, 0.5159041, 1, 1, 1, 1, 1,
1.407194, 1.762961, 0.4940867, 1, 1, 1, 1, 1,
1.407199, -0.5579751, 1.803673, 1, 1, 1, 1, 1,
1.416414, -0.5284314, 2.7095, 1, 1, 1, 1, 1,
1.418004, -0.2444655, 2.990264, 1, 1, 1, 1, 1,
1.422305, -0.4813881, 0.1414048, 1, 1, 1, 1, 1,
1.435845, 1.553974, 1.956823, 1, 1, 1, 1, 1,
1.437378, -1.036244, 2.767476, 1, 1, 1, 1, 1,
1.439939, 1.456422, 1.070892, 1, 1, 1, 1, 1,
1.440201, -0.1022834, 1.535164, 1, 1, 1, 1, 1,
1.475306, -1.658298, 3.592075, 1, 1, 1, 1, 1,
1.475379, -1.040094, 2.77258, 1, 1, 1, 1, 1,
1.478164, -1.047904, 4.295088, 1, 1, 1, 1, 1,
1.481861, -0.6302999, 2.255506, 1, 1, 1, 1, 1,
1.502896, -0.09239433, 2.490631, 0, 0, 1, 1, 1,
1.508065, 0.0776444, 1.476898, 1, 0, 0, 1, 1,
1.510536, 0.3733817, 0.4118315, 1, 0, 0, 1, 1,
1.515312, 1.699399, 1.273577, 1, 0, 0, 1, 1,
1.523608, -1.182205, 2.049832, 1, 0, 0, 1, 1,
1.528872, -0.3601153, 1.361628, 1, 0, 0, 1, 1,
1.530184, -0.4204283, 2.171117, 0, 0, 0, 1, 1,
1.536081, -0.2512885, 2.824268, 0, 0, 0, 1, 1,
1.538768, -0.2597016, 1.122097, 0, 0, 0, 1, 1,
1.553158, 0.05842239, 2.518821, 0, 0, 0, 1, 1,
1.567307, -0.6388189, 0.6297479, 0, 0, 0, 1, 1,
1.577879, 0.6827219, 2.073698, 0, 0, 0, 1, 1,
1.58903, 0.9059224, -0.1121391, 0, 0, 0, 1, 1,
1.60204, -0.04149868, 1.449791, 1, 1, 1, 1, 1,
1.603735, 0.2122332, 2.616617, 1, 1, 1, 1, 1,
1.606798, -1.155857, 2.278695, 1, 1, 1, 1, 1,
1.63233, -1.340781, 1.939347, 1, 1, 1, 1, 1,
1.667007, 1.212016, 0.6694846, 1, 1, 1, 1, 1,
1.667773, -0.6331132, 0.9762076, 1, 1, 1, 1, 1,
1.687183, -0.1635159, 2.343539, 1, 1, 1, 1, 1,
1.691015, -1.194801, 1.558945, 1, 1, 1, 1, 1,
1.693565, 0.3837117, 2.487777, 1, 1, 1, 1, 1,
1.705602, -0.31313, 2.59171, 1, 1, 1, 1, 1,
1.713924, -0.6163471, 3.251645, 1, 1, 1, 1, 1,
1.715664, 0.1601178, 1.046613, 1, 1, 1, 1, 1,
1.740745, -1.585398, 2.105776, 1, 1, 1, 1, 1,
1.752314, 1.873814, -0.5747696, 1, 1, 1, 1, 1,
1.752577, -0.9850847, 0.968658, 1, 1, 1, 1, 1,
1.776068, -0.76147, 1.177677, 0, 0, 1, 1, 1,
1.789597, 0.4363322, 0.3310032, 1, 0, 0, 1, 1,
1.794187, -0.2564174, 2.512596, 1, 0, 0, 1, 1,
1.795594, 0.2852596, 0.9225066, 1, 0, 0, 1, 1,
1.798254, -0.810847, 3.653976, 1, 0, 0, 1, 1,
1.806354, 0.8536098, 0.3080524, 1, 0, 0, 1, 1,
1.820925, -0.7214608, 1.348766, 0, 0, 0, 1, 1,
1.829847, -0.02641511, -0.04213774, 0, 0, 0, 1, 1,
1.831599, 0.6669211, 1.967462, 0, 0, 0, 1, 1,
1.835818, -0.1666004, 2.92726, 0, 0, 0, 1, 1,
1.842966, 0.9593819, 0.4858729, 0, 0, 0, 1, 1,
1.846714, 0.4565617, 1.14345, 0, 0, 0, 1, 1,
1.874847, -0.6243725, 3.657236, 0, 0, 0, 1, 1,
1.900765, 0.05416711, 2.508963, 1, 1, 1, 1, 1,
1.901446, 1.214508, 1.174554, 1, 1, 1, 1, 1,
1.903376, -1.874925, 3.855999, 1, 1, 1, 1, 1,
1.916408, -0.8404038, 1.833293, 1, 1, 1, 1, 1,
1.947486, -2.596827, 2.494247, 1, 1, 1, 1, 1,
1.972093, 0.8280284, 1.879693, 1, 1, 1, 1, 1,
1.982207, 1.198457, 0.7570963, 1, 1, 1, 1, 1,
1.987175, 0.892424, 0.6182003, 1, 1, 1, 1, 1,
1.987899, 0.6782506, 0.6886318, 1, 1, 1, 1, 1,
1.988506, -0.483537, 1.590463, 1, 1, 1, 1, 1,
1.989222, 0.2564413, 1.855181, 1, 1, 1, 1, 1,
2.005645, 0.47812, 1.853589, 1, 1, 1, 1, 1,
2.007671, -0.1799084, 1.603625, 1, 1, 1, 1, 1,
2.010617, -0.3782251, 2.399505, 1, 1, 1, 1, 1,
2.01606, 0.1738603, 2.130773, 1, 1, 1, 1, 1,
2.018769, -0.1430398, 1.489254, 0, 0, 1, 1, 1,
2.018874, 0.01717686, 0.4751532, 1, 0, 0, 1, 1,
2.050079, 0.3569554, 1.752356, 1, 0, 0, 1, 1,
2.060148, 1.092993, 1.337376, 1, 0, 0, 1, 1,
2.067731, -0.5032106, 3.616763, 1, 0, 0, 1, 1,
2.114948, -0.2481231, 2.182731, 1, 0, 0, 1, 1,
2.129756, -1.069687, 2.323553, 0, 0, 0, 1, 1,
2.239955, -0.4746265, 3.439262, 0, 0, 0, 1, 1,
2.269038, 0.3472085, 3.524956, 0, 0, 0, 1, 1,
2.27667, -0.1730425, 0.2911199, 0, 0, 0, 1, 1,
2.346646, -0.793698, 3.290602, 0, 0, 0, 1, 1,
2.454772, -0.5255918, 0.8011205, 0, 0, 0, 1, 1,
2.542819, 0.03896614, 1.463482, 0, 0, 0, 1, 1,
2.587383, 0.2811066, 3.528132, 1, 1, 1, 1, 1,
2.631189, 0.1637029, 1.444141, 1, 1, 1, 1, 1,
2.657921, 1.754538, -0.5796194, 1, 1, 1, 1, 1,
2.688695, -2.575512, 2.635921, 1, 1, 1, 1, 1,
2.813594, -1.309311, 1.189678, 1, 1, 1, 1, 1,
2.96379, -0.7690579, 3.067212, 1, 1, 1, 1, 1,
3.320221, -0.6338914, 1.369604, 1, 1, 1, 1, 1
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
var radius = 9.38097;
var distance = 32.95026;
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
mvMatrix.translate( 0.09651351, 0.03200328, 0.04150534 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95026);
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
