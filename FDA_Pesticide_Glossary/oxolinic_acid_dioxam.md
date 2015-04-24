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
-3.617023, -1.47677, -2.34382, 1, 0, 0, 1,
-3.511889, 0.5340114, -2.049956, 1, 0.007843138, 0, 1,
-3.293625, 1.544072, -1.606111, 1, 0.01176471, 0, 1,
-3.240903, -0.9765442, -1.807112, 1, 0.01960784, 0, 1,
-3.159699, -1.544079, -2.172782, 1, 0.02352941, 0, 1,
-2.896079, 0.04999778, 0.6019512, 1, 0.03137255, 0, 1,
-2.781586, -0.8705051, -2.117271, 1, 0.03529412, 0, 1,
-2.639072, -1.038178, -2.139407, 1, 0.04313726, 0, 1,
-2.593598, 0.2835227, -2.524439, 1, 0.04705882, 0, 1,
-2.592207, 0.7685349, -0.662343, 1, 0.05490196, 0, 1,
-2.590664, -1.987356, -2.878883, 1, 0.05882353, 0, 1,
-2.551025, -1.753807, -0.7462034, 1, 0.06666667, 0, 1,
-2.479969, 0.2476293, -1.124407, 1, 0.07058824, 0, 1,
-2.456552, -1.327661, -2.284111, 1, 0.07843138, 0, 1,
-2.360886, -0.8514835, -1.532854, 1, 0.08235294, 0, 1,
-2.315064, 1.144136, -0.3641811, 1, 0.09019608, 0, 1,
-2.278092, 0.98111, 0.3553974, 1, 0.09411765, 0, 1,
-2.252843, -0.2267686, -0.5059849, 1, 0.1019608, 0, 1,
-2.237304, 0.1304243, -1.167233, 1, 0.1098039, 0, 1,
-2.235769, -0.4931523, -2.522422, 1, 0.1137255, 0, 1,
-2.218617, -1.161333, -1.275882, 1, 0.1215686, 0, 1,
-2.204188, -2.058461, -0.9073609, 1, 0.1254902, 0, 1,
-2.190969, -0.4350461, -2.807199, 1, 0.1333333, 0, 1,
-2.121096, 0.2115545, -2.032588, 1, 0.1372549, 0, 1,
-2.077196, 0.1944316, -1.753257, 1, 0.145098, 0, 1,
-2.067367, -1.604976, -3.509959, 1, 0.1490196, 0, 1,
-2.051977, -0.3506719, 0.07121184, 1, 0.1568628, 0, 1,
-2.035172, 0.1765659, -1.508927, 1, 0.1607843, 0, 1,
-2.032131, -2.292053, -2.569493, 1, 0.1686275, 0, 1,
-2.001978, -0.152703, -1.266886, 1, 0.172549, 0, 1,
-1.97784, 0.05863682, -2.106056, 1, 0.1803922, 0, 1,
-1.969809, 1.824636, -0.03194805, 1, 0.1843137, 0, 1,
-1.9193, 0.09247235, -1.228857, 1, 0.1921569, 0, 1,
-1.893888, 0.6925989, -2.120119, 1, 0.1960784, 0, 1,
-1.877611, 0.2363704, -3.89593, 1, 0.2039216, 0, 1,
-1.847904, 0.8176647, -0.5000358, 1, 0.2117647, 0, 1,
-1.820674, 0.7940131, -0.7973418, 1, 0.2156863, 0, 1,
-1.809149, -1.322188, -3.568177, 1, 0.2235294, 0, 1,
-1.796721, -0.4309811, -1.215236, 1, 0.227451, 0, 1,
-1.779131, 0.3230195, -2.658306, 1, 0.2352941, 0, 1,
-1.777343, 0.9005067, -1.062837, 1, 0.2392157, 0, 1,
-1.773576, 1.864506, -0.09491212, 1, 0.2470588, 0, 1,
-1.767988, -0.155744, -2.054091, 1, 0.2509804, 0, 1,
-1.766103, 0.0127928, -1.132226, 1, 0.2588235, 0, 1,
-1.761614, 1.01739, -0.7521081, 1, 0.2627451, 0, 1,
-1.733854, 0.7909372, -3.989281, 1, 0.2705882, 0, 1,
-1.731609, -1.240749, -2.622072, 1, 0.2745098, 0, 1,
-1.728558, 2.868514, 0.5793475, 1, 0.282353, 0, 1,
-1.718745, -0.2747975, -2.551712, 1, 0.2862745, 0, 1,
-1.704624, 0.6277043, -1.81387, 1, 0.2941177, 0, 1,
-1.700124, -0.8025195, -1.519443, 1, 0.3019608, 0, 1,
-1.687147, -0.07056119, -2.451174, 1, 0.3058824, 0, 1,
-1.631334, 0.1674264, -1.653016, 1, 0.3137255, 0, 1,
-1.627352, -0.1929146, -2.365619, 1, 0.3176471, 0, 1,
-1.625271, -0.2196451, -2.03069, 1, 0.3254902, 0, 1,
-1.620045, 0.735408, -1.189678, 1, 0.3294118, 0, 1,
-1.617227, -2.146853, -1.580143, 1, 0.3372549, 0, 1,
-1.611452, 2.465363, -0.2293725, 1, 0.3411765, 0, 1,
-1.609036, -0.352452, -0.6260232, 1, 0.3490196, 0, 1,
-1.602207, 1.443322, -1.919389, 1, 0.3529412, 0, 1,
-1.582218, 0.3042479, -0.5496608, 1, 0.3607843, 0, 1,
-1.568838, 0.6451079, -1.520032, 1, 0.3647059, 0, 1,
-1.567573, 0.6089096, 0.5692139, 1, 0.372549, 0, 1,
-1.565512, -0.08194718, 0.8851571, 1, 0.3764706, 0, 1,
-1.556483, -0.6869578, -3.439162, 1, 0.3843137, 0, 1,
-1.554986, -0.3923816, -1.471262, 1, 0.3882353, 0, 1,
-1.540366, 2.553628, -2.020421, 1, 0.3960784, 0, 1,
-1.53771, -0.5447805, -3.302702, 1, 0.4039216, 0, 1,
-1.520016, 1.240447, -3.604577, 1, 0.4078431, 0, 1,
-1.51379, -1.459909, -2.603896, 1, 0.4156863, 0, 1,
-1.512883, 0.5190887, -1.070303, 1, 0.4196078, 0, 1,
-1.506171, -0.1879677, -2.491612, 1, 0.427451, 0, 1,
-1.502642, 1.434639, -1.519039, 1, 0.4313726, 0, 1,
-1.447854, 0.7027838, -1.637152, 1, 0.4392157, 0, 1,
-1.446857, -1.465846, -2.54153, 1, 0.4431373, 0, 1,
-1.43753, -0.927614, -2.997979, 1, 0.4509804, 0, 1,
-1.431031, -0.8192791, -2.585943, 1, 0.454902, 0, 1,
-1.430093, 0.7190439, -2.100981, 1, 0.4627451, 0, 1,
-1.426241, 0.8276096, -3.031667, 1, 0.4666667, 0, 1,
-1.407888, -0.4822629, -3.59923, 1, 0.4745098, 0, 1,
-1.379027, 0.9734738, -3.65321, 1, 0.4784314, 0, 1,
-1.37866, -0.138911, -2.201644, 1, 0.4862745, 0, 1,
-1.365344, -0.037711, -0.4302777, 1, 0.4901961, 0, 1,
-1.351645, 0.9505853, -1.778545, 1, 0.4980392, 0, 1,
-1.327312, -1.93398, -2.285671, 1, 0.5058824, 0, 1,
-1.326764, -0.9549127, -1.027355, 1, 0.509804, 0, 1,
-1.324778, -1.080018, -1.081119, 1, 0.5176471, 0, 1,
-1.32412, -0.1739544, -0.8101642, 1, 0.5215687, 0, 1,
-1.323411, -1.246534, -2.908597, 1, 0.5294118, 0, 1,
-1.322217, 1.08005, -2.943194, 1, 0.5333334, 0, 1,
-1.309049, -0.6647106, -1.758497, 1, 0.5411765, 0, 1,
-1.292811, -0.717982, -1.092698, 1, 0.5450981, 0, 1,
-1.289404, -0.5710435, -2.343458, 1, 0.5529412, 0, 1,
-1.287792, 1.834193, -2.512131, 1, 0.5568628, 0, 1,
-1.286355, -0.1320307, -3.120634, 1, 0.5647059, 0, 1,
-1.28316, -0.8463867, -5.103495, 1, 0.5686275, 0, 1,
-1.267399, 1.640961, -0.9401556, 1, 0.5764706, 0, 1,
-1.261438, -1.389921, -1.162261, 1, 0.5803922, 0, 1,
-1.255929, -1.885836, -3.397453, 1, 0.5882353, 0, 1,
-1.248641, 0.6284134, 0.1886545, 1, 0.5921569, 0, 1,
-1.242475, 1.077445, -0.3622534, 1, 0.6, 0, 1,
-1.238387, 0.7334733, -1.543434, 1, 0.6078432, 0, 1,
-1.231488, -0.2131965, -1.755434, 1, 0.6117647, 0, 1,
-1.226807, 0.4381282, -1.914593, 1, 0.6196079, 0, 1,
-1.221659, -0.8740526, -0.717205, 1, 0.6235294, 0, 1,
-1.206527, 2.459602, -0.9597986, 1, 0.6313726, 0, 1,
-1.202739, -0.3830991, -3.025466, 1, 0.6352941, 0, 1,
-1.197396, 1.519793, 1.170084, 1, 0.6431373, 0, 1,
-1.187833, -1.18842, -1.325913, 1, 0.6470588, 0, 1,
-1.172813, -0.0253149, -0.2288446, 1, 0.654902, 0, 1,
-1.162539, 0.5910701, -0.9863738, 1, 0.6588235, 0, 1,
-1.162523, -0.3298878, -1.141456, 1, 0.6666667, 0, 1,
-1.160275, 0.8561822, -0.4267308, 1, 0.6705883, 0, 1,
-1.158956, 0.4716847, -2.11273, 1, 0.6784314, 0, 1,
-1.158856, 0.306114, -0.1291121, 1, 0.682353, 0, 1,
-1.158149, -0.105751, -0.6432577, 1, 0.6901961, 0, 1,
-1.155173, -2.318989, -3.384821, 1, 0.6941177, 0, 1,
-1.151533, -1.653238, -1.794203, 1, 0.7019608, 0, 1,
-1.150994, 1.132986, -0.7648491, 1, 0.7098039, 0, 1,
-1.150862, -0.6550206, -1.02381, 1, 0.7137255, 0, 1,
-1.138042, -1.290272, -2.018318, 1, 0.7215686, 0, 1,
-1.126664, -1.359102, -1.551426, 1, 0.7254902, 0, 1,
-1.123445, -2.791012, -3.974189, 1, 0.7333333, 0, 1,
-1.122874, 1.616595, 1.316043, 1, 0.7372549, 0, 1,
-1.120724, 1.811568, -1.371315, 1, 0.7450981, 0, 1,
-1.113716, -0.262278, -2.249468, 1, 0.7490196, 0, 1,
-1.089933, 0.3736782, -1.666325, 1, 0.7568628, 0, 1,
-1.089916, -1.174698, -1.844304, 1, 0.7607843, 0, 1,
-1.077578, 0.596936, -1.564325, 1, 0.7686275, 0, 1,
-1.071023, 0.358317, -0.9691578, 1, 0.772549, 0, 1,
-1.064323, 1.408986, -2.078163, 1, 0.7803922, 0, 1,
-1.060779, 0.5149826, 0.07132087, 1, 0.7843137, 0, 1,
-1.060567, -1.615537, -2.94317, 1, 0.7921569, 0, 1,
-1.056461, 1.042518, -0.4476353, 1, 0.7960784, 0, 1,
-1.055499, -0.8871865, -2.83196, 1, 0.8039216, 0, 1,
-1.049866, 0.7035372, -2.876723, 1, 0.8117647, 0, 1,
-1.047398, -1.081181, 0.2642925, 1, 0.8156863, 0, 1,
-1.046628, -0.6371598, -2.42588, 1, 0.8235294, 0, 1,
-1.045184, -1.516914, -1.916927, 1, 0.827451, 0, 1,
-1.044999, 0.7212694, -1.813037, 1, 0.8352941, 0, 1,
-1.020504, -0.6017705, -4.327487, 1, 0.8392157, 0, 1,
-1.018355, -0.1717581, -2.774904, 1, 0.8470588, 0, 1,
-1.014911, -0.8211628, -2.70747, 1, 0.8509804, 0, 1,
-1.013323, -0.4755471, -1.797521, 1, 0.8588235, 0, 1,
-1.007196, 1.485092, -0.9195309, 1, 0.8627451, 0, 1,
-1.005638, 2.213004, -0.6179389, 1, 0.8705882, 0, 1,
-1.001554, -0.6778608, -2.100158, 1, 0.8745098, 0, 1,
-0.998899, 1.722342, 0.1257213, 1, 0.8823529, 0, 1,
-0.9968203, -0.4603215, -2.470823, 1, 0.8862745, 0, 1,
-0.9956942, -0.599462, -1.875336, 1, 0.8941177, 0, 1,
-0.9823909, 0.4735292, -0.4084707, 1, 0.8980392, 0, 1,
-0.9809783, -2.070453, -1.446558, 1, 0.9058824, 0, 1,
-0.979789, -0.7788602, -1.370443, 1, 0.9137255, 0, 1,
-0.9769593, -1.762949, -0.4833117, 1, 0.9176471, 0, 1,
-0.9710148, -0.9432564, -3.367816, 1, 0.9254902, 0, 1,
-0.970105, -0.5060396, -3.136856, 1, 0.9294118, 0, 1,
-0.9665665, -0.3911952, -3.122565, 1, 0.9372549, 0, 1,
-0.9657822, -0.1138835, -0.6157539, 1, 0.9411765, 0, 1,
-0.9600301, -1.015548, -4.013272, 1, 0.9490196, 0, 1,
-0.959033, 0.292441, -2.072744, 1, 0.9529412, 0, 1,
-0.9528543, 1.078812, -1.430178, 1, 0.9607843, 0, 1,
-0.9495384, -0.5454521, -2.243922, 1, 0.9647059, 0, 1,
-0.9395599, -0.5188985, -2.649257, 1, 0.972549, 0, 1,
-0.9333341, -0.6215675, -1.647926, 1, 0.9764706, 0, 1,
-0.9316137, -0.08374421, -0.9925953, 1, 0.9843137, 0, 1,
-0.9279465, 0.7861267, -1.844564, 1, 0.9882353, 0, 1,
-0.925475, 0.55334, -2.768104, 1, 0.9960784, 0, 1,
-0.922117, 0.6998396, -1.556175, 0.9960784, 1, 0, 1,
-0.9187771, -0.5908552, -1.823013, 0.9921569, 1, 0, 1,
-0.9142385, 1.269468, 0.3265495, 0.9843137, 1, 0, 1,
-0.9087048, 0.687678, -2.363821, 0.9803922, 1, 0, 1,
-0.8930778, -0.5666242, -3.558838, 0.972549, 1, 0, 1,
-0.8919252, -1.534292, -3.33251, 0.9686275, 1, 0, 1,
-0.8909813, 0.3030106, -1.320465, 0.9607843, 1, 0, 1,
-0.8843404, -1.076579, -2.066125, 0.9568627, 1, 0, 1,
-0.8814919, 0.3441663, -1.069748, 0.9490196, 1, 0, 1,
-0.8784471, 0.1794273, -0.01734141, 0.945098, 1, 0, 1,
-0.8720287, 0.562404, -1.850401, 0.9372549, 1, 0, 1,
-0.8605144, -0.6901704, -1.827057, 0.9333333, 1, 0, 1,
-0.8571206, -0.7857182, -3.413615, 0.9254902, 1, 0, 1,
-0.845401, 0.322618, -2.316144, 0.9215686, 1, 0, 1,
-0.8431426, 0.03059996, 0.5837593, 0.9137255, 1, 0, 1,
-0.8375815, 0.3350231, -0.08204608, 0.9098039, 1, 0, 1,
-0.8315549, 0.80467, -0.4738978, 0.9019608, 1, 0, 1,
-0.8292741, 2.02917, -1.269299, 0.8941177, 1, 0, 1,
-0.8263603, -0.74265, -3.175961, 0.8901961, 1, 0, 1,
-0.8253066, 0.1644252, -1.999204, 0.8823529, 1, 0, 1,
-0.8167276, 1.354305, -0.8704584, 0.8784314, 1, 0, 1,
-0.8147233, 0.82537, -1.453441, 0.8705882, 1, 0, 1,
-0.8008277, -0.263225, -4.340616, 0.8666667, 1, 0, 1,
-0.7998127, 0.7122777, -1.218683, 0.8588235, 1, 0, 1,
-0.7970372, 0.7140993, -2.709226, 0.854902, 1, 0, 1,
-0.7915258, -0.5098806, -2.754565, 0.8470588, 1, 0, 1,
-0.7907824, 0.03164529, -1.492985, 0.8431373, 1, 0, 1,
-0.787423, 0.06139917, -0.9150483, 0.8352941, 1, 0, 1,
-0.7844858, 2.294149, -0.7098305, 0.8313726, 1, 0, 1,
-0.7794679, -0.04435108, -1.168747, 0.8235294, 1, 0, 1,
-0.7780865, 1.145846, -0.7389086, 0.8196079, 1, 0, 1,
-0.7699786, -0.076288, -2.709291, 0.8117647, 1, 0, 1,
-0.752251, 0.8458109, -0.7011463, 0.8078431, 1, 0, 1,
-0.751085, 1.547722, -0.1591691, 0.8, 1, 0, 1,
-0.7504876, -0.8005139, -3.327458, 0.7921569, 1, 0, 1,
-0.7451155, 0.4651318, -0.3397984, 0.7882353, 1, 0, 1,
-0.7443333, -0.08899557, -1.88713, 0.7803922, 1, 0, 1,
-0.7414295, 1.559001, -2.8869, 0.7764706, 1, 0, 1,
-0.7403407, -0.245164, -1.143521, 0.7686275, 1, 0, 1,
-0.732098, -0.4808735, -1.63094, 0.7647059, 1, 0, 1,
-0.7307081, -2.341375, -2.715617, 0.7568628, 1, 0, 1,
-0.7298692, 1.541697, 1.854084, 0.7529412, 1, 0, 1,
-0.7259875, 0.8731337, -3.021363, 0.7450981, 1, 0, 1,
-0.7205313, 0.979495, -0.7075414, 0.7411765, 1, 0, 1,
-0.7180196, 0.9752369, -0.8347853, 0.7333333, 1, 0, 1,
-0.715662, 0.3098789, -2.065119, 0.7294118, 1, 0, 1,
-0.7149473, 0.100502, -0.4473672, 0.7215686, 1, 0, 1,
-0.7027057, 0.7870927, -1.156924, 0.7176471, 1, 0, 1,
-0.7023394, -0.4587379, -3.942819, 0.7098039, 1, 0, 1,
-0.6909848, 0.1128831, -2.201998, 0.7058824, 1, 0, 1,
-0.69046, 0.07137734, -1.930375, 0.6980392, 1, 0, 1,
-0.687518, -0.1780391, -0.7551168, 0.6901961, 1, 0, 1,
-0.6862776, 1.314242, -0.4931039, 0.6862745, 1, 0, 1,
-0.6847454, 0.131715, -2.346727, 0.6784314, 1, 0, 1,
-0.6793016, -0.04458943, -2.326966, 0.6745098, 1, 0, 1,
-0.6782199, -1.797282, -4.001706, 0.6666667, 1, 0, 1,
-0.6742164, -0.8848758, -2.714903, 0.6627451, 1, 0, 1,
-0.6652272, -0.4400354, -1.887777, 0.654902, 1, 0, 1,
-0.6601349, 0.3609453, -0.5231857, 0.6509804, 1, 0, 1,
-0.6568164, 0.04075525, -2.507067, 0.6431373, 1, 0, 1,
-0.6542056, 0.05360341, -1.881242, 0.6392157, 1, 0, 1,
-0.6539724, -0.4657843, -2.559827, 0.6313726, 1, 0, 1,
-0.6533831, -1.361877, -2.798531, 0.627451, 1, 0, 1,
-0.6519976, 1.015401, -1.780428, 0.6196079, 1, 0, 1,
-0.6501729, -1.078892, -0.7901817, 0.6156863, 1, 0, 1,
-0.6493337, -0.1536262, -1.310372, 0.6078432, 1, 0, 1,
-0.6493186, -0.08285814, -2.346696, 0.6039216, 1, 0, 1,
-0.648886, -0.384664, -2.380321, 0.5960785, 1, 0, 1,
-0.6478896, -0.4656774, -2.80267, 0.5882353, 1, 0, 1,
-0.6436186, 0.3134073, -1.001214, 0.5843138, 1, 0, 1,
-0.6321131, 0.2344564, -0.1927313, 0.5764706, 1, 0, 1,
-0.6307696, 0.215724, -1.262436, 0.572549, 1, 0, 1,
-0.6261588, 0.4685057, -1.001953, 0.5647059, 1, 0, 1,
-0.625592, -0.1807978, -0.3058782, 0.5607843, 1, 0, 1,
-0.6254544, 0.5641502, 1.039063, 0.5529412, 1, 0, 1,
-0.6236707, -1.321177, -2.51906, 0.5490196, 1, 0, 1,
-0.6176006, -1.731692, -2.448707, 0.5411765, 1, 0, 1,
-0.6139491, -1.127169, -1.321708, 0.5372549, 1, 0, 1,
-0.6131167, -0.9881377, -2.313974, 0.5294118, 1, 0, 1,
-0.6103976, -0.6604416, -3.75212, 0.5254902, 1, 0, 1,
-0.6085389, -1.714685, -1.360687, 0.5176471, 1, 0, 1,
-0.6085108, 1.722322, -0.2598521, 0.5137255, 1, 0, 1,
-0.6084937, 0.5954599, 0.4588684, 0.5058824, 1, 0, 1,
-0.6067551, 0.4015761, -2.090734, 0.5019608, 1, 0, 1,
-0.6052868, -0.4368354, -1.718143, 0.4941176, 1, 0, 1,
-0.6049736, 0.7268161, -0.5559658, 0.4862745, 1, 0, 1,
-0.6038412, 0.5383173, -1.834803, 0.4823529, 1, 0, 1,
-0.6031427, 1.799344, -0.06252249, 0.4745098, 1, 0, 1,
-0.5948784, 1.677077, -0.419609, 0.4705882, 1, 0, 1,
-0.5947171, 0.8094985, -0.01951273, 0.4627451, 1, 0, 1,
-0.5913103, -0.2144149, -2.277196, 0.4588235, 1, 0, 1,
-0.5840272, 0.9340765, 0.7554686, 0.4509804, 1, 0, 1,
-0.583636, -0.3897625, -2.072526, 0.4470588, 1, 0, 1,
-0.5835327, 0.3592619, -0.1897683, 0.4392157, 1, 0, 1,
-0.5834861, -0.940268, -2.816616, 0.4352941, 1, 0, 1,
-0.5793533, 0.05669772, 0.9487385, 0.427451, 1, 0, 1,
-0.5789606, -0.2347312, -2.55608, 0.4235294, 1, 0, 1,
-0.5786979, -0.6493782, -2.034212, 0.4156863, 1, 0, 1,
-0.5780094, -0.784839, -2.823638, 0.4117647, 1, 0, 1,
-0.5779511, -0.6300407, -2.33546, 0.4039216, 1, 0, 1,
-0.5767932, 0.6752855, -1.184165, 0.3960784, 1, 0, 1,
-0.5763225, -0.4335009, -3.410783, 0.3921569, 1, 0, 1,
-0.5643851, 0.2472338, -3.045567, 0.3843137, 1, 0, 1,
-0.5569579, -0.2010357, -2.700526, 0.3803922, 1, 0, 1,
-0.5457199, -1.309118, -1.940221, 0.372549, 1, 0, 1,
-0.5441856, 1.320861, -2.474046, 0.3686275, 1, 0, 1,
-0.5431228, -0.7440658, -1.581217, 0.3607843, 1, 0, 1,
-0.5391957, -0.8391148, -3.144662, 0.3568628, 1, 0, 1,
-0.5386032, 0.3102795, -1.562316, 0.3490196, 1, 0, 1,
-0.5385804, 0.5300639, -0.1986195, 0.345098, 1, 0, 1,
-0.5382717, 0.4019611, -1.302839, 0.3372549, 1, 0, 1,
-0.5355033, -0.1573713, -0.1547253, 0.3333333, 1, 0, 1,
-0.5295885, -0.5923604, -3.590999, 0.3254902, 1, 0, 1,
-0.5288846, 1.103098, 1.30199, 0.3215686, 1, 0, 1,
-0.5286502, 0.7538467, 0.469751, 0.3137255, 1, 0, 1,
-0.5196435, -0.8005639, -3.418023, 0.3098039, 1, 0, 1,
-0.5193242, -0.01889105, -0.2892136, 0.3019608, 1, 0, 1,
-0.5187637, -1.490127, -2.971665, 0.2941177, 1, 0, 1,
-0.5173405, -0.1821554, -0.9458313, 0.2901961, 1, 0, 1,
-0.5137615, -0.7657956, -2.480015, 0.282353, 1, 0, 1,
-0.5137455, -0.6621822, -2.351649, 0.2784314, 1, 0, 1,
-0.5107597, -1.917778, -4.686025, 0.2705882, 1, 0, 1,
-0.5076858, 0.5657432, -1.636392, 0.2666667, 1, 0, 1,
-0.5075737, 0.2264473, -1.325553, 0.2588235, 1, 0, 1,
-0.5072443, -1.756927, -1.315444, 0.254902, 1, 0, 1,
-0.5034955, 2.280621, -0.2007771, 0.2470588, 1, 0, 1,
-0.5018961, 1.178735, -0.8933089, 0.2431373, 1, 0, 1,
-0.4996988, -0.8792655, -0.3252742, 0.2352941, 1, 0, 1,
-0.4977851, 0.3706754, -0.1267948, 0.2313726, 1, 0, 1,
-0.4935949, -1.129776, -3.085011, 0.2235294, 1, 0, 1,
-0.4913051, -2.288316, -2.915186, 0.2196078, 1, 0, 1,
-0.4897198, -0.02774636, -1.205529, 0.2117647, 1, 0, 1,
-0.4800603, -0.3159865, -1.593214, 0.2078431, 1, 0, 1,
-0.4792446, 0.7654653, -0.304787, 0.2, 1, 0, 1,
-0.4730387, -0.6449832, -0.9334707, 0.1921569, 1, 0, 1,
-0.4728633, 0.172544, -1.136537, 0.1882353, 1, 0, 1,
-0.4685705, -0.3058748, -1.648482, 0.1803922, 1, 0, 1,
-0.4665592, 0.7412533, -1.134839, 0.1764706, 1, 0, 1,
-0.4621837, -1.483264, -3.397992, 0.1686275, 1, 0, 1,
-0.4606682, 0.3601018, -1.686164, 0.1647059, 1, 0, 1,
-0.4605478, 0.406225, 0.03286235, 0.1568628, 1, 0, 1,
-0.4595051, 1.037995, -1.319058, 0.1529412, 1, 0, 1,
-0.452712, 0.6871393, 1.555576, 0.145098, 1, 0, 1,
-0.4515865, 0.9494894, -0.7286536, 0.1411765, 1, 0, 1,
-0.443658, 1.042496, -0.5114277, 0.1333333, 1, 0, 1,
-0.4433305, -0.01231554, -2.714278, 0.1294118, 1, 0, 1,
-0.4433134, -0.3654591, -1.988916, 0.1215686, 1, 0, 1,
-0.4337825, -0.2888169, -1.911919, 0.1176471, 1, 0, 1,
-0.4245302, 1.895502, 0.8754408, 0.1098039, 1, 0, 1,
-0.4227301, 0.3669931, -0.4797687, 0.1058824, 1, 0, 1,
-0.4194598, -0.7253433, -3.971872, 0.09803922, 1, 0, 1,
-0.4089929, 1.521067, -0.8052223, 0.09019608, 1, 0, 1,
-0.4079314, 0.3107809, -1.512266, 0.08627451, 1, 0, 1,
-0.4018746, 0.03809606, -0.1679159, 0.07843138, 1, 0, 1,
-0.4009801, -0.006108955, -1.011963, 0.07450981, 1, 0, 1,
-0.3993557, 1.531663, -0.5038765, 0.06666667, 1, 0, 1,
-0.3979843, -0.1429107, -2.227478, 0.0627451, 1, 0, 1,
-0.3966324, 0.7474608, -0.1029266, 0.05490196, 1, 0, 1,
-0.3963515, -0.871752, -1.315641, 0.05098039, 1, 0, 1,
-0.3952464, 0.04374471, -1.167669, 0.04313726, 1, 0, 1,
-0.3922808, -1.056646, -2.107682, 0.03921569, 1, 0, 1,
-0.3896144, 0.4941114, -1.18203, 0.03137255, 1, 0, 1,
-0.3862129, 2.397102, 0.7430769, 0.02745098, 1, 0, 1,
-0.3859495, 1.741132, -1.181036, 0.01960784, 1, 0, 1,
-0.3858231, -0.2089193, -2.039948, 0.01568628, 1, 0, 1,
-0.3853401, 0.950377, 0.2798226, 0.007843138, 1, 0, 1,
-0.3833034, -0.5226216, -3.233872, 0.003921569, 1, 0, 1,
-0.3799314, -0.3254855, -3.676955, 0, 1, 0.003921569, 1,
-0.3795326, -0.6945825, -3.677812, 0, 1, 0.01176471, 1,
-0.360823, -0.4645903, -1.135074, 0, 1, 0.01568628, 1,
-0.3570601, -0.7205558, -2.477268, 0, 1, 0.02352941, 1,
-0.3557197, 0.09815238, -0.4102244, 0, 1, 0.02745098, 1,
-0.3554901, -0.2523564, 0.006301458, 0, 1, 0.03529412, 1,
-0.3554139, 1.459944, 0.01853273, 0, 1, 0.03921569, 1,
-0.3554086, -0.7789794, -0.847914, 0, 1, 0.04705882, 1,
-0.3540951, -0.5730873, -1.978149, 0, 1, 0.05098039, 1,
-0.3509071, 0.3685318, 0.8238775, 0, 1, 0.05882353, 1,
-0.3504284, 1.380908, -0.929717, 0, 1, 0.0627451, 1,
-0.3446111, 3.064856, -0.2219835, 0, 1, 0.07058824, 1,
-0.3434319, -2.792086, -5.034438, 0, 1, 0.07450981, 1,
-0.3411755, 0.6197726, -1.482659, 0, 1, 0.08235294, 1,
-0.3402862, -2.022805, -1.301591, 0, 1, 0.08627451, 1,
-0.3385225, -0.618511, -3.244759, 0, 1, 0.09411765, 1,
-0.3368986, -0.7740397, -3.454029, 0, 1, 0.1019608, 1,
-0.3346064, 0.4216447, 0.8790082, 0, 1, 0.1058824, 1,
-0.3330999, -1.011935, -0.9005066, 0, 1, 0.1137255, 1,
-0.331312, -1.193398, -2.55, 0, 1, 0.1176471, 1,
-0.3254471, -1.254336, -1.917572, 0, 1, 0.1254902, 1,
-0.3246318, -2.183371, -4.752852, 0, 1, 0.1294118, 1,
-0.3233193, 0.9847142, -1.180752, 0, 1, 0.1372549, 1,
-0.3186665, -0.6393004, -1.673279, 0, 1, 0.1411765, 1,
-0.3186141, 0.09889916, -0.9820547, 0, 1, 0.1490196, 1,
-0.3177812, -0.1377297, 0.02410778, 0, 1, 0.1529412, 1,
-0.3085255, 0.8584486, 2.040815, 0, 1, 0.1607843, 1,
-0.3039882, 0.9511791, -1.213135, 0, 1, 0.1647059, 1,
-0.3039366, -0.1051037, -0.7128879, 0, 1, 0.172549, 1,
-0.2982599, 0.4853873, -1.280494, 0, 1, 0.1764706, 1,
-0.2977318, 0.2549593, -2.275712, 0, 1, 0.1843137, 1,
-0.2967265, 0.8393256, -0.5106587, 0, 1, 0.1882353, 1,
-0.2961738, -1.294824, -3.177162, 0, 1, 0.1960784, 1,
-0.2935693, -0.28901, -1.516287, 0, 1, 0.2039216, 1,
-0.2882113, 0.4348397, 0.290194, 0, 1, 0.2078431, 1,
-0.2842876, -0.6140567, -3.2737, 0, 1, 0.2156863, 1,
-0.2823654, -1.001912, -4.04696, 0, 1, 0.2196078, 1,
-0.2810546, 0.6282343, -0.5522851, 0, 1, 0.227451, 1,
-0.2744476, 0.6545692, -0.6493682, 0, 1, 0.2313726, 1,
-0.2732942, 0.7703924, 0.4282743, 0, 1, 0.2392157, 1,
-0.2716022, 0.01155322, -3.07106, 0, 1, 0.2431373, 1,
-0.2694843, 1.236767, -0.6579047, 0, 1, 0.2509804, 1,
-0.2689073, 0.5323125, -0.8868416, 0, 1, 0.254902, 1,
-0.2686052, 0.6135827, -0.7326848, 0, 1, 0.2627451, 1,
-0.266251, 0.4631624, -0.804504, 0, 1, 0.2666667, 1,
-0.2636521, 0.5859078, -0.374522, 0, 1, 0.2745098, 1,
-0.2626287, -0.1451087, -1.944441, 0, 1, 0.2784314, 1,
-0.2604515, -1.889004, -3.661398, 0, 1, 0.2862745, 1,
-0.2596591, 1.097335, -1.320613, 0, 1, 0.2901961, 1,
-0.259185, 0.824595, -0.6220263, 0, 1, 0.2980392, 1,
-0.257159, 0.5594174, 0.8579175, 0, 1, 0.3058824, 1,
-0.2471087, 0.5650302, -0.613724, 0, 1, 0.3098039, 1,
-0.2464595, 0.9514762, -0.7428321, 0, 1, 0.3176471, 1,
-0.2398822, 0.1609294, -3.002456, 0, 1, 0.3215686, 1,
-0.237083, 0.05480849, -1.073765, 0, 1, 0.3294118, 1,
-0.2344623, 1.386851, -0.2099303, 0, 1, 0.3333333, 1,
-0.2292608, -0.03887644, -0.6720419, 0, 1, 0.3411765, 1,
-0.2277617, -1.093799, -5.048728, 0, 1, 0.345098, 1,
-0.22665, 1.060404, -1.194335, 0, 1, 0.3529412, 1,
-0.2237853, -0.6203553, -2.138321, 0, 1, 0.3568628, 1,
-0.2226832, -0.810856, -3.23665, 0, 1, 0.3647059, 1,
-0.2221586, -0.8066146, -5.458802, 0, 1, 0.3686275, 1,
-0.2205338, -2.506576, -4.806193, 0, 1, 0.3764706, 1,
-0.2196395, 0.1002911, -1.329527, 0, 1, 0.3803922, 1,
-0.2190343, 0.6169147, 0.7919476, 0, 1, 0.3882353, 1,
-0.2154506, -0.7491894, -2.609104, 0, 1, 0.3921569, 1,
-0.2148972, -0.5602449, -1.220799, 0, 1, 0.4, 1,
-0.2062655, 0.6441898, -0.3879716, 0, 1, 0.4078431, 1,
-0.206023, 1.816103, -0.4476547, 0, 1, 0.4117647, 1,
-0.2038096, 1.502635, 0.7278669, 0, 1, 0.4196078, 1,
-0.2033162, 0.1258396, -2.629081, 0, 1, 0.4235294, 1,
-0.2027477, 0.6637574, 0.7786722, 0, 1, 0.4313726, 1,
-0.2013291, -0.4154438, -1.913228, 0, 1, 0.4352941, 1,
-0.2006496, 0.3402092, -1.331527, 0, 1, 0.4431373, 1,
-0.1996374, 1.079214, -0.7115176, 0, 1, 0.4470588, 1,
-0.1942357, 1.133386, -2.083324, 0, 1, 0.454902, 1,
-0.192436, -0.7459276, -2.552435, 0, 1, 0.4588235, 1,
-0.1914548, -1.543023, -2.739615, 0, 1, 0.4666667, 1,
-0.1905792, 0.6286362, -0.8726234, 0, 1, 0.4705882, 1,
-0.1902871, 0.09196723, 0.232937, 0, 1, 0.4784314, 1,
-0.1798956, -0.2667491, -2.001325, 0, 1, 0.4823529, 1,
-0.1711988, -0.2969442, -3.654182, 0, 1, 0.4901961, 1,
-0.1702561, 0.3495481, -1.552443, 0, 1, 0.4941176, 1,
-0.1699236, -0.444503, -2.339924, 0, 1, 0.5019608, 1,
-0.1650337, -0.2017697, -3.092709, 0, 1, 0.509804, 1,
-0.1623723, -1.534458, -3.375192, 0, 1, 0.5137255, 1,
-0.1614711, 1.141924, -0.4800439, 0, 1, 0.5215687, 1,
-0.1564948, 1.103686, -0.6580879, 0, 1, 0.5254902, 1,
-0.1534718, -0.7622051, -3.984964, 0, 1, 0.5333334, 1,
-0.1531099, -0.1212437, -2.816284, 0, 1, 0.5372549, 1,
-0.1495545, -0.2335912, -2.883028, 0, 1, 0.5450981, 1,
-0.1456723, -0.08756374, -2.334477, 0, 1, 0.5490196, 1,
-0.1442929, -0.4894798, -1.276814, 0, 1, 0.5568628, 1,
-0.1417693, 1.171716, -1.076251, 0, 1, 0.5607843, 1,
-0.1413559, 0.7608694, -1.161591, 0, 1, 0.5686275, 1,
-0.1375386, -0.04155163, -2.837011, 0, 1, 0.572549, 1,
-0.1370465, -0.8093733, -3.466053, 0, 1, 0.5803922, 1,
-0.1361318, 0.3561271, 0.2476224, 0, 1, 0.5843138, 1,
-0.1351984, 1.659661, 0.7570508, 0, 1, 0.5921569, 1,
-0.133078, 2.208184, -2.307862, 0, 1, 0.5960785, 1,
-0.1291356, -1.199858, -4.771322, 0, 1, 0.6039216, 1,
-0.1280811, -0.0805403, -3.576502, 0, 1, 0.6117647, 1,
-0.1267976, -1.726667, -2.713214, 0, 1, 0.6156863, 1,
-0.1256734, -1.745693, -1.667083, 0, 1, 0.6235294, 1,
-0.1252333, 1.047524, 0.01484239, 0, 1, 0.627451, 1,
-0.1229985, 1.031927, 0.5098292, 0, 1, 0.6352941, 1,
-0.1193627, 0.005990394, -1.027226, 0, 1, 0.6392157, 1,
-0.119229, 0.3279453, -0.1514035, 0, 1, 0.6470588, 1,
-0.1183711, -0.2160896, -2.2309, 0, 1, 0.6509804, 1,
-0.1163591, -1.016756, -3.933547, 0, 1, 0.6588235, 1,
-0.1143356, 1.904624, 1.05031, 0, 1, 0.6627451, 1,
-0.09871881, 0.08210891, -0.9031574, 0, 1, 0.6705883, 1,
-0.09732789, -0.8548308, -4.09973, 0, 1, 0.6745098, 1,
-0.09731527, 0.5902442, -0.1399895, 0, 1, 0.682353, 1,
-0.0913783, 0.7558722, -0.9402552, 0, 1, 0.6862745, 1,
-0.08993538, 0.4177499, -0.8210961, 0, 1, 0.6941177, 1,
-0.0887981, -3.352727, -2.967957, 0, 1, 0.7019608, 1,
-0.08727593, -0.4441891, -2.85872, 0, 1, 0.7058824, 1,
-0.08620694, 0.3708395, 0.3668398, 0, 1, 0.7137255, 1,
-0.07971753, -0.2993876, -1.46698, 0, 1, 0.7176471, 1,
-0.07605017, 0.0640095, -1.239447, 0, 1, 0.7254902, 1,
-0.07416535, 1.416529, 2.324076, 0, 1, 0.7294118, 1,
-0.07024328, 0.322359, -0.1432884, 0, 1, 0.7372549, 1,
-0.06793597, 0.4783581, -1.197196, 0, 1, 0.7411765, 1,
-0.06347775, 1.196197, -0.07233199, 0, 1, 0.7490196, 1,
-0.06136059, -0.6091385, -4.131461, 0, 1, 0.7529412, 1,
-0.05916354, -0.6741952, -3.987833, 0, 1, 0.7607843, 1,
-0.05726429, -0.9400226, -2.188931, 0, 1, 0.7647059, 1,
-0.05513112, -1.651293, -4.225296, 0, 1, 0.772549, 1,
-0.04613107, 0.5663136, 0.231908, 0, 1, 0.7764706, 1,
-0.04547022, 0.2536592, -1.176578, 0, 1, 0.7843137, 1,
-0.04403988, -0.4828305, -4.640678, 0, 1, 0.7882353, 1,
-0.04174106, -0.4547155, -3.17103, 0, 1, 0.7960784, 1,
-0.04124444, -0.8402692, -3.733232, 0, 1, 0.8039216, 1,
-0.03744886, -1.106384, -4.286777, 0, 1, 0.8078431, 1,
-0.03678795, -0.9064325, -3.696839, 0, 1, 0.8156863, 1,
-0.03676337, 1.418597, -1.181643, 0, 1, 0.8196079, 1,
-0.03454908, -0.2321636, -2.748288, 0, 1, 0.827451, 1,
-0.02630569, 0.8232582, -1.15205, 0, 1, 0.8313726, 1,
-0.02083923, 0.567228, -1.261093, 0, 1, 0.8392157, 1,
-0.02074382, -0.3624363, -4.787464, 0, 1, 0.8431373, 1,
-0.02065214, -0.574366, -5.112241, 0, 1, 0.8509804, 1,
-0.02030245, -0.543371, -2.338771, 0, 1, 0.854902, 1,
-0.01969295, 1.125018, 0.5669677, 0, 1, 0.8627451, 1,
-0.01783469, 0.6506017, 0.01201328, 0, 1, 0.8666667, 1,
-0.01730995, -0.09195749, -4.716444, 0, 1, 0.8745098, 1,
-0.01612456, -0.4615047, -1.55729, 0, 1, 0.8784314, 1,
-0.01515674, -0.6358743, -2.035051, 0, 1, 0.8862745, 1,
-0.01387663, 0.2537993, 1.041313, 0, 1, 0.8901961, 1,
-0.009913644, -0.6933973, -4.690482, 0, 1, 0.8980392, 1,
-0.007698752, 0.8587582, 0.694814, 0, 1, 0.9058824, 1,
-0.005028912, -0.4557691, -3.145725, 0, 1, 0.9098039, 1,
-0.004501988, -0.5987422, -4.074224, 0, 1, 0.9176471, 1,
-0.003631222, -1.504664, -3.937251, 0, 1, 0.9215686, 1,
-0.002492067, -0.1538435, -4.493416, 0, 1, 0.9294118, 1,
-0.001231357, -0.0253818, -2.783497, 0, 1, 0.9333333, 1,
-0.0009173137, 0.9853098, -0.2599554, 0, 1, 0.9411765, 1,
0.001043622, 1.0573, -0.8971081, 0, 1, 0.945098, 1,
0.01804842, -0.598453, 3.760013, 0, 1, 0.9529412, 1,
0.02015282, -0.3874068, 3.489867, 0, 1, 0.9568627, 1,
0.0208129, 1.537859, 0.8384277, 0, 1, 0.9647059, 1,
0.02122199, 0.4973579, -1.393949, 0, 1, 0.9686275, 1,
0.02222913, 0.2817677, 0.4553957, 0, 1, 0.9764706, 1,
0.02533467, 0.2611715, -0.2628851, 0, 1, 0.9803922, 1,
0.02779902, 0.7340262, 0.4687648, 0, 1, 0.9882353, 1,
0.03143464, -0.1299378, 3.671851, 0, 1, 0.9921569, 1,
0.03203684, 0.03724785, -1.294478, 0, 1, 1, 1,
0.03709097, -0.3626037, 1.354778, 0, 0.9921569, 1, 1,
0.04130018, 1.538433, 0.8289569, 0, 0.9882353, 1, 1,
0.04408645, -0.1182765, 1.080932, 0, 0.9803922, 1, 1,
0.04595625, 0.6983701, -0.62181, 0, 0.9764706, 1, 1,
0.0510937, -0.01750669, 2.398787, 0, 0.9686275, 1, 1,
0.05399492, 0.7665356, 0.5420223, 0, 0.9647059, 1, 1,
0.05647882, 0.3631667, -1.924352, 0, 0.9568627, 1, 1,
0.0596372, -0.5684198, 3.361362, 0, 0.9529412, 1, 1,
0.0600207, 0.2178749, -0.1780251, 0, 0.945098, 1, 1,
0.06366926, -1.602672, 2.012281, 0, 0.9411765, 1, 1,
0.06657698, -0.4844516, 3.050642, 0, 0.9333333, 1, 1,
0.06720054, -0.6943803, 3.354127, 0, 0.9294118, 1, 1,
0.0706086, -0.2990101, 4.66988, 0, 0.9215686, 1, 1,
0.07147403, 1.429216, 0.8034794, 0, 0.9176471, 1, 1,
0.07548428, 0.2174084, 1.593445, 0, 0.9098039, 1, 1,
0.07803497, -1.201453, 3.563261, 0, 0.9058824, 1, 1,
0.08326279, -0.4022822, 2.22857, 0, 0.8980392, 1, 1,
0.08622882, 0.8016579, 1.293612, 0, 0.8901961, 1, 1,
0.08688146, 0.9610601, -0.8203581, 0, 0.8862745, 1, 1,
0.09236445, 0.003082937, 3.686538, 0, 0.8784314, 1, 1,
0.0923853, 0.7103861, 0.794064, 0, 0.8745098, 1, 1,
0.09428052, 1.187411, 0.5328813, 0, 0.8666667, 1, 1,
0.09897985, 0.2448377, -0.9617192, 0, 0.8627451, 1, 1,
0.1036717, -0.4040287, 1.590266, 0, 0.854902, 1, 1,
0.1045879, 0.4866554, 0.04926614, 0, 0.8509804, 1, 1,
0.1049892, -0.1772551, 2.24422, 0, 0.8431373, 1, 1,
0.1080917, 0.9432635, 0.2105071, 0, 0.8392157, 1, 1,
0.1090712, -1.257128, 4.432247, 0, 0.8313726, 1, 1,
0.1111751, 0.2621199, 0.4411898, 0, 0.827451, 1, 1,
0.1127483, -0.367803, 1.187918, 0, 0.8196079, 1, 1,
0.1149172, -0.9724539, 2.571524, 0, 0.8156863, 1, 1,
0.1158814, 1.190548, -0.4689577, 0, 0.8078431, 1, 1,
0.1178568, 0.7974194, 1.299631, 0, 0.8039216, 1, 1,
0.1197485, -0.05915081, 3.471208, 0, 0.7960784, 1, 1,
0.1270257, -0.520639, 3.924678, 0, 0.7882353, 1, 1,
0.1280607, 0.8066566, 0.2205743, 0, 0.7843137, 1, 1,
0.1340867, -2.44478, 2.341539, 0, 0.7764706, 1, 1,
0.1347831, 0.8341202, 0.2535131, 0, 0.772549, 1, 1,
0.1355944, 0.2586907, 1.875522, 0, 0.7647059, 1, 1,
0.1394687, 1.256971, -1.723984, 0, 0.7607843, 1, 1,
0.1396928, -0.3555975, 4.336531, 0, 0.7529412, 1, 1,
0.1470526, 0.9220839, -0.5985115, 0, 0.7490196, 1, 1,
0.1504708, -0.2158979, 1.476939, 0, 0.7411765, 1, 1,
0.1538624, 0.2543134, 0.9494243, 0, 0.7372549, 1, 1,
0.1583388, 1.021433, -0.7092761, 0, 0.7294118, 1, 1,
0.1599322, 2.219763, 0.7406561, 0, 0.7254902, 1, 1,
0.1603755, 0.7070183, 2.421039, 0, 0.7176471, 1, 1,
0.1655189, 0.2328906, 0.724501, 0, 0.7137255, 1, 1,
0.1670634, -0.1728251, 2.289287, 0, 0.7058824, 1, 1,
0.1724939, 1.160141, 0.1960393, 0, 0.6980392, 1, 1,
0.1740059, 3.130638, -0.1680618, 0, 0.6941177, 1, 1,
0.1803328, 1.005955, 1.218446, 0, 0.6862745, 1, 1,
0.1814328, 0.1472351, 1.131341, 0, 0.682353, 1, 1,
0.1837404, -1.946764, 3.312454, 0, 0.6745098, 1, 1,
0.1854831, -1.496289, 1.406265, 0, 0.6705883, 1, 1,
0.1861235, -0.1452206, 0.8814047, 0, 0.6627451, 1, 1,
0.1880235, 0.7471125, -2.19517, 0, 0.6588235, 1, 1,
0.1902753, -0.260642, 4.773753, 0, 0.6509804, 1, 1,
0.1929052, -1.204604, 1.898917, 0, 0.6470588, 1, 1,
0.1976829, 0.8852372, -1.383478, 0, 0.6392157, 1, 1,
0.1981689, 0.02601604, 1.156215, 0, 0.6352941, 1, 1,
0.199607, -0.6328275, 2.386943, 0, 0.627451, 1, 1,
0.2007668, -1.158811, 1.871377, 0, 0.6235294, 1, 1,
0.2100133, -1.20176, 2.957496, 0, 0.6156863, 1, 1,
0.2113278, 1.089494, 1.13598, 0, 0.6117647, 1, 1,
0.2204297, 1.699386, 2.685377, 0, 0.6039216, 1, 1,
0.2236922, 0.7443376, -0.177175, 0, 0.5960785, 1, 1,
0.2259021, -0.3009366, 3.392362, 0, 0.5921569, 1, 1,
0.226573, 0.3089076, -0.6845844, 0, 0.5843138, 1, 1,
0.2285066, 1.387686, 0.8638439, 0, 0.5803922, 1, 1,
0.2331544, 0.4868532, 2.104775, 0, 0.572549, 1, 1,
0.2365566, 0.864117, 1.324143, 0, 0.5686275, 1, 1,
0.2381172, -0.05954634, 0.5900058, 0, 0.5607843, 1, 1,
0.2387751, 0.6983228, 1.641707, 0, 0.5568628, 1, 1,
0.2405951, 0.9503984, -0.2241265, 0, 0.5490196, 1, 1,
0.2416272, 0.5915788, -1.497061, 0, 0.5450981, 1, 1,
0.243574, -1.42563, 2.403499, 0, 0.5372549, 1, 1,
0.2441948, -1.418348, 3.18166, 0, 0.5333334, 1, 1,
0.2467581, 0.7375475, 0.7280389, 0, 0.5254902, 1, 1,
0.2477098, -0.9203707, 3.335643, 0, 0.5215687, 1, 1,
0.2510666, -0.3841908, 2.851005, 0, 0.5137255, 1, 1,
0.2529114, -0.6307279, 3.164169, 0, 0.509804, 1, 1,
0.2538222, -2.27128, 2.815888, 0, 0.5019608, 1, 1,
0.2589564, 1.393154, 0.5613208, 0, 0.4941176, 1, 1,
0.2608787, -0.7415377, 3.297246, 0, 0.4901961, 1, 1,
0.262345, -0.2140592, 1.226191, 0, 0.4823529, 1, 1,
0.2636789, -0.2150239, 1.173484, 0, 0.4784314, 1, 1,
0.2639116, -1.474737, 2.835023, 0, 0.4705882, 1, 1,
0.264461, -1.758119, 3.284609, 0, 0.4666667, 1, 1,
0.2655374, 0.7737116, 1.739873, 0, 0.4588235, 1, 1,
0.2689853, 2.758883, 1.103285, 0, 0.454902, 1, 1,
0.269538, -0.4751026, 1.785309, 0, 0.4470588, 1, 1,
0.2715674, -0.376973, 2.102136, 0, 0.4431373, 1, 1,
0.2728373, 0.160474, -0.3583283, 0, 0.4352941, 1, 1,
0.2747998, -1.322852, 3.107116, 0, 0.4313726, 1, 1,
0.2749675, 1.85572, 0.6651052, 0, 0.4235294, 1, 1,
0.2761723, -0.2367985, 4.058997, 0, 0.4196078, 1, 1,
0.2766525, -0.4792189, 1.648421, 0, 0.4117647, 1, 1,
0.2797795, 0.03782787, 1.129982, 0, 0.4078431, 1, 1,
0.2857772, 1.593737, -0.6049773, 0, 0.4, 1, 1,
0.2901611, 1.884932, 1.245286, 0, 0.3921569, 1, 1,
0.2932273, 0.1115036, 0.5066199, 0, 0.3882353, 1, 1,
0.2938983, -1.141868, 4.517909, 0, 0.3803922, 1, 1,
0.2966564, -1.53963, 2.213437, 0, 0.3764706, 1, 1,
0.3089955, 0.529322, 1.159583, 0, 0.3686275, 1, 1,
0.3120288, -1.569734, 2.78628, 0, 0.3647059, 1, 1,
0.3133109, 0.1312737, 1.57691, 0, 0.3568628, 1, 1,
0.3143482, -1.64788, 3.006272, 0, 0.3529412, 1, 1,
0.3202401, -0.5734221, 4.915004, 0, 0.345098, 1, 1,
0.3214177, -0.01105832, 2.031661, 0, 0.3411765, 1, 1,
0.3238515, 2.333269, 0.5919951, 0, 0.3333333, 1, 1,
0.32386, -0.3252068, 3.311453, 0, 0.3294118, 1, 1,
0.324844, -0.7339981, 2.188473, 0, 0.3215686, 1, 1,
0.3267685, 0.0662286, -0.3223374, 0, 0.3176471, 1, 1,
0.3330384, 0.2698531, 1.037489, 0, 0.3098039, 1, 1,
0.333424, -0.1342547, 2.472955, 0, 0.3058824, 1, 1,
0.3344375, -1.028377, 2.408467, 0, 0.2980392, 1, 1,
0.3375102, -0.3820736, 3.505216, 0, 0.2901961, 1, 1,
0.3375683, -1.579094, 2.741054, 0, 0.2862745, 1, 1,
0.3386298, 1.850126, 0.7610372, 0, 0.2784314, 1, 1,
0.3409003, -0.9668413, 2.541754, 0, 0.2745098, 1, 1,
0.348038, 0.3226694, 0.3127728, 0, 0.2666667, 1, 1,
0.3489817, -0.6725765, 4.176813, 0, 0.2627451, 1, 1,
0.3499287, -1.415352, 3.916061, 0, 0.254902, 1, 1,
0.3593384, 0.7037655, 1.201404, 0, 0.2509804, 1, 1,
0.3618668, -0.6851208, 3.296726, 0, 0.2431373, 1, 1,
0.362232, 0.04250319, 1.231921, 0, 0.2392157, 1, 1,
0.3728076, 0.5654778, 0.771336, 0, 0.2313726, 1, 1,
0.374676, 1.027943, 1.019575, 0, 0.227451, 1, 1,
0.3757716, 0.9693965, 1.821062, 0, 0.2196078, 1, 1,
0.3763787, 0.2201545, 1.095714, 0, 0.2156863, 1, 1,
0.3770131, -0.1961248, 1.607826, 0, 0.2078431, 1, 1,
0.3774277, 0.2570383, 1.008029, 0, 0.2039216, 1, 1,
0.3784813, -0.9695412, 4.007629, 0, 0.1960784, 1, 1,
0.3793933, -1.661618, 2.710987, 0, 0.1882353, 1, 1,
0.3822601, -0.7412415, 4.603808, 0, 0.1843137, 1, 1,
0.3840476, -2.374612, 3.206249, 0, 0.1764706, 1, 1,
0.3870051, 0.9133549, 0.1118212, 0, 0.172549, 1, 1,
0.3894101, 1.228361, 0.9825031, 0, 0.1647059, 1, 1,
0.3909671, -1.410799, 3.493016, 0, 0.1607843, 1, 1,
0.3919183, -0.5895461, 2.350149, 0, 0.1529412, 1, 1,
0.3921587, 0.6043386, 1.773327, 0, 0.1490196, 1, 1,
0.3924454, 1.470136, 0.09826232, 0, 0.1411765, 1, 1,
0.3928854, -1.050767, 0.6387849, 0, 0.1372549, 1, 1,
0.3996167, 1.20891, -0.0956957, 0, 0.1294118, 1, 1,
0.4004909, 0.591669, 3.036293, 0, 0.1254902, 1, 1,
0.402738, -1.134006, 2.227581, 0, 0.1176471, 1, 1,
0.4053637, 0.05199577, 1.76616, 0, 0.1137255, 1, 1,
0.4089329, 1.263091, 1.075426, 0, 0.1058824, 1, 1,
0.4093221, 0.371097, 0.02130466, 0, 0.09803922, 1, 1,
0.4120649, 0.4111641, 3.027186, 0, 0.09411765, 1, 1,
0.4139073, 0.3575564, -0.07459085, 0, 0.08627451, 1, 1,
0.414272, -2.383162, 3.233534, 0, 0.08235294, 1, 1,
0.4167078, 1.534121, 2.126521, 0, 0.07450981, 1, 1,
0.417771, 0.1527779, -0.7916061, 0, 0.07058824, 1, 1,
0.4196163, -1.190539, 2.403501, 0, 0.0627451, 1, 1,
0.4213558, -0.4380879, 3.766598, 0, 0.05882353, 1, 1,
0.4286419, -1.221488, 1.078261, 0, 0.05098039, 1, 1,
0.4292161, 0.8532571, -0.08693529, 0, 0.04705882, 1, 1,
0.4293217, -2.629042, 3.193139, 0, 0.03921569, 1, 1,
0.4302872, -1.055238, 2.617116, 0, 0.03529412, 1, 1,
0.4320179, -1.109259, 3.336563, 0, 0.02745098, 1, 1,
0.432777, 0.4442312, 1.344407, 0, 0.02352941, 1, 1,
0.4348117, -0.5106386, 1.255879, 0, 0.01568628, 1, 1,
0.4374345, 0.7503937, -0.4018348, 0, 0.01176471, 1, 1,
0.4374394, 1.343563, -0.2650176, 0, 0.003921569, 1, 1,
0.4404745, -0.1414717, 1.578859, 0.003921569, 0, 1, 1,
0.4437857, -0.5754698, 2.783594, 0.007843138, 0, 1, 1,
0.4468963, 0.565369, -1.727675, 0.01568628, 0, 1, 1,
0.451126, -0.932417, 3.580393, 0.01960784, 0, 1, 1,
0.4552979, 0.4743084, 0.006920086, 0.02745098, 0, 1, 1,
0.4709385, -1.315425, 1.114588, 0.03137255, 0, 1, 1,
0.4758592, 0.9639294, 0.5163403, 0.03921569, 0, 1, 1,
0.4814604, -1.675058, 2.202361, 0.04313726, 0, 1, 1,
0.48396, 0.5363394, 0.5622668, 0.05098039, 0, 1, 1,
0.4865538, 0.5697996, 1.492963, 0.05490196, 0, 1, 1,
0.4900908, -1.319474, 4.001362, 0.0627451, 0, 1, 1,
0.4901567, 0.3161793, 2.226708, 0.06666667, 0, 1, 1,
0.4944077, -0.4448415, 3.044882, 0.07450981, 0, 1, 1,
0.4970702, -0.4422752, 1.179353, 0.07843138, 0, 1, 1,
0.4986552, 2.789288, -0.7729558, 0.08627451, 0, 1, 1,
0.5049977, -0.2015936, 1.003663, 0.09019608, 0, 1, 1,
0.508172, -0.099719, 1.047611, 0.09803922, 0, 1, 1,
0.5121029, 0.8526906, 0.7858288, 0.1058824, 0, 1, 1,
0.5167128, 1.788173, 0.6599965, 0.1098039, 0, 1, 1,
0.5175329, 0.210337, 1.21967, 0.1176471, 0, 1, 1,
0.5197245, 0.5315718, 0.4980534, 0.1215686, 0, 1, 1,
0.5258288, 0.005212518, 0.4774671, 0.1294118, 0, 1, 1,
0.5275537, 0.57197, 1.448164, 0.1333333, 0, 1, 1,
0.5314261, -0.9450111, 3.453965, 0.1411765, 0, 1, 1,
0.5318338, 1.756159, 0.8790229, 0.145098, 0, 1, 1,
0.5376454, -1.836214, 3.472897, 0.1529412, 0, 1, 1,
0.538486, 2.368655, 0.5488578, 0.1568628, 0, 1, 1,
0.5409055, 0.4333719, -1.026427, 0.1647059, 0, 1, 1,
0.5411149, 1.40274, -0.1472237, 0.1686275, 0, 1, 1,
0.5459424, -0.6248415, 0.6275414, 0.1764706, 0, 1, 1,
0.5471008, 0.9873399, -0.7006712, 0.1803922, 0, 1, 1,
0.5476108, -0.4435562, 1.810242, 0.1882353, 0, 1, 1,
0.5476948, 1.159769, 0.7292137, 0.1921569, 0, 1, 1,
0.5576202, 0.881719, 0.9362161, 0.2, 0, 1, 1,
0.5586274, -1.847905, 2.67449, 0.2078431, 0, 1, 1,
0.5601584, -0.6490152, 3.160374, 0.2117647, 0, 1, 1,
0.562574, -1.817022, 2.863631, 0.2196078, 0, 1, 1,
0.5628417, 0.9210332, -0.7309127, 0.2235294, 0, 1, 1,
0.5646352, 0.0248376, 3.136565, 0.2313726, 0, 1, 1,
0.5741484, 1.028914, -0.06021198, 0.2352941, 0, 1, 1,
0.5775967, -0.09461719, 2.597225, 0.2431373, 0, 1, 1,
0.5808738, -1.066714, 1.262492, 0.2470588, 0, 1, 1,
0.582986, -0.02221457, 0.736658, 0.254902, 0, 1, 1,
0.5869209, -0.2501069, 0.07652999, 0.2588235, 0, 1, 1,
0.5869542, 0.3138634, 3.009774, 0.2666667, 0, 1, 1,
0.5887669, 0.7793609, 1.104057, 0.2705882, 0, 1, 1,
0.5891869, 0.8710967, -0.8508682, 0.2784314, 0, 1, 1,
0.5936585, -0.02011307, 0.9396338, 0.282353, 0, 1, 1,
0.5957611, -2.213572, 2.431221, 0.2901961, 0, 1, 1,
0.5959355, -1.110054, 2.498336, 0.2941177, 0, 1, 1,
0.5966513, 0.684421, -0.7872291, 0.3019608, 0, 1, 1,
0.6092134, 1.022732, 1.592925, 0.3098039, 0, 1, 1,
0.6120793, 1.004501, -0.1455736, 0.3137255, 0, 1, 1,
0.6134857, -0.8769224, 2.41554, 0.3215686, 0, 1, 1,
0.6157315, -0.4483998, 1.597389, 0.3254902, 0, 1, 1,
0.6223729, 0.2423686, 2.281783, 0.3333333, 0, 1, 1,
0.6227534, -0.6833127, 1.632552, 0.3372549, 0, 1, 1,
0.6263636, -0.4165329, 2.829404, 0.345098, 0, 1, 1,
0.627642, 0.4392396, 0.06498498, 0.3490196, 0, 1, 1,
0.6289614, -0.9870445, 2.888668, 0.3568628, 0, 1, 1,
0.6351876, -0.1621451, -0.1678558, 0.3607843, 0, 1, 1,
0.6362469, -1.298132, 1.614501, 0.3686275, 0, 1, 1,
0.6364864, 1.639415, -0.8569847, 0.372549, 0, 1, 1,
0.6451154, 0.610827, -0.05861969, 0.3803922, 0, 1, 1,
0.6606178, -1.38789, 2.496097, 0.3843137, 0, 1, 1,
0.6633744, -1.231773, 3.0419, 0.3921569, 0, 1, 1,
0.6647869, 0.7095318, -1.010576, 0.3960784, 0, 1, 1,
0.6703679, 1.388242, -0.2187476, 0.4039216, 0, 1, 1,
0.6706085, 0.9217925, 0.1696873, 0.4117647, 0, 1, 1,
0.6712046, 0.09512904, 1.133736, 0.4156863, 0, 1, 1,
0.6739978, -0.9606184, 2.538412, 0.4235294, 0, 1, 1,
0.6750012, -1.341842, 1.542729, 0.427451, 0, 1, 1,
0.6754209, 0.4900862, 2.77033, 0.4352941, 0, 1, 1,
0.676174, -0.2139111, -0.7574672, 0.4392157, 0, 1, 1,
0.6779036, -1.595179, 2.240647, 0.4470588, 0, 1, 1,
0.680034, -0.2284068, 2.132683, 0.4509804, 0, 1, 1,
0.6804755, -2.038371, 1.793036, 0.4588235, 0, 1, 1,
0.6814336, -0.7349626, 1.267264, 0.4627451, 0, 1, 1,
0.6852752, 0.4847752, 2.849253, 0.4705882, 0, 1, 1,
0.6878107, 0.3059147, 0.4308729, 0.4745098, 0, 1, 1,
0.6943297, 1.155288, 2.145895, 0.4823529, 0, 1, 1,
0.7056649, -0.6222653, 2.685785, 0.4862745, 0, 1, 1,
0.7082489, -0.08339311, -0.1201021, 0.4941176, 0, 1, 1,
0.7093081, -1.485776, 3.788362, 0.5019608, 0, 1, 1,
0.7129116, 0.1411508, 0.4736384, 0.5058824, 0, 1, 1,
0.7144918, 3.072568, 0.671886, 0.5137255, 0, 1, 1,
0.7165982, -0.2413421, 2.279333, 0.5176471, 0, 1, 1,
0.7176384, -0.2140702, 2.368586, 0.5254902, 0, 1, 1,
0.7229114, -0.737814, 0.8308801, 0.5294118, 0, 1, 1,
0.7303113, -0.5848389, 3.183761, 0.5372549, 0, 1, 1,
0.7378734, 0.8793823, 2.569667, 0.5411765, 0, 1, 1,
0.7413989, 0.3577606, 3.888479, 0.5490196, 0, 1, 1,
0.742761, -0.6497188, 1.825386, 0.5529412, 0, 1, 1,
0.7466115, -1.053286, 2.476177, 0.5607843, 0, 1, 1,
0.74833, 0.6589832, 1.815645, 0.5647059, 0, 1, 1,
0.7483701, -1.188434, 3.012469, 0.572549, 0, 1, 1,
0.7516678, -3.328008, 3.292046, 0.5764706, 0, 1, 1,
0.7517433, 0.6259037, 3.426275, 0.5843138, 0, 1, 1,
0.751914, -0.9396396, 2.988335, 0.5882353, 0, 1, 1,
0.7523936, 2.238638, 0.7142138, 0.5960785, 0, 1, 1,
0.7593396, 0.1932626, 0.6903553, 0.6039216, 0, 1, 1,
0.7647726, -0.4112339, 3.148076, 0.6078432, 0, 1, 1,
0.7665424, -0.740891, 2.44872, 0.6156863, 0, 1, 1,
0.7679871, -1.841129, 4.090351, 0.6196079, 0, 1, 1,
0.7692505, 0.157879, 1.367216, 0.627451, 0, 1, 1,
0.7743167, -0.3318165, 1.156011, 0.6313726, 0, 1, 1,
0.7758137, -1.554177, 3.68243, 0.6392157, 0, 1, 1,
0.7776821, 0.6278332, 0.06350791, 0.6431373, 0, 1, 1,
0.779702, -0.1544065, 2.043612, 0.6509804, 0, 1, 1,
0.7809956, -1.847145, 2.971699, 0.654902, 0, 1, 1,
0.7885085, -2.319431, 2.708571, 0.6627451, 0, 1, 1,
0.7889801, 1.631921, 0.07767329, 0.6666667, 0, 1, 1,
0.7929937, 0.01644248, 0.727973, 0.6745098, 0, 1, 1,
0.7954947, -0.6568577, 3.256032, 0.6784314, 0, 1, 1,
0.8058298, 1.993839, -1.070508, 0.6862745, 0, 1, 1,
0.8058851, 0.5260261, 0.8864667, 0.6901961, 0, 1, 1,
0.8068963, -0.8979646, 1.463824, 0.6980392, 0, 1, 1,
0.8138773, -0.7461181, 1.125351, 0.7058824, 0, 1, 1,
0.8143679, 0.9024271, 1.817509, 0.7098039, 0, 1, 1,
0.8152288, 0.9987555, 0.3263908, 0.7176471, 0, 1, 1,
0.8169649, 0.5263359, 0.6438487, 0.7215686, 0, 1, 1,
0.8201022, -0.5026435, 3.384383, 0.7294118, 0, 1, 1,
0.8446661, -0.1253299, 3.142171, 0.7333333, 0, 1, 1,
0.8447278, 0.4614486, 1.596124, 0.7411765, 0, 1, 1,
0.8450215, 2.385473, 0.9490672, 0.7450981, 0, 1, 1,
0.8461178, -0.2558583, 2.200643, 0.7529412, 0, 1, 1,
0.8486551, -0.2375708, 1.545116, 0.7568628, 0, 1, 1,
0.8534885, -1.079152, 2.050713, 0.7647059, 0, 1, 1,
0.8591961, -0.1540156, 2.60869, 0.7686275, 0, 1, 1,
0.8601912, -2.066481, 2.302538, 0.7764706, 0, 1, 1,
0.8612803, -1.01643, 3.507058, 0.7803922, 0, 1, 1,
0.8649207, 0.159284, 2.118268, 0.7882353, 0, 1, 1,
0.8654007, -0.1454679, 0.1894444, 0.7921569, 0, 1, 1,
0.867011, -1.476493, 4.228016, 0.8, 0, 1, 1,
0.8680164, -0.3428082, 3.379834, 0.8078431, 0, 1, 1,
0.8682531, -0.7668483, 2.230926, 0.8117647, 0, 1, 1,
0.8684498, 1.224323, 1.895854, 0.8196079, 0, 1, 1,
0.8688875, -0.8807415, 4.20033, 0.8235294, 0, 1, 1,
0.8855651, 0.6065617, -0.3657404, 0.8313726, 0, 1, 1,
0.8856942, -1.341673, 1.934209, 0.8352941, 0, 1, 1,
0.8860819, 0.7626234, 2.775655, 0.8431373, 0, 1, 1,
0.8934115, 0.3598038, 2.22375, 0.8470588, 0, 1, 1,
0.901253, -2.534199, 3.203649, 0.854902, 0, 1, 1,
0.9012854, 0.08908045, 0.6047445, 0.8588235, 0, 1, 1,
0.9027824, -0.9206082, 2.215663, 0.8666667, 0, 1, 1,
0.9049662, 1.046662, -0.004625111, 0.8705882, 0, 1, 1,
0.9056916, 1.086675, 0.6022923, 0.8784314, 0, 1, 1,
0.9093415, 1.013638, 0.6114615, 0.8823529, 0, 1, 1,
0.9103213, 1.348861, 0.5529503, 0.8901961, 0, 1, 1,
0.9109854, 1.568391, -0.5149537, 0.8941177, 0, 1, 1,
0.9127062, -1.092225, 2.314671, 0.9019608, 0, 1, 1,
0.9140432, -0.163962, 1.558205, 0.9098039, 0, 1, 1,
0.9194217, 0.5695827, 1.949333, 0.9137255, 0, 1, 1,
0.9212766, -0.06220074, 0.123, 0.9215686, 0, 1, 1,
0.9373236, -0.3291165, 0.5835128, 0.9254902, 0, 1, 1,
0.9431, -0.1651579, 2.932421, 0.9333333, 0, 1, 1,
0.9437763, -1.47259, 2.428561, 0.9372549, 0, 1, 1,
0.9458468, -0.8321559, 0.2832569, 0.945098, 0, 1, 1,
0.9509604, -0.5892224, 2.517547, 0.9490196, 0, 1, 1,
0.9517262, -0.4679685, 1.466871, 0.9568627, 0, 1, 1,
0.9580018, -0.1092371, 2.88958, 0.9607843, 0, 1, 1,
0.9657788, 0.9838789, 2.00193, 0.9686275, 0, 1, 1,
0.9670169, -0.5862518, 1.966213, 0.972549, 0, 1, 1,
0.9672291, 0.7004682, 2.99242, 0.9803922, 0, 1, 1,
0.9793725, 0.6820637, -1.325533, 0.9843137, 0, 1, 1,
0.9859683, -0.5029512, 0.4938296, 0.9921569, 0, 1, 1,
0.9938279, -0.01451461, 0.3949864, 0.9960784, 0, 1, 1,
0.9965942, -0.05195209, 1.673683, 1, 0, 0.9960784, 1,
1.009923, 0.2407726, 1.718864, 1, 0, 0.9882353, 1,
1.025361, 1.297884, 0.357414, 1, 0, 0.9843137, 1,
1.027132, 0.5167673, 0.1093777, 1, 0, 0.9764706, 1,
1.04051, 0.2775255, 2.062383, 1, 0, 0.972549, 1,
1.040814, -0.9878702, 2.120619, 1, 0, 0.9647059, 1,
1.042232, 0.1475961, 1.060495, 1, 0, 0.9607843, 1,
1.044926, 0.8395883, 0.06881454, 1, 0, 0.9529412, 1,
1.051715, 0.1680886, 0.792881, 1, 0, 0.9490196, 1,
1.053672, -0.5357357, 2.340688, 1, 0, 0.9411765, 1,
1.058876, 0.2253595, 1.662432, 1, 0, 0.9372549, 1,
1.061354, -0.04732769, 0.06175219, 1, 0, 0.9294118, 1,
1.070577, -1.094585, 2.484195, 1, 0, 0.9254902, 1,
1.073702, 0.77905, 1.327355, 1, 0, 0.9176471, 1,
1.075938, -0.7629919, 2.688781, 1, 0, 0.9137255, 1,
1.076086, -0.009086716, 1.509006, 1, 0, 0.9058824, 1,
1.07747, 1.170504, 0.4665059, 1, 0, 0.9019608, 1,
1.078195, 0.6265441, 2.450294, 1, 0, 0.8941177, 1,
1.081012, -2.282649, 4.016937, 1, 0, 0.8862745, 1,
1.081568, 2.674037, -0.1096722, 1, 0, 0.8823529, 1,
1.08949, 1.403405, 1.274346, 1, 0, 0.8745098, 1,
1.092884, -1.137617, 3.7103, 1, 0, 0.8705882, 1,
1.09695, 1.245309, 2.260121, 1, 0, 0.8627451, 1,
1.09714, -1.058543, 4.393229, 1, 0, 0.8588235, 1,
1.105728, 0.5012885, 2.079162, 1, 0, 0.8509804, 1,
1.106534, -0.6555811, 1.790623, 1, 0, 0.8470588, 1,
1.119887, 0.2188307, 2.029914, 1, 0, 0.8392157, 1,
1.122813, 0.8378499, 0.454241, 1, 0, 0.8352941, 1,
1.124566, 0.5487621, 0.2188623, 1, 0, 0.827451, 1,
1.127976, -0.339077, 2.926901, 1, 0, 0.8235294, 1,
1.128939, 0.4869075, 0.04117182, 1, 0, 0.8156863, 1,
1.130536, -0.7992652, 2.936633, 1, 0, 0.8117647, 1,
1.132544, -0.9587276, 2.901814, 1, 0, 0.8039216, 1,
1.133907, 0.04380895, 0.7892603, 1, 0, 0.7960784, 1,
1.139359, 1.2122, 0.1820616, 1, 0, 0.7921569, 1,
1.140389, -1.924393, 1.606329, 1, 0, 0.7843137, 1,
1.149148, -0.5455143, 2.588587, 1, 0, 0.7803922, 1,
1.149454, -1.511201, 2.426647, 1, 0, 0.772549, 1,
1.15264, 1.021362, 0.547504, 1, 0, 0.7686275, 1,
1.153679, 0.5358294, 2.116205, 1, 0, 0.7607843, 1,
1.159023, -0.4416924, 2.732863, 1, 0, 0.7568628, 1,
1.162487, 1.377601, 0.4425651, 1, 0, 0.7490196, 1,
1.162996, -0.8323502, 2.584326, 1, 0, 0.7450981, 1,
1.170371, 0.8765963, 1.93036, 1, 0, 0.7372549, 1,
1.18899, -0.5080745, 1.176723, 1, 0, 0.7333333, 1,
1.190818, 1.498346, 0.3675236, 1, 0, 0.7254902, 1,
1.200843, -1.293144, 1.186818, 1, 0, 0.7215686, 1,
1.205211, 0.8282297, 0.5497012, 1, 0, 0.7137255, 1,
1.205344, 2.307936, 0.3995673, 1, 0, 0.7098039, 1,
1.208399, 1.370972, 2.111984, 1, 0, 0.7019608, 1,
1.231677, 0.1564412, 3.889557, 1, 0, 0.6941177, 1,
1.236454, 0.09331861, 1.073431, 1, 0, 0.6901961, 1,
1.244895, 0.04812957, 2.977479, 1, 0, 0.682353, 1,
1.245927, 0.3114731, 0.5744428, 1, 0, 0.6784314, 1,
1.245945, 0.03991585, 0.6606035, 1, 0, 0.6705883, 1,
1.265273, -0.1754336, 1.610774, 1, 0, 0.6666667, 1,
1.277715, 0.2537277, 2.778022, 1, 0, 0.6588235, 1,
1.279819, 0.4805772, 0.5071083, 1, 0, 0.654902, 1,
1.288392, -1.890419, 3.161192, 1, 0, 0.6470588, 1,
1.302955, -1.260924, 1.561983, 1, 0, 0.6431373, 1,
1.303023, -0.1193097, 0.1449512, 1, 0, 0.6352941, 1,
1.306397, 0.04259249, 1.579954, 1, 0, 0.6313726, 1,
1.314329, 1.321734, 1.472067, 1, 0, 0.6235294, 1,
1.315906, 0.01304961, 1.662333, 1, 0, 0.6196079, 1,
1.323188, 0.3991877, 0.6152525, 1, 0, 0.6117647, 1,
1.324374, 0.977267, 0.9681072, 1, 0, 0.6078432, 1,
1.355627, 2.147811, 0.2638285, 1, 0, 0.6, 1,
1.360754, 1.248721, 0.07100096, 1, 0, 0.5921569, 1,
1.36777, 0.2849354, 1.409212, 1, 0, 0.5882353, 1,
1.374632, 0.1656331, 1.56283, 1, 0, 0.5803922, 1,
1.374899, 0.1599148, 1.948256, 1, 0, 0.5764706, 1,
1.383976, 0.9492457, -0.4335516, 1, 0, 0.5686275, 1,
1.392992, 0.3782356, 1.841023, 1, 0, 0.5647059, 1,
1.400287, 0.7504873, 1.469269, 1, 0, 0.5568628, 1,
1.403194, -0.3260829, 2.623572, 1, 0, 0.5529412, 1,
1.412858, -1.687051, 1.609557, 1, 0, 0.5450981, 1,
1.415027, -0.7318692, 2.15325, 1, 0, 0.5411765, 1,
1.439669, -0.1211705, 0.8338581, 1, 0, 0.5333334, 1,
1.444534, -0.7129329, 1.984267, 1, 0, 0.5294118, 1,
1.446755, -0.1227671, 2.847701, 1, 0, 0.5215687, 1,
1.447852, 0.5770113, 2.128269, 1, 0, 0.5176471, 1,
1.465071, 0.5489572, 3.58389, 1, 0, 0.509804, 1,
1.476182, 0.1717611, 2.413829, 1, 0, 0.5058824, 1,
1.483089, 1.385897, 1.474131, 1, 0, 0.4980392, 1,
1.487637, 0.06833218, 2.55828, 1, 0, 0.4901961, 1,
1.497833, -0.6278694, 1.08956, 1, 0, 0.4862745, 1,
1.50317, 1.634022, 0.3795736, 1, 0, 0.4784314, 1,
1.507496, 0.2297649, 0.5470163, 1, 0, 0.4745098, 1,
1.513391, -0.6317483, 3.874899, 1, 0, 0.4666667, 1,
1.516216, 0.2295945, 0.6785997, 1, 0, 0.4627451, 1,
1.519186, 0.1832497, 0.8899002, 1, 0, 0.454902, 1,
1.526355, 0.758509, 1.690822, 1, 0, 0.4509804, 1,
1.532442, 0.2187141, 2.526178, 1, 0, 0.4431373, 1,
1.538263, -0.05510122, -1.328935, 1, 0, 0.4392157, 1,
1.539519, 0.3234271, 2.139208, 1, 0, 0.4313726, 1,
1.54476, 0.007582327, 0.4927782, 1, 0, 0.427451, 1,
1.548569, 1.159059, 0.4199088, 1, 0, 0.4196078, 1,
1.552501, 0.5296183, 2.43565, 1, 0, 0.4156863, 1,
1.568098, 0.7589415, -1.393365, 1, 0, 0.4078431, 1,
1.568294, -1.258241, 1.938157, 1, 0, 0.4039216, 1,
1.573837, 1.333592, -0.1362353, 1, 0, 0.3960784, 1,
1.578491, 0.880878, 0.07043783, 1, 0, 0.3882353, 1,
1.582447, 0.980331, -0.2402346, 1, 0, 0.3843137, 1,
1.607658, -2.202612, 2.496163, 1, 0, 0.3764706, 1,
1.611338, -0.5649464, 1.272603, 1, 0, 0.372549, 1,
1.618365, -1.218246, 1.547164, 1, 0, 0.3647059, 1,
1.62234, -0.09388707, 1.805219, 1, 0, 0.3607843, 1,
1.633066, 0.5066337, 0.5141705, 1, 0, 0.3529412, 1,
1.656665, -0.06208611, 2.412878, 1, 0, 0.3490196, 1,
1.662511, -0.4733736, 3.167415, 1, 0, 0.3411765, 1,
1.687926, 0.8821386, 2.568757, 1, 0, 0.3372549, 1,
1.695343, 1.179851, 1.691524, 1, 0, 0.3294118, 1,
1.69775, -1.621926, 3.252142, 1, 0, 0.3254902, 1,
1.707005, 0.4700243, 2.60077, 1, 0, 0.3176471, 1,
1.712528, -0.3707572, 2.779874, 1, 0, 0.3137255, 1,
1.713218, 0.6014, 0.3353111, 1, 0, 0.3058824, 1,
1.716172, 0.4379635, 1.084665, 1, 0, 0.2980392, 1,
1.733042, 1.216111, 3.213042, 1, 0, 0.2941177, 1,
1.739178, -2.007676, 2.629997, 1, 0, 0.2862745, 1,
1.745775, -0.4594172, 0.01922155, 1, 0, 0.282353, 1,
1.752144, 2.936179, 0.1535521, 1, 0, 0.2745098, 1,
1.753363, 1.132989, 2.107386, 1, 0, 0.2705882, 1,
1.754347, -0.3957187, 1.031531, 1, 0, 0.2627451, 1,
1.759721, -0.7669928, 2.084888, 1, 0, 0.2588235, 1,
1.770575, -0.01057348, 2.661953, 1, 0, 0.2509804, 1,
1.775194, 0.8414671, 2.314294, 1, 0, 0.2470588, 1,
1.785957, -0.6767682, 2.301146, 1, 0, 0.2392157, 1,
1.806682, 1.995601, 1.122824, 1, 0, 0.2352941, 1,
1.818409, -0.1789248, 1.901495, 1, 0, 0.227451, 1,
1.846647, -0.7164187, 0.6331224, 1, 0, 0.2235294, 1,
1.853139, -0.406366, 0.3343252, 1, 0, 0.2156863, 1,
1.858052, -0.6163633, 4.251616, 1, 0, 0.2117647, 1,
1.858762, 1.030005, 0.7479575, 1, 0, 0.2039216, 1,
1.872698, -0.2783055, -0.5615146, 1, 0, 0.1960784, 1,
1.889643, -0.5170671, 1.230734, 1, 0, 0.1921569, 1,
1.898191, -0.6766801, 1.202193, 1, 0, 0.1843137, 1,
1.912853, 0.3619675, 0.803136, 1, 0, 0.1803922, 1,
1.927656, 0.6894271, 0.2844135, 1, 0, 0.172549, 1,
1.928047, 1.386495, 0.9074067, 1, 0, 0.1686275, 1,
1.935606, -1.125839, 1.966026, 1, 0, 0.1607843, 1,
1.987568, 0.2115324, 1.128719, 1, 0, 0.1568628, 1,
1.997478, -0.4181516, 1.627047, 1, 0, 0.1490196, 1,
2.037191, -2.712917, 2.838207, 1, 0, 0.145098, 1,
2.039746, 0.5470064, 2.661916, 1, 0, 0.1372549, 1,
2.045986, 0.1484722, 1.507989, 1, 0, 0.1333333, 1,
2.054565, 1.20783, 1.578388, 1, 0, 0.1254902, 1,
2.069101, 0.9183044, 0.1427281, 1, 0, 0.1215686, 1,
2.083399, 0.09112021, 3.101318, 1, 0, 0.1137255, 1,
2.09389, 1.252993, 2.605265, 1, 0, 0.1098039, 1,
2.104053, 0.6901181, 1.762953, 1, 0, 0.1019608, 1,
2.126021, -0.801304, 0.9857955, 1, 0, 0.09411765, 1,
2.129957, 0.4470499, 2.236217, 1, 0, 0.09019608, 1,
2.156528, 1.237369, 2.38343, 1, 0, 0.08235294, 1,
2.17347, 0.723311, 3.418292, 1, 0, 0.07843138, 1,
2.180428, -0.03098842, 1.50266, 1, 0, 0.07058824, 1,
2.213499, -1.45587, 2.384207, 1, 0, 0.06666667, 1,
2.30625, -0.5929483, 1.973795, 1, 0, 0.05882353, 1,
2.325706, 0.7756305, -0.2899858, 1, 0, 0.05490196, 1,
2.377943, 1.17044, 1.966847, 1, 0, 0.04705882, 1,
2.400212, -0.8092556, 2.640906, 1, 0, 0.04313726, 1,
2.423769, 0.7394134, 3.316815, 1, 0, 0.03529412, 1,
2.441732, 0.5772555, 1.444541, 1, 0, 0.03137255, 1,
2.669765, -0.1987861, 2.00638, 1, 0, 0.02352941, 1,
2.677141, -0.4290454, 1.319662, 1, 0, 0.01960784, 1,
2.725921, -1.62577, 1.815327, 1, 0, 0.01176471, 1,
2.856603, -0.3558526, 2.043658, 1, 0, 0.007843138, 1
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
-0.3802102, -4.451657, -7.217162, 0, -0.5, 0.5, 0.5,
-0.3802102, -4.451657, -7.217162, 1, -0.5, 0.5, 0.5,
-0.3802102, -4.451657, -7.217162, 1, 1.5, 0.5, 0.5,
-0.3802102, -4.451657, -7.217162, 0, 1.5, 0.5, 0.5
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
-4.714303, -0.1110445, -7.217162, 0, -0.5, 0.5, 0.5,
-4.714303, -0.1110445, -7.217162, 1, -0.5, 0.5, 0.5,
-4.714303, -0.1110445, -7.217162, 1, 1.5, 0.5, 0.5,
-4.714303, -0.1110445, -7.217162, 0, 1.5, 0.5, 0.5
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
-4.714303, -4.451657, -0.2718992, 0, -0.5, 0.5, 0.5,
-4.714303, -4.451657, -0.2718992, 1, -0.5, 0.5, 0.5,
-4.714303, -4.451657, -0.2718992, 1, 1.5, 0.5, 0.5,
-4.714303, -4.451657, -0.2718992, 0, 1.5, 0.5, 0.5
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
-3, -3.449977, -5.614409,
2, -3.449977, -5.614409,
-3, -3.449977, -5.614409,
-3, -3.616924, -5.881535,
-2, -3.449977, -5.614409,
-2, -3.616924, -5.881535,
-1, -3.449977, -5.614409,
-1, -3.616924, -5.881535,
0, -3.449977, -5.614409,
0, -3.616924, -5.881535,
1, -3.449977, -5.614409,
1, -3.616924, -5.881535,
2, -3.449977, -5.614409,
2, -3.616924, -5.881535
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
-3, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
-3, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
-3, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
-3, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5,
-2, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
-2, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
-2, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
-2, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5,
-1, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
-1, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
-1, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
-1, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5,
0, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
0, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
0, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
0, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5,
1, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
1, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
1, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
1, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5,
2, -3.950817, -6.415786, 0, -0.5, 0.5, 0.5,
2, -3.950817, -6.415786, 1, -0.5, 0.5, 0.5,
2, -3.950817, -6.415786, 1, 1.5, 0.5, 0.5,
2, -3.950817, -6.415786, 0, 1.5, 0.5, 0.5
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
-3.714128, -3, -5.614409,
-3.714128, 3, -5.614409,
-3.714128, -3, -5.614409,
-3.880824, -3, -5.881535,
-3.714128, -2, -5.614409,
-3.880824, -2, -5.881535,
-3.714128, -1, -5.614409,
-3.880824, -1, -5.881535,
-3.714128, 0, -5.614409,
-3.880824, 0, -5.881535,
-3.714128, 1, -5.614409,
-3.880824, 1, -5.881535,
-3.714128, 2, -5.614409,
-3.880824, 2, -5.881535,
-3.714128, 3, -5.614409,
-3.880824, 3, -5.881535
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
-4.214215, -3, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, -3, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, -3, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, -3, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, -2, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, -2, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, -2, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, -2, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, -1, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, -1, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, -1, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, -1, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, 0, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, 0, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, 0, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, 0, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, 1, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, 1, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, 1, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, 1, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, 2, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, 2, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, 2, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, 2, -6.415786, 0, 1.5, 0.5, 0.5,
-4.214215, 3, -6.415786, 0, -0.5, 0.5, 0.5,
-4.214215, 3, -6.415786, 1, -0.5, 0.5, 0.5,
-4.214215, 3, -6.415786, 1, 1.5, 0.5, 0.5,
-4.214215, 3, -6.415786, 0, 1.5, 0.5, 0.5
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
-3.714128, -3.449977, -4,
-3.714128, -3.449977, 4,
-3.714128, -3.449977, -4,
-3.880824, -3.616924, -4,
-3.714128, -3.449977, -2,
-3.880824, -3.616924, -2,
-3.714128, -3.449977, 0,
-3.880824, -3.616924, 0,
-3.714128, -3.449977, 2,
-3.880824, -3.616924, 2,
-3.714128, -3.449977, 4,
-3.880824, -3.616924, 4
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
-4.214215, -3.950817, -4, 0, -0.5, 0.5, 0.5,
-4.214215, -3.950817, -4, 1, -0.5, 0.5, 0.5,
-4.214215, -3.950817, -4, 1, 1.5, 0.5, 0.5,
-4.214215, -3.950817, -4, 0, 1.5, 0.5, 0.5,
-4.214215, -3.950817, -2, 0, -0.5, 0.5, 0.5,
-4.214215, -3.950817, -2, 1, -0.5, 0.5, 0.5,
-4.214215, -3.950817, -2, 1, 1.5, 0.5, 0.5,
-4.214215, -3.950817, -2, 0, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 0, 0, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 0, 1, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 0, 1, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 0, 0, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 2, 0, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 2, 1, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 2, 1, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 2, 0, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 4, 0, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 4, 1, -0.5, 0.5, 0.5,
-4.214215, -3.950817, 4, 1, 1.5, 0.5, 0.5,
-4.214215, -3.950817, 4, 0, 1.5, 0.5, 0.5
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
-3.714128, -3.449977, -5.614409,
-3.714128, 3.227888, -5.614409,
-3.714128, -3.449977, 5.070611,
-3.714128, 3.227888, 5.070611,
-3.714128, -3.449977, -5.614409,
-3.714128, -3.449977, 5.070611,
-3.714128, 3.227888, -5.614409,
-3.714128, 3.227888, 5.070611,
-3.714128, -3.449977, -5.614409,
2.953707, -3.449977, -5.614409,
-3.714128, -3.449977, 5.070611,
2.953707, -3.449977, 5.070611,
-3.714128, 3.227888, -5.614409,
2.953707, 3.227888, -5.614409,
-3.714128, 3.227888, 5.070611,
2.953707, 3.227888, 5.070611,
2.953707, -3.449977, -5.614409,
2.953707, 3.227888, -5.614409,
2.953707, -3.449977, 5.070611,
2.953707, 3.227888, 5.070611,
2.953707, -3.449977, -5.614409,
2.953707, -3.449977, 5.070611,
2.953707, 3.227888, -5.614409,
2.953707, 3.227888, 5.070611
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
var radius = 7.61224;
var distance = 33.86771;
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
mvMatrix.translate( 0.3802102, 0.1110445, 0.2718992 );
mvMatrix.scale( 1.234359, 1.232505, 0.7702843 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86771);
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
oxolinic_acid_dioxam<-read.table("oxolinic_acid_dioxam.xyz", skip=1)
```

```
## Error in read.table("oxolinic_acid_dioxam.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-oxolinic_acid_dioxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_dioxam' not found
```

```r
y<-oxolinic_acid_dioxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_dioxam' not found
```

```r
z<-oxolinic_acid_dioxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_dioxam' not found
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
-3.617023, -1.47677, -2.34382, 0, 0, 1, 1, 1,
-3.511889, 0.5340114, -2.049956, 1, 0, 0, 1, 1,
-3.293625, 1.544072, -1.606111, 1, 0, 0, 1, 1,
-3.240903, -0.9765442, -1.807112, 1, 0, 0, 1, 1,
-3.159699, -1.544079, -2.172782, 1, 0, 0, 1, 1,
-2.896079, 0.04999778, 0.6019512, 1, 0, 0, 1, 1,
-2.781586, -0.8705051, -2.117271, 0, 0, 0, 1, 1,
-2.639072, -1.038178, -2.139407, 0, 0, 0, 1, 1,
-2.593598, 0.2835227, -2.524439, 0, 0, 0, 1, 1,
-2.592207, 0.7685349, -0.662343, 0, 0, 0, 1, 1,
-2.590664, -1.987356, -2.878883, 0, 0, 0, 1, 1,
-2.551025, -1.753807, -0.7462034, 0, 0, 0, 1, 1,
-2.479969, 0.2476293, -1.124407, 0, 0, 0, 1, 1,
-2.456552, -1.327661, -2.284111, 1, 1, 1, 1, 1,
-2.360886, -0.8514835, -1.532854, 1, 1, 1, 1, 1,
-2.315064, 1.144136, -0.3641811, 1, 1, 1, 1, 1,
-2.278092, 0.98111, 0.3553974, 1, 1, 1, 1, 1,
-2.252843, -0.2267686, -0.5059849, 1, 1, 1, 1, 1,
-2.237304, 0.1304243, -1.167233, 1, 1, 1, 1, 1,
-2.235769, -0.4931523, -2.522422, 1, 1, 1, 1, 1,
-2.218617, -1.161333, -1.275882, 1, 1, 1, 1, 1,
-2.204188, -2.058461, -0.9073609, 1, 1, 1, 1, 1,
-2.190969, -0.4350461, -2.807199, 1, 1, 1, 1, 1,
-2.121096, 0.2115545, -2.032588, 1, 1, 1, 1, 1,
-2.077196, 0.1944316, -1.753257, 1, 1, 1, 1, 1,
-2.067367, -1.604976, -3.509959, 1, 1, 1, 1, 1,
-2.051977, -0.3506719, 0.07121184, 1, 1, 1, 1, 1,
-2.035172, 0.1765659, -1.508927, 1, 1, 1, 1, 1,
-2.032131, -2.292053, -2.569493, 0, 0, 1, 1, 1,
-2.001978, -0.152703, -1.266886, 1, 0, 0, 1, 1,
-1.97784, 0.05863682, -2.106056, 1, 0, 0, 1, 1,
-1.969809, 1.824636, -0.03194805, 1, 0, 0, 1, 1,
-1.9193, 0.09247235, -1.228857, 1, 0, 0, 1, 1,
-1.893888, 0.6925989, -2.120119, 1, 0, 0, 1, 1,
-1.877611, 0.2363704, -3.89593, 0, 0, 0, 1, 1,
-1.847904, 0.8176647, -0.5000358, 0, 0, 0, 1, 1,
-1.820674, 0.7940131, -0.7973418, 0, 0, 0, 1, 1,
-1.809149, -1.322188, -3.568177, 0, 0, 0, 1, 1,
-1.796721, -0.4309811, -1.215236, 0, 0, 0, 1, 1,
-1.779131, 0.3230195, -2.658306, 0, 0, 0, 1, 1,
-1.777343, 0.9005067, -1.062837, 0, 0, 0, 1, 1,
-1.773576, 1.864506, -0.09491212, 1, 1, 1, 1, 1,
-1.767988, -0.155744, -2.054091, 1, 1, 1, 1, 1,
-1.766103, 0.0127928, -1.132226, 1, 1, 1, 1, 1,
-1.761614, 1.01739, -0.7521081, 1, 1, 1, 1, 1,
-1.733854, 0.7909372, -3.989281, 1, 1, 1, 1, 1,
-1.731609, -1.240749, -2.622072, 1, 1, 1, 1, 1,
-1.728558, 2.868514, 0.5793475, 1, 1, 1, 1, 1,
-1.718745, -0.2747975, -2.551712, 1, 1, 1, 1, 1,
-1.704624, 0.6277043, -1.81387, 1, 1, 1, 1, 1,
-1.700124, -0.8025195, -1.519443, 1, 1, 1, 1, 1,
-1.687147, -0.07056119, -2.451174, 1, 1, 1, 1, 1,
-1.631334, 0.1674264, -1.653016, 1, 1, 1, 1, 1,
-1.627352, -0.1929146, -2.365619, 1, 1, 1, 1, 1,
-1.625271, -0.2196451, -2.03069, 1, 1, 1, 1, 1,
-1.620045, 0.735408, -1.189678, 1, 1, 1, 1, 1,
-1.617227, -2.146853, -1.580143, 0, 0, 1, 1, 1,
-1.611452, 2.465363, -0.2293725, 1, 0, 0, 1, 1,
-1.609036, -0.352452, -0.6260232, 1, 0, 0, 1, 1,
-1.602207, 1.443322, -1.919389, 1, 0, 0, 1, 1,
-1.582218, 0.3042479, -0.5496608, 1, 0, 0, 1, 1,
-1.568838, 0.6451079, -1.520032, 1, 0, 0, 1, 1,
-1.567573, 0.6089096, 0.5692139, 0, 0, 0, 1, 1,
-1.565512, -0.08194718, 0.8851571, 0, 0, 0, 1, 1,
-1.556483, -0.6869578, -3.439162, 0, 0, 0, 1, 1,
-1.554986, -0.3923816, -1.471262, 0, 0, 0, 1, 1,
-1.540366, 2.553628, -2.020421, 0, 0, 0, 1, 1,
-1.53771, -0.5447805, -3.302702, 0, 0, 0, 1, 1,
-1.520016, 1.240447, -3.604577, 0, 0, 0, 1, 1,
-1.51379, -1.459909, -2.603896, 1, 1, 1, 1, 1,
-1.512883, 0.5190887, -1.070303, 1, 1, 1, 1, 1,
-1.506171, -0.1879677, -2.491612, 1, 1, 1, 1, 1,
-1.502642, 1.434639, -1.519039, 1, 1, 1, 1, 1,
-1.447854, 0.7027838, -1.637152, 1, 1, 1, 1, 1,
-1.446857, -1.465846, -2.54153, 1, 1, 1, 1, 1,
-1.43753, -0.927614, -2.997979, 1, 1, 1, 1, 1,
-1.431031, -0.8192791, -2.585943, 1, 1, 1, 1, 1,
-1.430093, 0.7190439, -2.100981, 1, 1, 1, 1, 1,
-1.426241, 0.8276096, -3.031667, 1, 1, 1, 1, 1,
-1.407888, -0.4822629, -3.59923, 1, 1, 1, 1, 1,
-1.379027, 0.9734738, -3.65321, 1, 1, 1, 1, 1,
-1.37866, -0.138911, -2.201644, 1, 1, 1, 1, 1,
-1.365344, -0.037711, -0.4302777, 1, 1, 1, 1, 1,
-1.351645, 0.9505853, -1.778545, 1, 1, 1, 1, 1,
-1.327312, -1.93398, -2.285671, 0, 0, 1, 1, 1,
-1.326764, -0.9549127, -1.027355, 1, 0, 0, 1, 1,
-1.324778, -1.080018, -1.081119, 1, 0, 0, 1, 1,
-1.32412, -0.1739544, -0.8101642, 1, 0, 0, 1, 1,
-1.323411, -1.246534, -2.908597, 1, 0, 0, 1, 1,
-1.322217, 1.08005, -2.943194, 1, 0, 0, 1, 1,
-1.309049, -0.6647106, -1.758497, 0, 0, 0, 1, 1,
-1.292811, -0.717982, -1.092698, 0, 0, 0, 1, 1,
-1.289404, -0.5710435, -2.343458, 0, 0, 0, 1, 1,
-1.287792, 1.834193, -2.512131, 0, 0, 0, 1, 1,
-1.286355, -0.1320307, -3.120634, 0, 0, 0, 1, 1,
-1.28316, -0.8463867, -5.103495, 0, 0, 0, 1, 1,
-1.267399, 1.640961, -0.9401556, 0, 0, 0, 1, 1,
-1.261438, -1.389921, -1.162261, 1, 1, 1, 1, 1,
-1.255929, -1.885836, -3.397453, 1, 1, 1, 1, 1,
-1.248641, 0.6284134, 0.1886545, 1, 1, 1, 1, 1,
-1.242475, 1.077445, -0.3622534, 1, 1, 1, 1, 1,
-1.238387, 0.7334733, -1.543434, 1, 1, 1, 1, 1,
-1.231488, -0.2131965, -1.755434, 1, 1, 1, 1, 1,
-1.226807, 0.4381282, -1.914593, 1, 1, 1, 1, 1,
-1.221659, -0.8740526, -0.717205, 1, 1, 1, 1, 1,
-1.206527, 2.459602, -0.9597986, 1, 1, 1, 1, 1,
-1.202739, -0.3830991, -3.025466, 1, 1, 1, 1, 1,
-1.197396, 1.519793, 1.170084, 1, 1, 1, 1, 1,
-1.187833, -1.18842, -1.325913, 1, 1, 1, 1, 1,
-1.172813, -0.0253149, -0.2288446, 1, 1, 1, 1, 1,
-1.162539, 0.5910701, -0.9863738, 1, 1, 1, 1, 1,
-1.162523, -0.3298878, -1.141456, 1, 1, 1, 1, 1,
-1.160275, 0.8561822, -0.4267308, 0, 0, 1, 1, 1,
-1.158956, 0.4716847, -2.11273, 1, 0, 0, 1, 1,
-1.158856, 0.306114, -0.1291121, 1, 0, 0, 1, 1,
-1.158149, -0.105751, -0.6432577, 1, 0, 0, 1, 1,
-1.155173, -2.318989, -3.384821, 1, 0, 0, 1, 1,
-1.151533, -1.653238, -1.794203, 1, 0, 0, 1, 1,
-1.150994, 1.132986, -0.7648491, 0, 0, 0, 1, 1,
-1.150862, -0.6550206, -1.02381, 0, 0, 0, 1, 1,
-1.138042, -1.290272, -2.018318, 0, 0, 0, 1, 1,
-1.126664, -1.359102, -1.551426, 0, 0, 0, 1, 1,
-1.123445, -2.791012, -3.974189, 0, 0, 0, 1, 1,
-1.122874, 1.616595, 1.316043, 0, 0, 0, 1, 1,
-1.120724, 1.811568, -1.371315, 0, 0, 0, 1, 1,
-1.113716, -0.262278, -2.249468, 1, 1, 1, 1, 1,
-1.089933, 0.3736782, -1.666325, 1, 1, 1, 1, 1,
-1.089916, -1.174698, -1.844304, 1, 1, 1, 1, 1,
-1.077578, 0.596936, -1.564325, 1, 1, 1, 1, 1,
-1.071023, 0.358317, -0.9691578, 1, 1, 1, 1, 1,
-1.064323, 1.408986, -2.078163, 1, 1, 1, 1, 1,
-1.060779, 0.5149826, 0.07132087, 1, 1, 1, 1, 1,
-1.060567, -1.615537, -2.94317, 1, 1, 1, 1, 1,
-1.056461, 1.042518, -0.4476353, 1, 1, 1, 1, 1,
-1.055499, -0.8871865, -2.83196, 1, 1, 1, 1, 1,
-1.049866, 0.7035372, -2.876723, 1, 1, 1, 1, 1,
-1.047398, -1.081181, 0.2642925, 1, 1, 1, 1, 1,
-1.046628, -0.6371598, -2.42588, 1, 1, 1, 1, 1,
-1.045184, -1.516914, -1.916927, 1, 1, 1, 1, 1,
-1.044999, 0.7212694, -1.813037, 1, 1, 1, 1, 1,
-1.020504, -0.6017705, -4.327487, 0, 0, 1, 1, 1,
-1.018355, -0.1717581, -2.774904, 1, 0, 0, 1, 1,
-1.014911, -0.8211628, -2.70747, 1, 0, 0, 1, 1,
-1.013323, -0.4755471, -1.797521, 1, 0, 0, 1, 1,
-1.007196, 1.485092, -0.9195309, 1, 0, 0, 1, 1,
-1.005638, 2.213004, -0.6179389, 1, 0, 0, 1, 1,
-1.001554, -0.6778608, -2.100158, 0, 0, 0, 1, 1,
-0.998899, 1.722342, 0.1257213, 0, 0, 0, 1, 1,
-0.9968203, -0.4603215, -2.470823, 0, 0, 0, 1, 1,
-0.9956942, -0.599462, -1.875336, 0, 0, 0, 1, 1,
-0.9823909, 0.4735292, -0.4084707, 0, 0, 0, 1, 1,
-0.9809783, -2.070453, -1.446558, 0, 0, 0, 1, 1,
-0.979789, -0.7788602, -1.370443, 0, 0, 0, 1, 1,
-0.9769593, -1.762949, -0.4833117, 1, 1, 1, 1, 1,
-0.9710148, -0.9432564, -3.367816, 1, 1, 1, 1, 1,
-0.970105, -0.5060396, -3.136856, 1, 1, 1, 1, 1,
-0.9665665, -0.3911952, -3.122565, 1, 1, 1, 1, 1,
-0.9657822, -0.1138835, -0.6157539, 1, 1, 1, 1, 1,
-0.9600301, -1.015548, -4.013272, 1, 1, 1, 1, 1,
-0.959033, 0.292441, -2.072744, 1, 1, 1, 1, 1,
-0.9528543, 1.078812, -1.430178, 1, 1, 1, 1, 1,
-0.9495384, -0.5454521, -2.243922, 1, 1, 1, 1, 1,
-0.9395599, -0.5188985, -2.649257, 1, 1, 1, 1, 1,
-0.9333341, -0.6215675, -1.647926, 1, 1, 1, 1, 1,
-0.9316137, -0.08374421, -0.9925953, 1, 1, 1, 1, 1,
-0.9279465, 0.7861267, -1.844564, 1, 1, 1, 1, 1,
-0.925475, 0.55334, -2.768104, 1, 1, 1, 1, 1,
-0.922117, 0.6998396, -1.556175, 1, 1, 1, 1, 1,
-0.9187771, -0.5908552, -1.823013, 0, 0, 1, 1, 1,
-0.9142385, 1.269468, 0.3265495, 1, 0, 0, 1, 1,
-0.9087048, 0.687678, -2.363821, 1, 0, 0, 1, 1,
-0.8930778, -0.5666242, -3.558838, 1, 0, 0, 1, 1,
-0.8919252, -1.534292, -3.33251, 1, 0, 0, 1, 1,
-0.8909813, 0.3030106, -1.320465, 1, 0, 0, 1, 1,
-0.8843404, -1.076579, -2.066125, 0, 0, 0, 1, 1,
-0.8814919, 0.3441663, -1.069748, 0, 0, 0, 1, 1,
-0.8784471, 0.1794273, -0.01734141, 0, 0, 0, 1, 1,
-0.8720287, 0.562404, -1.850401, 0, 0, 0, 1, 1,
-0.8605144, -0.6901704, -1.827057, 0, 0, 0, 1, 1,
-0.8571206, -0.7857182, -3.413615, 0, 0, 0, 1, 1,
-0.845401, 0.322618, -2.316144, 0, 0, 0, 1, 1,
-0.8431426, 0.03059996, 0.5837593, 1, 1, 1, 1, 1,
-0.8375815, 0.3350231, -0.08204608, 1, 1, 1, 1, 1,
-0.8315549, 0.80467, -0.4738978, 1, 1, 1, 1, 1,
-0.8292741, 2.02917, -1.269299, 1, 1, 1, 1, 1,
-0.8263603, -0.74265, -3.175961, 1, 1, 1, 1, 1,
-0.8253066, 0.1644252, -1.999204, 1, 1, 1, 1, 1,
-0.8167276, 1.354305, -0.8704584, 1, 1, 1, 1, 1,
-0.8147233, 0.82537, -1.453441, 1, 1, 1, 1, 1,
-0.8008277, -0.263225, -4.340616, 1, 1, 1, 1, 1,
-0.7998127, 0.7122777, -1.218683, 1, 1, 1, 1, 1,
-0.7970372, 0.7140993, -2.709226, 1, 1, 1, 1, 1,
-0.7915258, -0.5098806, -2.754565, 1, 1, 1, 1, 1,
-0.7907824, 0.03164529, -1.492985, 1, 1, 1, 1, 1,
-0.787423, 0.06139917, -0.9150483, 1, 1, 1, 1, 1,
-0.7844858, 2.294149, -0.7098305, 1, 1, 1, 1, 1,
-0.7794679, -0.04435108, -1.168747, 0, 0, 1, 1, 1,
-0.7780865, 1.145846, -0.7389086, 1, 0, 0, 1, 1,
-0.7699786, -0.076288, -2.709291, 1, 0, 0, 1, 1,
-0.752251, 0.8458109, -0.7011463, 1, 0, 0, 1, 1,
-0.751085, 1.547722, -0.1591691, 1, 0, 0, 1, 1,
-0.7504876, -0.8005139, -3.327458, 1, 0, 0, 1, 1,
-0.7451155, 0.4651318, -0.3397984, 0, 0, 0, 1, 1,
-0.7443333, -0.08899557, -1.88713, 0, 0, 0, 1, 1,
-0.7414295, 1.559001, -2.8869, 0, 0, 0, 1, 1,
-0.7403407, -0.245164, -1.143521, 0, 0, 0, 1, 1,
-0.732098, -0.4808735, -1.63094, 0, 0, 0, 1, 1,
-0.7307081, -2.341375, -2.715617, 0, 0, 0, 1, 1,
-0.7298692, 1.541697, 1.854084, 0, 0, 0, 1, 1,
-0.7259875, 0.8731337, -3.021363, 1, 1, 1, 1, 1,
-0.7205313, 0.979495, -0.7075414, 1, 1, 1, 1, 1,
-0.7180196, 0.9752369, -0.8347853, 1, 1, 1, 1, 1,
-0.715662, 0.3098789, -2.065119, 1, 1, 1, 1, 1,
-0.7149473, 0.100502, -0.4473672, 1, 1, 1, 1, 1,
-0.7027057, 0.7870927, -1.156924, 1, 1, 1, 1, 1,
-0.7023394, -0.4587379, -3.942819, 1, 1, 1, 1, 1,
-0.6909848, 0.1128831, -2.201998, 1, 1, 1, 1, 1,
-0.69046, 0.07137734, -1.930375, 1, 1, 1, 1, 1,
-0.687518, -0.1780391, -0.7551168, 1, 1, 1, 1, 1,
-0.6862776, 1.314242, -0.4931039, 1, 1, 1, 1, 1,
-0.6847454, 0.131715, -2.346727, 1, 1, 1, 1, 1,
-0.6793016, -0.04458943, -2.326966, 1, 1, 1, 1, 1,
-0.6782199, -1.797282, -4.001706, 1, 1, 1, 1, 1,
-0.6742164, -0.8848758, -2.714903, 1, 1, 1, 1, 1,
-0.6652272, -0.4400354, -1.887777, 0, 0, 1, 1, 1,
-0.6601349, 0.3609453, -0.5231857, 1, 0, 0, 1, 1,
-0.6568164, 0.04075525, -2.507067, 1, 0, 0, 1, 1,
-0.6542056, 0.05360341, -1.881242, 1, 0, 0, 1, 1,
-0.6539724, -0.4657843, -2.559827, 1, 0, 0, 1, 1,
-0.6533831, -1.361877, -2.798531, 1, 0, 0, 1, 1,
-0.6519976, 1.015401, -1.780428, 0, 0, 0, 1, 1,
-0.6501729, -1.078892, -0.7901817, 0, 0, 0, 1, 1,
-0.6493337, -0.1536262, -1.310372, 0, 0, 0, 1, 1,
-0.6493186, -0.08285814, -2.346696, 0, 0, 0, 1, 1,
-0.648886, -0.384664, -2.380321, 0, 0, 0, 1, 1,
-0.6478896, -0.4656774, -2.80267, 0, 0, 0, 1, 1,
-0.6436186, 0.3134073, -1.001214, 0, 0, 0, 1, 1,
-0.6321131, 0.2344564, -0.1927313, 1, 1, 1, 1, 1,
-0.6307696, 0.215724, -1.262436, 1, 1, 1, 1, 1,
-0.6261588, 0.4685057, -1.001953, 1, 1, 1, 1, 1,
-0.625592, -0.1807978, -0.3058782, 1, 1, 1, 1, 1,
-0.6254544, 0.5641502, 1.039063, 1, 1, 1, 1, 1,
-0.6236707, -1.321177, -2.51906, 1, 1, 1, 1, 1,
-0.6176006, -1.731692, -2.448707, 1, 1, 1, 1, 1,
-0.6139491, -1.127169, -1.321708, 1, 1, 1, 1, 1,
-0.6131167, -0.9881377, -2.313974, 1, 1, 1, 1, 1,
-0.6103976, -0.6604416, -3.75212, 1, 1, 1, 1, 1,
-0.6085389, -1.714685, -1.360687, 1, 1, 1, 1, 1,
-0.6085108, 1.722322, -0.2598521, 1, 1, 1, 1, 1,
-0.6084937, 0.5954599, 0.4588684, 1, 1, 1, 1, 1,
-0.6067551, 0.4015761, -2.090734, 1, 1, 1, 1, 1,
-0.6052868, -0.4368354, -1.718143, 1, 1, 1, 1, 1,
-0.6049736, 0.7268161, -0.5559658, 0, 0, 1, 1, 1,
-0.6038412, 0.5383173, -1.834803, 1, 0, 0, 1, 1,
-0.6031427, 1.799344, -0.06252249, 1, 0, 0, 1, 1,
-0.5948784, 1.677077, -0.419609, 1, 0, 0, 1, 1,
-0.5947171, 0.8094985, -0.01951273, 1, 0, 0, 1, 1,
-0.5913103, -0.2144149, -2.277196, 1, 0, 0, 1, 1,
-0.5840272, 0.9340765, 0.7554686, 0, 0, 0, 1, 1,
-0.583636, -0.3897625, -2.072526, 0, 0, 0, 1, 1,
-0.5835327, 0.3592619, -0.1897683, 0, 0, 0, 1, 1,
-0.5834861, -0.940268, -2.816616, 0, 0, 0, 1, 1,
-0.5793533, 0.05669772, 0.9487385, 0, 0, 0, 1, 1,
-0.5789606, -0.2347312, -2.55608, 0, 0, 0, 1, 1,
-0.5786979, -0.6493782, -2.034212, 0, 0, 0, 1, 1,
-0.5780094, -0.784839, -2.823638, 1, 1, 1, 1, 1,
-0.5779511, -0.6300407, -2.33546, 1, 1, 1, 1, 1,
-0.5767932, 0.6752855, -1.184165, 1, 1, 1, 1, 1,
-0.5763225, -0.4335009, -3.410783, 1, 1, 1, 1, 1,
-0.5643851, 0.2472338, -3.045567, 1, 1, 1, 1, 1,
-0.5569579, -0.2010357, -2.700526, 1, 1, 1, 1, 1,
-0.5457199, -1.309118, -1.940221, 1, 1, 1, 1, 1,
-0.5441856, 1.320861, -2.474046, 1, 1, 1, 1, 1,
-0.5431228, -0.7440658, -1.581217, 1, 1, 1, 1, 1,
-0.5391957, -0.8391148, -3.144662, 1, 1, 1, 1, 1,
-0.5386032, 0.3102795, -1.562316, 1, 1, 1, 1, 1,
-0.5385804, 0.5300639, -0.1986195, 1, 1, 1, 1, 1,
-0.5382717, 0.4019611, -1.302839, 1, 1, 1, 1, 1,
-0.5355033, -0.1573713, -0.1547253, 1, 1, 1, 1, 1,
-0.5295885, -0.5923604, -3.590999, 1, 1, 1, 1, 1,
-0.5288846, 1.103098, 1.30199, 0, 0, 1, 1, 1,
-0.5286502, 0.7538467, 0.469751, 1, 0, 0, 1, 1,
-0.5196435, -0.8005639, -3.418023, 1, 0, 0, 1, 1,
-0.5193242, -0.01889105, -0.2892136, 1, 0, 0, 1, 1,
-0.5187637, -1.490127, -2.971665, 1, 0, 0, 1, 1,
-0.5173405, -0.1821554, -0.9458313, 1, 0, 0, 1, 1,
-0.5137615, -0.7657956, -2.480015, 0, 0, 0, 1, 1,
-0.5137455, -0.6621822, -2.351649, 0, 0, 0, 1, 1,
-0.5107597, -1.917778, -4.686025, 0, 0, 0, 1, 1,
-0.5076858, 0.5657432, -1.636392, 0, 0, 0, 1, 1,
-0.5075737, 0.2264473, -1.325553, 0, 0, 0, 1, 1,
-0.5072443, -1.756927, -1.315444, 0, 0, 0, 1, 1,
-0.5034955, 2.280621, -0.2007771, 0, 0, 0, 1, 1,
-0.5018961, 1.178735, -0.8933089, 1, 1, 1, 1, 1,
-0.4996988, -0.8792655, -0.3252742, 1, 1, 1, 1, 1,
-0.4977851, 0.3706754, -0.1267948, 1, 1, 1, 1, 1,
-0.4935949, -1.129776, -3.085011, 1, 1, 1, 1, 1,
-0.4913051, -2.288316, -2.915186, 1, 1, 1, 1, 1,
-0.4897198, -0.02774636, -1.205529, 1, 1, 1, 1, 1,
-0.4800603, -0.3159865, -1.593214, 1, 1, 1, 1, 1,
-0.4792446, 0.7654653, -0.304787, 1, 1, 1, 1, 1,
-0.4730387, -0.6449832, -0.9334707, 1, 1, 1, 1, 1,
-0.4728633, 0.172544, -1.136537, 1, 1, 1, 1, 1,
-0.4685705, -0.3058748, -1.648482, 1, 1, 1, 1, 1,
-0.4665592, 0.7412533, -1.134839, 1, 1, 1, 1, 1,
-0.4621837, -1.483264, -3.397992, 1, 1, 1, 1, 1,
-0.4606682, 0.3601018, -1.686164, 1, 1, 1, 1, 1,
-0.4605478, 0.406225, 0.03286235, 1, 1, 1, 1, 1,
-0.4595051, 1.037995, -1.319058, 0, 0, 1, 1, 1,
-0.452712, 0.6871393, 1.555576, 1, 0, 0, 1, 1,
-0.4515865, 0.9494894, -0.7286536, 1, 0, 0, 1, 1,
-0.443658, 1.042496, -0.5114277, 1, 0, 0, 1, 1,
-0.4433305, -0.01231554, -2.714278, 1, 0, 0, 1, 1,
-0.4433134, -0.3654591, -1.988916, 1, 0, 0, 1, 1,
-0.4337825, -0.2888169, -1.911919, 0, 0, 0, 1, 1,
-0.4245302, 1.895502, 0.8754408, 0, 0, 0, 1, 1,
-0.4227301, 0.3669931, -0.4797687, 0, 0, 0, 1, 1,
-0.4194598, -0.7253433, -3.971872, 0, 0, 0, 1, 1,
-0.4089929, 1.521067, -0.8052223, 0, 0, 0, 1, 1,
-0.4079314, 0.3107809, -1.512266, 0, 0, 0, 1, 1,
-0.4018746, 0.03809606, -0.1679159, 0, 0, 0, 1, 1,
-0.4009801, -0.006108955, -1.011963, 1, 1, 1, 1, 1,
-0.3993557, 1.531663, -0.5038765, 1, 1, 1, 1, 1,
-0.3979843, -0.1429107, -2.227478, 1, 1, 1, 1, 1,
-0.3966324, 0.7474608, -0.1029266, 1, 1, 1, 1, 1,
-0.3963515, -0.871752, -1.315641, 1, 1, 1, 1, 1,
-0.3952464, 0.04374471, -1.167669, 1, 1, 1, 1, 1,
-0.3922808, -1.056646, -2.107682, 1, 1, 1, 1, 1,
-0.3896144, 0.4941114, -1.18203, 1, 1, 1, 1, 1,
-0.3862129, 2.397102, 0.7430769, 1, 1, 1, 1, 1,
-0.3859495, 1.741132, -1.181036, 1, 1, 1, 1, 1,
-0.3858231, -0.2089193, -2.039948, 1, 1, 1, 1, 1,
-0.3853401, 0.950377, 0.2798226, 1, 1, 1, 1, 1,
-0.3833034, -0.5226216, -3.233872, 1, 1, 1, 1, 1,
-0.3799314, -0.3254855, -3.676955, 1, 1, 1, 1, 1,
-0.3795326, -0.6945825, -3.677812, 1, 1, 1, 1, 1,
-0.360823, -0.4645903, -1.135074, 0, 0, 1, 1, 1,
-0.3570601, -0.7205558, -2.477268, 1, 0, 0, 1, 1,
-0.3557197, 0.09815238, -0.4102244, 1, 0, 0, 1, 1,
-0.3554901, -0.2523564, 0.006301458, 1, 0, 0, 1, 1,
-0.3554139, 1.459944, 0.01853273, 1, 0, 0, 1, 1,
-0.3554086, -0.7789794, -0.847914, 1, 0, 0, 1, 1,
-0.3540951, -0.5730873, -1.978149, 0, 0, 0, 1, 1,
-0.3509071, 0.3685318, 0.8238775, 0, 0, 0, 1, 1,
-0.3504284, 1.380908, -0.929717, 0, 0, 0, 1, 1,
-0.3446111, 3.064856, -0.2219835, 0, 0, 0, 1, 1,
-0.3434319, -2.792086, -5.034438, 0, 0, 0, 1, 1,
-0.3411755, 0.6197726, -1.482659, 0, 0, 0, 1, 1,
-0.3402862, -2.022805, -1.301591, 0, 0, 0, 1, 1,
-0.3385225, -0.618511, -3.244759, 1, 1, 1, 1, 1,
-0.3368986, -0.7740397, -3.454029, 1, 1, 1, 1, 1,
-0.3346064, 0.4216447, 0.8790082, 1, 1, 1, 1, 1,
-0.3330999, -1.011935, -0.9005066, 1, 1, 1, 1, 1,
-0.331312, -1.193398, -2.55, 1, 1, 1, 1, 1,
-0.3254471, -1.254336, -1.917572, 1, 1, 1, 1, 1,
-0.3246318, -2.183371, -4.752852, 1, 1, 1, 1, 1,
-0.3233193, 0.9847142, -1.180752, 1, 1, 1, 1, 1,
-0.3186665, -0.6393004, -1.673279, 1, 1, 1, 1, 1,
-0.3186141, 0.09889916, -0.9820547, 1, 1, 1, 1, 1,
-0.3177812, -0.1377297, 0.02410778, 1, 1, 1, 1, 1,
-0.3085255, 0.8584486, 2.040815, 1, 1, 1, 1, 1,
-0.3039882, 0.9511791, -1.213135, 1, 1, 1, 1, 1,
-0.3039366, -0.1051037, -0.7128879, 1, 1, 1, 1, 1,
-0.2982599, 0.4853873, -1.280494, 1, 1, 1, 1, 1,
-0.2977318, 0.2549593, -2.275712, 0, 0, 1, 1, 1,
-0.2967265, 0.8393256, -0.5106587, 1, 0, 0, 1, 1,
-0.2961738, -1.294824, -3.177162, 1, 0, 0, 1, 1,
-0.2935693, -0.28901, -1.516287, 1, 0, 0, 1, 1,
-0.2882113, 0.4348397, 0.290194, 1, 0, 0, 1, 1,
-0.2842876, -0.6140567, -3.2737, 1, 0, 0, 1, 1,
-0.2823654, -1.001912, -4.04696, 0, 0, 0, 1, 1,
-0.2810546, 0.6282343, -0.5522851, 0, 0, 0, 1, 1,
-0.2744476, 0.6545692, -0.6493682, 0, 0, 0, 1, 1,
-0.2732942, 0.7703924, 0.4282743, 0, 0, 0, 1, 1,
-0.2716022, 0.01155322, -3.07106, 0, 0, 0, 1, 1,
-0.2694843, 1.236767, -0.6579047, 0, 0, 0, 1, 1,
-0.2689073, 0.5323125, -0.8868416, 0, 0, 0, 1, 1,
-0.2686052, 0.6135827, -0.7326848, 1, 1, 1, 1, 1,
-0.266251, 0.4631624, -0.804504, 1, 1, 1, 1, 1,
-0.2636521, 0.5859078, -0.374522, 1, 1, 1, 1, 1,
-0.2626287, -0.1451087, -1.944441, 1, 1, 1, 1, 1,
-0.2604515, -1.889004, -3.661398, 1, 1, 1, 1, 1,
-0.2596591, 1.097335, -1.320613, 1, 1, 1, 1, 1,
-0.259185, 0.824595, -0.6220263, 1, 1, 1, 1, 1,
-0.257159, 0.5594174, 0.8579175, 1, 1, 1, 1, 1,
-0.2471087, 0.5650302, -0.613724, 1, 1, 1, 1, 1,
-0.2464595, 0.9514762, -0.7428321, 1, 1, 1, 1, 1,
-0.2398822, 0.1609294, -3.002456, 1, 1, 1, 1, 1,
-0.237083, 0.05480849, -1.073765, 1, 1, 1, 1, 1,
-0.2344623, 1.386851, -0.2099303, 1, 1, 1, 1, 1,
-0.2292608, -0.03887644, -0.6720419, 1, 1, 1, 1, 1,
-0.2277617, -1.093799, -5.048728, 1, 1, 1, 1, 1,
-0.22665, 1.060404, -1.194335, 0, 0, 1, 1, 1,
-0.2237853, -0.6203553, -2.138321, 1, 0, 0, 1, 1,
-0.2226832, -0.810856, -3.23665, 1, 0, 0, 1, 1,
-0.2221586, -0.8066146, -5.458802, 1, 0, 0, 1, 1,
-0.2205338, -2.506576, -4.806193, 1, 0, 0, 1, 1,
-0.2196395, 0.1002911, -1.329527, 1, 0, 0, 1, 1,
-0.2190343, 0.6169147, 0.7919476, 0, 0, 0, 1, 1,
-0.2154506, -0.7491894, -2.609104, 0, 0, 0, 1, 1,
-0.2148972, -0.5602449, -1.220799, 0, 0, 0, 1, 1,
-0.2062655, 0.6441898, -0.3879716, 0, 0, 0, 1, 1,
-0.206023, 1.816103, -0.4476547, 0, 0, 0, 1, 1,
-0.2038096, 1.502635, 0.7278669, 0, 0, 0, 1, 1,
-0.2033162, 0.1258396, -2.629081, 0, 0, 0, 1, 1,
-0.2027477, 0.6637574, 0.7786722, 1, 1, 1, 1, 1,
-0.2013291, -0.4154438, -1.913228, 1, 1, 1, 1, 1,
-0.2006496, 0.3402092, -1.331527, 1, 1, 1, 1, 1,
-0.1996374, 1.079214, -0.7115176, 1, 1, 1, 1, 1,
-0.1942357, 1.133386, -2.083324, 1, 1, 1, 1, 1,
-0.192436, -0.7459276, -2.552435, 1, 1, 1, 1, 1,
-0.1914548, -1.543023, -2.739615, 1, 1, 1, 1, 1,
-0.1905792, 0.6286362, -0.8726234, 1, 1, 1, 1, 1,
-0.1902871, 0.09196723, 0.232937, 1, 1, 1, 1, 1,
-0.1798956, -0.2667491, -2.001325, 1, 1, 1, 1, 1,
-0.1711988, -0.2969442, -3.654182, 1, 1, 1, 1, 1,
-0.1702561, 0.3495481, -1.552443, 1, 1, 1, 1, 1,
-0.1699236, -0.444503, -2.339924, 1, 1, 1, 1, 1,
-0.1650337, -0.2017697, -3.092709, 1, 1, 1, 1, 1,
-0.1623723, -1.534458, -3.375192, 1, 1, 1, 1, 1,
-0.1614711, 1.141924, -0.4800439, 0, 0, 1, 1, 1,
-0.1564948, 1.103686, -0.6580879, 1, 0, 0, 1, 1,
-0.1534718, -0.7622051, -3.984964, 1, 0, 0, 1, 1,
-0.1531099, -0.1212437, -2.816284, 1, 0, 0, 1, 1,
-0.1495545, -0.2335912, -2.883028, 1, 0, 0, 1, 1,
-0.1456723, -0.08756374, -2.334477, 1, 0, 0, 1, 1,
-0.1442929, -0.4894798, -1.276814, 0, 0, 0, 1, 1,
-0.1417693, 1.171716, -1.076251, 0, 0, 0, 1, 1,
-0.1413559, 0.7608694, -1.161591, 0, 0, 0, 1, 1,
-0.1375386, -0.04155163, -2.837011, 0, 0, 0, 1, 1,
-0.1370465, -0.8093733, -3.466053, 0, 0, 0, 1, 1,
-0.1361318, 0.3561271, 0.2476224, 0, 0, 0, 1, 1,
-0.1351984, 1.659661, 0.7570508, 0, 0, 0, 1, 1,
-0.133078, 2.208184, -2.307862, 1, 1, 1, 1, 1,
-0.1291356, -1.199858, -4.771322, 1, 1, 1, 1, 1,
-0.1280811, -0.0805403, -3.576502, 1, 1, 1, 1, 1,
-0.1267976, -1.726667, -2.713214, 1, 1, 1, 1, 1,
-0.1256734, -1.745693, -1.667083, 1, 1, 1, 1, 1,
-0.1252333, 1.047524, 0.01484239, 1, 1, 1, 1, 1,
-0.1229985, 1.031927, 0.5098292, 1, 1, 1, 1, 1,
-0.1193627, 0.005990394, -1.027226, 1, 1, 1, 1, 1,
-0.119229, 0.3279453, -0.1514035, 1, 1, 1, 1, 1,
-0.1183711, -0.2160896, -2.2309, 1, 1, 1, 1, 1,
-0.1163591, -1.016756, -3.933547, 1, 1, 1, 1, 1,
-0.1143356, 1.904624, 1.05031, 1, 1, 1, 1, 1,
-0.09871881, 0.08210891, -0.9031574, 1, 1, 1, 1, 1,
-0.09732789, -0.8548308, -4.09973, 1, 1, 1, 1, 1,
-0.09731527, 0.5902442, -0.1399895, 1, 1, 1, 1, 1,
-0.0913783, 0.7558722, -0.9402552, 0, 0, 1, 1, 1,
-0.08993538, 0.4177499, -0.8210961, 1, 0, 0, 1, 1,
-0.0887981, -3.352727, -2.967957, 1, 0, 0, 1, 1,
-0.08727593, -0.4441891, -2.85872, 1, 0, 0, 1, 1,
-0.08620694, 0.3708395, 0.3668398, 1, 0, 0, 1, 1,
-0.07971753, -0.2993876, -1.46698, 1, 0, 0, 1, 1,
-0.07605017, 0.0640095, -1.239447, 0, 0, 0, 1, 1,
-0.07416535, 1.416529, 2.324076, 0, 0, 0, 1, 1,
-0.07024328, 0.322359, -0.1432884, 0, 0, 0, 1, 1,
-0.06793597, 0.4783581, -1.197196, 0, 0, 0, 1, 1,
-0.06347775, 1.196197, -0.07233199, 0, 0, 0, 1, 1,
-0.06136059, -0.6091385, -4.131461, 0, 0, 0, 1, 1,
-0.05916354, -0.6741952, -3.987833, 0, 0, 0, 1, 1,
-0.05726429, -0.9400226, -2.188931, 1, 1, 1, 1, 1,
-0.05513112, -1.651293, -4.225296, 1, 1, 1, 1, 1,
-0.04613107, 0.5663136, 0.231908, 1, 1, 1, 1, 1,
-0.04547022, 0.2536592, -1.176578, 1, 1, 1, 1, 1,
-0.04403988, -0.4828305, -4.640678, 1, 1, 1, 1, 1,
-0.04174106, -0.4547155, -3.17103, 1, 1, 1, 1, 1,
-0.04124444, -0.8402692, -3.733232, 1, 1, 1, 1, 1,
-0.03744886, -1.106384, -4.286777, 1, 1, 1, 1, 1,
-0.03678795, -0.9064325, -3.696839, 1, 1, 1, 1, 1,
-0.03676337, 1.418597, -1.181643, 1, 1, 1, 1, 1,
-0.03454908, -0.2321636, -2.748288, 1, 1, 1, 1, 1,
-0.02630569, 0.8232582, -1.15205, 1, 1, 1, 1, 1,
-0.02083923, 0.567228, -1.261093, 1, 1, 1, 1, 1,
-0.02074382, -0.3624363, -4.787464, 1, 1, 1, 1, 1,
-0.02065214, -0.574366, -5.112241, 1, 1, 1, 1, 1,
-0.02030245, -0.543371, -2.338771, 0, 0, 1, 1, 1,
-0.01969295, 1.125018, 0.5669677, 1, 0, 0, 1, 1,
-0.01783469, 0.6506017, 0.01201328, 1, 0, 0, 1, 1,
-0.01730995, -0.09195749, -4.716444, 1, 0, 0, 1, 1,
-0.01612456, -0.4615047, -1.55729, 1, 0, 0, 1, 1,
-0.01515674, -0.6358743, -2.035051, 1, 0, 0, 1, 1,
-0.01387663, 0.2537993, 1.041313, 0, 0, 0, 1, 1,
-0.009913644, -0.6933973, -4.690482, 0, 0, 0, 1, 1,
-0.007698752, 0.8587582, 0.694814, 0, 0, 0, 1, 1,
-0.005028912, -0.4557691, -3.145725, 0, 0, 0, 1, 1,
-0.004501988, -0.5987422, -4.074224, 0, 0, 0, 1, 1,
-0.003631222, -1.504664, -3.937251, 0, 0, 0, 1, 1,
-0.002492067, -0.1538435, -4.493416, 0, 0, 0, 1, 1,
-0.001231357, -0.0253818, -2.783497, 1, 1, 1, 1, 1,
-0.0009173137, 0.9853098, -0.2599554, 1, 1, 1, 1, 1,
0.001043622, 1.0573, -0.8971081, 1, 1, 1, 1, 1,
0.01804842, -0.598453, 3.760013, 1, 1, 1, 1, 1,
0.02015282, -0.3874068, 3.489867, 1, 1, 1, 1, 1,
0.0208129, 1.537859, 0.8384277, 1, 1, 1, 1, 1,
0.02122199, 0.4973579, -1.393949, 1, 1, 1, 1, 1,
0.02222913, 0.2817677, 0.4553957, 1, 1, 1, 1, 1,
0.02533467, 0.2611715, -0.2628851, 1, 1, 1, 1, 1,
0.02779902, 0.7340262, 0.4687648, 1, 1, 1, 1, 1,
0.03143464, -0.1299378, 3.671851, 1, 1, 1, 1, 1,
0.03203684, 0.03724785, -1.294478, 1, 1, 1, 1, 1,
0.03709097, -0.3626037, 1.354778, 1, 1, 1, 1, 1,
0.04130018, 1.538433, 0.8289569, 1, 1, 1, 1, 1,
0.04408645, -0.1182765, 1.080932, 1, 1, 1, 1, 1,
0.04595625, 0.6983701, -0.62181, 0, 0, 1, 1, 1,
0.0510937, -0.01750669, 2.398787, 1, 0, 0, 1, 1,
0.05399492, 0.7665356, 0.5420223, 1, 0, 0, 1, 1,
0.05647882, 0.3631667, -1.924352, 1, 0, 0, 1, 1,
0.0596372, -0.5684198, 3.361362, 1, 0, 0, 1, 1,
0.0600207, 0.2178749, -0.1780251, 1, 0, 0, 1, 1,
0.06366926, -1.602672, 2.012281, 0, 0, 0, 1, 1,
0.06657698, -0.4844516, 3.050642, 0, 0, 0, 1, 1,
0.06720054, -0.6943803, 3.354127, 0, 0, 0, 1, 1,
0.0706086, -0.2990101, 4.66988, 0, 0, 0, 1, 1,
0.07147403, 1.429216, 0.8034794, 0, 0, 0, 1, 1,
0.07548428, 0.2174084, 1.593445, 0, 0, 0, 1, 1,
0.07803497, -1.201453, 3.563261, 0, 0, 0, 1, 1,
0.08326279, -0.4022822, 2.22857, 1, 1, 1, 1, 1,
0.08622882, 0.8016579, 1.293612, 1, 1, 1, 1, 1,
0.08688146, 0.9610601, -0.8203581, 1, 1, 1, 1, 1,
0.09236445, 0.003082937, 3.686538, 1, 1, 1, 1, 1,
0.0923853, 0.7103861, 0.794064, 1, 1, 1, 1, 1,
0.09428052, 1.187411, 0.5328813, 1, 1, 1, 1, 1,
0.09897985, 0.2448377, -0.9617192, 1, 1, 1, 1, 1,
0.1036717, -0.4040287, 1.590266, 1, 1, 1, 1, 1,
0.1045879, 0.4866554, 0.04926614, 1, 1, 1, 1, 1,
0.1049892, -0.1772551, 2.24422, 1, 1, 1, 1, 1,
0.1080917, 0.9432635, 0.2105071, 1, 1, 1, 1, 1,
0.1090712, -1.257128, 4.432247, 1, 1, 1, 1, 1,
0.1111751, 0.2621199, 0.4411898, 1, 1, 1, 1, 1,
0.1127483, -0.367803, 1.187918, 1, 1, 1, 1, 1,
0.1149172, -0.9724539, 2.571524, 1, 1, 1, 1, 1,
0.1158814, 1.190548, -0.4689577, 0, 0, 1, 1, 1,
0.1178568, 0.7974194, 1.299631, 1, 0, 0, 1, 1,
0.1197485, -0.05915081, 3.471208, 1, 0, 0, 1, 1,
0.1270257, -0.520639, 3.924678, 1, 0, 0, 1, 1,
0.1280607, 0.8066566, 0.2205743, 1, 0, 0, 1, 1,
0.1340867, -2.44478, 2.341539, 1, 0, 0, 1, 1,
0.1347831, 0.8341202, 0.2535131, 0, 0, 0, 1, 1,
0.1355944, 0.2586907, 1.875522, 0, 0, 0, 1, 1,
0.1394687, 1.256971, -1.723984, 0, 0, 0, 1, 1,
0.1396928, -0.3555975, 4.336531, 0, 0, 0, 1, 1,
0.1470526, 0.9220839, -0.5985115, 0, 0, 0, 1, 1,
0.1504708, -0.2158979, 1.476939, 0, 0, 0, 1, 1,
0.1538624, 0.2543134, 0.9494243, 0, 0, 0, 1, 1,
0.1583388, 1.021433, -0.7092761, 1, 1, 1, 1, 1,
0.1599322, 2.219763, 0.7406561, 1, 1, 1, 1, 1,
0.1603755, 0.7070183, 2.421039, 1, 1, 1, 1, 1,
0.1655189, 0.2328906, 0.724501, 1, 1, 1, 1, 1,
0.1670634, -0.1728251, 2.289287, 1, 1, 1, 1, 1,
0.1724939, 1.160141, 0.1960393, 1, 1, 1, 1, 1,
0.1740059, 3.130638, -0.1680618, 1, 1, 1, 1, 1,
0.1803328, 1.005955, 1.218446, 1, 1, 1, 1, 1,
0.1814328, 0.1472351, 1.131341, 1, 1, 1, 1, 1,
0.1837404, -1.946764, 3.312454, 1, 1, 1, 1, 1,
0.1854831, -1.496289, 1.406265, 1, 1, 1, 1, 1,
0.1861235, -0.1452206, 0.8814047, 1, 1, 1, 1, 1,
0.1880235, 0.7471125, -2.19517, 1, 1, 1, 1, 1,
0.1902753, -0.260642, 4.773753, 1, 1, 1, 1, 1,
0.1929052, -1.204604, 1.898917, 1, 1, 1, 1, 1,
0.1976829, 0.8852372, -1.383478, 0, 0, 1, 1, 1,
0.1981689, 0.02601604, 1.156215, 1, 0, 0, 1, 1,
0.199607, -0.6328275, 2.386943, 1, 0, 0, 1, 1,
0.2007668, -1.158811, 1.871377, 1, 0, 0, 1, 1,
0.2100133, -1.20176, 2.957496, 1, 0, 0, 1, 1,
0.2113278, 1.089494, 1.13598, 1, 0, 0, 1, 1,
0.2204297, 1.699386, 2.685377, 0, 0, 0, 1, 1,
0.2236922, 0.7443376, -0.177175, 0, 0, 0, 1, 1,
0.2259021, -0.3009366, 3.392362, 0, 0, 0, 1, 1,
0.226573, 0.3089076, -0.6845844, 0, 0, 0, 1, 1,
0.2285066, 1.387686, 0.8638439, 0, 0, 0, 1, 1,
0.2331544, 0.4868532, 2.104775, 0, 0, 0, 1, 1,
0.2365566, 0.864117, 1.324143, 0, 0, 0, 1, 1,
0.2381172, -0.05954634, 0.5900058, 1, 1, 1, 1, 1,
0.2387751, 0.6983228, 1.641707, 1, 1, 1, 1, 1,
0.2405951, 0.9503984, -0.2241265, 1, 1, 1, 1, 1,
0.2416272, 0.5915788, -1.497061, 1, 1, 1, 1, 1,
0.243574, -1.42563, 2.403499, 1, 1, 1, 1, 1,
0.2441948, -1.418348, 3.18166, 1, 1, 1, 1, 1,
0.2467581, 0.7375475, 0.7280389, 1, 1, 1, 1, 1,
0.2477098, -0.9203707, 3.335643, 1, 1, 1, 1, 1,
0.2510666, -0.3841908, 2.851005, 1, 1, 1, 1, 1,
0.2529114, -0.6307279, 3.164169, 1, 1, 1, 1, 1,
0.2538222, -2.27128, 2.815888, 1, 1, 1, 1, 1,
0.2589564, 1.393154, 0.5613208, 1, 1, 1, 1, 1,
0.2608787, -0.7415377, 3.297246, 1, 1, 1, 1, 1,
0.262345, -0.2140592, 1.226191, 1, 1, 1, 1, 1,
0.2636789, -0.2150239, 1.173484, 1, 1, 1, 1, 1,
0.2639116, -1.474737, 2.835023, 0, 0, 1, 1, 1,
0.264461, -1.758119, 3.284609, 1, 0, 0, 1, 1,
0.2655374, 0.7737116, 1.739873, 1, 0, 0, 1, 1,
0.2689853, 2.758883, 1.103285, 1, 0, 0, 1, 1,
0.269538, -0.4751026, 1.785309, 1, 0, 0, 1, 1,
0.2715674, -0.376973, 2.102136, 1, 0, 0, 1, 1,
0.2728373, 0.160474, -0.3583283, 0, 0, 0, 1, 1,
0.2747998, -1.322852, 3.107116, 0, 0, 0, 1, 1,
0.2749675, 1.85572, 0.6651052, 0, 0, 0, 1, 1,
0.2761723, -0.2367985, 4.058997, 0, 0, 0, 1, 1,
0.2766525, -0.4792189, 1.648421, 0, 0, 0, 1, 1,
0.2797795, 0.03782787, 1.129982, 0, 0, 0, 1, 1,
0.2857772, 1.593737, -0.6049773, 0, 0, 0, 1, 1,
0.2901611, 1.884932, 1.245286, 1, 1, 1, 1, 1,
0.2932273, 0.1115036, 0.5066199, 1, 1, 1, 1, 1,
0.2938983, -1.141868, 4.517909, 1, 1, 1, 1, 1,
0.2966564, -1.53963, 2.213437, 1, 1, 1, 1, 1,
0.3089955, 0.529322, 1.159583, 1, 1, 1, 1, 1,
0.3120288, -1.569734, 2.78628, 1, 1, 1, 1, 1,
0.3133109, 0.1312737, 1.57691, 1, 1, 1, 1, 1,
0.3143482, -1.64788, 3.006272, 1, 1, 1, 1, 1,
0.3202401, -0.5734221, 4.915004, 1, 1, 1, 1, 1,
0.3214177, -0.01105832, 2.031661, 1, 1, 1, 1, 1,
0.3238515, 2.333269, 0.5919951, 1, 1, 1, 1, 1,
0.32386, -0.3252068, 3.311453, 1, 1, 1, 1, 1,
0.324844, -0.7339981, 2.188473, 1, 1, 1, 1, 1,
0.3267685, 0.0662286, -0.3223374, 1, 1, 1, 1, 1,
0.3330384, 0.2698531, 1.037489, 1, 1, 1, 1, 1,
0.333424, -0.1342547, 2.472955, 0, 0, 1, 1, 1,
0.3344375, -1.028377, 2.408467, 1, 0, 0, 1, 1,
0.3375102, -0.3820736, 3.505216, 1, 0, 0, 1, 1,
0.3375683, -1.579094, 2.741054, 1, 0, 0, 1, 1,
0.3386298, 1.850126, 0.7610372, 1, 0, 0, 1, 1,
0.3409003, -0.9668413, 2.541754, 1, 0, 0, 1, 1,
0.348038, 0.3226694, 0.3127728, 0, 0, 0, 1, 1,
0.3489817, -0.6725765, 4.176813, 0, 0, 0, 1, 1,
0.3499287, -1.415352, 3.916061, 0, 0, 0, 1, 1,
0.3593384, 0.7037655, 1.201404, 0, 0, 0, 1, 1,
0.3618668, -0.6851208, 3.296726, 0, 0, 0, 1, 1,
0.362232, 0.04250319, 1.231921, 0, 0, 0, 1, 1,
0.3728076, 0.5654778, 0.771336, 0, 0, 0, 1, 1,
0.374676, 1.027943, 1.019575, 1, 1, 1, 1, 1,
0.3757716, 0.9693965, 1.821062, 1, 1, 1, 1, 1,
0.3763787, 0.2201545, 1.095714, 1, 1, 1, 1, 1,
0.3770131, -0.1961248, 1.607826, 1, 1, 1, 1, 1,
0.3774277, 0.2570383, 1.008029, 1, 1, 1, 1, 1,
0.3784813, -0.9695412, 4.007629, 1, 1, 1, 1, 1,
0.3793933, -1.661618, 2.710987, 1, 1, 1, 1, 1,
0.3822601, -0.7412415, 4.603808, 1, 1, 1, 1, 1,
0.3840476, -2.374612, 3.206249, 1, 1, 1, 1, 1,
0.3870051, 0.9133549, 0.1118212, 1, 1, 1, 1, 1,
0.3894101, 1.228361, 0.9825031, 1, 1, 1, 1, 1,
0.3909671, -1.410799, 3.493016, 1, 1, 1, 1, 1,
0.3919183, -0.5895461, 2.350149, 1, 1, 1, 1, 1,
0.3921587, 0.6043386, 1.773327, 1, 1, 1, 1, 1,
0.3924454, 1.470136, 0.09826232, 1, 1, 1, 1, 1,
0.3928854, -1.050767, 0.6387849, 0, 0, 1, 1, 1,
0.3996167, 1.20891, -0.0956957, 1, 0, 0, 1, 1,
0.4004909, 0.591669, 3.036293, 1, 0, 0, 1, 1,
0.402738, -1.134006, 2.227581, 1, 0, 0, 1, 1,
0.4053637, 0.05199577, 1.76616, 1, 0, 0, 1, 1,
0.4089329, 1.263091, 1.075426, 1, 0, 0, 1, 1,
0.4093221, 0.371097, 0.02130466, 0, 0, 0, 1, 1,
0.4120649, 0.4111641, 3.027186, 0, 0, 0, 1, 1,
0.4139073, 0.3575564, -0.07459085, 0, 0, 0, 1, 1,
0.414272, -2.383162, 3.233534, 0, 0, 0, 1, 1,
0.4167078, 1.534121, 2.126521, 0, 0, 0, 1, 1,
0.417771, 0.1527779, -0.7916061, 0, 0, 0, 1, 1,
0.4196163, -1.190539, 2.403501, 0, 0, 0, 1, 1,
0.4213558, -0.4380879, 3.766598, 1, 1, 1, 1, 1,
0.4286419, -1.221488, 1.078261, 1, 1, 1, 1, 1,
0.4292161, 0.8532571, -0.08693529, 1, 1, 1, 1, 1,
0.4293217, -2.629042, 3.193139, 1, 1, 1, 1, 1,
0.4302872, -1.055238, 2.617116, 1, 1, 1, 1, 1,
0.4320179, -1.109259, 3.336563, 1, 1, 1, 1, 1,
0.432777, 0.4442312, 1.344407, 1, 1, 1, 1, 1,
0.4348117, -0.5106386, 1.255879, 1, 1, 1, 1, 1,
0.4374345, 0.7503937, -0.4018348, 1, 1, 1, 1, 1,
0.4374394, 1.343563, -0.2650176, 1, 1, 1, 1, 1,
0.4404745, -0.1414717, 1.578859, 1, 1, 1, 1, 1,
0.4437857, -0.5754698, 2.783594, 1, 1, 1, 1, 1,
0.4468963, 0.565369, -1.727675, 1, 1, 1, 1, 1,
0.451126, -0.932417, 3.580393, 1, 1, 1, 1, 1,
0.4552979, 0.4743084, 0.006920086, 1, 1, 1, 1, 1,
0.4709385, -1.315425, 1.114588, 0, 0, 1, 1, 1,
0.4758592, 0.9639294, 0.5163403, 1, 0, 0, 1, 1,
0.4814604, -1.675058, 2.202361, 1, 0, 0, 1, 1,
0.48396, 0.5363394, 0.5622668, 1, 0, 0, 1, 1,
0.4865538, 0.5697996, 1.492963, 1, 0, 0, 1, 1,
0.4900908, -1.319474, 4.001362, 1, 0, 0, 1, 1,
0.4901567, 0.3161793, 2.226708, 0, 0, 0, 1, 1,
0.4944077, -0.4448415, 3.044882, 0, 0, 0, 1, 1,
0.4970702, -0.4422752, 1.179353, 0, 0, 0, 1, 1,
0.4986552, 2.789288, -0.7729558, 0, 0, 0, 1, 1,
0.5049977, -0.2015936, 1.003663, 0, 0, 0, 1, 1,
0.508172, -0.099719, 1.047611, 0, 0, 0, 1, 1,
0.5121029, 0.8526906, 0.7858288, 0, 0, 0, 1, 1,
0.5167128, 1.788173, 0.6599965, 1, 1, 1, 1, 1,
0.5175329, 0.210337, 1.21967, 1, 1, 1, 1, 1,
0.5197245, 0.5315718, 0.4980534, 1, 1, 1, 1, 1,
0.5258288, 0.005212518, 0.4774671, 1, 1, 1, 1, 1,
0.5275537, 0.57197, 1.448164, 1, 1, 1, 1, 1,
0.5314261, -0.9450111, 3.453965, 1, 1, 1, 1, 1,
0.5318338, 1.756159, 0.8790229, 1, 1, 1, 1, 1,
0.5376454, -1.836214, 3.472897, 1, 1, 1, 1, 1,
0.538486, 2.368655, 0.5488578, 1, 1, 1, 1, 1,
0.5409055, 0.4333719, -1.026427, 1, 1, 1, 1, 1,
0.5411149, 1.40274, -0.1472237, 1, 1, 1, 1, 1,
0.5459424, -0.6248415, 0.6275414, 1, 1, 1, 1, 1,
0.5471008, 0.9873399, -0.7006712, 1, 1, 1, 1, 1,
0.5476108, -0.4435562, 1.810242, 1, 1, 1, 1, 1,
0.5476948, 1.159769, 0.7292137, 1, 1, 1, 1, 1,
0.5576202, 0.881719, 0.9362161, 0, 0, 1, 1, 1,
0.5586274, -1.847905, 2.67449, 1, 0, 0, 1, 1,
0.5601584, -0.6490152, 3.160374, 1, 0, 0, 1, 1,
0.562574, -1.817022, 2.863631, 1, 0, 0, 1, 1,
0.5628417, 0.9210332, -0.7309127, 1, 0, 0, 1, 1,
0.5646352, 0.0248376, 3.136565, 1, 0, 0, 1, 1,
0.5741484, 1.028914, -0.06021198, 0, 0, 0, 1, 1,
0.5775967, -0.09461719, 2.597225, 0, 0, 0, 1, 1,
0.5808738, -1.066714, 1.262492, 0, 0, 0, 1, 1,
0.582986, -0.02221457, 0.736658, 0, 0, 0, 1, 1,
0.5869209, -0.2501069, 0.07652999, 0, 0, 0, 1, 1,
0.5869542, 0.3138634, 3.009774, 0, 0, 0, 1, 1,
0.5887669, 0.7793609, 1.104057, 0, 0, 0, 1, 1,
0.5891869, 0.8710967, -0.8508682, 1, 1, 1, 1, 1,
0.5936585, -0.02011307, 0.9396338, 1, 1, 1, 1, 1,
0.5957611, -2.213572, 2.431221, 1, 1, 1, 1, 1,
0.5959355, -1.110054, 2.498336, 1, 1, 1, 1, 1,
0.5966513, 0.684421, -0.7872291, 1, 1, 1, 1, 1,
0.6092134, 1.022732, 1.592925, 1, 1, 1, 1, 1,
0.6120793, 1.004501, -0.1455736, 1, 1, 1, 1, 1,
0.6134857, -0.8769224, 2.41554, 1, 1, 1, 1, 1,
0.6157315, -0.4483998, 1.597389, 1, 1, 1, 1, 1,
0.6223729, 0.2423686, 2.281783, 1, 1, 1, 1, 1,
0.6227534, -0.6833127, 1.632552, 1, 1, 1, 1, 1,
0.6263636, -0.4165329, 2.829404, 1, 1, 1, 1, 1,
0.627642, 0.4392396, 0.06498498, 1, 1, 1, 1, 1,
0.6289614, -0.9870445, 2.888668, 1, 1, 1, 1, 1,
0.6351876, -0.1621451, -0.1678558, 1, 1, 1, 1, 1,
0.6362469, -1.298132, 1.614501, 0, 0, 1, 1, 1,
0.6364864, 1.639415, -0.8569847, 1, 0, 0, 1, 1,
0.6451154, 0.610827, -0.05861969, 1, 0, 0, 1, 1,
0.6606178, -1.38789, 2.496097, 1, 0, 0, 1, 1,
0.6633744, -1.231773, 3.0419, 1, 0, 0, 1, 1,
0.6647869, 0.7095318, -1.010576, 1, 0, 0, 1, 1,
0.6703679, 1.388242, -0.2187476, 0, 0, 0, 1, 1,
0.6706085, 0.9217925, 0.1696873, 0, 0, 0, 1, 1,
0.6712046, 0.09512904, 1.133736, 0, 0, 0, 1, 1,
0.6739978, -0.9606184, 2.538412, 0, 0, 0, 1, 1,
0.6750012, -1.341842, 1.542729, 0, 0, 0, 1, 1,
0.6754209, 0.4900862, 2.77033, 0, 0, 0, 1, 1,
0.676174, -0.2139111, -0.7574672, 0, 0, 0, 1, 1,
0.6779036, -1.595179, 2.240647, 1, 1, 1, 1, 1,
0.680034, -0.2284068, 2.132683, 1, 1, 1, 1, 1,
0.6804755, -2.038371, 1.793036, 1, 1, 1, 1, 1,
0.6814336, -0.7349626, 1.267264, 1, 1, 1, 1, 1,
0.6852752, 0.4847752, 2.849253, 1, 1, 1, 1, 1,
0.6878107, 0.3059147, 0.4308729, 1, 1, 1, 1, 1,
0.6943297, 1.155288, 2.145895, 1, 1, 1, 1, 1,
0.7056649, -0.6222653, 2.685785, 1, 1, 1, 1, 1,
0.7082489, -0.08339311, -0.1201021, 1, 1, 1, 1, 1,
0.7093081, -1.485776, 3.788362, 1, 1, 1, 1, 1,
0.7129116, 0.1411508, 0.4736384, 1, 1, 1, 1, 1,
0.7144918, 3.072568, 0.671886, 1, 1, 1, 1, 1,
0.7165982, -0.2413421, 2.279333, 1, 1, 1, 1, 1,
0.7176384, -0.2140702, 2.368586, 1, 1, 1, 1, 1,
0.7229114, -0.737814, 0.8308801, 1, 1, 1, 1, 1,
0.7303113, -0.5848389, 3.183761, 0, 0, 1, 1, 1,
0.7378734, 0.8793823, 2.569667, 1, 0, 0, 1, 1,
0.7413989, 0.3577606, 3.888479, 1, 0, 0, 1, 1,
0.742761, -0.6497188, 1.825386, 1, 0, 0, 1, 1,
0.7466115, -1.053286, 2.476177, 1, 0, 0, 1, 1,
0.74833, 0.6589832, 1.815645, 1, 0, 0, 1, 1,
0.7483701, -1.188434, 3.012469, 0, 0, 0, 1, 1,
0.7516678, -3.328008, 3.292046, 0, 0, 0, 1, 1,
0.7517433, 0.6259037, 3.426275, 0, 0, 0, 1, 1,
0.751914, -0.9396396, 2.988335, 0, 0, 0, 1, 1,
0.7523936, 2.238638, 0.7142138, 0, 0, 0, 1, 1,
0.7593396, 0.1932626, 0.6903553, 0, 0, 0, 1, 1,
0.7647726, -0.4112339, 3.148076, 0, 0, 0, 1, 1,
0.7665424, -0.740891, 2.44872, 1, 1, 1, 1, 1,
0.7679871, -1.841129, 4.090351, 1, 1, 1, 1, 1,
0.7692505, 0.157879, 1.367216, 1, 1, 1, 1, 1,
0.7743167, -0.3318165, 1.156011, 1, 1, 1, 1, 1,
0.7758137, -1.554177, 3.68243, 1, 1, 1, 1, 1,
0.7776821, 0.6278332, 0.06350791, 1, 1, 1, 1, 1,
0.779702, -0.1544065, 2.043612, 1, 1, 1, 1, 1,
0.7809956, -1.847145, 2.971699, 1, 1, 1, 1, 1,
0.7885085, -2.319431, 2.708571, 1, 1, 1, 1, 1,
0.7889801, 1.631921, 0.07767329, 1, 1, 1, 1, 1,
0.7929937, 0.01644248, 0.727973, 1, 1, 1, 1, 1,
0.7954947, -0.6568577, 3.256032, 1, 1, 1, 1, 1,
0.8058298, 1.993839, -1.070508, 1, 1, 1, 1, 1,
0.8058851, 0.5260261, 0.8864667, 1, 1, 1, 1, 1,
0.8068963, -0.8979646, 1.463824, 1, 1, 1, 1, 1,
0.8138773, -0.7461181, 1.125351, 0, 0, 1, 1, 1,
0.8143679, 0.9024271, 1.817509, 1, 0, 0, 1, 1,
0.8152288, 0.9987555, 0.3263908, 1, 0, 0, 1, 1,
0.8169649, 0.5263359, 0.6438487, 1, 0, 0, 1, 1,
0.8201022, -0.5026435, 3.384383, 1, 0, 0, 1, 1,
0.8446661, -0.1253299, 3.142171, 1, 0, 0, 1, 1,
0.8447278, 0.4614486, 1.596124, 0, 0, 0, 1, 1,
0.8450215, 2.385473, 0.9490672, 0, 0, 0, 1, 1,
0.8461178, -0.2558583, 2.200643, 0, 0, 0, 1, 1,
0.8486551, -0.2375708, 1.545116, 0, 0, 0, 1, 1,
0.8534885, -1.079152, 2.050713, 0, 0, 0, 1, 1,
0.8591961, -0.1540156, 2.60869, 0, 0, 0, 1, 1,
0.8601912, -2.066481, 2.302538, 0, 0, 0, 1, 1,
0.8612803, -1.01643, 3.507058, 1, 1, 1, 1, 1,
0.8649207, 0.159284, 2.118268, 1, 1, 1, 1, 1,
0.8654007, -0.1454679, 0.1894444, 1, 1, 1, 1, 1,
0.867011, -1.476493, 4.228016, 1, 1, 1, 1, 1,
0.8680164, -0.3428082, 3.379834, 1, 1, 1, 1, 1,
0.8682531, -0.7668483, 2.230926, 1, 1, 1, 1, 1,
0.8684498, 1.224323, 1.895854, 1, 1, 1, 1, 1,
0.8688875, -0.8807415, 4.20033, 1, 1, 1, 1, 1,
0.8855651, 0.6065617, -0.3657404, 1, 1, 1, 1, 1,
0.8856942, -1.341673, 1.934209, 1, 1, 1, 1, 1,
0.8860819, 0.7626234, 2.775655, 1, 1, 1, 1, 1,
0.8934115, 0.3598038, 2.22375, 1, 1, 1, 1, 1,
0.901253, -2.534199, 3.203649, 1, 1, 1, 1, 1,
0.9012854, 0.08908045, 0.6047445, 1, 1, 1, 1, 1,
0.9027824, -0.9206082, 2.215663, 1, 1, 1, 1, 1,
0.9049662, 1.046662, -0.004625111, 0, 0, 1, 1, 1,
0.9056916, 1.086675, 0.6022923, 1, 0, 0, 1, 1,
0.9093415, 1.013638, 0.6114615, 1, 0, 0, 1, 1,
0.9103213, 1.348861, 0.5529503, 1, 0, 0, 1, 1,
0.9109854, 1.568391, -0.5149537, 1, 0, 0, 1, 1,
0.9127062, -1.092225, 2.314671, 1, 0, 0, 1, 1,
0.9140432, -0.163962, 1.558205, 0, 0, 0, 1, 1,
0.9194217, 0.5695827, 1.949333, 0, 0, 0, 1, 1,
0.9212766, -0.06220074, 0.123, 0, 0, 0, 1, 1,
0.9373236, -0.3291165, 0.5835128, 0, 0, 0, 1, 1,
0.9431, -0.1651579, 2.932421, 0, 0, 0, 1, 1,
0.9437763, -1.47259, 2.428561, 0, 0, 0, 1, 1,
0.9458468, -0.8321559, 0.2832569, 0, 0, 0, 1, 1,
0.9509604, -0.5892224, 2.517547, 1, 1, 1, 1, 1,
0.9517262, -0.4679685, 1.466871, 1, 1, 1, 1, 1,
0.9580018, -0.1092371, 2.88958, 1, 1, 1, 1, 1,
0.9657788, 0.9838789, 2.00193, 1, 1, 1, 1, 1,
0.9670169, -0.5862518, 1.966213, 1, 1, 1, 1, 1,
0.9672291, 0.7004682, 2.99242, 1, 1, 1, 1, 1,
0.9793725, 0.6820637, -1.325533, 1, 1, 1, 1, 1,
0.9859683, -0.5029512, 0.4938296, 1, 1, 1, 1, 1,
0.9938279, -0.01451461, 0.3949864, 1, 1, 1, 1, 1,
0.9965942, -0.05195209, 1.673683, 1, 1, 1, 1, 1,
1.009923, 0.2407726, 1.718864, 1, 1, 1, 1, 1,
1.025361, 1.297884, 0.357414, 1, 1, 1, 1, 1,
1.027132, 0.5167673, 0.1093777, 1, 1, 1, 1, 1,
1.04051, 0.2775255, 2.062383, 1, 1, 1, 1, 1,
1.040814, -0.9878702, 2.120619, 1, 1, 1, 1, 1,
1.042232, 0.1475961, 1.060495, 0, 0, 1, 1, 1,
1.044926, 0.8395883, 0.06881454, 1, 0, 0, 1, 1,
1.051715, 0.1680886, 0.792881, 1, 0, 0, 1, 1,
1.053672, -0.5357357, 2.340688, 1, 0, 0, 1, 1,
1.058876, 0.2253595, 1.662432, 1, 0, 0, 1, 1,
1.061354, -0.04732769, 0.06175219, 1, 0, 0, 1, 1,
1.070577, -1.094585, 2.484195, 0, 0, 0, 1, 1,
1.073702, 0.77905, 1.327355, 0, 0, 0, 1, 1,
1.075938, -0.7629919, 2.688781, 0, 0, 0, 1, 1,
1.076086, -0.009086716, 1.509006, 0, 0, 0, 1, 1,
1.07747, 1.170504, 0.4665059, 0, 0, 0, 1, 1,
1.078195, 0.6265441, 2.450294, 0, 0, 0, 1, 1,
1.081012, -2.282649, 4.016937, 0, 0, 0, 1, 1,
1.081568, 2.674037, -0.1096722, 1, 1, 1, 1, 1,
1.08949, 1.403405, 1.274346, 1, 1, 1, 1, 1,
1.092884, -1.137617, 3.7103, 1, 1, 1, 1, 1,
1.09695, 1.245309, 2.260121, 1, 1, 1, 1, 1,
1.09714, -1.058543, 4.393229, 1, 1, 1, 1, 1,
1.105728, 0.5012885, 2.079162, 1, 1, 1, 1, 1,
1.106534, -0.6555811, 1.790623, 1, 1, 1, 1, 1,
1.119887, 0.2188307, 2.029914, 1, 1, 1, 1, 1,
1.122813, 0.8378499, 0.454241, 1, 1, 1, 1, 1,
1.124566, 0.5487621, 0.2188623, 1, 1, 1, 1, 1,
1.127976, -0.339077, 2.926901, 1, 1, 1, 1, 1,
1.128939, 0.4869075, 0.04117182, 1, 1, 1, 1, 1,
1.130536, -0.7992652, 2.936633, 1, 1, 1, 1, 1,
1.132544, -0.9587276, 2.901814, 1, 1, 1, 1, 1,
1.133907, 0.04380895, 0.7892603, 1, 1, 1, 1, 1,
1.139359, 1.2122, 0.1820616, 0, 0, 1, 1, 1,
1.140389, -1.924393, 1.606329, 1, 0, 0, 1, 1,
1.149148, -0.5455143, 2.588587, 1, 0, 0, 1, 1,
1.149454, -1.511201, 2.426647, 1, 0, 0, 1, 1,
1.15264, 1.021362, 0.547504, 1, 0, 0, 1, 1,
1.153679, 0.5358294, 2.116205, 1, 0, 0, 1, 1,
1.159023, -0.4416924, 2.732863, 0, 0, 0, 1, 1,
1.162487, 1.377601, 0.4425651, 0, 0, 0, 1, 1,
1.162996, -0.8323502, 2.584326, 0, 0, 0, 1, 1,
1.170371, 0.8765963, 1.93036, 0, 0, 0, 1, 1,
1.18899, -0.5080745, 1.176723, 0, 0, 0, 1, 1,
1.190818, 1.498346, 0.3675236, 0, 0, 0, 1, 1,
1.200843, -1.293144, 1.186818, 0, 0, 0, 1, 1,
1.205211, 0.8282297, 0.5497012, 1, 1, 1, 1, 1,
1.205344, 2.307936, 0.3995673, 1, 1, 1, 1, 1,
1.208399, 1.370972, 2.111984, 1, 1, 1, 1, 1,
1.231677, 0.1564412, 3.889557, 1, 1, 1, 1, 1,
1.236454, 0.09331861, 1.073431, 1, 1, 1, 1, 1,
1.244895, 0.04812957, 2.977479, 1, 1, 1, 1, 1,
1.245927, 0.3114731, 0.5744428, 1, 1, 1, 1, 1,
1.245945, 0.03991585, 0.6606035, 1, 1, 1, 1, 1,
1.265273, -0.1754336, 1.610774, 1, 1, 1, 1, 1,
1.277715, 0.2537277, 2.778022, 1, 1, 1, 1, 1,
1.279819, 0.4805772, 0.5071083, 1, 1, 1, 1, 1,
1.288392, -1.890419, 3.161192, 1, 1, 1, 1, 1,
1.302955, -1.260924, 1.561983, 1, 1, 1, 1, 1,
1.303023, -0.1193097, 0.1449512, 1, 1, 1, 1, 1,
1.306397, 0.04259249, 1.579954, 1, 1, 1, 1, 1,
1.314329, 1.321734, 1.472067, 0, 0, 1, 1, 1,
1.315906, 0.01304961, 1.662333, 1, 0, 0, 1, 1,
1.323188, 0.3991877, 0.6152525, 1, 0, 0, 1, 1,
1.324374, 0.977267, 0.9681072, 1, 0, 0, 1, 1,
1.355627, 2.147811, 0.2638285, 1, 0, 0, 1, 1,
1.360754, 1.248721, 0.07100096, 1, 0, 0, 1, 1,
1.36777, 0.2849354, 1.409212, 0, 0, 0, 1, 1,
1.374632, 0.1656331, 1.56283, 0, 0, 0, 1, 1,
1.374899, 0.1599148, 1.948256, 0, 0, 0, 1, 1,
1.383976, 0.9492457, -0.4335516, 0, 0, 0, 1, 1,
1.392992, 0.3782356, 1.841023, 0, 0, 0, 1, 1,
1.400287, 0.7504873, 1.469269, 0, 0, 0, 1, 1,
1.403194, -0.3260829, 2.623572, 0, 0, 0, 1, 1,
1.412858, -1.687051, 1.609557, 1, 1, 1, 1, 1,
1.415027, -0.7318692, 2.15325, 1, 1, 1, 1, 1,
1.439669, -0.1211705, 0.8338581, 1, 1, 1, 1, 1,
1.444534, -0.7129329, 1.984267, 1, 1, 1, 1, 1,
1.446755, -0.1227671, 2.847701, 1, 1, 1, 1, 1,
1.447852, 0.5770113, 2.128269, 1, 1, 1, 1, 1,
1.465071, 0.5489572, 3.58389, 1, 1, 1, 1, 1,
1.476182, 0.1717611, 2.413829, 1, 1, 1, 1, 1,
1.483089, 1.385897, 1.474131, 1, 1, 1, 1, 1,
1.487637, 0.06833218, 2.55828, 1, 1, 1, 1, 1,
1.497833, -0.6278694, 1.08956, 1, 1, 1, 1, 1,
1.50317, 1.634022, 0.3795736, 1, 1, 1, 1, 1,
1.507496, 0.2297649, 0.5470163, 1, 1, 1, 1, 1,
1.513391, -0.6317483, 3.874899, 1, 1, 1, 1, 1,
1.516216, 0.2295945, 0.6785997, 1, 1, 1, 1, 1,
1.519186, 0.1832497, 0.8899002, 0, 0, 1, 1, 1,
1.526355, 0.758509, 1.690822, 1, 0, 0, 1, 1,
1.532442, 0.2187141, 2.526178, 1, 0, 0, 1, 1,
1.538263, -0.05510122, -1.328935, 1, 0, 0, 1, 1,
1.539519, 0.3234271, 2.139208, 1, 0, 0, 1, 1,
1.54476, 0.007582327, 0.4927782, 1, 0, 0, 1, 1,
1.548569, 1.159059, 0.4199088, 0, 0, 0, 1, 1,
1.552501, 0.5296183, 2.43565, 0, 0, 0, 1, 1,
1.568098, 0.7589415, -1.393365, 0, 0, 0, 1, 1,
1.568294, -1.258241, 1.938157, 0, 0, 0, 1, 1,
1.573837, 1.333592, -0.1362353, 0, 0, 0, 1, 1,
1.578491, 0.880878, 0.07043783, 0, 0, 0, 1, 1,
1.582447, 0.980331, -0.2402346, 0, 0, 0, 1, 1,
1.607658, -2.202612, 2.496163, 1, 1, 1, 1, 1,
1.611338, -0.5649464, 1.272603, 1, 1, 1, 1, 1,
1.618365, -1.218246, 1.547164, 1, 1, 1, 1, 1,
1.62234, -0.09388707, 1.805219, 1, 1, 1, 1, 1,
1.633066, 0.5066337, 0.5141705, 1, 1, 1, 1, 1,
1.656665, -0.06208611, 2.412878, 1, 1, 1, 1, 1,
1.662511, -0.4733736, 3.167415, 1, 1, 1, 1, 1,
1.687926, 0.8821386, 2.568757, 1, 1, 1, 1, 1,
1.695343, 1.179851, 1.691524, 1, 1, 1, 1, 1,
1.69775, -1.621926, 3.252142, 1, 1, 1, 1, 1,
1.707005, 0.4700243, 2.60077, 1, 1, 1, 1, 1,
1.712528, -0.3707572, 2.779874, 1, 1, 1, 1, 1,
1.713218, 0.6014, 0.3353111, 1, 1, 1, 1, 1,
1.716172, 0.4379635, 1.084665, 1, 1, 1, 1, 1,
1.733042, 1.216111, 3.213042, 1, 1, 1, 1, 1,
1.739178, -2.007676, 2.629997, 0, 0, 1, 1, 1,
1.745775, -0.4594172, 0.01922155, 1, 0, 0, 1, 1,
1.752144, 2.936179, 0.1535521, 1, 0, 0, 1, 1,
1.753363, 1.132989, 2.107386, 1, 0, 0, 1, 1,
1.754347, -0.3957187, 1.031531, 1, 0, 0, 1, 1,
1.759721, -0.7669928, 2.084888, 1, 0, 0, 1, 1,
1.770575, -0.01057348, 2.661953, 0, 0, 0, 1, 1,
1.775194, 0.8414671, 2.314294, 0, 0, 0, 1, 1,
1.785957, -0.6767682, 2.301146, 0, 0, 0, 1, 1,
1.806682, 1.995601, 1.122824, 0, 0, 0, 1, 1,
1.818409, -0.1789248, 1.901495, 0, 0, 0, 1, 1,
1.846647, -0.7164187, 0.6331224, 0, 0, 0, 1, 1,
1.853139, -0.406366, 0.3343252, 0, 0, 0, 1, 1,
1.858052, -0.6163633, 4.251616, 1, 1, 1, 1, 1,
1.858762, 1.030005, 0.7479575, 1, 1, 1, 1, 1,
1.872698, -0.2783055, -0.5615146, 1, 1, 1, 1, 1,
1.889643, -0.5170671, 1.230734, 1, 1, 1, 1, 1,
1.898191, -0.6766801, 1.202193, 1, 1, 1, 1, 1,
1.912853, 0.3619675, 0.803136, 1, 1, 1, 1, 1,
1.927656, 0.6894271, 0.2844135, 1, 1, 1, 1, 1,
1.928047, 1.386495, 0.9074067, 1, 1, 1, 1, 1,
1.935606, -1.125839, 1.966026, 1, 1, 1, 1, 1,
1.987568, 0.2115324, 1.128719, 1, 1, 1, 1, 1,
1.997478, -0.4181516, 1.627047, 1, 1, 1, 1, 1,
2.037191, -2.712917, 2.838207, 1, 1, 1, 1, 1,
2.039746, 0.5470064, 2.661916, 1, 1, 1, 1, 1,
2.045986, 0.1484722, 1.507989, 1, 1, 1, 1, 1,
2.054565, 1.20783, 1.578388, 1, 1, 1, 1, 1,
2.069101, 0.9183044, 0.1427281, 0, 0, 1, 1, 1,
2.083399, 0.09112021, 3.101318, 1, 0, 0, 1, 1,
2.09389, 1.252993, 2.605265, 1, 0, 0, 1, 1,
2.104053, 0.6901181, 1.762953, 1, 0, 0, 1, 1,
2.126021, -0.801304, 0.9857955, 1, 0, 0, 1, 1,
2.129957, 0.4470499, 2.236217, 1, 0, 0, 1, 1,
2.156528, 1.237369, 2.38343, 0, 0, 0, 1, 1,
2.17347, 0.723311, 3.418292, 0, 0, 0, 1, 1,
2.180428, -0.03098842, 1.50266, 0, 0, 0, 1, 1,
2.213499, -1.45587, 2.384207, 0, 0, 0, 1, 1,
2.30625, -0.5929483, 1.973795, 0, 0, 0, 1, 1,
2.325706, 0.7756305, -0.2899858, 0, 0, 0, 1, 1,
2.377943, 1.17044, 1.966847, 0, 0, 0, 1, 1,
2.400212, -0.8092556, 2.640906, 1, 1, 1, 1, 1,
2.423769, 0.7394134, 3.316815, 1, 1, 1, 1, 1,
2.441732, 0.5772555, 1.444541, 1, 1, 1, 1, 1,
2.669765, -0.1987861, 2.00638, 1, 1, 1, 1, 1,
2.677141, -0.4290454, 1.319662, 1, 1, 1, 1, 1,
2.725921, -1.62577, 1.815327, 1, 1, 1, 1, 1,
2.856603, -0.3558526, 2.043658, 1, 1, 1, 1, 1
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
var radius = 9.476628;
var distance = 33.28625;
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
mvMatrix.translate( 0.3802103, 0.1110446, 0.2718992 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28625);
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