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
-2.79085, 2.262728, 0.2894118, 1, 0, 0, 1,
-2.593698, 0.02216332, -2.48577, 1, 0.007843138, 0, 1,
-2.55843, 0.09858389, -1.671, 1, 0.01176471, 0, 1,
-2.524505, -0.109038, -1.069616, 1, 0.01960784, 0, 1,
-2.447439, 0.1041461, -1.957417, 1, 0.02352941, 0, 1,
-2.421918, 1.62464, -0.9484838, 1, 0.03137255, 0, 1,
-2.382329, 1.653764, -2.708264, 1, 0.03529412, 0, 1,
-2.354599, -1.297482, -1.756509, 1, 0.04313726, 0, 1,
-2.353407, 0.546165, -0.3131533, 1, 0.04705882, 0, 1,
-2.317809, 0.2511896, -1.473675, 1, 0.05490196, 0, 1,
-2.302396, 0.7759867, -0.7548501, 1, 0.05882353, 0, 1,
-2.270931, 0.2485514, -1.06048, 1, 0.06666667, 0, 1,
-2.226238, 0.2182465, -0.7577352, 1, 0.07058824, 0, 1,
-2.173777, 0.225286, -2.226844, 1, 0.07843138, 0, 1,
-2.167861, 0.1210232, -2.113327, 1, 0.08235294, 0, 1,
-2.037197, 0.4184497, -0.6954345, 1, 0.09019608, 0, 1,
-2.02665, -0.8988076, -1.18471, 1, 0.09411765, 0, 1,
-1.930943, -1.177028, -1.92986, 1, 0.1019608, 0, 1,
-1.903171, 1.152959, 0.137617, 1, 0.1098039, 0, 1,
-1.890987, 2.179165, -0.3147297, 1, 0.1137255, 0, 1,
-1.890257, -0.7061428, -2.090728, 1, 0.1215686, 0, 1,
-1.884559, 0.1541431, -3.711926, 1, 0.1254902, 0, 1,
-1.866054, 0.1235793, -0.2099698, 1, 0.1333333, 0, 1,
-1.852517, 0.3855632, -0.402079, 1, 0.1372549, 0, 1,
-1.84661, -1.023806, -2.310495, 1, 0.145098, 0, 1,
-1.806649, -1.247887, -1.612931, 1, 0.1490196, 0, 1,
-1.789275, -0.5888689, -0.0580072, 1, 0.1568628, 0, 1,
-1.788446, -0.4237808, -1.784104, 1, 0.1607843, 0, 1,
-1.785749, -0.3166495, -1.778747, 1, 0.1686275, 0, 1,
-1.784855, -0.07247187, -4.28551, 1, 0.172549, 0, 1,
-1.775842, 0.525832, -1.615136, 1, 0.1803922, 0, 1,
-1.768836, 0.9429466, 0.3717371, 1, 0.1843137, 0, 1,
-1.729327, 0.2997386, -2.131735, 1, 0.1921569, 0, 1,
-1.727248, -2.278123, -3.446303, 1, 0.1960784, 0, 1,
-1.722781, -0.05433145, -1.298591, 1, 0.2039216, 0, 1,
-1.719805, -0.2610439, -1.554178, 1, 0.2117647, 0, 1,
-1.713258, -0.01409384, -0.8670336, 1, 0.2156863, 0, 1,
-1.712459, 0.6363186, -1.036478, 1, 0.2235294, 0, 1,
-1.702325, -0.01140462, -2.859838, 1, 0.227451, 0, 1,
-1.697308, -1.156379, -3.166047, 1, 0.2352941, 0, 1,
-1.673657, -0.8007469, -1.801415, 1, 0.2392157, 0, 1,
-1.66926, 1.42671, -2.009491, 1, 0.2470588, 0, 1,
-1.663175, 0.7074062, -0.859082, 1, 0.2509804, 0, 1,
-1.649966, -0.5368423, -2.201891, 1, 0.2588235, 0, 1,
-1.638956, 0.6465091, -0.5472356, 1, 0.2627451, 0, 1,
-1.636734, -0.1877449, -2.466535, 1, 0.2705882, 0, 1,
-1.622408, 1.083351, 0.1894042, 1, 0.2745098, 0, 1,
-1.578112, 0.4740736, -1.38651, 1, 0.282353, 0, 1,
-1.57667, 0.5638463, -0.9410173, 1, 0.2862745, 0, 1,
-1.576452, 0.8600917, -2.258095, 1, 0.2941177, 0, 1,
-1.574381, 0.6645569, -1.554294, 1, 0.3019608, 0, 1,
-1.567588, -0.4007538, -0.1913591, 1, 0.3058824, 0, 1,
-1.565358, 0.7436144, -1.950994, 1, 0.3137255, 0, 1,
-1.552651, 0.8237406, -0.4629683, 1, 0.3176471, 0, 1,
-1.548283, -0.1916161, -2.20563, 1, 0.3254902, 0, 1,
-1.529265, -0.6104517, -2.682546, 1, 0.3294118, 0, 1,
-1.502933, 0.7011532, -3.216646, 1, 0.3372549, 0, 1,
-1.502774, -1.058341, -1.410536, 1, 0.3411765, 0, 1,
-1.495374, -1.021626, -3.768324, 1, 0.3490196, 0, 1,
-1.487483, -0.7232219, -2.610891, 1, 0.3529412, 0, 1,
-1.486571, -0.5051168, -2.737169, 1, 0.3607843, 0, 1,
-1.469699, -1.098407, -1.353202, 1, 0.3647059, 0, 1,
-1.467302, -0.4248462, -3.164522, 1, 0.372549, 0, 1,
-1.460641, 0.3904898, -2.523789, 1, 0.3764706, 0, 1,
-1.459426, 0.5034452, -0.9589604, 1, 0.3843137, 0, 1,
-1.457217, -0.633219, -2.670832, 1, 0.3882353, 0, 1,
-1.454572, -0.6261278, -1.937029, 1, 0.3960784, 0, 1,
-1.453352, -1.322764, -2.941011, 1, 0.4039216, 0, 1,
-1.448999, -0.1168807, -1.825927, 1, 0.4078431, 0, 1,
-1.446946, 0.3608294, -1.674336, 1, 0.4156863, 0, 1,
-1.441215, 0.2183273, -0.789765, 1, 0.4196078, 0, 1,
-1.4403, 0.1892739, -2.178476, 1, 0.427451, 0, 1,
-1.437235, -0.2066917, -3.373915, 1, 0.4313726, 0, 1,
-1.424319, -0.779889, -0.6316718, 1, 0.4392157, 0, 1,
-1.423344, -0.1921003, -0.2958477, 1, 0.4431373, 0, 1,
-1.421351, -1.67215, -1.652617, 1, 0.4509804, 0, 1,
-1.420078, -0.3947678, -0.2605739, 1, 0.454902, 0, 1,
-1.411331, -0.2236245, -2.193184, 1, 0.4627451, 0, 1,
-1.406879, 0.2585003, -1.727761, 1, 0.4666667, 0, 1,
-1.392729, -0.2780507, 1.010973, 1, 0.4745098, 0, 1,
-1.38904, -2.232688, -2.632087, 1, 0.4784314, 0, 1,
-1.363604, 0.5099323, -2.539254, 1, 0.4862745, 0, 1,
-1.354074, -1.245014, -1.64797, 1, 0.4901961, 0, 1,
-1.351077, -0.4495248, -1.014918, 1, 0.4980392, 0, 1,
-1.348951, 0.06333419, -1.655583, 1, 0.5058824, 0, 1,
-1.342987, 0.1338649, -1.200293, 1, 0.509804, 0, 1,
-1.339831, 0.03753156, -0.9616879, 1, 0.5176471, 0, 1,
-1.339506, 0.02497706, -1.27523, 1, 0.5215687, 0, 1,
-1.337913, 0.09647557, -1.350117, 1, 0.5294118, 0, 1,
-1.33322, -0.7935136, -3.166167, 1, 0.5333334, 0, 1,
-1.331263, -0.4351358, -3.904492, 1, 0.5411765, 0, 1,
-1.322491, -0.04826763, 0.09239126, 1, 0.5450981, 0, 1,
-1.322164, 0.1277631, -1.548362, 1, 0.5529412, 0, 1,
-1.319048, -1.137919, -1.468925, 1, 0.5568628, 0, 1,
-1.318295, 1.545649, -0.7522674, 1, 0.5647059, 0, 1,
-1.317118, -1.701464, -2.8533, 1, 0.5686275, 0, 1,
-1.313669, -0.09188921, -1.498994, 1, 0.5764706, 0, 1,
-1.313221, -0.600409, -1.895886, 1, 0.5803922, 0, 1,
-1.310898, -0.4793625, -1.965833, 1, 0.5882353, 0, 1,
-1.310292, -0.732873, -2.421403, 1, 0.5921569, 0, 1,
-1.306892, -1.338491, -2.593935, 1, 0.6, 0, 1,
-1.302043, -0.6490184, -2.809042, 1, 0.6078432, 0, 1,
-1.293882, -0.3625934, -1.703492, 1, 0.6117647, 0, 1,
-1.293286, -0.4564332, -1.758782, 1, 0.6196079, 0, 1,
-1.291747, 2.336544, -1.060147, 1, 0.6235294, 0, 1,
-1.288168, -0.757566, -3.229309, 1, 0.6313726, 0, 1,
-1.283911, 1.287553, -0.4466373, 1, 0.6352941, 0, 1,
-1.280103, 0.6924915, -1.856252, 1, 0.6431373, 0, 1,
-1.278548, 2.571049, -1.48139, 1, 0.6470588, 0, 1,
-1.276076, 0.8539793, -1.800301, 1, 0.654902, 0, 1,
-1.266946, 0.986779, -0.3449864, 1, 0.6588235, 0, 1,
-1.2603, 0.8836682, -2.483979, 1, 0.6666667, 0, 1,
-1.257666, -1.675619, -3.059101, 1, 0.6705883, 0, 1,
-1.252449, 1.582565, 0.4553389, 1, 0.6784314, 0, 1,
-1.251899, -0.09456807, -1.207015, 1, 0.682353, 0, 1,
-1.240992, 0.01309208, -3.153852, 1, 0.6901961, 0, 1,
-1.237941, -1.521004, -2.715588, 1, 0.6941177, 0, 1,
-1.23771, -0.1524246, -2.266343, 1, 0.7019608, 0, 1,
-1.235662, -1.399108, -3.189402, 1, 0.7098039, 0, 1,
-1.235316, 2.704174, -2.103785, 1, 0.7137255, 0, 1,
-1.235273, -0.111757, -1.705447, 1, 0.7215686, 0, 1,
-1.229179, -1.089252, -1.972638, 1, 0.7254902, 0, 1,
-1.227535, 0.9191294, -1.433552, 1, 0.7333333, 0, 1,
-1.222285, -1.823359, -1.50386, 1, 0.7372549, 0, 1,
-1.218168, -0.8481331, -2.852304, 1, 0.7450981, 0, 1,
-1.208706, -0.2641636, -3.275598, 1, 0.7490196, 0, 1,
-1.207133, -0.6490988, -1.863573, 1, 0.7568628, 0, 1,
-1.198071, -0.1841168, -2.654606, 1, 0.7607843, 0, 1,
-1.188146, -0.09066208, -1.64507, 1, 0.7686275, 0, 1,
-1.182669, -1.400008, -2.286685, 1, 0.772549, 0, 1,
-1.180073, -0.4152672, -1.552352, 1, 0.7803922, 0, 1,
-1.178934, -0.886931, -3.331298, 1, 0.7843137, 0, 1,
-1.173892, 0.2119026, 0.6401087, 1, 0.7921569, 0, 1,
-1.142636, -0.3624036, -1.414564, 1, 0.7960784, 0, 1,
-1.141641, -0.3476695, -0.9621357, 1, 0.8039216, 0, 1,
-1.132745, 0.130105, -0.220968, 1, 0.8117647, 0, 1,
-1.128572, -0.335708, -2.858415, 1, 0.8156863, 0, 1,
-1.127678, 0.5908016, -1.758453, 1, 0.8235294, 0, 1,
-1.119015, -0.642085, 0.07418247, 1, 0.827451, 0, 1,
-1.115228, 0.0114464, 0.01467036, 1, 0.8352941, 0, 1,
-1.114495, -0.4487603, -1.875272, 1, 0.8392157, 0, 1,
-1.104555, 2.159067, -3.124238, 1, 0.8470588, 0, 1,
-1.104391, 0.9068591, 1.094586, 1, 0.8509804, 0, 1,
-1.099541, -1.219233, -1.206988, 1, 0.8588235, 0, 1,
-1.096116, 0.286006, -1.890078, 1, 0.8627451, 0, 1,
-1.092008, 0.858387, 0.006887653, 1, 0.8705882, 0, 1,
-1.088153, -0.05698649, -0.8728792, 1, 0.8745098, 0, 1,
-1.087971, -1.175862, -4.0982, 1, 0.8823529, 0, 1,
-1.087151, 0.4667934, -2.260676, 1, 0.8862745, 0, 1,
-1.086778, -0.1437833, -1.740585, 1, 0.8941177, 0, 1,
-1.084642, -0.3206088, -1.012978, 1, 0.8980392, 0, 1,
-1.08347, -0.6426774, -1.123328, 1, 0.9058824, 0, 1,
-1.082181, 1.239774, -0.4355544, 1, 0.9137255, 0, 1,
-1.071925, 0.7405615, -1.484261, 1, 0.9176471, 0, 1,
-1.066099, -0.3143233, -2.41853, 1, 0.9254902, 0, 1,
-1.06206, 0.4040072, -1.040217, 1, 0.9294118, 0, 1,
-1.057309, 0.2088628, -1.076203, 1, 0.9372549, 0, 1,
-1.053085, -1.338515, -1.685383, 1, 0.9411765, 0, 1,
-1.052708, 3.058398, 0.1742081, 1, 0.9490196, 0, 1,
-1.052371, 0.1031127, -1.752822, 1, 0.9529412, 0, 1,
-1.049928, -1.467598, -3.837379, 1, 0.9607843, 0, 1,
-1.037256, 0.09783041, -2.089047, 1, 0.9647059, 0, 1,
-1.035718, 0.1845534, -0.3233112, 1, 0.972549, 0, 1,
-1.035003, 0.4421198, -0.878073, 1, 0.9764706, 0, 1,
-1.033455, -1.316894, -1.859669, 1, 0.9843137, 0, 1,
-1.025643, -0.2549103, -2.042518, 1, 0.9882353, 0, 1,
-1.023575, 1.376956, -1.152487, 1, 0.9960784, 0, 1,
-1.018622, -0.09462851, -1.375194, 0.9960784, 1, 0, 1,
-1.018402, -0.2158362, -4.003413, 0.9921569, 1, 0, 1,
-1.012599, 1.309711, -1.232357, 0.9843137, 1, 0, 1,
-1.010771, 0.6571885, -1.295953, 0.9803922, 1, 0, 1,
-1.007467, -1.26549, -2.318228, 0.972549, 1, 0, 1,
-1.003628, -0.718698, -1.008064, 0.9686275, 1, 0, 1,
-0.9971077, 0.3264962, 1.238947, 0.9607843, 1, 0, 1,
-0.9943191, -0.2919765, -1.72626, 0.9568627, 1, 0, 1,
-0.9864212, 0.01980038, -1.114164, 0.9490196, 1, 0, 1,
-0.9818406, 0.03613912, -5.333398, 0.945098, 1, 0, 1,
-0.9790539, -0.1279394, -1.247851, 0.9372549, 1, 0, 1,
-0.969941, -0.2644753, -1.715608, 0.9333333, 1, 0, 1,
-0.9687591, 1.337742, -0.565643, 0.9254902, 1, 0, 1,
-0.9664388, -1.193262, -1.942966, 0.9215686, 1, 0, 1,
-0.9636292, 1.714046, 0.4369913, 0.9137255, 1, 0, 1,
-0.9543197, -1.673434, -3.070513, 0.9098039, 1, 0, 1,
-0.9538032, -0.9328814, -0.8582111, 0.9019608, 1, 0, 1,
-0.9513084, 0.2821557, -0.05669574, 0.8941177, 1, 0, 1,
-0.9475531, -0.2258143, -2.880104, 0.8901961, 1, 0, 1,
-0.9474585, -3.359303, -3.228547, 0.8823529, 1, 0, 1,
-0.944647, -0.4804543, -2.023366, 0.8784314, 1, 0, 1,
-0.9416108, -0.03041514, -0.8220201, 0.8705882, 1, 0, 1,
-0.9353774, -0.886133, -1.140927, 0.8666667, 1, 0, 1,
-0.9245871, -0.522026, -2.989025, 0.8588235, 1, 0, 1,
-0.9198136, -0.2145515, -2.23492, 0.854902, 1, 0, 1,
-0.9171534, -0.192985, -1.865453, 0.8470588, 1, 0, 1,
-0.9125247, 1.444123, -1.055102, 0.8431373, 1, 0, 1,
-0.9072957, -1.463916, -2.621406, 0.8352941, 1, 0, 1,
-0.9065784, 0.9462062, -0.4069029, 0.8313726, 1, 0, 1,
-0.9044119, -0.7347797, -2.356688, 0.8235294, 1, 0, 1,
-0.8901513, -0.09196513, -0.7609704, 0.8196079, 1, 0, 1,
-0.8805007, -2.914484, -4.442275, 0.8117647, 1, 0, 1,
-0.8774263, -0.1716336, -2.36091, 0.8078431, 1, 0, 1,
-0.8741083, -1.310499, -2.553994, 0.8, 1, 0, 1,
-0.8731095, 0.9959541, -1.161486, 0.7921569, 1, 0, 1,
-0.8654431, -1.656842, -1.818399, 0.7882353, 1, 0, 1,
-0.8557413, 0.03030289, -1.391489, 0.7803922, 1, 0, 1,
-0.8513118, -0.2154854, -1.014387, 0.7764706, 1, 0, 1,
-0.8442116, 0.3400265, -2.124013, 0.7686275, 1, 0, 1,
-0.8429343, 0.1623238, -0.1691333, 0.7647059, 1, 0, 1,
-0.83346, 0.4058694, -1.147796, 0.7568628, 1, 0, 1,
-0.8296241, 0.9128389, -1.100064, 0.7529412, 1, 0, 1,
-0.8237853, -0.906163, -2.252842, 0.7450981, 1, 0, 1,
-0.8221996, 1.231019, -0.1844662, 0.7411765, 1, 0, 1,
-0.8173239, 0.3918473, -1.657767, 0.7333333, 1, 0, 1,
-0.8137825, 1.986466, -1.410221, 0.7294118, 1, 0, 1,
-0.8131367, 0.4465371, -0.5655912, 0.7215686, 1, 0, 1,
-0.811823, 1.618282, -2.336184, 0.7176471, 1, 0, 1,
-0.8109185, 0.404325, -2.15127, 0.7098039, 1, 0, 1,
-0.8053154, -0.8095583, -1.983185, 0.7058824, 1, 0, 1,
-0.8003057, -1.447855, -1.301797, 0.6980392, 1, 0, 1,
-0.7995383, 0.2460085, -3.341889, 0.6901961, 1, 0, 1,
-0.7989602, -2.03438, -1.983144, 0.6862745, 1, 0, 1,
-0.7972029, -0.4212452, -2.756594, 0.6784314, 1, 0, 1,
-0.79423, -1.596942, -0.8535874, 0.6745098, 1, 0, 1,
-0.7937273, -0.1876525, -0.266863, 0.6666667, 1, 0, 1,
-0.7922299, -0.07244113, -3.158768, 0.6627451, 1, 0, 1,
-0.7912141, 0.3030096, 0.5510972, 0.654902, 1, 0, 1,
-0.7870762, 0.7635036, 0.06661437, 0.6509804, 1, 0, 1,
-0.777378, -1.176851, -3.501969, 0.6431373, 1, 0, 1,
-0.7770272, -1.047309, -3.18018, 0.6392157, 1, 0, 1,
-0.7761934, -0.6962852, -3.314027, 0.6313726, 1, 0, 1,
-0.7732081, -0.3992452, 0.6289002, 0.627451, 1, 0, 1,
-0.7658125, 0.5510414, 0.05671329, 0.6196079, 1, 0, 1,
-0.7646484, -0.003372262, -1.941516, 0.6156863, 1, 0, 1,
-0.7614225, 1.635722, 0.1776233, 0.6078432, 1, 0, 1,
-0.758827, 0.5679275, -1.73859, 0.6039216, 1, 0, 1,
-0.7574049, 1.544959, 0.1179239, 0.5960785, 1, 0, 1,
-0.7507219, 0.02004256, -1.495601, 0.5882353, 1, 0, 1,
-0.749106, 0.08639261, -3.527634, 0.5843138, 1, 0, 1,
-0.7476904, -0.02552158, -1.913019, 0.5764706, 1, 0, 1,
-0.7472513, -0.197114, -2.703057, 0.572549, 1, 0, 1,
-0.7460108, 0.6335725, -0.6720101, 0.5647059, 1, 0, 1,
-0.7439934, 0.264839, -2.138099, 0.5607843, 1, 0, 1,
-0.7406005, 1.162163, -1.887329, 0.5529412, 1, 0, 1,
-0.7385727, 0.8706468, 0.356534, 0.5490196, 1, 0, 1,
-0.7384488, -1.402325, -2.828814, 0.5411765, 1, 0, 1,
-0.7382857, -1.119566, -3.075549, 0.5372549, 1, 0, 1,
-0.7305165, 0.3576863, -0.539015, 0.5294118, 1, 0, 1,
-0.7151957, -2.027184, -1.243839, 0.5254902, 1, 0, 1,
-0.7134784, -0.7880785, -2.138885, 0.5176471, 1, 0, 1,
-0.7104281, -0.6028054, -1.294117, 0.5137255, 1, 0, 1,
-0.7096793, 0.3547738, -1.574346, 0.5058824, 1, 0, 1,
-0.7088929, -0.4323941, -0.3968896, 0.5019608, 1, 0, 1,
-0.691581, 0.8035877, -1.186124, 0.4941176, 1, 0, 1,
-0.6758601, 0.8760716, -0.1693058, 0.4862745, 1, 0, 1,
-0.6724781, -0.004065601, -2.035141, 0.4823529, 1, 0, 1,
-0.6679761, 0.9696394, -0.1060699, 0.4745098, 1, 0, 1,
-0.6674449, -0.02542021, -1.596515, 0.4705882, 1, 0, 1,
-0.6633437, 0.7574779, -1.525815, 0.4627451, 1, 0, 1,
-0.6613244, 0.2018991, -2.051064, 0.4588235, 1, 0, 1,
-0.6574407, -1.282066, -2.119384, 0.4509804, 1, 0, 1,
-0.6462965, -0.4413077, -4.07442, 0.4470588, 1, 0, 1,
-0.6442337, 0.8638887, 0.7605615, 0.4392157, 1, 0, 1,
-0.642107, -0.48014, -1.587519, 0.4352941, 1, 0, 1,
-0.6414574, -0.3220639, -1.989664, 0.427451, 1, 0, 1,
-0.6413319, 0.01466992, -1.757769, 0.4235294, 1, 0, 1,
-0.6387515, -0.4605532, -0.02406308, 0.4156863, 1, 0, 1,
-0.6382111, -1.98758, -2.542268, 0.4117647, 1, 0, 1,
-0.6327617, 0.7964979, -2.40777, 0.4039216, 1, 0, 1,
-0.6301747, 0.9517488, 0.0658817, 0.3960784, 1, 0, 1,
-0.6272752, -1.818439, -0.9928222, 0.3921569, 1, 0, 1,
-0.6232309, 0.8431977, -3.920358, 0.3843137, 1, 0, 1,
-0.6211171, 0.1382077, -0.843521, 0.3803922, 1, 0, 1,
-0.621008, -0.876156, -2.023536, 0.372549, 1, 0, 1,
-0.6202961, 1.169541, -1.529243, 0.3686275, 1, 0, 1,
-0.6174388, -0.5540453, -1.680818, 0.3607843, 1, 0, 1,
-0.6131014, 2.160399, 1.437836, 0.3568628, 1, 0, 1,
-0.6124949, 0.0768514, -0.8039172, 0.3490196, 1, 0, 1,
-0.6107651, 0.001381989, -0.1835779, 0.345098, 1, 0, 1,
-0.6091092, 1.608201, 0.2106036, 0.3372549, 1, 0, 1,
-0.5969554, 1.609753, -1.277763, 0.3333333, 1, 0, 1,
-0.595836, 2.282226, 0.3667015, 0.3254902, 1, 0, 1,
-0.5855755, 1.230051, 1.458135, 0.3215686, 1, 0, 1,
-0.5831217, -0.6281114, -2.062542, 0.3137255, 1, 0, 1,
-0.5737262, -0.6901445, -1.170087, 0.3098039, 1, 0, 1,
-0.5676876, 1.110567, 0.3439871, 0.3019608, 1, 0, 1,
-0.5622807, 0.7431567, -0.4598968, 0.2941177, 1, 0, 1,
-0.5607343, -0.2365129, -1.048326, 0.2901961, 1, 0, 1,
-0.5596368, -0.7334907, -3.644123, 0.282353, 1, 0, 1,
-0.5594719, -2.378713, -3.070321, 0.2784314, 1, 0, 1,
-0.5518265, -0.2562437, -2.03174, 0.2705882, 1, 0, 1,
-0.5459841, 0.1044435, -1.934204, 0.2666667, 1, 0, 1,
-0.5438392, -0.0191657, -1.914828, 0.2588235, 1, 0, 1,
-0.5434284, -0.05705008, -0.2182893, 0.254902, 1, 0, 1,
-0.5378881, 0.715714, -1.560428, 0.2470588, 1, 0, 1,
-0.5323541, -0.9913691, -1.404114, 0.2431373, 1, 0, 1,
-0.526092, -0.1199225, -3.73044, 0.2352941, 1, 0, 1,
-0.525773, 1.012484, 0.2840794, 0.2313726, 1, 0, 1,
-0.5237255, -0.4545335, -2.040415, 0.2235294, 1, 0, 1,
-0.5162507, -1.136802, -1.423951, 0.2196078, 1, 0, 1,
-0.5158913, -1.574262, -2.010506, 0.2117647, 1, 0, 1,
-0.5133422, -0.1016701, -1.941521, 0.2078431, 1, 0, 1,
-0.5130693, 0.8370804, -0.2938465, 0.2, 1, 0, 1,
-0.5110044, -1.885902, -3.462377, 0.1921569, 1, 0, 1,
-0.5087618, 0.2703296, -1.044439, 0.1882353, 1, 0, 1,
-0.5073379, -0.4153794, -0.7082274, 0.1803922, 1, 0, 1,
-0.5072293, -1.523887, -3.499143, 0.1764706, 1, 0, 1,
-0.505894, 0.357028, -0.8213601, 0.1686275, 1, 0, 1,
-0.5056518, -0.4344615, -1.661431, 0.1647059, 1, 0, 1,
-0.5018726, 0.6626315, -0.2001278, 0.1568628, 1, 0, 1,
-0.4957891, -0.6809155, -3.311393, 0.1529412, 1, 0, 1,
-0.4918228, -0.6031561, -3.328325, 0.145098, 1, 0, 1,
-0.488885, -1.692981, -2.003997, 0.1411765, 1, 0, 1,
-0.4870125, 0.1146132, -0.1891484, 0.1333333, 1, 0, 1,
-0.4726736, -1.181082, -3.05734, 0.1294118, 1, 0, 1,
-0.4717931, 0.1315631, -1.285578, 0.1215686, 1, 0, 1,
-0.4708502, -0.6208261, -1.266499, 0.1176471, 1, 0, 1,
-0.4698988, -1.348808, -3.982316, 0.1098039, 1, 0, 1,
-0.4694994, 1.229172, -0.6603903, 0.1058824, 1, 0, 1,
-0.4622924, -0.9018438, -2.376748, 0.09803922, 1, 0, 1,
-0.4594939, -3.899212, -2.882126, 0.09019608, 1, 0, 1,
-0.4578033, -0.961429, -3.605044, 0.08627451, 1, 0, 1,
-0.4566683, 0.3500753, 0.3536297, 0.07843138, 1, 0, 1,
-0.4553352, 0.1297447, -1.185452, 0.07450981, 1, 0, 1,
-0.4540235, 0.08503445, -1.578554, 0.06666667, 1, 0, 1,
-0.4528821, -0.803625, -1.836671, 0.0627451, 1, 0, 1,
-0.4392802, 0.197086, -1.01231, 0.05490196, 1, 0, 1,
-0.4307533, -0.453455, -2.575644, 0.05098039, 1, 0, 1,
-0.4251305, -0.1694034, -0.9931535, 0.04313726, 1, 0, 1,
-0.4165837, -0.1625083, -2.934269, 0.03921569, 1, 0, 1,
-0.4144083, 0.1613989, -1.585881, 0.03137255, 1, 0, 1,
-0.4139039, 0.6227447, 0.09183701, 0.02745098, 1, 0, 1,
-0.4071366, 0.7120559, -1.240602, 0.01960784, 1, 0, 1,
-0.4051338, 0.2014092, -2.041364, 0.01568628, 1, 0, 1,
-0.4035386, -1.201915, -3.404716, 0.007843138, 1, 0, 1,
-0.4029906, -1.049554, -2.450622, 0.003921569, 1, 0, 1,
-0.4027051, -2.441371, -2.544575, 0, 1, 0.003921569, 1,
-0.3959772, 0.655773, -1.271388, 0, 1, 0.01176471, 1,
-0.3740036, 0.984056, 0.9735842, 0, 1, 0.01568628, 1,
-0.3724717, -1.638866, -3.155483, 0, 1, 0.02352941, 1,
-0.3681796, -0.03054749, -0.5872164, 0, 1, 0.02745098, 1,
-0.3666515, 2.029344, -0.2593656, 0, 1, 0.03529412, 1,
-0.3651213, -1.08568, -2.990394, 0, 1, 0.03921569, 1,
-0.3645636, 0.7082254, -2.476488, 0, 1, 0.04705882, 1,
-0.3536344, 0.1813391, -0.8977352, 0, 1, 0.05098039, 1,
-0.3513468, -0.3139142, -1.374618, 0, 1, 0.05882353, 1,
-0.3498082, 0.0153046, -1.640687, 0, 1, 0.0627451, 1,
-0.3438973, 1.944838, -0.2039678, 0, 1, 0.07058824, 1,
-0.3397028, -0.7641264, -2.214728, 0, 1, 0.07450981, 1,
-0.3386106, 0.9128473, -0.6195968, 0, 1, 0.08235294, 1,
-0.3381471, -0.5616409, -2.516269, 0, 1, 0.08627451, 1,
-0.3370166, -0.77806, -1.849365, 0, 1, 0.09411765, 1,
-0.3336891, 0.78057, -0.0777965, 0, 1, 0.1019608, 1,
-0.3313534, -1.700059, -3.979462, 0, 1, 0.1058824, 1,
-0.3269691, -0.4350483, -1.733094, 0, 1, 0.1137255, 1,
-0.3255349, 0.7511755, 0.1423539, 0, 1, 0.1176471, 1,
-0.3227554, -0.8183838, -3.567357, 0, 1, 0.1254902, 1,
-0.3224743, 1.972338, -0.2155996, 0, 1, 0.1294118, 1,
-0.320614, 1.921302, 0.1251037, 0, 1, 0.1372549, 1,
-0.3202255, 0.5330228, -2.279897, 0, 1, 0.1411765, 1,
-0.3160252, 0.2951916, -1.221043, 0, 1, 0.1490196, 1,
-0.3133371, -0.9428794, -1.279978, 0, 1, 0.1529412, 1,
-0.3108566, -0.4796085, -2.831559, 0, 1, 0.1607843, 1,
-0.3105444, -0.1840748, -2.066323, 0, 1, 0.1647059, 1,
-0.309073, 1.724824, -1.234893, 0, 1, 0.172549, 1,
-0.309011, 0.3026348, -0.2637921, 0, 1, 0.1764706, 1,
-0.3083782, -0.5471891, -2.554722, 0, 1, 0.1843137, 1,
-0.3083533, -1.830719, -2.348928, 0, 1, 0.1882353, 1,
-0.3072275, 0.03421987, -1.921562, 0, 1, 0.1960784, 1,
-0.3064398, 1.388034, -0.4155422, 0, 1, 0.2039216, 1,
-0.3060487, 1.453019, -0.8788343, 0, 1, 0.2078431, 1,
-0.3026778, -0.1910776, -2.082203, 0, 1, 0.2156863, 1,
-0.2998825, 0.7775953, -0.7910775, 0, 1, 0.2196078, 1,
-0.2994523, -0.5010307, -1.283875, 0, 1, 0.227451, 1,
-0.2992828, 0.01893193, -1.144398, 0, 1, 0.2313726, 1,
-0.2985231, 0.7440799, -2.403872, 0, 1, 0.2392157, 1,
-0.2980905, 1.259368, 0.7171764, 0, 1, 0.2431373, 1,
-0.2976366, 1.596824, 0.4085265, 0, 1, 0.2509804, 1,
-0.2972011, 1.14645, -1.06766, 0, 1, 0.254902, 1,
-0.2971205, -0.9519855, -2.322605, 0, 1, 0.2627451, 1,
-0.29645, -0.3976724, -1.639118, 0, 1, 0.2666667, 1,
-0.2942189, 1.305203, -1.530403, 0, 1, 0.2745098, 1,
-0.291314, 2.461553, 0.475265, 0, 1, 0.2784314, 1,
-0.2910819, 0.6626873, -0.6060193, 0, 1, 0.2862745, 1,
-0.2904068, 1.071835, -0.12573, 0, 1, 0.2901961, 1,
-0.285392, -0.7729172, -3.783632, 0, 1, 0.2980392, 1,
-0.2831643, -0.5067325, -1.330454, 0, 1, 0.3058824, 1,
-0.2773455, 0.5835457, -0.2859009, 0, 1, 0.3098039, 1,
-0.2739996, -1.385988, -5.874446, 0, 1, 0.3176471, 1,
-0.2713034, -1.415401, -2.719441, 0, 1, 0.3215686, 1,
-0.2618939, -2.023262, -2.309272, 0, 1, 0.3294118, 1,
-0.2594214, -0.2980963, -2.459194, 0, 1, 0.3333333, 1,
-0.2588416, -0.05944496, -2.672459, 0, 1, 0.3411765, 1,
-0.2547689, -1.268043, -2.253294, 0, 1, 0.345098, 1,
-0.2490526, -0.5547484, -1.765038, 0, 1, 0.3529412, 1,
-0.2445307, 0.31924, -1.445347, 0, 1, 0.3568628, 1,
-0.2442798, -1.493684, -3.228992, 0, 1, 0.3647059, 1,
-0.2435672, 0.5731692, 0.8421542, 0, 1, 0.3686275, 1,
-0.2434811, 0.7656166, -0.9938502, 0, 1, 0.3764706, 1,
-0.2407611, 0.1485482, -0.8841644, 0, 1, 0.3803922, 1,
-0.2403568, -0.8255948, -3.426398, 0, 1, 0.3882353, 1,
-0.2360472, -0.620138, -1.932015, 0, 1, 0.3921569, 1,
-0.2341053, -1.449713, -1.518354, 0, 1, 0.4, 1,
-0.2270643, -0.05163989, -0.1342544, 0, 1, 0.4078431, 1,
-0.2236938, -0.2408915, -3.096955, 0, 1, 0.4117647, 1,
-0.2208315, 0.4012253, -0.7591047, 0, 1, 0.4196078, 1,
-0.2130012, 0.2371617, -0.632603, 0, 1, 0.4235294, 1,
-0.2129171, -0.1927488, -3.465377, 0, 1, 0.4313726, 1,
-0.2068971, 0.3082014, -0.3041431, 0, 1, 0.4352941, 1,
-0.205718, 0.2348457, -0.6593529, 0, 1, 0.4431373, 1,
-0.2004463, -0.6442702, -4.581898, 0, 1, 0.4470588, 1,
-0.199907, 0.2554274, -1.285185, 0, 1, 0.454902, 1,
-0.192028, -0.1995037, -2.81051, 0, 1, 0.4588235, 1,
-0.1914361, 0.8544488, 0.7850516, 0, 1, 0.4666667, 1,
-0.1882193, -1.294572, -1.744688, 0, 1, 0.4705882, 1,
-0.183918, 0.7626641, -1.517262, 0, 1, 0.4784314, 1,
-0.1833803, -1.280757, -2.145971, 0, 1, 0.4823529, 1,
-0.174896, 1.656006, -2.143047, 0, 1, 0.4901961, 1,
-0.1721465, 0.7829499, 0.05539112, 0, 1, 0.4941176, 1,
-0.1717037, 1.032941, -0.762731, 0, 1, 0.5019608, 1,
-0.1705881, -0.1112158, -1.24025, 0, 1, 0.509804, 1,
-0.1642269, 0.4824387, 0.4953718, 0, 1, 0.5137255, 1,
-0.1628902, 0.6398349, -0.7697003, 0, 1, 0.5215687, 1,
-0.1600113, 2.007664, 0.6143864, 0, 1, 0.5254902, 1,
-0.1565389, -1.304502, -3.897448, 0, 1, 0.5333334, 1,
-0.1515717, 0.6273144, 0.2026057, 0, 1, 0.5372549, 1,
-0.1514567, 0.8378492, 0.11589, 0, 1, 0.5450981, 1,
-0.151319, -2.748379, -4.914416, 0, 1, 0.5490196, 1,
-0.1506089, 2.19918, -0.06796947, 0, 1, 0.5568628, 1,
-0.1470097, 0.4555573, 0.6537527, 0, 1, 0.5607843, 1,
-0.1465074, 0.1286367, -2.017804, 0, 1, 0.5686275, 1,
-0.1357854, -1.288928, -3.728987, 0, 1, 0.572549, 1,
-0.1342145, 1.606657, -0.07166287, 0, 1, 0.5803922, 1,
-0.1340052, 1.385989, 1.590347, 0, 1, 0.5843138, 1,
-0.1337245, 0.7749463, -1.484502, 0, 1, 0.5921569, 1,
-0.1303235, 1.948014, 0.002493187, 0, 1, 0.5960785, 1,
-0.1277638, -1.605178, -3.805433, 0, 1, 0.6039216, 1,
-0.1189676, -0.807391, -2.424319, 0, 1, 0.6117647, 1,
-0.1187893, 0.7098192, 0.5053303, 0, 1, 0.6156863, 1,
-0.1175537, 0.2451663, 0.6792818, 0, 1, 0.6235294, 1,
-0.1092922, 0.5954333, 1.355189, 0, 1, 0.627451, 1,
-0.1080218, 1.095081, -1.085406, 0, 1, 0.6352941, 1,
-0.1077158, -1.213553, -2.838889, 0, 1, 0.6392157, 1,
-0.1055321, 0.3331795, 0.7173806, 0, 1, 0.6470588, 1,
-0.1049572, 0.05571778, -1.850548, 0, 1, 0.6509804, 1,
-0.103546, -0.1472257, -2.512003, 0, 1, 0.6588235, 1,
-0.09490643, -0.6285183, -2.960371, 0, 1, 0.6627451, 1,
-0.0929193, -0.7072663, -2.217571, 0, 1, 0.6705883, 1,
-0.09224697, -1.268014, -3.069369, 0, 1, 0.6745098, 1,
-0.09091651, -0.1290853, -0.7176863, 0, 1, 0.682353, 1,
-0.08754338, 1.166477, -0.3943918, 0, 1, 0.6862745, 1,
-0.08127221, -0.8322371, -2.280634, 0, 1, 0.6941177, 1,
-0.07745707, -1.15015, -4.216777, 0, 1, 0.7019608, 1,
-0.07582732, 1.094432, -1.162909, 0, 1, 0.7058824, 1,
-0.07439136, 1.03809, 0.4804864, 0, 1, 0.7137255, 1,
-0.06624106, -0.006923561, -2.40114, 0, 1, 0.7176471, 1,
-0.0659188, -0.3252926, -1.357541, 0, 1, 0.7254902, 1,
-0.06141314, -0.6339341, -1.821932, 0, 1, 0.7294118, 1,
-0.06110671, 0.002411769, -1.726405, 0, 1, 0.7372549, 1,
-0.06051187, 0.03467082, -2.660795, 0, 1, 0.7411765, 1,
-0.05514031, 0.2436998, 1.238547, 0, 1, 0.7490196, 1,
-0.05276091, 0.8435319, 1.632068, 0, 1, 0.7529412, 1,
-0.04537823, 0.634936, -0.2282197, 0, 1, 0.7607843, 1,
-0.04363754, -1.638042, -2.565325, 0, 1, 0.7647059, 1,
-0.03944619, -1.404343, -3.818356, 0, 1, 0.772549, 1,
-0.03684447, -1.746187, -3.564119, 0, 1, 0.7764706, 1,
-0.03556594, 0.1347435, -0.1610865, 0, 1, 0.7843137, 1,
-0.03258742, 0.02006673, -1.481596, 0, 1, 0.7882353, 1,
-0.03169757, 0.6676259, 0.725141, 0, 1, 0.7960784, 1,
-0.02954141, -0.5186534, -1.890453, 0, 1, 0.8039216, 1,
-0.02743751, 1.280873, 1.36367, 0, 1, 0.8078431, 1,
-0.02500238, 0.3875816, -0.2884806, 0, 1, 0.8156863, 1,
-0.02025492, -0.055503, -2.87998, 0, 1, 0.8196079, 1,
-0.0194106, 1.274739, 0.4654917, 0, 1, 0.827451, 1,
-0.01823982, 0.04643136, -2.38602, 0, 1, 0.8313726, 1,
-0.009565129, 1.616026, 0.9266922, 0, 1, 0.8392157, 1,
-0.008167206, -0.3564164, -4.189653, 0, 1, 0.8431373, 1,
-0.007396676, -0.07614878, -2.297374, 0, 1, 0.8509804, 1,
-0.006061159, 1.315361, -0.7514789, 0, 1, 0.854902, 1,
0.0002802139, 1.456348, -0.6489395, 0, 1, 0.8627451, 1,
0.001525101, -0.01562047, 2.889028, 0, 1, 0.8666667, 1,
0.004010515, -1.432713, 3.904538, 0, 1, 0.8745098, 1,
0.007664832, 0.01902183, -0.3959955, 0, 1, 0.8784314, 1,
0.01187, 1.066565, -1.331557, 0, 1, 0.8862745, 1,
0.01509936, 1.215136, -0.674874, 0, 1, 0.8901961, 1,
0.0162364, -0.9177325, 3.131029, 0, 1, 0.8980392, 1,
0.02119674, 0.299272, 0.6233903, 0, 1, 0.9058824, 1,
0.02179667, 0.06721017, 0.4408013, 0, 1, 0.9098039, 1,
0.02211855, -0.7184952, 3.384977, 0, 1, 0.9176471, 1,
0.0241198, -1.464023, 2.991856, 0, 1, 0.9215686, 1,
0.02908073, 1.319773, 0.5005792, 0, 1, 0.9294118, 1,
0.03048837, -1.033678, 2.310317, 0, 1, 0.9333333, 1,
0.03400838, 0.163636, 0.5796885, 0, 1, 0.9411765, 1,
0.03495369, -0.5459645, 2.482429, 0, 1, 0.945098, 1,
0.03869637, -0.4578447, 3.978816, 0, 1, 0.9529412, 1,
0.03993469, -0.8782268, 3.09888, 0, 1, 0.9568627, 1,
0.0402225, -0.7279873, 3.486737, 0, 1, 0.9647059, 1,
0.04099781, 0.4746938, -1.170784, 0, 1, 0.9686275, 1,
0.04425596, 0.1646433, -2.229911, 0, 1, 0.9764706, 1,
0.04465615, -0.5837708, 2.842529, 0, 1, 0.9803922, 1,
0.04620311, -0.5639518, 3.812288, 0, 1, 0.9882353, 1,
0.04840565, -0.4064628, 3.804569, 0, 1, 0.9921569, 1,
0.06260339, 1.073961, 0.3449113, 0, 1, 1, 1,
0.06679735, -0.9924059, 2.673252, 0, 0.9921569, 1, 1,
0.06862436, -1.58813, 1.901345, 0, 0.9882353, 1, 1,
0.06867553, 1.675828, 0.8672276, 0, 0.9803922, 1, 1,
0.07036974, 0.4575585, 1.149381, 0, 0.9764706, 1, 1,
0.07064359, 2.669467, -1.922178, 0, 0.9686275, 1, 1,
0.07116035, 0.7532247, -0.6861587, 0, 0.9647059, 1, 1,
0.07335109, -0.01346803, 1.544222, 0, 0.9568627, 1, 1,
0.07525075, -0.5980679, 4.243986, 0, 0.9529412, 1, 1,
0.07609998, -0.963539, 2.774804, 0, 0.945098, 1, 1,
0.07989638, 0.4117909, -0.5973338, 0, 0.9411765, 1, 1,
0.08145832, 0.8502354, 1.21718, 0, 0.9333333, 1, 1,
0.08242351, 0.8929741, 2.611423, 0, 0.9294118, 1, 1,
0.08669684, 2.168156, -0.06144718, 0, 0.9215686, 1, 1,
0.09017976, 0.8491313, -0.1483975, 0, 0.9176471, 1, 1,
0.09147454, -1.643814, 3.363163, 0, 0.9098039, 1, 1,
0.09334575, -0.7533533, 2.144983, 0, 0.9058824, 1, 1,
0.0951351, -0.4229822, 3.674583, 0, 0.8980392, 1, 1,
0.09785604, -0.5798234, 2.766292, 0, 0.8901961, 1, 1,
0.09873229, 1.079537, -0.09949817, 0, 0.8862745, 1, 1,
0.09919479, 1.149893, -0.05163971, 0, 0.8784314, 1, 1,
0.1002958, 1.053661, 2.842084, 0, 0.8745098, 1, 1,
0.1032331, 0.5551035, 0.09290092, 0, 0.8666667, 1, 1,
0.1036623, 0.4409984, -1.024026, 0, 0.8627451, 1, 1,
0.1037735, 0.6011568, 2.715363, 0, 0.854902, 1, 1,
0.1065756, -0.4055997, 4.560678, 0, 0.8509804, 1, 1,
0.1093036, 1.278483, 0.4325346, 0, 0.8431373, 1, 1,
0.1118383, 1.387062, -0.05409281, 0, 0.8392157, 1, 1,
0.1120691, -1.560492, 3.6254, 0, 0.8313726, 1, 1,
0.1146734, -1.629879, 3.554063, 0, 0.827451, 1, 1,
0.1168262, 2.56836, -0.1178014, 0, 0.8196079, 1, 1,
0.1192813, 1.366798, -0.8096128, 0, 0.8156863, 1, 1,
0.1196474, 0.7026672, -0.882808, 0, 0.8078431, 1, 1,
0.1234987, -1.382276, 2.811705, 0, 0.8039216, 1, 1,
0.1287418, 1.444861, 0.04720563, 0, 0.7960784, 1, 1,
0.13408, -0.196428, 1.536437, 0, 0.7882353, 1, 1,
0.1402701, 0.5619465, -2.045839, 0, 0.7843137, 1, 1,
0.1440181, 0.1298355, 1.651088, 0, 0.7764706, 1, 1,
0.1463319, -0.9271902, 3.761776, 0, 0.772549, 1, 1,
0.1467207, 1.28229, 1.677654, 0, 0.7647059, 1, 1,
0.1502995, 8.100809e-05, 1.734302, 0, 0.7607843, 1, 1,
0.1541138, -0.2064585, 2.33564, 0, 0.7529412, 1, 1,
0.1541258, 0.5986818, 0.6314959, 0, 0.7490196, 1, 1,
0.1567911, -1.151626, 3.170905, 0, 0.7411765, 1, 1,
0.1608526, 0.6928287, 0.2967857, 0, 0.7372549, 1, 1,
0.1648796, 0.5859402, 0.5250387, 0, 0.7294118, 1, 1,
0.1690525, 0.129507, 0.3808552, 0, 0.7254902, 1, 1,
0.1691797, -0.8451265, 3.670562, 0, 0.7176471, 1, 1,
0.1716818, -0.8044835, 1.664218, 0, 0.7137255, 1, 1,
0.1746918, 0.7991312, -0.5788954, 0, 0.7058824, 1, 1,
0.1748796, 0.2244666, 1.085784, 0, 0.6980392, 1, 1,
0.1756321, -1.653417, 3.044805, 0, 0.6941177, 1, 1,
0.17702, -0.5311645, 3.114544, 0, 0.6862745, 1, 1,
0.1785038, -2.168702, 2.688886, 0, 0.682353, 1, 1,
0.1796665, 0.2786705, 0.5162506, 0, 0.6745098, 1, 1,
0.1824064, -0.05608817, 3.129496, 0, 0.6705883, 1, 1,
0.1830685, -0.395515, 3.513581, 0, 0.6627451, 1, 1,
0.1931362, 0.8548594, 1.447826, 0, 0.6588235, 1, 1,
0.1944145, -1.203882, 2.794948, 0, 0.6509804, 1, 1,
0.1989484, -0.8939846, 4.189693, 0, 0.6470588, 1, 1,
0.1999866, 0.8497735, -0.6725464, 0, 0.6392157, 1, 1,
0.2003406, 1.90851, -0.9038981, 0, 0.6352941, 1, 1,
0.2004726, -1.255798, 2.957952, 0, 0.627451, 1, 1,
0.2009877, -0.314372, 3.08864, 0, 0.6235294, 1, 1,
0.2046787, 0.03669943, 0.5578086, 0, 0.6156863, 1, 1,
0.2136655, -0.767653, 5.022556, 0, 0.6117647, 1, 1,
0.220888, 1.863291, 1.057928, 0, 0.6039216, 1, 1,
0.2231048, -0.2151187, 3.69065, 0, 0.5960785, 1, 1,
0.2290174, -0.6842867, 4.058966, 0, 0.5921569, 1, 1,
0.2404193, 0.124687, 1.173965, 0, 0.5843138, 1, 1,
0.2436894, -0.01840712, 2.050066, 0, 0.5803922, 1, 1,
0.2454954, 0.01177923, 1.499829, 0, 0.572549, 1, 1,
0.246668, 0.2820885, 1.235377, 0, 0.5686275, 1, 1,
0.254055, -0.5026674, 2.456239, 0, 0.5607843, 1, 1,
0.2579762, -0.9555038, 2.762441, 0, 0.5568628, 1, 1,
0.2590679, 1.404064, 0.3665974, 0, 0.5490196, 1, 1,
0.2627873, -0.9890742, 4.067091, 0, 0.5450981, 1, 1,
0.2631415, -0.1835546, 1.263726, 0, 0.5372549, 1, 1,
0.2652837, 0.01521432, 0.4685422, 0, 0.5333334, 1, 1,
0.2655619, -0.159988, 0.8907707, 0, 0.5254902, 1, 1,
0.2657923, -0.2718245, 2.578321, 0, 0.5215687, 1, 1,
0.2669977, -1.372864, 3.985069, 0, 0.5137255, 1, 1,
0.2684846, 0.5156907, 0.05835679, 0, 0.509804, 1, 1,
0.2769123, -2.153097, 3.496016, 0, 0.5019608, 1, 1,
0.2778799, -1.322734, 2.932637, 0, 0.4941176, 1, 1,
0.2781217, -1.414327, 4.069034, 0, 0.4901961, 1, 1,
0.2783343, -1.665704, 1.991415, 0, 0.4823529, 1, 1,
0.2796493, 0.08995359, 3.027779, 0, 0.4784314, 1, 1,
0.2849458, -0.6871488, 2.193301, 0, 0.4705882, 1, 1,
0.2852871, -0.4390213, 3.438721, 0, 0.4666667, 1, 1,
0.2860657, -1.325384, 3.519575, 0, 0.4588235, 1, 1,
0.2874922, 0.4492038, 0.7158208, 0, 0.454902, 1, 1,
0.2881492, 0.03867228, 0.2885806, 0, 0.4470588, 1, 1,
0.2906996, 0.4551458, 1.393042, 0, 0.4431373, 1, 1,
0.2907428, 0.4368606, 2.136901, 0, 0.4352941, 1, 1,
0.2935935, -0.423065, 0.7101067, 0, 0.4313726, 1, 1,
0.3009413, 0.2178231, 1.517684, 0, 0.4235294, 1, 1,
0.301482, -1.213045, 2.406587, 0, 0.4196078, 1, 1,
0.3025596, 0.611928, 1.569623, 0, 0.4117647, 1, 1,
0.3044815, -2.630126, 3.13916, 0, 0.4078431, 1, 1,
0.3050108, -0.2041313, 2.367404, 0, 0.4, 1, 1,
0.3062795, 0.9494098, 0.3614431, 0, 0.3921569, 1, 1,
0.3070228, -0.7413862, 5.195657, 0, 0.3882353, 1, 1,
0.3080181, 1.033214, 1.267677, 0, 0.3803922, 1, 1,
0.3154968, -2.495076, 4.728029, 0, 0.3764706, 1, 1,
0.3244489, -1.899569, 3.80295, 0, 0.3686275, 1, 1,
0.3288524, 0.4671619, -0.2436373, 0, 0.3647059, 1, 1,
0.3289191, -1.724323, 4.331163, 0, 0.3568628, 1, 1,
0.3333063, -1.237893, 3.350242, 0, 0.3529412, 1, 1,
0.3364675, -0.5012515, 3.410233, 0, 0.345098, 1, 1,
0.3374648, -1.475856, 2.691664, 0, 0.3411765, 1, 1,
0.3464862, 1.425452, -1.190494, 0, 0.3333333, 1, 1,
0.3468497, -0.7224251, 2.683066, 0, 0.3294118, 1, 1,
0.3473222, 1.950141, -0.6215643, 0, 0.3215686, 1, 1,
0.3478427, 0.5450767, -0.6443252, 0, 0.3176471, 1, 1,
0.349296, 1.088844, 0.1203839, 0, 0.3098039, 1, 1,
0.3534489, 0.04335118, 0.000104608, 0, 0.3058824, 1, 1,
0.3558989, -0.9187062, 2.985086, 0, 0.2980392, 1, 1,
0.3580549, 1.223546, -1.167211, 0, 0.2901961, 1, 1,
0.363265, -1.201681, 2.923604, 0, 0.2862745, 1, 1,
0.3639461, -1.302263, 4.212135, 0, 0.2784314, 1, 1,
0.3643078, 0.4206276, 0.7268112, 0, 0.2745098, 1, 1,
0.3656621, 1.689834, 0.4034329, 0, 0.2666667, 1, 1,
0.3661679, 0.8889535, -0.6987665, 0, 0.2627451, 1, 1,
0.3678674, 0.1652366, 1.512021, 0, 0.254902, 1, 1,
0.3693562, 0.5755526, -1.505619, 0, 0.2509804, 1, 1,
0.3708917, -0.524878, 4.799909, 0, 0.2431373, 1, 1,
0.3764693, 0.3102703, 1.095557, 0, 0.2392157, 1, 1,
0.3779899, -0.2960882, 2.136842, 0, 0.2313726, 1, 1,
0.3818418, 0.5247811, 0.5207271, 0, 0.227451, 1, 1,
0.3824763, -1.443537, 3.668398, 0, 0.2196078, 1, 1,
0.3852629, -1.040996, 2.025042, 0, 0.2156863, 1, 1,
0.3868928, -0.2971557, 1.315913, 0, 0.2078431, 1, 1,
0.3883414, 0.05302742, 3.277521, 0, 0.2039216, 1, 1,
0.3999327, 0.886651, 0.6332975, 0, 0.1960784, 1, 1,
0.4007126, 0.2117375, 1.857196, 0, 0.1882353, 1, 1,
0.4008042, 0.8751875, -0.7147292, 0, 0.1843137, 1, 1,
0.407171, -0.0872177, 2.281653, 0, 0.1764706, 1, 1,
0.4073372, -1.64586, 3.9519, 0, 0.172549, 1, 1,
0.4083841, -0.7940549, 3.509312, 0, 0.1647059, 1, 1,
0.4094803, -1.690939, 2.274266, 0, 0.1607843, 1, 1,
0.4097248, 0.3293956, 0.3259664, 0, 0.1529412, 1, 1,
0.4176389, 0.204756, 0.4030027, 0, 0.1490196, 1, 1,
0.4293049, -0.597097, 1.849963, 0, 0.1411765, 1, 1,
0.4306713, -1.79646, 2.832731, 0, 0.1372549, 1, 1,
0.4310465, -0.1674528, 2.688372, 0, 0.1294118, 1, 1,
0.4403316, 1.129113, -0.365959, 0, 0.1254902, 1, 1,
0.4410257, 1.352604, 0.3409313, 0, 0.1176471, 1, 1,
0.4481518, 2.776472, 0.2577314, 0, 0.1137255, 1, 1,
0.4503502, 0.9664171, 0.4485011, 0, 0.1058824, 1, 1,
0.463075, 1.831784, -1.918559, 0, 0.09803922, 1, 1,
0.4637044, -1.920064, 3.346552, 0, 0.09411765, 1, 1,
0.470048, 1.066777, 1.491017, 0, 0.08627451, 1, 1,
0.4707434, 0.2395249, 0.4833305, 0, 0.08235294, 1, 1,
0.4736314, -0.7716656, 1.589082, 0, 0.07450981, 1, 1,
0.4746111, -1.73608, 4.487706, 0, 0.07058824, 1, 1,
0.476557, -1.268721, 5.217847, 0, 0.0627451, 1, 1,
0.4787665, -0.6310061, 3.654189, 0, 0.05882353, 1, 1,
0.4828639, -0.1011794, 2.873895, 0, 0.05098039, 1, 1,
0.4847367, 0.9716721, -1.306324, 0, 0.04705882, 1, 1,
0.4847891, 1.00635, 0.5158541, 0, 0.03921569, 1, 1,
0.4859188, 1.849043, 1.523449, 0, 0.03529412, 1, 1,
0.4880803, -1.136418, 3.189569, 0, 0.02745098, 1, 1,
0.48919, -1.000441, 2.916559, 0, 0.02352941, 1, 1,
0.4907871, 0.3463897, 2.630187, 0, 0.01568628, 1, 1,
0.4944233, -1.203165, 2.369545, 0, 0.01176471, 1, 1,
0.4944995, -0.831661, 0.8230463, 0, 0.003921569, 1, 1,
0.5078983, 0.8436456, 0.2670346, 0.003921569, 0, 1, 1,
0.508674, 0.5473062, 0.08738722, 0.007843138, 0, 1, 1,
0.5101837, -0.8600746, 4.580665, 0.01568628, 0, 1, 1,
0.5124381, 0.09563818, 0.9199428, 0.01960784, 0, 1, 1,
0.5185214, 0.02152878, 1.872356, 0.02745098, 0, 1, 1,
0.5276173, 0.9026135, 2.698997, 0.03137255, 0, 1, 1,
0.5339103, -1.193879, 3.339339, 0.03921569, 0, 1, 1,
0.5378249, 0.9108567, 0.1367954, 0.04313726, 0, 1, 1,
0.5384752, -1.141867, 2.170089, 0.05098039, 0, 1, 1,
0.5399497, 0.4072714, 0.1407322, 0.05490196, 0, 1, 1,
0.5430312, 0.8432518, -0.5521275, 0.0627451, 0, 1, 1,
0.5492582, -0.5494301, 2.329239, 0.06666667, 0, 1, 1,
0.5507858, -0.04539253, 0.9215434, 0.07450981, 0, 1, 1,
0.551599, -0.1837246, 2.193652, 0.07843138, 0, 1, 1,
0.5532357, 1.439656, 1.361582, 0.08627451, 0, 1, 1,
0.5558501, 0.4446065, 3.021746, 0.09019608, 0, 1, 1,
0.5623831, -0.5657515, 3.415326, 0.09803922, 0, 1, 1,
0.5665517, -1.044046, 4.251493, 0.1058824, 0, 1, 1,
0.5673746, -1.412319, 3.547036, 0.1098039, 0, 1, 1,
0.5747225, 1.00402, -0.133765, 0.1176471, 0, 1, 1,
0.5757332, 1.385659, -0.08634677, 0.1215686, 0, 1, 1,
0.5797383, 1.293189, -0.5227861, 0.1294118, 0, 1, 1,
0.5805113, -1.525687, 2.182263, 0.1333333, 0, 1, 1,
0.581381, -1.480111, 2.221078, 0.1411765, 0, 1, 1,
0.5816947, 0.2436065, 1.535742, 0.145098, 0, 1, 1,
0.5828337, 0.9795657, 1.717312, 0.1529412, 0, 1, 1,
0.5861316, 1.995739, 1.211827, 0.1568628, 0, 1, 1,
0.5869144, 0.3608282, 1.818085, 0.1647059, 0, 1, 1,
0.5869721, 0.66023, 0.818206, 0.1686275, 0, 1, 1,
0.592692, -0.4720887, 1.318667, 0.1764706, 0, 1, 1,
0.5940306, 0.6115752, 0.5113091, 0.1803922, 0, 1, 1,
0.5970469, 1.604146, 0.07848533, 0.1882353, 0, 1, 1,
0.6048319, -0.6492984, 2.641649, 0.1921569, 0, 1, 1,
0.6077474, 0.09945069, 1.384244, 0.2, 0, 1, 1,
0.6087966, -0.07361116, 2.284157, 0.2078431, 0, 1, 1,
0.6095988, -1.2056, 2.042792, 0.2117647, 0, 1, 1,
0.6120729, 1.14501, -0.3326064, 0.2196078, 0, 1, 1,
0.6127687, -1.170551, 3.015514, 0.2235294, 0, 1, 1,
0.615227, 0.544345, 1.338661, 0.2313726, 0, 1, 1,
0.6167277, 0.75129, 2.175883, 0.2352941, 0, 1, 1,
0.6170102, -1.665346, 2.708188, 0.2431373, 0, 1, 1,
0.6185851, -0.3242808, 3.405933, 0.2470588, 0, 1, 1,
0.6239811, -1.072316, 2.508965, 0.254902, 0, 1, 1,
0.6240932, -0.645743, 1.767535, 0.2588235, 0, 1, 1,
0.6278536, 1.284974, 1.222048, 0.2666667, 0, 1, 1,
0.6291398, -0.5817922, 0.1732618, 0.2705882, 0, 1, 1,
0.6305852, 0.04665683, 2.528523, 0.2784314, 0, 1, 1,
0.6319653, 0.7077418, 0.4496071, 0.282353, 0, 1, 1,
0.6334611, 1.103759, 1.357001, 0.2901961, 0, 1, 1,
0.6340177, 1.400687, 0.4592267, 0.2941177, 0, 1, 1,
0.6361545, -0.3270555, 2.173814, 0.3019608, 0, 1, 1,
0.6472121, -2.251943, 1.556231, 0.3098039, 0, 1, 1,
0.6506279, 1.197656, -0.7314997, 0.3137255, 0, 1, 1,
0.6515224, -0.8237106, 3.622775, 0.3215686, 0, 1, 1,
0.6687974, 0.6225517, 2.283221, 0.3254902, 0, 1, 1,
0.670751, -1.183439, 1.4256, 0.3333333, 0, 1, 1,
0.6734092, 1.321106, 0.2599391, 0.3372549, 0, 1, 1,
0.6745749, 1.060658, 1.95188, 0.345098, 0, 1, 1,
0.675273, 0.7073333, 1.711844, 0.3490196, 0, 1, 1,
0.6773276, -1.396286, 3.085426, 0.3568628, 0, 1, 1,
0.6819513, -0.8868911, 2.27069, 0.3607843, 0, 1, 1,
0.6820876, -0.6877643, 2.087517, 0.3686275, 0, 1, 1,
0.6823922, -0.3087999, 0.9961118, 0.372549, 0, 1, 1,
0.6918068, 0.05214612, 0.5416845, 0.3803922, 0, 1, 1,
0.6932489, 2.312999, -0.2785705, 0.3843137, 0, 1, 1,
0.7011329, 0.1892763, 0.8337863, 0.3921569, 0, 1, 1,
0.702898, -0.2512908, 0.6836411, 0.3960784, 0, 1, 1,
0.7197344, -1.027773, 2.820458, 0.4039216, 0, 1, 1,
0.7231589, 0.6325938, 1.004408, 0.4117647, 0, 1, 1,
0.7244059, 1.426939, 1.02716, 0.4156863, 0, 1, 1,
0.7307208, 0.1398446, -1.123195, 0.4235294, 0, 1, 1,
0.7332419, -0.5372396, 1.282295, 0.427451, 0, 1, 1,
0.7355698, -0.4707396, 1.859388, 0.4352941, 0, 1, 1,
0.7409657, 0.2631094, -0.7279661, 0.4392157, 0, 1, 1,
0.7428387, -0.8303851, 1.184486, 0.4470588, 0, 1, 1,
0.7497089, -1.33645, 3.330365, 0.4509804, 0, 1, 1,
0.7572743, 1.396441, 0.6706708, 0.4588235, 0, 1, 1,
0.7582717, 0.8901426, 1.025113, 0.4627451, 0, 1, 1,
0.7601916, -0.3713052, 3.347218, 0.4705882, 0, 1, 1,
0.7641327, 0.2610645, 2.326019, 0.4745098, 0, 1, 1,
0.7649693, 2.098299, 1.177362, 0.4823529, 0, 1, 1,
0.7683496, 0.9027026, 1.330662, 0.4862745, 0, 1, 1,
0.7704433, 0.915559, 2.344696, 0.4941176, 0, 1, 1,
0.7705769, -1.288241, 3.22332, 0.5019608, 0, 1, 1,
0.7709349, 0.159814, 2.83984, 0.5058824, 0, 1, 1,
0.773065, -0.4858897, 1.959433, 0.5137255, 0, 1, 1,
0.776477, -0.3070201, 2.329628, 0.5176471, 0, 1, 1,
0.7771548, 0.1766959, 1.341682, 0.5254902, 0, 1, 1,
0.7805912, 1.16928, 2.152953, 0.5294118, 0, 1, 1,
0.7846359, 0.6874719, 0.7421048, 0.5372549, 0, 1, 1,
0.7903669, -0.3761601, 1.899359, 0.5411765, 0, 1, 1,
0.7910938, 0.2041451, 2.764031, 0.5490196, 0, 1, 1,
0.8000224, -0.3908292, 1.860509, 0.5529412, 0, 1, 1,
0.8000348, -0.62291, 2.58137, 0.5607843, 0, 1, 1,
0.8010199, -0.3880567, 1.343086, 0.5647059, 0, 1, 1,
0.8082592, 0.6966537, 0.7697968, 0.572549, 0, 1, 1,
0.8098133, -0.6607228, 1.439977, 0.5764706, 0, 1, 1,
0.8130813, 0.6190194, -0.1737617, 0.5843138, 0, 1, 1,
0.8200318, 0.5232679, 1.261205, 0.5882353, 0, 1, 1,
0.8219784, -0.333097, 2.049136, 0.5960785, 0, 1, 1,
0.8258892, -0.6170164, 2.012789, 0.6039216, 0, 1, 1,
0.8268811, -0.3373401, 3.027811, 0.6078432, 0, 1, 1,
0.8277193, 0.5818169, 1.264025, 0.6156863, 0, 1, 1,
0.8490726, 0.2278032, 1.870039, 0.6196079, 0, 1, 1,
0.8511438, -0.0698835, 0.8470772, 0.627451, 0, 1, 1,
0.853673, -1.041252, 2.754387, 0.6313726, 0, 1, 1,
0.8649639, 0.4060831, 0.2535478, 0.6392157, 0, 1, 1,
0.8662742, -0.1204428, 0.4408594, 0.6431373, 0, 1, 1,
0.8678056, 0.7319039, 1.292946, 0.6509804, 0, 1, 1,
0.8715561, 1.774983, 1.917819, 0.654902, 0, 1, 1,
0.8716933, -0.5073442, 3.587707, 0.6627451, 0, 1, 1,
0.876393, 0.8452191, 0.06121991, 0.6666667, 0, 1, 1,
0.881654, 0.3435288, 0.4227551, 0.6745098, 0, 1, 1,
0.8872836, -1.79716, 2.941922, 0.6784314, 0, 1, 1,
0.8938013, -0.626828, 2.826599, 0.6862745, 0, 1, 1,
0.8962064, 1.452556, -0.4225935, 0.6901961, 0, 1, 1,
0.8975489, -0.5835888, -1.232087, 0.6980392, 0, 1, 1,
0.8993664, 0.5847144, 2.206506, 0.7058824, 0, 1, 1,
0.9006124, -0.03009316, 1.655478, 0.7098039, 0, 1, 1,
0.9009582, 0.2535025, -0.04310208, 0.7176471, 0, 1, 1,
0.9013172, -0.4834287, 0.5917975, 0.7215686, 0, 1, 1,
0.9015954, 1.6477, 2.023967, 0.7294118, 0, 1, 1,
0.9019427, 0.01876787, 2.871504, 0.7333333, 0, 1, 1,
0.9079054, 1.989502, 1.616361, 0.7411765, 0, 1, 1,
0.9104164, 0.05918974, 0.5354826, 0.7450981, 0, 1, 1,
0.9110314, -0.1772798, 2.157395, 0.7529412, 0, 1, 1,
0.9129688, 0.09131905, 1.082608, 0.7568628, 0, 1, 1,
0.9179263, 0.9924659, 0.3112996, 0.7647059, 0, 1, 1,
0.920976, 0.8716678, 0.8015818, 0.7686275, 0, 1, 1,
0.9251157, 0.4951159, 1.595604, 0.7764706, 0, 1, 1,
0.9259583, 0.5770379, 1.01002, 0.7803922, 0, 1, 1,
0.9263958, -1.010965, 3.222608, 0.7882353, 0, 1, 1,
0.9271193, 0.8902809, 1.242221, 0.7921569, 0, 1, 1,
0.9300713, 0.0242865, 2.289801, 0.8, 0, 1, 1,
0.9304523, -0.3370564, 0.8644228, 0.8078431, 0, 1, 1,
0.9495997, 1.266916, -0.3026623, 0.8117647, 0, 1, 1,
0.951097, -0.1562895, 3.172377, 0.8196079, 0, 1, 1,
0.9563237, 1.073853, 0.7422475, 0.8235294, 0, 1, 1,
0.9566041, -0.07475342, 0.05975363, 0.8313726, 0, 1, 1,
0.9668413, 1.33301, 0.2350267, 0.8352941, 0, 1, 1,
0.9669093, 0.2972741, 0.477576, 0.8431373, 0, 1, 1,
0.9723778, 0.2247801, 0.2472969, 0.8470588, 0, 1, 1,
0.9747729, -1.451341, 2.780042, 0.854902, 0, 1, 1,
0.975199, 0.887758, 1.598604, 0.8588235, 0, 1, 1,
0.9760577, -0.3428819, 2.185278, 0.8666667, 0, 1, 1,
0.9894902, -0.7664598, 0.9329284, 0.8705882, 0, 1, 1,
0.9928021, 0.7868568, -1.999701, 0.8784314, 0, 1, 1,
0.9936398, 0.1052893, 1.987829, 0.8823529, 0, 1, 1,
0.9959127, -0.7196496, 2.350538, 0.8901961, 0, 1, 1,
0.9999999, -0.2062511, 2.925946, 0.8941177, 0, 1, 1,
1.001464, -0.281184, 2.062279, 0.9019608, 0, 1, 1,
1.009524, 0.4254765, 2.103922, 0.9098039, 0, 1, 1,
1.019685, 1.192086, 1.372756, 0.9137255, 0, 1, 1,
1.028036, 1.115154, -0.3515367, 0.9215686, 0, 1, 1,
1.03319, -0.2865228, 2.370257, 0.9254902, 0, 1, 1,
1.035126, -0.08759154, 1.25787, 0.9333333, 0, 1, 1,
1.048863, 0.02155082, -0.3635244, 0.9372549, 0, 1, 1,
1.050733, 0.03222441, 1.88584, 0.945098, 0, 1, 1,
1.059064, -1.156779, 0.1843147, 0.9490196, 0, 1, 1,
1.067676, 0.1708063, 0.5009996, 0.9568627, 0, 1, 1,
1.071307, -0.7717326, 2.70601, 0.9607843, 0, 1, 1,
1.076575, 1.545594, -0.02855163, 0.9686275, 0, 1, 1,
1.082673, -0.4198551, 1.064908, 0.972549, 0, 1, 1,
1.082964, 0.660606, 1.394413, 0.9803922, 0, 1, 1,
1.084786, -0.006828175, 0.8410227, 0.9843137, 0, 1, 1,
1.086984, 1.212402, 0.4644353, 0.9921569, 0, 1, 1,
1.089816, -0.708774, 1.974853, 0.9960784, 0, 1, 1,
1.095818, -0.9028812, 0.4425076, 1, 0, 0.9960784, 1,
1.099282, -0.2118901, -1.347274, 1, 0, 0.9882353, 1,
1.100419, 0.1833653, 2.255599, 1, 0, 0.9843137, 1,
1.104529, -0.8978689, 3.032587, 1, 0, 0.9764706, 1,
1.10499, -1.757015, 2.173177, 1, 0, 0.972549, 1,
1.10549, -1.410277, 1.325815, 1, 0, 0.9647059, 1,
1.106433, 0.09545968, 3.126661, 1, 0, 0.9607843, 1,
1.110043, 1.4992, 0.72162, 1, 0, 0.9529412, 1,
1.111793, 1.311512, 1.943612, 1, 0, 0.9490196, 1,
1.119543, -0.8878675, 0.8973707, 1, 0, 0.9411765, 1,
1.122179, -1.517863, 1.898247, 1, 0, 0.9372549, 1,
1.122426, 0.09050077, 1.633132, 1, 0, 0.9294118, 1,
1.129046, -0.1118319, 2.306605, 1, 0, 0.9254902, 1,
1.137946, 0.7079702, 1.952243, 1, 0, 0.9176471, 1,
1.141602, 0.3471657, 2.783866, 1, 0, 0.9137255, 1,
1.142688, -1.600428, 2.564965, 1, 0, 0.9058824, 1,
1.14402, -0.7507267, 2.025224, 1, 0, 0.9019608, 1,
1.144883, 0.7831092, 0.6867968, 1, 0, 0.8941177, 1,
1.146587, 0.07295526, -0.7130623, 1, 0, 0.8862745, 1,
1.146876, -0.6374897, 1.859939, 1, 0, 0.8823529, 1,
1.15, -1.6525, 0.8078797, 1, 0, 0.8745098, 1,
1.150563, -1.678403, 3.085716, 1, 0, 0.8705882, 1,
1.163757, 0.1784561, 2.390742, 1, 0, 0.8627451, 1,
1.166069, -1.286523, 2.772733, 1, 0, 0.8588235, 1,
1.1673, -1.00257, 2.599078, 1, 0, 0.8509804, 1,
1.169938, 0.07536078, 0.6465632, 1, 0, 0.8470588, 1,
1.17533, 0.2440195, -0.1798984, 1, 0, 0.8392157, 1,
1.177628, 0.9290859, 0.490215, 1, 0, 0.8352941, 1,
1.178366, -1.087895, 2.695623, 1, 0, 0.827451, 1,
1.181399, -0.02540586, 2.645332, 1, 0, 0.8235294, 1,
1.189747, 0.5506381, 1.15478, 1, 0, 0.8156863, 1,
1.189847, 0.3534805, 0.1868664, 1, 0, 0.8117647, 1,
1.197571, -0.4140376, 0.7793685, 1, 0, 0.8039216, 1,
1.199699, -0.3775378, 2.674422, 1, 0, 0.7960784, 1,
1.213165, -0.492661, 0.1540156, 1, 0, 0.7921569, 1,
1.215591, 1.393501, 1.324271, 1, 0, 0.7843137, 1,
1.223758, -1.117451, 1.130501, 1, 0, 0.7803922, 1,
1.227975, -2.017598, 1.722153, 1, 0, 0.772549, 1,
1.234175, -0.4156428, 1.131736, 1, 0, 0.7686275, 1,
1.236625, 0.6110258, -0.6377464, 1, 0, 0.7607843, 1,
1.254272, 0.06872802, 2.45972, 1, 0, 0.7568628, 1,
1.255566, -1.80341, 2.162062, 1, 0, 0.7490196, 1,
1.25832, 0.8661538, 1.187958, 1, 0, 0.7450981, 1,
1.262165, -0.8132038, 0.6268701, 1, 0, 0.7372549, 1,
1.272178, 0.1033924, 2.773771, 1, 0, 0.7333333, 1,
1.276005, -0.4739832, 0.4047842, 1, 0, 0.7254902, 1,
1.278929, -0.3919693, 2.314943, 1, 0, 0.7215686, 1,
1.279307, 1.276294, 0.637337, 1, 0, 0.7137255, 1,
1.282042, -1.075143, 4.224277, 1, 0, 0.7098039, 1,
1.282955, 0.7986647, 2.212933, 1, 0, 0.7019608, 1,
1.288022, 0.3350683, 1.133654, 1, 0, 0.6941177, 1,
1.289796, 0.2569447, 1.447809, 1, 0, 0.6901961, 1,
1.302284, 0.9164524, 1.599198, 1, 0, 0.682353, 1,
1.306427, -0.3588938, 1.854974, 1, 0, 0.6784314, 1,
1.310249, 1.756562, -0.2359003, 1, 0, 0.6705883, 1,
1.314281, -0.7834498, 3.011261, 1, 0, 0.6666667, 1,
1.314903, 0.3255045, 1.039903, 1, 0, 0.6588235, 1,
1.318981, -1.265451, 2.317054, 1, 0, 0.654902, 1,
1.31914, -3.176762, 2.949668, 1, 0, 0.6470588, 1,
1.325676, 0.4448743, 1.356466, 1, 0, 0.6431373, 1,
1.331216, -0.1953373, 2.488792, 1, 0, 0.6352941, 1,
1.348826, -1.508944, 2.086921, 1, 0, 0.6313726, 1,
1.357347, 0.06501351, 1.159373, 1, 0, 0.6235294, 1,
1.365045, -0.6508649, 2.373994, 1, 0, 0.6196079, 1,
1.366691, 0.2003688, 0.2937189, 1, 0, 0.6117647, 1,
1.370381, -0.5667133, 1.83217, 1, 0, 0.6078432, 1,
1.373729, -0.0005721989, 0.6424323, 1, 0, 0.6, 1,
1.375833, 0.3471865, 0.6456586, 1, 0, 0.5921569, 1,
1.375973, 0.7252436, 3.24255, 1, 0, 0.5882353, 1,
1.377868, 0.2265711, 1.651203, 1, 0, 0.5803922, 1,
1.378652, -1.382754, 4.227862, 1, 0, 0.5764706, 1,
1.381409, 0.04146496, 2.526295, 1, 0, 0.5686275, 1,
1.388818, -0.120103, 0.4469017, 1, 0, 0.5647059, 1,
1.398062, -0.4555328, 1.77473, 1, 0, 0.5568628, 1,
1.403191, 1.758531, 0.3640664, 1, 0, 0.5529412, 1,
1.404641, -0.5982216, 1.163717, 1, 0, 0.5450981, 1,
1.413084, 0.4107172, 2.123609, 1, 0, 0.5411765, 1,
1.415694, -0.1971145, 2.706236, 1, 0, 0.5333334, 1,
1.429604, 0.01822913, -1.315983, 1, 0, 0.5294118, 1,
1.4312, 0.4304076, 1.919588, 1, 0, 0.5215687, 1,
1.441775, 1.681404, 0.07649741, 1, 0, 0.5176471, 1,
1.445433, -0.007648116, 1.651265, 1, 0, 0.509804, 1,
1.451344, -2.777065, 3.166853, 1, 0, 0.5058824, 1,
1.468309, -1.076172, 0.7493459, 1, 0, 0.4980392, 1,
1.480129, -1.257836, 2.725678, 1, 0, 0.4901961, 1,
1.482115, -0.4280389, 2.319351, 1, 0, 0.4862745, 1,
1.495346, 1.27808, 0.8085548, 1, 0, 0.4784314, 1,
1.50506, -1.649173, 2.9931, 1, 0, 0.4745098, 1,
1.517395, -0.3417976, 2.173175, 1, 0, 0.4666667, 1,
1.522713, 0.6171452, 2.24735, 1, 0, 0.4627451, 1,
1.522766, 0.8767759, -0.8334039, 1, 0, 0.454902, 1,
1.540838, 2.600821, 2.805381, 1, 0, 0.4509804, 1,
1.54374, 1.206458, -0.6474424, 1, 0, 0.4431373, 1,
1.545991, -0.5329733, 1.156973, 1, 0, 0.4392157, 1,
1.550514, 1.527791, 2.008253, 1, 0, 0.4313726, 1,
1.552256, -0.773093, 2.693174, 1, 0, 0.427451, 1,
1.5546, 1.190992, 0.6275195, 1, 0, 0.4196078, 1,
1.554697, 1.174185, 0.136675, 1, 0, 0.4156863, 1,
1.558027, 0.2612566, 2.580302, 1, 0, 0.4078431, 1,
1.561726, -0.4793358, 1.335224, 1, 0, 0.4039216, 1,
1.563062, 0.4078742, 0.337235, 1, 0, 0.3960784, 1,
1.591245, 1.49759, 2.30602, 1, 0, 0.3882353, 1,
1.595398, 0.02100054, 1.06241, 1, 0, 0.3843137, 1,
1.611213, -0.3439521, 3.02523, 1, 0, 0.3764706, 1,
1.625541, 1.158322, 1.462294, 1, 0, 0.372549, 1,
1.641107, 0.4784461, 1.884966, 1, 0, 0.3647059, 1,
1.648413, 0.09715495, 2.685971, 1, 0, 0.3607843, 1,
1.653797, 1.261869, 2.146252, 1, 0, 0.3529412, 1,
1.671667, -0.4374132, 2.560941, 1, 0, 0.3490196, 1,
1.679201, 0.2666075, 3.549586, 1, 0, 0.3411765, 1,
1.697385, 0.540365, 0.8331881, 1, 0, 0.3372549, 1,
1.702634, -0.3176153, 2.913415, 1, 0, 0.3294118, 1,
1.708094, 0.5330977, 3.088908, 1, 0, 0.3254902, 1,
1.708839, -1.429337, 1.537726, 1, 0, 0.3176471, 1,
1.726097, 0.6516158, 1.935753, 1, 0, 0.3137255, 1,
1.728307, -0.8654985, 4.058217, 1, 0, 0.3058824, 1,
1.734212, 1.065768, -0.01389216, 1, 0, 0.2980392, 1,
1.737514, 0.6118165, 0.5332235, 1, 0, 0.2941177, 1,
1.766867, -0.4055032, 1.965449, 1, 0, 0.2862745, 1,
1.771695, -0.5687672, 1.159569, 1, 0, 0.282353, 1,
1.814183, -0.3511229, 2.651525, 1, 0, 0.2745098, 1,
1.821715, 0.7949386, 0.1364338, 1, 0, 0.2705882, 1,
1.822657, 0.1535866, 1.557945, 1, 0, 0.2627451, 1,
1.824134, 1.612584, 0.9889365, 1, 0, 0.2588235, 1,
1.827058, -0.01670056, 0.9879439, 1, 0, 0.2509804, 1,
1.863921, -0.2841043, 1.881598, 1, 0, 0.2470588, 1,
1.873584, 0.2041454, 0.7126917, 1, 0, 0.2392157, 1,
1.91549, -0.3388612, 3.327605, 1, 0, 0.2352941, 1,
1.925662, -0.4110241, 2.991821, 1, 0, 0.227451, 1,
1.945842, 0.5371387, 0.4678037, 1, 0, 0.2235294, 1,
1.952331, -0.1235452, 1.73632, 1, 0, 0.2156863, 1,
1.95651, -0.3963281, 2.227576, 1, 0, 0.2117647, 1,
1.956992, -1.041895, 2.560924, 1, 0, 0.2039216, 1,
1.996814, -1.497622, 0.6268568, 1, 0, 0.1960784, 1,
2.026023, -0.1071568, -0.2099433, 1, 0, 0.1921569, 1,
2.032728, -0.6900427, 1.598289, 1, 0, 0.1843137, 1,
2.034875, 1.160081, 0.1740677, 1, 0, 0.1803922, 1,
2.042295, -0.4249944, 3.316791, 1, 0, 0.172549, 1,
2.06989, 0.8981189, 1.342003, 1, 0, 0.1686275, 1,
2.070537, 0.7025018, 2.058738, 1, 0, 0.1607843, 1,
2.077316, -0.1928894, 1.91568, 1, 0, 0.1568628, 1,
2.105778, -1.113603, 1.870906, 1, 0, 0.1490196, 1,
2.12601, 0.9570045, 1.143776, 1, 0, 0.145098, 1,
2.129379, -0.2432248, 1.76886, 1, 0, 0.1372549, 1,
2.139715, -1.767155, 2.044135, 1, 0, 0.1333333, 1,
2.142715, 0.05327008, 0.6081278, 1, 0, 0.1254902, 1,
2.151896, 0.633759, 3.106815, 1, 0, 0.1215686, 1,
2.163427, 0.5569425, 1.218245, 1, 0, 0.1137255, 1,
2.17375, 0.3305646, 0.6486262, 1, 0, 0.1098039, 1,
2.176805, 0.1989606, 0.02515919, 1, 0, 0.1019608, 1,
2.208136, 0.2473822, 1.2858, 1, 0, 0.09411765, 1,
2.219363, 1.061309, 1.428908, 1, 0, 0.09019608, 1,
2.247603, 1.396784, 0.6647332, 1, 0, 0.08235294, 1,
2.249446, -0.2988456, 0.5473258, 1, 0, 0.07843138, 1,
2.249568, 1.24868, 2.169859, 1, 0, 0.07058824, 1,
2.256363, 0.5425224, 1.439385, 1, 0, 0.06666667, 1,
2.272326, 1.054361, 0.3941937, 1, 0, 0.05882353, 1,
2.312993, 0.1999252, 1.451707, 1, 0, 0.05490196, 1,
2.39936, 0.3484276, 1.368878, 1, 0, 0.04705882, 1,
2.406569, -2.115083, 3.575106, 1, 0, 0.04313726, 1,
2.444637, 0.3986975, 1.31057, 1, 0, 0.03529412, 1,
2.446845, -1.352685, 0.7831789, 1, 0, 0.03137255, 1,
2.577217, 2.487684, -0.09416012, 1, 0, 0.02352941, 1,
2.743247, 0.2624172, 2.177767, 1, 0, 0.01960784, 1,
2.937709, 0.3832728, 2.85111, 1, 0, 0.01176471, 1,
3.85923, 0.4766298, 0.7828001, 1, 0, 0.007843138, 1
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
0.5341901, -5.078527, -7.75459, 0, -0.5, 0.5, 0.5,
0.5341901, -5.078527, -7.75459, 1, -0.5, 0.5, 0.5,
0.5341901, -5.078527, -7.75459, 1, 1.5, 0.5, 0.5,
0.5341901, -5.078527, -7.75459, 0, 1.5, 0.5, 0.5
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
-3.918039, -0.4204071, -7.75459, 0, -0.5, 0.5, 0.5,
-3.918039, -0.4204071, -7.75459, 1, -0.5, 0.5, 0.5,
-3.918039, -0.4204071, -7.75459, 1, 1.5, 0.5, 0.5,
-3.918039, -0.4204071, -7.75459, 0, 1.5, 0.5, 0.5
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
-3.918039, -5.078527, -0.3282998, 0, -0.5, 0.5, 0.5,
-3.918039, -5.078527, -0.3282998, 1, -0.5, 0.5, 0.5,
-3.918039, -5.078527, -0.3282998, 1, 1.5, 0.5, 0.5,
-3.918039, -5.078527, -0.3282998, 0, 1.5, 0.5, 0.5
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
-2, -4.003577, -6.040831,
3, -4.003577, -6.040831,
-2, -4.003577, -6.040831,
-2, -4.182735, -6.326458,
-1, -4.003577, -6.040831,
-1, -4.182735, -6.326458,
0, -4.003577, -6.040831,
0, -4.182735, -6.326458,
1, -4.003577, -6.040831,
1, -4.182735, -6.326458,
2, -4.003577, -6.040831,
2, -4.182735, -6.326458,
3, -4.003577, -6.040831,
3, -4.182735, -6.326458
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
-2, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
-2, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
-2, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
-2, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5,
-1, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
-1, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
-1, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
-1, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5,
0, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
0, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
0, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
0, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5,
1, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
1, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
1, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
1, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5,
2, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
2, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
2, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
2, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5,
3, -4.541052, -6.89771, 0, -0.5, 0.5, 0.5,
3, -4.541052, -6.89771, 1, -0.5, 0.5, 0.5,
3, -4.541052, -6.89771, 1, 1.5, 0.5, 0.5,
3, -4.541052, -6.89771, 0, 1.5, 0.5, 0.5
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
-2.890601, -3, -6.040831,
-2.890601, 3, -6.040831,
-2.890601, -3, -6.040831,
-3.061841, -3, -6.326458,
-2.890601, -2, -6.040831,
-3.061841, -2, -6.326458,
-2.890601, -1, -6.040831,
-3.061841, -1, -6.326458,
-2.890601, 0, -6.040831,
-3.061841, 0, -6.326458,
-2.890601, 1, -6.040831,
-3.061841, 1, -6.326458,
-2.890601, 2, -6.040831,
-3.061841, 2, -6.326458,
-2.890601, 3, -6.040831,
-3.061841, 3, -6.326458
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
-3.40432, -3, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, -3, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, -3, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, -3, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, -2, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, -2, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, -2, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, -2, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, -1, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, -1, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, -1, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, -1, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, 0, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, 0, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, 0, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, 0, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, 1, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, 1, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, 1, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, 1, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, 2, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, 2, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, 2, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, 2, -6.89771, 0, 1.5, 0.5, 0.5,
-3.40432, 3, -6.89771, 0, -0.5, 0.5, 0.5,
-3.40432, 3, -6.89771, 1, -0.5, 0.5, 0.5,
-3.40432, 3, -6.89771, 1, 1.5, 0.5, 0.5,
-3.40432, 3, -6.89771, 0, 1.5, 0.5, 0.5
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
-2.890601, -4.003577, -4,
-2.890601, -4.003577, 4,
-2.890601, -4.003577, -4,
-3.061841, -4.182735, -4,
-2.890601, -4.003577, -2,
-3.061841, -4.182735, -2,
-2.890601, -4.003577, 0,
-3.061841, -4.182735, 0,
-2.890601, -4.003577, 2,
-3.061841, -4.182735, 2,
-2.890601, -4.003577, 4,
-3.061841, -4.182735, 4
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
-3.40432, -4.541052, -4, 0, -0.5, 0.5, 0.5,
-3.40432, -4.541052, -4, 1, -0.5, 0.5, 0.5,
-3.40432, -4.541052, -4, 1, 1.5, 0.5, 0.5,
-3.40432, -4.541052, -4, 0, 1.5, 0.5, 0.5,
-3.40432, -4.541052, -2, 0, -0.5, 0.5, 0.5,
-3.40432, -4.541052, -2, 1, -0.5, 0.5, 0.5,
-3.40432, -4.541052, -2, 1, 1.5, 0.5, 0.5,
-3.40432, -4.541052, -2, 0, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 0, 0, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 0, 1, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 0, 1, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 0, 0, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 2, 0, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 2, 1, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 2, 1, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 2, 0, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 4, 0, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 4, 1, -0.5, 0.5, 0.5,
-3.40432, -4.541052, 4, 1, 1.5, 0.5, 0.5,
-3.40432, -4.541052, 4, 0, 1.5, 0.5, 0.5
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
-2.890601, -4.003577, -6.040831,
-2.890601, 3.162762, -6.040831,
-2.890601, -4.003577, 5.384231,
-2.890601, 3.162762, 5.384231,
-2.890601, -4.003577, -6.040831,
-2.890601, -4.003577, 5.384231,
-2.890601, 3.162762, -6.040831,
-2.890601, 3.162762, 5.384231,
-2.890601, -4.003577, -6.040831,
3.958982, -4.003577, -6.040831,
-2.890601, -4.003577, 5.384231,
3.958982, -4.003577, 5.384231,
-2.890601, 3.162762, -6.040831,
3.958982, 3.162762, -6.040831,
-2.890601, 3.162762, 5.384231,
3.958982, 3.162762, 5.384231,
3.958982, -4.003577, -6.040831,
3.958982, 3.162762, -6.040831,
3.958982, -4.003577, 5.384231,
3.958982, 3.162762, 5.384231,
3.958982, -4.003577, -6.040831,
3.958982, -4.003577, 5.384231,
3.958982, 3.162762, -6.040831,
3.958982, 3.162762, 5.384231
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
var radius = 8.077155;
var distance = 35.93617;
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
mvMatrix.translate( -0.5341901, 0.4204071, 0.3282998 );
mvMatrix.scale( 1.274994, 1.218639, 0.7643878 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.93617);
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
thidiazuron<-read.table("thidiazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thidiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
```

```r
y<-thidiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
```

```r
z<-thidiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
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
-2.79085, 2.262728, 0.2894118, 0, 0, 1, 1, 1,
-2.593698, 0.02216332, -2.48577, 1, 0, 0, 1, 1,
-2.55843, 0.09858389, -1.671, 1, 0, 0, 1, 1,
-2.524505, -0.109038, -1.069616, 1, 0, 0, 1, 1,
-2.447439, 0.1041461, -1.957417, 1, 0, 0, 1, 1,
-2.421918, 1.62464, -0.9484838, 1, 0, 0, 1, 1,
-2.382329, 1.653764, -2.708264, 0, 0, 0, 1, 1,
-2.354599, -1.297482, -1.756509, 0, 0, 0, 1, 1,
-2.353407, 0.546165, -0.3131533, 0, 0, 0, 1, 1,
-2.317809, 0.2511896, -1.473675, 0, 0, 0, 1, 1,
-2.302396, 0.7759867, -0.7548501, 0, 0, 0, 1, 1,
-2.270931, 0.2485514, -1.06048, 0, 0, 0, 1, 1,
-2.226238, 0.2182465, -0.7577352, 0, 0, 0, 1, 1,
-2.173777, 0.225286, -2.226844, 1, 1, 1, 1, 1,
-2.167861, 0.1210232, -2.113327, 1, 1, 1, 1, 1,
-2.037197, 0.4184497, -0.6954345, 1, 1, 1, 1, 1,
-2.02665, -0.8988076, -1.18471, 1, 1, 1, 1, 1,
-1.930943, -1.177028, -1.92986, 1, 1, 1, 1, 1,
-1.903171, 1.152959, 0.137617, 1, 1, 1, 1, 1,
-1.890987, 2.179165, -0.3147297, 1, 1, 1, 1, 1,
-1.890257, -0.7061428, -2.090728, 1, 1, 1, 1, 1,
-1.884559, 0.1541431, -3.711926, 1, 1, 1, 1, 1,
-1.866054, 0.1235793, -0.2099698, 1, 1, 1, 1, 1,
-1.852517, 0.3855632, -0.402079, 1, 1, 1, 1, 1,
-1.84661, -1.023806, -2.310495, 1, 1, 1, 1, 1,
-1.806649, -1.247887, -1.612931, 1, 1, 1, 1, 1,
-1.789275, -0.5888689, -0.0580072, 1, 1, 1, 1, 1,
-1.788446, -0.4237808, -1.784104, 1, 1, 1, 1, 1,
-1.785749, -0.3166495, -1.778747, 0, 0, 1, 1, 1,
-1.784855, -0.07247187, -4.28551, 1, 0, 0, 1, 1,
-1.775842, 0.525832, -1.615136, 1, 0, 0, 1, 1,
-1.768836, 0.9429466, 0.3717371, 1, 0, 0, 1, 1,
-1.729327, 0.2997386, -2.131735, 1, 0, 0, 1, 1,
-1.727248, -2.278123, -3.446303, 1, 0, 0, 1, 1,
-1.722781, -0.05433145, -1.298591, 0, 0, 0, 1, 1,
-1.719805, -0.2610439, -1.554178, 0, 0, 0, 1, 1,
-1.713258, -0.01409384, -0.8670336, 0, 0, 0, 1, 1,
-1.712459, 0.6363186, -1.036478, 0, 0, 0, 1, 1,
-1.702325, -0.01140462, -2.859838, 0, 0, 0, 1, 1,
-1.697308, -1.156379, -3.166047, 0, 0, 0, 1, 1,
-1.673657, -0.8007469, -1.801415, 0, 0, 0, 1, 1,
-1.66926, 1.42671, -2.009491, 1, 1, 1, 1, 1,
-1.663175, 0.7074062, -0.859082, 1, 1, 1, 1, 1,
-1.649966, -0.5368423, -2.201891, 1, 1, 1, 1, 1,
-1.638956, 0.6465091, -0.5472356, 1, 1, 1, 1, 1,
-1.636734, -0.1877449, -2.466535, 1, 1, 1, 1, 1,
-1.622408, 1.083351, 0.1894042, 1, 1, 1, 1, 1,
-1.578112, 0.4740736, -1.38651, 1, 1, 1, 1, 1,
-1.57667, 0.5638463, -0.9410173, 1, 1, 1, 1, 1,
-1.576452, 0.8600917, -2.258095, 1, 1, 1, 1, 1,
-1.574381, 0.6645569, -1.554294, 1, 1, 1, 1, 1,
-1.567588, -0.4007538, -0.1913591, 1, 1, 1, 1, 1,
-1.565358, 0.7436144, -1.950994, 1, 1, 1, 1, 1,
-1.552651, 0.8237406, -0.4629683, 1, 1, 1, 1, 1,
-1.548283, -0.1916161, -2.20563, 1, 1, 1, 1, 1,
-1.529265, -0.6104517, -2.682546, 1, 1, 1, 1, 1,
-1.502933, 0.7011532, -3.216646, 0, 0, 1, 1, 1,
-1.502774, -1.058341, -1.410536, 1, 0, 0, 1, 1,
-1.495374, -1.021626, -3.768324, 1, 0, 0, 1, 1,
-1.487483, -0.7232219, -2.610891, 1, 0, 0, 1, 1,
-1.486571, -0.5051168, -2.737169, 1, 0, 0, 1, 1,
-1.469699, -1.098407, -1.353202, 1, 0, 0, 1, 1,
-1.467302, -0.4248462, -3.164522, 0, 0, 0, 1, 1,
-1.460641, 0.3904898, -2.523789, 0, 0, 0, 1, 1,
-1.459426, 0.5034452, -0.9589604, 0, 0, 0, 1, 1,
-1.457217, -0.633219, -2.670832, 0, 0, 0, 1, 1,
-1.454572, -0.6261278, -1.937029, 0, 0, 0, 1, 1,
-1.453352, -1.322764, -2.941011, 0, 0, 0, 1, 1,
-1.448999, -0.1168807, -1.825927, 0, 0, 0, 1, 1,
-1.446946, 0.3608294, -1.674336, 1, 1, 1, 1, 1,
-1.441215, 0.2183273, -0.789765, 1, 1, 1, 1, 1,
-1.4403, 0.1892739, -2.178476, 1, 1, 1, 1, 1,
-1.437235, -0.2066917, -3.373915, 1, 1, 1, 1, 1,
-1.424319, -0.779889, -0.6316718, 1, 1, 1, 1, 1,
-1.423344, -0.1921003, -0.2958477, 1, 1, 1, 1, 1,
-1.421351, -1.67215, -1.652617, 1, 1, 1, 1, 1,
-1.420078, -0.3947678, -0.2605739, 1, 1, 1, 1, 1,
-1.411331, -0.2236245, -2.193184, 1, 1, 1, 1, 1,
-1.406879, 0.2585003, -1.727761, 1, 1, 1, 1, 1,
-1.392729, -0.2780507, 1.010973, 1, 1, 1, 1, 1,
-1.38904, -2.232688, -2.632087, 1, 1, 1, 1, 1,
-1.363604, 0.5099323, -2.539254, 1, 1, 1, 1, 1,
-1.354074, -1.245014, -1.64797, 1, 1, 1, 1, 1,
-1.351077, -0.4495248, -1.014918, 1, 1, 1, 1, 1,
-1.348951, 0.06333419, -1.655583, 0, 0, 1, 1, 1,
-1.342987, 0.1338649, -1.200293, 1, 0, 0, 1, 1,
-1.339831, 0.03753156, -0.9616879, 1, 0, 0, 1, 1,
-1.339506, 0.02497706, -1.27523, 1, 0, 0, 1, 1,
-1.337913, 0.09647557, -1.350117, 1, 0, 0, 1, 1,
-1.33322, -0.7935136, -3.166167, 1, 0, 0, 1, 1,
-1.331263, -0.4351358, -3.904492, 0, 0, 0, 1, 1,
-1.322491, -0.04826763, 0.09239126, 0, 0, 0, 1, 1,
-1.322164, 0.1277631, -1.548362, 0, 0, 0, 1, 1,
-1.319048, -1.137919, -1.468925, 0, 0, 0, 1, 1,
-1.318295, 1.545649, -0.7522674, 0, 0, 0, 1, 1,
-1.317118, -1.701464, -2.8533, 0, 0, 0, 1, 1,
-1.313669, -0.09188921, -1.498994, 0, 0, 0, 1, 1,
-1.313221, -0.600409, -1.895886, 1, 1, 1, 1, 1,
-1.310898, -0.4793625, -1.965833, 1, 1, 1, 1, 1,
-1.310292, -0.732873, -2.421403, 1, 1, 1, 1, 1,
-1.306892, -1.338491, -2.593935, 1, 1, 1, 1, 1,
-1.302043, -0.6490184, -2.809042, 1, 1, 1, 1, 1,
-1.293882, -0.3625934, -1.703492, 1, 1, 1, 1, 1,
-1.293286, -0.4564332, -1.758782, 1, 1, 1, 1, 1,
-1.291747, 2.336544, -1.060147, 1, 1, 1, 1, 1,
-1.288168, -0.757566, -3.229309, 1, 1, 1, 1, 1,
-1.283911, 1.287553, -0.4466373, 1, 1, 1, 1, 1,
-1.280103, 0.6924915, -1.856252, 1, 1, 1, 1, 1,
-1.278548, 2.571049, -1.48139, 1, 1, 1, 1, 1,
-1.276076, 0.8539793, -1.800301, 1, 1, 1, 1, 1,
-1.266946, 0.986779, -0.3449864, 1, 1, 1, 1, 1,
-1.2603, 0.8836682, -2.483979, 1, 1, 1, 1, 1,
-1.257666, -1.675619, -3.059101, 0, 0, 1, 1, 1,
-1.252449, 1.582565, 0.4553389, 1, 0, 0, 1, 1,
-1.251899, -0.09456807, -1.207015, 1, 0, 0, 1, 1,
-1.240992, 0.01309208, -3.153852, 1, 0, 0, 1, 1,
-1.237941, -1.521004, -2.715588, 1, 0, 0, 1, 1,
-1.23771, -0.1524246, -2.266343, 1, 0, 0, 1, 1,
-1.235662, -1.399108, -3.189402, 0, 0, 0, 1, 1,
-1.235316, 2.704174, -2.103785, 0, 0, 0, 1, 1,
-1.235273, -0.111757, -1.705447, 0, 0, 0, 1, 1,
-1.229179, -1.089252, -1.972638, 0, 0, 0, 1, 1,
-1.227535, 0.9191294, -1.433552, 0, 0, 0, 1, 1,
-1.222285, -1.823359, -1.50386, 0, 0, 0, 1, 1,
-1.218168, -0.8481331, -2.852304, 0, 0, 0, 1, 1,
-1.208706, -0.2641636, -3.275598, 1, 1, 1, 1, 1,
-1.207133, -0.6490988, -1.863573, 1, 1, 1, 1, 1,
-1.198071, -0.1841168, -2.654606, 1, 1, 1, 1, 1,
-1.188146, -0.09066208, -1.64507, 1, 1, 1, 1, 1,
-1.182669, -1.400008, -2.286685, 1, 1, 1, 1, 1,
-1.180073, -0.4152672, -1.552352, 1, 1, 1, 1, 1,
-1.178934, -0.886931, -3.331298, 1, 1, 1, 1, 1,
-1.173892, 0.2119026, 0.6401087, 1, 1, 1, 1, 1,
-1.142636, -0.3624036, -1.414564, 1, 1, 1, 1, 1,
-1.141641, -0.3476695, -0.9621357, 1, 1, 1, 1, 1,
-1.132745, 0.130105, -0.220968, 1, 1, 1, 1, 1,
-1.128572, -0.335708, -2.858415, 1, 1, 1, 1, 1,
-1.127678, 0.5908016, -1.758453, 1, 1, 1, 1, 1,
-1.119015, -0.642085, 0.07418247, 1, 1, 1, 1, 1,
-1.115228, 0.0114464, 0.01467036, 1, 1, 1, 1, 1,
-1.114495, -0.4487603, -1.875272, 0, 0, 1, 1, 1,
-1.104555, 2.159067, -3.124238, 1, 0, 0, 1, 1,
-1.104391, 0.9068591, 1.094586, 1, 0, 0, 1, 1,
-1.099541, -1.219233, -1.206988, 1, 0, 0, 1, 1,
-1.096116, 0.286006, -1.890078, 1, 0, 0, 1, 1,
-1.092008, 0.858387, 0.006887653, 1, 0, 0, 1, 1,
-1.088153, -0.05698649, -0.8728792, 0, 0, 0, 1, 1,
-1.087971, -1.175862, -4.0982, 0, 0, 0, 1, 1,
-1.087151, 0.4667934, -2.260676, 0, 0, 0, 1, 1,
-1.086778, -0.1437833, -1.740585, 0, 0, 0, 1, 1,
-1.084642, -0.3206088, -1.012978, 0, 0, 0, 1, 1,
-1.08347, -0.6426774, -1.123328, 0, 0, 0, 1, 1,
-1.082181, 1.239774, -0.4355544, 0, 0, 0, 1, 1,
-1.071925, 0.7405615, -1.484261, 1, 1, 1, 1, 1,
-1.066099, -0.3143233, -2.41853, 1, 1, 1, 1, 1,
-1.06206, 0.4040072, -1.040217, 1, 1, 1, 1, 1,
-1.057309, 0.2088628, -1.076203, 1, 1, 1, 1, 1,
-1.053085, -1.338515, -1.685383, 1, 1, 1, 1, 1,
-1.052708, 3.058398, 0.1742081, 1, 1, 1, 1, 1,
-1.052371, 0.1031127, -1.752822, 1, 1, 1, 1, 1,
-1.049928, -1.467598, -3.837379, 1, 1, 1, 1, 1,
-1.037256, 0.09783041, -2.089047, 1, 1, 1, 1, 1,
-1.035718, 0.1845534, -0.3233112, 1, 1, 1, 1, 1,
-1.035003, 0.4421198, -0.878073, 1, 1, 1, 1, 1,
-1.033455, -1.316894, -1.859669, 1, 1, 1, 1, 1,
-1.025643, -0.2549103, -2.042518, 1, 1, 1, 1, 1,
-1.023575, 1.376956, -1.152487, 1, 1, 1, 1, 1,
-1.018622, -0.09462851, -1.375194, 1, 1, 1, 1, 1,
-1.018402, -0.2158362, -4.003413, 0, 0, 1, 1, 1,
-1.012599, 1.309711, -1.232357, 1, 0, 0, 1, 1,
-1.010771, 0.6571885, -1.295953, 1, 0, 0, 1, 1,
-1.007467, -1.26549, -2.318228, 1, 0, 0, 1, 1,
-1.003628, -0.718698, -1.008064, 1, 0, 0, 1, 1,
-0.9971077, 0.3264962, 1.238947, 1, 0, 0, 1, 1,
-0.9943191, -0.2919765, -1.72626, 0, 0, 0, 1, 1,
-0.9864212, 0.01980038, -1.114164, 0, 0, 0, 1, 1,
-0.9818406, 0.03613912, -5.333398, 0, 0, 0, 1, 1,
-0.9790539, -0.1279394, -1.247851, 0, 0, 0, 1, 1,
-0.969941, -0.2644753, -1.715608, 0, 0, 0, 1, 1,
-0.9687591, 1.337742, -0.565643, 0, 0, 0, 1, 1,
-0.9664388, -1.193262, -1.942966, 0, 0, 0, 1, 1,
-0.9636292, 1.714046, 0.4369913, 1, 1, 1, 1, 1,
-0.9543197, -1.673434, -3.070513, 1, 1, 1, 1, 1,
-0.9538032, -0.9328814, -0.8582111, 1, 1, 1, 1, 1,
-0.9513084, 0.2821557, -0.05669574, 1, 1, 1, 1, 1,
-0.9475531, -0.2258143, -2.880104, 1, 1, 1, 1, 1,
-0.9474585, -3.359303, -3.228547, 1, 1, 1, 1, 1,
-0.944647, -0.4804543, -2.023366, 1, 1, 1, 1, 1,
-0.9416108, -0.03041514, -0.8220201, 1, 1, 1, 1, 1,
-0.9353774, -0.886133, -1.140927, 1, 1, 1, 1, 1,
-0.9245871, -0.522026, -2.989025, 1, 1, 1, 1, 1,
-0.9198136, -0.2145515, -2.23492, 1, 1, 1, 1, 1,
-0.9171534, -0.192985, -1.865453, 1, 1, 1, 1, 1,
-0.9125247, 1.444123, -1.055102, 1, 1, 1, 1, 1,
-0.9072957, -1.463916, -2.621406, 1, 1, 1, 1, 1,
-0.9065784, 0.9462062, -0.4069029, 1, 1, 1, 1, 1,
-0.9044119, -0.7347797, -2.356688, 0, 0, 1, 1, 1,
-0.8901513, -0.09196513, -0.7609704, 1, 0, 0, 1, 1,
-0.8805007, -2.914484, -4.442275, 1, 0, 0, 1, 1,
-0.8774263, -0.1716336, -2.36091, 1, 0, 0, 1, 1,
-0.8741083, -1.310499, -2.553994, 1, 0, 0, 1, 1,
-0.8731095, 0.9959541, -1.161486, 1, 0, 0, 1, 1,
-0.8654431, -1.656842, -1.818399, 0, 0, 0, 1, 1,
-0.8557413, 0.03030289, -1.391489, 0, 0, 0, 1, 1,
-0.8513118, -0.2154854, -1.014387, 0, 0, 0, 1, 1,
-0.8442116, 0.3400265, -2.124013, 0, 0, 0, 1, 1,
-0.8429343, 0.1623238, -0.1691333, 0, 0, 0, 1, 1,
-0.83346, 0.4058694, -1.147796, 0, 0, 0, 1, 1,
-0.8296241, 0.9128389, -1.100064, 0, 0, 0, 1, 1,
-0.8237853, -0.906163, -2.252842, 1, 1, 1, 1, 1,
-0.8221996, 1.231019, -0.1844662, 1, 1, 1, 1, 1,
-0.8173239, 0.3918473, -1.657767, 1, 1, 1, 1, 1,
-0.8137825, 1.986466, -1.410221, 1, 1, 1, 1, 1,
-0.8131367, 0.4465371, -0.5655912, 1, 1, 1, 1, 1,
-0.811823, 1.618282, -2.336184, 1, 1, 1, 1, 1,
-0.8109185, 0.404325, -2.15127, 1, 1, 1, 1, 1,
-0.8053154, -0.8095583, -1.983185, 1, 1, 1, 1, 1,
-0.8003057, -1.447855, -1.301797, 1, 1, 1, 1, 1,
-0.7995383, 0.2460085, -3.341889, 1, 1, 1, 1, 1,
-0.7989602, -2.03438, -1.983144, 1, 1, 1, 1, 1,
-0.7972029, -0.4212452, -2.756594, 1, 1, 1, 1, 1,
-0.79423, -1.596942, -0.8535874, 1, 1, 1, 1, 1,
-0.7937273, -0.1876525, -0.266863, 1, 1, 1, 1, 1,
-0.7922299, -0.07244113, -3.158768, 1, 1, 1, 1, 1,
-0.7912141, 0.3030096, 0.5510972, 0, 0, 1, 1, 1,
-0.7870762, 0.7635036, 0.06661437, 1, 0, 0, 1, 1,
-0.777378, -1.176851, -3.501969, 1, 0, 0, 1, 1,
-0.7770272, -1.047309, -3.18018, 1, 0, 0, 1, 1,
-0.7761934, -0.6962852, -3.314027, 1, 0, 0, 1, 1,
-0.7732081, -0.3992452, 0.6289002, 1, 0, 0, 1, 1,
-0.7658125, 0.5510414, 0.05671329, 0, 0, 0, 1, 1,
-0.7646484, -0.003372262, -1.941516, 0, 0, 0, 1, 1,
-0.7614225, 1.635722, 0.1776233, 0, 0, 0, 1, 1,
-0.758827, 0.5679275, -1.73859, 0, 0, 0, 1, 1,
-0.7574049, 1.544959, 0.1179239, 0, 0, 0, 1, 1,
-0.7507219, 0.02004256, -1.495601, 0, 0, 0, 1, 1,
-0.749106, 0.08639261, -3.527634, 0, 0, 0, 1, 1,
-0.7476904, -0.02552158, -1.913019, 1, 1, 1, 1, 1,
-0.7472513, -0.197114, -2.703057, 1, 1, 1, 1, 1,
-0.7460108, 0.6335725, -0.6720101, 1, 1, 1, 1, 1,
-0.7439934, 0.264839, -2.138099, 1, 1, 1, 1, 1,
-0.7406005, 1.162163, -1.887329, 1, 1, 1, 1, 1,
-0.7385727, 0.8706468, 0.356534, 1, 1, 1, 1, 1,
-0.7384488, -1.402325, -2.828814, 1, 1, 1, 1, 1,
-0.7382857, -1.119566, -3.075549, 1, 1, 1, 1, 1,
-0.7305165, 0.3576863, -0.539015, 1, 1, 1, 1, 1,
-0.7151957, -2.027184, -1.243839, 1, 1, 1, 1, 1,
-0.7134784, -0.7880785, -2.138885, 1, 1, 1, 1, 1,
-0.7104281, -0.6028054, -1.294117, 1, 1, 1, 1, 1,
-0.7096793, 0.3547738, -1.574346, 1, 1, 1, 1, 1,
-0.7088929, -0.4323941, -0.3968896, 1, 1, 1, 1, 1,
-0.691581, 0.8035877, -1.186124, 1, 1, 1, 1, 1,
-0.6758601, 0.8760716, -0.1693058, 0, 0, 1, 1, 1,
-0.6724781, -0.004065601, -2.035141, 1, 0, 0, 1, 1,
-0.6679761, 0.9696394, -0.1060699, 1, 0, 0, 1, 1,
-0.6674449, -0.02542021, -1.596515, 1, 0, 0, 1, 1,
-0.6633437, 0.7574779, -1.525815, 1, 0, 0, 1, 1,
-0.6613244, 0.2018991, -2.051064, 1, 0, 0, 1, 1,
-0.6574407, -1.282066, -2.119384, 0, 0, 0, 1, 1,
-0.6462965, -0.4413077, -4.07442, 0, 0, 0, 1, 1,
-0.6442337, 0.8638887, 0.7605615, 0, 0, 0, 1, 1,
-0.642107, -0.48014, -1.587519, 0, 0, 0, 1, 1,
-0.6414574, -0.3220639, -1.989664, 0, 0, 0, 1, 1,
-0.6413319, 0.01466992, -1.757769, 0, 0, 0, 1, 1,
-0.6387515, -0.4605532, -0.02406308, 0, 0, 0, 1, 1,
-0.6382111, -1.98758, -2.542268, 1, 1, 1, 1, 1,
-0.6327617, 0.7964979, -2.40777, 1, 1, 1, 1, 1,
-0.6301747, 0.9517488, 0.0658817, 1, 1, 1, 1, 1,
-0.6272752, -1.818439, -0.9928222, 1, 1, 1, 1, 1,
-0.6232309, 0.8431977, -3.920358, 1, 1, 1, 1, 1,
-0.6211171, 0.1382077, -0.843521, 1, 1, 1, 1, 1,
-0.621008, -0.876156, -2.023536, 1, 1, 1, 1, 1,
-0.6202961, 1.169541, -1.529243, 1, 1, 1, 1, 1,
-0.6174388, -0.5540453, -1.680818, 1, 1, 1, 1, 1,
-0.6131014, 2.160399, 1.437836, 1, 1, 1, 1, 1,
-0.6124949, 0.0768514, -0.8039172, 1, 1, 1, 1, 1,
-0.6107651, 0.001381989, -0.1835779, 1, 1, 1, 1, 1,
-0.6091092, 1.608201, 0.2106036, 1, 1, 1, 1, 1,
-0.5969554, 1.609753, -1.277763, 1, 1, 1, 1, 1,
-0.595836, 2.282226, 0.3667015, 1, 1, 1, 1, 1,
-0.5855755, 1.230051, 1.458135, 0, 0, 1, 1, 1,
-0.5831217, -0.6281114, -2.062542, 1, 0, 0, 1, 1,
-0.5737262, -0.6901445, -1.170087, 1, 0, 0, 1, 1,
-0.5676876, 1.110567, 0.3439871, 1, 0, 0, 1, 1,
-0.5622807, 0.7431567, -0.4598968, 1, 0, 0, 1, 1,
-0.5607343, -0.2365129, -1.048326, 1, 0, 0, 1, 1,
-0.5596368, -0.7334907, -3.644123, 0, 0, 0, 1, 1,
-0.5594719, -2.378713, -3.070321, 0, 0, 0, 1, 1,
-0.5518265, -0.2562437, -2.03174, 0, 0, 0, 1, 1,
-0.5459841, 0.1044435, -1.934204, 0, 0, 0, 1, 1,
-0.5438392, -0.0191657, -1.914828, 0, 0, 0, 1, 1,
-0.5434284, -0.05705008, -0.2182893, 0, 0, 0, 1, 1,
-0.5378881, 0.715714, -1.560428, 0, 0, 0, 1, 1,
-0.5323541, -0.9913691, -1.404114, 1, 1, 1, 1, 1,
-0.526092, -0.1199225, -3.73044, 1, 1, 1, 1, 1,
-0.525773, 1.012484, 0.2840794, 1, 1, 1, 1, 1,
-0.5237255, -0.4545335, -2.040415, 1, 1, 1, 1, 1,
-0.5162507, -1.136802, -1.423951, 1, 1, 1, 1, 1,
-0.5158913, -1.574262, -2.010506, 1, 1, 1, 1, 1,
-0.5133422, -0.1016701, -1.941521, 1, 1, 1, 1, 1,
-0.5130693, 0.8370804, -0.2938465, 1, 1, 1, 1, 1,
-0.5110044, -1.885902, -3.462377, 1, 1, 1, 1, 1,
-0.5087618, 0.2703296, -1.044439, 1, 1, 1, 1, 1,
-0.5073379, -0.4153794, -0.7082274, 1, 1, 1, 1, 1,
-0.5072293, -1.523887, -3.499143, 1, 1, 1, 1, 1,
-0.505894, 0.357028, -0.8213601, 1, 1, 1, 1, 1,
-0.5056518, -0.4344615, -1.661431, 1, 1, 1, 1, 1,
-0.5018726, 0.6626315, -0.2001278, 1, 1, 1, 1, 1,
-0.4957891, -0.6809155, -3.311393, 0, 0, 1, 1, 1,
-0.4918228, -0.6031561, -3.328325, 1, 0, 0, 1, 1,
-0.488885, -1.692981, -2.003997, 1, 0, 0, 1, 1,
-0.4870125, 0.1146132, -0.1891484, 1, 0, 0, 1, 1,
-0.4726736, -1.181082, -3.05734, 1, 0, 0, 1, 1,
-0.4717931, 0.1315631, -1.285578, 1, 0, 0, 1, 1,
-0.4708502, -0.6208261, -1.266499, 0, 0, 0, 1, 1,
-0.4698988, -1.348808, -3.982316, 0, 0, 0, 1, 1,
-0.4694994, 1.229172, -0.6603903, 0, 0, 0, 1, 1,
-0.4622924, -0.9018438, -2.376748, 0, 0, 0, 1, 1,
-0.4594939, -3.899212, -2.882126, 0, 0, 0, 1, 1,
-0.4578033, -0.961429, -3.605044, 0, 0, 0, 1, 1,
-0.4566683, 0.3500753, 0.3536297, 0, 0, 0, 1, 1,
-0.4553352, 0.1297447, -1.185452, 1, 1, 1, 1, 1,
-0.4540235, 0.08503445, -1.578554, 1, 1, 1, 1, 1,
-0.4528821, -0.803625, -1.836671, 1, 1, 1, 1, 1,
-0.4392802, 0.197086, -1.01231, 1, 1, 1, 1, 1,
-0.4307533, -0.453455, -2.575644, 1, 1, 1, 1, 1,
-0.4251305, -0.1694034, -0.9931535, 1, 1, 1, 1, 1,
-0.4165837, -0.1625083, -2.934269, 1, 1, 1, 1, 1,
-0.4144083, 0.1613989, -1.585881, 1, 1, 1, 1, 1,
-0.4139039, 0.6227447, 0.09183701, 1, 1, 1, 1, 1,
-0.4071366, 0.7120559, -1.240602, 1, 1, 1, 1, 1,
-0.4051338, 0.2014092, -2.041364, 1, 1, 1, 1, 1,
-0.4035386, -1.201915, -3.404716, 1, 1, 1, 1, 1,
-0.4029906, -1.049554, -2.450622, 1, 1, 1, 1, 1,
-0.4027051, -2.441371, -2.544575, 1, 1, 1, 1, 1,
-0.3959772, 0.655773, -1.271388, 1, 1, 1, 1, 1,
-0.3740036, 0.984056, 0.9735842, 0, 0, 1, 1, 1,
-0.3724717, -1.638866, -3.155483, 1, 0, 0, 1, 1,
-0.3681796, -0.03054749, -0.5872164, 1, 0, 0, 1, 1,
-0.3666515, 2.029344, -0.2593656, 1, 0, 0, 1, 1,
-0.3651213, -1.08568, -2.990394, 1, 0, 0, 1, 1,
-0.3645636, 0.7082254, -2.476488, 1, 0, 0, 1, 1,
-0.3536344, 0.1813391, -0.8977352, 0, 0, 0, 1, 1,
-0.3513468, -0.3139142, -1.374618, 0, 0, 0, 1, 1,
-0.3498082, 0.0153046, -1.640687, 0, 0, 0, 1, 1,
-0.3438973, 1.944838, -0.2039678, 0, 0, 0, 1, 1,
-0.3397028, -0.7641264, -2.214728, 0, 0, 0, 1, 1,
-0.3386106, 0.9128473, -0.6195968, 0, 0, 0, 1, 1,
-0.3381471, -0.5616409, -2.516269, 0, 0, 0, 1, 1,
-0.3370166, -0.77806, -1.849365, 1, 1, 1, 1, 1,
-0.3336891, 0.78057, -0.0777965, 1, 1, 1, 1, 1,
-0.3313534, -1.700059, -3.979462, 1, 1, 1, 1, 1,
-0.3269691, -0.4350483, -1.733094, 1, 1, 1, 1, 1,
-0.3255349, 0.7511755, 0.1423539, 1, 1, 1, 1, 1,
-0.3227554, -0.8183838, -3.567357, 1, 1, 1, 1, 1,
-0.3224743, 1.972338, -0.2155996, 1, 1, 1, 1, 1,
-0.320614, 1.921302, 0.1251037, 1, 1, 1, 1, 1,
-0.3202255, 0.5330228, -2.279897, 1, 1, 1, 1, 1,
-0.3160252, 0.2951916, -1.221043, 1, 1, 1, 1, 1,
-0.3133371, -0.9428794, -1.279978, 1, 1, 1, 1, 1,
-0.3108566, -0.4796085, -2.831559, 1, 1, 1, 1, 1,
-0.3105444, -0.1840748, -2.066323, 1, 1, 1, 1, 1,
-0.309073, 1.724824, -1.234893, 1, 1, 1, 1, 1,
-0.309011, 0.3026348, -0.2637921, 1, 1, 1, 1, 1,
-0.3083782, -0.5471891, -2.554722, 0, 0, 1, 1, 1,
-0.3083533, -1.830719, -2.348928, 1, 0, 0, 1, 1,
-0.3072275, 0.03421987, -1.921562, 1, 0, 0, 1, 1,
-0.3064398, 1.388034, -0.4155422, 1, 0, 0, 1, 1,
-0.3060487, 1.453019, -0.8788343, 1, 0, 0, 1, 1,
-0.3026778, -0.1910776, -2.082203, 1, 0, 0, 1, 1,
-0.2998825, 0.7775953, -0.7910775, 0, 0, 0, 1, 1,
-0.2994523, -0.5010307, -1.283875, 0, 0, 0, 1, 1,
-0.2992828, 0.01893193, -1.144398, 0, 0, 0, 1, 1,
-0.2985231, 0.7440799, -2.403872, 0, 0, 0, 1, 1,
-0.2980905, 1.259368, 0.7171764, 0, 0, 0, 1, 1,
-0.2976366, 1.596824, 0.4085265, 0, 0, 0, 1, 1,
-0.2972011, 1.14645, -1.06766, 0, 0, 0, 1, 1,
-0.2971205, -0.9519855, -2.322605, 1, 1, 1, 1, 1,
-0.29645, -0.3976724, -1.639118, 1, 1, 1, 1, 1,
-0.2942189, 1.305203, -1.530403, 1, 1, 1, 1, 1,
-0.291314, 2.461553, 0.475265, 1, 1, 1, 1, 1,
-0.2910819, 0.6626873, -0.6060193, 1, 1, 1, 1, 1,
-0.2904068, 1.071835, -0.12573, 1, 1, 1, 1, 1,
-0.285392, -0.7729172, -3.783632, 1, 1, 1, 1, 1,
-0.2831643, -0.5067325, -1.330454, 1, 1, 1, 1, 1,
-0.2773455, 0.5835457, -0.2859009, 1, 1, 1, 1, 1,
-0.2739996, -1.385988, -5.874446, 1, 1, 1, 1, 1,
-0.2713034, -1.415401, -2.719441, 1, 1, 1, 1, 1,
-0.2618939, -2.023262, -2.309272, 1, 1, 1, 1, 1,
-0.2594214, -0.2980963, -2.459194, 1, 1, 1, 1, 1,
-0.2588416, -0.05944496, -2.672459, 1, 1, 1, 1, 1,
-0.2547689, -1.268043, -2.253294, 1, 1, 1, 1, 1,
-0.2490526, -0.5547484, -1.765038, 0, 0, 1, 1, 1,
-0.2445307, 0.31924, -1.445347, 1, 0, 0, 1, 1,
-0.2442798, -1.493684, -3.228992, 1, 0, 0, 1, 1,
-0.2435672, 0.5731692, 0.8421542, 1, 0, 0, 1, 1,
-0.2434811, 0.7656166, -0.9938502, 1, 0, 0, 1, 1,
-0.2407611, 0.1485482, -0.8841644, 1, 0, 0, 1, 1,
-0.2403568, -0.8255948, -3.426398, 0, 0, 0, 1, 1,
-0.2360472, -0.620138, -1.932015, 0, 0, 0, 1, 1,
-0.2341053, -1.449713, -1.518354, 0, 0, 0, 1, 1,
-0.2270643, -0.05163989, -0.1342544, 0, 0, 0, 1, 1,
-0.2236938, -0.2408915, -3.096955, 0, 0, 0, 1, 1,
-0.2208315, 0.4012253, -0.7591047, 0, 0, 0, 1, 1,
-0.2130012, 0.2371617, -0.632603, 0, 0, 0, 1, 1,
-0.2129171, -0.1927488, -3.465377, 1, 1, 1, 1, 1,
-0.2068971, 0.3082014, -0.3041431, 1, 1, 1, 1, 1,
-0.205718, 0.2348457, -0.6593529, 1, 1, 1, 1, 1,
-0.2004463, -0.6442702, -4.581898, 1, 1, 1, 1, 1,
-0.199907, 0.2554274, -1.285185, 1, 1, 1, 1, 1,
-0.192028, -0.1995037, -2.81051, 1, 1, 1, 1, 1,
-0.1914361, 0.8544488, 0.7850516, 1, 1, 1, 1, 1,
-0.1882193, -1.294572, -1.744688, 1, 1, 1, 1, 1,
-0.183918, 0.7626641, -1.517262, 1, 1, 1, 1, 1,
-0.1833803, -1.280757, -2.145971, 1, 1, 1, 1, 1,
-0.174896, 1.656006, -2.143047, 1, 1, 1, 1, 1,
-0.1721465, 0.7829499, 0.05539112, 1, 1, 1, 1, 1,
-0.1717037, 1.032941, -0.762731, 1, 1, 1, 1, 1,
-0.1705881, -0.1112158, -1.24025, 1, 1, 1, 1, 1,
-0.1642269, 0.4824387, 0.4953718, 1, 1, 1, 1, 1,
-0.1628902, 0.6398349, -0.7697003, 0, 0, 1, 1, 1,
-0.1600113, 2.007664, 0.6143864, 1, 0, 0, 1, 1,
-0.1565389, -1.304502, -3.897448, 1, 0, 0, 1, 1,
-0.1515717, 0.6273144, 0.2026057, 1, 0, 0, 1, 1,
-0.1514567, 0.8378492, 0.11589, 1, 0, 0, 1, 1,
-0.151319, -2.748379, -4.914416, 1, 0, 0, 1, 1,
-0.1506089, 2.19918, -0.06796947, 0, 0, 0, 1, 1,
-0.1470097, 0.4555573, 0.6537527, 0, 0, 0, 1, 1,
-0.1465074, 0.1286367, -2.017804, 0, 0, 0, 1, 1,
-0.1357854, -1.288928, -3.728987, 0, 0, 0, 1, 1,
-0.1342145, 1.606657, -0.07166287, 0, 0, 0, 1, 1,
-0.1340052, 1.385989, 1.590347, 0, 0, 0, 1, 1,
-0.1337245, 0.7749463, -1.484502, 0, 0, 0, 1, 1,
-0.1303235, 1.948014, 0.002493187, 1, 1, 1, 1, 1,
-0.1277638, -1.605178, -3.805433, 1, 1, 1, 1, 1,
-0.1189676, -0.807391, -2.424319, 1, 1, 1, 1, 1,
-0.1187893, 0.7098192, 0.5053303, 1, 1, 1, 1, 1,
-0.1175537, 0.2451663, 0.6792818, 1, 1, 1, 1, 1,
-0.1092922, 0.5954333, 1.355189, 1, 1, 1, 1, 1,
-0.1080218, 1.095081, -1.085406, 1, 1, 1, 1, 1,
-0.1077158, -1.213553, -2.838889, 1, 1, 1, 1, 1,
-0.1055321, 0.3331795, 0.7173806, 1, 1, 1, 1, 1,
-0.1049572, 0.05571778, -1.850548, 1, 1, 1, 1, 1,
-0.103546, -0.1472257, -2.512003, 1, 1, 1, 1, 1,
-0.09490643, -0.6285183, -2.960371, 1, 1, 1, 1, 1,
-0.0929193, -0.7072663, -2.217571, 1, 1, 1, 1, 1,
-0.09224697, -1.268014, -3.069369, 1, 1, 1, 1, 1,
-0.09091651, -0.1290853, -0.7176863, 1, 1, 1, 1, 1,
-0.08754338, 1.166477, -0.3943918, 0, 0, 1, 1, 1,
-0.08127221, -0.8322371, -2.280634, 1, 0, 0, 1, 1,
-0.07745707, -1.15015, -4.216777, 1, 0, 0, 1, 1,
-0.07582732, 1.094432, -1.162909, 1, 0, 0, 1, 1,
-0.07439136, 1.03809, 0.4804864, 1, 0, 0, 1, 1,
-0.06624106, -0.006923561, -2.40114, 1, 0, 0, 1, 1,
-0.0659188, -0.3252926, -1.357541, 0, 0, 0, 1, 1,
-0.06141314, -0.6339341, -1.821932, 0, 0, 0, 1, 1,
-0.06110671, 0.002411769, -1.726405, 0, 0, 0, 1, 1,
-0.06051187, 0.03467082, -2.660795, 0, 0, 0, 1, 1,
-0.05514031, 0.2436998, 1.238547, 0, 0, 0, 1, 1,
-0.05276091, 0.8435319, 1.632068, 0, 0, 0, 1, 1,
-0.04537823, 0.634936, -0.2282197, 0, 0, 0, 1, 1,
-0.04363754, -1.638042, -2.565325, 1, 1, 1, 1, 1,
-0.03944619, -1.404343, -3.818356, 1, 1, 1, 1, 1,
-0.03684447, -1.746187, -3.564119, 1, 1, 1, 1, 1,
-0.03556594, 0.1347435, -0.1610865, 1, 1, 1, 1, 1,
-0.03258742, 0.02006673, -1.481596, 1, 1, 1, 1, 1,
-0.03169757, 0.6676259, 0.725141, 1, 1, 1, 1, 1,
-0.02954141, -0.5186534, -1.890453, 1, 1, 1, 1, 1,
-0.02743751, 1.280873, 1.36367, 1, 1, 1, 1, 1,
-0.02500238, 0.3875816, -0.2884806, 1, 1, 1, 1, 1,
-0.02025492, -0.055503, -2.87998, 1, 1, 1, 1, 1,
-0.0194106, 1.274739, 0.4654917, 1, 1, 1, 1, 1,
-0.01823982, 0.04643136, -2.38602, 1, 1, 1, 1, 1,
-0.009565129, 1.616026, 0.9266922, 1, 1, 1, 1, 1,
-0.008167206, -0.3564164, -4.189653, 1, 1, 1, 1, 1,
-0.007396676, -0.07614878, -2.297374, 1, 1, 1, 1, 1,
-0.006061159, 1.315361, -0.7514789, 0, 0, 1, 1, 1,
0.0002802139, 1.456348, -0.6489395, 1, 0, 0, 1, 1,
0.001525101, -0.01562047, 2.889028, 1, 0, 0, 1, 1,
0.004010515, -1.432713, 3.904538, 1, 0, 0, 1, 1,
0.007664832, 0.01902183, -0.3959955, 1, 0, 0, 1, 1,
0.01187, 1.066565, -1.331557, 1, 0, 0, 1, 1,
0.01509936, 1.215136, -0.674874, 0, 0, 0, 1, 1,
0.0162364, -0.9177325, 3.131029, 0, 0, 0, 1, 1,
0.02119674, 0.299272, 0.6233903, 0, 0, 0, 1, 1,
0.02179667, 0.06721017, 0.4408013, 0, 0, 0, 1, 1,
0.02211855, -0.7184952, 3.384977, 0, 0, 0, 1, 1,
0.0241198, -1.464023, 2.991856, 0, 0, 0, 1, 1,
0.02908073, 1.319773, 0.5005792, 0, 0, 0, 1, 1,
0.03048837, -1.033678, 2.310317, 1, 1, 1, 1, 1,
0.03400838, 0.163636, 0.5796885, 1, 1, 1, 1, 1,
0.03495369, -0.5459645, 2.482429, 1, 1, 1, 1, 1,
0.03869637, -0.4578447, 3.978816, 1, 1, 1, 1, 1,
0.03993469, -0.8782268, 3.09888, 1, 1, 1, 1, 1,
0.0402225, -0.7279873, 3.486737, 1, 1, 1, 1, 1,
0.04099781, 0.4746938, -1.170784, 1, 1, 1, 1, 1,
0.04425596, 0.1646433, -2.229911, 1, 1, 1, 1, 1,
0.04465615, -0.5837708, 2.842529, 1, 1, 1, 1, 1,
0.04620311, -0.5639518, 3.812288, 1, 1, 1, 1, 1,
0.04840565, -0.4064628, 3.804569, 1, 1, 1, 1, 1,
0.06260339, 1.073961, 0.3449113, 1, 1, 1, 1, 1,
0.06679735, -0.9924059, 2.673252, 1, 1, 1, 1, 1,
0.06862436, -1.58813, 1.901345, 1, 1, 1, 1, 1,
0.06867553, 1.675828, 0.8672276, 1, 1, 1, 1, 1,
0.07036974, 0.4575585, 1.149381, 0, 0, 1, 1, 1,
0.07064359, 2.669467, -1.922178, 1, 0, 0, 1, 1,
0.07116035, 0.7532247, -0.6861587, 1, 0, 0, 1, 1,
0.07335109, -0.01346803, 1.544222, 1, 0, 0, 1, 1,
0.07525075, -0.5980679, 4.243986, 1, 0, 0, 1, 1,
0.07609998, -0.963539, 2.774804, 1, 0, 0, 1, 1,
0.07989638, 0.4117909, -0.5973338, 0, 0, 0, 1, 1,
0.08145832, 0.8502354, 1.21718, 0, 0, 0, 1, 1,
0.08242351, 0.8929741, 2.611423, 0, 0, 0, 1, 1,
0.08669684, 2.168156, -0.06144718, 0, 0, 0, 1, 1,
0.09017976, 0.8491313, -0.1483975, 0, 0, 0, 1, 1,
0.09147454, -1.643814, 3.363163, 0, 0, 0, 1, 1,
0.09334575, -0.7533533, 2.144983, 0, 0, 0, 1, 1,
0.0951351, -0.4229822, 3.674583, 1, 1, 1, 1, 1,
0.09785604, -0.5798234, 2.766292, 1, 1, 1, 1, 1,
0.09873229, 1.079537, -0.09949817, 1, 1, 1, 1, 1,
0.09919479, 1.149893, -0.05163971, 1, 1, 1, 1, 1,
0.1002958, 1.053661, 2.842084, 1, 1, 1, 1, 1,
0.1032331, 0.5551035, 0.09290092, 1, 1, 1, 1, 1,
0.1036623, 0.4409984, -1.024026, 1, 1, 1, 1, 1,
0.1037735, 0.6011568, 2.715363, 1, 1, 1, 1, 1,
0.1065756, -0.4055997, 4.560678, 1, 1, 1, 1, 1,
0.1093036, 1.278483, 0.4325346, 1, 1, 1, 1, 1,
0.1118383, 1.387062, -0.05409281, 1, 1, 1, 1, 1,
0.1120691, -1.560492, 3.6254, 1, 1, 1, 1, 1,
0.1146734, -1.629879, 3.554063, 1, 1, 1, 1, 1,
0.1168262, 2.56836, -0.1178014, 1, 1, 1, 1, 1,
0.1192813, 1.366798, -0.8096128, 1, 1, 1, 1, 1,
0.1196474, 0.7026672, -0.882808, 0, 0, 1, 1, 1,
0.1234987, -1.382276, 2.811705, 1, 0, 0, 1, 1,
0.1287418, 1.444861, 0.04720563, 1, 0, 0, 1, 1,
0.13408, -0.196428, 1.536437, 1, 0, 0, 1, 1,
0.1402701, 0.5619465, -2.045839, 1, 0, 0, 1, 1,
0.1440181, 0.1298355, 1.651088, 1, 0, 0, 1, 1,
0.1463319, -0.9271902, 3.761776, 0, 0, 0, 1, 1,
0.1467207, 1.28229, 1.677654, 0, 0, 0, 1, 1,
0.1502995, 8.100809e-05, 1.734302, 0, 0, 0, 1, 1,
0.1541138, -0.2064585, 2.33564, 0, 0, 0, 1, 1,
0.1541258, 0.5986818, 0.6314959, 0, 0, 0, 1, 1,
0.1567911, -1.151626, 3.170905, 0, 0, 0, 1, 1,
0.1608526, 0.6928287, 0.2967857, 0, 0, 0, 1, 1,
0.1648796, 0.5859402, 0.5250387, 1, 1, 1, 1, 1,
0.1690525, 0.129507, 0.3808552, 1, 1, 1, 1, 1,
0.1691797, -0.8451265, 3.670562, 1, 1, 1, 1, 1,
0.1716818, -0.8044835, 1.664218, 1, 1, 1, 1, 1,
0.1746918, 0.7991312, -0.5788954, 1, 1, 1, 1, 1,
0.1748796, 0.2244666, 1.085784, 1, 1, 1, 1, 1,
0.1756321, -1.653417, 3.044805, 1, 1, 1, 1, 1,
0.17702, -0.5311645, 3.114544, 1, 1, 1, 1, 1,
0.1785038, -2.168702, 2.688886, 1, 1, 1, 1, 1,
0.1796665, 0.2786705, 0.5162506, 1, 1, 1, 1, 1,
0.1824064, -0.05608817, 3.129496, 1, 1, 1, 1, 1,
0.1830685, -0.395515, 3.513581, 1, 1, 1, 1, 1,
0.1931362, 0.8548594, 1.447826, 1, 1, 1, 1, 1,
0.1944145, -1.203882, 2.794948, 1, 1, 1, 1, 1,
0.1989484, -0.8939846, 4.189693, 1, 1, 1, 1, 1,
0.1999866, 0.8497735, -0.6725464, 0, 0, 1, 1, 1,
0.2003406, 1.90851, -0.9038981, 1, 0, 0, 1, 1,
0.2004726, -1.255798, 2.957952, 1, 0, 0, 1, 1,
0.2009877, -0.314372, 3.08864, 1, 0, 0, 1, 1,
0.2046787, 0.03669943, 0.5578086, 1, 0, 0, 1, 1,
0.2136655, -0.767653, 5.022556, 1, 0, 0, 1, 1,
0.220888, 1.863291, 1.057928, 0, 0, 0, 1, 1,
0.2231048, -0.2151187, 3.69065, 0, 0, 0, 1, 1,
0.2290174, -0.6842867, 4.058966, 0, 0, 0, 1, 1,
0.2404193, 0.124687, 1.173965, 0, 0, 0, 1, 1,
0.2436894, -0.01840712, 2.050066, 0, 0, 0, 1, 1,
0.2454954, 0.01177923, 1.499829, 0, 0, 0, 1, 1,
0.246668, 0.2820885, 1.235377, 0, 0, 0, 1, 1,
0.254055, -0.5026674, 2.456239, 1, 1, 1, 1, 1,
0.2579762, -0.9555038, 2.762441, 1, 1, 1, 1, 1,
0.2590679, 1.404064, 0.3665974, 1, 1, 1, 1, 1,
0.2627873, -0.9890742, 4.067091, 1, 1, 1, 1, 1,
0.2631415, -0.1835546, 1.263726, 1, 1, 1, 1, 1,
0.2652837, 0.01521432, 0.4685422, 1, 1, 1, 1, 1,
0.2655619, -0.159988, 0.8907707, 1, 1, 1, 1, 1,
0.2657923, -0.2718245, 2.578321, 1, 1, 1, 1, 1,
0.2669977, -1.372864, 3.985069, 1, 1, 1, 1, 1,
0.2684846, 0.5156907, 0.05835679, 1, 1, 1, 1, 1,
0.2769123, -2.153097, 3.496016, 1, 1, 1, 1, 1,
0.2778799, -1.322734, 2.932637, 1, 1, 1, 1, 1,
0.2781217, -1.414327, 4.069034, 1, 1, 1, 1, 1,
0.2783343, -1.665704, 1.991415, 1, 1, 1, 1, 1,
0.2796493, 0.08995359, 3.027779, 1, 1, 1, 1, 1,
0.2849458, -0.6871488, 2.193301, 0, 0, 1, 1, 1,
0.2852871, -0.4390213, 3.438721, 1, 0, 0, 1, 1,
0.2860657, -1.325384, 3.519575, 1, 0, 0, 1, 1,
0.2874922, 0.4492038, 0.7158208, 1, 0, 0, 1, 1,
0.2881492, 0.03867228, 0.2885806, 1, 0, 0, 1, 1,
0.2906996, 0.4551458, 1.393042, 1, 0, 0, 1, 1,
0.2907428, 0.4368606, 2.136901, 0, 0, 0, 1, 1,
0.2935935, -0.423065, 0.7101067, 0, 0, 0, 1, 1,
0.3009413, 0.2178231, 1.517684, 0, 0, 0, 1, 1,
0.301482, -1.213045, 2.406587, 0, 0, 0, 1, 1,
0.3025596, 0.611928, 1.569623, 0, 0, 0, 1, 1,
0.3044815, -2.630126, 3.13916, 0, 0, 0, 1, 1,
0.3050108, -0.2041313, 2.367404, 0, 0, 0, 1, 1,
0.3062795, 0.9494098, 0.3614431, 1, 1, 1, 1, 1,
0.3070228, -0.7413862, 5.195657, 1, 1, 1, 1, 1,
0.3080181, 1.033214, 1.267677, 1, 1, 1, 1, 1,
0.3154968, -2.495076, 4.728029, 1, 1, 1, 1, 1,
0.3244489, -1.899569, 3.80295, 1, 1, 1, 1, 1,
0.3288524, 0.4671619, -0.2436373, 1, 1, 1, 1, 1,
0.3289191, -1.724323, 4.331163, 1, 1, 1, 1, 1,
0.3333063, -1.237893, 3.350242, 1, 1, 1, 1, 1,
0.3364675, -0.5012515, 3.410233, 1, 1, 1, 1, 1,
0.3374648, -1.475856, 2.691664, 1, 1, 1, 1, 1,
0.3464862, 1.425452, -1.190494, 1, 1, 1, 1, 1,
0.3468497, -0.7224251, 2.683066, 1, 1, 1, 1, 1,
0.3473222, 1.950141, -0.6215643, 1, 1, 1, 1, 1,
0.3478427, 0.5450767, -0.6443252, 1, 1, 1, 1, 1,
0.349296, 1.088844, 0.1203839, 1, 1, 1, 1, 1,
0.3534489, 0.04335118, 0.000104608, 0, 0, 1, 1, 1,
0.3558989, -0.9187062, 2.985086, 1, 0, 0, 1, 1,
0.3580549, 1.223546, -1.167211, 1, 0, 0, 1, 1,
0.363265, -1.201681, 2.923604, 1, 0, 0, 1, 1,
0.3639461, -1.302263, 4.212135, 1, 0, 0, 1, 1,
0.3643078, 0.4206276, 0.7268112, 1, 0, 0, 1, 1,
0.3656621, 1.689834, 0.4034329, 0, 0, 0, 1, 1,
0.3661679, 0.8889535, -0.6987665, 0, 0, 0, 1, 1,
0.3678674, 0.1652366, 1.512021, 0, 0, 0, 1, 1,
0.3693562, 0.5755526, -1.505619, 0, 0, 0, 1, 1,
0.3708917, -0.524878, 4.799909, 0, 0, 0, 1, 1,
0.3764693, 0.3102703, 1.095557, 0, 0, 0, 1, 1,
0.3779899, -0.2960882, 2.136842, 0, 0, 0, 1, 1,
0.3818418, 0.5247811, 0.5207271, 1, 1, 1, 1, 1,
0.3824763, -1.443537, 3.668398, 1, 1, 1, 1, 1,
0.3852629, -1.040996, 2.025042, 1, 1, 1, 1, 1,
0.3868928, -0.2971557, 1.315913, 1, 1, 1, 1, 1,
0.3883414, 0.05302742, 3.277521, 1, 1, 1, 1, 1,
0.3999327, 0.886651, 0.6332975, 1, 1, 1, 1, 1,
0.4007126, 0.2117375, 1.857196, 1, 1, 1, 1, 1,
0.4008042, 0.8751875, -0.7147292, 1, 1, 1, 1, 1,
0.407171, -0.0872177, 2.281653, 1, 1, 1, 1, 1,
0.4073372, -1.64586, 3.9519, 1, 1, 1, 1, 1,
0.4083841, -0.7940549, 3.509312, 1, 1, 1, 1, 1,
0.4094803, -1.690939, 2.274266, 1, 1, 1, 1, 1,
0.4097248, 0.3293956, 0.3259664, 1, 1, 1, 1, 1,
0.4176389, 0.204756, 0.4030027, 1, 1, 1, 1, 1,
0.4293049, -0.597097, 1.849963, 1, 1, 1, 1, 1,
0.4306713, -1.79646, 2.832731, 0, 0, 1, 1, 1,
0.4310465, -0.1674528, 2.688372, 1, 0, 0, 1, 1,
0.4403316, 1.129113, -0.365959, 1, 0, 0, 1, 1,
0.4410257, 1.352604, 0.3409313, 1, 0, 0, 1, 1,
0.4481518, 2.776472, 0.2577314, 1, 0, 0, 1, 1,
0.4503502, 0.9664171, 0.4485011, 1, 0, 0, 1, 1,
0.463075, 1.831784, -1.918559, 0, 0, 0, 1, 1,
0.4637044, -1.920064, 3.346552, 0, 0, 0, 1, 1,
0.470048, 1.066777, 1.491017, 0, 0, 0, 1, 1,
0.4707434, 0.2395249, 0.4833305, 0, 0, 0, 1, 1,
0.4736314, -0.7716656, 1.589082, 0, 0, 0, 1, 1,
0.4746111, -1.73608, 4.487706, 0, 0, 0, 1, 1,
0.476557, -1.268721, 5.217847, 0, 0, 0, 1, 1,
0.4787665, -0.6310061, 3.654189, 1, 1, 1, 1, 1,
0.4828639, -0.1011794, 2.873895, 1, 1, 1, 1, 1,
0.4847367, 0.9716721, -1.306324, 1, 1, 1, 1, 1,
0.4847891, 1.00635, 0.5158541, 1, 1, 1, 1, 1,
0.4859188, 1.849043, 1.523449, 1, 1, 1, 1, 1,
0.4880803, -1.136418, 3.189569, 1, 1, 1, 1, 1,
0.48919, -1.000441, 2.916559, 1, 1, 1, 1, 1,
0.4907871, 0.3463897, 2.630187, 1, 1, 1, 1, 1,
0.4944233, -1.203165, 2.369545, 1, 1, 1, 1, 1,
0.4944995, -0.831661, 0.8230463, 1, 1, 1, 1, 1,
0.5078983, 0.8436456, 0.2670346, 1, 1, 1, 1, 1,
0.508674, 0.5473062, 0.08738722, 1, 1, 1, 1, 1,
0.5101837, -0.8600746, 4.580665, 1, 1, 1, 1, 1,
0.5124381, 0.09563818, 0.9199428, 1, 1, 1, 1, 1,
0.5185214, 0.02152878, 1.872356, 1, 1, 1, 1, 1,
0.5276173, 0.9026135, 2.698997, 0, 0, 1, 1, 1,
0.5339103, -1.193879, 3.339339, 1, 0, 0, 1, 1,
0.5378249, 0.9108567, 0.1367954, 1, 0, 0, 1, 1,
0.5384752, -1.141867, 2.170089, 1, 0, 0, 1, 1,
0.5399497, 0.4072714, 0.1407322, 1, 0, 0, 1, 1,
0.5430312, 0.8432518, -0.5521275, 1, 0, 0, 1, 1,
0.5492582, -0.5494301, 2.329239, 0, 0, 0, 1, 1,
0.5507858, -0.04539253, 0.9215434, 0, 0, 0, 1, 1,
0.551599, -0.1837246, 2.193652, 0, 0, 0, 1, 1,
0.5532357, 1.439656, 1.361582, 0, 0, 0, 1, 1,
0.5558501, 0.4446065, 3.021746, 0, 0, 0, 1, 1,
0.5623831, -0.5657515, 3.415326, 0, 0, 0, 1, 1,
0.5665517, -1.044046, 4.251493, 0, 0, 0, 1, 1,
0.5673746, -1.412319, 3.547036, 1, 1, 1, 1, 1,
0.5747225, 1.00402, -0.133765, 1, 1, 1, 1, 1,
0.5757332, 1.385659, -0.08634677, 1, 1, 1, 1, 1,
0.5797383, 1.293189, -0.5227861, 1, 1, 1, 1, 1,
0.5805113, -1.525687, 2.182263, 1, 1, 1, 1, 1,
0.581381, -1.480111, 2.221078, 1, 1, 1, 1, 1,
0.5816947, 0.2436065, 1.535742, 1, 1, 1, 1, 1,
0.5828337, 0.9795657, 1.717312, 1, 1, 1, 1, 1,
0.5861316, 1.995739, 1.211827, 1, 1, 1, 1, 1,
0.5869144, 0.3608282, 1.818085, 1, 1, 1, 1, 1,
0.5869721, 0.66023, 0.818206, 1, 1, 1, 1, 1,
0.592692, -0.4720887, 1.318667, 1, 1, 1, 1, 1,
0.5940306, 0.6115752, 0.5113091, 1, 1, 1, 1, 1,
0.5970469, 1.604146, 0.07848533, 1, 1, 1, 1, 1,
0.6048319, -0.6492984, 2.641649, 1, 1, 1, 1, 1,
0.6077474, 0.09945069, 1.384244, 0, 0, 1, 1, 1,
0.6087966, -0.07361116, 2.284157, 1, 0, 0, 1, 1,
0.6095988, -1.2056, 2.042792, 1, 0, 0, 1, 1,
0.6120729, 1.14501, -0.3326064, 1, 0, 0, 1, 1,
0.6127687, -1.170551, 3.015514, 1, 0, 0, 1, 1,
0.615227, 0.544345, 1.338661, 1, 0, 0, 1, 1,
0.6167277, 0.75129, 2.175883, 0, 0, 0, 1, 1,
0.6170102, -1.665346, 2.708188, 0, 0, 0, 1, 1,
0.6185851, -0.3242808, 3.405933, 0, 0, 0, 1, 1,
0.6239811, -1.072316, 2.508965, 0, 0, 0, 1, 1,
0.6240932, -0.645743, 1.767535, 0, 0, 0, 1, 1,
0.6278536, 1.284974, 1.222048, 0, 0, 0, 1, 1,
0.6291398, -0.5817922, 0.1732618, 0, 0, 0, 1, 1,
0.6305852, 0.04665683, 2.528523, 1, 1, 1, 1, 1,
0.6319653, 0.7077418, 0.4496071, 1, 1, 1, 1, 1,
0.6334611, 1.103759, 1.357001, 1, 1, 1, 1, 1,
0.6340177, 1.400687, 0.4592267, 1, 1, 1, 1, 1,
0.6361545, -0.3270555, 2.173814, 1, 1, 1, 1, 1,
0.6472121, -2.251943, 1.556231, 1, 1, 1, 1, 1,
0.6506279, 1.197656, -0.7314997, 1, 1, 1, 1, 1,
0.6515224, -0.8237106, 3.622775, 1, 1, 1, 1, 1,
0.6687974, 0.6225517, 2.283221, 1, 1, 1, 1, 1,
0.670751, -1.183439, 1.4256, 1, 1, 1, 1, 1,
0.6734092, 1.321106, 0.2599391, 1, 1, 1, 1, 1,
0.6745749, 1.060658, 1.95188, 1, 1, 1, 1, 1,
0.675273, 0.7073333, 1.711844, 1, 1, 1, 1, 1,
0.6773276, -1.396286, 3.085426, 1, 1, 1, 1, 1,
0.6819513, -0.8868911, 2.27069, 1, 1, 1, 1, 1,
0.6820876, -0.6877643, 2.087517, 0, 0, 1, 1, 1,
0.6823922, -0.3087999, 0.9961118, 1, 0, 0, 1, 1,
0.6918068, 0.05214612, 0.5416845, 1, 0, 0, 1, 1,
0.6932489, 2.312999, -0.2785705, 1, 0, 0, 1, 1,
0.7011329, 0.1892763, 0.8337863, 1, 0, 0, 1, 1,
0.702898, -0.2512908, 0.6836411, 1, 0, 0, 1, 1,
0.7197344, -1.027773, 2.820458, 0, 0, 0, 1, 1,
0.7231589, 0.6325938, 1.004408, 0, 0, 0, 1, 1,
0.7244059, 1.426939, 1.02716, 0, 0, 0, 1, 1,
0.7307208, 0.1398446, -1.123195, 0, 0, 0, 1, 1,
0.7332419, -0.5372396, 1.282295, 0, 0, 0, 1, 1,
0.7355698, -0.4707396, 1.859388, 0, 0, 0, 1, 1,
0.7409657, 0.2631094, -0.7279661, 0, 0, 0, 1, 1,
0.7428387, -0.8303851, 1.184486, 1, 1, 1, 1, 1,
0.7497089, -1.33645, 3.330365, 1, 1, 1, 1, 1,
0.7572743, 1.396441, 0.6706708, 1, 1, 1, 1, 1,
0.7582717, 0.8901426, 1.025113, 1, 1, 1, 1, 1,
0.7601916, -0.3713052, 3.347218, 1, 1, 1, 1, 1,
0.7641327, 0.2610645, 2.326019, 1, 1, 1, 1, 1,
0.7649693, 2.098299, 1.177362, 1, 1, 1, 1, 1,
0.7683496, 0.9027026, 1.330662, 1, 1, 1, 1, 1,
0.7704433, 0.915559, 2.344696, 1, 1, 1, 1, 1,
0.7705769, -1.288241, 3.22332, 1, 1, 1, 1, 1,
0.7709349, 0.159814, 2.83984, 1, 1, 1, 1, 1,
0.773065, -0.4858897, 1.959433, 1, 1, 1, 1, 1,
0.776477, -0.3070201, 2.329628, 1, 1, 1, 1, 1,
0.7771548, 0.1766959, 1.341682, 1, 1, 1, 1, 1,
0.7805912, 1.16928, 2.152953, 1, 1, 1, 1, 1,
0.7846359, 0.6874719, 0.7421048, 0, 0, 1, 1, 1,
0.7903669, -0.3761601, 1.899359, 1, 0, 0, 1, 1,
0.7910938, 0.2041451, 2.764031, 1, 0, 0, 1, 1,
0.8000224, -0.3908292, 1.860509, 1, 0, 0, 1, 1,
0.8000348, -0.62291, 2.58137, 1, 0, 0, 1, 1,
0.8010199, -0.3880567, 1.343086, 1, 0, 0, 1, 1,
0.8082592, 0.6966537, 0.7697968, 0, 0, 0, 1, 1,
0.8098133, -0.6607228, 1.439977, 0, 0, 0, 1, 1,
0.8130813, 0.6190194, -0.1737617, 0, 0, 0, 1, 1,
0.8200318, 0.5232679, 1.261205, 0, 0, 0, 1, 1,
0.8219784, -0.333097, 2.049136, 0, 0, 0, 1, 1,
0.8258892, -0.6170164, 2.012789, 0, 0, 0, 1, 1,
0.8268811, -0.3373401, 3.027811, 0, 0, 0, 1, 1,
0.8277193, 0.5818169, 1.264025, 1, 1, 1, 1, 1,
0.8490726, 0.2278032, 1.870039, 1, 1, 1, 1, 1,
0.8511438, -0.0698835, 0.8470772, 1, 1, 1, 1, 1,
0.853673, -1.041252, 2.754387, 1, 1, 1, 1, 1,
0.8649639, 0.4060831, 0.2535478, 1, 1, 1, 1, 1,
0.8662742, -0.1204428, 0.4408594, 1, 1, 1, 1, 1,
0.8678056, 0.7319039, 1.292946, 1, 1, 1, 1, 1,
0.8715561, 1.774983, 1.917819, 1, 1, 1, 1, 1,
0.8716933, -0.5073442, 3.587707, 1, 1, 1, 1, 1,
0.876393, 0.8452191, 0.06121991, 1, 1, 1, 1, 1,
0.881654, 0.3435288, 0.4227551, 1, 1, 1, 1, 1,
0.8872836, -1.79716, 2.941922, 1, 1, 1, 1, 1,
0.8938013, -0.626828, 2.826599, 1, 1, 1, 1, 1,
0.8962064, 1.452556, -0.4225935, 1, 1, 1, 1, 1,
0.8975489, -0.5835888, -1.232087, 1, 1, 1, 1, 1,
0.8993664, 0.5847144, 2.206506, 0, 0, 1, 1, 1,
0.9006124, -0.03009316, 1.655478, 1, 0, 0, 1, 1,
0.9009582, 0.2535025, -0.04310208, 1, 0, 0, 1, 1,
0.9013172, -0.4834287, 0.5917975, 1, 0, 0, 1, 1,
0.9015954, 1.6477, 2.023967, 1, 0, 0, 1, 1,
0.9019427, 0.01876787, 2.871504, 1, 0, 0, 1, 1,
0.9079054, 1.989502, 1.616361, 0, 0, 0, 1, 1,
0.9104164, 0.05918974, 0.5354826, 0, 0, 0, 1, 1,
0.9110314, -0.1772798, 2.157395, 0, 0, 0, 1, 1,
0.9129688, 0.09131905, 1.082608, 0, 0, 0, 1, 1,
0.9179263, 0.9924659, 0.3112996, 0, 0, 0, 1, 1,
0.920976, 0.8716678, 0.8015818, 0, 0, 0, 1, 1,
0.9251157, 0.4951159, 1.595604, 0, 0, 0, 1, 1,
0.9259583, 0.5770379, 1.01002, 1, 1, 1, 1, 1,
0.9263958, -1.010965, 3.222608, 1, 1, 1, 1, 1,
0.9271193, 0.8902809, 1.242221, 1, 1, 1, 1, 1,
0.9300713, 0.0242865, 2.289801, 1, 1, 1, 1, 1,
0.9304523, -0.3370564, 0.8644228, 1, 1, 1, 1, 1,
0.9495997, 1.266916, -0.3026623, 1, 1, 1, 1, 1,
0.951097, -0.1562895, 3.172377, 1, 1, 1, 1, 1,
0.9563237, 1.073853, 0.7422475, 1, 1, 1, 1, 1,
0.9566041, -0.07475342, 0.05975363, 1, 1, 1, 1, 1,
0.9668413, 1.33301, 0.2350267, 1, 1, 1, 1, 1,
0.9669093, 0.2972741, 0.477576, 1, 1, 1, 1, 1,
0.9723778, 0.2247801, 0.2472969, 1, 1, 1, 1, 1,
0.9747729, -1.451341, 2.780042, 1, 1, 1, 1, 1,
0.975199, 0.887758, 1.598604, 1, 1, 1, 1, 1,
0.9760577, -0.3428819, 2.185278, 1, 1, 1, 1, 1,
0.9894902, -0.7664598, 0.9329284, 0, 0, 1, 1, 1,
0.9928021, 0.7868568, -1.999701, 1, 0, 0, 1, 1,
0.9936398, 0.1052893, 1.987829, 1, 0, 0, 1, 1,
0.9959127, -0.7196496, 2.350538, 1, 0, 0, 1, 1,
0.9999999, -0.2062511, 2.925946, 1, 0, 0, 1, 1,
1.001464, -0.281184, 2.062279, 1, 0, 0, 1, 1,
1.009524, 0.4254765, 2.103922, 0, 0, 0, 1, 1,
1.019685, 1.192086, 1.372756, 0, 0, 0, 1, 1,
1.028036, 1.115154, -0.3515367, 0, 0, 0, 1, 1,
1.03319, -0.2865228, 2.370257, 0, 0, 0, 1, 1,
1.035126, -0.08759154, 1.25787, 0, 0, 0, 1, 1,
1.048863, 0.02155082, -0.3635244, 0, 0, 0, 1, 1,
1.050733, 0.03222441, 1.88584, 0, 0, 0, 1, 1,
1.059064, -1.156779, 0.1843147, 1, 1, 1, 1, 1,
1.067676, 0.1708063, 0.5009996, 1, 1, 1, 1, 1,
1.071307, -0.7717326, 2.70601, 1, 1, 1, 1, 1,
1.076575, 1.545594, -0.02855163, 1, 1, 1, 1, 1,
1.082673, -0.4198551, 1.064908, 1, 1, 1, 1, 1,
1.082964, 0.660606, 1.394413, 1, 1, 1, 1, 1,
1.084786, -0.006828175, 0.8410227, 1, 1, 1, 1, 1,
1.086984, 1.212402, 0.4644353, 1, 1, 1, 1, 1,
1.089816, -0.708774, 1.974853, 1, 1, 1, 1, 1,
1.095818, -0.9028812, 0.4425076, 1, 1, 1, 1, 1,
1.099282, -0.2118901, -1.347274, 1, 1, 1, 1, 1,
1.100419, 0.1833653, 2.255599, 1, 1, 1, 1, 1,
1.104529, -0.8978689, 3.032587, 1, 1, 1, 1, 1,
1.10499, -1.757015, 2.173177, 1, 1, 1, 1, 1,
1.10549, -1.410277, 1.325815, 1, 1, 1, 1, 1,
1.106433, 0.09545968, 3.126661, 0, 0, 1, 1, 1,
1.110043, 1.4992, 0.72162, 1, 0, 0, 1, 1,
1.111793, 1.311512, 1.943612, 1, 0, 0, 1, 1,
1.119543, -0.8878675, 0.8973707, 1, 0, 0, 1, 1,
1.122179, -1.517863, 1.898247, 1, 0, 0, 1, 1,
1.122426, 0.09050077, 1.633132, 1, 0, 0, 1, 1,
1.129046, -0.1118319, 2.306605, 0, 0, 0, 1, 1,
1.137946, 0.7079702, 1.952243, 0, 0, 0, 1, 1,
1.141602, 0.3471657, 2.783866, 0, 0, 0, 1, 1,
1.142688, -1.600428, 2.564965, 0, 0, 0, 1, 1,
1.14402, -0.7507267, 2.025224, 0, 0, 0, 1, 1,
1.144883, 0.7831092, 0.6867968, 0, 0, 0, 1, 1,
1.146587, 0.07295526, -0.7130623, 0, 0, 0, 1, 1,
1.146876, -0.6374897, 1.859939, 1, 1, 1, 1, 1,
1.15, -1.6525, 0.8078797, 1, 1, 1, 1, 1,
1.150563, -1.678403, 3.085716, 1, 1, 1, 1, 1,
1.163757, 0.1784561, 2.390742, 1, 1, 1, 1, 1,
1.166069, -1.286523, 2.772733, 1, 1, 1, 1, 1,
1.1673, -1.00257, 2.599078, 1, 1, 1, 1, 1,
1.169938, 0.07536078, 0.6465632, 1, 1, 1, 1, 1,
1.17533, 0.2440195, -0.1798984, 1, 1, 1, 1, 1,
1.177628, 0.9290859, 0.490215, 1, 1, 1, 1, 1,
1.178366, -1.087895, 2.695623, 1, 1, 1, 1, 1,
1.181399, -0.02540586, 2.645332, 1, 1, 1, 1, 1,
1.189747, 0.5506381, 1.15478, 1, 1, 1, 1, 1,
1.189847, 0.3534805, 0.1868664, 1, 1, 1, 1, 1,
1.197571, -0.4140376, 0.7793685, 1, 1, 1, 1, 1,
1.199699, -0.3775378, 2.674422, 1, 1, 1, 1, 1,
1.213165, -0.492661, 0.1540156, 0, 0, 1, 1, 1,
1.215591, 1.393501, 1.324271, 1, 0, 0, 1, 1,
1.223758, -1.117451, 1.130501, 1, 0, 0, 1, 1,
1.227975, -2.017598, 1.722153, 1, 0, 0, 1, 1,
1.234175, -0.4156428, 1.131736, 1, 0, 0, 1, 1,
1.236625, 0.6110258, -0.6377464, 1, 0, 0, 1, 1,
1.254272, 0.06872802, 2.45972, 0, 0, 0, 1, 1,
1.255566, -1.80341, 2.162062, 0, 0, 0, 1, 1,
1.25832, 0.8661538, 1.187958, 0, 0, 0, 1, 1,
1.262165, -0.8132038, 0.6268701, 0, 0, 0, 1, 1,
1.272178, 0.1033924, 2.773771, 0, 0, 0, 1, 1,
1.276005, -0.4739832, 0.4047842, 0, 0, 0, 1, 1,
1.278929, -0.3919693, 2.314943, 0, 0, 0, 1, 1,
1.279307, 1.276294, 0.637337, 1, 1, 1, 1, 1,
1.282042, -1.075143, 4.224277, 1, 1, 1, 1, 1,
1.282955, 0.7986647, 2.212933, 1, 1, 1, 1, 1,
1.288022, 0.3350683, 1.133654, 1, 1, 1, 1, 1,
1.289796, 0.2569447, 1.447809, 1, 1, 1, 1, 1,
1.302284, 0.9164524, 1.599198, 1, 1, 1, 1, 1,
1.306427, -0.3588938, 1.854974, 1, 1, 1, 1, 1,
1.310249, 1.756562, -0.2359003, 1, 1, 1, 1, 1,
1.314281, -0.7834498, 3.011261, 1, 1, 1, 1, 1,
1.314903, 0.3255045, 1.039903, 1, 1, 1, 1, 1,
1.318981, -1.265451, 2.317054, 1, 1, 1, 1, 1,
1.31914, -3.176762, 2.949668, 1, 1, 1, 1, 1,
1.325676, 0.4448743, 1.356466, 1, 1, 1, 1, 1,
1.331216, -0.1953373, 2.488792, 1, 1, 1, 1, 1,
1.348826, -1.508944, 2.086921, 1, 1, 1, 1, 1,
1.357347, 0.06501351, 1.159373, 0, 0, 1, 1, 1,
1.365045, -0.6508649, 2.373994, 1, 0, 0, 1, 1,
1.366691, 0.2003688, 0.2937189, 1, 0, 0, 1, 1,
1.370381, -0.5667133, 1.83217, 1, 0, 0, 1, 1,
1.373729, -0.0005721989, 0.6424323, 1, 0, 0, 1, 1,
1.375833, 0.3471865, 0.6456586, 1, 0, 0, 1, 1,
1.375973, 0.7252436, 3.24255, 0, 0, 0, 1, 1,
1.377868, 0.2265711, 1.651203, 0, 0, 0, 1, 1,
1.378652, -1.382754, 4.227862, 0, 0, 0, 1, 1,
1.381409, 0.04146496, 2.526295, 0, 0, 0, 1, 1,
1.388818, -0.120103, 0.4469017, 0, 0, 0, 1, 1,
1.398062, -0.4555328, 1.77473, 0, 0, 0, 1, 1,
1.403191, 1.758531, 0.3640664, 0, 0, 0, 1, 1,
1.404641, -0.5982216, 1.163717, 1, 1, 1, 1, 1,
1.413084, 0.4107172, 2.123609, 1, 1, 1, 1, 1,
1.415694, -0.1971145, 2.706236, 1, 1, 1, 1, 1,
1.429604, 0.01822913, -1.315983, 1, 1, 1, 1, 1,
1.4312, 0.4304076, 1.919588, 1, 1, 1, 1, 1,
1.441775, 1.681404, 0.07649741, 1, 1, 1, 1, 1,
1.445433, -0.007648116, 1.651265, 1, 1, 1, 1, 1,
1.451344, -2.777065, 3.166853, 1, 1, 1, 1, 1,
1.468309, -1.076172, 0.7493459, 1, 1, 1, 1, 1,
1.480129, -1.257836, 2.725678, 1, 1, 1, 1, 1,
1.482115, -0.4280389, 2.319351, 1, 1, 1, 1, 1,
1.495346, 1.27808, 0.8085548, 1, 1, 1, 1, 1,
1.50506, -1.649173, 2.9931, 1, 1, 1, 1, 1,
1.517395, -0.3417976, 2.173175, 1, 1, 1, 1, 1,
1.522713, 0.6171452, 2.24735, 1, 1, 1, 1, 1,
1.522766, 0.8767759, -0.8334039, 0, 0, 1, 1, 1,
1.540838, 2.600821, 2.805381, 1, 0, 0, 1, 1,
1.54374, 1.206458, -0.6474424, 1, 0, 0, 1, 1,
1.545991, -0.5329733, 1.156973, 1, 0, 0, 1, 1,
1.550514, 1.527791, 2.008253, 1, 0, 0, 1, 1,
1.552256, -0.773093, 2.693174, 1, 0, 0, 1, 1,
1.5546, 1.190992, 0.6275195, 0, 0, 0, 1, 1,
1.554697, 1.174185, 0.136675, 0, 0, 0, 1, 1,
1.558027, 0.2612566, 2.580302, 0, 0, 0, 1, 1,
1.561726, -0.4793358, 1.335224, 0, 0, 0, 1, 1,
1.563062, 0.4078742, 0.337235, 0, 0, 0, 1, 1,
1.591245, 1.49759, 2.30602, 0, 0, 0, 1, 1,
1.595398, 0.02100054, 1.06241, 0, 0, 0, 1, 1,
1.611213, -0.3439521, 3.02523, 1, 1, 1, 1, 1,
1.625541, 1.158322, 1.462294, 1, 1, 1, 1, 1,
1.641107, 0.4784461, 1.884966, 1, 1, 1, 1, 1,
1.648413, 0.09715495, 2.685971, 1, 1, 1, 1, 1,
1.653797, 1.261869, 2.146252, 1, 1, 1, 1, 1,
1.671667, -0.4374132, 2.560941, 1, 1, 1, 1, 1,
1.679201, 0.2666075, 3.549586, 1, 1, 1, 1, 1,
1.697385, 0.540365, 0.8331881, 1, 1, 1, 1, 1,
1.702634, -0.3176153, 2.913415, 1, 1, 1, 1, 1,
1.708094, 0.5330977, 3.088908, 1, 1, 1, 1, 1,
1.708839, -1.429337, 1.537726, 1, 1, 1, 1, 1,
1.726097, 0.6516158, 1.935753, 1, 1, 1, 1, 1,
1.728307, -0.8654985, 4.058217, 1, 1, 1, 1, 1,
1.734212, 1.065768, -0.01389216, 1, 1, 1, 1, 1,
1.737514, 0.6118165, 0.5332235, 1, 1, 1, 1, 1,
1.766867, -0.4055032, 1.965449, 0, 0, 1, 1, 1,
1.771695, -0.5687672, 1.159569, 1, 0, 0, 1, 1,
1.814183, -0.3511229, 2.651525, 1, 0, 0, 1, 1,
1.821715, 0.7949386, 0.1364338, 1, 0, 0, 1, 1,
1.822657, 0.1535866, 1.557945, 1, 0, 0, 1, 1,
1.824134, 1.612584, 0.9889365, 1, 0, 0, 1, 1,
1.827058, -0.01670056, 0.9879439, 0, 0, 0, 1, 1,
1.863921, -0.2841043, 1.881598, 0, 0, 0, 1, 1,
1.873584, 0.2041454, 0.7126917, 0, 0, 0, 1, 1,
1.91549, -0.3388612, 3.327605, 0, 0, 0, 1, 1,
1.925662, -0.4110241, 2.991821, 0, 0, 0, 1, 1,
1.945842, 0.5371387, 0.4678037, 0, 0, 0, 1, 1,
1.952331, -0.1235452, 1.73632, 0, 0, 0, 1, 1,
1.95651, -0.3963281, 2.227576, 1, 1, 1, 1, 1,
1.956992, -1.041895, 2.560924, 1, 1, 1, 1, 1,
1.996814, -1.497622, 0.6268568, 1, 1, 1, 1, 1,
2.026023, -0.1071568, -0.2099433, 1, 1, 1, 1, 1,
2.032728, -0.6900427, 1.598289, 1, 1, 1, 1, 1,
2.034875, 1.160081, 0.1740677, 1, 1, 1, 1, 1,
2.042295, -0.4249944, 3.316791, 1, 1, 1, 1, 1,
2.06989, 0.8981189, 1.342003, 1, 1, 1, 1, 1,
2.070537, 0.7025018, 2.058738, 1, 1, 1, 1, 1,
2.077316, -0.1928894, 1.91568, 1, 1, 1, 1, 1,
2.105778, -1.113603, 1.870906, 1, 1, 1, 1, 1,
2.12601, 0.9570045, 1.143776, 1, 1, 1, 1, 1,
2.129379, -0.2432248, 1.76886, 1, 1, 1, 1, 1,
2.139715, -1.767155, 2.044135, 1, 1, 1, 1, 1,
2.142715, 0.05327008, 0.6081278, 1, 1, 1, 1, 1,
2.151896, 0.633759, 3.106815, 0, 0, 1, 1, 1,
2.163427, 0.5569425, 1.218245, 1, 0, 0, 1, 1,
2.17375, 0.3305646, 0.6486262, 1, 0, 0, 1, 1,
2.176805, 0.1989606, 0.02515919, 1, 0, 0, 1, 1,
2.208136, 0.2473822, 1.2858, 1, 0, 0, 1, 1,
2.219363, 1.061309, 1.428908, 1, 0, 0, 1, 1,
2.247603, 1.396784, 0.6647332, 0, 0, 0, 1, 1,
2.249446, -0.2988456, 0.5473258, 0, 0, 0, 1, 1,
2.249568, 1.24868, 2.169859, 0, 0, 0, 1, 1,
2.256363, 0.5425224, 1.439385, 0, 0, 0, 1, 1,
2.272326, 1.054361, 0.3941937, 0, 0, 0, 1, 1,
2.312993, 0.1999252, 1.451707, 0, 0, 0, 1, 1,
2.39936, 0.3484276, 1.368878, 0, 0, 0, 1, 1,
2.406569, -2.115083, 3.575106, 1, 1, 1, 1, 1,
2.444637, 0.3986975, 1.31057, 1, 1, 1, 1, 1,
2.446845, -1.352685, 0.7831789, 1, 1, 1, 1, 1,
2.577217, 2.487684, -0.09416012, 1, 1, 1, 1, 1,
2.743247, 0.2624172, 2.177767, 1, 1, 1, 1, 1,
2.937709, 0.3832728, 2.85111, 1, 1, 1, 1, 1,
3.85923, 0.4766298, 0.7828001, 1, 1, 1, 1, 1
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
var radius = 9.937677;
var distance = 34.90567;
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
mvMatrix.translate( -0.5341899, 0.4204071, 0.3282998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90567);
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
