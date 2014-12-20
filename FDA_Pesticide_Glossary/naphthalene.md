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
-3.339025, 0.2199853, -1.429299, 1, 0, 0, 1,
-2.971894, -1.232786, -1.73005, 1, 0.007843138, 0, 1,
-2.906759, 1.125736, -0.3309358, 1, 0.01176471, 0, 1,
-2.889323, 0.8087026, -1.556752, 1, 0.01960784, 0, 1,
-2.798643, -0.3887787, -0.3825495, 1, 0.02352941, 0, 1,
-2.743224, -0.6286257, -1.110265, 1, 0.03137255, 0, 1,
-2.571425, -0.5757471, -1.696825, 1, 0.03529412, 0, 1,
-2.547195, 0.3243739, -1.888595, 1, 0.04313726, 0, 1,
-2.538892, -0.5421336, -2.637569, 1, 0.04705882, 0, 1,
-2.46962, 2.102684, -0.5070159, 1, 0.05490196, 0, 1,
-2.409934, 0.6091363, -1.703666, 1, 0.05882353, 0, 1,
-2.358779, 0.8358602, 1.000025, 1, 0.06666667, 0, 1,
-2.227972, -0.8345543, -1.425427, 1, 0.07058824, 0, 1,
-2.226807, 0.2183539, -0.05515337, 1, 0.07843138, 0, 1,
-2.192951, 0.6062515, -2.296369, 1, 0.08235294, 0, 1,
-2.178398, 0.747473, -2.912029, 1, 0.09019608, 0, 1,
-2.172091, -0.982996, -0.1427804, 1, 0.09411765, 0, 1,
-2.162809, -2.809976, -2.76471, 1, 0.1019608, 0, 1,
-2.149633, -0.3031108, -1.745169, 1, 0.1098039, 0, 1,
-2.141074, 0.3082548, -0.7591444, 1, 0.1137255, 0, 1,
-2.096474, 0.1953378, -0.4494278, 1, 0.1215686, 0, 1,
-2.09556, 2.07366, -1.693885, 1, 0.1254902, 0, 1,
-2.056157, 1.314649, -0.8901604, 1, 0.1333333, 0, 1,
-2.046885, 1.847878, -1.10805, 1, 0.1372549, 0, 1,
-2.025038, -1.050353, -0.3824238, 1, 0.145098, 0, 1,
-1.956776, -0.7017812, -2.162878, 1, 0.1490196, 0, 1,
-1.946649, -0.931711, -1.914426, 1, 0.1568628, 0, 1,
-1.946071, 0.105603, -2.60231, 1, 0.1607843, 0, 1,
-1.935639, 0.02028211, -2.264864, 1, 0.1686275, 0, 1,
-1.875889, 1.096007, -2.502767, 1, 0.172549, 0, 1,
-1.855227, -1.066651, -1.533009, 1, 0.1803922, 0, 1,
-1.835962, 0.3547893, 0.9239991, 1, 0.1843137, 0, 1,
-1.828057, 0.2165217, -3.178198, 1, 0.1921569, 0, 1,
-1.823399, -0.2435218, -0.8552533, 1, 0.1960784, 0, 1,
-1.813515, -1.116156, -0.9571477, 1, 0.2039216, 0, 1,
-1.806091, -1.301438, -1.560824, 1, 0.2117647, 0, 1,
-1.804197, 1.912132, -0.9533072, 1, 0.2156863, 0, 1,
-1.802584, 1.31394, -0.9276778, 1, 0.2235294, 0, 1,
-1.791358, -1.137284, -0.8743676, 1, 0.227451, 0, 1,
-1.775237, 0.1185119, -1.483435, 1, 0.2352941, 0, 1,
-1.772493, 0.5145774, -2.763311, 1, 0.2392157, 0, 1,
-1.733949, -0.3058372, -1.72653, 1, 0.2470588, 0, 1,
-1.729377, 0.1113816, -2.098562, 1, 0.2509804, 0, 1,
-1.729343, 1.351104, -0.48958, 1, 0.2588235, 0, 1,
-1.720352, -0.622008, -3.701658, 1, 0.2627451, 0, 1,
-1.7169, 1.803568, 0.3829407, 1, 0.2705882, 0, 1,
-1.711238, 0.7292723, -1.568295, 1, 0.2745098, 0, 1,
-1.705896, 0.6959448, -2.119606, 1, 0.282353, 0, 1,
-1.700361, 0.02824936, -3.347362, 1, 0.2862745, 0, 1,
-1.69651, 0.4440038, -0.6748158, 1, 0.2941177, 0, 1,
-1.690771, 0.287825, -1.600107, 1, 0.3019608, 0, 1,
-1.690711, -0.3454205, -1.157427, 1, 0.3058824, 0, 1,
-1.681794, -0.1416932, -1.358758, 1, 0.3137255, 0, 1,
-1.681553, 0.9873223, -2.972142, 1, 0.3176471, 0, 1,
-1.678732, 0.1476647, -2.044639, 1, 0.3254902, 0, 1,
-1.668315, 0.9196165, -2.695956, 1, 0.3294118, 0, 1,
-1.666103, -0.5194404, -2.455736, 1, 0.3372549, 0, 1,
-1.64819, -2.491452, -3.297601, 1, 0.3411765, 0, 1,
-1.634374, -1.370229, -2.235512, 1, 0.3490196, 0, 1,
-1.633045, -0.2156456, -0.4856597, 1, 0.3529412, 0, 1,
-1.628021, 1.067445, -1.532191, 1, 0.3607843, 0, 1,
-1.616582, -0.3384143, -0.2224297, 1, 0.3647059, 0, 1,
-1.598307, -0.07739811, -2.375632, 1, 0.372549, 0, 1,
-1.585159, 0.4287068, -2.538117, 1, 0.3764706, 0, 1,
-1.584383, -0.05925257, -1.446455, 1, 0.3843137, 0, 1,
-1.583925, 0.3991582, -0.639396, 1, 0.3882353, 0, 1,
-1.551757, 0.9738549, -0.5305471, 1, 0.3960784, 0, 1,
-1.545361, -0.5222169, 0.0691433, 1, 0.4039216, 0, 1,
-1.539286, 1.084442, -0.8667321, 1, 0.4078431, 0, 1,
-1.538887, 0.6763481, -1.06204, 1, 0.4156863, 0, 1,
-1.538099, -1.05906, -1.294431, 1, 0.4196078, 0, 1,
-1.521477, 0.6570826, -1.006646, 1, 0.427451, 0, 1,
-1.516057, 1.740504, -1.530262, 1, 0.4313726, 0, 1,
-1.513881, 0.5052906, -1.567234, 1, 0.4392157, 0, 1,
-1.511685, 2.060596, 0.4433398, 1, 0.4431373, 0, 1,
-1.508489, -0.928743, -2.307443, 1, 0.4509804, 0, 1,
-1.50309, -0.9179727, -2.337869, 1, 0.454902, 0, 1,
-1.496524, 0.1455265, -4.041934, 1, 0.4627451, 0, 1,
-1.490538, 1.202596, 0.1419929, 1, 0.4666667, 0, 1,
-1.48754, 0.6309715, -0.3543638, 1, 0.4745098, 0, 1,
-1.484276, -0.7663629, 1.70146, 1, 0.4784314, 0, 1,
-1.483533, -1.786728, -4.941492, 1, 0.4862745, 0, 1,
-1.482715, 0.5101039, -1.032428, 1, 0.4901961, 0, 1,
-1.481796, -0.812097, -1.312949, 1, 0.4980392, 0, 1,
-1.480264, 0.02938623, -1.065269, 1, 0.5058824, 0, 1,
-1.48004, -0.02402337, -0.6388621, 1, 0.509804, 0, 1,
-1.469522, 0.1166313, -1.461578, 1, 0.5176471, 0, 1,
-1.466278, 0.8258338, -2.338332, 1, 0.5215687, 0, 1,
-1.44379, -0.4629706, -2.797225, 1, 0.5294118, 0, 1,
-1.416169, -1.263935, -1.609242, 1, 0.5333334, 0, 1,
-1.410832, 0.2527781, -0.7942635, 1, 0.5411765, 0, 1,
-1.393064, 0.3916091, -1.342395, 1, 0.5450981, 0, 1,
-1.391604, -0.919149, -1.027904, 1, 0.5529412, 0, 1,
-1.359764, -0.3171577, -0.5254417, 1, 0.5568628, 0, 1,
-1.336815, 0.5077399, -1.800637, 1, 0.5647059, 0, 1,
-1.331835, -0.03406867, -1.794801, 1, 0.5686275, 0, 1,
-1.323786, 1.494255, -1.981455, 1, 0.5764706, 0, 1,
-1.321224, 0.07439198, -0.3712786, 1, 0.5803922, 0, 1,
-1.319981, -0.414858, -1.352862, 1, 0.5882353, 0, 1,
-1.31426, -1.442204, -1.735114, 1, 0.5921569, 0, 1,
-1.309757, -1.923704, -2.248119, 1, 0.6, 0, 1,
-1.307906, 0.7774598, -0.5265433, 1, 0.6078432, 0, 1,
-1.29019, 0.196356, -1.209968, 1, 0.6117647, 0, 1,
-1.282303, -1.424084, -2.396656, 1, 0.6196079, 0, 1,
-1.271126, 0.4873369, -1.884472, 1, 0.6235294, 0, 1,
-1.267481, 1.699765, -0.9954063, 1, 0.6313726, 0, 1,
-1.254736, -0.009347004, -0.5623133, 1, 0.6352941, 0, 1,
-1.251552, -0.7809382, -2.514202, 1, 0.6431373, 0, 1,
-1.24857, 1.931372, 0.09589687, 1, 0.6470588, 0, 1,
-1.241805, 0.6861317, -1.319901, 1, 0.654902, 0, 1,
-1.232947, -2.151567, -3.942555, 1, 0.6588235, 0, 1,
-1.230932, -0.2090322, -0.4167102, 1, 0.6666667, 0, 1,
-1.230178, -0.3348879, -1.23526, 1, 0.6705883, 0, 1,
-1.225027, 1.262761, 0.7050697, 1, 0.6784314, 0, 1,
-1.218871, 1.081382, -2.22421, 1, 0.682353, 0, 1,
-1.215128, -1.909149, -2.257669, 1, 0.6901961, 0, 1,
-1.212515, -1.725794, -2.796072, 1, 0.6941177, 0, 1,
-1.21154, -1.343197, -1.844658, 1, 0.7019608, 0, 1,
-1.20919, -1.187606, -3.338092, 1, 0.7098039, 0, 1,
-1.207234, 1.521957, -0.5118096, 1, 0.7137255, 0, 1,
-1.204439, 0.3688102, -4.101818, 1, 0.7215686, 0, 1,
-1.191441, 0.2919341, -2.36321, 1, 0.7254902, 0, 1,
-1.191378, 0.9476557, 0.660044, 1, 0.7333333, 0, 1,
-1.184412, -0.04986055, -1.787575, 1, 0.7372549, 0, 1,
-1.183448, -0.01689198, -0.008299666, 1, 0.7450981, 0, 1,
-1.173748, -0.9686133, -1.352874, 1, 0.7490196, 0, 1,
-1.169628, -1.874911, -2.878266, 1, 0.7568628, 0, 1,
-1.164709, -0.5940763, -1.52323, 1, 0.7607843, 0, 1,
-1.163926, 0.6869718, -2.003421, 1, 0.7686275, 0, 1,
-1.162969, 0.1963369, -1.107203, 1, 0.772549, 0, 1,
-1.162758, -0.1657835, -0.4673766, 1, 0.7803922, 0, 1,
-1.152157, -0.6981806, -3.044193, 1, 0.7843137, 0, 1,
-1.149205, 0.6338159, -1.564143, 1, 0.7921569, 0, 1,
-1.148733, 0.2110461, -4.235259, 1, 0.7960784, 0, 1,
-1.146265, 2.403255, -1.132875, 1, 0.8039216, 0, 1,
-1.144306, 0.9390405, -1.717069, 1, 0.8117647, 0, 1,
-1.136691, -0.411748, -1.553186, 1, 0.8156863, 0, 1,
-1.134309, 0.649898, -1.820156, 1, 0.8235294, 0, 1,
-1.134175, -1.227877, -2.805179, 1, 0.827451, 0, 1,
-1.128235, 0.9893042, 0.1049491, 1, 0.8352941, 0, 1,
-1.121733, -0.3928905, -2.224795, 1, 0.8392157, 0, 1,
-1.119198, 1.044402, -0.08961073, 1, 0.8470588, 0, 1,
-1.115577, 0.5464298, -1.160208, 1, 0.8509804, 0, 1,
-1.111878, -1.193053, -0.7821724, 1, 0.8588235, 0, 1,
-1.108994, -0.6252636, -1.63727, 1, 0.8627451, 0, 1,
-1.106, 0.372712, -2.481752, 1, 0.8705882, 0, 1,
-1.103102, 0.9193797, 0.1688203, 1, 0.8745098, 0, 1,
-1.100512, 0.169494, -2.959821, 1, 0.8823529, 0, 1,
-1.09039, -1.241994, -0.2806435, 1, 0.8862745, 0, 1,
-1.089171, -1.1687, -1.818344, 1, 0.8941177, 0, 1,
-1.086054, -0.912318, -1.426643, 1, 0.8980392, 0, 1,
-1.085134, 0.2660175, -0.2103731, 1, 0.9058824, 0, 1,
-1.078093, -0.2455774, -1.746598, 1, 0.9137255, 0, 1,
-1.064843, 0.7075276, -0.8968082, 1, 0.9176471, 0, 1,
-1.059875, -0.1485943, -1.413155, 1, 0.9254902, 0, 1,
-1.059538, 0.1198718, -1.121517, 1, 0.9294118, 0, 1,
-1.049917, -0.3375935, -0.1450986, 1, 0.9372549, 0, 1,
-1.043198, 0.2735623, -1.282212, 1, 0.9411765, 0, 1,
-1.043141, -0.412666, -1.383023, 1, 0.9490196, 0, 1,
-1.040987, 0.7948523, -2.187029, 1, 0.9529412, 0, 1,
-1.039788, -0.3529183, 0.01891329, 1, 0.9607843, 0, 1,
-1.036725, 0.9390455, -2.116694, 1, 0.9647059, 0, 1,
-1.035626, -1.080522, -1.275554, 1, 0.972549, 0, 1,
-1.034398, 1.490639, -1.49091, 1, 0.9764706, 0, 1,
-1.032451, -0.6804709, 0.4974906, 1, 0.9843137, 0, 1,
-1.025504, -0.423817, -2.809675, 1, 0.9882353, 0, 1,
-1.024329, 1.051227, -0.5080599, 1, 0.9960784, 0, 1,
-1.022508, 0.4152667, 0.3594849, 0.9960784, 1, 0, 1,
-1.022243, 0.3662467, -2.328474, 0.9921569, 1, 0, 1,
-1.010348, -0.5519226, -2.479127, 0.9843137, 1, 0, 1,
-1.003963, 1.043869, -1.092193, 0.9803922, 1, 0, 1,
-0.9997688, -0.2256138, -1.244625, 0.972549, 1, 0, 1,
-0.9980926, 0.59642, -1.350968, 0.9686275, 1, 0, 1,
-0.993057, 0.5729269, -0.2292665, 0.9607843, 1, 0, 1,
-0.9890175, -1.513785, -3.702362, 0.9568627, 1, 0, 1,
-0.965267, -1.177123, -2.272871, 0.9490196, 1, 0, 1,
-0.9650114, 1.004062, 0.006519739, 0.945098, 1, 0, 1,
-0.9645281, 0.2218052, -0.05303561, 0.9372549, 1, 0, 1,
-0.9615766, -0.3870205, -1.917568, 0.9333333, 1, 0, 1,
-0.9596374, 0.05888066, -1.737205, 0.9254902, 1, 0, 1,
-0.9371185, -0.7982383, -2.383991, 0.9215686, 1, 0, 1,
-0.9367183, -0.6524946, -1.295761, 0.9137255, 1, 0, 1,
-0.9351432, -0.4169486, -0.7079999, 0.9098039, 1, 0, 1,
-0.9334372, 0.5568641, 0.1168771, 0.9019608, 1, 0, 1,
-0.9327716, -0.01679858, -1.44737, 0.8941177, 1, 0, 1,
-0.9284499, 0.9755476, 0.06148124, 0.8901961, 1, 0, 1,
-0.9193452, 0.4426091, -0.5678906, 0.8823529, 1, 0, 1,
-0.9127163, 0.6602658, -2.180467, 0.8784314, 1, 0, 1,
-0.9063067, -0.2058508, -1.608058, 0.8705882, 1, 0, 1,
-0.9050769, 0.5306873, -3.006796, 0.8666667, 1, 0, 1,
-0.9043036, -1.242857, -0.7820483, 0.8588235, 1, 0, 1,
-0.9040381, 0.7157965, -0.6585735, 0.854902, 1, 0, 1,
-0.9004952, -0.9947593, -2.707675, 0.8470588, 1, 0, 1,
-0.8926107, 0.64551, -1.225118, 0.8431373, 1, 0, 1,
-0.891395, 0.396044, -2.323019, 0.8352941, 1, 0, 1,
-0.8892459, 1.942729, -0.2011944, 0.8313726, 1, 0, 1,
-0.883497, -0.5144554, -0.5246744, 0.8235294, 1, 0, 1,
-0.8677771, 1.144205, 0.2666982, 0.8196079, 1, 0, 1,
-0.8675072, -0.1868447, -1.773498, 0.8117647, 1, 0, 1,
-0.8591048, 1.191061, 1.306001, 0.8078431, 1, 0, 1,
-0.8562206, -0.6791012, -3.559798, 0.8, 1, 0, 1,
-0.8560666, -0.708164, -1.871784, 0.7921569, 1, 0, 1,
-0.8534453, 0.1580861, -1.292847, 0.7882353, 1, 0, 1,
-0.8488108, 1.349883, -1.724901, 0.7803922, 1, 0, 1,
-0.841208, -1.701581, -2.634444, 0.7764706, 1, 0, 1,
-0.838359, 1.209941, -0.3227338, 0.7686275, 1, 0, 1,
-0.83799, 0.08515016, -1.682287, 0.7647059, 1, 0, 1,
-0.8323857, 0.1912223, -1.713684, 0.7568628, 1, 0, 1,
-0.8296043, -0.5357434, -0.8165625, 0.7529412, 1, 0, 1,
-0.8226193, 1.557014, -0.08429953, 0.7450981, 1, 0, 1,
-0.8214641, 0.3109321, -1.87366, 0.7411765, 1, 0, 1,
-0.8209309, 0.6982152, -0.8985437, 0.7333333, 1, 0, 1,
-0.819407, -1.126614, -3.027361, 0.7294118, 1, 0, 1,
-0.8172516, -0.9191533, -0.8473883, 0.7215686, 1, 0, 1,
-0.8120353, 0.9635351, 0.483459, 0.7176471, 1, 0, 1,
-0.8108085, 0.5943583, -0.7670223, 0.7098039, 1, 0, 1,
-0.8097981, 0.9608909, -0.7775664, 0.7058824, 1, 0, 1,
-0.8097979, 0.9162924, -0.4302637, 0.6980392, 1, 0, 1,
-0.8043153, 1.150863, -0.03820791, 0.6901961, 1, 0, 1,
-0.7936625, -0.3511069, -3.456184, 0.6862745, 1, 0, 1,
-0.7935951, -0.4170122, -2.699946, 0.6784314, 1, 0, 1,
-0.7934883, -0.6619836, -0.8673636, 0.6745098, 1, 0, 1,
-0.7931303, 0.5213122, 0.05828731, 0.6666667, 1, 0, 1,
-0.7927787, -2.037897, -1.931221, 0.6627451, 1, 0, 1,
-0.7904103, 0.032292, -1.561628, 0.654902, 1, 0, 1,
-0.7886731, -1.674648, -3.933875, 0.6509804, 1, 0, 1,
-0.7862713, -0.8434036, -1.564836, 0.6431373, 1, 0, 1,
-0.7825488, 0.5488271, -1.032452, 0.6392157, 1, 0, 1,
-0.7801449, 0.4586867, -1.166797, 0.6313726, 1, 0, 1,
-0.7782805, 0.6234331, -0.01217176, 0.627451, 1, 0, 1,
-0.7748158, -0.04222099, -0.3860675, 0.6196079, 1, 0, 1,
-0.7723641, -0.4672094, -2.07509, 0.6156863, 1, 0, 1,
-0.7707819, -0.7623866, 0.02615102, 0.6078432, 1, 0, 1,
-0.7694627, 0.01392866, -1.152487, 0.6039216, 1, 0, 1,
-0.7684204, -1.000514, -2.762266, 0.5960785, 1, 0, 1,
-0.7681804, -2.90347, -2.938968, 0.5882353, 1, 0, 1,
-0.7599397, -0.1614965, -0.5361266, 0.5843138, 1, 0, 1,
-0.7586229, -0.3375137, -0.5716293, 0.5764706, 1, 0, 1,
-0.7582437, 0.7712448, -1.130655, 0.572549, 1, 0, 1,
-0.7578722, -0.2442597, -1.702583, 0.5647059, 1, 0, 1,
-0.751779, -0.7159815, -2.32146, 0.5607843, 1, 0, 1,
-0.7489241, 0.6991256, -1.200253, 0.5529412, 1, 0, 1,
-0.748528, 0.9838629, 0.1103763, 0.5490196, 1, 0, 1,
-0.7445253, 0.113433, -3.498689, 0.5411765, 1, 0, 1,
-0.7342224, 0.2054818, -1.710232, 0.5372549, 1, 0, 1,
-0.7319203, 1.603496, -0.1262159, 0.5294118, 1, 0, 1,
-0.7280159, 0.2408684, -0.571988, 0.5254902, 1, 0, 1,
-0.7250173, 0.3034334, -1.116279, 0.5176471, 1, 0, 1,
-0.7233355, -1.729093, -2.75926, 0.5137255, 1, 0, 1,
-0.7221909, 1.553153, -1.207918, 0.5058824, 1, 0, 1,
-0.7161577, -1.329592, -3.443949, 0.5019608, 1, 0, 1,
-0.7151216, -0.1991038, -3.512099, 0.4941176, 1, 0, 1,
-0.7149301, -0.01821358, -1.290009, 0.4862745, 1, 0, 1,
-0.7050411, 0.6164318, -1.027387, 0.4823529, 1, 0, 1,
-0.7007982, 1.719302, -1.454474, 0.4745098, 1, 0, 1,
-0.695902, -0.5254486, -1.922587, 0.4705882, 1, 0, 1,
-0.6799641, -2.180592, -2.324776, 0.4627451, 1, 0, 1,
-0.6757818, -0.9169608, -0.528914, 0.4588235, 1, 0, 1,
-0.6727883, -0.2112524, -2.703502, 0.4509804, 1, 0, 1,
-0.670535, 1.012692, -0.2639286, 0.4470588, 1, 0, 1,
-0.6650726, -0.7490055, -1.108898, 0.4392157, 1, 0, 1,
-0.6635224, 0.3811171, -1.825659, 0.4352941, 1, 0, 1,
-0.6617721, -0.08640031, -0.6984545, 0.427451, 1, 0, 1,
-0.6610792, 0.6022009, -0.2819173, 0.4235294, 1, 0, 1,
-0.6591899, -0.4310674, -2.227605, 0.4156863, 1, 0, 1,
-0.6521114, -1.416567, -3.972949, 0.4117647, 1, 0, 1,
-0.6505609, -0.1772704, -2.326386, 0.4039216, 1, 0, 1,
-0.6448797, 0.05803803, 0.5869647, 0.3960784, 1, 0, 1,
-0.6420321, 0.4779599, -0.175778, 0.3921569, 1, 0, 1,
-0.6419191, 0.2211722, -0.7616405, 0.3843137, 1, 0, 1,
-0.6402407, -1.167843, -1.405542, 0.3803922, 1, 0, 1,
-0.6377348, 0.3027894, 0.07722883, 0.372549, 1, 0, 1,
-0.6374222, -0.7609667, -3.866233, 0.3686275, 1, 0, 1,
-0.6334251, -0.4751893, -1.717043, 0.3607843, 1, 0, 1,
-0.6328276, -1.297022, -2.225214, 0.3568628, 1, 0, 1,
-0.6317772, -1.234129, -2.468375, 0.3490196, 1, 0, 1,
-0.6293237, -0.8881027, -3.734361, 0.345098, 1, 0, 1,
-0.6274974, -0.511061, -3.144738, 0.3372549, 1, 0, 1,
-0.6222869, -0.3449862, -2.587084, 0.3333333, 1, 0, 1,
-0.6141167, -0.5125067, -2.501087, 0.3254902, 1, 0, 1,
-0.6131487, 0.3162805, -0.3883336, 0.3215686, 1, 0, 1,
-0.6119791, -0.2849741, -2.858483, 0.3137255, 1, 0, 1,
-0.6117046, 0.003866137, -0.8406171, 0.3098039, 1, 0, 1,
-0.6069762, -0.09075446, -1.87393, 0.3019608, 1, 0, 1,
-0.6045032, 0.1545167, -1.697631, 0.2941177, 1, 0, 1,
-0.6015576, -0.1572411, -0.3716104, 0.2901961, 1, 0, 1,
-0.5992984, -0.05642198, -2.466367, 0.282353, 1, 0, 1,
-0.5978461, 0.5391329, 0.4996393, 0.2784314, 1, 0, 1,
-0.5959471, 0.3737939, -3.436088, 0.2705882, 1, 0, 1,
-0.593328, 0.7458655, -0.6730467, 0.2666667, 1, 0, 1,
-0.5915258, 0.5995148, -0.6158989, 0.2588235, 1, 0, 1,
-0.5880591, -1.630869, -2.476058, 0.254902, 1, 0, 1,
-0.5880395, 0.08084644, 0.5546602, 0.2470588, 1, 0, 1,
-0.5867354, -0.5702278, -4.269057, 0.2431373, 1, 0, 1,
-0.5854264, -0.604895, -4.424176, 0.2352941, 1, 0, 1,
-0.5807809, 0.7033114, -0.1989986, 0.2313726, 1, 0, 1,
-0.5794649, 1.200146, -2.577442, 0.2235294, 1, 0, 1,
-0.5663276, -0.4861954, -2.453681, 0.2196078, 1, 0, 1,
-0.5628983, 0.3897944, -2.052989, 0.2117647, 1, 0, 1,
-0.5591621, -0.3068992, -2.903173, 0.2078431, 1, 0, 1,
-0.5573739, -2.302462, -3.897905, 0.2, 1, 0, 1,
-0.5521112, -0.523984, -3.077401, 0.1921569, 1, 0, 1,
-0.5458024, -0.6860526, -2.176256, 0.1882353, 1, 0, 1,
-0.5371805, 0.5493464, -1.01591, 0.1803922, 1, 0, 1,
-0.5366503, 0.5927184, -2.464562, 0.1764706, 1, 0, 1,
-0.536603, 0.7516857, 0.2514901, 0.1686275, 1, 0, 1,
-0.5353441, -1.575871, -2.661304, 0.1647059, 1, 0, 1,
-0.5343705, -2.043969, -3.111752, 0.1568628, 1, 0, 1,
-0.5309998, 0.1511098, -0.6653039, 0.1529412, 1, 0, 1,
-0.5291476, -0.2911011, -2.377582, 0.145098, 1, 0, 1,
-0.5290697, 0.6718991, -0.1488185, 0.1411765, 1, 0, 1,
-0.5281554, 0.04836982, -0.8720219, 0.1333333, 1, 0, 1,
-0.5252116, 0.4273438, -0.6684068, 0.1294118, 1, 0, 1,
-0.5237892, -0.9434085, -2.143516, 0.1215686, 1, 0, 1,
-0.5204155, 1.430711, -0.07835542, 0.1176471, 1, 0, 1,
-0.5157676, -0.6571748, -1.48008, 0.1098039, 1, 0, 1,
-0.5154842, -0.9391115, -2.679428, 0.1058824, 1, 0, 1,
-0.5137912, -1.633275, -2.18496, 0.09803922, 1, 0, 1,
-0.5133112, -0.9464688, -1.967542, 0.09019608, 1, 0, 1,
-0.5103671, 1.124859, -0.6925952, 0.08627451, 1, 0, 1,
-0.5081472, -0.5298694, -3.098099, 0.07843138, 1, 0, 1,
-0.5070522, 0.3035817, 0.1481415, 0.07450981, 1, 0, 1,
-0.5042146, -0.9182958, -2.593892, 0.06666667, 1, 0, 1,
-0.4966885, -1.694924, -2.124609, 0.0627451, 1, 0, 1,
-0.4829841, -0.9937659, -2.343349, 0.05490196, 1, 0, 1,
-0.4828998, 0.4762563, 0.2065285, 0.05098039, 1, 0, 1,
-0.4805447, -0.1788089, -1.870206, 0.04313726, 1, 0, 1,
-0.4795247, 0.350361, -1.653785, 0.03921569, 1, 0, 1,
-0.478181, -1.009401, -1.966256, 0.03137255, 1, 0, 1,
-0.4775013, 0.8853414, -0.07692202, 0.02745098, 1, 0, 1,
-0.4755964, 0.182332, 0.2238334, 0.01960784, 1, 0, 1,
-0.4743862, -0.868344, -1.959219, 0.01568628, 1, 0, 1,
-0.4725534, 1.83944, -1.528007, 0.007843138, 1, 0, 1,
-0.4678834, 0.7418503, -0.3126663, 0.003921569, 1, 0, 1,
-0.4659634, -0.08485027, -2.147899, 0, 1, 0.003921569, 1,
-0.4649104, 1.547638, 0.07271067, 0, 1, 0.01176471, 1,
-0.462552, 0.1245686, -2.117362, 0, 1, 0.01568628, 1,
-0.4619478, -0.8454731, -2.314188, 0, 1, 0.02352941, 1,
-0.452879, 1.833634, -0.4391052, 0, 1, 0.02745098, 1,
-0.4512752, -0.1485753, -0.1963155, 0, 1, 0.03529412, 1,
-0.4497135, -0.3995909, -3.539106, 0, 1, 0.03921569, 1,
-0.443146, -1.435728, -3.005974, 0, 1, 0.04705882, 1,
-0.4401012, 0.4006151, -0.6699156, 0, 1, 0.05098039, 1,
-0.4308306, 1.55793, 1.527752, 0, 1, 0.05882353, 1,
-0.424114, -0.6963359, -0.5899258, 0, 1, 0.0627451, 1,
-0.4195182, 0.3397239, -2.063512, 0, 1, 0.07058824, 1,
-0.4165093, 1.409951, 0.4592125, 0, 1, 0.07450981, 1,
-0.4108172, 0.9468329, -1.157424, 0, 1, 0.08235294, 1,
-0.4096346, 1.149097, 0.4348452, 0, 1, 0.08627451, 1,
-0.4086526, -1.295242, -1.968437, 0, 1, 0.09411765, 1,
-0.407845, 0.3353219, -1.177343, 0, 1, 0.1019608, 1,
-0.4067355, 0.2285829, -0.4485453, 0, 1, 0.1058824, 1,
-0.4047871, 1.029661, -0.4593537, 0, 1, 0.1137255, 1,
-0.4041671, 1.319197, -1.564873, 0, 1, 0.1176471, 1,
-0.4018075, -1.553749, -3.74032, 0, 1, 0.1254902, 1,
-0.4005117, -2.102981, -3.30792, 0, 1, 0.1294118, 1,
-0.3984607, -0.1955416, -2.970225, 0, 1, 0.1372549, 1,
-0.3980624, 0.01675359, -2.76889, 0, 1, 0.1411765, 1,
-0.3968347, -0.6788112, -2.733093, 0, 1, 0.1490196, 1,
-0.3927163, 0.2645971, -0.5249594, 0, 1, 0.1529412, 1,
-0.3810968, 0.5752197, -0.2525146, 0, 1, 0.1607843, 1,
-0.3736717, 0.1975231, -0.5075961, 0, 1, 0.1647059, 1,
-0.3734948, -1.973259, -3.144386, 0, 1, 0.172549, 1,
-0.3734681, 0.3439364, -1.885248, 0, 1, 0.1764706, 1,
-0.3721843, 0.5031084, -0.51094, 0, 1, 0.1843137, 1,
-0.3690647, -0.7469987, -0.9355748, 0, 1, 0.1882353, 1,
-0.3687932, 1.220971, 0.1522682, 0, 1, 0.1960784, 1,
-0.3676032, -0.102239, -3.377919, 0, 1, 0.2039216, 1,
-0.366869, 0.7795981, -0.1442241, 0, 1, 0.2078431, 1,
-0.3657392, 0.8755263, -1.446812, 0, 1, 0.2156863, 1,
-0.3631371, 0.303975, -1.083095, 0, 1, 0.2196078, 1,
-0.3579517, 0.732805, -0.8832765, 0, 1, 0.227451, 1,
-0.3572233, -1.876746, -5.330323, 0, 1, 0.2313726, 1,
-0.3520313, -1.449055, -3.964049, 0, 1, 0.2392157, 1,
-0.3502659, 0.3075496, -1.979352, 0, 1, 0.2431373, 1,
-0.3501925, 0.5731359, 1.020403, 0, 1, 0.2509804, 1,
-0.3446921, -1.704637, -2.729503, 0, 1, 0.254902, 1,
-0.3436305, -0.1426009, 0.371105, 0, 1, 0.2627451, 1,
-0.3432138, -0.156269, -0.6861908, 0, 1, 0.2666667, 1,
-0.3428307, -0.5579128, -3.637037, 0, 1, 0.2745098, 1,
-0.3362864, 0.3851317, -1.26279, 0, 1, 0.2784314, 1,
-0.3307697, 0.3881236, -2.224472, 0, 1, 0.2862745, 1,
-0.3286911, -1.762568, -2.787919, 0, 1, 0.2901961, 1,
-0.3278127, 1.618601, 0.474471, 0, 1, 0.2980392, 1,
-0.3263535, -0.6366192, -4.379766, 0, 1, 0.3058824, 1,
-0.3258568, 0.03553477, -0.3163839, 0, 1, 0.3098039, 1,
-0.3254682, -1.540066, -2.665302, 0, 1, 0.3176471, 1,
-0.3237051, -1.212983, -1.407402, 0, 1, 0.3215686, 1,
-0.3212515, -0.2995397, -3.41848, 0, 1, 0.3294118, 1,
-0.3184523, 2.265589, -0.6448326, 0, 1, 0.3333333, 1,
-0.3140037, 0.0292719, 0.3844166, 0, 1, 0.3411765, 1,
-0.3069979, 0.7514791, -2.584647, 0, 1, 0.345098, 1,
-0.305093, -0.6791453, -1.903215, 0, 1, 0.3529412, 1,
-0.3049648, 0.8764622, 0.9759054, 0, 1, 0.3568628, 1,
-0.3017302, 1.449368, -0.7601086, 0, 1, 0.3647059, 1,
-0.3011175, 0.7216912, 1.51396, 0, 1, 0.3686275, 1,
-0.2998208, 3.021726, 1.058462, 0, 1, 0.3764706, 1,
-0.2968438, -0.6631594, -2.582355, 0, 1, 0.3803922, 1,
-0.2955579, -0.2791188, -2.743834, 0, 1, 0.3882353, 1,
-0.2937657, 0.007459502, -1.890307, 0, 1, 0.3921569, 1,
-0.2899761, -0.4994313, -2.182828, 0, 1, 0.4, 1,
-0.2887346, -0.3785422, -3.235089, 0, 1, 0.4078431, 1,
-0.2868679, -0.5886853, -2.080097, 0, 1, 0.4117647, 1,
-0.2839223, 0.302918, -1.174342, 0, 1, 0.4196078, 1,
-0.2760767, 0.4905363, -0.9458393, 0, 1, 0.4235294, 1,
-0.2737003, -0.4523571, -3.347438, 0, 1, 0.4313726, 1,
-0.2722292, -1.660482, -2.508704, 0, 1, 0.4352941, 1,
-0.2717456, -0.1376947, -2.945509, 0, 1, 0.4431373, 1,
-0.2617885, 0.6531439, -1.193737, 0, 1, 0.4470588, 1,
-0.2606766, -0.9732778, -3.398395, 0, 1, 0.454902, 1,
-0.2588747, 0.128145, -2.176597, 0, 1, 0.4588235, 1,
-0.2556988, 0.7277784, 1.019887, 0, 1, 0.4666667, 1,
-0.2555432, -0.2934589, -1.926648, 0, 1, 0.4705882, 1,
-0.25453, 0.3316017, -0.6309495, 0, 1, 0.4784314, 1,
-0.2535369, -0.1416666, -0.4781238, 0, 1, 0.4823529, 1,
-0.2523804, -0.1533557, -2.09898, 0, 1, 0.4901961, 1,
-0.2513529, -0.3421009, -2.021798, 0, 1, 0.4941176, 1,
-0.2502099, 1.653291, -1.240925, 0, 1, 0.5019608, 1,
-0.2461978, -0.09940271, -2.97995, 0, 1, 0.509804, 1,
-0.2379401, 0.7574519, -1.056615, 0, 1, 0.5137255, 1,
-0.2374545, -0.6019741, -2.058758, 0, 1, 0.5215687, 1,
-0.2357675, -2.402188, -2.059605, 0, 1, 0.5254902, 1,
-0.23155, -0.8912694, -4.628478, 0, 1, 0.5333334, 1,
-0.2299607, 0.08588488, 0.09538102, 0, 1, 0.5372549, 1,
-0.2255759, -0.02445725, -1.331229, 0, 1, 0.5450981, 1,
-0.2245963, 1.348379, 1.186321, 0, 1, 0.5490196, 1,
-0.2234721, 1.715999, -0.1119761, 0, 1, 0.5568628, 1,
-0.2229804, 0.2657215, -0.3431682, 0, 1, 0.5607843, 1,
-0.2142079, -0.069942, -0.2440913, 0, 1, 0.5686275, 1,
-0.2114739, 1.127031, 0.1154763, 0, 1, 0.572549, 1,
-0.2058024, -2.185319, -2.846125, 0, 1, 0.5803922, 1,
-0.1998001, -0.1678147, -4.558858, 0, 1, 0.5843138, 1,
-0.1987496, -0.6614175, -2.759673, 0, 1, 0.5921569, 1,
-0.1944649, -0.6567976, 0.3070787, 0, 1, 0.5960785, 1,
-0.1913332, -1.239004, -2.199866, 0, 1, 0.6039216, 1,
-0.1893964, 0.7173254, 1.104203, 0, 1, 0.6117647, 1,
-0.1836563, 0.3780848, -0.8734475, 0, 1, 0.6156863, 1,
-0.180851, -0.04994179, -2.709444, 0, 1, 0.6235294, 1,
-0.178465, -1.008289, -3.588396, 0, 1, 0.627451, 1,
-0.1701208, -0.007634291, -2.341558, 0, 1, 0.6352941, 1,
-0.1697695, -0.9606441, -4.262846, 0, 1, 0.6392157, 1,
-0.1691033, -0.5239812, -3.622766, 0, 1, 0.6470588, 1,
-0.1656016, -0.2216591, -3.546388, 0, 1, 0.6509804, 1,
-0.1649966, 0.09721038, -1.726162, 0, 1, 0.6588235, 1,
-0.1598498, -0.9746522, -1.725401, 0, 1, 0.6627451, 1,
-0.1533644, 0.3526759, 0.5150488, 0, 1, 0.6705883, 1,
-0.1507141, -0.8182628, -3.478239, 0, 1, 0.6745098, 1,
-0.1497159, 1.515145, -0.6071582, 0, 1, 0.682353, 1,
-0.1329243, -1.675485, -3.278602, 0, 1, 0.6862745, 1,
-0.1294264, 0.2246488, -1.546364, 0, 1, 0.6941177, 1,
-0.1282656, 0.7347553, 0.5696734, 0, 1, 0.7019608, 1,
-0.1196753, 0.2553173, 0.03007399, 0, 1, 0.7058824, 1,
-0.1187677, -1.558397, -2.08169, 0, 1, 0.7137255, 1,
-0.1145203, -2.181112, -2.759736, 0, 1, 0.7176471, 1,
-0.1135903, 1.051918, -0.2611411, 0, 1, 0.7254902, 1,
-0.1050589, 0.3563631, 0.6853169, 0, 1, 0.7294118, 1,
-0.10341, -1.052477, -1.427469, 0, 1, 0.7372549, 1,
-0.1024878, -0.7461789, -3.240592, 0, 1, 0.7411765, 1,
-0.1022766, 0.9792567, -0.7908116, 0, 1, 0.7490196, 1,
-0.1000704, 0.1120264, -1.194178, 0, 1, 0.7529412, 1,
-0.09982405, 1.417119, -0.07755951, 0, 1, 0.7607843, 1,
-0.09655511, -0.4437675, -2.117322, 0, 1, 0.7647059, 1,
-0.08958599, -0.9820899, -1.587644, 0, 1, 0.772549, 1,
-0.08618541, -0.5630391, -0.8820212, 0, 1, 0.7764706, 1,
-0.08584543, 0.5282976, 0.3079738, 0, 1, 0.7843137, 1,
-0.08548613, 0.2083744, -0.8927639, 0, 1, 0.7882353, 1,
-0.08020642, -0.2048519, -2.221361, 0, 1, 0.7960784, 1,
-0.07964583, -0.4568616, -2.029788, 0, 1, 0.8039216, 1,
-0.07463981, 0.9608105, 1.70035, 0, 1, 0.8078431, 1,
-0.07194538, -2.117291, -1.910762, 0, 1, 0.8156863, 1,
-0.0677307, -0.06835824, -1.357215, 0, 1, 0.8196079, 1,
-0.06414279, -0.1737118, -1.639206, 0, 1, 0.827451, 1,
-0.05484419, 0.635189, 0.3394937, 0, 1, 0.8313726, 1,
-0.05444138, -2.003218, -3.596549, 0, 1, 0.8392157, 1,
-0.05114737, -0.2375108, -3.595005, 0, 1, 0.8431373, 1,
-0.04982679, 0.6081206, 0.6759591, 0, 1, 0.8509804, 1,
-0.04832539, -0.3500522, -2.807604, 0, 1, 0.854902, 1,
-0.04782433, 0.3156888, -1.09385, 0, 1, 0.8627451, 1,
-0.04647306, 1.47286, 0.4517863, 0, 1, 0.8666667, 1,
-0.04564661, 1.208261, 0.0003872881, 0, 1, 0.8745098, 1,
-0.03711708, -0.8013988, -4.198701, 0, 1, 0.8784314, 1,
-0.03678084, -0.5960852, -1.431264, 0, 1, 0.8862745, 1,
-0.03676614, 0.01106064, -0.2020685, 0, 1, 0.8901961, 1,
-0.03406893, -0.87567, -3.577209, 0, 1, 0.8980392, 1,
-0.03362196, -0.2738218, -4.49048, 0, 1, 0.9058824, 1,
-0.03109111, -0.4049364, -4.4719, 0, 1, 0.9098039, 1,
-0.03084489, 1.490466, -0.5288436, 0, 1, 0.9176471, 1,
-0.02796663, -1.868605, -1.703972, 0, 1, 0.9215686, 1,
-0.01728082, -1.494623, -2.244678, 0, 1, 0.9294118, 1,
-0.0169534, -0.4199549, -3.018086, 0, 1, 0.9333333, 1,
-0.01689045, 1.834023, -0.2696763, 0, 1, 0.9411765, 1,
-0.01452698, 0.3618115, -1.373838, 0, 1, 0.945098, 1,
-0.009744531, -0.7334208, -3.033942, 0, 1, 0.9529412, 1,
-0.006426719, -0.8085617, -5.015907, 0, 1, 0.9568627, 1,
-0.005650223, -0.1632208, -3.066076, 0, 1, 0.9647059, 1,
-0.004206506, 0.203767, 1.26482, 0, 1, 0.9686275, 1,
-0.003219361, 0.8306425, -0.5566229, 0, 1, 0.9764706, 1,
0.0005075358, -1.177661, 3.204821, 0, 1, 0.9803922, 1,
0.0098891, -0.0005027843, 1.287049, 0, 1, 0.9882353, 1,
0.01043435, 0.1477709, 0.08827345, 0, 1, 0.9921569, 1,
0.01123428, 0.3526739, 1.240876, 0, 1, 1, 1,
0.01856681, 1.177316, 0.6403141, 0, 0.9921569, 1, 1,
0.01906545, 0.9703737, 0.329823, 0, 0.9882353, 1, 1,
0.01935001, -0.1766278, 2.837817, 0, 0.9803922, 1, 1,
0.02155703, 0.5455008, 0.691296, 0, 0.9764706, 1, 1,
0.02250065, 0.3025455, 0.8262186, 0, 0.9686275, 1, 1,
0.02314009, -1.171126, 4.174857, 0, 0.9647059, 1, 1,
0.02577573, 0.4046775, 0.9267247, 0, 0.9568627, 1, 1,
0.03045281, 1.446749, -0.8332701, 0, 0.9529412, 1, 1,
0.03153362, 1.685388, -0.1264567, 0, 0.945098, 1, 1,
0.03351516, 0.1643106, 0.5355985, 0, 0.9411765, 1, 1,
0.03478701, 0.1586297, 2.528082, 0, 0.9333333, 1, 1,
0.03596797, -1.859702, 3.336383, 0, 0.9294118, 1, 1,
0.03725211, 0.3259998, 1.926834, 0, 0.9215686, 1, 1,
0.03833095, 0.6197048, 0.3867349, 0, 0.9176471, 1, 1,
0.04139805, -0.1312562, 3.418154, 0, 0.9098039, 1, 1,
0.04287842, -0.7973573, 2.061334, 0, 0.9058824, 1, 1,
0.04900486, 1.183619, 0.6603656, 0, 0.8980392, 1, 1,
0.04953092, 1.037075, -1.415487, 0, 0.8901961, 1, 1,
0.05166412, 0.401192, 0.3033423, 0, 0.8862745, 1, 1,
0.06292001, -0.0684853, 1.277444, 0, 0.8784314, 1, 1,
0.06471925, -0.5607375, 3.901473, 0, 0.8745098, 1, 1,
0.07070848, -0.5523196, 4.521345, 0, 0.8666667, 1, 1,
0.07408883, 1.611048, 0.41659, 0, 0.8627451, 1, 1,
0.07957963, -0.438241, 4.825041, 0, 0.854902, 1, 1,
0.080011, -0.435785, 2.881505, 0, 0.8509804, 1, 1,
0.08080955, 0.3998201, 0.5488237, 0, 0.8431373, 1, 1,
0.08184557, 0.8508668, 0.1938848, 0, 0.8392157, 1, 1,
0.0830208, 0.1522897, 0.260821, 0, 0.8313726, 1, 1,
0.08304432, 0.7814635, -0.1969069, 0, 0.827451, 1, 1,
0.09507416, 3.400248e-05, -0.5325527, 0, 0.8196079, 1, 1,
0.1004061, 0.1300115, 0.7516356, 0, 0.8156863, 1, 1,
0.1014534, 0.655741, 2.404814, 0, 0.8078431, 1, 1,
0.1083548, 0.09579296, 0.7890145, 0, 0.8039216, 1, 1,
0.1106274, -1.095904, 0.9183538, 0, 0.7960784, 1, 1,
0.1122982, 0.5515321, 0.3470949, 0, 0.7882353, 1, 1,
0.1133342, 0.2630387, 1.407984, 0, 0.7843137, 1, 1,
0.1142189, -0.3438956, 3.109742, 0, 0.7764706, 1, 1,
0.1150094, -1.392046, 2.695798, 0, 0.772549, 1, 1,
0.1173413, -0.428057, 3.728698, 0, 0.7647059, 1, 1,
0.1182937, -0.6237722, 3.780993, 0, 0.7607843, 1, 1,
0.1187783, -0.02707504, 2.593658, 0, 0.7529412, 1, 1,
0.1188583, 1.788571, -0.6203347, 0, 0.7490196, 1, 1,
0.122529, 0.01027918, -0.1604975, 0, 0.7411765, 1, 1,
0.12369, -0.9267728, 2.906292, 0, 0.7372549, 1, 1,
0.1263801, 0.1757088, 0.2890605, 0, 0.7294118, 1, 1,
0.1264434, -0.9179537, 2.969387, 0, 0.7254902, 1, 1,
0.1305153, 1.699705, 2.219503, 0, 0.7176471, 1, 1,
0.1342106, 0.1400974, 1.083124, 0, 0.7137255, 1, 1,
0.134917, 0.01252776, 0.4174263, 0, 0.7058824, 1, 1,
0.13576, -1.407519, 4.457789, 0, 0.6980392, 1, 1,
0.139227, 0.5662886, -0.9154359, 0, 0.6941177, 1, 1,
0.1453726, 0.6503394, 0.6810895, 0, 0.6862745, 1, 1,
0.1458729, -0.8093299, 3.646139, 0, 0.682353, 1, 1,
0.1469992, -0.2938563, 2.037452, 0, 0.6745098, 1, 1,
0.1508256, 1.3146, 0.9823233, 0, 0.6705883, 1, 1,
0.1516679, -1.798647, 3.648775, 0, 0.6627451, 1, 1,
0.153922, -0.7479231, 4.118429, 0, 0.6588235, 1, 1,
0.1550379, -1.915883, 3.421639, 0, 0.6509804, 1, 1,
0.1558997, -0.6584438, 3.15491, 0, 0.6470588, 1, 1,
0.1604291, -0.08763383, 2.08712, 0, 0.6392157, 1, 1,
0.1626399, -0.5371241, 2.472806, 0, 0.6352941, 1, 1,
0.1643009, 0.2402909, 0.1935809, 0, 0.627451, 1, 1,
0.168013, 1.06318, 1.300996, 0, 0.6235294, 1, 1,
0.1687045, -2.239844, 3.681487, 0, 0.6156863, 1, 1,
0.1706594, -0.5917574, 1.621969, 0, 0.6117647, 1, 1,
0.170948, -1.155149, 3.644895, 0, 0.6039216, 1, 1,
0.1721105, -0.6085154, 4.102625, 0, 0.5960785, 1, 1,
0.1748113, -0.5054108, 1.983354, 0, 0.5921569, 1, 1,
0.1754633, 0.6198763, 0.8137421, 0, 0.5843138, 1, 1,
0.1764417, 1.823671, -0.2691678, 0, 0.5803922, 1, 1,
0.1769792, -0.444419, 3.367559, 0, 0.572549, 1, 1,
0.1803033, 0.729512, 0.1499741, 0, 0.5686275, 1, 1,
0.1838182, -1.003536, 3.906063, 0, 0.5607843, 1, 1,
0.1847451, -0.6792769, 2.424908, 0, 0.5568628, 1, 1,
0.1850513, 0.8295162, 1.544364, 0, 0.5490196, 1, 1,
0.1853021, 0.07351921, 0.5794667, 0, 0.5450981, 1, 1,
0.1859069, -0.2262861, 3.235002, 0, 0.5372549, 1, 1,
0.1865951, 1.236469, -0.6931478, 0, 0.5333334, 1, 1,
0.1889814, -0.4691028, 0.731178, 0, 0.5254902, 1, 1,
0.1953638, -1.855705, 1.644287, 0, 0.5215687, 1, 1,
0.1966239, -1.263922, 1.981157, 0, 0.5137255, 1, 1,
0.2041245, -0.05847846, 1.667779, 0, 0.509804, 1, 1,
0.2047037, 0.336135, 0.2307659, 0, 0.5019608, 1, 1,
0.2111491, 1.035821, -0.3258473, 0, 0.4941176, 1, 1,
0.211668, 2.189534, 1.001042, 0, 0.4901961, 1, 1,
0.2235794, -1.189596, 3.780549, 0, 0.4823529, 1, 1,
0.2273226, 0.7694094, 0.9227824, 0, 0.4784314, 1, 1,
0.2300373, 0.1034934, 0.739834, 0, 0.4705882, 1, 1,
0.2311385, -0.8173576, 1.914585, 0, 0.4666667, 1, 1,
0.2314588, -0.8812886, 3.216697, 0, 0.4588235, 1, 1,
0.2315445, 0.7531133, 0.4091508, 0, 0.454902, 1, 1,
0.2337245, 0.04844736, 1.531495, 0, 0.4470588, 1, 1,
0.2382088, -0.5658755, 2.614182, 0, 0.4431373, 1, 1,
0.240702, -0.1862047, 1.844466, 0, 0.4352941, 1, 1,
0.2416237, -0.6069258, 3.297884, 0, 0.4313726, 1, 1,
0.2425121, -0.4208656, 2.538151, 0, 0.4235294, 1, 1,
0.2473896, -0.1066927, 0.773262, 0, 0.4196078, 1, 1,
0.2515414, -0.5193148, 0.9730123, 0, 0.4117647, 1, 1,
0.2542964, -0.385311, 2.189078, 0, 0.4078431, 1, 1,
0.2552489, -0.4395896, 1.900223, 0, 0.4, 1, 1,
0.2567878, -0.2729376, 0.9157034, 0, 0.3921569, 1, 1,
0.2588898, 0.81923, 0.1663934, 0, 0.3882353, 1, 1,
0.2603467, 0.3650197, 0.5362838, 0, 0.3803922, 1, 1,
0.2605605, -0.5048727, 2.420419, 0, 0.3764706, 1, 1,
0.2643794, -1.853689, 3.720561, 0, 0.3686275, 1, 1,
0.2722219, 0.197565, 1.204138, 0, 0.3647059, 1, 1,
0.2737737, 0.7174609, -0.03682665, 0, 0.3568628, 1, 1,
0.2786884, 0.007242155, 0.5097198, 0, 0.3529412, 1, 1,
0.2862515, 0.5079759, 0.5934619, 0, 0.345098, 1, 1,
0.2881144, -1.171246, 3.720305, 0, 0.3411765, 1, 1,
0.2881923, -0.8991077, 3.032798, 0, 0.3333333, 1, 1,
0.2901365, -1.078491, 2.29629, 0, 0.3294118, 1, 1,
0.2927015, 1.725099, -0.04820678, 0, 0.3215686, 1, 1,
0.2943965, 0.8385025, 1.006874, 0, 0.3176471, 1, 1,
0.2958294, 1.096802, 0.3534142, 0, 0.3098039, 1, 1,
0.2962578, -0.2093673, 1.465468, 0, 0.3058824, 1, 1,
0.2967944, -0.06565173, 3.412513, 0, 0.2980392, 1, 1,
0.2989659, 0.7891765, 0.6299092, 0, 0.2901961, 1, 1,
0.3005297, 1.074321, 1.852839, 0, 0.2862745, 1, 1,
0.309072, 1.10955, 1.426864, 0, 0.2784314, 1, 1,
0.3101754, 1.307201, -2.508337, 0, 0.2745098, 1, 1,
0.3144799, 0.4849436, 0.97206, 0, 0.2666667, 1, 1,
0.3166262, -0.03631037, 1.619072, 0, 0.2627451, 1, 1,
0.3198009, 0.6891583, -0.804414, 0, 0.254902, 1, 1,
0.3203731, -0.2473733, 2.470005, 0, 0.2509804, 1, 1,
0.3218403, -1.310121, 3.493256, 0, 0.2431373, 1, 1,
0.3301694, 0.4978215, 0.4589287, 0, 0.2392157, 1, 1,
0.335041, -0.006340727, 2.941586, 0, 0.2313726, 1, 1,
0.3353395, 1.011551, -0.4320732, 0, 0.227451, 1, 1,
0.3371608, 0.2918113, 0.7905301, 0, 0.2196078, 1, 1,
0.3438688, -0.9281414, 3.461127, 0, 0.2156863, 1, 1,
0.3449003, 0.7229515, 0.4895351, 0, 0.2078431, 1, 1,
0.3475021, 0.2381578, 2.79466, 0, 0.2039216, 1, 1,
0.3480167, 0.7899534, 1.372705, 0, 0.1960784, 1, 1,
0.3512666, -0.2396734, 2.246429, 0, 0.1882353, 1, 1,
0.3519112, 0.3608468, -0.575828, 0, 0.1843137, 1, 1,
0.3521138, 1.588501, 0.1071103, 0, 0.1764706, 1, 1,
0.3533928, -0.7264789, 2.558222, 0, 0.172549, 1, 1,
0.3540412, -1.417582, 1.392571, 0, 0.1647059, 1, 1,
0.3606839, -1.325407, 4.920413, 0, 0.1607843, 1, 1,
0.3615626, -0.02836388, 2.467611, 0, 0.1529412, 1, 1,
0.362052, 0.8526204, 1.541646, 0, 0.1490196, 1, 1,
0.3633217, -1.265744, 4.1677, 0, 0.1411765, 1, 1,
0.3636206, 0.8205683, -1.496697, 0, 0.1372549, 1, 1,
0.3701302, 1.223047, -0.2830837, 0, 0.1294118, 1, 1,
0.3715235, -0.5923496, 3.206552, 0, 0.1254902, 1, 1,
0.3753247, 1.504072, -0.8237278, 0, 0.1176471, 1, 1,
0.3812396, -0.01032872, 1.096822, 0, 0.1137255, 1, 1,
0.3842043, 0.2691681, 1.899569, 0, 0.1058824, 1, 1,
0.3936152, -0.2006335, 2.053344, 0, 0.09803922, 1, 1,
0.3960613, 0.8294338, 0.8419848, 0, 0.09411765, 1, 1,
0.3999274, 1.071255, 0.5123167, 0, 0.08627451, 1, 1,
0.4045626, 0.07119265, 1.881786, 0, 0.08235294, 1, 1,
0.4082305, -1.277887, 3.48592, 0, 0.07450981, 1, 1,
0.4096876, -0.9076561, 5.335875, 0, 0.07058824, 1, 1,
0.4098435, 1.550884, 0.6968817, 0, 0.0627451, 1, 1,
0.4116523, 0.5182132, 0.4664227, 0, 0.05882353, 1, 1,
0.4147291, -1.293092, 2.998923, 0, 0.05098039, 1, 1,
0.4197071, -0.7656682, 2.653976, 0, 0.04705882, 1, 1,
0.4201712, -0.8982139, 2.768727, 0, 0.03921569, 1, 1,
0.4232467, -0.4631551, 1.537702, 0, 0.03529412, 1, 1,
0.4254505, 0.4393328, 1.460931, 0, 0.02745098, 1, 1,
0.4275938, -0.4893328, 2.515467, 0, 0.02352941, 1, 1,
0.428941, 0.9166886, 0.5419421, 0, 0.01568628, 1, 1,
0.4330544, -0.8193893, 2.19499, 0, 0.01176471, 1, 1,
0.437679, -0.4697735, 2.48559, 0, 0.003921569, 1, 1,
0.4393517, 0.5166693, 1.661461, 0.003921569, 0, 1, 1,
0.4445027, 0.1030246, 1.177547, 0.007843138, 0, 1, 1,
0.4449406, 0.210525, 0.2103713, 0.01568628, 0, 1, 1,
0.4479968, -0.1565237, 3.664057, 0.01960784, 0, 1, 1,
0.4490293, 0.3514343, 1.984467, 0.02745098, 0, 1, 1,
0.4518014, -0.7178586, 2.819357, 0.03137255, 0, 1, 1,
0.4530906, 0.4999792, 1.813437, 0.03921569, 0, 1, 1,
0.4571719, 0.720543, -1.469781, 0.04313726, 0, 1, 1,
0.4573273, 1.212079, 0.409939, 0.05098039, 0, 1, 1,
0.4589471, -0.190064, 1.418318, 0.05490196, 0, 1, 1,
0.4609558, -0.3971447, 0.7302068, 0.0627451, 0, 1, 1,
0.462785, -0.1757013, 1.344176, 0.06666667, 0, 1, 1,
0.4628994, -0.1776351, 2.642951, 0.07450981, 0, 1, 1,
0.4638768, 0.05850743, 1.555909, 0.07843138, 0, 1, 1,
0.4651192, -0.4159716, 2.798048, 0.08627451, 0, 1, 1,
0.4656581, -1.093996, 3.41946, 0.09019608, 0, 1, 1,
0.4695027, -0.5728608, 3.902915, 0.09803922, 0, 1, 1,
0.4726066, 2.121008, 2.434219, 0.1058824, 0, 1, 1,
0.4742224, 0.1039177, 2.494975, 0.1098039, 0, 1, 1,
0.4825563, -2.013767, 1.305113, 0.1176471, 0, 1, 1,
0.4928302, 3.394062, -0.4553702, 0.1215686, 0, 1, 1,
0.4942735, 0.5156927, 2.540711, 0.1294118, 0, 1, 1,
0.4947047, -1.810933, 1.3958, 0.1333333, 0, 1, 1,
0.4948677, -0.3831897, 0.9865739, 0.1411765, 0, 1, 1,
0.4997673, -2.353156, 2.141515, 0.145098, 0, 1, 1,
0.5051073, 2.041286, 0.8738868, 0.1529412, 0, 1, 1,
0.5136477, 1.557306, 0.5090985, 0.1568628, 0, 1, 1,
0.5145466, -0.288142, 5.04489, 0.1647059, 0, 1, 1,
0.519262, 0.5908222, -0.0834659, 0.1686275, 0, 1, 1,
0.5196692, 0.4942911, 0.5041818, 0.1764706, 0, 1, 1,
0.5207829, 0.2325589, 1.721239, 0.1803922, 0, 1, 1,
0.521584, -0.1617661, 2.779179, 0.1882353, 0, 1, 1,
0.5222753, -1.270164, 1.738794, 0.1921569, 0, 1, 1,
0.5229941, -0.004204125, 1.559772, 0.2, 0, 1, 1,
0.5238675, 1.43699, 2.059674, 0.2078431, 0, 1, 1,
0.5295174, -0.09959297, 1.879474, 0.2117647, 0, 1, 1,
0.5326948, -0.2602733, 1.224013, 0.2196078, 0, 1, 1,
0.532735, -0.8076399, 2.787208, 0.2235294, 0, 1, 1,
0.5519087, 0.3818619, 1.566697, 0.2313726, 0, 1, 1,
0.5521423, -1.856389, 1.704637, 0.2352941, 0, 1, 1,
0.5521597, 0.7236195, 1.512073, 0.2431373, 0, 1, 1,
0.5555217, 0.9544324, 0.9056334, 0.2470588, 0, 1, 1,
0.5604655, -0.8834188, 2.757495, 0.254902, 0, 1, 1,
0.5628838, -0.2520022, 3.716184, 0.2588235, 0, 1, 1,
0.5629645, -0.5594724, 1.731657, 0.2666667, 0, 1, 1,
0.5653568, 0.9103462, 1.683961, 0.2705882, 0, 1, 1,
0.56541, 0.4758314, -0.3316453, 0.2784314, 0, 1, 1,
0.5672398, -0.3455512, 0.204384, 0.282353, 0, 1, 1,
0.5755706, -1.737866, 4.359498, 0.2901961, 0, 1, 1,
0.5818815, -0.07723597, 1.917109, 0.2941177, 0, 1, 1,
0.5828025, -1.002351, 1.598572, 0.3019608, 0, 1, 1,
0.587818, 0.3531883, 0.691522, 0.3098039, 0, 1, 1,
0.5883209, -0.3853839, 2.001074, 0.3137255, 0, 1, 1,
0.5887403, -0.4321487, 1.256617, 0.3215686, 0, 1, 1,
0.5889125, -0.08144037, 2.308295, 0.3254902, 0, 1, 1,
0.5892026, 0.7390375, 0.6102414, 0.3333333, 0, 1, 1,
0.5909608, -0.6756127, 1.819816, 0.3372549, 0, 1, 1,
0.5935078, 0.1222835, -0.01317038, 0.345098, 0, 1, 1,
0.594054, -0.8743549, 3.463264, 0.3490196, 0, 1, 1,
0.5976374, 0.3284706, -0.3342187, 0.3568628, 0, 1, 1,
0.598856, -0.09979781, 3.444556, 0.3607843, 0, 1, 1,
0.6052567, 1.261393, -1.085953, 0.3686275, 0, 1, 1,
0.6072824, 1.224611, 0.08976737, 0.372549, 0, 1, 1,
0.6090565, -0.7840679, 2.592549, 0.3803922, 0, 1, 1,
0.6103345, 0.1164763, 2.28969, 0.3843137, 0, 1, 1,
0.6122608, 0.3115172, 1.44018, 0.3921569, 0, 1, 1,
0.620452, 0.2705137, 1.763504, 0.3960784, 0, 1, 1,
0.6213151, 0.03864241, 0.7359532, 0.4039216, 0, 1, 1,
0.6272478, 2.317608, -1.227754, 0.4117647, 0, 1, 1,
0.6279707, -1.374451, 2.035228, 0.4156863, 0, 1, 1,
0.6341158, 0.961992, -0.08387842, 0.4235294, 0, 1, 1,
0.6387901, 0.5933563, 2.456064, 0.427451, 0, 1, 1,
0.6413792, 1.087203, 1.189936, 0.4352941, 0, 1, 1,
0.643742, -0.3509712, 2.089634, 0.4392157, 0, 1, 1,
0.6512731, -1.094211, 4.635628, 0.4470588, 0, 1, 1,
0.6526822, -1.113865, 2.107782, 0.4509804, 0, 1, 1,
0.6557736, -1.277166, 4.00985, 0.4588235, 0, 1, 1,
0.6585494, -0.6060275, 2.559418, 0.4627451, 0, 1, 1,
0.6593713, 1.102987, 0.141726, 0.4705882, 0, 1, 1,
0.6606027, -0.8715715, 2.953221, 0.4745098, 0, 1, 1,
0.6705213, -1.174792, 2.23645, 0.4823529, 0, 1, 1,
0.673374, -1.129846, 2.998113, 0.4862745, 0, 1, 1,
0.6738918, -0.7074014, 3.668198, 0.4941176, 0, 1, 1,
0.6755259, -0.294987, 1.745908, 0.5019608, 0, 1, 1,
0.6765288, -0.8506657, 1.011687, 0.5058824, 0, 1, 1,
0.6765931, -1.143896, 2.356291, 0.5137255, 0, 1, 1,
0.6799706, -0.07694385, 1.479731, 0.5176471, 0, 1, 1,
0.681083, 0.7950127, -1.248921, 0.5254902, 0, 1, 1,
0.6871147, -0.7318563, 2.523661, 0.5294118, 0, 1, 1,
0.687452, -0.3715202, 1.317023, 0.5372549, 0, 1, 1,
0.690699, -0.2955756, 1.5826, 0.5411765, 0, 1, 1,
0.6921782, -0.6483821, 2.849738, 0.5490196, 0, 1, 1,
0.6932558, -1.413694, 3.636359, 0.5529412, 0, 1, 1,
0.6945299, -1.002746, 2.911559, 0.5607843, 0, 1, 1,
0.7005712, -1.019107, 1.238844, 0.5647059, 0, 1, 1,
0.7056232, 0.7149268, 0.1609251, 0.572549, 0, 1, 1,
0.7070068, -0.9736617, 4.921598, 0.5764706, 0, 1, 1,
0.7120413, -0.8552254, 3.559361, 0.5843138, 0, 1, 1,
0.7156184, 0.2979957, 1.212468, 0.5882353, 0, 1, 1,
0.7248366, -0.9730672, 2.806497, 0.5960785, 0, 1, 1,
0.7253662, -1.377011, 3.045228, 0.6039216, 0, 1, 1,
0.7271063, -0.952089, 4.701075, 0.6078432, 0, 1, 1,
0.7291208, -0.1945176, 2.165177, 0.6156863, 0, 1, 1,
0.7383256, 0.7844594, -0.1675092, 0.6196079, 0, 1, 1,
0.741165, -0.01002945, 0.9121963, 0.627451, 0, 1, 1,
0.7415588, 0.4278448, -0.3441663, 0.6313726, 0, 1, 1,
0.7435101, 0.3276984, 0.9486939, 0.6392157, 0, 1, 1,
0.7486203, 1.484854, -0.441699, 0.6431373, 0, 1, 1,
0.7649742, 0.2886855, 3.0163, 0.6509804, 0, 1, 1,
0.7668162, 0.03104634, 3.076428, 0.654902, 0, 1, 1,
0.7685015, 0.2679022, 1.740068, 0.6627451, 0, 1, 1,
0.7697275, 0.2519433, 2.474891, 0.6666667, 0, 1, 1,
0.7764505, 2.76702, -1.183288, 0.6745098, 0, 1, 1,
0.7775908, 1.702721, 0.5792251, 0.6784314, 0, 1, 1,
0.7822109, 0.1148591, 1.320094, 0.6862745, 0, 1, 1,
0.7851264, -0.1010783, 2.794638, 0.6901961, 0, 1, 1,
0.7854281, -0.4678891, 1.318339, 0.6980392, 0, 1, 1,
0.7998947, -2.5323, 1.586866, 0.7058824, 0, 1, 1,
0.8067768, -0.5411242, 2.516299, 0.7098039, 0, 1, 1,
0.8095497, -1.826057, 2.030055, 0.7176471, 0, 1, 1,
0.816602, 0.3624632, 0.7537618, 0.7215686, 0, 1, 1,
0.8268028, 0.7932679, 2.577041, 0.7294118, 0, 1, 1,
0.8293501, 1.972502, 1.674551, 0.7333333, 0, 1, 1,
0.8337918, 2.484512, -1.707324, 0.7411765, 0, 1, 1,
0.8373893, -1.642426, 1.74647, 0.7450981, 0, 1, 1,
0.8415317, -0.2878725, 3.730954, 0.7529412, 0, 1, 1,
0.8439077, -0.7829106, 0.9909711, 0.7568628, 0, 1, 1,
0.8447524, -1.741433, 3.103977, 0.7647059, 0, 1, 1,
0.8517693, 0.3468481, 1.688318, 0.7686275, 0, 1, 1,
0.8557135, -1.366703, 2.487193, 0.7764706, 0, 1, 1,
0.8570417, 0.9413413, -0.2671122, 0.7803922, 0, 1, 1,
0.8631238, -0.4656493, 2.213778, 0.7882353, 0, 1, 1,
0.864203, 1.163287, 0.5842854, 0.7921569, 0, 1, 1,
0.8714675, 0.09352513, 0.5783432, 0.8, 0, 1, 1,
0.8737401, -1.746676, 2.340234, 0.8078431, 0, 1, 1,
0.879751, -1.680071, 0.5798535, 0.8117647, 0, 1, 1,
0.8963608, -0.8958272, 2.252836, 0.8196079, 0, 1, 1,
0.8973614, -0.7567893, 2.04286, 0.8235294, 0, 1, 1,
0.9065994, 0.3334988, 1.387355, 0.8313726, 0, 1, 1,
0.9098948, -1.862175, 2.346837, 0.8352941, 0, 1, 1,
0.9162726, -1.41999, 2.764368, 0.8431373, 0, 1, 1,
0.9179279, -0.1340578, 2.110281, 0.8470588, 0, 1, 1,
0.9213434, -0.4030187, 0.8703377, 0.854902, 0, 1, 1,
0.9221334, -1.831995, 3.061293, 0.8588235, 0, 1, 1,
0.9285693, 0.1046963, 3.030555, 0.8666667, 0, 1, 1,
0.9340957, -0.2525593, 3.631752, 0.8705882, 0, 1, 1,
0.9359474, 0.1688977, 1.041626, 0.8784314, 0, 1, 1,
0.9385249, 0.440322, 2.051951, 0.8823529, 0, 1, 1,
0.9476225, -1.506392, 0.6269868, 0.8901961, 0, 1, 1,
0.9476281, -0.3568522, 2.882694, 0.8941177, 0, 1, 1,
0.9486735, -0.3286211, 1.904662, 0.9019608, 0, 1, 1,
0.9510953, 0.05788424, 1.333279, 0.9098039, 0, 1, 1,
0.9532506, -1.508234, 2.996575, 0.9137255, 0, 1, 1,
0.9648205, -1.010925, 2.09031, 0.9215686, 0, 1, 1,
0.9690238, -0.6402652, 2.120575, 0.9254902, 0, 1, 1,
0.9738867, -1.554524, 1.229605, 0.9333333, 0, 1, 1,
0.9762789, -0.2374838, 2.472808, 0.9372549, 0, 1, 1,
0.9835365, 0.9848039, 1.987763, 0.945098, 0, 1, 1,
0.9914296, -0.08998352, 1.793798, 0.9490196, 0, 1, 1,
0.9918742, -0.2574096, 1.753783, 0.9568627, 0, 1, 1,
0.998501, -0.7011424, 1.654576, 0.9607843, 0, 1, 1,
1.002775, 0.2075895, 1.390612, 0.9686275, 0, 1, 1,
1.010882, 0.4479574, 0.998553, 0.972549, 0, 1, 1,
1.014806, 0.3061462, 2.232558, 0.9803922, 0, 1, 1,
1.015906, 0.5206951, 0.9130213, 0.9843137, 0, 1, 1,
1.021709, -0.6082105, 2.034856, 0.9921569, 0, 1, 1,
1.023772, -2.090433, 2.487316, 0.9960784, 0, 1, 1,
1.028929, 0.08878989, 2.573345, 1, 0, 0.9960784, 1,
1.031494, -0.9962422, 2.83832, 1, 0, 0.9882353, 1,
1.035529, -0.7119309, 0.733755, 1, 0, 0.9843137, 1,
1.03829, 0.3976373, -0.1428403, 1, 0, 0.9764706, 1,
1.043438, 0.3093216, 1.548344, 1, 0, 0.972549, 1,
1.046278, -0.3570514, 0.8909645, 1, 0, 0.9647059, 1,
1.046592, 0.3841013, -0.4844861, 1, 0, 0.9607843, 1,
1.049311, 0.07350038, 3.657726, 1, 0, 0.9529412, 1,
1.052243, -0.2126437, 1.421051, 1, 0, 0.9490196, 1,
1.052419, -0.2487736, 1.297473, 1, 0, 0.9411765, 1,
1.055315, 1.071334, 1.659786, 1, 0, 0.9372549, 1,
1.063561, -0.4980444, 1.03349, 1, 0, 0.9294118, 1,
1.065203, 0.9670715, -0.6206599, 1, 0, 0.9254902, 1,
1.06778, -0.515902, 0.0726425, 1, 0, 0.9176471, 1,
1.073829, 0.4261726, -0.9092873, 1, 0, 0.9137255, 1,
1.078951, 0.6140503, 1.364672, 1, 0, 0.9058824, 1,
1.079215, -0.8986109, 3.339673, 1, 0, 0.9019608, 1,
1.087073, -0.9948725, 2.399262, 1, 0, 0.8941177, 1,
1.090749, -0.9781799, 0.7631894, 1, 0, 0.8862745, 1,
1.094646, -1.690533, 2.54198, 1, 0, 0.8823529, 1,
1.099999, -1.803098, 2.262523, 1, 0, 0.8745098, 1,
1.107424, 0.9975938, 0.2074288, 1, 0, 0.8705882, 1,
1.111656, -0.305656, 3.838259, 1, 0, 0.8627451, 1,
1.112549, 0.2609174, 2.376853, 1, 0, 0.8588235, 1,
1.118488, -1.000293, 2.628018, 1, 0, 0.8509804, 1,
1.119055, -1.345647, 3.020699, 1, 0, 0.8470588, 1,
1.123499, 0.5058967, 0.1739103, 1, 0, 0.8392157, 1,
1.124837, -0.9332451, 1.43607, 1, 0, 0.8352941, 1,
1.136465, -0.5806902, 1.067952, 1, 0, 0.827451, 1,
1.140554, -1.661937, 2.806648, 1, 0, 0.8235294, 1,
1.154798, 0.4113873, 0.07938573, 1, 0, 0.8156863, 1,
1.161373, 0.07603361, 1.692147, 1, 0, 0.8117647, 1,
1.169408, 0.8948947, 1.862359, 1, 0, 0.8039216, 1,
1.176228, 0.2989656, 1.97856, 1, 0, 0.7960784, 1,
1.17917, -0.8857841, 2.73407, 1, 0, 0.7921569, 1,
1.181805, -0.5819001, 3.223401, 1, 0, 0.7843137, 1,
1.190223, 0.6420674, 1.647671, 1, 0, 0.7803922, 1,
1.197003, 0.668916, -0.9239562, 1, 0, 0.772549, 1,
1.20624, 1.14132, 1.125451, 1, 0, 0.7686275, 1,
1.217123, 1.244837, 2.372943, 1, 0, 0.7607843, 1,
1.219056, -0.6621097, 2.480989, 1, 0, 0.7568628, 1,
1.220979, -1.180653, 1.632776, 1, 0, 0.7490196, 1,
1.223348, 0.9686472, 2.097417, 1, 0, 0.7450981, 1,
1.226972, 0.5255929, 1.252116, 1, 0, 0.7372549, 1,
1.227308, 0.1070076, 0.1892877, 1, 0, 0.7333333, 1,
1.237835, 0.5971665, -0.7350993, 1, 0, 0.7254902, 1,
1.238924, -0.2303548, 1.976017, 1, 0, 0.7215686, 1,
1.248354, 0.2711791, 1.06419, 1, 0, 0.7137255, 1,
1.252413, -0.3187769, 2.523761, 1, 0, 0.7098039, 1,
1.254068, 0.04993875, -1.326647, 1, 0, 0.7019608, 1,
1.268275, -0.5541843, 2.391806, 1, 0, 0.6941177, 1,
1.273551, -1.091014, 1.265076, 1, 0, 0.6901961, 1,
1.275357, -0.3871921, 1.182426, 1, 0, 0.682353, 1,
1.276532, -1.535022, 1.914162, 1, 0, 0.6784314, 1,
1.280915, -1.144005, 1.827534, 1, 0, 0.6705883, 1,
1.282416, -0.2808132, 2.35548, 1, 0, 0.6666667, 1,
1.287987, -0.3630103, 1.711843, 1, 0, 0.6588235, 1,
1.290781, -0.3766821, 3.81924, 1, 0, 0.654902, 1,
1.291244, 0.1885139, 1.083362, 1, 0, 0.6470588, 1,
1.292024, -0.326288, 1.609035, 1, 0, 0.6431373, 1,
1.305928, 0.3974816, 1.808483, 1, 0, 0.6352941, 1,
1.309985, 0.1333495, 0.3802946, 1, 0, 0.6313726, 1,
1.315405, 1.4466, 0.6779981, 1, 0, 0.6235294, 1,
1.320172, -1.033577, 1.667783, 1, 0, 0.6196079, 1,
1.329769, 1.868428, -0.1729422, 1, 0, 0.6117647, 1,
1.33026, 0.09629494, 1.045457, 1, 0, 0.6078432, 1,
1.332221, 0.872715, 1.001467, 1, 0, 0.6, 1,
1.332795, 0.5341175, 2.258789, 1, 0, 0.5921569, 1,
1.333236, 0.6289414, 2.156654, 1, 0, 0.5882353, 1,
1.339748, 1.638847, 1.394244, 1, 0, 0.5803922, 1,
1.34404, 0.3112098, 0.1595908, 1, 0, 0.5764706, 1,
1.353629, 0.8854018, -0.2695116, 1, 0, 0.5686275, 1,
1.356751, -0.2681414, 1.338, 1, 0, 0.5647059, 1,
1.364487, -0.5160779, 2.011012, 1, 0, 0.5568628, 1,
1.373697, -0.6095637, 0.2922262, 1, 0, 0.5529412, 1,
1.38049, -0.3589575, 2.354861, 1, 0, 0.5450981, 1,
1.389636, 0.4526122, 1.579104, 1, 0, 0.5411765, 1,
1.402722, 0.9647806, 0.3621125, 1, 0, 0.5333334, 1,
1.40395, -0.433745, 1.168592, 1, 0, 0.5294118, 1,
1.405475, 0.2779778, 1.266463, 1, 0, 0.5215687, 1,
1.415684, 0.8503788, 0.09214662, 1, 0, 0.5176471, 1,
1.418927, 0.4788381, 1.051589, 1, 0, 0.509804, 1,
1.418945, 2.331193, 2.351134, 1, 0, 0.5058824, 1,
1.421841, -0.2129483, 1.763847, 1, 0, 0.4980392, 1,
1.423393, -1.16996, 1.984752, 1, 0, 0.4901961, 1,
1.427835, -1.005468, 3.445057, 1, 0, 0.4862745, 1,
1.443964, 2.185943, -0.02847972, 1, 0, 0.4784314, 1,
1.445727, 1.563581, -0.2494743, 1, 0, 0.4745098, 1,
1.450117, -0.1322685, 0.09599982, 1, 0, 0.4666667, 1,
1.480005, -1.41908, 3.044598, 1, 0, 0.4627451, 1,
1.480738, 0.9041796, 0.2319623, 1, 0, 0.454902, 1,
1.489101, 1.008517, 2.201019, 1, 0, 0.4509804, 1,
1.496066, -0.6846857, 1.643766, 1, 0, 0.4431373, 1,
1.502301, -1.291333, 3.038688, 1, 0, 0.4392157, 1,
1.505633, 0.3905224, -0.03141689, 1, 0, 0.4313726, 1,
1.505795, -1.009566, 1.676148, 1, 0, 0.427451, 1,
1.510319, -0.3259121, 2.66534, 1, 0, 0.4196078, 1,
1.530075, 2.028952, 1.382773, 1, 0, 0.4156863, 1,
1.534695, 1.502245, 0.5176455, 1, 0, 0.4078431, 1,
1.541852, -1.104198, 2.282283, 1, 0, 0.4039216, 1,
1.551096, 1.593026, 1.001886, 1, 0, 0.3960784, 1,
1.563521, -0.1473842, 0.6138482, 1, 0, 0.3882353, 1,
1.564026, 1.041505, 0.2093601, 1, 0, 0.3843137, 1,
1.568408, -0.7564133, 2.86937, 1, 0, 0.3764706, 1,
1.587143, -0.5016767, -2.181107, 1, 0, 0.372549, 1,
1.606178, 0.7539521, 1.112611, 1, 0, 0.3647059, 1,
1.623365, -0.8402576, 0.7897313, 1, 0, 0.3607843, 1,
1.634975, 1.276622, -0.2481454, 1, 0, 0.3529412, 1,
1.653524, -0.03302458, 1.493949, 1, 0, 0.3490196, 1,
1.659225, 1.259339, 1.205117, 1, 0, 0.3411765, 1,
1.668265, -1.957982, 4.132503, 1, 0, 0.3372549, 1,
1.679347, -0.604973, 3.425453, 1, 0, 0.3294118, 1,
1.696666, -0.3228755, 0.5440226, 1, 0, 0.3254902, 1,
1.731058, 0.8966108, 2.489045, 1, 0, 0.3176471, 1,
1.744803, -2.410902, 1.601212, 1, 0, 0.3137255, 1,
1.757165, -0.3639035, 2.994966, 1, 0, 0.3058824, 1,
1.783895, -0.2964593, 1.897851, 1, 0, 0.2980392, 1,
1.792155, 0.2538839, -0.299851, 1, 0, 0.2941177, 1,
1.796583, 0.6737735, 1.660397, 1, 0, 0.2862745, 1,
1.808226, -0.7712647, 0.841036, 1, 0, 0.282353, 1,
1.810247, -0.9766792, 3.043485, 1, 0, 0.2745098, 1,
1.817457, -1.676498, 0.9255994, 1, 0, 0.2705882, 1,
1.819339, -1.71102, 1.856651, 1, 0, 0.2627451, 1,
1.824814, 1.161458, 0.412425, 1, 0, 0.2588235, 1,
1.842522, 1.640373, 1.042681, 1, 0, 0.2509804, 1,
1.850624, -0.6054841, 1.941121, 1, 0, 0.2470588, 1,
1.894117, 1.335105, 0.3758104, 1, 0, 0.2392157, 1,
1.926592, 1.628916, 2.099679, 1, 0, 0.2352941, 1,
1.930341, -0.6359246, 2.08784, 1, 0, 0.227451, 1,
1.934276, 0.1861559, 1.99617, 1, 0, 0.2235294, 1,
1.947423, -0.4545993, 1.983379, 1, 0, 0.2156863, 1,
1.947521, 0.3260949, 2.464533, 1, 0, 0.2117647, 1,
1.949889, 1.147496, -0.557351, 1, 0, 0.2039216, 1,
1.976647, 0.6258267, 2.462953, 1, 0, 0.1960784, 1,
1.989773, -0.864499, 0.9038383, 1, 0, 0.1921569, 1,
1.9905, -1.223116, 1.094945, 1, 0, 0.1843137, 1,
2.001838, -2.422339, 2.262259, 1, 0, 0.1803922, 1,
2.005381, -0.2629523, 0.6951952, 1, 0, 0.172549, 1,
2.019112, -0.05091802, 1.448856, 1, 0, 0.1686275, 1,
2.022594, -1.251662, 3.11759, 1, 0, 0.1607843, 1,
2.034984, -0.1226471, 0.4829814, 1, 0, 0.1568628, 1,
2.05145, 0.8120008, 1.349648, 1, 0, 0.1490196, 1,
2.057744, -0.5616133, 2.048549, 1, 0, 0.145098, 1,
2.077926, -1.038251, 0.3093353, 1, 0, 0.1372549, 1,
2.079981, -1.051549, 0.8341072, 1, 0, 0.1333333, 1,
2.082521, -0.9534788, 1.842663, 1, 0, 0.1254902, 1,
2.099815, 0.2402674, 1.385318, 1, 0, 0.1215686, 1,
2.105398, -0.9472436, 1.194441, 1, 0, 0.1137255, 1,
2.129184, -0.6668434, 2.762983, 1, 0, 0.1098039, 1,
2.13423, -1.567767, 1.959375, 1, 0, 0.1019608, 1,
2.176006, -0.5660264, 4.768751, 1, 0, 0.09411765, 1,
2.200978, 0.9130611, 2.839278, 1, 0, 0.09019608, 1,
2.21512, -0.7129671, 2.739126, 1, 0, 0.08235294, 1,
2.220607, 0.06817276, 2.072937, 1, 0, 0.07843138, 1,
2.231462, 0.3764565, 1.239769, 1, 0, 0.07058824, 1,
2.35102, 0.06018557, 1.461254, 1, 0, 0.06666667, 1,
2.390118, -1.06854, 1.745491, 1, 0, 0.05882353, 1,
2.413787, 1.136669, 0.6846922, 1, 0, 0.05490196, 1,
2.510003, -1.01748, 2.326761, 1, 0, 0.04705882, 1,
2.529928, -0.1968514, 1.614927, 1, 0, 0.04313726, 1,
2.60075, 0.6131966, -0.3764716, 1, 0, 0.03529412, 1,
2.660231, 0.1045387, 2.308471, 1, 0, 0.03137255, 1,
2.673206, 0.8856738, 1.39403, 1, 0, 0.02352941, 1,
2.683784, 0.7220445, 1.943243, 1, 0, 0.01960784, 1,
2.955509, 0.1425884, 2.784479, 1, 0, 0.01176471, 1,
3.633001, 0.8359439, 2.70165, 1, 0, 0.007843138, 1
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
0.1469883, -3.970902, -7.138243, 0, -0.5, 0.5, 0.5,
0.1469883, -3.970902, -7.138243, 1, -0.5, 0.5, 0.5,
0.1469883, -3.970902, -7.138243, 1, 1.5, 0.5, 0.5,
0.1469883, -3.970902, -7.138243, 0, 1.5, 0.5, 0.5
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
-4.520783, 0.2452956, -7.138243, 0, -0.5, 0.5, 0.5,
-4.520783, 0.2452956, -7.138243, 1, -0.5, 0.5, 0.5,
-4.520783, 0.2452956, -7.138243, 1, 1.5, 0.5, 0.5,
-4.520783, 0.2452956, -7.138243, 0, 1.5, 0.5, 0.5
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
-4.520783, -3.970902, 0.002775908, 0, -0.5, 0.5, 0.5,
-4.520783, -3.970902, 0.002775908, 1, -0.5, 0.5, 0.5,
-4.520783, -3.970902, 0.002775908, 1, 1.5, 0.5, 0.5,
-4.520783, -3.970902, 0.002775908, 0, 1.5, 0.5, 0.5
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
-3, -2.997933, -5.490316,
3, -2.997933, -5.490316,
-3, -2.997933, -5.490316,
-3, -3.160095, -5.76497,
-2, -2.997933, -5.490316,
-2, -3.160095, -5.76497,
-1, -2.997933, -5.490316,
-1, -3.160095, -5.76497,
0, -2.997933, -5.490316,
0, -3.160095, -5.76497,
1, -2.997933, -5.490316,
1, -3.160095, -5.76497,
2, -2.997933, -5.490316,
2, -3.160095, -5.76497,
3, -2.997933, -5.490316,
3, -3.160095, -5.76497
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
-3, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
-3, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
-3, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
-3, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
-2, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
-2, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
-2, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
-2, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
-1, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
-1, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
-1, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
-1, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
0, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
0, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
0, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
0, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
1, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
1, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
1, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
1, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
2, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
2, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
2, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
2, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5,
3, -3.484418, -6.31428, 0, -0.5, 0.5, 0.5,
3, -3.484418, -6.31428, 1, -0.5, 0.5, 0.5,
3, -3.484418, -6.31428, 1, 1.5, 0.5, 0.5,
3, -3.484418, -6.31428, 0, 1.5, 0.5, 0.5
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
-3.443605, -2, -5.490316,
-3.443605, 3, -5.490316,
-3.443605, -2, -5.490316,
-3.623135, -2, -5.76497,
-3.443605, -1, -5.490316,
-3.623135, -1, -5.76497,
-3.443605, 0, -5.490316,
-3.623135, 0, -5.76497,
-3.443605, 1, -5.490316,
-3.623135, 1, -5.76497,
-3.443605, 2, -5.490316,
-3.623135, 2, -5.76497,
-3.443605, 3, -5.490316,
-3.623135, 3, -5.76497
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
-3.982194, -2, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, -2, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, -2, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, -2, -6.31428, 0, 1.5, 0.5, 0.5,
-3.982194, -1, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, -1, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, -1, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, -1, -6.31428, 0, 1.5, 0.5, 0.5,
-3.982194, 0, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, 0, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, 0, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, 0, -6.31428, 0, 1.5, 0.5, 0.5,
-3.982194, 1, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, 1, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, 1, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, 1, -6.31428, 0, 1.5, 0.5, 0.5,
-3.982194, 2, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, 2, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, 2, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, 2, -6.31428, 0, 1.5, 0.5, 0.5,
-3.982194, 3, -6.31428, 0, -0.5, 0.5, 0.5,
-3.982194, 3, -6.31428, 1, -0.5, 0.5, 0.5,
-3.982194, 3, -6.31428, 1, 1.5, 0.5, 0.5,
-3.982194, 3, -6.31428, 0, 1.5, 0.5, 0.5
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
-3.443605, -2.997933, -4,
-3.443605, -2.997933, 4,
-3.443605, -2.997933, -4,
-3.623135, -3.160095, -4,
-3.443605, -2.997933, -2,
-3.623135, -3.160095, -2,
-3.443605, -2.997933, 0,
-3.623135, -3.160095, 0,
-3.443605, -2.997933, 2,
-3.623135, -3.160095, 2,
-3.443605, -2.997933, 4,
-3.623135, -3.160095, 4
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
-3.982194, -3.484418, -4, 0, -0.5, 0.5, 0.5,
-3.982194, -3.484418, -4, 1, -0.5, 0.5, 0.5,
-3.982194, -3.484418, -4, 1, 1.5, 0.5, 0.5,
-3.982194, -3.484418, -4, 0, 1.5, 0.5, 0.5,
-3.982194, -3.484418, -2, 0, -0.5, 0.5, 0.5,
-3.982194, -3.484418, -2, 1, -0.5, 0.5, 0.5,
-3.982194, -3.484418, -2, 1, 1.5, 0.5, 0.5,
-3.982194, -3.484418, -2, 0, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 0, 0, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 0, 1, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 0, 1, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 0, 0, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 2, 0, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 2, 1, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 2, 1, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 2, 0, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 4, 0, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 4, 1, -0.5, 0.5, 0.5,
-3.982194, -3.484418, 4, 1, 1.5, 0.5, 0.5,
-3.982194, -3.484418, 4, 0, 1.5, 0.5, 0.5
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
-3.443605, -2.997933, -5.490316,
-3.443605, 3.488524, -5.490316,
-3.443605, -2.997933, 5.495868,
-3.443605, 3.488524, 5.495868,
-3.443605, -2.997933, -5.490316,
-3.443605, -2.997933, 5.495868,
-3.443605, 3.488524, -5.490316,
-3.443605, 3.488524, 5.495868,
-3.443605, -2.997933, -5.490316,
3.737581, -2.997933, -5.490316,
-3.443605, -2.997933, 5.495868,
3.737581, -2.997933, 5.495868,
-3.443605, 3.488524, -5.490316,
3.737581, 3.488524, -5.490316,
-3.443605, 3.488524, 5.495868,
3.737581, 3.488524, 5.495868,
3.737581, -2.997933, -5.490316,
3.737581, 3.488524, -5.490316,
3.737581, -2.997933, 5.495868,
3.737581, 3.488524, 5.495868,
3.737581, -2.997933, -5.490316,
3.737581, -2.997933, 5.495868,
3.737581, 3.488524, -5.490316,
3.737581, 3.488524, 5.495868
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
var radius = 7.817662;
var distance = 34.78166;
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
mvMatrix.translate( -0.1469883, -0.2452956, -0.002775908 );
mvMatrix.scale( 1.177049, 1.303116, 0.7693854 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.78166);
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
naphthalene<-read.table("naphthalene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-naphthalene$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
```

```r
y<-naphthalene$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
```

```r
z<-naphthalene$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
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
-3.339025, 0.2199853, -1.429299, 0, 0, 1, 1, 1,
-2.971894, -1.232786, -1.73005, 1, 0, 0, 1, 1,
-2.906759, 1.125736, -0.3309358, 1, 0, 0, 1, 1,
-2.889323, 0.8087026, -1.556752, 1, 0, 0, 1, 1,
-2.798643, -0.3887787, -0.3825495, 1, 0, 0, 1, 1,
-2.743224, -0.6286257, -1.110265, 1, 0, 0, 1, 1,
-2.571425, -0.5757471, -1.696825, 0, 0, 0, 1, 1,
-2.547195, 0.3243739, -1.888595, 0, 0, 0, 1, 1,
-2.538892, -0.5421336, -2.637569, 0, 0, 0, 1, 1,
-2.46962, 2.102684, -0.5070159, 0, 0, 0, 1, 1,
-2.409934, 0.6091363, -1.703666, 0, 0, 0, 1, 1,
-2.358779, 0.8358602, 1.000025, 0, 0, 0, 1, 1,
-2.227972, -0.8345543, -1.425427, 0, 0, 0, 1, 1,
-2.226807, 0.2183539, -0.05515337, 1, 1, 1, 1, 1,
-2.192951, 0.6062515, -2.296369, 1, 1, 1, 1, 1,
-2.178398, 0.747473, -2.912029, 1, 1, 1, 1, 1,
-2.172091, -0.982996, -0.1427804, 1, 1, 1, 1, 1,
-2.162809, -2.809976, -2.76471, 1, 1, 1, 1, 1,
-2.149633, -0.3031108, -1.745169, 1, 1, 1, 1, 1,
-2.141074, 0.3082548, -0.7591444, 1, 1, 1, 1, 1,
-2.096474, 0.1953378, -0.4494278, 1, 1, 1, 1, 1,
-2.09556, 2.07366, -1.693885, 1, 1, 1, 1, 1,
-2.056157, 1.314649, -0.8901604, 1, 1, 1, 1, 1,
-2.046885, 1.847878, -1.10805, 1, 1, 1, 1, 1,
-2.025038, -1.050353, -0.3824238, 1, 1, 1, 1, 1,
-1.956776, -0.7017812, -2.162878, 1, 1, 1, 1, 1,
-1.946649, -0.931711, -1.914426, 1, 1, 1, 1, 1,
-1.946071, 0.105603, -2.60231, 1, 1, 1, 1, 1,
-1.935639, 0.02028211, -2.264864, 0, 0, 1, 1, 1,
-1.875889, 1.096007, -2.502767, 1, 0, 0, 1, 1,
-1.855227, -1.066651, -1.533009, 1, 0, 0, 1, 1,
-1.835962, 0.3547893, 0.9239991, 1, 0, 0, 1, 1,
-1.828057, 0.2165217, -3.178198, 1, 0, 0, 1, 1,
-1.823399, -0.2435218, -0.8552533, 1, 0, 0, 1, 1,
-1.813515, -1.116156, -0.9571477, 0, 0, 0, 1, 1,
-1.806091, -1.301438, -1.560824, 0, 0, 0, 1, 1,
-1.804197, 1.912132, -0.9533072, 0, 0, 0, 1, 1,
-1.802584, 1.31394, -0.9276778, 0, 0, 0, 1, 1,
-1.791358, -1.137284, -0.8743676, 0, 0, 0, 1, 1,
-1.775237, 0.1185119, -1.483435, 0, 0, 0, 1, 1,
-1.772493, 0.5145774, -2.763311, 0, 0, 0, 1, 1,
-1.733949, -0.3058372, -1.72653, 1, 1, 1, 1, 1,
-1.729377, 0.1113816, -2.098562, 1, 1, 1, 1, 1,
-1.729343, 1.351104, -0.48958, 1, 1, 1, 1, 1,
-1.720352, -0.622008, -3.701658, 1, 1, 1, 1, 1,
-1.7169, 1.803568, 0.3829407, 1, 1, 1, 1, 1,
-1.711238, 0.7292723, -1.568295, 1, 1, 1, 1, 1,
-1.705896, 0.6959448, -2.119606, 1, 1, 1, 1, 1,
-1.700361, 0.02824936, -3.347362, 1, 1, 1, 1, 1,
-1.69651, 0.4440038, -0.6748158, 1, 1, 1, 1, 1,
-1.690771, 0.287825, -1.600107, 1, 1, 1, 1, 1,
-1.690711, -0.3454205, -1.157427, 1, 1, 1, 1, 1,
-1.681794, -0.1416932, -1.358758, 1, 1, 1, 1, 1,
-1.681553, 0.9873223, -2.972142, 1, 1, 1, 1, 1,
-1.678732, 0.1476647, -2.044639, 1, 1, 1, 1, 1,
-1.668315, 0.9196165, -2.695956, 1, 1, 1, 1, 1,
-1.666103, -0.5194404, -2.455736, 0, 0, 1, 1, 1,
-1.64819, -2.491452, -3.297601, 1, 0, 0, 1, 1,
-1.634374, -1.370229, -2.235512, 1, 0, 0, 1, 1,
-1.633045, -0.2156456, -0.4856597, 1, 0, 0, 1, 1,
-1.628021, 1.067445, -1.532191, 1, 0, 0, 1, 1,
-1.616582, -0.3384143, -0.2224297, 1, 0, 0, 1, 1,
-1.598307, -0.07739811, -2.375632, 0, 0, 0, 1, 1,
-1.585159, 0.4287068, -2.538117, 0, 0, 0, 1, 1,
-1.584383, -0.05925257, -1.446455, 0, 0, 0, 1, 1,
-1.583925, 0.3991582, -0.639396, 0, 0, 0, 1, 1,
-1.551757, 0.9738549, -0.5305471, 0, 0, 0, 1, 1,
-1.545361, -0.5222169, 0.0691433, 0, 0, 0, 1, 1,
-1.539286, 1.084442, -0.8667321, 0, 0, 0, 1, 1,
-1.538887, 0.6763481, -1.06204, 1, 1, 1, 1, 1,
-1.538099, -1.05906, -1.294431, 1, 1, 1, 1, 1,
-1.521477, 0.6570826, -1.006646, 1, 1, 1, 1, 1,
-1.516057, 1.740504, -1.530262, 1, 1, 1, 1, 1,
-1.513881, 0.5052906, -1.567234, 1, 1, 1, 1, 1,
-1.511685, 2.060596, 0.4433398, 1, 1, 1, 1, 1,
-1.508489, -0.928743, -2.307443, 1, 1, 1, 1, 1,
-1.50309, -0.9179727, -2.337869, 1, 1, 1, 1, 1,
-1.496524, 0.1455265, -4.041934, 1, 1, 1, 1, 1,
-1.490538, 1.202596, 0.1419929, 1, 1, 1, 1, 1,
-1.48754, 0.6309715, -0.3543638, 1, 1, 1, 1, 1,
-1.484276, -0.7663629, 1.70146, 1, 1, 1, 1, 1,
-1.483533, -1.786728, -4.941492, 1, 1, 1, 1, 1,
-1.482715, 0.5101039, -1.032428, 1, 1, 1, 1, 1,
-1.481796, -0.812097, -1.312949, 1, 1, 1, 1, 1,
-1.480264, 0.02938623, -1.065269, 0, 0, 1, 1, 1,
-1.48004, -0.02402337, -0.6388621, 1, 0, 0, 1, 1,
-1.469522, 0.1166313, -1.461578, 1, 0, 0, 1, 1,
-1.466278, 0.8258338, -2.338332, 1, 0, 0, 1, 1,
-1.44379, -0.4629706, -2.797225, 1, 0, 0, 1, 1,
-1.416169, -1.263935, -1.609242, 1, 0, 0, 1, 1,
-1.410832, 0.2527781, -0.7942635, 0, 0, 0, 1, 1,
-1.393064, 0.3916091, -1.342395, 0, 0, 0, 1, 1,
-1.391604, -0.919149, -1.027904, 0, 0, 0, 1, 1,
-1.359764, -0.3171577, -0.5254417, 0, 0, 0, 1, 1,
-1.336815, 0.5077399, -1.800637, 0, 0, 0, 1, 1,
-1.331835, -0.03406867, -1.794801, 0, 0, 0, 1, 1,
-1.323786, 1.494255, -1.981455, 0, 0, 0, 1, 1,
-1.321224, 0.07439198, -0.3712786, 1, 1, 1, 1, 1,
-1.319981, -0.414858, -1.352862, 1, 1, 1, 1, 1,
-1.31426, -1.442204, -1.735114, 1, 1, 1, 1, 1,
-1.309757, -1.923704, -2.248119, 1, 1, 1, 1, 1,
-1.307906, 0.7774598, -0.5265433, 1, 1, 1, 1, 1,
-1.29019, 0.196356, -1.209968, 1, 1, 1, 1, 1,
-1.282303, -1.424084, -2.396656, 1, 1, 1, 1, 1,
-1.271126, 0.4873369, -1.884472, 1, 1, 1, 1, 1,
-1.267481, 1.699765, -0.9954063, 1, 1, 1, 1, 1,
-1.254736, -0.009347004, -0.5623133, 1, 1, 1, 1, 1,
-1.251552, -0.7809382, -2.514202, 1, 1, 1, 1, 1,
-1.24857, 1.931372, 0.09589687, 1, 1, 1, 1, 1,
-1.241805, 0.6861317, -1.319901, 1, 1, 1, 1, 1,
-1.232947, -2.151567, -3.942555, 1, 1, 1, 1, 1,
-1.230932, -0.2090322, -0.4167102, 1, 1, 1, 1, 1,
-1.230178, -0.3348879, -1.23526, 0, 0, 1, 1, 1,
-1.225027, 1.262761, 0.7050697, 1, 0, 0, 1, 1,
-1.218871, 1.081382, -2.22421, 1, 0, 0, 1, 1,
-1.215128, -1.909149, -2.257669, 1, 0, 0, 1, 1,
-1.212515, -1.725794, -2.796072, 1, 0, 0, 1, 1,
-1.21154, -1.343197, -1.844658, 1, 0, 0, 1, 1,
-1.20919, -1.187606, -3.338092, 0, 0, 0, 1, 1,
-1.207234, 1.521957, -0.5118096, 0, 0, 0, 1, 1,
-1.204439, 0.3688102, -4.101818, 0, 0, 0, 1, 1,
-1.191441, 0.2919341, -2.36321, 0, 0, 0, 1, 1,
-1.191378, 0.9476557, 0.660044, 0, 0, 0, 1, 1,
-1.184412, -0.04986055, -1.787575, 0, 0, 0, 1, 1,
-1.183448, -0.01689198, -0.008299666, 0, 0, 0, 1, 1,
-1.173748, -0.9686133, -1.352874, 1, 1, 1, 1, 1,
-1.169628, -1.874911, -2.878266, 1, 1, 1, 1, 1,
-1.164709, -0.5940763, -1.52323, 1, 1, 1, 1, 1,
-1.163926, 0.6869718, -2.003421, 1, 1, 1, 1, 1,
-1.162969, 0.1963369, -1.107203, 1, 1, 1, 1, 1,
-1.162758, -0.1657835, -0.4673766, 1, 1, 1, 1, 1,
-1.152157, -0.6981806, -3.044193, 1, 1, 1, 1, 1,
-1.149205, 0.6338159, -1.564143, 1, 1, 1, 1, 1,
-1.148733, 0.2110461, -4.235259, 1, 1, 1, 1, 1,
-1.146265, 2.403255, -1.132875, 1, 1, 1, 1, 1,
-1.144306, 0.9390405, -1.717069, 1, 1, 1, 1, 1,
-1.136691, -0.411748, -1.553186, 1, 1, 1, 1, 1,
-1.134309, 0.649898, -1.820156, 1, 1, 1, 1, 1,
-1.134175, -1.227877, -2.805179, 1, 1, 1, 1, 1,
-1.128235, 0.9893042, 0.1049491, 1, 1, 1, 1, 1,
-1.121733, -0.3928905, -2.224795, 0, 0, 1, 1, 1,
-1.119198, 1.044402, -0.08961073, 1, 0, 0, 1, 1,
-1.115577, 0.5464298, -1.160208, 1, 0, 0, 1, 1,
-1.111878, -1.193053, -0.7821724, 1, 0, 0, 1, 1,
-1.108994, -0.6252636, -1.63727, 1, 0, 0, 1, 1,
-1.106, 0.372712, -2.481752, 1, 0, 0, 1, 1,
-1.103102, 0.9193797, 0.1688203, 0, 0, 0, 1, 1,
-1.100512, 0.169494, -2.959821, 0, 0, 0, 1, 1,
-1.09039, -1.241994, -0.2806435, 0, 0, 0, 1, 1,
-1.089171, -1.1687, -1.818344, 0, 0, 0, 1, 1,
-1.086054, -0.912318, -1.426643, 0, 0, 0, 1, 1,
-1.085134, 0.2660175, -0.2103731, 0, 0, 0, 1, 1,
-1.078093, -0.2455774, -1.746598, 0, 0, 0, 1, 1,
-1.064843, 0.7075276, -0.8968082, 1, 1, 1, 1, 1,
-1.059875, -0.1485943, -1.413155, 1, 1, 1, 1, 1,
-1.059538, 0.1198718, -1.121517, 1, 1, 1, 1, 1,
-1.049917, -0.3375935, -0.1450986, 1, 1, 1, 1, 1,
-1.043198, 0.2735623, -1.282212, 1, 1, 1, 1, 1,
-1.043141, -0.412666, -1.383023, 1, 1, 1, 1, 1,
-1.040987, 0.7948523, -2.187029, 1, 1, 1, 1, 1,
-1.039788, -0.3529183, 0.01891329, 1, 1, 1, 1, 1,
-1.036725, 0.9390455, -2.116694, 1, 1, 1, 1, 1,
-1.035626, -1.080522, -1.275554, 1, 1, 1, 1, 1,
-1.034398, 1.490639, -1.49091, 1, 1, 1, 1, 1,
-1.032451, -0.6804709, 0.4974906, 1, 1, 1, 1, 1,
-1.025504, -0.423817, -2.809675, 1, 1, 1, 1, 1,
-1.024329, 1.051227, -0.5080599, 1, 1, 1, 1, 1,
-1.022508, 0.4152667, 0.3594849, 1, 1, 1, 1, 1,
-1.022243, 0.3662467, -2.328474, 0, 0, 1, 1, 1,
-1.010348, -0.5519226, -2.479127, 1, 0, 0, 1, 1,
-1.003963, 1.043869, -1.092193, 1, 0, 0, 1, 1,
-0.9997688, -0.2256138, -1.244625, 1, 0, 0, 1, 1,
-0.9980926, 0.59642, -1.350968, 1, 0, 0, 1, 1,
-0.993057, 0.5729269, -0.2292665, 1, 0, 0, 1, 1,
-0.9890175, -1.513785, -3.702362, 0, 0, 0, 1, 1,
-0.965267, -1.177123, -2.272871, 0, 0, 0, 1, 1,
-0.9650114, 1.004062, 0.006519739, 0, 0, 0, 1, 1,
-0.9645281, 0.2218052, -0.05303561, 0, 0, 0, 1, 1,
-0.9615766, -0.3870205, -1.917568, 0, 0, 0, 1, 1,
-0.9596374, 0.05888066, -1.737205, 0, 0, 0, 1, 1,
-0.9371185, -0.7982383, -2.383991, 0, 0, 0, 1, 1,
-0.9367183, -0.6524946, -1.295761, 1, 1, 1, 1, 1,
-0.9351432, -0.4169486, -0.7079999, 1, 1, 1, 1, 1,
-0.9334372, 0.5568641, 0.1168771, 1, 1, 1, 1, 1,
-0.9327716, -0.01679858, -1.44737, 1, 1, 1, 1, 1,
-0.9284499, 0.9755476, 0.06148124, 1, 1, 1, 1, 1,
-0.9193452, 0.4426091, -0.5678906, 1, 1, 1, 1, 1,
-0.9127163, 0.6602658, -2.180467, 1, 1, 1, 1, 1,
-0.9063067, -0.2058508, -1.608058, 1, 1, 1, 1, 1,
-0.9050769, 0.5306873, -3.006796, 1, 1, 1, 1, 1,
-0.9043036, -1.242857, -0.7820483, 1, 1, 1, 1, 1,
-0.9040381, 0.7157965, -0.6585735, 1, 1, 1, 1, 1,
-0.9004952, -0.9947593, -2.707675, 1, 1, 1, 1, 1,
-0.8926107, 0.64551, -1.225118, 1, 1, 1, 1, 1,
-0.891395, 0.396044, -2.323019, 1, 1, 1, 1, 1,
-0.8892459, 1.942729, -0.2011944, 1, 1, 1, 1, 1,
-0.883497, -0.5144554, -0.5246744, 0, 0, 1, 1, 1,
-0.8677771, 1.144205, 0.2666982, 1, 0, 0, 1, 1,
-0.8675072, -0.1868447, -1.773498, 1, 0, 0, 1, 1,
-0.8591048, 1.191061, 1.306001, 1, 0, 0, 1, 1,
-0.8562206, -0.6791012, -3.559798, 1, 0, 0, 1, 1,
-0.8560666, -0.708164, -1.871784, 1, 0, 0, 1, 1,
-0.8534453, 0.1580861, -1.292847, 0, 0, 0, 1, 1,
-0.8488108, 1.349883, -1.724901, 0, 0, 0, 1, 1,
-0.841208, -1.701581, -2.634444, 0, 0, 0, 1, 1,
-0.838359, 1.209941, -0.3227338, 0, 0, 0, 1, 1,
-0.83799, 0.08515016, -1.682287, 0, 0, 0, 1, 1,
-0.8323857, 0.1912223, -1.713684, 0, 0, 0, 1, 1,
-0.8296043, -0.5357434, -0.8165625, 0, 0, 0, 1, 1,
-0.8226193, 1.557014, -0.08429953, 1, 1, 1, 1, 1,
-0.8214641, 0.3109321, -1.87366, 1, 1, 1, 1, 1,
-0.8209309, 0.6982152, -0.8985437, 1, 1, 1, 1, 1,
-0.819407, -1.126614, -3.027361, 1, 1, 1, 1, 1,
-0.8172516, -0.9191533, -0.8473883, 1, 1, 1, 1, 1,
-0.8120353, 0.9635351, 0.483459, 1, 1, 1, 1, 1,
-0.8108085, 0.5943583, -0.7670223, 1, 1, 1, 1, 1,
-0.8097981, 0.9608909, -0.7775664, 1, 1, 1, 1, 1,
-0.8097979, 0.9162924, -0.4302637, 1, 1, 1, 1, 1,
-0.8043153, 1.150863, -0.03820791, 1, 1, 1, 1, 1,
-0.7936625, -0.3511069, -3.456184, 1, 1, 1, 1, 1,
-0.7935951, -0.4170122, -2.699946, 1, 1, 1, 1, 1,
-0.7934883, -0.6619836, -0.8673636, 1, 1, 1, 1, 1,
-0.7931303, 0.5213122, 0.05828731, 1, 1, 1, 1, 1,
-0.7927787, -2.037897, -1.931221, 1, 1, 1, 1, 1,
-0.7904103, 0.032292, -1.561628, 0, 0, 1, 1, 1,
-0.7886731, -1.674648, -3.933875, 1, 0, 0, 1, 1,
-0.7862713, -0.8434036, -1.564836, 1, 0, 0, 1, 1,
-0.7825488, 0.5488271, -1.032452, 1, 0, 0, 1, 1,
-0.7801449, 0.4586867, -1.166797, 1, 0, 0, 1, 1,
-0.7782805, 0.6234331, -0.01217176, 1, 0, 0, 1, 1,
-0.7748158, -0.04222099, -0.3860675, 0, 0, 0, 1, 1,
-0.7723641, -0.4672094, -2.07509, 0, 0, 0, 1, 1,
-0.7707819, -0.7623866, 0.02615102, 0, 0, 0, 1, 1,
-0.7694627, 0.01392866, -1.152487, 0, 0, 0, 1, 1,
-0.7684204, -1.000514, -2.762266, 0, 0, 0, 1, 1,
-0.7681804, -2.90347, -2.938968, 0, 0, 0, 1, 1,
-0.7599397, -0.1614965, -0.5361266, 0, 0, 0, 1, 1,
-0.7586229, -0.3375137, -0.5716293, 1, 1, 1, 1, 1,
-0.7582437, 0.7712448, -1.130655, 1, 1, 1, 1, 1,
-0.7578722, -0.2442597, -1.702583, 1, 1, 1, 1, 1,
-0.751779, -0.7159815, -2.32146, 1, 1, 1, 1, 1,
-0.7489241, 0.6991256, -1.200253, 1, 1, 1, 1, 1,
-0.748528, 0.9838629, 0.1103763, 1, 1, 1, 1, 1,
-0.7445253, 0.113433, -3.498689, 1, 1, 1, 1, 1,
-0.7342224, 0.2054818, -1.710232, 1, 1, 1, 1, 1,
-0.7319203, 1.603496, -0.1262159, 1, 1, 1, 1, 1,
-0.7280159, 0.2408684, -0.571988, 1, 1, 1, 1, 1,
-0.7250173, 0.3034334, -1.116279, 1, 1, 1, 1, 1,
-0.7233355, -1.729093, -2.75926, 1, 1, 1, 1, 1,
-0.7221909, 1.553153, -1.207918, 1, 1, 1, 1, 1,
-0.7161577, -1.329592, -3.443949, 1, 1, 1, 1, 1,
-0.7151216, -0.1991038, -3.512099, 1, 1, 1, 1, 1,
-0.7149301, -0.01821358, -1.290009, 0, 0, 1, 1, 1,
-0.7050411, 0.6164318, -1.027387, 1, 0, 0, 1, 1,
-0.7007982, 1.719302, -1.454474, 1, 0, 0, 1, 1,
-0.695902, -0.5254486, -1.922587, 1, 0, 0, 1, 1,
-0.6799641, -2.180592, -2.324776, 1, 0, 0, 1, 1,
-0.6757818, -0.9169608, -0.528914, 1, 0, 0, 1, 1,
-0.6727883, -0.2112524, -2.703502, 0, 0, 0, 1, 1,
-0.670535, 1.012692, -0.2639286, 0, 0, 0, 1, 1,
-0.6650726, -0.7490055, -1.108898, 0, 0, 0, 1, 1,
-0.6635224, 0.3811171, -1.825659, 0, 0, 0, 1, 1,
-0.6617721, -0.08640031, -0.6984545, 0, 0, 0, 1, 1,
-0.6610792, 0.6022009, -0.2819173, 0, 0, 0, 1, 1,
-0.6591899, -0.4310674, -2.227605, 0, 0, 0, 1, 1,
-0.6521114, -1.416567, -3.972949, 1, 1, 1, 1, 1,
-0.6505609, -0.1772704, -2.326386, 1, 1, 1, 1, 1,
-0.6448797, 0.05803803, 0.5869647, 1, 1, 1, 1, 1,
-0.6420321, 0.4779599, -0.175778, 1, 1, 1, 1, 1,
-0.6419191, 0.2211722, -0.7616405, 1, 1, 1, 1, 1,
-0.6402407, -1.167843, -1.405542, 1, 1, 1, 1, 1,
-0.6377348, 0.3027894, 0.07722883, 1, 1, 1, 1, 1,
-0.6374222, -0.7609667, -3.866233, 1, 1, 1, 1, 1,
-0.6334251, -0.4751893, -1.717043, 1, 1, 1, 1, 1,
-0.6328276, -1.297022, -2.225214, 1, 1, 1, 1, 1,
-0.6317772, -1.234129, -2.468375, 1, 1, 1, 1, 1,
-0.6293237, -0.8881027, -3.734361, 1, 1, 1, 1, 1,
-0.6274974, -0.511061, -3.144738, 1, 1, 1, 1, 1,
-0.6222869, -0.3449862, -2.587084, 1, 1, 1, 1, 1,
-0.6141167, -0.5125067, -2.501087, 1, 1, 1, 1, 1,
-0.6131487, 0.3162805, -0.3883336, 0, 0, 1, 1, 1,
-0.6119791, -0.2849741, -2.858483, 1, 0, 0, 1, 1,
-0.6117046, 0.003866137, -0.8406171, 1, 0, 0, 1, 1,
-0.6069762, -0.09075446, -1.87393, 1, 0, 0, 1, 1,
-0.6045032, 0.1545167, -1.697631, 1, 0, 0, 1, 1,
-0.6015576, -0.1572411, -0.3716104, 1, 0, 0, 1, 1,
-0.5992984, -0.05642198, -2.466367, 0, 0, 0, 1, 1,
-0.5978461, 0.5391329, 0.4996393, 0, 0, 0, 1, 1,
-0.5959471, 0.3737939, -3.436088, 0, 0, 0, 1, 1,
-0.593328, 0.7458655, -0.6730467, 0, 0, 0, 1, 1,
-0.5915258, 0.5995148, -0.6158989, 0, 0, 0, 1, 1,
-0.5880591, -1.630869, -2.476058, 0, 0, 0, 1, 1,
-0.5880395, 0.08084644, 0.5546602, 0, 0, 0, 1, 1,
-0.5867354, -0.5702278, -4.269057, 1, 1, 1, 1, 1,
-0.5854264, -0.604895, -4.424176, 1, 1, 1, 1, 1,
-0.5807809, 0.7033114, -0.1989986, 1, 1, 1, 1, 1,
-0.5794649, 1.200146, -2.577442, 1, 1, 1, 1, 1,
-0.5663276, -0.4861954, -2.453681, 1, 1, 1, 1, 1,
-0.5628983, 0.3897944, -2.052989, 1, 1, 1, 1, 1,
-0.5591621, -0.3068992, -2.903173, 1, 1, 1, 1, 1,
-0.5573739, -2.302462, -3.897905, 1, 1, 1, 1, 1,
-0.5521112, -0.523984, -3.077401, 1, 1, 1, 1, 1,
-0.5458024, -0.6860526, -2.176256, 1, 1, 1, 1, 1,
-0.5371805, 0.5493464, -1.01591, 1, 1, 1, 1, 1,
-0.5366503, 0.5927184, -2.464562, 1, 1, 1, 1, 1,
-0.536603, 0.7516857, 0.2514901, 1, 1, 1, 1, 1,
-0.5353441, -1.575871, -2.661304, 1, 1, 1, 1, 1,
-0.5343705, -2.043969, -3.111752, 1, 1, 1, 1, 1,
-0.5309998, 0.1511098, -0.6653039, 0, 0, 1, 1, 1,
-0.5291476, -0.2911011, -2.377582, 1, 0, 0, 1, 1,
-0.5290697, 0.6718991, -0.1488185, 1, 0, 0, 1, 1,
-0.5281554, 0.04836982, -0.8720219, 1, 0, 0, 1, 1,
-0.5252116, 0.4273438, -0.6684068, 1, 0, 0, 1, 1,
-0.5237892, -0.9434085, -2.143516, 1, 0, 0, 1, 1,
-0.5204155, 1.430711, -0.07835542, 0, 0, 0, 1, 1,
-0.5157676, -0.6571748, -1.48008, 0, 0, 0, 1, 1,
-0.5154842, -0.9391115, -2.679428, 0, 0, 0, 1, 1,
-0.5137912, -1.633275, -2.18496, 0, 0, 0, 1, 1,
-0.5133112, -0.9464688, -1.967542, 0, 0, 0, 1, 1,
-0.5103671, 1.124859, -0.6925952, 0, 0, 0, 1, 1,
-0.5081472, -0.5298694, -3.098099, 0, 0, 0, 1, 1,
-0.5070522, 0.3035817, 0.1481415, 1, 1, 1, 1, 1,
-0.5042146, -0.9182958, -2.593892, 1, 1, 1, 1, 1,
-0.4966885, -1.694924, -2.124609, 1, 1, 1, 1, 1,
-0.4829841, -0.9937659, -2.343349, 1, 1, 1, 1, 1,
-0.4828998, 0.4762563, 0.2065285, 1, 1, 1, 1, 1,
-0.4805447, -0.1788089, -1.870206, 1, 1, 1, 1, 1,
-0.4795247, 0.350361, -1.653785, 1, 1, 1, 1, 1,
-0.478181, -1.009401, -1.966256, 1, 1, 1, 1, 1,
-0.4775013, 0.8853414, -0.07692202, 1, 1, 1, 1, 1,
-0.4755964, 0.182332, 0.2238334, 1, 1, 1, 1, 1,
-0.4743862, -0.868344, -1.959219, 1, 1, 1, 1, 1,
-0.4725534, 1.83944, -1.528007, 1, 1, 1, 1, 1,
-0.4678834, 0.7418503, -0.3126663, 1, 1, 1, 1, 1,
-0.4659634, -0.08485027, -2.147899, 1, 1, 1, 1, 1,
-0.4649104, 1.547638, 0.07271067, 1, 1, 1, 1, 1,
-0.462552, 0.1245686, -2.117362, 0, 0, 1, 1, 1,
-0.4619478, -0.8454731, -2.314188, 1, 0, 0, 1, 1,
-0.452879, 1.833634, -0.4391052, 1, 0, 0, 1, 1,
-0.4512752, -0.1485753, -0.1963155, 1, 0, 0, 1, 1,
-0.4497135, -0.3995909, -3.539106, 1, 0, 0, 1, 1,
-0.443146, -1.435728, -3.005974, 1, 0, 0, 1, 1,
-0.4401012, 0.4006151, -0.6699156, 0, 0, 0, 1, 1,
-0.4308306, 1.55793, 1.527752, 0, 0, 0, 1, 1,
-0.424114, -0.6963359, -0.5899258, 0, 0, 0, 1, 1,
-0.4195182, 0.3397239, -2.063512, 0, 0, 0, 1, 1,
-0.4165093, 1.409951, 0.4592125, 0, 0, 0, 1, 1,
-0.4108172, 0.9468329, -1.157424, 0, 0, 0, 1, 1,
-0.4096346, 1.149097, 0.4348452, 0, 0, 0, 1, 1,
-0.4086526, -1.295242, -1.968437, 1, 1, 1, 1, 1,
-0.407845, 0.3353219, -1.177343, 1, 1, 1, 1, 1,
-0.4067355, 0.2285829, -0.4485453, 1, 1, 1, 1, 1,
-0.4047871, 1.029661, -0.4593537, 1, 1, 1, 1, 1,
-0.4041671, 1.319197, -1.564873, 1, 1, 1, 1, 1,
-0.4018075, -1.553749, -3.74032, 1, 1, 1, 1, 1,
-0.4005117, -2.102981, -3.30792, 1, 1, 1, 1, 1,
-0.3984607, -0.1955416, -2.970225, 1, 1, 1, 1, 1,
-0.3980624, 0.01675359, -2.76889, 1, 1, 1, 1, 1,
-0.3968347, -0.6788112, -2.733093, 1, 1, 1, 1, 1,
-0.3927163, 0.2645971, -0.5249594, 1, 1, 1, 1, 1,
-0.3810968, 0.5752197, -0.2525146, 1, 1, 1, 1, 1,
-0.3736717, 0.1975231, -0.5075961, 1, 1, 1, 1, 1,
-0.3734948, -1.973259, -3.144386, 1, 1, 1, 1, 1,
-0.3734681, 0.3439364, -1.885248, 1, 1, 1, 1, 1,
-0.3721843, 0.5031084, -0.51094, 0, 0, 1, 1, 1,
-0.3690647, -0.7469987, -0.9355748, 1, 0, 0, 1, 1,
-0.3687932, 1.220971, 0.1522682, 1, 0, 0, 1, 1,
-0.3676032, -0.102239, -3.377919, 1, 0, 0, 1, 1,
-0.366869, 0.7795981, -0.1442241, 1, 0, 0, 1, 1,
-0.3657392, 0.8755263, -1.446812, 1, 0, 0, 1, 1,
-0.3631371, 0.303975, -1.083095, 0, 0, 0, 1, 1,
-0.3579517, 0.732805, -0.8832765, 0, 0, 0, 1, 1,
-0.3572233, -1.876746, -5.330323, 0, 0, 0, 1, 1,
-0.3520313, -1.449055, -3.964049, 0, 0, 0, 1, 1,
-0.3502659, 0.3075496, -1.979352, 0, 0, 0, 1, 1,
-0.3501925, 0.5731359, 1.020403, 0, 0, 0, 1, 1,
-0.3446921, -1.704637, -2.729503, 0, 0, 0, 1, 1,
-0.3436305, -0.1426009, 0.371105, 1, 1, 1, 1, 1,
-0.3432138, -0.156269, -0.6861908, 1, 1, 1, 1, 1,
-0.3428307, -0.5579128, -3.637037, 1, 1, 1, 1, 1,
-0.3362864, 0.3851317, -1.26279, 1, 1, 1, 1, 1,
-0.3307697, 0.3881236, -2.224472, 1, 1, 1, 1, 1,
-0.3286911, -1.762568, -2.787919, 1, 1, 1, 1, 1,
-0.3278127, 1.618601, 0.474471, 1, 1, 1, 1, 1,
-0.3263535, -0.6366192, -4.379766, 1, 1, 1, 1, 1,
-0.3258568, 0.03553477, -0.3163839, 1, 1, 1, 1, 1,
-0.3254682, -1.540066, -2.665302, 1, 1, 1, 1, 1,
-0.3237051, -1.212983, -1.407402, 1, 1, 1, 1, 1,
-0.3212515, -0.2995397, -3.41848, 1, 1, 1, 1, 1,
-0.3184523, 2.265589, -0.6448326, 1, 1, 1, 1, 1,
-0.3140037, 0.0292719, 0.3844166, 1, 1, 1, 1, 1,
-0.3069979, 0.7514791, -2.584647, 1, 1, 1, 1, 1,
-0.305093, -0.6791453, -1.903215, 0, 0, 1, 1, 1,
-0.3049648, 0.8764622, 0.9759054, 1, 0, 0, 1, 1,
-0.3017302, 1.449368, -0.7601086, 1, 0, 0, 1, 1,
-0.3011175, 0.7216912, 1.51396, 1, 0, 0, 1, 1,
-0.2998208, 3.021726, 1.058462, 1, 0, 0, 1, 1,
-0.2968438, -0.6631594, -2.582355, 1, 0, 0, 1, 1,
-0.2955579, -0.2791188, -2.743834, 0, 0, 0, 1, 1,
-0.2937657, 0.007459502, -1.890307, 0, 0, 0, 1, 1,
-0.2899761, -0.4994313, -2.182828, 0, 0, 0, 1, 1,
-0.2887346, -0.3785422, -3.235089, 0, 0, 0, 1, 1,
-0.2868679, -0.5886853, -2.080097, 0, 0, 0, 1, 1,
-0.2839223, 0.302918, -1.174342, 0, 0, 0, 1, 1,
-0.2760767, 0.4905363, -0.9458393, 0, 0, 0, 1, 1,
-0.2737003, -0.4523571, -3.347438, 1, 1, 1, 1, 1,
-0.2722292, -1.660482, -2.508704, 1, 1, 1, 1, 1,
-0.2717456, -0.1376947, -2.945509, 1, 1, 1, 1, 1,
-0.2617885, 0.6531439, -1.193737, 1, 1, 1, 1, 1,
-0.2606766, -0.9732778, -3.398395, 1, 1, 1, 1, 1,
-0.2588747, 0.128145, -2.176597, 1, 1, 1, 1, 1,
-0.2556988, 0.7277784, 1.019887, 1, 1, 1, 1, 1,
-0.2555432, -0.2934589, -1.926648, 1, 1, 1, 1, 1,
-0.25453, 0.3316017, -0.6309495, 1, 1, 1, 1, 1,
-0.2535369, -0.1416666, -0.4781238, 1, 1, 1, 1, 1,
-0.2523804, -0.1533557, -2.09898, 1, 1, 1, 1, 1,
-0.2513529, -0.3421009, -2.021798, 1, 1, 1, 1, 1,
-0.2502099, 1.653291, -1.240925, 1, 1, 1, 1, 1,
-0.2461978, -0.09940271, -2.97995, 1, 1, 1, 1, 1,
-0.2379401, 0.7574519, -1.056615, 1, 1, 1, 1, 1,
-0.2374545, -0.6019741, -2.058758, 0, 0, 1, 1, 1,
-0.2357675, -2.402188, -2.059605, 1, 0, 0, 1, 1,
-0.23155, -0.8912694, -4.628478, 1, 0, 0, 1, 1,
-0.2299607, 0.08588488, 0.09538102, 1, 0, 0, 1, 1,
-0.2255759, -0.02445725, -1.331229, 1, 0, 0, 1, 1,
-0.2245963, 1.348379, 1.186321, 1, 0, 0, 1, 1,
-0.2234721, 1.715999, -0.1119761, 0, 0, 0, 1, 1,
-0.2229804, 0.2657215, -0.3431682, 0, 0, 0, 1, 1,
-0.2142079, -0.069942, -0.2440913, 0, 0, 0, 1, 1,
-0.2114739, 1.127031, 0.1154763, 0, 0, 0, 1, 1,
-0.2058024, -2.185319, -2.846125, 0, 0, 0, 1, 1,
-0.1998001, -0.1678147, -4.558858, 0, 0, 0, 1, 1,
-0.1987496, -0.6614175, -2.759673, 0, 0, 0, 1, 1,
-0.1944649, -0.6567976, 0.3070787, 1, 1, 1, 1, 1,
-0.1913332, -1.239004, -2.199866, 1, 1, 1, 1, 1,
-0.1893964, 0.7173254, 1.104203, 1, 1, 1, 1, 1,
-0.1836563, 0.3780848, -0.8734475, 1, 1, 1, 1, 1,
-0.180851, -0.04994179, -2.709444, 1, 1, 1, 1, 1,
-0.178465, -1.008289, -3.588396, 1, 1, 1, 1, 1,
-0.1701208, -0.007634291, -2.341558, 1, 1, 1, 1, 1,
-0.1697695, -0.9606441, -4.262846, 1, 1, 1, 1, 1,
-0.1691033, -0.5239812, -3.622766, 1, 1, 1, 1, 1,
-0.1656016, -0.2216591, -3.546388, 1, 1, 1, 1, 1,
-0.1649966, 0.09721038, -1.726162, 1, 1, 1, 1, 1,
-0.1598498, -0.9746522, -1.725401, 1, 1, 1, 1, 1,
-0.1533644, 0.3526759, 0.5150488, 1, 1, 1, 1, 1,
-0.1507141, -0.8182628, -3.478239, 1, 1, 1, 1, 1,
-0.1497159, 1.515145, -0.6071582, 1, 1, 1, 1, 1,
-0.1329243, -1.675485, -3.278602, 0, 0, 1, 1, 1,
-0.1294264, 0.2246488, -1.546364, 1, 0, 0, 1, 1,
-0.1282656, 0.7347553, 0.5696734, 1, 0, 0, 1, 1,
-0.1196753, 0.2553173, 0.03007399, 1, 0, 0, 1, 1,
-0.1187677, -1.558397, -2.08169, 1, 0, 0, 1, 1,
-0.1145203, -2.181112, -2.759736, 1, 0, 0, 1, 1,
-0.1135903, 1.051918, -0.2611411, 0, 0, 0, 1, 1,
-0.1050589, 0.3563631, 0.6853169, 0, 0, 0, 1, 1,
-0.10341, -1.052477, -1.427469, 0, 0, 0, 1, 1,
-0.1024878, -0.7461789, -3.240592, 0, 0, 0, 1, 1,
-0.1022766, 0.9792567, -0.7908116, 0, 0, 0, 1, 1,
-0.1000704, 0.1120264, -1.194178, 0, 0, 0, 1, 1,
-0.09982405, 1.417119, -0.07755951, 0, 0, 0, 1, 1,
-0.09655511, -0.4437675, -2.117322, 1, 1, 1, 1, 1,
-0.08958599, -0.9820899, -1.587644, 1, 1, 1, 1, 1,
-0.08618541, -0.5630391, -0.8820212, 1, 1, 1, 1, 1,
-0.08584543, 0.5282976, 0.3079738, 1, 1, 1, 1, 1,
-0.08548613, 0.2083744, -0.8927639, 1, 1, 1, 1, 1,
-0.08020642, -0.2048519, -2.221361, 1, 1, 1, 1, 1,
-0.07964583, -0.4568616, -2.029788, 1, 1, 1, 1, 1,
-0.07463981, 0.9608105, 1.70035, 1, 1, 1, 1, 1,
-0.07194538, -2.117291, -1.910762, 1, 1, 1, 1, 1,
-0.0677307, -0.06835824, -1.357215, 1, 1, 1, 1, 1,
-0.06414279, -0.1737118, -1.639206, 1, 1, 1, 1, 1,
-0.05484419, 0.635189, 0.3394937, 1, 1, 1, 1, 1,
-0.05444138, -2.003218, -3.596549, 1, 1, 1, 1, 1,
-0.05114737, -0.2375108, -3.595005, 1, 1, 1, 1, 1,
-0.04982679, 0.6081206, 0.6759591, 1, 1, 1, 1, 1,
-0.04832539, -0.3500522, -2.807604, 0, 0, 1, 1, 1,
-0.04782433, 0.3156888, -1.09385, 1, 0, 0, 1, 1,
-0.04647306, 1.47286, 0.4517863, 1, 0, 0, 1, 1,
-0.04564661, 1.208261, 0.0003872881, 1, 0, 0, 1, 1,
-0.03711708, -0.8013988, -4.198701, 1, 0, 0, 1, 1,
-0.03678084, -0.5960852, -1.431264, 1, 0, 0, 1, 1,
-0.03676614, 0.01106064, -0.2020685, 0, 0, 0, 1, 1,
-0.03406893, -0.87567, -3.577209, 0, 0, 0, 1, 1,
-0.03362196, -0.2738218, -4.49048, 0, 0, 0, 1, 1,
-0.03109111, -0.4049364, -4.4719, 0, 0, 0, 1, 1,
-0.03084489, 1.490466, -0.5288436, 0, 0, 0, 1, 1,
-0.02796663, -1.868605, -1.703972, 0, 0, 0, 1, 1,
-0.01728082, -1.494623, -2.244678, 0, 0, 0, 1, 1,
-0.0169534, -0.4199549, -3.018086, 1, 1, 1, 1, 1,
-0.01689045, 1.834023, -0.2696763, 1, 1, 1, 1, 1,
-0.01452698, 0.3618115, -1.373838, 1, 1, 1, 1, 1,
-0.009744531, -0.7334208, -3.033942, 1, 1, 1, 1, 1,
-0.006426719, -0.8085617, -5.015907, 1, 1, 1, 1, 1,
-0.005650223, -0.1632208, -3.066076, 1, 1, 1, 1, 1,
-0.004206506, 0.203767, 1.26482, 1, 1, 1, 1, 1,
-0.003219361, 0.8306425, -0.5566229, 1, 1, 1, 1, 1,
0.0005075358, -1.177661, 3.204821, 1, 1, 1, 1, 1,
0.0098891, -0.0005027843, 1.287049, 1, 1, 1, 1, 1,
0.01043435, 0.1477709, 0.08827345, 1, 1, 1, 1, 1,
0.01123428, 0.3526739, 1.240876, 1, 1, 1, 1, 1,
0.01856681, 1.177316, 0.6403141, 1, 1, 1, 1, 1,
0.01906545, 0.9703737, 0.329823, 1, 1, 1, 1, 1,
0.01935001, -0.1766278, 2.837817, 1, 1, 1, 1, 1,
0.02155703, 0.5455008, 0.691296, 0, 0, 1, 1, 1,
0.02250065, 0.3025455, 0.8262186, 1, 0, 0, 1, 1,
0.02314009, -1.171126, 4.174857, 1, 0, 0, 1, 1,
0.02577573, 0.4046775, 0.9267247, 1, 0, 0, 1, 1,
0.03045281, 1.446749, -0.8332701, 1, 0, 0, 1, 1,
0.03153362, 1.685388, -0.1264567, 1, 0, 0, 1, 1,
0.03351516, 0.1643106, 0.5355985, 0, 0, 0, 1, 1,
0.03478701, 0.1586297, 2.528082, 0, 0, 0, 1, 1,
0.03596797, -1.859702, 3.336383, 0, 0, 0, 1, 1,
0.03725211, 0.3259998, 1.926834, 0, 0, 0, 1, 1,
0.03833095, 0.6197048, 0.3867349, 0, 0, 0, 1, 1,
0.04139805, -0.1312562, 3.418154, 0, 0, 0, 1, 1,
0.04287842, -0.7973573, 2.061334, 0, 0, 0, 1, 1,
0.04900486, 1.183619, 0.6603656, 1, 1, 1, 1, 1,
0.04953092, 1.037075, -1.415487, 1, 1, 1, 1, 1,
0.05166412, 0.401192, 0.3033423, 1, 1, 1, 1, 1,
0.06292001, -0.0684853, 1.277444, 1, 1, 1, 1, 1,
0.06471925, -0.5607375, 3.901473, 1, 1, 1, 1, 1,
0.07070848, -0.5523196, 4.521345, 1, 1, 1, 1, 1,
0.07408883, 1.611048, 0.41659, 1, 1, 1, 1, 1,
0.07957963, -0.438241, 4.825041, 1, 1, 1, 1, 1,
0.080011, -0.435785, 2.881505, 1, 1, 1, 1, 1,
0.08080955, 0.3998201, 0.5488237, 1, 1, 1, 1, 1,
0.08184557, 0.8508668, 0.1938848, 1, 1, 1, 1, 1,
0.0830208, 0.1522897, 0.260821, 1, 1, 1, 1, 1,
0.08304432, 0.7814635, -0.1969069, 1, 1, 1, 1, 1,
0.09507416, 3.400248e-05, -0.5325527, 1, 1, 1, 1, 1,
0.1004061, 0.1300115, 0.7516356, 1, 1, 1, 1, 1,
0.1014534, 0.655741, 2.404814, 0, 0, 1, 1, 1,
0.1083548, 0.09579296, 0.7890145, 1, 0, 0, 1, 1,
0.1106274, -1.095904, 0.9183538, 1, 0, 0, 1, 1,
0.1122982, 0.5515321, 0.3470949, 1, 0, 0, 1, 1,
0.1133342, 0.2630387, 1.407984, 1, 0, 0, 1, 1,
0.1142189, -0.3438956, 3.109742, 1, 0, 0, 1, 1,
0.1150094, -1.392046, 2.695798, 0, 0, 0, 1, 1,
0.1173413, -0.428057, 3.728698, 0, 0, 0, 1, 1,
0.1182937, -0.6237722, 3.780993, 0, 0, 0, 1, 1,
0.1187783, -0.02707504, 2.593658, 0, 0, 0, 1, 1,
0.1188583, 1.788571, -0.6203347, 0, 0, 0, 1, 1,
0.122529, 0.01027918, -0.1604975, 0, 0, 0, 1, 1,
0.12369, -0.9267728, 2.906292, 0, 0, 0, 1, 1,
0.1263801, 0.1757088, 0.2890605, 1, 1, 1, 1, 1,
0.1264434, -0.9179537, 2.969387, 1, 1, 1, 1, 1,
0.1305153, 1.699705, 2.219503, 1, 1, 1, 1, 1,
0.1342106, 0.1400974, 1.083124, 1, 1, 1, 1, 1,
0.134917, 0.01252776, 0.4174263, 1, 1, 1, 1, 1,
0.13576, -1.407519, 4.457789, 1, 1, 1, 1, 1,
0.139227, 0.5662886, -0.9154359, 1, 1, 1, 1, 1,
0.1453726, 0.6503394, 0.6810895, 1, 1, 1, 1, 1,
0.1458729, -0.8093299, 3.646139, 1, 1, 1, 1, 1,
0.1469992, -0.2938563, 2.037452, 1, 1, 1, 1, 1,
0.1508256, 1.3146, 0.9823233, 1, 1, 1, 1, 1,
0.1516679, -1.798647, 3.648775, 1, 1, 1, 1, 1,
0.153922, -0.7479231, 4.118429, 1, 1, 1, 1, 1,
0.1550379, -1.915883, 3.421639, 1, 1, 1, 1, 1,
0.1558997, -0.6584438, 3.15491, 1, 1, 1, 1, 1,
0.1604291, -0.08763383, 2.08712, 0, 0, 1, 1, 1,
0.1626399, -0.5371241, 2.472806, 1, 0, 0, 1, 1,
0.1643009, 0.2402909, 0.1935809, 1, 0, 0, 1, 1,
0.168013, 1.06318, 1.300996, 1, 0, 0, 1, 1,
0.1687045, -2.239844, 3.681487, 1, 0, 0, 1, 1,
0.1706594, -0.5917574, 1.621969, 1, 0, 0, 1, 1,
0.170948, -1.155149, 3.644895, 0, 0, 0, 1, 1,
0.1721105, -0.6085154, 4.102625, 0, 0, 0, 1, 1,
0.1748113, -0.5054108, 1.983354, 0, 0, 0, 1, 1,
0.1754633, 0.6198763, 0.8137421, 0, 0, 0, 1, 1,
0.1764417, 1.823671, -0.2691678, 0, 0, 0, 1, 1,
0.1769792, -0.444419, 3.367559, 0, 0, 0, 1, 1,
0.1803033, 0.729512, 0.1499741, 0, 0, 0, 1, 1,
0.1838182, -1.003536, 3.906063, 1, 1, 1, 1, 1,
0.1847451, -0.6792769, 2.424908, 1, 1, 1, 1, 1,
0.1850513, 0.8295162, 1.544364, 1, 1, 1, 1, 1,
0.1853021, 0.07351921, 0.5794667, 1, 1, 1, 1, 1,
0.1859069, -0.2262861, 3.235002, 1, 1, 1, 1, 1,
0.1865951, 1.236469, -0.6931478, 1, 1, 1, 1, 1,
0.1889814, -0.4691028, 0.731178, 1, 1, 1, 1, 1,
0.1953638, -1.855705, 1.644287, 1, 1, 1, 1, 1,
0.1966239, -1.263922, 1.981157, 1, 1, 1, 1, 1,
0.2041245, -0.05847846, 1.667779, 1, 1, 1, 1, 1,
0.2047037, 0.336135, 0.2307659, 1, 1, 1, 1, 1,
0.2111491, 1.035821, -0.3258473, 1, 1, 1, 1, 1,
0.211668, 2.189534, 1.001042, 1, 1, 1, 1, 1,
0.2235794, -1.189596, 3.780549, 1, 1, 1, 1, 1,
0.2273226, 0.7694094, 0.9227824, 1, 1, 1, 1, 1,
0.2300373, 0.1034934, 0.739834, 0, 0, 1, 1, 1,
0.2311385, -0.8173576, 1.914585, 1, 0, 0, 1, 1,
0.2314588, -0.8812886, 3.216697, 1, 0, 0, 1, 1,
0.2315445, 0.7531133, 0.4091508, 1, 0, 0, 1, 1,
0.2337245, 0.04844736, 1.531495, 1, 0, 0, 1, 1,
0.2382088, -0.5658755, 2.614182, 1, 0, 0, 1, 1,
0.240702, -0.1862047, 1.844466, 0, 0, 0, 1, 1,
0.2416237, -0.6069258, 3.297884, 0, 0, 0, 1, 1,
0.2425121, -0.4208656, 2.538151, 0, 0, 0, 1, 1,
0.2473896, -0.1066927, 0.773262, 0, 0, 0, 1, 1,
0.2515414, -0.5193148, 0.9730123, 0, 0, 0, 1, 1,
0.2542964, -0.385311, 2.189078, 0, 0, 0, 1, 1,
0.2552489, -0.4395896, 1.900223, 0, 0, 0, 1, 1,
0.2567878, -0.2729376, 0.9157034, 1, 1, 1, 1, 1,
0.2588898, 0.81923, 0.1663934, 1, 1, 1, 1, 1,
0.2603467, 0.3650197, 0.5362838, 1, 1, 1, 1, 1,
0.2605605, -0.5048727, 2.420419, 1, 1, 1, 1, 1,
0.2643794, -1.853689, 3.720561, 1, 1, 1, 1, 1,
0.2722219, 0.197565, 1.204138, 1, 1, 1, 1, 1,
0.2737737, 0.7174609, -0.03682665, 1, 1, 1, 1, 1,
0.2786884, 0.007242155, 0.5097198, 1, 1, 1, 1, 1,
0.2862515, 0.5079759, 0.5934619, 1, 1, 1, 1, 1,
0.2881144, -1.171246, 3.720305, 1, 1, 1, 1, 1,
0.2881923, -0.8991077, 3.032798, 1, 1, 1, 1, 1,
0.2901365, -1.078491, 2.29629, 1, 1, 1, 1, 1,
0.2927015, 1.725099, -0.04820678, 1, 1, 1, 1, 1,
0.2943965, 0.8385025, 1.006874, 1, 1, 1, 1, 1,
0.2958294, 1.096802, 0.3534142, 1, 1, 1, 1, 1,
0.2962578, -0.2093673, 1.465468, 0, 0, 1, 1, 1,
0.2967944, -0.06565173, 3.412513, 1, 0, 0, 1, 1,
0.2989659, 0.7891765, 0.6299092, 1, 0, 0, 1, 1,
0.3005297, 1.074321, 1.852839, 1, 0, 0, 1, 1,
0.309072, 1.10955, 1.426864, 1, 0, 0, 1, 1,
0.3101754, 1.307201, -2.508337, 1, 0, 0, 1, 1,
0.3144799, 0.4849436, 0.97206, 0, 0, 0, 1, 1,
0.3166262, -0.03631037, 1.619072, 0, 0, 0, 1, 1,
0.3198009, 0.6891583, -0.804414, 0, 0, 0, 1, 1,
0.3203731, -0.2473733, 2.470005, 0, 0, 0, 1, 1,
0.3218403, -1.310121, 3.493256, 0, 0, 0, 1, 1,
0.3301694, 0.4978215, 0.4589287, 0, 0, 0, 1, 1,
0.335041, -0.006340727, 2.941586, 0, 0, 0, 1, 1,
0.3353395, 1.011551, -0.4320732, 1, 1, 1, 1, 1,
0.3371608, 0.2918113, 0.7905301, 1, 1, 1, 1, 1,
0.3438688, -0.9281414, 3.461127, 1, 1, 1, 1, 1,
0.3449003, 0.7229515, 0.4895351, 1, 1, 1, 1, 1,
0.3475021, 0.2381578, 2.79466, 1, 1, 1, 1, 1,
0.3480167, 0.7899534, 1.372705, 1, 1, 1, 1, 1,
0.3512666, -0.2396734, 2.246429, 1, 1, 1, 1, 1,
0.3519112, 0.3608468, -0.575828, 1, 1, 1, 1, 1,
0.3521138, 1.588501, 0.1071103, 1, 1, 1, 1, 1,
0.3533928, -0.7264789, 2.558222, 1, 1, 1, 1, 1,
0.3540412, -1.417582, 1.392571, 1, 1, 1, 1, 1,
0.3606839, -1.325407, 4.920413, 1, 1, 1, 1, 1,
0.3615626, -0.02836388, 2.467611, 1, 1, 1, 1, 1,
0.362052, 0.8526204, 1.541646, 1, 1, 1, 1, 1,
0.3633217, -1.265744, 4.1677, 1, 1, 1, 1, 1,
0.3636206, 0.8205683, -1.496697, 0, 0, 1, 1, 1,
0.3701302, 1.223047, -0.2830837, 1, 0, 0, 1, 1,
0.3715235, -0.5923496, 3.206552, 1, 0, 0, 1, 1,
0.3753247, 1.504072, -0.8237278, 1, 0, 0, 1, 1,
0.3812396, -0.01032872, 1.096822, 1, 0, 0, 1, 1,
0.3842043, 0.2691681, 1.899569, 1, 0, 0, 1, 1,
0.3936152, -0.2006335, 2.053344, 0, 0, 0, 1, 1,
0.3960613, 0.8294338, 0.8419848, 0, 0, 0, 1, 1,
0.3999274, 1.071255, 0.5123167, 0, 0, 0, 1, 1,
0.4045626, 0.07119265, 1.881786, 0, 0, 0, 1, 1,
0.4082305, -1.277887, 3.48592, 0, 0, 0, 1, 1,
0.4096876, -0.9076561, 5.335875, 0, 0, 0, 1, 1,
0.4098435, 1.550884, 0.6968817, 0, 0, 0, 1, 1,
0.4116523, 0.5182132, 0.4664227, 1, 1, 1, 1, 1,
0.4147291, -1.293092, 2.998923, 1, 1, 1, 1, 1,
0.4197071, -0.7656682, 2.653976, 1, 1, 1, 1, 1,
0.4201712, -0.8982139, 2.768727, 1, 1, 1, 1, 1,
0.4232467, -0.4631551, 1.537702, 1, 1, 1, 1, 1,
0.4254505, 0.4393328, 1.460931, 1, 1, 1, 1, 1,
0.4275938, -0.4893328, 2.515467, 1, 1, 1, 1, 1,
0.428941, 0.9166886, 0.5419421, 1, 1, 1, 1, 1,
0.4330544, -0.8193893, 2.19499, 1, 1, 1, 1, 1,
0.437679, -0.4697735, 2.48559, 1, 1, 1, 1, 1,
0.4393517, 0.5166693, 1.661461, 1, 1, 1, 1, 1,
0.4445027, 0.1030246, 1.177547, 1, 1, 1, 1, 1,
0.4449406, 0.210525, 0.2103713, 1, 1, 1, 1, 1,
0.4479968, -0.1565237, 3.664057, 1, 1, 1, 1, 1,
0.4490293, 0.3514343, 1.984467, 1, 1, 1, 1, 1,
0.4518014, -0.7178586, 2.819357, 0, 0, 1, 1, 1,
0.4530906, 0.4999792, 1.813437, 1, 0, 0, 1, 1,
0.4571719, 0.720543, -1.469781, 1, 0, 0, 1, 1,
0.4573273, 1.212079, 0.409939, 1, 0, 0, 1, 1,
0.4589471, -0.190064, 1.418318, 1, 0, 0, 1, 1,
0.4609558, -0.3971447, 0.7302068, 1, 0, 0, 1, 1,
0.462785, -0.1757013, 1.344176, 0, 0, 0, 1, 1,
0.4628994, -0.1776351, 2.642951, 0, 0, 0, 1, 1,
0.4638768, 0.05850743, 1.555909, 0, 0, 0, 1, 1,
0.4651192, -0.4159716, 2.798048, 0, 0, 0, 1, 1,
0.4656581, -1.093996, 3.41946, 0, 0, 0, 1, 1,
0.4695027, -0.5728608, 3.902915, 0, 0, 0, 1, 1,
0.4726066, 2.121008, 2.434219, 0, 0, 0, 1, 1,
0.4742224, 0.1039177, 2.494975, 1, 1, 1, 1, 1,
0.4825563, -2.013767, 1.305113, 1, 1, 1, 1, 1,
0.4928302, 3.394062, -0.4553702, 1, 1, 1, 1, 1,
0.4942735, 0.5156927, 2.540711, 1, 1, 1, 1, 1,
0.4947047, -1.810933, 1.3958, 1, 1, 1, 1, 1,
0.4948677, -0.3831897, 0.9865739, 1, 1, 1, 1, 1,
0.4997673, -2.353156, 2.141515, 1, 1, 1, 1, 1,
0.5051073, 2.041286, 0.8738868, 1, 1, 1, 1, 1,
0.5136477, 1.557306, 0.5090985, 1, 1, 1, 1, 1,
0.5145466, -0.288142, 5.04489, 1, 1, 1, 1, 1,
0.519262, 0.5908222, -0.0834659, 1, 1, 1, 1, 1,
0.5196692, 0.4942911, 0.5041818, 1, 1, 1, 1, 1,
0.5207829, 0.2325589, 1.721239, 1, 1, 1, 1, 1,
0.521584, -0.1617661, 2.779179, 1, 1, 1, 1, 1,
0.5222753, -1.270164, 1.738794, 1, 1, 1, 1, 1,
0.5229941, -0.004204125, 1.559772, 0, 0, 1, 1, 1,
0.5238675, 1.43699, 2.059674, 1, 0, 0, 1, 1,
0.5295174, -0.09959297, 1.879474, 1, 0, 0, 1, 1,
0.5326948, -0.2602733, 1.224013, 1, 0, 0, 1, 1,
0.532735, -0.8076399, 2.787208, 1, 0, 0, 1, 1,
0.5519087, 0.3818619, 1.566697, 1, 0, 0, 1, 1,
0.5521423, -1.856389, 1.704637, 0, 0, 0, 1, 1,
0.5521597, 0.7236195, 1.512073, 0, 0, 0, 1, 1,
0.5555217, 0.9544324, 0.9056334, 0, 0, 0, 1, 1,
0.5604655, -0.8834188, 2.757495, 0, 0, 0, 1, 1,
0.5628838, -0.2520022, 3.716184, 0, 0, 0, 1, 1,
0.5629645, -0.5594724, 1.731657, 0, 0, 0, 1, 1,
0.5653568, 0.9103462, 1.683961, 0, 0, 0, 1, 1,
0.56541, 0.4758314, -0.3316453, 1, 1, 1, 1, 1,
0.5672398, -0.3455512, 0.204384, 1, 1, 1, 1, 1,
0.5755706, -1.737866, 4.359498, 1, 1, 1, 1, 1,
0.5818815, -0.07723597, 1.917109, 1, 1, 1, 1, 1,
0.5828025, -1.002351, 1.598572, 1, 1, 1, 1, 1,
0.587818, 0.3531883, 0.691522, 1, 1, 1, 1, 1,
0.5883209, -0.3853839, 2.001074, 1, 1, 1, 1, 1,
0.5887403, -0.4321487, 1.256617, 1, 1, 1, 1, 1,
0.5889125, -0.08144037, 2.308295, 1, 1, 1, 1, 1,
0.5892026, 0.7390375, 0.6102414, 1, 1, 1, 1, 1,
0.5909608, -0.6756127, 1.819816, 1, 1, 1, 1, 1,
0.5935078, 0.1222835, -0.01317038, 1, 1, 1, 1, 1,
0.594054, -0.8743549, 3.463264, 1, 1, 1, 1, 1,
0.5976374, 0.3284706, -0.3342187, 1, 1, 1, 1, 1,
0.598856, -0.09979781, 3.444556, 1, 1, 1, 1, 1,
0.6052567, 1.261393, -1.085953, 0, 0, 1, 1, 1,
0.6072824, 1.224611, 0.08976737, 1, 0, 0, 1, 1,
0.6090565, -0.7840679, 2.592549, 1, 0, 0, 1, 1,
0.6103345, 0.1164763, 2.28969, 1, 0, 0, 1, 1,
0.6122608, 0.3115172, 1.44018, 1, 0, 0, 1, 1,
0.620452, 0.2705137, 1.763504, 1, 0, 0, 1, 1,
0.6213151, 0.03864241, 0.7359532, 0, 0, 0, 1, 1,
0.6272478, 2.317608, -1.227754, 0, 0, 0, 1, 1,
0.6279707, -1.374451, 2.035228, 0, 0, 0, 1, 1,
0.6341158, 0.961992, -0.08387842, 0, 0, 0, 1, 1,
0.6387901, 0.5933563, 2.456064, 0, 0, 0, 1, 1,
0.6413792, 1.087203, 1.189936, 0, 0, 0, 1, 1,
0.643742, -0.3509712, 2.089634, 0, 0, 0, 1, 1,
0.6512731, -1.094211, 4.635628, 1, 1, 1, 1, 1,
0.6526822, -1.113865, 2.107782, 1, 1, 1, 1, 1,
0.6557736, -1.277166, 4.00985, 1, 1, 1, 1, 1,
0.6585494, -0.6060275, 2.559418, 1, 1, 1, 1, 1,
0.6593713, 1.102987, 0.141726, 1, 1, 1, 1, 1,
0.6606027, -0.8715715, 2.953221, 1, 1, 1, 1, 1,
0.6705213, -1.174792, 2.23645, 1, 1, 1, 1, 1,
0.673374, -1.129846, 2.998113, 1, 1, 1, 1, 1,
0.6738918, -0.7074014, 3.668198, 1, 1, 1, 1, 1,
0.6755259, -0.294987, 1.745908, 1, 1, 1, 1, 1,
0.6765288, -0.8506657, 1.011687, 1, 1, 1, 1, 1,
0.6765931, -1.143896, 2.356291, 1, 1, 1, 1, 1,
0.6799706, -0.07694385, 1.479731, 1, 1, 1, 1, 1,
0.681083, 0.7950127, -1.248921, 1, 1, 1, 1, 1,
0.6871147, -0.7318563, 2.523661, 1, 1, 1, 1, 1,
0.687452, -0.3715202, 1.317023, 0, 0, 1, 1, 1,
0.690699, -0.2955756, 1.5826, 1, 0, 0, 1, 1,
0.6921782, -0.6483821, 2.849738, 1, 0, 0, 1, 1,
0.6932558, -1.413694, 3.636359, 1, 0, 0, 1, 1,
0.6945299, -1.002746, 2.911559, 1, 0, 0, 1, 1,
0.7005712, -1.019107, 1.238844, 1, 0, 0, 1, 1,
0.7056232, 0.7149268, 0.1609251, 0, 0, 0, 1, 1,
0.7070068, -0.9736617, 4.921598, 0, 0, 0, 1, 1,
0.7120413, -0.8552254, 3.559361, 0, 0, 0, 1, 1,
0.7156184, 0.2979957, 1.212468, 0, 0, 0, 1, 1,
0.7248366, -0.9730672, 2.806497, 0, 0, 0, 1, 1,
0.7253662, -1.377011, 3.045228, 0, 0, 0, 1, 1,
0.7271063, -0.952089, 4.701075, 0, 0, 0, 1, 1,
0.7291208, -0.1945176, 2.165177, 1, 1, 1, 1, 1,
0.7383256, 0.7844594, -0.1675092, 1, 1, 1, 1, 1,
0.741165, -0.01002945, 0.9121963, 1, 1, 1, 1, 1,
0.7415588, 0.4278448, -0.3441663, 1, 1, 1, 1, 1,
0.7435101, 0.3276984, 0.9486939, 1, 1, 1, 1, 1,
0.7486203, 1.484854, -0.441699, 1, 1, 1, 1, 1,
0.7649742, 0.2886855, 3.0163, 1, 1, 1, 1, 1,
0.7668162, 0.03104634, 3.076428, 1, 1, 1, 1, 1,
0.7685015, 0.2679022, 1.740068, 1, 1, 1, 1, 1,
0.7697275, 0.2519433, 2.474891, 1, 1, 1, 1, 1,
0.7764505, 2.76702, -1.183288, 1, 1, 1, 1, 1,
0.7775908, 1.702721, 0.5792251, 1, 1, 1, 1, 1,
0.7822109, 0.1148591, 1.320094, 1, 1, 1, 1, 1,
0.7851264, -0.1010783, 2.794638, 1, 1, 1, 1, 1,
0.7854281, -0.4678891, 1.318339, 1, 1, 1, 1, 1,
0.7998947, -2.5323, 1.586866, 0, 0, 1, 1, 1,
0.8067768, -0.5411242, 2.516299, 1, 0, 0, 1, 1,
0.8095497, -1.826057, 2.030055, 1, 0, 0, 1, 1,
0.816602, 0.3624632, 0.7537618, 1, 0, 0, 1, 1,
0.8268028, 0.7932679, 2.577041, 1, 0, 0, 1, 1,
0.8293501, 1.972502, 1.674551, 1, 0, 0, 1, 1,
0.8337918, 2.484512, -1.707324, 0, 0, 0, 1, 1,
0.8373893, -1.642426, 1.74647, 0, 0, 0, 1, 1,
0.8415317, -0.2878725, 3.730954, 0, 0, 0, 1, 1,
0.8439077, -0.7829106, 0.9909711, 0, 0, 0, 1, 1,
0.8447524, -1.741433, 3.103977, 0, 0, 0, 1, 1,
0.8517693, 0.3468481, 1.688318, 0, 0, 0, 1, 1,
0.8557135, -1.366703, 2.487193, 0, 0, 0, 1, 1,
0.8570417, 0.9413413, -0.2671122, 1, 1, 1, 1, 1,
0.8631238, -0.4656493, 2.213778, 1, 1, 1, 1, 1,
0.864203, 1.163287, 0.5842854, 1, 1, 1, 1, 1,
0.8714675, 0.09352513, 0.5783432, 1, 1, 1, 1, 1,
0.8737401, -1.746676, 2.340234, 1, 1, 1, 1, 1,
0.879751, -1.680071, 0.5798535, 1, 1, 1, 1, 1,
0.8963608, -0.8958272, 2.252836, 1, 1, 1, 1, 1,
0.8973614, -0.7567893, 2.04286, 1, 1, 1, 1, 1,
0.9065994, 0.3334988, 1.387355, 1, 1, 1, 1, 1,
0.9098948, -1.862175, 2.346837, 1, 1, 1, 1, 1,
0.9162726, -1.41999, 2.764368, 1, 1, 1, 1, 1,
0.9179279, -0.1340578, 2.110281, 1, 1, 1, 1, 1,
0.9213434, -0.4030187, 0.8703377, 1, 1, 1, 1, 1,
0.9221334, -1.831995, 3.061293, 1, 1, 1, 1, 1,
0.9285693, 0.1046963, 3.030555, 1, 1, 1, 1, 1,
0.9340957, -0.2525593, 3.631752, 0, 0, 1, 1, 1,
0.9359474, 0.1688977, 1.041626, 1, 0, 0, 1, 1,
0.9385249, 0.440322, 2.051951, 1, 0, 0, 1, 1,
0.9476225, -1.506392, 0.6269868, 1, 0, 0, 1, 1,
0.9476281, -0.3568522, 2.882694, 1, 0, 0, 1, 1,
0.9486735, -0.3286211, 1.904662, 1, 0, 0, 1, 1,
0.9510953, 0.05788424, 1.333279, 0, 0, 0, 1, 1,
0.9532506, -1.508234, 2.996575, 0, 0, 0, 1, 1,
0.9648205, -1.010925, 2.09031, 0, 0, 0, 1, 1,
0.9690238, -0.6402652, 2.120575, 0, 0, 0, 1, 1,
0.9738867, -1.554524, 1.229605, 0, 0, 0, 1, 1,
0.9762789, -0.2374838, 2.472808, 0, 0, 0, 1, 1,
0.9835365, 0.9848039, 1.987763, 0, 0, 0, 1, 1,
0.9914296, -0.08998352, 1.793798, 1, 1, 1, 1, 1,
0.9918742, -0.2574096, 1.753783, 1, 1, 1, 1, 1,
0.998501, -0.7011424, 1.654576, 1, 1, 1, 1, 1,
1.002775, 0.2075895, 1.390612, 1, 1, 1, 1, 1,
1.010882, 0.4479574, 0.998553, 1, 1, 1, 1, 1,
1.014806, 0.3061462, 2.232558, 1, 1, 1, 1, 1,
1.015906, 0.5206951, 0.9130213, 1, 1, 1, 1, 1,
1.021709, -0.6082105, 2.034856, 1, 1, 1, 1, 1,
1.023772, -2.090433, 2.487316, 1, 1, 1, 1, 1,
1.028929, 0.08878989, 2.573345, 1, 1, 1, 1, 1,
1.031494, -0.9962422, 2.83832, 1, 1, 1, 1, 1,
1.035529, -0.7119309, 0.733755, 1, 1, 1, 1, 1,
1.03829, 0.3976373, -0.1428403, 1, 1, 1, 1, 1,
1.043438, 0.3093216, 1.548344, 1, 1, 1, 1, 1,
1.046278, -0.3570514, 0.8909645, 1, 1, 1, 1, 1,
1.046592, 0.3841013, -0.4844861, 0, 0, 1, 1, 1,
1.049311, 0.07350038, 3.657726, 1, 0, 0, 1, 1,
1.052243, -0.2126437, 1.421051, 1, 0, 0, 1, 1,
1.052419, -0.2487736, 1.297473, 1, 0, 0, 1, 1,
1.055315, 1.071334, 1.659786, 1, 0, 0, 1, 1,
1.063561, -0.4980444, 1.03349, 1, 0, 0, 1, 1,
1.065203, 0.9670715, -0.6206599, 0, 0, 0, 1, 1,
1.06778, -0.515902, 0.0726425, 0, 0, 0, 1, 1,
1.073829, 0.4261726, -0.9092873, 0, 0, 0, 1, 1,
1.078951, 0.6140503, 1.364672, 0, 0, 0, 1, 1,
1.079215, -0.8986109, 3.339673, 0, 0, 0, 1, 1,
1.087073, -0.9948725, 2.399262, 0, 0, 0, 1, 1,
1.090749, -0.9781799, 0.7631894, 0, 0, 0, 1, 1,
1.094646, -1.690533, 2.54198, 1, 1, 1, 1, 1,
1.099999, -1.803098, 2.262523, 1, 1, 1, 1, 1,
1.107424, 0.9975938, 0.2074288, 1, 1, 1, 1, 1,
1.111656, -0.305656, 3.838259, 1, 1, 1, 1, 1,
1.112549, 0.2609174, 2.376853, 1, 1, 1, 1, 1,
1.118488, -1.000293, 2.628018, 1, 1, 1, 1, 1,
1.119055, -1.345647, 3.020699, 1, 1, 1, 1, 1,
1.123499, 0.5058967, 0.1739103, 1, 1, 1, 1, 1,
1.124837, -0.9332451, 1.43607, 1, 1, 1, 1, 1,
1.136465, -0.5806902, 1.067952, 1, 1, 1, 1, 1,
1.140554, -1.661937, 2.806648, 1, 1, 1, 1, 1,
1.154798, 0.4113873, 0.07938573, 1, 1, 1, 1, 1,
1.161373, 0.07603361, 1.692147, 1, 1, 1, 1, 1,
1.169408, 0.8948947, 1.862359, 1, 1, 1, 1, 1,
1.176228, 0.2989656, 1.97856, 1, 1, 1, 1, 1,
1.17917, -0.8857841, 2.73407, 0, 0, 1, 1, 1,
1.181805, -0.5819001, 3.223401, 1, 0, 0, 1, 1,
1.190223, 0.6420674, 1.647671, 1, 0, 0, 1, 1,
1.197003, 0.668916, -0.9239562, 1, 0, 0, 1, 1,
1.20624, 1.14132, 1.125451, 1, 0, 0, 1, 1,
1.217123, 1.244837, 2.372943, 1, 0, 0, 1, 1,
1.219056, -0.6621097, 2.480989, 0, 0, 0, 1, 1,
1.220979, -1.180653, 1.632776, 0, 0, 0, 1, 1,
1.223348, 0.9686472, 2.097417, 0, 0, 0, 1, 1,
1.226972, 0.5255929, 1.252116, 0, 0, 0, 1, 1,
1.227308, 0.1070076, 0.1892877, 0, 0, 0, 1, 1,
1.237835, 0.5971665, -0.7350993, 0, 0, 0, 1, 1,
1.238924, -0.2303548, 1.976017, 0, 0, 0, 1, 1,
1.248354, 0.2711791, 1.06419, 1, 1, 1, 1, 1,
1.252413, -0.3187769, 2.523761, 1, 1, 1, 1, 1,
1.254068, 0.04993875, -1.326647, 1, 1, 1, 1, 1,
1.268275, -0.5541843, 2.391806, 1, 1, 1, 1, 1,
1.273551, -1.091014, 1.265076, 1, 1, 1, 1, 1,
1.275357, -0.3871921, 1.182426, 1, 1, 1, 1, 1,
1.276532, -1.535022, 1.914162, 1, 1, 1, 1, 1,
1.280915, -1.144005, 1.827534, 1, 1, 1, 1, 1,
1.282416, -0.2808132, 2.35548, 1, 1, 1, 1, 1,
1.287987, -0.3630103, 1.711843, 1, 1, 1, 1, 1,
1.290781, -0.3766821, 3.81924, 1, 1, 1, 1, 1,
1.291244, 0.1885139, 1.083362, 1, 1, 1, 1, 1,
1.292024, -0.326288, 1.609035, 1, 1, 1, 1, 1,
1.305928, 0.3974816, 1.808483, 1, 1, 1, 1, 1,
1.309985, 0.1333495, 0.3802946, 1, 1, 1, 1, 1,
1.315405, 1.4466, 0.6779981, 0, 0, 1, 1, 1,
1.320172, -1.033577, 1.667783, 1, 0, 0, 1, 1,
1.329769, 1.868428, -0.1729422, 1, 0, 0, 1, 1,
1.33026, 0.09629494, 1.045457, 1, 0, 0, 1, 1,
1.332221, 0.872715, 1.001467, 1, 0, 0, 1, 1,
1.332795, 0.5341175, 2.258789, 1, 0, 0, 1, 1,
1.333236, 0.6289414, 2.156654, 0, 0, 0, 1, 1,
1.339748, 1.638847, 1.394244, 0, 0, 0, 1, 1,
1.34404, 0.3112098, 0.1595908, 0, 0, 0, 1, 1,
1.353629, 0.8854018, -0.2695116, 0, 0, 0, 1, 1,
1.356751, -0.2681414, 1.338, 0, 0, 0, 1, 1,
1.364487, -0.5160779, 2.011012, 0, 0, 0, 1, 1,
1.373697, -0.6095637, 0.2922262, 0, 0, 0, 1, 1,
1.38049, -0.3589575, 2.354861, 1, 1, 1, 1, 1,
1.389636, 0.4526122, 1.579104, 1, 1, 1, 1, 1,
1.402722, 0.9647806, 0.3621125, 1, 1, 1, 1, 1,
1.40395, -0.433745, 1.168592, 1, 1, 1, 1, 1,
1.405475, 0.2779778, 1.266463, 1, 1, 1, 1, 1,
1.415684, 0.8503788, 0.09214662, 1, 1, 1, 1, 1,
1.418927, 0.4788381, 1.051589, 1, 1, 1, 1, 1,
1.418945, 2.331193, 2.351134, 1, 1, 1, 1, 1,
1.421841, -0.2129483, 1.763847, 1, 1, 1, 1, 1,
1.423393, -1.16996, 1.984752, 1, 1, 1, 1, 1,
1.427835, -1.005468, 3.445057, 1, 1, 1, 1, 1,
1.443964, 2.185943, -0.02847972, 1, 1, 1, 1, 1,
1.445727, 1.563581, -0.2494743, 1, 1, 1, 1, 1,
1.450117, -0.1322685, 0.09599982, 1, 1, 1, 1, 1,
1.480005, -1.41908, 3.044598, 1, 1, 1, 1, 1,
1.480738, 0.9041796, 0.2319623, 0, 0, 1, 1, 1,
1.489101, 1.008517, 2.201019, 1, 0, 0, 1, 1,
1.496066, -0.6846857, 1.643766, 1, 0, 0, 1, 1,
1.502301, -1.291333, 3.038688, 1, 0, 0, 1, 1,
1.505633, 0.3905224, -0.03141689, 1, 0, 0, 1, 1,
1.505795, -1.009566, 1.676148, 1, 0, 0, 1, 1,
1.510319, -0.3259121, 2.66534, 0, 0, 0, 1, 1,
1.530075, 2.028952, 1.382773, 0, 0, 0, 1, 1,
1.534695, 1.502245, 0.5176455, 0, 0, 0, 1, 1,
1.541852, -1.104198, 2.282283, 0, 0, 0, 1, 1,
1.551096, 1.593026, 1.001886, 0, 0, 0, 1, 1,
1.563521, -0.1473842, 0.6138482, 0, 0, 0, 1, 1,
1.564026, 1.041505, 0.2093601, 0, 0, 0, 1, 1,
1.568408, -0.7564133, 2.86937, 1, 1, 1, 1, 1,
1.587143, -0.5016767, -2.181107, 1, 1, 1, 1, 1,
1.606178, 0.7539521, 1.112611, 1, 1, 1, 1, 1,
1.623365, -0.8402576, 0.7897313, 1, 1, 1, 1, 1,
1.634975, 1.276622, -0.2481454, 1, 1, 1, 1, 1,
1.653524, -0.03302458, 1.493949, 1, 1, 1, 1, 1,
1.659225, 1.259339, 1.205117, 1, 1, 1, 1, 1,
1.668265, -1.957982, 4.132503, 1, 1, 1, 1, 1,
1.679347, -0.604973, 3.425453, 1, 1, 1, 1, 1,
1.696666, -0.3228755, 0.5440226, 1, 1, 1, 1, 1,
1.731058, 0.8966108, 2.489045, 1, 1, 1, 1, 1,
1.744803, -2.410902, 1.601212, 1, 1, 1, 1, 1,
1.757165, -0.3639035, 2.994966, 1, 1, 1, 1, 1,
1.783895, -0.2964593, 1.897851, 1, 1, 1, 1, 1,
1.792155, 0.2538839, -0.299851, 1, 1, 1, 1, 1,
1.796583, 0.6737735, 1.660397, 0, 0, 1, 1, 1,
1.808226, -0.7712647, 0.841036, 1, 0, 0, 1, 1,
1.810247, -0.9766792, 3.043485, 1, 0, 0, 1, 1,
1.817457, -1.676498, 0.9255994, 1, 0, 0, 1, 1,
1.819339, -1.71102, 1.856651, 1, 0, 0, 1, 1,
1.824814, 1.161458, 0.412425, 1, 0, 0, 1, 1,
1.842522, 1.640373, 1.042681, 0, 0, 0, 1, 1,
1.850624, -0.6054841, 1.941121, 0, 0, 0, 1, 1,
1.894117, 1.335105, 0.3758104, 0, 0, 0, 1, 1,
1.926592, 1.628916, 2.099679, 0, 0, 0, 1, 1,
1.930341, -0.6359246, 2.08784, 0, 0, 0, 1, 1,
1.934276, 0.1861559, 1.99617, 0, 0, 0, 1, 1,
1.947423, -0.4545993, 1.983379, 0, 0, 0, 1, 1,
1.947521, 0.3260949, 2.464533, 1, 1, 1, 1, 1,
1.949889, 1.147496, -0.557351, 1, 1, 1, 1, 1,
1.976647, 0.6258267, 2.462953, 1, 1, 1, 1, 1,
1.989773, -0.864499, 0.9038383, 1, 1, 1, 1, 1,
1.9905, -1.223116, 1.094945, 1, 1, 1, 1, 1,
2.001838, -2.422339, 2.262259, 1, 1, 1, 1, 1,
2.005381, -0.2629523, 0.6951952, 1, 1, 1, 1, 1,
2.019112, -0.05091802, 1.448856, 1, 1, 1, 1, 1,
2.022594, -1.251662, 3.11759, 1, 1, 1, 1, 1,
2.034984, -0.1226471, 0.4829814, 1, 1, 1, 1, 1,
2.05145, 0.8120008, 1.349648, 1, 1, 1, 1, 1,
2.057744, -0.5616133, 2.048549, 1, 1, 1, 1, 1,
2.077926, -1.038251, 0.3093353, 1, 1, 1, 1, 1,
2.079981, -1.051549, 0.8341072, 1, 1, 1, 1, 1,
2.082521, -0.9534788, 1.842663, 1, 1, 1, 1, 1,
2.099815, 0.2402674, 1.385318, 0, 0, 1, 1, 1,
2.105398, -0.9472436, 1.194441, 1, 0, 0, 1, 1,
2.129184, -0.6668434, 2.762983, 1, 0, 0, 1, 1,
2.13423, -1.567767, 1.959375, 1, 0, 0, 1, 1,
2.176006, -0.5660264, 4.768751, 1, 0, 0, 1, 1,
2.200978, 0.9130611, 2.839278, 1, 0, 0, 1, 1,
2.21512, -0.7129671, 2.739126, 0, 0, 0, 1, 1,
2.220607, 0.06817276, 2.072937, 0, 0, 0, 1, 1,
2.231462, 0.3764565, 1.239769, 0, 0, 0, 1, 1,
2.35102, 0.06018557, 1.461254, 0, 0, 0, 1, 1,
2.390118, -1.06854, 1.745491, 0, 0, 0, 1, 1,
2.413787, 1.136669, 0.6846922, 0, 0, 0, 1, 1,
2.510003, -1.01748, 2.326761, 0, 0, 0, 1, 1,
2.529928, -0.1968514, 1.614927, 1, 1, 1, 1, 1,
2.60075, 0.6131966, -0.3764716, 1, 1, 1, 1, 1,
2.660231, 0.1045387, 2.308471, 1, 1, 1, 1, 1,
2.673206, 0.8856738, 1.39403, 1, 1, 1, 1, 1,
2.683784, 0.7220445, 1.943243, 1, 1, 1, 1, 1,
2.955509, 0.1425884, 2.784479, 1, 1, 1, 1, 1,
3.633001, 0.8359439, 2.70165, 1, 1, 1, 1, 1
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
var radius = 9.680294;
var distance = 34.00162;
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
mvMatrix.translate( -0.1469884, -0.2452956, -0.002775908 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00162);
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
