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
-3.242651, 0.2115556, -3.14257, 1, 0, 0, 1,
-2.956899, 0.206968, 0.7646295, 1, 0.007843138, 0, 1,
-2.921769, 1.03872, -2.131174, 1, 0.01176471, 0, 1,
-2.783571, 1.106942, -2.450579, 1, 0.01960784, 0, 1,
-2.722743, -1.989094, -2.030045, 1, 0.02352941, 0, 1,
-2.694794, 0.06631005, 0.6440555, 1, 0.03137255, 0, 1,
-2.649684, -0.678597, -3.170268, 1, 0.03529412, 0, 1,
-2.514538, -0.4704304, -1.755437, 1, 0.04313726, 0, 1,
-2.413761, -0.3705744, -2.239441, 1, 0.04705882, 0, 1,
-2.291737, 0.4987926, -0.7018437, 1, 0.05490196, 0, 1,
-2.283646, -0.4994588, 0.5106162, 1, 0.05882353, 0, 1,
-2.26387, -1.146165, -1.783802, 1, 0.06666667, 0, 1,
-2.201925, 0.4429536, -0.3423992, 1, 0.07058824, 0, 1,
-2.193076, -0.3012365, -3.113403, 1, 0.07843138, 0, 1,
-2.170511, 0.09966942, -1.208855, 1, 0.08235294, 0, 1,
-2.167608, 1.049804, -0.2580738, 1, 0.09019608, 0, 1,
-2.165502, 0.8282465, 0.5725999, 1, 0.09411765, 0, 1,
-2.158656, 0.2889924, -2.431497, 1, 0.1019608, 0, 1,
-2.153279, -1.488022, -1.853254, 1, 0.1098039, 0, 1,
-2.133857, -2.079062, -2.839644, 1, 0.1137255, 0, 1,
-2.061727, -0.200492, -0.6771132, 1, 0.1215686, 0, 1,
-2.004737, -0.09869351, -1.760897, 1, 0.1254902, 0, 1,
-1.99103, -0.5256125, -2.678097, 1, 0.1333333, 0, 1,
-1.917458, -1.245424, -0.389822, 1, 0.1372549, 0, 1,
-1.916026, -0.8380101, -3.26672, 1, 0.145098, 0, 1,
-1.915954, -0.415348, -0.772597, 1, 0.1490196, 0, 1,
-1.872608, 0.4172372, -2.404746, 1, 0.1568628, 0, 1,
-1.870862, -0.09123538, -0.6792363, 1, 0.1607843, 0, 1,
-1.824354, 0.4608496, -2.824886, 1, 0.1686275, 0, 1,
-1.819763, 0.5993735, -3.103577, 1, 0.172549, 0, 1,
-1.813517, -1.459573, -2.556418, 1, 0.1803922, 0, 1,
-1.794263, -0.7146508, -2.194135, 1, 0.1843137, 0, 1,
-1.78791, 0.737519, -1.388652, 1, 0.1921569, 0, 1,
-1.766296, 0.2834271, -1.984533, 1, 0.1960784, 0, 1,
-1.761312, 0.1138804, -1.242898, 1, 0.2039216, 0, 1,
-1.740132, 1.599476, -2.237317, 1, 0.2117647, 0, 1,
-1.724236, 0.1765996, -1.909548, 1, 0.2156863, 0, 1,
-1.717065, 0.1604752, -1.065314, 1, 0.2235294, 0, 1,
-1.681808, 0.3237264, -0.22548, 1, 0.227451, 0, 1,
-1.671911, -0.7430845, -1.797901, 1, 0.2352941, 0, 1,
-1.643987, 0.3530696, -0.394277, 1, 0.2392157, 0, 1,
-1.643239, 1.402101, 0.4317155, 1, 0.2470588, 0, 1,
-1.636432, -2.525883, -2.433511, 1, 0.2509804, 0, 1,
-1.620948, -0.4473796, -2.866777, 1, 0.2588235, 0, 1,
-1.619202, -2.496027, -2.375068, 1, 0.2627451, 0, 1,
-1.605905, 2.57636, -0.2239181, 1, 0.2705882, 0, 1,
-1.597283, -0.005603193, -1.585774, 1, 0.2745098, 0, 1,
-1.57862, -1.817367, -2.18314, 1, 0.282353, 0, 1,
-1.570754, 0.9184076, -2.062495, 1, 0.2862745, 0, 1,
-1.558847, -0.02977785, -1.499235, 1, 0.2941177, 0, 1,
-1.558458, 0.3153626, -1.620853, 1, 0.3019608, 0, 1,
-1.530416, 1.412292, -0.8053177, 1, 0.3058824, 0, 1,
-1.521312, 1.213591, -0.1567741, 1, 0.3137255, 0, 1,
-1.512478, 1.015486, -1.071708, 1, 0.3176471, 0, 1,
-1.504877, 0.1292411, -2.597242, 1, 0.3254902, 0, 1,
-1.503585, -0.4238624, -3.17039, 1, 0.3294118, 0, 1,
-1.495901, 0.9742627, -0.08735122, 1, 0.3372549, 0, 1,
-1.491962, -1.603906, -1.11043, 1, 0.3411765, 0, 1,
-1.491649, -0.5879177, -0.153546, 1, 0.3490196, 0, 1,
-1.485155, 0.0285152, -2.278203, 1, 0.3529412, 0, 1,
-1.469553, 1.016044, -1.568654, 1, 0.3607843, 0, 1,
-1.461115, -0.4904774, 0.4429724, 1, 0.3647059, 0, 1,
-1.45962, -0.7920943, -2.238034, 1, 0.372549, 0, 1,
-1.458911, -1.304108, -3.170285, 1, 0.3764706, 0, 1,
-1.454722, 1.184228, 0.4869691, 1, 0.3843137, 0, 1,
-1.43635, 0.2900384, -2.984392, 1, 0.3882353, 0, 1,
-1.43442, 1.11024, -1.134224, 1, 0.3960784, 0, 1,
-1.428431, -1.612311, -3.498212, 1, 0.4039216, 0, 1,
-1.425008, -0.2859048, -1.11579, 1, 0.4078431, 0, 1,
-1.421894, 0.3165004, 0.07280941, 1, 0.4156863, 0, 1,
-1.414078, 0.9210033, -2.536459, 1, 0.4196078, 0, 1,
-1.409654, 2.065643, -1.70215, 1, 0.427451, 0, 1,
-1.396693, 0.4646199, -0.04205612, 1, 0.4313726, 0, 1,
-1.389588, 0.4930206, -1.520361, 1, 0.4392157, 0, 1,
-1.386207, 1.614842, -0.444781, 1, 0.4431373, 0, 1,
-1.375379, 0.06103199, -3.534928, 1, 0.4509804, 0, 1,
-1.372976, 0.403877, -1.543784, 1, 0.454902, 0, 1,
-1.369698, 0.4434934, -1.536239, 1, 0.4627451, 0, 1,
-1.365229, -0.03080268, -1.765833, 1, 0.4666667, 0, 1,
-1.36077, 0.6053464, -0.09069552, 1, 0.4745098, 0, 1,
-1.358389, 1.259857, 0.7517347, 1, 0.4784314, 0, 1,
-1.333197, -0.4712662, -0.6332214, 1, 0.4862745, 0, 1,
-1.332783, 0.2444333, -1.837097, 1, 0.4901961, 0, 1,
-1.316578, 0.6148656, -1.541464, 1, 0.4980392, 0, 1,
-1.31272, 1.320543, 0.2493097, 1, 0.5058824, 0, 1,
-1.310055, -0.9594505, -3.507105, 1, 0.509804, 0, 1,
-1.30751, 2.930811, 0.616321, 1, 0.5176471, 0, 1,
-1.306831, -1.468526, -3.232014, 1, 0.5215687, 0, 1,
-1.302734, 0.7064947, -2.902484, 1, 0.5294118, 0, 1,
-1.299112, -1.507428, -4.101471, 1, 0.5333334, 0, 1,
-1.298002, -1.09837, -2.907847, 1, 0.5411765, 0, 1,
-1.296679, -0.9352044, -0.4052952, 1, 0.5450981, 0, 1,
-1.292928, 0.330412, -0.5291929, 1, 0.5529412, 0, 1,
-1.289991, 0.07157636, 1.479153, 1, 0.5568628, 0, 1,
-1.279256, 1.927915, -0.3258175, 1, 0.5647059, 0, 1,
-1.276518, -3.018819, -2.511235, 1, 0.5686275, 0, 1,
-1.271688, -1.026586, -0.930424, 1, 0.5764706, 0, 1,
-1.260288, -0.3380793, -2.065397, 1, 0.5803922, 0, 1,
-1.255211, -0.816909, -2.175471, 1, 0.5882353, 0, 1,
-1.253823, -0.05792911, -0.4553987, 1, 0.5921569, 0, 1,
-1.232049, 0.07662614, -2.004796, 1, 0.6, 0, 1,
-1.231989, 0.04533069, -0.9600347, 1, 0.6078432, 0, 1,
-1.230896, -1.470604, -2.512323, 1, 0.6117647, 0, 1,
-1.223989, -1.0157, -2.468288, 1, 0.6196079, 0, 1,
-1.214081, 0.07384524, -1.473332, 1, 0.6235294, 0, 1,
-1.21021, 1.242647, -0.6799445, 1, 0.6313726, 0, 1,
-1.210177, -0.895204, -3.078555, 1, 0.6352941, 0, 1,
-1.20154, -0.04533818, -0.3239917, 1, 0.6431373, 0, 1,
-1.194522, -0.0489079, -1.586513, 1, 0.6470588, 0, 1,
-1.190176, -0.5855008, -2.801191, 1, 0.654902, 0, 1,
-1.185394, -0.1001575, -2.103515, 1, 0.6588235, 0, 1,
-1.184499, -0.3565897, -2.676496, 1, 0.6666667, 0, 1,
-1.174651, 1.647077, -0.8140433, 1, 0.6705883, 0, 1,
-1.167247, -0.4481051, -2.714386, 1, 0.6784314, 0, 1,
-1.15946, -0.1890175, -0.07599954, 1, 0.682353, 0, 1,
-1.155162, -1.800087, -2.545598, 1, 0.6901961, 0, 1,
-1.152673, -0.5574136, -1.757691, 1, 0.6941177, 0, 1,
-1.150576, 1.025871, -1.242874, 1, 0.7019608, 0, 1,
-1.149672, -0.04504798, -3.04401, 1, 0.7098039, 0, 1,
-1.149094, 0.9305156, -1.500124, 1, 0.7137255, 0, 1,
-1.146227, 0.5370418, -2.115927, 1, 0.7215686, 0, 1,
-1.135208, 0.6833518, -0.1086015, 1, 0.7254902, 0, 1,
-1.135078, -0.6624418, -2.725381, 1, 0.7333333, 0, 1,
-1.132087, -0.9940518, -0.9919621, 1, 0.7372549, 0, 1,
-1.131212, 0.1512939, -1.001837, 1, 0.7450981, 0, 1,
-1.127828, 0.3076714, -0.1112942, 1, 0.7490196, 0, 1,
-1.119999, -0.7491257, -1.406071, 1, 0.7568628, 0, 1,
-1.118676, -1.142833, -2.313161, 1, 0.7607843, 0, 1,
-1.113989, 0.4293419, -0.2402425, 1, 0.7686275, 0, 1,
-1.11353, 0.4303425, 1.413414, 1, 0.772549, 0, 1,
-1.112654, -0.2827954, -3.281291, 1, 0.7803922, 0, 1,
-1.107132, -1.555384, -4.597709, 1, 0.7843137, 0, 1,
-1.103815, -0.3933445, -2.367033, 1, 0.7921569, 0, 1,
-1.102798, 1.380717, -0.8110228, 1, 0.7960784, 0, 1,
-1.097044, 0.6676527, 0.09477311, 1, 0.8039216, 0, 1,
-1.094878, -1.048599, -3.488425, 1, 0.8117647, 0, 1,
-1.094418, 0.1901076, -1.840269, 1, 0.8156863, 0, 1,
-1.091212, 0.07657301, -0.9195169, 1, 0.8235294, 0, 1,
-1.086046, -0.001770094, -1.199223, 1, 0.827451, 0, 1,
-1.08387, -1.018867, -3.319242, 1, 0.8352941, 0, 1,
-1.082658, -0.4768004, -1.616304, 1, 0.8392157, 0, 1,
-1.08188, 0.463744, -0.6320601, 1, 0.8470588, 0, 1,
-1.081371, -0.5182055, -1.420876, 1, 0.8509804, 0, 1,
-1.075473, 0.649891, -0.2819473, 1, 0.8588235, 0, 1,
-1.072838, -1.052994, -1.052432, 1, 0.8627451, 0, 1,
-1.066606, -0.7922295, -0.8379155, 1, 0.8705882, 0, 1,
-1.065877, -0.07872342, -0.437162, 1, 0.8745098, 0, 1,
-1.065503, 0.2102298, -1.089813, 1, 0.8823529, 0, 1,
-1.056396, 0.3298795, 0.01372337, 1, 0.8862745, 0, 1,
-1.053189, -0.3424333, -2.295134, 1, 0.8941177, 0, 1,
-1.048623, 0.3737318, -1.101306, 1, 0.8980392, 0, 1,
-1.034067, 0.2591806, -1.379525, 1, 0.9058824, 0, 1,
-1.032122, -1.266511, -2.918306, 1, 0.9137255, 0, 1,
-1.01283, 1.813368, -1.421422, 1, 0.9176471, 0, 1,
-1.010917, 0.2049937, -2.198779, 1, 0.9254902, 0, 1,
-1.0108, -0.3198237, -1.917048, 1, 0.9294118, 0, 1,
-1.009327, 0.5072639, -0.3055907, 1, 0.9372549, 0, 1,
-0.9959136, 1.225807, 0.001273237, 1, 0.9411765, 0, 1,
-0.995783, 1.179208, -0.4382867, 1, 0.9490196, 0, 1,
-0.9893019, -1.090003, -1.891494, 1, 0.9529412, 0, 1,
-0.9883009, -0.08554529, -4.182714, 1, 0.9607843, 0, 1,
-0.980056, 0.4581986, -0.6810406, 1, 0.9647059, 0, 1,
-0.9783599, -0.5926518, -3.315171, 1, 0.972549, 0, 1,
-0.9705761, -0.7034279, -1.59664, 1, 0.9764706, 0, 1,
-0.966588, -0.5740625, -3.376526, 1, 0.9843137, 0, 1,
-0.9589849, 1.208764, 0.2712236, 1, 0.9882353, 0, 1,
-0.9573171, 0.6686825, -2.292425, 1, 0.9960784, 0, 1,
-0.9559233, -0.09088045, -2.384239, 0.9960784, 1, 0, 1,
-0.9541189, 1.628238, 0.7047595, 0.9921569, 1, 0, 1,
-0.9314075, -0.8145162, -1.737743, 0.9843137, 1, 0, 1,
-0.9286443, 2.5431, 0.6252778, 0.9803922, 1, 0, 1,
-0.9262559, -0.6030753, -1.632206, 0.972549, 1, 0, 1,
-0.9244488, -2.285507, -4.620822, 0.9686275, 1, 0, 1,
-0.9051752, 0.6289213, -0.004024066, 0.9607843, 1, 0, 1,
-0.9025744, 1.822621, 0.2392885, 0.9568627, 1, 0, 1,
-0.8970284, 0.4617935, -0.8367983, 0.9490196, 1, 0, 1,
-0.8941795, 1.101622, 0.2767623, 0.945098, 1, 0, 1,
-0.8908098, 0.5039248, -2.184438, 0.9372549, 1, 0, 1,
-0.8879843, -0.7918327, -2.637288, 0.9333333, 1, 0, 1,
-0.8842848, 0.9743826, 0.3621719, 0.9254902, 1, 0, 1,
-0.8762754, -1.794502, -2.031718, 0.9215686, 1, 0, 1,
-0.8693373, 0.2349263, -1.434852, 0.9137255, 1, 0, 1,
-0.8660571, 0.4418464, -0.323439, 0.9098039, 1, 0, 1,
-0.8626361, 0.5226218, -1.656308, 0.9019608, 1, 0, 1,
-0.8624059, 0.0964229, -0.3002935, 0.8941177, 1, 0, 1,
-0.8559535, -0.1076035, -0.6250594, 0.8901961, 1, 0, 1,
-0.8518065, -0.3372487, -1.612136, 0.8823529, 1, 0, 1,
-0.8505155, 0.7092739, -2.276789, 0.8784314, 1, 0, 1,
-0.8426458, 0.2118533, -1.028253, 0.8705882, 1, 0, 1,
-0.8419647, 0.407667, -2.309484, 0.8666667, 1, 0, 1,
-0.8286999, -0.03092577, -0.9603034, 0.8588235, 1, 0, 1,
-0.8122813, -0.5789264, -1.542815, 0.854902, 1, 0, 1,
-0.8092538, 1.202256, -0.5774663, 0.8470588, 1, 0, 1,
-0.8079094, 0.4491096, -2.446714, 0.8431373, 1, 0, 1,
-0.8072459, -1.753251, -2.259125, 0.8352941, 1, 0, 1,
-0.802174, -0.399725, -2.037489, 0.8313726, 1, 0, 1,
-0.7997802, 1.406488, -0.7391372, 0.8235294, 1, 0, 1,
-0.7931241, 0.01373668, -1.339394, 0.8196079, 1, 0, 1,
-0.7862378, 1.466621, -0.1552139, 0.8117647, 1, 0, 1,
-0.7852681, 0.6188398, -1.625844, 0.8078431, 1, 0, 1,
-0.7834164, 0.107541, -3.991505, 0.8, 1, 0, 1,
-0.7794987, -1.157715, -4.804179, 0.7921569, 1, 0, 1,
-0.7786106, -0.3269747, -2.252414, 0.7882353, 1, 0, 1,
-0.7662882, 0.0446881, -1.341318, 0.7803922, 1, 0, 1,
-0.7622749, 1.95313, 1.564748, 0.7764706, 1, 0, 1,
-0.758303, 1.000241, -1.758187, 0.7686275, 1, 0, 1,
-0.7565606, 1.797483, 0.3414781, 0.7647059, 1, 0, 1,
-0.7565593, 1.270369, -0.6177925, 0.7568628, 1, 0, 1,
-0.7552048, 1.844445, -0.9221721, 0.7529412, 1, 0, 1,
-0.7509458, 1.679338, -2.132731, 0.7450981, 1, 0, 1,
-0.7464147, 0.04777291, -1.520141, 0.7411765, 1, 0, 1,
-0.7436495, 0.5882091, -0.8416798, 0.7333333, 1, 0, 1,
-0.7409028, 0.3849632, -1.187587, 0.7294118, 1, 0, 1,
-0.7406932, 0.4393804, -0.544892, 0.7215686, 1, 0, 1,
-0.7374445, -1.334944, -3.489348, 0.7176471, 1, 0, 1,
-0.7365833, 1.264321, -1.013848, 0.7098039, 1, 0, 1,
-0.7305219, 0.8487287, -0.5981033, 0.7058824, 1, 0, 1,
-0.726373, -1.012578, -1.687875, 0.6980392, 1, 0, 1,
-0.7255358, 0.6183522, -0.5651944, 0.6901961, 1, 0, 1,
-0.7238192, -0.05690549, -2.226981, 0.6862745, 1, 0, 1,
-0.7146741, -0.8795891, -0.5229896, 0.6784314, 1, 0, 1,
-0.7083354, 1.996878, -1.65629, 0.6745098, 1, 0, 1,
-0.7039019, -1.53955, -3.224455, 0.6666667, 1, 0, 1,
-0.7025886, -0.1162087, -0.6900142, 0.6627451, 1, 0, 1,
-0.6952107, -0.7500449, -2.010896, 0.654902, 1, 0, 1,
-0.6927094, 0.3269514, -2.377218, 0.6509804, 1, 0, 1,
-0.6914117, 0.8777023, -0.2278135, 0.6431373, 1, 0, 1,
-0.6906922, -1.491928, -2.903594, 0.6392157, 1, 0, 1,
-0.6898202, 0.02658066, -1.362038, 0.6313726, 1, 0, 1,
-0.6896518, 0.890882, -1.035688, 0.627451, 1, 0, 1,
-0.6891516, -0.4709526, -3.391788, 0.6196079, 1, 0, 1,
-0.6881252, -0.0425874, -0.04730643, 0.6156863, 1, 0, 1,
-0.6870083, -1.000291, -1.926936, 0.6078432, 1, 0, 1,
-0.683253, 1.563496, -0.3020281, 0.6039216, 1, 0, 1,
-0.6758783, 0.9312198, -1.003278, 0.5960785, 1, 0, 1,
-0.6686112, -0.7957749, -2.44284, 0.5882353, 1, 0, 1,
-0.6676199, 0.07492301, -1.979693, 0.5843138, 1, 0, 1,
-0.6666324, -0.1638489, -2.612856, 0.5764706, 1, 0, 1,
-0.6642309, 1.91474, -0.7403867, 0.572549, 1, 0, 1,
-0.6616897, -1.1141, -4.111381, 0.5647059, 1, 0, 1,
-0.6605763, 0.5939004, -0.3738736, 0.5607843, 1, 0, 1,
-0.6552369, 0.1084436, -1.449389, 0.5529412, 1, 0, 1,
-0.6549135, 0.3989612, 0.5187842, 0.5490196, 1, 0, 1,
-0.6535218, -1.185367, -4.677032, 0.5411765, 1, 0, 1,
-0.6516597, 0.02908512, -1.142736, 0.5372549, 1, 0, 1,
-0.6465611, 0.1357149, -0.7726161, 0.5294118, 1, 0, 1,
-0.6462588, -0.1357798, -1.912721, 0.5254902, 1, 0, 1,
-0.6455213, -0.05873393, -1.577821, 0.5176471, 1, 0, 1,
-0.6440747, -0.556544, -0.2302475, 0.5137255, 1, 0, 1,
-0.6435612, 1.091576, -0.273325, 0.5058824, 1, 0, 1,
-0.6435564, 0.8647007, -1.692764, 0.5019608, 1, 0, 1,
-0.6237686, -0.1735063, -1.815663, 0.4941176, 1, 0, 1,
-0.6209847, 1.621402, -1.600715, 0.4862745, 1, 0, 1,
-0.6180902, 1.02644, -0.4584118, 0.4823529, 1, 0, 1,
-0.6155646, -0.2133019, -0.4678548, 0.4745098, 1, 0, 1,
-0.6151825, -1.282902, -5.232635, 0.4705882, 1, 0, 1,
-0.6135991, 0.8914934, 0.4597557, 0.4627451, 1, 0, 1,
-0.6111237, 0.6145011, -0.6312762, 0.4588235, 1, 0, 1,
-0.6069819, 0.06116142, -1.491186, 0.4509804, 1, 0, 1,
-0.6056376, 1.550088, -2.093109, 0.4470588, 1, 0, 1,
-0.6037284, -0.9719141, -2.04233, 0.4392157, 1, 0, 1,
-0.6029467, 0.1591435, 0.6908705, 0.4352941, 1, 0, 1,
-0.6019985, -0.2075658, -2.303715, 0.427451, 1, 0, 1,
-0.5998511, -1.688411, -3.751955, 0.4235294, 1, 0, 1,
-0.5985878, 0.8092255, 0.8006319, 0.4156863, 1, 0, 1,
-0.5981047, 1.24481, 0.8628022, 0.4117647, 1, 0, 1,
-0.5978153, -1.980119, -3.209578, 0.4039216, 1, 0, 1,
-0.5974712, 0.1517174, 0.9782368, 0.3960784, 1, 0, 1,
-0.5913714, 0.2094101, -2.221801, 0.3921569, 1, 0, 1,
-0.5864952, 1.868909, -0.365211, 0.3843137, 1, 0, 1,
-0.584433, -0.04750428, -2.071448, 0.3803922, 1, 0, 1,
-0.5689997, 2.036083, -2.199786, 0.372549, 1, 0, 1,
-0.5683501, 0.5037493, -0.2363514, 0.3686275, 1, 0, 1,
-0.567508, 1.456992, -0.3545981, 0.3607843, 1, 0, 1,
-0.566565, 0.4852493, -1.182655, 0.3568628, 1, 0, 1,
-0.5665103, -0.8533509, -1.808419, 0.3490196, 1, 0, 1,
-0.5564046, 0.4175774, -0.5387226, 0.345098, 1, 0, 1,
-0.5541947, 0.8137257, 0.1421855, 0.3372549, 1, 0, 1,
-0.5541191, 1.20819, 0.4006326, 0.3333333, 1, 0, 1,
-0.5511648, 2.157604, 1.268519, 0.3254902, 1, 0, 1,
-0.5418551, 1.1119, 0.5455343, 0.3215686, 1, 0, 1,
-0.5330694, 0.001056469, -0.7570724, 0.3137255, 1, 0, 1,
-0.5316242, 0.8334734, -0.5995601, 0.3098039, 1, 0, 1,
-0.5313461, -1.070487, -1.417413, 0.3019608, 1, 0, 1,
-0.5257846, 1.089927, 0.3328781, 0.2941177, 1, 0, 1,
-0.523042, 1.141981, 1.156815, 0.2901961, 1, 0, 1,
-0.5230303, -1.488891, -2.178482, 0.282353, 1, 0, 1,
-0.5202774, -0.6329467, -1.700531, 0.2784314, 1, 0, 1,
-0.5195482, -0.09481685, -2.534814, 0.2705882, 1, 0, 1,
-0.5170618, -0.3695121, -0.8479584, 0.2666667, 1, 0, 1,
-0.5163161, -0.6863292, -1.25133, 0.2588235, 1, 0, 1,
-0.513111, -1.630523, -4.104629, 0.254902, 1, 0, 1,
-0.5106125, -0.4490418, -1.705299, 0.2470588, 1, 0, 1,
-0.5098416, 1.277516, -1.447788, 0.2431373, 1, 0, 1,
-0.5090934, -0.04782199, -1.686708, 0.2352941, 1, 0, 1,
-0.5070396, 0.1250444, -0.6260775, 0.2313726, 1, 0, 1,
-0.5058377, -0.4659503, -3.037778, 0.2235294, 1, 0, 1,
-0.4978455, -1.395863, -3.38692, 0.2196078, 1, 0, 1,
-0.4925085, 0.5364392, -0.366435, 0.2117647, 1, 0, 1,
-0.4899373, 1.609733, 0.4735322, 0.2078431, 1, 0, 1,
-0.4853896, 0.008416051, -1.449842, 0.2, 1, 0, 1,
-0.4845585, -0.9470187, -1.498657, 0.1921569, 1, 0, 1,
-0.4797767, -0.8815234, -1.465062, 0.1882353, 1, 0, 1,
-0.4788264, -0.2305599, -1.034007, 0.1803922, 1, 0, 1,
-0.4780959, 1.222437, 0.2198201, 0.1764706, 1, 0, 1,
-0.4738325, 0.2788501, -1.059736, 0.1686275, 1, 0, 1,
-0.4736845, -0.8769909, -1.510056, 0.1647059, 1, 0, 1,
-0.4732936, -0.07375588, -1.873765, 0.1568628, 1, 0, 1,
-0.4715573, -0.1103855, -0.1764514, 0.1529412, 1, 0, 1,
-0.4694539, -2.041649, -3.525536, 0.145098, 1, 0, 1,
-0.4639573, 0.8587147, -1.480059, 0.1411765, 1, 0, 1,
-0.4623284, -0.2376334, -0.4546564, 0.1333333, 1, 0, 1,
-0.4549662, -1.45922, -4.177737, 0.1294118, 1, 0, 1,
-0.4546176, 0.1497376, -1.295715, 0.1215686, 1, 0, 1,
-0.4499573, -1.970961, -3.706277, 0.1176471, 1, 0, 1,
-0.4476794, -0.3664385, -2.124029, 0.1098039, 1, 0, 1,
-0.4469247, 0.9134058, 0.5072072, 0.1058824, 1, 0, 1,
-0.4383633, -0.2761327, -2.716829, 0.09803922, 1, 0, 1,
-0.438287, -0.2143839, -0.451901, 0.09019608, 1, 0, 1,
-0.435323, 0.8208889, 0.6032252, 0.08627451, 1, 0, 1,
-0.4346444, 0.1034484, -0.7125317, 0.07843138, 1, 0, 1,
-0.4333167, 0.4266183, -0.3583502, 0.07450981, 1, 0, 1,
-0.4328386, -0.3286563, -2.388234, 0.06666667, 1, 0, 1,
-0.4302215, -0.3458798, -2.014692, 0.0627451, 1, 0, 1,
-0.424218, -1.034008, -1.357422, 0.05490196, 1, 0, 1,
-0.4240311, -0.5354989, -2.104343, 0.05098039, 1, 0, 1,
-0.4184101, -1.098935, -3.924792, 0.04313726, 1, 0, 1,
-0.4175865, 1.192544, -2.803689, 0.03921569, 1, 0, 1,
-0.4157583, 0.8812685, 0.1412983, 0.03137255, 1, 0, 1,
-0.4094487, 1.518826, -0.5984665, 0.02745098, 1, 0, 1,
-0.4087389, 0.4797877, 0.1139697, 0.01960784, 1, 0, 1,
-0.3997895, -0.2326944, -1.83107, 0.01568628, 1, 0, 1,
-0.3961924, -0.8734598, -1.648316, 0.007843138, 1, 0, 1,
-0.3961539, -1.104545, -3.415312, 0.003921569, 1, 0, 1,
-0.3941623, 0.6497761, -1.830546, 0, 1, 0.003921569, 1,
-0.3898657, 1.542687, 1.095358, 0, 1, 0.01176471, 1,
-0.385792, 1.433742, -1.822666, 0, 1, 0.01568628, 1,
-0.3848749, 1.651723, -0.04249444, 0, 1, 0.02352941, 1,
-0.3796472, 1.839822, -1.609539, 0, 1, 0.02745098, 1,
-0.378119, 0.4962476, -0.9242749, 0, 1, 0.03529412, 1,
-0.3759341, 0.1741608, 0.3602986, 0, 1, 0.03921569, 1,
-0.3753507, -1.071743, -3.14625, 0, 1, 0.04705882, 1,
-0.3752278, 0.2127011, 0.1305657, 0, 1, 0.05098039, 1,
-0.3740876, 1.217549, -0.6456277, 0, 1, 0.05882353, 1,
-0.3725152, 0.3343076, -1.277981, 0, 1, 0.0627451, 1,
-0.3721755, 0.4043913, 0.1229418, 0, 1, 0.07058824, 1,
-0.3699001, -0.1583404, -0.8024666, 0, 1, 0.07450981, 1,
-0.3697709, -1.816671, -3.658867, 0, 1, 0.08235294, 1,
-0.3674025, 0.09264654, -2.39203, 0, 1, 0.08627451, 1,
-0.3639332, -1.265333, -2.964494, 0, 1, 0.09411765, 1,
-0.3637554, -0.007220165, -0.637929, 0, 1, 0.1019608, 1,
-0.363161, 1.162313, 0.4959588, 0, 1, 0.1058824, 1,
-0.3610864, -0.1280818, -1.630346, 0, 1, 0.1137255, 1,
-0.3581605, 1.185246, -0.6254811, 0, 1, 0.1176471, 1,
-0.3576102, -0.4594063, -1.847553, 0, 1, 0.1254902, 1,
-0.3562891, -1.088734, -2.677646, 0, 1, 0.1294118, 1,
-0.3556173, 1.892318, 0.3189812, 0, 1, 0.1372549, 1,
-0.3554177, 0.02705942, -1.137304, 0, 1, 0.1411765, 1,
-0.3518829, -0.1411188, -2.105139, 0, 1, 0.1490196, 1,
-0.3482156, -0.3682316, -2.166061, 0, 1, 0.1529412, 1,
-0.3452837, -0.903018, -1.4283, 0, 1, 0.1607843, 1,
-0.3440054, -0.3855205, -2.526691, 0, 1, 0.1647059, 1,
-0.3409221, 0.4415278, -1.144741, 0, 1, 0.172549, 1,
-0.338499, 0.5389308, 0.801114, 0, 1, 0.1764706, 1,
-0.3383651, 0.2299879, 0.2069637, 0, 1, 0.1843137, 1,
-0.338353, -1.191071, -3.828672, 0, 1, 0.1882353, 1,
-0.3329865, 0.6401547, -1.236396, 0, 1, 0.1960784, 1,
-0.3317351, -1.034764, -2.340999, 0, 1, 0.2039216, 1,
-0.3316578, -1.323226, -3.759496, 0, 1, 0.2078431, 1,
-0.3305412, -2.024918, -2.178098, 0, 1, 0.2156863, 1,
-0.3292458, -2.638941, -4.118709, 0, 1, 0.2196078, 1,
-0.3284605, -0.5886955, -2.575948, 0, 1, 0.227451, 1,
-0.3251038, -0.3744219, -2.129191, 0, 1, 0.2313726, 1,
-0.323592, -1.120714, -3.274468, 0, 1, 0.2392157, 1,
-0.3231204, -0.8012511, -2.437157, 0, 1, 0.2431373, 1,
-0.3212078, 0.1048507, -0.1637061, 0, 1, 0.2509804, 1,
-0.3191923, -1.097979, -0.8307139, 0, 1, 0.254902, 1,
-0.3171948, -1.417465, -2.122275, 0, 1, 0.2627451, 1,
-0.3153045, 0.85071, -0.4626412, 0, 1, 0.2666667, 1,
-0.3129598, 0.7425591, 0.3095659, 0, 1, 0.2745098, 1,
-0.3094924, -1.308166, -3.096319, 0, 1, 0.2784314, 1,
-0.3075007, 0.2575074, -0.1980628, 0, 1, 0.2862745, 1,
-0.3007733, 0.6557229, 0.1267814, 0, 1, 0.2901961, 1,
-0.2984044, 0.4520842, -1.049044, 0, 1, 0.2980392, 1,
-0.2983381, 0.3386507, -1.722628, 0, 1, 0.3058824, 1,
-0.2979201, -0.2705067, -2.564348, 0, 1, 0.3098039, 1,
-0.2938984, -0.7617137, -3.117875, 0, 1, 0.3176471, 1,
-0.291636, 1.268134, -0.6870196, 0, 1, 0.3215686, 1,
-0.2894644, -0.3229163, -3.849667, 0, 1, 0.3294118, 1,
-0.2885891, 0.7155889, -0.01242587, 0, 1, 0.3333333, 1,
-0.286388, 0.1393616, -0.828186, 0, 1, 0.3411765, 1,
-0.2841113, 0.4957977, -0.9703062, 0, 1, 0.345098, 1,
-0.2798255, 0.07583301, -0.1928669, 0, 1, 0.3529412, 1,
-0.2790268, -0.5598841, -2.998022, 0, 1, 0.3568628, 1,
-0.2769912, 1.166586, -1.030813, 0, 1, 0.3647059, 1,
-0.2758112, 1.415663, -1.536817, 0, 1, 0.3686275, 1,
-0.2704962, 0.0800079, -1.790724, 0, 1, 0.3764706, 1,
-0.2702112, -0.1966356, -2.349744, 0, 1, 0.3803922, 1,
-0.2634309, 0.8440058, -1.459095, 0, 1, 0.3882353, 1,
-0.2620053, 0.9185264, -0.139968, 0, 1, 0.3921569, 1,
-0.2580452, 0.6514818, -0.3545684, 0, 1, 0.4, 1,
-0.2549143, 0.4915763, 1.066089, 0, 1, 0.4078431, 1,
-0.2506401, -0.1466337, -2.599631, 0, 1, 0.4117647, 1,
-0.2439133, 0.7340268, 1.634221, 0, 1, 0.4196078, 1,
-0.2438645, 1.15247, 0.3969943, 0, 1, 0.4235294, 1,
-0.2390329, -0.103463, -3.188606, 0, 1, 0.4313726, 1,
-0.2357055, -0.498002, -0.8250403, 0, 1, 0.4352941, 1,
-0.2323816, 0.2560774, -0.8743072, 0, 1, 0.4431373, 1,
-0.2143873, 1.431102, -0.3255254, 0, 1, 0.4470588, 1,
-0.2141355, 0.2297134, 0.4659859, 0, 1, 0.454902, 1,
-0.2121729, 0.5832558, -1.867228, 0, 1, 0.4588235, 1,
-0.2104418, 1.350535, -1.639154, 0, 1, 0.4666667, 1,
-0.2035645, -0.05269799, -0.5928553, 0, 1, 0.4705882, 1,
-0.2033814, 1.019848, 0.5175631, 0, 1, 0.4784314, 1,
-0.1973278, -0.4656148, -2.00631, 0, 1, 0.4823529, 1,
-0.1937956, 1.259647, -1.925779, 0, 1, 0.4901961, 1,
-0.1935809, -1.752394, -2.453377, 0, 1, 0.4941176, 1,
-0.1922497, -2.237285, -3.929487, 0, 1, 0.5019608, 1,
-0.1870171, -0.2698221, -2.872877, 0, 1, 0.509804, 1,
-0.1867386, 2.4945, -1.368187, 0, 1, 0.5137255, 1,
-0.1859816, 1.379999, -0.223703, 0, 1, 0.5215687, 1,
-0.1812635, -0.7154831, -2.607704, 0, 1, 0.5254902, 1,
-0.1787746, 1.405278, -0.2863317, 0, 1, 0.5333334, 1,
-0.176459, 0.3163681, 1.161201, 0, 1, 0.5372549, 1,
-0.1737591, 0.2912378, -0.9365571, 0, 1, 0.5450981, 1,
-0.1710123, 1.036577, 1.851951, 0, 1, 0.5490196, 1,
-0.1669328, -0.4349812, -3.398456, 0, 1, 0.5568628, 1,
-0.1566368, 0.2183879, -0.1315205, 0, 1, 0.5607843, 1,
-0.1515596, -0.303835, -1.755762, 0, 1, 0.5686275, 1,
-0.1507165, 0.8120512, -1.148494, 0, 1, 0.572549, 1,
-0.1458146, -0.5304812, -2.803436, 0, 1, 0.5803922, 1,
-0.1455601, 0.7341406, 0.4012665, 0, 1, 0.5843138, 1,
-0.1452577, 0.5303566, -0.1062525, 0, 1, 0.5921569, 1,
-0.1440186, -0.120267, -2.727689, 0, 1, 0.5960785, 1,
-0.1424743, -0.2365246, -1.3293, 0, 1, 0.6039216, 1,
-0.1421358, -0.5752799, -3.341444, 0, 1, 0.6117647, 1,
-0.1401403, -0.2754031, -3.329141, 0, 1, 0.6156863, 1,
-0.1330913, 0.05806662, -1.762932, 0, 1, 0.6235294, 1,
-0.1315246, -0.2614885, -1.307102, 0, 1, 0.627451, 1,
-0.1299645, 1.735464, 0.133304, 0, 1, 0.6352941, 1,
-0.1287785, 0.002264201, -1.745999, 0, 1, 0.6392157, 1,
-0.1278389, 0.2188395, -0.0896593, 0, 1, 0.6470588, 1,
-0.1269475, 0.5489299, -0.1903311, 0, 1, 0.6509804, 1,
-0.1257774, 0.4925122, 0.2743069, 0, 1, 0.6588235, 1,
-0.1251953, -0.4130844, -2.956973, 0, 1, 0.6627451, 1,
-0.1251411, -0.4876831, -2.161808, 0, 1, 0.6705883, 1,
-0.1237374, -0.2025378, -3.343231, 0, 1, 0.6745098, 1,
-0.1229652, 0.2355315, 0.5720362, 0, 1, 0.682353, 1,
-0.1218505, 1.836305, -0.26086, 0, 1, 0.6862745, 1,
-0.1205048, -0.9574879, -2.329758, 0, 1, 0.6941177, 1,
-0.1194618, 1.903669, 1.150676, 0, 1, 0.7019608, 1,
-0.1150217, 0.3146769, 0.4764121, 0, 1, 0.7058824, 1,
-0.1146258, -0.7458543, -3.067851, 0, 1, 0.7137255, 1,
-0.1134551, 1.988564, -0.2738276, 0, 1, 0.7176471, 1,
-0.1113044, 1.86755, 0.9654888, 0, 1, 0.7254902, 1,
-0.1101494, 1.629308, 0.2990514, 0, 1, 0.7294118, 1,
-0.1068278, -0.3528566, -2.916761, 0, 1, 0.7372549, 1,
-0.1064151, 1.507329, 0.0002256714, 0, 1, 0.7411765, 1,
-0.104948, 0.6832763, -0.2465417, 0, 1, 0.7490196, 1,
-0.1032976, 2.080057, 0.07442585, 0, 1, 0.7529412, 1,
-0.1032543, 0.8821945, 0.2830828, 0, 1, 0.7607843, 1,
-0.1031519, 1.359884, -0.5301489, 0, 1, 0.7647059, 1,
-0.09816948, 0.3092748, -2.070481, 0, 1, 0.772549, 1,
-0.08977222, -0.3448764, -1.892391, 0, 1, 0.7764706, 1,
-0.0879905, 0.8391747, 0.702894, 0, 1, 0.7843137, 1,
-0.08369735, 0.371283, 1.25278, 0, 1, 0.7882353, 1,
-0.07534607, -0.3401611, -3.773208, 0, 1, 0.7960784, 1,
-0.0719028, 0.2959142, 1.031897, 0, 1, 0.8039216, 1,
-0.0702387, -0.02974968, -1.043362, 0, 1, 0.8078431, 1,
-0.07020827, -1.414016, -2.630753, 0, 1, 0.8156863, 1,
-0.06915007, -0.7586535, -2.610837, 0, 1, 0.8196079, 1,
-0.06316038, -0.7212873, -4.64889, 0, 1, 0.827451, 1,
-0.06091089, 0.9301325, -0.8979656, 0, 1, 0.8313726, 1,
-0.05756512, 0.3484557, 1.82124, 0, 1, 0.8392157, 1,
-0.05723326, 0.04058171, -0.7403144, 0, 1, 0.8431373, 1,
-0.05693721, 0.397789, 0.4700887, 0, 1, 0.8509804, 1,
-0.05608294, 1.547693, 1.962679, 0, 1, 0.854902, 1,
-0.0528776, 1.34366, -0.4933413, 0, 1, 0.8627451, 1,
-0.05001946, 0.3863632, -0.7690148, 0, 1, 0.8666667, 1,
-0.03571368, 2.025392, 1.191179, 0, 1, 0.8745098, 1,
-0.03554831, -0.4939522, -2.095601, 0, 1, 0.8784314, 1,
-0.03142716, -0.5460002, -2.540018, 0, 1, 0.8862745, 1,
-0.02846298, 0.03529499, -1.297078, 0, 1, 0.8901961, 1,
-0.02310705, 0.4345535, 0.397562, 0, 1, 0.8980392, 1,
-0.0210694, 0.7548962, 0.08004224, 0, 1, 0.9058824, 1,
-0.01940988, -0.632238, -3.092591, 0, 1, 0.9098039, 1,
-0.01694417, 1.100475, -1.102218, 0, 1, 0.9176471, 1,
-0.01452603, -0.8755271, -2.130871, 0, 1, 0.9215686, 1,
-0.009179919, 1.195482, -0.748515, 0, 1, 0.9294118, 1,
-0.007563564, 1.39285, -0.2961131, 0, 1, 0.9333333, 1,
-0.004073843, 0.1180732, -0.6493247, 0, 1, 0.9411765, 1,
0.002718204, 1.764753, 0.7682225, 0, 1, 0.945098, 1,
0.003754671, -0.04018206, 3.233172, 0, 1, 0.9529412, 1,
0.006518537, 0.3864463, 2.176826, 0, 1, 0.9568627, 1,
0.008201938, 0.2312339, 0.1369744, 0, 1, 0.9647059, 1,
0.01161951, -0.8550115, 4.407543, 0, 1, 0.9686275, 1,
0.01187847, -1.030219, 3.767309, 0, 1, 0.9764706, 1,
0.01558665, 0.04140893, 1.748971, 0, 1, 0.9803922, 1,
0.01738691, -1.187055, 3.317165, 0, 1, 0.9882353, 1,
0.02285126, 1.358425, -0.3474422, 0, 1, 0.9921569, 1,
0.0230942, -0.5169681, 3.305768, 0, 1, 1, 1,
0.02483192, 0.5812792, 1.425454, 0, 0.9921569, 1, 1,
0.0258904, -0.8756498, 4.149992, 0, 0.9882353, 1, 1,
0.03030477, -0.1291423, 3.556424, 0, 0.9803922, 1, 1,
0.03051421, 1.363434, 0.7639142, 0, 0.9764706, 1, 1,
0.03114399, -0.8187769, 1.062417, 0, 0.9686275, 1, 1,
0.03175397, 0.05070927, 0.1864755, 0, 0.9647059, 1, 1,
0.03429144, 1.36748, 0.09425854, 0, 0.9568627, 1, 1,
0.03547679, 0.4960187, -1.368524, 0, 0.9529412, 1, 1,
0.03990427, 0.9522299, 0.7776031, 0, 0.945098, 1, 1,
0.04610687, -0.3099819, 1.704904, 0, 0.9411765, 1, 1,
0.04659383, -1.241542, 4.701041, 0, 0.9333333, 1, 1,
0.05148439, -2.079249, 4.648875, 0, 0.9294118, 1, 1,
0.05384901, 0.5392364, -0.06587768, 0, 0.9215686, 1, 1,
0.05528351, 0.4802181, 0.8559203, 0, 0.9176471, 1, 1,
0.05654611, 0.6595365, -0.1615786, 0, 0.9098039, 1, 1,
0.05694357, -1.379192, 2.774965, 0, 0.9058824, 1, 1,
0.06064915, -0.956534, 2.187412, 0, 0.8980392, 1, 1,
0.06114411, 0.6748544, 0.2725094, 0, 0.8901961, 1, 1,
0.06574056, 1.354948, 0.07884475, 0, 0.8862745, 1, 1,
0.06743807, 1.150283, -0.4337625, 0, 0.8784314, 1, 1,
0.07039276, 0.07972801, 1.27673, 0, 0.8745098, 1, 1,
0.07099713, 0.4566716, -0.454996, 0, 0.8666667, 1, 1,
0.07538068, -0.1450193, 1.915684, 0, 0.8627451, 1, 1,
0.08251987, -0.8538009, 3.516217, 0, 0.854902, 1, 1,
0.08301944, 0.6660323, 1.115917, 0, 0.8509804, 1, 1,
0.08531243, 0.8340834, -0.5519294, 0, 0.8431373, 1, 1,
0.08666772, 1.318137, 2.506923, 0, 0.8392157, 1, 1,
0.08672465, 0.736734, -0.7277122, 0, 0.8313726, 1, 1,
0.08721287, 2.291653, -0.1060463, 0, 0.827451, 1, 1,
0.09223623, -0.7591942, 2.265387, 0, 0.8196079, 1, 1,
0.09402491, -0.3796425, 1.666329, 0, 0.8156863, 1, 1,
0.09602484, -1.660384, 4.167681, 0, 0.8078431, 1, 1,
0.1035874, 1.368737, 0.4406776, 0, 0.8039216, 1, 1,
0.1052318, 1.421114, 0.6350845, 0, 0.7960784, 1, 1,
0.1096004, 0.2300218, 0.6244817, 0, 0.7882353, 1, 1,
0.1098545, 0.3086644, 2.351858, 0, 0.7843137, 1, 1,
0.11223, -0.9734935, 2.88021, 0, 0.7764706, 1, 1,
0.1127183, -0.431272, 4.333065, 0, 0.772549, 1, 1,
0.1150991, -0.3190867, 1.984558, 0, 0.7647059, 1, 1,
0.1208996, -0.7116135, 3.106769, 0, 0.7607843, 1, 1,
0.1214871, -1.750186, 3.829697, 0, 0.7529412, 1, 1,
0.1215239, 1.423923, -0.3453984, 0, 0.7490196, 1, 1,
0.125275, -0.02554899, 0.6362605, 0, 0.7411765, 1, 1,
0.1264218, 0.443012, 0.9834767, 0, 0.7372549, 1, 1,
0.1332908, 1.368564, 1.850932, 0, 0.7294118, 1, 1,
0.1341012, -0.2662094, 3.306656, 0, 0.7254902, 1, 1,
0.1379559, -1.838022, 2.511309, 0, 0.7176471, 1, 1,
0.1380927, -0.06540231, 2.704452, 0, 0.7137255, 1, 1,
0.140487, -0.6439933, 1.920628, 0, 0.7058824, 1, 1,
0.1415278, -0.9995651, 2.6696, 0, 0.6980392, 1, 1,
0.1466149, -0.4210038, 1.838874, 0, 0.6941177, 1, 1,
0.1528207, -0.09937904, 0.5924593, 0, 0.6862745, 1, 1,
0.1548277, 2.101591, -0.04182165, 0, 0.682353, 1, 1,
0.1575611, 1.884625, 0.4749053, 0, 0.6745098, 1, 1,
0.1576092, -0.1577479, 0.9884915, 0, 0.6705883, 1, 1,
0.1593421, 1.668427, -0.1231274, 0, 0.6627451, 1, 1,
0.1787113, -0.0317019, 2.232867, 0, 0.6588235, 1, 1,
0.1830722, 0.9701736, 0.2311931, 0, 0.6509804, 1, 1,
0.1860881, -1.718952, 4.10767, 0, 0.6470588, 1, 1,
0.1912574, 0.8802806, -0.9609838, 0, 0.6392157, 1, 1,
0.1968295, 0.217059, 0.3981693, 0, 0.6352941, 1, 1,
0.1974804, -0.7975582, 2.569953, 0, 0.627451, 1, 1,
0.1981612, -1.821233, 2.502103, 0, 0.6235294, 1, 1,
0.1990992, 0.7625872, 0.08817836, 0, 0.6156863, 1, 1,
0.2001329, 0.1603573, 0.2909903, 0, 0.6117647, 1, 1,
0.2045796, -1.387183, 2.52174, 0, 0.6039216, 1, 1,
0.2117303, 0.885052, -0.7042568, 0, 0.5960785, 1, 1,
0.2120768, 0.9926108, 0.2147653, 0, 0.5921569, 1, 1,
0.2159049, 0.685971, 1.39546, 0, 0.5843138, 1, 1,
0.2162007, -1.841679, 2.125955, 0, 0.5803922, 1, 1,
0.2167842, 0.872704, 0.614844, 0, 0.572549, 1, 1,
0.2174728, 2.95622, 0.1856184, 0, 0.5686275, 1, 1,
0.2198071, 0.5427719, -0.8675767, 0, 0.5607843, 1, 1,
0.2378824, 0.5610827, 0.4313881, 0, 0.5568628, 1, 1,
0.2381295, -1.39691, 4.151644, 0, 0.5490196, 1, 1,
0.2493799, 2.048812, -0.7005758, 0, 0.5450981, 1, 1,
0.2583026, 0.8292733, 0.6561742, 0, 0.5372549, 1, 1,
0.2615114, 0.8845282, -0.4515465, 0, 0.5333334, 1, 1,
0.2641186, -1.847664, 4.565955, 0, 0.5254902, 1, 1,
0.2642167, -0.5914479, 2.543587, 0, 0.5215687, 1, 1,
0.2716526, 0.911429, -0.2836094, 0, 0.5137255, 1, 1,
0.2723942, 0.1774167, 0.2448816, 0, 0.509804, 1, 1,
0.2740679, -1.180241, 4.837624, 0, 0.5019608, 1, 1,
0.2741559, -0.3232957, 3.870834, 0, 0.4941176, 1, 1,
0.27497, 0.02888875, 1.531564, 0, 0.4901961, 1, 1,
0.2776083, 0.3373993, 1.313644, 0, 0.4823529, 1, 1,
0.2805714, -0.1366534, 1.000636, 0, 0.4784314, 1, 1,
0.2806355, 0.6049284, 0.1300505, 0, 0.4705882, 1, 1,
0.2823703, -0.3192884, 1.263646, 0, 0.4666667, 1, 1,
0.2829759, -1.282549, 2.938641, 0, 0.4588235, 1, 1,
0.2874976, -0.6013118, 3.479137, 0, 0.454902, 1, 1,
0.2929682, -2.271405, 4.382535, 0, 0.4470588, 1, 1,
0.295272, 0.007875635, 1.455338, 0, 0.4431373, 1, 1,
0.299136, -0.6511778, 1.335764, 0, 0.4352941, 1, 1,
0.3006267, -0.09848496, 2.602093, 0, 0.4313726, 1, 1,
0.3054604, -0.4594291, 2.991699, 0, 0.4235294, 1, 1,
0.3098886, 0.3316521, 2.15585, 0, 0.4196078, 1, 1,
0.3104134, -1.448179, 1.999861, 0, 0.4117647, 1, 1,
0.3113168, 1.154974, -0.5684313, 0, 0.4078431, 1, 1,
0.3126349, 0.005784248, 0.5576103, 0, 0.4, 1, 1,
0.3141138, 0.4733649, 0.05371072, 0, 0.3921569, 1, 1,
0.3141158, -0.8421859, 0.8316043, 0, 0.3882353, 1, 1,
0.3142757, 0.4815382, 0.6037464, 0, 0.3803922, 1, 1,
0.3182634, 0.9484245, -0.4893543, 0, 0.3764706, 1, 1,
0.3213071, 0.04584575, 2.435378, 0, 0.3686275, 1, 1,
0.3219939, -0.7565252, 2.562788, 0, 0.3647059, 1, 1,
0.3244031, -0.6355034, 1.108048, 0, 0.3568628, 1, 1,
0.3254329, -0.6761231, 0.09510551, 0, 0.3529412, 1, 1,
0.3262549, 1.536963, 1.541965, 0, 0.345098, 1, 1,
0.326268, 0.3382575, 1.09583, 0, 0.3411765, 1, 1,
0.3311075, -0.7916716, 1.70001, 0, 0.3333333, 1, 1,
0.3328135, -0.9881057, 3.869251, 0, 0.3294118, 1, 1,
0.3376053, 0.4254257, 0.6353, 0, 0.3215686, 1, 1,
0.3378838, -1.185829, 1.35594, 0, 0.3176471, 1, 1,
0.3406884, -0.1466804, 2.331301, 0, 0.3098039, 1, 1,
0.342313, 1.071468, -0.5873207, 0, 0.3058824, 1, 1,
0.3424153, -1.555258, 3.021206, 0, 0.2980392, 1, 1,
0.3424313, 0.5585856, 0.6600193, 0, 0.2901961, 1, 1,
0.3436424, 0.8923213, -1.820595, 0, 0.2862745, 1, 1,
0.3461587, -0.8392131, 3.480323, 0, 0.2784314, 1, 1,
0.3510956, 0.8676918, -1.054898, 0, 0.2745098, 1, 1,
0.3562426, -0.6181755, 3.126861, 0, 0.2666667, 1, 1,
0.3589483, -0.869613, 2.316885, 0, 0.2627451, 1, 1,
0.3599499, -0.7143694, 1.881164, 0, 0.254902, 1, 1,
0.3625728, -0.6494788, 2.24681, 0, 0.2509804, 1, 1,
0.3705782, -0.3257194, 2.48126, 0, 0.2431373, 1, 1,
0.3721842, 0.1382474, 2.273043, 0, 0.2392157, 1, 1,
0.3725802, 0.008681084, 0.6862234, 0, 0.2313726, 1, 1,
0.3745129, 1.380562, 1.657428, 0, 0.227451, 1, 1,
0.3747031, 1.308184, 0.1045066, 0, 0.2196078, 1, 1,
0.3763643, -0.2578972, 0.6335632, 0, 0.2156863, 1, 1,
0.380202, -0.4499625, 3.04544, 0, 0.2078431, 1, 1,
0.3814397, -0.8273422, 2.008887, 0, 0.2039216, 1, 1,
0.3817186, -0.04403019, 1.966572, 0, 0.1960784, 1, 1,
0.3817198, -1.530324, 0.271685, 0, 0.1882353, 1, 1,
0.3845402, -1.43926, 3.313628, 0, 0.1843137, 1, 1,
0.3877313, -0.1985795, 0.931922, 0, 0.1764706, 1, 1,
0.3893329, -0.4892365, 0.7205952, 0, 0.172549, 1, 1,
0.3925085, -0.2261279, 0.841688, 0, 0.1647059, 1, 1,
0.3927844, -0.8355611, 3.539058, 0, 0.1607843, 1, 1,
0.3949666, -0.635442, 2.447686, 0, 0.1529412, 1, 1,
0.4014636, -0.6185058, 4.425679, 0, 0.1490196, 1, 1,
0.4058564, -0.2423542, 1.724962, 0, 0.1411765, 1, 1,
0.410156, -0.8507489, 4.0869, 0, 0.1372549, 1, 1,
0.4162511, 1.262349, -0.5153807, 0, 0.1294118, 1, 1,
0.4175348, 0.6685121, 0.5362821, 0, 0.1254902, 1, 1,
0.4192829, -0.7715812, 1.990499, 0, 0.1176471, 1, 1,
0.4196205, 0.1041782, 1.272847, 0, 0.1137255, 1, 1,
0.4261853, -0.4350117, 2.63548, 0, 0.1058824, 1, 1,
0.426282, -0.1614264, 2.088886, 0, 0.09803922, 1, 1,
0.4276175, -0.6157709, 2.544747, 0, 0.09411765, 1, 1,
0.4284161, -1.054191, 2.68882, 0, 0.08627451, 1, 1,
0.4299191, -1.324431, 3.698138, 0, 0.08235294, 1, 1,
0.4362019, 1.460783, -0.6274571, 0, 0.07450981, 1, 1,
0.4370196, -3.113332, 3.018255, 0, 0.07058824, 1, 1,
0.4391362, -0.7081519, 4.121548, 0, 0.0627451, 1, 1,
0.440472, -0.4428963, 2.880375, 0, 0.05882353, 1, 1,
0.4410434, -0.3137786, 2.51416, 0, 0.05098039, 1, 1,
0.4415496, -0.6673017, 2.784618, 0, 0.04705882, 1, 1,
0.4425243, -1.068908, 1.553076, 0, 0.03921569, 1, 1,
0.4428728, 0.02161247, 2.042255, 0, 0.03529412, 1, 1,
0.4451132, 0.4979327, 1.415043, 0, 0.02745098, 1, 1,
0.4466285, -0.8970746, 1.827652, 0, 0.02352941, 1, 1,
0.4476075, -1.318318, 3.527052, 0, 0.01568628, 1, 1,
0.4498909, -0.6563216, 1.786968, 0, 0.01176471, 1, 1,
0.4507673, -0.5249889, 3.468187, 0, 0.003921569, 1, 1,
0.4509279, -0.9877574, 1.81921, 0.003921569, 0, 1, 1,
0.4515236, -0.4644291, 2.057866, 0.007843138, 0, 1, 1,
0.4518551, 0.2581035, -0.3341049, 0.01568628, 0, 1, 1,
0.4544574, -0.1129714, 2.017758, 0.01960784, 0, 1, 1,
0.4562457, 0.1755911, 1.722781, 0.02745098, 0, 1, 1,
0.456356, -0.504235, 2.963487, 0.03137255, 0, 1, 1,
0.4582954, 1.019945, -1.444442, 0.03921569, 0, 1, 1,
0.4584373, -1.028188, 2.488658, 0.04313726, 0, 1, 1,
0.4597838, -0.5952573, 2.913001, 0.05098039, 0, 1, 1,
0.4601976, 0.2241563, 0.6849669, 0.05490196, 0, 1, 1,
0.4656647, -0.7995457, 2.089013, 0.0627451, 0, 1, 1,
0.4717426, -0.338126, 2.739143, 0.06666667, 0, 1, 1,
0.4730193, 0.05548366, 1.101901, 0.07450981, 0, 1, 1,
0.4790663, -1.354154, 2.086373, 0.07843138, 0, 1, 1,
0.4801556, 0.5763976, -1.367095, 0.08627451, 0, 1, 1,
0.4817752, 0.7153875, -0.4331632, 0.09019608, 0, 1, 1,
0.4882933, 0.52811, 0.365056, 0.09803922, 0, 1, 1,
0.489786, -0.3074816, 1.06043, 0.1058824, 0, 1, 1,
0.4907406, -0.3129413, 3.737827, 0.1098039, 0, 1, 1,
0.4910692, 1.315956, -1.350472, 0.1176471, 0, 1, 1,
0.4998822, 0.3772522, 0.2579297, 0.1215686, 0, 1, 1,
0.500093, -0.1112515, 1.546214, 0.1294118, 0, 1, 1,
0.50207, 0.2636226, 1.759293, 0.1333333, 0, 1, 1,
0.5038531, 1.011458, 1.06781, 0.1411765, 0, 1, 1,
0.5071229, 0.1667084, 2.443481, 0.145098, 0, 1, 1,
0.507441, 0.1680664, -0.499829, 0.1529412, 0, 1, 1,
0.5088763, 0.7936623, 0.296739, 0.1568628, 0, 1, 1,
0.513775, 1.248672, 0.4132236, 0.1647059, 0, 1, 1,
0.5155056, 0.8238454, 1.106204, 0.1686275, 0, 1, 1,
0.5161455, -1.72647, 2.470193, 0.1764706, 0, 1, 1,
0.5193545, 0.6265632, 1.283156, 0.1803922, 0, 1, 1,
0.525884, -1.782894, 2.35794, 0.1882353, 0, 1, 1,
0.5396605, -0.3626035, 0.9595906, 0.1921569, 0, 1, 1,
0.5424803, 0.556844, 1.717092, 0.2, 0, 1, 1,
0.543194, -0.2554873, 2.187567, 0.2078431, 0, 1, 1,
0.5433772, 0.04410582, 1.958769, 0.2117647, 0, 1, 1,
0.5479817, 1.732774, 0.09769922, 0.2196078, 0, 1, 1,
0.549555, -0.2025317, 2.346364, 0.2235294, 0, 1, 1,
0.5518474, -0.05869139, 0.9967172, 0.2313726, 0, 1, 1,
0.5568655, 1.180396, -0.4474177, 0.2352941, 0, 1, 1,
0.5633507, 0.08930678, 1.457962, 0.2431373, 0, 1, 1,
0.5665151, 0.8738298, 1.896842, 0.2470588, 0, 1, 1,
0.5767016, -1.501222, 3.317177, 0.254902, 0, 1, 1,
0.579473, 0.7304812, 1.178886, 0.2588235, 0, 1, 1,
0.5836582, -0.09686767, 1.232904, 0.2666667, 0, 1, 1,
0.584884, 0.9348894, 0.3787418, 0.2705882, 0, 1, 1,
0.5903594, -1.985166, 2.550276, 0.2784314, 0, 1, 1,
0.5924511, 1.205808, 0.9431483, 0.282353, 0, 1, 1,
0.5997452, -1.007981, 2.625815, 0.2901961, 0, 1, 1,
0.6066722, 0.2332296, 2.482891, 0.2941177, 0, 1, 1,
0.607186, -0.5993605, 2.47615, 0.3019608, 0, 1, 1,
0.6128551, -0.9794458, 3.748089, 0.3098039, 0, 1, 1,
0.6157556, 0.02239163, 3.283772, 0.3137255, 0, 1, 1,
0.6171245, 0.2125726, 1.988286, 0.3215686, 0, 1, 1,
0.6194908, -0.7464908, 1.284698, 0.3254902, 0, 1, 1,
0.6219808, -0.448996, 0.9741667, 0.3333333, 0, 1, 1,
0.6220856, -1.051321, 2.826562, 0.3372549, 0, 1, 1,
0.6236752, 0.7660537, 2.374744, 0.345098, 0, 1, 1,
0.6240691, -0.4518551, 4.103663, 0.3490196, 0, 1, 1,
0.6308395, 1.391452, 0.1977249, 0.3568628, 0, 1, 1,
0.633558, 0.4207924, 0.9391491, 0.3607843, 0, 1, 1,
0.6343464, 0.7314867, -1.39423, 0.3686275, 0, 1, 1,
0.6399801, -0.05740203, 0.3629125, 0.372549, 0, 1, 1,
0.6422869, 1.067935, 0.9465501, 0.3803922, 0, 1, 1,
0.6437517, -2.310022, 4.224278, 0.3843137, 0, 1, 1,
0.6464038, 0.4008401, 1.099185, 0.3921569, 0, 1, 1,
0.650439, -0.8254776, 3.144708, 0.3960784, 0, 1, 1,
0.6593093, 2.209627, -1.25974, 0.4039216, 0, 1, 1,
0.662895, -0.4738953, 2.7887, 0.4117647, 0, 1, 1,
0.6663516, -0.9735838, 2.004102, 0.4156863, 0, 1, 1,
0.6710818, -0.6860289, 2.951959, 0.4235294, 0, 1, 1,
0.6732767, 1.562594, -1.537287, 0.427451, 0, 1, 1,
0.6787823, -0.663168, 2.293631, 0.4352941, 0, 1, 1,
0.6819323, 0.4231765, 2.414228, 0.4392157, 0, 1, 1,
0.6835226, -0.5443316, 2.368274, 0.4470588, 0, 1, 1,
0.6838164, 0.2398721, -0.3291187, 0.4509804, 0, 1, 1,
0.6846847, -0.6275442, 2.811991, 0.4588235, 0, 1, 1,
0.6849744, -0.3578691, 1.430922, 0.4627451, 0, 1, 1,
0.6859446, -0.658603, 3.141682, 0.4705882, 0, 1, 1,
0.6919242, -0.3423112, 1.187683, 0.4745098, 0, 1, 1,
0.6977213, -1.145483, 2.141882, 0.4823529, 0, 1, 1,
0.6979395, 0.5217143, 2.22916, 0.4862745, 0, 1, 1,
0.6979702, 1.48854, -0.6884764, 0.4941176, 0, 1, 1,
0.7040113, -1.251256, 3.928612, 0.5019608, 0, 1, 1,
0.7077659, 0.5961663, 0.6990209, 0.5058824, 0, 1, 1,
0.7083248, 0.6314143, 1.552364, 0.5137255, 0, 1, 1,
0.7100378, 1.42753, 1.780479, 0.5176471, 0, 1, 1,
0.710488, 0.797097, 1.851398, 0.5254902, 0, 1, 1,
0.7105714, 0.9067985, -1.131215, 0.5294118, 0, 1, 1,
0.7158342, 0.3148679, 1.594386, 0.5372549, 0, 1, 1,
0.7287468, -1.601025, 1.224463, 0.5411765, 0, 1, 1,
0.7289487, -0.1568893, 1.985019, 0.5490196, 0, 1, 1,
0.7323259, -0.2870513, 1.034559, 0.5529412, 0, 1, 1,
0.732627, 1.752834, 1.275795, 0.5607843, 0, 1, 1,
0.7329004, -0.2356926, 3.259609, 0.5647059, 0, 1, 1,
0.7333497, 0.2182361, -0.4438898, 0.572549, 0, 1, 1,
0.7410846, -0.1437065, 2.078008, 0.5764706, 0, 1, 1,
0.7451978, -0.2797488, 2.675558, 0.5843138, 0, 1, 1,
0.7459344, -1.54642, 1.293507, 0.5882353, 0, 1, 1,
0.7539279, 0.8054757, -0.4493779, 0.5960785, 0, 1, 1,
0.7557378, 0.07923527, 1.263484, 0.6039216, 0, 1, 1,
0.7559879, 0.4450946, -0.3477004, 0.6078432, 0, 1, 1,
0.7573173, 0.4443432, -0.275896, 0.6156863, 0, 1, 1,
0.757617, -0.4175023, 2.682548, 0.6196079, 0, 1, 1,
0.7589536, 1.103801, 0.008946654, 0.627451, 0, 1, 1,
0.7604346, -0.01358821, 2.224032, 0.6313726, 0, 1, 1,
0.762336, 0.9345872, 1.761173, 0.6392157, 0, 1, 1,
0.7633424, 1.374283, 1.298789, 0.6431373, 0, 1, 1,
0.765636, -1.105674, 3.744635, 0.6509804, 0, 1, 1,
0.7682132, -0.3428638, 3.897995, 0.654902, 0, 1, 1,
0.7683476, 0.3637705, 2.243507, 0.6627451, 0, 1, 1,
0.7710074, -0.3942283, 1.702389, 0.6666667, 0, 1, 1,
0.77374, -0.7525867, 1.409851, 0.6745098, 0, 1, 1,
0.7867798, -0.2424594, 2.750033, 0.6784314, 0, 1, 1,
0.7868025, 0.5309887, 0.4198079, 0.6862745, 0, 1, 1,
0.7904871, -1.758825, 2.183594, 0.6901961, 0, 1, 1,
0.7919898, 0.7915923, -0.1432118, 0.6980392, 0, 1, 1,
0.7965381, -0.3355849, 2.301158, 0.7058824, 0, 1, 1,
0.7967926, -0.5335422, 2.156923, 0.7098039, 0, 1, 1,
0.7975966, 0.2718728, 1.129613, 0.7176471, 0, 1, 1,
0.8124707, 0.7085719, 0.9177328, 0.7215686, 0, 1, 1,
0.8156112, 0.06248567, 1.288039, 0.7294118, 0, 1, 1,
0.8161178, 1.163703, -0.2725352, 0.7333333, 0, 1, 1,
0.8165215, 0.411073, 2.325388, 0.7411765, 0, 1, 1,
0.8177111, 0.9419568, 1.081767, 0.7450981, 0, 1, 1,
0.8189155, -0.224552, 2.777915, 0.7529412, 0, 1, 1,
0.8209409, 0.2626063, 1.192047, 0.7568628, 0, 1, 1,
0.8224992, -2.787324, 2.380206, 0.7647059, 0, 1, 1,
0.824928, 0.6981524, -0.01784613, 0.7686275, 0, 1, 1,
0.8353635, -0.5355303, 2.266892, 0.7764706, 0, 1, 1,
0.8405957, -1.157539, 1.838501, 0.7803922, 0, 1, 1,
0.8429214, 0.1511935, 2.341834, 0.7882353, 0, 1, 1,
0.8498499, -0.3157791, 1.643451, 0.7921569, 0, 1, 1,
0.8543501, 0.04287176, 3.260559, 0.8, 0, 1, 1,
0.864826, -0.1240825, 1.514052, 0.8078431, 0, 1, 1,
0.8800272, -0.9036534, 3.663486, 0.8117647, 0, 1, 1,
0.8903325, 0.7362147, 0.9769417, 0.8196079, 0, 1, 1,
0.8923982, -0.8104694, 0.848716, 0.8235294, 0, 1, 1,
0.8982433, -0.4469421, 1.84996, 0.8313726, 0, 1, 1,
0.9049699, 0.2421971, 2.111399, 0.8352941, 0, 1, 1,
0.9091082, -0.4349013, 2.510229, 0.8431373, 0, 1, 1,
0.9135357, 1.98769, 1.377475, 0.8470588, 0, 1, 1,
0.9199098, 0.3804226, 3.135557, 0.854902, 0, 1, 1,
0.9210868, 2.652236, 2.558108, 0.8588235, 0, 1, 1,
0.9252567, -0.5373636, 2.71032, 0.8666667, 0, 1, 1,
0.9261401, 0.01354603, 1.752328, 0.8705882, 0, 1, 1,
0.9448668, 0.6224266, 2.195143, 0.8784314, 0, 1, 1,
0.9469298, -0.7580093, 2.763592, 0.8823529, 0, 1, 1,
0.9533892, -0.224615, 4.504452, 0.8901961, 0, 1, 1,
0.9583311, 0.1196407, 0.141814, 0.8941177, 0, 1, 1,
0.9655148, -0.07335576, -0.1043271, 0.9019608, 0, 1, 1,
0.9778475, 0.8224564, 2.389447, 0.9098039, 0, 1, 1,
0.9802257, 0.3447321, 2.355811, 0.9137255, 0, 1, 1,
0.9805827, -0.01384229, 3.235462, 0.9215686, 0, 1, 1,
0.9862726, -0.2627621, 1.381719, 0.9254902, 0, 1, 1,
0.9887471, -0.4885719, 1.189421, 0.9333333, 0, 1, 1,
0.9946556, 0.5976414, 2.469794, 0.9372549, 0, 1, 1,
0.9975771, -0.6739343, 2.467767, 0.945098, 0, 1, 1,
1.005246, -0.9395506, 2.888188, 0.9490196, 0, 1, 1,
1.00688, -1.577783, 2.807204, 0.9568627, 0, 1, 1,
1.015453, 0.3633639, -0.5343661, 0.9607843, 0, 1, 1,
1.016644, 0.4920901, 0.9079699, 0.9686275, 0, 1, 1,
1.019964, -1.632656, 3.468509, 0.972549, 0, 1, 1,
1.023568, -0.8627314, 2.695563, 0.9803922, 0, 1, 1,
1.031479, 1.14491, -0.9968139, 0.9843137, 0, 1, 1,
1.032244, -0.178164, 1.167963, 0.9921569, 0, 1, 1,
1.032879, 0.5347156, 2.211674, 0.9960784, 0, 1, 1,
1.033409, 0.0987492, 0.659999, 1, 0, 0.9960784, 1,
1.034374, 0.8991221, 1.604093, 1, 0, 0.9882353, 1,
1.037446, -0.3380991, 2.231973, 1, 0, 0.9843137, 1,
1.042363, 0.4621687, 1.270858, 1, 0, 0.9764706, 1,
1.047606, -0.8062203, 1.962428, 1, 0, 0.972549, 1,
1.049893, -0.4191151, 0.8464544, 1, 0, 0.9647059, 1,
1.057045, -0.2572323, 1.338712, 1, 0, 0.9607843, 1,
1.059116, 1.217277, 1.575265, 1, 0, 0.9529412, 1,
1.067963, 0.1624053, 0.1870288, 1, 0, 0.9490196, 1,
1.075075, -1.371139, 0.5669454, 1, 0, 0.9411765, 1,
1.079047, -0.07213799, 2.383201, 1, 0, 0.9372549, 1,
1.079778, -0.04263205, 0.8567428, 1, 0, 0.9294118, 1,
1.096659, 0.8636879, 0.3203861, 1, 0, 0.9254902, 1,
1.099227, -0.2796933, 1.233122, 1, 0, 0.9176471, 1,
1.107855, -1.525005, 2.69995, 1, 0, 0.9137255, 1,
1.11324, 0.9901558, -0.4245446, 1, 0, 0.9058824, 1,
1.113244, -1.266625, 2.839513, 1, 0, 0.9019608, 1,
1.113326, 0.600206, 1.191928, 1, 0, 0.8941177, 1,
1.114909, -1.51011, 2.99731, 1, 0, 0.8862745, 1,
1.116379, -0.7166776, 1.431595, 1, 0, 0.8823529, 1,
1.122401, 0.1145898, 1.133931, 1, 0, 0.8745098, 1,
1.125989, 1.069601, 0.762151, 1, 0, 0.8705882, 1,
1.128203, -0.3322278, -0.2740149, 1, 0, 0.8627451, 1,
1.128503, 1.193366, 1.374901, 1, 0, 0.8588235, 1,
1.132308, -0.7995011, 2.822092, 1, 0, 0.8509804, 1,
1.142466, 0.9092234, 1.663297, 1, 0, 0.8470588, 1,
1.146332, -1.673139, 0.9028215, 1, 0, 0.8392157, 1,
1.152518, -1.976034, 1.172266, 1, 0, 0.8352941, 1,
1.158622, 2.001146, -1.294702, 1, 0, 0.827451, 1,
1.159107, 0.9247253, 1.281167, 1, 0, 0.8235294, 1,
1.162737, 0.9605083, -0.2585628, 1, 0, 0.8156863, 1,
1.163179, 0.2538083, -0.8207127, 1, 0, 0.8117647, 1,
1.163234, -0.321285, 1.187807, 1, 0, 0.8039216, 1,
1.176279, -0.5073681, 0.007203111, 1, 0, 0.7960784, 1,
1.180045, 0.1582683, -0.2503641, 1, 0, 0.7921569, 1,
1.18031, 0.7038744, 1.946603, 1, 0, 0.7843137, 1,
1.183545, 0.0431358, 2.321856, 1, 0, 0.7803922, 1,
1.184041, -1.085345, 1.007132, 1, 0, 0.772549, 1,
1.185605, -0.8391055, 1.402418, 1, 0, 0.7686275, 1,
1.18909, 0.1526668, 1.161809, 1, 0, 0.7607843, 1,
1.191697, -0.2069061, 2.395946, 1, 0, 0.7568628, 1,
1.19286, -0.4388634, -0.6003536, 1, 0, 0.7490196, 1,
1.194715, -0.4638578, 2.143226, 1, 0, 0.7450981, 1,
1.19979, 2.181305, -0.6372695, 1, 0, 0.7372549, 1,
1.203907, 0.4577713, -0.6229085, 1, 0, 0.7333333, 1,
1.204132, -1.317969, 1.635142, 1, 0, 0.7254902, 1,
1.206506, -0.4336771, 1.005863, 1, 0, 0.7215686, 1,
1.216892, 0.3037343, 1.063979, 1, 0, 0.7137255, 1,
1.217121, 2.414512, 0.3529329, 1, 0, 0.7098039, 1,
1.217753, -1.539148, 1.518479, 1, 0, 0.7019608, 1,
1.219364, -1.111381, 1.285411, 1, 0, 0.6941177, 1,
1.224209, 1.535129, -1.12415, 1, 0, 0.6901961, 1,
1.225109, 1.504526, -0.4461141, 1, 0, 0.682353, 1,
1.236363, -1.411522, 3.131499, 1, 0, 0.6784314, 1,
1.239743, -0.3447129, 2.954333, 1, 0, 0.6705883, 1,
1.243964, 0.7405114, 0.7321354, 1, 0, 0.6666667, 1,
1.255257, 0.3157148, 1.199758, 1, 0, 0.6588235, 1,
1.258367, 3.399013, 0.8604133, 1, 0, 0.654902, 1,
1.2593, -0.6886993, 0.5140435, 1, 0, 0.6470588, 1,
1.262357, -0.5173431, 2.630856, 1, 0, 0.6431373, 1,
1.272702, 1.598438, -0.6423088, 1, 0, 0.6352941, 1,
1.273814, 0.875993, 0.6947891, 1, 0, 0.6313726, 1,
1.284164, -0.4440206, 3.204349, 1, 0, 0.6235294, 1,
1.284836, -0.6839918, 0.1952124, 1, 0, 0.6196079, 1,
1.287613, 0.9573287, 2.037081, 1, 0, 0.6117647, 1,
1.288193, 0.1767564, 0.3266475, 1, 0, 0.6078432, 1,
1.290471, -2.276306, 3.231172, 1, 0, 0.6, 1,
1.297849, -1.978719, 2.315136, 1, 0, 0.5921569, 1,
1.305973, -2.328419, 2.966431, 1, 0, 0.5882353, 1,
1.3061, -0.2985471, 2.64444, 1, 0, 0.5803922, 1,
1.306264, 0.5410151, 1.174111, 1, 0, 0.5764706, 1,
1.307613, -0.01470078, 1.759906, 1, 0, 0.5686275, 1,
1.308209, -1.955429, 3.422895, 1, 0, 0.5647059, 1,
1.316111, -1.071237, 4.37875, 1, 0, 0.5568628, 1,
1.320439, -0.1261715, 2.565198, 1, 0, 0.5529412, 1,
1.320539, 0.8545961, 0.7028311, 1, 0, 0.5450981, 1,
1.326838, 0.239591, -0.05269485, 1, 0, 0.5411765, 1,
1.338138, 1.397082, -0.08432909, 1, 0, 0.5333334, 1,
1.342882, -0.4854636, -0.1648434, 1, 0, 0.5294118, 1,
1.354475, 0.9217773, 0.3210335, 1, 0, 0.5215687, 1,
1.356371, 0.5279862, -0.7270985, 1, 0, 0.5176471, 1,
1.364117, 0.6254297, 0.767827, 1, 0, 0.509804, 1,
1.368342, -0.6733196, 3.954392, 1, 0, 0.5058824, 1,
1.372987, 0.746715, 0.9836836, 1, 0, 0.4980392, 1,
1.373682, -2.398484, 3.372171, 1, 0, 0.4901961, 1,
1.379316, 1.063267, -0.0986217, 1, 0, 0.4862745, 1,
1.380496, 0.1355438, 1.543205, 1, 0, 0.4784314, 1,
1.382555, -1.181296, 0.08564965, 1, 0, 0.4745098, 1,
1.385923, 0.8528205, 0.08444584, 1, 0, 0.4666667, 1,
1.39603, 0.3296438, 0.3439919, 1, 0, 0.4627451, 1,
1.397357, -1.486958, 0.4831755, 1, 0, 0.454902, 1,
1.398857, 0.1468892, 2.699449, 1, 0, 0.4509804, 1,
1.400419, -0.0344968, 0.7231665, 1, 0, 0.4431373, 1,
1.402335, -1.268354, 3.733863, 1, 0, 0.4392157, 1,
1.402906, 0.2515483, -0.07589107, 1, 0, 0.4313726, 1,
1.408866, 0.3597696, 1.987313, 1, 0, 0.427451, 1,
1.411942, -0.2260273, 1.305878, 1, 0, 0.4196078, 1,
1.414942, 0.2412778, 2.10307, 1, 0, 0.4156863, 1,
1.438457, -0.153757, 0.8906613, 1, 0, 0.4078431, 1,
1.439468, 0.08272159, 1.532258, 1, 0, 0.4039216, 1,
1.452539, 0.5052679, 1.64138, 1, 0, 0.3960784, 1,
1.455598, -0.2545162, 0.5098979, 1, 0, 0.3882353, 1,
1.457474, 0.7963135, 1.020564, 1, 0, 0.3843137, 1,
1.458766, -1.164192, 3.410365, 1, 0, 0.3764706, 1,
1.470666, 0.5770898, 1.599517, 1, 0, 0.372549, 1,
1.471619, 0.2265227, 1.091805, 1, 0, 0.3647059, 1,
1.476593, -0.4118695, 2.573185, 1, 0, 0.3607843, 1,
1.48868, -0.232751, 0.5415072, 1, 0, 0.3529412, 1,
1.497319, 0.7703036, 1.556865, 1, 0, 0.3490196, 1,
1.501137, 1.159391, -1.914166, 1, 0, 0.3411765, 1,
1.520711, -1.377019, 0.5979332, 1, 0, 0.3372549, 1,
1.521782, 0.4900747, 0.9190243, 1, 0, 0.3294118, 1,
1.521997, 0.4681132, 1.04071, 1, 0, 0.3254902, 1,
1.544674, 0.270504, 2.171939, 1, 0, 0.3176471, 1,
1.545961, -0.4494959, 1.146314, 1, 0, 0.3137255, 1,
1.587743, 1.599473, 0.4760632, 1, 0, 0.3058824, 1,
1.592512, 0.3337365, 1.662892, 1, 0, 0.2980392, 1,
1.609055, 0.1080876, 1.584816, 1, 0, 0.2941177, 1,
1.61497, -0.0242809, 2.372352, 1, 0, 0.2862745, 1,
1.622213, -0.4081379, 1.762225, 1, 0, 0.282353, 1,
1.63244, 1.082286, 0.3568046, 1, 0, 0.2745098, 1,
1.632804, 1.38614, 0.3900459, 1, 0, 0.2705882, 1,
1.666398, 1.15335, 0.6566603, 1, 0, 0.2627451, 1,
1.67284, 1.426131, -0.3517053, 1, 0, 0.2588235, 1,
1.674906, 0.7340317, 0.1044398, 1, 0, 0.2509804, 1,
1.717857, -0.04777416, 0.8215632, 1, 0, 0.2470588, 1,
1.719754, -0.5873634, 3.111337, 1, 0, 0.2392157, 1,
1.725292, -0.344692, -0.3993737, 1, 0, 0.2352941, 1,
1.757248, 0.5590926, 1.36919, 1, 0, 0.227451, 1,
1.777014, -1.991107, 1.847968, 1, 0, 0.2235294, 1,
1.777789, 1.914729, 1.082613, 1, 0, 0.2156863, 1,
1.785019, -0.5450899, 0.1827048, 1, 0, 0.2117647, 1,
1.786691, 0.1566896, 1.390902, 1, 0, 0.2039216, 1,
1.791156, -0.1540651, 1.493113, 1, 0, 0.1960784, 1,
1.79882, 0.1839467, 1.440343, 1, 0, 0.1921569, 1,
1.847193, 1.805243, 0.3364496, 1, 0, 0.1843137, 1,
1.848367, 0.320358, -0.05496322, 1, 0, 0.1803922, 1,
1.852302, 0.7392609, 2.350117, 1, 0, 0.172549, 1,
1.860139, 0.5213292, -0.02772156, 1, 0, 0.1686275, 1,
1.871356, 0.6624698, 0.6857472, 1, 0, 0.1607843, 1,
1.883283, -1.587508, 3.247896, 1, 0, 0.1568628, 1,
1.883859, -0.3566699, 3.310375, 1, 0, 0.1490196, 1,
1.904306, -0.2890479, 0.5808841, 1, 0, 0.145098, 1,
1.905386, -0.4300135, 0.4054163, 1, 0, 0.1372549, 1,
1.906403, -0.03915906, 1.977455, 1, 0, 0.1333333, 1,
1.917595, 0.5233355, 0.728952, 1, 0, 0.1254902, 1,
2.02399, 0.03706672, 2.226664, 1, 0, 0.1215686, 1,
2.026397, 1.077468, 1.374704, 1, 0, 0.1137255, 1,
2.03881, 0.7339847, 0.4269712, 1, 0, 0.1098039, 1,
2.055593, 0.5212998, 1.939816, 1, 0, 0.1019608, 1,
2.107334, 0.07478362, 1.710899, 1, 0, 0.09411765, 1,
2.119258, -2.820986, 0.4053089, 1, 0, 0.09019608, 1,
2.182935, 1.82484, 0.5006118, 1, 0, 0.08235294, 1,
2.201694, 1.063685, 0.9066451, 1, 0, 0.07843138, 1,
2.234306, 1.296583, -0.2972034, 1, 0, 0.07058824, 1,
2.262306, 1.011486, 2.224987, 1, 0, 0.06666667, 1,
2.291008, 0.7283196, 1.368758, 1, 0, 0.05882353, 1,
2.351968, -0.9376144, 1.968181, 1, 0, 0.05490196, 1,
2.35198, -0.7040545, 1.14545, 1, 0, 0.04705882, 1,
2.374535, 0.7175406, 2.577428, 1, 0, 0.04313726, 1,
2.436709, -0.007867645, 2.156184, 1, 0, 0.03529412, 1,
2.460752, 0.003741772, 1.155898, 1, 0, 0.03137255, 1,
2.706046, 1.181773, -0.4517585, 1, 0, 0.02352941, 1,
2.769162, 0.816332, 1.493537, 1, 0, 0.01960784, 1,
2.80468, -0.2338855, 0.8237073, 1, 0, 0.01176471, 1,
3.028476, -0.2487214, 0.7501732, 1, 0, 0.007843138, 1
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
-0.1070875, -4.217174, -6.939544, 0, -0.5, 0.5, 0.5,
-0.1070875, -4.217174, -6.939544, 1, -0.5, 0.5, 0.5,
-0.1070875, -4.217174, -6.939544, 1, 1.5, 0.5, 0.5,
-0.1070875, -4.217174, -6.939544, 0, 1.5, 0.5, 0.5
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
-4.305608, 0.1428405, -6.939544, 0, -0.5, 0.5, 0.5,
-4.305608, 0.1428405, -6.939544, 1, -0.5, 0.5, 0.5,
-4.305608, 0.1428405, -6.939544, 1, 1.5, 0.5, 0.5,
-4.305608, 0.1428405, -6.939544, 0, 1.5, 0.5, 0.5
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
-4.305608, -4.217174, -0.1975057, 0, -0.5, 0.5, 0.5,
-4.305608, -4.217174, -0.1975057, 1, -0.5, 0.5, 0.5,
-4.305608, -4.217174, -0.1975057, 1, 1.5, 0.5, 0.5,
-4.305608, -4.217174, -0.1975057, 0, 1.5, 0.5, 0.5
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
-3, -3.211017, -5.383689,
3, -3.211017, -5.383689,
-3, -3.211017, -5.383689,
-3, -3.37871, -5.642998,
-2, -3.211017, -5.383689,
-2, -3.37871, -5.642998,
-1, -3.211017, -5.383689,
-1, -3.37871, -5.642998,
0, -3.211017, -5.383689,
0, -3.37871, -5.642998,
1, -3.211017, -5.383689,
1, -3.37871, -5.642998,
2, -3.211017, -5.383689,
2, -3.37871, -5.642998,
3, -3.211017, -5.383689,
3, -3.37871, -5.642998
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
-3, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
-3, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
-3, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
-3, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
-2, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
-2, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
-2, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
-2, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
-1, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
-1, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
-1, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
-1, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
0, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
0, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
0, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
0, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
1, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
1, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
1, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
1, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
2, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
2, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
2, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
2, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5,
3, -3.714095, -6.161616, 0, -0.5, 0.5, 0.5,
3, -3.714095, -6.161616, 1, -0.5, 0.5, 0.5,
3, -3.714095, -6.161616, 1, 1.5, 0.5, 0.5,
3, -3.714095, -6.161616, 0, 1.5, 0.5, 0.5
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
-3.336718, -3, -5.383689,
-3.336718, 3, -5.383689,
-3.336718, -3, -5.383689,
-3.4982, -3, -5.642998,
-3.336718, -2, -5.383689,
-3.4982, -2, -5.642998,
-3.336718, -1, -5.383689,
-3.4982, -1, -5.642998,
-3.336718, 0, -5.383689,
-3.4982, 0, -5.642998,
-3.336718, 1, -5.383689,
-3.4982, 1, -5.642998,
-3.336718, 2, -5.383689,
-3.4982, 2, -5.642998,
-3.336718, 3, -5.383689,
-3.4982, 3, -5.642998
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
-3.821163, -3, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, -3, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, -3, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, -3, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, -2, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, -2, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, -2, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, -2, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, -1, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, -1, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, -1, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, -1, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, 0, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, 0, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, 0, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, 0, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, 1, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, 1, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, 1, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, 1, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, 2, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, 2, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, 2, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, 2, -6.161616, 0, 1.5, 0.5, 0.5,
-3.821163, 3, -6.161616, 0, -0.5, 0.5, 0.5,
-3.821163, 3, -6.161616, 1, -0.5, 0.5, 0.5,
-3.821163, 3, -6.161616, 1, 1.5, 0.5, 0.5,
-3.821163, 3, -6.161616, 0, 1.5, 0.5, 0.5
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
-3.336718, -3.211017, -4,
-3.336718, -3.211017, 4,
-3.336718, -3.211017, -4,
-3.4982, -3.37871, -4,
-3.336718, -3.211017, -2,
-3.4982, -3.37871, -2,
-3.336718, -3.211017, 0,
-3.4982, -3.37871, 0,
-3.336718, -3.211017, 2,
-3.4982, -3.37871, 2,
-3.336718, -3.211017, 4,
-3.4982, -3.37871, 4
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
-3.821163, -3.714095, -4, 0, -0.5, 0.5, 0.5,
-3.821163, -3.714095, -4, 1, -0.5, 0.5, 0.5,
-3.821163, -3.714095, -4, 1, 1.5, 0.5, 0.5,
-3.821163, -3.714095, -4, 0, 1.5, 0.5, 0.5,
-3.821163, -3.714095, -2, 0, -0.5, 0.5, 0.5,
-3.821163, -3.714095, -2, 1, -0.5, 0.5, 0.5,
-3.821163, -3.714095, -2, 1, 1.5, 0.5, 0.5,
-3.821163, -3.714095, -2, 0, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 0, 0, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 0, 1, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 0, 1, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 0, 0, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 2, 0, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 2, 1, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 2, 1, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 2, 0, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 4, 0, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 4, 1, -0.5, 0.5, 0.5,
-3.821163, -3.714095, 4, 1, 1.5, 0.5, 0.5,
-3.821163, -3.714095, 4, 0, 1.5, 0.5, 0.5
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
-3.336718, -3.211017, -5.383689,
-3.336718, 3.496698, -5.383689,
-3.336718, -3.211017, 4.988678,
-3.336718, 3.496698, 4.988678,
-3.336718, -3.211017, -5.383689,
-3.336718, -3.211017, 4.988678,
-3.336718, 3.496698, -5.383689,
-3.336718, 3.496698, 4.988678,
-3.336718, -3.211017, -5.383689,
3.122543, -3.211017, -5.383689,
-3.336718, -3.211017, 4.988678,
3.122543, -3.211017, 4.988678,
-3.336718, 3.496698, -5.383689,
3.122543, 3.496698, -5.383689,
-3.336718, 3.496698, 4.988678,
3.122543, 3.496698, 4.988678,
3.122543, -3.211017, -5.383689,
3.122543, 3.496698, -5.383689,
3.122543, -3.211017, 4.988678,
3.122543, 3.496698, 4.988678,
3.122543, -3.211017, -5.383689,
3.122543, -3.211017, 4.988678,
3.122543, 3.496698, -5.383689,
3.122543, 3.496698, 4.988678
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
var radius = 7.443266;
var distance = 33.11593;
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
mvMatrix.translate( 0.1070875, -0.1428405, 0.1975057 );
mvMatrix.scale( 1.245933, 1.199783, 0.775889 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.11593);
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
pyrethrin_I<-read.table("pyrethrin_I.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrethrin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
y<-pyrethrin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
z<-pyrethrin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
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
-3.242651, 0.2115556, -3.14257, 0, 0, 1, 1, 1,
-2.956899, 0.206968, 0.7646295, 1, 0, 0, 1, 1,
-2.921769, 1.03872, -2.131174, 1, 0, 0, 1, 1,
-2.783571, 1.106942, -2.450579, 1, 0, 0, 1, 1,
-2.722743, -1.989094, -2.030045, 1, 0, 0, 1, 1,
-2.694794, 0.06631005, 0.6440555, 1, 0, 0, 1, 1,
-2.649684, -0.678597, -3.170268, 0, 0, 0, 1, 1,
-2.514538, -0.4704304, -1.755437, 0, 0, 0, 1, 1,
-2.413761, -0.3705744, -2.239441, 0, 0, 0, 1, 1,
-2.291737, 0.4987926, -0.7018437, 0, 0, 0, 1, 1,
-2.283646, -0.4994588, 0.5106162, 0, 0, 0, 1, 1,
-2.26387, -1.146165, -1.783802, 0, 0, 0, 1, 1,
-2.201925, 0.4429536, -0.3423992, 0, 0, 0, 1, 1,
-2.193076, -0.3012365, -3.113403, 1, 1, 1, 1, 1,
-2.170511, 0.09966942, -1.208855, 1, 1, 1, 1, 1,
-2.167608, 1.049804, -0.2580738, 1, 1, 1, 1, 1,
-2.165502, 0.8282465, 0.5725999, 1, 1, 1, 1, 1,
-2.158656, 0.2889924, -2.431497, 1, 1, 1, 1, 1,
-2.153279, -1.488022, -1.853254, 1, 1, 1, 1, 1,
-2.133857, -2.079062, -2.839644, 1, 1, 1, 1, 1,
-2.061727, -0.200492, -0.6771132, 1, 1, 1, 1, 1,
-2.004737, -0.09869351, -1.760897, 1, 1, 1, 1, 1,
-1.99103, -0.5256125, -2.678097, 1, 1, 1, 1, 1,
-1.917458, -1.245424, -0.389822, 1, 1, 1, 1, 1,
-1.916026, -0.8380101, -3.26672, 1, 1, 1, 1, 1,
-1.915954, -0.415348, -0.772597, 1, 1, 1, 1, 1,
-1.872608, 0.4172372, -2.404746, 1, 1, 1, 1, 1,
-1.870862, -0.09123538, -0.6792363, 1, 1, 1, 1, 1,
-1.824354, 0.4608496, -2.824886, 0, 0, 1, 1, 1,
-1.819763, 0.5993735, -3.103577, 1, 0, 0, 1, 1,
-1.813517, -1.459573, -2.556418, 1, 0, 0, 1, 1,
-1.794263, -0.7146508, -2.194135, 1, 0, 0, 1, 1,
-1.78791, 0.737519, -1.388652, 1, 0, 0, 1, 1,
-1.766296, 0.2834271, -1.984533, 1, 0, 0, 1, 1,
-1.761312, 0.1138804, -1.242898, 0, 0, 0, 1, 1,
-1.740132, 1.599476, -2.237317, 0, 0, 0, 1, 1,
-1.724236, 0.1765996, -1.909548, 0, 0, 0, 1, 1,
-1.717065, 0.1604752, -1.065314, 0, 0, 0, 1, 1,
-1.681808, 0.3237264, -0.22548, 0, 0, 0, 1, 1,
-1.671911, -0.7430845, -1.797901, 0, 0, 0, 1, 1,
-1.643987, 0.3530696, -0.394277, 0, 0, 0, 1, 1,
-1.643239, 1.402101, 0.4317155, 1, 1, 1, 1, 1,
-1.636432, -2.525883, -2.433511, 1, 1, 1, 1, 1,
-1.620948, -0.4473796, -2.866777, 1, 1, 1, 1, 1,
-1.619202, -2.496027, -2.375068, 1, 1, 1, 1, 1,
-1.605905, 2.57636, -0.2239181, 1, 1, 1, 1, 1,
-1.597283, -0.005603193, -1.585774, 1, 1, 1, 1, 1,
-1.57862, -1.817367, -2.18314, 1, 1, 1, 1, 1,
-1.570754, 0.9184076, -2.062495, 1, 1, 1, 1, 1,
-1.558847, -0.02977785, -1.499235, 1, 1, 1, 1, 1,
-1.558458, 0.3153626, -1.620853, 1, 1, 1, 1, 1,
-1.530416, 1.412292, -0.8053177, 1, 1, 1, 1, 1,
-1.521312, 1.213591, -0.1567741, 1, 1, 1, 1, 1,
-1.512478, 1.015486, -1.071708, 1, 1, 1, 1, 1,
-1.504877, 0.1292411, -2.597242, 1, 1, 1, 1, 1,
-1.503585, -0.4238624, -3.17039, 1, 1, 1, 1, 1,
-1.495901, 0.9742627, -0.08735122, 0, 0, 1, 1, 1,
-1.491962, -1.603906, -1.11043, 1, 0, 0, 1, 1,
-1.491649, -0.5879177, -0.153546, 1, 0, 0, 1, 1,
-1.485155, 0.0285152, -2.278203, 1, 0, 0, 1, 1,
-1.469553, 1.016044, -1.568654, 1, 0, 0, 1, 1,
-1.461115, -0.4904774, 0.4429724, 1, 0, 0, 1, 1,
-1.45962, -0.7920943, -2.238034, 0, 0, 0, 1, 1,
-1.458911, -1.304108, -3.170285, 0, 0, 0, 1, 1,
-1.454722, 1.184228, 0.4869691, 0, 0, 0, 1, 1,
-1.43635, 0.2900384, -2.984392, 0, 0, 0, 1, 1,
-1.43442, 1.11024, -1.134224, 0, 0, 0, 1, 1,
-1.428431, -1.612311, -3.498212, 0, 0, 0, 1, 1,
-1.425008, -0.2859048, -1.11579, 0, 0, 0, 1, 1,
-1.421894, 0.3165004, 0.07280941, 1, 1, 1, 1, 1,
-1.414078, 0.9210033, -2.536459, 1, 1, 1, 1, 1,
-1.409654, 2.065643, -1.70215, 1, 1, 1, 1, 1,
-1.396693, 0.4646199, -0.04205612, 1, 1, 1, 1, 1,
-1.389588, 0.4930206, -1.520361, 1, 1, 1, 1, 1,
-1.386207, 1.614842, -0.444781, 1, 1, 1, 1, 1,
-1.375379, 0.06103199, -3.534928, 1, 1, 1, 1, 1,
-1.372976, 0.403877, -1.543784, 1, 1, 1, 1, 1,
-1.369698, 0.4434934, -1.536239, 1, 1, 1, 1, 1,
-1.365229, -0.03080268, -1.765833, 1, 1, 1, 1, 1,
-1.36077, 0.6053464, -0.09069552, 1, 1, 1, 1, 1,
-1.358389, 1.259857, 0.7517347, 1, 1, 1, 1, 1,
-1.333197, -0.4712662, -0.6332214, 1, 1, 1, 1, 1,
-1.332783, 0.2444333, -1.837097, 1, 1, 1, 1, 1,
-1.316578, 0.6148656, -1.541464, 1, 1, 1, 1, 1,
-1.31272, 1.320543, 0.2493097, 0, 0, 1, 1, 1,
-1.310055, -0.9594505, -3.507105, 1, 0, 0, 1, 1,
-1.30751, 2.930811, 0.616321, 1, 0, 0, 1, 1,
-1.306831, -1.468526, -3.232014, 1, 0, 0, 1, 1,
-1.302734, 0.7064947, -2.902484, 1, 0, 0, 1, 1,
-1.299112, -1.507428, -4.101471, 1, 0, 0, 1, 1,
-1.298002, -1.09837, -2.907847, 0, 0, 0, 1, 1,
-1.296679, -0.9352044, -0.4052952, 0, 0, 0, 1, 1,
-1.292928, 0.330412, -0.5291929, 0, 0, 0, 1, 1,
-1.289991, 0.07157636, 1.479153, 0, 0, 0, 1, 1,
-1.279256, 1.927915, -0.3258175, 0, 0, 0, 1, 1,
-1.276518, -3.018819, -2.511235, 0, 0, 0, 1, 1,
-1.271688, -1.026586, -0.930424, 0, 0, 0, 1, 1,
-1.260288, -0.3380793, -2.065397, 1, 1, 1, 1, 1,
-1.255211, -0.816909, -2.175471, 1, 1, 1, 1, 1,
-1.253823, -0.05792911, -0.4553987, 1, 1, 1, 1, 1,
-1.232049, 0.07662614, -2.004796, 1, 1, 1, 1, 1,
-1.231989, 0.04533069, -0.9600347, 1, 1, 1, 1, 1,
-1.230896, -1.470604, -2.512323, 1, 1, 1, 1, 1,
-1.223989, -1.0157, -2.468288, 1, 1, 1, 1, 1,
-1.214081, 0.07384524, -1.473332, 1, 1, 1, 1, 1,
-1.21021, 1.242647, -0.6799445, 1, 1, 1, 1, 1,
-1.210177, -0.895204, -3.078555, 1, 1, 1, 1, 1,
-1.20154, -0.04533818, -0.3239917, 1, 1, 1, 1, 1,
-1.194522, -0.0489079, -1.586513, 1, 1, 1, 1, 1,
-1.190176, -0.5855008, -2.801191, 1, 1, 1, 1, 1,
-1.185394, -0.1001575, -2.103515, 1, 1, 1, 1, 1,
-1.184499, -0.3565897, -2.676496, 1, 1, 1, 1, 1,
-1.174651, 1.647077, -0.8140433, 0, 0, 1, 1, 1,
-1.167247, -0.4481051, -2.714386, 1, 0, 0, 1, 1,
-1.15946, -0.1890175, -0.07599954, 1, 0, 0, 1, 1,
-1.155162, -1.800087, -2.545598, 1, 0, 0, 1, 1,
-1.152673, -0.5574136, -1.757691, 1, 0, 0, 1, 1,
-1.150576, 1.025871, -1.242874, 1, 0, 0, 1, 1,
-1.149672, -0.04504798, -3.04401, 0, 0, 0, 1, 1,
-1.149094, 0.9305156, -1.500124, 0, 0, 0, 1, 1,
-1.146227, 0.5370418, -2.115927, 0, 0, 0, 1, 1,
-1.135208, 0.6833518, -0.1086015, 0, 0, 0, 1, 1,
-1.135078, -0.6624418, -2.725381, 0, 0, 0, 1, 1,
-1.132087, -0.9940518, -0.9919621, 0, 0, 0, 1, 1,
-1.131212, 0.1512939, -1.001837, 0, 0, 0, 1, 1,
-1.127828, 0.3076714, -0.1112942, 1, 1, 1, 1, 1,
-1.119999, -0.7491257, -1.406071, 1, 1, 1, 1, 1,
-1.118676, -1.142833, -2.313161, 1, 1, 1, 1, 1,
-1.113989, 0.4293419, -0.2402425, 1, 1, 1, 1, 1,
-1.11353, 0.4303425, 1.413414, 1, 1, 1, 1, 1,
-1.112654, -0.2827954, -3.281291, 1, 1, 1, 1, 1,
-1.107132, -1.555384, -4.597709, 1, 1, 1, 1, 1,
-1.103815, -0.3933445, -2.367033, 1, 1, 1, 1, 1,
-1.102798, 1.380717, -0.8110228, 1, 1, 1, 1, 1,
-1.097044, 0.6676527, 0.09477311, 1, 1, 1, 1, 1,
-1.094878, -1.048599, -3.488425, 1, 1, 1, 1, 1,
-1.094418, 0.1901076, -1.840269, 1, 1, 1, 1, 1,
-1.091212, 0.07657301, -0.9195169, 1, 1, 1, 1, 1,
-1.086046, -0.001770094, -1.199223, 1, 1, 1, 1, 1,
-1.08387, -1.018867, -3.319242, 1, 1, 1, 1, 1,
-1.082658, -0.4768004, -1.616304, 0, 0, 1, 1, 1,
-1.08188, 0.463744, -0.6320601, 1, 0, 0, 1, 1,
-1.081371, -0.5182055, -1.420876, 1, 0, 0, 1, 1,
-1.075473, 0.649891, -0.2819473, 1, 0, 0, 1, 1,
-1.072838, -1.052994, -1.052432, 1, 0, 0, 1, 1,
-1.066606, -0.7922295, -0.8379155, 1, 0, 0, 1, 1,
-1.065877, -0.07872342, -0.437162, 0, 0, 0, 1, 1,
-1.065503, 0.2102298, -1.089813, 0, 0, 0, 1, 1,
-1.056396, 0.3298795, 0.01372337, 0, 0, 0, 1, 1,
-1.053189, -0.3424333, -2.295134, 0, 0, 0, 1, 1,
-1.048623, 0.3737318, -1.101306, 0, 0, 0, 1, 1,
-1.034067, 0.2591806, -1.379525, 0, 0, 0, 1, 1,
-1.032122, -1.266511, -2.918306, 0, 0, 0, 1, 1,
-1.01283, 1.813368, -1.421422, 1, 1, 1, 1, 1,
-1.010917, 0.2049937, -2.198779, 1, 1, 1, 1, 1,
-1.0108, -0.3198237, -1.917048, 1, 1, 1, 1, 1,
-1.009327, 0.5072639, -0.3055907, 1, 1, 1, 1, 1,
-0.9959136, 1.225807, 0.001273237, 1, 1, 1, 1, 1,
-0.995783, 1.179208, -0.4382867, 1, 1, 1, 1, 1,
-0.9893019, -1.090003, -1.891494, 1, 1, 1, 1, 1,
-0.9883009, -0.08554529, -4.182714, 1, 1, 1, 1, 1,
-0.980056, 0.4581986, -0.6810406, 1, 1, 1, 1, 1,
-0.9783599, -0.5926518, -3.315171, 1, 1, 1, 1, 1,
-0.9705761, -0.7034279, -1.59664, 1, 1, 1, 1, 1,
-0.966588, -0.5740625, -3.376526, 1, 1, 1, 1, 1,
-0.9589849, 1.208764, 0.2712236, 1, 1, 1, 1, 1,
-0.9573171, 0.6686825, -2.292425, 1, 1, 1, 1, 1,
-0.9559233, -0.09088045, -2.384239, 1, 1, 1, 1, 1,
-0.9541189, 1.628238, 0.7047595, 0, 0, 1, 1, 1,
-0.9314075, -0.8145162, -1.737743, 1, 0, 0, 1, 1,
-0.9286443, 2.5431, 0.6252778, 1, 0, 0, 1, 1,
-0.9262559, -0.6030753, -1.632206, 1, 0, 0, 1, 1,
-0.9244488, -2.285507, -4.620822, 1, 0, 0, 1, 1,
-0.9051752, 0.6289213, -0.004024066, 1, 0, 0, 1, 1,
-0.9025744, 1.822621, 0.2392885, 0, 0, 0, 1, 1,
-0.8970284, 0.4617935, -0.8367983, 0, 0, 0, 1, 1,
-0.8941795, 1.101622, 0.2767623, 0, 0, 0, 1, 1,
-0.8908098, 0.5039248, -2.184438, 0, 0, 0, 1, 1,
-0.8879843, -0.7918327, -2.637288, 0, 0, 0, 1, 1,
-0.8842848, 0.9743826, 0.3621719, 0, 0, 0, 1, 1,
-0.8762754, -1.794502, -2.031718, 0, 0, 0, 1, 1,
-0.8693373, 0.2349263, -1.434852, 1, 1, 1, 1, 1,
-0.8660571, 0.4418464, -0.323439, 1, 1, 1, 1, 1,
-0.8626361, 0.5226218, -1.656308, 1, 1, 1, 1, 1,
-0.8624059, 0.0964229, -0.3002935, 1, 1, 1, 1, 1,
-0.8559535, -0.1076035, -0.6250594, 1, 1, 1, 1, 1,
-0.8518065, -0.3372487, -1.612136, 1, 1, 1, 1, 1,
-0.8505155, 0.7092739, -2.276789, 1, 1, 1, 1, 1,
-0.8426458, 0.2118533, -1.028253, 1, 1, 1, 1, 1,
-0.8419647, 0.407667, -2.309484, 1, 1, 1, 1, 1,
-0.8286999, -0.03092577, -0.9603034, 1, 1, 1, 1, 1,
-0.8122813, -0.5789264, -1.542815, 1, 1, 1, 1, 1,
-0.8092538, 1.202256, -0.5774663, 1, 1, 1, 1, 1,
-0.8079094, 0.4491096, -2.446714, 1, 1, 1, 1, 1,
-0.8072459, -1.753251, -2.259125, 1, 1, 1, 1, 1,
-0.802174, -0.399725, -2.037489, 1, 1, 1, 1, 1,
-0.7997802, 1.406488, -0.7391372, 0, 0, 1, 1, 1,
-0.7931241, 0.01373668, -1.339394, 1, 0, 0, 1, 1,
-0.7862378, 1.466621, -0.1552139, 1, 0, 0, 1, 1,
-0.7852681, 0.6188398, -1.625844, 1, 0, 0, 1, 1,
-0.7834164, 0.107541, -3.991505, 1, 0, 0, 1, 1,
-0.7794987, -1.157715, -4.804179, 1, 0, 0, 1, 1,
-0.7786106, -0.3269747, -2.252414, 0, 0, 0, 1, 1,
-0.7662882, 0.0446881, -1.341318, 0, 0, 0, 1, 1,
-0.7622749, 1.95313, 1.564748, 0, 0, 0, 1, 1,
-0.758303, 1.000241, -1.758187, 0, 0, 0, 1, 1,
-0.7565606, 1.797483, 0.3414781, 0, 0, 0, 1, 1,
-0.7565593, 1.270369, -0.6177925, 0, 0, 0, 1, 1,
-0.7552048, 1.844445, -0.9221721, 0, 0, 0, 1, 1,
-0.7509458, 1.679338, -2.132731, 1, 1, 1, 1, 1,
-0.7464147, 0.04777291, -1.520141, 1, 1, 1, 1, 1,
-0.7436495, 0.5882091, -0.8416798, 1, 1, 1, 1, 1,
-0.7409028, 0.3849632, -1.187587, 1, 1, 1, 1, 1,
-0.7406932, 0.4393804, -0.544892, 1, 1, 1, 1, 1,
-0.7374445, -1.334944, -3.489348, 1, 1, 1, 1, 1,
-0.7365833, 1.264321, -1.013848, 1, 1, 1, 1, 1,
-0.7305219, 0.8487287, -0.5981033, 1, 1, 1, 1, 1,
-0.726373, -1.012578, -1.687875, 1, 1, 1, 1, 1,
-0.7255358, 0.6183522, -0.5651944, 1, 1, 1, 1, 1,
-0.7238192, -0.05690549, -2.226981, 1, 1, 1, 1, 1,
-0.7146741, -0.8795891, -0.5229896, 1, 1, 1, 1, 1,
-0.7083354, 1.996878, -1.65629, 1, 1, 1, 1, 1,
-0.7039019, -1.53955, -3.224455, 1, 1, 1, 1, 1,
-0.7025886, -0.1162087, -0.6900142, 1, 1, 1, 1, 1,
-0.6952107, -0.7500449, -2.010896, 0, 0, 1, 1, 1,
-0.6927094, 0.3269514, -2.377218, 1, 0, 0, 1, 1,
-0.6914117, 0.8777023, -0.2278135, 1, 0, 0, 1, 1,
-0.6906922, -1.491928, -2.903594, 1, 0, 0, 1, 1,
-0.6898202, 0.02658066, -1.362038, 1, 0, 0, 1, 1,
-0.6896518, 0.890882, -1.035688, 1, 0, 0, 1, 1,
-0.6891516, -0.4709526, -3.391788, 0, 0, 0, 1, 1,
-0.6881252, -0.0425874, -0.04730643, 0, 0, 0, 1, 1,
-0.6870083, -1.000291, -1.926936, 0, 0, 0, 1, 1,
-0.683253, 1.563496, -0.3020281, 0, 0, 0, 1, 1,
-0.6758783, 0.9312198, -1.003278, 0, 0, 0, 1, 1,
-0.6686112, -0.7957749, -2.44284, 0, 0, 0, 1, 1,
-0.6676199, 0.07492301, -1.979693, 0, 0, 0, 1, 1,
-0.6666324, -0.1638489, -2.612856, 1, 1, 1, 1, 1,
-0.6642309, 1.91474, -0.7403867, 1, 1, 1, 1, 1,
-0.6616897, -1.1141, -4.111381, 1, 1, 1, 1, 1,
-0.6605763, 0.5939004, -0.3738736, 1, 1, 1, 1, 1,
-0.6552369, 0.1084436, -1.449389, 1, 1, 1, 1, 1,
-0.6549135, 0.3989612, 0.5187842, 1, 1, 1, 1, 1,
-0.6535218, -1.185367, -4.677032, 1, 1, 1, 1, 1,
-0.6516597, 0.02908512, -1.142736, 1, 1, 1, 1, 1,
-0.6465611, 0.1357149, -0.7726161, 1, 1, 1, 1, 1,
-0.6462588, -0.1357798, -1.912721, 1, 1, 1, 1, 1,
-0.6455213, -0.05873393, -1.577821, 1, 1, 1, 1, 1,
-0.6440747, -0.556544, -0.2302475, 1, 1, 1, 1, 1,
-0.6435612, 1.091576, -0.273325, 1, 1, 1, 1, 1,
-0.6435564, 0.8647007, -1.692764, 1, 1, 1, 1, 1,
-0.6237686, -0.1735063, -1.815663, 1, 1, 1, 1, 1,
-0.6209847, 1.621402, -1.600715, 0, 0, 1, 1, 1,
-0.6180902, 1.02644, -0.4584118, 1, 0, 0, 1, 1,
-0.6155646, -0.2133019, -0.4678548, 1, 0, 0, 1, 1,
-0.6151825, -1.282902, -5.232635, 1, 0, 0, 1, 1,
-0.6135991, 0.8914934, 0.4597557, 1, 0, 0, 1, 1,
-0.6111237, 0.6145011, -0.6312762, 1, 0, 0, 1, 1,
-0.6069819, 0.06116142, -1.491186, 0, 0, 0, 1, 1,
-0.6056376, 1.550088, -2.093109, 0, 0, 0, 1, 1,
-0.6037284, -0.9719141, -2.04233, 0, 0, 0, 1, 1,
-0.6029467, 0.1591435, 0.6908705, 0, 0, 0, 1, 1,
-0.6019985, -0.2075658, -2.303715, 0, 0, 0, 1, 1,
-0.5998511, -1.688411, -3.751955, 0, 0, 0, 1, 1,
-0.5985878, 0.8092255, 0.8006319, 0, 0, 0, 1, 1,
-0.5981047, 1.24481, 0.8628022, 1, 1, 1, 1, 1,
-0.5978153, -1.980119, -3.209578, 1, 1, 1, 1, 1,
-0.5974712, 0.1517174, 0.9782368, 1, 1, 1, 1, 1,
-0.5913714, 0.2094101, -2.221801, 1, 1, 1, 1, 1,
-0.5864952, 1.868909, -0.365211, 1, 1, 1, 1, 1,
-0.584433, -0.04750428, -2.071448, 1, 1, 1, 1, 1,
-0.5689997, 2.036083, -2.199786, 1, 1, 1, 1, 1,
-0.5683501, 0.5037493, -0.2363514, 1, 1, 1, 1, 1,
-0.567508, 1.456992, -0.3545981, 1, 1, 1, 1, 1,
-0.566565, 0.4852493, -1.182655, 1, 1, 1, 1, 1,
-0.5665103, -0.8533509, -1.808419, 1, 1, 1, 1, 1,
-0.5564046, 0.4175774, -0.5387226, 1, 1, 1, 1, 1,
-0.5541947, 0.8137257, 0.1421855, 1, 1, 1, 1, 1,
-0.5541191, 1.20819, 0.4006326, 1, 1, 1, 1, 1,
-0.5511648, 2.157604, 1.268519, 1, 1, 1, 1, 1,
-0.5418551, 1.1119, 0.5455343, 0, 0, 1, 1, 1,
-0.5330694, 0.001056469, -0.7570724, 1, 0, 0, 1, 1,
-0.5316242, 0.8334734, -0.5995601, 1, 0, 0, 1, 1,
-0.5313461, -1.070487, -1.417413, 1, 0, 0, 1, 1,
-0.5257846, 1.089927, 0.3328781, 1, 0, 0, 1, 1,
-0.523042, 1.141981, 1.156815, 1, 0, 0, 1, 1,
-0.5230303, -1.488891, -2.178482, 0, 0, 0, 1, 1,
-0.5202774, -0.6329467, -1.700531, 0, 0, 0, 1, 1,
-0.5195482, -0.09481685, -2.534814, 0, 0, 0, 1, 1,
-0.5170618, -0.3695121, -0.8479584, 0, 0, 0, 1, 1,
-0.5163161, -0.6863292, -1.25133, 0, 0, 0, 1, 1,
-0.513111, -1.630523, -4.104629, 0, 0, 0, 1, 1,
-0.5106125, -0.4490418, -1.705299, 0, 0, 0, 1, 1,
-0.5098416, 1.277516, -1.447788, 1, 1, 1, 1, 1,
-0.5090934, -0.04782199, -1.686708, 1, 1, 1, 1, 1,
-0.5070396, 0.1250444, -0.6260775, 1, 1, 1, 1, 1,
-0.5058377, -0.4659503, -3.037778, 1, 1, 1, 1, 1,
-0.4978455, -1.395863, -3.38692, 1, 1, 1, 1, 1,
-0.4925085, 0.5364392, -0.366435, 1, 1, 1, 1, 1,
-0.4899373, 1.609733, 0.4735322, 1, 1, 1, 1, 1,
-0.4853896, 0.008416051, -1.449842, 1, 1, 1, 1, 1,
-0.4845585, -0.9470187, -1.498657, 1, 1, 1, 1, 1,
-0.4797767, -0.8815234, -1.465062, 1, 1, 1, 1, 1,
-0.4788264, -0.2305599, -1.034007, 1, 1, 1, 1, 1,
-0.4780959, 1.222437, 0.2198201, 1, 1, 1, 1, 1,
-0.4738325, 0.2788501, -1.059736, 1, 1, 1, 1, 1,
-0.4736845, -0.8769909, -1.510056, 1, 1, 1, 1, 1,
-0.4732936, -0.07375588, -1.873765, 1, 1, 1, 1, 1,
-0.4715573, -0.1103855, -0.1764514, 0, 0, 1, 1, 1,
-0.4694539, -2.041649, -3.525536, 1, 0, 0, 1, 1,
-0.4639573, 0.8587147, -1.480059, 1, 0, 0, 1, 1,
-0.4623284, -0.2376334, -0.4546564, 1, 0, 0, 1, 1,
-0.4549662, -1.45922, -4.177737, 1, 0, 0, 1, 1,
-0.4546176, 0.1497376, -1.295715, 1, 0, 0, 1, 1,
-0.4499573, -1.970961, -3.706277, 0, 0, 0, 1, 1,
-0.4476794, -0.3664385, -2.124029, 0, 0, 0, 1, 1,
-0.4469247, 0.9134058, 0.5072072, 0, 0, 0, 1, 1,
-0.4383633, -0.2761327, -2.716829, 0, 0, 0, 1, 1,
-0.438287, -0.2143839, -0.451901, 0, 0, 0, 1, 1,
-0.435323, 0.8208889, 0.6032252, 0, 0, 0, 1, 1,
-0.4346444, 0.1034484, -0.7125317, 0, 0, 0, 1, 1,
-0.4333167, 0.4266183, -0.3583502, 1, 1, 1, 1, 1,
-0.4328386, -0.3286563, -2.388234, 1, 1, 1, 1, 1,
-0.4302215, -0.3458798, -2.014692, 1, 1, 1, 1, 1,
-0.424218, -1.034008, -1.357422, 1, 1, 1, 1, 1,
-0.4240311, -0.5354989, -2.104343, 1, 1, 1, 1, 1,
-0.4184101, -1.098935, -3.924792, 1, 1, 1, 1, 1,
-0.4175865, 1.192544, -2.803689, 1, 1, 1, 1, 1,
-0.4157583, 0.8812685, 0.1412983, 1, 1, 1, 1, 1,
-0.4094487, 1.518826, -0.5984665, 1, 1, 1, 1, 1,
-0.4087389, 0.4797877, 0.1139697, 1, 1, 1, 1, 1,
-0.3997895, -0.2326944, -1.83107, 1, 1, 1, 1, 1,
-0.3961924, -0.8734598, -1.648316, 1, 1, 1, 1, 1,
-0.3961539, -1.104545, -3.415312, 1, 1, 1, 1, 1,
-0.3941623, 0.6497761, -1.830546, 1, 1, 1, 1, 1,
-0.3898657, 1.542687, 1.095358, 1, 1, 1, 1, 1,
-0.385792, 1.433742, -1.822666, 0, 0, 1, 1, 1,
-0.3848749, 1.651723, -0.04249444, 1, 0, 0, 1, 1,
-0.3796472, 1.839822, -1.609539, 1, 0, 0, 1, 1,
-0.378119, 0.4962476, -0.9242749, 1, 0, 0, 1, 1,
-0.3759341, 0.1741608, 0.3602986, 1, 0, 0, 1, 1,
-0.3753507, -1.071743, -3.14625, 1, 0, 0, 1, 1,
-0.3752278, 0.2127011, 0.1305657, 0, 0, 0, 1, 1,
-0.3740876, 1.217549, -0.6456277, 0, 0, 0, 1, 1,
-0.3725152, 0.3343076, -1.277981, 0, 0, 0, 1, 1,
-0.3721755, 0.4043913, 0.1229418, 0, 0, 0, 1, 1,
-0.3699001, -0.1583404, -0.8024666, 0, 0, 0, 1, 1,
-0.3697709, -1.816671, -3.658867, 0, 0, 0, 1, 1,
-0.3674025, 0.09264654, -2.39203, 0, 0, 0, 1, 1,
-0.3639332, -1.265333, -2.964494, 1, 1, 1, 1, 1,
-0.3637554, -0.007220165, -0.637929, 1, 1, 1, 1, 1,
-0.363161, 1.162313, 0.4959588, 1, 1, 1, 1, 1,
-0.3610864, -0.1280818, -1.630346, 1, 1, 1, 1, 1,
-0.3581605, 1.185246, -0.6254811, 1, 1, 1, 1, 1,
-0.3576102, -0.4594063, -1.847553, 1, 1, 1, 1, 1,
-0.3562891, -1.088734, -2.677646, 1, 1, 1, 1, 1,
-0.3556173, 1.892318, 0.3189812, 1, 1, 1, 1, 1,
-0.3554177, 0.02705942, -1.137304, 1, 1, 1, 1, 1,
-0.3518829, -0.1411188, -2.105139, 1, 1, 1, 1, 1,
-0.3482156, -0.3682316, -2.166061, 1, 1, 1, 1, 1,
-0.3452837, -0.903018, -1.4283, 1, 1, 1, 1, 1,
-0.3440054, -0.3855205, -2.526691, 1, 1, 1, 1, 1,
-0.3409221, 0.4415278, -1.144741, 1, 1, 1, 1, 1,
-0.338499, 0.5389308, 0.801114, 1, 1, 1, 1, 1,
-0.3383651, 0.2299879, 0.2069637, 0, 0, 1, 1, 1,
-0.338353, -1.191071, -3.828672, 1, 0, 0, 1, 1,
-0.3329865, 0.6401547, -1.236396, 1, 0, 0, 1, 1,
-0.3317351, -1.034764, -2.340999, 1, 0, 0, 1, 1,
-0.3316578, -1.323226, -3.759496, 1, 0, 0, 1, 1,
-0.3305412, -2.024918, -2.178098, 1, 0, 0, 1, 1,
-0.3292458, -2.638941, -4.118709, 0, 0, 0, 1, 1,
-0.3284605, -0.5886955, -2.575948, 0, 0, 0, 1, 1,
-0.3251038, -0.3744219, -2.129191, 0, 0, 0, 1, 1,
-0.323592, -1.120714, -3.274468, 0, 0, 0, 1, 1,
-0.3231204, -0.8012511, -2.437157, 0, 0, 0, 1, 1,
-0.3212078, 0.1048507, -0.1637061, 0, 0, 0, 1, 1,
-0.3191923, -1.097979, -0.8307139, 0, 0, 0, 1, 1,
-0.3171948, -1.417465, -2.122275, 1, 1, 1, 1, 1,
-0.3153045, 0.85071, -0.4626412, 1, 1, 1, 1, 1,
-0.3129598, 0.7425591, 0.3095659, 1, 1, 1, 1, 1,
-0.3094924, -1.308166, -3.096319, 1, 1, 1, 1, 1,
-0.3075007, 0.2575074, -0.1980628, 1, 1, 1, 1, 1,
-0.3007733, 0.6557229, 0.1267814, 1, 1, 1, 1, 1,
-0.2984044, 0.4520842, -1.049044, 1, 1, 1, 1, 1,
-0.2983381, 0.3386507, -1.722628, 1, 1, 1, 1, 1,
-0.2979201, -0.2705067, -2.564348, 1, 1, 1, 1, 1,
-0.2938984, -0.7617137, -3.117875, 1, 1, 1, 1, 1,
-0.291636, 1.268134, -0.6870196, 1, 1, 1, 1, 1,
-0.2894644, -0.3229163, -3.849667, 1, 1, 1, 1, 1,
-0.2885891, 0.7155889, -0.01242587, 1, 1, 1, 1, 1,
-0.286388, 0.1393616, -0.828186, 1, 1, 1, 1, 1,
-0.2841113, 0.4957977, -0.9703062, 1, 1, 1, 1, 1,
-0.2798255, 0.07583301, -0.1928669, 0, 0, 1, 1, 1,
-0.2790268, -0.5598841, -2.998022, 1, 0, 0, 1, 1,
-0.2769912, 1.166586, -1.030813, 1, 0, 0, 1, 1,
-0.2758112, 1.415663, -1.536817, 1, 0, 0, 1, 1,
-0.2704962, 0.0800079, -1.790724, 1, 0, 0, 1, 1,
-0.2702112, -0.1966356, -2.349744, 1, 0, 0, 1, 1,
-0.2634309, 0.8440058, -1.459095, 0, 0, 0, 1, 1,
-0.2620053, 0.9185264, -0.139968, 0, 0, 0, 1, 1,
-0.2580452, 0.6514818, -0.3545684, 0, 0, 0, 1, 1,
-0.2549143, 0.4915763, 1.066089, 0, 0, 0, 1, 1,
-0.2506401, -0.1466337, -2.599631, 0, 0, 0, 1, 1,
-0.2439133, 0.7340268, 1.634221, 0, 0, 0, 1, 1,
-0.2438645, 1.15247, 0.3969943, 0, 0, 0, 1, 1,
-0.2390329, -0.103463, -3.188606, 1, 1, 1, 1, 1,
-0.2357055, -0.498002, -0.8250403, 1, 1, 1, 1, 1,
-0.2323816, 0.2560774, -0.8743072, 1, 1, 1, 1, 1,
-0.2143873, 1.431102, -0.3255254, 1, 1, 1, 1, 1,
-0.2141355, 0.2297134, 0.4659859, 1, 1, 1, 1, 1,
-0.2121729, 0.5832558, -1.867228, 1, 1, 1, 1, 1,
-0.2104418, 1.350535, -1.639154, 1, 1, 1, 1, 1,
-0.2035645, -0.05269799, -0.5928553, 1, 1, 1, 1, 1,
-0.2033814, 1.019848, 0.5175631, 1, 1, 1, 1, 1,
-0.1973278, -0.4656148, -2.00631, 1, 1, 1, 1, 1,
-0.1937956, 1.259647, -1.925779, 1, 1, 1, 1, 1,
-0.1935809, -1.752394, -2.453377, 1, 1, 1, 1, 1,
-0.1922497, -2.237285, -3.929487, 1, 1, 1, 1, 1,
-0.1870171, -0.2698221, -2.872877, 1, 1, 1, 1, 1,
-0.1867386, 2.4945, -1.368187, 1, 1, 1, 1, 1,
-0.1859816, 1.379999, -0.223703, 0, 0, 1, 1, 1,
-0.1812635, -0.7154831, -2.607704, 1, 0, 0, 1, 1,
-0.1787746, 1.405278, -0.2863317, 1, 0, 0, 1, 1,
-0.176459, 0.3163681, 1.161201, 1, 0, 0, 1, 1,
-0.1737591, 0.2912378, -0.9365571, 1, 0, 0, 1, 1,
-0.1710123, 1.036577, 1.851951, 1, 0, 0, 1, 1,
-0.1669328, -0.4349812, -3.398456, 0, 0, 0, 1, 1,
-0.1566368, 0.2183879, -0.1315205, 0, 0, 0, 1, 1,
-0.1515596, -0.303835, -1.755762, 0, 0, 0, 1, 1,
-0.1507165, 0.8120512, -1.148494, 0, 0, 0, 1, 1,
-0.1458146, -0.5304812, -2.803436, 0, 0, 0, 1, 1,
-0.1455601, 0.7341406, 0.4012665, 0, 0, 0, 1, 1,
-0.1452577, 0.5303566, -0.1062525, 0, 0, 0, 1, 1,
-0.1440186, -0.120267, -2.727689, 1, 1, 1, 1, 1,
-0.1424743, -0.2365246, -1.3293, 1, 1, 1, 1, 1,
-0.1421358, -0.5752799, -3.341444, 1, 1, 1, 1, 1,
-0.1401403, -0.2754031, -3.329141, 1, 1, 1, 1, 1,
-0.1330913, 0.05806662, -1.762932, 1, 1, 1, 1, 1,
-0.1315246, -0.2614885, -1.307102, 1, 1, 1, 1, 1,
-0.1299645, 1.735464, 0.133304, 1, 1, 1, 1, 1,
-0.1287785, 0.002264201, -1.745999, 1, 1, 1, 1, 1,
-0.1278389, 0.2188395, -0.0896593, 1, 1, 1, 1, 1,
-0.1269475, 0.5489299, -0.1903311, 1, 1, 1, 1, 1,
-0.1257774, 0.4925122, 0.2743069, 1, 1, 1, 1, 1,
-0.1251953, -0.4130844, -2.956973, 1, 1, 1, 1, 1,
-0.1251411, -0.4876831, -2.161808, 1, 1, 1, 1, 1,
-0.1237374, -0.2025378, -3.343231, 1, 1, 1, 1, 1,
-0.1229652, 0.2355315, 0.5720362, 1, 1, 1, 1, 1,
-0.1218505, 1.836305, -0.26086, 0, 0, 1, 1, 1,
-0.1205048, -0.9574879, -2.329758, 1, 0, 0, 1, 1,
-0.1194618, 1.903669, 1.150676, 1, 0, 0, 1, 1,
-0.1150217, 0.3146769, 0.4764121, 1, 0, 0, 1, 1,
-0.1146258, -0.7458543, -3.067851, 1, 0, 0, 1, 1,
-0.1134551, 1.988564, -0.2738276, 1, 0, 0, 1, 1,
-0.1113044, 1.86755, 0.9654888, 0, 0, 0, 1, 1,
-0.1101494, 1.629308, 0.2990514, 0, 0, 0, 1, 1,
-0.1068278, -0.3528566, -2.916761, 0, 0, 0, 1, 1,
-0.1064151, 1.507329, 0.0002256714, 0, 0, 0, 1, 1,
-0.104948, 0.6832763, -0.2465417, 0, 0, 0, 1, 1,
-0.1032976, 2.080057, 0.07442585, 0, 0, 0, 1, 1,
-0.1032543, 0.8821945, 0.2830828, 0, 0, 0, 1, 1,
-0.1031519, 1.359884, -0.5301489, 1, 1, 1, 1, 1,
-0.09816948, 0.3092748, -2.070481, 1, 1, 1, 1, 1,
-0.08977222, -0.3448764, -1.892391, 1, 1, 1, 1, 1,
-0.0879905, 0.8391747, 0.702894, 1, 1, 1, 1, 1,
-0.08369735, 0.371283, 1.25278, 1, 1, 1, 1, 1,
-0.07534607, -0.3401611, -3.773208, 1, 1, 1, 1, 1,
-0.0719028, 0.2959142, 1.031897, 1, 1, 1, 1, 1,
-0.0702387, -0.02974968, -1.043362, 1, 1, 1, 1, 1,
-0.07020827, -1.414016, -2.630753, 1, 1, 1, 1, 1,
-0.06915007, -0.7586535, -2.610837, 1, 1, 1, 1, 1,
-0.06316038, -0.7212873, -4.64889, 1, 1, 1, 1, 1,
-0.06091089, 0.9301325, -0.8979656, 1, 1, 1, 1, 1,
-0.05756512, 0.3484557, 1.82124, 1, 1, 1, 1, 1,
-0.05723326, 0.04058171, -0.7403144, 1, 1, 1, 1, 1,
-0.05693721, 0.397789, 0.4700887, 1, 1, 1, 1, 1,
-0.05608294, 1.547693, 1.962679, 0, 0, 1, 1, 1,
-0.0528776, 1.34366, -0.4933413, 1, 0, 0, 1, 1,
-0.05001946, 0.3863632, -0.7690148, 1, 0, 0, 1, 1,
-0.03571368, 2.025392, 1.191179, 1, 0, 0, 1, 1,
-0.03554831, -0.4939522, -2.095601, 1, 0, 0, 1, 1,
-0.03142716, -0.5460002, -2.540018, 1, 0, 0, 1, 1,
-0.02846298, 0.03529499, -1.297078, 0, 0, 0, 1, 1,
-0.02310705, 0.4345535, 0.397562, 0, 0, 0, 1, 1,
-0.0210694, 0.7548962, 0.08004224, 0, 0, 0, 1, 1,
-0.01940988, -0.632238, -3.092591, 0, 0, 0, 1, 1,
-0.01694417, 1.100475, -1.102218, 0, 0, 0, 1, 1,
-0.01452603, -0.8755271, -2.130871, 0, 0, 0, 1, 1,
-0.009179919, 1.195482, -0.748515, 0, 0, 0, 1, 1,
-0.007563564, 1.39285, -0.2961131, 1, 1, 1, 1, 1,
-0.004073843, 0.1180732, -0.6493247, 1, 1, 1, 1, 1,
0.002718204, 1.764753, 0.7682225, 1, 1, 1, 1, 1,
0.003754671, -0.04018206, 3.233172, 1, 1, 1, 1, 1,
0.006518537, 0.3864463, 2.176826, 1, 1, 1, 1, 1,
0.008201938, 0.2312339, 0.1369744, 1, 1, 1, 1, 1,
0.01161951, -0.8550115, 4.407543, 1, 1, 1, 1, 1,
0.01187847, -1.030219, 3.767309, 1, 1, 1, 1, 1,
0.01558665, 0.04140893, 1.748971, 1, 1, 1, 1, 1,
0.01738691, -1.187055, 3.317165, 1, 1, 1, 1, 1,
0.02285126, 1.358425, -0.3474422, 1, 1, 1, 1, 1,
0.0230942, -0.5169681, 3.305768, 1, 1, 1, 1, 1,
0.02483192, 0.5812792, 1.425454, 1, 1, 1, 1, 1,
0.0258904, -0.8756498, 4.149992, 1, 1, 1, 1, 1,
0.03030477, -0.1291423, 3.556424, 1, 1, 1, 1, 1,
0.03051421, 1.363434, 0.7639142, 0, 0, 1, 1, 1,
0.03114399, -0.8187769, 1.062417, 1, 0, 0, 1, 1,
0.03175397, 0.05070927, 0.1864755, 1, 0, 0, 1, 1,
0.03429144, 1.36748, 0.09425854, 1, 0, 0, 1, 1,
0.03547679, 0.4960187, -1.368524, 1, 0, 0, 1, 1,
0.03990427, 0.9522299, 0.7776031, 1, 0, 0, 1, 1,
0.04610687, -0.3099819, 1.704904, 0, 0, 0, 1, 1,
0.04659383, -1.241542, 4.701041, 0, 0, 0, 1, 1,
0.05148439, -2.079249, 4.648875, 0, 0, 0, 1, 1,
0.05384901, 0.5392364, -0.06587768, 0, 0, 0, 1, 1,
0.05528351, 0.4802181, 0.8559203, 0, 0, 0, 1, 1,
0.05654611, 0.6595365, -0.1615786, 0, 0, 0, 1, 1,
0.05694357, -1.379192, 2.774965, 0, 0, 0, 1, 1,
0.06064915, -0.956534, 2.187412, 1, 1, 1, 1, 1,
0.06114411, 0.6748544, 0.2725094, 1, 1, 1, 1, 1,
0.06574056, 1.354948, 0.07884475, 1, 1, 1, 1, 1,
0.06743807, 1.150283, -0.4337625, 1, 1, 1, 1, 1,
0.07039276, 0.07972801, 1.27673, 1, 1, 1, 1, 1,
0.07099713, 0.4566716, -0.454996, 1, 1, 1, 1, 1,
0.07538068, -0.1450193, 1.915684, 1, 1, 1, 1, 1,
0.08251987, -0.8538009, 3.516217, 1, 1, 1, 1, 1,
0.08301944, 0.6660323, 1.115917, 1, 1, 1, 1, 1,
0.08531243, 0.8340834, -0.5519294, 1, 1, 1, 1, 1,
0.08666772, 1.318137, 2.506923, 1, 1, 1, 1, 1,
0.08672465, 0.736734, -0.7277122, 1, 1, 1, 1, 1,
0.08721287, 2.291653, -0.1060463, 1, 1, 1, 1, 1,
0.09223623, -0.7591942, 2.265387, 1, 1, 1, 1, 1,
0.09402491, -0.3796425, 1.666329, 1, 1, 1, 1, 1,
0.09602484, -1.660384, 4.167681, 0, 0, 1, 1, 1,
0.1035874, 1.368737, 0.4406776, 1, 0, 0, 1, 1,
0.1052318, 1.421114, 0.6350845, 1, 0, 0, 1, 1,
0.1096004, 0.2300218, 0.6244817, 1, 0, 0, 1, 1,
0.1098545, 0.3086644, 2.351858, 1, 0, 0, 1, 1,
0.11223, -0.9734935, 2.88021, 1, 0, 0, 1, 1,
0.1127183, -0.431272, 4.333065, 0, 0, 0, 1, 1,
0.1150991, -0.3190867, 1.984558, 0, 0, 0, 1, 1,
0.1208996, -0.7116135, 3.106769, 0, 0, 0, 1, 1,
0.1214871, -1.750186, 3.829697, 0, 0, 0, 1, 1,
0.1215239, 1.423923, -0.3453984, 0, 0, 0, 1, 1,
0.125275, -0.02554899, 0.6362605, 0, 0, 0, 1, 1,
0.1264218, 0.443012, 0.9834767, 0, 0, 0, 1, 1,
0.1332908, 1.368564, 1.850932, 1, 1, 1, 1, 1,
0.1341012, -0.2662094, 3.306656, 1, 1, 1, 1, 1,
0.1379559, -1.838022, 2.511309, 1, 1, 1, 1, 1,
0.1380927, -0.06540231, 2.704452, 1, 1, 1, 1, 1,
0.140487, -0.6439933, 1.920628, 1, 1, 1, 1, 1,
0.1415278, -0.9995651, 2.6696, 1, 1, 1, 1, 1,
0.1466149, -0.4210038, 1.838874, 1, 1, 1, 1, 1,
0.1528207, -0.09937904, 0.5924593, 1, 1, 1, 1, 1,
0.1548277, 2.101591, -0.04182165, 1, 1, 1, 1, 1,
0.1575611, 1.884625, 0.4749053, 1, 1, 1, 1, 1,
0.1576092, -0.1577479, 0.9884915, 1, 1, 1, 1, 1,
0.1593421, 1.668427, -0.1231274, 1, 1, 1, 1, 1,
0.1787113, -0.0317019, 2.232867, 1, 1, 1, 1, 1,
0.1830722, 0.9701736, 0.2311931, 1, 1, 1, 1, 1,
0.1860881, -1.718952, 4.10767, 1, 1, 1, 1, 1,
0.1912574, 0.8802806, -0.9609838, 0, 0, 1, 1, 1,
0.1968295, 0.217059, 0.3981693, 1, 0, 0, 1, 1,
0.1974804, -0.7975582, 2.569953, 1, 0, 0, 1, 1,
0.1981612, -1.821233, 2.502103, 1, 0, 0, 1, 1,
0.1990992, 0.7625872, 0.08817836, 1, 0, 0, 1, 1,
0.2001329, 0.1603573, 0.2909903, 1, 0, 0, 1, 1,
0.2045796, -1.387183, 2.52174, 0, 0, 0, 1, 1,
0.2117303, 0.885052, -0.7042568, 0, 0, 0, 1, 1,
0.2120768, 0.9926108, 0.2147653, 0, 0, 0, 1, 1,
0.2159049, 0.685971, 1.39546, 0, 0, 0, 1, 1,
0.2162007, -1.841679, 2.125955, 0, 0, 0, 1, 1,
0.2167842, 0.872704, 0.614844, 0, 0, 0, 1, 1,
0.2174728, 2.95622, 0.1856184, 0, 0, 0, 1, 1,
0.2198071, 0.5427719, -0.8675767, 1, 1, 1, 1, 1,
0.2378824, 0.5610827, 0.4313881, 1, 1, 1, 1, 1,
0.2381295, -1.39691, 4.151644, 1, 1, 1, 1, 1,
0.2493799, 2.048812, -0.7005758, 1, 1, 1, 1, 1,
0.2583026, 0.8292733, 0.6561742, 1, 1, 1, 1, 1,
0.2615114, 0.8845282, -0.4515465, 1, 1, 1, 1, 1,
0.2641186, -1.847664, 4.565955, 1, 1, 1, 1, 1,
0.2642167, -0.5914479, 2.543587, 1, 1, 1, 1, 1,
0.2716526, 0.911429, -0.2836094, 1, 1, 1, 1, 1,
0.2723942, 0.1774167, 0.2448816, 1, 1, 1, 1, 1,
0.2740679, -1.180241, 4.837624, 1, 1, 1, 1, 1,
0.2741559, -0.3232957, 3.870834, 1, 1, 1, 1, 1,
0.27497, 0.02888875, 1.531564, 1, 1, 1, 1, 1,
0.2776083, 0.3373993, 1.313644, 1, 1, 1, 1, 1,
0.2805714, -0.1366534, 1.000636, 1, 1, 1, 1, 1,
0.2806355, 0.6049284, 0.1300505, 0, 0, 1, 1, 1,
0.2823703, -0.3192884, 1.263646, 1, 0, 0, 1, 1,
0.2829759, -1.282549, 2.938641, 1, 0, 0, 1, 1,
0.2874976, -0.6013118, 3.479137, 1, 0, 0, 1, 1,
0.2929682, -2.271405, 4.382535, 1, 0, 0, 1, 1,
0.295272, 0.007875635, 1.455338, 1, 0, 0, 1, 1,
0.299136, -0.6511778, 1.335764, 0, 0, 0, 1, 1,
0.3006267, -0.09848496, 2.602093, 0, 0, 0, 1, 1,
0.3054604, -0.4594291, 2.991699, 0, 0, 0, 1, 1,
0.3098886, 0.3316521, 2.15585, 0, 0, 0, 1, 1,
0.3104134, -1.448179, 1.999861, 0, 0, 0, 1, 1,
0.3113168, 1.154974, -0.5684313, 0, 0, 0, 1, 1,
0.3126349, 0.005784248, 0.5576103, 0, 0, 0, 1, 1,
0.3141138, 0.4733649, 0.05371072, 1, 1, 1, 1, 1,
0.3141158, -0.8421859, 0.8316043, 1, 1, 1, 1, 1,
0.3142757, 0.4815382, 0.6037464, 1, 1, 1, 1, 1,
0.3182634, 0.9484245, -0.4893543, 1, 1, 1, 1, 1,
0.3213071, 0.04584575, 2.435378, 1, 1, 1, 1, 1,
0.3219939, -0.7565252, 2.562788, 1, 1, 1, 1, 1,
0.3244031, -0.6355034, 1.108048, 1, 1, 1, 1, 1,
0.3254329, -0.6761231, 0.09510551, 1, 1, 1, 1, 1,
0.3262549, 1.536963, 1.541965, 1, 1, 1, 1, 1,
0.326268, 0.3382575, 1.09583, 1, 1, 1, 1, 1,
0.3311075, -0.7916716, 1.70001, 1, 1, 1, 1, 1,
0.3328135, -0.9881057, 3.869251, 1, 1, 1, 1, 1,
0.3376053, 0.4254257, 0.6353, 1, 1, 1, 1, 1,
0.3378838, -1.185829, 1.35594, 1, 1, 1, 1, 1,
0.3406884, -0.1466804, 2.331301, 1, 1, 1, 1, 1,
0.342313, 1.071468, -0.5873207, 0, 0, 1, 1, 1,
0.3424153, -1.555258, 3.021206, 1, 0, 0, 1, 1,
0.3424313, 0.5585856, 0.6600193, 1, 0, 0, 1, 1,
0.3436424, 0.8923213, -1.820595, 1, 0, 0, 1, 1,
0.3461587, -0.8392131, 3.480323, 1, 0, 0, 1, 1,
0.3510956, 0.8676918, -1.054898, 1, 0, 0, 1, 1,
0.3562426, -0.6181755, 3.126861, 0, 0, 0, 1, 1,
0.3589483, -0.869613, 2.316885, 0, 0, 0, 1, 1,
0.3599499, -0.7143694, 1.881164, 0, 0, 0, 1, 1,
0.3625728, -0.6494788, 2.24681, 0, 0, 0, 1, 1,
0.3705782, -0.3257194, 2.48126, 0, 0, 0, 1, 1,
0.3721842, 0.1382474, 2.273043, 0, 0, 0, 1, 1,
0.3725802, 0.008681084, 0.6862234, 0, 0, 0, 1, 1,
0.3745129, 1.380562, 1.657428, 1, 1, 1, 1, 1,
0.3747031, 1.308184, 0.1045066, 1, 1, 1, 1, 1,
0.3763643, -0.2578972, 0.6335632, 1, 1, 1, 1, 1,
0.380202, -0.4499625, 3.04544, 1, 1, 1, 1, 1,
0.3814397, -0.8273422, 2.008887, 1, 1, 1, 1, 1,
0.3817186, -0.04403019, 1.966572, 1, 1, 1, 1, 1,
0.3817198, -1.530324, 0.271685, 1, 1, 1, 1, 1,
0.3845402, -1.43926, 3.313628, 1, 1, 1, 1, 1,
0.3877313, -0.1985795, 0.931922, 1, 1, 1, 1, 1,
0.3893329, -0.4892365, 0.7205952, 1, 1, 1, 1, 1,
0.3925085, -0.2261279, 0.841688, 1, 1, 1, 1, 1,
0.3927844, -0.8355611, 3.539058, 1, 1, 1, 1, 1,
0.3949666, -0.635442, 2.447686, 1, 1, 1, 1, 1,
0.4014636, -0.6185058, 4.425679, 1, 1, 1, 1, 1,
0.4058564, -0.2423542, 1.724962, 1, 1, 1, 1, 1,
0.410156, -0.8507489, 4.0869, 0, 0, 1, 1, 1,
0.4162511, 1.262349, -0.5153807, 1, 0, 0, 1, 1,
0.4175348, 0.6685121, 0.5362821, 1, 0, 0, 1, 1,
0.4192829, -0.7715812, 1.990499, 1, 0, 0, 1, 1,
0.4196205, 0.1041782, 1.272847, 1, 0, 0, 1, 1,
0.4261853, -0.4350117, 2.63548, 1, 0, 0, 1, 1,
0.426282, -0.1614264, 2.088886, 0, 0, 0, 1, 1,
0.4276175, -0.6157709, 2.544747, 0, 0, 0, 1, 1,
0.4284161, -1.054191, 2.68882, 0, 0, 0, 1, 1,
0.4299191, -1.324431, 3.698138, 0, 0, 0, 1, 1,
0.4362019, 1.460783, -0.6274571, 0, 0, 0, 1, 1,
0.4370196, -3.113332, 3.018255, 0, 0, 0, 1, 1,
0.4391362, -0.7081519, 4.121548, 0, 0, 0, 1, 1,
0.440472, -0.4428963, 2.880375, 1, 1, 1, 1, 1,
0.4410434, -0.3137786, 2.51416, 1, 1, 1, 1, 1,
0.4415496, -0.6673017, 2.784618, 1, 1, 1, 1, 1,
0.4425243, -1.068908, 1.553076, 1, 1, 1, 1, 1,
0.4428728, 0.02161247, 2.042255, 1, 1, 1, 1, 1,
0.4451132, 0.4979327, 1.415043, 1, 1, 1, 1, 1,
0.4466285, -0.8970746, 1.827652, 1, 1, 1, 1, 1,
0.4476075, -1.318318, 3.527052, 1, 1, 1, 1, 1,
0.4498909, -0.6563216, 1.786968, 1, 1, 1, 1, 1,
0.4507673, -0.5249889, 3.468187, 1, 1, 1, 1, 1,
0.4509279, -0.9877574, 1.81921, 1, 1, 1, 1, 1,
0.4515236, -0.4644291, 2.057866, 1, 1, 1, 1, 1,
0.4518551, 0.2581035, -0.3341049, 1, 1, 1, 1, 1,
0.4544574, -0.1129714, 2.017758, 1, 1, 1, 1, 1,
0.4562457, 0.1755911, 1.722781, 1, 1, 1, 1, 1,
0.456356, -0.504235, 2.963487, 0, 0, 1, 1, 1,
0.4582954, 1.019945, -1.444442, 1, 0, 0, 1, 1,
0.4584373, -1.028188, 2.488658, 1, 0, 0, 1, 1,
0.4597838, -0.5952573, 2.913001, 1, 0, 0, 1, 1,
0.4601976, 0.2241563, 0.6849669, 1, 0, 0, 1, 1,
0.4656647, -0.7995457, 2.089013, 1, 0, 0, 1, 1,
0.4717426, -0.338126, 2.739143, 0, 0, 0, 1, 1,
0.4730193, 0.05548366, 1.101901, 0, 0, 0, 1, 1,
0.4790663, -1.354154, 2.086373, 0, 0, 0, 1, 1,
0.4801556, 0.5763976, -1.367095, 0, 0, 0, 1, 1,
0.4817752, 0.7153875, -0.4331632, 0, 0, 0, 1, 1,
0.4882933, 0.52811, 0.365056, 0, 0, 0, 1, 1,
0.489786, -0.3074816, 1.06043, 0, 0, 0, 1, 1,
0.4907406, -0.3129413, 3.737827, 1, 1, 1, 1, 1,
0.4910692, 1.315956, -1.350472, 1, 1, 1, 1, 1,
0.4998822, 0.3772522, 0.2579297, 1, 1, 1, 1, 1,
0.500093, -0.1112515, 1.546214, 1, 1, 1, 1, 1,
0.50207, 0.2636226, 1.759293, 1, 1, 1, 1, 1,
0.5038531, 1.011458, 1.06781, 1, 1, 1, 1, 1,
0.5071229, 0.1667084, 2.443481, 1, 1, 1, 1, 1,
0.507441, 0.1680664, -0.499829, 1, 1, 1, 1, 1,
0.5088763, 0.7936623, 0.296739, 1, 1, 1, 1, 1,
0.513775, 1.248672, 0.4132236, 1, 1, 1, 1, 1,
0.5155056, 0.8238454, 1.106204, 1, 1, 1, 1, 1,
0.5161455, -1.72647, 2.470193, 1, 1, 1, 1, 1,
0.5193545, 0.6265632, 1.283156, 1, 1, 1, 1, 1,
0.525884, -1.782894, 2.35794, 1, 1, 1, 1, 1,
0.5396605, -0.3626035, 0.9595906, 1, 1, 1, 1, 1,
0.5424803, 0.556844, 1.717092, 0, 0, 1, 1, 1,
0.543194, -0.2554873, 2.187567, 1, 0, 0, 1, 1,
0.5433772, 0.04410582, 1.958769, 1, 0, 0, 1, 1,
0.5479817, 1.732774, 0.09769922, 1, 0, 0, 1, 1,
0.549555, -0.2025317, 2.346364, 1, 0, 0, 1, 1,
0.5518474, -0.05869139, 0.9967172, 1, 0, 0, 1, 1,
0.5568655, 1.180396, -0.4474177, 0, 0, 0, 1, 1,
0.5633507, 0.08930678, 1.457962, 0, 0, 0, 1, 1,
0.5665151, 0.8738298, 1.896842, 0, 0, 0, 1, 1,
0.5767016, -1.501222, 3.317177, 0, 0, 0, 1, 1,
0.579473, 0.7304812, 1.178886, 0, 0, 0, 1, 1,
0.5836582, -0.09686767, 1.232904, 0, 0, 0, 1, 1,
0.584884, 0.9348894, 0.3787418, 0, 0, 0, 1, 1,
0.5903594, -1.985166, 2.550276, 1, 1, 1, 1, 1,
0.5924511, 1.205808, 0.9431483, 1, 1, 1, 1, 1,
0.5997452, -1.007981, 2.625815, 1, 1, 1, 1, 1,
0.6066722, 0.2332296, 2.482891, 1, 1, 1, 1, 1,
0.607186, -0.5993605, 2.47615, 1, 1, 1, 1, 1,
0.6128551, -0.9794458, 3.748089, 1, 1, 1, 1, 1,
0.6157556, 0.02239163, 3.283772, 1, 1, 1, 1, 1,
0.6171245, 0.2125726, 1.988286, 1, 1, 1, 1, 1,
0.6194908, -0.7464908, 1.284698, 1, 1, 1, 1, 1,
0.6219808, -0.448996, 0.9741667, 1, 1, 1, 1, 1,
0.6220856, -1.051321, 2.826562, 1, 1, 1, 1, 1,
0.6236752, 0.7660537, 2.374744, 1, 1, 1, 1, 1,
0.6240691, -0.4518551, 4.103663, 1, 1, 1, 1, 1,
0.6308395, 1.391452, 0.1977249, 1, 1, 1, 1, 1,
0.633558, 0.4207924, 0.9391491, 1, 1, 1, 1, 1,
0.6343464, 0.7314867, -1.39423, 0, 0, 1, 1, 1,
0.6399801, -0.05740203, 0.3629125, 1, 0, 0, 1, 1,
0.6422869, 1.067935, 0.9465501, 1, 0, 0, 1, 1,
0.6437517, -2.310022, 4.224278, 1, 0, 0, 1, 1,
0.6464038, 0.4008401, 1.099185, 1, 0, 0, 1, 1,
0.650439, -0.8254776, 3.144708, 1, 0, 0, 1, 1,
0.6593093, 2.209627, -1.25974, 0, 0, 0, 1, 1,
0.662895, -0.4738953, 2.7887, 0, 0, 0, 1, 1,
0.6663516, -0.9735838, 2.004102, 0, 0, 0, 1, 1,
0.6710818, -0.6860289, 2.951959, 0, 0, 0, 1, 1,
0.6732767, 1.562594, -1.537287, 0, 0, 0, 1, 1,
0.6787823, -0.663168, 2.293631, 0, 0, 0, 1, 1,
0.6819323, 0.4231765, 2.414228, 0, 0, 0, 1, 1,
0.6835226, -0.5443316, 2.368274, 1, 1, 1, 1, 1,
0.6838164, 0.2398721, -0.3291187, 1, 1, 1, 1, 1,
0.6846847, -0.6275442, 2.811991, 1, 1, 1, 1, 1,
0.6849744, -0.3578691, 1.430922, 1, 1, 1, 1, 1,
0.6859446, -0.658603, 3.141682, 1, 1, 1, 1, 1,
0.6919242, -0.3423112, 1.187683, 1, 1, 1, 1, 1,
0.6977213, -1.145483, 2.141882, 1, 1, 1, 1, 1,
0.6979395, 0.5217143, 2.22916, 1, 1, 1, 1, 1,
0.6979702, 1.48854, -0.6884764, 1, 1, 1, 1, 1,
0.7040113, -1.251256, 3.928612, 1, 1, 1, 1, 1,
0.7077659, 0.5961663, 0.6990209, 1, 1, 1, 1, 1,
0.7083248, 0.6314143, 1.552364, 1, 1, 1, 1, 1,
0.7100378, 1.42753, 1.780479, 1, 1, 1, 1, 1,
0.710488, 0.797097, 1.851398, 1, 1, 1, 1, 1,
0.7105714, 0.9067985, -1.131215, 1, 1, 1, 1, 1,
0.7158342, 0.3148679, 1.594386, 0, 0, 1, 1, 1,
0.7287468, -1.601025, 1.224463, 1, 0, 0, 1, 1,
0.7289487, -0.1568893, 1.985019, 1, 0, 0, 1, 1,
0.7323259, -0.2870513, 1.034559, 1, 0, 0, 1, 1,
0.732627, 1.752834, 1.275795, 1, 0, 0, 1, 1,
0.7329004, -0.2356926, 3.259609, 1, 0, 0, 1, 1,
0.7333497, 0.2182361, -0.4438898, 0, 0, 0, 1, 1,
0.7410846, -0.1437065, 2.078008, 0, 0, 0, 1, 1,
0.7451978, -0.2797488, 2.675558, 0, 0, 0, 1, 1,
0.7459344, -1.54642, 1.293507, 0, 0, 0, 1, 1,
0.7539279, 0.8054757, -0.4493779, 0, 0, 0, 1, 1,
0.7557378, 0.07923527, 1.263484, 0, 0, 0, 1, 1,
0.7559879, 0.4450946, -0.3477004, 0, 0, 0, 1, 1,
0.7573173, 0.4443432, -0.275896, 1, 1, 1, 1, 1,
0.757617, -0.4175023, 2.682548, 1, 1, 1, 1, 1,
0.7589536, 1.103801, 0.008946654, 1, 1, 1, 1, 1,
0.7604346, -0.01358821, 2.224032, 1, 1, 1, 1, 1,
0.762336, 0.9345872, 1.761173, 1, 1, 1, 1, 1,
0.7633424, 1.374283, 1.298789, 1, 1, 1, 1, 1,
0.765636, -1.105674, 3.744635, 1, 1, 1, 1, 1,
0.7682132, -0.3428638, 3.897995, 1, 1, 1, 1, 1,
0.7683476, 0.3637705, 2.243507, 1, 1, 1, 1, 1,
0.7710074, -0.3942283, 1.702389, 1, 1, 1, 1, 1,
0.77374, -0.7525867, 1.409851, 1, 1, 1, 1, 1,
0.7867798, -0.2424594, 2.750033, 1, 1, 1, 1, 1,
0.7868025, 0.5309887, 0.4198079, 1, 1, 1, 1, 1,
0.7904871, -1.758825, 2.183594, 1, 1, 1, 1, 1,
0.7919898, 0.7915923, -0.1432118, 1, 1, 1, 1, 1,
0.7965381, -0.3355849, 2.301158, 0, 0, 1, 1, 1,
0.7967926, -0.5335422, 2.156923, 1, 0, 0, 1, 1,
0.7975966, 0.2718728, 1.129613, 1, 0, 0, 1, 1,
0.8124707, 0.7085719, 0.9177328, 1, 0, 0, 1, 1,
0.8156112, 0.06248567, 1.288039, 1, 0, 0, 1, 1,
0.8161178, 1.163703, -0.2725352, 1, 0, 0, 1, 1,
0.8165215, 0.411073, 2.325388, 0, 0, 0, 1, 1,
0.8177111, 0.9419568, 1.081767, 0, 0, 0, 1, 1,
0.8189155, -0.224552, 2.777915, 0, 0, 0, 1, 1,
0.8209409, 0.2626063, 1.192047, 0, 0, 0, 1, 1,
0.8224992, -2.787324, 2.380206, 0, 0, 0, 1, 1,
0.824928, 0.6981524, -0.01784613, 0, 0, 0, 1, 1,
0.8353635, -0.5355303, 2.266892, 0, 0, 0, 1, 1,
0.8405957, -1.157539, 1.838501, 1, 1, 1, 1, 1,
0.8429214, 0.1511935, 2.341834, 1, 1, 1, 1, 1,
0.8498499, -0.3157791, 1.643451, 1, 1, 1, 1, 1,
0.8543501, 0.04287176, 3.260559, 1, 1, 1, 1, 1,
0.864826, -0.1240825, 1.514052, 1, 1, 1, 1, 1,
0.8800272, -0.9036534, 3.663486, 1, 1, 1, 1, 1,
0.8903325, 0.7362147, 0.9769417, 1, 1, 1, 1, 1,
0.8923982, -0.8104694, 0.848716, 1, 1, 1, 1, 1,
0.8982433, -0.4469421, 1.84996, 1, 1, 1, 1, 1,
0.9049699, 0.2421971, 2.111399, 1, 1, 1, 1, 1,
0.9091082, -0.4349013, 2.510229, 1, 1, 1, 1, 1,
0.9135357, 1.98769, 1.377475, 1, 1, 1, 1, 1,
0.9199098, 0.3804226, 3.135557, 1, 1, 1, 1, 1,
0.9210868, 2.652236, 2.558108, 1, 1, 1, 1, 1,
0.9252567, -0.5373636, 2.71032, 1, 1, 1, 1, 1,
0.9261401, 0.01354603, 1.752328, 0, 0, 1, 1, 1,
0.9448668, 0.6224266, 2.195143, 1, 0, 0, 1, 1,
0.9469298, -0.7580093, 2.763592, 1, 0, 0, 1, 1,
0.9533892, -0.224615, 4.504452, 1, 0, 0, 1, 1,
0.9583311, 0.1196407, 0.141814, 1, 0, 0, 1, 1,
0.9655148, -0.07335576, -0.1043271, 1, 0, 0, 1, 1,
0.9778475, 0.8224564, 2.389447, 0, 0, 0, 1, 1,
0.9802257, 0.3447321, 2.355811, 0, 0, 0, 1, 1,
0.9805827, -0.01384229, 3.235462, 0, 0, 0, 1, 1,
0.9862726, -0.2627621, 1.381719, 0, 0, 0, 1, 1,
0.9887471, -0.4885719, 1.189421, 0, 0, 0, 1, 1,
0.9946556, 0.5976414, 2.469794, 0, 0, 0, 1, 1,
0.9975771, -0.6739343, 2.467767, 0, 0, 0, 1, 1,
1.005246, -0.9395506, 2.888188, 1, 1, 1, 1, 1,
1.00688, -1.577783, 2.807204, 1, 1, 1, 1, 1,
1.015453, 0.3633639, -0.5343661, 1, 1, 1, 1, 1,
1.016644, 0.4920901, 0.9079699, 1, 1, 1, 1, 1,
1.019964, -1.632656, 3.468509, 1, 1, 1, 1, 1,
1.023568, -0.8627314, 2.695563, 1, 1, 1, 1, 1,
1.031479, 1.14491, -0.9968139, 1, 1, 1, 1, 1,
1.032244, -0.178164, 1.167963, 1, 1, 1, 1, 1,
1.032879, 0.5347156, 2.211674, 1, 1, 1, 1, 1,
1.033409, 0.0987492, 0.659999, 1, 1, 1, 1, 1,
1.034374, 0.8991221, 1.604093, 1, 1, 1, 1, 1,
1.037446, -0.3380991, 2.231973, 1, 1, 1, 1, 1,
1.042363, 0.4621687, 1.270858, 1, 1, 1, 1, 1,
1.047606, -0.8062203, 1.962428, 1, 1, 1, 1, 1,
1.049893, -0.4191151, 0.8464544, 1, 1, 1, 1, 1,
1.057045, -0.2572323, 1.338712, 0, 0, 1, 1, 1,
1.059116, 1.217277, 1.575265, 1, 0, 0, 1, 1,
1.067963, 0.1624053, 0.1870288, 1, 0, 0, 1, 1,
1.075075, -1.371139, 0.5669454, 1, 0, 0, 1, 1,
1.079047, -0.07213799, 2.383201, 1, 0, 0, 1, 1,
1.079778, -0.04263205, 0.8567428, 1, 0, 0, 1, 1,
1.096659, 0.8636879, 0.3203861, 0, 0, 0, 1, 1,
1.099227, -0.2796933, 1.233122, 0, 0, 0, 1, 1,
1.107855, -1.525005, 2.69995, 0, 0, 0, 1, 1,
1.11324, 0.9901558, -0.4245446, 0, 0, 0, 1, 1,
1.113244, -1.266625, 2.839513, 0, 0, 0, 1, 1,
1.113326, 0.600206, 1.191928, 0, 0, 0, 1, 1,
1.114909, -1.51011, 2.99731, 0, 0, 0, 1, 1,
1.116379, -0.7166776, 1.431595, 1, 1, 1, 1, 1,
1.122401, 0.1145898, 1.133931, 1, 1, 1, 1, 1,
1.125989, 1.069601, 0.762151, 1, 1, 1, 1, 1,
1.128203, -0.3322278, -0.2740149, 1, 1, 1, 1, 1,
1.128503, 1.193366, 1.374901, 1, 1, 1, 1, 1,
1.132308, -0.7995011, 2.822092, 1, 1, 1, 1, 1,
1.142466, 0.9092234, 1.663297, 1, 1, 1, 1, 1,
1.146332, -1.673139, 0.9028215, 1, 1, 1, 1, 1,
1.152518, -1.976034, 1.172266, 1, 1, 1, 1, 1,
1.158622, 2.001146, -1.294702, 1, 1, 1, 1, 1,
1.159107, 0.9247253, 1.281167, 1, 1, 1, 1, 1,
1.162737, 0.9605083, -0.2585628, 1, 1, 1, 1, 1,
1.163179, 0.2538083, -0.8207127, 1, 1, 1, 1, 1,
1.163234, -0.321285, 1.187807, 1, 1, 1, 1, 1,
1.176279, -0.5073681, 0.007203111, 1, 1, 1, 1, 1,
1.180045, 0.1582683, -0.2503641, 0, 0, 1, 1, 1,
1.18031, 0.7038744, 1.946603, 1, 0, 0, 1, 1,
1.183545, 0.0431358, 2.321856, 1, 0, 0, 1, 1,
1.184041, -1.085345, 1.007132, 1, 0, 0, 1, 1,
1.185605, -0.8391055, 1.402418, 1, 0, 0, 1, 1,
1.18909, 0.1526668, 1.161809, 1, 0, 0, 1, 1,
1.191697, -0.2069061, 2.395946, 0, 0, 0, 1, 1,
1.19286, -0.4388634, -0.6003536, 0, 0, 0, 1, 1,
1.194715, -0.4638578, 2.143226, 0, 0, 0, 1, 1,
1.19979, 2.181305, -0.6372695, 0, 0, 0, 1, 1,
1.203907, 0.4577713, -0.6229085, 0, 0, 0, 1, 1,
1.204132, -1.317969, 1.635142, 0, 0, 0, 1, 1,
1.206506, -0.4336771, 1.005863, 0, 0, 0, 1, 1,
1.216892, 0.3037343, 1.063979, 1, 1, 1, 1, 1,
1.217121, 2.414512, 0.3529329, 1, 1, 1, 1, 1,
1.217753, -1.539148, 1.518479, 1, 1, 1, 1, 1,
1.219364, -1.111381, 1.285411, 1, 1, 1, 1, 1,
1.224209, 1.535129, -1.12415, 1, 1, 1, 1, 1,
1.225109, 1.504526, -0.4461141, 1, 1, 1, 1, 1,
1.236363, -1.411522, 3.131499, 1, 1, 1, 1, 1,
1.239743, -0.3447129, 2.954333, 1, 1, 1, 1, 1,
1.243964, 0.7405114, 0.7321354, 1, 1, 1, 1, 1,
1.255257, 0.3157148, 1.199758, 1, 1, 1, 1, 1,
1.258367, 3.399013, 0.8604133, 1, 1, 1, 1, 1,
1.2593, -0.6886993, 0.5140435, 1, 1, 1, 1, 1,
1.262357, -0.5173431, 2.630856, 1, 1, 1, 1, 1,
1.272702, 1.598438, -0.6423088, 1, 1, 1, 1, 1,
1.273814, 0.875993, 0.6947891, 1, 1, 1, 1, 1,
1.284164, -0.4440206, 3.204349, 0, 0, 1, 1, 1,
1.284836, -0.6839918, 0.1952124, 1, 0, 0, 1, 1,
1.287613, 0.9573287, 2.037081, 1, 0, 0, 1, 1,
1.288193, 0.1767564, 0.3266475, 1, 0, 0, 1, 1,
1.290471, -2.276306, 3.231172, 1, 0, 0, 1, 1,
1.297849, -1.978719, 2.315136, 1, 0, 0, 1, 1,
1.305973, -2.328419, 2.966431, 0, 0, 0, 1, 1,
1.3061, -0.2985471, 2.64444, 0, 0, 0, 1, 1,
1.306264, 0.5410151, 1.174111, 0, 0, 0, 1, 1,
1.307613, -0.01470078, 1.759906, 0, 0, 0, 1, 1,
1.308209, -1.955429, 3.422895, 0, 0, 0, 1, 1,
1.316111, -1.071237, 4.37875, 0, 0, 0, 1, 1,
1.320439, -0.1261715, 2.565198, 0, 0, 0, 1, 1,
1.320539, 0.8545961, 0.7028311, 1, 1, 1, 1, 1,
1.326838, 0.239591, -0.05269485, 1, 1, 1, 1, 1,
1.338138, 1.397082, -0.08432909, 1, 1, 1, 1, 1,
1.342882, -0.4854636, -0.1648434, 1, 1, 1, 1, 1,
1.354475, 0.9217773, 0.3210335, 1, 1, 1, 1, 1,
1.356371, 0.5279862, -0.7270985, 1, 1, 1, 1, 1,
1.364117, 0.6254297, 0.767827, 1, 1, 1, 1, 1,
1.368342, -0.6733196, 3.954392, 1, 1, 1, 1, 1,
1.372987, 0.746715, 0.9836836, 1, 1, 1, 1, 1,
1.373682, -2.398484, 3.372171, 1, 1, 1, 1, 1,
1.379316, 1.063267, -0.0986217, 1, 1, 1, 1, 1,
1.380496, 0.1355438, 1.543205, 1, 1, 1, 1, 1,
1.382555, -1.181296, 0.08564965, 1, 1, 1, 1, 1,
1.385923, 0.8528205, 0.08444584, 1, 1, 1, 1, 1,
1.39603, 0.3296438, 0.3439919, 1, 1, 1, 1, 1,
1.397357, -1.486958, 0.4831755, 0, 0, 1, 1, 1,
1.398857, 0.1468892, 2.699449, 1, 0, 0, 1, 1,
1.400419, -0.0344968, 0.7231665, 1, 0, 0, 1, 1,
1.402335, -1.268354, 3.733863, 1, 0, 0, 1, 1,
1.402906, 0.2515483, -0.07589107, 1, 0, 0, 1, 1,
1.408866, 0.3597696, 1.987313, 1, 0, 0, 1, 1,
1.411942, -0.2260273, 1.305878, 0, 0, 0, 1, 1,
1.414942, 0.2412778, 2.10307, 0, 0, 0, 1, 1,
1.438457, -0.153757, 0.8906613, 0, 0, 0, 1, 1,
1.439468, 0.08272159, 1.532258, 0, 0, 0, 1, 1,
1.452539, 0.5052679, 1.64138, 0, 0, 0, 1, 1,
1.455598, -0.2545162, 0.5098979, 0, 0, 0, 1, 1,
1.457474, 0.7963135, 1.020564, 0, 0, 0, 1, 1,
1.458766, -1.164192, 3.410365, 1, 1, 1, 1, 1,
1.470666, 0.5770898, 1.599517, 1, 1, 1, 1, 1,
1.471619, 0.2265227, 1.091805, 1, 1, 1, 1, 1,
1.476593, -0.4118695, 2.573185, 1, 1, 1, 1, 1,
1.48868, -0.232751, 0.5415072, 1, 1, 1, 1, 1,
1.497319, 0.7703036, 1.556865, 1, 1, 1, 1, 1,
1.501137, 1.159391, -1.914166, 1, 1, 1, 1, 1,
1.520711, -1.377019, 0.5979332, 1, 1, 1, 1, 1,
1.521782, 0.4900747, 0.9190243, 1, 1, 1, 1, 1,
1.521997, 0.4681132, 1.04071, 1, 1, 1, 1, 1,
1.544674, 0.270504, 2.171939, 1, 1, 1, 1, 1,
1.545961, -0.4494959, 1.146314, 1, 1, 1, 1, 1,
1.587743, 1.599473, 0.4760632, 1, 1, 1, 1, 1,
1.592512, 0.3337365, 1.662892, 1, 1, 1, 1, 1,
1.609055, 0.1080876, 1.584816, 1, 1, 1, 1, 1,
1.61497, -0.0242809, 2.372352, 0, 0, 1, 1, 1,
1.622213, -0.4081379, 1.762225, 1, 0, 0, 1, 1,
1.63244, 1.082286, 0.3568046, 1, 0, 0, 1, 1,
1.632804, 1.38614, 0.3900459, 1, 0, 0, 1, 1,
1.666398, 1.15335, 0.6566603, 1, 0, 0, 1, 1,
1.67284, 1.426131, -0.3517053, 1, 0, 0, 1, 1,
1.674906, 0.7340317, 0.1044398, 0, 0, 0, 1, 1,
1.717857, -0.04777416, 0.8215632, 0, 0, 0, 1, 1,
1.719754, -0.5873634, 3.111337, 0, 0, 0, 1, 1,
1.725292, -0.344692, -0.3993737, 0, 0, 0, 1, 1,
1.757248, 0.5590926, 1.36919, 0, 0, 0, 1, 1,
1.777014, -1.991107, 1.847968, 0, 0, 0, 1, 1,
1.777789, 1.914729, 1.082613, 0, 0, 0, 1, 1,
1.785019, -0.5450899, 0.1827048, 1, 1, 1, 1, 1,
1.786691, 0.1566896, 1.390902, 1, 1, 1, 1, 1,
1.791156, -0.1540651, 1.493113, 1, 1, 1, 1, 1,
1.79882, 0.1839467, 1.440343, 1, 1, 1, 1, 1,
1.847193, 1.805243, 0.3364496, 1, 1, 1, 1, 1,
1.848367, 0.320358, -0.05496322, 1, 1, 1, 1, 1,
1.852302, 0.7392609, 2.350117, 1, 1, 1, 1, 1,
1.860139, 0.5213292, -0.02772156, 1, 1, 1, 1, 1,
1.871356, 0.6624698, 0.6857472, 1, 1, 1, 1, 1,
1.883283, -1.587508, 3.247896, 1, 1, 1, 1, 1,
1.883859, -0.3566699, 3.310375, 1, 1, 1, 1, 1,
1.904306, -0.2890479, 0.5808841, 1, 1, 1, 1, 1,
1.905386, -0.4300135, 0.4054163, 1, 1, 1, 1, 1,
1.906403, -0.03915906, 1.977455, 1, 1, 1, 1, 1,
1.917595, 0.5233355, 0.728952, 1, 1, 1, 1, 1,
2.02399, 0.03706672, 2.226664, 0, 0, 1, 1, 1,
2.026397, 1.077468, 1.374704, 1, 0, 0, 1, 1,
2.03881, 0.7339847, 0.4269712, 1, 0, 0, 1, 1,
2.055593, 0.5212998, 1.939816, 1, 0, 0, 1, 1,
2.107334, 0.07478362, 1.710899, 1, 0, 0, 1, 1,
2.119258, -2.820986, 0.4053089, 1, 0, 0, 1, 1,
2.182935, 1.82484, 0.5006118, 0, 0, 0, 1, 1,
2.201694, 1.063685, 0.9066451, 0, 0, 0, 1, 1,
2.234306, 1.296583, -0.2972034, 0, 0, 0, 1, 1,
2.262306, 1.011486, 2.224987, 0, 0, 0, 1, 1,
2.291008, 0.7283196, 1.368758, 0, 0, 0, 1, 1,
2.351968, -0.9376144, 1.968181, 0, 0, 0, 1, 1,
2.35198, -0.7040545, 1.14545, 0, 0, 0, 1, 1,
2.374535, 0.7175406, 2.577428, 1, 1, 1, 1, 1,
2.436709, -0.007867645, 2.156184, 1, 1, 1, 1, 1,
2.460752, 0.003741772, 1.155898, 1, 1, 1, 1, 1,
2.706046, 1.181773, -0.4517585, 1, 1, 1, 1, 1,
2.769162, 0.816332, 1.493537, 1, 1, 1, 1, 1,
2.80468, -0.2338855, 0.8237073, 1, 1, 1, 1, 1,
3.028476, -0.2487214, 0.7501732, 1, 1, 1, 1, 1
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
var radius = 9.31049;
var distance = 32.7027;
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
mvMatrix.translate( 0.1070874, -0.1428404, 0.1975057 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.7027);
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
