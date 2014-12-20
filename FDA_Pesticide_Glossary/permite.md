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
-3.243641, 0.1775554, -0.9459245, 1, 0, 0, 1,
-3.163003, 0.3922209, 0.2018125, 1, 0.007843138, 0, 1,
-2.859543, -2.560286, -1.265531, 1, 0.01176471, 0, 1,
-2.849658, -1.786284, -1.315484, 1, 0.01960784, 0, 1,
-2.817993, -0.4519757, -1.173507, 1, 0.02352941, 0, 1,
-2.76652, 1.356894, -1.767948, 1, 0.03137255, 0, 1,
-2.741338, -0.5334231, -2.129737, 1, 0.03529412, 0, 1,
-2.732821, -1.369186, -2.038773, 1, 0.04313726, 0, 1,
-2.706069, 0.06486851, -2.010284, 1, 0.04705882, 0, 1,
-2.690349, 0.2839337, -1.116349, 1, 0.05490196, 0, 1,
-2.633916, -1.06066, -2.328134, 1, 0.05882353, 0, 1,
-2.572897, -0.3277287, -1.29674, 1, 0.06666667, 0, 1,
-2.48295, -2.102754, -2.165197, 1, 0.07058824, 0, 1,
-2.454724, -0.2989645, -1.145419, 1, 0.07843138, 0, 1,
-2.427136, -0.3095315, -1.091426, 1, 0.08235294, 0, 1,
-2.391457, -1.385918, -1.887976, 1, 0.09019608, 0, 1,
-2.345706, -0.1732372, -0.1301745, 1, 0.09411765, 0, 1,
-2.284122, 1.362916, -2.180707, 1, 0.1019608, 0, 1,
-2.281955, 0.5195178, -0.8147911, 1, 0.1098039, 0, 1,
-2.266684, -0.3799634, -0.3679208, 1, 0.1137255, 0, 1,
-2.257714, 0.5893013, -1.708513, 1, 0.1215686, 0, 1,
-2.224267, -0.8592612, -1.738855, 1, 0.1254902, 0, 1,
-2.186642, -0.896724, -1.203804, 1, 0.1333333, 0, 1,
-2.181543, -1.346256, -3.490424, 1, 0.1372549, 0, 1,
-2.1802, 0.6981388, -0.9880745, 1, 0.145098, 0, 1,
-2.162992, 1.038344, -2.260468, 1, 0.1490196, 0, 1,
-2.103029, -1.321291, -3.748985, 1, 0.1568628, 0, 1,
-2.050931, 0.4424127, -1.94473, 1, 0.1607843, 0, 1,
-2.045731, 0.9999816, -2.336482, 1, 0.1686275, 0, 1,
-2.01213, 0.8641215, -0.7173625, 1, 0.172549, 0, 1,
-2.001966, 1.751421, -3.037331, 1, 0.1803922, 0, 1,
-1.977723, 0.4348738, -0.5418649, 1, 0.1843137, 0, 1,
-1.933126, 0.3707266, -3.044291, 1, 0.1921569, 0, 1,
-1.911303, -0.52247, -0.8694165, 1, 0.1960784, 0, 1,
-1.910767, 1.695023, -0.04194875, 1, 0.2039216, 0, 1,
-1.899165, 1.573138, 0.08149352, 1, 0.2117647, 0, 1,
-1.898695, -1.706974, -2.073126, 1, 0.2156863, 0, 1,
-1.89407, -0.9894726, -1.870004, 1, 0.2235294, 0, 1,
-1.887843, 0.9560407, -0.2499576, 1, 0.227451, 0, 1,
-1.87437, 0.9806532, -0.9172491, 1, 0.2352941, 0, 1,
-1.829507, -0.8336849, -1.407888, 1, 0.2392157, 0, 1,
-1.808406, 0.389392, -2.092617, 1, 0.2470588, 0, 1,
-1.807702, -0.7374725, -0.3719924, 1, 0.2509804, 0, 1,
-1.804951, 1.733654, -1.658678, 1, 0.2588235, 0, 1,
-1.794204, -1.521129, -1.998901, 1, 0.2627451, 0, 1,
-1.780186, -0.2694773, -0.1126223, 1, 0.2705882, 0, 1,
-1.766071, 0.2945812, 0.4731153, 1, 0.2745098, 0, 1,
-1.735636, -0.7939105, -2.661615, 1, 0.282353, 0, 1,
-1.730471, -0.6521839, -1.829007, 1, 0.2862745, 0, 1,
-1.710267, 0.9517423, -0.7936186, 1, 0.2941177, 0, 1,
-1.700024, 0.3478808, -1.44905, 1, 0.3019608, 0, 1,
-1.692928, -1.210737, -1.50938, 1, 0.3058824, 0, 1,
-1.688638, -1.145866, -2.534933, 1, 0.3137255, 0, 1,
-1.68578, 0.5733608, -0.5086781, 1, 0.3176471, 0, 1,
-1.684448, 0.09782287, -2.747065, 1, 0.3254902, 0, 1,
-1.678079, 0.608891, 0.675353, 1, 0.3294118, 0, 1,
-1.658407, 0.4115953, -2.485361, 1, 0.3372549, 0, 1,
-1.650568, 0.6294143, -1.932093, 1, 0.3411765, 0, 1,
-1.64678, 1.761678, 0.4623996, 1, 0.3490196, 0, 1,
-1.643996, -0.04629837, 0.1270085, 1, 0.3529412, 0, 1,
-1.634873, -1.240864, -2.27776, 1, 0.3607843, 0, 1,
-1.626507, -0.1222671, -2.275826, 1, 0.3647059, 0, 1,
-1.62346, -0.4436664, -0.4545897, 1, 0.372549, 0, 1,
-1.59249, -1.540877, -1.889987, 1, 0.3764706, 0, 1,
-1.587389, 0.3490444, -0.439756, 1, 0.3843137, 0, 1,
-1.579186, 0.5379823, -1.27599, 1, 0.3882353, 0, 1,
-1.559206, 0.07845005, -0.4074478, 1, 0.3960784, 0, 1,
-1.558729, 0.9925136, -0.5121578, 1, 0.4039216, 0, 1,
-1.558311, 0.07688212, -0.05936325, 1, 0.4078431, 0, 1,
-1.553292, -1.14969, -2.561574, 1, 0.4156863, 0, 1,
-1.54316, 0.2375474, -2.616832, 1, 0.4196078, 0, 1,
-1.504505, 0.1679027, -3.638335, 1, 0.427451, 0, 1,
-1.504014, -0.5727585, -2.697595, 1, 0.4313726, 0, 1,
-1.50342, -1.159058, -2.302413, 1, 0.4392157, 0, 1,
-1.501327, -0.7499684, -1.38433, 1, 0.4431373, 0, 1,
-1.460725, -1.756659, -3.549452, 1, 0.4509804, 0, 1,
-1.459451, -0.4555204, -2.048109, 1, 0.454902, 0, 1,
-1.45755, 1.134419, -0.9455479, 1, 0.4627451, 0, 1,
-1.429262, 0.8357674, 0.6846551, 1, 0.4666667, 0, 1,
-1.425626, -1.243469, -1.745302, 1, 0.4745098, 0, 1,
-1.423133, -0.2339561, -1.78858, 1, 0.4784314, 0, 1,
-1.403122, 0.4482574, -1.913359, 1, 0.4862745, 0, 1,
-1.393032, 1.055265, -1.304472, 1, 0.4901961, 0, 1,
-1.392539, -2.642397, -2.934101, 1, 0.4980392, 0, 1,
-1.390971, -0.110635, -2.381583, 1, 0.5058824, 0, 1,
-1.390232, -0.4269456, -1.793525, 1, 0.509804, 0, 1,
-1.388494, 0.6170576, -1.134711, 1, 0.5176471, 0, 1,
-1.378511, -0.7694599, -1.08004, 1, 0.5215687, 0, 1,
-1.376426, -1.879371, -2.337078, 1, 0.5294118, 0, 1,
-1.353164, 0.2949196, -1.362899, 1, 0.5333334, 0, 1,
-1.352841, -0.485884, -1.22628, 1, 0.5411765, 0, 1,
-1.352789, -1.615604, -3.212198, 1, 0.5450981, 0, 1,
-1.345758, 0.03291729, -2.755988, 1, 0.5529412, 0, 1,
-1.337346, -0.1424397, 0.09071996, 1, 0.5568628, 0, 1,
-1.317181, -1.671533, -0.7298179, 1, 0.5647059, 0, 1,
-1.310723, -0.5630566, 0.2896337, 1, 0.5686275, 0, 1,
-1.296577, 0.2301835, 0.4086037, 1, 0.5764706, 0, 1,
-1.29259, -1.431135, -1.299169, 1, 0.5803922, 0, 1,
-1.29069, 1.818137, -1.165128, 1, 0.5882353, 0, 1,
-1.282421, 1.007544, 1.566377, 1, 0.5921569, 0, 1,
-1.2812, 1.671598, -1.338131, 1, 0.6, 0, 1,
-1.272198, 0.6124477, 0.9576465, 1, 0.6078432, 0, 1,
-1.271373, 0.07165887, -1.837555, 1, 0.6117647, 0, 1,
-1.270886, 0.6768354, -0.8455557, 1, 0.6196079, 0, 1,
-1.269645, -0.1032812, -2.443222, 1, 0.6235294, 0, 1,
-1.266595, -0.1240121, -0.1784824, 1, 0.6313726, 0, 1,
-1.253124, 0.06851888, -1.165078, 1, 0.6352941, 0, 1,
-1.247507, -1.898671, -3.153968, 1, 0.6431373, 0, 1,
-1.244977, 0.6091766, -2.14373, 1, 0.6470588, 0, 1,
-1.242894, -1.472684, 0.03542744, 1, 0.654902, 0, 1,
-1.237498, -0.3442003, -0.4071993, 1, 0.6588235, 0, 1,
-1.229091, 0.364065, -0.7026384, 1, 0.6666667, 0, 1,
-1.224266, 0.5074909, -1.361968, 1, 0.6705883, 0, 1,
-1.218054, 0.6343541, -1.126777, 1, 0.6784314, 0, 1,
-1.217295, 0.336348, -1.389095, 1, 0.682353, 0, 1,
-1.207938, 0.3367889, -2.281793, 1, 0.6901961, 0, 1,
-1.202345, -0.3836625, -4.100359, 1, 0.6941177, 0, 1,
-1.196236, -0.6332725, -2.527865, 1, 0.7019608, 0, 1,
-1.180311, -1.539591, -2.249329, 1, 0.7098039, 0, 1,
-1.176444, -1.205717, -2.606106, 1, 0.7137255, 0, 1,
-1.176013, -0.9860945, -2.486118, 1, 0.7215686, 0, 1,
-1.17376, -1.087543, -1.082144, 1, 0.7254902, 0, 1,
-1.172698, -0.3696694, 0.0693019, 1, 0.7333333, 0, 1,
-1.17165, 1.333245, 0.5566764, 1, 0.7372549, 0, 1,
-1.170901, -0.2548138, -1.120501, 1, 0.7450981, 0, 1,
-1.169939, -0.12331, -0.9300686, 1, 0.7490196, 0, 1,
-1.164687, -0.5203261, -1.982377, 1, 0.7568628, 0, 1,
-1.164308, 0.4725911, -2.051584, 1, 0.7607843, 0, 1,
-1.164164, 0.9936898, -2.429445, 1, 0.7686275, 0, 1,
-1.162126, 0.6975758, -1.949894, 1, 0.772549, 0, 1,
-1.147784, -0.1073726, -1.3005, 1, 0.7803922, 0, 1,
-1.134352, 0.3716854, -1.36287, 1, 0.7843137, 0, 1,
-1.125864, -0.9177688, -1.72054, 1, 0.7921569, 0, 1,
-1.116159, 0.994141, -2.571192, 1, 0.7960784, 0, 1,
-1.113105, 0.427404, -0.2635891, 1, 0.8039216, 0, 1,
-1.111111, 1.370599, -0.4711421, 1, 0.8117647, 0, 1,
-1.104809, -0.3064761, -1.61646, 1, 0.8156863, 0, 1,
-1.100109, -0.6222588, -4.352676, 1, 0.8235294, 0, 1,
-1.100041, 0.1321784, -2.027108, 1, 0.827451, 0, 1,
-1.091782, 0.07359297, -3.88085, 1, 0.8352941, 0, 1,
-1.083874, -1.826421, -1.456797, 1, 0.8392157, 0, 1,
-1.082558, 0.5966541, -1.887071, 1, 0.8470588, 0, 1,
-1.080628, -0.9800875, -2.545758, 1, 0.8509804, 0, 1,
-1.080294, 1.16438, -1.501142, 1, 0.8588235, 0, 1,
-1.071635, 0.8582437, -1.228201, 1, 0.8627451, 0, 1,
-1.068434, -0.05402654, -1.241963, 1, 0.8705882, 0, 1,
-1.057206, -1.22687, -0.8307897, 1, 0.8745098, 0, 1,
-1.054379, 0.3661662, -2.655489, 1, 0.8823529, 0, 1,
-1.053028, -0.7476621, -3.213338, 1, 0.8862745, 0, 1,
-1.051383, 0.6030388, -0.9261966, 1, 0.8941177, 0, 1,
-1.051, 0.4551901, -2.878098, 1, 0.8980392, 0, 1,
-1.047183, 0.9262722, 0.1037622, 1, 0.9058824, 0, 1,
-1.046097, -0.9310986, -0.4361942, 1, 0.9137255, 0, 1,
-1.034784, 1.172044, -0.7676011, 1, 0.9176471, 0, 1,
-1.027797, -0.1042209, -0.225357, 1, 0.9254902, 0, 1,
-1.020605, -1.100417, -2.02179, 1, 0.9294118, 0, 1,
-1.007446, 1.075912, -0.7955486, 1, 0.9372549, 0, 1,
-1.007342, -0.05859622, -2.822127, 1, 0.9411765, 0, 1,
-0.998755, 0.8632483, -2.312477, 1, 0.9490196, 0, 1,
-0.9978071, -0.7633023, -1.118143, 1, 0.9529412, 0, 1,
-0.9912944, 1.613113, -1.709909, 1, 0.9607843, 0, 1,
-0.9893131, 0.3975237, 0.2701162, 1, 0.9647059, 0, 1,
-0.989056, 0.2413909, -0.7508919, 1, 0.972549, 0, 1,
-0.9865239, -0.6585171, -3.23475, 1, 0.9764706, 0, 1,
-0.9792104, -0.3317197, -2.286206, 1, 0.9843137, 0, 1,
-0.976831, -0.4884497, -1.882122, 1, 0.9882353, 0, 1,
-0.9740193, -1.742916, -4.588813, 1, 0.9960784, 0, 1,
-0.969029, 2.630584, 1.081028, 0.9960784, 1, 0, 1,
-0.962552, 1.142333, -3.040689, 0.9921569, 1, 0, 1,
-0.9582239, 1.235291, -0.04084162, 0.9843137, 1, 0, 1,
-0.9495687, 0.6757407, -1.365622, 0.9803922, 1, 0, 1,
-0.9413125, -0.9414762, -1.174951, 0.972549, 1, 0, 1,
-0.934711, 0.1499366, -2.095425, 0.9686275, 1, 0, 1,
-0.934589, 0.4020894, -1.301908, 0.9607843, 1, 0, 1,
-0.9221559, 2.156234, -0.02792305, 0.9568627, 1, 0, 1,
-0.9212227, -0.674306, -2.449284, 0.9490196, 1, 0, 1,
-0.9191741, 0.8971229, -2.213423, 0.945098, 1, 0, 1,
-0.9160144, 0.21381, -1.5113, 0.9372549, 1, 0, 1,
-0.9157975, -1.412383, -2.612896, 0.9333333, 1, 0, 1,
-0.9114631, 0.7416834, -0.6695468, 0.9254902, 1, 0, 1,
-0.9109809, -0.6064318, -1.551327, 0.9215686, 1, 0, 1,
-0.908116, -0.5615294, -2.416102, 0.9137255, 1, 0, 1,
-0.9034706, -0.6493721, 0.2166854, 0.9098039, 1, 0, 1,
-0.9017829, -1.412806, -2.224558, 0.9019608, 1, 0, 1,
-0.9012071, 0.0361441, -1.307596, 0.8941177, 1, 0, 1,
-0.9001881, -1.779459, -3.506728, 0.8901961, 1, 0, 1,
-0.8984767, 0.3735843, -0.8966425, 0.8823529, 1, 0, 1,
-0.8971555, 0.1731798, -2.082798, 0.8784314, 1, 0, 1,
-0.8925372, 0.8916562, -1.438383, 0.8705882, 1, 0, 1,
-0.8893049, -0.3633071, -0.08252795, 0.8666667, 1, 0, 1,
-0.8849455, -1.826257, -1.548418, 0.8588235, 1, 0, 1,
-0.880281, 1.473769, 0.09767184, 0.854902, 1, 0, 1,
-0.8787054, -0.3365214, -2.347257, 0.8470588, 1, 0, 1,
-0.8784621, 0.03315515, -0.8939696, 0.8431373, 1, 0, 1,
-0.875118, 0.8998124, -1.268444, 0.8352941, 1, 0, 1,
-0.8731917, 0.1708997, -1.048975, 0.8313726, 1, 0, 1,
-0.8719627, 1.103544, -0.2155868, 0.8235294, 1, 0, 1,
-0.8674538, 0.3050177, -0.5168306, 0.8196079, 1, 0, 1,
-0.8632979, -0.6286103, -3.082606, 0.8117647, 1, 0, 1,
-0.8502384, -1.256459, -4.117936, 0.8078431, 1, 0, 1,
-0.8491564, 1.455167, -2.05336, 0.8, 1, 0, 1,
-0.8479167, 0.4263637, -1.835659, 0.7921569, 1, 0, 1,
-0.8398418, -0.007737682, -1.551059, 0.7882353, 1, 0, 1,
-0.8387924, -1.897175, -2.666858, 0.7803922, 1, 0, 1,
-0.8358113, 1.195071, -0.1589149, 0.7764706, 1, 0, 1,
-0.8329641, 0.6028807, -0.7048903, 0.7686275, 1, 0, 1,
-0.8217267, -0.2117067, -1.110627, 0.7647059, 1, 0, 1,
-0.8192582, 0.9934973, -1.012929, 0.7568628, 1, 0, 1,
-0.8174846, -0.1151081, -0.4528415, 0.7529412, 1, 0, 1,
-0.8166982, 0.4931117, 0.001269221, 0.7450981, 1, 0, 1,
-0.8080988, -0.4217395, -1.629013, 0.7411765, 1, 0, 1,
-0.8070361, 1.239127, 0.6382901, 0.7333333, 1, 0, 1,
-0.8046441, 0.1480733, -0.05715273, 0.7294118, 1, 0, 1,
-0.804371, 0.3860305, -0.1953822, 0.7215686, 1, 0, 1,
-0.8003626, -0.8918734, -1.406944, 0.7176471, 1, 0, 1,
-0.7971225, -0.8325372, -0.2204296, 0.7098039, 1, 0, 1,
-0.77763, 0.1138684, -1.402955, 0.7058824, 1, 0, 1,
-0.7773381, 0.5558612, -2.607498, 0.6980392, 1, 0, 1,
-0.7690856, -2.138378, -1.581043, 0.6901961, 1, 0, 1,
-0.7650567, -0.2227806, -1.28158, 0.6862745, 1, 0, 1,
-0.7645808, -1.132592, -5.061741, 0.6784314, 1, 0, 1,
-0.7640573, 0.553745, 0.0003819178, 0.6745098, 1, 0, 1,
-0.7529446, 0.3611906, -1.873749, 0.6666667, 1, 0, 1,
-0.7515773, -0.02963953, -1.300213, 0.6627451, 1, 0, 1,
-0.7445632, 0.685717, -0.9363912, 0.654902, 1, 0, 1,
-0.7388644, 1.578495, 2.442916, 0.6509804, 1, 0, 1,
-0.7350604, 0.6914808, -1.403317, 0.6431373, 1, 0, 1,
-0.7279424, -0.2974454, -2.49713, 0.6392157, 1, 0, 1,
-0.7277313, -0.007795791, -2.773954, 0.6313726, 1, 0, 1,
-0.7266384, 0.2515949, 0.1426876, 0.627451, 1, 0, 1,
-0.7244797, -0.1070244, -0.7009308, 0.6196079, 1, 0, 1,
-0.7206351, 1.221949, -2.983186, 0.6156863, 1, 0, 1,
-0.7201855, -0.1428781, -1.293432, 0.6078432, 1, 0, 1,
-0.718434, 0.6247082, -0.09098157, 0.6039216, 1, 0, 1,
-0.7176558, -0.6805624, -4.171185, 0.5960785, 1, 0, 1,
-0.7151368, -0.7918568, -2.17104, 0.5882353, 1, 0, 1,
-0.7114198, 0.317321, -0.1854385, 0.5843138, 1, 0, 1,
-0.7070971, 0.05935096, -1.250441, 0.5764706, 1, 0, 1,
-0.7036817, 0.6774745, -0.7305544, 0.572549, 1, 0, 1,
-0.7031016, -1.543982, -1.719945, 0.5647059, 1, 0, 1,
-0.7024639, 0.2774763, -0.997385, 0.5607843, 1, 0, 1,
-0.6999267, 2.021984, 0.3582138, 0.5529412, 1, 0, 1,
-0.6988501, 0.882432, 0.9672092, 0.5490196, 1, 0, 1,
-0.6932086, -0.6987023, -2.257502, 0.5411765, 1, 0, 1,
-0.6931129, 1.099012, -1.437237, 0.5372549, 1, 0, 1,
-0.6920204, -0.6004019, -2.026103, 0.5294118, 1, 0, 1,
-0.6901239, 0.775492, -1.452677, 0.5254902, 1, 0, 1,
-0.6869217, -0.9264858, -4.676989, 0.5176471, 1, 0, 1,
-0.6827975, -1.460203, -1.316281, 0.5137255, 1, 0, 1,
-0.6823893, 0.423643, 0.05143641, 0.5058824, 1, 0, 1,
-0.676813, -0.3669743, -3.062526, 0.5019608, 1, 0, 1,
-0.6765795, 0.1055971, 1.512002, 0.4941176, 1, 0, 1,
-0.6738763, 0.5686215, -0.8292139, 0.4862745, 1, 0, 1,
-0.6720196, 0.6228119, -1.139407, 0.4823529, 1, 0, 1,
-0.6649905, -0.4519928, -3.129064, 0.4745098, 1, 0, 1,
-0.6643442, 0.2523888, -0.302783, 0.4705882, 1, 0, 1,
-0.6599746, -0.04817707, -3.12095, 0.4627451, 1, 0, 1,
-0.6495095, -0.2585328, -3.199578, 0.4588235, 1, 0, 1,
-0.6406642, -2.13786, -3.438496, 0.4509804, 1, 0, 1,
-0.63767, 1.614723, 0.5070912, 0.4470588, 1, 0, 1,
-0.6304473, -1.39892, -1.203883, 0.4392157, 1, 0, 1,
-0.6282561, -0.7495783, -3.25941, 0.4352941, 1, 0, 1,
-0.6280136, -0.4206023, -2.959248, 0.427451, 1, 0, 1,
-0.6226149, 0.5677985, -0.4078245, 0.4235294, 1, 0, 1,
-0.6224961, 0.5004222, -1.144602, 0.4156863, 1, 0, 1,
-0.6214998, 0.7870637, 0.9357098, 0.4117647, 1, 0, 1,
-0.6204791, -1.045052, -1.712681, 0.4039216, 1, 0, 1,
-0.6155607, -0.3125646, -1.556852, 0.3960784, 1, 0, 1,
-0.6115653, 0.7100761, -1.165768, 0.3921569, 1, 0, 1,
-0.6113297, -0.967265, -2.223694, 0.3843137, 1, 0, 1,
-0.5996456, -0.1853546, -1.119877, 0.3803922, 1, 0, 1,
-0.5961804, -0.528199, -1.091357, 0.372549, 1, 0, 1,
-0.592303, 1.132434, -0.2153268, 0.3686275, 1, 0, 1,
-0.5909752, 0.7014406, -0.3160786, 0.3607843, 1, 0, 1,
-0.5884072, 1.152809, 0.7970447, 0.3568628, 1, 0, 1,
-0.5875957, 0.8802714, -0.4298854, 0.3490196, 1, 0, 1,
-0.5830291, 1.139621, -0.1099043, 0.345098, 1, 0, 1,
-0.5823124, 0.1710695, -1.268538, 0.3372549, 1, 0, 1,
-0.5750652, 1.476274, 0.7650186, 0.3333333, 1, 0, 1,
-0.5728535, -0.2390026, -0.634784, 0.3254902, 1, 0, 1,
-0.5691146, 0.9684576, -1.48213, 0.3215686, 1, 0, 1,
-0.5686777, 0.4849144, -2.695904, 0.3137255, 1, 0, 1,
-0.5678826, 0.09483032, -1.638043, 0.3098039, 1, 0, 1,
-0.5663078, 1.721306, -1.434245, 0.3019608, 1, 0, 1,
-0.5659935, -0.3288874, -3.202262, 0.2941177, 1, 0, 1,
-0.5632975, 0.2657796, -0.4163227, 0.2901961, 1, 0, 1,
-0.5626776, 0.8599665, 0.05544376, 0.282353, 1, 0, 1,
-0.5546548, -0.4507726, -2.919793, 0.2784314, 1, 0, 1,
-0.5438628, -0.06372682, -0.4629186, 0.2705882, 1, 0, 1,
-0.5429526, -1.480657, -1.339015, 0.2666667, 1, 0, 1,
-0.5425602, -0.2711039, -2.383226, 0.2588235, 1, 0, 1,
-0.5390794, -0.157825, -2.895512, 0.254902, 1, 0, 1,
-0.5293558, -1.073346, -2.146174, 0.2470588, 1, 0, 1,
-0.5275069, 0.9148363, 0.3911045, 0.2431373, 1, 0, 1,
-0.5264059, 0.7286881, -0.8670231, 0.2352941, 1, 0, 1,
-0.5209121, 0.6659627, -0.3168341, 0.2313726, 1, 0, 1,
-0.5177836, -0.5115187, -2.572138, 0.2235294, 1, 0, 1,
-0.5125783, 0.831623, -1.479529, 0.2196078, 1, 0, 1,
-0.5008922, -2.784205, -2.065072, 0.2117647, 1, 0, 1,
-0.4987538, -0.6905795, -3.692997, 0.2078431, 1, 0, 1,
-0.4982331, 0.9378639, -1.13631, 0.2, 1, 0, 1,
-0.4975624, -0.4244978, -3.168413, 0.1921569, 1, 0, 1,
-0.4967727, 0.681975, 0.7361913, 0.1882353, 1, 0, 1,
-0.4935907, 1.105195, 0.8581989, 0.1803922, 1, 0, 1,
-0.4917984, 0.2748537, -1.211349, 0.1764706, 1, 0, 1,
-0.490684, -1.750264, -3.580428, 0.1686275, 1, 0, 1,
-0.4857921, -0.5378497, -2.52823, 0.1647059, 1, 0, 1,
-0.4839701, -1.00172, -2.951443, 0.1568628, 1, 0, 1,
-0.4829879, 0.5466118, -1.779286, 0.1529412, 1, 0, 1,
-0.4828465, -0.03738222, -0.621834, 0.145098, 1, 0, 1,
-0.4813326, 0.2413414, -0.246002, 0.1411765, 1, 0, 1,
-0.4810434, -0.9728954, -2.415571, 0.1333333, 1, 0, 1,
-0.4797201, 0.04980497, -1.700552, 0.1294118, 1, 0, 1,
-0.4725842, -0.4113357, -5.302206, 0.1215686, 1, 0, 1,
-0.4709646, -0.1082902, -1.111858, 0.1176471, 1, 0, 1,
-0.4704718, -0.274352, -2.079033, 0.1098039, 1, 0, 1,
-0.4688708, 0.1863009, -2.121436, 0.1058824, 1, 0, 1,
-0.4626242, 1.047269, 0.5006712, 0.09803922, 1, 0, 1,
-0.437735, 0.9442606, -0.0335692, 0.09019608, 1, 0, 1,
-0.4307482, -0.9060553, -2.219511, 0.08627451, 1, 0, 1,
-0.429664, 0.9627777, -0.7004871, 0.07843138, 1, 0, 1,
-0.4267504, -0.0239368, -4.811594, 0.07450981, 1, 0, 1,
-0.4255882, 2.329458, -1.437445, 0.06666667, 1, 0, 1,
-0.4231644, -0.04542926, -2.584314, 0.0627451, 1, 0, 1,
-0.4221347, -0.2551109, -0.8415818, 0.05490196, 1, 0, 1,
-0.4216632, 0.2504362, -0.6437777, 0.05098039, 1, 0, 1,
-0.4200762, -0.4802015, -4.286723, 0.04313726, 1, 0, 1,
-0.4187188, -0.1324476, -1.706348, 0.03921569, 1, 0, 1,
-0.4172876, -0.5455934, -2.097407, 0.03137255, 1, 0, 1,
-0.417212, -0.5838676, -3.472695, 0.02745098, 1, 0, 1,
-0.4139817, -0.2446804, -1.322561, 0.01960784, 1, 0, 1,
-0.4110372, 2.459424, 0.2670489, 0.01568628, 1, 0, 1,
-0.4093843, 0.122968, -0.6262507, 0.007843138, 1, 0, 1,
-0.4076535, -0.1222794, -2.363561, 0.003921569, 1, 0, 1,
-0.4029382, -2.214775, -2.55726, 0, 1, 0.003921569, 1,
-0.4011619, -2.367882, -2.955471, 0, 1, 0.01176471, 1,
-0.3978852, -1.130524, -1.427675, 0, 1, 0.01568628, 1,
-0.3956813, -0.8331306, -2.50131, 0, 1, 0.02352941, 1,
-0.3938835, 1.017681, -1.572747, 0, 1, 0.02745098, 1,
-0.3929068, 0.5058157, -0.6415508, 0, 1, 0.03529412, 1,
-0.3910877, -0.937058, -1.4561, 0, 1, 0.03921569, 1,
-0.3909808, 0.3896039, -2.639281, 0, 1, 0.04705882, 1,
-0.3886394, -0.2354694, -2.387472, 0, 1, 0.05098039, 1,
-0.387152, 1.366761, 0.6382321, 0, 1, 0.05882353, 1,
-0.3841699, 0.9540861, 0.2561215, 0, 1, 0.0627451, 1,
-0.3809085, -2.42938, -3.665413, 0, 1, 0.07058824, 1,
-0.379709, 0.5288414, 0.2549134, 0, 1, 0.07450981, 1,
-0.3792179, -0.0008679469, 0.4829302, 0, 1, 0.08235294, 1,
-0.3719889, 0.3394851, -1.410574, 0, 1, 0.08627451, 1,
-0.3708157, 0.2923894, -0.188741, 0, 1, 0.09411765, 1,
-0.3617636, -0.4503773, -4.034286, 0, 1, 0.1019608, 1,
-0.361019, 0.7625747, -0.4010153, 0, 1, 0.1058824, 1,
-0.3579819, 0.5668352, -1.689449, 0, 1, 0.1137255, 1,
-0.3574136, 0.8626444, -0.6299213, 0, 1, 0.1176471, 1,
-0.3562422, -3.284842, -4.417101, 0, 1, 0.1254902, 1,
-0.3518624, -0.11009, -1.451611, 0, 1, 0.1294118, 1,
-0.3517083, -0.7816009, -1.279692, 0, 1, 0.1372549, 1,
-0.3488311, 0.6057582, -0.1516915, 0, 1, 0.1411765, 1,
-0.3450813, -0.5986268, -4.866559, 0, 1, 0.1490196, 1,
-0.3435775, 0.02326667, -1.576407, 0, 1, 0.1529412, 1,
-0.3434614, -0.1420899, -1.362863, 0, 1, 0.1607843, 1,
-0.3431596, -0.8885835, -0.4567719, 0, 1, 0.1647059, 1,
-0.339816, -0.2029578, -3.08334, 0, 1, 0.172549, 1,
-0.3377252, -1.814293, -2.172463, 0, 1, 0.1764706, 1,
-0.3356444, -2.398138, -1.235863, 0, 1, 0.1843137, 1,
-0.332931, 0.1160284, -0.7999192, 0, 1, 0.1882353, 1,
-0.3303484, 0.7797964, 0.1189086, 0, 1, 0.1960784, 1,
-0.3278767, 0.8103587, -0.2144448, 0, 1, 0.2039216, 1,
-0.3272366, -0.5099628, -1.70568, 0, 1, 0.2078431, 1,
-0.3245835, -0.1349155, 0.146211, 0, 1, 0.2156863, 1,
-0.3240688, -1.151187, -2.537997, 0, 1, 0.2196078, 1,
-0.322603, -0.2285348, -1.765602, 0, 1, 0.227451, 1,
-0.3219137, 1.045761, -1.82486, 0, 1, 0.2313726, 1,
-0.3203619, -1.090729, -1.642961, 0, 1, 0.2392157, 1,
-0.3175467, 1.67662, 0.9122511, 0, 1, 0.2431373, 1,
-0.3157035, -0.09253604, -1.476043, 0, 1, 0.2509804, 1,
-0.3105081, -0.3531426, -1.558332, 0, 1, 0.254902, 1,
-0.3070014, -2.380996, -2.035322, 0, 1, 0.2627451, 1,
-0.3068079, -0.4177341, -3.013474, 0, 1, 0.2666667, 1,
-0.3045794, -0.06952297, -2.314207, 0, 1, 0.2745098, 1,
-0.2993117, -0.5632122, -1.550943, 0, 1, 0.2784314, 1,
-0.2977519, -1.063237, -3.976562, 0, 1, 0.2862745, 1,
-0.296877, -0.9415854, -2.6404, 0, 1, 0.2901961, 1,
-0.2896867, -2.571887, -4.903836, 0, 1, 0.2980392, 1,
-0.2865739, 0.4981186, -0.3886245, 0, 1, 0.3058824, 1,
-0.2861595, 0.4668329, -1.03964, 0, 1, 0.3098039, 1,
-0.2818436, -2.57232, -3.049675, 0, 1, 0.3176471, 1,
-0.2802433, -0.4376671, -0.9144593, 0, 1, 0.3215686, 1,
-0.2801496, 1.106847, -0.8251271, 0, 1, 0.3294118, 1,
-0.2790232, 0.04882317, -0.6669233, 0, 1, 0.3333333, 1,
-0.2746269, 0.5845122, -1.291933, 0, 1, 0.3411765, 1,
-0.273354, -1.426872, -2.040167, 0, 1, 0.345098, 1,
-0.2715951, -0.05356641, -3.03134, 0, 1, 0.3529412, 1,
-0.2697041, -0.9924435, -1.907727, 0, 1, 0.3568628, 1,
-0.2685582, -1.624537, -4.243046, 0, 1, 0.3647059, 1,
-0.2662733, 1.94445, -0.8902411, 0, 1, 0.3686275, 1,
-0.2662556, 1.029034, 1.881931, 0, 1, 0.3764706, 1,
-0.262363, 0.02511467, -1.903676, 0, 1, 0.3803922, 1,
-0.2596352, -0.2994702, -2.536728, 0, 1, 0.3882353, 1,
-0.2559658, 2.374873, 0.8541435, 0, 1, 0.3921569, 1,
-0.2488739, -1.577696, -4.757246, 0, 1, 0.4, 1,
-0.2475893, 0.7269955, -1.276535, 0, 1, 0.4078431, 1,
-0.2474989, -2.657104, -4.318468, 0, 1, 0.4117647, 1,
-0.2452734, 1.615964, -0.7809943, 0, 1, 0.4196078, 1,
-0.2444744, -0.1098547, -0.9262363, 0, 1, 0.4235294, 1,
-0.242494, -1.451318, -2.770183, 0, 1, 0.4313726, 1,
-0.2420881, -1.099622, -2.852339, 0, 1, 0.4352941, 1,
-0.2418474, 0.237261, -1.976252, 0, 1, 0.4431373, 1,
-0.2409813, 0.2427958, -2.60825, 0, 1, 0.4470588, 1,
-0.2311864, -1.850252, -4.130115, 0, 1, 0.454902, 1,
-0.2252676, -0.3577748, -1.175532, 0, 1, 0.4588235, 1,
-0.2243961, 1.107517, 1.176805, 0, 1, 0.4666667, 1,
-0.2219252, 0.6993409, 0.8417751, 0, 1, 0.4705882, 1,
-0.2208541, -0.3118825, -2.661255, 0, 1, 0.4784314, 1,
-0.2207001, 0.8228394, -0.9530975, 0, 1, 0.4823529, 1,
-0.2179346, 0.6204389, -1.834969, 0, 1, 0.4901961, 1,
-0.2175941, -1.906432, -6.626216, 0, 1, 0.4941176, 1,
-0.2114876, -1.464297, -4.235529, 0, 1, 0.5019608, 1,
-0.2108377, 0.3576973, -0.2652482, 0, 1, 0.509804, 1,
-0.2104467, 0.1043004, 0.6213033, 0, 1, 0.5137255, 1,
-0.209262, 0.8214744, -1.219036, 0, 1, 0.5215687, 1,
-0.2074512, -0.5766062, -1.645716, 0, 1, 0.5254902, 1,
-0.2041984, 0.8649186, 0.8455027, 0, 1, 0.5333334, 1,
-0.2005068, -0.6818876, -0.7778051, 0, 1, 0.5372549, 1,
-0.1981149, -0.249696, -4.142727, 0, 1, 0.5450981, 1,
-0.1973739, -1.138424, -3.868692, 0, 1, 0.5490196, 1,
-0.1918074, -0.6047523, -2.556132, 0, 1, 0.5568628, 1,
-0.1872333, 1.134265, 1.804786, 0, 1, 0.5607843, 1,
-0.1794824, 0.309506, 0.660963, 0, 1, 0.5686275, 1,
-0.1782861, -0.438655, -3.456501, 0, 1, 0.572549, 1,
-0.1776434, 0.06461896, -2.235927, 0, 1, 0.5803922, 1,
-0.1757021, -0.4220761, -2.923078, 0, 1, 0.5843138, 1,
-0.1749991, -0.8481654, -4.647198, 0, 1, 0.5921569, 1,
-0.1736067, 0.6134143, 0.4224308, 0, 1, 0.5960785, 1,
-0.172879, 0.4327591, -1.050485, 0, 1, 0.6039216, 1,
-0.1723536, 0.2200853, -1.902308, 0, 1, 0.6117647, 1,
-0.1714411, 0.1785598, -1.178843, 0, 1, 0.6156863, 1,
-0.1668785, 0.337685, 2.19468, 0, 1, 0.6235294, 1,
-0.1634316, -0.9884748, -2.493015, 0, 1, 0.627451, 1,
-0.1612283, 0.4377713, 0.2606672, 0, 1, 0.6352941, 1,
-0.1605313, 0.2663578, 0.4248243, 0, 1, 0.6392157, 1,
-0.1593451, -0.6821086, -0.6206318, 0, 1, 0.6470588, 1,
-0.1564918, 0.3352366, -1.000371, 0, 1, 0.6509804, 1,
-0.156198, 0.177701, -1.119014, 0, 1, 0.6588235, 1,
-0.1537753, 1.009381, -1.053965, 0, 1, 0.6627451, 1,
-0.152769, -0.4480142, -2.983202, 0, 1, 0.6705883, 1,
-0.1467938, -0.3578495, -3.25323, 0, 1, 0.6745098, 1,
-0.1446465, 0.4372024, -1.681517, 0, 1, 0.682353, 1,
-0.1443608, 0.6821192, -1.506392, 0, 1, 0.6862745, 1,
-0.1429689, -0.8412938, -2.809354, 0, 1, 0.6941177, 1,
-0.1344977, 1.828894, -1.422763, 0, 1, 0.7019608, 1,
-0.1326085, 0.5852762, 2.475123, 0, 1, 0.7058824, 1,
-0.1306401, -0.6740894, -4.661836, 0, 1, 0.7137255, 1,
-0.1291302, -0.08877494, -1.883325, 0, 1, 0.7176471, 1,
-0.123982, 1.696105, -0.1136531, 0, 1, 0.7254902, 1,
-0.123281, 0.7669491, 0.05514447, 0, 1, 0.7294118, 1,
-0.122048, 0.6819718, 1.107497, 0, 1, 0.7372549, 1,
-0.1209766, 1.664575, -1.027609, 0, 1, 0.7411765, 1,
-0.1207495, 1.616441, 0.5478588, 0, 1, 0.7490196, 1,
-0.1197897, 0.0005184343, -2.532919, 0, 1, 0.7529412, 1,
-0.1190412, 0.6647989, -0.9773085, 0, 1, 0.7607843, 1,
-0.1132968, 0.5422438, -1.489077, 0, 1, 0.7647059, 1,
-0.112342, -1.0677, -3.680449, 0, 1, 0.772549, 1,
-0.1059812, 0.4132188, -0.3472319, 0, 1, 0.7764706, 1,
-0.09732675, 1.974776, 0.1424886, 0, 1, 0.7843137, 1,
-0.09409933, -1.050885, -2.311129, 0, 1, 0.7882353, 1,
-0.09288174, -0.9036162, -3.693635, 0, 1, 0.7960784, 1,
-0.09191266, -0.5781696, -2.274822, 0, 1, 0.8039216, 1,
-0.08911648, -0.1470173, -3.16717, 0, 1, 0.8078431, 1,
-0.08848594, 0.5713151, 1.02694, 0, 1, 0.8156863, 1,
-0.08661989, 0.1160464, -0.7217119, 0, 1, 0.8196079, 1,
-0.08560259, -0.518332, -2.808829, 0, 1, 0.827451, 1,
-0.08334294, -1.028485, -3.770409, 0, 1, 0.8313726, 1,
-0.06877989, 0.4866794, 0.4943693, 0, 1, 0.8392157, 1,
-0.06823795, 2.214507, 0.6868308, 0, 1, 0.8431373, 1,
-0.06759748, -0.4298597, -4.058577, 0, 1, 0.8509804, 1,
-0.06460559, -0.03426198, -1.542903, 0, 1, 0.854902, 1,
-0.05917278, 1.644741, 0.1719767, 0, 1, 0.8627451, 1,
-0.05824287, 0.6761599, 0.1593284, 0, 1, 0.8666667, 1,
-0.05384678, 0.6179851, 0.1381144, 0, 1, 0.8745098, 1,
-0.04147428, -0.3240751, -2.513125, 0, 1, 0.8784314, 1,
-0.03928124, 0.1909989, 1.208804, 0, 1, 0.8862745, 1,
-0.039264, 1.54119, 0.4036142, 0, 1, 0.8901961, 1,
-0.03902139, -1.042835, -2.607968, 0, 1, 0.8980392, 1,
-0.03728613, 0.6221881, -0.2053523, 0, 1, 0.9058824, 1,
-0.03199283, -0.3824499, -4.174549, 0, 1, 0.9098039, 1,
-0.03085558, -0.06069605, -2.83586, 0, 1, 0.9176471, 1,
-0.02922699, -1.459339, -2.726507, 0, 1, 0.9215686, 1,
-0.02806906, 1.537231, 1.422132, 0, 1, 0.9294118, 1,
-0.02724065, -2.36535, -5.033967, 0, 1, 0.9333333, 1,
-0.02538706, 0.3834878, -0.8680607, 0, 1, 0.9411765, 1,
-0.02111554, 1.725443, 0.6746601, 0, 1, 0.945098, 1,
-0.01519522, 0.4029548, -1.087932, 0, 1, 0.9529412, 1,
-0.009966003, -0.6745129, -1.879598, 0, 1, 0.9568627, 1,
-0.007968885, -0.132252, -3.0416, 0, 1, 0.9647059, 1,
-0.005582319, -2.058719, -3.295587, 0, 1, 0.9686275, 1,
-0.003981687, 0.4101875, 0.7671387, 0, 1, 0.9764706, 1,
-0.003250496, -1.238546, -3.414264, 0, 1, 0.9803922, 1,
-0.002898206, 1.156509, 0.8986273, 0, 1, 0.9882353, 1,
-0.001727079, 0.3865007, 1.923749, 0, 1, 0.9921569, 1,
-0.0001303473, 0.8082611, 1.141625, 0, 1, 1, 1,
0.006127149, 0.9645287, 1.281117, 0, 0.9921569, 1, 1,
0.007502224, -0.2585045, 4.911571, 0, 0.9882353, 1, 1,
0.009437548, -0.1865962, 1.706035, 0, 0.9803922, 1, 1,
0.01133719, -0.4338107, 3.95385, 0, 0.9764706, 1, 1,
0.01794296, -0.04681104, 3.100584, 0, 0.9686275, 1, 1,
0.02140536, -1.278536, 2.93099, 0, 0.9647059, 1, 1,
0.021879, 1.708849, -0.6658821, 0, 0.9568627, 1, 1,
0.02193561, -0.4111157, 3.068426, 0, 0.9529412, 1, 1,
0.02689795, 1.446536, -0.0057721, 0, 0.945098, 1, 1,
0.02757872, -0.344988, 2.26777, 0, 0.9411765, 1, 1,
0.03207473, 0.4655142, 1.055502, 0, 0.9333333, 1, 1,
0.03227973, -0.4140261, 3.036702, 0, 0.9294118, 1, 1,
0.03243331, -0.2431521, 4.279589, 0, 0.9215686, 1, 1,
0.0391377, 0.3073731, 1.928654, 0, 0.9176471, 1, 1,
0.04179961, -1.506965, 3.657109, 0, 0.9098039, 1, 1,
0.04263588, 1.79692, -0.8567849, 0, 0.9058824, 1, 1,
0.04349206, 0.5433481, -0.2959761, 0, 0.8980392, 1, 1,
0.0451042, 0.2945551, -1.893074, 0, 0.8901961, 1, 1,
0.05530597, -0.3401003, 4.54341, 0, 0.8862745, 1, 1,
0.0589584, -1.677424, 2.658457, 0, 0.8784314, 1, 1,
0.06136665, 0.09093605, -0.7693079, 0, 0.8745098, 1, 1,
0.06157081, -1.243495, 3.23215, 0, 0.8666667, 1, 1,
0.0624356, 0.7983963, 0.2002256, 0, 0.8627451, 1, 1,
0.06659196, 1.420542, -0.009153111, 0, 0.854902, 1, 1,
0.06686718, -0.1294756, 2.962884, 0, 0.8509804, 1, 1,
0.07904197, 0.560838, -1.134262, 0, 0.8431373, 1, 1,
0.08028271, -1.85954, 0.7663435, 0, 0.8392157, 1, 1,
0.08568666, 0.08135954, 0.446864, 0, 0.8313726, 1, 1,
0.08707725, -0.7672721, 5.112183, 0, 0.827451, 1, 1,
0.09231337, 0.05370631, 1.116462, 0, 0.8196079, 1, 1,
0.09328771, -2.24496, 3.513744, 0, 0.8156863, 1, 1,
0.09338713, -1.442532, 3.258351, 0, 0.8078431, 1, 1,
0.09370612, -0.5495744, 4.789212, 0, 0.8039216, 1, 1,
0.09507354, 0.805098, 0.1743122, 0, 0.7960784, 1, 1,
0.09768645, -0.8307556, 3.427107, 0, 0.7882353, 1, 1,
0.0983237, -1.046346, 3.073661, 0, 0.7843137, 1, 1,
0.1030855, -1.013156, 4.05062, 0, 0.7764706, 1, 1,
0.103638, -0.3290672, 4.628335, 0, 0.772549, 1, 1,
0.1077889, 0.7759276, 0.1642356, 0, 0.7647059, 1, 1,
0.1083065, 0.5479708, 0.847546, 0, 0.7607843, 1, 1,
0.119076, -0.1939262, 2.084241, 0, 0.7529412, 1, 1,
0.1198143, -0.4405661, 1.560809, 0, 0.7490196, 1, 1,
0.120389, -0.8364545, 3.19541, 0, 0.7411765, 1, 1,
0.1210359, -0.989828, 2.36834, 0, 0.7372549, 1, 1,
0.122851, 0.08478166, -0.5124643, 0, 0.7294118, 1, 1,
0.1234758, 1.201949, 0.2078863, 0, 0.7254902, 1, 1,
0.1276463, -1.391597, 2.691158, 0, 0.7176471, 1, 1,
0.1283476, -1.104738, 3.340012, 0, 0.7137255, 1, 1,
0.1304873, -0.2698939, 1.600958, 0, 0.7058824, 1, 1,
0.1308572, 0.3722191, 0.9358392, 0, 0.6980392, 1, 1,
0.136302, 0.4415078, -1.648924, 0, 0.6941177, 1, 1,
0.1413774, -2.933168, 3.742313, 0, 0.6862745, 1, 1,
0.1426004, -0.2424484, 3.380868, 0, 0.682353, 1, 1,
0.1434326, 0.06345014, 0.3786598, 0, 0.6745098, 1, 1,
0.1438697, 0.4513347, 1.129106, 0, 0.6705883, 1, 1,
0.1481831, 0.2763075, -0.4788147, 0, 0.6627451, 1, 1,
0.1519364, 1.390072, -0.04046803, 0, 0.6588235, 1, 1,
0.1526878, -0.7403836, 1.110141, 0, 0.6509804, 1, 1,
0.1559728, 0.6518578, -1.814259, 0, 0.6470588, 1, 1,
0.1568888, 0.5653403, -0.001106052, 0, 0.6392157, 1, 1,
0.1577863, -1.535952, 4.186931, 0, 0.6352941, 1, 1,
0.1658705, -0.07350182, 1.322884, 0, 0.627451, 1, 1,
0.1676298, -0.3061881, 3.652184, 0, 0.6235294, 1, 1,
0.1697953, 0.6056876, -1.038295, 0, 0.6156863, 1, 1,
0.1707306, -0.7190355, 2.424145, 0, 0.6117647, 1, 1,
0.1776986, 0.6797252, -1.196795, 0, 0.6039216, 1, 1,
0.1777305, 0.037419, 2.767374, 0, 0.5960785, 1, 1,
0.1796989, 1.019353, 1.537165, 0, 0.5921569, 1, 1,
0.18212, -0.6741212, 2.403472, 0, 0.5843138, 1, 1,
0.1923086, -0.1375083, 2.277726, 0, 0.5803922, 1, 1,
0.1923413, -0.242795, 4.636758, 0, 0.572549, 1, 1,
0.1980522, -2.162581, 3.070539, 0, 0.5686275, 1, 1,
0.198465, 0.007713058, 1.166856, 0, 0.5607843, 1, 1,
0.1992508, 0.8691466, -0.2482611, 0, 0.5568628, 1, 1,
0.2015921, -0.7022594, 3.6531, 0, 0.5490196, 1, 1,
0.2119414, -0.06104552, 0.8024433, 0, 0.5450981, 1, 1,
0.2166186, -1.636794, 3.157455, 0, 0.5372549, 1, 1,
0.2176746, -0.5032465, 2.605329, 0, 0.5333334, 1, 1,
0.2188345, -1.575619, 1.492145, 0, 0.5254902, 1, 1,
0.22214, 2.89041, -0.2016806, 0, 0.5215687, 1, 1,
0.2252679, 0.806477, 0.4323575, 0, 0.5137255, 1, 1,
0.2258495, 0.4248007, 1.32837, 0, 0.509804, 1, 1,
0.2280031, -0.4639134, 4.141567, 0, 0.5019608, 1, 1,
0.2281088, -0.2494308, 1.429998, 0, 0.4941176, 1, 1,
0.2283319, -0.7491773, 3.834792, 0, 0.4901961, 1, 1,
0.233865, -0.2235325, 3.4025, 0, 0.4823529, 1, 1,
0.2361047, -0.4709269, 1.463374, 0, 0.4784314, 1, 1,
0.2405314, -0.1339353, 0.9675344, 0, 0.4705882, 1, 1,
0.2444848, -1.798634, 1.343998, 0, 0.4666667, 1, 1,
0.2447094, 0.02489897, 2.12502, 0, 0.4588235, 1, 1,
0.2452918, 0.6625465, -1.036609, 0, 0.454902, 1, 1,
0.248062, -1.19175, 2.756959, 0, 0.4470588, 1, 1,
0.2485044, -0.9672176, 3.445449, 0, 0.4431373, 1, 1,
0.2516422, 0.7733978, 1.171471, 0, 0.4352941, 1, 1,
0.256193, -1.062749, 1.613412, 0, 0.4313726, 1, 1,
0.2599355, 0.8602181, 0.4544383, 0, 0.4235294, 1, 1,
0.2621388, 1.005768, 0.1020783, 0, 0.4196078, 1, 1,
0.2651203, 0.07120748, 0.7695409, 0, 0.4117647, 1, 1,
0.2653525, 0.477645, 2.146369, 0, 0.4078431, 1, 1,
0.2658572, -1.172884, 4.160267, 0, 0.4, 1, 1,
0.2664255, 0.3999999, -0.3762146, 0, 0.3921569, 1, 1,
0.2695425, -0.3879711, 2.96632, 0, 0.3882353, 1, 1,
0.2698097, 0.2941789, 0.1064616, 0, 0.3803922, 1, 1,
0.2766636, -1.238743, 3.484889, 0, 0.3764706, 1, 1,
0.2772141, -0.0196485, 0.8865241, 0, 0.3686275, 1, 1,
0.2777463, -0.5560461, 5.099256, 0, 0.3647059, 1, 1,
0.2797298, 0.2738144, 2.730907, 0, 0.3568628, 1, 1,
0.2813262, -0.141044, 1.206844, 0, 0.3529412, 1, 1,
0.2827618, 0.525247, -0.6375677, 0, 0.345098, 1, 1,
0.2834113, -0.2243026, 1.775446, 0, 0.3411765, 1, 1,
0.2850593, -2.649264, 2.491706, 0, 0.3333333, 1, 1,
0.2870056, 0.6888869, 1.048708, 0, 0.3294118, 1, 1,
0.2892066, -1.661096, 1.627923, 0, 0.3215686, 1, 1,
0.2897199, 0.08192474, 2.92853, 0, 0.3176471, 1, 1,
0.2900664, -0.8250898, 3.189122, 0, 0.3098039, 1, 1,
0.2922789, 0.4016402, 0.9469778, 0, 0.3058824, 1, 1,
0.2955758, 0.2944555, -0.1068964, 0, 0.2980392, 1, 1,
0.2985932, -0.7469323, 2.651209, 0, 0.2901961, 1, 1,
0.3016162, -0.6451164, 0.9730359, 0, 0.2862745, 1, 1,
0.3045664, 0.8935605, 0.1856601, 0, 0.2784314, 1, 1,
0.3064889, 0.4041402, 0.6978076, 0, 0.2745098, 1, 1,
0.3081294, 0.1808576, 0.8360267, 0, 0.2666667, 1, 1,
0.3111094, -0.1239987, 3.4757, 0, 0.2627451, 1, 1,
0.3134761, -0.580002, 2.188747, 0, 0.254902, 1, 1,
0.3150643, 0.5440455, -0.6612763, 0, 0.2509804, 1, 1,
0.3208131, 2.419831, -0.5325397, 0, 0.2431373, 1, 1,
0.3251664, -1.771303, 3.133986, 0, 0.2392157, 1, 1,
0.3279944, -1.105969, 3.258448, 0, 0.2313726, 1, 1,
0.3312384, -0.8111058, 1.943932, 0, 0.227451, 1, 1,
0.3355516, 0.5636607, 1.580717, 0, 0.2196078, 1, 1,
0.3392338, 0.8319971, 1.868415, 0, 0.2156863, 1, 1,
0.343494, 0.3633698, 1.555665, 0, 0.2078431, 1, 1,
0.3457296, 2.1202, -0.7049367, 0, 0.2039216, 1, 1,
0.3462956, 0.04016689, 1.097526, 0, 0.1960784, 1, 1,
0.3464799, -0.3925806, 2.417309, 0, 0.1882353, 1, 1,
0.3563338, 0.8734592, 1.036013, 0, 0.1843137, 1, 1,
0.356825, -1.421719, 4.071876, 0, 0.1764706, 1, 1,
0.3577147, -1.396264, 2.059597, 0, 0.172549, 1, 1,
0.3636936, -0.08950467, 3.099867, 0, 0.1647059, 1, 1,
0.3650048, 0.4321133, 1.860386, 0, 0.1607843, 1, 1,
0.3698769, -1.224258, 3.570072, 0, 0.1529412, 1, 1,
0.3722346, 0.9408903, 0.7649106, 0, 0.1490196, 1, 1,
0.3723162, -2.309315, 3.324024, 0, 0.1411765, 1, 1,
0.3739078, -0.03837683, 1.866312, 0, 0.1372549, 1, 1,
0.3790633, 0.1695958, 2.544542, 0, 0.1294118, 1, 1,
0.3852561, -0.5758622, 1.551082, 0, 0.1254902, 1, 1,
0.3866882, -2.001376, 1.123829, 0, 0.1176471, 1, 1,
0.3893526, 0.1677041, 0.8734592, 0, 0.1137255, 1, 1,
0.3900386, -0.5379244, 2.941447, 0, 0.1058824, 1, 1,
0.3940203, -0.9055039, 3.21363, 0, 0.09803922, 1, 1,
0.3944803, -0.6946873, 3.785668, 0, 0.09411765, 1, 1,
0.4000548, 1.251693, 0.4126648, 0, 0.08627451, 1, 1,
0.4075003, -0.8294872, 3.016649, 0, 0.08235294, 1, 1,
0.4103578, -0.9553725, 3.202718, 0, 0.07450981, 1, 1,
0.4174463, -0.06566703, 0.8607001, 0, 0.07058824, 1, 1,
0.4178525, 2.914641, 0.02510521, 0, 0.0627451, 1, 1,
0.4222997, -0.5170856, 3.764541, 0, 0.05882353, 1, 1,
0.4288111, 0.396666, 1.583048, 0, 0.05098039, 1, 1,
0.4355544, -1.872299, 2.581076, 0, 0.04705882, 1, 1,
0.4455364, -0.9297088, 2.623216, 0, 0.03921569, 1, 1,
0.4456013, 0.1927033, 1.446973, 0, 0.03529412, 1, 1,
0.4483891, -0.2888239, 3.459256, 0, 0.02745098, 1, 1,
0.4485375, -0.170863, 1.217219, 0, 0.02352941, 1, 1,
0.4534792, -1.560108, 3.100326, 0, 0.01568628, 1, 1,
0.4537098, 0.5314573, 1.569915, 0, 0.01176471, 1, 1,
0.455897, -0.8208371, 3.284789, 0, 0.003921569, 1, 1,
0.4590896, -0.2833724, 1.211268, 0.003921569, 0, 1, 1,
0.4628883, 1.114505, 2.649606, 0.007843138, 0, 1, 1,
0.4637708, -0.6774537, 2.848459, 0.01568628, 0, 1, 1,
0.4687418, -0.1094812, 2.767705, 0.01960784, 0, 1, 1,
0.4698467, 1.561993, 1.446515, 0.02745098, 0, 1, 1,
0.4721087, 1.234569, 0.02157094, 0.03137255, 0, 1, 1,
0.4723971, 0.21084, 0.7723675, 0.03921569, 0, 1, 1,
0.4743163, 1.021225, 0.895733, 0.04313726, 0, 1, 1,
0.477587, -0.4680994, 4.209085, 0.05098039, 0, 1, 1,
0.4828712, 0.6680249, 0.8983533, 0.05490196, 0, 1, 1,
0.4848559, -0.6415449, 2.904294, 0.0627451, 0, 1, 1,
0.4896143, 0.2711415, 1.568458, 0.06666667, 0, 1, 1,
0.4900149, 0.1104095, 2.227803, 0.07450981, 0, 1, 1,
0.4902487, 0.9858962, 0.2737608, 0.07843138, 0, 1, 1,
0.4906021, -1.251001, 3.578341, 0.08627451, 0, 1, 1,
0.5018537, 1.979413, 0.7096652, 0.09019608, 0, 1, 1,
0.5023271, -0.06695688, 1.510427, 0.09803922, 0, 1, 1,
0.5047283, 0.4691086, 0.5892426, 0.1058824, 0, 1, 1,
0.5047747, -0.2518874, 0.4433959, 0.1098039, 0, 1, 1,
0.5113537, -0.9156217, 2.827757, 0.1176471, 0, 1, 1,
0.5125278, -1.428136, 1.299625, 0.1215686, 0, 1, 1,
0.5130008, 0.4239374, 2.370281, 0.1294118, 0, 1, 1,
0.514327, 1.193547, -0.4561437, 0.1333333, 0, 1, 1,
0.5205823, 0.1071458, 0.1876228, 0.1411765, 0, 1, 1,
0.5216479, 1.230865, 0.8283235, 0.145098, 0, 1, 1,
0.5224683, 0.07892843, 0.2529939, 0.1529412, 0, 1, 1,
0.526642, 1.524986, 2.524281, 0.1568628, 0, 1, 1,
0.5281928, -0.1027206, -1.098588, 0.1647059, 0, 1, 1,
0.5289206, -0.5678029, 0.8004599, 0.1686275, 0, 1, 1,
0.5325664, 1.840026, -0.4387235, 0.1764706, 0, 1, 1,
0.5353336, 1.159746, 0.5737584, 0.1803922, 0, 1, 1,
0.5361469, 0.3500276, -0.007135246, 0.1882353, 0, 1, 1,
0.5363026, -0.6418957, 2.681762, 0.1921569, 0, 1, 1,
0.5363171, 0.6507436, -0.1159001, 0.2, 0, 1, 1,
0.5367051, 0.2011196, 1.37482, 0.2078431, 0, 1, 1,
0.5394881, 0.3760579, 1.97632, 0.2117647, 0, 1, 1,
0.5400229, -1.172396, 3.197978, 0.2196078, 0, 1, 1,
0.5453953, 1.175514, 0.4426845, 0.2235294, 0, 1, 1,
0.5477508, 1.707309, 3.323768, 0.2313726, 0, 1, 1,
0.5478601, -0.4931247, 2.265843, 0.2352941, 0, 1, 1,
0.549758, 0.00703618, 2.868348, 0.2431373, 0, 1, 1,
0.5507136, 0.2508393, 1.307874, 0.2470588, 0, 1, 1,
0.5516397, 0.3773346, 1.819666, 0.254902, 0, 1, 1,
0.5519401, 0.7575986, 0.5803244, 0.2588235, 0, 1, 1,
0.5550282, -0.952143, 1.65747, 0.2666667, 0, 1, 1,
0.5598173, -0.84735, 1.967193, 0.2705882, 0, 1, 1,
0.5608343, 1.683765, 0.3369877, 0.2784314, 0, 1, 1,
0.5608903, 0.05729581, 1.055394, 0.282353, 0, 1, 1,
0.5700129, 0.561328, 1.318699, 0.2901961, 0, 1, 1,
0.5706547, -1.139262, 1.929326, 0.2941177, 0, 1, 1,
0.5748947, -0.8412097, 2.020936, 0.3019608, 0, 1, 1,
0.5794594, 0.283015, 2.801376, 0.3098039, 0, 1, 1,
0.582726, 0.9079129, 1.467297, 0.3137255, 0, 1, 1,
0.5831006, -0.2073103, 0.3583063, 0.3215686, 0, 1, 1,
0.5867606, -0.1808073, -0.628835, 0.3254902, 0, 1, 1,
0.5907171, -0.4743579, 2.235294, 0.3333333, 0, 1, 1,
0.5936698, 0.3978614, 0.04252545, 0.3372549, 0, 1, 1,
0.5953065, 1.348677, 0.3616723, 0.345098, 0, 1, 1,
0.5985606, 0.4065444, 0.553936, 0.3490196, 0, 1, 1,
0.5989658, 0.280947, 0.3900682, 0.3568628, 0, 1, 1,
0.6003561, -0.3396524, 0.6013947, 0.3607843, 0, 1, 1,
0.6029107, -0.2425578, 2.177929, 0.3686275, 0, 1, 1,
0.6069703, -0.3228618, 1.17092, 0.372549, 0, 1, 1,
0.6072176, 0.3298373, 1.695781, 0.3803922, 0, 1, 1,
0.6073202, -0.8587897, 2.936829, 0.3843137, 0, 1, 1,
0.6112323, -0.4817965, 1.073131, 0.3921569, 0, 1, 1,
0.6113226, 0.01724818, 2.63833, 0.3960784, 0, 1, 1,
0.6164741, 0.4876444, 0.0935168, 0.4039216, 0, 1, 1,
0.6173087, 0.9312353, -0.4517685, 0.4117647, 0, 1, 1,
0.6174501, 0.1662049, 0.4862635, 0.4156863, 0, 1, 1,
0.6190606, 0.5744013, 1.149968, 0.4235294, 0, 1, 1,
0.6206824, -0.7092155, 1.372468, 0.427451, 0, 1, 1,
0.6236709, 0.228416, -0.1155521, 0.4352941, 0, 1, 1,
0.6247483, 0.4843259, 0.828553, 0.4392157, 0, 1, 1,
0.6279786, -1.234232, 2.329398, 0.4470588, 0, 1, 1,
0.6313365, -1.007079, 3.003481, 0.4509804, 0, 1, 1,
0.6337689, -0.9512484, 1.511035, 0.4588235, 0, 1, 1,
0.6363658, 0.1120271, 2.663741, 0.4627451, 0, 1, 1,
0.6481693, -1.2483, 0.6706002, 0.4705882, 0, 1, 1,
0.6501024, 1.278648, 0.3082602, 0.4745098, 0, 1, 1,
0.6581481, 0.6703951, 0.3299054, 0.4823529, 0, 1, 1,
0.6607575, -0.467885, 0.8486189, 0.4862745, 0, 1, 1,
0.6610087, -0.4423251, 3.290323, 0.4941176, 0, 1, 1,
0.6626902, 0.5662869, 0.6706253, 0.5019608, 0, 1, 1,
0.6639789, 1.96918, 0.9426134, 0.5058824, 0, 1, 1,
0.6684267, -0.2190811, 3.086127, 0.5137255, 0, 1, 1,
0.6690628, 0.2642486, 3.633413, 0.5176471, 0, 1, 1,
0.6693719, 0.5817944, 1.468351, 0.5254902, 0, 1, 1,
0.6699252, -0.6298863, 2.125999, 0.5294118, 0, 1, 1,
0.670354, 0.2350931, 1.397262, 0.5372549, 0, 1, 1,
0.6711626, -0.9509015, 2.971817, 0.5411765, 0, 1, 1,
0.6723705, -0.8380005, 2.487973, 0.5490196, 0, 1, 1,
0.674291, -0.1727422, 1.428547, 0.5529412, 0, 1, 1,
0.6789472, -1.643237, 1.345569, 0.5607843, 0, 1, 1,
0.6792368, -0.188344, 2.701365, 0.5647059, 0, 1, 1,
0.6828753, -0.7051691, 2.370246, 0.572549, 0, 1, 1,
0.6870381, 0.1295875, 2.314166, 0.5764706, 0, 1, 1,
0.6902097, -0.3035094, 2.894374, 0.5843138, 0, 1, 1,
0.6903899, -0.1342079, 0.5050021, 0.5882353, 0, 1, 1,
0.6925998, -1.008417, 3.66993, 0.5960785, 0, 1, 1,
0.6927751, 1.359598, 3.662984, 0.6039216, 0, 1, 1,
0.692989, -0.3451728, 2.22509, 0.6078432, 0, 1, 1,
0.6952795, 0.7376121, 0.1719098, 0.6156863, 0, 1, 1,
0.6953619, -0.1652227, 2.248178, 0.6196079, 0, 1, 1,
0.6991346, -1.391809, 2.827225, 0.627451, 0, 1, 1,
0.6994954, -0.8629635, 3.658199, 0.6313726, 0, 1, 1,
0.7043173, -2.13342, 5.049633, 0.6392157, 0, 1, 1,
0.7079533, 2.078552, 1.345799, 0.6431373, 0, 1, 1,
0.7088613, -0.4568807, 1.304635, 0.6509804, 0, 1, 1,
0.7088788, -0.3298016, 3.25358, 0.654902, 0, 1, 1,
0.7096968, 0.3995456, 0.6369785, 0.6627451, 0, 1, 1,
0.7167158, 1.378162, 2.181301, 0.6666667, 0, 1, 1,
0.7179475, 0.2911004, 1.722471, 0.6745098, 0, 1, 1,
0.7192378, -0.06388572, 1.409253, 0.6784314, 0, 1, 1,
0.7198399, -0.08227395, 3.69389, 0.6862745, 0, 1, 1,
0.7212129, -1.250542, 2.680418, 0.6901961, 0, 1, 1,
0.7300622, 1.171641, 2.256508, 0.6980392, 0, 1, 1,
0.7461649, 1.24724, 0.3288679, 0.7058824, 0, 1, 1,
0.7488008, 1.274465, 0.7821828, 0.7098039, 0, 1, 1,
0.7514657, -0.3689634, 1.469987, 0.7176471, 0, 1, 1,
0.7563058, 0.8531269, 0.8424348, 0.7215686, 0, 1, 1,
0.7596893, 0.9041175, 1.958311, 0.7294118, 0, 1, 1,
0.7643791, 1.690615, -0.5772666, 0.7333333, 0, 1, 1,
0.7814001, 0.07755166, 2.309357, 0.7411765, 0, 1, 1,
0.7845295, 0.6599312, 1.648022, 0.7450981, 0, 1, 1,
0.7848608, -0.8247237, 1.833454, 0.7529412, 0, 1, 1,
0.786799, 0.1899124, 0.3779982, 0.7568628, 0, 1, 1,
0.7880076, -0.5012701, 1.22644, 0.7647059, 0, 1, 1,
0.7902092, -3.51553, 3.403836, 0.7686275, 0, 1, 1,
0.7968894, -0.4742381, 1.092185, 0.7764706, 0, 1, 1,
0.7970514, 1.201079, -0.9247525, 0.7803922, 0, 1, 1,
0.8056757, -0.2308128, 0.5576612, 0.7882353, 0, 1, 1,
0.8096493, -0.9261875, 3.534471, 0.7921569, 0, 1, 1,
0.8115261, 1.451247, 1.32128, 0.8, 0, 1, 1,
0.8132542, -0.7453704, 2.680119, 0.8078431, 0, 1, 1,
0.818693, 0.3954929, 0.02819907, 0.8117647, 0, 1, 1,
0.8366478, 0.9050668, 0.2626754, 0.8196079, 0, 1, 1,
0.8450652, 0.9536507, -0.1237699, 0.8235294, 0, 1, 1,
0.8531438, 0.3042695, 1.327047, 0.8313726, 0, 1, 1,
0.8554866, 0.6410371, 0.7604818, 0.8352941, 0, 1, 1,
0.856231, 2.15477, 1.000889, 0.8431373, 0, 1, 1,
0.8575754, -0.5226938, 4.290614, 0.8470588, 0, 1, 1,
0.8716606, 0.3126659, 1.2909, 0.854902, 0, 1, 1,
0.8797216, -1.365931, 1.937965, 0.8588235, 0, 1, 1,
0.8804334, 0.0675472, 0.8488773, 0.8666667, 0, 1, 1,
0.8830705, 2.333945, -0.4854004, 0.8705882, 0, 1, 1,
0.8862469, -0.25578, 0.4096615, 0.8784314, 0, 1, 1,
0.8900638, 0.5962079, 0.4703416, 0.8823529, 0, 1, 1,
0.8926033, -0.2178299, 3.876593, 0.8901961, 0, 1, 1,
0.8936074, 0.9265332, 1.174205, 0.8941177, 0, 1, 1,
0.9046127, 0.5410525, 0.9593372, 0.9019608, 0, 1, 1,
0.9056301, -1.063202, 3.885594, 0.9098039, 0, 1, 1,
0.9148611, 0.3290211, -0.1179712, 0.9137255, 0, 1, 1,
0.9164426, -0.8357646, 2.960026, 0.9215686, 0, 1, 1,
0.917295, -0.009060154, 1.778282, 0.9254902, 0, 1, 1,
0.9213044, 0.2043591, 0.6703796, 0.9333333, 0, 1, 1,
0.9263551, 1.501138, 1.236457, 0.9372549, 0, 1, 1,
0.9342135, -2.220529, 3.539064, 0.945098, 0, 1, 1,
0.9343742, -1.971843, 3.812631, 0.9490196, 0, 1, 1,
0.9345836, 0.7525662, 0.7395529, 0.9568627, 0, 1, 1,
0.9354576, -0.08258147, 2.313778, 0.9607843, 0, 1, 1,
0.9416864, -1.684869, 2.986768, 0.9686275, 0, 1, 1,
0.9440735, -0.7798432, 2.424558, 0.972549, 0, 1, 1,
0.9497529, 2.974997, 1.020789, 0.9803922, 0, 1, 1,
0.9675927, 0.4222763, 2.964648, 0.9843137, 0, 1, 1,
0.9681737, 0.3950751, 1.228509, 0.9921569, 0, 1, 1,
0.9689816, 1.66065, 2.257695, 0.9960784, 0, 1, 1,
0.9736998, -0.1133957, 1.822113, 1, 0, 0.9960784, 1,
0.9760956, 1.53579, 0.1946919, 1, 0, 0.9882353, 1,
0.9924249, 0.271396, 0.1290389, 1, 0, 0.9843137, 1,
0.9927748, -0.6302285, 2.502384, 1, 0, 0.9764706, 1,
0.9960789, -1.859676, 4.577704, 1, 0, 0.972549, 1,
1.004787, -1.210272, 0.6312148, 1, 0, 0.9647059, 1,
1.012023, 0.799418, 0.2422337, 1, 0, 0.9607843, 1,
1.020824, 0.2661861, 1.344622, 1, 0, 0.9529412, 1,
1.02107, -0.5328685, 3.408934, 1, 0, 0.9490196, 1,
1.02803, -1.589276, 2.992816, 1, 0, 0.9411765, 1,
1.032214, -0.4541112, 1.306399, 1, 0, 0.9372549, 1,
1.038842, -0.2098307, 2.430863, 1, 0, 0.9294118, 1,
1.041001, -1.930457, 2.766657, 1, 0, 0.9254902, 1,
1.05029, 0.2105199, 1.178174, 1, 0, 0.9176471, 1,
1.052233, 0.6046716, 0.04271514, 1, 0, 0.9137255, 1,
1.055516, -0.1044744, 0.3717953, 1, 0, 0.9058824, 1,
1.057511, -0.2362658, 2.140402, 1, 0, 0.9019608, 1,
1.060001, -0.03751927, 2.228044, 1, 0, 0.8941177, 1,
1.060179, 0.2422411, 0.9593152, 1, 0, 0.8862745, 1,
1.06597, 0.128367, 2.657265, 1, 0, 0.8823529, 1,
1.084459, -1.498904, 2.188796, 1, 0, 0.8745098, 1,
1.088434, 0.4427496, 1.936717, 1, 0, 0.8705882, 1,
1.088548, 0.02302206, 2.821211, 1, 0, 0.8627451, 1,
1.094788, -0.1782791, 3.203084, 1, 0, 0.8588235, 1,
1.100184, -0.5796212, 2.775142, 1, 0, 0.8509804, 1,
1.103452, 0.9644179, 0.1836785, 1, 0, 0.8470588, 1,
1.111567, 1.206454, -0.5450211, 1, 0, 0.8392157, 1,
1.123364, -0.3782537, 2.142489, 1, 0, 0.8352941, 1,
1.12658, 0.9275231, 1.18692, 1, 0, 0.827451, 1,
1.13212, 2.038042, -1.158587, 1, 0, 0.8235294, 1,
1.133887, 0.3956946, 2.175276, 1, 0, 0.8156863, 1,
1.136741, 0.3480316, 1.580313, 1, 0, 0.8117647, 1,
1.14011, 0.4584205, 1.167374, 1, 0, 0.8039216, 1,
1.141838, -0.3413097, 3.445879, 1, 0, 0.7960784, 1,
1.146946, 0.1167106, 0.8924257, 1, 0, 0.7921569, 1,
1.148004, 0.7133521, 0.5423786, 1, 0, 0.7843137, 1,
1.161096, -0.6816775, 2.025637, 1, 0, 0.7803922, 1,
1.166283, 0.1599745, 2.026109, 1, 0, 0.772549, 1,
1.170199, -0.8527946, 1.961191, 1, 0, 0.7686275, 1,
1.173272, 0.1902495, -0.291786, 1, 0, 0.7607843, 1,
1.174616, -0.1482986, 2.009453, 1, 0, 0.7568628, 1,
1.177054, 1.879654, 2.369303, 1, 0, 0.7490196, 1,
1.177464, 0.3365103, 1.102849, 1, 0, 0.7450981, 1,
1.178727, -0.9925982, 2.807083, 1, 0, 0.7372549, 1,
1.185831, -0.3406234, 2.098913, 1, 0, 0.7333333, 1,
1.18708, 0.2328019, 0.8466597, 1, 0, 0.7254902, 1,
1.190205, -1.265385, 2.671869, 1, 0, 0.7215686, 1,
1.192736, -1.620621, 2.807376, 1, 0, 0.7137255, 1,
1.196177, -1.228186, 2.120498, 1, 0, 0.7098039, 1,
1.20225, 1.018323, 0.357595, 1, 0, 0.7019608, 1,
1.202371, 1.340128, 0.1908187, 1, 0, 0.6941177, 1,
1.204359, -0.4600308, 1.674005, 1, 0, 0.6901961, 1,
1.20624, 1.210299, 2.251697, 1, 0, 0.682353, 1,
1.210211, -0.09451193, 3.125911, 1, 0, 0.6784314, 1,
1.212224, 0.4045742, -0.2526858, 1, 0, 0.6705883, 1,
1.214347, -0.5137444, 0.2618894, 1, 0, 0.6666667, 1,
1.228378, -1.31234, 1.992172, 1, 0, 0.6588235, 1,
1.234546, -0.7234887, 1.914308, 1, 0, 0.654902, 1,
1.236908, -0.5210154, 3.188657, 1, 0, 0.6470588, 1,
1.236933, 1.458835, 2.052051, 1, 0, 0.6431373, 1,
1.245746, -0.3779643, 1.108448, 1, 0, 0.6352941, 1,
1.253934, 0.9166891, 0.8773426, 1, 0, 0.6313726, 1,
1.262981, 0.5079389, -1.070919, 1, 0, 0.6235294, 1,
1.267204, -0.5434328, 2.586991, 1, 0, 0.6196079, 1,
1.268773, -0.2782463, 1.909442, 1, 0, 0.6117647, 1,
1.280669, -1.732796, 2.38465, 1, 0, 0.6078432, 1,
1.283897, -0.9937845, 1.853229, 1, 0, 0.6, 1,
1.288729, -2.431341, 3.211801, 1, 0, 0.5921569, 1,
1.30328, 0.8521767, 2.504937, 1, 0, 0.5882353, 1,
1.306934, -0.9786134, 1.395969, 1, 0, 0.5803922, 1,
1.307267, -1.204468, 2.040158, 1, 0, 0.5764706, 1,
1.32073, -1.585049, 3.160385, 1, 0, 0.5686275, 1,
1.32264, -0.5464661, 0.5481451, 1, 0, 0.5647059, 1,
1.326792, 0.002921043, 0.8506817, 1, 0, 0.5568628, 1,
1.329144, -0.8200643, 3.798021, 1, 0, 0.5529412, 1,
1.33642, -0.507605, 3.013529, 1, 0, 0.5450981, 1,
1.336452, 0.06948163, 1.394902, 1, 0, 0.5411765, 1,
1.34583, 0.09368782, 1.298181, 1, 0, 0.5333334, 1,
1.34924, -0.8849285, 1.910816, 1, 0, 0.5294118, 1,
1.368655, 0.2791062, 0.3937448, 1, 0, 0.5215687, 1,
1.369272, 1.985038, 0.8747793, 1, 0, 0.5176471, 1,
1.374398, -0.05184783, 2.588059, 1, 0, 0.509804, 1,
1.387713, 0.4834764, 1.5687, 1, 0, 0.5058824, 1,
1.403399, -0.1278491, 1.654806, 1, 0, 0.4980392, 1,
1.405484, 0.1083274, 1.987517, 1, 0, 0.4901961, 1,
1.407706, -0.3413256, 0.8389567, 1, 0, 0.4862745, 1,
1.411776, 0.7556742, -0.2005579, 1, 0, 0.4784314, 1,
1.420925, 1.099184, 1.001675, 1, 0, 0.4745098, 1,
1.428024, -0.7082307, 2.279969, 1, 0, 0.4666667, 1,
1.428466, -0.606881, 0.7771474, 1, 0, 0.4627451, 1,
1.428829, -0.2868542, 2.556511, 1, 0, 0.454902, 1,
1.436104, 1.232724, -0.6683289, 1, 0, 0.4509804, 1,
1.437002, 0.1648747, 2.425663, 1, 0, 0.4431373, 1,
1.452236, 1.351105, -0.2424607, 1, 0, 0.4392157, 1,
1.454964, 2.022143, 2.042042, 1, 0, 0.4313726, 1,
1.472163, -1.377795, 2.043469, 1, 0, 0.427451, 1,
1.484146, 0.1400601, 1.29562, 1, 0, 0.4196078, 1,
1.484879, -1.489806, 3.170813, 1, 0, 0.4156863, 1,
1.493213, 0.794992, 0.4799397, 1, 0, 0.4078431, 1,
1.510292, 0.546824, 0.7209751, 1, 0, 0.4039216, 1,
1.518177, -0.2287381, 2.985472, 1, 0, 0.3960784, 1,
1.522853, 0.6283644, -0.0533802, 1, 0, 0.3882353, 1,
1.52515, 0.101443, 0.647227, 1, 0, 0.3843137, 1,
1.52965, -0.215199, 1.432176, 1, 0, 0.3764706, 1,
1.532488, -0.5099578, 0.4183769, 1, 0, 0.372549, 1,
1.552703, 0.4514002, 1.033918, 1, 0, 0.3647059, 1,
1.554189, -0.4603834, 1.982763, 1, 0, 0.3607843, 1,
1.557301, 0.8482083, 2.435368, 1, 0, 0.3529412, 1,
1.558631, -0.7924371, 1.867878, 1, 0, 0.3490196, 1,
1.567042, 1.405978, -0.3304598, 1, 0, 0.3411765, 1,
1.567189, -0.3750716, 1.790902, 1, 0, 0.3372549, 1,
1.569163, 1.059932, 1.594374, 1, 0, 0.3294118, 1,
1.569575, 1.082182, 0.5136913, 1, 0, 0.3254902, 1,
1.603546, 0.2425062, 0.668628, 1, 0, 0.3176471, 1,
1.605405, -0.4006208, 1.373528, 1, 0, 0.3137255, 1,
1.609111, 1.823642, 1.166952, 1, 0, 0.3058824, 1,
1.621493, -0.9487146, 3.395233, 1, 0, 0.2980392, 1,
1.629168, 1.492931, -0.4399245, 1, 0, 0.2941177, 1,
1.640506, -0.02520599, 4.190721, 1, 0, 0.2862745, 1,
1.658651, -0.7577864, 3.087498, 1, 0, 0.282353, 1,
1.663889, -1.88671, 2.077071, 1, 0, 0.2745098, 1,
1.667409, -0.3521183, 1.007787, 1, 0, 0.2705882, 1,
1.693741, -0.8290915, 1.09913, 1, 0, 0.2627451, 1,
1.697095, 0.507744, 2.351421, 1, 0, 0.2588235, 1,
1.718311, 0.9082807, 0.1552959, 1, 0, 0.2509804, 1,
1.75095, -1.893105, 1.768897, 1, 0, 0.2470588, 1,
1.751082, 0.8905447, 1.360576, 1, 0, 0.2392157, 1,
1.757435, -1.569588, 1.813896, 1, 0, 0.2352941, 1,
1.764135, 0.3785671, 0.9123668, 1, 0, 0.227451, 1,
1.767232, -0.4633312, 1.978578, 1, 0, 0.2235294, 1,
1.768626, -1.331355, 1.981646, 1, 0, 0.2156863, 1,
1.771014, -0.05360918, 1.310712, 1, 0, 0.2117647, 1,
1.806052, 0.9251966, 0.4923285, 1, 0, 0.2039216, 1,
1.806972, -0.04344638, 2.571815, 1, 0, 0.1960784, 1,
1.814497, 1.178943, 0.407407, 1, 0, 0.1921569, 1,
1.822238, -0.05758374, 1.981314, 1, 0, 0.1843137, 1,
1.824134, 0.2386749, 2.385075, 1, 0, 0.1803922, 1,
1.832486, 0.5419534, 0.9757717, 1, 0, 0.172549, 1,
1.842067, 0.447054, 0.4513936, 1, 0, 0.1686275, 1,
1.847969, 0.2121548, 1.066549, 1, 0, 0.1607843, 1,
1.84814, 0.5941758, 2.739621, 1, 0, 0.1568628, 1,
1.858906, -1.445108, 2.57074, 1, 0, 0.1490196, 1,
1.872694, 1.155953, 0.1348263, 1, 0, 0.145098, 1,
1.883505, -0.4350254, 2.864865, 1, 0, 0.1372549, 1,
1.893504, -0.9370292, 0.6488152, 1, 0, 0.1333333, 1,
1.897289, -0.9267616, 2.425387, 1, 0, 0.1254902, 1,
1.897613, 1.29581, 0.85712, 1, 0, 0.1215686, 1,
1.912705, 0.3868102, 1.162181, 1, 0, 0.1137255, 1,
1.952396, -0.4635679, 1.371347, 1, 0, 0.1098039, 1,
1.963548, -2.397861, 1.994895, 1, 0, 0.1019608, 1,
1.985613, 2.424813, 1.743101, 1, 0, 0.09411765, 1,
2.000245, -1.153055, 3.820714, 1, 0, 0.09019608, 1,
2.001362, 0.5003542, 1.339445, 1, 0, 0.08235294, 1,
2.021733, -1.254524, 0.216433, 1, 0, 0.07843138, 1,
2.027357, -1.097861, 2.092586, 1, 0, 0.07058824, 1,
2.049194, 1.332763, 2.569322, 1, 0, 0.06666667, 1,
2.05212, -0.3747966, 2.8525, 1, 0, 0.05882353, 1,
2.07006, -0.6446266, 1.466702, 1, 0, 0.05490196, 1,
2.088351, 1.849422, -1.542667, 1, 0, 0.04705882, 1,
2.116357, 0.8201168, 1.946803, 1, 0, 0.04313726, 1,
2.123739, 1.659107, -0.9135539, 1, 0, 0.03529412, 1,
2.155871, 1.178879, 0.7476941, 1, 0, 0.03137255, 1,
2.374089, 1.872342, -0.2698859, 1, 0, 0.02352941, 1,
2.392376, 0.4349372, 1.204066, 1, 0, 0.01960784, 1,
2.506038, -1.087824, 1.693861, 1, 0, 0.01176471, 1,
3.597264, -0.1802506, 3.692704, 1, 0, 0.007843138, 1
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
0.1768111, -4.615674, -8.615875, 0, -0.5, 0.5, 0.5,
0.1768111, -4.615674, -8.615875, 1, -0.5, 0.5, 0.5,
0.1768111, -4.615674, -8.615875, 1, 1.5, 0.5, 0.5,
0.1768111, -4.615674, -8.615875, 0, 1.5, 0.5, 0.5
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
-4.403175, -0.2702665, -8.615875, 0, -0.5, 0.5, 0.5,
-4.403175, -0.2702665, -8.615875, 1, -0.5, 0.5, 0.5,
-4.403175, -0.2702665, -8.615875, 1, 1.5, 0.5, 0.5,
-4.403175, -0.2702665, -8.615875, 0, 1.5, 0.5, 0.5
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
-4.403175, -4.615674, -0.7570167, 0, -0.5, 0.5, 0.5,
-4.403175, -4.615674, -0.7570167, 1, -0.5, 0.5, 0.5,
-4.403175, -4.615674, -0.7570167, 1, 1.5, 0.5, 0.5,
-4.403175, -4.615674, -0.7570167, 0, 1.5, 0.5, 0.5
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
-3, -3.612888, -6.802292,
3, -3.612888, -6.802292,
-3, -3.612888, -6.802292,
-3, -3.780019, -7.104556,
-2, -3.612888, -6.802292,
-2, -3.780019, -7.104556,
-1, -3.612888, -6.802292,
-1, -3.780019, -7.104556,
0, -3.612888, -6.802292,
0, -3.780019, -7.104556,
1, -3.612888, -6.802292,
1, -3.780019, -7.104556,
2, -3.612888, -6.802292,
2, -3.780019, -7.104556,
3, -3.612888, -6.802292,
3, -3.780019, -7.104556
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
-3, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
-3, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
-3, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
-3, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
-2, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
-2, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
-2, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
-2, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
-1, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
-1, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
-1, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
-1, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
0, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
0, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
0, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
0, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
1, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
1, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
1, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
1, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
2, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
2, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
2, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
2, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5,
3, -4.114281, -7.709084, 0, -0.5, 0.5, 0.5,
3, -4.114281, -7.709084, 1, -0.5, 0.5, 0.5,
3, -4.114281, -7.709084, 1, 1.5, 0.5, 0.5,
3, -4.114281, -7.709084, 0, 1.5, 0.5, 0.5
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
-3.346255, -3, -6.802292,
-3.346255, 2, -6.802292,
-3.346255, -3, -6.802292,
-3.522408, -3, -7.104556,
-3.346255, -2, -6.802292,
-3.522408, -2, -7.104556,
-3.346255, -1, -6.802292,
-3.522408, -1, -7.104556,
-3.346255, 0, -6.802292,
-3.522408, 0, -7.104556,
-3.346255, 1, -6.802292,
-3.522408, 1, -7.104556,
-3.346255, 2, -6.802292,
-3.522408, 2, -7.104556
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
-3.874715, -3, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, -3, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, -3, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, -3, -7.709084, 0, 1.5, 0.5, 0.5,
-3.874715, -2, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, -2, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, -2, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, -2, -7.709084, 0, 1.5, 0.5, 0.5,
-3.874715, -1, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, -1, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, -1, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, -1, -7.709084, 0, 1.5, 0.5, 0.5,
-3.874715, 0, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, 0, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, 0, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, 0, -7.709084, 0, 1.5, 0.5, 0.5,
-3.874715, 1, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, 1, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, 1, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, 1, -7.709084, 0, 1.5, 0.5, 0.5,
-3.874715, 2, -7.709084, 0, -0.5, 0.5, 0.5,
-3.874715, 2, -7.709084, 1, -0.5, 0.5, 0.5,
-3.874715, 2, -7.709084, 1, 1.5, 0.5, 0.5,
-3.874715, 2, -7.709084, 0, 1.5, 0.5, 0.5
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
-3.346255, -3.612888, -6,
-3.346255, -3.612888, 4,
-3.346255, -3.612888, -6,
-3.522408, -3.780019, -6,
-3.346255, -3.612888, -4,
-3.522408, -3.780019, -4,
-3.346255, -3.612888, -2,
-3.522408, -3.780019, -2,
-3.346255, -3.612888, 0,
-3.522408, -3.780019, 0,
-3.346255, -3.612888, 2,
-3.522408, -3.780019, 2,
-3.346255, -3.612888, 4,
-3.522408, -3.780019, 4
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
"-6",
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
-3.874715, -4.114281, -6, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -6, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -6, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, -6, 0, 1.5, 0.5, 0.5,
-3.874715, -4.114281, -4, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -4, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -4, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, -4, 0, 1.5, 0.5, 0.5,
-3.874715, -4.114281, -2, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -2, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, -2, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, -2, 0, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 0, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 0, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 0, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 0, 0, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 2, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 2, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 2, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 2, 0, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 4, 0, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 4, 1, -0.5, 0.5, 0.5,
-3.874715, -4.114281, 4, 1, 1.5, 0.5, 0.5,
-3.874715, -4.114281, 4, 0, 1.5, 0.5, 0.5
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
-3.346255, -3.612888, -6.802292,
-3.346255, 3.072355, -6.802292,
-3.346255, -3.612888, 5.288259,
-3.346255, 3.072355, 5.288259,
-3.346255, -3.612888, -6.802292,
-3.346255, -3.612888, 5.288259,
-3.346255, 3.072355, -6.802292,
-3.346255, 3.072355, 5.288259,
-3.346255, -3.612888, -6.802292,
3.699877, -3.612888, -6.802292,
-3.346255, -3.612888, 5.288259,
3.699877, -3.612888, 5.288259,
-3.346255, 3.072355, -6.802292,
3.699877, 3.072355, -6.802292,
-3.346255, 3.072355, 5.288259,
3.699877, 3.072355, 5.288259,
3.699877, -3.612888, -6.802292,
3.699877, 3.072355, -6.802292,
3.699877, -3.612888, 5.288259,
3.699877, 3.072355, 5.288259,
3.699877, -3.612888, -6.802292,
3.699877, -3.612888, 5.288259,
3.699877, 3.072355, -6.802292,
3.699877, 3.072355, 5.288259
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
var radius = 8.281381;
var distance = 36.8448;
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
mvMatrix.translate( -0.1768111, 0.2702665, 0.7570167 );
mvMatrix.scale( 1.270767, 1.339367, 0.7405776 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.8448);
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
permite<-read.table("permite.xyz")
```

```
## Error in read.table("permite.xyz"): no lines available in input
```

```r
x<-permite$V2
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
y<-permite$V3
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
```

```r
z<-permite$V4
```

```
## Error in eval(expr, envir, enclos): object 'permite' not found
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
-3.243641, 0.1775554, -0.9459245, 0, 0, 1, 1, 1,
-3.163003, 0.3922209, 0.2018125, 1, 0, 0, 1, 1,
-2.859543, -2.560286, -1.265531, 1, 0, 0, 1, 1,
-2.849658, -1.786284, -1.315484, 1, 0, 0, 1, 1,
-2.817993, -0.4519757, -1.173507, 1, 0, 0, 1, 1,
-2.76652, 1.356894, -1.767948, 1, 0, 0, 1, 1,
-2.741338, -0.5334231, -2.129737, 0, 0, 0, 1, 1,
-2.732821, -1.369186, -2.038773, 0, 0, 0, 1, 1,
-2.706069, 0.06486851, -2.010284, 0, 0, 0, 1, 1,
-2.690349, 0.2839337, -1.116349, 0, 0, 0, 1, 1,
-2.633916, -1.06066, -2.328134, 0, 0, 0, 1, 1,
-2.572897, -0.3277287, -1.29674, 0, 0, 0, 1, 1,
-2.48295, -2.102754, -2.165197, 0, 0, 0, 1, 1,
-2.454724, -0.2989645, -1.145419, 1, 1, 1, 1, 1,
-2.427136, -0.3095315, -1.091426, 1, 1, 1, 1, 1,
-2.391457, -1.385918, -1.887976, 1, 1, 1, 1, 1,
-2.345706, -0.1732372, -0.1301745, 1, 1, 1, 1, 1,
-2.284122, 1.362916, -2.180707, 1, 1, 1, 1, 1,
-2.281955, 0.5195178, -0.8147911, 1, 1, 1, 1, 1,
-2.266684, -0.3799634, -0.3679208, 1, 1, 1, 1, 1,
-2.257714, 0.5893013, -1.708513, 1, 1, 1, 1, 1,
-2.224267, -0.8592612, -1.738855, 1, 1, 1, 1, 1,
-2.186642, -0.896724, -1.203804, 1, 1, 1, 1, 1,
-2.181543, -1.346256, -3.490424, 1, 1, 1, 1, 1,
-2.1802, 0.6981388, -0.9880745, 1, 1, 1, 1, 1,
-2.162992, 1.038344, -2.260468, 1, 1, 1, 1, 1,
-2.103029, -1.321291, -3.748985, 1, 1, 1, 1, 1,
-2.050931, 0.4424127, -1.94473, 1, 1, 1, 1, 1,
-2.045731, 0.9999816, -2.336482, 0, 0, 1, 1, 1,
-2.01213, 0.8641215, -0.7173625, 1, 0, 0, 1, 1,
-2.001966, 1.751421, -3.037331, 1, 0, 0, 1, 1,
-1.977723, 0.4348738, -0.5418649, 1, 0, 0, 1, 1,
-1.933126, 0.3707266, -3.044291, 1, 0, 0, 1, 1,
-1.911303, -0.52247, -0.8694165, 1, 0, 0, 1, 1,
-1.910767, 1.695023, -0.04194875, 0, 0, 0, 1, 1,
-1.899165, 1.573138, 0.08149352, 0, 0, 0, 1, 1,
-1.898695, -1.706974, -2.073126, 0, 0, 0, 1, 1,
-1.89407, -0.9894726, -1.870004, 0, 0, 0, 1, 1,
-1.887843, 0.9560407, -0.2499576, 0, 0, 0, 1, 1,
-1.87437, 0.9806532, -0.9172491, 0, 0, 0, 1, 1,
-1.829507, -0.8336849, -1.407888, 0, 0, 0, 1, 1,
-1.808406, 0.389392, -2.092617, 1, 1, 1, 1, 1,
-1.807702, -0.7374725, -0.3719924, 1, 1, 1, 1, 1,
-1.804951, 1.733654, -1.658678, 1, 1, 1, 1, 1,
-1.794204, -1.521129, -1.998901, 1, 1, 1, 1, 1,
-1.780186, -0.2694773, -0.1126223, 1, 1, 1, 1, 1,
-1.766071, 0.2945812, 0.4731153, 1, 1, 1, 1, 1,
-1.735636, -0.7939105, -2.661615, 1, 1, 1, 1, 1,
-1.730471, -0.6521839, -1.829007, 1, 1, 1, 1, 1,
-1.710267, 0.9517423, -0.7936186, 1, 1, 1, 1, 1,
-1.700024, 0.3478808, -1.44905, 1, 1, 1, 1, 1,
-1.692928, -1.210737, -1.50938, 1, 1, 1, 1, 1,
-1.688638, -1.145866, -2.534933, 1, 1, 1, 1, 1,
-1.68578, 0.5733608, -0.5086781, 1, 1, 1, 1, 1,
-1.684448, 0.09782287, -2.747065, 1, 1, 1, 1, 1,
-1.678079, 0.608891, 0.675353, 1, 1, 1, 1, 1,
-1.658407, 0.4115953, -2.485361, 0, 0, 1, 1, 1,
-1.650568, 0.6294143, -1.932093, 1, 0, 0, 1, 1,
-1.64678, 1.761678, 0.4623996, 1, 0, 0, 1, 1,
-1.643996, -0.04629837, 0.1270085, 1, 0, 0, 1, 1,
-1.634873, -1.240864, -2.27776, 1, 0, 0, 1, 1,
-1.626507, -0.1222671, -2.275826, 1, 0, 0, 1, 1,
-1.62346, -0.4436664, -0.4545897, 0, 0, 0, 1, 1,
-1.59249, -1.540877, -1.889987, 0, 0, 0, 1, 1,
-1.587389, 0.3490444, -0.439756, 0, 0, 0, 1, 1,
-1.579186, 0.5379823, -1.27599, 0, 0, 0, 1, 1,
-1.559206, 0.07845005, -0.4074478, 0, 0, 0, 1, 1,
-1.558729, 0.9925136, -0.5121578, 0, 0, 0, 1, 1,
-1.558311, 0.07688212, -0.05936325, 0, 0, 0, 1, 1,
-1.553292, -1.14969, -2.561574, 1, 1, 1, 1, 1,
-1.54316, 0.2375474, -2.616832, 1, 1, 1, 1, 1,
-1.504505, 0.1679027, -3.638335, 1, 1, 1, 1, 1,
-1.504014, -0.5727585, -2.697595, 1, 1, 1, 1, 1,
-1.50342, -1.159058, -2.302413, 1, 1, 1, 1, 1,
-1.501327, -0.7499684, -1.38433, 1, 1, 1, 1, 1,
-1.460725, -1.756659, -3.549452, 1, 1, 1, 1, 1,
-1.459451, -0.4555204, -2.048109, 1, 1, 1, 1, 1,
-1.45755, 1.134419, -0.9455479, 1, 1, 1, 1, 1,
-1.429262, 0.8357674, 0.6846551, 1, 1, 1, 1, 1,
-1.425626, -1.243469, -1.745302, 1, 1, 1, 1, 1,
-1.423133, -0.2339561, -1.78858, 1, 1, 1, 1, 1,
-1.403122, 0.4482574, -1.913359, 1, 1, 1, 1, 1,
-1.393032, 1.055265, -1.304472, 1, 1, 1, 1, 1,
-1.392539, -2.642397, -2.934101, 1, 1, 1, 1, 1,
-1.390971, -0.110635, -2.381583, 0, 0, 1, 1, 1,
-1.390232, -0.4269456, -1.793525, 1, 0, 0, 1, 1,
-1.388494, 0.6170576, -1.134711, 1, 0, 0, 1, 1,
-1.378511, -0.7694599, -1.08004, 1, 0, 0, 1, 1,
-1.376426, -1.879371, -2.337078, 1, 0, 0, 1, 1,
-1.353164, 0.2949196, -1.362899, 1, 0, 0, 1, 1,
-1.352841, -0.485884, -1.22628, 0, 0, 0, 1, 1,
-1.352789, -1.615604, -3.212198, 0, 0, 0, 1, 1,
-1.345758, 0.03291729, -2.755988, 0, 0, 0, 1, 1,
-1.337346, -0.1424397, 0.09071996, 0, 0, 0, 1, 1,
-1.317181, -1.671533, -0.7298179, 0, 0, 0, 1, 1,
-1.310723, -0.5630566, 0.2896337, 0, 0, 0, 1, 1,
-1.296577, 0.2301835, 0.4086037, 0, 0, 0, 1, 1,
-1.29259, -1.431135, -1.299169, 1, 1, 1, 1, 1,
-1.29069, 1.818137, -1.165128, 1, 1, 1, 1, 1,
-1.282421, 1.007544, 1.566377, 1, 1, 1, 1, 1,
-1.2812, 1.671598, -1.338131, 1, 1, 1, 1, 1,
-1.272198, 0.6124477, 0.9576465, 1, 1, 1, 1, 1,
-1.271373, 0.07165887, -1.837555, 1, 1, 1, 1, 1,
-1.270886, 0.6768354, -0.8455557, 1, 1, 1, 1, 1,
-1.269645, -0.1032812, -2.443222, 1, 1, 1, 1, 1,
-1.266595, -0.1240121, -0.1784824, 1, 1, 1, 1, 1,
-1.253124, 0.06851888, -1.165078, 1, 1, 1, 1, 1,
-1.247507, -1.898671, -3.153968, 1, 1, 1, 1, 1,
-1.244977, 0.6091766, -2.14373, 1, 1, 1, 1, 1,
-1.242894, -1.472684, 0.03542744, 1, 1, 1, 1, 1,
-1.237498, -0.3442003, -0.4071993, 1, 1, 1, 1, 1,
-1.229091, 0.364065, -0.7026384, 1, 1, 1, 1, 1,
-1.224266, 0.5074909, -1.361968, 0, 0, 1, 1, 1,
-1.218054, 0.6343541, -1.126777, 1, 0, 0, 1, 1,
-1.217295, 0.336348, -1.389095, 1, 0, 0, 1, 1,
-1.207938, 0.3367889, -2.281793, 1, 0, 0, 1, 1,
-1.202345, -0.3836625, -4.100359, 1, 0, 0, 1, 1,
-1.196236, -0.6332725, -2.527865, 1, 0, 0, 1, 1,
-1.180311, -1.539591, -2.249329, 0, 0, 0, 1, 1,
-1.176444, -1.205717, -2.606106, 0, 0, 0, 1, 1,
-1.176013, -0.9860945, -2.486118, 0, 0, 0, 1, 1,
-1.17376, -1.087543, -1.082144, 0, 0, 0, 1, 1,
-1.172698, -0.3696694, 0.0693019, 0, 0, 0, 1, 1,
-1.17165, 1.333245, 0.5566764, 0, 0, 0, 1, 1,
-1.170901, -0.2548138, -1.120501, 0, 0, 0, 1, 1,
-1.169939, -0.12331, -0.9300686, 1, 1, 1, 1, 1,
-1.164687, -0.5203261, -1.982377, 1, 1, 1, 1, 1,
-1.164308, 0.4725911, -2.051584, 1, 1, 1, 1, 1,
-1.164164, 0.9936898, -2.429445, 1, 1, 1, 1, 1,
-1.162126, 0.6975758, -1.949894, 1, 1, 1, 1, 1,
-1.147784, -0.1073726, -1.3005, 1, 1, 1, 1, 1,
-1.134352, 0.3716854, -1.36287, 1, 1, 1, 1, 1,
-1.125864, -0.9177688, -1.72054, 1, 1, 1, 1, 1,
-1.116159, 0.994141, -2.571192, 1, 1, 1, 1, 1,
-1.113105, 0.427404, -0.2635891, 1, 1, 1, 1, 1,
-1.111111, 1.370599, -0.4711421, 1, 1, 1, 1, 1,
-1.104809, -0.3064761, -1.61646, 1, 1, 1, 1, 1,
-1.100109, -0.6222588, -4.352676, 1, 1, 1, 1, 1,
-1.100041, 0.1321784, -2.027108, 1, 1, 1, 1, 1,
-1.091782, 0.07359297, -3.88085, 1, 1, 1, 1, 1,
-1.083874, -1.826421, -1.456797, 0, 0, 1, 1, 1,
-1.082558, 0.5966541, -1.887071, 1, 0, 0, 1, 1,
-1.080628, -0.9800875, -2.545758, 1, 0, 0, 1, 1,
-1.080294, 1.16438, -1.501142, 1, 0, 0, 1, 1,
-1.071635, 0.8582437, -1.228201, 1, 0, 0, 1, 1,
-1.068434, -0.05402654, -1.241963, 1, 0, 0, 1, 1,
-1.057206, -1.22687, -0.8307897, 0, 0, 0, 1, 1,
-1.054379, 0.3661662, -2.655489, 0, 0, 0, 1, 1,
-1.053028, -0.7476621, -3.213338, 0, 0, 0, 1, 1,
-1.051383, 0.6030388, -0.9261966, 0, 0, 0, 1, 1,
-1.051, 0.4551901, -2.878098, 0, 0, 0, 1, 1,
-1.047183, 0.9262722, 0.1037622, 0, 0, 0, 1, 1,
-1.046097, -0.9310986, -0.4361942, 0, 0, 0, 1, 1,
-1.034784, 1.172044, -0.7676011, 1, 1, 1, 1, 1,
-1.027797, -0.1042209, -0.225357, 1, 1, 1, 1, 1,
-1.020605, -1.100417, -2.02179, 1, 1, 1, 1, 1,
-1.007446, 1.075912, -0.7955486, 1, 1, 1, 1, 1,
-1.007342, -0.05859622, -2.822127, 1, 1, 1, 1, 1,
-0.998755, 0.8632483, -2.312477, 1, 1, 1, 1, 1,
-0.9978071, -0.7633023, -1.118143, 1, 1, 1, 1, 1,
-0.9912944, 1.613113, -1.709909, 1, 1, 1, 1, 1,
-0.9893131, 0.3975237, 0.2701162, 1, 1, 1, 1, 1,
-0.989056, 0.2413909, -0.7508919, 1, 1, 1, 1, 1,
-0.9865239, -0.6585171, -3.23475, 1, 1, 1, 1, 1,
-0.9792104, -0.3317197, -2.286206, 1, 1, 1, 1, 1,
-0.976831, -0.4884497, -1.882122, 1, 1, 1, 1, 1,
-0.9740193, -1.742916, -4.588813, 1, 1, 1, 1, 1,
-0.969029, 2.630584, 1.081028, 1, 1, 1, 1, 1,
-0.962552, 1.142333, -3.040689, 0, 0, 1, 1, 1,
-0.9582239, 1.235291, -0.04084162, 1, 0, 0, 1, 1,
-0.9495687, 0.6757407, -1.365622, 1, 0, 0, 1, 1,
-0.9413125, -0.9414762, -1.174951, 1, 0, 0, 1, 1,
-0.934711, 0.1499366, -2.095425, 1, 0, 0, 1, 1,
-0.934589, 0.4020894, -1.301908, 1, 0, 0, 1, 1,
-0.9221559, 2.156234, -0.02792305, 0, 0, 0, 1, 1,
-0.9212227, -0.674306, -2.449284, 0, 0, 0, 1, 1,
-0.9191741, 0.8971229, -2.213423, 0, 0, 0, 1, 1,
-0.9160144, 0.21381, -1.5113, 0, 0, 0, 1, 1,
-0.9157975, -1.412383, -2.612896, 0, 0, 0, 1, 1,
-0.9114631, 0.7416834, -0.6695468, 0, 0, 0, 1, 1,
-0.9109809, -0.6064318, -1.551327, 0, 0, 0, 1, 1,
-0.908116, -0.5615294, -2.416102, 1, 1, 1, 1, 1,
-0.9034706, -0.6493721, 0.2166854, 1, 1, 1, 1, 1,
-0.9017829, -1.412806, -2.224558, 1, 1, 1, 1, 1,
-0.9012071, 0.0361441, -1.307596, 1, 1, 1, 1, 1,
-0.9001881, -1.779459, -3.506728, 1, 1, 1, 1, 1,
-0.8984767, 0.3735843, -0.8966425, 1, 1, 1, 1, 1,
-0.8971555, 0.1731798, -2.082798, 1, 1, 1, 1, 1,
-0.8925372, 0.8916562, -1.438383, 1, 1, 1, 1, 1,
-0.8893049, -0.3633071, -0.08252795, 1, 1, 1, 1, 1,
-0.8849455, -1.826257, -1.548418, 1, 1, 1, 1, 1,
-0.880281, 1.473769, 0.09767184, 1, 1, 1, 1, 1,
-0.8787054, -0.3365214, -2.347257, 1, 1, 1, 1, 1,
-0.8784621, 0.03315515, -0.8939696, 1, 1, 1, 1, 1,
-0.875118, 0.8998124, -1.268444, 1, 1, 1, 1, 1,
-0.8731917, 0.1708997, -1.048975, 1, 1, 1, 1, 1,
-0.8719627, 1.103544, -0.2155868, 0, 0, 1, 1, 1,
-0.8674538, 0.3050177, -0.5168306, 1, 0, 0, 1, 1,
-0.8632979, -0.6286103, -3.082606, 1, 0, 0, 1, 1,
-0.8502384, -1.256459, -4.117936, 1, 0, 0, 1, 1,
-0.8491564, 1.455167, -2.05336, 1, 0, 0, 1, 1,
-0.8479167, 0.4263637, -1.835659, 1, 0, 0, 1, 1,
-0.8398418, -0.007737682, -1.551059, 0, 0, 0, 1, 1,
-0.8387924, -1.897175, -2.666858, 0, 0, 0, 1, 1,
-0.8358113, 1.195071, -0.1589149, 0, 0, 0, 1, 1,
-0.8329641, 0.6028807, -0.7048903, 0, 0, 0, 1, 1,
-0.8217267, -0.2117067, -1.110627, 0, 0, 0, 1, 1,
-0.8192582, 0.9934973, -1.012929, 0, 0, 0, 1, 1,
-0.8174846, -0.1151081, -0.4528415, 0, 0, 0, 1, 1,
-0.8166982, 0.4931117, 0.001269221, 1, 1, 1, 1, 1,
-0.8080988, -0.4217395, -1.629013, 1, 1, 1, 1, 1,
-0.8070361, 1.239127, 0.6382901, 1, 1, 1, 1, 1,
-0.8046441, 0.1480733, -0.05715273, 1, 1, 1, 1, 1,
-0.804371, 0.3860305, -0.1953822, 1, 1, 1, 1, 1,
-0.8003626, -0.8918734, -1.406944, 1, 1, 1, 1, 1,
-0.7971225, -0.8325372, -0.2204296, 1, 1, 1, 1, 1,
-0.77763, 0.1138684, -1.402955, 1, 1, 1, 1, 1,
-0.7773381, 0.5558612, -2.607498, 1, 1, 1, 1, 1,
-0.7690856, -2.138378, -1.581043, 1, 1, 1, 1, 1,
-0.7650567, -0.2227806, -1.28158, 1, 1, 1, 1, 1,
-0.7645808, -1.132592, -5.061741, 1, 1, 1, 1, 1,
-0.7640573, 0.553745, 0.0003819178, 1, 1, 1, 1, 1,
-0.7529446, 0.3611906, -1.873749, 1, 1, 1, 1, 1,
-0.7515773, -0.02963953, -1.300213, 1, 1, 1, 1, 1,
-0.7445632, 0.685717, -0.9363912, 0, 0, 1, 1, 1,
-0.7388644, 1.578495, 2.442916, 1, 0, 0, 1, 1,
-0.7350604, 0.6914808, -1.403317, 1, 0, 0, 1, 1,
-0.7279424, -0.2974454, -2.49713, 1, 0, 0, 1, 1,
-0.7277313, -0.007795791, -2.773954, 1, 0, 0, 1, 1,
-0.7266384, 0.2515949, 0.1426876, 1, 0, 0, 1, 1,
-0.7244797, -0.1070244, -0.7009308, 0, 0, 0, 1, 1,
-0.7206351, 1.221949, -2.983186, 0, 0, 0, 1, 1,
-0.7201855, -0.1428781, -1.293432, 0, 0, 0, 1, 1,
-0.718434, 0.6247082, -0.09098157, 0, 0, 0, 1, 1,
-0.7176558, -0.6805624, -4.171185, 0, 0, 0, 1, 1,
-0.7151368, -0.7918568, -2.17104, 0, 0, 0, 1, 1,
-0.7114198, 0.317321, -0.1854385, 0, 0, 0, 1, 1,
-0.7070971, 0.05935096, -1.250441, 1, 1, 1, 1, 1,
-0.7036817, 0.6774745, -0.7305544, 1, 1, 1, 1, 1,
-0.7031016, -1.543982, -1.719945, 1, 1, 1, 1, 1,
-0.7024639, 0.2774763, -0.997385, 1, 1, 1, 1, 1,
-0.6999267, 2.021984, 0.3582138, 1, 1, 1, 1, 1,
-0.6988501, 0.882432, 0.9672092, 1, 1, 1, 1, 1,
-0.6932086, -0.6987023, -2.257502, 1, 1, 1, 1, 1,
-0.6931129, 1.099012, -1.437237, 1, 1, 1, 1, 1,
-0.6920204, -0.6004019, -2.026103, 1, 1, 1, 1, 1,
-0.6901239, 0.775492, -1.452677, 1, 1, 1, 1, 1,
-0.6869217, -0.9264858, -4.676989, 1, 1, 1, 1, 1,
-0.6827975, -1.460203, -1.316281, 1, 1, 1, 1, 1,
-0.6823893, 0.423643, 0.05143641, 1, 1, 1, 1, 1,
-0.676813, -0.3669743, -3.062526, 1, 1, 1, 1, 1,
-0.6765795, 0.1055971, 1.512002, 1, 1, 1, 1, 1,
-0.6738763, 0.5686215, -0.8292139, 0, 0, 1, 1, 1,
-0.6720196, 0.6228119, -1.139407, 1, 0, 0, 1, 1,
-0.6649905, -0.4519928, -3.129064, 1, 0, 0, 1, 1,
-0.6643442, 0.2523888, -0.302783, 1, 0, 0, 1, 1,
-0.6599746, -0.04817707, -3.12095, 1, 0, 0, 1, 1,
-0.6495095, -0.2585328, -3.199578, 1, 0, 0, 1, 1,
-0.6406642, -2.13786, -3.438496, 0, 0, 0, 1, 1,
-0.63767, 1.614723, 0.5070912, 0, 0, 0, 1, 1,
-0.6304473, -1.39892, -1.203883, 0, 0, 0, 1, 1,
-0.6282561, -0.7495783, -3.25941, 0, 0, 0, 1, 1,
-0.6280136, -0.4206023, -2.959248, 0, 0, 0, 1, 1,
-0.6226149, 0.5677985, -0.4078245, 0, 0, 0, 1, 1,
-0.6224961, 0.5004222, -1.144602, 0, 0, 0, 1, 1,
-0.6214998, 0.7870637, 0.9357098, 1, 1, 1, 1, 1,
-0.6204791, -1.045052, -1.712681, 1, 1, 1, 1, 1,
-0.6155607, -0.3125646, -1.556852, 1, 1, 1, 1, 1,
-0.6115653, 0.7100761, -1.165768, 1, 1, 1, 1, 1,
-0.6113297, -0.967265, -2.223694, 1, 1, 1, 1, 1,
-0.5996456, -0.1853546, -1.119877, 1, 1, 1, 1, 1,
-0.5961804, -0.528199, -1.091357, 1, 1, 1, 1, 1,
-0.592303, 1.132434, -0.2153268, 1, 1, 1, 1, 1,
-0.5909752, 0.7014406, -0.3160786, 1, 1, 1, 1, 1,
-0.5884072, 1.152809, 0.7970447, 1, 1, 1, 1, 1,
-0.5875957, 0.8802714, -0.4298854, 1, 1, 1, 1, 1,
-0.5830291, 1.139621, -0.1099043, 1, 1, 1, 1, 1,
-0.5823124, 0.1710695, -1.268538, 1, 1, 1, 1, 1,
-0.5750652, 1.476274, 0.7650186, 1, 1, 1, 1, 1,
-0.5728535, -0.2390026, -0.634784, 1, 1, 1, 1, 1,
-0.5691146, 0.9684576, -1.48213, 0, 0, 1, 1, 1,
-0.5686777, 0.4849144, -2.695904, 1, 0, 0, 1, 1,
-0.5678826, 0.09483032, -1.638043, 1, 0, 0, 1, 1,
-0.5663078, 1.721306, -1.434245, 1, 0, 0, 1, 1,
-0.5659935, -0.3288874, -3.202262, 1, 0, 0, 1, 1,
-0.5632975, 0.2657796, -0.4163227, 1, 0, 0, 1, 1,
-0.5626776, 0.8599665, 0.05544376, 0, 0, 0, 1, 1,
-0.5546548, -0.4507726, -2.919793, 0, 0, 0, 1, 1,
-0.5438628, -0.06372682, -0.4629186, 0, 0, 0, 1, 1,
-0.5429526, -1.480657, -1.339015, 0, 0, 0, 1, 1,
-0.5425602, -0.2711039, -2.383226, 0, 0, 0, 1, 1,
-0.5390794, -0.157825, -2.895512, 0, 0, 0, 1, 1,
-0.5293558, -1.073346, -2.146174, 0, 0, 0, 1, 1,
-0.5275069, 0.9148363, 0.3911045, 1, 1, 1, 1, 1,
-0.5264059, 0.7286881, -0.8670231, 1, 1, 1, 1, 1,
-0.5209121, 0.6659627, -0.3168341, 1, 1, 1, 1, 1,
-0.5177836, -0.5115187, -2.572138, 1, 1, 1, 1, 1,
-0.5125783, 0.831623, -1.479529, 1, 1, 1, 1, 1,
-0.5008922, -2.784205, -2.065072, 1, 1, 1, 1, 1,
-0.4987538, -0.6905795, -3.692997, 1, 1, 1, 1, 1,
-0.4982331, 0.9378639, -1.13631, 1, 1, 1, 1, 1,
-0.4975624, -0.4244978, -3.168413, 1, 1, 1, 1, 1,
-0.4967727, 0.681975, 0.7361913, 1, 1, 1, 1, 1,
-0.4935907, 1.105195, 0.8581989, 1, 1, 1, 1, 1,
-0.4917984, 0.2748537, -1.211349, 1, 1, 1, 1, 1,
-0.490684, -1.750264, -3.580428, 1, 1, 1, 1, 1,
-0.4857921, -0.5378497, -2.52823, 1, 1, 1, 1, 1,
-0.4839701, -1.00172, -2.951443, 1, 1, 1, 1, 1,
-0.4829879, 0.5466118, -1.779286, 0, 0, 1, 1, 1,
-0.4828465, -0.03738222, -0.621834, 1, 0, 0, 1, 1,
-0.4813326, 0.2413414, -0.246002, 1, 0, 0, 1, 1,
-0.4810434, -0.9728954, -2.415571, 1, 0, 0, 1, 1,
-0.4797201, 0.04980497, -1.700552, 1, 0, 0, 1, 1,
-0.4725842, -0.4113357, -5.302206, 1, 0, 0, 1, 1,
-0.4709646, -0.1082902, -1.111858, 0, 0, 0, 1, 1,
-0.4704718, -0.274352, -2.079033, 0, 0, 0, 1, 1,
-0.4688708, 0.1863009, -2.121436, 0, 0, 0, 1, 1,
-0.4626242, 1.047269, 0.5006712, 0, 0, 0, 1, 1,
-0.437735, 0.9442606, -0.0335692, 0, 0, 0, 1, 1,
-0.4307482, -0.9060553, -2.219511, 0, 0, 0, 1, 1,
-0.429664, 0.9627777, -0.7004871, 0, 0, 0, 1, 1,
-0.4267504, -0.0239368, -4.811594, 1, 1, 1, 1, 1,
-0.4255882, 2.329458, -1.437445, 1, 1, 1, 1, 1,
-0.4231644, -0.04542926, -2.584314, 1, 1, 1, 1, 1,
-0.4221347, -0.2551109, -0.8415818, 1, 1, 1, 1, 1,
-0.4216632, 0.2504362, -0.6437777, 1, 1, 1, 1, 1,
-0.4200762, -0.4802015, -4.286723, 1, 1, 1, 1, 1,
-0.4187188, -0.1324476, -1.706348, 1, 1, 1, 1, 1,
-0.4172876, -0.5455934, -2.097407, 1, 1, 1, 1, 1,
-0.417212, -0.5838676, -3.472695, 1, 1, 1, 1, 1,
-0.4139817, -0.2446804, -1.322561, 1, 1, 1, 1, 1,
-0.4110372, 2.459424, 0.2670489, 1, 1, 1, 1, 1,
-0.4093843, 0.122968, -0.6262507, 1, 1, 1, 1, 1,
-0.4076535, -0.1222794, -2.363561, 1, 1, 1, 1, 1,
-0.4029382, -2.214775, -2.55726, 1, 1, 1, 1, 1,
-0.4011619, -2.367882, -2.955471, 1, 1, 1, 1, 1,
-0.3978852, -1.130524, -1.427675, 0, 0, 1, 1, 1,
-0.3956813, -0.8331306, -2.50131, 1, 0, 0, 1, 1,
-0.3938835, 1.017681, -1.572747, 1, 0, 0, 1, 1,
-0.3929068, 0.5058157, -0.6415508, 1, 0, 0, 1, 1,
-0.3910877, -0.937058, -1.4561, 1, 0, 0, 1, 1,
-0.3909808, 0.3896039, -2.639281, 1, 0, 0, 1, 1,
-0.3886394, -0.2354694, -2.387472, 0, 0, 0, 1, 1,
-0.387152, 1.366761, 0.6382321, 0, 0, 0, 1, 1,
-0.3841699, 0.9540861, 0.2561215, 0, 0, 0, 1, 1,
-0.3809085, -2.42938, -3.665413, 0, 0, 0, 1, 1,
-0.379709, 0.5288414, 0.2549134, 0, 0, 0, 1, 1,
-0.3792179, -0.0008679469, 0.4829302, 0, 0, 0, 1, 1,
-0.3719889, 0.3394851, -1.410574, 0, 0, 0, 1, 1,
-0.3708157, 0.2923894, -0.188741, 1, 1, 1, 1, 1,
-0.3617636, -0.4503773, -4.034286, 1, 1, 1, 1, 1,
-0.361019, 0.7625747, -0.4010153, 1, 1, 1, 1, 1,
-0.3579819, 0.5668352, -1.689449, 1, 1, 1, 1, 1,
-0.3574136, 0.8626444, -0.6299213, 1, 1, 1, 1, 1,
-0.3562422, -3.284842, -4.417101, 1, 1, 1, 1, 1,
-0.3518624, -0.11009, -1.451611, 1, 1, 1, 1, 1,
-0.3517083, -0.7816009, -1.279692, 1, 1, 1, 1, 1,
-0.3488311, 0.6057582, -0.1516915, 1, 1, 1, 1, 1,
-0.3450813, -0.5986268, -4.866559, 1, 1, 1, 1, 1,
-0.3435775, 0.02326667, -1.576407, 1, 1, 1, 1, 1,
-0.3434614, -0.1420899, -1.362863, 1, 1, 1, 1, 1,
-0.3431596, -0.8885835, -0.4567719, 1, 1, 1, 1, 1,
-0.339816, -0.2029578, -3.08334, 1, 1, 1, 1, 1,
-0.3377252, -1.814293, -2.172463, 1, 1, 1, 1, 1,
-0.3356444, -2.398138, -1.235863, 0, 0, 1, 1, 1,
-0.332931, 0.1160284, -0.7999192, 1, 0, 0, 1, 1,
-0.3303484, 0.7797964, 0.1189086, 1, 0, 0, 1, 1,
-0.3278767, 0.8103587, -0.2144448, 1, 0, 0, 1, 1,
-0.3272366, -0.5099628, -1.70568, 1, 0, 0, 1, 1,
-0.3245835, -0.1349155, 0.146211, 1, 0, 0, 1, 1,
-0.3240688, -1.151187, -2.537997, 0, 0, 0, 1, 1,
-0.322603, -0.2285348, -1.765602, 0, 0, 0, 1, 1,
-0.3219137, 1.045761, -1.82486, 0, 0, 0, 1, 1,
-0.3203619, -1.090729, -1.642961, 0, 0, 0, 1, 1,
-0.3175467, 1.67662, 0.9122511, 0, 0, 0, 1, 1,
-0.3157035, -0.09253604, -1.476043, 0, 0, 0, 1, 1,
-0.3105081, -0.3531426, -1.558332, 0, 0, 0, 1, 1,
-0.3070014, -2.380996, -2.035322, 1, 1, 1, 1, 1,
-0.3068079, -0.4177341, -3.013474, 1, 1, 1, 1, 1,
-0.3045794, -0.06952297, -2.314207, 1, 1, 1, 1, 1,
-0.2993117, -0.5632122, -1.550943, 1, 1, 1, 1, 1,
-0.2977519, -1.063237, -3.976562, 1, 1, 1, 1, 1,
-0.296877, -0.9415854, -2.6404, 1, 1, 1, 1, 1,
-0.2896867, -2.571887, -4.903836, 1, 1, 1, 1, 1,
-0.2865739, 0.4981186, -0.3886245, 1, 1, 1, 1, 1,
-0.2861595, 0.4668329, -1.03964, 1, 1, 1, 1, 1,
-0.2818436, -2.57232, -3.049675, 1, 1, 1, 1, 1,
-0.2802433, -0.4376671, -0.9144593, 1, 1, 1, 1, 1,
-0.2801496, 1.106847, -0.8251271, 1, 1, 1, 1, 1,
-0.2790232, 0.04882317, -0.6669233, 1, 1, 1, 1, 1,
-0.2746269, 0.5845122, -1.291933, 1, 1, 1, 1, 1,
-0.273354, -1.426872, -2.040167, 1, 1, 1, 1, 1,
-0.2715951, -0.05356641, -3.03134, 0, 0, 1, 1, 1,
-0.2697041, -0.9924435, -1.907727, 1, 0, 0, 1, 1,
-0.2685582, -1.624537, -4.243046, 1, 0, 0, 1, 1,
-0.2662733, 1.94445, -0.8902411, 1, 0, 0, 1, 1,
-0.2662556, 1.029034, 1.881931, 1, 0, 0, 1, 1,
-0.262363, 0.02511467, -1.903676, 1, 0, 0, 1, 1,
-0.2596352, -0.2994702, -2.536728, 0, 0, 0, 1, 1,
-0.2559658, 2.374873, 0.8541435, 0, 0, 0, 1, 1,
-0.2488739, -1.577696, -4.757246, 0, 0, 0, 1, 1,
-0.2475893, 0.7269955, -1.276535, 0, 0, 0, 1, 1,
-0.2474989, -2.657104, -4.318468, 0, 0, 0, 1, 1,
-0.2452734, 1.615964, -0.7809943, 0, 0, 0, 1, 1,
-0.2444744, -0.1098547, -0.9262363, 0, 0, 0, 1, 1,
-0.242494, -1.451318, -2.770183, 1, 1, 1, 1, 1,
-0.2420881, -1.099622, -2.852339, 1, 1, 1, 1, 1,
-0.2418474, 0.237261, -1.976252, 1, 1, 1, 1, 1,
-0.2409813, 0.2427958, -2.60825, 1, 1, 1, 1, 1,
-0.2311864, -1.850252, -4.130115, 1, 1, 1, 1, 1,
-0.2252676, -0.3577748, -1.175532, 1, 1, 1, 1, 1,
-0.2243961, 1.107517, 1.176805, 1, 1, 1, 1, 1,
-0.2219252, 0.6993409, 0.8417751, 1, 1, 1, 1, 1,
-0.2208541, -0.3118825, -2.661255, 1, 1, 1, 1, 1,
-0.2207001, 0.8228394, -0.9530975, 1, 1, 1, 1, 1,
-0.2179346, 0.6204389, -1.834969, 1, 1, 1, 1, 1,
-0.2175941, -1.906432, -6.626216, 1, 1, 1, 1, 1,
-0.2114876, -1.464297, -4.235529, 1, 1, 1, 1, 1,
-0.2108377, 0.3576973, -0.2652482, 1, 1, 1, 1, 1,
-0.2104467, 0.1043004, 0.6213033, 1, 1, 1, 1, 1,
-0.209262, 0.8214744, -1.219036, 0, 0, 1, 1, 1,
-0.2074512, -0.5766062, -1.645716, 1, 0, 0, 1, 1,
-0.2041984, 0.8649186, 0.8455027, 1, 0, 0, 1, 1,
-0.2005068, -0.6818876, -0.7778051, 1, 0, 0, 1, 1,
-0.1981149, -0.249696, -4.142727, 1, 0, 0, 1, 1,
-0.1973739, -1.138424, -3.868692, 1, 0, 0, 1, 1,
-0.1918074, -0.6047523, -2.556132, 0, 0, 0, 1, 1,
-0.1872333, 1.134265, 1.804786, 0, 0, 0, 1, 1,
-0.1794824, 0.309506, 0.660963, 0, 0, 0, 1, 1,
-0.1782861, -0.438655, -3.456501, 0, 0, 0, 1, 1,
-0.1776434, 0.06461896, -2.235927, 0, 0, 0, 1, 1,
-0.1757021, -0.4220761, -2.923078, 0, 0, 0, 1, 1,
-0.1749991, -0.8481654, -4.647198, 0, 0, 0, 1, 1,
-0.1736067, 0.6134143, 0.4224308, 1, 1, 1, 1, 1,
-0.172879, 0.4327591, -1.050485, 1, 1, 1, 1, 1,
-0.1723536, 0.2200853, -1.902308, 1, 1, 1, 1, 1,
-0.1714411, 0.1785598, -1.178843, 1, 1, 1, 1, 1,
-0.1668785, 0.337685, 2.19468, 1, 1, 1, 1, 1,
-0.1634316, -0.9884748, -2.493015, 1, 1, 1, 1, 1,
-0.1612283, 0.4377713, 0.2606672, 1, 1, 1, 1, 1,
-0.1605313, 0.2663578, 0.4248243, 1, 1, 1, 1, 1,
-0.1593451, -0.6821086, -0.6206318, 1, 1, 1, 1, 1,
-0.1564918, 0.3352366, -1.000371, 1, 1, 1, 1, 1,
-0.156198, 0.177701, -1.119014, 1, 1, 1, 1, 1,
-0.1537753, 1.009381, -1.053965, 1, 1, 1, 1, 1,
-0.152769, -0.4480142, -2.983202, 1, 1, 1, 1, 1,
-0.1467938, -0.3578495, -3.25323, 1, 1, 1, 1, 1,
-0.1446465, 0.4372024, -1.681517, 1, 1, 1, 1, 1,
-0.1443608, 0.6821192, -1.506392, 0, 0, 1, 1, 1,
-0.1429689, -0.8412938, -2.809354, 1, 0, 0, 1, 1,
-0.1344977, 1.828894, -1.422763, 1, 0, 0, 1, 1,
-0.1326085, 0.5852762, 2.475123, 1, 0, 0, 1, 1,
-0.1306401, -0.6740894, -4.661836, 1, 0, 0, 1, 1,
-0.1291302, -0.08877494, -1.883325, 1, 0, 0, 1, 1,
-0.123982, 1.696105, -0.1136531, 0, 0, 0, 1, 1,
-0.123281, 0.7669491, 0.05514447, 0, 0, 0, 1, 1,
-0.122048, 0.6819718, 1.107497, 0, 0, 0, 1, 1,
-0.1209766, 1.664575, -1.027609, 0, 0, 0, 1, 1,
-0.1207495, 1.616441, 0.5478588, 0, 0, 0, 1, 1,
-0.1197897, 0.0005184343, -2.532919, 0, 0, 0, 1, 1,
-0.1190412, 0.6647989, -0.9773085, 0, 0, 0, 1, 1,
-0.1132968, 0.5422438, -1.489077, 1, 1, 1, 1, 1,
-0.112342, -1.0677, -3.680449, 1, 1, 1, 1, 1,
-0.1059812, 0.4132188, -0.3472319, 1, 1, 1, 1, 1,
-0.09732675, 1.974776, 0.1424886, 1, 1, 1, 1, 1,
-0.09409933, -1.050885, -2.311129, 1, 1, 1, 1, 1,
-0.09288174, -0.9036162, -3.693635, 1, 1, 1, 1, 1,
-0.09191266, -0.5781696, -2.274822, 1, 1, 1, 1, 1,
-0.08911648, -0.1470173, -3.16717, 1, 1, 1, 1, 1,
-0.08848594, 0.5713151, 1.02694, 1, 1, 1, 1, 1,
-0.08661989, 0.1160464, -0.7217119, 1, 1, 1, 1, 1,
-0.08560259, -0.518332, -2.808829, 1, 1, 1, 1, 1,
-0.08334294, -1.028485, -3.770409, 1, 1, 1, 1, 1,
-0.06877989, 0.4866794, 0.4943693, 1, 1, 1, 1, 1,
-0.06823795, 2.214507, 0.6868308, 1, 1, 1, 1, 1,
-0.06759748, -0.4298597, -4.058577, 1, 1, 1, 1, 1,
-0.06460559, -0.03426198, -1.542903, 0, 0, 1, 1, 1,
-0.05917278, 1.644741, 0.1719767, 1, 0, 0, 1, 1,
-0.05824287, 0.6761599, 0.1593284, 1, 0, 0, 1, 1,
-0.05384678, 0.6179851, 0.1381144, 1, 0, 0, 1, 1,
-0.04147428, -0.3240751, -2.513125, 1, 0, 0, 1, 1,
-0.03928124, 0.1909989, 1.208804, 1, 0, 0, 1, 1,
-0.039264, 1.54119, 0.4036142, 0, 0, 0, 1, 1,
-0.03902139, -1.042835, -2.607968, 0, 0, 0, 1, 1,
-0.03728613, 0.6221881, -0.2053523, 0, 0, 0, 1, 1,
-0.03199283, -0.3824499, -4.174549, 0, 0, 0, 1, 1,
-0.03085558, -0.06069605, -2.83586, 0, 0, 0, 1, 1,
-0.02922699, -1.459339, -2.726507, 0, 0, 0, 1, 1,
-0.02806906, 1.537231, 1.422132, 0, 0, 0, 1, 1,
-0.02724065, -2.36535, -5.033967, 1, 1, 1, 1, 1,
-0.02538706, 0.3834878, -0.8680607, 1, 1, 1, 1, 1,
-0.02111554, 1.725443, 0.6746601, 1, 1, 1, 1, 1,
-0.01519522, 0.4029548, -1.087932, 1, 1, 1, 1, 1,
-0.009966003, -0.6745129, -1.879598, 1, 1, 1, 1, 1,
-0.007968885, -0.132252, -3.0416, 1, 1, 1, 1, 1,
-0.005582319, -2.058719, -3.295587, 1, 1, 1, 1, 1,
-0.003981687, 0.4101875, 0.7671387, 1, 1, 1, 1, 1,
-0.003250496, -1.238546, -3.414264, 1, 1, 1, 1, 1,
-0.002898206, 1.156509, 0.8986273, 1, 1, 1, 1, 1,
-0.001727079, 0.3865007, 1.923749, 1, 1, 1, 1, 1,
-0.0001303473, 0.8082611, 1.141625, 1, 1, 1, 1, 1,
0.006127149, 0.9645287, 1.281117, 1, 1, 1, 1, 1,
0.007502224, -0.2585045, 4.911571, 1, 1, 1, 1, 1,
0.009437548, -0.1865962, 1.706035, 1, 1, 1, 1, 1,
0.01133719, -0.4338107, 3.95385, 0, 0, 1, 1, 1,
0.01794296, -0.04681104, 3.100584, 1, 0, 0, 1, 1,
0.02140536, -1.278536, 2.93099, 1, 0, 0, 1, 1,
0.021879, 1.708849, -0.6658821, 1, 0, 0, 1, 1,
0.02193561, -0.4111157, 3.068426, 1, 0, 0, 1, 1,
0.02689795, 1.446536, -0.0057721, 1, 0, 0, 1, 1,
0.02757872, -0.344988, 2.26777, 0, 0, 0, 1, 1,
0.03207473, 0.4655142, 1.055502, 0, 0, 0, 1, 1,
0.03227973, -0.4140261, 3.036702, 0, 0, 0, 1, 1,
0.03243331, -0.2431521, 4.279589, 0, 0, 0, 1, 1,
0.0391377, 0.3073731, 1.928654, 0, 0, 0, 1, 1,
0.04179961, -1.506965, 3.657109, 0, 0, 0, 1, 1,
0.04263588, 1.79692, -0.8567849, 0, 0, 0, 1, 1,
0.04349206, 0.5433481, -0.2959761, 1, 1, 1, 1, 1,
0.0451042, 0.2945551, -1.893074, 1, 1, 1, 1, 1,
0.05530597, -0.3401003, 4.54341, 1, 1, 1, 1, 1,
0.0589584, -1.677424, 2.658457, 1, 1, 1, 1, 1,
0.06136665, 0.09093605, -0.7693079, 1, 1, 1, 1, 1,
0.06157081, -1.243495, 3.23215, 1, 1, 1, 1, 1,
0.0624356, 0.7983963, 0.2002256, 1, 1, 1, 1, 1,
0.06659196, 1.420542, -0.009153111, 1, 1, 1, 1, 1,
0.06686718, -0.1294756, 2.962884, 1, 1, 1, 1, 1,
0.07904197, 0.560838, -1.134262, 1, 1, 1, 1, 1,
0.08028271, -1.85954, 0.7663435, 1, 1, 1, 1, 1,
0.08568666, 0.08135954, 0.446864, 1, 1, 1, 1, 1,
0.08707725, -0.7672721, 5.112183, 1, 1, 1, 1, 1,
0.09231337, 0.05370631, 1.116462, 1, 1, 1, 1, 1,
0.09328771, -2.24496, 3.513744, 1, 1, 1, 1, 1,
0.09338713, -1.442532, 3.258351, 0, 0, 1, 1, 1,
0.09370612, -0.5495744, 4.789212, 1, 0, 0, 1, 1,
0.09507354, 0.805098, 0.1743122, 1, 0, 0, 1, 1,
0.09768645, -0.8307556, 3.427107, 1, 0, 0, 1, 1,
0.0983237, -1.046346, 3.073661, 1, 0, 0, 1, 1,
0.1030855, -1.013156, 4.05062, 1, 0, 0, 1, 1,
0.103638, -0.3290672, 4.628335, 0, 0, 0, 1, 1,
0.1077889, 0.7759276, 0.1642356, 0, 0, 0, 1, 1,
0.1083065, 0.5479708, 0.847546, 0, 0, 0, 1, 1,
0.119076, -0.1939262, 2.084241, 0, 0, 0, 1, 1,
0.1198143, -0.4405661, 1.560809, 0, 0, 0, 1, 1,
0.120389, -0.8364545, 3.19541, 0, 0, 0, 1, 1,
0.1210359, -0.989828, 2.36834, 0, 0, 0, 1, 1,
0.122851, 0.08478166, -0.5124643, 1, 1, 1, 1, 1,
0.1234758, 1.201949, 0.2078863, 1, 1, 1, 1, 1,
0.1276463, -1.391597, 2.691158, 1, 1, 1, 1, 1,
0.1283476, -1.104738, 3.340012, 1, 1, 1, 1, 1,
0.1304873, -0.2698939, 1.600958, 1, 1, 1, 1, 1,
0.1308572, 0.3722191, 0.9358392, 1, 1, 1, 1, 1,
0.136302, 0.4415078, -1.648924, 1, 1, 1, 1, 1,
0.1413774, -2.933168, 3.742313, 1, 1, 1, 1, 1,
0.1426004, -0.2424484, 3.380868, 1, 1, 1, 1, 1,
0.1434326, 0.06345014, 0.3786598, 1, 1, 1, 1, 1,
0.1438697, 0.4513347, 1.129106, 1, 1, 1, 1, 1,
0.1481831, 0.2763075, -0.4788147, 1, 1, 1, 1, 1,
0.1519364, 1.390072, -0.04046803, 1, 1, 1, 1, 1,
0.1526878, -0.7403836, 1.110141, 1, 1, 1, 1, 1,
0.1559728, 0.6518578, -1.814259, 1, 1, 1, 1, 1,
0.1568888, 0.5653403, -0.001106052, 0, 0, 1, 1, 1,
0.1577863, -1.535952, 4.186931, 1, 0, 0, 1, 1,
0.1658705, -0.07350182, 1.322884, 1, 0, 0, 1, 1,
0.1676298, -0.3061881, 3.652184, 1, 0, 0, 1, 1,
0.1697953, 0.6056876, -1.038295, 1, 0, 0, 1, 1,
0.1707306, -0.7190355, 2.424145, 1, 0, 0, 1, 1,
0.1776986, 0.6797252, -1.196795, 0, 0, 0, 1, 1,
0.1777305, 0.037419, 2.767374, 0, 0, 0, 1, 1,
0.1796989, 1.019353, 1.537165, 0, 0, 0, 1, 1,
0.18212, -0.6741212, 2.403472, 0, 0, 0, 1, 1,
0.1923086, -0.1375083, 2.277726, 0, 0, 0, 1, 1,
0.1923413, -0.242795, 4.636758, 0, 0, 0, 1, 1,
0.1980522, -2.162581, 3.070539, 0, 0, 0, 1, 1,
0.198465, 0.007713058, 1.166856, 1, 1, 1, 1, 1,
0.1992508, 0.8691466, -0.2482611, 1, 1, 1, 1, 1,
0.2015921, -0.7022594, 3.6531, 1, 1, 1, 1, 1,
0.2119414, -0.06104552, 0.8024433, 1, 1, 1, 1, 1,
0.2166186, -1.636794, 3.157455, 1, 1, 1, 1, 1,
0.2176746, -0.5032465, 2.605329, 1, 1, 1, 1, 1,
0.2188345, -1.575619, 1.492145, 1, 1, 1, 1, 1,
0.22214, 2.89041, -0.2016806, 1, 1, 1, 1, 1,
0.2252679, 0.806477, 0.4323575, 1, 1, 1, 1, 1,
0.2258495, 0.4248007, 1.32837, 1, 1, 1, 1, 1,
0.2280031, -0.4639134, 4.141567, 1, 1, 1, 1, 1,
0.2281088, -0.2494308, 1.429998, 1, 1, 1, 1, 1,
0.2283319, -0.7491773, 3.834792, 1, 1, 1, 1, 1,
0.233865, -0.2235325, 3.4025, 1, 1, 1, 1, 1,
0.2361047, -0.4709269, 1.463374, 1, 1, 1, 1, 1,
0.2405314, -0.1339353, 0.9675344, 0, 0, 1, 1, 1,
0.2444848, -1.798634, 1.343998, 1, 0, 0, 1, 1,
0.2447094, 0.02489897, 2.12502, 1, 0, 0, 1, 1,
0.2452918, 0.6625465, -1.036609, 1, 0, 0, 1, 1,
0.248062, -1.19175, 2.756959, 1, 0, 0, 1, 1,
0.2485044, -0.9672176, 3.445449, 1, 0, 0, 1, 1,
0.2516422, 0.7733978, 1.171471, 0, 0, 0, 1, 1,
0.256193, -1.062749, 1.613412, 0, 0, 0, 1, 1,
0.2599355, 0.8602181, 0.4544383, 0, 0, 0, 1, 1,
0.2621388, 1.005768, 0.1020783, 0, 0, 0, 1, 1,
0.2651203, 0.07120748, 0.7695409, 0, 0, 0, 1, 1,
0.2653525, 0.477645, 2.146369, 0, 0, 0, 1, 1,
0.2658572, -1.172884, 4.160267, 0, 0, 0, 1, 1,
0.2664255, 0.3999999, -0.3762146, 1, 1, 1, 1, 1,
0.2695425, -0.3879711, 2.96632, 1, 1, 1, 1, 1,
0.2698097, 0.2941789, 0.1064616, 1, 1, 1, 1, 1,
0.2766636, -1.238743, 3.484889, 1, 1, 1, 1, 1,
0.2772141, -0.0196485, 0.8865241, 1, 1, 1, 1, 1,
0.2777463, -0.5560461, 5.099256, 1, 1, 1, 1, 1,
0.2797298, 0.2738144, 2.730907, 1, 1, 1, 1, 1,
0.2813262, -0.141044, 1.206844, 1, 1, 1, 1, 1,
0.2827618, 0.525247, -0.6375677, 1, 1, 1, 1, 1,
0.2834113, -0.2243026, 1.775446, 1, 1, 1, 1, 1,
0.2850593, -2.649264, 2.491706, 1, 1, 1, 1, 1,
0.2870056, 0.6888869, 1.048708, 1, 1, 1, 1, 1,
0.2892066, -1.661096, 1.627923, 1, 1, 1, 1, 1,
0.2897199, 0.08192474, 2.92853, 1, 1, 1, 1, 1,
0.2900664, -0.8250898, 3.189122, 1, 1, 1, 1, 1,
0.2922789, 0.4016402, 0.9469778, 0, 0, 1, 1, 1,
0.2955758, 0.2944555, -0.1068964, 1, 0, 0, 1, 1,
0.2985932, -0.7469323, 2.651209, 1, 0, 0, 1, 1,
0.3016162, -0.6451164, 0.9730359, 1, 0, 0, 1, 1,
0.3045664, 0.8935605, 0.1856601, 1, 0, 0, 1, 1,
0.3064889, 0.4041402, 0.6978076, 1, 0, 0, 1, 1,
0.3081294, 0.1808576, 0.8360267, 0, 0, 0, 1, 1,
0.3111094, -0.1239987, 3.4757, 0, 0, 0, 1, 1,
0.3134761, -0.580002, 2.188747, 0, 0, 0, 1, 1,
0.3150643, 0.5440455, -0.6612763, 0, 0, 0, 1, 1,
0.3208131, 2.419831, -0.5325397, 0, 0, 0, 1, 1,
0.3251664, -1.771303, 3.133986, 0, 0, 0, 1, 1,
0.3279944, -1.105969, 3.258448, 0, 0, 0, 1, 1,
0.3312384, -0.8111058, 1.943932, 1, 1, 1, 1, 1,
0.3355516, 0.5636607, 1.580717, 1, 1, 1, 1, 1,
0.3392338, 0.8319971, 1.868415, 1, 1, 1, 1, 1,
0.343494, 0.3633698, 1.555665, 1, 1, 1, 1, 1,
0.3457296, 2.1202, -0.7049367, 1, 1, 1, 1, 1,
0.3462956, 0.04016689, 1.097526, 1, 1, 1, 1, 1,
0.3464799, -0.3925806, 2.417309, 1, 1, 1, 1, 1,
0.3563338, 0.8734592, 1.036013, 1, 1, 1, 1, 1,
0.356825, -1.421719, 4.071876, 1, 1, 1, 1, 1,
0.3577147, -1.396264, 2.059597, 1, 1, 1, 1, 1,
0.3636936, -0.08950467, 3.099867, 1, 1, 1, 1, 1,
0.3650048, 0.4321133, 1.860386, 1, 1, 1, 1, 1,
0.3698769, -1.224258, 3.570072, 1, 1, 1, 1, 1,
0.3722346, 0.9408903, 0.7649106, 1, 1, 1, 1, 1,
0.3723162, -2.309315, 3.324024, 1, 1, 1, 1, 1,
0.3739078, -0.03837683, 1.866312, 0, 0, 1, 1, 1,
0.3790633, 0.1695958, 2.544542, 1, 0, 0, 1, 1,
0.3852561, -0.5758622, 1.551082, 1, 0, 0, 1, 1,
0.3866882, -2.001376, 1.123829, 1, 0, 0, 1, 1,
0.3893526, 0.1677041, 0.8734592, 1, 0, 0, 1, 1,
0.3900386, -0.5379244, 2.941447, 1, 0, 0, 1, 1,
0.3940203, -0.9055039, 3.21363, 0, 0, 0, 1, 1,
0.3944803, -0.6946873, 3.785668, 0, 0, 0, 1, 1,
0.4000548, 1.251693, 0.4126648, 0, 0, 0, 1, 1,
0.4075003, -0.8294872, 3.016649, 0, 0, 0, 1, 1,
0.4103578, -0.9553725, 3.202718, 0, 0, 0, 1, 1,
0.4174463, -0.06566703, 0.8607001, 0, 0, 0, 1, 1,
0.4178525, 2.914641, 0.02510521, 0, 0, 0, 1, 1,
0.4222997, -0.5170856, 3.764541, 1, 1, 1, 1, 1,
0.4288111, 0.396666, 1.583048, 1, 1, 1, 1, 1,
0.4355544, -1.872299, 2.581076, 1, 1, 1, 1, 1,
0.4455364, -0.9297088, 2.623216, 1, 1, 1, 1, 1,
0.4456013, 0.1927033, 1.446973, 1, 1, 1, 1, 1,
0.4483891, -0.2888239, 3.459256, 1, 1, 1, 1, 1,
0.4485375, -0.170863, 1.217219, 1, 1, 1, 1, 1,
0.4534792, -1.560108, 3.100326, 1, 1, 1, 1, 1,
0.4537098, 0.5314573, 1.569915, 1, 1, 1, 1, 1,
0.455897, -0.8208371, 3.284789, 1, 1, 1, 1, 1,
0.4590896, -0.2833724, 1.211268, 1, 1, 1, 1, 1,
0.4628883, 1.114505, 2.649606, 1, 1, 1, 1, 1,
0.4637708, -0.6774537, 2.848459, 1, 1, 1, 1, 1,
0.4687418, -0.1094812, 2.767705, 1, 1, 1, 1, 1,
0.4698467, 1.561993, 1.446515, 1, 1, 1, 1, 1,
0.4721087, 1.234569, 0.02157094, 0, 0, 1, 1, 1,
0.4723971, 0.21084, 0.7723675, 1, 0, 0, 1, 1,
0.4743163, 1.021225, 0.895733, 1, 0, 0, 1, 1,
0.477587, -0.4680994, 4.209085, 1, 0, 0, 1, 1,
0.4828712, 0.6680249, 0.8983533, 1, 0, 0, 1, 1,
0.4848559, -0.6415449, 2.904294, 1, 0, 0, 1, 1,
0.4896143, 0.2711415, 1.568458, 0, 0, 0, 1, 1,
0.4900149, 0.1104095, 2.227803, 0, 0, 0, 1, 1,
0.4902487, 0.9858962, 0.2737608, 0, 0, 0, 1, 1,
0.4906021, -1.251001, 3.578341, 0, 0, 0, 1, 1,
0.5018537, 1.979413, 0.7096652, 0, 0, 0, 1, 1,
0.5023271, -0.06695688, 1.510427, 0, 0, 0, 1, 1,
0.5047283, 0.4691086, 0.5892426, 0, 0, 0, 1, 1,
0.5047747, -0.2518874, 0.4433959, 1, 1, 1, 1, 1,
0.5113537, -0.9156217, 2.827757, 1, 1, 1, 1, 1,
0.5125278, -1.428136, 1.299625, 1, 1, 1, 1, 1,
0.5130008, 0.4239374, 2.370281, 1, 1, 1, 1, 1,
0.514327, 1.193547, -0.4561437, 1, 1, 1, 1, 1,
0.5205823, 0.1071458, 0.1876228, 1, 1, 1, 1, 1,
0.5216479, 1.230865, 0.8283235, 1, 1, 1, 1, 1,
0.5224683, 0.07892843, 0.2529939, 1, 1, 1, 1, 1,
0.526642, 1.524986, 2.524281, 1, 1, 1, 1, 1,
0.5281928, -0.1027206, -1.098588, 1, 1, 1, 1, 1,
0.5289206, -0.5678029, 0.8004599, 1, 1, 1, 1, 1,
0.5325664, 1.840026, -0.4387235, 1, 1, 1, 1, 1,
0.5353336, 1.159746, 0.5737584, 1, 1, 1, 1, 1,
0.5361469, 0.3500276, -0.007135246, 1, 1, 1, 1, 1,
0.5363026, -0.6418957, 2.681762, 1, 1, 1, 1, 1,
0.5363171, 0.6507436, -0.1159001, 0, 0, 1, 1, 1,
0.5367051, 0.2011196, 1.37482, 1, 0, 0, 1, 1,
0.5394881, 0.3760579, 1.97632, 1, 0, 0, 1, 1,
0.5400229, -1.172396, 3.197978, 1, 0, 0, 1, 1,
0.5453953, 1.175514, 0.4426845, 1, 0, 0, 1, 1,
0.5477508, 1.707309, 3.323768, 1, 0, 0, 1, 1,
0.5478601, -0.4931247, 2.265843, 0, 0, 0, 1, 1,
0.549758, 0.00703618, 2.868348, 0, 0, 0, 1, 1,
0.5507136, 0.2508393, 1.307874, 0, 0, 0, 1, 1,
0.5516397, 0.3773346, 1.819666, 0, 0, 0, 1, 1,
0.5519401, 0.7575986, 0.5803244, 0, 0, 0, 1, 1,
0.5550282, -0.952143, 1.65747, 0, 0, 0, 1, 1,
0.5598173, -0.84735, 1.967193, 0, 0, 0, 1, 1,
0.5608343, 1.683765, 0.3369877, 1, 1, 1, 1, 1,
0.5608903, 0.05729581, 1.055394, 1, 1, 1, 1, 1,
0.5700129, 0.561328, 1.318699, 1, 1, 1, 1, 1,
0.5706547, -1.139262, 1.929326, 1, 1, 1, 1, 1,
0.5748947, -0.8412097, 2.020936, 1, 1, 1, 1, 1,
0.5794594, 0.283015, 2.801376, 1, 1, 1, 1, 1,
0.582726, 0.9079129, 1.467297, 1, 1, 1, 1, 1,
0.5831006, -0.2073103, 0.3583063, 1, 1, 1, 1, 1,
0.5867606, -0.1808073, -0.628835, 1, 1, 1, 1, 1,
0.5907171, -0.4743579, 2.235294, 1, 1, 1, 1, 1,
0.5936698, 0.3978614, 0.04252545, 1, 1, 1, 1, 1,
0.5953065, 1.348677, 0.3616723, 1, 1, 1, 1, 1,
0.5985606, 0.4065444, 0.553936, 1, 1, 1, 1, 1,
0.5989658, 0.280947, 0.3900682, 1, 1, 1, 1, 1,
0.6003561, -0.3396524, 0.6013947, 1, 1, 1, 1, 1,
0.6029107, -0.2425578, 2.177929, 0, 0, 1, 1, 1,
0.6069703, -0.3228618, 1.17092, 1, 0, 0, 1, 1,
0.6072176, 0.3298373, 1.695781, 1, 0, 0, 1, 1,
0.6073202, -0.8587897, 2.936829, 1, 0, 0, 1, 1,
0.6112323, -0.4817965, 1.073131, 1, 0, 0, 1, 1,
0.6113226, 0.01724818, 2.63833, 1, 0, 0, 1, 1,
0.6164741, 0.4876444, 0.0935168, 0, 0, 0, 1, 1,
0.6173087, 0.9312353, -0.4517685, 0, 0, 0, 1, 1,
0.6174501, 0.1662049, 0.4862635, 0, 0, 0, 1, 1,
0.6190606, 0.5744013, 1.149968, 0, 0, 0, 1, 1,
0.6206824, -0.7092155, 1.372468, 0, 0, 0, 1, 1,
0.6236709, 0.228416, -0.1155521, 0, 0, 0, 1, 1,
0.6247483, 0.4843259, 0.828553, 0, 0, 0, 1, 1,
0.6279786, -1.234232, 2.329398, 1, 1, 1, 1, 1,
0.6313365, -1.007079, 3.003481, 1, 1, 1, 1, 1,
0.6337689, -0.9512484, 1.511035, 1, 1, 1, 1, 1,
0.6363658, 0.1120271, 2.663741, 1, 1, 1, 1, 1,
0.6481693, -1.2483, 0.6706002, 1, 1, 1, 1, 1,
0.6501024, 1.278648, 0.3082602, 1, 1, 1, 1, 1,
0.6581481, 0.6703951, 0.3299054, 1, 1, 1, 1, 1,
0.6607575, -0.467885, 0.8486189, 1, 1, 1, 1, 1,
0.6610087, -0.4423251, 3.290323, 1, 1, 1, 1, 1,
0.6626902, 0.5662869, 0.6706253, 1, 1, 1, 1, 1,
0.6639789, 1.96918, 0.9426134, 1, 1, 1, 1, 1,
0.6684267, -0.2190811, 3.086127, 1, 1, 1, 1, 1,
0.6690628, 0.2642486, 3.633413, 1, 1, 1, 1, 1,
0.6693719, 0.5817944, 1.468351, 1, 1, 1, 1, 1,
0.6699252, -0.6298863, 2.125999, 1, 1, 1, 1, 1,
0.670354, 0.2350931, 1.397262, 0, 0, 1, 1, 1,
0.6711626, -0.9509015, 2.971817, 1, 0, 0, 1, 1,
0.6723705, -0.8380005, 2.487973, 1, 0, 0, 1, 1,
0.674291, -0.1727422, 1.428547, 1, 0, 0, 1, 1,
0.6789472, -1.643237, 1.345569, 1, 0, 0, 1, 1,
0.6792368, -0.188344, 2.701365, 1, 0, 0, 1, 1,
0.6828753, -0.7051691, 2.370246, 0, 0, 0, 1, 1,
0.6870381, 0.1295875, 2.314166, 0, 0, 0, 1, 1,
0.6902097, -0.3035094, 2.894374, 0, 0, 0, 1, 1,
0.6903899, -0.1342079, 0.5050021, 0, 0, 0, 1, 1,
0.6925998, -1.008417, 3.66993, 0, 0, 0, 1, 1,
0.6927751, 1.359598, 3.662984, 0, 0, 0, 1, 1,
0.692989, -0.3451728, 2.22509, 0, 0, 0, 1, 1,
0.6952795, 0.7376121, 0.1719098, 1, 1, 1, 1, 1,
0.6953619, -0.1652227, 2.248178, 1, 1, 1, 1, 1,
0.6991346, -1.391809, 2.827225, 1, 1, 1, 1, 1,
0.6994954, -0.8629635, 3.658199, 1, 1, 1, 1, 1,
0.7043173, -2.13342, 5.049633, 1, 1, 1, 1, 1,
0.7079533, 2.078552, 1.345799, 1, 1, 1, 1, 1,
0.7088613, -0.4568807, 1.304635, 1, 1, 1, 1, 1,
0.7088788, -0.3298016, 3.25358, 1, 1, 1, 1, 1,
0.7096968, 0.3995456, 0.6369785, 1, 1, 1, 1, 1,
0.7167158, 1.378162, 2.181301, 1, 1, 1, 1, 1,
0.7179475, 0.2911004, 1.722471, 1, 1, 1, 1, 1,
0.7192378, -0.06388572, 1.409253, 1, 1, 1, 1, 1,
0.7198399, -0.08227395, 3.69389, 1, 1, 1, 1, 1,
0.7212129, -1.250542, 2.680418, 1, 1, 1, 1, 1,
0.7300622, 1.171641, 2.256508, 1, 1, 1, 1, 1,
0.7461649, 1.24724, 0.3288679, 0, 0, 1, 1, 1,
0.7488008, 1.274465, 0.7821828, 1, 0, 0, 1, 1,
0.7514657, -0.3689634, 1.469987, 1, 0, 0, 1, 1,
0.7563058, 0.8531269, 0.8424348, 1, 0, 0, 1, 1,
0.7596893, 0.9041175, 1.958311, 1, 0, 0, 1, 1,
0.7643791, 1.690615, -0.5772666, 1, 0, 0, 1, 1,
0.7814001, 0.07755166, 2.309357, 0, 0, 0, 1, 1,
0.7845295, 0.6599312, 1.648022, 0, 0, 0, 1, 1,
0.7848608, -0.8247237, 1.833454, 0, 0, 0, 1, 1,
0.786799, 0.1899124, 0.3779982, 0, 0, 0, 1, 1,
0.7880076, -0.5012701, 1.22644, 0, 0, 0, 1, 1,
0.7902092, -3.51553, 3.403836, 0, 0, 0, 1, 1,
0.7968894, -0.4742381, 1.092185, 0, 0, 0, 1, 1,
0.7970514, 1.201079, -0.9247525, 1, 1, 1, 1, 1,
0.8056757, -0.2308128, 0.5576612, 1, 1, 1, 1, 1,
0.8096493, -0.9261875, 3.534471, 1, 1, 1, 1, 1,
0.8115261, 1.451247, 1.32128, 1, 1, 1, 1, 1,
0.8132542, -0.7453704, 2.680119, 1, 1, 1, 1, 1,
0.818693, 0.3954929, 0.02819907, 1, 1, 1, 1, 1,
0.8366478, 0.9050668, 0.2626754, 1, 1, 1, 1, 1,
0.8450652, 0.9536507, -0.1237699, 1, 1, 1, 1, 1,
0.8531438, 0.3042695, 1.327047, 1, 1, 1, 1, 1,
0.8554866, 0.6410371, 0.7604818, 1, 1, 1, 1, 1,
0.856231, 2.15477, 1.000889, 1, 1, 1, 1, 1,
0.8575754, -0.5226938, 4.290614, 1, 1, 1, 1, 1,
0.8716606, 0.3126659, 1.2909, 1, 1, 1, 1, 1,
0.8797216, -1.365931, 1.937965, 1, 1, 1, 1, 1,
0.8804334, 0.0675472, 0.8488773, 1, 1, 1, 1, 1,
0.8830705, 2.333945, -0.4854004, 0, 0, 1, 1, 1,
0.8862469, -0.25578, 0.4096615, 1, 0, 0, 1, 1,
0.8900638, 0.5962079, 0.4703416, 1, 0, 0, 1, 1,
0.8926033, -0.2178299, 3.876593, 1, 0, 0, 1, 1,
0.8936074, 0.9265332, 1.174205, 1, 0, 0, 1, 1,
0.9046127, 0.5410525, 0.9593372, 1, 0, 0, 1, 1,
0.9056301, -1.063202, 3.885594, 0, 0, 0, 1, 1,
0.9148611, 0.3290211, -0.1179712, 0, 0, 0, 1, 1,
0.9164426, -0.8357646, 2.960026, 0, 0, 0, 1, 1,
0.917295, -0.009060154, 1.778282, 0, 0, 0, 1, 1,
0.9213044, 0.2043591, 0.6703796, 0, 0, 0, 1, 1,
0.9263551, 1.501138, 1.236457, 0, 0, 0, 1, 1,
0.9342135, -2.220529, 3.539064, 0, 0, 0, 1, 1,
0.9343742, -1.971843, 3.812631, 1, 1, 1, 1, 1,
0.9345836, 0.7525662, 0.7395529, 1, 1, 1, 1, 1,
0.9354576, -0.08258147, 2.313778, 1, 1, 1, 1, 1,
0.9416864, -1.684869, 2.986768, 1, 1, 1, 1, 1,
0.9440735, -0.7798432, 2.424558, 1, 1, 1, 1, 1,
0.9497529, 2.974997, 1.020789, 1, 1, 1, 1, 1,
0.9675927, 0.4222763, 2.964648, 1, 1, 1, 1, 1,
0.9681737, 0.3950751, 1.228509, 1, 1, 1, 1, 1,
0.9689816, 1.66065, 2.257695, 1, 1, 1, 1, 1,
0.9736998, -0.1133957, 1.822113, 1, 1, 1, 1, 1,
0.9760956, 1.53579, 0.1946919, 1, 1, 1, 1, 1,
0.9924249, 0.271396, 0.1290389, 1, 1, 1, 1, 1,
0.9927748, -0.6302285, 2.502384, 1, 1, 1, 1, 1,
0.9960789, -1.859676, 4.577704, 1, 1, 1, 1, 1,
1.004787, -1.210272, 0.6312148, 1, 1, 1, 1, 1,
1.012023, 0.799418, 0.2422337, 0, 0, 1, 1, 1,
1.020824, 0.2661861, 1.344622, 1, 0, 0, 1, 1,
1.02107, -0.5328685, 3.408934, 1, 0, 0, 1, 1,
1.02803, -1.589276, 2.992816, 1, 0, 0, 1, 1,
1.032214, -0.4541112, 1.306399, 1, 0, 0, 1, 1,
1.038842, -0.2098307, 2.430863, 1, 0, 0, 1, 1,
1.041001, -1.930457, 2.766657, 0, 0, 0, 1, 1,
1.05029, 0.2105199, 1.178174, 0, 0, 0, 1, 1,
1.052233, 0.6046716, 0.04271514, 0, 0, 0, 1, 1,
1.055516, -0.1044744, 0.3717953, 0, 0, 0, 1, 1,
1.057511, -0.2362658, 2.140402, 0, 0, 0, 1, 1,
1.060001, -0.03751927, 2.228044, 0, 0, 0, 1, 1,
1.060179, 0.2422411, 0.9593152, 0, 0, 0, 1, 1,
1.06597, 0.128367, 2.657265, 1, 1, 1, 1, 1,
1.084459, -1.498904, 2.188796, 1, 1, 1, 1, 1,
1.088434, 0.4427496, 1.936717, 1, 1, 1, 1, 1,
1.088548, 0.02302206, 2.821211, 1, 1, 1, 1, 1,
1.094788, -0.1782791, 3.203084, 1, 1, 1, 1, 1,
1.100184, -0.5796212, 2.775142, 1, 1, 1, 1, 1,
1.103452, 0.9644179, 0.1836785, 1, 1, 1, 1, 1,
1.111567, 1.206454, -0.5450211, 1, 1, 1, 1, 1,
1.123364, -0.3782537, 2.142489, 1, 1, 1, 1, 1,
1.12658, 0.9275231, 1.18692, 1, 1, 1, 1, 1,
1.13212, 2.038042, -1.158587, 1, 1, 1, 1, 1,
1.133887, 0.3956946, 2.175276, 1, 1, 1, 1, 1,
1.136741, 0.3480316, 1.580313, 1, 1, 1, 1, 1,
1.14011, 0.4584205, 1.167374, 1, 1, 1, 1, 1,
1.141838, -0.3413097, 3.445879, 1, 1, 1, 1, 1,
1.146946, 0.1167106, 0.8924257, 0, 0, 1, 1, 1,
1.148004, 0.7133521, 0.5423786, 1, 0, 0, 1, 1,
1.161096, -0.6816775, 2.025637, 1, 0, 0, 1, 1,
1.166283, 0.1599745, 2.026109, 1, 0, 0, 1, 1,
1.170199, -0.8527946, 1.961191, 1, 0, 0, 1, 1,
1.173272, 0.1902495, -0.291786, 1, 0, 0, 1, 1,
1.174616, -0.1482986, 2.009453, 0, 0, 0, 1, 1,
1.177054, 1.879654, 2.369303, 0, 0, 0, 1, 1,
1.177464, 0.3365103, 1.102849, 0, 0, 0, 1, 1,
1.178727, -0.9925982, 2.807083, 0, 0, 0, 1, 1,
1.185831, -0.3406234, 2.098913, 0, 0, 0, 1, 1,
1.18708, 0.2328019, 0.8466597, 0, 0, 0, 1, 1,
1.190205, -1.265385, 2.671869, 0, 0, 0, 1, 1,
1.192736, -1.620621, 2.807376, 1, 1, 1, 1, 1,
1.196177, -1.228186, 2.120498, 1, 1, 1, 1, 1,
1.20225, 1.018323, 0.357595, 1, 1, 1, 1, 1,
1.202371, 1.340128, 0.1908187, 1, 1, 1, 1, 1,
1.204359, -0.4600308, 1.674005, 1, 1, 1, 1, 1,
1.20624, 1.210299, 2.251697, 1, 1, 1, 1, 1,
1.210211, -0.09451193, 3.125911, 1, 1, 1, 1, 1,
1.212224, 0.4045742, -0.2526858, 1, 1, 1, 1, 1,
1.214347, -0.5137444, 0.2618894, 1, 1, 1, 1, 1,
1.228378, -1.31234, 1.992172, 1, 1, 1, 1, 1,
1.234546, -0.7234887, 1.914308, 1, 1, 1, 1, 1,
1.236908, -0.5210154, 3.188657, 1, 1, 1, 1, 1,
1.236933, 1.458835, 2.052051, 1, 1, 1, 1, 1,
1.245746, -0.3779643, 1.108448, 1, 1, 1, 1, 1,
1.253934, 0.9166891, 0.8773426, 1, 1, 1, 1, 1,
1.262981, 0.5079389, -1.070919, 0, 0, 1, 1, 1,
1.267204, -0.5434328, 2.586991, 1, 0, 0, 1, 1,
1.268773, -0.2782463, 1.909442, 1, 0, 0, 1, 1,
1.280669, -1.732796, 2.38465, 1, 0, 0, 1, 1,
1.283897, -0.9937845, 1.853229, 1, 0, 0, 1, 1,
1.288729, -2.431341, 3.211801, 1, 0, 0, 1, 1,
1.30328, 0.8521767, 2.504937, 0, 0, 0, 1, 1,
1.306934, -0.9786134, 1.395969, 0, 0, 0, 1, 1,
1.307267, -1.204468, 2.040158, 0, 0, 0, 1, 1,
1.32073, -1.585049, 3.160385, 0, 0, 0, 1, 1,
1.32264, -0.5464661, 0.5481451, 0, 0, 0, 1, 1,
1.326792, 0.002921043, 0.8506817, 0, 0, 0, 1, 1,
1.329144, -0.8200643, 3.798021, 0, 0, 0, 1, 1,
1.33642, -0.507605, 3.013529, 1, 1, 1, 1, 1,
1.336452, 0.06948163, 1.394902, 1, 1, 1, 1, 1,
1.34583, 0.09368782, 1.298181, 1, 1, 1, 1, 1,
1.34924, -0.8849285, 1.910816, 1, 1, 1, 1, 1,
1.368655, 0.2791062, 0.3937448, 1, 1, 1, 1, 1,
1.369272, 1.985038, 0.8747793, 1, 1, 1, 1, 1,
1.374398, -0.05184783, 2.588059, 1, 1, 1, 1, 1,
1.387713, 0.4834764, 1.5687, 1, 1, 1, 1, 1,
1.403399, -0.1278491, 1.654806, 1, 1, 1, 1, 1,
1.405484, 0.1083274, 1.987517, 1, 1, 1, 1, 1,
1.407706, -0.3413256, 0.8389567, 1, 1, 1, 1, 1,
1.411776, 0.7556742, -0.2005579, 1, 1, 1, 1, 1,
1.420925, 1.099184, 1.001675, 1, 1, 1, 1, 1,
1.428024, -0.7082307, 2.279969, 1, 1, 1, 1, 1,
1.428466, -0.606881, 0.7771474, 1, 1, 1, 1, 1,
1.428829, -0.2868542, 2.556511, 0, 0, 1, 1, 1,
1.436104, 1.232724, -0.6683289, 1, 0, 0, 1, 1,
1.437002, 0.1648747, 2.425663, 1, 0, 0, 1, 1,
1.452236, 1.351105, -0.2424607, 1, 0, 0, 1, 1,
1.454964, 2.022143, 2.042042, 1, 0, 0, 1, 1,
1.472163, -1.377795, 2.043469, 1, 0, 0, 1, 1,
1.484146, 0.1400601, 1.29562, 0, 0, 0, 1, 1,
1.484879, -1.489806, 3.170813, 0, 0, 0, 1, 1,
1.493213, 0.794992, 0.4799397, 0, 0, 0, 1, 1,
1.510292, 0.546824, 0.7209751, 0, 0, 0, 1, 1,
1.518177, -0.2287381, 2.985472, 0, 0, 0, 1, 1,
1.522853, 0.6283644, -0.0533802, 0, 0, 0, 1, 1,
1.52515, 0.101443, 0.647227, 0, 0, 0, 1, 1,
1.52965, -0.215199, 1.432176, 1, 1, 1, 1, 1,
1.532488, -0.5099578, 0.4183769, 1, 1, 1, 1, 1,
1.552703, 0.4514002, 1.033918, 1, 1, 1, 1, 1,
1.554189, -0.4603834, 1.982763, 1, 1, 1, 1, 1,
1.557301, 0.8482083, 2.435368, 1, 1, 1, 1, 1,
1.558631, -0.7924371, 1.867878, 1, 1, 1, 1, 1,
1.567042, 1.405978, -0.3304598, 1, 1, 1, 1, 1,
1.567189, -0.3750716, 1.790902, 1, 1, 1, 1, 1,
1.569163, 1.059932, 1.594374, 1, 1, 1, 1, 1,
1.569575, 1.082182, 0.5136913, 1, 1, 1, 1, 1,
1.603546, 0.2425062, 0.668628, 1, 1, 1, 1, 1,
1.605405, -0.4006208, 1.373528, 1, 1, 1, 1, 1,
1.609111, 1.823642, 1.166952, 1, 1, 1, 1, 1,
1.621493, -0.9487146, 3.395233, 1, 1, 1, 1, 1,
1.629168, 1.492931, -0.4399245, 1, 1, 1, 1, 1,
1.640506, -0.02520599, 4.190721, 0, 0, 1, 1, 1,
1.658651, -0.7577864, 3.087498, 1, 0, 0, 1, 1,
1.663889, -1.88671, 2.077071, 1, 0, 0, 1, 1,
1.667409, -0.3521183, 1.007787, 1, 0, 0, 1, 1,
1.693741, -0.8290915, 1.09913, 1, 0, 0, 1, 1,
1.697095, 0.507744, 2.351421, 1, 0, 0, 1, 1,
1.718311, 0.9082807, 0.1552959, 0, 0, 0, 1, 1,
1.75095, -1.893105, 1.768897, 0, 0, 0, 1, 1,
1.751082, 0.8905447, 1.360576, 0, 0, 0, 1, 1,
1.757435, -1.569588, 1.813896, 0, 0, 0, 1, 1,
1.764135, 0.3785671, 0.9123668, 0, 0, 0, 1, 1,
1.767232, -0.4633312, 1.978578, 0, 0, 0, 1, 1,
1.768626, -1.331355, 1.981646, 0, 0, 0, 1, 1,
1.771014, -0.05360918, 1.310712, 1, 1, 1, 1, 1,
1.806052, 0.9251966, 0.4923285, 1, 1, 1, 1, 1,
1.806972, -0.04344638, 2.571815, 1, 1, 1, 1, 1,
1.814497, 1.178943, 0.407407, 1, 1, 1, 1, 1,
1.822238, -0.05758374, 1.981314, 1, 1, 1, 1, 1,
1.824134, 0.2386749, 2.385075, 1, 1, 1, 1, 1,
1.832486, 0.5419534, 0.9757717, 1, 1, 1, 1, 1,
1.842067, 0.447054, 0.4513936, 1, 1, 1, 1, 1,
1.847969, 0.2121548, 1.066549, 1, 1, 1, 1, 1,
1.84814, 0.5941758, 2.739621, 1, 1, 1, 1, 1,
1.858906, -1.445108, 2.57074, 1, 1, 1, 1, 1,
1.872694, 1.155953, 0.1348263, 1, 1, 1, 1, 1,
1.883505, -0.4350254, 2.864865, 1, 1, 1, 1, 1,
1.893504, -0.9370292, 0.6488152, 1, 1, 1, 1, 1,
1.897289, -0.9267616, 2.425387, 1, 1, 1, 1, 1,
1.897613, 1.29581, 0.85712, 0, 0, 1, 1, 1,
1.912705, 0.3868102, 1.162181, 1, 0, 0, 1, 1,
1.952396, -0.4635679, 1.371347, 1, 0, 0, 1, 1,
1.963548, -2.397861, 1.994895, 1, 0, 0, 1, 1,
1.985613, 2.424813, 1.743101, 1, 0, 0, 1, 1,
2.000245, -1.153055, 3.820714, 1, 0, 0, 1, 1,
2.001362, 0.5003542, 1.339445, 0, 0, 0, 1, 1,
2.021733, -1.254524, 0.216433, 0, 0, 0, 1, 1,
2.027357, -1.097861, 2.092586, 0, 0, 0, 1, 1,
2.049194, 1.332763, 2.569322, 0, 0, 0, 1, 1,
2.05212, -0.3747966, 2.8525, 0, 0, 0, 1, 1,
2.07006, -0.6446266, 1.466702, 0, 0, 0, 1, 1,
2.088351, 1.849422, -1.542667, 0, 0, 0, 1, 1,
2.116357, 0.8201168, 1.946803, 1, 1, 1, 1, 1,
2.123739, 1.659107, -0.9135539, 1, 1, 1, 1, 1,
2.155871, 1.178879, 0.7476941, 1, 1, 1, 1, 1,
2.374089, 1.872342, -0.2698859, 1, 1, 1, 1, 1,
2.392376, 0.4349372, 1.204066, 1, 1, 1, 1, 1,
2.506038, -1.087824, 1.693861, 1, 1, 1, 1, 1,
3.597264, -0.1802506, 3.692704, 1, 1, 1, 1, 1
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
var radius = 10.12649;
var distance = 35.56886;
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
mvMatrix.translate( -0.176811, 0.2702664, 0.7570167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.56886);
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
