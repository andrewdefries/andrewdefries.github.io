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
-3.426276, 0.9318131, -0.8240061, 1, 0, 0, 1,
-2.966082, -0.4057847, -1.461947, 1, 0.007843138, 0, 1,
-2.768444, 1.201111, -2.163862, 1, 0.01176471, 0, 1,
-2.715896, -0.3770061, -3.102069, 1, 0.01960784, 0, 1,
-2.626851, -0.8589433, -1.764669, 1, 0.02352941, 0, 1,
-2.457007, -1.179959, -2.678845, 1, 0.03137255, 0, 1,
-2.444003, -0.7589499, -2.282707, 1, 0.03529412, 0, 1,
-2.418851, 0.1335587, -2.376819, 1, 0.04313726, 0, 1,
-2.402046, -0.1030098, -2.920227, 1, 0.04705882, 0, 1,
-2.217934, -0.6243287, -1.287912, 1, 0.05490196, 0, 1,
-2.20366, -0.9829187, -1.738761, 1, 0.05882353, 0, 1,
-2.200899, 0.1475535, 0.6805191, 1, 0.06666667, 0, 1,
-2.18779, 1.127583, 0.9512954, 1, 0.07058824, 0, 1,
-2.144498, -0.6820744, -2.805084, 1, 0.07843138, 0, 1,
-2.06964, 0.05405521, -2.600358, 1, 0.08235294, 0, 1,
-2.060306, 1.532343, -0.9155712, 1, 0.09019608, 0, 1,
-2.011162, 0.3767354, -1.975901, 1, 0.09411765, 0, 1,
-2.001921, 0.2817055, -2.16816, 1, 0.1019608, 0, 1,
-1.988041, -0.86123, -1.400382, 1, 0.1098039, 0, 1,
-1.980066, -1.347483, -2.632493, 1, 0.1137255, 0, 1,
-1.94031, -0.2629271, -1.673741, 1, 0.1215686, 0, 1,
-1.911618, -1.503726, -2.085397, 1, 0.1254902, 0, 1,
-1.880956, -0.1435084, -0.5595602, 1, 0.1333333, 0, 1,
-1.86293, 0.9570274, -1.557773, 1, 0.1372549, 0, 1,
-1.840351, 0.7091865, -1.395978, 1, 0.145098, 0, 1,
-1.831986, -1.333291, -3.845868, 1, 0.1490196, 0, 1,
-1.829764, -0.2769271, -2.749889, 1, 0.1568628, 0, 1,
-1.825238, -0.04835351, -3.139798, 1, 0.1607843, 0, 1,
-1.818752, 1.013992, -1.228044, 1, 0.1686275, 0, 1,
-1.815508, -0.5425153, -2.877903, 1, 0.172549, 0, 1,
-1.763472, -0.02175977, -1.717695, 1, 0.1803922, 0, 1,
-1.755217, -1.808644, -2.294003, 1, 0.1843137, 0, 1,
-1.742261, 3.12255, -0.5438486, 1, 0.1921569, 0, 1,
-1.731828, -0.3625921, -3.271424, 1, 0.1960784, 0, 1,
-1.720029, -0.840024, -1.097974, 1, 0.2039216, 0, 1,
-1.717301, 1.388793, 0.73875, 1, 0.2117647, 0, 1,
-1.659307, 1.359223, 0.439546, 1, 0.2156863, 0, 1,
-1.658177, 0.6275143, -0.1002009, 1, 0.2235294, 0, 1,
-1.650231, 1.231707, -2.074563, 1, 0.227451, 0, 1,
-1.647547, 1.753859, -1.538874, 1, 0.2352941, 0, 1,
-1.641683, -0.5780582, -2.27834, 1, 0.2392157, 0, 1,
-1.640978, 0.8526065, -0.9228231, 1, 0.2470588, 0, 1,
-1.637876, -0.987815, -3.049416, 1, 0.2509804, 0, 1,
-1.63232, 1.765105, -1.288818, 1, 0.2588235, 0, 1,
-1.623227, -0.7444512, -2.606239, 1, 0.2627451, 0, 1,
-1.615705, -0.4644964, -0.8945892, 1, 0.2705882, 0, 1,
-1.615365, -0.5159566, -2.066537, 1, 0.2745098, 0, 1,
-1.611126, -0.492102, -2.356065, 1, 0.282353, 0, 1,
-1.61112, 0.8838218, -2.528135, 1, 0.2862745, 0, 1,
-1.580529, -0.2644169, -2.593732, 1, 0.2941177, 0, 1,
-1.569899, 1.430147, -1.508364, 1, 0.3019608, 0, 1,
-1.551363, 0.2673227, -0.4353465, 1, 0.3058824, 0, 1,
-1.527195, -1.067185, -3.366222, 1, 0.3137255, 0, 1,
-1.515481, -1.160642, -4.312056, 1, 0.3176471, 0, 1,
-1.503988, -0.7505602, -1.741871, 1, 0.3254902, 0, 1,
-1.500342, -0.7002295, -1.207152, 1, 0.3294118, 0, 1,
-1.490821, -1.000998, -1.345776, 1, 0.3372549, 0, 1,
-1.468945, 1.755704, -1.128601, 1, 0.3411765, 0, 1,
-1.457492, -1.175788, -0.8041953, 1, 0.3490196, 0, 1,
-1.438419, -1.064573, -0.804897, 1, 0.3529412, 0, 1,
-1.435938, -0.1355717, 0.4332996, 1, 0.3607843, 0, 1,
-1.425452, -0.2464736, -0.8404292, 1, 0.3647059, 0, 1,
-1.421607, 0.2642512, -0.4866942, 1, 0.372549, 0, 1,
-1.412467, 0.9945242, -0.2619971, 1, 0.3764706, 0, 1,
-1.411685, 0.01264494, -1.67664, 1, 0.3843137, 0, 1,
-1.407707, 0.507717, -2.577214, 1, 0.3882353, 0, 1,
-1.405105, -2.309191, -3.314316, 1, 0.3960784, 0, 1,
-1.399454, 0.4383617, -2.418512, 1, 0.4039216, 0, 1,
-1.398743, 0.4542671, -0.7140993, 1, 0.4078431, 0, 1,
-1.398347, 1.986399, 1.259169, 1, 0.4156863, 0, 1,
-1.381568, 0.4134067, 1.043036, 1, 0.4196078, 0, 1,
-1.348647, -0.6381469, -2.123245, 1, 0.427451, 0, 1,
-1.341247, -0.4218622, 0.2642705, 1, 0.4313726, 0, 1,
-1.330311, 0.3777479, -1.568326, 1, 0.4392157, 0, 1,
-1.329875, -0.7677948, -4.090229, 1, 0.4431373, 0, 1,
-1.328499, -2.13209, -1.702071, 1, 0.4509804, 0, 1,
-1.324749, 0.4901348, 0.1611719, 1, 0.454902, 0, 1,
-1.316384, 0.2011965, -0.9349889, 1, 0.4627451, 0, 1,
-1.312067, 0.2487513, -2.083375, 1, 0.4666667, 0, 1,
-1.307209, 0.5157689, 0.1099046, 1, 0.4745098, 0, 1,
-1.295881, -0.7032142, -2.164838, 1, 0.4784314, 0, 1,
-1.294511, -0.3113528, -0.789669, 1, 0.4862745, 0, 1,
-1.278639, -0.1586763, -1.775244, 1, 0.4901961, 0, 1,
-1.274409, 0.4604641, -0.902707, 1, 0.4980392, 0, 1,
-1.273307, 2.089977, 1.857957, 1, 0.5058824, 0, 1,
-1.260789, 0.6411319, -0.9343649, 1, 0.509804, 0, 1,
-1.252149, -1.935967, -1.235994, 1, 0.5176471, 0, 1,
-1.247963, -0.1858229, -2.513399, 1, 0.5215687, 0, 1,
-1.235837, 0.6209272, -0.4951934, 1, 0.5294118, 0, 1,
-1.224902, 0.628222, -0.2579314, 1, 0.5333334, 0, 1,
-1.218548, 1.799197, -0.7662504, 1, 0.5411765, 0, 1,
-1.209849, -0.6722759, -2.580443, 1, 0.5450981, 0, 1,
-1.207693, -0.6226096, -2.744389, 1, 0.5529412, 0, 1,
-1.203579, -2.896694, -3.162206, 1, 0.5568628, 0, 1,
-1.195914, 0.2416657, -2.017575, 1, 0.5647059, 0, 1,
-1.193789, 1.526897, -0.6627638, 1, 0.5686275, 0, 1,
-1.190942, 1.801009, -0.39637, 1, 0.5764706, 0, 1,
-1.183924, 0.3269775, -0.04143865, 1, 0.5803922, 0, 1,
-1.181565, -0.17958, -2.809487, 1, 0.5882353, 0, 1,
-1.171116, 1.092698, -1.140228, 1, 0.5921569, 0, 1,
-1.168675, -0.6054332, -0.6512199, 1, 0.6, 0, 1,
-1.168368, 0.5381403, -1.762906, 1, 0.6078432, 0, 1,
-1.164786, -0.7045097, -1.18555, 1, 0.6117647, 0, 1,
-1.159457, 1.131854, -2.345237, 1, 0.6196079, 0, 1,
-1.156426, -1.262154, -1.463905, 1, 0.6235294, 0, 1,
-1.15559, 1.198389, -1.122851, 1, 0.6313726, 0, 1,
-1.154311, -0.6541041, -1.46204, 1, 0.6352941, 0, 1,
-1.153772, -0.4252283, -0.8725102, 1, 0.6431373, 0, 1,
-1.149552, -0.1643527, -1.692418, 1, 0.6470588, 0, 1,
-1.144034, 0.4304632, -0.5721584, 1, 0.654902, 0, 1,
-1.14121, 2.237173, 0.04947482, 1, 0.6588235, 0, 1,
-1.131013, -0.07440202, -1.993149, 1, 0.6666667, 0, 1,
-1.123483, -0.2330988, -1.326636, 1, 0.6705883, 0, 1,
-1.111959, -1.373221, -2.281493, 1, 0.6784314, 0, 1,
-1.111938, 0.7443311, -1.475449, 1, 0.682353, 0, 1,
-1.108639, 0.09571312, -1.736574, 1, 0.6901961, 0, 1,
-1.095818, 2.014785, 0.5212686, 1, 0.6941177, 0, 1,
-1.095654, -0.3147179, 0.2402917, 1, 0.7019608, 0, 1,
-1.08579, -0.2797339, -1.495197, 1, 0.7098039, 0, 1,
-1.084816, -0.5107219, -1.679876, 1, 0.7137255, 0, 1,
-1.083466, -0.294981, -0.8431855, 1, 0.7215686, 0, 1,
-1.08248, -2.253726, -2.608515, 1, 0.7254902, 0, 1,
-1.080704, 1.520346, 0.5664034, 1, 0.7333333, 0, 1,
-1.07627, 0.4906286, -2.934506, 1, 0.7372549, 0, 1,
-1.06101, 0.005044159, -1.370934, 1, 0.7450981, 0, 1,
-1.053287, 0.5825248, -1.794925, 1, 0.7490196, 0, 1,
-1.049194, -0.2846326, -2.294814, 1, 0.7568628, 0, 1,
-1.045676, -0.05747068, -1.676442, 1, 0.7607843, 0, 1,
-1.044739, 1.211904, -0.5028133, 1, 0.7686275, 0, 1,
-1.042265, 0.2233791, -0.6187896, 1, 0.772549, 0, 1,
-1.041927, 1.530249, -1.414643, 1, 0.7803922, 0, 1,
-1.037127, -1.226449, -2.023057, 1, 0.7843137, 0, 1,
-1.029417, 0.02364554, -0.9658147, 1, 0.7921569, 0, 1,
-1.020408, 0.235071, -1.978176, 1, 0.7960784, 0, 1,
-1.019371, 1.073089, -0.7850586, 1, 0.8039216, 0, 1,
-1.017627, 1.942096, 0.1178673, 1, 0.8117647, 0, 1,
-1.016642, -1.487764, -3.646837, 1, 0.8156863, 0, 1,
-1.016523, -0.8461317, -2.797623, 1, 0.8235294, 0, 1,
-1.004481, -1.575723, -1.481527, 1, 0.827451, 0, 1,
-1.000006, -0.8164353, -1.566855, 1, 0.8352941, 0, 1,
-0.995998, -0.3010794, -2.374219, 1, 0.8392157, 0, 1,
-0.99533, -0.4012675, -1.053071, 1, 0.8470588, 0, 1,
-0.9837925, 0.3712029, -0.4910973, 1, 0.8509804, 0, 1,
-0.9835105, -1.71928, -2.798246, 1, 0.8588235, 0, 1,
-0.9832115, -0.2277366, -2.312191, 1, 0.8627451, 0, 1,
-0.978304, 0.2470986, -1.242149, 1, 0.8705882, 0, 1,
-0.9747635, -0.01965486, -1.417568, 1, 0.8745098, 0, 1,
-0.966111, 1.051089, -1.175711, 1, 0.8823529, 0, 1,
-0.9628816, 0.6037755, -1.117989, 1, 0.8862745, 0, 1,
-0.9559915, 0.1935692, -2.040502, 1, 0.8941177, 0, 1,
-0.9553952, 1.031385, -1.232544, 1, 0.8980392, 0, 1,
-0.9553048, 2.588995, 0.5858752, 1, 0.9058824, 0, 1,
-0.9465476, -2.561793, -4.314682, 1, 0.9137255, 0, 1,
-0.946086, -1.208544, -4.06929, 1, 0.9176471, 0, 1,
-0.9367713, -0.458477, -2.510285, 1, 0.9254902, 0, 1,
-0.9300026, 2.257292, -0.605292, 1, 0.9294118, 0, 1,
-0.9186034, -0.01259966, -2.204078, 1, 0.9372549, 0, 1,
-0.9135798, 0.3749188, -2.125552, 1, 0.9411765, 0, 1,
-0.9084559, -0.5603491, -2.08615, 1, 0.9490196, 0, 1,
-0.9077306, -1.55119, -4.267954, 1, 0.9529412, 0, 1,
-0.9048796, -1.044969, -3.595229, 1, 0.9607843, 0, 1,
-0.9024143, 0.6807763, -1.022729, 1, 0.9647059, 0, 1,
-0.8982956, -0.702723, -3.076304, 1, 0.972549, 0, 1,
-0.8956704, 0.3981749, -0.3760405, 1, 0.9764706, 0, 1,
-0.8942637, -0.7633714, -4.184978, 1, 0.9843137, 0, 1,
-0.8925087, 1.05427, 0.7851369, 1, 0.9882353, 0, 1,
-0.8901014, -0.6202751, -1.292994, 1, 0.9960784, 0, 1,
-0.8896086, -0.6728187, -1.770902, 0.9960784, 1, 0, 1,
-0.881371, -0.3011161, -1.01851, 0.9921569, 1, 0, 1,
-0.8744504, -1.232361, -3.216168, 0.9843137, 1, 0, 1,
-0.8697636, -1.878878, -1.690271, 0.9803922, 1, 0, 1,
-0.8665341, -0.02241089, -0.9133424, 0.972549, 1, 0, 1,
-0.8665016, 0.6031713, -0.9624927, 0.9686275, 1, 0, 1,
-0.866093, -0.2594221, -2.26195, 0.9607843, 1, 0, 1,
-0.8659876, 2.242617, -0.9884517, 0.9568627, 1, 0, 1,
-0.8637106, 1.067902, -1.365226, 0.9490196, 1, 0, 1,
-0.8604001, -0.5499241, -0.9811229, 0.945098, 1, 0, 1,
-0.859281, 1.111282, 0.295286, 0.9372549, 1, 0, 1,
-0.8584644, 0.377883, -1.744602, 0.9333333, 1, 0, 1,
-0.853352, 0.3533115, 1.437449, 0.9254902, 1, 0, 1,
-0.8429189, -1.776523, -2.099164, 0.9215686, 1, 0, 1,
-0.8411454, 0.7994286, -0.3605111, 0.9137255, 1, 0, 1,
-0.8400328, 0.4078066, -1.855737, 0.9098039, 1, 0, 1,
-0.830487, -1.569142, -1.357673, 0.9019608, 1, 0, 1,
-0.8256929, -0.2393412, -1.643429, 0.8941177, 1, 0, 1,
-0.8153477, 0.03524003, -0.4621964, 0.8901961, 1, 0, 1,
-0.8138106, 0.6454052, -0.7469798, 0.8823529, 1, 0, 1,
-0.8119327, 1.448351, -1.817128, 0.8784314, 1, 0, 1,
-0.8060941, -0.5613438, -2.224166, 0.8705882, 1, 0, 1,
-0.8037544, 0.7544079, -0.8657826, 0.8666667, 1, 0, 1,
-0.7974331, -1.223172, -2.414087, 0.8588235, 1, 0, 1,
-0.7961873, 2.013503, -0.08697277, 0.854902, 1, 0, 1,
-0.795989, 0.1674965, -1.505578, 0.8470588, 1, 0, 1,
-0.7906476, 1.970701, -1.548225, 0.8431373, 1, 0, 1,
-0.7898105, -0.4082654, -0.9175383, 0.8352941, 1, 0, 1,
-0.7868967, -0.9507813, -2.111695, 0.8313726, 1, 0, 1,
-0.7851896, 0.219119, -2.141494, 0.8235294, 1, 0, 1,
-0.7833609, -0.2254061, -2.506213, 0.8196079, 1, 0, 1,
-0.7831227, 0.05218906, -2.546214, 0.8117647, 1, 0, 1,
-0.7830774, 0.730593, -0.3694987, 0.8078431, 1, 0, 1,
-0.7830311, -1.011704, -2.666029, 0.8, 1, 0, 1,
-0.7804581, 1.128927, -1.170298, 0.7921569, 1, 0, 1,
-0.77824, -0.5544877, -4.373011, 0.7882353, 1, 0, 1,
-0.7770967, 1.775548, 0.07165335, 0.7803922, 1, 0, 1,
-0.776197, 2.051902, -0.3242327, 0.7764706, 1, 0, 1,
-0.7735401, 0.08685043, -1.771222, 0.7686275, 1, 0, 1,
-0.7730981, 1.477123, -1.504863, 0.7647059, 1, 0, 1,
-0.7706491, -0.2351708, -2.319684, 0.7568628, 1, 0, 1,
-0.7569346, -0.6643444, -2.917309, 0.7529412, 1, 0, 1,
-0.7516248, 0.7169968, -1.137799, 0.7450981, 1, 0, 1,
-0.7499769, -1.304407, -2.775594, 0.7411765, 1, 0, 1,
-0.7468084, 0.08053988, -1.592843, 0.7333333, 1, 0, 1,
-0.7455435, -2.895595, -3.589987, 0.7294118, 1, 0, 1,
-0.7448711, 0.7508962, -1.131159, 0.7215686, 1, 0, 1,
-0.7433287, 0.3055809, -2.813302, 0.7176471, 1, 0, 1,
-0.7420139, -0.5859543, -0.1817622, 0.7098039, 1, 0, 1,
-0.7410395, 0.7066169, -2.276819, 0.7058824, 1, 0, 1,
-0.738892, -0.5878507, -1.923222, 0.6980392, 1, 0, 1,
-0.7364221, -0.1953104, -0.8725774, 0.6901961, 1, 0, 1,
-0.729932, 0.284776, 0.03520522, 0.6862745, 1, 0, 1,
-0.7278125, -1.16209, -2.010056, 0.6784314, 1, 0, 1,
-0.7223581, -0.1859946, -2.774204, 0.6745098, 1, 0, 1,
-0.7208207, 0.5106063, 0.09800309, 0.6666667, 1, 0, 1,
-0.7163272, -1.120492, -3.176629, 0.6627451, 1, 0, 1,
-0.7115729, 1.193104, 0.1081006, 0.654902, 1, 0, 1,
-0.7070091, 0.05413111, -1.430174, 0.6509804, 1, 0, 1,
-0.7064706, -0.8894576, -1.189127, 0.6431373, 1, 0, 1,
-0.7012228, -1.343832, -2.460978, 0.6392157, 1, 0, 1,
-0.6984457, 0.9290988, -0.1710764, 0.6313726, 1, 0, 1,
-0.6975716, 0.05858516, -1.768795, 0.627451, 1, 0, 1,
-0.6950799, -1.126122, -2.469481, 0.6196079, 1, 0, 1,
-0.6914777, 0.71743, 0.01507586, 0.6156863, 1, 0, 1,
-0.6864731, 0.0327705, -1.537305, 0.6078432, 1, 0, 1,
-0.6809269, -0.3259014, -0.3385934, 0.6039216, 1, 0, 1,
-0.6797274, 0.9194839, 0.1385143, 0.5960785, 1, 0, 1,
-0.6769067, 0.4675632, 0.07009052, 0.5882353, 1, 0, 1,
-0.6754285, 1.762374, -1.679319, 0.5843138, 1, 0, 1,
-0.6751035, 2.002191, -0.3600334, 0.5764706, 1, 0, 1,
-0.6746683, -0.2458132, -2.289416, 0.572549, 1, 0, 1,
-0.6728771, -1.670879, -2.759644, 0.5647059, 1, 0, 1,
-0.6710246, -0.1978866, -0.6935855, 0.5607843, 1, 0, 1,
-0.6595283, -0.2028704, -2.948389, 0.5529412, 1, 0, 1,
-0.6535406, 0.8766548, -0.06064926, 0.5490196, 1, 0, 1,
-0.6499392, -1.010761, -1.936646, 0.5411765, 1, 0, 1,
-0.6434318, 0.3197998, -0.7298954, 0.5372549, 1, 0, 1,
-0.6429407, 0.9995888, -1.425339, 0.5294118, 1, 0, 1,
-0.637234, -0.2576928, -3.429957, 0.5254902, 1, 0, 1,
-0.635493, -0.8365207, -0.8669045, 0.5176471, 1, 0, 1,
-0.6273844, 1.167731, -1.513984, 0.5137255, 1, 0, 1,
-0.6267775, -0.7691602, -3.005734, 0.5058824, 1, 0, 1,
-0.6252124, -0.1862294, -2.236787, 0.5019608, 1, 0, 1,
-0.620373, 0.04209271, -0.9811076, 0.4941176, 1, 0, 1,
-0.6174365, 1.066481, -1.077086, 0.4862745, 1, 0, 1,
-0.6143291, 0.9997222, 1.065096, 0.4823529, 1, 0, 1,
-0.613483, 0.4222795, -1.853601, 0.4745098, 1, 0, 1,
-0.6100792, 1.595263, -0.3955754, 0.4705882, 1, 0, 1,
-0.6049885, 1.124627, -0.1958991, 0.4627451, 1, 0, 1,
-0.6015933, -0.2854014, -0.5914297, 0.4588235, 1, 0, 1,
-0.6007671, 0.05353491, -2.555911, 0.4509804, 1, 0, 1,
-0.5898562, -1.143493, -2.019838, 0.4470588, 1, 0, 1,
-0.5832358, 0.998215, -2.156822, 0.4392157, 1, 0, 1,
-0.5819604, 1.007772, -0.2839053, 0.4352941, 1, 0, 1,
-0.5814627, -0.04579195, -3.079658, 0.427451, 1, 0, 1,
-0.5813277, 0.4794386, -0.3621482, 0.4235294, 1, 0, 1,
-0.5779639, -0.2116836, -2.497347, 0.4156863, 1, 0, 1,
-0.5766336, -0.4358786, -2.390162, 0.4117647, 1, 0, 1,
-0.5764181, 0.08771317, 0.3430746, 0.4039216, 1, 0, 1,
-0.5762784, -0.5054841, -1.248675, 0.3960784, 1, 0, 1,
-0.5759856, -0.3278677, -2.094915, 0.3921569, 1, 0, 1,
-0.5739615, -0.8772017, -3.336774, 0.3843137, 1, 0, 1,
-0.5729549, 1.457836, -0.9491657, 0.3803922, 1, 0, 1,
-0.5724517, 0.06978327, -0.3173557, 0.372549, 1, 0, 1,
-0.5672903, -1.886584, -1.735536, 0.3686275, 1, 0, 1,
-0.5664098, 0.8872415, -0.8789944, 0.3607843, 1, 0, 1,
-0.5602375, 0.2521547, -1.218924, 0.3568628, 1, 0, 1,
-0.5580997, 0.6183268, 0.5242001, 0.3490196, 1, 0, 1,
-0.5568348, 0.2576757, -1.61668, 0.345098, 1, 0, 1,
-0.5554988, 0.8201951, -1.074758, 0.3372549, 1, 0, 1,
-0.5524574, -1.167437, -1.831455, 0.3333333, 1, 0, 1,
-0.5481349, 0.7768424, -0.8063866, 0.3254902, 1, 0, 1,
-0.5465162, -0.1826045, -1.315912, 0.3215686, 1, 0, 1,
-0.543581, 0.6435779, -0.9613026, 0.3137255, 1, 0, 1,
-0.5417401, 0.7243263, -1.329533, 0.3098039, 1, 0, 1,
-0.5393231, -0.2782882, -1.132561, 0.3019608, 1, 0, 1,
-0.5355497, 0.7027194, -0.3862242, 0.2941177, 1, 0, 1,
-0.5353767, 0.2357152, -1.918746, 0.2901961, 1, 0, 1,
-0.5311159, -0.6338716, -3.600835, 0.282353, 1, 0, 1,
-0.5199103, -0.2360146, -1.868394, 0.2784314, 1, 0, 1,
-0.515741, -0.6484133, -3.399626, 0.2705882, 1, 0, 1,
-0.5143006, 0.2479334, -1.568848, 0.2666667, 1, 0, 1,
-0.5120384, -1.252595, -3.480052, 0.2588235, 1, 0, 1,
-0.5109937, 0.2367647, -0.2560088, 0.254902, 1, 0, 1,
-0.5081568, -0.6579342, -4.311703, 0.2470588, 1, 0, 1,
-0.5049307, -0.7792932, -3.214807, 0.2431373, 1, 0, 1,
-0.4975134, -0.03466513, -3.612093, 0.2352941, 1, 0, 1,
-0.4954217, 1.360489, -2.324435, 0.2313726, 1, 0, 1,
-0.4945627, -0.7642374, -4.491578, 0.2235294, 1, 0, 1,
-0.4939625, -1.983051, -1.346933, 0.2196078, 1, 0, 1,
-0.493222, 0.8087888, -3.947544, 0.2117647, 1, 0, 1,
-0.493055, 1.000859, 1.306748, 0.2078431, 1, 0, 1,
-0.491751, 1.435247, 0.6628197, 0.2, 1, 0, 1,
-0.4830674, 0.8470574, -0.09981147, 0.1921569, 1, 0, 1,
-0.4813825, -0.2267452, -0.8480355, 0.1882353, 1, 0, 1,
-0.4812008, -0.2295358, -1.400129, 0.1803922, 1, 0, 1,
-0.4806677, 0.1773306, -1.40567, 0.1764706, 1, 0, 1,
-0.4746894, -0.6219109, -1.11962, 0.1686275, 1, 0, 1,
-0.4746429, -0.9572863, -3.647844, 0.1647059, 1, 0, 1,
-0.4737104, 0.8425138, -0.633746, 0.1568628, 1, 0, 1,
-0.4730172, -0.7348318, -2.836204, 0.1529412, 1, 0, 1,
-0.470668, 2.653792, 0.640744, 0.145098, 1, 0, 1,
-0.4639333, -1.020824, -2.074586, 0.1411765, 1, 0, 1,
-0.4606108, -0.2284314, -2.164566, 0.1333333, 1, 0, 1,
-0.4565089, 0.04814586, -0.6450738, 0.1294118, 1, 0, 1,
-0.4549262, 0.4376959, -0.1238773, 0.1215686, 1, 0, 1,
-0.454872, 1.235886, 1.029089, 0.1176471, 1, 0, 1,
-0.4521233, 0.2591068, 0.639435, 0.1098039, 1, 0, 1,
-0.4518597, -2.654118, -4.047531, 0.1058824, 1, 0, 1,
-0.4417657, 1.116646, -1.25367, 0.09803922, 1, 0, 1,
-0.4399857, -1.161158, -2.979642, 0.09019608, 1, 0, 1,
-0.4396305, -0.8469937, -2.411435, 0.08627451, 1, 0, 1,
-0.4375021, 0.4488367, -0.7846465, 0.07843138, 1, 0, 1,
-0.4357501, -0.7448027, -2.678413, 0.07450981, 1, 0, 1,
-0.4313262, 1.312594, 1.233894, 0.06666667, 1, 0, 1,
-0.4304938, -0.6587397, -0.6987004, 0.0627451, 1, 0, 1,
-0.425342, 0.2684116, 1.260108, 0.05490196, 1, 0, 1,
-0.4186704, -0.181891, -2.441817, 0.05098039, 1, 0, 1,
-0.4153864, 0.7322482, -0.7165985, 0.04313726, 1, 0, 1,
-0.413571, -2.080431, -3.112132, 0.03921569, 1, 0, 1,
-0.4121742, 1.862208, -1.05619, 0.03137255, 1, 0, 1,
-0.4108943, -0.03773327, -2.871506, 0.02745098, 1, 0, 1,
-0.4102036, 0.494841, -0.1593992, 0.01960784, 1, 0, 1,
-0.4101418, 0.1766659, -1.417289, 0.01568628, 1, 0, 1,
-0.4035129, -1.49936, -1.771244, 0.007843138, 1, 0, 1,
-0.4031026, -1.104719, -1.244229, 0.003921569, 1, 0, 1,
-0.3997799, 0.7149726, -1.132409, 0, 1, 0.003921569, 1,
-0.3980299, 3.022029, -0.6974432, 0, 1, 0.01176471, 1,
-0.3923243, -1.303352, -1.910082, 0, 1, 0.01568628, 1,
-0.3894361, -1.571731, -3.504356, 0, 1, 0.02352941, 1,
-0.3873252, -0.4449264, -2.779459, 0, 1, 0.02745098, 1,
-0.3853866, 0.07385285, -2.438921, 0, 1, 0.03529412, 1,
-0.3841561, -0.9839567, -4.785156, 0, 1, 0.03921569, 1,
-0.3785903, 3.328417, -1.046891, 0, 1, 0.04705882, 1,
-0.3770968, -0.7255297, -2.274882, 0, 1, 0.05098039, 1,
-0.3758463, 0.7898314, -1.082483, 0, 1, 0.05882353, 1,
-0.3711408, 0.5373113, -0.7130042, 0, 1, 0.0627451, 1,
-0.367708, -0.3419775, -0.6079076, 0, 1, 0.07058824, 1,
-0.3662388, -0.3433882, -2.818364, 0, 1, 0.07450981, 1,
-0.362311, -0.3708509, -1.400752, 0, 1, 0.08235294, 1,
-0.3607796, 1.754472, -1.3731, 0, 1, 0.08627451, 1,
-0.3596967, 0.4557675, -1.328393, 0, 1, 0.09411765, 1,
-0.3552417, -2.822984, -2.956904, 0, 1, 0.1019608, 1,
-0.3549781, -1.275403, -3.055845, 0, 1, 0.1058824, 1,
-0.350116, 0.1968661, -1.0902, 0, 1, 0.1137255, 1,
-0.3482213, -0.4598081, -1.508178, 0, 1, 0.1176471, 1,
-0.3481659, 0.916234, -1.352237, 0, 1, 0.1254902, 1,
-0.3430944, 0.698533, -1.720601, 0, 1, 0.1294118, 1,
-0.3402581, 0.4959343, -1.220519, 0, 1, 0.1372549, 1,
-0.3348803, 0.9645708, 0.3944893, 0, 1, 0.1411765, 1,
-0.3330035, -3.033787, -3.113556, 0, 1, 0.1490196, 1,
-0.3301622, 1.904857, 0.7864561, 0, 1, 0.1529412, 1,
-0.328207, 0.2117818, -2.72886, 0, 1, 0.1607843, 1,
-0.3267691, -0.9069152, -3.468842, 0, 1, 0.1647059, 1,
-0.3255683, 1.770939, -0.9376689, 0, 1, 0.172549, 1,
-0.3251787, 0.2811041, -1.931401, 0, 1, 0.1764706, 1,
-0.3204002, -0.5203847, -1.888299, 0, 1, 0.1843137, 1,
-0.319611, -1.699768, -4.531058, 0, 1, 0.1882353, 1,
-0.3166161, -2.705032, -1.854552, 0, 1, 0.1960784, 1,
-0.3162178, -0.5084862, -2.778912, 0, 1, 0.2039216, 1,
-0.3155755, -2.871945, -3.984064, 0, 1, 0.2078431, 1,
-0.310703, -0.9685715, -3.908356, 0, 1, 0.2156863, 1,
-0.3094909, 0.4143232, -1.005742, 0, 1, 0.2196078, 1,
-0.3002575, -2.148674, -2.858569, 0, 1, 0.227451, 1,
-0.2980659, -0.5576247, -2.938019, 0, 1, 0.2313726, 1,
-0.2951645, -0.7255374, -2.86732, 0, 1, 0.2392157, 1,
-0.2908568, 0.9820018, 0.244811, 0, 1, 0.2431373, 1,
-0.2873497, 0.7002451, -0.9406201, 0, 1, 0.2509804, 1,
-0.2834544, -0.772998, -3.232561, 0, 1, 0.254902, 1,
-0.2818027, 0.7974486, 0.7401327, 0, 1, 0.2627451, 1,
-0.2816639, 0.2726368, -0.2631877, 0, 1, 0.2666667, 1,
-0.2744192, 0.7348737, -0.6709341, 0, 1, 0.2745098, 1,
-0.2709748, -1.040869, -3.529756, 0, 1, 0.2784314, 1,
-0.270542, -1.098887, -3.838832, 0, 1, 0.2862745, 1,
-0.2651411, 0.7198612, -0.04899539, 0, 1, 0.2901961, 1,
-0.2643286, -0.7893575, -2.573079, 0, 1, 0.2980392, 1,
-0.2625024, -0.1807984, -2.288947, 0, 1, 0.3058824, 1,
-0.2615426, 1.368748, -0.8029093, 0, 1, 0.3098039, 1,
-0.260933, 1.890925, 0.7699516, 0, 1, 0.3176471, 1,
-0.2604598, -0.09701837, -1.630634, 0, 1, 0.3215686, 1,
-0.2579104, 0.9760716, -0.195272, 0, 1, 0.3294118, 1,
-0.2556767, -1.842921, -3.260279, 0, 1, 0.3333333, 1,
-0.2537356, -0.566668, -1.751528, 0, 1, 0.3411765, 1,
-0.2514636, -1.628851, -3.890604, 0, 1, 0.345098, 1,
-0.2486442, -0.4676028, -1.27467, 0, 1, 0.3529412, 1,
-0.248176, -0.6799266, -2.691893, 0, 1, 0.3568628, 1,
-0.248062, 0.1597689, -0.7274449, 0, 1, 0.3647059, 1,
-0.2477893, 0.2441024, -0.1201416, 0, 1, 0.3686275, 1,
-0.2463032, -0.4948194, -1.171401, 0, 1, 0.3764706, 1,
-0.2454328, -0.4080617, -1.717805, 0, 1, 0.3803922, 1,
-0.245285, 1.218734, -1.960233, 0, 1, 0.3882353, 1,
-0.2452525, 1.177217, -2.340607, 0, 1, 0.3921569, 1,
-0.2448783, 0.6153864, 0.6857392, 0, 1, 0.4, 1,
-0.2439291, 0.3109621, -0.8062134, 0, 1, 0.4078431, 1,
-0.2392001, -0.04673437, -0.2902385, 0, 1, 0.4117647, 1,
-0.2382459, -1.529175, -3.876097, 0, 1, 0.4196078, 1,
-0.2381179, 0.6067517, 0.412559, 0, 1, 0.4235294, 1,
-0.2373173, 0.2672329, -0.3723884, 0, 1, 0.4313726, 1,
-0.2323939, 1.36004, -1.072884, 0, 1, 0.4352941, 1,
-0.2314754, 0.5862373, -0.2988946, 0, 1, 0.4431373, 1,
-0.2313124, -0.05634114, -2.009201, 0, 1, 0.4470588, 1,
-0.2308476, -1.745481, -1.790922, 0, 1, 0.454902, 1,
-0.2302613, 0.2522071, -0.6430328, 0, 1, 0.4588235, 1,
-0.2247844, -0.7790838, -2.593142, 0, 1, 0.4666667, 1,
-0.2236919, -0.7425131, -4.131441, 0, 1, 0.4705882, 1,
-0.2172493, -1.201947, -3.320899, 0, 1, 0.4784314, 1,
-0.213841, -0.5097972, -3.898706, 0, 1, 0.4823529, 1,
-0.2075093, -0.9942088, -2.02433, 0, 1, 0.4901961, 1,
-0.2074375, -0.1738168, -3.319812, 0, 1, 0.4941176, 1,
-0.2056892, -0.7758815, -2.9534, 0, 1, 0.5019608, 1,
-0.202143, 1.6176, -0.2475449, 0, 1, 0.509804, 1,
-0.2019197, 1.411753, 2.183902, 0, 1, 0.5137255, 1,
-0.2018762, -0.5310484, -1.478661, 0, 1, 0.5215687, 1,
-0.2018173, 1.75953, 2.609773, 0, 1, 0.5254902, 1,
-0.1999086, -1.840638, -2.07277, 0, 1, 0.5333334, 1,
-0.1997914, -0.6081529, -1.571046, 0, 1, 0.5372549, 1,
-0.1988356, 0.2627191, 0.9417315, 0, 1, 0.5450981, 1,
-0.1986846, -1.110171, -3.443101, 0, 1, 0.5490196, 1,
-0.1972148, -0.8697143, -2.668128, 0, 1, 0.5568628, 1,
-0.1969414, -0.9650608, -5.232909, 0, 1, 0.5607843, 1,
-0.1957598, 0.6919429, 0.1184191, 0, 1, 0.5686275, 1,
-0.1941606, 0.5850282, -0.5292037, 0, 1, 0.572549, 1,
-0.1933899, 0.09042337, -1.185047, 0, 1, 0.5803922, 1,
-0.1932929, -0.847028, -2.296522, 0, 1, 0.5843138, 1,
-0.19024, -1.203532, -1.489272, 0, 1, 0.5921569, 1,
-0.1842976, 0.1417991, -0.4542954, 0, 1, 0.5960785, 1,
-0.1832099, -1.525957, -1.858482, 0, 1, 0.6039216, 1,
-0.1821604, 0.3062601, -1.491335, 0, 1, 0.6117647, 1,
-0.1820362, 0.4590738, 0.9648914, 0, 1, 0.6156863, 1,
-0.1792512, -0.6597646, -2.125813, 0, 1, 0.6235294, 1,
-0.1760807, -1.739432, -1.576173, 0, 1, 0.627451, 1,
-0.1753541, -0.1025605, -3.024619, 0, 1, 0.6352941, 1,
-0.1722278, 1.539628, 0.1943843, 0, 1, 0.6392157, 1,
-0.1699772, 1.019039, -2.280197, 0, 1, 0.6470588, 1,
-0.1685985, -1.104468, -2.78639, 0, 1, 0.6509804, 1,
-0.1673802, -1.64421, -3.815093, 0, 1, 0.6588235, 1,
-0.1669652, 0.03066609, -3.346178, 0, 1, 0.6627451, 1,
-0.1658296, 0.904815, 1.199632, 0, 1, 0.6705883, 1,
-0.1629243, -1.916694, -3.255681, 0, 1, 0.6745098, 1,
-0.1604338, 1.680015, 0.07574184, 0, 1, 0.682353, 1,
-0.1554001, 0.9691047, 0.5109996, 0, 1, 0.6862745, 1,
-0.1506152, -0.2357368, -5.78819, 0, 1, 0.6941177, 1,
-0.1497642, 0.54017, 0.3963241, 0, 1, 0.7019608, 1,
-0.1475625, -0.2302138, -3.60317, 0, 1, 0.7058824, 1,
-0.1448371, -1.624834, -2.260023, 0, 1, 0.7137255, 1,
-0.1399331, -0.08466337, -2.611952, 0, 1, 0.7176471, 1,
-0.1395515, -0.3750934, -2.539064, 0, 1, 0.7254902, 1,
-0.1370808, 0.3753483, -1.765187, 0, 1, 0.7294118, 1,
-0.1201572, 0.2322706, -3.104435, 0, 1, 0.7372549, 1,
-0.1200638, 0.8451709, 0.4571773, 0, 1, 0.7411765, 1,
-0.1155474, 2.054233, 0.2530081, 0, 1, 0.7490196, 1,
-0.1123804, -0.4938709, -3.256902, 0, 1, 0.7529412, 1,
-0.1110486, 0.3784758, -1.238875, 0, 1, 0.7607843, 1,
-0.1035841, -0.7293956, -1.63858, 0, 1, 0.7647059, 1,
-0.1035523, -1.394224, -2.504505, 0, 1, 0.772549, 1,
-0.09823988, -0.2005088, -1.920349, 0, 1, 0.7764706, 1,
-0.09792706, 0.1458578, -0.8206816, 0, 1, 0.7843137, 1,
-0.09605366, 0.8646016, 0.340285, 0, 1, 0.7882353, 1,
-0.09555306, 0.2171889, 0.5705706, 0, 1, 0.7960784, 1,
-0.09535642, 1.184206, -0.3019203, 0, 1, 0.8039216, 1,
-0.08796523, -1.330056, -4.176562, 0, 1, 0.8078431, 1,
-0.08743895, 0.1351896, -0.6850867, 0, 1, 0.8156863, 1,
-0.08422461, -0.2539941, -2.800256, 0, 1, 0.8196079, 1,
-0.08283412, 0.6800438, -0.5274258, 0, 1, 0.827451, 1,
-0.07515526, 0.1571988, 0.52423, 0, 1, 0.8313726, 1,
-0.07483601, -0.3535973, -3.920486, 0, 1, 0.8392157, 1,
-0.07140966, -0.3368381, -2.898582, 0, 1, 0.8431373, 1,
-0.05745343, -1.192045, -3.529277, 0, 1, 0.8509804, 1,
-0.05363694, -0.2814007, -2.324476, 0, 1, 0.854902, 1,
-0.05098741, 0.9863718, -2.246566, 0, 1, 0.8627451, 1,
-0.04178903, 1.411882, 0.9897113, 0, 1, 0.8666667, 1,
-0.03758296, -2.529589, -3.848137, 0, 1, 0.8745098, 1,
-0.03750892, -0.5750453, -2.422879, 0, 1, 0.8784314, 1,
-0.03736386, -1.408536, -2.652993, 0, 1, 0.8862745, 1,
-0.03652101, -0.18649, -1.728713, 0, 1, 0.8901961, 1,
-0.03505829, 0.6849705, -0.7068645, 0, 1, 0.8980392, 1,
-0.03436309, -0.02373672, -3.137933, 0, 1, 0.9058824, 1,
-0.03347192, 1.586738, -1.571109, 0, 1, 0.9098039, 1,
-0.03100693, -0.2294438, -2.994646, 0, 1, 0.9176471, 1,
-0.02870982, -1.042177, -1.879047, 0, 1, 0.9215686, 1,
-0.0286123, 1.257392, 1.327198, 0, 1, 0.9294118, 1,
-0.02650537, -0.6972377, -3.522069, 0, 1, 0.9333333, 1,
-0.02474114, -1.85181, -2.274198, 0, 1, 0.9411765, 1,
-0.02056409, 0.335133, -0.8626931, 0, 1, 0.945098, 1,
-0.02042541, 0.6603863, -0.1970488, 0, 1, 0.9529412, 1,
-0.01986971, -2.122732, -2.186308, 0, 1, 0.9568627, 1,
-0.01857161, -1.029858, -3.228467, 0, 1, 0.9647059, 1,
-0.01803347, 0.3723252, -1.289959, 0, 1, 0.9686275, 1,
-0.004868668, 0.4712405, 0.7724453, 0, 1, 0.9764706, 1,
-0.002952219, -0.8058877, -1.762285, 0, 1, 0.9803922, 1,
0.0007675589, 0.5400786, -1.232613, 0, 1, 0.9882353, 1,
0.0009602901, 1.366199, -0.6594617, 0, 1, 0.9921569, 1,
0.003098016, -0.8223842, 3.825538, 0, 1, 1, 1,
0.003905569, 1.044574, 0.9865482, 0, 0.9921569, 1, 1,
0.006534256, 1.410561, -0.7662893, 0, 0.9882353, 1, 1,
0.009492786, 2.349876, -0.08623809, 0, 0.9803922, 1, 1,
0.01463559, -1.480806, 4.525703, 0, 0.9764706, 1, 1,
0.01632869, -0.7489644, 2.617935, 0, 0.9686275, 1, 1,
0.01744576, -2.110382, 2.643869, 0, 0.9647059, 1, 1,
0.01849552, 1.622029, -0.9654546, 0, 0.9568627, 1, 1,
0.01906194, -0.9258735, 3.88562, 0, 0.9529412, 1, 1,
0.02115333, -0.02387975, 3.507366, 0, 0.945098, 1, 1,
0.03199429, -0.1471044, 4.328366, 0, 0.9411765, 1, 1,
0.033788, 0.5956042, -0.7986695, 0, 0.9333333, 1, 1,
0.03513395, 1.08111, -0.2995524, 0, 0.9294118, 1, 1,
0.03855625, -0.6913875, 2.549983, 0, 0.9215686, 1, 1,
0.04285666, -2.187197, 2.162239, 0, 0.9176471, 1, 1,
0.04293964, 0.7129203, 1.070071, 0, 0.9098039, 1, 1,
0.0530898, 0.495943, 0.513146, 0, 0.9058824, 1, 1,
0.05322528, -0.8649965, 2.633824, 0, 0.8980392, 1, 1,
0.05632245, 0.3314936, 1.976843, 0, 0.8901961, 1, 1,
0.06617309, 1.858853, 2.1508, 0, 0.8862745, 1, 1,
0.06777759, -0.2764806, 2.257302, 0, 0.8784314, 1, 1,
0.06818969, -0.1833435, 1.159741, 0, 0.8745098, 1, 1,
0.07107157, -0.2221604, 2.473861, 0, 0.8666667, 1, 1,
0.0723916, -1.286972, 5.801673, 0, 0.8627451, 1, 1,
0.07418634, 1.179984, -0.8345501, 0, 0.854902, 1, 1,
0.07745422, -1.879719, 2.578144, 0, 0.8509804, 1, 1,
0.08295033, 0.6325837, -1.766544, 0, 0.8431373, 1, 1,
0.0847116, 2.18979, -0.1729231, 0, 0.8392157, 1, 1,
0.09318735, 0.1563144, 3.312109, 0, 0.8313726, 1, 1,
0.09381391, 1.545673, 0.9569058, 0, 0.827451, 1, 1,
0.1010786, 0.5222371, 0.44283, 0, 0.8196079, 1, 1,
0.1013037, -0.7058719, 2.802408, 0, 0.8156863, 1, 1,
0.1016578, 1.276996, -0.5190141, 0, 0.8078431, 1, 1,
0.1027577, -1.525565, 1.741801, 0, 0.8039216, 1, 1,
0.105043, 0.9364615, -0.344552, 0, 0.7960784, 1, 1,
0.1073756, -2.111887, 4.256986, 0, 0.7882353, 1, 1,
0.110004, 0.1058281, 2.518532, 0, 0.7843137, 1, 1,
0.1123303, 0.464751, -0.9793802, 0, 0.7764706, 1, 1,
0.1139286, 1.357594, 0.04785053, 0, 0.772549, 1, 1,
0.1175177, 1.912655, -0.9713823, 0, 0.7647059, 1, 1,
0.1184344, -0.4876915, 3.124967, 0, 0.7607843, 1, 1,
0.1224995, -2.375843, 2.595085, 0, 0.7529412, 1, 1,
0.1255293, 0.6550115, 0.3566577, 0, 0.7490196, 1, 1,
0.1308057, -0.3945053, 0.6935404, 0, 0.7411765, 1, 1,
0.130895, 0.9354883, -0.04313928, 0, 0.7372549, 1, 1,
0.136024, -0.5129303, 2.658947, 0, 0.7294118, 1, 1,
0.1420299, 1.381173, -0.6998149, 0, 0.7254902, 1, 1,
0.1434378, -1.238241, 4.830593, 0, 0.7176471, 1, 1,
0.151879, -1.315688, 1.73224, 0, 0.7137255, 1, 1,
0.1521303, 1.445276, -0.08958061, 0, 0.7058824, 1, 1,
0.1531857, -0.2132314, 1.989239, 0, 0.6980392, 1, 1,
0.1551044, -1.366917, 4.488231, 0, 0.6941177, 1, 1,
0.1578462, -0.9502066, 3.575168, 0, 0.6862745, 1, 1,
0.1578875, -0.5156159, 2.818887, 0, 0.682353, 1, 1,
0.160355, -0.1646104, 2.329421, 0, 0.6745098, 1, 1,
0.1683439, 0.3962777, 0.9924536, 0, 0.6705883, 1, 1,
0.1692942, 0.6598049, 0.891564, 0, 0.6627451, 1, 1,
0.1770358, 0.4117397, -0.3492315, 0, 0.6588235, 1, 1,
0.1782112, -0.2429608, 0.9965149, 0, 0.6509804, 1, 1,
0.1793226, -1.453149, 3.487498, 0, 0.6470588, 1, 1,
0.1837739, -3.398971, 4.485785, 0, 0.6392157, 1, 1,
0.1844929, 2.068596, 1.256359, 0, 0.6352941, 1, 1,
0.1849511, 0.9143959, -0.8888916, 0, 0.627451, 1, 1,
0.1862779, -0.04869262, 1.28559, 0, 0.6235294, 1, 1,
0.1881269, -0.1016725, 0.2586948, 0, 0.6156863, 1, 1,
0.1957719, -0.2894601, 1.867787, 0, 0.6117647, 1, 1,
0.1982245, -0.08748566, 0.1464398, 0, 0.6039216, 1, 1,
0.2029946, 0.1572716, 0.5747466, 0, 0.5960785, 1, 1,
0.2043462, -2.086924, 3.573323, 0, 0.5921569, 1, 1,
0.2056255, 0.04877333, 2.545493, 0, 0.5843138, 1, 1,
0.2059986, -0.6602333, 3.486629, 0, 0.5803922, 1, 1,
0.2087358, -1.977557, 3.013929, 0, 0.572549, 1, 1,
0.209215, -0.3099107, 3.105189, 0, 0.5686275, 1, 1,
0.2139624, -0.4915183, 0.3848737, 0, 0.5607843, 1, 1,
0.2173721, -0.6123211, 3.662805, 0, 0.5568628, 1, 1,
0.2243162, 0.8514984, -0.3360166, 0, 0.5490196, 1, 1,
0.2293143, 1.012176, 1.131638, 0, 0.5450981, 1, 1,
0.2318828, -1.817715, 3.529312, 0, 0.5372549, 1, 1,
0.2357745, 1.775095, 0.5064833, 0, 0.5333334, 1, 1,
0.2359725, 1.521031, -2.144142, 0, 0.5254902, 1, 1,
0.2361336, -0.6987547, 2.906513, 0, 0.5215687, 1, 1,
0.2364535, 0.2986986, 1.355968, 0, 0.5137255, 1, 1,
0.2424707, -1.174728, 4.625869, 0, 0.509804, 1, 1,
0.2425681, -0.7705542, 2.939644, 0, 0.5019608, 1, 1,
0.2448976, -1.841015, 2.554984, 0, 0.4941176, 1, 1,
0.2450404, 0.4848284, -1.047897, 0, 0.4901961, 1, 1,
0.2459371, 0.6707491, -1.059964, 0, 0.4823529, 1, 1,
0.2473133, -1.024137, 2.242645, 0, 0.4784314, 1, 1,
0.2536718, 0.7899873, -0.559497, 0, 0.4705882, 1, 1,
0.2547112, 1.229075, -0.9049947, 0, 0.4666667, 1, 1,
0.2563264, 0.4887436, 0.2339326, 0, 0.4588235, 1, 1,
0.2583258, 0.1664648, -0.1884494, 0, 0.454902, 1, 1,
0.2585731, 1.07156, 2.495184, 0, 0.4470588, 1, 1,
0.2595247, 2.135326, -0.3346071, 0, 0.4431373, 1, 1,
0.2605203, 2.058091, -0.1234776, 0, 0.4352941, 1, 1,
0.2648799, -2.114206, 2.774382, 0, 0.4313726, 1, 1,
0.270342, -0.3904406, 2.590585, 0, 0.4235294, 1, 1,
0.273822, -0.7699775, 1.607458, 0, 0.4196078, 1, 1,
0.2753287, 0.01363375, 0.5738611, 0, 0.4117647, 1, 1,
0.2780945, 0.3093422, 0.505201, 0, 0.4078431, 1, 1,
0.278268, -0.6987675, 1.192747, 0, 0.4, 1, 1,
0.2783304, -0.703518, 3.894771, 0, 0.3921569, 1, 1,
0.2818157, 1.704588, 0.5983088, 0, 0.3882353, 1, 1,
0.2844801, 1.45901, 1.348859, 0, 0.3803922, 1, 1,
0.285693, -1.379765, 2.042481, 0, 0.3764706, 1, 1,
0.2876133, 0.4824768, 0.3280706, 0, 0.3686275, 1, 1,
0.2883624, -0.179164, 2.270787, 0, 0.3647059, 1, 1,
0.2934156, 0.4566022, 0.03902087, 0, 0.3568628, 1, 1,
0.2934934, 0.5939869, 0.04996777, 0, 0.3529412, 1, 1,
0.2939935, -1.037068, 2.286664, 0, 0.345098, 1, 1,
0.2946627, 0.2644289, -0.4153605, 0, 0.3411765, 1, 1,
0.2979467, -0.5529112, 2.450696, 0, 0.3333333, 1, 1,
0.3010378, 0.7339318, -1.652366, 0, 0.3294118, 1, 1,
0.3030272, 1.994352, 0.2672468, 0, 0.3215686, 1, 1,
0.3041099, 1.949276, -1.34571, 0, 0.3176471, 1, 1,
0.3041921, 0.8289757, 0.6809675, 0, 0.3098039, 1, 1,
0.30451, 0.3185132, 1.198801, 0, 0.3058824, 1, 1,
0.3073691, 0.5765904, -0.5696949, 0, 0.2980392, 1, 1,
0.3095406, 0.9921862, -0.001445086, 0, 0.2901961, 1, 1,
0.315279, -1.078014, 1.66233, 0, 0.2862745, 1, 1,
0.3214654, 0.1408173, 1.194515, 0, 0.2784314, 1, 1,
0.3225933, -0.4147243, 3.574999, 0, 0.2745098, 1, 1,
0.3256609, -2.741931, 2.586751, 0, 0.2666667, 1, 1,
0.3263641, -0.389033, -1.633859, 0, 0.2627451, 1, 1,
0.3290241, -0.8374603, 3.756296, 0, 0.254902, 1, 1,
0.3291546, -0.1433922, 1.867726, 0, 0.2509804, 1, 1,
0.3319461, -0.992404, 1.457753, 0, 0.2431373, 1, 1,
0.3330526, -0.3062535, 3.411467, 0, 0.2392157, 1, 1,
0.3341531, 0.7560374, 2.507313, 0, 0.2313726, 1, 1,
0.3371291, 1.422272, 1.230291, 0, 0.227451, 1, 1,
0.3451258, -0.8492088, 1.820965, 0, 0.2196078, 1, 1,
0.3469822, 1.644719, 1.786952, 0, 0.2156863, 1, 1,
0.3513771, -1.725016, 2.656109, 0, 0.2078431, 1, 1,
0.3579394, 0.5397246, -0.1646478, 0, 0.2039216, 1, 1,
0.3580062, -0.9340268, 3.83331, 0, 0.1960784, 1, 1,
0.3596093, -0.3944839, 4.022287, 0, 0.1882353, 1, 1,
0.3621942, 0.3296261, 0.1963999, 0, 0.1843137, 1, 1,
0.3665889, -1.074242, 2.923004, 0, 0.1764706, 1, 1,
0.3672555, -1.630468, 5.226852, 0, 0.172549, 1, 1,
0.3676813, -1.435947, 3.318758, 0, 0.1647059, 1, 1,
0.3709511, -0.3683216, 0.5922012, 0, 0.1607843, 1, 1,
0.3732173, -0.9581704, 2.41116, 0, 0.1529412, 1, 1,
0.3799832, 0.4444399, 2.194598, 0, 0.1490196, 1, 1,
0.3907045, 0.2553334, 0.7910066, 0, 0.1411765, 1, 1,
0.3945912, 0.54422, 0.2047437, 0, 0.1372549, 1, 1,
0.3955746, 0.01152003, 3.060528, 0, 0.1294118, 1, 1,
0.3970688, 0.6610566, 0.07259934, 0, 0.1254902, 1, 1,
0.3984256, 1.358552, -0.04396493, 0, 0.1176471, 1, 1,
0.4050767, -1.360379, 2.59833, 0, 0.1137255, 1, 1,
0.4060889, 0.2146269, 0.8382934, 0, 0.1058824, 1, 1,
0.4073251, -0.6836839, 4.012602, 0, 0.09803922, 1, 1,
0.409548, 0.1709068, 1.738054, 0, 0.09411765, 1, 1,
0.4126138, 0.3988574, -0.2125842, 0, 0.08627451, 1, 1,
0.4127288, -2.373195, 2.534915, 0, 0.08235294, 1, 1,
0.417615, -0.04059096, 1.789944, 0, 0.07450981, 1, 1,
0.4264446, -0.03888181, 0.5418029, 0, 0.07058824, 1, 1,
0.4279316, -0.4076288, 1.579929, 0, 0.0627451, 1, 1,
0.4304069, -1.248283, 3.67842, 0, 0.05882353, 1, 1,
0.4325872, 0.7793669, 0.1709987, 0, 0.05098039, 1, 1,
0.4365393, 0.6345444, 1.075293, 0, 0.04705882, 1, 1,
0.4369513, 1.290075, 1.622398, 0, 0.03921569, 1, 1,
0.437305, -0.8089907, 1.371983, 0, 0.03529412, 1, 1,
0.439777, -2.249998, 1.873086, 0, 0.02745098, 1, 1,
0.4429615, -0.1917516, 2.327373, 0, 0.02352941, 1, 1,
0.4443052, 0.5288751, 0.8999754, 0, 0.01568628, 1, 1,
0.4511865, 0.370435, 0.01369495, 0, 0.01176471, 1, 1,
0.4528765, -0.5285522, 0.8080996, 0, 0.003921569, 1, 1,
0.4534325, 0.8557658, 0.3427292, 0.003921569, 0, 1, 1,
0.4539329, -1.285514, 3.223785, 0.007843138, 0, 1, 1,
0.4571574, -0.07199324, 1.064511, 0.01568628, 0, 1, 1,
0.4581449, 2.16142, 1.148507, 0.01960784, 0, 1, 1,
0.459167, -0.8874803, 2.499886, 0.02745098, 0, 1, 1,
0.4593615, 0.4098442, -0.6172798, 0.03137255, 0, 1, 1,
0.4659741, 0.3044347, 0.3699396, 0.03921569, 0, 1, 1,
0.4691046, 1.20801, -1.554212, 0.04313726, 0, 1, 1,
0.4701976, -2.412549, 2.457723, 0.05098039, 0, 1, 1,
0.4759115, 0.136559, 1.531935, 0.05490196, 0, 1, 1,
0.4810431, -2.645026, 5.257842, 0.0627451, 0, 1, 1,
0.4867148, 0.5599942, -0.1419951, 0.06666667, 0, 1, 1,
0.4873377, -0.1007917, 1.617489, 0.07450981, 0, 1, 1,
0.4908103, 1.543086, 0.8202491, 0.07843138, 0, 1, 1,
0.494069, 0.3501709, 1.60707, 0.08627451, 0, 1, 1,
0.4993406, -0.9887452, 2.977057, 0.09019608, 0, 1, 1,
0.5102897, -0.551816, 2.395361, 0.09803922, 0, 1, 1,
0.5165733, -0.5115321, 1.205066, 0.1058824, 0, 1, 1,
0.5166398, 0.3793592, 2.11225, 0.1098039, 0, 1, 1,
0.5215662, 0.3532346, 0.9106433, 0.1176471, 0, 1, 1,
0.5253388, 0.2531813, 0.3685184, 0.1215686, 0, 1, 1,
0.5259956, 2.044211, 1.371798, 0.1294118, 0, 1, 1,
0.5264181, -0.2101248, 2.835837, 0.1333333, 0, 1, 1,
0.5283908, 0.863707, 0.9438764, 0.1411765, 0, 1, 1,
0.5293988, 1.522837, 1.172992, 0.145098, 0, 1, 1,
0.529987, -1.642722, 0.6929672, 0.1529412, 0, 1, 1,
0.5319704, -0.3270452, 1.41903, 0.1568628, 0, 1, 1,
0.5358622, 0.1904402, 3.528547, 0.1647059, 0, 1, 1,
0.537659, -0.3440322, 2.768257, 0.1686275, 0, 1, 1,
0.5400235, -0.3383215, 3.18831, 0.1764706, 0, 1, 1,
0.540239, -0.5921814, 2.638166, 0.1803922, 0, 1, 1,
0.5422629, 0.3573115, 3.019682, 0.1882353, 0, 1, 1,
0.5459043, 0.4645829, 1.649224, 0.1921569, 0, 1, 1,
0.5466914, -0.3979585, 3.805806, 0.2, 0, 1, 1,
0.5521991, -0.6890258, 2.529957, 0.2078431, 0, 1, 1,
0.5565856, -0.6326975, 2.13484, 0.2117647, 0, 1, 1,
0.5615694, -0.1243453, 2.667641, 0.2196078, 0, 1, 1,
0.5628172, -0.1193885, 1.093234, 0.2235294, 0, 1, 1,
0.5637272, -0.8349763, 2.207291, 0.2313726, 0, 1, 1,
0.5642623, -0.5625064, 3.550335, 0.2352941, 0, 1, 1,
0.5647941, -0.9485684, 1.110367, 0.2431373, 0, 1, 1,
0.565581, 0.1973214, 1.88205, 0.2470588, 0, 1, 1,
0.5669041, -0.6455652, 3.831018, 0.254902, 0, 1, 1,
0.5670506, 0.8908497, 0.6761978, 0.2588235, 0, 1, 1,
0.5691367, -1.470377, 3.046279, 0.2666667, 0, 1, 1,
0.5701967, 0.5677265, -0.2035633, 0.2705882, 0, 1, 1,
0.5703784, -1.751094, 3.498215, 0.2784314, 0, 1, 1,
0.5708957, 1.739077, -0.2664708, 0.282353, 0, 1, 1,
0.5726452, 0.2850787, -0.3987474, 0.2901961, 0, 1, 1,
0.5727527, -1.618828, 3.465408, 0.2941177, 0, 1, 1,
0.5764534, 0.2273107, 0.6819773, 0.3019608, 0, 1, 1,
0.5781245, -0.5783779, 2.730285, 0.3098039, 0, 1, 1,
0.5798866, -0.2254128, 2.700405, 0.3137255, 0, 1, 1,
0.5813269, -0.9981999, 3.345328, 0.3215686, 0, 1, 1,
0.5813337, 1.766922, -1.350793, 0.3254902, 0, 1, 1,
0.5821496, -0.325675, 1.767551, 0.3333333, 0, 1, 1,
0.5825368, 2.131852, -0.1050589, 0.3372549, 0, 1, 1,
0.5850258, 1.690892, -0.05553102, 0.345098, 0, 1, 1,
0.5850284, -0.4328381, 2.500105, 0.3490196, 0, 1, 1,
0.5861267, -0.3446781, 2.401237, 0.3568628, 0, 1, 1,
0.5872946, -1.033219, 2.796663, 0.3607843, 0, 1, 1,
0.5897693, -0.152878, 0.6250473, 0.3686275, 0, 1, 1,
0.5908567, 0.3331447, 1.453512, 0.372549, 0, 1, 1,
0.5960006, 0.2014413, 3.987159, 0.3803922, 0, 1, 1,
0.5996976, -0.2213548, 4.16774, 0.3843137, 0, 1, 1,
0.6024374, 0.6338344, 2.155877, 0.3921569, 0, 1, 1,
0.6064463, -0.8559656, 4.195122, 0.3960784, 0, 1, 1,
0.6091975, 0.2199057, 1.515485, 0.4039216, 0, 1, 1,
0.6130303, -0.2335775, 3.038947, 0.4117647, 0, 1, 1,
0.6143091, -1.014627, 2.244595, 0.4156863, 0, 1, 1,
0.6193722, -1.89827, 3.465259, 0.4235294, 0, 1, 1,
0.6227958, -2.423191, 2.178128, 0.427451, 0, 1, 1,
0.6236809, -0.5277413, 2.285706, 0.4352941, 0, 1, 1,
0.6237337, -1.762485, 1.899197, 0.4392157, 0, 1, 1,
0.6257078, -1.208589, 1.099473, 0.4470588, 0, 1, 1,
0.6271921, -0.4027556, -0.1364486, 0.4509804, 0, 1, 1,
0.6320298, 0.7100545, 1.502922, 0.4588235, 0, 1, 1,
0.6417048, 0.7945102, 0.3255959, 0.4627451, 0, 1, 1,
0.6431594, -0.4328495, 4.455877, 0.4705882, 0, 1, 1,
0.6464789, 0.1405344, 0.1987142, 0.4745098, 0, 1, 1,
0.6489166, -0.4852095, 1.899586, 0.4823529, 0, 1, 1,
0.652001, 1.54358, -0.3106651, 0.4862745, 0, 1, 1,
0.6548359, -0.7400836, 2.712513, 0.4941176, 0, 1, 1,
0.6610919, -1.527561, 4.133717, 0.5019608, 0, 1, 1,
0.6657485, -0.9613872, 4.757849, 0.5058824, 0, 1, 1,
0.6683741, 0.1607875, 0.6148533, 0.5137255, 0, 1, 1,
0.6686583, 1.390846, -0.8439833, 0.5176471, 0, 1, 1,
0.6697956, -0.0416997, 1.201673, 0.5254902, 0, 1, 1,
0.6721056, -0.2094225, 0.04329913, 0.5294118, 0, 1, 1,
0.674865, 0.08735136, 1.426876, 0.5372549, 0, 1, 1,
0.6757469, -0.5182462, 1.096624, 0.5411765, 0, 1, 1,
0.6846462, -1.018542, 1.335046, 0.5490196, 0, 1, 1,
0.6985409, 1.595836, 0.9860018, 0.5529412, 0, 1, 1,
0.7084083, 2.552196, 2.129619, 0.5607843, 0, 1, 1,
0.7097875, -0.265075, 0.3793667, 0.5647059, 0, 1, 1,
0.712356, 0.842139, 0.5986146, 0.572549, 0, 1, 1,
0.7191067, 0.2738493, 0.650648, 0.5764706, 0, 1, 1,
0.7333714, 0.2217951, 1.175204, 0.5843138, 0, 1, 1,
0.7429811, -0.677665, 1.366944, 0.5882353, 0, 1, 1,
0.744141, -0.3463378, 1.746776, 0.5960785, 0, 1, 1,
0.748524, 0.9354798, 0.2309634, 0.6039216, 0, 1, 1,
0.7508317, -0.1968081, 0.8997408, 0.6078432, 0, 1, 1,
0.7553031, -0.5116393, 3.263104, 0.6156863, 0, 1, 1,
0.7567405, -1.074757, 2.308146, 0.6196079, 0, 1, 1,
0.7588173, 0.2653922, 1.047224, 0.627451, 0, 1, 1,
0.7603891, -0.4827239, 0.4878053, 0.6313726, 0, 1, 1,
0.7656464, 2.699301, -0.7994605, 0.6392157, 0, 1, 1,
0.7667291, -0.9030897, 2.332408, 0.6431373, 0, 1, 1,
0.7718835, 0.7721055, 1.05536, 0.6509804, 0, 1, 1,
0.7777521, -0.03781483, 1.019562, 0.654902, 0, 1, 1,
0.782638, 1.007268, 0.4890293, 0.6627451, 0, 1, 1,
0.784045, 1.05284, 1.660293, 0.6666667, 0, 1, 1,
0.784179, 0.721422, 0.536082, 0.6745098, 0, 1, 1,
0.7855867, -0.4969967, 2.186891, 0.6784314, 0, 1, 1,
0.7877135, 2.71573, -0.1271235, 0.6862745, 0, 1, 1,
0.7898426, -0.6998731, 2.369541, 0.6901961, 0, 1, 1,
0.7917214, 0.761977, 0.3935454, 0.6980392, 0, 1, 1,
0.7940667, 0.5219284, 0.9384221, 0.7058824, 0, 1, 1,
0.8007635, 1.845845, -1.510851, 0.7098039, 0, 1, 1,
0.8015471, -0.5364446, 3.32986, 0.7176471, 0, 1, 1,
0.8036219, -0.3579541, 0.975328, 0.7215686, 0, 1, 1,
0.8201688, -1.660684, 3.366086, 0.7294118, 0, 1, 1,
0.8276638, 0.3033583, 0.6555656, 0.7333333, 0, 1, 1,
0.8302165, 0.01913189, 4.051113, 0.7411765, 0, 1, 1,
0.83176, 0.8994461, 1.936857, 0.7450981, 0, 1, 1,
0.8319593, -0.675283, 1.850284, 0.7529412, 0, 1, 1,
0.8359544, -0.1109002, 1.80867, 0.7568628, 0, 1, 1,
0.8426517, 2.167466, -1.359957, 0.7647059, 0, 1, 1,
0.8460407, -0.6515808, 2.242183, 0.7686275, 0, 1, 1,
0.8480267, -0.6885343, 2.053897, 0.7764706, 0, 1, 1,
0.8491048, -0.3313592, 1.92337, 0.7803922, 0, 1, 1,
0.8506771, -1.455406, 1.412027, 0.7882353, 0, 1, 1,
0.8513609, -2.444794, 3.41898, 0.7921569, 0, 1, 1,
0.8709536, -1.391744, 2.543077, 0.8, 0, 1, 1,
0.8773249, -0.7291576, 2.596978, 0.8078431, 0, 1, 1,
0.8793412, 1.303689, 0.3975736, 0.8117647, 0, 1, 1,
0.8819194, 0.5784743, 1.128588, 0.8196079, 0, 1, 1,
0.8835574, -0.7738016, 1.139434, 0.8235294, 0, 1, 1,
0.8876582, 0.3752446, -0.4825996, 0.8313726, 0, 1, 1,
0.8907769, -0.1408209, 3.793579, 0.8352941, 0, 1, 1,
0.8931398, 0.112554, 0.920517, 0.8431373, 0, 1, 1,
0.8949521, -2.19547, 4.435307, 0.8470588, 0, 1, 1,
0.9008231, 0.547419, 1.9488, 0.854902, 0, 1, 1,
0.9052731, -0.1894134, -0.2582978, 0.8588235, 0, 1, 1,
0.9058835, 0.390121, 1.596183, 0.8666667, 0, 1, 1,
0.9085325, -0.8788936, 1.787547, 0.8705882, 0, 1, 1,
0.9128792, 0.1285666, 1.121009, 0.8784314, 0, 1, 1,
0.921432, 1.097678, 1.720185, 0.8823529, 0, 1, 1,
0.9218814, 2.057252, 0.1726091, 0.8901961, 0, 1, 1,
0.9263937, 1.486869, -1.075327, 0.8941177, 0, 1, 1,
0.9316833, -1.978656, 4.097328, 0.9019608, 0, 1, 1,
0.9347571, -1.054121, 1.452115, 0.9098039, 0, 1, 1,
0.9362425, 1.646616, 0.1821286, 0.9137255, 0, 1, 1,
0.9378223, -0.7656156, 1.600899, 0.9215686, 0, 1, 1,
0.9385554, -1.408028, 1.441635, 0.9254902, 0, 1, 1,
0.9537045, 1.215194, -0.2838183, 0.9333333, 0, 1, 1,
0.9566998, 2.01806, 0.7250727, 0.9372549, 0, 1, 1,
0.9656068, -0.9118989, 2.458322, 0.945098, 0, 1, 1,
0.9690161, -0.9768704, 2.821137, 0.9490196, 0, 1, 1,
0.9710867, -0.07454345, 0.6052639, 0.9568627, 0, 1, 1,
0.9766715, -0.5154136, 3.951278, 0.9607843, 0, 1, 1,
0.9799442, 0.9654588, 1.953268, 0.9686275, 0, 1, 1,
0.9828534, 0.9864358, 1.048527, 0.972549, 0, 1, 1,
0.9893821, 0.6046317, -0.2511455, 0.9803922, 0, 1, 1,
0.9959909, -0.03391201, 2.715654, 0.9843137, 0, 1, 1,
0.9989614, 1.305264, 1.206182, 0.9921569, 0, 1, 1,
0.9994653, 0.1842314, 1.090812, 0.9960784, 0, 1, 1,
1.002551, -0.3743176, 1.386282, 1, 0, 0.9960784, 1,
1.002745, 0.5418473, 0.8519374, 1, 0, 0.9882353, 1,
1.003168, 0.1141536, 2.489059, 1, 0, 0.9843137, 1,
1.003824, -0.2289145, 1.582544, 1, 0, 0.9764706, 1,
1.007749, -1.317597, 4.239389, 1, 0, 0.972549, 1,
1.009038, 1.40563, 0.02482249, 1, 0, 0.9647059, 1,
1.012502, -0.5873283, 2.307084, 1, 0, 0.9607843, 1,
1.013337, 0.365351, -0.1836449, 1, 0, 0.9529412, 1,
1.013703, 0.2628269, 2.627921, 1, 0, 0.9490196, 1,
1.01791, 0.1750805, 1.244561, 1, 0, 0.9411765, 1,
1.017931, 0.3033367, 1.824126, 1, 0, 0.9372549, 1,
1.018517, -1.570369, 3.849058, 1, 0, 0.9294118, 1,
1.020915, -0.06289067, 2.443655, 1, 0, 0.9254902, 1,
1.021608, -0.3778877, 1.883242, 1, 0, 0.9176471, 1,
1.030742, -0.7114933, 0.3934495, 1, 0, 0.9137255, 1,
1.035991, -0.729001, 2.507563, 1, 0, 0.9058824, 1,
1.062866, -1.472996, 3.764996, 1, 0, 0.9019608, 1,
1.065512, 1.253442, -1.2003, 1, 0, 0.8941177, 1,
1.066193, 0.253295, 2.556938, 1, 0, 0.8862745, 1,
1.073147, 0.1880084, 0.9162477, 1, 0, 0.8823529, 1,
1.080266, 0.4951268, 0.6950737, 1, 0, 0.8745098, 1,
1.0827, 1.504201, 0.6344366, 1, 0, 0.8705882, 1,
1.08861, 0.0240419, 1.509274, 1, 0, 0.8627451, 1,
1.09144, -0.76346, 3.99035, 1, 0, 0.8588235, 1,
1.091709, 0.5707172, 0.3887016, 1, 0, 0.8509804, 1,
1.092324, 0.8937643, 1.526809, 1, 0, 0.8470588, 1,
1.099311, 0.1768629, 1.943246, 1, 0, 0.8392157, 1,
1.100993, 0.4441323, 2.863757, 1, 0, 0.8352941, 1,
1.107532, 1.060004, 1.2042, 1, 0, 0.827451, 1,
1.114977, -1.436694, 4.330344, 1, 0, 0.8235294, 1,
1.11603, 0.05856376, 1.842898, 1, 0, 0.8156863, 1,
1.11661, 1.439723, -2.313435, 1, 0, 0.8117647, 1,
1.119797, 1.320187, 0.06723708, 1, 0, 0.8039216, 1,
1.125118, -0.4618099, 1.886496, 1, 0, 0.7960784, 1,
1.132946, 0.1945673, 1.392481, 1, 0, 0.7921569, 1,
1.137978, 1.191626, 2.189613, 1, 0, 0.7843137, 1,
1.141739, 1.520431, 0.4400321, 1, 0, 0.7803922, 1,
1.145481, 0.05692032, 3.056953, 1, 0, 0.772549, 1,
1.154184, 0.1978221, 0.4907001, 1, 0, 0.7686275, 1,
1.163282, -0.8160693, 1.41001, 1, 0, 0.7607843, 1,
1.164262, 1.070532, 0.567143, 1, 0, 0.7568628, 1,
1.170313, 0.8996861, -0.1653681, 1, 0, 0.7490196, 1,
1.172668, 0.54782, 0.8003367, 1, 0, 0.7450981, 1,
1.182874, -0.7908059, 1.273623, 1, 0, 0.7372549, 1,
1.183186, 0.2114694, 1.197572, 1, 0, 0.7333333, 1,
1.187045, -0.3501833, 2.187695, 1, 0, 0.7254902, 1,
1.19769, -0.01700091, 1.91948, 1, 0, 0.7215686, 1,
1.202204, 0.3962494, 1.902549, 1, 0, 0.7137255, 1,
1.206371, -0.1545784, 2.348528, 1, 0, 0.7098039, 1,
1.208622, -0.9758558, 1.283883, 1, 0, 0.7019608, 1,
1.209374, 1.549191, 0.8955542, 1, 0, 0.6941177, 1,
1.215233, 0.7254818, 1.555086, 1, 0, 0.6901961, 1,
1.216574, 0.139008, 1.739571, 1, 0, 0.682353, 1,
1.217517, -0.280566, 3.724438, 1, 0, 0.6784314, 1,
1.219831, -1.125616, 3.519572, 1, 0, 0.6705883, 1,
1.221668, 1.454381, 0.02419898, 1, 0, 0.6666667, 1,
1.222851, 0.03900382, 1.982695, 1, 0, 0.6588235, 1,
1.227467, 0.5912521, 1.763124, 1, 0, 0.654902, 1,
1.235989, 1.252185, 0.5319135, 1, 0, 0.6470588, 1,
1.236614, -0.6933351, 2.803425, 1, 0, 0.6431373, 1,
1.238266, -1.821692, 1.758738, 1, 0, 0.6352941, 1,
1.24443, -0.9065067, 2.72681, 1, 0, 0.6313726, 1,
1.246819, 0.5025002, 1.842213, 1, 0, 0.6235294, 1,
1.275391, -0.5255509, 1.086706, 1, 0, 0.6196079, 1,
1.279332, 0.2702449, 1.610648, 1, 0, 0.6117647, 1,
1.279723, 0.1949259, 2.615973, 1, 0, 0.6078432, 1,
1.282782, -1.498553, 3.684599, 1, 0, 0.6, 1,
1.299582, -1.141395, 2.722254, 1, 0, 0.5921569, 1,
1.301385, 0.441001, 2.209025, 1, 0, 0.5882353, 1,
1.309056, 1.050989, 0.7555215, 1, 0, 0.5803922, 1,
1.310128, -1.339502, 3.022467, 1, 0, 0.5764706, 1,
1.312986, -1.244581, 2.250162, 1, 0, 0.5686275, 1,
1.315578, 0.02099535, 2.221619, 1, 0, 0.5647059, 1,
1.319391, 0.194772, 1.549541, 1, 0, 0.5568628, 1,
1.320285, -1.235097, 0.4216553, 1, 0, 0.5529412, 1,
1.332229, 0.2300473, 2.314657, 1, 0, 0.5450981, 1,
1.332803, -0.374812, 0.7639892, 1, 0, 0.5411765, 1,
1.337199, -0.3640749, 1.836979, 1, 0, 0.5333334, 1,
1.34284, -1.220826, 1.198204, 1, 0, 0.5294118, 1,
1.34865, -1.557475, 2.553997, 1, 0, 0.5215687, 1,
1.349928, -0.6885222, 1.644478, 1, 0, 0.5176471, 1,
1.352296, -0.593748, 2.003402, 1, 0, 0.509804, 1,
1.355947, 0.2241197, 2.329258, 1, 0, 0.5058824, 1,
1.3631, 0.6428228, 3.347088, 1, 0, 0.4980392, 1,
1.36551, -0.1110348, 1.391349, 1, 0, 0.4901961, 1,
1.372346, 0.4386081, 1.168811, 1, 0, 0.4862745, 1,
1.378709, 0.06940581, 2.706548, 1, 0, 0.4784314, 1,
1.393966, 0.6355479, 0.8767755, 1, 0, 0.4745098, 1,
1.399168, 0.3705472, 1.755421, 1, 0, 0.4666667, 1,
1.401776, -0.3442475, 3.076859, 1, 0, 0.4627451, 1,
1.411018, 0.6648561, 1.434247, 1, 0, 0.454902, 1,
1.430128, -0.1799285, 4.174437, 1, 0, 0.4509804, 1,
1.439567, -1.06411, 2.463076, 1, 0, 0.4431373, 1,
1.450417, -0.3112332, 0.9511892, 1, 0, 0.4392157, 1,
1.457546, -1.491427, 1.386307, 1, 0, 0.4313726, 1,
1.461716, 1.672957, -0.5088547, 1, 0, 0.427451, 1,
1.462648, 0.3164736, 0.101206, 1, 0, 0.4196078, 1,
1.487039, -0.5634775, 1.041377, 1, 0, 0.4156863, 1,
1.490153, -2.155579, 1.70221, 1, 0, 0.4078431, 1,
1.517574, -0.201804, 1.143407, 1, 0, 0.4039216, 1,
1.518371, 1.810006, 2.161173, 1, 0, 0.3960784, 1,
1.526439, -0.1649787, 2.112629, 1, 0, 0.3882353, 1,
1.534255, -0.5543681, 1.495553, 1, 0, 0.3843137, 1,
1.539951, 1.636971, -1.362213, 1, 0, 0.3764706, 1,
1.54724, 0.9791709, -0.5735734, 1, 0, 0.372549, 1,
1.565581, -1.757077, 1.469909, 1, 0, 0.3647059, 1,
1.566033, 2.003688, -0.2701145, 1, 0, 0.3607843, 1,
1.590932, 0.07596809, 2.173081, 1, 0, 0.3529412, 1,
1.59626, 0.140024, 0.7369393, 1, 0, 0.3490196, 1,
1.601777, 1.153595, 0.3946803, 1, 0, 0.3411765, 1,
1.617867, 0.4547279, 0.6111141, 1, 0, 0.3372549, 1,
1.620491, 0.05097912, 1.915177, 1, 0, 0.3294118, 1,
1.62176, 2.379583, 0.6148376, 1, 0, 0.3254902, 1,
1.628204, 0.6888114, 0.3203976, 1, 0, 0.3176471, 1,
1.637303, -0.2683622, 1.967609, 1, 0, 0.3137255, 1,
1.677733, -0.2290164, 1.799727, 1, 0, 0.3058824, 1,
1.688768, -2.242617, 2.189277, 1, 0, 0.2980392, 1,
1.703893, 1.204854, -0.2170232, 1, 0, 0.2941177, 1,
1.706233, -1.329986, 0.6117074, 1, 0, 0.2862745, 1,
1.727961, 0.5986485, 0.7265713, 1, 0, 0.282353, 1,
1.747926, -1.247588, 3.755231, 1, 0, 0.2745098, 1,
1.768908, -0.5792915, 1.758671, 1, 0, 0.2705882, 1,
1.769086, -0.01576903, 0.09400265, 1, 0, 0.2627451, 1,
1.789685, 0.7204468, 0.6371233, 1, 0, 0.2588235, 1,
1.790613, 0.6834398, 2.731952, 1, 0, 0.2509804, 1,
1.795607, 1.2297, 1.062849, 1, 0, 0.2470588, 1,
1.79667, 0.05800752, 0.758051, 1, 0, 0.2392157, 1,
1.798349, 0.381639, 0.961474, 1, 0, 0.2352941, 1,
1.804215, 0.1848044, 1.853559, 1, 0, 0.227451, 1,
1.838209, -1.383834, 1.669776, 1, 0, 0.2235294, 1,
1.842439, -0.7832048, 1.931596, 1, 0, 0.2156863, 1,
1.846866, 0.6080399, 1.431792, 1, 0, 0.2117647, 1,
1.849225, 0.3517879, 0.8063754, 1, 0, 0.2039216, 1,
1.855317, -0.4833558, 1.497994, 1, 0, 0.1960784, 1,
1.872942, 0.2258792, 1.219164, 1, 0, 0.1921569, 1,
1.874979, -1.369927, 3.960363, 1, 0, 0.1843137, 1,
1.891077, 0.8259309, 1.546438, 1, 0, 0.1803922, 1,
1.924176, 1.012337, 1.380559, 1, 0, 0.172549, 1,
1.940806, -0.4950535, 2.255611, 1, 0, 0.1686275, 1,
1.947285, 1.466941, -0.05356276, 1, 0, 0.1607843, 1,
1.960217, 0.9958102, 2.628812, 1, 0, 0.1568628, 1,
1.972787, 2.408888, 0.6980202, 1, 0, 0.1490196, 1,
1.996396, -0.2502415, 1.075463, 1, 0, 0.145098, 1,
2.057697, -0.4169483, 1.606317, 1, 0, 0.1372549, 1,
2.076002, -1.411615, 3.050378, 1, 0, 0.1333333, 1,
2.099908, -0.6211835, 1.590218, 1, 0, 0.1254902, 1,
2.106155, 0.4568594, 1.197495, 1, 0, 0.1215686, 1,
2.13397, 0.6666675, -0.3786677, 1, 0, 0.1137255, 1,
2.15345, 0.1214167, 0.6157576, 1, 0, 0.1098039, 1,
2.173993, -0.6672809, 1.327746, 1, 0, 0.1019608, 1,
2.188397, 0.5626979, 0.8876623, 1, 0, 0.09411765, 1,
2.196049, 1.055632, 1.117084, 1, 0, 0.09019608, 1,
2.215121, -0.04018978, 1.033239, 1, 0, 0.08235294, 1,
2.269573, -0.9030405, 1.342824, 1, 0, 0.07843138, 1,
2.320414, 1.382854, 2.51189, 1, 0, 0.07058824, 1,
2.386111, -0.3445899, 1.689493, 1, 0, 0.06666667, 1,
2.406364, 0.4971192, 1.364649, 1, 0, 0.05882353, 1,
2.446448, -0.2068878, 1.791129, 1, 0, 0.05490196, 1,
2.481339, 0.1966091, 0.8651781, 1, 0, 0.04705882, 1,
2.50911, -3.314363, 2.179444, 1, 0, 0.04313726, 1,
2.519086, -1.133862, 1.980362, 1, 0, 0.03529412, 1,
2.520817, -0.9516755, 1.270083, 1, 0, 0.03137255, 1,
2.592293, 0.03148321, 1.572865, 1, 0, 0.02352941, 1,
2.675421, -1.895963, 2.906631, 1, 0, 0.01960784, 1,
2.728848, -0.3245295, 4.220248, 1, 0, 0.01176471, 1,
3.362505, 0.7048177, 1.482673, 1, 0, 0.007843138, 1
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
-0.03188574, -4.539263, -7.752672, 0, -0.5, 0.5, 0.5,
-0.03188574, -4.539263, -7.752672, 1, -0.5, 0.5, 0.5,
-0.03188574, -4.539263, -7.752672, 1, 1.5, 0.5, 0.5,
-0.03188574, -4.539263, -7.752672, 0, 1.5, 0.5, 0.5
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
-4.576974, -0.03527701, -7.752672, 0, -0.5, 0.5, 0.5,
-4.576974, -0.03527701, -7.752672, 1, -0.5, 0.5, 0.5,
-4.576974, -0.03527701, -7.752672, 1, 1.5, 0.5, 0.5,
-4.576974, -0.03527701, -7.752672, 0, 1.5, 0.5, 0.5
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
-4.576974, -4.539263, 0.006741524, 0, -0.5, 0.5, 0.5,
-4.576974, -4.539263, 0.006741524, 1, -0.5, 0.5, 0.5,
-4.576974, -4.539263, 0.006741524, 1, 1.5, 0.5, 0.5,
-4.576974, -4.539263, 0.006741524, 0, 1.5, 0.5, 0.5
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
-3, -3.499882, -5.962039,
3, -3.499882, -5.962039,
-3, -3.499882, -5.962039,
-3, -3.673112, -6.260478,
-2, -3.499882, -5.962039,
-2, -3.673112, -6.260478,
-1, -3.499882, -5.962039,
-1, -3.673112, -6.260478,
0, -3.499882, -5.962039,
0, -3.673112, -6.260478,
1, -3.499882, -5.962039,
1, -3.673112, -6.260478,
2, -3.499882, -5.962039,
2, -3.673112, -6.260478,
3, -3.499882, -5.962039,
3, -3.673112, -6.260478
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
-3, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
-3, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
-3, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
-3, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
-2, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
-2, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
-2, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
-2, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
-1, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
-1, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
-1, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
-1, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
0, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
0, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
0, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
0, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
1, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
1, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
1, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
1, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
2, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
2, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
2, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
2, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5,
3, -4.019572, -6.857355, 0, -0.5, 0.5, 0.5,
3, -4.019572, -6.857355, 1, -0.5, 0.5, 0.5,
3, -4.019572, -6.857355, 1, 1.5, 0.5, 0.5,
3, -4.019572, -6.857355, 0, 1.5, 0.5, 0.5
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
-3.528108, -3, -5.962039,
-3.528108, 3, -5.962039,
-3.528108, -3, -5.962039,
-3.702919, -3, -6.260478,
-3.528108, -2, -5.962039,
-3.702919, -2, -6.260478,
-3.528108, -1, -5.962039,
-3.702919, -1, -6.260478,
-3.528108, 0, -5.962039,
-3.702919, 0, -6.260478,
-3.528108, 1, -5.962039,
-3.702919, 1, -6.260478,
-3.528108, 2, -5.962039,
-3.702919, 2, -6.260478,
-3.528108, 3, -5.962039,
-3.702919, 3, -6.260478
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
-4.052541, -3, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, -3, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, -3, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, -3, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, -2, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, -2, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, -2, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, -2, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, -1, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, -1, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, -1, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, -1, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, 0, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, 0, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, 0, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, 0, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, 1, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, 1, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, 1, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, 1, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, 2, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, 2, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, 2, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, 2, -6.857355, 0, 1.5, 0.5, 0.5,
-4.052541, 3, -6.857355, 0, -0.5, 0.5, 0.5,
-4.052541, 3, -6.857355, 1, -0.5, 0.5, 0.5,
-4.052541, 3, -6.857355, 1, 1.5, 0.5, 0.5,
-4.052541, 3, -6.857355, 0, 1.5, 0.5, 0.5
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
-3.528108, -3.499882, -4,
-3.528108, -3.499882, 4,
-3.528108, -3.499882, -4,
-3.702919, -3.673112, -4,
-3.528108, -3.499882, -2,
-3.702919, -3.673112, -2,
-3.528108, -3.499882, 0,
-3.702919, -3.673112, 0,
-3.528108, -3.499882, 2,
-3.702919, -3.673112, 2,
-3.528108, -3.499882, 4,
-3.702919, -3.673112, 4
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
-4.052541, -4.019572, -4, 0, -0.5, 0.5, 0.5,
-4.052541, -4.019572, -4, 1, -0.5, 0.5, 0.5,
-4.052541, -4.019572, -4, 1, 1.5, 0.5, 0.5,
-4.052541, -4.019572, -4, 0, 1.5, 0.5, 0.5,
-4.052541, -4.019572, -2, 0, -0.5, 0.5, 0.5,
-4.052541, -4.019572, -2, 1, -0.5, 0.5, 0.5,
-4.052541, -4.019572, -2, 1, 1.5, 0.5, 0.5,
-4.052541, -4.019572, -2, 0, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 0, 0, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 0, 1, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 0, 1, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 0, 0, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 2, 0, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 2, 1, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 2, 1, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 2, 0, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 4, 0, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 4, 1, -0.5, 0.5, 0.5,
-4.052541, -4.019572, 4, 1, 1.5, 0.5, 0.5,
-4.052541, -4.019572, 4, 0, 1.5, 0.5, 0.5
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
-3.528108, -3.499882, -5.962039,
-3.528108, 3.429327, -5.962039,
-3.528108, -3.499882, 5.975522,
-3.528108, 3.429327, 5.975522,
-3.528108, -3.499882, -5.962039,
-3.528108, -3.499882, 5.975522,
-3.528108, 3.429327, -5.962039,
-3.528108, 3.429327, 5.975522,
-3.528108, -3.499882, -5.962039,
3.464336, -3.499882, -5.962039,
-3.528108, -3.499882, 5.975522,
3.464336, -3.499882, 5.975522,
-3.528108, 3.429327, -5.962039,
3.464336, 3.429327, -5.962039,
-3.528108, 3.429327, 5.975522,
3.464336, 3.429327, 5.975522,
3.464336, -3.499882, -5.962039,
3.464336, 3.429327, -5.962039,
3.464336, -3.499882, 5.975522,
3.464336, 3.429327, 5.975522,
3.464336, -3.499882, -5.962039,
3.464336, -3.499882, 5.975522,
3.464336, 3.429327, -5.962039,
3.464336, 3.429327, 5.975522
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
var radius = 8.262278;
var distance = 36.75981;
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
mvMatrix.translate( 0.03188574, 0.03527701, -0.006741524 );
mvMatrix.scale( 1.27757, 1.289229, 0.7483386 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.75981);
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
ofurace<-read.table("ofurace.xyz")
```

```
## Error in read.table("ofurace.xyz"): no lines available in input
```

```r
x<-ofurace$V2
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
```

```r
y<-ofurace$V3
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
```

```r
z<-ofurace$V4
```

```
## Error in eval(expr, envir, enclos): object 'ofurace' not found
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
-3.426276, 0.9318131, -0.8240061, 0, 0, 1, 1, 1,
-2.966082, -0.4057847, -1.461947, 1, 0, 0, 1, 1,
-2.768444, 1.201111, -2.163862, 1, 0, 0, 1, 1,
-2.715896, -0.3770061, -3.102069, 1, 0, 0, 1, 1,
-2.626851, -0.8589433, -1.764669, 1, 0, 0, 1, 1,
-2.457007, -1.179959, -2.678845, 1, 0, 0, 1, 1,
-2.444003, -0.7589499, -2.282707, 0, 0, 0, 1, 1,
-2.418851, 0.1335587, -2.376819, 0, 0, 0, 1, 1,
-2.402046, -0.1030098, -2.920227, 0, 0, 0, 1, 1,
-2.217934, -0.6243287, -1.287912, 0, 0, 0, 1, 1,
-2.20366, -0.9829187, -1.738761, 0, 0, 0, 1, 1,
-2.200899, 0.1475535, 0.6805191, 0, 0, 0, 1, 1,
-2.18779, 1.127583, 0.9512954, 0, 0, 0, 1, 1,
-2.144498, -0.6820744, -2.805084, 1, 1, 1, 1, 1,
-2.06964, 0.05405521, -2.600358, 1, 1, 1, 1, 1,
-2.060306, 1.532343, -0.9155712, 1, 1, 1, 1, 1,
-2.011162, 0.3767354, -1.975901, 1, 1, 1, 1, 1,
-2.001921, 0.2817055, -2.16816, 1, 1, 1, 1, 1,
-1.988041, -0.86123, -1.400382, 1, 1, 1, 1, 1,
-1.980066, -1.347483, -2.632493, 1, 1, 1, 1, 1,
-1.94031, -0.2629271, -1.673741, 1, 1, 1, 1, 1,
-1.911618, -1.503726, -2.085397, 1, 1, 1, 1, 1,
-1.880956, -0.1435084, -0.5595602, 1, 1, 1, 1, 1,
-1.86293, 0.9570274, -1.557773, 1, 1, 1, 1, 1,
-1.840351, 0.7091865, -1.395978, 1, 1, 1, 1, 1,
-1.831986, -1.333291, -3.845868, 1, 1, 1, 1, 1,
-1.829764, -0.2769271, -2.749889, 1, 1, 1, 1, 1,
-1.825238, -0.04835351, -3.139798, 1, 1, 1, 1, 1,
-1.818752, 1.013992, -1.228044, 0, 0, 1, 1, 1,
-1.815508, -0.5425153, -2.877903, 1, 0, 0, 1, 1,
-1.763472, -0.02175977, -1.717695, 1, 0, 0, 1, 1,
-1.755217, -1.808644, -2.294003, 1, 0, 0, 1, 1,
-1.742261, 3.12255, -0.5438486, 1, 0, 0, 1, 1,
-1.731828, -0.3625921, -3.271424, 1, 0, 0, 1, 1,
-1.720029, -0.840024, -1.097974, 0, 0, 0, 1, 1,
-1.717301, 1.388793, 0.73875, 0, 0, 0, 1, 1,
-1.659307, 1.359223, 0.439546, 0, 0, 0, 1, 1,
-1.658177, 0.6275143, -0.1002009, 0, 0, 0, 1, 1,
-1.650231, 1.231707, -2.074563, 0, 0, 0, 1, 1,
-1.647547, 1.753859, -1.538874, 0, 0, 0, 1, 1,
-1.641683, -0.5780582, -2.27834, 0, 0, 0, 1, 1,
-1.640978, 0.8526065, -0.9228231, 1, 1, 1, 1, 1,
-1.637876, -0.987815, -3.049416, 1, 1, 1, 1, 1,
-1.63232, 1.765105, -1.288818, 1, 1, 1, 1, 1,
-1.623227, -0.7444512, -2.606239, 1, 1, 1, 1, 1,
-1.615705, -0.4644964, -0.8945892, 1, 1, 1, 1, 1,
-1.615365, -0.5159566, -2.066537, 1, 1, 1, 1, 1,
-1.611126, -0.492102, -2.356065, 1, 1, 1, 1, 1,
-1.61112, 0.8838218, -2.528135, 1, 1, 1, 1, 1,
-1.580529, -0.2644169, -2.593732, 1, 1, 1, 1, 1,
-1.569899, 1.430147, -1.508364, 1, 1, 1, 1, 1,
-1.551363, 0.2673227, -0.4353465, 1, 1, 1, 1, 1,
-1.527195, -1.067185, -3.366222, 1, 1, 1, 1, 1,
-1.515481, -1.160642, -4.312056, 1, 1, 1, 1, 1,
-1.503988, -0.7505602, -1.741871, 1, 1, 1, 1, 1,
-1.500342, -0.7002295, -1.207152, 1, 1, 1, 1, 1,
-1.490821, -1.000998, -1.345776, 0, 0, 1, 1, 1,
-1.468945, 1.755704, -1.128601, 1, 0, 0, 1, 1,
-1.457492, -1.175788, -0.8041953, 1, 0, 0, 1, 1,
-1.438419, -1.064573, -0.804897, 1, 0, 0, 1, 1,
-1.435938, -0.1355717, 0.4332996, 1, 0, 0, 1, 1,
-1.425452, -0.2464736, -0.8404292, 1, 0, 0, 1, 1,
-1.421607, 0.2642512, -0.4866942, 0, 0, 0, 1, 1,
-1.412467, 0.9945242, -0.2619971, 0, 0, 0, 1, 1,
-1.411685, 0.01264494, -1.67664, 0, 0, 0, 1, 1,
-1.407707, 0.507717, -2.577214, 0, 0, 0, 1, 1,
-1.405105, -2.309191, -3.314316, 0, 0, 0, 1, 1,
-1.399454, 0.4383617, -2.418512, 0, 0, 0, 1, 1,
-1.398743, 0.4542671, -0.7140993, 0, 0, 0, 1, 1,
-1.398347, 1.986399, 1.259169, 1, 1, 1, 1, 1,
-1.381568, 0.4134067, 1.043036, 1, 1, 1, 1, 1,
-1.348647, -0.6381469, -2.123245, 1, 1, 1, 1, 1,
-1.341247, -0.4218622, 0.2642705, 1, 1, 1, 1, 1,
-1.330311, 0.3777479, -1.568326, 1, 1, 1, 1, 1,
-1.329875, -0.7677948, -4.090229, 1, 1, 1, 1, 1,
-1.328499, -2.13209, -1.702071, 1, 1, 1, 1, 1,
-1.324749, 0.4901348, 0.1611719, 1, 1, 1, 1, 1,
-1.316384, 0.2011965, -0.9349889, 1, 1, 1, 1, 1,
-1.312067, 0.2487513, -2.083375, 1, 1, 1, 1, 1,
-1.307209, 0.5157689, 0.1099046, 1, 1, 1, 1, 1,
-1.295881, -0.7032142, -2.164838, 1, 1, 1, 1, 1,
-1.294511, -0.3113528, -0.789669, 1, 1, 1, 1, 1,
-1.278639, -0.1586763, -1.775244, 1, 1, 1, 1, 1,
-1.274409, 0.4604641, -0.902707, 1, 1, 1, 1, 1,
-1.273307, 2.089977, 1.857957, 0, 0, 1, 1, 1,
-1.260789, 0.6411319, -0.9343649, 1, 0, 0, 1, 1,
-1.252149, -1.935967, -1.235994, 1, 0, 0, 1, 1,
-1.247963, -0.1858229, -2.513399, 1, 0, 0, 1, 1,
-1.235837, 0.6209272, -0.4951934, 1, 0, 0, 1, 1,
-1.224902, 0.628222, -0.2579314, 1, 0, 0, 1, 1,
-1.218548, 1.799197, -0.7662504, 0, 0, 0, 1, 1,
-1.209849, -0.6722759, -2.580443, 0, 0, 0, 1, 1,
-1.207693, -0.6226096, -2.744389, 0, 0, 0, 1, 1,
-1.203579, -2.896694, -3.162206, 0, 0, 0, 1, 1,
-1.195914, 0.2416657, -2.017575, 0, 0, 0, 1, 1,
-1.193789, 1.526897, -0.6627638, 0, 0, 0, 1, 1,
-1.190942, 1.801009, -0.39637, 0, 0, 0, 1, 1,
-1.183924, 0.3269775, -0.04143865, 1, 1, 1, 1, 1,
-1.181565, -0.17958, -2.809487, 1, 1, 1, 1, 1,
-1.171116, 1.092698, -1.140228, 1, 1, 1, 1, 1,
-1.168675, -0.6054332, -0.6512199, 1, 1, 1, 1, 1,
-1.168368, 0.5381403, -1.762906, 1, 1, 1, 1, 1,
-1.164786, -0.7045097, -1.18555, 1, 1, 1, 1, 1,
-1.159457, 1.131854, -2.345237, 1, 1, 1, 1, 1,
-1.156426, -1.262154, -1.463905, 1, 1, 1, 1, 1,
-1.15559, 1.198389, -1.122851, 1, 1, 1, 1, 1,
-1.154311, -0.6541041, -1.46204, 1, 1, 1, 1, 1,
-1.153772, -0.4252283, -0.8725102, 1, 1, 1, 1, 1,
-1.149552, -0.1643527, -1.692418, 1, 1, 1, 1, 1,
-1.144034, 0.4304632, -0.5721584, 1, 1, 1, 1, 1,
-1.14121, 2.237173, 0.04947482, 1, 1, 1, 1, 1,
-1.131013, -0.07440202, -1.993149, 1, 1, 1, 1, 1,
-1.123483, -0.2330988, -1.326636, 0, 0, 1, 1, 1,
-1.111959, -1.373221, -2.281493, 1, 0, 0, 1, 1,
-1.111938, 0.7443311, -1.475449, 1, 0, 0, 1, 1,
-1.108639, 0.09571312, -1.736574, 1, 0, 0, 1, 1,
-1.095818, 2.014785, 0.5212686, 1, 0, 0, 1, 1,
-1.095654, -0.3147179, 0.2402917, 1, 0, 0, 1, 1,
-1.08579, -0.2797339, -1.495197, 0, 0, 0, 1, 1,
-1.084816, -0.5107219, -1.679876, 0, 0, 0, 1, 1,
-1.083466, -0.294981, -0.8431855, 0, 0, 0, 1, 1,
-1.08248, -2.253726, -2.608515, 0, 0, 0, 1, 1,
-1.080704, 1.520346, 0.5664034, 0, 0, 0, 1, 1,
-1.07627, 0.4906286, -2.934506, 0, 0, 0, 1, 1,
-1.06101, 0.005044159, -1.370934, 0, 0, 0, 1, 1,
-1.053287, 0.5825248, -1.794925, 1, 1, 1, 1, 1,
-1.049194, -0.2846326, -2.294814, 1, 1, 1, 1, 1,
-1.045676, -0.05747068, -1.676442, 1, 1, 1, 1, 1,
-1.044739, 1.211904, -0.5028133, 1, 1, 1, 1, 1,
-1.042265, 0.2233791, -0.6187896, 1, 1, 1, 1, 1,
-1.041927, 1.530249, -1.414643, 1, 1, 1, 1, 1,
-1.037127, -1.226449, -2.023057, 1, 1, 1, 1, 1,
-1.029417, 0.02364554, -0.9658147, 1, 1, 1, 1, 1,
-1.020408, 0.235071, -1.978176, 1, 1, 1, 1, 1,
-1.019371, 1.073089, -0.7850586, 1, 1, 1, 1, 1,
-1.017627, 1.942096, 0.1178673, 1, 1, 1, 1, 1,
-1.016642, -1.487764, -3.646837, 1, 1, 1, 1, 1,
-1.016523, -0.8461317, -2.797623, 1, 1, 1, 1, 1,
-1.004481, -1.575723, -1.481527, 1, 1, 1, 1, 1,
-1.000006, -0.8164353, -1.566855, 1, 1, 1, 1, 1,
-0.995998, -0.3010794, -2.374219, 0, 0, 1, 1, 1,
-0.99533, -0.4012675, -1.053071, 1, 0, 0, 1, 1,
-0.9837925, 0.3712029, -0.4910973, 1, 0, 0, 1, 1,
-0.9835105, -1.71928, -2.798246, 1, 0, 0, 1, 1,
-0.9832115, -0.2277366, -2.312191, 1, 0, 0, 1, 1,
-0.978304, 0.2470986, -1.242149, 1, 0, 0, 1, 1,
-0.9747635, -0.01965486, -1.417568, 0, 0, 0, 1, 1,
-0.966111, 1.051089, -1.175711, 0, 0, 0, 1, 1,
-0.9628816, 0.6037755, -1.117989, 0, 0, 0, 1, 1,
-0.9559915, 0.1935692, -2.040502, 0, 0, 0, 1, 1,
-0.9553952, 1.031385, -1.232544, 0, 0, 0, 1, 1,
-0.9553048, 2.588995, 0.5858752, 0, 0, 0, 1, 1,
-0.9465476, -2.561793, -4.314682, 0, 0, 0, 1, 1,
-0.946086, -1.208544, -4.06929, 1, 1, 1, 1, 1,
-0.9367713, -0.458477, -2.510285, 1, 1, 1, 1, 1,
-0.9300026, 2.257292, -0.605292, 1, 1, 1, 1, 1,
-0.9186034, -0.01259966, -2.204078, 1, 1, 1, 1, 1,
-0.9135798, 0.3749188, -2.125552, 1, 1, 1, 1, 1,
-0.9084559, -0.5603491, -2.08615, 1, 1, 1, 1, 1,
-0.9077306, -1.55119, -4.267954, 1, 1, 1, 1, 1,
-0.9048796, -1.044969, -3.595229, 1, 1, 1, 1, 1,
-0.9024143, 0.6807763, -1.022729, 1, 1, 1, 1, 1,
-0.8982956, -0.702723, -3.076304, 1, 1, 1, 1, 1,
-0.8956704, 0.3981749, -0.3760405, 1, 1, 1, 1, 1,
-0.8942637, -0.7633714, -4.184978, 1, 1, 1, 1, 1,
-0.8925087, 1.05427, 0.7851369, 1, 1, 1, 1, 1,
-0.8901014, -0.6202751, -1.292994, 1, 1, 1, 1, 1,
-0.8896086, -0.6728187, -1.770902, 1, 1, 1, 1, 1,
-0.881371, -0.3011161, -1.01851, 0, 0, 1, 1, 1,
-0.8744504, -1.232361, -3.216168, 1, 0, 0, 1, 1,
-0.8697636, -1.878878, -1.690271, 1, 0, 0, 1, 1,
-0.8665341, -0.02241089, -0.9133424, 1, 0, 0, 1, 1,
-0.8665016, 0.6031713, -0.9624927, 1, 0, 0, 1, 1,
-0.866093, -0.2594221, -2.26195, 1, 0, 0, 1, 1,
-0.8659876, 2.242617, -0.9884517, 0, 0, 0, 1, 1,
-0.8637106, 1.067902, -1.365226, 0, 0, 0, 1, 1,
-0.8604001, -0.5499241, -0.9811229, 0, 0, 0, 1, 1,
-0.859281, 1.111282, 0.295286, 0, 0, 0, 1, 1,
-0.8584644, 0.377883, -1.744602, 0, 0, 0, 1, 1,
-0.853352, 0.3533115, 1.437449, 0, 0, 0, 1, 1,
-0.8429189, -1.776523, -2.099164, 0, 0, 0, 1, 1,
-0.8411454, 0.7994286, -0.3605111, 1, 1, 1, 1, 1,
-0.8400328, 0.4078066, -1.855737, 1, 1, 1, 1, 1,
-0.830487, -1.569142, -1.357673, 1, 1, 1, 1, 1,
-0.8256929, -0.2393412, -1.643429, 1, 1, 1, 1, 1,
-0.8153477, 0.03524003, -0.4621964, 1, 1, 1, 1, 1,
-0.8138106, 0.6454052, -0.7469798, 1, 1, 1, 1, 1,
-0.8119327, 1.448351, -1.817128, 1, 1, 1, 1, 1,
-0.8060941, -0.5613438, -2.224166, 1, 1, 1, 1, 1,
-0.8037544, 0.7544079, -0.8657826, 1, 1, 1, 1, 1,
-0.7974331, -1.223172, -2.414087, 1, 1, 1, 1, 1,
-0.7961873, 2.013503, -0.08697277, 1, 1, 1, 1, 1,
-0.795989, 0.1674965, -1.505578, 1, 1, 1, 1, 1,
-0.7906476, 1.970701, -1.548225, 1, 1, 1, 1, 1,
-0.7898105, -0.4082654, -0.9175383, 1, 1, 1, 1, 1,
-0.7868967, -0.9507813, -2.111695, 1, 1, 1, 1, 1,
-0.7851896, 0.219119, -2.141494, 0, 0, 1, 1, 1,
-0.7833609, -0.2254061, -2.506213, 1, 0, 0, 1, 1,
-0.7831227, 0.05218906, -2.546214, 1, 0, 0, 1, 1,
-0.7830774, 0.730593, -0.3694987, 1, 0, 0, 1, 1,
-0.7830311, -1.011704, -2.666029, 1, 0, 0, 1, 1,
-0.7804581, 1.128927, -1.170298, 1, 0, 0, 1, 1,
-0.77824, -0.5544877, -4.373011, 0, 0, 0, 1, 1,
-0.7770967, 1.775548, 0.07165335, 0, 0, 0, 1, 1,
-0.776197, 2.051902, -0.3242327, 0, 0, 0, 1, 1,
-0.7735401, 0.08685043, -1.771222, 0, 0, 0, 1, 1,
-0.7730981, 1.477123, -1.504863, 0, 0, 0, 1, 1,
-0.7706491, -0.2351708, -2.319684, 0, 0, 0, 1, 1,
-0.7569346, -0.6643444, -2.917309, 0, 0, 0, 1, 1,
-0.7516248, 0.7169968, -1.137799, 1, 1, 1, 1, 1,
-0.7499769, -1.304407, -2.775594, 1, 1, 1, 1, 1,
-0.7468084, 0.08053988, -1.592843, 1, 1, 1, 1, 1,
-0.7455435, -2.895595, -3.589987, 1, 1, 1, 1, 1,
-0.7448711, 0.7508962, -1.131159, 1, 1, 1, 1, 1,
-0.7433287, 0.3055809, -2.813302, 1, 1, 1, 1, 1,
-0.7420139, -0.5859543, -0.1817622, 1, 1, 1, 1, 1,
-0.7410395, 0.7066169, -2.276819, 1, 1, 1, 1, 1,
-0.738892, -0.5878507, -1.923222, 1, 1, 1, 1, 1,
-0.7364221, -0.1953104, -0.8725774, 1, 1, 1, 1, 1,
-0.729932, 0.284776, 0.03520522, 1, 1, 1, 1, 1,
-0.7278125, -1.16209, -2.010056, 1, 1, 1, 1, 1,
-0.7223581, -0.1859946, -2.774204, 1, 1, 1, 1, 1,
-0.7208207, 0.5106063, 0.09800309, 1, 1, 1, 1, 1,
-0.7163272, -1.120492, -3.176629, 1, 1, 1, 1, 1,
-0.7115729, 1.193104, 0.1081006, 0, 0, 1, 1, 1,
-0.7070091, 0.05413111, -1.430174, 1, 0, 0, 1, 1,
-0.7064706, -0.8894576, -1.189127, 1, 0, 0, 1, 1,
-0.7012228, -1.343832, -2.460978, 1, 0, 0, 1, 1,
-0.6984457, 0.9290988, -0.1710764, 1, 0, 0, 1, 1,
-0.6975716, 0.05858516, -1.768795, 1, 0, 0, 1, 1,
-0.6950799, -1.126122, -2.469481, 0, 0, 0, 1, 1,
-0.6914777, 0.71743, 0.01507586, 0, 0, 0, 1, 1,
-0.6864731, 0.0327705, -1.537305, 0, 0, 0, 1, 1,
-0.6809269, -0.3259014, -0.3385934, 0, 0, 0, 1, 1,
-0.6797274, 0.9194839, 0.1385143, 0, 0, 0, 1, 1,
-0.6769067, 0.4675632, 0.07009052, 0, 0, 0, 1, 1,
-0.6754285, 1.762374, -1.679319, 0, 0, 0, 1, 1,
-0.6751035, 2.002191, -0.3600334, 1, 1, 1, 1, 1,
-0.6746683, -0.2458132, -2.289416, 1, 1, 1, 1, 1,
-0.6728771, -1.670879, -2.759644, 1, 1, 1, 1, 1,
-0.6710246, -0.1978866, -0.6935855, 1, 1, 1, 1, 1,
-0.6595283, -0.2028704, -2.948389, 1, 1, 1, 1, 1,
-0.6535406, 0.8766548, -0.06064926, 1, 1, 1, 1, 1,
-0.6499392, -1.010761, -1.936646, 1, 1, 1, 1, 1,
-0.6434318, 0.3197998, -0.7298954, 1, 1, 1, 1, 1,
-0.6429407, 0.9995888, -1.425339, 1, 1, 1, 1, 1,
-0.637234, -0.2576928, -3.429957, 1, 1, 1, 1, 1,
-0.635493, -0.8365207, -0.8669045, 1, 1, 1, 1, 1,
-0.6273844, 1.167731, -1.513984, 1, 1, 1, 1, 1,
-0.6267775, -0.7691602, -3.005734, 1, 1, 1, 1, 1,
-0.6252124, -0.1862294, -2.236787, 1, 1, 1, 1, 1,
-0.620373, 0.04209271, -0.9811076, 1, 1, 1, 1, 1,
-0.6174365, 1.066481, -1.077086, 0, 0, 1, 1, 1,
-0.6143291, 0.9997222, 1.065096, 1, 0, 0, 1, 1,
-0.613483, 0.4222795, -1.853601, 1, 0, 0, 1, 1,
-0.6100792, 1.595263, -0.3955754, 1, 0, 0, 1, 1,
-0.6049885, 1.124627, -0.1958991, 1, 0, 0, 1, 1,
-0.6015933, -0.2854014, -0.5914297, 1, 0, 0, 1, 1,
-0.6007671, 0.05353491, -2.555911, 0, 0, 0, 1, 1,
-0.5898562, -1.143493, -2.019838, 0, 0, 0, 1, 1,
-0.5832358, 0.998215, -2.156822, 0, 0, 0, 1, 1,
-0.5819604, 1.007772, -0.2839053, 0, 0, 0, 1, 1,
-0.5814627, -0.04579195, -3.079658, 0, 0, 0, 1, 1,
-0.5813277, 0.4794386, -0.3621482, 0, 0, 0, 1, 1,
-0.5779639, -0.2116836, -2.497347, 0, 0, 0, 1, 1,
-0.5766336, -0.4358786, -2.390162, 1, 1, 1, 1, 1,
-0.5764181, 0.08771317, 0.3430746, 1, 1, 1, 1, 1,
-0.5762784, -0.5054841, -1.248675, 1, 1, 1, 1, 1,
-0.5759856, -0.3278677, -2.094915, 1, 1, 1, 1, 1,
-0.5739615, -0.8772017, -3.336774, 1, 1, 1, 1, 1,
-0.5729549, 1.457836, -0.9491657, 1, 1, 1, 1, 1,
-0.5724517, 0.06978327, -0.3173557, 1, 1, 1, 1, 1,
-0.5672903, -1.886584, -1.735536, 1, 1, 1, 1, 1,
-0.5664098, 0.8872415, -0.8789944, 1, 1, 1, 1, 1,
-0.5602375, 0.2521547, -1.218924, 1, 1, 1, 1, 1,
-0.5580997, 0.6183268, 0.5242001, 1, 1, 1, 1, 1,
-0.5568348, 0.2576757, -1.61668, 1, 1, 1, 1, 1,
-0.5554988, 0.8201951, -1.074758, 1, 1, 1, 1, 1,
-0.5524574, -1.167437, -1.831455, 1, 1, 1, 1, 1,
-0.5481349, 0.7768424, -0.8063866, 1, 1, 1, 1, 1,
-0.5465162, -0.1826045, -1.315912, 0, 0, 1, 1, 1,
-0.543581, 0.6435779, -0.9613026, 1, 0, 0, 1, 1,
-0.5417401, 0.7243263, -1.329533, 1, 0, 0, 1, 1,
-0.5393231, -0.2782882, -1.132561, 1, 0, 0, 1, 1,
-0.5355497, 0.7027194, -0.3862242, 1, 0, 0, 1, 1,
-0.5353767, 0.2357152, -1.918746, 1, 0, 0, 1, 1,
-0.5311159, -0.6338716, -3.600835, 0, 0, 0, 1, 1,
-0.5199103, -0.2360146, -1.868394, 0, 0, 0, 1, 1,
-0.515741, -0.6484133, -3.399626, 0, 0, 0, 1, 1,
-0.5143006, 0.2479334, -1.568848, 0, 0, 0, 1, 1,
-0.5120384, -1.252595, -3.480052, 0, 0, 0, 1, 1,
-0.5109937, 0.2367647, -0.2560088, 0, 0, 0, 1, 1,
-0.5081568, -0.6579342, -4.311703, 0, 0, 0, 1, 1,
-0.5049307, -0.7792932, -3.214807, 1, 1, 1, 1, 1,
-0.4975134, -0.03466513, -3.612093, 1, 1, 1, 1, 1,
-0.4954217, 1.360489, -2.324435, 1, 1, 1, 1, 1,
-0.4945627, -0.7642374, -4.491578, 1, 1, 1, 1, 1,
-0.4939625, -1.983051, -1.346933, 1, 1, 1, 1, 1,
-0.493222, 0.8087888, -3.947544, 1, 1, 1, 1, 1,
-0.493055, 1.000859, 1.306748, 1, 1, 1, 1, 1,
-0.491751, 1.435247, 0.6628197, 1, 1, 1, 1, 1,
-0.4830674, 0.8470574, -0.09981147, 1, 1, 1, 1, 1,
-0.4813825, -0.2267452, -0.8480355, 1, 1, 1, 1, 1,
-0.4812008, -0.2295358, -1.400129, 1, 1, 1, 1, 1,
-0.4806677, 0.1773306, -1.40567, 1, 1, 1, 1, 1,
-0.4746894, -0.6219109, -1.11962, 1, 1, 1, 1, 1,
-0.4746429, -0.9572863, -3.647844, 1, 1, 1, 1, 1,
-0.4737104, 0.8425138, -0.633746, 1, 1, 1, 1, 1,
-0.4730172, -0.7348318, -2.836204, 0, 0, 1, 1, 1,
-0.470668, 2.653792, 0.640744, 1, 0, 0, 1, 1,
-0.4639333, -1.020824, -2.074586, 1, 0, 0, 1, 1,
-0.4606108, -0.2284314, -2.164566, 1, 0, 0, 1, 1,
-0.4565089, 0.04814586, -0.6450738, 1, 0, 0, 1, 1,
-0.4549262, 0.4376959, -0.1238773, 1, 0, 0, 1, 1,
-0.454872, 1.235886, 1.029089, 0, 0, 0, 1, 1,
-0.4521233, 0.2591068, 0.639435, 0, 0, 0, 1, 1,
-0.4518597, -2.654118, -4.047531, 0, 0, 0, 1, 1,
-0.4417657, 1.116646, -1.25367, 0, 0, 0, 1, 1,
-0.4399857, -1.161158, -2.979642, 0, 0, 0, 1, 1,
-0.4396305, -0.8469937, -2.411435, 0, 0, 0, 1, 1,
-0.4375021, 0.4488367, -0.7846465, 0, 0, 0, 1, 1,
-0.4357501, -0.7448027, -2.678413, 1, 1, 1, 1, 1,
-0.4313262, 1.312594, 1.233894, 1, 1, 1, 1, 1,
-0.4304938, -0.6587397, -0.6987004, 1, 1, 1, 1, 1,
-0.425342, 0.2684116, 1.260108, 1, 1, 1, 1, 1,
-0.4186704, -0.181891, -2.441817, 1, 1, 1, 1, 1,
-0.4153864, 0.7322482, -0.7165985, 1, 1, 1, 1, 1,
-0.413571, -2.080431, -3.112132, 1, 1, 1, 1, 1,
-0.4121742, 1.862208, -1.05619, 1, 1, 1, 1, 1,
-0.4108943, -0.03773327, -2.871506, 1, 1, 1, 1, 1,
-0.4102036, 0.494841, -0.1593992, 1, 1, 1, 1, 1,
-0.4101418, 0.1766659, -1.417289, 1, 1, 1, 1, 1,
-0.4035129, -1.49936, -1.771244, 1, 1, 1, 1, 1,
-0.4031026, -1.104719, -1.244229, 1, 1, 1, 1, 1,
-0.3997799, 0.7149726, -1.132409, 1, 1, 1, 1, 1,
-0.3980299, 3.022029, -0.6974432, 1, 1, 1, 1, 1,
-0.3923243, -1.303352, -1.910082, 0, 0, 1, 1, 1,
-0.3894361, -1.571731, -3.504356, 1, 0, 0, 1, 1,
-0.3873252, -0.4449264, -2.779459, 1, 0, 0, 1, 1,
-0.3853866, 0.07385285, -2.438921, 1, 0, 0, 1, 1,
-0.3841561, -0.9839567, -4.785156, 1, 0, 0, 1, 1,
-0.3785903, 3.328417, -1.046891, 1, 0, 0, 1, 1,
-0.3770968, -0.7255297, -2.274882, 0, 0, 0, 1, 1,
-0.3758463, 0.7898314, -1.082483, 0, 0, 0, 1, 1,
-0.3711408, 0.5373113, -0.7130042, 0, 0, 0, 1, 1,
-0.367708, -0.3419775, -0.6079076, 0, 0, 0, 1, 1,
-0.3662388, -0.3433882, -2.818364, 0, 0, 0, 1, 1,
-0.362311, -0.3708509, -1.400752, 0, 0, 0, 1, 1,
-0.3607796, 1.754472, -1.3731, 0, 0, 0, 1, 1,
-0.3596967, 0.4557675, -1.328393, 1, 1, 1, 1, 1,
-0.3552417, -2.822984, -2.956904, 1, 1, 1, 1, 1,
-0.3549781, -1.275403, -3.055845, 1, 1, 1, 1, 1,
-0.350116, 0.1968661, -1.0902, 1, 1, 1, 1, 1,
-0.3482213, -0.4598081, -1.508178, 1, 1, 1, 1, 1,
-0.3481659, 0.916234, -1.352237, 1, 1, 1, 1, 1,
-0.3430944, 0.698533, -1.720601, 1, 1, 1, 1, 1,
-0.3402581, 0.4959343, -1.220519, 1, 1, 1, 1, 1,
-0.3348803, 0.9645708, 0.3944893, 1, 1, 1, 1, 1,
-0.3330035, -3.033787, -3.113556, 1, 1, 1, 1, 1,
-0.3301622, 1.904857, 0.7864561, 1, 1, 1, 1, 1,
-0.328207, 0.2117818, -2.72886, 1, 1, 1, 1, 1,
-0.3267691, -0.9069152, -3.468842, 1, 1, 1, 1, 1,
-0.3255683, 1.770939, -0.9376689, 1, 1, 1, 1, 1,
-0.3251787, 0.2811041, -1.931401, 1, 1, 1, 1, 1,
-0.3204002, -0.5203847, -1.888299, 0, 0, 1, 1, 1,
-0.319611, -1.699768, -4.531058, 1, 0, 0, 1, 1,
-0.3166161, -2.705032, -1.854552, 1, 0, 0, 1, 1,
-0.3162178, -0.5084862, -2.778912, 1, 0, 0, 1, 1,
-0.3155755, -2.871945, -3.984064, 1, 0, 0, 1, 1,
-0.310703, -0.9685715, -3.908356, 1, 0, 0, 1, 1,
-0.3094909, 0.4143232, -1.005742, 0, 0, 0, 1, 1,
-0.3002575, -2.148674, -2.858569, 0, 0, 0, 1, 1,
-0.2980659, -0.5576247, -2.938019, 0, 0, 0, 1, 1,
-0.2951645, -0.7255374, -2.86732, 0, 0, 0, 1, 1,
-0.2908568, 0.9820018, 0.244811, 0, 0, 0, 1, 1,
-0.2873497, 0.7002451, -0.9406201, 0, 0, 0, 1, 1,
-0.2834544, -0.772998, -3.232561, 0, 0, 0, 1, 1,
-0.2818027, 0.7974486, 0.7401327, 1, 1, 1, 1, 1,
-0.2816639, 0.2726368, -0.2631877, 1, 1, 1, 1, 1,
-0.2744192, 0.7348737, -0.6709341, 1, 1, 1, 1, 1,
-0.2709748, -1.040869, -3.529756, 1, 1, 1, 1, 1,
-0.270542, -1.098887, -3.838832, 1, 1, 1, 1, 1,
-0.2651411, 0.7198612, -0.04899539, 1, 1, 1, 1, 1,
-0.2643286, -0.7893575, -2.573079, 1, 1, 1, 1, 1,
-0.2625024, -0.1807984, -2.288947, 1, 1, 1, 1, 1,
-0.2615426, 1.368748, -0.8029093, 1, 1, 1, 1, 1,
-0.260933, 1.890925, 0.7699516, 1, 1, 1, 1, 1,
-0.2604598, -0.09701837, -1.630634, 1, 1, 1, 1, 1,
-0.2579104, 0.9760716, -0.195272, 1, 1, 1, 1, 1,
-0.2556767, -1.842921, -3.260279, 1, 1, 1, 1, 1,
-0.2537356, -0.566668, -1.751528, 1, 1, 1, 1, 1,
-0.2514636, -1.628851, -3.890604, 1, 1, 1, 1, 1,
-0.2486442, -0.4676028, -1.27467, 0, 0, 1, 1, 1,
-0.248176, -0.6799266, -2.691893, 1, 0, 0, 1, 1,
-0.248062, 0.1597689, -0.7274449, 1, 0, 0, 1, 1,
-0.2477893, 0.2441024, -0.1201416, 1, 0, 0, 1, 1,
-0.2463032, -0.4948194, -1.171401, 1, 0, 0, 1, 1,
-0.2454328, -0.4080617, -1.717805, 1, 0, 0, 1, 1,
-0.245285, 1.218734, -1.960233, 0, 0, 0, 1, 1,
-0.2452525, 1.177217, -2.340607, 0, 0, 0, 1, 1,
-0.2448783, 0.6153864, 0.6857392, 0, 0, 0, 1, 1,
-0.2439291, 0.3109621, -0.8062134, 0, 0, 0, 1, 1,
-0.2392001, -0.04673437, -0.2902385, 0, 0, 0, 1, 1,
-0.2382459, -1.529175, -3.876097, 0, 0, 0, 1, 1,
-0.2381179, 0.6067517, 0.412559, 0, 0, 0, 1, 1,
-0.2373173, 0.2672329, -0.3723884, 1, 1, 1, 1, 1,
-0.2323939, 1.36004, -1.072884, 1, 1, 1, 1, 1,
-0.2314754, 0.5862373, -0.2988946, 1, 1, 1, 1, 1,
-0.2313124, -0.05634114, -2.009201, 1, 1, 1, 1, 1,
-0.2308476, -1.745481, -1.790922, 1, 1, 1, 1, 1,
-0.2302613, 0.2522071, -0.6430328, 1, 1, 1, 1, 1,
-0.2247844, -0.7790838, -2.593142, 1, 1, 1, 1, 1,
-0.2236919, -0.7425131, -4.131441, 1, 1, 1, 1, 1,
-0.2172493, -1.201947, -3.320899, 1, 1, 1, 1, 1,
-0.213841, -0.5097972, -3.898706, 1, 1, 1, 1, 1,
-0.2075093, -0.9942088, -2.02433, 1, 1, 1, 1, 1,
-0.2074375, -0.1738168, -3.319812, 1, 1, 1, 1, 1,
-0.2056892, -0.7758815, -2.9534, 1, 1, 1, 1, 1,
-0.202143, 1.6176, -0.2475449, 1, 1, 1, 1, 1,
-0.2019197, 1.411753, 2.183902, 1, 1, 1, 1, 1,
-0.2018762, -0.5310484, -1.478661, 0, 0, 1, 1, 1,
-0.2018173, 1.75953, 2.609773, 1, 0, 0, 1, 1,
-0.1999086, -1.840638, -2.07277, 1, 0, 0, 1, 1,
-0.1997914, -0.6081529, -1.571046, 1, 0, 0, 1, 1,
-0.1988356, 0.2627191, 0.9417315, 1, 0, 0, 1, 1,
-0.1986846, -1.110171, -3.443101, 1, 0, 0, 1, 1,
-0.1972148, -0.8697143, -2.668128, 0, 0, 0, 1, 1,
-0.1969414, -0.9650608, -5.232909, 0, 0, 0, 1, 1,
-0.1957598, 0.6919429, 0.1184191, 0, 0, 0, 1, 1,
-0.1941606, 0.5850282, -0.5292037, 0, 0, 0, 1, 1,
-0.1933899, 0.09042337, -1.185047, 0, 0, 0, 1, 1,
-0.1932929, -0.847028, -2.296522, 0, 0, 0, 1, 1,
-0.19024, -1.203532, -1.489272, 0, 0, 0, 1, 1,
-0.1842976, 0.1417991, -0.4542954, 1, 1, 1, 1, 1,
-0.1832099, -1.525957, -1.858482, 1, 1, 1, 1, 1,
-0.1821604, 0.3062601, -1.491335, 1, 1, 1, 1, 1,
-0.1820362, 0.4590738, 0.9648914, 1, 1, 1, 1, 1,
-0.1792512, -0.6597646, -2.125813, 1, 1, 1, 1, 1,
-0.1760807, -1.739432, -1.576173, 1, 1, 1, 1, 1,
-0.1753541, -0.1025605, -3.024619, 1, 1, 1, 1, 1,
-0.1722278, 1.539628, 0.1943843, 1, 1, 1, 1, 1,
-0.1699772, 1.019039, -2.280197, 1, 1, 1, 1, 1,
-0.1685985, -1.104468, -2.78639, 1, 1, 1, 1, 1,
-0.1673802, -1.64421, -3.815093, 1, 1, 1, 1, 1,
-0.1669652, 0.03066609, -3.346178, 1, 1, 1, 1, 1,
-0.1658296, 0.904815, 1.199632, 1, 1, 1, 1, 1,
-0.1629243, -1.916694, -3.255681, 1, 1, 1, 1, 1,
-0.1604338, 1.680015, 0.07574184, 1, 1, 1, 1, 1,
-0.1554001, 0.9691047, 0.5109996, 0, 0, 1, 1, 1,
-0.1506152, -0.2357368, -5.78819, 1, 0, 0, 1, 1,
-0.1497642, 0.54017, 0.3963241, 1, 0, 0, 1, 1,
-0.1475625, -0.2302138, -3.60317, 1, 0, 0, 1, 1,
-0.1448371, -1.624834, -2.260023, 1, 0, 0, 1, 1,
-0.1399331, -0.08466337, -2.611952, 1, 0, 0, 1, 1,
-0.1395515, -0.3750934, -2.539064, 0, 0, 0, 1, 1,
-0.1370808, 0.3753483, -1.765187, 0, 0, 0, 1, 1,
-0.1201572, 0.2322706, -3.104435, 0, 0, 0, 1, 1,
-0.1200638, 0.8451709, 0.4571773, 0, 0, 0, 1, 1,
-0.1155474, 2.054233, 0.2530081, 0, 0, 0, 1, 1,
-0.1123804, -0.4938709, -3.256902, 0, 0, 0, 1, 1,
-0.1110486, 0.3784758, -1.238875, 0, 0, 0, 1, 1,
-0.1035841, -0.7293956, -1.63858, 1, 1, 1, 1, 1,
-0.1035523, -1.394224, -2.504505, 1, 1, 1, 1, 1,
-0.09823988, -0.2005088, -1.920349, 1, 1, 1, 1, 1,
-0.09792706, 0.1458578, -0.8206816, 1, 1, 1, 1, 1,
-0.09605366, 0.8646016, 0.340285, 1, 1, 1, 1, 1,
-0.09555306, 0.2171889, 0.5705706, 1, 1, 1, 1, 1,
-0.09535642, 1.184206, -0.3019203, 1, 1, 1, 1, 1,
-0.08796523, -1.330056, -4.176562, 1, 1, 1, 1, 1,
-0.08743895, 0.1351896, -0.6850867, 1, 1, 1, 1, 1,
-0.08422461, -0.2539941, -2.800256, 1, 1, 1, 1, 1,
-0.08283412, 0.6800438, -0.5274258, 1, 1, 1, 1, 1,
-0.07515526, 0.1571988, 0.52423, 1, 1, 1, 1, 1,
-0.07483601, -0.3535973, -3.920486, 1, 1, 1, 1, 1,
-0.07140966, -0.3368381, -2.898582, 1, 1, 1, 1, 1,
-0.05745343, -1.192045, -3.529277, 1, 1, 1, 1, 1,
-0.05363694, -0.2814007, -2.324476, 0, 0, 1, 1, 1,
-0.05098741, 0.9863718, -2.246566, 1, 0, 0, 1, 1,
-0.04178903, 1.411882, 0.9897113, 1, 0, 0, 1, 1,
-0.03758296, -2.529589, -3.848137, 1, 0, 0, 1, 1,
-0.03750892, -0.5750453, -2.422879, 1, 0, 0, 1, 1,
-0.03736386, -1.408536, -2.652993, 1, 0, 0, 1, 1,
-0.03652101, -0.18649, -1.728713, 0, 0, 0, 1, 1,
-0.03505829, 0.6849705, -0.7068645, 0, 0, 0, 1, 1,
-0.03436309, -0.02373672, -3.137933, 0, 0, 0, 1, 1,
-0.03347192, 1.586738, -1.571109, 0, 0, 0, 1, 1,
-0.03100693, -0.2294438, -2.994646, 0, 0, 0, 1, 1,
-0.02870982, -1.042177, -1.879047, 0, 0, 0, 1, 1,
-0.0286123, 1.257392, 1.327198, 0, 0, 0, 1, 1,
-0.02650537, -0.6972377, -3.522069, 1, 1, 1, 1, 1,
-0.02474114, -1.85181, -2.274198, 1, 1, 1, 1, 1,
-0.02056409, 0.335133, -0.8626931, 1, 1, 1, 1, 1,
-0.02042541, 0.6603863, -0.1970488, 1, 1, 1, 1, 1,
-0.01986971, -2.122732, -2.186308, 1, 1, 1, 1, 1,
-0.01857161, -1.029858, -3.228467, 1, 1, 1, 1, 1,
-0.01803347, 0.3723252, -1.289959, 1, 1, 1, 1, 1,
-0.004868668, 0.4712405, 0.7724453, 1, 1, 1, 1, 1,
-0.002952219, -0.8058877, -1.762285, 1, 1, 1, 1, 1,
0.0007675589, 0.5400786, -1.232613, 1, 1, 1, 1, 1,
0.0009602901, 1.366199, -0.6594617, 1, 1, 1, 1, 1,
0.003098016, -0.8223842, 3.825538, 1, 1, 1, 1, 1,
0.003905569, 1.044574, 0.9865482, 1, 1, 1, 1, 1,
0.006534256, 1.410561, -0.7662893, 1, 1, 1, 1, 1,
0.009492786, 2.349876, -0.08623809, 1, 1, 1, 1, 1,
0.01463559, -1.480806, 4.525703, 0, 0, 1, 1, 1,
0.01632869, -0.7489644, 2.617935, 1, 0, 0, 1, 1,
0.01744576, -2.110382, 2.643869, 1, 0, 0, 1, 1,
0.01849552, 1.622029, -0.9654546, 1, 0, 0, 1, 1,
0.01906194, -0.9258735, 3.88562, 1, 0, 0, 1, 1,
0.02115333, -0.02387975, 3.507366, 1, 0, 0, 1, 1,
0.03199429, -0.1471044, 4.328366, 0, 0, 0, 1, 1,
0.033788, 0.5956042, -0.7986695, 0, 0, 0, 1, 1,
0.03513395, 1.08111, -0.2995524, 0, 0, 0, 1, 1,
0.03855625, -0.6913875, 2.549983, 0, 0, 0, 1, 1,
0.04285666, -2.187197, 2.162239, 0, 0, 0, 1, 1,
0.04293964, 0.7129203, 1.070071, 0, 0, 0, 1, 1,
0.0530898, 0.495943, 0.513146, 0, 0, 0, 1, 1,
0.05322528, -0.8649965, 2.633824, 1, 1, 1, 1, 1,
0.05632245, 0.3314936, 1.976843, 1, 1, 1, 1, 1,
0.06617309, 1.858853, 2.1508, 1, 1, 1, 1, 1,
0.06777759, -0.2764806, 2.257302, 1, 1, 1, 1, 1,
0.06818969, -0.1833435, 1.159741, 1, 1, 1, 1, 1,
0.07107157, -0.2221604, 2.473861, 1, 1, 1, 1, 1,
0.0723916, -1.286972, 5.801673, 1, 1, 1, 1, 1,
0.07418634, 1.179984, -0.8345501, 1, 1, 1, 1, 1,
0.07745422, -1.879719, 2.578144, 1, 1, 1, 1, 1,
0.08295033, 0.6325837, -1.766544, 1, 1, 1, 1, 1,
0.0847116, 2.18979, -0.1729231, 1, 1, 1, 1, 1,
0.09318735, 0.1563144, 3.312109, 1, 1, 1, 1, 1,
0.09381391, 1.545673, 0.9569058, 1, 1, 1, 1, 1,
0.1010786, 0.5222371, 0.44283, 1, 1, 1, 1, 1,
0.1013037, -0.7058719, 2.802408, 1, 1, 1, 1, 1,
0.1016578, 1.276996, -0.5190141, 0, 0, 1, 1, 1,
0.1027577, -1.525565, 1.741801, 1, 0, 0, 1, 1,
0.105043, 0.9364615, -0.344552, 1, 0, 0, 1, 1,
0.1073756, -2.111887, 4.256986, 1, 0, 0, 1, 1,
0.110004, 0.1058281, 2.518532, 1, 0, 0, 1, 1,
0.1123303, 0.464751, -0.9793802, 1, 0, 0, 1, 1,
0.1139286, 1.357594, 0.04785053, 0, 0, 0, 1, 1,
0.1175177, 1.912655, -0.9713823, 0, 0, 0, 1, 1,
0.1184344, -0.4876915, 3.124967, 0, 0, 0, 1, 1,
0.1224995, -2.375843, 2.595085, 0, 0, 0, 1, 1,
0.1255293, 0.6550115, 0.3566577, 0, 0, 0, 1, 1,
0.1308057, -0.3945053, 0.6935404, 0, 0, 0, 1, 1,
0.130895, 0.9354883, -0.04313928, 0, 0, 0, 1, 1,
0.136024, -0.5129303, 2.658947, 1, 1, 1, 1, 1,
0.1420299, 1.381173, -0.6998149, 1, 1, 1, 1, 1,
0.1434378, -1.238241, 4.830593, 1, 1, 1, 1, 1,
0.151879, -1.315688, 1.73224, 1, 1, 1, 1, 1,
0.1521303, 1.445276, -0.08958061, 1, 1, 1, 1, 1,
0.1531857, -0.2132314, 1.989239, 1, 1, 1, 1, 1,
0.1551044, -1.366917, 4.488231, 1, 1, 1, 1, 1,
0.1578462, -0.9502066, 3.575168, 1, 1, 1, 1, 1,
0.1578875, -0.5156159, 2.818887, 1, 1, 1, 1, 1,
0.160355, -0.1646104, 2.329421, 1, 1, 1, 1, 1,
0.1683439, 0.3962777, 0.9924536, 1, 1, 1, 1, 1,
0.1692942, 0.6598049, 0.891564, 1, 1, 1, 1, 1,
0.1770358, 0.4117397, -0.3492315, 1, 1, 1, 1, 1,
0.1782112, -0.2429608, 0.9965149, 1, 1, 1, 1, 1,
0.1793226, -1.453149, 3.487498, 1, 1, 1, 1, 1,
0.1837739, -3.398971, 4.485785, 0, 0, 1, 1, 1,
0.1844929, 2.068596, 1.256359, 1, 0, 0, 1, 1,
0.1849511, 0.9143959, -0.8888916, 1, 0, 0, 1, 1,
0.1862779, -0.04869262, 1.28559, 1, 0, 0, 1, 1,
0.1881269, -0.1016725, 0.2586948, 1, 0, 0, 1, 1,
0.1957719, -0.2894601, 1.867787, 1, 0, 0, 1, 1,
0.1982245, -0.08748566, 0.1464398, 0, 0, 0, 1, 1,
0.2029946, 0.1572716, 0.5747466, 0, 0, 0, 1, 1,
0.2043462, -2.086924, 3.573323, 0, 0, 0, 1, 1,
0.2056255, 0.04877333, 2.545493, 0, 0, 0, 1, 1,
0.2059986, -0.6602333, 3.486629, 0, 0, 0, 1, 1,
0.2087358, -1.977557, 3.013929, 0, 0, 0, 1, 1,
0.209215, -0.3099107, 3.105189, 0, 0, 0, 1, 1,
0.2139624, -0.4915183, 0.3848737, 1, 1, 1, 1, 1,
0.2173721, -0.6123211, 3.662805, 1, 1, 1, 1, 1,
0.2243162, 0.8514984, -0.3360166, 1, 1, 1, 1, 1,
0.2293143, 1.012176, 1.131638, 1, 1, 1, 1, 1,
0.2318828, -1.817715, 3.529312, 1, 1, 1, 1, 1,
0.2357745, 1.775095, 0.5064833, 1, 1, 1, 1, 1,
0.2359725, 1.521031, -2.144142, 1, 1, 1, 1, 1,
0.2361336, -0.6987547, 2.906513, 1, 1, 1, 1, 1,
0.2364535, 0.2986986, 1.355968, 1, 1, 1, 1, 1,
0.2424707, -1.174728, 4.625869, 1, 1, 1, 1, 1,
0.2425681, -0.7705542, 2.939644, 1, 1, 1, 1, 1,
0.2448976, -1.841015, 2.554984, 1, 1, 1, 1, 1,
0.2450404, 0.4848284, -1.047897, 1, 1, 1, 1, 1,
0.2459371, 0.6707491, -1.059964, 1, 1, 1, 1, 1,
0.2473133, -1.024137, 2.242645, 1, 1, 1, 1, 1,
0.2536718, 0.7899873, -0.559497, 0, 0, 1, 1, 1,
0.2547112, 1.229075, -0.9049947, 1, 0, 0, 1, 1,
0.2563264, 0.4887436, 0.2339326, 1, 0, 0, 1, 1,
0.2583258, 0.1664648, -0.1884494, 1, 0, 0, 1, 1,
0.2585731, 1.07156, 2.495184, 1, 0, 0, 1, 1,
0.2595247, 2.135326, -0.3346071, 1, 0, 0, 1, 1,
0.2605203, 2.058091, -0.1234776, 0, 0, 0, 1, 1,
0.2648799, -2.114206, 2.774382, 0, 0, 0, 1, 1,
0.270342, -0.3904406, 2.590585, 0, 0, 0, 1, 1,
0.273822, -0.7699775, 1.607458, 0, 0, 0, 1, 1,
0.2753287, 0.01363375, 0.5738611, 0, 0, 0, 1, 1,
0.2780945, 0.3093422, 0.505201, 0, 0, 0, 1, 1,
0.278268, -0.6987675, 1.192747, 0, 0, 0, 1, 1,
0.2783304, -0.703518, 3.894771, 1, 1, 1, 1, 1,
0.2818157, 1.704588, 0.5983088, 1, 1, 1, 1, 1,
0.2844801, 1.45901, 1.348859, 1, 1, 1, 1, 1,
0.285693, -1.379765, 2.042481, 1, 1, 1, 1, 1,
0.2876133, 0.4824768, 0.3280706, 1, 1, 1, 1, 1,
0.2883624, -0.179164, 2.270787, 1, 1, 1, 1, 1,
0.2934156, 0.4566022, 0.03902087, 1, 1, 1, 1, 1,
0.2934934, 0.5939869, 0.04996777, 1, 1, 1, 1, 1,
0.2939935, -1.037068, 2.286664, 1, 1, 1, 1, 1,
0.2946627, 0.2644289, -0.4153605, 1, 1, 1, 1, 1,
0.2979467, -0.5529112, 2.450696, 1, 1, 1, 1, 1,
0.3010378, 0.7339318, -1.652366, 1, 1, 1, 1, 1,
0.3030272, 1.994352, 0.2672468, 1, 1, 1, 1, 1,
0.3041099, 1.949276, -1.34571, 1, 1, 1, 1, 1,
0.3041921, 0.8289757, 0.6809675, 1, 1, 1, 1, 1,
0.30451, 0.3185132, 1.198801, 0, 0, 1, 1, 1,
0.3073691, 0.5765904, -0.5696949, 1, 0, 0, 1, 1,
0.3095406, 0.9921862, -0.001445086, 1, 0, 0, 1, 1,
0.315279, -1.078014, 1.66233, 1, 0, 0, 1, 1,
0.3214654, 0.1408173, 1.194515, 1, 0, 0, 1, 1,
0.3225933, -0.4147243, 3.574999, 1, 0, 0, 1, 1,
0.3256609, -2.741931, 2.586751, 0, 0, 0, 1, 1,
0.3263641, -0.389033, -1.633859, 0, 0, 0, 1, 1,
0.3290241, -0.8374603, 3.756296, 0, 0, 0, 1, 1,
0.3291546, -0.1433922, 1.867726, 0, 0, 0, 1, 1,
0.3319461, -0.992404, 1.457753, 0, 0, 0, 1, 1,
0.3330526, -0.3062535, 3.411467, 0, 0, 0, 1, 1,
0.3341531, 0.7560374, 2.507313, 0, 0, 0, 1, 1,
0.3371291, 1.422272, 1.230291, 1, 1, 1, 1, 1,
0.3451258, -0.8492088, 1.820965, 1, 1, 1, 1, 1,
0.3469822, 1.644719, 1.786952, 1, 1, 1, 1, 1,
0.3513771, -1.725016, 2.656109, 1, 1, 1, 1, 1,
0.3579394, 0.5397246, -0.1646478, 1, 1, 1, 1, 1,
0.3580062, -0.9340268, 3.83331, 1, 1, 1, 1, 1,
0.3596093, -0.3944839, 4.022287, 1, 1, 1, 1, 1,
0.3621942, 0.3296261, 0.1963999, 1, 1, 1, 1, 1,
0.3665889, -1.074242, 2.923004, 1, 1, 1, 1, 1,
0.3672555, -1.630468, 5.226852, 1, 1, 1, 1, 1,
0.3676813, -1.435947, 3.318758, 1, 1, 1, 1, 1,
0.3709511, -0.3683216, 0.5922012, 1, 1, 1, 1, 1,
0.3732173, -0.9581704, 2.41116, 1, 1, 1, 1, 1,
0.3799832, 0.4444399, 2.194598, 1, 1, 1, 1, 1,
0.3907045, 0.2553334, 0.7910066, 1, 1, 1, 1, 1,
0.3945912, 0.54422, 0.2047437, 0, 0, 1, 1, 1,
0.3955746, 0.01152003, 3.060528, 1, 0, 0, 1, 1,
0.3970688, 0.6610566, 0.07259934, 1, 0, 0, 1, 1,
0.3984256, 1.358552, -0.04396493, 1, 0, 0, 1, 1,
0.4050767, -1.360379, 2.59833, 1, 0, 0, 1, 1,
0.4060889, 0.2146269, 0.8382934, 1, 0, 0, 1, 1,
0.4073251, -0.6836839, 4.012602, 0, 0, 0, 1, 1,
0.409548, 0.1709068, 1.738054, 0, 0, 0, 1, 1,
0.4126138, 0.3988574, -0.2125842, 0, 0, 0, 1, 1,
0.4127288, -2.373195, 2.534915, 0, 0, 0, 1, 1,
0.417615, -0.04059096, 1.789944, 0, 0, 0, 1, 1,
0.4264446, -0.03888181, 0.5418029, 0, 0, 0, 1, 1,
0.4279316, -0.4076288, 1.579929, 0, 0, 0, 1, 1,
0.4304069, -1.248283, 3.67842, 1, 1, 1, 1, 1,
0.4325872, 0.7793669, 0.1709987, 1, 1, 1, 1, 1,
0.4365393, 0.6345444, 1.075293, 1, 1, 1, 1, 1,
0.4369513, 1.290075, 1.622398, 1, 1, 1, 1, 1,
0.437305, -0.8089907, 1.371983, 1, 1, 1, 1, 1,
0.439777, -2.249998, 1.873086, 1, 1, 1, 1, 1,
0.4429615, -0.1917516, 2.327373, 1, 1, 1, 1, 1,
0.4443052, 0.5288751, 0.8999754, 1, 1, 1, 1, 1,
0.4511865, 0.370435, 0.01369495, 1, 1, 1, 1, 1,
0.4528765, -0.5285522, 0.8080996, 1, 1, 1, 1, 1,
0.4534325, 0.8557658, 0.3427292, 1, 1, 1, 1, 1,
0.4539329, -1.285514, 3.223785, 1, 1, 1, 1, 1,
0.4571574, -0.07199324, 1.064511, 1, 1, 1, 1, 1,
0.4581449, 2.16142, 1.148507, 1, 1, 1, 1, 1,
0.459167, -0.8874803, 2.499886, 1, 1, 1, 1, 1,
0.4593615, 0.4098442, -0.6172798, 0, 0, 1, 1, 1,
0.4659741, 0.3044347, 0.3699396, 1, 0, 0, 1, 1,
0.4691046, 1.20801, -1.554212, 1, 0, 0, 1, 1,
0.4701976, -2.412549, 2.457723, 1, 0, 0, 1, 1,
0.4759115, 0.136559, 1.531935, 1, 0, 0, 1, 1,
0.4810431, -2.645026, 5.257842, 1, 0, 0, 1, 1,
0.4867148, 0.5599942, -0.1419951, 0, 0, 0, 1, 1,
0.4873377, -0.1007917, 1.617489, 0, 0, 0, 1, 1,
0.4908103, 1.543086, 0.8202491, 0, 0, 0, 1, 1,
0.494069, 0.3501709, 1.60707, 0, 0, 0, 1, 1,
0.4993406, -0.9887452, 2.977057, 0, 0, 0, 1, 1,
0.5102897, -0.551816, 2.395361, 0, 0, 0, 1, 1,
0.5165733, -0.5115321, 1.205066, 0, 0, 0, 1, 1,
0.5166398, 0.3793592, 2.11225, 1, 1, 1, 1, 1,
0.5215662, 0.3532346, 0.9106433, 1, 1, 1, 1, 1,
0.5253388, 0.2531813, 0.3685184, 1, 1, 1, 1, 1,
0.5259956, 2.044211, 1.371798, 1, 1, 1, 1, 1,
0.5264181, -0.2101248, 2.835837, 1, 1, 1, 1, 1,
0.5283908, 0.863707, 0.9438764, 1, 1, 1, 1, 1,
0.5293988, 1.522837, 1.172992, 1, 1, 1, 1, 1,
0.529987, -1.642722, 0.6929672, 1, 1, 1, 1, 1,
0.5319704, -0.3270452, 1.41903, 1, 1, 1, 1, 1,
0.5358622, 0.1904402, 3.528547, 1, 1, 1, 1, 1,
0.537659, -0.3440322, 2.768257, 1, 1, 1, 1, 1,
0.5400235, -0.3383215, 3.18831, 1, 1, 1, 1, 1,
0.540239, -0.5921814, 2.638166, 1, 1, 1, 1, 1,
0.5422629, 0.3573115, 3.019682, 1, 1, 1, 1, 1,
0.5459043, 0.4645829, 1.649224, 1, 1, 1, 1, 1,
0.5466914, -0.3979585, 3.805806, 0, 0, 1, 1, 1,
0.5521991, -0.6890258, 2.529957, 1, 0, 0, 1, 1,
0.5565856, -0.6326975, 2.13484, 1, 0, 0, 1, 1,
0.5615694, -0.1243453, 2.667641, 1, 0, 0, 1, 1,
0.5628172, -0.1193885, 1.093234, 1, 0, 0, 1, 1,
0.5637272, -0.8349763, 2.207291, 1, 0, 0, 1, 1,
0.5642623, -0.5625064, 3.550335, 0, 0, 0, 1, 1,
0.5647941, -0.9485684, 1.110367, 0, 0, 0, 1, 1,
0.565581, 0.1973214, 1.88205, 0, 0, 0, 1, 1,
0.5669041, -0.6455652, 3.831018, 0, 0, 0, 1, 1,
0.5670506, 0.8908497, 0.6761978, 0, 0, 0, 1, 1,
0.5691367, -1.470377, 3.046279, 0, 0, 0, 1, 1,
0.5701967, 0.5677265, -0.2035633, 0, 0, 0, 1, 1,
0.5703784, -1.751094, 3.498215, 1, 1, 1, 1, 1,
0.5708957, 1.739077, -0.2664708, 1, 1, 1, 1, 1,
0.5726452, 0.2850787, -0.3987474, 1, 1, 1, 1, 1,
0.5727527, -1.618828, 3.465408, 1, 1, 1, 1, 1,
0.5764534, 0.2273107, 0.6819773, 1, 1, 1, 1, 1,
0.5781245, -0.5783779, 2.730285, 1, 1, 1, 1, 1,
0.5798866, -0.2254128, 2.700405, 1, 1, 1, 1, 1,
0.5813269, -0.9981999, 3.345328, 1, 1, 1, 1, 1,
0.5813337, 1.766922, -1.350793, 1, 1, 1, 1, 1,
0.5821496, -0.325675, 1.767551, 1, 1, 1, 1, 1,
0.5825368, 2.131852, -0.1050589, 1, 1, 1, 1, 1,
0.5850258, 1.690892, -0.05553102, 1, 1, 1, 1, 1,
0.5850284, -0.4328381, 2.500105, 1, 1, 1, 1, 1,
0.5861267, -0.3446781, 2.401237, 1, 1, 1, 1, 1,
0.5872946, -1.033219, 2.796663, 1, 1, 1, 1, 1,
0.5897693, -0.152878, 0.6250473, 0, 0, 1, 1, 1,
0.5908567, 0.3331447, 1.453512, 1, 0, 0, 1, 1,
0.5960006, 0.2014413, 3.987159, 1, 0, 0, 1, 1,
0.5996976, -0.2213548, 4.16774, 1, 0, 0, 1, 1,
0.6024374, 0.6338344, 2.155877, 1, 0, 0, 1, 1,
0.6064463, -0.8559656, 4.195122, 1, 0, 0, 1, 1,
0.6091975, 0.2199057, 1.515485, 0, 0, 0, 1, 1,
0.6130303, -0.2335775, 3.038947, 0, 0, 0, 1, 1,
0.6143091, -1.014627, 2.244595, 0, 0, 0, 1, 1,
0.6193722, -1.89827, 3.465259, 0, 0, 0, 1, 1,
0.6227958, -2.423191, 2.178128, 0, 0, 0, 1, 1,
0.6236809, -0.5277413, 2.285706, 0, 0, 0, 1, 1,
0.6237337, -1.762485, 1.899197, 0, 0, 0, 1, 1,
0.6257078, -1.208589, 1.099473, 1, 1, 1, 1, 1,
0.6271921, -0.4027556, -0.1364486, 1, 1, 1, 1, 1,
0.6320298, 0.7100545, 1.502922, 1, 1, 1, 1, 1,
0.6417048, 0.7945102, 0.3255959, 1, 1, 1, 1, 1,
0.6431594, -0.4328495, 4.455877, 1, 1, 1, 1, 1,
0.6464789, 0.1405344, 0.1987142, 1, 1, 1, 1, 1,
0.6489166, -0.4852095, 1.899586, 1, 1, 1, 1, 1,
0.652001, 1.54358, -0.3106651, 1, 1, 1, 1, 1,
0.6548359, -0.7400836, 2.712513, 1, 1, 1, 1, 1,
0.6610919, -1.527561, 4.133717, 1, 1, 1, 1, 1,
0.6657485, -0.9613872, 4.757849, 1, 1, 1, 1, 1,
0.6683741, 0.1607875, 0.6148533, 1, 1, 1, 1, 1,
0.6686583, 1.390846, -0.8439833, 1, 1, 1, 1, 1,
0.6697956, -0.0416997, 1.201673, 1, 1, 1, 1, 1,
0.6721056, -0.2094225, 0.04329913, 1, 1, 1, 1, 1,
0.674865, 0.08735136, 1.426876, 0, 0, 1, 1, 1,
0.6757469, -0.5182462, 1.096624, 1, 0, 0, 1, 1,
0.6846462, -1.018542, 1.335046, 1, 0, 0, 1, 1,
0.6985409, 1.595836, 0.9860018, 1, 0, 0, 1, 1,
0.7084083, 2.552196, 2.129619, 1, 0, 0, 1, 1,
0.7097875, -0.265075, 0.3793667, 1, 0, 0, 1, 1,
0.712356, 0.842139, 0.5986146, 0, 0, 0, 1, 1,
0.7191067, 0.2738493, 0.650648, 0, 0, 0, 1, 1,
0.7333714, 0.2217951, 1.175204, 0, 0, 0, 1, 1,
0.7429811, -0.677665, 1.366944, 0, 0, 0, 1, 1,
0.744141, -0.3463378, 1.746776, 0, 0, 0, 1, 1,
0.748524, 0.9354798, 0.2309634, 0, 0, 0, 1, 1,
0.7508317, -0.1968081, 0.8997408, 0, 0, 0, 1, 1,
0.7553031, -0.5116393, 3.263104, 1, 1, 1, 1, 1,
0.7567405, -1.074757, 2.308146, 1, 1, 1, 1, 1,
0.7588173, 0.2653922, 1.047224, 1, 1, 1, 1, 1,
0.7603891, -0.4827239, 0.4878053, 1, 1, 1, 1, 1,
0.7656464, 2.699301, -0.7994605, 1, 1, 1, 1, 1,
0.7667291, -0.9030897, 2.332408, 1, 1, 1, 1, 1,
0.7718835, 0.7721055, 1.05536, 1, 1, 1, 1, 1,
0.7777521, -0.03781483, 1.019562, 1, 1, 1, 1, 1,
0.782638, 1.007268, 0.4890293, 1, 1, 1, 1, 1,
0.784045, 1.05284, 1.660293, 1, 1, 1, 1, 1,
0.784179, 0.721422, 0.536082, 1, 1, 1, 1, 1,
0.7855867, -0.4969967, 2.186891, 1, 1, 1, 1, 1,
0.7877135, 2.71573, -0.1271235, 1, 1, 1, 1, 1,
0.7898426, -0.6998731, 2.369541, 1, 1, 1, 1, 1,
0.7917214, 0.761977, 0.3935454, 1, 1, 1, 1, 1,
0.7940667, 0.5219284, 0.9384221, 0, 0, 1, 1, 1,
0.8007635, 1.845845, -1.510851, 1, 0, 0, 1, 1,
0.8015471, -0.5364446, 3.32986, 1, 0, 0, 1, 1,
0.8036219, -0.3579541, 0.975328, 1, 0, 0, 1, 1,
0.8201688, -1.660684, 3.366086, 1, 0, 0, 1, 1,
0.8276638, 0.3033583, 0.6555656, 1, 0, 0, 1, 1,
0.8302165, 0.01913189, 4.051113, 0, 0, 0, 1, 1,
0.83176, 0.8994461, 1.936857, 0, 0, 0, 1, 1,
0.8319593, -0.675283, 1.850284, 0, 0, 0, 1, 1,
0.8359544, -0.1109002, 1.80867, 0, 0, 0, 1, 1,
0.8426517, 2.167466, -1.359957, 0, 0, 0, 1, 1,
0.8460407, -0.6515808, 2.242183, 0, 0, 0, 1, 1,
0.8480267, -0.6885343, 2.053897, 0, 0, 0, 1, 1,
0.8491048, -0.3313592, 1.92337, 1, 1, 1, 1, 1,
0.8506771, -1.455406, 1.412027, 1, 1, 1, 1, 1,
0.8513609, -2.444794, 3.41898, 1, 1, 1, 1, 1,
0.8709536, -1.391744, 2.543077, 1, 1, 1, 1, 1,
0.8773249, -0.7291576, 2.596978, 1, 1, 1, 1, 1,
0.8793412, 1.303689, 0.3975736, 1, 1, 1, 1, 1,
0.8819194, 0.5784743, 1.128588, 1, 1, 1, 1, 1,
0.8835574, -0.7738016, 1.139434, 1, 1, 1, 1, 1,
0.8876582, 0.3752446, -0.4825996, 1, 1, 1, 1, 1,
0.8907769, -0.1408209, 3.793579, 1, 1, 1, 1, 1,
0.8931398, 0.112554, 0.920517, 1, 1, 1, 1, 1,
0.8949521, -2.19547, 4.435307, 1, 1, 1, 1, 1,
0.9008231, 0.547419, 1.9488, 1, 1, 1, 1, 1,
0.9052731, -0.1894134, -0.2582978, 1, 1, 1, 1, 1,
0.9058835, 0.390121, 1.596183, 1, 1, 1, 1, 1,
0.9085325, -0.8788936, 1.787547, 0, 0, 1, 1, 1,
0.9128792, 0.1285666, 1.121009, 1, 0, 0, 1, 1,
0.921432, 1.097678, 1.720185, 1, 0, 0, 1, 1,
0.9218814, 2.057252, 0.1726091, 1, 0, 0, 1, 1,
0.9263937, 1.486869, -1.075327, 1, 0, 0, 1, 1,
0.9316833, -1.978656, 4.097328, 1, 0, 0, 1, 1,
0.9347571, -1.054121, 1.452115, 0, 0, 0, 1, 1,
0.9362425, 1.646616, 0.1821286, 0, 0, 0, 1, 1,
0.9378223, -0.7656156, 1.600899, 0, 0, 0, 1, 1,
0.9385554, -1.408028, 1.441635, 0, 0, 0, 1, 1,
0.9537045, 1.215194, -0.2838183, 0, 0, 0, 1, 1,
0.9566998, 2.01806, 0.7250727, 0, 0, 0, 1, 1,
0.9656068, -0.9118989, 2.458322, 0, 0, 0, 1, 1,
0.9690161, -0.9768704, 2.821137, 1, 1, 1, 1, 1,
0.9710867, -0.07454345, 0.6052639, 1, 1, 1, 1, 1,
0.9766715, -0.5154136, 3.951278, 1, 1, 1, 1, 1,
0.9799442, 0.9654588, 1.953268, 1, 1, 1, 1, 1,
0.9828534, 0.9864358, 1.048527, 1, 1, 1, 1, 1,
0.9893821, 0.6046317, -0.2511455, 1, 1, 1, 1, 1,
0.9959909, -0.03391201, 2.715654, 1, 1, 1, 1, 1,
0.9989614, 1.305264, 1.206182, 1, 1, 1, 1, 1,
0.9994653, 0.1842314, 1.090812, 1, 1, 1, 1, 1,
1.002551, -0.3743176, 1.386282, 1, 1, 1, 1, 1,
1.002745, 0.5418473, 0.8519374, 1, 1, 1, 1, 1,
1.003168, 0.1141536, 2.489059, 1, 1, 1, 1, 1,
1.003824, -0.2289145, 1.582544, 1, 1, 1, 1, 1,
1.007749, -1.317597, 4.239389, 1, 1, 1, 1, 1,
1.009038, 1.40563, 0.02482249, 1, 1, 1, 1, 1,
1.012502, -0.5873283, 2.307084, 0, 0, 1, 1, 1,
1.013337, 0.365351, -0.1836449, 1, 0, 0, 1, 1,
1.013703, 0.2628269, 2.627921, 1, 0, 0, 1, 1,
1.01791, 0.1750805, 1.244561, 1, 0, 0, 1, 1,
1.017931, 0.3033367, 1.824126, 1, 0, 0, 1, 1,
1.018517, -1.570369, 3.849058, 1, 0, 0, 1, 1,
1.020915, -0.06289067, 2.443655, 0, 0, 0, 1, 1,
1.021608, -0.3778877, 1.883242, 0, 0, 0, 1, 1,
1.030742, -0.7114933, 0.3934495, 0, 0, 0, 1, 1,
1.035991, -0.729001, 2.507563, 0, 0, 0, 1, 1,
1.062866, -1.472996, 3.764996, 0, 0, 0, 1, 1,
1.065512, 1.253442, -1.2003, 0, 0, 0, 1, 1,
1.066193, 0.253295, 2.556938, 0, 0, 0, 1, 1,
1.073147, 0.1880084, 0.9162477, 1, 1, 1, 1, 1,
1.080266, 0.4951268, 0.6950737, 1, 1, 1, 1, 1,
1.0827, 1.504201, 0.6344366, 1, 1, 1, 1, 1,
1.08861, 0.0240419, 1.509274, 1, 1, 1, 1, 1,
1.09144, -0.76346, 3.99035, 1, 1, 1, 1, 1,
1.091709, 0.5707172, 0.3887016, 1, 1, 1, 1, 1,
1.092324, 0.8937643, 1.526809, 1, 1, 1, 1, 1,
1.099311, 0.1768629, 1.943246, 1, 1, 1, 1, 1,
1.100993, 0.4441323, 2.863757, 1, 1, 1, 1, 1,
1.107532, 1.060004, 1.2042, 1, 1, 1, 1, 1,
1.114977, -1.436694, 4.330344, 1, 1, 1, 1, 1,
1.11603, 0.05856376, 1.842898, 1, 1, 1, 1, 1,
1.11661, 1.439723, -2.313435, 1, 1, 1, 1, 1,
1.119797, 1.320187, 0.06723708, 1, 1, 1, 1, 1,
1.125118, -0.4618099, 1.886496, 1, 1, 1, 1, 1,
1.132946, 0.1945673, 1.392481, 0, 0, 1, 1, 1,
1.137978, 1.191626, 2.189613, 1, 0, 0, 1, 1,
1.141739, 1.520431, 0.4400321, 1, 0, 0, 1, 1,
1.145481, 0.05692032, 3.056953, 1, 0, 0, 1, 1,
1.154184, 0.1978221, 0.4907001, 1, 0, 0, 1, 1,
1.163282, -0.8160693, 1.41001, 1, 0, 0, 1, 1,
1.164262, 1.070532, 0.567143, 0, 0, 0, 1, 1,
1.170313, 0.8996861, -0.1653681, 0, 0, 0, 1, 1,
1.172668, 0.54782, 0.8003367, 0, 0, 0, 1, 1,
1.182874, -0.7908059, 1.273623, 0, 0, 0, 1, 1,
1.183186, 0.2114694, 1.197572, 0, 0, 0, 1, 1,
1.187045, -0.3501833, 2.187695, 0, 0, 0, 1, 1,
1.19769, -0.01700091, 1.91948, 0, 0, 0, 1, 1,
1.202204, 0.3962494, 1.902549, 1, 1, 1, 1, 1,
1.206371, -0.1545784, 2.348528, 1, 1, 1, 1, 1,
1.208622, -0.9758558, 1.283883, 1, 1, 1, 1, 1,
1.209374, 1.549191, 0.8955542, 1, 1, 1, 1, 1,
1.215233, 0.7254818, 1.555086, 1, 1, 1, 1, 1,
1.216574, 0.139008, 1.739571, 1, 1, 1, 1, 1,
1.217517, -0.280566, 3.724438, 1, 1, 1, 1, 1,
1.219831, -1.125616, 3.519572, 1, 1, 1, 1, 1,
1.221668, 1.454381, 0.02419898, 1, 1, 1, 1, 1,
1.222851, 0.03900382, 1.982695, 1, 1, 1, 1, 1,
1.227467, 0.5912521, 1.763124, 1, 1, 1, 1, 1,
1.235989, 1.252185, 0.5319135, 1, 1, 1, 1, 1,
1.236614, -0.6933351, 2.803425, 1, 1, 1, 1, 1,
1.238266, -1.821692, 1.758738, 1, 1, 1, 1, 1,
1.24443, -0.9065067, 2.72681, 1, 1, 1, 1, 1,
1.246819, 0.5025002, 1.842213, 0, 0, 1, 1, 1,
1.275391, -0.5255509, 1.086706, 1, 0, 0, 1, 1,
1.279332, 0.2702449, 1.610648, 1, 0, 0, 1, 1,
1.279723, 0.1949259, 2.615973, 1, 0, 0, 1, 1,
1.282782, -1.498553, 3.684599, 1, 0, 0, 1, 1,
1.299582, -1.141395, 2.722254, 1, 0, 0, 1, 1,
1.301385, 0.441001, 2.209025, 0, 0, 0, 1, 1,
1.309056, 1.050989, 0.7555215, 0, 0, 0, 1, 1,
1.310128, -1.339502, 3.022467, 0, 0, 0, 1, 1,
1.312986, -1.244581, 2.250162, 0, 0, 0, 1, 1,
1.315578, 0.02099535, 2.221619, 0, 0, 0, 1, 1,
1.319391, 0.194772, 1.549541, 0, 0, 0, 1, 1,
1.320285, -1.235097, 0.4216553, 0, 0, 0, 1, 1,
1.332229, 0.2300473, 2.314657, 1, 1, 1, 1, 1,
1.332803, -0.374812, 0.7639892, 1, 1, 1, 1, 1,
1.337199, -0.3640749, 1.836979, 1, 1, 1, 1, 1,
1.34284, -1.220826, 1.198204, 1, 1, 1, 1, 1,
1.34865, -1.557475, 2.553997, 1, 1, 1, 1, 1,
1.349928, -0.6885222, 1.644478, 1, 1, 1, 1, 1,
1.352296, -0.593748, 2.003402, 1, 1, 1, 1, 1,
1.355947, 0.2241197, 2.329258, 1, 1, 1, 1, 1,
1.3631, 0.6428228, 3.347088, 1, 1, 1, 1, 1,
1.36551, -0.1110348, 1.391349, 1, 1, 1, 1, 1,
1.372346, 0.4386081, 1.168811, 1, 1, 1, 1, 1,
1.378709, 0.06940581, 2.706548, 1, 1, 1, 1, 1,
1.393966, 0.6355479, 0.8767755, 1, 1, 1, 1, 1,
1.399168, 0.3705472, 1.755421, 1, 1, 1, 1, 1,
1.401776, -0.3442475, 3.076859, 1, 1, 1, 1, 1,
1.411018, 0.6648561, 1.434247, 0, 0, 1, 1, 1,
1.430128, -0.1799285, 4.174437, 1, 0, 0, 1, 1,
1.439567, -1.06411, 2.463076, 1, 0, 0, 1, 1,
1.450417, -0.3112332, 0.9511892, 1, 0, 0, 1, 1,
1.457546, -1.491427, 1.386307, 1, 0, 0, 1, 1,
1.461716, 1.672957, -0.5088547, 1, 0, 0, 1, 1,
1.462648, 0.3164736, 0.101206, 0, 0, 0, 1, 1,
1.487039, -0.5634775, 1.041377, 0, 0, 0, 1, 1,
1.490153, -2.155579, 1.70221, 0, 0, 0, 1, 1,
1.517574, -0.201804, 1.143407, 0, 0, 0, 1, 1,
1.518371, 1.810006, 2.161173, 0, 0, 0, 1, 1,
1.526439, -0.1649787, 2.112629, 0, 0, 0, 1, 1,
1.534255, -0.5543681, 1.495553, 0, 0, 0, 1, 1,
1.539951, 1.636971, -1.362213, 1, 1, 1, 1, 1,
1.54724, 0.9791709, -0.5735734, 1, 1, 1, 1, 1,
1.565581, -1.757077, 1.469909, 1, 1, 1, 1, 1,
1.566033, 2.003688, -0.2701145, 1, 1, 1, 1, 1,
1.590932, 0.07596809, 2.173081, 1, 1, 1, 1, 1,
1.59626, 0.140024, 0.7369393, 1, 1, 1, 1, 1,
1.601777, 1.153595, 0.3946803, 1, 1, 1, 1, 1,
1.617867, 0.4547279, 0.6111141, 1, 1, 1, 1, 1,
1.620491, 0.05097912, 1.915177, 1, 1, 1, 1, 1,
1.62176, 2.379583, 0.6148376, 1, 1, 1, 1, 1,
1.628204, 0.6888114, 0.3203976, 1, 1, 1, 1, 1,
1.637303, -0.2683622, 1.967609, 1, 1, 1, 1, 1,
1.677733, -0.2290164, 1.799727, 1, 1, 1, 1, 1,
1.688768, -2.242617, 2.189277, 1, 1, 1, 1, 1,
1.703893, 1.204854, -0.2170232, 1, 1, 1, 1, 1,
1.706233, -1.329986, 0.6117074, 0, 0, 1, 1, 1,
1.727961, 0.5986485, 0.7265713, 1, 0, 0, 1, 1,
1.747926, -1.247588, 3.755231, 1, 0, 0, 1, 1,
1.768908, -0.5792915, 1.758671, 1, 0, 0, 1, 1,
1.769086, -0.01576903, 0.09400265, 1, 0, 0, 1, 1,
1.789685, 0.7204468, 0.6371233, 1, 0, 0, 1, 1,
1.790613, 0.6834398, 2.731952, 0, 0, 0, 1, 1,
1.795607, 1.2297, 1.062849, 0, 0, 0, 1, 1,
1.79667, 0.05800752, 0.758051, 0, 0, 0, 1, 1,
1.798349, 0.381639, 0.961474, 0, 0, 0, 1, 1,
1.804215, 0.1848044, 1.853559, 0, 0, 0, 1, 1,
1.838209, -1.383834, 1.669776, 0, 0, 0, 1, 1,
1.842439, -0.7832048, 1.931596, 0, 0, 0, 1, 1,
1.846866, 0.6080399, 1.431792, 1, 1, 1, 1, 1,
1.849225, 0.3517879, 0.8063754, 1, 1, 1, 1, 1,
1.855317, -0.4833558, 1.497994, 1, 1, 1, 1, 1,
1.872942, 0.2258792, 1.219164, 1, 1, 1, 1, 1,
1.874979, -1.369927, 3.960363, 1, 1, 1, 1, 1,
1.891077, 0.8259309, 1.546438, 1, 1, 1, 1, 1,
1.924176, 1.012337, 1.380559, 1, 1, 1, 1, 1,
1.940806, -0.4950535, 2.255611, 1, 1, 1, 1, 1,
1.947285, 1.466941, -0.05356276, 1, 1, 1, 1, 1,
1.960217, 0.9958102, 2.628812, 1, 1, 1, 1, 1,
1.972787, 2.408888, 0.6980202, 1, 1, 1, 1, 1,
1.996396, -0.2502415, 1.075463, 1, 1, 1, 1, 1,
2.057697, -0.4169483, 1.606317, 1, 1, 1, 1, 1,
2.076002, -1.411615, 3.050378, 1, 1, 1, 1, 1,
2.099908, -0.6211835, 1.590218, 1, 1, 1, 1, 1,
2.106155, 0.4568594, 1.197495, 0, 0, 1, 1, 1,
2.13397, 0.6666675, -0.3786677, 1, 0, 0, 1, 1,
2.15345, 0.1214167, 0.6157576, 1, 0, 0, 1, 1,
2.173993, -0.6672809, 1.327746, 1, 0, 0, 1, 1,
2.188397, 0.5626979, 0.8876623, 1, 0, 0, 1, 1,
2.196049, 1.055632, 1.117084, 1, 0, 0, 1, 1,
2.215121, -0.04018978, 1.033239, 0, 0, 0, 1, 1,
2.269573, -0.9030405, 1.342824, 0, 0, 0, 1, 1,
2.320414, 1.382854, 2.51189, 0, 0, 0, 1, 1,
2.386111, -0.3445899, 1.689493, 0, 0, 0, 1, 1,
2.406364, 0.4971192, 1.364649, 0, 0, 0, 1, 1,
2.446448, -0.2068878, 1.791129, 0, 0, 0, 1, 1,
2.481339, 0.1966091, 0.8651781, 0, 0, 0, 1, 1,
2.50911, -3.314363, 2.179444, 1, 1, 1, 1, 1,
2.519086, -1.133862, 1.980362, 1, 1, 1, 1, 1,
2.520817, -0.9516755, 1.270083, 1, 1, 1, 1, 1,
2.592293, 0.03148321, 1.572865, 1, 1, 1, 1, 1,
2.675421, -1.895963, 2.906631, 1, 1, 1, 1, 1,
2.728848, -0.3245295, 4.220248, 1, 1, 1, 1, 1,
3.362505, 0.7048177, 1.482673, 1, 1, 1, 1, 1
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
var radius = 10.11304;
var distance = 35.52162;
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
mvMatrix.translate( 0.03188562, 0.03527689, -0.006741524 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.52162);
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
