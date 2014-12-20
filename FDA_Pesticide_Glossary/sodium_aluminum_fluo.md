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
-3.412645, 0.8063448, -1.940421, 1, 0, 0, 1,
-3.052354, -0.58128, -1.228106, 1, 0.007843138, 0, 1,
-2.76723, 1.359337, -2.431937, 1, 0.01176471, 0, 1,
-2.683434, -1.799962, -1.346651, 1, 0.01960784, 0, 1,
-2.608928, -0.02937846, -0.1952306, 1, 0.02352941, 0, 1,
-2.528762, -1.155396, -1.730682, 1, 0.03137255, 0, 1,
-2.463882, 0.5210377, -2.023271, 1, 0.03529412, 0, 1,
-2.44549, -0.06642634, -2.267174, 1, 0.04313726, 0, 1,
-2.36767, -0.56975, -2.50333, 1, 0.04705882, 0, 1,
-2.303577, 0.8636056, -2.08391, 1, 0.05490196, 0, 1,
-2.285248, 0.8472428, -1.557024, 1, 0.05882353, 0, 1,
-2.200871, 1.20932, 0.05474467, 1, 0.06666667, 0, 1,
-2.140368, 0.001380516, -1.913468, 1, 0.07058824, 0, 1,
-2.093426, -0.1235059, -1.885942, 1, 0.07843138, 0, 1,
-2.087769, 3.094186, 0.02116255, 1, 0.08235294, 0, 1,
-2.086308, -0.1612136, -0.5522251, 1, 0.09019608, 0, 1,
-2.072341, 1.190069, -0.4585098, 1, 0.09411765, 0, 1,
-2.053517, -0.4013335, -0.466743, 1, 0.1019608, 0, 1,
-2.053439, 0.2146435, -2.670153, 1, 0.1098039, 0, 1,
-2.023835, -0.7799635, -2.450744, 1, 0.1137255, 0, 1,
-2.006619, -0.3353971, -3.009458, 1, 0.1215686, 0, 1,
-1.978711, 1.005339, 0.5607311, 1, 0.1254902, 0, 1,
-1.956803, 0.2978419, -3.411621, 1, 0.1333333, 0, 1,
-1.923718, 1.739431, -0.4747752, 1, 0.1372549, 0, 1,
-1.919384, 0.9877851, -0.02567262, 1, 0.145098, 0, 1,
-1.918895, 1.326889, -1.959261, 1, 0.1490196, 0, 1,
-1.913375, 1.248246, 0.09039651, 1, 0.1568628, 0, 1,
-1.89023, 0.8006209, -1.684345, 1, 0.1607843, 0, 1,
-1.861845, 0.7709002, -1.890083, 1, 0.1686275, 0, 1,
-1.855702, 0.6628594, -2.819838, 1, 0.172549, 0, 1,
-1.852266, 2.734782, -0.4030863, 1, 0.1803922, 0, 1,
-1.852061, -0.8426357, -1.69039, 1, 0.1843137, 0, 1,
-1.84904, 1.123551, -1.737968, 1, 0.1921569, 0, 1,
-1.839865, 0.8839557, -2.452929, 1, 0.1960784, 0, 1,
-1.795804, 0.2733058, -3.081751, 1, 0.2039216, 0, 1,
-1.772674, -0.1427304, -1.899137, 1, 0.2117647, 0, 1,
-1.77147, -0.13549, -1.568601, 1, 0.2156863, 0, 1,
-1.77093, -0.488463, -1.246641, 1, 0.2235294, 0, 1,
-1.764758, 0.2304695, -1.218103, 1, 0.227451, 0, 1,
-1.75912, 2.776727, -1.055883, 1, 0.2352941, 0, 1,
-1.754753, 1.461694, -2.489645, 1, 0.2392157, 0, 1,
-1.753796, 0.08375994, -2.212576, 1, 0.2470588, 0, 1,
-1.721101, -1.382512, -2.946567, 1, 0.2509804, 0, 1,
-1.63967, 0.9100339, 1.779553, 1, 0.2588235, 0, 1,
-1.610491, 1.787963, -0.2834959, 1, 0.2627451, 0, 1,
-1.585626, 0.2705452, 0.1157379, 1, 0.2705882, 0, 1,
-1.577306, -0.07593462, -0.4616669, 1, 0.2745098, 0, 1,
-1.574013, -2.089614, -2.804199, 1, 0.282353, 0, 1,
-1.537511, 0.1090401, -0.2619815, 1, 0.2862745, 0, 1,
-1.530675, -0.4796859, -3.809525, 1, 0.2941177, 0, 1,
-1.526196, -2.157717, -2.119887, 1, 0.3019608, 0, 1,
-1.523941, -0.5566063, -1.747142, 1, 0.3058824, 0, 1,
-1.521793, -0.02002253, -1.655933, 1, 0.3137255, 0, 1,
-1.520306, 1.407248, -1.057904, 1, 0.3176471, 0, 1,
-1.505106, 0.6227871, -2.546515, 1, 0.3254902, 0, 1,
-1.496822, 0.4794323, -0.9015198, 1, 0.3294118, 0, 1,
-1.477621, -0.1777087, -2.568122, 1, 0.3372549, 0, 1,
-1.476395, -0.1151424, 0.4623684, 1, 0.3411765, 0, 1,
-1.474469, 2.459311, 0.8545868, 1, 0.3490196, 0, 1,
-1.468963, 0.7522316, -2.294793, 1, 0.3529412, 0, 1,
-1.468291, -2.028488, -1.581759, 1, 0.3607843, 0, 1,
-1.453839, -0.5547296, -0.9703436, 1, 0.3647059, 0, 1,
-1.451863, -1.315707, -2.326993, 1, 0.372549, 0, 1,
-1.45167, -0.05797749, -2.302766, 1, 0.3764706, 0, 1,
-1.419499, 0.4588537, 0.2951332, 1, 0.3843137, 0, 1,
-1.390959, 0.5499299, -1.877739, 1, 0.3882353, 0, 1,
-1.379085, -1.795875, -0.9607806, 1, 0.3960784, 0, 1,
-1.378897, -1.285203, -3.753135, 1, 0.4039216, 0, 1,
-1.369523, -1.124826, -1.476389, 1, 0.4078431, 0, 1,
-1.369327, -1.413485, -2.455444, 1, 0.4156863, 0, 1,
-1.367802, -1.815437, -2.679091, 1, 0.4196078, 0, 1,
-1.356925, -0.07283045, -0.8744906, 1, 0.427451, 0, 1,
-1.35566, 0.5488108, -0.6894164, 1, 0.4313726, 0, 1,
-1.337643, 0.781786, -2.018866, 1, 0.4392157, 0, 1,
-1.33393, 0.5614319, -2.31006, 1, 0.4431373, 0, 1,
-1.333083, -0.02236764, -2.440893, 1, 0.4509804, 0, 1,
-1.329871, 0.8887078, -0.5752196, 1, 0.454902, 0, 1,
-1.323445, 0.07505111, -1.053765, 1, 0.4627451, 0, 1,
-1.319282, 0.869484, 0.4634767, 1, 0.4666667, 0, 1,
-1.304551, -0.237477, -1.846057, 1, 0.4745098, 0, 1,
-1.303912, -0.2338536, -1.187161, 1, 0.4784314, 0, 1,
-1.302081, -0.1807604, -2.57857, 1, 0.4862745, 0, 1,
-1.301121, 1.651077, -1.129441, 1, 0.4901961, 0, 1,
-1.294546, 0.7625786, -0.1031461, 1, 0.4980392, 0, 1,
-1.290973, 0.5626838, -0.08269619, 1, 0.5058824, 0, 1,
-1.28645, -0.357875, -1.923314, 1, 0.509804, 0, 1,
-1.284302, 0.4044871, -0.6967828, 1, 0.5176471, 0, 1,
-1.28292, 0.5846581, -1.0006, 1, 0.5215687, 0, 1,
-1.278104, 0.4564569, -1.377763, 1, 0.5294118, 0, 1,
-1.276598, -0.5401101, -1.642815, 1, 0.5333334, 0, 1,
-1.276398, 0.8190579, -0.5792439, 1, 0.5411765, 0, 1,
-1.275537, 0.5476865, -0.5584263, 1, 0.5450981, 0, 1,
-1.274901, -0.5655293, -1.075983, 1, 0.5529412, 0, 1,
-1.27302, -1.702263, -2.005724, 1, 0.5568628, 0, 1,
-1.263304, -0.211703, -2.617708, 1, 0.5647059, 0, 1,
-1.262568, 2.025444, 0.4002649, 1, 0.5686275, 0, 1,
-1.254103, -0.2436804, -1.987028, 1, 0.5764706, 0, 1,
-1.252989, -0.3187013, -2.144156, 1, 0.5803922, 0, 1,
-1.248878, 0.3303095, -0.6027685, 1, 0.5882353, 0, 1,
-1.240089, -1.085276, -1.771059, 1, 0.5921569, 0, 1,
-1.22036, 1.013307, -1.616814, 1, 0.6, 0, 1,
-1.20093, -0.7789561, -3.551074, 1, 0.6078432, 0, 1,
-1.193375, -0.8064473, -2.656662, 1, 0.6117647, 0, 1,
-1.18907, -0.2952027, -2.095457, 1, 0.6196079, 0, 1,
-1.185653, -1.748311, -1.37174, 1, 0.6235294, 0, 1,
-1.175311, 0.8433617, -0.0174171, 1, 0.6313726, 0, 1,
-1.168563, 0.233544, -2.758283, 1, 0.6352941, 0, 1,
-1.162748, 0.2850567, 0.2496415, 1, 0.6431373, 0, 1,
-1.152984, -0.4386456, -3.309051, 1, 0.6470588, 0, 1,
-1.138405, -0.187046, -0.6329174, 1, 0.654902, 0, 1,
-1.13765, -0.9977339, -2.451902, 1, 0.6588235, 0, 1,
-1.13256, 1.653263, -0.5627385, 1, 0.6666667, 0, 1,
-1.131536, 1.104367, -0.8577905, 1, 0.6705883, 0, 1,
-1.129954, 0.8568962, 0.6217469, 1, 0.6784314, 0, 1,
-1.120583, 1.640666, 0.7370132, 1, 0.682353, 0, 1,
-1.108641, 1.217306, -1.701182, 1, 0.6901961, 0, 1,
-1.105835, -0.06979474, -1.140506, 1, 0.6941177, 0, 1,
-1.10481, -1.086576, -1.656106, 1, 0.7019608, 0, 1,
-1.10086, -0.4113153, -3.52719, 1, 0.7098039, 0, 1,
-1.099016, -0.3954623, -1.723285, 1, 0.7137255, 0, 1,
-1.097876, -0.5464092, -2.143268, 1, 0.7215686, 0, 1,
-1.084959, -1.28057, -2.3651, 1, 0.7254902, 0, 1,
-1.08073, -0.001740834, -1.480981, 1, 0.7333333, 0, 1,
-1.07848, -0.2884328, -1.919328, 1, 0.7372549, 0, 1,
-1.075107, -0.8487543, -2.896867, 1, 0.7450981, 0, 1,
-1.07367, -0.646083, -2.260047, 1, 0.7490196, 0, 1,
-1.067257, 0.2270208, -0.1212996, 1, 0.7568628, 0, 1,
-1.042977, 0.3730245, -1.73753, 1, 0.7607843, 0, 1,
-1.042965, -0.2611349, -1.082034, 1, 0.7686275, 0, 1,
-1.042407, -0.6768129, -1.828799, 1, 0.772549, 0, 1,
-1.029017, -0.04817014, -1.256257, 1, 0.7803922, 0, 1,
-1.026206, 1.175786, -2.252986, 1, 0.7843137, 0, 1,
-1.023863, -0.2503027, -2.453549, 1, 0.7921569, 0, 1,
-1.020603, 0.7003026, -1.18871, 1, 0.7960784, 0, 1,
-1.017228, 1.186315, -1.835698, 1, 0.8039216, 0, 1,
-1.015627, 3.240919, -1.61352, 1, 0.8117647, 0, 1,
-1.014311, 0.6789107, -1.845208, 1, 0.8156863, 0, 1,
-1.013747, 1.568527, -0.3841638, 1, 0.8235294, 0, 1,
-1.01313, 1.038826, 0.05553165, 1, 0.827451, 0, 1,
-1.006229, 1.393118, -1.68189, 1, 0.8352941, 0, 1,
-0.9879101, -0.6814729, -1.541164, 1, 0.8392157, 0, 1,
-0.9730695, -0.3205439, -1.512265, 1, 0.8470588, 0, 1,
-0.9718948, -0.5615489, -2.93595, 1, 0.8509804, 0, 1,
-0.9711531, 0.6843745, 0.1459278, 1, 0.8588235, 0, 1,
-0.9710504, 0.301199, 0.1287632, 1, 0.8627451, 0, 1,
-0.9686749, 0.9965022, -1.156572, 1, 0.8705882, 0, 1,
-0.9630156, 1.709285, 0.4605425, 1, 0.8745098, 0, 1,
-0.958658, 0.1030241, -2.519125, 1, 0.8823529, 0, 1,
-0.9562574, 0.540361, -0.2727523, 1, 0.8862745, 0, 1,
-0.9425508, 0.9395453, -0.89268, 1, 0.8941177, 0, 1,
-0.9373311, 0.6460651, -2.003383, 1, 0.8980392, 0, 1,
-0.9334766, 1.542216, -4.042925, 1, 0.9058824, 0, 1,
-0.9326601, 0.7031866, -0.3318694, 1, 0.9137255, 0, 1,
-0.9285885, 1.836381, 0.7867916, 1, 0.9176471, 0, 1,
-0.9233378, 0.5749515, 0.681003, 1, 0.9254902, 0, 1,
-0.9227904, -1.273618, -3.002438, 1, 0.9294118, 0, 1,
-0.9216689, -0.2061759, -2.839912, 1, 0.9372549, 0, 1,
-0.9215705, 0.8970017, -3.326215, 1, 0.9411765, 0, 1,
-0.9153357, -0.860409, -2.470249, 1, 0.9490196, 0, 1,
-0.9093382, 1.354522, 0.2604219, 1, 0.9529412, 0, 1,
-0.8995092, 1.121982, -1.173425, 1, 0.9607843, 0, 1,
-0.8862081, -0.02875054, -0.3905979, 1, 0.9647059, 0, 1,
-0.8861059, 2.272524, -0.3415384, 1, 0.972549, 0, 1,
-0.8786222, 0.8212948, 0.05684006, 1, 0.9764706, 0, 1,
-0.8782711, -1.96354, -5.490766, 1, 0.9843137, 0, 1,
-0.8769946, -0.944327, -2.625875, 1, 0.9882353, 0, 1,
-0.8757863, -0.3491457, -0.2839182, 1, 0.9960784, 0, 1,
-0.8743012, -1.003606, -3.344713, 0.9960784, 1, 0, 1,
-0.8672137, -1.082491, -1.250359, 0.9921569, 1, 0, 1,
-0.8644654, 1.923791, 0.01692136, 0.9843137, 1, 0, 1,
-0.8634626, -0.507931, -2.004851, 0.9803922, 1, 0, 1,
-0.8631516, -1.014158, -1.04421, 0.972549, 1, 0, 1,
-0.861791, -1.078333, -2.819144, 0.9686275, 1, 0, 1,
-0.8600026, -0.6451668, -3.181056, 0.9607843, 1, 0, 1,
-0.85072, 1.365363, 0.1858182, 0.9568627, 1, 0, 1,
-0.847216, 0.2002172, -2.459259, 0.9490196, 1, 0, 1,
-0.8464347, -1.33891, -2.349564, 0.945098, 1, 0, 1,
-0.8458337, -0.2731485, -2.133906, 0.9372549, 1, 0, 1,
-0.8445336, 0.01532127, -2.161887, 0.9333333, 1, 0, 1,
-0.8400192, -0.5108435, -1.225702, 0.9254902, 1, 0, 1,
-0.8382599, 2.605999, -0.9764611, 0.9215686, 1, 0, 1,
-0.8362919, 0.4412759, 0.9096861, 0.9137255, 1, 0, 1,
-0.8329242, 0.6112736, -1.136224, 0.9098039, 1, 0, 1,
-0.8308281, 1.065956, -0.2127945, 0.9019608, 1, 0, 1,
-0.8305861, -1.44196, -3.5262, 0.8941177, 1, 0, 1,
-0.822525, -2.015068, -2.922395, 0.8901961, 1, 0, 1,
-0.8212115, 0.9452553, -2.725832, 0.8823529, 1, 0, 1,
-0.8207807, 0.8785598, -0.8178457, 0.8784314, 1, 0, 1,
-0.8114014, 0.5614646, -0.6219434, 0.8705882, 1, 0, 1,
-0.809697, 0.2656601, -1.751988, 0.8666667, 1, 0, 1,
-0.8062462, 0.1363294, -0.4016411, 0.8588235, 1, 0, 1,
-0.804971, -0.09411661, -0.9574883, 0.854902, 1, 0, 1,
-0.8016592, -0.4301195, -2.453204, 0.8470588, 1, 0, 1,
-0.7990122, -2.286306, -3.4549, 0.8431373, 1, 0, 1,
-0.7966967, 0.5139123, -1.401814, 0.8352941, 1, 0, 1,
-0.7884481, 0.01991028, -1.734487, 0.8313726, 1, 0, 1,
-0.7870954, 0.1711919, -0.2331819, 0.8235294, 1, 0, 1,
-0.785992, -0.2104991, -1.063597, 0.8196079, 1, 0, 1,
-0.7850913, -0.493396, -3.339967, 0.8117647, 1, 0, 1,
-0.7847162, -0.204029, -3.332201, 0.8078431, 1, 0, 1,
-0.7840513, -0.2409531, -2.020703, 0.8, 1, 0, 1,
-0.7837324, -1.507335, -4.303667, 0.7921569, 1, 0, 1,
-0.7824795, 1.865148, 0.8167076, 0.7882353, 1, 0, 1,
-0.7821161, -0.6643296, -2.164635, 0.7803922, 1, 0, 1,
-0.7810266, 1.854954, -0.9386439, 0.7764706, 1, 0, 1,
-0.7726387, -0.02625744, -0.7120757, 0.7686275, 1, 0, 1,
-0.7668317, 1.082455, -0.8179809, 0.7647059, 1, 0, 1,
-0.7599849, -0.267244, -3.079432, 0.7568628, 1, 0, 1,
-0.754747, 0.759654, -1.817997, 0.7529412, 1, 0, 1,
-0.7528765, 0.8309242, -1.840263, 0.7450981, 1, 0, 1,
-0.747089, -0.5105643, -1.59216, 0.7411765, 1, 0, 1,
-0.745559, -0.3875558, 0.00330811, 0.7333333, 1, 0, 1,
-0.7439238, 0.1337816, -0.665603, 0.7294118, 1, 0, 1,
-0.7425161, 0.2507114, 0.8370554, 0.7215686, 1, 0, 1,
-0.7383887, 0.338424, -1.838229, 0.7176471, 1, 0, 1,
-0.7360677, -3.068822, -1.28185, 0.7098039, 1, 0, 1,
-0.7359456, -1.287573, -2.751547, 0.7058824, 1, 0, 1,
-0.7322602, 2.046038, 1.68897, 0.6980392, 1, 0, 1,
-0.7179891, 0.1408396, -1.09819, 0.6901961, 1, 0, 1,
-0.7177359, 0.1401598, 0.5795314, 0.6862745, 1, 0, 1,
-0.7170267, -0.2193509, -2.255972, 0.6784314, 1, 0, 1,
-0.711566, 1.862638, -0.4621768, 0.6745098, 1, 0, 1,
-0.7052214, -0.7400374, -1.708127, 0.6666667, 1, 0, 1,
-0.7035643, 0.5573466, -0.08991728, 0.6627451, 1, 0, 1,
-0.7016672, -0.0257925, -0.4226522, 0.654902, 1, 0, 1,
-0.6975553, -0.3052862, -2.92285, 0.6509804, 1, 0, 1,
-0.6967139, -1.091226, -2.742654, 0.6431373, 1, 0, 1,
-0.695593, -2.048173, -3.229168, 0.6392157, 1, 0, 1,
-0.6929994, 0.3403079, -1.312524, 0.6313726, 1, 0, 1,
-0.691222, -0.8671359, -1.095945, 0.627451, 1, 0, 1,
-0.6910249, 0.8456592, 0.3814929, 0.6196079, 1, 0, 1,
-0.6833356, 0.400134, -2.215726, 0.6156863, 1, 0, 1,
-0.6813662, 0.9245689, -0.7585022, 0.6078432, 1, 0, 1,
-0.6799798, -0.2527457, -1.40636, 0.6039216, 1, 0, 1,
-0.6762455, -0.4587215, -3.404275, 0.5960785, 1, 0, 1,
-0.6674986, 1.109887, 0.4772342, 0.5882353, 1, 0, 1,
-0.6663816, -2.136906, -3.118534, 0.5843138, 1, 0, 1,
-0.6658995, -1.260905, -3.242584, 0.5764706, 1, 0, 1,
-0.6602578, -0.1341162, -2.65166, 0.572549, 1, 0, 1,
-0.6552436, 0.7887906, 0.1754961, 0.5647059, 1, 0, 1,
-0.654619, 0.1098633, -1.7157, 0.5607843, 1, 0, 1,
-0.6541014, 0.6161492, -1.905861, 0.5529412, 1, 0, 1,
-0.6526734, 0.13402, -1.135973, 0.5490196, 1, 0, 1,
-0.6503659, -1.978088, -2.983572, 0.5411765, 1, 0, 1,
-0.6452817, 1.099539, -0.2439214, 0.5372549, 1, 0, 1,
-0.6419568, -0.722572, -3.046206, 0.5294118, 1, 0, 1,
-0.6337125, -0.8275433, -2.910983, 0.5254902, 1, 0, 1,
-0.6319981, 0.9878673, 0.6416886, 0.5176471, 1, 0, 1,
-0.6276944, 0.2996476, -2.289063, 0.5137255, 1, 0, 1,
-0.6193449, 1.028294, 0.8483458, 0.5058824, 1, 0, 1,
-0.6111031, 1.054614, 0.6964712, 0.5019608, 1, 0, 1,
-0.6079391, -0.8717839, -1.823127, 0.4941176, 1, 0, 1,
-0.6034542, -0.0222053, 0.1828173, 0.4862745, 1, 0, 1,
-0.5990191, -0.7446073, -4.370681, 0.4823529, 1, 0, 1,
-0.5975978, -0.3345771, -2.76354, 0.4745098, 1, 0, 1,
-0.5947316, 0.8813241, -0.8002144, 0.4705882, 1, 0, 1,
-0.585004, -1.794006, -4.582193, 0.4627451, 1, 0, 1,
-0.5811388, 0.9662552, -1.894165, 0.4588235, 1, 0, 1,
-0.5791975, 0.4180178, -1.387736, 0.4509804, 1, 0, 1,
-0.5775737, -0.1846154, -0.7547231, 0.4470588, 1, 0, 1,
-0.5773766, -0.009899284, -2.992409, 0.4392157, 1, 0, 1,
-0.5771354, 1.14848, 0.7345672, 0.4352941, 1, 0, 1,
-0.5764375, 1.017888, 0.7766439, 0.427451, 1, 0, 1,
-0.5673347, 0.02969897, 0.4756724, 0.4235294, 1, 0, 1,
-0.5672374, -0.2429204, -1.632071, 0.4156863, 1, 0, 1,
-0.5672295, -0.850872, -0.2862563, 0.4117647, 1, 0, 1,
-0.5670291, -1.291828, -4.294984, 0.4039216, 1, 0, 1,
-0.5664237, 0.4907792, 0.3150881, 0.3960784, 1, 0, 1,
-0.5526353, 0.8279783, -1.339239, 0.3921569, 1, 0, 1,
-0.5514949, -0.5371011, -3.165547, 0.3843137, 1, 0, 1,
-0.5471166, 0.0005764384, -1.437821, 0.3803922, 1, 0, 1,
-0.5453672, -0.2723882, -1.043259, 0.372549, 1, 0, 1,
-0.5443373, 0.01886657, -0.675107, 0.3686275, 1, 0, 1,
-0.5442365, -1.484464, -3.409615, 0.3607843, 1, 0, 1,
-0.536698, -0.4474754, -0.4890995, 0.3568628, 1, 0, 1,
-0.5366498, -0.08222163, -2.069437, 0.3490196, 1, 0, 1,
-0.5358859, 0.8689352, 0.2981276, 0.345098, 1, 0, 1,
-0.5326083, -0.9500126, -3.95479, 0.3372549, 1, 0, 1,
-0.5273261, 0.8832559, -0.600256, 0.3333333, 1, 0, 1,
-0.5236228, -0.8859719, -3.101031, 0.3254902, 1, 0, 1,
-0.5220789, -0.01868974, -0.5747083, 0.3215686, 1, 0, 1,
-0.5206312, -1.003188, -1.099284, 0.3137255, 1, 0, 1,
-0.5128958, 1.011188, -1.631534, 0.3098039, 1, 0, 1,
-0.5074408, 0.9282792, -1.05272, 0.3019608, 1, 0, 1,
-0.5056318, -0.3467512, -1.693259, 0.2941177, 1, 0, 1,
-0.5051149, -0.8539856, -2.61053, 0.2901961, 1, 0, 1,
-0.5043761, 0.5840666, -2.432475, 0.282353, 1, 0, 1,
-0.5041187, -0.4006607, -2.230224, 0.2784314, 1, 0, 1,
-0.502335, -0.1469687, -1.801261, 0.2705882, 1, 0, 1,
-0.4948622, 2.255702, -1.431968, 0.2666667, 1, 0, 1,
-0.4943809, 2.027484, 0.9740292, 0.2588235, 1, 0, 1,
-0.494039, -1.907824, -2.195469, 0.254902, 1, 0, 1,
-0.4853226, 2.193619, -0.00753669, 0.2470588, 1, 0, 1,
-0.48267, 0.07804772, -1.405195, 0.2431373, 1, 0, 1,
-0.4799421, -0.9162732, -3.169747, 0.2352941, 1, 0, 1,
-0.4774831, 0.9709149, -0.3932559, 0.2313726, 1, 0, 1,
-0.4730279, 0.2970361, -0.5424759, 0.2235294, 1, 0, 1,
-0.4669889, 1.043038, -1.280624, 0.2196078, 1, 0, 1,
-0.465765, -2.826567, -2.296355, 0.2117647, 1, 0, 1,
-0.4585879, 0.7388419, -1.681713, 0.2078431, 1, 0, 1,
-0.4568415, 0.04392525, -1.572035, 0.2, 1, 0, 1,
-0.4532059, 1.591735, 1.110688, 0.1921569, 1, 0, 1,
-0.4508837, 1.84049, 0.08461273, 0.1882353, 1, 0, 1,
-0.4452084, 0.3577573, -1.554297, 0.1803922, 1, 0, 1,
-0.4426592, 1.172619, -0.7994912, 0.1764706, 1, 0, 1,
-0.4358149, 1.859036, -1.739924, 0.1686275, 1, 0, 1,
-0.435727, 1.315412, -2.905585, 0.1647059, 1, 0, 1,
-0.4302684, -0.2366186, -0.2923139, 0.1568628, 1, 0, 1,
-0.4294368, -0.09032469, -1.863394, 0.1529412, 1, 0, 1,
-0.4280365, 0.5926551, -0.7941428, 0.145098, 1, 0, 1,
-0.427601, 1.589992, -1.538058, 0.1411765, 1, 0, 1,
-0.4202118, -1.883255, -2.658468, 0.1333333, 1, 0, 1,
-0.4176087, 0.0511899, -1.759858, 0.1294118, 1, 0, 1,
-0.4164363, -0.5837123, -2.544042, 0.1215686, 1, 0, 1,
-0.4140498, 1.224712, -0.1828316, 0.1176471, 1, 0, 1,
-0.4010098, -1.613729, -2.348527, 0.1098039, 1, 0, 1,
-0.3992226, -0.9002737, -3.11377, 0.1058824, 1, 0, 1,
-0.3975061, 1.522648, 1.165985, 0.09803922, 1, 0, 1,
-0.396514, 0.1873977, -0.8105593, 0.09019608, 1, 0, 1,
-0.3962255, -1.056708, -3.610242, 0.08627451, 1, 0, 1,
-0.3926742, 0.383284, -0.3464568, 0.07843138, 1, 0, 1,
-0.3921027, 1.124824, -2.815486, 0.07450981, 1, 0, 1,
-0.3918935, -0.9724116, -2.376817, 0.06666667, 1, 0, 1,
-0.3912712, -2.336598, -2.243616, 0.0627451, 1, 0, 1,
-0.3901924, 1.305725, 0.8359529, 0.05490196, 1, 0, 1,
-0.3878776, 0.4763953, -1.081027, 0.05098039, 1, 0, 1,
-0.3868253, 1.118366, -1.472543, 0.04313726, 1, 0, 1,
-0.3856824, 0.0120197, -0.8088843, 0.03921569, 1, 0, 1,
-0.3820255, 0.02227601, -0.1696804, 0.03137255, 1, 0, 1,
-0.3817604, 1.207745, 0.2804828, 0.02745098, 1, 0, 1,
-0.3805513, 1.025604, -0.2312517, 0.01960784, 1, 0, 1,
-0.3798656, 0.9214813, 0.5905666, 0.01568628, 1, 0, 1,
-0.3783925, 0.8922168, -0.5175532, 0.007843138, 1, 0, 1,
-0.3733208, 0.5442732, 0.5806331, 0.003921569, 1, 0, 1,
-0.3731524, 0.5340354, -0.269806, 0, 1, 0.003921569, 1,
-0.3702243, -1.761864, -3.486336, 0, 1, 0.01176471, 1,
-0.367324, 1.189848, -0.9658923, 0, 1, 0.01568628, 1,
-0.3664247, 0.006706176, -2.233142, 0, 1, 0.02352941, 1,
-0.3623688, 1.453461, 0.4931187, 0, 1, 0.02745098, 1,
-0.3604375, 0.7033556, 0.5431063, 0, 1, 0.03529412, 1,
-0.354059, -1.583035, -3.913568, 0, 1, 0.03921569, 1,
-0.3533854, -1.312184, -3.619418, 0, 1, 0.04705882, 1,
-0.3511709, 1.59875, -0.4404724, 0, 1, 0.05098039, 1,
-0.3449463, 0.8132915, -1.031462, 0, 1, 0.05882353, 1,
-0.3440362, 0.2868434, -0.52187, 0, 1, 0.0627451, 1,
-0.343947, 0.6623436, 1.033785, 0, 1, 0.07058824, 1,
-0.3436398, 0.2280939, -1.089225, 0, 1, 0.07450981, 1,
-0.3428697, 0.4238783, -1.748477, 0, 1, 0.08235294, 1,
-0.3304684, -1.008711, -3.587437, 0, 1, 0.08627451, 1,
-0.3288857, 0.05475117, 0.006942627, 0, 1, 0.09411765, 1,
-0.3259932, -0.6108101, -1.682569, 0, 1, 0.1019608, 1,
-0.3246487, 1.344438, 1.849036, 0, 1, 0.1058824, 1,
-0.3238676, 0.1081717, -1.413339, 0, 1, 0.1137255, 1,
-0.3168274, -0.7679325, -1.895809, 0, 1, 0.1176471, 1,
-0.3086673, -1.444699, -1.903902, 0, 1, 0.1254902, 1,
-0.3038439, 0.5407206, -1.24178, 0, 1, 0.1294118, 1,
-0.3002796, -0.0644873, -3.00503, 0, 1, 0.1372549, 1,
-0.2969746, 0.6845692, -1.813792, 0, 1, 0.1411765, 1,
-0.296347, -0.04854944, -3.378744, 0, 1, 0.1490196, 1,
-0.2948402, -0.9974768, -2.509967, 0, 1, 0.1529412, 1,
-0.2914868, 0.1203005, -2.263902, 0, 1, 0.1607843, 1,
-0.2873541, -0.03054213, -2.27946, 0, 1, 0.1647059, 1,
-0.286301, 0.5335708, -2.373916, 0, 1, 0.172549, 1,
-0.2850363, 0.1146444, -1.826361, 0, 1, 0.1764706, 1,
-0.2842217, -0.6354555, -2.865664, 0, 1, 0.1843137, 1,
-0.2796623, -0.40276, -4.999105, 0, 1, 0.1882353, 1,
-0.2721998, -1.080302, -2.597401, 0, 1, 0.1960784, 1,
-0.2718577, 0.5756127, 0.1137705, 0, 1, 0.2039216, 1,
-0.270744, 0.297229, -0.8990349, 0, 1, 0.2078431, 1,
-0.2703356, 0.3437989, -1.685619, 0, 1, 0.2156863, 1,
-0.2674901, 0.8077567, -1.641227, 0, 1, 0.2196078, 1,
-0.2655662, 0.3245774, 0.5288532, 0, 1, 0.227451, 1,
-0.263527, -0.9378536, -1.641601, 0, 1, 0.2313726, 1,
-0.261384, -0.2868001, -0.7867904, 0, 1, 0.2392157, 1,
-0.2606682, 0.7275099, -0.2364129, 0, 1, 0.2431373, 1,
-0.2570085, -1.18292, -2.363868, 0, 1, 0.2509804, 1,
-0.2528549, -0.4912245, -3.754272, 0, 1, 0.254902, 1,
-0.2509921, 1.657349, -0.5591459, 0, 1, 0.2627451, 1,
-0.2456914, 0.6666123, 0.5711642, 0, 1, 0.2666667, 1,
-0.2446913, -0.04280951, -2.412523, 0, 1, 0.2745098, 1,
-0.2424874, 1.72715, 1.635619, 0, 1, 0.2784314, 1,
-0.2423733, -0.231969, -1.461351, 0, 1, 0.2862745, 1,
-0.2325979, -1.30573, -1.793385, 0, 1, 0.2901961, 1,
-0.2282915, -0.7023498, -2.180077, 0, 1, 0.2980392, 1,
-0.2244177, 0.6999076, 1.931056, 0, 1, 0.3058824, 1,
-0.2229005, 1.445163, 1.743208, 0, 1, 0.3098039, 1,
-0.2217099, 0.6632965, 0.2209639, 0, 1, 0.3176471, 1,
-0.2173771, 1.294194, -0.2806422, 0, 1, 0.3215686, 1,
-0.2170761, 0.7887661, -0.7754112, 0, 1, 0.3294118, 1,
-0.2132376, -0.8094647, -1.466902, 0, 1, 0.3333333, 1,
-0.2118835, 0.7816924, -0.2208538, 0, 1, 0.3411765, 1,
-0.2098602, 0.3386625, -0.06969611, 0, 1, 0.345098, 1,
-0.2097848, -1.6744, -3.425471, 0, 1, 0.3529412, 1,
-0.2084414, 0.3141623, -1.871439, 0, 1, 0.3568628, 1,
-0.2066244, -0.4277092, -3.041069, 0, 1, 0.3647059, 1,
-0.2006788, -1.711849, -3.353834, 0, 1, 0.3686275, 1,
-0.2001639, -0.2700169, -2.802684, 0, 1, 0.3764706, 1,
-0.198207, -0.005072865, -1.793588, 0, 1, 0.3803922, 1,
-0.1966389, -0.05298482, -2.089507, 0, 1, 0.3882353, 1,
-0.1917168, 0.8100587, 0.6403314, 0, 1, 0.3921569, 1,
-0.1914575, 0.1798929, 0.8252826, 0, 1, 0.4, 1,
-0.186336, 0.1249205, -1.928254, 0, 1, 0.4078431, 1,
-0.1863055, -1.286741, -3.989173, 0, 1, 0.4117647, 1,
-0.1841879, 0.7766238, -0.4105228, 0, 1, 0.4196078, 1,
-0.1828477, -0.4055107, -3.383461, 0, 1, 0.4235294, 1,
-0.1809512, 0.8583335, 0.372205, 0, 1, 0.4313726, 1,
-0.1789394, 0.3677433, -1.166918, 0, 1, 0.4352941, 1,
-0.1779517, -1.221084, -3.589744, 0, 1, 0.4431373, 1,
-0.1736913, 0.9623883, -0.4204821, 0, 1, 0.4470588, 1,
-0.1694801, -0.1873349, -4.471832, 0, 1, 0.454902, 1,
-0.1693944, -1.001708, -3.690181, 0, 1, 0.4588235, 1,
-0.1693727, -0.1947053, -1.232458, 0, 1, 0.4666667, 1,
-0.1666059, 0.1660708, 0.8905567, 0, 1, 0.4705882, 1,
-0.1606557, -1.58627, -2.443125, 0, 1, 0.4784314, 1,
-0.1580645, -0.1131779, -3.087378, 0, 1, 0.4823529, 1,
-0.1568697, -0.416465, -3.441519, 0, 1, 0.4901961, 1,
-0.1540856, 0.6842223, -1.006404, 0, 1, 0.4941176, 1,
-0.145987, -0.4077201, -5.444145, 0, 1, 0.5019608, 1,
-0.1423861, -1.118709, -3.882485, 0, 1, 0.509804, 1,
-0.1416947, -1.385886, -4.207954, 0, 1, 0.5137255, 1,
-0.1409297, 0.04869642, -1.305518, 0, 1, 0.5215687, 1,
-0.1383515, 0.9906405, 0.2098299, 0, 1, 0.5254902, 1,
-0.134662, -0.6243573, -2.423175, 0, 1, 0.5333334, 1,
-0.1342971, 0.1126578, -0.711902, 0, 1, 0.5372549, 1,
-0.1323638, -0.4094568, -2.353871, 0, 1, 0.5450981, 1,
-0.1273542, 0.5968478, -1.510583, 0, 1, 0.5490196, 1,
-0.1234002, 0.537363, 0.8323084, 0, 1, 0.5568628, 1,
-0.1212124, 1.079438, 0.7090265, 0, 1, 0.5607843, 1,
-0.117814, -1.246968, -4.626288, 0, 1, 0.5686275, 1,
-0.1166156, 0.08507095, 0.2240055, 0, 1, 0.572549, 1,
-0.11344, 0.2736053, -0.1999541, 0, 1, 0.5803922, 1,
-0.1119166, 0.6400799, -0.2149024, 0, 1, 0.5843138, 1,
-0.1087186, -0.6986377, -2.506977, 0, 1, 0.5921569, 1,
-0.100922, 0.7593113, -0.2869263, 0, 1, 0.5960785, 1,
-0.09928997, 0.7802513, 0.2013547, 0, 1, 0.6039216, 1,
-0.09873081, 0.9900494, 0.8277057, 0, 1, 0.6117647, 1,
-0.09817243, 1.067678, 0.5271686, 0, 1, 0.6156863, 1,
-0.09792086, 1.509179, 0.3475501, 0, 1, 0.6235294, 1,
-0.09413036, -1.951706, -3.65999, 0, 1, 0.627451, 1,
-0.09315193, -1.728563, -4.395293, 0, 1, 0.6352941, 1,
-0.08978239, 1.353899, 1.832832, 0, 1, 0.6392157, 1,
-0.08234392, 0.683734, -0.8286062, 0, 1, 0.6470588, 1,
-0.0795794, 1.229249, 0.891273, 0, 1, 0.6509804, 1,
-0.07448393, -0.3455318, -2.819859, 0, 1, 0.6588235, 1,
-0.07431225, 1.359894, -1.654096, 0, 1, 0.6627451, 1,
-0.07298665, 2.026846, -1.139812, 0, 1, 0.6705883, 1,
-0.0706247, 0.3695824, -1.096875, 0, 1, 0.6745098, 1,
-0.06925587, -0.7095123, -3.272672, 0, 1, 0.682353, 1,
-0.06706021, -0.7074438, -3.282454, 0, 1, 0.6862745, 1,
-0.06294312, 0.05693386, -1.040328, 0, 1, 0.6941177, 1,
-0.05950415, 0.8577937, -1.76938, 0, 1, 0.7019608, 1,
-0.05898894, -0.5638617, -2.262345, 0, 1, 0.7058824, 1,
-0.05761698, -0.06859387, -2.062672, 0, 1, 0.7137255, 1,
-0.05659278, 0.200836, 0.5897866, 0, 1, 0.7176471, 1,
-0.05427751, -1.030809, -2.512132, 0, 1, 0.7254902, 1,
-0.05154037, 2.689197, -0.6893691, 0, 1, 0.7294118, 1,
-0.05137398, -1.996898, -4.34713, 0, 1, 0.7372549, 1,
-0.05107496, 1.172249, -0.6448761, 0, 1, 0.7411765, 1,
-0.04833635, 0.664272, 0.1121815, 0, 1, 0.7490196, 1,
-0.04670053, 1.43306, -1.046801, 0, 1, 0.7529412, 1,
-0.04189307, 1.472533, -0.8663342, 0, 1, 0.7607843, 1,
-0.03679408, -0.3828418, -1.948405, 0, 1, 0.7647059, 1,
-0.03550077, -0.4427192, -2.537422, 0, 1, 0.772549, 1,
-0.03514533, 0.3374887, 0.979475, 0, 1, 0.7764706, 1,
-0.03274326, -0.4852428, -2.202862, 0, 1, 0.7843137, 1,
-0.03153586, 0.06803868, 0.7501478, 0, 1, 0.7882353, 1,
-0.02270488, 1.026716, 0.5167989, 0, 1, 0.7960784, 1,
-0.02167371, 1.107559, -1.205246, 0, 1, 0.8039216, 1,
-0.01797932, -0.3042963, -3.792774, 0, 1, 0.8078431, 1,
-0.01466322, 0.987817, 0.2785632, 0, 1, 0.8156863, 1,
-0.01149686, -1.350556, -1.613939, 0, 1, 0.8196079, 1,
-0.01118918, -0.9975615, -2.284563, 0, 1, 0.827451, 1,
-0.00736018, -0.1529064, -3.396513, 0, 1, 0.8313726, 1,
-0.00681894, -0.9570088, -1.643866, 0, 1, 0.8392157, 1,
-0.004338876, 1.106228, -0.09529154, 0, 1, 0.8431373, 1,
-0.003201696, 0.5026101, 0.6882706, 0, 1, 0.8509804, 1,
-0.003031442, -1.626542, -3.119707, 0, 1, 0.854902, 1,
0.00452143, -0.4199989, 2.346258, 0, 1, 0.8627451, 1,
0.005552729, 0.378637, -1.191934, 0, 1, 0.8666667, 1,
0.00667507, 0.9047511, 0.4776028, 0, 1, 0.8745098, 1,
0.006814388, -0.4117605, 5.181588, 0, 1, 0.8784314, 1,
0.006958203, -0.2429592, 1.724894, 0, 1, 0.8862745, 1,
0.008424978, -1.90897, 2.266376, 0, 1, 0.8901961, 1,
0.009200205, 0.8076879, -1.183058, 0, 1, 0.8980392, 1,
0.01055781, 0.7152987, -0.4523269, 0, 1, 0.9058824, 1,
0.01635499, -0.4073428, 0.3638417, 0, 1, 0.9098039, 1,
0.0178746, 0.7964846, -1.071174, 0, 1, 0.9176471, 1,
0.01997746, -0.4727193, 1.472558, 0, 1, 0.9215686, 1,
0.02466573, -0.2912687, 3.358736, 0, 1, 0.9294118, 1,
0.03127185, 0.2046763, 0.1489496, 0, 1, 0.9333333, 1,
0.03573646, -1.732086, 2.301934, 0, 1, 0.9411765, 1,
0.04121842, 1.182824, 0.06270598, 0, 1, 0.945098, 1,
0.04460588, -0.3718221, 3.141718, 0, 1, 0.9529412, 1,
0.04612214, -0.7816405, 4.901531, 0, 1, 0.9568627, 1,
0.04701313, -0.8167707, 2.135735, 0, 1, 0.9647059, 1,
0.04739795, -0.2906193, 3.818829, 0, 1, 0.9686275, 1,
0.04939707, 0.4076413, 0.05127917, 0, 1, 0.9764706, 1,
0.05268278, 1.447372, -1.63996, 0, 1, 0.9803922, 1,
0.05603441, -0.2979457, 1.569125, 0, 1, 0.9882353, 1,
0.0585716, -0.2319811, 2.561559, 0, 1, 0.9921569, 1,
0.06740097, -0.1415578, 1.850825, 0, 1, 1, 1,
0.06752189, 1.057257, -0.4103013, 0, 0.9921569, 1, 1,
0.06795537, 0.204461, 1.060218, 0, 0.9882353, 1, 1,
0.06863856, 0.03114324, 0.9066831, 0, 0.9803922, 1, 1,
0.06879303, -0.2819368, 5.664302, 0, 0.9764706, 1, 1,
0.06880258, -0.9300349, 2.843267, 0, 0.9686275, 1, 1,
0.06912594, 0.6332478, -0.3376885, 0, 0.9647059, 1, 1,
0.07147433, -0.9030904, 2.946581, 0, 0.9568627, 1, 1,
0.07236172, -1.855813, 3.52265, 0, 0.9529412, 1, 1,
0.07731251, -2.831936, 3.577793, 0, 0.945098, 1, 1,
0.07926285, 0.3349752, -0.1928912, 0, 0.9411765, 1, 1,
0.08098037, 0.8821355, -0.180287, 0, 0.9333333, 1, 1,
0.08696374, -1.080351, 3.147238, 0, 0.9294118, 1, 1,
0.08776162, 0.8285967, 0.2648428, 0, 0.9215686, 1, 1,
0.09369683, -1.72569, 3.745578, 0, 0.9176471, 1, 1,
0.09856926, -1.024437, 3.576905, 0, 0.9098039, 1, 1,
0.1005895, 0.3595121, -0.3431467, 0, 0.9058824, 1, 1,
0.1055297, -0.5208031, 3.404246, 0, 0.8980392, 1, 1,
0.1075161, -0.3502474, 1.349921, 0, 0.8901961, 1, 1,
0.1136265, 0.6638591, 0.6726978, 0, 0.8862745, 1, 1,
0.1168428, -0.5587621, 2.457947, 0, 0.8784314, 1, 1,
0.1177724, -0.9277057, 4.55747, 0, 0.8745098, 1, 1,
0.118456, 0.03402485, 3.246725, 0, 0.8666667, 1, 1,
0.1222649, 0.8972622, -1.372149, 0, 0.8627451, 1, 1,
0.1248379, 1.827683, 0.07342086, 0, 0.854902, 1, 1,
0.1252267, 0.9849198, 0.383843, 0, 0.8509804, 1, 1,
0.1334949, -0.6406261, 3.159643, 0, 0.8431373, 1, 1,
0.1353028, 1.212785, 0.2895141, 0, 0.8392157, 1, 1,
0.1367057, 0.8959448, -1.056913, 0, 0.8313726, 1, 1,
0.1372053, -1.517398, 4.088857, 0, 0.827451, 1, 1,
0.1461158, -1.671623, 4.3741, 0, 0.8196079, 1, 1,
0.148598, -1.20812, 4.11297, 0, 0.8156863, 1, 1,
0.1504598, -0.3395205, 2.989904, 0, 0.8078431, 1, 1,
0.1536422, 1.610124, 0.6846294, 0, 0.8039216, 1, 1,
0.1539747, -0.6185977, 2.526467, 0, 0.7960784, 1, 1,
0.1542902, 0.1106241, 0.1536477, 0, 0.7882353, 1, 1,
0.1561429, 0.4223636, 0.8409137, 0, 0.7843137, 1, 1,
0.1593693, -0.5707287, 2.418424, 0, 0.7764706, 1, 1,
0.1677672, 0.03370732, 2.172025, 0, 0.772549, 1, 1,
0.1686763, 2.242442, -0.1741077, 0, 0.7647059, 1, 1,
0.170132, -2.533397, 2.422522, 0, 0.7607843, 1, 1,
0.1704465, -0.2229183, 2.908978, 0, 0.7529412, 1, 1,
0.1722534, -0.2846418, 0.3819515, 0, 0.7490196, 1, 1,
0.173463, -0.7287558, 3.340284, 0, 0.7411765, 1, 1,
0.1775904, 1.39089, -0.3444711, 0, 0.7372549, 1, 1,
0.178329, -0.2179808, 2.547503, 0, 0.7294118, 1, 1,
0.1808939, -0.87477, 4.856177, 0, 0.7254902, 1, 1,
0.1822324, 1.413389, 1.435264, 0, 0.7176471, 1, 1,
0.1846224, 1.902997, 1.806328, 0, 0.7137255, 1, 1,
0.1907744, 0.4828477, -0.8400062, 0, 0.7058824, 1, 1,
0.1961776, -1.440559, 1.804654, 0, 0.6980392, 1, 1,
0.1972482, -0.2533303, 3.402269, 0, 0.6941177, 1, 1,
0.1995488, -1.352257, 3.317147, 0, 0.6862745, 1, 1,
0.1999367, -0.1470912, 1.32838, 0, 0.682353, 1, 1,
0.2023067, -0.309476, 2.913533, 0, 0.6745098, 1, 1,
0.2026515, 2.283763, 0.5233294, 0, 0.6705883, 1, 1,
0.2033529, 0.700997, 1.649658, 0, 0.6627451, 1, 1,
0.2081842, -1.222265, 3.911457, 0, 0.6588235, 1, 1,
0.2092416, -0.05888488, 0.4052903, 0, 0.6509804, 1, 1,
0.2127762, -1.770489, 2.574705, 0, 0.6470588, 1, 1,
0.2159528, -0.1998404, 3.072664, 0, 0.6392157, 1, 1,
0.2266622, -0.5777275, 2.925709, 0, 0.6352941, 1, 1,
0.2319812, -1.26369, 2.632276, 0, 0.627451, 1, 1,
0.2338075, 0.8024357, -1.28281, 0, 0.6235294, 1, 1,
0.2346349, -0.7332705, 3.769953, 0, 0.6156863, 1, 1,
0.2362359, -1.115762, 4.055326, 0, 0.6117647, 1, 1,
0.2364933, 0.07834233, 0.8186978, 0, 0.6039216, 1, 1,
0.2387664, -0.3777608, 2.611316, 0, 0.5960785, 1, 1,
0.2454427, 0.2871284, -0.03686126, 0, 0.5921569, 1, 1,
0.2491032, 0.7533849, -1.128471, 0, 0.5843138, 1, 1,
0.2540307, -0.4113113, 3.632423, 0, 0.5803922, 1, 1,
0.254061, 0.2144494, 1.760223, 0, 0.572549, 1, 1,
0.2579046, 0.02952972, 0.3740945, 0, 0.5686275, 1, 1,
0.2606878, 0.3100244, 0.779062, 0, 0.5607843, 1, 1,
0.2609603, -0.6589, 5.070704, 0, 0.5568628, 1, 1,
0.2617235, 0.8702453, 1.87234, 0, 0.5490196, 1, 1,
0.2667081, -0.5984445, 1.029454, 0, 0.5450981, 1, 1,
0.2668413, 0.2086189, 0.7417727, 0, 0.5372549, 1, 1,
0.2669121, 0.2793234, 1.502594, 0, 0.5333334, 1, 1,
0.2684246, 1.021729, 1.520331, 0, 0.5254902, 1, 1,
0.2704477, -0.4578245, 3.040572, 0, 0.5215687, 1, 1,
0.2709098, -0.7312001, 4.382701, 0, 0.5137255, 1, 1,
0.2709698, -0.8990188, 3.096179, 0, 0.509804, 1, 1,
0.2716109, -2.468637, 2.824345, 0, 0.5019608, 1, 1,
0.2734138, -0.09296384, 3.866183, 0, 0.4941176, 1, 1,
0.274191, 0.06311627, 0.2400904, 0, 0.4901961, 1, 1,
0.2742461, 0.3469785, 1.693755, 0, 0.4823529, 1, 1,
0.2767801, 0.839537, 0.2749596, 0, 0.4784314, 1, 1,
0.2783412, 1.640224, 0.6111329, 0, 0.4705882, 1, 1,
0.2793029, -1.35693, 2.154114, 0, 0.4666667, 1, 1,
0.2793419, -0.596337, 3.255936, 0, 0.4588235, 1, 1,
0.2815122, -1.812753, 3.350089, 0, 0.454902, 1, 1,
0.2891419, 0.02152985, 2.118082, 0, 0.4470588, 1, 1,
0.2892106, 0.109347, 0.09423482, 0, 0.4431373, 1, 1,
0.2892928, -0.05711828, 2.171098, 0, 0.4352941, 1, 1,
0.2918654, 0.2392479, -0.05820394, 0, 0.4313726, 1, 1,
0.2942831, 1.035634, -0.7250632, 0, 0.4235294, 1, 1,
0.2950057, -0.2938893, 2.681572, 0, 0.4196078, 1, 1,
0.2972771, 1.942904, 0.3428233, 0, 0.4117647, 1, 1,
0.2987278, -0.760478, 1.048369, 0, 0.4078431, 1, 1,
0.2998578, 0.5618961, -0.4841413, 0, 0.4, 1, 1,
0.3002767, -1.099027, 3.327811, 0, 0.3921569, 1, 1,
0.300319, -0.214947, 2.725785, 0, 0.3882353, 1, 1,
0.302045, -2.160528, 1.306267, 0, 0.3803922, 1, 1,
0.3034202, -0.7062885, 4.100058, 0, 0.3764706, 1, 1,
0.3035336, -0.7617193, 3.209981, 0, 0.3686275, 1, 1,
0.304027, -0.4126673, 2.331151, 0, 0.3647059, 1, 1,
0.3049795, -0.5339294, 1.827437, 0, 0.3568628, 1, 1,
0.3100868, -2.936148, 2.726184, 0, 0.3529412, 1, 1,
0.3187432, 0.3140407, 2.699995, 0, 0.345098, 1, 1,
0.3190302, -1.364751, 3.2785, 0, 0.3411765, 1, 1,
0.3217485, 0.398511, -0.5177361, 0, 0.3333333, 1, 1,
0.3222069, 1.334879, -0.492824, 0, 0.3294118, 1, 1,
0.332452, 0.1019036, 1.169518, 0, 0.3215686, 1, 1,
0.3356078, 0.7876193, -0.6359078, 0, 0.3176471, 1, 1,
0.3376018, -0.6061794, 3.333228, 0, 0.3098039, 1, 1,
0.3399648, -2.085615, 4.867115, 0, 0.3058824, 1, 1,
0.3474967, -0.4201782, 1.791561, 0, 0.2980392, 1, 1,
0.3491994, 0.3749104, 0.6690986, 0, 0.2901961, 1, 1,
0.3535001, -0.990171, 3.524782, 0, 0.2862745, 1, 1,
0.3545986, 0.163266, 1.218246, 0, 0.2784314, 1, 1,
0.3584951, -0.4630138, 2.73034, 0, 0.2745098, 1, 1,
0.3585433, -0.6741108, 2.777492, 0, 0.2666667, 1, 1,
0.3599418, -0.770631, 4.110938, 0, 0.2627451, 1, 1,
0.3603705, -0.09304141, 3.012018, 0, 0.254902, 1, 1,
0.3634745, -0.7179018, 1.688319, 0, 0.2509804, 1, 1,
0.3689283, -0.4078841, 2.139364, 0, 0.2431373, 1, 1,
0.3695083, -1.299754, 3.38838, 0, 0.2392157, 1, 1,
0.3700052, -1.818836, 1.595172, 0, 0.2313726, 1, 1,
0.3804373, -0.5174599, 2.626912, 0, 0.227451, 1, 1,
0.3825146, -0.280924, 2.206083, 0, 0.2196078, 1, 1,
0.3868323, 0.2703998, 1.377028, 0, 0.2156863, 1, 1,
0.3874148, -1.105428, 2.009668, 0, 0.2078431, 1, 1,
0.390756, -1.963263, 2.44652, 0, 0.2039216, 1, 1,
0.3938204, -0.6481374, 1.142748, 0, 0.1960784, 1, 1,
0.3960945, -0.8547556, 3.182666, 0, 0.1882353, 1, 1,
0.397498, 0.1389968, -0.004393444, 0, 0.1843137, 1, 1,
0.3976878, 0.4431291, -0.0221258, 0, 0.1764706, 1, 1,
0.3987914, -0.3871904, 1.060641, 0, 0.172549, 1, 1,
0.4038078, -0.1044513, 0.5944794, 0, 0.1647059, 1, 1,
0.4047342, -0.2370379, 2.552499, 0, 0.1607843, 1, 1,
0.4050234, 0.6975738, 1.738436, 0, 0.1529412, 1, 1,
0.4052408, 0.2436068, 1.199457, 0, 0.1490196, 1, 1,
0.4082383, 0.3346359, 1.431384, 0, 0.1411765, 1, 1,
0.4102229, 0.1928366, 2.064401, 0, 0.1372549, 1, 1,
0.4105044, -0.9328675, 4.691726, 0, 0.1294118, 1, 1,
0.4123542, -1.153784, 2.733651, 0, 0.1254902, 1, 1,
0.4124125, -2.054433, 1.659445, 0, 0.1176471, 1, 1,
0.4171065, -0.9536256, 3.055281, 0, 0.1137255, 1, 1,
0.4172929, -0.7576125, 2.487232, 0, 0.1058824, 1, 1,
0.4206519, -1.121372, 2.425208, 0, 0.09803922, 1, 1,
0.4220752, 0.5972388, 0.1622485, 0, 0.09411765, 1, 1,
0.4223916, 0.4378281, -0.1923369, 0, 0.08627451, 1, 1,
0.422703, 0.7584665, -0.01721977, 0, 0.08235294, 1, 1,
0.4256188, -0.228152, 0.6472318, 0, 0.07450981, 1, 1,
0.4265548, 0.5354354, 0.5963975, 0, 0.07058824, 1, 1,
0.4287052, 1.694968, 0.5133222, 0, 0.0627451, 1, 1,
0.4355883, 0.9546136, 3.097649, 0, 0.05882353, 1, 1,
0.4380347, -1.514294, 3.01503, 0, 0.05098039, 1, 1,
0.4421944, 0.6007363, 0.141609, 0, 0.04705882, 1, 1,
0.4497955, 0.8903317, 2.195011, 0, 0.03921569, 1, 1,
0.4523216, 0.400812, -0.3291171, 0, 0.03529412, 1, 1,
0.4524047, -0.213272, 3.957343, 0, 0.02745098, 1, 1,
0.4527692, 1.534844, -0.4088899, 0, 0.02352941, 1, 1,
0.4547521, 0.05888148, 2.510985, 0, 0.01568628, 1, 1,
0.4629539, 0.9545756, 0.6065458, 0, 0.01176471, 1, 1,
0.464192, -0.308117, 2.651793, 0, 0.003921569, 1, 1,
0.4646889, -0.2682979, 1.243296, 0.003921569, 0, 1, 1,
0.4764819, -1.98816, 3.503386, 0.007843138, 0, 1, 1,
0.4766426, -0.8315237, 0.8744338, 0.01568628, 0, 1, 1,
0.4777974, -2.22486, 2.907844, 0.01960784, 0, 1, 1,
0.4803392, 0.1473709, 1.971352, 0.02745098, 0, 1, 1,
0.4857824, -0.2473662, 0.8967474, 0.03137255, 0, 1, 1,
0.4862811, -0.806128, 3.926626, 0.03921569, 0, 1, 1,
0.4877998, -0.235645, 2.524639, 0.04313726, 0, 1, 1,
0.4902858, 0.1255516, 1.501098, 0.05098039, 0, 1, 1,
0.4911732, -0.241126, 1.346644, 0.05490196, 0, 1, 1,
0.491344, 0.1381016, 2.417509, 0.0627451, 0, 1, 1,
0.5011926, 0.8189203, 1.165187, 0.06666667, 0, 1, 1,
0.5035737, 0.8269635, -0.05710825, 0.07450981, 0, 1, 1,
0.5065842, 2.05124, 1.29113, 0.07843138, 0, 1, 1,
0.5069066, -1.882398, 4.792577, 0.08627451, 0, 1, 1,
0.5089349, -1.450436, 2.973269, 0.09019608, 0, 1, 1,
0.5094591, -0.1343737, 1.387398, 0.09803922, 0, 1, 1,
0.5096587, -2.582881, 1.942917, 0.1058824, 0, 1, 1,
0.5108406, -1.053821, 2.054624, 0.1098039, 0, 1, 1,
0.5127919, -0.301102, 1.917918, 0.1176471, 0, 1, 1,
0.5149505, -0.6102345, 1.328028, 0.1215686, 0, 1, 1,
0.5163191, -1.695146, 2.675009, 0.1294118, 0, 1, 1,
0.5241058, 0.01048515, -0.009744456, 0.1333333, 0, 1, 1,
0.5259023, 0.4549909, -0.2211309, 0.1411765, 0, 1, 1,
0.5286388, -0.02720466, 1.255611, 0.145098, 0, 1, 1,
0.5304909, 1.388507, 0.6996175, 0.1529412, 0, 1, 1,
0.5354544, 0.7515588, -0.6522256, 0.1568628, 0, 1, 1,
0.5383654, -1.159464, 4.237662, 0.1647059, 0, 1, 1,
0.5460436, -0.4417204, 2.650679, 0.1686275, 0, 1, 1,
0.5470719, -1.504125, 2.611801, 0.1764706, 0, 1, 1,
0.5489663, 0.7646546, 1.494724, 0.1803922, 0, 1, 1,
0.5496086, -0.3528219, 2.953618, 0.1882353, 0, 1, 1,
0.5509196, 1.948992, 0.8796378, 0.1921569, 0, 1, 1,
0.5510684, 0.2927269, 0.4457809, 0.2, 0, 1, 1,
0.552886, -0.3407045, 4.36578, 0.2078431, 0, 1, 1,
0.5578821, 0.5848107, 0.683649, 0.2117647, 0, 1, 1,
0.5630296, 0.8896883, 1.649172, 0.2196078, 0, 1, 1,
0.5701428, -0.6949922, 1.384959, 0.2235294, 0, 1, 1,
0.5713527, 0.8557196, 1.301433, 0.2313726, 0, 1, 1,
0.5746687, -0.209573, 0.2835437, 0.2352941, 0, 1, 1,
0.576001, -0.7956598, 2.347888, 0.2431373, 0, 1, 1,
0.5764059, 0.9568849, -0.7101909, 0.2470588, 0, 1, 1,
0.5814118, 1.83206, -0.03663152, 0.254902, 0, 1, 1,
0.5817735, 0.7681465, 1.670299, 0.2588235, 0, 1, 1,
0.584179, -0.775984, 1.219468, 0.2666667, 0, 1, 1,
0.5857499, -0.3949302, 1.738879, 0.2705882, 0, 1, 1,
0.5911285, -0.009504312, 2.434155, 0.2784314, 0, 1, 1,
0.5947453, 0.612645, 2.505387, 0.282353, 0, 1, 1,
0.5957521, 0.5695735, -0.6976457, 0.2901961, 0, 1, 1,
0.5961885, 0.4420923, 1.92843, 0.2941177, 0, 1, 1,
0.5991166, -2.190019, 3.181236, 0.3019608, 0, 1, 1,
0.6007347, 0.3376328, 1.47061, 0.3098039, 0, 1, 1,
0.6132728, -0.2611083, 1.62048, 0.3137255, 0, 1, 1,
0.6166848, -0.3834997, 0.487997, 0.3215686, 0, 1, 1,
0.6292809, -0.597555, 0.5811343, 0.3254902, 0, 1, 1,
0.6388814, -0.3078559, -0.1134754, 0.3333333, 0, 1, 1,
0.641876, 1.01252, -0.2443183, 0.3372549, 0, 1, 1,
0.644989, 0.3702717, 0.6032845, 0.345098, 0, 1, 1,
0.6472611, 1.442616, -1.16538, 0.3490196, 0, 1, 1,
0.6507508, -0.1873026, 2.897786, 0.3568628, 0, 1, 1,
0.6545778, -0.9108672, 2.155381, 0.3607843, 0, 1, 1,
0.6561722, -0.5097335, 2.083294, 0.3686275, 0, 1, 1,
0.6585943, -1.125674, 2.164734, 0.372549, 0, 1, 1,
0.660394, -0.8423825, 2.636245, 0.3803922, 0, 1, 1,
0.6609619, -0.1791603, -0.9908168, 0.3843137, 0, 1, 1,
0.6626893, 0.2489358, 0.6541557, 0.3921569, 0, 1, 1,
0.669719, -0.1034526, 1.579962, 0.3960784, 0, 1, 1,
0.6712515, 1.717767, 1.114849, 0.4039216, 0, 1, 1,
0.6723256, 0.591091, 2.577649, 0.4117647, 0, 1, 1,
0.6731912, -1.318215, 3.883033, 0.4156863, 0, 1, 1,
0.6798219, 0.8849106, 1.252678, 0.4235294, 0, 1, 1,
0.6803594, -0.01890627, 0.9308882, 0.427451, 0, 1, 1,
0.6808646, 0.2784975, -0.1433154, 0.4352941, 0, 1, 1,
0.6809132, 1.333095, -0.7573511, 0.4392157, 0, 1, 1,
0.6809738, -0.2528361, 2.095799, 0.4470588, 0, 1, 1,
0.6842606, -0.3639106, 1.894726, 0.4509804, 0, 1, 1,
0.6843082, -0.6643266, 3.178431, 0.4588235, 0, 1, 1,
0.6882287, -0.6495621, 3.162485, 0.4627451, 0, 1, 1,
0.6889054, -1.129779, 3.429638, 0.4705882, 0, 1, 1,
0.6932135, -0.01226925, 3.428635, 0.4745098, 0, 1, 1,
0.699077, -0.4180458, 4.659673, 0.4823529, 0, 1, 1,
0.7016351, -0.2871768, -0.1166188, 0.4862745, 0, 1, 1,
0.7092181, 2.285476, 0.6914873, 0.4941176, 0, 1, 1,
0.7113523, -0.02721327, 1.869223, 0.5019608, 0, 1, 1,
0.7152393, 0.117278, 2.084676, 0.5058824, 0, 1, 1,
0.7165843, 0.4608414, 0.1198901, 0.5137255, 0, 1, 1,
0.7183455, -0.06075903, 3.23311, 0.5176471, 0, 1, 1,
0.7190678, -0.5090719, 0.8477032, 0.5254902, 0, 1, 1,
0.7244251, -1.917546, 2.802217, 0.5294118, 0, 1, 1,
0.726539, -1.611399, 3.436197, 0.5372549, 0, 1, 1,
0.7334743, 0.2815939, 2.968806, 0.5411765, 0, 1, 1,
0.7338356, -0.6037785, 4.455758, 0.5490196, 0, 1, 1,
0.7355106, -0.3343334, 1.083853, 0.5529412, 0, 1, 1,
0.7437378, -0.01662485, 1.771365, 0.5607843, 0, 1, 1,
0.7438114, -1.8115, 3.146324, 0.5647059, 0, 1, 1,
0.744898, 0.6053349, 1.366024, 0.572549, 0, 1, 1,
0.752017, -0.6751689, 2.913956, 0.5764706, 0, 1, 1,
0.7566564, 1.919994, 0.9538107, 0.5843138, 0, 1, 1,
0.7622225, 0.9772639, 0.4578593, 0.5882353, 0, 1, 1,
0.7639798, 0.3784673, 0.5474027, 0.5960785, 0, 1, 1,
0.7651173, -0.2180873, 1.353833, 0.6039216, 0, 1, 1,
0.7677457, -1.411163, 2.550853, 0.6078432, 0, 1, 1,
0.7683001, 0.9506299, 1.732622, 0.6156863, 0, 1, 1,
0.776891, -0.7095307, 1.792065, 0.6196079, 0, 1, 1,
0.7773249, 0.899608, 0.2398445, 0.627451, 0, 1, 1,
0.7797068, -0.6704083, 3.127655, 0.6313726, 0, 1, 1,
0.782483, -0.4595622, 3.485097, 0.6392157, 0, 1, 1,
0.7827284, -0.4511023, 1.595893, 0.6431373, 0, 1, 1,
0.7837228, 1.576468, 0.5420954, 0.6509804, 0, 1, 1,
0.7878374, -0.04505185, 1.585717, 0.654902, 0, 1, 1,
0.7899448, 1.721892, 1.658018, 0.6627451, 0, 1, 1,
0.7923195, 0.9981776, 1.268428, 0.6666667, 0, 1, 1,
0.7925021, -0.5973766, 2.999543, 0.6745098, 0, 1, 1,
0.7946671, 0.5097017, 0.739035, 0.6784314, 0, 1, 1,
0.8054436, -0.1316811, 2.136142, 0.6862745, 0, 1, 1,
0.8070338, 0.06014451, 2.510575, 0.6901961, 0, 1, 1,
0.8082907, 0.2171573, 2.797799, 0.6980392, 0, 1, 1,
0.8098096, -0.6850324, 0.8883411, 0.7058824, 0, 1, 1,
0.8143838, -1.43539, 3.128075, 0.7098039, 0, 1, 1,
0.8150178, 0.6306217, 0.02443522, 0.7176471, 0, 1, 1,
0.8193411, -0.6539429, 2.332253, 0.7215686, 0, 1, 1,
0.8197472, 0.02780893, 2.970196, 0.7294118, 0, 1, 1,
0.8222272, -0.9598075, 2.972151, 0.7333333, 0, 1, 1,
0.833214, 0.2858852, -0.418347, 0.7411765, 0, 1, 1,
0.8374628, 0.8639874, 1.735677, 0.7450981, 0, 1, 1,
0.8387402, -0.6137615, 3.108153, 0.7529412, 0, 1, 1,
0.8439313, 0.7143583, 2.229243, 0.7568628, 0, 1, 1,
0.844696, -1.149132, 3.209798, 0.7647059, 0, 1, 1,
0.8448734, 0.3528176, 0.03270903, 0.7686275, 0, 1, 1,
0.8467683, 0.5824957, 0.9973711, 0.7764706, 0, 1, 1,
0.8485582, 0.7245025, 1.728385, 0.7803922, 0, 1, 1,
0.8546638, -1.02693, 1.639428, 0.7882353, 0, 1, 1,
0.8563696, 0.7362255, 0.3204336, 0.7921569, 0, 1, 1,
0.8579662, -1.197433, 1.819971, 0.8, 0, 1, 1,
0.8612961, 0.4083474, 1.32614, 0.8078431, 0, 1, 1,
0.8621355, -0.6302041, 0.9738286, 0.8117647, 0, 1, 1,
0.8646508, -0.2810109, 2.158578, 0.8196079, 0, 1, 1,
0.8729885, 0.3700175, 2.235779, 0.8235294, 0, 1, 1,
0.8736642, -1.222085, 1.152867, 0.8313726, 0, 1, 1,
0.8762286, 0.1638007, 1.7983, 0.8352941, 0, 1, 1,
0.8852336, -0.7596327, 1.217549, 0.8431373, 0, 1, 1,
0.8893026, 1.3317, 0.4627011, 0.8470588, 0, 1, 1,
0.8910016, 0.7564438, 0.5252417, 0.854902, 0, 1, 1,
0.8927474, 0.6055441, 1.482729, 0.8588235, 0, 1, 1,
0.8950164, -1.946554, 2.374267, 0.8666667, 0, 1, 1,
0.8975571, -0.0972339, 3.273196, 0.8705882, 0, 1, 1,
0.9011835, 0.351978, 1.78354, 0.8784314, 0, 1, 1,
0.9038219, 1.114792, -0.2311316, 0.8823529, 0, 1, 1,
0.9043479, -1.12498, 1.765917, 0.8901961, 0, 1, 1,
0.9052271, 0.4784038, 1.791896, 0.8941177, 0, 1, 1,
0.9101623, 1.348097, 1.473175, 0.9019608, 0, 1, 1,
0.9102141, 0.5711754, 1.953689, 0.9098039, 0, 1, 1,
0.9147778, 0.5757555, 2.020526, 0.9137255, 0, 1, 1,
0.9237226, -0.6065271, 3.093613, 0.9215686, 0, 1, 1,
0.9277354, -0.7577578, 2.632345, 0.9254902, 0, 1, 1,
0.9280999, -0.4371382, 4.436902, 0.9333333, 0, 1, 1,
0.9285166, -1.465477, 3.172531, 0.9372549, 0, 1, 1,
0.9301205, -0.8298804, 1.970856, 0.945098, 0, 1, 1,
0.9353348, -1.221605, 1.157756, 0.9490196, 0, 1, 1,
0.9387547, 0.5862471, 1.567777, 0.9568627, 0, 1, 1,
0.9391232, -0.8712967, 2.320513, 0.9607843, 0, 1, 1,
0.9430622, 0.2790602, 2.615197, 0.9686275, 0, 1, 1,
0.9438139, -0.3745751, 3.781873, 0.972549, 0, 1, 1,
0.9497864, -0.614782, 2.47053, 0.9803922, 0, 1, 1,
0.9525064, 0.1113769, 0.9318755, 0.9843137, 0, 1, 1,
0.9528922, 0.0419603, 0.8154235, 0.9921569, 0, 1, 1,
0.9548113, 0.1493637, 1.389826, 0.9960784, 0, 1, 1,
0.9559307, 0.3501305, 0.5070723, 1, 0, 0.9960784, 1,
0.9562899, 0.154293, -0.2784183, 1, 0, 0.9882353, 1,
0.9563521, -0.2706627, 4.106002, 1, 0, 0.9843137, 1,
0.9568461, -1.548877, 2.440915, 1, 0, 0.9764706, 1,
0.9575848, 0.414141, -0.6926191, 1, 0, 0.972549, 1,
0.9594346, -0.8615326, 3.176003, 1, 0, 0.9647059, 1,
0.9694654, 1.856493, 0.09407441, 1, 0, 0.9607843, 1,
0.9698794, -0.6022293, 2.230535, 1, 0, 0.9529412, 1,
0.9743803, -0.6315563, 0.5536488, 1, 0, 0.9490196, 1,
0.9764713, 1.358923, 1.369882, 1, 0, 0.9411765, 1,
0.9771239, -0.4634804, 2.858317, 1, 0, 0.9372549, 1,
0.9777266, -0.0108062, 2.408998, 1, 0, 0.9294118, 1,
0.9851037, 0.4711219, 2.111858, 1, 0, 0.9254902, 1,
0.985786, -0.6154932, 2.113953, 1, 0, 0.9176471, 1,
0.9877178, -1.105372, 2.412681, 1, 0, 0.9137255, 1,
1.002864, 1.834418, 0.6297059, 1, 0, 0.9058824, 1,
1.003606, 0.7219075, 2.222714, 1, 0, 0.9019608, 1,
1.005858, 0.6265488, 1.024822, 1, 0, 0.8941177, 1,
1.006578, 1.992261, -0.2111962, 1, 0, 0.8862745, 1,
1.00693, 0.8883814, -0.2881563, 1, 0, 0.8823529, 1,
1.007285, 1.251046, -0.01231491, 1, 0, 0.8745098, 1,
1.013455, -1.639381, 2.481818, 1, 0, 0.8705882, 1,
1.028587, 0.06650059, 1.607944, 1, 0, 0.8627451, 1,
1.031045, 0.01981699, 0.2471966, 1, 0, 0.8588235, 1,
1.033781, 0.7761974, 2.436442, 1, 0, 0.8509804, 1,
1.039858, -0.2276836, 1.47182, 1, 0, 0.8470588, 1,
1.040884, -0.8905371, 2.63486, 1, 0, 0.8392157, 1,
1.041526, 0.453828, 1.090793, 1, 0, 0.8352941, 1,
1.046416, 1.034024, 0.9573714, 1, 0, 0.827451, 1,
1.04869, -0.4641423, 2.714667, 1, 0, 0.8235294, 1,
1.051862, 0.4993495, 1.390646, 1, 0, 0.8156863, 1,
1.052221, 0.1501081, 1.557064, 1, 0, 0.8117647, 1,
1.054613, -0.180489, 3.202199, 1, 0, 0.8039216, 1,
1.066116, -0.995797, 2.07185, 1, 0, 0.7960784, 1,
1.068031, -0.2351725, 1.059698, 1, 0, 0.7921569, 1,
1.068037, -1.254487, 1.627031, 1, 0, 0.7843137, 1,
1.069176, -1.409697, 2.5357, 1, 0, 0.7803922, 1,
1.071844, -1.308846, 3.115156, 1, 0, 0.772549, 1,
1.075035, -0.3337927, 3.448682, 1, 0, 0.7686275, 1,
1.075741, 1.040431, 0.8986806, 1, 0, 0.7607843, 1,
1.090607, 0.6244636, -0.7293331, 1, 0, 0.7568628, 1,
1.095357, 0.3471985, 0.6321946, 1, 0, 0.7490196, 1,
1.101817, 1.101052, 1.583851, 1, 0, 0.7450981, 1,
1.103024, -0.8491354, 2.453316, 1, 0, 0.7372549, 1,
1.106046, -0.4852335, 2.985126, 1, 0, 0.7333333, 1,
1.13787, -0.6968185, 2.59682, 1, 0, 0.7254902, 1,
1.138715, -1.606865, 4.089021, 1, 0, 0.7215686, 1,
1.143831, -2.178474, 3.248041, 1, 0, 0.7137255, 1,
1.144349, 0.09569577, 0.1492524, 1, 0, 0.7098039, 1,
1.150712, 0.1713596, 2.946946, 1, 0, 0.7019608, 1,
1.152506, 0.8352717, 1.231431, 1, 0, 0.6941177, 1,
1.154045, -0.157644, 0.1964102, 1, 0, 0.6901961, 1,
1.167483, -0.1038611, 2.232583, 1, 0, 0.682353, 1,
1.169267, -0.9210142, 2.470216, 1, 0, 0.6784314, 1,
1.171322, -0.1432055, 2.810884, 1, 0, 0.6705883, 1,
1.177356, 0.2332018, 0.908364, 1, 0, 0.6666667, 1,
1.181052, 0.005537623, 1.814628, 1, 0, 0.6588235, 1,
1.184214, -0.5054402, 1.600363, 1, 0, 0.654902, 1,
1.187772, -1.167486, 2.091909, 1, 0, 0.6470588, 1,
1.19269, 0.6982719, 0.3558801, 1, 0, 0.6431373, 1,
1.192961, -0.2341807, 1.841053, 1, 0, 0.6352941, 1,
1.199713, -0.1781174, 2.273703, 1, 0, 0.6313726, 1,
1.210582, 0.2497812, 1.641115, 1, 0, 0.6235294, 1,
1.227485, -1.870348, 0.752668, 1, 0, 0.6196079, 1,
1.232338, -0.7885341, 1.440026, 1, 0, 0.6117647, 1,
1.235274, -0.1363004, 1.266792, 1, 0, 0.6078432, 1,
1.236595, -0.8698314, 1.512154, 1, 0, 0.6, 1,
1.236738, -1.300364, 2.87837, 1, 0, 0.5921569, 1,
1.240752, -0.7748732, 3.248353, 1, 0, 0.5882353, 1,
1.241812, 1.040619, 1.387806, 1, 0, 0.5803922, 1,
1.245679, -0.3830589, 1.140978, 1, 0, 0.5764706, 1,
1.247434, 1.317159, 0.4674537, 1, 0, 0.5686275, 1,
1.248148, -0.6107579, 1.699634, 1, 0, 0.5647059, 1,
1.255907, 0.8596854, 0.7950641, 1, 0, 0.5568628, 1,
1.256723, 0.9559767, -0.3723196, 1, 0, 0.5529412, 1,
1.259092, 0.635225, 1.576233, 1, 0, 0.5450981, 1,
1.265964, 0.2616144, 2.560461, 1, 0, 0.5411765, 1,
1.272309, -0.6090288, 2.597908, 1, 0, 0.5333334, 1,
1.281592, 0.5391977, 0.5939105, 1, 0, 0.5294118, 1,
1.287931, -0.5963878, 3.163864, 1, 0, 0.5215687, 1,
1.300402, -1.899225, 1.515527, 1, 0, 0.5176471, 1,
1.310726, 0.284056, 1.870722, 1, 0, 0.509804, 1,
1.318399, 0.4334034, 0.4613484, 1, 0, 0.5058824, 1,
1.321795, 1.20434, 0.7006667, 1, 0, 0.4980392, 1,
1.328273, 0.4886682, 0.8244693, 1, 0, 0.4901961, 1,
1.334346, 1.111227, 0.4063133, 1, 0, 0.4862745, 1,
1.336921, 0.189265, 0.3689954, 1, 0, 0.4784314, 1,
1.339733, -0.5687511, 2.470673, 1, 0, 0.4745098, 1,
1.344668, -1.847308, 3.10058, 1, 0, 0.4666667, 1,
1.359654, 0.6158372, -0.3950774, 1, 0, 0.4627451, 1,
1.364242, 1.97607, -0.1714322, 1, 0, 0.454902, 1,
1.380946, -0.7954566, 2.27308, 1, 0, 0.4509804, 1,
1.385036, -0.7607952, 1.710369, 1, 0, 0.4431373, 1,
1.38891, -1.625891, 1.504981, 1, 0, 0.4392157, 1,
1.410878, -0.3250138, 2.510267, 1, 0, 0.4313726, 1,
1.42182, -0.3835374, 1.607754, 1, 0, 0.427451, 1,
1.427435, 0.8694415, 2.055415, 1, 0, 0.4196078, 1,
1.44194, 0.2425431, 1.623777, 1, 0, 0.4156863, 1,
1.472205, -1.380451, 2.654471, 1, 0, 0.4078431, 1,
1.477809, -0.3498415, 2.92148, 1, 0, 0.4039216, 1,
1.481618, -1.593042, 2.495762, 1, 0, 0.3960784, 1,
1.49013, -1.533507, 2.303947, 1, 0, 0.3882353, 1,
1.496514, 1.126357, 0.8628633, 1, 0, 0.3843137, 1,
1.499733, 1.115406, 1.063707, 1, 0, 0.3764706, 1,
1.502338, 0.735179, 0.9925545, 1, 0, 0.372549, 1,
1.503601, -1.305782, 2.903534, 1, 0, 0.3647059, 1,
1.524838, 1.172499, 0.6158341, 1, 0, 0.3607843, 1,
1.532788, 1.792408, 0.7632447, 1, 0, 0.3529412, 1,
1.537199, -0.904887, 4.284123, 1, 0, 0.3490196, 1,
1.556167, -1.640682, 3.718305, 1, 0, 0.3411765, 1,
1.558291, -1.358583, 1.940485, 1, 0, 0.3372549, 1,
1.564417, -0.5510678, 1.503611, 1, 0, 0.3294118, 1,
1.568764, -0.04288059, 0.5844817, 1, 0, 0.3254902, 1,
1.574203, -0.1923899, 1.011199, 1, 0, 0.3176471, 1,
1.583849, 0.4505398, 0.09045728, 1, 0, 0.3137255, 1,
1.585179, -0.07281891, -0.07128158, 1, 0, 0.3058824, 1,
1.59731, -2.238195, 0.747398, 1, 0, 0.2980392, 1,
1.600087, -0.7468255, 2.615868, 1, 0, 0.2941177, 1,
1.612836, -0.316797, 3.943127, 1, 0, 0.2862745, 1,
1.618996, -1.094244, 2.750871, 1, 0, 0.282353, 1,
1.633352, -0.08495894, 1.204777, 1, 0, 0.2745098, 1,
1.647449, -0.4759268, 1.755521, 1, 0, 0.2705882, 1,
1.656986, -0.7062706, 2.401884, 1, 0, 0.2627451, 1,
1.667146, 0.8103894, 1.644961, 1, 0, 0.2588235, 1,
1.67308, 0.1059472, 1.616954, 1, 0, 0.2509804, 1,
1.677708, 2.071441, -0.750628, 1, 0, 0.2470588, 1,
1.699785, 0.8661498, 0.005454646, 1, 0, 0.2392157, 1,
1.710573, 0.8857347, 1.089197, 1, 0, 0.2352941, 1,
1.722379, -1.766926, 2.514512, 1, 0, 0.227451, 1,
1.732048, -1.181589, 0.3653459, 1, 0, 0.2235294, 1,
1.736203, 0.9978423, 2.142852, 1, 0, 0.2156863, 1,
1.753126, 0.9032302, 0.5718064, 1, 0, 0.2117647, 1,
1.762775, -0.3542179, 0.7243757, 1, 0, 0.2039216, 1,
1.817747, -0.5530328, 2.90473, 1, 0, 0.1960784, 1,
1.821211, 0.5610094, 0.4856823, 1, 0, 0.1921569, 1,
1.833228, -2.287715, 3.695211, 1, 0, 0.1843137, 1,
1.84053, -0.2271966, 2.124063, 1, 0, 0.1803922, 1,
1.858386, 0.4723029, 2.154795, 1, 0, 0.172549, 1,
1.864343, -0.1281464, 0.6819607, 1, 0, 0.1686275, 1,
1.868505, 0.1469905, 0.5745976, 1, 0, 0.1607843, 1,
1.893041, -0.6237555, 2.307868, 1, 0, 0.1568628, 1,
1.928533, -0.4385175, 1.393455, 1, 0, 0.1490196, 1,
1.950236, -0.9192648, 1.077658, 1, 0, 0.145098, 1,
1.991181, 0.2773887, 0.05038991, 1, 0, 0.1372549, 1,
2.009343, 0.7885084, 2.094697, 1, 0, 0.1333333, 1,
2.025348, 1.128034, 1.90827, 1, 0, 0.1254902, 1,
2.070535, 0.09454124, 1.25505, 1, 0, 0.1215686, 1,
2.144142, 0.4056566, 0.3059175, 1, 0, 0.1137255, 1,
2.150412, 0.7176596, 0.7135961, 1, 0, 0.1098039, 1,
2.151945, 0.7061977, 0.1234771, 1, 0, 0.1019608, 1,
2.16655, -0.1835093, 0.501141, 1, 0, 0.09411765, 1,
2.214289, -0.606904, 1.178705, 1, 0, 0.09019608, 1,
2.218287, 1.053323, 0.1256011, 1, 0, 0.08235294, 1,
2.223235, 0.04376484, 1.045164, 1, 0, 0.07843138, 1,
2.280988, -0.2408727, 0.6625442, 1, 0, 0.07058824, 1,
2.306777, 0.8410074, -0.1887798, 1, 0, 0.06666667, 1,
2.397373, 1.020406, 1.121517, 1, 0, 0.05882353, 1,
2.423505, 1.2953, 0.7945806, 1, 0, 0.05490196, 1,
2.440737, -1.363002, 1.652739, 1, 0, 0.04705882, 1,
2.55117, -0.04727972, 1.975705, 1, 0, 0.04313726, 1,
2.630553, 0.5862377, -0.5968599, 1, 0, 0.03529412, 1,
2.652241, 1.214569, 0.7824178, 1, 0, 0.03137255, 1,
2.705518, -0.8275568, 1.370735, 1, 0, 0.02352941, 1,
2.893512, -0.6219633, 1.897171, 1, 0, 0.01960784, 1,
2.895512, 0.9351046, 1.454658, 1, 0, 0.01176471, 1,
3.195119, -0.1328583, 2.787117, 1, 0, 0.007843138, 1
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
-0.1087631, -4.138323, -7.381549, 0, -0.5, 0.5, 0.5,
-0.1087631, -4.138323, -7.381549, 1, -0.5, 0.5, 0.5,
-0.1087631, -4.138323, -7.381549, 1, 1.5, 0.5, 0.5,
-0.1087631, -4.138323, -7.381549, 0, 1.5, 0.5, 0.5
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
-4.532661, 0.08604872, -7.381549, 0, -0.5, 0.5, 0.5,
-4.532661, 0.08604872, -7.381549, 1, -0.5, 0.5, 0.5,
-4.532661, 0.08604872, -7.381549, 1, 1.5, 0.5, 0.5,
-4.532661, 0.08604872, -7.381549, 0, 1.5, 0.5, 0.5
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
-4.532661, -4.138323, 0.08676815, 0, -0.5, 0.5, 0.5,
-4.532661, -4.138323, 0.08676815, 1, -0.5, 0.5, 0.5,
-4.532661, -4.138323, 0.08676815, 1, 1.5, 0.5, 0.5,
-4.532661, -4.138323, 0.08676815, 0, 1.5, 0.5, 0.5
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
-3, -3.163468, -5.658092,
3, -3.163468, -5.658092,
-3, -3.163468, -5.658092,
-3, -3.325944, -5.945334,
-2, -3.163468, -5.658092,
-2, -3.325944, -5.945334,
-1, -3.163468, -5.658092,
-1, -3.325944, -5.945334,
0, -3.163468, -5.658092,
0, -3.325944, -5.945334,
1, -3.163468, -5.658092,
1, -3.325944, -5.945334,
2, -3.163468, -5.658092,
2, -3.325944, -5.945334,
3, -3.163468, -5.658092,
3, -3.325944, -5.945334
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
-3, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
-3, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
-3, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
-3, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
-2, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
-2, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
-2, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
-2, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
-1, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
-1, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
-1, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
-1, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
0, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
0, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
0, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
0, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
1, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
1, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
1, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
1, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
2, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
2, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
2, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
2, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5,
3, -3.650895, -6.519821, 0, -0.5, 0.5, 0.5,
3, -3.650895, -6.519821, 1, -0.5, 0.5, 0.5,
3, -3.650895, -6.519821, 1, 1.5, 0.5, 0.5,
3, -3.650895, -6.519821, 0, 1.5, 0.5, 0.5
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
-3.511762, -3, -5.658092,
-3.511762, 3, -5.658092,
-3.511762, -3, -5.658092,
-3.681911, -3, -5.945334,
-3.511762, -2, -5.658092,
-3.681911, -2, -5.945334,
-3.511762, -1, -5.658092,
-3.681911, -1, -5.945334,
-3.511762, 0, -5.658092,
-3.681911, 0, -5.945334,
-3.511762, 1, -5.658092,
-3.681911, 1, -5.945334,
-3.511762, 2, -5.658092,
-3.681911, 2, -5.945334,
-3.511762, 3, -5.658092,
-3.681911, 3, -5.945334
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
-4.022212, -3, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, -3, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, -3, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, -3, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, -2, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, -2, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, -2, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, -2, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, -1, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, -1, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, -1, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, -1, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, 0, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, 0, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, 0, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, 0, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, 1, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, 1, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, 1, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, 1, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, 2, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, 2, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, 2, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, 2, -6.519821, 0, 1.5, 0.5, 0.5,
-4.022212, 3, -6.519821, 0, -0.5, 0.5, 0.5,
-4.022212, 3, -6.519821, 1, -0.5, 0.5, 0.5,
-4.022212, 3, -6.519821, 1, 1.5, 0.5, 0.5,
-4.022212, 3, -6.519821, 0, 1.5, 0.5, 0.5
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
-3.511762, -3.163468, -4,
-3.511762, -3.163468, 4,
-3.511762, -3.163468, -4,
-3.681911, -3.325944, -4,
-3.511762, -3.163468, -2,
-3.681911, -3.325944, -2,
-3.511762, -3.163468, 0,
-3.681911, -3.325944, 0,
-3.511762, -3.163468, 2,
-3.681911, -3.325944, 2,
-3.511762, -3.163468, 4,
-3.681911, -3.325944, 4
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
-4.022212, -3.650895, -4, 0, -0.5, 0.5, 0.5,
-4.022212, -3.650895, -4, 1, -0.5, 0.5, 0.5,
-4.022212, -3.650895, -4, 1, 1.5, 0.5, 0.5,
-4.022212, -3.650895, -4, 0, 1.5, 0.5, 0.5,
-4.022212, -3.650895, -2, 0, -0.5, 0.5, 0.5,
-4.022212, -3.650895, -2, 1, -0.5, 0.5, 0.5,
-4.022212, -3.650895, -2, 1, 1.5, 0.5, 0.5,
-4.022212, -3.650895, -2, 0, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 0, 0, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 0, 1, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 0, 1, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 0, 0, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 2, 0, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 2, 1, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 2, 1, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 2, 0, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 4, 0, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 4, 1, -0.5, 0.5, 0.5,
-4.022212, -3.650895, 4, 1, 1.5, 0.5, 0.5,
-4.022212, -3.650895, 4, 0, 1.5, 0.5, 0.5
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
-3.511762, -3.163468, -5.658092,
-3.511762, 3.335565, -5.658092,
-3.511762, -3.163468, 5.831628,
-3.511762, 3.335565, 5.831628,
-3.511762, -3.163468, -5.658092,
-3.511762, -3.163468, 5.831628,
-3.511762, 3.335565, -5.658092,
-3.511762, 3.335565, 5.831628,
-3.511762, -3.163468, -5.658092,
3.294235, -3.163468, -5.658092,
-3.511762, -3.163468, 5.831628,
3.294235, -3.163468, 5.831628,
-3.511762, 3.335565, -5.658092,
3.294235, 3.335565, -5.658092,
-3.511762, 3.335565, 5.831628,
3.294235, 3.335565, 5.831628,
3.294235, -3.163468, -5.658092,
3.294235, 3.335565, -5.658092,
3.294235, -3.163468, 5.831628,
3.294235, 3.335565, 5.831628,
3.294235, -3.163468, -5.658092,
3.294235, -3.163468, 5.831628,
3.294235, 3.335565, -5.658092,
3.294235, 3.335565, 5.831628
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
var radius = 7.930514;
var distance = 35.28376;
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
mvMatrix.translate( 0.1087631, -0.08604872, -0.08676815 );
mvMatrix.scale( 1.259863, 1.31937, 0.7462869 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.28376);
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
sodium_aluminum_fluo<-read.table("sodium_aluminum_fluo.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_aluminum_fluo$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
```

```r
y<-sodium_aluminum_fluo$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
```

```r
z<-sodium_aluminum_fluo$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
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
-3.412645, 0.8063448, -1.940421, 0, 0, 1, 1, 1,
-3.052354, -0.58128, -1.228106, 1, 0, 0, 1, 1,
-2.76723, 1.359337, -2.431937, 1, 0, 0, 1, 1,
-2.683434, -1.799962, -1.346651, 1, 0, 0, 1, 1,
-2.608928, -0.02937846, -0.1952306, 1, 0, 0, 1, 1,
-2.528762, -1.155396, -1.730682, 1, 0, 0, 1, 1,
-2.463882, 0.5210377, -2.023271, 0, 0, 0, 1, 1,
-2.44549, -0.06642634, -2.267174, 0, 0, 0, 1, 1,
-2.36767, -0.56975, -2.50333, 0, 0, 0, 1, 1,
-2.303577, 0.8636056, -2.08391, 0, 0, 0, 1, 1,
-2.285248, 0.8472428, -1.557024, 0, 0, 0, 1, 1,
-2.200871, 1.20932, 0.05474467, 0, 0, 0, 1, 1,
-2.140368, 0.001380516, -1.913468, 0, 0, 0, 1, 1,
-2.093426, -0.1235059, -1.885942, 1, 1, 1, 1, 1,
-2.087769, 3.094186, 0.02116255, 1, 1, 1, 1, 1,
-2.086308, -0.1612136, -0.5522251, 1, 1, 1, 1, 1,
-2.072341, 1.190069, -0.4585098, 1, 1, 1, 1, 1,
-2.053517, -0.4013335, -0.466743, 1, 1, 1, 1, 1,
-2.053439, 0.2146435, -2.670153, 1, 1, 1, 1, 1,
-2.023835, -0.7799635, -2.450744, 1, 1, 1, 1, 1,
-2.006619, -0.3353971, -3.009458, 1, 1, 1, 1, 1,
-1.978711, 1.005339, 0.5607311, 1, 1, 1, 1, 1,
-1.956803, 0.2978419, -3.411621, 1, 1, 1, 1, 1,
-1.923718, 1.739431, -0.4747752, 1, 1, 1, 1, 1,
-1.919384, 0.9877851, -0.02567262, 1, 1, 1, 1, 1,
-1.918895, 1.326889, -1.959261, 1, 1, 1, 1, 1,
-1.913375, 1.248246, 0.09039651, 1, 1, 1, 1, 1,
-1.89023, 0.8006209, -1.684345, 1, 1, 1, 1, 1,
-1.861845, 0.7709002, -1.890083, 0, 0, 1, 1, 1,
-1.855702, 0.6628594, -2.819838, 1, 0, 0, 1, 1,
-1.852266, 2.734782, -0.4030863, 1, 0, 0, 1, 1,
-1.852061, -0.8426357, -1.69039, 1, 0, 0, 1, 1,
-1.84904, 1.123551, -1.737968, 1, 0, 0, 1, 1,
-1.839865, 0.8839557, -2.452929, 1, 0, 0, 1, 1,
-1.795804, 0.2733058, -3.081751, 0, 0, 0, 1, 1,
-1.772674, -0.1427304, -1.899137, 0, 0, 0, 1, 1,
-1.77147, -0.13549, -1.568601, 0, 0, 0, 1, 1,
-1.77093, -0.488463, -1.246641, 0, 0, 0, 1, 1,
-1.764758, 0.2304695, -1.218103, 0, 0, 0, 1, 1,
-1.75912, 2.776727, -1.055883, 0, 0, 0, 1, 1,
-1.754753, 1.461694, -2.489645, 0, 0, 0, 1, 1,
-1.753796, 0.08375994, -2.212576, 1, 1, 1, 1, 1,
-1.721101, -1.382512, -2.946567, 1, 1, 1, 1, 1,
-1.63967, 0.9100339, 1.779553, 1, 1, 1, 1, 1,
-1.610491, 1.787963, -0.2834959, 1, 1, 1, 1, 1,
-1.585626, 0.2705452, 0.1157379, 1, 1, 1, 1, 1,
-1.577306, -0.07593462, -0.4616669, 1, 1, 1, 1, 1,
-1.574013, -2.089614, -2.804199, 1, 1, 1, 1, 1,
-1.537511, 0.1090401, -0.2619815, 1, 1, 1, 1, 1,
-1.530675, -0.4796859, -3.809525, 1, 1, 1, 1, 1,
-1.526196, -2.157717, -2.119887, 1, 1, 1, 1, 1,
-1.523941, -0.5566063, -1.747142, 1, 1, 1, 1, 1,
-1.521793, -0.02002253, -1.655933, 1, 1, 1, 1, 1,
-1.520306, 1.407248, -1.057904, 1, 1, 1, 1, 1,
-1.505106, 0.6227871, -2.546515, 1, 1, 1, 1, 1,
-1.496822, 0.4794323, -0.9015198, 1, 1, 1, 1, 1,
-1.477621, -0.1777087, -2.568122, 0, 0, 1, 1, 1,
-1.476395, -0.1151424, 0.4623684, 1, 0, 0, 1, 1,
-1.474469, 2.459311, 0.8545868, 1, 0, 0, 1, 1,
-1.468963, 0.7522316, -2.294793, 1, 0, 0, 1, 1,
-1.468291, -2.028488, -1.581759, 1, 0, 0, 1, 1,
-1.453839, -0.5547296, -0.9703436, 1, 0, 0, 1, 1,
-1.451863, -1.315707, -2.326993, 0, 0, 0, 1, 1,
-1.45167, -0.05797749, -2.302766, 0, 0, 0, 1, 1,
-1.419499, 0.4588537, 0.2951332, 0, 0, 0, 1, 1,
-1.390959, 0.5499299, -1.877739, 0, 0, 0, 1, 1,
-1.379085, -1.795875, -0.9607806, 0, 0, 0, 1, 1,
-1.378897, -1.285203, -3.753135, 0, 0, 0, 1, 1,
-1.369523, -1.124826, -1.476389, 0, 0, 0, 1, 1,
-1.369327, -1.413485, -2.455444, 1, 1, 1, 1, 1,
-1.367802, -1.815437, -2.679091, 1, 1, 1, 1, 1,
-1.356925, -0.07283045, -0.8744906, 1, 1, 1, 1, 1,
-1.35566, 0.5488108, -0.6894164, 1, 1, 1, 1, 1,
-1.337643, 0.781786, -2.018866, 1, 1, 1, 1, 1,
-1.33393, 0.5614319, -2.31006, 1, 1, 1, 1, 1,
-1.333083, -0.02236764, -2.440893, 1, 1, 1, 1, 1,
-1.329871, 0.8887078, -0.5752196, 1, 1, 1, 1, 1,
-1.323445, 0.07505111, -1.053765, 1, 1, 1, 1, 1,
-1.319282, 0.869484, 0.4634767, 1, 1, 1, 1, 1,
-1.304551, -0.237477, -1.846057, 1, 1, 1, 1, 1,
-1.303912, -0.2338536, -1.187161, 1, 1, 1, 1, 1,
-1.302081, -0.1807604, -2.57857, 1, 1, 1, 1, 1,
-1.301121, 1.651077, -1.129441, 1, 1, 1, 1, 1,
-1.294546, 0.7625786, -0.1031461, 1, 1, 1, 1, 1,
-1.290973, 0.5626838, -0.08269619, 0, 0, 1, 1, 1,
-1.28645, -0.357875, -1.923314, 1, 0, 0, 1, 1,
-1.284302, 0.4044871, -0.6967828, 1, 0, 0, 1, 1,
-1.28292, 0.5846581, -1.0006, 1, 0, 0, 1, 1,
-1.278104, 0.4564569, -1.377763, 1, 0, 0, 1, 1,
-1.276598, -0.5401101, -1.642815, 1, 0, 0, 1, 1,
-1.276398, 0.8190579, -0.5792439, 0, 0, 0, 1, 1,
-1.275537, 0.5476865, -0.5584263, 0, 0, 0, 1, 1,
-1.274901, -0.5655293, -1.075983, 0, 0, 0, 1, 1,
-1.27302, -1.702263, -2.005724, 0, 0, 0, 1, 1,
-1.263304, -0.211703, -2.617708, 0, 0, 0, 1, 1,
-1.262568, 2.025444, 0.4002649, 0, 0, 0, 1, 1,
-1.254103, -0.2436804, -1.987028, 0, 0, 0, 1, 1,
-1.252989, -0.3187013, -2.144156, 1, 1, 1, 1, 1,
-1.248878, 0.3303095, -0.6027685, 1, 1, 1, 1, 1,
-1.240089, -1.085276, -1.771059, 1, 1, 1, 1, 1,
-1.22036, 1.013307, -1.616814, 1, 1, 1, 1, 1,
-1.20093, -0.7789561, -3.551074, 1, 1, 1, 1, 1,
-1.193375, -0.8064473, -2.656662, 1, 1, 1, 1, 1,
-1.18907, -0.2952027, -2.095457, 1, 1, 1, 1, 1,
-1.185653, -1.748311, -1.37174, 1, 1, 1, 1, 1,
-1.175311, 0.8433617, -0.0174171, 1, 1, 1, 1, 1,
-1.168563, 0.233544, -2.758283, 1, 1, 1, 1, 1,
-1.162748, 0.2850567, 0.2496415, 1, 1, 1, 1, 1,
-1.152984, -0.4386456, -3.309051, 1, 1, 1, 1, 1,
-1.138405, -0.187046, -0.6329174, 1, 1, 1, 1, 1,
-1.13765, -0.9977339, -2.451902, 1, 1, 1, 1, 1,
-1.13256, 1.653263, -0.5627385, 1, 1, 1, 1, 1,
-1.131536, 1.104367, -0.8577905, 0, 0, 1, 1, 1,
-1.129954, 0.8568962, 0.6217469, 1, 0, 0, 1, 1,
-1.120583, 1.640666, 0.7370132, 1, 0, 0, 1, 1,
-1.108641, 1.217306, -1.701182, 1, 0, 0, 1, 1,
-1.105835, -0.06979474, -1.140506, 1, 0, 0, 1, 1,
-1.10481, -1.086576, -1.656106, 1, 0, 0, 1, 1,
-1.10086, -0.4113153, -3.52719, 0, 0, 0, 1, 1,
-1.099016, -0.3954623, -1.723285, 0, 0, 0, 1, 1,
-1.097876, -0.5464092, -2.143268, 0, 0, 0, 1, 1,
-1.084959, -1.28057, -2.3651, 0, 0, 0, 1, 1,
-1.08073, -0.001740834, -1.480981, 0, 0, 0, 1, 1,
-1.07848, -0.2884328, -1.919328, 0, 0, 0, 1, 1,
-1.075107, -0.8487543, -2.896867, 0, 0, 0, 1, 1,
-1.07367, -0.646083, -2.260047, 1, 1, 1, 1, 1,
-1.067257, 0.2270208, -0.1212996, 1, 1, 1, 1, 1,
-1.042977, 0.3730245, -1.73753, 1, 1, 1, 1, 1,
-1.042965, -0.2611349, -1.082034, 1, 1, 1, 1, 1,
-1.042407, -0.6768129, -1.828799, 1, 1, 1, 1, 1,
-1.029017, -0.04817014, -1.256257, 1, 1, 1, 1, 1,
-1.026206, 1.175786, -2.252986, 1, 1, 1, 1, 1,
-1.023863, -0.2503027, -2.453549, 1, 1, 1, 1, 1,
-1.020603, 0.7003026, -1.18871, 1, 1, 1, 1, 1,
-1.017228, 1.186315, -1.835698, 1, 1, 1, 1, 1,
-1.015627, 3.240919, -1.61352, 1, 1, 1, 1, 1,
-1.014311, 0.6789107, -1.845208, 1, 1, 1, 1, 1,
-1.013747, 1.568527, -0.3841638, 1, 1, 1, 1, 1,
-1.01313, 1.038826, 0.05553165, 1, 1, 1, 1, 1,
-1.006229, 1.393118, -1.68189, 1, 1, 1, 1, 1,
-0.9879101, -0.6814729, -1.541164, 0, 0, 1, 1, 1,
-0.9730695, -0.3205439, -1.512265, 1, 0, 0, 1, 1,
-0.9718948, -0.5615489, -2.93595, 1, 0, 0, 1, 1,
-0.9711531, 0.6843745, 0.1459278, 1, 0, 0, 1, 1,
-0.9710504, 0.301199, 0.1287632, 1, 0, 0, 1, 1,
-0.9686749, 0.9965022, -1.156572, 1, 0, 0, 1, 1,
-0.9630156, 1.709285, 0.4605425, 0, 0, 0, 1, 1,
-0.958658, 0.1030241, -2.519125, 0, 0, 0, 1, 1,
-0.9562574, 0.540361, -0.2727523, 0, 0, 0, 1, 1,
-0.9425508, 0.9395453, -0.89268, 0, 0, 0, 1, 1,
-0.9373311, 0.6460651, -2.003383, 0, 0, 0, 1, 1,
-0.9334766, 1.542216, -4.042925, 0, 0, 0, 1, 1,
-0.9326601, 0.7031866, -0.3318694, 0, 0, 0, 1, 1,
-0.9285885, 1.836381, 0.7867916, 1, 1, 1, 1, 1,
-0.9233378, 0.5749515, 0.681003, 1, 1, 1, 1, 1,
-0.9227904, -1.273618, -3.002438, 1, 1, 1, 1, 1,
-0.9216689, -0.2061759, -2.839912, 1, 1, 1, 1, 1,
-0.9215705, 0.8970017, -3.326215, 1, 1, 1, 1, 1,
-0.9153357, -0.860409, -2.470249, 1, 1, 1, 1, 1,
-0.9093382, 1.354522, 0.2604219, 1, 1, 1, 1, 1,
-0.8995092, 1.121982, -1.173425, 1, 1, 1, 1, 1,
-0.8862081, -0.02875054, -0.3905979, 1, 1, 1, 1, 1,
-0.8861059, 2.272524, -0.3415384, 1, 1, 1, 1, 1,
-0.8786222, 0.8212948, 0.05684006, 1, 1, 1, 1, 1,
-0.8782711, -1.96354, -5.490766, 1, 1, 1, 1, 1,
-0.8769946, -0.944327, -2.625875, 1, 1, 1, 1, 1,
-0.8757863, -0.3491457, -0.2839182, 1, 1, 1, 1, 1,
-0.8743012, -1.003606, -3.344713, 1, 1, 1, 1, 1,
-0.8672137, -1.082491, -1.250359, 0, 0, 1, 1, 1,
-0.8644654, 1.923791, 0.01692136, 1, 0, 0, 1, 1,
-0.8634626, -0.507931, -2.004851, 1, 0, 0, 1, 1,
-0.8631516, -1.014158, -1.04421, 1, 0, 0, 1, 1,
-0.861791, -1.078333, -2.819144, 1, 0, 0, 1, 1,
-0.8600026, -0.6451668, -3.181056, 1, 0, 0, 1, 1,
-0.85072, 1.365363, 0.1858182, 0, 0, 0, 1, 1,
-0.847216, 0.2002172, -2.459259, 0, 0, 0, 1, 1,
-0.8464347, -1.33891, -2.349564, 0, 0, 0, 1, 1,
-0.8458337, -0.2731485, -2.133906, 0, 0, 0, 1, 1,
-0.8445336, 0.01532127, -2.161887, 0, 0, 0, 1, 1,
-0.8400192, -0.5108435, -1.225702, 0, 0, 0, 1, 1,
-0.8382599, 2.605999, -0.9764611, 0, 0, 0, 1, 1,
-0.8362919, 0.4412759, 0.9096861, 1, 1, 1, 1, 1,
-0.8329242, 0.6112736, -1.136224, 1, 1, 1, 1, 1,
-0.8308281, 1.065956, -0.2127945, 1, 1, 1, 1, 1,
-0.8305861, -1.44196, -3.5262, 1, 1, 1, 1, 1,
-0.822525, -2.015068, -2.922395, 1, 1, 1, 1, 1,
-0.8212115, 0.9452553, -2.725832, 1, 1, 1, 1, 1,
-0.8207807, 0.8785598, -0.8178457, 1, 1, 1, 1, 1,
-0.8114014, 0.5614646, -0.6219434, 1, 1, 1, 1, 1,
-0.809697, 0.2656601, -1.751988, 1, 1, 1, 1, 1,
-0.8062462, 0.1363294, -0.4016411, 1, 1, 1, 1, 1,
-0.804971, -0.09411661, -0.9574883, 1, 1, 1, 1, 1,
-0.8016592, -0.4301195, -2.453204, 1, 1, 1, 1, 1,
-0.7990122, -2.286306, -3.4549, 1, 1, 1, 1, 1,
-0.7966967, 0.5139123, -1.401814, 1, 1, 1, 1, 1,
-0.7884481, 0.01991028, -1.734487, 1, 1, 1, 1, 1,
-0.7870954, 0.1711919, -0.2331819, 0, 0, 1, 1, 1,
-0.785992, -0.2104991, -1.063597, 1, 0, 0, 1, 1,
-0.7850913, -0.493396, -3.339967, 1, 0, 0, 1, 1,
-0.7847162, -0.204029, -3.332201, 1, 0, 0, 1, 1,
-0.7840513, -0.2409531, -2.020703, 1, 0, 0, 1, 1,
-0.7837324, -1.507335, -4.303667, 1, 0, 0, 1, 1,
-0.7824795, 1.865148, 0.8167076, 0, 0, 0, 1, 1,
-0.7821161, -0.6643296, -2.164635, 0, 0, 0, 1, 1,
-0.7810266, 1.854954, -0.9386439, 0, 0, 0, 1, 1,
-0.7726387, -0.02625744, -0.7120757, 0, 0, 0, 1, 1,
-0.7668317, 1.082455, -0.8179809, 0, 0, 0, 1, 1,
-0.7599849, -0.267244, -3.079432, 0, 0, 0, 1, 1,
-0.754747, 0.759654, -1.817997, 0, 0, 0, 1, 1,
-0.7528765, 0.8309242, -1.840263, 1, 1, 1, 1, 1,
-0.747089, -0.5105643, -1.59216, 1, 1, 1, 1, 1,
-0.745559, -0.3875558, 0.00330811, 1, 1, 1, 1, 1,
-0.7439238, 0.1337816, -0.665603, 1, 1, 1, 1, 1,
-0.7425161, 0.2507114, 0.8370554, 1, 1, 1, 1, 1,
-0.7383887, 0.338424, -1.838229, 1, 1, 1, 1, 1,
-0.7360677, -3.068822, -1.28185, 1, 1, 1, 1, 1,
-0.7359456, -1.287573, -2.751547, 1, 1, 1, 1, 1,
-0.7322602, 2.046038, 1.68897, 1, 1, 1, 1, 1,
-0.7179891, 0.1408396, -1.09819, 1, 1, 1, 1, 1,
-0.7177359, 0.1401598, 0.5795314, 1, 1, 1, 1, 1,
-0.7170267, -0.2193509, -2.255972, 1, 1, 1, 1, 1,
-0.711566, 1.862638, -0.4621768, 1, 1, 1, 1, 1,
-0.7052214, -0.7400374, -1.708127, 1, 1, 1, 1, 1,
-0.7035643, 0.5573466, -0.08991728, 1, 1, 1, 1, 1,
-0.7016672, -0.0257925, -0.4226522, 0, 0, 1, 1, 1,
-0.6975553, -0.3052862, -2.92285, 1, 0, 0, 1, 1,
-0.6967139, -1.091226, -2.742654, 1, 0, 0, 1, 1,
-0.695593, -2.048173, -3.229168, 1, 0, 0, 1, 1,
-0.6929994, 0.3403079, -1.312524, 1, 0, 0, 1, 1,
-0.691222, -0.8671359, -1.095945, 1, 0, 0, 1, 1,
-0.6910249, 0.8456592, 0.3814929, 0, 0, 0, 1, 1,
-0.6833356, 0.400134, -2.215726, 0, 0, 0, 1, 1,
-0.6813662, 0.9245689, -0.7585022, 0, 0, 0, 1, 1,
-0.6799798, -0.2527457, -1.40636, 0, 0, 0, 1, 1,
-0.6762455, -0.4587215, -3.404275, 0, 0, 0, 1, 1,
-0.6674986, 1.109887, 0.4772342, 0, 0, 0, 1, 1,
-0.6663816, -2.136906, -3.118534, 0, 0, 0, 1, 1,
-0.6658995, -1.260905, -3.242584, 1, 1, 1, 1, 1,
-0.6602578, -0.1341162, -2.65166, 1, 1, 1, 1, 1,
-0.6552436, 0.7887906, 0.1754961, 1, 1, 1, 1, 1,
-0.654619, 0.1098633, -1.7157, 1, 1, 1, 1, 1,
-0.6541014, 0.6161492, -1.905861, 1, 1, 1, 1, 1,
-0.6526734, 0.13402, -1.135973, 1, 1, 1, 1, 1,
-0.6503659, -1.978088, -2.983572, 1, 1, 1, 1, 1,
-0.6452817, 1.099539, -0.2439214, 1, 1, 1, 1, 1,
-0.6419568, -0.722572, -3.046206, 1, 1, 1, 1, 1,
-0.6337125, -0.8275433, -2.910983, 1, 1, 1, 1, 1,
-0.6319981, 0.9878673, 0.6416886, 1, 1, 1, 1, 1,
-0.6276944, 0.2996476, -2.289063, 1, 1, 1, 1, 1,
-0.6193449, 1.028294, 0.8483458, 1, 1, 1, 1, 1,
-0.6111031, 1.054614, 0.6964712, 1, 1, 1, 1, 1,
-0.6079391, -0.8717839, -1.823127, 1, 1, 1, 1, 1,
-0.6034542, -0.0222053, 0.1828173, 0, 0, 1, 1, 1,
-0.5990191, -0.7446073, -4.370681, 1, 0, 0, 1, 1,
-0.5975978, -0.3345771, -2.76354, 1, 0, 0, 1, 1,
-0.5947316, 0.8813241, -0.8002144, 1, 0, 0, 1, 1,
-0.585004, -1.794006, -4.582193, 1, 0, 0, 1, 1,
-0.5811388, 0.9662552, -1.894165, 1, 0, 0, 1, 1,
-0.5791975, 0.4180178, -1.387736, 0, 0, 0, 1, 1,
-0.5775737, -0.1846154, -0.7547231, 0, 0, 0, 1, 1,
-0.5773766, -0.009899284, -2.992409, 0, 0, 0, 1, 1,
-0.5771354, 1.14848, 0.7345672, 0, 0, 0, 1, 1,
-0.5764375, 1.017888, 0.7766439, 0, 0, 0, 1, 1,
-0.5673347, 0.02969897, 0.4756724, 0, 0, 0, 1, 1,
-0.5672374, -0.2429204, -1.632071, 0, 0, 0, 1, 1,
-0.5672295, -0.850872, -0.2862563, 1, 1, 1, 1, 1,
-0.5670291, -1.291828, -4.294984, 1, 1, 1, 1, 1,
-0.5664237, 0.4907792, 0.3150881, 1, 1, 1, 1, 1,
-0.5526353, 0.8279783, -1.339239, 1, 1, 1, 1, 1,
-0.5514949, -0.5371011, -3.165547, 1, 1, 1, 1, 1,
-0.5471166, 0.0005764384, -1.437821, 1, 1, 1, 1, 1,
-0.5453672, -0.2723882, -1.043259, 1, 1, 1, 1, 1,
-0.5443373, 0.01886657, -0.675107, 1, 1, 1, 1, 1,
-0.5442365, -1.484464, -3.409615, 1, 1, 1, 1, 1,
-0.536698, -0.4474754, -0.4890995, 1, 1, 1, 1, 1,
-0.5366498, -0.08222163, -2.069437, 1, 1, 1, 1, 1,
-0.5358859, 0.8689352, 0.2981276, 1, 1, 1, 1, 1,
-0.5326083, -0.9500126, -3.95479, 1, 1, 1, 1, 1,
-0.5273261, 0.8832559, -0.600256, 1, 1, 1, 1, 1,
-0.5236228, -0.8859719, -3.101031, 1, 1, 1, 1, 1,
-0.5220789, -0.01868974, -0.5747083, 0, 0, 1, 1, 1,
-0.5206312, -1.003188, -1.099284, 1, 0, 0, 1, 1,
-0.5128958, 1.011188, -1.631534, 1, 0, 0, 1, 1,
-0.5074408, 0.9282792, -1.05272, 1, 0, 0, 1, 1,
-0.5056318, -0.3467512, -1.693259, 1, 0, 0, 1, 1,
-0.5051149, -0.8539856, -2.61053, 1, 0, 0, 1, 1,
-0.5043761, 0.5840666, -2.432475, 0, 0, 0, 1, 1,
-0.5041187, -0.4006607, -2.230224, 0, 0, 0, 1, 1,
-0.502335, -0.1469687, -1.801261, 0, 0, 0, 1, 1,
-0.4948622, 2.255702, -1.431968, 0, 0, 0, 1, 1,
-0.4943809, 2.027484, 0.9740292, 0, 0, 0, 1, 1,
-0.494039, -1.907824, -2.195469, 0, 0, 0, 1, 1,
-0.4853226, 2.193619, -0.00753669, 0, 0, 0, 1, 1,
-0.48267, 0.07804772, -1.405195, 1, 1, 1, 1, 1,
-0.4799421, -0.9162732, -3.169747, 1, 1, 1, 1, 1,
-0.4774831, 0.9709149, -0.3932559, 1, 1, 1, 1, 1,
-0.4730279, 0.2970361, -0.5424759, 1, 1, 1, 1, 1,
-0.4669889, 1.043038, -1.280624, 1, 1, 1, 1, 1,
-0.465765, -2.826567, -2.296355, 1, 1, 1, 1, 1,
-0.4585879, 0.7388419, -1.681713, 1, 1, 1, 1, 1,
-0.4568415, 0.04392525, -1.572035, 1, 1, 1, 1, 1,
-0.4532059, 1.591735, 1.110688, 1, 1, 1, 1, 1,
-0.4508837, 1.84049, 0.08461273, 1, 1, 1, 1, 1,
-0.4452084, 0.3577573, -1.554297, 1, 1, 1, 1, 1,
-0.4426592, 1.172619, -0.7994912, 1, 1, 1, 1, 1,
-0.4358149, 1.859036, -1.739924, 1, 1, 1, 1, 1,
-0.435727, 1.315412, -2.905585, 1, 1, 1, 1, 1,
-0.4302684, -0.2366186, -0.2923139, 1, 1, 1, 1, 1,
-0.4294368, -0.09032469, -1.863394, 0, 0, 1, 1, 1,
-0.4280365, 0.5926551, -0.7941428, 1, 0, 0, 1, 1,
-0.427601, 1.589992, -1.538058, 1, 0, 0, 1, 1,
-0.4202118, -1.883255, -2.658468, 1, 0, 0, 1, 1,
-0.4176087, 0.0511899, -1.759858, 1, 0, 0, 1, 1,
-0.4164363, -0.5837123, -2.544042, 1, 0, 0, 1, 1,
-0.4140498, 1.224712, -0.1828316, 0, 0, 0, 1, 1,
-0.4010098, -1.613729, -2.348527, 0, 0, 0, 1, 1,
-0.3992226, -0.9002737, -3.11377, 0, 0, 0, 1, 1,
-0.3975061, 1.522648, 1.165985, 0, 0, 0, 1, 1,
-0.396514, 0.1873977, -0.8105593, 0, 0, 0, 1, 1,
-0.3962255, -1.056708, -3.610242, 0, 0, 0, 1, 1,
-0.3926742, 0.383284, -0.3464568, 0, 0, 0, 1, 1,
-0.3921027, 1.124824, -2.815486, 1, 1, 1, 1, 1,
-0.3918935, -0.9724116, -2.376817, 1, 1, 1, 1, 1,
-0.3912712, -2.336598, -2.243616, 1, 1, 1, 1, 1,
-0.3901924, 1.305725, 0.8359529, 1, 1, 1, 1, 1,
-0.3878776, 0.4763953, -1.081027, 1, 1, 1, 1, 1,
-0.3868253, 1.118366, -1.472543, 1, 1, 1, 1, 1,
-0.3856824, 0.0120197, -0.8088843, 1, 1, 1, 1, 1,
-0.3820255, 0.02227601, -0.1696804, 1, 1, 1, 1, 1,
-0.3817604, 1.207745, 0.2804828, 1, 1, 1, 1, 1,
-0.3805513, 1.025604, -0.2312517, 1, 1, 1, 1, 1,
-0.3798656, 0.9214813, 0.5905666, 1, 1, 1, 1, 1,
-0.3783925, 0.8922168, -0.5175532, 1, 1, 1, 1, 1,
-0.3733208, 0.5442732, 0.5806331, 1, 1, 1, 1, 1,
-0.3731524, 0.5340354, -0.269806, 1, 1, 1, 1, 1,
-0.3702243, -1.761864, -3.486336, 1, 1, 1, 1, 1,
-0.367324, 1.189848, -0.9658923, 0, 0, 1, 1, 1,
-0.3664247, 0.006706176, -2.233142, 1, 0, 0, 1, 1,
-0.3623688, 1.453461, 0.4931187, 1, 0, 0, 1, 1,
-0.3604375, 0.7033556, 0.5431063, 1, 0, 0, 1, 1,
-0.354059, -1.583035, -3.913568, 1, 0, 0, 1, 1,
-0.3533854, -1.312184, -3.619418, 1, 0, 0, 1, 1,
-0.3511709, 1.59875, -0.4404724, 0, 0, 0, 1, 1,
-0.3449463, 0.8132915, -1.031462, 0, 0, 0, 1, 1,
-0.3440362, 0.2868434, -0.52187, 0, 0, 0, 1, 1,
-0.343947, 0.6623436, 1.033785, 0, 0, 0, 1, 1,
-0.3436398, 0.2280939, -1.089225, 0, 0, 0, 1, 1,
-0.3428697, 0.4238783, -1.748477, 0, 0, 0, 1, 1,
-0.3304684, -1.008711, -3.587437, 0, 0, 0, 1, 1,
-0.3288857, 0.05475117, 0.006942627, 1, 1, 1, 1, 1,
-0.3259932, -0.6108101, -1.682569, 1, 1, 1, 1, 1,
-0.3246487, 1.344438, 1.849036, 1, 1, 1, 1, 1,
-0.3238676, 0.1081717, -1.413339, 1, 1, 1, 1, 1,
-0.3168274, -0.7679325, -1.895809, 1, 1, 1, 1, 1,
-0.3086673, -1.444699, -1.903902, 1, 1, 1, 1, 1,
-0.3038439, 0.5407206, -1.24178, 1, 1, 1, 1, 1,
-0.3002796, -0.0644873, -3.00503, 1, 1, 1, 1, 1,
-0.2969746, 0.6845692, -1.813792, 1, 1, 1, 1, 1,
-0.296347, -0.04854944, -3.378744, 1, 1, 1, 1, 1,
-0.2948402, -0.9974768, -2.509967, 1, 1, 1, 1, 1,
-0.2914868, 0.1203005, -2.263902, 1, 1, 1, 1, 1,
-0.2873541, -0.03054213, -2.27946, 1, 1, 1, 1, 1,
-0.286301, 0.5335708, -2.373916, 1, 1, 1, 1, 1,
-0.2850363, 0.1146444, -1.826361, 1, 1, 1, 1, 1,
-0.2842217, -0.6354555, -2.865664, 0, 0, 1, 1, 1,
-0.2796623, -0.40276, -4.999105, 1, 0, 0, 1, 1,
-0.2721998, -1.080302, -2.597401, 1, 0, 0, 1, 1,
-0.2718577, 0.5756127, 0.1137705, 1, 0, 0, 1, 1,
-0.270744, 0.297229, -0.8990349, 1, 0, 0, 1, 1,
-0.2703356, 0.3437989, -1.685619, 1, 0, 0, 1, 1,
-0.2674901, 0.8077567, -1.641227, 0, 0, 0, 1, 1,
-0.2655662, 0.3245774, 0.5288532, 0, 0, 0, 1, 1,
-0.263527, -0.9378536, -1.641601, 0, 0, 0, 1, 1,
-0.261384, -0.2868001, -0.7867904, 0, 0, 0, 1, 1,
-0.2606682, 0.7275099, -0.2364129, 0, 0, 0, 1, 1,
-0.2570085, -1.18292, -2.363868, 0, 0, 0, 1, 1,
-0.2528549, -0.4912245, -3.754272, 0, 0, 0, 1, 1,
-0.2509921, 1.657349, -0.5591459, 1, 1, 1, 1, 1,
-0.2456914, 0.6666123, 0.5711642, 1, 1, 1, 1, 1,
-0.2446913, -0.04280951, -2.412523, 1, 1, 1, 1, 1,
-0.2424874, 1.72715, 1.635619, 1, 1, 1, 1, 1,
-0.2423733, -0.231969, -1.461351, 1, 1, 1, 1, 1,
-0.2325979, -1.30573, -1.793385, 1, 1, 1, 1, 1,
-0.2282915, -0.7023498, -2.180077, 1, 1, 1, 1, 1,
-0.2244177, 0.6999076, 1.931056, 1, 1, 1, 1, 1,
-0.2229005, 1.445163, 1.743208, 1, 1, 1, 1, 1,
-0.2217099, 0.6632965, 0.2209639, 1, 1, 1, 1, 1,
-0.2173771, 1.294194, -0.2806422, 1, 1, 1, 1, 1,
-0.2170761, 0.7887661, -0.7754112, 1, 1, 1, 1, 1,
-0.2132376, -0.8094647, -1.466902, 1, 1, 1, 1, 1,
-0.2118835, 0.7816924, -0.2208538, 1, 1, 1, 1, 1,
-0.2098602, 0.3386625, -0.06969611, 1, 1, 1, 1, 1,
-0.2097848, -1.6744, -3.425471, 0, 0, 1, 1, 1,
-0.2084414, 0.3141623, -1.871439, 1, 0, 0, 1, 1,
-0.2066244, -0.4277092, -3.041069, 1, 0, 0, 1, 1,
-0.2006788, -1.711849, -3.353834, 1, 0, 0, 1, 1,
-0.2001639, -0.2700169, -2.802684, 1, 0, 0, 1, 1,
-0.198207, -0.005072865, -1.793588, 1, 0, 0, 1, 1,
-0.1966389, -0.05298482, -2.089507, 0, 0, 0, 1, 1,
-0.1917168, 0.8100587, 0.6403314, 0, 0, 0, 1, 1,
-0.1914575, 0.1798929, 0.8252826, 0, 0, 0, 1, 1,
-0.186336, 0.1249205, -1.928254, 0, 0, 0, 1, 1,
-0.1863055, -1.286741, -3.989173, 0, 0, 0, 1, 1,
-0.1841879, 0.7766238, -0.4105228, 0, 0, 0, 1, 1,
-0.1828477, -0.4055107, -3.383461, 0, 0, 0, 1, 1,
-0.1809512, 0.8583335, 0.372205, 1, 1, 1, 1, 1,
-0.1789394, 0.3677433, -1.166918, 1, 1, 1, 1, 1,
-0.1779517, -1.221084, -3.589744, 1, 1, 1, 1, 1,
-0.1736913, 0.9623883, -0.4204821, 1, 1, 1, 1, 1,
-0.1694801, -0.1873349, -4.471832, 1, 1, 1, 1, 1,
-0.1693944, -1.001708, -3.690181, 1, 1, 1, 1, 1,
-0.1693727, -0.1947053, -1.232458, 1, 1, 1, 1, 1,
-0.1666059, 0.1660708, 0.8905567, 1, 1, 1, 1, 1,
-0.1606557, -1.58627, -2.443125, 1, 1, 1, 1, 1,
-0.1580645, -0.1131779, -3.087378, 1, 1, 1, 1, 1,
-0.1568697, -0.416465, -3.441519, 1, 1, 1, 1, 1,
-0.1540856, 0.6842223, -1.006404, 1, 1, 1, 1, 1,
-0.145987, -0.4077201, -5.444145, 1, 1, 1, 1, 1,
-0.1423861, -1.118709, -3.882485, 1, 1, 1, 1, 1,
-0.1416947, -1.385886, -4.207954, 1, 1, 1, 1, 1,
-0.1409297, 0.04869642, -1.305518, 0, 0, 1, 1, 1,
-0.1383515, 0.9906405, 0.2098299, 1, 0, 0, 1, 1,
-0.134662, -0.6243573, -2.423175, 1, 0, 0, 1, 1,
-0.1342971, 0.1126578, -0.711902, 1, 0, 0, 1, 1,
-0.1323638, -0.4094568, -2.353871, 1, 0, 0, 1, 1,
-0.1273542, 0.5968478, -1.510583, 1, 0, 0, 1, 1,
-0.1234002, 0.537363, 0.8323084, 0, 0, 0, 1, 1,
-0.1212124, 1.079438, 0.7090265, 0, 0, 0, 1, 1,
-0.117814, -1.246968, -4.626288, 0, 0, 0, 1, 1,
-0.1166156, 0.08507095, 0.2240055, 0, 0, 0, 1, 1,
-0.11344, 0.2736053, -0.1999541, 0, 0, 0, 1, 1,
-0.1119166, 0.6400799, -0.2149024, 0, 0, 0, 1, 1,
-0.1087186, -0.6986377, -2.506977, 0, 0, 0, 1, 1,
-0.100922, 0.7593113, -0.2869263, 1, 1, 1, 1, 1,
-0.09928997, 0.7802513, 0.2013547, 1, 1, 1, 1, 1,
-0.09873081, 0.9900494, 0.8277057, 1, 1, 1, 1, 1,
-0.09817243, 1.067678, 0.5271686, 1, 1, 1, 1, 1,
-0.09792086, 1.509179, 0.3475501, 1, 1, 1, 1, 1,
-0.09413036, -1.951706, -3.65999, 1, 1, 1, 1, 1,
-0.09315193, -1.728563, -4.395293, 1, 1, 1, 1, 1,
-0.08978239, 1.353899, 1.832832, 1, 1, 1, 1, 1,
-0.08234392, 0.683734, -0.8286062, 1, 1, 1, 1, 1,
-0.0795794, 1.229249, 0.891273, 1, 1, 1, 1, 1,
-0.07448393, -0.3455318, -2.819859, 1, 1, 1, 1, 1,
-0.07431225, 1.359894, -1.654096, 1, 1, 1, 1, 1,
-0.07298665, 2.026846, -1.139812, 1, 1, 1, 1, 1,
-0.0706247, 0.3695824, -1.096875, 1, 1, 1, 1, 1,
-0.06925587, -0.7095123, -3.272672, 1, 1, 1, 1, 1,
-0.06706021, -0.7074438, -3.282454, 0, 0, 1, 1, 1,
-0.06294312, 0.05693386, -1.040328, 1, 0, 0, 1, 1,
-0.05950415, 0.8577937, -1.76938, 1, 0, 0, 1, 1,
-0.05898894, -0.5638617, -2.262345, 1, 0, 0, 1, 1,
-0.05761698, -0.06859387, -2.062672, 1, 0, 0, 1, 1,
-0.05659278, 0.200836, 0.5897866, 1, 0, 0, 1, 1,
-0.05427751, -1.030809, -2.512132, 0, 0, 0, 1, 1,
-0.05154037, 2.689197, -0.6893691, 0, 0, 0, 1, 1,
-0.05137398, -1.996898, -4.34713, 0, 0, 0, 1, 1,
-0.05107496, 1.172249, -0.6448761, 0, 0, 0, 1, 1,
-0.04833635, 0.664272, 0.1121815, 0, 0, 0, 1, 1,
-0.04670053, 1.43306, -1.046801, 0, 0, 0, 1, 1,
-0.04189307, 1.472533, -0.8663342, 0, 0, 0, 1, 1,
-0.03679408, -0.3828418, -1.948405, 1, 1, 1, 1, 1,
-0.03550077, -0.4427192, -2.537422, 1, 1, 1, 1, 1,
-0.03514533, 0.3374887, 0.979475, 1, 1, 1, 1, 1,
-0.03274326, -0.4852428, -2.202862, 1, 1, 1, 1, 1,
-0.03153586, 0.06803868, 0.7501478, 1, 1, 1, 1, 1,
-0.02270488, 1.026716, 0.5167989, 1, 1, 1, 1, 1,
-0.02167371, 1.107559, -1.205246, 1, 1, 1, 1, 1,
-0.01797932, -0.3042963, -3.792774, 1, 1, 1, 1, 1,
-0.01466322, 0.987817, 0.2785632, 1, 1, 1, 1, 1,
-0.01149686, -1.350556, -1.613939, 1, 1, 1, 1, 1,
-0.01118918, -0.9975615, -2.284563, 1, 1, 1, 1, 1,
-0.00736018, -0.1529064, -3.396513, 1, 1, 1, 1, 1,
-0.00681894, -0.9570088, -1.643866, 1, 1, 1, 1, 1,
-0.004338876, 1.106228, -0.09529154, 1, 1, 1, 1, 1,
-0.003201696, 0.5026101, 0.6882706, 1, 1, 1, 1, 1,
-0.003031442, -1.626542, -3.119707, 0, 0, 1, 1, 1,
0.00452143, -0.4199989, 2.346258, 1, 0, 0, 1, 1,
0.005552729, 0.378637, -1.191934, 1, 0, 0, 1, 1,
0.00667507, 0.9047511, 0.4776028, 1, 0, 0, 1, 1,
0.006814388, -0.4117605, 5.181588, 1, 0, 0, 1, 1,
0.006958203, -0.2429592, 1.724894, 1, 0, 0, 1, 1,
0.008424978, -1.90897, 2.266376, 0, 0, 0, 1, 1,
0.009200205, 0.8076879, -1.183058, 0, 0, 0, 1, 1,
0.01055781, 0.7152987, -0.4523269, 0, 0, 0, 1, 1,
0.01635499, -0.4073428, 0.3638417, 0, 0, 0, 1, 1,
0.0178746, 0.7964846, -1.071174, 0, 0, 0, 1, 1,
0.01997746, -0.4727193, 1.472558, 0, 0, 0, 1, 1,
0.02466573, -0.2912687, 3.358736, 0, 0, 0, 1, 1,
0.03127185, 0.2046763, 0.1489496, 1, 1, 1, 1, 1,
0.03573646, -1.732086, 2.301934, 1, 1, 1, 1, 1,
0.04121842, 1.182824, 0.06270598, 1, 1, 1, 1, 1,
0.04460588, -0.3718221, 3.141718, 1, 1, 1, 1, 1,
0.04612214, -0.7816405, 4.901531, 1, 1, 1, 1, 1,
0.04701313, -0.8167707, 2.135735, 1, 1, 1, 1, 1,
0.04739795, -0.2906193, 3.818829, 1, 1, 1, 1, 1,
0.04939707, 0.4076413, 0.05127917, 1, 1, 1, 1, 1,
0.05268278, 1.447372, -1.63996, 1, 1, 1, 1, 1,
0.05603441, -0.2979457, 1.569125, 1, 1, 1, 1, 1,
0.0585716, -0.2319811, 2.561559, 1, 1, 1, 1, 1,
0.06740097, -0.1415578, 1.850825, 1, 1, 1, 1, 1,
0.06752189, 1.057257, -0.4103013, 1, 1, 1, 1, 1,
0.06795537, 0.204461, 1.060218, 1, 1, 1, 1, 1,
0.06863856, 0.03114324, 0.9066831, 1, 1, 1, 1, 1,
0.06879303, -0.2819368, 5.664302, 0, 0, 1, 1, 1,
0.06880258, -0.9300349, 2.843267, 1, 0, 0, 1, 1,
0.06912594, 0.6332478, -0.3376885, 1, 0, 0, 1, 1,
0.07147433, -0.9030904, 2.946581, 1, 0, 0, 1, 1,
0.07236172, -1.855813, 3.52265, 1, 0, 0, 1, 1,
0.07731251, -2.831936, 3.577793, 1, 0, 0, 1, 1,
0.07926285, 0.3349752, -0.1928912, 0, 0, 0, 1, 1,
0.08098037, 0.8821355, -0.180287, 0, 0, 0, 1, 1,
0.08696374, -1.080351, 3.147238, 0, 0, 0, 1, 1,
0.08776162, 0.8285967, 0.2648428, 0, 0, 0, 1, 1,
0.09369683, -1.72569, 3.745578, 0, 0, 0, 1, 1,
0.09856926, -1.024437, 3.576905, 0, 0, 0, 1, 1,
0.1005895, 0.3595121, -0.3431467, 0, 0, 0, 1, 1,
0.1055297, -0.5208031, 3.404246, 1, 1, 1, 1, 1,
0.1075161, -0.3502474, 1.349921, 1, 1, 1, 1, 1,
0.1136265, 0.6638591, 0.6726978, 1, 1, 1, 1, 1,
0.1168428, -0.5587621, 2.457947, 1, 1, 1, 1, 1,
0.1177724, -0.9277057, 4.55747, 1, 1, 1, 1, 1,
0.118456, 0.03402485, 3.246725, 1, 1, 1, 1, 1,
0.1222649, 0.8972622, -1.372149, 1, 1, 1, 1, 1,
0.1248379, 1.827683, 0.07342086, 1, 1, 1, 1, 1,
0.1252267, 0.9849198, 0.383843, 1, 1, 1, 1, 1,
0.1334949, -0.6406261, 3.159643, 1, 1, 1, 1, 1,
0.1353028, 1.212785, 0.2895141, 1, 1, 1, 1, 1,
0.1367057, 0.8959448, -1.056913, 1, 1, 1, 1, 1,
0.1372053, -1.517398, 4.088857, 1, 1, 1, 1, 1,
0.1461158, -1.671623, 4.3741, 1, 1, 1, 1, 1,
0.148598, -1.20812, 4.11297, 1, 1, 1, 1, 1,
0.1504598, -0.3395205, 2.989904, 0, 0, 1, 1, 1,
0.1536422, 1.610124, 0.6846294, 1, 0, 0, 1, 1,
0.1539747, -0.6185977, 2.526467, 1, 0, 0, 1, 1,
0.1542902, 0.1106241, 0.1536477, 1, 0, 0, 1, 1,
0.1561429, 0.4223636, 0.8409137, 1, 0, 0, 1, 1,
0.1593693, -0.5707287, 2.418424, 1, 0, 0, 1, 1,
0.1677672, 0.03370732, 2.172025, 0, 0, 0, 1, 1,
0.1686763, 2.242442, -0.1741077, 0, 0, 0, 1, 1,
0.170132, -2.533397, 2.422522, 0, 0, 0, 1, 1,
0.1704465, -0.2229183, 2.908978, 0, 0, 0, 1, 1,
0.1722534, -0.2846418, 0.3819515, 0, 0, 0, 1, 1,
0.173463, -0.7287558, 3.340284, 0, 0, 0, 1, 1,
0.1775904, 1.39089, -0.3444711, 0, 0, 0, 1, 1,
0.178329, -0.2179808, 2.547503, 1, 1, 1, 1, 1,
0.1808939, -0.87477, 4.856177, 1, 1, 1, 1, 1,
0.1822324, 1.413389, 1.435264, 1, 1, 1, 1, 1,
0.1846224, 1.902997, 1.806328, 1, 1, 1, 1, 1,
0.1907744, 0.4828477, -0.8400062, 1, 1, 1, 1, 1,
0.1961776, -1.440559, 1.804654, 1, 1, 1, 1, 1,
0.1972482, -0.2533303, 3.402269, 1, 1, 1, 1, 1,
0.1995488, -1.352257, 3.317147, 1, 1, 1, 1, 1,
0.1999367, -0.1470912, 1.32838, 1, 1, 1, 1, 1,
0.2023067, -0.309476, 2.913533, 1, 1, 1, 1, 1,
0.2026515, 2.283763, 0.5233294, 1, 1, 1, 1, 1,
0.2033529, 0.700997, 1.649658, 1, 1, 1, 1, 1,
0.2081842, -1.222265, 3.911457, 1, 1, 1, 1, 1,
0.2092416, -0.05888488, 0.4052903, 1, 1, 1, 1, 1,
0.2127762, -1.770489, 2.574705, 1, 1, 1, 1, 1,
0.2159528, -0.1998404, 3.072664, 0, 0, 1, 1, 1,
0.2266622, -0.5777275, 2.925709, 1, 0, 0, 1, 1,
0.2319812, -1.26369, 2.632276, 1, 0, 0, 1, 1,
0.2338075, 0.8024357, -1.28281, 1, 0, 0, 1, 1,
0.2346349, -0.7332705, 3.769953, 1, 0, 0, 1, 1,
0.2362359, -1.115762, 4.055326, 1, 0, 0, 1, 1,
0.2364933, 0.07834233, 0.8186978, 0, 0, 0, 1, 1,
0.2387664, -0.3777608, 2.611316, 0, 0, 0, 1, 1,
0.2454427, 0.2871284, -0.03686126, 0, 0, 0, 1, 1,
0.2491032, 0.7533849, -1.128471, 0, 0, 0, 1, 1,
0.2540307, -0.4113113, 3.632423, 0, 0, 0, 1, 1,
0.254061, 0.2144494, 1.760223, 0, 0, 0, 1, 1,
0.2579046, 0.02952972, 0.3740945, 0, 0, 0, 1, 1,
0.2606878, 0.3100244, 0.779062, 1, 1, 1, 1, 1,
0.2609603, -0.6589, 5.070704, 1, 1, 1, 1, 1,
0.2617235, 0.8702453, 1.87234, 1, 1, 1, 1, 1,
0.2667081, -0.5984445, 1.029454, 1, 1, 1, 1, 1,
0.2668413, 0.2086189, 0.7417727, 1, 1, 1, 1, 1,
0.2669121, 0.2793234, 1.502594, 1, 1, 1, 1, 1,
0.2684246, 1.021729, 1.520331, 1, 1, 1, 1, 1,
0.2704477, -0.4578245, 3.040572, 1, 1, 1, 1, 1,
0.2709098, -0.7312001, 4.382701, 1, 1, 1, 1, 1,
0.2709698, -0.8990188, 3.096179, 1, 1, 1, 1, 1,
0.2716109, -2.468637, 2.824345, 1, 1, 1, 1, 1,
0.2734138, -0.09296384, 3.866183, 1, 1, 1, 1, 1,
0.274191, 0.06311627, 0.2400904, 1, 1, 1, 1, 1,
0.2742461, 0.3469785, 1.693755, 1, 1, 1, 1, 1,
0.2767801, 0.839537, 0.2749596, 1, 1, 1, 1, 1,
0.2783412, 1.640224, 0.6111329, 0, 0, 1, 1, 1,
0.2793029, -1.35693, 2.154114, 1, 0, 0, 1, 1,
0.2793419, -0.596337, 3.255936, 1, 0, 0, 1, 1,
0.2815122, -1.812753, 3.350089, 1, 0, 0, 1, 1,
0.2891419, 0.02152985, 2.118082, 1, 0, 0, 1, 1,
0.2892106, 0.109347, 0.09423482, 1, 0, 0, 1, 1,
0.2892928, -0.05711828, 2.171098, 0, 0, 0, 1, 1,
0.2918654, 0.2392479, -0.05820394, 0, 0, 0, 1, 1,
0.2942831, 1.035634, -0.7250632, 0, 0, 0, 1, 1,
0.2950057, -0.2938893, 2.681572, 0, 0, 0, 1, 1,
0.2972771, 1.942904, 0.3428233, 0, 0, 0, 1, 1,
0.2987278, -0.760478, 1.048369, 0, 0, 0, 1, 1,
0.2998578, 0.5618961, -0.4841413, 0, 0, 0, 1, 1,
0.3002767, -1.099027, 3.327811, 1, 1, 1, 1, 1,
0.300319, -0.214947, 2.725785, 1, 1, 1, 1, 1,
0.302045, -2.160528, 1.306267, 1, 1, 1, 1, 1,
0.3034202, -0.7062885, 4.100058, 1, 1, 1, 1, 1,
0.3035336, -0.7617193, 3.209981, 1, 1, 1, 1, 1,
0.304027, -0.4126673, 2.331151, 1, 1, 1, 1, 1,
0.3049795, -0.5339294, 1.827437, 1, 1, 1, 1, 1,
0.3100868, -2.936148, 2.726184, 1, 1, 1, 1, 1,
0.3187432, 0.3140407, 2.699995, 1, 1, 1, 1, 1,
0.3190302, -1.364751, 3.2785, 1, 1, 1, 1, 1,
0.3217485, 0.398511, -0.5177361, 1, 1, 1, 1, 1,
0.3222069, 1.334879, -0.492824, 1, 1, 1, 1, 1,
0.332452, 0.1019036, 1.169518, 1, 1, 1, 1, 1,
0.3356078, 0.7876193, -0.6359078, 1, 1, 1, 1, 1,
0.3376018, -0.6061794, 3.333228, 1, 1, 1, 1, 1,
0.3399648, -2.085615, 4.867115, 0, 0, 1, 1, 1,
0.3474967, -0.4201782, 1.791561, 1, 0, 0, 1, 1,
0.3491994, 0.3749104, 0.6690986, 1, 0, 0, 1, 1,
0.3535001, -0.990171, 3.524782, 1, 0, 0, 1, 1,
0.3545986, 0.163266, 1.218246, 1, 0, 0, 1, 1,
0.3584951, -0.4630138, 2.73034, 1, 0, 0, 1, 1,
0.3585433, -0.6741108, 2.777492, 0, 0, 0, 1, 1,
0.3599418, -0.770631, 4.110938, 0, 0, 0, 1, 1,
0.3603705, -0.09304141, 3.012018, 0, 0, 0, 1, 1,
0.3634745, -0.7179018, 1.688319, 0, 0, 0, 1, 1,
0.3689283, -0.4078841, 2.139364, 0, 0, 0, 1, 1,
0.3695083, -1.299754, 3.38838, 0, 0, 0, 1, 1,
0.3700052, -1.818836, 1.595172, 0, 0, 0, 1, 1,
0.3804373, -0.5174599, 2.626912, 1, 1, 1, 1, 1,
0.3825146, -0.280924, 2.206083, 1, 1, 1, 1, 1,
0.3868323, 0.2703998, 1.377028, 1, 1, 1, 1, 1,
0.3874148, -1.105428, 2.009668, 1, 1, 1, 1, 1,
0.390756, -1.963263, 2.44652, 1, 1, 1, 1, 1,
0.3938204, -0.6481374, 1.142748, 1, 1, 1, 1, 1,
0.3960945, -0.8547556, 3.182666, 1, 1, 1, 1, 1,
0.397498, 0.1389968, -0.004393444, 1, 1, 1, 1, 1,
0.3976878, 0.4431291, -0.0221258, 1, 1, 1, 1, 1,
0.3987914, -0.3871904, 1.060641, 1, 1, 1, 1, 1,
0.4038078, -0.1044513, 0.5944794, 1, 1, 1, 1, 1,
0.4047342, -0.2370379, 2.552499, 1, 1, 1, 1, 1,
0.4050234, 0.6975738, 1.738436, 1, 1, 1, 1, 1,
0.4052408, 0.2436068, 1.199457, 1, 1, 1, 1, 1,
0.4082383, 0.3346359, 1.431384, 1, 1, 1, 1, 1,
0.4102229, 0.1928366, 2.064401, 0, 0, 1, 1, 1,
0.4105044, -0.9328675, 4.691726, 1, 0, 0, 1, 1,
0.4123542, -1.153784, 2.733651, 1, 0, 0, 1, 1,
0.4124125, -2.054433, 1.659445, 1, 0, 0, 1, 1,
0.4171065, -0.9536256, 3.055281, 1, 0, 0, 1, 1,
0.4172929, -0.7576125, 2.487232, 1, 0, 0, 1, 1,
0.4206519, -1.121372, 2.425208, 0, 0, 0, 1, 1,
0.4220752, 0.5972388, 0.1622485, 0, 0, 0, 1, 1,
0.4223916, 0.4378281, -0.1923369, 0, 0, 0, 1, 1,
0.422703, 0.7584665, -0.01721977, 0, 0, 0, 1, 1,
0.4256188, -0.228152, 0.6472318, 0, 0, 0, 1, 1,
0.4265548, 0.5354354, 0.5963975, 0, 0, 0, 1, 1,
0.4287052, 1.694968, 0.5133222, 0, 0, 0, 1, 1,
0.4355883, 0.9546136, 3.097649, 1, 1, 1, 1, 1,
0.4380347, -1.514294, 3.01503, 1, 1, 1, 1, 1,
0.4421944, 0.6007363, 0.141609, 1, 1, 1, 1, 1,
0.4497955, 0.8903317, 2.195011, 1, 1, 1, 1, 1,
0.4523216, 0.400812, -0.3291171, 1, 1, 1, 1, 1,
0.4524047, -0.213272, 3.957343, 1, 1, 1, 1, 1,
0.4527692, 1.534844, -0.4088899, 1, 1, 1, 1, 1,
0.4547521, 0.05888148, 2.510985, 1, 1, 1, 1, 1,
0.4629539, 0.9545756, 0.6065458, 1, 1, 1, 1, 1,
0.464192, -0.308117, 2.651793, 1, 1, 1, 1, 1,
0.4646889, -0.2682979, 1.243296, 1, 1, 1, 1, 1,
0.4764819, -1.98816, 3.503386, 1, 1, 1, 1, 1,
0.4766426, -0.8315237, 0.8744338, 1, 1, 1, 1, 1,
0.4777974, -2.22486, 2.907844, 1, 1, 1, 1, 1,
0.4803392, 0.1473709, 1.971352, 1, 1, 1, 1, 1,
0.4857824, -0.2473662, 0.8967474, 0, 0, 1, 1, 1,
0.4862811, -0.806128, 3.926626, 1, 0, 0, 1, 1,
0.4877998, -0.235645, 2.524639, 1, 0, 0, 1, 1,
0.4902858, 0.1255516, 1.501098, 1, 0, 0, 1, 1,
0.4911732, -0.241126, 1.346644, 1, 0, 0, 1, 1,
0.491344, 0.1381016, 2.417509, 1, 0, 0, 1, 1,
0.5011926, 0.8189203, 1.165187, 0, 0, 0, 1, 1,
0.5035737, 0.8269635, -0.05710825, 0, 0, 0, 1, 1,
0.5065842, 2.05124, 1.29113, 0, 0, 0, 1, 1,
0.5069066, -1.882398, 4.792577, 0, 0, 0, 1, 1,
0.5089349, -1.450436, 2.973269, 0, 0, 0, 1, 1,
0.5094591, -0.1343737, 1.387398, 0, 0, 0, 1, 1,
0.5096587, -2.582881, 1.942917, 0, 0, 0, 1, 1,
0.5108406, -1.053821, 2.054624, 1, 1, 1, 1, 1,
0.5127919, -0.301102, 1.917918, 1, 1, 1, 1, 1,
0.5149505, -0.6102345, 1.328028, 1, 1, 1, 1, 1,
0.5163191, -1.695146, 2.675009, 1, 1, 1, 1, 1,
0.5241058, 0.01048515, -0.009744456, 1, 1, 1, 1, 1,
0.5259023, 0.4549909, -0.2211309, 1, 1, 1, 1, 1,
0.5286388, -0.02720466, 1.255611, 1, 1, 1, 1, 1,
0.5304909, 1.388507, 0.6996175, 1, 1, 1, 1, 1,
0.5354544, 0.7515588, -0.6522256, 1, 1, 1, 1, 1,
0.5383654, -1.159464, 4.237662, 1, 1, 1, 1, 1,
0.5460436, -0.4417204, 2.650679, 1, 1, 1, 1, 1,
0.5470719, -1.504125, 2.611801, 1, 1, 1, 1, 1,
0.5489663, 0.7646546, 1.494724, 1, 1, 1, 1, 1,
0.5496086, -0.3528219, 2.953618, 1, 1, 1, 1, 1,
0.5509196, 1.948992, 0.8796378, 1, 1, 1, 1, 1,
0.5510684, 0.2927269, 0.4457809, 0, 0, 1, 1, 1,
0.552886, -0.3407045, 4.36578, 1, 0, 0, 1, 1,
0.5578821, 0.5848107, 0.683649, 1, 0, 0, 1, 1,
0.5630296, 0.8896883, 1.649172, 1, 0, 0, 1, 1,
0.5701428, -0.6949922, 1.384959, 1, 0, 0, 1, 1,
0.5713527, 0.8557196, 1.301433, 1, 0, 0, 1, 1,
0.5746687, -0.209573, 0.2835437, 0, 0, 0, 1, 1,
0.576001, -0.7956598, 2.347888, 0, 0, 0, 1, 1,
0.5764059, 0.9568849, -0.7101909, 0, 0, 0, 1, 1,
0.5814118, 1.83206, -0.03663152, 0, 0, 0, 1, 1,
0.5817735, 0.7681465, 1.670299, 0, 0, 0, 1, 1,
0.584179, -0.775984, 1.219468, 0, 0, 0, 1, 1,
0.5857499, -0.3949302, 1.738879, 0, 0, 0, 1, 1,
0.5911285, -0.009504312, 2.434155, 1, 1, 1, 1, 1,
0.5947453, 0.612645, 2.505387, 1, 1, 1, 1, 1,
0.5957521, 0.5695735, -0.6976457, 1, 1, 1, 1, 1,
0.5961885, 0.4420923, 1.92843, 1, 1, 1, 1, 1,
0.5991166, -2.190019, 3.181236, 1, 1, 1, 1, 1,
0.6007347, 0.3376328, 1.47061, 1, 1, 1, 1, 1,
0.6132728, -0.2611083, 1.62048, 1, 1, 1, 1, 1,
0.6166848, -0.3834997, 0.487997, 1, 1, 1, 1, 1,
0.6292809, -0.597555, 0.5811343, 1, 1, 1, 1, 1,
0.6388814, -0.3078559, -0.1134754, 1, 1, 1, 1, 1,
0.641876, 1.01252, -0.2443183, 1, 1, 1, 1, 1,
0.644989, 0.3702717, 0.6032845, 1, 1, 1, 1, 1,
0.6472611, 1.442616, -1.16538, 1, 1, 1, 1, 1,
0.6507508, -0.1873026, 2.897786, 1, 1, 1, 1, 1,
0.6545778, -0.9108672, 2.155381, 1, 1, 1, 1, 1,
0.6561722, -0.5097335, 2.083294, 0, 0, 1, 1, 1,
0.6585943, -1.125674, 2.164734, 1, 0, 0, 1, 1,
0.660394, -0.8423825, 2.636245, 1, 0, 0, 1, 1,
0.6609619, -0.1791603, -0.9908168, 1, 0, 0, 1, 1,
0.6626893, 0.2489358, 0.6541557, 1, 0, 0, 1, 1,
0.669719, -0.1034526, 1.579962, 1, 0, 0, 1, 1,
0.6712515, 1.717767, 1.114849, 0, 0, 0, 1, 1,
0.6723256, 0.591091, 2.577649, 0, 0, 0, 1, 1,
0.6731912, -1.318215, 3.883033, 0, 0, 0, 1, 1,
0.6798219, 0.8849106, 1.252678, 0, 0, 0, 1, 1,
0.6803594, -0.01890627, 0.9308882, 0, 0, 0, 1, 1,
0.6808646, 0.2784975, -0.1433154, 0, 0, 0, 1, 1,
0.6809132, 1.333095, -0.7573511, 0, 0, 0, 1, 1,
0.6809738, -0.2528361, 2.095799, 1, 1, 1, 1, 1,
0.6842606, -0.3639106, 1.894726, 1, 1, 1, 1, 1,
0.6843082, -0.6643266, 3.178431, 1, 1, 1, 1, 1,
0.6882287, -0.6495621, 3.162485, 1, 1, 1, 1, 1,
0.6889054, -1.129779, 3.429638, 1, 1, 1, 1, 1,
0.6932135, -0.01226925, 3.428635, 1, 1, 1, 1, 1,
0.699077, -0.4180458, 4.659673, 1, 1, 1, 1, 1,
0.7016351, -0.2871768, -0.1166188, 1, 1, 1, 1, 1,
0.7092181, 2.285476, 0.6914873, 1, 1, 1, 1, 1,
0.7113523, -0.02721327, 1.869223, 1, 1, 1, 1, 1,
0.7152393, 0.117278, 2.084676, 1, 1, 1, 1, 1,
0.7165843, 0.4608414, 0.1198901, 1, 1, 1, 1, 1,
0.7183455, -0.06075903, 3.23311, 1, 1, 1, 1, 1,
0.7190678, -0.5090719, 0.8477032, 1, 1, 1, 1, 1,
0.7244251, -1.917546, 2.802217, 1, 1, 1, 1, 1,
0.726539, -1.611399, 3.436197, 0, 0, 1, 1, 1,
0.7334743, 0.2815939, 2.968806, 1, 0, 0, 1, 1,
0.7338356, -0.6037785, 4.455758, 1, 0, 0, 1, 1,
0.7355106, -0.3343334, 1.083853, 1, 0, 0, 1, 1,
0.7437378, -0.01662485, 1.771365, 1, 0, 0, 1, 1,
0.7438114, -1.8115, 3.146324, 1, 0, 0, 1, 1,
0.744898, 0.6053349, 1.366024, 0, 0, 0, 1, 1,
0.752017, -0.6751689, 2.913956, 0, 0, 0, 1, 1,
0.7566564, 1.919994, 0.9538107, 0, 0, 0, 1, 1,
0.7622225, 0.9772639, 0.4578593, 0, 0, 0, 1, 1,
0.7639798, 0.3784673, 0.5474027, 0, 0, 0, 1, 1,
0.7651173, -0.2180873, 1.353833, 0, 0, 0, 1, 1,
0.7677457, -1.411163, 2.550853, 0, 0, 0, 1, 1,
0.7683001, 0.9506299, 1.732622, 1, 1, 1, 1, 1,
0.776891, -0.7095307, 1.792065, 1, 1, 1, 1, 1,
0.7773249, 0.899608, 0.2398445, 1, 1, 1, 1, 1,
0.7797068, -0.6704083, 3.127655, 1, 1, 1, 1, 1,
0.782483, -0.4595622, 3.485097, 1, 1, 1, 1, 1,
0.7827284, -0.4511023, 1.595893, 1, 1, 1, 1, 1,
0.7837228, 1.576468, 0.5420954, 1, 1, 1, 1, 1,
0.7878374, -0.04505185, 1.585717, 1, 1, 1, 1, 1,
0.7899448, 1.721892, 1.658018, 1, 1, 1, 1, 1,
0.7923195, 0.9981776, 1.268428, 1, 1, 1, 1, 1,
0.7925021, -0.5973766, 2.999543, 1, 1, 1, 1, 1,
0.7946671, 0.5097017, 0.739035, 1, 1, 1, 1, 1,
0.8054436, -0.1316811, 2.136142, 1, 1, 1, 1, 1,
0.8070338, 0.06014451, 2.510575, 1, 1, 1, 1, 1,
0.8082907, 0.2171573, 2.797799, 1, 1, 1, 1, 1,
0.8098096, -0.6850324, 0.8883411, 0, 0, 1, 1, 1,
0.8143838, -1.43539, 3.128075, 1, 0, 0, 1, 1,
0.8150178, 0.6306217, 0.02443522, 1, 0, 0, 1, 1,
0.8193411, -0.6539429, 2.332253, 1, 0, 0, 1, 1,
0.8197472, 0.02780893, 2.970196, 1, 0, 0, 1, 1,
0.8222272, -0.9598075, 2.972151, 1, 0, 0, 1, 1,
0.833214, 0.2858852, -0.418347, 0, 0, 0, 1, 1,
0.8374628, 0.8639874, 1.735677, 0, 0, 0, 1, 1,
0.8387402, -0.6137615, 3.108153, 0, 0, 0, 1, 1,
0.8439313, 0.7143583, 2.229243, 0, 0, 0, 1, 1,
0.844696, -1.149132, 3.209798, 0, 0, 0, 1, 1,
0.8448734, 0.3528176, 0.03270903, 0, 0, 0, 1, 1,
0.8467683, 0.5824957, 0.9973711, 0, 0, 0, 1, 1,
0.8485582, 0.7245025, 1.728385, 1, 1, 1, 1, 1,
0.8546638, -1.02693, 1.639428, 1, 1, 1, 1, 1,
0.8563696, 0.7362255, 0.3204336, 1, 1, 1, 1, 1,
0.8579662, -1.197433, 1.819971, 1, 1, 1, 1, 1,
0.8612961, 0.4083474, 1.32614, 1, 1, 1, 1, 1,
0.8621355, -0.6302041, 0.9738286, 1, 1, 1, 1, 1,
0.8646508, -0.2810109, 2.158578, 1, 1, 1, 1, 1,
0.8729885, 0.3700175, 2.235779, 1, 1, 1, 1, 1,
0.8736642, -1.222085, 1.152867, 1, 1, 1, 1, 1,
0.8762286, 0.1638007, 1.7983, 1, 1, 1, 1, 1,
0.8852336, -0.7596327, 1.217549, 1, 1, 1, 1, 1,
0.8893026, 1.3317, 0.4627011, 1, 1, 1, 1, 1,
0.8910016, 0.7564438, 0.5252417, 1, 1, 1, 1, 1,
0.8927474, 0.6055441, 1.482729, 1, 1, 1, 1, 1,
0.8950164, -1.946554, 2.374267, 1, 1, 1, 1, 1,
0.8975571, -0.0972339, 3.273196, 0, 0, 1, 1, 1,
0.9011835, 0.351978, 1.78354, 1, 0, 0, 1, 1,
0.9038219, 1.114792, -0.2311316, 1, 0, 0, 1, 1,
0.9043479, -1.12498, 1.765917, 1, 0, 0, 1, 1,
0.9052271, 0.4784038, 1.791896, 1, 0, 0, 1, 1,
0.9101623, 1.348097, 1.473175, 1, 0, 0, 1, 1,
0.9102141, 0.5711754, 1.953689, 0, 0, 0, 1, 1,
0.9147778, 0.5757555, 2.020526, 0, 0, 0, 1, 1,
0.9237226, -0.6065271, 3.093613, 0, 0, 0, 1, 1,
0.9277354, -0.7577578, 2.632345, 0, 0, 0, 1, 1,
0.9280999, -0.4371382, 4.436902, 0, 0, 0, 1, 1,
0.9285166, -1.465477, 3.172531, 0, 0, 0, 1, 1,
0.9301205, -0.8298804, 1.970856, 0, 0, 0, 1, 1,
0.9353348, -1.221605, 1.157756, 1, 1, 1, 1, 1,
0.9387547, 0.5862471, 1.567777, 1, 1, 1, 1, 1,
0.9391232, -0.8712967, 2.320513, 1, 1, 1, 1, 1,
0.9430622, 0.2790602, 2.615197, 1, 1, 1, 1, 1,
0.9438139, -0.3745751, 3.781873, 1, 1, 1, 1, 1,
0.9497864, -0.614782, 2.47053, 1, 1, 1, 1, 1,
0.9525064, 0.1113769, 0.9318755, 1, 1, 1, 1, 1,
0.9528922, 0.0419603, 0.8154235, 1, 1, 1, 1, 1,
0.9548113, 0.1493637, 1.389826, 1, 1, 1, 1, 1,
0.9559307, 0.3501305, 0.5070723, 1, 1, 1, 1, 1,
0.9562899, 0.154293, -0.2784183, 1, 1, 1, 1, 1,
0.9563521, -0.2706627, 4.106002, 1, 1, 1, 1, 1,
0.9568461, -1.548877, 2.440915, 1, 1, 1, 1, 1,
0.9575848, 0.414141, -0.6926191, 1, 1, 1, 1, 1,
0.9594346, -0.8615326, 3.176003, 1, 1, 1, 1, 1,
0.9694654, 1.856493, 0.09407441, 0, 0, 1, 1, 1,
0.9698794, -0.6022293, 2.230535, 1, 0, 0, 1, 1,
0.9743803, -0.6315563, 0.5536488, 1, 0, 0, 1, 1,
0.9764713, 1.358923, 1.369882, 1, 0, 0, 1, 1,
0.9771239, -0.4634804, 2.858317, 1, 0, 0, 1, 1,
0.9777266, -0.0108062, 2.408998, 1, 0, 0, 1, 1,
0.9851037, 0.4711219, 2.111858, 0, 0, 0, 1, 1,
0.985786, -0.6154932, 2.113953, 0, 0, 0, 1, 1,
0.9877178, -1.105372, 2.412681, 0, 0, 0, 1, 1,
1.002864, 1.834418, 0.6297059, 0, 0, 0, 1, 1,
1.003606, 0.7219075, 2.222714, 0, 0, 0, 1, 1,
1.005858, 0.6265488, 1.024822, 0, 0, 0, 1, 1,
1.006578, 1.992261, -0.2111962, 0, 0, 0, 1, 1,
1.00693, 0.8883814, -0.2881563, 1, 1, 1, 1, 1,
1.007285, 1.251046, -0.01231491, 1, 1, 1, 1, 1,
1.013455, -1.639381, 2.481818, 1, 1, 1, 1, 1,
1.028587, 0.06650059, 1.607944, 1, 1, 1, 1, 1,
1.031045, 0.01981699, 0.2471966, 1, 1, 1, 1, 1,
1.033781, 0.7761974, 2.436442, 1, 1, 1, 1, 1,
1.039858, -0.2276836, 1.47182, 1, 1, 1, 1, 1,
1.040884, -0.8905371, 2.63486, 1, 1, 1, 1, 1,
1.041526, 0.453828, 1.090793, 1, 1, 1, 1, 1,
1.046416, 1.034024, 0.9573714, 1, 1, 1, 1, 1,
1.04869, -0.4641423, 2.714667, 1, 1, 1, 1, 1,
1.051862, 0.4993495, 1.390646, 1, 1, 1, 1, 1,
1.052221, 0.1501081, 1.557064, 1, 1, 1, 1, 1,
1.054613, -0.180489, 3.202199, 1, 1, 1, 1, 1,
1.066116, -0.995797, 2.07185, 1, 1, 1, 1, 1,
1.068031, -0.2351725, 1.059698, 0, 0, 1, 1, 1,
1.068037, -1.254487, 1.627031, 1, 0, 0, 1, 1,
1.069176, -1.409697, 2.5357, 1, 0, 0, 1, 1,
1.071844, -1.308846, 3.115156, 1, 0, 0, 1, 1,
1.075035, -0.3337927, 3.448682, 1, 0, 0, 1, 1,
1.075741, 1.040431, 0.8986806, 1, 0, 0, 1, 1,
1.090607, 0.6244636, -0.7293331, 0, 0, 0, 1, 1,
1.095357, 0.3471985, 0.6321946, 0, 0, 0, 1, 1,
1.101817, 1.101052, 1.583851, 0, 0, 0, 1, 1,
1.103024, -0.8491354, 2.453316, 0, 0, 0, 1, 1,
1.106046, -0.4852335, 2.985126, 0, 0, 0, 1, 1,
1.13787, -0.6968185, 2.59682, 0, 0, 0, 1, 1,
1.138715, -1.606865, 4.089021, 0, 0, 0, 1, 1,
1.143831, -2.178474, 3.248041, 1, 1, 1, 1, 1,
1.144349, 0.09569577, 0.1492524, 1, 1, 1, 1, 1,
1.150712, 0.1713596, 2.946946, 1, 1, 1, 1, 1,
1.152506, 0.8352717, 1.231431, 1, 1, 1, 1, 1,
1.154045, -0.157644, 0.1964102, 1, 1, 1, 1, 1,
1.167483, -0.1038611, 2.232583, 1, 1, 1, 1, 1,
1.169267, -0.9210142, 2.470216, 1, 1, 1, 1, 1,
1.171322, -0.1432055, 2.810884, 1, 1, 1, 1, 1,
1.177356, 0.2332018, 0.908364, 1, 1, 1, 1, 1,
1.181052, 0.005537623, 1.814628, 1, 1, 1, 1, 1,
1.184214, -0.5054402, 1.600363, 1, 1, 1, 1, 1,
1.187772, -1.167486, 2.091909, 1, 1, 1, 1, 1,
1.19269, 0.6982719, 0.3558801, 1, 1, 1, 1, 1,
1.192961, -0.2341807, 1.841053, 1, 1, 1, 1, 1,
1.199713, -0.1781174, 2.273703, 1, 1, 1, 1, 1,
1.210582, 0.2497812, 1.641115, 0, 0, 1, 1, 1,
1.227485, -1.870348, 0.752668, 1, 0, 0, 1, 1,
1.232338, -0.7885341, 1.440026, 1, 0, 0, 1, 1,
1.235274, -0.1363004, 1.266792, 1, 0, 0, 1, 1,
1.236595, -0.8698314, 1.512154, 1, 0, 0, 1, 1,
1.236738, -1.300364, 2.87837, 1, 0, 0, 1, 1,
1.240752, -0.7748732, 3.248353, 0, 0, 0, 1, 1,
1.241812, 1.040619, 1.387806, 0, 0, 0, 1, 1,
1.245679, -0.3830589, 1.140978, 0, 0, 0, 1, 1,
1.247434, 1.317159, 0.4674537, 0, 0, 0, 1, 1,
1.248148, -0.6107579, 1.699634, 0, 0, 0, 1, 1,
1.255907, 0.8596854, 0.7950641, 0, 0, 0, 1, 1,
1.256723, 0.9559767, -0.3723196, 0, 0, 0, 1, 1,
1.259092, 0.635225, 1.576233, 1, 1, 1, 1, 1,
1.265964, 0.2616144, 2.560461, 1, 1, 1, 1, 1,
1.272309, -0.6090288, 2.597908, 1, 1, 1, 1, 1,
1.281592, 0.5391977, 0.5939105, 1, 1, 1, 1, 1,
1.287931, -0.5963878, 3.163864, 1, 1, 1, 1, 1,
1.300402, -1.899225, 1.515527, 1, 1, 1, 1, 1,
1.310726, 0.284056, 1.870722, 1, 1, 1, 1, 1,
1.318399, 0.4334034, 0.4613484, 1, 1, 1, 1, 1,
1.321795, 1.20434, 0.7006667, 1, 1, 1, 1, 1,
1.328273, 0.4886682, 0.8244693, 1, 1, 1, 1, 1,
1.334346, 1.111227, 0.4063133, 1, 1, 1, 1, 1,
1.336921, 0.189265, 0.3689954, 1, 1, 1, 1, 1,
1.339733, -0.5687511, 2.470673, 1, 1, 1, 1, 1,
1.344668, -1.847308, 3.10058, 1, 1, 1, 1, 1,
1.359654, 0.6158372, -0.3950774, 1, 1, 1, 1, 1,
1.364242, 1.97607, -0.1714322, 0, 0, 1, 1, 1,
1.380946, -0.7954566, 2.27308, 1, 0, 0, 1, 1,
1.385036, -0.7607952, 1.710369, 1, 0, 0, 1, 1,
1.38891, -1.625891, 1.504981, 1, 0, 0, 1, 1,
1.410878, -0.3250138, 2.510267, 1, 0, 0, 1, 1,
1.42182, -0.3835374, 1.607754, 1, 0, 0, 1, 1,
1.427435, 0.8694415, 2.055415, 0, 0, 0, 1, 1,
1.44194, 0.2425431, 1.623777, 0, 0, 0, 1, 1,
1.472205, -1.380451, 2.654471, 0, 0, 0, 1, 1,
1.477809, -0.3498415, 2.92148, 0, 0, 0, 1, 1,
1.481618, -1.593042, 2.495762, 0, 0, 0, 1, 1,
1.49013, -1.533507, 2.303947, 0, 0, 0, 1, 1,
1.496514, 1.126357, 0.8628633, 0, 0, 0, 1, 1,
1.499733, 1.115406, 1.063707, 1, 1, 1, 1, 1,
1.502338, 0.735179, 0.9925545, 1, 1, 1, 1, 1,
1.503601, -1.305782, 2.903534, 1, 1, 1, 1, 1,
1.524838, 1.172499, 0.6158341, 1, 1, 1, 1, 1,
1.532788, 1.792408, 0.7632447, 1, 1, 1, 1, 1,
1.537199, -0.904887, 4.284123, 1, 1, 1, 1, 1,
1.556167, -1.640682, 3.718305, 1, 1, 1, 1, 1,
1.558291, -1.358583, 1.940485, 1, 1, 1, 1, 1,
1.564417, -0.5510678, 1.503611, 1, 1, 1, 1, 1,
1.568764, -0.04288059, 0.5844817, 1, 1, 1, 1, 1,
1.574203, -0.1923899, 1.011199, 1, 1, 1, 1, 1,
1.583849, 0.4505398, 0.09045728, 1, 1, 1, 1, 1,
1.585179, -0.07281891, -0.07128158, 1, 1, 1, 1, 1,
1.59731, -2.238195, 0.747398, 1, 1, 1, 1, 1,
1.600087, -0.7468255, 2.615868, 1, 1, 1, 1, 1,
1.612836, -0.316797, 3.943127, 0, 0, 1, 1, 1,
1.618996, -1.094244, 2.750871, 1, 0, 0, 1, 1,
1.633352, -0.08495894, 1.204777, 1, 0, 0, 1, 1,
1.647449, -0.4759268, 1.755521, 1, 0, 0, 1, 1,
1.656986, -0.7062706, 2.401884, 1, 0, 0, 1, 1,
1.667146, 0.8103894, 1.644961, 1, 0, 0, 1, 1,
1.67308, 0.1059472, 1.616954, 0, 0, 0, 1, 1,
1.677708, 2.071441, -0.750628, 0, 0, 0, 1, 1,
1.699785, 0.8661498, 0.005454646, 0, 0, 0, 1, 1,
1.710573, 0.8857347, 1.089197, 0, 0, 0, 1, 1,
1.722379, -1.766926, 2.514512, 0, 0, 0, 1, 1,
1.732048, -1.181589, 0.3653459, 0, 0, 0, 1, 1,
1.736203, 0.9978423, 2.142852, 0, 0, 0, 1, 1,
1.753126, 0.9032302, 0.5718064, 1, 1, 1, 1, 1,
1.762775, -0.3542179, 0.7243757, 1, 1, 1, 1, 1,
1.817747, -0.5530328, 2.90473, 1, 1, 1, 1, 1,
1.821211, 0.5610094, 0.4856823, 1, 1, 1, 1, 1,
1.833228, -2.287715, 3.695211, 1, 1, 1, 1, 1,
1.84053, -0.2271966, 2.124063, 1, 1, 1, 1, 1,
1.858386, 0.4723029, 2.154795, 1, 1, 1, 1, 1,
1.864343, -0.1281464, 0.6819607, 1, 1, 1, 1, 1,
1.868505, 0.1469905, 0.5745976, 1, 1, 1, 1, 1,
1.893041, -0.6237555, 2.307868, 1, 1, 1, 1, 1,
1.928533, -0.4385175, 1.393455, 1, 1, 1, 1, 1,
1.950236, -0.9192648, 1.077658, 1, 1, 1, 1, 1,
1.991181, 0.2773887, 0.05038991, 1, 1, 1, 1, 1,
2.009343, 0.7885084, 2.094697, 1, 1, 1, 1, 1,
2.025348, 1.128034, 1.90827, 1, 1, 1, 1, 1,
2.070535, 0.09454124, 1.25505, 0, 0, 1, 1, 1,
2.144142, 0.4056566, 0.3059175, 1, 0, 0, 1, 1,
2.150412, 0.7176596, 0.7135961, 1, 0, 0, 1, 1,
2.151945, 0.7061977, 0.1234771, 1, 0, 0, 1, 1,
2.16655, -0.1835093, 0.501141, 1, 0, 0, 1, 1,
2.214289, -0.606904, 1.178705, 1, 0, 0, 1, 1,
2.218287, 1.053323, 0.1256011, 0, 0, 0, 1, 1,
2.223235, 0.04376484, 1.045164, 0, 0, 0, 1, 1,
2.280988, -0.2408727, 0.6625442, 0, 0, 0, 1, 1,
2.306777, 0.8410074, -0.1887798, 0, 0, 0, 1, 1,
2.397373, 1.020406, 1.121517, 0, 0, 0, 1, 1,
2.423505, 1.2953, 0.7945806, 0, 0, 0, 1, 1,
2.440737, -1.363002, 1.652739, 0, 0, 0, 1, 1,
2.55117, -0.04727972, 1.975705, 1, 1, 1, 1, 1,
2.630553, 0.5862377, -0.5968599, 1, 1, 1, 1, 1,
2.652241, 1.214569, 0.7824178, 1, 1, 1, 1, 1,
2.705518, -0.8275568, 1.370735, 1, 1, 1, 1, 1,
2.893512, -0.6219633, 1.897171, 1, 1, 1, 1, 1,
2.895512, 0.9351046, 1.454658, 1, 1, 1, 1, 1,
3.195119, -0.1328583, 2.787117, 1, 1, 1, 1, 1
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
var radius = 9.780126;
var distance = 34.35228;
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
mvMatrix.translate( 0.1087632, -0.0860486, -0.08676815 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35228);
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
