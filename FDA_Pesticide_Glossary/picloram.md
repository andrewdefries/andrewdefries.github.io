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
-2.811562, -1.816414, -2.62559, 1, 0, 0, 1,
-2.727039, 0.2667094, -2.730563, 1, 0.007843138, 0, 1,
-2.507886, -0.8782136, -4.416995, 1, 0.01176471, 0, 1,
-2.480629, 0.1788306, -1.170416, 1, 0.01960784, 0, 1,
-2.453415, -1.495496, -3.772957, 1, 0.02352941, 0, 1,
-2.421504, -2.087746, -1.444013, 1, 0.03137255, 0, 1,
-2.298014, -1.218958, -1.040569, 1, 0.03529412, 0, 1,
-2.185547, 1.518142, -2.313607, 1, 0.04313726, 0, 1,
-2.146567, -1.709848, -0.5104419, 1, 0.04705882, 0, 1,
-2.131658, -0.6669223, -1.733646, 1, 0.05490196, 0, 1,
-2.130311, -0.06393266, -0.8472004, 1, 0.05882353, 0, 1,
-2.077471, -0.2444721, -1.898439, 1, 0.06666667, 0, 1,
-2.061734, -0.8103991, -0.2864928, 1, 0.07058824, 0, 1,
-2.054129, 1.198324, -2.198132, 1, 0.07843138, 0, 1,
-2.05348, -0.4843317, -1.737729, 1, 0.08235294, 0, 1,
-2.01931, -1.47667, -2.333186, 1, 0.09019608, 0, 1,
-1.999221, -0.888271, 1.098894, 1, 0.09411765, 0, 1,
-1.99085, 1.197459, -1.662169, 1, 0.1019608, 0, 1,
-1.978647, 0.2182026, -1.965533, 1, 0.1098039, 0, 1,
-1.954846, 1.44709, -0.3152995, 1, 0.1137255, 0, 1,
-1.932499, -1.06541, -0.4841045, 1, 0.1215686, 0, 1,
-1.90348, -0.2035916, -0.6874668, 1, 0.1254902, 0, 1,
-1.902291, 0.698359, -1.136152, 1, 0.1333333, 0, 1,
-1.858045, -0.2829312, -2.038266, 1, 0.1372549, 0, 1,
-1.854528, 1.84178, -0.46462, 1, 0.145098, 0, 1,
-1.851826, 0.584008, -1.120483, 1, 0.1490196, 0, 1,
-1.825606, 3.009402, 0.6571506, 1, 0.1568628, 0, 1,
-1.823397, -0.1306006, -1.827032, 1, 0.1607843, 0, 1,
-1.816113, 0.5550735, -1.490286, 1, 0.1686275, 0, 1,
-1.798787, -0.007369179, -1.999452, 1, 0.172549, 0, 1,
-1.788987, 1.114802, -0.8503529, 1, 0.1803922, 0, 1,
-1.787531, 0.6422659, -0.1272327, 1, 0.1843137, 0, 1,
-1.776091, -0.8511232, -3.232743, 1, 0.1921569, 0, 1,
-1.772115, -0.3949759, -0.4130216, 1, 0.1960784, 0, 1,
-1.765775, -0.8374045, -1.857755, 1, 0.2039216, 0, 1,
-1.759694, 0.1636129, -0.2594618, 1, 0.2117647, 0, 1,
-1.728101, -0.8048813, -1.877701, 1, 0.2156863, 0, 1,
-1.705456, -0.9023653, -2.535572, 1, 0.2235294, 0, 1,
-1.703506, -0.1574822, -1.487064, 1, 0.227451, 0, 1,
-1.674911, 0.9275921, 0.8856454, 1, 0.2352941, 0, 1,
-1.669526, 0.1013271, -1.946445, 1, 0.2392157, 0, 1,
-1.668528, -0.79403, -1.142544, 1, 0.2470588, 0, 1,
-1.658013, -0.9691691, -2.177161, 1, 0.2509804, 0, 1,
-1.644111, 0.2242233, -2.151486, 1, 0.2588235, 0, 1,
-1.640666, 1.263892, -2.278929, 1, 0.2627451, 0, 1,
-1.604697, 0.4487208, -2.724383, 1, 0.2705882, 0, 1,
-1.598975, -0.9143392, -3.686579, 1, 0.2745098, 0, 1,
-1.590123, -0.2374438, -2.228406, 1, 0.282353, 0, 1,
-1.58256, -0.8331663, -2.81054, 1, 0.2862745, 0, 1,
-1.544036, 2.917222, -0.30803, 1, 0.2941177, 0, 1,
-1.525631, 0.5763417, -4.141012, 1, 0.3019608, 0, 1,
-1.515397, -0.1313451, -1.886657, 1, 0.3058824, 0, 1,
-1.512086, -0.317874, -3.006623, 1, 0.3137255, 0, 1,
-1.50579, 0.4265572, 0.1908641, 1, 0.3176471, 0, 1,
-1.49771, -1.817964, -2.446635, 1, 0.3254902, 0, 1,
-1.496653, -0.1679157, -2.0675, 1, 0.3294118, 0, 1,
-1.455888, -0.9319871, -0.4599085, 1, 0.3372549, 0, 1,
-1.443698, -2.695861, -3.621315, 1, 0.3411765, 0, 1,
-1.443012, 1.45181, -1.225452, 1, 0.3490196, 0, 1,
-1.439889, -1.458794, -3.297704, 1, 0.3529412, 0, 1,
-1.436643, -1.654297, -2.710536, 1, 0.3607843, 0, 1,
-1.430701, 0.4911739, -1.720735, 1, 0.3647059, 0, 1,
-1.406258, -2.092808, -2.188585, 1, 0.372549, 0, 1,
-1.398275, -1.456008, -1.4524, 1, 0.3764706, 0, 1,
-1.397936, -3.551722, -4.981049, 1, 0.3843137, 0, 1,
-1.379682, -1.696339, -3.164033, 1, 0.3882353, 0, 1,
-1.371933, 0.2522897, -1.911286, 1, 0.3960784, 0, 1,
-1.368091, -1.57111, -1.730062, 1, 0.4039216, 0, 1,
-1.359827, 1.430486, -1.746592, 1, 0.4078431, 0, 1,
-1.354427, 0.8201238, -1.312254, 1, 0.4156863, 0, 1,
-1.343813, -0.6082591, -0.94625, 1, 0.4196078, 0, 1,
-1.342495, 0.4289772, -0.8462294, 1, 0.427451, 0, 1,
-1.342178, 0.2753798, -1.92891, 1, 0.4313726, 0, 1,
-1.330336, 1.240689, 0.9975204, 1, 0.4392157, 0, 1,
-1.329605, 0.2534644, -2.293196, 1, 0.4431373, 0, 1,
-1.310933, -1.996928, -0.73765, 1, 0.4509804, 0, 1,
-1.310767, 0.8965293, -2.22769, 1, 0.454902, 0, 1,
-1.309358, -0.7747685, -0.7935431, 1, 0.4627451, 0, 1,
-1.302651, 1.779886, 0.05755265, 1, 0.4666667, 0, 1,
-1.289536, 0.4660415, -0.3014558, 1, 0.4745098, 0, 1,
-1.289515, 1.791785, -0.8179893, 1, 0.4784314, 0, 1,
-1.278983, -1.171313, -2.06369, 1, 0.4862745, 0, 1,
-1.272003, -0.5723474, -2.694686, 1, 0.4901961, 0, 1,
-1.270739, -0.6270928, -1.836776, 1, 0.4980392, 0, 1,
-1.270583, -1.085264, -2.964699, 1, 0.5058824, 0, 1,
-1.261572, -0.1949024, -3.029659, 1, 0.509804, 0, 1,
-1.257906, 1.054073, -0.5225433, 1, 0.5176471, 0, 1,
-1.256881, -2.273231, -3.317945, 1, 0.5215687, 0, 1,
-1.253713, -0.549141, -0.9986007, 1, 0.5294118, 0, 1,
-1.249256, -0.1146797, -0.2705938, 1, 0.5333334, 0, 1,
-1.241178, 1.365248, -0.9112747, 1, 0.5411765, 0, 1,
-1.239758, 1.163962, -0.08295555, 1, 0.5450981, 0, 1,
-1.23515, 0.3913712, -1.12567, 1, 0.5529412, 0, 1,
-1.233982, 0.5108237, -0.8102596, 1, 0.5568628, 0, 1,
-1.229606, -0.7083036, -1.641494, 1, 0.5647059, 0, 1,
-1.228436, 0.1581189, -0.4506843, 1, 0.5686275, 0, 1,
-1.222783, 1.311285, -0.991601, 1, 0.5764706, 0, 1,
-1.219771, -1.873885, -2.234514, 1, 0.5803922, 0, 1,
-1.215006, 0.5823772, 0.6495782, 1, 0.5882353, 0, 1,
-1.215, 1.37359, -0.9923199, 1, 0.5921569, 0, 1,
-1.208528, -0.3129256, -2.22546, 1, 0.6, 0, 1,
-1.186192, 0.4335432, -2.473528, 1, 0.6078432, 0, 1,
-1.180266, -0.5757654, -0.8343934, 1, 0.6117647, 0, 1,
-1.175166, 0.5145457, -2.768043, 1, 0.6196079, 0, 1,
-1.169533, 0.9360813, -2.545899, 1, 0.6235294, 0, 1,
-1.169127, -0.08281478, -2.158776, 1, 0.6313726, 0, 1,
-1.166473, -1.219694, -2.040187, 1, 0.6352941, 0, 1,
-1.165522, -0.2280329, -2.364878, 1, 0.6431373, 0, 1,
-1.157264, 0.3778064, 0.8389136, 1, 0.6470588, 0, 1,
-1.145202, -1.401095, -2.442555, 1, 0.654902, 0, 1,
-1.13409, 0.8443955, -0.5243046, 1, 0.6588235, 0, 1,
-1.125872, 0.3783329, -0.5540619, 1, 0.6666667, 0, 1,
-1.125512, -0.4585052, -2.541261, 1, 0.6705883, 0, 1,
-1.1233, -1.689279, -1.40012, 1, 0.6784314, 0, 1,
-1.123205, 0.5236723, -0.5793977, 1, 0.682353, 0, 1,
-1.118284, -0.5651513, -3.031515, 1, 0.6901961, 0, 1,
-1.115762, 1.410631, -0.003043825, 1, 0.6941177, 0, 1,
-1.11148, 0.7794885, -1.131278, 1, 0.7019608, 0, 1,
-1.108151, -0.1807149, 0.2367111, 1, 0.7098039, 0, 1,
-1.09757, 0.3389053, -1.121465, 1, 0.7137255, 0, 1,
-1.079967, -1.712356, -2.665703, 1, 0.7215686, 0, 1,
-1.076949, 0.514923, -1.366776, 1, 0.7254902, 0, 1,
-1.074823, 0.8164248, -1.825415, 1, 0.7333333, 0, 1,
-1.068248, 0.3878886, -1.645749, 1, 0.7372549, 0, 1,
-1.067272, 0.5841206, -0.6940565, 1, 0.7450981, 0, 1,
-1.058262, 0.6689571, -0.3078814, 1, 0.7490196, 0, 1,
-1.057072, 1.054965, -0.2722244, 1, 0.7568628, 0, 1,
-1.055585, 0.8656883, -1.251284, 1, 0.7607843, 0, 1,
-1.054773, 0.1521683, -0.5682764, 1, 0.7686275, 0, 1,
-1.052598, 0.1986169, -0.6561449, 1, 0.772549, 0, 1,
-1.052038, 2.76843, -1.240385, 1, 0.7803922, 0, 1,
-1.049242, -1.673474, -3.502268, 1, 0.7843137, 0, 1,
-1.048658, -0.2634647, -2.067419, 1, 0.7921569, 0, 1,
-1.048256, -0.134048, -1.529454, 1, 0.7960784, 0, 1,
-1.047513, -1.839209, -3.165974, 1, 0.8039216, 0, 1,
-1.043089, 0.2798246, -1.632354, 1, 0.8117647, 0, 1,
-1.04195, 0.187428, -0.7782303, 1, 0.8156863, 0, 1,
-1.041185, 0.3381535, -1.627144, 1, 0.8235294, 0, 1,
-1.03443, -1.399896, -2.53415, 1, 0.827451, 0, 1,
-1.027884, -1.104306, -0.7964665, 1, 0.8352941, 0, 1,
-1.022337, 1.110363, -0.2630941, 1, 0.8392157, 0, 1,
-1.013238, -0.7392939, -2.449513, 1, 0.8470588, 0, 1,
-1.012222, -1.132025, -1.519266, 1, 0.8509804, 0, 1,
-1.011135, 0.1963275, -1.54013, 1, 0.8588235, 0, 1,
-1.002181, -1.185829, -3.167283, 1, 0.8627451, 0, 1,
-0.9986909, 0.09808122, 0.1835579, 1, 0.8705882, 0, 1,
-0.9942084, -0.04805536, -2.28389, 1, 0.8745098, 0, 1,
-0.9933808, 0.004738693, -0.689142, 1, 0.8823529, 0, 1,
-0.9900527, -0.9624086, -1.097832, 1, 0.8862745, 0, 1,
-0.9887909, -0.6102853, -1.375233, 1, 0.8941177, 0, 1,
-0.9868492, 0.4493093, 0.6867907, 1, 0.8980392, 0, 1,
-0.9858896, -1.431201, -3.774345, 1, 0.9058824, 0, 1,
-0.9827294, -0.9839373, -1.664528, 1, 0.9137255, 0, 1,
-0.9804786, -0.6907648, -1.975683, 1, 0.9176471, 0, 1,
-0.9695235, 0.01960574, -1.819333, 1, 0.9254902, 0, 1,
-0.9679728, 0.4371648, -0.8198434, 1, 0.9294118, 0, 1,
-0.9541225, 0.9433708, -0.702225, 1, 0.9372549, 0, 1,
-0.9538206, 0.1699938, -1.481758, 1, 0.9411765, 0, 1,
-0.9530746, -0.7982644, -1.686059, 1, 0.9490196, 0, 1,
-0.947504, -1.243635, -4.068489, 1, 0.9529412, 0, 1,
-0.9431454, -0.03002725, -1.51518, 1, 0.9607843, 0, 1,
-0.941186, 0.1688069, -2.672932, 1, 0.9647059, 0, 1,
-0.9321435, 1.224187, 0.3820023, 1, 0.972549, 0, 1,
-0.9296893, 2.394317, -2.378211, 1, 0.9764706, 0, 1,
-0.9263034, 0.752897, -1.716746, 1, 0.9843137, 0, 1,
-0.9131939, 0.20845, -4.312167, 1, 0.9882353, 0, 1,
-0.902101, 0.8765602, 0.1181984, 1, 0.9960784, 0, 1,
-0.8991359, -0.01224422, -1.514254, 0.9960784, 1, 0, 1,
-0.8959727, -0.5724704, -3.89846, 0.9921569, 1, 0, 1,
-0.8869356, -0.2626552, -1.292651, 0.9843137, 1, 0, 1,
-0.8848868, -0.8625976, -1.557192, 0.9803922, 1, 0, 1,
-0.8756958, 0.1198821, 0.4816159, 0.972549, 1, 0, 1,
-0.8745282, -1.001357, -2.173464, 0.9686275, 1, 0, 1,
-0.868686, 0.2576791, -1.45714, 0.9607843, 1, 0, 1,
-0.8675014, -1.228999, -0.8154351, 0.9568627, 1, 0, 1,
-0.8639665, 0.3574049, -1.141728, 0.9490196, 1, 0, 1,
-0.8624207, -1.034879, -2.465477, 0.945098, 1, 0, 1,
-0.8622804, 0.3434277, -0.7062805, 0.9372549, 1, 0, 1,
-0.8607188, 1.112343, -0.7877848, 0.9333333, 1, 0, 1,
-0.858729, 0.1461566, -1.555556, 0.9254902, 1, 0, 1,
-0.8578302, -1.908809, -3.922482, 0.9215686, 1, 0, 1,
-0.8537027, -0.4079881, -0.8992072, 0.9137255, 1, 0, 1,
-0.8450481, -0.3901956, -2.113242, 0.9098039, 1, 0, 1,
-0.8441283, 0.3308886, -1.266694, 0.9019608, 1, 0, 1,
-0.8431458, -1.44389, -2.65362, 0.8941177, 1, 0, 1,
-0.8326528, 0.1577512, 0.3481579, 0.8901961, 1, 0, 1,
-0.8298985, 0.05376337, -0.5891888, 0.8823529, 1, 0, 1,
-0.8250025, 1.459467, -1.978859, 0.8784314, 1, 0, 1,
-0.8224347, 0.2326926, -0.9332708, 0.8705882, 1, 0, 1,
-0.8211699, -1.734324, -1.986285, 0.8666667, 1, 0, 1,
-0.8180499, -1.148112, -1.55744, 0.8588235, 1, 0, 1,
-0.8084223, -0.9919676, -2.675732, 0.854902, 1, 0, 1,
-0.8081056, 0.104339, -2.293715, 0.8470588, 1, 0, 1,
-0.8062347, 2.434587, -0.192819, 0.8431373, 1, 0, 1,
-0.8029867, 0.2450568, -0.8946205, 0.8352941, 1, 0, 1,
-0.8013065, -1.102069, -3.137356, 0.8313726, 1, 0, 1,
-0.8011613, -0.5006039, -1.693986, 0.8235294, 1, 0, 1,
-0.8003385, -1.203514, -3.463952, 0.8196079, 1, 0, 1,
-0.7990639, 0.4345879, -1.768429, 0.8117647, 1, 0, 1,
-0.7961798, -1.553815, -2.680718, 0.8078431, 1, 0, 1,
-0.7939704, 0.07331458, -0.9089495, 0.8, 1, 0, 1,
-0.7939541, -1.124182, -3.228827, 0.7921569, 1, 0, 1,
-0.7895311, -0.3580001, -3.851004, 0.7882353, 1, 0, 1,
-0.7880899, -0.6675632, -2.695331, 0.7803922, 1, 0, 1,
-0.787652, -0.05513456, -1.53963, 0.7764706, 1, 0, 1,
-0.7851071, -0.7263429, -3.019568, 0.7686275, 1, 0, 1,
-0.7839024, 0.6074795, -1.82748, 0.7647059, 1, 0, 1,
-0.779328, -0.6936396, -2.41508, 0.7568628, 1, 0, 1,
-0.7756175, -1.080831, -1.596362, 0.7529412, 1, 0, 1,
-0.7735474, -1.009088, -1.108129, 0.7450981, 1, 0, 1,
-0.7700623, 0.860276, -0.5539441, 0.7411765, 1, 0, 1,
-0.7630718, -0.3334345, -3.228931, 0.7333333, 1, 0, 1,
-0.7601264, 0.7785551, -0.3956435, 0.7294118, 1, 0, 1,
-0.7582852, 0.3589352, -0.124079, 0.7215686, 1, 0, 1,
-0.753867, 1.119245, -1.245728, 0.7176471, 1, 0, 1,
-0.7525548, -1.089463, -1.938207, 0.7098039, 1, 0, 1,
-0.7461295, -0.3116391, -2.02268, 0.7058824, 1, 0, 1,
-0.7438459, -0.7402958, -1.708457, 0.6980392, 1, 0, 1,
-0.7433309, -0.04659263, -1.675836, 0.6901961, 1, 0, 1,
-0.7410101, 2.136727, -0.4047582, 0.6862745, 1, 0, 1,
-0.7408891, 2.006288, -0.1017094, 0.6784314, 1, 0, 1,
-0.729557, -0.7249506, -3.484785, 0.6745098, 1, 0, 1,
-0.7247935, -0.3323534, -1.597583, 0.6666667, 1, 0, 1,
-0.7197232, -1.904281, -2.585505, 0.6627451, 1, 0, 1,
-0.7112524, 1.080513, -0.487758, 0.654902, 1, 0, 1,
-0.7068172, -0.2486576, -1.400301, 0.6509804, 1, 0, 1,
-0.7032473, -0.241572, -2.417695, 0.6431373, 1, 0, 1,
-0.7027749, -0.2359124, -2.678916, 0.6392157, 1, 0, 1,
-0.7025666, 0.7399043, -0.7552478, 0.6313726, 1, 0, 1,
-0.6982411, 1.540659, 0.7570162, 0.627451, 1, 0, 1,
-0.6936651, 0.5401685, -0.6563796, 0.6196079, 1, 0, 1,
-0.6901026, -2.591281, -3.09653, 0.6156863, 1, 0, 1,
-0.685961, -1.89119, -3.261637, 0.6078432, 1, 0, 1,
-0.6832426, -0.3038991, -2.952015, 0.6039216, 1, 0, 1,
-0.6781868, 0.1046092, -2.161997, 0.5960785, 1, 0, 1,
-0.6751586, -1.409558, -2.613713, 0.5882353, 1, 0, 1,
-0.6738719, -0.3894003, -2.588686, 0.5843138, 1, 0, 1,
-0.671896, -0.4182917, -2.969957, 0.5764706, 1, 0, 1,
-0.6711347, -0.6634717, -2.019874, 0.572549, 1, 0, 1,
-0.670308, 0.3881643, 0.2145611, 0.5647059, 1, 0, 1,
-0.669299, -0.04517454, -1.410099, 0.5607843, 1, 0, 1,
-0.668527, 0.1013902, -1.888666, 0.5529412, 1, 0, 1,
-0.6607441, 0.429607, -0.6111665, 0.5490196, 1, 0, 1,
-0.6595662, -1.010857, -4.115188, 0.5411765, 1, 0, 1,
-0.6591946, 0.4132914, 0.7798994, 0.5372549, 1, 0, 1,
-0.6588976, 0.555912, 1.025457, 0.5294118, 1, 0, 1,
-0.6584284, 0.6561546, -0.6937187, 0.5254902, 1, 0, 1,
-0.6553794, 0.2937041, -2.781729, 0.5176471, 1, 0, 1,
-0.6548496, 0.4845721, -2.645371, 0.5137255, 1, 0, 1,
-0.6544546, -1.471062, -2.621308, 0.5058824, 1, 0, 1,
-0.6525618, -0.3968808, -1.282907, 0.5019608, 1, 0, 1,
-0.6513683, -0.2753573, -1.697804, 0.4941176, 1, 0, 1,
-0.6509956, 0.09691679, -2.434674, 0.4862745, 1, 0, 1,
-0.6470282, 0.5622659, 0.06219515, 0.4823529, 1, 0, 1,
-0.6439607, -1.342922, -2.383187, 0.4745098, 1, 0, 1,
-0.6429396, 0.1017422, -1.897747, 0.4705882, 1, 0, 1,
-0.6409882, 0.4565854, -1.003245, 0.4627451, 1, 0, 1,
-0.6399198, -0.9721639, -2.48092, 0.4588235, 1, 0, 1,
-0.6392401, -0.8510911, -3.019726, 0.4509804, 1, 0, 1,
-0.637529, -1.200268, -2.655104, 0.4470588, 1, 0, 1,
-0.6340502, 1.631516, -0.1863854, 0.4392157, 1, 0, 1,
-0.6302248, 0.2815238, -1.557719, 0.4352941, 1, 0, 1,
-0.6261909, 1.446139, -0.6651531, 0.427451, 1, 0, 1,
-0.6254472, 0.1357909, 0.4189947, 0.4235294, 1, 0, 1,
-0.6235136, -1.430421, -4.779457, 0.4156863, 1, 0, 1,
-0.6227148, -1.414138, -2.376593, 0.4117647, 1, 0, 1,
-0.6212627, 2.370764, -1.916765, 0.4039216, 1, 0, 1,
-0.6162509, 0.293562, -0.3333524, 0.3960784, 1, 0, 1,
-0.6102214, 2.19439, -0.5242327, 0.3921569, 1, 0, 1,
-0.607451, 0.2893244, -0.1922147, 0.3843137, 1, 0, 1,
-0.6047869, -0.3815566, -3.681005, 0.3803922, 1, 0, 1,
-0.6000968, 0.727805, -2.5582, 0.372549, 1, 0, 1,
-0.5988361, 0.8170828, -1.056909, 0.3686275, 1, 0, 1,
-0.5950872, 0.4253241, -1.667085, 0.3607843, 1, 0, 1,
-0.5932983, -0.245464, -1.136966, 0.3568628, 1, 0, 1,
-0.5928088, 1.037439, 0.7573236, 0.3490196, 1, 0, 1,
-0.5922318, -1.086001, -0.8611585, 0.345098, 1, 0, 1,
-0.5920264, 0.2291091, -2.088978, 0.3372549, 1, 0, 1,
-0.5917588, 1.237181, -1.129104, 0.3333333, 1, 0, 1,
-0.5917263, 0.0001337831, -2.90995, 0.3254902, 1, 0, 1,
-0.5840836, 1.675736, 1.497197, 0.3215686, 1, 0, 1,
-0.5817258, 0.02657179, -2.080238, 0.3137255, 1, 0, 1,
-0.5791446, 0.5376099, -0.7222005, 0.3098039, 1, 0, 1,
-0.5778847, 0.2389043, -1.581954, 0.3019608, 1, 0, 1,
-0.5772876, -0.3032236, -2.572617, 0.2941177, 1, 0, 1,
-0.5734678, 0.7782645, -1.183713, 0.2901961, 1, 0, 1,
-0.5729097, 1.193674, -0.6981726, 0.282353, 1, 0, 1,
-0.5654113, -0.003857134, -1.211119, 0.2784314, 1, 0, 1,
-0.5637499, 0.2668705, -0.7078231, 0.2705882, 1, 0, 1,
-0.5618523, -0.793331, -2.92723, 0.2666667, 1, 0, 1,
-0.5534099, -0.885092, -3.789687, 0.2588235, 1, 0, 1,
-0.5510599, -0.6267762, -4.259774, 0.254902, 1, 0, 1,
-0.5479293, 0.2564408, -0.687381, 0.2470588, 1, 0, 1,
-0.5441081, -1.270643, -3.130265, 0.2431373, 1, 0, 1,
-0.5392051, 0.3488602, -1.321022, 0.2352941, 1, 0, 1,
-0.5309477, -0.8429893, -3.938655, 0.2313726, 1, 0, 1,
-0.5293367, 1.04894, 0.6924411, 0.2235294, 1, 0, 1,
-0.5253718, 1.367563, -1.366663, 0.2196078, 1, 0, 1,
-0.5229393, -1.139117, -2.044187, 0.2117647, 1, 0, 1,
-0.5216403, -0.7134691, -0.761395, 0.2078431, 1, 0, 1,
-0.5173369, -1.82904, -5.482779, 0.2, 1, 0, 1,
-0.5157813, -0.585084, -3.843226, 0.1921569, 1, 0, 1,
-0.5109835, -0.121613, -1.106125, 0.1882353, 1, 0, 1,
-0.5107116, -0.7781628, -3.011218, 0.1803922, 1, 0, 1,
-0.5087194, 0.2368934, -1.404884, 0.1764706, 1, 0, 1,
-0.5085434, -1.33694, -2.601616, 0.1686275, 1, 0, 1,
-0.5064533, -0.4610493, -3.23218, 0.1647059, 1, 0, 1,
-0.5043076, -0.8142475, -2.408456, 0.1568628, 1, 0, 1,
-0.5000621, 0.8738602, -0.5686634, 0.1529412, 1, 0, 1,
-0.4877463, 0.3968195, -0.3350269, 0.145098, 1, 0, 1,
-0.4870924, -0.3139709, -5.685287, 0.1411765, 1, 0, 1,
-0.4861453, -1.002673, -2.684726, 0.1333333, 1, 0, 1,
-0.4834301, -0.3607735, -3.259166, 0.1294118, 1, 0, 1,
-0.4824306, -0.02364971, -1.802245, 0.1215686, 1, 0, 1,
-0.4805613, 1.542551, -0.2808143, 0.1176471, 1, 0, 1,
-0.4801366, -0.2788759, -3.123119, 0.1098039, 1, 0, 1,
-0.479368, 2.601866, -2.643022, 0.1058824, 1, 0, 1,
-0.4791452, -0.7867288, -3.24009, 0.09803922, 1, 0, 1,
-0.475837, 1.256491, -1.712342, 0.09019608, 1, 0, 1,
-0.4656205, 0.3158053, -1.252211, 0.08627451, 1, 0, 1,
-0.4614407, -1.256458, -2.163422, 0.07843138, 1, 0, 1,
-0.4601013, -0.3839756, -2.098302, 0.07450981, 1, 0, 1,
-0.4587324, -1.085761, -3.325039, 0.06666667, 1, 0, 1,
-0.4581894, -0.4108627, -3.392199, 0.0627451, 1, 0, 1,
-0.4545221, 1.617536, -1.280403, 0.05490196, 1, 0, 1,
-0.4527762, 1.076997, -0.02814961, 0.05098039, 1, 0, 1,
-0.451676, -0.8988257, -3.132572, 0.04313726, 1, 0, 1,
-0.4472426, 0.9963543, 1.640437, 0.03921569, 1, 0, 1,
-0.4440822, 0.7469517, 0.4728125, 0.03137255, 1, 0, 1,
-0.4385501, -0.6064476, -3.327967, 0.02745098, 1, 0, 1,
-0.4327097, -0.9806429, -3.906616, 0.01960784, 1, 0, 1,
-0.429506, -0.01884309, -1.878674, 0.01568628, 1, 0, 1,
-0.4282069, -0.3670886, -2.308431, 0.007843138, 1, 0, 1,
-0.4275181, -0.2464371, -3.472255, 0.003921569, 1, 0, 1,
-0.4247853, 1.103871, -2.395571, 0, 1, 0.003921569, 1,
-0.4246931, -0.5520275, -3.329783, 0, 1, 0.01176471, 1,
-0.4209552, 0.04769488, -2.734271, 0, 1, 0.01568628, 1,
-0.41427, -0.1552697, -0.9682188, 0, 1, 0.02352941, 1,
-0.4066878, 0.1916585, -0.83937, 0, 1, 0.02745098, 1,
-0.4060192, 0.2407265, -0.8289852, 0, 1, 0.03529412, 1,
-0.4001319, 0.5648754, -0.9919098, 0, 1, 0.03921569, 1,
-0.3963633, 0.6736386, 2.04525, 0, 1, 0.04705882, 1,
-0.3886819, 0.6550411, -0.2811225, 0, 1, 0.05098039, 1,
-0.3823048, -1.69365, -4.28553, 0, 1, 0.05882353, 1,
-0.3812321, 0.3744594, 0.7467498, 0, 1, 0.0627451, 1,
-0.380747, -0.7323849, -2.291899, 0, 1, 0.07058824, 1,
-0.3763909, 0.3469243, 0.2774261, 0, 1, 0.07450981, 1,
-0.3705066, 0.3380809, -0.2914022, 0, 1, 0.08235294, 1,
-0.3571982, -0.6234289, -3.145464, 0, 1, 0.08627451, 1,
-0.3552336, 1.640931, -0.5470401, 0, 1, 0.09411765, 1,
-0.351323, 1.849427, 0.3059902, 0, 1, 0.1019608, 1,
-0.3512955, -1.532828, -2.926106, 0, 1, 0.1058824, 1,
-0.3471993, -1.000926, -3.875513, 0, 1, 0.1137255, 1,
-0.3427791, -0.7498449, -4.28123, 0, 1, 0.1176471, 1,
-0.338546, 1.373206, -1.387253, 0, 1, 0.1254902, 1,
-0.3355603, -1.558948, -1.794458, 0, 1, 0.1294118, 1,
-0.3305608, 0.4756921, -0.539592, 0, 1, 0.1372549, 1,
-0.3295726, 0.2341993, 0.7827104, 0, 1, 0.1411765, 1,
-0.3238305, 1.314818, -0.1531286, 0, 1, 0.1490196, 1,
-0.3196418, -1.040964, -2.616574, 0, 1, 0.1529412, 1,
-0.3172755, -1.361083, -2.027885, 0, 1, 0.1607843, 1,
-0.3135605, 1.747847, -0.8124036, 0, 1, 0.1647059, 1,
-0.3130158, 1.450482, 0.3106982, 0, 1, 0.172549, 1,
-0.3091187, 0.08256543, -0.3372004, 0, 1, 0.1764706, 1,
-0.3050241, -0.6371959, -2.918779, 0, 1, 0.1843137, 1,
-0.3045913, 0.6331931, 0.7316317, 0, 1, 0.1882353, 1,
-0.30287, -0.4405484, -2.532129, 0, 1, 0.1960784, 1,
-0.3006333, 0.5019551, -1.20934, 0, 1, 0.2039216, 1,
-0.2997654, 0.4571354, -1.602933, 0, 1, 0.2078431, 1,
-0.288963, 0.6437294, -1.789271, 0, 1, 0.2156863, 1,
-0.2867532, -0.7352298, -2.182306, 0, 1, 0.2196078, 1,
-0.2839972, 0.2036339, -1.517836, 0, 1, 0.227451, 1,
-0.2839721, -0.4326518, -1.57582, 0, 1, 0.2313726, 1,
-0.282902, -0.6141474, -3.85754, 0, 1, 0.2392157, 1,
-0.2789025, 0.2304626, 0.3207352, 0, 1, 0.2431373, 1,
-0.2782354, -0.38999, -3.438304, 0, 1, 0.2509804, 1,
-0.2751145, -0.7701314, -2.772743, 0, 1, 0.254902, 1,
-0.2742213, 0.5200706, -0.3646664, 0, 1, 0.2627451, 1,
-0.2733648, 0.6813446, 0.357057, 0, 1, 0.2666667, 1,
-0.2710804, 0.7259462, 0.01066395, 0, 1, 0.2745098, 1,
-0.2667744, 0.595979, -0.7976016, 0, 1, 0.2784314, 1,
-0.2641889, -1.067532, -3.530089, 0, 1, 0.2862745, 1,
-0.2619011, -2.177462, -1.347352, 0, 1, 0.2901961, 1,
-0.2616475, -0.4145834, -1.814241, 0, 1, 0.2980392, 1,
-0.2596786, -0.8025734, -3.851969, 0, 1, 0.3058824, 1,
-0.259275, 1.445473, -0.9450353, 0, 1, 0.3098039, 1,
-0.2588231, 0.006423652, -1.996959, 0, 1, 0.3176471, 1,
-0.2584024, 1.314321, -0.8882852, 0, 1, 0.3215686, 1,
-0.2562388, -0.6756478, -2.977298, 0, 1, 0.3294118, 1,
-0.2560843, -0.6839516, -4.003885, 0, 1, 0.3333333, 1,
-0.2483062, -0.2398023, -3.041538, 0, 1, 0.3411765, 1,
-0.2477653, 1.385399, -1.503175, 0, 1, 0.345098, 1,
-0.2414455, -0.1363236, -2.48598, 0, 1, 0.3529412, 1,
-0.2396227, 0.1194299, -2.127312, 0, 1, 0.3568628, 1,
-0.2393199, -1.613433, -1.484186, 0, 1, 0.3647059, 1,
-0.2370767, -1.672253, -2.510346, 0, 1, 0.3686275, 1,
-0.233477, -0.7098561, -3.513411, 0, 1, 0.3764706, 1,
-0.2320997, -1.385268, -2.759752, 0, 1, 0.3803922, 1,
-0.2261975, 0.5360548, -0.291333, 0, 1, 0.3882353, 1,
-0.2247212, -0.1545946, -3.701347, 0, 1, 0.3921569, 1,
-0.2220767, -0.9421445, -3.27013, 0, 1, 0.4, 1,
-0.2168306, 1.22064, -1.028544, 0, 1, 0.4078431, 1,
-0.2167257, -1.313235, -3.527648, 0, 1, 0.4117647, 1,
-0.2135772, 1.172695, -1.090963, 0, 1, 0.4196078, 1,
-0.2133072, 0.2887413, -2.120565, 0, 1, 0.4235294, 1,
-0.2122423, 0.3217617, -1.25318, 0, 1, 0.4313726, 1,
-0.2076489, 1.012977, 1.907919, 0, 1, 0.4352941, 1,
-0.2072082, 0.4843671, -2.116076, 0, 1, 0.4431373, 1,
-0.2042548, -0.2747169, -3.363233, 0, 1, 0.4470588, 1,
-0.2010804, 1.487174, 1.088981, 0, 1, 0.454902, 1,
-0.1995491, -1.524336, -2.151731, 0, 1, 0.4588235, 1,
-0.1991279, 1.468654, -1.000592, 0, 1, 0.4666667, 1,
-0.1985083, 0.8070704, -0.06679665, 0, 1, 0.4705882, 1,
-0.1977333, -0.6074484, -3.619122, 0, 1, 0.4784314, 1,
-0.1956627, 0.3774017, 1.27787, 0, 1, 0.4823529, 1,
-0.1932345, -0.6629682, -2.193492, 0, 1, 0.4901961, 1,
-0.1929222, 2.800731, 2.379024, 0, 1, 0.4941176, 1,
-0.1924137, -1.461704, -3.897033, 0, 1, 0.5019608, 1,
-0.1863484, 1.601657, 0.4171333, 0, 1, 0.509804, 1,
-0.1851901, -0.6394405, -1.843596, 0, 1, 0.5137255, 1,
-0.1827201, -0.03641547, -1.950897, 0, 1, 0.5215687, 1,
-0.1793915, 0.3166327, -1.729725, 0, 1, 0.5254902, 1,
-0.1744714, -0.7206323, -2.513935, 0, 1, 0.5333334, 1,
-0.1723477, -0.3069529, -2.997974, 0, 1, 0.5372549, 1,
-0.1723256, -1.949262, -4.791044, 0, 1, 0.5450981, 1,
-0.1722243, 0.6373752, -0.534715, 0, 1, 0.5490196, 1,
-0.1685346, -0.5087991, -2.930203, 0, 1, 0.5568628, 1,
-0.1664124, -1.451868, -4.085638, 0, 1, 0.5607843, 1,
-0.1621822, 0.9419723, -0.8755052, 0, 1, 0.5686275, 1,
-0.1586852, -0.298957, -3.720907, 0, 1, 0.572549, 1,
-0.1565538, -0.7258502, -3.725975, 0, 1, 0.5803922, 1,
-0.1564885, 0.4879068, 0.6737868, 0, 1, 0.5843138, 1,
-0.1542689, 1.382073, -1.047277, 0, 1, 0.5921569, 1,
-0.1537694, 1.00729, 0.2697988, 0, 1, 0.5960785, 1,
-0.1527992, -0.8024066, -3.183193, 0, 1, 0.6039216, 1,
-0.1513371, 2.628263, -0.5269034, 0, 1, 0.6117647, 1,
-0.1471377, 0.3440205, 0.8620635, 0, 1, 0.6156863, 1,
-0.145818, 0.6645365, 0.4886573, 0, 1, 0.6235294, 1,
-0.1441471, 0.3071059, 0.4472364, 0, 1, 0.627451, 1,
-0.140112, 0.05099895, -2.539315, 0, 1, 0.6352941, 1,
-0.1394803, -0.03106304, -1.392363, 0, 1, 0.6392157, 1,
-0.1392768, 0.4663482, 1.047082, 0, 1, 0.6470588, 1,
-0.1371437, 0.1358957, 0.8414808, 0, 1, 0.6509804, 1,
-0.1364937, -2.079677, -2.718796, 0, 1, 0.6588235, 1,
-0.1358742, -0.5365399, -2.065801, 0, 1, 0.6627451, 1,
-0.1285078, 0.008002285, -0.2268942, 0, 1, 0.6705883, 1,
-0.1212847, 1.635298, 0.1720984, 0, 1, 0.6745098, 1,
-0.1210259, -0.01363981, -0.6296647, 0, 1, 0.682353, 1,
-0.1200688, -2.25249, -3.563284, 0, 1, 0.6862745, 1,
-0.1185418, -2.289372, -1.035669, 0, 1, 0.6941177, 1,
-0.1126144, -1.223483, -3.752927, 0, 1, 0.7019608, 1,
-0.1101, -0.7552592, -2.899726, 0, 1, 0.7058824, 1,
-0.1096627, -1.60988, -3.612756, 0, 1, 0.7137255, 1,
-0.1081627, 1.101751, -0.2031716, 0, 1, 0.7176471, 1,
-0.1065658, 1.459095, 0.5688646, 0, 1, 0.7254902, 1,
-0.1052231, -1.183541, -1.994163, 0, 1, 0.7294118, 1,
-0.1040401, 2.020325, -1.080346, 0, 1, 0.7372549, 1,
-0.1003539, -0.4407084, -2.562665, 0, 1, 0.7411765, 1,
-0.09893534, 0.07719649, -1.421046, 0, 1, 0.7490196, 1,
-0.09782536, 0.7534796, -2.233328, 0, 1, 0.7529412, 1,
-0.09189311, 1.891714, 0.6798057, 0, 1, 0.7607843, 1,
-0.08994491, 1.407799, -0.5018746, 0, 1, 0.7647059, 1,
-0.08793207, 2.254424, 0.9935966, 0, 1, 0.772549, 1,
-0.08416995, 1.606324, -0.456744, 0, 1, 0.7764706, 1,
-0.08370644, -0.703751, -3.406379, 0, 1, 0.7843137, 1,
-0.08324968, -1.726131, -3.333338, 0, 1, 0.7882353, 1,
-0.07593561, 1.638415, -0.250825, 0, 1, 0.7960784, 1,
-0.07527075, 0.9110482, 0.1211227, 0, 1, 0.8039216, 1,
-0.07252029, -0.9422043, -1.270153, 0, 1, 0.8078431, 1,
-0.07079124, -0.1879595, -2.935183, 0, 1, 0.8156863, 1,
-0.06936839, -0.2920375, -4.054385, 0, 1, 0.8196079, 1,
-0.06788763, -1.177839, -2.702947, 0, 1, 0.827451, 1,
-0.06775632, 1.18531, 0.1606658, 0, 1, 0.8313726, 1,
-0.06592532, -1.281358, -2.40648, 0, 1, 0.8392157, 1,
-0.0644928, -0.6062599, -4.34163, 0, 1, 0.8431373, 1,
-0.06343924, -0.50678, -2.995299, 0, 1, 0.8509804, 1,
-0.06077333, 0.4291079, 2.280303, 0, 1, 0.854902, 1,
-0.05783162, 0.5595539, -1.429381, 0, 1, 0.8627451, 1,
-0.05122392, 0.02333682, -1.332532, 0, 1, 0.8666667, 1,
-0.05105063, 0.0386739, -1.274922, 0, 1, 0.8745098, 1,
-0.04918748, 0.3191551, -0.2767606, 0, 1, 0.8784314, 1,
-0.04655744, -0.5444742, -3.025675, 0, 1, 0.8862745, 1,
-0.04119962, -0.5955378, -1.476707, 0, 1, 0.8901961, 1,
-0.04069378, -0.5229777, -2.866534, 0, 1, 0.8980392, 1,
-0.03822151, -0.7875904, -3.08417, 0, 1, 0.9058824, 1,
-0.03725133, -0.4353477, -2.369977, 0, 1, 0.9098039, 1,
-0.03571694, -0.2448177, -3.572425, 0, 1, 0.9176471, 1,
-0.03369365, -0.5308878, -2.604715, 0, 1, 0.9215686, 1,
-0.02946703, -0.2967241, -2.280259, 0, 1, 0.9294118, 1,
-0.02945323, 0.3321545, 0.5577891, 0, 1, 0.9333333, 1,
-0.02466817, 1.319283, -0.1121566, 0, 1, 0.9411765, 1,
-0.02161753, 0.9923075, 0.9425352, 0, 1, 0.945098, 1,
-0.01879219, -0.790572, -2.949684, 0, 1, 0.9529412, 1,
-0.01656762, 1.074816, -0.2156606, 0, 1, 0.9568627, 1,
-0.0160624, 0.9245056, 0.20489, 0, 1, 0.9647059, 1,
-0.008829291, 0.201903, 0.6913036, 0, 1, 0.9686275, 1,
-0.007511325, 0.05051807, 0.06315702, 0, 1, 0.9764706, 1,
-0.006990376, 1.442993, 1.100445, 0, 1, 0.9803922, 1,
-0.004129512, -0.1644485, -4.365826, 0, 1, 0.9882353, 1,
0.001275562, -0.06743428, 3.099025, 0, 1, 0.9921569, 1,
0.001618598, 1.082573, -0.01917216, 0, 1, 1, 1,
0.003046213, -0.3228655, 2.573061, 0, 0.9921569, 1, 1,
0.003403709, -0.5625117, 3.425528, 0, 0.9882353, 1, 1,
0.005746276, 0.6221972, 0.5201822, 0, 0.9803922, 1, 1,
0.007287111, -0.7838352, 5.203319, 0, 0.9764706, 1, 1,
0.009605029, 1.217747, 0.4853505, 0, 0.9686275, 1, 1,
0.0103446, 0.1301087, -1.860465, 0, 0.9647059, 1, 1,
0.01182208, 0.5950653, 0.4885189, 0, 0.9568627, 1, 1,
0.01387511, 0.6379329, -0.6722602, 0, 0.9529412, 1, 1,
0.01571871, 0.2315674, 0.3788767, 0, 0.945098, 1, 1,
0.01942379, -1.187696, 3.811201, 0, 0.9411765, 1, 1,
0.02043567, 1.51951, -0.5644061, 0, 0.9333333, 1, 1,
0.02155527, 0.2064061, 0.247294, 0, 0.9294118, 1, 1,
0.02438791, -0.01836201, 2.447076, 0, 0.9215686, 1, 1,
0.02550568, -0.3554872, 3.147978, 0, 0.9176471, 1, 1,
0.02576901, 0.09206937, 1.623457, 0, 0.9098039, 1, 1,
0.02793572, -0.5187312, 1.74573, 0, 0.9058824, 1, 1,
0.02850124, -0.3630453, 3.04288, 0, 0.8980392, 1, 1,
0.02852284, -1.066017, 1.309092, 0, 0.8901961, 1, 1,
0.03617734, -0.3800406, 1.169221, 0, 0.8862745, 1, 1,
0.0366383, -1.140854, 1.192884, 0, 0.8784314, 1, 1,
0.03738471, 0.2180999, 1.876633, 0, 0.8745098, 1, 1,
0.04079344, 1.220522, -0.3214585, 0, 0.8666667, 1, 1,
0.04534857, 0.5355419, -1.198475, 0, 0.8627451, 1, 1,
0.04800431, -0.4345089, 2.425325, 0, 0.854902, 1, 1,
0.04838276, 0.1922189, -0.2047535, 0, 0.8509804, 1, 1,
0.05197825, -0.160716, 4.940664, 0, 0.8431373, 1, 1,
0.05860855, 0.02152665, 0.9244404, 0, 0.8392157, 1, 1,
0.06436189, -0.02059611, 2.454352, 0, 0.8313726, 1, 1,
0.06565643, -2.145531, 3.455377, 0, 0.827451, 1, 1,
0.0677766, -1.090385, 4.033745, 0, 0.8196079, 1, 1,
0.07256628, -0.0189114, 2.455302, 0, 0.8156863, 1, 1,
0.07608517, 0.5220034, 0.03562796, 0, 0.8078431, 1, 1,
0.08009749, -0.2011684, 2.938848, 0, 0.8039216, 1, 1,
0.08024666, 0.2585626, -0.06175211, 0, 0.7960784, 1, 1,
0.08305866, 0.6823274, -0.1507986, 0, 0.7882353, 1, 1,
0.08399313, -1.792736, 3.327441, 0, 0.7843137, 1, 1,
0.08442058, 0.4920678, -0.6629269, 0, 0.7764706, 1, 1,
0.08490053, 0.2743846, 0.2262696, 0, 0.772549, 1, 1,
0.09038189, 0.5399039, 0.8365391, 0, 0.7647059, 1, 1,
0.0907691, 1.400958, 0.8522874, 0, 0.7607843, 1, 1,
0.09150919, 0.05870861, 1.461571, 0, 0.7529412, 1, 1,
0.09384933, -1.004921, 1.332873, 0, 0.7490196, 1, 1,
0.09806105, 1.193719, 0.430553, 0, 0.7411765, 1, 1,
0.1062892, 0.3514906, -0.07798728, 0, 0.7372549, 1, 1,
0.1075952, 1.72951, 0.127054, 0, 0.7294118, 1, 1,
0.1115641, 0.03162498, -0.9209264, 0, 0.7254902, 1, 1,
0.1163427, 0.3986447, -0.250135, 0, 0.7176471, 1, 1,
0.1253922, 0.5346472, 0.3621792, 0, 0.7137255, 1, 1,
0.1331736, 0.2398327, 0.8984363, 0, 0.7058824, 1, 1,
0.1361578, 1.677739, -0.1743972, 0, 0.6980392, 1, 1,
0.1424319, -0.417772, 3.177735, 0, 0.6941177, 1, 1,
0.1453381, 1.278355, 0.06559802, 0, 0.6862745, 1, 1,
0.1530732, 0.3211522, 0.3154099, 0, 0.682353, 1, 1,
0.1532618, 1.492758, -0.9069554, 0, 0.6745098, 1, 1,
0.1533867, 0.5557587, 0.1883865, 0, 0.6705883, 1, 1,
0.1536633, 2.249055, -0.4198222, 0, 0.6627451, 1, 1,
0.1553514, -0.1323328, 2.075776, 0, 0.6588235, 1, 1,
0.157571, -1.191467, 2.533273, 0, 0.6509804, 1, 1,
0.1599836, 2.56933, -0.4529543, 0, 0.6470588, 1, 1,
0.1655359, 1.073027, 0.273157, 0, 0.6392157, 1, 1,
0.1688676, 1.003099, -0.6234586, 0, 0.6352941, 1, 1,
0.1713319, 0.356387, 1.243969, 0, 0.627451, 1, 1,
0.1718616, -1.441684, 1.864952, 0, 0.6235294, 1, 1,
0.1783015, -0.1040739, 0.6170782, 0, 0.6156863, 1, 1,
0.1783898, 1.413633, -0.6926619, 0, 0.6117647, 1, 1,
0.1788179, -0.2624143, 1.836361, 0, 0.6039216, 1, 1,
0.1810558, -1.166044, 4.130884, 0, 0.5960785, 1, 1,
0.1866821, 1.520482, -0.2105877, 0, 0.5921569, 1, 1,
0.1907127, -0.619521, 2.895086, 0, 0.5843138, 1, 1,
0.1948923, 0.7710567, 0.3074316, 0, 0.5803922, 1, 1,
0.1954065, -0.1514044, 3.375964, 0, 0.572549, 1, 1,
0.1968089, -1.192507, 1.748851, 0, 0.5686275, 1, 1,
0.1989513, 1.906152, -1.63059, 0, 0.5607843, 1, 1,
0.199653, 0.251374, 0.9464113, 0, 0.5568628, 1, 1,
0.2016734, -1.461505, 2.413166, 0, 0.5490196, 1, 1,
0.2020617, -0.8709002, 1.911135, 0, 0.5450981, 1, 1,
0.2055906, -0.1392529, 3.431863, 0, 0.5372549, 1, 1,
0.2112806, 0.07309619, 0.9412281, 0, 0.5333334, 1, 1,
0.2173692, -1.657082, 3.361251, 0, 0.5254902, 1, 1,
0.2193897, -1.104581, 2.910547, 0, 0.5215687, 1, 1,
0.2269211, -0.2202522, 3.566224, 0, 0.5137255, 1, 1,
0.2289443, 0.02162121, 1.304961, 0, 0.509804, 1, 1,
0.2310161, 0.9423236, 1.196268, 0, 0.5019608, 1, 1,
0.2321133, -0.1344076, 1.594731, 0, 0.4941176, 1, 1,
0.2337549, 1.146045, 0.4228185, 0, 0.4901961, 1, 1,
0.2346267, -0.4958562, 2.79292, 0, 0.4823529, 1, 1,
0.2357091, -1.177786, 3.748734, 0, 0.4784314, 1, 1,
0.2390131, 1.752834, -0.8409814, 0, 0.4705882, 1, 1,
0.2393611, -1.136482, 3.199484, 0, 0.4666667, 1, 1,
0.2420843, -0.9563916, 3.296341, 0, 0.4588235, 1, 1,
0.2442055, 1.325781, -0.7861518, 0, 0.454902, 1, 1,
0.2458737, 0.6375873, 1.147495, 0, 0.4470588, 1, 1,
0.250738, 0.2202772, -0.372126, 0, 0.4431373, 1, 1,
0.2512422, -1.090387, 3.885522, 0, 0.4352941, 1, 1,
0.2643769, -0.2749085, 2.795382, 0, 0.4313726, 1, 1,
0.2659928, 0.6843455, 0.5686455, 0, 0.4235294, 1, 1,
0.2717341, -0.5383466, 4.692032, 0, 0.4196078, 1, 1,
0.2718444, -0.794316, 3.333314, 0, 0.4117647, 1, 1,
0.2750807, -0.1534762, 1.769887, 0, 0.4078431, 1, 1,
0.2751291, 0.1883435, 1.029216, 0, 0.4, 1, 1,
0.2791842, -1.45001, 4.827866, 0, 0.3921569, 1, 1,
0.2808384, -0.1686182, 3.739808, 0, 0.3882353, 1, 1,
0.2849309, -0.5612372, 3.723078, 0, 0.3803922, 1, 1,
0.2857436, -0.193449, 2.352931, 0, 0.3764706, 1, 1,
0.2866108, 0.18043, 0.2802714, 0, 0.3686275, 1, 1,
0.2909215, -1.418616, 2.073441, 0, 0.3647059, 1, 1,
0.2942347, -0.325824, 1.798732, 0, 0.3568628, 1, 1,
0.3002177, -1.076178, 0.9634038, 0, 0.3529412, 1, 1,
0.3021084, 2.780587, -2.443114, 0, 0.345098, 1, 1,
0.304066, 0.009183648, 2.398571, 0, 0.3411765, 1, 1,
0.3051533, -0.6127451, 2.858876, 0, 0.3333333, 1, 1,
0.3065866, -0.6508164, 2.957631, 0, 0.3294118, 1, 1,
0.3200301, -0.6686515, 2.290132, 0, 0.3215686, 1, 1,
0.3208193, 0.2880923, 1.823702, 0, 0.3176471, 1, 1,
0.3225127, -0.8710624, 4.452089, 0, 0.3098039, 1, 1,
0.3286147, 0.8237445, -0.09391438, 0, 0.3058824, 1, 1,
0.3286312, 1.695477, -1.898323, 0, 0.2980392, 1, 1,
0.328947, 0.2801116, -0.8951383, 0, 0.2901961, 1, 1,
0.3352232, 1.993462, -0.5203523, 0, 0.2862745, 1, 1,
0.3360853, 1.09463, 0.1212933, 0, 0.2784314, 1, 1,
0.3384629, -1.107519, 2.126106, 0, 0.2745098, 1, 1,
0.3392505, -2.46795, 3.620903, 0, 0.2666667, 1, 1,
0.341731, 2.037221, -0.05337617, 0, 0.2627451, 1, 1,
0.3430724, 0.7355348, 0.4172388, 0, 0.254902, 1, 1,
0.3489234, 0.6330079, 0.1191049, 0, 0.2509804, 1, 1,
0.3491467, -0.3445716, 1.539833, 0, 0.2431373, 1, 1,
0.3503766, 0.1523577, 2.049327, 0, 0.2392157, 1, 1,
0.3565361, -1.018116, 1.967742, 0, 0.2313726, 1, 1,
0.3574436, 0.8314843, 0.6444178, 0, 0.227451, 1, 1,
0.3582799, 0.4023489, 0.7320008, 0, 0.2196078, 1, 1,
0.3627883, 0.3316779, 0.3390735, 0, 0.2156863, 1, 1,
0.3658491, 0.5378864, 0.09764256, 0, 0.2078431, 1, 1,
0.3676003, 1.472109, -0.1506471, 0, 0.2039216, 1, 1,
0.3704862, -0.3979318, 1.500578, 0, 0.1960784, 1, 1,
0.3787426, -1.577386, 2.391839, 0, 0.1882353, 1, 1,
0.3787643, 0.8881854, -0.7196903, 0, 0.1843137, 1, 1,
0.385887, -1.614817, 3.23653, 0, 0.1764706, 1, 1,
0.3895823, 0.1762746, 1.377329, 0, 0.172549, 1, 1,
0.3933313, 0.172692, 1.395465, 0, 0.1647059, 1, 1,
0.3941003, -0.1651386, 1.478111, 0, 0.1607843, 1, 1,
0.3952894, -0.2323791, 2.533794, 0, 0.1529412, 1, 1,
0.4015286, 0.5073447, -1.044121, 0, 0.1490196, 1, 1,
0.4038703, -0.08358172, 0.8334698, 0, 0.1411765, 1, 1,
0.4053952, -0.7680482, 3.050677, 0, 0.1372549, 1, 1,
0.4063323, -0.3892719, 3.153997, 0, 0.1294118, 1, 1,
0.4063723, 0.2401341, 1.824272, 0, 0.1254902, 1, 1,
0.4080613, 1.169802, -0.1925705, 0, 0.1176471, 1, 1,
0.408801, -0.02956591, 0.9519953, 0, 0.1137255, 1, 1,
0.4088461, -0.4530633, 2.479906, 0, 0.1058824, 1, 1,
0.4100839, 0.4344738, -1.385995, 0, 0.09803922, 1, 1,
0.4115815, 0.8500087, 1.623735, 0, 0.09411765, 1, 1,
0.4125252, 0.08023487, 2.299603, 0, 0.08627451, 1, 1,
0.4130174, -0.6271655, 1.308469, 0, 0.08235294, 1, 1,
0.4133057, 0.2947182, -0.270373, 0, 0.07450981, 1, 1,
0.4149955, -0.8173442, 1.842144, 0, 0.07058824, 1, 1,
0.4161536, -2.115429, 2.996594, 0, 0.0627451, 1, 1,
0.4167387, -1.162535, 4.243805, 0, 0.05882353, 1, 1,
0.4170769, 1.456406, -1.795734, 0, 0.05098039, 1, 1,
0.4205057, -0.004277551, -0.479931, 0, 0.04705882, 1, 1,
0.421133, -0.2749791, 1.242864, 0, 0.03921569, 1, 1,
0.4213571, 0.6104138, 0.8978534, 0, 0.03529412, 1, 1,
0.4251052, 0.541873, -0.6263732, 0, 0.02745098, 1, 1,
0.4333233, -0.8727869, 1.763112, 0, 0.02352941, 1, 1,
0.4340912, 2.170478, -1.045632, 0, 0.01568628, 1, 1,
0.4347567, 2.276366, -0.4826135, 0, 0.01176471, 1, 1,
0.440973, -0.4751897, 1.666776, 0, 0.003921569, 1, 1,
0.4414521, -0.1167685, 1.44383, 0.003921569, 0, 1, 1,
0.442819, 0.4052254, 0.8360038, 0.007843138, 0, 1, 1,
0.4431916, 0.8783568, 1.054104, 0.01568628, 0, 1, 1,
0.446299, 0.6768967, 1.483877, 0.01960784, 0, 1, 1,
0.4466489, -0.09105492, 1.429464, 0.02745098, 0, 1, 1,
0.4467782, 0.2202381, 0.7585589, 0.03137255, 0, 1, 1,
0.4490175, 0.2886614, 1.951438, 0.03921569, 0, 1, 1,
0.4494997, -0.9949066, 2.606779, 0.04313726, 0, 1, 1,
0.4525409, -0.05438991, 0.282823, 0.05098039, 0, 1, 1,
0.4526104, 1.223202, 2.068613, 0.05490196, 0, 1, 1,
0.4600334, -0.6626852, 2.747389, 0.0627451, 0, 1, 1,
0.4684429, 1.193741, 0.7689278, 0.06666667, 0, 1, 1,
0.4702616, 0.709455, 1.006261, 0.07450981, 0, 1, 1,
0.4705726, 1.011869, 0.4064876, 0.07843138, 0, 1, 1,
0.4742245, -0.2343219, 1.260464, 0.08627451, 0, 1, 1,
0.4754016, -1.11154, 3.011986, 0.09019608, 0, 1, 1,
0.4776925, 0.7793251, 0.5917931, 0.09803922, 0, 1, 1,
0.4792707, 0.5743356, 0.7289288, 0.1058824, 0, 1, 1,
0.4830298, 0.2611169, 0.09972972, 0.1098039, 0, 1, 1,
0.488759, 1.199572, 1.11204, 0.1176471, 0, 1, 1,
0.5005996, -1.325083, 2.638032, 0.1215686, 0, 1, 1,
0.5036495, -1.20038, 2.165416, 0.1294118, 0, 1, 1,
0.5037345, -0.8713661, 1.04906, 0.1333333, 0, 1, 1,
0.505649, 0.4944253, 2.184211, 0.1411765, 0, 1, 1,
0.5093533, -0.01720444, 1.859294, 0.145098, 0, 1, 1,
0.5123656, 1.586025, 0.5952372, 0.1529412, 0, 1, 1,
0.5138782, -0.03716723, -1.125057, 0.1568628, 0, 1, 1,
0.5201377, -1.242444, 2.156605, 0.1647059, 0, 1, 1,
0.522452, 1.280567, 1.045416, 0.1686275, 0, 1, 1,
0.5283791, 0.8300455, 0.340429, 0.1764706, 0, 1, 1,
0.5289272, -0.003284406, 1.180781, 0.1803922, 0, 1, 1,
0.5308104, 0.8989419, 1.356424, 0.1882353, 0, 1, 1,
0.5369459, 0.7892752, -0.2384901, 0.1921569, 0, 1, 1,
0.5376003, 0.4237888, 1.743413, 0.2, 0, 1, 1,
0.5381172, 2.719704, -0.8627223, 0.2078431, 0, 1, 1,
0.5411628, 0.04909736, 3.134542, 0.2117647, 0, 1, 1,
0.5412815, 1.858531, 0.7577986, 0.2196078, 0, 1, 1,
0.5419978, 0.2762716, 2.178978, 0.2235294, 0, 1, 1,
0.5504521, 0.01257669, 1.675316, 0.2313726, 0, 1, 1,
0.5518811, -0.9067253, 2.087461, 0.2352941, 0, 1, 1,
0.5523978, -1.07409, 3.365111, 0.2431373, 0, 1, 1,
0.5551561, 0.0864677, 1.487573, 0.2470588, 0, 1, 1,
0.5581625, 0.7613123, 0.5577679, 0.254902, 0, 1, 1,
0.5586522, 0.9183974, -0.4077238, 0.2588235, 0, 1, 1,
0.5612196, -0.1051999, 2.346571, 0.2666667, 0, 1, 1,
0.5623189, 0.170438, 1.759362, 0.2705882, 0, 1, 1,
0.5645512, 1.005964, -0.3218464, 0.2784314, 0, 1, 1,
0.5673724, -1.012884, 2.367453, 0.282353, 0, 1, 1,
0.5748838, -0.6129619, 3.701723, 0.2901961, 0, 1, 1,
0.5778174, 0.9931584, -0.457238, 0.2941177, 0, 1, 1,
0.5933783, -0.485882, 3.187282, 0.3019608, 0, 1, 1,
0.5944597, -1.349502, 1.775618, 0.3098039, 0, 1, 1,
0.5961696, -0.434725, 2.118906, 0.3137255, 0, 1, 1,
0.59826, 0.1814316, 0.6656811, 0.3215686, 0, 1, 1,
0.6014462, -0.5216259, 2.472065, 0.3254902, 0, 1, 1,
0.6053876, 0.6275167, 2.893373, 0.3333333, 0, 1, 1,
0.611615, 1.109273, 0.7059056, 0.3372549, 0, 1, 1,
0.6133786, 0.05437686, 1.831408, 0.345098, 0, 1, 1,
0.6152104, -0.5489526, 4.20888, 0.3490196, 0, 1, 1,
0.6159676, 0.638463, 0.9798786, 0.3568628, 0, 1, 1,
0.6181267, -1.10739, 2.285673, 0.3607843, 0, 1, 1,
0.6206262, 0.8391928, 0.213689, 0.3686275, 0, 1, 1,
0.6224303, 0.5339353, 0.3524554, 0.372549, 0, 1, 1,
0.6236257, 0.2531766, 1.633186, 0.3803922, 0, 1, 1,
0.6248335, -0.2480865, 2.629155, 0.3843137, 0, 1, 1,
0.6292517, -0.01730121, 1.659959, 0.3921569, 0, 1, 1,
0.6315492, -1.250057, 3.14153, 0.3960784, 0, 1, 1,
0.6325325, 0.3045361, 2.226524, 0.4039216, 0, 1, 1,
0.635362, -1.022066, 3.270537, 0.4117647, 0, 1, 1,
0.6380925, 0.593825, 0.3576826, 0.4156863, 0, 1, 1,
0.6435632, 0.8924441, 0.4628959, 0.4235294, 0, 1, 1,
0.6465021, -0.4914597, 1.277893, 0.427451, 0, 1, 1,
0.6513308, 1.13213, 0.99084, 0.4352941, 0, 1, 1,
0.6521222, 1.215186, 1.062478, 0.4392157, 0, 1, 1,
0.6523982, -0.75462, 3.098601, 0.4470588, 0, 1, 1,
0.6576468, 0.4826005, 1.282504, 0.4509804, 0, 1, 1,
0.6586005, -0.6070234, 2.406775, 0.4588235, 0, 1, 1,
0.6599819, -0.2028842, 0.808989, 0.4627451, 0, 1, 1,
0.6602004, 1.295604, 0.05819109, 0.4705882, 0, 1, 1,
0.662082, -0.838198, 2.929118, 0.4745098, 0, 1, 1,
0.6775006, -0.5077829, 4.284008, 0.4823529, 0, 1, 1,
0.6781465, 0.3998853, 1.010722, 0.4862745, 0, 1, 1,
0.6800297, -0.02132099, 1.085567, 0.4941176, 0, 1, 1,
0.6877636, -1.748542, 1.771099, 0.5019608, 0, 1, 1,
0.6882858, -1.44292, 4.047173, 0.5058824, 0, 1, 1,
0.6938385, 1.356776, -0.4011892, 0.5137255, 0, 1, 1,
0.6940967, 0.441731, 0.4886083, 0.5176471, 0, 1, 1,
0.6945832, -0.2986104, 0.339141, 0.5254902, 0, 1, 1,
0.6985982, 1.703774, 1.998214, 0.5294118, 0, 1, 1,
0.701385, 0.5225048, 1.302128, 0.5372549, 0, 1, 1,
0.7082708, -0.124671, 2.401218, 0.5411765, 0, 1, 1,
0.7094365, -1.015683, 0.5425751, 0.5490196, 0, 1, 1,
0.7108043, 1.449783, -0.5492692, 0.5529412, 0, 1, 1,
0.7163351, -0.4629612, 2.378124, 0.5607843, 0, 1, 1,
0.7186568, -0.3227906, 1.365653, 0.5647059, 0, 1, 1,
0.7226573, -0.9409547, 1.675415, 0.572549, 0, 1, 1,
0.7232407, 1.126378, -0.05254753, 0.5764706, 0, 1, 1,
0.7232918, -0.5304051, 1.879207, 0.5843138, 0, 1, 1,
0.7288122, 2.948802, 1.053495, 0.5882353, 0, 1, 1,
0.7292755, 1.271439, -0.3987812, 0.5960785, 0, 1, 1,
0.733699, -0.1052308, 0.3178982, 0.6039216, 0, 1, 1,
0.7348755, 0.8222963, 1.502042, 0.6078432, 0, 1, 1,
0.7396868, 1.027857, -0.9180536, 0.6156863, 0, 1, 1,
0.7420583, -0.542954, 3.454718, 0.6196079, 0, 1, 1,
0.7425874, -0.6426571, 1.000332, 0.627451, 0, 1, 1,
0.75251, -0.06982432, 2.684747, 0.6313726, 0, 1, 1,
0.7549334, -1.875479, 3.412526, 0.6392157, 0, 1, 1,
0.7559206, 0.5072124, 0.3422405, 0.6431373, 0, 1, 1,
0.7592513, 1.08314, -0.668594, 0.6509804, 0, 1, 1,
0.760128, -0.660498, 1.465925, 0.654902, 0, 1, 1,
0.7684877, 1.498462, -1.07676, 0.6627451, 0, 1, 1,
0.7692071, 0.5717494, 2.058047, 0.6666667, 0, 1, 1,
0.7748014, -0.5988265, 1.582881, 0.6745098, 0, 1, 1,
0.7755209, -1.001836, 2.512357, 0.6784314, 0, 1, 1,
0.7857274, -0.352771, 0.2065816, 0.6862745, 0, 1, 1,
0.7862324, 0.8278973, 1.010888, 0.6901961, 0, 1, 1,
0.7898241, 0.4601924, 0.6494814, 0.6980392, 0, 1, 1,
0.7913777, -1.503092, 3.599231, 0.7058824, 0, 1, 1,
0.7977155, 2.616504, 0.8704239, 0.7098039, 0, 1, 1,
0.7985811, -0.9478922, 4.995161, 0.7176471, 0, 1, 1,
0.8053887, -0.693318, 2.540553, 0.7215686, 0, 1, 1,
0.8135851, 0.3652613, 2.131809, 0.7294118, 0, 1, 1,
0.8197303, -0.3347118, 1.536692, 0.7333333, 0, 1, 1,
0.8272543, -0.8629307, 1.834903, 0.7411765, 0, 1, 1,
0.8290267, 1.33202, 1.407209, 0.7450981, 0, 1, 1,
0.8360152, -0.892266, 3.344715, 0.7529412, 0, 1, 1,
0.8376219, -0.6655665, 1.239214, 0.7568628, 0, 1, 1,
0.8422285, -1.161555, 1.60241, 0.7647059, 0, 1, 1,
0.8424799, -1.364234, 1.110376, 0.7686275, 0, 1, 1,
0.8454138, 0.2661844, 0.08126579, 0.7764706, 0, 1, 1,
0.8522027, 0.1816157, 1.905964, 0.7803922, 0, 1, 1,
0.8528503, 0.3394898, 0.8756578, 0.7882353, 0, 1, 1,
0.853309, 1.353943, -0.1723527, 0.7921569, 0, 1, 1,
0.8535175, 1.118968, 2.269907, 0.8, 0, 1, 1,
0.8536702, 0.5927895, 1.37784, 0.8078431, 0, 1, 1,
0.8540403, -0.8743404, 2.608727, 0.8117647, 0, 1, 1,
0.8544008, 0.4487456, 2.440764, 0.8196079, 0, 1, 1,
0.857996, 0.06354031, 0.855914, 0.8235294, 0, 1, 1,
0.8583359, -0.627993, 0.07201088, 0.8313726, 0, 1, 1,
0.8595383, 0.09325888, 0.4250724, 0.8352941, 0, 1, 1,
0.8598966, -0.7128422, 1.405159, 0.8431373, 0, 1, 1,
0.8600197, -0.2244595, 3.349823, 0.8470588, 0, 1, 1,
0.8699473, 0.6190209, 0.6109843, 0.854902, 0, 1, 1,
0.8768428, 0.7279092, -0.2768462, 0.8588235, 0, 1, 1,
0.8939533, -0.8378909, 3.110145, 0.8666667, 0, 1, 1,
0.8966855, 0.1596684, -0.01046251, 0.8705882, 0, 1, 1,
0.8997439, 0.05330986, -0.2377826, 0.8784314, 0, 1, 1,
0.906364, 0.8746578, -1.367824, 0.8823529, 0, 1, 1,
0.9096892, 0.5363396, 0.4797421, 0.8901961, 0, 1, 1,
0.9107975, 1.179345, 0.4295782, 0.8941177, 0, 1, 1,
0.9112841, 0.08384246, 1.321894, 0.9019608, 0, 1, 1,
0.9140041, 0.1044697, 0.6780624, 0.9098039, 0, 1, 1,
0.9296198, -0.1589296, 1.920927, 0.9137255, 0, 1, 1,
0.9326828, 0.3007769, 1.02318, 0.9215686, 0, 1, 1,
0.9356328, -0.3007118, 2.143216, 0.9254902, 0, 1, 1,
0.9405291, 0.540946, 2.083135, 0.9333333, 0, 1, 1,
0.9412563, 0.8164648, -2.212124, 0.9372549, 0, 1, 1,
0.9430179, 0.1316662, 1.511137, 0.945098, 0, 1, 1,
0.9433666, 1.866353, -0.1423461, 0.9490196, 0, 1, 1,
0.9440132, 1.920568, 0.2235094, 0.9568627, 0, 1, 1,
0.9489166, 0.7396079, 1.011791, 0.9607843, 0, 1, 1,
0.9494819, 0.6763657, -0.2198563, 0.9686275, 0, 1, 1,
0.9524029, -1.288663, 2.758892, 0.972549, 0, 1, 1,
0.9567239, 1.543139, 1.368442, 0.9803922, 0, 1, 1,
0.9637411, 0.4295763, 1.046, 0.9843137, 0, 1, 1,
0.9708048, 0.351203, 1.792827, 0.9921569, 0, 1, 1,
0.9711242, -0.1032913, 1.10975, 0.9960784, 0, 1, 1,
0.9813334, -0.07677276, 0.5069792, 1, 0, 0.9960784, 1,
0.9818994, 0.08251517, 2.930876, 1, 0, 0.9882353, 1,
0.9966004, 0.1261711, -0.2764075, 1, 0, 0.9843137, 1,
0.9987352, 0.3086021, -0.6627811, 1, 0, 0.9764706, 1,
1.00283, -2.142203, 2.435452, 1, 0, 0.972549, 1,
1.016268, 0.5736918, 0.03464243, 1, 0, 0.9647059, 1,
1.019071, 2.062798, 1.311674, 1, 0, 0.9607843, 1,
1.021625, -0.1625517, 1.724291, 1, 0, 0.9529412, 1,
1.03183, 0.6269521, 0.2467624, 1, 0, 0.9490196, 1,
1.040589, -1.638938, 0.624755, 1, 0, 0.9411765, 1,
1.042151, -0.2610146, 1.35513, 1, 0, 0.9372549, 1,
1.042865, -0.4193353, 2.247255, 1, 0, 0.9294118, 1,
1.048375, -1.883492, 4.673769, 1, 0, 0.9254902, 1,
1.049436, 0.6183216, 0.4355266, 1, 0, 0.9176471, 1,
1.050995, -0.4743842, 1.327626, 1, 0, 0.9137255, 1,
1.056991, 2.049054, -0.238703, 1, 0, 0.9058824, 1,
1.060948, -1.338508, 0.470467, 1, 0, 0.9019608, 1,
1.063097, -1.288504, 4.329496, 1, 0, 0.8941177, 1,
1.067536, -0.4508252, 1.659718, 1, 0, 0.8862745, 1,
1.080582, -0.7349595, 3.174824, 1, 0, 0.8823529, 1,
1.082022, -0.7145948, 2.750631, 1, 0, 0.8745098, 1,
1.084886, -1.391146, 0.8305867, 1, 0, 0.8705882, 1,
1.089238, -1.871319, 4.584554, 1, 0, 0.8627451, 1,
1.095465, 1.988571, 0.3075075, 1, 0, 0.8588235, 1,
1.099712, -0.8580876, 1.640816, 1, 0, 0.8509804, 1,
1.100993, -0.3498771, 0.3412832, 1, 0, 0.8470588, 1,
1.108187, 2.199832, 1.552663, 1, 0, 0.8392157, 1,
1.11038, 0.6206799, 0.2264127, 1, 0, 0.8352941, 1,
1.115161, -0.2963474, 1.874582, 1, 0, 0.827451, 1,
1.11573, -6.853951e-05, -0.3754092, 1, 0, 0.8235294, 1,
1.115865, -0.1251021, 2.931957, 1, 0, 0.8156863, 1,
1.119771, 1.139068, 1.811987, 1, 0, 0.8117647, 1,
1.120486, -1.7788, 2.723846, 1, 0, 0.8039216, 1,
1.126959, 3.155174, -1.051547, 1, 0, 0.7960784, 1,
1.13042, 1.104853, 1.78406, 1, 0, 0.7921569, 1,
1.130635, -1.027284, 0.1591218, 1, 0, 0.7843137, 1,
1.136809, 0.06063612, 1.207161, 1, 0, 0.7803922, 1,
1.149686, 0.1786177, 2.008364, 1, 0, 0.772549, 1,
1.164145, 1.671035, -0.854681, 1, 0, 0.7686275, 1,
1.16586, -0.9180657, 2.822883, 1, 0, 0.7607843, 1,
1.172882, -1.18065, 2.699265, 1, 0, 0.7568628, 1,
1.17698, 0.821768, 1.079831, 1, 0, 0.7490196, 1,
1.178323, -1.282913, 1.240408, 1, 0, 0.7450981, 1,
1.180862, 0.5370326, 0.7761981, 1, 0, 0.7372549, 1,
1.190008, -0.1691394, 4.200894, 1, 0, 0.7333333, 1,
1.19971, -2.265849, 1.61938, 1, 0, 0.7254902, 1,
1.201388, -0.6800402, 1.741881, 1, 0, 0.7215686, 1,
1.202816, -1.23262, 3.475743, 1, 0, 0.7137255, 1,
1.202846, 0.0624414, 0.5940325, 1, 0, 0.7098039, 1,
1.218684, -1.932293, 1.703489, 1, 0, 0.7019608, 1,
1.219453, 0.2075006, 0.5832431, 1, 0, 0.6941177, 1,
1.22049, -0.704523, 0.9699014, 1, 0, 0.6901961, 1,
1.228153, 0.5564638, 2.270917, 1, 0, 0.682353, 1,
1.231085, 0.2125685, 1.664146, 1, 0, 0.6784314, 1,
1.231576, 0.8782165, 1.491768, 1, 0, 0.6705883, 1,
1.233241, 0.369374, 1.351526, 1, 0, 0.6666667, 1,
1.233474, 0.07795246, 2.265298, 1, 0, 0.6588235, 1,
1.255113, -2.93664, 0.6899822, 1, 0, 0.654902, 1,
1.255406, -0.4232856, 1.223563, 1, 0, 0.6470588, 1,
1.255866, 0.6960994, 2.411005, 1, 0, 0.6431373, 1,
1.259449, -0.001946158, 0.08103974, 1, 0, 0.6352941, 1,
1.268584, -0.3084754, 3.009099, 1, 0, 0.6313726, 1,
1.275133, 0.2962423, 1.432917, 1, 0, 0.6235294, 1,
1.276442, 1.571085, 0.02113662, 1, 0, 0.6196079, 1,
1.280467, 0.6411523, -0.5525606, 1, 0, 0.6117647, 1,
1.286381, 0.6653583, 3.157944, 1, 0, 0.6078432, 1,
1.286835, -1.70825, 3.916898, 1, 0, 0.6, 1,
1.300629, -0.6480116, 0.745379, 1, 0, 0.5921569, 1,
1.308685, 0.5420845, 1.445338, 1, 0, 0.5882353, 1,
1.329381, -0.592464, 2.5858, 1, 0, 0.5803922, 1,
1.333932, -0.9937127, 0.03696021, 1, 0, 0.5764706, 1,
1.339237, 0.01126836, 2.374878, 1, 0, 0.5686275, 1,
1.355871, -0.9335734, 2.94779, 1, 0, 0.5647059, 1,
1.35758, -0.1717595, 2.78546, 1, 0, 0.5568628, 1,
1.36254, -0.9233707, 3.099407, 1, 0, 0.5529412, 1,
1.371519, -0.3382204, 0.6561112, 1, 0, 0.5450981, 1,
1.37159, 0.7397586, 1.77986, 1, 0, 0.5411765, 1,
1.377339, -1.129712, 2.47432, 1, 0, 0.5333334, 1,
1.378374, -1.456653, 1.58681, 1, 0, 0.5294118, 1,
1.391659, 0.5440814, 0.05107408, 1, 0, 0.5215687, 1,
1.393146, -0.05365495, 3.575237, 1, 0, 0.5176471, 1,
1.398587, -0.4580188, 2.850312, 1, 0, 0.509804, 1,
1.399648, -0.5938671, 2.555448, 1, 0, 0.5058824, 1,
1.416487, -0.4133248, 2.603815, 1, 0, 0.4980392, 1,
1.425379, 0.184091, 1.809543, 1, 0, 0.4901961, 1,
1.429426, -0.239985, 1.035331, 1, 0, 0.4862745, 1,
1.432426, 0.2366872, 0.9040974, 1, 0, 0.4784314, 1,
1.440907, 0.3424489, 1.270932, 1, 0, 0.4745098, 1,
1.454061, -0.4445395, 2.552969, 1, 0, 0.4666667, 1,
1.456968, 0.1626042, -0.1291496, 1, 0, 0.4627451, 1,
1.457661, 1.351134, 0.9580226, 1, 0, 0.454902, 1,
1.473971, -2.086554, 0.4940214, 1, 0, 0.4509804, 1,
1.490722, -0.7919255, -0.05258287, 1, 0, 0.4431373, 1,
1.494157, -0.0239466, 1.535449, 1, 0, 0.4392157, 1,
1.495988, 2.181466, 1.338152, 1, 0, 0.4313726, 1,
1.529274, 2.730521, -1.676386, 1, 0, 0.427451, 1,
1.538334, 0.5793635, -0.1731671, 1, 0, 0.4196078, 1,
1.556525, -0.009909971, 1.987798, 1, 0, 0.4156863, 1,
1.563535, 0.764723, 2.177064, 1, 0, 0.4078431, 1,
1.565616, -2.372061, 3.985416, 1, 0, 0.4039216, 1,
1.571344, -0.6152524, 1.1506, 1, 0, 0.3960784, 1,
1.590531, -2.331105, 2.149174, 1, 0, 0.3882353, 1,
1.59176, 1.002842, 0.9401638, 1, 0, 0.3843137, 1,
1.604245, 0.8650361, 0.7070375, 1, 0, 0.3764706, 1,
1.604984, 0.9126483, 0.5331691, 1, 0, 0.372549, 1,
1.605861, 0.1258091, 0.1997502, 1, 0, 0.3647059, 1,
1.611317, 0.2692389, 0.4249847, 1, 0, 0.3607843, 1,
1.617652, 0.4404438, 0.8775112, 1, 0, 0.3529412, 1,
1.631355, 1.200444, 0.5658482, 1, 0, 0.3490196, 1,
1.63948, 0.7273888, 1.062138, 1, 0, 0.3411765, 1,
1.657233, -0.3604394, 1.437727, 1, 0, 0.3372549, 1,
1.659815, -0.2319105, 2.585273, 1, 0, 0.3294118, 1,
1.660242, -0.3148975, 2.956194, 1, 0, 0.3254902, 1,
1.676194, -1.097813, 3.986085, 1, 0, 0.3176471, 1,
1.676539, -0.5703182, 0.5178209, 1, 0, 0.3137255, 1,
1.676833, -0.4388306, 3.943882, 1, 0, 0.3058824, 1,
1.68253, -1.263246, 1.461046, 1, 0, 0.2980392, 1,
1.706424, -0.3078333, 1.493384, 1, 0, 0.2941177, 1,
1.721583, -0.8380529, 1.401146, 1, 0, 0.2862745, 1,
1.735385, -0.2558248, 2.213214, 1, 0, 0.282353, 1,
1.739627, 0.6156297, 1.267646, 1, 0, 0.2745098, 1,
1.752245, -0.5793728, 0.05715765, 1, 0, 0.2705882, 1,
1.767056, -2.321917, 1.911288, 1, 0, 0.2627451, 1,
1.775766, 1.64846, -0.34359, 1, 0, 0.2588235, 1,
1.784178, -2.246206, 1.961466, 1, 0, 0.2509804, 1,
1.796289, -0.7584335, 2.673164, 1, 0, 0.2470588, 1,
1.805404, -1.030174, 1.589458, 1, 0, 0.2392157, 1,
1.806788, -0.9064837, 2.031444, 1, 0, 0.2352941, 1,
1.810511, 0.1152686, 1.720369, 1, 0, 0.227451, 1,
1.816859, 0.7409914, 1.434258, 1, 0, 0.2235294, 1,
1.883036, -1.579701, 2.924585, 1, 0, 0.2156863, 1,
1.896145, 1.038241, 1.711023, 1, 0, 0.2117647, 1,
1.905573, -1.379061, 2.406346, 1, 0, 0.2039216, 1,
1.910998, 1.305902, 1.750565, 1, 0, 0.1960784, 1,
1.936754, -1.361963, 2.814741, 1, 0, 0.1921569, 1,
1.951815, -1.714872, 2.321082, 1, 0, 0.1843137, 1,
1.96116, -0.008975929, 1.674809, 1, 0, 0.1803922, 1,
1.980744, 1.051881, 1.7021, 1, 0, 0.172549, 1,
1.982146, 0.2842317, 1.001691, 1, 0, 0.1686275, 1,
2.000445, -1.249558, 2.368529, 1, 0, 0.1607843, 1,
2.047867, -0.9369328, 1.873252, 1, 0, 0.1568628, 1,
2.05149, -1.033259, 1.634663, 1, 0, 0.1490196, 1,
2.063382, -2.198645, 5.044518, 1, 0, 0.145098, 1,
2.064759, -0.7394908, 3.218709, 1, 0, 0.1372549, 1,
2.069834, -0.05496161, 0.6986476, 1, 0, 0.1333333, 1,
2.094709, 1.556805, 0.5826085, 1, 0, 0.1254902, 1,
2.118365, 0.1556749, -0.3160098, 1, 0, 0.1215686, 1,
2.121033, 0.06050805, 1.202379, 1, 0, 0.1137255, 1,
2.151728, 0.1553201, 0.9049237, 1, 0, 0.1098039, 1,
2.153016, 0.3489141, 1.213374, 1, 0, 0.1019608, 1,
2.15569, -0.3221337, 2.565741, 1, 0, 0.09411765, 1,
2.155976, 1.069429, 1.968327, 1, 0, 0.09019608, 1,
2.210285, 0.9560862, 1.344288, 1, 0, 0.08235294, 1,
2.225548, -0.8090481, 1.858527, 1, 0, 0.07843138, 1,
2.271293, 0.8152744, -0.4956544, 1, 0, 0.07058824, 1,
2.272406, 0.2333327, 1.951416, 1, 0, 0.06666667, 1,
2.386824, -0.6309835, 1.54764, 1, 0, 0.05882353, 1,
2.462897, 1.444948, 0.9001482, 1, 0, 0.05490196, 1,
2.494723, -0.6478038, 1.042167, 1, 0, 0.04705882, 1,
2.504693, -0.4403979, 1.538791, 1, 0, 0.04313726, 1,
2.54595, 1.232993, -0.6514575, 1, 0, 0.03529412, 1,
2.774205, 0.4333382, 0.2147208, 1, 0, 0.03137255, 1,
2.777309, 0.2966155, 1.677014, 1, 0, 0.02352941, 1,
2.950847, -0.484678, 0.3939105, 1, 0, 0.01960784, 1,
3.206219, 0.1527732, 2.203575, 1, 0, 0.01176471, 1,
3.256253, -0.1006743, 1.831657, 1, 0, 0.007843138, 1
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
0.2223459, -4.68854, -7.530906, 0, -0.5, 0.5, 0.5,
0.2223459, -4.68854, -7.530906, 1, -0.5, 0.5, 0.5,
0.2223459, -4.68854, -7.530906, 1, 1.5, 0.5, 0.5,
0.2223459, -4.68854, -7.530906, 0, 1.5, 0.5, 0.5
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
-3.840056, -0.1982739, -7.530906, 0, -0.5, 0.5, 0.5,
-3.840056, -0.1982739, -7.530906, 1, -0.5, 0.5, 0.5,
-3.840056, -0.1982739, -7.530906, 1, 1.5, 0.5, 0.5,
-3.840056, -0.1982739, -7.530906, 0, 1.5, 0.5, 0.5
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
-3.840056, -4.68854, -0.2409844, 0, -0.5, 0.5, 0.5,
-3.840056, -4.68854, -0.2409844, 1, -0.5, 0.5, 0.5,
-3.840056, -4.68854, -0.2409844, 1, 1.5, 0.5, 0.5,
-3.840056, -4.68854, -0.2409844, 0, 1.5, 0.5, 0.5
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
-2, -3.652325, -5.848617,
3, -3.652325, -5.848617,
-2, -3.652325, -5.848617,
-2, -3.825027, -6.128998,
-1, -3.652325, -5.848617,
-1, -3.825027, -6.128998,
0, -3.652325, -5.848617,
0, -3.825027, -6.128998,
1, -3.652325, -5.848617,
1, -3.825027, -6.128998,
2, -3.652325, -5.848617,
2, -3.825027, -6.128998,
3, -3.652325, -5.848617,
3, -3.825027, -6.128998
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
-2, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
-2, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
-2, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
-2, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5,
-1, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
-1, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
-1, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
-1, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5,
0, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
0, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
0, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
0, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5,
1, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
1, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
1, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
1, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5,
2, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
2, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
2, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
2, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5,
3, -4.170433, -6.689761, 0, -0.5, 0.5, 0.5,
3, -4.170433, -6.689761, 1, -0.5, 0.5, 0.5,
3, -4.170433, -6.689761, 1, 1.5, 0.5, 0.5,
3, -4.170433, -6.689761, 0, 1.5, 0.5, 0.5
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
-2.902579, -3, -5.848617,
-2.902579, 3, -5.848617,
-2.902579, -3, -5.848617,
-3.058825, -3, -6.128998,
-2.902579, -2, -5.848617,
-3.058825, -2, -6.128998,
-2.902579, -1, -5.848617,
-3.058825, -1, -6.128998,
-2.902579, 0, -5.848617,
-3.058825, 0, -6.128998,
-2.902579, 1, -5.848617,
-3.058825, 1, -6.128998,
-2.902579, 2, -5.848617,
-3.058825, 2, -6.128998,
-2.902579, 3, -5.848617,
-3.058825, 3, -6.128998
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
-3.371318, -3, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, -3, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, -3, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, -3, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, -2, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, -2, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, -2, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, -2, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, -1, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, -1, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, -1, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, -1, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, 0, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, 0, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, 0, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, 0, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, 1, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, 1, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, 1, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, 1, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, 2, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, 2, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, 2, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, 2, -6.689761, 0, 1.5, 0.5, 0.5,
-3.371318, 3, -6.689761, 0, -0.5, 0.5, 0.5,
-3.371318, 3, -6.689761, 1, -0.5, 0.5, 0.5,
-3.371318, 3, -6.689761, 1, 1.5, 0.5, 0.5,
-3.371318, 3, -6.689761, 0, 1.5, 0.5, 0.5
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
-2.902579, -3.652325, -4,
-2.902579, -3.652325, 4,
-2.902579, -3.652325, -4,
-3.058825, -3.825027, -4,
-2.902579, -3.652325, -2,
-3.058825, -3.825027, -2,
-2.902579, -3.652325, 0,
-3.058825, -3.825027, 0,
-2.902579, -3.652325, 2,
-3.058825, -3.825027, 2,
-2.902579, -3.652325, 4,
-3.058825, -3.825027, 4
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
-3.371318, -4.170433, -4, 0, -0.5, 0.5, 0.5,
-3.371318, -4.170433, -4, 1, -0.5, 0.5, 0.5,
-3.371318, -4.170433, -4, 1, 1.5, 0.5, 0.5,
-3.371318, -4.170433, -4, 0, 1.5, 0.5, 0.5,
-3.371318, -4.170433, -2, 0, -0.5, 0.5, 0.5,
-3.371318, -4.170433, -2, 1, -0.5, 0.5, 0.5,
-3.371318, -4.170433, -2, 1, 1.5, 0.5, 0.5,
-3.371318, -4.170433, -2, 0, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 0, 0, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 0, 1, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 0, 1, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 0, 0, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 2, 0, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 2, 1, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 2, 1, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 2, 0, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 4, 0, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 4, 1, -0.5, 0.5, 0.5,
-3.371318, -4.170433, 4, 1, 1.5, 0.5, 0.5,
-3.371318, -4.170433, 4, 0, 1.5, 0.5, 0.5
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
-2.902579, -3.652325, -5.848617,
-2.902579, 3.255777, -5.848617,
-2.902579, -3.652325, 5.366648,
-2.902579, 3.255777, 5.366648,
-2.902579, -3.652325, -5.848617,
-2.902579, -3.652325, 5.366648,
-2.902579, 3.255777, -5.848617,
-2.902579, 3.255777, 5.366648,
-2.902579, -3.652325, -5.848617,
3.347271, -3.652325, -5.848617,
-2.902579, -3.652325, 5.366648,
3.347271, -3.652325, 5.366648,
-2.902579, 3.255777, -5.848617,
3.347271, 3.255777, -5.848617,
-2.902579, 3.255777, 5.366648,
3.347271, 3.255777, 5.366648,
3.347271, -3.652325, -5.848617,
3.347271, 3.255777, -5.848617,
3.347271, -3.652325, 5.366648,
3.347271, 3.255777, 5.366648,
3.347271, -3.652325, -5.848617,
3.347271, -3.652325, 5.366648,
3.347271, 3.255777, -5.848617,
3.347271, 3.255777, 5.366648
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
var radius = 7.785222;
var distance = 34.63733;
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
mvMatrix.translate( -0.2223459, 0.1982739, 0.2409844 );
mvMatrix.scale( 1.346838, 1.218502, 0.7505426 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63733);
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
picloram<-read.table("picloram.xyz")
```

```
## Error in read.table("picloram.xyz"): no lines available in input
```

```r
x<-picloram$V2
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
```

```r
y<-picloram$V3
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
```

```r
z<-picloram$V4
```

```
## Error in eval(expr, envir, enclos): object 'picloram' not found
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
-2.811562, -1.816414, -2.62559, 0, 0, 1, 1, 1,
-2.727039, 0.2667094, -2.730563, 1, 0, 0, 1, 1,
-2.507886, -0.8782136, -4.416995, 1, 0, 0, 1, 1,
-2.480629, 0.1788306, -1.170416, 1, 0, 0, 1, 1,
-2.453415, -1.495496, -3.772957, 1, 0, 0, 1, 1,
-2.421504, -2.087746, -1.444013, 1, 0, 0, 1, 1,
-2.298014, -1.218958, -1.040569, 0, 0, 0, 1, 1,
-2.185547, 1.518142, -2.313607, 0, 0, 0, 1, 1,
-2.146567, -1.709848, -0.5104419, 0, 0, 0, 1, 1,
-2.131658, -0.6669223, -1.733646, 0, 0, 0, 1, 1,
-2.130311, -0.06393266, -0.8472004, 0, 0, 0, 1, 1,
-2.077471, -0.2444721, -1.898439, 0, 0, 0, 1, 1,
-2.061734, -0.8103991, -0.2864928, 0, 0, 0, 1, 1,
-2.054129, 1.198324, -2.198132, 1, 1, 1, 1, 1,
-2.05348, -0.4843317, -1.737729, 1, 1, 1, 1, 1,
-2.01931, -1.47667, -2.333186, 1, 1, 1, 1, 1,
-1.999221, -0.888271, 1.098894, 1, 1, 1, 1, 1,
-1.99085, 1.197459, -1.662169, 1, 1, 1, 1, 1,
-1.978647, 0.2182026, -1.965533, 1, 1, 1, 1, 1,
-1.954846, 1.44709, -0.3152995, 1, 1, 1, 1, 1,
-1.932499, -1.06541, -0.4841045, 1, 1, 1, 1, 1,
-1.90348, -0.2035916, -0.6874668, 1, 1, 1, 1, 1,
-1.902291, 0.698359, -1.136152, 1, 1, 1, 1, 1,
-1.858045, -0.2829312, -2.038266, 1, 1, 1, 1, 1,
-1.854528, 1.84178, -0.46462, 1, 1, 1, 1, 1,
-1.851826, 0.584008, -1.120483, 1, 1, 1, 1, 1,
-1.825606, 3.009402, 0.6571506, 1, 1, 1, 1, 1,
-1.823397, -0.1306006, -1.827032, 1, 1, 1, 1, 1,
-1.816113, 0.5550735, -1.490286, 0, 0, 1, 1, 1,
-1.798787, -0.007369179, -1.999452, 1, 0, 0, 1, 1,
-1.788987, 1.114802, -0.8503529, 1, 0, 0, 1, 1,
-1.787531, 0.6422659, -0.1272327, 1, 0, 0, 1, 1,
-1.776091, -0.8511232, -3.232743, 1, 0, 0, 1, 1,
-1.772115, -0.3949759, -0.4130216, 1, 0, 0, 1, 1,
-1.765775, -0.8374045, -1.857755, 0, 0, 0, 1, 1,
-1.759694, 0.1636129, -0.2594618, 0, 0, 0, 1, 1,
-1.728101, -0.8048813, -1.877701, 0, 0, 0, 1, 1,
-1.705456, -0.9023653, -2.535572, 0, 0, 0, 1, 1,
-1.703506, -0.1574822, -1.487064, 0, 0, 0, 1, 1,
-1.674911, 0.9275921, 0.8856454, 0, 0, 0, 1, 1,
-1.669526, 0.1013271, -1.946445, 0, 0, 0, 1, 1,
-1.668528, -0.79403, -1.142544, 1, 1, 1, 1, 1,
-1.658013, -0.9691691, -2.177161, 1, 1, 1, 1, 1,
-1.644111, 0.2242233, -2.151486, 1, 1, 1, 1, 1,
-1.640666, 1.263892, -2.278929, 1, 1, 1, 1, 1,
-1.604697, 0.4487208, -2.724383, 1, 1, 1, 1, 1,
-1.598975, -0.9143392, -3.686579, 1, 1, 1, 1, 1,
-1.590123, -0.2374438, -2.228406, 1, 1, 1, 1, 1,
-1.58256, -0.8331663, -2.81054, 1, 1, 1, 1, 1,
-1.544036, 2.917222, -0.30803, 1, 1, 1, 1, 1,
-1.525631, 0.5763417, -4.141012, 1, 1, 1, 1, 1,
-1.515397, -0.1313451, -1.886657, 1, 1, 1, 1, 1,
-1.512086, -0.317874, -3.006623, 1, 1, 1, 1, 1,
-1.50579, 0.4265572, 0.1908641, 1, 1, 1, 1, 1,
-1.49771, -1.817964, -2.446635, 1, 1, 1, 1, 1,
-1.496653, -0.1679157, -2.0675, 1, 1, 1, 1, 1,
-1.455888, -0.9319871, -0.4599085, 0, 0, 1, 1, 1,
-1.443698, -2.695861, -3.621315, 1, 0, 0, 1, 1,
-1.443012, 1.45181, -1.225452, 1, 0, 0, 1, 1,
-1.439889, -1.458794, -3.297704, 1, 0, 0, 1, 1,
-1.436643, -1.654297, -2.710536, 1, 0, 0, 1, 1,
-1.430701, 0.4911739, -1.720735, 1, 0, 0, 1, 1,
-1.406258, -2.092808, -2.188585, 0, 0, 0, 1, 1,
-1.398275, -1.456008, -1.4524, 0, 0, 0, 1, 1,
-1.397936, -3.551722, -4.981049, 0, 0, 0, 1, 1,
-1.379682, -1.696339, -3.164033, 0, 0, 0, 1, 1,
-1.371933, 0.2522897, -1.911286, 0, 0, 0, 1, 1,
-1.368091, -1.57111, -1.730062, 0, 0, 0, 1, 1,
-1.359827, 1.430486, -1.746592, 0, 0, 0, 1, 1,
-1.354427, 0.8201238, -1.312254, 1, 1, 1, 1, 1,
-1.343813, -0.6082591, -0.94625, 1, 1, 1, 1, 1,
-1.342495, 0.4289772, -0.8462294, 1, 1, 1, 1, 1,
-1.342178, 0.2753798, -1.92891, 1, 1, 1, 1, 1,
-1.330336, 1.240689, 0.9975204, 1, 1, 1, 1, 1,
-1.329605, 0.2534644, -2.293196, 1, 1, 1, 1, 1,
-1.310933, -1.996928, -0.73765, 1, 1, 1, 1, 1,
-1.310767, 0.8965293, -2.22769, 1, 1, 1, 1, 1,
-1.309358, -0.7747685, -0.7935431, 1, 1, 1, 1, 1,
-1.302651, 1.779886, 0.05755265, 1, 1, 1, 1, 1,
-1.289536, 0.4660415, -0.3014558, 1, 1, 1, 1, 1,
-1.289515, 1.791785, -0.8179893, 1, 1, 1, 1, 1,
-1.278983, -1.171313, -2.06369, 1, 1, 1, 1, 1,
-1.272003, -0.5723474, -2.694686, 1, 1, 1, 1, 1,
-1.270739, -0.6270928, -1.836776, 1, 1, 1, 1, 1,
-1.270583, -1.085264, -2.964699, 0, 0, 1, 1, 1,
-1.261572, -0.1949024, -3.029659, 1, 0, 0, 1, 1,
-1.257906, 1.054073, -0.5225433, 1, 0, 0, 1, 1,
-1.256881, -2.273231, -3.317945, 1, 0, 0, 1, 1,
-1.253713, -0.549141, -0.9986007, 1, 0, 0, 1, 1,
-1.249256, -0.1146797, -0.2705938, 1, 0, 0, 1, 1,
-1.241178, 1.365248, -0.9112747, 0, 0, 0, 1, 1,
-1.239758, 1.163962, -0.08295555, 0, 0, 0, 1, 1,
-1.23515, 0.3913712, -1.12567, 0, 0, 0, 1, 1,
-1.233982, 0.5108237, -0.8102596, 0, 0, 0, 1, 1,
-1.229606, -0.7083036, -1.641494, 0, 0, 0, 1, 1,
-1.228436, 0.1581189, -0.4506843, 0, 0, 0, 1, 1,
-1.222783, 1.311285, -0.991601, 0, 0, 0, 1, 1,
-1.219771, -1.873885, -2.234514, 1, 1, 1, 1, 1,
-1.215006, 0.5823772, 0.6495782, 1, 1, 1, 1, 1,
-1.215, 1.37359, -0.9923199, 1, 1, 1, 1, 1,
-1.208528, -0.3129256, -2.22546, 1, 1, 1, 1, 1,
-1.186192, 0.4335432, -2.473528, 1, 1, 1, 1, 1,
-1.180266, -0.5757654, -0.8343934, 1, 1, 1, 1, 1,
-1.175166, 0.5145457, -2.768043, 1, 1, 1, 1, 1,
-1.169533, 0.9360813, -2.545899, 1, 1, 1, 1, 1,
-1.169127, -0.08281478, -2.158776, 1, 1, 1, 1, 1,
-1.166473, -1.219694, -2.040187, 1, 1, 1, 1, 1,
-1.165522, -0.2280329, -2.364878, 1, 1, 1, 1, 1,
-1.157264, 0.3778064, 0.8389136, 1, 1, 1, 1, 1,
-1.145202, -1.401095, -2.442555, 1, 1, 1, 1, 1,
-1.13409, 0.8443955, -0.5243046, 1, 1, 1, 1, 1,
-1.125872, 0.3783329, -0.5540619, 1, 1, 1, 1, 1,
-1.125512, -0.4585052, -2.541261, 0, 0, 1, 1, 1,
-1.1233, -1.689279, -1.40012, 1, 0, 0, 1, 1,
-1.123205, 0.5236723, -0.5793977, 1, 0, 0, 1, 1,
-1.118284, -0.5651513, -3.031515, 1, 0, 0, 1, 1,
-1.115762, 1.410631, -0.003043825, 1, 0, 0, 1, 1,
-1.11148, 0.7794885, -1.131278, 1, 0, 0, 1, 1,
-1.108151, -0.1807149, 0.2367111, 0, 0, 0, 1, 1,
-1.09757, 0.3389053, -1.121465, 0, 0, 0, 1, 1,
-1.079967, -1.712356, -2.665703, 0, 0, 0, 1, 1,
-1.076949, 0.514923, -1.366776, 0, 0, 0, 1, 1,
-1.074823, 0.8164248, -1.825415, 0, 0, 0, 1, 1,
-1.068248, 0.3878886, -1.645749, 0, 0, 0, 1, 1,
-1.067272, 0.5841206, -0.6940565, 0, 0, 0, 1, 1,
-1.058262, 0.6689571, -0.3078814, 1, 1, 1, 1, 1,
-1.057072, 1.054965, -0.2722244, 1, 1, 1, 1, 1,
-1.055585, 0.8656883, -1.251284, 1, 1, 1, 1, 1,
-1.054773, 0.1521683, -0.5682764, 1, 1, 1, 1, 1,
-1.052598, 0.1986169, -0.6561449, 1, 1, 1, 1, 1,
-1.052038, 2.76843, -1.240385, 1, 1, 1, 1, 1,
-1.049242, -1.673474, -3.502268, 1, 1, 1, 1, 1,
-1.048658, -0.2634647, -2.067419, 1, 1, 1, 1, 1,
-1.048256, -0.134048, -1.529454, 1, 1, 1, 1, 1,
-1.047513, -1.839209, -3.165974, 1, 1, 1, 1, 1,
-1.043089, 0.2798246, -1.632354, 1, 1, 1, 1, 1,
-1.04195, 0.187428, -0.7782303, 1, 1, 1, 1, 1,
-1.041185, 0.3381535, -1.627144, 1, 1, 1, 1, 1,
-1.03443, -1.399896, -2.53415, 1, 1, 1, 1, 1,
-1.027884, -1.104306, -0.7964665, 1, 1, 1, 1, 1,
-1.022337, 1.110363, -0.2630941, 0, 0, 1, 1, 1,
-1.013238, -0.7392939, -2.449513, 1, 0, 0, 1, 1,
-1.012222, -1.132025, -1.519266, 1, 0, 0, 1, 1,
-1.011135, 0.1963275, -1.54013, 1, 0, 0, 1, 1,
-1.002181, -1.185829, -3.167283, 1, 0, 0, 1, 1,
-0.9986909, 0.09808122, 0.1835579, 1, 0, 0, 1, 1,
-0.9942084, -0.04805536, -2.28389, 0, 0, 0, 1, 1,
-0.9933808, 0.004738693, -0.689142, 0, 0, 0, 1, 1,
-0.9900527, -0.9624086, -1.097832, 0, 0, 0, 1, 1,
-0.9887909, -0.6102853, -1.375233, 0, 0, 0, 1, 1,
-0.9868492, 0.4493093, 0.6867907, 0, 0, 0, 1, 1,
-0.9858896, -1.431201, -3.774345, 0, 0, 0, 1, 1,
-0.9827294, -0.9839373, -1.664528, 0, 0, 0, 1, 1,
-0.9804786, -0.6907648, -1.975683, 1, 1, 1, 1, 1,
-0.9695235, 0.01960574, -1.819333, 1, 1, 1, 1, 1,
-0.9679728, 0.4371648, -0.8198434, 1, 1, 1, 1, 1,
-0.9541225, 0.9433708, -0.702225, 1, 1, 1, 1, 1,
-0.9538206, 0.1699938, -1.481758, 1, 1, 1, 1, 1,
-0.9530746, -0.7982644, -1.686059, 1, 1, 1, 1, 1,
-0.947504, -1.243635, -4.068489, 1, 1, 1, 1, 1,
-0.9431454, -0.03002725, -1.51518, 1, 1, 1, 1, 1,
-0.941186, 0.1688069, -2.672932, 1, 1, 1, 1, 1,
-0.9321435, 1.224187, 0.3820023, 1, 1, 1, 1, 1,
-0.9296893, 2.394317, -2.378211, 1, 1, 1, 1, 1,
-0.9263034, 0.752897, -1.716746, 1, 1, 1, 1, 1,
-0.9131939, 0.20845, -4.312167, 1, 1, 1, 1, 1,
-0.902101, 0.8765602, 0.1181984, 1, 1, 1, 1, 1,
-0.8991359, -0.01224422, -1.514254, 1, 1, 1, 1, 1,
-0.8959727, -0.5724704, -3.89846, 0, 0, 1, 1, 1,
-0.8869356, -0.2626552, -1.292651, 1, 0, 0, 1, 1,
-0.8848868, -0.8625976, -1.557192, 1, 0, 0, 1, 1,
-0.8756958, 0.1198821, 0.4816159, 1, 0, 0, 1, 1,
-0.8745282, -1.001357, -2.173464, 1, 0, 0, 1, 1,
-0.868686, 0.2576791, -1.45714, 1, 0, 0, 1, 1,
-0.8675014, -1.228999, -0.8154351, 0, 0, 0, 1, 1,
-0.8639665, 0.3574049, -1.141728, 0, 0, 0, 1, 1,
-0.8624207, -1.034879, -2.465477, 0, 0, 0, 1, 1,
-0.8622804, 0.3434277, -0.7062805, 0, 0, 0, 1, 1,
-0.8607188, 1.112343, -0.7877848, 0, 0, 0, 1, 1,
-0.858729, 0.1461566, -1.555556, 0, 0, 0, 1, 1,
-0.8578302, -1.908809, -3.922482, 0, 0, 0, 1, 1,
-0.8537027, -0.4079881, -0.8992072, 1, 1, 1, 1, 1,
-0.8450481, -0.3901956, -2.113242, 1, 1, 1, 1, 1,
-0.8441283, 0.3308886, -1.266694, 1, 1, 1, 1, 1,
-0.8431458, -1.44389, -2.65362, 1, 1, 1, 1, 1,
-0.8326528, 0.1577512, 0.3481579, 1, 1, 1, 1, 1,
-0.8298985, 0.05376337, -0.5891888, 1, 1, 1, 1, 1,
-0.8250025, 1.459467, -1.978859, 1, 1, 1, 1, 1,
-0.8224347, 0.2326926, -0.9332708, 1, 1, 1, 1, 1,
-0.8211699, -1.734324, -1.986285, 1, 1, 1, 1, 1,
-0.8180499, -1.148112, -1.55744, 1, 1, 1, 1, 1,
-0.8084223, -0.9919676, -2.675732, 1, 1, 1, 1, 1,
-0.8081056, 0.104339, -2.293715, 1, 1, 1, 1, 1,
-0.8062347, 2.434587, -0.192819, 1, 1, 1, 1, 1,
-0.8029867, 0.2450568, -0.8946205, 1, 1, 1, 1, 1,
-0.8013065, -1.102069, -3.137356, 1, 1, 1, 1, 1,
-0.8011613, -0.5006039, -1.693986, 0, 0, 1, 1, 1,
-0.8003385, -1.203514, -3.463952, 1, 0, 0, 1, 1,
-0.7990639, 0.4345879, -1.768429, 1, 0, 0, 1, 1,
-0.7961798, -1.553815, -2.680718, 1, 0, 0, 1, 1,
-0.7939704, 0.07331458, -0.9089495, 1, 0, 0, 1, 1,
-0.7939541, -1.124182, -3.228827, 1, 0, 0, 1, 1,
-0.7895311, -0.3580001, -3.851004, 0, 0, 0, 1, 1,
-0.7880899, -0.6675632, -2.695331, 0, 0, 0, 1, 1,
-0.787652, -0.05513456, -1.53963, 0, 0, 0, 1, 1,
-0.7851071, -0.7263429, -3.019568, 0, 0, 0, 1, 1,
-0.7839024, 0.6074795, -1.82748, 0, 0, 0, 1, 1,
-0.779328, -0.6936396, -2.41508, 0, 0, 0, 1, 1,
-0.7756175, -1.080831, -1.596362, 0, 0, 0, 1, 1,
-0.7735474, -1.009088, -1.108129, 1, 1, 1, 1, 1,
-0.7700623, 0.860276, -0.5539441, 1, 1, 1, 1, 1,
-0.7630718, -0.3334345, -3.228931, 1, 1, 1, 1, 1,
-0.7601264, 0.7785551, -0.3956435, 1, 1, 1, 1, 1,
-0.7582852, 0.3589352, -0.124079, 1, 1, 1, 1, 1,
-0.753867, 1.119245, -1.245728, 1, 1, 1, 1, 1,
-0.7525548, -1.089463, -1.938207, 1, 1, 1, 1, 1,
-0.7461295, -0.3116391, -2.02268, 1, 1, 1, 1, 1,
-0.7438459, -0.7402958, -1.708457, 1, 1, 1, 1, 1,
-0.7433309, -0.04659263, -1.675836, 1, 1, 1, 1, 1,
-0.7410101, 2.136727, -0.4047582, 1, 1, 1, 1, 1,
-0.7408891, 2.006288, -0.1017094, 1, 1, 1, 1, 1,
-0.729557, -0.7249506, -3.484785, 1, 1, 1, 1, 1,
-0.7247935, -0.3323534, -1.597583, 1, 1, 1, 1, 1,
-0.7197232, -1.904281, -2.585505, 1, 1, 1, 1, 1,
-0.7112524, 1.080513, -0.487758, 0, 0, 1, 1, 1,
-0.7068172, -0.2486576, -1.400301, 1, 0, 0, 1, 1,
-0.7032473, -0.241572, -2.417695, 1, 0, 0, 1, 1,
-0.7027749, -0.2359124, -2.678916, 1, 0, 0, 1, 1,
-0.7025666, 0.7399043, -0.7552478, 1, 0, 0, 1, 1,
-0.6982411, 1.540659, 0.7570162, 1, 0, 0, 1, 1,
-0.6936651, 0.5401685, -0.6563796, 0, 0, 0, 1, 1,
-0.6901026, -2.591281, -3.09653, 0, 0, 0, 1, 1,
-0.685961, -1.89119, -3.261637, 0, 0, 0, 1, 1,
-0.6832426, -0.3038991, -2.952015, 0, 0, 0, 1, 1,
-0.6781868, 0.1046092, -2.161997, 0, 0, 0, 1, 1,
-0.6751586, -1.409558, -2.613713, 0, 0, 0, 1, 1,
-0.6738719, -0.3894003, -2.588686, 0, 0, 0, 1, 1,
-0.671896, -0.4182917, -2.969957, 1, 1, 1, 1, 1,
-0.6711347, -0.6634717, -2.019874, 1, 1, 1, 1, 1,
-0.670308, 0.3881643, 0.2145611, 1, 1, 1, 1, 1,
-0.669299, -0.04517454, -1.410099, 1, 1, 1, 1, 1,
-0.668527, 0.1013902, -1.888666, 1, 1, 1, 1, 1,
-0.6607441, 0.429607, -0.6111665, 1, 1, 1, 1, 1,
-0.6595662, -1.010857, -4.115188, 1, 1, 1, 1, 1,
-0.6591946, 0.4132914, 0.7798994, 1, 1, 1, 1, 1,
-0.6588976, 0.555912, 1.025457, 1, 1, 1, 1, 1,
-0.6584284, 0.6561546, -0.6937187, 1, 1, 1, 1, 1,
-0.6553794, 0.2937041, -2.781729, 1, 1, 1, 1, 1,
-0.6548496, 0.4845721, -2.645371, 1, 1, 1, 1, 1,
-0.6544546, -1.471062, -2.621308, 1, 1, 1, 1, 1,
-0.6525618, -0.3968808, -1.282907, 1, 1, 1, 1, 1,
-0.6513683, -0.2753573, -1.697804, 1, 1, 1, 1, 1,
-0.6509956, 0.09691679, -2.434674, 0, 0, 1, 1, 1,
-0.6470282, 0.5622659, 0.06219515, 1, 0, 0, 1, 1,
-0.6439607, -1.342922, -2.383187, 1, 0, 0, 1, 1,
-0.6429396, 0.1017422, -1.897747, 1, 0, 0, 1, 1,
-0.6409882, 0.4565854, -1.003245, 1, 0, 0, 1, 1,
-0.6399198, -0.9721639, -2.48092, 1, 0, 0, 1, 1,
-0.6392401, -0.8510911, -3.019726, 0, 0, 0, 1, 1,
-0.637529, -1.200268, -2.655104, 0, 0, 0, 1, 1,
-0.6340502, 1.631516, -0.1863854, 0, 0, 0, 1, 1,
-0.6302248, 0.2815238, -1.557719, 0, 0, 0, 1, 1,
-0.6261909, 1.446139, -0.6651531, 0, 0, 0, 1, 1,
-0.6254472, 0.1357909, 0.4189947, 0, 0, 0, 1, 1,
-0.6235136, -1.430421, -4.779457, 0, 0, 0, 1, 1,
-0.6227148, -1.414138, -2.376593, 1, 1, 1, 1, 1,
-0.6212627, 2.370764, -1.916765, 1, 1, 1, 1, 1,
-0.6162509, 0.293562, -0.3333524, 1, 1, 1, 1, 1,
-0.6102214, 2.19439, -0.5242327, 1, 1, 1, 1, 1,
-0.607451, 0.2893244, -0.1922147, 1, 1, 1, 1, 1,
-0.6047869, -0.3815566, -3.681005, 1, 1, 1, 1, 1,
-0.6000968, 0.727805, -2.5582, 1, 1, 1, 1, 1,
-0.5988361, 0.8170828, -1.056909, 1, 1, 1, 1, 1,
-0.5950872, 0.4253241, -1.667085, 1, 1, 1, 1, 1,
-0.5932983, -0.245464, -1.136966, 1, 1, 1, 1, 1,
-0.5928088, 1.037439, 0.7573236, 1, 1, 1, 1, 1,
-0.5922318, -1.086001, -0.8611585, 1, 1, 1, 1, 1,
-0.5920264, 0.2291091, -2.088978, 1, 1, 1, 1, 1,
-0.5917588, 1.237181, -1.129104, 1, 1, 1, 1, 1,
-0.5917263, 0.0001337831, -2.90995, 1, 1, 1, 1, 1,
-0.5840836, 1.675736, 1.497197, 0, 0, 1, 1, 1,
-0.5817258, 0.02657179, -2.080238, 1, 0, 0, 1, 1,
-0.5791446, 0.5376099, -0.7222005, 1, 0, 0, 1, 1,
-0.5778847, 0.2389043, -1.581954, 1, 0, 0, 1, 1,
-0.5772876, -0.3032236, -2.572617, 1, 0, 0, 1, 1,
-0.5734678, 0.7782645, -1.183713, 1, 0, 0, 1, 1,
-0.5729097, 1.193674, -0.6981726, 0, 0, 0, 1, 1,
-0.5654113, -0.003857134, -1.211119, 0, 0, 0, 1, 1,
-0.5637499, 0.2668705, -0.7078231, 0, 0, 0, 1, 1,
-0.5618523, -0.793331, -2.92723, 0, 0, 0, 1, 1,
-0.5534099, -0.885092, -3.789687, 0, 0, 0, 1, 1,
-0.5510599, -0.6267762, -4.259774, 0, 0, 0, 1, 1,
-0.5479293, 0.2564408, -0.687381, 0, 0, 0, 1, 1,
-0.5441081, -1.270643, -3.130265, 1, 1, 1, 1, 1,
-0.5392051, 0.3488602, -1.321022, 1, 1, 1, 1, 1,
-0.5309477, -0.8429893, -3.938655, 1, 1, 1, 1, 1,
-0.5293367, 1.04894, 0.6924411, 1, 1, 1, 1, 1,
-0.5253718, 1.367563, -1.366663, 1, 1, 1, 1, 1,
-0.5229393, -1.139117, -2.044187, 1, 1, 1, 1, 1,
-0.5216403, -0.7134691, -0.761395, 1, 1, 1, 1, 1,
-0.5173369, -1.82904, -5.482779, 1, 1, 1, 1, 1,
-0.5157813, -0.585084, -3.843226, 1, 1, 1, 1, 1,
-0.5109835, -0.121613, -1.106125, 1, 1, 1, 1, 1,
-0.5107116, -0.7781628, -3.011218, 1, 1, 1, 1, 1,
-0.5087194, 0.2368934, -1.404884, 1, 1, 1, 1, 1,
-0.5085434, -1.33694, -2.601616, 1, 1, 1, 1, 1,
-0.5064533, -0.4610493, -3.23218, 1, 1, 1, 1, 1,
-0.5043076, -0.8142475, -2.408456, 1, 1, 1, 1, 1,
-0.5000621, 0.8738602, -0.5686634, 0, 0, 1, 1, 1,
-0.4877463, 0.3968195, -0.3350269, 1, 0, 0, 1, 1,
-0.4870924, -0.3139709, -5.685287, 1, 0, 0, 1, 1,
-0.4861453, -1.002673, -2.684726, 1, 0, 0, 1, 1,
-0.4834301, -0.3607735, -3.259166, 1, 0, 0, 1, 1,
-0.4824306, -0.02364971, -1.802245, 1, 0, 0, 1, 1,
-0.4805613, 1.542551, -0.2808143, 0, 0, 0, 1, 1,
-0.4801366, -0.2788759, -3.123119, 0, 0, 0, 1, 1,
-0.479368, 2.601866, -2.643022, 0, 0, 0, 1, 1,
-0.4791452, -0.7867288, -3.24009, 0, 0, 0, 1, 1,
-0.475837, 1.256491, -1.712342, 0, 0, 0, 1, 1,
-0.4656205, 0.3158053, -1.252211, 0, 0, 0, 1, 1,
-0.4614407, -1.256458, -2.163422, 0, 0, 0, 1, 1,
-0.4601013, -0.3839756, -2.098302, 1, 1, 1, 1, 1,
-0.4587324, -1.085761, -3.325039, 1, 1, 1, 1, 1,
-0.4581894, -0.4108627, -3.392199, 1, 1, 1, 1, 1,
-0.4545221, 1.617536, -1.280403, 1, 1, 1, 1, 1,
-0.4527762, 1.076997, -0.02814961, 1, 1, 1, 1, 1,
-0.451676, -0.8988257, -3.132572, 1, 1, 1, 1, 1,
-0.4472426, 0.9963543, 1.640437, 1, 1, 1, 1, 1,
-0.4440822, 0.7469517, 0.4728125, 1, 1, 1, 1, 1,
-0.4385501, -0.6064476, -3.327967, 1, 1, 1, 1, 1,
-0.4327097, -0.9806429, -3.906616, 1, 1, 1, 1, 1,
-0.429506, -0.01884309, -1.878674, 1, 1, 1, 1, 1,
-0.4282069, -0.3670886, -2.308431, 1, 1, 1, 1, 1,
-0.4275181, -0.2464371, -3.472255, 1, 1, 1, 1, 1,
-0.4247853, 1.103871, -2.395571, 1, 1, 1, 1, 1,
-0.4246931, -0.5520275, -3.329783, 1, 1, 1, 1, 1,
-0.4209552, 0.04769488, -2.734271, 0, 0, 1, 1, 1,
-0.41427, -0.1552697, -0.9682188, 1, 0, 0, 1, 1,
-0.4066878, 0.1916585, -0.83937, 1, 0, 0, 1, 1,
-0.4060192, 0.2407265, -0.8289852, 1, 0, 0, 1, 1,
-0.4001319, 0.5648754, -0.9919098, 1, 0, 0, 1, 1,
-0.3963633, 0.6736386, 2.04525, 1, 0, 0, 1, 1,
-0.3886819, 0.6550411, -0.2811225, 0, 0, 0, 1, 1,
-0.3823048, -1.69365, -4.28553, 0, 0, 0, 1, 1,
-0.3812321, 0.3744594, 0.7467498, 0, 0, 0, 1, 1,
-0.380747, -0.7323849, -2.291899, 0, 0, 0, 1, 1,
-0.3763909, 0.3469243, 0.2774261, 0, 0, 0, 1, 1,
-0.3705066, 0.3380809, -0.2914022, 0, 0, 0, 1, 1,
-0.3571982, -0.6234289, -3.145464, 0, 0, 0, 1, 1,
-0.3552336, 1.640931, -0.5470401, 1, 1, 1, 1, 1,
-0.351323, 1.849427, 0.3059902, 1, 1, 1, 1, 1,
-0.3512955, -1.532828, -2.926106, 1, 1, 1, 1, 1,
-0.3471993, -1.000926, -3.875513, 1, 1, 1, 1, 1,
-0.3427791, -0.7498449, -4.28123, 1, 1, 1, 1, 1,
-0.338546, 1.373206, -1.387253, 1, 1, 1, 1, 1,
-0.3355603, -1.558948, -1.794458, 1, 1, 1, 1, 1,
-0.3305608, 0.4756921, -0.539592, 1, 1, 1, 1, 1,
-0.3295726, 0.2341993, 0.7827104, 1, 1, 1, 1, 1,
-0.3238305, 1.314818, -0.1531286, 1, 1, 1, 1, 1,
-0.3196418, -1.040964, -2.616574, 1, 1, 1, 1, 1,
-0.3172755, -1.361083, -2.027885, 1, 1, 1, 1, 1,
-0.3135605, 1.747847, -0.8124036, 1, 1, 1, 1, 1,
-0.3130158, 1.450482, 0.3106982, 1, 1, 1, 1, 1,
-0.3091187, 0.08256543, -0.3372004, 1, 1, 1, 1, 1,
-0.3050241, -0.6371959, -2.918779, 0, 0, 1, 1, 1,
-0.3045913, 0.6331931, 0.7316317, 1, 0, 0, 1, 1,
-0.30287, -0.4405484, -2.532129, 1, 0, 0, 1, 1,
-0.3006333, 0.5019551, -1.20934, 1, 0, 0, 1, 1,
-0.2997654, 0.4571354, -1.602933, 1, 0, 0, 1, 1,
-0.288963, 0.6437294, -1.789271, 1, 0, 0, 1, 1,
-0.2867532, -0.7352298, -2.182306, 0, 0, 0, 1, 1,
-0.2839972, 0.2036339, -1.517836, 0, 0, 0, 1, 1,
-0.2839721, -0.4326518, -1.57582, 0, 0, 0, 1, 1,
-0.282902, -0.6141474, -3.85754, 0, 0, 0, 1, 1,
-0.2789025, 0.2304626, 0.3207352, 0, 0, 0, 1, 1,
-0.2782354, -0.38999, -3.438304, 0, 0, 0, 1, 1,
-0.2751145, -0.7701314, -2.772743, 0, 0, 0, 1, 1,
-0.2742213, 0.5200706, -0.3646664, 1, 1, 1, 1, 1,
-0.2733648, 0.6813446, 0.357057, 1, 1, 1, 1, 1,
-0.2710804, 0.7259462, 0.01066395, 1, 1, 1, 1, 1,
-0.2667744, 0.595979, -0.7976016, 1, 1, 1, 1, 1,
-0.2641889, -1.067532, -3.530089, 1, 1, 1, 1, 1,
-0.2619011, -2.177462, -1.347352, 1, 1, 1, 1, 1,
-0.2616475, -0.4145834, -1.814241, 1, 1, 1, 1, 1,
-0.2596786, -0.8025734, -3.851969, 1, 1, 1, 1, 1,
-0.259275, 1.445473, -0.9450353, 1, 1, 1, 1, 1,
-0.2588231, 0.006423652, -1.996959, 1, 1, 1, 1, 1,
-0.2584024, 1.314321, -0.8882852, 1, 1, 1, 1, 1,
-0.2562388, -0.6756478, -2.977298, 1, 1, 1, 1, 1,
-0.2560843, -0.6839516, -4.003885, 1, 1, 1, 1, 1,
-0.2483062, -0.2398023, -3.041538, 1, 1, 1, 1, 1,
-0.2477653, 1.385399, -1.503175, 1, 1, 1, 1, 1,
-0.2414455, -0.1363236, -2.48598, 0, 0, 1, 1, 1,
-0.2396227, 0.1194299, -2.127312, 1, 0, 0, 1, 1,
-0.2393199, -1.613433, -1.484186, 1, 0, 0, 1, 1,
-0.2370767, -1.672253, -2.510346, 1, 0, 0, 1, 1,
-0.233477, -0.7098561, -3.513411, 1, 0, 0, 1, 1,
-0.2320997, -1.385268, -2.759752, 1, 0, 0, 1, 1,
-0.2261975, 0.5360548, -0.291333, 0, 0, 0, 1, 1,
-0.2247212, -0.1545946, -3.701347, 0, 0, 0, 1, 1,
-0.2220767, -0.9421445, -3.27013, 0, 0, 0, 1, 1,
-0.2168306, 1.22064, -1.028544, 0, 0, 0, 1, 1,
-0.2167257, -1.313235, -3.527648, 0, 0, 0, 1, 1,
-0.2135772, 1.172695, -1.090963, 0, 0, 0, 1, 1,
-0.2133072, 0.2887413, -2.120565, 0, 0, 0, 1, 1,
-0.2122423, 0.3217617, -1.25318, 1, 1, 1, 1, 1,
-0.2076489, 1.012977, 1.907919, 1, 1, 1, 1, 1,
-0.2072082, 0.4843671, -2.116076, 1, 1, 1, 1, 1,
-0.2042548, -0.2747169, -3.363233, 1, 1, 1, 1, 1,
-0.2010804, 1.487174, 1.088981, 1, 1, 1, 1, 1,
-0.1995491, -1.524336, -2.151731, 1, 1, 1, 1, 1,
-0.1991279, 1.468654, -1.000592, 1, 1, 1, 1, 1,
-0.1985083, 0.8070704, -0.06679665, 1, 1, 1, 1, 1,
-0.1977333, -0.6074484, -3.619122, 1, 1, 1, 1, 1,
-0.1956627, 0.3774017, 1.27787, 1, 1, 1, 1, 1,
-0.1932345, -0.6629682, -2.193492, 1, 1, 1, 1, 1,
-0.1929222, 2.800731, 2.379024, 1, 1, 1, 1, 1,
-0.1924137, -1.461704, -3.897033, 1, 1, 1, 1, 1,
-0.1863484, 1.601657, 0.4171333, 1, 1, 1, 1, 1,
-0.1851901, -0.6394405, -1.843596, 1, 1, 1, 1, 1,
-0.1827201, -0.03641547, -1.950897, 0, 0, 1, 1, 1,
-0.1793915, 0.3166327, -1.729725, 1, 0, 0, 1, 1,
-0.1744714, -0.7206323, -2.513935, 1, 0, 0, 1, 1,
-0.1723477, -0.3069529, -2.997974, 1, 0, 0, 1, 1,
-0.1723256, -1.949262, -4.791044, 1, 0, 0, 1, 1,
-0.1722243, 0.6373752, -0.534715, 1, 0, 0, 1, 1,
-0.1685346, -0.5087991, -2.930203, 0, 0, 0, 1, 1,
-0.1664124, -1.451868, -4.085638, 0, 0, 0, 1, 1,
-0.1621822, 0.9419723, -0.8755052, 0, 0, 0, 1, 1,
-0.1586852, -0.298957, -3.720907, 0, 0, 0, 1, 1,
-0.1565538, -0.7258502, -3.725975, 0, 0, 0, 1, 1,
-0.1564885, 0.4879068, 0.6737868, 0, 0, 0, 1, 1,
-0.1542689, 1.382073, -1.047277, 0, 0, 0, 1, 1,
-0.1537694, 1.00729, 0.2697988, 1, 1, 1, 1, 1,
-0.1527992, -0.8024066, -3.183193, 1, 1, 1, 1, 1,
-0.1513371, 2.628263, -0.5269034, 1, 1, 1, 1, 1,
-0.1471377, 0.3440205, 0.8620635, 1, 1, 1, 1, 1,
-0.145818, 0.6645365, 0.4886573, 1, 1, 1, 1, 1,
-0.1441471, 0.3071059, 0.4472364, 1, 1, 1, 1, 1,
-0.140112, 0.05099895, -2.539315, 1, 1, 1, 1, 1,
-0.1394803, -0.03106304, -1.392363, 1, 1, 1, 1, 1,
-0.1392768, 0.4663482, 1.047082, 1, 1, 1, 1, 1,
-0.1371437, 0.1358957, 0.8414808, 1, 1, 1, 1, 1,
-0.1364937, -2.079677, -2.718796, 1, 1, 1, 1, 1,
-0.1358742, -0.5365399, -2.065801, 1, 1, 1, 1, 1,
-0.1285078, 0.008002285, -0.2268942, 1, 1, 1, 1, 1,
-0.1212847, 1.635298, 0.1720984, 1, 1, 1, 1, 1,
-0.1210259, -0.01363981, -0.6296647, 1, 1, 1, 1, 1,
-0.1200688, -2.25249, -3.563284, 0, 0, 1, 1, 1,
-0.1185418, -2.289372, -1.035669, 1, 0, 0, 1, 1,
-0.1126144, -1.223483, -3.752927, 1, 0, 0, 1, 1,
-0.1101, -0.7552592, -2.899726, 1, 0, 0, 1, 1,
-0.1096627, -1.60988, -3.612756, 1, 0, 0, 1, 1,
-0.1081627, 1.101751, -0.2031716, 1, 0, 0, 1, 1,
-0.1065658, 1.459095, 0.5688646, 0, 0, 0, 1, 1,
-0.1052231, -1.183541, -1.994163, 0, 0, 0, 1, 1,
-0.1040401, 2.020325, -1.080346, 0, 0, 0, 1, 1,
-0.1003539, -0.4407084, -2.562665, 0, 0, 0, 1, 1,
-0.09893534, 0.07719649, -1.421046, 0, 0, 0, 1, 1,
-0.09782536, 0.7534796, -2.233328, 0, 0, 0, 1, 1,
-0.09189311, 1.891714, 0.6798057, 0, 0, 0, 1, 1,
-0.08994491, 1.407799, -0.5018746, 1, 1, 1, 1, 1,
-0.08793207, 2.254424, 0.9935966, 1, 1, 1, 1, 1,
-0.08416995, 1.606324, -0.456744, 1, 1, 1, 1, 1,
-0.08370644, -0.703751, -3.406379, 1, 1, 1, 1, 1,
-0.08324968, -1.726131, -3.333338, 1, 1, 1, 1, 1,
-0.07593561, 1.638415, -0.250825, 1, 1, 1, 1, 1,
-0.07527075, 0.9110482, 0.1211227, 1, 1, 1, 1, 1,
-0.07252029, -0.9422043, -1.270153, 1, 1, 1, 1, 1,
-0.07079124, -0.1879595, -2.935183, 1, 1, 1, 1, 1,
-0.06936839, -0.2920375, -4.054385, 1, 1, 1, 1, 1,
-0.06788763, -1.177839, -2.702947, 1, 1, 1, 1, 1,
-0.06775632, 1.18531, 0.1606658, 1, 1, 1, 1, 1,
-0.06592532, -1.281358, -2.40648, 1, 1, 1, 1, 1,
-0.0644928, -0.6062599, -4.34163, 1, 1, 1, 1, 1,
-0.06343924, -0.50678, -2.995299, 1, 1, 1, 1, 1,
-0.06077333, 0.4291079, 2.280303, 0, 0, 1, 1, 1,
-0.05783162, 0.5595539, -1.429381, 1, 0, 0, 1, 1,
-0.05122392, 0.02333682, -1.332532, 1, 0, 0, 1, 1,
-0.05105063, 0.0386739, -1.274922, 1, 0, 0, 1, 1,
-0.04918748, 0.3191551, -0.2767606, 1, 0, 0, 1, 1,
-0.04655744, -0.5444742, -3.025675, 1, 0, 0, 1, 1,
-0.04119962, -0.5955378, -1.476707, 0, 0, 0, 1, 1,
-0.04069378, -0.5229777, -2.866534, 0, 0, 0, 1, 1,
-0.03822151, -0.7875904, -3.08417, 0, 0, 0, 1, 1,
-0.03725133, -0.4353477, -2.369977, 0, 0, 0, 1, 1,
-0.03571694, -0.2448177, -3.572425, 0, 0, 0, 1, 1,
-0.03369365, -0.5308878, -2.604715, 0, 0, 0, 1, 1,
-0.02946703, -0.2967241, -2.280259, 0, 0, 0, 1, 1,
-0.02945323, 0.3321545, 0.5577891, 1, 1, 1, 1, 1,
-0.02466817, 1.319283, -0.1121566, 1, 1, 1, 1, 1,
-0.02161753, 0.9923075, 0.9425352, 1, 1, 1, 1, 1,
-0.01879219, -0.790572, -2.949684, 1, 1, 1, 1, 1,
-0.01656762, 1.074816, -0.2156606, 1, 1, 1, 1, 1,
-0.0160624, 0.9245056, 0.20489, 1, 1, 1, 1, 1,
-0.008829291, 0.201903, 0.6913036, 1, 1, 1, 1, 1,
-0.007511325, 0.05051807, 0.06315702, 1, 1, 1, 1, 1,
-0.006990376, 1.442993, 1.100445, 1, 1, 1, 1, 1,
-0.004129512, -0.1644485, -4.365826, 1, 1, 1, 1, 1,
0.001275562, -0.06743428, 3.099025, 1, 1, 1, 1, 1,
0.001618598, 1.082573, -0.01917216, 1, 1, 1, 1, 1,
0.003046213, -0.3228655, 2.573061, 1, 1, 1, 1, 1,
0.003403709, -0.5625117, 3.425528, 1, 1, 1, 1, 1,
0.005746276, 0.6221972, 0.5201822, 1, 1, 1, 1, 1,
0.007287111, -0.7838352, 5.203319, 0, 0, 1, 1, 1,
0.009605029, 1.217747, 0.4853505, 1, 0, 0, 1, 1,
0.0103446, 0.1301087, -1.860465, 1, 0, 0, 1, 1,
0.01182208, 0.5950653, 0.4885189, 1, 0, 0, 1, 1,
0.01387511, 0.6379329, -0.6722602, 1, 0, 0, 1, 1,
0.01571871, 0.2315674, 0.3788767, 1, 0, 0, 1, 1,
0.01942379, -1.187696, 3.811201, 0, 0, 0, 1, 1,
0.02043567, 1.51951, -0.5644061, 0, 0, 0, 1, 1,
0.02155527, 0.2064061, 0.247294, 0, 0, 0, 1, 1,
0.02438791, -0.01836201, 2.447076, 0, 0, 0, 1, 1,
0.02550568, -0.3554872, 3.147978, 0, 0, 0, 1, 1,
0.02576901, 0.09206937, 1.623457, 0, 0, 0, 1, 1,
0.02793572, -0.5187312, 1.74573, 0, 0, 0, 1, 1,
0.02850124, -0.3630453, 3.04288, 1, 1, 1, 1, 1,
0.02852284, -1.066017, 1.309092, 1, 1, 1, 1, 1,
0.03617734, -0.3800406, 1.169221, 1, 1, 1, 1, 1,
0.0366383, -1.140854, 1.192884, 1, 1, 1, 1, 1,
0.03738471, 0.2180999, 1.876633, 1, 1, 1, 1, 1,
0.04079344, 1.220522, -0.3214585, 1, 1, 1, 1, 1,
0.04534857, 0.5355419, -1.198475, 1, 1, 1, 1, 1,
0.04800431, -0.4345089, 2.425325, 1, 1, 1, 1, 1,
0.04838276, 0.1922189, -0.2047535, 1, 1, 1, 1, 1,
0.05197825, -0.160716, 4.940664, 1, 1, 1, 1, 1,
0.05860855, 0.02152665, 0.9244404, 1, 1, 1, 1, 1,
0.06436189, -0.02059611, 2.454352, 1, 1, 1, 1, 1,
0.06565643, -2.145531, 3.455377, 1, 1, 1, 1, 1,
0.0677766, -1.090385, 4.033745, 1, 1, 1, 1, 1,
0.07256628, -0.0189114, 2.455302, 1, 1, 1, 1, 1,
0.07608517, 0.5220034, 0.03562796, 0, 0, 1, 1, 1,
0.08009749, -0.2011684, 2.938848, 1, 0, 0, 1, 1,
0.08024666, 0.2585626, -0.06175211, 1, 0, 0, 1, 1,
0.08305866, 0.6823274, -0.1507986, 1, 0, 0, 1, 1,
0.08399313, -1.792736, 3.327441, 1, 0, 0, 1, 1,
0.08442058, 0.4920678, -0.6629269, 1, 0, 0, 1, 1,
0.08490053, 0.2743846, 0.2262696, 0, 0, 0, 1, 1,
0.09038189, 0.5399039, 0.8365391, 0, 0, 0, 1, 1,
0.0907691, 1.400958, 0.8522874, 0, 0, 0, 1, 1,
0.09150919, 0.05870861, 1.461571, 0, 0, 0, 1, 1,
0.09384933, -1.004921, 1.332873, 0, 0, 0, 1, 1,
0.09806105, 1.193719, 0.430553, 0, 0, 0, 1, 1,
0.1062892, 0.3514906, -0.07798728, 0, 0, 0, 1, 1,
0.1075952, 1.72951, 0.127054, 1, 1, 1, 1, 1,
0.1115641, 0.03162498, -0.9209264, 1, 1, 1, 1, 1,
0.1163427, 0.3986447, -0.250135, 1, 1, 1, 1, 1,
0.1253922, 0.5346472, 0.3621792, 1, 1, 1, 1, 1,
0.1331736, 0.2398327, 0.8984363, 1, 1, 1, 1, 1,
0.1361578, 1.677739, -0.1743972, 1, 1, 1, 1, 1,
0.1424319, -0.417772, 3.177735, 1, 1, 1, 1, 1,
0.1453381, 1.278355, 0.06559802, 1, 1, 1, 1, 1,
0.1530732, 0.3211522, 0.3154099, 1, 1, 1, 1, 1,
0.1532618, 1.492758, -0.9069554, 1, 1, 1, 1, 1,
0.1533867, 0.5557587, 0.1883865, 1, 1, 1, 1, 1,
0.1536633, 2.249055, -0.4198222, 1, 1, 1, 1, 1,
0.1553514, -0.1323328, 2.075776, 1, 1, 1, 1, 1,
0.157571, -1.191467, 2.533273, 1, 1, 1, 1, 1,
0.1599836, 2.56933, -0.4529543, 1, 1, 1, 1, 1,
0.1655359, 1.073027, 0.273157, 0, 0, 1, 1, 1,
0.1688676, 1.003099, -0.6234586, 1, 0, 0, 1, 1,
0.1713319, 0.356387, 1.243969, 1, 0, 0, 1, 1,
0.1718616, -1.441684, 1.864952, 1, 0, 0, 1, 1,
0.1783015, -0.1040739, 0.6170782, 1, 0, 0, 1, 1,
0.1783898, 1.413633, -0.6926619, 1, 0, 0, 1, 1,
0.1788179, -0.2624143, 1.836361, 0, 0, 0, 1, 1,
0.1810558, -1.166044, 4.130884, 0, 0, 0, 1, 1,
0.1866821, 1.520482, -0.2105877, 0, 0, 0, 1, 1,
0.1907127, -0.619521, 2.895086, 0, 0, 0, 1, 1,
0.1948923, 0.7710567, 0.3074316, 0, 0, 0, 1, 1,
0.1954065, -0.1514044, 3.375964, 0, 0, 0, 1, 1,
0.1968089, -1.192507, 1.748851, 0, 0, 0, 1, 1,
0.1989513, 1.906152, -1.63059, 1, 1, 1, 1, 1,
0.199653, 0.251374, 0.9464113, 1, 1, 1, 1, 1,
0.2016734, -1.461505, 2.413166, 1, 1, 1, 1, 1,
0.2020617, -0.8709002, 1.911135, 1, 1, 1, 1, 1,
0.2055906, -0.1392529, 3.431863, 1, 1, 1, 1, 1,
0.2112806, 0.07309619, 0.9412281, 1, 1, 1, 1, 1,
0.2173692, -1.657082, 3.361251, 1, 1, 1, 1, 1,
0.2193897, -1.104581, 2.910547, 1, 1, 1, 1, 1,
0.2269211, -0.2202522, 3.566224, 1, 1, 1, 1, 1,
0.2289443, 0.02162121, 1.304961, 1, 1, 1, 1, 1,
0.2310161, 0.9423236, 1.196268, 1, 1, 1, 1, 1,
0.2321133, -0.1344076, 1.594731, 1, 1, 1, 1, 1,
0.2337549, 1.146045, 0.4228185, 1, 1, 1, 1, 1,
0.2346267, -0.4958562, 2.79292, 1, 1, 1, 1, 1,
0.2357091, -1.177786, 3.748734, 1, 1, 1, 1, 1,
0.2390131, 1.752834, -0.8409814, 0, 0, 1, 1, 1,
0.2393611, -1.136482, 3.199484, 1, 0, 0, 1, 1,
0.2420843, -0.9563916, 3.296341, 1, 0, 0, 1, 1,
0.2442055, 1.325781, -0.7861518, 1, 0, 0, 1, 1,
0.2458737, 0.6375873, 1.147495, 1, 0, 0, 1, 1,
0.250738, 0.2202772, -0.372126, 1, 0, 0, 1, 1,
0.2512422, -1.090387, 3.885522, 0, 0, 0, 1, 1,
0.2643769, -0.2749085, 2.795382, 0, 0, 0, 1, 1,
0.2659928, 0.6843455, 0.5686455, 0, 0, 0, 1, 1,
0.2717341, -0.5383466, 4.692032, 0, 0, 0, 1, 1,
0.2718444, -0.794316, 3.333314, 0, 0, 0, 1, 1,
0.2750807, -0.1534762, 1.769887, 0, 0, 0, 1, 1,
0.2751291, 0.1883435, 1.029216, 0, 0, 0, 1, 1,
0.2791842, -1.45001, 4.827866, 1, 1, 1, 1, 1,
0.2808384, -0.1686182, 3.739808, 1, 1, 1, 1, 1,
0.2849309, -0.5612372, 3.723078, 1, 1, 1, 1, 1,
0.2857436, -0.193449, 2.352931, 1, 1, 1, 1, 1,
0.2866108, 0.18043, 0.2802714, 1, 1, 1, 1, 1,
0.2909215, -1.418616, 2.073441, 1, 1, 1, 1, 1,
0.2942347, -0.325824, 1.798732, 1, 1, 1, 1, 1,
0.3002177, -1.076178, 0.9634038, 1, 1, 1, 1, 1,
0.3021084, 2.780587, -2.443114, 1, 1, 1, 1, 1,
0.304066, 0.009183648, 2.398571, 1, 1, 1, 1, 1,
0.3051533, -0.6127451, 2.858876, 1, 1, 1, 1, 1,
0.3065866, -0.6508164, 2.957631, 1, 1, 1, 1, 1,
0.3200301, -0.6686515, 2.290132, 1, 1, 1, 1, 1,
0.3208193, 0.2880923, 1.823702, 1, 1, 1, 1, 1,
0.3225127, -0.8710624, 4.452089, 1, 1, 1, 1, 1,
0.3286147, 0.8237445, -0.09391438, 0, 0, 1, 1, 1,
0.3286312, 1.695477, -1.898323, 1, 0, 0, 1, 1,
0.328947, 0.2801116, -0.8951383, 1, 0, 0, 1, 1,
0.3352232, 1.993462, -0.5203523, 1, 0, 0, 1, 1,
0.3360853, 1.09463, 0.1212933, 1, 0, 0, 1, 1,
0.3384629, -1.107519, 2.126106, 1, 0, 0, 1, 1,
0.3392505, -2.46795, 3.620903, 0, 0, 0, 1, 1,
0.341731, 2.037221, -0.05337617, 0, 0, 0, 1, 1,
0.3430724, 0.7355348, 0.4172388, 0, 0, 0, 1, 1,
0.3489234, 0.6330079, 0.1191049, 0, 0, 0, 1, 1,
0.3491467, -0.3445716, 1.539833, 0, 0, 0, 1, 1,
0.3503766, 0.1523577, 2.049327, 0, 0, 0, 1, 1,
0.3565361, -1.018116, 1.967742, 0, 0, 0, 1, 1,
0.3574436, 0.8314843, 0.6444178, 1, 1, 1, 1, 1,
0.3582799, 0.4023489, 0.7320008, 1, 1, 1, 1, 1,
0.3627883, 0.3316779, 0.3390735, 1, 1, 1, 1, 1,
0.3658491, 0.5378864, 0.09764256, 1, 1, 1, 1, 1,
0.3676003, 1.472109, -0.1506471, 1, 1, 1, 1, 1,
0.3704862, -0.3979318, 1.500578, 1, 1, 1, 1, 1,
0.3787426, -1.577386, 2.391839, 1, 1, 1, 1, 1,
0.3787643, 0.8881854, -0.7196903, 1, 1, 1, 1, 1,
0.385887, -1.614817, 3.23653, 1, 1, 1, 1, 1,
0.3895823, 0.1762746, 1.377329, 1, 1, 1, 1, 1,
0.3933313, 0.172692, 1.395465, 1, 1, 1, 1, 1,
0.3941003, -0.1651386, 1.478111, 1, 1, 1, 1, 1,
0.3952894, -0.2323791, 2.533794, 1, 1, 1, 1, 1,
0.4015286, 0.5073447, -1.044121, 1, 1, 1, 1, 1,
0.4038703, -0.08358172, 0.8334698, 1, 1, 1, 1, 1,
0.4053952, -0.7680482, 3.050677, 0, 0, 1, 1, 1,
0.4063323, -0.3892719, 3.153997, 1, 0, 0, 1, 1,
0.4063723, 0.2401341, 1.824272, 1, 0, 0, 1, 1,
0.4080613, 1.169802, -0.1925705, 1, 0, 0, 1, 1,
0.408801, -0.02956591, 0.9519953, 1, 0, 0, 1, 1,
0.4088461, -0.4530633, 2.479906, 1, 0, 0, 1, 1,
0.4100839, 0.4344738, -1.385995, 0, 0, 0, 1, 1,
0.4115815, 0.8500087, 1.623735, 0, 0, 0, 1, 1,
0.4125252, 0.08023487, 2.299603, 0, 0, 0, 1, 1,
0.4130174, -0.6271655, 1.308469, 0, 0, 0, 1, 1,
0.4133057, 0.2947182, -0.270373, 0, 0, 0, 1, 1,
0.4149955, -0.8173442, 1.842144, 0, 0, 0, 1, 1,
0.4161536, -2.115429, 2.996594, 0, 0, 0, 1, 1,
0.4167387, -1.162535, 4.243805, 1, 1, 1, 1, 1,
0.4170769, 1.456406, -1.795734, 1, 1, 1, 1, 1,
0.4205057, -0.004277551, -0.479931, 1, 1, 1, 1, 1,
0.421133, -0.2749791, 1.242864, 1, 1, 1, 1, 1,
0.4213571, 0.6104138, 0.8978534, 1, 1, 1, 1, 1,
0.4251052, 0.541873, -0.6263732, 1, 1, 1, 1, 1,
0.4333233, -0.8727869, 1.763112, 1, 1, 1, 1, 1,
0.4340912, 2.170478, -1.045632, 1, 1, 1, 1, 1,
0.4347567, 2.276366, -0.4826135, 1, 1, 1, 1, 1,
0.440973, -0.4751897, 1.666776, 1, 1, 1, 1, 1,
0.4414521, -0.1167685, 1.44383, 1, 1, 1, 1, 1,
0.442819, 0.4052254, 0.8360038, 1, 1, 1, 1, 1,
0.4431916, 0.8783568, 1.054104, 1, 1, 1, 1, 1,
0.446299, 0.6768967, 1.483877, 1, 1, 1, 1, 1,
0.4466489, -0.09105492, 1.429464, 1, 1, 1, 1, 1,
0.4467782, 0.2202381, 0.7585589, 0, 0, 1, 1, 1,
0.4490175, 0.2886614, 1.951438, 1, 0, 0, 1, 1,
0.4494997, -0.9949066, 2.606779, 1, 0, 0, 1, 1,
0.4525409, -0.05438991, 0.282823, 1, 0, 0, 1, 1,
0.4526104, 1.223202, 2.068613, 1, 0, 0, 1, 1,
0.4600334, -0.6626852, 2.747389, 1, 0, 0, 1, 1,
0.4684429, 1.193741, 0.7689278, 0, 0, 0, 1, 1,
0.4702616, 0.709455, 1.006261, 0, 0, 0, 1, 1,
0.4705726, 1.011869, 0.4064876, 0, 0, 0, 1, 1,
0.4742245, -0.2343219, 1.260464, 0, 0, 0, 1, 1,
0.4754016, -1.11154, 3.011986, 0, 0, 0, 1, 1,
0.4776925, 0.7793251, 0.5917931, 0, 0, 0, 1, 1,
0.4792707, 0.5743356, 0.7289288, 0, 0, 0, 1, 1,
0.4830298, 0.2611169, 0.09972972, 1, 1, 1, 1, 1,
0.488759, 1.199572, 1.11204, 1, 1, 1, 1, 1,
0.5005996, -1.325083, 2.638032, 1, 1, 1, 1, 1,
0.5036495, -1.20038, 2.165416, 1, 1, 1, 1, 1,
0.5037345, -0.8713661, 1.04906, 1, 1, 1, 1, 1,
0.505649, 0.4944253, 2.184211, 1, 1, 1, 1, 1,
0.5093533, -0.01720444, 1.859294, 1, 1, 1, 1, 1,
0.5123656, 1.586025, 0.5952372, 1, 1, 1, 1, 1,
0.5138782, -0.03716723, -1.125057, 1, 1, 1, 1, 1,
0.5201377, -1.242444, 2.156605, 1, 1, 1, 1, 1,
0.522452, 1.280567, 1.045416, 1, 1, 1, 1, 1,
0.5283791, 0.8300455, 0.340429, 1, 1, 1, 1, 1,
0.5289272, -0.003284406, 1.180781, 1, 1, 1, 1, 1,
0.5308104, 0.8989419, 1.356424, 1, 1, 1, 1, 1,
0.5369459, 0.7892752, -0.2384901, 1, 1, 1, 1, 1,
0.5376003, 0.4237888, 1.743413, 0, 0, 1, 1, 1,
0.5381172, 2.719704, -0.8627223, 1, 0, 0, 1, 1,
0.5411628, 0.04909736, 3.134542, 1, 0, 0, 1, 1,
0.5412815, 1.858531, 0.7577986, 1, 0, 0, 1, 1,
0.5419978, 0.2762716, 2.178978, 1, 0, 0, 1, 1,
0.5504521, 0.01257669, 1.675316, 1, 0, 0, 1, 1,
0.5518811, -0.9067253, 2.087461, 0, 0, 0, 1, 1,
0.5523978, -1.07409, 3.365111, 0, 0, 0, 1, 1,
0.5551561, 0.0864677, 1.487573, 0, 0, 0, 1, 1,
0.5581625, 0.7613123, 0.5577679, 0, 0, 0, 1, 1,
0.5586522, 0.9183974, -0.4077238, 0, 0, 0, 1, 1,
0.5612196, -0.1051999, 2.346571, 0, 0, 0, 1, 1,
0.5623189, 0.170438, 1.759362, 0, 0, 0, 1, 1,
0.5645512, 1.005964, -0.3218464, 1, 1, 1, 1, 1,
0.5673724, -1.012884, 2.367453, 1, 1, 1, 1, 1,
0.5748838, -0.6129619, 3.701723, 1, 1, 1, 1, 1,
0.5778174, 0.9931584, -0.457238, 1, 1, 1, 1, 1,
0.5933783, -0.485882, 3.187282, 1, 1, 1, 1, 1,
0.5944597, -1.349502, 1.775618, 1, 1, 1, 1, 1,
0.5961696, -0.434725, 2.118906, 1, 1, 1, 1, 1,
0.59826, 0.1814316, 0.6656811, 1, 1, 1, 1, 1,
0.6014462, -0.5216259, 2.472065, 1, 1, 1, 1, 1,
0.6053876, 0.6275167, 2.893373, 1, 1, 1, 1, 1,
0.611615, 1.109273, 0.7059056, 1, 1, 1, 1, 1,
0.6133786, 0.05437686, 1.831408, 1, 1, 1, 1, 1,
0.6152104, -0.5489526, 4.20888, 1, 1, 1, 1, 1,
0.6159676, 0.638463, 0.9798786, 1, 1, 1, 1, 1,
0.6181267, -1.10739, 2.285673, 1, 1, 1, 1, 1,
0.6206262, 0.8391928, 0.213689, 0, 0, 1, 1, 1,
0.6224303, 0.5339353, 0.3524554, 1, 0, 0, 1, 1,
0.6236257, 0.2531766, 1.633186, 1, 0, 0, 1, 1,
0.6248335, -0.2480865, 2.629155, 1, 0, 0, 1, 1,
0.6292517, -0.01730121, 1.659959, 1, 0, 0, 1, 1,
0.6315492, -1.250057, 3.14153, 1, 0, 0, 1, 1,
0.6325325, 0.3045361, 2.226524, 0, 0, 0, 1, 1,
0.635362, -1.022066, 3.270537, 0, 0, 0, 1, 1,
0.6380925, 0.593825, 0.3576826, 0, 0, 0, 1, 1,
0.6435632, 0.8924441, 0.4628959, 0, 0, 0, 1, 1,
0.6465021, -0.4914597, 1.277893, 0, 0, 0, 1, 1,
0.6513308, 1.13213, 0.99084, 0, 0, 0, 1, 1,
0.6521222, 1.215186, 1.062478, 0, 0, 0, 1, 1,
0.6523982, -0.75462, 3.098601, 1, 1, 1, 1, 1,
0.6576468, 0.4826005, 1.282504, 1, 1, 1, 1, 1,
0.6586005, -0.6070234, 2.406775, 1, 1, 1, 1, 1,
0.6599819, -0.2028842, 0.808989, 1, 1, 1, 1, 1,
0.6602004, 1.295604, 0.05819109, 1, 1, 1, 1, 1,
0.662082, -0.838198, 2.929118, 1, 1, 1, 1, 1,
0.6775006, -0.5077829, 4.284008, 1, 1, 1, 1, 1,
0.6781465, 0.3998853, 1.010722, 1, 1, 1, 1, 1,
0.6800297, -0.02132099, 1.085567, 1, 1, 1, 1, 1,
0.6877636, -1.748542, 1.771099, 1, 1, 1, 1, 1,
0.6882858, -1.44292, 4.047173, 1, 1, 1, 1, 1,
0.6938385, 1.356776, -0.4011892, 1, 1, 1, 1, 1,
0.6940967, 0.441731, 0.4886083, 1, 1, 1, 1, 1,
0.6945832, -0.2986104, 0.339141, 1, 1, 1, 1, 1,
0.6985982, 1.703774, 1.998214, 1, 1, 1, 1, 1,
0.701385, 0.5225048, 1.302128, 0, 0, 1, 1, 1,
0.7082708, -0.124671, 2.401218, 1, 0, 0, 1, 1,
0.7094365, -1.015683, 0.5425751, 1, 0, 0, 1, 1,
0.7108043, 1.449783, -0.5492692, 1, 0, 0, 1, 1,
0.7163351, -0.4629612, 2.378124, 1, 0, 0, 1, 1,
0.7186568, -0.3227906, 1.365653, 1, 0, 0, 1, 1,
0.7226573, -0.9409547, 1.675415, 0, 0, 0, 1, 1,
0.7232407, 1.126378, -0.05254753, 0, 0, 0, 1, 1,
0.7232918, -0.5304051, 1.879207, 0, 0, 0, 1, 1,
0.7288122, 2.948802, 1.053495, 0, 0, 0, 1, 1,
0.7292755, 1.271439, -0.3987812, 0, 0, 0, 1, 1,
0.733699, -0.1052308, 0.3178982, 0, 0, 0, 1, 1,
0.7348755, 0.8222963, 1.502042, 0, 0, 0, 1, 1,
0.7396868, 1.027857, -0.9180536, 1, 1, 1, 1, 1,
0.7420583, -0.542954, 3.454718, 1, 1, 1, 1, 1,
0.7425874, -0.6426571, 1.000332, 1, 1, 1, 1, 1,
0.75251, -0.06982432, 2.684747, 1, 1, 1, 1, 1,
0.7549334, -1.875479, 3.412526, 1, 1, 1, 1, 1,
0.7559206, 0.5072124, 0.3422405, 1, 1, 1, 1, 1,
0.7592513, 1.08314, -0.668594, 1, 1, 1, 1, 1,
0.760128, -0.660498, 1.465925, 1, 1, 1, 1, 1,
0.7684877, 1.498462, -1.07676, 1, 1, 1, 1, 1,
0.7692071, 0.5717494, 2.058047, 1, 1, 1, 1, 1,
0.7748014, -0.5988265, 1.582881, 1, 1, 1, 1, 1,
0.7755209, -1.001836, 2.512357, 1, 1, 1, 1, 1,
0.7857274, -0.352771, 0.2065816, 1, 1, 1, 1, 1,
0.7862324, 0.8278973, 1.010888, 1, 1, 1, 1, 1,
0.7898241, 0.4601924, 0.6494814, 1, 1, 1, 1, 1,
0.7913777, -1.503092, 3.599231, 0, 0, 1, 1, 1,
0.7977155, 2.616504, 0.8704239, 1, 0, 0, 1, 1,
0.7985811, -0.9478922, 4.995161, 1, 0, 0, 1, 1,
0.8053887, -0.693318, 2.540553, 1, 0, 0, 1, 1,
0.8135851, 0.3652613, 2.131809, 1, 0, 0, 1, 1,
0.8197303, -0.3347118, 1.536692, 1, 0, 0, 1, 1,
0.8272543, -0.8629307, 1.834903, 0, 0, 0, 1, 1,
0.8290267, 1.33202, 1.407209, 0, 0, 0, 1, 1,
0.8360152, -0.892266, 3.344715, 0, 0, 0, 1, 1,
0.8376219, -0.6655665, 1.239214, 0, 0, 0, 1, 1,
0.8422285, -1.161555, 1.60241, 0, 0, 0, 1, 1,
0.8424799, -1.364234, 1.110376, 0, 0, 0, 1, 1,
0.8454138, 0.2661844, 0.08126579, 0, 0, 0, 1, 1,
0.8522027, 0.1816157, 1.905964, 1, 1, 1, 1, 1,
0.8528503, 0.3394898, 0.8756578, 1, 1, 1, 1, 1,
0.853309, 1.353943, -0.1723527, 1, 1, 1, 1, 1,
0.8535175, 1.118968, 2.269907, 1, 1, 1, 1, 1,
0.8536702, 0.5927895, 1.37784, 1, 1, 1, 1, 1,
0.8540403, -0.8743404, 2.608727, 1, 1, 1, 1, 1,
0.8544008, 0.4487456, 2.440764, 1, 1, 1, 1, 1,
0.857996, 0.06354031, 0.855914, 1, 1, 1, 1, 1,
0.8583359, -0.627993, 0.07201088, 1, 1, 1, 1, 1,
0.8595383, 0.09325888, 0.4250724, 1, 1, 1, 1, 1,
0.8598966, -0.7128422, 1.405159, 1, 1, 1, 1, 1,
0.8600197, -0.2244595, 3.349823, 1, 1, 1, 1, 1,
0.8699473, 0.6190209, 0.6109843, 1, 1, 1, 1, 1,
0.8768428, 0.7279092, -0.2768462, 1, 1, 1, 1, 1,
0.8939533, -0.8378909, 3.110145, 1, 1, 1, 1, 1,
0.8966855, 0.1596684, -0.01046251, 0, 0, 1, 1, 1,
0.8997439, 0.05330986, -0.2377826, 1, 0, 0, 1, 1,
0.906364, 0.8746578, -1.367824, 1, 0, 0, 1, 1,
0.9096892, 0.5363396, 0.4797421, 1, 0, 0, 1, 1,
0.9107975, 1.179345, 0.4295782, 1, 0, 0, 1, 1,
0.9112841, 0.08384246, 1.321894, 1, 0, 0, 1, 1,
0.9140041, 0.1044697, 0.6780624, 0, 0, 0, 1, 1,
0.9296198, -0.1589296, 1.920927, 0, 0, 0, 1, 1,
0.9326828, 0.3007769, 1.02318, 0, 0, 0, 1, 1,
0.9356328, -0.3007118, 2.143216, 0, 0, 0, 1, 1,
0.9405291, 0.540946, 2.083135, 0, 0, 0, 1, 1,
0.9412563, 0.8164648, -2.212124, 0, 0, 0, 1, 1,
0.9430179, 0.1316662, 1.511137, 0, 0, 0, 1, 1,
0.9433666, 1.866353, -0.1423461, 1, 1, 1, 1, 1,
0.9440132, 1.920568, 0.2235094, 1, 1, 1, 1, 1,
0.9489166, 0.7396079, 1.011791, 1, 1, 1, 1, 1,
0.9494819, 0.6763657, -0.2198563, 1, 1, 1, 1, 1,
0.9524029, -1.288663, 2.758892, 1, 1, 1, 1, 1,
0.9567239, 1.543139, 1.368442, 1, 1, 1, 1, 1,
0.9637411, 0.4295763, 1.046, 1, 1, 1, 1, 1,
0.9708048, 0.351203, 1.792827, 1, 1, 1, 1, 1,
0.9711242, -0.1032913, 1.10975, 1, 1, 1, 1, 1,
0.9813334, -0.07677276, 0.5069792, 1, 1, 1, 1, 1,
0.9818994, 0.08251517, 2.930876, 1, 1, 1, 1, 1,
0.9966004, 0.1261711, -0.2764075, 1, 1, 1, 1, 1,
0.9987352, 0.3086021, -0.6627811, 1, 1, 1, 1, 1,
1.00283, -2.142203, 2.435452, 1, 1, 1, 1, 1,
1.016268, 0.5736918, 0.03464243, 1, 1, 1, 1, 1,
1.019071, 2.062798, 1.311674, 0, 0, 1, 1, 1,
1.021625, -0.1625517, 1.724291, 1, 0, 0, 1, 1,
1.03183, 0.6269521, 0.2467624, 1, 0, 0, 1, 1,
1.040589, -1.638938, 0.624755, 1, 0, 0, 1, 1,
1.042151, -0.2610146, 1.35513, 1, 0, 0, 1, 1,
1.042865, -0.4193353, 2.247255, 1, 0, 0, 1, 1,
1.048375, -1.883492, 4.673769, 0, 0, 0, 1, 1,
1.049436, 0.6183216, 0.4355266, 0, 0, 0, 1, 1,
1.050995, -0.4743842, 1.327626, 0, 0, 0, 1, 1,
1.056991, 2.049054, -0.238703, 0, 0, 0, 1, 1,
1.060948, -1.338508, 0.470467, 0, 0, 0, 1, 1,
1.063097, -1.288504, 4.329496, 0, 0, 0, 1, 1,
1.067536, -0.4508252, 1.659718, 0, 0, 0, 1, 1,
1.080582, -0.7349595, 3.174824, 1, 1, 1, 1, 1,
1.082022, -0.7145948, 2.750631, 1, 1, 1, 1, 1,
1.084886, -1.391146, 0.8305867, 1, 1, 1, 1, 1,
1.089238, -1.871319, 4.584554, 1, 1, 1, 1, 1,
1.095465, 1.988571, 0.3075075, 1, 1, 1, 1, 1,
1.099712, -0.8580876, 1.640816, 1, 1, 1, 1, 1,
1.100993, -0.3498771, 0.3412832, 1, 1, 1, 1, 1,
1.108187, 2.199832, 1.552663, 1, 1, 1, 1, 1,
1.11038, 0.6206799, 0.2264127, 1, 1, 1, 1, 1,
1.115161, -0.2963474, 1.874582, 1, 1, 1, 1, 1,
1.11573, -6.853951e-05, -0.3754092, 1, 1, 1, 1, 1,
1.115865, -0.1251021, 2.931957, 1, 1, 1, 1, 1,
1.119771, 1.139068, 1.811987, 1, 1, 1, 1, 1,
1.120486, -1.7788, 2.723846, 1, 1, 1, 1, 1,
1.126959, 3.155174, -1.051547, 1, 1, 1, 1, 1,
1.13042, 1.104853, 1.78406, 0, 0, 1, 1, 1,
1.130635, -1.027284, 0.1591218, 1, 0, 0, 1, 1,
1.136809, 0.06063612, 1.207161, 1, 0, 0, 1, 1,
1.149686, 0.1786177, 2.008364, 1, 0, 0, 1, 1,
1.164145, 1.671035, -0.854681, 1, 0, 0, 1, 1,
1.16586, -0.9180657, 2.822883, 1, 0, 0, 1, 1,
1.172882, -1.18065, 2.699265, 0, 0, 0, 1, 1,
1.17698, 0.821768, 1.079831, 0, 0, 0, 1, 1,
1.178323, -1.282913, 1.240408, 0, 0, 0, 1, 1,
1.180862, 0.5370326, 0.7761981, 0, 0, 0, 1, 1,
1.190008, -0.1691394, 4.200894, 0, 0, 0, 1, 1,
1.19971, -2.265849, 1.61938, 0, 0, 0, 1, 1,
1.201388, -0.6800402, 1.741881, 0, 0, 0, 1, 1,
1.202816, -1.23262, 3.475743, 1, 1, 1, 1, 1,
1.202846, 0.0624414, 0.5940325, 1, 1, 1, 1, 1,
1.218684, -1.932293, 1.703489, 1, 1, 1, 1, 1,
1.219453, 0.2075006, 0.5832431, 1, 1, 1, 1, 1,
1.22049, -0.704523, 0.9699014, 1, 1, 1, 1, 1,
1.228153, 0.5564638, 2.270917, 1, 1, 1, 1, 1,
1.231085, 0.2125685, 1.664146, 1, 1, 1, 1, 1,
1.231576, 0.8782165, 1.491768, 1, 1, 1, 1, 1,
1.233241, 0.369374, 1.351526, 1, 1, 1, 1, 1,
1.233474, 0.07795246, 2.265298, 1, 1, 1, 1, 1,
1.255113, -2.93664, 0.6899822, 1, 1, 1, 1, 1,
1.255406, -0.4232856, 1.223563, 1, 1, 1, 1, 1,
1.255866, 0.6960994, 2.411005, 1, 1, 1, 1, 1,
1.259449, -0.001946158, 0.08103974, 1, 1, 1, 1, 1,
1.268584, -0.3084754, 3.009099, 1, 1, 1, 1, 1,
1.275133, 0.2962423, 1.432917, 0, 0, 1, 1, 1,
1.276442, 1.571085, 0.02113662, 1, 0, 0, 1, 1,
1.280467, 0.6411523, -0.5525606, 1, 0, 0, 1, 1,
1.286381, 0.6653583, 3.157944, 1, 0, 0, 1, 1,
1.286835, -1.70825, 3.916898, 1, 0, 0, 1, 1,
1.300629, -0.6480116, 0.745379, 1, 0, 0, 1, 1,
1.308685, 0.5420845, 1.445338, 0, 0, 0, 1, 1,
1.329381, -0.592464, 2.5858, 0, 0, 0, 1, 1,
1.333932, -0.9937127, 0.03696021, 0, 0, 0, 1, 1,
1.339237, 0.01126836, 2.374878, 0, 0, 0, 1, 1,
1.355871, -0.9335734, 2.94779, 0, 0, 0, 1, 1,
1.35758, -0.1717595, 2.78546, 0, 0, 0, 1, 1,
1.36254, -0.9233707, 3.099407, 0, 0, 0, 1, 1,
1.371519, -0.3382204, 0.6561112, 1, 1, 1, 1, 1,
1.37159, 0.7397586, 1.77986, 1, 1, 1, 1, 1,
1.377339, -1.129712, 2.47432, 1, 1, 1, 1, 1,
1.378374, -1.456653, 1.58681, 1, 1, 1, 1, 1,
1.391659, 0.5440814, 0.05107408, 1, 1, 1, 1, 1,
1.393146, -0.05365495, 3.575237, 1, 1, 1, 1, 1,
1.398587, -0.4580188, 2.850312, 1, 1, 1, 1, 1,
1.399648, -0.5938671, 2.555448, 1, 1, 1, 1, 1,
1.416487, -0.4133248, 2.603815, 1, 1, 1, 1, 1,
1.425379, 0.184091, 1.809543, 1, 1, 1, 1, 1,
1.429426, -0.239985, 1.035331, 1, 1, 1, 1, 1,
1.432426, 0.2366872, 0.9040974, 1, 1, 1, 1, 1,
1.440907, 0.3424489, 1.270932, 1, 1, 1, 1, 1,
1.454061, -0.4445395, 2.552969, 1, 1, 1, 1, 1,
1.456968, 0.1626042, -0.1291496, 1, 1, 1, 1, 1,
1.457661, 1.351134, 0.9580226, 0, 0, 1, 1, 1,
1.473971, -2.086554, 0.4940214, 1, 0, 0, 1, 1,
1.490722, -0.7919255, -0.05258287, 1, 0, 0, 1, 1,
1.494157, -0.0239466, 1.535449, 1, 0, 0, 1, 1,
1.495988, 2.181466, 1.338152, 1, 0, 0, 1, 1,
1.529274, 2.730521, -1.676386, 1, 0, 0, 1, 1,
1.538334, 0.5793635, -0.1731671, 0, 0, 0, 1, 1,
1.556525, -0.009909971, 1.987798, 0, 0, 0, 1, 1,
1.563535, 0.764723, 2.177064, 0, 0, 0, 1, 1,
1.565616, -2.372061, 3.985416, 0, 0, 0, 1, 1,
1.571344, -0.6152524, 1.1506, 0, 0, 0, 1, 1,
1.590531, -2.331105, 2.149174, 0, 0, 0, 1, 1,
1.59176, 1.002842, 0.9401638, 0, 0, 0, 1, 1,
1.604245, 0.8650361, 0.7070375, 1, 1, 1, 1, 1,
1.604984, 0.9126483, 0.5331691, 1, 1, 1, 1, 1,
1.605861, 0.1258091, 0.1997502, 1, 1, 1, 1, 1,
1.611317, 0.2692389, 0.4249847, 1, 1, 1, 1, 1,
1.617652, 0.4404438, 0.8775112, 1, 1, 1, 1, 1,
1.631355, 1.200444, 0.5658482, 1, 1, 1, 1, 1,
1.63948, 0.7273888, 1.062138, 1, 1, 1, 1, 1,
1.657233, -0.3604394, 1.437727, 1, 1, 1, 1, 1,
1.659815, -0.2319105, 2.585273, 1, 1, 1, 1, 1,
1.660242, -0.3148975, 2.956194, 1, 1, 1, 1, 1,
1.676194, -1.097813, 3.986085, 1, 1, 1, 1, 1,
1.676539, -0.5703182, 0.5178209, 1, 1, 1, 1, 1,
1.676833, -0.4388306, 3.943882, 1, 1, 1, 1, 1,
1.68253, -1.263246, 1.461046, 1, 1, 1, 1, 1,
1.706424, -0.3078333, 1.493384, 1, 1, 1, 1, 1,
1.721583, -0.8380529, 1.401146, 0, 0, 1, 1, 1,
1.735385, -0.2558248, 2.213214, 1, 0, 0, 1, 1,
1.739627, 0.6156297, 1.267646, 1, 0, 0, 1, 1,
1.752245, -0.5793728, 0.05715765, 1, 0, 0, 1, 1,
1.767056, -2.321917, 1.911288, 1, 0, 0, 1, 1,
1.775766, 1.64846, -0.34359, 1, 0, 0, 1, 1,
1.784178, -2.246206, 1.961466, 0, 0, 0, 1, 1,
1.796289, -0.7584335, 2.673164, 0, 0, 0, 1, 1,
1.805404, -1.030174, 1.589458, 0, 0, 0, 1, 1,
1.806788, -0.9064837, 2.031444, 0, 0, 0, 1, 1,
1.810511, 0.1152686, 1.720369, 0, 0, 0, 1, 1,
1.816859, 0.7409914, 1.434258, 0, 0, 0, 1, 1,
1.883036, -1.579701, 2.924585, 0, 0, 0, 1, 1,
1.896145, 1.038241, 1.711023, 1, 1, 1, 1, 1,
1.905573, -1.379061, 2.406346, 1, 1, 1, 1, 1,
1.910998, 1.305902, 1.750565, 1, 1, 1, 1, 1,
1.936754, -1.361963, 2.814741, 1, 1, 1, 1, 1,
1.951815, -1.714872, 2.321082, 1, 1, 1, 1, 1,
1.96116, -0.008975929, 1.674809, 1, 1, 1, 1, 1,
1.980744, 1.051881, 1.7021, 1, 1, 1, 1, 1,
1.982146, 0.2842317, 1.001691, 1, 1, 1, 1, 1,
2.000445, -1.249558, 2.368529, 1, 1, 1, 1, 1,
2.047867, -0.9369328, 1.873252, 1, 1, 1, 1, 1,
2.05149, -1.033259, 1.634663, 1, 1, 1, 1, 1,
2.063382, -2.198645, 5.044518, 1, 1, 1, 1, 1,
2.064759, -0.7394908, 3.218709, 1, 1, 1, 1, 1,
2.069834, -0.05496161, 0.6986476, 1, 1, 1, 1, 1,
2.094709, 1.556805, 0.5826085, 1, 1, 1, 1, 1,
2.118365, 0.1556749, -0.3160098, 0, 0, 1, 1, 1,
2.121033, 0.06050805, 1.202379, 1, 0, 0, 1, 1,
2.151728, 0.1553201, 0.9049237, 1, 0, 0, 1, 1,
2.153016, 0.3489141, 1.213374, 1, 0, 0, 1, 1,
2.15569, -0.3221337, 2.565741, 1, 0, 0, 1, 1,
2.155976, 1.069429, 1.968327, 1, 0, 0, 1, 1,
2.210285, 0.9560862, 1.344288, 0, 0, 0, 1, 1,
2.225548, -0.8090481, 1.858527, 0, 0, 0, 1, 1,
2.271293, 0.8152744, -0.4956544, 0, 0, 0, 1, 1,
2.272406, 0.2333327, 1.951416, 0, 0, 0, 1, 1,
2.386824, -0.6309835, 1.54764, 0, 0, 0, 1, 1,
2.462897, 1.444948, 0.9001482, 0, 0, 0, 1, 1,
2.494723, -0.6478038, 1.042167, 0, 0, 0, 1, 1,
2.504693, -0.4403979, 1.538791, 1, 1, 1, 1, 1,
2.54595, 1.232993, -0.6514575, 1, 1, 1, 1, 1,
2.774205, 0.4333382, 0.2147208, 1, 1, 1, 1, 1,
2.777309, 0.2966155, 1.677014, 1, 1, 1, 1, 1,
2.950847, -0.484678, 0.3939105, 1, 1, 1, 1, 1,
3.206219, 0.1527732, 2.203575, 1, 1, 1, 1, 1,
3.256253, -0.1006743, 1.831657, 1, 1, 1, 1, 1
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
var radius = 9.637027;
var distance = 33.84965;
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
mvMatrix.translate( -0.2223458, 0.1982739, 0.2409844 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.84965);
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
