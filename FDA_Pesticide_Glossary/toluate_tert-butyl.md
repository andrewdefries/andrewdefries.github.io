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
-3.081576, 1.591418, -0.649586, 1, 0, 0, 1,
-2.861692, -0.5650684, -0.5450405, 1, 0.007843138, 0, 1,
-2.799116, 1.095246, -0.0131493, 1, 0.01176471, 0, 1,
-2.624584, -0.4132767, 0.01008431, 1, 0.01960784, 0, 1,
-2.5157, 1.036442, -0.3752528, 1, 0.02352941, 0, 1,
-2.50375, 0.6751295, -1.505318, 1, 0.03137255, 0, 1,
-2.368266, 0.2653238, -2.844371, 1, 0.03529412, 0, 1,
-2.346298, -0.7535056, -2.899349, 1, 0.04313726, 0, 1,
-2.217597, -0.4282224, -2.701154, 1, 0.04705882, 0, 1,
-2.202472, 1.335929, -0.7759103, 1, 0.05490196, 0, 1,
-2.193654, -0.830746, -3.805913, 1, 0.05882353, 0, 1,
-2.114819, -0.4266134, -1.567471, 1, 0.06666667, 0, 1,
-2.109243, 1.180957, -0.5179758, 1, 0.07058824, 0, 1,
-2.079214, 0.8345712, -1.729885, 1, 0.07843138, 0, 1,
-2.070882, 0.5834116, -0.9911467, 1, 0.08235294, 0, 1,
-2.042228, -1.300972, -2.635067, 1, 0.09019608, 0, 1,
-2.025715, 0.416811, -0.1237663, 1, 0.09411765, 0, 1,
-2.011686, 1.165026, -0.2758132, 1, 0.1019608, 0, 1,
-2.00959, -0.9559026, -2.357879, 1, 0.1098039, 0, 1,
-1.977712, 1.026285, -1.50868, 1, 0.1137255, 0, 1,
-1.97458, -0.05113418, -3.699291, 1, 0.1215686, 0, 1,
-1.962906, 0.3422053, -0.2262383, 1, 0.1254902, 0, 1,
-1.953961, -0.4422979, -2.336124, 1, 0.1333333, 0, 1,
-1.93917, 1.379891, 0.01114456, 1, 0.1372549, 0, 1,
-1.937543, -1.516059, -3.831039, 1, 0.145098, 0, 1,
-1.918041, 0.4758923, -2.478047, 1, 0.1490196, 0, 1,
-1.914091, 0.533565, -1.982782, 1, 0.1568628, 0, 1,
-1.890303, 1.117646, -0.242677, 1, 0.1607843, 0, 1,
-1.890243, 0.3809707, 0.1014337, 1, 0.1686275, 0, 1,
-1.877478, 0.00651772, -0.3861704, 1, 0.172549, 0, 1,
-1.843601, -0.1871047, -1.979163, 1, 0.1803922, 0, 1,
-1.834937, 0.078934, -1.586506, 1, 0.1843137, 0, 1,
-1.825572, -0.7291673, -1.961375, 1, 0.1921569, 0, 1,
-1.815311, 0.4477244, -2.032605, 1, 0.1960784, 0, 1,
-1.802872, 0.6355944, -3.424644, 1, 0.2039216, 0, 1,
-1.784549, -0.5101875, -3.43607, 1, 0.2117647, 0, 1,
-1.77907, 0.08864141, -0.5845669, 1, 0.2156863, 0, 1,
-1.776087, 0.9455212, -0.2641386, 1, 0.2235294, 0, 1,
-1.767327, 1.764041, -0.7492914, 1, 0.227451, 0, 1,
-1.754796, -0.7405069, -2.478803, 1, 0.2352941, 0, 1,
-1.723115, -0.1385292, -1.33545, 1, 0.2392157, 0, 1,
-1.675573, 0.2861004, 0.2624189, 1, 0.2470588, 0, 1,
-1.669251, -1.377788, -1.776177, 1, 0.2509804, 0, 1,
-1.661347, 0.6091037, 0.0663361, 1, 0.2588235, 0, 1,
-1.66041, -0.3685378, -2.093424, 1, 0.2627451, 0, 1,
-1.654001, -0.0485192, -1.56183, 1, 0.2705882, 0, 1,
-1.646176, 0.1040049, -1.505089, 1, 0.2745098, 0, 1,
-1.644081, 0.686304, -2.628416, 1, 0.282353, 0, 1,
-1.610459, -0.4004045, -1.651043, 1, 0.2862745, 0, 1,
-1.602296, -0.3621015, -1.063674, 1, 0.2941177, 0, 1,
-1.580232, -0.5992292, -0.0829875, 1, 0.3019608, 0, 1,
-1.579649, -0.2793572, -1.743529, 1, 0.3058824, 0, 1,
-1.571928, 1.08291, 0.09837453, 1, 0.3137255, 0, 1,
-1.569323, -0.1915392, -0.4841521, 1, 0.3176471, 0, 1,
-1.560258, -0.7599214, -2.049081, 1, 0.3254902, 0, 1,
-1.557555, 0.1681681, -1.22623, 1, 0.3294118, 0, 1,
-1.553853, 1.284912, -0.7128122, 1, 0.3372549, 0, 1,
-1.551944, 0.6045812, -2.540804, 1, 0.3411765, 0, 1,
-1.539859, -1.090546, -3.089222, 1, 0.3490196, 0, 1,
-1.537274, -0.5415246, -3.565331, 1, 0.3529412, 0, 1,
-1.534295, -0.04941161, -1.74743, 1, 0.3607843, 0, 1,
-1.523736, 1.39044, -0.2444581, 1, 0.3647059, 0, 1,
-1.477155, 0.157773, -1.801081, 1, 0.372549, 0, 1,
-1.467283, -0.1569232, -0.9710361, 1, 0.3764706, 0, 1,
-1.445583, -1.131233, -1.47195, 1, 0.3843137, 0, 1,
-1.443514, 1.565006, -1.099446, 1, 0.3882353, 0, 1,
-1.436278, 0.6806403, 0.5396256, 1, 0.3960784, 0, 1,
-1.434069, 0.2807008, -0.2091595, 1, 0.4039216, 0, 1,
-1.418176, 2.544585, -1.905169, 1, 0.4078431, 0, 1,
-1.417595, 0.5043845, 0.3361082, 1, 0.4156863, 0, 1,
-1.409372, 0.5812111, -0.3122608, 1, 0.4196078, 0, 1,
-1.393758, 0.6327144, -2.685976, 1, 0.427451, 0, 1,
-1.372636, 0.707634, -0.4092976, 1, 0.4313726, 0, 1,
-1.372264, -0.3563174, -1.841334, 1, 0.4392157, 0, 1,
-1.36507, -0.06029923, 0.2892076, 1, 0.4431373, 0, 1,
-1.353849, -0.3840049, -2.575117, 1, 0.4509804, 0, 1,
-1.35214, -1.635495, -1.518641, 1, 0.454902, 0, 1,
-1.339922, -0.3279923, -3.661724, 1, 0.4627451, 0, 1,
-1.336401, -0.1213582, -1.031797, 1, 0.4666667, 0, 1,
-1.334071, -0.1260538, -0.3137832, 1, 0.4745098, 0, 1,
-1.330856, -0.5595562, -1.622213, 1, 0.4784314, 0, 1,
-1.32847, -0.2020589, -4.452313, 1, 0.4862745, 0, 1,
-1.314149, 0.607492, 0.4022494, 1, 0.4901961, 0, 1,
-1.309041, -0.03300009, -1.789465, 1, 0.4980392, 0, 1,
-1.303977, -0.471932, -2.505863, 1, 0.5058824, 0, 1,
-1.285932, 2.777362, 0.3828157, 1, 0.509804, 0, 1,
-1.285656, -0.7323826, -1.626111, 1, 0.5176471, 0, 1,
-1.285364, -0.1535786, -1.762908, 1, 0.5215687, 0, 1,
-1.277591, 1.162069, -0.2331174, 1, 0.5294118, 0, 1,
-1.268967, 0.1896514, -2.301995, 1, 0.5333334, 0, 1,
-1.266697, 0.632072, -0.7080582, 1, 0.5411765, 0, 1,
-1.259563, -2.279066, -3.308925, 1, 0.5450981, 0, 1,
-1.257166, 0.7263321, 1.979139, 1, 0.5529412, 0, 1,
-1.249376, -0.6977174, -4.865489, 1, 0.5568628, 0, 1,
-1.248841, -2.396786, -2.774563, 1, 0.5647059, 0, 1,
-1.248819, 1.854776, -0.7505245, 1, 0.5686275, 0, 1,
-1.243132, 0.426996, -0.7057427, 1, 0.5764706, 0, 1,
-1.242237, 0.2656684, -0.345054, 1, 0.5803922, 0, 1,
-1.241301, -0.3622109, -3.125074, 1, 0.5882353, 0, 1,
-1.241115, 2.586772, 0.3282376, 1, 0.5921569, 0, 1,
-1.236021, -0.359146, -2.845312, 1, 0.6, 0, 1,
-1.222861, -0.9864039, -1.806594, 1, 0.6078432, 0, 1,
-1.213001, -0.4451953, -0.7814677, 1, 0.6117647, 0, 1,
-1.210342, -0.658338, -0.9985144, 1, 0.6196079, 0, 1,
-1.201096, -0.6180705, -2.684218, 1, 0.6235294, 0, 1,
-1.193094, -0.4547752, -2.837266, 1, 0.6313726, 0, 1,
-1.18684, -1.23216, -1.440804, 1, 0.6352941, 0, 1,
-1.185709, -0.7423345, -2.085017, 1, 0.6431373, 0, 1,
-1.182682, 0.1720436, -2.13478, 1, 0.6470588, 0, 1,
-1.174951, 1.213884, 0.3380604, 1, 0.654902, 0, 1,
-1.174094, 0.3308051, -1.565477, 1, 0.6588235, 0, 1,
-1.173312, 1.580574, -0.9900032, 1, 0.6666667, 0, 1,
-1.166656, 0.7402118, 0.3608262, 1, 0.6705883, 0, 1,
-1.162738, -1.4363, -2.369864, 1, 0.6784314, 0, 1,
-1.159474, -1.154155, -2.923002, 1, 0.682353, 0, 1,
-1.157321, -1.095564, -0.9902529, 1, 0.6901961, 0, 1,
-1.149016, -0.4060604, -2.834431, 1, 0.6941177, 0, 1,
-1.140257, 1.423504, -2.465344, 1, 0.7019608, 0, 1,
-1.137108, -0.0005232609, -0.3960658, 1, 0.7098039, 0, 1,
-1.135344, 0.4375837, -3.268493, 1, 0.7137255, 0, 1,
-1.131822, -0.5942121, -2.595509, 1, 0.7215686, 0, 1,
-1.127779, 0.3024997, -1.280997, 1, 0.7254902, 0, 1,
-1.126924, -0.550805, -2.249507, 1, 0.7333333, 0, 1,
-1.117763, -1.655487, -1.277589, 1, 0.7372549, 0, 1,
-1.117451, -0.2383934, -2.581237, 1, 0.7450981, 0, 1,
-1.117234, 0.1755737, -1.031102, 1, 0.7490196, 0, 1,
-1.111425, -0.02584664, -1.955924, 1, 0.7568628, 0, 1,
-1.106959, -1.322084, -4.19662, 1, 0.7607843, 0, 1,
-1.10398, -0.09487016, -1.026731, 1, 0.7686275, 0, 1,
-1.101476, 0.8276554, -1.098275, 1, 0.772549, 0, 1,
-1.101166, -0.2199078, -2.332228, 1, 0.7803922, 0, 1,
-1.099249, -0.334404, -1.228305, 1, 0.7843137, 0, 1,
-1.095685, -2.338794, -1.501621, 1, 0.7921569, 0, 1,
-1.087631, -1.080029, -2.99457, 1, 0.7960784, 0, 1,
-1.079067, -0.7262473, -2.189097, 1, 0.8039216, 0, 1,
-1.072453, -0.3871327, -2.232152, 1, 0.8117647, 0, 1,
-1.070574, -1.964526, -0.8586982, 1, 0.8156863, 0, 1,
-1.05429, -2.545914, -2.044684, 1, 0.8235294, 0, 1,
-1.04772, 0.5077452, 0.0186463, 1, 0.827451, 0, 1,
-1.040815, 0.2151809, -0.9786754, 1, 0.8352941, 0, 1,
-1.039171, 1.684723, 0.3635617, 1, 0.8392157, 0, 1,
-1.039054, -0.3855758, -1.514104, 1, 0.8470588, 0, 1,
-1.03423, 1.131095, -0.7473773, 1, 0.8509804, 0, 1,
-1.033269, -0.0844839, -1.972149, 1, 0.8588235, 0, 1,
-1.02984, 1.297831, 0.05576118, 1, 0.8627451, 0, 1,
-1.02896, -1.165278, -3.884557, 1, 0.8705882, 0, 1,
-1.027644, -1.262441, -4.222881, 1, 0.8745098, 0, 1,
-1.025601, -0.8414368, -2.590125, 1, 0.8823529, 0, 1,
-1.018293, -1.934694, -2.22252, 1, 0.8862745, 0, 1,
-1.015548, -0.8424851, -1.897333, 1, 0.8941177, 0, 1,
-1.01383, 0.2821176, -2.626474, 1, 0.8980392, 0, 1,
-1.010685, -0.6862577, -1.153312, 1, 0.9058824, 0, 1,
-0.9919128, 0.6555699, -1.228011, 1, 0.9137255, 0, 1,
-0.9800122, 1.512802, -0.7017338, 1, 0.9176471, 0, 1,
-0.9795424, -1.779188, -2.514816, 1, 0.9254902, 0, 1,
-0.9710226, 0.9587094, 0.8981066, 1, 0.9294118, 0, 1,
-0.9679729, -0.4988013, -3.226259, 1, 0.9372549, 0, 1,
-0.9662712, 1.102298, 0.3841853, 1, 0.9411765, 0, 1,
-0.954205, 0.2966501, -0.8544315, 1, 0.9490196, 0, 1,
-0.9498405, 0.9448982, 0.5480348, 1, 0.9529412, 0, 1,
-0.9472803, 0.5702641, -0.3352027, 1, 0.9607843, 0, 1,
-0.9450072, -0.4350125, -1.839751, 1, 0.9647059, 0, 1,
-0.9442246, 0.3356442, -1.286986, 1, 0.972549, 0, 1,
-0.9439852, -0.8513967, -2.626634, 1, 0.9764706, 0, 1,
-0.9432488, -1.609599, -2.115503, 1, 0.9843137, 0, 1,
-0.9413335, 0.5145918, -1.501122, 1, 0.9882353, 0, 1,
-0.9405107, 0.4968314, -1.747297, 1, 0.9960784, 0, 1,
-0.939698, 1.187339, -0.2810006, 0.9960784, 1, 0, 1,
-0.937138, -0.8827256, -1.760588, 0.9921569, 1, 0, 1,
-0.931246, 0.5677509, -1.763962, 0.9843137, 1, 0, 1,
-0.9294224, -0.3418425, -0.755334, 0.9803922, 1, 0, 1,
-0.9268982, -1.040974, -1.240786, 0.972549, 1, 0, 1,
-0.9178061, 0.5348983, -0.3136491, 0.9686275, 1, 0, 1,
-0.9154743, 1.254066, 0.4785636, 0.9607843, 1, 0, 1,
-0.907962, 0.2364326, 0.006611735, 0.9568627, 1, 0, 1,
-0.901885, -1.200345, -2.992286, 0.9490196, 1, 0, 1,
-0.901884, -0.9176446, -2.562622, 0.945098, 1, 0, 1,
-0.9015028, -0.1367209, -2.62246, 0.9372549, 1, 0, 1,
-0.9002328, 0.4041904, -2.407204, 0.9333333, 1, 0, 1,
-0.9001976, -0.6254941, -1.638361, 0.9254902, 1, 0, 1,
-0.8959176, -0.6214774, -2.605261, 0.9215686, 1, 0, 1,
-0.8951525, 0.688812, -0.9993886, 0.9137255, 1, 0, 1,
-0.8912432, 0.7896445, -1.716672, 0.9098039, 1, 0, 1,
-0.8912342, 0.3906298, -0.2690129, 0.9019608, 1, 0, 1,
-0.8901438, 0.7458545, -1.763688, 0.8941177, 1, 0, 1,
-0.8881363, 0.4763871, 0.2368616, 0.8901961, 1, 0, 1,
-0.8867784, -0.4473202, -1.322192, 0.8823529, 1, 0, 1,
-0.8842854, 0.1813559, -0.3437918, 0.8784314, 1, 0, 1,
-0.8836539, -1.755914, -3.727492, 0.8705882, 1, 0, 1,
-0.8787571, 0.200382, -1.387468, 0.8666667, 1, 0, 1,
-0.8786563, -0.300303, -2.343062, 0.8588235, 1, 0, 1,
-0.8675386, -0.2307287, -2.079586, 0.854902, 1, 0, 1,
-0.866788, -0.6163653, -2.024243, 0.8470588, 1, 0, 1,
-0.8582177, 0.3949997, -0.3522628, 0.8431373, 1, 0, 1,
-0.8581866, 0.2753552, 0.5615507, 0.8352941, 1, 0, 1,
-0.857541, -0.2250268, -0.8600586, 0.8313726, 1, 0, 1,
-0.849234, -0.966251, -1.564345, 0.8235294, 1, 0, 1,
-0.8450449, 0.005232105, -2.17706, 0.8196079, 1, 0, 1,
-0.8396316, 1.145467, 0.6838852, 0.8117647, 1, 0, 1,
-0.8393548, 1.605923, 0.008634456, 0.8078431, 1, 0, 1,
-0.8375739, -0.262152, -4.220781, 0.8, 1, 0, 1,
-0.831937, 1.158528, -0.005450601, 0.7921569, 1, 0, 1,
-0.8197682, 0.2042758, -1.751619, 0.7882353, 1, 0, 1,
-0.818584, -2.16721, -2.912473, 0.7803922, 1, 0, 1,
-0.8181057, 2.605952, -0.5505738, 0.7764706, 1, 0, 1,
-0.817274, 1.062111, 0.1960399, 0.7686275, 1, 0, 1,
-0.816564, -0.2193405, -0.1512755, 0.7647059, 1, 0, 1,
-0.8146915, -1.156087, -3.643544, 0.7568628, 1, 0, 1,
-0.8142513, -0.204129, -2.309309, 0.7529412, 1, 0, 1,
-0.8138236, 1.163629, -1.921371, 0.7450981, 1, 0, 1,
-0.7983961, -0.1344977, -2.882149, 0.7411765, 1, 0, 1,
-0.7957512, -1.500331, -2.286396, 0.7333333, 1, 0, 1,
-0.7873293, 0.5711102, -0.3793711, 0.7294118, 1, 0, 1,
-0.7871248, -1.139823, -1.445426, 0.7215686, 1, 0, 1,
-0.774637, -0.2298749, -2.796411, 0.7176471, 1, 0, 1,
-0.764791, 0.9632178, 0.7012615, 0.7098039, 1, 0, 1,
-0.7624776, -0.7620305, -0.7159352, 0.7058824, 1, 0, 1,
-0.7582583, 0.0106642, -1.896928, 0.6980392, 1, 0, 1,
-0.7540114, 0.06018477, -0.1742427, 0.6901961, 1, 0, 1,
-0.7464393, -0.3906623, -1.150709, 0.6862745, 1, 0, 1,
-0.741225, 0.4070348, -0.2487722, 0.6784314, 1, 0, 1,
-0.7403217, -0.1721109, -1.38766, 0.6745098, 1, 0, 1,
-0.7401373, 1.678242, 0.1085139, 0.6666667, 1, 0, 1,
-0.7293388, -0.1324582, -4.350169, 0.6627451, 1, 0, 1,
-0.7280622, 1.394343, 1.022242, 0.654902, 1, 0, 1,
-0.7255701, 1.18526, 0.2888918, 0.6509804, 1, 0, 1,
-0.7236846, -1.970279, -3.268319, 0.6431373, 1, 0, 1,
-0.7207277, 1.120618, 0.4626521, 0.6392157, 1, 0, 1,
-0.7176418, -0.1948574, -2.750527, 0.6313726, 1, 0, 1,
-0.7149943, -1.099591, -3.886214, 0.627451, 1, 0, 1,
-0.7084246, -0.4354804, -1.377701, 0.6196079, 1, 0, 1,
-0.7060581, -0.8950912, -4.397657, 0.6156863, 1, 0, 1,
-0.704326, 2.045597, -1.546184, 0.6078432, 1, 0, 1,
-0.6977214, -0.743755, -2.885201, 0.6039216, 1, 0, 1,
-0.6953319, -0.5412619, -2.140322, 0.5960785, 1, 0, 1,
-0.6951278, -0.7142891, -2.63224, 0.5882353, 1, 0, 1,
-0.6920589, 0.06207118, -0.3140518, 0.5843138, 1, 0, 1,
-0.6848962, -2.044032, -2.626574, 0.5764706, 1, 0, 1,
-0.6828752, 1.953648, 0.6635765, 0.572549, 1, 0, 1,
-0.6818508, -0.002709243, -1.007744, 0.5647059, 1, 0, 1,
-0.6793084, -2.130779, -1.503904, 0.5607843, 1, 0, 1,
-0.6787735, -0.7216341, -2.908939, 0.5529412, 1, 0, 1,
-0.6765984, 0.6423995, -1.00693, 0.5490196, 1, 0, 1,
-0.6757208, 0.2636438, -0.6672909, 0.5411765, 1, 0, 1,
-0.6736142, -0.2564221, -1.414261, 0.5372549, 1, 0, 1,
-0.6716652, 0.6830552, -2.524797, 0.5294118, 1, 0, 1,
-0.6711919, -0.1158891, -1.97818, 0.5254902, 1, 0, 1,
-0.6696497, -0.5084644, -3.494061, 0.5176471, 1, 0, 1,
-0.6675656, 0.1626695, -1.722614, 0.5137255, 1, 0, 1,
-0.6654283, 0.3164994, -1.456013, 0.5058824, 1, 0, 1,
-0.6651355, -0.4780454, -3.007854, 0.5019608, 1, 0, 1,
-0.6649429, -0.6533809, -1.833237, 0.4941176, 1, 0, 1,
-0.6597379, 0.4806641, 0.2480086, 0.4862745, 1, 0, 1,
-0.6544937, -0.3209462, -2.116986, 0.4823529, 1, 0, 1,
-0.6520674, 0.6167995, -1.401242, 0.4745098, 1, 0, 1,
-0.6482918, -0.2111671, -0.8240286, 0.4705882, 1, 0, 1,
-0.6440204, 1.00484, 0.3533643, 0.4627451, 1, 0, 1,
-0.6428474, 1.93542, -1.151067, 0.4588235, 1, 0, 1,
-0.631763, 1.102596, -0.731302, 0.4509804, 1, 0, 1,
-0.6222582, -1.321187, -2.998295, 0.4470588, 1, 0, 1,
-0.6215838, 2.304909, 0.6698674, 0.4392157, 1, 0, 1,
-0.6215836, -0.7648783, -4.146762, 0.4352941, 1, 0, 1,
-0.6193301, 0.8496683, 0.07067341, 0.427451, 1, 0, 1,
-0.6181041, 0.2269533, -1.0429, 0.4235294, 1, 0, 1,
-0.6171494, 0.5766039, -0.6012352, 0.4156863, 1, 0, 1,
-0.6126942, 0.4955506, -0.5549539, 0.4117647, 1, 0, 1,
-0.6106566, 1.934366, -0.6771433, 0.4039216, 1, 0, 1,
-0.6066628, -0.372025, -2.450918, 0.3960784, 1, 0, 1,
-0.606363, -1.015976, -3.751006, 0.3921569, 1, 0, 1,
-0.5955358, -0.2623319, -4.283465, 0.3843137, 1, 0, 1,
-0.5949572, -0.08547569, -0.1695097, 0.3803922, 1, 0, 1,
-0.5945773, 1.756463, 0.6167696, 0.372549, 1, 0, 1,
-0.5934868, 0.2257238, -2.348953, 0.3686275, 1, 0, 1,
-0.5927159, -0.3292758, -2.092802, 0.3607843, 1, 0, 1,
-0.5926694, -1.284588, -3.01951, 0.3568628, 1, 0, 1,
-0.5792056, -0.198156, -0.8909165, 0.3490196, 1, 0, 1,
-0.5782555, -1.253305, -2.223636, 0.345098, 1, 0, 1,
-0.5751689, 0.09519961, -0.7429156, 0.3372549, 1, 0, 1,
-0.5746266, 0.9591269, 1.306153, 0.3333333, 1, 0, 1,
-0.5738843, 1.135678, -0.3929197, 0.3254902, 1, 0, 1,
-0.5728427, -0.6393752, -4.37986, 0.3215686, 1, 0, 1,
-0.5679136, -0.7642381, -4.139896, 0.3137255, 1, 0, 1,
-0.5672697, 1.807953, -1.045479, 0.3098039, 1, 0, 1,
-0.5663566, 0.4067669, -3.355109, 0.3019608, 1, 0, 1,
-0.5654709, -0.6347247, -2.299885, 0.2941177, 1, 0, 1,
-0.5649745, 0.2104499, -1.036773, 0.2901961, 1, 0, 1,
-0.564048, 1.369702, 1.070599, 0.282353, 1, 0, 1,
-0.5617452, -0.09467597, -2.322501, 0.2784314, 1, 0, 1,
-0.5609744, 0.5142278, 0.2973177, 0.2705882, 1, 0, 1,
-0.5593815, -0.5101328, -0.5469857, 0.2666667, 1, 0, 1,
-0.5569792, 0.8024251, -1.296157, 0.2588235, 1, 0, 1,
-0.5506575, -0.9099709, -2.726328, 0.254902, 1, 0, 1,
-0.5479, -0.3079991, -3.667959, 0.2470588, 1, 0, 1,
-0.5470605, 1.458088, 0.7668504, 0.2431373, 1, 0, 1,
-0.5404931, 0.3371941, 0.5899532, 0.2352941, 1, 0, 1,
-0.5366843, 0.02815124, -0.6348038, 0.2313726, 1, 0, 1,
-0.5342719, 0.5301976, -1.654762, 0.2235294, 1, 0, 1,
-0.531975, -1.401799, -2.789526, 0.2196078, 1, 0, 1,
-0.5319269, -0.5090588, -3.69651, 0.2117647, 1, 0, 1,
-0.529016, -0.818513, -3.543251, 0.2078431, 1, 0, 1,
-0.5278974, -0.6648216, -2.460566, 0.2, 1, 0, 1,
-0.5268031, -0.7227284, -0.1244905, 0.1921569, 1, 0, 1,
-0.5236683, -0.8661617, -3.177439, 0.1882353, 1, 0, 1,
-0.5211394, 1.521275, -0.7917303, 0.1803922, 1, 0, 1,
-0.5183672, -0.8811256, -1.94188, 0.1764706, 1, 0, 1,
-0.5171292, -1.341141, -2.326506, 0.1686275, 1, 0, 1,
-0.5166019, -0.4303672, -3.756427, 0.1647059, 1, 0, 1,
-0.5120604, -0.01101478, -1.506566, 0.1568628, 1, 0, 1,
-0.5099452, 0.9592812, 0.4467565, 0.1529412, 1, 0, 1,
-0.5093771, -1.903575, -4.23345, 0.145098, 1, 0, 1,
-0.5092682, -0.2827367, -1.113229, 0.1411765, 1, 0, 1,
-0.5092499, -0.920701, -4.136531, 0.1333333, 1, 0, 1,
-0.5072046, -0.1194023, -2.978287, 0.1294118, 1, 0, 1,
-0.4957527, 0.9063282, 0.3809309, 0.1215686, 1, 0, 1,
-0.4939972, -0.3808435, -2.002838, 0.1176471, 1, 0, 1,
-0.4921726, 0.7530152, -1.345785, 0.1098039, 1, 0, 1,
-0.491002, -0.6815169, -2.694368, 0.1058824, 1, 0, 1,
-0.4909811, 0.1274859, -1.209573, 0.09803922, 1, 0, 1,
-0.4905855, 1.109163, -1.179065, 0.09019608, 1, 0, 1,
-0.4883226, 2.096913, -1.902851, 0.08627451, 1, 0, 1,
-0.4882451, -1.493654, -2.45614, 0.07843138, 1, 0, 1,
-0.4870516, 1.032766, -0.07089399, 0.07450981, 1, 0, 1,
-0.4862622, -0.3418714, -2.54275, 0.06666667, 1, 0, 1,
-0.485655, 0.8544574, -0.8697845, 0.0627451, 1, 0, 1,
-0.4830579, 1.881868, 1.103868, 0.05490196, 1, 0, 1,
-0.4804387, -0.4992813, -2.069487, 0.05098039, 1, 0, 1,
-0.4764938, -1.28163, -1.273025, 0.04313726, 1, 0, 1,
-0.4734501, 0.497869, -0.1022566, 0.03921569, 1, 0, 1,
-0.4713472, 0.8489328, 0.0006728237, 0.03137255, 1, 0, 1,
-0.4703386, 0.9532012, 0.4785098, 0.02745098, 1, 0, 1,
-0.4653064, 1.51026, 0.8261735, 0.01960784, 1, 0, 1,
-0.4638788, 0.02220432, -0.4199497, 0.01568628, 1, 0, 1,
-0.4565374, -1.300611, -2.412286, 0.007843138, 1, 0, 1,
-0.4561096, -0.2698732, -2.702225, 0.003921569, 1, 0, 1,
-0.4558685, 2.764362, -0.789336, 0, 1, 0.003921569, 1,
-0.4535237, 0.1632369, -1.441043, 0, 1, 0.01176471, 1,
-0.4521941, -1.232813, -2.708156, 0, 1, 0.01568628, 1,
-0.4516816, -0.2847203, -2.216585, 0, 1, 0.02352941, 1,
-0.4505492, 0.3242287, -0.04736894, 0, 1, 0.02745098, 1,
-0.4502903, 1.748109, 1.722827, 0, 1, 0.03529412, 1,
-0.4462762, -0.005232867, -0.6671798, 0, 1, 0.03921569, 1,
-0.4433193, -0.5489407, -2.55118, 0, 1, 0.04705882, 1,
-0.4426963, -0.8248993, -2.625883, 0, 1, 0.05098039, 1,
-0.4421965, -0.03600042, -0.900844, 0, 1, 0.05882353, 1,
-0.4401152, -0.08595555, -0.7234376, 0, 1, 0.0627451, 1,
-0.437592, 2.912156, -0.002694381, 0, 1, 0.07058824, 1,
-0.4347772, -1.008131, -1.468174, 0, 1, 0.07450981, 1,
-0.429596, 1.612201, 0.2612056, 0, 1, 0.08235294, 1,
-0.4286193, -0.1022315, -2.593767, 0, 1, 0.08627451, 1,
-0.4222725, 0.06918862, 0.7444311, 0, 1, 0.09411765, 1,
-0.4198789, -0.6244206, -3.973163, 0, 1, 0.1019608, 1,
-0.419199, -0.9062252, -2.304276, 0, 1, 0.1058824, 1,
-0.4178863, -1.942247, -1.736085, 0, 1, 0.1137255, 1,
-0.4172411, -1.408626, -2.255042, 0, 1, 0.1176471, 1,
-0.4133951, 0.8760267, -0.9234259, 0, 1, 0.1254902, 1,
-0.4039174, -2.245434, -3.513374, 0, 1, 0.1294118, 1,
-0.3997381, -0.3420771, -1.791724, 0, 1, 0.1372549, 1,
-0.3990135, -1.30447, -3.821808, 0, 1, 0.1411765, 1,
-0.3968422, -0.8361219, -3.968853, 0, 1, 0.1490196, 1,
-0.3940267, 2.353714, 0.5719152, 0, 1, 0.1529412, 1,
-0.3925574, 1.256368, -1.265919, 0, 1, 0.1607843, 1,
-0.3922336, -0.1188661, -0.0910437, 0, 1, 0.1647059, 1,
-0.3874815, -1.339284, -2.699908, 0, 1, 0.172549, 1,
-0.3869731, -0.7972637, -2.41669, 0, 1, 0.1764706, 1,
-0.3807554, 0.5620716, -1.113543, 0, 1, 0.1843137, 1,
-0.3771101, -0.1518672, -1.255872, 0, 1, 0.1882353, 1,
-0.3713923, 0.3176363, -2.216689, 0, 1, 0.1960784, 1,
-0.3692516, -0.168086, -2.794876, 0, 1, 0.2039216, 1,
-0.3649615, 0.882027, -1.425954, 0, 1, 0.2078431, 1,
-0.3622583, -0.7462379, -1.716023, 0, 1, 0.2156863, 1,
-0.3608285, 0.2504752, -0.9504972, 0, 1, 0.2196078, 1,
-0.3575634, 0.6048458, -0.8778349, 0, 1, 0.227451, 1,
-0.3560632, -0.6725145, -3.180076, 0, 1, 0.2313726, 1,
-0.3495905, -1.523096, -4.386329, 0, 1, 0.2392157, 1,
-0.3491144, -0.7979442, -2.908932, 0, 1, 0.2431373, 1,
-0.3433273, -0.4509708, -3.878493, 0, 1, 0.2509804, 1,
-0.3376382, 1.565926, -1.797908, 0, 1, 0.254902, 1,
-0.3354575, -0.04628445, -2.192048, 0, 1, 0.2627451, 1,
-0.3326745, 1.324631, -0.3821215, 0, 1, 0.2666667, 1,
-0.3302833, -0.268089, -3.403876, 0, 1, 0.2745098, 1,
-0.3288586, -0.9629741, -1.859957, 0, 1, 0.2784314, 1,
-0.3282133, 0.2742988, 1.123787, 0, 1, 0.2862745, 1,
-0.3261279, 1.294435, -0.4100572, 0, 1, 0.2901961, 1,
-0.3160181, -0.7799278, -3.575355, 0, 1, 0.2980392, 1,
-0.3153118, 1.519343, 0.1011441, 0, 1, 0.3058824, 1,
-0.3150362, 0.2735759, 0.4272589, 0, 1, 0.3098039, 1,
-0.313756, 0.1610133, -2.367472, 0, 1, 0.3176471, 1,
-0.2994227, -1.60903, -2.612899, 0, 1, 0.3215686, 1,
-0.2986026, -0.01938931, -2.598897, 0, 1, 0.3294118, 1,
-0.2980339, -0.3008595, -2.220129, 0, 1, 0.3333333, 1,
-0.2960279, -1.463547, -2.898556, 0, 1, 0.3411765, 1,
-0.2956181, 1.924182, 0.1516779, 0, 1, 0.345098, 1,
-0.2949797, 0.1285635, -1.631113, 0, 1, 0.3529412, 1,
-0.294171, 1.489028, 1.287893, 0, 1, 0.3568628, 1,
-0.2935151, 1.432615, 2.335341, 0, 1, 0.3647059, 1,
-0.2933115, -0.5377656, -1.957411, 0, 1, 0.3686275, 1,
-0.2913005, -0.9590456, -2.848601, 0, 1, 0.3764706, 1,
-0.2854864, -1.654373, -1.230418, 0, 1, 0.3803922, 1,
-0.2827541, -0.5575228, -3.45438, 0, 1, 0.3882353, 1,
-0.2826326, 0.28635, -0.6470404, 0, 1, 0.3921569, 1,
-0.2814978, -2.114461, -3.941357, 0, 1, 0.4, 1,
-0.2809823, -0.9694935, -4.432596, 0, 1, 0.4078431, 1,
-0.276017, 1.715467, -0.4840537, 0, 1, 0.4117647, 1,
-0.2733188, 0.8230701, -0.6399054, 0, 1, 0.4196078, 1,
-0.2693005, -0.8202917, -2.317365, 0, 1, 0.4235294, 1,
-0.2586379, 1.19093, 0.199513, 0, 1, 0.4313726, 1,
-0.2566194, 0.359834, -1.996682, 0, 1, 0.4352941, 1,
-0.2514558, -1.434811, -2.67348, 0, 1, 0.4431373, 1,
-0.2492992, 1.510135, 0.6584488, 0, 1, 0.4470588, 1,
-0.2482862, 0.1844476, 0.572247, 0, 1, 0.454902, 1,
-0.2474416, -2.158293, -2.985064, 0, 1, 0.4588235, 1,
-0.2442347, -0.69056, -2.568006, 0, 1, 0.4666667, 1,
-0.2438867, -0.07835649, -0.1322616, 0, 1, 0.4705882, 1,
-0.2398268, -1.96259, -3.036599, 0, 1, 0.4784314, 1,
-0.2369222, 0.6641087, 1.423131, 0, 1, 0.4823529, 1,
-0.236012, 1.295213, 0.1489386, 0, 1, 0.4901961, 1,
-0.2338125, 0.681295, -0.1891025, 0, 1, 0.4941176, 1,
-0.233492, 0.7201143, -0.9491346, 0, 1, 0.5019608, 1,
-0.2305474, 0.6157439, 0.1837239, 0, 1, 0.509804, 1,
-0.2268116, 1.101834, -0.04559766, 0, 1, 0.5137255, 1,
-0.2256375, -0.9809589, -3.244976, 0, 1, 0.5215687, 1,
-0.2255146, -1.67346, -3.638267, 0, 1, 0.5254902, 1,
-0.2254022, 1.986724, 0.4025051, 0, 1, 0.5333334, 1,
-0.2246324, 0.4084187, 0.8875992, 0, 1, 0.5372549, 1,
-0.217047, 0.5916476, 0.5085169, 0, 1, 0.5450981, 1,
-0.2156851, 1.065506, -0.2145065, 0, 1, 0.5490196, 1,
-0.2136866, -0.7743529, -3.72962, 0, 1, 0.5568628, 1,
-0.2135649, -0.1716006, -1.705319, 0, 1, 0.5607843, 1,
-0.2128189, -0.3069765, -1.566292, 0, 1, 0.5686275, 1,
-0.2108131, -0.4441694, -1.409729, 0, 1, 0.572549, 1,
-0.2067058, 0.3880124, -0.1889547, 0, 1, 0.5803922, 1,
-0.2039959, -1.849783, -4.253577, 0, 1, 0.5843138, 1,
-0.2028171, 1.490353, -0.03922517, 0, 1, 0.5921569, 1,
-0.1973443, 1.524953, 0.3212755, 0, 1, 0.5960785, 1,
-0.1972495, 0.2777685, -1.670958, 0, 1, 0.6039216, 1,
-0.1946178, -1.454237, -1.016213, 0, 1, 0.6117647, 1,
-0.1930202, 0.3967702, -1.460694, 0, 1, 0.6156863, 1,
-0.1915014, -0.3608803, -2.204909, 0, 1, 0.6235294, 1,
-0.191056, 0.1458486, -3.224993, 0, 1, 0.627451, 1,
-0.186794, 0.563655, 1.138389, 0, 1, 0.6352941, 1,
-0.1810885, -0.2677047, -1.606277, 0, 1, 0.6392157, 1,
-0.1759347, 0.3338584, 1.733971, 0, 1, 0.6470588, 1,
-0.174756, -0.122109, -2.29182, 0, 1, 0.6509804, 1,
-0.1737611, 0.8816021, 0.2170929, 0, 1, 0.6588235, 1,
-0.168764, 0.2230045, 1.861057, 0, 1, 0.6627451, 1,
-0.1657381, -0.906849, -4.700205, 0, 1, 0.6705883, 1,
-0.1638394, 1.214052, -0.9375536, 0, 1, 0.6745098, 1,
-0.162347, 1.514589, -0.6234264, 0, 1, 0.682353, 1,
-0.1544215, 0.2912612, 0.7186067, 0, 1, 0.6862745, 1,
-0.1516561, 1.69214, 0.1216252, 0, 1, 0.6941177, 1,
-0.146193, -0.1314897, -1.774904, 0, 1, 0.7019608, 1,
-0.1435733, -2.538552, -1.998847, 0, 1, 0.7058824, 1,
-0.140502, 1.220773, 0.4246029, 0, 1, 0.7137255, 1,
-0.1404808, 1.064467, -0.7683953, 0, 1, 0.7176471, 1,
-0.1352724, -0.3130239, -1.534321, 0, 1, 0.7254902, 1,
-0.1340369, 0.3776648, -0.1855422, 0, 1, 0.7294118, 1,
-0.1338662, 0.4091096, -1.129825, 0, 1, 0.7372549, 1,
-0.1308103, -0.1995087, -2.993303, 0, 1, 0.7411765, 1,
-0.1253805, 0.4137066, 1.313109, 0, 1, 0.7490196, 1,
-0.1222044, -0.5078225, -2.820231, 0, 1, 0.7529412, 1,
-0.12038, 0.1031273, -2.004543, 0, 1, 0.7607843, 1,
-0.1191163, 0.4154295, -0.5787001, 0, 1, 0.7647059, 1,
-0.1183391, 0.06956869, -1.563974, 0, 1, 0.772549, 1,
-0.1168528, -1.195771, -2.71101, 0, 1, 0.7764706, 1,
-0.114958, -0.9302868, -3.096321, 0, 1, 0.7843137, 1,
-0.1140197, 1.390303, 0.07858996, 0, 1, 0.7882353, 1,
-0.1113123, 1.01336, -0.295106, 0, 1, 0.7960784, 1,
-0.1095022, -0.2186524, -3.123987, 0, 1, 0.8039216, 1,
-0.1093005, -0.1537871, -2.486263, 0, 1, 0.8078431, 1,
-0.1052577, 0.007363219, -3.699409, 0, 1, 0.8156863, 1,
-0.1015337, -0.631975, -2.38341, 0, 1, 0.8196079, 1,
-0.1012583, 0.1666225, -1.150711, 0, 1, 0.827451, 1,
-0.1008714, 0.5046105, -1.126623, 0, 1, 0.8313726, 1,
-0.09882351, -0.5152626, -2.798782, 0, 1, 0.8392157, 1,
-0.09471474, 0.8786362, 1.072699, 0, 1, 0.8431373, 1,
-0.09191639, 1.290107, -0.5059171, 0, 1, 0.8509804, 1,
-0.08850303, -0.05354261, -2.182683, 0, 1, 0.854902, 1,
-0.08815592, -0.4921205, -2.685709, 0, 1, 0.8627451, 1,
-0.08766074, -0.447657, -4.008435, 0, 1, 0.8666667, 1,
-0.08590889, 0.8436726, -2.403688, 0, 1, 0.8745098, 1,
-0.08286039, 2.087743, 0.5776956, 0, 1, 0.8784314, 1,
-0.08234276, 0.2600058, -1.097932, 0, 1, 0.8862745, 1,
-0.07990544, -1.268239, -2.396732, 0, 1, 0.8901961, 1,
-0.07973165, 0.4059026, -1.076669, 0, 1, 0.8980392, 1,
-0.07863679, 0.7453541, -1.475695, 0, 1, 0.9058824, 1,
-0.07809069, -0.4031283, -2.960644, 0, 1, 0.9098039, 1,
-0.07292618, -0.6274868, -1.839732, 0, 1, 0.9176471, 1,
-0.07206422, 0.05787134, -2.012743, 0, 1, 0.9215686, 1,
-0.0717489, 0.1155872, -0.4541328, 0, 1, 0.9294118, 1,
-0.06917316, 0.6447974, -0.6949513, 0, 1, 0.9333333, 1,
-0.06899311, -0.7055955, -2.499079, 0, 1, 0.9411765, 1,
-0.06669151, -0.2251777, -1.817504, 0, 1, 0.945098, 1,
-0.06373259, -1.023369, -4.477695, 0, 1, 0.9529412, 1,
-0.06214984, -0.03227513, -1.524369, 0, 1, 0.9568627, 1,
-0.06117018, -0.09108426, -2.051613, 0, 1, 0.9647059, 1,
-0.06078223, -2.201474, -3.692285, 0, 1, 0.9686275, 1,
-0.05886365, -0.326935, -4.614112, 0, 1, 0.9764706, 1,
-0.04892253, -1.11067, -1.372492, 0, 1, 0.9803922, 1,
-0.03739805, -0.1253418, -3.909813, 0, 1, 0.9882353, 1,
-0.03628476, -1.046136, -2.268898, 0, 1, 0.9921569, 1,
-0.03625743, -0.5962706, -2.586198, 0, 1, 1, 1,
-0.03418429, 0.5520946, -0.7837218, 0, 0.9921569, 1, 1,
-0.02887154, 0.2814232, -1.165675, 0, 0.9882353, 1, 1,
-0.02759407, 1.742787, 2.247485, 0, 0.9803922, 1, 1,
-0.02420138, -0.7369754, -2.489125, 0, 0.9764706, 1, 1,
-0.0223621, -0.9495497, -5.345973, 0, 0.9686275, 1, 1,
-0.02124544, 1.220177, -1.042797, 0, 0.9647059, 1, 1,
-0.0163206, 0.005724998, -2.773052, 0, 0.9568627, 1, 1,
-0.01582563, -0.05427976, -2.481776, 0, 0.9529412, 1, 1,
-0.01078842, -0.857968, -3.818523, 0, 0.945098, 1, 1,
-0.009613767, 0.9902111, 1.052133, 0, 0.9411765, 1, 1,
-0.007951154, 0.4794126, 0.1328019, 0, 0.9333333, 1, 1,
-0.006875065, -1.721885, -3.132702, 0, 0.9294118, 1, 1,
-0.001456584, -1.729307, -3.143331, 0, 0.9215686, 1, 1,
0.005804623, 1.196013, -2.032937, 0, 0.9176471, 1, 1,
0.005883787, 1.409771, 0.4002596, 0, 0.9098039, 1, 1,
0.006091351, -0.4688577, 3.893057, 0, 0.9058824, 1, 1,
0.01076444, -0.2536081, 3.572137, 0, 0.8980392, 1, 1,
0.01225599, -0.4172267, 4.375286, 0, 0.8901961, 1, 1,
0.01732738, 1.14766, 1.627277, 0, 0.8862745, 1, 1,
0.01991477, -0.3118535, 2.992836, 0, 0.8784314, 1, 1,
0.02297045, -1.167554, 3.871842, 0, 0.8745098, 1, 1,
0.0289433, 0.1405243, 0.04452749, 0, 0.8666667, 1, 1,
0.03210206, 0.2982966, 1.432509, 0, 0.8627451, 1, 1,
0.03825147, -0.4895056, 2.922452, 0, 0.854902, 1, 1,
0.04147102, 0.7973325, 0.6845163, 0, 0.8509804, 1, 1,
0.04579247, -1.428986, 3.785591, 0, 0.8431373, 1, 1,
0.04633567, -1.089783, 4.075202, 0, 0.8392157, 1, 1,
0.05014355, 0.7987553, -0.2018825, 0, 0.8313726, 1, 1,
0.05066183, 0.4658393, 1.440943, 0, 0.827451, 1, 1,
0.05211497, -1.837683, 3.737004, 0, 0.8196079, 1, 1,
0.05278406, -0.1527936, 3.200539, 0, 0.8156863, 1, 1,
0.05279697, 1.883997, -1.136943, 0, 0.8078431, 1, 1,
0.06075516, 0.5509536, -0.08714642, 0, 0.8039216, 1, 1,
0.06484533, -2.034269, 1.977714, 0, 0.7960784, 1, 1,
0.06535012, 1.627974, 1.040304, 0, 0.7882353, 1, 1,
0.0700013, -0.4838266, 3.609673, 0, 0.7843137, 1, 1,
0.07159705, 0.0428841, -0.08287573, 0, 0.7764706, 1, 1,
0.07239848, -0.4197161, 3.794401, 0, 0.772549, 1, 1,
0.07298893, 1.215227, 1.321524, 0, 0.7647059, 1, 1,
0.07335492, 0.2844414, 0.4093275, 0, 0.7607843, 1, 1,
0.07503079, 1.353622, 0.4033878, 0, 0.7529412, 1, 1,
0.07591343, 1.374637, -0.4303258, 0, 0.7490196, 1, 1,
0.07802016, -0.498373, 2.563773, 0, 0.7411765, 1, 1,
0.08040268, 0.6976099, -1.132995, 0, 0.7372549, 1, 1,
0.08189793, 1.385797, -0.9065953, 0, 0.7294118, 1, 1,
0.08283293, 0.04111142, 1.27941, 0, 0.7254902, 1, 1,
0.09141992, 0.2021509, -0.9544767, 0, 0.7176471, 1, 1,
0.09176632, -0.789489, 3.916998, 0, 0.7137255, 1, 1,
0.09888825, 1.196451, -1.167413, 0, 0.7058824, 1, 1,
0.09995499, -1.46531, 3.202857, 0, 0.6980392, 1, 1,
0.1005355, 3.834524, -0.9729002, 0, 0.6941177, 1, 1,
0.1018711, -0.6496349, 2.472872, 0, 0.6862745, 1, 1,
0.1021214, 0.6862909, -0.5333139, 0, 0.682353, 1, 1,
0.104556, 0.1675362, 0.4469998, 0, 0.6745098, 1, 1,
0.1052005, -0.5283664, 3.626481, 0, 0.6705883, 1, 1,
0.106672, -0.2660257, 1.985274, 0, 0.6627451, 1, 1,
0.1120518, -0.1883625, 3.13084, 0, 0.6588235, 1, 1,
0.1160958, -1.160293, 3.553919, 0, 0.6509804, 1, 1,
0.1173528, 0.8106899, 0.3948746, 0, 0.6470588, 1, 1,
0.121304, -0.530769, 1.923557, 0, 0.6392157, 1, 1,
0.1218083, -0.4245495, 3.980675, 0, 0.6352941, 1, 1,
0.1265262, -0.7880054, 3.310311, 0, 0.627451, 1, 1,
0.1271573, -1.257603, 4.416205, 0, 0.6235294, 1, 1,
0.1290739, -0.9476182, 1.839301, 0, 0.6156863, 1, 1,
0.1311449, 0.8478506, 0.391723, 0, 0.6117647, 1, 1,
0.1321219, -0.9336106, 2.032206, 0, 0.6039216, 1, 1,
0.132658, 0.3079039, 1.944874, 0, 0.5960785, 1, 1,
0.1340945, -0.8897192, 4.122205, 0, 0.5921569, 1, 1,
0.1361156, 0.1468438, 0.1415471, 0, 0.5843138, 1, 1,
0.1402428, 1.323769, 1.63485, 0, 0.5803922, 1, 1,
0.1403984, -0.14525, 0.5571224, 0, 0.572549, 1, 1,
0.1404685, -1.183303, 2.299435, 0, 0.5686275, 1, 1,
0.1408907, -1.571504, 1.590201, 0, 0.5607843, 1, 1,
0.144345, 0.9651075, 0.07805425, 0, 0.5568628, 1, 1,
0.1443702, 0.2570589, 0.9412241, 0, 0.5490196, 1, 1,
0.1513661, 1.500046, 1.051475, 0, 0.5450981, 1, 1,
0.15229, -0.4313993, 3.284293, 0, 0.5372549, 1, 1,
0.1552823, -0.2718777, 2.92972, 0, 0.5333334, 1, 1,
0.1560608, 0.3602549, 3.071235, 0, 0.5254902, 1, 1,
0.1574703, 0.05738734, 0.9037189, 0, 0.5215687, 1, 1,
0.1613255, -0.3779982, 3.430578, 0, 0.5137255, 1, 1,
0.1627318, 1.449161, 1.379474, 0, 0.509804, 1, 1,
0.163011, -1.433516, 1.676733, 0, 0.5019608, 1, 1,
0.1891419, 0.4361873, 0.9680315, 0, 0.4941176, 1, 1,
0.1950415, 0.7750378, 0.3212266, 0, 0.4901961, 1, 1,
0.1961725, 3.402388, 0.6132382, 0, 0.4823529, 1, 1,
0.1971449, -1.071618, 4.644652, 0, 0.4784314, 1, 1,
0.1974166, -0.8005289, 4.810772, 0, 0.4705882, 1, 1,
0.1977609, 0.5573889, 0.5686383, 0, 0.4666667, 1, 1,
0.2026476, 1.42764, 2.583567, 0, 0.4588235, 1, 1,
0.2027266, 0.2712897, 0.02753544, 0, 0.454902, 1, 1,
0.2060347, 2.166302, -0.2283678, 0, 0.4470588, 1, 1,
0.2098921, -1.667968, 3.936028, 0, 0.4431373, 1, 1,
0.2099956, 0.1253239, 0.7858172, 0, 0.4352941, 1, 1,
0.2130522, 1.326563, 0.7777982, 0, 0.4313726, 1, 1,
0.2174161, 0.9471806, 1.537796, 0, 0.4235294, 1, 1,
0.2187222, -1.108989, 3.791466, 0, 0.4196078, 1, 1,
0.2195115, 0.6828784, 0.4295596, 0, 0.4117647, 1, 1,
0.2230158, -0.3973692, 2.877733, 0, 0.4078431, 1, 1,
0.2282911, -0.2981644, 4.257406, 0, 0.4, 1, 1,
0.2284619, 0.1574082, 1.812135, 0, 0.3921569, 1, 1,
0.2332722, 0.7677648, -0.152999, 0, 0.3882353, 1, 1,
0.2372753, -0.08692569, 2.427574, 0, 0.3803922, 1, 1,
0.2471526, -0.6417173, 4.519841, 0, 0.3764706, 1, 1,
0.247352, 1.626946, -1.774128, 0, 0.3686275, 1, 1,
0.2572967, 0.5955713, -0.4584257, 0, 0.3647059, 1, 1,
0.2584068, -1.050196, 0.8667635, 0, 0.3568628, 1, 1,
0.2657371, 1.930416, 0.6959338, 0, 0.3529412, 1, 1,
0.2685072, 2.003657, -1.368374, 0, 0.345098, 1, 1,
0.270997, -0.1478738, 2.418455, 0, 0.3411765, 1, 1,
0.2763389, -2.97465, 3.504397, 0, 0.3333333, 1, 1,
0.2794055, -1.574888, 2.813176, 0, 0.3294118, 1, 1,
0.2896293, -2.122359, 2.770621, 0, 0.3215686, 1, 1,
0.2919932, -0.3832382, 4.672487, 0, 0.3176471, 1, 1,
0.2926144, 0.3750396, 1.957804, 0, 0.3098039, 1, 1,
0.2929186, 1.253174, 1.376595, 0, 0.3058824, 1, 1,
0.3000855, -0.4221576, 2.035232, 0, 0.2980392, 1, 1,
0.3011363, 1.002665, 2.056311, 0, 0.2901961, 1, 1,
0.3024365, -0.5264917, 3.430259, 0, 0.2862745, 1, 1,
0.3025913, 1.381939, -0.6859117, 0, 0.2784314, 1, 1,
0.30826, 1.387578, -0.3729987, 0, 0.2745098, 1, 1,
0.3122262, 0.2024331, -0.7380304, 0, 0.2666667, 1, 1,
0.3153295, 0.6837272, 0.5769254, 0, 0.2627451, 1, 1,
0.3158768, -1.886524, 3.476261, 0, 0.254902, 1, 1,
0.3199392, 1.599045, -0.02363579, 0, 0.2509804, 1, 1,
0.3217218, -0.0832858, 4.527224, 0, 0.2431373, 1, 1,
0.3226484, 0.8012414, 1.274431, 0, 0.2392157, 1, 1,
0.3263033, 1.956811, 0.8932076, 0, 0.2313726, 1, 1,
0.3311389, 1.208188, 1.74891, 0, 0.227451, 1, 1,
0.3318051, 0.8176095, 0.3127102, 0, 0.2196078, 1, 1,
0.331986, -1.144237, 3.625374, 0, 0.2156863, 1, 1,
0.332347, -0.4100226, 2.342352, 0, 0.2078431, 1, 1,
0.333844, 0.0347445, 1.821451, 0, 0.2039216, 1, 1,
0.3365466, -0.9615764, 3.581691, 0, 0.1960784, 1, 1,
0.3368663, 1.573607, 0.2332882, 0, 0.1882353, 1, 1,
0.3389462, -0.5080044, 4.348059, 0, 0.1843137, 1, 1,
0.3409758, 0.1507546, 0.6158022, 0, 0.1764706, 1, 1,
0.3410296, -0.4182166, 2.316308, 0, 0.172549, 1, 1,
0.3437484, 0.02217884, -0.04156245, 0, 0.1647059, 1, 1,
0.3443604, -1.12417, 3.066245, 0, 0.1607843, 1, 1,
0.3474034, 1.025673, 1.255439, 0, 0.1529412, 1, 1,
0.3487301, -2.368236, 2.298476, 0, 0.1490196, 1, 1,
0.3498427, -0.09358657, -0.419183, 0, 0.1411765, 1, 1,
0.350269, -0.9314607, 3.72001, 0, 0.1372549, 1, 1,
0.3503252, 1.31384, 1.610366, 0, 0.1294118, 1, 1,
0.3532877, -0.2118028, 4.05304, 0, 0.1254902, 1, 1,
0.3547439, -0.2341819, 2.619111, 0, 0.1176471, 1, 1,
0.3583103, 0.1988477, 2.729789, 0, 0.1137255, 1, 1,
0.3644995, 0.6613326, 1.357468, 0, 0.1058824, 1, 1,
0.3714729, 0.9531538, -0.3124358, 0, 0.09803922, 1, 1,
0.3715064, 0.2229467, 2.31058, 0, 0.09411765, 1, 1,
0.3725236, 0.9877527, 1.401857, 0, 0.08627451, 1, 1,
0.3766796, -0.6360095, 2.113866, 0, 0.08235294, 1, 1,
0.3767491, 0.3889163, -0.1563032, 0, 0.07450981, 1, 1,
0.3826478, -1.507384, 1.303436, 0, 0.07058824, 1, 1,
0.3882391, 0.9961392, 0.4768127, 0, 0.0627451, 1, 1,
0.3900916, -0.3101068, 3.230544, 0, 0.05882353, 1, 1,
0.3933118, 0.07762459, 1.875207, 0, 0.05098039, 1, 1,
0.3943866, 0.2259606, 0.1736523, 0, 0.04705882, 1, 1,
0.3978224, 1.217618, 0.6111983, 0, 0.03921569, 1, 1,
0.4005526, 0.1333691, 1.19891, 0, 0.03529412, 1, 1,
0.4020217, 0.1994013, 1.372505, 0, 0.02745098, 1, 1,
0.4025805, 1.281634, -1.359257, 0, 0.02352941, 1, 1,
0.4068481, 0.8312098, 0.5135209, 0, 0.01568628, 1, 1,
0.4129114, 0.6301322, 0.2026138, 0, 0.01176471, 1, 1,
0.4140643, -0.950153, 1.284576, 0, 0.003921569, 1, 1,
0.4152928, -0.7713624, 3.471256, 0.003921569, 0, 1, 1,
0.4187364, -0.6516135, 3.95129, 0.007843138, 0, 1, 1,
0.4194945, -0.1760288, 2.159207, 0.01568628, 0, 1, 1,
0.422562, 0.5676899, 1.578442, 0.01960784, 0, 1, 1,
0.4231609, -0.2449063, 3.616691, 0.02745098, 0, 1, 1,
0.4246171, -0.8880681, 2.383723, 0.03137255, 0, 1, 1,
0.4253736, 0.6280347, 0.3791974, 0.03921569, 0, 1, 1,
0.4275861, -0.5618601, 2.997079, 0.04313726, 0, 1, 1,
0.4276595, -0.00513509, 1.303434, 0.05098039, 0, 1, 1,
0.4331332, 1.583108, -0.1245001, 0.05490196, 0, 1, 1,
0.4339296, 1.059425, 1.892417, 0.0627451, 0, 1, 1,
0.4392947, -0.6109675, 2.658068, 0.06666667, 0, 1, 1,
0.4415666, 1.305462, -1.290326, 0.07450981, 0, 1, 1,
0.4434718, -0.07541618, -1.075598, 0.07843138, 0, 1, 1,
0.4455668, -0.3700027, 1.05552, 0.08627451, 0, 1, 1,
0.4510905, -0.525645, 2.269634, 0.09019608, 0, 1, 1,
0.4547788, 1.812971, 1.842474, 0.09803922, 0, 1, 1,
0.4591793, -0.09517367, 2.613818, 0.1058824, 0, 1, 1,
0.4706796, -0.5872989, 3.95338, 0.1098039, 0, 1, 1,
0.4730605, -0.4379927, 0.493306, 0.1176471, 0, 1, 1,
0.4775328, 0.2749408, 1.112404, 0.1215686, 0, 1, 1,
0.4794489, -0.187072, 1.413741, 0.1294118, 0, 1, 1,
0.4805241, -0.02266525, 1.928406, 0.1333333, 0, 1, 1,
0.5004587, -1.171525, 3.623845, 0.1411765, 0, 1, 1,
0.5051042, 0.6476164, -0.07387958, 0.145098, 0, 1, 1,
0.5061097, 0.6202396, -0.5801459, 0.1529412, 0, 1, 1,
0.5097025, 0.5231193, 1.952932, 0.1568628, 0, 1, 1,
0.5135657, -1.098484, 2.089514, 0.1647059, 0, 1, 1,
0.5227623, -0.1804036, 2.243099, 0.1686275, 0, 1, 1,
0.5256921, 0.8630975, 0.4707408, 0.1764706, 0, 1, 1,
0.5268129, 0.8447755, -0.8849782, 0.1803922, 0, 1, 1,
0.5269501, -0.1840687, 1.553103, 0.1882353, 0, 1, 1,
0.5309194, -0.8058823, 2.254332, 0.1921569, 0, 1, 1,
0.5408523, 3.207324, -0.6544122, 0.2, 0, 1, 1,
0.5446623, 0.01271424, -0.151516, 0.2078431, 0, 1, 1,
0.5465961, -0.3020771, 1.206793, 0.2117647, 0, 1, 1,
0.5504732, -0.08498421, 0.3094608, 0.2196078, 0, 1, 1,
0.5513049, -0.6508592, 2.166557, 0.2235294, 0, 1, 1,
0.553346, 0.8019704, 0.9802122, 0.2313726, 0, 1, 1,
0.5558814, 0.2158119, 0.7459398, 0.2352941, 0, 1, 1,
0.5572775, 0.5206605, 1.386822, 0.2431373, 0, 1, 1,
0.5608394, 0.2886791, -0.02393273, 0.2470588, 0, 1, 1,
0.5628951, -1.363766, 3.854279, 0.254902, 0, 1, 1,
0.5654008, -0.9307427, 4.53493, 0.2588235, 0, 1, 1,
0.5675564, -0.9205068, 2.48143, 0.2666667, 0, 1, 1,
0.5677097, 1.006129, 0.02218619, 0.2705882, 0, 1, 1,
0.5733052, -0.6863379, 3.225229, 0.2784314, 0, 1, 1,
0.5734225, -0.3800573, 1.645719, 0.282353, 0, 1, 1,
0.5734267, -0.7210488, 4.285737, 0.2901961, 0, 1, 1,
0.5801858, 1.559602, 0.9882262, 0.2941177, 0, 1, 1,
0.5823498, 0.3618037, 1.152713, 0.3019608, 0, 1, 1,
0.5849569, 0.8822648, 0.9141401, 0.3098039, 0, 1, 1,
0.5861307, -0.08833188, 2.401646, 0.3137255, 0, 1, 1,
0.5880232, -1.473175, 2.4437, 0.3215686, 0, 1, 1,
0.5919779, 1.274318, 2.550344, 0.3254902, 0, 1, 1,
0.597365, -0.7759058, 2.190113, 0.3333333, 0, 1, 1,
0.5975149, 0.1948639, 1.661416, 0.3372549, 0, 1, 1,
0.6047223, 0.7112759, 1.199667, 0.345098, 0, 1, 1,
0.6071457, -0.5469612, 2.028613, 0.3490196, 0, 1, 1,
0.6097633, 1.351719, 0.4970969, 0.3568628, 0, 1, 1,
0.614306, -1.377546, 2.304482, 0.3607843, 0, 1, 1,
0.6144377, -1.325603, 3.612184, 0.3686275, 0, 1, 1,
0.6155311, -0.9267439, 2.001589, 0.372549, 0, 1, 1,
0.6155763, 1.298754, 0.3324888, 0.3803922, 0, 1, 1,
0.6168935, -0.0766072, 1.936899, 0.3843137, 0, 1, 1,
0.6169178, 1.091523, 1.963228, 0.3921569, 0, 1, 1,
0.6177225, 0.5601625, 0.8153143, 0.3960784, 0, 1, 1,
0.6235582, 0.04531705, 0.9615059, 0.4039216, 0, 1, 1,
0.6250415, 0.9860165, -0.7404215, 0.4117647, 0, 1, 1,
0.6250528, -0.3749293, 2.154832, 0.4156863, 0, 1, 1,
0.6266444, -1.400009, 0.3724609, 0.4235294, 0, 1, 1,
0.6266718, -0.561865, 3.690214, 0.427451, 0, 1, 1,
0.626688, 0.3468684, 1.726006, 0.4352941, 0, 1, 1,
0.628746, -1.250365, 2.965748, 0.4392157, 0, 1, 1,
0.631372, 0.2384395, 1.309947, 0.4470588, 0, 1, 1,
0.6364295, 0.9537459, 2.195298, 0.4509804, 0, 1, 1,
0.6483665, -1.438201, 3.325268, 0.4588235, 0, 1, 1,
0.6539278, 0.0586626, 0.9733502, 0.4627451, 0, 1, 1,
0.6546615, -0.5346392, 2.820091, 0.4705882, 0, 1, 1,
0.6561539, 0.6245812, 0.8778183, 0.4745098, 0, 1, 1,
0.6609184, -0.05257938, 1.289568, 0.4823529, 0, 1, 1,
0.663552, 0.4733771, 1.047374, 0.4862745, 0, 1, 1,
0.6702196, -0.9099801, 2.531391, 0.4941176, 0, 1, 1,
0.6710526, 0.3900883, 1.270835, 0.5019608, 0, 1, 1,
0.6752239, 1.978524, -0.07773101, 0.5058824, 0, 1, 1,
0.6762991, 1.210285, 2.162995, 0.5137255, 0, 1, 1,
0.6802971, -0.5843397, 1.842201, 0.5176471, 0, 1, 1,
0.6946884, 0.6636423, 1.940913, 0.5254902, 0, 1, 1,
0.6969951, 0.1305301, 1.891782, 0.5294118, 0, 1, 1,
0.6997743, -0.8164851, 2.090604, 0.5372549, 0, 1, 1,
0.701022, -0.02390528, 1.551675, 0.5411765, 0, 1, 1,
0.7011296, 0.5971124, 2.353294, 0.5490196, 0, 1, 1,
0.7049932, -1.282638, 2.377581, 0.5529412, 0, 1, 1,
0.706057, 0.5312229, 0.7167731, 0.5607843, 0, 1, 1,
0.7060989, 0.7789133, 0.2157633, 0.5647059, 0, 1, 1,
0.7072827, 1.700744, 1.709031, 0.572549, 0, 1, 1,
0.7093956, 0.6181482, 0.7251477, 0.5764706, 0, 1, 1,
0.7142805, 0.843709, 1.270364, 0.5843138, 0, 1, 1,
0.7173353, 1.357256, 0.03093147, 0.5882353, 0, 1, 1,
0.7179835, 0.1144827, 1.236846, 0.5960785, 0, 1, 1,
0.7226539, -0.2801982, 1.864385, 0.6039216, 0, 1, 1,
0.7253639, -1.926248, 1.952004, 0.6078432, 0, 1, 1,
0.7275454, -1.16496, 2.592126, 0.6156863, 0, 1, 1,
0.7339835, -0.9416069, 3.093813, 0.6196079, 0, 1, 1,
0.7368508, -0.08605959, 2.606215, 0.627451, 0, 1, 1,
0.7418049, -2.479469, 3.749872, 0.6313726, 0, 1, 1,
0.7424064, 0.5038661, 1.355336, 0.6392157, 0, 1, 1,
0.7446769, 0.1795345, 1.26567, 0.6431373, 0, 1, 1,
0.7480513, -1.570086, 2.061302, 0.6509804, 0, 1, 1,
0.7491531, -0.002535292, 2.853587, 0.654902, 0, 1, 1,
0.7507506, 1.282069, -1.08712, 0.6627451, 0, 1, 1,
0.7527309, -0.9282874, 2.023499, 0.6666667, 0, 1, 1,
0.7565087, -1.490431, 2.731888, 0.6745098, 0, 1, 1,
0.7602682, 0.1475169, -0.1808739, 0.6784314, 0, 1, 1,
0.7607036, -0.1801511, 1.462651, 0.6862745, 0, 1, 1,
0.7632007, -0.3538244, 3.049336, 0.6901961, 0, 1, 1,
0.764916, 0.4604838, 1.364556, 0.6980392, 0, 1, 1,
0.7666132, -2.755553, 3.204085, 0.7058824, 0, 1, 1,
0.768096, 1.211781, -0.1906358, 0.7098039, 0, 1, 1,
0.768365, -1.085777, 3.266187, 0.7176471, 0, 1, 1,
0.7775379, -0.5284157, 3.62634, 0.7215686, 0, 1, 1,
0.7867604, 1.441747, 1.390264, 0.7294118, 0, 1, 1,
0.7970172, -0.1632082, 1.3626, 0.7333333, 0, 1, 1,
0.8025737, 0.8884595, 0.6279466, 0.7411765, 0, 1, 1,
0.8054485, -1.209161, 5.588573, 0.7450981, 0, 1, 1,
0.8073969, -0.2526808, 2.165058, 0.7529412, 0, 1, 1,
0.8083623, -0.8246325, 2.677389, 0.7568628, 0, 1, 1,
0.8083768, 0.9696202, 1.129942, 0.7647059, 0, 1, 1,
0.8145967, 1.552323, -0.3632223, 0.7686275, 0, 1, 1,
0.8146537, -0.0944358, 0.5402539, 0.7764706, 0, 1, 1,
0.8152016, 1.457459, 1.520107, 0.7803922, 0, 1, 1,
0.8155135, -0.4866612, 1.398659, 0.7882353, 0, 1, 1,
0.8224363, 0.596472, -0.4318625, 0.7921569, 0, 1, 1,
0.8234716, 0.07582038, 0.9133328, 0.8, 0, 1, 1,
0.8269891, -2.172555, 2.807843, 0.8078431, 0, 1, 1,
0.8289129, -0.4366386, 2.125996, 0.8117647, 0, 1, 1,
0.8304473, -0.2400398, 1.395531, 0.8196079, 0, 1, 1,
0.8324066, -0.5708212, 1.289266, 0.8235294, 0, 1, 1,
0.8373447, -1.58777, 1.482525, 0.8313726, 0, 1, 1,
0.845102, -0.5230462, 2.562678, 0.8352941, 0, 1, 1,
0.8501172, 0.09859038, 1.784367, 0.8431373, 0, 1, 1,
0.8562719, 0.05178653, 0.7520248, 0.8470588, 0, 1, 1,
0.8593212, -0.3286475, 1.369609, 0.854902, 0, 1, 1,
0.8597465, -1.332335, 2.960876, 0.8588235, 0, 1, 1,
0.8864202, -0.8101422, 3.231977, 0.8666667, 0, 1, 1,
0.8881789, -0.7995984, 2.493784, 0.8705882, 0, 1, 1,
0.8882589, 0.8200502, 1.456237, 0.8784314, 0, 1, 1,
0.8903884, 1.103812, -0.5011162, 0.8823529, 0, 1, 1,
0.9036038, -0.5982175, 0.9827493, 0.8901961, 0, 1, 1,
0.909202, 0.06747827, 2.862803, 0.8941177, 0, 1, 1,
0.9114707, 0.01727016, 1.586287, 0.9019608, 0, 1, 1,
0.9129571, -0.6911737, 1.86238, 0.9098039, 0, 1, 1,
0.9163938, -1.711738, 1.386064, 0.9137255, 0, 1, 1,
0.9193514, -1.219637, 2.704733, 0.9215686, 0, 1, 1,
0.9279894, -0.2328956, 1.234634, 0.9254902, 0, 1, 1,
0.9313987, -0.08262163, 1.290308, 0.9333333, 0, 1, 1,
0.9335218, 0.5234181, 1.836679, 0.9372549, 0, 1, 1,
0.9357638, -0.3305749, 3.292095, 0.945098, 0, 1, 1,
0.93786, -1.281713, 2.140222, 0.9490196, 0, 1, 1,
0.9403825, 0.8318709, 0.3951157, 0.9568627, 0, 1, 1,
0.9449188, -0.9342157, 2.985742, 0.9607843, 0, 1, 1,
0.9485252, 0.4193313, 1.72288, 0.9686275, 0, 1, 1,
0.9552109, -0.9862233, 2.479733, 0.972549, 0, 1, 1,
0.958637, 0.5871791, -0.1038214, 0.9803922, 0, 1, 1,
0.9679287, -0.5336591, 3.299991, 0.9843137, 0, 1, 1,
0.9754464, 0.6316767, 1.318137, 0.9921569, 0, 1, 1,
0.9758351, 0.9283879, -0.04799476, 0.9960784, 0, 1, 1,
0.9830498, 0.4241404, 1.884741, 1, 0, 0.9960784, 1,
0.9876285, -0.2738312, 0.5611767, 1, 0, 0.9882353, 1,
0.995541, 0.2718229, 0.8861837, 1, 0, 0.9843137, 1,
0.9984412, -0.4817597, 2.26228, 1, 0, 0.9764706, 1,
1.002878, -1.013256, 3.763812, 1, 0, 0.972549, 1,
1.003418, -0.8093563, 2.19762, 1, 0, 0.9647059, 1,
1.009952, -1.500092, 2.597589, 1, 0, 0.9607843, 1,
1.016822, 0.4672183, 0.7704694, 1, 0, 0.9529412, 1,
1.02211, -1.393963, 1.06437, 1, 0, 0.9490196, 1,
1.023641, 0.773222, 1.519734, 1, 0, 0.9411765, 1,
1.024315, 1.878871, -1.00148, 1, 0, 0.9372549, 1,
1.029807, 1.014948, 2.153556, 1, 0, 0.9294118, 1,
1.029973, 0.2908319, 0.9488254, 1, 0, 0.9254902, 1,
1.036258, 1.212998, -0.5636756, 1, 0, 0.9176471, 1,
1.038905, 0.2358407, 0.9491407, 1, 0, 0.9137255, 1,
1.055371, 0.6823562, 0.4825061, 1, 0, 0.9058824, 1,
1.057366, -1.878431, 3.256064, 1, 0, 0.9019608, 1,
1.060458, 0.1587573, 2.093277, 1, 0, 0.8941177, 1,
1.060492, 1.174845, 1.181435, 1, 0, 0.8862745, 1,
1.066631, 0.1473539, 0.154065, 1, 0, 0.8823529, 1,
1.082779, 0.4682223, 1.479985, 1, 0, 0.8745098, 1,
1.084255, 0.5182233, 1.31986, 1, 0, 0.8705882, 1,
1.085599, 0.1616403, 0.2905359, 1, 0, 0.8627451, 1,
1.097188, -0.01786753, 2.373257, 1, 0, 0.8588235, 1,
1.097905, -0.08521119, 1.989433, 1, 0, 0.8509804, 1,
1.099586, 0.6365373, 2.302427, 1, 0, 0.8470588, 1,
1.100564, 0.3670279, 2.324677, 1, 0, 0.8392157, 1,
1.105258, -0.7265961, 1.254896, 1, 0, 0.8352941, 1,
1.105281, -1.319813, 1.204708, 1, 0, 0.827451, 1,
1.108442, -2.921491, 1.742885, 1, 0, 0.8235294, 1,
1.109615, -1.605282, 2.459664, 1, 0, 0.8156863, 1,
1.112951, 1.118285, 2.383878, 1, 0, 0.8117647, 1,
1.113965, -0.4444412, 0.8408822, 1, 0, 0.8039216, 1,
1.122014, -2.008351, 2.787758, 1, 0, 0.7960784, 1,
1.131539, 1.163455, 0.634603, 1, 0, 0.7921569, 1,
1.132283, 0.4344267, 0.6879045, 1, 0, 0.7843137, 1,
1.133499, 1.819821, -0.03521981, 1, 0, 0.7803922, 1,
1.139471, 0.564541, 0.8514, 1, 0, 0.772549, 1,
1.140554, -0.3429427, 2.252245, 1, 0, 0.7686275, 1,
1.145643, -0.09609448, 1.758947, 1, 0, 0.7607843, 1,
1.14834, 0.1832636, 3.770936, 1, 0, 0.7568628, 1,
1.149062, -0.6831734, 1.724328, 1, 0, 0.7490196, 1,
1.149879, 0.9909926, 1.071888, 1, 0, 0.7450981, 1,
1.150163, -0.4169846, 2.887414, 1, 0, 0.7372549, 1,
1.151576, 0.5199044, 0.8469626, 1, 0, 0.7333333, 1,
1.152869, -0.843529, 1.145981, 1, 0, 0.7254902, 1,
1.154846, -0.5346137, 0.3052639, 1, 0, 0.7215686, 1,
1.155897, -1.000904, 2.820893, 1, 0, 0.7137255, 1,
1.158097, 0.6863915, 1.047821, 1, 0, 0.7098039, 1,
1.160462, -0.2664208, 2.32997, 1, 0, 0.7019608, 1,
1.164043, 0.1384682, 0.3264554, 1, 0, 0.6941177, 1,
1.165068, -0.3840376, 1.499275, 1, 0, 0.6901961, 1,
1.179665, -0.4902644, 1.816737, 1, 0, 0.682353, 1,
1.18256, 0.1170557, 1.101308, 1, 0, 0.6784314, 1,
1.182646, 0.8066678, -0.05059489, 1, 0, 0.6705883, 1,
1.187902, -1.779473, 1.948108, 1, 0, 0.6666667, 1,
1.217009, 0.9593007, 0.2960829, 1, 0, 0.6588235, 1,
1.217542, 1.191786, -0.3258315, 1, 0, 0.654902, 1,
1.219478, -1.26065, 1.603947, 1, 0, 0.6470588, 1,
1.219887, 2.228172, 0.5840615, 1, 0, 0.6431373, 1,
1.221671, -0.3578822, 3.384244, 1, 0, 0.6352941, 1,
1.221817, -1.119078, 2.040688, 1, 0, 0.6313726, 1,
1.226622, -1.147644, 2.455867, 1, 0, 0.6235294, 1,
1.232048, -1.319703, 3.715916, 1, 0, 0.6196079, 1,
1.232695, -0.8195184, 3.513462, 1, 0, 0.6117647, 1,
1.234747, -0.2896713, 0.1260763, 1, 0, 0.6078432, 1,
1.238218, -0.7146559, 3.344151, 1, 0, 0.6, 1,
1.240314, 0.6527454, -0.2171633, 1, 0, 0.5921569, 1,
1.241571, -0.2876137, 1.169252, 1, 0, 0.5882353, 1,
1.245736, 1.59457, 2.152652, 1, 0, 0.5803922, 1,
1.251222, -1.742289, 1.593043, 1, 0, 0.5764706, 1,
1.261096, 1.056488, 2.838331, 1, 0, 0.5686275, 1,
1.265783, -0.03241411, 0.6835009, 1, 0, 0.5647059, 1,
1.269804, -0.4017809, 0.4304411, 1, 0, 0.5568628, 1,
1.271612, -0.8020303, 2.843, 1, 0, 0.5529412, 1,
1.272124, -1.138801, 2.984408, 1, 0, 0.5450981, 1,
1.272886, -0.677247, 2.171129, 1, 0, 0.5411765, 1,
1.279222, -0.05374322, 1.863844, 1, 0, 0.5333334, 1,
1.293593, 0.894936, 1.334674, 1, 0, 0.5294118, 1,
1.29536, 2.369731, 0.4055478, 1, 0, 0.5215687, 1,
1.304025, 0.4683979, 1.231929, 1, 0, 0.5176471, 1,
1.320155, -1.719466, 1.850249, 1, 0, 0.509804, 1,
1.327627, -1.597297, 1.12571, 1, 0, 0.5058824, 1,
1.34615, 0.8251562, 0.2803068, 1, 0, 0.4980392, 1,
1.366967, 0.4864664, 1.897168, 1, 0, 0.4901961, 1,
1.36818, -0.5648749, 1.234969, 1, 0, 0.4862745, 1,
1.370563, 0.8858297, 3.0982, 1, 0, 0.4784314, 1,
1.372833, -1.446675, 2.918543, 1, 0, 0.4745098, 1,
1.381092, -1.298607, 2.099105, 1, 0, 0.4666667, 1,
1.381924, -0.4777116, 0.9464202, 1, 0, 0.4627451, 1,
1.391818, 1.287864, 2.057375, 1, 0, 0.454902, 1,
1.392748, -0.415047, 1.959288, 1, 0, 0.4509804, 1,
1.394499, -0.7663698, 1.185234, 1, 0, 0.4431373, 1,
1.398966, -0.809089, 1.865806, 1, 0, 0.4392157, 1,
1.414104, -0.5156184, 1.88805, 1, 0, 0.4313726, 1,
1.423865, -0.5885154, 0.1503675, 1, 0, 0.427451, 1,
1.424324, 0.464947, 0.8312486, 1, 0, 0.4196078, 1,
1.428017, -1.428201, 1.716956, 1, 0, 0.4156863, 1,
1.430601, -1.862488, 1.131003, 1, 0, 0.4078431, 1,
1.442379, -0.7551638, 2.126971, 1, 0, 0.4039216, 1,
1.449667, -0.5782653, 2.649381, 1, 0, 0.3960784, 1,
1.452552, 0.03383672, 3.750609, 1, 0, 0.3882353, 1,
1.466511, -0.2728591, 0.6068144, 1, 0, 0.3843137, 1,
1.467749, 0.684782, 2.384796, 1, 0, 0.3764706, 1,
1.475731, 0.6289728, 0.04676102, 1, 0, 0.372549, 1,
1.483665, 1.622138, 0.98809, 1, 0, 0.3647059, 1,
1.483753, 0.2906068, 0.6494604, 1, 0, 0.3607843, 1,
1.483866, -0.459356, 1.525059, 1, 0, 0.3529412, 1,
1.495948, -0.1936873, 1.572592, 1, 0, 0.3490196, 1,
1.503789, 0.10295, 1.571073, 1, 0, 0.3411765, 1,
1.510123, -1.040004, 3.195206, 1, 0, 0.3372549, 1,
1.512669, 2.054638, 0.1921615, 1, 0, 0.3294118, 1,
1.53371, -0.379593, 2.047023, 1, 0, 0.3254902, 1,
1.536504, -0.1879856, 1.59937, 1, 0, 0.3176471, 1,
1.545362, -0.2400443, 1.949652, 1, 0, 0.3137255, 1,
1.55909, -2.047397, 4.463986, 1, 0, 0.3058824, 1,
1.559348, -0.8857259, 2.205595, 1, 0, 0.2980392, 1,
1.567161, -0.8771414, 1.592561, 1, 0, 0.2941177, 1,
1.575267, -1.241933, 2.628451, 1, 0, 0.2862745, 1,
1.57883, -1.817985, 3.235083, 1, 0, 0.282353, 1,
1.587456, -0.1590398, 1.490788, 1, 0, 0.2745098, 1,
1.58821, 0.3563993, -1.05859, 1, 0, 0.2705882, 1,
1.608272, 0.2488649, 2.302534, 1, 0, 0.2627451, 1,
1.608386, 0.1969358, 0.3605961, 1, 0, 0.2588235, 1,
1.610664, 0.2369212, 2.740853, 1, 0, 0.2509804, 1,
1.626995, 0.4928558, 1.394745, 1, 0, 0.2470588, 1,
1.649624, 0.545079, -0.09709468, 1, 0, 0.2392157, 1,
1.651466, 1.132054, 0.7116027, 1, 0, 0.2352941, 1,
1.653722, 0.4968943, 1.825099, 1, 0, 0.227451, 1,
1.656823, 0.550229, 2.780474, 1, 0, 0.2235294, 1,
1.673216, 0.3423359, 2.266901, 1, 0, 0.2156863, 1,
1.677518, -2.120148, 1.972623, 1, 0, 0.2117647, 1,
1.679978, 0.1925947, 0.4214278, 1, 0, 0.2039216, 1,
1.708237, -1.352482, 1.824234, 1, 0, 0.1960784, 1,
1.72793, -0.5165474, 1.076921, 1, 0, 0.1921569, 1,
1.734964, -1.101135, 1.40138, 1, 0, 0.1843137, 1,
1.761381, -0.05426415, 2.375281, 1, 0, 0.1803922, 1,
1.777159, -0.08801602, 0.8649656, 1, 0, 0.172549, 1,
1.798974, -0.8731096, 1.03006, 1, 0, 0.1686275, 1,
1.808994, 0.8245191, 1.403935, 1, 0, 0.1607843, 1,
1.811593, 1.150669, -0.1244472, 1, 0, 0.1568628, 1,
1.814803, 0.4609234, 1.348459, 1, 0, 0.1490196, 1,
1.81639, 0.6633528, -0.5507191, 1, 0, 0.145098, 1,
1.852146, 0.6251552, 2.291272, 1, 0, 0.1372549, 1,
1.86838, -0.0542846, 4.514163, 1, 0, 0.1333333, 1,
1.878738, -1.050588, 3.060222, 1, 0, 0.1254902, 1,
1.879469, -0.4206122, 2.012605, 1, 0, 0.1215686, 1,
1.907137, 0.03265189, 1.491307, 1, 0, 0.1137255, 1,
1.946025, -0.2405542, 1.219979, 1, 0, 0.1098039, 1,
1.974298, 1.305527, 1.184417, 1, 0, 0.1019608, 1,
2.011765, -0.6448241, 2.165326, 1, 0, 0.09411765, 1,
2.084102, 1.203856, 1.000068, 1, 0, 0.09019608, 1,
2.089986, 1.787939, -0.1385084, 1, 0, 0.08235294, 1,
2.099836, 0.1694944, 1.054317, 1, 0, 0.07843138, 1,
2.178756, -0.6735087, 1.616625, 1, 0, 0.07058824, 1,
2.207144, -0.3570195, 1.077804, 1, 0, 0.06666667, 1,
2.252346, 0.5785117, 1.613107, 1, 0, 0.05882353, 1,
2.270683, -0.309061, 0.8331507, 1, 0, 0.05490196, 1,
2.382367, 1.438138, 1.629952, 1, 0, 0.04705882, 1,
2.460926, 0.1426648, 1.821711, 1, 0, 0.04313726, 1,
2.462748, 0.7368569, 1.083889, 1, 0, 0.03529412, 1,
2.488156, -0.4702964, 1.130886, 1, 0, 0.03137255, 1,
2.626827, -1.77947, 2.751954, 1, 0, 0.02352941, 1,
2.641992, 1.264087, 0.7573496, 1, 0, 0.01960784, 1,
2.752713, -0.5456581, 1.3798, 1, 0, 0.01176471, 1,
3.490316, -0.1791723, 0.4146632, 1, 0, 0.007843138, 1
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
0.2043697, -4.128805, -7.199378, 0, -0.5, 0.5, 0.5,
0.2043697, -4.128805, -7.199378, 1, -0.5, 0.5, 0.5,
0.2043697, -4.128805, -7.199378, 1, 1.5, 0.5, 0.5,
0.2043697, -4.128805, -7.199378, 0, 1.5, 0.5, 0.5
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
-4.195512, 0.4299369, -7.199378, 0, -0.5, 0.5, 0.5,
-4.195512, 0.4299369, -7.199378, 1, -0.5, 0.5, 0.5,
-4.195512, 0.4299369, -7.199378, 1, 1.5, 0.5, 0.5,
-4.195512, 0.4299369, -7.199378, 0, 1.5, 0.5, 0.5
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
-4.195512, -4.128805, 0.1212997, 0, -0.5, 0.5, 0.5,
-4.195512, -4.128805, 0.1212997, 1, -0.5, 0.5, 0.5,
-4.195512, -4.128805, 0.1212997, 1, 1.5, 0.5, 0.5,
-4.195512, -4.128805, 0.1212997, 0, 1.5, 0.5, 0.5
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
-3, -3.076788, -5.509991,
3, -3.076788, -5.509991,
-3, -3.076788, -5.509991,
-3, -3.252124, -5.791556,
-2, -3.076788, -5.509991,
-2, -3.252124, -5.791556,
-1, -3.076788, -5.509991,
-1, -3.252124, -5.791556,
0, -3.076788, -5.509991,
0, -3.252124, -5.791556,
1, -3.076788, -5.509991,
1, -3.252124, -5.791556,
2, -3.076788, -5.509991,
2, -3.252124, -5.791556,
3, -3.076788, -5.509991,
3, -3.252124, -5.791556
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
-3, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
-3, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
-3, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
-3, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
-2, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
-2, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
-2, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
-2, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
-1, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
-1, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
-1, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
-1, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
0, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
0, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
0, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
0, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
1, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
1, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
1, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
1, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
2, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
2, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
2, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
2, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5,
3, -3.602797, -6.354685, 0, -0.5, 0.5, 0.5,
3, -3.602797, -6.354685, 1, -0.5, 0.5, 0.5,
3, -3.602797, -6.354685, 1, 1.5, 0.5, 0.5,
3, -3.602797, -6.354685, 0, 1.5, 0.5, 0.5
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
-3.180155, -2, -5.509991,
-3.180155, 3, -5.509991,
-3.180155, -2, -5.509991,
-3.349381, -2, -5.791556,
-3.180155, -1, -5.509991,
-3.349381, -1, -5.791556,
-3.180155, 0, -5.509991,
-3.349381, 0, -5.791556,
-3.180155, 1, -5.509991,
-3.349381, 1, -5.791556,
-3.180155, 2, -5.509991,
-3.349381, 2, -5.791556,
-3.180155, 3, -5.509991,
-3.349381, 3, -5.791556
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
-3.687833, -2, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, -2, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, -2, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, -2, -6.354685, 0, 1.5, 0.5, 0.5,
-3.687833, -1, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, -1, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, -1, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, -1, -6.354685, 0, 1.5, 0.5, 0.5,
-3.687833, 0, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, 0, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, 0, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, 0, -6.354685, 0, 1.5, 0.5, 0.5,
-3.687833, 1, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, 1, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, 1, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, 1, -6.354685, 0, 1.5, 0.5, 0.5,
-3.687833, 2, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, 2, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, 2, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, 2, -6.354685, 0, 1.5, 0.5, 0.5,
-3.687833, 3, -6.354685, 0, -0.5, 0.5, 0.5,
-3.687833, 3, -6.354685, 1, -0.5, 0.5, 0.5,
-3.687833, 3, -6.354685, 1, 1.5, 0.5, 0.5,
-3.687833, 3, -6.354685, 0, 1.5, 0.5, 0.5
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
-3.180155, -3.076788, -4,
-3.180155, -3.076788, 4,
-3.180155, -3.076788, -4,
-3.349381, -3.252124, -4,
-3.180155, -3.076788, -2,
-3.349381, -3.252124, -2,
-3.180155, -3.076788, 0,
-3.349381, -3.252124, 0,
-3.180155, -3.076788, 2,
-3.349381, -3.252124, 2,
-3.180155, -3.076788, 4,
-3.349381, -3.252124, 4
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
-3.687833, -3.602797, -4, 0, -0.5, 0.5, 0.5,
-3.687833, -3.602797, -4, 1, -0.5, 0.5, 0.5,
-3.687833, -3.602797, -4, 1, 1.5, 0.5, 0.5,
-3.687833, -3.602797, -4, 0, 1.5, 0.5, 0.5,
-3.687833, -3.602797, -2, 0, -0.5, 0.5, 0.5,
-3.687833, -3.602797, -2, 1, -0.5, 0.5, 0.5,
-3.687833, -3.602797, -2, 1, 1.5, 0.5, 0.5,
-3.687833, -3.602797, -2, 0, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 0, 0, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 0, 1, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 0, 1, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 0, 0, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 2, 0, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 2, 1, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 2, 1, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 2, 0, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 4, 0, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 4, 1, -0.5, 0.5, 0.5,
-3.687833, -3.602797, 4, 1, 1.5, 0.5, 0.5,
-3.687833, -3.602797, 4, 0, 1.5, 0.5, 0.5
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
-3.180155, -3.076788, -5.509991,
-3.180155, 3.936661, -5.509991,
-3.180155, -3.076788, 5.752591,
-3.180155, 3.936661, 5.752591,
-3.180155, -3.076788, -5.509991,
-3.180155, -3.076788, 5.752591,
-3.180155, 3.936661, -5.509991,
-3.180155, 3.936661, 5.752591,
-3.180155, -3.076788, -5.509991,
3.588894, -3.076788, -5.509991,
-3.180155, -3.076788, 5.752591,
3.588894, -3.076788, 5.752591,
-3.180155, 3.936661, -5.509991,
3.588894, 3.936661, -5.509991,
-3.180155, 3.936661, 5.752591,
3.588894, 3.936661, 5.752591,
3.588894, -3.076788, -5.509991,
3.588894, 3.936661, -5.509991,
3.588894, -3.076788, 5.752591,
3.588894, 3.936661, 5.752591,
3.588894, -3.076788, -5.509991,
3.588894, -3.076788, 5.752591,
3.588894, 3.936661, -5.509991,
3.588894, 3.936661, 5.752591
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
var radius = 7.953519;
var distance = 35.3861;
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
mvMatrix.translate( -0.2043697, -0.4299369, -0.1212997 );
mvMatrix.scale( 1.270415, 1.226144, 0.7635461 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.3861);
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
toluate_tert-butyl<-read.table("toluate_tert-butyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-toluate_tert-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
y<-toluate_tert-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
```

```r
z<-toluate_tert-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'toluate_tert' not found
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
-3.081576, 1.591418, -0.649586, 0, 0, 1, 1, 1,
-2.861692, -0.5650684, -0.5450405, 1, 0, 0, 1, 1,
-2.799116, 1.095246, -0.0131493, 1, 0, 0, 1, 1,
-2.624584, -0.4132767, 0.01008431, 1, 0, 0, 1, 1,
-2.5157, 1.036442, -0.3752528, 1, 0, 0, 1, 1,
-2.50375, 0.6751295, -1.505318, 1, 0, 0, 1, 1,
-2.368266, 0.2653238, -2.844371, 0, 0, 0, 1, 1,
-2.346298, -0.7535056, -2.899349, 0, 0, 0, 1, 1,
-2.217597, -0.4282224, -2.701154, 0, 0, 0, 1, 1,
-2.202472, 1.335929, -0.7759103, 0, 0, 0, 1, 1,
-2.193654, -0.830746, -3.805913, 0, 0, 0, 1, 1,
-2.114819, -0.4266134, -1.567471, 0, 0, 0, 1, 1,
-2.109243, 1.180957, -0.5179758, 0, 0, 0, 1, 1,
-2.079214, 0.8345712, -1.729885, 1, 1, 1, 1, 1,
-2.070882, 0.5834116, -0.9911467, 1, 1, 1, 1, 1,
-2.042228, -1.300972, -2.635067, 1, 1, 1, 1, 1,
-2.025715, 0.416811, -0.1237663, 1, 1, 1, 1, 1,
-2.011686, 1.165026, -0.2758132, 1, 1, 1, 1, 1,
-2.00959, -0.9559026, -2.357879, 1, 1, 1, 1, 1,
-1.977712, 1.026285, -1.50868, 1, 1, 1, 1, 1,
-1.97458, -0.05113418, -3.699291, 1, 1, 1, 1, 1,
-1.962906, 0.3422053, -0.2262383, 1, 1, 1, 1, 1,
-1.953961, -0.4422979, -2.336124, 1, 1, 1, 1, 1,
-1.93917, 1.379891, 0.01114456, 1, 1, 1, 1, 1,
-1.937543, -1.516059, -3.831039, 1, 1, 1, 1, 1,
-1.918041, 0.4758923, -2.478047, 1, 1, 1, 1, 1,
-1.914091, 0.533565, -1.982782, 1, 1, 1, 1, 1,
-1.890303, 1.117646, -0.242677, 1, 1, 1, 1, 1,
-1.890243, 0.3809707, 0.1014337, 0, 0, 1, 1, 1,
-1.877478, 0.00651772, -0.3861704, 1, 0, 0, 1, 1,
-1.843601, -0.1871047, -1.979163, 1, 0, 0, 1, 1,
-1.834937, 0.078934, -1.586506, 1, 0, 0, 1, 1,
-1.825572, -0.7291673, -1.961375, 1, 0, 0, 1, 1,
-1.815311, 0.4477244, -2.032605, 1, 0, 0, 1, 1,
-1.802872, 0.6355944, -3.424644, 0, 0, 0, 1, 1,
-1.784549, -0.5101875, -3.43607, 0, 0, 0, 1, 1,
-1.77907, 0.08864141, -0.5845669, 0, 0, 0, 1, 1,
-1.776087, 0.9455212, -0.2641386, 0, 0, 0, 1, 1,
-1.767327, 1.764041, -0.7492914, 0, 0, 0, 1, 1,
-1.754796, -0.7405069, -2.478803, 0, 0, 0, 1, 1,
-1.723115, -0.1385292, -1.33545, 0, 0, 0, 1, 1,
-1.675573, 0.2861004, 0.2624189, 1, 1, 1, 1, 1,
-1.669251, -1.377788, -1.776177, 1, 1, 1, 1, 1,
-1.661347, 0.6091037, 0.0663361, 1, 1, 1, 1, 1,
-1.66041, -0.3685378, -2.093424, 1, 1, 1, 1, 1,
-1.654001, -0.0485192, -1.56183, 1, 1, 1, 1, 1,
-1.646176, 0.1040049, -1.505089, 1, 1, 1, 1, 1,
-1.644081, 0.686304, -2.628416, 1, 1, 1, 1, 1,
-1.610459, -0.4004045, -1.651043, 1, 1, 1, 1, 1,
-1.602296, -0.3621015, -1.063674, 1, 1, 1, 1, 1,
-1.580232, -0.5992292, -0.0829875, 1, 1, 1, 1, 1,
-1.579649, -0.2793572, -1.743529, 1, 1, 1, 1, 1,
-1.571928, 1.08291, 0.09837453, 1, 1, 1, 1, 1,
-1.569323, -0.1915392, -0.4841521, 1, 1, 1, 1, 1,
-1.560258, -0.7599214, -2.049081, 1, 1, 1, 1, 1,
-1.557555, 0.1681681, -1.22623, 1, 1, 1, 1, 1,
-1.553853, 1.284912, -0.7128122, 0, 0, 1, 1, 1,
-1.551944, 0.6045812, -2.540804, 1, 0, 0, 1, 1,
-1.539859, -1.090546, -3.089222, 1, 0, 0, 1, 1,
-1.537274, -0.5415246, -3.565331, 1, 0, 0, 1, 1,
-1.534295, -0.04941161, -1.74743, 1, 0, 0, 1, 1,
-1.523736, 1.39044, -0.2444581, 1, 0, 0, 1, 1,
-1.477155, 0.157773, -1.801081, 0, 0, 0, 1, 1,
-1.467283, -0.1569232, -0.9710361, 0, 0, 0, 1, 1,
-1.445583, -1.131233, -1.47195, 0, 0, 0, 1, 1,
-1.443514, 1.565006, -1.099446, 0, 0, 0, 1, 1,
-1.436278, 0.6806403, 0.5396256, 0, 0, 0, 1, 1,
-1.434069, 0.2807008, -0.2091595, 0, 0, 0, 1, 1,
-1.418176, 2.544585, -1.905169, 0, 0, 0, 1, 1,
-1.417595, 0.5043845, 0.3361082, 1, 1, 1, 1, 1,
-1.409372, 0.5812111, -0.3122608, 1, 1, 1, 1, 1,
-1.393758, 0.6327144, -2.685976, 1, 1, 1, 1, 1,
-1.372636, 0.707634, -0.4092976, 1, 1, 1, 1, 1,
-1.372264, -0.3563174, -1.841334, 1, 1, 1, 1, 1,
-1.36507, -0.06029923, 0.2892076, 1, 1, 1, 1, 1,
-1.353849, -0.3840049, -2.575117, 1, 1, 1, 1, 1,
-1.35214, -1.635495, -1.518641, 1, 1, 1, 1, 1,
-1.339922, -0.3279923, -3.661724, 1, 1, 1, 1, 1,
-1.336401, -0.1213582, -1.031797, 1, 1, 1, 1, 1,
-1.334071, -0.1260538, -0.3137832, 1, 1, 1, 1, 1,
-1.330856, -0.5595562, -1.622213, 1, 1, 1, 1, 1,
-1.32847, -0.2020589, -4.452313, 1, 1, 1, 1, 1,
-1.314149, 0.607492, 0.4022494, 1, 1, 1, 1, 1,
-1.309041, -0.03300009, -1.789465, 1, 1, 1, 1, 1,
-1.303977, -0.471932, -2.505863, 0, 0, 1, 1, 1,
-1.285932, 2.777362, 0.3828157, 1, 0, 0, 1, 1,
-1.285656, -0.7323826, -1.626111, 1, 0, 0, 1, 1,
-1.285364, -0.1535786, -1.762908, 1, 0, 0, 1, 1,
-1.277591, 1.162069, -0.2331174, 1, 0, 0, 1, 1,
-1.268967, 0.1896514, -2.301995, 1, 0, 0, 1, 1,
-1.266697, 0.632072, -0.7080582, 0, 0, 0, 1, 1,
-1.259563, -2.279066, -3.308925, 0, 0, 0, 1, 1,
-1.257166, 0.7263321, 1.979139, 0, 0, 0, 1, 1,
-1.249376, -0.6977174, -4.865489, 0, 0, 0, 1, 1,
-1.248841, -2.396786, -2.774563, 0, 0, 0, 1, 1,
-1.248819, 1.854776, -0.7505245, 0, 0, 0, 1, 1,
-1.243132, 0.426996, -0.7057427, 0, 0, 0, 1, 1,
-1.242237, 0.2656684, -0.345054, 1, 1, 1, 1, 1,
-1.241301, -0.3622109, -3.125074, 1, 1, 1, 1, 1,
-1.241115, 2.586772, 0.3282376, 1, 1, 1, 1, 1,
-1.236021, -0.359146, -2.845312, 1, 1, 1, 1, 1,
-1.222861, -0.9864039, -1.806594, 1, 1, 1, 1, 1,
-1.213001, -0.4451953, -0.7814677, 1, 1, 1, 1, 1,
-1.210342, -0.658338, -0.9985144, 1, 1, 1, 1, 1,
-1.201096, -0.6180705, -2.684218, 1, 1, 1, 1, 1,
-1.193094, -0.4547752, -2.837266, 1, 1, 1, 1, 1,
-1.18684, -1.23216, -1.440804, 1, 1, 1, 1, 1,
-1.185709, -0.7423345, -2.085017, 1, 1, 1, 1, 1,
-1.182682, 0.1720436, -2.13478, 1, 1, 1, 1, 1,
-1.174951, 1.213884, 0.3380604, 1, 1, 1, 1, 1,
-1.174094, 0.3308051, -1.565477, 1, 1, 1, 1, 1,
-1.173312, 1.580574, -0.9900032, 1, 1, 1, 1, 1,
-1.166656, 0.7402118, 0.3608262, 0, 0, 1, 1, 1,
-1.162738, -1.4363, -2.369864, 1, 0, 0, 1, 1,
-1.159474, -1.154155, -2.923002, 1, 0, 0, 1, 1,
-1.157321, -1.095564, -0.9902529, 1, 0, 0, 1, 1,
-1.149016, -0.4060604, -2.834431, 1, 0, 0, 1, 1,
-1.140257, 1.423504, -2.465344, 1, 0, 0, 1, 1,
-1.137108, -0.0005232609, -0.3960658, 0, 0, 0, 1, 1,
-1.135344, 0.4375837, -3.268493, 0, 0, 0, 1, 1,
-1.131822, -0.5942121, -2.595509, 0, 0, 0, 1, 1,
-1.127779, 0.3024997, -1.280997, 0, 0, 0, 1, 1,
-1.126924, -0.550805, -2.249507, 0, 0, 0, 1, 1,
-1.117763, -1.655487, -1.277589, 0, 0, 0, 1, 1,
-1.117451, -0.2383934, -2.581237, 0, 0, 0, 1, 1,
-1.117234, 0.1755737, -1.031102, 1, 1, 1, 1, 1,
-1.111425, -0.02584664, -1.955924, 1, 1, 1, 1, 1,
-1.106959, -1.322084, -4.19662, 1, 1, 1, 1, 1,
-1.10398, -0.09487016, -1.026731, 1, 1, 1, 1, 1,
-1.101476, 0.8276554, -1.098275, 1, 1, 1, 1, 1,
-1.101166, -0.2199078, -2.332228, 1, 1, 1, 1, 1,
-1.099249, -0.334404, -1.228305, 1, 1, 1, 1, 1,
-1.095685, -2.338794, -1.501621, 1, 1, 1, 1, 1,
-1.087631, -1.080029, -2.99457, 1, 1, 1, 1, 1,
-1.079067, -0.7262473, -2.189097, 1, 1, 1, 1, 1,
-1.072453, -0.3871327, -2.232152, 1, 1, 1, 1, 1,
-1.070574, -1.964526, -0.8586982, 1, 1, 1, 1, 1,
-1.05429, -2.545914, -2.044684, 1, 1, 1, 1, 1,
-1.04772, 0.5077452, 0.0186463, 1, 1, 1, 1, 1,
-1.040815, 0.2151809, -0.9786754, 1, 1, 1, 1, 1,
-1.039171, 1.684723, 0.3635617, 0, 0, 1, 1, 1,
-1.039054, -0.3855758, -1.514104, 1, 0, 0, 1, 1,
-1.03423, 1.131095, -0.7473773, 1, 0, 0, 1, 1,
-1.033269, -0.0844839, -1.972149, 1, 0, 0, 1, 1,
-1.02984, 1.297831, 0.05576118, 1, 0, 0, 1, 1,
-1.02896, -1.165278, -3.884557, 1, 0, 0, 1, 1,
-1.027644, -1.262441, -4.222881, 0, 0, 0, 1, 1,
-1.025601, -0.8414368, -2.590125, 0, 0, 0, 1, 1,
-1.018293, -1.934694, -2.22252, 0, 0, 0, 1, 1,
-1.015548, -0.8424851, -1.897333, 0, 0, 0, 1, 1,
-1.01383, 0.2821176, -2.626474, 0, 0, 0, 1, 1,
-1.010685, -0.6862577, -1.153312, 0, 0, 0, 1, 1,
-0.9919128, 0.6555699, -1.228011, 0, 0, 0, 1, 1,
-0.9800122, 1.512802, -0.7017338, 1, 1, 1, 1, 1,
-0.9795424, -1.779188, -2.514816, 1, 1, 1, 1, 1,
-0.9710226, 0.9587094, 0.8981066, 1, 1, 1, 1, 1,
-0.9679729, -0.4988013, -3.226259, 1, 1, 1, 1, 1,
-0.9662712, 1.102298, 0.3841853, 1, 1, 1, 1, 1,
-0.954205, 0.2966501, -0.8544315, 1, 1, 1, 1, 1,
-0.9498405, 0.9448982, 0.5480348, 1, 1, 1, 1, 1,
-0.9472803, 0.5702641, -0.3352027, 1, 1, 1, 1, 1,
-0.9450072, -0.4350125, -1.839751, 1, 1, 1, 1, 1,
-0.9442246, 0.3356442, -1.286986, 1, 1, 1, 1, 1,
-0.9439852, -0.8513967, -2.626634, 1, 1, 1, 1, 1,
-0.9432488, -1.609599, -2.115503, 1, 1, 1, 1, 1,
-0.9413335, 0.5145918, -1.501122, 1, 1, 1, 1, 1,
-0.9405107, 0.4968314, -1.747297, 1, 1, 1, 1, 1,
-0.939698, 1.187339, -0.2810006, 1, 1, 1, 1, 1,
-0.937138, -0.8827256, -1.760588, 0, 0, 1, 1, 1,
-0.931246, 0.5677509, -1.763962, 1, 0, 0, 1, 1,
-0.9294224, -0.3418425, -0.755334, 1, 0, 0, 1, 1,
-0.9268982, -1.040974, -1.240786, 1, 0, 0, 1, 1,
-0.9178061, 0.5348983, -0.3136491, 1, 0, 0, 1, 1,
-0.9154743, 1.254066, 0.4785636, 1, 0, 0, 1, 1,
-0.907962, 0.2364326, 0.006611735, 0, 0, 0, 1, 1,
-0.901885, -1.200345, -2.992286, 0, 0, 0, 1, 1,
-0.901884, -0.9176446, -2.562622, 0, 0, 0, 1, 1,
-0.9015028, -0.1367209, -2.62246, 0, 0, 0, 1, 1,
-0.9002328, 0.4041904, -2.407204, 0, 0, 0, 1, 1,
-0.9001976, -0.6254941, -1.638361, 0, 0, 0, 1, 1,
-0.8959176, -0.6214774, -2.605261, 0, 0, 0, 1, 1,
-0.8951525, 0.688812, -0.9993886, 1, 1, 1, 1, 1,
-0.8912432, 0.7896445, -1.716672, 1, 1, 1, 1, 1,
-0.8912342, 0.3906298, -0.2690129, 1, 1, 1, 1, 1,
-0.8901438, 0.7458545, -1.763688, 1, 1, 1, 1, 1,
-0.8881363, 0.4763871, 0.2368616, 1, 1, 1, 1, 1,
-0.8867784, -0.4473202, -1.322192, 1, 1, 1, 1, 1,
-0.8842854, 0.1813559, -0.3437918, 1, 1, 1, 1, 1,
-0.8836539, -1.755914, -3.727492, 1, 1, 1, 1, 1,
-0.8787571, 0.200382, -1.387468, 1, 1, 1, 1, 1,
-0.8786563, -0.300303, -2.343062, 1, 1, 1, 1, 1,
-0.8675386, -0.2307287, -2.079586, 1, 1, 1, 1, 1,
-0.866788, -0.6163653, -2.024243, 1, 1, 1, 1, 1,
-0.8582177, 0.3949997, -0.3522628, 1, 1, 1, 1, 1,
-0.8581866, 0.2753552, 0.5615507, 1, 1, 1, 1, 1,
-0.857541, -0.2250268, -0.8600586, 1, 1, 1, 1, 1,
-0.849234, -0.966251, -1.564345, 0, 0, 1, 1, 1,
-0.8450449, 0.005232105, -2.17706, 1, 0, 0, 1, 1,
-0.8396316, 1.145467, 0.6838852, 1, 0, 0, 1, 1,
-0.8393548, 1.605923, 0.008634456, 1, 0, 0, 1, 1,
-0.8375739, -0.262152, -4.220781, 1, 0, 0, 1, 1,
-0.831937, 1.158528, -0.005450601, 1, 0, 0, 1, 1,
-0.8197682, 0.2042758, -1.751619, 0, 0, 0, 1, 1,
-0.818584, -2.16721, -2.912473, 0, 0, 0, 1, 1,
-0.8181057, 2.605952, -0.5505738, 0, 0, 0, 1, 1,
-0.817274, 1.062111, 0.1960399, 0, 0, 0, 1, 1,
-0.816564, -0.2193405, -0.1512755, 0, 0, 0, 1, 1,
-0.8146915, -1.156087, -3.643544, 0, 0, 0, 1, 1,
-0.8142513, -0.204129, -2.309309, 0, 0, 0, 1, 1,
-0.8138236, 1.163629, -1.921371, 1, 1, 1, 1, 1,
-0.7983961, -0.1344977, -2.882149, 1, 1, 1, 1, 1,
-0.7957512, -1.500331, -2.286396, 1, 1, 1, 1, 1,
-0.7873293, 0.5711102, -0.3793711, 1, 1, 1, 1, 1,
-0.7871248, -1.139823, -1.445426, 1, 1, 1, 1, 1,
-0.774637, -0.2298749, -2.796411, 1, 1, 1, 1, 1,
-0.764791, 0.9632178, 0.7012615, 1, 1, 1, 1, 1,
-0.7624776, -0.7620305, -0.7159352, 1, 1, 1, 1, 1,
-0.7582583, 0.0106642, -1.896928, 1, 1, 1, 1, 1,
-0.7540114, 0.06018477, -0.1742427, 1, 1, 1, 1, 1,
-0.7464393, -0.3906623, -1.150709, 1, 1, 1, 1, 1,
-0.741225, 0.4070348, -0.2487722, 1, 1, 1, 1, 1,
-0.7403217, -0.1721109, -1.38766, 1, 1, 1, 1, 1,
-0.7401373, 1.678242, 0.1085139, 1, 1, 1, 1, 1,
-0.7293388, -0.1324582, -4.350169, 1, 1, 1, 1, 1,
-0.7280622, 1.394343, 1.022242, 0, 0, 1, 1, 1,
-0.7255701, 1.18526, 0.2888918, 1, 0, 0, 1, 1,
-0.7236846, -1.970279, -3.268319, 1, 0, 0, 1, 1,
-0.7207277, 1.120618, 0.4626521, 1, 0, 0, 1, 1,
-0.7176418, -0.1948574, -2.750527, 1, 0, 0, 1, 1,
-0.7149943, -1.099591, -3.886214, 1, 0, 0, 1, 1,
-0.7084246, -0.4354804, -1.377701, 0, 0, 0, 1, 1,
-0.7060581, -0.8950912, -4.397657, 0, 0, 0, 1, 1,
-0.704326, 2.045597, -1.546184, 0, 0, 0, 1, 1,
-0.6977214, -0.743755, -2.885201, 0, 0, 0, 1, 1,
-0.6953319, -0.5412619, -2.140322, 0, 0, 0, 1, 1,
-0.6951278, -0.7142891, -2.63224, 0, 0, 0, 1, 1,
-0.6920589, 0.06207118, -0.3140518, 0, 0, 0, 1, 1,
-0.6848962, -2.044032, -2.626574, 1, 1, 1, 1, 1,
-0.6828752, 1.953648, 0.6635765, 1, 1, 1, 1, 1,
-0.6818508, -0.002709243, -1.007744, 1, 1, 1, 1, 1,
-0.6793084, -2.130779, -1.503904, 1, 1, 1, 1, 1,
-0.6787735, -0.7216341, -2.908939, 1, 1, 1, 1, 1,
-0.6765984, 0.6423995, -1.00693, 1, 1, 1, 1, 1,
-0.6757208, 0.2636438, -0.6672909, 1, 1, 1, 1, 1,
-0.6736142, -0.2564221, -1.414261, 1, 1, 1, 1, 1,
-0.6716652, 0.6830552, -2.524797, 1, 1, 1, 1, 1,
-0.6711919, -0.1158891, -1.97818, 1, 1, 1, 1, 1,
-0.6696497, -0.5084644, -3.494061, 1, 1, 1, 1, 1,
-0.6675656, 0.1626695, -1.722614, 1, 1, 1, 1, 1,
-0.6654283, 0.3164994, -1.456013, 1, 1, 1, 1, 1,
-0.6651355, -0.4780454, -3.007854, 1, 1, 1, 1, 1,
-0.6649429, -0.6533809, -1.833237, 1, 1, 1, 1, 1,
-0.6597379, 0.4806641, 0.2480086, 0, 0, 1, 1, 1,
-0.6544937, -0.3209462, -2.116986, 1, 0, 0, 1, 1,
-0.6520674, 0.6167995, -1.401242, 1, 0, 0, 1, 1,
-0.6482918, -0.2111671, -0.8240286, 1, 0, 0, 1, 1,
-0.6440204, 1.00484, 0.3533643, 1, 0, 0, 1, 1,
-0.6428474, 1.93542, -1.151067, 1, 0, 0, 1, 1,
-0.631763, 1.102596, -0.731302, 0, 0, 0, 1, 1,
-0.6222582, -1.321187, -2.998295, 0, 0, 0, 1, 1,
-0.6215838, 2.304909, 0.6698674, 0, 0, 0, 1, 1,
-0.6215836, -0.7648783, -4.146762, 0, 0, 0, 1, 1,
-0.6193301, 0.8496683, 0.07067341, 0, 0, 0, 1, 1,
-0.6181041, 0.2269533, -1.0429, 0, 0, 0, 1, 1,
-0.6171494, 0.5766039, -0.6012352, 0, 0, 0, 1, 1,
-0.6126942, 0.4955506, -0.5549539, 1, 1, 1, 1, 1,
-0.6106566, 1.934366, -0.6771433, 1, 1, 1, 1, 1,
-0.6066628, -0.372025, -2.450918, 1, 1, 1, 1, 1,
-0.606363, -1.015976, -3.751006, 1, 1, 1, 1, 1,
-0.5955358, -0.2623319, -4.283465, 1, 1, 1, 1, 1,
-0.5949572, -0.08547569, -0.1695097, 1, 1, 1, 1, 1,
-0.5945773, 1.756463, 0.6167696, 1, 1, 1, 1, 1,
-0.5934868, 0.2257238, -2.348953, 1, 1, 1, 1, 1,
-0.5927159, -0.3292758, -2.092802, 1, 1, 1, 1, 1,
-0.5926694, -1.284588, -3.01951, 1, 1, 1, 1, 1,
-0.5792056, -0.198156, -0.8909165, 1, 1, 1, 1, 1,
-0.5782555, -1.253305, -2.223636, 1, 1, 1, 1, 1,
-0.5751689, 0.09519961, -0.7429156, 1, 1, 1, 1, 1,
-0.5746266, 0.9591269, 1.306153, 1, 1, 1, 1, 1,
-0.5738843, 1.135678, -0.3929197, 1, 1, 1, 1, 1,
-0.5728427, -0.6393752, -4.37986, 0, 0, 1, 1, 1,
-0.5679136, -0.7642381, -4.139896, 1, 0, 0, 1, 1,
-0.5672697, 1.807953, -1.045479, 1, 0, 0, 1, 1,
-0.5663566, 0.4067669, -3.355109, 1, 0, 0, 1, 1,
-0.5654709, -0.6347247, -2.299885, 1, 0, 0, 1, 1,
-0.5649745, 0.2104499, -1.036773, 1, 0, 0, 1, 1,
-0.564048, 1.369702, 1.070599, 0, 0, 0, 1, 1,
-0.5617452, -0.09467597, -2.322501, 0, 0, 0, 1, 1,
-0.5609744, 0.5142278, 0.2973177, 0, 0, 0, 1, 1,
-0.5593815, -0.5101328, -0.5469857, 0, 0, 0, 1, 1,
-0.5569792, 0.8024251, -1.296157, 0, 0, 0, 1, 1,
-0.5506575, -0.9099709, -2.726328, 0, 0, 0, 1, 1,
-0.5479, -0.3079991, -3.667959, 0, 0, 0, 1, 1,
-0.5470605, 1.458088, 0.7668504, 1, 1, 1, 1, 1,
-0.5404931, 0.3371941, 0.5899532, 1, 1, 1, 1, 1,
-0.5366843, 0.02815124, -0.6348038, 1, 1, 1, 1, 1,
-0.5342719, 0.5301976, -1.654762, 1, 1, 1, 1, 1,
-0.531975, -1.401799, -2.789526, 1, 1, 1, 1, 1,
-0.5319269, -0.5090588, -3.69651, 1, 1, 1, 1, 1,
-0.529016, -0.818513, -3.543251, 1, 1, 1, 1, 1,
-0.5278974, -0.6648216, -2.460566, 1, 1, 1, 1, 1,
-0.5268031, -0.7227284, -0.1244905, 1, 1, 1, 1, 1,
-0.5236683, -0.8661617, -3.177439, 1, 1, 1, 1, 1,
-0.5211394, 1.521275, -0.7917303, 1, 1, 1, 1, 1,
-0.5183672, -0.8811256, -1.94188, 1, 1, 1, 1, 1,
-0.5171292, -1.341141, -2.326506, 1, 1, 1, 1, 1,
-0.5166019, -0.4303672, -3.756427, 1, 1, 1, 1, 1,
-0.5120604, -0.01101478, -1.506566, 1, 1, 1, 1, 1,
-0.5099452, 0.9592812, 0.4467565, 0, 0, 1, 1, 1,
-0.5093771, -1.903575, -4.23345, 1, 0, 0, 1, 1,
-0.5092682, -0.2827367, -1.113229, 1, 0, 0, 1, 1,
-0.5092499, -0.920701, -4.136531, 1, 0, 0, 1, 1,
-0.5072046, -0.1194023, -2.978287, 1, 0, 0, 1, 1,
-0.4957527, 0.9063282, 0.3809309, 1, 0, 0, 1, 1,
-0.4939972, -0.3808435, -2.002838, 0, 0, 0, 1, 1,
-0.4921726, 0.7530152, -1.345785, 0, 0, 0, 1, 1,
-0.491002, -0.6815169, -2.694368, 0, 0, 0, 1, 1,
-0.4909811, 0.1274859, -1.209573, 0, 0, 0, 1, 1,
-0.4905855, 1.109163, -1.179065, 0, 0, 0, 1, 1,
-0.4883226, 2.096913, -1.902851, 0, 0, 0, 1, 1,
-0.4882451, -1.493654, -2.45614, 0, 0, 0, 1, 1,
-0.4870516, 1.032766, -0.07089399, 1, 1, 1, 1, 1,
-0.4862622, -0.3418714, -2.54275, 1, 1, 1, 1, 1,
-0.485655, 0.8544574, -0.8697845, 1, 1, 1, 1, 1,
-0.4830579, 1.881868, 1.103868, 1, 1, 1, 1, 1,
-0.4804387, -0.4992813, -2.069487, 1, 1, 1, 1, 1,
-0.4764938, -1.28163, -1.273025, 1, 1, 1, 1, 1,
-0.4734501, 0.497869, -0.1022566, 1, 1, 1, 1, 1,
-0.4713472, 0.8489328, 0.0006728237, 1, 1, 1, 1, 1,
-0.4703386, 0.9532012, 0.4785098, 1, 1, 1, 1, 1,
-0.4653064, 1.51026, 0.8261735, 1, 1, 1, 1, 1,
-0.4638788, 0.02220432, -0.4199497, 1, 1, 1, 1, 1,
-0.4565374, -1.300611, -2.412286, 1, 1, 1, 1, 1,
-0.4561096, -0.2698732, -2.702225, 1, 1, 1, 1, 1,
-0.4558685, 2.764362, -0.789336, 1, 1, 1, 1, 1,
-0.4535237, 0.1632369, -1.441043, 1, 1, 1, 1, 1,
-0.4521941, -1.232813, -2.708156, 0, 0, 1, 1, 1,
-0.4516816, -0.2847203, -2.216585, 1, 0, 0, 1, 1,
-0.4505492, 0.3242287, -0.04736894, 1, 0, 0, 1, 1,
-0.4502903, 1.748109, 1.722827, 1, 0, 0, 1, 1,
-0.4462762, -0.005232867, -0.6671798, 1, 0, 0, 1, 1,
-0.4433193, -0.5489407, -2.55118, 1, 0, 0, 1, 1,
-0.4426963, -0.8248993, -2.625883, 0, 0, 0, 1, 1,
-0.4421965, -0.03600042, -0.900844, 0, 0, 0, 1, 1,
-0.4401152, -0.08595555, -0.7234376, 0, 0, 0, 1, 1,
-0.437592, 2.912156, -0.002694381, 0, 0, 0, 1, 1,
-0.4347772, -1.008131, -1.468174, 0, 0, 0, 1, 1,
-0.429596, 1.612201, 0.2612056, 0, 0, 0, 1, 1,
-0.4286193, -0.1022315, -2.593767, 0, 0, 0, 1, 1,
-0.4222725, 0.06918862, 0.7444311, 1, 1, 1, 1, 1,
-0.4198789, -0.6244206, -3.973163, 1, 1, 1, 1, 1,
-0.419199, -0.9062252, -2.304276, 1, 1, 1, 1, 1,
-0.4178863, -1.942247, -1.736085, 1, 1, 1, 1, 1,
-0.4172411, -1.408626, -2.255042, 1, 1, 1, 1, 1,
-0.4133951, 0.8760267, -0.9234259, 1, 1, 1, 1, 1,
-0.4039174, -2.245434, -3.513374, 1, 1, 1, 1, 1,
-0.3997381, -0.3420771, -1.791724, 1, 1, 1, 1, 1,
-0.3990135, -1.30447, -3.821808, 1, 1, 1, 1, 1,
-0.3968422, -0.8361219, -3.968853, 1, 1, 1, 1, 1,
-0.3940267, 2.353714, 0.5719152, 1, 1, 1, 1, 1,
-0.3925574, 1.256368, -1.265919, 1, 1, 1, 1, 1,
-0.3922336, -0.1188661, -0.0910437, 1, 1, 1, 1, 1,
-0.3874815, -1.339284, -2.699908, 1, 1, 1, 1, 1,
-0.3869731, -0.7972637, -2.41669, 1, 1, 1, 1, 1,
-0.3807554, 0.5620716, -1.113543, 0, 0, 1, 1, 1,
-0.3771101, -0.1518672, -1.255872, 1, 0, 0, 1, 1,
-0.3713923, 0.3176363, -2.216689, 1, 0, 0, 1, 1,
-0.3692516, -0.168086, -2.794876, 1, 0, 0, 1, 1,
-0.3649615, 0.882027, -1.425954, 1, 0, 0, 1, 1,
-0.3622583, -0.7462379, -1.716023, 1, 0, 0, 1, 1,
-0.3608285, 0.2504752, -0.9504972, 0, 0, 0, 1, 1,
-0.3575634, 0.6048458, -0.8778349, 0, 0, 0, 1, 1,
-0.3560632, -0.6725145, -3.180076, 0, 0, 0, 1, 1,
-0.3495905, -1.523096, -4.386329, 0, 0, 0, 1, 1,
-0.3491144, -0.7979442, -2.908932, 0, 0, 0, 1, 1,
-0.3433273, -0.4509708, -3.878493, 0, 0, 0, 1, 1,
-0.3376382, 1.565926, -1.797908, 0, 0, 0, 1, 1,
-0.3354575, -0.04628445, -2.192048, 1, 1, 1, 1, 1,
-0.3326745, 1.324631, -0.3821215, 1, 1, 1, 1, 1,
-0.3302833, -0.268089, -3.403876, 1, 1, 1, 1, 1,
-0.3288586, -0.9629741, -1.859957, 1, 1, 1, 1, 1,
-0.3282133, 0.2742988, 1.123787, 1, 1, 1, 1, 1,
-0.3261279, 1.294435, -0.4100572, 1, 1, 1, 1, 1,
-0.3160181, -0.7799278, -3.575355, 1, 1, 1, 1, 1,
-0.3153118, 1.519343, 0.1011441, 1, 1, 1, 1, 1,
-0.3150362, 0.2735759, 0.4272589, 1, 1, 1, 1, 1,
-0.313756, 0.1610133, -2.367472, 1, 1, 1, 1, 1,
-0.2994227, -1.60903, -2.612899, 1, 1, 1, 1, 1,
-0.2986026, -0.01938931, -2.598897, 1, 1, 1, 1, 1,
-0.2980339, -0.3008595, -2.220129, 1, 1, 1, 1, 1,
-0.2960279, -1.463547, -2.898556, 1, 1, 1, 1, 1,
-0.2956181, 1.924182, 0.1516779, 1, 1, 1, 1, 1,
-0.2949797, 0.1285635, -1.631113, 0, 0, 1, 1, 1,
-0.294171, 1.489028, 1.287893, 1, 0, 0, 1, 1,
-0.2935151, 1.432615, 2.335341, 1, 0, 0, 1, 1,
-0.2933115, -0.5377656, -1.957411, 1, 0, 0, 1, 1,
-0.2913005, -0.9590456, -2.848601, 1, 0, 0, 1, 1,
-0.2854864, -1.654373, -1.230418, 1, 0, 0, 1, 1,
-0.2827541, -0.5575228, -3.45438, 0, 0, 0, 1, 1,
-0.2826326, 0.28635, -0.6470404, 0, 0, 0, 1, 1,
-0.2814978, -2.114461, -3.941357, 0, 0, 0, 1, 1,
-0.2809823, -0.9694935, -4.432596, 0, 0, 0, 1, 1,
-0.276017, 1.715467, -0.4840537, 0, 0, 0, 1, 1,
-0.2733188, 0.8230701, -0.6399054, 0, 0, 0, 1, 1,
-0.2693005, -0.8202917, -2.317365, 0, 0, 0, 1, 1,
-0.2586379, 1.19093, 0.199513, 1, 1, 1, 1, 1,
-0.2566194, 0.359834, -1.996682, 1, 1, 1, 1, 1,
-0.2514558, -1.434811, -2.67348, 1, 1, 1, 1, 1,
-0.2492992, 1.510135, 0.6584488, 1, 1, 1, 1, 1,
-0.2482862, 0.1844476, 0.572247, 1, 1, 1, 1, 1,
-0.2474416, -2.158293, -2.985064, 1, 1, 1, 1, 1,
-0.2442347, -0.69056, -2.568006, 1, 1, 1, 1, 1,
-0.2438867, -0.07835649, -0.1322616, 1, 1, 1, 1, 1,
-0.2398268, -1.96259, -3.036599, 1, 1, 1, 1, 1,
-0.2369222, 0.6641087, 1.423131, 1, 1, 1, 1, 1,
-0.236012, 1.295213, 0.1489386, 1, 1, 1, 1, 1,
-0.2338125, 0.681295, -0.1891025, 1, 1, 1, 1, 1,
-0.233492, 0.7201143, -0.9491346, 1, 1, 1, 1, 1,
-0.2305474, 0.6157439, 0.1837239, 1, 1, 1, 1, 1,
-0.2268116, 1.101834, -0.04559766, 1, 1, 1, 1, 1,
-0.2256375, -0.9809589, -3.244976, 0, 0, 1, 1, 1,
-0.2255146, -1.67346, -3.638267, 1, 0, 0, 1, 1,
-0.2254022, 1.986724, 0.4025051, 1, 0, 0, 1, 1,
-0.2246324, 0.4084187, 0.8875992, 1, 0, 0, 1, 1,
-0.217047, 0.5916476, 0.5085169, 1, 0, 0, 1, 1,
-0.2156851, 1.065506, -0.2145065, 1, 0, 0, 1, 1,
-0.2136866, -0.7743529, -3.72962, 0, 0, 0, 1, 1,
-0.2135649, -0.1716006, -1.705319, 0, 0, 0, 1, 1,
-0.2128189, -0.3069765, -1.566292, 0, 0, 0, 1, 1,
-0.2108131, -0.4441694, -1.409729, 0, 0, 0, 1, 1,
-0.2067058, 0.3880124, -0.1889547, 0, 0, 0, 1, 1,
-0.2039959, -1.849783, -4.253577, 0, 0, 0, 1, 1,
-0.2028171, 1.490353, -0.03922517, 0, 0, 0, 1, 1,
-0.1973443, 1.524953, 0.3212755, 1, 1, 1, 1, 1,
-0.1972495, 0.2777685, -1.670958, 1, 1, 1, 1, 1,
-0.1946178, -1.454237, -1.016213, 1, 1, 1, 1, 1,
-0.1930202, 0.3967702, -1.460694, 1, 1, 1, 1, 1,
-0.1915014, -0.3608803, -2.204909, 1, 1, 1, 1, 1,
-0.191056, 0.1458486, -3.224993, 1, 1, 1, 1, 1,
-0.186794, 0.563655, 1.138389, 1, 1, 1, 1, 1,
-0.1810885, -0.2677047, -1.606277, 1, 1, 1, 1, 1,
-0.1759347, 0.3338584, 1.733971, 1, 1, 1, 1, 1,
-0.174756, -0.122109, -2.29182, 1, 1, 1, 1, 1,
-0.1737611, 0.8816021, 0.2170929, 1, 1, 1, 1, 1,
-0.168764, 0.2230045, 1.861057, 1, 1, 1, 1, 1,
-0.1657381, -0.906849, -4.700205, 1, 1, 1, 1, 1,
-0.1638394, 1.214052, -0.9375536, 1, 1, 1, 1, 1,
-0.162347, 1.514589, -0.6234264, 1, 1, 1, 1, 1,
-0.1544215, 0.2912612, 0.7186067, 0, 0, 1, 1, 1,
-0.1516561, 1.69214, 0.1216252, 1, 0, 0, 1, 1,
-0.146193, -0.1314897, -1.774904, 1, 0, 0, 1, 1,
-0.1435733, -2.538552, -1.998847, 1, 0, 0, 1, 1,
-0.140502, 1.220773, 0.4246029, 1, 0, 0, 1, 1,
-0.1404808, 1.064467, -0.7683953, 1, 0, 0, 1, 1,
-0.1352724, -0.3130239, -1.534321, 0, 0, 0, 1, 1,
-0.1340369, 0.3776648, -0.1855422, 0, 0, 0, 1, 1,
-0.1338662, 0.4091096, -1.129825, 0, 0, 0, 1, 1,
-0.1308103, -0.1995087, -2.993303, 0, 0, 0, 1, 1,
-0.1253805, 0.4137066, 1.313109, 0, 0, 0, 1, 1,
-0.1222044, -0.5078225, -2.820231, 0, 0, 0, 1, 1,
-0.12038, 0.1031273, -2.004543, 0, 0, 0, 1, 1,
-0.1191163, 0.4154295, -0.5787001, 1, 1, 1, 1, 1,
-0.1183391, 0.06956869, -1.563974, 1, 1, 1, 1, 1,
-0.1168528, -1.195771, -2.71101, 1, 1, 1, 1, 1,
-0.114958, -0.9302868, -3.096321, 1, 1, 1, 1, 1,
-0.1140197, 1.390303, 0.07858996, 1, 1, 1, 1, 1,
-0.1113123, 1.01336, -0.295106, 1, 1, 1, 1, 1,
-0.1095022, -0.2186524, -3.123987, 1, 1, 1, 1, 1,
-0.1093005, -0.1537871, -2.486263, 1, 1, 1, 1, 1,
-0.1052577, 0.007363219, -3.699409, 1, 1, 1, 1, 1,
-0.1015337, -0.631975, -2.38341, 1, 1, 1, 1, 1,
-0.1012583, 0.1666225, -1.150711, 1, 1, 1, 1, 1,
-0.1008714, 0.5046105, -1.126623, 1, 1, 1, 1, 1,
-0.09882351, -0.5152626, -2.798782, 1, 1, 1, 1, 1,
-0.09471474, 0.8786362, 1.072699, 1, 1, 1, 1, 1,
-0.09191639, 1.290107, -0.5059171, 1, 1, 1, 1, 1,
-0.08850303, -0.05354261, -2.182683, 0, 0, 1, 1, 1,
-0.08815592, -0.4921205, -2.685709, 1, 0, 0, 1, 1,
-0.08766074, -0.447657, -4.008435, 1, 0, 0, 1, 1,
-0.08590889, 0.8436726, -2.403688, 1, 0, 0, 1, 1,
-0.08286039, 2.087743, 0.5776956, 1, 0, 0, 1, 1,
-0.08234276, 0.2600058, -1.097932, 1, 0, 0, 1, 1,
-0.07990544, -1.268239, -2.396732, 0, 0, 0, 1, 1,
-0.07973165, 0.4059026, -1.076669, 0, 0, 0, 1, 1,
-0.07863679, 0.7453541, -1.475695, 0, 0, 0, 1, 1,
-0.07809069, -0.4031283, -2.960644, 0, 0, 0, 1, 1,
-0.07292618, -0.6274868, -1.839732, 0, 0, 0, 1, 1,
-0.07206422, 0.05787134, -2.012743, 0, 0, 0, 1, 1,
-0.0717489, 0.1155872, -0.4541328, 0, 0, 0, 1, 1,
-0.06917316, 0.6447974, -0.6949513, 1, 1, 1, 1, 1,
-0.06899311, -0.7055955, -2.499079, 1, 1, 1, 1, 1,
-0.06669151, -0.2251777, -1.817504, 1, 1, 1, 1, 1,
-0.06373259, -1.023369, -4.477695, 1, 1, 1, 1, 1,
-0.06214984, -0.03227513, -1.524369, 1, 1, 1, 1, 1,
-0.06117018, -0.09108426, -2.051613, 1, 1, 1, 1, 1,
-0.06078223, -2.201474, -3.692285, 1, 1, 1, 1, 1,
-0.05886365, -0.326935, -4.614112, 1, 1, 1, 1, 1,
-0.04892253, -1.11067, -1.372492, 1, 1, 1, 1, 1,
-0.03739805, -0.1253418, -3.909813, 1, 1, 1, 1, 1,
-0.03628476, -1.046136, -2.268898, 1, 1, 1, 1, 1,
-0.03625743, -0.5962706, -2.586198, 1, 1, 1, 1, 1,
-0.03418429, 0.5520946, -0.7837218, 1, 1, 1, 1, 1,
-0.02887154, 0.2814232, -1.165675, 1, 1, 1, 1, 1,
-0.02759407, 1.742787, 2.247485, 1, 1, 1, 1, 1,
-0.02420138, -0.7369754, -2.489125, 0, 0, 1, 1, 1,
-0.0223621, -0.9495497, -5.345973, 1, 0, 0, 1, 1,
-0.02124544, 1.220177, -1.042797, 1, 0, 0, 1, 1,
-0.0163206, 0.005724998, -2.773052, 1, 0, 0, 1, 1,
-0.01582563, -0.05427976, -2.481776, 1, 0, 0, 1, 1,
-0.01078842, -0.857968, -3.818523, 1, 0, 0, 1, 1,
-0.009613767, 0.9902111, 1.052133, 0, 0, 0, 1, 1,
-0.007951154, 0.4794126, 0.1328019, 0, 0, 0, 1, 1,
-0.006875065, -1.721885, -3.132702, 0, 0, 0, 1, 1,
-0.001456584, -1.729307, -3.143331, 0, 0, 0, 1, 1,
0.005804623, 1.196013, -2.032937, 0, 0, 0, 1, 1,
0.005883787, 1.409771, 0.4002596, 0, 0, 0, 1, 1,
0.006091351, -0.4688577, 3.893057, 0, 0, 0, 1, 1,
0.01076444, -0.2536081, 3.572137, 1, 1, 1, 1, 1,
0.01225599, -0.4172267, 4.375286, 1, 1, 1, 1, 1,
0.01732738, 1.14766, 1.627277, 1, 1, 1, 1, 1,
0.01991477, -0.3118535, 2.992836, 1, 1, 1, 1, 1,
0.02297045, -1.167554, 3.871842, 1, 1, 1, 1, 1,
0.0289433, 0.1405243, 0.04452749, 1, 1, 1, 1, 1,
0.03210206, 0.2982966, 1.432509, 1, 1, 1, 1, 1,
0.03825147, -0.4895056, 2.922452, 1, 1, 1, 1, 1,
0.04147102, 0.7973325, 0.6845163, 1, 1, 1, 1, 1,
0.04579247, -1.428986, 3.785591, 1, 1, 1, 1, 1,
0.04633567, -1.089783, 4.075202, 1, 1, 1, 1, 1,
0.05014355, 0.7987553, -0.2018825, 1, 1, 1, 1, 1,
0.05066183, 0.4658393, 1.440943, 1, 1, 1, 1, 1,
0.05211497, -1.837683, 3.737004, 1, 1, 1, 1, 1,
0.05278406, -0.1527936, 3.200539, 1, 1, 1, 1, 1,
0.05279697, 1.883997, -1.136943, 0, 0, 1, 1, 1,
0.06075516, 0.5509536, -0.08714642, 1, 0, 0, 1, 1,
0.06484533, -2.034269, 1.977714, 1, 0, 0, 1, 1,
0.06535012, 1.627974, 1.040304, 1, 0, 0, 1, 1,
0.0700013, -0.4838266, 3.609673, 1, 0, 0, 1, 1,
0.07159705, 0.0428841, -0.08287573, 1, 0, 0, 1, 1,
0.07239848, -0.4197161, 3.794401, 0, 0, 0, 1, 1,
0.07298893, 1.215227, 1.321524, 0, 0, 0, 1, 1,
0.07335492, 0.2844414, 0.4093275, 0, 0, 0, 1, 1,
0.07503079, 1.353622, 0.4033878, 0, 0, 0, 1, 1,
0.07591343, 1.374637, -0.4303258, 0, 0, 0, 1, 1,
0.07802016, -0.498373, 2.563773, 0, 0, 0, 1, 1,
0.08040268, 0.6976099, -1.132995, 0, 0, 0, 1, 1,
0.08189793, 1.385797, -0.9065953, 1, 1, 1, 1, 1,
0.08283293, 0.04111142, 1.27941, 1, 1, 1, 1, 1,
0.09141992, 0.2021509, -0.9544767, 1, 1, 1, 1, 1,
0.09176632, -0.789489, 3.916998, 1, 1, 1, 1, 1,
0.09888825, 1.196451, -1.167413, 1, 1, 1, 1, 1,
0.09995499, -1.46531, 3.202857, 1, 1, 1, 1, 1,
0.1005355, 3.834524, -0.9729002, 1, 1, 1, 1, 1,
0.1018711, -0.6496349, 2.472872, 1, 1, 1, 1, 1,
0.1021214, 0.6862909, -0.5333139, 1, 1, 1, 1, 1,
0.104556, 0.1675362, 0.4469998, 1, 1, 1, 1, 1,
0.1052005, -0.5283664, 3.626481, 1, 1, 1, 1, 1,
0.106672, -0.2660257, 1.985274, 1, 1, 1, 1, 1,
0.1120518, -0.1883625, 3.13084, 1, 1, 1, 1, 1,
0.1160958, -1.160293, 3.553919, 1, 1, 1, 1, 1,
0.1173528, 0.8106899, 0.3948746, 1, 1, 1, 1, 1,
0.121304, -0.530769, 1.923557, 0, 0, 1, 1, 1,
0.1218083, -0.4245495, 3.980675, 1, 0, 0, 1, 1,
0.1265262, -0.7880054, 3.310311, 1, 0, 0, 1, 1,
0.1271573, -1.257603, 4.416205, 1, 0, 0, 1, 1,
0.1290739, -0.9476182, 1.839301, 1, 0, 0, 1, 1,
0.1311449, 0.8478506, 0.391723, 1, 0, 0, 1, 1,
0.1321219, -0.9336106, 2.032206, 0, 0, 0, 1, 1,
0.132658, 0.3079039, 1.944874, 0, 0, 0, 1, 1,
0.1340945, -0.8897192, 4.122205, 0, 0, 0, 1, 1,
0.1361156, 0.1468438, 0.1415471, 0, 0, 0, 1, 1,
0.1402428, 1.323769, 1.63485, 0, 0, 0, 1, 1,
0.1403984, -0.14525, 0.5571224, 0, 0, 0, 1, 1,
0.1404685, -1.183303, 2.299435, 0, 0, 0, 1, 1,
0.1408907, -1.571504, 1.590201, 1, 1, 1, 1, 1,
0.144345, 0.9651075, 0.07805425, 1, 1, 1, 1, 1,
0.1443702, 0.2570589, 0.9412241, 1, 1, 1, 1, 1,
0.1513661, 1.500046, 1.051475, 1, 1, 1, 1, 1,
0.15229, -0.4313993, 3.284293, 1, 1, 1, 1, 1,
0.1552823, -0.2718777, 2.92972, 1, 1, 1, 1, 1,
0.1560608, 0.3602549, 3.071235, 1, 1, 1, 1, 1,
0.1574703, 0.05738734, 0.9037189, 1, 1, 1, 1, 1,
0.1613255, -0.3779982, 3.430578, 1, 1, 1, 1, 1,
0.1627318, 1.449161, 1.379474, 1, 1, 1, 1, 1,
0.163011, -1.433516, 1.676733, 1, 1, 1, 1, 1,
0.1891419, 0.4361873, 0.9680315, 1, 1, 1, 1, 1,
0.1950415, 0.7750378, 0.3212266, 1, 1, 1, 1, 1,
0.1961725, 3.402388, 0.6132382, 1, 1, 1, 1, 1,
0.1971449, -1.071618, 4.644652, 1, 1, 1, 1, 1,
0.1974166, -0.8005289, 4.810772, 0, 0, 1, 1, 1,
0.1977609, 0.5573889, 0.5686383, 1, 0, 0, 1, 1,
0.2026476, 1.42764, 2.583567, 1, 0, 0, 1, 1,
0.2027266, 0.2712897, 0.02753544, 1, 0, 0, 1, 1,
0.2060347, 2.166302, -0.2283678, 1, 0, 0, 1, 1,
0.2098921, -1.667968, 3.936028, 1, 0, 0, 1, 1,
0.2099956, 0.1253239, 0.7858172, 0, 0, 0, 1, 1,
0.2130522, 1.326563, 0.7777982, 0, 0, 0, 1, 1,
0.2174161, 0.9471806, 1.537796, 0, 0, 0, 1, 1,
0.2187222, -1.108989, 3.791466, 0, 0, 0, 1, 1,
0.2195115, 0.6828784, 0.4295596, 0, 0, 0, 1, 1,
0.2230158, -0.3973692, 2.877733, 0, 0, 0, 1, 1,
0.2282911, -0.2981644, 4.257406, 0, 0, 0, 1, 1,
0.2284619, 0.1574082, 1.812135, 1, 1, 1, 1, 1,
0.2332722, 0.7677648, -0.152999, 1, 1, 1, 1, 1,
0.2372753, -0.08692569, 2.427574, 1, 1, 1, 1, 1,
0.2471526, -0.6417173, 4.519841, 1, 1, 1, 1, 1,
0.247352, 1.626946, -1.774128, 1, 1, 1, 1, 1,
0.2572967, 0.5955713, -0.4584257, 1, 1, 1, 1, 1,
0.2584068, -1.050196, 0.8667635, 1, 1, 1, 1, 1,
0.2657371, 1.930416, 0.6959338, 1, 1, 1, 1, 1,
0.2685072, 2.003657, -1.368374, 1, 1, 1, 1, 1,
0.270997, -0.1478738, 2.418455, 1, 1, 1, 1, 1,
0.2763389, -2.97465, 3.504397, 1, 1, 1, 1, 1,
0.2794055, -1.574888, 2.813176, 1, 1, 1, 1, 1,
0.2896293, -2.122359, 2.770621, 1, 1, 1, 1, 1,
0.2919932, -0.3832382, 4.672487, 1, 1, 1, 1, 1,
0.2926144, 0.3750396, 1.957804, 1, 1, 1, 1, 1,
0.2929186, 1.253174, 1.376595, 0, 0, 1, 1, 1,
0.3000855, -0.4221576, 2.035232, 1, 0, 0, 1, 1,
0.3011363, 1.002665, 2.056311, 1, 0, 0, 1, 1,
0.3024365, -0.5264917, 3.430259, 1, 0, 0, 1, 1,
0.3025913, 1.381939, -0.6859117, 1, 0, 0, 1, 1,
0.30826, 1.387578, -0.3729987, 1, 0, 0, 1, 1,
0.3122262, 0.2024331, -0.7380304, 0, 0, 0, 1, 1,
0.3153295, 0.6837272, 0.5769254, 0, 0, 0, 1, 1,
0.3158768, -1.886524, 3.476261, 0, 0, 0, 1, 1,
0.3199392, 1.599045, -0.02363579, 0, 0, 0, 1, 1,
0.3217218, -0.0832858, 4.527224, 0, 0, 0, 1, 1,
0.3226484, 0.8012414, 1.274431, 0, 0, 0, 1, 1,
0.3263033, 1.956811, 0.8932076, 0, 0, 0, 1, 1,
0.3311389, 1.208188, 1.74891, 1, 1, 1, 1, 1,
0.3318051, 0.8176095, 0.3127102, 1, 1, 1, 1, 1,
0.331986, -1.144237, 3.625374, 1, 1, 1, 1, 1,
0.332347, -0.4100226, 2.342352, 1, 1, 1, 1, 1,
0.333844, 0.0347445, 1.821451, 1, 1, 1, 1, 1,
0.3365466, -0.9615764, 3.581691, 1, 1, 1, 1, 1,
0.3368663, 1.573607, 0.2332882, 1, 1, 1, 1, 1,
0.3389462, -0.5080044, 4.348059, 1, 1, 1, 1, 1,
0.3409758, 0.1507546, 0.6158022, 1, 1, 1, 1, 1,
0.3410296, -0.4182166, 2.316308, 1, 1, 1, 1, 1,
0.3437484, 0.02217884, -0.04156245, 1, 1, 1, 1, 1,
0.3443604, -1.12417, 3.066245, 1, 1, 1, 1, 1,
0.3474034, 1.025673, 1.255439, 1, 1, 1, 1, 1,
0.3487301, -2.368236, 2.298476, 1, 1, 1, 1, 1,
0.3498427, -0.09358657, -0.419183, 1, 1, 1, 1, 1,
0.350269, -0.9314607, 3.72001, 0, 0, 1, 1, 1,
0.3503252, 1.31384, 1.610366, 1, 0, 0, 1, 1,
0.3532877, -0.2118028, 4.05304, 1, 0, 0, 1, 1,
0.3547439, -0.2341819, 2.619111, 1, 0, 0, 1, 1,
0.3583103, 0.1988477, 2.729789, 1, 0, 0, 1, 1,
0.3644995, 0.6613326, 1.357468, 1, 0, 0, 1, 1,
0.3714729, 0.9531538, -0.3124358, 0, 0, 0, 1, 1,
0.3715064, 0.2229467, 2.31058, 0, 0, 0, 1, 1,
0.3725236, 0.9877527, 1.401857, 0, 0, 0, 1, 1,
0.3766796, -0.6360095, 2.113866, 0, 0, 0, 1, 1,
0.3767491, 0.3889163, -0.1563032, 0, 0, 0, 1, 1,
0.3826478, -1.507384, 1.303436, 0, 0, 0, 1, 1,
0.3882391, 0.9961392, 0.4768127, 0, 0, 0, 1, 1,
0.3900916, -0.3101068, 3.230544, 1, 1, 1, 1, 1,
0.3933118, 0.07762459, 1.875207, 1, 1, 1, 1, 1,
0.3943866, 0.2259606, 0.1736523, 1, 1, 1, 1, 1,
0.3978224, 1.217618, 0.6111983, 1, 1, 1, 1, 1,
0.4005526, 0.1333691, 1.19891, 1, 1, 1, 1, 1,
0.4020217, 0.1994013, 1.372505, 1, 1, 1, 1, 1,
0.4025805, 1.281634, -1.359257, 1, 1, 1, 1, 1,
0.4068481, 0.8312098, 0.5135209, 1, 1, 1, 1, 1,
0.4129114, 0.6301322, 0.2026138, 1, 1, 1, 1, 1,
0.4140643, -0.950153, 1.284576, 1, 1, 1, 1, 1,
0.4152928, -0.7713624, 3.471256, 1, 1, 1, 1, 1,
0.4187364, -0.6516135, 3.95129, 1, 1, 1, 1, 1,
0.4194945, -0.1760288, 2.159207, 1, 1, 1, 1, 1,
0.422562, 0.5676899, 1.578442, 1, 1, 1, 1, 1,
0.4231609, -0.2449063, 3.616691, 1, 1, 1, 1, 1,
0.4246171, -0.8880681, 2.383723, 0, 0, 1, 1, 1,
0.4253736, 0.6280347, 0.3791974, 1, 0, 0, 1, 1,
0.4275861, -0.5618601, 2.997079, 1, 0, 0, 1, 1,
0.4276595, -0.00513509, 1.303434, 1, 0, 0, 1, 1,
0.4331332, 1.583108, -0.1245001, 1, 0, 0, 1, 1,
0.4339296, 1.059425, 1.892417, 1, 0, 0, 1, 1,
0.4392947, -0.6109675, 2.658068, 0, 0, 0, 1, 1,
0.4415666, 1.305462, -1.290326, 0, 0, 0, 1, 1,
0.4434718, -0.07541618, -1.075598, 0, 0, 0, 1, 1,
0.4455668, -0.3700027, 1.05552, 0, 0, 0, 1, 1,
0.4510905, -0.525645, 2.269634, 0, 0, 0, 1, 1,
0.4547788, 1.812971, 1.842474, 0, 0, 0, 1, 1,
0.4591793, -0.09517367, 2.613818, 0, 0, 0, 1, 1,
0.4706796, -0.5872989, 3.95338, 1, 1, 1, 1, 1,
0.4730605, -0.4379927, 0.493306, 1, 1, 1, 1, 1,
0.4775328, 0.2749408, 1.112404, 1, 1, 1, 1, 1,
0.4794489, -0.187072, 1.413741, 1, 1, 1, 1, 1,
0.4805241, -0.02266525, 1.928406, 1, 1, 1, 1, 1,
0.5004587, -1.171525, 3.623845, 1, 1, 1, 1, 1,
0.5051042, 0.6476164, -0.07387958, 1, 1, 1, 1, 1,
0.5061097, 0.6202396, -0.5801459, 1, 1, 1, 1, 1,
0.5097025, 0.5231193, 1.952932, 1, 1, 1, 1, 1,
0.5135657, -1.098484, 2.089514, 1, 1, 1, 1, 1,
0.5227623, -0.1804036, 2.243099, 1, 1, 1, 1, 1,
0.5256921, 0.8630975, 0.4707408, 1, 1, 1, 1, 1,
0.5268129, 0.8447755, -0.8849782, 1, 1, 1, 1, 1,
0.5269501, -0.1840687, 1.553103, 1, 1, 1, 1, 1,
0.5309194, -0.8058823, 2.254332, 1, 1, 1, 1, 1,
0.5408523, 3.207324, -0.6544122, 0, 0, 1, 1, 1,
0.5446623, 0.01271424, -0.151516, 1, 0, 0, 1, 1,
0.5465961, -0.3020771, 1.206793, 1, 0, 0, 1, 1,
0.5504732, -0.08498421, 0.3094608, 1, 0, 0, 1, 1,
0.5513049, -0.6508592, 2.166557, 1, 0, 0, 1, 1,
0.553346, 0.8019704, 0.9802122, 1, 0, 0, 1, 1,
0.5558814, 0.2158119, 0.7459398, 0, 0, 0, 1, 1,
0.5572775, 0.5206605, 1.386822, 0, 0, 0, 1, 1,
0.5608394, 0.2886791, -0.02393273, 0, 0, 0, 1, 1,
0.5628951, -1.363766, 3.854279, 0, 0, 0, 1, 1,
0.5654008, -0.9307427, 4.53493, 0, 0, 0, 1, 1,
0.5675564, -0.9205068, 2.48143, 0, 0, 0, 1, 1,
0.5677097, 1.006129, 0.02218619, 0, 0, 0, 1, 1,
0.5733052, -0.6863379, 3.225229, 1, 1, 1, 1, 1,
0.5734225, -0.3800573, 1.645719, 1, 1, 1, 1, 1,
0.5734267, -0.7210488, 4.285737, 1, 1, 1, 1, 1,
0.5801858, 1.559602, 0.9882262, 1, 1, 1, 1, 1,
0.5823498, 0.3618037, 1.152713, 1, 1, 1, 1, 1,
0.5849569, 0.8822648, 0.9141401, 1, 1, 1, 1, 1,
0.5861307, -0.08833188, 2.401646, 1, 1, 1, 1, 1,
0.5880232, -1.473175, 2.4437, 1, 1, 1, 1, 1,
0.5919779, 1.274318, 2.550344, 1, 1, 1, 1, 1,
0.597365, -0.7759058, 2.190113, 1, 1, 1, 1, 1,
0.5975149, 0.1948639, 1.661416, 1, 1, 1, 1, 1,
0.6047223, 0.7112759, 1.199667, 1, 1, 1, 1, 1,
0.6071457, -0.5469612, 2.028613, 1, 1, 1, 1, 1,
0.6097633, 1.351719, 0.4970969, 1, 1, 1, 1, 1,
0.614306, -1.377546, 2.304482, 1, 1, 1, 1, 1,
0.6144377, -1.325603, 3.612184, 0, 0, 1, 1, 1,
0.6155311, -0.9267439, 2.001589, 1, 0, 0, 1, 1,
0.6155763, 1.298754, 0.3324888, 1, 0, 0, 1, 1,
0.6168935, -0.0766072, 1.936899, 1, 0, 0, 1, 1,
0.6169178, 1.091523, 1.963228, 1, 0, 0, 1, 1,
0.6177225, 0.5601625, 0.8153143, 1, 0, 0, 1, 1,
0.6235582, 0.04531705, 0.9615059, 0, 0, 0, 1, 1,
0.6250415, 0.9860165, -0.7404215, 0, 0, 0, 1, 1,
0.6250528, -0.3749293, 2.154832, 0, 0, 0, 1, 1,
0.6266444, -1.400009, 0.3724609, 0, 0, 0, 1, 1,
0.6266718, -0.561865, 3.690214, 0, 0, 0, 1, 1,
0.626688, 0.3468684, 1.726006, 0, 0, 0, 1, 1,
0.628746, -1.250365, 2.965748, 0, 0, 0, 1, 1,
0.631372, 0.2384395, 1.309947, 1, 1, 1, 1, 1,
0.6364295, 0.9537459, 2.195298, 1, 1, 1, 1, 1,
0.6483665, -1.438201, 3.325268, 1, 1, 1, 1, 1,
0.6539278, 0.0586626, 0.9733502, 1, 1, 1, 1, 1,
0.6546615, -0.5346392, 2.820091, 1, 1, 1, 1, 1,
0.6561539, 0.6245812, 0.8778183, 1, 1, 1, 1, 1,
0.6609184, -0.05257938, 1.289568, 1, 1, 1, 1, 1,
0.663552, 0.4733771, 1.047374, 1, 1, 1, 1, 1,
0.6702196, -0.9099801, 2.531391, 1, 1, 1, 1, 1,
0.6710526, 0.3900883, 1.270835, 1, 1, 1, 1, 1,
0.6752239, 1.978524, -0.07773101, 1, 1, 1, 1, 1,
0.6762991, 1.210285, 2.162995, 1, 1, 1, 1, 1,
0.6802971, -0.5843397, 1.842201, 1, 1, 1, 1, 1,
0.6946884, 0.6636423, 1.940913, 1, 1, 1, 1, 1,
0.6969951, 0.1305301, 1.891782, 1, 1, 1, 1, 1,
0.6997743, -0.8164851, 2.090604, 0, 0, 1, 1, 1,
0.701022, -0.02390528, 1.551675, 1, 0, 0, 1, 1,
0.7011296, 0.5971124, 2.353294, 1, 0, 0, 1, 1,
0.7049932, -1.282638, 2.377581, 1, 0, 0, 1, 1,
0.706057, 0.5312229, 0.7167731, 1, 0, 0, 1, 1,
0.7060989, 0.7789133, 0.2157633, 1, 0, 0, 1, 1,
0.7072827, 1.700744, 1.709031, 0, 0, 0, 1, 1,
0.7093956, 0.6181482, 0.7251477, 0, 0, 0, 1, 1,
0.7142805, 0.843709, 1.270364, 0, 0, 0, 1, 1,
0.7173353, 1.357256, 0.03093147, 0, 0, 0, 1, 1,
0.7179835, 0.1144827, 1.236846, 0, 0, 0, 1, 1,
0.7226539, -0.2801982, 1.864385, 0, 0, 0, 1, 1,
0.7253639, -1.926248, 1.952004, 0, 0, 0, 1, 1,
0.7275454, -1.16496, 2.592126, 1, 1, 1, 1, 1,
0.7339835, -0.9416069, 3.093813, 1, 1, 1, 1, 1,
0.7368508, -0.08605959, 2.606215, 1, 1, 1, 1, 1,
0.7418049, -2.479469, 3.749872, 1, 1, 1, 1, 1,
0.7424064, 0.5038661, 1.355336, 1, 1, 1, 1, 1,
0.7446769, 0.1795345, 1.26567, 1, 1, 1, 1, 1,
0.7480513, -1.570086, 2.061302, 1, 1, 1, 1, 1,
0.7491531, -0.002535292, 2.853587, 1, 1, 1, 1, 1,
0.7507506, 1.282069, -1.08712, 1, 1, 1, 1, 1,
0.7527309, -0.9282874, 2.023499, 1, 1, 1, 1, 1,
0.7565087, -1.490431, 2.731888, 1, 1, 1, 1, 1,
0.7602682, 0.1475169, -0.1808739, 1, 1, 1, 1, 1,
0.7607036, -0.1801511, 1.462651, 1, 1, 1, 1, 1,
0.7632007, -0.3538244, 3.049336, 1, 1, 1, 1, 1,
0.764916, 0.4604838, 1.364556, 1, 1, 1, 1, 1,
0.7666132, -2.755553, 3.204085, 0, 0, 1, 1, 1,
0.768096, 1.211781, -0.1906358, 1, 0, 0, 1, 1,
0.768365, -1.085777, 3.266187, 1, 0, 0, 1, 1,
0.7775379, -0.5284157, 3.62634, 1, 0, 0, 1, 1,
0.7867604, 1.441747, 1.390264, 1, 0, 0, 1, 1,
0.7970172, -0.1632082, 1.3626, 1, 0, 0, 1, 1,
0.8025737, 0.8884595, 0.6279466, 0, 0, 0, 1, 1,
0.8054485, -1.209161, 5.588573, 0, 0, 0, 1, 1,
0.8073969, -0.2526808, 2.165058, 0, 0, 0, 1, 1,
0.8083623, -0.8246325, 2.677389, 0, 0, 0, 1, 1,
0.8083768, 0.9696202, 1.129942, 0, 0, 0, 1, 1,
0.8145967, 1.552323, -0.3632223, 0, 0, 0, 1, 1,
0.8146537, -0.0944358, 0.5402539, 0, 0, 0, 1, 1,
0.8152016, 1.457459, 1.520107, 1, 1, 1, 1, 1,
0.8155135, -0.4866612, 1.398659, 1, 1, 1, 1, 1,
0.8224363, 0.596472, -0.4318625, 1, 1, 1, 1, 1,
0.8234716, 0.07582038, 0.9133328, 1, 1, 1, 1, 1,
0.8269891, -2.172555, 2.807843, 1, 1, 1, 1, 1,
0.8289129, -0.4366386, 2.125996, 1, 1, 1, 1, 1,
0.8304473, -0.2400398, 1.395531, 1, 1, 1, 1, 1,
0.8324066, -0.5708212, 1.289266, 1, 1, 1, 1, 1,
0.8373447, -1.58777, 1.482525, 1, 1, 1, 1, 1,
0.845102, -0.5230462, 2.562678, 1, 1, 1, 1, 1,
0.8501172, 0.09859038, 1.784367, 1, 1, 1, 1, 1,
0.8562719, 0.05178653, 0.7520248, 1, 1, 1, 1, 1,
0.8593212, -0.3286475, 1.369609, 1, 1, 1, 1, 1,
0.8597465, -1.332335, 2.960876, 1, 1, 1, 1, 1,
0.8864202, -0.8101422, 3.231977, 1, 1, 1, 1, 1,
0.8881789, -0.7995984, 2.493784, 0, 0, 1, 1, 1,
0.8882589, 0.8200502, 1.456237, 1, 0, 0, 1, 1,
0.8903884, 1.103812, -0.5011162, 1, 0, 0, 1, 1,
0.9036038, -0.5982175, 0.9827493, 1, 0, 0, 1, 1,
0.909202, 0.06747827, 2.862803, 1, 0, 0, 1, 1,
0.9114707, 0.01727016, 1.586287, 1, 0, 0, 1, 1,
0.9129571, -0.6911737, 1.86238, 0, 0, 0, 1, 1,
0.9163938, -1.711738, 1.386064, 0, 0, 0, 1, 1,
0.9193514, -1.219637, 2.704733, 0, 0, 0, 1, 1,
0.9279894, -0.2328956, 1.234634, 0, 0, 0, 1, 1,
0.9313987, -0.08262163, 1.290308, 0, 0, 0, 1, 1,
0.9335218, 0.5234181, 1.836679, 0, 0, 0, 1, 1,
0.9357638, -0.3305749, 3.292095, 0, 0, 0, 1, 1,
0.93786, -1.281713, 2.140222, 1, 1, 1, 1, 1,
0.9403825, 0.8318709, 0.3951157, 1, 1, 1, 1, 1,
0.9449188, -0.9342157, 2.985742, 1, 1, 1, 1, 1,
0.9485252, 0.4193313, 1.72288, 1, 1, 1, 1, 1,
0.9552109, -0.9862233, 2.479733, 1, 1, 1, 1, 1,
0.958637, 0.5871791, -0.1038214, 1, 1, 1, 1, 1,
0.9679287, -0.5336591, 3.299991, 1, 1, 1, 1, 1,
0.9754464, 0.6316767, 1.318137, 1, 1, 1, 1, 1,
0.9758351, 0.9283879, -0.04799476, 1, 1, 1, 1, 1,
0.9830498, 0.4241404, 1.884741, 1, 1, 1, 1, 1,
0.9876285, -0.2738312, 0.5611767, 1, 1, 1, 1, 1,
0.995541, 0.2718229, 0.8861837, 1, 1, 1, 1, 1,
0.9984412, -0.4817597, 2.26228, 1, 1, 1, 1, 1,
1.002878, -1.013256, 3.763812, 1, 1, 1, 1, 1,
1.003418, -0.8093563, 2.19762, 1, 1, 1, 1, 1,
1.009952, -1.500092, 2.597589, 0, 0, 1, 1, 1,
1.016822, 0.4672183, 0.7704694, 1, 0, 0, 1, 1,
1.02211, -1.393963, 1.06437, 1, 0, 0, 1, 1,
1.023641, 0.773222, 1.519734, 1, 0, 0, 1, 1,
1.024315, 1.878871, -1.00148, 1, 0, 0, 1, 1,
1.029807, 1.014948, 2.153556, 1, 0, 0, 1, 1,
1.029973, 0.2908319, 0.9488254, 0, 0, 0, 1, 1,
1.036258, 1.212998, -0.5636756, 0, 0, 0, 1, 1,
1.038905, 0.2358407, 0.9491407, 0, 0, 0, 1, 1,
1.055371, 0.6823562, 0.4825061, 0, 0, 0, 1, 1,
1.057366, -1.878431, 3.256064, 0, 0, 0, 1, 1,
1.060458, 0.1587573, 2.093277, 0, 0, 0, 1, 1,
1.060492, 1.174845, 1.181435, 0, 0, 0, 1, 1,
1.066631, 0.1473539, 0.154065, 1, 1, 1, 1, 1,
1.082779, 0.4682223, 1.479985, 1, 1, 1, 1, 1,
1.084255, 0.5182233, 1.31986, 1, 1, 1, 1, 1,
1.085599, 0.1616403, 0.2905359, 1, 1, 1, 1, 1,
1.097188, -0.01786753, 2.373257, 1, 1, 1, 1, 1,
1.097905, -0.08521119, 1.989433, 1, 1, 1, 1, 1,
1.099586, 0.6365373, 2.302427, 1, 1, 1, 1, 1,
1.100564, 0.3670279, 2.324677, 1, 1, 1, 1, 1,
1.105258, -0.7265961, 1.254896, 1, 1, 1, 1, 1,
1.105281, -1.319813, 1.204708, 1, 1, 1, 1, 1,
1.108442, -2.921491, 1.742885, 1, 1, 1, 1, 1,
1.109615, -1.605282, 2.459664, 1, 1, 1, 1, 1,
1.112951, 1.118285, 2.383878, 1, 1, 1, 1, 1,
1.113965, -0.4444412, 0.8408822, 1, 1, 1, 1, 1,
1.122014, -2.008351, 2.787758, 1, 1, 1, 1, 1,
1.131539, 1.163455, 0.634603, 0, 0, 1, 1, 1,
1.132283, 0.4344267, 0.6879045, 1, 0, 0, 1, 1,
1.133499, 1.819821, -0.03521981, 1, 0, 0, 1, 1,
1.139471, 0.564541, 0.8514, 1, 0, 0, 1, 1,
1.140554, -0.3429427, 2.252245, 1, 0, 0, 1, 1,
1.145643, -0.09609448, 1.758947, 1, 0, 0, 1, 1,
1.14834, 0.1832636, 3.770936, 0, 0, 0, 1, 1,
1.149062, -0.6831734, 1.724328, 0, 0, 0, 1, 1,
1.149879, 0.9909926, 1.071888, 0, 0, 0, 1, 1,
1.150163, -0.4169846, 2.887414, 0, 0, 0, 1, 1,
1.151576, 0.5199044, 0.8469626, 0, 0, 0, 1, 1,
1.152869, -0.843529, 1.145981, 0, 0, 0, 1, 1,
1.154846, -0.5346137, 0.3052639, 0, 0, 0, 1, 1,
1.155897, -1.000904, 2.820893, 1, 1, 1, 1, 1,
1.158097, 0.6863915, 1.047821, 1, 1, 1, 1, 1,
1.160462, -0.2664208, 2.32997, 1, 1, 1, 1, 1,
1.164043, 0.1384682, 0.3264554, 1, 1, 1, 1, 1,
1.165068, -0.3840376, 1.499275, 1, 1, 1, 1, 1,
1.179665, -0.4902644, 1.816737, 1, 1, 1, 1, 1,
1.18256, 0.1170557, 1.101308, 1, 1, 1, 1, 1,
1.182646, 0.8066678, -0.05059489, 1, 1, 1, 1, 1,
1.187902, -1.779473, 1.948108, 1, 1, 1, 1, 1,
1.217009, 0.9593007, 0.2960829, 1, 1, 1, 1, 1,
1.217542, 1.191786, -0.3258315, 1, 1, 1, 1, 1,
1.219478, -1.26065, 1.603947, 1, 1, 1, 1, 1,
1.219887, 2.228172, 0.5840615, 1, 1, 1, 1, 1,
1.221671, -0.3578822, 3.384244, 1, 1, 1, 1, 1,
1.221817, -1.119078, 2.040688, 1, 1, 1, 1, 1,
1.226622, -1.147644, 2.455867, 0, 0, 1, 1, 1,
1.232048, -1.319703, 3.715916, 1, 0, 0, 1, 1,
1.232695, -0.8195184, 3.513462, 1, 0, 0, 1, 1,
1.234747, -0.2896713, 0.1260763, 1, 0, 0, 1, 1,
1.238218, -0.7146559, 3.344151, 1, 0, 0, 1, 1,
1.240314, 0.6527454, -0.2171633, 1, 0, 0, 1, 1,
1.241571, -0.2876137, 1.169252, 0, 0, 0, 1, 1,
1.245736, 1.59457, 2.152652, 0, 0, 0, 1, 1,
1.251222, -1.742289, 1.593043, 0, 0, 0, 1, 1,
1.261096, 1.056488, 2.838331, 0, 0, 0, 1, 1,
1.265783, -0.03241411, 0.6835009, 0, 0, 0, 1, 1,
1.269804, -0.4017809, 0.4304411, 0, 0, 0, 1, 1,
1.271612, -0.8020303, 2.843, 0, 0, 0, 1, 1,
1.272124, -1.138801, 2.984408, 1, 1, 1, 1, 1,
1.272886, -0.677247, 2.171129, 1, 1, 1, 1, 1,
1.279222, -0.05374322, 1.863844, 1, 1, 1, 1, 1,
1.293593, 0.894936, 1.334674, 1, 1, 1, 1, 1,
1.29536, 2.369731, 0.4055478, 1, 1, 1, 1, 1,
1.304025, 0.4683979, 1.231929, 1, 1, 1, 1, 1,
1.320155, -1.719466, 1.850249, 1, 1, 1, 1, 1,
1.327627, -1.597297, 1.12571, 1, 1, 1, 1, 1,
1.34615, 0.8251562, 0.2803068, 1, 1, 1, 1, 1,
1.366967, 0.4864664, 1.897168, 1, 1, 1, 1, 1,
1.36818, -0.5648749, 1.234969, 1, 1, 1, 1, 1,
1.370563, 0.8858297, 3.0982, 1, 1, 1, 1, 1,
1.372833, -1.446675, 2.918543, 1, 1, 1, 1, 1,
1.381092, -1.298607, 2.099105, 1, 1, 1, 1, 1,
1.381924, -0.4777116, 0.9464202, 1, 1, 1, 1, 1,
1.391818, 1.287864, 2.057375, 0, 0, 1, 1, 1,
1.392748, -0.415047, 1.959288, 1, 0, 0, 1, 1,
1.394499, -0.7663698, 1.185234, 1, 0, 0, 1, 1,
1.398966, -0.809089, 1.865806, 1, 0, 0, 1, 1,
1.414104, -0.5156184, 1.88805, 1, 0, 0, 1, 1,
1.423865, -0.5885154, 0.1503675, 1, 0, 0, 1, 1,
1.424324, 0.464947, 0.8312486, 0, 0, 0, 1, 1,
1.428017, -1.428201, 1.716956, 0, 0, 0, 1, 1,
1.430601, -1.862488, 1.131003, 0, 0, 0, 1, 1,
1.442379, -0.7551638, 2.126971, 0, 0, 0, 1, 1,
1.449667, -0.5782653, 2.649381, 0, 0, 0, 1, 1,
1.452552, 0.03383672, 3.750609, 0, 0, 0, 1, 1,
1.466511, -0.2728591, 0.6068144, 0, 0, 0, 1, 1,
1.467749, 0.684782, 2.384796, 1, 1, 1, 1, 1,
1.475731, 0.6289728, 0.04676102, 1, 1, 1, 1, 1,
1.483665, 1.622138, 0.98809, 1, 1, 1, 1, 1,
1.483753, 0.2906068, 0.6494604, 1, 1, 1, 1, 1,
1.483866, -0.459356, 1.525059, 1, 1, 1, 1, 1,
1.495948, -0.1936873, 1.572592, 1, 1, 1, 1, 1,
1.503789, 0.10295, 1.571073, 1, 1, 1, 1, 1,
1.510123, -1.040004, 3.195206, 1, 1, 1, 1, 1,
1.512669, 2.054638, 0.1921615, 1, 1, 1, 1, 1,
1.53371, -0.379593, 2.047023, 1, 1, 1, 1, 1,
1.536504, -0.1879856, 1.59937, 1, 1, 1, 1, 1,
1.545362, -0.2400443, 1.949652, 1, 1, 1, 1, 1,
1.55909, -2.047397, 4.463986, 1, 1, 1, 1, 1,
1.559348, -0.8857259, 2.205595, 1, 1, 1, 1, 1,
1.567161, -0.8771414, 1.592561, 1, 1, 1, 1, 1,
1.575267, -1.241933, 2.628451, 0, 0, 1, 1, 1,
1.57883, -1.817985, 3.235083, 1, 0, 0, 1, 1,
1.587456, -0.1590398, 1.490788, 1, 0, 0, 1, 1,
1.58821, 0.3563993, -1.05859, 1, 0, 0, 1, 1,
1.608272, 0.2488649, 2.302534, 1, 0, 0, 1, 1,
1.608386, 0.1969358, 0.3605961, 1, 0, 0, 1, 1,
1.610664, 0.2369212, 2.740853, 0, 0, 0, 1, 1,
1.626995, 0.4928558, 1.394745, 0, 0, 0, 1, 1,
1.649624, 0.545079, -0.09709468, 0, 0, 0, 1, 1,
1.651466, 1.132054, 0.7116027, 0, 0, 0, 1, 1,
1.653722, 0.4968943, 1.825099, 0, 0, 0, 1, 1,
1.656823, 0.550229, 2.780474, 0, 0, 0, 1, 1,
1.673216, 0.3423359, 2.266901, 0, 0, 0, 1, 1,
1.677518, -2.120148, 1.972623, 1, 1, 1, 1, 1,
1.679978, 0.1925947, 0.4214278, 1, 1, 1, 1, 1,
1.708237, -1.352482, 1.824234, 1, 1, 1, 1, 1,
1.72793, -0.5165474, 1.076921, 1, 1, 1, 1, 1,
1.734964, -1.101135, 1.40138, 1, 1, 1, 1, 1,
1.761381, -0.05426415, 2.375281, 1, 1, 1, 1, 1,
1.777159, -0.08801602, 0.8649656, 1, 1, 1, 1, 1,
1.798974, -0.8731096, 1.03006, 1, 1, 1, 1, 1,
1.808994, 0.8245191, 1.403935, 1, 1, 1, 1, 1,
1.811593, 1.150669, -0.1244472, 1, 1, 1, 1, 1,
1.814803, 0.4609234, 1.348459, 1, 1, 1, 1, 1,
1.81639, 0.6633528, -0.5507191, 1, 1, 1, 1, 1,
1.852146, 0.6251552, 2.291272, 1, 1, 1, 1, 1,
1.86838, -0.0542846, 4.514163, 1, 1, 1, 1, 1,
1.878738, -1.050588, 3.060222, 1, 1, 1, 1, 1,
1.879469, -0.4206122, 2.012605, 0, 0, 1, 1, 1,
1.907137, 0.03265189, 1.491307, 1, 0, 0, 1, 1,
1.946025, -0.2405542, 1.219979, 1, 0, 0, 1, 1,
1.974298, 1.305527, 1.184417, 1, 0, 0, 1, 1,
2.011765, -0.6448241, 2.165326, 1, 0, 0, 1, 1,
2.084102, 1.203856, 1.000068, 1, 0, 0, 1, 1,
2.089986, 1.787939, -0.1385084, 0, 0, 0, 1, 1,
2.099836, 0.1694944, 1.054317, 0, 0, 0, 1, 1,
2.178756, -0.6735087, 1.616625, 0, 0, 0, 1, 1,
2.207144, -0.3570195, 1.077804, 0, 0, 0, 1, 1,
2.252346, 0.5785117, 1.613107, 0, 0, 0, 1, 1,
2.270683, -0.309061, 0.8331507, 0, 0, 0, 1, 1,
2.382367, 1.438138, 1.629952, 0, 0, 0, 1, 1,
2.460926, 0.1426648, 1.821711, 1, 1, 1, 1, 1,
2.462748, 0.7368569, 1.083889, 1, 1, 1, 1, 1,
2.488156, -0.4702964, 1.130886, 1, 1, 1, 1, 1,
2.626827, -1.77947, 2.751954, 1, 1, 1, 1, 1,
2.641992, 1.264087, 0.7573496, 1, 1, 1, 1, 1,
2.752713, -0.5456581, 1.3798, 1, 1, 1, 1, 1,
3.490316, -0.1791723, 0.4146632, 1, 1, 1, 1, 1
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
var radius = 9.813784;
var distance = 34.4705;
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
mvMatrix.translate( -0.2043695, -0.429937, -0.1212997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.4705);
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