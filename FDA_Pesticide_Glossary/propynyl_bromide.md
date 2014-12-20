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
-3.317088, -0.8857284, -0.9905523, 1, 0, 0, 1,
-2.90331, 0.4933522, -1.271021, 1, 0.007843138, 0, 1,
-2.733723, 1.532813, -2.085716, 1, 0.01176471, 0, 1,
-2.623484, 0.1765941, -2.506819, 1, 0.01960784, 0, 1,
-2.620669, -0.7455376, -2.58868, 1, 0.02352941, 0, 1,
-2.58948, -0.2504803, -1.309383, 1, 0.03137255, 0, 1,
-2.466242, -0.2325532, -0.2185717, 1, 0.03529412, 0, 1,
-2.444031, -0.469626, -0.9564742, 1, 0.04313726, 0, 1,
-2.413487, -0.8507935, -1.105397, 1, 0.04705882, 0, 1,
-2.406029, -0.7819537, -1.36951, 1, 0.05490196, 0, 1,
-2.373015, -0.1907477, -2.235117, 1, 0.05882353, 0, 1,
-2.372293, -0.8307512, -0.8818183, 1, 0.06666667, 0, 1,
-2.37167, 0.3460976, -0.6141349, 1, 0.07058824, 0, 1,
-2.260425, 0.8255941, -3.404071, 1, 0.07843138, 0, 1,
-2.243289, -1.08161, -2.8418, 1, 0.08235294, 0, 1,
-2.213049, -0.9035358, -2.075697, 1, 0.09019608, 0, 1,
-2.208648, 0.6763429, -0.8651054, 1, 0.09411765, 0, 1,
-2.195517, 0.1839282, -0.7974383, 1, 0.1019608, 0, 1,
-2.182256, -0.03780734, -1.721628, 1, 0.1098039, 0, 1,
-2.179687, 0.2379802, -1.802618, 1, 0.1137255, 0, 1,
-2.178987, 0.2755989, -1.853888, 1, 0.1215686, 0, 1,
-2.160433, 0.3179326, -0.5482194, 1, 0.1254902, 0, 1,
-2.148672, -0.7635497, -2.236649, 1, 0.1333333, 0, 1,
-2.093671, 0.0002456664, -2.595076, 1, 0.1372549, 0, 1,
-2.081179, 0.8821725, -0.2376992, 1, 0.145098, 0, 1,
-2.076341, -2.680263, -1.775553, 1, 0.1490196, 0, 1,
-2.074302, -0.5701574, -2.561955, 1, 0.1568628, 0, 1,
-2.069676, -0.4883787, -2.920526, 1, 0.1607843, 0, 1,
-2.030947, -0.4968428, -1.255954, 1, 0.1686275, 0, 1,
-2.008529, 0.4491878, -1.763699, 1, 0.172549, 0, 1,
-1.986772, 0.1457368, -3.943964, 1, 0.1803922, 0, 1,
-1.968685, 1.735037, -1.846561, 1, 0.1843137, 0, 1,
-1.941443, -0.3912118, -2.689401, 1, 0.1921569, 0, 1,
-1.933543, -0.8647527, -2.900876, 1, 0.1960784, 0, 1,
-1.931145, 0.6241678, -1.623957, 1, 0.2039216, 0, 1,
-1.921324, 0.6789811, 0.5628674, 1, 0.2117647, 0, 1,
-1.920651, -0.1927429, -0.4538797, 1, 0.2156863, 0, 1,
-1.91877, -0.6404392, -2.685605, 1, 0.2235294, 0, 1,
-1.9166, 0.535103, -2.017071, 1, 0.227451, 0, 1,
-1.908526, -2.609069, -4.075437, 1, 0.2352941, 0, 1,
-1.883122, -2.647618, -2.986578, 1, 0.2392157, 0, 1,
-1.859419, 0.5197876, -1.467684, 1, 0.2470588, 0, 1,
-1.855849, 0.1165032, -1.493892, 1, 0.2509804, 0, 1,
-1.836259, -0.1567846, -1.499262, 1, 0.2588235, 0, 1,
-1.82556, -0.1038537, -1.350366, 1, 0.2627451, 0, 1,
-1.825534, 0.3708262, -1.159457, 1, 0.2705882, 0, 1,
-1.810999, 0.6595507, -1.782894, 1, 0.2745098, 0, 1,
-1.808616, -0.6635105, -2.402724, 1, 0.282353, 0, 1,
-1.803996, -0.4714472, -2.388581, 1, 0.2862745, 0, 1,
-1.800864, 1.620019, 1.056978, 1, 0.2941177, 0, 1,
-1.767591, 0.8167506, -0.6341248, 1, 0.3019608, 0, 1,
-1.738687, 1.284171, 0.032284, 1, 0.3058824, 0, 1,
-1.735128, 0.5304009, -1.064925, 1, 0.3137255, 0, 1,
-1.715797, 2.41102, -2.860978, 1, 0.3176471, 0, 1,
-1.693551, -0.02262932, -1.783344, 1, 0.3254902, 0, 1,
-1.674694, 0.3330838, -2.376153, 1, 0.3294118, 0, 1,
-1.668323, 0.918004, 0.4749822, 1, 0.3372549, 0, 1,
-1.665562, -0.9504112, -0.9859419, 1, 0.3411765, 0, 1,
-1.656483, 0.04058184, -1.137802, 1, 0.3490196, 0, 1,
-1.641848, -0.4698951, -2.727698, 1, 0.3529412, 0, 1,
-1.641493, -2.400668, -1.938596, 1, 0.3607843, 0, 1,
-1.622, -0.3490763, -0.5822861, 1, 0.3647059, 0, 1,
-1.611972, 0.7794157, -3.217882, 1, 0.372549, 0, 1,
-1.581868, 0.5041085, -0.0575392, 1, 0.3764706, 0, 1,
-1.579569, 2.201984, -0.4582872, 1, 0.3843137, 0, 1,
-1.578919, -0.7352164, -2.764163, 1, 0.3882353, 0, 1,
-1.578658, -0.4465975, -1.062504, 1, 0.3960784, 0, 1,
-1.563438, -1.676127, -1.32289, 1, 0.4039216, 0, 1,
-1.556894, 1.662105, -0.5832676, 1, 0.4078431, 0, 1,
-1.529256, 0.0524063, -2.572361, 1, 0.4156863, 0, 1,
-1.52911, -0.1542505, -2.55813, 1, 0.4196078, 0, 1,
-1.522689, 1.296796, 0.3589939, 1, 0.427451, 0, 1,
-1.518418, 1.118342, -0.03721218, 1, 0.4313726, 0, 1,
-1.517347, 0.05527586, -1.808473, 1, 0.4392157, 0, 1,
-1.51074, 0.02945448, -2.778863, 1, 0.4431373, 0, 1,
-1.498192, 0.5681319, -0.4740277, 1, 0.4509804, 0, 1,
-1.49239, 0.8072374, -1.63346, 1, 0.454902, 0, 1,
-1.487818, 1.047212, -2.976278, 1, 0.4627451, 0, 1,
-1.482126, 1.035937, -1.409305, 1, 0.4666667, 0, 1,
-1.477448, -0.4897846, -2.717847, 1, 0.4745098, 0, 1,
-1.47436, -1.225391, -2.944167, 1, 0.4784314, 0, 1,
-1.470114, -2.003371, -2.837275, 1, 0.4862745, 0, 1,
-1.469681, 1.944309, 0.09771187, 1, 0.4901961, 0, 1,
-1.4637, -1.507123, -3.713404, 1, 0.4980392, 0, 1,
-1.458312, 1.251283, -0.9269035, 1, 0.5058824, 0, 1,
-1.456657, -0.4577777, -0.2334388, 1, 0.509804, 0, 1,
-1.422288, 0.1616537, -1.710979, 1, 0.5176471, 0, 1,
-1.417705, -1.23027, -3.734052, 1, 0.5215687, 0, 1,
-1.415461, 0.007521638, 0.4946039, 1, 0.5294118, 0, 1,
-1.415399, -0.8365954, -1.466442, 1, 0.5333334, 0, 1,
-1.410597, -0.08238534, -0.5972222, 1, 0.5411765, 0, 1,
-1.40401, -0.2861824, -1.237252, 1, 0.5450981, 0, 1,
-1.401651, 0.3282804, -1.789496, 1, 0.5529412, 0, 1,
-1.401121, 0.9808968, -0.9476766, 1, 0.5568628, 0, 1,
-1.395093, -0.1456574, -1.470848, 1, 0.5647059, 0, 1,
-1.382478, 0.4818047, 0.03152604, 1, 0.5686275, 0, 1,
-1.38227, -0.1511004, -2.528833, 1, 0.5764706, 0, 1,
-1.379475, -0.4317241, -2.753992, 1, 0.5803922, 0, 1,
-1.368322, -1.025985, -0.7344881, 1, 0.5882353, 0, 1,
-1.362579, 0.4731195, -1.521469, 1, 0.5921569, 0, 1,
-1.357403, -0.8226454, -1.438673, 1, 0.6, 0, 1,
-1.351699, 0.1862535, -3.379139, 1, 0.6078432, 0, 1,
-1.343008, -0.648456, -1.943256, 1, 0.6117647, 0, 1,
-1.327579, 0.3619638, -3.126975, 1, 0.6196079, 0, 1,
-1.324687, 0.7972509, -1.019333, 1, 0.6235294, 0, 1,
-1.323253, 0.3530858, 0.2415096, 1, 0.6313726, 0, 1,
-1.322645, 0.2079736, -2.917847, 1, 0.6352941, 0, 1,
-1.294961, 0.5361466, -1.416452, 1, 0.6431373, 0, 1,
-1.294893, -1.705034, -3.180959, 1, 0.6470588, 0, 1,
-1.288491, -1.459831, -2.895495, 1, 0.654902, 0, 1,
-1.270518, 0.5213314, -1.457802, 1, 0.6588235, 0, 1,
-1.269972, 1.515062, -2.547295, 1, 0.6666667, 0, 1,
-1.268045, -0.05478367, -1.230392, 1, 0.6705883, 0, 1,
-1.266871, 1.38351, -1.027305, 1, 0.6784314, 0, 1,
-1.263543, -0.07973368, -3.248169, 1, 0.682353, 0, 1,
-1.258381, -0.69408, -2.448116, 1, 0.6901961, 0, 1,
-1.257524, -1.660952, -3.905315, 1, 0.6941177, 0, 1,
-1.244609, 0.09711923, -1.078544, 1, 0.7019608, 0, 1,
-1.243635, -0.3104183, -1.891109, 1, 0.7098039, 0, 1,
-1.236477, -0.2882047, -1.857559, 1, 0.7137255, 0, 1,
-1.225634, 0.2642953, -0.6220379, 1, 0.7215686, 0, 1,
-1.225224, -0.7649924, -2.362816, 1, 0.7254902, 0, 1,
-1.223503, 0.4036756, -2.121188, 1, 0.7333333, 0, 1,
-1.215976, 0.1057399, -0.3157825, 1, 0.7372549, 0, 1,
-1.209473, 0.2442837, -0.1887857, 1, 0.7450981, 0, 1,
-1.206722, 0.1697042, 0.1360559, 1, 0.7490196, 0, 1,
-1.200239, -0.6632446, -2.575836, 1, 0.7568628, 0, 1,
-1.189861, -0.6825466, -1.112537, 1, 0.7607843, 0, 1,
-1.184395, 0.3355671, 0.471429, 1, 0.7686275, 0, 1,
-1.176371, -0.633345, -2.351895, 1, 0.772549, 0, 1,
-1.172144, 1.230543, -0.1981327, 1, 0.7803922, 0, 1,
-1.167042, 0.6535732, -0.5075415, 1, 0.7843137, 0, 1,
-1.165369, 0.8982604, -2.977521, 1, 0.7921569, 0, 1,
-1.150206, -0.3347642, -2.691845, 1, 0.7960784, 0, 1,
-1.14498, -0.8697035, -1.127807, 1, 0.8039216, 0, 1,
-1.144113, -0.4760278, -1.051173, 1, 0.8117647, 0, 1,
-1.140494, -1.762379, -3.876288, 1, 0.8156863, 0, 1,
-1.139709, -0.2524807, -1.595845, 1, 0.8235294, 0, 1,
-1.138195, 1.087045, -2.845763, 1, 0.827451, 0, 1,
-1.135654, -2.130231, -1.775178, 1, 0.8352941, 0, 1,
-1.135288, 0.683764, -0.1861343, 1, 0.8392157, 0, 1,
-1.128183, -0.6779792, -2.786209, 1, 0.8470588, 0, 1,
-1.125044, -0.6786883, -3.661894, 1, 0.8509804, 0, 1,
-1.121515, -0.5814515, -2.783192, 1, 0.8588235, 0, 1,
-1.117276, -0.01815612, -2.131298, 1, 0.8627451, 0, 1,
-1.115343, -0.6741858, -3.117328, 1, 0.8705882, 0, 1,
-1.113332, 0.6767311, -1.179476, 1, 0.8745098, 0, 1,
-1.112213, 1.135716, -0.331084, 1, 0.8823529, 0, 1,
-1.106431, 0.5269262, -1.499773, 1, 0.8862745, 0, 1,
-1.100655, 1.150772, -1.701788, 1, 0.8941177, 0, 1,
-1.086123, 0.6901569, 0.01415047, 1, 0.8980392, 0, 1,
-1.071512, -0.01727798, -1.956492, 1, 0.9058824, 0, 1,
-1.071099, 0.02357107, -2.127428, 1, 0.9137255, 0, 1,
-1.069782, 1.123328, -0.5016775, 1, 0.9176471, 0, 1,
-1.068595, -1.338299, -2.549643, 1, 0.9254902, 0, 1,
-1.06595, 0.8840672, -1.610204, 1, 0.9294118, 0, 1,
-1.064796, -0.7696551, -0.9647272, 1, 0.9372549, 0, 1,
-1.061386, 1.415048, -0.8516431, 1, 0.9411765, 0, 1,
-1.060656, -0.8717647, -2.571658, 1, 0.9490196, 0, 1,
-1.053889, 0.3868889, -0.9274041, 1, 0.9529412, 0, 1,
-1.049258, 0.1097798, -1.699842, 1, 0.9607843, 0, 1,
-1.045885, 0.3219402, -0.8142381, 1, 0.9647059, 0, 1,
-1.038855, -0.8341899, -2.467073, 1, 0.972549, 0, 1,
-1.038567, -1.228304, -1.44074, 1, 0.9764706, 0, 1,
-1.036846, 1.913293, 0.3055131, 1, 0.9843137, 0, 1,
-1.03484, -1.79645, -2.033545, 1, 0.9882353, 0, 1,
-1.03324, -0.5596825, -1.550705, 1, 0.9960784, 0, 1,
-1.021886, -1.733919, -2.816022, 0.9960784, 1, 0, 1,
-1.018927, 0.4674757, -2.540811, 0.9921569, 1, 0, 1,
-1.018795, 0.09054047, -1.450426, 0.9843137, 1, 0, 1,
-1.015401, -0.04190249, -1.917662, 0.9803922, 1, 0, 1,
-1.015154, 0.2506081, -0.7131545, 0.972549, 1, 0, 1,
-1.010422, 0.2167981, -0.6079698, 0.9686275, 1, 0, 1,
-1.008079, -0.4439269, -0.8057725, 0.9607843, 1, 0, 1,
-1.005857, -0.2626533, -1.265694, 0.9568627, 1, 0, 1,
-1.002669, -0.1111886, -2.287863, 0.9490196, 1, 0, 1,
-1.002456, -1.229725, -2.077674, 0.945098, 1, 0, 1,
-0.99848, 0.3183997, -1.389778, 0.9372549, 1, 0, 1,
-0.9914415, -0.4203156, -2.529086, 0.9333333, 1, 0, 1,
-0.9833426, 1.54309, -1.524112, 0.9254902, 1, 0, 1,
-0.9821579, 1.517084, -2.627851, 0.9215686, 1, 0, 1,
-0.9789929, 0.528747, 0.02414778, 0.9137255, 1, 0, 1,
-0.9760892, -0.0184, -2.137428, 0.9098039, 1, 0, 1,
-0.9750438, -1.022361, -1.971732, 0.9019608, 1, 0, 1,
-0.9707166, -1.071468, -3.87936, 0.8941177, 1, 0, 1,
-0.9706146, -0.7719845, -1.285501, 0.8901961, 1, 0, 1,
-0.9704604, 1.467325, -0.5176579, 0.8823529, 1, 0, 1,
-0.9613424, -0.2161964, -0.519722, 0.8784314, 1, 0, 1,
-0.9605505, 0.596795, -0.5024506, 0.8705882, 1, 0, 1,
-0.9596746, -0.9582864, -3.100017, 0.8666667, 1, 0, 1,
-0.9562856, 0.9418054, -0.7034139, 0.8588235, 1, 0, 1,
-0.9555572, 2.53778, -1.178084, 0.854902, 1, 0, 1,
-0.9513066, 1.64179, 0.1349285, 0.8470588, 1, 0, 1,
-0.9506641, 2.010056, -0.0176464, 0.8431373, 1, 0, 1,
-0.9476991, 0.4635207, -1.330151, 0.8352941, 1, 0, 1,
-0.9427698, 0.6349875, 1.083007, 0.8313726, 1, 0, 1,
-0.9427105, -0.2104878, -2.314153, 0.8235294, 1, 0, 1,
-0.9406261, -0.2648646, -3.082081, 0.8196079, 1, 0, 1,
-0.9398445, 0.2281662, -0.6216712, 0.8117647, 1, 0, 1,
-0.9383034, 1.31588, -0.4387591, 0.8078431, 1, 0, 1,
-0.9373893, -0.5566338, -0.7352281, 0.8, 1, 0, 1,
-0.9326588, -0.1612951, -1.839866, 0.7921569, 1, 0, 1,
-0.9273794, 0.5134387, -1.85094, 0.7882353, 1, 0, 1,
-0.9136117, -0.4002334, -3.598746, 0.7803922, 1, 0, 1,
-0.9106073, -0.4744291, -2.499948, 0.7764706, 1, 0, 1,
-0.9097555, 0.2035903, -1.077574, 0.7686275, 1, 0, 1,
-0.9087453, 0.2582884, 0.8976529, 0.7647059, 1, 0, 1,
-0.9060765, -0.434346, -0.6228453, 0.7568628, 1, 0, 1,
-0.8936279, 0.06016608, -1.222341, 0.7529412, 1, 0, 1,
-0.8912907, -0.1911492, -1.701273, 0.7450981, 1, 0, 1,
-0.8878824, 0.6207616, -1.373565, 0.7411765, 1, 0, 1,
-0.8877206, 1.164492, -2.127351, 0.7333333, 1, 0, 1,
-0.8847498, -0.1506306, -2.47243, 0.7294118, 1, 0, 1,
-0.8834285, 0.7591481, -2.60455, 0.7215686, 1, 0, 1,
-0.8665806, -1.035943, -2.688699, 0.7176471, 1, 0, 1,
-0.866149, 0.7958599, -1.027441, 0.7098039, 1, 0, 1,
-0.8660994, -0.8424691, -1.915606, 0.7058824, 1, 0, 1,
-0.8655826, 0.6232, -1.376, 0.6980392, 1, 0, 1,
-0.865221, 1.592244, -0.03322323, 0.6901961, 1, 0, 1,
-0.8587388, -0.4633541, -1.406619, 0.6862745, 1, 0, 1,
-0.8570487, -1.039987, -3.53384, 0.6784314, 1, 0, 1,
-0.8518522, 0.9135094, -1.036147, 0.6745098, 1, 0, 1,
-0.851391, 0.8969465, -0.9799252, 0.6666667, 1, 0, 1,
-0.8482445, -1.067804, -1.13695, 0.6627451, 1, 0, 1,
-0.8477718, 0.1861074, -2.517574, 0.654902, 1, 0, 1,
-0.8473253, -0.5925929, -2.399531, 0.6509804, 1, 0, 1,
-0.8383588, -0.8754636, -3.516021, 0.6431373, 1, 0, 1,
-0.8375909, -0.955471, -2.434976, 0.6392157, 1, 0, 1,
-0.8361515, -0.04341795, -2.211457, 0.6313726, 1, 0, 1,
-0.8268875, -1.237101, -1.702741, 0.627451, 1, 0, 1,
-0.8238185, 0.6740023, -1.976891, 0.6196079, 1, 0, 1,
-0.8234344, -1.56642, -2.29948, 0.6156863, 1, 0, 1,
-0.8233484, 1.334094, -0.1593767, 0.6078432, 1, 0, 1,
-0.8199599, 1.05259, 0.9185279, 0.6039216, 1, 0, 1,
-0.8180348, -0.4658334, -1.668185, 0.5960785, 1, 0, 1,
-0.8142194, 0.1357119, -0.6938234, 0.5882353, 1, 0, 1,
-0.8140041, -0.8373258, -2.296414, 0.5843138, 1, 0, 1,
-0.8098633, -0.9225253, -2.523618, 0.5764706, 1, 0, 1,
-0.8016179, -1.160241, -2.851149, 0.572549, 1, 0, 1,
-0.7997151, -1.430935, -2.403748, 0.5647059, 1, 0, 1,
-0.7957298, -0.6435806, -2.791742, 0.5607843, 1, 0, 1,
-0.7918627, -1.291187, -2.283498, 0.5529412, 1, 0, 1,
-0.7801462, -0.1674752, 0.001349292, 0.5490196, 1, 0, 1,
-0.7780245, -2.697381, -1.328057, 0.5411765, 1, 0, 1,
-0.764911, -0.7765477, -2.762757, 0.5372549, 1, 0, 1,
-0.7633622, 0.4176868, -0.4292995, 0.5294118, 1, 0, 1,
-0.76298, -0.4003389, -1.800133, 0.5254902, 1, 0, 1,
-0.7555684, -0.08605692, -1.751677, 0.5176471, 1, 0, 1,
-0.7531133, -1.004793, -2.652322, 0.5137255, 1, 0, 1,
-0.7511035, 0.3928149, -2.052209, 0.5058824, 1, 0, 1,
-0.7505266, 0.5237433, -0.07395055, 0.5019608, 1, 0, 1,
-0.748978, 0.09638263, -1.353917, 0.4941176, 1, 0, 1,
-0.7418376, 0.691193, -1.270782, 0.4862745, 1, 0, 1,
-0.7410652, 0.2138784, -0.6397318, 0.4823529, 1, 0, 1,
-0.7409464, 0.1156032, -2.517626, 0.4745098, 1, 0, 1,
-0.7325366, 0.06296358, -1.415213, 0.4705882, 1, 0, 1,
-0.7299989, -1.044401, -1.884569, 0.4627451, 1, 0, 1,
-0.722517, 0.0203894, -1.583671, 0.4588235, 1, 0, 1,
-0.7176399, -0.6097257, -3.197897, 0.4509804, 1, 0, 1,
-0.7168357, -0.1467912, -3.727627, 0.4470588, 1, 0, 1,
-0.716004, 1.293286, 0.2774027, 0.4392157, 1, 0, 1,
-0.7154008, -0.2074118, -0.3306936, 0.4352941, 1, 0, 1,
-0.7138322, 0.4535681, -0.5935276, 0.427451, 1, 0, 1,
-0.7118167, -2.298015, -2.560858, 0.4235294, 1, 0, 1,
-0.7065616, 1.022766, -0.02266121, 0.4156863, 1, 0, 1,
-0.7000039, -1.41764, -1.843751, 0.4117647, 1, 0, 1,
-0.698647, -0.4932891, -2.724685, 0.4039216, 1, 0, 1,
-0.6884347, 1.030437, 0.3129104, 0.3960784, 1, 0, 1,
-0.6780328, -0.9038606, -1.614211, 0.3921569, 1, 0, 1,
-0.6764227, 0.2221426, -1.441402, 0.3843137, 1, 0, 1,
-0.6746616, 0.4012599, -1.571595, 0.3803922, 1, 0, 1,
-0.672927, 1.1643, -2.905566, 0.372549, 1, 0, 1,
-0.6727635, 0.1828136, -0.115582, 0.3686275, 1, 0, 1,
-0.6703255, -0.4178181, -2.112847, 0.3607843, 1, 0, 1,
-0.6665658, -1.609907, -1.996941, 0.3568628, 1, 0, 1,
-0.666274, 0.690532, -1.073938, 0.3490196, 1, 0, 1,
-0.6629885, -0.5538125, -1.150252, 0.345098, 1, 0, 1,
-0.6622259, 0.2787713, -0.176226, 0.3372549, 1, 0, 1,
-0.6561775, 1.873371, 1.583904, 0.3333333, 1, 0, 1,
-0.6545559, -1.10689, -2.409668, 0.3254902, 1, 0, 1,
-0.6525545, 1.68979, -1.075545, 0.3215686, 1, 0, 1,
-0.6436829, 1.417996, -1.144757, 0.3137255, 1, 0, 1,
-0.6392219, -1.073776, -3.731772, 0.3098039, 1, 0, 1,
-0.6374136, -0.09246254, -1.508381, 0.3019608, 1, 0, 1,
-0.6283687, 0.602658, -1.985908, 0.2941177, 1, 0, 1,
-0.628198, -0.9984941, -2.232533, 0.2901961, 1, 0, 1,
-0.6271219, -0.5223775, -3.692623, 0.282353, 1, 0, 1,
-0.6213406, 1.842621, 1.004918, 0.2784314, 1, 0, 1,
-0.6099183, -0.3480867, -3.074741, 0.2705882, 1, 0, 1,
-0.6087063, -0.1773285, -4.679184, 0.2666667, 1, 0, 1,
-0.6084483, -1.694026, -2.334386, 0.2588235, 1, 0, 1,
-0.6058932, 2.673778, 1.301082, 0.254902, 1, 0, 1,
-0.6056645, 0.9890191, -0.9545017, 0.2470588, 1, 0, 1,
-0.604329, 0.8401812, 0.7196862, 0.2431373, 1, 0, 1,
-0.5961426, -1.154173, -2.419566, 0.2352941, 1, 0, 1,
-0.5916101, 0.3612089, -1.488408, 0.2313726, 1, 0, 1,
-0.5901002, -0.406586, -1.158284, 0.2235294, 1, 0, 1,
-0.5799376, -0.1004273, -1.152292, 0.2196078, 1, 0, 1,
-0.5750076, 0.6741173, -0.5628465, 0.2117647, 1, 0, 1,
-0.5725114, 0.7405761, 0.8375639, 0.2078431, 1, 0, 1,
-0.5720308, -0.9160333, -3.521748, 0.2, 1, 0, 1,
-0.5703171, 1.217501, -0.2483184, 0.1921569, 1, 0, 1,
-0.5687596, 0.991558, 0.001329338, 0.1882353, 1, 0, 1,
-0.5670497, -0.992287, -4.699679, 0.1803922, 1, 0, 1,
-0.5651187, -1.007612, -2.018474, 0.1764706, 1, 0, 1,
-0.5637993, -2.043494, -0.8909507, 0.1686275, 1, 0, 1,
-0.5615237, 1.540578, 0.3345189, 0.1647059, 1, 0, 1,
-0.5606589, 0.6037231, -0.1301588, 0.1568628, 1, 0, 1,
-0.5599795, -0.7735001, -2.951915, 0.1529412, 1, 0, 1,
-0.5566334, 1.825678, -0.2798065, 0.145098, 1, 0, 1,
-0.55004, -0.8543937, -2.141498, 0.1411765, 1, 0, 1,
-0.5493799, -0.4608525, -1.877553, 0.1333333, 1, 0, 1,
-0.5481566, -0.01541098, -0.9419167, 0.1294118, 1, 0, 1,
-0.5464242, 1.419074, -0.5186852, 0.1215686, 1, 0, 1,
-0.544786, -0.60529, -3.646218, 0.1176471, 1, 0, 1,
-0.5349223, -0.1976855, -1.685399, 0.1098039, 1, 0, 1,
-0.5335445, -0.2214137, -1.417955, 0.1058824, 1, 0, 1,
-0.5311276, -0.5357692, -2.442381, 0.09803922, 1, 0, 1,
-0.5250511, 0.8927591, -1.585159, 0.09019608, 1, 0, 1,
-0.5246524, 0.7699953, -0.3761869, 0.08627451, 1, 0, 1,
-0.5231888, -0.5126762, -1.886035, 0.07843138, 1, 0, 1,
-0.5231147, 0.6196645, -1.098586, 0.07450981, 1, 0, 1,
-0.5171818, -1.245947, -3.813421, 0.06666667, 1, 0, 1,
-0.5170969, -1.064355, -3.041688, 0.0627451, 1, 0, 1,
-0.5129586, 0.5652194, 0.04354459, 0.05490196, 1, 0, 1,
-0.5127231, 0.02220529, -3.24478, 0.05098039, 1, 0, 1,
-0.5121871, 1.09999, 0.6661102, 0.04313726, 1, 0, 1,
-0.5119056, -0.389008, -1.545843, 0.03921569, 1, 0, 1,
-0.5116795, 1.404066, 0.5601554, 0.03137255, 1, 0, 1,
-0.5092031, -0.9441776, -4.830238, 0.02745098, 1, 0, 1,
-0.5075703, -2.066029, -0.4490083, 0.01960784, 1, 0, 1,
-0.5056707, 0.008109851, -1.91985, 0.01568628, 1, 0, 1,
-0.5055321, 0.6453006, -1.339697, 0.007843138, 1, 0, 1,
-0.5002971, 0.4956933, -1.395435, 0.003921569, 1, 0, 1,
-0.4990537, -1.269603, -3.141423, 0, 1, 0.003921569, 1,
-0.4971561, 0.7901515, 0.1630408, 0, 1, 0.01176471, 1,
-0.4926071, 0.003464113, -2.913019, 0, 1, 0.01568628, 1,
-0.4917701, -1.770633, -2.738472, 0, 1, 0.02352941, 1,
-0.4908133, 0.7623553, -0.3433726, 0, 1, 0.02745098, 1,
-0.4895357, -0.01994454, -1.840477, 0, 1, 0.03529412, 1,
-0.4842791, 0.6510502, -0.5150598, 0, 1, 0.03921569, 1,
-0.4827974, 0.2994063, -0.8953918, 0, 1, 0.04705882, 1,
-0.4796225, 0.2380674, -1.548036, 0, 1, 0.05098039, 1,
-0.4787317, -0.3733031, -1.517955, 0, 1, 0.05882353, 1,
-0.4694417, -0.6473435, -1.326516, 0, 1, 0.0627451, 1,
-0.465081, -0.0361667, -2.178652, 0, 1, 0.07058824, 1,
-0.465016, -0.624586, -1.060838, 0, 1, 0.07450981, 1,
-0.4575213, 0.01150988, -2.383984, 0, 1, 0.08235294, 1,
-0.453594, 1.262359, 0.3190776, 0, 1, 0.08627451, 1,
-0.4515941, 0.2740203, -0.5168182, 0, 1, 0.09411765, 1,
-0.4507174, 0.6236148, -0.6494824, 0, 1, 0.1019608, 1,
-0.4470461, 0.2417246, -0.660832, 0, 1, 0.1058824, 1,
-0.4413684, -0.0863919, -2.877761, 0, 1, 0.1137255, 1,
-0.4242972, -0.07266369, -2.264234, 0, 1, 0.1176471, 1,
-0.42407, 0.8734494, 0.4902481, 0, 1, 0.1254902, 1,
-0.4212368, -1.61988, -2.832314, 0, 1, 0.1294118, 1,
-0.4191406, -0.4335577, -2.328857, 0, 1, 0.1372549, 1,
-0.4182532, 0.8605346, 0.7154075, 0, 1, 0.1411765, 1,
-0.4180376, -0.3770867, -1.960011, 0, 1, 0.1490196, 1,
-0.4174475, -1.129717, -2.846412, 0, 1, 0.1529412, 1,
-0.413088, -0.8952721, -2.882626, 0, 1, 0.1607843, 1,
-0.4121275, 0.2293692, -0.8608728, 0, 1, 0.1647059, 1,
-0.4112607, 1.480701, 0.242545, 0, 1, 0.172549, 1,
-0.4106623, 0.6514096, -1.2662, 0, 1, 0.1764706, 1,
-0.4084681, -0.2344743, -0.7939247, 0, 1, 0.1843137, 1,
-0.407953, -0.05136983, -1.708298, 0, 1, 0.1882353, 1,
-0.4074975, -0.6352519, -3.552023, 0, 1, 0.1960784, 1,
-0.4059344, -0.6507391, -4.226079, 0, 1, 0.2039216, 1,
-0.405541, 0.4708571, 0.03241984, 0, 1, 0.2078431, 1,
-0.4026042, 0.1254451, -1.828624, 0, 1, 0.2156863, 1,
-0.4024378, -0.2777523, -2.541907, 0, 1, 0.2196078, 1,
-0.4019918, -0.2927066, -2.568691, 0, 1, 0.227451, 1,
-0.4006412, -0.8992213, -4.535302, 0, 1, 0.2313726, 1,
-0.3990117, 0.7931339, -0.266365, 0, 1, 0.2392157, 1,
-0.3979447, -0.1856526, -1.88584, 0, 1, 0.2431373, 1,
-0.3969429, 1.156868, -2.773345, 0, 1, 0.2509804, 1,
-0.3961944, 0.1007773, -2.066453, 0, 1, 0.254902, 1,
-0.3941761, -0.4583628, -1.144015, 0, 1, 0.2627451, 1,
-0.3885427, -0.2718107, -4.129053, 0, 1, 0.2666667, 1,
-0.3879921, 1.017204, 0.5274355, 0, 1, 0.2745098, 1,
-0.3870631, 0.8856824, -1.539581, 0, 1, 0.2784314, 1,
-0.3861047, -0.4232269, -2.680198, 0, 1, 0.2862745, 1,
-0.3850766, 0.2495674, -0.7955645, 0, 1, 0.2901961, 1,
-0.3818995, 0.5468893, -1.577573, 0, 1, 0.2980392, 1,
-0.379692, -2.152998, -3.127557, 0, 1, 0.3058824, 1,
-0.3790729, -0.1481881, -3.194329, 0, 1, 0.3098039, 1,
-0.3773288, 0.5964369, -2.126883, 0, 1, 0.3176471, 1,
-0.3755647, 1.395918, -1.907666, 0, 1, 0.3215686, 1,
-0.3730418, 0.5051824, 0.3505276, 0, 1, 0.3294118, 1,
-0.3697852, 1.143924, -1.618215, 0, 1, 0.3333333, 1,
-0.3692734, -0.6597496, -3.333464, 0, 1, 0.3411765, 1,
-0.3683887, 0.8346165, -0.4067178, 0, 1, 0.345098, 1,
-0.3653495, 0.974581, -0.6307395, 0, 1, 0.3529412, 1,
-0.3471445, 0.5505732, -0.8839321, 0, 1, 0.3568628, 1,
-0.3463815, 0.9254455, -0.5746759, 0, 1, 0.3647059, 1,
-0.3463027, -1.440155, -2.077134, 0, 1, 0.3686275, 1,
-0.3336484, -1.904852, -3.423041, 0, 1, 0.3764706, 1,
-0.3329394, -0.2790492, -2.283536, 0, 1, 0.3803922, 1,
-0.3326449, -0.04933923, -1.494023, 0, 1, 0.3882353, 1,
-0.3323002, 0.4809262, -0.5980341, 0, 1, 0.3921569, 1,
-0.3269314, 2.169501, 0.4163541, 0, 1, 0.4, 1,
-0.3268466, 1.683421, 0.4626776, 0, 1, 0.4078431, 1,
-0.3266538, -0.414837, -3.035111, 0, 1, 0.4117647, 1,
-0.3250054, -1.31, -2.872415, 0, 1, 0.4196078, 1,
-0.3201613, 0.5707245, 1.099386, 0, 1, 0.4235294, 1,
-0.3146456, -1.514998, -3.468105, 0, 1, 0.4313726, 1,
-0.3132043, -0.03356843, -1.474901, 0, 1, 0.4352941, 1,
-0.3104641, 1.991746, -0.3841917, 0, 1, 0.4431373, 1,
-0.2866311, 0.3004163, -1.80626, 0, 1, 0.4470588, 1,
-0.285022, -1.72495, -3.366078, 0, 1, 0.454902, 1,
-0.284526, 1.879028, -1.55628, 0, 1, 0.4588235, 1,
-0.2845182, -0.09317432, -0.915683, 0, 1, 0.4666667, 1,
-0.2781494, 0.2738697, -2.492287, 0, 1, 0.4705882, 1,
-0.2770455, -0.5866502, -3.776678, 0, 1, 0.4784314, 1,
-0.2759843, -1.060559, -3.221158, 0, 1, 0.4823529, 1,
-0.2680004, -0.006924313, -1.709568, 0, 1, 0.4901961, 1,
-0.2673241, -0.1345413, -1.439682, 0, 1, 0.4941176, 1,
-0.2646179, -0.1923804, -1.5077, 0, 1, 0.5019608, 1,
-0.260586, -0.2037646, -2.099081, 0, 1, 0.509804, 1,
-0.2602195, -0.7980341, -5.310578, 0, 1, 0.5137255, 1,
-0.2553557, 1.025926, 0.2557203, 0, 1, 0.5215687, 1,
-0.2535801, 0.1768116, -1.602857, 0, 1, 0.5254902, 1,
-0.2517835, -0.1470162, -1.213856, 0, 1, 0.5333334, 1,
-0.2505147, 0.3342479, 0.2504588, 0, 1, 0.5372549, 1,
-0.2447748, -0.8984151, -5.127386, 0, 1, 0.5450981, 1,
-0.2420657, -1.06228, -3.497812, 0, 1, 0.5490196, 1,
-0.237123, -0.08374722, -1.429641, 0, 1, 0.5568628, 1,
-0.2350041, -0.4260828, -2.389175, 0, 1, 0.5607843, 1,
-0.230269, -0.2434814, -2.883923, 0, 1, 0.5686275, 1,
-0.2246484, 0.311621, -1.380777, 0, 1, 0.572549, 1,
-0.2215635, 0.627342, 0.1834159, 0, 1, 0.5803922, 1,
-0.2179939, -0.3846052, -4.032518, 0, 1, 0.5843138, 1,
-0.2166113, -0.1753712, -1.566408, 0, 1, 0.5921569, 1,
-0.2148915, -0.208474, -1.467751, 0, 1, 0.5960785, 1,
-0.2109295, -0.9937512, -2.370463, 0, 1, 0.6039216, 1,
-0.2082578, 0.3861944, -0.9446817, 0, 1, 0.6117647, 1,
-0.2064154, 2.535157, 1.94434, 0, 1, 0.6156863, 1,
-0.2015884, 0.9087812, -0.1723146, 0, 1, 0.6235294, 1,
-0.1992372, -1.703724, -3.668671, 0, 1, 0.627451, 1,
-0.1956076, 0.3732069, -2.477548, 0, 1, 0.6352941, 1,
-0.1944948, 0.4153309, 0.2535813, 0, 1, 0.6392157, 1,
-0.1919309, -0.8634987, -3.130697, 0, 1, 0.6470588, 1,
-0.1909125, 1.305583, -0.6949738, 0, 1, 0.6509804, 1,
-0.1878901, 1.747075, -0.2125684, 0, 1, 0.6588235, 1,
-0.1793719, 0.7713411, -0.2945138, 0, 1, 0.6627451, 1,
-0.1771704, -0.9582136, -2.610059, 0, 1, 0.6705883, 1,
-0.1756919, 0.5926343, 0.792218, 0, 1, 0.6745098, 1,
-0.1744329, -0.5986262, -3.467682, 0, 1, 0.682353, 1,
-0.1705289, -0.241165, -1.946905, 0, 1, 0.6862745, 1,
-0.168217, -0.7401127, -1.22991, 0, 1, 0.6941177, 1,
-0.1672617, -2.224774, -2.825202, 0, 1, 0.7019608, 1,
-0.1652212, 1.487938, 0.6639097, 0, 1, 0.7058824, 1,
-0.1651811, -1.33998, -3.550563, 0, 1, 0.7137255, 1,
-0.1603001, 1.578411, 0.5978743, 0, 1, 0.7176471, 1,
-0.1555109, 2.160972, -1.286903, 0, 1, 0.7254902, 1,
-0.1548657, -0.1923234, -2.442357, 0, 1, 0.7294118, 1,
-0.1546521, -0.8160599, -3.080753, 0, 1, 0.7372549, 1,
-0.1538381, 0.3896702, 1.048803, 0, 1, 0.7411765, 1,
-0.1531791, -0.9262913, -2.306326, 0, 1, 0.7490196, 1,
-0.1457222, 1.615677, 0.5574843, 0, 1, 0.7529412, 1,
-0.1456349, -0.303722, -2.909117, 0, 1, 0.7607843, 1,
-0.1436309, -1.57005, -3.646942, 0, 1, 0.7647059, 1,
-0.1420707, -1.23959, -1.909822, 0, 1, 0.772549, 1,
-0.140478, 1.25212, -1.501225, 0, 1, 0.7764706, 1,
-0.1384708, -0.4345496, -2.060202, 0, 1, 0.7843137, 1,
-0.1365581, 1.040381, 0.8727375, 0, 1, 0.7882353, 1,
-0.135646, 0.808077, -1.410282, 0, 1, 0.7960784, 1,
-0.1338835, -0.361757, -1.862446, 0, 1, 0.8039216, 1,
-0.1338276, -0.2904117, -1.313639, 0, 1, 0.8078431, 1,
-0.1311423, -1.072524, -2.83929, 0, 1, 0.8156863, 1,
-0.1288693, -1.864254, -3.417331, 0, 1, 0.8196079, 1,
-0.1254272, -0.1816604, -2.375522, 0, 1, 0.827451, 1,
-0.1221884, 0.06808868, 0.0326072, 0, 1, 0.8313726, 1,
-0.1221391, -0.8444188, -2.632977, 0, 1, 0.8392157, 1,
-0.1218457, -0.7496191, -2.669658, 0, 1, 0.8431373, 1,
-0.1206421, -0.07167114, -2.151179, 0, 1, 0.8509804, 1,
-0.1172671, 0.9307816, 0.6269759, 0, 1, 0.854902, 1,
-0.1161254, 0.7063514, 1.312028, 0, 1, 0.8627451, 1,
-0.1137653, 0.3290655, -1.146404, 0, 1, 0.8666667, 1,
-0.110181, -0.7870589, -5.174554, 0, 1, 0.8745098, 1,
-0.107944, 0.5465698, 0.4873798, 0, 1, 0.8784314, 1,
-0.1077156, -0.06091563, -3.054629, 0, 1, 0.8862745, 1,
-0.1038935, 1.121223, -1.560339, 0, 1, 0.8901961, 1,
-0.1011957, 0.05671136, -0.498191, 0, 1, 0.8980392, 1,
-0.09837835, -0.7430791, -3.049242, 0, 1, 0.9058824, 1,
-0.09548327, 2.064208, -0.439997, 0, 1, 0.9098039, 1,
-0.09519798, 1.13895, -0.5695086, 0, 1, 0.9176471, 1,
-0.09200364, -0.5281007, -2.495645, 0, 1, 0.9215686, 1,
-0.09140317, 0.9538381, -1.400034, 0, 1, 0.9294118, 1,
-0.09022742, 0.3190314, 1.061401, 0, 1, 0.9333333, 1,
-0.08785532, 1.201074, 1.528317, 0, 1, 0.9411765, 1,
-0.08182977, 0.4776525, -1.606407, 0, 1, 0.945098, 1,
-0.07663858, 0.8421584, -1.163411, 0, 1, 0.9529412, 1,
-0.07380701, 0.8488888, 0.9711677, 0, 1, 0.9568627, 1,
-0.06975223, 0.8053038, -1.532702, 0, 1, 0.9647059, 1,
-0.06954449, -0.321862, -2.390629, 0, 1, 0.9686275, 1,
-0.06454078, -0.4581971, -4.50779, 0, 1, 0.9764706, 1,
-0.05654381, 0.6609612, 1.613852, 0, 1, 0.9803922, 1,
-0.0552932, 0.2403411, -0.3310061, 0, 1, 0.9882353, 1,
-0.05431886, -1.066031, -2.739486, 0, 1, 0.9921569, 1,
-0.05375685, -2.097304, -4.324397, 0, 1, 1, 1,
-0.05362789, -1.66624, -1.550476, 0, 0.9921569, 1, 1,
-0.05235196, -0.2238312, -0.7600384, 0, 0.9882353, 1, 1,
-0.05026571, -1.840542, -3.160669, 0, 0.9803922, 1, 1,
-0.04953289, 0.8352231, 0.3076839, 0, 0.9764706, 1, 1,
-0.04781962, -1.583956, -3.00053, 0, 0.9686275, 1, 1,
-0.04757423, 0.8823762, 0.6408854, 0, 0.9647059, 1, 1,
-0.04352348, 0.8418663, 0.5242916, 0, 0.9568627, 1, 1,
-0.04139578, -1.584289, -3.702336, 0, 0.9529412, 1, 1,
-0.04053191, -1.52547, -5.648848, 0, 0.945098, 1, 1,
-0.03855228, -0.907621, -3.405917, 0, 0.9411765, 1, 1,
-0.03833004, -0.3061273, -3.947342, 0, 0.9333333, 1, 1,
-0.03636093, 1.043902, -0.1005803, 0, 0.9294118, 1, 1,
-0.02998737, -0.9963301, -4.66005, 0, 0.9215686, 1, 1,
-0.02766183, 0.01948639, -2.128581, 0, 0.9176471, 1, 1,
-0.0211353, -0.100076, -3.461704, 0, 0.9098039, 1, 1,
-0.01749313, 0.238287, 0.1700264, 0, 0.9058824, 1, 1,
-0.016193, -0.1335533, -1.083584, 0, 0.8980392, 1, 1,
-0.01403942, 0.5619971, -0.9456711, 0, 0.8901961, 1, 1,
-0.01248574, -1.056915, -3.910921, 0, 0.8862745, 1, 1,
-0.01176129, -1.522799, -2.664399, 0, 0.8784314, 1, 1,
-0.01119443, 1.179456, -0.7391846, 0, 0.8745098, 1, 1,
-0.01062364, -0.2320678, -3.952056, 0, 0.8666667, 1, 1,
-0.01007028, 1.858916, 0.6693879, 0, 0.8627451, 1, 1,
-0.00743088, -0.8785888, -4.62242, 0, 0.854902, 1, 1,
-0.006535505, -0.3310668, -3.011998, 0, 0.8509804, 1, 1,
-0.004533454, -0.01537916, -1.978875, 0, 0.8431373, 1, 1,
-0.003943875, -2.596003, -3.656085, 0, 0.8392157, 1, 1,
-0.003233327, 0.7827075, -0.02296719, 0, 0.8313726, 1, 1,
-0.002412245, 1.31984, 1.173695, 0, 0.827451, 1, 1,
0.003940793, -0.5478227, 5.237098, 0, 0.8196079, 1, 1,
0.00589683, 0.9309154, -0.7709658, 0, 0.8156863, 1, 1,
0.005968945, 0.2945001, -1.750867, 0, 0.8078431, 1, 1,
0.007250051, -0.8818345, 3.880499, 0, 0.8039216, 1, 1,
0.01411223, -0.01202264, 0.6988369, 0, 0.7960784, 1, 1,
0.01637223, 0.7783199, 1.197669, 0, 0.7882353, 1, 1,
0.02776549, 0.3160959, 0.7593241, 0, 0.7843137, 1, 1,
0.03307145, 1.661608, 0.9769334, 0, 0.7764706, 1, 1,
0.03725566, 0.2299829, -0.5313519, 0, 0.772549, 1, 1,
0.03933351, 0.727269, 1.787515, 0, 0.7647059, 1, 1,
0.03950099, -1.514844, 1.137075, 0, 0.7607843, 1, 1,
0.04653066, 0.516531, 0.3452071, 0, 0.7529412, 1, 1,
0.04674146, 0.5310252, -0.4587789, 0, 0.7490196, 1, 1,
0.04883589, 0.2275277, 0.418535, 0, 0.7411765, 1, 1,
0.05018495, -0.03236634, 1.093349, 0, 0.7372549, 1, 1,
0.05208906, -0.9709733, 0.3899234, 0, 0.7294118, 1, 1,
0.05372496, -0.8711255, 2.635523, 0, 0.7254902, 1, 1,
0.05382846, 0.2550941, 1.911985, 0, 0.7176471, 1, 1,
0.05698791, 0.4434539, 0.9749857, 0, 0.7137255, 1, 1,
0.0571712, -1.553345, 2.117233, 0, 0.7058824, 1, 1,
0.06257892, -1.642287, 3.277543, 0, 0.6980392, 1, 1,
0.06450256, -0.1899255, 2.612347, 0, 0.6941177, 1, 1,
0.06729215, 0.7496354, 0.2077244, 0, 0.6862745, 1, 1,
0.06921078, 0.1128704, -0.8641773, 0, 0.682353, 1, 1,
0.07828051, 0.2596039, 1.052657, 0, 0.6745098, 1, 1,
0.08086164, -0.861689, 2.508375, 0, 0.6705883, 1, 1,
0.08118939, -0.5420933, 2.906444, 0, 0.6627451, 1, 1,
0.08236517, 0.3383561, -1.120672, 0, 0.6588235, 1, 1,
0.08271791, -0.6270244, 3.549977, 0, 0.6509804, 1, 1,
0.08677979, -0.4660439, 3.460797, 0, 0.6470588, 1, 1,
0.08968913, -1.302222, 3.41497, 0, 0.6392157, 1, 1,
0.09027265, 0.3192172, -2.538167, 0, 0.6352941, 1, 1,
0.09170962, 0.9896592, -0.07326516, 0, 0.627451, 1, 1,
0.0935252, -1.980964, 4.379182, 0, 0.6235294, 1, 1,
0.09393307, 0.4895344, -1.695122, 0, 0.6156863, 1, 1,
0.09832264, -0.7610492, 1.59655, 0, 0.6117647, 1, 1,
0.1021154, -1.317437, 1.985346, 0, 0.6039216, 1, 1,
0.102369, 0.3550672, -1.303373, 0, 0.5960785, 1, 1,
0.1040242, -0.7902204, 2.572114, 0, 0.5921569, 1, 1,
0.1076493, -1.322811, 3.336553, 0, 0.5843138, 1, 1,
0.1085107, -1.4196, 3.202342, 0, 0.5803922, 1, 1,
0.1091156, 1.9532, -0.0506068, 0, 0.572549, 1, 1,
0.1114451, 1.725797, -0.3551836, 0, 0.5686275, 1, 1,
0.1151436, 1.487604, -1.500454, 0, 0.5607843, 1, 1,
0.1180862, 1.494313, -0.4189658, 0, 0.5568628, 1, 1,
0.11955, -0.5644045, 2.828865, 0, 0.5490196, 1, 1,
0.122239, -0.5568593, 2.939181, 0, 0.5450981, 1, 1,
0.1247805, -0.4054385, 3.430076, 0, 0.5372549, 1, 1,
0.125242, 1.186769, -0.8751873, 0, 0.5333334, 1, 1,
0.1272843, 0.4155448, 0.8226569, 0, 0.5254902, 1, 1,
0.134447, 0.2737577, 1.214776, 0, 0.5215687, 1, 1,
0.1383055, -0.0006683035, 0.7765534, 0, 0.5137255, 1, 1,
0.1410976, 2.167366, -0.5931342, 0, 0.509804, 1, 1,
0.1441219, -0.9984381, 1.753605, 0, 0.5019608, 1, 1,
0.1442918, 0.6121374, -0.5629199, 0, 0.4941176, 1, 1,
0.1478966, 0.3100633, 1.051936, 0, 0.4901961, 1, 1,
0.148008, -0.8262537, 2.802023, 0, 0.4823529, 1, 1,
0.1539766, -0.5943446, 2.878201, 0, 0.4784314, 1, 1,
0.1584026, -0.9125988, 3.792673, 0, 0.4705882, 1, 1,
0.1642413, 0.2499012, 1.157415, 0, 0.4666667, 1, 1,
0.1643393, 0.5641537, 0.627395, 0, 0.4588235, 1, 1,
0.1673739, 0.04561455, -1.344919, 0, 0.454902, 1, 1,
0.1695672, 0.2706074, -0.349868, 0, 0.4470588, 1, 1,
0.1714607, 0.1591365, 1.682175, 0, 0.4431373, 1, 1,
0.1752816, -1.557991, 2.749459, 0, 0.4352941, 1, 1,
0.1859303, -0.8794665, 1.973027, 0, 0.4313726, 1, 1,
0.1874232, 1.583036, 0.6017882, 0, 0.4235294, 1, 1,
0.192137, -0.3758586, 0.9096045, 0, 0.4196078, 1, 1,
0.1934311, -0.5253993, 1.585681, 0, 0.4117647, 1, 1,
0.1937748, 0.4621392, 0.03054316, 0, 0.4078431, 1, 1,
0.2007123, -0.01175025, 1.918688, 0, 0.4, 1, 1,
0.2017655, -1.119371, 3.372219, 0, 0.3921569, 1, 1,
0.2022642, 0.292273, 0.8596939, 0, 0.3882353, 1, 1,
0.2047555, 1.599427, 0.1857808, 0, 0.3803922, 1, 1,
0.2058829, -0.5880299, 1.528052, 0, 0.3764706, 1, 1,
0.2095699, -0.7788756, 1.810355, 0, 0.3686275, 1, 1,
0.2115845, 0.876962, 0.8192493, 0, 0.3647059, 1, 1,
0.212562, 0.04951285, 1.462724, 0, 0.3568628, 1, 1,
0.2140175, -2.005657, 2.784642, 0, 0.3529412, 1, 1,
0.2164228, 0.05736643, 2.443362, 0, 0.345098, 1, 1,
0.2174978, -0.297942, 1.869298, 0, 0.3411765, 1, 1,
0.2191641, 0.2953189, -0.7705064, 0, 0.3333333, 1, 1,
0.2200367, -0.07772837, 2.328211, 0, 0.3294118, 1, 1,
0.2215323, 0.02038487, 2.376511, 0, 0.3215686, 1, 1,
0.2219291, -0.9718666, 1.559207, 0, 0.3176471, 1, 1,
0.2241197, 1.071707, -0.1917187, 0, 0.3098039, 1, 1,
0.2262734, 0.9014453, -0.9498194, 0, 0.3058824, 1, 1,
0.2265874, -0.02484202, 3.427953, 0, 0.2980392, 1, 1,
0.2268932, -0.5672504, 2.945971, 0, 0.2901961, 1, 1,
0.2270091, -0.04309079, 3.014184, 0, 0.2862745, 1, 1,
0.2271879, -0.357117, 2.154749, 0, 0.2784314, 1, 1,
0.2273728, -0.396966, 2.060274, 0, 0.2745098, 1, 1,
0.2298009, 0.06573866, 3.002691, 0, 0.2666667, 1, 1,
0.2346224, 0.9757414, 1.363763, 0, 0.2627451, 1, 1,
0.2347979, -0.08159266, 2.304174, 0, 0.254902, 1, 1,
0.2371262, 0.1538936, 1.506783, 0, 0.2509804, 1, 1,
0.2377651, -0.161983, 1.677498, 0, 0.2431373, 1, 1,
0.2414296, -1.036181, 5.600327, 0, 0.2392157, 1, 1,
0.2415271, 0.9212754, -0.05479774, 0, 0.2313726, 1, 1,
0.2421591, 0.5296518, -0.7201756, 0, 0.227451, 1, 1,
0.2473237, 1.895285, -0.8043507, 0, 0.2196078, 1, 1,
0.2505856, 0.4371115, 0.3733727, 0, 0.2156863, 1, 1,
0.2520834, 0.7774214, 0.5142686, 0, 0.2078431, 1, 1,
0.2528704, 1.183083, -0.6335132, 0, 0.2039216, 1, 1,
0.2560098, 0.2835537, 0.8193645, 0, 0.1960784, 1, 1,
0.2564089, -1.439691, 4.00783, 0, 0.1882353, 1, 1,
0.2644104, 0.7733408, 0.5850088, 0, 0.1843137, 1, 1,
0.2704671, -2.029089, 3.641915, 0, 0.1764706, 1, 1,
0.2728401, -1.61148, 2.233047, 0, 0.172549, 1, 1,
0.2735482, 0.06874335, 0.3997069, 0, 0.1647059, 1, 1,
0.2775618, 2.1121, 0.1351885, 0, 0.1607843, 1, 1,
0.2831994, -0.3342742, 2.146866, 0, 0.1529412, 1, 1,
0.2844799, 0.2754636, 2.112809, 0, 0.1490196, 1, 1,
0.2899574, -0.2309951, 2.968521, 0, 0.1411765, 1, 1,
0.2907307, 2.617465, 0.5564841, 0, 0.1372549, 1, 1,
0.2936696, 1.059046, -0.09962799, 0, 0.1294118, 1, 1,
0.2963741, 0.7809479, -0.2564904, 0, 0.1254902, 1, 1,
0.2988236, -0.9585614, 1.69323, 0, 0.1176471, 1, 1,
0.3009683, 1.737985, 2.350769, 0, 0.1137255, 1, 1,
0.3026694, -0.6409698, 3.527249, 0, 0.1058824, 1, 1,
0.3034822, -0.3935035, 3.263897, 0, 0.09803922, 1, 1,
0.3040809, -1.762353, 0.7523845, 0, 0.09411765, 1, 1,
0.3093041, 0.3585247, 0.002813181, 0, 0.08627451, 1, 1,
0.3123357, 1.519456, -1.48261, 0, 0.08235294, 1, 1,
0.3125158, -0.07982545, 1.653742, 0, 0.07450981, 1, 1,
0.3131891, 1.008434, 0.923154, 0, 0.07058824, 1, 1,
0.3145175, -1.917374, 3.231039, 0, 0.0627451, 1, 1,
0.3168048, -2.133957, 1.68898, 0, 0.05882353, 1, 1,
0.3218797, -0.8995219, 2.729502, 0, 0.05098039, 1, 1,
0.3243974, 0.747712, 0.828757, 0, 0.04705882, 1, 1,
0.3255274, -0.8737222, 4.2503, 0, 0.03921569, 1, 1,
0.3263567, -1.400243, 2.882117, 0, 0.03529412, 1, 1,
0.3286327, -1.645876, 2.923491, 0, 0.02745098, 1, 1,
0.3297281, -0.2385041, 2.528291, 0, 0.02352941, 1, 1,
0.3330451, -0.02471411, 2.743563, 0, 0.01568628, 1, 1,
0.3330814, -0.3511825, 2.956445, 0, 0.01176471, 1, 1,
0.3340924, 0.9642811, -0.9131607, 0, 0.003921569, 1, 1,
0.3375519, -1.17354, 4.931054, 0.003921569, 0, 1, 1,
0.3398333, -0.7674863, 4.469144, 0.007843138, 0, 1, 1,
0.3415044, 0.08324067, 2.080262, 0.01568628, 0, 1, 1,
0.3420227, 0.0974772, 0.7178472, 0.01960784, 0, 1, 1,
0.3427182, 1.470858, 1.794101, 0.02745098, 0, 1, 1,
0.3465573, -0.326862, 2.69314, 0.03137255, 0, 1, 1,
0.3473302, -0.3835004, 3.119293, 0.03921569, 0, 1, 1,
0.3533321, 1.200318, -0.30708, 0.04313726, 0, 1, 1,
0.3535363, -1.129068, 1.930996, 0.05098039, 0, 1, 1,
0.3537159, -0.7309497, 2.404436, 0.05490196, 0, 1, 1,
0.3588672, -0.3988354, 2.984386, 0.0627451, 0, 1, 1,
0.3614137, -1.947169, 2.063442, 0.06666667, 0, 1, 1,
0.3650819, 1.496675, -0.4433917, 0.07450981, 0, 1, 1,
0.3658763, 1.124571, -0.05936748, 0.07843138, 0, 1, 1,
0.3661864, -0.447251, 2.177685, 0.08627451, 0, 1, 1,
0.3680724, -1.023552, 4.918901, 0.09019608, 0, 1, 1,
0.3683141, 0.1613432, 2.718066, 0.09803922, 0, 1, 1,
0.3710565, -1.004838, 2.537266, 0.1058824, 0, 1, 1,
0.3725237, 0.3864079, 0.5123717, 0.1098039, 0, 1, 1,
0.3744888, -0.9108205, 1.497289, 0.1176471, 0, 1, 1,
0.3748699, 0.8496132, 0.6219299, 0.1215686, 0, 1, 1,
0.3765613, 0.5110764, 0.1427316, 0.1294118, 0, 1, 1,
0.3817066, 1.193323, 0.4909156, 0.1333333, 0, 1, 1,
0.38376, -1.081356, 2.912244, 0.1411765, 0, 1, 1,
0.3854793, 0.3762747, 1.277137, 0.145098, 0, 1, 1,
0.3859914, 0.936008, 2.09325, 0.1529412, 0, 1, 1,
0.3896685, 1.500816, 0.346556, 0.1568628, 0, 1, 1,
0.3898647, 1.115509, -0.6508161, 0.1647059, 0, 1, 1,
0.3963371, -0.1102419, 2.360945, 0.1686275, 0, 1, 1,
0.3986921, 1.662322, -1.073974, 0.1764706, 0, 1, 1,
0.4048253, 0.749745, 0.005902526, 0.1803922, 0, 1, 1,
0.4052702, 0.5268298, 1.401917, 0.1882353, 0, 1, 1,
0.4130691, 0.7673771, 0.8164948, 0.1921569, 0, 1, 1,
0.4148185, 0.9855491, 1.321892, 0.2, 0, 1, 1,
0.4186113, -0.06722042, 2.103693, 0.2078431, 0, 1, 1,
0.4215222, -0.5049857, 1.363841, 0.2117647, 0, 1, 1,
0.4243102, -1.358314, 2.08553, 0.2196078, 0, 1, 1,
0.4245971, -0.2793133, 1.434921, 0.2235294, 0, 1, 1,
0.425455, 0.3301006, 0.4152707, 0.2313726, 0, 1, 1,
0.4349684, -1.076008, 3.174918, 0.2352941, 0, 1, 1,
0.4371713, -0.6070052, 2.366254, 0.2431373, 0, 1, 1,
0.4374921, -0.4592083, 2.252824, 0.2470588, 0, 1, 1,
0.4377662, 0.03342435, 3.370794, 0.254902, 0, 1, 1,
0.4381422, -0.1826442, 1.312506, 0.2588235, 0, 1, 1,
0.4413639, -0.7351312, 2.721188, 0.2666667, 0, 1, 1,
0.4475684, -1.717683, 2.77397, 0.2705882, 0, 1, 1,
0.4486962, -0.4517216, 2.431726, 0.2784314, 0, 1, 1,
0.4584435, -0.3557915, 2.451435, 0.282353, 0, 1, 1,
0.4652217, -1.403443, 1.709414, 0.2901961, 0, 1, 1,
0.4659481, 0.5236383, -0.3442568, 0.2941177, 0, 1, 1,
0.4669506, -1.334499, 2.575164, 0.3019608, 0, 1, 1,
0.4684724, -1.418873, 1.675994, 0.3098039, 0, 1, 1,
0.4686765, 0.1981978, 0.8162417, 0.3137255, 0, 1, 1,
0.4689373, 2.417383, 0.4440163, 0.3215686, 0, 1, 1,
0.4689388, 1.487684, 1.89363, 0.3254902, 0, 1, 1,
0.4734645, -0.6683332, 1.704934, 0.3333333, 0, 1, 1,
0.4754578, -0.3977387, 3.287042, 0.3372549, 0, 1, 1,
0.4786543, 0.9310198, -0.9610323, 0.345098, 0, 1, 1,
0.480095, -0.8785014, 3.411738, 0.3490196, 0, 1, 1,
0.487611, 0.1290748, 0.1920387, 0.3568628, 0, 1, 1,
0.4921965, -1.773307, 4.685934, 0.3607843, 0, 1, 1,
0.4966029, 0.5188335, 1.859641, 0.3686275, 0, 1, 1,
0.4968974, 1.729071, -0.09469964, 0.372549, 0, 1, 1,
0.4986941, 0.1547491, 0.38654, 0.3803922, 0, 1, 1,
0.5010381, 0.9243944, 1.267724, 0.3843137, 0, 1, 1,
0.5094776, 0.8198224, 1.877188, 0.3921569, 0, 1, 1,
0.5114427, 1.36853, 0.9591181, 0.3960784, 0, 1, 1,
0.5115974, -0.2293337, 2.96332, 0.4039216, 0, 1, 1,
0.5133817, -0.1058202, 0.3267145, 0.4117647, 0, 1, 1,
0.5136034, 1.328165, -2.12053, 0.4156863, 0, 1, 1,
0.5150715, 0.01331291, 2.600158, 0.4235294, 0, 1, 1,
0.5182548, -0.8160108, 2.799358, 0.427451, 0, 1, 1,
0.5259571, 0.8518326, 2.41755, 0.4352941, 0, 1, 1,
0.5274163, -0.4220734, 2.972133, 0.4392157, 0, 1, 1,
0.5312563, -1.025887, 3.675157, 0.4470588, 0, 1, 1,
0.5329977, -0.2043621, 3.002275, 0.4509804, 0, 1, 1,
0.5330949, 0.606595, 1.486073, 0.4588235, 0, 1, 1,
0.5339513, -1.178828, 2.455564, 0.4627451, 0, 1, 1,
0.5344497, -0.2615375, 1.658441, 0.4705882, 0, 1, 1,
0.5362942, -0.5012135, 2.251461, 0.4745098, 0, 1, 1,
0.5408648, -0.9385132, 2.105177, 0.4823529, 0, 1, 1,
0.5448298, 1.728347, -0.8240995, 0.4862745, 0, 1, 1,
0.5483758, -0.5772547, 2.110739, 0.4941176, 0, 1, 1,
0.5500514, 1.791222, -0.7222289, 0.5019608, 0, 1, 1,
0.5549009, -1.750245, 3.572465, 0.5058824, 0, 1, 1,
0.5568852, 0.3726599, -0.2635514, 0.5137255, 0, 1, 1,
0.5591288, -1.228318, 2.191157, 0.5176471, 0, 1, 1,
0.5592625, -0.198794, 1.818228, 0.5254902, 0, 1, 1,
0.5610812, -0.03363075, 2.121324, 0.5294118, 0, 1, 1,
0.5670237, -1.332606, 2.299221, 0.5372549, 0, 1, 1,
0.5672979, -0.795041, 3.189883, 0.5411765, 0, 1, 1,
0.5696393, -0.7581396, 3.44866, 0.5490196, 0, 1, 1,
0.573472, 1.980518, 0.4367599, 0.5529412, 0, 1, 1,
0.5740702, 0.1110157, 2.001213, 0.5607843, 0, 1, 1,
0.5757638, 0.8400192, 0.8918656, 0.5647059, 0, 1, 1,
0.5800887, 1.305124, -1.134171, 0.572549, 0, 1, 1,
0.5865448, 0.2997198, 0.6653496, 0.5764706, 0, 1, 1,
0.5921494, -1.828184, 3.545632, 0.5843138, 0, 1, 1,
0.5940846, 0.5414727, 1.182973, 0.5882353, 0, 1, 1,
0.5962674, 0.5825503, 0.4715979, 0.5960785, 0, 1, 1,
0.5978435, 0.0223772, 2.142671, 0.6039216, 0, 1, 1,
0.5979036, 0.5474308, 0.4871334, 0.6078432, 0, 1, 1,
0.6008183, 1.256637, 0.8107156, 0.6156863, 0, 1, 1,
0.6018499, 0.4976097, 1.216612, 0.6196079, 0, 1, 1,
0.6102303, 0.1892138, 1.776821, 0.627451, 0, 1, 1,
0.6173603, -1.599054, 2.913164, 0.6313726, 0, 1, 1,
0.6197841, -1.280897, 2.2611, 0.6392157, 0, 1, 1,
0.6210925, 0.2685023, 0.4482171, 0.6431373, 0, 1, 1,
0.6239206, 0.5251949, 2.964806, 0.6509804, 0, 1, 1,
0.6270224, -0.6879631, 1.272178, 0.654902, 0, 1, 1,
0.6282508, -0.7249393, 1.285748, 0.6627451, 0, 1, 1,
0.6295993, -0.6138043, 0.9933932, 0.6666667, 0, 1, 1,
0.63082, 0.008568749, 2.991929, 0.6745098, 0, 1, 1,
0.6322318, 0.1012315, 1.400281, 0.6784314, 0, 1, 1,
0.633462, 1.833897, -2.368928, 0.6862745, 0, 1, 1,
0.6440454, -0.9974992, 0.3237656, 0.6901961, 0, 1, 1,
0.6493268, 0.9077689, 0.207486, 0.6980392, 0, 1, 1,
0.6495153, -0.3114691, 0.4718283, 0.7058824, 0, 1, 1,
0.653188, -0.8682009, 1.756678, 0.7098039, 0, 1, 1,
0.6551273, -1.223907, 1.192171, 0.7176471, 0, 1, 1,
0.6556437, -1.227362, 3.710521, 0.7215686, 0, 1, 1,
0.6564521, 0.1933769, 1.525583, 0.7294118, 0, 1, 1,
0.664377, -0.9350961, 2.99476, 0.7333333, 0, 1, 1,
0.6721964, -0.7802038, 3.088409, 0.7411765, 0, 1, 1,
0.6771409, -0.7706112, 1.176257, 0.7450981, 0, 1, 1,
0.6774137, -0.753249, 3.99435, 0.7529412, 0, 1, 1,
0.678261, 0.04687161, 0.5065255, 0.7568628, 0, 1, 1,
0.6831957, 0.4367622, 1.322719, 0.7647059, 0, 1, 1,
0.684327, 0.4322911, 2.010795, 0.7686275, 0, 1, 1,
0.6856424, -0.6138394, 0.6150736, 0.7764706, 0, 1, 1,
0.6897488, 0.9240185, 1.441081, 0.7803922, 0, 1, 1,
0.6925461, 1.846439, -0.4885065, 0.7882353, 0, 1, 1,
0.7046281, 0.4753442, 0.2376315, 0.7921569, 0, 1, 1,
0.7078016, -1.147578, 2.539724, 0.8, 0, 1, 1,
0.7117632, -0.3538932, 1.634245, 0.8078431, 0, 1, 1,
0.7184749, 0.02990126, 1.101131, 0.8117647, 0, 1, 1,
0.7190777, 0.008800225, 1.711702, 0.8196079, 0, 1, 1,
0.7195035, -0.4474314, -0.1428194, 0.8235294, 0, 1, 1,
0.7282737, -0.3325907, 3.212094, 0.8313726, 0, 1, 1,
0.7290354, 1.360592, -0.757935, 0.8352941, 0, 1, 1,
0.7321383, -0.1523638, 2.845142, 0.8431373, 0, 1, 1,
0.7340402, 0.1435884, 0.2145578, 0.8470588, 0, 1, 1,
0.7428106, -0.5155808, 2.154815, 0.854902, 0, 1, 1,
0.7430706, 0.449614, 1.276074, 0.8588235, 0, 1, 1,
0.7500426, 0.5527219, 0.5497091, 0.8666667, 0, 1, 1,
0.7582904, 0.1332848, 2.312233, 0.8705882, 0, 1, 1,
0.7849013, 0.5438182, -0.1162603, 0.8784314, 0, 1, 1,
0.7894845, 0.09309128, 0.6887156, 0.8823529, 0, 1, 1,
0.7914602, 0.2348496, -0.1268411, 0.8901961, 0, 1, 1,
0.7919381, 0.7014371, 1.953693, 0.8941177, 0, 1, 1,
0.7992727, -0.09762683, 0.464738, 0.9019608, 0, 1, 1,
0.8079645, 0.01048542, 0.9254397, 0.9098039, 0, 1, 1,
0.8085467, -1.072616, 3.368221, 0.9137255, 0, 1, 1,
0.8137165, -0.6819615, 3.986132, 0.9215686, 0, 1, 1,
0.8296421, -0.3965706, -0.3106164, 0.9254902, 0, 1, 1,
0.8388933, -0.1477987, 2.135012, 0.9333333, 0, 1, 1,
0.8510115, 0.4471144, 0.4850508, 0.9372549, 0, 1, 1,
0.8669103, -1.453059, 2.383844, 0.945098, 0, 1, 1,
0.8690934, -1.66883, 2.044757, 0.9490196, 0, 1, 1,
0.8732443, 1.498172, -0.6345137, 0.9568627, 0, 1, 1,
0.8756861, 0.7766895, 1.350433, 0.9607843, 0, 1, 1,
0.877931, 1.97559, -0.4113701, 0.9686275, 0, 1, 1,
0.8785955, -0.8141776, 1.571273, 0.972549, 0, 1, 1,
0.8794233, 1.363109, -0.1440242, 0.9803922, 0, 1, 1,
0.8821039, 0.4383596, 1.826495, 0.9843137, 0, 1, 1,
0.8866018, -0.3291708, 2.529827, 0.9921569, 0, 1, 1,
0.8909738, -0.6950908, 0.8305178, 0.9960784, 0, 1, 1,
0.8968666, -1.711599, 1.91744, 1, 0, 0.9960784, 1,
0.9058006, -0.6590647, 0.3213364, 1, 0, 0.9882353, 1,
0.9085985, -1.091771, 2.244531, 1, 0, 0.9843137, 1,
0.909139, -0.3270522, 2.970978, 1, 0, 0.9764706, 1,
0.9097687, 0.1649842, 0.3232316, 1, 0, 0.972549, 1,
0.9119831, -0.1858225, 0.6419554, 1, 0, 0.9647059, 1,
0.9216825, -0.1974351, -0.002089072, 1, 0, 0.9607843, 1,
0.9219671, 2.643672, -0.143391, 1, 0, 0.9529412, 1,
0.9305136, 2.841528, 1.837783, 1, 0, 0.9490196, 1,
0.933535, -0.2382785, 1.641751, 1, 0, 0.9411765, 1,
0.93467, -0.405761, 0.7010527, 1, 0, 0.9372549, 1,
0.9426285, 1.395297, -0.09730699, 1, 0, 0.9294118, 1,
0.9455267, 0.249845, 2.128989, 1, 0, 0.9254902, 1,
0.948503, -0.3348396, 1.022564, 1, 0, 0.9176471, 1,
0.9543364, -0.6023033, 0.965869, 1, 0, 0.9137255, 1,
0.9582503, 0.179981, 1.38784, 1, 0, 0.9058824, 1,
0.9602119, -2.062682, 3.548012, 1, 0, 0.9019608, 1,
0.9621695, -0.3207616, 2.071517, 1, 0, 0.8941177, 1,
0.9628803, -0.1551338, 2.481374, 1, 0, 0.8862745, 1,
0.9636456, -0.05806417, 2.106875, 1, 0, 0.8823529, 1,
0.964308, -0.09048995, 1.706789, 1, 0, 0.8745098, 1,
0.9656877, 1.384577, -1.780329, 1, 0, 0.8705882, 1,
0.9665533, -0.9060668, 1.467973, 1, 0, 0.8627451, 1,
0.9746929, 0.770009, 1.054666, 1, 0, 0.8588235, 1,
0.9753409, -0.2427044, 1.19376, 1, 0, 0.8509804, 1,
0.9824706, -0.8429169, 2.153342, 1, 0, 0.8470588, 1,
0.9840823, 0.4882156, -0.02895847, 1, 0, 0.8392157, 1,
0.9861728, 1.246108, 0.5941862, 1, 0, 0.8352941, 1,
0.9880907, -1.143667, 2.868283, 1, 0, 0.827451, 1,
0.9901223, -1.495367, 4.492738, 1, 0, 0.8235294, 1,
0.9977968, -1.717355, 1.973342, 1, 0, 0.8156863, 1,
1.000425, 0.8378767, 1.357462, 1, 0, 0.8117647, 1,
1.006099, -0.287612, 2.668191, 1, 0, 0.8039216, 1,
1.009174, 0.5737393, -0.7811915, 1, 0, 0.7960784, 1,
1.013908, 0.7019415, 1.567146, 1, 0, 0.7921569, 1,
1.01792, -1.366219, 2.515569, 1, 0, 0.7843137, 1,
1.020654, -1.579066, 2.460658, 1, 0, 0.7803922, 1,
1.024543, -0.2630761, 2.386419, 1, 0, 0.772549, 1,
1.027533, 0.648303, 0.9341656, 1, 0, 0.7686275, 1,
1.027586, -0.2931738, 1.007008, 1, 0, 0.7607843, 1,
1.029178, 0.24473, 1.360153, 1, 0, 0.7568628, 1,
1.045597, -0.3047347, 0.4767249, 1, 0, 0.7490196, 1,
1.058431, -1.883842, 1.720645, 1, 0, 0.7450981, 1,
1.065367, -1.329013, 2.885538, 1, 0, 0.7372549, 1,
1.066932, 0.3070525, -0.007599161, 1, 0, 0.7333333, 1,
1.067615, 0.44367, 1.203338, 1, 0, 0.7254902, 1,
1.07202, 0.7019705, -0.2956512, 1, 0, 0.7215686, 1,
1.073346, 0.6882704, 1.026423, 1, 0, 0.7137255, 1,
1.075058, -0.2267103, 1.366639, 1, 0, 0.7098039, 1,
1.078277, -0.8491523, 2.895051, 1, 0, 0.7019608, 1,
1.086903, -2.700826, 2.852787, 1, 0, 0.6941177, 1,
1.095483, 0.3655978, 0.2126194, 1, 0, 0.6901961, 1,
1.104778, 1.053622, -0.5946785, 1, 0, 0.682353, 1,
1.104818, 1.856932, 0.6201328, 1, 0, 0.6784314, 1,
1.105317, -0.5878367, 1.333476, 1, 0, 0.6705883, 1,
1.111568, -0.8117875, 1.031672, 1, 0, 0.6666667, 1,
1.120564, -0.03647746, 0.3735565, 1, 0, 0.6588235, 1,
1.127164, 0.1969845, 1.357048, 1, 0, 0.654902, 1,
1.128551, -0.1740144, 2.378496, 1, 0, 0.6470588, 1,
1.136672, 0.5809542, 0.02609024, 1, 0, 0.6431373, 1,
1.143043, -0.2518469, 0.1683405, 1, 0, 0.6352941, 1,
1.148767, -0.1931145, 2.412256, 1, 0, 0.6313726, 1,
1.151425, -0.1799574, 1.772303, 1, 0, 0.6235294, 1,
1.152643, -1.812434, 2.600959, 1, 0, 0.6196079, 1,
1.16327, 2.503452, -0.2011013, 1, 0, 0.6117647, 1,
1.163324, -0.8494048, 3.353666, 1, 0, 0.6078432, 1,
1.165962, -2.171988, 3.698343, 1, 0, 0.6, 1,
1.174171, 1.111472, 2.240947, 1, 0, 0.5921569, 1,
1.175244, -0.6175869, 0.9808184, 1, 0, 0.5882353, 1,
1.175527, -0.2194726, 2.124035, 1, 0, 0.5803922, 1,
1.185712, -0.5879501, 1.99218, 1, 0, 0.5764706, 1,
1.188894, 0.2290078, 0.02910275, 1, 0, 0.5686275, 1,
1.191476, -0.9723787, 2.803303, 1, 0, 0.5647059, 1,
1.208042, -0.2281706, 2.385238, 1, 0, 0.5568628, 1,
1.210289, -0.1437366, 1.724993, 1, 0, 0.5529412, 1,
1.210612, 0.08548605, 3.024253, 1, 0, 0.5450981, 1,
1.223982, -0.6148363, 2.402384, 1, 0, 0.5411765, 1,
1.237289, 1.228292, 0.9698214, 1, 0, 0.5333334, 1,
1.24157, -0.1632084, 3.152996, 1, 0, 0.5294118, 1,
1.244224, -0.1153468, 2.107293, 1, 0, 0.5215687, 1,
1.248739, 0.4170542, 1.961842, 1, 0, 0.5176471, 1,
1.25704, 0.5057791, -0.1885659, 1, 0, 0.509804, 1,
1.264159, -0.2884453, 0.6931916, 1, 0, 0.5058824, 1,
1.265886, 1.637393, 0.1668178, 1, 0, 0.4980392, 1,
1.273504, -0.4415821, 3.03696, 1, 0, 0.4901961, 1,
1.287758, 0.2647392, 0.8879852, 1, 0, 0.4862745, 1,
1.316387, 0.9545978, 0.5946842, 1, 0, 0.4784314, 1,
1.324087, 0.5779836, 1.785578, 1, 0, 0.4745098, 1,
1.327305, 1.011514, 1.947766, 1, 0, 0.4666667, 1,
1.333746, 0.428955, 1.726579, 1, 0, 0.4627451, 1,
1.342083, -0.9098518, 1.635785, 1, 0, 0.454902, 1,
1.343358, -0.343486, 0.4104862, 1, 0, 0.4509804, 1,
1.346486, -0.5762907, 2.365615, 1, 0, 0.4431373, 1,
1.348041, 1.126116, -0.1390155, 1, 0, 0.4392157, 1,
1.348952, 0.6786769, 1.53507, 1, 0, 0.4313726, 1,
1.354749, -0.08172042, 1.206966, 1, 0, 0.427451, 1,
1.35974, -0.4167145, 3.684516, 1, 0, 0.4196078, 1,
1.364392, 0.5196248, 0.6115629, 1, 0, 0.4156863, 1,
1.389235, -1.592354, 4.872908, 1, 0, 0.4078431, 1,
1.397464, -0.1762459, 1.190772, 1, 0, 0.4039216, 1,
1.405101, -0.7287332, 2.641036, 1, 0, 0.3960784, 1,
1.425945, -0.2472299, 1.860305, 1, 0, 0.3882353, 1,
1.436318, 0.7192853, 1.128227, 1, 0, 0.3843137, 1,
1.440336, -0.7600582, 1.71499, 1, 0, 0.3764706, 1,
1.440823, -0.8041814, 4.169267, 1, 0, 0.372549, 1,
1.446165, 1.839061, -0.642459, 1, 0, 0.3647059, 1,
1.448956, 0.4110478, 2.717279, 1, 0, 0.3607843, 1,
1.453938, -0.2253956, 0.8472081, 1, 0, 0.3529412, 1,
1.461156, 0.0613171, 1.043011, 1, 0, 0.3490196, 1,
1.463789, -1.889332, 2.819219, 1, 0, 0.3411765, 1,
1.466249, 1.566199, 1.127179, 1, 0, 0.3372549, 1,
1.46857, -0.4240859, 0.799176, 1, 0, 0.3294118, 1,
1.470353, -0.5254387, 1.438546, 1, 0, 0.3254902, 1,
1.473308, -1.258815, 2.00215, 1, 0, 0.3176471, 1,
1.488733, -0.5194201, 1.676637, 1, 0, 0.3137255, 1,
1.490715, 0.8601798, -0.05237785, 1, 0, 0.3058824, 1,
1.509351, -0.892491, 2.112165, 1, 0, 0.2980392, 1,
1.513843, -0.2286757, 1.441202, 1, 0, 0.2941177, 1,
1.52152, -1.013074, 2.592049, 1, 0, 0.2862745, 1,
1.52486, -1.271627, 3.004519, 1, 0, 0.282353, 1,
1.536193, -0.1619736, 1.161022, 1, 0, 0.2745098, 1,
1.538815, 0.536675, 2.037642, 1, 0, 0.2705882, 1,
1.550752, -0.02300504, 0.5454769, 1, 0, 0.2627451, 1,
1.567716, 0.6168219, 2.877926, 1, 0, 0.2588235, 1,
1.582323, 1.215473, 2.552689, 1, 0, 0.2509804, 1,
1.619677, -1.851329, 2.205001, 1, 0, 0.2470588, 1,
1.625123, 0.4989088, 1.643328, 1, 0, 0.2392157, 1,
1.628394, 0.2523607, -0.6115392, 1, 0, 0.2352941, 1,
1.628536, -0.05446038, 0.3015354, 1, 0, 0.227451, 1,
1.658711, 1.194552, 0.5942331, 1, 0, 0.2235294, 1,
1.71204, 0.4727919, -0.1358457, 1, 0, 0.2156863, 1,
1.712269, -0.844041, 1.521872, 1, 0, 0.2117647, 1,
1.716803, -1.693885, 1.488938, 1, 0, 0.2039216, 1,
1.755228, -1.177424, 1.004589, 1, 0, 0.1960784, 1,
1.76033, -1.665168, 3.47604, 1, 0, 0.1921569, 1,
1.785104, 1.134351, 0.1433226, 1, 0, 0.1843137, 1,
1.796828, -1.779718, 1.422202, 1, 0, 0.1803922, 1,
1.83476, 0.2649471, 3.111471, 1, 0, 0.172549, 1,
1.870287, 0.8728215, 2.058835, 1, 0, 0.1686275, 1,
1.878751, -0.3540098, 1.096579, 1, 0, 0.1607843, 1,
1.880396, 1.58221, 0.8503466, 1, 0, 0.1568628, 1,
1.905088, 0.3534142, 1.303138, 1, 0, 0.1490196, 1,
1.931812, 0.6168324, 0.7493426, 1, 0, 0.145098, 1,
1.937258, -0.813679, 3.276086, 1, 0, 0.1372549, 1,
1.972186, 0.2238102, 1.05354, 1, 0, 0.1333333, 1,
1.996075, -0.855196, 3.009166, 1, 0, 0.1254902, 1,
1.999802, -1.332603, 2.866478, 1, 0, 0.1215686, 1,
2.00199, -0.6741452, 1.667672, 1, 0, 0.1137255, 1,
2.061427, 1.431938, -0.9742735, 1, 0, 0.1098039, 1,
2.085684, -1.239595, 2.020149, 1, 0, 0.1019608, 1,
2.086138, 0.8054157, 0.9184182, 1, 0, 0.09411765, 1,
2.094275, -1.019994, 3.377977, 1, 0, 0.09019608, 1,
2.098958, -0.2085281, 1.823095, 1, 0, 0.08235294, 1,
2.141032, -0.502345, 2.187047, 1, 0, 0.07843138, 1,
2.164158, 0.2026996, 0.4851325, 1, 0, 0.07058824, 1,
2.184209, 0.3860052, 2.519722, 1, 0, 0.06666667, 1,
2.196948, 0.4020243, 0.776881, 1, 0, 0.05882353, 1,
2.207243, 0.1213193, 1.388697, 1, 0, 0.05490196, 1,
2.237769, 1.33308, 3.026764, 1, 0, 0.04705882, 1,
2.245357, 0.1545018, 0.2315751, 1, 0, 0.04313726, 1,
2.325907, 0.8974184, 0.2871203, 1, 0, 0.03529412, 1,
2.409955, 0.03311365, 1.396828, 1, 0, 0.03137255, 1,
2.754729, -0.695203, 0.7461132, 1, 0, 0.02352941, 1,
2.849616, 0.7032854, -0.3507352, 1, 0, 0.01960784, 1,
3.258536, -1.349713, 1.795162, 1, 0, 0.01176471, 1,
4.112746, 0.5742482, 1.742859, 1, 0, 0.007843138, 1
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
0.3978289, -3.640255, -7.555583, 0, -0.5, 0.5, 0.5,
0.3978289, -3.640255, -7.555583, 1, -0.5, 0.5, 0.5,
0.3978289, -3.640255, -7.555583, 1, 1.5, 0.5, 0.5,
0.3978289, -3.640255, -7.555583, 0, 1.5, 0.5, 0.5
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
-4.576445, 0.07035089, -7.555583, 0, -0.5, 0.5, 0.5,
-4.576445, 0.07035089, -7.555583, 1, -0.5, 0.5, 0.5,
-4.576445, 0.07035089, -7.555583, 1, 1.5, 0.5, 0.5,
-4.576445, 0.07035089, -7.555583, 0, 1.5, 0.5, 0.5
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
-4.576445, -3.640255, -0.02426076, 0, -0.5, 0.5, 0.5,
-4.576445, -3.640255, -0.02426076, 1, -0.5, 0.5, 0.5,
-4.576445, -3.640255, -0.02426076, 1, 1.5, 0.5, 0.5,
-4.576445, -3.640255, -0.02426076, 0, 1.5, 0.5, 0.5
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
-2, -2.783961, -5.817585,
4, -2.783961, -5.817585,
-2, -2.783961, -5.817585,
-2, -2.926677, -6.107252,
0, -2.783961, -5.817585,
0, -2.926677, -6.107252,
2, -2.783961, -5.817585,
2, -2.926677, -6.107252,
4, -2.783961, -5.817585,
4, -2.926677, -6.107252
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
"0",
"2",
"4"
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
-2, -3.212108, -6.686584, 0, -0.5, 0.5, 0.5,
-2, -3.212108, -6.686584, 1, -0.5, 0.5, 0.5,
-2, -3.212108, -6.686584, 1, 1.5, 0.5, 0.5,
-2, -3.212108, -6.686584, 0, 1.5, 0.5, 0.5,
0, -3.212108, -6.686584, 0, -0.5, 0.5, 0.5,
0, -3.212108, -6.686584, 1, -0.5, 0.5, 0.5,
0, -3.212108, -6.686584, 1, 1.5, 0.5, 0.5,
0, -3.212108, -6.686584, 0, 1.5, 0.5, 0.5,
2, -3.212108, -6.686584, 0, -0.5, 0.5, 0.5,
2, -3.212108, -6.686584, 1, -0.5, 0.5, 0.5,
2, -3.212108, -6.686584, 1, 1.5, 0.5, 0.5,
2, -3.212108, -6.686584, 0, 1.5, 0.5, 0.5,
4, -3.212108, -6.686584, 0, -0.5, 0.5, 0.5,
4, -3.212108, -6.686584, 1, -0.5, 0.5, 0.5,
4, -3.212108, -6.686584, 1, 1.5, 0.5, 0.5,
4, -3.212108, -6.686584, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.428536, -2, -5.817585,
-3.428536, 2, -5.817585,
-3.428536, -2, -5.817585,
-3.619854, -2, -6.107252,
-3.428536, -1, -5.817585,
-3.619854, -1, -6.107252,
-3.428536, 0, -5.817585,
-3.619854, 0, -6.107252,
-3.428536, 1, -5.817585,
-3.619854, 1, -6.107252,
-3.428536, 2, -5.817585,
-3.619854, 2, -6.107252
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
-4.002491, -2, -6.686584, 0, -0.5, 0.5, 0.5,
-4.002491, -2, -6.686584, 1, -0.5, 0.5, 0.5,
-4.002491, -2, -6.686584, 1, 1.5, 0.5, 0.5,
-4.002491, -2, -6.686584, 0, 1.5, 0.5, 0.5,
-4.002491, -1, -6.686584, 0, -0.5, 0.5, 0.5,
-4.002491, -1, -6.686584, 1, -0.5, 0.5, 0.5,
-4.002491, -1, -6.686584, 1, 1.5, 0.5, 0.5,
-4.002491, -1, -6.686584, 0, 1.5, 0.5, 0.5,
-4.002491, 0, -6.686584, 0, -0.5, 0.5, 0.5,
-4.002491, 0, -6.686584, 1, -0.5, 0.5, 0.5,
-4.002491, 0, -6.686584, 1, 1.5, 0.5, 0.5,
-4.002491, 0, -6.686584, 0, 1.5, 0.5, 0.5,
-4.002491, 1, -6.686584, 0, -0.5, 0.5, 0.5,
-4.002491, 1, -6.686584, 1, -0.5, 0.5, 0.5,
-4.002491, 1, -6.686584, 1, 1.5, 0.5, 0.5,
-4.002491, 1, -6.686584, 0, 1.5, 0.5, 0.5,
-4.002491, 2, -6.686584, 0, -0.5, 0.5, 0.5,
-4.002491, 2, -6.686584, 1, -0.5, 0.5, 0.5,
-4.002491, 2, -6.686584, 1, 1.5, 0.5, 0.5,
-4.002491, 2, -6.686584, 0, 1.5, 0.5, 0.5
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
-3.428536, -2.783961, -4,
-3.428536, -2.783961, 4,
-3.428536, -2.783961, -4,
-3.619854, -2.926677, -4,
-3.428536, -2.783961, -2,
-3.619854, -2.926677, -2,
-3.428536, -2.783961, 0,
-3.619854, -2.926677, 0,
-3.428536, -2.783961, 2,
-3.619854, -2.926677, 2,
-3.428536, -2.783961, 4,
-3.619854, -2.926677, 4
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
-4.002491, -3.212108, -4, 0, -0.5, 0.5, 0.5,
-4.002491, -3.212108, -4, 1, -0.5, 0.5, 0.5,
-4.002491, -3.212108, -4, 1, 1.5, 0.5, 0.5,
-4.002491, -3.212108, -4, 0, 1.5, 0.5, 0.5,
-4.002491, -3.212108, -2, 0, -0.5, 0.5, 0.5,
-4.002491, -3.212108, -2, 1, -0.5, 0.5, 0.5,
-4.002491, -3.212108, -2, 1, 1.5, 0.5, 0.5,
-4.002491, -3.212108, -2, 0, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 0, 0, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 0, 1, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 0, 1, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 0, 0, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 2, 0, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 2, 1, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 2, 1, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 2, 0, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 4, 0, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 4, 1, -0.5, 0.5, 0.5,
-4.002491, -3.212108, 4, 1, 1.5, 0.5, 0.5,
-4.002491, -3.212108, 4, 0, 1.5, 0.5, 0.5
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
-3.428536, -2.783961, -5.817585,
-3.428536, 2.924663, -5.817585,
-3.428536, -2.783961, 5.769064,
-3.428536, 2.924663, 5.769064,
-3.428536, -2.783961, -5.817585,
-3.428536, -2.783961, 5.769064,
-3.428536, 2.924663, -5.817585,
-3.428536, 2.924663, 5.769064,
-3.428536, -2.783961, -5.817585,
4.224194, -2.783961, -5.817585,
-3.428536, -2.783961, 5.769064,
4.224194, -2.783961, 5.769064,
-3.428536, 2.924663, -5.817585,
4.224194, 2.924663, -5.817585,
-3.428536, 2.924663, 5.769064,
4.224194, 2.924663, 5.769064,
4.224194, -2.783961, -5.817585,
4.224194, 2.924663, -5.817585,
4.224194, -2.783961, 5.769064,
4.224194, 2.924663, 5.769064,
4.224194, -2.783961, -5.817585,
4.224194, -2.783961, 5.769064,
4.224194, 2.924663, -5.817585,
4.224194, 2.924663, 5.769064
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
var radius = 8.016881;
var distance = 35.66801;
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
mvMatrix.translate( -0.3978289, -0.07035089, 0.02426076 );
mvMatrix.scale( 1.132669, 1.518406, 0.7481031 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.66801);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
propynyl_bromide<-read.table("propynyl_bromide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propynyl_bromide$V2
```

```
## Error in eval(expr, envir, enclos): object 'propynyl_bromide' not found
```

```r
y<-propynyl_bromide$V3
```

```
## Error in eval(expr, envir, enclos): object 'propynyl_bromide' not found
```

```r
z<-propynyl_bromide$V4
```

```
## Error in eval(expr, envir, enclos): object 'propynyl_bromide' not found
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
-3.317088, -0.8857284, -0.9905523, 0, 0, 1, 1, 1,
-2.90331, 0.4933522, -1.271021, 1, 0, 0, 1, 1,
-2.733723, 1.532813, -2.085716, 1, 0, 0, 1, 1,
-2.623484, 0.1765941, -2.506819, 1, 0, 0, 1, 1,
-2.620669, -0.7455376, -2.58868, 1, 0, 0, 1, 1,
-2.58948, -0.2504803, -1.309383, 1, 0, 0, 1, 1,
-2.466242, -0.2325532, -0.2185717, 0, 0, 0, 1, 1,
-2.444031, -0.469626, -0.9564742, 0, 0, 0, 1, 1,
-2.413487, -0.8507935, -1.105397, 0, 0, 0, 1, 1,
-2.406029, -0.7819537, -1.36951, 0, 0, 0, 1, 1,
-2.373015, -0.1907477, -2.235117, 0, 0, 0, 1, 1,
-2.372293, -0.8307512, -0.8818183, 0, 0, 0, 1, 1,
-2.37167, 0.3460976, -0.6141349, 0, 0, 0, 1, 1,
-2.260425, 0.8255941, -3.404071, 1, 1, 1, 1, 1,
-2.243289, -1.08161, -2.8418, 1, 1, 1, 1, 1,
-2.213049, -0.9035358, -2.075697, 1, 1, 1, 1, 1,
-2.208648, 0.6763429, -0.8651054, 1, 1, 1, 1, 1,
-2.195517, 0.1839282, -0.7974383, 1, 1, 1, 1, 1,
-2.182256, -0.03780734, -1.721628, 1, 1, 1, 1, 1,
-2.179687, 0.2379802, -1.802618, 1, 1, 1, 1, 1,
-2.178987, 0.2755989, -1.853888, 1, 1, 1, 1, 1,
-2.160433, 0.3179326, -0.5482194, 1, 1, 1, 1, 1,
-2.148672, -0.7635497, -2.236649, 1, 1, 1, 1, 1,
-2.093671, 0.0002456664, -2.595076, 1, 1, 1, 1, 1,
-2.081179, 0.8821725, -0.2376992, 1, 1, 1, 1, 1,
-2.076341, -2.680263, -1.775553, 1, 1, 1, 1, 1,
-2.074302, -0.5701574, -2.561955, 1, 1, 1, 1, 1,
-2.069676, -0.4883787, -2.920526, 1, 1, 1, 1, 1,
-2.030947, -0.4968428, -1.255954, 0, 0, 1, 1, 1,
-2.008529, 0.4491878, -1.763699, 1, 0, 0, 1, 1,
-1.986772, 0.1457368, -3.943964, 1, 0, 0, 1, 1,
-1.968685, 1.735037, -1.846561, 1, 0, 0, 1, 1,
-1.941443, -0.3912118, -2.689401, 1, 0, 0, 1, 1,
-1.933543, -0.8647527, -2.900876, 1, 0, 0, 1, 1,
-1.931145, 0.6241678, -1.623957, 0, 0, 0, 1, 1,
-1.921324, 0.6789811, 0.5628674, 0, 0, 0, 1, 1,
-1.920651, -0.1927429, -0.4538797, 0, 0, 0, 1, 1,
-1.91877, -0.6404392, -2.685605, 0, 0, 0, 1, 1,
-1.9166, 0.535103, -2.017071, 0, 0, 0, 1, 1,
-1.908526, -2.609069, -4.075437, 0, 0, 0, 1, 1,
-1.883122, -2.647618, -2.986578, 0, 0, 0, 1, 1,
-1.859419, 0.5197876, -1.467684, 1, 1, 1, 1, 1,
-1.855849, 0.1165032, -1.493892, 1, 1, 1, 1, 1,
-1.836259, -0.1567846, -1.499262, 1, 1, 1, 1, 1,
-1.82556, -0.1038537, -1.350366, 1, 1, 1, 1, 1,
-1.825534, 0.3708262, -1.159457, 1, 1, 1, 1, 1,
-1.810999, 0.6595507, -1.782894, 1, 1, 1, 1, 1,
-1.808616, -0.6635105, -2.402724, 1, 1, 1, 1, 1,
-1.803996, -0.4714472, -2.388581, 1, 1, 1, 1, 1,
-1.800864, 1.620019, 1.056978, 1, 1, 1, 1, 1,
-1.767591, 0.8167506, -0.6341248, 1, 1, 1, 1, 1,
-1.738687, 1.284171, 0.032284, 1, 1, 1, 1, 1,
-1.735128, 0.5304009, -1.064925, 1, 1, 1, 1, 1,
-1.715797, 2.41102, -2.860978, 1, 1, 1, 1, 1,
-1.693551, -0.02262932, -1.783344, 1, 1, 1, 1, 1,
-1.674694, 0.3330838, -2.376153, 1, 1, 1, 1, 1,
-1.668323, 0.918004, 0.4749822, 0, 0, 1, 1, 1,
-1.665562, -0.9504112, -0.9859419, 1, 0, 0, 1, 1,
-1.656483, 0.04058184, -1.137802, 1, 0, 0, 1, 1,
-1.641848, -0.4698951, -2.727698, 1, 0, 0, 1, 1,
-1.641493, -2.400668, -1.938596, 1, 0, 0, 1, 1,
-1.622, -0.3490763, -0.5822861, 1, 0, 0, 1, 1,
-1.611972, 0.7794157, -3.217882, 0, 0, 0, 1, 1,
-1.581868, 0.5041085, -0.0575392, 0, 0, 0, 1, 1,
-1.579569, 2.201984, -0.4582872, 0, 0, 0, 1, 1,
-1.578919, -0.7352164, -2.764163, 0, 0, 0, 1, 1,
-1.578658, -0.4465975, -1.062504, 0, 0, 0, 1, 1,
-1.563438, -1.676127, -1.32289, 0, 0, 0, 1, 1,
-1.556894, 1.662105, -0.5832676, 0, 0, 0, 1, 1,
-1.529256, 0.0524063, -2.572361, 1, 1, 1, 1, 1,
-1.52911, -0.1542505, -2.55813, 1, 1, 1, 1, 1,
-1.522689, 1.296796, 0.3589939, 1, 1, 1, 1, 1,
-1.518418, 1.118342, -0.03721218, 1, 1, 1, 1, 1,
-1.517347, 0.05527586, -1.808473, 1, 1, 1, 1, 1,
-1.51074, 0.02945448, -2.778863, 1, 1, 1, 1, 1,
-1.498192, 0.5681319, -0.4740277, 1, 1, 1, 1, 1,
-1.49239, 0.8072374, -1.63346, 1, 1, 1, 1, 1,
-1.487818, 1.047212, -2.976278, 1, 1, 1, 1, 1,
-1.482126, 1.035937, -1.409305, 1, 1, 1, 1, 1,
-1.477448, -0.4897846, -2.717847, 1, 1, 1, 1, 1,
-1.47436, -1.225391, -2.944167, 1, 1, 1, 1, 1,
-1.470114, -2.003371, -2.837275, 1, 1, 1, 1, 1,
-1.469681, 1.944309, 0.09771187, 1, 1, 1, 1, 1,
-1.4637, -1.507123, -3.713404, 1, 1, 1, 1, 1,
-1.458312, 1.251283, -0.9269035, 0, 0, 1, 1, 1,
-1.456657, -0.4577777, -0.2334388, 1, 0, 0, 1, 1,
-1.422288, 0.1616537, -1.710979, 1, 0, 0, 1, 1,
-1.417705, -1.23027, -3.734052, 1, 0, 0, 1, 1,
-1.415461, 0.007521638, 0.4946039, 1, 0, 0, 1, 1,
-1.415399, -0.8365954, -1.466442, 1, 0, 0, 1, 1,
-1.410597, -0.08238534, -0.5972222, 0, 0, 0, 1, 1,
-1.40401, -0.2861824, -1.237252, 0, 0, 0, 1, 1,
-1.401651, 0.3282804, -1.789496, 0, 0, 0, 1, 1,
-1.401121, 0.9808968, -0.9476766, 0, 0, 0, 1, 1,
-1.395093, -0.1456574, -1.470848, 0, 0, 0, 1, 1,
-1.382478, 0.4818047, 0.03152604, 0, 0, 0, 1, 1,
-1.38227, -0.1511004, -2.528833, 0, 0, 0, 1, 1,
-1.379475, -0.4317241, -2.753992, 1, 1, 1, 1, 1,
-1.368322, -1.025985, -0.7344881, 1, 1, 1, 1, 1,
-1.362579, 0.4731195, -1.521469, 1, 1, 1, 1, 1,
-1.357403, -0.8226454, -1.438673, 1, 1, 1, 1, 1,
-1.351699, 0.1862535, -3.379139, 1, 1, 1, 1, 1,
-1.343008, -0.648456, -1.943256, 1, 1, 1, 1, 1,
-1.327579, 0.3619638, -3.126975, 1, 1, 1, 1, 1,
-1.324687, 0.7972509, -1.019333, 1, 1, 1, 1, 1,
-1.323253, 0.3530858, 0.2415096, 1, 1, 1, 1, 1,
-1.322645, 0.2079736, -2.917847, 1, 1, 1, 1, 1,
-1.294961, 0.5361466, -1.416452, 1, 1, 1, 1, 1,
-1.294893, -1.705034, -3.180959, 1, 1, 1, 1, 1,
-1.288491, -1.459831, -2.895495, 1, 1, 1, 1, 1,
-1.270518, 0.5213314, -1.457802, 1, 1, 1, 1, 1,
-1.269972, 1.515062, -2.547295, 1, 1, 1, 1, 1,
-1.268045, -0.05478367, -1.230392, 0, 0, 1, 1, 1,
-1.266871, 1.38351, -1.027305, 1, 0, 0, 1, 1,
-1.263543, -0.07973368, -3.248169, 1, 0, 0, 1, 1,
-1.258381, -0.69408, -2.448116, 1, 0, 0, 1, 1,
-1.257524, -1.660952, -3.905315, 1, 0, 0, 1, 1,
-1.244609, 0.09711923, -1.078544, 1, 0, 0, 1, 1,
-1.243635, -0.3104183, -1.891109, 0, 0, 0, 1, 1,
-1.236477, -0.2882047, -1.857559, 0, 0, 0, 1, 1,
-1.225634, 0.2642953, -0.6220379, 0, 0, 0, 1, 1,
-1.225224, -0.7649924, -2.362816, 0, 0, 0, 1, 1,
-1.223503, 0.4036756, -2.121188, 0, 0, 0, 1, 1,
-1.215976, 0.1057399, -0.3157825, 0, 0, 0, 1, 1,
-1.209473, 0.2442837, -0.1887857, 0, 0, 0, 1, 1,
-1.206722, 0.1697042, 0.1360559, 1, 1, 1, 1, 1,
-1.200239, -0.6632446, -2.575836, 1, 1, 1, 1, 1,
-1.189861, -0.6825466, -1.112537, 1, 1, 1, 1, 1,
-1.184395, 0.3355671, 0.471429, 1, 1, 1, 1, 1,
-1.176371, -0.633345, -2.351895, 1, 1, 1, 1, 1,
-1.172144, 1.230543, -0.1981327, 1, 1, 1, 1, 1,
-1.167042, 0.6535732, -0.5075415, 1, 1, 1, 1, 1,
-1.165369, 0.8982604, -2.977521, 1, 1, 1, 1, 1,
-1.150206, -0.3347642, -2.691845, 1, 1, 1, 1, 1,
-1.14498, -0.8697035, -1.127807, 1, 1, 1, 1, 1,
-1.144113, -0.4760278, -1.051173, 1, 1, 1, 1, 1,
-1.140494, -1.762379, -3.876288, 1, 1, 1, 1, 1,
-1.139709, -0.2524807, -1.595845, 1, 1, 1, 1, 1,
-1.138195, 1.087045, -2.845763, 1, 1, 1, 1, 1,
-1.135654, -2.130231, -1.775178, 1, 1, 1, 1, 1,
-1.135288, 0.683764, -0.1861343, 0, 0, 1, 1, 1,
-1.128183, -0.6779792, -2.786209, 1, 0, 0, 1, 1,
-1.125044, -0.6786883, -3.661894, 1, 0, 0, 1, 1,
-1.121515, -0.5814515, -2.783192, 1, 0, 0, 1, 1,
-1.117276, -0.01815612, -2.131298, 1, 0, 0, 1, 1,
-1.115343, -0.6741858, -3.117328, 1, 0, 0, 1, 1,
-1.113332, 0.6767311, -1.179476, 0, 0, 0, 1, 1,
-1.112213, 1.135716, -0.331084, 0, 0, 0, 1, 1,
-1.106431, 0.5269262, -1.499773, 0, 0, 0, 1, 1,
-1.100655, 1.150772, -1.701788, 0, 0, 0, 1, 1,
-1.086123, 0.6901569, 0.01415047, 0, 0, 0, 1, 1,
-1.071512, -0.01727798, -1.956492, 0, 0, 0, 1, 1,
-1.071099, 0.02357107, -2.127428, 0, 0, 0, 1, 1,
-1.069782, 1.123328, -0.5016775, 1, 1, 1, 1, 1,
-1.068595, -1.338299, -2.549643, 1, 1, 1, 1, 1,
-1.06595, 0.8840672, -1.610204, 1, 1, 1, 1, 1,
-1.064796, -0.7696551, -0.9647272, 1, 1, 1, 1, 1,
-1.061386, 1.415048, -0.8516431, 1, 1, 1, 1, 1,
-1.060656, -0.8717647, -2.571658, 1, 1, 1, 1, 1,
-1.053889, 0.3868889, -0.9274041, 1, 1, 1, 1, 1,
-1.049258, 0.1097798, -1.699842, 1, 1, 1, 1, 1,
-1.045885, 0.3219402, -0.8142381, 1, 1, 1, 1, 1,
-1.038855, -0.8341899, -2.467073, 1, 1, 1, 1, 1,
-1.038567, -1.228304, -1.44074, 1, 1, 1, 1, 1,
-1.036846, 1.913293, 0.3055131, 1, 1, 1, 1, 1,
-1.03484, -1.79645, -2.033545, 1, 1, 1, 1, 1,
-1.03324, -0.5596825, -1.550705, 1, 1, 1, 1, 1,
-1.021886, -1.733919, -2.816022, 1, 1, 1, 1, 1,
-1.018927, 0.4674757, -2.540811, 0, 0, 1, 1, 1,
-1.018795, 0.09054047, -1.450426, 1, 0, 0, 1, 1,
-1.015401, -0.04190249, -1.917662, 1, 0, 0, 1, 1,
-1.015154, 0.2506081, -0.7131545, 1, 0, 0, 1, 1,
-1.010422, 0.2167981, -0.6079698, 1, 0, 0, 1, 1,
-1.008079, -0.4439269, -0.8057725, 1, 0, 0, 1, 1,
-1.005857, -0.2626533, -1.265694, 0, 0, 0, 1, 1,
-1.002669, -0.1111886, -2.287863, 0, 0, 0, 1, 1,
-1.002456, -1.229725, -2.077674, 0, 0, 0, 1, 1,
-0.99848, 0.3183997, -1.389778, 0, 0, 0, 1, 1,
-0.9914415, -0.4203156, -2.529086, 0, 0, 0, 1, 1,
-0.9833426, 1.54309, -1.524112, 0, 0, 0, 1, 1,
-0.9821579, 1.517084, -2.627851, 0, 0, 0, 1, 1,
-0.9789929, 0.528747, 0.02414778, 1, 1, 1, 1, 1,
-0.9760892, -0.0184, -2.137428, 1, 1, 1, 1, 1,
-0.9750438, -1.022361, -1.971732, 1, 1, 1, 1, 1,
-0.9707166, -1.071468, -3.87936, 1, 1, 1, 1, 1,
-0.9706146, -0.7719845, -1.285501, 1, 1, 1, 1, 1,
-0.9704604, 1.467325, -0.5176579, 1, 1, 1, 1, 1,
-0.9613424, -0.2161964, -0.519722, 1, 1, 1, 1, 1,
-0.9605505, 0.596795, -0.5024506, 1, 1, 1, 1, 1,
-0.9596746, -0.9582864, -3.100017, 1, 1, 1, 1, 1,
-0.9562856, 0.9418054, -0.7034139, 1, 1, 1, 1, 1,
-0.9555572, 2.53778, -1.178084, 1, 1, 1, 1, 1,
-0.9513066, 1.64179, 0.1349285, 1, 1, 1, 1, 1,
-0.9506641, 2.010056, -0.0176464, 1, 1, 1, 1, 1,
-0.9476991, 0.4635207, -1.330151, 1, 1, 1, 1, 1,
-0.9427698, 0.6349875, 1.083007, 1, 1, 1, 1, 1,
-0.9427105, -0.2104878, -2.314153, 0, 0, 1, 1, 1,
-0.9406261, -0.2648646, -3.082081, 1, 0, 0, 1, 1,
-0.9398445, 0.2281662, -0.6216712, 1, 0, 0, 1, 1,
-0.9383034, 1.31588, -0.4387591, 1, 0, 0, 1, 1,
-0.9373893, -0.5566338, -0.7352281, 1, 0, 0, 1, 1,
-0.9326588, -0.1612951, -1.839866, 1, 0, 0, 1, 1,
-0.9273794, 0.5134387, -1.85094, 0, 0, 0, 1, 1,
-0.9136117, -0.4002334, -3.598746, 0, 0, 0, 1, 1,
-0.9106073, -0.4744291, -2.499948, 0, 0, 0, 1, 1,
-0.9097555, 0.2035903, -1.077574, 0, 0, 0, 1, 1,
-0.9087453, 0.2582884, 0.8976529, 0, 0, 0, 1, 1,
-0.9060765, -0.434346, -0.6228453, 0, 0, 0, 1, 1,
-0.8936279, 0.06016608, -1.222341, 0, 0, 0, 1, 1,
-0.8912907, -0.1911492, -1.701273, 1, 1, 1, 1, 1,
-0.8878824, 0.6207616, -1.373565, 1, 1, 1, 1, 1,
-0.8877206, 1.164492, -2.127351, 1, 1, 1, 1, 1,
-0.8847498, -0.1506306, -2.47243, 1, 1, 1, 1, 1,
-0.8834285, 0.7591481, -2.60455, 1, 1, 1, 1, 1,
-0.8665806, -1.035943, -2.688699, 1, 1, 1, 1, 1,
-0.866149, 0.7958599, -1.027441, 1, 1, 1, 1, 1,
-0.8660994, -0.8424691, -1.915606, 1, 1, 1, 1, 1,
-0.8655826, 0.6232, -1.376, 1, 1, 1, 1, 1,
-0.865221, 1.592244, -0.03322323, 1, 1, 1, 1, 1,
-0.8587388, -0.4633541, -1.406619, 1, 1, 1, 1, 1,
-0.8570487, -1.039987, -3.53384, 1, 1, 1, 1, 1,
-0.8518522, 0.9135094, -1.036147, 1, 1, 1, 1, 1,
-0.851391, 0.8969465, -0.9799252, 1, 1, 1, 1, 1,
-0.8482445, -1.067804, -1.13695, 1, 1, 1, 1, 1,
-0.8477718, 0.1861074, -2.517574, 0, 0, 1, 1, 1,
-0.8473253, -0.5925929, -2.399531, 1, 0, 0, 1, 1,
-0.8383588, -0.8754636, -3.516021, 1, 0, 0, 1, 1,
-0.8375909, -0.955471, -2.434976, 1, 0, 0, 1, 1,
-0.8361515, -0.04341795, -2.211457, 1, 0, 0, 1, 1,
-0.8268875, -1.237101, -1.702741, 1, 0, 0, 1, 1,
-0.8238185, 0.6740023, -1.976891, 0, 0, 0, 1, 1,
-0.8234344, -1.56642, -2.29948, 0, 0, 0, 1, 1,
-0.8233484, 1.334094, -0.1593767, 0, 0, 0, 1, 1,
-0.8199599, 1.05259, 0.9185279, 0, 0, 0, 1, 1,
-0.8180348, -0.4658334, -1.668185, 0, 0, 0, 1, 1,
-0.8142194, 0.1357119, -0.6938234, 0, 0, 0, 1, 1,
-0.8140041, -0.8373258, -2.296414, 0, 0, 0, 1, 1,
-0.8098633, -0.9225253, -2.523618, 1, 1, 1, 1, 1,
-0.8016179, -1.160241, -2.851149, 1, 1, 1, 1, 1,
-0.7997151, -1.430935, -2.403748, 1, 1, 1, 1, 1,
-0.7957298, -0.6435806, -2.791742, 1, 1, 1, 1, 1,
-0.7918627, -1.291187, -2.283498, 1, 1, 1, 1, 1,
-0.7801462, -0.1674752, 0.001349292, 1, 1, 1, 1, 1,
-0.7780245, -2.697381, -1.328057, 1, 1, 1, 1, 1,
-0.764911, -0.7765477, -2.762757, 1, 1, 1, 1, 1,
-0.7633622, 0.4176868, -0.4292995, 1, 1, 1, 1, 1,
-0.76298, -0.4003389, -1.800133, 1, 1, 1, 1, 1,
-0.7555684, -0.08605692, -1.751677, 1, 1, 1, 1, 1,
-0.7531133, -1.004793, -2.652322, 1, 1, 1, 1, 1,
-0.7511035, 0.3928149, -2.052209, 1, 1, 1, 1, 1,
-0.7505266, 0.5237433, -0.07395055, 1, 1, 1, 1, 1,
-0.748978, 0.09638263, -1.353917, 1, 1, 1, 1, 1,
-0.7418376, 0.691193, -1.270782, 0, 0, 1, 1, 1,
-0.7410652, 0.2138784, -0.6397318, 1, 0, 0, 1, 1,
-0.7409464, 0.1156032, -2.517626, 1, 0, 0, 1, 1,
-0.7325366, 0.06296358, -1.415213, 1, 0, 0, 1, 1,
-0.7299989, -1.044401, -1.884569, 1, 0, 0, 1, 1,
-0.722517, 0.0203894, -1.583671, 1, 0, 0, 1, 1,
-0.7176399, -0.6097257, -3.197897, 0, 0, 0, 1, 1,
-0.7168357, -0.1467912, -3.727627, 0, 0, 0, 1, 1,
-0.716004, 1.293286, 0.2774027, 0, 0, 0, 1, 1,
-0.7154008, -0.2074118, -0.3306936, 0, 0, 0, 1, 1,
-0.7138322, 0.4535681, -0.5935276, 0, 0, 0, 1, 1,
-0.7118167, -2.298015, -2.560858, 0, 0, 0, 1, 1,
-0.7065616, 1.022766, -0.02266121, 0, 0, 0, 1, 1,
-0.7000039, -1.41764, -1.843751, 1, 1, 1, 1, 1,
-0.698647, -0.4932891, -2.724685, 1, 1, 1, 1, 1,
-0.6884347, 1.030437, 0.3129104, 1, 1, 1, 1, 1,
-0.6780328, -0.9038606, -1.614211, 1, 1, 1, 1, 1,
-0.6764227, 0.2221426, -1.441402, 1, 1, 1, 1, 1,
-0.6746616, 0.4012599, -1.571595, 1, 1, 1, 1, 1,
-0.672927, 1.1643, -2.905566, 1, 1, 1, 1, 1,
-0.6727635, 0.1828136, -0.115582, 1, 1, 1, 1, 1,
-0.6703255, -0.4178181, -2.112847, 1, 1, 1, 1, 1,
-0.6665658, -1.609907, -1.996941, 1, 1, 1, 1, 1,
-0.666274, 0.690532, -1.073938, 1, 1, 1, 1, 1,
-0.6629885, -0.5538125, -1.150252, 1, 1, 1, 1, 1,
-0.6622259, 0.2787713, -0.176226, 1, 1, 1, 1, 1,
-0.6561775, 1.873371, 1.583904, 1, 1, 1, 1, 1,
-0.6545559, -1.10689, -2.409668, 1, 1, 1, 1, 1,
-0.6525545, 1.68979, -1.075545, 0, 0, 1, 1, 1,
-0.6436829, 1.417996, -1.144757, 1, 0, 0, 1, 1,
-0.6392219, -1.073776, -3.731772, 1, 0, 0, 1, 1,
-0.6374136, -0.09246254, -1.508381, 1, 0, 0, 1, 1,
-0.6283687, 0.602658, -1.985908, 1, 0, 0, 1, 1,
-0.628198, -0.9984941, -2.232533, 1, 0, 0, 1, 1,
-0.6271219, -0.5223775, -3.692623, 0, 0, 0, 1, 1,
-0.6213406, 1.842621, 1.004918, 0, 0, 0, 1, 1,
-0.6099183, -0.3480867, -3.074741, 0, 0, 0, 1, 1,
-0.6087063, -0.1773285, -4.679184, 0, 0, 0, 1, 1,
-0.6084483, -1.694026, -2.334386, 0, 0, 0, 1, 1,
-0.6058932, 2.673778, 1.301082, 0, 0, 0, 1, 1,
-0.6056645, 0.9890191, -0.9545017, 0, 0, 0, 1, 1,
-0.604329, 0.8401812, 0.7196862, 1, 1, 1, 1, 1,
-0.5961426, -1.154173, -2.419566, 1, 1, 1, 1, 1,
-0.5916101, 0.3612089, -1.488408, 1, 1, 1, 1, 1,
-0.5901002, -0.406586, -1.158284, 1, 1, 1, 1, 1,
-0.5799376, -0.1004273, -1.152292, 1, 1, 1, 1, 1,
-0.5750076, 0.6741173, -0.5628465, 1, 1, 1, 1, 1,
-0.5725114, 0.7405761, 0.8375639, 1, 1, 1, 1, 1,
-0.5720308, -0.9160333, -3.521748, 1, 1, 1, 1, 1,
-0.5703171, 1.217501, -0.2483184, 1, 1, 1, 1, 1,
-0.5687596, 0.991558, 0.001329338, 1, 1, 1, 1, 1,
-0.5670497, -0.992287, -4.699679, 1, 1, 1, 1, 1,
-0.5651187, -1.007612, -2.018474, 1, 1, 1, 1, 1,
-0.5637993, -2.043494, -0.8909507, 1, 1, 1, 1, 1,
-0.5615237, 1.540578, 0.3345189, 1, 1, 1, 1, 1,
-0.5606589, 0.6037231, -0.1301588, 1, 1, 1, 1, 1,
-0.5599795, -0.7735001, -2.951915, 0, 0, 1, 1, 1,
-0.5566334, 1.825678, -0.2798065, 1, 0, 0, 1, 1,
-0.55004, -0.8543937, -2.141498, 1, 0, 0, 1, 1,
-0.5493799, -0.4608525, -1.877553, 1, 0, 0, 1, 1,
-0.5481566, -0.01541098, -0.9419167, 1, 0, 0, 1, 1,
-0.5464242, 1.419074, -0.5186852, 1, 0, 0, 1, 1,
-0.544786, -0.60529, -3.646218, 0, 0, 0, 1, 1,
-0.5349223, -0.1976855, -1.685399, 0, 0, 0, 1, 1,
-0.5335445, -0.2214137, -1.417955, 0, 0, 0, 1, 1,
-0.5311276, -0.5357692, -2.442381, 0, 0, 0, 1, 1,
-0.5250511, 0.8927591, -1.585159, 0, 0, 0, 1, 1,
-0.5246524, 0.7699953, -0.3761869, 0, 0, 0, 1, 1,
-0.5231888, -0.5126762, -1.886035, 0, 0, 0, 1, 1,
-0.5231147, 0.6196645, -1.098586, 1, 1, 1, 1, 1,
-0.5171818, -1.245947, -3.813421, 1, 1, 1, 1, 1,
-0.5170969, -1.064355, -3.041688, 1, 1, 1, 1, 1,
-0.5129586, 0.5652194, 0.04354459, 1, 1, 1, 1, 1,
-0.5127231, 0.02220529, -3.24478, 1, 1, 1, 1, 1,
-0.5121871, 1.09999, 0.6661102, 1, 1, 1, 1, 1,
-0.5119056, -0.389008, -1.545843, 1, 1, 1, 1, 1,
-0.5116795, 1.404066, 0.5601554, 1, 1, 1, 1, 1,
-0.5092031, -0.9441776, -4.830238, 1, 1, 1, 1, 1,
-0.5075703, -2.066029, -0.4490083, 1, 1, 1, 1, 1,
-0.5056707, 0.008109851, -1.91985, 1, 1, 1, 1, 1,
-0.5055321, 0.6453006, -1.339697, 1, 1, 1, 1, 1,
-0.5002971, 0.4956933, -1.395435, 1, 1, 1, 1, 1,
-0.4990537, -1.269603, -3.141423, 1, 1, 1, 1, 1,
-0.4971561, 0.7901515, 0.1630408, 1, 1, 1, 1, 1,
-0.4926071, 0.003464113, -2.913019, 0, 0, 1, 1, 1,
-0.4917701, -1.770633, -2.738472, 1, 0, 0, 1, 1,
-0.4908133, 0.7623553, -0.3433726, 1, 0, 0, 1, 1,
-0.4895357, -0.01994454, -1.840477, 1, 0, 0, 1, 1,
-0.4842791, 0.6510502, -0.5150598, 1, 0, 0, 1, 1,
-0.4827974, 0.2994063, -0.8953918, 1, 0, 0, 1, 1,
-0.4796225, 0.2380674, -1.548036, 0, 0, 0, 1, 1,
-0.4787317, -0.3733031, -1.517955, 0, 0, 0, 1, 1,
-0.4694417, -0.6473435, -1.326516, 0, 0, 0, 1, 1,
-0.465081, -0.0361667, -2.178652, 0, 0, 0, 1, 1,
-0.465016, -0.624586, -1.060838, 0, 0, 0, 1, 1,
-0.4575213, 0.01150988, -2.383984, 0, 0, 0, 1, 1,
-0.453594, 1.262359, 0.3190776, 0, 0, 0, 1, 1,
-0.4515941, 0.2740203, -0.5168182, 1, 1, 1, 1, 1,
-0.4507174, 0.6236148, -0.6494824, 1, 1, 1, 1, 1,
-0.4470461, 0.2417246, -0.660832, 1, 1, 1, 1, 1,
-0.4413684, -0.0863919, -2.877761, 1, 1, 1, 1, 1,
-0.4242972, -0.07266369, -2.264234, 1, 1, 1, 1, 1,
-0.42407, 0.8734494, 0.4902481, 1, 1, 1, 1, 1,
-0.4212368, -1.61988, -2.832314, 1, 1, 1, 1, 1,
-0.4191406, -0.4335577, -2.328857, 1, 1, 1, 1, 1,
-0.4182532, 0.8605346, 0.7154075, 1, 1, 1, 1, 1,
-0.4180376, -0.3770867, -1.960011, 1, 1, 1, 1, 1,
-0.4174475, -1.129717, -2.846412, 1, 1, 1, 1, 1,
-0.413088, -0.8952721, -2.882626, 1, 1, 1, 1, 1,
-0.4121275, 0.2293692, -0.8608728, 1, 1, 1, 1, 1,
-0.4112607, 1.480701, 0.242545, 1, 1, 1, 1, 1,
-0.4106623, 0.6514096, -1.2662, 1, 1, 1, 1, 1,
-0.4084681, -0.2344743, -0.7939247, 0, 0, 1, 1, 1,
-0.407953, -0.05136983, -1.708298, 1, 0, 0, 1, 1,
-0.4074975, -0.6352519, -3.552023, 1, 0, 0, 1, 1,
-0.4059344, -0.6507391, -4.226079, 1, 0, 0, 1, 1,
-0.405541, 0.4708571, 0.03241984, 1, 0, 0, 1, 1,
-0.4026042, 0.1254451, -1.828624, 1, 0, 0, 1, 1,
-0.4024378, -0.2777523, -2.541907, 0, 0, 0, 1, 1,
-0.4019918, -0.2927066, -2.568691, 0, 0, 0, 1, 1,
-0.4006412, -0.8992213, -4.535302, 0, 0, 0, 1, 1,
-0.3990117, 0.7931339, -0.266365, 0, 0, 0, 1, 1,
-0.3979447, -0.1856526, -1.88584, 0, 0, 0, 1, 1,
-0.3969429, 1.156868, -2.773345, 0, 0, 0, 1, 1,
-0.3961944, 0.1007773, -2.066453, 0, 0, 0, 1, 1,
-0.3941761, -0.4583628, -1.144015, 1, 1, 1, 1, 1,
-0.3885427, -0.2718107, -4.129053, 1, 1, 1, 1, 1,
-0.3879921, 1.017204, 0.5274355, 1, 1, 1, 1, 1,
-0.3870631, 0.8856824, -1.539581, 1, 1, 1, 1, 1,
-0.3861047, -0.4232269, -2.680198, 1, 1, 1, 1, 1,
-0.3850766, 0.2495674, -0.7955645, 1, 1, 1, 1, 1,
-0.3818995, 0.5468893, -1.577573, 1, 1, 1, 1, 1,
-0.379692, -2.152998, -3.127557, 1, 1, 1, 1, 1,
-0.3790729, -0.1481881, -3.194329, 1, 1, 1, 1, 1,
-0.3773288, 0.5964369, -2.126883, 1, 1, 1, 1, 1,
-0.3755647, 1.395918, -1.907666, 1, 1, 1, 1, 1,
-0.3730418, 0.5051824, 0.3505276, 1, 1, 1, 1, 1,
-0.3697852, 1.143924, -1.618215, 1, 1, 1, 1, 1,
-0.3692734, -0.6597496, -3.333464, 1, 1, 1, 1, 1,
-0.3683887, 0.8346165, -0.4067178, 1, 1, 1, 1, 1,
-0.3653495, 0.974581, -0.6307395, 0, 0, 1, 1, 1,
-0.3471445, 0.5505732, -0.8839321, 1, 0, 0, 1, 1,
-0.3463815, 0.9254455, -0.5746759, 1, 0, 0, 1, 1,
-0.3463027, -1.440155, -2.077134, 1, 0, 0, 1, 1,
-0.3336484, -1.904852, -3.423041, 1, 0, 0, 1, 1,
-0.3329394, -0.2790492, -2.283536, 1, 0, 0, 1, 1,
-0.3326449, -0.04933923, -1.494023, 0, 0, 0, 1, 1,
-0.3323002, 0.4809262, -0.5980341, 0, 0, 0, 1, 1,
-0.3269314, 2.169501, 0.4163541, 0, 0, 0, 1, 1,
-0.3268466, 1.683421, 0.4626776, 0, 0, 0, 1, 1,
-0.3266538, -0.414837, -3.035111, 0, 0, 0, 1, 1,
-0.3250054, -1.31, -2.872415, 0, 0, 0, 1, 1,
-0.3201613, 0.5707245, 1.099386, 0, 0, 0, 1, 1,
-0.3146456, -1.514998, -3.468105, 1, 1, 1, 1, 1,
-0.3132043, -0.03356843, -1.474901, 1, 1, 1, 1, 1,
-0.3104641, 1.991746, -0.3841917, 1, 1, 1, 1, 1,
-0.2866311, 0.3004163, -1.80626, 1, 1, 1, 1, 1,
-0.285022, -1.72495, -3.366078, 1, 1, 1, 1, 1,
-0.284526, 1.879028, -1.55628, 1, 1, 1, 1, 1,
-0.2845182, -0.09317432, -0.915683, 1, 1, 1, 1, 1,
-0.2781494, 0.2738697, -2.492287, 1, 1, 1, 1, 1,
-0.2770455, -0.5866502, -3.776678, 1, 1, 1, 1, 1,
-0.2759843, -1.060559, -3.221158, 1, 1, 1, 1, 1,
-0.2680004, -0.006924313, -1.709568, 1, 1, 1, 1, 1,
-0.2673241, -0.1345413, -1.439682, 1, 1, 1, 1, 1,
-0.2646179, -0.1923804, -1.5077, 1, 1, 1, 1, 1,
-0.260586, -0.2037646, -2.099081, 1, 1, 1, 1, 1,
-0.2602195, -0.7980341, -5.310578, 1, 1, 1, 1, 1,
-0.2553557, 1.025926, 0.2557203, 0, 0, 1, 1, 1,
-0.2535801, 0.1768116, -1.602857, 1, 0, 0, 1, 1,
-0.2517835, -0.1470162, -1.213856, 1, 0, 0, 1, 1,
-0.2505147, 0.3342479, 0.2504588, 1, 0, 0, 1, 1,
-0.2447748, -0.8984151, -5.127386, 1, 0, 0, 1, 1,
-0.2420657, -1.06228, -3.497812, 1, 0, 0, 1, 1,
-0.237123, -0.08374722, -1.429641, 0, 0, 0, 1, 1,
-0.2350041, -0.4260828, -2.389175, 0, 0, 0, 1, 1,
-0.230269, -0.2434814, -2.883923, 0, 0, 0, 1, 1,
-0.2246484, 0.311621, -1.380777, 0, 0, 0, 1, 1,
-0.2215635, 0.627342, 0.1834159, 0, 0, 0, 1, 1,
-0.2179939, -0.3846052, -4.032518, 0, 0, 0, 1, 1,
-0.2166113, -0.1753712, -1.566408, 0, 0, 0, 1, 1,
-0.2148915, -0.208474, -1.467751, 1, 1, 1, 1, 1,
-0.2109295, -0.9937512, -2.370463, 1, 1, 1, 1, 1,
-0.2082578, 0.3861944, -0.9446817, 1, 1, 1, 1, 1,
-0.2064154, 2.535157, 1.94434, 1, 1, 1, 1, 1,
-0.2015884, 0.9087812, -0.1723146, 1, 1, 1, 1, 1,
-0.1992372, -1.703724, -3.668671, 1, 1, 1, 1, 1,
-0.1956076, 0.3732069, -2.477548, 1, 1, 1, 1, 1,
-0.1944948, 0.4153309, 0.2535813, 1, 1, 1, 1, 1,
-0.1919309, -0.8634987, -3.130697, 1, 1, 1, 1, 1,
-0.1909125, 1.305583, -0.6949738, 1, 1, 1, 1, 1,
-0.1878901, 1.747075, -0.2125684, 1, 1, 1, 1, 1,
-0.1793719, 0.7713411, -0.2945138, 1, 1, 1, 1, 1,
-0.1771704, -0.9582136, -2.610059, 1, 1, 1, 1, 1,
-0.1756919, 0.5926343, 0.792218, 1, 1, 1, 1, 1,
-0.1744329, -0.5986262, -3.467682, 1, 1, 1, 1, 1,
-0.1705289, -0.241165, -1.946905, 0, 0, 1, 1, 1,
-0.168217, -0.7401127, -1.22991, 1, 0, 0, 1, 1,
-0.1672617, -2.224774, -2.825202, 1, 0, 0, 1, 1,
-0.1652212, 1.487938, 0.6639097, 1, 0, 0, 1, 1,
-0.1651811, -1.33998, -3.550563, 1, 0, 0, 1, 1,
-0.1603001, 1.578411, 0.5978743, 1, 0, 0, 1, 1,
-0.1555109, 2.160972, -1.286903, 0, 0, 0, 1, 1,
-0.1548657, -0.1923234, -2.442357, 0, 0, 0, 1, 1,
-0.1546521, -0.8160599, -3.080753, 0, 0, 0, 1, 1,
-0.1538381, 0.3896702, 1.048803, 0, 0, 0, 1, 1,
-0.1531791, -0.9262913, -2.306326, 0, 0, 0, 1, 1,
-0.1457222, 1.615677, 0.5574843, 0, 0, 0, 1, 1,
-0.1456349, -0.303722, -2.909117, 0, 0, 0, 1, 1,
-0.1436309, -1.57005, -3.646942, 1, 1, 1, 1, 1,
-0.1420707, -1.23959, -1.909822, 1, 1, 1, 1, 1,
-0.140478, 1.25212, -1.501225, 1, 1, 1, 1, 1,
-0.1384708, -0.4345496, -2.060202, 1, 1, 1, 1, 1,
-0.1365581, 1.040381, 0.8727375, 1, 1, 1, 1, 1,
-0.135646, 0.808077, -1.410282, 1, 1, 1, 1, 1,
-0.1338835, -0.361757, -1.862446, 1, 1, 1, 1, 1,
-0.1338276, -0.2904117, -1.313639, 1, 1, 1, 1, 1,
-0.1311423, -1.072524, -2.83929, 1, 1, 1, 1, 1,
-0.1288693, -1.864254, -3.417331, 1, 1, 1, 1, 1,
-0.1254272, -0.1816604, -2.375522, 1, 1, 1, 1, 1,
-0.1221884, 0.06808868, 0.0326072, 1, 1, 1, 1, 1,
-0.1221391, -0.8444188, -2.632977, 1, 1, 1, 1, 1,
-0.1218457, -0.7496191, -2.669658, 1, 1, 1, 1, 1,
-0.1206421, -0.07167114, -2.151179, 1, 1, 1, 1, 1,
-0.1172671, 0.9307816, 0.6269759, 0, 0, 1, 1, 1,
-0.1161254, 0.7063514, 1.312028, 1, 0, 0, 1, 1,
-0.1137653, 0.3290655, -1.146404, 1, 0, 0, 1, 1,
-0.110181, -0.7870589, -5.174554, 1, 0, 0, 1, 1,
-0.107944, 0.5465698, 0.4873798, 1, 0, 0, 1, 1,
-0.1077156, -0.06091563, -3.054629, 1, 0, 0, 1, 1,
-0.1038935, 1.121223, -1.560339, 0, 0, 0, 1, 1,
-0.1011957, 0.05671136, -0.498191, 0, 0, 0, 1, 1,
-0.09837835, -0.7430791, -3.049242, 0, 0, 0, 1, 1,
-0.09548327, 2.064208, -0.439997, 0, 0, 0, 1, 1,
-0.09519798, 1.13895, -0.5695086, 0, 0, 0, 1, 1,
-0.09200364, -0.5281007, -2.495645, 0, 0, 0, 1, 1,
-0.09140317, 0.9538381, -1.400034, 0, 0, 0, 1, 1,
-0.09022742, 0.3190314, 1.061401, 1, 1, 1, 1, 1,
-0.08785532, 1.201074, 1.528317, 1, 1, 1, 1, 1,
-0.08182977, 0.4776525, -1.606407, 1, 1, 1, 1, 1,
-0.07663858, 0.8421584, -1.163411, 1, 1, 1, 1, 1,
-0.07380701, 0.8488888, 0.9711677, 1, 1, 1, 1, 1,
-0.06975223, 0.8053038, -1.532702, 1, 1, 1, 1, 1,
-0.06954449, -0.321862, -2.390629, 1, 1, 1, 1, 1,
-0.06454078, -0.4581971, -4.50779, 1, 1, 1, 1, 1,
-0.05654381, 0.6609612, 1.613852, 1, 1, 1, 1, 1,
-0.0552932, 0.2403411, -0.3310061, 1, 1, 1, 1, 1,
-0.05431886, -1.066031, -2.739486, 1, 1, 1, 1, 1,
-0.05375685, -2.097304, -4.324397, 1, 1, 1, 1, 1,
-0.05362789, -1.66624, -1.550476, 1, 1, 1, 1, 1,
-0.05235196, -0.2238312, -0.7600384, 1, 1, 1, 1, 1,
-0.05026571, -1.840542, -3.160669, 1, 1, 1, 1, 1,
-0.04953289, 0.8352231, 0.3076839, 0, 0, 1, 1, 1,
-0.04781962, -1.583956, -3.00053, 1, 0, 0, 1, 1,
-0.04757423, 0.8823762, 0.6408854, 1, 0, 0, 1, 1,
-0.04352348, 0.8418663, 0.5242916, 1, 0, 0, 1, 1,
-0.04139578, -1.584289, -3.702336, 1, 0, 0, 1, 1,
-0.04053191, -1.52547, -5.648848, 1, 0, 0, 1, 1,
-0.03855228, -0.907621, -3.405917, 0, 0, 0, 1, 1,
-0.03833004, -0.3061273, -3.947342, 0, 0, 0, 1, 1,
-0.03636093, 1.043902, -0.1005803, 0, 0, 0, 1, 1,
-0.02998737, -0.9963301, -4.66005, 0, 0, 0, 1, 1,
-0.02766183, 0.01948639, -2.128581, 0, 0, 0, 1, 1,
-0.0211353, -0.100076, -3.461704, 0, 0, 0, 1, 1,
-0.01749313, 0.238287, 0.1700264, 0, 0, 0, 1, 1,
-0.016193, -0.1335533, -1.083584, 1, 1, 1, 1, 1,
-0.01403942, 0.5619971, -0.9456711, 1, 1, 1, 1, 1,
-0.01248574, -1.056915, -3.910921, 1, 1, 1, 1, 1,
-0.01176129, -1.522799, -2.664399, 1, 1, 1, 1, 1,
-0.01119443, 1.179456, -0.7391846, 1, 1, 1, 1, 1,
-0.01062364, -0.2320678, -3.952056, 1, 1, 1, 1, 1,
-0.01007028, 1.858916, 0.6693879, 1, 1, 1, 1, 1,
-0.00743088, -0.8785888, -4.62242, 1, 1, 1, 1, 1,
-0.006535505, -0.3310668, -3.011998, 1, 1, 1, 1, 1,
-0.004533454, -0.01537916, -1.978875, 1, 1, 1, 1, 1,
-0.003943875, -2.596003, -3.656085, 1, 1, 1, 1, 1,
-0.003233327, 0.7827075, -0.02296719, 1, 1, 1, 1, 1,
-0.002412245, 1.31984, 1.173695, 1, 1, 1, 1, 1,
0.003940793, -0.5478227, 5.237098, 1, 1, 1, 1, 1,
0.00589683, 0.9309154, -0.7709658, 1, 1, 1, 1, 1,
0.005968945, 0.2945001, -1.750867, 0, 0, 1, 1, 1,
0.007250051, -0.8818345, 3.880499, 1, 0, 0, 1, 1,
0.01411223, -0.01202264, 0.6988369, 1, 0, 0, 1, 1,
0.01637223, 0.7783199, 1.197669, 1, 0, 0, 1, 1,
0.02776549, 0.3160959, 0.7593241, 1, 0, 0, 1, 1,
0.03307145, 1.661608, 0.9769334, 1, 0, 0, 1, 1,
0.03725566, 0.2299829, -0.5313519, 0, 0, 0, 1, 1,
0.03933351, 0.727269, 1.787515, 0, 0, 0, 1, 1,
0.03950099, -1.514844, 1.137075, 0, 0, 0, 1, 1,
0.04653066, 0.516531, 0.3452071, 0, 0, 0, 1, 1,
0.04674146, 0.5310252, -0.4587789, 0, 0, 0, 1, 1,
0.04883589, 0.2275277, 0.418535, 0, 0, 0, 1, 1,
0.05018495, -0.03236634, 1.093349, 0, 0, 0, 1, 1,
0.05208906, -0.9709733, 0.3899234, 1, 1, 1, 1, 1,
0.05372496, -0.8711255, 2.635523, 1, 1, 1, 1, 1,
0.05382846, 0.2550941, 1.911985, 1, 1, 1, 1, 1,
0.05698791, 0.4434539, 0.9749857, 1, 1, 1, 1, 1,
0.0571712, -1.553345, 2.117233, 1, 1, 1, 1, 1,
0.06257892, -1.642287, 3.277543, 1, 1, 1, 1, 1,
0.06450256, -0.1899255, 2.612347, 1, 1, 1, 1, 1,
0.06729215, 0.7496354, 0.2077244, 1, 1, 1, 1, 1,
0.06921078, 0.1128704, -0.8641773, 1, 1, 1, 1, 1,
0.07828051, 0.2596039, 1.052657, 1, 1, 1, 1, 1,
0.08086164, -0.861689, 2.508375, 1, 1, 1, 1, 1,
0.08118939, -0.5420933, 2.906444, 1, 1, 1, 1, 1,
0.08236517, 0.3383561, -1.120672, 1, 1, 1, 1, 1,
0.08271791, -0.6270244, 3.549977, 1, 1, 1, 1, 1,
0.08677979, -0.4660439, 3.460797, 1, 1, 1, 1, 1,
0.08968913, -1.302222, 3.41497, 0, 0, 1, 1, 1,
0.09027265, 0.3192172, -2.538167, 1, 0, 0, 1, 1,
0.09170962, 0.9896592, -0.07326516, 1, 0, 0, 1, 1,
0.0935252, -1.980964, 4.379182, 1, 0, 0, 1, 1,
0.09393307, 0.4895344, -1.695122, 1, 0, 0, 1, 1,
0.09832264, -0.7610492, 1.59655, 1, 0, 0, 1, 1,
0.1021154, -1.317437, 1.985346, 0, 0, 0, 1, 1,
0.102369, 0.3550672, -1.303373, 0, 0, 0, 1, 1,
0.1040242, -0.7902204, 2.572114, 0, 0, 0, 1, 1,
0.1076493, -1.322811, 3.336553, 0, 0, 0, 1, 1,
0.1085107, -1.4196, 3.202342, 0, 0, 0, 1, 1,
0.1091156, 1.9532, -0.0506068, 0, 0, 0, 1, 1,
0.1114451, 1.725797, -0.3551836, 0, 0, 0, 1, 1,
0.1151436, 1.487604, -1.500454, 1, 1, 1, 1, 1,
0.1180862, 1.494313, -0.4189658, 1, 1, 1, 1, 1,
0.11955, -0.5644045, 2.828865, 1, 1, 1, 1, 1,
0.122239, -0.5568593, 2.939181, 1, 1, 1, 1, 1,
0.1247805, -0.4054385, 3.430076, 1, 1, 1, 1, 1,
0.125242, 1.186769, -0.8751873, 1, 1, 1, 1, 1,
0.1272843, 0.4155448, 0.8226569, 1, 1, 1, 1, 1,
0.134447, 0.2737577, 1.214776, 1, 1, 1, 1, 1,
0.1383055, -0.0006683035, 0.7765534, 1, 1, 1, 1, 1,
0.1410976, 2.167366, -0.5931342, 1, 1, 1, 1, 1,
0.1441219, -0.9984381, 1.753605, 1, 1, 1, 1, 1,
0.1442918, 0.6121374, -0.5629199, 1, 1, 1, 1, 1,
0.1478966, 0.3100633, 1.051936, 1, 1, 1, 1, 1,
0.148008, -0.8262537, 2.802023, 1, 1, 1, 1, 1,
0.1539766, -0.5943446, 2.878201, 1, 1, 1, 1, 1,
0.1584026, -0.9125988, 3.792673, 0, 0, 1, 1, 1,
0.1642413, 0.2499012, 1.157415, 1, 0, 0, 1, 1,
0.1643393, 0.5641537, 0.627395, 1, 0, 0, 1, 1,
0.1673739, 0.04561455, -1.344919, 1, 0, 0, 1, 1,
0.1695672, 0.2706074, -0.349868, 1, 0, 0, 1, 1,
0.1714607, 0.1591365, 1.682175, 1, 0, 0, 1, 1,
0.1752816, -1.557991, 2.749459, 0, 0, 0, 1, 1,
0.1859303, -0.8794665, 1.973027, 0, 0, 0, 1, 1,
0.1874232, 1.583036, 0.6017882, 0, 0, 0, 1, 1,
0.192137, -0.3758586, 0.9096045, 0, 0, 0, 1, 1,
0.1934311, -0.5253993, 1.585681, 0, 0, 0, 1, 1,
0.1937748, 0.4621392, 0.03054316, 0, 0, 0, 1, 1,
0.2007123, -0.01175025, 1.918688, 0, 0, 0, 1, 1,
0.2017655, -1.119371, 3.372219, 1, 1, 1, 1, 1,
0.2022642, 0.292273, 0.8596939, 1, 1, 1, 1, 1,
0.2047555, 1.599427, 0.1857808, 1, 1, 1, 1, 1,
0.2058829, -0.5880299, 1.528052, 1, 1, 1, 1, 1,
0.2095699, -0.7788756, 1.810355, 1, 1, 1, 1, 1,
0.2115845, 0.876962, 0.8192493, 1, 1, 1, 1, 1,
0.212562, 0.04951285, 1.462724, 1, 1, 1, 1, 1,
0.2140175, -2.005657, 2.784642, 1, 1, 1, 1, 1,
0.2164228, 0.05736643, 2.443362, 1, 1, 1, 1, 1,
0.2174978, -0.297942, 1.869298, 1, 1, 1, 1, 1,
0.2191641, 0.2953189, -0.7705064, 1, 1, 1, 1, 1,
0.2200367, -0.07772837, 2.328211, 1, 1, 1, 1, 1,
0.2215323, 0.02038487, 2.376511, 1, 1, 1, 1, 1,
0.2219291, -0.9718666, 1.559207, 1, 1, 1, 1, 1,
0.2241197, 1.071707, -0.1917187, 1, 1, 1, 1, 1,
0.2262734, 0.9014453, -0.9498194, 0, 0, 1, 1, 1,
0.2265874, -0.02484202, 3.427953, 1, 0, 0, 1, 1,
0.2268932, -0.5672504, 2.945971, 1, 0, 0, 1, 1,
0.2270091, -0.04309079, 3.014184, 1, 0, 0, 1, 1,
0.2271879, -0.357117, 2.154749, 1, 0, 0, 1, 1,
0.2273728, -0.396966, 2.060274, 1, 0, 0, 1, 1,
0.2298009, 0.06573866, 3.002691, 0, 0, 0, 1, 1,
0.2346224, 0.9757414, 1.363763, 0, 0, 0, 1, 1,
0.2347979, -0.08159266, 2.304174, 0, 0, 0, 1, 1,
0.2371262, 0.1538936, 1.506783, 0, 0, 0, 1, 1,
0.2377651, -0.161983, 1.677498, 0, 0, 0, 1, 1,
0.2414296, -1.036181, 5.600327, 0, 0, 0, 1, 1,
0.2415271, 0.9212754, -0.05479774, 0, 0, 0, 1, 1,
0.2421591, 0.5296518, -0.7201756, 1, 1, 1, 1, 1,
0.2473237, 1.895285, -0.8043507, 1, 1, 1, 1, 1,
0.2505856, 0.4371115, 0.3733727, 1, 1, 1, 1, 1,
0.2520834, 0.7774214, 0.5142686, 1, 1, 1, 1, 1,
0.2528704, 1.183083, -0.6335132, 1, 1, 1, 1, 1,
0.2560098, 0.2835537, 0.8193645, 1, 1, 1, 1, 1,
0.2564089, -1.439691, 4.00783, 1, 1, 1, 1, 1,
0.2644104, 0.7733408, 0.5850088, 1, 1, 1, 1, 1,
0.2704671, -2.029089, 3.641915, 1, 1, 1, 1, 1,
0.2728401, -1.61148, 2.233047, 1, 1, 1, 1, 1,
0.2735482, 0.06874335, 0.3997069, 1, 1, 1, 1, 1,
0.2775618, 2.1121, 0.1351885, 1, 1, 1, 1, 1,
0.2831994, -0.3342742, 2.146866, 1, 1, 1, 1, 1,
0.2844799, 0.2754636, 2.112809, 1, 1, 1, 1, 1,
0.2899574, -0.2309951, 2.968521, 1, 1, 1, 1, 1,
0.2907307, 2.617465, 0.5564841, 0, 0, 1, 1, 1,
0.2936696, 1.059046, -0.09962799, 1, 0, 0, 1, 1,
0.2963741, 0.7809479, -0.2564904, 1, 0, 0, 1, 1,
0.2988236, -0.9585614, 1.69323, 1, 0, 0, 1, 1,
0.3009683, 1.737985, 2.350769, 1, 0, 0, 1, 1,
0.3026694, -0.6409698, 3.527249, 1, 0, 0, 1, 1,
0.3034822, -0.3935035, 3.263897, 0, 0, 0, 1, 1,
0.3040809, -1.762353, 0.7523845, 0, 0, 0, 1, 1,
0.3093041, 0.3585247, 0.002813181, 0, 0, 0, 1, 1,
0.3123357, 1.519456, -1.48261, 0, 0, 0, 1, 1,
0.3125158, -0.07982545, 1.653742, 0, 0, 0, 1, 1,
0.3131891, 1.008434, 0.923154, 0, 0, 0, 1, 1,
0.3145175, -1.917374, 3.231039, 0, 0, 0, 1, 1,
0.3168048, -2.133957, 1.68898, 1, 1, 1, 1, 1,
0.3218797, -0.8995219, 2.729502, 1, 1, 1, 1, 1,
0.3243974, 0.747712, 0.828757, 1, 1, 1, 1, 1,
0.3255274, -0.8737222, 4.2503, 1, 1, 1, 1, 1,
0.3263567, -1.400243, 2.882117, 1, 1, 1, 1, 1,
0.3286327, -1.645876, 2.923491, 1, 1, 1, 1, 1,
0.3297281, -0.2385041, 2.528291, 1, 1, 1, 1, 1,
0.3330451, -0.02471411, 2.743563, 1, 1, 1, 1, 1,
0.3330814, -0.3511825, 2.956445, 1, 1, 1, 1, 1,
0.3340924, 0.9642811, -0.9131607, 1, 1, 1, 1, 1,
0.3375519, -1.17354, 4.931054, 1, 1, 1, 1, 1,
0.3398333, -0.7674863, 4.469144, 1, 1, 1, 1, 1,
0.3415044, 0.08324067, 2.080262, 1, 1, 1, 1, 1,
0.3420227, 0.0974772, 0.7178472, 1, 1, 1, 1, 1,
0.3427182, 1.470858, 1.794101, 1, 1, 1, 1, 1,
0.3465573, -0.326862, 2.69314, 0, 0, 1, 1, 1,
0.3473302, -0.3835004, 3.119293, 1, 0, 0, 1, 1,
0.3533321, 1.200318, -0.30708, 1, 0, 0, 1, 1,
0.3535363, -1.129068, 1.930996, 1, 0, 0, 1, 1,
0.3537159, -0.7309497, 2.404436, 1, 0, 0, 1, 1,
0.3588672, -0.3988354, 2.984386, 1, 0, 0, 1, 1,
0.3614137, -1.947169, 2.063442, 0, 0, 0, 1, 1,
0.3650819, 1.496675, -0.4433917, 0, 0, 0, 1, 1,
0.3658763, 1.124571, -0.05936748, 0, 0, 0, 1, 1,
0.3661864, -0.447251, 2.177685, 0, 0, 0, 1, 1,
0.3680724, -1.023552, 4.918901, 0, 0, 0, 1, 1,
0.3683141, 0.1613432, 2.718066, 0, 0, 0, 1, 1,
0.3710565, -1.004838, 2.537266, 0, 0, 0, 1, 1,
0.3725237, 0.3864079, 0.5123717, 1, 1, 1, 1, 1,
0.3744888, -0.9108205, 1.497289, 1, 1, 1, 1, 1,
0.3748699, 0.8496132, 0.6219299, 1, 1, 1, 1, 1,
0.3765613, 0.5110764, 0.1427316, 1, 1, 1, 1, 1,
0.3817066, 1.193323, 0.4909156, 1, 1, 1, 1, 1,
0.38376, -1.081356, 2.912244, 1, 1, 1, 1, 1,
0.3854793, 0.3762747, 1.277137, 1, 1, 1, 1, 1,
0.3859914, 0.936008, 2.09325, 1, 1, 1, 1, 1,
0.3896685, 1.500816, 0.346556, 1, 1, 1, 1, 1,
0.3898647, 1.115509, -0.6508161, 1, 1, 1, 1, 1,
0.3963371, -0.1102419, 2.360945, 1, 1, 1, 1, 1,
0.3986921, 1.662322, -1.073974, 1, 1, 1, 1, 1,
0.4048253, 0.749745, 0.005902526, 1, 1, 1, 1, 1,
0.4052702, 0.5268298, 1.401917, 1, 1, 1, 1, 1,
0.4130691, 0.7673771, 0.8164948, 1, 1, 1, 1, 1,
0.4148185, 0.9855491, 1.321892, 0, 0, 1, 1, 1,
0.4186113, -0.06722042, 2.103693, 1, 0, 0, 1, 1,
0.4215222, -0.5049857, 1.363841, 1, 0, 0, 1, 1,
0.4243102, -1.358314, 2.08553, 1, 0, 0, 1, 1,
0.4245971, -0.2793133, 1.434921, 1, 0, 0, 1, 1,
0.425455, 0.3301006, 0.4152707, 1, 0, 0, 1, 1,
0.4349684, -1.076008, 3.174918, 0, 0, 0, 1, 1,
0.4371713, -0.6070052, 2.366254, 0, 0, 0, 1, 1,
0.4374921, -0.4592083, 2.252824, 0, 0, 0, 1, 1,
0.4377662, 0.03342435, 3.370794, 0, 0, 0, 1, 1,
0.4381422, -0.1826442, 1.312506, 0, 0, 0, 1, 1,
0.4413639, -0.7351312, 2.721188, 0, 0, 0, 1, 1,
0.4475684, -1.717683, 2.77397, 0, 0, 0, 1, 1,
0.4486962, -0.4517216, 2.431726, 1, 1, 1, 1, 1,
0.4584435, -0.3557915, 2.451435, 1, 1, 1, 1, 1,
0.4652217, -1.403443, 1.709414, 1, 1, 1, 1, 1,
0.4659481, 0.5236383, -0.3442568, 1, 1, 1, 1, 1,
0.4669506, -1.334499, 2.575164, 1, 1, 1, 1, 1,
0.4684724, -1.418873, 1.675994, 1, 1, 1, 1, 1,
0.4686765, 0.1981978, 0.8162417, 1, 1, 1, 1, 1,
0.4689373, 2.417383, 0.4440163, 1, 1, 1, 1, 1,
0.4689388, 1.487684, 1.89363, 1, 1, 1, 1, 1,
0.4734645, -0.6683332, 1.704934, 1, 1, 1, 1, 1,
0.4754578, -0.3977387, 3.287042, 1, 1, 1, 1, 1,
0.4786543, 0.9310198, -0.9610323, 1, 1, 1, 1, 1,
0.480095, -0.8785014, 3.411738, 1, 1, 1, 1, 1,
0.487611, 0.1290748, 0.1920387, 1, 1, 1, 1, 1,
0.4921965, -1.773307, 4.685934, 1, 1, 1, 1, 1,
0.4966029, 0.5188335, 1.859641, 0, 0, 1, 1, 1,
0.4968974, 1.729071, -0.09469964, 1, 0, 0, 1, 1,
0.4986941, 0.1547491, 0.38654, 1, 0, 0, 1, 1,
0.5010381, 0.9243944, 1.267724, 1, 0, 0, 1, 1,
0.5094776, 0.8198224, 1.877188, 1, 0, 0, 1, 1,
0.5114427, 1.36853, 0.9591181, 1, 0, 0, 1, 1,
0.5115974, -0.2293337, 2.96332, 0, 0, 0, 1, 1,
0.5133817, -0.1058202, 0.3267145, 0, 0, 0, 1, 1,
0.5136034, 1.328165, -2.12053, 0, 0, 0, 1, 1,
0.5150715, 0.01331291, 2.600158, 0, 0, 0, 1, 1,
0.5182548, -0.8160108, 2.799358, 0, 0, 0, 1, 1,
0.5259571, 0.8518326, 2.41755, 0, 0, 0, 1, 1,
0.5274163, -0.4220734, 2.972133, 0, 0, 0, 1, 1,
0.5312563, -1.025887, 3.675157, 1, 1, 1, 1, 1,
0.5329977, -0.2043621, 3.002275, 1, 1, 1, 1, 1,
0.5330949, 0.606595, 1.486073, 1, 1, 1, 1, 1,
0.5339513, -1.178828, 2.455564, 1, 1, 1, 1, 1,
0.5344497, -0.2615375, 1.658441, 1, 1, 1, 1, 1,
0.5362942, -0.5012135, 2.251461, 1, 1, 1, 1, 1,
0.5408648, -0.9385132, 2.105177, 1, 1, 1, 1, 1,
0.5448298, 1.728347, -0.8240995, 1, 1, 1, 1, 1,
0.5483758, -0.5772547, 2.110739, 1, 1, 1, 1, 1,
0.5500514, 1.791222, -0.7222289, 1, 1, 1, 1, 1,
0.5549009, -1.750245, 3.572465, 1, 1, 1, 1, 1,
0.5568852, 0.3726599, -0.2635514, 1, 1, 1, 1, 1,
0.5591288, -1.228318, 2.191157, 1, 1, 1, 1, 1,
0.5592625, -0.198794, 1.818228, 1, 1, 1, 1, 1,
0.5610812, -0.03363075, 2.121324, 1, 1, 1, 1, 1,
0.5670237, -1.332606, 2.299221, 0, 0, 1, 1, 1,
0.5672979, -0.795041, 3.189883, 1, 0, 0, 1, 1,
0.5696393, -0.7581396, 3.44866, 1, 0, 0, 1, 1,
0.573472, 1.980518, 0.4367599, 1, 0, 0, 1, 1,
0.5740702, 0.1110157, 2.001213, 1, 0, 0, 1, 1,
0.5757638, 0.8400192, 0.8918656, 1, 0, 0, 1, 1,
0.5800887, 1.305124, -1.134171, 0, 0, 0, 1, 1,
0.5865448, 0.2997198, 0.6653496, 0, 0, 0, 1, 1,
0.5921494, -1.828184, 3.545632, 0, 0, 0, 1, 1,
0.5940846, 0.5414727, 1.182973, 0, 0, 0, 1, 1,
0.5962674, 0.5825503, 0.4715979, 0, 0, 0, 1, 1,
0.5978435, 0.0223772, 2.142671, 0, 0, 0, 1, 1,
0.5979036, 0.5474308, 0.4871334, 0, 0, 0, 1, 1,
0.6008183, 1.256637, 0.8107156, 1, 1, 1, 1, 1,
0.6018499, 0.4976097, 1.216612, 1, 1, 1, 1, 1,
0.6102303, 0.1892138, 1.776821, 1, 1, 1, 1, 1,
0.6173603, -1.599054, 2.913164, 1, 1, 1, 1, 1,
0.6197841, -1.280897, 2.2611, 1, 1, 1, 1, 1,
0.6210925, 0.2685023, 0.4482171, 1, 1, 1, 1, 1,
0.6239206, 0.5251949, 2.964806, 1, 1, 1, 1, 1,
0.6270224, -0.6879631, 1.272178, 1, 1, 1, 1, 1,
0.6282508, -0.7249393, 1.285748, 1, 1, 1, 1, 1,
0.6295993, -0.6138043, 0.9933932, 1, 1, 1, 1, 1,
0.63082, 0.008568749, 2.991929, 1, 1, 1, 1, 1,
0.6322318, 0.1012315, 1.400281, 1, 1, 1, 1, 1,
0.633462, 1.833897, -2.368928, 1, 1, 1, 1, 1,
0.6440454, -0.9974992, 0.3237656, 1, 1, 1, 1, 1,
0.6493268, 0.9077689, 0.207486, 1, 1, 1, 1, 1,
0.6495153, -0.3114691, 0.4718283, 0, 0, 1, 1, 1,
0.653188, -0.8682009, 1.756678, 1, 0, 0, 1, 1,
0.6551273, -1.223907, 1.192171, 1, 0, 0, 1, 1,
0.6556437, -1.227362, 3.710521, 1, 0, 0, 1, 1,
0.6564521, 0.1933769, 1.525583, 1, 0, 0, 1, 1,
0.664377, -0.9350961, 2.99476, 1, 0, 0, 1, 1,
0.6721964, -0.7802038, 3.088409, 0, 0, 0, 1, 1,
0.6771409, -0.7706112, 1.176257, 0, 0, 0, 1, 1,
0.6774137, -0.753249, 3.99435, 0, 0, 0, 1, 1,
0.678261, 0.04687161, 0.5065255, 0, 0, 0, 1, 1,
0.6831957, 0.4367622, 1.322719, 0, 0, 0, 1, 1,
0.684327, 0.4322911, 2.010795, 0, 0, 0, 1, 1,
0.6856424, -0.6138394, 0.6150736, 0, 0, 0, 1, 1,
0.6897488, 0.9240185, 1.441081, 1, 1, 1, 1, 1,
0.6925461, 1.846439, -0.4885065, 1, 1, 1, 1, 1,
0.7046281, 0.4753442, 0.2376315, 1, 1, 1, 1, 1,
0.7078016, -1.147578, 2.539724, 1, 1, 1, 1, 1,
0.7117632, -0.3538932, 1.634245, 1, 1, 1, 1, 1,
0.7184749, 0.02990126, 1.101131, 1, 1, 1, 1, 1,
0.7190777, 0.008800225, 1.711702, 1, 1, 1, 1, 1,
0.7195035, -0.4474314, -0.1428194, 1, 1, 1, 1, 1,
0.7282737, -0.3325907, 3.212094, 1, 1, 1, 1, 1,
0.7290354, 1.360592, -0.757935, 1, 1, 1, 1, 1,
0.7321383, -0.1523638, 2.845142, 1, 1, 1, 1, 1,
0.7340402, 0.1435884, 0.2145578, 1, 1, 1, 1, 1,
0.7428106, -0.5155808, 2.154815, 1, 1, 1, 1, 1,
0.7430706, 0.449614, 1.276074, 1, 1, 1, 1, 1,
0.7500426, 0.5527219, 0.5497091, 1, 1, 1, 1, 1,
0.7582904, 0.1332848, 2.312233, 0, 0, 1, 1, 1,
0.7849013, 0.5438182, -0.1162603, 1, 0, 0, 1, 1,
0.7894845, 0.09309128, 0.6887156, 1, 0, 0, 1, 1,
0.7914602, 0.2348496, -0.1268411, 1, 0, 0, 1, 1,
0.7919381, 0.7014371, 1.953693, 1, 0, 0, 1, 1,
0.7992727, -0.09762683, 0.464738, 1, 0, 0, 1, 1,
0.8079645, 0.01048542, 0.9254397, 0, 0, 0, 1, 1,
0.8085467, -1.072616, 3.368221, 0, 0, 0, 1, 1,
0.8137165, -0.6819615, 3.986132, 0, 0, 0, 1, 1,
0.8296421, -0.3965706, -0.3106164, 0, 0, 0, 1, 1,
0.8388933, -0.1477987, 2.135012, 0, 0, 0, 1, 1,
0.8510115, 0.4471144, 0.4850508, 0, 0, 0, 1, 1,
0.8669103, -1.453059, 2.383844, 0, 0, 0, 1, 1,
0.8690934, -1.66883, 2.044757, 1, 1, 1, 1, 1,
0.8732443, 1.498172, -0.6345137, 1, 1, 1, 1, 1,
0.8756861, 0.7766895, 1.350433, 1, 1, 1, 1, 1,
0.877931, 1.97559, -0.4113701, 1, 1, 1, 1, 1,
0.8785955, -0.8141776, 1.571273, 1, 1, 1, 1, 1,
0.8794233, 1.363109, -0.1440242, 1, 1, 1, 1, 1,
0.8821039, 0.4383596, 1.826495, 1, 1, 1, 1, 1,
0.8866018, -0.3291708, 2.529827, 1, 1, 1, 1, 1,
0.8909738, -0.6950908, 0.8305178, 1, 1, 1, 1, 1,
0.8968666, -1.711599, 1.91744, 1, 1, 1, 1, 1,
0.9058006, -0.6590647, 0.3213364, 1, 1, 1, 1, 1,
0.9085985, -1.091771, 2.244531, 1, 1, 1, 1, 1,
0.909139, -0.3270522, 2.970978, 1, 1, 1, 1, 1,
0.9097687, 0.1649842, 0.3232316, 1, 1, 1, 1, 1,
0.9119831, -0.1858225, 0.6419554, 1, 1, 1, 1, 1,
0.9216825, -0.1974351, -0.002089072, 0, 0, 1, 1, 1,
0.9219671, 2.643672, -0.143391, 1, 0, 0, 1, 1,
0.9305136, 2.841528, 1.837783, 1, 0, 0, 1, 1,
0.933535, -0.2382785, 1.641751, 1, 0, 0, 1, 1,
0.93467, -0.405761, 0.7010527, 1, 0, 0, 1, 1,
0.9426285, 1.395297, -0.09730699, 1, 0, 0, 1, 1,
0.9455267, 0.249845, 2.128989, 0, 0, 0, 1, 1,
0.948503, -0.3348396, 1.022564, 0, 0, 0, 1, 1,
0.9543364, -0.6023033, 0.965869, 0, 0, 0, 1, 1,
0.9582503, 0.179981, 1.38784, 0, 0, 0, 1, 1,
0.9602119, -2.062682, 3.548012, 0, 0, 0, 1, 1,
0.9621695, -0.3207616, 2.071517, 0, 0, 0, 1, 1,
0.9628803, -0.1551338, 2.481374, 0, 0, 0, 1, 1,
0.9636456, -0.05806417, 2.106875, 1, 1, 1, 1, 1,
0.964308, -0.09048995, 1.706789, 1, 1, 1, 1, 1,
0.9656877, 1.384577, -1.780329, 1, 1, 1, 1, 1,
0.9665533, -0.9060668, 1.467973, 1, 1, 1, 1, 1,
0.9746929, 0.770009, 1.054666, 1, 1, 1, 1, 1,
0.9753409, -0.2427044, 1.19376, 1, 1, 1, 1, 1,
0.9824706, -0.8429169, 2.153342, 1, 1, 1, 1, 1,
0.9840823, 0.4882156, -0.02895847, 1, 1, 1, 1, 1,
0.9861728, 1.246108, 0.5941862, 1, 1, 1, 1, 1,
0.9880907, -1.143667, 2.868283, 1, 1, 1, 1, 1,
0.9901223, -1.495367, 4.492738, 1, 1, 1, 1, 1,
0.9977968, -1.717355, 1.973342, 1, 1, 1, 1, 1,
1.000425, 0.8378767, 1.357462, 1, 1, 1, 1, 1,
1.006099, -0.287612, 2.668191, 1, 1, 1, 1, 1,
1.009174, 0.5737393, -0.7811915, 1, 1, 1, 1, 1,
1.013908, 0.7019415, 1.567146, 0, 0, 1, 1, 1,
1.01792, -1.366219, 2.515569, 1, 0, 0, 1, 1,
1.020654, -1.579066, 2.460658, 1, 0, 0, 1, 1,
1.024543, -0.2630761, 2.386419, 1, 0, 0, 1, 1,
1.027533, 0.648303, 0.9341656, 1, 0, 0, 1, 1,
1.027586, -0.2931738, 1.007008, 1, 0, 0, 1, 1,
1.029178, 0.24473, 1.360153, 0, 0, 0, 1, 1,
1.045597, -0.3047347, 0.4767249, 0, 0, 0, 1, 1,
1.058431, -1.883842, 1.720645, 0, 0, 0, 1, 1,
1.065367, -1.329013, 2.885538, 0, 0, 0, 1, 1,
1.066932, 0.3070525, -0.007599161, 0, 0, 0, 1, 1,
1.067615, 0.44367, 1.203338, 0, 0, 0, 1, 1,
1.07202, 0.7019705, -0.2956512, 0, 0, 0, 1, 1,
1.073346, 0.6882704, 1.026423, 1, 1, 1, 1, 1,
1.075058, -0.2267103, 1.366639, 1, 1, 1, 1, 1,
1.078277, -0.8491523, 2.895051, 1, 1, 1, 1, 1,
1.086903, -2.700826, 2.852787, 1, 1, 1, 1, 1,
1.095483, 0.3655978, 0.2126194, 1, 1, 1, 1, 1,
1.104778, 1.053622, -0.5946785, 1, 1, 1, 1, 1,
1.104818, 1.856932, 0.6201328, 1, 1, 1, 1, 1,
1.105317, -0.5878367, 1.333476, 1, 1, 1, 1, 1,
1.111568, -0.8117875, 1.031672, 1, 1, 1, 1, 1,
1.120564, -0.03647746, 0.3735565, 1, 1, 1, 1, 1,
1.127164, 0.1969845, 1.357048, 1, 1, 1, 1, 1,
1.128551, -0.1740144, 2.378496, 1, 1, 1, 1, 1,
1.136672, 0.5809542, 0.02609024, 1, 1, 1, 1, 1,
1.143043, -0.2518469, 0.1683405, 1, 1, 1, 1, 1,
1.148767, -0.1931145, 2.412256, 1, 1, 1, 1, 1,
1.151425, -0.1799574, 1.772303, 0, 0, 1, 1, 1,
1.152643, -1.812434, 2.600959, 1, 0, 0, 1, 1,
1.16327, 2.503452, -0.2011013, 1, 0, 0, 1, 1,
1.163324, -0.8494048, 3.353666, 1, 0, 0, 1, 1,
1.165962, -2.171988, 3.698343, 1, 0, 0, 1, 1,
1.174171, 1.111472, 2.240947, 1, 0, 0, 1, 1,
1.175244, -0.6175869, 0.9808184, 0, 0, 0, 1, 1,
1.175527, -0.2194726, 2.124035, 0, 0, 0, 1, 1,
1.185712, -0.5879501, 1.99218, 0, 0, 0, 1, 1,
1.188894, 0.2290078, 0.02910275, 0, 0, 0, 1, 1,
1.191476, -0.9723787, 2.803303, 0, 0, 0, 1, 1,
1.208042, -0.2281706, 2.385238, 0, 0, 0, 1, 1,
1.210289, -0.1437366, 1.724993, 0, 0, 0, 1, 1,
1.210612, 0.08548605, 3.024253, 1, 1, 1, 1, 1,
1.223982, -0.6148363, 2.402384, 1, 1, 1, 1, 1,
1.237289, 1.228292, 0.9698214, 1, 1, 1, 1, 1,
1.24157, -0.1632084, 3.152996, 1, 1, 1, 1, 1,
1.244224, -0.1153468, 2.107293, 1, 1, 1, 1, 1,
1.248739, 0.4170542, 1.961842, 1, 1, 1, 1, 1,
1.25704, 0.5057791, -0.1885659, 1, 1, 1, 1, 1,
1.264159, -0.2884453, 0.6931916, 1, 1, 1, 1, 1,
1.265886, 1.637393, 0.1668178, 1, 1, 1, 1, 1,
1.273504, -0.4415821, 3.03696, 1, 1, 1, 1, 1,
1.287758, 0.2647392, 0.8879852, 1, 1, 1, 1, 1,
1.316387, 0.9545978, 0.5946842, 1, 1, 1, 1, 1,
1.324087, 0.5779836, 1.785578, 1, 1, 1, 1, 1,
1.327305, 1.011514, 1.947766, 1, 1, 1, 1, 1,
1.333746, 0.428955, 1.726579, 1, 1, 1, 1, 1,
1.342083, -0.9098518, 1.635785, 0, 0, 1, 1, 1,
1.343358, -0.343486, 0.4104862, 1, 0, 0, 1, 1,
1.346486, -0.5762907, 2.365615, 1, 0, 0, 1, 1,
1.348041, 1.126116, -0.1390155, 1, 0, 0, 1, 1,
1.348952, 0.6786769, 1.53507, 1, 0, 0, 1, 1,
1.354749, -0.08172042, 1.206966, 1, 0, 0, 1, 1,
1.35974, -0.4167145, 3.684516, 0, 0, 0, 1, 1,
1.364392, 0.5196248, 0.6115629, 0, 0, 0, 1, 1,
1.389235, -1.592354, 4.872908, 0, 0, 0, 1, 1,
1.397464, -0.1762459, 1.190772, 0, 0, 0, 1, 1,
1.405101, -0.7287332, 2.641036, 0, 0, 0, 1, 1,
1.425945, -0.2472299, 1.860305, 0, 0, 0, 1, 1,
1.436318, 0.7192853, 1.128227, 0, 0, 0, 1, 1,
1.440336, -0.7600582, 1.71499, 1, 1, 1, 1, 1,
1.440823, -0.8041814, 4.169267, 1, 1, 1, 1, 1,
1.446165, 1.839061, -0.642459, 1, 1, 1, 1, 1,
1.448956, 0.4110478, 2.717279, 1, 1, 1, 1, 1,
1.453938, -0.2253956, 0.8472081, 1, 1, 1, 1, 1,
1.461156, 0.0613171, 1.043011, 1, 1, 1, 1, 1,
1.463789, -1.889332, 2.819219, 1, 1, 1, 1, 1,
1.466249, 1.566199, 1.127179, 1, 1, 1, 1, 1,
1.46857, -0.4240859, 0.799176, 1, 1, 1, 1, 1,
1.470353, -0.5254387, 1.438546, 1, 1, 1, 1, 1,
1.473308, -1.258815, 2.00215, 1, 1, 1, 1, 1,
1.488733, -0.5194201, 1.676637, 1, 1, 1, 1, 1,
1.490715, 0.8601798, -0.05237785, 1, 1, 1, 1, 1,
1.509351, -0.892491, 2.112165, 1, 1, 1, 1, 1,
1.513843, -0.2286757, 1.441202, 1, 1, 1, 1, 1,
1.52152, -1.013074, 2.592049, 0, 0, 1, 1, 1,
1.52486, -1.271627, 3.004519, 1, 0, 0, 1, 1,
1.536193, -0.1619736, 1.161022, 1, 0, 0, 1, 1,
1.538815, 0.536675, 2.037642, 1, 0, 0, 1, 1,
1.550752, -0.02300504, 0.5454769, 1, 0, 0, 1, 1,
1.567716, 0.6168219, 2.877926, 1, 0, 0, 1, 1,
1.582323, 1.215473, 2.552689, 0, 0, 0, 1, 1,
1.619677, -1.851329, 2.205001, 0, 0, 0, 1, 1,
1.625123, 0.4989088, 1.643328, 0, 0, 0, 1, 1,
1.628394, 0.2523607, -0.6115392, 0, 0, 0, 1, 1,
1.628536, -0.05446038, 0.3015354, 0, 0, 0, 1, 1,
1.658711, 1.194552, 0.5942331, 0, 0, 0, 1, 1,
1.71204, 0.4727919, -0.1358457, 0, 0, 0, 1, 1,
1.712269, -0.844041, 1.521872, 1, 1, 1, 1, 1,
1.716803, -1.693885, 1.488938, 1, 1, 1, 1, 1,
1.755228, -1.177424, 1.004589, 1, 1, 1, 1, 1,
1.76033, -1.665168, 3.47604, 1, 1, 1, 1, 1,
1.785104, 1.134351, 0.1433226, 1, 1, 1, 1, 1,
1.796828, -1.779718, 1.422202, 1, 1, 1, 1, 1,
1.83476, 0.2649471, 3.111471, 1, 1, 1, 1, 1,
1.870287, 0.8728215, 2.058835, 1, 1, 1, 1, 1,
1.878751, -0.3540098, 1.096579, 1, 1, 1, 1, 1,
1.880396, 1.58221, 0.8503466, 1, 1, 1, 1, 1,
1.905088, 0.3534142, 1.303138, 1, 1, 1, 1, 1,
1.931812, 0.6168324, 0.7493426, 1, 1, 1, 1, 1,
1.937258, -0.813679, 3.276086, 1, 1, 1, 1, 1,
1.972186, 0.2238102, 1.05354, 1, 1, 1, 1, 1,
1.996075, -0.855196, 3.009166, 1, 1, 1, 1, 1,
1.999802, -1.332603, 2.866478, 0, 0, 1, 1, 1,
2.00199, -0.6741452, 1.667672, 1, 0, 0, 1, 1,
2.061427, 1.431938, -0.9742735, 1, 0, 0, 1, 1,
2.085684, -1.239595, 2.020149, 1, 0, 0, 1, 1,
2.086138, 0.8054157, 0.9184182, 1, 0, 0, 1, 1,
2.094275, -1.019994, 3.377977, 1, 0, 0, 1, 1,
2.098958, -0.2085281, 1.823095, 0, 0, 0, 1, 1,
2.141032, -0.502345, 2.187047, 0, 0, 0, 1, 1,
2.164158, 0.2026996, 0.4851325, 0, 0, 0, 1, 1,
2.184209, 0.3860052, 2.519722, 0, 0, 0, 1, 1,
2.196948, 0.4020243, 0.776881, 0, 0, 0, 1, 1,
2.207243, 0.1213193, 1.388697, 0, 0, 0, 1, 1,
2.237769, 1.33308, 3.026764, 0, 0, 0, 1, 1,
2.245357, 0.1545018, 0.2315751, 1, 1, 1, 1, 1,
2.325907, 0.8974184, 0.2871203, 1, 1, 1, 1, 1,
2.409955, 0.03311365, 1.396828, 1, 1, 1, 1, 1,
2.754729, -0.695203, 0.7461132, 1, 1, 1, 1, 1,
2.849616, 0.7032854, -0.3507352, 1, 1, 1, 1, 1,
3.258536, -1.349713, 1.795162, 1, 1, 1, 1, 1,
4.112746, 0.5742482, 1.742859, 1, 1, 1, 1, 1
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
var radius = 9.859423;
var distance = 34.63081;
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
mvMatrix.translate( -0.3978291, -0.07035089, 0.02426076 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63081);
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
