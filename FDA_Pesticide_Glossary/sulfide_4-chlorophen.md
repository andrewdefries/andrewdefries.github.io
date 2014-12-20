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
-3.291439, -1.164337, -2.066809, 1, 0, 0, 1,
-3.164171, 2.218989, -0.06026223, 1, 0.007843138, 0, 1,
-2.977227, 0.4727506, -1.779593, 1, 0.01176471, 0, 1,
-2.852824, -0.2098055, -1.323848, 1, 0.01960784, 0, 1,
-2.689217, -0.4510833, -2.638279, 1, 0.02352941, 0, 1,
-2.675793, -0.5757545, -0.7740451, 1, 0.03137255, 0, 1,
-2.629035, -1.727379, -2.477342, 1, 0.03529412, 0, 1,
-2.591488, 0.840631, -1.46204, 1, 0.04313726, 0, 1,
-2.446172, -0.5997308, 0.4968343, 1, 0.04705882, 0, 1,
-2.358444, -1.0724, -2.796987, 1, 0.05490196, 0, 1,
-2.304125, 2.12854, -0.006184039, 1, 0.05882353, 0, 1,
-2.265965, 0.1369165, -2.904753, 1, 0.06666667, 0, 1,
-2.228474, -0.4942172, -0.5235591, 1, 0.07058824, 0, 1,
-2.227942, 0.7155456, -2.67474, 1, 0.07843138, 0, 1,
-2.199456, 0.4252077, -0.6171954, 1, 0.08235294, 0, 1,
-2.18145, 0.07100815, -0.7791206, 1, 0.09019608, 0, 1,
-2.169213, 1.212048, -1.621871, 1, 0.09411765, 0, 1,
-2.055013, 0.8262861, -0.7970051, 1, 0.1019608, 0, 1,
-2.029902, -0.9463693, -1.654665, 1, 0.1098039, 0, 1,
-1.963097, -1.944203, -2.350494, 1, 0.1137255, 0, 1,
-1.956688, -0.4218115, -1.64426, 1, 0.1215686, 0, 1,
-1.943766, 0.2948846, -1.789433, 1, 0.1254902, 0, 1,
-1.940461, 0.0197307, -1.51797, 1, 0.1333333, 0, 1,
-1.923217, -1.290143, -3.690955, 1, 0.1372549, 0, 1,
-1.910987, -1.675685, -3.551991, 1, 0.145098, 0, 1,
-1.910134, -0.8297127, -3.278716, 1, 0.1490196, 0, 1,
-1.901771, 0.9774569, -1.626257, 1, 0.1568628, 0, 1,
-1.884022, 1.807924, 0.3496277, 1, 0.1607843, 0, 1,
-1.859636, -1.651343, -0.961953, 1, 0.1686275, 0, 1,
-1.816654, 1.343763, -0.9690993, 1, 0.172549, 0, 1,
-1.8131, 1.092787, -2.735571, 1, 0.1803922, 0, 1,
-1.801984, 0.1318922, -1.293808, 1, 0.1843137, 0, 1,
-1.785689, 0.1371842, -0.4646258, 1, 0.1921569, 0, 1,
-1.767858, 1.319152, -1.327959, 1, 0.1960784, 0, 1,
-1.753683, -1.086165, -1.631431, 1, 0.2039216, 0, 1,
-1.746809, 2.120125, 0.6445194, 1, 0.2117647, 0, 1,
-1.734228, 0.4246237, -0.6606688, 1, 0.2156863, 0, 1,
-1.726446, 0.7767663, -2.624233, 1, 0.2235294, 0, 1,
-1.714925, 1.684733, -1.840535, 1, 0.227451, 0, 1,
-1.709404, 0.04949155, -1.056652, 1, 0.2352941, 0, 1,
-1.704644, 1.422909, -0.3626449, 1, 0.2392157, 0, 1,
-1.685657, 1.121761, -1.453155, 1, 0.2470588, 0, 1,
-1.672989, -0.3703569, -0.8773431, 1, 0.2509804, 0, 1,
-1.663754, 0.735593, -1.558972, 1, 0.2588235, 0, 1,
-1.662814, 1.125721, -0.5437459, 1, 0.2627451, 0, 1,
-1.654641, 0.6813043, -0.8110798, 1, 0.2705882, 0, 1,
-1.626399, -0.90501, -1.079092, 1, 0.2745098, 0, 1,
-1.623324, -2.949153, -0.6407574, 1, 0.282353, 0, 1,
-1.612878, 0.2787624, -0.3071207, 1, 0.2862745, 0, 1,
-1.597646, 0.02797354, -1.452638, 1, 0.2941177, 0, 1,
-1.590181, -1.044913, -1.980522, 1, 0.3019608, 0, 1,
-1.582866, -0.3479002, -3.317887, 1, 0.3058824, 0, 1,
-1.575016, 0.1706748, -0.5209162, 1, 0.3137255, 0, 1,
-1.573927, -1.540212, -2.366615, 1, 0.3176471, 0, 1,
-1.570976, -0.1195036, -0.8298202, 1, 0.3254902, 0, 1,
-1.568693, 0.8016094, -0.6642972, 1, 0.3294118, 0, 1,
-1.564828, -1.170564, -2.369845, 1, 0.3372549, 0, 1,
-1.564422, 1.157108, -1.238924, 1, 0.3411765, 0, 1,
-1.563396, 1.267122, -1.193795, 1, 0.3490196, 0, 1,
-1.561814, 0.1950035, -2.029754, 1, 0.3529412, 0, 1,
-1.547088, -0.3759202, -2.222456, 1, 0.3607843, 0, 1,
-1.537914, -0.25493, -2.785535, 1, 0.3647059, 0, 1,
-1.530183, -0.3889631, -2.676046, 1, 0.372549, 0, 1,
-1.522831, -1.261078, -1.318285, 1, 0.3764706, 0, 1,
-1.52146, 1.244691, -0.8700718, 1, 0.3843137, 0, 1,
-1.518268, -0.2957947, -2.475933, 1, 0.3882353, 0, 1,
-1.503753, -0.5656445, -0.6755025, 1, 0.3960784, 0, 1,
-1.501842, 0.2534523, -0.7902632, 1, 0.4039216, 0, 1,
-1.496861, -1.212941, -3.560554, 1, 0.4078431, 0, 1,
-1.487156, 0.4858733, -1.128281, 1, 0.4156863, 0, 1,
-1.484964, 0.9078792, -0.9160045, 1, 0.4196078, 0, 1,
-1.471296, -0.03244015, -2.305999, 1, 0.427451, 0, 1,
-1.469309, 0.2031793, -0.3234929, 1, 0.4313726, 0, 1,
-1.45925, 0.6489316, -0.1636002, 1, 0.4392157, 0, 1,
-1.436776, 0.8498074, -0.5697379, 1, 0.4431373, 0, 1,
-1.433677, -0.001495938, -0.618569, 1, 0.4509804, 0, 1,
-1.425081, 0.543884, -0.5777276, 1, 0.454902, 0, 1,
-1.41814, 0.382894, -0.3388654, 1, 0.4627451, 0, 1,
-1.409811, -0.7940783, -2.642498, 1, 0.4666667, 0, 1,
-1.408273, 0.872281, -0.7090408, 1, 0.4745098, 0, 1,
-1.400367, 2.050807, -0.7707015, 1, 0.4784314, 0, 1,
-1.392937, -0.696834, -1.158265, 1, 0.4862745, 0, 1,
-1.390668, 1.509157, -1.070522, 1, 0.4901961, 0, 1,
-1.383086, -0.1140673, -2.486405, 1, 0.4980392, 0, 1,
-1.378698, -0.3598471, -0.7530395, 1, 0.5058824, 0, 1,
-1.366137, 0.0988126, -3.034488, 1, 0.509804, 0, 1,
-1.364283, 0.6880003, -2.776433, 1, 0.5176471, 0, 1,
-1.358018, -0.4567333, -0.4669464, 1, 0.5215687, 0, 1,
-1.35672, -2.213275, -4.698796, 1, 0.5294118, 0, 1,
-1.345913, -0.04231937, -2.856616, 1, 0.5333334, 0, 1,
-1.342863, -0.8787971, -2.088405, 1, 0.5411765, 0, 1,
-1.328117, 0.06275205, -1.37419, 1, 0.5450981, 0, 1,
-1.320979, -1.405487, -3.349857, 1, 0.5529412, 0, 1,
-1.320105, 0.7011715, -1.970437, 1, 0.5568628, 0, 1,
-1.317194, 0.7690564, 0.5303366, 1, 0.5647059, 0, 1,
-1.312518, 0.4242562, -1.391826, 1, 0.5686275, 0, 1,
-1.304447, -0.4434071, -1.825404, 1, 0.5764706, 0, 1,
-1.291465, 1.35753, -1.226297, 1, 0.5803922, 0, 1,
-1.291459, 0.4947328, -1.322419, 1, 0.5882353, 0, 1,
-1.266434, -1.006197, -1.595788, 1, 0.5921569, 0, 1,
-1.265007, 0.2316119, -0.9449319, 1, 0.6, 0, 1,
-1.262023, -0.9301975, -2.412041, 1, 0.6078432, 0, 1,
-1.249442, 1.394322, -0.119171, 1, 0.6117647, 0, 1,
-1.244752, -2.096677, -2.463119, 1, 0.6196079, 0, 1,
-1.243697, 1.190693, -0.5183682, 1, 0.6235294, 0, 1,
-1.242291, -0.3231145, -0.8570545, 1, 0.6313726, 0, 1,
-1.234943, -0.6252738, -2.803271, 1, 0.6352941, 0, 1,
-1.232727, -1.293813, -2.158307, 1, 0.6431373, 0, 1,
-1.217978, 1.830292, -0.9753436, 1, 0.6470588, 0, 1,
-1.214529, -1.097911, -2.167721, 1, 0.654902, 0, 1,
-1.210754, -0.9437277, -1.564641, 1, 0.6588235, 0, 1,
-1.209233, 0.185654, -1.562014, 1, 0.6666667, 0, 1,
-1.20662, -0.6585327, -1.48884, 1, 0.6705883, 0, 1,
-1.200537, -0.5384837, 0.3648025, 1, 0.6784314, 0, 1,
-1.199352, 1.242134, -0.1522869, 1, 0.682353, 0, 1,
-1.19516, 1.324042, 0.7911212, 1, 0.6901961, 0, 1,
-1.194173, 0.04223332, -2.060243, 1, 0.6941177, 0, 1,
-1.189001, -0.5823221, -2.913327, 1, 0.7019608, 0, 1,
-1.182535, -0.06857163, -1.382461, 1, 0.7098039, 0, 1,
-1.181945, -0.3726552, -2.33235, 1, 0.7137255, 0, 1,
-1.179271, 0.3327989, -1.997404, 1, 0.7215686, 0, 1,
-1.174175, 0.872159, -0.6223198, 1, 0.7254902, 0, 1,
-1.165856, 1.172105, -0.1580541, 1, 0.7333333, 0, 1,
-1.163628, 0.5876639, -0.3137985, 1, 0.7372549, 0, 1,
-1.162398, 0.6086541, 1.074494, 1, 0.7450981, 0, 1,
-1.157835, -2.111678, -1.79252, 1, 0.7490196, 0, 1,
-1.157689, 0.1753101, -2.123127, 1, 0.7568628, 0, 1,
-1.153554, 0.7129874, -2.223794, 1, 0.7607843, 0, 1,
-1.149848, -0.3670663, -1.477696, 1, 0.7686275, 0, 1,
-1.146162, 0.4732769, -0.2935053, 1, 0.772549, 0, 1,
-1.114666, -1.535362, -2.570683, 1, 0.7803922, 0, 1,
-1.11145, 1.154387, 0.5065202, 1, 0.7843137, 0, 1,
-1.106111, 0.4763951, -1.272215, 1, 0.7921569, 0, 1,
-1.102301, 2.198971, -1.219837, 1, 0.7960784, 0, 1,
-1.100777, 1.206112, -1.280134, 1, 0.8039216, 0, 1,
-1.097737, 0.8997704, -0.9007331, 1, 0.8117647, 0, 1,
-1.097526, -1.138395, -0.4668176, 1, 0.8156863, 0, 1,
-1.096247, -0.9463575, -1.642826, 1, 0.8235294, 0, 1,
-1.093249, -0.4770485, -1.879347, 1, 0.827451, 0, 1,
-1.085739, 0.1672668, -0.4426433, 1, 0.8352941, 0, 1,
-1.074274, -0.6007605, -1.76593, 1, 0.8392157, 0, 1,
-1.073229, 1.810542, -2.41259, 1, 0.8470588, 0, 1,
-1.072086, -1.483742, -2.33819, 1, 0.8509804, 0, 1,
-1.05788, -0.2746198, -1.85385, 1, 0.8588235, 0, 1,
-1.057406, 0.1583927, -1.176066, 1, 0.8627451, 0, 1,
-1.043174, -0.4585349, -2.39115, 1, 0.8705882, 0, 1,
-1.021603, 0.2952966, -3.328163, 1, 0.8745098, 0, 1,
-1.015651, -1.331658, -2.546389, 1, 0.8823529, 0, 1,
-1.007187, -0.7677132, -1.803486, 1, 0.8862745, 0, 1,
-1.001764, -1.294907, -2.752033, 1, 0.8941177, 0, 1,
-0.9995071, 0.2214697, -0.9153135, 1, 0.8980392, 0, 1,
-0.9962431, -1.123228, -2.670068, 1, 0.9058824, 0, 1,
-0.9936942, 1.090912, 1.421214, 1, 0.9137255, 0, 1,
-0.9927511, -0.4425556, -2.865621, 1, 0.9176471, 0, 1,
-0.9915378, 0.7200602, -1.399781, 1, 0.9254902, 0, 1,
-0.989531, 2.13382, 0.8823922, 1, 0.9294118, 0, 1,
-0.9880054, 0.8595604, -1.567975, 1, 0.9372549, 0, 1,
-0.9862915, 0.4020357, -1.844071, 1, 0.9411765, 0, 1,
-0.9861015, -0.6312997, -1.27734, 1, 0.9490196, 0, 1,
-0.9837397, -0.5578617, -2.726868, 1, 0.9529412, 0, 1,
-0.9804689, -0.740339, -1.959925, 1, 0.9607843, 0, 1,
-0.9788221, 0.4592404, -1.700612, 1, 0.9647059, 0, 1,
-0.9765905, -1.251093, -3.940897, 1, 0.972549, 0, 1,
-0.9758176, 0.07833458, -3.201073, 1, 0.9764706, 0, 1,
-0.9672475, 3.257098, 0.5399647, 1, 0.9843137, 0, 1,
-0.9638619, 1.570212, -0.02424092, 1, 0.9882353, 0, 1,
-0.9548053, 0.4371729, 0.0630794, 1, 0.9960784, 0, 1,
-0.953029, -0.2907772, -2.22515, 0.9960784, 1, 0, 1,
-0.9495571, -0.209784, -1.809181, 0.9921569, 1, 0, 1,
-0.946622, 0.4948944, -1.293722, 0.9843137, 1, 0, 1,
-0.9350257, 0.6473953, -0.8615158, 0.9803922, 1, 0, 1,
-0.9304833, -0.3946624, -3.607946, 0.972549, 1, 0, 1,
-0.9261416, 0.1517896, -1.987656, 0.9686275, 1, 0, 1,
-0.9250598, 1.2634, -1.842797, 0.9607843, 1, 0, 1,
-0.9193832, 1.265843, -1.243065, 0.9568627, 1, 0, 1,
-0.9142202, -0.4732105, -1.692677, 0.9490196, 1, 0, 1,
-0.9138572, 0.7441119, -0.5974789, 0.945098, 1, 0, 1,
-0.9087141, 0.9209326, -0.6798306, 0.9372549, 1, 0, 1,
-0.9081543, 0.3529688, -0.3628426, 0.9333333, 1, 0, 1,
-0.9069421, -1.405182, -2.658589, 0.9254902, 1, 0, 1,
-0.9028918, -0.4084685, -3.273155, 0.9215686, 1, 0, 1,
-0.9007875, 0.000123164, -1.205407, 0.9137255, 1, 0, 1,
-0.8968185, -1.638871, -2.743925, 0.9098039, 1, 0, 1,
-0.8923763, -1.316504, -1.806131, 0.9019608, 1, 0, 1,
-0.8913622, -0.9514097, -2.513948, 0.8941177, 1, 0, 1,
-0.880537, -0.5395461, -0.6854598, 0.8901961, 1, 0, 1,
-0.8710145, -2.065627, -0.9264781, 0.8823529, 1, 0, 1,
-0.8702375, 1.117844, -1.939616, 0.8784314, 1, 0, 1,
-0.8619289, -0.8535628, -2.562732, 0.8705882, 1, 0, 1,
-0.8598419, -0.5727857, -2.909855, 0.8666667, 1, 0, 1,
-0.8553482, -0.1601064, -1.749443, 0.8588235, 1, 0, 1,
-0.8546596, 0.3641266, -2.363461, 0.854902, 1, 0, 1,
-0.8471542, -1.741192, -2.310484, 0.8470588, 1, 0, 1,
-0.8467579, -1.690801, -3.121621, 0.8431373, 1, 0, 1,
-0.8460719, 0.4944261, 1.428281, 0.8352941, 1, 0, 1,
-0.8417304, 0.3348214, -2.325148, 0.8313726, 1, 0, 1,
-0.8390154, -0.4932861, -3.904617, 0.8235294, 1, 0, 1,
-0.8195375, -0.8891846, -5.750134, 0.8196079, 1, 0, 1,
-0.8194701, -0.2784977, -2.687794, 0.8117647, 1, 0, 1,
-0.8184757, 0.1714541, -0.7885568, 0.8078431, 1, 0, 1,
-0.8184144, -0.5320216, -1.91143, 0.8, 1, 0, 1,
-0.8153788, -0.6230764, -1.869346, 0.7921569, 1, 0, 1,
-0.8135937, 0.105327, -0.5015966, 0.7882353, 1, 0, 1,
-0.8122377, -0.8747337, -1.109011, 0.7803922, 1, 0, 1,
-0.8034275, 0.4574973, -0.4648854, 0.7764706, 1, 0, 1,
-0.7972798, 0.2314998, -1.988765, 0.7686275, 1, 0, 1,
-0.7961989, -0.1605998, -0.9758617, 0.7647059, 1, 0, 1,
-0.7883251, 1.013484, -0.9641796, 0.7568628, 1, 0, 1,
-0.7878654, 0.3932853, -1.332691, 0.7529412, 1, 0, 1,
-0.7788382, 1.438072, 0.8092346, 0.7450981, 1, 0, 1,
-0.7727337, -0.7979316, -2.906647, 0.7411765, 1, 0, 1,
-0.7720358, -0.9957206, -3.034275, 0.7333333, 1, 0, 1,
-0.769052, 0.2802208, -1.859083, 0.7294118, 1, 0, 1,
-0.7687305, 0.7709178, -1.722551, 0.7215686, 1, 0, 1,
-0.760305, 0.7354139, -0.9762938, 0.7176471, 1, 0, 1,
-0.756812, 0.2844629, -2.14488, 0.7098039, 1, 0, 1,
-0.756101, 0.6137727, -1.943577, 0.7058824, 1, 0, 1,
-0.7553465, 1.896997, -1.243401, 0.6980392, 1, 0, 1,
-0.7534469, -1.46605, -2.545605, 0.6901961, 1, 0, 1,
-0.7529107, -0.6506146, -1.562391, 0.6862745, 1, 0, 1,
-0.7512954, 0.4931675, -0.8560541, 0.6784314, 1, 0, 1,
-0.7501641, 1.122963, -0.8717135, 0.6745098, 1, 0, 1,
-0.7465075, -1.023355, -3.236092, 0.6666667, 1, 0, 1,
-0.7387575, 0.4050884, 0.4076981, 0.6627451, 1, 0, 1,
-0.7367361, 1.330366, -0.5286542, 0.654902, 1, 0, 1,
-0.7326158, 0.8865662, -1.097009, 0.6509804, 1, 0, 1,
-0.7281173, -0.7827855, -3.40676, 0.6431373, 1, 0, 1,
-0.7203331, 0.03849907, -0.6804174, 0.6392157, 1, 0, 1,
-0.719439, -1.339262, -4.24073, 0.6313726, 1, 0, 1,
-0.7152753, -0.4190093, -2.33906, 0.627451, 1, 0, 1,
-0.7144445, 1.008015, -1.161768, 0.6196079, 1, 0, 1,
-0.7129266, -0.4461947, -1.228406, 0.6156863, 1, 0, 1,
-0.7125346, 0.849369, -0.6815508, 0.6078432, 1, 0, 1,
-0.7096937, -0.1790469, -2.554749, 0.6039216, 1, 0, 1,
-0.708692, 0.2017213, -0.8874763, 0.5960785, 1, 0, 1,
-0.6979359, -0.4092218, -2.530156, 0.5882353, 1, 0, 1,
-0.6949961, 0.1163446, -0.8758482, 0.5843138, 1, 0, 1,
-0.6890934, 0.7138922, 1.720916, 0.5764706, 1, 0, 1,
-0.6870165, -1.002566, -2.822311, 0.572549, 1, 0, 1,
-0.6865838, -1.012104, -4.507033, 0.5647059, 1, 0, 1,
-0.6851081, -0.1543046, -2.574332, 0.5607843, 1, 0, 1,
-0.683236, -1.436368, -1.9397, 0.5529412, 1, 0, 1,
-0.6820443, -1.454391, -1.606591, 0.5490196, 1, 0, 1,
-0.6812235, 0.0699764, -3.164628, 0.5411765, 1, 0, 1,
-0.6677239, 0.0861459, -1.465984, 0.5372549, 1, 0, 1,
-0.6605008, -0.1972602, -2.304718, 0.5294118, 1, 0, 1,
-0.6598287, 0.4528293, -0.4689862, 0.5254902, 1, 0, 1,
-0.6596491, 0.68204, -1.234697, 0.5176471, 1, 0, 1,
-0.6513652, 0.5967436, -1.230462, 0.5137255, 1, 0, 1,
-0.6460995, 0.9797354, -0.2037675, 0.5058824, 1, 0, 1,
-0.6458388, -0.2559707, -0.8710353, 0.5019608, 1, 0, 1,
-0.6441053, -0.2239599, -0.8174093, 0.4941176, 1, 0, 1,
-0.642733, -0.3679751, -1.761468, 0.4862745, 1, 0, 1,
-0.6404423, -0.01690675, -1.71054, 0.4823529, 1, 0, 1,
-0.6388499, 0.2140374, -2.073503, 0.4745098, 1, 0, 1,
-0.6387279, 0.8744742, -0.05407271, 0.4705882, 1, 0, 1,
-0.6323357, 0.6969054, 0.7675768, 0.4627451, 1, 0, 1,
-0.6305586, 1.10289, -0.5597144, 0.4588235, 1, 0, 1,
-0.6302102, 1.056841, -1.234756, 0.4509804, 1, 0, 1,
-0.6297673, -0.5791547, -1.611457, 0.4470588, 1, 0, 1,
-0.6266847, -0.5035757, -1.476453, 0.4392157, 1, 0, 1,
-0.6241388, 1.41664, 0.5651051, 0.4352941, 1, 0, 1,
-0.6240634, -1.43022, -2.091261, 0.427451, 1, 0, 1,
-0.6208647, 1.750622, -0.1846123, 0.4235294, 1, 0, 1,
-0.6195523, -0.6555225, -1.309167, 0.4156863, 1, 0, 1,
-0.6179572, -1.475337, -3.517185, 0.4117647, 1, 0, 1,
-0.6172024, -1.681792, -4.085841, 0.4039216, 1, 0, 1,
-0.6167102, -0.5315192, -3.317426, 0.3960784, 1, 0, 1,
-0.6138226, 0.13211, -1.042333, 0.3921569, 1, 0, 1,
-0.6094853, -1.558216, -3.52213, 0.3843137, 1, 0, 1,
-0.6027142, 0.3193326, -0.3326502, 0.3803922, 1, 0, 1,
-0.6010389, -0.4218559, -2.428049, 0.372549, 1, 0, 1,
-0.59904, 0.9272775, -2.174609, 0.3686275, 1, 0, 1,
-0.5965037, 0.1182016, -1.13348, 0.3607843, 1, 0, 1,
-0.596077, 2.407669, 0.7726485, 0.3568628, 1, 0, 1,
-0.5893477, 2.266932, -1.665993, 0.3490196, 1, 0, 1,
-0.5868155, 1.379102, -1.166258, 0.345098, 1, 0, 1,
-0.5866127, 0.153693, -1.025336, 0.3372549, 1, 0, 1,
-0.5822782, 0.2133517, -1.550321, 0.3333333, 1, 0, 1,
-0.5747852, 0.2521733, -0.5332614, 0.3254902, 1, 0, 1,
-0.5702357, 0.1683221, -0.8956792, 0.3215686, 1, 0, 1,
-0.5700432, -0.5286749, -1.053868, 0.3137255, 1, 0, 1,
-0.5695107, -1.543328, -2.151195, 0.3098039, 1, 0, 1,
-0.5689242, -0.9487619, -2.798352, 0.3019608, 1, 0, 1,
-0.5633571, -0.4229231, -2.036082, 0.2941177, 1, 0, 1,
-0.5631303, 0.8471495, -2.208047, 0.2901961, 1, 0, 1,
-0.5629808, -1.786283, -3.238128, 0.282353, 1, 0, 1,
-0.5546255, 0.4684693, -1.118162, 0.2784314, 1, 0, 1,
-0.5526748, -0.4277539, -1.721615, 0.2705882, 1, 0, 1,
-0.5475358, 0.1024035, -1.633026, 0.2666667, 1, 0, 1,
-0.5445052, -1.158967, -3.711677, 0.2588235, 1, 0, 1,
-0.5422292, 0.8757778, -0.07283179, 0.254902, 1, 0, 1,
-0.5418254, -0.1806844, -0.1869134, 0.2470588, 1, 0, 1,
-0.5396156, 1.189, -2.244715, 0.2431373, 1, 0, 1,
-0.5314355, 1.249095, -0.8565359, 0.2352941, 1, 0, 1,
-0.5272152, -0.1425816, -2.642872, 0.2313726, 1, 0, 1,
-0.5213454, -0.1047659, -0.618459, 0.2235294, 1, 0, 1,
-0.5208828, -1.908927, -3.420316, 0.2196078, 1, 0, 1,
-0.5185395, -1.712152, -3.295236, 0.2117647, 1, 0, 1,
-0.5165579, -0.8600224, -2.773994, 0.2078431, 1, 0, 1,
-0.5097822, -0.09751755, -3.884841, 0.2, 1, 0, 1,
-0.5061035, -0.8397371, -3.67451, 0.1921569, 1, 0, 1,
-0.5044423, 0.09428674, -2.85459, 0.1882353, 1, 0, 1,
-0.5025902, 0.09909924, -1.728991, 0.1803922, 1, 0, 1,
-0.4998516, -1.774271, -2.765838, 0.1764706, 1, 0, 1,
-0.4949393, 0.6468861, 1.366552, 0.1686275, 1, 0, 1,
-0.4941108, 1.445567, 1.088253, 0.1647059, 1, 0, 1,
-0.4921779, -1.429657, -3.155591, 0.1568628, 1, 0, 1,
-0.4919881, -0.7775365, -3.071847, 0.1529412, 1, 0, 1,
-0.4844469, 1.753492, -2.509568, 0.145098, 1, 0, 1,
-0.4805939, -0.2679365, -2.394653, 0.1411765, 1, 0, 1,
-0.4800763, -1.632407, -4.781715, 0.1333333, 1, 0, 1,
-0.4778742, 1.126656, 1.56467, 0.1294118, 1, 0, 1,
-0.4762093, -0.02134227, -1.17293, 0.1215686, 1, 0, 1,
-0.4752259, -0.3461633, -3.707997, 0.1176471, 1, 0, 1,
-0.473484, -0.08747832, 0.2040615, 0.1098039, 1, 0, 1,
-0.4728981, -0.629685, -2.88004, 0.1058824, 1, 0, 1,
-0.4697369, -0.1064064, -2.794994, 0.09803922, 1, 0, 1,
-0.4666958, -0.06351604, -1.417286, 0.09019608, 1, 0, 1,
-0.46669, 0.0659854, -1.509229, 0.08627451, 1, 0, 1,
-0.4652969, -1.192946, 0.3057171, 0.07843138, 1, 0, 1,
-0.4639848, -0.9160545, -2.011661, 0.07450981, 1, 0, 1,
-0.4593811, -0.4458231, -4.33275, 0.06666667, 1, 0, 1,
-0.4576615, 0.444656, -0.3468587, 0.0627451, 1, 0, 1,
-0.4554833, -0.637296, -3.886196, 0.05490196, 1, 0, 1,
-0.4532674, -0.3260142, -2.614677, 0.05098039, 1, 0, 1,
-0.4493802, 1.703963, 0.8439325, 0.04313726, 1, 0, 1,
-0.4419179, 0.7640507, -0.5769969, 0.03921569, 1, 0, 1,
-0.4414783, 1.552801, -0.1831128, 0.03137255, 1, 0, 1,
-0.438662, -0.1498653, -2.165986, 0.02745098, 1, 0, 1,
-0.4367861, -0.8859037, -3.798535, 0.01960784, 1, 0, 1,
-0.4358108, -0.8861452, -3.237615, 0.01568628, 1, 0, 1,
-0.4333784, -0.4072976, -1.06781, 0.007843138, 1, 0, 1,
-0.429907, 0.03691537, -2.779198, 0.003921569, 1, 0, 1,
-0.4259939, 2.023541, 0.1635612, 0, 1, 0.003921569, 1,
-0.4253771, -0.009503306, -0.6060495, 0, 1, 0.01176471, 1,
-0.422543, 1.069162, 0.1168062, 0, 1, 0.01568628, 1,
-0.4213273, 0.4032884, -3.250164, 0, 1, 0.02352941, 1,
-0.4201376, 0.7681974, -0.9703303, 0, 1, 0.02745098, 1,
-0.4161845, 0.2400517, -0.8266693, 0, 1, 0.03529412, 1,
-0.4134736, -0.6888184, -1.059511, 0, 1, 0.03921569, 1,
-0.411591, 1.151855, 1.46849, 0, 1, 0.04705882, 1,
-0.409453, 0.3612289, -1.601348, 0, 1, 0.05098039, 1,
-0.3962716, -0.1829555, -1.123313, 0, 1, 0.05882353, 1,
-0.3960524, -0.644338, -2.092477, 0, 1, 0.0627451, 1,
-0.3941433, -1.957031, -2.326582, 0, 1, 0.07058824, 1,
-0.3930264, -1.010524, -3.214552, 0, 1, 0.07450981, 1,
-0.3907722, -0.6399977, -0.7576135, 0, 1, 0.08235294, 1,
-0.3874761, -0.01558588, -1.357456, 0, 1, 0.08627451, 1,
-0.3778853, -0.07677687, -2.323464, 0, 1, 0.09411765, 1,
-0.3777403, 0.1936021, -1.069535, 0, 1, 0.1019608, 1,
-0.3748061, -0.6314824, -1.518211, 0, 1, 0.1058824, 1,
-0.3739541, -0.3801058, -2.887487, 0, 1, 0.1137255, 1,
-0.3660388, -0.7281427, -2.553317, 0, 1, 0.1176471, 1,
-0.3584554, -0.5589806, -2.985807, 0, 1, 0.1254902, 1,
-0.3557114, 0.8707114, -0.02927532, 0, 1, 0.1294118, 1,
-0.3453635, -1.04351, -3.696765, 0, 1, 0.1372549, 1,
-0.3447299, -0.6356237, -1.789819, 0, 1, 0.1411765, 1,
-0.3442291, -1.136877, -3.160306, 0, 1, 0.1490196, 1,
-0.3415299, 1.176726, 1.962648, 0, 1, 0.1529412, 1,
-0.3390107, -0.144128, -1.652951, 0, 1, 0.1607843, 1,
-0.3384357, -0.7921718, -2.679713, 0, 1, 0.1647059, 1,
-0.3307766, -0.6207052, -3.025351, 0, 1, 0.172549, 1,
-0.3280216, 0.4183723, -0.1597787, 0, 1, 0.1764706, 1,
-0.3263015, 0.09884114, -0.5064905, 0, 1, 0.1843137, 1,
-0.3227109, -1.367167, -1.998078, 0, 1, 0.1882353, 1,
-0.3223113, 2.114009, -0.02024406, 0, 1, 0.1960784, 1,
-0.320632, 2.135124, 0.7902967, 0, 1, 0.2039216, 1,
-0.3195455, -0.2573957, -4.011185, 0, 1, 0.2078431, 1,
-0.3183389, 0.2587669, -1.941839, 0, 1, 0.2156863, 1,
-0.3175544, -0.5835405, -2.827139, 0, 1, 0.2196078, 1,
-0.3116619, -0.491192, -2.323612, 0, 1, 0.227451, 1,
-0.3104005, -0.8835082, -3.580554, 0, 1, 0.2313726, 1,
-0.3096347, 0.08409804, -0.1151805, 0, 1, 0.2392157, 1,
-0.308684, -1.246616, -3.069305, 0, 1, 0.2431373, 1,
-0.3002589, -1.659529, -3.998319, 0, 1, 0.2509804, 1,
-0.2973273, 1.118812, -0.04041074, 0, 1, 0.254902, 1,
-0.2954285, -0.04025631, -2.097163, 0, 1, 0.2627451, 1,
-0.2948933, -0.2980812, -2.601761, 0, 1, 0.2666667, 1,
-0.2941879, -0.7614514, -2.955728, 0, 1, 0.2745098, 1,
-0.2899629, -0.06922929, -2.124705, 0, 1, 0.2784314, 1,
-0.2897158, 0.05995861, -1.135874, 0, 1, 0.2862745, 1,
-0.2886761, -1.756495, -2.881085, 0, 1, 0.2901961, 1,
-0.2877286, -0.07942815, -1.421337, 0, 1, 0.2980392, 1,
-0.2859499, -0.404315, -3.659738, 0, 1, 0.3058824, 1,
-0.2858907, 0.4349665, -2.195471, 0, 1, 0.3098039, 1,
-0.2852639, 1.175817, 0.198148, 0, 1, 0.3176471, 1,
-0.284781, 0.1309412, -1.021321, 0, 1, 0.3215686, 1,
-0.2823342, -0.4272181, -3.137447, 0, 1, 0.3294118, 1,
-0.2796888, 2.354169, -1.210777, 0, 1, 0.3333333, 1,
-0.2783503, -0.06235495, -2.898589, 0, 1, 0.3411765, 1,
-0.2780665, 0.6692867, -0.7659202, 0, 1, 0.345098, 1,
-0.2751729, -1.082451, -4.718927, 0, 1, 0.3529412, 1,
-0.2731746, -0.08345914, -3.762871, 0, 1, 0.3568628, 1,
-0.2731029, -1.136066, -3.509106, 0, 1, 0.3647059, 1,
-0.2724869, -0.276514, -2.88338, 0, 1, 0.3686275, 1,
-0.2696588, 1.469087, -1.372691, 0, 1, 0.3764706, 1,
-0.2652144, 0.4027048, -0.8025766, 0, 1, 0.3803922, 1,
-0.2648451, -0.1603961, -2.073943, 0, 1, 0.3882353, 1,
-0.2625279, 0.8013847, 0.4363036, 0, 1, 0.3921569, 1,
-0.2587154, 0.5177531, 0.5971385, 0, 1, 0.4, 1,
-0.2566217, -0.8984345, -3.276839, 0, 1, 0.4078431, 1,
-0.2558491, 1.24496, -0.9909562, 0, 1, 0.4117647, 1,
-0.2527383, 0.2385293, -0.7052574, 0, 1, 0.4196078, 1,
-0.2404185, -0.6881979, -3.436087, 0, 1, 0.4235294, 1,
-0.2391664, 0.9914273, -0.4104764, 0, 1, 0.4313726, 1,
-0.2335138, 1.833578, -1.251646, 0, 1, 0.4352941, 1,
-0.2330875, 0.9922889, -2.659039, 0, 1, 0.4431373, 1,
-0.2328424, -1.051241, -3.727462, 0, 1, 0.4470588, 1,
-0.2321973, 1.532526, -0.6163589, 0, 1, 0.454902, 1,
-0.2093114, 1.217442, 0.6310415, 0, 1, 0.4588235, 1,
-0.2086033, -1.025393, -2.448508, 0, 1, 0.4666667, 1,
-0.2085621, -0.3213604, -1.045526, 0, 1, 0.4705882, 1,
-0.2053868, 0.4339589, 0.888454, 0, 1, 0.4784314, 1,
-0.205014, -0.6730995, -3.894396, 0, 1, 0.4823529, 1,
-0.2039822, 0.4298053, -1.054209, 0, 1, 0.4901961, 1,
-0.2015081, -0.7583571, -0.9096577, 0, 1, 0.4941176, 1,
-0.1995259, -1.251731, -3.460896, 0, 1, 0.5019608, 1,
-0.1961197, 0.9874623, -0.9597999, 0, 1, 0.509804, 1,
-0.1957779, -0.6381864, -3.643547, 0, 1, 0.5137255, 1,
-0.1897336, -0.3139566, -2.101441, 0, 1, 0.5215687, 1,
-0.1892499, 0.4688824, -1.144867, 0, 1, 0.5254902, 1,
-0.1889564, 0.3915359, -0.726624, 0, 1, 0.5333334, 1,
-0.1871929, 0.2435263, -2.102159, 0, 1, 0.5372549, 1,
-0.1847653, 0.5380987, 0.122912, 0, 1, 0.5450981, 1,
-0.1816262, -0.5471926, -1.727689, 0, 1, 0.5490196, 1,
-0.1799657, -0.07091498, -0.9601685, 0, 1, 0.5568628, 1,
-0.1780519, -1.067261, -3.99361, 0, 1, 0.5607843, 1,
-0.1766341, -0.1843279, -4.629822, 0, 1, 0.5686275, 1,
-0.1750561, 1.245387, -0.7155476, 0, 1, 0.572549, 1,
-0.1733354, -0.9598821, -2.475764, 0, 1, 0.5803922, 1,
-0.1718112, 0.4568476, -0.1138283, 0, 1, 0.5843138, 1,
-0.1701972, 0.9910862, 0.2726944, 0, 1, 0.5921569, 1,
-0.1701783, 1.77695, 0.4691857, 0, 1, 0.5960785, 1,
-0.1683703, -0.2741519, -2.988167, 0, 1, 0.6039216, 1,
-0.164359, 0.7915512, 0.08385026, 0, 1, 0.6117647, 1,
-0.1626614, 0.06985014, -2.088537, 0, 1, 0.6156863, 1,
-0.1625965, -0.8305807, -3.538461, 0, 1, 0.6235294, 1,
-0.153537, 0.435506, 0.8394535, 0, 1, 0.627451, 1,
-0.1519455, 0.7562158, -1.502585, 0, 1, 0.6352941, 1,
-0.1495795, 0.1932946, -0.4753673, 0, 1, 0.6392157, 1,
-0.1457101, -1.046285, -4.06553, 0, 1, 0.6470588, 1,
-0.1451493, -0.9025306, -2.339102, 0, 1, 0.6509804, 1,
-0.1444454, -0.8905434, -2.862666, 0, 1, 0.6588235, 1,
-0.1420549, 0.2550684, -1.684705, 0, 1, 0.6627451, 1,
-0.1344944, 0.5697156, -0.7522978, 0, 1, 0.6705883, 1,
-0.1331182, -0.8439137, -5.657764, 0, 1, 0.6745098, 1,
-0.128079, 0.08822612, -1.142358, 0, 1, 0.682353, 1,
-0.1247922, -0.9303618, -2.459814, 0, 1, 0.6862745, 1,
-0.1246441, 0.2794471, 0.3923572, 0, 1, 0.6941177, 1,
-0.1201469, 1.54099, -0.4025011, 0, 1, 0.7019608, 1,
-0.1169427, 0.6453008, -0.6242218, 0, 1, 0.7058824, 1,
-0.1101852, -1.767501, -3.654799, 0, 1, 0.7137255, 1,
-0.104638, -0.0966435, -2.561875, 0, 1, 0.7176471, 1,
-0.1027425, -1.874207, -1.450495, 0, 1, 0.7254902, 1,
-0.09969091, -0.06891011, -1.562542, 0, 1, 0.7294118, 1,
-0.09628485, -0.4281631, -1.774665, 0, 1, 0.7372549, 1,
-0.09318411, 0.09480063, -2.298354, 0, 1, 0.7411765, 1,
-0.09173972, -1.288626, -4.452977, 0, 1, 0.7490196, 1,
-0.0868402, -0.9814242, -5.433428, 0, 1, 0.7529412, 1,
-0.08659066, -0.648221, -3.595684, 0, 1, 0.7607843, 1,
-0.08633157, -0.8511664, -1.87577, 0, 1, 0.7647059, 1,
-0.08615173, 1.163853, 0.8298275, 0, 1, 0.772549, 1,
-0.08512712, 0.309208, -1.425203, 0, 1, 0.7764706, 1,
-0.08451523, 1.612161, -0.8327844, 0, 1, 0.7843137, 1,
-0.0819779, -1.826648, -3.842495, 0, 1, 0.7882353, 1,
-0.07489657, -0.9400989, -2.158001, 0, 1, 0.7960784, 1,
-0.06749896, -1.477877, -2.725284, 0, 1, 0.8039216, 1,
-0.0639425, -0.7819548, -2.735655, 0, 1, 0.8078431, 1,
-0.06309988, -0.00967403, -1.329, 0, 1, 0.8156863, 1,
-0.05788933, 0.5928923, -0.02362835, 0, 1, 0.8196079, 1,
-0.05591961, -0.5677964, -4.919444, 0, 1, 0.827451, 1,
-0.05527508, -0.1517632, -2.189399, 0, 1, 0.8313726, 1,
-0.05525471, -0.4952868, -2.850058, 0, 1, 0.8392157, 1,
-0.0468644, -0.2460296, -3.553952, 0, 1, 0.8431373, 1,
-0.04199378, 1.47958, -0.4813904, 0, 1, 0.8509804, 1,
-0.04014658, -0.02686847, -2.349359, 0, 1, 0.854902, 1,
-0.04008354, -1.570574, -2.351418, 0, 1, 0.8627451, 1,
-0.03811591, 0.6899279, -0.3185677, 0, 1, 0.8666667, 1,
-0.03573742, -1.792305, -3.900244, 0, 1, 0.8745098, 1,
-0.03421775, -0.1976888, -2.277807, 0, 1, 0.8784314, 1,
-0.03279332, -0.611612, -3.581605, 0, 1, 0.8862745, 1,
-0.03028754, 0.06264529, -0.7516134, 0, 1, 0.8901961, 1,
-0.02774737, -0.3782706, -2.587734, 0, 1, 0.8980392, 1,
-0.02606604, 0.7563867, 1.636931, 0, 1, 0.9058824, 1,
-0.02526535, -0.07424436, -2.698182, 0, 1, 0.9098039, 1,
-0.02243951, -0.4256026, -4.898582, 0, 1, 0.9176471, 1,
-0.02090731, -1.315354, -3.005267, 0, 1, 0.9215686, 1,
-0.01931401, 1.398072, -0.6242424, 0, 1, 0.9294118, 1,
-0.01574644, -0.7114278, -2.425929, 0, 1, 0.9333333, 1,
-0.01219798, -1.604304, -2.538627, 0, 1, 0.9411765, 1,
-0.01053492, 0.6110749, 0.02253853, 0, 1, 0.945098, 1,
-0.007564502, 0.1974201, -0.4479567, 0, 1, 0.9529412, 1,
-0.0008107848, 1.090994, -0.3619092, 0, 1, 0.9568627, 1,
0.005907454, 0.6064462, -0.5482294, 0, 1, 0.9647059, 1,
0.006021224, -0.3824131, 2.299042, 0, 1, 0.9686275, 1,
0.006133397, 0.6367036, 0.8348376, 0, 1, 0.9764706, 1,
0.006534239, -0.1170934, 3.356844, 0, 1, 0.9803922, 1,
0.009490643, 0.4455858, 0.131237, 0, 1, 0.9882353, 1,
0.00992593, -0.6160857, 2.910551, 0, 1, 0.9921569, 1,
0.01507952, 0.4385351, 1.099018, 0, 1, 1, 1,
0.01736635, -1.813855, 2.917965, 0, 0.9921569, 1, 1,
0.02168803, 0.8692124, 0.452017, 0, 0.9882353, 1, 1,
0.021967, 0.6286226, 0.03955902, 0, 0.9803922, 1, 1,
0.02461216, 0.9975078, -0.3428795, 0, 0.9764706, 1, 1,
0.02958613, -0.8351636, 2.820759, 0, 0.9686275, 1, 1,
0.03174822, -0.892851, -0.01182084, 0, 0.9647059, 1, 1,
0.03421707, -0.3713539, 3.278348, 0, 0.9568627, 1, 1,
0.03622706, 0.07786664, 0.6659216, 0, 0.9529412, 1, 1,
0.03972688, 1.344878, 1.097656, 0, 0.945098, 1, 1,
0.04040448, -0.02091642, 1.163248, 0, 0.9411765, 1, 1,
0.04492728, -0.5109704, 3.675564, 0, 0.9333333, 1, 1,
0.04598257, 1.007036, -0.5460992, 0, 0.9294118, 1, 1,
0.04759992, -0.9941384, 3.744206, 0, 0.9215686, 1, 1,
0.0496723, 1.178249, 0.2258037, 0, 0.9176471, 1, 1,
0.05028048, -0.4426702, 4.016876, 0, 0.9098039, 1, 1,
0.06069799, 0.7889581, 2.564678, 0, 0.9058824, 1, 1,
0.0610846, 0.5412231, -0.08029635, 0, 0.8980392, 1, 1,
0.06357661, 0.2476725, 0.9659133, 0, 0.8901961, 1, 1,
0.0680327, -1.56959, 4.57923, 0, 0.8862745, 1, 1,
0.07357582, -0.8127819, 2.846565, 0, 0.8784314, 1, 1,
0.07412638, -1.387233, 3.004112, 0, 0.8745098, 1, 1,
0.07629348, -2.088718, 3.264784, 0, 0.8666667, 1, 1,
0.07631092, 1.655627, -0.03666572, 0, 0.8627451, 1, 1,
0.07695032, -0.2784863, 2.014344, 0, 0.854902, 1, 1,
0.07706954, -0.753051, 3.204314, 0, 0.8509804, 1, 1,
0.0772, 0.44366, -0.03955128, 0, 0.8431373, 1, 1,
0.08539553, -1.482599, 1.483992, 0, 0.8392157, 1, 1,
0.08644804, -1.13875, 4.330854, 0, 0.8313726, 1, 1,
0.08736756, 0.07085941, 0.482125, 0, 0.827451, 1, 1,
0.08990782, -0.03211529, 2.568974, 0, 0.8196079, 1, 1,
0.09162298, 1.119105, 0.3751549, 0, 0.8156863, 1, 1,
0.09825741, -0.4195082, 3.191701, 0, 0.8078431, 1, 1,
0.09902262, 0.2364351, 0.9003916, 0, 0.8039216, 1, 1,
0.1005709, 0.1180445, -1.207657, 0, 0.7960784, 1, 1,
0.1017968, 0.1540338, 2.862467, 0, 0.7882353, 1, 1,
0.1020293, 0.9886382, -0.05826586, 0, 0.7843137, 1, 1,
0.1040642, 2.753704, 2.708391, 0, 0.7764706, 1, 1,
0.1060228, -0.07038506, 1.633089, 0, 0.772549, 1, 1,
0.1130131, 1.74042, -0.6398569, 0, 0.7647059, 1, 1,
0.1225436, 0.9397065, -0.05038591, 0, 0.7607843, 1, 1,
0.1233643, -0.7256169, 3.662811, 0, 0.7529412, 1, 1,
0.1236368, -0.04151458, 2.190663, 0, 0.7490196, 1, 1,
0.1301768, 0.9038919, 0.16426, 0, 0.7411765, 1, 1,
0.1323856, 2.741034, 2.174328, 0, 0.7372549, 1, 1,
0.1329103, -0.09702289, 0.6515209, 0, 0.7294118, 1, 1,
0.1333399, 0.5361828, 0.6681156, 0, 0.7254902, 1, 1,
0.1352438, 1.92905, -0.167997, 0, 0.7176471, 1, 1,
0.1391538, -0.08915599, 0.648848, 0, 0.7137255, 1, 1,
0.140193, 0.0993587, 0.7011349, 0, 0.7058824, 1, 1,
0.1411348, 0.2846781, 0.06791297, 0, 0.6980392, 1, 1,
0.1484002, 0.3692239, 1.515234, 0, 0.6941177, 1, 1,
0.1518436, -0.5849947, 3.525861, 0, 0.6862745, 1, 1,
0.1556065, -0.9539306, 2.675501, 0, 0.682353, 1, 1,
0.1588142, 0.6336957, 1.095628, 0, 0.6745098, 1, 1,
0.1647255, 1.492989, -0.3747732, 0, 0.6705883, 1, 1,
0.1661489, 0.451352, 1.519799, 0, 0.6627451, 1, 1,
0.1689282, -0.09590308, 2.765565, 0, 0.6588235, 1, 1,
0.1697219, 1.012631, -0.9334377, 0, 0.6509804, 1, 1,
0.1762267, 0.1223649, 1.621078, 0, 0.6470588, 1, 1,
0.1774261, 1.116147, 2.96565, 0, 0.6392157, 1, 1,
0.1780002, -0.5694208, 2.435098, 0, 0.6352941, 1, 1,
0.1830257, 1.034369, -0.535245, 0, 0.627451, 1, 1,
0.186712, 0.06087949, 2.462206, 0, 0.6235294, 1, 1,
0.1871156, 1.41766, 0.4020738, 0, 0.6156863, 1, 1,
0.18907, -0.1605034, 2.904406, 0, 0.6117647, 1, 1,
0.1896825, 0.8799964, -0.1230996, 0, 0.6039216, 1, 1,
0.1897664, 0.187353, 0.4008423, 0, 0.5960785, 1, 1,
0.190643, 2.086712, -0.5992361, 0, 0.5921569, 1, 1,
0.1916609, 2.216196, 0.8169681, 0, 0.5843138, 1, 1,
0.1932633, 0.6059749, -0.4351553, 0, 0.5803922, 1, 1,
0.1943911, 0.3949821, -1.436308, 0, 0.572549, 1, 1,
0.2004761, -0.3377145, 1.913371, 0, 0.5686275, 1, 1,
0.2075736, 0.6232809, 2.016512, 0, 0.5607843, 1, 1,
0.2174375, 1.006995, 0.1483569, 0, 0.5568628, 1, 1,
0.2211618, 0.257373, 1.89064, 0, 0.5490196, 1, 1,
0.2254088, 0.138257, 1.231909, 0, 0.5450981, 1, 1,
0.2286336, -0.2451582, 2.233684, 0, 0.5372549, 1, 1,
0.2306345, 0.6348192, 1.190834, 0, 0.5333334, 1, 1,
0.2310761, 2.353165, -2.083494, 0, 0.5254902, 1, 1,
0.2316449, -2.623732, 2.691153, 0, 0.5215687, 1, 1,
0.244961, 1.03561, 0.8221907, 0, 0.5137255, 1, 1,
0.2551344, -1.042439, 3.093767, 0, 0.509804, 1, 1,
0.2615418, 1.329488, 0.4112761, 0, 0.5019608, 1, 1,
0.2661131, 0.2694252, 0.9825127, 0, 0.4941176, 1, 1,
0.2664879, 0.9605165, 0.05078866, 0, 0.4901961, 1, 1,
0.2706234, -1.884294, 4.034797, 0, 0.4823529, 1, 1,
0.2739075, 1.007709, 2.38203, 0, 0.4784314, 1, 1,
0.2854139, 0.2296988, 1.484115, 0, 0.4705882, 1, 1,
0.2890286, 0.9679207, 1.803543, 0, 0.4666667, 1, 1,
0.292539, -1.009271, 2.358872, 0, 0.4588235, 1, 1,
0.2926348, 0.2752663, 1.445527, 0, 0.454902, 1, 1,
0.2931578, 2.043484, -2.335726, 0, 0.4470588, 1, 1,
0.2992823, 1.330693, -1.500291, 0, 0.4431373, 1, 1,
0.3023322, -1.446561, 3.097733, 0, 0.4352941, 1, 1,
0.3049419, -0.5212749, 2.14602, 0, 0.4313726, 1, 1,
0.3090942, 1.703912, 1.418573, 0, 0.4235294, 1, 1,
0.3115297, 0.005287937, -1.008503, 0, 0.4196078, 1, 1,
0.3132046, 0.2217974, 1.020138, 0, 0.4117647, 1, 1,
0.3148352, 0.7505707, -0.09112857, 0, 0.4078431, 1, 1,
0.3162985, 1.203033, -1.1231, 0, 0.4, 1, 1,
0.3167005, -1.138211, 2.584558, 0, 0.3921569, 1, 1,
0.3201034, 0.7157886, -0.2726369, 0, 0.3882353, 1, 1,
0.3251363, -2.326873, 3.708881, 0, 0.3803922, 1, 1,
0.327786, -1.395105, 2.455015, 0, 0.3764706, 1, 1,
0.3282171, 1.546023, -0.1269486, 0, 0.3686275, 1, 1,
0.3287729, 0.642881, -0.256538, 0, 0.3647059, 1, 1,
0.3311135, -1.38861, 3.054278, 0, 0.3568628, 1, 1,
0.3318469, -1.648627, 3.039754, 0, 0.3529412, 1, 1,
0.3336259, 0.2003265, 1.401759, 0, 0.345098, 1, 1,
0.3340803, -0.8155915, 3.884017, 0, 0.3411765, 1, 1,
0.3349096, 0.2811417, 0.9996805, 0, 0.3333333, 1, 1,
0.3352149, 0.5020929, 1.141035, 0, 0.3294118, 1, 1,
0.335255, -0.2809748, 3.097076, 0, 0.3215686, 1, 1,
0.3363208, 0.3630259, 1.177325, 0, 0.3176471, 1, 1,
0.3399251, 0.181208, 2.162782, 0, 0.3098039, 1, 1,
0.3403718, -0.5073386, 4.289277, 0, 0.3058824, 1, 1,
0.3442935, -0.3930017, 2.055262, 0, 0.2980392, 1, 1,
0.3506015, 1.062416, 1.628469, 0, 0.2901961, 1, 1,
0.3506072, 0.200154, -1.16777, 0, 0.2862745, 1, 1,
0.3552725, 0.6190936, 0.6718647, 0, 0.2784314, 1, 1,
0.358875, -0.09660248, 0.7113319, 0, 0.2745098, 1, 1,
0.3602871, -0.6448367, 2.011655, 0, 0.2666667, 1, 1,
0.3604274, -0.0942397, -0.352113, 0, 0.2627451, 1, 1,
0.3616003, 0.006691666, 3.418596, 0, 0.254902, 1, 1,
0.3617751, -0.0389415, 1.431662, 0, 0.2509804, 1, 1,
0.3625696, 0.09847111, 1.240672, 0, 0.2431373, 1, 1,
0.3633251, -1.49296, 3.640908, 0, 0.2392157, 1, 1,
0.3638638, -1.110638, 4.494246, 0, 0.2313726, 1, 1,
0.380809, -1.622049, 3.969089, 0, 0.227451, 1, 1,
0.3813364, 0.3034258, 2.057388, 0, 0.2196078, 1, 1,
0.3823397, -0.9050732, 2.817882, 0, 0.2156863, 1, 1,
0.3835145, -1.286887, 3.141671, 0, 0.2078431, 1, 1,
0.383925, -0.4732761, 0.9485905, 0, 0.2039216, 1, 1,
0.3843001, -0.1471313, 0.7230695, 0, 0.1960784, 1, 1,
0.3865139, -0.2877157, 1.544081, 0, 0.1882353, 1, 1,
0.387073, -1.057579, 3.575749, 0, 0.1843137, 1, 1,
0.3896943, 0.9797571, 0.4452356, 0, 0.1764706, 1, 1,
0.3943881, -0.78354, 1.506486, 0, 0.172549, 1, 1,
0.3954023, 0.518941, -0.2602187, 0, 0.1647059, 1, 1,
0.398275, 0.1162003, 1.510473, 0, 0.1607843, 1, 1,
0.4012839, 0.01011341, 2.152467, 0, 0.1529412, 1, 1,
0.4025001, -2.268033e-05, 2.729285, 0, 0.1490196, 1, 1,
0.4054093, 2.116408, 0.8488338, 0, 0.1411765, 1, 1,
0.411162, 1.554681, 0.575706, 0, 0.1372549, 1, 1,
0.4177504, 1.330134, 0.336147, 0, 0.1294118, 1, 1,
0.4231584, 2.446493, -1.067324, 0, 0.1254902, 1, 1,
0.4303904, 0.1982082, 0.481225, 0, 0.1176471, 1, 1,
0.4323447, 0.7885927, 0.7767275, 0, 0.1137255, 1, 1,
0.4335997, 0.6443692, 0.5875974, 0, 0.1058824, 1, 1,
0.4342532, 1.267267, 0.2858649, 0, 0.09803922, 1, 1,
0.4354241, -0.8758188, 0.8869448, 0, 0.09411765, 1, 1,
0.4377639, -0.01646744, 1.299044, 0, 0.08627451, 1, 1,
0.4420268, 1.285634, -2.021581, 0, 0.08235294, 1, 1,
0.4422761, 0.9350656, -0.2863717, 0, 0.07450981, 1, 1,
0.4458455, -0.9753613, 3.255675, 0, 0.07058824, 1, 1,
0.4543937, -0.390704, 2.191268, 0, 0.0627451, 1, 1,
0.4571391, -1.725218, 2.927686, 0, 0.05882353, 1, 1,
0.4607546, 0.5986294, 0.09727998, 0, 0.05098039, 1, 1,
0.4660421, 2.435705, 0.2284921, 0, 0.04705882, 1, 1,
0.4662881, -0.131848, 1.227406, 0, 0.03921569, 1, 1,
0.4699504, -0.3172691, 1.35576, 0, 0.03529412, 1, 1,
0.4736196, -0.2092299, 1.482043, 0, 0.02745098, 1, 1,
0.477699, -0.1305756, 1.970986, 0, 0.02352941, 1, 1,
0.4790224, 0.04761724, 3.465193, 0, 0.01568628, 1, 1,
0.48059, 0.001522776, 1.377128, 0, 0.01176471, 1, 1,
0.4856975, 0.1166459, 2.001736, 0, 0.003921569, 1, 1,
0.4914049, -0.5092291, 3.67514, 0.003921569, 0, 1, 1,
0.49169, 0.8415731, -0.1096168, 0.007843138, 0, 1, 1,
0.4922759, 0.8838393, 0.3214983, 0.01568628, 0, 1, 1,
0.4948757, -0.2676092, 2.614145, 0.01960784, 0, 1, 1,
0.4955913, -0.283312, 1.083138, 0.02745098, 0, 1, 1,
0.4963621, 0.3205061, -0.5219336, 0.03137255, 0, 1, 1,
0.4968845, -0.8341365, 2.48504, 0.03921569, 0, 1, 1,
0.501816, 1.532402, 0.6065154, 0.04313726, 0, 1, 1,
0.5026135, -0.7957636, 2.194968, 0.05098039, 0, 1, 1,
0.5042606, 2.078767, 1.204833, 0.05490196, 0, 1, 1,
0.5043056, 0.7325665, 1.271895, 0.0627451, 0, 1, 1,
0.5061648, 0.3903514, 3.014683, 0.06666667, 0, 1, 1,
0.5077403, 1.086303, 1.470099, 0.07450981, 0, 1, 1,
0.5080803, -0.537126, 0.7312593, 0.07843138, 0, 1, 1,
0.5085307, -2.340667, 2.322365, 0.08627451, 0, 1, 1,
0.5096717, 0.6452425, 0.7991428, 0.09019608, 0, 1, 1,
0.5134286, 0.3794923, 2.483644, 0.09803922, 0, 1, 1,
0.5135453, -0.4286256, 2.241138, 0.1058824, 0, 1, 1,
0.5143493, 0.4482945, 1.892272, 0.1098039, 0, 1, 1,
0.5173508, 0.80997, 0.8654351, 0.1176471, 0, 1, 1,
0.5242628, 0.5272256, 1.20223, 0.1215686, 0, 1, 1,
0.5273752, 0.3136967, 1.614933, 0.1294118, 0, 1, 1,
0.5304194, -0.1069551, 0.7425662, 0.1333333, 0, 1, 1,
0.5319476, 0.4668193, 0.6579865, 0.1411765, 0, 1, 1,
0.5382633, -0.5188373, 1.471488, 0.145098, 0, 1, 1,
0.5399572, 0.5532717, -0.1474472, 0.1529412, 0, 1, 1,
0.5413463, -1.232313, 1.093898, 0.1568628, 0, 1, 1,
0.5480311, -2.297191, 2.19928, 0.1647059, 0, 1, 1,
0.5500332, 0.7835468, 0.6639662, 0.1686275, 0, 1, 1,
0.5512229, 0.5016888, 1.056882, 0.1764706, 0, 1, 1,
0.5541819, 1.148937, 0.404474, 0.1803922, 0, 1, 1,
0.5553341, -0.9505389, 4.314752, 0.1882353, 0, 1, 1,
0.5553718, 1.342381, 3.356997, 0.1921569, 0, 1, 1,
0.5571949, 1.822695, 0.9970701, 0.2, 0, 1, 1,
0.5590097, 1.269996, 0.7789325, 0.2078431, 0, 1, 1,
0.5591152, 0.2221492, 1.203967, 0.2117647, 0, 1, 1,
0.55966, -1.7818, 1.603035, 0.2196078, 0, 1, 1,
0.5622169, -0.9399866, 2.496754, 0.2235294, 0, 1, 1,
0.5657513, 0.1362744, 2.509945, 0.2313726, 0, 1, 1,
0.570554, -0.1583163, 2.958668, 0.2352941, 0, 1, 1,
0.5716324, -1.140595, 4.238266, 0.2431373, 0, 1, 1,
0.5732662, 0.4981289, 2.907402, 0.2470588, 0, 1, 1,
0.5741513, 0.07624676, 1.615514, 0.254902, 0, 1, 1,
0.5744461, -0.1905234, 0.9084015, 0.2588235, 0, 1, 1,
0.5768647, 0.6474384, -0.02281791, 0.2666667, 0, 1, 1,
0.5796105, -1.135588, 2.458944, 0.2705882, 0, 1, 1,
0.5892292, 0.4016226, 0.6869658, 0.2784314, 0, 1, 1,
0.5917879, 0.5406746, 0.1706445, 0.282353, 0, 1, 1,
0.5938344, 1.626992, -0.2320258, 0.2901961, 0, 1, 1,
0.593957, 0.9035054, -0.6580576, 0.2941177, 0, 1, 1,
0.6004948, -1.166775, 0.3530753, 0.3019608, 0, 1, 1,
0.6062748, -1.788856, 1.561712, 0.3098039, 0, 1, 1,
0.6084955, 2.541147, 1.049556, 0.3137255, 0, 1, 1,
0.6096868, -0.5293707, 2.356615, 0.3215686, 0, 1, 1,
0.6160595, 0.3362519, 0.7464997, 0.3254902, 0, 1, 1,
0.6226247, -1.792978, 2.751325, 0.3333333, 0, 1, 1,
0.626211, -1.264066, 3.153226, 0.3372549, 0, 1, 1,
0.6264635, -0.02210552, 3.673866, 0.345098, 0, 1, 1,
0.6270232, -1.262787, 3.142213, 0.3490196, 0, 1, 1,
0.6289417, 0.6118277, -1.019996, 0.3568628, 0, 1, 1,
0.6308435, 0.6393512, 2.026201, 0.3607843, 0, 1, 1,
0.6374699, 0.7851334, 1.217733, 0.3686275, 0, 1, 1,
0.6394182, 0.5249301, 0.3668769, 0.372549, 0, 1, 1,
0.6410229, -1.335332, 3.882541, 0.3803922, 0, 1, 1,
0.6420554, 0.6998781, 0.7456363, 0.3843137, 0, 1, 1,
0.6450823, -0.5997506, 2.625612, 0.3921569, 0, 1, 1,
0.6521892, -0.4147137, 2.671173, 0.3960784, 0, 1, 1,
0.652519, 0.3389434, 3.588567, 0.4039216, 0, 1, 1,
0.6542192, 0.404937, 0.9575052, 0.4117647, 0, 1, 1,
0.668694, 0.5855943, 0.6535461, 0.4156863, 0, 1, 1,
0.6694369, -0.9993926, 3.053882, 0.4235294, 0, 1, 1,
0.6701598, -1.067554, 2.436435, 0.427451, 0, 1, 1,
0.6726239, 0.3452007, 0.1102904, 0.4352941, 0, 1, 1,
0.6766943, 0.9721335, 1.164326, 0.4392157, 0, 1, 1,
0.6784477, 0.4652254, 1.577878, 0.4470588, 0, 1, 1,
0.6820787, -1.418031, 3.918427, 0.4509804, 0, 1, 1,
0.6838456, -0.02409913, 0.5300474, 0.4588235, 0, 1, 1,
0.683874, 0.02142714, 1.095778, 0.4627451, 0, 1, 1,
0.685661, -1.149459, 2.357874, 0.4705882, 0, 1, 1,
0.690456, -1.811446, 2.04731, 0.4745098, 0, 1, 1,
0.6944129, 0.6721764, 0.6012918, 0.4823529, 0, 1, 1,
0.6954384, -1.423105, 2.137631, 0.4862745, 0, 1, 1,
0.6966879, -0.7403369, 2.101317, 0.4941176, 0, 1, 1,
0.6991429, 2.063782, -2.602084, 0.5019608, 0, 1, 1,
0.7011373, -0.7509798, 3.796654, 0.5058824, 0, 1, 1,
0.7055998, -0.3435051, 0.1291351, 0.5137255, 0, 1, 1,
0.7089657, 0.8689102, 0.7662535, 0.5176471, 0, 1, 1,
0.7099885, 0.4375196, 1.072718, 0.5254902, 0, 1, 1,
0.7100909, 0.3091672, 1.815355, 0.5294118, 0, 1, 1,
0.7162313, 1.031664, 0.2118638, 0.5372549, 0, 1, 1,
0.7171584, -0.1081671, 1.042115, 0.5411765, 0, 1, 1,
0.7175385, -0.7541072, 1.454928, 0.5490196, 0, 1, 1,
0.7194074, 0.6717632, -0.7844213, 0.5529412, 0, 1, 1,
0.7225411, -0.5643629, 3.872936, 0.5607843, 0, 1, 1,
0.7285539, 0.6985433, 1.502964, 0.5647059, 0, 1, 1,
0.7328615, -1.478059, 2.720554, 0.572549, 0, 1, 1,
0.7342644, 1.1258, -0.6790289, 0.5764706, 0, 1, 1,
0.7366456, -1.056575, 3.925552, 0.5843138, 0, 1, 1,
0.7401865, -0.3397615, 3.585139, 0.5882353, 0, 1, 1,
0.7424072, -1.933063, 0.749881, 0.5960785, 0, 1, 1,
0.7440436, -0.6710855, 2.867996, 0.6039216, 0, 1, 1,
0.7498196, -0.604219, 1.140256, 0.6078432, 0, 1, 1,
0.7521268, 1.120358, 1.138634, 0.6156863, 0, 1, 1,
0.7766644, 0.6981773, -1.032001, 0.6196079, 0, 1, 1,
0.7768449, 1.366458, 0.5204382, 0.627451, 0, 1, 1,
0.7772721, 0.8734254, 0.8847774, 0.6313726, 0, 1, 1,
0.7780547, -0.1881184, 2.272125, 0.6392157, 0, 1, 1,
0.785453, 0.9576578, 0.6949888, 0.6431373, 0, 1, 1,
0.7873843, 0.8580438, -0.1533434, 0.6509804, 0, 1, 1,
0.7882872, -0.5834998, 2.339854, 0.654902, 0, 1, 1,
0.7942619, 0.8121083, 0.8046653, 0.6627451, 0, 1, 1,
0.7950797, 1.138417, 0.4967715, 0.6666667, 0, 1, 1,
0.7957749, -0.6594039, 2.146614, 0.6745098, 0, 1, 1,
0.7986562, 0.3186205, 2.628599, 0.6784314, 0, 1, 1,
0.8016941, 0.5899386, -1.107252, 0.6862745, 0, 1, 1,
0.8018335, -1.659594, 2.804757, 0.6901961, 0, 1, 1,
0.807935, 2.56366, 0.1745858, 0.6980392, 0, 1, 1,
0.8126048, -0.6244432, 2.620054, 0.7058824, 0, 1, 1,
0.819788, -0.5148287, 1.044031, 0.7098039, 0, 1, 1,
0.8229975, -1.836833, 1.525043, 0.7176471, 0, 1, 1,
0.8254896, -0.04703016, 3.092222, 0.7215686, 0, 1, 1,
0.8295757, 0.7450352, 1.610122, 0.7294118, 0, 1, 1,
0.8340321, 2.154973, -1.176057, 0.7333333, 0, 1, 1,
0.8367927, -0.338215, 0.8726698, 0.7411765, 0, 1, 1,
0.8376018, 1.660594, 0.1101257, 0.7450981, 0, 1, 1,
0.8378139, -1.353796, 2.946302, 0.7529412, 0, 1, 1,
0.8474424, 1.030167, 0.7404807, 0.7568628, 0, 1, 1,
0.8523508, -1.572433, 2.83703, 0.7647059, 0, 1, 1,
0.8538647, -0.6830222, 3.324791, 0.7686275, 0, 1, 1,
0.8542027, -0.9975563, 2.962232, 0.7764706, 0, 1, 1,
0.8669257, -2.788958, 4.652146, 0.7803922, 0, 1, 1,
0.872554, -0.527162, 2.32654, 0.7882353, 0, 1, 1,
0.8771827, 0.5498652, 1.165819, 0.7921569, 0, 1, 1,
0.8819342, 1.093276, 2.015635, 0.8, 0, 1, 1,
0.8825476, 0.0827932, 0.760881, 0.8078431, 0, 1, 1,
0.8848922, 0.3555026, 0.2826895, 0.8117647, 0, 1, 1,
0.8857723, 1.813018, 0.02450744, 0.8196079, 0, 1, 1,
0.8918052, 1.274493, 1.217487, 0.8235294, 0, 1, 1,
0.8954513, 1.174797, -0.4713401, 0.8313726, 0, 1, 1,
0.8974471, -0.5423908, 2.926716, 0.8352941, 0, 1, 1,
0.9008774, -0.4745666, 1.641657, 0.8431373, 0, 1, 1,
0.9070987, -0.2465656, 2.396779, 0.8470588, 0, 1, 1,
0.9074336, 0.9380525, 1.835904, 0.854902, 0, 1, 1,
0.9106736, 0.4012031, 0.6087357, 0.8588235, 0, 1, 1,
0.9193124, 0.8162723, 1.547403, 0.8666667, 0, 1, 1,
0.9197782, -1.265007, 3.645268, 0.8705882, 0, 1, 1,
0.9216962, -0.3536108, 3.098062, 0.8784314, 0, 1, 1,
0.9246067, 1.175432, 1.987084, 0.8823529, 0, 1, 1,
0.9249106, 0.4777488, 0.6801094, 0.8901961, 0, 1, 1,
0.9258341, 0.8731695, -0.728305, 0.8941177, 0, 1, 1,
0.9344249, -1.158542, 2.55919, 0.9019608, 0, 1, 1,
0.9352316, -1.02591, 1.555129, 0.9098039, 0, 1, 1,
0.9367304, -0.03267202, 0.01930597, 0.9137255, 0, 1, 1,
0.9390586, -1.516724, 1.824731, 0.9215686, 0, 1, 1,
0.9394568, -0.5705196, 0.9660515, 0.9254902, 0, 1, 1,
0.9397802, 1.713292, -1.454726, 0.9333333, 0, 1, 1,
0.9438997, -1.434687, 1.410929, 0.9372549, 0, 1, 1,
0.9469936, -0.7617466, 2.173174, 0.945098, 0, 1, 1,
0.9496375, 0.4237024, 3.316435, 0.9490196, 0, 1, 1,
0.9527846, 1.790905, -0.9719278, 0.9568627, 0, 1, 1,
0.9600555, 0.4931119, 2.83728, 0.9607843, 0, 1, 1,
0.9602295, 1.719821, -0.2461677, 0.9686275, 0, 1, 1,
0.9653152, -0.216662, 1.75576, 0.972549, 0, 1, 1,
0.975833, -1.798481, 3.187647, 0.9803922, 0, 1, 1,
0.9803227, -1.108587, 3.978258, 0.9843137, 0, 1, 1,
0.9825496, -1.290377, 2.067774, 0.9921569, 0, 1, 1,
0.9868597, 0.488316, 0.1320844, 0.9960784, 0, 1, 1,
0.9993843, -0.6019804, 3.593855, 1, 0, 0.9960784, 1,
1.007469, -1.372182, 3.022587, 1, 0, 0.9882353, 1,
1.013425, -0.3135506, 2.009346, 1, 0, 0.9843137, 1,
1.015556, -1.645727, 3.95936, 1, 0, 0.9764706, 1,
1.025403, 0.1065929, -0.05617866, 1, 0, 0.972549, 1,
1.029265, -0.777362, 2.753619, 1, 0, 0.9647059, 1,
1.034089, 0.3137489, 0.06253482, 1, 0, 0.9607843, 1,
1.035439, -0.02945819, 1.344931, 1, 0, 0.9529412, 1,
1.038593, 0.1396081, 1.946979, 1, 0, 0.9490196, 1,
1.049567, 0.9033074, 0.4977928, 1, 0, 0.9411765, 1,
1.050391, 1.191779, 0.8122728, 1, 0, 0.9372549, 1,
1.051415, 0.4773184, 0.7317019, 1, 0, 0.9294118, 1,
1.051667, 1.233947, 0.1287785, 1, 0, 0.9254902, 1,
1.057703, -1.099373, 3.534318, 1, 0, 0.9176471, 1,
1.062895, 0.2700218, 1.26749, 1, 0, 0.9137255, 1,
1.066232, -0.1634535, 2.201714, 1, 0, 0.9058824, 1,
1.066927, 0.3437433, 1.367895, 1, 0, 0.9019608, 1,
1.067676, -0.05160533, 1.819008, 1, 0, 0.8941177, 1,
1.078299, 0.8119478, 1.607971, 1, 0, 0.8862745, 1,
1.082248, 0.3244527, 0.9945608, 1, 0, 0.8823529, 1,
1.08249, -0.9161714, 2.632286, 1, 0, 0.8745098, 1,
1.085337, -0.6050878, 3.116527, 1, 0, 0.8705882, 1,
1.087057, 0.4902131, 1.75191, 1, 0, 0.8627451, 1,
1.088158, -0.3233944, 1.033215, 1, 0, 0.8588235, 1,
1.092419, -0.07867108, 2.083241, 1, 0, 0.8509804, 1,
1.095564, 1.763238, 0.9416175, 1, 0, 0.8470588, 1,
1.102449, 0.02595093, 0.2792886, 1, 0, 0.8392157, 1,
1.10366, -0.3049603, 1.187521, 1, 0, 0.8352941, 1,
1.106953, 0.7115453, 0.1185063, 1, 0, 0.827451, 1,
1.112595, 1.693696, 0.9322184, 1, 0, 0.8235294, 1,
1.11389, 0.832505, 0.9951933, 1, 0, 0.8156863, 1,
1.120644, 0.5836253, 0.9825109, 1, 0, 0.8117647, 1,
1.12724, 0.9308435, 1.68349, 1, 0, 0.8039216, 1,
1.13711, 1.142773, 0.9371077, 1, 0, 0.7960784, 1,
1.142321, -1.38573, 3.425364, 1, 0, 0.7921569, 1,
1.147019, 0.8067367, -0.1817923, 1, 0, 0.7843137, 1,
1.150018, 0.3240584, 1.046038, 1, 0, 0.7803922, 1,
1.16073, -0.05486642, 2.58052, 1, 0, 0.772549, 1,
1.161396, -0.2642441, 2.46144, 1, 0, 0.7686275, 1,
1.163163, -0.964316, 1.461917, 1, 0, 0.7607843, 1,
1.164158, 1.0468, 0.7374304, 1, 0, 0.7568628, 1,
1.165207, 2.043636, 1.977105, 1, 0, 0.7490196, 1,
1.165899, -0.6496726, 1.135302, 1, 0, 0.7450981, 1,
1.16759, 0.3513285, 1.57434, 1, 0, 0.7372549, 1,
1.174391, 0.5236192, -0.0323211, 1, 0, 0.7333333, 1,
1.181026, -0.1360274, -0.3390871, 1, 0, 0.7254902, 1,
1.189426, -0.8345479, 2.86562, 1, 0, 0.7215686, 1,
1.214806, 1.058852, 0.1506428, 1, 0, 0.7137255, 1,
1.217121, -0.2358834, 1.610556, 1, 0, 0.7098039, 1,
1.221814, -0.902101, 4.379238, 1, 0, 0.7019608, 1,
1.24401, -1.516204, 3.280074, 1, 0, 0.6941177, 1,
1.245823, 1.60399, 0.3168067, 1, 0, 0.6901961, 1,
1.24728, -0.76285, 3.683336, 1, 0, 0.682353, 1,
1.254551, -0.9908947, 0.2921069, 1, 0, 0.6784314, 1,
1.27159, 0.4918542, 1.873977, 1, 0, 0.6705883, 1,
1.282168, 0.3885612, 1.646984, 1, 0, 0.6666667, 1,
1.287069, 0.8295264, 0.4929632, 1, 0, 0.6588235, 1,
1.287706, 1.266658, -0.1843893, 1, 0, 0.654902, 1,
1.289795, 0.444625, 1.306475, 1, 0, 0.6470588, 1,
1.293126, -1.953074, 2.577862, 1, 0, 0.6431373, 1,
1.296948, 1.448801, 0.7183284, 1, 0, 0.6352941, 1,
1.307383, 0.5570383, 0.877229, 1, 0, 0.6313726, 1,
1.314396, 1.001619, -0.6710834, 1, 0, 0.6235294, 1,
1.319243, -1.598797, 3.47795, 1, 0, 0.6196079, 1,
1.323626, 0.2252432, 0.6000344, 1, 0, 0.6117647, 1,
1.325486, -0.8959781, 2.122133, 1, 0, 0.6078432, 1,
1.327828, 0.03515332, 1.93675, 1, 0, 0.6, 1,
1.333445, -0.3435865, 1.445631, 1, 0, 0.5921569, 1,
1.340865, 0.4325766, 1.152522, 1, 0, 0.5882353, 1,
1.352675, 0.7317634, 2.29165, 1, 0, 0.5803922, 1,
1.352891, 1.717656, 1.565519, 1, 0, 0.5764706, 1,
1.352959, 0.1663948, 1.936696, 1, 0, 0.5686275, 1,
1.353308, 0.818796, 2.103544, 1, 0, 0.5647059, 1,
1.355147, 1.772195, 1.507275, 1, 0, 0.5568628, 1,
1.356107, -0.8569429, 2.163884, 1, 0, 0.5529412, 1,
1.359132, -0.4329168, 1.777085, 1, 0, 0.5450981, 1,
1.364322, 0.5390908, 0.7551911, 1, 0, 0.5411765, 1,
1.369669, -0.221362, 2.609024, 1, 0, 0.5333334, 1,
1.377676, 0.8395119, 1.786491, 1, 0, 0.5294118, 1,
1.379229, -0.2217738, 2.325068, 1, 0, 0.5215687, 1,
1.411865, 0.1133231, 0.1091026, 1, 0, 0.5176471, 1,
1.416686, -0.5195872, 0.6467422, 1, 0, 0.509804, 1,
1.43293, 1.643854, 1.686056, 1, 0, 0.5058824, 1,
1.441432, -0.9088005, 2.27822, 1, 0, 0.4980392, 1,
1.443382, -0.3890963, 3.09907, 1, 0, 0.4901961, 1,
1.451897, -0.7728951, 3.638705, 1, 0, 0.4862745, 1,
1.454819, 0.9349424, -0.4146302, 1, 0, 0.4784314, 1,
1.456282, -0.9416775, 2.928209, 1, 0, 0.4745098, 1,
1.467275, -1.101101, 1.258534, 1, 0, 0.4666667, 1,
1.485294, 0.5441625, 1.700311, 1, 0, 0.4627451, 1,
1.48538, 0.7009966, 1.757228, 1, 0, 0.454902, 1,
1.490965, -0.09690505, -0.01770912, 1, 0, 0.4509804, 1,
1.492732, 0.3387847, 0.06065794, 1, 0, 0.4431373, 1,
1.493139, -0.7656591, 1.76157, 1, 0, 0.4392157, 1,
1.494917, 0.03548059, 1.346368, 1, 0, 0.4313726, 1,
1.49519, -0.7937092, 2.834441, 1, 0, 0.427451, 1,
1.542083, -1.276282, 1.689304, 1, 0, 0.4196078, 1,
1.556762, -1.578509, 0.6789032, 1, 0, 0.4156863, 1,
1.561097, -0.0007135764, 1.648647, 1, 0, 0.4078431, 1,
1.57568, -0.879087, 2.956535, 1, 0, 0.4039216, 1,
1.587079, -0.9623752, 0.7066258, 1, 0, 0.3960784, 1,
1.592567, 1.336687, 1.411196, 1, 0, 0.3882353, 1,
1.592849, -0.4155611, 2.605243, 1, 0, 0.3843137, 1,
1.600429, -0.8344063, 3.258319, 1, 0, 0.3764706, 1,
1.608717, 0.7309036, 0.4562814, 1, 0, 0.372549, 1,
1.617347, 0.5876331, 0.9496306, 1, 0, 0.3647059, 1,
1.620532, -0.9630008, 1.899698, 1, 0, 0.3607843, 1,
1.627444, -0.02398235, 2.13273, 1, 0, 0.3529412, 1,
1.630387, -1.277601, 1.572511, 1, 0, 0.3490196, 1,
1.643775, -0.794988, 0.9219213, 1, 0, 0.3411765, 1,
1.669058, 0.4314425, 1.199553, 1, 0, 0.3372549, 1,
1.670827, 0.2843327, 1.318477, 1, 0, 0.3294118, 1,
1.673748, -2.250804, 3.192999, 1, 0, 0.3254902, 1,
1.675087, 1.162826, 1.407738, 1, 0, 0.3176471, 1,
1.677138, -1.674934, 2.441733, 1, 0, 0.3137255, 1,
1.679447, 0.2475931, 2.732527, 1, 0, 0.3058824, 1,
1.681074, 0.1604364, 1.953265, 1, 0, 0.2980392, 1,
1.68255, 3.334064, 0.3345347, 1, 0, 0.2941177, 1,
1.687704, 0.6580942, 2.674589, 1, 0, 0.2862745, 1,
1.689129, 0.07384017, 2.157821, 1, 0, 0.282353, 1,
1.694069, -1.031054, 2.067568, 1, 0, 0.2745098, 1,
1.694489, 0.7449776, 1.386747, 1, 0, 0.2705882, 1,
1.722829, 0.9522239, 1.759901, 1, 0, 0.2627451, 1,
1.734244, 0.5583409, 1.533891, 1, 0, 0.2588235, 1,
1.740311, 0.8554516, 1.129388, 1, 0, 0.2509804, 1,
1.743695, -0.08701302, 0.2075444, 1, 0, 0.2470588, 1,
1.762626, -0.5326391, 0.2879196, 1, 0, 0.2392157, 1,
1.786677, -0.2449456, 3.033998, 1, 0, 0.2352941, 1,
1.81831, -0.9837976, 3.350547, 1, 0, 0.227451, 1,
1.821871, 0.712288, 0.3589222, 1, 0, 0.2235294, 1,
1.834257, 1.602311, 1.416435, 1, 0, 0.2156863, 1,
1.840646, 0.4800813, -1.269851, 1, 0, 0.2117647, 1,
1.84877, 0.3182257, 1.553493, 1, 0, 0.2039216, 1,
1.863484, -1.895609, 3.141061, 1, 0, 0.1960784, 1,
1.904154, 0.4444229, 1.931472, 1, 0, 0.1921569, 1,
1.939823, 1.387905, 0.5748264, 1, 0, 0.1843137, 1,
2.022809, -0.1666304, 1.57225, 1, 0, 0.1803922, 1,
2.023781, 0.338158, 3.281566, 1, 0, 0.172549, 1,
2.028209, -1.530693, 3.019732, 1, 0, 0.1686275, 1,
2.074628, -0.2849208, 2.730397, 1, 0, 0.1607843, 1,
2.075207, -1.082111, 2.20974, 1, 0, 0.1568628, 1,
2.079629, -0.3104458, 2.833626, 1, 0, 0.1490196, 1,
2.081866, 1.423785, 0.2352356, 1, 0, 0.145098, 1,
2.09894, 0.2367349, 0.6201099, 1, 0, 0.1372549, 1,
2.103682, -0.4962434, 1.910263, 1, 0, 0.1333333, 1,
2.11798, 1.879696, 1.738103, 1, 0, 0.1254902, 1,
2.149529, -0.8779171, 2.067574, 1, 0, 0.1215686, 1,
2.168695, -0.3919795, 1.360724, 1, 0, 0.1137255, 1,
2.194363, 0.1265288, -0.153349, 1, 0, 0.1098039, 1,
2.2643, -0.5589158, 1.229833, 1, 0, 0.1019608, 1,
2.267998, -1.390991, 3.120297, 1, 0, 0.09411765, 1,
2.296018, -0.8851912, 3.526715, 1, 0, 0.09019608, 1,
2.349593, 2.326517, 1.262541, 1, 0, 0.08235294, 1,
2.357139, 0.6704891, -0.1503814, 1, 0, 0.07843138, 1,
2.400534, -0.568448, 1.0428, 1, 0, 0.07058824, 1,
2.42248, 1.328769, 1.679929, 1, 0, 0.06666667, 1,
2.443421, -0.02684032, 0.1870337, 1, 0, 0.05882353, 1,
2.467601, 0.002497094, 2.855871, 1, 0, 0.05490196, 1,
2.480625, -0.8779684, 2.101806, 1, 0, 0.04705882, 1,
2.605813, 1.548247, 0.08748601, 1, 0, 0.04313726, 1,
2.662036, 0.4203238, 0.5450794, 1, 0, 0.03529412, 1,
2.707636, 0.301648, 3.08852, 1, 0, 0.03137255, 1,
2.730278, -0.6992587, 0.8705501, 1, 0, 0.02352941, 1,
3.0834, 0.2990066, 1.854165, 1, 0, 0.01960784, 1,
3.164063, -0.0669242, 2.772426, 1, 0, 0.01176471, 1,
3.283573, -0.8714309, 2.860611, 1, 0, 0.007843138, 1
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
-0.003933191, -4.014158, -7.51332, 0, -0.5, 0.5, 0.5,
-0.003933191, -4.014158, -7.51332, 1, -0.5, 0.5, 0.5,
-0.003933191, -4.014158, -7.51332, 1, 1.5, 0.5, 0.5,
-0.003933191, -4.014158, -7.51332, 0, 1.5, 0.5, 0.5
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
-4.405903, 0.1924553, -7.51332, 0, -0.5, 0.5, 0.5,
-4.405903, 0.1924553, -7.51332, 1, -0.5, 0.5, 0.5,
-4.405903, 0.1924553, -7.51332, 1, 1.5, 0.5, 0.5,
-4.405903, 0.1924553, -7.51332, 0, 1.5, 0.5, 0.5
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
-4.405903, -4.014158, -0.5489938, 0, -0.5, 0.5, 0.5,
-4.405903, -4.014158, -0.5489938, 1, -0.5, 0.5, 0.5,
-4.405903, -4.014158, -0.5489938, 1, 1.5, 0.5, 0.5,
-4.405903, -4.014158, -0.5489938, 0, 1.5, 0.5, 0.5
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
-3, -3.043401, -5.906168,
3, -3.043401, -5.906168,
-3, -3.043401, -5.906168,
-3, -3.205194, -6.174027,
-2, -3.043401, -5.906168,
-2, -3.205194, -6.174027,
-1, -3.043401, -5.906168,
-1, -3.205194, -6.174027,
0, -3.043401, -5.906168,
0, -3.205194, -6.174027,
1, -3.043401, -5.906168,
1, -3.205194, -6.174027,
2, -3.043401, -5.906168,
2, -3.205194, -6.174027,
3, -3.043401, -5.906168,
3, -3.205194, -6.174027
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
-3, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
-3, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
-3, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
-3, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
-2, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
-2, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
-2, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
-2, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
-1, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
-1, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
-1, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
-1, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
0, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
0, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
0, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
0, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
1, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
1, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
1, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
1, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
2, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
2, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
2, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
2, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5,
3, -3.52878, -6.709744, 0, -0.5, 0.5, 0.5,
3, -3.52878, -6.709744, 1, -0.5, 0.5, 0.5,
3, -3.52878, -6.709744, 1, 1.5, 0.5, 0.5,
3, -3.52878, -6.709744, 0, 1.5, 0.5, 0.5
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
-3.390064, -2, -5.906168,
-3.390064, 3, -5.906168,
-3.390064, -2, -5.906168,
-3.559371, -2, -6.174027,
-3.390064, -1, -5.906168,
-3.559371, -1, -6.174027,
-3.390064, 0, -5.906168,
-3.559371, 0, -6.174027,
-3.390064, 1, -5.906168,
-3.559371, 1, -6.174027,
-3.390064, 2, -5.906168,
-3.559371, 2, -6.174027,
-3.390064, 3, -5.906168,
-3.559371, 3, -6.174027
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
-3.897984, -2, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, -2, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, -2, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, -2, -6.709744, 0, 1.5, 0.5, 0.5,
-3.897984, -1, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, -1, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, -1, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, -1, -6.709744, 0, 1.5, 0.5, 0.5,
-3.897984, 0, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, 0, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, 0, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, 0, -6.709744, 0, 1.5, 0.5, 0.5,
-3.897984, 1, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, 1, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, 1, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, 1, -6.709744, 0, 1.5, 0.5, 0.5,
-3.897984, 2, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, 2, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, 2, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, 2, -6.709744, 0, 1.5, 0.5, 0.5,
-3.897984, 3, -6.709744, 0, -0.5, 0.5, 0.5,
-3.897984, 3, -6.709744, 1, -0.5, 0.5, 0.5,
-3.897984, 3, -6.709744, 1, 1.5, 0.5, 0.5,
-3.897984, 3, -6.709744, 0, 1.5, 0.5, 0.5
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
-3.390064, -3.043401, -4,
-3.390064, -3.043401, 4,
-3.390064, -3.043401, -4,
-3.559371, -3.205194, -4,
-3.390064, -3.043401, -2,
-3.559371, -3.205194, -2,
-3.390064, -3.043401, 0,
-3.559371, -3.205194, 0,
-3.390064, -3.043401, 2,
-3.559371, -3.205194, 2,
-3.390064, -3.043401, 4,
-3.559371, -3.205194, 4
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
-3.897984, -3.52878, -4, 0, -0.5, 0.5, 0.5,
-3.897984, -3.52878, -4, 1, -0.5, 0.5, 0.5,
-3.897984, -3.52878, -4, 1, 1.5, 0.5, 0.5,
-3.897984, -3.52878, -4, 0, 1.5, 0.5, 0.5,
-3.897984, -3.52878, -2, 0, -0.5, 0.5, 0.5,
-3.897984, -3.52878, -2, 1, -0.5, 0.5, 0.5,
-3.897984, -3.52878, -2, 1, 1.5, 0.5, 0.5,
-3.897984, -3.52878, -2, 0, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 0, 0, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 0, 1, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 0, 1, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 0, 0, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 2, 0, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 2, 1, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 2, 1, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 2, 0, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 4, 0, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 4, 1, -0.5, 0.5, 0.5,
-3.897984, -3.52878, 4, 1, 1.5, 0.5, 0.5,
-3.897984, -3.52878, 4, 0, 1.5, 0.5, 0.5
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
-3.390064, -3.043401, -5.906168,
-3.390064, 3.428312, -5.906168,
-3.390064, -3.043401, 4.80818,
-3.390064, 3.428312, 4.80818,
-3.390064, -3.043401, -5.906168,
-3.390064, -3.043401, 4.80818,
-3.390064, 3.428312, -5.906168,
-3.390064, 3.428312, 4.80818,
-3.390064, -3.043401, -5.906168,
3.382198, -3.043401, -5.906168,
-3.390064, -3.043401, 4.80818,
3.382198, -3.043401, 4.80818,
-3.390064, 3.428312, -5.906168,
3.382198, 3.428312, -5.906168,
-3.390064, 3.428312, 4.80818,
3.382198, 3.428312, 4.80818,
3.382198, -3.043401, -5.906168,
3.382198, 3.428312, -5.906168,
3.382198, -3.043401, 4.80818,
3.382198, 3.428312, 4.80818,
3.382198, -3.043401, -5.906168,
3.382198, -3.043401, 4.80818,
3.382198, 3.428312, -5.906168,
3.382198, 3.428312, 4.80818
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
var radius = 7.5995;
var distance = 33.81104;
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
mvMatrix.translate( 0.003933191, -0.1924553, 0.5489938 );
mvMatrix.scale( 1.213292, 1.269637, 0.7668902 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81104);
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
sulfide_4-chlorophen<-read.table("sulfide_4-chlorophen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfide_4-chlorophen$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
```

```r
y<-sulfide_4-chlorophen$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
```

```r
z<-sulfide_4-chlorophen$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
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
-3.291439, -1.164337, -2.066809, 0, 0, 1, 1, 1,
-3.164171, 2.218989, -0.06026223, 1, 0, 0, 1, 1,
-2.977227, 0.4727506, -1.779593, 1, 0, 0, 1, 1,
-2.852824, -0.2098055, -1.323848, 1, 0, 0, 1, 1,
-2.689217, -0.4510833, -2.638279, 1, 0, 0, 1, 1,
-2.675793, -0.5757545, -0.7740451, 1, 0, 0, 1, 1,
-2.629035, -1.727379, -2.477342, 0, 0, 0, 1, 1,
-2.591488, 0.840631, -1.46204, 0, 0, 0, 1, 1,
-2.446172, -0.5997308, 0.4968343, 0, 0, 0, 1, 1,
-2.358444, -1.0724, -2.796987, 0, 0, 0, 1, 1,
-2.304125, 2.12854, -0.006184039, 0, 0, 0, 1, 1,
-2.265965, 0.1369165, -2.904753, 0, 0, 0, 1, 1,
-2.228474, -0.4942172, -0.5235591, 0, 0, 0, 1, 1,
-2.227942, 0.7155456, -2.67474, 1, 1, 1, 1, 1,
-2.199456, 0.4252077, -0.6171954, 1, 1, 1, 1, 1,
-2.18145, 0.07100815, -0.7791206, 1, 1, 1, 1, 1,
-2.169213, 1.212048, -1.621871, 1, 1, 1, 1, 1,
-2.055013, 0.8262861, -0.7970051, 1, 1, 1, 1, 1,
-2.029902, -0.9463693, -1.654665, 1, 1, 1, 1, 1,
-1.963097, -1.944203, -2.350494, 1, 1, 1, 1, 1,
-1.956688, -0.4218115, -1.64426, 1, 1, 1, 1, 1,
-1.943766, 0.2948846, -1.789433, 1, 1, 1, 1, 1,
-1.940461, 0.0197307, -1.51797, 1, 1, 1, 1, 1,
-1.923217, -1.290143, -3.690955, 1, 1, 1, 1, 1,
-1.910987, -1.675685, -3.551991, 1, 1, 1, 1, 1,
-1.910134, -0.8297127, -3.278716, 1, 1, 1, 1, 1,
-1.901771, 0.9774569, -1.626257, 1, 1, 1, 1, 1,
-1.884022, 1.807924, 0.3496277, 1, 1, 1, 1, 1,
-1.859636, -1.651343, -0.961953, 0, 0, 1, 1, 1,
-1.816654, 1.343763, -0.9690993, 1, 0, 0, 1, 1,
-1.8131, 1.092787, -2.735571, 1, 0, 0, 1, 1,
-1.801984, 0.1318922, -1.293808, 1, 0, 0, 1, 1,
-1.785689, 0.1371842, -0.4646258, 1, 0, 0, 1, 1,
-1.767858, 1.319152, -1.327959, 1, 0, 0, 1, 1,
-1.753683, -1.086165, -1.631431, 0, 0, 0, 1, 1,
-1.746809, 2.120125, 0.6445194, 0, 0, 0, 1, 1,
-1.734228, 0.4246237, -0.6606688, 0, 0, 0, 1, 1,
-1.726446, 0.7767663, -2.624233, 0, 0, 0, 1, 1,
-1.714925, 1.684733, -1.840535, 0, 0, 0, 1, 1,
-1.709404, 0.04949155, -1.056652, 0, 0, 0, 1, 1,
-1.704644, 1.422909, -0.3626449, 0, 0, 0, 1, 1,
-1.685657, 1.121761, -1.453155, 1, 1, 1, 1, 1,
-1.672989, -0.3703569, -0.8773431, 1, 1, 1, 1, 1,
-1.663754, 0.735593, -1.558972, 1, 1, 1, 1, 1,
-1.662814, 1.125721, -0.5437459, 1, 1, 1, 1, 1,
-1.654641, 0.6813043, -0.8110798, 1, 1, 1, 1, 1,
-1.626399, -0.90501, -1.079092, 1, 1, 1, 1, 1,
-1.623324, -2.949153, -0.6407574, 1, 1, 1, 1, 1,
-1.612878, 0.2787624, -0.3071207, 1, 1, 1, 1, 1,
-1.597646, 0.02797354, -1.452638, 1, 1, 1, 1, 1,
-1.590181, -1.044913, -1.980522, 1, 1, 1, 1, 1,
-1.582866, -0.3479002, -3.317887, 1, 1, 1, 1, 1,
-1.575016, 0.1706748, -0.5209162, 1, 1, 1, 1, 1,
-1.573927, -1.540212, -2.366615, 1, 1, 1, 1, 1,
-1.570976, -0.1195036, -0.8298202, 1, 1, 1, 1, 1,
-1.568693, 0.8016094, -0.6642972, 1, 1, 1, 1, 1,
-1.564828, -1.170564, -2.369845, 0, 0, 1, 1, 1,
-1.564422, 1.157108, -1.238924, 1, 0, 0, 1, 1,
-1.563396, 1.267122, -1.193795, 1, 0, 0, 1, 1,
-1.561814, 0.1950035, -2.029754, 1, 0, 0, 1, 1,
-1.547088, -0.3759202, -2.222456, 1, 0, 0, 1, 1,
-1.537914, -0.25493, -2.785535, 1, 0, 0, 1, 1,
-1.530183, -0.3889631, -2.676046, 0, 0, 0, 1, 1,
-1.522831, -1.261078, -1.318285, 0, 0, 0, 1, 1,
-1.52146, 1.244691, -0.8700718, 0, 0, 0, 1, 1,
-1.518268, -0.2957947, -2.475933, 0, 0, 0, 1, 1,
-1.503753, -0.5656445, -0.6755025, 0, 0, 0, 1, 1,
-1.501842, 0.2534523, -0.7902632, 0, 0, 0, 1, 1,
-1.496861, -1.212941, -3.560554, 0, 0, 0, 1, 1,
-1.487156, 0.4858733, -1.128281, 1, 1, 1, 1, 1,
-1.484964, 0.9078792, -0.9160045, 1, 1, 1, 1, 1,
-1.471296, -0.03244015, -2.305999, 1, 1, 1, 1, 1,
-1.469309, 0.2031793, -0.3234929, 1, 1, 1, 1, 1,
-1.45925, 0.6489316, -0.1636002, 1, 1, 1, 1, 1,
-1.436776, 0.8498074, -0.5697379, 1, 1, 1, 1, 1,
-1.433677, -0.001495938, -0.618569, 1, 1, 1, 1, 1,
-1.425081, 0.543884, -0.5777276, 1, 1, 1, 1, 1,
-1.41814, 0.382894, -0.3388654, 1, 1, 1, 1, 1,
-1.409811, -0.7940783, -2.642498, 1, 1, 1, 1, 1,
-1.408273, 0.872281, -0.7090408, 1, 1, 1, 1, 1,
-1.400367, 2.050807, -0.7707015, 1, 1, 1, 1, 1,
-1.392937, -0.696834, -1.158265, 1, 1, 1, 1, 1,
-1.390668, 1.509157, -1.070522, 1, 1, 1, 1, 1,
-1.383086, -0.1140673, -2.486405, 1, 1, 1, 1, 1,
-1.378698, -0.3598471, -0.7530395, 0, 0, 1, 1, 1,
-1.366137, 0.0988126, -3.034488, 1, 0, 0, 1, 1,
-1.364283, 0.6880003, -2.776433, 1, 0, 0, 1, 1,
-1.358018, -0.4567333, -0.4669464, 1, 0, 0, 1, 1,
-1.35672, -2.213275, -4.698796, 1, 0, 0, 1, 1,
-1.345913, -0.04231937, -2.856616, 1, 0, 0, 1, 1,
-1.342863, -0.8787971, -2.088405, 0, 0, 0, 1, 1,
-1.328117, 0.06275205, -1.37419, 0, 0, 0, 1, 1,
-1.320979, -1.405487, -3.349857, 0, 0, 0, 1, 1,
-1.320105, 0.7011715, -1.970437, 0, 0, 0, 1, 1,
-1.317194, 0.7690564, 0.5303366, 0, 0, 0, 1, 1,
-1.312518, 0.4242562, -1.391826, 0, 0, 0, 1, 1,
-1.304447, -0.4434071, -1.825404, 0, 0, 0, 1, 1,
-1.291465, 1.35753, -1.226297, 1, 1, 1, 1, 1,
-1.291459, 0.4947328, -1.322419, 1, 1, 1, 1, 1,
-1.266434, -1.006197, -1.595788, 1, 1, 1, 1, 1,
-1.265007, 0.2316119, -0.9449319, 1, 1, 1, 1, 1,
-1.262023, -0.9301975, -2.412041, 1, 1, 1, 1, 1,
-1.249442, 1.394322, -0.119171, 1, 1, 1, 1, 1,
-1.244752, -2.096677, -2.463119, 1, 1, 1, 1, 1,
-1.243697, 1.190693, -0.5183682, 1, 1, 1, 1, 1,
-1.242291, -0.3231145, -0.8570545, 1, 1, 1, 1, 1,
-1.234943, -0.6252738, -2.803271, 1, 1, 1, 1, 1,
-1.232727, -1.293813, -2.158307, 1, 1, 1, 1, 1,
-1.217978, 1.830292, -0.9753436, 1, 1, 1, 1, 1,
-1.214529, -1.097911, -2.167721, 1, 1, 1, 1, 1,
-1.210754, -0.9437277, -1.564641, 1, 1, 1, 1, 1,
-1.209233, 0.185654, -1.562014, 1, 1, 1, 1, 1,
-1.20662, -0.6585327, -1.48884, 0, 0, 1, 1, 1,
-1.200537, -0.5384837, 0.3648025, 1, 0, 0, 1, 1,
-1.199352, 1.242134, -0.1522869, 1, 0, 0, 1, 1,
-1.19516, 1.324042, 0.7911212, 1, 0, 0, 1, 1,
-1.194173, 0.04223332, -2.060243, 1, 0, 0, 1, 1,
-1.189001, -0.5823221, -2.913327, 1, 0, 0, 1, 1,
-1.182535, -0.06857163, -1.382461, 0, 0, 0, 1, 1,
-1.181945, -0.3726552, -2.33235, 0, 0, 0, 1, 1,
-1.179271, 0.3327989, -1.997404, 0, 0, 0, 1, 1,
-1.174175, 0.872159, -0.6223198, 0, 0, 0, 1, 1,
-1.165856, 1.172105, -0.1580541, 0, 0, 0, 1, 1,
-1.163628, 0.5876639, -0.3137985, 0, 0, 0, 1, 1,
-1.162398, 0.6086541, 1.074494, 0, 0, 0, 1, 1,
-1.157835, -2.111678, -1.79252, 1, 1, 1, 1, 1,
-1.157689, 0.1753101, -2.123127, 1, 1, 1, 1, 1,
-1.153554, 0.7129874, -2.223794, 1, 1, 1, 1, 1,
-1.149848, -0.3670663, -1.477696, 1, 1, 1, 1, 1,
-1.146162, 0.4732769, -0.2935053, 1, 1, 1, 1, 1,
-1.114666, -1.535362, -2.570683, 1, 1, 1, 1, 1,
-1.11145, 1.154387, 0.5065202, 1, 1, 1, 1, 1,
-1.106111, 0.4763951, -1.272215, 1, 1, 1, 1, 1,
-1.102301, 2.198971, -1.219837, 1, 1, 1, 1, 1,
-1.100777, 1.206112, -1.280134, 1, 1, 1, 1, 1,
-1.097737, 0.8997704, -0.9007331, 1, 1, 1, 1, 1,
-1.097526, -1.138395, -0.4668176, 1, 1, 1, 1, 1,
-1.096247, -0.9463575, -1.642826, 1, 1, 1, 1, 1,
-1.093249, -0.4770485, -1.879347, 1, 1, 1, 1, 1,
-1.085739, 0.1672668, -0.4426433, 1, 1, 1, 1, 1,
-1.074274, -0.6007605, -1.76593, 0, 0, 1, 1, 1,
-1.073229, 1.810542, -2.41259, 1, 0, 0, 1, 1,
-1.072086, -1.483742, -2.33819, 1, 0, 0, 1, 1,
-1.05788, -0.2746198, -1.85385, 1, 0, 0, 1, 1,
-1.057406, 0.1583927, -1.176066, 1, 0, 0, 1, 1,
-1.043174, -0.4585349, -2.39115, 1, 0, 0, 1, 1,
-1.021603, 0.2952966, -3.328163, 0, 0, 0, 1, 1,
-1.015651, -1.331658, -2.546389, 0, 0, 0, 1, 1,
-1.007187, -0.7677132, -1.803486, 0, 0, 0, 1, 1,
-1.001764, -1.294907, -2.752033, 0, 0, 0, 1, 1,
-0.9995071, 0.2214697, -0.9153135, 0, 0, 0, 1, 1,
-0.9962431, -1.123228, -2.670068, 0, 0, 0, 1, 1,
-0.9936942, 1.090912, 1.421214, 0, 0, 0, 1, 1,
-0.9927511, -0.4425556, -2.865621, 1, 1, 1, 1, 1,
-0.9915378, 0.7200602, -1.399781, 1, 1, 1, 1, 1,
-0.989531, 2.13382, 0.8823922, 1, 1, 1, 1, 1,
-0.9880054, 0.8595604, -1.567975, 1, 1, 1, 1, 1,
-0.9862915, 0.4020357, -1.844071, 1, 1, 1, 1, 1,
-0.9861015, -0.6312997, -1.27734, 1, 1, 1, 1, 1,
-0.9837397, -0.5578617, -2.726868, 1, 1, 1, 1, 1,
-0.9804689, -0.740339, -1.959925, 1, 1, 1, 1, 1,
-0.9788221, 0.4592404, -1.700612, 1, 1, 1, 1, 1,
-0.9765905, -1.251093, -3.940897, 1, 1, 1, 1, 1,
-0.9758176, 0.07833458, -3.201073, 1, 1, 1, 1, 1,
-0.9672475, 3.257098, 0.5399647, 1, 1, 1, 1, 1,
-0.9638619, 1.570212, -0.02424092, 1, 1, 1, 1, 1,
-0.9548053, 0.4371729, 0.0630794, 1, 1, 1, 1, 1,
-0.953029, -0.2907772, -2.22515, 1, 1, 1, 1, 1,
-0.9495571, -0.209784, -1.809181, 0, 0, 1, 1, 1,
-0.946622, 0.4948944, -1.293722, 1, 0, 0, 1, 1,
-0.9350257, 0.6473953, -0.8615158, 1, 0, 0, 1, 1,
-0.9304833, -0.3946624, -3.607946, 1, 0, 0, 1, 1,
-0.9261416, 0.1517896, -1.987656, 1, 0, 0, 1, 1,
-0.9250598, 1.2634, -1.842797, 1, 0, 0, 1, 1,
-0.9193832, 1.265843, -1.243065, 0, 0, 0, 1, 1,
-0.9142202, -0.4732105, -1.692677, 0, 0, 0, 1, 1,
-0.9138572, 0.7441119, -0.5974789, 0, 0, 0, 1, 1,
-0.9087141, 0.9209326, -0.6798306, 0, 0, 0, 1, 1,
-0.9081543, 0.3529688, -0.3628426, 0, 0, 0, 1, 1,
-0.9069421, -1.405182, -2.658589, 0, 0, 0, 1, 1,
-0.9028918, -0.4084685, -3.273155, 0, 0, 0, 1, 1,
-0.9007875, 0.000123164, -1.205407, 1, 1, 1, 1, 1,
-0.8968185, -1.638871, -2.743925, 1, 1, 1, 1, 1,
-0.8923763, -1.316504, -1.806131, 1, 1, 1, 1, 1,
-0.8913622, -0.9514097, -2.513948, 1, 1, 1, 1, 1,
-0.880537, -0.5395461, -0.6854598, 1, 1, 1, 1, 1,
-0.8710145, -2.065627, -0.9264781, 1, 1, 1, 1, 1,
-0.8702375, 1.117844, -1.939616, 1, 1, 1, 1, 1,
-0.8619289, -0.8535628, -2.562732, 1, 1, 1, 1, 1,
-0.8598419, -0.5727857, -2.909855, 1, 1, 1, 1, 1,
-0.8553482, -0.1601064, -1.749443, 1, 1, 1, 1, 1,
-0.8546596, 0.3641266, -2.363461, 1, 1, 1, 1, 1,
-0.8471542, -1.741192, -2.310484, 1, 1, 1, 1, 1,
-0.8467579, -1.690801, -3.121621, 1, 1, 1, 1, 1,
-0.8460719, 0.4944261, 1.428281, 1, 1, 1, 1, 1,
-0.8417304, 0.3348214, -2.325148, 1, 1, 1, 1, 1,
-0.8390154, -0.4932861, -3.904617, 0, 0, 1, 1, 1,
-0.8195375, -0.8891846, -5.750134, 1, 0, 0, 1, 1,
-0.8194701, -0.2784977, -2.687794, 1, 0, 0, 1, 1,
-0.8184757, 0.1714541, -0.7885568, 1, 0, 0, 1, 1,
-0.8184144, -0.5320216, -1.91143, 1, 0, 0, 1, 1,
-0.8153788, -0.6230764, -1.869346, 1, 0, 0, 1, 1,
-0.8135937, 0.105327, -0.5015966, 0, 0, 0, 1, 1,
-0.8122377, -0.8747337, -1.109011, 0, 0, 0, 1, 1,
-0.8034275, 0.4574973, -0.4648854, 0, 0, 0, 1, 1,
-0.7972798, 0.2314998, -1.988765, 0, 0, 0, 1, 1,
-0.7961989, -0.1605998, -0.9758617, 0, 0, 0, 1, 1,
-0.7883251, 1.013484, -0.9641796, 0, 0, 0, 1, 1,
-0.7878654, 0.3932853, -1.332691, 0, 0, 0, 1, 1,
-0.7788382, 1.438072, 0.8092346, 1, 1, 1, 1, 1,
-0.7727337, -0.7979316, -2.906647, 1, 1, 1, 1, 1,
-0.7720358, -0.9957206, -3.034275, 1, 1, 1, 1, 1,
-0.769052, 0.2802208, -1.859083, 1, 1, 1, 1, 1,
-0.7687305, 0.7709178, -1.722551, 1, 1, 1, 1, 1,
-0.760305, 0.7354139, -0.9762938, 1, 1, 1, 1, 1,
-0.756812, 0.2844629, -2.14488, 1, 1, 1, 1, 1,
-0.756101, 0.6137727, -1.943577, 1, 1, 1, 1, 1,
-0.7553465, 1.896997, -1.243401, 1, 1, 1, 1, 1,
-0.7534469, -1.46605, -2.545605, 1, 1, 1, 1, 1,
-0.7529107, -0.6506146, -1.562391, 1, 1, 1, 1, 1,
-0.7512954, 0.4931675, -0.8560541, 1, 1, 1, 1, 1,
-0.7501641, 1.122963, -0.8717135, 1, 1, 1, 1, 1,
-0.7465075, -1.023355, -3.236092, 1, 1, 1, 1, 1,
-0.7387575, 0.4050884, 0.4076981, 1, 1, 1, 1, 1,
-0.7367361, 1.330366, -0.5286542, 0, 0, 1, 1, 1,
-0.7326158, 0.8865662, -1.097009, 1, 0, 0, 1, 1,
-0.7281173, -0.7827855, -3.40676, 1, 0, 0, 1, 1,
-0.7203331, 0.03849907, -0.6804174, 1, 0, 0, 1, 1,
-0.719439, -1.339262, -4.24073, 1, 0, 0, 1, 1,
-0.7152753, -0.4190093, -2.33906, 1, 0, 0, 1, 1,
-0.7144445, 1.008015, -1.161768, 0, 0, 0, 1, 1,
-0.7129266, -0.4461947, -1.228406, 0, 0, 0, 1, 1,
-0.7125346, 0.849369, -0.6815508, 0, 0, 0, 1, 1,
-0.7096937, -0.1790469, -2.554749, 0, 0, 0, 1, 1,
-0.708692, 0.2017213, -0.8874763, 0, 0, 0, 1, 1,
-0.6979359, -0.4092218, -2.530156, 0, 0, 0, 1, 1,
-0.6949961, 0.1163446, -0.8758482, 0, 0, 0, 1, 1,
-0.6890934, 0.7138922, 1.720916, 1, 1, 1, 1, 1,
-0.6870165, -1.002566, -2.822311, 1, 1, 1, 1, 1,
-0.6865838, -1.012104, -4.507033, 1, 1, 1, 1, 1,
-0.6851081, -0.1543046, -2.574332, 1, 1, 1, 1, 1,
-0.683236, -1.436368, -1.9397, 1, 1, 1, 1, 1,
-0.6820443, -1.454391, -1.606591, 1, 1, 1, 1, 1,
-0.6812235, 0.0699764, -3.164628, 1, 1, 1, 1, 1,
-0.6677239, 0.0861459, -1.465984, 1, 1, 1, 1, 1,
-0.6605008, -0.1972602, -2.304718, 1, 1, 1, 1, 1,
-0.6598287, 0.4528293, -0.4689862, 1, 1, 1, 1, 1,
-0.6596491, 0.68204, -1.234697, 1, 1, 1, 1, 1,
-0.6513652, 0.5967436, -1.230462, 1, 1, 1, 1, 1,
-0.6460995, 0.9797354, -0.2037675, 1, 1, 1, 1, 1,
-0.6458388, -0.2559707, -0.8710353, 1, 1, 1, 1, 1,
-0.6441053, -0.2239599, -0.8174093, 1, 1, 1, 1, 1,
-0.642733, -0.3679751, -1.761468, 0, 0, 1, 1, 1,
-0.6404423, -0.01690675, -1.71054, 1, 0, 0, 1, 1,
-0.6388499, 0.2140374, -2.073503, 1, 0, 0, 1, 1,
-0.6387279, 0.8744742, -0.05407271, 1, 0, 0, 1, 1,
-0.6323357, 0.6969054, 0.7675768, 1, 0, 0, 1, 1,
-0.6305586, 1.10289, -0.5597144, 1, 0, 0, 1, 1,
-0.6302102, 1.056841, -1.234756, 0, 0, 0, 1, 1,
-0.6297673, -0.5791547, -1.611457, 0, 0, 0, 1, 1,
-0.6266847, -0.5035757, -1.476453, 0, 0, 0, 1, 1,
-0.6241388, 1.41664, 0.5651051, 0, 0, 0, 1, 1,
-0.6240634, -1.43022, -2.091261, 0, 0, 0, 1, 1,
-0.6208647, 1.750622, -0.1846123, 0, 0, 0, 1, 1,
-0.6195523, -0.6555225, -1.309167, 0, 0, 0, 1, 1,
-0.6179572, -1.475337, -3.517185, 1, 1, 1, 1, 1,
-0.6172024, -1.681792, -4.085841, 1, 1, 1, 1, 1,
-0.6167102, -0.5315192, -3.317426, 1, 1, 1, 1, 1,
-0.6138226, 0.13211, -1.042333, 1, 1, 1, 1, 1,
-0.6094853, -1.558216, -3.52213, 1, 1, 1, 1, 1,
-0.6027142, 0.3193326, -0.3326502, 1, 1, 1, 1, 1,
-0.6010389, -0.4218559, -2.428049, 1, 1, 1, 1, 1,
-0.59904, 0.9272775, -2.174609, 1, 1, 1, 1, 1,
-0.5965037, 0.1182016, -1.13348, 1, 1, 1, 1, 1,
-0.596077, 2.407669, 0.7726485, 1, 1, 1, 1, 1,
-0.5893477, 2.266932, -1.665993, 1, 1, 1, 1, 1,
-0.5868155, 1.379102, -1.166258, 1, 1, 1, 1, 1,
-0.5866127, 0.153693, -1.025336, 1, 1, 1, 1, 1,
-0.5822782, 0.2133517, -1.550321, 1, 1, 1, 1, 1,
-0.5747852, 0.2521733, -0.5332614, 1, 1, 1, 1, 1,
-0.5702357, 0.1683221, -0.8956792, 0, 0, 1, 1, 1,
-0.5700432, -0.5286749, -1.053868, 1, 0, 0, 1, 1,
-0.5695107, -1.543328, -2.151195, 1, 0, 0, 1, 1,
-0.5689242, -0.9487619, -2.798352, 1, 0, 0, 1, 1,
-0.5633571, -0.4229231, -2.036082, 1, 0, 0, 1, 1,
-0.5631303, 0.8471495, -2.208047, 1, 0, 0, 1, 1,
-0.5629808, -1.786283, -3.238128, 0, 0, 0, 1, 1,
-0.5546255, 0.4684693, -1.118162, 0, 0, 0, 1, 1,
-0.5526748, -0.4277539, -1.721615, 0, 0, 0, 1, 1,
-0.5475358, 0.1024035, -1.633026, 0, 0, 0, 1, 1,
-0.5445052, -1.158967, -3.711677, 0, 0, 0, 1, 1,
-0.5422292, 0.8757778, -0.07283179, 0, 0, 0, 1, 1,
-0.5418254, -0.1806844, -0.1869134, 0, 0, 0, 1, 1,
-0.5396156, 1.189, -2.244715, 1, 1, 1, 1, 1,
-0.5314355, 1.249095, -0.8565359, 1, 1, 1, 1, 1,
-0.5272152, -0.1425816, -2.642872, 1, 1, 1, 1, 1,
-0.5213454, -0.1047659, -0.618459, 1, 1, 1, 1, 1,
-0.5208828, -1.908927, -3.420316, 1, 1, 1, 1, 1,
-0.5185395, -1.712152, -3.295236, 1, 1, 1, 1, 1,
-0.5165579, -0.8600224, -2.773994, 1, 1, 1, 1, 1,
-0.5097822, -0.09751755, -3.884841, 1, 1, 1, 1, 1,
-0.5061035, -0.8397371, -3.67451, 1, 1, 1, 1, 1,
-0.5044423, 0.09428674, -2.85459, 1, 1, 1, 1, 1,
-0.5025902, 0.09909924, -1.728991, 1, 1, 1, 1, 1,
-0.4998516, -1.774271, -2.765838, 1, 1, 1, 1, 1,
-0.4949393, 0.6468861, 1.366552, 1, 1, 1, 1, 1,
-0.4941108, 1.445567, 1.088253, 1, 1, 1, 1, 1,
-0.4921779, -1.429657, -3.155591, 1, 1, 1, 1, 1,
-0.4919881, -0.7775365, -3.071847, 0, 0, 1, 1, 1,
-0.4844469, 1.753492, -2.509568, 1, 0, 0, 1, 1,
-0.4805939, -0.2679365, -2.394653, 1, 0, 0, 1, 1,
-0.4800763, -1.632407, -4.781715, 1, 0, 0, 1, 1,
-0.4778742, 1.126656, 1.56467, 1, 0, 0, 1, 1,
-0.4762093, -0.02134227, -1.17293, 1, 0, 0, 1, 1,
-0.4752259, -0.3461633, -3.707997, 0, 0, 0, 1, 1,
-0.473484, -0.08747832, 0.2040615, 0, 0, 0, 1, 1,
-0.4728981, -0.629685, -2.88004, 0, 0, 0, 1, 1,
-0.4697369, -0.1064064, -2.794994, 0, 0, 0, 1, 1,
-0.4666958, -0.06351604, -1.417286, 0, 0, 0, 1, 1,
-0.46669, 0.0659854, -1.509229, 0, 0, 0, 1, 1,
-0.4652969, -1.192946, 0.3057171, 0, 0, 0, 1, 1,
-0.4639848, -0.9160545, -2.011661, 1, 1, 1, 1, 1,
-0.4593811, -0.4458231, -4.33275, 1, 1, 1, 1, 1,
-0.4576615, 0.444656, -0.3468587, 1, 1, 1, 1, 1,
-0.4554833, -0.637296, -3.886196, 1, 1, 1, 1, 1,
-0.4532674, -0.3260142, -2.614677, 1, 1, 1, 1, 1,
-0.4493802, 1.703963, 0.8439325, 1, 1, 1, 1, 1,
-0.4419179, 0.7640507, -0.5769969, 1, 1, 1, 1, 1,
-0.4414783, 1.552801, -0.1831128, 1, 1, 1, 1, 1,
-0.438662, -0.1498653, -2.165986, 1, 1, 1, 1, 1,
-0.4367861, -0.8859037, -3.798535, 1, 1, 1, 1, 1,
-0.4358108, -0.8861452, -3.237615, 1, 1, 1, 1, 1,
-0.4333784, -0.4072976, -1.06781, 1, 1, 1, 1, 1,
-0.429907, 0.03691537, -2.779198, 1, 1, 1, 1, 1,
-0.4259939, 2.023541, 0.1635612, 1, 1, 1, 1, 1,
-0.4253771, -0.009503306, -0.6060495, 1, 1, 1, 1, 1,
-0.422543, 1.069162, 0.1168062, 0, 0, 1, 1, 1,
-0.4213273, 0.4032884, -3.250164, 1, 0, 0, 1, 1,
-0.4201376, 0.7681974, -0.9703303, 1, 0, 0, 1, 1,
-0.4161845, 0.2400517, -0.8266693, 1, 0, 0, 1, 1,
-0.4134736, -0.6888184, -1.059511, 1, 0, 0, 1, 1,
-0.411591, 1.151855, 1.46849, 1, 0, 0, 1, 1,
-0.409453, 0.3612289, -1.601348, 0, 0, 0, 1, 1,
-0.3962716, -0.1829555, -1.123313, 0, 0, 0, 1, 1,
-0.3960524, -0.644338, -2.092477, 0, 0, 0, 1, 1,
-0.3941433, -1.957031, -2.326582, 0, 0, 0, 1, 1,
-0.3930264, -1.010524, -3.214552, 0, 0, 0, 1, 1,
-0.3907722, -0.6399977, -0.7576135, 0, 0, 0, 1, 1,
-0.3874761, -0.01558588, -1.357456, 0, 0, 0, 1, 1,
-0.3778853, -0.07677687, -2.323464, 1, 1, 1, 1, 1,
-0.3777403, 0.1936021, -1.069535, 1, 1, 1, 1, 1,
-0.3748061, -0.6314824, -1.518211, 1, 1, 1, 1, 1,
-0.3739541, -0.3801058, -2.887487, 1, 1, 1, 1, 1,
-0.3660388, -0.7281427, -2.553317, 1, 1, 1, 1, 1,
-0.3584554, -0.5589806, -2.985807, 1, 1, 1, 1, 1,
-0.3557114, 0.8707114, -0.02927532, 1, 1, 1, 1, 1,
-0.3453635, -1.04351, -3.696765, 1, 1, 1, 1, 1,
-0.3447299, -0.6356237, -1.789819, 1, 1, 1, 1, 1,
-0.3442291, -1.136877, -3.160306, 1, 1, 1, 1, 1,
-0.3415299, 1.176726, 1.962648, 1, 1, 1, 1, 1,
-0.3390107, -0.144128, -1.652951, 1, 1, 1, 1, 1,
-0.3384357, -0.7921718, -2.679713, 1, 1, 1, 1, 1,
-0.3307766, -0.6207052, -3.025351, 1, 1, 1, 1, 1,
-0.3280216, 0.4183723, -0.1597787, 1, 1, 1, 1, 1,
-0.3263015, 0.09884114, -0.5064905, 0, 0, 1, 1, 1,
-0.3227109, -1.367167, -1.998078, 1, 0, 0, 1, 1,
-0.3223113, 2.114009, -0.02024406, 1, 0, 0, 1, 1,
-0.320632, 2.135124, 0.7902967, 1, 0, 0, 1, 1,
-0.3195455, -0.2573957, -4.011185, 1, 0, 0, 1, 1,
-0.3183389, 0.2587669, -1.941839, 1, 0, 0, 1, 1,
-0.3175544, -0.5835405, -2.827139, 0, 0, 0, 1, 1,
-0.3116619, -0.491192, -2.323612, 0, 0, 0, 1, 1,
-0.3104005, -0.8835082, -3.580554, 0, 0, 0, 1, 1,
-0.3096347, 0.08409804, -0.1151805, 0, 0, 0, 1, 1,
-0.308684, -1.246616, -3.069305, 0, 0, 0, 1, 1,
-0.3002589, -1.659529, -3.998319, 0, 0, 0, 1, 1,
-0.2973273, 1.118812, -0.04041074, 0, 0, 0, 1, 1,
-0.2954285, -0.04025631, -2.097163, 1, 1, 1, 1, 1,
-0.2948933, -0.2980812, -2.601761, 1, 1, 1, 1, 1,
-0.2941879, -0.7614514, -2.955728, 1, 1, 1, 1, 1,
-0.2899629, -0.06922929, -2.124705, 1, 1, 1, 1, 1,
-0.2897158, 0.05995861, -1.135874, 1, 1, 1, 1, 1,
-0.2886761, -1.756495, -2.881085, 1, 1, 1, 1, 1,
-0.2877286, -0.07942815, -1.421337, 1, 1, 1, 1, 1,
-0.2859499, -0.404315, -3.659738, 1, 1, 1, 1, 1,
-0.2858907, 0.4349665, -2.195471, 1, 1, 1, 1, 1,
-0.2852639, 1.175817, 0.198148, 1, 1, 1, 1, 1,
-0.284781, 0.1309412, -1.021321, 1, 1, 1, 1, 1,
-0.2823342, -0.4272181, -3.137447, 1, 1, 1, 1, 1,
-0.2796888, 2.354169, -1.210777, 1, 1, 1, 1, 1,
-0.2783503, -0.06235495, -2.898589, 1, 1, 1, 1, 1,
-0.2780665, 0.6692867, -0.7659202, 1, 1, 1, 1, 1,
-0.2751729, -1.082451, -4.718927, 0, 0, 1, 1, 1,
-0.2731746, -0.08345914, -3.762871, 1, 0, 0, 1, 1,
-0.2731029, -1.136066, -3.509106, 1, 0, 0, 1, 1,
-0.2724869, -0.276514, -2.88338, 1, 0, 0, 1, 1,
-0.2696588, 1.469087, -1.372691, 1, 0, 0, 1, 1,
-0.2652144, 0.4027048, -0.8025766, 1, 0, 0, 1, 1,
-0.2648451, -0.1603961, -2.073943, 0, 0, 0, 1, 1,
-0.2625279, 0.8013847, 0.4363036, 0, 0, 0, 1, 1,
-0.2587154, 0.5177531, 0.5971385, 0, 0, 0, 1, 1,
-0.2566217, -0.8984345, -3.276839, 0, 0, 0, 1, 1,
-0.2558491, 1.24496, -0.9909562, 0, 0, 0, 1, 1,
-0.2527383, 0.2385293, -0.7052574, 0, 0, 0, 1, 1,
-0.2404185, -0.6881979, -3.436087, 0, 0, 0, 1, 1,
-0.2391664, 0.9914273, -0.4104764, 1, 1, 1, 1, 1,
-0.2335138, 1.833578, -1.251646, 1, 1, 1, 1, 1,
-0.2330875, 0.9922889, -2.659039, 1, 1, 1, 1, 1,
-0.2328424, -1.051241, -3.727462, 1, 1, 1, 1, 1,
-0.2321973, 1.532526, -0.6163589, 1, 1, 1, 1, 1,
-0.2093114, 1.217442, 0.6310415, 1, 1, 1, 1, 1,
-0.2086033, -1.025393, -2.448508, 1, 1, 1, 1, 1,
-0.2085621, -0.3213604, -1.045526, 1, 1, 1, 1, 1,
-0.2053868, 0.4339589, 0.888454, 1, 1, 1, 1, 1,
-0.205014, -0.6730995, -3.894396, 1, 1, 1, 1, 1,
-0.2039822, 0.4298053, -1.054209, 1, 1, 1, 1, 1,
-0.2015081, -0.7583571, -0.9096577, 1, 1, 1, 1, 1,
-0.1995259, -1.251731, -3.460896, 1, 1, 1, 1, 1,
-0.1961197, 0.9874623, -0.9597999, 1, 1, 1, 1, 1,
-0.1957779, -0.6381864, -3.643547, 1, 1, 1, 1, 1,
-0.1897336, -0.3139566, -2.101441, 0, 0, 1, 1, 1,
-0.1892499, 0.4688824, -1.144867, 1, 0, 0, 1, 1,
-0.1889564, 0.3915359, -0.726624, 1, 0, 0, 1, 1,
-0.1871929, 0.2435263, -2.102159, 1, 0, 0, 1, 1,
-0.1847653, 0.5380987, 0.122912, 1, 0, 0, 1, 1,
-0.1816262, -0.5471926, -1.727689, 1, 0, 0, 1, 1,
-0.1799657, -0.07091498, -0.9601685, 0, 0, 0, 1, 1,
-0.1780519, -1.067261, -3.99361, 0, 0, 0, 1, 1,
-0.1766341, -0.1843279, -4.629822, 0, 0, 0, 1, 1,
-0.1750561, 1.245387, -0.7155476, 0, 0, 0, 1, 1,
-0.1733354, -0.9598821, -2.475764, 0, 0, 0, 1, 1,
-0.1718112, 0.4568476, -0.1138283, 0, 0, 0, 1, 1,
-0.1701972, 0.9910862, 0.2726944, 0, 0, 0, 1, 1,
-0.1701783, 1.77695, 0.4691857, 1, 1, 1, 1, 1,
-0.1683703, -0.2741519, -2.988167, 1, 1, 1, 1, 1,
-0.164359, 0.7915512, 0.08385026, 1, 1, 1, 1, 1,
-0.1626614, 0.06985014, -2.088537, 1, 1, 1, 1, 1,
-0.1625965, -0.8305807, -3.538461, 1, 1, 1, 1, 1,
-0.153537, 0.435506, 0.8394535, 1, 1, 1, 1, 1,
-0.1519455, 0.7562158, -1.502585, 1, 1, 1, 1, 1,
-0.1495795, 0.1932946, -0.4753673, 1, 1, 1, 1, 1,
-0.1457101, -1.046285, -4.06553, 1, 1, 1, 1, 1,
-0.1451493, -0.9025306, -2.339102, 1, 1, 1, 1, 1,
-0.1444454, -0.8905434, -2.862666, 1, 1, 1, 1, 1,
-0.1420549, 0.2550684, -1.684705, 1, 1, 1, 1, 1,
-0.1344944, 0.5697156, -0.7522978, 1, 1, 1, 1, 1,
-0.1331182, -0.8439137, -5.657764, 1, 1, 1, 1, 1,
-0.128079, 0.08822612, -1.142358, 1, 1, 1, 1, 1,
-0.1247922, -0.9303618, -2.459814, 0, 0, 1, 1, 1,
-0.1246441, 0.2794471, 0.3923572, 1, 0, 0, 1, 1,
-0.1201469, 1.54099, -0.4025011, 1, 0, 0, 1, 1,
-0.1169427, 0.6453008, -0.6242218, 1, 0, 0, 1, 1,
-0.1101852, -1.767501, -3.654799, 1, 0, 0, 1, 1,
-0.104638, -0.0966435, -2.561875, 1, 0, 0, 1, 1,
-0.1027425, -1.874207, -1.450495, 0, 0, 0, 1, 1,
-0.09969091, -0.06891011, -1.562542, 0, 0, 0, 1, 1,
-0.09628485, -0.4281631, -1.774665, 0, 0, 0, 1, 1,
-0.09318411, 0.09480063, -2.298354, 0, 0, 0, 1, 1,
-0.09173972, -1.288626, -4.452977, 0, 0, 0, 1, 1,
-0.0868402, -0.9814242, -5.433428, 0, 0, 0, 1, 1,
-0.08659066, -0.648221, -3.595684, 0, 0, 0, 1, 1,
-0.08633157, -0.8511664, -1.87577, 1, 1, 1, 1, 1,
-0.08615173, 1.163853, 0.8298275, 1, 1, 1, 1, 1,
-0.08512712, 0.309208, -1.425203, 1, 1, 1, 1, 1,
-0.08451523, 1.612161, -0.8327844, 1, 1, 1, 1, 1,
-0.0819779, -1.826648, -3.842495, 1, 1, 1, 1, 1,
-0.07489657, -0.9400989, -2.158001, 1, 1, 1, 1, 1,
-0.06749896, -1.477877, -2.725284, 1, 1, 1, 1, 1,
-0.0639425, -0.7819548, -2.735655, 1, 1, 1, 1, 1,
-0.06309988, -0.00967403, -1.329, 1, 1, 1, 1, 1,
-0.05788933, 0.5928923, -0.02362835, 1, 1, 1, 1, 1,
-0.05591961, -0.5677964, -4.919444, 1, 1, 1, 1, 1,
-0.05527508, -0.1517632, -2.189399, 1, 1, 1, 1, 1,
-0.05525471, -0.4952868, -2.850058, 1, 1, 1, 1, 1,
-0.0468644, -0.2460296, -3.553952, 1, 1, 1, 1, 1,
-0.04199378, 1.47958, -0.4813904, 1, 1, 1, 1, 1,
-0.04014658, -0.02686847, -2.349359, 0, 0, 1, 1, 1,
-0.04008354, -1.570574, -2.351418, 1, 0, 0, 1, 1,
-0.03811591, 0.6899279, -0.3185677, 1, 0, 0, 1, 1,
-0.03573742, -1.792305, -3.900244, 1, 0, 0, 1, 1,
-0.03421775, -0.1976888, -2.277807, 1, 0, 0, 1, 1,
-0.03279332, -0.611612, -3.581605, 1, 0, 0, 1, 1,
-0.03028754, 0.06264529, -0.7516134, 0, 0, 0, 1, 1,
-0.02774737, -0.3782706, -2.587734, 0, 0, 0, 1, 1,
-0.02606604, 0.7563867, 1.636931, 0, 0, 0, 1, 1,
-0.02526535, -0.07424436, -2.698182, 0, 0, 0, 1, 1,
-0.02243951, -0.4256026, -4.898582, 0, 0, 0, 1, 1,
-0.02090731, -1.315354, -3.005267, 0, 0, 0, 1, 1,
-0.01931401, 1.398072, -0.6242424, 0, 0, 0, 1, 1,
-0.01574644, -0.7114278, -2.425929, 1, 1, 1, 1, 1,
-0.01219798, -1.604304, -2.538627, 1, 1, 1, 1, 1,
-0.01053492, 0.6110749, 0.02253853, 1, 1, 1, 1, 1,
-0.007564502, 0.1974201, -0.4479567, 1, 1, 1, 1, 1,
-0.0008107848, 1.090994, -0.3619092, 1, 1, 1, 1, 1,
0.005907454, 0.6064462, -0.5482294, 1, 1, 1, 1, 1,
0.006021224, -0.3824131, 2.299042, 1, 1, 1, 1, 1,
0.006133397, 0.6367036, 0.8348376, 1, 1, 1, 1, 1,
0.006534239, -0.1170934, 3.356844, 1, 1, 1, 1, 1,
0.009490643, 0.4455858, 0.131237, 1, 1, 1, 1, 1,
0.00992593, -0.6160857, 2.910551, 1, 1, 1, 1, 1,
0.01507952, 0.4385351, 1.099018, 1, 1, 1, 1, 1,
0.01736635, -1.813855, 2.917965, 1, 1, 1, 1, 1,
0.02168803, 0.8692124, 0.452017, 1, 1, 1, 1, 1,
0.021967, 0.6286226, 0.03955902, 1, 1, 1, 1, 1,
0.02461216, 0.9975078, -0.3428795, 0, 0, 1, 1, 1,
0.02958613, -0.8351636, 2.820759, 1, 0, 0, 1, 1,
0.03174822, -0.892851, -0.01182084, 1, 0, 0, 1, 1,
0.03421707, -0.3713539, 3.278348, 1, 0, 0, 1, 1,
0.03622706, 0.07786664, 0.6659216, 1, 0, 0, 1, 1,
0.03972688, 1.344878, 1.097656, 1, 0, 0, 1, 1,
0.04040448, -0.02091642, 1.163248, 0, 0, 0, 1, 1,
0.04492728, -0.5109704, 3.675564, 0, 0, 0, 1, 1,
0.04598257, 1.007036, -0.5460992, 0, 0, 0, 1, 1,
0.04759992, -0.9941384, 3.744206, 0, 0, 0, 1, 1,
0.0496723, 1.178249, 0.2258037, 0, 0, 0, 1, 1,
0.05028048, -0.4426702, 4.016876, 0, 0, 0, 1, 1,
0.06069799, 0.7889581, 2.564678, 0, 0, 0, 1, 1,
0.0610846, 0.5412231, -0.08029635, 1, 1, 1, 1, 1,
0.06357661, 0.2476725, 0.9659133, 1, 1, 1, 1, 1,
0.0680327, -1.56959, 4.57923, 1, 1, 1, 1, 1,
0.07357582, -0.8127819, 2.846565, 1, 1, 1, 1, 1,
0.07412638, -1.387233, 3.004112, 1, 1, 1, 1, 1,
0.07629348, -2.088718, 3.264784, 1, 1, 1, 1, 1,
0.07631092, 1.655627, -0.03666572, 1, 1, 1, 1, 1,
0.07695032, -0.2784863, 2.014344, 1, 1, 1, 1, 1,
0.07706954, -0.753051, 3.204314, 1, 1, 1, 1, 1,
0.0772, 0.44366, -0.03955128, 1, 1, 1, 1, 1,
0.08539553, -1.482599, 1.483992, 1, 1, 1, 1, 1,
0.08644804, -1.13875, 4.330854, 1, 1, 1, 1, 1,
0.08736756, 0.07085941, 0.482125, 1, 1, 1, 1, 1,
0.08990782, -0.03211529, 2.568974, 1, 1, 1, 1, 1,
0.09162298, 1.119105, 0.3751549, 1, 1, 1, 1, 1,
0.09825741, -0.4195082, 3.191701, 0, 0, 1, 1, 1,
0.09902262, 0.2364351, 0.9003916, 1, 0, 0, 1, 1,
0.1005709, 0.1180445, -1.207657, 1, 0, 0, 1, 1,
0.1017968, 0.1540338, 2.862467, 1, 0, 0, 1, 1,
0.1020293, 0.9886382, -0.05826586, 1, 0, 0, 1, 1,
0.1040642, 2.753704, 2.708391, 1, 0, 0, 1, 1,
0.1060228, -0.07038506, 1.633089, 0, 0, 0, 1, 1,
0.1130131, 1.74042, -0.6398569, 0, 0, 0, 1, 1,
0.1225436, 0.9397065, -0.05038591, 0, 0, 0, 1, 1,
0.1233643, -0.7256169, 3.662811, 0, 0, 0, 1, 1,
0.1236368, -0.04151458, 2.190663, 0, 0, 0, 1, 1,
0.1301768, 0.9038919, 0.16426, 0, 0, 0, 1, 1,
0.1323856, 2.741034, 2.174328, 0, 0, 0, 1, 1,
0.1329103, -0.09702289, 0.6515209, 1, 1, 1, 1, 1,
0.1333399, 0.5361828, 0.6681156, 1, 1, 1, 1, 1,
0.1352438, 1.92905, -0.167997, 1, 1, 1, 1, 1,
0.1391538, -0.08915599, 0.648848, 1, 1, 1, 1, 1,
0.140193, 0.0993587, 0.7011349, 1, 1, 1, 1, 1,
0.1411348, 0.2846781, 0.06791297, 1, 1, 1, 1, 1,
0.1484002, 0.3692239, 1.515234, 1, 1, 1, 1, 1,
0.1518436, -0.5849947, 3.525861, 1, 1, 1, 1, 1,
0.1556065, -0.9539306, 2.675501, 1, 1, 1, 1, 1,
0.1588142, 0.6336957, 1.095628, 1, 1, 1, 1, 1,
0.1647255, 1.492989, -0.3747732, 1, 1, 1, 1, 1,
0.1661489, 0.451352, 1.519799, 1, 1, 1, 1, 1,
0.1689282, -0.09590308, 2.765565, 1, 1, 1, 1, 1,
0.1697219, 1.012631, -0.9334377, 1, 1, 1, 1, 1,
0.1762267, 0.1223649, 1.621078, 1, 1, 1, 1, 1,
0.1774261, 1.116147, 2.96565, 0, 0, 1, 1, 1,
0.1780002, -0.5694208, 2.435098, 1, 0, 0, 1, 1,
0.1830257, 1.034369, -0.535245, 1, 0, 0, 1, 1,
0.186712, 0.06087949, 2.462206, 1, 0, 0, 1, 1,
0.1871156, 1.41766, 0.4020738, 1, 0, 0, 1, 1,
0.18907, -0.1605034, 2.904406, 1, 0, 0, 1, 1,
0.1896825, 0.8799964, -0.1230996, 0, 0, 0, 1, 1,
0.1897664, 0.187353, 0.4008423, 0, 0, 0, 1, 1,
0.190643, 2.086712, -0.5992361, 0, 0, 0, 1, 1,
0.1916609, 2.216196, 0.8169681, 0, 0, 0, 1, 1,
0.1932633, 0.6059749, -0.4351553, 0, 0, 0, 1, 1,
0.1943911, 0.3949821, -1.436308, 0, 0, 0, 1, 1,
0.2004761, -0.3377145, 1.913371, 0, 0, 0, 1, 1,
0.2075736, 0.6232809, 2.016512, 1, 1, 1, 1, 1,
0.2174375, 1.006995, 0.1483569, 1, 1, 1, 1, 1,
0.2211618, 0.257373, 1.89064, 1, 1, 1, 1, 1,
0.2254088, 0.138257, 1.231909, 1, 1, 1, 1, 1,
0.2286336, -0.2451582, 2.233684, 1, 1, 1, 1, 1,
0.2306345, 0.6348192, 1.190834, 1, 1, 1, 1, 1,
0.2310761, 2.353165, -2.083494, 1, 1, 1, 1, 1,
0.2316449, -2.623732, 2.691153, 1, 1, 1, 1, 1,
0.244961, 1.03561, 0.8221907, 1, 1, 1, 1, 1,
0.2551344, -1.042439, 3.093767, 1, 1, 1, 1, 1,
0.2615418, 1.329488, 0.4112761, 1, 1, 1, 1, 1,
0.2661131, 0.2694252, 0.9825127, 1, 1, 1, 1, 1,
0.2664879, 0.9605165, 0.05078866, 1, 1, 1, 1, 1,
0.2706234, -1.884294, 4.034797, 1, 1, 1, 1, 1,
0.2739075, 1.007709, 2.38203, 1, 1, 1, 1, 1,
0.2854139, 0.2296988, 1.484115, 0, 0, 1, 1, 1,
0.2890286, 0.9679207, 1.803543, 1, 0, 0, 1, 1,
0.292539, -1.009271, 2.358872, 1, 0, 0, 1, 1,
0.2926348, 0.2752663, 1.445527, 1, 0, 0, 1, 1,
0.2931578, 2.043484, -2.335726, 1, 0, 0, 1, 1,
0.2992823, 1.330693, -1.500291, 1, 0, 0, 1, 1,
0.3023322, -1.446561, 3.097733, 0, 0, 0, 1, 1,
0.3049419, -0.5212749, 2.14602, 0, 0, 0, 1, 1,
0.3090942, 1.703912, 1.418573, 0, 0, 0, 1, 1,
0.3115297, 0.005287937, -1.008503, 0, 0, 0, 1, 1,
0.3132046, 0.2217974, 1.020138, 0, 0, 0, 1, 1,
0.3148352, 0.7505707, -0.09112857, 0, 0, 0, 1, 1,
0.3162985, 1.203033, -1.1231, 0, 0, 0, 1, 1,
0.3167005, -1.138211, 2.584558, 1, 1, 1, 1, 1,
0.3201034, 0.7157886, -0.2726369, 1, 1, 1, 1, 1,
0.3251363, -2.326873, 3.708881, 1, 1, 1, 1, 1,
0.327786, -1.395105, 2.455015, 1, 1, 1, 1, 1,
0.3282171, 1.546023, -0.1269486, 1, 1, 1, 1, 1,
0.3287729, 0.642881, -0.256538, 1, 1, 1, 1, 1,
0.3311135, -1.38861, 3.054278, 1, 1, 1, 1, 1,
0.3318469, -1.648627, 3.039754, 1, 1, 1, 1, 1,
0.3336259, 0.2003265, 1.401759, 1, 1, 1, 1, 1,
0.3340803, -0.8155915, 3.884017, 1, 1, 1, 1, 1,
0.3349096, 0.2811417, 0.9996805, 1, 1, 1, 1, 1,
0.3352149, 0.5020929, 1.141035, 1, 1, 1, 1, 1,
0.335255, -0.2809748, 3.097076, 1, 1, 1, 1, 1,
0.3363208, 0.3630259, 1.177325, 1, 1, 1, 1, 1,
0.3399251, 0.181208, 2.162782, 1, 1, 1, 1, 1,
0.3403718, -0.5073386, 4.289277, 0, 0, 1, 1, 1,
0.3442935, -0.3930017, 2.055262, 1, 0, 0, 1, 1,
0.3506015, 1.062416, 1.628469, 1, 0, 0, 1, 1,
0.3506072, 0.200154, -1.16777, 1, 0, 0, 1, 1,
0.3552725, 0.6190936, 0.6718647, 1, 0, 0, 1, 1,
0.358875, -0.09660248, 0.7113319, 1, 0, 0, 1, 1,
0.3602871, -0.6448367, 2.011655, 0, 0, 0, 1, 1,
0.3604274, -0.0942397, -0.352113, 0, 0, 0, 1, 1,
0.3616003, 0.006691666, 3.418596, 0, 0, 0, 1, 1,
0.3617751, -0.0389415, 1.431662, 0, 0, 0, 1, 1,
0.3625696, 0.09847111, 1.240672, 0, 0, 0, 1, 1,
0.3633251, -1.49296, 3.640908, 0, 0, 0, 1, 1,
0.3638638, -1.110638, 4.494246, 0, 0, 0, 1, 1,
0.380809, -1.622049, 3.969089, 1, 1, 1, 1, 1,
0.3813364, 0.3034258, 2.057388, 1, 1, 1, 1, 1,
0.3823397, -0.9050732, 2.817882, 1, 1, 1, 1, 1,
0.3835145, -1.286887, 3.141671, 1, 1, 1, 1, 1,
0.383925, -0.4732761, 0.9485905, 1, 1, 1, 1, 1,
0.3843001, -0.1471313, 0.7230695, 1, 1, 1, 1, 1,
0.3865139, -0.2877157, 1.544081, 1, 1, 1, 1, 1,
0.387073, -1.057579, 3.575749, 1, 1, 1, 1, 1,
0.3896943, 0.9797571, 0.4452356, 1, 1, 1, 1, 1,
0.3943881, -0.78354, 1.506486, 1, 1, 1, 1, 1,
0.3954023, 0.518941, -0.2602187, 1, 1, 1, 1, 1,
0.398275, 0.1162003, 1.510473, 1, 1, 1, 1, 1,
0.4012839, 0.01011341, 2.152467, 1, 1, 1, 1, 1,
0.4025001, -2.268033e-05, 2.729285, 1, 1, 1, 1, 1,
0.4054093, 2.116408, 0.8488338, 1, 1, 1, 1, 1,
0.411162, 1.554681, 0.575706, 0, 0, 1, 1, 1,
0.4177504, 1.330134, 0.336147, 1, 0, 0, 1, 1,
0.4231584, 2.446493, -1.067324, 1, 0, 0, 1, 1,
0.4303904, 0.1982082, 0.481225, 1, 0, 0, 1, 1,
0.4323447, 0.7885927, 0.7767275, 1, 0, 0, 1, 1,
0.4335997, 0.6443692, 0.5875974, 1, 0, 0, 1, 1,
0.4342532, 1.267267, 0.2858649, 0, 0, 0, 1, 1,
0.4354241, -0.8758188, 0.8869448, 0, 0, 0, 1, 1,
0.4377639, -0.01646744, 1.299044, 0, 0, 0, 1, 1,
0.4420268, 1.285634, -2.021581, 0, 0, 0, 1, 1,
0.4422761, 0.9350656, -0.2863717, 0, 0, 0, 1, 1,
0.4458455, -0.9753613, 3.255675, 0, 0, 0, 1, 1,
0.4543937, -0.390704, 2.191268, 0, 0, 0, 1, 1,
0.4571391, -1.725218, 2.927686, 1, 1, 1, 1, 1,
0.4607546, 0.5986294, 0.09727998, 1, 1, 1, 1, 1,
0.4660421, 2.435705, 0.2284921, 1, 1, 1, 1, 1,
0.4662881, -0.131848, 1.227406, 1, 1, 1, 1, 1,
0.4699504, -0.3172691, 1.35576, 1, 1, 1, 1, 1,
0.4736196, -0.2092299, 1.482043, 1, 1, 1, 1, 1,
0.477699, -0.1305756, 1.970986, 1, 1, 1, 1, 1,
0.4790224, 0.04761724, 3.465193, 1, 1, 1, 1, 1,
0.48059, 0.001522776, 1.377128, 1, 1, 1, 1, 1,
0.4856975, 0.1166459, 2.001736, 1, 1, 1, 1, 1,
0.4914049, -0.5092291, 3.67514, 1, 1, 1, 1, 1,
0.49169, 0.8415731, -0.1096168, 1, 1, 1, 1, 1,
0.4922759, 0.8838393, 0.3214983, 1, 1, 1, 1, 1,
0.4948757, -0.2676092, 2.614145, 1, 1, 1, 1, 1,
0.4955913, -0.283312, 1.083138, 1, 1, 1, 1, 1,
0.4963621, 0.3205061, -0.5219336, 0, 0, 1, 1, 1,
0.4968845, -0.8341365, 2.48504, 1, 0, 0, 1, 1,
0.501816, 1.532402, 0.6065154, 1, 0, 0, 1, 1,
0.5026135, -0.7957636, 2.194968, 1, 0, 0, 1, 1,
0.5042606, 2.078767, 1.204833, 1, 0, 0, 1, 1,
0.5043056, 0.7325665, 1.271895, 1, 0, 0, 1, 1,
0.5061648, 0.3903514, 3.014683, 0, 0, 0, 1, 1,
0.5077403, 1.086303, 1.470099, 0, 0, 0, 1, 1,
0.5080803, -0.537126, 0.7312593, 0, 0, 0, 1, 1,
0.5085307, -2.340667, 2.322365, 0, 0, 0, 1, 1,
0.5096717, 0.6452425, 0.7991428, 0, 0, 0, 1, 1,
0.5134286, 0.3794923, 2.483644, 0, 0, 0, 1, 1,
0.5135453, -0.4286256, 2.241138, 0, 0, 0, 1, 1,
0.5143493, 0.4482945, 1.892272, 1, 1, 1, 1, 1,
0.5173508, 0.80997, 0.8654351, 1, 1, 1, 1, 1,
0.5242628, 0.5272256, 1.20223, 1, 1, 1, 1, 1,
0.5273752, 0.3136967, 1.614933, 1, 1, 1, 1, 1,
0.5304194, -0.1069551, 0.7425662, 1, 1, 1, 1, 1,
0.5319476, 0.4668193, 0.6579865, 1, 1, 1, 1, 1,
0.5382633, -0.5188373, 1.471488, 1, 1, 1, 1, 1,
0.5399572, 0.5532717, -0.1474472, 1, 1, 1, 1, 1,
0.5413463, -1.232313, 1.093898, 1, 1, 1, 1, 1,
0.5480311, -2.297191, 2.19928, 1, 1, 1, 1, 1,
0.5500332, 0.7835468, 0.6639662, 1, 1, 1, 1, 1,
0.5512229, 0.5016888, 1.056882, 1, 1, 1, 1, 1,
0.5541819, 1.148937, 0.404474, 1, 1, 1, 1, 1,
0.5553341, -0.9505389, 4.314752, 1, 1, 1, 1, 1,
0.5553718, 1.342381, 3.356997, 1, 1, 1, 1, 1,
0.5571949, 1.822695, 0.9970701, 0, 0, 1, 1, 1,
0.5590097, 1.269996, 0.7789325, 1, 0, 0, 1, 1,
0.5591152, 0.2221492, 1.203967, 1, 0, 0, 1, 1,
0.55966, -1.7818, 1.603035, 1, 0, 0, 1, 1,
0.5622169, -0.9399866, 2.496754, 1, 0, 0, 1, 1,
0.5657513, 0.1362744, 2.509945, 1, 0, 0, 1, 1,
0.570554, -0.1583163, 2.958668, 0, 0, 0, 1, 1,
0.5716324, -1.140595, 4.238266, 0, 0, 0, 1, 1,
0.5732662, 0.4981289, 2.907402, 0, 0, 0, 1, 1,
0.5741513, 0.07624676, 1.615514, 0, 0, 0, 1, 1,
0.5744461, -0.1905234, 0.9084015, 0, 0, 0, 1, 1,
0.5768647, 0.6474384, -0.02281791, 0, 0, 0, 1, 1,
0.5796105, -1.135588, 2.458944, 0, 0, 0, 1, 1,
0.5892292, 0.4016226, 0.6869658, 1, 1, 1, 1, 1,
0.5917879, 0.5406746, 0.1706445, 1, 1, 1, 1, 1,
0.5938344, 1.626992, -0.2320258, 1, 1, 1, 1, 1,
0.593957, 0.9035054, -0.6580576, 1, 1, 1, 1, 1,
0.6004948, -1.166775, 0.3530753, 1, 1, 1, 1, 1,
0.6062748, -1.788856, 1.561712, 1, 1, 1, 1, 1,
0.6084955, 2.541147, 1.049556, 1, 1, 1, 1, 1,
0.6096868, -0.5293707, 2.356615, 1, 1, 1, 1, 1,
0.6160595, 0.3362519, 0.7464997, 1, 1, 1, 1, 1,
0.6226247, -1.792978, 2.751325, 1, 1, 1, 1, 1,
0.626211, -1.264066, 3.153226, 1, 1, 1, 1, 1,
0.6264635, -0.02210552, 3.673866, 1, 1, 1, 1, 1,
0.6270232, -1.262787, 3.142213, 1, 1, 1, 1, 1,
0.6289417, 0.6118277, -1.019996, 1, 1, 1, 1, 1,
0.6308435, 0.6393512, 2.026201, 1, 1, 1, 1, 1,
0.6374699, 0.7851334, 1.217733, 0, 0, 1, 1, 1,
0.6394182, 0.5249301, 0.3668769, 1, 0, 0, 1, 1,
0.6410229, -1.335332, 3.882541, 1, 0, 0, 1, 1,
0.6420554, 0.6998781, 0.7456363, 1, 0, 0, 1, 1,
0.6450823, -0.5997506, 2.625612, 1, 0, 0, 1, 1,
0.6521892, -0.4147137, 2.671173, 1, 0, 0, 1, 1,
0.652519, 0.3389434, 3.588567, 0, 0, 0, 1, 1,
0.6542192, 0.404937, 0.9575052, 0, 0, 0, 1, 1,
0.668694, 0.5855943, 0.6535461, 0, 0, 0, 1, 1,
0.6694369, -0.9993926, 3.053882, 0, 0, 0, 1, 1,
0.6701598, -1.067554, 2.436435, 0, 0, 0, 1, 1,
0.6726239, 0.3452007, 0.1102904, 0, 0, 0, 1, 1,
0.6766943, 0.9721335, 1.164326, 0, 0, 0, 1, 1,
0.6784477, 0.4652254, 1.577878, 1, 1, 1, 1, 1,
0.6820787, -1.418031, 3.918427, 1, 1, 1, 1, 1,
0.6838456, -0.02409913, 0.5300474, 1, 1, 1, 1, 1,
0.683874, 0.02142714, 1.095778, 1, 1, 1, 1, 1,
0.685661, -1.149459, 2.357874, 1, 1, 1, 1, 1,
0.690456, -1.811446, 2.04731, 1, 1, 1, 1, 1,
0.6944129, 0.6721764, 0.6012918, 1, 1, 1, 1, 1,
0.6954384, -1.423105, 2.137631, 1, 1, 1, 1, 1,
0.6966879, -0.7403369, 2.101317, 1, 1, 1, 1, 1,
0.6991429, 2.063782, -2.602084, 1, 1, 1, 1, 1,
0.7011373, -0.7509798, 3.796654, 1, 1, 1, 1, 1,
0.7055998, -0.3435051, 0.1291351, 1, 1, 1, 1, 1,
0.7089657, 0.8689102, 0.7662535, 1, 1, 1, 1, 1,
0.7099885, 0.4375196, 1.072718, 1, 1, 1, 1, 1,
0.7100909, 0.3091672, 1.815355, 1, 1, 1, 1, 1,
0.7162313, 1.031664, 0.2118638, 0, 0, 1, 1, 1,
0.7171584, -0.1081671, 1.042115, 1, 0, 0, 1, 1,
0.7175385, -0.7541072, 1.454928, 1, 0, 0, 1, 1,
0.7194074, 0.6717632, -0.7844213, 1, 0, 0, 1, 1,
0.7225411, -0.5643629, 3.872936, 1, 0, 0, 1, 1,
0.7285539, 0.6985433, 1.502964, 1, 0, 0, 1, 1,
0.7328615, -1.478059, 2.720554, 0, 0, 0, 1, 1,
0.7342644, 1.1258, -0.6790289, 0, 0, 0, 1, 1,
0.7366456, -1.056575, 3.925552, 0, 0, 0, 1, 1,
0.7401865, -0.3397615, 3.585139, 0, 0, 0, 1, 1,
0.7424072, -1.933063, 0.749881, 0, 0, 0, 1, 1,
0.7440436, -0.6710855, 2.867996, 0, 0, 0, 1, 1,
0.7498196, -0.604219, 1.140256, 0, 0, 0, 1, 1,
0.7521268, 1.120358, 1.138634, 1, 1, 1, 1, 1,
0.7766644, 0.6981773, -1.032001, 1, 1, 1, 1, 1,
0.7768449, 1.366458, 0.5204382, 1, 1, 1, 1, 1,
0.7772721, 0.8734254, 0.8847774, 1, 1, 1, 1, 1,
0.7780547, -0.1881184, 2.272125, 1, 1, 1, 1, 1,
0.785453, 0.9576578, 0.6949888, 1, 1, 1, 1, 1,
0.7873843, 0.8580438, -0.1533434, 1, 1, 1, 1, 1,
0.7882872, -0.5834998, 2.339854, 1, 1, 1, 1, 1,
0.7942619, 0.8121083, 0.8046653, 1, 1, 1, 1, 1,
0.7950797, 1.138417, 0.4967715, 1, 1, 1, 1, 1,
0.7957749, -0.6594039, 2.146614, 1, 1, 1, 1, 1,
0.7986562, 0.3186205, 2.628599, 1, 1, 1, 1, 1,
0.8016941, 0.5899386, -1.107252, 1, 1, 1, 1, 1,
0.8018335, -1.659594, 2.804757, 1, 1, 1, 1, 1,
0.807935, 2.56366, 0.1745858, 1, 1, 1, 1, 1,
0.8126048, -0.6244432, 2.620054, 0, 0, 1, 1, 1,
0.819788, -0.5148287, 1.044031, 1, 0, 0, 1, 1,
0.8229975, -1.836833, 1.525043, 1, 0, 0, 1, 1,
0.8254896, -0.04703016, 3.092222, 1, 0, 0, 1, 1,
0.8295757, 0.7450352, 1.610122, 1, 0, 0, 1, 1,
0.8340321, 2.154973, -1.176057, 1, 0, 0, 1, 1,
0.8367927, -0.338215, 0.8726698, 0, 0, 0, 1, 1,
0.8376018, 1.660594, 0.1101257, 0, 0, 0, 1, 1,
0.8378139, -1.353796, 2.946302, 0, 0, 0, 1, 1,
0.8474424, 1.030167, 0.7404807, 0, 0, 0, 1, 1,
0.8523508, -1.572433, 2.83703, 0, 0, 0, 1, 1,
0.8538647, -0.6830222, 3.324791, 0, 0, 0, 1, 1,
0.8542027, -0.9975563, 2.962232, 0, 0, 0, 1, 1,
0.8669257, -2.788958, 4.652146, 1, 1, 1, 1, 1,
0.872554, -0.527162, 2.32654, 1, 1, 1, 1, 1,
0.8771827, 0.5498652, 1.165819, 1, 1, 1, 1, 1,
0.8819342, 1.093276, 2.015635, 1, 1, 1, 1, 1,
0.8825476, 0.0827932, 0.760881, 1, 1, 1, 1, 1,
0.8848922, 0.3555026, 0.2826895, 1, 1, 1, 1, 1,
0.8857723, 1.813018, 0.02450744, 1, 1, 1, 1, 1,
0.8918052, 1.274493, 1.217487, 1, 1, 1, 1, 1,
0.8954513, 1.174797, -0.4713401, 1, 1, 1, 1, 1,
0.8974471, -0.5423908, 2.926716, 1, 1, 1, 1, 1,
0.9008774, -0.4745666, 1.641657, 1, 1, 1, 1, 1,
0.9070987, -0.2465656, 2.396779, 1, 1, 1, 1, 1,
0.9074336, 0.9380525, 1.835904, 1, 1, 1, 1, 1,
0.9106736, 0.4012031, 0.6087357, 1, 1, 1, 1, 1,
0.9193124, 0.8162723, 1.547403, 1, 1, 1, 1, 1,
0.9197782, -1.265007, 3.645268, 0, 0, 1, 1, 1,
0.9216962, -0.3536108, 3.098062, 1, 0, 0, 1, 1,
0.9246067, 1.175432, 1.987084, 1, 0, 0, 1, 1,
0.9249106, 0.4777488, 0.6801094, 1, 0, 0, 1, 1,
0.9258341, 0.8731695, -0.728305, 1, 0, 0, 1, 1,
0.9344249, -1.158542, 2.55919, 1, 0, 0, 1, 1,
0.9352316, -1.02591, 1.555129, 0, 0, 0, 1, 1,
0.9367304, -0.03267202, 0.01930597, 0, 0, 0, 1, 1,
0.9390586, -1.516724, 1.824731, 0, 0, 0, 1, 1,
0.9394568, -0.5705196, 0.9660515, 0, 0, 0, 1, 1,
0.9397802, 1.713292, -1.454726, 0, 0, 0, 1, 1,
0.9438997, -1.434687, 1.410929, 0, 0, 0, 1, 1,
0.9469936, -0.7617466, 2.173174, 0, 0, 0, 1, 1,
0.9496375, 0.4237024, 3.316435, 1, 1, 1, 1, 1,
0.9527846, 1.790905, -0.9719278, 1, 1, 1, 1, 1,
0.9600555, 0.4931119, 2.83728, 1, 1, 1, 1, 1,
0.9602295, 1.719821, -0.2461677, 1, 1, 1, 1, 1,
0.9653152, -0.216662, 1.75576, 1, 1, 1, 1, 1,
0.975833, -1.798481, 3.187647, 1, 1, 1, 1, 1,
0.9803227, -1.108587, 3.978258, 1, 1, 1, 1, 1,
0.9825496, -1.290377, 2.067774, 1, 1, 1, 1, 1,
0.9868597, 0.488316, 0.1320844, 1, 1, 1, 1, 1,
0.9993843, -0.6019804, 3.593855, 1, 1, 1, 1, 1,
1.007469, -1.372182, 3.022587, 1, 1, 1, 1, 1,
1.013425, -0.3135506, 2.009346, 1, 1, 1, 1, 1,
1.015556, -1.645727, 3.95936, 1, 1, 1, 1, 1,
1.025403, 0.1065929, -0.05617866, 1, 1, 1, 1, 1,
1.029265, -0.777362, 2.753619, 1, 1, 1, 1, 1,
1.034089, 0.3137489, 0.06253482, 0, 0, 1, 1, 1,
1.035439, -0.02945819, 1.344931, 1, 0, 0, 1, 1,
1.038593, 0.1396081, 1.946979, 1, 0, 0, 1, 1,
1.049567, 0.9033074, 0.4977928, 1, 0, 0, 1, 1,
1.050391, 1.191779, 0.8122728, 1, 0, 0, 1, 1,
1.051415, 0.4773184, 0.7317019, 1, 0, 0, 1, 1,
1.051667, 1.233947, 0.1287785, 0, 0, 0, 1, 1,
1.057703, -1.099373, 3.534318, 0, 0, 0, 1, 1,
1.062895, 0.2700218, 1.26749, 0, 0, 0, 1, 1,
1.066232, -0.1634535, 2.201714, 0, 0, 0, 1, 1,
1.066927, 0.3437433, 1.367895, 0, 0, 0, 1, 1,
1.067676, -0.05160533, 1.819008, 0, 0, 0, 1, 1,
1.078299, 0.8119478, 1.607971, 0, 0, 0, 1, 1,
1.082248, 0.3244527, 0.9945608, 1, 1, 1, 1, 1,
1.08249, -0.9161714, 2.632286, 1, 1, 1, 1, 1,
1.085337, -0.6050878, 3.116527, 1, 1, 1, 1, 1,
1.087057, 0.4902131, 1.75191, 1, 1, 1, 1, 1,
1.088158, -0.3233944, 1.033215, 1, 1, 1, 1, 1,
1.092419, -0.07867108, 2.083241, 1, 1, 1, 1, 1,
1.095564, 1.763238, 0.9416175, 1, 1, 1, 1, 1,
1.102449, 0.02595093, 0.2792886, 1, 1, 1, 1, 1,
1.10366, -0.3049603, 1.187521, 1, 1, 1, 1, 1,
1.106953, 0.7115453, 0.1185063, 1, 1, 1, 1, 1,
1.112595, 1.693696, 0.9322184, 1, 1, 1, 1, 1,
1.11389, 0.832505, 0.9951933, 1, 1, 1, 1, 1,
1.120644, 0.5836253, 0.9825109, 1, 1, 1, 1, 1,
1.12724, 0.9308435, 1.68349, 1, 1, 1, 1, 1,
1.13711, 1.142773, 0.9371077, 1, 1, 1, 1, 1,
1.142321, -1.38573, 3.425364, 0, 0, 1, 1, 1,
1.147019, 0.8067367, -0.1817923, 1, 0, 0, 1, 1,
1.150018, 0.3240584, 1.046038, 1, 0, 0, 1, 1,
1.16073, -0.05486642, 2.58052, 1, 0, 0, 1, 1,
1.161396, -0.2642441, 2.46144, 1, 0, 0, 1, 1,
1.163163, -0.964316, 1.461917, 1, 0, 0, 1, 1,
1.164158, 1.0468, 0.7374304, 0, 0, 0, 1, 1,
1.165207, 2.043636, 1.977105, 0, 0, 0, 1, 1,
1.165899, -0.6496726, 1.135302, 0, 0, 0, 1, 1,
1.16759, 0.3513285, 1.57434, 0, 0, 0, 1, 1,
1.174391, 0.5236192, -0.0323211, 0, 0, 0, 1, 1,
1.181026, -0.1360274, -0.3390871, 0, 0, 0, 1, 1,
1.189426, -0.8345479, 2.86562, 0, 0, 0, 1, 1,
1.214806, 1.058852, 0.1506428, 1, 1, 1, 1, 1,
1.217121, -0.2358834, 1.610556, 1, 1, 1, 1, 1,
1.221814, -0.902101, 4.379238, 1, 1, 1, 1, 1,
1.24401, -1.516204, 3.280074, 1, 1, 1, 1, 1,
1.245823, 1.60399, 0.3168067, 1, 1, 1, 1, 1,
1.24728, -0.76285, 3.683336, 1, 1, 1, 1, 1,
1.254551, -0.9908947, 0.2921069, 1, 1, 1, 1, 1,
1.27159, 0.4918542, 1.873977, 1, 1, 1, 1, 1,
1.282168, 0.3885612, 1.646984, 1, 1, 1, 1, 1,
1.287069, 0.8295264, 0.4929632, 1, 1, 1, 1, 1,
1.287706, 1.266658, -0.1843893, 1, 1, 1, 1, 1,
1.289795, 0.444625, 1.306475, 1, 1, 1, 1, 1,
1.293126, -1.953074, 2.577862, 1, 1, 1, 1, 1,
1.296948, 1.448801, 0.7183284, 1, 1, 1, 1, 1,
1.307383, 0.5570383, 0.877229, 1, 1, 1, 1, 1,
1.314396, 1.001619, -0.6710834, 0, 0, 1, 1, 1,
1.319243, -1.598797, 3.47795, 1, 0, 0, 1, 1,
1.323626, 0.2252432, 0.6000344, 1, 0, 0, 1, 1,
1.325486, -0.8959781, 2.122133, 1, 0, 0, 1, 1,
1.327828, 0.03515332, 1.93675, 1, 0, 0, 1, 1,
1.333445, -0.3435865, 1.445631, 1, 0, 0, 1, 1,
1.340865, 0.4325766, 1.152522, 0, 0, 0, 1, 1,
1.352675, 0.7317634, 2.29165, 0, 0, 0, 1, 1,
1.352891, 1.717656, 1.565519, 0, 0, 0, 1, 1,
1.352959, 0.1663948, 1.936696, 0, 0, 0, 1, 1,
1.353308, 0.818796, 2.103544, 0, 0, 0, 1, 1,
1.355147, 1.772195, 1.507275, 0, 0, 0, 1, 1,
1.356107, -0.8569429, 2.163884, 0, 0, 0, 1, 1,
1.359132, -0.4329168, 1.777085, 1, 1, 1, 1, 1,
1.364322, 0.5390908, 0.7551911, 1, 1, 1, 1, 1,
1.369669, -0.221362, 2.609024, 1, 1, 1, 1, 1,
1.377676, 0.8395119, 1.786491, 1, 1, 1, 1, 1,
1.379229, -0.2217738, 2.325068, 1, 1, 1, 1, 1,
1.411865, 0.1133231, 0.1091026, 1, 1, 1, 1, 1,
1.416686, -0.5195872, 0.6467422, 1, 1, 1, 1, 1,
1.43293, 1.643854, 1.686056, 1, 1, 1, 1, 1,
1.441432, -0.9088005, 2.27822, 1, 1, 1, 1, 1,
1.443382, -0.3890963, 3.09907, 1, 1, 1, 1, 1,
1.451897, -0.7728951, 3.638705, 1, 1, 1, 1, 1,
1.454819, 0.9349424, -0.4146302, 1, 1, 1, 1, 1,
1.456282, -0.9416775, 2.928209, 1, 1, 1, 1, 1,
1.467275, -1.101101, 1.258534, 1, 1, 1, 1, 1,
1.485294, 0.5441625, 1.700311, 1, 1, 1, 1, 1,
1.48538, 0.7009966, 1.757228, 0, 0, 1, 1, 1,
1.490965, -0.09690505, -0.01770912, 1, 0, 0, 1, 1,
1.492732, 0.3387847, 0.06065794, 1, 0, 0, 1, 1,
1.493139, -0.7656591, 1.76157, 1, 0, 0, 1, 1,
1.494917, 0.03548059, 1.346368, 1, 0, 0, 1, 1,
1.49519, -0.7937092, 2.834441, 1, 0, 0, 1, 1,
1.542083, -1.276282, 1.689304, 0, 0, 0, 1, 1,
1.556762, -1.578509, 0.6789032, 0, 0, 0, 1, 1,
1.561097, -0.0007135764, 1.648647, 0, 0, 0, 1, 1,
1.57568, -0.879087, 2.956535, 0, 0, 0, 1, 1,
1.587079, -0.9623752, 0.7066258, 0, 0, 0, 1, 1,
1.592567, 1.336687, 1.411196, 0, 0, 0, 1, 1,
1.592849, -0.4155611, 2.605243, 0, 0, 0, 1, 1,
1.600429, -0.8344063, 3.258319, 1, 1, 1, 1, 1,
1.608717, 0.7309036, 0.4562814, 1, 1, 1, 1, 1,
1.617347, 0.5876331, 0.9496306, 1, 1, 1, 1, 1,
1.620532, -0.9630008, 1.899698, 1, 1, 1, 1, 1,
1.627444, -0.02398235, 2.13273, 1, 1, 1, 1, 1,
1.630387, -1.277601, 1.572511, 1, 1, 1, 1, 1,
1.643775, -0.794988, 0.9219213, 1, 1, 1, 1, 1,
1.669058, 0.4314425, 1.199553, 1, 1, 1, 1, 1,
1.670827, 0.2843327, 1.318477, 1, 1, 1, 1, 1,
1.673748, -2.250804, 3.192999, 1, 1, 1, 1, 1,
1.675087, 1.162826, 1.407738, 1, 1, 1, 1, 1,
1.677138, -1.674934, 2.441733, 1, 1, 1, 1, 1,
1.679447, 0.2475931, 2.732527, 1, 1, 1, 1, 1,
1.681074, 0.1604364, 1.953265, 1, 1, 1, 1, 1,
1.68255, 3.334064, 0.3345347, 1, 1, 1, 1, 1,
1.687704, 0.6580942, 2.674589, 0, 0, 1, 1, 1,
1.689129, 0.07384017, 2.157821, 1, 0, 0, 1, 1,
1.694069, -1.031054, 2.067568, 1, 0, 0, 1, 1,
1.694489, 0.7449776, 1.386747, 1, 0, 0, 1, 1,
1.722829, 0.9522239, 1.759901, 1, 0, 0, 1, 1,
1.734244, 0.5583409, 1.533891, 1, 0, 0, 1, 1,
1.740311, 0.8554516, 1.129388, 0, 0, 0, 1, 1,
1.743695, -0.08701302, 0.2075444, 0, 0, 0, 1, 1,
1.762626, -0.5326391, 0.2879196, 0, 0, 0, 1, 1,
1.786677, -0.2449456, 3.033998, 0, 0, 0, 1, 1,
1.81831, -0.9837976, 3.350547, 0, 0, 0, 1, 1,
1.821871, 0.712288, 0.3589222, 0, 0, 0, 1, 1,
1.834257, 1.602311, 1.416435, 0, 0, 0, 1, 1,
1.840646, 0.4800813, -1.269851, 1, 1, 1, 1, 1,
1.84877, 0.3182257, 1.553493, 1, 1, 1, 1, 1,
1.863484, -1.895609, 3.141061, 1, 1, 1, 1, 1,
1.904154, 0.4444229, 1.931472, 1, 1, 1, 1, 1,
1.939823, 1.387905, 0.5748264, 1, 1, 1, 1, 1,
2.022809, -0.1666304, 1.57225, 1, 1, 1, 1, 1,
2.023781, 0.338158, 3.281566, 1, 1, 1, 1, 1,
2.028209, -1.530693, 3.019732, 1, 1, 1, 1, 1,
2.074628, -0.2849208, 2.730397, 1, 1, 1, 1, 1,
2.075207, -1.082111, 2.20974, 1, 1, 1, 1, 1,
2.079629, -0.3104458, 2.833626, 1, 1, 1, 1, 1,
2.081866, 1.423785, 0.2352356, 1, 1, 1, 1, 1,
2.09894, 0.2367349, 0.6201099, 1, 1, 1, 1, 1,
2.103682, -0.4962434, 1.910263, 1, 1, 1, 1, 1,
2.11798, 1.879696, 1.738103, 1, 1, 1, 1, 1,
2.149529, -0.8779171, 2.067574, 0, 0, 1, 1, 1,
2.168695, -0.3919795, 1.360724, 1, 0, 0, 1, 1,
2.194363, 0.1265288, -0.153349, 1, 0, 0, 1, 1,
2.2643, -0.5589158, 1.229833, 1, 0, 0, 1, 1,
2.267998, -1.390991, 3.120297, 1, 0, 0, 1, 1,
2.296018, -0.8851912, 3.526715, 1, 0, 0, 1, 1,
2.349593, 2.326517, 1.262541, 0, 0, 0, 1, 1,
2.357139, 0.6704891, -0.1503814, 0, 0, 0, 1, 1,
2.400534, -0.568448, 1.0428, 0, 0, 0, 1, 1,
2.42248, 1.328769, 1.679929, 0, 0, 0, 1, 1,
2.443421, -0.02684032, 0.1870337, 0, 0, 0, 1, 1,
2.467601, 0.002497094, 2.855871, 0, 0, 0, 1, 1,
2.480625, -0.8779684, 2.101806, 0, 0, 0, 1, 1,
2.605813, 1.548247, 0.08748601, 1, 1, 1, 1, 1,
2.662036, 0.4203238, 0.5450794, 1, 1, 1, 1, 1,
2.707636, 0.301648, 3.08852, 1, 1, 1, 1, 1,
2.730278, -0.6992587, 0.8705501, 1, 1, 1, 1, 1,
3.0834, 0.2990066, 1.854165, 1, 1, 1, 1, 1,
3.164063, -0.0669242, 2.772426, 1, 1, 1, 1, 1,
3.283573, -0.8714309, 2.860611, 1, 1, 1, 1, 1
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
var radius = 9.461903;
var distance = 33.23454;
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
mvMatrix.translate( 0.003933191, -0.1924552, 0.5489938 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23454);
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
