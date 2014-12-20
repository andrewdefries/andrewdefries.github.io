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
-2.718807, -0.8071265, -0.8645301, 1, 0, 0, 1,
-2.599512, -1.118709, -1.988985, 1, 0.007843138, 0, 1,
-2.55596, -1.676064, -1.318661, 1, 0.01176471, 0, 1,
-2.415676, -0.9025323, -1.203878, 1, 0.01960784, 0, 1,
-2.399458, -1.783903, -2.868664, 1, 0.02352941, 0, 1,
-2.384408, 0.2117209, 0.123421, 1, 0.03137255, 0, 1,
-2.374927, 0.08805762, -1.727934, 1, 0.03529412, 0, 1,
-2.347147, -0.9556824, -2.998804, 1, 0.04313726, 0, 1,
-2.31534, 1.28683, -0.03624044, 1, 0.04705882, 0, 1,
-2.255791, 0.4552877, -2.302872, 1, 0.05490196, 0, 1,
-2.202118, -1.087271, -2.353882, 1, 0.05882353, 0, 1,
-2.172963, -1.696427, -1.188813, 1, 0.06666667, 0, 1,
-2.124641, 2.014661, -1.41946, 1, 0.07058824, 0, 1,
-2.109862, 0.4282319, -2.035912, 1, 0.07843138, 0, 1,
-2.100596, -0.002620274, -1.002479, 1, 0.08235294, 0, 1,
-2.033365, -0.6327693, -1.179017, 1, 0.09019608, 0, 1,
-2.017668, 0.3701225, -1.327264, 1, 0.09411765, 0, 1,
-2.01612, 0.2268881, -0.6535907, 1, 0.1019608, 0, 1,
-2.011163, 1.440805, -1.310044, 1, 0.1098039, 0, 1,
-1.987002, 2.12667, 0.7768443, 1, 0.1137255, 0, 1,
-1.978677, -0.8299249, -2.078867, 1, 0.1215686, 0, 1,
-1.971403, 0.6266321, -0.5393953, 1, 0.1254902, 0, 1,
-1.965623, 1.420332, -0.4060425, 1, 0.1333333, 0, 1,
-1.931477, -0.4757794, -4.168664, 1, 0.1372549, 0, 1,
-1.903185, 0.672317, -1.784487, 1, 0.145098, 0, 1,
-1.901988, 1.176474, -0.916158, 1, 0.1490196, 0, 1,
-1.892001, -0.2477673, -1.437723, 1, 0.1568628, 0, 1,
-1.884173, 0.4892884, -0.4390984, 1, 0.1607843, 0, 1,
-1.882163, 0.6442793, -1.407075, 1, 0.1686275, 0, 1,
-1.850579, 0.4867331, -2.30059, 1, 0.172549, 0, 1,
-1.848166, 1.946932, -1.319023, 1, 0.1803922, 0, 1,
-1.846005, -1.833095, -2.256577, 1, 0.1843137, 0, 1,
-1.805898, 0.1617268, -1.904886, 1, 0.1921569, 0, 1,
-1.798622, -0.6297498, 0.1085339, 1, 0.1960784, 0, 1,
-1.782652, -0.5801165, -1.897821, 1, 0.2039216, 0, 1,
-1.774773, 0.5179693, -0.6172685, 1, 0.2117647, 0, 1,
-1.765338, 0.0512988, -2.35072, 1, 0.2156863, 0, 1,
-1.760187, 0.5684417, -0.06194787, 1, 0.2235294, 0, 1,
-1.756891, 0.3187199, -1.48708, 1, 0.227451, 0, 1,
-1.745075, 0.1304052, -0.6569714, 1, 0.2352941, 0, 1,
-1.73681, -0.4390293, -3.755436, 1, 0.2392157, 0, 1,
-1.731462, 0.8113483, 0.5407934, 1, 0.2470588, 0, 1,
-1.731452, 0.8530937, -4.352887, 1, 0.2509804, 0, 1,
-1.72936, -0.7305277, -1.971015, 1, 0.2588235, 0, 1,
-1.716648, -0.6246243, -1.870899, 1, 0.2627451, 0, 1,
-1.699449, 0.1005514, 0.03165333, 1, 0.2705882, 0, 1,
-1.699403, -0.418709, -1.828369, 1, 0.2745098, 0, 1,
-1.696708, -1.115487, -2.018343, 1, 0.282353, 0, 1,
-1.694726, 0.3335502, -1.655855, 1, 0.2862745, 0, 1,
-1.693593, 1.084201, -2.45921, 1, 0.2941177, 0, 1,
-1.68975, 0.9656741, -0.9946412, 1, 0.3019608, 0, 1,
-1.661278, -0.7990851, -1.674063, 1, 0.3058824, 0, 1,
-1.648915, 0.6927872, -1.504777, 1, 0.3137255, 0, 1,
-1.646499, 0.8415631, -1.340747, 1, 0.3176471, 0, 1,
-1.641184, 0.8965752, -2.614147, 1, 0.3254902, 0, 1,
-1.63249, 0.5336685, 0.6073756, 1, 0.3294118, 0, 1,
-1.63208, -0.206592, -1.360893, 1, 0.3372549, 0, 1,
-1.630378, -0.7698591, -3.039156, 1, 0.3411765, 0, 1,
-1.626983, -1.088952, -2.932664, 1, 0.3490196, 0, 1,
-1.620412, -0.2458336, -0.6283917, 1, 0.3529412, 0, 1,
-1.618694, -0.8823008, -1.41617, 1, 0.3607843, 0, 1,
-1.6174, 0.3613093, -1.982274, 1, 0.3647059, 0, 1,
-1.614265, 0.9001865, -1.669729, 1, 0.372549, 0, 1,
-1.608042, 0.7600528, -2.051248, 1, 0.3764706, 0, 1,
-1.604044, 0.3554503, -1.521744, 1, 0.3843137, 0, 1,
-1.602904, -1.312244, -3.423736, 1, 0.3882353, 0, 1,
-1.581931, 0.4962853, -2.04515, 1, 0.3960784, 0, 1,
-1.575228, -1.244986, -3.022758, 1, 0.4039216, 0, 1,
-1.565121, 1.171192, -0.8144383, 1, 0.4078431, 0, 1,
-1.547218, 0.5273429, -1.295331, 1, 0.4156863, 0, 1,
-1.546922, -0.1741369, -2.281751, 1, 0.4196078, 0, 1,
-1.54452, 0.9745958, -0.5718248, 1, 0.427451, 0, 1,
-1.537969, 1.531735, -0.02024033, 1, 0.4313726, 0, 1,
-1.527113, 0.9670989, -0.3824763, 1, 0.4392157, 0, 1,
-1.525635, -0.3265967, -0.1654462, 1, 0.4431373, 0, 1,
-1.520753, -0.2067099, -1.175296, 1, 0.4509804, 0, 1,
-1.51805, 0.1447003, -0.9936754, 1, 0.454902, 0, 1,
-1.500252, -0.405856, -0.4900862, 1, 0.4627451, 0, 1,
-1.48383, 0.5077588, -1.182564, 1, 0.4666667, 0, 1,
-1.477627, 0.007492645, -2.012831, 1, 0.4745098, 0, 1,
-1.433046, 0.8477867, -0.06615987, 1, 0.4784314, 0, 1,
-1.421546, 0.7827851, 0.4119622, 1, 0.4862745, 0, 1,
-1.411239, -1.876402, -3.255262, 1, 0.4901961, 0, 1,
-1.411198, -1.294594, -1.517061, 1, 0.4980392, 0, 1,
-1.381911, 0.8693145, -0.06305458, 1, 0.5058824, 0, 1,
-1.372612, 0.3096209, -1.145981, 1, 0.509804, 0, 1,
-1.367484, 0.3518729, -0.2021208, 1, 0.5176471, 0, 1,
-1.363414, -0.4358922, -1.716596, 1, 0.5215687, 0, 1,
-1.36091, -0.7128018, -4.481668, 1, 0.5294118, 0, 1,
-1.347323, -0.4553508, -1.404421, 1, 0.5333334, 0, 1,
-1.317767, -0.624393, -2.510725, 1, 0.5411765, 0, 1,
-1.312497, 0.4927947, -3.256588, 1, 0.5450981, 0, 1,
-1.306162, -2.217462, -2.116718, 1, 0.5529412, 0, 1,
-1.305859, 0.04599816, -0.6445125, 1, 0.5568628, 0, 1,
-1.305365, 2.480922, -0.9944086, 1, 0.5647059, 0, 1,
-1.297691, -0.7385903, -3.122534, 1, 0.5686275, 0, 1,
-1.290991, 0.1927321, -1.386312, 1, 0.5764706, 0, 1,
-1.287309, 0.9819795, -0.5471271, 1, 0.5803922, 0, 1,
-1.284956, -0.2575166, -0.6526617, 1, 0.5882353, 0, 1,
-1.283806, -1.406163, -0.9247335, 1, 0.5921569, 0, 1,
-1.278411, -0.4486317, -2.256331, 1, 0.6, 0, 1,
-1.261995, -0.9672616, -0.8161652, 1, 0.6078432, 0, 1,
-1.255347, -0.1629731, -0.8792176, 1, 0.6117647, 0, 1,
-1.252451, -0.2759701, -2.964068, 1, 0.6196079, 0, 1,
-1.251771, -0.8234209, -0.1765781, 1, 0.6235294, 0, 1,
-1.24846, 1.877867, -1.155709, 1, 0.6313726, 0, 1,
-1.23586, -0.574471, -3.774138, 1, 0.6352941, 0, 1,
-1.233652, 0.9507864, -2.359834, 1, 0.6431373, 0, 1,
-1.226156, 0.09071279, -3.211697, 1, 0.6470588, 0, 1,
-1.217153, -0.7036428, -1.556379, 1, 0.654902, 0, 1,
-1.210382, 1.55548, -0.6863908, 1, 0.6588235, 0, 1,
-1.206572, 0.5133251, -0.02537007, 1, 0.6666667, 0, 1,
-1.194376, 0.4198415, -1.789228, 1, 0.6705883, 0, 1,
-1.186937, -1.740543, -4.30307, 1, 0.6784314, 0, 1,
-1.186698, -0.09181749, -2.361904, 1, 0.682353, 0, 1,
-1.180269, 0.9755006, -2.328636, 1, 0.6901961, 0, 1,
-1.176304, -0.366137, -2.688459, 1, 0.6941177, 0, 1,
-1.171051, -0.4820839, -1.886782, 1, 0.7019608, 0, 1,
-1.163429, -0.4689111, -1.532832, 1, 0.7098039, 0, 1,
-1.1634, -0.6600173, -1.416587, 1, 0.7137255, 0, 1,
-1.160438, 0.5024071, -1.132715, 1, 0.7215686, 0, 1,
-1.158247, 0.1471187, -0.666944, 1, 0.7254902, 0, 1,
-1.149557, 0.4154689, -1.237072, 1, 0.7333333, 0, 1,
-1.14943, -0.344993, -1.55644, 1, 0.7372549, 0, 1,
-1.144561, 0.9797061, -1.602232, 1, 0.7450981, 0, 1,
-1.129592, -0.07256699, -2.907884, 1, 0.7490196, 0, 1,
-1.117264, -1.882148, -1.760879, 1, 0.7568628, 0, 1,
-1.116683, 2.209118, -1.228072, 1, 0.7607843, 0, 1,
-1.113477, 0.3978945, -1.124475, 1, 0.7686275, 0, 1,
-1.108645, -0.4601734, -3.488431, 1, 0.772549, 0, 1,
-1.101138, -2.228616, -3.244708, 1, 0.7803922, 0, 1,
-1.100011, 0.7398756, -0.896445, 1, 0.7843137, 0, 1,
-1.095825, -1.392279, -2.575295, 1, 0.7921569, 0, 1,
-1.09301, -0.4307342, -1.794343, 1, 0.7960784, 0, 1,
-1.086946, 0.9836889, -0.2706035, 1, 0.8039216, 0, 1,
-1.082648, -0.08162624, -1.962891, 1, 0.8117647, 0, 1,
-1.081118, 0.2329263, -1.618154, 1, 0.8156863, 0, 1,
-1.079228, 0.3985266, -1.555124, 1, 0.8235294, 0, 1,
-1.066042, -0.7957665, -2.032075, 1, 0.827451, 0, 1,
-1.064099, -0.4604046, -2.802414, 1, 0.8352941, 0, 1,
-1.063347, -0.2104163, -2.831346, 1, 0.8392157, 0, 1,
-1.05393, -1.374149, -3.162203, 1, 0.8470588, 0, 1,
-1.048905, 0.7007642, -1.129269, 1, 0.8509804, 0, 1,
-1.048333, 0.2062667, -0.8790133, 1, 0.8588235, 0, 1,
-1.045729, 0.3112402, -1.165032, 1, 0.8627451, 0, 1,
-1.029015, 1.632429, -0.7603356, 1, 0.8705882, 0, 1,
-1.020436, 0.5167152, -1.414376, 1, 0.8745098, 0, 1,
-1.009308, 0.4270433, -1.041746, 1, 0.8823529, 0, 1,
-1.00653, 0.6979141, -1.560679, 1, 0.8862745, 0, 1,
-1.005466, 0.3345409, -2.536691, 1, 0.8941177, 0, 1,
-1.003226, -0.6996228, -1.768266, 1, 0.8980392, 0, 1,
-1.002798, -1.586129, -3.585168, 1, 0.9058824, 0, 1,
-1.00127, 0.3901334, -1.205848, 1, 0.9137255, 0, 1,
-1.000182, 0.9505847, -0.1602486, 1, 0.9176471, 0, 1,
-0.9976104, 0.09324499, -0.2126387, 1, 0.9254902, 0, 1,
-0.9905254, -0.09684375, -0.7931249, 1, 0.9294118, 0, 1,
-0.989195, 1.836967, -2.476568, 1, 0.9372549, 0, 1,
-0.9840941, 0.2461737, -2.066447, 1, 0.9411765, 0, 1,
-0.9837967, 0.8665098, -0.1576027, 1, 0.9490196, 0, 1,
-0.9809318, 0.2001228, -1.330482, 1, 0.9529412, 0, 1,
-0.970865, 0.5923652, -0.962728, 1, 0.9607843, 0, 1,
-0.9538831, 0.1690843, 0.6046231, 1, 0.9647059, 0, 1,
-0.9523181, 0.6178156, -1.330215, 1, 0.972549, 0, 1,
-0.9498525, -0.6881676, -2.767125, 1, 0.9764706, 0, 1,
-0.9391436, -0.7884542, -2.569227, 1, 0.9843137, 0, 1,
-0.9387825, -0.7089155, -2.290344, 1, 0.9882353, 0, 1,
-0.9356518, -0.1851234, -0.6916151, 1, 0.9960784, 0, 1,
-0.9306995, -1.64805, -1.783929, 0.9960784, 1, 0, 1,
-0.9273348, -0.4927342, -2.252403, 0.9921569, 1, 0, 1,
-0.9214441, 0.848819, -0.6175653, 0.9843137, 1, 0, 1,
-0.9058158, -0.9902213, -2.249895, 0.9803922, 1, 0, 1,
-0.9042085, -0.1805056, -1.385539, 0.972549, 1, 0, 1,
-0.9014209, 0.217449, -0.3956601, 0.9686275, 1, 0, 1,
-0.8959191, 1.710444, -1.293868, 0.9607843, 1, 0, 1,
-0.8867107, -2.402547, -4.414662, 0.9568627, 1, 0, 1,
-0.8827997, 1.220998, -1.724163, 0.9490196, 1, 0, 1,
-0.8811269, 0.2715401, -0.08377779, 0.945098, 1, 0, 1,
-0.8704299, -0.2725299, -0.8781332, 0.9372549, 1, 0, 1,
-0.866476, 0.1011677, -2.640704, 0.9333333, 1, 0, 1,
-0.864557, -0.7497283, -3.346469, 0.9254902, 1, 0, 1,
-0.8629605, -2.331227, -3.702592, 0.9215686, 1, 0, 1,
-0.8619119, 0.121344, -0.8706903, 0.9137255, 1, 0, 1,
-0.8538098, 0.2085059, -0.1799798, 0.9098039, 1, 0, 1,
-0.8460454, 1.360271, -0.1435763, 0.9019608, 1, 0, 1,
-0.8403279, 1.032106, -2.732782, 0.8941177, 1, 0, 1,
-0.8280261, -1.033479, -4.44329, 0.8901961, 1, 0, 1,
-0.8267542, 1.306541, -0.1550497, 0.8823529, 1, 0, 1,
-0.8239526, -1.09673, -3.875274, 0.8784314, 1, 0, 1,
-0.8228334, 0.03539773, -1.968583, 0.8705882, 1, 0, 1,
-0.8159204, -0.3526681, -2.293164, 0.8666667, 1, 0, 1,
-0.8146057, 2.496303, -1.450074, 0.8588235, 1, 0, 1,
-0.8050444, 0.5235251, -0.04784538, 0.854902, 1, 0, 1,
-0.8027047, -0.05127716, -1.606371, 0.8470588, 1, 0, 1,
-0.7985058, 1.220796, -0.1393539, 0.8431373, 1, 0, 1,
-0.7909796, 1.408016, -0.8737799, 0.8352941, 1, 0, 1,
-0.7897924, -1.144083, -2.539707, 0.8313726, 1, 0, 1,
-0.789308, -0.225124, -0.6570573, 0.8235294, 1, 0, 1,
-0.7860456, -0.7765665, -0.3691537, 0.8196079, 1, 0, 1,
-0.7845966, 1.199392, 0.9635271, 0.8117647, 1, 0, 1,
-0.7762019, 1.612237, -1.449535, 0.8078431, 1, 0, 1,
-0.7759554, -2.335763, -5.593116, 0.8, 1, 0, 1,
-0.7712877, -1.511544, -1.315543, 0.7921569, 1, 0, 1,
-0.7653237, 0.7833292, -0.8272279, 0.7882353, 1, 0, 1,
-0.7648586, -1.159785, -1.952008, 0.7803922, 1, 0, 1,
-0.7618474, -0.8891397, -0.417583, 0.7764706, 1, 0, 1,
-0.7582294, 0.2264653, -1.835591, 0.7686275, 1, 0, 1,
-0.7580572, 0.3999852, -2.764425, 0.7647059, 1, 0, 1,
-0.7578716, 0.421833, -0.6246881, 0.7568628, 1, 0, 1,
-0.7569884, 1.169665, 0.2100717, 0.7529412, 1, 0, 1,
-0.7514169, 0.5803991, -0.9389682, 0.7450981, 1, 0, 1,
-0.7487745, 0.7492262, 0.2937061, 0.7411765, 1, 0, 1,
-0.7462278, 1.219778, 0.01260757, 0.7333333, 1, 0, 1,
-0.7451421, -0.7686306, -3.310701, 0.7294118, 1, 0, 1,
-0.7410669, 0.2419816, -1.320862, 0.7215686, 1, 0, 1,
-0.738739, 0.4028188, -1.127949, 0.7176471, 1, 0, 1,
-0.7361043, 1.121571, -0.1392582, 0.7098039, 1, 0, 1,
-0.7355149, -1.302765, -1.483592, 0.7058824, 1, 0, 1,
-0.7348174, 1.268513, 0.4924651, 0.6980392, 1, 0, 1,
-0.7343116, 1.111851, -0.4307282, 0.6901961, 1, 0, 1,
-0.7329396, -0.6735435, -2.343514, 0.6862745, 1, 0, 1,
-0.7247233, -0.4763354, -1.46604, 0.6784314, 1, 0, 1,
-0.7221832, 1.653811, -2.513689, 0.6745098, 1, 0, 1,
-0.7207508, -1.072163, -2.154342, 0.6666667, 1, 0, 1,
-0.7205454, -0.3124212, -3.059215, 0.6627451, 1, 0, 1,
-0.7189334, -1.14283, -1.595028, 0.654902, 1, 0, 1,
-0.7129897, -3.063963, -1.53785, 0.6509804, 1, 0, 1,
-0.7086527, -0.6196178, -2.986822, 0.6431373, 1, 0, 1,
-0.7035055, -0.7536148, -3.068286, 0.6392157, 1, 0, 1,
-0.7033905, -0.2321635, -2.51586, 0.6313726, 1, 0, 1,
-0.7001673, -1.510493, -3.655753, 0.627451, 1, 0, 1,
-0.6992613, 0.9648169, -1.694927, 0.6196079, 1, 0, 1,
-0.6992525, -0.1527535, -1.795429, 0.6156863, 1, 0, 1,
-0.6891209, -0.3382621, -1.878904, 0.6078432, 1, 0, 1,
-0.6857699, -0.4486239, -1.2924, 0.6039216, 1, 0, 1,
-0.6847709, 0.7380727, -0.3105163, 0.5960785, 1, 0, 1,
-0.6831892, 0.179988, -1.922696, 0.5882353, 1, 0, 1,
-0.6825521, 0.3455849, -1.131139, 0.5843138, 1, 0, 1,
-0.6794253, -0.2148862, -2.559106, 0.5764706, 1, 0, 1,
-0.6715444, -0.8277636, -4.324748, 0.572549, 1, 0, 1,
-0.6689619, 1.77922, 0.8993027, 0.5647059, 1, 0, 1,
-0.6669653, -0.5725601, -1.639977, 0.5607843, 1, 0, 1,
-0.6632608, 1.061893, -1.418711, 0.5529412, 1, 0, 1,
-0.6568315, -0.1492959, -1.657552, 0.5490196, 1, 0, 1,
-0.651108, -0.4538881, -2.907333, 0.5411765, 1, 0, 1,
-0.6477219, -0.07082861, -0.7088143, 0.5372549, 1, 0, 1,
-0.6410946, 2.191308, -0.1627794, 0.5294118, 1, 0, 1,
-0.6371316, 0.399763, -2.031681, 0.5254902, 1, 0, 1,
-0.6350866, -0.1026274, -0.9741735, 0.5176471, 1, 0, 1,
-0.6292496, 1.010934, 1.876832, 0.5137255, 1, 0, 1,
-0.6206062, -0.9783245, -2.179844, 0.5058824, 1, 0, 1,
-0.6200909, -0.4944821, -4.04949, 0.5019608, 1, 0, 1,
-0.6171806, 0.03143609, -2.477623, 0.4941176, 1, 0, 1,
-0.6170095, -0.89214, -1.786285, 0.4862745, 1, 0, 1,
-0.6160653, 0.07348631, -2.203478, 0.4823529, 1, 0, 1,
-0.6145326, -1.244724, -3.800624, 0.4745098, 1, 0, 1,
-0.6121021, -0.1280535, -1.303774, 0.4705882, 1, 0, 1,
-0.6084521, -1.274337, -3.726328, 0.4627451, 1, 0, 1,
-0.6078309, -0.9363091, -3.630158, 0.4588235, 1, 0, 1,
-0.6072231, -1.17811, -3.352972, 0.4509804, 1, 0, 1,
-0.606569, -1.20767, -2.507495, 0.4470588, 1, 0, 1,
-0.6045552, 0.646943, 0.2265398, 0.4392157, 1, 0, 1,
-0.5914734, -1.723752, -3.60011, 0.4352941, 1, 0, 1,
-0.587369, 1.064652, -0.9867806, 0.427451, 1, 0, 1,
-0.586482, -0.9795533, -2.656319, 0.4235294, 1, 0, 1,
-0.5831807, 0.1330525, -0.4581493, 0.4156863, 1, 0, 1,
-0.580985, -1.01264, -2.545448, 0.4117647, 1, 0, 1,
-0.5782864, 0.5186322, -0.6185901, 0.4039216, 1, 0, 1,
-0.5765164, -2.281876, -3.532769, 0.3960784, 1, 0, 1,
-0.5703444, 2.757613, -1.170478, 0.3921569, 1, 0, 1,
-0.5693026, -2.000746, -1.407274, 0.3843137, 1, 0, 1,
-0.5587926, 0.9414156, -0.05003492, 0.3803922, 1, 0, 1,
-0.5558926, -0.05553882, -0.3209892, 0.372549, 1, 0, 1,
-0.5549079, 1.663799, 0.3831086, 0.3686275, 1, 0, 1,
-0.5545815, 1.474927, -0.6669216, 0.3607843, 1, 0, 1,
-0.5540497, 0.560621, -0.2958245, 0.3568628, 1, 0, 1,
-0.5463266, -0.9617044, -0.09018977, 0.3490196, 1, 0, 1,
-0.5451863, -0.7102128, -2.286046, 0.345098, 1, 0, 1,
-0.538078, -0.4724752, -3.397449, 0.3372549, 1, 0, 1,
-0.5364428, -0.1919161, -2.732154, 0.3333333, 1, 0, 1,
-0.5297659, 0.7397267, 1.222265, 0.3254902, 1, 0, 1,
-0.5279875, -1.056014, -2.293885, 0.3215686, 1, 0, 1,
-0.5275499, 1.215996, -0.3251244, 0.3137255, 1, 0, 1,
-0.5232385, 1.022962, -2.343974, 0.3098039, 1, 0, 1,
-0.5174652, 1.37282, -1.191221, 0.3019608, 1, 0, 1,
-0.5163163, -0.5034133, -2.934933, 0.2941177, 1, 0, 1,
-0.5111442, -0.3437553, -3.140489, 0.2901961, 1, 0, 1,
-0.5091193, 0.8833662, -0.7568849, 0.282353, 1, 0, 1,
-0.508034, 0.5698662, 0.4315682, 0.2784314, 1, 0, 1,
-0.5053967, -0.9950503, -3.724265, 0.2705882, 1, 0, 1,
-0.505012, 1.708575, 0.2968433, 0.2666667, 1, 0, 1,
-0.5041817, -0.9516987, -1.25061, 0.2588235, 1, 0, 1,
-0.4996632, -0.1026401, -1.215769, 0.254902, 1, 0, 1,
-0.4965494, 1.592403, 1.94458, 0.2470588, 1, 0, 1,
-0.4932026, 1.726887, -0.3004551, 0.2431373, 1, 0, 1,
-0.4903285, 0.2032148, 1.077784, 0.2352941, 1, 0, 1,
-0.4898983, 0.2595993, -0.419989, 0.2313726, 1, 0, 1,
-0.4878233, 0.3982934, -1.179461, 0.2235294, 1, 0, 1,
-0.4790449, 0.6195947, -1.402028, 0.2196078, 1, 0, 1,
-0.4789585, -0.4274868, -3.287785, 0.2117647, 1, 0, 1,
-0.4789374, 0.07127205, -0.2793542, 0.2078431, 1, 0, 1,
-0.4764113, 0.7129769, -0.3013276, 0.2, 1, 0, 1,
-0.4752211, -0.397862, -3.317664, 0.1921569, 1, 0, 1,
-0.4743439, 0.2304712, -0.2352969, 0.1882353, 1, 0, 1,
-0.4717216, 1.07137, -1.396239, 0.1803922, 1, 0, 1,
-0.4703818, 1.463584, -0.4602514, 0.1764706, 1, 0, 1,
-0.4605395, 0.01172679, -2.324002, 0.1686275, 1, 0, 1,
-0.4560727, -0.6840176, -1.883904, 0.1647059, 1, 0, 1,
-0.4556413, 0.2962157, 1.130168, 0.1568628, 1, 0, 1,
-0.4534683, 0.3413334, -1.740492, 0.1529412, 1, 0, 1,
-0.452706, 0.7600113, -0.1187311, 0.145098, 1, 0, 1,
-0.4524035, 0.6838725, -0.2267292, 0.1411765, 1, 0, 1,
-0.4519494, -0.6111597, -3.803047, 0.1333333, 1, 0, 1,
-0.4516315, 2.935206, -1.800603, 0.1294118, 1, 0, 1,
-0.4471304, -1.655252, -4.631028, 0.1215686, 1, 0, 1,
-0.4462596, -1.034096, -2.336702, 0.1176471, 1, 0, 1,
-0.4421685, 1.226841, 0.003319422, 0.1098039, 1, 0, 1,
-0.441923, -0.4244835, -2.340929, 0.1058824, 1, 0, 1,
-0.4391577, -1.017168, -3.220749, 0.09803922, 1, 0, 1,
-0.4362902, 1.945809, -3.140633, 0.09019608, 1, 0, 1,
-0.4337882, -0.2762221, -2.820742, 0.08627451, 1, 0, 1,
-0.4336415, -0.6003891, -2.368238, 0.07843138, 1, 0, 1,
-0.4302331, -1.168818, -4.08746, 0.07450981, 1, 0, 1,
-0.426158, 2.192586, -0.6714224, 0.06666667, 1, 0, 1,
-0.4222254, 1.374905, 0.1588251, 0.0627451, 1, 0, 1,
-0.4211173, -0.06648692, -2.40122, 0.05490196, 1, 0, 1,
-0.4192531, 0.7421845, -0.6263132, 0.05098039, 1, 0, 1,
-0.4188841, -1.593707, -3.580916, 0.04313726, 1, 0, 1,
-0.4153841, 0.6789585, -0.2067586, 0.03921569, 1, 0, 1,
-0.4133107, -2.81914, -3.958004, 0.03137255, 1, 0, 1,
-0.4026111, 0.659663, 0.01436875, 0.02745098, 1, 0, 1,
-0.4001211, -0.374007, -3.287083, 0.01960784, 1, 0, 1,
-0.3984842, 0.3391255, -0.1199479, 0.01568628, 1, 0, 1,
-0.3969167, 0.6152977, -1.881249, 0.007843138, 1, 0, 1,
-0.3962699, 0.1888293, -1.436088, 0.003921569, 1, 0, 1,
-0.3944384, -1.498302, -3.249524, 0, 1, 0.003921569, 1,
-0.3923602, -0.4624435, -2.133338, 0, 1, 0.01176471, 1,
-0.3899003, -1.282154, -4.132086, 0, 1, 0.01568628, 1,
-0.3892172, -0.01029595, -0.8106889, 0, 1, 0.02352941, 1,
-0.3887907, 0.6637543, -1.703745, 0, 1, 0.02745098, 1,
-0.3826501, 1.391002, -0.6242641, 0, 1, 0.03529412, 1,
-0.3799722, 0.6167967, -1.414877, 0, 1, 0.03921569, 1,
-0.3776568, 0.6814225, -0.7674161, 0, 1, 0.04705882, 1,
-0.376233, -1.525167, -2.131684, 0, 1, 0.05098039, 1,
-0.3744316, 0.6652855, -1.525878, 0, 1, 0.05882353, 1,
-0.3694742, 0.4978804, -0.2483953, 0, 1, 0.0627451, 1,
-0.3681139, 0.6409802, -2.967197, 0, 1, 0.07058824, 1,
-0.364796, 1.037092, -1.090536, 0, 1, 0.07450981, 1,
-0.3621751, -0.6879627, -2.726837, 0, 1, 0.08235294, 1,
-0.3552831, -0.005810825, -2.490483, 0, 1, 0.08627451, 1,
-0.3531478, -0.8551173, -3.1601, 0, 1, 0.09411765, 1,
-0.3501203, -0.3206575, -0.9072835, 0, 1, 0.1019608, 1,
-0.3481795, 0.6024184, 0.6577837, 0, 1, 0.1058824, 1,
-0.3444726, 1.02832, -1.930344, 0, 1, 0.1137255, 1,
-0.3400368, 0.09218629, -1.702349, 0, 1, 0.1176471, 1,
-0.339901, -0.5665986, -2.373808, 0, 1, 0.1254902, 1,
-0.3341197, 0.2467479, 1.051726, 0, 1, 0.1294118, 1,
-0.3278476, 1.384297, -1.765437, 0, 1, 0.1372549, 1,
-0.3267604, 1.605021, -1.153411, 0, 1, 0.1411765, 1,
-0.3232344, -1.521982, -1.970884, 0, 1, 0.1490196, 1,
-0.3217489, -0.4138029, -3.098124, 0, 1, 0.1529412, 1,
-0.3214386, 0.3195036, -1.000211, 0, 1, 0.1607843, 1,
-0.3192874, 0.7920527, -0.352328, 0, 1, 0.1647059, 1,
-0.3162383, 1.256606, 1.197852, 0, 1, 0.172549, 1,
-0.3156063, 2.059386, -0.9950793, 0, 1, 0.1764706, 1,
-0.3106956, -0.2964666, -1.537509, 0, 1, 0.1843137, 1,
-0.3073355, -1.313539, -3.784038, 0, 1, 0.1882353, 1,
-0.3063255, 0.5802961, -0.6722597, 0, 1, 0.1960784, 1,
-0.3034661, -1.078637, -3.444106, 0, 1, 0.2039216, 1,
-0.301785, -0.05869096, -2.830861, 0, 1, 0.2078431, 1,
-0.3017444, -0.5874717, -2.359534, 0, 1, 0.2156863, 1,
-0.2992852, -0.4205063, -2.812351, 0, 1, 0.2196078, 1,
-0.2991492, 0.834604, -1.689988, 0, 1, 0.227451, 1,
-0.2938845, 2.031237, -0.7544789, 0, 1, 0.2313726, 1,
-0.2910578, -0.212758, -1.799032, 0, 1, 0.2392157, 1,
-0.2887821, 1.226966, -0.2426344, 0, 1, 0.2431373, 1,
-0.2883919, 1.241835, 0.05384737, 0, 1, 0.2509804, 1,
-0.2843669, 1.481699, -0.2038752, 0, 1, 0.254902, 1,
-0.2828446, -2.1045, -2.009132, 0, 1, 0.2627451, 1,
-0.2817165, -0.09805182, -1.138363, 0, 1, 0.2666667, 1,
-0.2806364, 0.5365008, -0.8594347, 0, 1, 0.2745098, 1,
-0.2784175, -0.5517927, -3.106445, 0, 1, 0.2784314, 1,
-0.2745831, 1.825833, 0.01417575, 0, 1, 0.2862745, 1,
-0.2737455, -1.701782, -2.564217, 0, 1, 0.2901961, 1,
-0.2650537, 1.681914, 0.2450875, 0, 1, 0.2980392, 1,
-0.2606572, -0.2795165, -1.382064, 0, 1, 0.3058824, 1,
-0.2591145, 0.2032749, -0.5992514, 0, 1, 0.3098039, 1,
-0.2566484, 1.251926, -0.4965942, 0, 1, 0.3176471, 1,
-0.2554706, 0.3254123, -0.8304669, 0, 1, 0.3215686, 1,
-0.2546085, 0.06400359, -2.595469, 0, 1, 0.3294118, 1,
-0.2536875, -0.3640004, -3.626588, 0, 1, 0.3333333, 1,
-0.2513531, 1.114235, -1.355881, 0, 1, 0.3411765, 1,
-0.2456994, 2.148053, 0.6237658, 0, 1, 0.345098, 1,
-0.2379647, -0.8015954, -2.453851, 0, 1, 0.3529412, 1,
-0.2231451, 0.1690205, -0.3330925, 0, 1, 0.3568628, 1,
-0.2229983, 0.2237895, 1.082007, 0, 1, 0.3647059, 1,
-0.2206511, 0.467771, 2.132424, 0, 1, 0.3686275, 1,
-0.215171, 0.3061714, 0.6531886, 0, 1, 0.3764706, 1,
-0.2141081, 0.6217955, -2.507261, 0, 1, 0.3803922, 1,
-0.2129028, -0.1806781, -3.285941, 0, 1, 0.3882353, 1,
-0.212027, 0.1338184, -0.7862954, 0, 1, 0.3921569, 1,
-0.2113121, -0.1000606, 1.373611, 0, 1, 0.4, 1,
-0.2078919, 0.5808648, -1.803809, 0, 1, 0.4078431, 1,
-0.2032187, 2.982971, 0.3353467, 0, 1, 0.4117647, 1,
-0.2019926, 0.1211808, -1.511585, 0, 1, 0.4196078, 1,
-0.201939, 0.6640842, -1.045377, 0, 1, 0.4235294, 1,
-0.2006177, -1.064949, -3.013108, 0, 1, 0.4313726, 1,
-0.2001099, 0.9125589, -0.1065732, 0, 1, 0.4352941, 1,
-0.1908356, -1.556991, -1.997986, 0, 1, 0.4431373, 1,
-0.189821, -0.4616023, -3.065429, 0, 1, 0.4470588, 1,
-0.1890449, -0.2437103, -2.212181, 0, 1, 0.454902, 1,
-0.1827539, 0.6256003, 1.815227, 0, 1, 0.4588235, 1,
-0.1810156, -1.724079, -2.762545, 0, 1, 0.4666667, 1,
-0.1790339, -0.878234, -3.951598, 0, 1, 0.4705882, 1,
-0.1749326, -0.08135252, -3.254579, 0, 1, 0.4784314, 1,
-0.1747691, -0.351318, -3.473572, 0, 1, 0.4823529, 1,
-0.1715184, 1.048183, -0.7034652, 0, 1, 0.4901961, 1,
-0.1640697, 1.406035, -0.637058, 0, 1, 0.4941176, 1,
-0.1621174, -0.5404, -2.350028, 0, 1, 0.5019608, 1,
-0.157039, 1.348094, 0.6638776, 0, 1, 0.509804, 1,
-0.1561985, -1.877118, -2.250318, 0, 1, 0.5137255, 1,
-0.1551538, 0.6604548, -1.359496, 0, 1, 0.5215687, 1,
-0.155099, -1.575478, -2.825013, 0, 1, 0.5254902, 1,
-0.1541982, -0.05218623, -2.138688, 0, 1, 0.5333334, 1,
-0.1540814, 0.04732726, -0.8216757, 0, 1, 0.5372549, 1,
-0.1444989, -1.04885, -2.959461, 0, 1, 0.5450981, 1,
-0.1412063, -0.3023644, -2.182619, 0, 1, 0.5490196, 1,
-0.1379126, 0.871044, -1.021086, 0, 1, 0.5568628, 1,
-0.1367359, -1.002788, -3.559837, 0, 1, 0.5607843, 1,
-0.1289883, -0.2335077, -4.563397, 0, 1, 0.5686275, 1,
-0.1289064, 0.6965216, -2.649782, 0, 1, 0.572549, 1,
-0.1277411, 0.7659436, -2.162103, 0, 1, 0.5803922, 1,
-0.126514, 0.4372005, -0.6775495, 0, 1, 0.5843138, 1,
-0.1254716, -0.9194992, -1.343719, 0, 1, 0.5921569, 1,
-0.1239868, 0.4435634, -0.1375906, 0, 1, 0.5960785, 1,
-0.1231437, -2.900105, -1.809578, 0, 1, 0.6039216, 1,
-0.1197602, 1.236083, 0.4113569, 0, 1, 0.6117647, 1,
-0.1196259, 0.3371917, -1.288838, 0, 1, 0.6156863, 1,
-0.1195971, -0.6133338, -2.16007, 0, 1, 0.6235294, 1,
-0.1192308, -0.3027683, 0.09725085, 0, 1, 0.627451, 1,
-0.1188155, -1.276902, -6.00967, 0, 1, 0.6352941, 1,
-0.1168253, -0.1028552, -0.7856978, 0, 1, 0.6392157, 1,
-0.1168183, -0.9792467, -2.180971, 0, 1, 0.6470588, 1,
-0.1112147, 1.052054, -0.2174928, 0, 1, 0.6509804, 1,
-0.107887, -1.444686, -2.606398, 0, 1, 0.6588235, 1,
-0.1054751, 1.253163, 0.2777722, 0, 1, 0.6627451, 1,
-0.1026364, 0.02363656, -0.3159404, 0, 1, 0.6705883, 1,
-0.09408239, -0.1994939, -2.17647, 0, 1, 0.6745098, 1,
-0.09375057, 0.5253039, -0.2279849, 0, 1, 0.682353, 1,
-0.08598579, -2.539594, -3.338265, 0, 1, 0.6862745, 1,
-0.08533849, 0.264983, -0.04036455, 0, 1, 0.6941177, 1,
-0.08525827, 0.8148806, -1.537978, 0, 1, 0.7019608, 1,
-0.0844589, 0.5187674, -1.917775, 0, 1, 0.7058824, 1,
-0.07849164, 1.929529, -0.5662816, 0, 1, 0.7137255, 1,
-0.0769058, 0.9920163, -1.12563, 0, 1, 0.7176471, 1,
-0.07607673, -1.174384, -3.956023, 0, 1, 0.7254902, 1,
-0.0759555, -1.402368, -3.987984, 0, 1, 0.7294118, 1,
-0.07460387, 0.3042199, -1.937955, 0, 1, 0.7372549, 1,
-0.07288073, -1.697855, -4.377811, 0, 1, 0.7411765, 1,
-0.06780016, -0.6827387, -4.595485, 0, 1, 0.7490196, 1,
-0.0670749, -0.02542821, -1.652443, 0, 1, 0.7529412, 1,
-0.06675037, 0.4491592, -0.2021995, 0, 1, 0.7607843, 1,
-0.06179754, 0.1988589, -0.1176089, 0, 1, 0.7647059, 1,
-0.06057201, 1.992857, -1.030074, 0, 1, 0.772549, 1,
-0.06013091, 0.4566284, 0.7426494, 0, 1, 0.7764706, 1,
-0.0582607, 1.491488, 0.05211041, 0, 1, 0.7843137, 1,
-0.05696099, 0.4966551, 0.7659132, 0, 1, 0.7882353, 1,
-0.05010558, -1.347051, -3.193413, 0, 1, 0.7960784, 1,
-0.04823349, 0.9580335, 0.392841, 0, 1, 0.8039216, 1,
-0.04276574, -1.602727, -3.13459, 0, 1, 0.8078431, 1,
-0.03805029, -0.546231, -2.642676, 0, 1, 0.8156863, 1,
-0.036526, 0.8797131, -0.7344638, 0, 1, 0.8196079, 1,
-0.03120039, 0.8736796, -0.2006128, 0, 1, 0.827451, 1,
-0.03030499, 0.2695566, -1.208719, 0, 1, 0.8313726, 1,
-0.02940078, -1.403901, -3.501804, 0, 1, 0.8392157, 1,
-0.02819796, 0.5214629, 1.739621, 0, 1, 0.8431373, 1,
-0.02597389, -0.9019566, -2.049065, 0, 1, 0.8509804, 1,
-0.02363774, 0.5433017, -0.87731, 0, 1, 0.854902, 1,
-0.01886483, 0.8273315, 0.2957108, 0, 1, 0.8627451, 1,
-0.01022512, 0.169476, 0.5003778, 0, 1, 0.8666667, 1,
-0.009867554, -0.1344129, -3.527798, 0, 1, 0.8745098, 1,
-0.007929487, -0.7187501, -2.873075, 0, 1, 0.8784314, 1,
-0.007881434, 0.2940061, 0.3001805, 0, 1, 0.8862745, 1,
-0.003583853, 0.5228457, -0.7836199, 0, 1, 0.8901961, 1,
0.005616791, 0.04523686, 0.6037771, 0, 1, 0.8980392, 1,
0.007225289, -1.633426, 2.350909, 0, 1, 0.9058824, 1,
0.007547824, -1.013274, 4.555951, 0, 1, 0.9098039, 1,
0.008336731, -0.1691799, 3.552923, 0, 1, 0.9176471, 1,
0.01111898, -0.4835803, 3.923163, 0, 1, 0.9215686, 1,
0.01178832, 2.005575, -0.123337, 0, 1, 0.9294118, 1,
0.01194116, 0.9016459, -0.1513568, 0, 1, 0.9333333, 1,
0.0122187, 1.626471, -1.327023, 0, 1, 0.9411765, 1,
0.01224266, 0.606502, -0.4791725, 0, 1, 0.945098, 1,
0.01321819, -0.7606257, 1.912484, 0, 1, 0.9529412, 1,
0.01417677, -0.3927761, 4.591121, 0, 1, 0.9568627, 1,
0.01878248, -0.01203173, 3.330021, 0, 1, 0.9647059, 1,
0.01897555, -0.1177232, 2.233559, 0, 1, 0.9686275, 1,
0.01908616, 1.999543, 0.9670552, 0, 1, 0.9764706, 1,
0.01931672, -2.023494, 2.964765, 0, 1, 0.9803922, 1,
0.02006949, 1.271797, 0.02827939, 0, 1, 0.9882353, 1,
0.02150909, 0.4743783, 0.07221638, 0, 1, 0.9921569, 1,
0.02933908, -0.7834157, 5.449587, 0, 1, 1, 1,
0.03429315, 0.1042685, 0.9474406, 0, 0.9921569, 1, 1,
0.03518393, 1.276413, 0.8374093, 0, 0.9882353, 1, 1,
0.03868949, -1.284757, 2.41703, 0, 0.9803922, 1, 1,
0.04358934, 0.5684498, -0.02285069, 0, 0.9764706, 1, 1,
0.04818162, 1.608942, -1.346149, 0, 0.9686275, 1, 1,
0.0485285, -0.08630552, 0.2513707, 0, 0.9647059, 1, 1,
0.04958361, -0.1877342, 1.336025, 0, 0.9568627, 1, 1,
0.05514736, -2.381166, 3.645058, 0, 0.9529412, 1, 1,
0.05663202, -1.175946, 2.887323, 0, 0.945098, 1, 1,
0.05714925, -0.2819076, 2.994902, 0, 0.9411765, 1, 1,
0.06316049, -0.3296157, 2.718649, 0, 0.9333333, 1, 1,
0.06959148, 0.03625143, 0.9200838, 0, 0.9294118, 1, 1,
0.06970983, 1.043507, -1.23341, 0, 0.9215686, 1, 1,
0.07454101, -0.5245407, 0.5750176, 0, 0.9176471, 1, 1,
0.0748544, 0.1421739, 0.4251958, 0, 0.9098039, 1, 1,
0.0755082, 0.3968991, 0.4675223, 0, 0.9058824, 1, 1,
0.07982198, -0.2829189, 1.37365, 0, 0.8980392, 1, 1,
0.08136976, -0.2853738, 4.216619, 0, 0.8901961, 1, 1,
0.0922962, 0.7655979, -0.9914403, 0, 0.8862745, 1, 1,
0.09242228, -1.763085, 2.077332, 0, 0.8784314, 1, 1,
0.09273069, 0.2705646, -0.3824149, 0, 0.8745098, 1, 1,
0.09387963, -1.473301, 3.583403, 0, 0.8666667, 1, 1,
0.1040215, -0.3543289, 4.85771, 0, 0.8627451, 1, 1,
0.105756, -2.254735, 2.32177, 0, 0.854902, 1, 1,
0.1090798, -1.083982, 3.265382, 0, 0.8509804, 1, 1,
0.1100043, 1.2437, -1.785353, 0, 0.8431373, 1, 1,
0.1108818, -1.348455, 4.206535, 0, 0.8392157, 1, 1,
0.111704, -0.2031633, 3.920067, 0, 0.8313726, 1, 1,
0.1143066, 1.948149, 1.165128, 0, 0.827451, 1, 1,
0.1165741, 0.4078153, 1.994595, 0, 0.8196079, 1, 1,
0.1175918, 1.720328, -0.1321266, 0, 0.8156863, 1, 1,
0.1229161, -0.9914433, 2.669237, 0, 0.8078431, 1, 1,
0.1249766, -0.5391312, 3.175695, 0, 0.8039216, 1, 1,
0.1316461, -0.07600872, 2.339909, 0, 0.7960784, 1, 1,
0.1320029, -0.03023652, 1.083423, 0, 0.7882353, 1, 1,
0.1326292, 0.8505009, 0.7765819, 0, 0.7843137, 1, 1,
0.1372759, 2.762651, 0.04999248, 0, 0.7764706, 1, 1,
0.1374362, -0.1574017, 4.524887, 0, 0.772549, 1, 1,
0.1379555, -1.22978, 2.940717, 0, 0.7647059, 1, 1,
0.1388045, -0.1811315, 1.526311, 0, 0.7607843, 1, 1,
0.1390847, 0.718537, 1.59657, 0, 0.7529412, 1, 1,
0.1409853, -2.152599, 2.292523, 0, 0.7490196, 1, 1,
0.1413662, 0.8069471, 0.9435063, 0, 0.7411765, 1, 1,
0.1431164, 0.1326768, 1.042377, 0, 0.7372549, 1, 1,
0.144248, 1.041583, 1.682399, 0, 0.7294118, 1, 1,
0.1447728, 0.9629724, 1.350411, 0, 0.7254902, 1, 1,
0.1492794, -0.8870311, 0.873327, 0, 0.7176471, 1, 1,
0.1493004, 0.3491445, 2.654061, 0, 0.7137255, 1, 1,
0.1537224, -0.009656802, 2.346132, 0, 0.7058824, 1, 1,
0.1546884, 0.662757, 2.630892, 0, 0.6980392, 1, 1,
0.1551494, 1.294338, 0.5849046, 0, 0.6941177, 1, 1,
0.1614895, 1.556991, 0.2795679, 0, 0.6862745, 1, 1,
0.1615567, 1.559314, 0.8157989, 0, 0.682353, 1, 1,
0.1616776, -0.8944115, 2.434754, 0, 0.6745098, 1, 1,
0.1674113, 0.8988768, -1.0253, 0, 0.6705883, 1, 1,
0.1679048, -1.003091, 3.255297, 0, 0.6627451, 1, 1,
0.1728702, 0.4218252, 0.6004058, 0, 0.6588235, 1, 1,
0.1731457, 0.08049808, 2.358957, 0, 0.6509804, 1, 1,
0.177931, -0.1747483, 2.407389, 0, 0.6470588, 1, 1,
0.1787911, -1.437858, 2.576878, 0, 0.6392157, 1, 1,
0.1807368, -0.6068223, 1.51219, 0, 0.6352941, 1, 1,
0.1853717, -0.2648961, 3.690835, 0, 0.627451, 1, 1,
0.1895178, 0.4263186, 0.1858156, 0, 0.6235294, 1, 1,
0.1922742, -0.0726036, 2.147762, 0, 0.6156863, 1, 1,
0.1960937, -2.7864, 2.83047, 0, 0.6117647, 1, 1,
0.2008259, 0.4131979, 0.5953812, 0, 0.6039216, 1, 1,
0.2030843, 1.65363, 1.409796, 0, 0.5960785, 1, 1,
0.2031827, -0.2867226, 3.895152, 0, 0.5921569, 1, 1,
0.203971, 0.4398841, 1.856102, 0, 0.5843138, 1, 1,
0.2048389, 0.6663983, -1.341164, 0, 0.5803922, 1, 1,
0.2079018, 0.8022642, -1.543281, 0, 0.572549, 1, 1,
0.2106301, 0.4527667, 1.292115, 0, 0.5686275, 1, 1,
0.2159012, -0.9879453, 3.580844, 0, 0.5607843, 1, 1,
0.2177329, -1.508035, 2.600531, 0, 0.5568628, 1, 1,
0.2191276, -1.19957, 2.592283, 0, 0.5490196, 1, 1,
0.2194218, -0.939988, 1.949376, 0, 0.5450981, 1, 1,
0.222902, -0.05870418, 1.442032, 0, 0.5372549, 1, 1,
0.2243902, 1.096042, -2.082424, 0, 0.5333334, 1, 1,
0.2256324, -0.9120854, 3.459925, 0, 0.5254902, 1, 1,
0.2259383, 0.3118311, 2.398562, 0, 0.5215687, 1, 1,
0.2274161, 0.6111951, 0.2251294, 0, 0.5137255, 1, 1,
0.2320281, -0.6031178, 3.544214, 0, 0.509804, 1, 1,
0.2320408, 0.1177557, 0.557656, 0, 0.5019608, 1, 1,
0.2346161, -0.0560026, -0.1297284, 0, 0.4941176, 1, 1,
0.2371838, -0.2721476, 2.657983, 0, 0.4901961, 1, 1,
0.238434, 1.272384, -0.9782597, 0, 0.4823529, 1, 1,
0.2399553, -0.5282038, 1.748501, 0, 0.4784314, 1, 1,
0.2429395, 0.03993424, 3.1004, 0, 0.4705882, 1, 1,
0.2435692, 0.8387082, 1.561522, 0, 0.4666667, 1, 1,
0.2495996, -0.7874188, 3.049177, 0, 0.4588235, 1, 1,
0.2514993, -1.212238, 3.648832, 0, 0.454902, 1, 1,
0.2515306, -1.26646, 1.778387, 0, 0.4470588, 1, 1,
0.2531618, 1.508498, 0.3104007, 0, 0.4431373, 1, 1,
0.2538569, -0.9655557, 4.610933, 0, 0.4352941, 1, 1,
0.2541234, -0.1330109, 0.7182172, 0, 0.4313726, 1, 1,
0.2560188, -0.3788779, 3.0249, 0, 0.4235294, 1, 1,
0.2561539, 0.09741435, 0.4968444, 0, 0.4196078, 1, 1,
0.257919, 0.07009911, 2.086301, 0, 0.4117647, 1, 1,
0.2597797, -0.9540882, 3.132474, 0, 0.4078431, 1, 1,
0.2629548, 0.1234434, 1.648757, 0, 0.4, 1, 1,
0.2678562, 0.990243, 0.2636993, 0, 0.3921569, 1, 1,
0.2723661, 0.7667664, 0.7333515, 0, 0.3882353, 1, 1,
0.2733446, -1.525619, 3.043453, 0, 0.3803922, 1, 1,
0.2787485, -1.057917, 1.660093, 0, 0.3764706, 1, 1,
0.2794812, -0.4737507, 2.197071, 0, 0.3686275, 1, 1,
0.2796405, -0.5285359, 1.600695, 0, 0.3647059, 1, 1,
0.281686, -0.8380009, 2.743478, 0, 0.3568628, 1, 1,
0.2820773, 0.5109545, -0.7309964, 0, 0.3529412, 1, 1,
0.2856774, 0.8163487, 0.1338022, 0, 0.345098, 1, 1,
0.2883897, -0.2350243, 4.032084, 0, 0.3411765, 1, 1,
0.2911765, -1.167096, 4.757164, 0, 0.3333333, 1, 1,
0.2960088, -0.2843462, 2.689579, 0, 0.3294118, 1, 1,
0.2985174, -0.574446, 2.131318, 0, 0.3215686, 1, 1,
0.3016376, 0.2656713, 1.992745, 0, 0.3176471, 1, 1,
0.302391, -0.9973391, 2.95549, 0, 0.3098039, 1, 1,
0.3115841, 0.9955463, 1.700923, 0, 0.3058824, 1, 1,
0.3209249, 0.1246845, -0.3190925, 0, 0.2980392, 1, 1,
0.3226803, -0.01577178, 0.6203242, 0, 0.2901961, 1, 1,
0.3261248, 0.5115104, 0.6660045, 0, 0.2862745, 1, 1,
0.3280559, -0.784107, 0.9957523, 0, 0.2784314, 1, 1,
0.328325, 0.452415, 1.368244, 0, 0.2745098, 1, 1,
0.3349674, -0.4280771, 3.298026, 0, 0.2666667, 1, 1,
0.3392807, 0.544902, -0.4499644, 0, 0.2627451, 1, 1,
0.3411659, 0.5662714, -0.05468481, 0, 0.254902, 1, 1,
0.3480673, -1.258902, 3.973322, 0, 0.2509804, 1, 1,
0.3537875, 0.978747, -1.302663, 0, 0.2431373, 1, 1,
0.375093, 1.469645, -1.399812, 0, 0.2392157, 1, 1,
0.3761357, 0.3113757, 1.359171, 0, 0.2313726, 1, 1,
0.3791794, 0.558377, -0.9680789, 0, 0.227451, 1, 1,
0.3805445, 1.462734, -2.004257, 0, 0.2196078, 1, 1,
0.3819498, -1.673124, 1.197079, 0, 0.2156863, 1, 1,
0.383255, -1.151229, 2.57923, 0, 0.2078431, 1, 1,
0.389713, -0.26115, 1.329882, 0, 0.2039216, 1, 1,
0.3897792, 0.8204629, 1.242757, 0, 0.1960784, 1, 1,
0.3946997, -1.015176, 3.872779, 0, 0.1882353, 1, 1,
0.3953617, -1.762046, 3.282697, 0, 0.1843137, 1, 1,
0.3980832, 1.507505, 0.6538439, 0, 0.1764706, 1, 1,
0.3981886, -0.4195162, 4.831404, 0, 0.172549, 1, 1,
0.3982136, 0.04170247, 1.521623, 0, 0.1647059, 1, 1,
0.3989814, -0.8959661, 1.739819, 0, 0.1607843, 1, 1,
0.3995997, -1.318314, 2.878897, 0, 0.1529412, 1, 1,
0.4000925, 0.5127264, -0.95266, 0, 0.1490196, 1, 1,
0.4035859, -0.1529954, 1.72612, 0, 0.1411765, 1, 1,
0.4039106, 1.383693, -1.779272, 0, 0.1372549, 1, 1,
0.4044935, 0.07921793, 0.688311, 0, 0.1294118, 1, 1,
0.4058575, -0.7102182, 2.628237, 0, 0.1254902, 1, 1,
0.4064631, -0.6233162, 2.078269, 0, 0.1176471, 1, 1,
0.406775, -0.1192515, 1.746974, 0, 0.1137255, 1, 1,
0.4071499, -0.2497971, 2.465234, 0, 0.1058824, 1, 1,
0.4092957, 1.397488, 2.140682, 0, 0.09803922, 1, 1,
0.4111333, -0.6308425, 1.788558, 0, 0.09411765, 1, 1,
0.4125178, -1.165144, 3.624812, 0, 0.08627451, 1, 1,
0.4161187, 0.8406454, 2.700222, 0, 0.08235294, 1, 1,
0.4164844, -0.8287808, 3.840905, 0, 0.07450981, 1, 1,
0.4186092, -1.895828, 4.611737, 0, 0.07058824, 1, 1,
0.4194523, -0.5634964, 2.515388, 0, 0.0627451, 1, 1,
0.420374, -0.2295314, 2.31728, 0, 0.05882353, 1, 1,
0.4208617, -0.5633239, 0.3325911, 0, 0.05098039, 1, 1,
0.4236784, 0.07879951, 1.979388, 0, 0.04705882, 1, 1,
0.4241247, -0.2357887, 2.278776, 0, 0.03921569, 1, 1,
0.4285738, -0.3280221, 2.481743, 0, 0.03529412, 1, 1,
0.4288731, 0.3540104, 0.474239, 0, 0.02745098, 1, 1,
0.4306761, -0.1960776, 2.729795, 0, 0.02352941, 1, 1,
0.4323615, 0.6879022, 0.6803759, 0, 0.01568628, 1, 1,
0.435312, -1.593417, 3.386322, 0, 0.01176471, 1, 1,
0.4383869, -0.5536547, 3.016208, 0, 0.003921569, 1, 1,
0.4392222, -1.068799, 2.177217, 0.003921569, 0, 1, 1,
0.4420618, -1.66017, 3.035485, 0.007843138, 0, 1, 1,
0.4422387, -0.1354422, 3.514774, 0.01568628, 0, 1, 1,
0.4428949, 0.5571458, -0.8285116, 0.01960784, 0, 1, 1,
0.4460098, 0.2087585, 0.8033862, 0.02745098, 0, 1, 1,
0.4468958, -0.3542581, 1.920028, 0.03137255, 0, 1, 1,
0.4501067, 0.3405786, 0.6831313, 0.03921569, 0, 1, 1,
0.4632931, -2.842622, 2.209693, 0.04313726, 0, 1, 1,
0.4677964, 1.510446, 1.866884, 0.05098039, 0, 1, 1,
0.4731649, -0.1298503, 1.075423, 0.05490196, 0, 1, 1,
0.4742915, 1.740193, 0.348876, 0.0627451, 0, 1, 1,
0.4743297, -0.08294243, 3.155246, 0.06666667, 0, 1, 1,
0.4748712, -2.315285, 2.936897, 0.07450981, 0, 1, 1,
0.47763, -0.6248838, 4.860247, 0.07843138, 0, 1, 1,
0.4776738, -0.01389382, 2.58729, 0.08627451, 0, 1, 1,
0.478966, 0.1777564, -0.6804373, 0.09019608, 0, 1, 1,
0.4805885, -1.023196, 2.845379, 0.09803922, 0, 1, 1,
0.4844937, -0.4147198, 2.717884, 0.1058824, 0, 1, 1,
0.4849218, -0.6299976, 3.284264, 0.1098039, 0, 1, 1,
0.4959973, -0.7053586, 3.944932, 0.1176471, 0, 1, 1,
0.4988153, -1.575143, 3.339429, 0.1215686, 0, 1, 1,
0.4998695, 1.430011, 1.402873, 0.1294118, 0, 1, 1,
0.5040106, 2.28518, 0.4204825, 0.1333333, 0, 1, 1,
0.5069475, -0.7959777, 2.065618, 0.1411765, 0, 1, 1,
0.5082666, 0.2639301, 2.295831, 0.145098, 0, 1, 1,
0.5090691, 0.2149108, 0.9852155, 0.1529412, 0, 1, 1,
0.5148399, -0.4847379, 0.9296631, 0.1568628, 0, 1, 1,
0.516106, -0.4993396, 3.015273, 0.1647059, 0, 1, 1,
0.5193235, -1.36013, 2.345499, 0.1686275, 0, 1, 1,
0.5232517, -0.7890669, 2.491953, 0.1764706, 0, 1, 1,
0.5236605, 0.3472161, 0.0612534, 0.1803922, 0, 1, 1,
0.5262761, -0.4003115, 2.680286, 0.1882353, 0, 1, 1,
0.5276213, 0.5195701, -1.876356, 0.1921569, 0, 1, 1,
0.539327, -1.081844, 3.376391, 0.2, 0, 1, 1,
0.5450488, 0.04181332, 1.035995, 0.2078431, 0, 1, 1,
0.5469546, -0.4743514, 2.614312, 0.2117647, 0, 1, 1,
0.5546364, -0.3639614, 2.3717, 0.2196078, 0, 1, 1,
0.5549673, -0.9295517, 5.267537, 0.2235294, 0, 1, 1,
0.5567743, 0.262809, 1.166156, 0.2313726, 0, 1, 1,
0.5589171, 0.4769266, -1.146436, 0.2352941, 0, 1, 1,
0.5596721, -0.8043964, 5.523365, 0.2431373, 0, 1, 1,
0.5613214, 0.2062833, 0.698795, 0.2470588, 0, 1, 1,
0.5626189, -1.743126, 3.123942, 0.254902, 0, 1, 1,
0.565028, -0.7116606, 1.899406, 0.2588235, 0, 1, 1,
0.5659659, 0.8535246, -0.5675479, 0.2666667, 0, 1, 1,
0.5710227, -1.74173, 4.036679, 0.2705882, 0, 1, 1,
0.5745109, 0.1403949, 1.187118, 0.2784314, 0, 1, 1,
0.5745803, 0.707283, 0.7085376, 0.282353, 0, 1, 1,
0.5764738, -1.134591, 1.257728, 0.2901961, 0, 1, 1,
0.5788942, -0.8709806, 4.238857, 0.2941177, 0, 1, 1,
0.5812759, -0.3186877, 2.185128, 0.3019608, 0, 1, 1,
0.5844009, -0.1315542, 1.396169, 0.3098039, 0, 1, 1,
0.5872651, 0.5995038, 0.09314919, 0.3137255, 0, 1, 1,
0.5898132, 0.3691857, 1.016527, 0.3215686, 0, 1, 1,
0.5936992, -0.413679, 2.506203, 0.3254902, 0, 1, 1,
0.5938885, -0.5379819, 1.877032, 0.3333333, 0, 1, 1,
0.5989279, -0.6805619, 3.884279, 0.3372549, 0, 1, 1,
0.60083, 0.7079982, 0.1466917, 0.345098, 0, 1, 1,
0.6036849, 0.354947, 1.632713, 0.3490196, 0, 1, 1,
0.6121727, 0.3623088, -0.6582842, 0.3568628, 0, 1, 1,
0.6198565, 1.136198, 0.1343139, 0.3607843, 0, 1, 1,
0.6209851, 0.05184205, 0.66902, 0.3686275, 0, 1, 1,
0.6372212, -1.495024, 1.717143, 0.372549, 0, 1, 1,
0.6436389, -1.745962, 0.5163192, 0.3803922, 0, 1, 1,
0.6438675, 0.7336234, 0.7001201, 0.3843137, 0, 1, 1,
0.6467105, 1.881946, -1.166846, 0.3921569, 0, 1, 1,
0.6468896, -0.2837949, 2.66994, 0.3960784, 0, 1, 1,
0.6590099, -0.5075248, 2.365525, 0.4039216, 0, 1, 1,
0.6623163, 0.7472703, 0.1556585, 0.4117647, 0, 1, 1,
0.6638705, 1.549929, 0.4997686, 0.4156863, 0, 1, 1,
0.6684399, 1.416175, 1.262081, 0.4235294, 0, 1, 1,
0.6697041, -0.7835814, 2.155898, 0.427451, 0, 1, 1,
0.6724851, 0.1378506, 1.404407, 0.4352941, 0, 1, 1,
0.6748134, -0.03889381, 2.343308, 0.4392157, 0, 1, 1,
0.6770711, -0.7052609, 2.828184, 0.4470588, 0, 1, 1,
0.6809472, -0.5292256, 2.215353, 0.4509804, 0, 1, 1,
0.6813502, 0.4543251, 0.8914751, 0.4588235, 0, 1, 1,
0.6860755, 2.240577, -0.2347409, 0.4627451, 0, 1, 1,
0.6952438, 0.01529776, 2.036398, 0.4705882, 0, 1, 1,
0.7006603, -0.5994322, 1.363832, 0.4745098, 0, 1, 1,
0.7040342, -0.6843718, 3.191811, 0.4823529, 0, 1, 1,
0.7190667, 0.3672743, 1.313297, 0.4862745, 0, 1, 1,
0.7234227, -0.7526126, -0.1407494, 0.4941176, 0, 1, 1,
0.7264083, 0.5072866, 2.619958, 0.5019608, 0, 1, 1,
0.7442271, -1.365972, 4.589857, 0.5058824, 0, 1, 1,
0.7461157, 1.174711, 0.7388209, 0.5137255, 0, 1, 1,
0.7464159, -1.027931, 1.577778, 0.5176471, 0, 1, 1,
0.7502854, 2.529649, 0.2089216, 0.5254902, 0, 1, 1,
0.7521315, 1.064757, 2.443455, 0.5294118, 0, 1, 1,
0.7540333, 0.2548963, 0.8717737, 0.5372549, 0, 1, 1,
0.7583137, -2.184723, 3.575758, 0.5411765, 0, 1, 1,
0.7609946, -1.04875, 0.2691831, 0.5490196, 0, 1, 1,
0.7621858, 0.5258631, 2.441019, 0.5529412, 0, 1, 1,
0.7635024, -0.839839, 2.004886, 0.5607843, 0, 1, 1,
0.7680187, 1.779024, 2.480738, 0.5647059, 0, 1, 1,
0.7689708, -0.4927796, 1.691326, 0.572549, 0, 1, 1,
0.769015, -2.264951, 1.902967, 0.5764706, 0, 1, 1,
0.7725103, -0.5971429, 2.75332, 0.5843138, 0, 1, 1,
0.7738084, 1.671025, 0.164731, 0.5882353, 0, 1, 1,
0.774137, -0.460169, 1.882994, 0.5960785, 0, 1, 1,
0.7777115, -0.10736, 0.5594043, 0.6039216, 0, 1, 1,
0.7800758, 0.2412212, 1.499702, 0.6078432, 0, 1, 1,
0.7872552, 1.186055, 0.189977, 0.6156863, 0, 1, 1,
0.7881975, 0.5141715, 0.3966839, 0.6196079, 0, 1, 1,
0.7994344, -0.8904119, 2.097429, 0.627451, 0, 1, 1,
0.7995629, 0.5694132, 0.4740562, 0.6313726, 0, 1, 1,
0.8098561, 0.06689974, -0.01771713, 0.6392157, 0, 1, 1,
0.8100955, 1.116639, 0.3229645, 0.6431373, 0, 1, 1,
0.8108726, -0.1749116, 3.771911, 0.6509804, 0, 1, 1,
0.8157355, -2.098937, 3.263646, 0.654902, 0, 1, 1,
0.8201898, -1.122784, 4.246542, 0.6627451, 0, 1, 1,
0.8205051, 1.083992, -0.5585719, 0.6666667, 0, 1, 1,
0.8212062, -0.7358243, 2.281373, 0.6745098, 0, 1, 1,
0.8252086, 0.2532158, 0.4640721, 0.6784314, 0, 1, 1,
0.8301177, 1.864149, 1.633717, 0.6862745, 0, 1, 1,
0.8376315, -0.1016735, 2.295044, 0.6901961, 0, 1, 1,
0.841107, -0.05143948, 0.8930489, 0.6980392, 0, 1, 1,
0.8434988, 0.05078058, 4.148444, 0.7058824, 0, 1, 1,
0.8447788, -1.419047, 2.16258, 0.7098039, 0, 1, 1,
0.8449279, -1.408704, 3.1434, 0.7176471, 0, 1, 1,
0.8452292, -0.2524162, 0.5997407, 0.7215686, 0, 1, 1,
0.8507825, 0.498021, 0.5963839, 0.7294118, 0, 1, 1,
0.8510329, 0.1706778, -0.3768217, 0.7333333, 0, 1, 1,
0.8564186, -0.2438667, 1.762557, 0.7411765, 0, 1, 1,
0.856945, -0.8560153, 2.548619, 0.7450981, 0, 1, 1,
0.8578535, -0.0992672, 1.360865, 0.7529412, 0, 1, 1,
0.8601565, -0.4692459, 1.548233, 0.7568628, 0, 1, 1,
0.8656551, 1.583448, -1.030975, 0.7647059, 0, 1, 1,
0.8676671, 0.1502507, 0.2299891, 0.7686275, 0, 1, 1,
0.8678684, 0.4789253, -0.7640546, 0.7764706, 0, 1, 1,
0.8686891, -0.7015182, 2.023696, 0.7803922, 0, 1, 1,
0.8726931, 0.9170613, 0.443868, 0.7882353, 0, 1, 1,
0.8756399, -0.4255863, 2.381497, 0.7921569, 0, 1, 1,
0.8771436, -0.5038816, 1.591792, 0.8, 0, 1, 1,
0.8802851, 0.2268578, 0.4653096, 0.8078431, 0, 1, 1,
0.8813765, 2.027038, 0.581964, 0.8117647, 0, 1, 1,
0.8828678, -0.7945092, 3.158764, 0.8196079, 0, 1, 1,
0.8837761, 1.59443, -0.0007052443, 0.8235294, 0, 1, 1,
0.8894421, 0.6415412, 1.418147, 0.8313726, 0, 1, 1,
0.8902741, 0.2662472, 1.647839, 0.8352941, 0, 1, 1,
0.8926499, 1.903777, 0.7892439, 0.8431373, 0, 1, 1,
0.8927135, -0.08088035, 1.655728, 0.8470588, 0, 1, 1,
0.8932937, 0.2822056, 0.2234676, 0.854902, 0, 1, 1,
0.893693, -0.1794922, 1.64931, 0.8588235, 0, 1, 1,
0.8939014, -0.5747339, 2.725395, 0.8666667, 0, 1, 1,
0.8956794, -1.126577, 3.95659, 0.8705882, 0, 1, 1,
0.8980123, -0.1934885, 0.9267846, 0.8784314, 0, 1, 1,
0.9018833, -2.521908, 1.745234, 0.8823529, 0, 1, 1,
0.9131957, 1.516907, 0.7939772, 0.8901961, 0, 1, 1,
0.9154164, 0.6327254, 0.3865142, 0.8941177, 0, 1, 1,
0.9165162, 0.946107, 2.00596, 0.9019608, 0, 1, 1,
0.9203938, -0.3783553, 2.622406, 0.9098039, 0, 1, 1,
0.9218718, 0.7554678, 0.845278, 0.9137255, 0, 1, 1,
0.9306905, 0.1075943, 2.432192, 0.9215686, 0, 1, 1,
0.9366408, 0.7508, -0.260736, 0.9254902, 0, 1, 1,
0.9373169, 0.9131657, 1.11956, 0.9333333, 0, 1, 1,
0.9446405, -1.099221, 0.2022344, 0.9372549, 0, 1, 1,
0.9486344, 0.008353481, 1.636367, 0.945098, 0, 1, 1,
0.9494771, -1.097388, 2.122188, 0.9490196, 0, 1, 1,
0.9510393, -0.7598554, 2.452279, 0.9568627, 0, 1, 1,
0.9573884, 0.6787332, 0.6320539, 0.9607843, 0, 1, 1,
0.9581692, -0.8060718, 3.059825, 0.9686275, 0, 1, 1,
0.961935, -0.401691, 3.658952, 0.972549, 0, 1, 1,
0.96204, 0.01932613, 3.141852, 0.9803922, 0, 1, 1,
0.9637733, 1.144428, 0.9664211, 0.9843137, 0, 1, 1,
0.9648959, 2.348448, 0.6984715, 0.9921569, 0, 1, 1,
0.9677935, -0.2996441, 1.97441, 0.9960784, 0, 1, 1,
0.971513, -1.681535, 2.839266, 1, 0, 0.9960784, 1,
0.9782066, 0.9096617, 0.1277468, 1, 0, 0.9882353, 1,
0.9823405, 0.3528029, 0.6706739, 1, 0, 0.9843137, 1,
0.982712, 0.4121511, 1.984512, 1, 0, 0.9764706, 1,
0.9836715, -0.1643719, 3.359836, 1, 0, 0.972549, 1,
0.9865855, 1.685557, 0.5140132, 1, 0, 0.9647059, 1,
0.988798, -0.6376723, 3.161152, 1, 0, 0.9607843, 1,
0.9953365, 0.2631161, 0.07815681, 1, 0, 0.9529412, 1,
0.9965543, -0.4332668, -0.06134201, 1, 0, 0.9490196, 1,
1.009067, 1.981525, 0.9021901, 1, 0, 0.9411765, 1,
1.01374, -0.8101568, 0.4049903, 1, 0, 0.9372549, 1,
1.018484, 0.5677815, 0.08541161, 1, 0, 0.9294118, 1,
1.024855, -1.636135, 3.934362, 1, 0, 0.9254902, 1,
1.027908, -0.7512054, 1.760433, 1, 0, 0.9176471, 1,
1.02922, 0.2512283, 2.257715, 1, 0, 0.9137255, 1,
1.030154, 0.6160482, 2.620514, 1, 0, 0.9058824, 1,
1.030354, 1.531653, -0.3164155, 1, 0, 0.9019608, 1,
1.030515, -0.6350751, 0.2631221, 1, 0, 0.8941177, 1,
1.030835, 0.1841284, 0.1104935, 1, 0, 0.8862745, 1,
1.031778, -0.8580774, 2.846343, 1, 0, 0.8823529, 1,
1.038913, -0.3754511, 1.178491, 1, 0, 0.8745098, 1,
1.04531, -0.03904767, 1.112267, 1, 0, 0.8705882, 1,
1.049431, 0.2144556, 1.842038, 1, 0, 0.8627451, 1,
1.050017, 1.078331, 0.8354664, 1, 0, 0.8588235, 1,
1.054746, -2.022775, 3.120957, 1, 0, 0.8509804, 1,
1.066753, -0.1525876, 1.257394, 1, 0, 0.8470588, 1,
1.06708, -1.376538, 3.425184, 1, 0, 0.8392157, 1,
1.070769, -1.528968, 2.226269, 1, 0, 0.8352941, 1,
1.078788, 1.878799, -0.4729188, 1, 0, 0.827451, 1,
1.079403, -0.1457683, -1.070056, 1, 0, 0.8235294, 1,
1.081127, 0.04252777, 0.9701344, 1, 0, 0.8156863, 1,
1.081961, 0.396884, 1.383583, 1, 0, 0.8117647, 1,
1.084894, 1.323605, 0.1475788, 1, 0, 0.8039216, 1,
1.0877, 0.7656252, 3.658341, 1, 0, 0.7960784, 1,
1.107009, -0.5783644, 1.146993, 1, 0, 0.7921569, 1,
1.107777, -0.1251718, 1.528084, 1, 0, 0.7843137, 1,
1.110596, 2.227752, -0.1758119, 1, 0, 0.7803922, 1,
1.115948, -0.1421498, 0.7814126, 1, 0, 0.772549, 1,
1.116819, -0.103392, 2.582984, 1, 0, 0.7686275, 1,
1.117354, 0.873098, 2.071334, 1, 0, 0.7607843, 1,
1.122882, -0.6327255, 3.595529, 1, 0, 0.7568628, 1,
1.136764, 0.7122964, 2.011677, 1, 0, 0.7490196, 1,
1.145386, 0.7672181, 0.1334378, 1, 0, 0.7450981, 1,
1.145849, 1.196648, 1.755596, 1, 0, 0.7372549, 1,
1.153157, -0.3681425, 2.154294, 1, 0, 0.7333333, 1,
1.16803, -1.121264, 2.811012, 1, 0, 0.7254902, 1,
1.170038, 1.311349, 1.279551, 1, 0, 0.7215686, 1,
1.170431, 0.3279651, 0.608344, 1, 0, 0.7137255, 1,
1.179685, -1.036381, 2.198799, 1, 0, 0.7098039, 1,
1.182443, -0.1129999, 2.630692, 1, 0, 0.7019608, 1,
1.183133, 0.8714687, 1.889663, 1, 0, 0.6941177, 1,
1.186758, 0.05270096, 1.417087, 1, 0, 0.6901961, 1,
1.189814, -0.8108187, 1.68469, 1, 0, 0.682353, 1,
1.194145, -1.954899, 2.568065, 1, 0, 0.6784314, 1,
1.194265, 1.651343, 1.799484, 1, 0, 0.6705883, 1,
1.19525, -1.175756, 2.389152, 1, 0, 0.6666667, 1,
1.20114, -0.67951, -0.3165658, 1, 0, 0.6588235, 1,
1.202926, -0.6165596, 1.83353, 1, 0, 0.654902, 1,
1.208682, 0.9468751, 1.635231, 1, 0, 0.6470588, 1,
1.21136, 1.6193, 0.5213308, 1, 0, 0.6431373, 1,
1.218602, 1.516182, 0.2306198, 1, 0, 0.6352941, 1,
1.231018, -0.3502792, 2.007362, 1, 0, 0.6313726, 1,
1.235202, -0.6871842, 2.249053, 1, 0, 0.6235294, 1,
1.236769, -1.580026, 1.652241, 1, 0, 0.6196079, 1,
1.238881, 0.3793028, 0.7028445, 1, 0, 0.6117647, 1,
1.239389, 0.05739251, 3.225004, 1, 0, 0.6078432, 1,
1.243544, 1.344899, 2.716278, 1, 0, 0.6, 1,
1.245617, -0.1099193, 1.012912, 1, 0, 0.5921569, 1,
1.255997, -0.7109494, 2.598553, 1, 0, 0.5882353, 1,
1.260579, -0.9049969, 3.69934, 1, 0, 0.5803922, 1,
1.266384, -0.4292126, 2.985504, 1, 0, 0.5764706, 1,
1.266584, -1.119925, 2.772867, 1, 0, 0.5686275, 1,
1.269767, -1.146292, 2.689178, 1, 0, 0.5647059, 1,
1.283979, 1.14635, 1.469173, 1, 0, 0.5568628, 1,
1.291393, -0.03066856, 0.8084126, 1, 0, 0.5529412, 1,
1.291765, -0.2012837, 0.8369134, 1, 0, 0.5450981, 1,
1.293702, 0.7460091, 2.448386, 1, 0, 0.5411765, 1,
1.297349, 0.9018492, 1.444434, 1, 0, 0.5333334, 1,
1.297452, -0.4700851, 2.192924, 1, 0, 0.5294118, 1,
1.314394, 0.05642142, 1.659528, 1, 0, 0.5215687, 1,
1.32004, -0.3819525, 1.264523, 1, 0, 0.5176471, 1,
1.320918, -1.665253, 1.551288, 1, 0, 0.509804, 1,
1.339592, -1.47578, 2.428439, 1, 0, 0.5058824, 1,
1.352141, 1.042794, -0.8651479, 1, 0, 0.4980392, 1,
1.359194, 0.4415253, 1.228478, 1, 0, 0.4901961, 1,
1.368149, 0.007176206, 1.826951, 1, 0, 0.4862745, 1,
1.368266, 1.509778, 2.977752, 1, 0, 0.4784314, 1,
1.375381, 0.6292788, 0.8465539, 1, 0, 0.4745098, 1,
1.379836, -0.465716, 1.35416, 1, 0, 0.4666667, 1,
1.397368, 1.637445, 0.2035136, 1, 0, 0.4627451, 1,
1.410116, 2.310114, 0.7866982, 1, 0, 0.454902, 1,
1.414626, 0.3059402, 1.306776, 1, 0, 0.4509804, 1,
1.420866, 0.5995057, 1.810636, 1, 0, 0.4431373, 1,
1.422872, 1.859431, -0.1701601, 1, 0, 0.4392157, 1,
1.431405, 1.28726, 1.791894, 1, 0, 0.4313726, 1,
1.451509, 1.34246, 2.381331, 1, 0, 0.427451, 1,
1.457531, -0.533398, 1.743529, 1, 0, 0.4196078, 1,
1.458745, -1.265604, 1.892096, 1, 0, 0.4156863, 1,
1.459494, -0.1831284, 1.795837, 1, 0, 0.4078431, 1,
1.469288, -0.00117265, 3.184933, 1, 0, 0.4039216, 1,
1.498227, 0.2272721, 3.100238, 1, 0, 0.3960784, 1,
1.510964, -1.226599, 3.128374, 1, 0, 0.3882353, 1,
1.513313, 0.5631635, 1.416478, 1, 0, 0.3843137, 1,
1.515239, 1.230657, -0.5752825, 1, 0, 0.3764706, 1,
1.539989, 0.785561, 1.929702, 1, 0, 0.372549, 1,
1.555607, 1.140679, 1.663841, 1, 0, 0.3647059, 1,
1.565925, -0.7199576, 1.929672, 1, 0, 0.3607843, 1,
1.566825, -0.2896447, 0.8081976, 1, 0, 0.3529412, 1,
1.573438, 0.3355873, 0.8614178, 1, 0, 0.3490196, 1,
1.613447, 0.7286808, -0.8541808, 1, 0, 0.3411765, 1,
1.62143, -0.1703328, 2.252274, 1, 0, 0.3372549, 1,
1.631872, -0.5691004, 1.879349, 1, 0, 0.3294118, 1,
1.632253, 0.06724327, 1.519446, 1, 0, 0.3254902, 1,
1.64674, 0.2521581, 1.384153, 1, 0, 0.3176471, 1,
1.675313, 1.119594, -0.1278782, 1, 0, 0.3137255, 1,
1.697743, -0.7219973, 3.241762, 1, 0, 0.3058824, 1,
1.706081, 0.009756977, 1.966304, 1, 0, 0.2980392, 1,
1.71045, -0.1595696, 2.402827, 1, 0, 0.2941177, 1,
1.713455, 0.5038366, 1.380686, 1, 0, 0.2862745, 1,
1.722074, -1.438896, 3.772145, 1, 0, 0.282353, 1,
1.728497, -0.5430163, 1.92486, 1, 0, 0.2745098, 1,
1.740279, -0.9309757, 1.825234, 1, 0, 0.2705882, 1,
1.761281, -0.4058163, 0.1570837, 1, 0, 0.2627451, 1,
1.771202, 0.238333, 2.994591, 1, 0, 0.2588235, 1,
1.794138, -0.319421, 2.056629, 1, 0, 0.2509804, 1,
1.798351, 0.7363852, 2.301656, 1, 0, 0.2470588, 1,
1.804641, 0.2553015, 1.567526, 1, 0, 0.2392157, 1,
1.838385, 1.017872, 0.06831511, 1, 0, 0.2352941, 1,
1.839216, -0.3464594, 2.202921, 1, 0, 0.227451, 1,
1.84342, -0.6631959, 1.637873, 1, 0, 0.2235294, 1,
1.849545, -0.009808265, 2.649705, 1, 0, 0.2156863, 1,
1.852288, -1.693756, 2.944695, 1, 0, 0.2117647, 1,
1.900961, -1.55937, 3.927971, 1, 0, 0.2039216, 1,
1.91561, -1.323166, 4.056359, 1, 0, 0.1960784, 1,
1.924087, -0.5739557, 4.050668, 1, 0, 0.1921569, 1,
1.924296, -0.580112, 1.685639, 1, 0, 0.1843137, 1,
1.933965, -1.557998, 1.07863, 1, 0, 0.1803922, 1,
1.953967, -0.8594004, 2.000423, 1, 0, 0.172549, 1,
1.96509, 1.039841, 0.1770399, 1, 0, 0.1686275, 1,
1.982356, 0.5619996, 1.242829, 1, 0, 0.1607843, 1,
1.989308, -0.754382, 2.724291, 1, 0, 0.1568628, 1,
2.015304, 2.541945, -0.6976241, 1, 0, 0.1490196, 1,
2.02636, -0.9438472, 3.088027, 1, 0, 0.145098, 1,
2.055008, -1.225454, 2.039258, 1, 0, 0.1372549, 1,
2.056464, 0.982461, 0.001281117, 1, 0, 0.1333333, 1,
2.061072, -0.9928909, 1.02037, 1, 0, 0.1254902, 1,
2.109837, 0.5122959, 0.9546549, 1, 0, 0.1215686, 1,
2.112002, -1.544401, 2.112858, 1, 0, 0.1137255, 1,
2.183587, 0.4452383, 0.8184349, 1, 0, 0.1098039, 1,
2.184569, 1.301473, 0.6483986, 1, 0, 0.1019608, 1,
2.188256, 1.366634, 2.245432, 1, 0, 0.09411765, 1,
2.215697, 1.82051, 1.296428, 1, 0, 0.09019608, 1,
2.228563, -0.9431577, 2.147559, 1, 0, 0.08235294, 1,
2.24469, 0.5861115, 2.264448, 1, 0, 0.07843138, 1,
2.325432, 0.9755092, 0.9565701, 1, 0, 0.07058824, 1,
2.338435, 0.7754886, 0.3334215, 1, 0, 0.06666667, 1,
2.49797, -0.1564346, 2.895889, 1, 0, 0.05882353, 1,
2.509671, 2.245196, 1.404594, 1, 0, 0.05490196, 1,
2.528776, 0.4621311, 3.122499, 1, 0, 0.04705882, 1,
2.537304, 0.4428577, 1.4585, 1, 0, 0.04313726, 1,
2.578981, 0.1936073, 1.054418, 1, 0, 0.03529412, 1,
2.875793, -0.826874, 2.758798, 1, 0, 0.03137255, 1,
2.963717, -1.56777, 2.108675, 1, 0, 0.02352941, 1,
3.035921, 0.8135913, 1.628858, 1, 0, 0.01960784, 1,
3.095696, -1.550383, 0.7734283, 1, 0, 0.01176471, 1,
3.169464, 1.471215, -0.1428208, 1, 0, 0.007843138, 1
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
0.2253286, -4.088918, -7.964519, 0, -0.5, 0.5, 0.5,
0.2253286, -4.088918, -7.964519, 1, -0.5, 0.5, 0.5,
0.2253286, -4.088918, -7.964519, 1, 1.5, 0.5, 0.5,
0.2253286, -4.088918, -7.964519, 0, 1.5, 0.5, 0.5
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
-3.716869, -0.04049575, -7.964519, 0, -0.5, 0.5, 0.5,
-3.716869, -0.04049575, -7.964519, 1, -0.5, 0.5, 0.5,
-3.716869, -0.04049575, -7.964519, 1, 1.5, 0.5, 0.5,
-3.716869, -0.04049575, -7.964519, 0, 1.5, 0.5, 0.5
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
-3.716869, -4.088918, -0.2431521, 0, -0.5, 0.5, 0.5,
-3.716869, -4.088918, -0.2431521, 1, -0.5, 0.5, 0.5,
-3.716869, -4.088918, -0.2431521, 1, 1.5, 0.5, 0.5,
-3.716869, -4.088918, -0.2431521, 0, 1.5, 0.5, 0.5
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
-2, -3.154667, -6.182665,
3, -3.154667, -6.182665,
-2, -3.154667, -6.182665,
-2, -3.310375, -6.479641,
-1, -3.154667, -6.182665,
-1, -3.310375, -6.479641,
0, -3.154667, -6.182665,
0, -3.310375, -6.479641,
1, -3.154667, -6.182665,
1, -3.310375, -6.479641,
2, -3.154667, -6.182665,
2, -3.310375, -6.479641,
3, -3.154667, -6.182665,
3, -3.310375, -6.479641
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
-2, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
-2, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
-2, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
-2, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5,
-1, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
-1, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
-1, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
-1, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5,
0, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
0, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
0, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
0, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5,
1, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
1, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
1, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
1, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5,
2, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
2, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
2, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
2, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5,
3, -3.621792, -7.073592, 0, -0.5, 0.5, 0.5,
3, -3.621792, -7.073592, 1, -0.5, 0.5, 0.5,
3, -3.621792, -7.073592, 1, 1.5, 0.5, 0.5,
3, -3.621792, -7.073592, 0, 1.5, 0.5, 0.5
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
-2.807131, -3, -6.182665,
-2.807131, 2, -6.182665,
-2.807131, -3, -6.182665,
-2.958754, -3, -6.479641,
-2.807131, -2, -6.182665,
-2.958754, -2, -6.479641,
-2.807131, -1, -6.182665,
-2.958754, -1, -6.479641,
-2.807131, 0, -6.182665,
-2.958754, 0, -6.479641,
-2.807131, 1, -6.182665,
-2.958754, 1, -6.479641,
-2.807131, 2, -6.182665,
-2.958754, 2, -6.479641
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
-3.262, -3, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, -3, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, -3, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, -3, -7.073592, 0, 1.5, 0.5, 0.5,
-3.262, -2, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, -2, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, -2, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, -2, -7.073592, 0, 1.5, 0.5, 0.5,
-3.262, -1, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, -1, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, -1, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, -1, -7.073592, 0, 1.5, 0.5, 0.5,
-3.262, 0, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, 0, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, 0, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, 0, -7.073592, 0, 1.5, 0.5, 0.5,
-3.262, 1, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, 1, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, 1, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, 1, -7.073592, 0, 1.5, 0.5, 0.5,
-3.262, 2, -7.073592, 0, -0.5, 0.5, 0.5,
-3.262, 2, -7.073592, 1, -0.5, 0.5, 0.5,
-3.262, 2, -7.073592, 1, 1.5, 0.5, 0.5,
-3.262, 2, -7.073592, 0, 1.5, 0.5, 0.5
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
-2.807131, -3.154667, -6,
-2.807131, -3.154667, 4,
-2.807131, -3.154667, -6,
-2.958754, -3.310375, -6,
-2.807131, -3.154667, -4,
-2.958754, -3.310375, -4,
-2.807131, -3.154667, -2,
-2.958754, -3.310375, -2,
-2.807131, -3.154667, 0,
-2.958754, -3.310375, 0,
-2.807131, -3.154667, 2,
-2.958754, -3.310375, 2,
-2.807131, -3.154667, 4,
-2.958754, -3.310375, 4
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
-3.262, -3.621792, -6, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, -6, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, -6, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, -6, 0, 1.5, 0.5, 0.5,
-3.262, -3.621792, -4, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, -4, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, -4, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, -4, 0, 1.5, 0.5, 0.5,
-3.262, -3.621792, -2, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, -2, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, -2, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, -2, 0, 1.5, 0.5, 0.5,
-3.262, -3.621792, 0, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, 0, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, 0, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, 0, 0, 1.5, 0.5, 0.5,
-3.262, -3.621792, 2, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, 2, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, 2, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, 2, 0, 1.5, 0.5, 0.5,
-3.262, -3.621792, 4, 0, -0.5, 0.5, 0.5,
-3.262, -3.621792, 4, 1, -0.5, 0.5, 0.5,
-3.262, -3.621792, 4, 1, 1.5, 0.5, 0.5,
-3.262, -3.621792, 4, 0, 1.5, 0.5, 0.5
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
-2.807131, -3.154667, -6.182665,
-2.807131, 3.073675, -6.182665,
-2.807131, -3.154667, 5.696361,
-2.807131, 3.073675, 5.696361,
-2.807131, -3.154667, -6.182665,
-2.807131, -3.154667, 5.696361,
-2.807131, 3.073675, -6.182665,
-2.807131, 3.073675, 5.696361,
-2.807131, -3.154667, -6.182665,
3.257788, -3.154667, -6.182665,
-2.807131, -3.154667, 5.696361,
3.257788, -3.154667, 5.696361,
-2.807131, 3.073675, -6.182665,
3.257788, 3.073675, -6.182665,
-2.807131, 3.073675, 5.696361,
3.257788, 3.073675, 5.696361,
3.257788, -3.154667, -6.182665,
3.257788, 3.073675, -6.182665,
3.257788, -3.154667, 5.696361,
3.257788, 3.073675, 5.696361,
3.257788, -3.154667, -6.182665,
3.257788, -3.154667, 5.696361,
3.257788, 3.073675, -6.182665,
3.257788, 3.073675, 5.696361
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
var radius = 7.860346;
var distance = 34.97157;
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
mvMatrix.translate( -0.2253286, 0.04049575, 0.2431521 );
mvMatrix.scale( 1.401298, 1.36453, 0.7154425 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97157);
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
prolan<-read.table("prolan.xyz")
```

```
## Error in read.table("prolan.xyz"): no lines available in input
```

```r
x<-prolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
y<-prolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
z<-prolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
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
-2.718807, -0.8071265, -0.8645301, 0, 0, 1, 1, 1,
-2.599512, -1.118709, -1.988985, 1, 0, 0, 1, 1,
-2.55596, -1.676064, -1.318661, 1, 0, 0, 1, 1,
-2.415676, -0.9025323, -1.203878, 1, 0, 0, 1, 1,
-2.399458, -1.783903, -2.868664, 1, 0, 0, 1, 1,
-2.384408, 0.2117209, 0.123421, 1, 0, 0, 1, 1,
-2.374927, 0.08805762, -1.727934, 0, 0, 0, 1, 1,
-2.347147, -0.9556824, -2.998804, 0, 0, 0, 1, 1,
-2.31534, 1.28683, -0.03624044, 0, 0, 0, 1, 1,
-2.255791, 0.4552877, -2.302872, 0, 0, 0, 1, 1,
-2.202118, -1.087271, -2.353882, 0, 0, 0, 1, 1,
-2.172963, -1.696427, -1.188813, 0, 0, 0, 1, 1,
-2.124641, 2.014661, -1.41946, 0, 0, 0, 1, 1,
-2.109862, 0.4282319, -2.035912, 1, 1, 1, 1, 1,
-2.100596, -0.002620274, -1.002479, 1, 1, 1, 1, 1,
-2.033365, -0.6327693, -1.179017, 1, 1, 1, 1, 1,
-2.017668, 0.3701225, -1.327264, 1, 1, 1, 1, 1,
-2.01612, 0.2268881, -0.6535907, 1, 1, 1, 1, 1,
-2.011163, 1.440805, -1.310044, 1, 1, 1, 1, 1,
-1.987002, 2.12667, 0.7768443, 1, 1, 1, 1, 1,
-1.978677, -0.8299249, -2.078867, 1, 1, 1, 1, 1,
-1.971403, 0.6266321, -0.5393953, 1, 1, 1, 1, 1,
-1.965623, 1.420332, -0.4060425, 1, 1, 1, 1, 1,
-1.931477, -0.4757794, -4.168664, 1, 1, 1, 1, 1,
-1.903185, 0.672317, -1.784487, 1, 1, 1, 1, 1,
-1.901988, 1.176474, -0.916158, 1, 1, 1, 1, 1,
-1.892001, -0.2477673, -1.437723, 1, 1, 1, 1, 1,
-1.884173, 0.4892884, -0.4390984, 1, 1, 1, 1, 1,
-1.882163, 0.6442793, -1.407075, 0, 0, 1, 1, 1,
-1.850579, 0.4867331, -2.30059, 1, 0, 0, 1, 1,
-1.848166, 1.946932, -1.319023, 1, 0, 0, 1, 1,
-1.846005, -1.833095, -2.256577, 1, 0, 0, 1, 1,
-1.805898, 0.1617268, -1.904886, 1, 0, 0, 1, 1,
-1.798622, -0.6297498, 0.1085339, 1, 0, 0, 1, 1,
-1.782652, -0.5801165, -1.897821, 0, 0, 0, 1, 1,
-1.774773, 0.5179693, -0.6172685, 0, 0, 0, 1, 1,
-1.765338, 0.0512988, -2.35072, 0, 0, 0, 1, 1,
-1.760187, 0.5684417, -0.06194787, 0, 0, 0, 1, 1,
-1.756891, 0.3187199, -1.48708, 0, 0, 0, 1, 1,
-1.745075, 0.1304052, -0.6569714, 0, 0, 0, 1, 1,
-1.73681, -0.4390293, -3.755436, 0, 0, 0, 1, 1,
-1.731462, 0.8113483, 0.5407934, 1, 1, 1, 1, 1,
-1.731452, 0.8530937, -4.352887, 1, 1, 1, 1, 1,
-1.72936, -0.7305277, -1.971015, 1, 1, 1, 1, 1,
-1.716648, -0.6246243, -1.870899, 1, 1, 1, 1, 1,
-1.699449, 0.1005514, 0.03165333, 1, 1, 1, 1, 1,
-1.699403, -0.418709, -1.828369, 1, 1, 1, 1, 1,
-1.696708, -1.115487, -2.018343, 1, 1, 1, 1, 1,
-1.694726, 0.3335502, -1.655855, 1, 1, 1, 1, 1,
-1.693593, 1.084201, -2.45921, 1, 1, 1, 1, 1,
-1.68975, 0.9656741, -0.9946412, 1, 1, 1, 1, 1,
-1.661278, -0.7990851, -1.674063, 1, 1, 1, 1, 1,
-1.648915, 0.6927872, -1.504777, 1, 1, 1, 1, 1,
-1.646499, 0.8415631, -1.340747, 1, 1, 1, 1, 1,
-1.641184, 0.8965752, -2.614147, 1, 1, 1, 1, 1,
-1.63249, 0.5336685, 0.6073756, 1, 1, 1, 1, 1,
-1.63208, -0.206592, -1.360893, 0, 0, 1, 1, 1,
-1.630378, -0.7698591, -3.039156, 1, 0, 0, 1, 1,
-1.626983, -1.088952, -2.932664, 1, 0, 0, 1, 1,
-1.620412, -0.2458336, -0.6283917, 1, 0, 0, 1, 1,
-1.618694, -0.8823008, -1.41617, 1, 0, 0, 1, 1,
-1.6174, 0.3613093, -1.982274, 1, 0, 0, 1, 1,
-1.614265, 0.9001865, -1.669729, 0, 0, 0, 1, 1,
-1.608042, 0.7600528, -2.051248, 0, 0, 0, 1, 1,
-1.604044, 0.3554503, -1.521744, 0, 0, 0, 1, 1,
-1.602904, -1.312244, -3.423736, 0, 0, 0, 1, 1,
-1.581931, 0.4962853, -2.04515, 0, 0, 0, 1, 1,
-1.575228, -1.244986, -3.022758, 0, 0, 0, 1, 1,
-1.565121, 1.171192, -0.8144383, 0, 0, 0, 1, 1,
-1.547218, 0.5273429, -1.295331, 1, 1, 1, 1, 1,
-1.546922, -0.1741369, -2.281751, 1, 1, 1, 1, 1,
-1.54452, 0.9745958, -0.5718248, 1, 1, 1, 1, 1,
-1.537969, 1.531735, -0.02024033, 1, 1, 1, 1, 1,
-1.527113, 0.9670989, -0.3824763, 1, 1, 1, 1, 1,
-1.525635, -0.3265967, -0.1654462, 1, 1, 1, 1, 1,
-1.520753, -0.2067099, -1.175296, 1, 1, 1, 1, 1,
-1.51805, 0.1447003, -0.9936754, 1, 1, 1, 1, 1,
-1.500252, -0.405856, -0.4900862, 1, 1, 1, 1, 1,
-1.48383, 0.5077588, -1.182564, 1, 1, 1, 1, 1,
-1.477627, 0.007492645, -2.012831, 1, 1, 1, 1, 1,
-1.433046, 0.8477867, -0.06615987, 1, 1, 1, 1, 1,
-1.421546, 0.7827851, 0.4119622, 1, 1, 1, 1, 1,
-1.411239, -1.876402, -3.255262, 1, 1, 1, 1, 1,
-1.411198, -1.294594, -1.517061, 1, 1, 1, 1, 1,
-1.381911, 0.8693145, -0.06305458, 0, 0, 1, 1, 1,
-1.372612, 0.3096209, -1.145981, 1, 0, 0, 1, 1,
-1.367484, 0.3518729, -0.2021208, 1, 0, 0, 1, 1,
-1.363414, -0.4358922, -1.716596, 1, 0, 0, 1, 1,
-1.36091, -0.7128018, -4.481668, 1, 0, 0, 1, 1,
-1.347323, -0.4553508, -1.404421, 1, 0, 0, 1, 1,
-1.317767, -0.624393, -2.510725, 0, 0, 0, 1, 1,
-1.312497, 0.4927947, -3.256588, 0, 0, 0, 1, 1,
-1.306162, -2.217462, -2.116718, 0, 0, 0, 1, 1,
-1.305859, 0.04599816, -0.6445125, 0, 0, 0, 1, 1,
-1.305365, 2.480922, -0.9944086, 0, 0, 0, 1, 1,
-1.297691, -0.7385903, -3.122534, 0, 0, 0, 1, 1,
-1.290991, 0.1927321, -1.386312, 0, 0, 0, 1, 1,
-1.287309, 0.9819795, -0.5471271, 1, 1, 1, 1, 1,
-1.284956, -0.2575166, -0.6526617, 1, 1, 1, 1, 1,
-1.283806, -1.406163, -0.9247335, 1, 1, 1, 1, 1,
-1.278411, -0.4486317, -2.256331, 1, 1, 1, 1, 1,
-1.261995, -0.9672616, -0.8161652, 1, 1, 1, 1, 1,
-1.255347, -0.1629731, -0.8792176, 1, 1, 1, 1, 1,
-1.252451, -0.2759701, -2.964068, 1, 1, 1, 1, 1,
-1.251771, -0.8234209, -0.1765781, 1, 1, 1, 1, 1,
-1.24846, 1.877867, -1.155709, 1, 1, 1, 1, 1,
-1.23586, -0.574471, -3.774138, 1, 1, 1, 1, 1,
-1.233652, 0.9507864, -2.359834, 1, 1, 1, 1, 1,
-1.226156, 0.09071279, -3.211697, 1, 1, 1, 1, 1,
-1.217153, -0.7036428, -1.556379, 1, 1, 1, 1, 1,
-1.210382, 1.55548, -0.6863908, 1, 1, 1, 1, 1,
-1.206572, 0.5133251, -0.02537007, 1, 1, 1, 1, 1,
-1.194376, 0.4198415, -1.789228, 0, 0, 1, 1, 1,
-1.186937, -1.740543, -4.30307, 1, 0, 0, 1, 1,
-1.186698, -0.09181749, -2.361904, 1, 0, 0, 1, 1,
-1.180269, 0.9755006, -2.328636, 1, 0, 0, 1, 1,
-1.176304, -0.366137, -2.688459, 1, 0, 0, 1, 1,
-1.171051, -0.4820839, -1.886782, 1, 0, 0, 1, 1,
-1.163429, -0.4689111, -1.532832, 0, 0, 0, 1, 1,
-1.1634, -0.6600173, -1.416587, 0, 0, 0, 1, 1,
-1.160438, 0.5024071, -1.132715, 0, 0, 0, 1, 1,
-1.158247, 0.1471187, -0.666944, 0, 0, 0, 1, 1,
-1.149557, 0.4154689, -1.237072, 0, 0, 0, 1, 1,
-1.14943, -0.344993, -1.55644, 0, 0, 0, 1, 1,
-1.144561, 0.9797061, -1.602232, 0, 0, 0, 1, 1,
-1.129592, -0.07256699, -2.907884, 1, 1, 1, 1, 1,
-1.117264, -1.882148, -1.760879, 1, 1, 1, 1, 1,
-1.116683, 2.209118, -1.228072, 1, 1, 1, 1, 1,
-1.113477, 0.3978945, -1.124475, 1, 1, 1, 1, 1,
-1.108645, -0.4601734, -3.488431, 1, 1, 1, 1, 1,
-1.101138, -2.228616, -3.244708, 1, 1, 1, 1, 1,
-1.100011, 0.7398756, -0.896445, 1, 1, 1, 1, 1,
-1.095825, -1.392279, -2.575295, 1, 1, 1, 1, 1,
-1.09301, -0.4307342, -1.794343, 1, 1, 1, 1, 1,
-1.086946, 0.9836889, -0.2706035, 1, 1, 1, 1, 1,
-1.082648, -0.08162624, -1.962891, 1, 1, 1, 1, 1,
-1.081118, 0.2329263, -1.618154, 1, 1, 1, 1, 1,
-1.079228, 0.3985266, -1.555124, 1, 1, 1, 1, 1,
-1.066042, -0.7957665, -2.032075, 1, 1, 1, 1, 1,
-1.064099, -0.4604046, -2.802414, 1, 1, 1, 1, 1,
-1.063347, -0.2104163, -2.831346, 0, 0, 1, 1, 1,
-1.05393, -1.374149, -3.162203, 1, 0, 0, 1, 1,
-1.048905, 0.7007642, -1.129269, 1, 0, 0, 1, 1,
-1.048333, 0.2062667, -0.8790133, 1, 0, 0, 1, 1,
-1.045729, 0.3112402, -1.165032, 1, 0, 0, 1, 1,
-1.029015, 1.632429, -0.7603356, 1, 0, 0, 1, 1,
-1.020436, 0.5167152, -1.414376, 0, 0, 0, 1, 1,
-1.009308, 0.4270433, -1.041746, 0, 0, 0, 1, 1,
-1.00653, 0.6979141, -1.560679, 0, 0, 0, 1, 1,
-1.005466, 0.3345409, -2.536691, 0, 0, 0, 1, 1,
-1.003226, -0.6996228, -1.768266, 0, 0, 0, 1, 1,
-1.002798, -1.586129, -3.585168, 0, 0, 0, 1, 1,
-1.00127, 0.3901334, -1.205848, 0, 0, 0, 1, 1,
-1.000182, 0.9505847, -0.1602486, 1, 1, 1, 1, 1,
-0.9976104, 0.09324499, -0.2126387, 1, 1, 1, 1, 1,
-0.9905254, -0.09684375, -0.7931249, 1, 1, 1, 1, 1,
-0.989195, 1.836967, -2.476568, 1, 1, 1, 1, 1,
-0.9840941, 0.2461737, -2.066447, 1, 1, 1, 1, 1,
-0.9837967, 0.8665098, -0.1576027, 1, 1, 1, 1, 1,
-0.9809318, 0.2001228, -1.330482, 1, 1, 1, 1, 1,
-0.970865, 0.5923652, -0.962728, 1, 1, 1, 1, 1,
-0.9538831, 0.1690843, 0.6046231, 1, 1, 1, 1, 1,
-0.9523181, 0.6178156, -1.330215, 1, 1, 1, 1, 1,
-0.9498525, -0.6881676, -2.767125, 1, 1, 1, 1, 1,
-0.9391436, -0.7884542, -2.569227, 1, 1, 1, 1, 1,
-0.9387825, -0.7089155, -2.290344, 1, 1, 1, 1, 1,
-0.9356518, -0.1851234, -0.6916151, 1, 1, 1, 1, 1,
-0.9306995, -1.64805, -1.783929, 1, 1, 1, 1, 1,
-0.9273348, -0.4927342, -2.252403, 0, 0, 1, 1, 1,
-0.9214441, 0.848819, -0.6175653, 1, 0, 0, 1, 1,
-0.9058158, -0.9902213, -2.249895, 1, 0, 0, 1, 1,
-0.9042085, -0.1805056, -1.385539, 1, 0, 0, 1, 1,
-0.9014209, 0.217449, -0.3956601, 1, 0, 0, 1, 1,
-0.8959191, 1.710444, -1.293868, 1, 0, 0, 1, 1,
-0.8867107, -2.402547, -4.414662, 0, 0, 0, 1, 1,
-0.8827997, 1.220998, -1.724163, 0, 0, 0, 1, 1,
-0.8811269, 0.2715401, -0.08377779, 0, 0, 0, 1, 1,
-0.8704299, -0.2725299, -0.8781332, 0, 0, 0, 1, 1,
-0.866476, 0.1011677, -2.640704, 0, 0, 0, 1, 1,
-0.864557, -0.7497283, -3.346469, 0, 0, 0, 1, 1,
-0.8629605, -2.331227, -3.702592, 0, 0, 0, 1, 1,
-0.8619119, 0.121344, -0.8706903, 1, 1, 1, 1, 1,
-0.8538098, 0.2085059, -0.1799798, 1, 1, 1, 1, 1,
-0.8460454, 1.360271, -0.1435763, 1, 1, 1, 1, 1,
-0.8403279, 1.032106, -2.732782, 1, 1, 1, 1, 1,
-0.8280261, -1.033479, -4.44329, 1, 1, 1, 1, 1,
-0.8267542, 1.306541, -0.1550497, 1, 1, 1, 1, 1,
-0.8239526, -1.09673, -3.875274, 1, 1, 1, 1, 1,
-0.8228334, 0.03539773, -1.968583, 1, 1, 1, 1, 1,
-0.8159204, -0.3526681, -2.293164, 1, 1, 1, 1, 1,
-0.8146057, 2.496303, -1.450074, 1, 1, 1, 1, 1,
-0.8050444, 0.5235251, -0.04784538, 1, 1, 1, 1, 1,
-0.8027047, -0.05127716, -1.606371, 1, 1, 1, 1, 1,
-0.7985058, 1.220796, -0.1393539, 1, 1, 1, 1, 1,
-0.7909796, 1.408016, -0.8737799, 1, 1, 1, 1, 1,
-0.7897924, -1.144083, -2.539707, 1, 1, 1, 1, 1,
-0.789308, -0.225124, -0.6570573, 0, 0, 1, 1, 1,
-0.7860456, -0.7765665, -0.3691537, 1, 0, 0, 1, 1,
-0.7845966, 1.199392, 0.9635271, 1, 0, 0, 1, 1,
-0.7762019, 1.612237, -1.449535, 1, 0, 0, 1, 1,
-0.7759554, -2.335763, -5.593116, 1, 0, 0, 1, 1,
-0.7712877, -1.511544, -1.315543, 1, 0, 0, 1, 1,
-0.7653237, 0.7833292, -0.8272279, 0, 0, 0, 1, 1,
-0.7648586, -1.159785, -1.952008, 0, 0, 0, 1, 1,
-0.7618474, -0.8891397, -0.417583, 0, 0, 0, 1, 1,
-0.7582294, 0.2264653, -1.835591, 0, 0, 0, 1, 1,
-0.7580572, 0.3999852, -2.764425, 0, 0, 0, 1, 1,
-0.7578716, 0.421833, -0.6246881, 0, 0, 0, 1, 1,
-0.7569884, 1.169665, 0.2100717, 0, 0, 0, 1, 1,
-0.7514169, 0.5803991, -0.9389682, 1, 1, 1, 1, 1,
-0.7487745, 0.7492262, 0.2937061, 1, 1, 1, 1, 1,
-0.7462278, 1.219778, 0.01260757, 1, 1, 1, 1, 1,
-0.7451421, -0.7686306, -3.310701, 1, 1, 1, 1, 1,
-0.7410669, 0.2419816, -1.320862, 1, 1, 1, 1, 1,
-0.738739, 0.4028188, -1.127949, 1, 1, 1, 1, 1,
-0.7361043, 1.121571, -0.1392582, 1, 1, 1, 1, 1,
-0.7355149, -1.302765, -1.483592, 1, 1, 1, 1, 1,
-0.7348174, 1.268513, 0.4924651, 1, 1, 1, 1, 1,
-0.7343116, 1.111851, -0.4307282, 1, 1, 1, 1, 1,
-0.7329396, -0.6735435, -2.343514, 1, 1, 1, 1, 1,
-0.7247233, -0.4763354, -1.46604, 1, 1, 1, 1, 1,
-0.7221832, 1.653811, -2.513689, 1, 1, 1, 1, 1,
-0.7207508, -1.072163, -2.154342, 1, 1, 1, 1, 1,
-0.7205454, -0.3124212, -3.059215, 1, 1, 1, 1, 1,
-0.7189334, -1.14283, -1.595028, 0, 0, 1, 1, 1,
-0.7129897, -3.063963, -1.53785, 1, 0, 0, 1, 1,
-0.7086527, -0.6196178, -2.986822, 1, 0, 0, 1, 1,
-0.7035055, -0.7536148, -3.068286, 1, 0, 0, 1, 1,
-0.7033905, -0.2321635, -2.51586, 1, 0, 0, 1, 1,
-0.7001673, -1.510493, -3.655753, 1, 0, 0, 1, 1,
-0.6992613, 0.9648169, -1.694927, 0, 0, 0, 1, 1,
-0.6992525, -0.1527535, -1.795429, 0, 0, 0, 1, 1,
-0.6891209, -0.3382621, -1.878904, 0, 0, 0, 1, 1,
-0.6857699, -0.4486239, -1.2924, 0, 0, 0, 1, 1,
-0.6847709, 0.7380727, -0.3105163, 0, 0, 0, 1, 1,
-0.6831892, 0.179988, -1.922696, 0, 0, 0, 1, 1,
-0.6825521, 0.3455849, -1.131139, 0, 0, 0, 1, 1,
-0.6794253, -0.2148862, -2.559106, 1, 1, 1, 1, 1,
-0.6715444, -0.8277636, -4.324748, 1, 1, 1, 1, 1,
-0.6689619, 1.77922, 0.8993027, 1, 1, 1, 1, 1,
-0.6669653, -0.5725601, -1.639977, 1, 1, 1, 1, 1,
-0.6632608, 1.061893, -1.418711, 1, 1, 1, 1, 1,
-0.6568315, -0.1492959, -1.657552, 1, 1, 1, 1, 1,
-0.651108, -0.4538881, -2.907333, 1, 1, 1, 1, 1,
-0.6477219, -0.07082861, -0.7088143, 1, 1, 1, 1, 1,
-0.6410946, 2.191308, -0.1627794, 1, 1, 1, 1, 1,
-0.6371316, 0.399763, -2.031681, 1, 1, 1, 1, 1,
-0.6350866, -0.1026274, -0.9741735, 1, 1, 1, 1, 1,
-0.6292496, 1.010934, 1.876832, 1, 1, 1, 1, 1,
-0.6206062, -0.9783245, -2.179844, 1, 1, 1, 1, 1,
-0.6200909, -0.4944821, -4.04949, 1, 1, 1, 1, 1,
-0.6171806, 0.03143609, -2.477623, 1, 1, 1, 1, 1,
-0.6170095, -0.89214, -1.786285, 0, 0, 1, 1, 1,
-0.6160653, 0.07348631, -2.203478, 1, 0, 0, 1, 1,
-0.6145326, -1.244724, -3.800624, 1, 0, 0, 1, 1,
-0.6121021, -0.1280535, -1.303774, 1, 0, 0, 1, 1,
-0.6084521, -1.274337, -3.726328, 1, 0, 0, 1, 1,
-0.6078309, -0.9363091, -3.630158, 1, 0, 0, 1, 1,
-0.6072231, -1.17811, -3.352972, 0, 0, 0, 1, 1,
-0.606569, -1.20767, -2.507495, 0, 0, 0, 1, 1,
-0.6045552, 0.646943, 0.2265398, 0, 0, 0, 1, 1,
-0.5914734, -1.723752, -3.60011, 0, 0, 0, 1, 1,
-0.587369, 1.064652, -0.9867806, 0, 0, 0, 1, 1,
-0.586482, -0.9795533, -2.656319, 0, 0, 0, 1, 1,
-0.5831807, 0.1330525, -0.4581493, 0, 0, 0, 1, 1,
-0.580985, -1.01264, -2.545448, 1, 1, 1, 1, 1,
-0.5782864, 0.5186322, -0.6185901, 1, 1, 1, 1, 1,
-0.5765164, -2.281876, -3.532769, 1, 1, 1, 1, 1,
-0.5703444, 2.757613, -1.170478, 1, 1, 1, 1, 1,
-0.5693026, -2.000746, -1.407274, 1, 1, 1, 1, 1,
-0.5587926, 0.9414156, -0.05003492, 1, 1, 1, 1, 1,
-0.5558926, -0.05553882, -0.3209892, 1, 1, 1, 1, 1,
-0.5549079, 1.663799, 0.3831086, 1, 1, 1, 1, 1,
-0.5545815, 1.474927, -0.6669216, 1, 1, 1, 1, 1,
-0.5540497, 0.560621, -0.2958245, 1, 1, 1, 1, 1,
-0.5463266, -0.9617044, -0.09018977, 1, 1, 1, 1, 1,
-0.5451863, -0.7102128, -2.286046, 1, 1, 1, 1, 1,
-0.538078, -0.4724752, -3.397449, 1, 1, 1, 1, 1,
-0.5364428, -0.1919161, -2.732154, 1, 1, 1, 1, 1,
-0.5297659, 0.7397267, 1.222265, 1, 1, 1, 1, 1,
-0.5279875, -1.056014, -2.293885, 0, 0, 1, 1, 1,
-0.5275499, 1.215996, -0.3251244, 1, 0, 0, 1, 1,
-0.5232385, 1.022962, -2.343974, 1, 0, 0, 1, 1,
-0.5174652, 1.37282, -1.191221, 1, 0, 0, 1, 1,
-0.5163163, -0.5034133, -2.934933, 1, 0, 0, 1, 1,
-0.5111442, -0.3437553, -3.140489, 1, 0, 0, 1, 1,
-0.5091193, 0.8833662, -0.7568849, 0, 0, 0, 1, 1,
-0.508034, 0.5698662, 0.4315682, 0, 0, 0, 1, 1,
-0.5053967, -0.9950503, -3.724265, 0, 0, 0, 1, 1,
-0.505012, 1.708575, 0.2968433, 0, 0, 0, 1, 1,
-0.5041817, -0.9516987, -1.25061, 0, 0, 0, 1, 1,
-0.4996632, -0.1026401, -1.215769, 0, 0, 0, 1, 1,
-0.4965494, 1.592403, 1.94458, 0, 0, 0, 1, 1,
-0.4932026, 1.726887, -0.3004551, 1, 1, 1, 1, 1,
-0.4903285, 0.2032148, 1.077784, 1, 1, 1, 1, 1,
-0.4898983, 0.2595993, -0.419989, 1, 1, 1, 1, 1,
-0.4878233, 0.3982934, -1.179461, 1, 1, 1, 1, 1,
-0.4790449, 0.6195947, -1.402028, 1, 1, 1, 1, 1,
-0.4789585, -0.4274868, -3.287785, 1, 1, 1, 1, 1,
-0.4789374, 0.07127205, -0.2793542, 1, 1, 1, 1, 1,
-0.4764113, 0.7129769, -0.3013276, 1, 1, 1, 1, 1,
-0.4752211, -0.397862, -3.317664, 1, 1, 1, 1, 1,
-0.4743439, 0.2304712, -0.2352969, 1, 1, 1, 1, 1,
-0.4717216, 1.07137, -1.396239, 1, 1, 1, 1, 1,
-0.4703818, 1.463584, -0.4602514, 1, 1, 1, 1, 1,
-0.4605395, 0.01172679, -2.324002, 1, 1, 1, 1, 1,
-0.4560727, -0.6840176, -1.883904, 1, 1, 1, 1, 1,
-0.4556413, 0.2962157, 1.130168, 1, 1, 1, 1, 1,
-0.4534683, 0.3413334, -1.740492, 0, 0, 1, 1, 1,
-0.452706, 0.7600113, -0.1187311, 1, 0, 0, 1, 1,
-0.4524035, 0.6838725, -0.2267292, 1, 0, 0, 1, 1,
-0.4519494, -0.6111597, -3.803047, 1, 0, 0, 1, 1,
-0.4516315, 2.935206, -1.800603, 1, 0, 0, 1, 1,
-0.4471304, -1.655252, -4.631028, 1, 0, 0, 1, 1,
-0.4462596, -1.034096, -2.336702, 0, 0, 0, 1, 1,
-0.4421685, 1.226841, 0.003319422, 0, 0, 0, 1, 1,
-0.441923, -0.4244835, -2.340929, 0, 0, 0, 1, 1,
-0.4391577, -1.017168, -3.220749, 0, 0, 0, 1, 1,
-0.4362902, 1.945809, -3.140633, 0, 0, 0, 1, 1,
-0.4337882, -0.2762221, -2.820742, 0, 0, 0, 1, 1,
-0.4336415, -0.6003891, -2.368238, 0, 0, 0, 1, 1,
-0.4302331, -1.168818, -4.08746, 1, 1, 1, 1, 1,
-0.426158, 2.192586, -0.6714224, 1, 1, 1, 1, 1,
-0.4222254, 1.374905, 0.1588251, 1, 1, 1, 1, 1,
-0.4211173, -0.06648692, -2.40122, 1, 1, 1, 1, 1,
-0.4192531, 0.7421845, -0.6263132, 1, 1, 1, 1, 1,
-0.4188841, -1.593707, -3.580916, 1, 1, 1, 1, 1,
-0.4153841, 0.6789585, -0.2067586, 1, 1, 1, 1, 1,
-0.4133107, -2.81914, -3.958004, 1, 1, 1, 1, 1,
-0.4026111, 0.659663, 0.01436875, 1, 1, 1, 1, 1,
-0.4001211, -0.374007, -3.287083, 1, 1, 1, 1, 1,
-0.3984842, 0.3391255, -0.1199479, 1, 1, 1, 1, 1,
-0.3969167, 0.6152977, -1.881249, 1, 1, 1, 1, 1,
-0.3962699, 0.1888293, -1.436088, 1, 1, 1, 1, 1,
-0.3944384, -1.498302, -3.249524, 1, 1, 1, 1, 1,
-0.3923602, -0.4624435, -2.133338, 1, 1, 1, 1, 1,
-0.3899003, -1.282154, -4.132086, 0, 0, 1, 1, 1,
-0.3892172, -0.01029595, -0.8106889, 1, 0, 0, 1, 1,
-0.3887907, 0.6637543, -1.703745, 1, 0, 0, 1, 1,
-0.3826501, 1.391002, -0.6242641, 1, 0, 0, 1, 1,
-0.3799722, 0.6167967, -1.414877, 1, 0, 0, 1, 1,
-0.3776568, 0.6814225, -0.7674161, 1, 0, 0, 1, 1,
-0.376233, -1.525167, -2.131684, 0, 0, 0, 1, 1,
-0.3744316, 0.6652855, -1.525878, 0, 0, 0, 1, 1,
-0.3694742, 0.4978804, -0.2483953, 0, 0, 0, 1, 1,
-0.3681139, 0.6409802, -2.967197, 0, 0, 0, 1, 1,
-0.364796, 1.037092, -1.090536, 0, 0, 0, 1, 1,
-0.3621751, -0.6879627, -2.726837, 0, 0, 0, 1, 1,
-0.3552831, -0.005810825, -2.490483, 0, 0, 0, 1, 1,
-0.3531478, -0.8551173, -3.1601, 1, 1, 1, 1, 1,
-0.3501203, -0.3206575, -0.9072835, 1, 1, 1, 1, 1,
-0.3481795, 0.6024184, 0.6577837, 1, 1, 1, 1, 1,
-0.3444726, 1.02832, -1.930344, 1, 1, 1, 1, 1,
-0.3400368, 0.09218629, -1.702349, 1, 1, 1, 1, 1,
-0.339901, -0.5665986, -2.373808, 1, 1, 1, 1, 1,
-0.3341197, 0.2467479, 1.051726, 1, 1, 1, 1, 1,
-0.3278476, 1.384297, -1.765437, 1, 1, 1, 1, 1,
-0.3267604, 1.605021, -1.153411, 1, 1, 1, 1, 1,
-0.3232344, -1.521982, -1.970884, 1, 1, 1, 1, 1,
-0.3217489, -0.4138029, -3.098124, 1, 1, 1, 1, 1,
-0.3214386, 0.3195036, -1.000211, 1, 1, 1, 1, 1,
-0.3192874, 0.7920527, -0.352328, 1, 1, 1, 1, 1,
-0.3162383, 1.256606, 1.197852, 1, 1, 1, 1, 1,
-0.3156063, 2.059386, -0.9950793, 1, 1, 1, 1, 1,
-0.3106956, -0.2964666, -1.537509, 0, 0, 1, 1, 1,
-0.3073355, -1.313539, -3.784038, 1, 0, 0, 1, 1,
-0.3063255, 0.5802961, -0.6722597, 1, 0, 0, 1, 1,
-0.3034661, -1.078637, -3.444106, 1, 0, 0, 1, 1,
-0.301785, -0.05869096, -2.830861, 1, 0, 0, 1, 1,
-0.3017444, -0.5874717, -2.359534, 1, 0, 0, 1, 1,
-0.2992852, -0.4205063, -2.812351, 0, 0, 0, 1, 1,
-0.2991492, 0.834604, -1.689988, 0, 0, 0, 1, 1,
-0.2938845, 2.031237, -0.7544789, 0, 0, 0, 1, 1,
-0.2910578, -0.212758, -1.799032, 0, 0, 0, 1, 1,
-0.2887821, 1.226966, -0.2426344, 0, 0, 0, 1, 1,
-0.2883919, 1.241835, 0.05384737, 0, 0, 0, 1, 1,
-0.2843669, 1.481699, -0.2038752, 0, 0, 0, 1, 1,
-0.2828446, -2.1045, -2.009132, 1, 1, 1, 1, 1,
-0.2817165, -0.09805182, -1.138363, 1, 1, 1, 1, 1,
-0.2806364, 0.5365008, -0.8594347, 1, 1, 1, 1, 1,
-0.2784175, -0.5517927, -3.106445, 1, 1, 1, 1, 1,
-0.2745831, 1.825833, 0.01417575, 1, 1, 1, 1, 1,
-0.2737455, -1.701782, -2.564217, 1, 1, 1, 1, 1,
-0.2650537, 1.681914, 0.2450875, 1, 1, 1, 1, 1,
-0.2606572, -0.2795165, -1.382064, 1, 1, 1, 1, 1,
-0.2591145, 0.2032749, -0.5992514, 1, 1, 1, 1, 1,
-0.2566484, 1.251926, -0.4965942, 1, 1, 1, 1, 1,
-0.2554706, 0.3254123, -0.8304669, 1, 1, 1, 1, 1,
-0.2546085, 0.06400359, -2.595469, 1, 1, 1, 1, 1,
-0.2536875, -0.3640004, -3.626588, 1, 1, 1, 1, 1,
-0.2513531, 1.114235, -1.355881, 1, 1, 1, 1, 1,
-0.2456994, 2.148053, 0.6237658, 1, 1, 1, 1, 1,
-0.2379647, -0.8015954, -2.453851, 0, 0, 1, 1, 1,
-0.2231451, 0.1690205, -0.3330925, 1, 0, 0, 1, 1,
-0.2229983, 0.2237895, 1.082007, 1, 0, 0, 1, 1,
-0.2206511, 0.467771, 2.132424, 1, 0, 0, 1, 1,
-0.215171, 0.3061714, 0.6531886, 1, 0, 0, 1, 1,
-0.2141081, 0.6217955, -2.507261, 1, 0, 0, 1, 1,
-0.2129028, -0.1806781, -3.285941, 0, 0, 0, 1, 1,
-0.212027, 0.1338184, -0.7862954, 0, 0, 0, 1, 1,
-0.2113121, -0.1000606, 1.373611, 0, 0, 0, 1, 1,
-0.2078919, 0.5808648, -1.803809, 0, 0, 0, 1, 1,
-0.2032187, 2.982971, 0.3353467, 0, 0, 0, 1, 1,
-0.2019926, 0.1211808, -1.511585, 0, 0, 0, 1, 1,
-0.201939, 0.6640842, -1.045377, 0, 0, 0, 1, 1,
-0.2006177, -1.064949, -3.013108, 1, 1, 1, 1, 1,
-0.2001099, 0.9125589, -0.1065732, 1, 1, 1, 1, 1,
-0.1908356, -1.556991, -1.997986, 1, 1, 1, 1, 1,
-0.189821, -0.4616023, -3.065429, 1, 1, 1, 1, 1,
-0.1890449, -0.2437103, -2.212181, 1, 1, 1, 1, 1,
-0.1827539, 0.6256003, 1.815227, 1, 1, 1, 1, 1,
-0.1810156, -1.724079, -2.762545, 1, 1, 1, 1, 1,
-0.1790339, -0.878234, -3.951598, 1, 1, 1, 1, 1,
-0.1749326, -0.08135252, -3.254579, 1, 1, 1, 1, 1,
-0.1747691, -0.351318, -3.473572, 1, 1, 1, 1, 1,
-0.1715184, 1.048183, -0.7034652, 1, 1, 1, 1, 1,
-0.1640697, 1.406035, -0.637058, 1, 1, 1, 1, 1,
-0.1621174, -0.5404, -2.350028, 1, 1, 1, 1, 1,
-0.157039, 1.348094, 0.6638776, 1, 1, 1, 1, 1,
-0.1561985, -1.877118, -2.250318, 1, 1, 1, 1, 1,
-0.1551538, 0.6604548, -1.359496, 0, 0, 1, 1, 1,
-0.155099, -1.575478, -2.825013, 1, 0, 0, 1, 1,
-0.1541982, -0.05218623, -2.138688, 1, 0, 0, 1, 1,
-0.1540814, 0.04732726, -0.8216757, 1, 0, 0, 1, 1,
-0.1444989, -1.04885, -2.959461, 1, 0, 0, 1, 1,
-0.1412063, -0.3023644, -2.182619, 1, 0, 0, 1, 1,
-0.1379126, 0.871044, -1.021086, 0, 0, 0, 1, 1,
-0.1367359, -1.002788, -3.559837, 0, 0, 0, 1, 1,
-0.1289883, -0.2335077, -4.563397, 0, 0, 0, 1, 1,
-0.1289064, 0.6965216, -2.649782, 0, 0, 0, 1, 1,
-0.1277411, 0.7659436, -2.162103, 0, 0, 0, 1, 1,
-0.126514, 0.4372005, -0.6775495, 0, 0, 0, 1, 1,
-0.1254716, -0.9194992, -1.343719, 0, 0, 0, 1, 1,
-0.1239868, 0.4435634, -0.1375906, 1, 1, 1, 1, 1,
-0.1231437, -2.900105, -1.809578, 1, 1, 1, 1, 1,
-0.1197602, 1.236083, 0.4113569, 1, 1, 1, 1, 1,
-0.1196259, 0.3371917, -1.288838, 1, 1, 1, 1, 1,
-0.1195971, -0.6133338, -2.16007, 1, 1, 1, 1, 1,
-0.1192308, -0.3027683, 0.09725085, 1, 1, 1, 1, 1,
-0.1188155, -1.276902, -6.00967, 1, 1, 1, 1, 1,
-0.1168253, -0.1028552, -0.7856978, 1, 1, 1, 1, 1,
-0.1168183, -0.9792467, -2.180971, 1, 1, 1, 1, 1,
-0.1112147, 1.052054, -0.2174928, 1, 1, 1, 1, 1,
-0.107887, -1.444686, -2.606398, 1, 1, 1, 1, 1,
-0.1054751, 1.253163, 0.2777722, 1, 1, 1, 1, 1,
-0.1026364, 0.02363656, -0.3159404, 1, 1, 1, 1, 1,
-0.09408239, -0.1994939, -2.17647, 1, 1, 1, 1, 1,
-0.09375057, 0.5253039, -0.2279849, 1, 1, 1, 1, 1,
-0.08598579, -2.539594, -3.338265, 0, 0, 1, 1, 1,
-0.08533849, 0.264983, -0.04036455, 1, 0, 0, 1, 1,
-0.08525827, 0.8148806, -1.537978, 1, 0, 0, 1, 1,
-0.0844589, 0.5187674, -1.917775, 1, 0, 0, 1, 1,
-0.07849164, 1.929529, -0.5662816, 1, 0, 0, 1, 1,
-0.0769058, 0.9920163, -1.12563, 1, 0, 0, 1, 1,
-0.07607673, -1.174384, -3.956023, 0, 0, 0, 1, 1,
-0.0759555, -1.402368, -3.987984, 0, 0, 0, 1, 1,
-0.07460387, 0.3042199, -1.937955, 0, 0, 0, 1, 1,
-0.07288073, -1.697855, -4.377811, 0, 0, 0, 1, 1,
-0.06780016, -0.6827387, -4.595485, 0, 0, 0, 1, 1,
-0.0670749, -0.02542821, -1.652443, 0, 0, 0, 1, 1,
-0.06675037, 0.4491592, -0.2021995, 0, 0, 0, 1, 1,
-0.06179754, 0.1988589, -0.1176089, 1, 1, 1, 1, 1,
-0.06057201, 1.992857, -1.030074, 1, 1, 1, 1, 1,
-0.06013091, 0.4566284, 0.7426494, 1, 1, 1, 1, 1,
-0.0582607, 1.491488, 0.05211041, 1, 1, 1, 1, 1,
-0.05696099, 0.4966551, 0.7659132, 1, 1, 1, 1, 1,
-0.05010558, -1.347051, -3.193413, 1, 1, 1, 1, 1,
-0.04823349, 0.9580335, 0.392841, 1, 1, 1, 1, 1,
-0.04276574, -1.602727, -3.13459, 1, 1, 1, 1, 1,
-0.03805029, -0.546231, -2.642676, 1, 1, 1, 1, 1,
-0.036526, 0.8797131, -0.7344638, 1, 1, 1, 1, 1,
-0.03120039, 0.8736796, -0.2006128, 1, 1, 1, 1, 1,
-0.03030499, 0.2695566, -1.208719, 1, 1, 1, 1, 1,
-0.02940078, -1.403901, -3.501804, 1, 1, 1, 1, 1,
-0.02819796, 0.5214629, 1.739621, 1, 1, 1, 1, 1,
-0.02597389, -0.9019566, -2.049065, 1, 1, 1, 1, 1,
-0.02363774, 0.5433017, -0.87731, 0, 0, 1, 1, 1,
-0.01886483, 0.8273315, 0.2957108, 1, 0, 0, 1, 1,
-0.01022512, 0.169476, 0.5003778, 1, 0, 0, 1, 1,
-0.009867554, -0.1344129, -3.527798, 1, 0, 0, 1, 1,
-0.007929487, -0.7187501, -2.873075, 1, 0, 0, 1, 1,
-0.007881434, 0.2940061, 0.3001805, 1, 0, 0, 1, 1,
-0.003583853, 0.5228457, -0.7836199, 0, 0, 0, 1, 1,
0.005616791, 0.04523686, 0.6037771, 0, 0, 0, 1, 1,
0.007225289, -1.633426, 2.350909, 0, 0, 0, 1, 1,
0.007547824, -1.013274, 4.555951, 0, 0, 0, 1, 1,
0.008336731, -0.1691799, 3.552923, 0, 0, 0, 1, 1,
0.01111898, -0.4835803, 3.923163, 0, 0, 0, 1, 1,
0.01178832, 2.005575, -0.123337, 0, 0, 0, 1, 1,
0.01194116, 0.9016459, -0.1513568, 1, 1, 1, 1, 1,
0.0122187, 1.626471, -1.327023, 1, 1, 1, 1, 1,
0.01224266, 0.606502, -0.4791725, 1, 1, 1, 1, 1,
0.01321819, -0.7606257, 1.912484, 1, 1, 1, 1, 1,
0.01417677, -0.3927761, 4.591121, 1, 1, 1, 1, 1,
0.01878248, -0.01203173, 3.330021, 1, 1, 1, 1, 1,
0.01897555, -0.1177232, 2.233559, 1, 1, 1, 1, 1,
0.01908616, 1.999543, 0.9670552, 1, 1, 1, 1, 1,
0.01931672, -2.023494, 2.964765, 1, 1, 1, 1, 1,
0.02006949, 1.271797, 0.02827939, 1, 1, 1, 1, 1,
0.02150909, 0.4743783, 0.07221638, 1, 1, 1, 1, 1,
0.02933908, -0.7834157, 5.449587, 1, 1, 1, 1, 1,
0.03429315, 0.1042685, 0.9474406, 1, 1, 1, 1, 1,
0.03518393, 1.276413, 0.8374093, 1, 1, 1, 1, 1,
0.03868949, -1.284757, 2.41703, 1, 1, 1, 1, 1,
0.04358934, 0.5684498, -0.02285069, 0, 0, 1, 1, 1,
0.04818162, 1.608942, -1.346149, 1, 0, 0, 1, 1,
0.0485285, -0.08630552, 0.2513707, 1, 0, 0, 1, 1,
0.04958361, -0.1877342, 1.336025, 1, 0, 0, 1, 1,
0.05514736, -2.381166, 3.645058, 1, 0, 0, 1, 1,
0.05663202, -1.175946, 2.887323, 1, 0, 0, 1, 1,
0.05714925, -0.2819076, 2.994902, 0, 0, 0, 1, 1,
0.06316049, -0.3296157, 2.718649, 0, 0, 0, 1, 1,
0.06959148, 0.03625143, 0.9200838, 0, 0, 0, 1, 1,
0.06970983, 1.043507, -1.23341, 0, 0, 0, 1, 1,
0.07454101, -0.5245407, 0.5750176, 0, 0, 0, 1, 1,
0.0748544, 0.1421739, 0.4251958, 0, 0, 0, 1, 1,
0.0755082, 0.3968991, 0.4675223, 0, 0, 0, 1, 1,
0.07982198, -0.2829189, 1.37365, 1, 1, 1, 1, 1,
0.08136976, -0.2853738, 4.216619, 1, 1, 1, 1, 1,
0.0922962, 0.7655979, -0.9914403, 1, 1, 1, 1, 1,
0.09242228, -1.763085, 2.077332, 1, 1, 1, 1, 1,
0.09273069, 0.2705646, -0.3824149, 1, 1, 1, 1, 1,
0.09387963, -1.473301, 3.583403, 1, 1, 1, 1, 1,
0.1040215, -0.3543289, 4.85771, 1, 1, 1, 1, 1,
0.105756, -2.254735, 2.32177, 1, 1, 1, 1, 1,
0.1090798, -1.083982, 3.265382, 1, 1, 1, 1, 1,
0.1100043, 1.2437, -1.785353, 1, 1, 1, 1, 1,
0.1108818, -1.348455, 4.206535, 1, 1, 1, 1, 1,
0.111704, -0.2031633, 3.920067, 1, 1, 1, 1, 1,
0.1143066, 1.948149, 1.165128, 1, 1, 1, 1, 1,
0.1165741, 0.4078153, 1.994595, 1, 1, 1, 1, 1,
0.1175918, 1.720328, -0.1321266, 1, 1, 1, 1, 1,
0.1229161, -0.9914433, 2.669237, 0, 0, 1, 1, 1,
0.1249766, -0.5391312, 3.175695, 1, 0, 0, 1, 1,
0.1316461, -0.07600872, 2.339909, 1, 0, 0, 1, 1,
0.1320029, -0.03023652, 1.083423, 1, 0, 0, 1, 1,
0.1326292, 0.8505009, 0.7765819, 1, 0, 0, 1, 1,
0.1372759, 2.762651, 0.04999248, 1, 0, 0, 1, 1,
0.1374362, -0.1574017, 4.524887, 0, 0, 0, 1, 1,
0.1379555, -1.22978, 2.940717, 0, 0, 0, 1, 1,
0.1388045, -0.1811315, 1.526311, 0, 0, 0, 1, 1,
0.1390847, 0.718537, 1.59657, 0, 0, 0, 1, 1,
0.1409853, -2.152599, 2.292523, 0, 0, 0, 1, 1,
0.1413662, 0.8069471, 0.9435063, 0, 0, 0, 1, 1,
0.1431164, 0.1326768, 1.042377, 0, 0, 0, 1, 1,
0.144248, 1.041583, 1.682399, 1, 1, 1, 1, 1,
0.1447728, 0.9629724, 1.350411, 1, 1, 1, 1, 1,
0.1492794, -0.8870311, 0.873327, 1, 1, 1, 1, 1,
0.1493004, 0.3491445, 2.654061, 1, 1, 1, 1, 1,
0.1537224, -0.009656802, 2.346132, 1, 1, 1, 1, 1,
0.1546884, 0.662757, 2.630892, 1, 1, 1, 1, 1,
0.1551494, 1.294338, 0.5849046, 1, 1, 1, 1, 1,
0.1614895, 1.556991, 0.2795679, 1, 1, 1, 1, 1,
0.1615567, 1.559314, 0.8157989, 1, 1, 1, 1, 1,
0.1616776, -0.8944115, 2.434754, 1, 1, 1, 1, 1,
0.1674113, 0.8988768, -1.0253, 1, 1, 1, 1, 1,
0.1679048, -1.003091, 3.255297, 1, 1, 1, 1, 1,
0.1728702, 0.4218252, 0.6004058, 1, 1, 1, 1, 1,
0.1731457, 0.08049808, 2.358957, 1, 1, 1, 1, 1,
0.177931, -0.1747483, 2.407389, 1, 1, 1, 1, 1,
0.1787911, -1.437858, 2.576878, 0, 0, 1, 1, 1,
0.1807368, -0.6068223, 1.51219, 1, 0, 0, 1, 1,
0.1853717, -0.2648961, 3.690835, 1, 0, 0, 1, 1,
0.1895178, 0.4263186, 0.1858156, 1, 0, 0, 1, 1,
0.1922742, -0.0726036, 2.147762, 1, 0, 0, 1, 1,
0.1960937, -2.7864, 2.83047, 1, 0, 0, 1, 1,
0.2008259, 0.4131979, 0.5953812, 0, 0, 0, 1, 1,
0.2030843, 1.65363, 1.409796, 0, 0, 0, 1, 1,
0.2031827, -0.2867226, 3.895152, 0, 0, 0, 1, 1,
0.203971, 0.4398841, 1.856102, 0, 0, 0, 1, 1,
0.2048389, 0.6663983, -1.341164, 0, 0, 0, 1, 1,
0.2079018, 0.8022642, -1.543281, 0, 0, 0, 1, 1,
0.2106301, 0.4527667, 1.292115, 0, 0, 0, 1, 1,
0.2159012, -0.9879453, 3.580844, 1, 1, 1, 1, 1,
0.2177329, -1.508035, 2.600531, 1, 1, 1, 1, 1,
0.2191276, -1.19957, 2.592283, 1, 1, 1, 1, 1,
0.2194218, -0.939988, 1.949376, 1, 1, 1, 1, 1,
0.222902, -0.05870418, 1.442032, 1, 1, 1, 1, 1,
0.2243902, 1.096042, -2.082424, 1, 1, 1, 1, 1,
0.2256324, -0.9120854, 3.459925, 1, 1, 1, 1, 1,
0.2259383, 0.3118311, 2.398562, 1, 1, 1, 1, 1,
0.2274161, 0.6111951, 0.2251294, 1, 1, 1, 1, 1,
0.2320281, -0.6031178, 3.544214, 1, 1, 1, 1, 1,
0.2320408, 0.1177557, 0.557656, 1, 1, 1, 1, 1,
0.2346161, -0.0560026, -0.1297284, 1, 1, 1, 1, 1,
0.2371838, -0.2721476, 2.657983, 1, 1, 1, 1, 1,
0.238434, 1.272384, -0.9782597, 1, 1, 1, 1, 1,
0.2399553, -0.5282038, 1.748501, 1, 1, 1, 1, 1,
0.2429395, 0.03993424, 3.1004, 0, 0, 1, 1, 1,
0.2435692, 0.8387082, 1.561522, 1, 0, 0, 1, 1,
0.2495996, -0.7874188, 3.049177, 1, 0, 0, 1, 1,
0.2514993, -1.212238, 3.648832, 1, 0, 0, 1, 1,
0.2515306, -1.26646, 1.778387, 1, 0, 0, 1, 1,
0.2531618, 1.508498, 0.3104007, 1, 0, 0, 1, 1,
0.2538569, -0.9655557, 4.610933, 0, 0, 0, 1, 1,
0.2541234, -0.1330109, 0.7182172, 0, 0, 0, 1, 1,
0.2560188, -0.3788779, 3.0249, 0, 0, 0, 1, 1,
0.2561539, 0.09741435, 0.4968444, 0, 0, 0, 1, 1,
0.257919, 0.07009911, 2.086301, 0, 0, 0, 1, 1,
0.2597797, -0.9540882, 3.132474, 0, 0, 0, 1, 1,
0.2629548, 0.1234434, 1.648757, 0, 0, 0, 1, 1,
0.2678562, 0.990243, 0.2636993, 1, 1, 1, 1, 1,
0.2723661, 0.7667664, 0.7333515, 1, 1, 1, 1, 1,
0.2733446, -1.525619, 3.043453, 1, 1, 1, 1, 1,
0.2787485, -1.057917, 1.660093, 1, 1, 1, 1, 1,
0.2794812, -0.4737507, 2.197071, 1, 1, 1, 1, 1,
0.2796405, -0.5285359, 1.600695, 1, 1, 1, 1, 1,
0.281686, -0.8380009, 2.743478, 1, 1, 1, 1, 1,
0.2820773, 0.5109545, -0.7309964, 1, 1, 1, 1, 1,
0.2856774, 0.8163487, 0.1338022, 1, 1, 1, 1, 1,
0.2883897, -0.2350243, 4.032084, 1, 1, 1, 1, 1,
0.2911765, -1.167096, 4.757164, 1, 1, 1, 1, 1,
0.2960088, -0.2843462, 2.689579, 1, 1, 1, 1, 1,
0.2985174, -0.574446, 2.131318, 1, 1, 1, 1, 1,
0.3016376, 0.2656713, 1.992745, 1, 1, 1, 1, 1,
0.302391, -0.9973391, 2.95549, 1, 1, 1, 1, 1,
0.3115841, 0.9955463, 1.700923, 0, 0, 1, 1, 1,
0.3209249, 0.1246845, -0.3190925, 1, 0, 0, 1, 1,
0.3226803, -0.01577178, 0.6203242, 1, 0, 0, 1, 1,
0.3261248, 0.5115104, 0.6660045, 1, 0, 0, 1, 1,
0.3280559, -0.784107, 0.9957523, 1, 0, 0, 1, 1,
0.328325, 0.452415, 1.368244, 1, 0, 0, 1, 1,
0.3349674, -0.4280771, 3.298026, 0, 0, 0, 1, 1,
0.3392807, 0.544902, -0.4499644, 0, 0, 0, 1, 1,
0.3411659, 0.5662714, -0.05468481, 0, 0, 0, 1, 1,
0.3480673, -1.258902, 3.973322, 0, 0, 0, 1, 1,
0.3537875, 0.978747, -1.302663, 0, 0, 0, 1, 1,
0.375093, 1.469645, -1.399812, 0, 0, 0, 1, 1,
0.3761357, 0.3113757, 1.359171, 0, 0, 0, 1, 1,
0.3791794, 0.558377, -0.9680789, 1, 1, 1, 1, 1,
0.3805445, 1.462734, -2.004257, 1, 1, 1, 1, 1,
0.3819498, -1.673124, 1.197079, 1, 1, 1, 1, 1,
0.383255, -1.151229, 2.57923, 1, 1, 1, 1, 1,
0.389713, -0.26115, 1.329882, 1, 1, 1, 1, 1,
0.3897792, 0.8204629, 1.242757, 1, 1, 1, 1, 1,
0.3946997, -1.015176, 3.872779, 1, 1, 1, 1, 1,
0.3953617, -1.762046, 3.282697, 1, 1, 1, 1, 1,
0.3980832, 1.507505, 0.6538439, 1, 1, 1, 1, 1,
0.3981886, -0.4195162, 4.831404, 1, 1, 1, 1, 1,
0.3982136, 0.04170247, 1.521623, 1, 1, 1, 1, 1,
0.3989814, -0.8959661, 1.739819, 1, 1, 1, 1, 1,
0.3995997, -1.318314, 2.878897, 1, 1, 1, 1, 1,
0.4000925, 0.5127264, -0.95266, 1, 1, 1, 1, 1,
0.4035859, -0.1529954, 1.72612, 1, 1, 1, 1, 1,
0.4039106, 1.383693, -1.779272, 0, 0, 1, 1, 1,
0.4044935, 0.07921793, 0.688311, 1, 0, 0, 1, 1,
0.4058575, -0.7102182, 2.628237, 1, 0, 0, 1, 1,
0.4064631, -0.6233162, 2.078269, 1, 0, 0, 1, 1,
0.406775, -0.1192515, 1.746974, 1, 0, 0, 1, 1,
0.4071499, -0.2497971, 2.465234, 1, 0, 0, 1, 1,
0.4092957, 1.397488, 2.140682, 0, 0, 0, 1, 1,
0.4111333, -0.6308425, 1.788558, 0, 0, 0, 1, 1,
0.4125178, -1.165144, 3.624812, 0, 0, 0, 1, 1,
0.4161187, 0.8406454, 2.700222, 0, 0, 0, 1, 1,
0.4164844, -0.8287808, 3.840905, 0, 0, 0, 1, 1,
0.4186092, -1.895828, 4.611737, 0, 0, 0, 1, 1,
0.4194523, -0.5634964, 2.515388, 0, 0, 0, 1, 1,
0.420374, -0.2295314, 2.31728, 1, 1, 1, 1, 1,
0.4208617, -0.5633239, 0.3325911, 1, 1, 1, 1, 1,
0.4236784, 0.07879951, 1.979388, 1, 1, 1, 1, 1,
0.4241247, -0.2357887, 2.278776, 1, 1, 1, 1, 1,
0.4285738, -0.3280221, 2.481743, 1, 1, 1, 1, 1,
0.4288731, 0.3540104, 0.474239, 1, 1, 1, 1, 1,
0.4306761, -0.1960776, 2.729795, 1, 1, 1, 1, 1,
0.4323615, 0.6879022, 0.6803759, 1, 1, 1, 1, 1,
0.435312, -1.593417, 3.386322, 1, 1, 1, 1, 1,
0.4383869, -0.5536547, 3.016208, 1, 1, 1, 1, 1,
0.4392222, -1.068799, 2.177217, 1, 1, 1, 1, 1,
0.4420618, -1.66017, 3.035485, 1, 1, 1, 1, 1,
0.4422387, -0.1354422, 3.514774, 1, 1, 1, 1, 1,
0.4428949, 0.5571458, -0.8285116, 1, 1, 1, 1, 1,
0.4460098, 0.2087585, 0.8033862, 1, 1, 1, 1, 1,
0.4468958, -0.3542581, 1.920028, 0, 0, 1, 1, 1,
0.4501067, 0.3405786, 0.6831313, 1, 0, 0, 1, 1,
0.4632931, -2.842622, 2.209693, 1, 0, 0, 1, 1,
0.4677964, 1.510446, 1.866884, 1, 0, 0, 1, 1,
0.4731649, -0.1298503, 1.075423, 1, 0, 0, 1, 1,
0.4742915, 1.740193, 0.348876, 1, 0, 0, 1, 1,
0.4743297, -0.08294243, 3.155246, 0, 0, 0, 1, 1,
0.4748712, -2.315285, 2.936897, 0, 0, 0, 1, 1,
0.47763, -0.6248838, 4.860247, 0, 0, 0, 1, 1,
0.4776738, -0.01389382, 2.58729, 0, 0, 0, 1, 1,
0.478966, 0.1777564, -0.6804373, 0, 0, 0, 1, 1,
0.4805885, -1.023196, 2.845379, 0, 0, 0, 1, 1,
0.4844937, -0.4147198, 2.717884, 0, 0, 0, 1, 1,
0.4849218, -0.6299976, 3.284264, 1, 1, 1, 1, 1,
0.4959973, -0.7053586, 3.944932, 1, 1, 1, 1, 1,
0.4988153, -1.575143, 3.339429, 1, 1, 1, 1, 1,
0.4998695, 1.430011, 1.402873, 1, 1, 1, 1, 1,
0.5040106, 2.28518, 0.4204825, 1, 1, 1, 1, 1,
0.5069475, -0.7959777, 2.065618, 1, 1, 1, 1, 1,
0.5082666, 0.2639301, 2.295831, 1, 1, 1, 1, 1,
0.5090691, 0.2149108, 0.9852155, 1, 1, 1, 1, 1,
0.5148399, -0.4847379, 0.9296631, 1, 1, 1, 1, 1,
0.516106, -0.4993396, 3.015273, 1, 1, 1, 1, 1,
0.5193235, -1.36013, 2.345499, 1, 1, 1, 1, 1,
0.5232517, -0.7890669, 2.491953, 1, 1, 1, 1, 1,
0.5236605, 0.3472161, 0.0612534, 1, 1, 1, 1, 1,
0.5262761, -0.4003115, 2.680286, 1, 1, 1, 1, 1,
0.5276213, 0.5195701, -1.876356, 1, 1, 1, 1, 1,
0.539327, -1.081844, 3.376391, 0, 0, 1, 1, 1,
0.5450488, 0.04181332, 1.035995, 1, 0, 0, 1, 1,
0.5469546, -0.4743514, 2.614312, 1, 0, 0, 1, 1,
0.5546364, -0.3639614, 2.3717, 1, 0, 0, 1, 1,
0.5549673, -0.9295517, 5.267537, 1, 0, 0, 1, 1,
0.5567743, 0.262809, 1.166156, 1, 0, 0, 1, 1,
0.5589171, 0.4769266, -1.146436, 0, 0, 0, 1, 1,
0.5596721, -0.8043964, 5.523365, 0, 0, 0, 1, 1,
0.5613214, 0.2062833, 0.698795, 0, 0, 0, 1, 1,
0.5626189, -1.743126, 3.123942, 0, 0, 0, 1, 1,
0.565028, -0.7116606, 1.899406, 0, 0, 0, 1, 1,
0.5659659, 0.8535246, -0.5675479, 0, 0, 0, 1, 1,
0.5710227, -1.74173, 4.036679, 0, 0, 0, 1, 1,
0.5745109, 0.1403949, 1.187118, 1, 1, 1, 1, 1,
0.5745803, 0.707283, 0.7085376, 1, 1, 1, 1, 1,
0.5764738, -1.134591, 1.257728, 1, 1, 1, 1, 1,
0.5788942, -0.8709806, 4.238857, 1, 1, 1, 1, 1,
0.5812759, -0.3186877, 2.185128, 1, 1, 1, 1, 1,
0.5844009, -0.1315542, 1.396169, 1, 1, 1, 1, 1,
0.5872651, 0.5995038, 0.09314919, 1, 1, 1, 1, 1,
0.5898132, 0.3691857, 1.016527, 1, 1, 1, 1, 1,
0.5936992, -0.413679, 2.506203, 1, 1, 1, 1, 1,
0.5938885, -0.5379819, 1.877032, 1, 1, 1, 1, 1,
0.5989279, -0.6805619, 3.884279, 1, 1, 1, 1, 1,
0.60083, 0.7079982, 0.1466917, 1, 1, 1, 1, 1,
0.6036849, 0.354947, 1.632713, 1, 1, 1, 1, 1,
0.6121727, 0.3623088, -0.6582842, 1, 1, 1, 1, 1,
0.6198565, 1.136198, 0.1343139, 1, 1, 1, 1, 1,
0.6209851, 0.05184205, 0.66902, 0, 0, 1, 1, 1,
0.6372212, -1.495024, 1.717143, 1, 0, 0, 1, 1,
0.6436389, -1.745962, 0.5163192, 1, 0, 0, 1, 1,
0.6438675, 0.7336234, 0.7001201, 1, 0, 0, 1, 1,
0.6467105, 1.881946, -1.166846, 1, 0, 0, 1, 1,
0.6468896, -0.2837949, 2.66994, 1, 0, 0, 1, 1,
0.6590099, -0.5075248, 2.365525, 0, 0, 0, 1, 1,
0.6623163, 0.7472703, 0.1556585, 0, 0, 0, 1, 1,
0.6638705, 1.549929, 0.4997686, 0, 0, 0, 1, 1,
0.6684399, 1.416175, 1.262081, 0, 0, 0, 1, 1,
0.6697041, -0.7835814, 2.155898, 0, 0, 0, 1, 1,
0.6724851, 0.1378506, 1.404407, 0, 0, 0, 1, 1,
0.6748134, -0.03889381, 2.343308, 0, 0, 0, 1, 1,
0.6770711, -0.7052609, 2.828184, 1, 1, 1, 1, 1,
0.6809472, -0.5292256, 2.215353, 1, 1, 1, 1, 1,
0.6813502, 0.4543251, 0.8914751, 1, 1, 1, 1, 1,
0.6860755, 2.240577, -0.2347409, 1, 1, 1, 1, 1,
0.6952438, 0.01529776, 2.036398, 1, 1, 1, 1, 1,
0.7006603, -0.5994322, 1.363832, 1, 1, 1, 1, 1,
0.7040342, -0.6843718, 3.191811, 1, 1, 1, 1, 1,
0.7190667, 0.3672743, 1.313297, 1, 1, 1, 1, 1,
0.7234227, -0.7526126, -0.1407494, 1, 1, 1, 1, 1,
0.7264083, 0.5072866, 2.619958, 1, 1, 1, 1, 1,
0.7442271, -1.365972, 4.589857, 1, 1, 1, 1, 1,
0.7461157, 1.174711, 0.7388209, 1, 1, 1, 1, 1,
0.7464159, -1.027931, 1.577778, 1, 1, 1, 1, 1,
0.7502854, 2.529649, 0.2089216, 1, 1, 1, 1, 1,
0.7521315, 1.064757, 2.443455, 1, 1, 1, 1, 1,
0.7540333, 0.2548963, 0.8717737, 0, 0, 1, 1, 1,
0.7583137, -2.184723, 3.575758, 1, 0, 0, 1, 1,
0.7609946, -1.04875, 0.2691831, 1, 0, 0, 1, 1,
0.7621858, 0.5258631, 2.441019, 1, 0, 0, 1, 1,
0.7635024, -0.839839, 2.004886, 1, 0, 0, 1, 1,
0.7680187, 1.779024, 2.480738, 1, 0, 0, 1, 1,
0.7689708, -0.4927796, 1.691326, 0, 0, 0, 1, 1,
0.769015, -2.264951, 1.902967, 0, 0, 0, 1, 1,
0.7725103, -0.5971429, 2.75332, 0, 0, 0, 1, 1,
0.7738084, 1.671025, 0.164731, 0, 0, 0, 1, 1,
0.774137, -0.460169, 1.882994, 0, 0, 0, 1, 1,
0.7777115, -0.10736, 0.5594043, 0, 0, 0, 1, 1,
0.7800758, 0.2412212, 1.499702, 0, 0, 0, 1, 1,
0.7872552, 1.186055, 0.189977, 1, 1, 1, 1, 1,
0.7881975, 0.5141715, 0.3966839, 1, 1, 1, 1, 1,
0.7994344, -0.8904119, 2.097429, 1, 1, 1, 1, 1,
0.7995629, 0.5694132, 0.4740562, 1, 1, 1, 1, 1,
0.8098561, 0.06689974, -0.01771713, 1, 1, 1, 1, 1,
0.8100955, 1.116639, 0.3229645, 1, 1, 1, 1, 1,
0.8108726, -0.1749116, 3.771911, 1, 1, 1, 1, 1,
0.8157355, -2.098937, 3.263646, 1, 1, 1, 1, 1,
0.8201898, -1.122784, 4.246542, 1, 1, 1, 1, 1,
0.8205051, 1.083992, -0.5585719, 1, 1, 1, 1, 1,
0.8212062, -0.7358243, 2.281373, 1, 1, 1, 1, 1,
0.8252086, 0.2532158, 0.4640721, 1, 1, 1, 1, 1,
0.8301177, 1.864149, 1.633717, 1, 1, 1, 1, 1,
0.8376315, -0.1016735, 2.295044, 1, 1, 1, 1, 1,
0.841107, -0.05143948, 0.8930489, 1, 1, 1, 1, 1,
0.8434988, 0.05078058, 4.148444, 0, 0, 1, 1, 1,
0.8447788, -1.419047, 2.16258, 1, 0, 0, 1, 1,
0.8449279, -1.408704, 3.1434, 1, 0, 0, 1, 1,
0.8452292, -0.2524162, 0.5997407, 1, 0, 0, 1, 1,
0.8507825, 0.498021, 0.5963839, 1, 0, 0, 1, 1,
0.8510329, 0.1706778, -0.3768217, 1, 0, 0, 1, 1,
0.8564186, -0.2438667, 1.762557, 0, 0, 0, 1, 1,
0.856945, -0.8560153, 2.548619, 0, 0, 0, 1, 1,
0.8578535, -0.0992672, 1.360865, 0, 0, 0, 1, 1,
0.8601565, -0.4692459, 1.548233, 0, 0, 0, 1, 1,
0.8656551, 1.583448, -1.030975, 0, 0, 0, 1, 1,
0.8676671, 0.1502507, 0.2299891, 0, 0, 0, 1, 1,
0.8678684, 0.4789253, -0.7640546, 0, 0, 0, 1, 1,
0.8686891, -0.7015182, 2.023696, 1, 1, 1, 1, 1,
0.8726931, 0.9170613, 0.443868, 1, 1, 1, 1, 1,
0.8756399, -0.4255863, 2.381497, 1, 1, 1, 1, 1,
0.8771436, -0.5038816, 1.591792, 1, 1, 1, 1, 1,
0.8802851, 0.2268578, 0.4653096, 1, 1, 1, 1, 1,
0.8813765, 2.027038, 0.581964, 1, 1, 1, 1, 1,
0.8828678, -0.7945092, 3.158764, 1, 1, 1, 1, 1,
0.8837761, 1.59443, -0.0007052443, 1, 1, 1, 1, 1,
0.8894421, 0.6415412, 1.418147, 1, 1, 1, 1, 1,
0.8902741, 0.2662472, 1.647839, 1, 1, 1, 1, 1,
0.8926499, 1.903777, 0.7892439, 1, 1, 1, 1, 1,
0.8927135, -0.08088035, 1.655728, 1, 1, 1, 1, 1,
0.8932937, 0.2822056, 0.2234676, 1, 1, 1, 1, 1,
0.893693, -0.1794922, 1.64931, 1, 1, 1, 1, 1,
0.8939014, -0.5747339, 2.725395, 1, 1, 1, 1, 1,
0.8956794, -1.126577, 3.95659, 0, 0, 1, 1, 1,
0.8980123, -0.1934885, 0.9267846, 1, 0, 0, 1, 1,
0.9018833, -2.521908, 1.745234, 1, 0, 0, 1, 1,
0.9131957, 1.516907, 0.7939772, 1, 0, 0, 1, 1,
0.9154164, 0.6327254, 0.3865142, 1, 0, 0, 1, 1,
0.9165162, 0.946107, 2.00596, 1, 0, 0, 1, 1,
0.9203938, -0.3783553, 2.622406, 0, 0, 0, 1, 1,
0.9218718, 0.7554678, 0.845278, 0, 0, 0, 1, 1,
0.9306905, 0.1075943, 2.432192, 0, 0, 0, 1, 1,
0.9366408, 0.7508, -0.260736, 0, 0, 0, 1, 1,
0.9373169, 0.9131657, 1.11956, 0, 0, 0, 1, 1,
0.9446405, -1.099221, 0.2022344, 0, 0, 0, 1, 1,
0.9486344, 0.008353481, 1.636367, 0, 0, 0, 1, 1,
0.9494771, -1.097388, 2.122188, 1, 1, 1, 1, 1,
0.9510393, -0.7598554, 2.452279, 1, 1, 1, 1, 1,
0.9573884, 0.6787332, 0.6320539, 1, 1, 1, 1, 1,
0.9581692, -0.8060718, 3.059825, 1, 1, 1, 1, 1,
0.961935, -0.401691, 3.658952, 1, 1, 1, 1, 1,
0.96204, 0.01932613, 3.141852, 1, 1, 1, 1, 1,
0.9637733, 1.144428, 0.9664211, 1, 1, 1, 1, 1,
0.9648959, 2.348448, 0.6984715, 1, 1, 1, 1, 1,
0.9677935, -0.2996441, 1.97441, 1, 1, 1, 1, 1,
0.971513, -1.681535, 2.839266, 1, 1, 1, 1, 1,
0.9782066, 0.9096617, 0.1277468, 1, 1, 1, 1, 1,
0.9823405, 0.3528029, 0.6706739, 1, 1, 1, 1, 1,
0.982712, 0.4121511, 1.984512, 1, 1, 1, 1, 1,
0.9836715, -0.1643719, 3.359836, 1, 1, 1, 1, 1,
0.9865855, 1.685557, 0.5140132, 1, 1, 1, 1, 1,
0.988798, -0.6376723, 3.161152, 0, 0, 1, 1, 1,
0.9953365, 0.2631161, 0.07815681, 1, 0, 0, 1, 1,
0.9965543, -0.4332668, -0.06134201, 1, 0, 0, 1, 1,
1.009067, 1.981525, 0.9021901, 1, 0, 0, 1, 1,
1.01374, -0.8101568, 0.4049903, 1, 0, 0, 1, 1,
1.018484, 0.5677815, 0.08541161, 1, 0, 0, 1, 1,
1.024855, -1.636135, 3.934362, 0, 0, 0, 1, 1,
1.027908, -0.7512054, 1.760433, 0, 0, 0, 1, 1,
1.02922, 0.2512283, 2.257715, 0, 0, 0, 1, 1,
1.030154, 0.6160482, 2.620514, 0, 0, 0, 1, 1,
1.030354, 1.531653, -0.3164155, 0, 0, 0, 1, 1,
1.030515, -0.6350751, 0.2631221, 0, 0, 0, 1, 1,
1.030835, 0.1841284, 0.1104935, 0, 0, 0, 1, 1,
1.031778, -0.8580774, 2.846343, 1, 1, 1, 1, 1,
1.038913, -0.3754511, 1.178491, 1, 1, 1, 1, 1,
1.04531, -0.03904767, 1.112267, 1, 1, 1, 1, 1,
1.049431, 0.2144556, 1.842038, 1, 1, 1, 1, 1,
1.050017, 1.078331, 0.8354664, 1, 1, 1, 1, 1,
1.054746, -2.022775, 3.120957, 1, 1, 1, 1, 1,
1.066753, -0.1525876, 1.257394, 1, 1, 1, 1, 1,
1.06708, -1.376538, 3.425184, 1, 1, 1, 1, 1,
1.070769, -1.528968, 2.226269, 1, 1, 1, 1, 1,
1.078788, 1.878799, -0.4729188, 1, 1, 1, 1, 1,
1.079403, -0.1457683, -1.070056, 1, 1, 1, 1, 1,
1.081127, 0.04252777, 0.9701344, 1, 1, 1, 1, 1,
1.081961, 0.396884, 1.383583, 1, 1, 1, 1, 1,
1.084894, 1.323605, 0.1475788, 1, 1, 1, 1, 1,
1.0877, 0.7656252, 3.658341, 1, 1, 1, 1, 1,
1.107009, -0.5783644, 1.146993, 0, 0, 1, 1, 1,
1.107777, -0.1251718, 1.528084, 1, 0, 0, 1, 1,
1.110596, 2.227752, -0.1758119, 1, 0, 0, 1, 1,
1.115948, -0.1421498, 0.7814126, 1, 0, 0, 1, 1,
1.116819, -0.103392, 2.582984, 1, 0, 0, 1, 1,
1.117354, 0.873098, 2.071334, 1, 0, 0, 1, 1,
1.122882, -0.6327255, 3.595529, 0, 0, 0, 1, 1,
1.136764, 0.7122964, 2.011677, 0, 0, 0, 1, 1,
1.145386, 0.7672181, 0.1334378, 0, 0, 0, 1, 1,
1.145849, 1.196648, 1.755596, 0, 0, 0, 1, 1,
1.153157, -0.3681425, 2.154294, 0, 0, 0, 1, 1,
1.16803, -1.121264, 2.811012, 0, 0, 0, 1, 1,
1.170038, 1.311349, 1.279551, 0, 0, 0, 1, 1,
1.170431, 0.3279651, 0.608344, 1, 1, 1, 1, 1,
1.179685, -1.036381, 2.198799, 1, 1, 1, 1, 1,
1.182443, -0.1129999, 2.630692, 1, 1, 1, 1, 1,
1.183133, 0.8714687, 1.889663, 1, 1, 1, 1, 1,
1.186758, 0.05270096, 1.417087, 1, 1, 1, 1, 1,
1.189814, -0.8108187, 1.68469, 1, 1, 1, 1, 1,
1.194145, -1.954899, 2.568065, 1, 1, 1, 1, 1,
1.194265, 1.651343, 1.799484, 1, 1, 1, 1, 1,
1.19525, -1.175756, 2.389152, 1, 1, 1, 1, 1,
1.20114, -0.67951, -0.3165658, 1, 1, 1, 1, 1,
1.202926, -0.6165596, 1.83353, 1, 1, 1, 1, 1,
1.208682, 0.9468751, 1.635231, 1, 1, 1, 1, 1,
1.21136, 1.6193, 0.5213308, 1, 1, 1, 1, 1,
1.218602, 1.516182, 0.2306198, 1, 1, 1, 1, 1,
1.231018, -0.3502792, 2.007362, 1, 1, 1, 1, 1,
1.235202, -0.6871842, 2.249053, 0, 0, 1, 1, 1,
1.236769, -1.580026, 1.652241, 1, 0, 0, 1, 1,
1.238881, 0.3793028, 0.7028445, 1, 0, 0, 1, 1,
1.239389, 0.05739251, 3.225004, 1, 0, 0, 1, 1,
1.243544, 1.344899, 2.716278, 1, 0, 0, 1, 1,
1.245617, -0.1099193, 1.012912, 1, 0, 0, 1, 1,
1.255997, -0.7109494, 2.598553, 0, 0, 0, 1, 1,
1.260579, -0.9049969, 3.69934, 0, 0, 0, 1, 1,
1.266384, -0.4292126, 2.985504, 0, 0, 0, 1, 1,
1.266584, -1.119925, 2.772867, 0, 0, 0, 1, 1,
1.269767, -1.146292, 2.689178, 0, 0, 0, 1, 1,
1.283979, 1.14635, 1.469173, 0, 0, 0, 1, 1,
1.291393, -0.03066856, 0.8084126, 0, 0, 0, 1, 1,
1.291765, -0.2012837, 0.8369134, 1, 1, 1, 1, 1,
1.293702, 0.7460091, 2.448386, 1, 1, 1, 1, 1,
1.297349, 0.9018492, 1.444434, 1, 1, 1, 1, 1,
1.297452, -0.4700851, 2.192924, 1, 1, 1, 1, 1,
1.314394, 0.05642142, 1.659528, 1, 1, 1, 1, 1,
1.32004, -0.3819525, 1.264523, 1, 1, 1, 1, 1,
1.320918, -1.665253, 1.551288, 1, 1, 1, 1, 1,
1.339592, -1.47578, 2.428439, 1, 1, 1, 1, 1,
1.352141, 1.042794, -0.8651479, 1, 1, 1, 1, 1,
1.359194, 0.4415253, 1.228478, 1, 1, 1, 1, 1,
1.368149, 0.007176206, 1.826951, 1, 1, 1, 1, 1,
1.368266, 1.509778, 2.977752, 1, 1, 1, 1, 1,
1.375381, 0.6292788, 0.8465539, 1, 1, 1, 1, 1,
1.379836, -0.465716, 1.35416, 1, 1, 1, 1, 1,
1.397368, 1.637445, 0.2035136, 1, 1, 1, 1, 1,
1.410116, 2.310114, 0.7866982, 0, 0, 1, 1, 1,
1.414626, 0.3059402, 1.306776, 1, 0, 0, 1, 1,
1.420866, 0.5995057, 1.810636, 1, 0, 0, 1, 1,
1.422872, 1.859431, -0.1701601, 1, 0, 0, 1, 1,
1.431405, 1.28726, 1.791894, 1, 0, 0, 1, 1,
1.451509, 1.34246, 2.381331, 1, 0, 0, 1, 1,
1.457531, -0.533398, 1.743529, 0, 0, 0, 1, 1,
1.458745, -1.265604, 1.892096, 0, 0, 0, 1, 1,
1.459494, -0.1831284, 1.795837, 0, 0, 0, 1, 1,
1.469288, -0.00117265, 3.184933, 0, 0, 0, 1, 1,
1.498227, 0.2272721, 3.100238, 0, 0, 0, 1, 1,
1.510964, -1.226599, 3.128374, 0, 0, 0, 1, 1,
1.513313, 0.5631635, 1.416478, 0, 0, 0, 1, 1,
1.515239, 1.230657, -0.5752825, 1, 1, 1, 1, 1,
1.539989, 0.785561, 1.929702, 1, 1, 1, 1, 1,
1.555607, 1.140679, 1.663841, 1, 1, 1, 1, 1,
1.565925, -0.7199576, 1.929672, 1, 1, 1, 1, 1,
1.566825, -0.2896447, 0.8081976, 1, 1, 1, 1, 1,
1.573438, 0.3355873, 0.8614178, 1, 1, 1, 1, 1,
1.613447, 0.7286808, -0.8541808, 1, 1, 1, 1, 1,
1.62143, -0.1703328, 2.252274, 1, 1, 1, 1, 1,
1.631872, -0.5691004, 1.879349, 1, 1, 1, 1, 1,
1.632253, 0.06724327, 1.519446, 1, 1, 1, 1, 1,
1.64674, 0.2521581, 1.384153, 1, 1, 1, 1, 1,
1.675313, 1.119594, -0.1278782, 1, 1, 1, 1, 1,
1.697743, -0.7219973, 3.241762, 1, 1, 1, 1, 1,
1.706081, 0.009756977, 1.966304, 1, 1, 1, 1, 1,
1.71045, -0.1595696, 2.402827, 1, 1, 1, 1, 1,
1.713455, 0.5038366, 1.380686, 0, 0, 1, 1, 1,
1.722074, -1.438896, 3.772145, 1, 0, 0, 1, 1,
1.728497, -0.5430163, 1.92486, 1, 0, 0, 1, 1,
1.740279, -0.9309757, 1.825234, 1, 0, 0, 1, 1,
1.761281, -0.4058163, 0.1570837, 1, 0, 0, 1, 1,
1.771202, 0.238333, 2.994591, 1, 0, 0, 1, 1,
1.794138, -0.319421, 2.056629, 0, 0, 0, 1, 1,
1.798351, 0.7363852, 2.301656, 0, 0, 0, 1, 1,
1.804641, 0.2553015, 1.567526, 0, 0, 0, 1, 1,
1.838385, 1.017872, 0.06831511, 0, 0, 0, 1, 1,
1.839216, -0.3464594, 2.202921, 0, 0, 0, 1, 1,
1.84342, -0.6631959, 1.637873, 0, 0, 0, 1, 1,
1.849545, -0.009808265, 2.649705, 0, 0, 0, 1, 1,
1.852288, -1.693756, 2.944695, 1, 1, 1, 1, 1,
1.900961, -1.55937, 3.927971, 1, 1, 1, 1, 1,
1.91561, -1.323166, 4.056359, 1, 1, 1, 1, 1,
1.924087, -0.5739557, 4.050668, 1, 1, 1, 1, 1,
1.924296, -0.580112, 1.685639, 1, 1, 1, 1, 1,
1.933965, -1.557998, 1.07863, 1, 1, 1, 1, 1,
1.953967, -0.8594004, 2.000423, 1, 1, 1, 1, 1,
1.96509, 1.039841, 0.1770399, 1, 1, 1, 1, 1,
1.982356, 0.5619996, 1.242829, 1, 1, 1, 1, 1,
1.989308, -0.754382, 2.724291, 1, 1, 1, 1, 1,
2.015304, 2.541945, -0.6976241, 1, 1, 1, 1, 1,
2.02636, -0.9438472, 3.088027, 1, 1, 1, 1, 1,
2.055008, -1.225454, 2.039258, 1, 1, 1, 1, 1,
2.056464, 0.982461, 0.001281117, 1, 1, 1, 1, 1,
2.061072, -0.9928909, 1.02037, 1, 1, 1, 1, 1,
2.109837, 0.5122959, 0.9546549, 0, 0, 1, 1, 1,
2.112002, -1.544401, 2.112858, 1, 0, 0, 1, 1,
2.183587, 0.4452383, 0.8184349, 1, 0, 0, 1, 1,
2.184569, 1.301473, 0.6483986, 1, 0, 0, 1, 1,
2.188256, 1.366634, 2.245432, 1, 0, 0, 1, 1,
2.215697, 1.82051, 1.296428, 1, 0, 0, 1, 1,
2.228563, -0.9431577, 2.147559, 0, 0, 0, 1, 1,
2.24469, 0.5861115, 2.264448, 0, 0, 0, 1, 1,
2.325432, 0.9755092, 0.9565701, 0, 0, 0, 1, 1,
2.338435, 0.7754886, 0.3334215, 0, 0, 0, 1, 1,
2.49797, -0.1564346, 2.895889, 0, 0, 0, 1, 1,
2.509671, 2.245196, 1.404594, 0, 0, 0, 1, 1,
2.528776, 0.4621311, 3.122499, 0, 0, 0, 1, 1,
2.537304, 0.4428577, 1.4585, 1, 1, 1, 1, 1,
2.578981, 0.1936073, 1.054418, 1, 1, 1, 1, 1,
2.875793, -0.826874, 2.758798, 1, 1, 1, 1, 1,
2.963717, -1.56777, 2.108675, 1, 1, 1, 1, 1,
3.035921, 0.8135913, 1.628858, 1, 1, 1, 1, 1,
3.095696, -1.550383, 0.7734283, 1, 1, 1, 1, 1,
3.169464, 1.471215, -0.1428208, 1, 1, 1, 1, 1
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
var radius = 9.685639;
var distance = 34.0204;
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
mvMatrix.translate( -0.2253284, 0.04049587, 0.2431521 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0204);
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
