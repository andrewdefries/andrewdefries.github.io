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
-2.695674, -0.6169747, -1.937834, 1, 0, 0, 1,
-2.589686, -0.8091193, -3.356606, 1, 0.007843138, 0, 1,
-2.570737, -2.867185, -1.368494, 1, 0.01176471, 0, 1,
-2.42341, 0.7664688, -3.600757, 1, 0.01960784, 0, 1,
-2.377803, -0.4395803, -0.5821778, 1, 0.02352941, 0, 1,
-2.351706, -1.142468, -1.769042, 1, 0.03137255, 0, 1,
-2.302665, 1.482162, -0.4769083, 1, 0.03529412, 0, 1,
-2.204554, -1.982077, -0.7672885, 1, 0.04313726, 0, 1,
-2.086127, -1.112959, -2.473348, 1, 0.04705882, 0, 1,
-2.056659, -0.5403723, 0.04459449, 1, 0.05490196, 0, 1,
-2.050608, 1.339766, -1.94333, 1, 0.05882353, 0, 1,
-2.039249, 1.053038, -3.232668, 1, 0.06666667, 0, 1,
-2.009283, 0.08124807, -0.5912074, 1, 0.07058824, 0, 1,
-1.989997, -1.397537, -3.580282, 1, 0.07843138, 0, 1,
-1.974441, 1.990762, 1.195178, 1, 0.08235294, 0, 1,
-1.974288, -2.235575, -2.671968, 1, 0.09019608, 0, 1,
-1.972699, -0.1869293, -0.3328195, 1, 0.09411765, 0, 1,
-1.967518, 2.23146, -2.284172, 1, 0.1019608, 0, 1,
-1.901378, -1.260234, -2.293255, 1, 0.1098039, 0, 1,
-1.898221, 2.119022, -0.6022599, 1, 0.1137255, 0, 1,
-1.896643, -0.6493577, -0.6349239, 1, 0.1215686, 0, 1,
-1.864369, -0.1999197, -2.317886, 1, 0.1254902, 0, 1,
-1.845482, 1.743181, 0.1482972, 1, 0.1333333, 0, 1,
-1.84238, -0.6946976, -2.705966, 1, 0.1372549, 0, 1,
-1.814809, -0.7819173, -2.331202, 1, 0.145098, 0, 1,
-1.805945, 0.08196385, -1.855308, 1, 0.1490196, 0, 1,
-1.798185, 2.440694, -0.3194616, 1, 0.1568628, 0, 1,
-1.794446, -0.03124072, -0.7950509, 1, 0.1607843, 0, 1,
-1.788899, 1.143475, -0.1175767, 1, 0.1686275, 0, 1,
-1.773498, 0.9145986, -0.8836216, 1, 0.172549, 0, 1,
-1.762987, 0.9514214, 0.6118565, 1, 0.1803922, 0, 1,
-1.760423, -0.2498193, -2.26836, 1, 0.1843137, 0, 1,
-1.741434, -0.8910968, -2.087747, 1, 0.1921569, 0, 1,
-1.736442, -0.6779377, -2.185801, 1, 0.1960784, 0, 1,
-1.710686, -0.3869411, -2.907414, 1, 0.2039216, 0, 1,
-1.7104, -0.643226, -0.9221649, 1, 0.2117647, 0, 1,
-1.699681, 0.06558561, -2.096745, 1, 0.2156863, 0, 1,
-1.690651, 1.047069, -1.843896, 1, 0.2235294, 0, 1,
-1.6883, 0.6735356, -1.329531, 1, 0.227451, 0, 1,
-1.686618, 1.33737, -1.867351, 1, 0.2352941, 0, 1,
-1.683319, 0.7507095, -1.127203, 1, 0.2392157, 0, 1,
-1.675773, 1.140763, -3.035228, 1, 0.2470588, 0, 1,
-1.674729, -1.068412, -2.220686, 1, 0.2509804, 0, 1,
-1.66978, -0.4216812, -0.8703747, 1, 0.2588235, 0, 1,
-1.665274, 1.610481, -1.534108, 1, 0.2627451, 0, 1,
-1.661232, -0.9066972, -0.7372978, 1, 0.2705882, 0, 1,
-1.657129, 0.1206394, -2.250353, 1, 0.2745098, 0, 1,
-1.654168, 0.8818291, 0.001941318, 1, 0.282353, 0, 1,
-1.651164, 1.385979, 0.2480694, 1, 0.2862745, 0, 1,
-1.64784, -0.79012, -1.777677, 1, 0.2941177, 0, 1,
-1.643752, -0.0181818, -1.281508, 1, 0.3019608, 0, 1,
-1.639523, -1.19089, -2.263296, 1, 0.3058824, 0, 1,
-1.632499, 0.163178, -2.50968, 1, 0.3137255, 0, 1,
-1.630053, -1.207751, -2.064521, 1, 0.3176471, 0, 1,
-1.62298, 0.03394968, -1.284113, 1, 0.3254902, 0, 1,
-1.616546, 0.2830094, -2.654702, 1, 0.3294118, 0, 1,
-1.614076, -1.046789, -1.311558, 1, 0.3372549, 0, 1,
-1.601106, 0.6201614, -0.9676809, 1, 0.3411765, 0, 1,
-1.591204, -0.1950278, -0.1111116, 1, 0.3490196, 0, 1,
-1.580741, 2.217314, -0.3909514, 1, 0.3529412, 0, 1,
-1.574797, 0.9120891, -1.35963, 1, 0.3607843, 0, 1,
-1.567048, -1.065213, -2.161226, 1, 0.3647059, 0, 1,
-1.565652, 0.4275135, -1.205974, 1, 0.372549, 0, 1,
-1.563274, -0.3660068, -1.508384, 1, 0.3764706, 0, 1,
-1.558551, 0.7402517, -1.413988, 1, 0.3843137, 0, 1,
-1.558136, 1.878737, -0.1953629, 1, 0.3882353, 0, 1,
-1.557664, 1.031667, -0.2298662, 1, 0.3960784, 0, 1,
-1.553473, 0.5594444, -0.8042293, 1, 0.4039216, 0, 1,
-1.552462, 0.6411723, -1.153823, 1, 0.4078431, 0, 1,
-1.542358, -0.9612418, -2.485461, 1, 0.4156863, 0, 1,
-1.538985, -1.096279, -1.497516, 1, 0.4196078, 0, 1,
-1.528135, -0.3828794, -0.2281261, 1, 0.427451, 0, 1,
-1.519264, 0.5706935, -1.048149, 1, 0.4313726, 0, 1,
-1.51516, -1.034602, -1.042645, 1, 0.4392157, 0, 1,
-1.513088, -0.3067624, -1.217985, 1, 0.4431373, 0, 1,
-1.511845, -0.2647319, -2.310357, 1, 0.4509804, 0, 1,
-1.505758, -0.3725666, -0.7155391, 1, 0.454902, 0, 1,
-1.503979, -0.449, -3.169601, 1, 0.4627451, 0, 1,
-1.493429, -0.5681463, -1.845512, 1, 0.4666667, 0, 1,
-1.484999, -0.732546, -1.163147, 1, 0.4745098, 0, 1,
-1.475927, -1.860147, -3.344518, 1, 0.4784314, 0, 1,
-1.466104, 0.8002892, 0.4976488, 1, 0.4862745, 0, 1,
-1.462415, 2.021619, -0.5458583, 1, 0.4901961, 0, 1,
-1.457416, -0.1122217, -0.8888069, 1, 0.4980392, 0, 1,
-1.438461, -1.007515, -3.17447, 1, 0.5058824, 0, 1,
-1.432313, -0.7717832, -2.059065, 1, 0.509804, 0, 1,
-1.424285, -0.01566824, -0.4251515, 1, 0.5176471, 0, 1,
-1.42201, -1.045207, -1.325946, 1, 0.5215687, 0, 1,
-1.415811, 1.601799, -0.8138868, 1, 0.5294118, 0, 1,
-1.415442, 0.1121015, -2.762162, 1, 0.5333334, 0, 1,
-1.414006, -0.4703263, -3.120404, 1, 0.5411765, 0, 1,
-1.410779, 0.07814077, -2.967591, 1, 0.5450981, 0, 1,
-1.404345, -1.349235, -3.103277, 1, 0.5529412, 0, 1,
-1.396193, -0.3757032, -1.925081, 1, 0.5568628, 0, 1,
-1.390504, -0.08780864, -3.934683, 1, 0.5647059, 0, 1,
-1.385863, 0.6158968, 0.04393465, 1, 0.5686275, 0, 1,
-1.384135, -1.174762, -0.5040653, 1, 0.5764706, 0, 1,
-1.380278, 1.200597, -0.7895557, 1, 0.5803922, 0, 1,
-1.379838, 0.3514438, -1.064296, 1, 0.5882353, 0, 1,
-1.366603, 0.3341785, -2.786078, 1, 0.5921569, 0, 1,
-1.365727, -0.4386044, -1.414964, 1, 0.6, 0, 1,
-1.356316, -0.5132923, -1.93353, 1, 0.6078432, 0, 1,
-1.333887, -2.076916, -2.112158, 1, 0.6117647, 0, 1,
-1.330614, 1.141145, -1.476633, 1, 0.6196079, 0, 1,
-1.329147, -1.207466, -2.841735, 1, 0.6235294, 0, 1,
-1.318527, -0.2114376, -0.7610196, 1, 0.6313726, 0, 1,
-1.317807, 0.2519115, -1.24493, 1, 0.6352941, 0, 1,
-1.31402, 0.1584649, 0.01101671, 1, 0.6431373, 0, 1,
-1.301395, -0.2180574, -0.7105576, 1, 0.6470588, 0, 1,
-1.291764, -0.6956999, -2.024896, 1, 0.654902, 0, 1,
-1.276567, -0.4638661, -4.124233, 1, 0.6588235, 0, 1,
-1.270326, -0.2616683, -2.148024, 1, 0.6666667, 0, 1,
-1.264318, 1.366776, 0.3822598, 1, 0.6705883, 0, 1,
-1.26152, 1.125376, -1.354819, 1, 0.6784314, 0, 1,
-1.2614, 0.0328881, -2.290538, 1, 0.682353, 0, 1,
-1.258018, 0.6052973, -0.5193605, 1, 0.6901961, 0, 1,
-1.252959, 0.8024913, -2.470654, 1, 0.6941177, 0, 1,
-1.239581, -0.612785, -2.431031, 1, 0.7019608, 0, 1,
-1.239279, 0.2494346, -0.934666, 1, 0.7098039, 0, 1,
-1.230884, -2.622867, -3.189997, 1, 0.7137255, 0, 1,
-1.222363, -0.4741489, -2.22561, 1, 0.7215686, 0, 1,
-1.222272, -1.025024, -2.083621, 1, 0.7254902, 0, 1,
-1.214725, 1.487631, -2.870157, 1, 0.7333333, 0, 1,
-1.214046, -0.1586309, -1.327917, 1, 0.7372549, 0, 1,
-1.211617, 2.013226, 0.3799488, 1, 0.7450981, 0, 1,
-1.207341, 0.2513848, -0.326488, 1, 0.7490196, 0, 1,
-1.189897, 0.07192936, -2.221377, 1, 0.7568628, 0, 1,
-1.177587, 1.541965, 0.1011575, 1, 0.7607843, 0, 1,
-1.170884, 1.386516, -1.249812, 1, 0.7686275, 0, 1,
-1.170504, 0.1515244, -2.972939, 1, 0.772549, 0, 1,
-1.16019, 0.9103106, -0.5267152, 1, 0.7803922, 0, 1,
-1.151627, 0.7092735, -0.08350872, 1, 0.7843137, 0, 1,
-1.151518, 1.386271, -0.3186138, 1, 0.7921569, 0, 1,
-1.142804, -0.6429639, -2.343177, 1, 0.7960784, 0, 1,
-1.132727, 0.7667073, 0.1760325, 1, 0.8039216, 0, 1,
-1.130648, -0.4703598, -1.960899, 1, 0.8117647, 0, 1,
-1.130198, -1.205979, -0.896249, 1, 0.8156863, 0, 1,
-1.126135, -0.1455478, -1.279398, 1, 0.8235294, 0, 1,
-1.120285, -0.1149374, -1.25517, 1, 0.827451, 0, 1,
-1.111528, 0.6291977, -1.520331, 1, 0.8352941, 0, 1,
-1.106135, -0.01676294, -3.080858, 1, 0.8392157, 0, 1,
-1.102329, -0.2880165, -1.294899, 1, 0.8470588, 0, 1,
-1.102304, 0.06240289, -2.095943, 1, 0.8509804, 0, 1,
-1.0914, -0.04202932, -2.382691, 1, 0.8588235, 0, 1,
-1.08652, -0.2639202, -0.3952072, 1, 0.8627451, 0, 1,
-1.084724, -0.9829862, -2.627811, 1, 0.8705882, 0, 1,
-1.081888, -0.2962958, -2.437572, 1, 0.8745098, 0, 1,
-1.078496, -0.1231447, -0.1719733, 1, 0.8823529, 0, 1,
-1.076174, 0.9335089, -1.570503, 1, 0.8862745, 0, 1,
-1.073853, -0.4243754, -2.619229, 1, 0.8941177, 0, 1,
-1.071162, -1.21011, -2.428591, 1, 0.8980392, 0, 1,
-1.069351, -1.12019, -4.337161, 1, 0.9058824, 0, 1,
-1.068241, 1.420999, -0.3963757, 1, 0.9137255, 0, 1,
-1.066886, -1.335173, -3.295997, 1, 0.9176471, 0, 1,
-1.062764, 1.286593, -1.087611, 1, 0.9254902, 0, 1,
-1.062574, -1.485341, -0.233931, 1, 0.9294118, 0, 1,
-1.057765, 0.6217362, -0.3643931, 1, 0.9372549, 0, 1,
-1.056339, 0.02999744, -4.314248, 1, 0.9411765, 0, 1,
-1.056088, -0.1429437, -2.725959, 1, 0.9490196, 0, 1,
-1.046266, 0.3837243, -2.752522, 1, 0.9529412, 0, 1,
-1.045886, -0.2199621, -3.102467, 1, 0.9607843, 0, 1,
-1.043018, -1.106769, -2.968904, 1, 0.9647059, 0, 1,
-1.041616, -0.1907814, -1.754425, 1, 0.972549, 0, 1,
-1.034871, 0.7256456, -2.725654, 1, 0.9764706, 0, 1,
-1.033692, -0.02897632, -0.7272271, 1, 0.9843137, 0, 1,
-1.033517, 2.649732, -1.303742, 1, 0.9882353, 0, 1,
-1.031804, 0.4122097, -1.841578, 1, 0.9960784, 0, 1,
-1.031017, -0.6846916, -1.822083, 0.9960784, 1, 0, 1,
-1.02958, 0.1235947, -1.80937, 0.9921569, 1, 0, 1,
-1.028955, -0.198331, -1.630327, 0.9843137, 1, 0, 1,
-1.026437, -0.5843865, -0.6383052, 0.9803922, 1, 0, 1,
-1.021319, -0.3228313, -2.548934, 0.972549, 1, 0, 1,
-1.007297, -0.6895002, -2.06727, 0.9686275, 1, 0, 1,
-1.006063, -0.6093619, -2.866287, 0.9607843, 1, 0, 1,
-1.004275, -0.5235284, -2.788397, 0.9568627, 1, 0, 1,
-0.9896918, 0.661965, 0.8693692, 0.9490196, 1, 0, 1,
-0.9851395, -0.01736264, -0.2950547, 0.945098, 1, 0, 1,
-0.983794, 0.4516888, -2.346524, 0.9372549, 1, 0, 1,
-0.9834629, -2.339365, -1.163003, 0.9333333, 1, 0, 1,
-0.9832867, -0.6834625, 0.5945182, 0.9254902, 1, 0, 1,
-0.9792888, 0.1404222, -0.5586426, 0.9215686, 1, 0, 1,
-0.9772835, -0.7709349, -1.88576, 0.9137255, 1, 0, 1,
-0.9770885, 0.1603757, -3.168837, 0.9098039, 1, 0, 1,
-0.9756649, -0.9528652, -1.948491, 0.9019608, 1, 0, 1,
-0.9708604, 1.793501, -0.4857548, 0.8941177, 1, 0, 1,
-0.961728, 0.2724411, -1.456769, 0.8901961, 1, 0, 1,
-0.9598523, 0.6648534, -1.891494, 0.8823529, 1, 0, 1,
-0.9585914, -0.5391004, -3.78899, 0.8784314, 1, 0, 1,
-0.9538241, 1.147986, -0.9043939, 0.8705882, 1, 0, 1,
-0.9504808, -1.415519, -2.511724, 0.8666667, 1, 0, 1,
-0.9332117, -1.025543, -0.7572222, 0.8588235, 1, 0, 1,
-0.9327389, 1.325928, -1.782465, 0.854902, 1, 0, 1,
-0.9286354, -1.499441, -1.530613, 0.8470588, 1, 0, 1,
-0.919554, -1.178684, -1.969524, 0.8431373, 1, 0, 1,
-0.9167625, -0.322697, -0.646014, 0.8352941, 1, 0, 1,
-0.9144905, 0.6960364, -0.4204393, 0.8313726, 1, 0, 1,
-0.9005221, -0.2090309, -1.736876, 0.8235294, 1, 0, 1,
-0.8998173, -0.6073201, -1.096702, 0.8196079, 1, 0, 1,
-0.8989356, -0.7381901, -1.909, 0.8117647, 1, 0, 1,
-0.8977049, -2.646778, -2.788942, 0.8078431, 1, 0, 1,
-0.886106, -0.08845672, -1.03718, 0.8, 1, 0, 1,
-0.8846173, -0.8252907, -2.11806, 0.7921569, 1, 0, 1,
-0.8835757, 0.8615263, -1.004984, 0.7882353, 1, 0, 1,
-0.8797725, -0.5064656, -1.897917, 0.7803922, 1, 0, 1,
-0.8792577, -0.6472994, -2.030122, 0.7764706, 1, 0, 1,
-0.876451, -0.6844963, -1.347263, 0.7686275, 1, 0, 1,
-0.8652171, 0.1786885, -2.622039, 0.7647059, 1, 0, 1,
-0.8638555, 1.158221, -0.5324963, 0.7568628, 1, 0, 1,
-0.8627028, -1.271098, -4.144387, 0.7529412, 1, 0, 1,
-0.8589204, -0.05742897, -2.337311, 0.7450981, 1, 0, 1,
-0.8547471, -0.8216608, -0.5369529, 0.7411765, 1, 0, 1,
-0.8485043, 1.153976, 1.342288, 0.7333333, 1, 0, 1,
-0.8478708, -0.9881513, -2.155077, 0.7294118, 1, 0, 1,
-0.8441499, -2.000575, -2.895929, 0.7215686, 1, 0, 1,
-0.8398445, 1.318013, -0.1913528, 0.7176471, 1, 0, 1,
-0.8394622, -0.6639495, -1.613138, 0.7098039, 1, 0, 1,
-0.8384099, -0.09354136, -2.340453, 0.7058824, 1, 0, 1,
-0.8374205, -1.095822, -1.323311, 0.6980392, 1, 0, 1,
-0.8349467, 1.113207, -0.6326713, 0.6901961, 1, 0, 1,
-0.8338246, -0.3889483, -2.492487, 0.6862745, 1, 0, 1,
-0.8337451, -0.08523316, -1.949375, 0.6784314, 1, 0, 1,
-0.8283634, -0.9905131, -2.499449, 0.6745098, 1, 0, 1,
-0.828008, -0.3690943, -2.841555, 0.6666667, 1, 0, 1,
-0.8099805, -0.3693555, -1.027086, 0.6627451, 1, 0, 1,
-0.8017592, -2.90693, -2.432115, 0.654902, 1, 0, 1,
-0.799616, -0.2584354, -1.081262, 0.6509804, 1, 0, 1,
-0.7981186, -1.060107, -1.297278, 0.6431373, 1, 0, 1,
-0.7959951, 0.08819383, -0.8121592, 0.6392157, 1, 0, 1,
-0.7751933, 0.1454474, -2.697905, 0.6313726, 1, 0, 1,
-0.7731919, 0.5907802, -0.82791, 0.627451, 1, 0, 1,
-0.7723525, 0.07137555, -0.7482347, 0.6196079, 1, 0, 1,
-0.7710713, 0.2051878, -2.287237, 0.6156863, 1, 0, 1,
-0.766354, 1.856624, -0.04450363, 0.6078432, 1, 0, 1,
-0.7646798, 1.699446, 0.9052832, 0.6039216, 1, 0, 1,
-0.7554582, -0.6674335, -1.64433, 0.5960785, 1, 0, 1,
-0.7545074, -0.2439835, -2.554915, 0.5882353, 1, 0, 1,
-0.7539362, -0.2464809, -2.104928, 0.5843138, 1, 0, 1,
-0.7482533, 0.7334999, -2.411876, 0.5764706, 1, 0, 1,
-0.7482154, 0.4861969, -1.196159, 0.572549, 1, 0, 1,
-0.7432882, -2.126814, -4.077954, 0.5647059, 1, 0, 1,
-0.7403045, 0.1292708, -1.564537, 0.5607843, 1, 0, 1,
-0.7369389, -0.1919739, -1.539847, 0.5529412, 1, 0, 1,
-0.7356168, 0.5101653, -2.357601, 0.5490196, 1, 0, 1,
-0.7292483, 1.54262, -0.5479322, 0.5411765, 1, 0, 1,
-0.727763, 0.4324637, -0.6743808, 0.5372549, 1, 0, 1,
-0.7178854, 0.534165, -1.511538, 0.5294118, 1, 0, 1,
-0.7113287, 0.9135201, 0.7943395, 0.5254902, 1, 0, 1,
-0.7107224, 0.1980271, -3.381603, 0.5176471, 1, 0, 1,
-0.7071831, -0.7340799, -2.183357, 0.5137255, 1, 0, 1,
-0.6984069, 0.5823217, -0.3073736, 0.5058824, 1, 0, 1,
-0.6963875, 2.567434, -1.394269, 0.5019608, 1, 0, 1,
-0.6890223, -0.5274919, -2.570954, 0.4941176, 1, 0, 1,
-0.6884333, 0.4879144, -0.4088779, 0.4862745, 1, 0, 1,
-0.6804677, 1.099335, -1.75249, 0.4823529, 1, 0, 1,
-0.6804544, -0.2544589, -0.7611498, 0.4745098, 1, 0, 1,
-0.6763209, -0.9208365, -1.676944, 0.4705882, 1, 0, 1,
-0.6754193, -0.2586595, -0.9945655, 0.4627451, 1, 0, 1,
-0.671534, -0.04865461, -2.451495, 0.4588235, 1, 0, 1,
-0.6677921, 0.05551486, -3.312238, 0.4509804, 1, 0, 1,
-0.6674373, 0.5569633, -1.124165, 0.4470588, 1, 0, 1,
-0.6642573, 1.775155, -0.7171779, 0.4392157, 1, 0, 1,
-0.6638068, 0.7757933, -0.4223329, 0.4352941, 1, 0, 1,
-0.656656, -0.1431554, -0.9445058, 0.427451, 1, 0, 1,
-0.6524356, 0.2282865, -1.904237, 0.4235294, 1, 0, 1,
-0.644457, -0.6319275, -1.192054, 0.4156863, 1, 0, 1,
-0.6429501, -1.958709, -3.28291, 0.4117647, 1, 0, 1,
-0.6391611, 0.0653988, -0.2888426, 0.4039216, 1, 0, 1,
-0.6388642, -0.8604205, -1.762437, 0.3960784, 1, 0, 1,
-0.6355841, -0.938875, -0.6759049, 0.3921569, 1, 0, 1,
-0.6338547, -0.7630339, -1.995215, 0.3843137, 1, 0, 1,
-0.6295059, -0.02596444, -2.023031, 0.3803922, 1, 0, 1,
-0.6278714, -0.3301127, -1.91017, 0.372549, 1, 0, 1,
-0.6196719, 0.5243992, 0.07760262, 0.3686275, 1, 0, 1,
-0.6194166, -0.9437531, -2.23858, 0.3607843, 1, 0, 1,
-0.611208, -1.905403, -2.222233, 0.3568628, 1, 0, 1,
-0.608344, -0.4089701, -1.191267, 0.3490196, 1, 0, 1,
-0.602478, 0.140232, -1.005263, 0.345098, 1, 0, 1,
-0.6009446, 0.06414288, -0.3808972, 0.3372549, 1, 0, 1,
-0.5977178, -0.6257614, -2.721475, 0.3333333, 1, 0, 1,
-0.5958133, -0.8489835, -3.234979, 0.3254902, 1, 0, 1,
-0.5954558, 1.861752, -0.9714844, 0.3215686, 1, 0, 1,
-0.5942528, 0.1793435, -1.352795, 0.3137255, 1, 0, 1,
-0.5895039, 0.7237928, -0.432828, 0.3098039, 1, 0, 1,
-0.5872253, -1.390782, -2.563058, 0.3019608, 1, 0, 1,
-0.5766314, 2.128922, -0.2316782, 0.2941177, 1, 0, 1,
-0.5745734, 0.8639948, 2.409981, 0.2901961, 1, 0, 1,
-0.5721493, 0.1272688, -0.7584664, 0.282353, 1, 0, 1,
-0.5720994, 1.160823, -1.532549, 0.2784314, 1, 0, 1,
-0.5664918, -0.9873584, -1.904364, 0.2705882, 1, 0, 1,
-0.566195, -0.7083675, -0.3802223, 0.2666667, 1, 0, 1,
-0.5660335, -0.2695462, -2.898936, 0.2588235, 1, 0, 1,
-0.5654864, -0.6565461, -4.101733, 0.254902, 1, 0, 1,
-0.5629625, -0.6762004, -4.142925, 0.2470588, 1, 0, 1,
-0.5581182, -0.6045395, -2.197885, 0.2431373, 1, 0, 1,
-0.5564107, -1.317293, -3.421102, 0.2352941, 1, 0, 1,
-0.5546423, -1.191917, -4.202746, 0.2313726, 1, 0, 1,
-0.5538658, 1.12051, 0.2295105, 0.2235294, 1, 0, 1,
-0.5525648, -0.3692894, -1.087018, 0.2196078, 1, 0, 1,
-0.5481886, -1.154022, -0.6716282, 0.2117647, 1, 0, 1,
-0.5453519, 0.6071784, -0.4917321, 0.2078431, 1, 0, 1,
-0.5430736, -0.6166821, -2.182786, 0.2, 1, 0, 1,
-0.5427407, 1.210056, -1.186031, 0.1921569, 1, 0, 1,
-0.5365112, -1.06579, 0.5497412, 0.1882353, 1, 0, 1,
-0.5341803, -1.08932, -1.944526, 0.1803922, 1, 0, 1,
-0.5329408, -1.703143, -3.416776, 0.1764706, 1, 0, 1,
-0.5270298, -1.057178, -2.638517, 0.1686275, 1, 0, 1,
-0.5254285, 0.7205545, 1.73913, 0.1647059, 1, 0, 1,
-0.5252947, -1.429362, -1.904696, 0.1568628, 1, 0, 1,
-0.5166805, 0.03659666, -0.4415489, 0.1529412, 1, 0, 1,
-0.515613, 0.341323, -1.111495, 0.145098, 1, 0, 1,
-0.513495, -0.4726687, -1.334782, 0.1411765, 1, 0, 1,
-0.5084291, -2.181114, -4.119283, 0.1333333, 1, 0, 1,
-0.5074587, -1.056228, -2.473421, 0.1294118, 1, 0, 1,
-0.5061905, 0.1046933, -0.8879718, 0.1215686, 1, 0, 1,
-0.5061867, -2.070856, -1.712326, 0.1176471, 1, 0, 1,
-0.5051187, -1.590427, -2.612895, 0.1098039, 1, 0, 1,
-0.5033919, 1.096196, -0.4975217, 0.1058824, 1, 0, 1,
-0.5031575, 0.3245533, -1.665201, 0.09803922, 1, 0, 1,
-0.5013578, -2.129295, -2.746622, 0.09019608, 1, 0, 1,
-0.5010359, 0.6451852, 0.4400743, 0.08627451, 1, 0, 1,
-0.4890158, 0.06288689, -1.516642, 0.07843138, 1, 0, 1,
-0.4776102, -0.2738849, -1.269388, 0.07450981, 1, 0, 1,
-0.4775183, 1.986943, 0.8837432, 0.06666667, 1, 0, 1,
-0.4746724, -0.0556697, -1.885206, 0.0627451, 1, 0, 1,
-0.4743729, -2.873848, -2.367848, 0.05490196, 1, 0, 1,
-0.473313, 0.5008073, -0.1457559, 0.05098039, 1, 0, 1,
-0.4731963, -0.3314686, -2.951736, 0.04313726, 1, 0, 1,
-0.466461, -0.4692689, -3.75487, 0.03921569, 1, 0, 1,
-0.4634488, -0.5480443, -2.022035, 0.03137255, 1, 0, 1,
-0.4557832, 1.10697, 0.3880475, 0.02745098, 1, 0, 1,
-0.4541711, 1.44759, -0.1639883, 0.01960784, 1, 0, 1,
-0.4492759, -0.4767673, -2.108769, 0.01568628, 1, 0, 1,
-0.4404976, -0.1492383, -1.945299, 0.007843138, 1, 0, 1,
-0.4381368, 0.7128239, -0.1989362, 0.003921569, 1, 0, 1,
-0.4359224, 1.774522, 0.5789538, 0, 1, 0.003921569, 1,
-0.4356817, 1.187404, 1.306268, 0, 1, 0.01176471, 1,
-0.4324541, 0.1249259, -1.612075, 0, 1, 0.01568628, 1,
-0.4282372, -1.0987, -4.247453, 0, 1, 0.02352941, 1,
-0.427759, 0.1764746, -1.824555, 0, 1, 0.02745098, 1,
-0.4267806, -1.245484, -2.984105, 0, 1, 0.03529412, 1,
-0.4259299, -0.720266, -2.589624, 0, 1, 0.03921569, 1,
-0.4243264, -0.5696296, -1.48489, 0, 1, 0.04705882, 1,
-0.4236191, 1.49455, -2.177382, 0, 1, 0.05098039, 1,
-0.4234496, 1.300385, 0.1029284, 0, 1, 0.05882353, 1,
-0.4226234, -0.09279352, -1.239049, 0, 1, 0.0627451, 1,
-0.4200402, -1.44422, -2.120449, 0, 1, 0.07058824, 1,
-0.4193254, -0.7486598, -2.312995, 0, 1, 0.07450981, 1,
-0.4191569, -1.069616, -2.968714, 0, 1, 0.08235294, 1,
-0.417172, 0.9830784, -1.16003, 0, 1, 0.08627451, 1,
-0.413428, -1.33915, -0.4800651, 0, 1, 0.09411765, 1,
-0.4133607, 0.3345894, -1.175017, 0, 1, 0.1019608, 1,
-0.4107698, -1.425152, -3.23659, 0, 1, 0.1058824, 1,
-0.4102366, 0.4331093, 0.8697698, 0, 1, 0.1137255, 1,
-0.399177, -2.227412, -2.892677, 0, 1, 0.1176471, 1,
-0.3928094, -0.1622652, -3.07508, 0, 1, 0.1254902, 1,
-0.3905648, -0.07529774, -2.215118, 0, 1, 0.1294118, 1,
-0.3816536, 0.00260229, 0.880161, 0, 1, 0.1372549, 1,
-0.3774557, 0.9439929, 0.5241491, 0, 1, 0.1411765, 1,
-0.3752159, 1.003091, -0.6111761, 0, 1, 0.1490196, 1,
-0.3705122, -0.006210124, -2.035309, 0, 1, 0.1529412, 1,
-0.3673265, -0.02126458, -3.536062, 0, 1, 0.1607843, 1,
-0.3646744, -0.05864673, -2.543253, 0, 1, 0.1647059, 1,
-0.3599397, -0.3837209, -2.927296, 0, 1, 0.172549, 1,
-0.3583316, -0.2050441, -3.433779, 0, 1, 0.1764706, 1,
-0.3561302, -0.838827, -2.3603, 0, 1, 0.1843137, 1,
-0.3550124, -1.078984, -1.950474, 0, 1, 0.1882353, 1,
-0.3535236, -0.5503599, -0.8861901, 0, 1, 0.1960784, 1,
-0.3532537, -0.08572675, -2.021714, 0, 1, 0.2039216, 1,
-0.3503189, -0.218039, -2.839032, 0, 1, 0.2078431, 1,
-0.3497579, 1.642672, 1.493427, 0, 1, 0.2156863, 1,
-0.3493362, 0.9217892, -1.024219, 0, 1, 0.2196078, 1,
-0.3490424, -0.4124112, -4.817568, 0, 1, 0.227451, 1,
-0.3479612, -0.7401072, -1.491141, 0, 1, 0.2313726, 1,
-0.3478872, -0.2172496, -1.607568, 0, 1, 0.2392157, 1,
-0.3425495, -1.672653, -2.698673, 0, 1, 0.2431373, 1,
-0.339338, 0.4669864, 0.2573758, 0, 1, 0.2509804, 1,
-0.3370923, -0.4632802, -2.725827, 0, 1, 0.254902, 1,
-0.3360364, 0.03310428, -3.143325, 0, 1, 0.2627451, 1,
-0.3320285, -0.3348728, -1.340954, 0, 1, 0.2666667, 1,
-0.3298353, 0.9673303, 1.472283, 0, 1, 0.2745098, 1,
-0.3289337, -0.6258465, -2.325197, 0, 1, 0.2784314, 1,
-0.327408, 0.5604502, -1.752684, 0, 1, 0.2862745, 1,
-0.3231403, -1.291591, -1.57205, 0, 1, 0.2901961, 1,
-0.3219914, -0.6093903, -3.186189, 0, 1, 0.2980392, 1,
-0.3102943, 1.048741, -0.3773092, 0, 1, 0.3058824, 1,
-0.2985329, 0.1957232, 0.3824896, 0, 1, 0.3098039, 1,
-0.2964495, 1.146637, 0.5684494, 0, 1, 0.3176471, 1,
-0.2957764, -1.152075, -4.585828, 0, 1, 0.3215686, 1,
-0.2944067, -0.8117547, -5.069544, 0, 1, 0.3294118, 1,
-0.2922451, 0.9164136, -1.54937, 0, 1, 0.3333333, 1,
-0.2892486, 0.1864357, -2.175716, 0, 1, 0.3411765, 1,
-0.2847223, -0.8528993, -2.119619, 0, 1, 0.345098, 1,
-0.2835381, 0.9989344, -1.138628, 0, 1, 0.3529412, 1,
-0.2781378, -0.4870468, -2.641833, 0, 1, 0.3568628, 1,
-0.270541, 0.8771302, 0.7577512, 0, 1, 0.3647059, 1,
-0.2674933, -2.61928, -2.867552, 0, 1, 0.3686275, 1,
-0.2664414, 0.2726547, -0.3002632, 0, 1, 0.3764706, 1,
-0.2642081, 0.8046292, 0.0338167, 0, 1, 0.3803922, 1,
-0.2595617, -1.194434, -4.16398, 0, 1, 0.3882353, 1,
-0.2591198, -0.3062103, -2.630458, 0, 1, 0.3921569, 1,
-0.2574229, -0.3785535, -1.540026, 0, 1, 0.4, 1,
-0.2519426, 0.456422, -2.151257, 0, 1, 0.4078431, 1,
-0.2432014, -0.8849714, -2.670192, 0, 1, 0.4117647, 1,
-0.2427674, 0.2922809, -0.9531916, 0, 1, 0.4196078, 1,
-0.2414412, -0.1882558, -1.791185, 0, 1, 0.4235294, 1,
-0.2393989, -0.6250354, -5.069111, 0, 1, 0.4313726, 1,
-0.2374402, 0.5464835, -0.700008, 0, 1, 0.4352941, 1,
-0.2358613, -0.6739543, -2.236417, 0, 1, 0.4431373, 1,
-0.2356994, 0.2597548, -0.6518135, 0, 1, 0.4470588, 1,
-0.2317061, 1.810673, -1.035476, 0, 1, 0.454902, 1,
-0.2288474, -1.087946, -2.634789, 0, 1, 0.4588235, 1,
-0.22862, -1.33927, -2.815527, 0, 1, 0.4666667, 1,
-0.2284914, 2.05684, 0.2216604, 0, 1, 0.4705882, 1,
-0.226935, 0.06947868, -1.393751, 0, 1, 0.4784314, 1,
-0.2231554, -0.3895351, -3.377755, 0, 1, 0.4823529, 1,
-0.2216788, -1.872536, -4.290608, 0, 1, 0.4901961, 1,
-0.214208, 0.05406236, -1.249426, 0, 1, 0.4941176, 1,
-0.2120719, -1.794476, -3.340156, 0, 1, 0.5019608, 1,
-0.2101848, -1.341066, -3.39852, 0, 1, 0.509804, 1,
-0.2083733, 0.5731099, -2.632088, 0, 1, 0.5137255, 1,
-0.2067741, 0.3120905, -2.370491, 0, 1, 0.5215687, 1,
-0.2051525, 0.9527562, 0.1875796, 0, 1, 0.5254902, 1,
-0.2022974, 0.8894545, -1.963032, 0, 1, 0.5333334, 1,
-0.2020757, -0.2866859, -2.651816, 0, 1, 0.5372549, 1,
-0.1977047, -1.374234, -0.9219487, 0, 1, 0.5450981, 1,
-0.1944692, -0.2233658, -2.241785, 0, 1, 0.5490196, 1,
-0.1934539, 1.975535, 0.6707217, 0, 1, 0.5568628, 1,
-0.1919317, -2.689849, -4.240522, 0, 1, 0.5607843, 1,
-0.1894551, -1.772374, -2.261374, 0, 1, 0.5686275, 1,
-0.1873085, 1.17254, -1.165685, 0, 1, 0.572549, 1,
-0.1865991, -1.089134, -4.215112, 0, 1, 0.5803922, 1,
-0.1844413, -0.6783796, -4.034646, 0, 1, 0.5843138, 1,
-0.1840616, -0.2767208, -1.603016, 0, 1, 0.5921569, 1,
-0.1787517, 0.01000695, -1.056006, 0, 1, 0.5960785, 1,
-0.1772849, 1.316696, 0.5220193, 0, 1, 0.6039216, 1,
-0.1757813, 1.4856, -0.4808403, 0, 1, 0.6117647, 1,
-0.1722839, 0.03086697, -2.005831, 0, 1, 0.6156863, 1,
-0.1701077, -0.4231308, -4.072275, 0, 1, 0.6235294, 1,
-0.1680151, -0.07055971, -2.255689, 0, 1, 0.627451, 1,
-0.1603499, 0.3007566, -1.185493, 0, 1, 0.6352941, 1,
-0.1594671, 1.17126, 0.8833683, 0, 1, 0.6392157, 1,
-0.1538478, 1.041187, 0.007583674, 0, 1, 0.6470588, 1,
-0.1528934, -0.1919456, -1.366092, 0, 1, 0.6509804, 1,
-0.1502799, 0.5411278, -0.8959802, 0, 1, 0.6588235, 1,
-0.1491928, -0.4879946, -2.348293, 0, 1, 0.6627451, 1,
-0.1451581, -0.7233969, -2.437876, 0, 1, 0.6705883, 1,
-0.1410899, 0.2969707, -2.198672, 0, 1, 0.6745098, 1,
-0.1405723, -0.4260629, -0.4864079, 0, 1, 0.682353, 1,
-0.1328352, 0.1784544, -0.724787, 0, 1, 0.6862745, 1,
-0.1306604, 0.02708455, -0.4363298, 0, 1, 0.6941177, 1,
-0.1258364, 0.6465897, 1.205537, 0, 1, 0.7019608, 1,
-0.1256139, 1.036851, -0.6990813, 0, 1, 0.7058824, 1,
-0.123968, 0.859107, 2.264588, 0, 1, 0.7137255, 1,
-0.1232945, -0.2068136, -3.961269, 0, 1, 0.7176471, 1,
-0.1175745, -1.173368, -4.293402, 0, 1, 0.7254902, 1,
-0.1142792, -1.326084, -2.562129, 0, 1, 0.7294118, 1,
-0.1126897, -1.573564, -2.37699, 0, 1, 0.7372549, 1,
-0.1120043, 1.539669, -0.1407087, 0, 1, 0.7411765, 1,
-0.1107198, 2.101796, 1.198866, 0, 1, 0.7490196, 1,
-0.1094949, -0.7310728, -4.613877, 0, 1, 0.7529412, 1,
-0.1074871, 0.120029, -2.531251, 0, 1, 0.7607843, 1,
-0.1065094, 0.6312384, 0.09055819, 0, 1, 0.7647059, 1,
-0.1054933, -0.4986173, -2.978468, 0, 1, 0.772549, 1,
-0.09985953, 2.05821, -1.687101, 0, 1, 0.7764706, 1,
-0.09890763, 0.8482286, 1.742847, 0, 1, 0.7843137, 1,
-0.09140501, -0.5185496, -3.583675, 0, 1, 0.7882353, 1,
-0.08880641, -0.3941591, -4.0611, 0, 1, 0.7960784, 1,
-0.08825768, 0.8529295, -0.9831427, 0, 1, 0.8039216, 1,
-0.08658863, 1.648295, 0.3802806, 0, 1, 0.8078431, 1,
-0.08631174, -0.4190592, -2.617397, 0, 1, 0.8156863, 1,
-0.08294968, -0.9925426, -3.946253, 0, 1, 0.8196079, 1,
-0.08137789, 0.2131386, -1.054267, 0, 1, 0.827451, 1,
-0.07934742, 0.8952953, -1.346248, 0, 1, 0.8313726, 1,
-0.07676561, -0.7083518, -1.404202, 0, 1, 0.8392157, 1,
-0.07427046, -0.5844445, -3.417908, 0, 1, 0.8431373, 1,
-0.07109337, -0.08004851, -1.405269, 0, 1, 0.8509804, 1,
-0.06912665, 0.1073822, 8.688008e-05, 0, 1, 0.854902, 1,
-0.06664634, -0.05806091, -2.581877, 0, 1, 0.8627451, 1,
-0.06657225, 0.30355, -0.5274152, 0, 1, 0.8666667, 1,
-0.06443951, 1.557619, 0.473868, 0, 1, 0.8745098, 1,
-0.0636339, 0.8433967, -2.367697, 0, 1, 0.8784314, 1,
-0.06080608, -0.7138821, -3.054702, 0, 1, 0.8862745, 1,
-0.05892321, 0.6048948, -0.5886428, 0, 1, 0.8901961, 1,
-0.05779504, 0.8403935, -2.23481, 0, 1, 0.8980392, 1,
-0.0572058, 0.458626, -0.3540629, 0, 1, 0.9058824, 1,
-0.05696066, 0.5329101, -0.238379, 0, 1, 0.9098039, 1,
-0.056741, 0.8978466, 0.7182817, 0, 1, 0.9176471, 1,
-0.05412756, -0.4304795, -3.158527, 0, 1, 0.9215686, 1,
-0.04542846, 0.08503069, 0.6531522, 0, 1, 0.9294118, 1,
-0.04488795, 0.2265091, -0.4182349, 0, 1, 0.9333333, 1,
-0.03593744, 1.20202, 1.629028, 0, 1, 0.9411765, 1,
-0.03561317, -0.4368788, -5.34052, 0, 1, 0.945098, 1,
-0.03184157, 1.362731, 1.634582, 0, 1, 0.9529412, 1,
-0.02720666, 0.8228258, 0.7149774, 0, 1, 0.9568627, 1,
-0.02663184, -0.3096029, -4.063271, 0, 1, 0.9647059, 1,
-0.02633399, -0.6008822, -1.799464, 0, 1, 0.9686275, 1,
-0.02238196, 0.4801168, -1.303149, 0, 1, 0.9764706, 1,
-0.02162098, -0.5444927, -3.578918, 0, 1, 0.9803922, 1,
-0.02090471, 0.9102045, -0.4205975, 0, 1, 0.9882353, 1,
-0.01756878, -2.035105, -3.143723, 0, 1, 0.9921569, 1,
-0.0174273, 0.6250941, -1.00162, 0, 1, 1, 1,
-0.01406709, -0.08113693, -3.76023, 0, 0.9921569, 1, 1,
-0.007166914, -0.9576104, -3.054485, 0, 0.9882353, 1, 1,
-0.003661362, 1.891926, 0.1169503, 0, 0.9803922, 1, 1,
0.0001172116, 0.5908238, 0.2643175, 0, 0.9764706, 1, 1,
0.0011161, 1.951054, -0.05868121, 0, 0.9686275, 1, 1,
0.002863102, 1.057608, 0.6936643, 0, 0.9647059, 1, 1,
0.00748431, 2.112218, -0.1318657, 0, 0.9568627, 1, 1,
0.009086584, -0.9081996, 4.145139, 0, 0.9529412, 1, 1,
0.01123339, -0.4722837, 3.332148, 0, 0.945098, 1, 1,
0.01154796, 0.3010645, 0.467546, 0, 0.9411765, 1, 1,
0.02065939, 0.0565028, 1.124437, 0, 0.9333333, 1, 1,
0.02201882, 0.7284014, 0.2569256, 0, 0.9294118, 1, 1,
0.02371773, -0.3719461, 3.208728, 0, 0.9215686, 1, 1,
0.02559579, 0.3460791, 0.05962889, 0, 0.9176471, 1, 1,
0.02973231, -1.253548, 1.500737, 0, 0.9098039, 1, 1,
0.03122106, 3.396462, 0.1501297, 0, 0.9058824, 1, 1,
0.03216887, -0.1409443, 4.623147, 0, 0.8980392, 1, 1,
0.03292081, -0.1114711, 3.599595, 0, 0.8901961, 1, 1,
0.03332454, 0.6008469, -0.1741, 0, 0.8862745, 1, 1,
0.03682358, 0.2264239, 2.607589, 0, 0.8784314, 1, 1,
0.03693227, 0.2779433, -0.6490446, 0, 0.8745098, 1, 1,
0.03765348, 1.834367, 0.1417589, 0, 0.8666667, 1, 1,
0.04004015, 1.169171, 1.70171, 0, 0.8627451, 1, 1,
0.04523497, -0.1925969, 3.514202, 0, 0.854902, 1, 1,
0.04642424, 1.192838, -0.9746402, 0, 0.8509804, 1, 1,
0.0477845, 0.3473418, -1.467758, 0, 0.8431373, 1, 1,
0.05175951, 0.6479992, 0.7286822, 0, 0.8392157, 1, 1,
0.05245735, 0.9235486, 0.2339336, 0, 0.8313726, 1, 1,
0.05440569, -1.107588, 4.094417, 0, 0.827451, 1, 1,
0.05612103, -0.9129896, 3.105893, 0, 0.8196079, 1, 1,
0.05970367, -0.253461, 2.948128, 0, 0.8156863, 1, 1,
0.07148256, 0.04876586, 1.02556, 0, 0.8078431, 1, 1,
0.07544218, 0.6829069, 1.428485, 0, 0.8039216, 1, 1,
0.07598216, -0.7407711, 1.273892, 0, 0.7960784, 1, 1,
0.0780818, 0.330298, 1.181809, 0, 0.7882353, 1, 1,
0.08353283, 1.665006, -0.7983441, 0, 0.7843137, 1, 1,
0.08798625, -0.8364649, 5.043517, 0, 0.7764706, 1, 1,
0.08841255, -0.6347014, 4.973629, 0, 0.772549, 1, 1,
0.09177887, -0.6460041, 5.078981, 0, 0.7647059, 1, 1,
0.09180407, -0.6328862, 4.214948, 0, 0.7607843, 1, 1,
0.09348709, -0.5491805, 0.7817245, 0, 0.7529412, 1, 1,
0.0983351, -0.08235595, 2.715465, 0, 0.7490196, 1, 1,
0.1027348, -2.009003, 2.849323, 0, 0.7411765, 1, 1,
0.1054932, -0.7006932, 3.211285, 0, 0.7372549, 1, 1,
0.1072613, -0.2447322, 3.691133, 0, 0.7294118, 1, 1,
0.1077661, 0.744003, 1.890831, 0, 0.7254902, 1, 1,
0.1150671, -0.01905547, 1.301108, 0, 0.7176471, 1, 1,
0.1172988, -1.037808, 3.060287, 0, 0.7137255, 1, 1,
0.1180124, 0.2305091, 0.1909573, 0, 0.7058824, 1, 1,
0.1192519, 2.182035, -1.160797, 0, 0.6980392, 1, 1,
0.1275227, 0.8920604, 0.4649204, 0, 0.6941177, 1, 1,
0.1292815, -1.656683, 5.168928, 0, 0.6862745, 1, 1,
0.1310365, -0.2584205, 0.4020867, 0, 0.682353, 1, 1,
0.1315824, 1.759752, 0.7954947, 0, 0.6745098, 1, 1,
0.1329709, -0.1652962, 3.228864, 0, 0.6705883, 1, 1,
0.1355299, 0.2057061, 0.872683, 0, 0.6627451, 1, 1,
0.1360883, 0.6379297, 1.097434, 0, 0.6588235, 1, 1,
0.1400682, 1.949103, 0.7610993, 0, 0.6509804, 1, 1,
0.1488267, -0.4216101, 2.439127, 0, 0.6470588, 1, 1,
0.1493889, 0.5947155, -0.7033979, 0, 0.6392157, 1, 1,
0.1508187, 0.1199711, 0.6790555, 0, 0.6352941, 1, 1,
0.1528645, 1.0185, -0.4019496, 0, 0.627451, 1, 1,
0.1538303, -0.2063517, 3.730947, 0, 0.6235294, 1, 1,
0.1546421, 0.9170516, 0.6773497, 0, 0.6156863, 1, 1,
0.1601551, 1.25661, 0.6853316, 0, 0.6117647, 1, 1,
0.1627643, -0.98414, 4.107072, 0, 0.6039216, 1, 1,
0.1643505, 0.2552271, -0.1758468, 0, 0.5960785, 1, 1,
0.1662034, 0.7965359, 1.355726, 0, 0.5921569, 1, 1,
0.1662902, -0.9180691, 3.011674, 0, 0.5843138, 1, 1,
0.1665158, 0.09284345, 0.7129624, 0, 0.5803922, 1, 1,
0.1673946, -1.876992, 3.910703, 0, 0.572549, 1, 1,
0.1676001, 1.955028, 0.1802698, 0, 0.5686275, 1, 1,
0.1747839, -0.8429885, 1.763624, 0, 0.5607843, 1, 1,
0.1758265, 0.3026229, 2.44047, 0, 0.5568628, 1, 1,
0.1766398, 0.2610388, 0.90668, 0, 0.5490196, 1, 1,
0.1776223, 0.713567, -0.4839219, 0, 0.5450981, 1, 1,
0.1782736, 0.8394214, -1.197498, 0, 0.5372549, 1, 1,
0.1817743, 2.049328, -1.401243, 0, 0.5333334, 1, 1,
0.1822705, -1.076211, 3.652995, 0, 0.5254902, 1, 1,
0.1828037, 1.424508, -0.637515, 0, 0.5215687, 1, 1,
0.1829284, -1.0287, 1.875077, 0, 0.5137255, 1, 1,
0.1847096, 1.144879, -0.5778242, 0, 0.509804, 1, 1,
0.1857632, 0.9010755, -0.9931377, 0, 0.5019608, 1, 1,
0.1887024, 0.381584, 1.837933, 0, 0.4941176, 1, 1,
0.1893457, -0.2822201, 2.680641, 0, 0.4901961, 1, 1,
0.1911192, 1.602743, 0.9373603, 0, 0.4823529, 1, 1,
0.1915249, 2.208731, 0.4223042, 0, 0.4784314, 1, 1,
0.2034703, 1.64096, -0.7876489, 0, 0.4705882, 1, 1,
0.2052686, 0.9029402, -0.1506132, 0, 0.4666667, 1, 1,
0.2057088, -0.1682804, 1.559517, 0, 0.4588235, 1, 1,
0.2090033, 0.8574367, 0.4644283, 0, 0.454902, 1, 1,
0.2105117, 1.717453, 0.6065015, 0, 0.4470588, 1, 1,
0.2109768, 0.3365795, -0.3034396, 0, 0.4431373, 1, 1,
0.2149793, 0.4161907, 1.969243, 0, 0.4352941, 1, 1,
0.2151471, -0.4959778, 2.243361, 0, 0.4313726, 1, 1,
0.2170911, 0.2080385, 2.492304, 0, 0.4235294, 1, 1,
0.2252254, -1.025241, 2.416582, 0, 0.4196078, 1, 1,
0.2263624, -1.120459, 3.927583, 0, 0.4117647, 1, 1,
0.2354264, -0.3132088, 1.075352, 0, 0.4078431, 1, 1,
0.2358738, 0.9496671, -2.096784, 0, 0.4, 1, 1,
0.2481982, 2.002242, -0.0458035, 0, 0.3921569, 1, 1,
0.2493226, -0.2178965, 3.704149, 0, 0.3882353, 1, 1,
0.2556247, 1.867091, -3.09564, 0, 0.3803922, 1, 1,
0.2556998, 0.7651856, -0.1984127, 0, 0.3764706, 1, 1,
0.2558522, -0.4881977, 2.156995, 0, 0.3686275, 1, 1,
0.2632631, -1.529548, 2.689172, 0, 0.3647059, 1, 1,
0.2656381, 0.7738531, 1.422186, 0, 0.3568628, 1, 1,
0.2711232, 0.4552782, 1.216763, 0, 0.3529412, 1, 1,
0.2744288, -0.5243913, 3.505441, 0, 0.345098, 1, 1,
0.2748996, 0.2904142, 2.329173, 0, 0.3411765, 1, 1,
0.276636, -0.3562422, 1.999947, 0, 0.3333333, 1, 1,
0.2772542, -1.688744, 1.400282, 0, 0.3294118, 1, 1,
0.284877, 1.083085, 0.2433862, 0, 0.3215686, 1, 1,
0.2860439, 0.009027032, 2.251023, 0, 0.3176471, 1, 1,
0.2885112, -0.8940582, 2.561876, 0, 0.3098039, 1, 1,
0.2894126, -0.02323156, 1.151954, 0, 0.3058824, 1, 1,
0.2913792, -0.6773602, 3.633972, 0, 0.2980392, 1, 1,
0.2916751, -0.9749686, 0.9889462, 0, 0.2901961, 1, 1,
0.2917413, -0.9042045, 2.721198, 0, 0.2862745, 1, 1,
0.2920884, 0.1243298, 3.728996, 0, 0.2784314, 1, 1,
0.2939886, -1.009237, 1.298935, 0, 0.2745098, 1, 1,
0.2993501, -1.477724, 2.147835, 0, 0.2666667, 1, 1,
0.303921, -0.4358181, 2.359349, 0, 0.2627451, 1, 1,
0.3046151, 0.9969857, -0.2021157, 0, 0.254902, 1, 1,
0.3055085, -1.486366, 3.40667, 0, 0.2509804, 1, 1,
0.305944, 0.8427024, -0.6941665, 0, 0.2431373, 1, 1,
0.306682, 0.02961097, 0.4471669, 0, 0.2392157, 1, 1,
0.3074973, -1.218061, 2.676847, 0, 0.2313726, 1, 1,
0.3109361, 0.6060118, -0.322277, 0, 0.227451, 1, 1,
0.3143381, 0.5716051, 1.289071, 0, 0.2196078, 1, 1,
0.31594, 1.304734, -0.02823181, 0, 0.2156863, 1, 1,
0.3211773, 0.5792091, 0.7305806, 0, 0.2078431, 1, 1,
0.3224535, 0.7129975, 0.9764482, 0, 0.2039216, 1, 1,
0.3237549, 0.5423617, 1.266906, 0, 0.1960784, 1, 1,
0.3269184, -0.5395092, 4.196327, 0, 0.1882353, 1, 1,
0.3296129, 0.03098031, 1.689717, 0, 0.1843137, 1, 1,
0.3305549, -0.2118062, 2.464644, 0, 0.1764706, 1, 1,
0.3308972, 0.1021011, 1.089644, 0, 0.172549, 1, 1,
0.3396755, -0.9572857, 2.799015, 0, 0.1647059, 1, 1,
0.3404481, -0.4567845, 2.369798, 0, 0.1607843, 1, 1,
0.3409862, -2.019512, 1.810846, 0, 0.1529412, 1, 1,
0.3446997, -1.331529, 2.837429, 0, 0.1490196, 1, 1,
0.3448874, 0.6935178, 0.9741642, 0, 0.1411765, 1, 1,
0.3449546, 0.0189715, 3.364243, 0, 0.1372549, 1, 1,
0.345137, -0.1892362, 1.207405, 0, 0.1294118, 1, 1,
0.3502662, -1.838899, 2.144157, 0, 0.1254902, 1, 1,
0.35116, 2.304752, 1.108501, 0, 0.1176471, 1, 1,
0.3543611, 0.4409664, -0.3402818, 0, 0.1137255, 1, 1,
0.357119, -1.828964, 3.61709, 0, 0.1058824, 1, 1,
0.3576143, -0.01406637, 1.740602, 0, 0.09803922, 1, 1,
0.3582059, 0.9260375, -0.6245507, 0, 0.09411765, 1, 1,
0.3583212, 0.1325978, -0.008796182, 0, 0.08627451, 1, 1,
0.3588466, -0.2619151, 3.324684, 0, 0.08235294, 1, 1,
0.3632212, 0.2140196, 0.8571715, 0, 0.07450981, 1, 1,
0.3649403, -0.6150703, 3.550956, 0, 0.07058824, 1, 1,
0.3655444, -0.1464971, 2.986091, 0, 0.0627451, 1, 1,
0.372707, -0.1462597, 1.767742, 0, 0.05882353, 1, 1,
0.3747915, -1.250521, 2.72173, 0, 0.05098039, 1, 1,
0.3776861, 0.1153328, 1.662022, 0, 0.04705882, 1, 1,
0.3807397, -0.01526849, 0.1636347, 0, 0.03921569, 1, 1,
0.3836675, 0.5800633, 0.4088868, 0, 0.03529412, 1, 1,
0.3858034, 0.03309234, 1.426685, 0, 0.02745098, 1, 1,
0.391791, -0.2506129, 4.050941, 0, 0.02352941, 1, 1,
0.3918318, 1.310155, -0.6060936, 0, 0.01568628, 1, 1,
0.3928992, 1.232669, 1.19416, 0, 0.01176471, 1, 1,
0.394976, -2.222931, 4.355522, 0, 0.003921569, 1, 1,
0.3977148, -1.038109, 1.404654, 0.003921569, 0, 1, 1,
0.4017885, 0.4804963, -0.5559458, 0.007843138, 0, 1, 1,
0.4038867, 0.1795157, 2.265049, 0.01568628, 0, 1, 1,
0.4039797, -1.517855, 4.111098, 0.01960784, 0, 1, 1,
0.4064544, 2.092996, 0.1964479, 0.02745098, 0, 1, 1,
0.4125281, 0.0971508, 2.04994, 0.03137255, 0, 1, 1,
0.4128816, 0.3345191, -0.3844438, 0.03921569, 0, 1, 1,
0.4143013, -1.230496, 1.855588, 0.04313726, 0, 1, 1,
0.4143449, 1.868399, 1.505964, 0.05098039, 0, 1, 1,
0.4148078, 0.7789882, 1.523717, 0.05490196, 0, 1, 1,
0.4168956, -1.153025, 2.476089, 0.0627451, 0, 1, 1,
0.4174548, 0.2047686, 1.757575, 0.06666667, 0, 1, 1,
0.4211719, 0.2421127, 1.263699, 0.07450981, 0, 1, 1,
0.4275717, -1.144792, 2.610811, 0.07843138, 0, 1, 1,
0.4405071, 0.7585645, -0.4416941, 0.08627451, 0, 1, 1,
0.4427255, -0.2688476, 3.451558, 0.09019608, 0, 1, 1,
0.4439723, 0.5109001, -0.934305, 0.09803922, 0, 1, 1,
0.4449628, -1.271947, 1.409084, 0.1058824, 0, 1, 1,
0.4501323, -2.560126, 3.284494, 0.1098039, 0, 1, 1,
0.4512196, -0.1200444, 0.1864423, 0.1176471, 0, 1, 1,
0.4529291, -0.4432444, 2.471226, 0.1215686, 0, 1, 1,
0.4537449, 0.4917391, 1.965132, 0.1294118, 0, 1, 1,
0.4570809, 0.2560768, 3.369537, 0.1333333, 0, 1, 1,
0.4573299, 1.388023, 0.6101262, 0.1411765, 0, 1, 1,
0.4584387, 1.290473, 1.905565, 0.145098, 0, 1, 1,
0.4641436, 1.345057, -1.578677, 0.1529412, 0, 1, 1,
0.4642094, 0.6253674, -0.6649178, 0.1568628, 0, 1, 1,
0.4680364, 0.4529951, 0.9424029, 0.1647059, 0, 1, 1,
0.4742038, -0.2192428, 1.83154, 0.1686275, 0, 1, 1,
0.4748775, 0.5376325, 2.003875, 0.1764706, 0, 1, 1,
0.4814803, 0.9890229, -0.7810234, 0.1803922, 0, 1, 1,
0.4846614, 0.1722084, 0.7920749, 0.1882353, 0, 1, 1,
0.4892353, 0.4675128, 1.120849, 0.1921569, 0, 1, 1,
0.4994234, -0.678912, 1.183984, 0.2, 0, 1, 1,
0.5052426, -0.3079018, 0.2097016, 0.2078431, 0, 1, 1,
0.5058611, 0.609437, 1.023706, 0.2117647, 0, 1, 1,
0.5074073, -0.3671724, 0.9421327, 0.2196078, 0, 1, 1,
0.5092305, 0.4526774, 1.139308, 0.2235294, 0, 1, 1,
0.511117, 1.543128, 0.5092264, 0.2313726, 0, 1, 1,
0.5115132, 0.4648644, 1.345831, 0.2352941, 0, 1, 1,
0.52134, 0.7963248, 2.598361, 0.2431373, 0, 1, 1,
0.5301957, -1.180961, 2.353257, 0.2470588, 0, 1, 1,
0.5313106, -1.915598, 3.130175, 0.254902, 0, 1, 1,
0.5352327, 0.5244547, 0.9702616, 0.2588235, 0, 1, 1,
0.5367377, 0.2491503, 2.706576, 0.2666667, 0, 1, 1,
0.5428954, 0.8432307, -0.1113526, 0.2705882, 0, 1, 1,
0.5445197, -0.4159804, 1.548405, 0.2784314, 0, 1, 1,
0.5466276, -0.7921945, 1.48814, 0.282353, 0, 1, 1,
0.5466922, 3.350154, 0.4506525, 0.2901961, 0, 1, 1,
0.5505175, 0.302756, 0.3005957, 0.2941177, 0, 1, 1,
0.5528151, 0.4304432, 0.2989459, 0.3019608, 0, 1, 1,
0.5549621, 1.15941, 0.0129995, 0.3098039, 0, 1, 1,
0.5552495, -1.283955, 2.636291, 0.3137255, 0, 1, 1,
0.5626824, -0.4996993, 3.615182, 0.3215686, 0, 1, 1,
0.5637191, 0.03165378, -0.04317458, 0.3254902, 0, 1, 1,
0.5638579, -1.376344, 4.50465, 0.3333333, 0, 1, 1,
0.5656267, -0.5974701, 3.741642, 0.3372549, 0, 1, 1,
0.5665672, 1.258314, 0.9870256, 0.345098, 0, 1, 1,
0.5667422, -1.161889, 2.312989, 0.3490196, 0, 1, 1,
0.5668943, -1.759641, 3.918616, 0.3568628, 0, 1, 1,
0.5701786, 0.8032402, 1.046888, 0.3607843, 0, 1, 1,
0.5804968, 1.023955, 1.394425, 0.3686275, 0, 1, 1,
0.5814511, -1.106906, 4.217439, 0.372549, 0, 1, 1,
0.5910157, 0.917866, -0.5350791, 0.3803922, 0, 1, 1,
0.5921478, 1.158276, -0.7723733, 0.3843137, 0, 1, 1,
0.5927022, -1.860328, 1.40549, 0.3921569, 0, 1, 1,
0.5932679, -1.905213, 2.301266, 0.3960784, 0, 1, 1,
0.5963969, 0.4370292, 2.03841, 0.4039216, 0, 1, 1,
0.6027629, -0.1629497, 2.333371, 0.4117647, 0, 1, 1,
0.6067697, 0.01153443, 1.809715, 0.4156863, 0, 1, 1,
0.6072354, 1.239856, 0.9407755, 0.4235294, 0, 1, 1,
0.6097369, 2.227524, 0.4753252, 0.427451, 0, 1, 1,
0.6111038, -0.5292847, 3.313199, 0.4352941, 0, 1, 1,
0.6137449, -0.04806742, 0.03383904, 0.4392157, 0, 1, 1,
0.6140774, 0.565292, 0.7103292, 0.4470588, 0, 1, 1,
0.6162729, -1.024763, 4.042514, 0.4509804, 0, 1, 1,
0.62033, 1.148629, 0.840934, 0.4588235, 0, 1, 1,
0.6214554, 0.4955218, 1.29795, 0.4627451, 0, 1, 1,
0.6336084, 0.6942891, 0.3076595, 0.4705882, 0, 1, 1,
0.6347151, 0.01903464, 1.57429, 0.4745098, 0, 1, 1,
0.6455097, -0.3504307, 0.9290208, 0.4823529, 0, 1, 1,
0.6458363, -0.83255, 1.839675, 0.4862745, 0, 1, 1,
0.6470364, -0.5838696, 2.78407, 0.4941176, 0, 1, 1,
0.6473101, 2.021364, 0.3493057, 0.5019608, 0, 1, 1,
0.6509297, 1.852467, 2.111834, 0.5058824, 0, 1, 1,
0.652216, -0.4192061, 1.771148, 0.5137255, 0, 1, 1,
0.6566439, 1.11975, 1.221886, 0.5176471, 0, 1, 1,
0.664254, 1.873628, 0.4029328, 0.5254902, 0, 1, 1,
0.6662837, -0.6229534, 2.206737, 0.5294118, 0, 1, 1,
0.6786365, 0.6738932, 1.172035, 0.5372549, 0, 1, 1,
0.682635, 0.3461227, 1.048668, 0.5411765, 0, 1, 1,
0.6905707, 0.3694379, 2.546497, 0.5490196, 0, 1, 1,
0.692174, -0.4039589, 1.678371, 0.5529412, 0, 1, 1,
0.6970528, -1.244856, 2.659597, 0.5607843, 0, 1, 1,
0.6975898, 0.1441987, 3.627267, 0.5647059, 0, 1, 1,
0.7016577, -1.269917, 3.171527, 0.572549, 0, 1, 1,
0.7049521, -0.6588855, 2.488238, 0.5764706, 0, 1, 1,
0.7054317, -0.6184752, 3.490888, 0.5843138, 0, 1, 1,
0.7061077, -0.4858226, 1.930825, 0.5882353, 0, 1, 1,
0.7107595, 0.1760339, 0.5777206, 0.5960785, 0, 1, 1,
0.7136643, -0.8745235, 4.388912, 0.6039216, 0, 1, 1,
0.7138903, -0.2422729, 1.525585, 0.6078432, 0, 1, 1,
0.7167726, -1.125975, 2.237946, 0.6156863, 0, 1, 1,
0.7173307, 1.018098, 1.783526, 0.6196079, 0, 1, 1,
0.7194789, 0.8608087, 2.126231, 0.627451, 0, 1, 1,
0.726208, 0.7945213, 0.5896471, 0.6313726, 0, 1, 1,
0.7293105, 0.7406174, 0.7796915, 0.6392157, 0, 1, 1,
0.7326289, 0.5377152, 2.306845, 0.6431373, 0, 1, 1,
0.7370709, 1.517873, 2.056306, 0.6509804, 0, 1, 1,
0.7396399, 0.1778907, 3.634781, 0.654902, 0, 1, 1,
0.7417119, 0.9192522, 1.580729, 0.6627451, 0, 1, 1,
0.7495092, 0.418475, 1.016362, 0.6666667, 0, 1, 1,
0.7503796, -0.7113338, 1.006102, 0.6745098, 0, 1, 1,
0.7565302, -0.07027932, 0.492195, 0.6784314, 0, 1, 1,
0.7605175, -0.6825342, 2.887006, 0.6862745, 0, 1, 1,
0.7649121, 0.7450421, 1.479983, 0.6901961, 0, 1, 1,
0.7688681, -0.9054718, 4.176743, 0.6980392, 0, 1, 1,
0.7772929, -1.231301, 2.931414, 0.7058824, 0, 1, 1,
0.7815888, -0.002516302, 0.5360485, 0.7098039, 0, 1, 1,
0.7856972, -0.9685048, 3.362097, 0.7176471, 0, 1, 1,
0.7915329, 1.496316, -0.4741673, 0.7215686, 0, 1, 1,
0.7918019, 1.148661, 0.4976861, 0.7294118, 0, 1, 1,
0.7919175, -0.6618865, 2.099515, 0.7333333, 0, 1, 1,
0.7929513, -0.6100026, 2.534048, 0.7411765, 0, 1, 1,
0.7937825, -0.5421606, 2.506266, 0.7450981, 0, 1, 1,
0.7969553, 1.380014, -0.1534886, 0.7529412, 0, 1, 1,
0.7996868, -0.2380688, 1.846355, 0.7568628, 0, 1, 1,
0.8108521, 0.6929846, 2.642695, 0.7647059, 0, 1, 1,
0.815837, 1.380401, 1.151757, 0.7686275, 0, 1, 1,
0.8163964, -0.5987279, 1.851292, 0.7764706, 0, 1, 1,
0.8219238, -0.2223497, 2.000233, 0.7803922, 0, 1, 1,
0.8251236, 0.5084161, 1.091505, 0.7882353, 0, 1, 1,
0.8267446, -0.1861136, 2.391076, 0.7921569, 0, 1, 1,
0.8306019, -0.3893105, -0.02520105, 0.8, 0, 1, 1,
0.8357921, 0.321692, 0.5069352, 0.8078431, 0, 1, 1,
0.8359228, 0.4478777, 1.244761, 0.8117647, 0, 1, 1,
0.8401489, 1.681562, 1.954948, 0.8196079, 0, 1, 1,
0.8454545, 0.05544732, 1.391061, 0.8235294, 0, 1, 1,
0.8457137, -0.5547929, 1.666206, 0.8313726, 0, 1, 1,
0.846715, -1.390332, 3.646257, 0.8352941, 0, 1, 1,
0.8509104, -1.159568, 2.743808, 0.8431373, 0, 1, 1,
0.8533152, -0.4900714, 2.864462, 0.8470588, 0, 1, 1,
0.8542266, 2.048215, -0.5977572, 0.854902, 0, 1, 1,
0.8554556, 2.523021, 0.08536921, 0.8588235, 0, 1, 1,
0.8650309, -1.006284, 2.194147, 0.8666667, 0, 1, 1,
0.8683823, 1.462129, -0.1246755, 0.8705882, 0, 1, 1,
0.8776478, -1.599584, 2.545504, 0.8784314, 0, 1, 1,
0.8790449, -0.4447784, 2.346021, 0.8823529, 0, 1, 1,
0.8797894, 0.003119939, 0.7006835, 0.8901961, 0, 1, 1,
0.8808007, -0.3111938, 1.694499, 0.8941177, 0, 1, 1,
0.8859492, 1.03108, 0.2926624, 0.9019608, 0, 1, 1,
0.8896188, -0.5399482, 1.348976, 0.9098039, 0, 1, 1,
0.9010471, 0.9268692, 0.9927491, 0.9137255, 0, 1, 1,
0.9012784, -1.026447, 2.116864, 0.9215686, 0, 1, 1,
0.9022958, 1.648409, 0.3907478, 0.9254902, 0, 1, 1,
0.9053351, -0.877215, 3.322321, 0.9333333, 0, 1, 1,
0.914107, 0.7828176, -0.6280362, 0.9372549, 0, 1, 1,
0.9151391, -1.167162, 2.855259, 0.945098, 0, 1, 1,
0.9193614, -1.121046, 3.680367, 0.9490196, 0, 1, 1,
0.9253443, -0.03846319, 2.674916, 0.9568627, 0, 1, 1,
0.9328505, 0.5475226, 0.8355634, 0.9607843, 0, 1, 1,
0.9328619, -0.3795819, 2.408049, 0.9686275, 0, 1, 1,
0.9331529, -0.895904, 3.789413, 0.972549, 0, 1, 1,
0.9420165, -0.5729788, 2.682443, 0.9803922, 0, 1, 1,
0.9451985, 0.1889461, 2.172799, 0.9843137, 0, 1, 1,
0.9485487, 0.9159915, 0.4365112, 0.9921569, 0, 1, 1,
0.9579945, 0.963426, 1.183726, 0.9960784, 0, 1, 1,
0.9584668, -1.731203, 3.294955, 1, 0, 0.9960784, 1,
0.9619712, 0.006796963, 1.572559, 1, 0, 0.9882353, 1,
0.96381, -0.2377255, 1.446162, 1, 0, 0.9843137, 1,
0.966596, -1.404882, 4.152661, 1, 0, 0.9764706, 1,
0.9760743, 1.18976, -2.079311, 1, 0, 0.972549, 1,
0.9805351, -1.367923, 0.619162, 1, 0, 0.9647059, 1,
0.9845058, 0.4575053, 0.5391223, 1, 0, 0.9607843, 1,
0.9955854, 0.8229375, -0.1741427, 1, 0, 0.9529412, 1,
1.001385, -0.7821679, 1.291624, 1, 0, 0.9490196, 1,
1.007079, -1.729098, 2.645577, 1, 0, 0.9411765, 1,
1.012258, 0.1198806, 1.419006, 1, 0, 0.9372549, 1,
1.016816, 0.4454811, 1.653784, 1, 0, 0.9294118, 1,
1.020263, 1.547953, -1.348721, 1, 0, 0.9254902, 1,
1.021641, 0.9031329, 0.3983552, 1, 0, 0.9176471, 1,
1.024581, -0.04570722, 0.9894744, 1, 0, 0.9137255, 1,
1.028501, -0.9534457, 0.986564, 1, 0, 0.9058824, 1,
1.029605, 1.34826, 0.4332622, 1, 0, 0.9019608, 1,
1.030472, 0.4835638, 1.852163, 1, 0, 0.8941177, 1,
1.037695, 0.8134677, 2.539471, 1, 0, 0.8862745, 1,
1.039689, -0.2919427, 2.22833, 1, 0, 0.8823529, 1,
1.045452, -0.5377693, 1.254724, 1, 0, 0.8745098, 1,
1.046241, 0.1671006, 1.472167, 1, 0, 0.8705882, 1,
1.048758, 0.02121767, 0.1521229, 1, 0, 0.8627451, 1,
1.055381, -0.2754315, 1.246755, 1, 0, 0.8588235, 1,
1.067485, -1.109116, 3.397426, 1, 0, 0.8509804, 1,
1.070449, -0.2560492, 0.5981392, 1, 0, 0.8470588, 1,
1.077984, -1.236834, 0.9830273, 1, 0, 0.8392157, 1,
1.078907, -0.890641, 1.260491, 1, 0, 0.8352941, 1,
1.080289, -0.09261391, 2.27831, 1, 0, 0.827451, 1,
1.081347, 0.4530609, -0.5102801, 1, 0, 0.8235294, 1,
1.084423, 1.098818, 1.367524, 1, 0, 0.8156863, 1,
1.086023, -1.977451, 3.179324, 1, 0, 0.8117647, 1,
1.08901, 0.4466306, 1.045277, 1, 0, 0.8039216, 1,
1.091637, 0.2516754, 0.6607072, 1, 0, 0.7960784, 1,
1.094366, -0.2805873, 0.7792433, 1, 0, 0.7921569, 1,
1.09748, -0.4543541, 3.058277, 1, 0, 0.7843137, 1,
1.100017, -0.09544127, 2.933492, 1, 0, 0.7803922, 1,
1.103536, 1.060448, 1.739881, 1, 0, 0.772549, 1,
1.10435, 0.6555303, 0.9644132, 1, 0, 0.7686275, 1,
1.109995, -0.4482605, 3.054896, 1, 0, 0.7607843, 1,
1.118555, 1.399607, 0.4592613, 1, 0, 0.7568628, 1,
1.122466, 0.3990687, 1.016041, 1, 0, 0.7490196, 1,
1.127525, 0.7594631, 1.321817, 1, 0, 0.7450981, 1,
1.128256, 1.080378, -0.2169362, 1, 0, 0.7372549, 1,
1.135453, 0.8977469, 1.368639, 1, 0, 0.7333333, 1,
1.135916, -0.1827511, 4.007252, 1, 0, 0.7254902, 1,
1.139559, 0.8550651, 3.24008, 1, 0, 0.7215686, 1,
1.145201, -0.3151651, 1.535204, 1, 0, 0.7137255, 1,
1.148646, 1.090948, 0.6618071, 1, 0, 0.7098039, 1,
1.16194, -1.217545, 2.692599, 1, 0, 0.7019608, 1,
1.164124, 0.6266927, 1.139269, 1, 0, 0.6941177, 1,
1.165675, 1.013364, 0.9835376, 1, 0, 0.6901961, 1,
1.173534, -0.7274721, 1.728846, 1, 0, 0.682353, 1,
1.175628, 0.5351451, 1.00325, 1, 0, 0.6784314, 1,
1.183223, -0.05650711, 2.570693, 1, 0, 0.6705883, 1,
1.189883, 1.037913, 1.650899, 1, 0, 0.6666667, 1,
1.193676, 0.1840834, 2.189893, 1, 0, 0.6588235, 1,
1.197857, 0.5715165, 1.725193, 1, 0, 0.654902, 1,
1.200754, -0.514931, 1.927669, 1, 0, 0.6470588, 1,
1.202769, -1.053135, 5.265385, 1, 0, 0.6431373, 1,
1.203918, -0.5309729, 0.392572, 1, 0, 0.6352941, 1,
1.210012, -0.2919608, 2.255831, 1, 0, 0.6313726, 1,
1.220989, -0.5477512, 1.502571, 1, 0, 0.6235294, 1,
1.256198, -0.4817906, 2.016377, 1, 0, 0.6196079, 1,
1.258404, -2.935685, 3.89542, 1, 0, 0.6117647, 1,
1.260766, -0.2015192, 1.377087, 1, 0, 0.6078432, 1,
1.262464, -1.447084, 1.605432, 1, 0, 0.6, 1,
1.268311, 1.038377, 2.707653, 1, 0, 0.5921569, 1,
1.271346, 1.88727, 0.3451632, 1, 0, 0.5882353, 1,
1.276738, -0.3844095, 1.940502, 1, 0, 0.5803922, 1,
1.280488, 0.7600019, -0.3322802, 1, 0, 0.5764706, 1,
1.283875, 1.3238, -0.3527868, 1, 0, 0.5686275, 1,
1.289152, -1.702415, 2.07425, 1, 0, 0.5647059, 1,
1.318103, 1.419192, -0.5427611, 1, 0, 0.5568628, 1,
1.336737, 1.002053, 1.299587, 1, 0, 0.5529412, 1,
1.337832, -0.8311341, 1.755125, 1, 0, 0.5450981, 1,
1.342055, 0.6120449, 1.042443, 1, 0, 0.5411765, 1,
1.36564, 2.509094, 0.03014637, 1, 0, 0.5333334, 1,
1.365863, -0.3359434, 0.3416716, 1, 0, 0.5294118, 1,
1.36683, 1.14158, 2.202676, 1, 0, 0.5215687, 1,
1.380398, 1.837986, 1.579559, 1, 0, 0.5176471, 1,
1.396511, -0.4782742, 0.6807723, 1, 0, 0.509804, 1,
1.399857, -1.184713, 2.113235, 1, 0, 0.5058824, 1,
1.405847, 0.244709, 1.646618, 1, 0, 0.4980392, 1,
1.433184, -1.576523, 0.7355798, 1, 0, 0.4901961, 1,
1.445735, -1.949116, 3.670892, 1, 0, 0.4862745, 1,
1.446111, 1.1172, 0.6786245, 1, 0, 0.4784314, 1,
1.450756, 0.7925306, 0.8209163, 1, 0, 0.4745098, 1,
1.455427, 0.2941555, 1.110386, 1, 0, 0.4666667, 1,
1.463424, 0.6397455, 1.89215, 1, 0, 0.4627451, 1,
1.46888, -1.594182, 2.915183, 1, 0, 0.454902, 1,
1.499903, 0.1109599, 0.4413899, 1, 0, 0.4509804, 1,
1.510377, -1.880314, 0.3661302, 1, 0, 0.4431373, 1,
1.521317, -1.173918, 2.528155, 1, 0, 0.4392157, 1,
1.527059, -0.02763297, 2.743616, 1, 0, 0.4313726, 1,
1.527491, -1.064133, 0.6851469, 1, 0, 0.427451, 1,
1.528372, -0.155763, 2.393268, 1, 0, 0.4196078, 1,
1.531322, 0.04577098, -0.2910616, 1, 0, 0.4156863, 1,
1.537913, 1.360939, 2.493144, 1, 0, 0.4078431, 1,
1.540753, -0.1101408, 1.302434, 1, 0, 0.4039216, 1,
1.541788, 1.529473, 0.7883604, 1, 0, 0.3960784, 1,
1.548252, -0.2737728, 1.766577, 1, 0, 0.3882353, 1,
1.563881, -0.5601512, 4.1199, 1, 0, 0.3843137, 1,
1.574109, -1.024474, 0.680172, 1, 0, 0.3764706, 1,
1.575013, 1.051765, 1.434236, 1, 0, 0.372549, 1,
1.576617, -1.302422, 3.348753, 1, 0, 0.3647059, 1,
1.578097, 1.179342, 1.226935, 1, 0, 0.3607843, 1,
1.579957, -1.178343, 2.41045, 1, 0, 0.3529412, 1,
1.585842, -0.05687493, 0.9373136, 1, 0, 0.3490196, 1,
1.603133, 0.5564178, -0.09600902, 1, 0, 0.3411765, 1,
1.604074, 0.8167052, 1.484894, 1, 0, 0.3372549, 1,
1.606481, -1.112757, 1.692975, 1, 0, 0.3294118, 1,
1.606558, 0.4403386, 2.161694, 1, 0, 0.3254902, 1,
1.609187, 1.379457, 0.6545048, 1, 0, 0.3176471, 1,
1.609906, 0.6888075, 1.70033, 1, 0, 0.3137255, 1,
1.618344, -2.065111, 2.228222, 1, 0, 0.3058824, 1,
1.636971, -0.7364617, 0.5120068, 1, 0, 0.2980392, 1,
1.639856, 0.9499418, 1.051263, 1, 0, 0.2941177, 1,
1.643319, 0.1157342, 1.625451, 1, 0, 0.2862745, 1,
1.652157, -0.2108897, 2.048605, 1, 0, 0.282353, 1,
1.656219, -0.03382083, 0.4361849, 1, 0, 0.2745098, 1,
1.680006, 0.9596967, 0.4850822, 1, 0, 0.2705882, 1,
1.68453, 0.9213876, 0.6182259, 1, 0, 0.2627451, 1,
1.685468, -0.6137916, 2.71022, 1, 0, 0.2588235, 1,
1.690892, 0.1502719, 1.108543, 1, 0, 0.2509804, 1,
1.69482, -0.1868084, 1.585529, 1, 0, 0.2470588, 1,
1.721513, -1.694082, 3.437107, 1, 0, 0.2392157, 1,
1.724138, 0.396542, 1.737218, 1, 0, 0.2352941, 1,
1.724889, 0.8959169, 1.556354, 1, 0, 0.227451, 1,
1.736381, 0.33362, 0.3600903, 1, 0, 0.2235294, 1,
1.755077, 0.3689423, 2.917931, 1, 0, 0.2156863, 1,
1.757544, -0.57828, 1.493191, 1, 0, 0.2117647, 1,
1.769655, -0.2766502, 0.9265063, 1, 0, 0.2039216, 1,
1.784884, 0.1478582, -0.2607791, 1, 0, 0.1960784, 1,
1.78502, -1.006789, 0.6736726, 1, 0, 0.1921569, 1,
1.800437, -0.1225598, 0.8936055, 1, 0, 0.1843137, 1,
1.810134, 1.868635, 1.966318, 1, 0, 0.1803922, 1,
1.815854, 0.1083121, 3.077928, 1, 0, 0.172549, 1,
1.818931, -0.05240669, 2.450568, 1, 0, 0.1686275, 1,
1.819834, 0.5963247, 0.6079301, 1, 0, 0.1607843, 1,
1.901767, 0.06207272, 0.6653386, 1, 0, 0.1568628, 1,
1.936253, -1.416386, 1.571634, 1, 0, 0.1490196, 1,
1.988453, -1.632141, 3.083572, 1, 0, 0.145098, 1,
2.002347, -0.5810694, 4.568655, 1, 0, 0.1372549, 1,
2.030072, 0.4058597, 2.19522, 1, 0, 0.1333333, 1,
2.030634, -1.551625, 0.4793863, 1, 0, 0.1254902, 1,
2.084489, -0.1763425, 2.583098, 1, 0, 0.1215686, 1,
2.101782, -0.08177027, 0.8424183, 1, 0, 0.1137255, 1,
2.120383, 0.7820253, 0.3918996, 1, 0, 0.1098039, 1,
2.1226, -1.800877, 1.803359, 1, 0, 0.1019608, 1,
2.128278, 0.7480929, 3.267213, 1, 0, 0.09411765, 1,
2.129061, -0.04286946, 0.2516197, 1, 0, 0.09019608, 1,
2.207832, 0.5268583, 3.398031, 1, 0, 0.08235294, 1,
2.215877, -1.461538, 1.390936, 1, 0, 0.07843138, 1,
2.255093, -0.9682853, 2.778868, 1, 0, 0.07058824, 1,
2.256472, -1.294634, 1.176156, 1, 0, 0.06666667, 1,
2.268585, 0.2983854, 0.7648682, 1, 0, 0.05882353, 1,
2.277794, -1.604055, 3.724785, 1, 0, 0.05490196, 1,
2.29498, 1.245466, 0.3515712, 1, 0, 0.04705882, 1,
2.353406, 1.081617, 2.352917, 1, 0, 0.04313726, 1,
2.397402, -0.432097, 1.247164, 1, 0, 0.03529412, 1,
2.41539, 1.152837, 1.73867, 1, 0, 0.03137255, 1,
2.446554, -0.5955992, 2.212502, 1, 0, 0.02352941, 1,
2.451408, 0.7140986, 0.6110538, 1, 0, 0.01960784, 1,
2.469455, 1.320461, 0.2164339, 1, 0, 0.01176471, 1,
2.791805, 0.4558536, 0.7618567, 1, 0, 0.007843138, 1
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
0.04806566, -4.008984, -7.138221, 0, -0.5, 0.5, 0.5,
0.04806566, -4.008984, -7.138221, 1, -0.5, 0.5, 0.5,
0.04806566, -4.008984, -7.138221, 1, 1.5, 0.5, 0.5,
0.04806566, -4.008984, -7.138221, 0, 1.5, 0.5, 0.5
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
-3.625802, 0.2303889, -7.138221, 0, -0.5, 0.5, 0.5,
-3.625802, 0.2303889, -7.138221, 1, -0.5, 0.5, 0.5,
-3.625802, 0.2303889, -7.138221, 1, 1.5, 0.5, 0.5,
-3.625802, 0.2303889, -7.138221, 0, 1.5, 0.5, 0.5
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
-3.625802, -4.008984, -0.03756738, 0, -0.5, 0.5, 0.5,
-3.625802, -4.008984, -0.03756738, 1, -0.5, 0.5, 0.5,
-3.625802, -4.008984, -0.03756738, 1, 1.5, 0.5, 0.5,
-3.625802, -4.008984, -0.03756738, 0, 1.5, 0.5, 0.5
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
-2, -3.030667, -5.499609,
2, -3.030667, -5.499609,
-2, -3.030667, -5.499609,
-2, -3.19372, -5.77271,
-1, -3.030667, -5.499609,
-1, -3.19372, -5.77271,
0, -3.030667, -5.499609,
0, -3.19372, -5.77271,
1, -3.030667, -5.499609,
1, -3.19372, -5.77271,
2, -3.030667, -5.499609,
2, -3.19372, -5.77271
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
-2, -3.519825, -6.318914, 0, -0.5, 0.5, 0.5,
-2, -3.519825, -6.318914, 1, -0.5, 0.5, 0.5,
-2, -3.519825, -6.318914, 1, 1.5, 0.5, 0.5,
-2, -3.519825, -6.318914, 0, 1.5, 0.5, 0.5,
-1, -3.519825, -6.318914, 0, -0.5, 0.5, 0.5,
-1, -3.519825, -6.318914, 1, -0.5, 0.5, 0.5,
-1, -3.519825, -6.318914, 1, 1.5, 0.5, 0.5,
-1, -3.519825, -6.318914, 0, 1.5, 0.5, 0.5,
0, -3.519825, -6.318914, 0, -0.5, 0.5, 0.5,
0, -3.519825, -6.318914, 1, -0.5, 0.5, 0.5,
0, -3.519825, -6.318914, 1, 1.5, 0.5, 0.5,
0, -3.519825, -6.318914, 0, 1.5, 0.5, 0.5,
1, -3.519825, -6.318914, 0, -0.5, 0.5, 0.5,
1, -3.519825, -6.318914, 1, -0.5, 0.5, 0.5,
1, -3.519825, -6.318914, 1, 1.5, 0.5, 0.5,
1, -3.519825, -6.318914, 0, 1.5, 0.5, 0.5,
2, -3.519825, -6.318914, 0, -0.5, 0.5, 0.5,
2, -3.519825, -6.318914, 1, -0.5, 0.5, 0.5,
2, -3.519825, -6.318914, 1, 1.5, 0.5, 0.5,
2, -3.519825, -6.318914, 0, 1.5, 0.5, 0.5
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
-2.777986, -2, -5.499609,
-2.777986, 3, -5.499609,
-2.777986, -2, -5.499609,
-2.919289, -2, -5.77271,
-2.777986, -1, -5.499609,
-2.919289, -1, -5.77271,
-2.777986, 0, -5.499609,
-2.919289, 0, -5.77271,
-2.777986, 1, -5.499609,
-2.919289, 1, -5.77271,
-2.777986, 2, -5.499609,
-2.919289, 2, -5.77271,
-2.777986, 3, -5.499609,
-2.919289, 3, -5.77271
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
-3.201894, -2, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, -2, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, -2, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, -2, -6.318914, 0, 1.5, 0.5, 0.5,
-3.201894, -1, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, -1, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, -1, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, -1, -6.318914, 0, 1.5, 0.5, 0.5,
-3.201894, 0, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, 0, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, 0, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, 0, -6.318914, 0, 1.5, 0.5, 0.5,
-3.201894, 1, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, 1, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, 1, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, 1, -6.318914, 0, 1.5, 0.5, 0.5,
-3.201894, 2, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, 2, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, 2, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, 2, -6.318914, 0, 1.5, 0.5, 0.5,
-3.201894, 3, -6.318914, 0, -0.5, 0.5, 0.5,
-3.201894, 3, -6.318914, 1, -0.5, 0.5, 0.5,
-3.201894, 3, -6.318914, 1, 1.5, 0.5, 0.5,
-3.201894, 3, -6.318914, 0, 1.5, 0.5, 0.5
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
-2.777986, -3.030667, -4,
-2.777986, -3.030667, 4,
-2.777986, -3.030667, -4,
-2.919289, -3.19372, -4,
-2.777986, -3.030667, -2,
-2.919289, -3.19372, -2,
-2.777986, -3.030667, 0,
-2.919289, -3.19372, 0,
-2.777986, -3.030667, 2,
-2.919289, -3.19372, 2,
-2.777986, -3.030667, 4,
-2.919289, -3.19372, 4
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
-3.201894, -3.519825, -4, 0, -0.5, 0.5, 0.5,
-3.201894, -3.519825, -4, 1, -0.5, 0.5, 0.5,
-3.201894, -3.519825, -4, 1, 1.5, 0.5, 0.5,
-3.201894, -3.519825, -4, 0, 1.5, 0.5, 0.5,
-3.201894, -3.519825, -2, 0, -0.5, 0.5, 0.5,
-3.201894, -3.519825, -2, 1, -0.5, 0.5, 0.5,
-3.201894, -3.519825, -2, 1, 1.5, 0.5, 0.5,
-3.201894, -3.519825, -2, 0, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 0, 0, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 0, 1, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 0, 1, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 0, 0, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 2, 0, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 2, 1, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 2, 1, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 2, 0, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 4, 0, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 4, 1, -0.5, 0.5, 0.5,
-3.201894, -3.519825, 4, 1, 1.5, 0.5, 0.5,
-3.201894, -3.519825, 4, 0, 1.5, 0.5, 0.5
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
-2.777986, -3.030667, -5.499609,
-2.777986, 3.491445, -5.499609,
-2.777986, -3.030667, 5.424474,
-2.777986, 3.491445, 5.424474,
-2.777986, -3.030667, -5.499609,
-2.777986, -3.030667, 5.424474,
-2.777986, 3.491445, -5.499609,
-2.777986, 3.491445, 5.424474,
-2.777986, -3.030667, -5.499609,
2.874117, -3.030667, -5.499609,
-2.777986, -3.030667, 5.424474,
2.874117, -3.030667, 5.424474,
-2.777986, 3.491445, -5.499609,
2.874117, 3.491445, -5.499609,
-2.777986, 3.491445, 5.424474,
2.874117, 3.491445, 5.424474,
2.874117, -3.030667, -5.499609,
2.874117, 3.491445, -5.499609,
2.874117, -3.030667, 5.424474,
2.874117, 3.491445, 5.424474,
2.874117, -3.030667, -5.499609,
2.874117, -3.030667, 5.424474,
2.874117, 3.491445, -5.499609,
2.874117, 3.491445, 5.424474
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
var radius = 7.434033;
var distance = 33.07485;
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
mvMatrix.translate( -0.04806566, -0.2303889, 0.03756738 );
mvMatrix.scale( 1.422094, 1.232396, 0.7357893 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.07485);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
sec-butylamine_2-ben<-read.table("sec-butylamine_2-ben.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sec-butylamine_2-ben$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-ben$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-ben$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-2.695674, -0.6169747, -1.937834, 0, 0, 1, 1, 1,
-2.589686, -0.8091193, -3.356606, 1, 0, 0, 1, 1,
-2.570737, -2.867185, -1.368494, 1, 0, 0, 1, 1,
-2.42341, 0.7664688, -3.600757, 1, 0, 0, 1, 1,
-2.377803, -0.4395803, -0.5821778, 1, 0, 0, 1, 1,
-2.351706, -1.142468, -1.769042, 1, 0, 0, 1, 1,
-2.302665, 1.482162, -0.4769083, 0, 0, 0, 1, 1,
-2.204554, -1.982077, -0.7672885, 0, 0, 0, 1, 1,
-2.086127, -1.112959, -2.473348, 0, 0, 0, 1, 1,
-2.056659, -0.5403723, 0.04459449, 0, 0, 0, 1, 1,
-2.050608, 1.339766, -1.94333, 0, 0, 0, 1, 1,
-2.039249, 1.053038, -3.232668, 0, 0, 0, 1, 1,
-2.009283, 0.08124807, -0.5912074, 0, 0, 0, 1, 1,
-1.989997, -1.397537, -3.580282, 1, 1, 1, 1, 1,
-1.974441, 1.990762, 1.195178, 1, 1, 1, 1, 1,
-1.974288, -2.235575, -2.671968, 1, 1, 1, 1, 1,
-1.972699, -0.1869293, -0.3328195, 1, 1, 1, 1, 1,
-1.967518, 2.23146, -2.284172, 1, 1, 1, 1, 1,
-1.901378, -1.260234, -2.293255, 1, 1, 1, 1, 1,
-1.898221, 2.119022, -0.6022599, 1, 1, 1, 1, 1,
-1.896643, -0.6493577, -0.6349239, 1, 1, 1, 1, 1,
-1.864369, -0.1999197, -2.317886, 1, 1, 1, 1, 1,
-1.845482, 1.743181, 0.1482972, 1, 1, 1, 1, 1,
-1.84238, -0.6946976, -2.705966, 1, 1, 1, 1, 1,
-1.814809, -0.7819173, -2.331202, 1, 1, 1, 1, 1,
-1.805945, 0.08196385, -1.855308, 1, 1, 1, 1, 1,
-1.798185, 2.440694, -0.3194616, 1, 1, 1, 1, 1,
-1.794446, -0.03124072, -0.7950509, 1, 1, 1, 1, 1,
-1.788899, 1.143475, -0.1175767, 0, 0, 1, 1, 1,
-1.773498, 0.9145986, -0.8836216, 1, 0, 0, 1, 1,
-1.762987, 0.9514214, 0.6118565, 1, 0, 0, 1, 1,
-1.760423, -0.2498193, -2.26836, 1, 0, 0, 1, 1,
-1.741434, -0.8910968, -2.087747, 1, 0, 0, 1, 1,
-1.736442, -0.6779377, -2.185801, 1, 0, 0, 1, 1,
-1.710686, -0.3869411, -2.907414, 0, 0, 0, 1, 1,
-1.7104, -0.643226, -0.9221649, 0, 0, 0, 1, 1,
-1.699681, 0.06558561, -2.096745, 0, 0, 0, 1, 1,
-1.690651, 1.047069, -1.843896, 0, 0, 0, 1, 1,
-1.6883, 0.6735356, -1.329531, 0, 0, 0, 1, 1,
-1.686618, 1.33737, -1.867351, 0, 0, 0, 1, 1,
-1.683319, 0.7507095, -1.127203, 0, 0, 0, 1, 1,
-1.675773, 1.140763, -3.035228, 1, 1, 1, 1, 1,
-1.674729, -1.068412, -2.220686, 1, 1, 1, 1, 1,
-1.66978, -0.4216812, -0.8703747, 1, 1, 1, 1, 1,
-1.665274, 1.610481, -1.534108, 1, 1, 1, 1, 1,
-1.661232, -0.9066972, -0.7372978, 1, 1, 1, 1, 1,
-1.657129, 0.1206394, -2.250353, 1, 1, 1, 1, 1,
-1.654168, 0.8818291, 0.001941318, 1, 1, 1, 1, 1,
-1.651164, 1.385979, 0.2480694, 1, 1, 1, 1, 1,
-1.64784, -0.79012, -1.777677, 1, 1, 1, 1, 1,
-1.643752, -0.0181818, -1.281508, 1, 1, 1, 1, 1,
-1.639523, -1.19089, -2.263296, 1, 1, 1, 1, 1,
-1.632499, 0.163178, -2.50968, 1, 1, 1, 1, 1,
-1.630053, -1.207751, -2.064521, 1, 1, 1, 1, 1,
-1.62298, 0.03394968, -1.284113, 1, 1, 1, 1, 1,
-1.616546, 0.2830094, -2.654702, 1, 1, 1, 1, 1,
-1.614076, -1.046789, -1.311558, 0, 0, 1, 1, 1,
-1.601106, 0.6201614, -0.9676809, 1, 0, 0, 1, 1,
-1.591204, -0.1950278, -0.1111116, 1, 0, 0, 1, 1,
-1.580741, 2.217314, -0.3909514, 1, 0, 0, 1, 1,
-1.574797, 0.9120891, -1.35963, 1, 0, 0, 1, 1,
-1.567048, -1.065213, -2.161226, 1, 0, 0, 1, 1,
-1.565652, 0.4275135, -1.205974, 0, 0, 0, 1, 1,
-1.563274, -0.3660068, -1.508384, 0, 0, 0, 1, 1,
-1.558551, 0.7402517, -1.413988, 0, 0, 0, 1, 1,
-1.558136, 1.878737, -0.1953629, 0, 0, 0, 1, 1,
-1.557664, 1.031667, -0.2298662, 0, 0, 0, 1, 1,
-1.553473, 0.5594444, -0.8042293, 0, 0, 0, 1, 1,
-1.552462, 0.6411723, -1.153823, 0, 0, 0, 1, 1,
-1.542358, -0.9612418, -2.485461, 1, 1, 1, 1, 1,
-1.538985, -1.096279, -1.497516, 1, 1, 1, 1, 1,
-1.528135, -0.3828794, -0.2281261, 1, 1, 1, 1, 1,
-1.519264, 0.5706935, -1.048149, 1, 1, 1, 1, 1,
-1.51516, -1.034602, -1.042645, 1, 1, 1, 1, 1,
-1.513088, -0.3067624, -1.217985, 1, 1, 1, 1, 1,
-1.511845, -0.2647319, -2.310357, 1, 1, 1, 1, 1,
-1.505758, -0.3725666, -0.7155391, 1, 1, 1, 1, 1,
-1.503979, -0.449, -3.169601, 1, 1, 1, 1, 1,
-1.493429, -0.5681463, -1.845512, 1, 1, 1, 1, 1,
-1.484999, -0.732546, -1.163147, 1, 1, 1, 1, 1,
-1.475927, -1.860147, -3.344518, 1, 1, 1, 1, 1,
-1.466104, 0.8002892, 0.4976488, 1, 1, 1, 1, 1,
-1.462415, 2.021619, -0.5458583, 1, 1, 1, 1, 1,
-1.457416, -0.1122217, -0.8888069, 1, 1, 1, 1, 1,
-1.438461, -1.007515, -3.17447, 0, 0, 1, 1, 1,
-1.432313, -0.7717832, -2.059065, 1, 0, 0, 1, 1,
-1.424285, -0.01566824, -0.4251515, 1, 0, 0, 1, 1,
-1.42201, -1.045207, -1.325946, 1, 0, 0, 1, 1,
-1.415811, 1.601799, -0.8138868, 1, 0, 0, 1, 1,
-1.415442, 0.1121015, -2.762162, 1, 0, 0, 1, 1,
-1.414006, -0.4703263, -3.120404, 0, 0, 0, 1, 1,
-1.410779, 0.07814077, -2.967591, 0, 0, 0, 1, 1,
-1.404345, -1.349235, -3.103277, 0, 0, 0, 1, 1,
-1.396193, -0.3757032, -1.925081, 0, 0, 0, 1, 1,
-1.390504, -0.08780864, -3.934683, 0, 0, 0, 1, 1,
-1.385863, 0.6158968, 0.04393465, 0, 0, 0, 1, 1,
-1.384135, -1.174762, -0.5040653, 0, 0, 0, 1, 1,
-1.380278, 1.200597, -0.7895557, 1, 1, 1, 1, 1,
-1.379838, 0.3514438, -1.064296, 1, 1, 1, 1, 1,
-1.366603, 0.3341785, -2.786078, 1, 1, 1, 1, 1,
-1.365727, -0.4386044, -1.414964, 1, 1, 1, 1, 1,
-1.356316, -0.5132923, -1.93353, 1, 1, 1, 1, 1,
-1.333887, -2.076916, -2.112158, 1, 1, 1, 1, 1,
-1.330614, 1.141145, -1.476633, 1, 1, 1, 1, 1,
-1.329147, -1.207466, -2.841735, 1, 1, 1, 1, 1,
-1.318527, -0.2114376, -0.7610196, 1, 1, 1, 1, 1,
-1.317807, 0.2519115, -1.24493, 1, 1, 1, 1, 1,
-1.31402, 0.1584649, 0.01101671, 1, 1, 1, 1, 1,
-1.301395, -0.2180574, -0.7105576, 1, 1, 1, 1, 1,
-1.291764, -0.6956999, -2.024896, 1, 1, 1, 1, 1,
-1.276567, -0.4638661, -4.124233, 1, 1, 1, 1, 1,
-1.270326, -0.2616683, -2.148024, 1, 1, 1, 1, 1,
-1.264318, 1.366776, 0.3822598, 0, 0, 1, 1, 1,
-1.26152, 1.125376, -1.354819, 1, 0, 0, 1, 1,
-1.2614, 0.0328881, -2.290538, 1, 0, 0, 1, 1,
-1.258018, 0.6052973, -0.5193605, 1, 0, 0, 1, 1,
-1.252959, 0.8024913, -2.470654, 1, 0, 0, 1, 1,
-1.239581, -0.612785, -2.431031, 1, 0, 0, 1, 1,
-1.239279, 0.2494346, -0.934666, 0, 0, 0, 1, 1,
-1.230884, -2.622867, -3.189997, 0, 0, 0, 1, 1,
-1.222363, -0.4741489, -2.22561, 0, 0, 0, 1, 1,
-1.222272, -1.025024, -2.083621, 0, 0, 0, 1, 1,
-1.214725, 1.487631, -2.870157, 0, 0, 0, 1, 1,
-1.214046, -0.1586309, -1.327917, 0, 0, 0, 1, 1,
-1.211617, 2.013226, 0.3799488, 0, 0, 0, 1, 1,
-1.207341, 0.2513848, -0.326488, 1, 1, 1, 1, 1,
-1.189897, 0.07192936, -2.221377, 1, 1, 1, 1, 1,
-1.177587, 1.541965, 0.1011575, 1, 1, 1, 1, 1,
-1.170884, 1.386516, -1.249812, 1, 1, 1, 1, 1,
-1.170504, 0.1515244, -2.972939, 1, 1, 1, 1, 1,
-1.16019, 0.9103106, -0.5267152, 1, 1, 1, 1, 1,
-1.151627, 0.7092735, -0.08350872, 1, 1, 1, 1, 1,
-1.151518, 1.386271, -0.3186138, 1, 1, 1, 1, 1,
-1.142804, -0.6429639, -2.343177, 1, 1, 1, 1, 1,
-1.132727, 0.7667073, 0.1760325, 1, 1, 1, 1, 1,
-1.130648, -0.4703598, -1.960899, 1, 1, 1, 1, 1,
-1.130198, -1.205979, -0.896249, 1, 1, 1, 1, 1,
-1.126135, -0.1455478, -1.279398, 1, 1, 1, 1, 1,
-1.120285, -0.1149374, -1.25517, 1, 1, 1, 1, 1,
-1.111528, 0.6291977, -1.520331, 1, 1, 1, 1, 1,
-1.106135, -0.01676294, -3.080858, 0, 0, 1, 1, 1,
-1.102329, -0.2880165, -1.294899, 1, 0, 0, 1, 1,
-1.102304, 0.06240289, -2.095943, 1, 0, 0, 1, 1,
-1.0914, -0.04202932, -2.382691, 1, 0, 0, 1, 1,
-1.08652, -0.2639202, -0.3952072, 1, 0, 0, 1, 1,
-1.084724, -0.9829862, -2.627811, 1, 0, 0, 1, 1,
-1.081888, -0.2962958, -2.437572, 0, 0, 0, 1, 1,
-1.078496, -0.1231447, -0.1719733, 0, 0, 0, 1, 1,
-1.076174, 0.9335089, -1.570503, 0, 0, 0, 1, 1,
-1.073853, -0.4243754, -2.619229, 0, 0, 0, 1, 1,
-1.071162, -1.21011, -2.428591, 0, 0, 0, 1, 1,
-1.069351, -1.12019, -4.337161, 0, 0, 0, 1, 1,
-1.068241, 1.420999, -0.3963757, 0, 0, 0, 1, 1,
-1.066886, -1.335173, -3.295997, 1, 1, 1, 1, 1,
-1.062764, 1.286593, -1.087611, 1, 1, 1, 1, 1,
-1.062574, -1.485341, -0.233931, 1, 1, 1, 1, 1,
-1.057765, 0.6217362, -0.3643931, 1, 1, 1, 1, 1,
-1.056339, 0.02999744, -4.314248, 1, 1, 1, 1, 1,
-1.056088, -0.1429437, -2.725959, 1, 1, 1, 1, 1,
-1.046266, 0.3837243, -2.752522, 1, 1, 1, 1, 1,
-1.045886, -0.2199621, -3.102467, 1, 1, 1, 1, 1,
-1.043018, -1.106769, -2.968904, 1, 1, 1, 1, 1,
-1.041616, -0.1907814, -1.754425, 1, 1, 1, 1, 1,
-1.034871, 0.7256456, -2.725654, 1, 1, 1, 1, 1,
-1.033692, -0.02897632, -0.7272271, 1, 1, 1, 1, 1,
-1.033517, 2.649732, -1.303742, 1, 1, 1, 1, 1,
-1.031804, 0.4122097, -1.841578, 1, 1, 1, 1, 1,
-1.031017, -0.6846916, -1.822083, 1, 1, 1, 1, 1,
-1.02958, 0.1235947, -1.80937, 0, 0, 1, 1, 1,
-1.028955, -0.198331, -1.630327, 1, 0, 0, 1, 1,
-1.026437, -0.5843865, -0.6383052, 1, 0, 0, 1, 1,
-1.021319, -0.3228313, -2.548934, 1, 0, 0, 1, 1,
-1.007297, -0.6895002, -2.06727, 1, 0, 0, 1, 1,
-1.006063, -0.6093619, -2.866287, 1, 0, 0, 1, 1,
-1.004275, -0.5235284, -2.788397, 0, 0, 0, 1, 1,
-0.9896918, 0.661965, 0.8693692, 0, 0, 0, 1, 1,
-0.9851395, -0.01736264, -0.2950547, 0, 0, 0, 1, 1,
-0.983794, 0.4516888, -2.346524, 0, 0, 0, 1, 1,
-0.9834629, -2.339365, -1.163003, 0, 0, 0, 1, 1,
-0.9832867, -0.6834625, 0.5945182, 0, 0, 0, 1, 1,
-0.9792888, 0.1404222, -0.5586426, 0, 0, 0, 1, 1,
-0.9772835, -0.7709349, -1.88576, 1, 1, 1, 1, 1,
-0.9770885, 0.1603757, -3.168837, 1, 1, 1, 1, 1,
-0.9756649, -0.9528652, -1.948491, 1, 1, 1, 1, 1,
-0.9708604, 1.793501, -0.4857548, 1, 1, 1, 1, 1,
-0.961728, 0.2724411, -1.456769, 1, 1, 1, 1, 1,
-0.9598523, 0.6648534, -1.891494, 1, 1, 1, 1, 1,
-0.9585914, -0.5391004, -3.78899, 1, 1, 1, 1, 1,
-0.9538241, 1.147986, -0.9043939, 1, 1, 1, 1, 1,
-0.9504808, -1.415519, -2.511724, 1, 1, 1, 1, 1,
-0.9332117, -1.025543, -0.7572222, 1, 1, 1, 1, 1,
-0.9327389, 1.325928, -1.782465, 1, 1, 1, 1, 1,
-0.9286354, -1.499441, -1.530613, 1, 1, 1, 1, 1,
-0.919554, -1.178684, -1.969524, 1, 1, 1, 1, 1,
-0.9167625, -0.322697, -0.646014, 1, 1, 1, 1, 1,
-0.9144905, 0.6960364, -0.4204393, 1, 1, 1, 1, 1,
-0.9005221, -0.2090309, -1.736876, 0, 0, 1, 1, 1,
-0.8998173, -0.6073201, -1.096702, 1, 0, 0, 1, 1,
-0.8989356, -0.7381901, -1.909, 1, 0, 0, 1, 1,
-0.8977049, -2.646778, -2.788942, 1, 0, 0, 1, 1,
-0.886106, -0.08845672, -1.03718, 1, 0, 0, 1, 1,
-0.8846173, -0.8252907, -2.11806, 1, 0, 0, 1, 1,
-0.8835757, 0.8615263, -1.004984, 0, 0, 0, 1, 1,
-0.8797725, -0.5064656, -1.897917, 0, 0, 0, 1, 1,
-0.8792577, -0.6472994, -2.030122, 0, 0, 0, 1, 1,
-0.876451, -0.6844963, -1.347263, 0, 0, 0, 1, 1,
-0.8652171, 0.1786885, -2.622039, 0, 0, 0, 1, 1,
-0.8638555, 1.158221, -0.5324963, 0, 0, 0, 1, 1,
-0.8627028, -1.271098, -4.144387, 0, 0, 0, 1, 1,
-0.8589204, -0.05742897, -2.337311, 1, 1, 1, 1, 1,
-0.8547471, -0.8216608, -0.5369529, 1, 1, 1, 1, 1,
-0.8485043, 1.153976, 1.342288, 1, 1, 1, 1, 1,
-0.8478708, -0.9881513, -2.155077, 1, 1, 1, 1, 1,
-0.8441499, -2.000575, -2.895929, 1, 1, 1, 1, 1,
-0.8398445, 1.318013, -0.1913528, 1, 1, 1, 1, 1,
-0.8394622, -0.6639495, -1.613138, 1, 1, 1, 1, 1,
-0.8384099, -0.09354136, -2.340453, 1, 1, 1, 1, 1,
-0.8374205, -1.095822, -1.323311, 1, 1, 1, 1, 1,
-0.8349467, 1.113207, -0.6326713, 1, 1, 1, 1, 1,
-0.8338246, -0.3889483, -2.492487, 1, 1, 1, 1, 1,
-0.8337451, -0.08523316, -1.949375, 1, 1, 1, 1, 1,
-0.8283634, -0.9905131, -2.499449, 1, 1, 1, 1, 1,
-0.828008, -0.3690943, -2.841555, 1, 1, 1, 1, 1,
-0.8099805, -0.3693555, -1.027086, 1, 1, 1, 1, 1,
-0.8017592, -2.90693, -2.432115, 0, 0, 1, 1, 1,
-0.799616, -0.2584354, -1.081262, 1, 0, 0, 1, 1,
-0.7981186, -1.060107, -1.297278, 1, 0, 0, 1, 1,
-0.7959951, 0.08819383, -0.8121592, 1, 0, 0, 1, 1,
-0.7751933, 0.1454474, -2.697905, 1, 0, 0, 1, 1,
-0.7731919, 0.5907802, -0.82791, 1, 0, 0, 1, 1,
-0.7723525, 0.07137555, -0.7482347, 0, 0, 0, 1, 1,
-0.7710713, 0.2051878, -2.287237, 0, 0, 0, 1, 1,
-0.766354, 1.856624, -0.04450363, 0, 0, 0, 1, 1,
-0.7646798, 1.699446, 0.9052832, 0, 0, 0, 1, 1,
-0.7554582, -0.6674335, -1.64433, 0, 0, 0, 1, 1,
-0.7545074, -0.2439835, -2.554915, 0, 0, 0, 1, 1,
-0.7539362, -0.2464809, -2.104928, 0, 0, 0, 1, 1,
-0.7482533, 0.7334999, -2.411876, 1, 1, 1, 1, 1,
-0.7482154, 0.4861969, -1.196159, 1, 1, 1, 1, 1,
-0.7432882, -2.126814, -4.077954, 1, 1, 1, 1, 1,
-0.7403045, 0.1292708, -1.564537, 1, 1, 1, 1, 1,
-0.7369389, -0.1919739, -1.539847, 1, 1, 1, 1, 1,
-0.7356168, 0.5101653, -2.357601, 1, 1, 1, 1, 1,
-0.7292483, 1.54262, -0.5479322, 1, 1, 1, 1, 1,
-0.727763, 0.4324637, -0.6743808, 1, 1, 1, 1, 1,
-0.7178854, 0.534165, -1.511538, 1, 1, 1, 1, 1,
-0.7113287, 0.9135201, 0.7943395, 1, 1, 1, 1, 1,
-0.7107224, 0.1980271, -3.381603, 1, 1, 1, 1, 1,
-0.7071831, -0.7340799, -2.183357, 1, 1, 1, 1, 1,
-0.6984069, 0.5823217, -0.3073736, 1, 1, 1, 1, 1,
-0.6963875, 2.567434, -1.394269, 1, 1, 1, 1, 1,
-0.6890223, -0.5274919, -2.570954, 1, 1, 1, 1, 1,
-0.6884333, 0.4879144, -0.4088779, 0, 0, 1, 1, 1,
-0.6804677, 1.099335, -1.75249, 1, 0, 0, 1, 1,
-0.6804544, -0.2544589, -0.7611498, 1, 0, 0, 1, 1,
-0.6763209, -0.9208365, -1.676944, 1, 0, 0, 1, 1,
-0.6754193, -0.2586595, -0.9945655, 1, 0, 0, 1, 1,
-0.671534, -0.04865461, -2.451495, 1, 0, 0, 1, 1,
-0.6677921, 0.05551486, -3.312238, 0, 0, 0, 1, 1,
-0.6674373, 0.5569633, -1.124165, 0, 0, 0, 1, 1,
-0.6642573, 1.775155, -0.7171779, 0, 0, 0, 1, 1,
-0.6638068, 0.7757933, -0.4223329, 0, 0, 0, 1, 1,
-0.656656, -0.1431554, -0.9445058, 0, 0, 0, 1, 1,
-0.6524356, 0.2282865, -1.904237, 0, 0, 0, 1, 1,
-0.644457, -0.6319275, -1.192054, 0, 0, 0, 1, 1,
-0.6429501, -1.958709, -3.28291, 1, 1, 1, 1, 1,
-0.6391611, 0.0653988, -0.2888426, 1, 1, 1, 1, 1,
-0.6388642, -0.8604205, -1.762437, 1, 1, 1, 1, 1,
-0.6355841, -0.938875, -0.6759049, 1, 1, 1, 1, 1,
-0.6338547, -0.7630339, -1.995215, 1, 1, 1, 1, 1,
-0.6295059, -0.02596444, -2.023031, 1, 1, 1, 1, 1,
-0.6278714, -0.3301127, -1.91017, 1, 1, 1, 1, 1,
-0.6196719, 0.5243992, 0.07760262, 1, 1, 1, 1, 1,
-0.6194166, -0.9437531, -2.23858, 1, 1, 1, 1, 1,
-0.611208, -1.905403, -2.222233, 1, 1, 1, 1, 1,
-0.608344, -0.4089701, -1.191267, 1, 1, 1, 1, 1,
-0.602478, 0.140232, -1.005263, 1, 1, 1, 1, 1,
-0.6009446, 0.06414288, -0.3808972, 1, 1, 1, 1, 1,
-0.5977178, -0.6257614, -2.721475, 1, 1, 1, 1, 1,
-0.5958133, -0.8489835, -3.234979, 1, 1, 1, 1, 1,
-0.5954558, 1.861752, -0.9714844, 0, 0, 1, 1, 1,
-0.5942528, 0.1793435, -1.352795, 1, 0, 0, 1, 1,
-0.5895039, 0.7237928, -0.432828, 1, 0, 0, 1, 1,
-0.5872253, -1.390782, -2.563058, 1, 0, 0, 1, 1,
-0.5766314, 2.128922, -0.2316782, 1, 0, 0, 1, 1,
-0.5745734, 0.8639948, 2.409981, 1, 0, 0, 1, 1,
-0.5721493, 0.1272688, -0.7584664, 0, 0, 0, 1, 1,
-0.5720994, 1.160823, -1.532549, 0, 0, 0, 1, 1,
-0.5664918, -0.9873584, -1.904364, 0, 0, 0, 1, 1,
-0.566195, -0.7083675, -0.3802223, 0, 0, 0, 1, 1,
-0.5660335, -0.2695462, -2.898936, 0, 0, 0, 1, 1,
-0.5654864, -0.6565461, -4.101733, 0, 0, 0, 1, 1,
-0.5629625, -0.6762004, -4.142925, 0, 0, 0, 1, 1,
-0.5581182, -0.6045395, -2.197885, 1, 1, 1, 1, 1,
-0.5564107, -1.317293, -3.421102, 1, 1, 1, 1, 1,
-0.5546423, -1.191917, -4.202746, 1, 1, 1, 1, 1,
-0.5538658, 1.12051, 0.2295105, 1, 1, 1, 1, 1,
-0.5525648, -0.3692894, -1.087018, 1, 1, 1, 1, 1,
-0.5481886, -1.154022, -0.6716282, 1, 1, 1, 1, 1,
-0.5453519, 0.6071784, -0.4917321, 1, 1, 1, 1, 1,
-0.5430736, -0.6166821, -2.182786, 1, 1, 1, 1, 1,
-0.5427407, 1.210056, -1.186031, 1, 1, 1, 1, 1,
-0.5365112, -1.06579, 0.5497412, 1, 1, 1, 1, 1,
-0.5341803, -1.08932, -1.944526, 1, 1, 1, 1, 1,
-0.5329408, -1.703143, -3.416776, 1, 1, 1, 1, 1,
-0.5270298, -1.057178, -2.638517, 1, 1, 1, 1, 1,
-0.5254285, 0.7205545, 1.73913, 1, 1, 1, 1, 1,
-0.5252947, -1.429362, -1.904696, 1, 1, 1, 1, 1,
-0.5166805, 0.03659666, -0.4415489, 0, 0, 1, 1, 1,
-0.515613, 0.341323, -1.111495, 1, 0, 0, 1, 1,
-0.513495, -0.4726687, -1.334782, 1, 0, 0, 1, 1,
-0.5084291, -2.181114, -4.119283, 1, 0, 0, 1, 1,
-0.5074587, -1.056228, -2.473421, 1, 0, 0, 1, 1,
-0.5061905, 0.1046933, -0.8879718, 1, 0, 0, 1, 1,
-0.5061867, -2.070856, -1.712326, 0, 0, 0, 1, 1,
-0.5051187, -1.590427, -2.612895, 0, 0, 0, 1, 1,
-0.5033919, 1.096196, -0.4975217, 0, 0, 0, 1, 1,
-0.5031575, 0.3245533, -1.665201, 0, 0, 0, 1, 1,
-0.5013578, -2.129295, -2.746622, 0, 0, 0, 1, 1,
-0.5010359, 0.6451852, 0.4400743, 0, 0, 0, 1, 1,
-0.4890158, 0.06288689, -1.516642, 0, 0, 0, 1, 1,
-0.4776102, -0.2738849, -1.269388, 1, 1, 1, 1, 1,
-0.4775183, 1.986943, 0.8837432, 1, 1, 1, 1, 1,
-0.4746724, -0.0556697, -1.885206, 1, 1, 1, 1, 1,
-0.4743729, -2.873848, -2.367848, 1, 1, 1, 1, 1,
-0.473313, 0.5008073, -0.1457559, 1, 1, 1, 1, 1,
-0.4731963, -0.3314686, -2.951736, 1, 1, 1, 1, 1,
-0.466461, -0.4692689, -3.75487, 1, 1, 1, 1, 1,
-0.4634488, -0.5480443, -2.022035, 1, 1, 1, 1, 1,
-0.4557832, 1.10697, 0.3880475, 1, 1, 1, 1, 1,
-0.4541711, 1.44759, -0.1639883, 1, 1, 1, 1, 1,
-0.4492759, -0.4767673, -2.108769, 1, 1, 1, 1, 1,
-0.4404976, -0.1492383, -1.945299, 1, 1, 1, 1, 1,
-0.4381368, 0.7128239, -0.1989362, 1, 1, 1, 1, 1,
-0.4359224, 1.774522, 0.5789538, 1, 1, 1, 1, 1,
-0.4356817, 1.187404, 1.306268, 1, 1, 1, 1, 1,
-0.4324541, 0.1249259, -1.612075, 0, 0, 1, 1, 1,
-0.4282372, -1.0987, -4.247453, 1, 0, 0, 1, 1,
-0.427759, 0.1764746, -1.824555, 1, 0, 0, 1, 1,
-0.4267806, -1.245484, -2.984105, 1, 0, 0, 1, 1,
-0.4259299, -0.720266, -2.589624, 1, 0, 0, 1, 1,
-0.4243264, -0.5696296, -1.48489, 1, 0, 0, 1, 1,
-0.4236191, 1.49455, -2.177382, 0, 0, 0, 1, 1,
-0.4234496, 1.300385, 0.1029284, 0, 0, 0, 1, 1,
-0.4226234, -0.09279352, -1.239049, 0, 0, 0, 1, 1,
-0.4200402, -1.44422, -2.120449, 0, 0, 0, 1, 1,
-0.4193254, -0.7486598, -2.312995, 0, 0, 0, 1, 1,
-0.4191569, -1.069616, -2.968714, 0, 0, 0, 1, 1,
-0.417172, 0.9830784, -1.16003, 0, 0, 0, 1, 1,
-0.413428, -1.33915, -0.4800651, 1, 1, 1, 1, 1,
-0.4133607, 0.3345894, -1.175017, 1, 1, 1, 1, 1,
-0.4107698, -1.425152, -3.23659, 1, 1, 1, 1, 1,
-0.4102366, 0.4331093, 0.8697698, 1, 1, 1, 1, 1,
-0.399177, -2.227412, -2.892677, 1, 1, 1, 1, 1,
-0.3928094, -0.1622652, -3.07508, 1, 1, 1, 1, 1,
-0.3905648, -0.07529774, -2.215118, 1, 1, 1, 1, 1,
-0.3816536, 0.00260229, 0.880161, 1, 1, 1, 1, 1,
-0.3774557, 0.9439929, 0.5241491, 1, 1, 1, 1, 1,
-0.3752159, 1.003091, -0.6111761, 1, 1, 1, 1, 1,
-0.3705122, -0.006210124, -2.035309, 1, 1, 1, 1, 1,
-0.3673265, -0.02126458, -3.536062, 1, 1, 1, 1, 1,
-0.3646744, -0.05864673, -2.543253, 1, 1, 1, 1, 1,
-0.3599397, -0.3837209, -2.927296, 1, 1, 1, 1, 1,
-0.3583316, -0.2050441, -3.433779, 1, 1, 1, 1, 1,
-0.3561302, -0.838827, -2.3603, 0, 0, 1, 1, 1,
-0.3550124, -1.078984, -1.950474, 1, 0, 0, 1, 1,
-0.3535236, -0.5503599, -0.8861901, 1, 0, 0, 1, 1,
-0.3532537, -0.08572675, -2.021714, 1, 0, 0, 1, 1,
-0.3503189, -0.218039, -2.839032, 1, 0, 0, 1, 1,
-0.3497579, 1.642672, 1.493427, 1, 0, 0, 1, 1,
-0.3493362, 0.9217892, -1.024219, 0, 0, 0, 1, 1,
-0.3490424, -0.4124112, -4.817568, 0, 0, 0, 1, 1,
-0.3479612, -0.7401072, -1.491141, 0, 0, 0, 1, 1,
-0.3478872, -0.2172496, -1.607568, 0, 0, 0, 1, 1,
-0.3425495, -1.672653, -2.698673, 0, 0, 0, 1, 1,
-0.339338, 0.4669864, 0.2573758, 0, 0, 0, 1, 1,
-0.3370923, -0.4632802, -2.725827, 0, 0, 0, 1, 1,
-0.3360364, 0.03310428, -3.143325, 1, 1, 1, 1, 1,
-0.3320285, -0.3348728, -1.340954, 1, 1, 1, 1, 1,
-0.3298353, 0.9673303, 1.472283, 1, 1, 1, 1, 1,
-0.3289337, -0.6258465, -2.325197, 1, 1, 1, 1, 1,
-0.327408, 0.5604502, -1.752684, 1, 1, 1, 1, 1,
-0.3231403, -1.291591, -1.57205, 1, 1, 1, 1, 1,
-0.3219914, -0.6093903, -3.186189, 1, 1, 1, 1, 1,
-0.3102943, 1.048741, -0.3773092, 1, 1, 1, 1, 1,
-0.2985329, 0.1957232, 0.3824896, 1, 1, 1, 1, 1,
-0.2964495, 1.146637, 0.5684494, 1, 1, 1, 1, 1,
-0.2957764, -1.152075, -4.585828, 1, 1, 1, 1, 1,
-0.2944067, -0.8117547, -5.069544, 1, 1, 1, 1, 1,
-0.2922451, 0.9164136, -1.54937, 1, 1, 1, 1, 1,
-0.2892486, 0.1864357, -2.175716, 1, 1, 1, 1, 1,
-0.2847223, -0.8528993, -2.119619, 1, 1, 1, 1, 1,
-0.2835381, 0.9989344, -1.138628, 0, 0, 1, 1, 1,
-0.2781378, -0.4870468, -2.641833, 1, 0, 0, 1, 1,
-0.270541, 0.8771302, 0.7577512, 1, 0, 0, 1, 1,
-0.2674933, -2.61928, -2.867552, 1, 0, 0, 1, 1,
-0.2664414, 0.2726547, -0.3002632, 1, 0, 0, 1, 1,
-0.2642081, 0.8046292, 0.0338167, 1, 0, 0, 1, 1,
-0.2595617, -1.194434, -4.16398, 0, 0, 0, 1, 1,
-0.2591198, -0.3062103, -2.630458, 0, 0, 0, 1, 1,
-0.2574229, -0.3785535, -1.540026, 0, 0, 0, 1, 1,
-0.2519426, 0.456422, -2.151257, 0, 0, 0, 1, 1,
-0.2432014, -0.8849714, -2.670192, 0, 0, 0, 1, 1,
-0.2427674, 0.2922809, -0.9531916, 0, 0, 0, 1, 1,
-0.2414412, -0.1882558, -1.791185, 0, 0, 0, 1, 1,
-0.2393989, -0.6250354, -5.069111, 1, 1, 1, 1, 1,
-0.2374402, 0.5464835, -0.700008, 1, 1, 1, 1, 1,
-0.2358613, -0.6739543, -2.236417, 1, 1, 1, 1, 1,
-0.2356994, 0.2597548, -0.6518135, 1, 1, 1, 1, 1,
-0.2317061, 1.810673, -1.035476, 1, 1, 1, 1, 1,
-0.2288474, -1.087946, -2.634789, 1, 1, 1, 1, 1,
-0.22862, -1.33927, -2.815527, 1, 1, 1, 1, 1,
-0.2284914, 2.05684, 0.2216604, 1, 1, 1, 1, 1,
-0.226935, 0.06947868, -1.393751, 1, 1, 1, 1, 1,
-0.2231554, -0.3895351, -3.377755, 1, 1, 1, 1, 1,
-0.2216788, -1.872536, -4.290608, 1, 1, 1, 1, 1,
-0.214208, 0.05406236, -1.249426, 1, 1, 1, 1, 1,
-0.2120719, -1.794476, -3.340156, 1, 1, 1, 1, 1,
-0.2101848, -1.341066, -3.39852, 1, 1, 1, 1, 1,
-0.2083733, 0.5731099, -2.632088, 1, 1, 1, 1, 1,
-0.2067741, 0.3120905, -2.370491, 0, 0, 1, 1, 1,
-0.2051525, 0.9527562, 0.1875796, 1, 0, 0, 1, 1,
-0.2022974, 0.8894545, -1.963032, 1, 0, 0, 1, 1,
-0.2020757, -0.2866859, -2.651816, 1, 0, 0, 1, 1,
-0.1977047, -1.374234, -0.9219487, 1, 0, 0, 1, 1,
-0.1944692, -0.2233658, -2.241785, 1, 0, 0, 1, 1,
-0.1934539, 1.975535, 0.6707217, 0, 0, 0, 1, 1,
-0.1919317, -2.689849, -4.240522, 0, 0, 0, 1, 1,
-0.1894551, -1.772374, -2.261374, 0, 0, 0, 1, 1,
-0.1873085, 1.17254, -1.165685, 0, 0, 0, 1, 1,
-0.1865991, -1.089134, -4.215112, 0, 0, 0, 1, 1,
-0.1844413, -0.6783796, -4.034646, 0, 0, 0, 1, 1,
-0.1840616, -0.2767208, -1.603016, 0, 0, 0, 1, 1,
-0.1787517, 0.01000695, -1.056006, 1, 1, 1, 1, 1,
-0.1772849, 1.316696, 0.5220193, 1, 1, 1, 1, 1,
-0.1757813, 1.4856, -0.4808403, 1, 1, 1, 1, 1,
-0.1722839, 0.03086697, -2.005831, 1, 1, 1, 1, 1,
-0.1701077, -0.4231308, -4.072275, 1, 1, 1, 1, 1,
-0.1680151, -0.07055971, -2.255689, 1, 1, 1, 1, 1,
-0.1603499, 0.3007566, -1.185493, 1, 1, 1, 1, 1,
-0.1594671, 1.17126, 0.8833683, 1, 1, 1, 1, 1,
-0.1538478, 1.041187, 0.007583674, 1, 1, 1, 1, 1,
-0.1528934, -0.1919456, -1.366092, 1, 1, 1, 1, 1,
-0.1502799, 0.5411278, -0.8959802, 1, 1, 1, 1, 1,
-0.1491928, -0.4879946, -2.348293, 1, 1, 1, 1, 1,
-0.1451581, -0.7233969, -2.437876, 1, 1, 1, 1, 1,
-0.1410899, 0.2969707, -2.198672, 1, 1, 1, 1, 1,
-0.1405723, -0.4260629, -0.4864079, 1, 1, 1, 1, 1,
-0.1328352, 0.1784544, -0.724787, 0, 0, 1, 1, 1,
-0.1306604, 0.02708455, -0.4363298, 1, 0, 0, 1, 1,
-0.1258364, 0.6465897, 1.205537, 1, 0, 0, 1, 1,
-0.1256139, 1.036851, -0.6990813, 1, 0, 0, 1, 1,
-0.123968, 0.859107, 2.264588, 1, 0, 0, 1, 1,
-0.1232945, -0.2068136, -3.961269, 1, 0, 0, 1, 1,
-0.1175745, -1.173368, -4.293402, 0, 0, 0, 1, 1,
-0.1142792, -1.326084, -2.562129, 0, 0, 0, 1, 1,
-0.1126897, -1.573564, -2.37699, 0, 0, 0, 1, 1,
-0.1120043, 1.539669, -0.1407087, 0, 0, 0, 1, 1,
-0.1107198, 2.101796, 1.198866, 0, 0, 0, 1, 1,
-0.1094949, -0.7310728, -4.613877, 0, 0, 0, 1, 1,
-0.1074871, 0.120029, -2.531251, 0, 0, 0, 1, 1,
-0.1065094, 0.6312384, 0.09055819, 1, 1, 1, 1, 1,
-0.1054933, -0.4986173, -2.978468, 1, 1, 1, 1, 1,
-0.09985953, 2.05821, -1.687101, 1, 1, 1, 1, 1,
-0.09890763, 0.8482286, 1.742847, 1, 1, 1, 1, 1,
-0.09140501, -0.5185496, -3.583675, 1, 1, 1, 1, 1,
-0.08880641, -0.3941591, -4.0611, 1, 1, 1, 1, 1,
-0.08825768, 0.8529295, -0.9831427, 1, 1, 1, 1, 1,
-0.08658863, 1.648295, 0.3802806, 1, 1, 1, 1, 1,
-0.08631174, -0.4190592, -2.617397, 1, 1, 1, 1, 1,
-0.08294968, -0.9925426, -3.946253, 1, 1, 1, 1, 1,
-0.08137789, 0.2131386, -1.054267, 1, 1, 1, 1, 1,
-0.07934742, 0.8952953, -1.346248, 1, 1, 1, 1, 1,
-0.07676561, -0.7083518, -1.404202, 1, 1, 1, 1, 1,
-0.07427046, -0.5844445, -3.417908, 1, 1, 1, 1, 1,
-0.07109337, -0.08004851, -1.405269, 1, 1, 1, 1, 1,
-0.06912665, 0.1073822, 8.688008e-05, 0, 0, 1, 1, 1,
-0.06664634, -0.05806091, -2.581877, 1, 0, 0, 1, 1,
-0.06657225, 0.30355, -0.5274152, 1, 0, 0, 1, 1,
-0.06443951, 1.557619, 0.473868, 1, 0, 0, 1, 1,
-0.0636339, 0.8433967, -2.367697, 1, 0, 0, 1, 1,
-0.06080608, -0.7138821, -3.054702, 1, 0, 0, 1, 1,
-0.05892321, 0.6048948, -0.5886428, 0, 0, 0, 1, 1,
-0.05779504, 0.8403935, -2.23481, 0, 0, 0, 1, 1,
-0.0572058, 0.458626, -0.3540629, 0, 0, 0, 1, 1,
-0.05696066, 0.5329101, -0.238379, 0, 0, 0, 1, 1,
-0.056741, 0.8978466, 0.7182817, 0, 0, 0, 1, 1,
-0.05412756, -0.4304795, -3.158527, 0, 0, 0, 1, 1,
-0.04542846, 0.08503069, 0.6531522, 0, 0, 0, 1, 1,
-0.04488795, 0.2265091, -0.4182349, 1, 1, 1, 1, 1,
-0.03593744, 1.20202, 1.629028, 1, 1, 1, 1, 1,
-0.03561317, -0.4368788, -5.34052, 1, 1, 1, 1, 1,
-0.03184157, 1.362731, 1.634582, 1, 1, 1, 1, 1,
-0.02720666, 0.8228258, 0.7149774, 1, 1, 1, 1, 1,
-0.02663184, -0.3096029, -4.063271, 1, 1, 1, 1, 1,
-0.02633399, -0.6008822, -1.799464, 1, 1, 1, 1, 1,
-0.02238196, 0.4801168, -1.303149, 1, 1, 1, 1, 1,
-0.02162098, -0.5444927, -3.578918, 1, 1, 1, 1, 1,
-0.02090471, 0.9102045, -0.4205975, 1, 1, 1, 1, 1,
-0.01756878, -2.035105, -3.143723, 1, 1, 1, 1, 1,
-0.0174273, 0.6250941, -1.00162, 1, 1, 1, 1, 1,
-0.01406709, -0.08113693, -3.76023, 1, 1, 1, 1, 1,
-0.007166914, -0.9576104, -3.054485, 1, 1, 1, 1, 1,
-0.003661362, 1.891926, 0.1169503, 1, 1, 1, 1, 1,
0.0001172116, 0.5908238, 0.2643175, 0, 0, 1, 1, 1,
0.0011161, 1.951054, -0.05868121, 1, 0, 0, 1, 1,
0.002863102, 1.057608, 0.6936643, 1, 0, 0, 1, 1,
0.00748431, 2.112218, -0.1318657, 1, 0, 0, 1, 1,
0.009086584, -0.9081996, 4.145139, 1, 0, 0, 1, 1,
0.01123339, -0.4722837, 3.332148, 1, 0, 0, 1, 1,
0.01154796, 0.3010645, 0.467546, 0, 0, 0, 1, 1,
0.02065939, 0.0565028, 1.124437, 0, 0, 0, 1, 1,
0.02201882, 0.7284014, 0.2569256, 0, 0, 0, 1, 1,
0.02371773, -0.3719461, 3.208728, 0, 0, 0, 1, 1,
0.02559579, 0.3460791, 0.05962889, 0, 0, 0, 1, 1,
0.02973231, -1.253548, 1.500737, 0, 0, 0, 1, 1,
0.03122106, 3.396462, 0.1501297, 0, 0, 0, 1, 1,
0.03216887, -0.1409443, 4.623147, 1, 1, 1, 1, 1,
0.03292081, -0.1114711, 3.599595, 1, 1, 1, 1, 1,
0.03332454, 0.6008469, -0.1741, 1, 1, 1, 1, 1,
0.03682358, 0.2264239, 2.607589, 1, 1, 1, 1, 1,
0.03693227, 0.2779433, -0.6490446, 1, 1, 1, 1, 1,
0.03765348, 1.834367, 0.1417589, 1, 1, 1, 1, 1,
0.04004015, 1.169171, 1.70171, 1, 1, 1, 1, 1,
0.04523497, -0.1925969, 3.514202, 1, 1, 1, 1, 1,
0.04642424, 1.192838, -0.9746402, 1, 1, 1, 1, 1,
0.0477845, 0.3473418, -1.467758, 1, 1, 1, 1, 1,
0.05175951, 0.6479992, 0.7286822, 1, 1, 1, 1, 1,
0.05245735, 0.9235486, 0.2339336, 1, 1, 1, 1, 1,
0.05440569, -1.107588, 4.094417, 1, 1, 1, 1, 1,
0.05612103, -0.9129896, 3.105893, 1, 1, 1, 1, 1,
0.05970367, -0.253461, 2.948128, 1, 1, 1, 1, 1,
0.07148256, 0.04876586, 1.02556, 0, 0, 1, 1, 1,
0.07544218, 0.6829069, 1.428485, 1, 0, 0, 1, 1,
0.07598216, -0.7407711, 1.273892, 1, 0, 0, 1, 1,
0.0780818, 0.330298, 1.181809, 1, 0, 0, 1, 1,
0.08353283, 1.665006, -0.7983441, 1, 0, 0, 1, 1,
0.08798625, -0.8364649, 5.043517, 1, 0, 0, 1, 1,
0.08841255, -0.6347014, 4.973629, 0, 0, 0, 1, 1,
0.09177887, -0.6460041, 5.078981, 0, 0, 0, 1, 1,
0.09180407, -0.6328862, 4.214948, 0, 0, 0, 1, 1,
0.09348709, -0.5491805, 0.7817245, 0, 0, 0, 1, 1,
0.0983351, -0.08235595, 2.715465, 0, 0, 0, 1, 1,
0.1027348, -2.009003, 2.849323, 0, 0, 0, 1, 1,
0.1054932, -0.7006932, 3.211285, 0, 0, 0, 1, 1,
0.1072613, -0.2447322, 3.691133, 1, 1, 1, 1, 1,
0.1077661, 0.744003, 1.890831, 1, 1, 1, 1, 1,
0.1150671, -0.01905547, 1.301108, 1, 1, 1, 1, 1,
0.1172988, -1.037808, 3.060287, 1, 1, 1, 1, 1,
0.1180124, 0.2305091, 0.1909573, 1, 1, 1, 1, 1,
0.1192519, 2.182035, -1.160797, 1, 1, 1, 1, 1,
0.1275227, 0.8920604, 0.4649204, 1, 1, 1, 1, 1,
0.1292815, -1.656683, 5.168928, 1, 1, 1, 1, 1,
0.1310365, -0.2584205, 0.4020867, 1, 1, 1, 1, 1,
0.1315824, 1.759752, 0.7954947, 1, 1, 1, 1, 1,
0.1329709, -0.1652962, 3.228864, 1, 1, 1, 1, 1,
0.1355299, 0.2057061, 0.872683, 1, 1, 1, 1, 1,
0.1360883, 0.6379297, 1.097434, 1, 1, 1, 1, 1,
0.1400682, 1.949103, 0.7610993, 1, 1, 1, 1, 1,
0.1488267, -0.4216101, 2.439127, 1, 1, 1, 1, 1,
0.1493889, 0.5947155, -0.7033979, 0, 0, 1, 1, 1,
0.1508187, 0.1199711, 0.6790555, 1, 0, 0, 1, 1,
0.1528645, 1.0185, -0.4019496, 1, 0, 0, 1, 1,
0.1538303, -0.2063517, 3.730947, 1, 0, 0, 1, 1,
0.1546421, 0.9170516, 0.6773497, 1, 0, 0, 1, 1,
0.1601551, 1.25661, 0.6853316, 1, 0, 0, 1, 1,
0.1627643, -0.98414, 4.107072, 0, 0, 0, 1, 1,
0.1643505, 0.2552271, -0.1758468, 0, 0, 0, 1, 1,
0.1662034, 0.7965359, 1.355726, 0, 0, 0, 1, 1,
0.1662902, -0.9180691, 3.011674, 0, 0, 0, 1, 1,
0.1665158, 0.09284345, 0.7129624, 0, 0, 0, 1, 1,
0.1673946, -1.876992, 3.910703, 0, 0, 0, 1, 1,
0.1676001, 1.955028, 0.1802698, 0, 0, 0, 1, 1,
0.1747839, -0.8429885, 1.763624, 1, 1, 1, 1, 1,
0.1758265, 0.3026229, 2.44047, 1, 1, 1, 1, 1,
0.1766398, 0.2610388, 0.90668, 1, 1, 1, 1, 1,
0.1776223, 0.713567, -0.4839219, 1, 1, 1, 1, 1,
0.1782736, 0.8394214, -1.197498, 1, 1, 1, 1, 1,
0.1817743, 2.049328, -1.401243, 1, 1, 1, 1, 1,
0.1822705, -1.076211, 3.652995, 1, 1, 1, 1, 1,
0.1828037, 1.424508, -0.637515, 1, 1, 1, 1, 1,
0.1829284, -1.0287, 1.875077, 1, 1, 1, 1, 1,
0.1847096, 1.144879, -0.5778242, 1, 1, 1, 1, 1,
0.1857632, 0.9010755, -0.9931377, 1, 1, 1, 1, 1,
0.1887024, 0.381584, 1.837933, 1, 1, 1, 1, 1,
0.1893457, -0.2822201, 2.680641, 1, 1, 1, 1, 1,
0.1911192, 1.602743, 0.9373603, 1, 1, 1, 1, 1,
0.1915249, 2.208731, 0.4223042, 1, 1, 1, 1, 1,
0.2034703, 1.64096, -0.7876489, 0, 0, 1, 1, 1,
0.2052686, 0.9029402, -0.1506132, 1, 0, 0, 1, 1,
0.2057088, -0.1682804, 1.559517, 1, 0, 0, 1, 1,
0.2090033, 0.8574367, 0.4644283, 1, 0, 0, 1, 1,
0.2105117, 1.717453, 0.6065015, 1, 0, 0, 1, 1,
0.2109768, 0.3365795, -0.3034396, 1, 0, 0, 1, 1,
0.2149793, 0.4161907, 1.969243, 0, 0, 0, 1, 1,
0.2151471, -0.4959778, 2.243361, 0, 0, 0, 1, 1,
0.2170911, 0.2080385, 2.492304, 0, 0, 0, 1, 1,
0.2252254, -1.025241, 2.416582, 0, 0, 0, 1, 1,
0.2263624, -1.120459, 3.927583, 0, 0, 0, 1, 1,
0.2354264, -0.3132088, 1.075352, 0, 0, 0, 1, 1,
0.2358738, 0.9496671, -2.096784, 0, 0, 0, 1, 1,
0.2481982, 2.002242, -0.0458035, 1, 1, 1, 1, 1,
0.2493226, -0.2178965, 3.704149, 1, 1, 1, 1, 1,
0.2556247, 1.867091, -3.09564, 1, 1, 1, 1, 1,
0.2556998, 0.7651856, -0.1984127, 1, 1, 1, 1, 1,
0.2558522, -0.4881977, 2.156995, 1, 1, 1, 1, 1,
0.2632631, -1.529548, 2.689172, 1, 1, 1, 1, 1,
0.2656381, 0.7738531, 1.422186, 1, 1, 1, 1, 1,
0.2711232, 0.4552782, 1.216763, 1, 1, 1, 1, 1,
0.2744288, -0.5243913, 3.505441, 1, 1, 1, 1, 1,
0.2748996, 0.2904142, 2.329173, 1, 1, 1, 1, 1,
0.276636, -0.3562422, 1.999947, 1, 1, 1, 1, 1,
0.2772542, -1.688744, 1.400282, 1, 1, 1, 1, 1,
0.284877, 1.083085, 0.2433862, 1, 1, 1, 1, 1,
0.2860439, 0.009027032, 2.251023, 1, 1, 1, 1, 1,
0.2885112, -0.8940582, 2.561876, 1, 1, 1, 1, 1,
0.2894126, -0.02323156, 1.151954, 0, 0, 1, 1, 1,
0.2913792, -0.6773602, 3.633972, 1, 0, 0, 1, 1,
0.2916751, -0.9749686, 0.9889462, 1, 0, 0, 1, 1,
0.2917413, -0.9042045, 2.721198, 1, 0, 0, 1, 1,
0.2920884, 0.1243298, 3.728996, 1, 0, 0, 1, 1,
0.2939886, -1.009237, 1.298935, 1, 0, 0, 1, 1,
0.2993501, -1.477724, 2.147835, 0, 0, 0, 1, 1,
0.303921, -0.4358181, 2.359349, 0, 0, 0, 1, 1,
0.3046151, 0.9969857, -0.2021157, 0, 0, 0, 1, 1,
0.3055085, -1.486366, 3.40667, 0, 0, 0, 1, 1,
0.305944, 0.8427024, -0.6941665, 0, 0, 0, 1, 1,
0.306682, 0.02961097, 0.4471669, 0, 0, 0, 1, 1,
0.3074973, -1.218061, 2.676847, 0, 0, 0, 1, 1,
0.3109361, 0.6060118, -0.322277, 1, 1, 1, 1, 1,
0.3143381, 0.5716051, 1.289071, 1, 1, 1, 1, 1,
0.31594, 1.304734, -0.02823181, 1, 1, 1, 1, 1,
0.3211773, 0.5792091, 0.7305806, 1, 1, 1, 1, 1,
0.3224535, 0.7129975, 0.9764482, 1, 1, 1, 1, 1,
0.3237549, 0.5423617, 1.266906, 1, 1, 1, 1, 1,
0.3269184, -0.5395092, 4.196327, 1, 1, 1, 1, 1,
0.3296129, 0.03098031, 1.689717, 1, 1, 1, 1, 1,
0.3305549, -0.2118062, 2.464644, 1, 1, 1, 1, 1,
0.3308972, 0.1021011, 1.089644, 1, 1, 1, 1, 1,
0.3396755, -0.9572857, 2.799015, 1, 1, 1, 1, 1,
0.3404481, -0.4567845, 2.369798, 1, 1, 1, 1, 1,
0.3409862, -2.019512, 1.810846, 1, 1, 1, 1, 1,
0.3446997, -1.331529, 2.837429, 1, 1, 1, 1, 1,
0.3448874, 0.6935178, 0.9741642, 1, 1, 1, 1, 1,
0.3449546, 0.0189715, 3.364243, 0, 0, 1, 1, 1,
0.345137, -0.1892362, 1.207405, 1, 0, 0, 1, 1,
0.3502662, -1.838899, 2.144157, 1, 0, 0, 1, 1,
0.35116, 2.304752, 1.108501, 1, 0, 0, 1, 1,
0.3543611, 0.4409664, -0.3402818, 1, 0, 0, 1, 1,
0.357119, -1.828964, 3.61709, 1, 0, 0, 1, 1,
0.3576143, -0.01406637, 1.740602, 0, 0, 0, 1, 1,
0.3582059, 0.9260375, -0.6245507, 0, 0, 0, 1, 1,
0.3583212, 0.1325978, -0.008796182, 0, 0, 0, 1, 1,
0.3588466, -0.2619151, 3.324684, 0, 0, 0, 1, 1,
0.3632212, 0.2140196, 0.8571715, 0, 0, 0, 1, 1,
0.3649403, -0.6150703, 3.550956, 0, 0, 0, 1, 1,
0.3655444, -0.1464971, 2.986091, 0, 0, 0, 1, 1,
0.372707, -0.1462597, 1.767742, 1, 1, 1, 1, 1,
0.3747915, -1.250521, 2.72173, 1, 1, 1, 1, 1,
0.3776861, 0.1153328, 1.662022, 1, 1, 1, 1, 1,
0.3807397, -0.01526849, 0.1636347, 1, 1, 1, 1, 1,
0.3836675, 0.5800633, 0.4088868, 1, 1, 1, 1, 1,
0.3858034, 0.03309234, 1.426685, 1, 1, 1, 1, 1,
0.391791, -0.2506129, 4.050941, 1, 1, 1, 1, 1,
0.3918318, 1.310155, -0.6060936, 1, 1, 1, 1, 1,
0.3928992, 1.232669, 1.19416, 1, 1, 1, 1, 1,
0.394976, -2.222931, 4.355522, 1, 1, 1, 1, 1,
0.3977148, -1.038109, 1.404654, 1, 1, 1, 1, 1,
0.4017885, 0.4804963, -0.5559458, 1, 1, 1, 1, 1,
0.4038867, 0.1795157, 2.265049, 1, 1, 1, 1, 1,
0.4039797, -1.517855, 4.111098, 1, 1, 1, 1, 1,
0.4064544, 2.092996, 0.1964479, 1, 1, 1, 1, 1,
0.4125281, 0.0971508, 2.04994, 0, 0, 1, 1, 1,
0.4128816, 0.3345191, -0.3844438, 1, 0, 0, 1, 1,
0.4143013, -1.230496, 1.855588, 1, 0, 0, 1, 1,
0.4143449, 1.868399, 1.505964, 1, 0, 0, 1, 1,
0.4148078, 0.7789882, 1.523717, 1, 0, 0, 1, 1,
0.4168956, -1.153025, 2.476089, 1, 0, 0, 1, 1,
0.4174548, 0.2047686, 1.757575, 0, 0, 0, 1, 1,
0.4211719, 0.2421127, 1.263699, 0, 0, 0, 1, 1,
0.4275717, -1.144792, 2.610811, 0, 0, 0, 1, 1,
0.4405071, 0.7585645, -0.4416941, 0, 0, 0, 1, 1,
0.4427255, -0.2688476, 3.451558, 0, 0, 0, 1, 1,
0.4439723, 0.5109001, -0.934305, 0, 0, 0, 1, 1,
0.4449628, -1.271947, 1.409084, 0, 0, 0, 1, 1,
0.4501323, -2.560126, 3.284494, 1, 1, 1, 1, 1,
0.4512196, -0.1200444, 0.1864423, 1, 1, 1, 1, 1,
0.4529291, -0.4432444, 2.471226, 1, 1, 1, 1, 1,
0.4537449, 0.4917391, 1.965132, 1, 1, 1, 1, 1,
0.4570809, 0.2560768, 3.369537, 1, 1, 1, 1, 1,
0.4573299, 1.388023, 0.6101262, 1, 1, 1, 1, 1,
0.4584387, 1.290473, 1.905565, 1, 1, 1, 1, 1,
0.4641436, 1.345057, -1.578677, 1, 1, 1, 1, 1,
0.4642094, 0.6253674, -0.6649178, 1, 1, 1, 1, 1,
0.4680364, 0.4529951, 0.9424029, 1, 1, 1, 1, 1,
0.4742038, -0.2192428, 1.83154, 1, 1, 1, 1, 1,
0.4748775, 0.5376325, 2.003875, 1, 1, 1, 1, 1,
0.4814803, 0.9890229, -0.7810234, 1, 1, 1, 1, 1,
0.4846614, 0.1722084, 0.7920749, 1, 1, 1, 1, 1,
0.4892353, 0.4675128, 1.120849, 1, 1, 1, 1, 1,
0.4994234, -0.678912, 1.183984, 0, 0, 1, 1, 1,
0.5052426, -0.3079018, 0.2097016, 1, 0, 0, 1, 1,
0.5058611, 0.609437, 1.023706, 1, 0, 0, 1, 1,
0.5074073, -0.3671724, 0.9421327, 1, 0, 0, 1, 1,
0.5092305, 0.4526774, 1.139308, 1, 0, 0, 1, 1,
0.511117, 1.543128, 0.5092264, 1, 0, 0, 1, 1,
0.5115132, 0.4648644, 1.345831, 0, 0, 0, 1, 1,
0.52134, 0.7963248, 2.598361, 0, 0, 0, 1, 1,
0.5301957, -1.180961, 2.353257, 0, 0, 0, 1, 1,
0.5313106, -1.915598, 3.130175, 0, 0, 0, 1, 1,
0.5352327, 0.5244547, 0.9702616, 0, 0, 0, 1, 1,
0.5367377, 0.2491503, 2.706576, 0, 0, 0, 1, 1,
0.5428954, 0.8432307, -0.1113526, 0, 0, 0, 1, 1,
0.5445197, -0.4159804, 1.548405, 1, 1, 1, 1, 1,
0.5466276, -0.7921945, 1.48814, 1, 1, 1, 1, 1,
0.5466922, 3.350154, 0.4506525, 1, 1, 1, 1, 1,
0.5505175, 0.302756, 0.3005957, 1, 1, 1, 1, 1,
0.5528151, 0.4304432, 0.2989459, 1, 1, 1, 1, 1,
0.5549621, 1.15941, 0.0129995, 1, 1, 1, 1, 1,
0.5552495, -1.283955, 2.636291, 1, 1, 1, 1, 1,
0.5626824, -0.4996993, 3.615182, 1, 1, 1, 1, 1,
0.5637191, 0.03165378, -0.04317458, 1, 1, 1, 1, 1,
0.5638579, -1.376344, 4.50465, 1, 1, 1, 1, 1,
0.5656267, -0.5974701, 3.741642, 1, 1, 1, 1, 1,
0.5665672, 1.258314, 0.9870256, 1, 1, 1, 1, 1,
0.5667422, -1.161889, 2.312989, 1, 1, 1, 1, 1,
0.5668943, -1.759641, 3.918616, 1, 1, 1, 1, 1,
0.5701786, 0.8032402, 1.046888, 1, 1, 1, 1, 1,
0.5804968, 1.023955, 1.394425, 0, 0, 1, 1, 1,
0.5814511, -1.106906, 4.217439, 1, 0, 0, 1, 1,
0.5910157, 0.917866, -0.5350791, 1, 0, 0, 1, 1,
0.5921478, 1.158276, -0.7723733, 1, 0, 0, 1, 1,
0.5927022, -1.860328, 1.40549, 1, 0, 0, 1, 1,
0.5932679, -1.905213, 2.301266, 1, 0, 0, 1, 1,
0.5963969, 0.4370292, 2.03841, 0, 0, 0, 1, 1,
0.6027629, -0.1629497, 2.333371, 0, 0, 0, 1, 1,
0.6067697, 0.01153443, 1.809715, 0, 0, 0, 1, 1,
0.6072354, 1.239856, 0.9407755, 0, 0, 0, 1, 1,
0.6097369, 2.227524, 0.4753252, 0, 0, 0, 1, 1,
0.6111038, -0.5292847, 3.313199, 0, 0, 0, 1, 1,
0.6137449, -0.04806742, 0.03383904, 0, 0, 0, 1, 1,
0.6140774, 0.565292, 0.7103292, 1, 1, 1, 1, 1,
0.6162729, -1.024763, 4.042514, 1, 1, 1, 1, 1,
0.62033, 1.148629, 0.840934, 1, 1, 1, 1, 1,
0.6214554, 0.4955218, 1.29795, 1, 1, 1, 1, 1,
0.6336084, 0.6942891, 0.3076595, 1, 1, 1, 1, 1,
0.6347151, 0.01903464, 1.57429, 1, 1, 1, 1, 1,
0.6455097, -0.3504307, 0.9290208, 1, 1, 1, 1, 1,
0.6458363, -0.83255, 1.839675, 1, 1, 1, 1, 1,
0.6470364, -0.5838696, 2.78407, 1, 1, 1, 1, 1,
0.6473101, 2.021364, 0.3493057, 1, 1, 1, 1, 1,
0.6509297, 1.852467, 2.111834, 1, 1, 1, 1, 1,
0.652216, -0.4192061, 1.771148, 1, 1, 1, 1, 1,
0.6566439, 1.11975, 1.221886, 1, 1, 1, 1, 1,
0.664254, 1.873628, 0.4029328, 1, 1, 1, 1, 1,
0.6662837, -0.6229534, 2.206737, 1, 1, 1, 1, 1,
0.6786365, 0.6738932, 1.172035, 0, 0, 1, 1, 1,
0.682635, 0.3461227, 1.048668, 1, 0, 0, 1, 1,
0.6905707, 0.3694379, 2.546497, 1, 0, 0, 1, 1,
0.692174, -0.4039589, 1.678371, 1, 0, 0, 1, 1,
0.6970528, -1.244856, 2.659597, 1, 0, 0, 1, 1,
0.6975898, 0.1441987, 3.627267, 1, 0, 0, 1, 1,
0.7016577, -1.269917, 3.171527, 0, 0, 0, 1, 1,
0.7049521, -0.6588855, 2.488238, 0, 0, 0, 1, 1,
0.7054317, -0.6184752, 3.490888, 0, 0, 0, 1, 1,
0.7061077, -0.4858226, 1.930825, 0, 0, 0, 1, 1,
0.7107595, 0.1760339, 0.5777206, 0, 0, 0, 1, 1,
0.7136643, -0.8745235, 4.388912, 0, 0, 0, 1, 1,
0.7138903, -0.2422729, 1.525585, 0, 0, 0, 1, 1,
0.7167726, -1.125975, 2.237946, 1, 1, 1, 1, 1,
0.7173307, 1.018098, 1.783526, 1, 1, 1, 1, 1,
0.7194789, 0.8608087, 2.126231, 1, 1, 1, 1, 1,
0.726208, 0.7945213, 0.5896471, 1, 1, 1, 1, 1,
0.7293105, 0.7406174, 0.7796915, 1, 1, 1, 1, 1,
0.7326289, 0.5377152, 2.306845, 1, 1, 1, 1, 1,
0.7370709, 1.517873, 2.056306, 1, 1, 1, 1, 1,
0.7396399, 0.1778907, 3.634781, 1, 1, 1, 1, 1,
0.7417119, 0.9192522, 1.580729, 1, 1, 1, 1, 1,
0.7495092, 0.418475, 1.016362, 1, 1, 1, 1, 1,
0.7503796, -0.7113338, 1.006102, 1, 1, 1, 1, 1,
0.7565302, -0.07027932, 0.492195, 1, 1, 1, 1, 1,
0.7605175, -0.6825342, 2.887006, 1, 1, 1, 1, 1,
0.7649121, 0.7450421, 1.479983, 1, 1, 1, 1, 1,
0.7688681, -0.9054718, 4.176743, 1, 1, 1, 1, 1,
0.7772929, -1.231301, 2.931414, 0, 0, 1, 1, 1,
0.7815888, -0.002516302, 0.5360485, 1, 0, 0, 1, 1,
0.7856972, -0.9685048, 3.362097, 1, 0, 0, 1, 1,
0.7915329, 1.496316, -0.4741673, 1, 0, 0, 1, 1,
0.7918019, 1.148661, 0.4976861, 1, 0, 0, 1, 1,
0.7919175, -0.6618865, 2.099515, 1, 0, 0, 1, 1,
0.7929513, -0.6100026, 2.534048, 0, 0, 0, 1, 1,
0.7937825, -0.5421606, 2.506266, 0, 0, 0, 1, 1,
0.7969553, 1.380014, -0.1534886, 0, 0, 0, 1, 1,
0.7996868, -0.2380688, 1.846355, 0, 0, 0, 1, 1,
0.8108521, 0.6929846, 2.642695, 0, 0, 0, 1, 1,
0.815837, 1.380401, 1.151757, 0, 0, 0, 1, 1,
0.8163964, -0.5987279, 1.851292, 0, 0, 0, 1, 1,
0.8219238, -0.2223497, 2.000233, 1, 1, 1, 1, 1,
0.8251236, 0.5084161, 1.091505, 1, 1, 1, 1, 1,
0.8267446, -0.1861136, 2.391076, 1, 1, 1, 1, 1,
0.8306019, -0.3893105, -0.02520105, 1, 1, 1, 1, 1,
0.8357921, 0.321692, 0.5069352, 1, 1, 1, 1, 1,
0.8359228, 0.4478777, 1.244761, 1, 1, 1, 1, 1,
0.8401489, 1.681562, 1.954948, 1, 1, 1, 1, 1,
0.8454545, 0.05544732, 1.391061, 1, 1, 1, 1, 1,
0.8457137, -0.5547929, 1.666206, 1, 1, 1, 1, 1,
0.846715, -1.390332, 3.646257, 1, 1, 1, 1, 1,
0.8509104, -1.159568, 2.743808, 1, 1, 1, 1, 1,
0.8533152, -0.4900714, 2.864462, 1, 1, 1, 1, 1,
0.8542266, 2.048215, -0.5977572, 1, 1, 1, 1, 1,
0.8554556, 2.523021, 0.08536921, 1, 1, 1, 1, 1,
0.8650309, -1.006284, 2.194147, 1, 1, 1, 1, 1,
0.8683823, 1.462129, -0.1246755, 0, 0, 1, 1, 1,
0.8776478, -1.599584, 2.545504, 1, 0, 0, 1, 1,
0.8790449, -0.4447784, 2.346021, 1, 0, 0, 1, 1,
0.8797894, 0.003119939, 0.7006835, 1, 0, 0, 1, 1,
0.8808007, -0.3111938, 1.694499, 1, 0, 0, 1, 1,
0.8859492, 1.03108, 0.2926624, 1, 0, 0, 1, 1,
0.8896188, -0.5399482, 1.348976, 0, 0, 0, 1, 1,
0.9010471, 0.9268692, 0.9927491, 0, 0, 0, 1, 1,
0.9012784, -1.026447, 2.116864, 0, 0, 0, 1, 1,
0.9022958, 1.648409, 0.3907478, 0, 0, 0, 1, 1,
0.9053351, -0.877215, 3.322321, 0, 0, 0, 1, 1,
0.914107, 0.7828176, -0.6280362, 0, 0, 0, 1, 1,
0.9151391, -1.167162, 2.855259, 0, 0, 0, 1, 1,
0.9193614, -1.121046, 3.680367, 1, 1, 1, 1, 1,
0.9253443, -0.03846319, 2.674916, 1, 1, 1, 1, 1,
0.9328505, 0.5475226, 0.8355634, 1, 1, 1, 1, 1,
0.9328619, -0.3795819, 2.408049, 1, 1, 1, 1, 1,
0.9331529, -0.895904, 3.789413, 1, 1, 1, 1, 1,
0.9420165, -0.5729788, 2.682443, 1, 1, 1, 1, 1,
0.9451985, 0.1889461, 2.172799, 1, 1, 1, 1, 1,
0.9485487, 0.9159915, 0.4365112, 1, 1, 1, 1, 1,
0.9579945, 0.963426, 1.183726, 1, 1, 1, 1, 1,
0.9584668, -1.731203, 3.294955, 1, 1, 1, 1, 1,
0.9619712, 0.006796963, 1.572559, 1, 1, 1, 1, 1,
0.96381, -0.2377255, 1.446162, 1, 1, 1, 1, 1,
0.966596, -1.404882, 4.152661, 1, 1, 1, 1, 1,
0.9760743, 1.18976, -2.079311, 1, 1, 1, 1, 1,
0.9805351, -1.367923, 0.619162, 1, 1, 1, 1, 1,
0.9845058, 0.4575053, 0.5391223, 0, 0, 1, 1, 1,
0.9955854, 0.8229375, -0.1741427, 1, 0, 0, 1, 1,
1.001385, -0.7821679, 1.291624, 1, 0, 0, 1, 1,
1.007079, -1.729098, 2.645577, 1, 0, 0, 1, 1,
1.012258, 0.1198806, 1.419006, 1, 0, 0, 1, 1,
1.016816, 0.4454811, 1.653784, 1, 0, 0, 1, 1,
1.020263, 1.547953, -1.348721, 0, 0, 0, 1, 1,
1.021641, 0.9031329, 0.3983552, 0, 0, 0, 1, 1,
1.024581, -0.04570722, 0.9894744, 0, 0, 0, 1, 1,
1.028501, -0.9534457, 0.986564, 0, 0, 0, 1, 1,
1.029605, 1.34826, 0.4332622, 0, 0, 0, 1, 1,
1.030472, 0.4835638, 1.852163, 0, 0, 0, 1, 1,
1.037695, 0.8134677, 2.539471, 0, 0, 0, 1, 1,
1.039689, -0.2919427, 2.22833, 1, 1, 1, 1, 1,
1.045452, -0.5377693, 1.254724, 1, 1, 1, 1, 1,
1.046241, 0.1671006, 1.472167, 1, 1, 1, 1, 1,
1.048758, 0.02121767, 0.1521229, 1, 1, 1, 1, 1,
1.055381, -0.2754315, 1.246755, 1, 1, 1, 1, 1,
1.067485, -1.109116, 3.397426, 1, 1, 1, 1, 1,
1.070449, -0.2560492, 0.5981392, 1, 1, 1, 1, 1,
1.077984, -1.236834, 0.9830273, 1, 1, 1, 1, 1,
1.078907, -0.890641, 1.260491, 1, 1, 1, 1, 1,
1.080289, -0.09261391, 2.27831, 1, 1, 1, 1, 1,
1.081347, 0.4530609, -0.5102801, 1, 1, 1, 1, 1,
1.084423, 1.098818, 1.367524, 1, 1, 1, 1, 1,
1.086023, -1.977451, 3.179324, 1, 1, 1, 1, 1,
1.08901, 0.4466306, 1.045277, 1, 1, 1, 1, 1,
1.091637, 0.2516754, 0.6607072, 1, 1, 1, 1, 1,
1.094366, -0.2805873, 0.7792433, 0, 0, 1, 1, 1,
1.09748, -0.4543541, 3.058277, 1, 0, 0, 1, 1,
1.100017, -0.09544127, 2.933492, 1, 0, 0, 1, 1,
1.103536, 1.060448, 1.739881, 1, 0, 0, 1, 1,
1.10435, 0.6555303, 0.9644132, 1, 0, 0, 1, 1,
1.109995, -0.4482605, 3.054896, 1, 0, 0, 1, 1,
1.118555, 1.399607, 0.4592613, 0, 0, 0, 1, 1,
1.122466, 0.3990687, 1.016041, 0, 0, 0, 1, 1,
1.127525, 0.7594631, 1.321817, 0, 0, 0, 1, 1,
1.128256, 1.080378, -0.2169362, 0, 0, 0, 1, 1,
1.135453, 0.8977469, 1.368639, 0, 0, 0, 1, 1,
1.135916, -0.1827511, 4.007252, 0, 0, 0, 1, 1,
1.139559, 0.8550651, 3.24008, 0, 0, 0, 1, 1,
1.145201, -0.3151651, 1.535204, 1, 1, 1, 1, 1,
1.148646, 1.090948, 0.6618071, 1, 1, 1, 1, 1,
1.16194, -1.217545, 2.692599, 1, 1, 1, 1, 1,
1.164124, 0.6266927, 1.139269, 1, 1, 1, 1, 1,
1.165675, 1.013364, 0.9835376, 1, 1, 1, 1, 1,
1.173534, -0.7274721, 1.728846, 1, 1, 1, 1, 1,
1.175628, 0.5351451, 1.00325, 1, 1, 1, 1, 1,
1.183223, -0.05650711, 2.570693, 1, 1, 1, 1, 1,
1.189883, 1.037913, 1.650899, 1, 1, 1, 1, 1,
1.193676, 0.1840834, 2.189893, 1, 1, 1, 1, 1,
1.197857, 0.5715165, 1.725193, 1, 1, 1, 1, 1,
1.200754, -0.514931, 1.927669, 1, 1, 1, 1, 1,
1.202769, -1.053135, 5.265385, 1, 1, 1, 1, 1,
1.203918, -0.5309729, 0.392572, 1, 1, 1, 1, 1,
1.210012, -0.2919608, 2.255831, 1, 1, 1, 1, 1,
1.220989, -0.5477512, 1.502571, 0, 0, 1, 1, 1,
1.256198, -0.4817906, 2.016377, 1, 0, 0, 1, 1,
1.258404, -2.935685, 3.89542, 1, 0, 0, 1, 1,
1.260766, -0.2015192, 1.377087, 1, 0, 0, 1, 1,
1.262464, -1.447084, 1.605432, 1, 0, 0, 1, 1,
1.268311, 1.038377, 2.707653, 1, 0, 0, 1, 1,
1.271346, 1.88727, 0.3451632, 0, 0, 0, 1, 1,
1.276738, -0.3844095, 1.940502, 0, 0, 0, 1, 1,
1.280488, 0.7600019, -0.3322802, 0, 0, 0, 1, 1,
1.283875, 1.3238, -0.3527868, 0, 0, 0, 1, 1,
1.289152, -1.702415, 2.07425, 0, 0, 0, 1, 1,
1.318103, 1.419192, -0.5427611, 0, 0, 0, 1, 1,
1.336737, 1.002053, 1.299587, 0, 0, 0, 1, 1,
1.337832, -0.8311341, 1.755125, 1, 1, 1, 1, 1,
1.342055, 0.6120449, 1.042443, 1, 1, 1, 1, 1,
1.36564, 2.509094, 0.03014637, 1, 1, 1, 1, 1,
1.365863, -0.3359434, 0.3416716, 1, 1, 1, 1, 1,
1.36683, 1.14158, 2.202676, 1, 1, 1, 1, 1,
1.380398, 1.837986, 1.579559, 1, 1, 1, 1, 1,
1.396511, -0.4782742, 0.6807723, 1, 1, 1, 1, 1,
1.399857, -1.184713, 2.113235, 1, 1, 1, 1, 1,
1.405847, 0.244709, 1.646618, 1, 1, 1, 1, 1,
1.433184, -1.576523, 0.7355798, 1, 1, 1, 1, 1,
1.445735, -1.949116, 3.670892, 1, 1, 1, 1, 1,
1.446111, 1.1172, 0.6786245, 1, 1, 1, 1, 1,
1.450756, 0.7925306, 0.8209163, 1, 1, 1, 1, 1,
1.455427, 0.2941555, 1.110386, 1, 1, 1, 1, 1,
1.463424, 0.6397455, 1.89215, 1, 1, 1, 1, 1,
1.46888, -1.594182, 2.915183, 0, 0, 1, 1, 1,
1.499903, 0.1109599, 0.4413899, 1, 0, 0, 1, 1,
1.510377, -1.880314, 0.3661302, 1, 0, 0, 1, 1,
1.521317, -1.173918, 2.528155, 1, 0, 0, 1, 1,
1.527059, -0.02763297, 2.743616, 1, 0, 0, 1, 1,
1.527491, -1.064133, 0.6851469, 1, 0, 0, 1, 1,
1.528372, -0.155763, 2.393268, 0, 0, 0, 1, 1,
1.531322, 0.04577098, -0.2910616, 0, 0, 0, 1, 1,
1.537913, 1.360939, 2.493144, 0, 0, 0, 1, 1,
1.540753, -0.1101408, 1.302434, 0, 0, 0, 1, 1,
1.541788, 1.529473, 0.7883604, 0, 0, 0, 1, 1,
1.548252, -0.2737728, 1.766577, 0, 0, 0, 1, 1,
1.563881, -0.5601512, 4.1199, 0, 0, 0, 1, 1,
1.574109, -1.024474, 0.680172, 1, 1, 1, 1, 1,
1.575013, 1.051765, 1.434236, 1, 1, 1, 1, 1,
1.576617, -1.302422, 3.348753, 1, 1, 1, 1, 1,
1.578097, 1.179342, 1.226935, 1, 1, 1, 1, 1,
1.579957, -1.178343, 2.41045, 1, 1, 1, 1, 1,
1.585842, -0.05687493, 0.9373136, 1, 1, 1, 1, 1,
1.603133, 0.5564178, -0.09600902, 1, 1, 1, 1, 1,
1.604074, 0.8167052, 1.484894, 1, 1, 1, 1, 1,
1.606481, -1.112757, 1.692975, 1, 1, 1, 1, 1,
1.606558, 0.4403386, 2.161694, 1, 1, 1, 1, 1,
1.609187, 1.379457, 0.6545048, 1, 1, 1, 1, 1,
1.609906, 0.6888075, 1.70033, 1, 1, 1, 1, 1,
1.618344, -2.065111, 2.228222, 1, 1, 1, 1, 1,
1.636971, -0.7364617, 0.5120068, 1, 1, 1, 1, 1,
1.639856, 0.9499418, 1.051263, 1, 1, 1, 1, 1,
1.643319, 0.1157342, 1.625451, 0, 0, 1, 1, 1,
1.652157, -0.2108897, 2.048605, 1, 0, 0, 1, 1,
1.656219, -0.03382083, 0.4361849, 1, 0, 0, 1, 1,
1.680006, 0.9596967, 0.4850822, 1, 0, 0, 1, 1,
1.68453, 0.9213876, 0.6182259, 1, 0, 0, 1, 1,
1.685468, -0.6137916, 2.71022, 1, 0, 0, 1, 1,
1.690892, 0.1502719, 1.108543, 0, 0, 0, 1, 1,
1.69482, -0.1868084, 1.585529, 0, 0, 0, 1, 1,
1.721513, -1.694082, 3.437107, 0, 0, 0, 1, 1,
1.724138, 0.396542, 1.737218, 0, 0, 0, 1, 1,
1.724889, 0.8959169, 1.556354, 0, 0, 0, 1, 1,
1.736381, 0.33362, 0.3600903, 0, 0, 0, 1, 1,
1.755077, 0.3689423, 2.917931, 0, 0, 0, 1, 1,
1.757544, -0.57828, 1.493191, 1, 1, 1, 1, 1,
1.769655, -0.2766502, 0.9265063, 1, 1, 1, 1, 1,
1.784884, 0.1478582, -0.2607791, 1, 1, 1, 1, 1,
1.78502, -1.006789, 0.6736726, 1, 1, 1, 1, 1,
1.800437, -0.1225598, 0.8936055, 1, 1, 1, 1, 1,
1.810134, 1.868635, 1.966318, 1, 1, 1, 1, 1,
1.815854, 0.1083121, 3.077928, 1, 1, 1, 1, 1,
1.818931, -0.05240669, 2.450568, 1, 1, 1, 1, 1,
1.819834, 0.5963247, 0.6079301, 1, 1, 1, 1, 1,
1.901767, 0.06207272, 0.6653386, 1, 1, 1, 1, 1,
1.936253, -1.416386, 1.571634, 1, 1, 1, 1, 1,
1.988453, -1.632141, 3.083572, 1, 1, 1, 1, 1,
2.002347, -0.5810694, 4.568655, 1, 1, 1, 1, 1,
2.030072, 0.4058597, 2.19522, 1, 1, 1, 1, 1,
2.030634, -1.551625, 0.4793863, 1, 1, 1, 1, 1,
2.084489, -0.1763425, 2.583098, 0, 0, 1, 1, 1,
2.101782, -0.08177027, 0.8424183, 1, 0, 0, 1, 1,
2.120383, 0.7820253, 0.3918996, 1, 0, 0, 1, 1,
2.1226, -1.800877, 1.803359, 1, 0, 0, 1, 1,
2.128278, 0.7480929, 3.267213, 1, 0, 0, 1, 1,
2.129061, -0.04286946, 0.2516197, 1, 0, 0, 1, 1,
2.207832, 0.5268583, 3.398031, 0, 0, 0, 1, 1,
2.215877, -1.461538, 1.390936, 0, 0, 0, 1, 1,
2.255093, -0.9682853, 2.778868, 0, 0, 0, 1, 1,
2.256472, -1.294634, 1.176156, 0, 0, 0, 1, 1,
2.268585, 0.2983854, 0.7648682, 0, 0, 0, 1, 1,
2.277794, -1.604055, 3.724785, 0, 0, 0, 1, 1,
2.29498, 1.245466, 0.3515712, 0, 0, 0, 1, 1,
2.353406, 1.081617, 2.352917, 1, 1, 1, 1, 1,
2.397402, -0.432097, 1.247164, 1, 1, 1, 1, 1,
2.41539, 1.152837, 1.73867, 1, 1, 1, 1, 1,
2.446554, -0.5955992, 2.212502, 1, 1, 1, 1, 1,
2.451408, 0.7140986, 0.6110538, 1, 1, 1, 1, 1,
2.469455, 1.320461, 0.2164339, 1, 1, 1, 1, 1,
2.791805, 0.4558536, 0.7618567, 1, 1, 1, 1, 1
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
var radius = 9.275222;
var distance = 32.57882;
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
mvMatrix.translate( -0.04806566, -0.2303889, 0.03756738 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.57882);
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
