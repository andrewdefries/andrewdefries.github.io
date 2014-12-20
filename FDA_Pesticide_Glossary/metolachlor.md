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
-2.787312, 2.287853, -1.637061, 1, 0, 0, 1,
-2.612857, -0.4127842, -3.121751, 1, 0.007843138, 0, 1,
-2.490684, 0.862582, -1.394863, 1, 0.01176471, 0, 1,
-2.440826, 2.670974, -0.7003977, 1, 0.01960784, 0, 1,
-2.336013, 0.8875069, -1.368352, 1, 0.02352941, 0, 1,
-2.31405, -0.5479316, -1.97862, 1, 0.03137255, 0, 1,
-2.287782, -0.6539616, 0.2955631, 1, 0.03529412, 0, 1,
-2.221308, -0.3190706, -0.8342459, 1, 0.04313726, 0, 1,
-2.214277, 0.1369688, -0.3113945, 1, 0.04705882, 0, 1,
-2.20869, 1.116309, -0.6051033, 1, 0.05490196, 0, 1,
-2.193048, -0.2847254, -2.571236, 1, 0.05882353, 0, 1,
-2.190339, 1.17364, -1.597155, 1, 0.06666667, 0, 1,
-2.179072, 0.8831686, -1.144252, 1, 0.07058824, 0, 1,
-2.172537, -1.833707, -3.008518, 1, 0.07843138, 0, 1,
-2.14489, -0.5390569, -2.222498, 1, 0.08235294, 0, 1,
-2.119787, -0.6690673, -1.48305, 1, 0.09019608, 0, 1,
-2.071974, 1.147997, -1.880425, 1, 0.09411765, 0, 1,
-2.054431, 0.5267862, -1.019988, 1, 0.1019608, 0, 1,
-2.026454, -0.2746923, -1.760239, 1, 0.1098039, 0, 1,
-2.025191, 0.1139979, -1.753091, 1, 0.1137255, 0, 1,
-2.008983, 0.1473707, -2.57459, 1, 0.1215686, 0, 1,
-1.99525, -1.714536, -1.979851, 1, 0.1254902, 0, 1,
-1.96683, -0.8578354, -1.497039, 1, 0.1333333, 0, 1,
-1.959551, 0.3180155, -2.685816, 1, 0.1372549, 0, 1,
-1.955905, -1.513308, -2.321692, 1, 0.145098, 0, 1,
-1.920267, -0.8291504, -2.380833, 1, 0.1490196, 0, 1,
-1.893348, -1.093449, -2.646117, 1, 0.1568628, 0, 1,
-1.872347, -0.533887, -1.151776, 1, 0.1607843, 0, 1,
-1.85598, -0.4321045, -2.594726, 1, 0.1686275, 0, 1,
-1.838159, 1.807965, -1.067837, 1, 0.172549, 0, 1,
-1.838124, -0.08068029, -1.53724, 1, 0.1803922, 0, 1,
-1.806512, -0.2550818, -1.705049, 1, 0.1843137, 0, 1,
-1.793608, 0.3345326, 1.041981, 1, 0.1921569, 0, 1,
-1.766274, 1.406002, -0.4885452, 1, 0.1960784, 0, 1,
-1.757865, 0.7761802, -0.8448215, 1, 0.2039216, 0, 1,
-1.75577, 1.918125, -0.02036595, 1, 0.2117647, 0, 1,
-1.749165, 0.7313691, -3.125069, 1, 0.2156863, 0, 1,
-1.735906, 0.1265093, -1.381883, 1, 0.2235294, 0, 1,
-1.72606, 0.1417179, -1.081214, 1, 0.227451, 0, 1,
-1.724322, 2.092221, 0.3514318, 1, 0.2352941, 0, 1,
-1.712673, 1.517861, -0.3807425, 1, 0.2392157, 0, 1,
-1.711632, 0.9714124, -1.028531, 1, 0.2470588, 0, 1,
-1.69808, -1.601587, -2.068735, 1, 0.2509804, 0, 1,
-1.694283, -2.68084, -3.328452, 1, 0.2588235, 0, 1,
-1.691659, -1.326126, -3.774175, 1, 0.2627451, 0, 1,
-1.67755, 0.8603318, -0.1148691, 1, 0.2705882, 0, 1,
-1.672333, 0.4329563, -1.735734, 1, 0.2745098, 0, 1,
-1.667054, 1.539668, 0.08056556, 1, 0.282353, 0, 1,
-1.65087, 0.5361737, -3.031299, 1, 0.2862745, 0, 1,
-1.649732, -1.403155, -1.927145, 1, 0.2941177, 0, 1,
-1.630929, 0.1707933, -1.121963, 1, 0.3019608, 0, 1,
-1.629914, -0.8872203, -2.991819, 1, 0.3058824, 0, 1,
-1.610249, -0.2113888, -1.903318, 1, 0.3137255, 0, 1,
-1.599279, -1.396941, -0.3395314, 1, 0.3176471, 0, 1,
-1.598046, 0.6186285, -1.738301, 1, 0.3254902, 0, 1,
-1.572063, -1.28523, -0.4297767, 1, 0.3294118, 0, 1,
-1.560975, -0.1787922, -1.859836, 1, 0.3372549, 0, 1,
-1.55383, -0.5747086, -1.999338, 1, 0.3411765, 0, 1,
-1.552172, -0.8637601, -2.592023, 1, 0.3490196, 0, 1,
-1.551607, 1.299309, -1.478019, 1, 0.3529412, 0, 1,
-1.528908, -2.121243, -3.174084, 1, 0.3607843, 0, 1,
-1.527251, -0.08438124, -1.51046, 1, 0.3647059, 0, 1,
-1.526352, 0.4101447, -0.3762256, 1, 0.372549, 0, 1,
-1.514867, -0.06705187, -0.7506602, 1, 0.3764706, 0, 1,
-1.511197, -0.2497535, -1.46215, 1, 0.3843137, 0, 1,
-1.504298, -0.7748448, -3.501327, 1, 0.3882353, 0, 1,
-1.502119, 0.1354423, -1.511806, 1, 0.3960784, 0, 1,
-1.500132, -0.7638127, -1.203979, 1, 0.4039216, 0, 1,
-1.49759, 0.8975101, -0.3974167, 1, 0.4078431, 0, 1,
-1.496672, 1.12721, -1.426238, 1, 0.4156863, 0, 1,
-1.482765, -1.621606, -2.579182, 1, 0.4196078, 0, 1,
-1.479811, -1.131846, -0.6837261, 1, 0.427451, 0, 1,
-1.479545, 0.5398452, -0.2742281, 1, 0.4313726, 0, 1,
-1.472692, 1.211702, -2.589381, 1, 0.4392157, 0, 1,
-1.469283, 0.7752538, -0.1037825, 1, 0.4431373, 0, 1,
-1.463414, -1.48415, -3.236435, 1, 0.4509804, 0, 1,
-1.454323, -0.275, -2.233256, 1, 0.454902, 0, 1,
-1.437105, -0.1277047, -0.6776275, 1, 0.4627451, 0, 1,
-1.434525, -0.4147486, -0.6715025, 1, 0.4666667, 0, 1,
-1.431383, 0.1646815, -0.3466121, 1, 0.4745098, 0, 1,
-1.42903, -0.06018293, -2.67682, 1, 0.4784314, 0, 1,
-1.428997, -0.3581279, -3.135384, 1, 0.4862745, 0, 1,
-1.428908, -0.002661262, -2.41167, 1, 0.4901961, 0, 1,
-1.423602, 0.8024967, 0.6075147, 1, 0.4980392, 0, 1,
-1.409612, 0.6724124, 0.4030667, 1, 0.5058824, 0, 1,
-1.401619, -0.8649857, -2.6605, 1, 0.509804, 0, 1,
-1.399052, 0.3851662, -1.359967, 1, 0.5176471, 0, 1,
-1.398082, 1.223335, -1.070095, 1, 0.5215687, 0, 1,
-1.396836, -1.210885, -3.001091, 1, 0.5294118, 0, 1,
-1.388867, -1.727368, -4.261828, 1, 0.5333334, 0, 1,
-1.387492, -0.9970568, -3.023895, 1, 0.5411765, 0, 1,
-1.364643, 2.086456, -1.51165, 1, 0.5450981, 0, 1,
-1.360599, -0.995815, -2.658442, 1, 0.5529412, 0, 1,
-1.357127, -1.047103, -2.217916, 1, 0.5568628, 0, 1,
-1.356796, 0.5884424, -1.129575, 1, 0.5647059, 0, 1,
-1.339891, -1.5324, -1.562183, 1, 0.5686275, 0, 1,
-1.31654, 0.04369002, -1.522235, 1, 0.5764706, 0, 1,
-1.311402, 0.07610214, -3.284561, 1, 0.5803922, 0, 1,
-1.305803, 0.982001, -1.212583, 1, 0.5882353, 0, 1,
-1.300976, 0.527827, -0.7612329, 1, 0.5921569, 0, 1,
-1.299315, 0.1079136, -2.504918, 1, 0.6, 0, 1,
-1.298015, 1.268388, -0.7395649, 1, 0.6078432, 0, 1,
-1.294816, -3.178209, -2.644596, 1, 0.6117647, 0, 1,
-1.290828, 0.8349818, -2.085895, 1, 0.6196079, 0, 1,
-1.280682, -0.7222444, -3.397669, 1, 0.6235294, 0, 1,
-1.27074, -1.736573, -1.446479, 1, 0.6313726, 0, 1,
-1.266612, 0.2917341, -1.643687, 1, 0.6352941, 0, 1,
-1.265361, 0.5649498, -2.296483, 1, 0.6431373, 0, 1,
-1.262658, 0.05207086, -1.369083, 1, 0.6470588, 0, 1,
-1.258075, 0.5753821, -0.8058117, 1, 0.654902, 0, 1,
-1.256476, -1.352585, -2.952079, 1, 0.6588235, 0, 1,
-1.24418, 0.1444495, -1.887375, 1, 0.6666667, 0, 1,
-1.23709, -0.7553108, -1.480461, 1, 0.6705883, 0, 1,
-1.236099, 0.8619587, 0.1240542, 1, 0.6784314, 0, 1,
-1.23525, 0.1653749, -1.357886, 1, 0.682353, 0, 1,
-1.234973, 0.360994, -0.6489853, 1, 0.6901961, 0, 1,
-1.229389, -0.008826675, -0.8353667, 1, 0.6941177, 0, 1,
-1.223015, 0.129336, -2.275234, 1, 0.7019608, 0, 1,
-1.210923, 0.4166867, -2.083406, 1, 0.7098039, 0, 1,
-1.210871, 1.051509, 1.078541, 1, 0.7137255, 0, 1,
-1.210656, -1.244871, -1.974215, 1, 0.7215686, 0, 1,
-1.209525, -0.02379468, 1.151237, 1, 0.7254902, 0, 1,
-1.197757, -1.465695, -2.581435, 1, 0.7333333, 0, 1,
-1.197253, 0.3057642, -2.790714, 1, 0.7372549, 0, 1,
-1.195651, -1.003052, -2.501723, 1, 0.7450981, 0, 1,
-1.191323, -0.3666173, -1.783039, 1, 0.7490196, 0, 1,
-1.190671, 0.5748346, -1.9381, 1, 0.7568628, 0, 1,
-1.182519, 1.33543, -1.148026, 1, 0.7607843, 0, 1,
-1.176288, 1.898587, 0.06002663, 1, 0.7686275, 0, 1,
-1.157955, -0.2927078, -1.005551, 1, 0.772549, 0, 1,
-1.1542, -0.2185221, -3.227036, 1, 0.7803922, 0, 1,
-1.146898, 0.02444533, -3.292617, 1, 0.7843137, 0, 1,
-1.143193, 1.478934, -2.873515, 1, 0.7921569, 0, 1,
-1.140565, 0.06827819, 0.0996452, 1, 0.7960784, 0, 1,
-1.137514, 1.506, -2.208262, 1, 0.8039216, 0, 1,
-1.13546, 0.5880932, -2.302427, 1, 0.8117647, 0, 1,
-1.132902, 0.6122825, -2.511629, 1, 0.8156863, 0, 1,
-1.130276, 1.664701, -0.6280569, 1, 0.8235294, 0, 1,
-1.10722, 0.9957639, -2.522374, 1, 0.827451, 0, 1,
-1.106606, -2.223382, -2.342805, 1, 0.8352941, 0, 1,
-1.104705, 0.5605641, -1.751155, 1, 0.8392157, 0, 1,
-1.094436, 0.3233301, -0.3578792, 1, 0.8470588, 0, 1,
-1.089882, 0.3869989, -1.762035, 1, 0.8509804, 0, 1,
-1.081002, -0.2237301, -1.000739, 1, 0.8588235, 0, 1,
-1.077602, -0.1739631, -1.267165, 1, 0.8627451, 0, 1,
-1.0731, 0.9082819, -1.459136, 1, 0.8705882, 0, 1,
-1.071295, 0.3556496, -2.892453, 1, 0.8745098, 0, 1,
-1.068569, -0.6620876, -1.888698, 1, 0.8823529, 0, 1,
-1.065174, 0.5128695, -0.8882586, 1, 0.8862745, 0, 1,
-1.062112, -0.5787214, -3.626318, 1, 0.8941177, 0, 1,
-1.060917, 0.9303622, 0.4726713, 1, 0.8980392, 0, 1,
-1.060015, 0.163282, -3.886221, 1, 0.9058824, 0, 1,
-1.05066, -2.158561, -4.143226, 1, 0.9137255, 0, 1,
-1.050592, -0.9876644, -2.667487, 1, 0.9176471, 0, 1,
-1.046288, -1.062767, -1.695949, 1, 0.9254902, 0, 1,
-1.046162, -1.432366, -0.8338439, 1, 0.9294118, 0, 1,
-1.038136, 2.615197, -2.650122, 1, 0.9372549, 0, 1,
-1.036274, 0.4973289, -1.469347, 1, 0.9411765, 0, 1,
-1.033557, -1.086439, -1.941538, 1, 0.9490196, 0, 1,
-1.031404, -1.273501, -1.831729, 1, 0.9529412, 0, 1,
-1.027895, -1.575138, -3.124856, 1, 0.9607843, 0, 1,
-1.025846, 0.03480895, -0.5861075, 1, 0.9647059, 0, 1,
-1.022092, 0.03285009, -0.6406713, 1, 0.972549, 0, 1,
-1.018106, 0.4504297, -2.238146, 1, 0.9764706, 0, 1,
-1.017768, -1.204799, -1.943285, 1, 0.9843137, 0, 1,
-1.010033, 1.949603, -1.38242, 1, 0.9882353, 0, 1,
-1.001968, 0.6038572, -1.559214, 1, 0.9960784, 0, 1,
-0.9959875, 2.275542, -0.4695766, 0.9960784, 1, 0, 1,
-0.99032, -0.7227162, -2.697756, 0.9921569, 1, 0, 1,
-0.9858581, -1.516896, -1.635315, 0.9843137, 1, 0, 1,
-0.9831685, -0.2406285, -2.362601, 0.9803922, 1, 0, 1,
-0.9682966, -0.7836851, -1.890542, 0.972549, 1, 0, 1,
-0.9648239, -1.252531, -2.358354, 0.9686275, 1, 0, 1,
-0.9647204, -1.544688, -2.957747, 0.9607843, 1, 0, 1,
-0.9641432, -1.33832, -3.726078, 0.9568627, 1, 0, 1,
-0.9629992, -0.2218017, -1.333891, 0.9490196, 1, 0, 1,
-0.9558173, 0.7436928, -0.2591755, 0.945098, 1, 0, 1,
-0.9549162, 1.512523, -1.975718, 0.9372549, 1, 0, 1,
-0.9542946, 0.1237842, -1.121671, 0.9333333, 1, 0, 1,
-0.9444917, 0.05812818, -3.542581, 0.9254902, 1, 0, 1,
-0.9431326, -0.5645501, -3.025569, 0.9215686, 1, 0, 1,
-0.9423398, -0.3250766, -2.114139, 0.9137255, 1, 0, 1,
-0.9376857, 1.628899, -1.442328, 0.9098039, 1, 0, 1,
-0.9308127, 0.4648552, -2.639144, 0.9019608, 1, 0, 1,
-0.9277872, 0.1650648, -3.062793, 0.8941177, 1, 0, 1,
-0.9175803, 0.4384137, -1.214874, 0.8901961, 1, 0, 1,
-0.9162002, 1.605442, 1.501478, 0.8823529, 1, 0, 1,
-0.9020002, -0.6176009, -2.667273, 0.8784314, 1, 0, 1,
-0.9009376, -0.3730022, -3.021188, 0.8705882, 1, 0, 1,
-0.9000962, 2.593485, -2.056566, 0.8666667, 1, 0, 1,
-0.8997868, 0.3732333, -0.6696634, 0.8588235, 1, 0, 1,
-0.8932199, 1.286664, -1.777379, 0.854902, 1, 0, 1,
-0.885866, 1.9646, -0.7768711, 0.8470588, 1, 0, 1,
-0.8749805, -0.3306806, -0.6854357, 0.8431373, 1, 0, 1,
-0.8734499, -1.033687, -2.829535, 0.8352941, 1, 0, 1,
-0.8714378, -1.49553, -3.290608, 0.8313726, 1, 0, 1,
-0.867676, 0.8128656, 0.3723169, 0.8235294, 1, 0, 1,
-0.8608986, -0.8914053, -3.028874, 0.8196079, 1, 0, 1,
-0.8608881, -0.8752719, -3.153637, 0.8117647, 1, 0, 1,
-0.853857, -0.8253032, -1.449503, 0.8078431, 1, 0, 1,
-0.8412761, 0.5638284, -1.996845, 0.8, 1, 0, 1,
-0.8366004, 0.4271864, -1.038075, 0.7921569, 1, 0, 1,
-0.8353888, 0.9056494, -1.234223, 0.7882353, 1, 0, 1,
-0.8311305, -0.6090636, -2.351933, 0.7803922, 1, 0, 1,
-0.8278178, 0.683015, -0.7844861, 0.7764706, 1, 0, 1,
-0.8254772, -0.3798858, -3.240824, 0.7686275, 1, 0, 1,
-0.823562, 0.0183788, -1.21087, 0.7647059, 1, 0, 1,
-0.8224062, 1.433152, 0.3841441, 0.7568628, 1, 0, 1,
-0.8150993, 0.3322729, -0.3725527, 0.7529412, 1, 0, 1,
-0.8149009, 0.333542, 0.6074809, 0.7450981, 1, 0, 1,
-0.8117864, 0.1235271, 0.8296643, 0.7411765, 1, 0, 1,
-0.8096399, 0.5154737, -0.3263192, 0.7333333, 1, 0, 1,
-0.7987056, 1.169122, 0.7022222, 0.7294118, 1, 0, 1,
-0.7984713, 1.038022, 0.08526836, 0.7215686, 1, 0, 1,
-0.7977669, -0.03977283, -2.138047, 0.7176471, 1, 0, 1,
-0.797551, 1.77141, -2.896152, 0.7098039, 1, 0, 1,
-0.7954769, 0.6715223, -0.7645135, 0.7058824, 1, 0, 1,
-0.7907751, 0.275842, -1.674552, 0.6980392, 1, 0, 1,
-0.7890739, -0.3204562, -2.46793, 0.6901961, 1, 0, 1,
-0.7797716, -0.3962649, -2.622928, 0.6862745, 1, 0, 1,
-0.7772926, -1.360034, -1.400146, 0.6784314, 1, 0, 1,
-0.7757226, -0.2096955, -2.139469, 0.6745098, 1, 0, 1,
-0.7740353, 1.076214, -1.628617, 0.6666667, 1, 0, 1,
-0.7723472, -0.4418823, -1.338082, 0.6627451, 1, 0, 1,
-0.7672092, 0.2252548, -0.2366296, 0.654902, 1, 0, 1,
-0.7562302, 0.2341912, -0.8400002, 0.6509804, 1, 0, 1,
-0.7559207, -0.2616459, -0.9561859, 0.6431373, 1, 0, 1,
-0.7522963, -0.2738476, -1.854067, 0.6392157, 1, 0, 1,
-0.7491136, 0.1099152, -2.087444, 0.6313726, 1, 0, 1,
-0.7488707, 0.03467933, -1.536515, 0.627451, 1, 0, 1,
-0.7473706, -0.607588, -1.796049, 0.6196079, 1, 0, 1,
-0.7467176, 1.194479, 1.141749, 0.6156863, 1, 0, 1,
-0.7463136, -0.2287427, -0.6080637, 0.6078432, 1, 0, 1,
-0.7457142, 1.489554, 0.3986717, 0.6039216, 1, 0, 1,
-0.7452984, -0.3815389, -2.731273, 0.5960785, 1, 0, 1,
-0.7431411, -0.8465574, -1.979349, 0.5882353, 1, 0, 1,
-0.7312308, -0.4746353, -2.023922, 0.5843138, 1, 0, 1,
-0.7281618, -0.03369985, -2.889716, 0.5764706, 1, 0, 1,
-0.7248403, 0.05966102, -2.199943, 0.572549, 1, 0, 1,
-0.7134951, -0.5869408, -3.192252, 0.5647059, 1, 0, 1,
-0.7100645, 1.10259, -0.920422, 0.5607843, 1, 0, 1,
-0.7098592, 0.7241663, 0.2258718, 0.5529412, 1, 0, 1,
-0.7087325, -0.3340906, -2.519149, 0.5490196, 1, 0, 1,
-0.7051698, -0.5135639, -2.887963, 0.5411765, 1, 0, 1,
-0.7040067, 0.2721912, -1.013861, 0.5372549, 1, 0, 1,
-0.6935143, 0.8383093, -2.619714, 0.5294118, 1, 0, 1,
-0.6934683, -0.413142, -1.812674, 0.5254902, 1, 0, 1,
-0.691274, 0.5064906, -0.9924785, 0.5176471, 1, 0, 1,
-0.6912077, -1.734685, -1.465392, 0.5137255, 1, 0, 1,
-0.6905479, 0.7823824, -1.169077, 0.5058824, 1, 0, 1,
-0.6872378, -0.3055898, -2.235481, 0.5019608, 1, 0, 1,
-0.6799204, -1.528897, -0.2217285, 0.4941176, 1, 0, 1,
-0.6795416, -0.9664688, -3.852641, 0.4862745, 1, 0, 1,
-0.6790838, -0.2759052, -0.8995311, 0.4823529, 1, 0, 1,
-0.6719195, 0.2391101, -1.875944, 0.4745098, 1, 0, 1,
-0.6713064, -0.7693407, -2.238396, 0.4705882, 1, 0, 1,
-0.669943, -0.9021358, -3.096845, 0.4627451, 1, 0, 1,
-0.6698255, 1.592897, 0.7460301, 0.4588235, 1, 0, 1,
-0.6654084, 1.353514, -1.444367, 0.4509804, 1, 0, 1,
-0.6644982, 0.5155677, -0.1685804, 0.4470588, 1, 0, 1,
-0.663626, 0.01126213, -1.273457, 0.4392157, 1, 0, 1,
-0.6631926, 0.133132, -2.936408, 0.4352941, 1, 0, 1,
-0.6631313, 0.9669709, -1.511222, 0.427451, 1, 0, 1,
-0.6610748, 0.9387352, -1.993159, 0.4235294, 1, 0, 1,
-0.6608547, -1.517941, -2.828847, 0.4156863, 1, 0, 1,
-0.6560715, 0.4643224, -0.5660231, 0.4117647, 1, 0, 1,
-0.650183, -0.6094562, -1.835914, 0.4039216, 1, 0, 1,
-0.6388078, -0.3694636, -1.384622, 0.3960784, 1, 0, 1,
-0.6368818, -0.2442635, -2.480068, 0.3921569, 1, 0, 1,
-0.632143, 0.6371166, -1.622656, 0.3843137, 1, 0, 1,
-0.6292458, 1.29804, 0.1458858, 0.3803922, 1, 0, 1,
-0.6241843, -0.4868028, -1.916622, 0.372549, 1, 0, 1,
-0.6214676, 1.130346, -1.641132, 0.3686275, 1, 0, 1,
-0.6193322, -1.629601, -5.030257, 0.3607843, 1, 0, 1,
-0.6174275, 0.298754, -1.137138, 0.3568628, 1, 0, 1,
-0.616151, 1.515071, -0.3366181, 0.3490196, 1, 0, 1,
-0.614988, 0.5176266, 0.1585717, 0.345098, 1, 0, 1,
-0.6146684, 1.556239, -1.676478, 0.3372549, 1, 0, 1,
-0.6139221, 0.5759089, -0.687526, 0.3333333, 1, 0, 1,
-0.6098619, -0.7038448, -1.248453, 0.3254902, 1, 0, 1,
-0.6091701, -1.239654, -4.093079, 0.3215686, 1, 0, 1,
-0.5969934, 1.69349, -0.6464761, 0.3137255, 1, 0, 1,
-0.5960655, 0.1301315, -2.08756, 0.3098039, 1, 0, 1,
-0.5896435, 0.4588456, -1.113158, 0.3019608, 1, 0, 1,
-0.5845825, -1.959373, -1.374615, 0.2941177, 1, 0, 1,
-0.5799007, 1.510618, -2.821244, 0.2901961, 1, 0, 1,
-0.5736251, 1.115469, -0.9832509, 0.282353, 1, 0, 1,
-0.5708659, -1.332678, -2.76357, 0.2784314, 1, 0, 1,
-0.5700105, -0.7403547, -3.008283, 0.2705882, 1, 0, 1,
-0.5665807, 0.172006, -2.068566, 0.2666667, 1, 0, 1,
-0.5649251, -1.43967, -3.461104, 0.2588235, 1, 0, 1,
-0.5640481, 2.014943, -0.4253352, 0.254902, 1, 0, 1,
-0.5590838, 0.7671348, 0.1645723, 0.2470588, 1, 0, 1,
-0.5562663, 0.4639935, 0.50337, 0.2431373, 1, 0, 1,
-0.5523358, 0.5317906, 0.6942623, 0.2352941, 1, 0, 1,
-0.5492064, 1.195034, 0.9290501, 0.2313726, 1, 0, 1,
-0.5491495, 0.7743664, -0.9858208, 0.2235294, 1, 0, 1,
-0.548301, -1.116538, -0.4524904, 0.2196078, 1, 0, 1,
-0.5407942, 0.3408651, -2.077631, 0.2117647, 1, 0, 1,
-0.537968, 0.494239, -1.465933, 0.2078431, 1, 0, 1,
-0.5363912, -1.049807, -2.64479, 0.2, 1, 0, 1,
-0.5335771, -0.6707932, -2.957829, 0.1921569, 1, 0, 1,
-0.5202068, 2.524324, 0.3592458, 0.1882353, 1, 0, 1,
-0.5201225, -0.127317, -2.537174, 0.1803922, 1, 0, 1,
-0.5189227, -0.3525964, -2.953613, 0.1764706, 1, 0, 1,
-0.5185924, -1.056962, -2.972334, 0.1686275, 1, 0, 1,
-0.5179623, -0.7351002, -2.891572, 0.1647059, 1, 0, 1,
-0.5175609, 0.1271598, -1.263124, 0.1568628, 1, 0, 1,
-0.5158325, 0.8635012, -0.7578619, 0.1529412, 1, 0, 1,
-0.5158281, -0.4171862, -2.016452, 0.145098, 1, 0, 1,
-0.5128266, 0.4660372, -0.9678282, 0.1411765, 1, 0, 1,
-0.5118876, 1.518191, -1.088844, 0.1333333, 1, 0, 1,
-0.5092996, -1.261512, -2.030387, 0.1294118, 1, 0, 1,
-0.5082874, 1.086969, -0.6506511, 0.1215686, 1, 0, 1,
-0.5080084, -1.613644, -2.04725, 0.1176471, 1, 0, 1,
-0.5047652, 1.013299, 0.6241193, 0.1098039, 1, 0, 1,
-0.5030351, -1.315772, -4.347269, 0.1058824, 1, 0, 1,
-0.5018387, 0.9795033, 0.02133723, 0.09803922, 1, 0, 1,
-0.500897, -1.162579, -3.825454, 0.09019608, 1, 0, 1,
-0.5008372, -0.2897812, -2.552548, 0.08627451, 1, 0, 1,
-0.4993284, 0.7926283, -0.2768009, 0.07843138, 1, 0, 1,
-0.4929238, -0.06635305, -2.055426, 0.07450981, 1, 0, 1,
-0.4927924, -0.465286, -2.490344, 0.06666667, 1, 0, 1,
-0.4901612, 1.209335, -0.4265379, 0.0627451, 1, 0, 1,
-0.4900874, -0.93356, -0.6474599, 0.05490196, 1, 0, 1,
-0.4785665, 1.287405, -2.142077, 0.05098039, 1, 0, 1,
-0.4782893, 0.04970392, -1.114143, 0.04313726, 1, 0, 1,
-0.4771504, -0.7185852, -1.940786, 0.03921569, 1, 0, 1,
-0.4760439, -0.005182209, -2.076809, 0.03137255, 1, 0, 1,
-0.4743818, 0.83156, -1.864634, 0.02745098, 1, 0, 1,
-0.4741919, 0.1364174, -2.330572, 0.01960784, 1, 0, 1,
-0.4741517, -2.282157, -2.337469, 0.01568628, 1, 0, 1,
-0.4731774, 0.03393902, -0.557379, 0.007843138, 1, 0, 1,
-0.4706927, 0.710781, -2.710304, 0.003921569, 1, 0, 1,
-0.4703561, -2.351314, -2.144848, 0, 1, 0.003921569, 1,
-0.4674895, 0.5801225, 0.2298405, 0, 1, 0.01176471, 1,
-0.4637042, 1.594963, -0.165084, 0, 1, 0.01568628, 1,
-0.4605297, 1.113, 0.8107092, 0, 1, 0.02352941, 1,
-0.4592257, 0.9365644, -0.2810327, 0, 1, 0.02745098, 1,
-0.4576156, -0.6588786, -2.164943, 0, 1, 0.03529412, 1,
-0.4545265, -0.5544275, -3.01699, 0, 1, 0.03921569, 1,
-0.4544829, 0.3493863, -1.378597, 0, 1, 0.04705882, 1,
-0.4516554, -2.167415, -4.802085, 0, 1, 0.05098039, 1,
-0.4503481, -0.6791397, -3.336733, 0, 1, 0.05882353, 1,
-0.4491727, -0.2491152, -1.598256, 0, 1, 0.0627451, 1,
-0.4437006, -0.3725472, -0.7733895, 0, 1, 0.07058824, 1,
-0.4426437, 1.192505, 0.2575899, 0, 1, 0.07450981, 1,
-0.440881, -0.2181611, -2.873264, 0, 1, 0.08235294, 1,
-0.438979, 3.244587, -0.4799173, 0, 1, 0.08627451, 1,
-0.4212117, 0.4010047, -0.2546543, 0, 1, 0.09411765, 1,
-0.4207064, 1.510919, -0.1439887, 0, 1, 0.1019608, 1,
-0.4193889, 1.091825, -1.024757, 0, 1, 0.1058824, 1,
-0.4180043, -2.069398, -4.386406, 0, 1, 0.1137255, 1,
-0.4153669, -0.850727, -2.772656, 0, 1, 0.1176471, 1,
-0.4115913, 2.454353, 0.5533845, 0, 1, 0.1254902, 1,
-0.4104618, -2.510331, -2.538591, 0, 1, 0.1294118, 1,
-0.406281, 0.172211, -0.4769632, 0, 1, 0.1372549, 1,
-0.4011628, 0.1537695, -0.9773401, 0, 1, 0.1411765, 1,
-0.4006166, 1.532445, 0.02737018, 0, 1, 0.1490196, 1,
-0.3982951, -0.03855278, -2.983873, 0, 1, 0.1529412, 1,
-0.3962125, -0.8076473, -3.61218, 0, 1, 0.1607843, 1,
-0.3924365, -0.5940053, -2.148974, 0, 1, 0.1647059, 1,
-0.3874678, 1.038985, -0.9434543, 0, 1, 0.172549, 1,
-0.3871874, -0.402892, -3.12256, 0, 1, 0.1764706, 1,
-0.3754637, -0.006649388, -2.138772, 0, 1, 0.1843137, 1,
-0.3739978, -0.6456, -2.858825, 0, 1, 0.1882353, 1,
-0.3730032, -2.314808, -3.1278, 0, 1, 0.1960784, 1,
-0.3699207, -0.1720432, -1.034129, 0, 1, 0.2039216, 1,
-0.3697082, 0.6836513, -2.174196, 0, 1, 0.2078431, 1,
-0.3653918, -0.3282987, -1.800475, 0, 1, 0.2156863, 1,
-0.3644136, 0.6246907, 0.1941012, 0, 1, 0.2196078, 1,
-0.3641451, -0.6585481, -0.4544809, 0, 1, 0.227451, 1,
-0.3623313, 0.01279771, -0.1438791, 0, 1, 0.2313726, 1,
-0.3615253, 0.4112369, -0.1717228, 0, 1, 0.2392157, 1,
-0.3583618, 0.2945768, -0.7024649, 0, 1, 0.2431373, 1,
-0.3572921, -0.7900106, -1.572123, 0, 1, 0.2509804, 1,
-0.3521846, -0.324455, -2.164599, 0, 1, 0.254902, 1,
-0.3475949, -0.5535356, -3.051053, 0, 1, 0.2627451, 1,
-0.3473851, -0.3090913, -1.597322, 0, 1, 0.2666667, 1,
-0.3462838, 0.1548396, -0.3603359, 0, 1, 0.2745098, 1,
-0.3378955, 1.419592, 1.069315, 0, 1, 0.2784314, 1,
-0.3365545, -1.54325, -1.968078, 0, 1, 0.2862745, 1,
-0.334181, -0.6493816, -3.978735, 0, 1, 0.2901961, 1,
-0.3333967, 0.1084513, -0.8721543, 0, 1, 0.2980392, 1,
-0.3310791, 1.184154, 0.1948203, 0, 1, 0.3058824, 1,
-0.3296202, 1.409616, -0.6402633, 0, 1, 0.3098039, 1,
-0.3222166, 0.7748209, -1.807186, 0, 1, 0.3176471, 1,
-0.3137037, 0.3868419, -0.9488026, 0, 1, 0.3215686, 1,
-0.3126779, -2.449254, -3.332447, 0, 1, 0.3294118, 1,
-0.3074464, 0.08184855, -1.726459, 0, 1, 0.3333333, 1,
-0.303551, -0.4154687, -1.877805, 0, 1, 0.3411765, 1,
-0.3010679, 1.146486, -1.571152, 0, 1, 0.345098, 1,
-0.2998402, -0.7669032, -2.426364, 0, 1, 0.3529412, 1,
-0.298665, -0.8456533, -2.017003, 0, 1, 0.3568628, 1,
-0.2976266, 1.639177, -1.323874, 0, 1, 0.3647059, 1,
-0.2952411, -0.002291166, -1.080611, 0, 1, 0.3686275, 1,
-0.2935268, 1.030642, 0.05271612, 0, 1, 0.3764706, 1,
-0.2933422, 0.2797211, -0.9820211, 0, 1, 0.3803922, 1,
-0.2930099, -0.2608105, -2.118152, 0, 1, 0.3882353, 1,
-0.2902299, -0.5063463, -1.930683, 0, 1, 0.3921569, 1,
-0.2893009, 0.1358168, -1.762778, 0, 1, 0.4, 1,
-0.287864, -0.2499803, -2.140823, 0, 1, 0.4078431, 1,
-0.2872171, 1.213722, -0.1154292, 0, 1, 0.4117647, 1,
-0.2862876, -0.1822349, -2.830634, 0, 1, 0.4196078, 1,
-0.2852888, 1.484285, 0.7759379, 0, 1, 0.4235294, 1,
-0.285015, 1.92732, -2.173649, 0, 1, 0.4313726, 1,
-0.2847062, 0.5023112, 0.6546332, 0, 1, 0.4352941, 1,
-0.2840511, 0.5132672, 0.05252947, 0, 1, 0.4431373, 1,
-0.2807505, -0.4436258, -2.517254, 0, 1, 0.4470588, 1,
-0.2794017, 0.1983204, -0.573525, 0, 1, 0.454902, 1,
-0.2785438, 0.2723053, -1.783617, 0, 1, 0.4588235, 1,
-0.2783235, -0.9956759, -3.318158, 0, 1, 0.4666667, 1,
-0.2741416, -0.1858769, -2.645845, 0, 1, 0.4705882, 1,
-0.2633572, -0.9139152, -2.726902, 0, 1, 0.4784314, 1,
-0.2496259, 1.016545, 1.271496, 0, 1, 0.4823529, 1,
-0.2489901, 0.02466817, -0.9294574, 0, 1, 0.4901961, 1,
-0.2483998, 0.406781, -1.433754, 0, 1, 0.4941176, 1,
-0.2465014, 0.1476585, -0.6217, 0, 1, 0.5019608, 1,
-0.2451154, 0.440912, 0.4152308, 0, 1, 0.509804, 1,
-0.2432003, 1.06423, 0.06003152, 0, 1, 0.5137255, 1,
-0.2412733, -0.6327639, -3.327347, 0, 1, 0.5215687, 1,
-0.2382565, 0.004963521, -2.480861, 0, 1, 0.5254902, 1,
-0.2340484, -0.2576505, -1.149964, 0, 1, 0.5333334, 1,
-0.231835, 1.62232, -0.5617633, 0, 1, 0.5372549, 1,
-0.2308674, 1.204513, -2.123422, 0, 1, 0.5450981, 1,
-0.2299699, 0.06091992, -1.109982, 0, 1, 0.5490196, 1,
-0.2264212, 1.562812, 1.077874, 0, 1, 0.5568628, 1,
-0.2223632, 0.7310922, 0.1359656, 0, 1, 0.5607843, 1,
-0.2215115, -0.03868248, -3.503527, 0, 1, 0.5686275, 1,
-0.2181936, -0.6655505, -1.672747, 0, 1, 0.572549, 1,
-0.2165713, -0.5125607, -3.002716, 0, 1, 0.5803922, 1,
-0.2154254, 0.3966845, -0.4906295, 0, 1, 0.5843138, 1,
-0.2130395, -0.7167348, -3.243781, 0, 1, 0.5921569, 1,
-0.2100052, 1.589742, 0.4082952, 0, 1, 0.5960785, 1,
-0.2076205, 1.643854, -0.9145353, 0, 1, 0.6039216, 1,
-0.2016488, -0.7936906, -2.831966, 0, 1, 0.6117647, 1,
-0.1991156, -0.8907381, -3.948799, 0, 1, 0.6156863, 1,
-0.1991016, -0.558437, -1.569784, 0, 1, 0.6235294, 1,
-0.1971443, -0.7579414, -4.463711, 0, 1, 0.627451, 1,
-0.1963451, 1.413318, 0.07498828, 0, 1, 0.6352941, 1,
-0.1919181, 1.659663, -0.3980052, 0, 1, 0.6392157, 1,
-0.1879207, -1.055511, -2.321525, 0, 1, 0.6470588, 1,
-0.186392, 1.146686, 1.257297, 0, 1, 0.6509804, 1,
-0.1860403, -0.09427123, -2.383791, 0, 1, 0.6588235, 1,
-0.180007, -0.5163209, -2.684025, 0, 1, 0.6627451, 1,
-0.1796801, -1.114708, -3.724225, 0, 1, 0.6705883, 1,
-0.1754682, 1.046184, 0.7237611, 0, 1, 0.6745098, 1,
-0.173585, 0.5293967, 0.6655716, 0, 1, 0.682353, 1,
-0.1725371, 0.4825124, -1.773266, 0, 1, 0.6862745, 1,
-0.161054, -1.121512, -3.72337, 0, 1, 0.6941177, 1,
-0.1591869, -0.01445481, -1.28475, 0, 1, 0.7019608, 1,
-0.155563, -0.1636753, -2.185057, 0, 1, 0.7058824, 1,
-0.15042, 0.04759485, -1.888325, 0, 1, 0.7137255, 1,
-0.1435971, -0.8734474, -2.979394, 0, 1, 0.7176471, 1,
-0.1434148, -0.4929669, -5.470522, 0, 1, 0.7254902, 1,
-0.142897, -0.002554214, -0.5874807, 0, 1, 0.7294118, 1,
-0.1410385, -0.2117166, -2.883506, 0, 1, 0.7372549, 1,
-0.1397804, -0.4565414, -2.700004, 0, 1, 0.7411765, 1,
-0.1395034, 0.9184792, -1.35803, 0, 1, 0.7490196, 1,
-0.1393435, 0.6969726, -1.102581, 0, 1, 0.7529412, 1,
-0.1391022, -0.1477793, -2.801588, 0, 1, 0.7607843, 1,
-0.1343161, -0.5542185, -2.751222, 0, 1, 0.7647059, 1,
-0.1313917, -0.7622259, -3.020156, 0, 1, 0.772549, 1,
-0.1266571, 0.7713833, 0.3407907, 0, 1, 0.7764706, 1,
-0.1240921, 0.7406919, -1.27137, 0, 1, 0.7843137, 1,
-0.1236263, -0.05880414, -1.547721, 0, 1, 0.7882353, 1,
-0.1229779, 0.6650608, 0.4002853, 0, 1, 0.7960784, 1,
-0.1216124, -0.2747679, -3.860648, 0, 1, 0.8039216, 1,
-0.1172117, -0.487876, -1.876786, 0, 1, 0.8078431, 1,
-0.1154873, -1.080644, -3.642896, 0, 1, 0.8156863, 1,
-0.1148568, 1.686488, 1.094458, 0, 1, 0.8196079, 1,
-0.1082593, 0.8516256, -0.8964716, 0, 1, 0.827451, 1,
-0.1074597, -1.089502, -4.354116, 0, 1, 0.8313726, 1,
-0.1050814, 3.118497, -0.8971364, 0, 1, 0.8392157, 1,
-0.09963471, -0.144921, -1.962569, 0, 1, 0.8431373, 1,
-0.09850764, -0.1327381, -2.234394, 0, 1, 0.8509804, 1,
-0.09199946, 0.813621, -0.157705, 0, 1, 0.854902, 1,
-0.09037736, 0.08128698, -2.13895, 0, 1, 0.8627451, 1,
-0.08058246, -0.4576099, -0.3103539, 0, 1, 0.8666667, 1,
-0.07690387, 0.09061149, -0.6527129, 0, 1, 0.8745098, 1,
-0.07584889, -0.6071997, -3.165834, 0, 1, 0.8784314, 1,
-0.07575364, 1.203809, -0.2978027, 0, 1, 0.8862745, 1,
-0.07241137, 0.03821259, -2.943738, 0, 1, 0.8901961, 1,
-0.07226855, -0.3088054, -3.079375, 0, 1, 0.8980392, 1,
-0.07142843, -0.4240571, -2.996318, 0, 1, 0.9058824, 1,
-0.07085279, -0.2161794, -2.410672, 0, 1, 0.9098039, 1,
-0.06243829, -0.8460613, -3.077356, 0, 1, 0.9176471, 1,
-0.05745101, -0.3206102, -3.785619, 0, 1, 0.9215686, 1,
-0.05699244, -0.2345654, -1.234416, 0, 1, 0.9294118, 1,
-0.05640116, -0.2289538, -4.724604, 0, 1, 0.9333333, 1,
-0.05576995, 0.9120927, -0.0988133, 0, 1, 0.9411765, 1,
-0.05240369, 2.270139, 0.6401908, 0, 1, 0.945098, 1,
-0.05201845, -0.2192139, -5.093421, 0, 1, 0.9529412, 1,
-0.05179513, 1.143762, -1.001973, 0, 1, 0.9568627, 1,
-0.04634102, 0.2145411, -1.054771, 0, 1, 0.9647059, 1,
-0.0453447, -0.4558517, -2.084483, 0, 1, 0.9686275, 1,
-0.04105483, 0.2929735, -0.5166585, 0, 1, 0.9764706, 1,
-0.03829616, 0.465669, -0.6677166, 0, 1, 0.9803922, 1,
-0.03473239, -1.091213, -4.467875, 0, 1, 0.9882353, 1,
-0.03260364, 0.8231242, -1.345438, 0, 1, 0.9921569, 1,
-0.02857048, 0.5683846, -0.2947492, 0, 1, 1, 1,
-0.02556117, 0.7894192, 1.66665, 0, 0.9921569, 1, 1,
-0.02355371, -0.4391702, -2.936751, 0, 0.9882353, 1, 1,
-0.01609386, -1.169632, -2.436253, 0, 0.9803922, 1, 1,
-0.01316845, -0.5039937, -3.167708, 0, 0.9764706, 1, 1,
-0.01191328, 0.6299774, -0.138006, 0, 0.9686275, 1, 1,
-0.01178088, 0.5838192, 0.5426551, 0, 0.9647059, 1, 1,
-0.0114273, -0.5694382, -3.666111, 0, 0.9568627, 1, 1,
-0.006874244, -0.4981556, -3.652988, 0, 0.9529412, 1, 1,
-0.005080136, 0.1503568, -0.5842375, 0, 0.945098, 1, 1,
-0.00400747, 1.997382, 1.096965, 0, 0.9411765, 1, 1,
-0.001803009, -0.3772454, -3.721133, 0, 0.9333333, 1, 1,
-0.001289321, 0.2115346, 0.8137551, 0, 0.9294118, 1, 1,
-0.0001229387, -2.38081, -3.170906, 0, 0.9215686, 1, 1,
0.0007395235, 0.2642994, -0.8535843, 0, 0.9176471, 1, 1,
0.005790364, 0.172393, 0.3034404, 0, 0.9098039, 1, 1,
0.006201606, 0.4290291, 0.5516533, 0, 0.9058824, 1, 1,
0.008095574, 1.124416, -0.6189156, 0, 0.8980392, 1, 1,
0.009492003, -0.5822066, 4.660384, 0, 0.8901961, 1, 1,
0.009535154, 0.1455401, -0.6266534, 0, 0.8862745, 1, 1,
0.01261414, -0.4818894, 1.651037, 0, 0.8784314, 1, 1,
0.01333679, -0.2252579, 4.810195, 0, 0.8745098, 1, 1,
0.01665716, 3.666893, -2.425205, 0, 0.8666667, 1, 1,
0.01851114, 0.9329488, 0.4345458, 0, 0.8627451, 1, 1,
0.02390076, 0.09192549, 1.537158, 0, 0.854902, 1, 1,
0.02417382, -1.190232, 3.564338, 0, 0.8509804, 1, 1,
0.02673549, 0.1028355, -0.6179094, 0, 0.8431373, 1, 1,
0.02818344, 1.721678, 0.5514948, 0, 0.8392157, 1, 1,
0.03068072, -0.276498, 3.56022, 0, 0.8313726, 1, 1,
0.03182505, 0.2268112, 2.485691, 0, 0.827451, 1, 1,
0.03346687, 2.184271, 0.6565335, 0, 0.8196079, 1, 1,
0.03491756, 0.7757174, 2.255506, 0, 0.8156863, 1, 1,
0.03661046, -0.9834011, 3.265025, 0, 0.8078431, 1, 1,
0.03746481, 1.904765, 0.158414, 0, 0.8039216, 1, 1,
0.03903325, -0.3214225, 4.725449, 0, 0.7960784, 1, 1,
0.03955681, 1.588242, 1.059643, 0, 0.7882353, 1, 1,
0.04185401, -1.060825, 1.881331, 0, 0.7843137, 1, 1,
0.0433255, -1.476125, 4.799094, 0, 0.7764706, 1, 1,
0.04538365, -0.7977658, 2.312953, 0, 0.772549, 1, 1,
0.04547289, -0.1565862, 1.455956, 0, 0.7647059, 1, 1,
0.04668307, -0.2139953, 3.11331, 0, 0.7607843, 1, 1,
0.04902351, 1.436319, -0.5444871, 0, 0.7529412, 1, 1,
0.05625072, -1.132992, 2.817993, 0, 0.7490196, 1, 1,
0.05662235, 0.1138246, 0.9105489, 0, 0.7411765, 1, 1,
0.05825064, -0.5765072, 0.8736213, 0, 0.7372549, 1, 1,
0.06117852, 1.358072, 0.08772822, 0, 0.7294118, 1, 1,
0.06595591, -0.09547556, 1.905691, 0, 0.7254902, 1, 1,
0.06760948, 0.121669, -0.2762401, 0, 0.7176471, 1, 1,
0.06833757, 0.5354925, -1.745489, 0, 0.7137255, 1, 1,
0.06843909, -2.449087, 2.7976, 0, 0.7058824, 1, 1,
0.06999072, 1.508933, 1.434491, 0, 0.6980392, 1, 1,
0.07165685, -0.2141276, 2.025995, 0, 0.6941177, 1, 1,
0.07667869, -0.2646816, 2.493355, 0, 0.6862745, 1, 1,
0.08371086, 0.04707628, 2.199044, 0, 0.682353, 1, 1,
0.08927041, 0.6748395, 0.9550942, 0, 0.6745098, 1, 1,
0.09380774, 1.697953, 1.214245, 0, 0.6705883, 1, 1,
0.09655726, -0.8366657, 3.032909, 0, 0.6627451, 1, 1,
0.1006243, 0.0830499, 1.166792, 0, 0.6588235, 1, 1,
0.1039055, 0.1119343, -1.246341, 0, 0.6509804, 1, 1,
0.1078536, 1.200034, 1.044292, 0, 0.6470588, 1, 1,
0.1092183, -0.950242, 2.624752, 0, 0.6392157, 1, 1,
0.1107018, 0.6126383, 1.616645, 0, 0.6352941, 1, 1,
0.1241366, -1.144178, 2.850125, 0, 0.627451, 1, 1,
0.1241791, 0.06584605, -0.2691457, 0, 0.6235294, 1, 1,
0.1277713, -1.100065, 3.005198, 0, 0.6156863, 1, 1,
0.1322326, -0.4175255, 2.22468, 0, 0.6117647, 1, 1,
0.1405668, 0.344212, -0.1016327, 0, 0.6039216, 1, 1,
0.1443627, -0.6638905, 2.93966, 0, 0.5960785, 1, 1,
0.1480268, 0.8917735, 1.54024, 0, 0.5921569, 1, 1,
0.1490743, 0.1138074, 1.505651, 0, 0.5843138, 1, 1,
0.1531446, -0.1123645, 1.148836, 0, 0.5803922, 1, 1,
0.1544298, -1.526653, 4.040879, 0, 0.572549, 1, 1,
0.1555489, 1.085726, -0.7538818, 0, 0.5686275, 1, 1,
0.1560068, -0.71224, 1.168212, 0, 0.5607843, 1, 1,
0.1562566, 2.001259, -1.982598, 0, 0.5568628, 1, 1,
0.1594453, -1.267707, 4.296028, 0, 0.5490196, 1, 1,
0.1596018, -0.3942876, 2.265225, 0, 0.5450981, 1, 1,
0.1601712, -0.805463, 2.866033, 0, 0.5372549, 1, 1,
0.1648051, -0.7956138, 2.5839, 0, 0.5333334, 1, 1,
0.1649811, -1.80905, 5.210068, 0, 0.5254902, 1, 1,
0.1667047, 1.278915, 1.380702, 0, 0.5215687, 1, 1,
0.1686347, 1.727373, 0.3589431, 0, 0.5137255, 1, 1,
0.1689478, -1.257425, 4.726891, 0, 0.509804, 1, 1,
0.1694159, -0.3904991, 2.043262, 0, 0.5019608, 1, 1,
0.1712958, 0.03426723, 2.151265, 0, 0.4941176, 1, 1,
0.1731262, -2.431782, 3.362272, 0, 0.4901961, 1, 1,
0.1740282, 0.2169573, -0.5961538, 0, 0.4823529, 1, 1,
0.1754734, 0.9099574, 0.3496507, 0, 0.4784314, 1, 1,
0.1783645, 1.85548, 0.4968435, 0, 0.4705882, 1, 1,
0.1798046, -0.5995098, 4.550714, 0, 0.4666667, 1, 1,
0.1798675, -0.6131065, 2.899842, 0, 0.4588235, 1, 1,
0.1800535, -0.3098327, 3.647267, 0, 0.454902, 1, 1,
0.1826266, 1.490289, -0.9531046, 0, 0.4470588, 1, 1,
0.1894796, 0.06642047, 0.8887362, 0, 0.4431373, 1, 1,
0.1903477, 1.577944, -1.489081, 0, 0.4352941, 1, 1,
0.1930036, 0.3188057, -0.565123, 0, 0.4313726, 1, 1,
0.1999805, 1.298345, 1.212413, 0, 0.4235294, 1, 1,
0.2014197, -0.8812121, 1.642276, 0, 0.4196078, 1, 1,
0.2017876, -0.04141971, 1.913175, 0, 0.4117647, 1, 1,
0.2053342, 0.2460183, -1.798508, 0, 0.4078431, 1, 1,
0.2056391, -0.5658139, 2.239895, 0, 0.4, 1, 1,
0.2080014, -0.3205612, 2.526824, 0, 0.3921569, 1, 1,
0.208404, 1.370062, -1.596696, 0, 0.3882353, 1, 1,
0.2149631, -2.728537, 1.386204, 0, 0.3803922, 1, 1,
0.2150455, -0.2630777, 4.325414, 0, 0.3764706, 1, 1,
0.2186436, -0.7899142, 1.993798, 0, 0.3686275, 1, 1,
0.2192114, -1.096396, 4.856174, 0, 0.3647059, 1, 1,
0.2197277, -0.6234714, 1.992025, 0, 0.3568628, 1, 1,
0.2246881, -0.385148, 2.576052, 0, 0.3529412, 1, 1,
0.2264508, 1.38104, -0.5537233, 0, 0.345098, 1, 1,
0.227048, -1.724986, 0.9494562, 0, 0.3411765, 1, 1,
0.228369, -2.209162, 4.094498, 0, 0.3333333, 1, 1,
0.2293016, 0.3001535, 0.5727013, 0, 0.3294118, 1, 1,
0.240011, 0.2243947, 1.905675, 0, 0.3215686, 1, 1,
0.2424692, -0.604435, 3.316701, 0, 0.3176471, 1, 1,
0.245068, -0.263916, 0.6578441, 0, 0.3098039, 1, 1,
0.2466061, 1.083511, 1.49617, 0, 0.3058824, 1, 1,
0.2469905, 0.6873326, 0.6738576, 0, 0.2980392, 1, 1,
0.2482013, 0.2796974, -0.3487715, 0, 0.2901961, 1, 1,
0.254771, 1.929275, 1.818357, 0, 0.2862745, 1, 1,
0.2602588, 0.2121857, 1.225164, 0, 0.2784314, 1, 1,
0.2621062, -0.4021532, 6.070575, 0, 0.2745098, 1, 1,
0.2638282, 0.3587632, -0.587495, 0, 0.2666667, 1, 1,
0.2747371, -0.2446389, 3.986598, 0, 0.2627451, 1, 1,
0.2749678, -0.4014781, 2.120856, 0, 0.254902, 1, 1,
0.2827466, -0.6509576, 1.74028, 0, 0.2509804, 1, 1,
0.2836417, 0.4920437, 1.178446, 0, 0.2431373, 1, 1,
0.2854962, 1.494898, -0.7093775, 0, 0.2392157, 1, 1,
0.2889132, -0.3298021, 4.094947, 0, 0.2313726, 1, 1,
0.2909139, -0.09328809, 0.134599, 0, 0.227451, 1, 1,
0.2983891, 1.516589, 0.3848209, 0, 0.2196078, 1, 1,
0.3014177, 0.2378423, -0.3302769, 0, 0.2156863, 1, 1,
0.3031377, 0.02508331, 1.953087, 0, 0.2078431, 1, 1,
0.3055598, 0.07255942, 1.974886, 0, 0.2039216, 1, 1,
0.3117038, -1.122251, 3.827115, 0, 0.1960784, 1, 1,
0.3188324, 0.1431854, -0.0364162, 0, 0.1882353, 1, 1,
0.3239449, -0.03663946, 2.058623, 0, 0.1843137, 1, 1,
0.3242094, -0.1038576, 0.817912, 0, 0.1764706, 1, 1,
0.3278708, -0.9778017, 3.671973, 0, 0.172549, 1, 1,
0.328157, -0.6321594, 2.294529, 0, 0.1647059, 1, 1,
0.3291274, -0.2849704, 0.9674897, 0, 0.1607843, 1, 1,
0.3313485, -0.363125, 1.221772, 0, 0.1529412, 1, 1,
0.3323996, 0.9286091, 0.5240272, 0, 0.1490196, 1, 1,
0.3369309, -0.2328668, 1.467676, 0, 0.1411765, 1, 1,
0.3380525, -2.057882, 3.39472, 0, 0.1372549, 1, 1,
0.3385648, -1.120683, 1.27363, 0, 0.1294118, 1, 1,
0.3386283, 1.444851, 1.923139, 0, 0.1254902, 1, 1,
0.339981, 0.5178936, 0.5439143, 0, 0.1176471, 1, 1,
0.3456797, 1.411351, 0.1333373, 0, 0.1137255, 1, 1,
0.3487337, 0.1951252, 2.37591, 0, 0.1058824, 1, 1,
0.3491953, -0.3465868, 1.082742, 0, 0.09803922, 1, 1,
0.3493187, 0.6378509, 1.52588, 0, 0.09411765, 1, 1,
0.3510417, 1.943119, -0.8701131, 0, 0.08627451, 1, 1,
0.3517527, -1.523454, 4.614147, 0, 0.08235294, 1, 1,
0.3565859, 1.007091, 0.6918768, 0, 0.07450981, 1, 1,
0.3612929, -0.4762607, 3.589411, 0, 0.07058824, 1, 1,
0.3619948, 1.001997, -0.5025341, 0, 0.0627451, 1, 1,
0.363454, -0.7717135, 4.476489, 0, 0.05882353, 1, 1,
0.3676843, 1.393179, 0.09116058, 0, 0.05098039, 1, 1,
0.3720122, -0.4273202, 3.293005, 0, 0.04705882, 1, 1,
0.3770464, 1.04936, 1.546904, 0, 0.03921569, 1, 1,
0.3780432, -0.2454821, 1.88135, 0, 0.03529412, 1, 1,
0.3832983, 0.5461731, -0.3150044, 0, 0.02745098, 1, 1,
0.3848327, -0.2886325, 3.030592, 0, 0.02352941, 1, 1,
0.3853137, -0.1204615, 1.401375, 0, 0.01568628, 1, 1,
0.385794, 1.169035, -0.03755794, 0, 0.01176471, 1, 1,
0.3887596, 0.7000425, -0.5850785, 0, 0.003921569, 1, 1,
0.3888116, -0.9671788, 3.13995, 0.003921569, 0, 1, 1,
0.3905262, 0.586368, 0.1115783, 0.007843138, 0, 1, 1,
0.3910454, 0.03595483, 1.057918, 0.01568628, 0, 1, 1,
0.3945096, 0.5257058, 0.4841859, 0.01960784, 0, 1, 1,
0.4048967, 0.4688869, -0.02521118, 0.02745098, 0, 1, 1,
0.4053485, 0.1469208, 0.3638456, 0.03137255, 0, 1, 1,
0.4086237, 1.144139, 0.03780825, 0.03921569, 0, 1, 1,
0.4108895, -0.004303589, 1.902431, 0.04313726, 0, 1, 1,
0.4144357, -0.7990968, 3.259805, 0.05098039, 0, 1, 1,
0.4150728, -0.536567, 2.454789, 0.05490196, 0, 1, 1,
0.4175043, 2.50807, -0.2146541, 0.0627451, 0, 1, 1,
0.4199875, -1.02773, 2.450764, 0.06666667, 0, 1, 1,
0.422771, -0.9323729, 2.266652, 0.07450981, 0, 1, 1,
0.4228087, 0.5616413, -0.2982703, 0.07843138, 0, 1, 1,
0.4264913, -1.111822, 3.716381, 0.08627451, 0, 1, 1,
0.4265693, 0.7640904, -0.08596865, 0.09019608, 0, 1, 1,
0.427206, 0.8659305, -1.204284, 0.09803922, 0, 1, 1,
0.4312978, -0.3786512, 3.083627, 0.1058824, 0, 1, 1,
0.4351636, 0.2306468, 0.6749178, 0.1098039, 0, 1, 1,
0.4382334, 3.495183, 1.223158, 0.1176471, 0, 1, 1,
0.4385288, 0.5350417, 0.4038422, 0.1215686, 0, 1, 1,
0.4387011, 0.7263261, 0.08053176, 0.1294118, 0, 1, 1,
0.4456552, 0.4666076, 2.36601, 0.1333333, 0, 1, 1,
0.4570317, 1.27907, 0.2712924, 0.1411765, 0, 1, 1,
0.4598236, 0.49017, 0.3493968, 0.145098, 0, 1, 1,
0.4735796, 1.199617, 2.682975, 0.1529412, 0, 1, 1,
0.4764878, 0.1530193, 0.4910087, 0.1568628, 0, 1, 1,
0.476875, -0.5189096, 1.739042, 0.1647059, 0, 1, 1,
0.4783436, 0.3027106, 0.2048113, 0.1686275, 0, 1, 1,
0.47995, 0.0804496, -0.1415002, 0.1764706, 0, 1, 1,
0.4800701, 2.4554, -1.784513, 0.1803922, 0, 1, 1,
0.4812331, -0.2868485, 1.428319, 0.1882353, 0, 1, 1,
0.4909014, -1.063727, 3.031331, 0.1921569, 0, 1, 1,
0.4934267, -1.594421, 1.865181, 0.2, 0, 1, 1,
0.4957553, 1.577188, -1.361487, 0.2078431, 0, 1, 1,
0.4988392, 0.2997732, 2.615303, 0.2117647, 0, 1, 1,
0.5055526, -0.5494326, 4.0007, 0.2196078, 0, 1, 1,
0.5097981, 0.7239885, -1.726835, 0.2235294, 0, 1, 1,
0.5148497, 0.2658414, 1.066553, 0.2313726, 0, 1, 1,
0.5149447, 0.4231904, 0.8533415, 0.2352941, 0, 1, 1,
0.5195422, -0.4784722, 2.22016, 0.2431373, 0, 1, 1,
0.5223501, -0.3920005, 3.171892, 0.2470588, 0, 1, 1,
0.5269719, 1.66002, 0.08704914, 0.254902, 0, 1, 1,
0.5337444, 0.177753, 2.148343, 0.2588235, 0, 1, 1,
0.5357387, 0.03528446, 1.013304, 0.2666667, 0, 1, 1,
0.5387087, 0.4853908, 1.282421, 0.2705882, 0, 1, 1,
0.5413898, -0.8067575, 2.591396, 0.2784314, 0, 1, 1,
0.5429505, 0.3538225, -0.7508486, 0.282353, 0, 1, 1,
0.5438977, 1.182921, 1.962834, 0.2901961, 0, 1, 1,
0.545079, 1.302726, 0.1050382, 0.2941177, 0, 1, 1,
0.5478846, -0.3749709, 2.804763, 0.3019608, 0, 1, 1,
0.5500152, -0.6638076, 3.295244, 0.3098039, 0, 1, 1,
0.5540702, -0.06439485, 0.8378189, 0.3137255, 0, 1, 1,
0.5558518, 0.6788283, -0.4635847, 0.3215686, 0, 1, 1,
0.5575197, 0.808596, 1.107344, 0.3254902, 0, 1, 1,
0.5600794, 0.4468549, 3.17526, 0.3333333, 0, 1, 1,
0.5627624, 0.6618818, 1.304605, 0.3372549, 0, 1, 1,
0.5654944, -0.2865604, 2.401377, 0.345098, 0, 1, 1,
0.5660226, 1.945783, -0.9132967, 0.3490196, 0, 1, 1,
0.5665097, 1.133477, 1.828584, 0.3568628, 0, 1, 1,
0.5719594, 0.6509668, 2.131156, 0.3607843, 0, 1, 1,
0.5772619, -0.6304338, 1.739093, 0.3686275, 0, 1, 1,
0.578102, -0.06661399, 1.180056, 0.372549, 0, 1, 1,
0.5820344, -0.2478123, 2.047968, 0.3803922, 0, 1, 1,
0.5878614, 1.156324, 2.007815, 0.3843137, 0, 1, 1,
0.5884719, 0.3585491, -0.01288275, 0.3921569, 0, 1, 1,
0.5910428, 0.3967774, -0.7463098, 0.3960784, 0, 1, 1,
0.596203, 1.01935, 1.234234, 0.4039216, 0, 1, 1,
0.5963051, 0.6823321, 1.43728, 0.4117647, 0, 1, 1,
0.6016674, 1.34849, 1.438951, 0.4156863, 0, 1, 1,
0.6024958, -1.361311, 4.250556, 0.4235294, 0, 1, 1,
0.602596, 1.726322, -0.8850971, 0.427451, 0, 1, 1,
0.6116815, -1.0426, 2.466407, 0.4352941, 0, 1, 1,
0.616111, 0.8587276, -1.039047, 0.4392157, 0, 1, 1,
0.6162868, 1.079077, -0.03148114, 0.4470588, 0, 1, 1,
0.6169652, 0.7667437, 1.67266, 0.4509804, 0, 1, 1,
0.6216601, 0.702224, 1.217588, 0.4588235, 0, 1, 1,
0.629858, 0.2090669, -0.130046, 0.4627451, 0, 1, 1,
0.6473311, 0.8709881, 0.8608021, 0.4705882, 0, 1, 1,
0.6480833, 1.694028, -1.539285, 0.4745098, 0, 1, 1,
0.6495858, -0.335242, 3.733473, 0.4823529, 0, 1, 1,
0.6633127, 0.5494808, 2.131891, 0.4862745, 0, 1, 1,
0.6642739, -1.034792, 2.871737, 0.4941176, 0, 1, 1,
0.6658079, -1.264685, 3.89705, 0.5019608, 0, 1, 1,
0.6701379, 0.9787903, 2.087302, 0.5058824, 0, 1, 1,
0.6711021, 0.08514854, 1.102023, 0.5137255, 0, 1, 1,
0.6730186, 0.3758368, 0.648726, 0.5176471, 0, 1, 1,
0.6777333, 1.395538, 0.5360515, 0.5254902, 0, 1, 1,
0.6794601, 0.2608934, -1.085751, 0.5294118, 0, 1, 1,
0.6812453, -0.08964496, 3.811081, 0.5372549, 0, 1, 1,
0.6855264, 0.4031155, 0.2762633, 0.5411765, 0, 1, 1,
0.6893102, -0.4869324, 0.5209541, 0.5490196, 0, 1, 1,
0.6906272, 0.01595431, 2.523258, 0.5529412, 0, 1, 1,
0.6910816, -0.01223728, 0.4767361, 0.5607843, 0, 1, 1,
0.6928006, 0.3226946, 2.65904, 0.5647059, 0, 1, 1,
0.6928753, -0.8832526, 1.428277, 0.572549, 0, 1, 1,
0.693759, 1.241662, -0.6395828, 0.5764706, 0, 1, 1,
0.6939733, -0.0315584, 2.733706, 0.5843138, 0, 1, 1,
0.6993062, -0.2517017, 1.624832, 0.5882353, 0, 1, 1,
0.6996444, 0.8848929, 1.422495, 0.5960785, 0, 1, 1,
0.6996558, -0.05540087, 1.00599, 0.6039216, 0, 1, 1,
0.7005538, -1.493347, 3.295757, 0.6078432, 0, 1, 1,
0.7083527, 1.048394, 0.5358827, 0.6156863, 0, 1, 1,
0.7086365, -0.2301772, 3.870532, 0.6196079, 0, 1, 1,
0.7194891, 0.8205627, 0.2441873, 0.627451, 0, 1, 1,
0.7313455, 0.1718455, 0.8324672, 0.6313726, 0, 1, 1,
0.7330748, -1.044513, 3.040331, 0.6392157, 0, 1, 1,
0.7336627, -1.449836, 2.975303, 0.6431373, 0, 1, 1,
0.7357371, 0.3169555, 1.918484, 0.6509804, 0, 1, 1,
0.7387637, 1.24884, 2.028342, 0.654902, 0, 1, 1,
0.7472462, -0.3481523, 1.927037, 0.6627451, 0, 1, 1,
0.7520994, -0.5360854, 1.758209, 0.6666667, 0, 1, 1,
0.7535757, -1.503349, 2.571269, 0.6745098, 0, 1, 1,
0.7542482, 0.6907739, 0.3776027, 0.6784314, 0, 1, 1,
0.757726, -1.428577, 1.898926, 0.6862745, 0, 1, 1,
0.7591785, 2.001291, 1.052956, 0.6901961, 0, 1, 1,
0.7602203, 0.1444395, -0.4486155, 0.6980392, 0, 1, 1,
0.7606221, -0.3672168, 1.620492, 0.7058824, 0, 1, 1,
0.7625968, 0.9575164, -0.3239147, 0.7098039, 0, 1, 1,
0.7628923, -1.030648, 1.678479, 0.7176471, 0, 1, 1,
0.7688805, 0.897966, 1.417525, 0.7215686, 0, 1, 1,
0.7709821, -1.62726, 4.325713, 0.7294118, 0, 1, 1,
0.7746363, -0.3215016, 2.604761, 0.7333333, 0, 1, 1,
0.7762109, -0.7811378, 1.792224, 0.7411765, 0, 1, 1,
0.7783619, 1.810809, -0.2321566, 0.7450981, 0, 1, 1,
0.7820041, -3.163136, 4.136869, 0.7529412, 0, 1, 1,
0.7844357, 0.05420416, -0.1085137, 0.7568628, 0, 1, 1,
0.7902511, -1.352432, 1.775528, 0.7647059, 0, 1, 1,
0.7913572, 0.05598849, 1.70561, 0.7686275, 0, 1, 1,
0.7930475, -0.2200611, 1.02388, 0.7764706, 0, 1, 1,
0.7938259, -0.7235214, 1.663321, 0.7803922, 0, 1, 1,
0.7958478, -0.811645, 1.951658, 0.7882353, 0, 1, 1,
0.8041857, 0.1727588, 1.719714, 0.7921569, 0, 1, 1,
0.8121605, 2.425843, 2.300504, 0.8, 0, 1, 1,
0.8169636, 0.3305611, 2.125342, 0.8078431, 0, 1, 1,
0.8241759, -0.1373363, 2.227859, 0.8117647, 0, 1, 1,
0.8291357, 0.441605, 1.625473, 0.8196079, 0, 1, 1,
0.8391459, 1.496869, -0.4550812, 0.8235294, 0, 1, 1,
0.839236, 0.4550675, 1.036821, 0.8313726, 0, 1, 1,
0.841318, 0.4887682, 1.10294, 0.8352941, 0, 1, 1,
0.8449259, 0.4920457, 1.539359, 0.8431373, 0, 1, 1,
0.845102, -0.2710516, 1.555985, 0.8470588, 0, 1, 1,
0.848859, -0.8035187, 2.292475, 0.854902, 0, 1, 1,
0.8569206, 1.332344, -0.7669452, 0.8588235, 0, 1, 1,
0.8626218, 0.523281, 1.791491, 0.8666667, 0, 1, 1,
0.8640419, -0.7690263, 3.981918, 0.8705882, 0, 1, 1,
0.871151, 0.7878416, 0.7582402, 0.8784314, 0, 1, 1,
0.8783673, 2.357013, 0.5876982, 0.8823529, 0, 1, 1,
0.8867978, -0.1335576, 3.759794, 0.8901961, 0, 1, 1,
0.8950052, 0.5594934, 1.789939, 0.8941177, 0, 1, 1,
0.9003755, -0.2595184, 3.593854, 0.9019608, 0, 1, 1,
0.9006252, 1.726721, 0.529163, 0.9098039, 0, 1, 1,
0.9059932, 0.03225129, 3.236139, 0.9137255, 0, 1, 1,
0.9063428, -0.09315658, 3.484118, 0.9215686, 0, 1, 1,
0.9069774, -0.380091, 2.004483, 0.9254902, 0, 1, 1,
0.9127014, 1.142003, 0.9115713, 0.9333333, 0, 1, 1,
0.9149892, -1.031496, 2.784802, 0.9372549, 0, 1, 1,
0.9193742, -1.884875, 4.514324, 0.945098, 0, 1, 1,
0.9245508, 1.196245, 1.545819, 0.9490196, 0, 1, 1,
0.9261692, -1.410553, 1.418052, 0.9568627, 0, 1, 1,
0.9390834, -1.082603, 1.50533, 0.9607843, 0, 1, 1,
0.9482244, -0.06278928, 1.179886, 0.9686275, 0, 1, 1,
0.9490994, 0.6089422, 0.02828562, 0.972549, 0, 1, 1,
0.9539495, 0.9060704, 0.1052484, 0.9803922, 0, 1, 1,
0.9547989, -0.7959434, 2.16326, 0.9843137, 0, 1, 1,
0.9640684, -0.4300809, 1.061487, 0.9921569, 0, 1, 1,
0.9796073, -0.06167475, 2.468395, 0.9960784, 0, 1, 1,
0.9835562, -0.7299792, 1.18038, 1, 0, 0.9960784, 1,
0.9906728, 0.3692682, 1.317683, 1, 0, 0.9882353, 1,
0.9960567, -0.8492005, 1.915465, 1, 0, 0.9843137, 1,
0.9991386, -0.8550659, 2.708449, 1, 0, 0.9764706, 1,
1.000146, -0.747678, 0.9546039, 1, 0, 0.972549, 1,
1.007271, -1.35174, 0.9276062, 1, 0, 0.9647059, 1,
1.007572, 0.5570266, 3.014965, 1, 0, 0.9607843, 1,
1.020881, -0.08859186, 1.724985, 1, 0, 0.9529412, 1,
1.021514, -0.330173, 1.634012, 1, 0, 0.9490196, 1,
1.024227, 0.5087246, 0.415113, 1, 0, 0.9411765, 1,
1.039897, -0.8638483, 4.921168, 1, 0, 0.9372549, 1,
1.048029, -0.4664566, 1.906176, 1, 0, 0.9294118, 1,
1.051101, -0.1365544, 2.164802, 1, 0, 0.9254902, 1,
1.054125, 0.4667717, 0.8968647, 1, 0, 0.9176471, 1,
1.063717, -0.2857065, 1.799138, 1, 0, 0.9137255, 1,
1.064808, 1.264567, 1.499787, 1, 0, 0.9058824, 1,
1.069566, 1.048146, 0.3572999, 1, 0, 0.9019608, 1,
1.078488, 0.1510902, 3.048632, 1, 0, 0.8941177, 1,
1.080766, -0.05931579, 0.9669112, 1, 0, 0.8862745, 1,
1.083879, 0.5706672, 0.5277613, 1, 0, 0.8823529, 1,
1.088243, 0.9102018, 1.18576, 1, 0, 0.8745098, 1,
1.097074, 0.3398762, 3.870278, 1, 0, 0.8705882, 1,
1.097253, -1.083841, 2.082816, 1, 0, 0.8627451, 1,
1.100498, -0.6287936, 1.974733, 1, 0, 0.8588235, 1,
1.100987, -0.6026753, 2.242131, 1, 0, 0.8509804, 1,
1.102128, -0.2873907, 1.739096, 1, 0, 0.8470588, 1,
1.116526, 0.4779097, 0.9560913, 1, 0, 0.8392157, 1,
1.124905, 0.2860641, 0.6070372, 1, 0, 0.8352941, 1,
1.127135, -0.9822847, 2.071024, 1, 0, 0.827451, 1,
1.127272, 1.439456, 1.152099, 1, 0, 0.8235294, 1,
1.12873, -1.140882, 2.479359, 1, 0, 0.8156863, 1,
1.139245, -0.1067626, 1.130869, 1, 0, 0.8117647, 1,
1.141822, -0.9420909, 2.470045, 1, 0, 0.8039216, 1,
1.155033, -0.5424067, 1.328296, 1, 0, 0.7960784, 1,
1.156384, -0.4648532, 0.008919511, 1, 0, 0.7921569, 1,
1.157713, 0.2481958, 2.405093, 1, 0, 0.7843137, 1,
1.159778, -1.119148, 2.162616, 1, 0, 0.7803922, 1,
1.160525, -1.907928, 2.522719, 1, 0, 0.772549, 1,
1.161097, 0.09567866, 2.161589, 1, 0, 0.7686275, 1,
1.161452, 1.694343, -0.2095357, 1, 0, 0.7607843, 1,
1.165542, -0.8995823, 1.419244, 1, 0, 0.7568628, 1,
1.175749, 0.1787835, 3.777071, 1, 0, 0.7490196, 1,
1.175964, -0.9329506, 2.038856, 1, 0, 0.7450981, 1,
1.187608, -1.139707, 2.46089, 1, 0, 0.7372549, 1,
1.190241, -1.252937, 1.376042, 1, 0, 0.7333333, 1,
1.191225, -2.302333, 2.258345, 1, 0, 0.7254902, 1,
1.194104, -2.456043, 3.001556, 1, 0, 0.7215686, 1,
1.20024, 0.9721723, 1.58906, 1, 0, 0.7137255, 1,
1.203134, -0.7697664, 2.366323, 1, 0, 0.7098039, 1,
1.206754, -0.3398937, 2.62043, 1, 0, 0.7019608, 1,
1.219261, -0.6650891, 1.295287, 1, 0, 0.6941177, 1,
1.228922, 1.554335, 0.1615337, 1, 0, 0.6901961, 1,
1.232007, -0.9496294, 1.963701, 1, 0, 0.682353, 1,
1.232723, -1.225315, 2.129943, 1, 0, 0.6784314, 1,
1.23466, 0.7646238, 1.55854, 1, 0, 0.6705883, 1,
1.252597, -2.002211, 0.540633, 1, 0, 0.6666667, 1,
1.25578, 1.38165, 1.146019, 1, 0, 0.6588235, 1,
1.258964, -0.737838, 1.129104, 1, 0, 0.654902, 1,
1.279407, -0.6496368, 3.59404, 1, 0, 0.6470588, 1,
1.285723, 0.6578373, 0.9701422, 1, 0, 0.6431373, 1,
1.289038, 0.526156, 0.1251108, 1, 0, 0.6352941, 1,
1.292087, 1.696939, 1.802533, 1, 0, 0.6313726, 1,
1.295037, -0.6023043, 1.288741, 1, 0, 0.6235294, 1,
1.299486, 0.3140247, 0.8479347, 1, 0, 0.6196079, 1,
1.302533, 1.389208, 0.992911, 1, 0, 0.6117647, 1,
1.306778, -1.170922, 2.875637, 1, 0, 0.6078432, 1,
1.308341, -0.6283652, 2.599987, 1, 0, 0.6, 1,
1.314693, -0.8852327, 1.662404, 1, 0, 0.5921569, 1,
1.317868, 0.8141547, 1.545337, 1, 0, 0.5882353, 1,
1.339704, -0.2733196, 1.955499, 1, 0, 0.5803922, 1,
1.345292, 0.5526985, 2.007254, 1, 0, 0.5764706, 1,
1.349694, 0.4231631, 1.742429, 1, 0, 0.5686275, 1,
1.349742, 1.097804, 2.950362, 1, 0, 0.5647059, 1,
1.351527, -0.9813115, 3.22608, 1, 0, 0.5568628, 1,
1.362401, -0.9451003, 0.8872051, 1, 0, 0.5529412, 1,
1.371696, -1.276916, 0.4913771, 1, 0, 0.5450981, 1,
1.37185, 0.4996072, -0.1710442, 1, 0, 0.5411765, 1,
1.374171, 0.5134211, 0.05959695, 1, 0, 0.5333334, 1,
1.376753, -0.1742848, 0.5984033, 1, 0, 0.5294118, 1,
1.38702, 0.702866, 1.608932, 1, 0, 0.5215687, 1,
1.391726, 0.01064187, 2.475569, 1, 0, 0.5176471, 1,
1.406877, 0.3043077, 1.234744, 1, 0, 0.509804, 1,
1.412544, -0.2945083, 1.202957, 1, 0, 0.5058824, 1,
1.427274, -2.39594, 2.026428, 1, 0, 0.4980392, 1,
1.433211, -0.9692393, 0.9901135, 1, 0, 0.4901961, 1,
1.443506, -0.7341186, 1.508427, 1, 0, 0.4862745, 1,
1.447758, 1.596236, -1.496062, 1, 0, 0.4784314, 1,
1.459298, 0.3514673, 2.782631, 1, 0, 0.4745098, 1,
1.467234, 1.721861, 1.364062, 1, 0, 0.4666667, 1,
1.476752, 0.7339584, 0.1618847, 1, 0, 0.4627451, 1,
1.479494, -1.868349, 3.050135, 1, 0, 0.454902, 1,
1.486065, 0.1039544, 1.561515, 1, 0, 0.4509804, 1,
1.510716, 0.2117397, 1.239123, 1, 0, 0.4431373, 1,
1.51783, 1.683083, -0.2392721, 1, 0, 0.4392157, 1,
1.535124, 0.01460632, 2.778764, 1, 0, 0.4313726, 1,
1.535922, 1.177914, -0.771811, 1, 0, 0.427451, 1,
1.539285, -0.9376288, 2.461446, 1, 0, 0.4196078, 1,
1.550781, 1.511209, 0.8742834, 1, 0, 0.4156863, 1,
1.555184, 0.9339285, 1.808226, 1, 0, 0.4078431, 1,
1.561499, 0.3493027, 2.68074, 1, 0, 0.4039216, 1,
1.571731, 2.2665, 1.434746, 1, 0, 0.3960784, 1,
1.580397, 0.9514652, 0.9869374, 1, 0, 0.3882353, 1,
1.584224, -1.198879, 1.500332, 1, 0, 0.3843137, 1,
1.588567, 1.477029, 1.526616, 1, 0, 0.3764706, 1,
1.590029, 0.2377087, 2.107863, 1, 0, 0.372549, 1,
1.594411, -2.851397, 3.400291, 1, 0, 0.3647059, 1,
1.606736, -0.8803399, 0.2652694, 1, 0, 0.3607843, 1,
1.619132, 0.2810333, 0.09503851, 1, 0, 0.3529412, 1,
1.627776, 1.573204, 1.196256, 1, 0, 0.3490196, 1,
1.629227, -0.6134887, 1.360274, 1, 0, 0.3411765, 1,
1.635257, -0.08245688, 2.628966, 1, 0, 0.3372549, 1,
1.642719, -0.6717313, 1.698721, 1, 0, 0.3294118, 1,
1.646887, -0.4410275, 1.914019, 1, 0, 0.3254902, 1,
1.648349, -0.5110071, 3.54033, 1, 0, 0.3176471, 1,
1.650125, -1.153459, 1.588304, 1, 0, 0.3137255, 1,
1.658716, 0.8822341, 1.453695, 1, 0, 0.3058824, 1,
1.665312, -0.2713684, 2.413676, 1, 0, 0.2980392, 1,
1.680291, -0.1781584, 1.590748, 1, 0, 0.2941177, 1,
1.684051, -0.2180887, 2.198833, 1, 0, 0.2862745, 1,
1.685521, 0.1361252, 1.096079, 1, 0, 0.282353, 1,
1.686265, 0.1776839, 1.016025, 1, 0, 0.2745098, 1,
1.704099, 0.9467846, 0.2733152, 1, 0, 0.2705882, 1,
1.70533, -0.8303536, 3.196508, 1, 0, 0.2627451, 1,
1.70944, 0.1145156, 0.9070301, 1, 0, 0.2588235, 1,
1.710573, 0.1185007, 1.096144, 1, 0, 0.2509804, 1,
1.721075, -0.5933321, 3.215697, 1, 0, 0.2470588, 1,
1.724268, 1.380141, 0.9156027, 1, 0, 0.2392157, 1,
1.747479, -0.4435704, -0.1610246, 1, 0, 0.2352941, 1,
1.748443, -0.4747428, 1.312284, 1, 0, 0.227451, 1,
1.759641, 0.8602782, 2.112789, 1, 0, 0.2235294, 1,
1.789142, 0.1599357, 2.114651, 1, 0, 0.2156863, 1,
1.816171, 1.106638, 0.533428, 1, 0, 0.2117647, 1,
1.828168, 1.100461, 0.8194448, 1, 0, 0.2039216, 1,
1.836121, -1.289455, 2.102878, 1, 0, 0.1960784, 1,
1.850714, -1.064404, 4.29686, 1, 0, 0.1921569, 1,
1.8634, 1.382628, 0.5075604, 1, 0, 0.1843137, 1,
1.866435, 0.2915591, 0.1817825, 1, 0, 0.1803922, 1,
1.874616, -1.087934, 1.762086, 1, 0, 0.172549, 1,
1.902394, 0.7878894, 1.429033, 1, 0, 0.1686275, 1,
1.903553, 0.6498792, 2.474417, 1, 0, 0.1607843, 1,
1.942961, 1.0984, 2.102987, 1, 0, 0.1568628, 1,
1.963728, 0.5593431, 1.491282, 1, 0, 0.1490196, 1,
2.025939, 0.7477842, -0.2196045, 1, 0, 0.145098, 1,
2.046526, 1.496816, 2.137752, 1, 0, 0.1372549, 1,
2.049919, -0.05027768, 1.502967, 1, 0, 0.1333333, 1,
2.063275, -0.09837981, 1.288472, 1, 0, 0.1254902, 1,
2.088706, -1.53681, 1.321958, 1, 0, 0.1215686, 1,
2.104164, 0.6615738, 0.8469359, 1, 0, 0.1137255, 1,
2.112247, -0.695461, 2.76712, 1, 0, 0.1098039, 1,
2.121059, -1.053227, 1.258017, 1, 0, 0.1019608, 1,
2.121173, 0.9881838, 1.055639, 1, 0, 0.09411765, 1,
2.13424, 0.3396811, 1.273933, 1, 0, 0.09019608, 1,
2.160123, -0.6869168, 2.610238, 1, 0, 0.08235294, 1,
2.163831, -2.258684, 1.523794, 1, 0, 0.07843138, 1,
2.173308, -1.468153, 1.397945, 1, 0, 0.07058824, 1,
2.176734, -0.3906486, 2.898588, 1, 0, 0.06666667, 1,
2.20191, -0.7783755, 1.690075, 1, 0, 0.05882353, 1,
2.220541, 0.05580953, 3.055413, 1, 0, 0.05490196, 1,
2.262074, -0.1524111, 2.423027, 1, 0, 0.04705882, 1,
2.365848, 0.2549776, 2.514089, 1, 0, 0.04313726, 1,
2.389297, -0.378496, 1.1961, 1, 0, 0.03529412, 1,
2.444566, -0.727441, -1.233757, 1, 0, 0.03137255, 1,
2.46432, -1.976031, 2.521287, 1, 0, 0.02352941, 1,
2.513016, -1.061637, 2.880142, 1, 0, 0.01960784, 1,
2.784379, 0.5525077, 1.526502, 1, 0, 0.01176471, 1,
3.520432, 1.035419, 1.06927, 1, 0, 0.007843138, 1
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
0.3665596, -4.338454, -7.426738, 0, -0.5, 0.5, 0.5,
0.3665596, -4.338454, -7.426738, 1, -0.5, 0.5, 0.5,
0.3665596, -4.338454, -7.426738, 1, 1.5, 0.5, 0.5,
0.3665596, -4.338454, -7.426738, 0, 1.5, 0.5, 0.5
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
-3.856475, 0.2443423, -7.426738, 0, -0.5, 0.5, 0.5,
-3.856475, 0.2443423, -7.426738, 1, -0.5, 0.5, 0.5,
-3.856475, 0.2443423, -7.426738, 1, 1.5, 0.5, 0.5,
-3.856475, 0.2443423, -7.426738, 0, 1.5, 0.5, 0.5
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
-3.856475, -4.338454, 0.3000262, 0, -0.5, 0.5, 0.5,
-3.856475, -4.338454, 0.3000262, 1, -0.5, 0.5, 0.5,
-3.856475, -4.338454, 0.3000262, 1, 1.5, 0.5, 0.5,
-3.856475, -4.338454, 0.3000262, 0, 1.5, 0.5, 0.5
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
-2, -3.280885, -5.643639,
3, -3.280885, -5.643639,
-2, -3.280885, -5.643639,
-2, -3.457147, -5.940822,
-1, -3.280885, -5.643639,
-1, -3.457147, -5.940822,
0, -3.280885, -5.643639,
0, -3.457147, -5.940822,
1, -3.280885, -5.643639,
1, -3.457147, -5.940822,
2, -3.280885, -5.643639,
2, -3.457147, -5.940822,
3, -3.280885, -5.643639,
3, -3.457147, -5.940822
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
-2, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
-2, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
-2, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
-2, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5,
-1, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
-1, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
-1, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
-1, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5,
0, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
0, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
0, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
0, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5,
1, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
1, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
1, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
1, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5,
2, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
2, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
2, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
2, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5,
3, -3.809669, -6.535189, 0, -0.5, 0.5, 0.5,
3, -3.809669, -6.535189, 1, -0.5, 0.5, 0.5,
3, -3.809669, -6.535189, 1, 1.5, 0.5, 0.5,
3, -3.809669, -6.535189, 0, 1.5, 0.5, 0.5
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
-2.881928, -3, -5.643639,
-2.881928, 3, -5.643639,
-2.881928, -3, -5.643639,
-3.044353, -3, -5.940822,
-2.881928, -2, -5.643639,
-3.044353, -2, -5.940822,
-2.881928, -1, -5.643639,
-3.044353, -1, -5.940822,
-2.881928, 0, -5.643639,
-3.044353, 0, -5.940822,
-2.881928, 1, -5.643639,
-3.044353, 1, -5.940822,
-2.881928, 2, -5.643639,
-3.044353, 2, -5.940822,
-2.881928, 3, -5.643639,
-3.044353, 3, -5.940822
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
-3.369202, -3, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, -3, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, -3, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, -3, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, -2, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, -2, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, -2, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, -2, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, -1, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, -1, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, -1, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, -1, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, 0, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, 0, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, 0, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, 0, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, 1, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, 1, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, 1, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, 1, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, 2, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, 2, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, 2, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, 2, -6.535189, 0, 1.5, 0.5, 0.5,
-3.369202, 3, -6.535189, 0, -0.5, 0.5, 0.5,
-3.369202, 3, -6.535189, 1, -0.5, 0.5, 0.5,
-3.369202, 3, -6.535189, 1, 1.5, 0.5, 0.5,
-3.369202, 3, -6.535189, 0, 1.5, 0.5, 0.5
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
-2.881928, -3.280885, -4,
-2.881928, -3.280885, 6,
-2.881928, -3.280885, -4,
-3.044353, -3.457147, -4,
-2.881928, -3.280885, -2,
-3.044353, -3.457147, -2,
-2.881928, -3.280885, 0,
-3.044353, -3.457147, 0,
-2.881928, -3.280885, 2,
-3.044353, -3.457147, 2,
-2.881928, -3.280885, 4,
-3.044353, -3.457147, 4,
-2.881928, -3.280885, 6,
-3.044353, -3.457147, 6
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
"4",
"6"
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
-3.369202, -3.809669, -4, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, -4, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, -4, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, -4, 0, 1.5, 0.5, 0.5,
-3.369202, -3.809669, -2, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, -2, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, -2, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, -2, 0, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 0, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 0, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 0, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 0, 0, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 2, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 2, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 2, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 2, 0, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 4, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 4, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 4, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 4, 0, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 6, 0, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 6, 1, -0.5, 0.5, 0.5,
-3.369202, -3.809669, 6, 1, 1.5, 0.5, 0.5,
-3.369202, -3.809669, 6, 0, 1.5, 0.5, 0.5
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
-2.881928, -3.280885, -5.643639,
-2.881928, 3.76957, -5.643639,
-2.881928, -3.280885, 6.243691,
-2.881928, 3.76957, 6.243691,
-2.881928, -3.280885, -5.643639,
-2.881928, -3.280885, 6.243691,
-2.881928, 3.76957, -5.643639,
-2.881928, 3.76957, 6.243691,
-2.881928, -3.280885, -5.643639,
3.615048, -3.280885, -5.643639,
-2.881928, -3.280885, 6.243691,
3.615048, -3.280885, 6.243691,
-2.881928, 3.76957, -5.643639,
3.615048, 3.76957, -5.643639,
-2.881928, 3.76957, 6.243691,
3.615048, 3.76957, 6.243691,
3.615048, -3.280885, -5.643639,
3.615048, 3.76957, -5.643639,
3.615048, -3.280885, 6.243691,
3.615048, 3.76957, 6.243691,
3.615048, -3.280885, -5.643639,
3.615048, -3.280885, 6.243691,
3.615048, 3.76957, -5.643639,
3.615048, 3.76957, 6.243691
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
var radius = 8.154851;
var distance = 36.28185;
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
mvMatrix.translate( -0.3665596, -0.2443423, -0.3000262 );
mvMatrix.scale( 1.357121, 1.250584, 0.7417296 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.28185);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
metolachlor<-read.table("metolachlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metolachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'metolachlor' not found
```

```r
y<-metolachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'metolachlor' not found
```

```r
z<-metolachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'metolachlor' not found
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
-2.787312, 2.287853, -1.637061, 0, 0, 1, 1, 1,
-2.612857, -0.4127842, -3.121751, 1, 0, 0, 1, 1,
-2.490684, 0.862582, -1.394863, 1, 0, 0, 1, 1,
-2.440826, 2.670974, -0.7003977, 1, 0, 0, 1, 1,
-2.336013, 0.8875069, -1.368352, 1, 0, 0, 1, 1,
-2.31405, -0.5479316, -1.97862, 1, 0, 0, 1, 1,
-2.287782, -0.6539616, 0.2955631, 0, 0, 0, 1, 1,
-2.221308, -0.3190706, -0.8342459, 0, 0, 0, 1, 1,
-2.214277, 0.1369688, -0.3113945, 0, 0, 0, 1, 1,
-2.20869, 1.116309, -0.6051033, 0, 0, 0, 1, 1,
-2.193048, -0.2847254, -2.571236, 0, 0, 0, 1, 1,
-2.190339, 1.17364, -1.597155, 0, 0, 0, 1, 1,
-2.179072, 0.8831686, -1.144252, 0, 0, 0, 1, 1,
-2.172537, -1.833707, -3.008518, 1, 1, 1, 1, 1,
-2.14489, -0.5390569, -2.222498, 1, 1, 1, 1, 1,
-2.119787, -0.6690673, -1.48305, 1, 1, 1, 1, 1,
-2.071974, 1.147997, -1.880425, 1, 1, 1, 1, 1,
-2.054431, 0.5267862, -1.019988, 1, 1, 1, 1, 1,
-2.026454, -0.2746923, -1.760239, 1, 1, 1, 1, 1,
-2.025191, 0.1139979, -1.753091, 1, 1, 1, 1, 1,
-2.008983, 0.1473707, -2.57459, 1, 1, 1, 1, 1,
-1.99525, -1.714536, -1.979851, 1, 1, 1, 1, 1,
-1.96683, -0.8578354, -1.497039, 1, 1, 1, 1, 1,
-1.959551, 0.3180155, -2.685816, 1, 1, 1, 1, 1,
-1.955905, -1.513308, -2.321692, 1, 1, 1, 1, 1,
-1.920267, -0.8291504, -2.380833, 1, 1, 1, 1, 1,
-1.893348, -1.093449, -2.646117, 1, 1, 1, 1, 1,
-1.872347, -0.533887, -1.151776, 1, 1, 1, 1, 1,
-1.85598, -0.4321045, -2.594726, 0, 0, 1, 1, 1,
-1.838159, 1.807965, -1.067837, 1, 0, 0, 1, 1,
-1.838124, -0.08068029, -1.53724, 1, 0, 0, 1, 1,
-1.806512, -0.2550818, -1.705049, 1, 0, 0, 1, 1,
-1.793608, 0.3345326, 1.041981, 1, 0, 0, 1, 1,
-1.766274, 1.406002, -0.4885452, 1, 0, 0, 1, 1,
-1.757865, 0.7761802, -0.8448215, 0, 0, 0, 1, 1,
-1.75577, 1.918125, -0.02036595, 0, 0, 0, 1, 1,
-1.749165, 0.7313691, -3.125069, 0, 0, 0, 1, 1,
-1.735906, 0.1265093, -1.381883, 0, 0, 0, 1, 1,
-1.72606, 0.1417179, -1.081214, 0, 0, 0, 1, 1,
-1.724322, 2.092221, 0.3514318, 0, 0, 0, 1, 1,
-1.712673, 1.517861, -0.3807425, 0, 0, 0, 1, 1,
-1.711632, 0.9714124, -1.028531, 1, 1, 1, 1, 1,
-1.69808, -1.601587, -2.068735, 1, 1, 1, 1, 1,
-1.694283, -2.68084, -3.328452, 1, 1, 1, 1, 1,
-1.691659, -1.326126, -3.774175, 1, 1, 1, 1, 1,
-1.67755, 0.8603318, -0.1148691, 1, 1, 1, 1, 1,
-1.672333, 0.4329563, -1.735734, 1, 1, 1, 1, 1,
-1.667054, 1.539668, 0.08056556, 1, 1, 1, 1, 1,
-1.65087, 0.5361737, -3.031299, 1, 1, 1, 1, 1,
-1.649732, -1.403155, -1.927145, 1, 1, 1, 1, 1,
-1.630929, 0.1707933, -1.121963, 1, 1, 1, 1, 1,
-1.629914, -0.8872203, -2.991819, 1, 1, 1, 1, 1,
-1.610249, -0.2113888, -1.903318, 1, 1, 1, 1, 1,
-1.599279, -1.396941, -0.3395314, 1, 1, 1, 1, 1,
-1.598046, 0.6186285, -1.738301, 1, 1, 1, 1, 1,
-1.572063, -1.28523, -0.4297767, 1, 1, 1, 1, 1,
-1.560975, -0.1787922, -1.859836, 0, 0, 1, 1, 1,
-1.55383, -0.5747086, -1.999338, 1, 0, 0, 1, 1,
-1.552172, -0.8637601, -2.592023, 1, 0, 0, 1, 1,
-1.551607, 1.299309, -1.478019, 1, 0, 0, 1, 1,
-1.528908, -2.121243, -3.174084, 1, 0, 0, 1, 1,
-1.527251, -0.08438124, -1.51046, 1, 0, 0, 1, 1,
-1.526352, 0.4101447, -0.3762256, 0, 0, 0, 1, 1,
-1.514867, -0.06705187, -0.7506602, 0, 0, 0, 1, 1,
-1.511197, -0.2497535, -1.46215, 0, 0, 0, 1, 1,
-1.504298, -0.7748448, -3.501327, 0, 0, 0, 1, 1,
-1.502119, 0.1354423, -1.511806, 0, 0, 0, 1, 1,
-1.500132, -0.7638127, -1.203979, 0, 0, 0, 1, 1,
-1.49759, 0.8975101, -0.3974167, 0, 0, 0, 1, 1,
-1.496672, 1.12721, -1.426238, 1, 1, 1, 1, 1,
-1.482765, -1.621606, -2.579182, 1, 1, 1, 1, 1,
-1.479811, -1.131846, -0.6837261, 1, 1, 1, 1, 1,
-1.479545, 0.5398452, -0.2742281, 1, 1, 1, 1, 1,
-1.472692, 1.211702, -2.589381, 1, 1, 1, 1, 1,
-1.469283, 0.7752538, -0.1037825, 1, 1, 1, 1, 1,
-1.463414, -1.48415, -3.236435, 1, 1, 1, 1, 1,
-1.454323, -0.275, -2.233256, 1, 1, 1, 1, 1,
-1.437105, -0.1277047, -0.6776275, 1, 1, 1, 1, 1,
-1.434525, -0.4147486, -0.6715025, 1, 1, 1, 1, 1,
-1.431383, 0.1646815, -0.3466121, 1, 1, 1, 1, 1,
-1.42903, -0.06018293, -2.67682, 1, 1, 1, 1, 1,
-1.428997, -0.3581279, -3.135384, 1, 1, 1, 1, 1,
-1.428908, -0.002661262, -2.41167, 1, 1, 1, 1, 1,
-1.423602, 0.8024967, 0.6075147, 1, 1, 1, 1, 1,
-1.409612, 0.6724124, 0.4030667, 0, 0, 1, 1, 1,
-1.401619, -0.8649857, -2.6605, 1, 0, 0, 1, 1,
-1.399052, 0.3851662, -1.359967, 1, 0, 0, 1, 1,
-1.398082, 1.223335, -1.070095, 1, 0, 0, 1, 1,
-1.396836, -1.210885, -3.001091, 1, 0, 0, 1, 1,
-1.388867, -1.727368, -4.261828, 1, 0, 0, 1, 1,
-1.387492, -0.9970568, -3.023895, 0, 0, 0, 1, 1,
-1.364643, 2.086456, -1.51165, 0, 0, 0, 1, 1,
-1.360599, -0.995815, -2.658442, 0, 0, 0, 1, 1,
-1.357127, -1.047103, -2.217916, 0, 0, 0, 1, 1,
-1.356796, 0.5884424, -1.129575, 0, 0, 0, 1, 1,
-1.339891, -1.5324, -1.562183, 0, 0, 0, 1, 1,
-1.31654, 0.04369002, -1.522235, 0, 0, 0, 1, 1,
-1.311402, 0.07610214, -3.284561, 1, 1, 1, 1, 1,
-1.305803, 0.982001, -1.212583, 1, 1, 1, 1, 1,
-1.300976, 0.527827, -0.7612329, 1, 1, 1, 1, 1,
-1.299315, 0.1079136, -2.504918, 1, 1, 1, 1, 1,
-1.298015, 1.268388, -0.7395649, 1, 1, 1, 1, 1,
-1.294816, -3.178209, -2.644596, 1, 1, 1, 1, 1,
-1.290828, 0.8349818, -2.085895, 1, 1, 1, 1, 1,
-1.280682, -0.7222444, -3.397669, 1, 1, 1, 1, 1,
-1.27074, -1.736573, -1.446479, 1, 1, 1, 1, 1,
-1.266612, 0.2917341, -1.643687, 1, 1, 1, 1, 1,
-1.265361, 0.5649498, -2.296483, 1, 1, 1, 1, 1,
-1.262658, 0.05207086, -1.369083, 1, 1, 1, 1, 1,
-1.258075, 0.5753821, -0.8058117, 1, 1, 1, 1, 1,
-1.256476, -1.352585, -2.952079, 1, 1, 1, 1, 1,
-1.24418, 0.1444495, -1.887375, 1, 1, 1, 1, 1,
-1.23709, -0.7553108, -1.480461, 0, 0, 1, 1, 1,
-1.236099, 0.8619587, 0.1240542, 1, 0, 0, 1, 1,
-1.23525, 0.1653749, -1.357886, 1, 0, 0, 1, 1,
-1.234973, 0.360994, -0.6489853, 1, 0, 0, 1, 1,
-1.229389, -0.008826675, -0.8353667, 1, 0, 0, 1, 1,
-1.223015, 0.129336, -2.275234, 1, 0, 0, 1, 1,
-1.210923, 0.4166867, -2.083406, 0, 0, 0, 1, 1,
-1.210871, 1.051509, 1.078541, 0, 0, 0, 1, 1,
-1.210656, -1.244871, -1.974215, 0, 0, 0, 1, 1,
-1.209525, -0.02379468, 1.151237, 0, 0, 0, 1, 1,
-1.197757, -1.465695, -2.581435, 0, 0, 0, 1, 1,
-1.197253, 0.3057642, -2.790714, 0, 0, 0, 1, 1,
-1.195651, -1.003052, -2.501723, 0, 0, 0, 1, 1,
-1.191323, -0.3666173, -1.783039, 1, 1, 1, 1, 1,
-1.190671, 0.5748346, -1.9381, 1, 1, 1, 1, 1,
-1.182519, 1.33543, -1.148026, 1, 1, 1, 1, 1,
-1.176288, 1.898587, 0.06002663, 1, 1, 1, 1, 1,
-1.157955, -0.2927078, -1.005551, 1, 1, 1, 1, 1,
-1.1542, -0.2185221, -3.227036, 1, 1, 1, 1, 1,
-1.146898, 0.02444533, -3.292617, 1, 1, 1, 1, 1,
-1.143193, 1.478934, -2.873515, 1, 1, 1, 1, 1,
-1.140565, 0.06827819, 0.0996452, 1, 1, 1, 1, 1,
-1.137514, 1.506, -2.208262, 1, 1, 1, 1, 1,
-1.13546, 0.5880932, -2.302427, 1, 1, 1, 1, 1,
-1.132902, 0.6122825, -2.511629, 1, 1, 1, 1, 1,
-1.130276, 1.664701, -0.6280569, 1, 1, 1, 1, 1,
-1.10722, 0.9957639, -2.522374, 1, 1, 1, 1, 1,
-1.106606, -2.223382, -2.342805, 1, 1, 1, 1, 1,
-1.104705, 0.5605641, -1.751155, 0, 0, 1, 1, 1,
-1.094436, 0.3233301, -0.3578792, 1, 0, 0, 1, 1,
-1.089882, 0.3869989, -1.762035, 1, 0, 0, 1, 1,
-1.081002, -0.2237301, -1.000739, 1, 0, 0, 1, 1,
-1.077602, -0.1739631, -1.267165, 1, 0, 0, 1, 1,
-1.0731, 0.9082819, -1.459136, 1, 0, 0, 1, 1,
-1.071295, 0.3556496, -2.892453, 0, 0, 0, 1, 1,
-1.068569, -0.6620876, -1.888698, 0, 0, 0, 1, 1,
-1.065174, 0.5128695, -0.8882586, 0, 0, 0, 1, 1,
-1.062112, -0.5787214, -3.626318, 0, 0, 0, 1, 1,
-1.060917, 0.9303622, 0.4726713, 0, 0, 0, 1, 1,
-1.060015, 0.163282, -3.886221, 0, 0, 0, 1, 1,
-1.05066, -2.158561, -4.143226, 0, 0, 0, 1, 1,
-1.050592, -0.9876644, -2.667487, 1, 1, 1, 1, 1,
-1.046288, -1.062767, -1.695949, 1, 1, 1, 1, 1,
-1.046162, -1.432366, -0.8338439, 1, 1, 1, 1, 1,
-1.038136, 2.615197, -2.650122, 1, 1, 1, 1, 1,
-1.036274, 0.4973289, -1.469347, 1, 1, 1, 1, 1,
-1.033557, -1.086439, -1.941538, 1, 1, 1, 1, 1,
-1.031404, -1.273501, -1.831729, 1, 1, 1, 1, 1,
-1.027895, -1.575138, -3.124856, 1, 1, 1, 1, 1,
-1.025846, 0.03480895, -0.5861075, 1, 1, 1, 1, 1,
-1.022092, 0.03285009, -0.6406713, 1, 1, 1, 1, 1,
-1.018106, 0.4504297, -2.238146, 1, 1, 1, 1, 1,
-1.017768, -1.204799, -1.943285, 1, 1, 1, 1, 1,
-1.010033, 1.949603, -1.38242, 1, 1, 1, 1, 1,
-1.001968, 0.6038572, -1.559214, 1, 1, 1, 1, 1,
-0.9959875, 2.275542, -0.4695766, 1, 1, 1, 1, 1,
-0.99032, -0.7227162, -2.697756, 0, 0, 1, 1, 1,
-0.9858581, -1.516896, -1.635315, 1, 0, 0, 1, 1,
-0.9831685, -0.2406285, -2.362601, 1, 0, 0, 1, 1,
-0.9682966, -0.7836851, -1.890542, 1, 0, 0, 1, 1,
-0.9648239, -1.252531, -2.358354, 1, 0, 0, 1, 1,
-0.9647204, -1.544688, -2.957747, 1, 0, 0, 1, 1,
-0.9641432, -1.33832, -3.726078, 0, 0, 0, 1, 1,
-0.9629992, -0.2218017, -1.333891, 0, 0, 0, 1, 1,
-0.9558173, 0.7436928, -0.2591755, 0, 0, 0, 1, 1,
-0.9549162, 1.512523, -1.975718, 0, 0, 0, 1, 1,
-0.9542946, 0.1237842, -1.121671, 0, 0, 0, 1, 1,
-0.9444917, 0.05812818, -3.542581, 0, 0, 0, 1, 1,
-0.9431326, -0.5645501, -3.025569, 0, 0, 0, 1, 1,
-0.9423398, -0.3250766, -2.114139, 1, 1, 1, 1, 1,
-0.9376857, 1.628899, -1.442328, 1, 1, 1, 1, 1,
-0.9308127, 0.4648552, -2.639144, 1, 1, 1, 1, 1,
-0.9277872, 0.1650648, -3.062793, 1, 1, 1, 1, 1,
-0.9175803, 0.4384137, -1.214874, 1, 1, 1, 1, 1,
-0.9162002, 1.605442, 1.501478, 1, 1, 1, 1, 1,
-0.9020002, -0.6176009, -2.667273, 1, 1, 1, 1, 1,
-0.9009376, -0.3730022, -3.021188, 1, 1, 1, 1, 1,
-0.9000962, 2.593485, -2.056566, 1, 1, 1, 1, 1,
-0.8997868, 0.3732333, -0.6696634, 1, 1, 1, 1, 1,
-0.8932199, 1.286664, -1.777379, 1, 1, 1, 1, 1,
-0.885866, 1.9646, -0.7768711, 1, 1, 1, 1, 1,
-0.8749805, -0.3306806, -0.6854357, 1, 1, 1, 1, 1,
-0.8734499, -1.033687, -2.829535, 1, 1, 1, 1, 1,
-0.8714378, -1.49553, -3.290608, 1, 1, 1, 1, 1,
-0.867676, 0.8128656, 0.3723169, 0, 0, 1, 1, 1,
-0.8608986, -0.8914053, -3.028874, 1, 0, 0, 1, 1,
-0.8608881, -0.8752719, -3.153637, 1, 0, 0, 1, 1,
-0.853857, -0.8253032, -1.449503, 1, 0, 0, 1, 1,
-0.8412761, 0.5638284, -1.996845, 1, 0, 0, 1, 1,
-0.8366004, 0.4271864, -1.038075, 1, 0, 0, 1, 1,
-0.8353888, 0.9056494, -1.234223, 0, 0, 0, 1, 1,
-0.8311305, -0.6090636, -2.351933, 0, 0, 0, 1, 1,
-0.8278178, 0.683015, -0.7844861, 0, 0, 0, 1, 1,
-0.8254772, -0.3798858, -3.240824, 0, 0, 0, 1, 1,
-0.823562, 0.0183788, -1.21087, 0, 0, 0, 1, 1,
-0.8224062, 1.433152, 0.3841441, 0, 0, 0, 1, 1,
-0.8150993, 0.3322729, -0.3725527, 0, 0, 0, 1, 1,
-0.8149009, 0.333542, 0.6074809, 1, 1, 1, 1, 1,
-0.8117864, 0.1235271, 0.8296643, 1, 1, 1, 1, 1,
-0.8096399, 0.5154737, -0.3263192, 1, 1, 1, 1, 1,
-0.7987056, 1.169122, 0.7022222, 1, 1, 1, 1, 1,
-0.7984713, 1.038022, 0.08526836, 1, 1, 1, 1, 1,
-0.7977669, -0.03977283, -2.138047, 1, 1, 1, 1, 1,
-0.797551, 1.77141, -2.896152, 1, 1, 1, 1, 1,
-0.7954769, 0.6715223, -0.7645135, 1, 1, 1, 1, 1,
-0.7907751, 0.275842, -1.674552, 1, 1, 1, 1, 1,
-0.7890739, -0.3204562, -2.46793, 1, 1, 1, 1, 1,
-0.7797716, -0.3962649, -2.622928, 1, 1, 1, 1, 1,
-0.7772926, -1.360034, -1.400146, 1, 1, 1, 1, 1,
-0.7757226, -0.2096955, -2.139469, 1, 1, 1, 1, 1,
-0.7740353, 1.076214, -1.628617, 1, 1, 1, 1, 1,
-0.7723472, -0.4418823, -1.338082, 1, 1, 1, 1, 1,
-0.7672092, 0.2252548, -0.2366296, 0, 0, 1, 1, 1,
-0.7562302, 0.2341912, -0.8400002, 1, 0, 0, 1, 1,
-0.7559207, -0.2616459, -0.9561859, 1, 0, 0, 1, 1,
-0.7522963, -0.2738476, -1.854067, 1, 0, 0, 1, 1,
-0.7491136, 0.1099152, -2.087444, 1, 0, 0, 1, 1,
-0.7488707, 0.03467933, -1.536515, 1, 0, 0, 1, 1,
-0.7473706, -0.607588, -1.796049, 0, 0, 0, 1, 1,
-0.7467176, 1.194479, 1.141749, 0, 0, 0, 1, 1,
-0.7463136, -0.2287427, -0.6080637, 0, 0, 0, 1, 1,
-0.7457142, 1.489554, 0.3986717, 0, 0, 0, 1, 1,
-0.7452984, -0.3815389, -2.731273, 0, 0, 0, 1, 1,
-0.7431411, -0.8465574, -1.979349, 0, 0, 0, 1, 1,
-0.7312308, -0.4746353, -2.023922, 0, 0, 0, 1, 1,
-0.7281618, -0.03369985, -2.889716, 1, 1, 1, 1, 1,
-0.7248403, 0.05966102, -2.199943, 1, 1, 1, 1, 1,
-0.7134951, -0.5869408, -3.192252, 1, 1, 1, 1, 1,
-0.7100645, 1.10259, -0.920422, 1, 1, 1, 1, 1,
-0.7098592, 0.7241663, 0.2258718, 1, 1, 1, 1, 1,
-0.7087325, -0.3340906, -2.519149, 1, 1, 1, 1, 1,
-0.7051698, -0.5135639, -2.887963, 1, 1, 1, 1, 1,
-0.7040067, 0.2721912, -1.013861, 1, 1, 1, 1, 1,
-0.6935143, 0.8383093, -2.619714, 1, 1, 1, 1, 1,
-0.6934683, -0.413142, -1.812674, 1, 1, 1, 1, 1,
-0.691274, 0.5064906, -0.9924785, 1, 1, 1, 1, 1,
-0.6912077, -1.734685, -1.465392, 1, 1, 1, 1, 1,
-0.6905479, 0.7823824, -1.169077, 1, 1, 1, 1, 1,
-0.6872378, -0.3055898, -2.235481, 1, 1, 1, 1, 1,
-0.6799204, -1.528897, -0.2217285, 1, 1, 1, 1, 1,
-0.6795416, -0.9664688, -3.852641, 0, 0, 1, 1, 1,
-0.6790838, -0.2759052, -0.8995311, 1, 0, 0, 1, 1,
-0.6719195, 0.2391101, -1.875944, 1, 0, 0, 1, 1,
-0.6713064, -0.7693407, -2.238396, 1, 0, 0, 1, 1,
-0.669943, -0.9021358, -3.096845, 1, 0, 0, 1, 1,
-0.6698255, 1.592897, 0.7460301, 1, 0, 0, 1, 1,
-0.6654084, 1.353514, -1.444367, 0, 0, 0, 1, 1,
-0.6644982, 0.5155677, -0.1685804, 0, 0, 0, 1, 1,
-0.663626, 0.01126213, -1.273457, 0, 0, 0, 1, 1,
-0.6631926, 0.133132, -2.936408, 0, 0, 0, 1, 1,
-0.6631313, 0.9669709, -1.511222, 0, 0, 0, 1, 1,
-0.6610748, 0.9387352, -1.993159, 0, 0, 0, 1, 1,
-0.6608547, -1.517941, -2.828847, 0, 0, 0, 1, 1,
-0.6560715, 0.4643224, -0.5660231, 1, 1, 1, 1, 1,
-0.650183, -0.6094562, -1.835914, 1, 1, 1, 1, 1,
-0.6388078, -0.3694636, -1.384622, 1, 1, 1, 1, 1,
-0.6368818, -0.2442635, -2.480068, 1, 1, 1, 1, 1,
-0.632143, 0.6371166, -1.622656, 1, 1, 1, 1, 1,
-0.6292458, 1.29804, 0.1458858, 1, 1, 1, 1, 1,
-0.6241843, -0.4868028, -1.916622, 1, 1, 1, 1, 1,
-0.6214676, 1.130346, -1.641132, 1, 1, 1, 1, 1,
-0.6193322, -1.629601, -5.030257, 1, 1, 1, 1, 1,
-0.6174275, 0.298754, -1.137138, 1, 1, 1, 1, 1,
-0.616151, 1.515071, -0.3366181, 1, 1, 1, 1, 1,
-0.614988, 0.5176266, 0.1585717, 1, 1, 1, 1, 1,
-0.6146684, 1.556239, -1.676478, 1, 1, 1, 1, 1,
-0.6139221, 0.5759089, -0.687526, 1, 1, 1, 1, 1,
-0.6098619, -0.7038448, -1.248453, 1, 1, 1, 1, 1,
-0.6091701, -1.239654, -4.093079, 0, 0, 1, 1, 1,
-0.5969934, 1.69349, -0.6464761, 1, 0, 0, 1, 1,
-0.5960655, 0.1301315, -2.08756, 1, 0, 0, 1, 1,
-0.5896435, 0.4588456, -1.113158, 1, 0, 0, 1, 1,
-0.5845825, -1.959373, -1.374615, 1, 0, 0, 1, 1,
-0.5799007, 1.510618, -2.821244, 1, 0, 0, 1, 1,
-0.5736251, 1.115469, -0.9832509, 0, 0, 0, 1, 1,
-0.5708659, -1.332678, -2.76357, 0, 0, 0, 1, 1,
-0.5700105, -0.7403547, -3.008283, 0, 0, 0, 1, 1,
-0.5665807, 0.172006, -2.068566, 0, 0, 0, 1, 1,
-0.5649251, -1.43967, -3.461104, 0, 0, 0, 1, 1,
-0.5640481, 2.014943, -0.4253352, 0, 0, 0, 1, 1,
-0.5590838, 0.7671348, 0.1645723, 0, 0, 0, 1, 1,
-0.5562663, 0.4639935, 0.50337, 1, 1, 1, 1, 1,
-0.5523358, 0.5317906, 0.6942623, 1, 1, 1, 1, 1,
-0.5492064, 1.195034, 0.9290501, 1, 1, 1, 1, 1,
-0.5491495, 0.7743664, -0.9858208, 1, 1, 1, 1, 1,
-0.548301, -1.116538, -0.4524904, 1, 1, 1, 1, 1,
-0.5407942, 0.3408651, -2.077631, 1, 1, 1, 1, 1,
-0.537968, 0.494239, -1.465933, 1, 1, 1, 1, 1,
-0.5363912, -1.049807, -2.64479, 1, 1, 1, 1, 1,
-0.5335771, -0.6707932, -2.957829, 1, 1, 1, 1, 1,
-0.5202068, 2.524324, 0.3592458, 1, 1, 1, 1, 1,
-0.5201225, -0.127317, -2.537174, 1, 1, 1, 1, 1,
-0.5189227, -0.3525964, -2.953613, 1, 1, 1, 1, 1,
-0.5185924, -1.056962, -2.972334, 1, 1, 1, 1, 1,
-0.5179623, -0.7351002, -2.891572, 1, 1, 1, 1, 1,
-0.5175609, 0.1271598, -1.263124, 1, 1, 1, 1, 1,
-0.5158325, 0.8635012, -0.7578619, 0, 0, 1, 1, 1,
-0.5158281, -0.4171862, -2.016452, 1, 0, 0, 1, 1,
-0.5128266, 0.4660372, -0.9678282, 1, 0, 0, 1, 1,
-0.5118876, 1.518191, -1.088844, 1, 0, 0, 1, 1,
-0.5092996, -1.261512, -2.030387, 1, 0, 0, 1, 1,
-0.5082874, 1.086969, -0.6506511, 1, 0, 0, 1, 1,
-0.5080084, -1.613644, -2.04725, 0, 0, 0, 1, 1,
-0.5047652, 1.013299, 0.6241193, 0, 0, 0, 1, 1,
-0.5030351, -1.315772, -4.347269, 0, 0, 0, 1, 1,
-0.5018387, 0.9795033, 0.02133723, 0, 0, 0, 1, 1,
-0.500897, -1.162579, -3.825454, 0, 0, 0, 1, 1,
-0.5008372, -0.2897812, -2.552548, 0, 0, 0, 1, 1,
-0.4993284, 0.7926283, -0.2768009, 0, 0, 0, 1, 1,
-0.4929238, -0.06635305, -2.055426, 1, 1, 1, 1, 1,
-0.4927924, -0.465286, -2.490344, 1, 1, 1, 1, 1,
-0.4901612, 1.209335, -0.4265379, 1, 1, 1, 1, 1,
-0.4900874, -0.93356, -0.6474599, 1, 1, 1, 1, 1,
-0.4785665, 1.287405, -2.142077, 1, 1, 1, 1, 1,
-0.4782893, 0.04970392, -1.114143, 1, 1, 1, 1, 1,
-0.4771504, -0.7185852, -1.940786, 1, 1, 1, 1, 1,
-0.4760439, -0.005182209, -2.076809, 1, 1, 1, 1, 1,
-0.4743818, 0.83156, -1.864634, 1, 1, 1, 1, 1,
-0.4741919, 0.1364174, -2.330572, 1, 1, 1, 1, 1,
-0.4741517, -2.282157, -2.337469, 1, 1, 1, 1, 1,
-0.4731774, 0.03393902, -0.557379, 1, 1, 1, 1, 1,
-0.4706927, 0.710781, -2.710304, 1, 1, 1, 1, 1,
-0.4703561, -2.351314, -2.144848, 1, 1, 1, 1, 1,
-0.4674895, 0.5801225, 0.2298405, 1, 1, 1, 1, 1,
-0.4637042, 1.594963, -0.165084, 0, 0, 1, 1, 1,
-0.4605297, 1.113, 0.8107092, 1, 0, 0, 1, 1,
-0.4592257, 0.9365644, -0.2810327, 1, 0, 0, 1, 1,
-0.4576156, -0.6588786, -2.164943, 1, 0, 0, 1, 1,
-0.4545265, -0.5544275, -3.01699, 1, 0, 0, 1, 1,
-0.4544829, 0.3493863, -1.378597, 1, 0, 0, 1, 1,
-0.4516554, -2.167415, -4.802085, 0, 0, 0, 1, 1,
-0.4503481, -0.6791397, -3.336733, 0, 0, 0, 1, 1,
-0.4491727, -0.2491152, -1.598256, 0, 0, 0, 1, 1,
-0.4437006, -0.3725472, -0.7733895, 0, 0, 0, 1, 1,
-0.4426437, 1.192505, 0.2575899, 0, 0, 0, 1, 1,
-0.440881, -0.2181611, -2.873264, 0, 0, 0, 1, 1,
-0.438979, 3.244587, -0.4799173, 0, 0, 0, 1, 1,
-0.4212117, 0.4010047, -0.2546543, 1, 1, 1, 1, 1,
-0.4207064, 1.510919, -0.1439887, 1, 1, 1, 1, 1,
-0.4193889, 1.091825, -1.024757, 1, 1, 1, 1, 1,
-0.4180043, -2.069398, -4.386406, 1, 1, 1, 1, 1,
-0.4153669, -0.850727, -2.772656, 1, 1, 1, 1, 1,
-0.4115913, 2.454353, 0.5533845, 1, 1, 1, 1, 1,
-0.4104618, -2.510331, -2.538591, 1, 1, 1, 1, 1,
-0.406281, 0.172211, -0.4769632, 1, 1, 1, 1, 1,
-0.4011628, 0.1537695, -0.9773401, 1, 1, 1, 1, 1,
-0.4006166, 1.532445, 0.02737018, 1, 1, 1, 1, 1,
-0.3982951, -0.03855278, -2.983873, 1, 1, 1, 1, 1,
-0.3962125, -0.8076473, -3.61218, 1, 1, 1, 1, 1,
-0.3924365, -0.5940053, -2.148974, 1, 1, 1, 1, 1,
-0.3874678, 1.038985, -0.9434543, 1, 1, 1, 1, 1,
-0.3871874, -0.402892, -3.12256, 1, 1, 1, 1, 1,
-0.3754637, -0.006649388, -2.138772, 0, 0, 1, 1, 1,
-0.3739978, -0.6456, -2.858825, 1, 0, 0, 1, 1,
-0.3730032, -2.314808, -3.1278, 1, 0, 0, 1, 1,
-0.3699207, -0.1720432, -1.034129, 1, 0, 0, 1, 1,
-0.3697082, 0.6836513, -2.174196, 1, 0, 0, 1, 1,
-0.3653918, -0.3282987, -1.800475, 1, 0, 0, 1, 1,
-0.3644136, 0.6246907, 0.1941012, 0, 0, 0, 1, 1,
-0.3641451, -0.6585481, -0.4544809, 0, 0, 0, 1, 1,
-0.3623313, 0.01279771, -0.1438791, 0, 0, 0, 1, 1,
-0.3615253, 0.4112369, -0.1717228, 0, 0, 0, 1, 1,
-0.3583618, 0.2945768, -0.7024649, 0, 0, 0, 1, 1,
-0.3572921, -0.7900106, -1.572123, 0, 0, 0, 1, 1,
-0.3521846, -0.324455, -2.164599, 0, 0, 0, 1, 1,
-0.3475949, -0.5535356, -3.051053, 1, 1, 1, 1, 1,
-0.3473851, -0.3090913, -1.597322, 1, 1, 1, 1, 1,
-0.3462838, 0.1548396, -0.3603359, 1, 1, 1, 1, 1,
-0.3378955, 1.419592, 1.069315, 1, 1, 1, 1, 1,
-0.3365545, -1.54325, -1.968078, 1, 1, 1, 1, 1,
-0.334181, -0.6493816, -3.978735, 1, 1, 1, 1, 1,
-0.3333967, 0.1084513, -0.8721543, 1, 1, 1, 1, 1,
-0.3310791, 1.184154, 0.1948203, 1, 1, 1, 1, 1,
-0.3296202, 1.409616, -0.6402633, 1, 1, 1, 1, 1,
-0.3222166, 0.7748209, -1.807186, 1, 1, 1, 1, 1,
-0.3137037, 0.3868419, -0.9488026, 1, 1, 1, 1, 1,
-0.3126779, -2.449254, -3.332447, 1, 1, 1, 1, 1,
-0.3074464, 0.08184855, -1.726459, 1, 1, 1, 1, 1,
-0.303551, -0.4154687, -1.877805, 1, 1, 1, 1, 1,
-0.3010679, 1.146486, -1.571152, 1, 1, 1, 1, 1,
-0.2998402, -0.7669032, -2.426364, 0, 0, 1, 1, 1,
-0.298665, -0.8456533, -2.017003, 1, 0, 0, 1, 1,
-0.2976266, 1.639177, -1.323874, 1, 0, 0, 1, 1,
-0.2952411, -0.002291166, -1.080611, 1, 0, 0, 1, 1,
-0.2935268, 1.030642, 0.05271612, 1, 0, 0, 1, 1,
-0.2933422, 0.2797211, -0.9820211, 1, 0, 0, 1, 1,
-0.2930099, -0.2608105, -2.118152, 0, 0, 0, 1, 1,
-0.2902299, -0.5063463, -1.930683, 0, 0, 0, 1, 1,
-0.2893009, 0.1358168, -1.762778, 0, 0, 0, 1, 1,
-0.287864, -0.2499803, -2.140823, 0, 0, 0, 1, 1,
-0.2872171, 1.213722, -0.1154292, 0, 0, 0, 1, 1,
-0.2862876, -0.1822349, -2.830634, 0, 0, 0, 1, 1,
-0.2852888, 1.484285, 0.7759379, 0, 0, 0, 1, 1,
-0.285015, 1.92732, -2.173649, 1, 1, 1, 1, 1,
-0.2847062, 0.5023112, 0.6546332, 1, 1, 1, 1, 1,
-0.2840511, 0.5132672, 0.05252947, 1, 1, 1, 1, 1,
-0.2807505, -0.4436258, -2.517254, 1, 1, 1, 1, 1,
-0.2794017, 0.1983204, -0.573525, 1, 1, 1, 1, 1,
-0.2785438, 0.2723053, -1.783617, 1, 1, 1, 1, 1,
-0.2783235, -0.9956759, -3.318158, 1, 1, 1, 1, 1,
-0.2741416, -0.1858769, -2.645845, 1, 1, 1, 1, 1,
-0.2633572, -0.9139152, -2.726902, 1, 1, 1, 1, 1,
-0.2496259, 1.016545, 1.271496, 1, 1, 1, 1, 1,
-0.2489901, 0.02466817, -0.9294574, 1, 1, 1, 1, 1,
-0.2483998, 0.406781, -1.433754, 1, 1, 1, 1, 1,
-0.2465014, 0.1476585, -0.6217, 1, 1, 1, 1, 1,
-0.2451154, 0.440912, 0.4152308, 1, 1, 1, 1, 1,
-0.2432003, 1.06423, 0.06003152, 1, 1, 1, 1, 1,
-0.2412733, -0.6327639, -3.327347, 0, 0, 1, 1, 1,
-0.2382565, 0.004963521, -2.480861, 1, 0, 0, 1, 1,
-0.2340484, -0.2576505, -1.149964, 1, 0, 0, 1, 1,
-0.231835, 1.62232, -0.5617633, 1, 0, 0, 1, 1,
-0.2308674, 1.204513, -2.123422, 1, 0, 0, 1, 1,
-0.2299699, 0.06091992, -1.109982, 1, 0, 0, 1, 1,
-0.2264212, 1.562812, 1.077874, 0, 0, 0, 1, 1,
-0.2223632, 0.7310922, 0.1359656, 0, 0, 0, 1, 1,
-0.2215115, -0.03868248, -3.503527, 0, 0, 0, 1, 1,
-0.2181936, -0.6655505, -1.672747, 0, 0, 0, 1, 1,
-0.2165713, -0.5125607, -3.002716, 0, 0, 0, 1, 1,
-0.2154254, 0.3966845, -0.4906295, 0, 0, 0, 1, 1,
-0.2130395, -0.7167348, -3.243781, 0, 0, 0, 1, 1,
-0.2100052, 1.589742, 0.4082952, 1, 1, 1, 1, 1,
-0.2076205, 1.643854, -0.9145353, 1, 1, 1, 1, 1,
-0.2016488, -0.7936906, -2.831966, 1, 1, 1, 1, 1,
-0.1991156, -0.8907381, -3.948799, 1, 1, 1, 1, 1,
-0.1991016, -0.558437, -1.569784, 1, 1, 1, 1, 1,
-0.1971443, -0.7579414, -4.463711, 1, 1, 1, 1, 1,
-0.1963451, 1.413318, 0.07498828, 1, 1, 1, 1, 1,
-0.1919181, 1.659663, -0.3980052, 1, 1, 1, 1, 1,
-0.1879207, -1.055511, -2.321525, 1, 1, 1, 1, 1,
-0.186392, 1.146686, 1.257297, 1, 1, 1, 1, 1,
-0.1860403, -0.09427123, -2.383791, 1, 1, 1, 1, 1,
-0.180007, -0.5163209, -2.684025, 1, 1, 1, 1, 1,
-0.1796801, -1.114708, -3.724225, 1, 1, 1, 1, 1,
-0.1754682, 1.046184, 0.7237611, 1, 1, 1, 1, 1,
-0.173585, 0.5293967, 0.6655716, 1, 1, 1, 1, 1,
-0.1725371, 0.4825124, -1.773266, 0, 0, 1, 1, 1,
-0.161054, -1.121512, -3.72337, 1, 0, 0, 1, 1,
-0.1591869, -0.01445481, -1.28475, 1, 0, 0, 1, 1,
-0.155563, -0.1636753, -2.185057, 1, 0, 0, 1, 1,
-0.15042, 0.04759485, -1.888325, 1, 0, 0, 1, 1,
-0.1435971, -0.8734474, -2.979394, 1, 0, 0, 1, 1,
-0.1434148, -0.4929669, -5.470522, 0, 0, 0, 1, 1,
-0.142897, -0.002554214, -0.5874807, 0, 0, 0, 1, 1,
-0.1410385, -0.2117166, -2.883506, 0, 0, 0, 1, 1,
-0.1397804, -0.4565414, -2.700004, 0, 0, 0, 1, 1,
-0.1395034, 0.9184792, -1.35803, 0, 0, 0, 1, 1,
-0.1393435, 0.6969726, -1.102581, 0, 0, 0, 1, 1,
-0.1391022, -0.1477793, -2.801588, 0, 0, 0, 1, 1,
-0.1343161, -0.5542185, -2.751222, 1, 1, 1, 1, 1,
-0.1313917, -0.7622259, -3.020156, 1, 1, 1, 1, 1,
-0.1266571, 0.7713833, 0.3407907, 1, 1, 1, 1, 1,
-0.1240921, 0.7406919, -1.27137, 1, 1, 1, 1, 1,
-0.1236263, -0.05880414, -1.547721, 1, 1, 1, 1, 1,
-0.1229779, 0.6650608, 0.4002853, 1, 1, 1, 1, 1,
-0.1216124, -0.2747679, -3.860648, 1, 1, 1, 1, 1,
-0.1172117, -0.487876, -1.876786, 1, 1, 1, 1, 1,
-0.1154873, -1.080644, -3.642896, 1, 1, 1, 1, 1,
-0.1148568, 1.686488, 1.094458, 1, 1, 1, 1, 1,
-0.1082593, 0.8516256, -0.8964716, 1, 1, 1, 1, 1,
-0.1074597, -1.089502, -4.354116, 1, 1, 1, 1, 1,
-0.1050814, 3.118497, -0.8971364, 1, 1, 1, 1, 1,
-0.09963471, -0.144921, -1.962569, 1, 1, 1, 1, 1,
-0.09850764, -0.1327381, -2.234394, 1, 1, 1, 1, 1,
-0.09199946, 0.813621, -0.157705, 0, 0, 1, 1, 1,
-0.09037736, 0.08128698, -2.13895, 1, 0, 0, 1, 1,
-0.08058246, -0.4576099, -0.3103539, 1, 0, 0, 1, 1,
-0.07690387, 0.09061149, -0.6527129, 1, 0, 0, 1, 1,
-0.07584889, -0.6071997, -3.165834, 1, 0, 0, 1, 1,
-0.07575364, 1.203809, -0.2978027, 1, 0, 0, 1, 1,
-0.07241137, 0.03821259, -2.943738, 0, 0, 0, 1, 1,
-0.07226855, -0.3088054, -3.079375, 0, 0, 0, 1, 1,
-0.07142843, -0.4240571, -2.996318, 0, 0, 0, 1, 1,
-0.07085279, -0.2161794, -2.410672, 0, 0, 0, 1, 1,
-0.06243829, -0.8460613, -3.077356, 0, 0, 0, 1, 1,
-0.05745101, -0.3206102, -3.785619, 0, 0, 0, 1, 1,
-0.05699244, -0.2345654, -1.234416, 0, 0, 0, 1, 1,
-0.05640116, -0.2289538, -4.724604, 1, 1, 1, 1, 1,
-0.05576995, 0.9120927, -0.0988133, 1, 1, 1, 1, 1,
-0.05240369, 2.270139, 0.6401908, 1, 1, 1, 1, 1,
-0.05201845, -0.2192139, -5.093421, 1, 1, 1, 1, 1,
-0.05179513, 1.143762, -1.001973, 1, 1, 1, 1, 1,
-0.04634102, 0.2145411, -1.054771, 1, 1, 1, 1, 1,
-0.0453447, -0.4558517, -2.084483, 1, 1, 1, 1, 1,
-0.04105483, 0.2929735, -0.5166585, 1, 1, 1, 1, 1,
-0.03829616, 0.465669, -0.6677166, 1, 1, 1, 1, 1,
-0.03473239, -1.091213, -4.467875, 1, 1, 1, 1, 1,
-0.03260364, 0.8231242, -1.345438, 1, 1, 1, 1, 1,
-0.02857048, 0.5683846, -0.2947492, 1, 1, 1, 1, 1,
-0.02556117, 0.7894192, 1.66665, 1, 1, 1, 1, 1,
-0.02355371, -0.4391702, -2.936751, 1, 1, 1, 1, 1,
-0.01609386, -1.169632, -2.436253, 1, 1, 1, 1, 1,
-0.01316845, -0.5039937, -3.167708, 0, 0, 1, 1, 1,
-0.01191328, 0.6299774, -0.138006, 1, 0, 0, 1, 1,
-0.01178088, 0.5838192, 0.5426551, 1, 0, 0, 1, 1,
-0.0114273, -0.5694382, -3.666111, 1, 0, 0, 1, 1,
-0.006874244, -0.4981556, -3.652988, 1, 0, 0, 1, 1,
-0.005080136, 0.1503568, -0.5842375, 1, 0, 0, 1, 1,
-0.00400747, 1.997382, 1.096965, 0, 0, 0, 1, 1,
-0.001803009, -0.3772454, -3.721133, 0, 0, 0, 1, 1,
-0.001289321, 0.2115346, 0.8137551, 0, 0, 0, 1, 1,
-0.0001229387, -2.38081, -3.170906, 0, 0, 0, 1, 1,
0.0007395235, 0.2642994, -0.8535843, 0, 0, 0, 1, 1,
0.005790364, 0.172393, 0.3034404, 0, 0, 0, 1, 1,
0.006201606, 0.4290291, 0.5516533, 0, 0, 0, 1, 1,
0.008095574, 1.124416, -0.6189156, 1, 1, 1, 1, 1,
0.009492003, -0.5822066, 4.660384, 1, 1, 1, 1, 1,
0.009535154, 0.1455401, -0.6266534, 1, 1, 1, 1, 1,
0.01261414, -0.4818894, 1.651037, 1, 1, 1, 1, 1,
0.01333679, -0.2252579, 4.810195, 1, 1, 1, 1, 1,
0.01665716, 3.666893, -2.425205, 1, 1, 1, 1, 1,
0.01851114, 0.9329488, 0.4345458, 1, 1, 1, 1, 1,
0.02390076, 0.09192549, 1.537158, 1, 1, 1, 1, 1,
0.02417382, -1.190232, 3.564338, 1, 1, 1, 1, 1,
0.02673549, 0.1028355, -0.6179094, 1, 1, 1, 1, 1,
0.02818344, 1.721678, 0.5514948, 1, 1, 1, 1, 1,
0.03068072, -0.276498, 3.56022, 1, 1, 1, 1, 1,
0.03182505, 0.2268112, 2.485691, 1, 1, 1, 1, 1,
0.03346687, 2.184271, 0.6565335, 1, 1, 1, 1, 1,
0.03491756, 0.7757174, 2.255506, 1, 1, 1, 1, 1,
0.03661046, -0.9834011, 3.265025, 0, 0, 1, 1, 1,
0.03746481, 1.904765, 0.158414, 1, 0, 0, 1, 1,
0.03903325, -0.3214225, 4.725449, 1, 0, 0, 1, 1,
0.03955681, 1.588242, 1.059643, 1, 0, 0, 1, 1,
0.04185401, -1.060825, 1.881331, 1, 0, 0, 1, 1,
0.0433255, -1.476125, 4.799094, 1, 0, 0, 1, 1,
0.04538365, -0.7977658, 2.312953, 0, 0, 0, 1, 1,
0.04547289, -0.1565862, 1.455956, 0, 0, 0, 1, 1,
0.04668307, -0.2139953, 3.11331, 0, 0, 0, 1, 1,
0.04902351, 1.436319, -0.5444871, 0, 0, 0, 1, 1,
0.05625072, -1.132992, 2.817993, 0, 0, 0, 1, 1,
0.05662235, 0.1138246, 0.9105489, 0, 0, 0, 1, 1,
0.05825064, -0.5765072, 0.8736213, 0, 0, 0, 1, 1,
0.06117852, 1.358072, 0.08772822, 1, 1, 1, 1, 1,
0.06595591, -0.09547556, 1.905691, 1, 1, 1, 1, 1,
0.06760948, 0.121669, -0.2762401, 1, 1, 1, 1, 1,
0.06833757, 0.5354925, -1.745489, 1, 1, 1, 1, 1,
0.06843909, -2.449087, 2.7976, 1, 1, 1, 1, 1,
0.06999072, 1.508933, 1.434491, 1, 1, 1, 1, 1,
0.07165685, -0.2141276, 2.025995, 1, 1, 1, 1, 1,
0.07667869, -0.2646816, 2.493355, 1, 1, 1, 1, 1,
0.08371086, 0.04707628, 2.199044, 1, 1, 1, 1, 1,
0.08927041, 0.6748395, 0.9550942, 1, 1, 1, 1, 1,
0.09380774, 1.697953, 1.214245, 1, 1, 1, 1, 1,
0.09655726, -0.8366657, 3.032909, 1, 1, 1, 1, 1,
0.1006243, 0.0830499, 1.166792, 1, 1, 1, 1, 1,
0.1039055, 0.1119343, -1.246341, 1, 1, 1, 1, 1,
0.1078536, 1.200034, 1.044292, 1, 1, 1, 1, 1,
0.1092183, -0.950242, 2.624752, 0, 0, 1, 1, 1,
0.1107018, 0.6126383, 1.616645, 1, 0, 0, 1, 1,
0.1241366, -1.144178, 2.850125, 1, 0, 0, 1, 1,
0.1241791, 0.06584605, -0.2691457, 1, 0, 0, 1, 1,
0.1277713, -1.100065, 3.005198, 1, 0, 0, 1, 1,
0.1322326, -0.4175255, 2.22468, 1, 0, 0, 1, 1,
0.1405668, 0.344212, -0.1016327, 0, 0, 0, 1, 1,
0.1443627, -0.6638905, 2.93966, 0, 0, 0, 1, 1,
0.1480268, 0.8917735, 1.54024, 0, 0, 0, 1, 1,
0.1490743, 0.1138074, 1.505651, 0, 0, 0, 1, 1,
0.1531446, -0.1123645, 1.148836, 0, 0, 0, 1, 1,
0.1544298, -1.526653, 4.040879, 0, 0, 0, 1, 1,
0.1555489, 1.085726, -0.7538818, 0, 0, 0, 1, 1,
0.1560068, -0.71224, 1.168212, 1, 1, 1, 1, 1,
0.1562566, 2.001259, -1.982598, 1, 1, 1, 1, 1,
0.1594453, -1.267707, 4.296028, 1, 1, 1, 1, 1,
0.1596018, -0.3942876, 2.265225, 1, 1, 1, 1, 1,
0.1601712, -0.805463, 2.866033, 1, 1, 1, 1, 1,
0.1648051, -0.7956138, 2.5839, 1, 1, 1, 1, 1,
0.1649811, -1.80905, 5.210068, 1, 1, 1, 1, 1,
0.1667047, 1.278915, 1.380702, 1, 1, 1, 1, 1,
0.1686347, 1.727373, 0.3589431, 1, 1, 1, 1, 1,
0.1689478, -1.257425, 4.726891, 1, 1, 1, 1, 1,
0.1694159, -0.3904991, 2.043262, 1, 1, 1, 1, 1,
0.1712958, 0.03426723, 2.151265, 1, 1, 1, 1, 1,
0.1731262, -2.431782, 3.362272, 1, 1, 1, 1, 1,
0.1740282, 0.2169573, -0.5961538, 1, 1, 1, 1, 1,
0.1754734, 0.9099574, 0.3496507, 1, 1, 1, 1, 1,
0.1783645, 1.85548, 0.4968435, 0, 0, 1, 1, 1,
0.1798046, -0.5995098, 4.550714, 1, 0, 0, 1, 1,
0.1798675, -0.6131065, 2.899842, 1, 0, 0, 1, 1,
0.1800535, -0.3098327, 3.647267, 1, 0, 0, 1, 1,
0.1826266, 1.490289, -0.9531046, 1, 0, 0, 1, 1,
0.1894796, 0.06642047, 0.8887362, 1, 0, 0, 1, 1,
0.1903477, 1.577944, -1.489081, 0, 0, 0, 1, 1,
0.1930036, 0.3188057, -0.565123, 0, 0, 0, 1, 1,
0.1999805, 1.298345, 1.212413, 0, 0, 0, 1, 1,
0.2014197, -0.8812121, 1.642276, 0, 0, 0, 1, 1,
0.2017876, -0.04141971, 1.913175, 0, 0, 0, 1, 1,
0.2053342, 0.2460183, -1.798508, 0, 0, 0, 1, 1,
0.2056391, -0.5658139, 2.239895, 0, 0, 0, 1, 1,
0.2080014, -0.3205612, 2.526824, 1, 1, 1, 1, 1,
0.208404, 1.370062, -1.596696, 1, 1, 1, 1, 1,
0.2149631, -2.728537, 1.386204, 1, 1, 1, 1, 1,
0.2150455, -0.2630777, 4.325414, 1, 1, 1, 1, 1,
0.2186436, -0.7899142, 1.993798, 1, 1, 1, 1, 1,
0.2192114, -1.096396, 4.856174, 1, 1, 1, 1, 1,
0.2197277, -0.6234714, 1.992025, 1, 1, 1, 1, 1,
0.2246881, -0.385148, 2.576052, 1, 1, 1, 1, 1,
0.2264508, 1.38104, -0.5537233, 1, 1, 1, 1, 1,
0.227048, -1.724986, 0.9494562, 1, 1, 1, 1, 1,
0.228369, -2.209162, 4.094498, 1, 1, 1, 1, 1,
0.2293016, 0.3001535, 0.5727013, 1, 1, 1, 1, 1,
0.240011, 0.2243947, 1.905675, 1, 1, 1, 1, 1,
0.2424692, -0.604435, 3.316701, 1, 1, 1, 1, 1,
0.245068, -0.263916, 0.6578441, 1, 1, 1, 1, 1,
0.2466061, 1.083511, 1.49617, 0, 0, 1, 1, 1,
0.2469905, 0.6873326, 0.6738576, 1, 0, 0, 1, 1,
0.2482013, 0.2796974, -0.3487715, 1, 0, 0, 1, 1,
0.254771, 1.929275, 1.818357, 1, 0, 0, 1, 1,
0.2602588, 0.2121857, 1.225164, 1, 0, 0, 1, 1,
0.2621062, -0.4021532, 6.070575, 1, 0, 0, 1, 1,
0.2638282, 0.3587632, -0.587495, 0, 0, 0, 1, 1,
0.2747371, -0.2446389, 3.986598, 0, 0, 0, 1, 1,
0.2749678, -0.4014781, 2.120856, 0, 0, 0, 1, 1,
0.2827466, -0.6509576, 1.74028, 0, 0, 0, 1, 1,
0.2836417, 0.4920437, 1.178446, 0, 0, 0, 1, 1,
0.2854962, 1.494898, -0.7093775, 0, 0, 0, 1, 1,
0.2889132, -0.3298021, 4.094947, 0, 0, 0, 1, 1,
0.2909139, -0.09328809, 0.134599, 1, 1, 1, 1, 1,
0.2983891, 1.516589, 0.3848209, 1, 1, 1, 1, 1,
0.3014177, 0.2378423, -0.3302769, 1, 1, 1, 1, 1,
0.3031377, 0.02508331, 1.953087, 1, 1, 1, 1, 1,
0.3055598, 0.07255942, 1.974886, 1, 1, 1, 1, 1,
0.3117038, -1.122251, 3.827115, 1, 1, 1, 1, 1,
0.3188324, 0.1431854, -0.0364162, 1, 1, 1, 1, 1,
0.3239449, -0.03663946, 2.058623, 1, 1, 1, 1, 1,
0.3242094, -0.1038576, 0.817912, 1, 1, 1, 1, 1,
0.3278708, -0.9778017, 3.671973, 1, 1, 1, 1, 1,
0.328157, -0.6321594, 2.294529, 1, 1, 1, 1, 1,
0.3291274, -0.2849704, 0.9674897, 1, 1, 1, 1, 1,
0.3313485, -0.363125, 1.221772, 1, 1, 1, 1, 1,
0.3323996, 0.9286091, 0.5240272, 1, 1, 1, 1, 1,
0.3369309, -0.2328668, 1.467676, 1, 1, 1, 1, 1,
0.3380525, -2.057882, 3.39472, 0, 0, 1, 1, 1,
0.3385648, -1.120683, 1.27363, 1, 0, 0, 1, 1,
0.3386283, 1.444851, 1.923139, 1, 0, 0, 1, 1,
0.339981, 0.5178936, 0.5439143, 1, 0, 0, 1, 1,
0.3456797, 1.411351, 0.1333373, 1, 0, 0, 1, 1,
0.3487337, 0.1951252, 2.37591, 1, 0, 0, 1, 1,
0.3491953, -0.3465868, 1.082742, 0, 0, 0, 1, 1,
0.3493187, 0.6378509, 1.52588, 0, 0, 0, 1, 1,
0.3510417, 1.943119, -0.8701131, 0, 0, 0, 1, 1,
0.3517527, -1.523454, 4.614147, 0, 0, 0, 1, 1,
0.3565859, 1.007091, 0.6918768, 0, 0, 0, 1, 1,
0.3612929, -0.4762607, 3.589411, 0, 0, 0, 1, 1,
0.3619948, 1.001997, -0.5025341, 0, 0, 0, 1, 1,
0.363454, -0.7717135, 4.476489, 1, 1, 1, 1, 1,
0.3676843, 1.393179, 0.09116058, 1, 1, 1, 1, 1,
0.3720122, -0.4273202, 3.293005, 1, 1, 1, 1, 1,
0.3770464, 1.04936, 1.546904, 1, 1, 1, 1, 1,
0.3780432, -0.2454821, 1.88135, 1, 1, 1, 1, 1,
0.3832983, 0.5461731, -0.3150044, 1, 1, 1, 1, 1,
0.3848327, -0.2886325, 3.030592, 1, 1, 1, 1, 1,
0.3853137, -0.1204615, 1.401375, 1, 1, 1, 1, 1,
0.385794, 1.169035, -0.03755794, 1, 1, 1, 1, 1,
0.3887596, 0.7000425, -0.5850785, 1, 1, 1, 1, 1,
0.3888116, -0.9671788, 3.13995, 1, 1, 1, 1, 1,
0.3905262, 0.586368, 0.1115783, 1, 1, 1, 1, 1,
0.3910454, 0.03595483, 1.057918, 1, 1, 1, 1, 1,
0.3945096, 0.5257058, 0.4841859, 1, 1, 1, 1, 1,
0.4048967, 0.4688869, -0.02521118, 1, 1, 1, 1, 1,
0.4053485, 0.1469208, 0.3638456, 0, 0, 1, 1, 1,
0.4086237, 1.144139, 0.03780825, 1, 0, 0, 1, 1,
0.4108895, -0.004303589, 1.902431, 1, 0, 0, 1, 1,
0.4144357, -0.7990968, 3.259805, 1, 0, 0, 1, 1,
0.4150728, -0.536567, 2.454789, 1, 0, 0, 1, 1,
0.4175043, 2.50807, -0.2146541, 1, 0, 0, 1, 1,
0.4199875, -1.02773, 2.450764, 0, 0, 0, 1, 1,
0.422771, -0.9323729, 2.266652, 0, 0, 0, 1, 1,
0.4228087, 0.5616413, -0.2982703, 0, 0, 0, 1, 1,
0.4264913, -1.111822, 3.716381, 0, 0, 0, 1, 1,
0.4265693, 0.7640904, -0.08596865, 0, 0, 0, 1, 1,
0.427206, 0.8659305, -1.204284, 0, 0, 0, 1, 1,
0.4312978, -0.3786512, 3.083627, 0, 0, 0, 1, 1,
0.4351636, 0.2306468, 0.6749178, 1, 1, 1, 1, 1,
0.4382334, 3.495183, 1.223158, 1, 1, 1, 1, 1,
0.4385288, 0.5350417, 0.4038422, 1, 1, 1, 1, 1,
0.4387011, 0.7263261, 0.08053176, 1, 1, 1, 1, 1,
0.4456552, 0.4666076, 2.36601, 1, 1, 1, 1, 1,
0.4570317, 1.27907, 0.2712924, 1, 1, 1, 1, 1,
0.4598236, 0.49017, 0.3493968, 1, 1, 1, 1, 1,
0.4735796, 1.199617, 2.682975, 1, 1, 1, 1, 1,
0.4764878, 0.1530193, 0.4910087, 1, 1, 1, 1, 1,
0.476875, -0.5189096, 1.739042, 1, 1, 1, 1, 1,
0.4783436, 0.3027106, 0.2048113, 1, 1, 1, 1, 1,
0.47995, 0.0804496, -0.1415002, 1, 1, 1, 1, 1,
0.4800701, 2.4554, -1.784513, 1, 1, 1, 1, 1,
0.4812331, -0.2868485, 1.428319, 1, 1, 1, 1, 1,
0.4909014, -1.063727, 3.031331, 1, 1, 1, 1, 1,
0.4934267, -1.594421, 1.865181, 0, 0, 1, 1, 1,
0.4957553, 1.577188, -1.361487, 1, 0, 0, 1, 1,
0.4988392, 0.2997732, 2.615303, 1, 0, 0, 1, 1,
0.5055526, -0.5494326, 4.0007, 1, 0, 0, 1, 1,
0.5097981, 0.7239885, -1.726835, 1, 0, 0, 1, 1,
0.5148497, 0.2658414, 1.066553, 1, 0, 0, 1, 1,
0.5149447, 0.4231904, 0.8533415, 0, 0, 0, 1, 1,
0.5195422, -0.4784722, 2.22016, 0, 0, 0, 1, 1,
0.5223501, -0.3920005, 3.171892, 0, 0, 0, 1, 1,
0.5269719, 1.66002, 0.08704914, 0, 0, 0, 1, 1,
0.5337444, 0.177753, 2.148343, 0, 0, 0, 1, 1,
0.5357387, 0.03528446, 1.013304, 0, 0, 0, 1, 1,
0.5387087, 0.4853908, 1.282421, 0, 0, 0, 1, 1,
0.5413898, -0.8067575, 2.591396, 1, 1, 1, 1, 1,
0.5429505, 0.3538225, -0.7508486, 1, 1, 1, 1, 1,
0.5438977, 1.182921, 1.962834, 1, 1, 1, 1, 1,
0.545079, 1.302726, 0.1050382, 1, 1, 1, 1, 1,
0.5478846, -0.3749709, 2.804763, 1, 1, 1, 1, 1,
0.5500152, -0.6638076, 3.295244, 1, 1, 1, 1, 1,
0.5540702, -0.06439485, 0.8378189, 1, 1, 1, 1, 1,
0.5558518, 0.6788283, -0.4635847, 1, 1, 1, 1, 1,
0.5575197, 0.808596, 1.107344, 1, 1, 1, 1, 1,
0.5600794, 0.4468549, 3.17526, 1, 1, 1, 1, 1,
0.5627624, 0.6618818, 1.304605, 1, 1, 1, 1, 1,
0.5654944, -0.2865604, 2.401377, 1, 1, 1, 1, 1,
0.5660226, 1.945783, -0.9132967, 1, 1, 1, 1, 1,
0.5665097, 1.133477, 1.828584, 1, 1, 1, 1, 1,
0.5719594, 0.6509668, 2.131156, 1, 1, 1, 1, 1,
0.5772619, -0.6304338, 1.739093, 0, 0, 1, 1, 1,
0.578102, -0.06661399, 1.180056, 1, 0, 0, 1, 1,
0.5820344, -0.2478123, 2.047968, 1, 0, 0, 1, 1,
0.5878614, 1.156324, 2.007815, 1, 0, 0, 1, 1,
0.5884719, 0.3585491, -0.01288275, 1, 0, 0, 1, 1,
0.5910428, 0.3967774, -0.7463098, 1, 0, 0, 1, 1,
0.596203, 1.01935, 1.234234, 0, 0, 0, 1, 1,
0.5963051, 0.6823321, 1.43728, 0, 0, 0, 1, 1,
0.6016674, 1.34849, 1.438951, 0, 0, 0, 1, 1,
0.6024958, -1.361311, 4.250556, 0, 0, 0, 1, 1,
0.602596, 1.726322, -0.8850971, 0, 0, 0, 1, 1,
0.6116815, -1.0426, 2.466407, 0, 0, 0, 1, 1,
0.616111, 0.8587276, -1.039047, 0, 0, 0, 1, 1,
0.6162868, 1.079077, -0.03148114, 1, 1, 1, 1, 1,
0.6169652, 0.7667437, 1.67266, 1, 1, 1, 1, 1,
0.6216601, 0.702224, 1.217588, 1, 1, 1, 1, 1,
0.629858, 0.2090669, -0.130046, 1, 1, 1, 1, 1,
0.6473311, 0.8709881, 0.8608021, 1, 1, 1, 1, 1,
0.6480833, 1.694028, -1.539285, 1, 1, 1, 1, 1,
0.6495858, -0.335242, 3.733473, 1, 1, 1, 1, 1,
0.6633127, 0.5494808, 2.131891, 1, 1, 1, 1, 1,
0.6642739, -1.034792, 2.871737, 1, 1, 1, 1, 1,
0.6658079, -1.264685, 3.89705, 1, 1, 1, 1, 1,
0.6701379, 0.9787903, 2.087302, 1, 1, 1, 1, 1,
0.6711021, 0.08514854, 1.102023, 1, 1, 1, 1, 1,
0.6730186, 0.3758368, 0.648726, 1, 1, 1, 1, 1,
0.6777333, 1.395538, 0.5360515, 1, 1, 1, 1, 1,
0.6794601, 0.2608934, -1.085751, 1, 1, 1, 1, 1,
0.6812453, -0.08964496, 3.811081, 0, 0, 1, 1, 1,
0.6855264, 0.4031155, 0.2762633, 1, 0, 0, 1, 1,
0.6893102, -0.4869324, 0.5209541, 1, 0, 0, 1, 1,
0.6906272, 0.01595431, 2.523258, 1, 0, 0, 1, 1,
0.6910816, -0.01223728, 0.4767361, 1, 0, 0, 1, 1,
0.6928006, 0.3226946, 2.65904, 1, 0, 0, 1, 1,
0.6928753, -0.8832526, 1.428277, 0, 0, 0, 1, 1,
0.693759, 1.241662, -0.6395828, 0, 0, 0, 1, 1,
0.6939733, -0.0315584, 2.733706, 0, 0, 0, 1, 1,
0.6993062, -0.2517017, 1.624832, 0, 0, 0, 1, 1,
0.6996444, 0.8848929, 1.422495, 0, 0, 0, 1, 1,
0.6996558, -0.05540087, 1.00599, 0, 0, 0, 1, 1,
0.7005538, -1.493347, 3.295757, 0, 0, 0, 1, 1,
0.7083527, 1.048394, 0.5358827, 1, 1, 1, 1, 1,
0.7086365, -0.2301772, 3.870532, 1, 1, 1, 1, 1,
0.7194891, 0.8205627, 0.2441873, 1, 1, 1, 1, 1,
0.7313455, 0.1718455, 0.8324672, 1, 1, 1, 1, 1,
0.7330748, -1.044513, 3.040331, 1, 1, 1, 1, 1,
0.7336627, -1.449836, 2.975303, 1, 1, 1, 1, 1,
0.7357371, 0.3169555, 1.918484, 1, 1, 1, 1, 1,
0.7387637, 1.24884, 2.028342, 1, 1, 1, 1, 1,
0.7472462, -0.3481523, 1.927037, 1, 1, 1, 1, 1,
0.7520994, -0.5360854, 1.758209, 1, 1, 1, 1, 1,
0.7535757, -1.503349, 2.571269, 1, 1, 1, 1, 1,
0.7542482, 0.6907739, 0.3776027, 1, 1, 1, 1, 1,
0.757726, -1.428577, 1.898926, 1, 1, 1, 1, 1,
0.7591785, 2.001291, 1.052956, 1, 1, 1, 1, 1,
0.7602203, 0.1444395, -0.4486155, 1, 1, 1, 1, 1,
0.7606221, -0.3672168, 1.620492, 0, 0, 1, 1, 1,
0.7625968, 0.9575164, -0.3239147, 1, 0, 0, 1, 1,
0.7628923, -1.030648, 1.678479, 1, 0, 0, 1, 1,
0.7688805, 0.897966, 1.417525, 1, 0, 0, 1, 1,
0.7709821, -1.62726, 4.325713, 1, 0, 0, 1, 1,
0.7746363, -0.3215016, 2.604761, 1, 0, 0, 1, 1,
0.7762109, -0.7811378, 1.792224, 0, 0, 0, 1, 1,
0.7783619, 1.810809, -0.2321566, 0, 0, 0, 1, 1,
0.7820041, -3.163136, 4.136869, 0, 0, 0, 1, 1,
0.7844357, 0.05420416, -0.1085137, 0, 0, 0, 1, 1,
0.7902511, -1.352432, 1.775528, 0, 0, 0, 1, 1,
0.7913572, 0.05598849, 1.70561, 0, 0, 0, 1, 1,
0.7930475, -0.2200611, 1.02388, 0, 0, 0, 1, 1,
0.7938259, -0.7235214, 1.663321, 1, 1, 1, 1, 1,
0.7958478, -0.811645, 1.951658, 1, 1, 1, 1, 1,
0.8041857, 0.1727588, 1.719714, 1, 1, 1, 1, 1,
0.8121605, 2.425843, 2.300504, 1, 1, 1, 1, 1,
0.8169636, 0.3305611, 2.125342, 1, 1, 1, 1, 1,
0.8241759, -0.1373363, 2.227859, 1, 1, 1, 1, 1,
0.8291357, 0.441605, 1.625473, 1, 1, 1, 1, 1,
0.8391459, 1.496869, -0.4550812, 1, 1, 1, 1, 1,
0.839236, 0.4550675, 1.036821, 1, 1, 1, 1, 1,
0.841318, 0.4887682, 1.10294, 1, 1, 1, 1, 1,
0.8449259, 0.4920457, 1.539359, 1, 1, 1, 1, 1,
0.845102, -0.2710516, 1.555985, 1, 1, 1, 1, 1,
0.848859, -0.8035187, 2.292475, 1, 1, 1, 1, 1,
0.8569206, 1.332344, -0.7669452, 1, 1, 1, 1, 1,
0.8626218, 0.523281, 1.791491, 1, 1, 1, 1, 1,
0.8640419, -0.7690263, 3.981918, 0, 0, 1, 1, 1,
0.871151, 0.7878416, 0.7582402, 1, 0, 0, 1, 1,
0.8783673, 2.357013, 0.5876982, 1, 0, 0, 1, 1,
0.8867978, -0.1335576, 3.759794, 1, 0, 0, 1, 1,
0.8950052, 0.5594934, 1.789939, 1, 0, 0, 1, 1,
0.9003755, -0.2595184, 3.593854, 1, 0, 0, 1, 1,
0.9006252, 1.726721, 0.529163, 0, 0, 0, 1, 1,
0.9059932, 0.03225129, 3.236139, 0, 0, 0, 1, 1,
0.9063428, -0.09315658, 3.484118, 0, 0, 0, 1, 1,
0.9069774, -0.380091, 2.004483, 0, 0, 0, 1, 1,
0.9127014, 1.142003, 0.9115713, 0, 0, 0, 1, 1,
0.9149892, -1.031496, 2.784802, 0, 0, 0, 1, 1,
0.9193742, -1.884875, 4.514324, 0, 0, 0, 1, 1,
0.9245508, 1.196245, 1.545819, 1, 1, 1, 1, 1,
0.9261692, -1.410553, 1.418052, 1, 1, 1, 1, 1,
0.9390834, -1.082603, 1.50533, 1, 1, 1, 1, 1,
0.9482244, -0.06278928, 1.179886, 1, 1, 1, 1, 1,
0.9490994, 0.6089422, 0.02828562, 1, 1, 1, 1, 1,
0.9539495, 0.9060704, 0.1052484, 1, 1, 1, 1, 1,
0.9547989, -0.7959434, 2.16326, 1, 1, 1, 1, 1,
0.9640684, -0.4300809, 1.061487, 1, 1, 1, 1, 1,
0.9796073, -0.06167475, 2.468395, 1, 1, 1, 1, 1,
0.9835562, -0.7299792, 1.18038, 1, 1, 1, 1, 1,
0.9906728, 0.3692682, 1.317683, 1, 1, 1, 1, 1,
0.9960567, -0.8492005, 1.915465, 1, 1, 1, 1, 1,
0.9991386, -0.8550659, 2.708449, 1, 1, 1, 1, 1,
1.000146, -0.747678, 0.9546039, 1, 1, 1, 1, 1,
1.007271, -1.35174, 0.9276062, 1, 1, 1, 1, 1,
1.007572, 0.5570266, 3.014965, 0, 0, 1, 1, 1,
1.020881, -0.08859186, 1.724985, 1, 0, 0, 1, 1,
1.021514, -0.330173, 1.634012, 1, 0, 0, 1, 1,
1.024227, 0.5087246, 0.415113, 1, 0, 0, 1, 1,
1.039897, -0.8638483, 4.921168, 1, 0, 0, 1, 1,
1.048029, -0.4664566, 1.906176, 1, 0, 0, 1, 1,
1.051101, -0.1365544, 2.164802, 0, 0, 0, 1, 1,
1.054125, 0.4667717, 0.8968647, 0, 0, 0, 1, 1,
1.063717, -0.2857065, 1.799138, 0, 0, 0, 1, 1,
1.064808, 1.264567, 1.499787, 0, 0, 0, 1, 1,
1.069566, 1.048146, 0.3572999, 0, 0, 0, 1, 1,
1.078488, 0.1510902, 3.048632, 0, 0, 0, 1, 1,
1.080766, -0.05931579, 0.9669112, 0, 0, 0, 1, 1,
1.083879, 0.5706672, 0.5277613, 1, 1, 1, 1, 1,
1.088243, 0.9102018, 1.18576, 1, 1, 1, 1, 1,
1.097074, 0.3398762, 3.870278, 1, 1, 1, 1, 1,
1.097253, -1.083841, 2.082816, 1, 1, 1, 1, 1,
1.100498, -0.6287936, 1.974733, 1, 1, 1, 1, 1,
1.100987, -0.6026753, 2.242131, 1, 1, 1, 1, 1,
1.102128, -0.2873907, 1.739096, 1, 1, 1, 1, 1,
1.116526, 0.4779097, 0.9560913, 1, 1, 1, 1, 1,
1.124905, 0.2860641, 0.6070372, 1, 1, 1, 1, 1,
1.127135, -0.9822847, 2.071024, 1, 1, 1, 1, 1,
1.127272, 1.439456, 1.152099, 1, 1, 1, 1, 1,
1.12873, -1.140882, 2.479359, 1, 1, 1, 1, 1,
1.139245, -0.1067626, 1.130869, 1, 1, 1, 1, 1,
1.141822, -0.9420909, 2.470045, 1, 1, 1, 1, 1,
1.155033, -0.5424067, 1.328296, 1, 1, 1, 1, 1,
1.156384, -0.4648532, 0.008919511, 0, 0, 1, 1, 1,
1.157713, 0.2481958, 2.405093, 1, 0, 0, 1, 1,
1.159778, -1.119148, 2.162616, 1, 0, 0, 1, 1,
1.160525, -1.907928, 2.522719, 1, 0, 0, 1, 1,
1.161097, 0.09567866, 2.161589, 1, 0, 0, 1, 1,
1.161452, 1.694343, -0.2095357, 1, 0, 0, 1, 1,
1.165542, -0.8995823, 1.419244, 0, 0, 0, 1, 1,
1.175749, 0.1787835, 3.777071, 0, 0, 0, 1, 1,
1.175964, -0.9329506, 2.038856, 0, 0, 0, 1, 1,
1.187608, -1.139707, 2.46089, 0, 0, 0, 1, 1,
1.190241, -1.252937, 1.376042, 0, 0, 0, 1, 1,
1.191225, -2.302333, 2.258345, 0, 0, 0, 1, 1,
1.194104, -2.456043, 3.001556, 0, 0, 0, 1, 1,
1.20024, 0.9721723, 1.58906, 1, 1, 1, 1, 1,
1.203134, -0.7697664, 2.366323, 1, 1, 1, 1, 1,
1.206754, -0.3398937, 2.62043, 1, 1, 1, 1, 1,
1.219261, -0.6650891, 1.295287, 1, 1, 1, 1, 1,
1.228922, 1.554335, 0.1615337, 1, 1, 1, 1, 1,
1.232007, -0.9496294, 1.963701, 1, 1, 1, 1, 1,
1.232723, -1.225315, 2.129943, 1, 1, 1, 1, 1,
1.23466, 0.7646238, 1.55854, 1, 1, 1, 1, 1,
1.252597, -2.002211, 0.540633, 1, 1, 1, 1, 1,
1.25578, 1.38165, 1.146019, 1, 1, 1, 1, 1,
1.258964, -0.737838, 1.129104, 1, 1, 1, 1, 1,
1.279407, -0.6496368, 3.59404, 1, 1, 1, 1, 1,
1.285723, 0.6578373, 0.9701422, 1, 1, 1, 1, 1,
1.289038, 0.526156, 0.1251108, 1, 1, 1, 1, 1,
1.292087, 1.696939, 1.802533, 1, 1, 1, 1, 1,
1.295037, -0.6023043, 1.288741, 0, 0, 1, 1, 1,
1.299486, 0.3140247, 0.8479347, 1, 0, 0, 1, 1,
1.302533, 1.389208, 0.992911, 1, 0, 0, 1, 1,
1.306778, -1.170922, 2.875637, 1, 0, 0, 1, 1,
1.308341, -0.6283652, 2.599987, 1, 0, 0, 1, 1,
1.314693, -0.8852327, 1.662404, 1, 0, 0, 1, 1,
1.317868, 0.8141547, 1.545337, 0, 0, 0, 1, 1,
1.339704, -0.2733196, 1.955499, 0, 0, 0, 1, 1,
1.345292, 0.5526985, 2.007254, 0, 0, 0, 1, 1,
1.349694, 0.4231631, 1.742429, 0, 0, 0, 1, 1,
1.349742, 1.097804, 2.950362, 0, 0, 0, 1, 1,
1.351527, -0.9813115, 3.22608, 0, 0, 0, 1, 1,
1.362401, -0.9451003, 0.8872051, 0, 0, 0, 1, 1,
1.371696, -1.276916, 0.4913771, 1, 1, 1, 1, 1,
1.37185, 0.4996072, -0.1710442, 1, 1, 1, 1, 1,
1.374171, 0.5134211, 0.05959695, 1, 1, 1, 1, 1,
1.376753, -0.1742848, 0.5984033, 1, 1, 1, 1, 1,
1.38702, 0.702866, 1.608932, 1, 1, 1, 1, 1,
1.391726, 0.01064187, 2.475569, 1, 1, 1, 1, 1,
1.406877, 0.3043077, 1.234744, 1, 1, 1, 1, 1,
1.412544, -0.2945083, 1.202957, 1, 1, 1, 1, 1,
1.427274, -2.39594, 2.026428, 1, 1, 1, 1, 1,
1.433211, -0.9692393, 0.9901135, 1, 1, 1, 1, 1,
1.443506, -0.7341186, 1.508427, 1, 1, 1, 1, 1,
1.447758, 1.596236, -1.496062, 1, 1, 1, 1, 1,
1.459298, 0.3514673, 2.782631, 1, 1, 1, 1, 1,
1.467234, 1.721861, 1.364062, 1, 1, 1, 1, 1,
1.476752, 0.7339584, 0.1618847, 1, 1, 1, 1, 1,
1.479494, -1.868349, 3.050135, 0, 0, 1, 1, 1,
1.486065, 0.1039544, 1.561515, 1, 0, 0, 1, 1,
1.510716, 0.2117397, 1.239123, 1, 0, 0, 1, 1,
1.51783, 1.683083, -0.2392721, 1, 0, 0, 1, 1,
1.535124, 0.01460632, 2.778764, 1, 0, 0, 1, 1,
1.535922, 1.177914, -0.771811, 1, 0, 0, 1, 1,
1.539285, -0.9376288, 2.461446, 0, 0, 0, 1, 1,
1.550781, 1.511209, 0.8742834, 0, 0, 0, 1, 1,
1.555184, 0.9339285, 1.808226, 0, 0, 0, 1, 1,
1.561499, 0.3493027, 2.68074, 0, 0, 0, 1, 1,
1.571731, 2.2665, 1.434746, 0, 0, 0, 1, 1,
1.580397, 0.9514652, 0.9869374, 0, 0, 0, 1, 1,
1.584224, -1.198879, 1.500332, 0, 0, 0, 1, 1,
1.588567, 1.477029, 1.526616, 1, 1, 1, 1, 1,
1.590029, 0.2377087, 2.107863, 1, 1, 1, 1, 1,
1.594411, -2.851397, 3.400291, 1, 1, 1, 1, 1,
1.606736, -0.8803399, 0.2652694, 1, 1, 1, 1, 1,
1.619132, 0.2810333, 0.09503851, 1, 1, 1, 1, 1,
1.627776, 1.573204, 1.196256, 1, 1, 1, 1, 1,
1.629227, -0.6134887, 1.360274, 1, 1, 1, 1, 1,
1.635257, -0.08245688, 2.628966, 1, 1, 1, 1, 1,
1.642719, -0.6717313, 1.698721, 1, 1, 1, 1, 1,
1.646887, -0.4410275, 1.914019, 1, 1, 1, 1, 1,
1.648349, -0.5110071, 3.54033, 1, 1, 1, 1, 1,
1.650125, -1.153459, 1.588304, 1, 1, 1, 1, 1,
1.658716, 0.8822341, 1.453695, 1, 1, 1, 1, 1,
1.665312, -0.2713684, 2.413676, 1, 1, 1, 1, 1,
1.680291, -0.1781584, 1.590748, 1, 1, 1, 1, 1,
1.684051, -0.2180887, 2.198833, 0, 0, 1, 1, 1,
1.685521, 0.1361252, 1.096079, 1, 0, 0, 1, 1,
1.686265, 0.1776839, 1.016025, 1, 0, 0, 1, 1,
1.704099, 0.9467846, 0.2733152, 1, 0, 0, 1, 1,
1.70533, -0.8303536, 3.196508, 1, 0, 0, 1, 1,
1.70944, 0.1145156, 0.9070301, 1, 0, 0, 1, 1,
1.710573, 0.1185007, 1.096144, 0, 0, 0, 1, 1,
1.721075, -0.5933321, 3.215697, 0, 0, 0, 1, 1,
1.724268, 1.380141, 0.9156027, 0, 0, 0, 1, 1,
1.747479, -0.4435704, -0.1610246, 0, 0, 0, 1, 1,
1.748443, -0.4747428, 1.312284, 0, 0, 0, 1, 1,
1.759641, 0.8602782, 2.112789, 0, 0, 0, 1, 1,
1.789142, 0.1599357, 2.114651, 0, 0, 0, 1, 1,
1.816171, 1.106638, 0.533428, 1, 1, 1, 1, 1,
1.828168, 1.100461, 0.8194448, 1, 1, 1, 1, 1,
1.836121, -1.289455, 2.102878, 1, 1, 1, 1, 1,
1.850714, -1.064404, 4.29686, 1, 1, 1, 1, 1,
1.8634, 1.382628, 0.5075604, 1, 1, 1, 1, 1,
1.866435, 0.2915591, 0.1817825, 1, 1, 1, 1, 1,
1.874616, -1.087934, 1.762086, 1, 1, 1, 1, 1,
1.902394, 0.7878894, 1.429033, 1, 1, 1, 1, 1,
1.903553, 0.6498792, 2.474417, 1, 1, 1, 1, 1,
1.942961, 1.0984, 2.102987, 1, 1, 1, 1, 1,
1.963728, 0.5593431, 1.491282, 1, 1, 1, 1, 1,
2.025939, 0.7477842, -0.2196045, 1, 1, 1, 1, 1,
2.046526, 1.496816, 2.137752, 1, 1, 1, 1, 1,
2.049919, -0.05027768, 1.502967, 1, 1, 1, 1, 1,
2.063275, -0.09837981, 1.288472, 1, 1, 1, 1, 1,
2.088706, -1.53681, 1.321958, 0, 0, 1, 1, 1,
2.104164, 0.6615738, 0.8469359, 1, 0, 0, 1, 1,
2.112247, -0.695461, 2.76712, 1, 0, 0, 1, 1,
2.121059, -1.053227, 1.258017, 1, 0, 0, 1, 1,
2.121173, 0.9881838, 1.055639, 1, 0, 0, 1, 1,
2.13424, 0.3396811, 1.273933, 1, 0, 0, 1, 1,
2.160123, -0.6869168, 2.610238, 0, 0, 0, 1, 1,
2.163831, -2.258684, 1.523794, 0, 0, 0, 1, 1,
2.173308, -1.468153, 1.397945, 0, 0, 0, 1, 1,
2.176734, -0.3906486, 2.898588, 0, 0, 0, 1, 1,
2.20191, -0.7783755, 1.690075, 0, 0, 0, 1, 1,
2.220541, 0.05580953, 3.055413, 0, 0, 0, 1, 1,
2.262074, -0.1524111, 2.423027, 0, 0, 0, 1, 1,
2.365848, 0.2549776, 2.514089, 1, 1, 1, 1, 1,
2.389297, -0.378496, 1.1961, 1, 1, 1, 1, 1,
2.444566, -0.727441, -1.233757, 1, 1, 1, 1, 1,
2.46432, -1.976031, 2.521287, 1, 1, 1, 1, 1,
2.513016, -1.061637, 2.880142, 1, 1, 1, 1, 1,
2.784379, 0.5525077, 1.526502, 1, 1, 1, 1, 1,
3.520432, 1.035419, 1.06927, 1, 1, 1, 1, 1
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
var radius = 10.00056;
var distance = 35.12655;
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
mvMatrix.translate( -0.3665596, -0.2443423, -0.3000262 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.12655);
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
