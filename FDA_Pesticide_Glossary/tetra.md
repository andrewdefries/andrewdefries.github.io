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
-3.496415, -0.03681162, -2.002333, 1, 0, 0, 1,
-2.950533, -0.8940247, -0.3843594, 1, 0.007843138, 0, 1,
-2.739441, 1.503175, -0.5854178, 1, 0.01176471, 0, 1,
-2.72461, -1.058693, -2.254227, 1, 0.01960784, 0, 1,
-2.605385, -2.44937, -2.520482, 1, 0.02352941, 0, 1,
-2.594553, 0.9719453, -1.029769, 1, 0.03137255, 0, 1,
-2.590176, -1.040205, -0.2707164, 1, 0.03529412, 0, 1,
-2.583778, 0.8014764, -2.98619, 1, 0.04313726, 0, 1,
-2.578951, -0.615309, 0.0006441296, 1, 0.04705882, 0, 1,
-2.53696, 0.1545582, -2.610315, 1, 0.05490196, 0, 1,
-2.511446, -0.8784367, -0.4341374, 1, 0.05882353, 0, 1,
-2.460312, -1.314867, -1.289711, 1, 0.06666667, 0, 1,
-2.31464, -0.7142906, -0.1845187, 1, 0.07058824, 0, 1,
-2.278456, 0.3200092, -3.0708, 1, 0.07843138, 0, 1,
-2.210214, 0.1975305, -1.824847, 1, 0.08235294, 0, 1,
-2.184388, -0.0961167, -2.524641, 1, 0.09019608, 0, 1,
-2.180718, -0.8537935, -2.948461, 1, 0.09411765, 0, 1,
-2.170882, 0.4049609, -2.067175, 1, 0.1019608, 0, 1,
-2.161546, 0.3606589, -1.171842, 1, 0.1098039, 0, 1,
-2.151017, 1.170713, -0.8612778, 1, 0.1137255, 0, 1,
-2.149036, 1.087973, -1.16984, 1, 0.1215686, 0, 1,
-2.134807, -0.1424121, -1.63356, 1, 0.1254902, 0, 1,
-2.134653, 0.04334778, -0.9920173, 1, 0.1333333, 0, 1,
-2.09249, 1.240613, -0.4907143, 1, 0.1372549, 0, 1,
-2.064953, 1.233471, -1.693118, 1, 0.145098, 0, 1,
-2.036487, -0.9715595, -2.137372, 1, 0.1490196, 0, 1,
-2.003778, 0.1250762, -1.072688, 1, 0.1568628, 0, 1,
-1.983233, -0.2034061, -1.998872, 1, 0.1607843, 0, 1,
-1.98227, -1.163802, -2.842296, 1, 0.1686275, 0, 1,
-1.973169, 0.5063373, 0.6269879, 1, 0.172549, 0, 1,
-1.955908, -0.9509143, -1.749618, 1, 0.1803922, 0, 1,
-1.922258, -0.8163882, -0.7421222, 1, 0.1843137, 0, 1,
-1.919133, -1.515625, -1.709822, 1, 0.1921569, 0, 1,
-1.891166, 1.536937, -1.441511, 1, 0.1960784, 0, 1,
-1.890582, -1.425105, -1.83839, 1, 0.2039216, 0, 1,
-1.871553, -1.089818, -1.627734, 1, 0.2117647, 0, 1,
-1.870142, -1.022017, -3.615505, 1, 0.2156863, 0, 1,
-1.847097, 0.08338981, -3.06895, 1, 0.2235294, 0, 1,
-1.845416, 0.8637549, -2.174881, 1, 0.227451, 0, 1,
-1.830896, 0.333692, -1.69787, 1, 0.2352941, 0, 1,
-1.80989, 0.5610797, -0.710548, 1, 0.2392157, 0, 1,
-1.80532, 1.372653, -0.7458652, 1, 0.2470588, 0, 1,
-1.777519, -0.4109561, -1.929517, 1, 0.2509804, 0, 1,
-1.77332, 0.4597927, 1.296703, 1, 0.2588235, 0, 1,
-1.762348, 1.471614, -0.04056986, 1, 0.2627451, 0, 1,
-1.711722, -0.5094368, -3.116917, 1, 0.2705882, 0, 1,
-1.703181, 0.06444447, 0.08841591, 1, 0.2745098, 0, 1,
-1.6983, -0.7786447, -0.984553, 1, 0.282353, 0, 1,
-1.692048, 0.5101377, 0.2392606, 1, 0.2862745, 0, 1,
-1.678961, 1.188128, 0.00953982, 1, 0.2941177, 0, 1,
-1.654409, 0.555811, -0.02363696, 1, 0.3019608, 0, 1,
-1.650285, 0.04614411, -1.555947, 1, 0.3058824, 0, 1,
-1.642532, -0.7862393, -1.118419, 1, 0.3137255, 0, 1,
-1.640006, 0.1498172, -0.7330493, 1, 0.3176471, 0, 1,
-1.631711, 0.6466938, -0.7647908, 1, 0.3254902, 0, 1,
-1.624197, 0.5422954, -0.05980546, 1, 0.3294118, 0, 1,
-1.624135, 0.585386, -1.405194, 1, 0.3372549, 0, 1,
-1.616725, -1.193675, -0.9200339, 1, 0.3411765, 0, 1,
-1.609374, 1.07341, -2.744414, 1, 0.3490196, 0, 1,
-1.608606, -0.5816429, -2.421464, 1, 0.3529412, 0, 1,
-1.603026, 1.384889, -2.889643, 1, 0.3607843, 0, 1,
-1.602679, 0.7465543, -1.677144, 1, 0.3647059, 0, 1,
-1.601842, -0.7271037, -0.6139435, 1, 0.372549, 0, 1,
-1.587375, -0.3597936, -2.357494, 1, 0.3764706, 0, 1,
-1.586835, -0.4248058, -1.293304, 1, 0.3843137, 0, 1,
-1.56444, -1.365769, -1.360281, 1, 0.3882353, 0, 1,
-1.562549, 0.5975606, -0.8367425, 1, 0.3960784, 0, 1,
-1.55955, 0.8189192, 0.265274, 1, 0.4039216, 0, 1,
-1.55658, 0.4954864, -0.5462554, 1, 0.4078431, 0, 1,
-1.553148, -0.6305436, -2.508666, 1, 0.4156863, 0, 1,
-1.54355, 0.8585193, -1.143422, 1, 0.4196078, 0, 1,
-1.540921, 0.4558318, -2.221057, 1, 0.427451, 0, 1,
-1.537086, 1.275553, 0.397442, 1, 0.4313726, 0, 1,
-1.534769, -3.21254, -2.086096, 1, 0.4392157, 0, 1,
-1.530906, -0.05088999, -0.7704745, 1, 0.4431373, 0, 1,
-1.525716, -1.792781, -3.576, 1, 0.4509804, 0, 1,
-1.503692, -0.2671615, -0.4903517, 1, 0.454902, 0, 1,
-1.489046, 0.7920539, -2.40459, 1, 0.4627451, 0, 1,
-1.484227, -0.6752532, -1.181438, 1, 0.4666667, 0, 1,
-1.482127, 0.11461, -1.056414, 1, 0.4745098, 0, 1,
-1.481571, -1.562139, -3.937194, 1, 0.4784314, 0, 1,
-1.475332, -1.5323, -1.101652, 1, 0.4862745, 0, 1,
-1.474612, -0.8215035, -1.958191, 1, 0.4901961, 0, 1,
-1.450556, -0.4402761, -2.716454, 1, 0.4980392, 0, 1,
-1.45035, 0.428112, 1.219476, 1, 0.5058824, 0, 1,
-1.449278, 0.416355, -2.613681, 1, 0.509804, 0, 1,
-1.437289, -0.4647979, -1.647516, 1, 0.5176471, 0, 1,
-1.433677, 1.209977, 0.9416797, 1, 0.5215687, 0, 1,
-1.433457, -0.3227455, -2.365193, 1, 0.5294118, 0, 1,
-1.431627, -0.5327072, 0.2255042, 1, 0.5333334, 0, 1,
-1.420866, 0.284232, -0.4733615, 1, 0.5411765, 0, 1,
-1.413088, 1.116641, -2.361995, 1, 0.5450981, 0, 1,
-1.396883, 0.2154934, -0.9687276, 1, 0.5529412, 0, 1,
-1.388729, -1.983988, -2.621014, 1, 0.5568628, 0, 1,
-1.388581, -0.1106436, -3.171941, 1, 0.5647059, 0, 1,
-1.387195, -0.5875527, -1.771151, 1, 0.5686275, 0, 1,
-1.381598, -1.070561, -2.709256, 1, 0.5764706, 0, 1,
-1.381395, -0.6894597, -2.212782, 1, 0.5803922, 0, 1,
-1.380329, 0.9347119, -1.902713, 1, 0.5882353, 0, 1,
-1.369718, 0.3797758, 0.6096652, 1, 0.5921569, 0, 1,
-1.362373, 0.1909308, -1.166291, 1, 0.6, 0, 1,
-1.354727, 0.1999637, -1.420375, 1, 0.6078432, 0, 1,
-1.347717, -1.653055, -1.714086, 1, 0.6117647, 0, 1,
-1.329593, -1.639196, -1.930248, 1, 0.6196079, 0, 1,
-1.328444, 0.8321355, -1.680686, 1, 0.6235294, 0, 1,
-1.325693, 0.1301816, 0.1425237, 1, 0.6313726, 0, 1,
-1.31633, -0.4861894, -0.7289442, 1, 0.6352941, 0, 1,
-1.297433, 0.4632492, -1.167789, 1, 0.6431373, 0, 1,
-1.294279, 0.3493198, -1.368305, 1, 0.6470588, 0, 1,
-1.274042, 0.9275029, -1.522046, 1, 0.654902, 0, 1,
-1.271744, 1.245194, -1.513348, 1, 0.6588235, 0, 1,
-1.268628, 0.8048632, -0.1983585, 1, 0.6666667, 0, 1,
-1.263615, -0.3309436, -2.727185, 1, 0.6705883, 0, 1,
-1.257453, 0.4493442, -0.6023885, 1, 0.6784314, 0, 1,
-1.248504, -2.012028, -4.105422, 1, 0.682353, 0, 1,
-1.242412, -0.01851658, -1.668695, 1, 0.6901961, 0, 1,
-1.227901, 0.7930546, -1.800131, 1, 0.6941177, 0, 1,
-1.225709, -1.262689, -4.400113, 1, 0.7019608, 0, 1,
-1.220226, -0.09987129, -1.475667, 1, 0.7098039, 0, 1,
-1.208179, -0.4312505, -1.996554, 1, 0.7137255, 0, 1,
-1.20352, 0.8792524, -1.003729, 1, 0.7215686, 0, 1,
-1.202911, 2.006464, 0.5940899, 1, 0.7254902, 0, 1,
-1.19729, -1.182743, -1.011921, 1, 0.7333333, 0, 1,
-1.193651, -0.1357958, -1.557173, 1, 0.7372549, 0, 1,
-1.192974, 0.5295359, 0.4728754, 1, 0.7450981, 0, 1,
-1.191763, -1.797291, -1.953492, 1, 0.7490196, 0, 1,
-1.180956, 0.1227019, -2.686604, 1, 0.7568628, 0, 1,
-1.180766, 0.4037221, -0.3082212, 1, 0.7607843, 0, 1,
-1.178529, -1.771058, -2.322884, 1, 0.7686275, 0, 1,
-1.177259, -1.416823, -1.386776, 1, 0.772549, 0, 1,
-1.171433, -1.580372, -2.557478, 1, 0.7803922, 0, 1,
-1.170898, 0.145264, -3.440559, 1, 0.7843137, 0, 1,
-1.160081, 0.09378187, -2.114602, 1, 0.7921569, 0, 1,
-1.149999, 0.7996382, -0.576508, 1, 0.7960784, 0, 1,
-1.136018, -1.023125, -3.082905, 1, 0.8039216, 0, 1,
-1.134275, -0.1053184, -1.729409, 1, 0.8117647, 0, 1,
-1.128802, 0.2484443, -1.888489, 1, 0.8156863, 0, 1,
-1.125938, 1.329587, -1.633993, 1, 0.8235294, 0, 1,
-1.12443, 1.435707, -0.369624, 1, 0.827451, 0, 1,
-1.117422, -0.9030741, -3.801249, 1, 0.8352941, 0, 1,
-1.116534, -0.3411156, -2.231217, 1, 0.8392157, 0, 1,
-1.111084, -0.7389513, -2.52856, 1, 0.8470588, 0, 1,
-1.109391, -0.2285739, -2.692277, 1, 0.8509804, 0, 1,
-1.108868, -0.8996477, -1.836341, 1, 0.8588235, 0, 1,
-1.094261, 1.377307, -0.1443343, 1, 0.8627451, 0, 1,
-1.09338, 0.1950299, -0.3661238, 1, 0.8705882, 0, 1,
-1.092557, 0.3056142, -0.006045145, 1, 0.8745098, 0, 1,
-1.092018, -2.909944, -0.8373562, 1, 0.8823529, 0, 1,
-1.083672, 0.458689, -1.170404, 1, 0.8862745, 0, 1,
-1.078571, 1.903531, -1.059531, 1, 0.8941177, 0, 1,
-1.077493, 0.9679903, -0.7735125, 1, 0.8980392, 0, 1,
-1.077187, 1.218952, 0.2115906, 1, 0.9058824, 0, 1,
-1.076206, -0.9348196, -2.995365, 1, 0.9137255, 0, 1,
-1.072894, -0.9880753, -2.04279, 1, 0.9176471, 0, 1,
-1.072801, 0.3207757, -1.589169, 1, 0.9254902, 0, 1,
-1.068494, -0.5191557, -2.184855, 1, 0.9294118, 0, 1,
-1.061157, -0.7873909, -2.970788, 1, 0.9372549, 0, 1,
-1.060086, 1.289121, 1.876528, 1, 0.9411765, 0, 1,
-1.057542, 0.1123015, -2.057474, 1, 0.9490196, 0, 1,
-1.055863, 0.1166917, -1.991105, 1, 0.9529412, 0, 1,
-1.050431, -0.008285916, -2.522168, 1, 0.9607843, 0, 1,
-1.044546, 1.020611, -0.7596285, 1, 0.9647059, 0, 1,
-1.024072, 0.03895094, -1.21659, 1, 0.972549, 0, 1,
-1.023553, -0.233934, -2.200005, 1, 0.9764706, 0, 1,
-1.023454, 0.700572, 0.2757374, 1, 0.9843137, 0, 1,
-1.014595, -0.2062689, -2.625257, 1, 0.9882353, 0, 1,
-1.003405, -1.722895, -3.014427, 1, 0.9960784, 0, 1,
-0.9795296, -1.060122, -0.7204584, 0.9960784, 1, 0, 1,
-0.9791688, 0.1382267, -2.39549, 0.9921569, 1, 0, 1,
-0.9703593, -2.156257, -3.468334, 0.9843137, 1, 0, 1,
-0.9679618, -0.3935175, -1.058643, 0.9803922, 1, 0, 1,
-0.9655735, -0.72143, -4.590635, 0.972549, 1, 0, 1,
-0.9649752, 0.03970607, 0.1393387, 0.9686275, 1, 0, 1,
-0.9648201, -1.461924, -2.292346, 0.9607843, 1, 0, 1,
-0.9553517, 0.6987898, -1.218915, 0.9568627, 1, 0, 1,
-0.9530932, 1.368693, 0.4344297, 0.9490196, 1, 0, 1,
-0.9510825, 0.8854343, -2.343454, 0.945098, 1, 0, 1,
-0.9505461, -0.621277, -1.574046, 0.9372549, 1, 0, 1,
-0.9488278, -1.183176, -3.472754, 0.9333333, 1, 0, 1,
-0.9462495, -1.036289, -1.4796, 0.9254902, 1, 0, 1,
-0.944112, -1.908623, -3.643516, 0.9215686, 1, 0, 1,
-0.9395911, 0.8211764, -1.472079, 0.9137255, 1, 0, 1,
-0.9368752, 0.3201665, -1.966896, 0.9098039, 1, 0, 1,
-0.9327417, 0.7767988, 1.217769, 0.9019608, 1, 0, 1,
-0.927358, 0.02813147, -0.3970206, 0.8941177, 1, 0, 1,
-0.9248108, -0.4217183, -1.609426, 0.8901961, 1, 0, 1,
-0.9243992, 1.182044, 0.6371477, 0.8823529, 1, 0, 1,
-0.9231153, 0.325841, -1.572701, 0.8784314, 1, 0, 1,
-0.9221633, 0.505617, -2.778618, 0.8705882, 1, 0, 1,
-0.9215702, -1.014035, -2.122626, 0.8666667, 1, 0, 1,
-0.9155802, 0.1014417, -3.137517, 0.8588235, 1, 0, 1,
-0.9131895, 0.4509039, -1.075402, 0.854902, 1, 0, 1,
-0.9111324, -1.826817, -2.668291, 0.8470588, 1, 0, 1,
-0.9021617, -0.8554723, -3.458177, 0.8431373, 1, 0, 1,
-0.8989669, -0.856879, -1.446203, 0.8352941, 1, 0, 1,
-0.890075, -1.84782, -4.610341, 0.8313726, 1, 0, 1,
-0.8900052, 0.5255368, 0.2481316, 0.8235294, 1, 0, 1,
-0.8840571, -0.8160082, -0.388218, 0.8196079, 1, 0, 1,
-0.8753849, -2.075691, -3.337211, 0.8117647, 1, 0, 1,
-0.8731309, -0.03963055, -1.694257, 0.8078431, 1, 0, 1,
-0.8728495, 0.2813502, -0.6249837, 0.8, 1, 0, 1,
-0.8726283, 1.618324, -0.8873137, 0.7921569, 1, 0, 1,
-0.858868, -1.032115, -2.197972, 0.7882353, 1, 0, 1,
-0.8551725, -0.1803124, -3.041559, 0.7803922, 1, 0, 1,
-0.8530209, -0.177454, -2.21015, 0.7764706, 1, 0, 1,
-0.8526438, -1.756047, -1.931786, 0.7686275, 1, 0, 1,
-0.8467621, -0.08292878, -1.272697, 0.7647059, 1, 0, 1,
-0.8466277, -1.073672, -3.281549, 0.7568628, 1, 0, 1,
-0.8417313, 2.90387, -0.1670025, 0.7529412, 1, 0, 1,
-0.82482, -0.6361334, -0.9190422, 0.7450981, 1, 0, 1,
-0.824759, -0.725878, -2.790439, 0.7411765, 1, 0, 1,
-0.8195646, 0.2150394, -1.434468, 0.7333333, 1, 0, 1,
-0.8181169, 0.447318, -1.969396, 0.7294118, 1, 0, 1,
-0.8149288, -1.644866, -4.132598, 0.7215686, 1, 0, 1,
-0.8039069, -1.077532, -2.674686, 0.7176471, 1, 0, 1,
-0.8030966, 0.08679592, -2.48878, 0.7098039, 1, 0, 1,
-0.8017844, -0.1290563, -2.703781, 0.7058824, 1, 0, 1,
-0.7897638, -0.8700029, -3.106376, 0.6980392, 1, 0, 1,
-0.7893499, 0.0160087, -1.972394, 0.6901961, 1, 0, 1,
-0.7882243, 0.3344283, -0.1145145, 0.6862745, 1, 0, 1,
-0.7849138, -1.076484, -2.950527, 0.6784314, 1, 0, 1,
-0.7814739, 1.489745, 0.4768459, 0.6745098, 1, 0, 1,
-0.7813517, 1.107269, -2.314865, 0.6666667, 1, 0, 1,
-0.7749715, 0.3036467, -0.5837843, 0.6627451, 1, 0, 1,
-0.7702959, 1.366297, 0.7829207, 0.654902, 1, 0, 1,
-0.7620398, -0.03358699, -3.259183, 0.6509804, 1, 0, 1,
-0.7498387, -0.9569266, -2.10233, 0.6431373, 1, 0, 1,
-0.7413694, 1.025286, -0.7457079, 0.6392157, 1, 0, 1,
-0.7334571, -1.57814, -2.04408, 0.6313726, 1, 0, 1,
-0.7324658, -0.9137284, -3.668776, 0.627451, 1, 0, 1,
-0.7134367, 2.321449, -1.474099, 0.6196079, 1, 0, 1,
-0.7078975, -1.320629, -1.647862, 0.6156863, 1, 0, 1,
-0.7075955, 1.116621, -1.315878, 0.6078432, 1, 0, 1,
-0.7064698, -0.6065711, -2.451962, 0.6039216, 1, 0, 1,
-0.7044852, 0.3377837, -2.605264, 0.5960785, 1, 0, 1,
-0.7010072, -1.68863, -1.623622, 0.5882353, 1, 0, 1,
-0.7004541, 1.491193, -2.138557, 0.5843138, 1, 0, 1,
-0.6988688, 0.3931474, -1.744649, 0.5764706, 1, 0, 1,
-0.6972686, 0.1706383, -1.405352, 0.572549, 1, 0, 1,
-0.696964, 0.1645591, -2.092569, 0.5647059, 1, 0, 1,
-0.6929822, -0.01748466, -0.6549424, 0.5607843, 1, 0, 1,
-0.6820582, -0.5943615, -1.771509, 0.5529412, 1, 0, 1,
-0.6770753, -0.111878, -0.2454669, 0.5490196, 1, 0, 1,
-0.6746216, -0.1386275, -1.601447, 0.5411765, 1, 0, 1,
-0.6610217, 1.079885, -0.3989476, 0.5372549, 1, 0, 1,
-0.6544134, 3.50595, -1.229515, 0.5294118, 1, 0, 1,
-0.6540316, 0.06913489, 1.082439, 0.5254902, 1, 0, 1,
-0.6524099, 0.9955683, -1.274532, 0.5176471, 1, 0, 1,
-0.647802, 0.415015, -2.381108, 0.5137255, 1, 0, 1,
-0.6393017, -1.331559, -2.459755, 0.5058824, 1, 0, 1,
-0.6392406, -0.4404265, -4.251184, 0.5019608, 1, 0, 1,
-0.6385918, -0.3398764, -2.783489, 0.4941176, 1, 0, 1,
-0.6316442, 1.795204, -0.1792024, 0.4862745, 1, 0, 1,
-0.6314417, 0.5315242, -0.648949, 0.4823529, 1, 0, 1,
-0.6312227, -0.204016, -1.388086, 0.4745098, 1, 0, 1,
-0.6304384, -1.665196, -4.536536, 0.4705882, 1, 0, 1,
-0.6272084, 0.1730439, -2.475811, 0.4627451, 1, 0, 1,
-0.6167239, 0.8673344, -0.9763728, 0.4588235, 1, 0, 1,
-0.616598, -0.2421687, -2.62464, 0.4509804, 1, 0, 1,
-0.6157089, -0.9144996, -2.502872, 0.4470588, 1, 0, 1,
-0.6144742, -0.8291111, -2.159041, 0.4392157, 1, 0, 1,
-0.6141201, -0.4340328, -1.055771, 0.4352941, 1, 0, 1,
-0.6119972, 0.2197871, -2.778008, 0.427451, 1, 0, 1,
-0.6113169, -0.4298967, -1.979587, 0.4235294, 1, 0, 1,
-0.602057, 0.926625, -1.536574, 0.4156863, 1, 0, 1,
-0.5995073, -1.586154, -2.23932, 0.4117647, 1, 0, 1,
-0.5968074, -0.9621862, -2.243493, 0.4039216, 1, 0, 1,
-0.5967504, 1.20578, -0.2451364, 0.3960784, 1, 0, 1,
-0.5896324, -0.1899942, -2.228646, 0.3921569, 1, 0, 1,
-0.5895249, -2.071845, -4.442786, 0.3843137, 1, 0, 1,
-0.5870531, -0.7349219, -1.419628, 0.3803922, 1, 0, 1,
-0.584796, 1.232487, 1.662506, 0.372549, 1, 0, 1,
-0.5842726, 0.2814403, -2.873628, 0.3686275, 1, 0, 1,
-0.5819241, 0.5396929, -2.089839, 0.3607843, 1, 0, 1,
-0.5800776, -0.2282593, -2.636831, 0.3568628, 1, 0, 1,
-0.5732656, 1.730892, -0.1853449, 0.3490196, 1, 0, 1,
-0.5731078, -0.9512688, -1.89398, 0.345098, 1, 0, 1,
-0.5731069, -0.9380356, -2.492454, 0.3372549, 1, 0, 1,
-0.5720904, 0.5441115, -0.5000024, 0.3333333, 1, 0, 1,
-0.5720887, 0.4303395, -1.429911, 0.3254902, 1, 0, 1,
-0.5712667, 1.48797, -1.294513, 0.3215686, 1, 0, 1,
-0.5704069, 0.7832897, -0.7428029, 0.3137255, 1, 0, 1,
-0.5688818, -0.9693853, -3.179861, 0.3098039, 1, 0, 1,
-0.5617769, 0.529864, -0.673982, 0.3019608, 1, 0, 1,
-0.5593274, 1.705425, 0.3756079, 0.2941177, 1, 0, 1,
-0.55558, -0.2061125, -3.02905, 0.2901961, 1, 0, 1,
-0.5516737, 1.192699, -1.393683, 0.282353, 1, 0, 1,
-0.5486256, 0.8293269, 0.8531241, 0.2784314, 1, 0, 1,
-0.5471693, -0.8060172, -2.192876, 0.2705882, 1, 0, 1,
-0.5440922, -1.536943, -3.967296, 0.2666667, 1, 0, 1,
-0.5440722, 0.2901314, -0.5170322, 0.2588235, 1, 0, 1,
-0.5426084, 1.473022, 0.2133106, 0.254902, 1, 0, 1,
-0.5380563, 2.403491, -0.9869072, 0.2470588, 1, 0, 1,
-0.5298421, 0.9946165, 0.7058765, 0.2431373, 1, 0, 1,
-0.5182453, -1.594523, -3.033556, 0.2352941, 1, 0, 1,
-0.5143631, 1.328024, -2.077587, 0.2313726, 1, 0, 1,
-0.5133669, -1.391241, -3.577894, 0.2235294, 1, 0, 1,
-0.5103202, -0.3954685, -1.327881, 0.2196078, 1, 0, 1,
-0.5062752, -0.4724599, -2.107166, 0.2117647, 1, 0, 1,
-0.5043821, 1.61902, -0.8792717, 0.2078431, 1, 0, 1,
-0.5007147, -1.429017, -3.242741, 0.2, 1, 0, 1,
-0.4993208, -0.7314916, -2.657803, 0.1921569, 1, 0, 1,
-0.4941967, -0.7150002, -2.461355, 0.1882353, 1, 0, 1,
-0.4920427, -0.6967887, -2.772616, 0.1803922, 1, 0, 1,
-0.4875845, -0.1897803, -2.196317, 0.1764706, 1, 0, 1,
-0.4867322, 0.7520977, 0.2846031, 0.1686275, 1, 0, 1,
-0.4824987, -0.5542248, -2.311944, 0.1647059, 1, 0, 1,
-0.4793512, 1.122517, 0.2090648, 0.1568628, 1, 0, 1,
-0.4777432, -0.1192453, -2.216666, 0.1529412, 1, 0, 1,
-0.476817, 0.6651553, 0.9292238, 0.145098, 1, 0, 1,
-0.4743574, 0.4292862, -0.5413351, 0.1411765, 1, 0, 1,
-0.4743282, 1.736292, -2.44647, 0.1333333, 1, 0, 1,
-0.4712128, 0.2709841, -0.03661317, 0.1294118, 1, 0, 1,
-0.4678314, 0.6809897, -1.252408, 0.1215686, 1, 0, 1,
-0.4672252, 0.4866582, -0.1156949, 0.1176471, 1, 0, 1,
-0.465365, -0.541971, -3.754405, 0.1098039, 1, 0, 1,
-0.463612, -1.096231, -3.01356, 0.1058824, 1, 0, 1,
-0.4629325, 1.328704, -0.647599, 0.09803922, 1, 0, 1,
-0.4493655, 0.9731923, 0.49244, 0.09019608, 1, 0, 1,
-0.4467627, 0.4081432, -0.03887608, 0.08627451, 1, 0, 1,
-0.4324765, -0.2260033, -0.8374277, 0.07843138, 1, 0, 1,
-0.4284925, 0.912818, -1.025449, 0.07450981, 1, 0, 1,
-0.4280126, -1.731919, -2.798519, 0.06666667, 1, 0, 1,
-0.4274278, -0.8166466, -1.352257, 0.0627451, 1, 0, 1,
-0.4228097, 0.08457136, -2.816096, 0.05490196, 1, 0, 1,
-0.4224369, 0.8271241, -1.16347, 0.05098039, 1, 0, 1,
-0.4201241, -0.93761, -4.081218, 0.04313726, 1, 0, 1,
-0.4195868, -1.30821, -2.694364, 0.03921569, 1, 0, 1,
-0.4174962, -1.366825, -2.120129, 0.03137255, 1, 0, 1,
-0.4118855, 1.618226, 1.665617, 0.02745098, 1, 0, 1,
-0.4063627, 0.944768, -1.362632, 0.01960784, 1, 0, 1,
-0.4059496, 0.0092718, -1.133672, 0.01568628, 1, 0, 1,
-0.4056778, -0.2119649, -1.093505, 0.007843138, 1, 0, 1,
-0.4037135, -0.2081854, -2.288475, 0.003921569, 1, 0, 1,
-0.403676, 0.5717701, -0.2672473, 0, 1, 0.003921569, 1,
-0.4036053, -0.3036132, -0.8089609, 0, 1, 0.01176471, 1,
-0.4011754, 0.7843528, -1.02843, 0, 1, 0.01568628, 1,
-0.3994143, -1.174769, -3.703302, 0, 1, 0.02352941, 1,
-0.39886, -0.8424243, -2.580992, 0, 1, 0.02745098, 1,
-0.3896882, 0.2819149, 0.4934252, 0, 1, 0.03529412, 1,
-0.3895583, 0.644366, 0.3615845, 0, 1, 0.03921569, 1,
-0.3886471, -0.758998, -3.830179, 0, 1, 0.04705882, 1,
-0.3879117, -1.474114, -2.426478, 0, 1, 0.05098039, 1,
-0.3870909, 1.785791, -0.7242625, 0, 1, 0.05882353, 1,
-0.3864485, -0.677974, -2.468493, 0, 1, 0.0627451, 1,
-0.3846827, -1.02951, -4.293248, 0, 1, 0.07058824, 1,
-0.3798045, -1.05553, -3.351124, 0, 1, 0.07450981, 1,
-0.3795944, 0.3883033, 0.6347603, 0, 1, 0.08235294, 1,
-0.3795917, -0.04218268, -3.003208, 0, 1, 0.08627451, 1,
-0.3795196, -0.7128695, -3.00111, 0, 1, 0.09411765, 1,
-0.3794214, -0.4415444, -2.837279, 0, 1, 0.1019608, 1,
-0.3714701, -1.400747, -1.927315, 0, 1, 0.1058824, 1,
-0.3702538, 0.3390098, -1.539072, 0, 1, 0.1137255, 1,
-0.3677183, 0.847867, -1.483135, 0, 1, 0.1176471, 1,
-0.3648986, -0.7276947, -3.30251, 0, 1, 0.1254902, 1,
-0.3574082, 0.6517232, -0.6569692, 0, 1, 0.1294118, 1,
-0.3568544, 1.230745, 0.2753461, 0, 1, 0.1372549, 1,
-0.354913, 0.03603487, -1.938858, 0, 1, 0.1411765, 1,
-0.3533092, -0.004397624, -1.438493, 0, 1, 0.1490196, 1,
-0.3526917, 1.169434, 0.4213106, 0, 1, 0.1529412, 1,
-0.3484166, 0.7610075, 1.005481, 0, 1, 0.1607843, 1,
-0.3463117, 0.512042, -0.3545942, 0, 1, 0.1647059, 1,
-0.3450873, -0.3944125, -2.073217, 0, 1, 0.172549, 1,
-0.3447877, 0.9149556, -0.8731844, 0, 1, 0.1764706, 1,
-0.3430084, -1.75532, -3.495993, 0, 1, 0.1843137, 1,
-0.3429872, -1.492891, -3.009306, 0, 1, 0.1882353, 1,
-0.3426017, -0.3697696, -4.085962, 0, 1, 0.1960784, 1,
-0.3351247, 1.001507, 0.3911861, 0, 1, 0.2039216, 1,
-0.3341115, 0.2409328, -0.2120281, 0, 1, 0.2078431, 1,
-0.3338344, -1.001888, -1.221359, 0, 1, 0.2156863, 1,
-0.3317521, 0.8151491, -0.8358219, 0, 1, 0.2196078, 1,
-0.3304857, -0.1123101, -2.938916, 0, 1, 0.227451, 1,
-0.3301368, -0.8934147, -2.979627, 0, 1, 0.2313726, 1,
-0.3275211, -0.8605754, -0.956178, 0, 1, 0.2392157, 1,
-0.3268191, -1.381877, -2.29771, 0, 1, 0.2431373, 1,
-0.315174, -0.180206, -3.808397, 0, 1, 0.2509804, 1,
-0.313012, 0.9961022, 0.1133518, 0, 1, 0.254902, 1,
-0.3117555, 0.3286055, -1.565197, 0, 1, 0.2627451, 1,
-0.3113548, -0.1628536, -2.870275, 0, 1, 0.2666667, 1,
-0.3097943, 0.1019961, -2.712909, 0, 1, 0.2745098, 1,
-0.3059045, -1.290753, -2.12919, 0, 1, 0.2784314, 1,
-0.3051267, -0.9752095, -2.740476, 0, 1, 0.2862745, 1,
-0.3016868, -0.7810638, -3.86289, 0, 1, 0.2901961, 1,
-0.3003361, 0.3540194, -1.114732, 0, 1, 0.2980392, 1,
-0.2964824, 1.686176, 0.1297877, 0, 1, 0.3058824, 1,
-0.2952828, 0.1955902, 0.0165335, 0, 1, 0.3098039, 1,
-0.2943279, -0.9720911, -1.948112, 0, 1, 0.3176471, 1,
-0.2934454, 0.7922956, 0.3761142, 0, 1, 0.3215686, 1,
-0.282811, -0.041944, -0.5714992, 0, 1, 0.3294118, 1,
-0.2762118, 0.2379746, 0.7394565, 0, 1, 0.3333333, 1,
-0.2760486, -0.8664722, -3.126534, 0, 1, 0.3411765, 1,
-0.2756275, 1.372382, -0.949571, 0, 1, 0.345098, 1,
-0.26985, 0.6338408, 0.7458596, 0, 1, 0.3529412, 1,
-0.2671535, -0.8663551, -2.791498, 0, 1, 0.3568628, 1,
-0.2669516, -1.040072, -3.822645, 0, 1, 0.3647059, 1,
-0.2610413, -2.357887, -2.096158, 0, 1, 0.3686275, 1,
-0.2591541, -0.1609563, -1.907178, 0, 1, 0.3764706, 1,
-0.2590067, -0.2852528, -2.949073, 0, 1, 0.3803922, 1,
-0.2560157, 1.215161, -0.4219425, 0, 1, 0.3882353, 1,
-0.2490299, 1.121041, -1.638007, 0, 1, 0.3921569, 1,
-0.2455579, 0.7037004, 1.325024, 0, 1, 0.4, 1,
-0.2452797, 1.318877, -0.09818044, 0, 1, 0.4078431, 1,
-0.2431632, 0.619897, 1.275552, 0, 1, 0.4117647, 1,
-0.2414106, -0.4620966, -2.910263, 0, 1, 0.4196078, 1,
-0.2375396, -0.05040635, -0.5367371, 0, 1, 0.4235294, 1,
-0.2374072, -2.441709, -2.063485, 0, 1, 0.4313726, 1,
-0.2367407, -0.146366, -0.1501887, 0, 1, 0.4352941, 1,
-0.2358673, 2.223662, -0.04779508, 0, 1, 0.4431373, 1,
-0.2344292, 0.7899632, 0.1921217, 0, 1, 0.4470588, 1,
-0.2339022, 0.7486079, -1.791154, 0, 1, 0.454902, 1,
-0.2323404, -0.3274505, -1.058306, 0, 1, 0.4588235, 1,
-0.2300559, -0.6033047, -2.856139, 0, 1, 0.4666667, 1,
-0.2268958, -0.02043278, -1.244892, 0, 1, 0.4705882, 1,
-0.2260625, 0.4211067, 0.5618986, 0, 1, 0.4784314, 1,
-0.2241882, -0.6518883, -3.88469, 0, 1, 0.4823529, 1,
-0.2210463, 0.1659081, -0.4341545, 0, 1, 0.4901961, 1,
-0.2202463, 1.519579, -0.05907485, 0, 1, 0.4941176, 1,
-0.2190707, -0.6710123, -2.844532, 0, 1, 0.5019608, 1,
-0.2186284, 0.7991234, -2.439098, 0, 1, 0.509804, 1,
-0.2163778, -0.03971514, -2.219844, 0, 1, 0.5137255, 1,
-0.2128251, -0.4602866, -2.04734, 0, 1, 0.5215687, 1,
-0.212726, -0.6537243, -2.32045, 0, 1, 0.5254902, 1,
-0.2057246, 0.3792575, -1.29494, 0, 1, 0.5333334, 1,
-0.2043155, -1.006767, -2.574411, 0, 1, 0.5372549, 1,
-0.2015709, 0.5847839, -0.4228228, 0, 1, 0.5450981, 1,
-0.1974586, 0.6849754, -2.863675, 0, 1, 0.5490196, 1,
-0.1958185, -0.1867739, -1.465833, 0, 1, 0.5568628, 1,
-0.1950696, -1.012253, -3.076975, 0, 1, 0.5607843, 1,
-0.1890796, -2.333501, -2.633851, 0, 1, 0.5686275, 1,
-0.1867539, 1.360613, -0.2180207, 0, 1, 0.572549, 1,
-0.1846846, 0.692155, 0.528906, 0, 1, 0.5803922, 1,
-0.1828378, -1.163229, -4.521941, 0, 1, 0.5843138, 1,
-0.1817804, 1.570796, 0.6950752, 0, 1, 0.5921569, 1,
-0.1788727, -1.767534, -3.078308, 0, 1, 0.5960785, 1,
-0.1788289, -0.1162772, -0.7990196, 0, 1, 0.6039216, 1,
-0.1785047, 0.9459033, -0.9776202, 0, 1, 0.6117647, 1,
-0.1773685, 0.8490741, -0.6046869, 0, 1, 0.6156863, 1,
-0.1746945, 0.4072532, 0.1904192, 0, 1, 0.6235294, 1,
-0.1736915, 1.176583, 1.422521, 0, 1, 0.627451, 1,
-0.1725265, 0.8654187, -1.086113, 0, 1, 0.6352941, 1,
-0.1724321, -1.083601, -3.26125, 0, 1, 0.6392157, 1,
-0.1704261, 0.8657357, -0.3290046, 0, 1, 0.6470588, 1,
-0.1693572, -0.1940615, -1.439636, 0, 1, 0.6509804, 1,
-0.1671322, 0.1029062, -0.1034783, 0, 1, 0.6588235, 1,
-0.16712, 0.3937787, 0.4401121, 0, 1, 0.6627451, 1,
-0.1639976, -1.80189, -1.360817, 0, 1, 0.6705883, 1,
-0.1590851, 2.131763, 1.285897, 0, 1, 0.6745098, 1,
-0.157676, 2.386028, 0.4144672, 0, 1, 0.682353, 1,
-0.1556757, -1.381096, -3.337209, 0, 1, 0.6862745, 1,
-0.1519693, 1.29141, 0.2747303, 0, 1, 0.6941177, 1,
-0.1517027, 0.5660437, 0.4029119, 0, 1, 0.7019608, 1,
-0.1513468, 1.032384, -0.9269891, 0, 1, 0.7058824, 1,
-0.1450053, 0.08109137, -1.296901, 0, 1, 0.7137255, 1,
-0.144811, 0.3211247, -1.303954, 0, 1, 0.7176471, 1,
-0.1348399, 0.159575, 1.677513, 0, 1, 0.7254902, 1,
-0.1345666, -0.01776571, -1.004996, 0, 1, 0.7294118, 1,
-0.1315424, 1.363351, -0.3175763, 0, 1, 0.7372549, 1,
-0.130895, 0.3541478, 0.2739112, 0, 1, 0.7411765, 1,
-0.1304322, 1.919626, 0.1523907, 0, 1, 0.7490196, 1,
-0.1279241, -0.2589158, -3.34009, 0, 1, 0.7529412, 1,
-0.1277122, 2.135471, -0.5564834, 0, 1, 0.7607843, 1,
-0.1221839, -0.5987549, -2.257332, 0, 1, 0.7647059, 1,
-0.1210279, 0.2778477, 0.5204704, 0, 1, 0.772549, 1,
-0.1174653, 0.9961315, 0.7363278, 0, 1, 0.7764706, 1,
-0.1066883, 0.4564603, 0.05018546, 0, 1, 0.7843137, 1,
-0.1063097, 0.8566574, -0.3276456, 0, 1, 0.7882353, 1,
-0.10524, -0.3444909, -3.906473, 0, 1, 0.7960784, 1,
-0.1042602, 0.2498647, 0.3108785, 0, 1, 0.8039216, 1,
-0.1018015, -0.5245395, -4.112265, 0, 1, 0.8078431, 1,
-0.1012956, -1.404603, -2.341876, 0, 1, 0.8156863, 1,
-0.09972793, -0.08400305, -1.543034, 0, 1, 0.8196079, 1,
-0.09885397, -0.4509572, -4.714327, 0, 1, 0.827451, 1,
-0.09772079, 0.7537332, -1.164257, 0, 1, 0.8313726, 1,
-0.09192173, -0.7556387, -4.666342, 0, 1, 0.8392157, 1,
-0.08617909, 0.1599851, -1.895496, 0, 1, 0.8431373, 1,
-0.08591621, 1.368281, -0.6077406, 0, 1, 0.8509804, 1,
-0.08565369, 0.05527819, 0.6828393, 0, 1, 0.854902, 1,
-0.07657047, -0.5096121, -2.874999, 0, 1, 0.8627451, 1,
-0.07298744, 0.2291042, 0.9845294, 0, 1, 0.8666667, 1,
-0.06248962, 0.07284476, -0.6009791, 0, 1, 0.8745098, 1,
-0.05878777, -2.08024, -2.672974, 0, 1, 0.8784314, 1,
-0.05617668, 0.7018068, -2.212373, 0, 1, 0.8862745, 1,
-0.05361525, 0.7136328, -0.4854158, 0, 1, 0.8901961, 1,
-0.04602471, 0.562297, -0.4432264, 0, 1, 0.8980392, 1,
-0.03876029, 0.7467783, 0.3144658, 0, 1, 0.9058824, 1,
-0.03793061, -0.6590586, -2.913776, 0, 1, 0.9098039, 1,
-0.03723244, -0.187596, -3.811461, 0, 1, 0.9176471, 1,
-0.0371694, 0.8850695, -1.201918, 0, 1, 0.9215686, 1,
-0.03645036, -0.2967052, -2.323087, 0, 1, 0.9294118, 1,
-0.03540859, -0.1168853, -2.24115, 0, 1, 0.9333333, 1,
-0.03327683, 3.825382, 1.194761, 0, 1, 0.9411765, 1,
-0.03185742, 0.5495231, 0.4452247, 0, 1, 0.945098, 1,
-0.03135356, -2.127628, -2.988063, 0, 1, 0.9529412, 1,
-0.02830157, 1.407514, -0.8607835, 0, 1, 0.9568627, 1,
-0.02162216, 0.7457297, -0.4232232, 0, 1, 0.9647059, 1,
-0.02054152, -0.05941742, -2.730662, 0, 1, 0.9686275, 1,
-0.01982635, -0.8061998, -3.120954, 0, 1, 0.9764706, 1,
-0.01909504, -1.293116, -1.902474, 0, 1, 0.9803922, 1,
-0.01880036, 0.4691597, -0.8435431, 0, 1, 0.9882353, 1,
-0.01499096, 0.6638066, 0.5895965, 0, 1, 0.9921569, 1,
-0.01354236, -1.02376, -1.424009, 0, 1, 1, 1,
-0.01121776, -0.6763382, -2.333304, 0, 0.9921569, 1, 1,
-0.01009152, -0.3334544, -3.741856, 0, 0.9882353, 1, 1,
-0.007983097, -0.665891, -3.83018, 0, 0.9803922, 1, 1,
-0.00755938, 0.8571782, 0.9390942, 0, 0.9764706, 1, 1,
-0.005198432, -1.321178, -3.261321, 0, 0.9686275, 1, 1,
-0.004341959, -0.5247571, -1.311468, 0, 0.9647059, 1, 1,
-0.002467751, -1.004091, -3.761132, 0, 0.9568627, 1, 1,
-0.001073563, -1.182066, -2.716229, 0, 0.9529412, 1, 1,
-0.0009244957, 0.2962829, -0.8190926, 0, 0.945098, 1, 1,
0.0002357994, 1.792836, 0.9239143, 0, 0.9411765, 1, 1,
0.005033073, 0.8149146, 0.6256633, 0, 0.9333333, 1, 1,
0.005875269, 1.365921, 0.5718098, 0, 0.9294118, 1, 1,
0.008481376, 0.539814, -1.02772, 0, 0.9215686, 1, 1,
0.01445294, 1.154905, 0.02072614, 0, 0.9176471, 1, 1,
0.01966489, -1.36502, 2.574499, 0, 0.9098039, 1, 1,
0.02299649, -0.05851836, 2.742233, 0, 0.9058824, 1, 1,
0.03089873, 0.8712821, -1.371286, 0, 0.8980392, 1, 1,
0.03227426, -0.330232, 4.725462, 0, 0.8901961, 1, 1,
0.03411018, 0.5666175, -0.2554072, 0, 0.8862745, 1, 1,
0.03479023, -0.2192498, 1.564096, 0, 0.8784314, 1, 1,
0.03513786, -0.4762764, 3.077755, 0, 0.8745098, 1, 1,
0.04023043, 0.335526, -0.08222295, 0, 0.8666667, 1, 1,
0.04046411, 0.5130929, 0.6427999, 0, 0.8627451, 1, 1,
0.04414151, -1.939458, 3.638749, 0, 0.854902, 1, 1,
0.04497028, -0.587994, 1.280716, 0, 0.8509804, 1, 1,
0.04706054, -0.0397082, 2.575445, 0, 0.8431373, 1, 1,
0.0472546, -0.8400893, 3.562578, 0, 0.8392157, 1, 1,
0.05244065, -0.09514094, 3.207319, 0, 0.8313726, 1, 1,
0.0539938, 0.9521589, 0.08746614, 0, 0.827451, 1, 1,
0.05435687, -1.175367, 2.782587, 0, 0.8196079, 1, 1,
0.0621, 0.1434315, 0.6869985, 0, 0.8156863, 1, 1,
0.06461143, 0.7982092, 1.097786, 0, 0.8078431, 1, 1,
0.06572958, 0.09061108, 1.046395, 0, 0.8039216, 1, 1,
0.06614375, -0.1980191, 2.760967, 0, 0.7960784, 1, 1,
0.06623768, -2.076723, 4.200148, 0, 0.7882353, 1, 1,
0.07126329, 0.09287807, -0.7377572, 0, 0.7843137, 1, 1,
0.07479427, 2.492615, -0.3357106, 0, 0.7764706, 1, 1,
0.07506868, 0.5605628, 1.569358, 0, 0.772549, 1, 1,
0.07689466, 1.303138, -1.22137, 0, 0.7647059, 1, 1,
0.07853074, 1.142834, 0.03464913, 0, 0.7607843, 1, 1,
0.08209741, -0.5347373, 2.960853, 0, 0.7529412, 1, 1,
0.08209778, 0.7557191, -0.2695575, 0, 0.7490196, 1, 1,
0.0880881, -0.06955946, 1.235064, 0, 0.7411765, 1, 1,
0.0884991, -1.624064, 3.219571, 0, 0.7372549, 1, 1,
0.09436165, 0.2993631, 0.00549028, 0, 0.7294118, 1, 1,
0.09572156, -1.207336, 5.20702, 0, 0.7254902, 1, 1,
0.1029592, 0.1603976, -0.5604829, 0, 0.7176471, 1, 1,
0.1054217, -2.023601, 1.463532, 0, 0.7137255, 1, 1,
0.1077891, -0.6978471, 4.301376, 0, 0.7058824, 1, 1,
0.1089436, -1.555035, 3.816906, 0, 0.6980392, 1, 1,
0.1146874, 0.3236009, 0.09871876, 0, 0.6941177, 1, 1,
0.1256847, 0.1164652, 1.254468, 0, 0.6862745, 1, 1,
0.127835, 0.001200175, 3.066354, 0, 0.682353, 1, 1,
0.1285224, 1.992831, 0.8675677, 0, 0.6745098, 1, 1,
0.1345961, -0.7652702, 2.705486, 0, 0.6705883, 1, 1,
0.1358245, -0.3639426, 2.971974, 0, 0.6627451, 1, 1,
0.1397664, -0.5717908, 3.832288, 0, 0.6588235, 1, 1,
0.1511231, -1.421486, 3.628608, 0, 0.6509804, 1, 1,
0.1515873, 0.06765485, 1.540594, 0, 0.6470588, 1, 1,
0.1556749, -0.2087386, 3.487149, 0, 0.6392157, 1, 1,
0.1569939, -0.6333243, 2.207264, 0, 0.6352941, 1, 1,
0.1580204, -0.8449975, 2.154405, 0, 0.627451, 1, 1,
0.1613109, -0.2632657, 2.452443, 0, 0.6235294, 1, 1,
0.1654927, -0.5383123, 3.226062, 0, 0.6156863, 1, 1,
0.1707964, 0.716066, -0.4134362, 0, 0.6117647, 1, 1,
0.1751156, -1.503464, 2.960906, 0, 0.6039216, 1, 1,
0.1768382, -1.273471, 3.80622, 0, 0.5960785, 1, 1,
0.1792348, -0.06227126, 0.9265382, 0, 0.5921569, 1, 1,
0.1804091, 0.2034609, 2.150429, 0, 0.5843138, 1, 1,
0.1865695, -0.1798712, 2.771615, 0, 0.5803922, 1, 1,
0.186704, 1.61644, 0.3395903, 0, 0.572549, 1, 1,
0.1873535, 1.266119, -0.03065073, 0, 0.5686275, 1, 1,
0.1923356, 1.119034, -0.3467243, 0, 0.5607843, 1, 1,
0.1926978, 0.8844568, 0.5445056, 0, 0.5568628, 1, 1,
0.1927155, -0.1181031, 1.779633, 0, 0.5490196, 1, 1,
0.2002128, -0.7238287, 2.540361, 0, 0.5450981, 1, 1,
0.2020306, 0.7927428, -0.5721807, 0, 0.5372549, 1, 1,
0.2049103, 1.670909, 1.666592, 0, 0.5333334, 1, 1,
0.206403, -1.075647, 3.735285, 0, 0.5254902, 1, 1,
0.207166, -1.644881, 1.823719, 0, 0.5215687, 1, 1,
0.2076235, 1.208796, -0.8597043, 0, 0.5137255, 1, 1,
0.2079993, 1.561417, -0.516371, 0, 0.509804, 1, 1,
0.2080074, -1.679078, 3.532366, 0, 0.5019608, 1, 1,
0.2098495, 0.7655389, 0.7527772, 0, 0.4941176, 1, 1,
0.2099305, 3.120496, 0.001519392, 0, 0.4901961, 1, 1,
0.210079, 0.2926324, -0.8180706, 0, 0.4823529, 1, 1,
0.2147215, 0.2601192, 0.1846126, 0, 0.4784314, 1, 1,
0.2156672, 0.3308451, 2.609264, 0, 0.4705882, 1, 1,
0.2164928, -0.08378836, 2.808186, 0, 0.4666667, 1, 1,
0.2192198, -0.7124105, 0.3317628, 0, 0.4588235, 1, 1,
0.220982, 0.06085015, 1.975287, 0, 0.454902, 1, 1,
0.2225075, -1.235043, 3.074571, 0, 0.4470588, 1, 1,
0.2242727, -0.7002804, 3.691202, 0, 0.4431373, 1, 1,
0.2265539, -0.8142456, 5.109709, 0, 0.4352941, 1, 1,
0.2286628, 0.787761, -0.6234953, 0, 0.4313726, 1, 1,
0.2317534, 0.9458676, -0.3532434, 0, 0.4235294, 1, 1,
0.231878, -0.9111449, 3.38871, 0, 0.4196078, 1, 1,
0.2331775, 0.3737098, 1.073328, 0, 0.4117647, 1, 1,
0.2332847, 1.301341, 2.004403, 0, 0.4078431, 1, 1,
0.2334271, -0.7401314, 2.429283, 0, 0.4, 1, 1,
0.2354492, 2.092017, 0.6057065, 0, 0.3921569, 1, 1,
0.2364203, 0.06758913, 3.873864, 0, 0.3882353, 1, 1,
0.2398423, -0.07940672, 1.362443, 0, 0.3803922, 1, 1,
0.2415618, 1.241751, 0.1355264, 0, 0.3764706, 1, 1,
0.2449485, 1.825936, 0.2925568, 0, 0.3686275, 1, 1,
0.2509039, 1.5719, -1.226857, 0, 0.3647059, 1, 1,
0.2521958, -2.285551, 2.154875, 0, 0.3568628, 1, 1,
0.2529636, 1.355559, 0.3797335, 0, 0.3529412, 1, 1,
0.2538118, -0.9201548, 4.01253, 0, 0.345098, 1, 1,
0.2625118, 1.518837, -0.2294206, 0, 0.3411765, 1, 1,
0.264656, 0.1277046, -0.5727698, 0, 0.3333333, 1, 1,
0.2657284, -1.169927, 1.563801, 0, 0.3294118, 1, 1,
0.2667144, 0.7313347, -0.5022697, 0, 0.3215686, 1, 1,
0.2751448, -0.1009029, 1.59324, 0, 0.3176471, 1, 1,
0.2786922, -0.7221195, 3.075577, 0, 0.3098039, 1, 1,
0.2913039, 1.345667, -0.9715866, 0, 0.3058824, 1, 1,
0.2937697, -0.6352069, 3.611429, 0, 0.2980392, 1, 1,
0.2948923, 0.6987944, 0.1144851, 0, 0.2901961, 1, 1,
0.2954821, -0.08292998, 0.8267592, 0, 0.2862745, 1, 1,
0.296054, 0.4727083, -0.1715555, 0, 0.2784314, 1, 1,
0.2969074, -0.7683957, 2.104763, 0, 0.2745098, 1, 1,
0.2998296, 0.880516, 0.008069567, 0, 0.2666667, 1, 1,
0.3065552, -1.338288, 3.373714, 0, 0.2627451, 1, 1,
0.3078295, 1.832747, -1.36262, 0, 0.254902, 1, 1,
0.3143931, 0.5966742, 0.1937981, 0, 0.2509804, 1, 1,
0.3172512, 1.072346, -0.7279913, 0, 0.2431373, 1, 1,
0.3172886, 1.363289, 0.1102697, 0, 0.2392157, 1, 1,
0.32152, 0.4120138, -1.500334, 0, 0.2313726, 1, 1,
0.3219705, -0.5525831, 1.532322, 0, 0.227451, 1, 1,
0.3229081, -0.7427426, 1.6271, 0, 0.2196078, 1, 1,
0.3235256, 0.2660115, 1.969984, 0, 0.2156863, 1, 1,
0.3295902, -1.221354, 1.598595, 0, 0.2078431, 1, 1,
0.3298557, -0.6165522, -0.5574241, 0, 0.2039216, 1, 1,
0.331359, 2.496125, 0.8649293, 0, 0.1960784, 1, 1,
0.3321436, -0.619668, 4.592619, 0, 0.1882353, 1, 1,
0.3324127, 2.097434, 1.077308, 0, 0.1843137, 1, 1,
0.3376483, 1.650768, -1.160858, 0, 0.1764706, 1, 1,
0.3384506, -0.3366231, 3.649172, 0, 0.172549, 1, 1,
0.3416458, -1.199379, 2.484116, 0, 0.1647059, 1, 1,
0.34277, 0.7570965, 0.8593217, 0, 0.1607843, 1, 1,
0.3442751, -0.4287406, 2.506877, 0, 0.1529412, 1, 1,
0.3498315, -0.125861, 3.031995, 0, 0.1490196, 1, 1,
0.3544078, 0.1376871, 2.730401, 0, 0.1411765, 1, 1,
0.3582006, -0.2018188, 1.545799, 0, 0.1372549, 1, 1,
0.3619461, -0.6319885, 1.862945, 0, 0.1294118, 1, 1,
0.3698963, 0.7741259, -1.07064, 0, 0.1254902, 1, 1,
0.378754, -0.1151671, 1.907508, 0, 0.1176471, 1, 1,
0.3803644, -0.1873034, 1.229045, 0, 0.1137255, 1, 1,
0.3824879, -2.286757, 3.409334, 0, 0.1058824, 1, 1,
0.3864816, -0.4832803, 0.7049769, 0, 0.09803922, 1, 1,
0.3886212, 0.02623422, 2.586676, 0, 0.09411765, 1, 1,
0.3905683, -1.638698, 2.96231, 0, 0.08627451, 1, 1,
0.3909429, 2.386847, 0.8776885, 0, 0.08235294, 1, 1,
0.3914731, -0.1246543, 1.915174, 0, 0.07450981, 1, 1,
0.3951082, 0.3241074, -0.2061081, 0, 0.07058824, 1, 1,
0.3978985, 1.139989, 1.209681, 0, 0.0627451, 1, 1,
0.4003322, -0.3028907, 2.630727, 0, 0.05882353, 1, 1,
0.403495, -1.102753, 2.608528, 0, 0.05098039, 1, 1,
0.4036834, 0.06774735, 1.494601, 0, 0.04705882, 1, 1,
0.4046311, -0.07950268, 0.50094, 0, 0.03921569, 1, 1,
0.4078947, 1.427178, -1.041096, 0, 0.03529412, 1, 1,
0.4079749, -0.1924997, 1.855427, 0, 0.02745098, 1, 1,
0.4265657, -0.9956129, 3.237369, 0, 0.02352941, 1, 1,
0.4277738, 0.7952775, 0.5592862, 0, 0.01568628, 1, 1,
0.4326342, 0.2667266, 0.000746201, 0, 0.01176471, 1, 1,
0.4367296, 1.063353, -0.3587491, 0, 0.003921569, 1, 1,
0.4399819, -0.5513146, 4.273255, 0.003921569, 0, 1, 1,
0.4414467, 0.852253, 0.3950737, 0.007843138, 0, 1, 1,
0.4480214, -0.4765792, 3.507434, 0.01568628, 0, 1, 1,
0.4533755, -0.08379235, 1.365811, 0.01960784, 0, 1, 1,
0.4544555, -0.4707781, 2.512267, 0.02745098, 0, 1, 1,
0.4551047, 0.4075418, 1.190936, 0.03137255, 0, 1, 1,
0.4565732, -0.9684388, 2.066621, 0.03921569, 0, 1, 1,
0.4573341, 1.746171, -0.4239435, 0.04313726, 0, 1, 1,
0.4607045, 0.5788333, 1.491943, 0.05098039, 0, 1, 1,
0.4610236, 0.4547892, 2.327769, 0.05490196, 0, 1, 1,
0.461961, 0.5548192, 1.768372, 0.0627451, 0, 1, 1,
0.4647527, 1.104443, 1.218135, 0.06666667, 0, 1, 1,
0.4668632, 0.7622206, -0.7199742, 0.07450981, 0, 1, 1,
0.4712204, -0.138787, 1.520371, 0.07843138, 0, 1, 1,
0.4855524, 0.1918885, 1.25653, 0.08627451, 0, 1, 1,
0.4884927, -1.089418, 1.899327, 0.09019608, 0, 1, 1,
0.4893817, -1.867509, 1.066618, 0.09803922, 0, 1, 1,
0.4908752, -0.5624865, 1.690243, 0.1058824, 0, 1, 1,
0.4922224, -0.655345, 3.498336, 0.1098039, 0, 1, 1,
0.4930062, 0.2613364, 1.251193, 0.1176471, 0, 1, 1,
0.4953192, -1.203113, 2.848531, 0.1215686, 0, 1, 1,
0.4999958, 0.2550363, 1.980343, 0.1294118, 0, 1, 1,
0.500521, 0.5199286, 0.8540961, 0.1333333, 0, 1, 1,
0.5014129, 0.4101898, -0.792394, 0.1411765, 0, 1, 1,
0.5025465, -0.7359833, 2.409062, 0.145098, 0, 1, 1,
0.5052566, 0.9079191, 0.2326702, 0.1529412, 0, 1, 1,
0.5073019, 0.9892727, 0.875616, 0.1568628, 0, 1, 1,
0.5088665, -1.008528, 2.919286, 0.1647059, 0, 1, 1,
0.509586, 0.718438, -0.6044773, 0.1686275, 0, 1, 1,
0.5150364, 1.947706, -0.1127639, 0.1764706, 0, 1, 1,
0.5189815, -1.605255, 3.15542, 0.1803922, 0, 1, 1,
0.5222721, 1.346015, -0.7471847, 0.1882353, 0, 1, 1,
0.528502, 0.08144474, 0.4931283, 0.1921569, 0, 1, 1,
0.5359312, -0.0458742, 2.562631, 0.2, 0, 1, 1,
0.537563, -0.5717642, 2.30345, 0.2078431, 0, 1, 1,
0.5393849, 0.8454907, 0.9382786, 0.2117647, 0, 1, 1,
0.5398992, 1.607574, 1.707141, 0.2196078, 0, 1, 1,
0.5422795, 0.8385046, -0.07658385, 0.2235294, 0, 1, 1,
0.5434485, 0.03192138, -0.2937485, 0.2313726, 0, 1, 1,
0.5448707, 0.8372676, 0.3286663, 0.2352941, 0, 1, 1,
0.5458117, -0.4024619, 2.50882, 0.2431373, 0, 1, 1,
0.5568947, 0.6049396, -0.2254631, 0.2470588, 0, 1, 1,
0.5656899, 0.6904811, 1.952758, 0.254902, 0, 1, 1,
0.5715894, 0.05941098, 3.676406, 0.2588235, 0, 1, 1,
0.5718539, 0.8205554, 2.457217, 0.2666667, 0, 1, 1,
0.5849095, -1.034712, 0.5522891, 0.2705882, 0, 1, 1,
0.5868394, -0.05530829, 3.390676, 0.2784314, 0, 1, 1,
0.5931852, 0.6153344, 0.7253057, 0.282353, 0, 1, 1,
0.5993375, -0.2785208, -0.3579679, 0.2901961, 0, 1, 1,
0.6020586, 1.016922, -0.337251, 0.2941177, 0, 1, 1,
0.6031375, -1.318827, 1.830417, 0.3019608, 0, 1, 1,
0.6041041, 0.08163914, 0.6840462, 0.3098039, 0, 1, 1,
0.6080012, -1.039396, 4.660453, 0.3137255, 0, 1, 1,
0.6090069, 1.166214, 0.1992045, 0.3215686, 0, 1, 1,
0.6096128, 1.410287, 0.893932, 0.3254902, 0, 1, 1,
0.6105965, 0.4531642, 2.656809, 0.3333333, 0, 1, 1,
0.6146415, -0.4229356, -0.1227192, 0.3372549, 0, 1, 1,
0.6158025, 0.5624537, 2.006812, 0.345098, 0, 1, 1,
0.6164774, -2.032696, 1.591647, 0.3490196, 0, 1, 1,
0.619674, 0.1933152, 0.4828919, 0.3568628, 0, 1, 1,
0.6224235, -1.36785, 2.765498, 0.3607843, 0, 1, 1,
0.6322159, 1.628611, 1.51475, 0.3686275, 0, 1, 1,
0.6354668, -1.195324, 1.736449, 0.372549, 0, 1, 1,
0.6401684, -1.984649, 3.295445, 0.3803922, 0, 1, 1,
0.6420067, -0.1987239, 2.362571, 0.3843137, 0, 1, 1,
0.6525393, -1.395973, 2.759843, 0.3921569, 0, 1, 1,
0.6549463, -0.5130078, 4.531466, 0.3960784, 0, 1, 1,
0.6573811, 0.6576228, 0.9191383, 0.4039216, 0, 1, 1,
0.6614851, 0.2606952, 3.103012, 0.4117647, 0, 1, 1,
0.6619365, 1.909316, 0.5457896, 0.4156863, 0, 1, 1,
0.6622179, -0.22889, 4.461386, 0.4235294, 0, 1, 1,
0.6681351, -0.1657638, 1.178769, 0.427451, 0, 1, 1,
0.669866, 0.05663386, 3.634588, 0.4352941, 0, 1, 1,
0.6722096, 1.258735, -1.489435, 0.4392157, 0, 1, 1,
0.6798807, 0.2914147, 1.695039, 0.4470588, 0, 1, 1,
0.6935923, -0.5490489, 3.210827, 0.4509804, 0, 1, 1,
0.6975089, -1.561426, 0.3236482, 0.4588235, 0, 1, 1,
0.701116, 1.393457, 1.038616, 0.4627451, 0, 1, 1,
0.7023031, -0.2043043, 1.276389, 0.4705882, 0, 1, 1,
0.7056259, -0.1866808, 1.582496, 0.4745098, 0, 1, 1,
0.7165921, -1.837426, 4.155286, 0.4823529, 0, 1, 1,
0.7175455, 0.6779584, 1.015478, 0.4862745, 0, 1, 1,
0.7188649, -0.1677662, 1.245512, 0.4941176, 0, 1, 1,
0.7201346, -0.3488626, 2.504312, 0.5019608, 0, 1, 1,
0.7246005, 0.09099034, 1.547121, 0.5058824, 0, 1, 1,
0.7262899, 0.08584774, 3.775442, 0.5137255, 0, 1, 1,
0.7436234, 0.815991, -0.6609382, 0.5176471, 0, 1, 1,
0.744803, -0.6739649, 1.330102, 0.5254902, 0, 1, 1,
0.745232, 0.7138745, 0.2704507, 0.5294118, 0, 1, 1,
0.7508862, -0.2083233, 1.855602, 0.5372549, 0, 1, 1,
0.7519341, 0.009761881, 1.685412, 0.5411765, 0, 1, 1,
0.7534792, -1.104337, 4.514892, 0.5490196, 0, 1, 1,
0.754023, 0.6441637, 1.965959, 0.5529412, 0, 1, 1,
0.7617205, -1.307946, 2.077724, 0.5607843, 0, 1, 1,
0.7676131, 0.2297579, 1.461613, 0.5647059, 0, 1, 1,
0.7721446, -0.09265094, 3.114259, 0.572549, 0, 1, 1,
0.7749166, 0.9701912, 2.470879, 0.5764706, 0, 1, 1,
0.7764814, 1.323064, 0.5617231, 0.5843138, 0, 1, 1,
0.784905, -0.6001642, 0.4787025, 0.5882353, 0, 1, 1,
0.7873287, -0.5490048, 1.069724, 0.5960785, 0, 1, 1,
0.7952142, 1.988665, 2.624348, 0.6039216, 0, 1, 1,
0.7965758, -0.7019299, 1.555738, 0.6078432, 0, 1, 1,
0.7969668, 1.051041, 0.6716022, 0.6156863, 0, 1, 1,
0.800205, 1.64474, -1.65677, 0.6196079, 0, 1, 1,
0.802179, 0.6188787, 0.3390295, 0.627451, 0, 1, 1,
0.8049509, 1.612146, 1.581092, 0.6313726, 0, 1, 1,
0.808919, 0.9690369, 1.967178, 0.6392157, 0, 1, 1,
0.8106835, -1.129671, 2.874224, 0.6431373, 0, 1, 1,
0.8118138, 1.075583, 0.7590412, 0.6509804, 0, 1, 1,
0.8188218, 0.2575403, 0.8200716, 0.654902, 0, 1, 1,
0.8189868, 0.6700385, 1.677808, 0.6627451, 0, 1, 1,
0.8274627, -0.3692318, 2.357045, 0.6666667, 0, 1, 1,
0.8289393, 2.672678, 1.387924, 0.6745098, 0, 1, 1,
0.8299864, -0.3787581, 1.377982, 0.6784314, 0, 1, 1,
0.8373107, -0.7540504, 2.457371, 0.6862745, 0, 1, 1,
0.8449394, -0.6667184, 0.7519731, 0.6901961, 0, 1, 1,
0.8464673, -0.6621911, 2.400158, 0.6980392, 0, 1, 1,
0.8547275, -0.7596326, 0.8568602, 0.7058824, 0, 1, 1,
0.859572, -1.07371, 5.092414, 0.7098039, 0, 1, 1,
0.8602017, 0.7035986, 0.2594835, 0.7176471, 0, 1, 1,
0.8669729, -1.177329, 2.297272, 0.7215686, 0, 1, 1,
0.8687893, 0.2830078, 2.789283, 0.7294118, 0, 1, 1,
0.8762795, -0.743315, 1.485988, 0.7333333, 0, 1, 1,
0.876883, 0.5586312, -0.1265572, 0.7411765, 0, 1, 1,
0.8772358, -1.888734, 2.717719, 0.7450981, 0, 1, 1,
0.8792735, -0.3714361, 0.1832552, 0.7529412, 0, 1, 1,
0.8825641, 0.5328113, -0.1564566, 0.7568628, 0, 1, 1,
0.8875426, -0.6070031, 1.405392, 0.7647059, 0, 1, 1,
0.8887765, -0.8638736, 2.604663, 0.7686275, 0, 1, 1,
0.8908232, 0.3694083, 1.063276, 0.7764706, 0, 1, 1,
0.89096, 1.96621, 0.8925832, 0.7803922, 0, 1, 1,
0.8935638, 0.8186482, -0.5167289, 0.7882353, 0, 1, 1,
0.8938741, 0.2908163, 1.943317, 0.7921569, 0, 1, 1,
0.8939089, -0.02504712, 4.004611, 0.8, 0, 1, 1,
0.8948194, 1.256569, 1.52501, 0.8078431, 0, 1, 1,
0.9039167, 0.7315947, 1.207418, 0.8117647, 0, 1, 1,
0.9083398, -0.2385962, 2.891988, 0.8196079, 0, 1, 1,
0.9087391, 0.685848, 0.9541855, 0.8235294, 0, 1, 1,
0.9133554, 1.059625, 1.737817, 0.8313726, 0, 1, 1,
0.9147089, 1.073893, -0.08373527, 0.8352941, 0, 1, 1,
0.9159821, 0.8753738, -0.3002897, 0.8431373, 0, 1, 1,
0.9179235, -0.941012, 2.360425, 0.8470588, 0, 1, 1,
0.9292601, -0.4113936, 2.017417, 0.854902, 0, 1, 1,
0.9315993, -0.7282704, 2.143724, 0.8588235, 0, 1, 1,
0.937205, 0.6014525, 0.8159495, 0.8666667, 0, 1, 1,
0.9374767, -1.757255, 1.644212, 0.8705882, 0, 1, 1,
0.9395849, 1.276705, 1.804838, 0.8784314, 0, 1, 1,
0.940537, 0.2061044, 0.839341, 0.8823529, 0, 1, 1,
0.9412196, -0.3863915, 2.049601, 0.8901961, 0, 1, 1,
0.943665, 0.1772475, 1.215234, 0.8941177, 0, 1, 1,
0.9506959, 0.1903692, 1.033244, 0.9019608, 0, 1, 1,
0.956751, -0.7368279, 1.529477, 0.9098039, 0, 1, 1,
0.9604275, -0.5465501, 1.424221, 0.9137255, 0, 1, 1,
0.9623452, -1.087579, 2.255471, 0.9215686, 0, 1, 1,
0.9646272, 0.0348177, 2.766972, 0.9254902, 0, 1, 1,
0.9711298, 0.4525017, 0.215047, 0.9333333, 0, 1, 1,
0.9785767, -0.2412514, 2.926287, 0.9372549, 0, 1, 1,
0.9791732, -0.1364277, 1.559892, 0.945098, 0, 1, 1,
0.981321, -0.9830198, 1.935015, 0.9490196, 0, 1, 1,
0.9858349, -0.2742811, 0.9315528, 0.9568627, 0, 1, 1,
0.9881476, 0.2508735, 3.32091, 0.9607843, 0, 1, 1,
0.9902523, 1.423151, 1.113188, 0.9686275, 0, 1, 1,
0.9961105, -1.738898, 4.230922, 0.972549, 0, 1, 1,
1.004815, -0.9794842, 2.398315, 0.9803922, 0, 1, 1,
1.016305, -1.011214, 1.034087, 0.9843137, 0, 1, 1,
1.023006, 0.8592067, 0.592326, 0.9921569, 0, 1, 1,
1.024133, -1.88503, 1.447467, 0.9960784, 0, 1, 1,
1.027651, 0.7301663, 0.2232424, 1, 0, 0.9960784, 1,
1.036821, -0.02272382, 2.309975, 1, 0, 0.9882353, 1,
1.03738, 1.333702, -0.1353533, 1, 0, 0.9843137, 1,
1.044351, 0.8946965, 0.7946029, 1, 0, 0.9764706, 1,
1.045777, -0.06212094, 1.480726, 1, 0, 0.972549, 1,
1.047324, 0.5728671, -0.8187751, 1, 0, 0.9647059, 1,
1.053267, 0.05608699, 1.11161, 1, 0, 0.9607843, 1,
1.055466, 1.445921, 2.089569, 1, 0, 0.9529412, 1,
1.057564, 0.7742923, 1.407479, 1, 0, 0.9490196, 1,
1.068451, -1.505783, 2.216389, 1, 0, 0.9411765, 1,
1.07361, 0.0626045, 3.145171, 1, 0, 0.9372549, 1,
1.076679, -0.6926804, 1.503277, 1, 0, 0.9294118, 1,
1.077887, 0.4503183, 0.6970378, 1, 0, 0.9254902, 1,
1.07944, -0.2382285, 3.105348, 1, 0, 0.9176471, 1,
1.087697, -0.6488109, 1.961399, 1, 0, 0.9137255, 1,
1.089329, -0.8059691, 2.305078, 1, 0, 0.9058824, 1,
1.0905, -0.1409954, -0.2444111, 1, 0, 0.9019608, 1,
1.091555, 0.2716648, 2.488422, 1, 0, 0.8941177, 1,
1.093101, 0.3277137, 0.7156054, 1, 0, 0.8862745, 1,
1.095393, 0.2002772, 1.137991, 1, 0, 0.8823529, 1,
1.095626, -0.9179532, 3.264583, 1, 0, 0.8745098, 1,
1.097432, -0.3413851, 1.751701, 1, 0, 0.8705882, 1,
1.101241, -0.03734897, 1.195441, 1, 0, 0.8627451, 1,
1.112301, -1.010353, 3.772128, 1, 0, 0.8588235, 1,
1.11649, -1.919406, 2.602926, 1, 0, 0.8509804, 1,
1.119784, -0.9924749, 1.95349, 1, 0, 0.8470588, 1,
1.12131, 0.6236666, -1.157645, 1, 0, 0.8392157, 1,
1.138898, -2.256191, 2.477369, 1, 0, 0.8352941, 1,
1.160631, 0.2648482, 2.403142, 1, 0, 0.827451, 1,
1.162501, -0.3870334, 3.061415, 1, 0, 0.8235294, 1,
1.17355, 0.3021139, 0.8906067, 1, 0, 0.8156863, 1,
1.174376, 0.3397693, 0.7035673, 1, 0, 0.8117647, 1,
1.176437, 0.04967453, 3.034277, 1, 0, 0.8039216, 1,
1.178793, -0.458218, 2.374357, 1, 0, 0.7960784, 1,
1.181069, -1.973931, 1.33609, 1, 0, 0.7921569, 1,
1.183478, 1.16065, 0.005848308, 1, 0, 0.7843137, 1,
1.184121, -0.1828379, 0.7643777, 1, 0, 0.7803922, 1,
1.190826, -2.45586, 3.028165, 1, 0, 0.772549, 1,
1.192804, -0.09302773, 0.7695903, 1, 0, 0.7686275, 1,
1.193403, -0.1355331, 1.590276, 1, 0, 0.7607843, 1,
1.198336, -0.3554774, 1.132931, 1, 0, 0.7568628, 1,
1.20691, 1.527126, 1.851766, 1, 0, 0.7490196, 1,
1.212056, 1.094148, 1.518024, 1, 0, 0.7450981, 1,
1.214788, -1.920247, 1.732783, 1, 0, 0.7372549, 1,
1.234315, 0.1458925, 2.541218, 1, 0, 0.7333333, 1,
1.238372, -1.912487, 4.094018, 1, 0, 0.7254902, 1,
1.249147, 0.9987762, 0.672942, 1, 0, 0.7215686, 1,
1.257352, 0.02308912, -1.12373, 1, 0, 0.7137255, 1,
1.260375, 0.832958, 1.376334, 1, 0, 0.7098039, 1,
1.2672, -0.1794066, 1.730871, 1, 0, 0.7019608, 1,
1.27063, 1.358927, 2.566286, 1, 0, 0.6941177, 1,
1.27289, 0.4980491, 3.708477, 1, 0, 0.6901961, 1,
1.27476, 1.170022, 1.523704, 1, 0, 0.682353, 1,
1.27829, 0.5014425, 3.708163, 1, 0, 0.6784314, 1,
1.28063, 0.5340471, 1.508385, 1, 0, 0.6705883, 1,
1.285352, -2.302821, 1.970507, 1, 0, 0.6666667, 1,
1.288431, 1.950987, 0.2639124, 1, 0, 0.6588235, 1,
1.289546, 0.6724076, 1.991108, 1, 0, 0.654902, 1,
1.299672, 2.377675, -0.165858, 1, 0, 0.6470588, 1,
1.303398, -0.6750296, 1.155057, 1, 0, 0.6431373, 1,
1.321732, -0.5326749, 2.987051, 1, 0, 0.6352941, 1,
1.341812, 1.033137, 1.072169, 1, 0, 0.6313726, 1,
1.349833, -0.3397133, 1.348747, 1, 0, 0.6235294, 1,
1.351672, -0.3640542, 1.316334, 1, 0, 0.6196079, 1,
1.360409, 0.6974756, 0.8786116, 1, 0, 0.6117647, 1,
1.363077, 0.535858, 1.366806, 1, 0, 0.6078432, 1,
1.369941, 0.9328073, 0.5008071, 1, 0, 0.6, 1,
1.373232, 0.9444595, -0.08003782, 1, 0, 0.5921569, 1,
1.374951, -2.005384, 3.463284, 1, 0, 0.5882353, 1,
1.37735, -0.6649647, 2.438129, 1, 0, 0.5803922, 1,
1.378731, -0.6696427, 1.540255, 1, 0, 0.5764706, 1,
1.379949, -1.332476, 1.498435, 1, 0, 0.5686275, 1,
1.386873, 1.3483, 0.86035, 1, 0, 0.5647059, 1,
1.413137, 1.29275, -0.1768609, 1, 0, 0.5568628, 1,
1.417971, -1.993144, 0.8708161, 1, 0, 0.5529412, 1,
1.421344, -0.5804935, 1.776252, 1, 0, 0.5450981, 1,
1.423388, -0.6181471, 1.502334, 1, 0, 0.5411765, 1,
1.429541, 0.3831725, 1.658661, 1, 0, 0.5333334, 1,
1.433792, 0.8224617, 0.9430979, 1, 0, 0.5294118, 1,
1.440013, 0.3392163, 2.360334, 1, 0, 0.5215687, 1,
1.442839, 1.031973, 0.08029166, 1, 0, 0.5176471, 1,
1.445208, 0.3129959, 0.4691513, 1, 0, 0.509804, 1,
1.445735, -0.3883379, 2.600863, 1, 0, 0.5058824, 1,
1.45051, 0.9136637, -0.1950388, 1, 0, 0.4980392, 1,
1.459232, -1.095873, 0.9081413, 1, 0, 0.4901961, 1,
1.46984, -0.8098412, 2.09766, 1, 0, 0.4862745, 1,
1.476864, -0.4614886, 2.415347, 1, 0, 0.4784314, 1,
1.478208, 1.744881, 0.1236375, 1, 0, 0.4745098, 1,
1.483586, 0.2196004, 1.221105, 1, 0, 0.4666667, 1,
1.499403, -1.842003, 2.494709, 1, 0, 0.4627451, 1,
1.502085, -0.5946789, 1.315242, 1, 0, 0.454902, 1,
1.502789, 0.1127119, 2.695103, 1, 0, 0.4509804, 1,
1.505502, -0.8947319, 1.639944, 1, 0, 0.4431373, 1,
1.521535, -0.1154132, 1.390482, 1, 0, 0.4392157, 1,
1.54508, -0.03266469, 2.405678, 1, 0, 0.4313726, 1,
1.551872, 1.745309, 0.9847015, 1, 0, 0.427451, 1,
1.553082, 0.237878, 1.593658, 1, 0, 0.4196078, 1,
1.55566, -0.9165419, 1.384211, 1, 0, 0.4156863, 1,
1.55587, -2.446113, 2.084034, 1, 0, 0.4078431, 1,
1.561206, -0.09622052, 3.927794, 1, 0, 0.4039216, 1,
1.569533, 0.04077687, 0.3084475, 1, 0, 0.3960784, 1,
1.572423, 0.9573308, 0.6473438, 1, 0, 0.3882353, 1,
1.577642, 0.2416951, 0.4470969, 1, 0, 0.3843137, 1,
1.581608, -0.2444581, 3.112046, 1, 0, 0.3764706, 1,
1.583382, -0.1791632, 0.6583835, 1, 0, 0.372549, 1,
1.586363, -1.001184, 2.35266, 1, 0, 0.3647059, 1,
1.598667, 0.5912866, 2.396461, 1, 0, 0.3607843, 1,
1.606278, 0.2669419, 1.925698, 1, 0, 0.3529412, 1,
1.609284, 0.6612266, 0.6508558, 1, 0, 0.3490196, 1,
1.612217, 1.484136, 1.600219, 1, 0, 0.3411765, 1,
1.642718, -0.1021679, -0.1218087, 1, 0, 0.3372549, 1,
1.666797, -1.006289, 1.494218, 1, 0, 0.3294118, 1,
1.66757, 0.7152525, 1.610606, 1, 0, 0.3254902, 1,
1.671486, 0.5487523, 2.232917, 1, 0, 0.3176471, 1,
1.672109, -1.279399, 2.573195, 1, 0, 0.3137255, 1,
1.673736, 1.120531, -0.6388763, 1, 0, 0.3058824, 1,
1.674729, 1.002735, 0.1161075, 1, 0, 0.2980392, 1,
1.678241, -0.5724965, 1.289057, 1, 0, 0.2941177, 1,
1.67971, -0.9442717, 1.915336, 1, 0, 0.2862745, 1,
1.704561, 1.694926, -0.7028326, 1, 0, 0.282353, 1,
1.72802, 1.309393, 0.3498744, 1, 0, 0.2745098, 1,
1.73729, 1.154988, 1.207969, 1, 0, 0.2705882, 1,
1.743756, 0.1818097, 2.461577, 1, 0, 0.2627451, 1,
1.744931, 1.438401, 1.062493, 1, 0, 0.2588235, 1,
1.754314, -1.336419, 1.429935, 1, 0, 0.2509804, 1,
1.770117, 0.1792822, 2.006605, 1, 0, 0.2470588, 1,
1.786588, 0.1337225, 2.707295, 1, 0, 0.2392157, 1,
1.798972, 0.513636, 1.714239, 1, 0, 0.2352941, 1,
1.801091, 1.50541, 0.8437879, 1, 0, 0.227451, 1,
1.801834, 0.5620148, 2.261384, 1, 0, 0.2235294, 1,
1.819114, 0.5499529, 1.721565, 1, 0, 0.2156863, 1,
1.820135, 1.337187, 0.7523981, 1, 0, 0.2117647, 1,
1.824903, 0.788816, 0.961612, 1, 0, 0.2039216, 1,
1.837517, -1.837762, 2.427203, 1, 0, 0.1960784, 1,
1.842157, 0.8377641, 1.309842, 1, 0, 0.1921569, 1,
1.859586, 0.4106157, 0.9667691, 1, 0, 0.1843137, 1,
1.891672, -2.41242, 2.389984, 1, 0, 0.1803922, 1,
1.914799, 1.253284, 1.238131, 1, 0, 0.172549, 1,
1.919617, 0.6418632, 1.176371, 1, 0, 0.1686275, 1,
1.939832, -2.305732, 2.170009, 1, 0, 0.1607843, 1,
1.94354, -0.07245518, 1.170438, 1, 0, 0.1568628, 1,
1.949245, -1.408613, 3.182572, 1, 0, 0.1490196, 1,
1.951984, -1.65152, 2.020859, 1, 0, 0.145098, 1,
1.969118, 1.077913, 1.621733, 1, 0, 0.1372549, 1,
1.969605, -1.233058, 2.427603, 1, 0, 0.1333333, 1,
1.981644, -0.5096164, 2.418864, 1, 0, 0.1254902, 1,
1.982614, -1.227259, 2.96203, 1, 0, 0.1215686, 1,
1.985204, -0.4482059, 2.32681, 1, 0, 0.1137255, 1,
2.025171, 0.1487026, 1.501718, 1, 0, 0.1098039, 1,
2.077647, -1.373429, 2.328944, 1, 0, 0.1019608, 1,
2.133656, 0.4245626, 1.149251, 1, 0, 0.09411765, 1,
2.140773, -0.8237265, 3.303341, 1, 0, 0.09019608, 1,
2.155206, -0.4590605, 1.341931, 1, 0, 0.08235294, 1,
2.158128, 1.482051, 0.3508961, 1, 0, 0.07843138, 1,
2.199381, -0.6599851, 1.894288, 1, 0, 0.07058824, 1,
2.234064, -0.04818134, 0.905405, 1, 0, 0.06666667, 1,
2.282351, -1.437652, 2.721068, 1, 0, 0.05882353, 1,
2.367322, 0.4787087, 0.8712901, 1, 0, 0.05490196, 1,
2.382421, 0.1395892, 0.379554, 1, 0, 0.04705882, 1,
2.525696, 0.4731518, 0.6904083, 1, 0, 0.04313726, 1,
2.560121, -0.4323927, -0.1614992, 1, 0, 0.03529412, 1,
2.62708, -0.8047362, 1.931301, 1, 0, 0.03137255, 1,
2.925038, -0.03138262, 1.218708, 1, 0, 0.02352941, 1,
2.936216, -1.048101, 1.756122, 1, 0, 0.01960784, 1,
3.351015, 0.8351262, 2.236834, 1, 0, 0.01176471, 1,
3.871938, -1.052552, 1.492406, 1, 0, 0.007843138, 1
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
0.1877612, -4.405468, -6.395995, 0, -0.5, 0.5, 0.5,
0.1877612, -4.405468, -6.395995, 1, -0.5, 0.5, 0.5,
0.1877612, -4.405468, -6.395995, 1, 1.5, 0.5, 0.5,
0.1877612, -4.405468, -6.395995, 0, 1.5, 0.5, 0.5
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
-4.745351, 0.3064208, -6.395995, 0, -0.5, 0.5, 0.5,
-4.745351, 0.3064208, -6.395995, 1, -0.5, 0.5, 0.5,
-4.745351, 0.3064208, -6.395995, 1, 1.5, 0.5, 0.5,
-4.745351, 0.3064208, -6.395995, 0, 1.5, 0.5, 0.5
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
-4.745351, -4.405468, 0.2463465, 0, -0.5, 0.5, 0.5,
-4.745351, -4.405468, 0.2463465, 1, -0.5, 0.5, 0.5,
-4.745351, -4.405468, 0.2463465, 1, 1.5, 0.5, 0.5,
-4.745351, -4.405468, 0.2463465, 0, 1.5, 0.5, 0.5
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
-2, -3.318109, -4.863147,
2, -3.318109, -4.863147,
-2, -3.318109, -4.863147,
-2, -3.499335, -5.118622,
0, -3.318109, -4.863147,
0, -3.499335, -5.118622,
2, -3.318109, -4.863147,
2, -3.499335, -5.118622
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
-2, -3.861788, -5.629571, 0, -0.5, 0.5, 0.5,
-2, -3.861788, -5.629571, 1, -0.5, 0.5, 0.5,
-2, -3.861788, -5.629571, 1, 1.5, 0.5, 0.5,
-2, -3.861788, -5.629571, 0, 1.5, 0.5, 0.5,
0, -3.861788, -5.629571, 0, -0.5, 0.5, 0.5,
0, -3.861788, -5.629571, 1, -0.5, 0.5, 0.5,
0, -3.861788, -5.629571, 1, 1.5, 0.5, 0.5,
0, -3.861788, -5.629571, 0, 1.5, 0.5, 0.5,
2, -3.861788, -5.629571, 0, -0.5, 0.5, 0.5,
2, -3.861788, -5.629571, 1, -0.5, 0.5, 0.5,
2, -3.861788, -5.629571, 1, 1.5, 0.5, 0.5,
2, -3.861788, -5.629571, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.606941, -2, -4.863147,
-3.606941, 2, -4.863147,
-3.606941, -2, -4.863147,
-3.796676, -2, -5.118622,
-3.606941, 0, -4.863147,
-3.796676, 0, -5.118622,
-3.606941, 2, -4.863147,
-3.796676, 2, -5.118622
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
"0",
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
-4.176146, -2, -5.629571, 0, -0.5, 0.5, 0.5,
-4.176146, -2, -5.629571, 1, -0.5, 0.5, 0.5,
-4.176146, -2, -5.629571, 1, 1.5, 0.5, 0.5,
-4.176146, -2, -5.629571, 0, 1.5, 0.5, 0.5,
-4.176146, 0, -5.629571, 0, -0.5, 0.5, 0.5,
-4.176146, 0, -5.629571, 1, -0.5, 0.5, 0.5,
-4.176146, 0, -5.629571, 1, 1.5, 0.5, 0.5,
-4.176146, 0, -5.629571, 0, 1.5, 0.5, 0.5,
-4.176146, 2, -5.629571, 0, -0.5, 0.5, 0.5,
-4.176146, 2, -5.629571, 1, -0.5, 0.5, 0.5,
-4.176146, 2, -5.629571, 1, 1.5, 0.5, 0.5,
-4.176146, 2, -5.629571, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.606941, -3.318109, -4,
-3.606941, -3.318109, 4,
-3.606941, -3.318109, -4,
-3.796676, -3.499335, -4,
-3.606941, -3.318109, -2,
-3.796676, -3.499335, -2,
-3.606941, -3.318109, 0,
-3.796676, -3.499335, 0,
-3.606941, -3.318109, 2,
-3.796676, -3.499335, 2,
-3.606941, -3.318109, 4,
-3.796676, -3.499335, 4
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
-4.176146, -3.861788, -4, 0, -0.5, 0.5, 0.5,
-4.176146, -3.861788, -4, 1, -0.5, 0.5, 0.5,
-4.176146, -3.861788, -4, 1, 1.5, 0.5, 0.5,
-4.176146, -3.861788, -4, 0, 1.5, 0.5, 0.5,
-4.176146, -3.861788, -2, 0, -0.5, 0.5, 0.5,
-4.176146, -3.861788, -2, 1, -0.5, 0.5, 0.5,
-4.176146, -3.861788, -2, 1, 1.5, 0.5, 0.5,
-4.176146, -3.861788, -2, 0, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 0, 0, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 0, 1, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 0, 1, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 0, 0, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 2, 0, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 2, 1, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 2, 1, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 2, 0, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 4, 0, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 4, 1, -0.5, 0.5, 0.5,
-4.176146, -3.861788, 4, 1, 1.5, 0.5, 0.5,
-4.176146, -3.861788, 4, 0, 1.5, 0.5, 0.5
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
-3.606941, -3.318109, -4.863147,
-3.606941, 3.93095, -4.863147,
-3.606941, -3.318109, 5.35584,
-3.606941, 3.93095, 5.35584,
-3.606941, -3.318109, -4.863147,
-3.606941, -3.318109, 5.35584,
-3.606941, 3.93095, -4.863147,
-3.606941, 3.93095, 5.35584,
-3.606941, -3.318109, -4.863147,
3.982463, -3.318109, -4.863147,
-3.606941, -3.318109, 5.35584,
3.982463, -3.318109, 5.35584,
-3.606941, 3.93095, -4.863147,
3.982463, 3.93095, -4.863147,
-3.606941, 3.93095, 5.35584,
3.982463, 3.93095, 5.35584,
3.982463, -3.318109, -4.863147,
3.982463, 3.93095, -4.863147,
3.982463, -3.318109, 5.35584,
3.982463, 3.93095, 5.35584,
3.982463, -3.318109, -4.863147,
3.982463, -3.318109, 5.35584,
3.982463, 3.93095, -4.863147,
3.982463, 3.93095, 5.35584
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
var radius = 7.821961;
var distance = 34.80079;
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
mvMatrix.translate( -0.1877612, -0.3064208, -0.2463465 );
mvMatrix.scale( 1.114351, 1.16667, 0.8276023 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80079);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
tetra<-read.table("tetra.xyz")
```

```
## Error in read.table("tetra.xyz"): no lines available in input
```

```r
x<-tetra$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
```

```r
y<-tetra$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
```

```r
z<-tetra$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetra' not found
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
-3.496415, -0.03681162, -2.002333, 0, 0, 1, 1, 1,
-2.950533, -0.8940247, -0.3843594, 1, 0, 0, 1, 1,
-2.739441, 1.503175, -0.5854178, 1, 0, 0, 1, 1,
-2.72461, -1.058693, -2.254227, 1, 0, 0, 1, 1,
-2.605385, -2.44937, -2.520482, 1, 0, 0, 1, 1,
-2.594553, 0.9719453, -1.029769, 1, 0, 0, 1, 1,
-2.590176, -1.040205, -0.2707164, 0, 0, 0, 1, 1,
-2.583778, 0.8014764, -2.98619, 0, 0, 0, 1, 1,
-2.578951, -0.615309, 0.0006441296, 0, 0, 0, 1, 1,
-2.53696, 0.1545582, -2.610315, 0, 0, 0, 1, 1,
-2.511446, -0.8784367, -0.4341374, 0, 0, 0, 1, 1,
-2.460312, -1.314867, -1.289711, 0, 0, 0, 1, 1,
-2.31464, -0.7142906, -0.1845187, 0, 0, 0, 1, 1,
-2.278456, 0.3200092, -3.0708, 1, 1, 1, 1, 1,
-2.210214, 0.1975305, -1.824847, 1, 1, 1, 1, 1,
-2.184388, -0.0961167, -2.524641, 1, 1, 1, 1, 1,
-2.180718, -0.8537935, -2.948461, 1, 1, 1, 1, 1,
-2.170882, 0.4049609, -2.067175, 1, 1, 1, 1, 1,
-2.161546, 0.3606589, -1.171842, 1, 1, 1, 1, 1,
-2.151017, 1.170713, -0.8612778, 1, 1, 1, 1, 1,
-2.149036, 1.087973, -1.16984, 1, 1, 1, 1, 1,
-2.134807, -0.1424121, -1.63356, 1, 1, 1, 1, 1,
-2.134653, 0.04334778, -0.9920173, 1, 1, 1, 1, 1,
-2.09249, 1.240613, -0.4907143, 1, 1, 1, 1, 1,
-2.064953, 1.233471, -1.693118, 1, 1, 1, 1, 1,
-2.036487, -0.9715595, -2.137372, 1, 1, 1, 1, 1,
-2.003778, 0.1250762, -1.072688, 1, 1, 1, 1, 1,
-1.983233, -0.2034061, -1.998872, 1, 1, 1, 1, 1,
-1.98227, -1.163802, -2.842296, 0, 0, 1, 1, 1,
-1.973169, 0.5063373, 0.6269879, 1, 0, 0, 1, 1,
-1.955908, -0.9509143, -1.749618, 1, 0, 0, 1, 1,
-1.922258, -0.8163882, -0.7421222, 1, 0, 0, 1, 1,
-1.919133, -1.515625, -1.709822, 1, 0, 0, 1, 1,
-1.891166, 1.536937, -1.441511, 1, 0, 0, 1, 1,
-1.890582, -1.425105, -1.83839, 0, 0, 0, 1, 1,
-1.871553, -1.089818, -1.627734, 0, 0, 0, 1, 1,
-1.870142, -1.022017, -3.615505, 0, 0, 0, 1, 1,
-1.847097, 0.08338981, -3.06895, 0, 0, 0, 1, 1,
-1.845416, 0.8637549, -2.174881, 0, 0, 0, 1, 1,
-1.830896, 0.333692, -1.69787, 0, 0, 0, 1, 1,
-1.80989, 0.5610797, -0.710548, 0, 0, 0, 1, 1,
-1.80532, 1.372653, -0.7458652, 1, 1, 1, 1, 1,
-1.777519, -0.4109561, -1.929517, 1, 1, 1, 1, 1,
-1.77332, 0.4597927, 1.296703, 1, 1, 1, 1, 1,
-1.762348, 1.471614, -0.04056986, 1, 1, 1, 1, 1,
-1.711722, -0.5094368, -3.116917, 1, 1, 1, 1, 1,
-1.703181, 0.06444447, 0.08841591, 1, 1, 1, 1, 1,
-1.6983, -0.7786447, -0.984553, 1, 1, 1, 1, 1,
-1.692048, 0.5101377, 0.2392606, 1, 1, 1, 1, 1,
-1.678961, 1.188128, 0.00953982, 1, 1, 1, 1, 1,
-1.654409, 0.555811, -0.02363696, 1, 1, 1, 1, 1,
-1.650285, 0.04614411, -1.555947, 1, 1, 1, 1, 1,
-1.642532, -0.7862393, -1.118419, 1, 1, 1, 1, 1,
-1.640006, 0.1498172, -0.7330493, 1, 1, 1, 1, 1,
-1.631711, 0.6466938, -0.7647908, 1, 1, 1, 1, 1,
-1.624197, 0.5422954, -0.05980546, 1, 1, 1, 1, 1,
-1.624135, 0.585386, -1.405194, 0, 0, 1, 1, 1,
-1.616725, -1.193675, -0.9200339, 1, 0, 0, 1, 1,
-1.609374, 1.07341, -2.744414, 1, 0, 0, 1, 1,
-1.608606, -0.5816429, -2.421464, 1, 0, 0, 1, 1,
-1.603026, 1.384889, -2.889643, 1, 0, 0, 1, 1,
-1.602679, 0.7465543, -1.677144, 1, 0, 0, 1, 1,
-1.601842, -0.7271037, -0.6139435, 0, 0, 0, 1, 1,
-1.587375, -0.3597936, -2.357494, 0, 0, 0, 1, 1,
-1.586835, -0.4248058, -1.293304, 0, 0, 0, 1, 1,
-1.56444, -1.365769, -1.360281, 0, 0, 0, 1, 1,
-1.562549, 0.5975606, -0.8367425, 0, 0, 0, 1, 1,
-1.55955, 0.8189192, 0.265274, 0, 0, 0, 1, 1,
-1.55658, 0.4954864, -0.5462554, 0, 0, 0, 1, 1,
-1.553148, -0.6305436, -2.508666, 1, 1, 1, 1, 1,
-1.54355, 0.8585193, -1.143422, 1, 1, 1, 1, 1,
-1.540921, 0.4558318, -2.221057, 1, 1, 1, 1, 1,
-1.537086, 1.275553, 0.397442, 1, 1, 1, 1, 1,
-1.534769, -3.21254, -2.086096, 1, 1, 1, 1, 1,
-1.530906, -0.05088999, -0.7704745, 1, 1, 1, 1, 1,
-1.525716, -1.792781, -3.576, 1, 1, 1, 1, 1,
-1.503692, -0.2671615, -0.4903517, 1, 1, 1, 1, 1,
-1.489046, 0.7920539, -2.40459, 1, 1, 1, 1, 1,
-1.484227, -0.6752532, -1.181438, 1, 1, 1, 1, 1,
-1.482127, 0.11461, -1.056414, 1, 1, 1, 1, 1,
-1.481571, -1.562139, -3.937194, 1, 1, 1, 1, 1,
-1.475332, -1.5323, -1.101652, 1, 1, 1, 1, 1,
-1.474612, -0.8215035, -1.958191, 1, 1, 1, 1, 1,
-1.450556, -0.4402761, -2.716454, 1, 1, 1, 1, 1,
-1.45035, 0.428112, 1.219476, 0, 0, 1, 1, 1,
-1.449278, 0.416355, -2.613681, 1, 0, 0, 1, 1,
-1.437289, -0.4647979, -1.647516, 1, 0, 0, 1, 1,
-1.433677, 1.209977, 0.9416797, 1, 0, 0, 1, 1,
-1.433457, -0.3227455, -2.365193, 1, 0, 0, 1, 1,
-1.431627, -0.5327072, 0.2255042, 1, 0, 0, 1, 1,
-1.420866, 0.284232, -0.4733615, 0, 0, 0, 1, 1,
-1.413088, 1.116641, -2.361995, 0, 0, 0, 1, 1,
-1.396883, 0.2154934, -0.9687276, 0, 0, 0, 1, 1,
-1.388729, -1.983988, -2.621014, 0, 0, 0, 1, 1,
-1.388581, -0.1106436, -3.171941, 0, 0, 0, 1, 1,
-1.387195, -0.5875527, -1.771151, 0, 0, 0, 1, 1,
-1.381598, -1.070561, -2.709256, 0, 0, 0, 1, 1,
-1.381395, -0.6894597, -2.212782, 1, 1, 1, 1, 1,
-1.380329, 0.9347119, -1.902713, 1, 1, 1, 1, 1,
-1.369718, 0.3797758, 0.6096652, 1, 1, 1, 1, 1,
-1.362373, 0.1909308, -1.166291, 1, 1, 1, 1, 1,
-1.354727, 0.1999637, -1.420375, 1, 1, 1, 1, 1,
-1.347717, -1.653055, -1.714086, 1, 1, 1, 1, 1,
-1.329593, -1.639196, -1.930248, 1, 1, 1, 1, 1,
-1.328444, 0.8321355, -1.680686, 1, 1, 1, 1, 1,
-1.325693, 0.1301816, 0.1425237, 1, 1, 1, 1, 1,
-1.31633, -0.4861894, -0.7289442, 1, 1, 1, 1, 1,
-1.297433, 0.4632492, -1.167789, 1, 1, 1, 1, 1,
-1.294279, 0.3493198, -1.368305, 1, 1, 1, 1, 1,
-1.274042, 0.9275029, -1.522046, 1, 1, 1, 1, 1,
-1.271744, 1.245194, -1.513348, 1, 1, 1, 1, 1,
-1.268628, 0.8048632, -0.1983585, 1, 1, 1, 1, 1,
-1.263615, -0.3309436, -2.727185, 0, 0, 1, 1, 1,
-1.257453, 0.4493442, -0.6023885, 1, 0, 0, 1, 1,
-1.248504, -2.012028, -4.105422, 1, 0, 0, 1, 1,
-1.242412, -0.01851658, -1.668695, 1, 0, 0, 1, 1,
-1.227901, 0.7930546, -1.800131, 1, 0, 0, 1, 1,
-1.225709, -1.262689, -4.400113, 1, 0, 0, 1, 1,
-1.220226, -0.09987129, -1.475667, 0, 0, 0, 1, 1,
-1.208179, -0.4312505, -1.996554, 0, 0, 0, 1, 1,
-1.20352, 0.8792524, -1.003729, 0, 0, 0, 1, 1,
-1.202911, 2.006464, 0.5940899, 0, 0, 0, 1, 1,
-1.19729, -1.182743, -1.011921, 0, 0, 0, 1, 1,
-1.193651, -0.1357958, -1.557173, 0, 0, 0, 1, 1,
-1.192974, 0.5295359, 0.4728754, 0, 0, 0, 1, 1,
-1.191763, -1.797291, -1.953492, 1, 1, 1, 1, 1,
-1.180956, 0.1227019, -2.686604, 1, 1, 1, 1, 1,
-1.180766, 0.4037221, -0.3082212, 1, 1, 1, 1, 1,
-1.178529, -1.771058, -2.322884, 1, 1, 1, 1, 1,
-1.177259, -1.416823, -1.386776, 1, 1, 1, 1, 1,
-1.171433, -1.580372, -2.557478, 1, 1, 1, 1, 1,
-1.170898, 0.145264, -3.440559, 1, 1, 1, 1, 1,
-1.160081, 0.09378187, -2.114602, 1, 1, 1, 1, 1,
-1.149999, 0.7996382, -0.576508, 1, 1, 1, 1, 1,
-1.136018, -1.023125, -3.082905, 1, 1, 1, 1, 1,
-1.134275, -0.1053184, -1.729409, 1, 1, 1, 1, 1,
-1.128802, 0.2484443, -1.888489, 1, 1, 1, 1, 1,
-1.125938, 1.329587, -1.633993, 1, 1, 1, 1, 1,
-1.12443, 1.435707, -0.369624, 1, 1, 1, 1, 1,
-1.117422, -0.9030741, -3.801249, 1, 1, 1, 1, 1,
-1.116534, -0.3411156, -2.231217, 0, 0, 1, 1, 1,
-1.111084, -0.7389513, -2.52856, 1, 0, 0, 1, 1,
-1.109391, -0.2285739, -2.692277, 1, 0, 0, 1, 1,
-1.108868, -0.8996477, -1.836341, 1, 0, 0, 1, 1,
-1.094261, 1.377307, -0.1443343, 1, 0, 0, 1, 1,
-1.09338, 0.1950299, -0.3661238, 1, 0, 0, 1, 1,
-1.092557, 0.3056142, -0.006045145, 0, 0, 0, 1, 1,
-1.092018, -2.909944, -0.8373562, 0, 0, 0, 1, 1,
-1.083672, 0.458689, -1.170404, 0, 0, 0, 1, 1,
-1.078571, 1.903531, -1.059531, 0, 0, 0, 1, 1,
-1.077493, 0.9679903, -0.7735125, 0, 0, 0, 1, 1,
-1.077187, 1.218952, 0.2115906, 0, 0, 0, 1, 1,
-1.076206, -0.9348196, -2.995365, 0, 0, 0, 1, 1,
-1.072894, -0.9880753, -2.04279, 1, 1, 1, 1, 1,
-1.072801, 0.3207757, -1.589169, 1, 1, 1, 1, 1,
-1.068494, -0.5191557, -2.184855, 1, 1, 1, 1, 1,
-1.061157, -0.7873909, -2.970788, 1, 1, 1, 1, 1,
-1.060086, 1.289121, 1.876528, 1, 1, 1, 1, 1,
-1.057542, 0.1123015, -2.057474, 1, 1, 1, 1, 1,
-1.055863, 0.1166917, -1.991105, 1, 1, 1, 1, 1,
-1.050431, -0.008285916, -2.522168, 1, 1, 1, 1, 1,
-1.044546, 1.020611, -0.7596285, 1, 1, 1, 1, 1,
-1.024072, 0.03895094, -1.21659, 1, 1, 1, 1, 1,
-1.023553, -0.233934, -2.200005, 1, 1, 1, 1, 1,
-1.023454, 0.700572, 0.2757374, 1, 1, 1, 1, 1,
-1.014595, -0.2062689, -2.625257, 1, 1, 1, 1, 1,
-1.003405, -1.722895, -3.014427, 1, 1, 1, 1, 1,
-0.9795296, -1.060122, -0.7204584, 1, 1, 1, 1, 1,
-0.9791688, 0.1382267, -2.39549, 0, 0, 1, 1, 1,
-0.9703593, -2.156257, -3.468334, 1, 0, 0, 1, 1,
-0.9679618, -0.3935175, -1.058643, 1, 0, 0, 1, 1,
-0.9655735, -0.72143, -4.590635, 1, 0, 0, 1, 1,
-0.9649752, 0.03970607, 0.1393387, 1, 0, 0, 1, 1,
-0.9648201, -1.461924, -2.292346, 1, 0, 0, 1, 1,
-0.9553517, 0.6987898, -1.218915, 0, 0, 0, 1, 1,
-0.9530932, 1.368693, 0.4344297, 0, 0, 0, 1, 1,
-0.9510825, 0.8854343, -2.343454, 0, 0, 0, 1, 1,
-0.9505461, -0.621277, -1.574046, 0, 0, 0, 1, 1,
-0.9488278, -1.183176, -3.472754, 0, 0, 0, 1, 1,
-0.9462495, -1.036289, -1.4796, 0, 0, 0, 1, 1,
-0.944112, -1.908623, -3.643516, 0, 0, 0, 1, 1,
-0.9395911, 0.8211764, -1.472079, 1, 1, 1, 1, 1,
-0.9368752, 0.3201665, -1.966896, 1, 1, 1, 1, 1,
-0.9327417, 0.7767988, 1.217769, 1, 1, 1, 1, 1,
-0.927358, 0.02813147, -0.3970206, 1, 1, 1, 1, 1,
-0.9248108, -0.4217183, -1.609426, 1, 1, 1, 1, 1,
-0.9243992, 1.182044, 0.6371477, 1, 1, 1, 1, 1,
-0.9231153, 0.325841, -1.572701, 1, 1, 1, 1, 1,
-0.9221633, 0.505617, -2.778618, 1, 1, 1, 1, 1,
-0.9215702, -1.014035, -2.122626, 1, 1, 1, 1, 1,
-0.9155802, 0.1014417, -3.137517, 1, 1, 1, 1, 1,
-0.9131895, 0.4509039, -1.075402, 1, 1, 1, 1, 1,
-0.9111324, -1.826817, -2.668291, 1, 1, 1, 1, 1,
-0.9021617, -0.8554723, -3.458177, 1, 1, 1, 1, 1,
-0.8989669, -0.856879, -1.446203, 1, 1, 1, 1, 1,
-0.890075, -1.84782, -4.610341, 1, 1, 1, 1, 1,
-0.8900052, 0.5255368, 0.2481316, 0, 0, 1, 1, 1,
-0.8840571, -0.8160082, -0.388218, 1, 0, 0, 1, 1,
-0.8753849, -2.075691, -3.337211, 1, 0, 0, 1, 1,
-0.8731309, -0.03963055, -1.694257, 1, 0, 0, 1, 1,
-0.8728495, 0.2813502, -0.6249837, 1, 0, 0, 1, 1,
-0.8726283, 1.618324, -0.8873137, 1, 0, 0, 1, 1,
-0.858868, -1.032115, -2.197972, 0, 0, 0, 1, 1,
-0.8551725, -0.1803124, -3.041559, 0, 0, 0, 1, 1,
-0.8530209, -0.177454, -2.21015, 0, 0, 0, 1, 1,
-0.8526438, -1.756047, -1.931786, 0, 0, 0, 1, 1,
-0.8467621, -0.08292878, -1.272697, 0, 0, 0, 1, 1,
-0.8466277, -1.073672, -3.281549, 0, 0, 0, 1, 1,
-0.8417313, 2.90387, -0.1670025, 0, 0, 0, 1, 1,
-0.82482, -0.6361334, -0.9190422, 1, 1, 1, 1, 1,
-0.824759, -0.725878, -2.790439, 1, 1, 1, 1, 1,
-0.8195646, 0.2150394, -1.434468, 1, 1, 1, 1, 1,
-0.8181169, 0.447318, -1.969396, 1, 1, 1, 1, 1,
-0.8149288, -1.644866, -4.132598, 1, 1, 1, 1, 1,
-0.8039069, -1.077532, -2.674686, 1, 1, 1, 1, 1,
-0.8030966, 0.08679592, -2.48878, 1, 1, 1, 1, 1,
-0.8017844, -0.1290563, -2.703781, 1, 1, 1, 1, 1,
-0.7897638, -0.8700029, -3.106376, 1, 1, 1, 1, 1,
-0.7893499, 0.0160087, -1.972394, 1, 1, 1, 1, 1,
-0.7882243, 0.3344283, -0.1145145, 1, 1, 1, 1, 1,
-0.7849138, -1.076484, -2.950527, 1, 1, 1, 1, 1,
-0.7814739, 1.489745, 0.4768459, 1, 1, 1, 1, 1,
-0.7813517, 1.107269, -2.314865, 1, 1, 1, 1, 1,
-0.7749715, 0.3036467, -0.5837843, 1, 1, 1, 1, 1,
-0.7702959, 1.366297, 0.7829207, 0, 0, 1, 1, 1,
-0.7620398, -0.03358699, -3.259183, 1, 0, 0, 1, 1,
-0.7498387, -0.9569266, -2.10233, 1, 0, 0, 1, 1,
-0.7413694, 1.025286, -0.7457079, 1, 0, 0, 1, 1,
-0.7334571, -1.57814, -2.04408, 1, 0, 0, 1, 1,
-0.7324658, -0.9137284, -3.668776, 1, 0, 0, 1, 1,
-0.7134367, 2.321449, -1.474099, 0, 0, 0, 1, 1,
-0.7078975, -1.320629, -1.647862, 0, 0, 0, 1, 1,
-0.7075955, 1.116621, -1.315878, 0, 0, 0, 1, 1,
-0.7064698, -0.6065711, -2.451962, 0, 0, 0, 1, 1,
-0.7044852, 0.3377837, -2.605264, 0, 0, 0, 1, 1,
-0.7010072, -1.68863, -1.623622, 0, 0, 0, 1, 1,
-0.7004541, 1.491193, -2.138557, 0, 0, 0, 1, 1,
-0.6988688, 0.3931474, -1.744649, 1, 1, 1, 1, 1,
-0.6972686, 0.1706383, -1.405352, 1, 1, 1, 1, 1,
-0.696964, 0.1645591, -2.092569, 1, 1, 1, 1, 1,
-0.6929822, -0.01748466, -0.6549424, 1, 1, 1, 1, 1,
-0.6820582, -0.5943615, -1.771509, 1, 1, 1, 1, 1,
-0.6770753, -0.111878, -0.2454669, 1, 1, 1, 1, 1,
-0.6746216, -0.1386275, -1.601447, 1, 1, 1, 1, 1,
-0.6610217, 1.079885, -0.3989476, 1, 1, 1, 1, 1,
-0.6544134, 3.50595, -1.229515, 1, 1, 1, 1, 1,
-0.6540316, 0.06913489, 1.082439, 1, 1, 1, 1, 1,
-0.6524099, 0.9955683, -1.274532, 1, 1, 1, 1, 1,
-0.647802, 0.415015, -2.381108, 1, 1, 1, 1, 1,
-0.6393017, -1.331559, -2.459755, 1, 1, 1, 1, 1,
-0.6392406, -0.4404265, -4.251184, 1, 1, 1, 1, 1,
-0.6385918, -0.3398764, -2.783489, 1, 1, 1, 1, 1,
-0.6316442, 1.795204, -0.1792024, 0, 0, 1, 1, 1,
-0.6314417, 0.5315242, -0.648949, 1, 0, 0, 1, 1,
-0.6312227, -0.204016, -1.388086, 1, 0, 0, 1, 1,
-0.6304384, -1.665196, -4.536536, 1, 0, 0, 1, 1,
-0.6272084, 0.1730439, -2.475811, 1, 0, 0, 1, 1,
-0.6167239, 0.8673344, -0.9763728, 1, 0, 0, 1, 1,
-0.616598, -0.2421687, -2.62464, 0, 0, 0, 1, 1,
-0.6157089, -0.9144996, -2.502872, 0, 0, 0, 1, 1,
-0.6144742, -0.8291111, -2.159041, 0, 0, 0, 1, 1,
-0.6141201, -0.4340328, -1.055771, 0, 0, 0, 1, 1,
-0.6119972, 0.2197871, -2.778008, 0, 0, 0, 1, 1,
-0.6113169, -0.4298967, -1.979587, 0, 0, 0, 1, 1,
-0.602057, 0.926625, -1.536574, 0, 0, 0, 1, 1,
-0.5995073, -1.586154, -2.23932, 1, 1, 1, 1, 1,
-0.5968074, -0.9621862, -2.243493, 1, 1, 1, 1, 1,
-0.5967504, 1.20578, -0.2451364, 1, 1, 1, 1, 1,
-0.5896324, -0.1899942, -2.228646, 1, 1, 1, 1, 1,
-0.5895249, -2.071845, -4.442786, 1, 1, 1, 1, 1,
-0.5870531, -0.7349219, -1.419628, 1, 1, 1, 1, 1,
-0.584796, 1.232487, 1.662506, 1, 1, 1, 1, 1,
-0.5842726, 0.2814403, -2.873628, 1, 1, 1, 1, 1,
-0.5819241, 0.5396929, -2.089839, 1, 1, 1, 1, 1,
-0.5800776, -0.2282593, -2.636831, 1, 1, 1, 1, 1,
-0.5732656, 1.730892, -0.1853449, 1, 1, 1, 1, 1,
-0.5731078, -0.9512688, -1.89398, 1, 1, 1, 1, 1,
-0.5731069, -0.9380356, -2.492454, 1, 1, 1, 1, 1,
-0.5720904, 0.5441115, -0.5000024, 1, 1, 1, 1, 1,
-0.5720887, 0.4303395, -1.429911, 1, 1, 1, 1, 1,
-0.5712667, 1.48797, -1.294513, 0, 0, 1, 1, 1,
-0.5704069, 0.7832897, -0.7428029, 1, 0, 0, 1, 1,
-0.5688818, -0.9693853, -3.179861, 1, 0, 0, 1, 1,
-0.5617769, 0.529864, -0.673982, 1, 0, 0, 1, 1,
-0.5593274, 1.705425, 0.3756079, 1, 0, 0, 1, 1,
-0.55558, -0.2061125, -3.02905, 1, 0, 0, 1, 1,
-0.5516737, 1.192699, -1.393683, 0, 0, 0, 1, 1,
-0.5486256, 0.8293269, 0.8531241, 0, 0, 0, 1, 1,
-0.5471693, -0.8060172, -2.192876, 0, 0, 0, 1, 1,
-0.5440922, -1.536943, -3.967296, 0, 0, 0, 1, 1,
-0.5440722, 0.2901314, -0.5170322, 0, 0, 0, 1, 1,
-0.5426084, 1.473022, 0.2133106, 0, 0, 0, 1, 1,
-0.5380563, 2.403491, -0.9869072, 0, 0, 0, 1, 1,
-0.5298421, 0.9946165, 0.7058765, 1, 1, 1, 1, 1,
-0.5182453, -1.594523, -3.033556, 1, 1, 1, 1, 1,
-0.5143631, 1.328024, -2.077587, 1, 1, 1, 1, 1,
-0.5133669, -1.391241, -3.577894, 1, 1, 1, 1, 1,
-0.5103202, -0.3954685, -1.327881, 1, 1, 1, 1, 1,
-0.5062752, -0.4724599, -2.107166, 1, 1, 1, 1, 1,
-0.5043821, 1.61902, -0.8792717, 1, 1, 1, 1, 1,
-0.5007147, -1.429017, -3.242741, 1, 1, 1, 1, 1,
-0.4993208, -0.7314916, -2.657803, 1, 1, 1, 1, 1,
-0.4941967, -0.7150002, -2.461355, 1, 1, 1, 1, 1,
-0.4920427, -0.6967887, -2.772616, 1, 1, 1, 1, 1,
-0.4875845, -0.1897803, -2.196317, 1, 1, 1, 1, 1,
-0.4867322, 0.7520977, 0.2846031, 1, 1, 1, 1, 1,
-0.4824987, -0.5542248, -2.311944, 1, 1, 1, 1, 1,
-0.4793512, 1.122517, 0.2090648, 1, 1, 1, 1, 1,
-0.4777432, -0.1192453, -2.216666, 0, 0, 1, 1, 1,
-0.476817, 0.6651553, 0.9292238, 1, 0, 0, 1, 1,
-0.4743574, 0.4292862, -0.5413351, 1, 0, 0, 1, 1,
-0.4743282, 1.736292, -2.44647, 1, 0, 0, 1, 1,
-0.4712128, 0.2709841, -0.03661317, 1, 0, 0, 1, 1,
-0.4678314, 0.6809897, -1.252408, 1, 0, 0, 1, 1,
-0.4672252, 0.4866582, -0.1156949, 0, 0, 0, 1, 1,
-0.465365, -0.541971, -3.754405, 0, 0, 0, 1, 1,
-0.463612, -1.096231, -3.01356, 0, 0, 0, 1, 1,
-0.4629325, 1.328704, -0.647599, 0, 0, 0, 1, 1,
-0.4493655, 0.9731923, 0.49244, 0, 0, 0, 1, 1,
-0.4467627, 0.4081432, -0.03887608, 0, 0, 0, 1, 1,
-0.4324765, -0.2260033, -0.8374277, 0, 0, 0, 1, 1,
-0.4284925, 0.912818, -1.025449, 1, 1, 1, 1, 1,
-0.4280126, -1.731919, -2.798519, 1, 1, 1, 1, 1,
-0.4274278, -0.8166466, -1.352257, 1, 1, 1, 1, 1,
-0.4228097, 0.08457136, -2.816096, 1, 1, 1, 1, 1,
-0.4224369, 0.8271241, -1.16347, 1, 1, 1, 1, 1,
-0.4201241, -0.93761, -4.081218, 1, 1, 1, 1, 1,
-0.4195868, -1.30821, -2.694364, 1, 1, 1, 1, 1,
-0.4174962, -1.366825, -2.120129, 1, 1, 1, 1, 1,
-0.4118855, 1.618226, 1.665617, 1, 1, 1, 1, 1,
-0.4063627, 0.944768, -1.362632, 1, 1, 1, 1, 1,
-0.4059496, 0.0092718, -1.133672, 1, 1, 1, 1, 1,
-0.4056778, -0.2119649, -1.093505, 1, 1, 1, 1, 1,
-0.4037135, -0.2081854, -2.288475, 1, 1, 1, 1, 1,
-0.403676, 0.5717701, -0.2672473, 1, 1, 1, 1, 1,
-0.4036053, -0.3036132, -0.8089609, 1, 1, 1, 1, 1,
-0.4011754, 0.7843528, -1.02843, 0, 0, 1, 1, 1,
-0.3994143, -1.174769, -3.703302, 1, 0, 0, 1, 1,
-0.39886, -0.8424243, -2.580992, 1, 0, 0, 1, 1,
-0.3896882, 0.2819149, 0.4934252, 1, 0, 0, 1, 1,
-0.3895583, 0.644366, 0.3615845, 1, 0, 0, 1, 1,
-0.3886471, -0.758998, -3.830179, 1, 0, 0, 1, 1,
-0.3879117, -1.474114, -2.426478, 0, 0, 0, 1, 1,
-0.3870909, 1.785791, -0.7242625, 0, 0, 0, 1, 1,
-0.3864485, -0.677974, -2.468493, 0, 0, 0, 1, 1,
-0.3846827, -1.02951, -4.293248, 0, 0, 0, 1, 1,
-0.3798045, -1.05553, -3.351124, 0, 0, 0, 1, 1,
-0.3795944, 0.3883033, 0.6347603, 0, 0, 0, 1, 1,
-0.3795917, -0.04218268, -3.003208, 0, 0, 0, 1, 1,
-0.3795196, -0.7128695, -3.00111, 1, 1, 1, 1, 1,
-0.3794214, -0.4415444, -2.837279, 1, 1, 1, 1, 1,
-0.3714701, -1.400747, -1.927315, 1, 1, 1, 1, 1,
-0.3702538, 0.3390098, -1.539072, 1, 1, 1, 1, 1,
-0.3677183, 0.847867, -1.483135, 1, 1, 1, 1, 1,
-0.3648986, -0.7276947, -3.30251, 1, 1, 1, 1, 1,
-0.3574082, 0.6517232, -0.6569692, 1, 1, 1, 1, 1,
-0.3568544, 1.230745, 0.2753461, 1, 1, 1, 1, 1,
-0.354913, 0.03603487, -1.938858, 1, 1, 1, 1, 1,
-0.3533092, -0.004397624, -1.438493, 1, 1, 1, 1, 1,
-0.3526917, 1.169434, 0.4213106, 1, 1, 1, 1, 1,
-0.3484166, 0.7610075, 1.005481, 1, 1, 1, 1, 1,
-0.3463117, 0.512042, -0.3545942, 1, 1, 1, 1, 1,
-0.3450873, -0.3944125, -2.073217, 1, 1, 1, 1, 1,
-0.3447877, 0.9149556, -0.8731844, 1, 1, 1, 1, 1,
-0.3430084, -1.75532, -3.495993, 0, 0, 1, 1, 1,
-0.3429872, -1.492891, -3.009306, 1, 0, 0, 1, 1,
-0.3426017, -0.3697696, -4.085962, 1, 0, 0, 1, 1,
-0.3351247, 1.001507, 0.3911861, 1, 0, 0, 1, 1,
-0.3341115, 0.2409328, -0.2120281, 1, 0, 0, 1, 1,
-0.3338344, -1.001888, -1.221359, 1, 0, 0, 1, 1,
-0.3317521, 0.8151491, -0.8358219, 0, 0, 0, 1, 1,
-0.3304857, -0.1123101, -2.938916, 0, 0, 0, 1, 1,
-0.3301368, -0.8934147, -2.979627, 0, 0, 0, 1, 1,
-0.3275211, -0.8605754, -0.956178, 0, 0, 0, 1, 1,
-0.3268191, -1.381877, -2.29771, 0, 0, 0, 1, 1,
-0.315174, -0.180206, -3.808397, 0, 0, 0, 1, 1,
-0.313012, 0.9961022, 0.1133518, 0, 0, 0, 1, 1,
-0.3117555, 0.3286055, -1.565197, 1, 1, 1, 1, 1,
-0.3113548, -0.1628536, -2.870275, 1, 1, 1, 1, 1,
-0.3097943, 0.1019961, -2.712909, 1, 1, 1, 1, 1,
-0.3059045, -1.290753, -2.12919, 1, 1, 1, 1, 1,
-0.3051267, -0.9752095, -2.740476, 1, 1, 1, 1, 1,
-0.3016868, -0.7810638, -3.86289, 1, 1, 1, 1, 1,
-0.3003361, 0.3540194, -1.114732, 1, 1, 1, 1, 1,
-0.2964824, 1.686176, 0.1297877, 1, 1, 1, 1, 1,
-0.2952828, 0.1955902, 0.0165335, 1, 1, 1, 1, 1,
-0.2943279, -0.9720911, -1.948112, 1, 1, 1, 1, 1,
-0.2934454, 0.7922956, 0.3761142, 1, 1, 1, 1, 1,
-0.282811, -0.041944, -0.5714992, 1, 1, 1, 1, 1,
-0.2762118, 0.2379746, 0.7394565, 1, 1, 1, 1, 1,
-0.2760486, -0.8664722, -3.126534, 1, 1, 1, 1, 1,
-0.2756275, 1.372382, -0.949571, 1, 1, 1, 1, 1,
-0.26985, 0.6338408, 0.7458596, 0, 0, 1, 1, 1,
-0.2671535, -0.8663551, -2.791498, 1, 0, 0, 1, 1,
-0.2669516, -1.040072, -3.822645, 1, 0, 0, 1, 1,
-0.2610413, -2.357887, -2.096158, 1, 0, 0, 1, 1,
-0.2591541, -0.1609563, -1.907178, 1, 0, 0, 1, 1,
-0.2590067, -0.2852528, -2.949073, 1, 0, 0, 1, 1,
-0.2560157, 1.215161, -0.4219425, 0, 0, 0, 1, 1,
-0.2490299, 1.121041, -1.638007, 0, 0, 0, 1, 1,
-0.2455579, 0.7037004, 1.325024, 0, 0, 0, 1, 1,
-0.2452797, 1.318877, -0.09818044, 0, 0, 0, 1, 1,
-0.2431632, 0.619897, 1.275552, 0, 0, 0, 1, 1,
-0.2414106, -0.4620966, -2.910263, 0, 0, 0, 1, 1,
-0.2375396, -0.05040635, -0.5367371, 0, 0, 0, 1, 1,
-0.2374072, -2.441709, -2.063485, 1, 1, 1, 1, 1,
-0.2367407, -0.146366, -0.1501887, 1, 1, 1, 1, 1,
-0.2358673, 2.223662, -0.04779508, 1, 1, 1, 1, 1,
-0.2344292, 0.7899632, 0.1921217, 1, 1, 1, 1, 1,
-0.2339022, 0.7486079, -1.791154, 1, 1, 1, 1, 1,
-0.2323404, -0.3274505, -1.058306, 1, 1, 1, 1, 1,
-0.2300559, -0.6033047, -2.856139, 1, 1, 1, 1, 1,
-0.2268958, -0.02043278, -1.244892, 1, 1, 1, 1, 1,
-0.2260625, 0.4211067, 0.5618986, 1, 1, 1, 1, 1,
-0.2241882, -0.6518883, -3.88469, 1, 1, 1, 1, 1,
-0.2210463, 0.1659081, -0.4341545, 1, 1, 1, 1, 1,
-0.2202463, 1.519579, -0.05907485, 1, 1, 1, 1, 1,
-0.2190707, -0.6710123, -2.844532, 1, 1, 1, 1, 1,
-0.2186284, 0.7991234, -2.439098, 1, 1, 1, 1, 1,
-0.2163778, -0.03971514, -2.219844, 1, 1, 1, 1, 1,
-0.2128251, -0.4602866, -2.04734, 0, 0, 1, 1, 1,
-0.212726, -0.6537243, -2.32045, 1, 0, 0, 1, 1,
-0.2057246, 0.3792575, -1.29494, 1, 0, 0, 1, 1,
-0.2043155, -1.006767, -2.574411, 1, 0, 0, 1, 1,
-0.2015709, 0.5847839, -0.4228228, 1, 0, 0, 1, 1,
-0.1974586, 0.6849754, -2.863675, 1, 0, 0, 1, 1,
-0.1958185, -0.1867739, -1.465833, 0, 0, 0, 1, 1,
-0.1950696, -1.012253, -3.076975, 0, 0, 0, 1, 1,
-0.1890796, -2.333501, -2.633851, 0, 0, 0, 1, 1,
-0.1867539, 1.360613, -0.2180207, 0, 0, 0, 1, 1,
-0.1846846, 0.692155, 0.528906, 0, 0, 0, 1, 1,
-0.1828378, -1.163229, -4.521941, 0, 0, 0, 1, 1,
-0.1817804, 1.570796, 0.6950752, 0, 0, 0, 1, 1,
-0.1788727, -1.767534, -3.078308, 1, 1, 1, 1, 1,
-0.1788289, -0.1162772, -0.7990196, 1, 1, 1, 1, 1,
-0.1785047, 0.9459033, -0.9776202, 1, 1, 1, 1, 1,
-0.1773685, 0.8490741, -0.6046869, 1, 1, 1, 1, 1,
-0.1746945, 0.4072532, 0.1904192, 1, 1, 1, 1, 1,
-0.1736915, 1.176583, 1.422521, 1, 1, 1, 1, 1,
-0.1725265, 0.8654187, -1.086113, 1, 1, 1, 1, 1,
-0.1724321, -1.083601, -3.26125, 1, 1, 1, 1, 1,
-0.1704261, 0.8657357, -0.3290046, 1, 1, 1, 1, 1,
-0.1693572, -0.1940615, -1.439636, 1, 1, 1, 1, 1,
-0.1671322, 0.1029062, -0.1034783, 1, 1, 1, 1, 1,
-0.16712, 0.3937787, 0.4401121, 1, 1, 1, 1, 1,
-0.1639976, -1.80189, -1.360817, 1, 1, 1, 1, 1,
-0.1590851, 2.131763, 1.285897, 1, 1, 1, 1, 1,
-0.157676, 2.386028, 0.4144672, 1, 1, 1, 1, 1,
-0.1556757, -1.381096, -3.337209, 0, 0, 1, 1, 1,
-0.1519693, 1.29141, 0.2747303, 1, 0, 0, 1, 1,
-0.1517027, 0.5660437, 0.4029119, 1, 0, 0, 1, 1,
-0.1513468, 1.032384, -0.9269891, 1, 0, 0, 1, 1,
-0.1450053, 0.08109137, -1.296901, 1, 0, 0, 1, 1,
-0.144811, 0.3211247, -1.303954, 1, 0, 0, 1, 1,
-0.1348399, 0.159575, 1.677513, 0, 0, 0, 1, 1,
-0.1345666, -0.01776571, -1.004996, 0, 0, 0, 1, 1,
-0.1315424, 1.363351, -0.3175763, 0, 0, 0, 1, 1,
-0.130895, 0.3541478, 0.2739112, 0, 0, 0, 1, 1,
-0.1304322, 1.919626, 0.1523907, 0, 0, 0, 1, 1,
-0.1279241, -0.2589158, -3.34009, 0, 0, 0, 1, 1,
-0.1277122, 2.135471, -0.5564834, 0, 0, 0, 1, 1,
-0.1221839, -0.5987549, -2.257332, 1, 1, 1, 1, 1,
-0.1210279, 0.2778477, 0.5204704, 1, 1, 1, 1, 1,
-0.1174653, 0.9961315, 0.7363278, 1, 1, 1, 1, 1,
-0.1066883, 0.4564603, 0.05018546, 1, 1, 1, 1, 1,
-0.1063097, 0.8566574, -0.3276456, 1, 1, 1, 1, 1,
-0.10524, -0.3444909, -3.906473, 1, 1, 1, 1, 1,
-0.1042602, 0.2498647, 0.3108785, 1, 1, 1, 1, 1,
-0.1018015, -0.5245395, -4.112265, 1, 1, 1, 1, 1,
-0.1012956, -1.404603, -2.341876, 1, 1, 1, 1, 1,
-0.09972793, -0.08400305, -1.543034, 1, 1, 1, 1, 1,
-0.09885397, -0.4509572, -4.714327, 1, 1, 1, 1, 1,
-0.09772079, 0.7537332, -1.164257, 1, 1, 1, 1, 1,
-0.09192173, -0.7556387, -4.666342, 1, 1, 1, 1, 1,
-0.08617909, 0.1599851, -1.895496, 1, 1, 1, 1, 1,
-0.08591621, 1.368281, -0.6077406, 1, 1, 1, 1, 1,
-0.08565369, 0.05527819, 0.6828393, 0, 0, 1, 1, 1,
-0.07657047, -0.5096121, -2.874999, 1, 0, 0, 1, 1,
-0.07298744, 0.2291042, 0.9845294, 1, 0, 0, 1, 1,
-0.06248962, 0.07284476, -0.6009791, 1, 0, 0, 1, 1,
-0.05878777, -2.08024, -2.672974, 1, 0, 0, 1, 1,
-0.05617668, 0.7018068, -2.212373, 1, 0, 0, 1, 1,
-0.05361525, 0.7136328, -0.4854158, 0, 0, 0, 1, 1,
-0.04602471, 0.562297, -0.4432264, 0, 0, 0, 1, 1,
-0.03876029, 0.7467783, 0.3144658, 0, 0, 0, 1, 1,
-0.03793061, -0.6590586, -2.913776, 0, 0, 0, 1, 1,
-0.03723244, -0.187596, -3.811461, 0, 0, 0, 1, 1,
-0.0371694, 0.8850695, -1.201918, 0, 0, 0, 1, 1,
-0.03645036, -0.2967052, -2.323087, 0, 0, 0, 1, 1,
-0.03540859, -0.1168853, -2.24115, 1, 1, 1, 1, 1,
-0.03327683, 3.825382, 1.194761, 1, 1, 1, 1, 1,
-0.03185742, 0.5495231, 0.4452247, 1, 1, 1, 1, 1,
-0.03135356, -2.127628, -2.988063, 1, 1, 1, 1, 1,
-0.02830157, 1.407514, -0.8607835, 1, 1, 1, 1, 1,
-0.02162216, 0.7457297, -0.4232232, 1, 1, 1, 1, 1,
-0.02054152, -0.05941742, -2.730662, 1, 1, 1, 1, 1,
-0.01982635, -0.8061998, -3.120954, 1, 1, 1, 1, 1,
-0.01909504, -1.293116, -1.902474, 1, 1, 1, 1, 1,
-0.01880036, 0.4691597, -0.8435431, 1, 1, 1, 1, 1,
-0.01499096, 0.6638066, 0.5895965, 1, 1, 1, 1, 1,
-0.01354236, -1.02376, -1.424009, 1, 1, 1, 1, 1,
-0.01121776, -0.6763382, -2.333304, 1, 1, 1, 1, 1,
-0.01009152, -0.3334544, -3.741856, 1, 1, 1, 1, 1,
-0.007983097, -0.665891, -3.83018, 1, 1, 1, 1, 1,
-0.00755938, 0.8571782, 0.9390942, 0, 0, 1, 1, 1,
-0.005198432, -1.321178, -3.261321, 1, 0, 0, 1, 1,
-0.004341959, -0.5247571, -1.311468, 1, 0, 0, 1, 1,
-0.002467751, -1.004091, -3.761132, 1, 0, 0, 1, 1,
-0.001073563, -1.182066, -2.716229, 1, 0, 0, 1, 1,
-0.0009244957, 0.2962829, -0.8190926, 1, 0, 0, 1, 1,
0.0002357994, 1.792836, 0.9239143, 0, 0, 0, 1, 1,
0.005033073, 0.8149146, 0.6256633, 0, 0, 0, 1, 1,
0.005875269, 1.365921, 0.5718098, 0, 0, 0, 1, 1,
0.008481376, 0.539814, -1.02772, 0, 0, 0, 1, 1,
0.01445294, 1.154905, 0.02072614, 0, 0, 0, 1, 1,
0.01966489, -1.36502, 2.574499, 0, 0, 0, 1, 1,
0.02299649, -0.05851836, 2.742233, 0, 0, 0, 1, 1,
0.03089873, 0.8712821, -1.371286, 1, 1, 1, 1, 1,
0.03227426, -0.330232, 4.725462, 1, 1, 1, 1, 1,
0.03411018, 0.5666175, -0.2554072, 1, 1, 1, 1, 1,
0.03479023, -0.2192498, 1.564096, 1, 1, 1, 1, 1,
0.03513786, -0.4762764, 3.077755, 1, 1, 1, 1, 1,
0.04023043, 0.335526, -0.08222295, 1, 1, 1, 1, 1,
0.04046411, 0.5130929, 0.6427999, 1, 1, 1, 1, 1,
0.04414151, -1.939458, 3.638749, 1, 1, 1, 1, 1,
0.04497028, -0.587994, 1.280716, 1, 1, 1, 1, 1,
0.04706054, -0.0397082, 2.575445, 1, 1, 1, 1, 1,
0.0472546, -0.8400893, 3.562578, 1, 1, 1, 1, 1,
0.05244065, -0.09514094, 3.207319, 1, 1, 1, 1, 1,
0.0539938, 0.9521589, 0.08746614, 1, 1, 1, 1, 1,
0.05435687, -1.175367, 2.782587, 1, 1, 1, 1, 1,
0.0621, 0.1434315, 0.6869985, 1, 1, 1, 1, 1,
0.06461143, 0.7982092, 1.097786, 0, 0, 1, 1, 1,
0.06572958, 0.09061108, 1.046395, 1, 0, 0, 1, 1,
0.06614375, -0.1980191, 2.760967, 1, 0, 0, 1, 1,
0.06623768, -2.076723, 4.200148, 1, 0, 0, 1, 1,
0.07126329, 0.09287807, -0.7377572, 1, 0, 0, 1, 1,
0.07479427, 2.492615, -0.3357106, 1, 0, 0, 1, 1,
0.07506868, 0.5605628, 1.569358, 0, 0, 0, 1, 1,
0.07689466, 1.303138, -1.22137, 0, 0, 0, 1, 1,
0.07853074, 1.142834, 0.03464913, 0, 0, 0, 1, 1,
0.08209741, -0.5347373, 2.960853, 0, 0, 0, 1, 1,
0.08209778, 0.7557191, -0.2695575, 0, 0, 0, 1, 1,
0.0880881, -0.06955946, 1.235064, 0, 0, 0, 1, 1,
0.0884991, -1.624064, 3.219571, 0, 0, 0, 1, 1,
0.09436165, 0.2993631, 0.00549028, 1, 1, 1, 1, 1,
0.09572156, -1.207336, 5.20702, 1, 1, 1, 1, 1,
0.1029592, 0.1603976, -0.5604829, 1, 1, 1, 1, 1,
0.1054217, -2.023601, 1.463532, 1, 1, 1, 1, 1,
0.1077891, -0.6978471, 4.301376, 1, 1, 1, 1, 1,
0.1089436, -1.555035, 3.816906, 1, 1, 1, 1, 1,
0.1146874, 0.3236009, 0.09871876, 1, 1, 1, 1, 1,
0.1256847, 0.1164652, 1.254468, 1, 1, 1, 1, 1,
0.127835, 0.001200175, 3.066354, 1, 1, 1, 1, 1,
0.1285224, 1.992831, 0.8675677, 1, 1, 1, 1, 1,
0.1345961, -0.7652702, 2.705486, 1, 1, 1, 1, 1,
0.1358245, -0.3639426, 2.971974, 1, 1, 1, 1, 1,
0.1397664, -0.5717908, 3.832288, 1, 1, 1, 1, 1,
0.1511231, -1.421486, 3.628608, 1, 1, 1, 1, 1,
0.1515873, 0.06765485, 1.540594, 1, 1, 1, 1, 1,
0.1556749, -0.2087386, 3.487149, 0, 0, 1, 1, 1,
0.1569939, -0.6333243, 2.207264, 1, 0, 0, 1, 1,
0.1580204, -0.8449975, 2.154405, 1, 0, 0, 1, 1,
0.1613109, -0.2632657, 2.452443, 1, 0, 0, 1, 1,
0.1654927, -0.5383123, 3.226062, 1, 0, 0, 1, 1,
0.1707964, 0.716066, -0.4134362, 1, 0, 0, 1, 1,
0.1751156, -1.503464, 2.960906, 0, 0, 0, 1, 1,
0.1768382, -1.273471, 3.80622, 0, 0, 0, 1, 1,
0.1792348, -0.06227126, 0.9265382, 0, 0, 0, 1, 1,
0.1804091, 0.2034609, 2.150429, 0, 0, 0, 1, 1,
0.1865695, -0.1798712, 2.771615, 0, 0, 0, 1, 1,
0.186704, 1.61644, 0.3395903, 0, 0, 0, 1, 1,
0.1873535, 1.266119, -0.03065073, 0, 0, 0, 1, 1,
0.1923356, 1.119034, -0.3467243, 1, 1, 1, 1, 1,
0.1926978, 0.8844568, 0.5445056, 1, 1, 1, 1, 1,
0.1927155, -0.1181031, 1.779633, 1, 1, 1, 1, 1,
0.2002128, -0.7238287, 2.540361, 1, 1, 1, 1, 1,
0.2020306, 0.7927428, -0.5721807, 1, 1, 1, 1, 1,
0.2049103, 1.670909, 1.666592, 1, 1, 1, 1, 1,
0.206403, -1.075647, 3.735285, 1, 1, 1, 1, 1,
0.207166, -1.644881, 1.823719, 1, 1, 1, 1, 1,
0.2076235, 1.208796, -0.8597043, 1, 1, 1, 1, 1,
0.2079993, 1.561417, -0.516371, 1, 1, 1, 1, 1,
0.2080074, -1.679078, 3.532366, 1, 1, 1, 1, 1,
0.2098495, 0.7655389, 0.7527772, 1, 1, 1, 1, 1,
0.2099305, 3.120496, 0.001519392, 1, 1, 1, 1, 1,
0.210079, 0.2926324, -0.8180706, 1, 1, 1, 1, 1,
0.2147215, 0.2601192, 0.1846126, 1, 1, 1, 1, 1,
0.2156672, 0.3308451, 2.609264, 0, 0, 1, 1, 1,
0.2164928, -0.08378836, 2.808186, 1, 0, 0, 1, 1,
0.2192198, -0.7124105, 0.3317628, 1, 0, 0, 1, 1,
0.220982, 0.06085015, 1.975287, 1, 0, 0, 1, 1,
0.2225075, -1.235043, 3.074571, 1, 0, 0, 1, 1,
0.2242727, -0.7002804, 3.691202, 1, 0, 0, 1, 1,
0.2265539, -0.8142456, 5.109709, 0, 0, 0, 1, 1,
0.2286628, 0.787761, -0.6234953, 0, 0, 0, 1, 1,
0.2317534, 0.9458676, -0.3532434, 0, 0, 0, 1, 1,
0.231878, -0.9111449, 3.38871, 0, 0, 0, 1, 1,
0.2331775, 0.3737098, 1.073328, 0, 0, 0, 1, 1,
0.2332847, 1.301341, 2.004403, 0, 0, 0, 1, 1,
0.2334271, -0.7401314, 2.429283, 0, 0, 0, 1, 1,
0.2354492, 2.092017, 0.6057065, 1, 1, 1, 1, 1,
0.2364203, 0.06758913, 3.873864, 1, 1, 1, 1, 1,
0.2398423, -0.07940672, 1.362443, 1, 1, 1, 1, 1,
0.2415618, 1.241751, 0.1355264, 1, 1, 1, 1, 1,
0.2449485, 1.825936, 0.2925568, 1, 1, 1, 1, 1,
0.2509039, 1.5719, -1.226857, 1, 1, 1, 1, 1,
0.2521958, -2.285551, 2.154875, 1, 1, 1, 1, 1,
0.2529636, 1.355559, 0.3797335, 1, 1, 1, 1, 1,
0.2538118, -0.9201548, 4.01253, 1, 1, 1, 1, 1,
0.2625118, 1.518837, -0.2294206, 1, 1, 1, 1, 1,
0.264656, 0.1277046, -0.5727698, 1, 1, 1, 1, 1,
0.2657284, -1.169927, 1.563801, 1, 1, 1, 1, 1,
0.2667144, 0.7313347, -0.5022697, 1, 1, 1, 1, 1,
0.2751448, -0.1009029, 1.59324, 1, 1, 1, 1, 1,
0.2786922, -0.7221195, 3.075577, 1, 1, 1, 1, 1,
0.2913039, 1.345667, -0.9715866, 0, 0, 1, 1, 1,
0.2937697, -0.6352069, 3.611429, 1, 0, 0, 1, 1,
0.2948923, 0.6987944, 0.1144851, 1, 0, 0, 1, 1,
0.2954821, -0.08292998, 0.8267592, 1, 0, 0, 1, 1,
0.296054, 0.4727083, -0.1715555, 1, 0, 0, 1, 1,
0.2969074, -0.7683957, 2.104763, 1, 0, 0, 1, 1,
0.2998296, 0.880516, 0.008069567, 0, 0, 0, 1, 1,
0.3065552, -1.338288, 3.373714, 0, 0, 0, 1, 1,
0.3078295, 1.832747, -1.36262, 0, 0, 0, 1, 1,
0.3143931, 0.5966742, 0.1937981, 0, 0, 0, 1, 1,
0.3172512, 1.072346, -0.7279913, 0, 0, 0, 1, 1,
0.3172886, 1.363289, 0.1102697, 0, 0, 0, 1, 1,
0.32152, 0.4120138, -1.500334, 0, 0, 0, 1, 1,
0.3219705, -0.5525831, 1.532322, 1, 1, 1, 1, 1,
0.3229081, -0.7427426, 1.6271, 1, 1, 1, 1, 1,
0.3235256, 0.2660115, 1.969984, 1, 1, 1, 1, 1,
0.3295902, -1.221354, 1.598595, 1, 1, 1, 1, 1,
0.3298557, -0.6165522, -0.5574241, 1, 1, 1, 1, 1,
0.331359, 2.496125, 0.8649293, 1, 1, 1, 1, 1,
0.3321436, -0.619668, 4.592619, 1, 1, 1, 1, 1,
0.3324127, 2.097434, 1.077308, 1, 1, 1, 1, 1,
0.3376483, 1.650768, -1.160858, 1, 1, 1, 1, 1,
0.3384506, -0.3366231, 3.649172, 1, 1, 1, 1, 1,
0.3416458, -1.199379, 2.484116, 1, 1, 1, 1, 1,
0.34277, 0.7570965, 0.8593217, 1, 1, 1, 1, 1,
0.3442751, -0.4287406, 2.506877, 1, 1, 1, 1, 1,
0.3498315, -0.125861, 3.031995, 1, 1, 1, 1, 1,
0.3544078, 0.1376871, 2.730401, 1, 1, 1, 1, 1,
0.3582006, -0.2018188, 1.545799, 0, 0, 1, 1, 1,
0.3619461, -0.6319885, 1.862945, 1, 0, 0, 1, 1,
0.3698963, 0.7741259, -1.07064, 1, 0, 0, 1, 1,
0.378754, -0.1151671, 1.907508, 1, 0, 0, 1, 1,
0.3803644, -0.1873034, 1.229045, 1, 0, 0, 1, 1,
0.3824879, -2.286757, 3.409334, 1, 0, 0, 1, 1,
0.3864816, -0.4832803, 0.7049769, 0, 0, 0, 1, 1,
0.3886212, 0.02623422, 2.586676, 0, 0, 0, 1, 1,
0.3905683, -1.638698, 2.96231, 0, 0, 0, 1, 1,
0.3909429, 2.386847, 0.8776885, 0, 0, 0, 1, 1,
0.3914731, -0.1246543, 1.915174, 0, 0, 0, 1, 1,
0.3951082, 0.3241074, -0.2061081, 0, 0, 0, 1, 1,
0.3978985, 1.139989, 1.209681, 0, 0, 0, 1, 1,
0.4003322, -0.3028907, 2.630727, 1, 1, 1, 1, 1,
0.403495, -1.102753, 2.608528, 1, 1, 1, 1, 1,
0.4036834, 0.06774735, 1.494601, 1, 1, 1, 1, 1,
0.4046311, -0.07950268, 0.50094, 1, 1, 1, 1, 1,
0.4078947, 1.427178, -1.041096, 1, 1, 1, 1, 1,
0.4079749, -0.1924997, 1.855427, 1, 1, 1, 1, 1,
0.4265657, -0.9956129, 3.237369, 1, 1, 1, 1, 1,
0.4277738, 0.7952775, 0.5592862, 1, 1, 1, 1, 1,
0.4326342, 0.2667266, 0.000746201, 1, 1, 1, 1, 1,
0.4367296, 1.063353, -0.3587491, 1, 1, 1, 1, 1,
0.4399819, -0.5513146, 4.273255, 1, 1, 1, 1, 1,
0.4414467, 0.852253, 0.3950737, 1, 1, 1, 1, 1,
0.4480214, -0.4765792, 3.507434, 1, 1, 1, 1, 1,
0.4533755, -0.08379235, 1.365811, 1, 1, 1, 1, 1,
0.4544555, -0.4707781, 2.512267, 1, 1, 1, 1, 1,
0.4551047, 0.4075418, 1.190936, 0, 0, 1, 1, 1,
0.4565732, -0.9684388, 2.066621, 1, 0, 0, 1, 1,
0.4573341, 1.746171, -0.4239435, 1, 0, 0, 1, 1,
0.4607045, 0.5788333, 1.491943, 1, 0, 0, 1, 1,
0.4610236, 0.4547892, 2.327769, 1, 0, 0, 1, 1,
0.461961, 0.5548192, 1.768372, 1, 0, 0, 1, 1,
0.4647527, 1.104443, 1.218135, 0, 0, 0, 1, 1,
0.4668632, 0.7622206, -0.7199742, 0, 0, 0, 1, 1,
0.4712204, -0.138787, 1.520371, 0, 0, 0, 1, 1,
0.4855524, 0.1918885, 1.25653, 0, 0, 0, 1, 1,
0.4884927, -1.089418, 1.899327, 0, 0, 0, 1, 1,
0.4893817, -1.867509, 1.066618, 0, 0, 0, 1, 1,
0.4908752, -0.5624865, 1.690243, 0, 0, 0, 1, 1,
0.4922224, -0.655345, 3.498336, 1, 1, 1, 1, 1,
0.4930062, 0.2613364, 1.251193, 1, 1, 1, 1, 1,
0.4953192, -1.203113, 2.848531, 1, 1, 1, 1, 1,
0.4999958, 0.2550363, 1.980343, 1, 1, 1, 1, 1,
0.500521, 0.5199286, 0.8540961, 1, 1, 1, 1, 1,
0.5014129, 0.4101898, -0.792394, 1, 1, 1, 1, 1,
0.5025465, -0.7359833, 2.409062, 1, 1, 1, 1, 1,
0.5052566, 0.9079191, 0.2326702, 1, 1, 1, 1, 1,
0.5073019, 0.9892727, 0.875616, 1, 1, 1, 1, 1,
0.5088665, -1.008528, 2.919286, 1, 1, 1, 1, 1,
0.509586, 0.718438, -0.6044773, 1, 1, 1, 1, 1,
0.5150364, 1.947706, -0.1127639, 1, 1, 1, 1, 1,
0.5189815, -1.605255, 3.15542, 1, 1, 1, 1, 1,
0.5222721, 1.346015, -0.7471847, 1, 1, 1, 1, 1,
0.528502, 0.08144474, 0.4931283, 1, 1, 1, 1, 1,
0.5359312, -0.0458742, 2.562631, 0, 0, 1, 1, 1,
0.537563, -0.5717642, 2.30345, 1, 0, 0, 1, 1,
0.5393849, 0.8454907, 0.9382786, 1, 0, 0, 1, 1,
0.5398992, 1.607574, 1.707141, 1, 0, 0, 1, 1,
0.5422795, 0.8385046, -0.07658385, 1, 0, 0, 1, 1,
0.5434485, 0.03192138, -0.2937485, 1, 0, 0, 1, 1,
0.5448707, 0.8372676, 0.3286663, 0, 0, 0, 1, 1,
0.5458117, -0.4024619, 2.50882, 0, 0, 0, 1, 1,
0.5568947, 0.6049396, -0.2254631, 0, 0, 0, 1, 1,
0.5656899, 0.6904811, 1.952758, 0, 0, 0, 1, 1,
0.5715894, 0.05941098, 3.676406, 0, 0, 0, 1, 1,
0.5718539, 0.8205554, 2.457217, 0, 0, 0, 1, 1,
0.5849095, -1.034712, 0.5522891, 0, 0, 0, 1, 1,
0.5868394, -0.05530829, 3.390676, 1, 1, 1, 1, 1,
0.5931852, 0.6153344, 0.7253057, 1, 1, 1, 1, 1,
0.5993375, -0.2785208, -0.3579679, 1, 1, 1, 1, 1,
0.6020586, 1.016922, -0.337251, 1, 1, 1, 1, 1,
0.6031375, -1.318827, 1.830417, 1, 1, 1, 1, 1,
0.6041041, 0.08163914, 0.6840462, 1, 1, 1, 1, 1,
0.6080012, -1.039396, 4.660453, 1, 1, 1, 1, 1,
0.6090069, 1.166214, 0.1992045, 1, 1, 1, 1, 1,
0.6096128, 1.410287, 0.893932, 1, 1, 1, 1, 1,
0.6105965, 0.4531642, 2.656809, 1, 1, 1, 1, 1,
0.6146415, -0.4229356, -0.1227192, 1, 1, 1, 1, 1,
0.6158025, 0.5624537, 2.006812, 1, 1, 1, 1, 1,
0.6164774, -2.032696, 1.591647, 1, 1, 1, 1, 1,
0.619674, 0.1933152, 0.4828919, 1, 1, 1, 1, 1,
0.6224235, -1.36785, 2.765498, 1, 1, 1, 1, 1,
0.6322159, 1.628611, 1.51475, 0, 0, 1, 1, 1,
0.6354668, -1.195324, 1.736449, 1, 0, 0, 1, 1,
0.6401684, -1.984649, 3.295445, 1, 0, 0, 1, 1,
0.6420067, -0.1987239, 2.362571, 1, 0, 0, 1, 1,
0.6525393, -1.395973, 2.759843, 1, 0, 0, 1, 1,
0.6549463, -0.5130078, 4.531466, 1, 0, 0, 1, 1,
0.6573811, 0.6576228, 0.9191383, 0, 0, 0, 1, 1,
0.6614851, 0.2606952, 3.103012, 0, 0, 0, 1, 1,
0.6619365, 1.909316, 0.5457896, 0, 0, 0, 1, 1,
0.6622179, -0.22889, 4.461386, 0, 0, 0, 1, 1,
0.6681351, -0.1657638, 1.178769, 0, 0, 0, 1, 1,
0.669866, 0.05663386, 3.634588, 0, 0, 0, 1, 1,
0.6722096, 1.258735, -1.489435, 0, 0, 0, 1, 1,
0.6798807, 0.2914147, 1.695039, 1, 1, 1, 1, 1,
0.6935923, -0.5490489, 3.210827, 1, 1, 1, 1, 1,
0.6975089, -1.561426, 0.3236482, 1, 1, 1, 1, 1,
0.701116, 1.393457, 1.038616, 1, 1, 1, 1, 1,
0.7023031, -0.2043043, 1.276389, 1, 1, 1, 1, 1,
0.7056259, -0.1866808, 1.582496, 1, 1, 1, 1, 1,
0.7165921, -1.837426, 4.155286, 1, 1, 1, 1, 1,
0.7175455, 0.6779584, 1.015478, 1, 1, 1, 1, 1,
0.7188649, -0.1677662, 1.245512, 1, 1, 1, 1, 1,
0.7201346, -0.3488626, 2.504312, 1, 1, 1, 1, 1,
0.7246005, 0.09099034, 1.547121, 1, 1, 1, 1, 1,
0.7262899, 0.08584774, 3.775442, 1, 1, 1, 1, 1,
0.7436234, 0.815991, -0.6609382, 1, 1, 1, 1, 1,
0.744803, -0.6739649, 1.330102, 1, 1, 1, 1, 1,
0.745232, 0.7138745, 0.2704507, 1, 1, 1, 1, 1,
0.7508862, -0.2083233, 1.855602, 0, 0, 1, 1, 1,
0.7519341, 0.009761881, 1.685412, 1, 0, 0, 1, 1,
0.7534792, -1.104337, 4.514892, 1, 0, 0, 1, 1,
0.754023, 0.6441637, 1.965959, 1, 0, 0, 1, 1,
0.7617205, -1.307946, 2.077724, 1, 0, 0, 1, 1,
0.7676131, 0.2297579, 1.461613, 1, 0, 0, 1, 1,
0.7721446, -0.09265094, 3.114259, 0, 0, 0, 1, 1,
0.7749166, 0.9701912, 2.470879, 0, 0, 0, 1, 1,
0.7764814, 1.323064, 0.5617231, 0, 0, 0, 1, 1,
0.784905, -0.6001642, 0.4787025, 0, 0, 0, 1, 1,
0.7873287, -0.5490048, 1.069724, 0, 0, 0, 1, 1,
0.7952142, 1.988665, 2.624348, 0, 0, 0, 1, 1,
0.7965758, -0.7019299, 1.555738, 0, 0, 0, 1, 1,
0.7969668, 1.051041, 0.6716022, 1, 1, 1, 1, 1,
0.800205, 1.64474, -1.65677, 1, 1, 1, 1, 1,
0.802179, 0.6188787, 0.3390295, 1, 1, 1, 1, 1,
0.8049509, 1.612146, 1.581092, 1, 1, 1, 1, 1,
0.808919, 0.9690369, 1.967178, 1, 1, 1, 1, 1,
0.8106835, -1.129671, 2.874224, 1, 1, 1, 1, 1,
0.8118138, 1.075583, 0.7590412, 1, 1, 1, 1, 1,
0.8188218, 0.2575403, 0.8200716, 1, 1, 1, 1, 1,
0.8189868, 0.6700385, 1.677808, 1, 1, 1, 1, 1,
0.8274627, -0.3692318, 2.357045, 1, 1, 1, 1, 1,
0.8289393, 2.672678, 1.387924, 1, 1, 1, 1, 1,
0.8299864, -0.3787581, 1.377982, 1, 1, 1, 1, 1,
0.8373107, -0.7540504, 2.457371, 1, 1, 1, 1, 1,
0.8449394, -0.6667184, 0.7519731, 1, 1, 1, 1, 1,
0.8464673, -0.6621911, 2.400158, 1, 1, 1, 1, 1,
0.8547275, -0.7596326, 0.8568602, 0, 0, 1, 1, 1,
0.859572, -1.07371, 5.092414, 1, 0, 0, 1, 1,
0.8602017, 0.7035986, 0.2594835, 1, 0, 0, 1, 1,
0.8669729, -1.177329, 2.297272, 1, 0, 0, 1, 1,
0.8687893, 0.2830078, 2.789283, 1, 0, 0, 1, 1,
0.8762795, -0.743315, 1.485988, 1, 0, 0, 1, 1,
0.876883, 0.5586312, -0.1265572, 0, 0, 0, 1, 1,
0.8772358, -1.888734, 2.717719, 0, 0, 0, 1, 1,
0.8792735, -0.3714361, 0.1832552, 0, 0, 0, 1, 1,
0.8825641, 0.5328113, -0.1564566, 0, 0, 0, 1, 1,
0.8875426, -0.6070031, 1.405392, 0, 0, 0, 1, 1,
0.8887765, -0.8638736, 2.604663, 0, 0, 0, 1, 1,
0.8908232, 0.3694083, 1.063276, 0, 0, 0, 1, 1,
0.89096, 1.96621, 0.8925832, 1, 1, 1, 1, 1,
0.8935638, 0.8186482, -0.5167289, 1, 1, 1, 1, 1,
0.8938741, 0.2908163, 1.943317, 1, 1, 1, 1, 1,
0.8939089, -0.02504712, 4.004611, 1, 1, 1, 1, 1,
0.8948194, 1.256569, 1.52501, 1, 1, 1, 1, 1,
0.9039167, 0.7315947, 1.207418, 1, 1, 1, 1, 1,
0.9083398, -0.2385962, 2.891988, 1, 1, 1, 1, 1,
0.9087391, 0.685848, 0.9541855, 1, 1, 1, 1, 1,
0.9133554, 1.059625, 1.737817, 1, 1, 1, 1, 1,
0.9147089, 1.073893, -0.08373527, 1, 1, 1, 1, 1,
0.9159821, 0.8753738, -0.3002897, 1, 1, 1, 1, 1,
0.9179235, -0.941012, 2.360425, 1, 1, 1, 1, 1,
0.9292601, -0.4113936, 2.017417, 1, 1, 1, 1, 1,
0.9315993, -0.7282704, 2.143724, 1, 1, 1, 1, 1,
0.937205, 0.6014525, 0.8159495, 1, 1, 1, 1, 1,
0.9374767, -1.757255, 1.644212, 0, 0, 1, 1, 1,
0.9395849, 1.276705, 1.804838, 1, 0, 0, 1, 1,
0.940537, 0.2061044, 0.839341, 1, 0, 0, 1, 1,
0.9412196, -0.3863915, 2.049601, 1, 0, 0, 1, 1,
0.943665, 0.1772475, 1.215234, 1, 0, 0, 1, 1,
0.9506959, 0.1903692, 1.033244, 1, 0, 0, 1, 1,
0.956751, -0.7368279, 1.529477, 0, 0, 0, 1, 1,
0.9604275, -0.5465501, 1.424221, 0, 0, 0, 1, 1,
0.9623452, -1.087579, 2.255471, 0, 0, 0, 1, 1,
0.9646272, 0.0348177, 2.766972, 0, 0, 0, 1, 1,
0.9711298, 0.4525017, 0.215047, 0, 0, 0, 1, 1,
0.9785767, -0.2412514, 2.926287, 0, 0, 0, 1, 1,
0.9791732, -0.1364277, 1.559892, 0, 0, 0, 1, 1,
0.981321, -0.9830198, 1.935015, 1, 1, 1, 1, 1,
0.9858349, -0.2742811, 0.9315528, 1, 1, 1, 1, 1,
0.9881476, 0.2508735, 3.32091, 1, 1, 1, 1, 1,
0.9902523, 1.423151, 1.113188, 1, 1, 1, 1, 1,
0.9961105, -1.738898, 4.230922, 1, 1, 1, 1, 1,
1.004815, -0.9794842, 2.398315, 1, 1, 1, 1, 1,
1.016305, -1.011214, 1.034087, 1, 1, 1, 1, 1,
1.023006, 0.8592067, 0.592326, 1, 1, 1, 1, 1,
1.024133, -1.88503, 1.447467, 1, 1, 1, 1, 1,
1.027651, 0.7301663, 0.2232424, 1, 1, 1, 1, 1,
1.036821, -0.02272382, 2.309975, 1, 1, 1, 1, 1,
1.03738, 1.333702, -0.1353533, 1, 1, 1, 1, 1,
1.044351, 0.8946965, 0.7946029, 1, 1, 1, 1, 1,
1.045777, -0.06212094, 1.480726, 1, 1, 1, 1, 1,
1.047324, 0.5728671, -0.8187751, 1, 1, 1, 1, 1,
1.053267, 0.05608699, 1.11161, 0, 0, 1, 1, 1,
1.055466, 1.445921, 2.089569, 1, 0, 0, 1, 1,
1.057564, 0.7742923, 1.407479, 1, 0, 0, 1, 1,
1.068451, -1.505783, 2.216389, 1, 0, 0, 1, 1,
1.07361, 0.0626045, 3.145171, 1, 0, 0, 1, 1,
1.076679, -0.6926804, 1.503277, 1, 0, 0, 1, 1,
1.077887, 0.4503183, 0.6970378, 0, 0, 0, 1, 1,
1.07944, -0.2382285, 3.105348, 0, 0, 0, 1, 1,
1.087697, -0.6488109, 1.961399, 0, 0, 0, 1, 1,
1.089329, -0.8059691, 2.305078, 0, 0, 0, 1, 1,
1.0905, -0.1409954, -0.2444111, 0, 0, 0, 1, 1,
1.091555, 0.2716648, 2.488422, 0, 0, 0, 1, 1,
1.093101, 0.3277137, 0.7156054, 0, 0, 0, 1, 1,
1.095393, 0.2002772, 1.137991, 1, 1, 1, 1, 1,
1.095626, -0.9179532, 3.264583, 1, 1, 1, 1, 1,
1.097432, -0.3413851, 1.751701, 1, 1, 1, 1, 1,
1.101241, -0.03734897, 1.195441, 1, 1, 1, 1, 1,
1.112301, -1.010353, 3.772128, 1, 1, 1, 1, 1,
1.11649, -1.919406, 2.602926, 1, 1, 1, 1, 1,
1.119784, -0.9924749, 1.95349, 1, 1, 1, 1, 1,
1.12131, 0.6236666, -1.157645, 1, 1, 1, 1, 1,
1.138898, -2.256191, 2.477369, 1, 1, 1, 1, 1,
1.160631, 0.2648482, 2.403142, 1, 1, 1, 1, 1,
1.162501, -0.3870334, 3.061415, 1, 1, 1, 1, 1,
1.17355, 0.3021139, 0.8906067, 1, 1, 1, 1, 1,
1.174376, 0.3397693, 0.7035673, 1, 1, 1, 1, 1,
1.176437, 0.04967453, 3.034277, 1, 1, 1, 1, 1,
1.178793, -0.458218, 2.374357, 1, 1, 1, 1, 1,
1.181069, -1.973931, 1.33609, 0, 0, 1, 1, 1,
1.183478, 1.16065, 0.005848308, 1, 0, 0, 1, 1,
1.184121, -0.1828379, 0.7643777, 1, 0, 0, 1, 1,
1.190826, -2.45586, 3.028165, 1, 0, 0, 1, 1,
1.192804, -0.09302773, 0.7695903, 1, 0, 0, 1, 1,
1.193403, -0.1355331, 1.590276, 1, 0, 0, 1, 1,
1.198336, -0.3554774, 1.132931, 0, 0, 0, 1, 1,
1.20691, 1.527126, 1.851766, 0, 0, 0, 1, 1,
1.212056, 1.094148, 1.518024, 0, 0, 0, 1, 1,
1.214788, -1.920247, 1.732783, 0, 0, 0, 1, 1,
1.234315, 0.1458925, 2.541218, 0, 0, 0, 1, 1,
1.238372, -1.912487, 4.094018, 0, 0, 0, 1, 1,
1.249147, 0.9987762, 0.672942, 0, 0, 0, 1, 1,
1.257352, 0.02308912, -1.12373, 1, 1, 1, 1, 1,
1.260375, 0.832958, 1.376334, 1, 1, 1, 1, 1,
1.2672, -0.1794066, 1.730871, 1, 1, 1, 1, 1,
1.27063, 1.358927, 2.566286, 1, 1, 1, 1, 1,
1.27289, 0.4980491, 3.708477, 1, 1, 1, 1, 1,
1.27476, 1.170022, 1.523704, 1, 1, 1, 1, 1,
1.27829, 0.5014425, 3.708163, 1, 1, 1, 1, 1,
1.28063, 0.5340471, 1.508385, 1, 1, 1, 1, 1,
1.285352, -2.302821, 1.970507, 1, 1, 1, 1, 1,
1.288431, 1.950987, 0.2639124, 1, 1, 1, 1, 1,
1.289546, 0.6724076, 1.991108, 1, 1, 1, 1, 1,
1.299672, 2.377675, -0.165858, 1, 1, 1, 1, 1,
1.303398, -0.6750296, 1.155057, 1, 1, 1, 1, 1,
1.321732, -0.5326749, 2.987051, 1, 1, 1, 1, 1,
1.341812, 1.033137, 1.072169, 1, 1, 1, 1, 1,
1.349833, -0.3397133, 1.348747, 0, 0, 1, 1, 1,
1.351672, -0.3640542, 1.316334, 1, 0, 0, 1, 1,
1.360409, 0.6974756, 0.8786116, 1, 0, 0, 1, 1,
1.363077, 0.535858, 1.366806, 1, 0, 0, 1, 1,
1.369941, 0.9328073, 0.5008071, 1, 0, 0, 1, 1,
1.373232, 0.9444595, -0.08003782, 1, 0, 0, 1, 1,
1.374951, -2.005384, 3.463284, 0, 0, 0, 1, 1,
1.37735, -0.6649647, 2.438129, 0, 0, 0, 1, 1,
1.378731, -0.6696427, 1.540255, 0, 0, 0, 1, 1,
1.379949, -1.332476, 1.498435, 0, 0, 0, 1, 1,
1.386873, 1.3483, 0.86035, 0, 0, 0, 1, 1,
1.413137, 1.29275, -0.1768609, 0, 0, 0, 1, 1,
1.417971, -1.993144, 0.8708161, 0, 0, 0, 1, 1,
1.421344, -0.5804935, 1.776252, 1, 1, 1, 1, 1,
1.423388, -0.6181471, 1.502334, 1, 1, 1, 1, 1,
1.429541, 0.3831725, 1.658661, 1, 1, 1, 1, 1,
1.433792, 0.8224617, 0.9430979, 1, 1, 1, 1, 1,
1.440013, 0.3392163, 2.360334, 1, 1, 1, 1, 1,
1.442839, 1.031973, 0.08029166, 1, 1, 1, 1, 1,
1.445208, 0.3129959, 0.4691513, 1, 1, 1, 1, 1,
1.445735, -0.3883379, 2.600863, 1, 1, 1, 1, 1,
1.45051, 0.9136637, -0.1950388, 1, 1, 1, 1, 1,
1.459232, -1.095873, 0.9081413, 1, 1, 1, 1, 1,
1.46984, -0.8098412, 2.09766, 1, 1, 1, 1, 1,
1.476864, -0.4614886, 2.415347, 1, 1, 1, 1, 1,
1.478208, 1.744881, 0.1236375, 1, 1, 1, 1, 1,
1.483586, 0.2196004, 1.221105, 1, 1, 1, 1, 1,
1.499403, -1.842003, 2.494709, 1, 1, 1, 1, 1,
1.502085, -0.5946789, 1.315242, 0, 0, 1, 1, 1,
1.502789, 0.1127119, 2.695103, 1, 0, 0, 1, 1,
1.505502, -0.8947319, 1.639944, 1, 0, 0, 1, 1,
1.521535, -0.1154132, 1.390482, 1, 0, 0, 1, 1,
1.54508, -0.03266469, 2.405678, 1, 0, 0, 1, 1,
1.551872, 1.745309, 0.9847015, 1, 0, 0, 1, 1,
1.553082, 0.237878, 1.593658, 0, 0, 0, 1, 1,
1.55566, -0.9165419, 1.384211, 0, 0, 0, 1, 1,
1.55587, -2.446113, 2.084034, 0, 0, 0, 1, 1,
1.561206, -0.09622052, 3.927794, 0, 0, 0, 1, 1,
1.569533, 0.04077687, 0.3084475, 0, 0, 0, 1, 1,
1.572423, 0.9573308, 0.6473438, 0, 0, 0, 1, 1,
1.577642, 0.2416951, 0.4470969, 0, 0, 0, 1, 1,
1.581608, -0.2444581, 3.112046, 1, 1, 1, 1, 1,
1.583382, -0.1791632, 0.6583835, 1, 1, 1, 1, 1,
1.586363, -1.001184, 2.35266, 1, 1, 1, 1, 1,
1.598667, 0.5912866, 2.396461, 1, 1, 1, 1, 1,
1.606278, 0.2669419, 1.925698, 1, 1, 1, 1, 1,
1.609284, 0.6612266, 0.6508558, 1, 1, 1, 1, 1,
1.612217, 1.484136, 1.600219, 1, 1, 1, 1, 1,
1.642718, -0.1021679, -0.1218087, 1, 1, 1, 1, 1,
1.666797, -1.006289, 1.494218, 1, 1, 1, 1, 1,
1.66757, 0.7152525, 1.610606, 1, 1, 1, 1, 1,
1.671486, 0.5487523, 2.232917, 1, 1, 1, 1, 1,
1.672109, -1.279399, 2.573195, 1, 1, 1, 1, 1,
1.673736, 1.120531, -0.6388763, 1, 1, 1, 1, 1,
1.674729, 1.002735, 0.1161075, 1, 1, 1, 1, 1,
1.678241, -0.5724965, 1.289057, 1, 1, 1, 1, 1,
1.67971, -0.9442717, 1.915336, 0, 0, 1, 1, 1,
1.704561, 1.694926, -0.7028326, 1, 0, 0, 1, 1,
1.72802, 1.309393, 0.3498744, 1, 0, 0, 1, 1,
1.73729, 1.154988, 1.207969, 1, 0, 0, 1, 1,
1.743756, 0.1818097, 2.461577, 1, 0, 0, 1, 1,
1.744931, 1.438401, 1.062493, 1, 0, 0, 1, 1,
1.754314, -1.336419, 1.429935, 0, 0, 0, 1, 1,
1.770117, 0.1792822, 2.006605, 0, 0, 0, 1, 1,
1.786588, 0.1337225, 2.707295, 0, 0, 0, 1, 1,
1.798972, 0.513636, 1.714239, 0, 0, 0, 1, 1,
1.801091, 1.50541, 0.8437879, 0, 0, 0, 1, 1,
1.801834, 0.5620148, 2.261384, 0, 0, 0, 1, 1,
1.819114, 0.5499529, 1.721565, 0, 0, 0, 1, 1,
1.820135, 1.337187, 0.7523981, 1, 1, 1, 1, 1,
1.824903, 0.788816, 0.961612, 1, 1, 1, 1, 1,
1.837517, -1.837762, 2.427203, 1, 1, 1, 1, 1,
1.842157, 0.8377641, 1.309842, 1, 1, 1, 1, 1,
1.859586, 0.4106157, 0.9667691, 1, 1, 1, 1, 1,
1.891672, -2.41242, 2.389984, 1, 1, 1, 1, 1,
1.914799, 1.253284, 1.238131, 1, 1, 1, 1, 1,
1.919617, 0.6418632, 1.176371, 1, 1, 1, 1, 1,
1.939832, -2.305732, 2.170009, 1, 1, 1, 1, 1,
1.94354, -0.07245518, 1.170438, 1, 1, 1, 1, 1,
1.949245, -1.408613, 3.182572, 1, 1, 1, 1, 1,
1.951984, -1.65152, 2.020859, 1, 1, 1, 1, 1,
1.969118, 1.077913, 1.621733, 1, 1, 1, 1, 1,
1.969605, -1.233058, 2.427603, 1, 1, 1, 1, 1,
1.981644, -0.5096164, 2.418864, 1, 1, 1, 1, 1,
1.982614, -1.227259, 2.96203, 0, 0, 1, 1, 1,
1.985204, -0.4482059, 2.32681, 1, 0, 0, 1, 1,
2.025171, 0.1487026, 1.501718, 1, 0, 0, 1, 1,
2.077647, -1.373429, 2.328944, 1, 0, 0, 1, 1,
2.133656, 0.4245626, 1.149251, 1, 0, 0, 1, 1,
2.140773, -0.8237265, 3.303341, 1, 0, 0, 1, 1,
2.155206, -0.4590605, 1.341931, 0, 0, 0, 1, 1,
2.158128, 1.482051, 0.3508961, 0, 0, 0, 1, 1,
2.199381, -0.6599851, 1.894288, 0, 0, 0, 1, 1,
2.234064, -0.04818134, 0.905405, 0, 0, 0, 1, 1,
2.282351, -1.437652, 2.721068, 0, 0, 0, 1, 1,
2.367322, 0.4787087, 0.8712901, 0, 0, 0, 1, 1,
2.382421, 0.1395892, 0.379554, 0, 0, 0, 1, 1,
2.525696, 0.4731518, 0.6904083, 1, 1, 1, 1, 1,
2.560121, -0.4323927, -0.1614992, 1, 1, 1, 1, 1,
2.62708, -0.8047362, 1.931301, 1, 1, 1, 1, 1,
2.925038, -0.03138262, 1.218708, 1, 1, 1, 1, 1,
2.936216, -1.048101, 1.756122, 1, 1, 1, 1, 1,
3.351015, 0.8351262, 2.236834, 1, 1, 1, 1, 1,
3.871938, -1.052552, 1.492406, 1, 1, 1, 1, 1
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
var radius = 9.708218;
var distance = 34.0997;
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
mvMatrix.translate( -0.1877613, -0.3064208, -0.2463465 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0997);
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
