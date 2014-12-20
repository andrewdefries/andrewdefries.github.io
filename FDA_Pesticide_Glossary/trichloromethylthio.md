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
-2.826718, 0.2261143, -1.825186, 1, 0, 0, 1,
-2.724423, -0.02219268, -2.051616, 1, 0.007843138, 0, 1,
-2.59892, -0.5442036, -0.5781532, 1, 0.01176471, 0, 1,
-2.519441, -0.6452285, -1.422433, 1, 0.01960784, 0, 1,
-2.351216, 0.01878295, -1.031087, 1, 0.02352941, 0, 1,
-2.24515, 0.8103557, 0.7838716, 1, 0.03137255, 0, 1,
-2.221311, -0.2553321, -2.123602, 1, 0.03529412, 0, 1,
-2.21025, 0.350771, -2.909588, 1, 0.04313726, 0, 1,
-2.153095, 0.09428976, -1.39883, 1, 0.04705882, 0, 1,
-2.129344, -0.5897315, -0.1685745, 1, 0.05490196, 0, 1,
-2.122257, 0.905478, -1.281759, 1, 0.05882353, 0, 1,
-2.113114, 0.7850558, -0.2656478, 1, 0.06666667, 0, 1,
-2.01153, -1.772943, -5.267125, 1, 0.07058824, 0, 1,
-2.004355, -1.338356, -2.293099, 1, 0.07843138, 0, 1,
-1.966089, 1.194204, -2.038205, 1, 0.08235294, 0, 1,
-1.959046, 0.1168945, -2.29422, 1, 0.09019608, 0, 1,
-1.957492, 0.2637571, -0.8317136, 1, 0.09411765, 0, 1,
-1.948037, -1.610519, -3.413051, 1, 0.1019608, 0, 1,
-1.93587, 0.2182975, -0.9428552, 1, 0.1098039, 0, 1,
-1.905912, -1.54058, -1.168963, 1, 0.1137255, 0, 1,
-1.886754, 0.6687815, -3.226424, 1, 0.1215686, 0, 1,
-1.857441, -0.8001112, -0.4484248, 1, 0.1254902, 0, 1,
-1.850043, 1.042382, -0.3266345, 1, 0.1333333, 0, 1,
-1.840473, 0.6633575, -0.8754822, 1, 0.1372549, 0, 1,
-1.830824, 0.1468516, -2.033405, 1, 0.145098, 0, 1,
-1.809523, -0.6966653, -1.202675, 1, 0.1490196, 0, 1,
-1.803676, -0.2521939, -1.878643, 1, 0.1568628, 0, 1,
-1.792841, 0.7347829, -3.049563, 1, 0.1607843, 0, 1,
-1.770204, 1.069794, 1.990791, 1, 0.1686275, 0, 1,
-1.748959, -0.5150556, -2.529022, 1, 0.172549, 0, 1,
-1.733915, 0.3863417, -1.689425, 1, 0.1803922, 0, 1,
-1.730757, -0.780362, -1.594381, 1, 0.1843137, 0, 1,
-1.729018, -1.331372, -1.182627, 1, 0.1921569, 0, 1,
-1.720152, -2.486636, -2.98628, 1, 0.1960784, 0, 1,
-1.715312, 2.074027, -1.3961, 1, 0.2039216, 0, 1,
-1.702373, 1.149023, -0.7577125, 1, 0.2117647, 0, 1,
-1.686996, -1.518243, -1.738054, 1, 0.2156863, 0, 1,
-1.682738, -1.663335, -3.932842, 1, 0.2235294, 0, 1,
-1.636441, 0.6223401, -1.305164, 1, 0.227451, 0, 1,
-1.618586, 0.734391, -2.231328, 1, 0.2352941, 0, 1,
-1.613032, 0.9708523, -1.609399, 1, 0.2392157, 0, 1,
-1.606936, -0.2760415, -1.505324, 1, 0.2470588, 0, 1,
-1.596405, -0.07401567, -0.86569, 1, 0.2509804, 0, 1,
-1.595331, -0.2528507, -0.6476663, 1, 0.2588235, 0, 1,
-1.593162, -0.4073818, -2.824761, 1, 0.2627451, 0, 1,
-1.582141, 1.541309, -0.3413723, 1, 0.2705882, 0, 1,
-1.580905, 1.029112, -2.131461, 1, 0.2745098, 0, 1,
-1.573028, -0.463062, -1.201154, 1, 0.282353, 0, 1,
-1.561332, -0.13735, -0.04145995, 1, 0.2862745, 0, 1,
-1.541121, 0.9224005, -2.138965, 1, 0.2941177, 0, 1,
-1.540967, -0.7516671, -2.895096, 1, 0.3019608, 0, 1,
-1.513049, 1.148563, -0.06782546, 1, 0.3058824, 0, 1,
-1.5039, -0.6059879, -1.933939, 1, 0.3137255, 0, 1,
-1.503124, 0.881884, -0.4963354, 1, 0.3176471, 0, 1,
-1.474978, -0.6043985, -0.7060758, 1, 0.3254902, 0, 1,
-1.474935, 1.868597, -0.2613001, 1, 0.3294118, 0, 1,
-1.473601, -0.9477535, -1.240378, 1, 0.3372549, 0, 1,
-1.471058, 0.3796453, -2.920032, 1, 0.3411765, 0, 1,
-1.459712, -0.02951895, 0.3137097, 1, 0.3490196, 0, 1,
-1.447132, 1.163509, -1.139277, 1, 0.3529412, 0, 1,
-1.425879, 0.2160913, -0.7074145, 1, 0.3607843, 0, 1,
-1.425254, -1.497058, -1.727303, 1, 0.3647059, 0, 1,
-1.417984, 0.5811059, -0.9740973, 1, 0.372549, 0, 1,
-1.417894, -1.148371, -1.333949, 1, 0.3764706, 0, 1,
-1.405624, 0.4878391, -1.065779, 1, 0.3843137, 0, 1,
-1.392389, 0.7113881, -0.4734899, 1, 0.3882353, 0, 1,
-1.38871, -0.8684758, -1.455336, 1, 0.3960784, 0, 1,
-1.385577, 0.1029812, -1.577582, 1, 0.4039216, 0, 1,
-1.378634, -0.6464498, -1.581838, 1, 0.4078431, 0, 1,
-1.375997, 0.1782966, -0.9430401, 1, 0.4156863, 0, 1,
-1.368343, 0.2646962, -1.423983, 1, 0.4196078, 0, 1,
-1.364608, -0.2753179, 0.1235324, 1, 0.427451, 0, 1,
-1.363241, -1.427714, -2.959584, 1, 0.4313726, 0, 1,
-1.359446, 0.04557294, -0.2330092, 1, 0.4392157, 0, 1,
-1.351684, -0.4375934, -0.6941837, 1, 0.4431373, 0, 1,
-1.343565, -0.5873225, -3.157021, 1, 0.4509804, 0, 1,
-1.341729, 0.3625277, -1.701025, 1, 0.454902, 0, 1,
-1.337019, -0.2180502, -2.343102, 1, 0.4627451, 0, 1,
-1.334761, 0.891783, -2.227749, 1, 0.4666667, 0, 1,
-1.333914, 0.6683654, -2.201476, 1, 0.4745098, 0, 1,
-1.332127, 1.119395, -0.9598999, 1, 0.4784314, 0, 1,
-1.303126, 0.1271633, -1.641115, 1, 0.4862745, 0, 1,
-1.300718, 1.061471, -0.4619855, 1, 0.4901961, 0, 1,
-1.297221, -0.6235986, -3.310736, 1, 0.4980392, 0, 1,
-1.295763, 1.417401, -1.136676, 1, 0.5058824, 0, 1,
-1.294101, -0.5703356, -2.122198, 1, 0.509804, 0, 1,
-1.285214, -0.09406719, -1.723183, 1, 0.5176471, 0, 1,
-1.283304, 1.13958, -0.8201047, 1, 0.5215687, 0, 1,
-1.276562, 0.01977894, -1.306746, 1, 0.5294118, 0, 1,
-1.267601, -1.812822, -1.139062, 1, 0.5333334, 0, 1,
-1.265115, 1.228299, -2.042309, 1, 0.5411765, 0, 1,
-1.259456, -0.09779118, -0.8976206, 1, 0.5450981, 0, 1,
-1.257868, -0.8209797, -2.074009, 1, 0.5529412, 0, 1,
-1.25385, -1.052927, -3.402593, 1, 0.5568628, 0, 1,
-1.252021, -1.293398, -2.502171, 1, 0.5647059, 0, 1,
-1.245057, -0.7576473, -2.956245, 1, 0.5686275, 0, 1,
-1.241543, 0.2471354, -1.957548, 1, 0.5764706, 0, 1,
-1.239751, -1.012092, -1.465054, 1, 0.5803922, 0, 1,
-1.23964, -0.09780774, -2.172472, 1, 0.5882353, 0, 1,
-1.23684, -0.5322347, -2.02431, 1, 0.5921569, 0, 1,
-1.235485, 0.6469757, -1.736694, 1, 0.6, 0, 1,
-1.229317, -0.08888074, -2.26815, 1, 0.6078432, 0, 1,
-1.217771, -1.767471, -4.770778, 1, 0.6117647, 0, 1,
-1.217294, -0.2323173, -1.643428, 1, 0.6196079, 0, 1,
-1.215258, 0.9483764, -1.712594, 1, 0.6235294, 0, 1,
-1.204882, 0.311704, -1.632652, 1, 0.6313726, 0, 1,
-1.200162, -2.250416, -2.852854, 1, 0.6352941, 0, 1,
-1.197722, -0.4064737, -1.547064, 1, 0.6431373, 0, 1,
-1.187227, -0.02857574, -2.337456, 1, 0.6470588, 0, 1,
-1.179526, -0.3454281, -2.698581, 1, 0.654902, 0, 1,
-1.179128, 1.141516, -1.238242, 1, 0.6588235, 0, 1,
-1.176222, -1.093636, -3.268331, 1, 0.6666667, 0, 1,
-1.17089, 0.6945459, -3.094479, 1, 0.6705883, 0, 1,
-1.164544, 0.8521777, -1.594983, 1, 0.6784314, 0, 1,
-1.156618, -1.408551, -3.234707, 1, 0.682353, 0, 1,
-1.153975, -0.2449617, -1.359586, 1, 0.6901961, 0, 1,
-1.151721, 1.947533, 0.3574497, 1, 0.6941177, 0, 1,
-1.149662, 0.532747, -1.74673, 1, 0.7019608, 0, 1,
-1.141573, -0.1336208, -0.6282295, 1, 0.7098039, 0, 1,
-1.129339, 0.5339667, 0.06238085, 1, 0.7137255, 0, 1,
-1.129002, 0.09414794, -1.913955, 1, 0.7215686, 0, 1,
-1.12599, -0.2648907, -2.250375, 1, 0.7254902, 0, 1,
-1.123274, -1.971161, -2.64128, 1, 0.7333333, 0, 1,
-1.120452, 0.6287628, 0.6907931, 1, 0.7372549, 0, 1,
-1.120214, -0.1772842, -0.6497039, 1, 0.7450981, 0, 1,
-1.115426, -0.105832, -3.048304, 1, 0.7490196, 0, 1,
-1.10964, -0.0964174, -2.31773, 1, 0.7568628, 0, 1,
-1.109165, -0.1514468, -2.232953, 1, 0.7607843, 0, 1,
-1.109035, -0.9553246, -2.225646, 1, 0.7686275, 0, 1,
-1.104778, -0.5351911, -3.20822, 1, 0.772549, 0, 1,
-1.099475, 0.5274418, -1.616874, 1, 0.7803922, 0, 1,
-1.096603, 0.169998, -2.056423, 1, 0.7843137, 0, 1,
-1.079891, -0.1652441, -2.611396, 1, 0.7921569, 0, 1,
-1.073459, 0.2181973, -2.119199, 1, 0.7960784, 0, 1,
-1.071898, -0.4156478, -2.260192, 1, 0.8039216, 0, 1,
-1.068908, 1.273453, -2.40543, 1, 0.8117647, 0, 1,
-1.062181, 0.2965049, 0.2770126, 1, 0.8156863, 0, 1,
-1.059312, -0.3375451, -2.504264, 1, 0.8235294, 0, 1,
-1.054405, -0.5493155, -1.012576, 1, 0.827451, 0, 1,
-1.047571, -0.259141, -4.37662, 1, 0.8352941, 0, 1,
-1.039268, -1.768105, -4.019997, 1, 0.8392157, 0, 1,
-1.038036, -0.5680652, -2.54103, 1, 0.8470588, 0, 1,
-1.019937, 0.3088567, -1.181741, 1, 0.8509804, 0, 1,
-1.019208, -1.286674, -3.6022, 1, 0.8588235, 0, 1,
-1.017915, 0.5031064, 0.2568614, 1, 0.8627451, 0, 1,
-1.010045, 0.1679503, -1.096903, 1, 0.8705882, 0, 1,
-0.9882411, 1.121518, -1.872672, 1, 0.8745098, 0, 1,
-0.9867972, -0.3956979, -1.695524, 1, 0.8823529, 0, 1,
-0.9851175, -0.4968863, -3.906607, 1, 0.8862745, 0, 1,
-0.9802811, 0.3223504, -0.4410323, 1, 0.8941177, 0, 1,
-0.9735754, -0.1046753, -0.947697, 1, 0.8980392, 0, 1,
-0.9734686, -0.1322712, -1.290278, 1, 0.9058824, 0, 1,
-0.9719627, 2.367551, -0.8270816, 1, 0.9137255, 0, 1,
-0.9707033, -1.671242, -3.030813, 1, 0.9176471, 0, 1,
-0.9654662, -1.773382, -2.903301, 1, 0.9254902, 0, 1,
-0.9627947, 2.031331, -0.8391516, 1, 0.9294118, 0, 1,
-0.9590597, 1.100798, -0.7292464, 1, 0.9372549, 0, 1,
-0.9584628, 0.8722121, -0.1810701, 1, 0.9411765, 0, 1,
-0.9584449, -0.5263579, -1.25317, 1, 0.9490196, 0, 1,
-0.9567679, 0.2174999, -2.92513, 1, 0.9529412, 0, 1,
-0.9566206, -0.4434466, -1.45553, 1, 0.9607843, 0, 1,
-0.9443979, -1.321736, -2.518621, 1, 0.9647059, 0, 1,
-0.9389135, -0.6332946, -2.226396, 1, 0.972549, 0, 1,
-0.9377959, 1.563667, -0.5295202, 1, 0.9764706, 0, 1,
-0.9367856, -2.7382, -0.6395003, 1, 0.9843137, 0, 1,
-0.9359052, 0.05650838, -2.199459, 1, 0.9882353, 0, 1,
-0.9343255, -0.8189316, -3.762198, 1, 0.9960784, 0, 1,
-0.9248832, -0.4678276, -2.466011, 0.9960784, 1, 0, 1,
-0.9098672, 0.001764441, -1.501072, 0.9921569, 1, 0, 1,
-0.9090859, 1.353856, -0.6263778, 0.9843137, 1, 0, 1,
-0.9039642, -0.03519132, -0.5056682, 0.9803922, 1, 0, 1,
-0.9005424, -0.8545219, -2.577497, 0.972549, 1, 0, 1,
-0.8945103, -0.2186249, -1.383868, 0.9686275, 1, 0, 1,
-0.8937474, -1.215734, -2.387322, 0.9607843, 1, 0, 1,
-0.8884203, 0.195913, 1.669167, 0.9568627, 1, 0, 1,
-0.8873098, -0.8159432, -4.029458, 0.9490196, 1, 0, 1,
-0.8848922, 0.4644539, -2.835603, 0.945098, 1, 0, 1,
-0.8767833, -0.1045151, -0.7590481, 0.9372549, 1, 0, 1,
-0.8760757, 0.572548, -0.8455199, 0.9333333, 1, 0, 1,
-0.8752019, -1.556367, -4.887315, 0.9254902, 1, 0, 1,
-0.873939, 0.510775, -0.8879226, 0.9215686, 1, 0, 1,
-0.8720998, -0.6814418, -3.092166, 0.9137255, 1, 0, 1,
-0.8718377, 1.360858, -0.7560955, 0.9098039, 1, 0, 1,
-0.8703635, 0.8555776, -0.1064354, 0.9019608, 1, 0, 1,
-0.8512132, 0.6750873, 0.02120106, 0.8941177, 1, 0, 1,
-0.8473182, 0.5380589, -0.8588343, 0.8901961, 1, 0, 1,
-0.8468677, 0.6176853, -0.6833122, 0.8823529, 1, 0, 1,
-0.843398, -1.579856, -2.315069, 0.8784314, 1, 0, 1,
-0.8433686, 2.391013, -0.6167033, 0.8705882, 1, 0, 1,
-0.8388922, -0.6067602, -2.731231, 0.8666667, 1, 0, 1,
-0.8338831, 0.1372587, -1.288, 0.8588235, 1, 0, 1,
-0.8280872, 0.08436929, -1.522614, 0.854902, 1, 0, 1,
-0.8279901, -0.673035, -2.998647, 0.8470588, 1, 0, 1,
-0.8259764, -0.2683414, -1.064937, 0.8431373, 1, 0, 1,
-0.8258491, -0.4169131, -3.859281, 0.8352941, 1, 0, 1,
-0.8220072, -1.207389, -1.906443, 0.8313726, 1, 0, 1,
-0.818957, 0.2906016, -2.71566, 0.8235294, 1, 0, 1,
-0.8169974, -1.801191, -2.655476, 0.8196079, 1, 0, 1,
-0.8162007, -0.7386461, -3.15097, 0.8117647, 1, 0, 1,
-0.8115864, -0.7320359, -2.404667, 0.8078431, 1, 0, 1,
-0.8110219, 0.2927836, -0.9618474, 0.8, 1, 0, 1,
-0.8087594, 0.1181164, -1.089555, 0.7921569, 1, 0, 1,
-0.8076599, -1.951593, -3.624301, 0.7882353, 1, 0, 1,
-0.7994841, 0.05829459, -0.387862, 0.7803922, 1, 0, 1,
-0.7993162, -0.2408566, -3.460979, 0.7764706, 1, 0, 1,
-0.7967981, 0.3880327, -2.425009, 0.7686275, 1, 0, 1,
-0.7966135, -0.5295595, -0.6129866, 0.7647059, 1, 0, 1,
-0.7920571, -1.218941, -1.657983, 0.7568628, 1, 0, 1,
-0.7916814, 0.3843748, -1.25735, 0.7529412, 1, 0, 1,
-0.7887494, 0.1944198, -1.47519, 0.7450981, 1, 0, 1,
-0.7855068, 2.115691, 1.080327, 0.7411765, 1, 0, 1,
-0.7854661, 0.1109877, -0.9598754, 0.7333333, 1, 0, 1,
-0.7847292, -1.788046, -5.725914, 0.7294118, 1, 0, 1,
-0.7836428, -0.6607103, -1.00704, 0.7215686, 1, 0, 1,
-0.7835114, -0.0887021, 0.1095102, 0.7176471, 1, 0, 1,
-0.7788721, 0.636926, 1.125826, 0.7098039, 1, 0, 1,
-0.7630166, -0.8326615, -2.633014, 0.7058824, 1, 0, 1,
-0.7604514, 1.20301, -0.1613228, 0.6980392, 1, 0, 1,
-0.7598676, -0.08912357, -2.291991, 0.6901961, 1, 0, 1,
-0.7584519, -2.580041, -1.027935, 0.6862745, 1, 0, 1,
-0.7576982, 1.362717, 0.1833004, 0.6784314, 1, 0, 1,
-0.7576646, 1.345154, 0.174922, 0.6745098, 1, 0, 1,
-0.7517465, 0.0981743, -1.268727, 0.6666667, 1, 0, 1,
-0.7516652, -0.2903367, -1.946726, 0.6627451, 1, 0, 1,
-0.7480848, -0.2159145, -0.7155687, 0.654902, 1, 0, 1,
-0.7453887, 0.8380077, -0.7536139, 0.6509804, 1, 0, 1,
-0.7425267, -0.4901619, -2.379562, 0.6431373, 1, 0, 1,
-0.7401058, -0.3042608, -2.999418, 0.6392157, 1, 0, 1,
-0.7394543, 0.6937981, 0.2251363, 0.6313726, 1, 0, 1,
-0.739066, 0.407862, -1.198699, 0.627451, 1, 0, 1,
-0.7362317, 0.6369209, -2.029657, 0.6196079, 1, 0, 1,
-0.7308578, 0.1232606, 0.07465288, 0.6156863, 1, 0, 1,
-0.7307695, -0.02447001, -2.77504, 0.6078432, 1, 0, 1,
-0.7294472, 0.5612409, 0.5103395, 0.6039216, 1, 0, 1,
-0.7178288, 1.268348, -0.8936138, 0.5960785, 1, 0, 1,
-0.7150543, -0.3284899, -2.942669, 0.5882353, 1, 0, 1,
-0.7146101, -1.04166, -2.924841, 0.5843138, 1, 0, 1,
-0.7112973, 0.9441127, -1.026909, 0.5764706, 1, 0, 1,
-0.705978, -2.251565, -4.142505, 0.572549, 1, 0, 1,
-0.7040232, 0.6580882, -1.982877, 0.5647059, 1, 0, 1,
-0.7022457, 1.368825, 0.3220152, 0.5607843, 1, 0, 1,
-0.7008834, -0.07128583, -2.293939, 0.5529412, 1, 0, 1,
-0.6995162, -0.9922746, -2.724441, 0.5490196, 1, 0, 1,
-0.6974875, 3.714635, 1.607197, 0.5411765, 1, 0, 1,
-0.6962488, -0.4646403, -0.05202379, 0.5372549, 1, 0, 1,
-0.6909007, -1.151638, -3.067101, 0.5294118, 1, 0, 1,
-0.6898629, 0.4389248, -0.2861777, 0.5254902, 1, 0, 1,
-0.6846978, 1.28628, 0.7304748, 0.5176471, 1, 0, 1,
-0.682969, -1.580135, -0.9528852, 0.5137255, 1, 0, 1,
-0.6828098, 0.8775657, -0.32333, 0.5058824, 1, 0, 1,
-0.6822082, -0.157649, -0.9733945, 0.5019608, 1, 0, 1,
-0.6718293, -0.8441614, 0.4884315, 0.4941176, 1, 0, 1,
-0.6705723, 0.8928363, -1.08953, 0.4862745, 1, 0, 1,
-0.6635047, -1.796261, -3.663513, 0.4823529, 1, 0, 1,
-0.6620225, 0.3473023, -0.9888583, 0.4745098, 1, 0, 1,
-0.6585976, 0.136874, -2.39744, 0.4705882, 1, 0, 1,
-0.6585208, 0.7643464, -0.3625306, 0.4627451, 1, 0, 1,
-0.6583005, -2.048033, -0.5584361, 0.4588235, 1, 0, 1,
-0.6556116, -1.350072, -3.128543, 0.4509804, 1, 0, 1,
-0.6543607, -0.6384031, -1.649707, 0.4470588, 1, 0, 1,
-0.653181, 0.3121536, 0.3911366, 0.4392157, 1, 0, 1,
-0.6530685, -0.4275302, -2.862664, 0.4352941, 1, 0, 1,
-0.6469517, 1.514705, -0.4772741, 0.427451, 1, 0, 1,
-0.6447265, 1.436221, -0.6674141, 0.4235294, 1, 0, 1,
-0.6422918, -0.09596629, -1.655811, 0.4156863, 1, 0, 1,
-0.634022, -0.2892999, -2.96916, 0.4117647, 1, 0, 1,
-0.6306509, -2.006188, -3.214044, 0.4039216, 1, 0, 1,
-0.6266192, -0.3221702, -1.940366, 0.3960784, 1, 0, 1,
-0.6258708, 0.4521828, -1.792129, 0.3921569, 1, 0, 1,
-0.619567, 0.8177522, -0.3556338, 0.3843137, 1, 0, 1,
-0.6182291, 1.460868, -0.4584457, 0.3803922, 1, 0, 1,
-0.6169003, -1.995646, -1.314873, 0.372549, 1, 0, 1,
-0.6165045, -0.2976277, -0.8354427, 0.3686275, 1, 0, 1,
-0.6112854, -0.5434263, -2.567255, 0.3607843, 1, 0, 1,
-0.6031888, 0.102658, -0.9528759, 0.3568628, 1, 0, 1,
-0.6008337, 0.4388921, -2.302032, 0.3490196, 1, 0, 1,
-0.5973553, -1.796136, -3.725683, 0.345098, 1, 0, 1,
-0.5944609, -1.119994, -1.090029, 0.3372549, 1, 0, 1,
-0.5944287, -1.315189, -3.475909, 0.3333333, 1, 0, 1,
-0.5933298, -0.2190586, -1.734847, 0.3254902, 1, 0, 1,
-0.5923974, 2.14421, 1.721174, 0.3215686, 1, 0, 1,
-0.5889201, 1.341315, -0.3405359, 0.3137255, 1, 0, 1,
-0.5885841, 1.651634, 1.399919, 0.3098039, 1, 0, 1,
-0.5827446, -0.7816906, -1.45503, 0.3019608, 1, 0, 1,
-0.5816746, -0.2443192, -1.989535, 0.2941177, 1, 0, 1,
-0.5803056, -0.1965058, -1.002015, 0.2901961, 1, 0, 1,
-0.5774345, 0.1951263, -1.63519, 0.282353, 1, 0, 1,
-0.576922, -0.8075675, -2.092294, 0.2784314, 1, 0, 1,
-0.5742825, -0.3549445, -1.096781, 0.2705882, 1, 0, 1,
-0.5734281, -0.897719, -2.385702, 0.2666667, 1, 0, 1,
-0.5703763, -0.4267615, -2.199691, 0.2588235, 1, 0, 1,
-0.5600722, -1.426496, -2.976743, 0.254902, 1, 0, 1,
-0.5598907, -0.8417552, -3.355532, 0.2470588, 1, 0, 1,
-0.5572073, 1.128664, -1.230742, 0.2431373, 1, 0, 1,
-0.5553819, -0.02811406, -1.946223, 0.2352941, 1, 0, 1,
-0.5551158, -0.896969, -1.91443, 0.2313726, 1, 0, 1,
-0.5451329, 0.02362854, 0.04808743, 0.2235294, 1, 0, 1,
-0.5429526, 1.016973, 1.476903, 0.2196078, 1, 0, 1,
-0.5341963, 0.5596699, -1.818583, 0.2117647, 1, 0, 1,
-0.5273613, -0.7777828, -3.573304, 0.2078431, 1, 0, 1,
-0.5172433, 0.3410163, -1.259641, 0.2, 1, 0, 1,
-0.5160875, -0.3618322, 0.6228573, 0.1921569, 1, 0, 1,
-0.5154771, -0.1845189, -2.877017, 0.1882353, 1, 0, 1,
-0.5129328, 0.7983403, -2.09691, 0.1803922, 1, 0, 1,
-0.5127525, -1.121459, -3.780169, 0.1764706, 1, 0, 1,
-0.5080902, 0.9789591, 0.1400043, 0.1686275, 1, 0, 1,
-0.5070416, -0.18492, -2.369105, 0.1647059, 1, 0, 1,
-0.5063894, -0.5067917, -1.514536, 0.1568628, 1, 0, 1,
-0.5041844, -0.7021546, -2.569602, 0.1529412, 1, 0, 1,
-0.497941, 0.6029125, -0.5945713, 0.145098, 1, 0, 1,
-0.4978018, -0.9658158, -3.32854, 0.1411765, 1, 0, 1,
-0.4959872, -0.7398344, -0.02962046, 0.1333333, 1, 0, 1,
-0.4891059, 0.4050468, 0.2987024, 0.1294118, 1, 0, 1,
-0.4846296, -1.550691, -2.403453, 0.1215686, 1, 0, 1,
-0.4816315, 1.934045, -1.769362, 0.1176471, 1, 0, 1,
-0.4759055, -0.03465747, -2.360279, 0.1098039, 1, 0, 1,
-0.4753176, -0.1923007, -0.9344033, 0.1058824, 1, 0, 1,
-0.4742332, 0.9376533, 0.3400937, 0.09803922, 1, 0, 1,
-0.4720411, -1.219962, -4.346014, 0.09019608, 1, 0, 1,
-0.4653375, -0.6746481, -3.886171, 0.08627451, 1, 0, 1,
-0.4647496, -0.9716726, -3.278345, 0.07843138, 1, 0, 1,
-0.4598602, 0.5460828, -1.12562, 0.07450981, 1, 0, 1,
-0.4522395, -0.6420638, -1.414696, 0.06666667, 1, 0, 1,
-0.4514201, 0.7782393, -0.6147859, 0.0627451, 1, 0, 1,
-0.4440697, -0.7654068, -5.217773, 0.05490196, 1, 0, 1,
-0.4348328, 1.056128, 0.2503227, 0.05098039, 1, 0, 1,
-0.4184597, 0.5393241, -0.1316691, 0.04313726, 1, 0, 1,
-0.4179699, -1.029649, -1.944083, 0.03921569, 1, 0, 1,
-0.4128376, 1.171755, 0.3102236, 0.03137255, 1, 0, 1,
-0.4116351, -0.09364209, -1.792926, 0.02745098, 1, 0, 1,
-0.41119, 0.4299876, -0.4701916, 0.01960784, 1, 0, 1,
-0.399758, 0.408455, -1.282766, 0.01568628, 1, 0, 1,
-0.3988311, 0.630563, 0.8742959, 0.007843138, 1, 0, 1,
-0.397966, 0.8961538, -0.8739991, 0.003921569, 1, 0, 1,
-0.3972273, -1.095078, -3.686053, 0, 1, 0.003921569, 1,
-0.3969513, 0.7086157, -1.145085, 0, 1, 0.01176471, 1,
-0.3956328, 1.391995, 0.8181211, 0, 1, 0.01568628, 1,
-0.3926371, 1.089626, 0.5938594, 0, 1, 0.02352941, 1,
-0.3922051, -0.8586868, -2.887867, 0, 1, 0.02745098, 1,
-0.3842268, -0.791541, -1.180008, 0, 1, 0.03529412, 1,
-0.3829185, -0.2970301, -1.803538, 0, 1, 0.03921569, 1,
-0.3816261, -0.5614244, -1.355948, 0, 1, 0.04705882, 1,
-0.3779545, -0.6394462, -2.609089, 0, 1, 0.05098039, 1,
-0.3758807, -1.447239, -2.929552, 0, 1, 0.05882353, 1,
-0.3713184, 1.33792, -1.412885, 0, 1, 0.0627451, 1,
-0.3684668, 0.723392, -0.858031, 0, 1, 0.07058824, 1,
-0.3676256, -0.720274, -2.331438, 0, 1, 0.07450981, 1,
-0.3662134, 0.2253644, -2.834221, 0, 1, 0.08235294, 1,
-0.3654808, -0.6716045, -4.523111, 0, 1, 0.08627451, 1,
-0.364303, -1.323259, -3.489069, 0, 1, 0.09411765, 1,
-0.3633571, -1.798593, -2.293436, 0, 1, 0.1019608, 1,
-0.3592496, -0.94891, -4.434015, 0, 1, 0.1058824, 1,
-0.3578386, 0.1271451, -1.931558, 0, 1, 0.1137255, 1,
-0.3542007, 2.857042, 0.1062492, 0, 1, 0.1176471, 1,
-0.3516537, -1.208859, -2.379323, 0, 1, 0.1254902, 1,
-0.3496719, -1.219268, -1.944452, 0, 1, 0.1294118, 1,
-0.3416327, -1.136461, -2.11259, 0, 1, 0.1372549, 1,
-0.3410601, 0.609189, -0.9033698, 0, 1, 0.1411765, 1,
-0.3408241, -1.304287, -4.073649, 0, 1, 0.1490196, 1,
-0.3338806, 0.5715603, 0.7957874, 0, 1, 0.1529412, 1,
-0.3332121, 0.3592408, -0.1198993, 0, 1, 0.1607843, 1,
-0.3328452, 0.7756491, -0.367409, 0, 1, 0.1647059, 1,
-0.3281401, 0.1974522, -1.568775, 0, 1, 0.172549, 1,
-0.3194827, 2.177599, -0.7353296, 0, 1, 0.1764706, 1,
-0.3134449, -0.7847918, -2.212546, 0, 1, 0.1843137, 1,
-0.3131964, -1.109793, -3.32105, 0, 1, 0.1882353, 1,
-0.3055603, -0.6818133, -1.414961, 0, 1, 0.1960784, 1,
-0.3050334, 0.8795422, -1.187281, 0, 1, 0.2039216, 1,
-0.3006539, -0.1251266, -1.373147, 0, 1, 0.2078431, 1,
-0.2964749, 1.597292, -1.420254, 0, 1, 0.2156863, 1,
-0.2959161, -0.2684113, -3.486506, 0, 1, 0.2196078, 1,
-0.2957723, -0.2389468, -1.215385, 0, 1, 0.227451, 1,
-0.2948343, 0.6200728, -0.3594669, 0, 1, 0.2313726, 1,
-0.2847842, 0.7117289, -1.38201, 0, 1, 0.2392157, 1,
-0.284656, 0.0341914, -1.736531, 0, 1, 0.2431373, 1,
-0.2822898, -0.1958593, -3.880711, 0, 1, 0.2509804, 1,
-0.2677977, -1.661111, -3.551423, 0, 1, 0.254902, 1,
-0.2651418, 1.571832, 0.4197303, 0, 1, 0.2627451, 1,
-0.2640609, 0.7778785, 0.5825874, 0, 1, 0.2666667, 1,
-0.2616606, 0.7630886, -2.060838, 0, 1, 0.2745098, 1,
-0.2608326, 1.78354, 1.508538, 0, 1, 0.2784314, 1,
-0.2603179, -0.2210396, -1.784285, 0, 1, 0.2862745, 1,
-0.2600203, 0.8722792, -0.7505184, 0, 1, 0.2901961, 1,
-0.2582454, -0.9960752, -1.112606, 0, 1, 0.2980392, 1,
-0.2547611, 0.01347066, -2.442438, 0, 1, 0.3058824, 1,
-0.2533171, -1.203252, -1.288524, 0, 1, 0.3098039, 1,
-0.2527888, -1.356436, -1.36519, 0, 1, 0.3176471, 1,
-0.2520996, 0.6639851, -2.624856, 0, 1, 0.3215686, 1,
-0.251315, -1.516785, -1.924524, 0, 1, 0.3294118, 1,
-0.2488627, 0.5060576, -1.697051, 0, 1, 0.3333333, 1,
-0.2487361, 0.8303484, -0.6342253, 0, 1, 0.3411765, 1,
-0.2464062, -0.5927222, -1.848572, 0, 1, 0.345098, 1,
-0.243831, -0.7486448, -3.147156, 0, 1, 0.3529412, 1,
-0.2407475, 0.6189877, 0.1801349, 0, 1, 0.3568628, 1,
-0.2402872, 2.032123, -2.229655, 0, 1, 0.3647059, 1,
-0.2366597, 0.1130681, -0.6732674, 0, 1, 0.3686275, 1,
-0.2328633, 1.959052, -0.9706951, 0, 1, 0.3764706, 1,
-0.2305782, 1.691246, 0.830603, 0, 1, 0.3803922, 1,
-0.2285632, 1.752946, 0.1200894, 0, 1, 0.3882353, 1,
-0.227885, 0.4170142, -0.7247351, 0, 1, 0.3921569, 1,
-0.2272571, -0.5071027, -3.277775, 0, 1, 0.4, 1,
-0.2190176, 2.327357, -1.494709, 0, 1, 0.4078431, 1,
-0.2155803, -2.136663, -4.407889, 0, 1, 0.4117647, 1,
-0.2154859, 0.9169748, 1.430998, 0, 1, 0.4196078, 1,
-0.2150913, 1.3771, -1.479682, 0, 1, 0.4235294, 1,
-0.2107178, 0.7563721, -0.6700118, 0, 1, 0.4313726, 1,
-0.2051916, -0.8861744, -4.621617, 0, 1, 0.4352941, 1,
-0.2043937, 0.273863, -1.856311, 0, 1, 0.4431373, 1,
-0.2036347, -1.222114, -3.063913, 0, 1, 0.4470588, 1,
-0.2018011, 0.2557885, 1.552371, 0, 1, 0.454902, 1,
-0.2006609, 0.5013869, 1.158048, 0, 1, 0.4588235, 1,
-0.1976972, -0.8952694, -2.019405, 0, 1, 0.4666667, 1,
-0.1966705, 0.5327949, -1.202152, 0, 1, 0.4705882, 1,
-0.1953214, 1.141694, -1.91844, 0, 1, 0.4784314, 1,
-0.1922953, -0.01695848, -1.226128, 0, 1, 0.4823529, 1,
-0.1883716, -0.008880218, -3.01344, 0, 1, 0.4901961, 1,
-0.1836907, 0.8528061, -1.458926, 0, 1, 0.4941176, 1,
-0.178914, -0.5792292, -3.39537, 0, 1, 0.5019608, 1,
-0.1784919, -0.4804583, -3.7471, 0, 1, 0.509804, 1,
-0.1770326, 0.3989243, 0.4937473, 0, 1, 0.5137255, 1,
-0.1755443, -2.798099, -2.53679, 0, 1, 0.5215687, 1,
-0.1738734, 0.4377775, 0.6456735, 0, 1, 0.5254902, 1,
-0.1734685, 0.1170601, -0.484373, 0, 1, 0.5333334, 1,
-0.1716186, -0.2486396, -4.380222, 0, 1, 0.5372549, 1,
-0.1680855, -1.534644, -1.935844, 0, 1, 0.5450981, 1,
-0.1653795, 0.06925619, -1.431537, 0, 1, 0.5490196, 1,
-0.1629301, -0.0848439, -2.203119, 0, 1, 0.5568628, 1,
-0.1584044, -0.2916606, -2.862454, 0, 1, 0.5607843, 1,
-0.1567649, -0.7804226, -2.660358, 0, 1, 0.5686275, 1,
-0.1560585, -0.701978, -3.113235, 0, 1, 0.572549, 1,
-0.1481687, -0.7011356, -1.418289, 0, 1, 0.5803922, 1,
-0.1450626, -0.5339535, -2.325843, 0, 1, 0.5843138, 1,
-0.144926, -0.5374795, -2.763675, 0, 1, 0.5921569, 1,
-0.1395735, 1.506158, 1.313078, 0, 1, 0.5960785, 1,
-0.1390405, -0.9190657, -2.505259, 0, 1, 0.6039216, 1,
-0.1354742, 1.960271, 0.4027129, 0, 1, 0.6117647, 1,
-0.1327595, 0.4746983, -1.728137, 0, 1, 0.6156863, 1,
-0.1323864, 0.2662081, -1.46918, 0, 1, 0.6235294, 1,
-0.1314557, -0.01673197, -2.364857, 0, 1, 0.627451, 1,
-0.130722, 0.4784909, 1.711348, 0, 1, 0.6352941, 1,
-0.1286382, -0.7602264, -1.648672, 0, 1, 0.6392157, 1,
-0.1283052, -0.1081148, -2.404816, 0, 1, 0.6470588, 1,
-0.1247293, -0.8335814, -2.351267, 0, 1, 0.6509804, 1,
-0.1201735, 0.2182091, -1.495878, 0, 1, 0.6588235, 1,
-0.1189276, 0.2934604, -1.031341, 0, 1, 0.6627451, 1,
-0.116146, -0.9774316, -3.082038, 0, 1, 0.6705883, 1,
-0.1128784, -1.336998, -2.887519, 0, 1, 0.6745098, 1,
-0.1118941, 0.7800256, 0.01019171, 0, 1, 0.682353, 1,
-0.1097412, -0.03055483, -3.212087, 0, 1, 0.6862745, 1,
-0.109093, 0.7010671, 0.6255574, 0, 1, 0.6941177, 1,
-0.105151, -0.2692261, -2.383538, 0, 1, 0.7019608, 1,
-0.1036692, -1.366161, -2.951142, 0, 1, 0.7058824, 1,
-0.1023475, 0.5432327, -0.2611029, 0, 1, 0.7137255, 1,
-0.1006172, 1.091865, -0.8144233, 0, 1, 0.7176471, 1,
-0.09838636, 0.3709251, -1.411811, 0, 1, 0.7254902, 1,
-0.09129712, -0.160712, -3.0158, 0, 1, 0.7294118, 1,
-0.08413417, 1.728622, 0.2244319, 0, 1, 0.7372549, 1,
-0.0807448, -1.314614, -3.359826, 0, 1, 0.7411765, 1,
-0.08014844, 0.298941, 1.02589, 0, 1, 0.7490196, 1,
-0.079472, -0.9538698, -1.611928, 0, 1, 0.7529412, 1,
-0.07445665, 0.3855645, -2.143099, 0, 1, 0.7607843, 1,
-0.07383194, 0.02897969, -0.7103581, 0, 1, 0.7647059, 1,
-0.07382235, 0.7137102, -0.8233763, 0, 1, 0.772549, 1,
-0.07176915, 0.2939213, -1.025587, 0, 1, 0.7764706, 1,
-0.0707458, -0.7225209, -2.374714, 0, 1, 0.7843137, 1,
-0.06558279, -0.0131409, -1.598774, 0, 1, 0.7882353, 1,
-0.06341021, -0.3298549, -3.368469, 0, 1, 0.7960784, 1,
-0.06251217, 0.2077746, -0.2370131, 0, 1, 0.8039216, 1,
-0.05838773, 0.06346298, -1.380423, 0, 1, 0.8078431, 1,
-0.05034075, 0.3352851, -2.251872, 0, 1, 0.8156863, 1,
-0.03967833, 0.9033123, 0.04375998, 0, 1, 0.8196079, 1,
-0.03790525, 0.6114789, 1.420427, 0, 1, 0.827451, 1,
-0.0364177, -0.1112079, -2.466586, 0, 1, 0.8313726, 1,
-0.03428261, 1.324286, -0.2904911, 0, 1, 0.8392157, 1,
-0.03364956, 1.183912, 0.3112162, 0, 1, 0.8431373, 1,
-0.033296, -1.062551, -2.7956, 0, 1, 0.8509804, 1,
-0.03120834, 1.421551, -1.151493, 0, 1, 0.854902, 1,
-0.02966696, -0.5152432, -2.343754, 0, 1, 0.8627451, 1,
-0.02547787, 0.1879624, 0.2022694, 0, 1, 0.8666667, 1,
-0.02027204, -0.1914561, -1.248168, 0, 1, 0.8745098, 1,
-0.01882425, -1.521781, -2.004109, 0, 1, 0.8784314, 1,
-0.01784628, -3.002892, -3.465716, 0, 1, 0.8862745, 1,
-0.01553196, 0.6344288, -0.4359842, 0, 1, 0.8901961, 1,
-0.01316285, 1.627678, -2.793801, 0, 1, 0.8980392, 1,
-0.0107817, -0.2393521, -2.529644, 0, 1, 0.9058824, 1,
-0.01006145, -0.2826865, -2.706592, 0, 1, 0.9098039, 1,
-0.004225773, -1.191449, -3.917105, 0, 1, 0.9176471, 1,
4.608527e-05, -0.1939293, 2.668809, 0, 1, 0.9215686, 1,
0.003473912, 0.7268404, 1.159193, 0, 1, 0.9294118, 1,
0.004817591, -0.8547131, 3.154472, 0, 1, 0.9333333, 1,
0.007280713, 0.9092705, -1.36813, 0, 1, 0.9411765, 1,
0.007964891, -0.06677132, 2.524143, 0, 1, 0.945098, 1,
0.009490026, 0.7326151, -0.5664836, 0, 1, 0.9529412, 1,
0.01269054, -0.5095545, 2.670474, 0, 1, 0.9568627, 1,
0.01847344, -0.2205968, 3.109987, 0, 1, 0.9647059, 1,
0.02175436, 1.370474, -0.01723646, 0, 1, 0.9686275, 1,
0.02938082, -1.00514, 2.675351, 0, 1, 0.9764706, 1,
0.03007379, -1.069966, 3.489201, 0, 1, 0.9803922, 1,
0.03119477, -1.268178, 2.593563, 0, 1, 0.9882353, 1,
0.03305946, 0.3371519, 1.060972, 0, 1, 0.9921569, 1,
0.03525747, -0.2042938, 2.383324, 0, 1, 1, 1,
0.03775843, -0.6668308, 4.175552, 0, 0.9921569, 1, 1,
0.03976848, -0.5949538, 1.8334, 0, 0.9882353, 1, 1,
0.04124065, -0.1109019, 4.503338, 0, 0.9803922, 1, 1,
0.04174953, -0.2137798, 2.655191, 0, 0.9764706, 1, 1,
0.04315528, 0.7541694, -0.2026268, 0, 0.9686275, 1, 1,
0.04554541, 0.493655, 0.1908212, 0, 0.9647059, 1, 1,
0.04674716, -0.08397447, 2.530226, 0, 0.9568627, 1, 1,
0.04751973, -0.480015, 5.063725, 0, 0.9529412, 1, 1,
0.05243739, 0.5881063, 1.610753, 0, 0.945098, 1, 1,
0.05306864, 0.4098224, 0.6845841, 0, 0.9411765, 1, 1,
0.05586275, 0.4100737, 0.2732708, 0, 0.9333333, 1, 1,
0.06422362, -1.275758, 3.248584, 0, 0.9294118, 1, 1,
0.06443133, -0.5165974, 4.111718, 0, 0.9215686, 1, 1,
0.06977171, 0.3094903, -0.3621515, 0, 0.9176471, 1, 1,
0.07123319, -0.2410548, 3.792388, 0, 0.9098039, 1, 1,
0.07282005, 1.327963, -1.400363, 0, 0.9058824, 1, 1,
0.07332171, 1.045948, -0.854139, 0, 0.8980392, 1, 1,
0.07336281, -0.08477402, 2.796031, 0, 0.8901961, 1, 1,
0.07839186, 0.7587994, -0.4753794, 0, 0.8862745, 1, 1,
0.08158612, -1.019392, 3.154382, 0, 0.8784314, 1, 1,
0.08378385, 0.6014748, 2.69236, 0, 0.8745098, 1, 1,
0.08673125, -0.5821832, 4.571308, 0, 0.8666667, 1, 1,
0.09393389, 1.548791, -0.007730721, 0, 0.8627451, 1, 1,
0.09673876, -1.41328, 2.998977, 0, 0.854902, 1, 1,
0.09907883, -0.7271724, 2.342575, 0, 0.8509804, 1, 1,
0.1038848, 0.471863, 1.014431, 0, 0.8431373, 1, 1,
0.1039528, 0.5102941, 0.7279938, 0, 0.8392157, 1, 1,
0.105777, -0.4782146, 3.063408, 0, 0.8313726, 1, 1,
0.1092431, -0.7818999, 3.022144, 0, 0.827451, 1, 1,
0.1102891, 0.4117872, -0.0006972131, 0, 0.8196079, 1, 1,
0.1139934, 0.05855614, 0.5176068, 0, 0.8156863, 1, 1,
0.1140665, 0.08463378, 0.928152, 0, 0.8078431, 1, 1,
0.1153004, 0.3593788, 0.6676819, 0, 0.8039216, 1, 1,
0.1182419, -0.9800429, 3.748754, 0, 0.7960784, 1, 1,
0.1187978, 2.535787, 0.2660675, 0, 0.7882353, 1, 1,
0.1190409, 0.4377046, 0.4126458, 0, 0.7843137, 1, 1,
0.1199711, 1.77767, -0.3163926, 0, 0.7764706, 1, 1,
0.1207699, 0.1941375, 2.381032, 0, 0.772549, 1, 1,
0.1237974, 0.5693825, 0.1382584, 0, 0.7647059, 1, 1,
0.1239363, 0.02982719, 2.338087, 0, 0.7607843, 1, 1,
0.1253751, -0.09577268, 0.6274078, 0, 0.7529412, 1, 1,
0.1261506, 0.3737524, 1.557195, 0, 0.7490196, 1, 1,
0.1291907, -0.7389504, 2.656319, 0, 0.7411765, 1, 1,
0.1367712, 1.171652, -0.3029528, 0, 0.7372549, 1, 1,
0.1372052, -0.08258469, -0.01581337, 0, 0.7294118, 1, 1,
0.1411855, -0.9000967, 3.743845, 0, 0.7254902, 1, 1,
0.142677, -0.4355938, 3.875849, 0, 0.7176471, 1, 1,
0.1430219, -0.6364594, 2.100977, 0, 0.7137255, 1, 1,
0.1472429, -0.1784275, 2.24619, 0, 0.7058824, 1, 1,
0.1473482, 1.267677, 0.6365568, 0, 0.6980392, 1, 1,
0.1494889, 0.229974, -0.6611434, 0, 0.6941177, 1, 1,
0.1510763, -0.1690527, 1.315243, 0, 0.6862745, 1, 1,
0.1518362, 1.794903, 0.2393804, 0, 0.682353, 1, 1,
0.1530705, -1.025227, 4.149474, 0, 0.6745098, 1, 1,
0.1598464, -0.994519, 1.798479, 0, 0.6705883, 1, 1,
0.1600332, 0.1725143, -0.286719, 0, 0.6627451, 1, 1,
0.1631257, 1.276026, -1.60318, 0, 0.6588235, 1, 1,
0.1632879, -1.415715, 3.764254, 0, 0.6509804, 1, 1,
0.1645255, -2.134929, 3.640735, 0, 0.6470588, 1, 1,
0.1670011, 0.1002945, 0.4204789, 0, 0.6392157, 1, 1,
0.1723031, 2.476902, 1.621811, 0, 0.6352941, 1, 1,
0.1745256, 0.924409, -0.1554593, 0, 0.627451, 1, 1,
0.1762007, 1.488888, -0.5671253, 0, 0.6235294, 1, 1,
0.1762396, 0.1568251, 2.108508, 0, 0.6156863, 1, 1,
0.176297, -3.548129, 1.47886, 0, 0.6117647, 1, 1,
0.1816685, 0.06421956, 0.1619785, 0, 0.6039216, 1, 1,
0.183699, 0.6953097, 0.5080525, 0, 0.5960785, 1, 1,
0.1856181, -0.06645451, 2.008391, 0, 0.5921569, 1, 1,
0.189579, 0.7543705, 0.6270842, 0, 0.5843138, 1, 1,
0.191594, 0.4047323, 0.9168295, 0, 0.5803922, 1, 1,
0.19224, 0.4661961, 0.2420429, 0, 0.572549, 1, 1,
0.1964431, -0.0957459, 3.171955, 0, 0.5686275, 1, 1,
0.1975223, 0.9263898, -0.5090986, 0, 0.5607843, 1, 1,
0.1982515, -0.05547262, 3.006991, 0, 0.5568628, 1, 1,
0.2034624, -0.1418966, 0.2487064, 0, 0.5490196, 1, 1,
0.2058344, 1.150991, 1.030869, 0, 0.5450981, 1, 1,
0.2105227, 0.2893958, 0.9471732, 0, 0.5372549, 1, 1,
0.2150258, -0.9366814, 3.522892, 0, 0.5333334, 1, 1,
0.2163029, 0.4793813, 0.2314407, 0, 0.5254902, 1, 1,
0.2185915, 2.247242, 0.9545127, 0, 0.5215687, 1, 1,
0.2192145, 0.6988893, 0.8123636, 0, 0.5137255, 1, 1,
0.2261403, 2.685624, 0.5115755, 0, 0.509804, 1, 1,
0.2274042, 1.580724, -0.8389111, 0, 0.5019608, 1, 1,
0.2308445, -0.5907277, 1.627466, 0, 0.4941176, 1, 1,
0.2309977, -0.9197637, 3.138406, 0, 0.4901961, 1, 1,
0.2311645, -0.215002, -0.5217891, 0, 0.4823529, 1, 1,
0.2317083, 1.618241, -0.7638254, 0, 0.4784314, 1, 1,
0.231709, 0.5494165, -2.46894, 0, 0.4705882, 1, 1,
0.2336938, -0.2522064, 2.741048, 0, 0.4666667, 1, 1,
0.2337689, 0.5933456, 1.483609, 0, 0.4588235, 1, 1,
0.2395523, 1.270758, 1.469826, 0, 0.454902, 1, 1,
0.2409138, -1.132095, 2.345169, 0, 0.4470588, 1, 1,
0.2410681, 1.8103, 2.220711, 0, 0.4431373, 1, 1,
0.2434256, 1.513079, 0.5178374, 0, 0.4352941, 1, 1,
0.2503646, -0.1516877, 3.392956, 0, 0.4313726, 1, 1,
0.2524596, -0.06482574, 2.131193, 0, 0.4235294, 1, 1,
0.2567809, 0.1897516, 0.1891682, 0, 0.4196078, 1, 1,
0.2570234, -0.1017707, 1.173925, 0, 0.4117647, 1, 1,
0.2596947, -1.271899, 1.169749, 0, 0.4078431, 1, 1,
0.2602055, 1.309575, -0.09377513, 0, 0.4, 1, 1,
0.2602996, -1.751297, 3.175102, 0, 0.3921569, 1, 1,
0.2631306, 0.3508715, -0.05971863, 0, 0.3882353, 1, 1,
0.2660103, 0.5248829, -0.2826918, 0, 0.3803922, 1, 1,
0.269527, -1.213079, 3.409867, 0, 0.3764706, 1, 1,
0.2721929, 0.4587416, 1.149235, 0, 0.3686275, 1, 1,
0.2743245, -0.2556169, 1.69221, 0, 0.3647059, 1, 1,
0.2764026, -0.8027598, 0.6205465, 0, 0.3568628, 1, 1,
0.2814435, -2.148314, 3.075347, 0, 0.3529412, 1, 1,
0.2815062, -0.4096842, 3.655353, 0, 0.345098, 1, 1,
0.2863611, 0.09049063, 0.6608328, 0, 0.3411765, 1, 1,
0.286786, -0.9143758, 1.575685, 0, 0.3333333, 1, 1,
0.2962745, -0.9125368, 3.151761, 0, 0.3294118, 1, 1,
0.2967521, -0.08152178, 2.151204, 0, 0.3215686, 1, 1,
0.2985699, -0.9965373, 4.12875, 0, 0.3176471, 1, 1,
0.3002863, 0.03306476, 2.595633, 0, 0.3098039, 1, 1,
0.3043871, -0.8801374, 3.535187, 0, 0.3058824, 1, 1,
0.3050252, 1.020705, 1.744065, 0, 0.2980392, 1, 1,
0.3083002, 0.6470619, 1.904624, 0, 0.2901961, 1, 1,
0.3129569, 1.552009, 1.764646, 0, 0.2862745, 1, 1,
0.3135956, -0.3492416, 2.362328, 0, 0.2784314, 1, 1,
0.3147929, -0.02480787, 0.557807, 0, 0.2745098, 1, 1,
0.318102, 0.5880097, 1.26515, 0, 0.2666667, 1, 1,
0.3282481, 2.328841, 0.1476805, 0, 0.2627451, 1, 1,
0.3323545, 0.2181602, 3.442484, 0, 0.254902, 1, 1,
0.3333921, -0.4032511, 1.778607, 0, 0.2509804, 1, 1,
0.3352195, 1.537786, -0.7056974, 0, 0.2431373, 1, 1,
0.3370591, 0.4844204, -0.6121212, 0, 0.2392157, 1, 1,
0.3383956, -1.098728, 3.36898, 0, 0.2313726, 1, 1,
0.3385684, 0.9213958, 0.1388804, 0, 0.227451, 1, 1,
0.3428928, -1.373671, 2.562226, 0, 0.2196078, 1, 1,
0.3444842, 0.7711232, 0.6354468, 0, 0.2156863, 1, 1,
0.3458761, 1.120858, 0.01099309, 0, 0.2078431, 1, 1,
0.3472238, -0.3096673, 0.8972233, 0, 0.2039216, 1, 1,
0.3472725, 0.1736741, 1.514001, 0, 0.1960784, 1, 1,
0.3526991, -0.03935664, 0.8244517, 0, 0.1882353, 1, 1,
0.3532854, 0.5633631, -0.6513228, 0, 0.1843137, 1, 1,
0.3545507, -0.1783943, 0.1438611, 0, 0.1764706, 1, 1,
0.3591552, -0.8129945, 3.980159, 0, 0.172549, 1, 1,
0.3600856, -0.03163588, 2.549302, 0, 0.1647059, 1, 1,
0.3632534, 0.5402378, 0.05439087, 0, 0.1607843, 1, 1,
0.3649865, -0.6688944, 2.505297, 0, 0.1529412, 1, 1,
0.3667455, -2.259392, 2.227367, 0, 0.1490196, 1, 1,
0.3710105, 0.1355725, 0.3781187, 0, 0.1411765, 1, 1,
0.3710963, 0.05681724, 1.657521, 0, 0.1372549, 1, 1,
0.3719686, -0.4323732, 2.068244, 0, 0.1294118, 1, 1,
0.3781098, -0.07541141, 1.084341, 0, 0.1254902, 1, 1,
0.3785477, 0.3567831, 0.4595419, 0, 0.1176471, 1, 1,
0.3793286, 0.1475511, 2.315224, 0, 0.1137255, 1, 1,
0.3813809, -1.510242, 2.607753, 0, 0.1058824, 1, 1,
0.3821493, -0.441466, 1.959986, 0, 0.09803922, 1, 1,
0.3835529, -1.078841, 1.564932, 0, 0.09411765, 1, 1,
0.3844842, 0.4535596, 2.816593, 0, 0.08627451, 1, 1,
0.3848693, 1.103439, 0.5230002, 0, 0.08235294, 1, 1,
0.3859935, -1.406061, 2.258794, 0, 0.07450981, 1, 1,
0.3869808, 1.631455, -0.02252888, 0, 0.07058824, 1, 1,
0.3927346, -0.4128973, 1.620375, 0, 0.0627451, 1, 1,
0.3947895, 1.395999, 0.7641941, 0, 0.05882353, 1, 1,
0.3970045, -0.5648084, 3.501508, 0, 0.05098039, 1, 1,
0.398101, -0.5759811, 3.053533, 0, 0.04705882, 1, 1,
0.4084232, -1.112785, 1.129995, 0, 0.03921569, 1, 1,
0.4097963, 0.8340702, -0.3782956, 0, 0.03529412, 1, 1,
0.4125212, 0.002760462, 2.508341, 0, 0.02745098, 1, 1,
0.4142218, 1.32014, 1.354812, 0, 0.02352941, 1, 1,
0.4158657, -1.531951, 3.905766, 0, 0.01568628, 1, 1,
0.4164246, -0.08274153, 3.673168, 0, 0.01176471, 1, 1,
0.4203455, -0.8900514, 1.208887, 0, 0.003921569, 1, 1,
0.4290891, 0.2174609, 2.088239, 0.003921569, 0, 1, 1,
0.432061, -0.8618956, 4.320664, 0.007843138, 0, 1, 1,
0.4336729, 1.697247, -0.4540987, 0.01568628, 0, 1, 1,
0.4352425, 0.9233415, 0.3296146, 0.01960784, 0, 1, 1,
0.4361596, -1.953015, 2.229963, 0.02745098, 0, 1, 1,
0.436386, 0.5374234, 0.2611815, 0.03137255, 0, 1, 1,
0.4367659, 0.05022688, 1.318629, 0.03921569, 0, 1, 1,
0.440028, 1.113899, -0.6307333, 0.04313726, 0, 1, 1,
0.4477389, 1.054432, 0.9785759, 0.05098039, 0, 1, 1,
0.4504376, 0.2313664, 0.8266171, 0.05490196, 0, 1, 1,
0.4522445, -0.7904174, 1.743657, 0.0627451, 0, 1, 1,
0.45498, -0.3283809, 1.669761, 0.06666667, 0, 1, 1,
0.455828, 0.4288056, -0.184469, 0.07450981, 0, 1, 1,
0.4646175, 1.845888, -0.028746, 0.07843138, 0, 1, 1,
0.4647779, 0.4952988, 0.03466497, 0.08627451, 0, 1, 1,
0.4751731, -0.9689491, 2.545244, 0.09019608, 0, 1, 1,
0.4751787, 0.7809332, 1.792066, 0.09803922, 0, 1, 1,
0.4766847, 0.01565202, 2.469764, 0.1058824, 0, 1, 1,
0.4811934, 0.2330772, 1.842849, 0.1098039, 0, 1, 1,
0.4812613, 0.3606631, 2.272548, 0.1176471, 0, 1, 1,
0.4840553, 0.9612858, 1.448506, 0.1215686, 0, 1, 1,
0.4873936, 0.5431755, -0.0422065, 0.1294118, 0, 1, 1,
0.4895645, 1.181057, -0.04703342, 0.1333333, 0, 1, 1,
0.4935723, -1.307801, 2.895073, 0.1411765, 0, 1, 1,
0.4972934, -1.900165, 3.260864, 0.145098, 0, 1, 1,
0.4972967, 2.239101, 0.6479304, 0.1529412, 0, 1, 1,
0.5007839, 0.7900697, -0.5154282, 0.1568628, 0, 1, 1,
0.5043005, -0.467885, 2.994278, 0.1647059, 0, 1, 1,
0.5067024, 0.3352149, -0.4668866, 0.1686275, 0, 1, 1,
0.5089698, 0.4214896, 2.154403, 0.1764706, 0, 1, 1,
0.5113881, 0.2403164, -0.2412253, 0.1803922, 0, 1, 1,
0.5121018, -0.5756465, -0.14992, 0.1882353, 0, 1, 1,
0.5138498, 1.253307, 1.716159, 0.1921569, 0, 1, 1,
0.5139492, -1.257136, 2.218614, 0.2, 0, 1, 1,
0.5175449, -0.220651, 1.286912, 0.2078431, 0, 1, 1,
0.5179824, 0.4611931, -0.1382886, 0.2117647, 0, 1, 1,
0.5184243, 0.4169419, 0.7262377, 0.2196078, 0, 1, 1,
0.5201085, 2.127104, 1.293571, 0.2235294, 0, 1, 1,
0.5221998, 0.1845996, 1.42007, 0.2313726, 0, 1, 1,
0.5224019, -0.3879954, 1.93763, 0.2352941, 0, 1, 1,
0.5283753, 0.0850131, 0.2902992, 0.2431373, 0, 1, 1,
0.5356071, -0.9854605, 1.348164, 0.2470588, 0, 1, 1,
0.5360099, -1.373072, 2.601501, 0.254902, 0, 1, 1,
0.5371319, -0.2881752, 0.06875268, 0.2588235, 0, 1, 1,
0.5372313, 0.2444262, 3.004243, 0.2666667, 0, 1, 1,
0.537301, -2.004205, 2.246525, 0.2705882, 0, 1, 1,
0.5375243, -0.3091502, 1.458194, 0.2784314, 0, 1, 1,
0.557659, 0.2156385, 0.0005802168, 0.282353, 0, 1, 1,
0.5581854, -0.9520298, 0.6284161, 0.2901961, 0, 1, 1,
0.5701439, 0.9736812, 0.7150123, 0.2941177, 0, 1, 1,
0.5806786, 0.2299672, 0.5458398, 0.3019608, 0, 1, 1,
0.5827707, 1.292417, 2.040518, 0.3098039, 0, 1, 1,
0.5876108, 0.6953529, 0.9645934, 0.3137255, 0, 1, 1,
0.5931476, -1.378571, 4.368011, 0.3215686, 0, 1, 1,
0.5996123, 0.447659, 2.999077, 0.3254902, 0, 1, 1,
0.5999811, -1.069446, 5.158507, 0.3333333, 0, 1, 1,
0.6038594, 0.5890576, 1.217982, 0.3372549, 0, 1, 1,
0.6045572, 0.1378034, 1.398843, 0.345098, 0, 1, 1,
0.6133619, -1.049478, 2.584642, 0.3490196, 0, 1, 1,
0.6174276, -0.9848703, 1.741676, 0.3568628, 0, 1, 1,
0.6204253, 0.02068303, 1.691418, 0.3607843, 0, 1, 1,
0.6252694, 0.1193611, 1.807209, 0.3686275, 0, 1, 1,
0.6288575, -2.105668, 2.865749, 0.372549, 0, 1, 1,
0.6316379, -0.8940341, 1.459481, 0.3803922, 0, 1, 1,
0.6320696, -0.3059759, 2.535929, 0.3843137, 0, 1, 1,
0.6345127, -1.486761, 3.499677, 0.3921569, 0, 1, 1,
0.6376747, 0.1280825, 1.20284, 0.3960784, 0, 1, 1,
0.6381338, 0.3102682, 1.723228, 0.4039216, 0, 1, 1,
0.6449592, -0.6335597, 3.294869, 0.4117647, 0, 1, 1,
0.6480688, -0.3503527, 1.889945, 0.4156863, 0, 1, 1,
0.6594898, 2.082883, 0.2314224, 0.4235294, 0, 1, 1,
0.6624456, 0.0620099, 0.7271436, 0.427451, 0, 1, 1,
0.6644861, -2.045644, 1.474105, 0.4352941, 0, 1, 1,
0.6673658, -0.3124075, 1.375797, 0.4392157, 0, 1, 1,
0.671654, -0.8055853, 2.789288, 0.4470588, 0, 1, 1,
0.6747616, -0.5805368, 1.003637, 0.4509804, 0, 1, 1,
0.6749465, -0.4424174, 2.652394, 0.4588235, 0, 1, 1,
0.6912102, 0.3502191, 0.8692535, 0.4627451, 0, 1, 1,
0.6953021, -0.5109496, 1.703212, 0.4705882, 0, 1, 1,
0.7005298, -0.8207693, 3.291909, 0.4745098, 0, 1, 1,
0.7020569, 1.453213, -0.8756297, 0.4823529, 0, 1, 1,
0.705503, -0.804783, 2.844532, 0.4862745, 0, 1, 1,
0.7059666, -0.5169642, 1.865052, 0.4941176, 0, 1, 1,
0.7152197, -0.9667225, 2.611683, 0.5019608, 0, 1, 1,
0.7195821, -0.7035423, 2.652048, 0.5058824, 0, 1, 1,
0.7243971, 0.06825161, 2.317775, 0.5137255, 0, 1, 1,
0.7244766, -0.2410577, 1.372019, 0.5176471, 0, 1, 1,
0.7255463, 0.7321204, 1.919269, 0.5254902, 0, 1, 1,
0.7281193, 1.209428, 1.092115, 0.5294118, 0, 1, 1,
0.7311822, -0.179435, 0.9706779, 0.5372549, 0, 1, 1,
0.7366198, 0.2257946, 2.911583, 0.5411765, 0, 1, 1,
0.7383328, 1.487629, 0.2823619, 0.5490196, 0, 1, 1,
0.7396832, -0.3011453, 3.767845, 0.5529412, 0, 1, 1,
0.7418739, 0.802946, 2.035218, 0.5607843, 0, 1, 1,
0.7457621, -1.672875, 3.797588, 0.5647059, 0, 1, 1,
0.7489668, -0.7275611, 2.607263, 0.572549, 0, 1, 1,
0.7564094, 0.05282738, 1.834096, 0.5764706, 0, 1, 1,
0.7608672, 0.3124579, 1.677455, 0.5843138, 0, 1, 1,
0.7701306, -2.722412, 3.239715, 0.5882353, 0, 1, 1,
0.7786785, 0.2226082, 1.370002, 0.5960785, 0, 1, 1,
0.7845557, -0.4026333, -0.005354326, 0.6039216, 0, 1, 1,
0.7855639, 1.054328, 0.9661881, 0.6078432, 0, 1, 1,
0.7861067, -0.5453873, 3.502515, 0.6156863, 0, 1, 1,
0.7880749, 0.02375546, 0.03808066, 0.6196079, 0, 1, 1,
0.7949904, -1.54887, 0.9384283, 0.627451, 0, 1, 1,
0.7976292, 0.7719133, 0.1807397, 0.6313726, 0, 1, 1,
0.8037993, 0.5863882, 1.177895, 0.6392157, 0, 1, 1,
0.8058984, 0.5598789, 0.4472927, 0.6431373, 0, 1, 1,
0.8078516, -0.1631472, 2.569455, 0.6509804, 0, 1, 1,
0.8149595, 0.003970674, 1.461425, 0.654902, 0, 1, 1,
0.8184618, 0.07615892, 0.6208282, 0.6627451, 0, 1, 1,
0.8204454, -0.2540955, -0.0142718, 0.6666667, 0, 1, 1,
0.8264064, 0.2339435, 0.7153445, 0.6745098, 0, 1, 1,
0.8349712, 1.963328, 0.7000786, 0.6784314, 0, 1, 1,
0.8409485, -1.028703, 2.299169, 0.6862745, 0, 1, 1,
0.8426306, 0.6394347, 0.2710425, 0.6901961, 0, 1, 1,
0.8473121, -0.1276127, -0.5016909, 0.6980392, 0, 1, 1,
0.8530418, -0.907465, 2.940593, 0.7058824, 0, 1, 1,
0.8543652, 0.5108218, 1.354316, 0.7098039, 0, 1, 1,
0.8572838, 0.9324608, 0.09917279, 0.7176471, 0, 1, 1,
0.858919, -0.4870356, 2.849873, 0.7215686, 0, 1, 1,
0.872573, 0.7888651, 0.6572554, 0.7294118, 0, 1, 1,
0.877233, -0.648613, 3.926916, 0.7333333, 0, 1, 1,
0.8780973, -1.146679, -0.6631507, 0.7411765, 0, 1, 1,
0.8838, 0.5608367, 1.216511, 0.7450981, 0, 1, 1,
0.8890882, -0.2542208, 2.264855, 0.7529412, 0, 1, 1,
0.8894474, 2.047029, -0.09629279, 0.7568628, 0, 1, 1,
0.8912489, 1.033024, 0.9325027, 0.7647059, 0, 1, 1,
0.8913192, 0.4782813, 1.841011, 0.7686275, 0, 1, 1,
0.8913698, -0.9351816, 1.196922, 0.7764706, 0, 1, 1,
0.8940548, -0.5805329, 2.901008, 0.7803922, 0, 1, 1,
0.8959771, 1.342892, 0.01692753, 0.7882353, 0, 1, 1,
0.8976716, 1.794367, 1.263124, 0.7921569, 0, 1, 1,
0.8987958, -0.05480726, 1.229592, 0.8, 0, 1, 1,
0.899388, -0.599602, 1.133151, 0.8078431, 0, 1, 1,
0.9005631, -0.2296693, 2.228415, 0.8117647, 0, 1, 1,
0.9043688, 0.8444455, -0.3008019, 0.8196079, 0, 1, 1,
0.9049724, -0.3018251, 1.831613, 0.8235294, 0, 1, 1,
0.911043, 0.1348259, 1.287994, 0.8313726, 0, 1, 1,
0.9116204, -0.5079089, 2.62555, 0.8352941, 0, 1, 1,
0.9153671, -0.07626732, 1.715859, 0.8431373, 0, 1, 1,
0.9218343, -1.33162, 3.313372, 0.8470588, 0, 1, 1,
0.922806, -0.9518533, 1.722308, 0.854902, 0, 1, 1,
0.9244777, -1.633744, 2.458015, 0.8588235, 0, 1, 1,
0.9438269, 0.3467537, 0.740154, 0.8666667, 0, 1, 1,
0.9443191, -1.460134, 1.627648, 0.8705882, 0, 1, 1,
0.9471558, -1.471987, 2.433346, 0.8784314, 0, 1, 1,
0.9492419, 0.0354959, 2.251246, 0.8823529, 0, 1, 1,
0.949937, 0.414117, 0.5851315, 0.8901961, 0, 1, 1,
0.9529634, 1.862868, 1.573089, 0.8941177, 0, 1, 1,
0.9542158, 0.7892374, 3.085402, 0.9019608, 0, 1, 1,
0.9655672, 1.692304, -0.2845531, 0.9098039, 0, 1, 1,
0.9666106, -0.1206272, 2.618647, 0.9137255, 0, 1, 1,
0.9688446, 0.3658853, 2.054127, 0.9215686, 0, 1, 1,
0.9688492, 0.296893, 1.048773, 0.9254902, 0, 1, 1,
0.9688677, -0.5695331, 3.128209, 0.9333333, 0, 1, 1,
0.9731243, 0.608871, 1.982552, 0.9372549, 0, 1, 1,
0.9758992, 0.2337045, 1.393457, 0.945098, 0, 1, 1,
0.9795554, -1.656177, 3.108569, 0.9490196, 0, 1, 1,
0.9818925, -0.0463119, 1.138711, 0.9568627, 0, 1, 1,
0.9929824, -0.01330038, 1.564282, 0.9607843, 0, 1, 1,
0.9968097, 0.09370376, 2.530411, 0.9686275, 0, 1, 1,
0.9991735, 1.663725, 0.7410569, 0.972549, 0, 1, 1,
1.00089, -1.609787, 1.489671, 0.9803922, 0, 1, 1,
1.001367, 1.669727, 0.5133577, 0.9843137, 0, 1, 1,
1.002594, -0.502143, 0.6959044, 0.9921569, 0, 1, 1,
1.005429, 0.5655702, 0.4811575, 0.9960784, 0, 1, 1,
1.005727, -0.7656768, 1.344331, 1, 0, 0.9960784, 1,
1.013396, -0.8760815, 3.305216, 1, 0, 0.9882353, 1,
1.015436, -0.3484512, 1.946825, 1, 0, 0.9843137, 1,
1.017704, 1.218638, 1.062232, 1, 0, 0.9764706, 1,
1.018729, 1.26485, -0.2216685, 1, 0, 0.972549, 1,
1.031881, 1.046827, 0.7016139, 1, 0, 0.9647059, 1,
1.033898, 0.6448128, 1.468685, 1, 0, 0.9607843, 1,
1.036465, 1.054223, 0.7178874, 1, 0, 0.9529412, 1,
1.042923, 0.07377671, 0.2488206, 1, 0, 0.9490196, 1,
1.04379, 1.958893, -0.7200162, 1, 0, 0.9411765, 1,
1.045767, -0.4694299, 1.340855, 1, 0, 0.9372549, 1,
1.049056, -0.5988742, 2.054048, 1, 0, 0.9294118, 1,
1.052579, 0.513439, 1.045551, 1, 0, 0.9254902, 1,
1.055624, -0.4870512, 2.662633, 1, 0, 0.9176471, 1,
1.065567, 0.0749933, 2.816328, 1, 0, 0.9137255, 1,
1.067111, 1.14342, 0.659101, 1, 0, 0.9058824, 1,
1.073164, -0.2808275, 0.1668283, 1, 0, 0.9019608, 1,
1.074322, 0.6990477, 2.163228, 1, 0, 0.8941177, 1,
1.074398, -0.3690493, 1.948472, 1, 0, 0.8862745, 1,
1.084579, -1.233292, 2.403789, 1, 0, 0.8823529, 1,
1.084813, -0.278743, 1.523602, 1, 0, 0.8745098, 1,
1.087294, -1.841696, 3.541278, 1, 0, 0.8705882, 1,
1.09688, 0.4125141, 1.550897, 1, 0, 0.8627451, 1,
1.104623, -0.03836751, 1.630321, 1, 0, 0.8588235, 1,
1.104838, 2.451208, 2.147214, 1, 0, 0.8509804, 1,
1.105174, -1.062166, 1.522544, 1, 0, 0.8470588, 1,
1.109186, 0.265624, 1.661957, 1, 0, 0.8392157, 1,
1.110888, 0.03600323, 1.199073, 1, 0, 0.8352941, 1,
1.112808, -1.291502, 3.401697, 1, 0, 0.827451, 1,
1.116017, 0.5893824, 0.5629734, 1, 0, 0.8235294, 1,
1.123466, 0.1784607, 1.396138, 1, 0, 0.8156863, 1,
1.123943, 1.455634, -0.5482078, 1, 0, 0.8117647, 1,
1.125344, -0.4234669, 0.6282328, 1, 0, 0.8039216, 1,
1.138799, 1.720934, -0.06934588, 1, 0, 0.7960784, 1,
1.140536, 1.16163, 2.624913, 1, 0, 0.7921569, 1,
1.14202, 1.86302, 0.5631294, 1, 0, 0.7843137, 1,
1.146789, -0.8298137, 2.345045, 1, 0, 0.7803922, 1,
1.148413, 0.2359621, 1.884927, 1, 0, 0.772549, 1,
1.149198, -1.000104, 3.063682, 1, 0, 0.7686275, 1,
1.15083, 1.212887, -0.8923237, 1, 0, 0.7607843, 1,
1.151034, 0.6237055, 0.587752, 1, 0, 0.7568628, 1,
1.151862, 0.3035759, 0.0371891, 1, 0, 0.7490196, 1,
1.155874, 0.6260862, -0.3715709, 1, 0, 0.7450981, 1,
1.156799, -1.254767, 1.207126, 1, 0, 0.7372549, 1,
1.158079, 1.767896, 1.085398, 1, 0, 0.7333333, 1,
1.158853, 0.7642782, -1.478044, 1, 0, 0.7254902, 1,
1.169349, -0.7897124, 0.4659596, 1, 0, 0.7215686, 1,
1.169849, 0.3416385, 0.08506204, 1, 0, 0.7137255, 1,
1.170735, 1.056315, 1.391096, 1, 0, 0.7098039, 1,
1.173626, 0.8347175, 0.3101327, 1, 0, 0.7019608, 1,
1.173666, 0.2178434, 0.2459248, 1, 0, 0.6941177, 1,
1.174269, 0.5117614, 0.819572, 1, 0, 0.6901961, 1,
1.178101, -1.079522, 1.640457, 1, 0, 0.682353, 1,
1.180286, -0.5986072, 0.9798157, 1, 0, 0.6784314, 1,
1.181493, 0.4818727, 0.07171378, 1, 0, 0.6705883, 1,
1.18245, -0.4872465, 3.142405, 1, 0, 0.6666667, 1,
1.18475, -0.09379821, 0.2093339, 1, 0, 0.6588235, 1,
1.189275, 0.8777895, 0.5495338, 1, 0, 0.654902, 1,
1.197855, -1.340708, 2.440089, 1, 0, 0.6470588, 1,
1.218452, -0.3500084, 0.7619854, 1, 0, 0.6431373, 1,
1.224382, -0.8594977, 2.418636, 1, 0, 0.6352941, 1,
1.22715, 0.3035112, 1.872892, 1, 0, 0.6313726, 1,
1.230823, 0.9000505, 0.8064792, 1, 0, 0.6235294, 1,
1.236469, -1.477496, 4.334891, 1, 0, 0.6196079, 1,
1.240329, -0.3392668, 1.731683, 1, 0, 0.6117647, 1,
1.24147, 0.1276499, 0.05597712, 1, 0, 0.6078432, 1,
1.251067, 0.3876445, 0.9660015, 1, 0, 0.6, 1,
1.260293, 0.4158373, 2.636376, 1, 0, 0.5921569, 1,
1.266913, 0.3866673, 0.938093, 1, 0, 0.5882353, 1,
1.274402, -0.5343974, 3.668401, 1, 0, 0.5803922, 1,
1.276192, 0.4297805, -1.465886, 1, 0, 0.5764706, 1,
1.285323, -2.231594, 3.081463, 1, 0, 0.5686275, 1,
1.295546, 1.305697, 2.429968, 1, 0, 0.5647059, 1,
1.312005, -0.5467656, 2.732421, 1, 0, 0.5568628, 1,
1.314966, -1.610484, 2.777199, 1, 0, 0.5529412, 1,
1.317067, -1.729136, 2.931001, 1, 0, 0.5450981, 1,
1.318602, -0.8466529, 1.932844, 1, 0, 0.5411765, 1,
1.322666, -0.1116436, 2.324144, 1, 0, 0.5333334, 1,
1.329676, -0.860009, 0.8466024, 1, 0, 0.5294118, 1,
1.332967, -0.7488583, 2.876418, 1, 0, 0.5215687, 1,
1.344341, -1.065361, -0.3164875, 1, 0, 0.5176471, 1,
1.353073, 0.3424041, 1.075094, 1, 0, 0.509804, 1,
1.354273, 0.6266024, 1.474299, 1, 0, 0.5058824, 1,
1.35593, -0.2473145, 0.550759, 1, 0, 0.4980392, 1,
1.362457, -1.112604, 3.25154, 1, 0, 0.4901961, 1,
1.364996, -1.003516, 2.603191, 1, 0, 0.4862745, 1,
1.368368, -0.239814, 0.6952909, 1, 0, 0.4784314, 1,
1.373756, 1.749137, -1.120927, 1, 0, 0.4745098, 1,
1.375217, -0.06666491, 0.1712815, 1, 0, 0.4666667, 1,
1.378294, 0.1258762, 2.23362, 1, 0, 0.4627451, 1,
1.384254, -1.596236, 1.490948, 1, 0, 0.454902, 1,
1.38939, -0.5900633, 2.491761, 1, 0, 0.4509804, 1,
1.390967, -1.892427, 1.922639, 1, 0, 0.4431373, 1,
1.403666, -2.396529, 3.661259, 1, 0, 0.4392157, 1,
1.404949, -0.8050319, 1.810272, 1, 0, 0.4313726, 1,
1.405672, 0.9661002, 0.6101094, 1, 0, 0.427451, 1,
1.4183, 1.459856, -0.1953984, 1, 0, 0.4196078, 1,
1.422913, -0.6929837, -0.07239429, 1, 0, 0.4156863, 1,
1.445444, -0.3528689, 3.110572, 1, 0, 0.4078431, 1,
1.449742, -0.6044215, 0.9143032, 1, 0, 0.4039216, 1,
1.458792, 0.9708849, 0.8160191, 1, 0, 0.3960784, 1,
1.467751, -1.011261, 1.679922, 1, 0, 0.3882353, 1,
1.468744, 0.2995749, 1.384609, 1, 0, 0.3843137, 1,
1.473581, 0.3988397, 1.444637, 1, 0, 0.3764706, 1,
1.479395, -0.5716379, 3.657668, 1, 0, 0.372549, 1,
1.482561, 0.9505961, -0.6011878, 1, 0, 0.3647059, 1,
1.486471, -0.2139348, 0.4937762, 1, 0, 0.3607843, 1,
1.500556, 0.2438424, 1.757468, 1, 0, 0.3529412, 1,
1.517769, -0.2163069, 2.739035, 1, 0, 0.3490196, 1,
1.518796, 1.222621, 0.4464466, 1, 0, 0.3411765, 1,
1.519926, 0.6922871, 1.424626, 1, 0, 0.3372549, 1,
1.533446, 1.502733, 1.929968, 1, 0, 0.3294118, 1,
1.540528, -0.3065686, 1.543549, 1, 0, 0.3254902, 1,
1.548264, -1.327451, 3.085764, 1, 0, 0.3176471, 1,
1.555037, -0.6951829, 2.608652, 1, 0, 0.3137255, 1,
1.563085, -1.953136, 1.640343, 1, 0, 0.3058824, 1,
1.567642, 0.4483841, 0.9926654, 1, 0, 0.2980392, 1,
1.600888, 2.464834, 0.131375, 1, 0, 0.2941177, 1,
1.610504, -3.154237, 6.065399, 1, 0, 0.2862745, 1,
1.610803, -0.33595, -0.1706454, 1, 0, 0.282353, 1,
1.672639, 0.4557083, 0.921636, 1, 0, 0.2745098, 1,
1.675397, -1.667227, 2.548549, 1, 0, 0.2705882, 1,
1.682236, -0.6946369, 1.813563, 1, 0, 0.2627451, 1,
1.685045, -1.21549, 1.961666, 1, 0, 0.2588235, 1,
1.692997, 0.5457816, 1.889248, 1, 0, 0.2509804, 1,
1.709882, -0.878116, 0.7654223, 1, 0, 0.2470588, 1,
1.720998, -1.186055, 1.259447, 1, 0, 0.2392157, 1,
1.722998, -0.7166632, 1.2598, 1, 0, 0.2352941, 1,
1.733559, -0.5794123, 1.671801, 1, 0, 0.227451, 1,
1.773041, -0.6740804, 1.773082, 1, 0, 0.2235294, 1,
1.810897, -0.8932069, 2.046156, 1, 0, 0.2156863, 1,
1.822161, 0.6085905, -0.1803803, 1, 0, 0.2117647, 1,
1.826839, -0.2463614, 2.456282, 1, 0, 0.2039216, 1,
1.828647, 1.682374, 0.2184851, 1, 0, 0.1960784, 1,
1.852502, -0.257528, 2.632958, 1, 0, 0.1921569, 1,
1.866192, 1.541082, 0.9421387, 1, 0, 0.1843137, 1,
1.870662, -1.266402, 3.348311, 1, 0, 0.1803922, 1,
1.87602, -1.437741, 1.544954, 1, 0, 0.172549, 1,
1.905803, -0.89952, 1.537434, 1, 0, 0.1686275, 1,
1.91317, 0.5925163, 2.524629, 1, 0, 0.1607843, 1,
1.914776, -0.4504292, 1.52423, 1, 0, 0.1568628, 1,
1.919544, -0.1586227, 2.328235, 1, 0, 0.1490196, 1,
1.950588, 0.5701243, 2.672237, 1, 0, 0.145098, 1,
1.983258, -0.1383518, 0.6036497, 1, 0, 0.1372549, 1,
1.995249, -0.6264585, 2.028633, 1, 0, 0.1333333, 1,
1.997959, 0.04206547, 2.423733, 1, 0, 0.1254902, 1,
2.017777, 2.315813, 2.461715, 1, 0, 0.1215686, 1,
2.04774, -0.3102264, -0.1540502, 1, 0, 0.1137255, 1,
2.108243, -1.446712, 3.309933, 1, 0, 0.1098039, 1,
2.123216, 0.10884, 2.029053, 1, 0, 0.1019608, 1,
2.141603, -1.382724, 0.7526593, 1, 0, 0.09411765, 1,
2.143197, -2.012405, 3.090579, 1, 0, 0.09019608, 1,
2.169773, -0.1448733, 1.303094, 1, 0, 0.08235294, 1,
2.199548, 0.9852877, -0.02292334, 1, 0, 0.07843138, 1,
2.231422, -1.552931, 1.939737, 1, 0, 0.07058824, 1,
2.250232, 0.4475414, 2.876875, 1, 0, 0.06666667, 1,
2.270032, -1.476745, 3.043616, 1, 0, 0.05882353, 1,
2.302537, -1.220597, 1.922881, 1, 0, 0.05490196, 1,
2.34486, -0.7524102, 2.193297, 1, 0, 0.04705882, 1,
2.379227, 0.5428736, 2.161468, 1, 0, 0.04313726, 1,
2.567385, -1.386855, 2.765804, 1, 0, 0.03529412, 1,
2.732724, -0.5667968, 1.336654, 1, 0, 0.03137255, 1,
2.76827, 0.5653442, 3.162162, 1, 0, 0.02352941, 1,
3.042134, 1.163055, 1.779706, 1, 0, 0.01960784, 1,
3.058793, -1.205095, 2.461776, 1, 0, 0.01176471, 1,
3.093262, -1.042825, 2.570065, 1, 0, 0.007843138, 1
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
0.1332721, -4.779167, -7.724541, 0, -0.5, 0.5, 0.5,
0.1332721, -4.779167, -7.724541, 1, -0.5, 0.5, 0.5,
0.1332721, -4.779167, -7.724541, 1, 1.5, 0.5, 0.5,
0.1332721, -4.779167, -7.724541, 0, 1.5, 0.5, 0.5
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
-3.830155, 0.08325326, -7.724541, 0, -0.5, 0.5, 0.5,
-3.830155, 0.08325326, -7.724541, 1, -0.5, 0.5, 0.5,
-3.830155, 0.08325326, -7.724541, 1, 1.5, 0.5, 0.5,
-3.830155, 0.08325326, -7.724541, 0, 1.5, 0.5, 0.5
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
-3.830155, -4.779167, 0.1697426, 0, -0.5, 0.5, 0.5,
-3.830155, -4.779167, 0.1697426, 1, -0.5, 0.5, 0.5,
-3.830155, -4.779167, 0.1697426, 1, 1.5, 0.5, 0.5,
-3.830155, -4.779167, 0.1697426, 0, 1.5, 0.5, 0.5
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
-2, -3.65707, -5.902783,
3, -3.65707, -5.902783,
-2, -3.65707, -5.902783,
-2, -3.844086, -6.206409,
-1, -3.65707, -5.902783,
-1, -3.844086, -6.206409,
0, -3.65707, -5.902783,
0, -3.844086, -6.206409,
1, -3.65707, -5.902783,
1, -3.844086, -6.206409,
2, -3.65707, -5.902783,
2, -3.844086, -6.206409,
3, -3.65707, -5.902783,
3, -3.844086, -6.206409
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
-2, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
-2, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
-2, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
-2, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5,
-1, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
-1, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
-1, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
-1, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5,
0, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
0, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
0, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
0, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5,
1, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
1, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
1, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
1, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5,
2, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
2, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
2, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
2, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5,
3, -4.218119, -6.813662, 0, -0.5, 0.5, 0.5,
3, -4.218119, -6.813662, 1, -0.5, 0.5, 0.5,
3, -4.218119, -6.813662, 1, 1.5, 0.5, 0.5,
3, -4.218119, -6.813662, 0, 1.5, 0.5, 0.5
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
-2.915518, -2, -5.902783,
-2.915518, 2, -5.902783,
-2.915518, -2, -5.902783,
-3.067958, -2, -6.206409,
-2.915518, 0, -5.902783,
-3.067958, 0, -6.206409,
-2.915518, 2, -5.902783,
-3.067958, 2, -6.206409
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
-3.372837, -2, -6.813662, 0, -0.5, 0.5, 0.5,
-3.372837, -2, -6.813662, 1, -0.5, 0.5, 0.5,
-3.372837, -2, -6.813662, 1, 1.5, 0.5, 0.5,
-3.372837, -2, -6.813662, 0, 1.5, 0.5, 0.5,
-3.372837, 0, -6.813662, 0, -0.5, 0.5, 0.5,
-3.372837, 0, -6.813662, 1, -0.5, 0.5, 0.5,
-3.372837, 0, -6.813662, 1, 1.5, 0.5, 0.5,
-3.372837, 0, -6.813662, 0, 1.5, 0.5, 0.5,
-3.372837, 2, -6.813662, 0, -0.5, 0.5, 0.5,
-3.372837, 2, -6.813662, 1, -0.5, 0.5, 0.5,
-3.372837, 2, -6.813662, 1, 1.5, 0.5, 0.5,
-3.372837, 2, -6.813662, 0, 1.5, 0.5, 0.5
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
-2.915518, -3.65707, -4,
-2.915518, -3.65707, 6,
-2.915518, -3.65707, -4,
-3.067958, -3.844086, -4,
-2.915518, -3.65707, -2,
-3.067958, -3.844086, -2,
-2.915518, -3.65707, 0,
-3.067958, -3.844086, 0,
-2.915518, -3.65707, 2,
-3.067958, -3.844086, 2,
-2.915518, -3.65707, 4,
-3.067958, -3.844086, 4,
-2.915518, -3.65707, 6,
-3.067958, -3.844086, 6
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
"4",
"6"
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
-3.372837, -4.218119, -4, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, -4, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, -4, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, -4, 0, 1.5, 0.5, 0.5,
-3.372837, -4.218119, -2, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, -2, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, -2, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, -2, 0, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 0, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 0, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 0, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 0, 0, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 2, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 2, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 2, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 2, 0, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 4, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 4, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 4, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 4, 0, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 6, 0, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 6, 1, -0.5, 0.5, 0.5,
-3.372837, -4.218119, 6, 1, 1.5, 0.5, 0.5,
-3.372837, -4.218119, 6, 0, 1.5, 0.5, 0.5
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
-2.915518, -3.65707, -5.902783,
-2.915518, 3.823577, -5.902783,
-2.915518, -3.65707, 6.242269,
-2.915518, 3.823577, 6.242269,
-2.915518, -3.65707, -5.902783,
-2.915518, -3.65707, 6.242269,
-2.915518, 3.823577, -5.902783,
-2.915518, 3.823577, 6.242269,
-2.915518, -3.65707, -5.902783,
3.182062, -3.65707, -5.902783,
-2.915518, -3.65707, 6.242269,
3.182062, -3.65707, 6.242269,
-2.915518, 3.823577, -5.902783,
3.182062, 3.823577, -5.902783,
-2.915518, 3.823577, 6.242269,
3.182062, 3.823577, 6.242269,
3.182062, -3.65707, -5.902783,
3.182062, 3.823577, -5.902783,
3.182062, -3.65707, 6.242269,
3.182062, 3.823577, 6.242269,
3.182062, -3.65707, -5.902783,
3.182062, -3.65707, 6.242269,
3.182062, 3.823577, -5.902783,
3.182062, 3.823577, 6.242269
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
var radius = 8.283463;
var distance = 36.85406;
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
mvMatrix.translate( -0.1332721, -0.08325326, -0.1697426 );
mvMatrix.scale( 1.468819, 1.197255, 0.7374396 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.85406);
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
trichloromethylthio<-read.table("trichloromethylthio.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichloromethylthio$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
```

```r
y<-trichloromethylthio$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
```

```r
z<-trichloromethylthio$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichloromethylthio' not found
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
-2.826718, 0.2261143, -1.825186, 0, 0, 1, 1, 1,
-2.724423, -0.02219268, -2.051616, 1, 0, 0, 1, 1,
-2.59892, -0.5442036, -0.5781532, 1, 0, 0, 1, 1,
-2.519441, -0.6452285, -1.422433, 1, 0, 0, 1, 1,
-2.351216, 0.01878295, -1.031087, 1, 0, 0, 1, 1,
-2.24515, 0.8103557, 0.7838716, 1, 0, 0, 1, 1,
-2.221311, -0.2553321, -2.123602, 0, 0, 0, 1, 1,
-2.21025, 0.350771, -2.909588, 0, 0, 0, 1, 1,
-2.153095, 0.09428976, -1.39883, 0, 0, 0, 1, 1,
-2.129344, -0.5897315, -0.1685745, 0, 0, 0, 1, 1,
-2.122257, 0.905478, -1.281759, 0, 0, 0, 1, 1,
-2.113114, 0.7850558, -0.2656478, 0, 0, 0, 1, 1,
-2.01153, -1.772943, -5.267125, 0, 0, 0, 1, 1,
-2.004355, -1.338356, -2.293099, 1, 1, 1, 1, 1,
-1.966089, 1.194204, -2.038205, 1, 1, 1, 1, 1,
-1.959046, 0.1168945, -2.29422, 1, 1, 1, 1, 1,
-1.957492, 0.2637571, -0.8317136, 1, 1, 1, 1, 1,
-1.948037, -1.610519, -3.413051, 1, 1, 1, 1, 1,
-1.93587, 0.2182975, -0.9428552, 1, 1, 1, 1, 1,
-1.905912, -1.54058, -1.168963, 1, 1, 1, 1, 1,
-1.886754, 0.6687815, -3.226424, 1, 1, 1, 1, 1,
-1.857441, -0.8001112, -0.4484248, 1, 1, 1, 1, 1,
-1.850043, 1.042382, -0.3266345, 1, 1, 1, 1, 1,
-1.840473, 0.6633575, -0.8754822, 1, 1, 1, 1, 1,
-1.830824, 0.1468516, -2.033405, 1, 1, 1, 1, 1,
-1.809523, -0.6966653, -1.202675, 1, 1, 1, 1, 1,
-1.803676, -0.2521939, -1.878643, 1, 1, 1, 1, 1,
-1.792841, 0.7347829, -3.049563, 1, 1, 1, 1, 1,
-1.770204, 1.069794, 1.990791, 0, 0, 1, 1, 1,
-1.748959, -0.5150556, -2.529022, 1, 0, 0, 1, 1,
-1.733915, 0.3863417, -1.689425, 1, 0, 0, 1, 1,
-1.730757, -0.780362, -1.594381, 1, 0, 0, 1, 1,
-1.729018, -1.331372, -1.182627, 1, 0, 0, 1, 1,
-1.720152, -2.486636, -2.98628, 1, 0, 0, 1, 1,
-1.715312, 2.074027, -1.3961, 0, 0, 0, 1, 1,
-1.702373, 1.149023, -0.7577125, 0, 0, 0, 1, 1,
-1.686996, -1.518243, -1.738054, 0, 0, 0, 1, 1,
-1.682738, -1.663335, -3.932842, 0, 0, 0, 1, 1,
-1.636441, 0.6223401, -1.305164, 0, 0, 0, 1, 1,
-1.618586, 0.734391, -2.231328, 0, 0, 0, 1, 1,
-1.613032, 0.9708523, -1.609399, 0, 0, 0, 1, 1,
-1.606936, -0.2760415, -1.505324, 1, 1, 1, 1, 1,
-1.596405, -0.07401567, -0.86569, 1, 1, 1, 1, 1,
-1.595331, -0.2528507, -0.6476663, 1, 1, 1, 1, 1,
-1.593162, -0.4073818, -2.824761, 1, 1, 1, 1, 1,
-1.582141, 1.541309, -0.3413723, 1, 1, 1, 1, 1,
-1.580905, 1.029112, -2.131461, 1, 1, 1, 1, 1,
-1.573028, -0.463062, -1.201154, 1, 1, 1, 1, 1,
-1.561332, -0.13735, -0.04145995, 1, 1, 1, 1, 1,
-1.541121, 0.9224005, -2.138965, 1, 1, 1, 1, 1,
-1.540967, -0.7516671, -2.895096, 1, 1, 1, 1, 1,
-1.513049, 1.148563, -0.06782546, 1, 1, 1, 1, 1,
-1.5039, -0.6059879, -1.933939, 1, 1, 1, 1, 1,
-1.503124, 0.881884, -0.4963354, 1, 1, 1, 1, 1,
-1.474978, -0.6043985, -0.7060758, 1, 1, 1, 1, 1,
-1.474935, 1.868597, -0.2613001, 1, 1, 1, 1, 1,
-1.473601, -0.9477535, -1.240378, 0, 0, 1, 1, 1,
-1.471058, 0.3796453, -2.920032, 1, 0, 0, 1, 1,
-1.459712, -0.02951895, 0.3137097, 1, 0, 0, 1, 1,
-1.447132, 1.163509, -1.139277, 1, 0, 0, 1, 1,
-1.425879, 0.2160913, -0.7074145, 1, 0, 0, 1, 1,
-1.425254, -1.497058, -1.727303, 1, 0, 0, 1, 1,
-1.417984, 0.5811059, -0.9740973, 0, 0, 0, 1, 1,
-1.417894, -1.148371, -1.333949, 0, 0, 0, 1, 1,
-1.405624, 0.4878391, -1.065779, 0, 0, 0, 1, 1,
-1.392389, 0.7113881, -0.4734899, 0, 0, 0, 1, 1,
-1.38871, -0.8684758, -1.455336, 0, 0, 0, 1, 1,
-1.385577, 0.1029812, -1.577582, 0, 0, 0, 1, 1,
-1.378634, -0.6464498, -1.581838, 0, 0, 0, 1, 1,
-1.375997, 0.1782966, -0.9430401, 1, 1, 1, 1, 1,
-1.368343, 0.2646962, -1.423983, 1, 1, 1, 1, 1,
-1.364608, -0.2753179, 0.1235324, 1, 1, 1, 1, 1,
-1.363241, -1.427714, -2.959584, 1, 1, 1, 1, 1,
-1.359446, 0.04557294, -0.2330092, 1, 1, 1, 1, 1,
-1.351684, -0.4375934, -0.6941837, 1, 1, 1, 1, 1,
-1.343565, -0.5873225, -3.157021, 1, 1, 1, 1, 1,
-1.341729, 0.3625277, -1.701025, 1, 1, 1, 1, 1,
-1.337019, -0.2180502, -2.343102, 1, 1, 1, 1, 1,
-1.334761, 0.891783, -2.227749, 1, 1, 1, 1, 1,
-1.333914, 0.6683654, -2.201476, 1, 1, 1, 1, 1,
-1.332127, 1.119395, -0.9598999, 1, 1, 1, 1, 1,
-1.303126, 0.1271633, -1.641115, 1, 1, 1, 1, 1,
-1.300718, 1.061471, -0.4619855, 1, 1, 1, 1, 1,
-1.297221, -0.6235986, -3.310736, 1, 1, 1, 1, 1,
-1.295763, 1.417401, -1.136676, 0, 0, 1, 1, 1,
-1.294101, -0.5703356, -2.122198, 1, 0, 0, 1, 1,
-1.285214, -0.09406719, -1.723183, 1, 0, 0, 1, 1,
-1.283304, 1.13958, -0.8201047, 1, 0, 0, 1, 1,
-1.276562, 0.01977894, -1.306746, 1, 0, 0, 1, 1,
-1.267601, -1.812822, -1.139062, 1, 0, 0, 1, 1,
-1.265115, 1.228299, -2.042309, 0, 0, 0, 1, 1,
-1.259456, -0.09779118, -0.8976206, 0, 0, 0, 1, 1,
-1.257868, -0.8209797, -2.074009, 0, 0, 0, 1, 1,
-1.25385, -1.052927, -3.402593, 0, 0, 0, 1, 1,
-1.252021, -1.293398, -2.502171, 0, 0, 0, 1, 1,
-1.245057, -0.7576473, -2.956245, 0, 0, 0, 1, 1,
-1.241543, 0.2471354, -1.957548, 0, 0, 0, 1, 1,
-1.239751, -1.012092, -1.465054, 1, 1, 1, 1, 1,
-1.23964, -0.09780774, -2.172472, 1, 1, 1, 1, 1,
-1.23684, -0.5322347, -2.02431, 1, 1, 1, 1, 1,
-1.235485, 0.6469757, -1.736694, 1, 1, 1, 1, 1,
-1.229317, -0.08888074, -2.26815, 1, 1, 1, 1, 1,
-1.217771, -1.767471, -4.770778, 1, 1, 1, 1, 1,
-1.217294, -0.2323173, -1.643428, 1, 1, 1, 1, 1,
-1.215258, 0.9483764, -1.712594, 1, 1, 1, 1, 1,
-1.204882, 0.311704, -1.632652, 1, 1, 1, 1, 1,
-1.200162, -2.250416, -2.852854, 1, 1, 1, 1, 1,
-1.197722, -0.4064737, -1.547064, 1, 1, 1, 1, 1,
-1.187227, -0.02857574, -2.337456, 1, 1, 1, 1, 1,
-1.179526, -0.3454281, -2.698581, 1, 1, 1, 1, 1,
-1.179128, 1.141516, -1.238242, 1, 1, 1, 1, 1,
-1.176222, -1.093636, -3.268331, 1, 1, 1, 1, 1,
-1.17089, 0.6945459, -3.094479, 0, 0, 1, 1, 1,
-1.164544, 0.8521777, -1.594983, 1, 0, 0, 1, 1,
-1.156618, -1.408551, -3.234707, 1, 0, 0, 1, 1,
-1.153975, -0.2449617, -1.359586, 1, 0, 0, 1, 1,
-1.151721, 1.947533, 0.3574497, 1, 0, 0, 1, 1,
-1.149662, 0.532747, -1.74673, 1, 0, 0, 1, 1,
-1.141573, -0.1336208, -0.6282295, 0, 0, 0, 1, 1,
-1.129339, 0.5339667, 0.06238085, 0, 0, 0, 1, 1,
-1.129002, 0.09414794, -1.913955, 0, 0, 0, 1, 1,
-1.12599, -0.2648907, -2.250375, 0, 0, 0, 1, 1,
-1.123274, -1.971161, -2.64128, 0, 0, 0, 1, 1,
-1.120452, 0.6287628, 0.6907931, 0, 0, 0, 1, 1,
-1.120214, -0.1772842, -0.6497039, 0, 0, 0, 1, 1,
-1.115426, -0.105832, -3.048304, 1, 1, 1, 1, 1,
-1.10964, -0.0964174, -2.31773, 1, 1, 1, 1, 1,
-1.109165, -0.1514468, -2.232953, 1, 1, 1, 1, 1,
-1.109035, -0.9553246, -2.225646, 1, 1, 1, 1, 1,
-1.104778, -0.5351911, -3.20822, 1, 1, 1, 1, 1,
-1.099475, 0.5274418, -1.616874, 1, 1, 1, 1, 1,
-1.096603, 0.169998, -2.056423, 1, 1, 1, 1, 1,
-1.079891, -0.1652441, -2.611396, 1, 1, 1, 1, 1,
-1.073459, 0.2181973, -2.119199, 1, 1, 1, 1, 1,
-1.071898, -0.4156478, -2.260192, 1, 1, 1, 1, 1,
-1.068908, 1.273453, -2.40543, 1, 1, 1, 1, 1,
-1.062181, 0.2965049, 0.2770126, 1, 1, 1, 1, 1,
-1.059312, -0.3375451, -2.504264, 1, 1, 1, 1, 1,
-1.054405, -0.5493155, -1.012576, 1, 1, 1, 1, 1,
-1.047571, -0.259141, -4.37662, 1, 1, 1, 1, 1,
-1.039268, -1.768105, -4.019997, 0, 0, 1, 1, 1,
-1.038036, -0.5680652, -2.54103, 1, 0, 0, 1, 1,
-1.019937, 0.3088567, -1.181741, 1, 0, 0, 1, 1,
-1.019208, -1.286674, -3.6022, 1, 0, 0, 1, 1,
-1.017915, 0.5031064, 0.2568614, 1, 0, 0, 1, 1,
-1.010045, 0.1679503, -1.096903, 1, 0, 0, 1, 1,
-0.9882411, 1.121518, -1.872672, 0, 0, 0, 1, 1,
-0.9867972, -0.3956979, -1.695524, 0, 0, 0, 1, 1,
-0.9851175, -0.4968863, -3.906607, 0, 0, 0, 1, 1,
-0.9802811, 0.3223504, -0.4410323, 0, 0, 0, 1, 1,
-0.9735754, -0.1046753, -0.947697, 0, 0, 0, 1, 1,
-0.9734686, -0.1322712, -1.290278, 0, 0, 0, 1, 1,
-0.9719627, 2.367551, -0.8270816, 0, 0, 0, 1, 1,
-0.9707033, -1.671242, -3.030813, 1, 1, 1, 1, 1,
-0.9654662, -1.773382, -2.903301, 1, 1, 1, 1, 1,
-0.9627947, 2.031331, -0.8391516, 1, 1, 1, 1, 1,
-0.9590597, 1.100798, -0.7292464, 1, 1, 1, 1, 1,
-0.9584628, 0.8722121, -0.1810701, 1, 1, 1, 1, 1,
-0.9584449, -0.5263579, -1.25317, 1, 1, 1, 1, 1,
-0.9567679, 0.2174999, -2.92513, 1, 1, 1, 1, 1,
-0.9566206, -0.4434466, -1.45553, 1, 1, 1, 1, 1,
-0.9443979, -1.321736, -2.518621, 1, 1, 1, 1, 1,
-0.9389135, -0.6332946, -2.226396, 1, 1, 1, 1, 1,
-0.9377959, 1.563667, -0.5295202, 1, 1, 1, 1, 1,
-0.9367856, -2.7382, -0.6395003, 1, 1, 1, 1, 1,
-0.9359052, 0.05650838, -2.199459, 1, 1, 1, 1, 1,
-0.9343255, -0.8189316, -3.762198, 1, 1, 1, 1, 1,
-0.9248832, -0.4678276, -2.466011, 1, 1, 1, 1, 1,
-0.9098672, 0.001764441, -1.501072, 0, 0, 1, 1, 1,
-0.9090859, 1.353856, -0.6263778, 1, 0, 0, 1, 1,
-0.9039642, -0.03519132, -0.5056682, 1, 0, 0, 1, 1,
-0.9005424, -0.8545219, -2.577497, 1, 0, 0, 1, 1,
-0.8945103, -0.2186249, -1.383868, 1, 0, 0, 1, 1,
-0.8937474, -1.215734, -2.387322, 1, 0, 0, 1, 1,
-0.8884203, 0.195913, 1.669167, 0, 0, 0, 1, 1,
-0.8873098, -0.8159432, -4.029458, 0, 0, 0, 1, 1,
-0.8848922, 0.4644539, -2.835603, 0, 0, 0, 1, 1,
-0.8767833, -0.1045151, -0.7590481, 0, 0, 0, 1, 1,
-0.8760757, 0.572548, -0.8455199, 0, 0, 0, 1, 1,
-0.8752019, -1.556367, -4.887315, 0, 0, 0, 1, 1,
-0.873939, 0.510775, -0.8879226, 0, 0, 0, 1, 1,
-0.8720998, -0.6814418, -3.092166, 1, 1, 1, 1, 1,
-0.8718377, 1.360858, -0.7560955, 1, 1, 1, 1, 1,
-0.8703635, 0.8555776, -0.1064354, 1, 1, 1, 1, 1,
-0.8512132, 0.6750873, 0.02120106, 1, 1, 1, 1, 1,
-0.8473182, 0.5380589, -0.8588343, 1, 1, 1, 1, 1,
-0.8468677, 0.6176853, -0.6833122, 1, 1, 1, 1, 1,
-0.843398, -1.579856, -2.315069, 1, 1, 1, 1, 1,
-0.8433686, 2.391013, -0.6167033, 1, 1, 1, 1, 1,
-0.8388922, -0.6067602, -2.731231, 1, 1, 1, 1, 1,
-0.8338831, 0.1372587, -1.288, 1, 1, 1, 1, 1,
-0.8280872, 0.08436929, -1.522614, 1, 1, 1, 1, 1,
-0.8279901, -0.673035, -2.998647, 1, 1, 1, 1, 1,
-0.8259764, -0.2683414, -1.064937, 1, 1, 1, 1, 1,
-0.8258491, -0.4169131, -3.859281, 1, 1, 1, 1, 1,
-0.8220072, -1.207389, -1.906443, 1, 1, 1, 1, 1,
-0.818957, 0.2906016, -2.71566, 0, 0, 1, 1, 1,
-0.8169974, -1.801191, -2.655476, 1, 0, 0, 1, 1,
-0.8162007, -0.7386461, -3.15097, 1, 0, 0, 1, 1,
-0.8115864, -0.7320359, -2.404667, 1, 0, 0, 1, 1,
-0.8110219, 0.2927836, -0.9618474, 1, 0, 0, 1, 1,
-0.8087594, 0.1181164, -1.089555, 1, 0, 0, 1, 1,
-0.8076599, -1.951593, -3.624301, 0, 0, 0, 1, 1,
-0.7994841, 0.05829459, -0.387862, 0, 0, 0, 1, 1,
-0.7993162, -0.2408566, -3.460979, 0, 0, 0, 1, 1,
-0.7967981, 0.3880327, -2.425009, 0, 0, 0, 1, 1,
-0.7966135, -0.5295595, -0.6129866, 0, 0, 0, 1, 1,
-0.7920571, -1.218941, -1.657983, 0, 0, 0, 1, 1,
-0.7916814, 0.3843748, -1.25735, 0, 0, 0, 1, 1,
-0.7887494, 0.1944198, -1.47519, 1, 1, 1, 1, 1,
-0.7855068, 2.115691, 1.080327, 1, 1, 1, 1, 1,
-0.7854661, 0.1109877, -0.9598754, 1, 1, 1, 1, 1,
-0.7847292, -1.788046, -5.725914, 1, 1, 1, 1, 1,
-0.7836428, -0.6607103, -1.00704, 1, 1, 1, 1, 1,
-0.7835114, -0.0887021, 0.1095102, 1, 1, 1, 1, 1,
-0.7788721, 0.636926, 1.125826, 1, 1, 1, 1, 1,
-0.7630166, -0.8326615, -2.633014, 1, 1, 1, 1, 1,
-0.7604514, 1.20301, -0.1613228, 1, 1, 1, 1, 1,
-0.7598676, -0.08912357, -2.291991, 1, 1, 1, 1, 1,
-0.7584519, -2.580041, -1.027935, 1, 1, 1, 1, 1,
-0.7576982, 1.362717, 0.1833004, 1, 1, 1, 1, 1,
-0.7576646, 1.345154, 0.174922, 1, 1, 1, 1, 1,
-0.7517465, 0.0981743, -1.268727, 1, 1, 1, 1, 1,
-0.7516652, -0.2903367, -1.946726, 1, 1, 1, 1, 1,
-0.7480848, -0.2159145, -0.7155687, 0, 0, 1, 1, 1,
-0.7453887, 0.8380077, -0.7536139, 1, 0, 0, 1, 1,
-0.7425267, -0.4901619, -2.379562, 1, 0, 0, 1, 1,
-0.7401058, -0.3042608, -2.999418, 1, 0, 0, 1, 1,
-0.7394543, 0.6937981, 0.2251363, 1, 0, 0, 1, 1,
-0.739066, 0.407862, -1.198699, 1, 0, 0, 1, 1,
-0.7362317, 0.6369209, -2.029657, 0, 0, 0, 1, 1,
-0.7308578, 0.1232606, 0.07465288, 0, 0, 0, 1, 1,
-0.7307695, -0.02447001, -2.77504, 0, 0, 0, 1, 1,
-0.7294472, 0.5612409, 0.5103395, 0, 0, 0, 1, 1,
-0.7178288, 1.268348, -0.8936138, 0, 0, 0, 1, 1,
-0.7150543, -0.3284899, -2.942669, 0, 0, 0, 1, 1,
-0.7146101, -1.04166, -2.924841, 0, 0, 0, 1, 1,
-0.7112973, 0.9441127, -1.026909, 1, 1, 1, 1, 1,
-0.705978, -2.251565, -4.142505, 1, 1, 1, 1, 1,
-0.7040232, 0.6580882, -1.982877, 1, 1, 1, 1, 1,
-0.7022457, 1.368825, 0.3220152, 1, 1, 1, 1, 1,
-0.7008834, -0.07128583, -2.293939, 1, 1, 1, 1, 1,
-0.6995162, -0.9922746, -2.724441, 1, 1, 1, 1, 1,
-0.6974875, 3.714635, 1.607197, 1, 1, 1, 1, 1,
-0.6962488, -0.4646403, -0.05202379, 1, 1, 1, 1, 1,
-0.6909007, -1.151638, -3.067101, 1, 1, 1, 1, 1,
-0.6898629, 0.4389248, -0.2861777, 1, 1, 1, 1, 1,
-0.6846978, 1.28628, 0.7304748, 1, 1, 1, 1, 1,
-0.682969, -1.580135, -0.9528852, 1, 1, 1, 1, 1,
-0.6828098, 0.8775657, -0.32333, 1, 1, 1, 1, 1,
-0.6822082, -0.157649, -0.9733945, 1, 1, 1, 1, 1,
-0.6718293, -0.8441614, 0.4884315, 1, 1, 1, 1, 1,
-0.6705723, 0.8928363, -1.08953, 0, 0, 1, 1, 1,
-0.6635047, -1.796261, -3.663513, 1, 0, 0, 1, 1,
-0.6620225, 0.3473023, -0.9888583, 1, 0, 0, 1, 1,
-0.6585976, 0.136874, -2.39744, 1, 0, 0, 1, 1,
-0.6585208, 0.7643464, -0.3625306, 1, 0, 0, 1, 1,
-0.6583005, -2.048033, -0.5584361, 1, 0, 0, 1, 1,
-0.6556116, -1.350072, -3.128543, 0, 0, 0, 1, 1,
-0.6543607, -0.6384031, -1.649707, 0, 0, 0, 1, 1,
-0.653181, 0.3121536, 0.3911366, 0, 0, 0, 1, 1,
-0.6530685, -0.4275302, -2.862664, 0, 0, 0, 1, 1,
-0.6469517, 1.514705, -0.4772741, 0, 0, 0, 1, 1,
-0.6447265, 1.436221, -0.6674141, 0, 0, 0, 1, 1,
-0.6422918, -0.09596629, -1.655811, 0, 0, 0, 1, 1,
-0.634022, -0.2892999, -2.96916, 1, 1, 1, 1, 1,
-0.6306509, -2.006188, -3.214044, 1, 1, 1, 1, 1,
-0.6266192, -0.3221702, -1.940366, 1, 1, 1, 1, 1,
-0.6258708, 0.4521828, -1.792129, 1, 1, 1, 1, 1,
-0.619567, 0.8177522, -0.3556338, 1, 1, 1, 1, 1,
-0.6182291, 1.460868, -0.4584457, 1, 1, 1, 1, 1,
-0.6169003, -1.995646, -1.314873, 1, 1, 1, 1, 1,
-0.6165045, -0.2976277, -0.8354427, 1, 1, 1, 1, 1,
-0.6112854, -0.5434263, -2.567255, 1, 1, 1, 1, 1,
-0.6031888, 0.102658, -0.9528759, 1, 1, 1, 1, 1,
-0.6008337, 0.4388921, -2.302032, 1, 1, 1, 1, 1,
-0.5973553, -1.796136, -3.725683, 1, 1, 1, 1, 1,
-0.5944609, -1.119994, -1.090029, 1, 1, 1, 1, 1,
-0.5944287, -1.315189, -3.475909, 1, 1, 1, 1, 1,
-0.5933298, -0.2190586, -1.734847, 1, 1, 1, 1, 1,
-0.5923974, 2.14421, 1.721174, 0, 0, 1, 1, 1,
-0.5889201, 1.341315, -0.3405359, 1, 0, 0, 1, 1,
-0.5885841, 1.651634, 1.399919, 1, 0, 0, 1, 1,
-0.5827446, -0.7816906, -1.45503, 1, 0, 0, 1, 1,
-0.5816746, -0.2443192, -1.989535, 1, 0, 0, 1, 1,
-0.5803056, -0.1965058, -1.002015, 1, 0, 0, 1, 1,
-0.5774345, 0.1951263, -1.63519, 0, 0, 0, 1, 1,
-0.576922, -0.8075675, -2.092294, 0, 0, 0, 1, 1,
-0.5742825, -0.3549445, -1.096781, 0, 0, 0, 1, 1,
-0.5734281, -0.897719, -2.385702, 0, 0, 0, 1, 1,
-0.5703763, -0.4267615, -2.199691, 0, 0, 0, 1, 1,
-0.5600722, -1.426496, -2.976743, 0, 0, 0, 1, 1,
-0.5598907, -0.8417552, -3.355532, 0, 0, 0, 1, 1,
-0.5572073, 1.128664, -1.230742, 1, 1, 1, 1, 1,
-0.5553819, -0.02811406, -1.946223, 1, 1, 1, 1, 1,
-0.5551158, -0.896969, -1.91443, 1, 1, 1, 1, 1,
-0.5451329, 0.02362854, 0.04808743, 1, 1, 1, 1, 1,
-0.5429526, 1.016973, 1.476903, 1, 1, 1, 1, 1,
-0.5341963, 0.5596699, -1.818583, 1, 1, 1, 1, 1,
-0.5273613, -0.7777828, -3.573304, 1, 1, 1, 1, 1,
-0.5172433, 0.3410163, -1.259641, 1, 1, 1, 1, 1,
-0.5160875, -0.3618322, 0.6228573, 1, 1, 1, 1, 1,
-0.5154771, -0.1845189, -2.877017, 1, 1, 1, 1, 1,
-0.5129328, 0.7983403, -2.09691, 1, 1, 1, 1, 1,
-0.5127525, -1.121459, -3.780169, 1, 1, 1, 1, 1,
-0.5080902, 0.9789591, 0.1400043, 1, 1, 1, 1, 1,
-0.5070416, -0.18492, -2.369105, 1, 1, 1, 1, 1,
-0.5063894, -0.5067917, -1.514536, 1, 1, 1, 1, 1,
-0.5041844, -0.7021546, -2.569602, 0, 0, 1, 1, 1,
-0.497941, 0.6029125, -0.5945713, 1, 0, 0, 1, 1,
-0.4978018, -0.9658158, -3.32854, 1, 0, 0, 1, 1,
-0.4959872, -0.7398344, -0.02962046, 1, 0, 0, 1, 1,
-0.4891059, 0.4050468, 0.2987024, 1, 0, 0, 1, 1,
-0.4846296, -1.550691, -2.403453, 1, 0, 0, 1, 1,
-0.4816315, 1.934045, -1.769362, 0, 0, 0, 1, 1,
-0.4759055, -0.03465747, -2.360279, 0, 0, 0, 1, 1,
-0.4753176, -0.1923007, -0.9344033, 0, 0, 0, 1, 1,
-0.4742332, 0.9376533, 0.3400937, 0, 0, 0, 1, 1,
-0.4720411, -1.219962, -4.346014, 0, 0, 0, 1, 1,
-0.4653375, -0.6746481, -3.886171, 0, 0, 0, 1, 1,
-0.4647496, -0.9716726, -3.278345, 0, 0, 0, 1, 1,
-0.4598602, 0.5460828, -1.12562, 1, 1, 1, 1, 1,
-0.4522395, -0.6420638, -1.414696, 1, 1, 1, 1, 1,
-0.4514201, 0.7782393, -0.6147859, 1, 1, 1, 1, 1,
-0.4440697, -0.7654068, -5.217773, 1, 1, 1, 1, 1,
-0.4348328, 1.056128, 0.2503227, 1, 1, 1, 1, 1,
-0.4184597, 0.5393241, -0.1316691, 1, 1, 1, 1, 1,
-0.4179699, -1.029649, -1.944083, 1, 1, 1, 1, 1,
-0.4128376, 1.171755, 0.3102236, 1, 1, 1, 1, 1,
-0.4116351, -0.09364209, -1.792926, 1, 1, 1, 1, 1,
-0.41119, 0.4299876, -0.4701916, 1, 1, 1, 1, 1,
-0.399758, 0.408455, -1.282766, 1, 1, 1, 1, 1,
-0.3988311, 0.630563, 0.8742959, 1, 1, 1, 1, 1,
-0.397966, 0.8961538, -0.8739991, 1, 1, 1, 1, 1,
-0.3972273, -1.095078, -3.686053, 1, 1, 1, 1, 1,
-0.3969513, 0.7086157, -1.145085, 1, 1, 1, 1, 1,
-0.3956328, 1.391995, 0.8181211, 0, 0, 1, 1, 1,
-0.3926371, 1.089626, 0.5938594, 1, 0, 0, 1, 1,
-0.3922051, -0.8586868, -2.887867, 1, 0, 0, 1, 1,
-0.3842268, -0.791541, -1.180008, 1, 0, 0, 1, 1,
-0.3829185, -0.2970301, -1.803538, 1, 0, 0, 1, 1,
-0.3816261, -0.5614244, -1.355948, 1, 0, 0, 1, 1,
-0.3779545, -0.6394462, -2.609089, 0, 0, 0, 1, 1,
-0.3758807, -1.447239, -2.929552, 0, 0, 0, 1, 1,
-0.3713184, 1.33792, -1.412885, 0, 0, 0, 1, 1,
-0.3684668, 0.723392, -0.858031, 0, 0, 0, 1, 1,
-0.3676256, -0.720274, -2.331438, 0, 0, 0, 1, 1,
-0.3662134, 0.2253644, -2.834221, 0, 0, 0, 1, 1,
-0.3654808, -0.6716045, -4.523111, 0, 0, 0, 1, 1,
-0.364303, -1.323259, -3.489069, 1, 1, 1, 1, 1,
-0.3633571, -1.798593, -2.293436, 1, 1, 1, 1, 1,
-0.3592496, -0.94891, -4.434015, 1, 1, 1, 1, 1,
-0.3578386, 0.1271451, -1.931558, 1, 1, 1, 1, 1,
-0.3542007, 2.857042, 0.1062492, 1, 1, 1, 1, 1,
-0.3516537, -1.208859, -2.379323, 1, 1, 1, 1, 1,
-0.3496719, -1.219268, -1.944452, 1, 1, 1, 1, 1,
-0.3416327, -1.136461, -2.11259, 1, 1, 1, 1, 1,
-0.3410601, 0.609189, -0.9033698, 1, 1, 1, 1, 1,
-0.3408241, -1.304287, -4.073649, 1, 1, 1, 1, 1,
-0.3338806, 0.5715603, 0.7957874, 1, 1, 1, 1, 1,
-0.3332121, 0.3592408, -0.1198993, 1, 1, 1, 1, 1,
-0.3328452, 0.7756491, -0.367409, 1, 1, 1, 1, 1,
-0.3281401, 0.1974522, -1.568775, 1, 1, 1, 1, 1,
-0.3194827, 2.177599, -0.7353296, 1, 1, 1, 1, 1,
-0.3134449, -0.7847918, -2.212546, 0, 0, 1, 1, 1,
-0.3131964, -1.109793, -3.32105, 1, 0, 0, 1, 1,
-0.3055603, -0.6818133, -1.414961, 1, 0, 0, 1, 1,
-0.3050334, 0.8795422, -1.187281, 1, 0, 0, 1, 1,
-0.3006539, -0.1251266, -1.373147, 1, 0, 0, 1, 1,
-0.2964749, 1.597292, -1.420254, 1, 0, 0, 1, 1,
-0.2959161, -0.2684113, -3.486506, 0, 0, 0, 1, 1,
-0.2957723, -0.2389468, -1.215385, 0, 0, 0, 1, 1,
-0.2948343, 0.6200728, -0.3594669, 0, 0, 0, 1, 1,
-0.2847842, 0.7117289, -1.38201, 0, 0, 0, 1, 1,
-0.284656, 0.0341914, -1.736531, 0, 0, 0, 1, 1,
-0.2822898, -0.1958593, -3.880711, 0, 0, 0, 1, 1,
-0.2677977, -1.661111, -3.551423, 0, 0, 0, 1, 1,
-0.2651418, 1.571832, 0.4197303, 1, 1, 1, 1, 1,
-0.2640609, 0.7778785, 0.5825874, 1, 1, 1, 1, 1,
-0.2616606, 0.7630886, -2.060838, 1, 1, 1, 1, 1,
-0.2608326, 1.78354, 1.508538, 1, 1, 1, 1, 1,
-0.2603179, -0.2210396, -1.784285, 1, 1, 1, 1, 1,
-0.2600203, 0.8722792, -0.7505184, 1, 1, 1, 1, 1,
-0.2582454, -0.9960752, -1.112606, 1, 1, 1, 1, 1,
-0.2547611, 0.01347066, -2.442438, 1, 1, 1, 1, 1,
-0.2533171, -1.203252, -1.288524, 1, 1, 1, 1, 1,
-0.2527888, -1.356436, -1.36519, 1, 1, 1, 1, 1,
-0.2520996, 0.6639851, -2.624856, 1, 1, 1, 1, 1,
-0.251315, -1.516785, -1.924524, 1, 1, 1, 1, 1,
-0.2488627, 0.5060576, -1.697051, 1, 1, 1, 1, 1,
-0.2487361, 0.8303484, -0.6342253, 1, 1, 1, 1, 1,
-0.2464062, -0.5927222, -1.848572, 1, 1, 1, 1, 1,
-0.243831, -0.7486448, -3.147156, 0, 0, 1, 1, 1,
-0.2407475, 0.6189877, 0.1801349, 1, 0, 0, 1, 1,
-0.2402872, 2.032123, -2.229655, 1, 0, 0, 1, 1,
-0.2366597, 0.1130681, -0.6732674, 1, 0, 0, 1, 1,
-0.2328633, 1.959052, -0.9706951, 1, 0, 0, 1, 1,
-0.2305782, 1.691246, 0.830603, 1, 0, 0, 1, 1,
-0.2285632, 1.752946, 0.1200894, 0, 0, 0, 1, 1,
-0.227885, 0.4170142, -0.7247351, 0, 0, 0, 1, 1,
-0.2272571, -0.5071027, -3.277775, 0, 0, 0, 1, 1,
-0.2190176, 2.327357, -1.494709, 0, 0, 0, 1, 1,
-0.2155803, -2.136663, -4.407889, 0, 0, 0, 1, 1,
-0.2154859, 0.9169748, 1.430998, 0, 0, 0, 1, 1,
-0.2150913, 1.3771, -1.479682, 0, 0, 0, 1, 1,
-0.2107178, 0.7563721, -0.6700118, 1, 1, 1, 1, 1,
-0.2051916, -0.8861744, -4.621617, 1, 1, 1, 1, 1,
-0.2043937, 0.273863, -1.856311, 1, 1, 1, 1, 1,
-0.2036347, -1.222114, -3.063913, 1, 1, 1, 1, 1,
-0.2018011, 0.2557885, 1.552371, 1, 1, 1, 1, 1,
-0.2006609, 0.5013869, 1.158048, 1, 1, 1, 1, 1,
-0.1976972, -0.8952694, -2.019405, 1, 1, 1, 1, 1,
-0.1966705, 0.5327949, -1.202152, 1, 1, 1, 1, 1,
-0.1953214, 1.141694, -1.91844, 1, 1, 1, 1, 1,
-0.1922953, -0.01695848, -1.226128, 1, 1, 1, 1, 1,
-0.1883716, -0.008880218, -3.01344, 1, 1, 1, 1, 1,
-0.1836907, 0.8528061, -1.458926, 1, 1, 1, 1, 1,
-0.178914, -0.5792292, -3.39537, 1, 1, 1, 1, 1,
-0.1784919, -0.4804583, -3.7471, 1, 1, 1, 1, 1,
-0.1770326, 0.3989243, 0.4937473, 1, 1, 1, 1, 1,
-0.1755443, -2.798099, -2.53679, 0, 0, 1, 1, 1,
-0.1738734, 0.4377775, 0.6456735, 1, 0, 0, 1, 1,
-0.1734685, 0.1170601, -0.484373, 1, 0, 0, 1, 1,
-0.1716186, -0.2486396, -4.380222, 1, 0, 0, 1, 1,
-0.1680855, -1.534644, -1.935844, 1, 0, 0, 1, 1,
-0.1653795, 0.06925619, -1.431537, 1, 0, 0, 1, 1,
-0.1629301, -0.0848439, -2.203119, 0, 0, 0, 1, 1,
-0.1584044, -0.2916606, -2.862454, 0, 0, 0, 1, 1,
-0.1567649, -0.7804226, -2.660358, 0, 0, 0, 1, 1,
-0.1560585, -0.701978, -3.113235, 0, 0, 0, 1, 1,
-0.1481687, -0.7011356, -1.418289, 0, 0, 0, 1, 1,
-0.1450626, -0.5339535, -2.325843, 0, 0, 0, 1, 1,
-0.144926, -0.5374795, -2.763675, 0, 0, 0, 1, 1,
-0.1395735, 1.506158, 1.313078, 1, 1, 1, 1, 1,
-0.1390405, -0.9190657, -2.505259, 1, 1, 1, 1, 1,
-0.1354742, 1.960271, 0.4027129, 1, 1, 1, 1, 1,
-0.1327595, 0.4746983, -1.728137, 1, 1, 1, 1, 1,
-0.1323864, 0.2662081, -1.46918, 1, 1, 1, 1, 1,
-0.1314557, -0.01673197, -2.364857, 1, 1, 1, 1, 1,
-0.130722, 0.4784909, 1.711348, 1, 1, 1, 1, 1,
-0.1286382, -0.7602264, -1.648672, 1, 1, 1, 1, 1,
-0.1283052, -0.1081148, -2.404816, 1, 1, 1, 1, 1,
-0.1247293, -0.8335814, -2.351267, 1, 1, 1, 1, 1,
-0.1201735, 0.2182091, -1.495878, 1, 1, 1, 1, 1,
-0.1189276, 0.2934604, -1.031341, 1, 1, 1, 1, 1,
-0.116146, -0.9774316, -3.082038, 1, 1, 1, 1, 1,
-0.1128784, -1.336998, -2.887519, 1, 1, 1, 1, 1,
-0.1118941, 0.7800256, 0.01019171, 1, 1, 1, 1, 1,
-0.1097412, -0.03055483, -3.212087, 0, 0, 1, 1, 1,
-0.109093, 0.7010671, 0.6255574, 1, 0, 0, 1, 1,
-0.105151, -0.2692261, -2.383538, 1, 0, 0, 1, 1,
-0.1036692, -1.366161, -2.951142, 1, 0, 0, 1, 1,
-0.1023475, 0.5432327, -0.2611029, 1, 0, 0, 1, 1,
-0.1006172, 1.091865, -0.8144233, 1, 0, 0, 1, 1,
-0.09838636, 0.3709251, -1.411811, 0, 0, 0, 1, 1,
-0.09129712, -0.160712, -3.0158, 0, 0, 0, 1, 1,
-0.08413417, 1.728622, 0.2244319, 0, 0, 0, 1, 1,
-0.0807448, -1.314614, -3.359826, 0, 0, 0, 1, 1,
-0.08014844, 0.298941, 1.02589, 0, 0, 0, 1, 1,
-0.079472, -0.9538698, -1.611928, 0, 0, 0, 1, 1,
-0.07445665, 0.3855645, -2.143099, 0, 0, 0, 1, 1,
-0.07383194, 0.02897969, -0.7103581, 1, 1, 1, 1, 1,
-0.07382235, 0.7137102, -0.8233763, 1, 1, 1, 1, 1,
-0.07176915, 0.2939213, -1.025587, 1, 1, 1, 1, 1,
-0.0707458, -0.7225209, -2.374714, 1, 1, 1, 1, 1,
-0.06558279, -0.0131409, -1.598774, 1, 1, 1, 1, 1,
-0.06341021, -0.3298549, -3.368469, 1, 1, 1, 1, 1,
-0.06251217, 0.2077746, -0.2370131, 1, 1, 1, 1, 1,
-0.05838773, 0.06346298, -1.380423, 1, 1, 1, 1, 1,
-0.05034075, 0.3352851, -2.251872, 1, 1, 1, 1, 1,
-0.03967833, 0.9033123, 0.04375998, 1, 1, 1, 1, 1,
-0.03790525, 0.6114789, 1.420427, 1, 1, 1, 1, 1,
-0.0364177, -0.1112079, -2.466586, 1, 1, 1, 1, 1,
-0.03428261, 1.324286, -0.2904911, 1, 1, 1, 1, 1,
-0.03364956, 1.183912, 0.3112162, 1, 1, 1, 1, 1,
-0.033296, -1.062551, -2.7956, 1, 1, 1, 1, 1,
-0.03120834, 1.421551, -1.151493, 0, 0, 1, 1, 1,
-0.02966696, -0.5152432, -2.343754, 1, 0, 0, 1, 1,
-0.02547787, 0.1879624, 0.2022694, 1, 0, 0, 1, 1,
-0.02027204, -0.1914561, -1.248168, 1, 0, 0, 1, 1,
-0.01882425, -1.521781, -2.004109, 1, 0, 0, 1, 1,
-0.01784628, -3.002892, -3.465716, 1, 0, 0, 1, 1,
-0.01553196, 0.6344288, -0.4359842, 0, 0, 0, 1, 1,
-0.01316285, 1.627678, -2.793801, 0, 0, 0, 1, 1,
-0.0107817, -0.2393521, -2.529644, 0, 0, 0, 1, 1,
-0.01006145, -0.2826865, -2.706592, 0, 0, 0, 1, 1,
-0.004225773, -1.191449, -3.917105, 0, 0, 0, 1, 1,
4.608527e-05, -0.1939293, 2.668809, 0, 0, 0, 1, 1,
0.003473912, 0.7268404, 1.159193, 0, 0, 0, 1, 1,
0.004817591, -0.8547131, 3.154472, 1, 1, 1, 1, 1,
0.007280713, 0.9092705, -1.36813, 1, 1, 1, 1, 1,
0.007964891, -0.06677132, 2.524143, 1, 1, 1, 1, 1,
0.009490026, 0.7326151, -0.5664836, 1, 1, 1, 1, 1,
0.01269054, -0.5095545, 2.670474, 1, 1, 1, 1, 1,
0.01847344, -0.2205968, 3.109987, 1, 1, 1, 1, 1,
0.02175436, 1.370474, -0.01723646, 1, 1, 1, 1, 1,
0.02938082, -1.00514, 2.675351, 1, 1, 1, 1, 1,
0.03007379, -1.069966, 3.489201, 1, 1, 1, 1, 1,
0.03119477, -1.268178, 2.593563, 1, 1, 1, 1, 1,
0.03305946, 0.3371519, 1.060972, 1, 1, 1, 1, 1,
0.03525747, -0.2042938, 2.383324, 1, 1, 1, 1, 1,
0.03775843, -0.6668308, 4.175552, 1, 1, 1, 1, 1,
0.03976848, -0.5949538, 1.8334, 1, 1, 1, 1, 1,
0.04124065, -0.1109019, 4.503338, 1, 1, 1, 1, 1,
0.04174953, -0.2137798, 2.655191, 0, 0, 1, 1, 1,
0.04315528, 0.7541694, -0.2026268, 1, 0, 0, 1, 1,
0.04554541, 0.493655, 0.1908212, 1, 0, 0, 1, 1,
0.04674716, -0.08397447, 2.530226, 1, 0, 0, 1, 1,
0.04751973, -0.480015, 5.063725, 1, 0, 0, 1, 1,
0.05243739, 0.5881063, 1.610753, 1, 0, 0, 1, 1,
0.05306864, 0.4098224, 0.6845841, 0, 0, 0, 1, 1,
0.05586275, 0.4100737, 0.2732708, 0, 0, 0, 1, 1,
0.06422362, -1.275758, 3.248584, 0, 0, 0, 1, 1,
0.06443133, -0.5165974, 4.111718, 0, 0, 0, 1, 1,
0.06977171, 0.3094903, -0.3621515, 0, 0, 0, 1, 1,
0.07123319, -0.2410548, 3.792388, 0, 0, 0, 1, 1,
0.07282005, 1.327963, -1.400363, 0, 0, 0, 1, 1,
0.07332171, 1.045948, -0.854139, 1, 1, 1, 1, 1,
0.07336281, -0.08477402, 2.796031, 1, 1, 1, 1, 1,
0.07839186, 0.7587994, -0.4753794, 1, 1, 1, 1, 1,
0.08158612, -1.019392, 3.154382, 1, 1, 1, 1, 1,
0.08378385, 0.6014748, 2.69236, 1, 1, 1, 1, 1,
0.08673125, -0.5821832, 4.571308, 1, 1, 1, 1, 1,
0.09393389, 1.548791, -0.007730721, 1, 1, 1, 1, 1,
0.09673876, -1.41328, 2.998977, 1, 1, 1, 1, 1,
0.09907883, -0.7271724, 2.342575, 1, 1, 1, 1, 1,
0.1038848, 0.471863, 1.014431, 1, 1, 1, 1, 1,
0.1039528, 0.5102941, 0.7279938, 1, 1, 1, 1, 1,
0.105777, -0.4782146, 3.063408, 1, 1, 1, 1, 1,
0.1092431, -0.7818999, 3.022144, 1, 1, 1, 1, 1,
0.1102891, 0.4117872, -0.0006972131, 1, 1, 1, 1, 1,
0.1139934, 0.05855614, 0.5176068, 1, 1, 1, 1, 1,
0.1140665, 0.08463378, 0.928152, 0, 0, 1, 1, 1,
0.1153004, 0.3593788, 0.6676819, 1, 0, 0, 1, 1,
0.1182419, -0.9800429, 3.748754, 1, 0, 0, 1, 1,
0.1187978, 2.535787, 0.2660675, 1, 0, 0, 1, 1,
0.1190409, 0.4377046, 0.4126458, 1, 0, 0, 1, 1,
0.1199711, 1.77767, -0.3163926, 1, 0, 0, 1, 1,
0.1207699, 0.1941375, 2.381032, 0, 0, 0, 1, 1,
0.1237974, 0.5693825, 0.1382584, 0, 0, 0, 1, 1,
0.1239363, 0.02982719, 2.338087, 0, 0, 0, 1, 1,
0.1253751, -0.09577268, 0.6274078, 0, 0, 0, 1, 1,
0.1261506, 0.3737524, 1.557195, 0, 0, 0, 1, 1,
0.1291907, -0.7389504, 2.656319, 0, 0, 0, 1, 1,
0.1367712, 1.171652, -0.3029528, 0, 0, 0, 1, 1,
0.1372052, -0.08258469, -0.01581337, 1, 1, 1, 1, 1,
0.1411855, -0.9000967, 3.743845, 1, 1, 1, 1, 1,
0.142677, -0.4355938, 3.875849, 1, 1, 1, 1, 1,
0.1430219, -0.6364594, 2.100977, 1, 1, 1, 1, 1,
0.1472429, -0.1784275, 2.24619, 1, 1, 1, 1, 1,
0.1473482, 1.267677, 0.6365568, 1, 1, 1, 1, 1,
0.1494889, 0.229974, -0.6611434, 1, 1, 1, 1, 1,
0.1510763, -0.1690527, 1.315243, 1, 1, 1, 1, 1,
0.1518362, 1.794903, 0.2393804, 1, 1, 1, 1, 1,
0.1530705, -1.025227, 4.149474, 1, 1, 1, 1, 1,
0.1598464, -0.994519, 1.798479, 1, 1, 1, 1, 1,
0.1600332, 0.1725143, -0.286719, 1, 1, 1, 1, 1,
0.1631257, 1.276026, -1.60318, 1, 1, 1, 1, 1,
0.1632879, -1.415715, 3.764254, 1, 1, 1, 1, 1,
0.1645255, -2.134929, 3.640735, 1, 1, 1, 1, 1,
0.1670011, 0.1002945, 0.4204789, 0, 0, 1, 1, 1,
0.1723031, 2.476902, 1.621811, 1, 0, 0, 1, 1,
0.1745256, 0.924409, -0.1554593, 1, 0, 0, 1, 1,
0.1762007, 1.488888, -0.5671253, 1, 0, 0, 1, 1,
0.1762396, 0.1568251, 2.108508, 1, 0, 0, 1, 1,
0.176297, -3.548129, 1.47886, 1, 0, 0, 1, 1,
0.1816685, 0.06421956, 0.1619785, 0, 0, 0, 1, 1,
0.183699, 0.6953097, 0.5080525, 0, 0, 0, 1, 1,
0.1856181, -0.06645451, 2.008391, 0, 0, 0, 1, 1,
0.189579, 0.7543705, 0.6270842, 0, 0, 0, 1, 1,
0.191594, 0.4047323, 0.9168295, 0, 0, 0, 1, 1,
0.19224, 0.4661961, 0.2420429, 0, 0, 0, 1, 1,
0.1964431, -0.0957459, 3.171955, 0, 0, 0, 1, 1,
0.1975223, 0.9263898, -0.5090986, 1, 1, 1, 1, 1,
0.1982515, -0.05547262, 3.006991, 1, 1, 1, 1, 1,
0.2034624, -0.1418966, 0.2487064, 1, 1, 1, 1, 1,
0.2058344, 1.150991, 1.030869, 1, 1, 1, 1, 1,
0.2105227, 0.2893958, 0.9471732, 1, 1, 1, 1, 1,
0.2150258, -0.9366814, 3.522892, 1, 1, 1, 1, 1,
0.2163029, 0.4793813, 0.2314407, 1, 1, 1, 1, 1,
0.2185915, 2.247242, 0.9545127, 1, 1, 1, 1, 1,
0.2192145, 0.6988893, 0.8123636, 1, 1, 1, 1, 1,
0.2261403, 2.685624, 0.5115755, 1, 1, 1, 1, 1,
0.2274042, 1.580724, -0.8389111, 1, 1, 1, 1, 1,
0.2308445, -0.5907277, 1.627466, 1, 1, 1, 1, 1,
0.2309977, -0.9197637, 3.138406, 1, 1, 1, 1, 1,
0.2311645, -0.215002, -0.5217891, 1, 1, 1, 1, 1,
0.2317083, 1.618241, -0.7638254, 1, 1, 1, 1, 1,
0.231709, 0.5494165, -2.46894, 0, 0, 1, 1, 1,
0.2336938, -0.2522064, 2.741048, 1, 0, 0, 1, 1,
0.2337689, 0.5933456, 1.483609, 1, 0, 0, 1, 1,
0.2395523, 1.270758, 1.469826, 1, 0, 0, 1, 1,
0.2409138, -1.132095, 2.345169, 1, 0, 0, 1, 1,
0.2410681, 1.8103, 2.220711, 1, 0, 0, 1, 1,
0.2434256, 1.513079, 0.5178374, 0, 0, 0, 1, 1,
0.2503646, -0.1516877, 3.392956, 0, 0, 0, 1, 1,
0.2524596, -0.06482574, 2.131193, 0, 0, 0, 1, 1,
0.2567809, 0.1897516, 0.1891682, 0, 0, 0, 1, 1,
0.2570234, -0.1017707, 1.173925, 0, 0, 0, 1, 1,
0.2596947, -1.271899, 1.169749, 0, 0, 0, 1, 1,
0.2602055, 1.309575, -0.09377513, 0, 0, 0, 1, 1,
0.2602996, -1.751297, 3.175102, 1, 1, 1, 1, 1,
0.2631306, 0.3508715, -0.05971863, 1, 1, 1, 1, 1,
0.2660103, 0.5248829, -0.2826918, 1, 1, 1, 1, 1,
0.269527, -1.213079, 3.409867, 1, 1, 1, 1, 1,
0.2721929, 0.4587416, 1.149235, 1, 1, 1, 1, 1,
0.2743245, -0.2556169, 1.69221, 1, 1, 1, 1, 1,
0.2764026, -0.8027598, 0.6205465, 1, 1, 1, 1, 1,
0.2814435, -2.148314, 3.075347, 1, 1, 1, 1, 1,
0.2815062, -0.4096842, 3.655353, 1, 1, 1, 1, 1,
0.2863611, 0.09049063, 0.6608328, 1, 1, 1, 1, 1,
0.286786, -0.9143758, 1.575685, 1, 1, 1, 1, 1,
0.2962745, -0.9125368, 3.151761, 1, 1, 1, 1, 1,
0.2967521, -0.08152178, 2.151204, 1, 1, 1, 1, 1,
0.2985699, -0.9965373, 4.12875, 1, 1, 1, 1, 1,
0.3002863, 0.03306476, 2.595633, 1, 1, 1, 1, 1,
0.3043871, -0.8801374, 3.535187, 0, 0, 1, 1, 1,
0.3050252, 1.020705, 1.744065, 1, 0, 0, 1, 1,
0.3083002, 0.6470619, 1.904624, 1, 0, 0, 1, 1,
0.3129569, 1.552009, 1.764646, 1, 0, 0, 1, 1,
0.3135956, -0.3492416, 2.362328, 1, 0, 0, 1, 1,
0.3147929, -0.02480787, 0.557807, 1, 0, 0, 1, 1,
0.318102, 0.5880097, 1.26515, 0, 0, 0, 1, 1,
0.3282481, 2.328841, 0.1476805, 0, 0, 0, 1, 1,
0.3323545, 0.2181602, 3.442484, 0, 0, 0, 1, 1,
0.3333921, -0.4032511, 1.778607, 0, 0, 0, 1, 1,
0.3352195, 1.537786, -0.7056974, 0, 0, 0, 1, 1,
0.3370591, 0.4844204, -0.6121212, 0, 0, 0, 1, 1,
0.3383956, -1.098728, 3.36898, 0, 0, 0, 1, 1,
0.3385684, 0.9213958, 0.1388804, 1, 1, 1, 1, 1,
0.3428928, -1.373671, 2.562226, 1, 1, 1, 1, 1,
0.3444842, 0.7711232, 0.6354468, 1, 1, 1, 1, 1,
0.3458761, 1.120858, 0.01099309, 1, 1, 1, 1, 1,
0.3472238, -0.3096673, 0.8972233, 1, 1, 1, 1, 1,
0.3472725, 0.1736741, 1.514001, 1, 1, 1, 1, 1,
0.3526991, -0.03935664, 0.8244517, 1, 1, 1, 1, 1,
0.3532854, 0.5633631, -0.6513228, 1, 1, 1, 1, 1,
0.3545507, -0.1783943, 0.1438611, 1, 1, 1, 1, 1,
0.3591552, -0.8129945, 3.980159, 1, 1, 1, 1, 1,
0.3600856, -0.03163588, 2.549302, 1, 1, 1, 1, 1,
0.3632534, 0.5402378, 0.05439087, 1, 1, 1, 1, 1,
0.3649865, -0.6688944, 2.505297, 1, 1, 1, 1, 1,
0.3667455, -2.259392, 2.227367, 1, 1, 1, 1, 1,
0.3710105, 0.1355725, 0.3781187, 1, 1, 1, 1, 1,
0.3710963, 0.05681724, 1.657521, 0, 0, 1, 1, 1,
0.3719686, -0.4323732, 2.068244, 1, 0, 0, 1, 1,
0.3781098, -0.07541141, 1.084341, 1, 0, 0, 1, 1,
0.3785477, 0.3567831, 0.4595419, 1, 0, 0, 1, 1,
0.3793286, 0.1475511, 2.315224, 1, 0, 0, 1, 1,
0.3813809, -1.510242, 2.607753, 1, 0, 0, 1, 1,
0.3821493, -0.441466, 1.959986, 0, 0, 0, 1, 1,
0.3835529, -1.078841, 1.564932, 0, 0, 0, 1, 1,
0.3844842, 0.4535596, 2.816593, 0, 0, 0, 1, 1,
0.3848693, 1.103439, 0.5230002, 0, 0, 0, 1, 1,
0.3859935, -1.406061, 2.258794, 0, 0, 0, 1, 1,
0.3869808, 1.631455, -0.02252888, 0, 0, 0, 1, 1,
0.3927346, -0.4128973, 1.620375, 0, 0, 0, 1, 1,
0.3947895, 1.395999, 0.7641941, 1, 1, 1, 1, 1,
0.3970045, -0.5648084, 3.501508, 1, 1, 1, 1, 1,
0.398101, -0.5759811, 3.053533, 1, 1, 1, 1, 1,
0.4084232, -1.112785, 1.129995, 1, 1, 1, 1, 1,
0.4097963, 0.8340702, -0.3782956, 1, 1, 1, 1, 1,
0.4125212, 0.002760462, 2.508341, 1, 1, 1, 1, 1,
0.4142218, 1.32014, 1.354812, 1, 1, 1, 1, 1,
0.4158657, -1.531951, 3.905766, 1, 1, 1, 1, 1,
0.4164246, -0.08274153, 3.673168, 1, 1, 1, 1, 1,
0.4203455, -0.8900514, 1.208887, 1, 1, 1, 1, 1,
0.4290891, 0.2174609, 2.088239, 1, 1, 1, 1, 1,
0.432061, -0.8618956, 4.320664, 1, 1, 1, 1, 1,
0.4336729, 1.697247, -0.4540987, 1, 1, 1, 1, 1,
0.4352425, 0.9233415, 0.3296146, 1, 1, 1, 1, 1,
0.4361596, -1.953015, 2.229963, 1, 1, 1, 1, 1,
0.436386, 0.5374234, 0.2611815, 0, 0, 1, 1, 1,
0.4367659, 0.05022688, 1.318629, 1, 0, 0, 1, 1,
0.440028, 1.113899, -0.6307333, 1, 0, 0, 1, 1,
0.4477389, 1.054432, 0.9785759, 1, 0, 0, 1, 1,
0.4504376, 0.2313664, 0.8266171, 1, 0, 0, 1, 1,
0.4522445, -0.7904174, 1.743657, 1, 0, 0, 1, 1,
0.45498, -0.3283809, 1.669761, 0, 0, 0, 1, 1,
0.455828, 0.4288056, -0.184469, 0, 0, 0, 1, 1,
0.4646175, 1.845888, -0.028746, 0, 0, 0, 1, 1,
0.4647779, 0.4952988, 0.03466497, 0, 0, 0, 1, 1,
0.4751731, -0.9689491, 2.545244, 0, 0, 0, 1, 1,
0.4751787, 0.7809332, 1.792066, 0, 0, 0, 1, 1,
0.4766847, 0.01565202, 2.469764, 0, 0, 0, 1, 1,
0.4811934, 0.2330772, 1.842849, 1, 1, 1, 1, 1,
0.4812613, 0.3606631, 2.272548, 1, 1, 1, 1, 1,
0.4840553, 0.9612858, 1.448506, 1, 1, 1, 1, 1,
0.4873936, 0.5431755, -0.0422065, 1, 1, 1, 1, 1,
0.4895645, 1.181057, -0.04703342, 1, 1, 1, 1, 1,
0.4935723, -1.307801, 2.895073, 1, 1, 1, 1, 1,
0.4972934, -1.900165, 3.260864, 1, 1, 1, 1, 1,
0.4972967, 2.239101, 0.6479304, 1, 1, 1, 1, 1,
0.5007839, 0.7900697, -0.5154282, 1, 1, 1, 1, 1,
0.5043005, -0.467885, 2.994278, 1, 1, 1, 1, 1,
0.5067024, 0.3352149, -0.4668866, 1, 1, 1, 1, 1,
0.5089698, 0.4214896, 2.154403, 1, 1, 1, 1, 1,
0.5113881, 0.2403164, -0.2412253, 1, 1, 1, 1, 1,
0.5121018, -0.5756465, -0.14992, 1, 1, 1, 1, 1,
0.5138498, 1.253307, 1.716159, 1, 1, 1, 1, 1,
0.5139492, -1.257136, 2.218614, 0, 0, 1, 1, 1,
0.5175449, -0.220651, 1.286912, 1, 0, 0, 1, 1,
0.5179824, 0.4611931, -0.1382886, 1, 0, 0, 1, 1,
0.5184243, 0.4169419, 0.7262377, 1, 0, 0, 1, 1,
0.5201085, 2.127104, 1.293571, 1, 0, 0, 1, 1,
0.5221998, 0.1845996, 1.42007, 1, 0, 0, 1, 1,
0.5224019, -0.3879954, 1.93763, 0, 0, 0, 1, 1,
0.5283753, 0.0850131, 0.2902992, 0, 0, 0, 1, 1,
0.5356071, -0.9854605, 1.348164, 0, 0, 0, 1, 1,
0.5360099, -1.373072, 2.601501, 0, 0, 0, 1, 1,
0.5371319, -0.2881752, 0.06875268, 0, 0, 0, 1, 1,
0.5372313, 0.2444262, 3.004243, 0, 0, 0, 1, 1,
0.537301, -2.004205, 2.246525, 0, 0, 0, 1, 1,
0.5375243, -0.3091502, 1.458194, 1, 1, 1, 1, 1,
0.557659, 0.2156385, 0.0005802168, 1, 1, 1, 1, 1,
0.5581854, -0.9520298, 0.6284161, 1, 1, 1, 1, 1,
0.5701439, 0.9736812, 0.7150123, 1, 1, 1, 1, 1,
0.5806786, 0.2299672, 0.5458398, 1, 1, 1, 1, 1,
0.5827707, 1.292417, 2.040518, 1, 1, 1, 1, 1,
0.5876108, 0.6953529, 0.9645934, 1, 1, 1, 1, 1,
0.5931476, -1.378571, 4.368011, 1, 1, 1, 1, 1,
0.5996123, 0.447659, 2.999077, 1, 1, 1, 1, 1,
0.5999811, -1.069446, 5.158507, 1, 1, 1, 1, 1,
0.6038594, 0.5890576, 1.217982, 1, 1, 1, 1, 1,
0.6045572, 0.1378034, 1.398843, 1, 1, 1, 1, 1,
0.6133619, -1.049478, 2.584642, 1, 1, 1, 1, 1,
0.6174276, -0.9848703, 1.741676, 1, 1, 1, 1, 1,
0.6204253, 0.02068303, 1.691418, 1, 1, 1, 1, 1,
0.6252694, 0.1193611, 1.807209, 0, 0, 1, 1, 1,
0.6288575, -2.105668, 2.865749, 1, 0, 0, 1, 1,
0.6316379, -0.8940341, 1.459481, 1, 0, 0, 1, 1,
0.6320696, -0.3059759, 2.535929, 1, 0, 0, 1, 1,
0.6345127, -1.486761, 3.499677, 1, 0, 0, 1, 1,
0.6376747, 0.1280825, 1.20284, 1, 0, 0, 1, 1,
0.6381338, 0.3102682, 1.723228, 0, 0, 0, 1, 1,
0.6449592, -0.6335597, 3.294869, 0, 0, 0, 1, 1,
0.6480688, -0.3503527, 1.889945, 0, 0, 0, 1, 1,
0.6594898, 2.082883, 0.2314224, 0, 0, 0, 1, 1,
0.6624456, 0.0620099, 0.7271436, 0, 0, 0, 1, 1,
0.6644861, -2.045644, 1.474105, 0, 0, 0, 1, 1,
0.6673658, -0.3124075, 1.375797, 0, 0, 0, 1, 1,
0.671654, -0.8055853, 2.789288, 1, 1, 1, 1, 1,
0.6747616, -0.5805368, 1.003637, 1, 1, 1, 1, 1,
0.6749465, -0.4424174, 2.652394, 1, 1, 1, 1, 1,
0.6912102, 0.3502191, 0.8692535, 1, 1, 1, 1, 1,
0.6953021, -0.5109496, 1.703212, 1, 1, 1, 1, 1,
0.7005298, -0.8207693, 3.291909, 1, 1, 1, 1, 1,
0.7020569, 1.453213, -0.8756297, 1, 1, 1, 1, 1,
0.705503, -0.804783, 2.844532, 1, 1, 1, 1, 1,
0.7059666, -0.5169642, 1.865052, 1, 1, 1, 1, 1,
0.7152197, -0.9667225, 2.611683, 1, 1, 1, 1, 1,
0.7195821, -0.7035423, 2.652048, 1, 1, 1, 1, 1,
0.7243971, 0.06825161, 2.317775, 1, 1, 1, 1, 1,
0.7244766, -0.2410577, 1.372019, 1, 1, 1, 1, 1,
0.7255463, 0.7321204, 1.919269, 1, 1, 1, 1, 1,
0.7281193, 1.209428, 1.092115, 1, 1, 1, 1, 1,
0.7311822, -0.179435, 0.9706779, 0, 0, 1, 1, 1,
0.7366198, 0.2257946, 2.911583, 1, 0, 0, 1, 1,
0.7383328, 1.487629, 0.2823619, 1, 0, 0, 1, 1,
0.7396832, -0.3011453, 3.767845, 1, 0, 0, 1, 1,
0.7418739, 0.802946, 2.035218, 1, 0, 0, 1, 1,
0.7457621, -1.672875, 3.797588, 1, 0, 0, 1, 1,
0.7489668, -0.7275611, 2.607263, 0, 0, 0, 1, 1,
0.7564094, 0.05282738, 1.834096, 0, 0, 0, 1, 1,
0.7608672, 0.3124579, 1.677455, 0, 0, 0, 1, 1,
0.7701306, -2.722412, 3.239715, 0, 0, 0, 1, 1,
0.7786785, 0.2226082, 1.370002, 0, 0, 0, 1, 1,
0.7845557, -0.4026333, -0.005354326, 0, 0, 0, 1, 1,
0.7855639, 1.054328, 0.9661881, 0, 0, 0, 1, 1,
0.7861067, -0.5453873, 3.502515, 1, 1, 1, 1, 1,
0.7880749, 0.02375546, 0.03808066, 1, 1, 1, 1, 1,
0.7949904, -1.54887, 0.9384283, 1, 1, 1, 1, 1,
0.7976292, 0.7719133, 0.1807397, 1, 1, 1, 1, 1,
0.8037993, 0.5863882, 1.177895, 1, 1, 1, 1, 1,
0.8058984, 0.5598789, 0.4472927, 1, 1, 1, 1, 1,
0.8078516, -0.1631472, 2.569455, 1, 1, 1, 1, 1,
0.8149595, 0.003970674, 1.461425, 1, 1, 1, 1, 1,
0.8184618, 0.07615892, 0.6208282, 1, 1, 1, 1, 1,
0.8204454, -0.2540955, -0.0142718, 1, 1, 1, 1, 1,
0.8264064, 0.2339435, 0.7153445, 1, 1, 1, 1, 1,
0.8349712, 1.963328, 0.7000786, 1, 1, 1, 1, 1,
0.8409485, -1.028703, 2.299169, 1, 1, 1, 1, 1,
0.8426306, 0.6394347, 0.2710425, 1, 1, 1, 1, 1,
0.8473121, -0.1276127, -0.5016909, 1, 1, 1, 1, 1,
0.8530418, -0.907465, 2.940593, 0, 0, 1, 1, 1,
0.8543652, 0.5108218, 1.354316, 1, 0, 0, 1, 1,
0.8572838, 0.9324608, 0.09917279, 1, 0, 0, 1, 1,
0.858919, -0.4870356, 2.849873, 1, 0, 0, 1, 1,
0.872573, 0.7888651, 0.6572554, 1, 0, 0, 1, 1,
0.877233, -0.648613, 3.926916, 1, 0, 0, 1, 1,
0.8780973, -1.146679, -0.6631507, 0, 0, 0, 1, 1,
0.8838, 0.5608367, 1.216511, 0, 0, 0, 1, 1,
0.8890882, -0.2542208, 2.264855, 0, 0, 0, 1, 1,
0.8894474, 2.047029, -0.09629279, 0, 0, 0, 1, 1,
0.8912489, 1.033024, 0.9325027, 0, 0, 0, 1, 1,
0.8913192, 0.4782813, 1.841011, 0, 0, 0, 1, 1,
0.8913698, -0.9351816, 1.196922, 0, 0, 0, 1, 1,
0.8940548, -0.5805329, 2.901008, 1, 1, 1, 1, 1,
0.8959771, 1.342892, 0.01692753, 1, 1, 1, 1, 1,
0.8976716, 1.794367, 1.263124, 1, 1, 1, 1, 1,
0.8987958, -0.05480726, 1.229592, 1, 1, 1, 1, 1,
0.899388, -0.599602, 1.133151, 1, 1, 1, 1, 1,
0.9005631, -0.2296693, 2.228415, 1, 1, 1, 1, 1,
0.9043688, 0.8444455, -0.3008019, 1, 1, 1, 1, 1,
0.9049724, -0.3018251, 1.831613, 1, 1, 1, 1, 1,
0.911043, 0.1348259, 1.287994, 1, 1, 1, 1, 1,
0.9116204, -0.5079089, 2.62555, 1, 1, 1, 1, 1,
0.9153671, -0.07626732, 1.715859, 1, 1, 1, 1, 1,
0.9218343, -1.33162, 3.313372, 1, 1, 1, 1, 1,
0.922806, -0.9518533, 1.722308, 1, 1, 1, 1, 1,
0.9244777, -1.633744, 2.458015, 1, 1, 1, 1, 1,
0.9438269, 0.3467537, 0.740154, 1, 1, 1, 1, 1,
0.9443191, -1.460134, 1.627648, 0, 0, 1, 1, 1,
0.9471558, -1.471987, 2.433346, 1, 0, 0, 1, 1,
0.9492419, 0.0354959, 2.251246, 1, 0, 0, 1, 1,
0.949937, 0.414117, 0.5851315, 1, 0, 0, 1, 1,
0.9529634, 1.862868, 1.573089, 1, 0, 0, 1, 1,
0.9542158, 0.7892374, 3.085402, 1, 0, 0, 1, 1,
0.9655672, 1.692304, -0.2845531, 0, 0, 0, 1, 1,
0.9666106, -0.1206272, 2.618647, 0, 0, 0, 1, 1,
0.9688446, 0.3658853, 2.054127, 0, 0, 0, 1, 1,
0.9688492, 0.296893, 1.048773, 0, 0, 0, 1, 1,
0.9688677, -0.5695331, 3.128209, 0, 0, 0, 1, 1,
0.9731243, 0.608871, 1.982552, 0, 0, 0, 1, 1,
0.9758992, 0.2337045, 1.393457, 0, 0, 0, 1, 1,
0.9795554, -1.656177, 3.108569, 1, 1, 1, 1, 1,
0.9818925, -0.0463119, 1.138711, 1, 1, 1, 1, 1,
0.9929824, -0.01330038, 1.564282, 1, 1, 1, 1, 1,
0.9968097, 0.09370376, 2.530411, 1, 1, 1, 1, 1,
0.9991735, 1.663725, 0.7410569, 1, 1, 1, 1, 1,
1.00089, -1.609787, 1.489671, 1, 1, 1, 1, 1,
1.001367, 1.669727, 0.5133577, 1, 1, 1, 1, 1,
1.002594, -0.502143, 0.6959044, 1, 1, 1, 1, 1,
1.005429, 0.5655702, 0.4811575, 1, 1, 1, 1, 1,
1.005727, -0.7656768, 1.344331, 1, 1, 1, 1, 1,
1.013396, -0.8760815, 3.305216, 1, 1, 1, 1, 1,
1.015436, -0.3484512, 1.946825, 1, 1, 1, 1, 1,
1.017704, 1.218638, 1.062232, 1, 1, 1, 1, 1,
1.018729, 1.26485, -0.2216685, 1, 1, 1, 1, 1,
1.031881, 1.046827, 0.7016139, 1, 1, 1, 1, 1,
1.033898, 0.6448128, 1.468685, 0, 0, 1, 1, 1,
1.036465, 1.054223, 0.7178874, 1, 0, 0, 1, 1,
1.042923, 0.07377671, 0.2488206, 1, 0, 0, 1, 1,
1.04379, 1.958893, -0.7200162, 1, 0, 0, 1, 1,
1.045767, -0.4694299, 1.340855, 1, 0, 0, 1, 1,
1.049056, -0.5988742, 2.054048, 1, 0, 0, 1, 1,
1.052579, 0.513439, 1.045551, 0, 0, 0, 1, 1,
1.055624, -0.4870512, 2.662633, 0, 0, 0, 1, 1,
1.065567, 0.0749933, 2.816328, 0, 0, 0, 1, 1,
1.067111, 1.14342, 0.659101, 0, 0, 0, 1, 1,
1.073164, -0.2808275, 0.1668283, 0, 0, 0, 1, 1,
1.074322, 0.6990477, 2.163228, 0, 0, 0, 1, 1,
1.074398, -0.3690493, 1.948472, 0, 0, 0, 1, 1,
1.084579, -1.233292, 2.403789, 1, 1, 1, 1, 1,
1.084813, -0.278743, 1.523602, 1, 1, 1, 1, 1,
1.087294, -1.841696, 3.541278, 1, 1, 1, 1, 1,
1.09688, 0.4125141, 1.550897, 1, 1, 1, 1, 1,
1.104623, -0.03836751, 1.630321, 1, 1, 1, 1, 1,
1.104838, 2.451208, 2.147214, 1, 1, 1, 1, 1,
1.105174, -1.062166, 1.522544, 1, 1, 1, 1, 1,
1.109186, 0.265624, 1.661957, 1, 1, 1, 1, 1,
1.110888, 0.03600323, 1.199073, 1, 1, 1, 1, 1,
1.112808, -1.291502, 3.401697, 1, 1, 1, 1, 1,
1.116017, 0.5893824, 0.5629734, 1, 1, 1, 1, 1,
1.123466, 0.1784607, 1.396138, 1, 1, 1, 1, 1,
1.123943, 1.455634, -0.5482078, 1, 1, 1, 1, 1,
1.125344, -0.4234669, 0.6282328, 1, 1, 1, 1, 1,
1.138799, 1.720934, -0.06934588, 1, 1, 1, 1, 1,
1.140536, 1.16163, 2.624913, 0, 0, 1, 1, 1,
1.14202, 1.86302, 0.5631294, 1, 0, 0, 1, 1,
1.146789, -0.8298137, 2.345045, 1, 0, 0, 1, 1,
1.148413, 0.2359621, 1.884927, 1, 0, 0, 1, 1,
1.149198, -1.000104, 3.063682, 1, 0, 0, 1, 1,
1.15083, 1.212887, -0.8923237, 1, 0, 0, 1, 1,
1.151034, 0.6237055, 0.587752, 0, 0, 0, 1, 1,
1.151862, 0.3035759, 0.0371891, 0, 0, 0, 1, 1,
1.155874, 0.6260862, -0.3715709, 0, 0, 0, 1, 1,
1.156799, -1.254767, 1.207126, 0, 0, 0, 1, 1,
1.158079, 1.767896, 1.085398, 0, 0, 0, 1, 1,
1.158853, 0.7642782, -1.478044, 0, 0, 0, 1, 1,
1.169349, -0.7897124, 0.4659596, 0, 0, 0, 1, 1,
1.169849, 0.3416385, 0.08506204, 1, 1, 1, 1, 1,
1.170735, 1.056315, 1.391096, 1, 1, 1, 1, 1,
1.173626, 0.8347175, 0.3101327, 1, 1, 1, 1, 1,
1.173666, 0.2178434, 0.2459248, 1, 1, 1, 1, 1,
1.174269, 0.5117614, 0.819572, 1, 1, 1, 1, 1,
1.178101, -1.079522, 1.640457, 1, 1, 1, 1, 1,
1.180286, -0.5986072, 0.9798157, 1, 1, 1, 1, 1,
1.181493, 0.4818727, 0.07171378, 1, 1, 1, 1, 1,
1.18245, -0.4872465, 3.142405, 1, 1, 1, 1, 1,
1.18475, -0.09379821, 0.2093339, 1, 1, 1, 1, 1,
1.189275, 0.8777895, 0.5495338, 1, 1, 1, 1, 1,
1.197855, -1.340708, 2.440089, 1, 1, 1, 1, 1,
1.218452, -0.3500084, 0.7619854, 1, 1, 1, 1, 1,
1.224382, -0.8594977, 2.418636, 1, 1, 1, 1, 1,
1.22715, 0.3035112, 1.872892, 1, 1, 1, 1, 1,
1.230823, 0.9000505, 0.8064792, 0, 0, 1, 1, 1,
1.236469, -1.477496, 4.334891, 1, 0, 0, 1, 1,
1.240329, -0.3392668, 1.731683, 1, 0, 0, 1, 1,
1.24147, 0.1276499, 0.05597712, 1, 0, 0, 1, 1,
1.251067, 0.3876445, 0.9660015, 1, 0, 0, 1, 1,
1.260293, 0.4158373, 2.636376, 1, 0, 0, 1, 1,
1.266913, 0.3866673, 0.938093, 0, 0, 0, 1, 1,
1.274402, -0.5343974, 3.668401, 0, 0, 0, 1, 1,
1.276192, 0.4297805, -1.465886, 0, 0, 0, 1, 1,
1.285323, -2.231594, 3.081463, 0, 0, 0, 1, 1,
1.295546, 1.305697, 2.429968, 0, 0, 0, 1, 1,
1.312005, -0.5467656, 2.732421, 0, 0, 0, 1, 1,
1.314966, -1.610484, 2.777199, 0, 0, 0, 1, 1,
1.317067, -1.729136, 2.931001, 1, 1, 1, 1, 1,
1.318602, -0.8466529, 1.932844, 1, 1, 1, 1, 1,
1.322666, -0.1116436, 2.324144, 1, 1, 1, 1, 1,
1.329676, -0.860009, 0.8466024, 1, 1, 1, 1, 1,
1.332967, -0.7488583, 2.876418, 1, 1, 1, 1, 1,
1.344341, -1.065361, -0.3164875, 1, 1, 1, 1, 1,
1.353073, 0.3424041, 1.075094, 1, 1, 1, 1, 1,
1.354273, 0.6266024, 1.474299, 1, 1, 1, 1, 1,
1.35593, -0.2473145, 0.550759, 1, 1, 1, 1, 1,
1.362457, -1.112604, 3.25154, 1, 1, 1, 1, 1,
1.364996, -1.003516, 2.603191, 1, 1, 1, 1, 1,
1.368368, -0.239814, 0.6952909, 1, 1, 1, 1, 1,
1.373756, 1.749137, -1.120927, 1, 1, 1, 1, 1,
1.375217, -0.06666491, 0.1712815, 1, 1, 1, 1, 1,
1.378294, 0.1258762, 2.23362, 1, 1, 1, 1, 1,
1.384254, -1.596236, 1.490948, 0, 0, 1, 1, 1,
1.38939, -0.5900633, 2.491761, 1, 0, 0, 1, 1,
1.390967, -1.892427, 1.922639, 1, 0, 0, 1, 1,
1.403666, -2.396529, 3.661259, 1, 0, 0, 1, 1,
1.404949, -0.8050319, 1.810272, 1, 0, 0, 1, 1,
1.405672, 0.9661002, 0.6101094, 1, 0, 0, 1, 1,
1.4183, 1.459856, -0.1953984, 0, 0, 0, 1, 1,
1.422913, -0.6929837, -0.07239429, 0, 0, 0, 1, 1,
1.445444, -0.3528689, 3.110572, 0, 0, 0, 1, 1,
1.449742, -0.6044215, 0.9143032, 0, 0, 0, 1, 1,
1.458792, 0.9708849, 0.8160191, 0, 0, 0, 1, 1,
1.467751, -1.011261, 1.679922, 0, 0, 0, 1, 1,
1.468744, 0.2995749, 1.384609, 0, 0, 0, 1, 1,
1.473581, 0.3988397, 1.444637, 1, 1, 1, 1, 1,
1.479395, -0.5716379, 3.657668, 1, 1, 1, 1, 1,
1.482561, 0.9505961, -0.6011878, 1, 1, 1, 1, 1,
1.486471, -0.2139348, 0.4937762, 1, 1, 1, 1, 1,
1.500556, 0.2438424, 1.757468, 1, 1, 1, 1, 1,
1.517769, -0.2163069, 2.739035, 1, 1, 1, 1, 1,
1.518796, 1.222621, 0.4464466, 1, 1, 1, 1, 1,
1.519926, 0.6922871, 1.424626, 1, 1, 1, 1, 1,
1.533446, 1.502733, 1.929968, 1, 1, 1, 1, 1,
1.540528, -0.3065686, 1.543549, 1, 1, 1, 1, 1,
1.548264, -1.327451, 3.085764, 1, 1, 1, 1, 1,
1.555037, -0.6951829, 2.608652, 1, 1, 1, 1, 1,
1.563085, -1.953136, 1.640343, 1, 1, 1, 1, 1,
1.567642, 0.4483841, 0.9926654, 1, 1, 1, 1, 1,
1.600888, 2.464834, 0.131375, 1, 1, 1, 1, 1,
1.610504, -3.154237, 6.065399, 0, 0, 1, 1, 1,
1.610803, -0.33595, -0.1706454, 1, 0, 0, 1, 1,
1.672639, 0.4557083, 0.921636, 1, 0, 0, 1, 1,
1.675397, -1.667227, 2.548549, 1, 0, 0, 1, 1,
1.682236, -0.6946369, 1.813563, 1, 0, 0, 1, 1,
1.685045, -1.21549, 1.961666, 1, 0, 0, 1, 1,
1.692997, 0.5457816, 1.889248, 0, 0, 0, 1, 1,
1.709882, -0.878116, 0.7654223, 0, 0, 0, 1, 1,
1.720998, -1.186055, 1.259447, 0, 0, 0, 1, 1,
1.722998, -0.7166632, 1.2598, 0, 0, 0, 1, 1,
1.733559, -0.5794123, 1.671801, 0, 0, 0, 1, 1,
1.773041, -0.6740804, 1.773082, 0, 0, 0, 1, 1,
1.810897, -0.8932069, 2.046156, 0, 0, 0, 1, 1,
1.822161, 0.6085905, -0.1803803, 1, 1, 1, 1, 1,
1.826839, -0.2463614, 2.456282, 1, 1, 1, 1, 1,
1.828647, 1.682374, 0.2184851, 1, 1, 1, 1, 1,
1.852502, -0.257528, 2.632958, 1, 1, 1, 1, 1,
1.866192, 1.541082, 0.9421387, 1, 1, 1, 1, 1,
1.870662, -1.266402, 3.348311, 1, 1, 1, 1, 1,
1.87602, -1.437741, 1.544954, 1, 1, 1, 1, 1,
1.905803, -0.89952, 1.537434, 1, 1, 1, 1, 1,
1.91317, 0.5925163, 2.524629, 1, 1, 1, 1, 1,
1.914776, -0.4504292, 1.52423, 1, 1, 1, 1, 1,
1.919544, -0.1586227, 2.328235, 1, 1, 1, 1, 1,
1.950588, 0.5701243, 2.672237, 1, 1, 1, 1, 1,
1.983258, -0.1383518, 0.6036497, 1, 1, 1, 1, 1,
1.995249, -0.6264585, 2.028633, 1, 1, 1, 1, 1,
1.997959, 0.04206547, 2.423733, 1, 1, 1, 1, 1,
2.017777, 2.315813, 2.461715, 0, 0, 1, 1, 1,
2.04774, -0.3102264, -0.1540502, 1, 0, 0, 1, 1,
2.108243, -1.446712, 3.309933, 1, 0, 0, 1, 1,
2.123216, 0.10884, 2.029053, 1, 0, 0, 1, 1,
2.141603, -1.382724, 0.7526593, 1, 0, 0, 1, 1,
2.143197, -2.012405, 3.090579, 1, 0, 0, 1, 1,
2.169773, -0.1448733, 1.303094, 0, 0, 0, 1, 1,
2.199548, 0.9852877, -0.02292334, 0, 0, 0, 1, 1,
2.231422, -1.552931, 1.939737, 0, 0, 0, 1, 1,
2.250232, 0.4475414, 2.876875, 0, 0, 0, 1, 1,
2.270032, -1.476745, 3.043616, 0, 0, 0, 1, 1,
2.302537, -1.220597, 1.922881, 0, 0, 0, 1, 1,
2.34486, -0.7524102, 2.193297, 0, 0, 0, 1, 1,
2.379227, 0.5428736, 2.161468, 1, 1, 1, 1, 1,
2.567385, -1.386855, 2.765804, 1, 1, 1, 1, 1,
2.732724, -0.5667968, 1.336654, 1, 1, 1, 1, 1,
2.76827, 0.5653442, 3.162162, 1, 1, 1, 1, 1,
3.042134, 1.163055, 1.779706, 1, 1, 1, 1, 1,
3.058793, -1.205095, 2.461776, 1, 1, 1, 1, 1,
3.093262, -1.042825, 2.570065, 1, 1, 1, 1, 1
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
var radius = 10.12247;
var distance = 35.55474;
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
mvMatrix.translate( -0.1332722, -0.08325315, -0.1697426 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.55474);
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
