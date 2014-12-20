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
-3.063998, -1.057713, -2.329509, 1, 0, 0, 1,
-2.88662, 0.7126481, -3.922189, 1, 0.007843138, 0, 1,
-2.792636, -0.9906856, -2.008157, 1, 0.01176471, 0, 1,
-2.758898, 0.6894222, -0.7800984, 1, 0.01960784, 0, 1,
-2.682344, -0.09802923, -1.754073, 1, 0.02352941, 0, 1,
-2.45402, -0.6531376, -3.574696, 1, 0.03137255, 0, 1,
-2.445665, 0.02681099, -2.275852, 1, 0.03529412, 0, 1,
-2.377795, -1.907422, -2.116, 1, 0.04313726, 0, 1,
-2.32978, 0.02338344, 0.06225165, 1, 0.04705882, 0, 1,
-2.325425, -0.4951211, -0.8563976, 1, 0.05490196, 0, 1,
-2.293516, -0.7239572, -1.74133, 1, 0.05882353, 0, 1,
-2.239686, -0.6413074, -0.3190859, 1, 0.06666667, 0, 1,
-2.148988, -0.8303381, -2.056676, 1, 0.07058824, 0, 1,
-2.144549, 0.4020007, -1.330338, 1, 0.07843138, 0, 1,
-2.052646, -0.8541623, -1.856954, 1, 0.08235294, 0, 1,
-2.034856, 0.1040142, 0.201953, 1, 0.09019608, 0, 1,
-2.02624, 0.93005, -3.090158, 1, 0.09411765, 0, 1,
-1.991908, 0.6754561, -0.4278951, 1, 0.1019608, 0, 1,
-1.989452, -0.6822553, -2.351281, 1, 0.1098039, 0, 1,
-1.932295, -1.73228, -0.8692011, 1, 0.1137255, 0, 1,
-1.881931, -0.1511589, -0.01466303, 1, 0.1215686, 0, 1,
-1.871285, -0.06159572, -1.342696, 1, 0.1254902, 0, 1,
-1.853204, 0.05301292, -1.899206, 1, 0.1333333, 0, 1,
-1.851776, -0.07968574, -1.283122, 1, 0.1372549, 0, 1,
-1.845135, -1.814716, -3.148083, 1, 0.145098, 0, 1,
-1.827292, -0.9297535, -3.533993, 1, 0.1490196, 0, 1,
-1.823865, -1.185411, -3.062035, 1, 0.1568628, 0, 1,
-1.81934, 0.4605433, -1.17413, 1, 0.1607843, 0, 1,
-1.807606, -1.193863, -1.155769, 1, 0.1686275, 0, 1,
-1.804168, -1.307773, -1.36122, 1, 0.172549, 0, 1,
-1.794707, 1.400006, -2.0578, 1, 0.1803922, 0, 1,
-1.794532, -0.3094136, -2.136672, 1, 0.1843137, 0, 1,
-1.779581, 0.1727505, -0.7737247, 1, 0.1921569, 0, 1,
-1.753758, -0.01983621, -3.043526, 1, 0.1960784, 0, 1,
-1.751485, -0.361111, -3.195922, 1, 0.2039216, 0, 1,
-1.727118, -0.9053233, -1.377079, 1, 0.2117647, 0, 1,
-1.724415, -0.8488649, -4.178291, 1, 0.2156863, 0, 1,
-1.722077, -1.244956, -3.470766, 1, 0.2235294, 0, 1,
-1.706158, -0.643802, -0.04664821, 1, 0.227451, 0, 1,
-1.695018, 1.181841, 0.2302382, 1, 0.2352941, 0, 1,
-1.690293, -1.023689, -0.2581606, 1, 0.2392157, 0, 1,
-1.679632, -0.104867, -0.5229753, 1, 0.2470588, 0, 1,
-1.675433, 0.7849658, -1.626581, 1, 0.2509804, 0, 1,
-1.658862, 1.844999, -2.64059, 1, 0.2588235, 0, 1,
-1.655705, 0.6831198, -0.7693467, 1, 0.2627451, 0, 1,
-1.649434, 0.3082693, -1.366747, 1, 0.2705882, 0, 1,
-1.649303, 0.0541671, -1.150568, 1, 0.2745098, 0, 1,
-1.629322, -0.1970704, -0.5991855, 1, 0.282353, 0, 1,
-1.615965, -0.7394803, -1.607607, 1, 0.2862745, 0, 1,
-1.609637, 0.5995159, -1.025445, 1, 0.2941177, 0, 1,
-1.605281, 0.8424233, -1.382437, 1, 0.3019608, 0, 1,
-1.601331, 0.8268822, -0.9945999, 1, 0.3058824, 0, 1,
-1.594575, 1.841273, -0.792213, 1, 0.3137255, 0, 1,
-1.586226, -1.200706, -1.646156, 1, 0.3176471, 0, 1,
-1.561876, 0.005938971, -1.27389, 1, 0.3254902, 0, 1,
-1.559156, -0.2501929, -2.271104, 1, 0.3294118, 0, 1,
-1.536928, -0.5295636, -1.630823, 1, 0.3372549, 0, 1,
-1.527911, -1.27082, -2.80433, 1, 0.3411765, 0, 1,
-1.524975, -0.2412813, -3.33211, 1, 0.3490196, 0, 1,
-1.52088, -0.0546489, -2.012475, 1, 0.3529412, 0, 1,
-1.507063, -1.294981, -2.535548, 1, 0.3607843, 0, 1,
-1.506412, 0.96246, -1.61628, 1, 0.3647059, 0, 1,
-1.487371, 1.503324, 0.7216794, 1, 0.372549, 0, 1,
-1.483162, -1.285245, -2.112648, 1, 0.3764706, 0, 1,
-1.481858, -0.7269359, -1.445234, 1, 0.3843137, 0, 1,
-1.477821, 0.8463531, -0.5430757, 1, 0.3882353, 0, 1,
-1.475607, -0.06129142, 0.05386307, 1, 0.3960784, 0, 1,
-1.473725, -0.01548986, 0.5113267, 1, 0.4039216, 0, 1,
-1.460453, -0.3142719, -1.480752, 1, 0.4078431, 0, 1,
-1.458569, 1.182456, -1.092671, 1, 0.4156863, 0, 1,
-1.458257, -2.449252, -4.331656, 1, 0.4196078, 0, 1,
-1.446083, 0.6766508, -1.807468, 1, 0.427451, 0, 1,
-1.431712, -0.2919675, -0.3703413, 1, 0.4313726, 0, 1,
-1.42253, -0.7564894, -2.000502, 1, 0.4392157, 0, 1,
-1.413686, 1.394469, -2.254215, 1, 0.4431373, 0, 1,
-1.401795, 0.3176503, -1.289188, 1, 0.4509804, 0, 1,
-1.401681, -0.5193544, 0.003840749, 1, 0.454902, 0, 1,
-1.392703, 0.4329241, 0.3412928, 1, 0.4627451, 0, 1,
-1.391357, 0.9386734, -0.3087238, 1, 0.4666667, 0, 1,
-1.385632, -1.026944, -0.9893444, 1, 0.4745098, 0, 1,
-1.384029, -0.07221445, -1.242436, 1, 0.4784314, 0, 1,
-1.383083, 0.518887, -2.014402, 1, 0.4862745, 0, 1,
-1.380032, -1.053943, -3.238879, 1, 0.4901961, 0, 1,
-1.378989, -0.8304142, -0.5994875, 1, 0.4980392, 0, 1,
-1.377025, 0.3338562, 0.1072003, 1, 0.5058824, 0, 1,
-1.365739, -1.121154, -0.5569805, 1, 0.509804, 0, 1,
-1.358039, 0.3558324, -1.351637, 1, 0.5176471, 0, 1,
-1.313175, -2.813874, -1.514071, 1, 0.5215687, 0, 1,
-1.309058, 1.569071, -1.541521, 1, 0.5294118, 0, 1,
-1.307875, -0.2178048, -1.701054, 1, 0.5333334, 0, 1,
-1.305594, 0.4946926, -0.3011907, 1, 0.5411765, 0, 1,
-1.29089, -1.696966, -2.456821, 1, 0.5450981, 0, 1,
-1.288997, 1.253805, -2.194523, 1, 0.5529412, 0, 1,
-1.288322, -0.8522872, -2.623832, 1, 0.5568628, 0, 1,
-1.2861, 0.5193169, 0.6333595, 1, 0.5647059, 0, 1,
-1.282885, 0.3610974, -0.08345667, 1, 0.5686275, 0, 1,
-1.281314, -0.5155116, -1.55871, 1, 0.5764706, 0, 1,
-1.279805, 0.9818563, -0.01344133, 1, 0.5803922, 0, 1,
-1.279678, -0.8499706, -0.7504698, 1, 0.5882353, 0, 1,
-1.279198, 0.02487476, -1.202086, 1, 0.5921569, 0, 1,
-1.275422, -0.1305673, -3.328394, 1, 0.6, 0, 1,
-1.272656, 0.9612706, -1.772724, 1, 0.6078432, 0, 1,
-1.272593, -0.9265661, -1.084825, 1, 0.6117647, 0, 1,
-1.265694, -0.3631293, -3.23632, 1, 0.6196079, 0, 1,
-1.261897, -0.1174238, -1.420622, 1, 0.6235294, 0, 1,
-1.261538, -0.7317142, -3.618217, 1, 0.6313726, 0, 1,
-1.258247, -0.6969345, -1.338777, 1, 0.6352941, 0, 1,
-1.226358, -1.939559, -3.942077, 1, 0.6431373, 0, 1,
-1.220344, 0.2548013, -2.063879, 1, 0.6470588, 0, 1,
-1.216168, 1.907062, -0.9587674, 1, 0.654902, 0, 1,
-1.210601, 1.532303, -0.1543595, 1, 0.6588235, 0, 1,
-1.202479, -0.06837772, -0.704, 1, 0.6666667, 0, 1,
-1.194327, 1.336985, -0.3125607, 1, 0.6705883, 0, 1,
-1.193897, 0.6326129, -2.107775, 1, 0.6784314, 0, 1,
-1.187289, -0.5900527, -2.518367, 1, 0.682353, 0, 1,
-1.183283, -0.606801, -3.562767, 1, 0.6901961, 0, 1,
-1.182084, -0.1451173, -2.643485, 1, 0.6941177, 0, 1,
-1.180848, 1.977261, -1.555081, 1, 0.7019608, 0, 1,
-1.175911, 0.4464516, -1.355444, 1, 0.7098039, 0, 1,
-1.171016, 0.4485843, -3.151724, 1, 0.7137255, 0, 1,
-1.170102, 0.03825643, -1.453316, 1, 0.7215686, 0, 1,
-1.169977, -0.4157994, -1.201431, 1, 0.7254902, 0, 1,
-1.169495, -1.373261, -2.975432, 1, 0.7333333, 0, 1,
-1.163991, -1.188779, -2.097046, 1, 0.7372549, 0, 1,
-1.160824, -0.4264304, -2.30703, 1, 0.7450981, 0, 1,
-1.156467, 0.9915332, -2.616021, 1, 0.7490196, 0, 1,
-1.152056, 1.533934, -2.52827, 1, 0.7568628, 0, 1,
-1.139935, 0.01381648, -3.217503, 1, 0.7607843, 0, 1,
-1.135452, -0.1483299, -2.328027, 1, 0.7686275, 0, 1,
-1.133026, 1.191013, -0.6113433, 1, 0.772549, 0, 1,
-1.126815, -1.264479, -2.941499, 1, 0.7803922, 0, 1,
-1.121604, 0.9221997, -2.009382, 1, 0.7843137, 0, 1,
-1.116825, 1.880023, -0.1393976, 1, 0.7921569, 0, 1,
-1.114936, 1.026185, -2.474661, 1, 0.7960784, 0, 1,
-1.103677, 0.1161317, -2.365716, 1, 0.8039216, 0, 1,
-1.098548, -0.1671456, -2.954757, 1, 0.8117647, 0, 1,
-1.09824, 0.4209924, -2.389609, 1, 0.8156863, 0, 1,
-1.096388, -0.707909, -2.885672, 1, 0.8235294, 0, 1,
-1.087213, -0.4546171, -0.3872022, 1, 0.827451, 0, 1,
-1.084484, -0.3737533, -1.360927, 1, 0.8352941, 0, 1,
-1.072562, 0.337022, -0.5166053, 1, 0.8392157, 0, 1,
-1.070824, 1.322129, -0.6855507, 1, 0.8470588, 0, 1,
-1.070402, -0.957266, 1.013227, 1, 0.8509804, 0, 1,
-1.069158, 0.6745844, -0.4085635, 1, 0.8588235, 0, 1,
-1.06892, -0.4511743, -1.250027, 1, 0.8627451, 0, 1,
-1.057325, 0.1834668, -0.4228225, 1, 0.8705882, 0, 1,
-1.053497, 1.645091, -0.5020126, 1, 0.8745098, 0, 1,
-1.05325, -0.8642809, 0.7699324, 1, 0.8823529, 0, 1,
-1.041612, -0.7610814, -1.898556, 1, 0.8862745, 0, 1,
-1.038528, 0.2472542, 0.3325764, 1, 0.8941177, 0, 1,
-1.036971, -0.135603, -2.374187, 1, 0.8980392, 0, 1,
-1.03552, 0.7542974, -2.779026, 1, 0.9058824, 0, 1,
-1.028998, -0.521508, -1.332308, 1, 0.9137255, 0, 1,
-1.02876, 1.172925, 0.5718295, 1, 0.9176471, 0, 1,
-1.026973, 0.4924071, -1.191871, 1, 0.9254902, 0, 1,
-1.026172, -1.194869, -1.339075, 1, 0.9294118, 0, 1,
-1.025589, -0.10332, -1.46945, 1, 0.9372549, 0, 1,
-1.018947, 1.956373, 1.70863, 1, 0.9411765, 0, 1,
-1.017177, 0.2545347, -1.202183, 1, 0.9490196, 0, 1,
-1.016498, 1.182822, -1.619237, 1, 0.9529412, 0, 1,
-1.016373, 0.3185742, -1.960314, 1, 0.9607843, 0, 1,
-1.015596, -2.246949, -2.611967, 1, 0.9647059, 0, 1,
-1.004764, 1.024751, 0.2854877, 1, 0.972549, 0, 1,
-0.9985406, 1.873396, 0.4951394, 1, 0.9764706, 0, 1,
-0.9894758, -0.630065, -0.7772603, 1, 0.9843137, 0, 1,
-0.973031, 1.203023, -0.9248863, 1, 0.9882353, 0, 1,
-0.972494, -0.8257366, -2.549376, 1, 0.9960784, 0, 1,
-0.9707094, -0.1630547, -1.818208, 0.9960784, 1, 0, 1,
-0.9692926, -0.1948365, -2.020883, 0.9921569, 1, 0, 1,
-0.9663388, 0.6410941, -0.3971313, 0.9843137, 1, 0, 1,
-0.9647323, 0.336529, -1.858857, 0.9803922, 1, 0, 1,
-0.9516221, -0.4720011, -1.606774, 0.972549, 1, 0, 1,
-0.9513877, 1.332818, -1.421032, 0.9686275, 1, 0, 1,
-0.9513391, 1.29441, -1.70706, 0.9607843, 1, 0, 1,
-0.9435819, 0.3537659, -1.089597, 0.9568627, 1, 0, 1,
-0.9431851, 0.8021873, -1.301089, 0.9490196, 1, 0, 1,
-0.9398862, -0.7512292, -2.887455, 0.945098, 1, 0, 1,
-0.9304342, -2.908062, -2.466242, 0.9372549, 1, 0, 1,
-0.9285308, -0.3451441, -2.8224, 0.9333333, 1, 0, 1,
-0.9273965, 0.6175824, -1.551599, 0.9254902, 1, 0, 1,
-0.927242, 0.01567339, -0.7304813, 0.9215686, 1, 0, 1,
-0.922015, -0.4482541, 0.1452126, 0.9137255, 1, 0, 1,
-0.9139884, -0.7689207, -3.906982, 0.9098039, 1, 0, 1,
-0.9090711, 0.1580027, -2.105505, 0.9019608, 1, 0, 1,
-0.8951896, 0.1870307, -0.1573888, 0.8941177, 1, 0, 1,
-0.8951054, 0.06687047, -2.189286, 0.8901961, 1, 0, 1,
-0.8941306, 1.296124, -1.067601, 0.8823529, 1, 0, 1,
-0.8924636, -2.281341, -2.698966, 0.8784314, 1, 0, 1,
-0.8813042, 0.2097922, 0.7330575, 0.8705882, 1, 0, 1,
-0.8760617, 0.4822699, -0.6873981, 0.8666667, 1, 0, 1,
-0.8698969, 0.1929763, -0.2445845, 0.8588235, 1, 0, 1,
-0.858516, -1.450213, -3.008811, 0.854902, 1, 0, 1,
-0.8583897, 0.5185925, -2.770919, 0.8470588, 1, 0, 1,
-0.8566042, 0.5908308, -0.8478141, 0.8431373, 1, 0, 1,
-0.8552021, 0.6291735, -0.9445887, 0.8352941, 1, 0, 1,
-0.8534302, -1.815146, -2.955367, 0.8313726, 1, 0, 1,
-0.8494789, 0.04838974, -1.361119, 0.8235294, 1, 0, 1,
-0.8448636, -0.3946154, -2.617723, 0.8196079, 1, 0, 1,
-0.8436085, -0.02308911, -1.254292, 0.8117647, 1, 0, 1,
-0.8380665, -0.4090088, -2.651565, 0.8078431, 1, 0, 1,
-0.8310373, 1.584846, -0.2033438, 0.8, 1, 0, 1,
-0.8243398, -0.6142927, -1.892876, 0.7921569, 1, 0, 1,
-0.8215699, 1.018701, -0.481575, 0.7882353, 1, 0, 1,
-0.8174078, 0.7136664, -0.5554293, 0.7803922, 1, 0, 1,
-0.8064814, -0.9725546, -3.521485, 0.7764706, 1, 0, 1,
-0.8030769, 1.277639, 0.2186579, 0.7686275, 1, 0, 1,
-0.8023321, -0.6205958, -1.694429, 0.7647059, 1, 0, 1,
-0.7992316, 1.113501, 0.7138752, 0.7568628, 1, 0, 1,
-0.7984412, 1.602529, 0.8939453, 0.7529412, 1, 0, 1,
-0.7970686, -0.4613914, -2.146123, 0.7450981, 1, 0, 1,
-0.7907006, 0.7013994, -2.317304, 0.7411765, 1, 0, 1,
-0.7870581, -0.1187738, -3.247128, 0.7333333, 1, 0, 1,
-0.7861979, 0.4051147, -0.9448112, 0.7294118, 1, 0, 1,
-0.7779292, -0.09635201, -0.2187576, 0.7215686, 1, 0, 1,
-0.774948, -0.7401429, -3.680628, 0.7176471, 1, 0, 1,
-0.7741989, -1.74526, -3.16613, 0.7098039, 1, 0, 1,
-0.7700844, 1.530954, -0.8483211, 0.7058824, 1, 0, 1,
-0.7664199, 0.3390868, -1.868215, 0.6980392, 1, 0, 1,
-0.7658211, -0.9591427, -1.860079, 0.6901961, 1, 0, 1,
-0.7577397, 2.596548, -0.4350596, 0.6862745, 1, 0, 1,
-0.754141, -1.491311, -1.453233, 0.6784314, 1, 0, 1,
-0.7494151, 0.2717177, -1.324519, 0.6745098, 1, 0, 1,
-0.7492526, 0.4135652, -2.397355, 0.6666667, 1, 0, 1,
-0.7483631, 0.1094078, -1.542121, 0.6627451, 1, 0, 1,
-0.7454824, -0.572839, -3.060088, 0.654902, 1, 0, 1,
-0.7392823, -2.162069, -3.464901, 0.6509804, 1, 0, 1,
-0.7365485, 0.5652146, -0.8248053, 0.6431373, 1, 0, 1,
-0.7330239, -0.9590127, -3.319112, 0.6392157, 1, 0, 1,
-0.7294974, -0.1218561, -2.279736, 0.6313726, 1, 0, 1,
-0.7254318, 0.1193548, -0.5906537, 0.627451, 1, 0, 1,
-0.723966, -1.323351, -3.624963, 0.6196079, 1, 0, 1,
-0.7142981, -0.4830051, -2.613324, 0.6156863, 1, 0, 1,
-0.7141917, 1.750774, -1.597044, 0.6078432, 1, 0, 1,
-0.7110004, -0.0046267, -0.6940041, 0.6039216, 1, 0, 1,
-0.7084416, 0.4779373, -0.9993094, 0.5960785, 1, 0, 1,
-0.6996585, -0.1574956, -0.7325976, 0.5882353, 1, 0, 1,
-0.6983618, 0.6913241, -0.701492, 0.5843138, 1, 0, 1,
-0.6936108, 0.5655746, -1.242089, 0.5764706, 1, 0, 1,
-0.6920635, -0.7900806, -3.580352, 0.572549, 1, 0, 1,
-0.6880019, 1.588715, -1.015968, 0.5647059, 1, 0, 1,
-0.6852131, -0.008919656, -1.650241, 0.5607843, 1, 0, 1,
-0.6833754, 0.4162381, -1.413694, 0.5529412, 1, 0, 1,
-0.6799837, -0.5031417, -2.492384, 0.5490196, 1, 0, 1,
-0.6795425, 0.7195683, -0.3394761, 0.5411765, 1, 0, 1,
-0.678285, -0.7130121, -2.601468, 0.5372549, 1, 0, 1,
-0.6768073, -0.4830213, -2.61038, 0.5294118, 1, 0, 1,
-0.6755857, 1.510836, -0.2110391, 0.5254902, 1, 0, 1,
-0.6748307, -0.4317882, -1.907379, 0.5176471, 1, 0, 1,
-0.6727962, 0.5676215, 0.3767223, 0.5137255, 1, 0, 1,
-0.6718137, 0.3368289, -1.514519, 0.5058824, 1, 0, 1,
-0.6680922, -1.289843, -5.351534, 0.5019608, 1, 0, 1,
-0.6580777, 0.3718164, -3.607838, 0.4941176, 1, 0, 1,
-0.6579555, -1.225135, -4.30178, 0.4862745, 1, 0, 1,
-0.6573747, 0.9437371, -0.1195271, 0.4823529, 1, 0, 1,
-0.6527494, -0.6064252, -1.65662, 0.4745098, 1, 0, 1,
-0.6522259, -0.6379539, -2.042497, 0.4705882, 1, 0, 1,
-0.6492149, -0.4704962, -2.154446, 0.4627451, 1, 0, 1,
-0.6410003, -1.090431, -3.088933, 0.4588235, 1, 0, 1,
-0.6407773, 0.4500937, -2.630637, 0.4509804, 1, 0, 1,
-0.6385022, -1.573502, -6.273736, 0.4470588, 1, 0, 1,
-0.6384174, 1.374385, -0.5508706, 0.4392157, 1, 0, 1,
-0.637709, 1.888992, -2.349381, 0.4352941, 1, 0, 1,
-0.6365955, 1.951546, -0.3047233, 0.427451, 1, 0, 1,
-0.6360158, 1.611017, 0.7258685, 0.4235294, 1, 0, 1,
-0.6348258, 0.8008642, -1.336731, 0.4156863, 1, 0, 1,
-0.6336816, -0.1931429, -3.194772, 0.4117647, 1, 0, 1,
-0.6319508, -1.407849, -4.59935, 0.4039216, 1, 0, 1,
-0.6256118, 0.05136655, -1.175335, 0.3960784, 1, 0, 1,
-0.6232694, -0.8481034, -2.013785, 0.3921569, 1, 0, 1,
-0.6073158, 1.055877, -0.1384266, 0.3843137, 1, 0, 1,
-0.6041256, 0.4792998, -3.139443, 0.3803922, 1, 0, 1,
-0.5997079, 1.403569, 0.8849477, 0.372549, 1, 0, 1,
-0.5969076, 1.648602, -0.47652, 0.3686275, 1, 0, 1,
-0.5926542, -0.8214824, -3.216824, 0.3607843, 1, 0, 1,
-0.5920665, 1.529532, 0.3401997, 0.3568628, 1, 0, 1,
-0.588454, -2.659518, -2.288647, 0.3490196, 1, 0, 1,
-0.5878878, -1.79931, -2.094903, 0.345098, 1, 0, 1,
-0.5843994, 0.8916979, 0.1573816, 0.3372549, 1, 0, 1,
-0.5841902, -0.1611721, -1.785955, 0.3333333, 1, 0, 1,
-0.5799757, -1.14407, -4.078489, 0.3254902, 1, 0, 1,
-0.5789478, 0.9858852, -1.071417, 0.3215686, 1, 0, 1,
-0.5646409, 0.8952473, -1.381116, 0.3137255, 1, 0, 1,
-0.5644738, 1.250186, -0.7767382, 0.3098039, 1, 0, 1,
-0.5627494, -1.515237, -3.364495, 0.3019608, 1, 0, 1,
-0.5625809, 0.2792591, -2.197572, 0.2941177, 1, 0, 1,
-0.5575321, -0.1245171, -3.284595, 0.2901961, 1, 0, 1,
-0.5546162, 1.635704, -1.403877, 0.282353, 1, 0, 1,
-0.5523172, -0.8808625, -1.834761, 0.2784314, 1, 0, 1,
-0.546342, 0.6176803, -3.131557, 0.2705882, 1, 0, 1,
-0.5452578, -1.273614, -3.780658, 0.2666667, 1, 0, 1,
-0.5423961, -0.5099993, -2.456331, 0.2588235, 1, 0, 1,
-0.541781, -0.06363273, -1.065038, 0.254902, 1, 0, 1,
-0.5411674, 0.7050447, -2.197671, 0.2470588, 1, 0, 1,
-0.5395379, 1.328131, -1.138502, 0.2431373, 1, 0, 1,
-0.5386371, -0.3551899, -1.042183, 0.2352941, 1, 0, 1,
-0.5341899, 0.8557248, -0.8828943, 0.2313726, 1, 0, 1,
-0.5258569, 1.348041, -0.4415822, 0.2235294, 1, 0, 1,
-0.5258118, 0.320224, -0.9392623, 0.2196078, 1, 0, 1,
-0.5245568, 0.3807457, -1.235392, 0.2117647, 1, 0, 1,
-0.5196865, 0.1771161, -1.804165, 0.2078431, 1, 0, 1,
-0.5143493, -0.3931822, -1.601989, 0.2, 1, 0, 1,
-0.5114613, -1.752371, -3.104095, 0.1921569, 1, 0, 1,
-0.5071368, 0.6241676, -2.56889, 0.1882353, 1, 0, 1,
-0.5015892, -0.9519743, -2.856631, 0.1803922, 1, 0, 1,
-0.4989266, -1.67967, -3.051986, 0.1764706, 1, 0, 1,
-0.4877205, -0.6290779, -3.204947, 0.1686275, 1, 0, 1,
-0.48755, -0.3774875, -3.299427, 0.1647059, 1, 0, 1,
-0.482754, 1.181767, -1.746517, 0.1568628, 1, 0, 1,
-0.4818829, -0.4890991, -2.916392, 0.1529412, 1, 0, 1,
-0.4808618, 0.6827964, 0.3366864, 0.145098, 1, 0, 1,
-0.4769824, 1.055567, -0.8134522, 0.1411765, 1, 0, 1,
-0.4761784, 0.8852981, 0.6677645, 0.1333333, 1, 0, 1,
-0.4732918, 0.3091084, 0.4555266, 0.1294118, 1, 0, 1,
-0.4708994, 0.7297894, -1.205743, 0.1215686, 1, 0, 1,
-0.4613163, -0.9255378, -2.599822, 0.1176471, 1, 0, 1,
-0.4545193, 0.4324303, 0.1998902, 0.1098039, 1, 0, 1,
-0.4487388, -0.7148011, -2.816222, 0.1058824, 1, 0, 1,
-0.4439981, 0.4655187, -0.05575614, 0.09803922, 1, 0, 1,
-0.4418493, -0.3574066, -3.482936, 0.09019608, 1, 0, 1,
-0.4399587, 0.5667769, 0.510388, 0.08627451, 1, 0, 1,
-0.4397522, -0.4235733, -2.921558, 0.07843138, 1, 0, 1,
-0.4379226, -0.7918587, -2.974349, 0.07450981, 1, 0, 1,
-0.4369919, -0.07354835, -3.562032, 0.06666667, 1, 0, 1,
-0.4365696, 0.02223129, -2.501506, 0.0627451, 1, 0, 1,
-0.4322349, -0.3207242, -0.3518648, 0.05490196, 1, 0, 1,
-0.4282782, -0.9857224, -2.215099, 0.05098039, 1, 0, 1,
-0.420219, 0.1430812, -0.3764383, 0.04313726, 1, 0, 1,
-0.4163583, 0.6173944, -0.4418488, 0.03921569, 1, 0, 1,
-0.4104004, 1.339753, 0.4495167, 0.03137255, 1, 0, 1,
-0.4049791, -0.3542764, -2.504299, 0.02745098, 1, 0, 1,
-0.4027559, 1.426623, 0.4145666, 0.01960784, 1, 0, 1,
-0.3999341, -2.052466, -4.350261, 0.01568628, 1, 0, 1,
-0.3988442, 0.1338021, -0.7789614, 0.007843138, 1, 0, 1,
-0.3951704, -1.77676, -1.890648, 0.003921569, 1, 0, 1,
-0.3951098, 0.640808, -1.819403, 0, 1, 0.003921569, 1,
-0.3943742, -0.7665429, -0.5467317, 0, 1, 0.01176471, 1,
-0.3914233, 1.261003, -0.4512289, 0, 1, 0.01568628, 1,
-0.3893096, 0.2034933, -2.245983, 0, 1, 0.02352941, 1,
-0.3880979, -0.5903296, -2.402625, 0, 1, 0.02745098, 1,
-0.3837105, -1.685406, -3.165574, 0, 1, 0.03529412, 1,
-0.383315, 0.2568972, -0.9719242, 0, 1, 0.03921569, 1,
-0.3813429, 1.033173, 0.3762659, 0, 1, 0.04705882, 1,
-0.377758, 1.322746, -0.9280623, 0, 1, 0.05098039, 1,
-0.3775825, -0.4179376, -1.49562, 0, 1, 0.05882353, 1,
-0.3695343, 0.1534161, -0.09297479, 0, 1, 0.0627451, 1,
-0.36862, 0.007129101, -1.159597, 0, 1, 0.07058824, 1,
-0.3675278, 1.626101, -0.9019891, 0, 1, 0.07450981, 1,
-0.3656311, -0.8282439, -2.152875, 0, 1, 0.08235294, 1,
-0.3634445, 2.19672, 0.9313518, 0, 1, 0.08627451, 1,
-0.3611249, -1.035632, -1.600027, 0, 1, 0.09411765, 1,
-0.3604279, 0.2379113, -2.399021, 0, 1, 0.1019608, 1,
-0.353449, -1.453348, -3.814275, 0, 1, 0.1058824, 1,
-0.3512287, -0.7134084, -2.468686, 0, 1, 0.1137255, 1,
-0.348701, 0.2205155, -0.5221907, 0, 1, 0.1176471, 1,
-0.3468767, -1.31111, -4.859632, 0, 1, 0.1254902, 1,
-0.3468304, 0.9705926, 0.4637669, 0, 1, 0.1294118, 1,
-0.3432635, 0.6434875, -0.2119604, 0, 1, 0.1372549, 1,
-0.342729, -1.678609, -3.479546, 0, 1, 0.1411765, 1,
-0.3374722, 0.607493, -1.181092, 0, 1, 0.1490196, 1,
-0.3335765, 1.061803, 0.5492337, 0, 1, 0.1529412, 1,
-0.333323, 1.26597, -0.04995473, 0, 1, 0.1607843, 1,
-0.3314255, 0.1775898, -0.5772972, 0, 1, 0.1647059, 1,
-0.3292933, -0.01453004, 1.079846, 0, 1, 0.172549, 1,
-0.3280462, -0.6584635, -3.126802, 0, 1, 0.1764706, 1,
-0.3254396, 0.4477162, 0.7894488, 0, 1, 0.1843137, 1,
-0.3236793, -1.052911, -3.866755, 0, 1, 0.1882353, 1,
-0.303549, 1.218247, 0.5374237, 0, 1, 0.1960784, 1,
-0.3031964, -2.047506, -1.615443, 0, 1, 0.2039216, 1,
-0.3010635, 0.4862737, 0.9314837, 0, 1, 0.2078431, 1,
-0.2996108, 0.9443719, -0.762053, 0, 1, 0.2156863, 1,
-0.2993712, 0.521416, -1.425982, 0, 1, 0.2196078, 1,
-0.2934909, -2.201505, -4.328323, 0, 1, 0.227451, 1,
-0.290481, -0.07366161, -2.236785, 0, 1, 0.2313726, 1,
-0.2877989, -1.96631, -4.185588, 0, 1, 0.2392157, 1,
-0.2863097, -0.8287537, -1.687412, 0, 1, 0.2431373, 1,
-0.2847161, 0.7213018, -1.491983, 0, 1, 0.2509804, 1,
-0.2830455, 0.806564, -1.820988, 0, 1, 0.254902, 1,
-0.2800152, 0.2340855, 0.1616444, 0, 1, 0.2627451, 1,
-0.2793988, 1.060074, 0.8853223, 0, 1, 0.2666667, 1,
-0.2785172, -0.4291924, -2.431243, 0, 1, 0.2745098, 1,
-0.2773986, 1.358602, 0.5294189, 0, 1, 0.2784314, 1,
-0.2737513, -0.2373039, -2.510426, 0, 1, 0.2862745, 1,
-0.2704252, 0.5888793, -0.02377583, 0, 1, 0.2901961, 1,
-0.2662666, 0.9868244, -0.3874494, 0, 1, 0.2980392, 1,
-0.2658004, 0.9912763, -0.9776834, 0, 1, 0.3058824, 1,
-0.2628874, -1.109432, -3.03539, 0, 1, 0.3098039, 1,
-0.2601129, 0.07338237, -1.18723, 0, 1, 0.3176471, 1,
-0.2596523, 1.436789, -0.8517402, 0, 1, 0.3215686, 1,
-0.2582574, 1.121134, -1.426747, 0, 1, 0.3294118, 1,
-0.2573842, 1.95666, -0.6399385, 0, 1, 0.3333333, 1,
-0.2569732, -1.153483, -3.506209, 0, 1, 0.3411765, 1,
-0.2535197, -1.324417, -3.729193, 0, 1, 0.345098, 1,
-0.250365, -0.5954321, -3.49589, 0, 1, 0.3529412, 1,
-0.2501222, -0.9328347, -3.598801, 0, 1, 0.3568628, 1,
-0.2492541, -1.053216, -1.338744, 0, 1, 0.3647059, 1,
-0.2440005, 1.12572, 0.767908, 0, 1, 0.3686275, 1,
-0.2416818, 0.2000331, -1.438411, 0, 1, 0.3764706, 1,
-0.2363519, 0.728012, -3.127777, 0, 1, 0.3803922, 1,
-0.2313266, 2.040904, -1.281896, 0, 1, 0.3882353, 1,
-0.2290836, -2.145002, -1.611254, 0, 1, 0.3921569, 1,
-0.2244806, -1.658869, -3.13348, 0, 1, 0.4, 1,
-0.2160754, 0.7842363, -0.1398367, 0, 1, 0.4078431, 1,
-0.2159285, -0.2465472, -5.106505, 0, 1, 0.4117647, 1,
-0.2087451, 1.030484, 0.0454376, 0, 1, 0.4196078, 1,
-0.2075407, 0.09578133, -2.491567, 0, 1, 0.4235294, 1,
-0.1970087, -1.304688, -3.714578, 0, 1, 0.4313726, 1,
-0.1902893, 3.745284, -1.069421, 0, 1, 0.4352941, 1,
-0.1879877, -0.08183464, -2.38007, 0, 1, 0.4431373, 1,
-0.1869763, -0.1235227, -1.72222, 0, 1, 0.4470588, 1,
-0.1848177, 0.2293714, -2.300593, 0, 1, 0.454902, 1,
-0.1846344, 0.83412, -0.2680592, 0, 1, 0.4588235, 1,
-0.1787908, 0.2507611, -0.3390184, 0, 1, 0.4666667, 1,
-0.1764831, -1.782867, -3.081543, 0, 1, 0.4705882, 1,
-0.175106, 0.2463063, -1.186721, 0, 1, 0.4784314, 1,
-0.1750327, 1.33734, 0.8318018, 0, 1, 0.4823529, 1,
-0.1743416, -0.3676544, -3.412044, 0, 1, 0.4901961, 1,
-0.1726047, -1.028804, -2.699908, 0, 1, 0.4941176, 1,
-0.1675362, 1.296072, 0.820673, 0, 1, 0.5019608, 1,
-0.1672297, -0.9809605, -1.586016, 0, 1, 0.509804, 1,
-0.1642514, -2.337885, -1.91208, 0, 1, 0.5137255, 1,
-0.1607042, -2.035475, -4.35649, 0, 1, 0.5215687, 1,
-0.148632, 0.7204906, -2.018375, 0, 1, 0.5254902, 1,
-0.1454197, 0.3974302, 1.581476, 0, 1, 0.5333334, 1,
-0.1436455, 1.809398, 0.8343174, 0, 1, 0.5372549, 1,
-0.1402428, 0.5334576, -0.747237, 0, 1, 0.5450981, 1,
-0.1380972, -1.268579, -4.222215, 0, 1, 0.5490196, 1,
-0.1380402, 0.157215, -0.3931694, 0, 1, 0.5568628, 1,
-0.1357755, -1.843637, -0.2697845, 0, 1, 0.5607843, 1,
-0.1323528, -0.5665916, -2.151304, 0, 1, 0.5686275, 1,
-0.1301275, 0.9490545, -0.9892816, 0, 1, 0.572549, 1,
-0.1288532, 0.1691134, -1.846705, 0, 1, 0.5803922, 1,
-0.128371, 0.3475456, -0.750284, 0, 1, 0.5843138, 1,
-0.1280943, 0.1363953, -1.606182, 0, 1, 0.5921569, 1,
-0.1280677, 0.213659, -0.5112399, 0, 1, 0.5960785, 1,
-0.1263331, 0.8067552, 0.5412159, 0, 1, 0.6039216, 1,
-0.1249973, -0.1938189, -0.6512413, 0, 1, 0.6117647, 1,
-0.1249246, -0.4672889, -2.752481, 0, 1, 0.6156863, 1,
-0.1241545, -0.3829224, -4.373394, 0, 1, 0.6235294, 1,
-0.1241211, -0.469203, -2.234788, 0, 1, 0.627451, 1,
-0.1219479, 0.7549638, 0.9402317, 0, 1, 0.6352941, 1,
-0.1173884, 0.8585672, 0.1238067, 0, 1, 0.6392157, 1,
-0.1165226, 0.779135, 0.351593, 0, 1, 0.6470588, 1,
-0.1146202, 1.551533, -1.256287, 0, 1, 0.6509804, 1,
-0.1138234, -0.8741695, -3.702138, 0, 1, 0.6588235, 1,
-0.110164, 0.296369, -0.4254535, 0, 1, 0.6627451, 1,
-0.1091327, -1.383243, -3.779012, 0, 1, 0.6705883, 1,
-0.104949, 0.5841222, 1.177612, 0, 1, 0.6745098, 1,
-0.1010337, 0.2926946, 0.3846962, 0, 1, 0.682353, 1,
-0.09913195, 0.5671532, 0.1671458, 0, 1, 0.6862745, 1,
-0.08471879, -0.141035, -3.402843, 0, 1, 0.6941177, 1,
-0.07105087, 0.7634805, -0.616058, 0, 1, 0.7019608, 1,
-0.07075392, -0.6896065, -2.078174, 0, 1, 0.7058824, 1,
-0.07060453, 1.584062, -0.6267783, 0, 1, 0.7137255, 1,
-0.06569395, 0.00831316, -2.035924, 0, 1, 0.7176471, 1,
-0.06524452, -1.961134, -3.430575, 0, 1, 0.7254902, 1,
-0.06463493, -0.3427585, -1.864575, 0, 1, 0.7294118, 1,
-0.0641124, 0.6776487, 0.2069429, 0, 1, 0.7372549, 1,
-0.05901966, 1.143338, -0.235771, 0, 1, 0.7411765, 1,
-0.05628659, 1.011116, -0.5050951, 0, 1, 0.7490196, 1,
-0.05414619, -0.9169695, -3.694886, 0, 1, 0.7529412, 1,
-0.04889543, 0.9464729, -1.484619, 0, 1, 0.7607843, 1,
-0.04596685, -0.0948496, -4.537588, 0, 1, 0.7647059, 1,
-0.04554357, 0.3259201, -0.03724363, 0, 1, 0.772549, 1,
-0.04188567, -0.3678477, -3.185225, 0, 1, 0.7764706, 1,
-0.04070117, -0.06975685, -2.517191, 0, 1, 0.7843137, 1,
-0.04056437, -1.639006, -3.415838, 0, 1, 0.7882353, 1,
-0.03860182, 0.09089945, -0.4645712, 0, 1, 0.7960784, 1,
-0.0385115, 2.384258, -0.4872225, 0, 1, 0.8039216, 1,
-0.03494943, -0.8873613, -1.873648, 0, 1, 0.8078431, 1,
-0.03423551, 1.268108, 1.974051, 0, 1, 0.8156863, 1,
-0.03357963, -0.6362327, -4.483931, 0, 1, 0.8196079, 1,
-0.03135683, 1.187767, -0.8897834, 0, 1, 0.827451, 1,
-0.03096419, 1.230282, -0.9294294, 0, 1, 0.8313726, 1,
-0.0262458, -1.976735, -4.065244, 0, 1, 0.8392157, 1,
-0.0252378, -0.1963138, -3.755872, 0, 1, 0.8431373, 1,
-0.02478705, 0.9810424, 0.7677367, 0, 1, 0.8509804, 1,
-0.0210053, 0.3759604, 0.1120901, 0, 1, 0.854902, 1,
-0.0205788, -0.05149073, -2.350008, 0, 1, 0.8627451, 1,
-0.0158575, -0.6582325, -2.801444, 0, 1, 0.8666667, 1,
-0.00801773, -0.9066513, -3.351593, 0, 1, 0.8745098, 1,
0.009110663, -0.7305974, 2.107845, 0, 1, 0.8784314, 1,
0.00953907, -0.3598805, 3.436909, 0, 1, 0.8862745, 1,
0.0130546, 0.6844866, -0.9141158, 0, 1, 0.8901961, 1,
0.01353811, -0.574133, 2.832885, 0, 1, 0.8980392, 1,
0.01768665, -0.9410471, 2.177598, 0, 1, 0.9058824, 1,
0.01817246, -0.1249817, 1.784082, 0, 1, 0.9098039, 1,
0.02354736, -0.9320336, 2.081153, 0, 1, 0.9176471, 1,
0.02391706, -0.4467089, 2.293281, 0, 1, 0.9215686, 1,
0.02531223, 0.6494514, -0.08632723, 0, 1, 0.9294118, 1,
0.02760931, -0.5075646, 4.094585, 0, 1, 0.9333333, 1,
0.03027017, 0.3270843, -0.7287355, 0, 1, 0.9411765, 1,
0.03660993, -1.040886, 2.013858, 0, 1, 0.945098, 1,
0.03830919, -0.6461002, 3.060954, 0, 1, 0.9529412, 1,
0.04443211, 0.8459794, -1.821147, 0, 1, 0.9568627, 1,
0.04513353, 1.374296, 1.560441, 0, 1, 0.9647059, 1,
0.04629468, 0.5840428, 0.1784507, 0, 1, 0.9686275, 1,
0.04916645, -0.9016452, 1.983646, 0, 1, 0.9764706, 1,
0.05011537, 0.2118384, 0.08407048, 0, 1, 0.9803922, 1,
0.05151257, -1.999837, 1.153316, 0, 1, 0.9882353, 1,
0.05167961, -0.2117452, 2.682086, 0, 1, 0.9921569, 1,
0.05440949, -1.08204, 3.128041, 0, 1, 1, 1,
0.05602256, 1.079981, 0.6871842, 0, 0.9921569, 1, 1,
0.05846811, 1.063659, 1.668514, 0, 0.9882353, 1, 1,
0.06066601, 1.313316, -0.1213455, 0, 0.9803922, 1, 1,
0.06402374, 0.2885653, -0.1187605, 0, 0.9764706, 1, 1,
0.06984136, 0.4177907, 0.5000055, 0, 0.9686275, 1, 1,
0.07344194, 1.067098, 0.5980876, 0, 0.9647059, 1, 1,
0.07609461, -1.50589, 3.171914, 0, 0.9568627, 1, 1,
0.08102741, 0.2613553, -1.209664, 0, 0.9529412, 1, 1,
0.0834397, 0.2324884, -0.7218217, 0, 0.945098, 1, 1,
0.08862199, -2.025435, 2.404673, 0, 0.9411765, 1, 1,
0.09541582, -1.15694, 1.527552, 0, 0.9333333, 1, 1,
0.09713857, -1.268091, 2.336699, 0, 0.9294118, 1, 1,
0.09879538, -0.8854536, 2.608562, 0, 0.9215686, 1, 1,
0.1009668, 0.102878, -0.1537411, 0, 0.9176471, 1, 1,
0.1021205, -0.4880323, 3.118086, 0, 0.9098039, 1, 1,
0.1026709, 0.1465402, 1.214954, 0, 0.9058824, 1, 1,
0.1042534, -0.8889564, 2.671602, 0, 0.8980392, 1, 1,
0.1055977, 0.2271034, 0.172397, 0, 0.8901961, 1, 1,
0.105877, -0.6527479, 2.964993, 0, 0.8862745, 1, 1,
0.107957, 0.6621861, -0.9741174, 0, 0.8784314, 1, 1,
0.1152352, -1.174959, 2.998771, 0, 0.8745098, 1, 1,
0.1152866, -0.4538058, 4.976963, 0, 0.8666667, 1, 1,
0.1170266, 0.7154855, -0.7818124, 0, 0.8627451, 1, 1,
0.1172674, 0.5076583, 1.021362, 0, 0.854902, 1, 1,
0.1179944, 1.985881, -0.4503336, 0, 0.8509804, 1, 1,
0.1206275, -2.050112, 0.8835188, 0, 0.8431373, 1, 1,
0.1210123, 0.6939704, 0.9052638, 0, 0.8392157, 1, 1,
0.1232108, -0.7657491, 5.624604, 0, 0.8313726, 1, 1,
0.1258309, -0.8583696, 3.470822, 0, 0.827451, 1, 1,
0.1305591, 0.8835618, -0.6645542, 0, 0.8196079, 1, 1,
0.1351054, -0.3979423, 1.484169, 0, 0.8156863, 1, 1,
0.1358216, 0.2288943, 1.046118, 0, 0.8078431, 1, 1,
0.1362953, 0.6112385, -1.278854, 0, 0.8039216, 1, 1,
0.1428016, 1.088245, -1.04289, 0, 0.7960784, 1, 1,
0.1428425, 2.468648, -1.596788, 0, 0.7882353, 1, 1,
0.1445689, 0.1678783, 0.1553986, 0, 0.7843137, 1, 1,
0.1499174, -0.6448062, 2.825671, 0, 0.7764706, 1, 1,
0.1533172, -1.264564, 3.731947, 0, 0.772549, 1, 1,
0.1545486, -0.7762078, 4.66541, 0, 0.7647059, 1, 1,
0.1569353, -1.888247, 3.385535, 0, 0.7607843, 1, 1,
0.1581463, -1.10528, 3.040926, 0, 0.7529412, 1, 1,
0.1620438, 0.9636907, -1.090343, 0, 0.7490196, 1, 1,
0.1631283, 1.004821, -1.570871, 0, 0.7411765, 1, 1,
0.1656528, 1.389842, 0.4541357, 0, 0.7372549, 1, 1,
0.1670562, -0.7158097, 4.118107, 0, 0.7294118, 1, 1,
0.1693931, 0.4258615, 0.3462878, 0, 0.7254902, 1, 1,
0.176232, -0.8070985, 2.427244, 0, 0.7176471, 1, 1,
0.1785471, -0.241965, 1.442159, 0, 0.7137255, 1, 1,
0.1801465, -0.6074743, 1.589961, 0, 0.7058824, 1, 1,
0.1820865, 0.2690536, 0.8727875, 0, 0.6980392, 1, 1,
0.1832424, 0.2133592, 2.215812, 0, 0.6941177, 1, 1,
0.184053, -0.4380681, 1.381264, 0, 0.6862745, 1, 1,
0.1856029, -1.045577, 3.521919, 0, 0.682353, 1, 1,
0.1891708, -0.2250545, 3.002304, 0, 0.6745098, 1, 1,
0.1909893, -0.9700202, 1.839673, 0, 0.6705883, 1, 1,
0.2057847, 0.1751579, 0.4274804, 0, 0.6627451, 1, 1,
0.2114898, -1.822036, 2.580028, 0, 0.6588235, 1, 1,
0.2120306, -0.7760976, 1.260816, 0, 0.6509804, 1, 1,
0.2123982, 0.507553, 0.8106753, 0, 0.6470588, 1, 1,
0.2132853, 0.8788719, 1.627705, 0, 0.6392157, 1, 1,
0.2138749, 0.5861473, 1.799912, 0, 0.6352941, 1, 1,
0.2150088, 0.3264644, 1.204202, 0, 0.627451, 1, 1,
0.2205052, 0.206444, -0.3537, 0, 0.6235294, 1, 1,
0.2238712, 0.3767679, 0.8398278, 0, 0.6156863, 1, 1,
0.2248696, 0.600905, -1.102886, 0, 0.6117647, 1, 1,
0.2256427, -1.169938, 3.85781, 0, 0.6039216, 1, 1,
0.2271562, 2.44803, 0.6960791, 0, 0.5960785, 1, 1,
0.2323817, -1.897165, 3.802529, 0, 0.5921569, 1, 1,
0.2324187, -0.1525852, 1.425811, 0, 0.5843138, 1, 1,
0.2350563, -0.4269624, 1.798393, 0, 0.5803922, 1, 1,
0.2357569, -0.04678889, 1.55409, 0, 0.572549, 1, 1,
0.2366965, -0.7318732, 2.651279, 0, 0.5686275, 1, 1,
0.2395105, -2.144147, 3.620697, 0, 0.5607843, 1, 1,
0.2400018, 2.177384, 1.139166, 0, 0.5568628, 1, 1,
0.2402422, 0.6037612, 2.277329, 0, 0.5490196, 1, 1,
0.2446868, 0.3967591, -0.7488447, 0, 0.5450981, 1, 1,
0.2449466, 0.7877312, 0.5004907, 0, 0.5372549, 1, 1,
0.2466134, 0.2940802, 1.677114, 0, 0.5333334, 1, 1,
0.2484906, 0.4122532, -0.3151603, 0, 0.5254902, 1, 1,
0.2503589, 0.8731207, 0.762114, 0, 0.5215687, 1, 1,
0.2527877, 0.902096, -1.009982, 0, 0.5137255, 1, 1,
0.2556466, 0.658224, -0.5257019, 0, 0.509804, 1, 1,
0.2563785, -0.1097382, 1.391297, 0, 0.5019608, 1, 1,
0.2569503, -0.05008253, 3.667815, 0, 0.4941176, 1, 1,
0.2599133, -2.245252, 1.498025, 0, 0.4901961, 1, 1,
0.2611956, -1.386534, 3.152185, 0, 0.4823529, 1, 1,
0.2642246, 1.630389, -0.1704876, 0, 0.4784314, 1, 1,
0.2649575, -1.356831, 3.743394, 0, 0.4705882, 1, 1,
0.2682986, -1.576188, 2.184636, 0, 0.4666667, 1, 1,
0.2710269, 0.06584555, 0.616601, 0, 0.4588235, 1, 1,
0.2713538, -0.5281082, 2.200783, 0, 0.454902, 1, 1,
0.2730957, -1.036567, 4.394888, 0, 0.4470588, 1, 1,
0.2764332, -0.7462144, 2.131252, 0, 0.4431373, 1, 1,
0.2764347, -0.5180116, 2.526621, 0, 0.4352941, 1, 1,
0.2787568, 0.3669668, -0.05681867, 0, 0.4313726, 1, 1,
0.280071, 0.81739, 0.135791, 0, 0.4235294, 1, 1,
0.2840073, -2.377563, 5.944765, 0, 0.4196078, 1, 1,
0.2845689, 0.7921517, 1.315587, 0, 0.4117647, 1, 1,
0.2882196, -1.505733, 2.203789, 0, 0.4078431, 1, 1,
0.290723, -0.3470871, 1.492141, 0, 0.4, 1, 1,
0.292264, -0.0003822886, 1.002654, 0, 0.3921569, 1, 1,
0.2956404, -1.180706, 2.88913, 0, 0.3882353, 1, 1,
0.2991804, 0.4891621, 1.164633, 0, 0.3803922, 1, 1,
0.2998439, -0.02145033, 1.894957, 0, 0.3764706, 1, 1,
0.3001306, 1.307149, 1.091437, 0, 0.3686275, 1, 1,
0.3047746, 0.4441742, 2.235496, 0, 0.3647059, 1, 1,
0.3058234, 1.486137, -0.8730761, 0, 0.3568628, 1, 1,
0.307057, 0.06064096, -0.7434732, 0, 0.3529412, 1, 1,
0.3084342, -1.008578, 3.759338, 0, 0.345098, 1, 1,
0.3087133, 1.715423, -0.07258531, 0, 0.3411765, 1, 1,
0.309503, 0.3410065, -0.06809741, 0, 0.3333333, 1, 1,
0.3111956, -0.07949653, 1.411108, 0, 0.3294118, 1, 1,
0.3171578, 0.876729, 0.4465769, 0, 0.3215686, 1, 1,
0.3175068, 1.46875, 1.490182, 0, 0.3176471, 1, 1,
0.323666, -0.1240092, 1.232338, 0, 0.3098039, 1, 1,
0.3240895, 1.575089, -1.231374, 0, 0.3058824, 1, 1,
0.326772, -0.5008438, 2.557411, 0, 0.2980392, 1, 1,
0.3295416, -1.581657, 1.724401, 0, 0.2901961, 1, 1,
0.331053, 0.8282341, 0.8250243, 0, 0.2862745, 1, 1,
0.3311769, -0.9237301, 0.9242652, 0, 0.2784314, 1, 1,
0.334906, -0.06887224, 1.49652, 0, 0.2745098, 1, 1,
0.3359472, 0.605021, 0.8034489, 0, 0.2666667, 1, 1,
0.3371058, -1.599129, 0.3511259, 0, 0.2627451, 1, 1,
0.3396365, -0.07747149, 2.714401, 0, 0.254902, 1, 1,
0.3409152, -1.486176, 2.770517, 0, 0.2509804, 1, 1,
0.344548, -0.04502166, 0.2547711, 0, 0.2431373, 1, 1,
0.3453465, -0.47714, 1.991757, 0, 0.2392157, 1, 1,
0.3489202, -0.606171, 1.273556, 0, 0.2313726, 1, 1,
0.3571099, -0.7853003, 2.212857, 0, 0.227451, 1, 1,
0.3603577, 0.8915586, -0.0913071, 0, 0.2196078, 1, 1,
0.3617955, -0.5759993, 1.043413, 0, 0.2156863, 1, 1,
0.3620329, 0.002480631, 3.122102, 0, 0.2078431, 1, 1,
0.3629609, -0.830743, 3.325045, 0, 0.2039216, 1, 1,
0.3680421, 0.1345603, -0.5223408, 0, 0.1960784, 1, 1,
0.3707525, 0.6592419, 0.8275276, 0, 0.1882353, 1, 1,
0.3770014, 2.462489, 0.1543133, 0, 0.1843137, 1, 1,
0.3780294, 0.8218692, 0.5291448, 0, 0.1764706, 1, 1,
0.3822465, -0.9025124, 3.629958, 0, 0.172549, 1, 1,
0.3823825, 0.567047, 0.3253445, 0, 0.1647059, 1, 1,
0.3846404, 0.8676823, -1.805381, 0, 0.1607843, 1, 1,
0.3864657, 0.2884059, -0.3943107, 0, 0.1529412, 1, 1,
0.387623, -1.931011, 3.81891, 0, 0.1490196, 1, 1,
0.3888217, 2.281786, 0.367333, 0, 0.1411765, 1, 1,
0.3892348, -0.2933967, 2.454643, 0, 0.1372549, 1, 1,
0.3954616, 0.350913, 0.4699196, 0, 0.1294118, 1, 1,
0.3979014, 0.1286552, 1.211502, 0, 0.1254902, 1, 1,
0.4006628, -1.322243, 3.344669, 0, 0.1176471, 1, 1,
0.4025894, -0.1354209, 1.823225, 0, 0.1137255, 1, 1,
0.4026485, 0.7202427, -0.1716153, 0, 0.1058824, 1, 1,
0.4031568, 0.9039549, -0.6489093, 0, 0.09803922, 1, 1,
0.4068381, 1.301618, -0.2081137, 0, 0.09411765, 1, 1,
0.4122931, 0.2608321, 0.9454939, 0, 0.08627451, 1, 1,
0.4137992, 0.0206529, 1.238457, 0, 0.08235294, 1, 1,
0.4156626, -1.583136, 1.871548, 0, 0.07450981, 1, 1,
0.4161738, 1.209669, 0.5891058, 0, 0.07058824, 1, 1,
0.4177903, -2.53368, 1.892268, 0, 0.0627451, 1, 1,
0.4181491, -0.1597457, 2.122663, 0, 0.05882353, 1, 1,
0.418741, 1.656223, -0.5290553, 0, 0.05098039, 1, 1,
0.4282266, 0.5494044, -1.275988, 0, 0.04705882, 1, 1,
0.4291319, 0.726652, 0.840511, 0, 0.03921569, 1, 1,
0.4330261, -1.742216, 2.877367, 0, 0.03529412, 1, 1,
0.4336446, -1.06235, 3.311125, 0, 0.02745098, 1, 1,
0.4400864, -2.805818, 3.205922, 0, 0.02352941, 1, 1,
0.4420921, -0.5529781, 1.232202, 0, 0.01568628, 1, 1,
0.4459738, -0.6289173, 2.434131, 0, 0.01176471, 1, 1,
0.4471543, -0.2619292, 2.658082, 0, 0.003921569, 1, 1,
0.452075, -0.7772462, 2.635178, 0.003921569, 0, 1, 1,
0.4545552, 0.687574, 1.147617, 0.007843138, 0, 1, 1,
0.4599653, 1.427721, 0.4986956, 0.01568628, 0, 1, 1,
0.4614357, 0.8206926, 0.7551795, 0.01960784, 0, 1, 1,
0.4625117, 0.5717789, 0.830018, 0.02745098, 0, 1, 1,
0.4641644, 0.1272602, 0.6873062, 0.03137255, 0, 1, 1,
0.466465, -0.5885449, 3.407427, 0.03921569, 0, 1, 1,
0.4677267, -0.8096337, 3.081291, 0.04313726, 0, 1, 1,
0.4706169, -0.3632833, 0.1331902, 0.05098039, 0, 1, 1,
0.4737758, -1.212281, 2.639003, 0.05490196, 0, 1, 1,
0.4783538, 0.1662102, 1.486821, 0.0627451, 0, 1, 1,
0.4824107, -0.2784014, 2.305133, 0.06666667, 0, 1, 1,
0.4848776, -1.1681, 3.483242, 0.07450981, 0, 1, 1,
0.4852106, 1.190422, -0.8478454, 0.07843138, 0, 1, 1,
0.4876671, -0.1781316, 2.061515, 0.08627451, 0, 1, 1,
0.4888594, -0.6388407, 2.76425, 0.09019608, 0, 1, 1,
0.492756, 0.729683, 0.5922559, 0.09803922, 0, 1, 1,
0.4983416, 1.841056, -1.917624, 0.1058824, 0, 1, 1,
0.498922, -0.295698, 1.327831, 0.1098039, 0, 1, 1,
0.4989928, -0.7829022, 3.270879, 0.1176471, 0, 1, 1,
0.5017905, 0.01001394, 1.398489, 0.1215686, 0, 1, 1,
0.5021316, 1.324345, -1.06546, 0.1294118, 0, 1, 1,
0.5043771, -0.1172149, 1.193634, 0.1333333, 0, 1, 1,
0.5066268, 1.550649, -0.5098313, 0.1411765, 0, 1, 1,
0.5091364, -0.285131, 2.589121, 0.145098, 0, 1, 1,
0.515849, 0.190773, 1.292373, 0.1529412, 0, 1, 1,
0.517242, -0.4321719, 2.060563, 0.1568628, 0, 1, 1,
0.5208635, -1.727361, 2.178314, 0.1647059, 0, 1, 1,
0.5212412, 0.5656445, 2.232353, 0.1686275, 0, 1, 1,
0.5217966, -1.020694, 2.701118, 0.1764706, 0, 1, 1,
0.5228302, 0.266796, -0.7876575, 0.1803922, 0, 1, 1,
0.5247008, -1.368093, 2.089686, 0.1882353, 0, 1, 1,
0.5291742, 0.3172156, -0.8566133, 0.1921569, 0, 1, 1,
0.5312759, 1.990027, -0.1947247, 0.2, 0, 1, 1,
0.5317271, -0.6918301, 2.235901, 0.2078431, 0, 1, 1,
0.5417054, -1.781026, 2.761341, 0.2117647, 0, 1, 1,
0.5442237, 0.692413, 2.882987, 0.2196078, 0, 1, 1,
0.5463517, 0.2574324, 0.7680982, 0.2235294, 0, 1, 1,
0.5471189, 2.487612, -0.1122142, 0.2313726, 0, 1, 1,
0.5520148, 0.07742324, 0.5285197, 0.2352941, 0, 1, 1,
0.5577075, -1.417782, 3.087952, 0.2431373, 0, 1, 1,
0.5611742, 0.1319931, 2.466914, 0.2470588, 0, 1, 1,
0.5670062, -0.6504113, 1.974369, 0.254902, 0, 1, 1,
0.5698578, -0.5446159, 2.783107, 0.2588235, 0, 1, 1,
0.574646, 1.09648, 1.986191, 0.2666667, 0, 1, 1,
0.5747573, -0.6015735, 3.724147, 0.2705882, 0, 1, 1,
0.5748012, 0.2922855, 1.532382, 0.2784314, 0, 1, 1,
0.5811848, -0.7285686, 3.248465, 0.282353, 0, 1, 1,
0.5979133, 0.5673699, 0.7762516, 0.2901961, 0, 1, 1,
0.597935, 0.4060059, 0.9801906, 0.2941177, 0, 1, 1,
0.5995789, 0.3551568, 1.461809, 0.3019608, 0, 1, 1,
0.6021952, 0.520218, -0.4330003, 0.3098039, 0, 1, 1,
0.6084784, -1.577649, 2.613036, 0.3137255, 0, 1, 1,
0.6167923, 1.361671, -0.7875302, 0.3215686, 0, 1, 1,
0.6215508, -0.3810336, 2.390337, 0.3254902, 0, 1, 1,
0.6245443, 0.4966335, -0.3745011, 0.3333333, 0, 1, 1,
0.6257095, -1.074744, 3.767596, 0.3372549, 0, 1, 1,
0.6269435, -1.152724, 1.735055, 0.345098, 0, 1, 1,
0.6294156, -0.1507032, 2.340311, 0.3490196, 0, 1, 1,
0.6314189, 0.5951344, 0.6189019, 0.3568628, 0, 1, 1,
0.6351866, -1.052925, 2.310886, 0.3607843, 0, 1, 1,
0.6428897, -1.347357, 1.040458, 0.3686275, 0, 1, 1,
0.6430786, 0.2512175, 2.94115, 0.372549, 0, 1, 1,
0.6435803, -0.5639346, 2.98701, 0.3803922, 0, 1, 1,
0.6475529, -0.1089804, 3.074196, 0.3843137, 0, 1, 1,
0.6485254, -0.9616501, 3.020027, 0.3921569, 0, 1, 1,
0.651282, 0.1423873, 1.551156, 0.3960784, 0, 1, 1,
0.6530276, -0.4628303, 0.05973927, 0.4039216, 0, 1, 1,
0.6539693, 0.1589693, 0.5113835, 0.4117647, 0, 1, 1,
0.654661, 0.2970585, 1.784533, 0.4156863, 0, 1, 1,
0.6591555, -0.4187633, 1.808851, 0.4235294, 0, 1, 1,
0.6592859, -0.8153126, 3.423261, 0.427451, 0, 1, 1,
0.6639503, 0.0696642, 1.811409, 0.4352941, 0, 1, 1,
0.6675986, -0.4431859, 2.953774, 0.4392157, 0, 1, 1,
0.6691922, 0.1828165, 1.526968, 0.4470588, 0, 1, 1,
0.6705272, 1.004766, 0.6208946, 0.4509804, 0, 1, 1,
0.6717108, 0.3098708, 0.210294, 0.4588235, 0, 1, 1,
0.6764578, 0.9140242, 1.527197, 0.4627451, 0, 1, 1,
0.6767495, -1.485729, 2.049855, 0.4705882, 0, 1, 1,
0.6818471, -0.4919832, 3.275748, 0.4745098, 0, 1, 1,
0.6826105, 0.4664947, 1.710588, 0.4823529, 0, 1, 1,
0.6851909, -0.9886247, 0.7092004, 0.4862745, 0, 1, 1,
0.6875338, -0.4282998, 4.319291, 0.4941176, 0, 1, 1,
0.6930609, -1.309407, 2.871459, 0.5019608, 0, 1, 1,
0.6972874, 1.236139, 0.7899013, 0.5058824, 0, 1, 1,
0.7033182, -1.255845, 3.316602, 0.5137255, 0, 1, 1,
0.7099349, 1.273401, 0.3830209, 0.5176471, 0, 1, 1,
0.7124026, -0.2130214, 2.184898, 0.5254902, 0, 1, 1,
0.7165995, -0.338032, 2.265442, 0.5294118, 0, 1, 1,
0.7178493, -1.648265, 3.190239, 0.5372549, 0, 1, 1,
0.7215829, 0.0008884022, 0.9967023, 0.5411765, 0, 1, 1,
0.7256145, 0.8545703, 0.6094563, 0.5490196, 0, 1, 1,
0.7332124, 0.4017632, 1.869701, 0.5529412, 0, 1, 1,
0.7343152, -1.124676, 2.207409, 0.5607843, 0, 1, 1,
0.7399446, -0.393392, 2.331817, 0.5647059, 0, 1, 1,
0.7457494, 1.701017, 0.2155762, 0.572549, 0, 1, 1,
0.7490727, 0.9765369, 1.148299, 0.5764706, 0, 1, 1,
0.7557687, -1.764192, 1.168382, 0.5843138, 0, 1, 1,
0.756438, 0.3022471, 2.548304, 0.5882353, 0, 1, 1,
0.758871, 0.8729435, -0.1216373, 0.5960785, 0, 1, 1,
0.7596616, -0.3511528, 0.4518279, 0.6039216, 0, 1, 1,
0.7664005, 0.7220557, -0.1741676, 0.6078432, 0, 1, 1,
0.7738295, 0.4328552, -0.4088137, 0.6156863, 0, 1, 1,
0.7750595, -0.6990486, 3.053759, 0.6196079, 0, 1, 1,
0.7777454, 0.8181359, 0.1772643, 0.627451, 0, 1, 1,
0.778504, 2.983054, 0.4639855, 0.6313726, 0, 1, 1,
0.7792118, -0.05610227, 0.5959316, 0.6392157, 0, 1, 1,
0.7863775, -0.9460635, 2.373558, 0.6431373, 0, 1, 1,
0.7864559, 1.409666, 0.4718019, 0.6509804, 0, 1, 1,
0.788164, -1.925859, 2.807243, 0.654902, 0, 1, 1,
0.7881653, 0.5737424, 0.4570364, 0.6627451, 0, 1, 1,
0.7893012, 0.356599, 0.4545015, 0.6666667, 0, 1, 1,
0.7907572, -1.311437, 0.3931568, 0.6745098, 0, 1, 1,
0.7908165, 1.222504, -0.3314649, 0.6784314, 0, 1, 1,
0.796302, -1.420014, 3.11925, 0.6862745, 0, 1, 1,
0.7964048, -0.4352432, 2.226842, 0.6901961, 0, 1, 1,
0.7991744, 1.323614, 6.409911e-05, 0.6980392, 0, 1, 1,
0.8063351, 1.031188, 0.9966546, 0.7058824, 0, 1, 1,
0.8072901, -0.2233361, 1.935157, 0.7098039, 0, 1, 1,
0.812611, 0.1287035, 1.887964, 0.7176471, 0, 1, 1,
0.8130074, -0.2715615, 3.063547, 0.7215686, 0, 1, 1,
0.8213419, -0.09693025, 1.008591, 0.7294118, 0, 1, 1,
0.8226783, 1.507677, -0.09410731, 0.7333333, 0, 1, 1,
0.8253091, 0.434536, 0.9633657, 0.7411765, 0, 1, 1,
0.8390903, -0.4258452, 2.269295, 0.7450981, 0, 1, 1,
0.8437828, 2.180057, -0.3966069, 0.7529412, 0, 1, 1,
0.8482103, -0.1391948, 0.5551111, 0.7568628, 0, 1, 1,
0.8492717, -2.399747, 3.702361, 0.7647059, 0, 1, 1,
0.850955, 1.893283, -0.1948414, 0.7686275, 0, 1, 1,
0.8558655, 1.055759, 0.8497354, 0.7764706, 0, 1, 1,
0.870862, -0.5305718, 2.822849, 0.7803922, 0, 1, 1,
0.8713759, 0.1911182, 1.397013, 0.7882353, 0, 1, 1,
0.8716486, 1.172899, -0.1199877, 0.7921569, 0, 1, 1,
0.8769383, -0.743744, 1.400573, 0.8, 0, 1, 1,
0.880024, -0.7519988, 3.081023, 0.8078431, 0, 1, 1,
0.8847095, -0.4440212, 0.8371276, 0.8117647, 0, 1, 1,
0.8888652, 0.2970176, 2.015449, 0.8196079, 0, 1, 1,
0.8930414, -0.6286861, 1.623532, 0.8235294, 0, 1, 1,
0.8978252, 0.6365987, 1.151857, 0.8313726, 0, 1, 1,
0.9042615, -1.25471, 3.178329, 0.8352941, 0, 1, 1,
0.9064167, -0.6880775, 2.099758, 0.8431373, 0, 1, 1,
0.9096866, -0.916975, 2.634782, 0.8470588, 0, 1, 1,
0.9136726, -0.5197448, 1.65167, 0.854902, 0, 1, 1,
0.9137104, 0.418864, 1.131199, 0.8588235, 0, 1, 1,
0.9137856, -0.3072725, 2.222423, 0.8666667, 0, 1, 1,
0.917863, 0.6865921, 0.5554354, 0.8705882, 0, 1, 1,
0.9187014, -0.1317581, 3.02749, 0.8784314, 0, 1, 1,
0.9273259, -0.8468998, 1.568842, 0.8823529, 0, 1, 1,
0.9362627, -0.1415865, 1.824596, 0.8901961, 0, 1, 1,
0.9365053, -0.4978649, 1.781628, 0.8941177, 0, 1, 1,
0.9370544, 1.257079, 0.9179125, 0.9019608, 0, 1, 1,
0.9429702, -0.3929909, 2.889455, 0.9098039, 0, 1, 1,
0.9454038, 0.8096092, 1.72503, 0.9137255, 0, 1, 1,
0.9478357, 0.6069233, 0.7686184, 0.9215686, 0, 1, 1,
0.9511861, 1.206659, 0.7002141, 0.9254902, 0, 1, 1,
0.9554768, -0.7911826, 4.088369, 0.9333333, 0, 1, 1,
0.9567491, -0.5987925, 1.204174, 0.9372549, 0, 1, 1,
0.9608502, 0.2892073, 2.408208, 0.945098, 0, 1, 1,
0.9610972, 1.940217, 0.8115326, 0.9490196, 0, 1, 1,
0.9617596, -1.323802, 2.178897, 0.9568627, 0, 1, 1,
0.9623308, 1.192202, 0.9424599, 0.9607843, 0, 1, 1,
0.963068, -0.7436762, 2.409676, 0.9686275, 0, 1, 1,
0.9652023, -0.837491, 2.89338, 0.972549, 0, 1, 1,
0.9658997, 1.243761, 0.5891094, 0.9803922, 0, 1, 1,
0.9663656, 2.333082, 2.557003, 0.9843137, 0, 1, 1,
0.9672253, -0.5538394, 2.774612, 0.9921569, 0, 1, 1,
0.9705639, 0.6988406, -1.623739, 0.9960784, 0, 1, 1,
0.9759303, 0.3956403, 1.57009, 1, 0, 0.9960784, 1,
0.9780771, 0.7872555, 0.746674, 1, 0, 0.9882353, 1,
0.9793027, -1.720869, 2.786511, 1, 0, 0.9843137, 1,
0.9800692, 1.812622, 2.030097, 1, 0, 0.9764706, 1,
0.9838272, -0.5649689, 0.3427161, 1, 0, 0.972549, 1,
0.9909453, 1.074211, 1.597744, 1, 0, 0.9647059, 1,
0.9921448, -0.613846, 3.598028, 1, 0, 0.9607843, 1,
0.9959706, -0.1153254, 2.25838, 1, 0, 0.9529412, 1,
0.9983869, 0.1648331, 0.5671281, 1, 0, 0.9490196, 1,
1.001035, 1.154982, 0.7248732, 1, 0, 0.9411765, 1,
1.007009, 1.186224, 0.476431, 1, 0, 0.9372549, 1,
1.014511, -1.192412, 1.447409, 1, 0, 0.9294118, 1,
1.014832, -0.09683104, 1.318977, 1, 0, 0.9254902, 1,
1.022536, -0.3494993, 1.038194, 1, 0, 0.9176471, 1,
1.034395, -0.07773991, 2.099912, 1, 0, 0.9137255, 1,
1.034701, -0.9754249, 1.24271, 1, 0, 0.9058824, 1,
1.039861, -0.666215, 3.008522, 1, 0, 0.9019608, 1,
1.043947, -1.570354, 3.330218, 1, 0, 0.8941177, 1,
1.048445, 0.04755026, 1.972611, 1, 0, 0.8862745, 1,
1.057032, 0.5511661, 0.2855871, 1, 0, 0.8823529, 1,
1.064933, -1.259529, 1.802845, 1, 0, 0.8745098, 1,
1.065788, -1.024899, 1.467381, 1, 0, 0.8705882, 1,
1.072407, 0.8024018, 2.414568, 1, 0, 0.8627451, 1,
1.078812, 0.739821, 3.285748, 1, 0, 0.8588235, 1,
1.080217, -1.000796, 3.297542, 1, 0, 0.8509804, 1,
1.081064, -1.040936, 2.132043, 1, 0, 0.8470588, 1,
1.091195, 0.5623673, 0.7608968, 1, 0, 0.8392157, 1,
1.097386, 1.007462, 0.8074827, 1, 0, 0.8352941, 1,
1.097489, -0.8248115, 2.225932, 1, 0, 0.827451, 1,
1.108313, 1.548846, 0.07997523, 1, 0, 0.8235294, 1,
1.114939, -0.03791867, 2.903373, 1, 0, 0.8156863, 1,
1.119646, -0.8212733, 2.663941, 1, 0, 0.8117647, 1,
1.124297, 0.2205539, 0.4146565, 1, 0, 0.8039216, 1,
1.126796, -1.142594, 2.165931, 1, 0, 0.7960784, 1,
1.13467, -0.6658055, 3.401727, 1, 0, 0.7921569, 1,
1.145733, 2.315614, 1.338566, 1, 0, 0.7843137, 1,
1.145842, -0.9249713, 1.525353, 1, 0, 0.7803922, 1,
1.163498, -2.261771, 2.072414, 1, 0, 0.772549, 1,
1.175039, -0.378637, 1.94165, 1, 0, 0.7686275, 1,
1.178259, 1.581388, 0.06512981, 1, 0, 0.7607843, 1,
1.179284, 0.3397254, 1.724571, 1, 0, 0.7568628, 1,
1.183585, 0.2993826, 1.558859, 1, 0, 0.7490196, 1,
1.184007, 0.5873711, 0.9410554, 1, 0, 0.7450981, 1,
1.188361, -0.3747717, 2.753098, 1, 0, 0.7372549, 1,
1.190505, 0.8115115, 1.107113, 1, 0, 0.7333333, 1,
1.190927, -2.942752, 2.995663, 1, 0, 0.7254902, 1,
1.192985, -0.5126105, 0.8887002, 1, 0, 0.7215686, 1,
1.205074, 0.6765171, -1.155037, 1, 0, 0.7137255, 1,
1.210638, 0.1495576, 0.4481574, 1, 0, 0.7098039, 1,
1.213319, -0.7721937, 2.733104, 1, 0, 0.7019608, 1,
1.228513, 1.176905, 2.101859, 1, 0, 0.6941177, 1,
1.230529, 0.9683393, 0.9960443, 1, 0, 0.6901961, 1,
1.234752, -0.4213896, 2.530472, 1, 0, 0.682353, 1,
1.238151, 0.5844295, 2.767726, 1, 0, 0.6784314, 1,
1.245037, -0.1901862, 2.010292, 1, 0, 0.6705883, 1,
1.248433, -1.414789, 0.9622588, 1, 0, 0.6666667, 1,
1.252125, -1.420155, 3.670869, 1, 0, 0.6588235, 1,
1.253278, -0.1472026, 1.002307, 1, 0, 0.654902, 1,
1.257159, 0.8708877, 3.556203, 1, 0, 0.6470588, 1,
1.266922, 0.3353454, 2.261733, 1, 0, 0.6431373, 1,
1.285776, -0.696355, -0.3235996, 1, 0, 0.6352941, 1,
1.290236, 1.833307, 3.206359, 1, 0, 0.6313726, 1,
1.292088, 1.274632, -0.1681541, 1, 0, 0.6235294, 1,
1.29504, 0.07489543, 3.661506, 1, 0, 0.6196079, 1,
1.295248, -3.142302, 1.4726, 1, 0, 0.6117647, 1,
1.29614, -0.05771402, 1.662648, 1, 0, 0.6078432, 1,
1.307696, 0.08386359, 3.33696, 1, 0, 0.6, 1,
1.310915, -0.3768644, 2.204701, 1, 0, 0.5921569, 1,
1.310985, -1.504727, 2.182903, 1, 0, 0.5882353, 1,
1.317259, 0.08195692, 3.211647, 1, 0, 0.5803922, 1,
1.318007, -1.334661, 0.8793404, 1, 0, 0.5764706, 1,
1.320958, -0.07289429, 0.2732703, 1, 0, 0.5686275, 1,
1.325859, 2.001123, 0.0295596, 1, 0, 0.5647059, 1,
1.331666, 0.09462263, 1.796512, 1, 0, 0.5568628, 1,
1.333745, -0.3883542, 2.122195, 1, 0, 0.5529412, 1,
1.34811, -0.5176358, 1.653327, 1, 0, 0.5450981, 1,
1.355582, 2.112104, -1.164043, 1, 0, 0.5411765, 1,
1.360241, -0.1571486, 1.93836, 1, 0, 0.5333334, 1,
1.37018, -0.5730271, 1.384659, 1, 0, 0.5294118, 1,
1.372688, -1.322845, 0.6519327, 1, 0, 0.5215687, 1,
1.38293, 1.570204, 2.401431, 1, 0, 0.5176471, 1,
1.383527, -0.7065948, 0.2630486, 1, 0, 0.509804, 1,
1.391092, -0.1629313, 0.3127396, 1, 0, 0.5058824, 1,
1.39747, 0.663408, 0.4553903, 1, 0, 0.4980392, 1,
1.398342, -0.7925999, 1.48068, 1, 0, 0.4901961, 1,
1.398487, -0.1396609, 3.95015, 1, 0, 0.4862745, 1,
1.402375, 0.4336715, 1.830163, 1, 0, 0.4784314, 1,
1.414824, 0.1201138, 0.5964481, 1, 0, 0.4745098, 1,
1.416318, 0.04031578, 0.3040971, 1, 0, 0.4666667, 1,
1.418127, 1.117897, 0.1885456, 1, 0, 0.4627451, 1,
1.425237, 0.09858139, 3.637556, 1, 0, 0.454902, 1,
1.425698, 2.908842, 1.06969, 1, 0, 0.4509804, 1,
1.429712, 0.4023665, 0.4952463, 1, 0, 0.4431373, 1,
1.434852, -0.61611, 1.309224, 1, 0, 0.4392157, 1,
1.451698, -0.6409227, 1.312782, 1, 0, 0.4313726, 1,
1.45488, -1.542221, 0.9719341, 1, 0, 0.427451, 1,
1.466914, -0.4314127, 1.548637, 1, 0, 0.4196078, 1,
1.470742, 0.4938259, 0.8080395, 1, 0, 0.4156863, 1,
1.474632, -1.620173, 0.508294, 1, 0, 0.4078431, 1,
1.479097, 0.177198, 2.162919, 1, 0, 0.4039216, 1,
1.480817, 2.126697, 0.2647544, 1, 0, 0.3960784, 1,
1.48426, 1.259232, 1.274746, 1, 0, 0.3882353, 1,
1.492673, -0.2466425, 0.6469421, 1, 0, 0.3843137, 1,
1.508034, -1.053648, 1.819706, 1, 0, 0.3764706, 1,
1.520015, 0.7710649, -0.1362113, 1, 0, 0.372549, 1,
1.524484, 1.130575, -0.5510572, 1, 0, 0.3647059, 1,
1.531478, -0.06984775, 1.030948, 1, 0, 0.3607843, 1,
1.532884, 0.7964768, 0.6269647, 1, 0, 0.3529412, 1,
1.533803, 0.2876289, 1.16327, 1, 0, 0.3490196, 1,
1.53892, 0.9570696, 0.4333144, 1, 0, 0.3411765, 1,
1.540465, 2.132718, 1.77883, 1, 0, 0.3372549, 1,
1.556711, -0.4176309, 2.113528, 1, 0, 0.3294118, 1,
1.601934, 0.6277458, 1.394823, 1, 0, 0.3254902, 1,
1.604837, 0.5637887, 2.031282, 1, 0, 0.3176471, 1,
1.609902, 1.69171, 1.918081, 1, 0, 0.3137255, 1,
1.61491, -1.644919, 2.561563, 1, 0, 0.3058824, 1,
1.61927, -1.973222, 2.117286, 1, 0, 0.2980392, 1,
1.63702, 0.984378, 0.9212475, 1, 0, 0.2941177, 1,
1.639944, 0.05769696, -0.1130709, 1, 0, 0.2862745, 1,
1.640919, -0.7216986, 4.683872, 1, 0, 0.282353, 1,
1.646536, 0.2419776, 3.231968, 1, 0, 0.2745098, 1,
1.678483, 0.414204, 0.06636651, 1, 0, 0.2705882, 1,
1.681796, 0.3575034, 1.170924, 1, 0, 0.2627451, 1,
1.68864, 2.420387, -0.3997015, 1, 0, 0.2588235, 1,
1.694556, 0.6160036, 0.4699467, 1, 0, 0.2509804, 1,
1.699272, -0.6726846, 2.73326, 1, 0, 0.2470588, 1,
1.705188, -1.282193, 2.134295, 1, 0, 0.2392157, 1,
1.708796, 0.1551578, 1.631305, 1, 0, 0.2352941, 1,
1.746668, 0.8934789, -0.7776129, 1, 0, 0.227451, 1,
1.758926, -0.6565433, 1.569372, 1, 0, 0.2235294, 1,
1.759022, -1.107099, 1.875303, 1, 0, 0.2156863, 1,
1.778691, -1.367976, 0.6849349, 1, 0, 0.2117647, 1,
1.818958, 1.574605, 1.378007, 1, 0, 0.2039216, 1,
1.834026, -0.08932072, 1.674063, 1, 0, 0.1960784, 1,
1.834267, 1.939228, 0.3395384, 1, 0, 0.1921569, 1,
1.838229, -0.1514768, 0.8731525, 1, 0, 0.1843137, 1,
1.848922, 1.325786, 0.9701373, 1, 0, 0.1803922, 1,
1.853457, 1.687215, 1.21565, 1, 0, 0.172549, 1,
1.85917, -0.4613372, 0.641496, 1, 0, 0.1686275, 1,
1.860363, -1.71279, 1.070502, 1, 0, 0.1607843, 1,
1.862433, 0.1498357, 2.933533, 1, 0, 0.1568628, 1,
1.866498, -0.782194, 2.365374, 1, 0, 0.1490196, 1,
1.875228, -1.31248, 2.7215, 1, 0, 0.145098, 1,
1.930096, -0.03222388, 1.9751, 1, 0, 0.1372549, 1,
1.945743, 1.138394, 1.605131, 1, 0, 0.1333333, 1,
1.946841, -0.4045495, 1.417628, 1, 0, 0.1254902, 1,
1.972367, -0.9510311, 2.758731, 1, 0, 0.1215686, 1,
1.975749, -1.008673, 4.1415, 1, 0, 0.1137255, 1,
2.00078, -0.2326792, 1.03626, 1, 0, 0.1098039, 1,
2.015807, 1.116128, 2.184702, 1, 0, 0.1019608, 1,
2.081987, -1.531255, 2.945543, 1, 0, 0.09411765, 1,
2.109501, 1.035267, 0.7700545, 1, 0, 0.09019608, 1,
2.184944, 0.1981129, 1.762061, 1, 0, 0.08235294, 1,
2.188195, 1.029999, 1.950335, 1, 0, 0.07843138, 1,
2.214512, 1.467087, 0.3396797, 1, 0, 0.07058824, 1,
2.21531, -0.2445389, 0.3183321, 1, 0, 0.06666667, 1,
2.409587, -0.162573, -0.1421938, 1, 0, 0.05882353, 1,
2.439825, 1.474415, 1.267543, 1, 0, 0.05490196, 1,
2.459889, -0.3982257, 1.128688, 1, 0, 0.04705882, 1,
2.585895, -0.1786516, -0.4239399, 1, 0, 0.04313726, 1,
2.647408, 0.2951578, 0.3197626, 1, 0, 0.03529412, 1,
2.668585, 0.27558, 2.097255, 1, 0, 0.03137255, 1,
2.804859, -2.604595, 2.425583, 1, 0, 0.02352941, 1,
2.837042, 0.6977586, 0.9975541, 1, 0, 0.01960784, 1,
3.129589, 2.61328, 0.2351193, 1, 0, 0.01176471, 1,
3.271841, 0.5972039, 0.3789609, 1, 0, 0.007843138, 1
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
0.1039214, -4.309748, -8.344772, 0, -0.5, 0.5, 0.5,
0.1039214, -4.309748, -8.344772, 1, -0.5, 0.5, 0.5,
0.1039214, -4.309748, -8.344772, 1, 1.5, 0.5, 0.5,
0.1039214, -4.309748, -8.344772, 0, 1.5, 0.5, 0.5
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
-4.137923, 0.3014908, -8.344772, 0, -0.5, 0.5, 0.5,
-4.137923, 0.3014908, -8.344772, 1, -0.5, 0.5, 0.5,
-4.137923, 0.3014908, -8.344772, 1, 1.5, 0.5, 0.5,
-4.137923, 0.3014908, -8.344772, 0, 1.5, 0.5, 0.5
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
-4.137923, -4.309748, -0.1644857, 0, -0.5, 0.5, 0.5,
-4.137923, -4.309748, -0.1644857, 1, -0.5, 0.5, 0.5,
-4.137923, -4.309748, -0.1644857, 1, 1.5, 0.5, 0.5,
-4.137923, -4.309748, -0.1644857, 0, 1.5, 0.5, 0.5
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
-3, -3.245616, -6.457014,
3, -3.245616, -6.457014,
-3, -3.245616, -6.457014,
-3, -3.422971, -6.77164,
-2, -3.245616, -6.457014,
-2, -3.422971, -6.77164,
-1, -3.245616, -6.457014,
-1, -3.422971, -6.77164,
0, -3.245616, -6.457014,
0, -3.422971, -6.77164,
1, -3.245616, -6.457014,
1, -3.422971, -6.77164,
2, -3.245616, -6.457014,
2, -3.422971, -6.77164,
3, -3.245616, -6.457014,
3, -3.422971, -6.77164
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
-3, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
-3, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
-3, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
-3, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
-2, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
-2, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
-2, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
-2, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
-1, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
-1, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
-1, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
-1, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
0, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
0, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
0, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
0, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
1, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
1, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
1, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
1, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
2, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
2, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
2, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
2, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5,
3, -3.777682, -7.400893, 0, -0.5, 0.5, 0.5,
3, -3.777682, -7.400893, 1, -0.5, 0.5, 0.5,
3, -3.777682, -7.400893, 1, 1.5, 0.5, 0.5,
3, -3.777682, -7.400893, 0, 1.5, 0.5, 0.5
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
-3.159036, -3, -6.457014,
-3.159036, 3, -6.457014,
-3.159036, -3, -6.457014,
-3.322184, -3, -6.77164,
-3.159036, -2, -6.457014,
-3.322184, -2, -6.77164,
-3.159036, -1, -6.457014,
-3.322184, -1, -6.77164,
-3.159036, 0, -6.457014,
-3.322184, 0, -6.77164,
-3.159036, 1, -6.457014,
-3.322184, 1, -6.77164,
-3.159036, 2, -6.457014,
-3.322184, 2, -6.77164,
-3.159036, 3, -6.457014,
-3.322184, 3, -6.77164
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
-3.64848, -3, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, -3, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, -3, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, -3, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, -2, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, -2, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, -2, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, -2, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, -1, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, -1, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, -1, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, -1, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, 0, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, 0, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, 0, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, 0, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, 1, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, 1, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, 1, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, 1, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, 2, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, 2, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, 2, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, 2, -7.400893, 0, 1.5, 0.5, 0.5,
-3.64848, 3, -7.400893, 0, -0.5, 0.5, 0.5,
-3.64848, 3, -7.400893, 1, -0.5, 0.5, 0.5,
-3.64848, 3, -7.400893, 1, 1.5, 0.5, 0.5,
-3.64848, 3, -7.400893, 0, 1.5, 0.5, 0.5
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
-3.159036, -3.245616, -6,
-3.159036, -3.245616, 4,
-3.159036, -3.245616, -6,
-3.322184, -3.422971, -6,
-3.159036, -3.245616, -4,
-3.322184, -3.422971, -4,
-3.159036, -3.245616, -2,
-3.322184, -3.422971, -2,
-3.159036, -3.245616, 0,
-3.322184, -3.422971, 0,
-3.159036, -3.245616, 2,
-3.322184, -3.422971, 2,
-3.159036, -3.245616, 4,
-3.322184, -3.422971, 4
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
-3.64848, -3.777682, -6, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -6, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -6, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, -6, 0, 1.5, 0.5, 0.5,
-3.64848, -3.777682, -4, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -4, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -4, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, -4, 0, 1.5, 0.5, 0.5,
-3.64848, -3.777682, -2, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -2, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, -2, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, -2, 0, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 0, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 0, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 0, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 0, 0, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 2, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 2, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 2, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 2, 0, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 4, 0, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 4, 1, -0.5, 0.5, 0.5,
-3.64848, -3.777682, 4, 1, 1.5, 0.5, 0.5,
-3.64848, -3.777682, 4, 0, 1.5, 0.5, 0.5
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
-3.159036, -3.245616, -6.457014,
-3.159036, 3.848597, -6.457014,
-3.159036, -3.245616, 6.128043,
-3.159036, 3.848597, 6.128043,
-3.159036, -3.245616, -6.457014,
-3.159036, -3.245616, 6.128043,
-3.159036, 3.848597, -6.457014,
-3.159036, 3.848597, 6.128043,
-3.159036, -3.245616, -6.457014,
3.366879, -3.245616, -6.457014,
-3.159036, -3.245616, 6.128043,
3.366879, -3.245616, 6.128043,
-3.159036, 3.848597, -6.457014,
3.366879, 3.848597, -6.457014,
-3.159036, 3.848597, 6.128043,
3.366879, 3.848597, 6.128043,
3.366879, -3.245616, -6.457014,
3.366879, 3.848597, -6.457014,
3.366879, -3.245616, 6.128043,
3.366879, 3.848597, 6.128043,
3.366879, -3.245616, -6.457014,
3.366879, -3.245616, 6.128043,
3.366879, 3.848597, -6.457014,
3.366879, 3.848597, 6.128043
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
var radius = 8.464882;
var distance = 37.66122;
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
mvMatrix.translate( -0.1039214, -0.3014908, 0.1644857 );
mvMatrix.scale( 1.402469, 1.290121, 0.7272432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.66122);
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
pyrithiobac<-read.table("pyrithiobac.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrithiobac$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
y<-pyrithiobac$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
z<-pyrithiobac$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
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
-3.063998, -1.057713, -2.329509, 0, 0, 1, 1, 1,
-2.88662, 0.7126481, -3.922189, 1, 0, 0, 1, 1,
-2.792636, -0.9906856, -2.008157, 1, 0, 0, 1, 1,
-2.758898, 0.6894222, -0.7800984, 1, 0, 0, 1, 1,
-2.682344, -0.09802923, -1.754073, 1, 0, 0, 1, 1,
-2.45402, -0.6531376, -3.574696, 1, 0, 0, 1, 1,
-2.445665, 0.02681099, -2.275852, 0, 0, 0, 1, 1,
-2.377795, -1.907422, -2.116, 0, 0, 0, 1, 1,
-2.32978, 0.02338344, 0.06225165, 0, 0, 0, 1, 1,
-2.325425, -0.4951211, -0.8563976, 0, 0, 0, 1, 1,
-2.293516, -0.7239572, -1.74133, 0, 0, 0, 1, 1,
-2.239686, -0.6413074, -0.3190859, 0, 0, 0, 1, 1,
-2.148988, -0.8303381, -2.056676, 0, 0, 0, 1, 1,
-2.144549, 0.4020007, -1.330338, 1, 1, 1, 1, 1,
-2.052646, -0.8541623, -1.856954, 1, 1, 1, 1, 1,
-2.034856, 0.1040142, 0.201953, 1, 1, 1, 1, 1,
-2.02624, 0.93005, -3.090158, 1, 1, 1, 1, 1,
-1.991908, 0.6754561, -0.4278951, 1, 1, 1, 1, 1,
-1.989452, -0.6822553, -2.351281, 1, 1, 1, 1, 1,
-1.932295, -1.73228, -0.8692011, 1, 1, 1, 1, 1,
-1.881931, -0.1511589, -0.01466303, 1, 1, 1, 1, 1,
-1.871285, -0.06159572, -1.342696, 1, 1, 1, 1, 1,
-1.853204, 0.05301292, -1.899206, 1, 1, 1, 1, 1,
-1.851776, -0.07968574, -1.283122, 1, 1, 1, 1, 1,
-1.845135, -1.814716, -3.148083, 1, 1, 1, 1, 1,
-1.827292, -0.9297535, -3.533993, 1, 1, 1, 1, 1,
-1.823865, -1.185411, -3.062035, 1, 1, 1, 1, 1,
-1.81934, 0.4605433, -1.17413, 1, 1, 1, 1, 1,
-1.807606, -1.193863, -1.155769, 0, 0, 1, 1, 1,
-1.804168, -1.307773, -1.36122, 1, 0, 0, 1, 1,
-1.794707, 1.400006, -2.0578, 1, 0, 0, 1, 1,
-1.794532, -0.3094136, -2.136672, 1, 0, 0, 1, 1,
-1.779581, 0.1727505, -0.7737247, 1, 0, 0, 1, 1,
-1.753758, -0.01983621, -3.043526, 1, 0, 0, 1, 1,
-1.751485, -0.361111, -3.195922, 0, 0, 0, 1, 1,
-1.727118, -0.9053233, -1.377079, 0, 0, 0, 1, 1,
-1.724415, -0.8488649, -4.178291, 0, 0, 0, 1, 1,
-1.722077, -1.244956, -3.470766, 0, 0, 0, 1, 1,
-1.706158, -0.643802, -0.04664821, 0, 0, 0, 1, 1,
-1.695018, 1.181841, 0.2302382, 0, 0, 0, 1, 1,
-1.690293, -1.023689, -0.2581606, 0, 0, 0, 1, 1,
-1.679632, -0.104867, -0.5229753, 1, 1, 1, 1, 1,
-1.675433, 0.7849658, -1.626581, 1, 1, 1, 1, 1,
-1.658862, 1.844999, -2.64059, 1, 1, 1, 1, 1,
-1.655705, 0.6831198, -0.7693467, 1, 1, 1, 1, 1,
-1.649434, 0.3082693, -1.366747, 1, 1, 1, 1, 1,
-1.649303, 0.0541671, -1.150568, 1, 1, 1, 1, 1,
-1.629322, -0.1970704, -0.5991855, 1, 1, 1, 1, 1,
-1.615965, -0.7394803, -1.607607, 1, 1, 1, 1, 1,
-1.609637, 0.5995159, -1.025445, 1, 1, 1, 1, 1,
-1.605281, 0.8424233, -1.382437, 1, 1, 1, 1, 1,
-1.601331, 0.8268822, -0.9945999, 1, 1, 1, 1, 1,
-1.594575, 1.841273, -0.792213, 1, 1, 1, 1, 1,
-1.586226, -1.200706, -1.646156, 1, 1, 1, 1, 1,
-1.561876, 0.005938971, -1.27389, 1, 1, 1, 1, 1,
-1.559156, -0.2501929, -2.271104, 1, 1, 1, 1, 1,
-1.536928, -0.5295636, -1.630823, 0, 0, 1, 1, 1,
-1.527911, -1.27082, -2.80433, 1, 0, 0, 1, 1,
-1.524975, -0.2412813, -3.33211, 1, 0, 0, 1, 1,
-1.52088, -0.0546489, -2.012475, 1, 0, 0, 1, 1,
-1.507063, -1.294981, -2.535548, 1, 0, 0, 1, 1,
-1.506412, 0.96246, -1.61628, 1, 0, 0, 1, 1,
-1.487371, 1.503324, 0.7216794, 0, 0, 0, 1, 1,
-1.483162, -1.285245, -2.112648, 0, 0, 0, 1, 1,
-1.481858, -0.7269359, -1.445234, 0, 0, 0, 1, 1,
-1.477821, 0.8463531, -0.5430757, 0, 0, 0, 1, 1,
-1.475607, -0.06129142, 0.05386307, 0, 0, 0, 1, 1,
-1.473725, -0.01548986, 0.5113267, 0, 0, 0, 1, 1,
-1.460453, -0.3142719, -1.480752, 0, 0, 0, 1, 1,
-1.458569, 1.182456, -1.092671, 1, 1, 1, 1, 1,
-1.458257, -2.449252, -4.331656, 1, 1, 1, 1, 1,
-1.446083, 0.6766508, -1.807468, 1, 1, 1, 1, 1,
-1.431712, -0.2919675, -0.3703413, 1, 1, 1, 1, 1,
-1.42253, -0.7564894, -2.000502, 1, 1, 1, 1, 1,
-1.413686, 1.394469, -2.254215, 1, 1, 1, 1, 1,
-1.401795, 0.3176503, -1.289188, 1, 1, 1, 1, 1,
-1.401681, -0.5193544, 0.003840749, 1, 1, 1, 1, 1,
-1.392703, 0.4329241, 0.3412928, 1, 1, 1, 1, 1,
-1.391357, 0.9386734, -0.3087238, 1, 1, 1, 1, 1,
-1.385632, -1.026944, -0.9893444, 1, 1, 1, 1, 1,
-1.384029, -0.07221445, -1.242436, 1, 1, 1, 1, 1,
-1.383083, 0.518887, -2.014402, 1, 1, 1, 1, 1,
-1.380032, -1.053943, -3.238879, 1, 1, 1, 1, 1,
-1.378989, -0.8304142, -0.5994875, 1, 1, 1, 1, 1,
-1.377025, 0.3338562, 0.1072003, 0, 0, 1, 1, 1,
-1.365739, -1.121154, -0.5569805, 1, 0, 0, 1, 1,
-1.358039, 0.3558324, -1.351637, 1, 0, 0, 1, 1,
-1.313175, -2.813874, -1.514071, 1, 0, 0, 1, 1,
-1.309058, 1.569071, -1.541521, 1, 0, 0, 1, 1,
-1.307875, -0.2178048, -1.701054, 1, 0, 0, 1, 1,
-1.305594, 0.4946926, -0.3011907, 0, 0, 0, 1, 1,
-1.29089, -1.696966, -2.456821, 0, 0, 0, 1, 1,
-1.288997, 1.253805, -2.194523, 0, 0, 0, 1, 1,
-1.288322, -0.8522872, -2.623832, 0, 0, 0, 1, 1,
-1.2861, 0.5193169, 0.6333595, 0, 0, 0, 1, 1,
-1.282885, 0.3610974, -0.08345667, 0, 0, 0, 1, 1,
-1.281314, -0.5155116, -1.55871, 0, 0, 0, 1, 1,
-1.279805, 0.9818563, -0.01344133, 1, 1, 1, 1, 1,
-1.279678, -0.8499706, -0.7504698, 1, 1, 1, 1, 1,
-1.279198, 0.02487476, -1.202086, 1, 1, 1, 1, 1,
-1.275422, -0.1305673, -3.328394, 1, 1, 1, 1, 1,
-1.272656, 0.9612706, -1.772724, 1, 1, 1, 1, 1,
-1.272593, -0.9265661, -1.084825, 1, 1, 1, 1, 1,
-1.265694, -0.3631293, -3.23632, 1, 1, 1, 1, 1,
-1.261897, -0.1174238, -1.420622, 1, 1, 1, 1, 1,
-1.261538, -0.7317142, -3.618217, 1, 1, 1, 1, 1,
-1.258247, -0.6969345, -1.338777, 1, 1, 1, 1, 1,
-1.226358, -1.939559, -3.942077, 1, 1, 1, 1, 1,
-1.220344, 0.2548013, -2.063879, 1, 1, 1, 1, 1,
-1.216168, 1.907062, -0.9587674, 1, 1, 1, 1, 1,
-1.210601, 1.532303, -0.1543595, 1, 1, 1, 1, 1,
-1.202479, -0.06837772, -0.704, 1, 1, 1, 1, 1,
-1.194327, 1.336985, -0.3125607, 0, 0, 1, 1, 1,
-1.193897, 0.6326129, -2.107775, 1, 0, 0, 1, 1,
-1.187289, -0.5900527, -2.518367, 1, 0, 0, 1, 1,
-1.183283, -0.606801, -3.562767, 1, 0, 0, 1, 1,
-1.182084, -0.1451173, -2.643485, 1, 0, 0, 1, 1,
-1.180848, 1.977261, -1.555081, 1, 0, 0, 1, 1,
-1.175911, 0.4464516, -1.355444, 0, 0, 0, 1, 1,
-1.171016, 0.4485843, -3.151724, 0, 0, 0, 1, 1,
-1.170102, 0.03825643, -1.453316, 0, 0, 0, 1, 1,
-1.169977, -0.4157994, -1.201431, 0, 0, 0, 1, 1,
-1.169495, -1.373261, -2.975432, 0, 0, 0, 1, 1,
-1.163991, -1.188779, -2.097046, 0, 0, 0, 1, 1,
-1.160824, -0.4264304, -2.30703, 0, 0, 0, 1, 1,
-1.156467, 0.9915332, -2.616021, 1, 1, 1, 1, 1,
-1.152056, 1.533934, -2.52827, 1, 1, 1, 1, 1,
-1.139935, 0.01381648, -3.217503, 1, 1, 1, 1, 1,
-1.135452, -0.1483299, -2.328027, 1, 1, 1, 1, 1,
-1.133026, 1.191013, -0.6113433, 1, 1, 1, 1, 1,
-1.126815, -1.264479, -2.941499, 1, 1, 1, 1, 1,
-1.121604, 0.9221997, -2.009382, 1, 1, 1, 1, 1,
-1.116825, 1.880023, -0.1393976, 1, 1, 1, 1, 1,
-1.114936, 1.026185, -2.474661, 1, 1, 1, 1, 1,
-1.103677, 0.1161317, -2.365716, 1, 1, 1, 1, 1,
-1.098548, -0.1671456, -2.954757, 1, 1, 1, 1, 1,
-1.09824, 0.4209924, -2.389609, 1, 1, 1, 1, 1,
-1.096388, -0.707909, -2.885672, 1, 1, 1, 1, 1,
-1.087213, -0.4546171, -0.3872022, 1, 1, 1, 1, 1,
-1.084484, -0.3737533, -1.360927, 1, 1, 1, 1, 1,
-1.072562, 0.337022, -0.5166053, 0, 0, 1, 1, 1,
-1.070824, 1.322129, -0.6855507, 1, 0, 0, 1, 1,
-1.070402, -0.957266, 1.013227, 1, 0, 0, 1, 1,
-1.069158, 0.6745844, -0.4085635, 1, 0, 0, 1, 1,
-1.06892, -0.4511743, -1.250027, 1, 0, 0, 1, 1,
-1.057325, 0.1834668, -0.4228225, 1, 0, 0, 1, 1,
-1.053497, 1.645091, -0.5020126, 0, 0, 0, 1, 1,
-1.05325, -0.8642809, 0.7699324, 0, 0, 0, 1, 1,
-1.041612, -0.7610814, -1.898556, 0, 0, 0, 1, 1,
-1.038528, 0.2472542, 0.3325764, 0, 0, 0, 1, 1,
-1.036971, -0.135603, -2.374187, 0, 0, 0, 1, 1,
-1.03552, 0.7542974, -2.779026, 0, 0, 0, 1, 1,
-1.028998, -0.521508, -1.332308, 0, 0, 0, 1, 1,
-1.02876, 1.172925, 0.5718295, 1, 1, 1, 1, 1,
-1.026973, 0.4924071, -1.191871, 1, 1, 1, 1, 1,
-1.026172, -1.194869, -1.339075, 1, 1, 1, 1, 1,
-1.025589, -0.10332, -1.46945, 1, 1, 1, 1, 1,
-1.018947, 1.956373, 1.70863, 1, 1, 1, 1, 1,
-1.017177, 0.2545347, -1.202183, 1, 1, 1, 1, 1,
-1.016498, 1.182822, -1.619237, 1, 1, 1, 1, 1,
-1.016373, 0.3185742, -1.960314, 1, 1, 1, 1, 1,
-1.015596, -2.246949, -2.611967, 1, 1, 1, 1, 1,
-1.004764, 1.024751, 0.2854877, 1, 1, 1, 1, 1,
-0.9985406, 1.873396, 0.4951394, 1, 1, 1, 1, 1,
-0.9894758, -0.630065, -0.7772603, 1, 1, 1, 1, 1,
-0.973031, 1.203023, -0.9248863, 1, 1, 1, 1, 1,
-0.972494, -0.8257366, -2.549376, 1, 1, 1, 1, 1,
-0.9707094, -0.1630547, -1.818208, 1, 1, 1, 1, 1,
-0.9692926, -0.1948365, -2.020883, 0, 0, 1, 1, 1,
-0.9663388, 0.6410941, -0.3971313, 1, 0, 0, 1, 1,
-0.9647323, 0.336529, -1.858857, 1, 0, 0, 1, 1,
-0.9516221, -0.4720011, -1.606774, 1, 0, 0, 1, 1,
-0.9513877, 1.332818, -1.421032, 1, 0, 0, 1, 1,
-0.9513391, 1.29441, -1.70706, 1, 0, 0, 1, 1,
-0.9435819, 0.3537659, -1.089597, 0, 0, 0, 1, 1,
-0.9431851, 0.8021873, -1.301089, 0, 0, 0, 1, 1,
-0.9398862, -0.7512292, -2.887455, 0, 0, 0, 1, 1,
-0.9304342, -2.908062, -2.466242, 0, 0, 0, 1, 1,
-0.9285308, -0.3451441, -2.8224, 0, 0, 0, 1, 1,
-0.9273965, 0.6175824, -1.551599, 0, 0, 0, 1, 1,
-0.927242, 0.01567339, -0.7304813, 0, 0, 0, 1, 1,
-0.922015, -0.4482541, 0.1452126, 1, 1, 1, 1, 1,
-0.9139884, -0.7689207, -3.906982, 1, 1, 1, 1, 1,
-0.9090711, 0.1580027, -2.105505, 1, 1, 1, 1, 1,
-0.8951896, 0.1870307, -0.1573888, 1, 1, 1, 1, 1,
-0.8951054, 0.06687047, -2.189286, 1, 1, 1, 1, 1,
-0.8941306, 1.296124, -1.067601, 1, 1, 1, 1, 1,
-0.8924636, -2.281341, -2.698966, 1, 1, 1, 1, 1,
-0.8813042, 0.2097922, 0.7330575, 1, 1, 1, 1, 1,
-0.8760617, 0.4822699, -0.6873981, 1, 1, 1, 1, 1,
-0.8698969, 0.1929763, -0.2445845, 1, 1, 1, 1, 1,
-0.858516, -1.450213, -3.008811, 1, 1, 1, 1, 1,
-0.8583897, 0.5185925, -2.770919, 1, 1, 1, 1, 1,
-0.8566042, 0.5908308, -0.8478141, 1, 1, 1, 1, 1,
-0.8552021, 0.6291735, -0.9445887, 1, 1, 1, 1, 1,
-0.8534302, -1.815146, -2.955367, 1, 1, 1, 1, 1,
-0.8494789, 0.04838974, -1.361119, 0, 0, 1, 1, 1,
-0.8448636, -0.3946154, -2.617723, 1, 0, 0, 1, 1,
-0.8436085, -0.02308911, -1.254292, 1, 0, 0, 1, 1,
-0.8380665, -0.4090088, -2.651565, 1, 0, 0, 1, 1,
-0.8310373, 1.584846, -0.2033438, 1, 0, 0, 1, 1,
-0.8243398, -0.6142927, -1.892876, 1, 0, 0, 1, 1,
-0.8215699, 1.018701, -0.481575, 0, 0, 0, 1, 1,
-0.8174078, 0.7136664, -0.5554293, 0, 0, 0, 1, 1,
-0.8064814, -0.9725546, -3.521485, 0, 0, 0, 1, 1,
-0.8030769, 1.277639, 0.2186579, 0, 0, 0, 1, 1,
-0.8023321, -0.6205958, -1.694429, 0, 0, 0, 1, 1,
-0.7992316, 1.113501, 0.7138752, 0, 0, 0, 1, 1,
-0.7984412, 1.602529, 0.8939453, 0, 0, 0, 1, 1,
-0.7970686, -0.4613914, -2.146123, 1, 1, 1, 1, 1,
-0.7907006, 0.7013994, -2.317304, 1, 1, 1, 1, 1,
-0.7870581, -0.1187738, -3.247128, 1, 1, 1, 1, 1,
-0.7861979, 0.4051147, -0.9448112, 1, 1, 1, 1, 1,
-0.7779292, -0.09635201, -0.2187576, 1, 1, 1, 1, 1,
-0.774948, -0.7401429, -3.680628, 1, 1, 1, 1, 1,
-0.7741989, -1.74526, -3.16613, 1, 1, 1, 1, 1,
-0.7700844, 1.530954, -0.8483211, 1, 1, 1, 1, 1,
-0.7664199, 0.3390868, -1.868215, 1, 1, 1, 1, 1,
-0.7658211, -0.9591427, -1.860079, 1, 1, 1, 1, 1,
-0.7577397, 2.596548, -0.4350596, 1, 1, 1, 1, 1,
-0.754141, -1.491311, -1.453233, 1, 1, 1, 1, 1,
-0.7494151, 0.2717177, -1.324519, 1, 1, 1, 1, 1,
-0.7492526, 0.4135652, -2.397355, 1, 1, 1, 1, 1,
-0.7483631, 0.1094078, -1.542121, 1, 1, 1, 1, 1,
-0.7454824, -0.572839, -3.060088, 0, 0, 1, 1, 1,
-0.7392823, -2.162069, -3.464901, 1, 0, 0, 1, 1,
-0.7365485, 0.5652146, -0.8248053, 1, 0, 0, 1, 1,
-0.7330239, -0.9590127, -3.319112, 1, 0, 0, 1, 1,
-0.7294974, -0.1218561, -2.279736, 1, 0, 0, 1, 1,
-0.7254318, 0.1193548, -0.5906537, 1, 0, 0, 1, 1,
-0.723966, -1.323351, -3.624963, 0, 0, 0, 1, 1,
-0.7142981, -0.4830051, -2.613324, 0, 0, 0, 1, 1,
-0.7141917, 1.750774, -1.597044, 0, 0, 0, 1, 1,
-0.7110004, -0.0046267, -0.6940041, 0, 0, 0, 1, 1,
-0.7084416, 0.4779373, -0.9993094, 0, 0, 0, 1, 1,
-0.6996585, -0.1574956, -0.7325976, 0, 0, 0, 1, 1,
-0.6983618, 0.6913241, -0.701492, 0, 0, 0, 1, 1,
-0.6936108, 0.5655746, -1.242089, 1, 1, 1, 1, 1,
-0.6920635, -0.7900806, -3.580352, 1, 1, 1, 1, 1,
-0.6880019, 1.588715, -1.015968, 1, 1, 1, 1, 1,
-0.6852131, -0.008919656, -1.650241, 1, 1, 1, 1, 1,
-0.6833754, 0.4162381, -1.413694, 1, 1, 1, 1, 1,
-0.6799837, -0.5031417, -2.492384, 1, 1, 1, 1, 1,
-0.6795425, 0.7195683, -0.3394761, 1, 1, 1, 1, 1,
-0.678285, -0.7130121, -2.601468, 1, 1, 1, 1, 1,
-0.6768073, -0.4830213, -2.61038, 1, 1, 1, 1, 1,
-0.6755857, 1.510836, -0.2110391, 1, 1, 1, 1, 1,
-0.6748307, -0.4317882, -1.907379, 1, 1, 1, 1, 1,
-0.6727962, 0.5676215, 0.3767223, 1, 1, 1, 1, 1,
-0.6718137, 0.3368289, -1.514519, 1, 1, 1, 1, 1,
-0.6680922, -1.289843, -5.351534, 1, 1, 1, 1, 1,
-0.6580777, 0.3718164, -3.607838, 1, 1, 1, 1, 1,
-0.6579555, -1.225135, -4.30178, 0, 0, 1, 1, 1,
-0.6573747, 0.9437371, -0.1195271, 1, 0, 0, 1, 1,
-0.6527494, -0.6064252, -1.65662, 1, 0, 0, 1, 1,
-0.6522259, -0.6379539, -2.042497, 1, 0, 0, 1, 1,
-0.6492149, -0.4704962, -2.154446, 1, 0, 0, 1, 1,
-0.6410003, -1.090431, -3.088933, 1, 0, 0, 1, 1,
-0.6407773, 0.4500937, -2.630637, 0, 0, 0, 1, 1,
-0.6385022, -1.573502, -6.273736, 0, 0, 0, 1, 1,
-0.6384174, 1.374385, -0.5508706, 0, 0, 0, 1, 1,
-0.637709, 1.888992, -2.349381, 0, 0, 0, 1, 1,
-0.6365955, 1.951546, -0.3047233, 0, 0, 0, 1, 1,
-0.6360158, 1.611017, 0.7258685, 0, 0, 0, 1, 1,
-0.6348258, 0.8008642, -1.336731, 0, 0, 0, 1, 1,
-0.6336816, -0.1931429, -3.194772, 1, 1, 1, 1, 1,
-0.6319508, -1.407849, -4.59935, 1, 1, 1, 1, 1,
-0.6256118, 0.05136655, -1.175335, 1, 1, 1, 1, 1,
-0.6232694, -0.8481034, -2.013785, 1, 1, 1, 1, 1,
-0.6073158, 1.055877, -0.1384266, 1, 1, 1, 1, 1,
-0.6041256, 0.4792998, -3.139443, 1, 1, 1, 1, 1,
-0.5997079, 1.403569, 0.8849477, 1, 1, 1, 1, 1,
-0.5969076, 1.648602, -0.47652, 1, 1, 1, 1, 1,
-0.5926542, -0.8214824, -3.216824, 1, 1, 1, 1, 1,
-0.5920665, 1.529532, 0.3401997, 1, 1, 1, 1, 1,
-0.588454, -2.659518, -2.288647, 1, 1, 1, 1, 1,
-0.5878878, -1.79931, -2.094903, 1, 1, 1, 1, 1,
-0.5843994, 0.8916979, 0.1573816, 1, 1, 1, 1, 1,
-0.5841902, -0.1611721, -1.785955, 1, 1, 1, 1, 1,
-0.5799757, -1.14407, -4.078489, 1, 1, 1, 1, 1,
-0.5789478, 0.9858852, -1.071417, 0, 0, 1, 1, 1,
-0.5646409, 0.8952473, -1.381116, 1, 0, 0, 1, 1,
-0.5644738, 1.250186, -0.7767382, 1, 0, 0, 1, 1,
-0.5627494, -1.515237, -3.364495, 1, 0, 0, 1, 1,
-0.5625809, 0.2792591, -2.197572, 1, 0, 0, 1, 1,
-0.5575321, -0.1245171, -3.284595, 1, 0, 0, 1, 1,
-0.5546162, 1.635704, -1.403877, 0, 0, 0, 1, 1,
-0.5523172, -0.8808625, -1.834761, 0, 0, 0, 1, 1,
-0.546342, 0.6176803, -3.131557, 0, 0, 0, 1, 1,
-0.5452578, -1.273614, -3.780658, 0, 0, 0, 1, 1,
-0.5423961, -0.5099993, -2.456331, 0, 0, 0, 1, 1,
-0.541781, -0.06363273, -1.065038, 0, 0, 0, 1, 1,
-0.5411674, 0.7050447, -2.197671, 0, 0, 0, 1, 1,
-0.5395379, 1.328131, -1.138502, 1, 1, 1, 1, 1,
-0.5386371, -0.3551899, -1.042183, 1, 1, 1, 1, 1,
-0.5341899, 0.8557248, -0.8828943, 1, 1, 1, 1, 1,
-0.5258569, 1.348041, -0.4415822, 1, 1, 1, 1, 1,
-0.5258118, 0.320224, -0.9392623, 1, 1, 1, 1, 1,
-0.5245568, 0.3807457, -1.235392, 1, 1, 1, 1, 1,
-0.5196865, 0.1771161, -1.804165, 1, 1, 1, 1, 1,
-0.5143493, -0.3931822, -1.601989, 1, 1, 1, 1, 1,
-0.5114613, -1.752371, -3.104095, 1, 1, 1, 1, 1,
-0.5071368, 0.6241676, -2.56889, 1, 1, 1, 1, 1,
-0.5015892, -0.9519743, -2.856631, 1, 1, 1, 1, 1,
-0.4989266, -1.67967, -3.051986, 1, 1, 1, 1, 1,
-0.4877205, -0.6290779, -3.204947, 1, 1, 1, 1, 1,
-0.48755, -0.3774875, -3.299427, 1, 1, 1, 1, 1,
-0.482754, 1.181767, -1.746517, 1, 1, 1, 1, 1,
-0.4818829, -0.4890991, -2.916392, 0, 0, 1, 1, 1,
-0.4808618, 0.6827964, 0.3366864, 1, 0, 0, 1, 1,
-0.4769824, 1.055567, -0.8134522, 1, 0, 0, 1, 1,
-0.4761784, 0.8852981, 0.6677645, 1, 0, 0, 1, 1,
-0.4732918, 0.3091084, 0.4555266, 1, 0, 0, 1, 1,
-0.4708994, 0.7297894, -1.205743, 1, 0, 0, 1, 1,
-0.4613163, -0.9255378, -2.599822, 0, 0, 0, 1, 1,
-0.4545193, 0.4324303, 0.1998902, 0, 0, 0, 1, 1,
-0.4487388, -0.7148011, -2.816222, 0, 0, 0, 1, 1,
-0.4439981, 0.4655187, -0.05575614, 0, 0, 0, 1, 1,
-0.4418493, -0.3574066, -3.482936, 0, 0, 0, 1, 1,
-0.4399587, 0.5667769, 0.510388, 0, 0, 0, 1, 1,
-0.4397522, -0.4235733, -2.921558, 0, 0, 0, 1, 1,
-0.4379226, -0.7918587, -2.974349, 1, 1, 1, 1, 1,
-0.4369919, -0.07354835, -3.562032, 1, 1, 1, 1, 1,
-0.4365696, 0.02223129, -2.501506, 1, 1, 1, 1, 1,
-0.4322349, -0.3207242, -0.3518648, 1, 1, 1, 1, 1,
-0.4282782, -0.9857224, -2.215099, 1, 1, 1, 1, 1,
-0.420219, 0.1430812, -0.3764383, 1, 1, 1, 1, 1,
-0.4163583, 0.6173944, -0.4418488, 1, 1, 1, 1, 1,
-0.4104004, 1.339753, 0.4495167, 1, 1, 1, 1, 1,
-0.4049791, -0.3542764, -2.504299, 1, 1, 1, 1, 1,
-0.4027559, 1.426623, 0.4145666, 1, 1, 1, 1, 1,
-0.3999341, -2.052466, -4.350261, 1, 1, 1, 1, 1,
-0.3988442, 0.1338021, -0.7789614, 1, 1, 1, 1, 1,
-0.3951704, -1.77676, -1.890648, 1, 1, 1, 1, 1,
-0.3951098, 0.640808, -1.819403, 1, 1, 1, 1, 1,
-0.3943742, -0.7665429, -0.5467317, 1, 1, 1, 1, 1,
-0.3914233, 1.261003, -0.4512289, 0, 0, 1, 1, 1,
-0.3893096, 0.2034933, -2.245983, 1, 0, 0, 1, 1,
-0.3880979, -0.5903296, -2.402625, 1, 0, 0, 1, 1,
-0.3837105, -1.685406, -3.165574, 1, 0, 0, 1, 1,
-0.383315, 0.2568972, -0.9719242, 1, 0, 0, 1, 1,
-0.3813429, 1.033173, 0.3762659, 1, 0, 0, 1, 1,
-0.377758, 1.322746, -0.9280623, 0, 0, 0, 1, 1,
-0.3775825, -0.4179376, -1.49562, 0, 0, 0, 1, 1,
-0.3695343, 0.1534161, -0.09297479, 0, 0, 0, 1, 1,
-0.36862, 0.007129101, -1.159597, 0, 0, 0, 1, 1,
-0.3675278, 1.626101, -0.9019891, 0, 0, 0, 1, 1,
-0.3656311, -0.8282439, -2.152875, 0, 0, 0, 1, 1,
-0.3634445, 2.19672, 0.9313518, 0, 0, 0, 1, 1,
-0.3611249, -1.035632, -1.600027, 1, 1, 1, 1, 1,
-0.3604279, 0.2379113, -2.399021, 1, 1, 1, 1, 1,
-0.353449, -1.453348, -3.814275, 1, 1, 1, 1, 1,
-0.3512287, -0.7134084, -2.468686, 1, 1, 1, 1, 1,
-0.348701, 0.2205155, -0.5221907, 1, 1, 1, 1, 1,
-0.3468767, -1.31111, -4.859632, 1, 1, 1, 1, 1,
-0.3468304, 0.9705926, 0.4637669, 1, 1, 1, 1, 1,
-0.3432635, 0.6434875, -0.2119604, 1, 1, 1, 1, 1,
-0.342729, -1.678609, -3.479546, 1, 1, 1, 1, 1,
-0.3374722, 0.607493, -1.181092, 1, 1, 1, 1, 1,
-0.3335765, 1.061803, 0.5492337, 1, 1, 1, 1, 1,
-0.333323, 1.26597, -0.04995473, 1, 1, 1, 1, 1,
-0.3314255, 0.1775898, -0.5772972, 1, 1, 1, 1, 1,
-0.3292933, -0.01453004, 1.079846, 1, 1, 1, 1, 1,
-0.3280462, -0.6584635, -3.126802, 1, 1, 1, 1, 1,
-0.3254396, 0.4477162, 0.7894488, 0, 0, 1, 1, 1,
-0.3236793, -1.052911, -3.866755, 1, 0, 0, 1, 1,
-0.303549, 1.218247, 0.5374237, 1, 0, 0, 1, 1,
-0.3031964, -2.047506, -1.615443, 1, 0, 0, 1, 1,
-0.3010635, 0.4862737, 0.9314837, 1, 0, 0, 1, 1,
-0.2996108, 0.9443719, -0.762053, 1, 0, 0, 1, 1,
-0.2993712, 0.521416, -1.425982, 0, 0, 0, 1, 1,
-0.2934909, -2.201505, -4.328323, 0, 0, 0, 1, 1,
-0.290481, -0.07366161, -2.236785, 0, 0, 0, 1, 1,
-0.2877989, -1.96631, -4.185588, 0, 0, 0, 1, 1,
-0.2863097, -0.8287537, -1.687412, 0, 0, 0, 1, 1,
-0.2847161, 0.7213018, -1.491983, 0, 0, 0, 1, 1,
-0.2830455, 0.806564, -1.820988, 0, 0, 0, 1, 1,
-0.2800152, 0.2340855, 0.1616444, 1, 1, 1, 1, 1,
-0.2793988, 1.060074, 0.8853223, 1, 1, 1, 1, 1,
-0.2785172, -0.4291924, -2.431243, 1, 1, 1, 1, 1,
-0.2773986, 1.358602, 0.5294189, 1, 1, 1, 1, 1,
-0.2737513, -0.2373039, -2.510426, 1, 1, 1, 1, 1,
-0.2704252, 0.5888793, -0.02377583, 1, 1, 1, 1, 1,
-0.2662666, 0.9868244, -0.3874494, 1, 1, 1, 1, 1,
-0.2658004, 0.9912763, -0.9776834, 1, 1, 1, 1, 1,
-0.2628874, -1.109432, -3.03539, 1, 1, 1, 1, 1,
-0.2601129, 0.07338237, -1.18723, 1, 1, 1, 1, 1,
-0.2596523, 1.436789, -0.8517402, 1, 1, 1, 1, 1,
-0.2582574, 1.121134, -1.426747, 1, 1, 1, 1, 1,
-0.2573842, 1.95666, -0.6399385, 1, 1, 1, 1, 1,
-0.2569732, -1.153483, -3.506209, 1, 1, 1, 1, 1,
-0.2535197, -1.324417, -3.729193, 1, 1, 1, 1, 1,
-0.250365, -0.5954321, -3.49589, 0, 0, 1, 1, 1,
-0.2501222, -0.9328347, -3.598801, 1, 0, 0, 1, 1,
-0.2492541, -1.053216, -1.338744, 1, 0, 0, 1, 1,
-0.2440005, 1.12572, 0.767908, 1, 0, 0, 1, 1,
-0.2416818, 0.2000331, -1.438411, 1, 0, 0, 1, 1,
-0.2363519, 0.728012, -3.127777, 1, 0, 0, 1, 1,
-0.2313266, 2.040904, -1.281896, 0, 0, 0, 1, 1,
-0.2290836, -2.145002, -1.611254, 0, 0, 0, 1, 1,
-0.2244806, -1.658869, -3.13348, 0, 0, 0, 1, 1,
-0.2160754, 0.7842363, -0.1398367, 0, 0, 0, 1, 1,
-0.2159285, -0.2465472, -5.106505, 0, 0, 0, 1, 1,
-0.2087451, 1.030484, 0.0454376, 0, 0, 0, 1, 1,
-0.2075407, 0.09578133, -2.491567, 0, 0, 0, 1, 1,
-0.1970087, -1.304688, -3.714578, 1, 1, 1, 1, 1,
-0.1902893, 3.745284, -1.069421, 1, 1, 1, 1, 1,
-0.1879877, -0.08183464, -2.38007, 1, 1, 1, 1, 1,
-0.1869763, -0.1235227, -1.72222, 1, 1, 1, 1, 1,
-0.1848177, 0.2293714, -2.300593, 1, 1, 1, 1, 1,
-0.1846344, 0.83412, -0.2680592, 1, 1, 1, 1, 1,
-0.1787908, 0.2507611, -0.3390184, 1, 1, 1, 1, 1,
-0.1764831, -1.782867, -3.081543, 1, 1, 1, 1, 1,
-0.175106, 0.2463063, -1.186721, 1, 1, 1, 1, 1,
-0.1750327, 1.33734, 0.8318018, 1, 1, 1, 1, 1,
-0.1743416, -0.3676544, -3.412044, 1, 1, 1, 1, 1,
-0.1726047, -1.028804, -2.699908, 1, 1, 1, 1, 1,
-0.1675362, 1.296072, 0.820673, 1, 1, 1, 1, 1,
-0.1672297, -0.9809605, -1.586016, 1, 1, 1, 1, 1,
-0.1642514, -2.337885, -1.91208, 1, 1, 1, 1, 1,
-0.1607042, -2.035475, -4.35649, 0, 0, 1, 1, 1,
-0.148632, 0.7204906, -2.018375, 1, 0, 0, 1, 1,
-0.1454197, 0.3974302, 1.581476, 1, 0, 0, 1, 1,
-0.1436455, 1.809398, 0.8343174, 1, 0, 0, 1, 1,
-0.1402428, 0.5334576, -0.747237, 1, 0, 0, 1, 1,
-0.1380972, -1.268579, -4.222215, 1, 0, 0, 1, 1,
-0.1380402, 0.157215, -0.3931694, 0, 0, 0, 1, 1,
-0.1357755, -1.843637, -0.2697845, 0, 0, 0, 1, 1,
-0.1323528, -0.5665916, -2.151304, 0, 0, 0, 1, 1,
-0.1301275, 0.9490545, -0.9892816, 0, 0, 0, 1, 1,
-0.1288532, 0.1691134, -1.846705, 0, 0, 0, 1, 1,
-0.128371, 0.3475456, -0.750284, 0, 0, 0, 1, 1,
-0.1280943, 0.1363953, -1.606182, 0, 0, 0, 1, 1,
-0.1280677, 0.213659, -0.5112399, 1, 1, 1, 1, 1,
-0.1263331, 0.8067552, 0.5412159, 1, 1, 1, 1, 1,
-0.1249973, -0.1938189, -0.6512413, 1, 1, 1, 1, 1,
-0.1249246, -0.4672889, -2.752481, 1, 1, 1, 1, 1,
-0.1241545, -0.3829224, -4.373394, 1, 1, 1, 1, 1,
-0.1241211, -0.469203, -2.234788, 1, 1, 1, 1, 1,
-0.1219479, 0.7549638, 0.9402317, 1, 1, 1, 1, 1,
-0.1173884, 0.8585672, 0.1238067, 1, 1, 1, 1, 1,
-0.1165226, 0.779135, 0.351593, 1, 1, 1, 1, 1,
-0.1146202, 1.551533, -1.256287, 1, 1, 1, 1, 1,
-0.1138234, -0.8741695, -3.702138, 1, 1, 1, 1, 1,
-0.110164, 0.296369, -0.4254535, 1, 1, 1, 1, 1,
-0.1091327, -1.383243, -3.779012, 1, 1, 1, 1, 1,
-0.104949, 0.5841222, 1.177612, 1, 1, 1, 1, 1,
-0.1010337, 0.2926946, 0.3846962, 1, 1, 1, 1, 1,
-0.09913195, 0.5671532, 0.1671458, 0, 0, 1, 1, 1,
-0.08471879, -0.141035, -3.402843, 1, 0, 0, 1, 1,
-0.07105087, 0.7634805, -0.616058, 1, 0, 0, 1, 1,
-0.07075392, -0.6896065, -2.078174, 1, 0, 0, 1, 1,
-0.07060453, 1.584062, -0.6267783, 1, 0, 0, 1, 1,
-0.06569395, 0.00831316, -2.035924, 1, 0, 0, 1, 1,
-0.06524452, -1.961134, -3.430575, 0, 0, 0, 1, 1,
-0.06463493, -0.3427585, -1.864575, 0, 0, 0, 1, 1,
-0.0641124, 0.6776487, 0.2069429, 0, 0, 0, 1, 1,
-0.05901966, 1.143338, -0.235771, 0, 0, 0, 1, 1,
-0.05628659, 1.011116, -0.5050951, 0, 0, 0, 1, 1,
-0.05414619, -0.9169695, -3.694886, 0, 0, 0, 1, 1,
-0.04889543, 0.9464729, -1.484619, 0, 0, 0, 1, 1,
-0.04596685, -0.0948496, -4.537588, 1, 1, 1, 1, 1,
-0.04554357, 0.3259201, -0.03724363, 1, 1, 1, 1, 1,
-0.04188567, -0.3678477, -3.185225, 1, 1, 1, 1, 1,
-0.04070117, -0.06975685, -2.517191, 1, 1, 1, 1, 1,
-0.04056437, -1.639006, -3.415838, 1, 1, 1, 1, 1,
-0.03860182, 0.09089945, -0.4645712, 1, 1, 1, 1, 1,
-0.0385115, 2.384258, -0.4872225, 1, 1, 1, 1, 1,
-0.03494943, -0.8873613, -1.873648, 1, 1, 1, 1, 1,
-0.03423551, 1.268108, 1.974051, 1, 1, 1, 1, 1,
-0.03357963, -0.6362327, -4.483931, 1, 1, 1, 1, 1,
-0.03135683, 1.187767, -0.8897834, 1, 1, 1, 1, 1,
-0.03096419, 1.230282, -0.9294294, 1, 1, 1, 1, 1,
-0.0262458, -1.976735, -4.065244, 1, 1, 1, 1, 1,
-0.0252378, -0.1963138, -3.755872, 1, 1, 1, 1, 1,
-0.02478705, 0.9810424, 0.7677367, 1, 1, 1, 1, 1,
-0.0210053, 0.3759604, 0.1120901, 0, 0, 1, 1, 1,
-0.0205788, -0.05149073, -2.350008, 1, 0, 0, 1, 1,
-0.0158575, -0.6582325, -2.801444, 1, 0, 0, 1, 1,
-0.00801773, -0.9066513, -3.351593, 1, 0, 0, 1, 1,
0.009110663, -0.7305974, 2.107845, 1, 0, 0, 1, 1,
0.00953907, -0.3598805, 3.436909, 1, 0, 0, 1, 1,
0.0130546, 0.6844866, -0.9141158, 0, 0, 0, 1, 1,
0.01353811, -0.574133, 2.832885, 0, 0, 0, 1, 1,
0.01768665, -0.9410471, 2.177598, 0, 0, 0, 1, 1,
0.01817246, -0.1249817, 1.784082, 0, 0, 0, 1, 1,
0.02354736, -0.9320336, 2.081153, 0, 0, 0, 1, 1,
0.02391706, -0.4467089, 2.293281, 0, 0, 0, 1, 1,
0.02531223, 0.6494514, -0.08632723, 0, 0, 0, 1, 1,
0.02760931, -0.5075646, 4.094585, 1, 1, 1, 1, 1,
0.03027017, 0.3270843, -0.7287355, 1, 1, 1, 1, 1,
0.03660993, -1.040886, 2.013858, 1, 1, 1, 1, 1,
0.03830919, -0.6461002, 3.060954, 1, 1, 1, 1, 1,
0.04443211, 0.8459794, -1.821147, 1, 1, 1, 1, 1,
0.04513353, 1.374296, 1.560441, 1, 1, 1, 1, 1,
0.04629468, 0.5840428, 0.1784507, 1, 1, 1, 1, 1,
0.04916645, -0.9016452, 1.983646, 1, 1, 1, 1, 1,
0.05011537, 0.2118384, 0.08407048, 1, 1, 1, 1, 1,
0.05151257, -1.999837, 1.153316, 1, 1, 1, 1, 1,
0.05167961, -0.2117452, 2.682086, 1, 1, 1, 1, 1,
0.05440949, -1.08204, 3.128041, 1, 1, 1, 1, 1,
0.05602256, 1.079981, 0.6871842, 1, 1, 1, 1, 1,
0.05846811, 1.063659, 1.668514, 1, 1, 1, 1, 1,
0.06066601, 1.313316, -0.1213455, 1, 1, 1, 1, 1,
0.06402374, 0.2885653, -0.1187605, 0, 0, 1, 1, 1,
0.06984136, 0.4177907, 0.5000055, 1, 0, 0, 1, 1,
0.07344194, 1.067098, 0.5980876, 1, 0, 0, 1, 1,
0.07609461, -1.50589, 3.171914, 1, 0, 0, 1, 1,
0.08102741, 0.2613553, -1.209664, 1, 0, 0, 1, 1,
0.0834397, 0.2324884, -0.7218217, 1, 0, 0, 1, 1,
0.08862199, -2.025435, 2.404673, 0, 0, 0, 1, 1,
0.09541582, -1.15694, 1.527552, 0, 0, 0, 1, 1,
0.09713857, -1.268091, 2.336699, 0, 0, 0, 1, 1,
0.09879538, -0.8854536, 2.608562, 0, 0, 0, 1, 1,
0.1009668, 0.102878, -0.1537411, 0, 0, 0, 1, 1,
0.1021205, -0.4880323, 3.118086, 0, 0, 0, 1, 1,
0.1026709, 0.1465402, 1.214954, 0, 0, 0, 1, 1,
0.1042534, -0.8889564, 2.671602, 1, 1, 1, 1, 1,
0.1055977, 0.2271034, 0.172397, 1, 1, 1, 1, 1,
0.105877, -0.6527479, 2.964993, 1, 1, 1, 1, 1,
0.107957, 0.6621861, -0.9741174, 1, 1, 1, 1, 1,
0.1152352, -1.174959, 2.998771, 1, 1, 1, 1, 1,
0.1152866, -0.4538058, 4.976963, 1, 1, 1, 1, 1,
0.1170266, 0.7154855, -0.7818124, 1, 1, 1, 1, 1,
0.1172674, 0.5076583, 1.021362, 1, 1, 1, 1, 1,
0.1179944, 1.985881, -0.4503336, 1, 1, 1, 1, 1,
0.1206275, -2.050112, 0.8835188, 1, 1, 1, 1, 1,
0.1210123, 0.6939704, 0.9052638, 1, 1, 1, 1, 1,
0.1232108, -0.7657491, 5.624604, 1, 1, 1, 1, 1,
0.1258309, -0.8583696, 3.470822, 1, 1, 1, 1, 1,
0.1305591, 0.8835618, -0.6645542, 1, 1, 1, 1, 1,
0.1351054, -0.3979423, 1.484169, 1, 1, 1, 1, 1,
0.1358216, 0.2288943, 1.046118, 0, 0, 1, 1, 1,
0.1362953, 0.6112385, -1.278854, 1, 0, 0, 1, 1,
0.1428016, 1.088245, -1.04289, 1, 0, 0, 1, 1,
0.1428425, 2.468648, -1.596788, 1, 0, 0, 1, 1,
0.1445689, 0.1678783, 0.1553986, 1, 0, 0, 1, 1,
0.1499174, -0.6448062, 2.825671, 1, 0, 0, 1, 1,
0.1533172, -1.264564, 3.731947, 0, 0, 0, 1, 1,
0.1545486, -0.7762078, 4.66541, 0, 0, 0, 1, 1,
0.1569353, -1.888247, 3.385535, 0, 0, 0, 1, 1,
0.1581463, -1.10528, 3.040926, 0, 0, 0, 1, 1,
0.1620438, 0.9636907, -1.090343, 0, 0, 0, 1, 1,
0.1631283, 1.004821, -1.570871, 0, 0, 0, 1, 1,
0.1656528, 1.389842, 0.4541357, 0, 0, 0, 1, 1,
0.1670562, -0.7158097, 4.118107, 1, 1, 1, 1, 1,
0.1693931, 0.4258615, 0.3462878, 1, 1, 1, 1, 1,
0.176232, -0.8070985, 2.427244, 1, 1, 1, 1, 1,
0.1785471, -0.241965, 1.442159, 1, 1, 1, 1, 1,
0.1801465, -0.6074743, 1.589961, 1, 1, 1, 1, 1,
0.1820865, 0.2690536, 0.8727875, 1, 1, 1, 1, 1,
0.1832424, 0.2133592, 2.215812, 1, 1, 1, 1, 1,
0.184053, -0.4380681, 1.381264, 1, 1, 1, 1, 1,
0.1856029, -1.045577, 3.521919, 1, 1, 1, 1, 1,
0.1891708, -0.2250545, 3.002304, 1, 1, 1, 1, 1,
0.1909893, -0.9700202, 1.839673, 1, 1, 1, 1, 1,
0.2057847, 0.1751579, 0.4274804, 1, 1, 1, 1, 1,
0.2114898, -1.822036, 2.580028, 1, 1, 1, 1, 1,
0.2120306, -0.7760976, 1.260816, 1, 1, 1, 1, 1,
0.2123982, 0.507553, 0.8106753, 1, 1, 1, 1, 1,
0.2132853, 0.8788719, 1.627705, 0, 0, 1, 1, 1,
0.2138749, 0.5861473, 1.799912, 1, 0, 0, 1, 1,
0.2150088, 0.3264644, 1.204202, 1, 0, 0, 1, 1,
0.2205052, 0.206444, -0.3537, 1, 0, 0, 1, 1,
0.2238712, 0.3767679, 0.8398278, 1, 0, 0, 1, 1,
0.2248696, 0.600905, -1.102886, 1, 0, 0, 1, 1,
0.2256427, -1.169938, 3.85781, 0, 0, 0, 1, 1,
0.2271562, 2.44803, 0.6960791, 0, 0, 0, 1, 1,
0.2323817, -1.897165, 3.802529, 0, 0, 0, 1, 1,
0.2324187, -0.1525852, 1.425811, 0, 0, 0, 1, 1,
0.2350563, -0.4269624, 1.798393, 0, 0, 0, 1, 1,
0.2357569, -0.04678889, 1.55409, 0, 0, 0, 1, 1,
0.2366965, -0.7318732, 2.651279, 0, 0, 0, 1, 1,
0.2395105, -2.144147, 3.620697, 1, 1, 1, 1, 1,
0.2400018, 2.177384, 1.139166, 1, 1, 1, 1, 1,
0.2402422, 0.6037612, 2.277329, 1, 1, 1, 1, 1,
0.2446868, 0.3967591, -0.7488447, 1, 1, 1, 1, 1,
0.2449466, 0.7877312, 0.5004907, 1, 1, 1, 1, 1,
0.2466134, 0.2940802, 1.677114, 1, 1, 1, 1, 1,
0.2484906, 0.4122532, -0.3151603, 1, 1, 1, 1, 1,
0.2503589, 0.8731207, 0.762114, 1, 1, 1, 1, 1,
0.2527877, 0.902096, -1.009982, 1, 1, 1, 1, 1,
0.2556466, 0.658224, -0.5257019, 1, 1, 1, 1, 1,
0.2563785, -0.1097382, 1.391297, 1, 1, 1, 1, 1,
0.2569503, -0.05008253, 3.667815, 1, 1, 1, 1, 1,
0.2599133, -2.245252, 1.498025, 1, 1, 1, 1, 1,
0.2611956, -1.386534, 3.152185, 1, 1, 1, 1, 1,
0.2642246, 1.630389, -0.1704876, 1, 1, 1, 1, 1,
0.2649575, -1.356831, 3.743394, 0, 0, 1, 1, 1,
0.2682986, -1.576188, 2.184636, 1, 0, 0, 1, 1,
0.2710269, 0.06584555, 0.616601, 1, 0, 0, 1, 1,
0.2713538, -0.5281082, 2.200783, 1, 0, 0, 1, 1,
0.2730957, -1.036567, 4.394888, 1, 0, 0, 1, 1,
0.2764332, -0.7462144, 2.131252, 1, 0, 0, 1, 1,
0.2764347, -0.5180116, 2.526621, 0, 0, 0, 1, 1,
0.2787568, 0.3669668, -0.05681867, 0, 0, 0, 1, 1,
0.280071, 0.81739, 0.135791, 0, 0, 0, 1, 1,
0.2840073, -2.377563, 5.944765, 0, 0, 0, 1, 1,
0.2845689, 0.7921517, 1.315587, 0, 0, 0, 1, 1,
0.2882196, -1.505733, 2.203789, 0, 0, 0, 1, 1,
0.290723, -0.3470871, 1.492141, 0, 0, 0, 1, 1,
0.292264, -0.0003822886, 1.002654, 1, 1, 1, 1, 1,
0.2956404, -1.180706, 2.88913, 1, 1, 1, 1, 1,
0.2991804, 0.4891621, 1.164633, 1, 1, 1, 1, 1,
0.2998439, -0.02145033, 1.894957, 1, 1, 1, 1, 1,
0.3001306, 1.307149, 1.091437, 1, 1, 1, 1, 1,
0.3047746, 0.4441742, 2.235496, 1, 1, 1, 1, 1,
0.3058234, 1.486137, -0.8730761, 1, 1, 1, 1, 1,
0.307057, 0.06064096, -0.7434732, 1, 1, 1, 1, 1,
0.3084342, -1.008578, 3.759338, 1, 1, 1, 1, 1,
0.3087133, 1.715423, -0.07258531, 1, 1, 1, 1, 1,
0.309503, 0.3410065, -0.06809741, 1, 1, 1, 1, 1,
0.3111956, -0.07949653, 1.411108, 1, 1, 1, 1, 1,
0.3171578, 0.876729, 0.4465769, 1, 1, 1, 1, 1,
0.3175068, 1.46875, 1.490182, 1, 1, 1, 1, 1,
0.323666, -0.1240092, 1.232338, 1, 1, 1, 1, 1,
0.3240895, 1.575089, -1.231374, 0, 0, 1, 1, 1,
0.326772, -0.5008438, 2.557411, 1, 0, 0, 1, 1,
0.3295416, -1.581657, 1.724401, 1, 0, 0, 1, 1,
0.331053, 0.8282341, 0.8250243, 1, 0, 0, 1, 1,
0.3311769, -0.9237301, 0.9242652, 1, 0, 0, 1, 1,
0.334906, -0.06887224, 1.49652, 1, 0, 0, 1, 1,
0.3359472, 0.605021, 0.8034489, 0, 0, 0, 1, 1,
0.3371058, -1.599129, 0.3511259, 0, 0, 0, 1, 1,
0.3396365, -0.07747149, 2.714401, 0, 0, 0, 1, 1,
0.3409152, -1.486176, 2.770517, 0, 0, 0, 1, 1,
0.344548, -0.04502166, 0.2547711, 0, 0, 0, 1, 1,
0.3453465, -0.47714, 1.991757, 0, 0, 0, 1, 1,
0.3489202, -0.606171, 1.273556, 0, 0, 0, 1, 1,
0.3571099, -0.7853003, 2.212857, 1, 1, 1, 1, 1,
0.3603577, 0.8915586, -0.0913071, 1, 1, 1, 1, 1,
0.3617955, -0.5759993, 1.043413, 1, 1, 1, 1, 1,
0.3620329, 0.002480631, 3.122102, 1, 1, 1, 1, 1,
0.3629609, -0.830743, 3.325045, 1, 1, 1, 1, 1,
0.3680421, 0.1345603, -0.5223408, 1, 1, 1, 1, 1,
0.3707525, 0.6592419, 0.8275276, 1, 1, 1, 1, 1,
0.3770014, 2.462489, 0.1543133, 1, 1, 1, 1, 1,
0.3780294, 0.8218692, 0.5291448, 1, 1, 1, 1, 1,
0.3822465, -0.9025124, 3.629958, 1, 1, 1, 1, 1,
0.3823825, 0.567047, 0.3253445, 1, 1, 1, 1, 1,
0.3846404, 0.8676823, -1.805381, 1, 1, 1, 1, 1,
0.3864657, 0.2884059, -0.3943107, 1, 1, 1, 1, 1,
0.387623, -1.931011, 3.81891, 1, 1, 1, 1, 1,
0.3888217, 2.281786, 0.367333, 1, 1, 1, 1, 1,
0.3892348, -0.2933967, 2.454643, 0, 0, 1, 1, 1,
0.3954616, 0.350913, 0.4699196, 1, 0, 0, 1, 1,
0.3979014, 0.1286552, 1.211502, 1, 0, 0, 1, 1,
0.4006628, -1.322243, 3.344669, 1, 0, 0, 1, 1,
0.4025894, -0.1354209, 1.823225, 1, 0, 0, 1, 1,
0.4026485, 0.7202427, -0.1716153, 1, 0, 0, 1, 1,
0.4031568, 0.9039549, -0.6489093, 0, 0, 0, 1, 1,
0.4068381, 1.301618, -0.2081137, 0, 0, 0, 1, 1,
0.4122931, 0.2608321, 0.9454939, 0, 0, 0, 1, 1,
0.4137992, 0.0206529, 1.238457, 0, 0, 0, 1, 1,
0.4156626, -1.583136, 1.871548, 0, 0, 0, 1, 1,
0.4161738, 1.209669, 0.5891058, 0, 0, 0, 1, 1,
0.4177903, -2.53368, 1.892268, 0, 0, 0, 1, 1,
0.4181491, -0.1597457, 2.122663, 1, 1, 1, 1, 1,
0.418741, 1.656223, -0.5290553, 1, 1, 1, 1, 1,
0.4282266, 0.5494044, -1.275988, 1, 1, 1, 1, 1,
0.4291319, 0.726652, 0.840511, 1, 1, 1, 1, 1,
0.4330261, -1.742216, 2.877367, 1, 1, 1, 1, 1,
0.4336446, -1.06235, 3.311125, 1, 1, 1, 1, 1,
0.4400864, -2.805818, 3.205922, 1, 1, 1, 1, 1,
0.4420921, -0.5529781, 1.232202, 1, 1, 1, 1, 1,
0.4459738, -0.6289173, 2.434131, 1, 1, 1, 1, 1,
0.4471543, -0.2619292, 2.658082, 1, 1, 1, 1, 1,
0.452075, -0.7772462, 2.635178, 1, 1, 1, 1, 1,
0.4545552, 0.687574, 1.147617, 1, 1, 1, 1, 1,
0.4599653, 1.427721, 0.4986956, 1, 1, 1, 1, 1,
0.4614357, 0.8206926, 0.7551795, 1, 1, 1, 1, 1,
0.4625117, 0.5717789, 0.830018, 1, 1, 1, 1, 1,
0.4641644, 0.1272602, 0.6873062, 0, 0, 1, 1, 1,
0.466465, -0.5885449, 3.407427, 1, 0, 0, 1, 1,
0.4677267, -0.8096337, 3.081291, 1, 0, 0, 1, 1,
0.4706169, -0.3632833, 0.1331902, 1, 0, 0, 1, 1,
0.4737758, -1.212281, 2.639003, 1, 0, 0, 1, 1,
0.4783538, 0.1662102, 1.486821, 1, 0, 0, 1, 1,
0.4824107, -0.2784014, 2.305133, 0, 0, 0, 1, 1,
0.4848776, -1.1681, 3.483242, 0, 0, 0, 1, 1,
0.4852106, 1.190422, -0.8478454, 0, 0, 0, 1, 1,
0.4876671, -0.1781316, 2.061515, 0, 0, 0, 1, 1,
0.4888594, -0.6388407, 2.76425, 0, 0, 0, 1, 1,
0.492756, 0.729683, 0.5922559, 0, 0, 0, 1, 1,
0.4983416, 1.841056, -1.917624, 0, 0, 0, 1, 1,
0.498922, -0.295698, 1.327831, 1, 1, 1, 1, 1,
0.4989928, -0.7829022, 3.270879, 1, 1, 1, 1, 1,
0.5017905, 0.01001394, 1.398489, 1, 1, 1, 1, 1,
0.5021316, 1.324345, -1.06546, 1, 1, 1, 1, 1,
0.5043771, -0.1172149, 1.193634, 1, 1, 1, 1, 1,
0.5066268, 1.550649, -0.5098313, 1, 1, 1, 1, 1,
0.5091364, -0.285131, 2.589121, 1, 1, 1, 1, 1,
0.515849, 0.190773, 1.292373, 1, 1, 1, 1, 1,
0.517242, -0.4321719, 2.060563, 1, 1, 1, 1, 1,
0.5208635, -1.727361, 2.178314, 1, 1, 1, 1, 1,
0.5212412, 0.5656445, 2.232353, 1, 1, 1, 1, 1,
0.5217966, -1.020694, 2.701118, 1, 1, 1, 1, 1,
0.5228302, 0.266796, -0.7876575, 1, 1, 1, 1, 1,
0.5247008, -1.368093, 2.089686, 1, 1, 1, 1, 1,
0.5291742, 0.3172156, -0.8566133, 1, 1, 1, 1, 1,
0.5312759, 1.990027, -0.1947247, 0, 0, 1, 1, 1,
0.5317271, -0.6918301, 2.235901, 1, 0, 0, 1, 1,
0.5417054, -1.781026, 2.761341, 1, 0, 0, 1, 1,
0.5442237, 0.692413, 2.882987, 1, 0, 0, 1, 1,
0.5463517, 0.2574324, 0.7680982, 1, 0, 0, 1, 1,
0.5471189, 2.487612, -0.1122142, 1, 0, 0, 1, 1,
0.5520148, 0.07742324, 0.5285197, 0, 0, 0, 1, 1,
0.5577075, -1.417782, 3.087952, 0, 0, 0, 1, 1,
0.5611742, 0.1319931, 2.466914, 0, 0, 0, 1, 1,
0.5670062, -0.6504113, 1.974369, 0, 0, 0, 1, 1,
0.5698578, -0.5446159, 2.783107, 0, 0, 0, 1, 1,
0.574646, 1.09648, 1.986191, 0, 0, 0, 1, 1,
0.5747573, -0.6015735, 3.724147, 0, 0, 0, 1, 1,
0.5748012, 0.2922855, 1.532382, 1, 1, 1, 1, 1,
0.5811848, -0.7285686, 3.248465, 1, 1, 1, 1, 1,
0.5979133, 0.5673699, 0.7762516, 1, 1, 1, 1, 1,
0.597935, 0.4060059, 0.9801906, 1, 1, 1, 1, 1,
0.5995789, 0.3551568, 1.461809, 1, 1, 1, 1, 1,
0.6021952, 0.520218, -0.4330003, 1, 1, 1, 1, 1,
0.6084784, -1.577649, 2.613036, 1, 1, 1, 1, 1,
0.6167923, 1.361671, -0.7875302, 1, 1, 1, 1, 1,
0.6215508, -0.3810336, 2.390337, 1, 1, 1, 1, 1,
0.6245443, 0.4966335, -0.3745011, 1, 1, 1, 1, 1,
0.6257095, -1.074744, 3.767596, 1, 1, 1, 1, 1,
0.6269435, -1.152724, 1.735055, 1, 1, 1, 1, 1,
0.6294156, -0.1507032, 2.340311, 1, 1, 1, 1, 1,
0.6314189, 0.5951344, 0.6189019, 1, 1, 1, 1, 1,
0.6351866, -1.052925, 2.310886, 1, 1, 1, 1, 1,
0.6428897, -1.347357, 1.040458, 0, 0, 1, 1, 1,
0.6430786, 0.2512175, 2.94115, 1, 0, 0, 1, 1,
0.6435803, -0.5639346, 2.98701, 1, 0, 0, 1, 1,
0.6475529, -0.1089804, 3.074196, 1, 0, 0, 1, 1,
0.6485254, -0.9616501, 3.020027, 1, 0, 0, 1, 1,
0.651282, 0.1423873, 1.551156, 1, 0, 0, 1, 1,
0.6530276, -0.4628303, 0.05973927, 0, 0, 0, 1, 1,
0.6539693, 0.1589693, 0.5113835, 0, 0, 0, 1, 1,
0.654661, 0.2970585, 1.784533, 0, 0, 0, 1, 1,
0.6591555, -0.4187633, 1.808851, 0, 0, 0, 1, 1,
0.6592859, -0.8153126, 3.423261, 0, 0, 0, 1, 1,
0.6639503, 0.0696642, 1.811409, 0, 0, 0, 1, 1,
0.6675986, -0.4431859, 2.953774, 0, 0, 0, 1, 1,
0.6691922, 0.1828165, 1.526968, 1, 1, 1, 1, 1,
0.6705272, 1.004766, 0.6208946, 1, 1, 1, 1, 1,
0.6717108, 0.3098708, 0.210294, 1, 1, 1, 1, 1,
0.6764578, 0.9140242, 1.527197, 1, 1, 1, 1, 1,
0.6767495, -1.485729, 2.049855, 1, 1, 1, 1, 1,
0.6818471, -0.4919832, 3.275748, 1, 1, 1, 1, 1,
0.6826105, 0.4664947, 1.710588, 1, 1, 1, 1, 1,
0.6851909, -0.9886247, 0.7092004, 1, 1, 1, 1, 1,
0.6875338, -0.4282998, 4.319291, 1, 1, 1, 1, 1,
0.6930609, -1.309407, 2.871459, 1, 1, 1, 1, 1,
0.6972874, 1.236139, 0.7899013, 1, 1, 1, 1, 1,
0.7033182, -1.255845, 3.316602, 1, 1, 1, 1, 1,
0.7099349, 1.273401, 0.3830209, 1, 1, 1, 1, 1,
0.7124026, -0.2130214, 2.184898, 1, 1, 1, 1, 1,
0.7165995, -0.338032, 2.265442, 1, 1, 1, 1, 1,
0.7178493, -1.648265, 3.190239, 0, 0, 1, 1, 1,
0.7215829, 0.0008884022, 0.9967023, 1, 0, 0, 1, 1,
0.7256145, 0.8545703, 0.6094563, 1, 0, 0, 1, 1,
0.7332124, 0.4017632, 1.869701, 1, 0, 0, 1, 1,
0.7343152, -1.124676, 2.207409, 1, 0, 0, 1, 1,
0.7399446, -0.393392, 2.331817, 1, 0, 0, 1, 1,
0.7457494, 1.701017, 0.2155762, 0, 0, 0, 1, 1,
0.7490727, 0.9765369, 1.148299, 0, 0, 0, 1, 1,
0.7557687, -1.764192, 1.168382, 0, 0, 0, 1, 1,
0.756438, 0.3022471, 2.548304, 0, 0, 0, 1, 1,
0.758871, 0.8729435, -0.1216373, 0, 0, 0, 1, 1,
0.7596616, -0.3511528, 0.4518279, 0, 0, 0, 1, 1,
0.7664005, 0.7220557, -0.1741676, 0, 0, 0, 1, 1,
0.7738295, 0.4328552, -0.4088137, 1, 1, 1, 1, 1,
0.7750595, -0.6990486, 3.053759, 1, 1, 1, 1, 1,
0.7777454, 0.8181359, 0.1772643, 1, 1, 1, 1, 1,
0.778504, 2.983054, 0.4639855, 1, 1, 1, 1, 1,
0.7792118, -0.05610227, 0.5959316, 1, 1, 1, 1, 1,
0.7863775, -0.9460635, 2.373558, 1, 1, 1, 1, 1,
0.7864559, 1.409666, 0.4718019, 1, 1, 1, 1, 1,
0.788164, -1.925859, 2.807243, 1, 1, 1, 1, 1,
0.7881653, 0.5737424, 0.4570364, 1, 1, 1, 1, 1,
0.7893012, 0.356599, 0.4545015, 1, 1, 1, 1, 1,
0.7907572, -1.311437, 0.3931568, 1, 1, 1, 1, 1,
0.7908165, 1.222504, -0.3314649, 1, 1, 1, 1, 1,
0.796302, -1.420014, 3.11925, 1, 1, 1, 1, 1,
0.7964048, -0.4352432, 2.226842, 1, 1, 1, 1, 1,
0.7991744, 1.323614, 6.409911e-05, 1, 1, 1, 1, 1,
0.8063351, 1.031188, 0.9966546, 0, 0, 1, 1, 1,
0.8072901, -0.2233361, 1.935157, 1, 0, 0, 1, 1,
0.812611, 0.1287035, 1.887964, 1, 0, 0, 1, 1,
0.8130074, -0.2715615, 3.063547, 1, 0, 0, 1, 1,
0.8213419, -0.09693025, 1.008591, 1, 0, 0, 1, 1,
0.8226783, 1.507677, -0.09410731, 1, 0, 0, 1, 1,
0.8253091, 0.434536, 0.9633657, 0, 0, 0, 1, 1,
0.8390903, -0.4258452, 2.269295, 0, 0, 0, 1, 1,
0.8437828, 2.180057, -0.3966069, 0, 0, 0, 1, 1,
0.8482103, -0.1391948, 0.5551111, 0, 0, 0, 1, 1,
0.8492717, -2.399747, 3.702361, 0, 0, 0, 1, 1,
0.850955, 1.893283, -0.1948414, 0, 0, 0, 1, 1,
0.8558655, 1.055759, 0.8497354, 0, 0, 0, 1, 1,
0.870862, -0.5305718, 2.822849, 1, 1, 1, 1, 1,
0.8713759, 0.1911182, 1.397013, 1, 1, 1, 1, 1,
0.8716486, 1.172899, -0.1199877, 1, 1, 1, 1, 1,
0.8769383, -0.743744, 1.400573, 1, 1, 1, 1, 1,
0.880024, -0.7519988, 3.081023, 1, 1, 1, 1, 1,
0.8847095, -0.4440212, 0.8371276, 1, 1, 1, 1, 1,
0.8888652, 0.2970176, 2.015449, 1, 1, 1, 1, 1,
0.8930414, -0.6286861, 1.623532, 1, 1, 1, 1, 1,
0.8978252, 0.6365987, 1.151857, 1, 1, 1, 1, 1,
0.9042615, -1.25471, 3.178329, 1, 1, 1, 1, 1,
0.9064167, -0.6880775, 2.099758, 1, 1, 1, 1, 1,
0.9096866, -0.916975, 2.634782, 1, 1, 1, 1, 1,
0.9136726, -0.5197448, 1.65167, 1, 1, 1, 1, 1,
0.9137104, 0.418864, 1.131199, 1, 1, 1, 1, 1,
0.9137856, -0.3072725, 2.222423, 1, 1, 1, 1, 1,
0.917863, 0.6865921, 0.5554354, 0, 0, 1, 1, 1,
0.9187014, -0.1317581, 3.02749, 1, 0, 0, 1, 1,
0.9273259, -0.8468998, 1.568842, 1, 0, 0, 1, 1,
0.9362627, -0.1415865, 1.824596, 1, 0, 0, 1, 1,
0.9365053, -0.4978649, 1.781628, 1, 0, 0, 1, 1,
0.9370544, 1.257079, 0.9179125, 1, 0, 0, 1, 1,
0.9429702, -0.3929909, 2.889455, 0, 0, 0, 1, 1,
0.9454038, 0.8096092, 1.72503, 0, 0, 0, 1, 1,
0.9478357, 0.6069233, 0.7686184, 0, 0, 0, 1, 1,
0.9511861, 1.206659, 0.7002141, 0, 0, 0, 1, 1,
0.9554768, -0.7911826, 4.088369, 0, 0, 0, 1, 1,
0.9567491, -0.5987925, 1.204174, 0, 0, 0, 1, 1,
0.9608502, 0.2892073, 2.408208, 0, 0, 0, 1, 1,
0.9610972, 1.940217, 0.8115326, 1, 1, 1, 1, 1,
0.9617596, -1.323802, 2.178897, 1, 1, 1, 1, 1,
0.9623308, 1.192202, 0.9424599, 1, 1, 1, 1, 1,
0.963068, -0.7436762, 2.409676, 1, 1, 1, 1, 1,
0.9652023, -0.837491, 2.89338, 1, 1, 1, 1, 1,
0.9658997, 1.243761, 0.5891094, 1, 1, 1, 1, 1,
0.9663656, 2.333082, 2.557003, 1, 1, 1, 1, 1,
0.9672253, -0.5538394, 2.774612, 1, 1, 1, 1, 1,
0.9705639, 0.6988406, -1.623739, 1, 1, 1, 1, 1,
0.9759303, 0.3956403, 1.57009, 1, 1, 1, 1, 1,
0.9780771, 0.7872555, 0.746674, 1, 1, 1, 1, 1,
0.9793027, -1.720869, 2.786511, 1, 1, 1, 1, 1,
0.9800692, 1.812622, 2.030097, 1, 1, 1, 1, 1,
0.9838272, -0.5649689, 0.3427161, 1, 1, 1, 1, 1,
0.9909453, 1.074211, 1.597744, 1, 1, 1, 1, 1,
0.9921448, -0.613846, 3.598028, 0, 0, 1, 1, 1,
0.9959706, -0.1153254, 2.25838, 1, 0, 0, 1, 1,
0.9983869, 0.1648331, 0.5671281, 1, 0, 0, 1, 1,
1.001035, 1.154982, 0.7248732, 1, 0, 0, 1, 1,
1.007009, 1.186224, 0.476431, 1, 0, 0, 1, 1,
1.014511, -1.192412, 1.447409, 1, 0, 0, 1, 1,
1.014832, -0.09683104, 1.318977, 0, 0, 0, 1, 1,
1.022536, -0.3494993, 1.038194, 0, 0, 0, 1, 1,
1.034395, -0.07773991, 2.099912, 0, 0, 0, 1, 1,
1.034701, -0.9754249, 1.24271, 0, 0, 0, 1, 1,
1.039861, -0.666215, 3.008522, 0, 0, 0, 1, 1,
1.043947, -1.570354, 3.330218, 0, 0, 0, 1, 1,
1.048445, 0.04755026, 1.972611, 0, 0, 0, 1, 1,
1.057032, 0.5511661, 0.2855871, 1, 1, 1, 1, 1,
1.064933, -1.259529, 1.802845, 1, 1, 1, 1, 1,
1.065788, -1.024899, 1.467381, 1, 1, 1, 1, 1,
1.072407, 0.8024018, 2.414568, 1, 1, 1, 1, 1,
1.078812, 0.739821, 3.285748, 1, 1, 1, 1, 1,
1.080217, -1.000796, 3.297542, 1, 1, 1, 1, 1,
1.081064, -1.040936, 2.132043, 1, 1, 1, 1, 1,
1.091195, 0.5623673, 0.7608968, 1, 1, 1, 1, 1,
1.097386, 1.007462, 0.8074827, 1, 1, 1, 1, 1,
1.097489, -0.8248115, 2.225932, 1, 1, 1, 1, 1,
1.108313, 1.548846, 0.07997523, 1, 1, 1, 1, 1,
1.114939, -0.03791867, 2.903373, 1, 1, 1, 1, 1,
1.119646, -0.8212733, 2.663941, 1, 1, 1, 1, 1,
1.124297, 0.2205539, 0.4146565, 1, 1, 1, 1, 1,
1.126796, -1.142594, 2.165931, 1, 1, 1, 1, 1,
1.13467, -0.6658055, 3.401727, 0, 0, 1, 1, 1,
1.145733, 2.315614, 1.338566, 1, 0, 0, 1, 1,
1.145842, -0.9249713, 1.525353, 1, 0, 0, 1, 1,
1.163498, -2.261771, 2.072414, 1, 0, 0, 1, 1,
1.175039, -0.378637, 1.94165, 1, 0, 0, 1, 1,
1.178259, 1.581388, 0.06512981, 1, 0, 0, 1, 1,
1.179284, 0.3397254, 1.724571, 0, 0, 0, 1, 1,
1.183585, 0.2993826, 1.558859, 0, 0, 0, 1, 1,
1.184007, 0.5873711, 0.9410554, 0, 0, 0, 1, 1,
1.188361, -0.3747717, 2.753098, 0, 0, 0, 1, 1,
1.190505, 0.8115115, 1.107113, 0, 0, 0, 1, 1,
1.190927, -2.942752, 2.995663, 0, 0, 0, 1, 1,
1.192985, -0.5126105, 0.8887002, 0, 0, 0, 1, 1,
1.205074, 0.6765171, -1.155037, 1, 1, 1, 1, 1,
1.210638, 0.1495576, 0.4481574, 1, 1, 1, 1, 1,
1.213319, -0.7721937, 2.733104, 1, 1, 1, 1, 1,
1.228513, 1.176905, 2.101859, 1, 1, 1, 1, 1,
1.230529, 0.9683393, 0.9960443, 1, 1, 1, 1, 1,
1.234752, -0.4213896, 2.530472, 1, 1, 1, 1, 1,
1.238151, 0.5844295, 2.767726, 1, 1, 1, 1, 1,
1.245037, -0.1901862, 2.010292, 1, 1, 1, 1, 1,
1.248433, -1.414789, 0.9622588, 1, 1, 1, 1, 1,
1.252125, -1.420155, 3.670869, 1, 1, 1, 1, 1,
1.253278, -0.1472026, 1.002307, 1, 1, 1, 1, 1,
1.257159, 0.8708877, 3.556203, 1, 1, 1, 1, 1,
1.266922, 0.3353454, 2.261733, 1, 1, 1, 1, 1,
1.285776, -0.696355, -0.3235996, 1, 1, 1, 1, 1,
1.290236, 1.833307, 3.206359, 1, 1, 1, 1, 1,
1.292088, 1.274632, -0.1681541, 0, 0, 1, 1, 1,
1.29504, 0.07489543, 3.661506, 1, 0, 0, 1, 1,
1.295248, -3.142302, 1.4726, 1, 0, 0, 1, 1,
1.29614, -0.05771402, 1.662648, 1, 0, 0, 1, 1,
1.307696, 0.08386359, 3.33696, 1, 0, 0, 1, 1,
1.310915, -0.3768644, 2.204701, 1, 0, 0, 1, 1,
1.310985, -1.504727, 2.182903, 0, 0, 0, 1, 1,
1.317259, 0.08195692, 3.211647, 0, 0, 0, 1, 1,
1.318007, -1.334661, 0.8793404, 0, 0, 0, 1, 1,
1.320958, -0.07289429, 0.2732703, 0, 0, 0, 1, 1,
1.325859, 2.001123, 0.0295596, 0, 0, 0, 1, 1,
1.331666, 0.09462263, 1.796512, 0, 0, 0, 1, 1,
1.333745, -0.3883542, 2.122195, 0, 0, 0, 1, 1,
1.34811, -0.5176358, 1.653327, 1, 1, 1, 1, 1,
1.355582, 2.112104, -1.164043, 1, 1, 1, 1, 1,
1.360241, -0.1571486, 1.93836, 1, 1, 1, 1, 1,
1.37018, -0.5730271, 1.384659, 1, 1, 1, 1, 1,
1.372688, -1.322845, 0.6519327, 1, 1, 1, 1, 1,
1.38293, 1.570204, 2.401431, 1, 1, 1, 1, 1,
1.383527, -0.7065948, 0.2630486, 1, 1, 1, 1, 1,
1.391092, -0.1629313, 0.3127396, 1, 1, 1, 1, 1,
1.39747, 0.663408, 0.4553903, 1, 1, 1, 1, 1,
1.398342, -0.7925999, 1.48068, 1, 1, 1, 1, 1,
1.398487, -0.1396609, 3.95015, 1, 1, 1, 1, 1,
1.402375, 0.4336715, 1.830163, 1, 1, 1, 1, 1,
1.414824, 0.1201138, 0.5964481, 1, 1, 1, 1, 1,
1.416318, 0.04031578, 0.3040971, 1, 1, 1, 1, 1,
1.418127, 1.117897, 0.1885456, 1, 1, 1, 1, 1,
1.425237, 0.09858139, 3.637556, 0, 0, 1, 1, 1,
1.425698, 2.908842, 1.06969, 1, 0, 0, 1, 1,
1.429712, 0.4023665, 0.4952463, 1, 0, 0, 1, 1,
1.434852, -0.61611, 1.309224, 1, 0, 0, 1, 1,
1.451698, -0.6409227, 1.312782, 1, 0, 0, 1, 1,
1.45488, -1.542221, 0.9719341, 1, 0, 0, 1, 1,
1.466914, -0.4314127, 1.548637, 0, 0, 0, 1, 1,
1.470742, 0.4938259, 0.8080395, 0, 0, 0, 1, 1,
1.474632, -1.620173, 0.508294, 0, 0, 0, 1, 1,
1.479097, 0.177198, 2.162919, 0, 0, 0, 1, 1,
1.480817, 2.126697, 0.2647544, 0, 0, 0, 1, 1,
1.48426, 1.259232, 1.274746, 0, 0, 0, 1, 1,
1.492673, -0.2466425, 0.6469421, 0, 0, 0, 1, 1,
1.508034, -1.053648, 1.819706, 1, 1, 1, 1, 1,
1.520015, 0.7710649, -0.1362113, 1, 1, 1, 1, 1,
1.524484, 1.130575, -0.5510572, 1, 1, 1, 1, 1,
1.531478, -0.06984775, 1.030948, 1, 1, 1, 1, 1,
1.532884, 0.7964768, 0.6269647, 1, 1, 1, 1, 1,
1.533803, 0.2876289, 1.16327, 1, 1, 1, 1, 1,
1.53892, 0.9570696, 0.4333144, 1, 1, 1, 1, 1,
1.540465, 2.132718, 1.77883, 1, 1, 1, 1, 1,
1.556711, -0.4176309, 2.113528, 1, 1, 1, 1, 1,
1.601934, 0.6277458, 1.394823, 1, 1, 1, 1, 1,
1.604837, 0.5637887, 2.031282, 1, 1, 1, 1, 1,
1.609902, 1.69171, 1.918081, 1, 1, 1, 1, 1,
1.61491, -1.644919, 2.561563, 1, 1, 1, 1, 1,
1.61927, -1.973222, 2.117286, 1, 1, 1, 1, 1,
1.63702, 0.984378, 0.9212475, 1, 1, 1, 1, 1,
1.639944, 0.05769696, -0.1130709, 0, 0, 1, 1, 1,
1.640919, -0.7216986, 4.683872, 1, 0, 0, 1, 1,
1.646536, 0.2419776, 3.231968, 1, 0, 0, 1, 1,
1.678483, 0.414204, 0.06636651, 1, 0, 0, 1, 1,
1.681796, 0.3575034, 1.170924, 1, 0, 0, 1, 1,
1.68864, 2.420387, -0.3997015, 1, 0, 0, 1, 1,
1.694556, 0.6160036, 0.4699467, 0, 0, 0, 1, 1,
1.699272, -0.6726846, 2.73326, 0, 0, 0, 1, 1,
1.705188, -1.282193, 2.134295, 0, 0, 0, 1, 1,
1.708796, 0.1551578, 1.631305, 0, 0, 0, 1, 1,
1.746668, 0.8934789, -0.7776129, 0, 0, 0, 1, 1,
1.758926, -0.6565433, 1.569372, 0, 0, 0, 1, 1,
1.759022, -1.107099, 1.875303, 0, 0, 0, 1, 1,
1.778691, -1.367976, 0.6849349, 1, 1, 1, 1, 1,
1.818958, 1.574605, 1.378007, 1, 1, 1, 1, 1,
1.834026, -0.08932072, 1.674063, 1, 1, 1, 1, 1,
1.834267, 1.939228, 0.3395384, 1, 1, 1, 1, 1,
1.838229, -0.1514768, 0.8731525, 1, 1, 1, 1, 1,
1.848922, 1.325786, 0.9701373, 1, 1, 1, 1, 1,
1.853457, 1.687215, 1.21565, 1, 1, 1, 1, 1,
1.85917, -0.4613372, 0.641496, 1, 1, 1, 1, 1,
1.860363, -1.71279, 1.070502, 1, 1, 1, 1, 1,
1.862433, 0.1498357, 2.933533, 1, 1, 1, 1, 1,
1.866498, -0.782194, 2.365374, 1, 1, 1, 1, 1,
1.875228, -1.31248, 2.7215, 1, 1, 1, 1, 1,
1.930096, -0.03222388, 1.9751, 1, 1, 1, 1, 1,
1.945743, 1.138394, 1.605131, 1, 1, 1, 1, 1,
1.946841, -0.4045495, 1.417628, 1, 1, 1, 1, 1,
1.972367, -0.9510311, 2.758731, 0, 0, 1, 1, 1,
1.975749, -1.008673, 4.1415, 1, 0, 0, 1, 1,
2.00078, -0.2326792, 1.03626, 1, 0, 0, 1, 1,
2.015807, 1.116128, 2.184702, 1, 0, 0, 1, 1,
2.081987, -1.531255, 2.945543, 1, 0, 0, 1, 1,
2.109501, 1.035267, 0.7700545, 1, 0, 0, 1, 1,
2.184944, 0.1981129, 1.762061, 0, 0, 0, 1, 1,
2.188195, 1.029999, 1.950335, 0, 0, 0, 1, 1,
2.214512, 1.467087, 0.3396797, 0, 0, 0, 1, 1,
2.21531, -0.2445389, 0.3183321, 0, 0, 0, 1, 1,
2.409587, -0.162573, -0.1421938, 0, 0, 0, 1, 1,
2.439825, 1.474415, 1.267543, 0, 0, 0, 1, 1,
2.459889, -0.3982257, 1.128688, 0, 0, 0, 1, 1,
2.585895, -0.1786516, -0.4239399, 1, 1, 1, 1, 1,
2.647408, 0.2951578, 0.3197626, 1, 1, 1, 1, 1,
2.668585, 0.27558, 2.097255, 1, 1, 1, 1, 1,
2.804859, -2.604595, 2.425583, 1, 1, 1, 1, 1,
2.837042, 0.6977586, 0.9975541, 1, 1, 1, 1, 1,
3.129589, 2.61328, 0.2351193, 1, 1, 1, 1, 1,
3.271841, 0.5972039, 0.3789609, 1, 1, 1, 1, 1
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
var radius = 10.29898;
var distance = 36.17472;
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
mvMatrix.translate( -0.1039214, -0.3014908, 0.1644857 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.17472);
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
