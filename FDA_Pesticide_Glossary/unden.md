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
-3.469603, -1.963777, -3.391281, 1, 0, 0, 1,
-3.113056, 0.6095364, -2.233054, 1, 0.007843138, 0, 1,
-2.770137, -0.5179319, -3.144299, 1, 0.01176471, 0, 1,
-2.363405, 0.23152, -2.63609, 1, 0.01960784, 0, 1,
-2.362581, -0.04951443, -0.1302801, 1, 0.02352941, 0, 1,
-2.324683, -0.4929414, -2.925813, 1, 0.03137255, 0, 1,
-2.312666, 0.453327, -3.451479, 1, 0.03529412, 0, 1,
-2.285441, -1.131107, -2.813122, 1, 0.04313726, 0, 1,
-2.244786, 1.978678, -1.429362, 1, 0.04705882, 0, 1,
-2.237679, 0.09374961, -2.443821, 1, 0.05490196, 0, 1,
-2.229516, 0.373073, -2.440708, 1, 0.05882353, 0, 1,
-2.214942, 0.9373138, -3.009427, 1, 0.06666667, 0, 1,
-2.20976, -0.1101775, -1.595008, 1, 0.07058824, 0, 1,
-2.155428, 0.8111833, -0.5656646, 1, 0.07843138, 0, 1,
-2.143481, 0.2729453, -0.5456417, 1, 0.08235294, 0, 1,
-2.070698, -1.122748, -3.016595, 1, 0.09019608, 0, 1,
-2.048257, -1.990492, -3.788803, 1, 0.09411765, 0, 1,
-1.977379, 1.298572, -1.3839, 1, 0.1019608, 0, 1,
-1.953744, 0.2410996, -2.70683, 1, 0.1098039, 0, 1,
-1.930799, -1.302491, -2.416076, 1, 0.1137255, 0, 1,
-1.858672, 0.04476627, -0.2792254, 1, 0.1215686, 0, 1,
-1.85311, -1.097227, -2.637948, 1, 0.1254902, 0, 1,
-1.820264, 1.715896, -1.084444, 1, 0.1333333, 0, 1,
-1.805762, -0.1240996, -2.388383, 1, 0.1372549, 0, 1,
-1.801293, -0.1732198, -3.591624, 1, 0.145098, 0, 1,
-1.770753, -0.2059076, 0.2455104, 1, 0.1490196, 0, 1,
-1.765176, -0.1743487, -0.6633688, 1, 0.1568628, 0, 1,
-1.741451, 0.5877597, -0.4342042, 1, 0.1607843, 0, 1,
-1.733538, -0.6750571, 0.1032609, 1, 0.1686275, 0, 1,
-1.733108, 2.125265, -1.895068, 1, 0.172549, 0, 1,
-1.729446, -0.9992798, -1.548661, 1, 0.1803922, 0, 1,
-1.700481, 2.118177, -1.712789, 1, 0.1843137, 0, 1,
-1.687846, 0.3104641, -1.594715, 1, 0.1921569, 0, 1,
-1.685934, 0.7103742, 0.6262316, 1, 0.1960784, 0, 1,
-1.683069, 0.2925847, -1.539427, 1, 0.2039216, 0, 1,
-1.67513, -0.499334, -3.528968, 1, 0.2117647, 0, 1,
-1.668417, 0.7810679, -0.2847234, 1, 0.2156863, 0, 1,
-1.661219, -1.543501, -1.470592, 1, 0.2235294, 0, 1,
-1.659806, 0.5453331, -0.3176894, 1, 0.227451, 0, 1,
-1.651051, 0.620314, -1.163782, 1, 0.2352941, 0, 1,
-1.650327, 0.979216, -0.7432038, 1, 0.2392157, 0, 1,
-1.641226, 0.9600996, -0.2828267, 1, 0.2470588, 0, 1,
-1.637681, -0.6837961, -3.785402, 1, 0.2509804, 0, 1,
-1.633185, -1.387266, -2.944028, 1, 0.2588235, 0, 1,
-1.616508, 0.7818397, -2.155926, 1, 0.2627451, 0, 1,
-1.611815, 0.8773072, -0.2492885, 1, 0.2705882, 0, 1,
-1.598067, -0.4889207, -3.338123, 1, 0.2745098, 0, 1,
-1.596656, 0.9499852, -1.10089, 1, 0.282353, 0, 1,
-1.593716, -0.7117313, -1.283472, 1, 0.2862745, 0, 1,
-1.581668, -0.8100361, -0.7698457, 1, 0.2941177, 0, 1,
-1.579206, -1.699431, -1.974664, 1, 0.3019608, 0, 1,
-1.577275, -1.299949, -1.587024, 1, 0.3058824, 0, 1,
-1.565293, 0.9213087, -2.159264, 1, 0.3137255, 0, 1,
-1.549891, -0.5642354, -2.335826, 1, 0.3176471, 0, 1,
-1.536306, 0.728028, -0.8049068, 1, 0.3254902, 0, 1,
-1.535657, 0.2180033, -0.8065987, 1, 0.3294118, 0, 1,
-1.506964, 1.121598, -0.6899463, 1, 0.3372549, 0, 1,
-1.5036, 0.2221265, -0.6598208, 1, 0.3411765, 0, 1,
-1.502141, 2.320463, -1.583538, 1, 0.3490196, 0, 1,
-1.489632, -0.582741, -1.58505, 1, 0.3529412, 0, 1,
-1.488877, 0.194436, -0.2896187, 1, 0.3607843, 0, 1,
-1.486591, -0.2348511, -1.413484, 1, 0.3647059, 0, 1,
-1.478821, 0.2172943, -3.081544, 1, 0.372549, 0, 1,
-1.476177, -0.9543399, -3.152765, 1, 0.3764706, 0, 1,
-1.466803, 0.1398055, -0.6922686, 1, 0.3843137, 0, 1,
-1.455657, -0.2631631, -2.852586, 1, 0.3882353, 0, 1,
-1.452517, -0.1400625, -0.7246766, 1, 0.3960784, 0, 1,
-1.448289, -1.87358, -2.399915, 1, 0.4039216, 0, 1,
-1.442224, 0.1973151, -1.192693, 1, 0.4078431, 0, 1,
-1.437898, -0.8071968, -2.849404, 1, 0.4156863, 0, 1,
-1.407184, 1.600987, -0.5300743, 1, 0.4196078, 0, 1,
-1.406261, 0.7153988, -0.8334633, 1, 0.427451, 0, 1,
-1.4019, -0.489811, -2.754073, 1, 0.4313726, 0, 1,
-1.391881, -0.5205533, -3.134855, 1, 0.4392157, 0, 1,
-1.38488, 1.600151, 1.134838, 1, 0.4431373, 0, 1,
-1.38285, -1.44753, -0.7094537, 1, 0.4509804, 0, 1,
-1.381091, 0.1531586, -0.7723448, 1, 0.454902, 0, 1,
-1.376486, -0.3583904, -3.883729, 1, 0.4627451, 0, 1,
-1.373862, -0.02836736, -1.479317, 1, 0.4666667, 0, 1,
-1.370548, 0.5180421, -2.484741, 1, 0.4745098, 0, 1,
-1.370228, 1.134639, -0.3570773, 1, 0.4784314, 0, 1,
-1.369943, -0.09756996, -0.4377707, 1, 0.4862745, 0, 1,
-1.367666, 0.682312, 0.5111833, 1, 0.4901961, 0, 1,
-1.362844, -0.05749914, -2.880224, 1, 0.4980392, 0, 1,
-1.352761, 0.8156803, 1.6779, 1, 0.5058824, 0, 1,
-1.350568, -1.109815, -1.869131, 1, 0.509804, 0, 1,
-1.325595, -0.122054, -0.6165626, 1, 0.5176471, 0, 1,
-1.316845, 2.234657, -0.8721406, 1, 0.5215687, 0, 1,
-1.31584, 0.342899, -1.64068, 1, 0.5294118, 0, 1,
-1.311945, 2.114522, 0.6512856, 1, 0.5333334, 0, 1,
-1.303179, -0.7612302, -1.471513, 1, 0.5411765, 0, 1,
-1.30269, 1.463379, -1.315773, 1, 0.5450981, 0, 1,
-1.295902, -1.33873, -1.717497, 1, 0.5529412, 0, 1,
-1.283128, 0.7196542, -1.985479, 1, 0.5568628, 0, 1,
-1.281053, 0.5497089, -2.150835, 1, 0.5647059, 0, 1,
-1.278565, 1.769591, 0.1340955, 1, 0.5686275, 0, 1,
-1.276889, -0.7810594, -2.217842, 1, 0.5764706, 0, 1,
-1.268007, 0.06439514, -0.5144598, 1, 0.5803922, 0, 1,
-1.25447, 0.9587953, 1.040629, 1, 0.5882353, 0, 1,
-1.253308, 0.4155933, 0.9806458, 1, 0.5921569, 0, 1,
-1.246625, 0.9499949, -1.26567, 1, 0.6, 0, 1,
-1.233915, 2.011734, -0.7410153, 1, 0.6078432, 0, 1,
-1.232527, -1.117025, -3.033039, 1, 0.6117647, 0, 1,
-1.230988, 0.4918105, -0.3255394, 1, 0.6196079, 0, 1,
-1.221325, 0.1639254, -1.434287, 1, 0.6235294, 0, 1,
-1.221031, 0.9988692, -1.042922, 1, 0.6313726, 0, 1,
-1.216457, 1.863188, -1.303621, 1, 0.6352941, 0, 1,
-1.192968, -0.5982558, -2.454507, 1, 0.6431373, 0, 1,
-1.191237, -0.7189746, -0.6787043, 1, 0.6470588, 0, 1,
-1.189246, 0.2893324, 0.3160466, 1, 0.654902, 0, 1,
-1.184997, -0.6521703, -2.738878, 1, 0.6588235, 0, 1,
-1.184616, -0.484006, -4.132858, 1, 0.6666667, 0, 1,
-1.180527, -0.7297638, -1.599796, 1, 0.6705883, 0, 1,
-1.17908, -0.6000701, -0.5715576, 1, 0.6784314, 0, 1,
-1.17829, 1.592597, -1.12149, 1, 0.682353, 0, 1,
-1.174916, -0.8389944, -1.475786, 1, 0.6901961, 0, 1,
-1.167498, 1.256026, -1.229768, 1, 0.6941177, 0, 1,
-1.152162, 1.493283, 0.3895046, 1, 0.7019608, 0, 1,
-1.140908, 0.9441752, -2.026527, 1, 0.7098039, 0, 1,
-1.134166, 0.3264062, -0.7028662, 1, 0.7137255, 0, 1,
-1.128937, -1.422983, -2.387026, 1, 0.7215686, 0, 1,
-1.12839, 1.893302, -1.263361, 1, 0.7254902, 0, 1,
-1.121301, -1.71946, -2.969712, 1, 0.7333333, 0, 1,
-1.117693, -0.3060223, -2.014274, 1, 0.7372549, 0, 1,
-1.107251, -0.4076767, -1.364458, 1, 0.7450981, 0, 1,
-1.100143, -0.5466467, -1.403875, 1, 0.7490196, 0, 1,
-1.095184, 1.636354, -1.03772, 1, 0.7568628, 0, 1,
-1.093288, 0.5434698, -0.01870283, 1, 0.7607843, 0, 1,
-1.090383, -1.098888, -1.676718, 1, 0.7686275, 0, 1,
-1.089265, -0.7654579, -2.168718, 1, 0.772549, 0, 1,
-1.087873, 1.156631, 0.5655303, 1, 0.7803922, 0, 1,
-1.079057, 0.2812728, -2.029164, 1, 0.7843137, 0, 1,
-1.070329, -0.3949032, -3.264216, 1, 0.7921569, 0, 1,
-1.068352, -0.2659676, -0.6227443, 1, 0.7960784, 0, 1,
-1.060346, -0.02349391, -1.585598, 1, 0.8039216, 0, 1,
-1.058138, 0.3340432, -0.8371799, 1, 0.8117647, 0, 1,
-1.054353, 0.0851393, -3.49307, 1, 0.8156863, 0, 1,
-1.049712, 0.09993461, -3.72288, 1, 0.8235294, 0, 1,
-1.046677, -1.685151, -2.706252, 1, 0.827451, 0, 1,
-1.044065, 1.336409, -0.3323216, 1, 0.8352941, 0, 1,
-1.043281, -1.267271, -2.311482, 1, 0.8392157, 0, 1,
-1.032959, 0.08380752, -1.580678, 1, 0.8470588, 0, 1,
-1.026768, 1.154568, 0.009310954, 1, 0.8509804, 0, 1,
-1.026545, -0.7514803, -1.560989, 1, 0.8588235, 0, 1,
-1.023357, 1.039995, -0.8356309, 1, 0.8627451, 0, 1,
-1.016942, 2.284679, -2.031612, 1, 0.8705882, 0, 1,
-1.01682, 1.775454, -2.091596, 1, 0.8745098, 0, 1,
-1.006004, 0.9877292, 0.3632911, 1, 0.8823529, 0, 1,
-0.9884592, -1.143426, -3.341466, 1, 0.8862745, 0, 1,
-0.9873878, 1.277216, 0.8010314, 1, 0.8941177, 0, 1,
-0.9867415, -1.851737, -2.495288, 1, 0.8980392, 0, 1,
-0.9838983, -0.6920261, -1.614359, 1, 0.9058824, 0, 1,
-0.9814306, 0.9715231, -0.07240357, 1, 0.9137255, 0, 1,
-0.9771937, 0.9832142, -0.6629248, 1, 0.9176471, 0, 1,
-0.9759182, -1.668476, -3.614306, 1, 0.9254902, 0, 1,
-0.973364, -0.4818424, -1.030192, 1, 0.9294118, 0, 1,
-0.9727385, -0.1590162, 0.4411647, 1, 0.9372549, 0, 1,
-0.9670986, -0.9208101, -2.866031, 1, 0.9411765, 0, 1,
-0.9636929, -0.2319297, -0.1870835, 1, 0.9490196, 0, 1,
-0.9634014, -0.2589993, -2.099947, 1, 0.9529412, 0, 1,
-0.9596449, 0.5715561, -1.639209, 1, 0.9607843, 0, 1,
-0.9590541, -0.015469, -2.177788, 1, 0.9647059, 0, 1,
-0.9578226, 1.777678, 1.309431, 1, 0.972549, 0, 1,
-0.9568086, 0.7091392, -0.1828454, 1, 0.9764706, 0, 1,
-0.9560233, -0.06923901, -2.446144, 1, 0.9843137, 0, 1,
-0.9555341, 0.5307973, -0.5488913, 1, 0.9882353, 0, 1,
-0.9532238, -1.49238, -1.357341, 1, 0.9960784, 0, 1,
-0.9519539, -0.7903128, -2.608186, 0.9960784, 1, 0, 1,
-0.9507384, -1.120463, -2.183026, 0.9921569, 1, 0, 1,
-0.9507316, 1.09164, -0.297171, 0.9843137, 1, 0, 1,
-0.9507169, 0.4696828, -3.014737, 0.9803922, 1, 0, 1,
-0.948755, 0.625273, -1.376188, 0.972549, 1, 0, 1,
-0.9454653, -0.4522494, -1.209525, 0.9686275, 1, 0, 1,
-0.9405804, -1.057911, -2.199088, 0.9607843, 1, 0, 1,
-0.9344491, -0.4455988, -1.38664, 0.9568627, 1, 0, 1,
-0.9321374, -0.06088464, -0.1930666, 0.9490196, 1, 0, 1,
-0.9297895, 0.7048419, 0.5553297, 0.945098, 1, 0, 1,
-0.9279216, -1.046799, -2.537788, 0.9372549, 1, 0, 1,
-0.9275408, -1.421172, -2.257177, 0.9333333, 1, 0, 1,
-0.9268075, 0.189937, -0.2369439, 0.9254902, 1, 0, 1,
-0.9229375, -0.1573008, -1.627871, 0.9215686, 1, 0, 1,
-0.9198559, 1.209676, -1.458024, 0.9137255, 1, 0, 1,
-0.9134482, 0.5768888, -2.664001, 0.9098039, 1, 0, 1,
-0.9090376, 0.7866162, -1.025938, 0.9019608, 1, 0, 1,
-0.9025781, 0.2048128, -1.029644, 0.8941177, 1, 0, 1,
-0.9013836, 0.7415183, -0.8531765, 0.8901961, 1, 0, 1,
-0.8996051, -0.1558193, -0.9557377, 0.8823529, 1, 0, 1,
-0.8964521, -1.827689, -1.454853, 0.8784314, 1, 0, 1,
-0.8924119, -2.09624, -3.780374, 0.8705882, 1, 0, 1,
-0.8891289, 0.3953133, -2.343355, 0.8666667, 1, 0, 1,
-0.8891184, 0.4238481, -1.019707, 0.8588235, 1, 0, 1,
-0.8845569, 0.5396712, -0.2517685, 0.854902, 1, 0, 1,
-0.8811963, -0.4235777, -2.808752, 0.8470588, 1, 0, 1,
-0.8803487, 1.157642, -1.03285, 0.8431373, 1, 0, 1,
-0.8799542, 0.04892509, -1.549683, 0.8352941, 1, 0, 1,
-0.874702, -0.1249129, -1.942817, 0.8313726, 1, 0, 1,
-0.8715823, 0.335462, -0.09573241, 0.8235294, 1, 0, 1,
-0.8673306, 0.8720815, 0.07314018, 0.8196079, 1, 0, 1,
-0.8644885, 0.6080702, -1.06822, 0.8117647, 1, 0, 1,
-0.8610384, -1.054588, -1.798144, 0.8078431, 1, 0, 1,
-0.8591257, 0.1228731, -0.8264553, 0.8, 1, 0, 1,
-0.8562143, -1.202734, -2.41398, 0.7921569, 1, 0, 1,
-0.8467208, -0.7359421, -3.443184, 0.7882353, 1, 0, 1,
-0.8441415, -0.3672947, -1.279915, 0.7803922, 1, 0, 1,
-0.8429875, -0.1258242, -0.4357062, 0.7764706, 1, 0, 1,
-0.8426759, -1.709891, -1.30914, 0.7686275, 1, 0, 1,
-0.8387175, 0.3694591, 0.162834, 0.7647059, 1, 0, 1,
-0.8384969, 0.287891, -1.213902, 0.7568628, 1, 0, 1,
-0.8359228, -0.9943669, -2.129205, 0.7529412, 1, 0, 1,
-0.8267294, 0.5785373, -0.1141382, 0.7450981, 1, 0, 1,
-0.8253196, -2.47158, -4.429513, 0.7411765, 1, 0, 1,
-0.8243263, 1.663584, -2.45857, 0.7333333, 1, 0, 1,
-0.8240498, 0.3473997, -2.2653, 0.7294118, 1, 0, 1,
-0.8179781, 1.126237, -0.9149263, 0.7215686, 1, 0, 1,
-0.8167607, -0.6235307, -1.771855, 0.7176471, 1, 0, 1,
-0.816749, 0.6523353, -1.407533, 0.7098039, 1, 0, 1,
-0.8150495, -1.397586, -1.540138, 0.7058824, 1, 0, 1,
-0.8146504, -0.8894643, -2.348214, 0.6980392, 1, 0, 1,
-0.8143825, 1.544868, 0.2366377, 0.6901961, 1, 0, 1,
-0.8062947, 2.531431, -0.9286348, 0.6862745, 1, 0, 1,
-0.8058022, -0.09207399, -2.964088, 0.6784314, 1, 0, 1,
-0.8038843, -1.071659, -1.942132, 0.6745098, 1, 0, 1,
-0.7931091, 0.4763034, -1.844521, 0.6666667, 1, 0, 1,
-0.7912996, 0.09268807, -0.5042189, 0.6627451, 1, 0, 1,
-0.7876638, 0.7531345, -1.99832, 0.654902, 1, 0, 1,
-0.7811587, 0.5357857, -0.6149879, 0.6509804, 1, 0, 1,
-0.7800666, -0.492446, -0.9984369, 0.6431373, 1, 0, 1,
-0.7771574, 0.04861893, 0.1039451, 0.6392157, 1, 0, 1,
-0.768258, -0.06462571, -1.857123, 0.6313726, 1, 0, 1,
-0.767643, 0.9067534, -1.156181, 0.627451, 1, 0, 1,
-0.7653674, 1.805204, 2.020315, 0.6196079, 1, 0, 1,
-0.7629377, 1.125558, -0.1407831, 0.6156863, 1, 0, 1,
-0.759929, 2.037512, 0.3475032, 0.6078432, 1, 0, 1,
-0.7584696, 1.215768, -2.284001, 0.6039216, 1, 0, 1,
-0.758252, 1.091388, -2.015229, 0.5960785, 1, 0, 1,
-0.7581813, 0.6908306, -0.3517244, 0.5882353, 1, 0, 1,
-0.7520652, -0.5153055, -2.313496, 0.5843138, 1, 0, 1,
-0.7516043, -0.5857251, -1.202263, 0.5764706, 1, 0, 1,
-0.7411571, 0.4193601, -1.45078, 0.572549, 1, 0, 1,
-0.7377643, 0.7349654, 0.03037905, 0.5647059, 1, 0, 1,
-0.7351457, 1.178426, -0.5434273, 0.5607843, 1, 0, 1,
-0.7342581, -0.7957417, -3.237525, 0.5529412, 1, 0, 1,
-0.7337201, -1.512154, -1.689964, 0.5490196, 1, 0, 1,
-0.7322414, 0.008929466, -1.747331, 0.5411765, 1, 0, 1,
-0.7301581, 2.060253, -0.5189605, 0.5372549, 1, 0, 1,
-0.7273349, -1.315088, -3.488743, 0.5294118, 1, 0, 1,
-0.7216305, -0.5468348, -0.9552208, 0.5254902, 1, 0, 1,
-0.7169687, 0.09853119, -2.429144, 0.5176471, 1, 0, 1,
-0.7097992, -0.4832393, -4.136586, 0.5137255, 1, 0, 1,
-0.7083562, -0.7873147, -1.327407, 0.5058824, 1, 0, 1,
-0.7055733, -0.1461259, -2.20527, 0.5019608, 1, 0, 1,
-0.6978211, 0.9382234, -1.572483, 0.4941176, 1, 0, 1,
-0.6892047, 0.8611434, -1.403981, 0.4862745, 1, 0, 1,
-0.6873016, 2.634657, 0.4211878, 0.4823529, 1, 0, 1,
-0.6828595, 0.6296304, -0.9385303, 0.4745098, 1, 0, 1,
-0.6802492, -1.060762, -0.6649808, 0.4705882, 1, 0, 1,
-0.6761679, 0.4767333, -0.9976991, 0.4627451, 1, 0, 1,
-0.6759895, -0.3480354, -1.68234, 0.4588235, 1, 0, 1,
-0.6700953, -1.706655, -2.886936, 0.4509804, 1, 0, 1,
-0.6693146, 0.5030727, 0.2668987, 0.4470588, 1, 0, 1,
-0.6673927, -1.76642, -2.638896, 0.4392157, 1, 0, 1,
-0.6660895, -0.367234, -0.7672437, 0.4352941, 1, 0, 1,
-0.6660856, -0.3762861, -2.998427, 0.427451, 1, 0, 1,
-0.6655439, 0.5057625, 0.7779404, 0.4235294, 1, 0, 1,
-0.6615142, 0.2911178, -2.657284, 0.4156863, 1, 0, 1,
-0.6548073, -0.2473686, -2.675881, 0.4117647, 1, 0, 1,
-0.6544247, 0.1224945, -0.2788936, 0.4039216, 1, 0, 1,
-0.6534058, 0.4517354, -1.475338, 0.3960784, 1, 0, 1,
-0.6422638, -0.4533522, -2.936741, 0.3921569, 1, 0, 1,
-0.6356514, -0.3843981, -1.585989, 0.3843137, 1, 0, 1,
-0.6279629, -1.974604, -1.865463, 0.3803922, 1, 0, 1,
-0.6269019, -0.4733466, -2.602118, 0.372549, 1, 0, 1,
-0.6265669, 1.129971, 0.3441376, 0.3686275, 1, 0, 1,
-0.6262465, -0.1588613, -1.022287, 0.3607843, 1, 0, 1,
-0.6215725, -0.601781, -1.247957, 0.3568628, 1, 0, 1,
-0.6204662, -0.2131208, -1.446276, 0.3490196, 1, 0, 1,
-0.6191345, 0.3154048, -0.5328887, 0.345098, 1, 0, 1,
-0.6165984, -0.2316859, -2.05103, 0.3372549, 1, 0, 1,
-0.6144935, 1.213774, -1.235573, 0.3333333, 1, 0, 1,
-0.6129103, 0.8865055, 1.075972, 0.3254902, 1, 0, 1,
-0.6124102, -0.3727737, -1.924009, 0.3215686, 1, 0, 1,
-0.6121967, 1.002295, 0.9038595, 0.3137255, 1, 0, 1,
-0.611123, 1.380323, -0.2104026, 0.3098039, 1, 0, 1,
-0.607326, -0.0009820432, -1.553632, 0.3019608, 1, 0, 1,
-0.5992022, 0.6534142, -0.4176995, 0.2941177, 1, 0, 1,
-0.5938752, -0.4312849, -1.622065, 0.2901961, 1, 0, 1,
-0.5923589, -1.108416, -2.975152, 0.282353, 1, 0, 1,
-0.5883155, -0.8373561, -2.515605, 0.2784314, 1, 0, 1,
-0.5845128, -0.1535805, -2.632999, 0.2705882, 1, 0, 1,
-0.5813655, -0.05861947, -2.34792, 0.2666667, 1, 0, 1,
-0.5755777, 1.264854, -0.6898776, 0.2588235, 1, 0, 1,
-0.574171, -0.3285857, -2.988773, 0.254902, 1, 0, 1,
-0.5694486, -2.199573, -3.49113, 0.2470588, 1, 0, 1,
-0.5667465, 0.3181291, -0.5181333, 0.2431373, 1, 0, 1,
-0.5617021, -0.4166191, -1.786349, 0.2352941, 1, 0, 1,
-0.5559961, -1.086654, -2.958438, 0.2313726, 1, 0, 1,
-0.5545829, -1.119426, -1.857113, 0.2235294, 1, 0, 1,
-0.553193, -0.1045819, -1.439892, 0.2196078, 1, 0, 1,
-0.5467721, -1.142334, -3.356329, 0.2117647, 1, 0, 1,
-0.5439118, -0.3208838, -1.238274, 0.2078431, 1, 0, 1,
-0.5435813, -0.578062, -2.806771, 0.2, 1, 0, 1,
-0.5418742, -0.3971057, 0.09620323, 0.1921569, 1, 0, 1,
-0.5394262, -0.9667161, -2.985521, 0.1882353, 1, 0, 1,
-0.5377954, -0.7086564, -1.98647, 0.1803922, 1, 0, 1,
-0.5337219, 0.7190123, 0.382654, 0.1764706, 1, 0, 1,
-0.525767, -0.474811, -2.843639, 0.1686275, 1, 0, 1,
-0.524515, 0.9141603, -0.812932, 0.1647059, 1, 0, 1,
-0.521428, -1.631231, -2.684518, 0.1568628, 1, 0, 1,
-0.5213639, -1.21637, -3.931157, 0.1529412, 1, 0, 1,
-0.5204798, 0.1251061, -1.815436, 0.145098, 1, 0, 1,
-0.5178403, -1.576408, -3.934762, 0.1411765, 1, 0, 1,
-0.5168802, -0.5365783, -2.410602, 0.1333333, 1, 0, 1,
-0.5132182, -0.5798277, -2.68072, 0.1294118, 1, 0, 1,
-0.5129853, 0.8403354, -0.2341483, 0.1215686, 1, 0, 1,
-0.5116856, -0.6847459, -3.730169, 0.1176471, 1, 0, 1,
-0.5114144, -1.630807, -4.930592, 0.1098039, 1, 0, 1,
-0.5077856, 0.6933535, -0.9770097, 0.1058824, 1, 0, 1,
-0.5055886, 0.6974988, -1.601117, 0.09803922, 1, 0, 1,
-0.5044137, 1.544059, -1.752587, 0.09019608, 1, 0, 1,
-0.5021162, -0.3042746, -2.834114, 0.08627451, 1, 0, 1,
-0.5007049, 0.5599253, -0.9938533, 0.07843138, 1, 0, 1,
-0.498469, 1.069726, -2.34107, 0.07450981, 1, 0, 1,
-0.4975767, 1.049575, -1.421857, 0.06666667, 1, 0, 1,
-0.4945783, -0.5775948, -3.9354, 0.0627451, 1, 0, 1,
-0.4915057, -2.715693, -2.279329, 0.05490196, 1, 0, 1,
-0.4883973, -0.6152658, -3.77514, 0.05098039, 1, 0, 1,
-0.4880391, 1.214894, -0.6548454, 0.04313726, 1, 0, 1,
-0.4856066, 0.1452181, -3.019736, 0.03921569, 1, 0, 1,
-0.4793637, -0.5157737, -2.626611, 0.03137255, 1, 0, 1,
-0.476831, -0.8859947, -0.4804878, 0.02745098, 1, 0, 1,
-0.4766369, -0.944571, -2.71466, 0.01960784, 1, 0, 1,
-0.471558, 0.6361136, 0.1976457, 0.01568628, 1, 0, 1,
-0.4629158, 1.360336, -0.5980304, 0.007843138, 1, 0, 1,
-0.4590747, -1.306135, -2.695748, 0.003921569, 1, 0, 1,
-0.4563956, -0.4901526, -1.587377, 0, 1, 0.003921569, 1,
-0.447487, -1.10365, -1.106248, 0, 1, 0.01176471, 1,
-0.4473027, 0.3574732, -1.176217, 0, 1, 0.01568628, 1,
-0.4470009, -1.635109, -4.154894, 0, 1, 0.02352941, 1,
-0.4370478, -0.5023885, -2.91122, 0, 1, 0.02745098, 1,
-0.4368689, -0.1718916, -2.802216, 0, 1, 0.03529412, 1,
-0.4342551, 0.2862836, -1.243038, 0, 1, 0.03921569, 1,
-0.4339615, -1.087713, -4.070199, 0, 1, 0.04705882, 1,
-0.4337154, 2.262179, -0.5672262, 0, 1, 0.05098039, 1,
-0.4312543, -1.912454, -2.691739, 0, 1, 0.05882353, 1,
-0.4301801, 0.3990526, -0.7836772, 0, 1, 0.0627451, 1,
-0.4295271, -0.8861445, -3.277083, 0, 1, 0.07058824, 1,
-0.4286789, 0.7683393, -2.309963, 0, 1, 0.07450981, 1,
-0.4258682, 0.6393475, -0.6124388, 0, 1, 0.08235294, 1,
-0.4115971, -0.2767345, -0.7528949, 0, 1, 0.08627451, 1,
-0.3993605, -0.2280496, -1.587738, 0, 1, 0.09411765, 1,
-0.3985594, 1.253747, -2.631487, 0, 1, 0.1019608, 1,
-0.3976133, 2.692842, -0.5827618, 0, 1, 0.1058824, 1,
-0.396121, -1.005993, -0.5031925, 0, 1, 0.1137255, 1,
-0.3908492, 0.5014375, -0.2906171, 0, 1, 0.1176471, 1,
-0.3897589, -0.05856803, -2.073725, 0, 1, 0.1254902, 1,
-0.3883966, -0.552319, -3.941906, 0, 1, 0.1294118, 1,
-0.3855849, 0.9901752, 1.587539, 0, 1, 0.1372549, 1,
-0.3854525, -0.313279, -2.693407, 0, 1, 0.1411765, 1,
-0.3822252, 0.6156682, -0.4825191, 0, 1, 0.1490196, 1,
-0.3821326, 0.1137998, 0.2909437, 0, 1, 0.1529412, 1,
-0.3772562, -0.219769, -2.665392, 0, 1, 0.1607843, 1,
-0.3755, -0.3867267, -2.547163, 0, 1, 0.1647059, 1,
-0.3751238, 0.9691621, -0.8606911, 0, 1, 0.172549, 1,
-0.3707953, -2.023, -3.286141, 0, 1, 0.1764706, 1,
-0.3642352, 0.5417361, -2.568249, 0, 1, 0.1843137, 1,
-0.3589962, 1.515229, -0.7944977, 0, 1, 0.1882353, 1,
-0.3505215, 1.733194, -0.7629928, 0, 1, 0.1960784, 1,
-0.3499013, -0.5322505, -2.41566, 0, 1, 0.2039216, 1,
-0.3423695, -0.1395466, -1.959351, 0, 1, 0.2078431, 1,
-0.339716, -0.1010645, -2.633721, 0, 1, 0.2156863, 1,
-0.3364542, 0.06109778, -0.4249671, 0, 1, 0.2196078, 1,
-0.3356502, 0.05517932, -0.3702194, 0, 1, 0.227451, 1,
-0.3293444, 2.328972, -1.573478, 0, 1, 0.2313726, 1,
-0.3278098, 1.325418, -1.05351, 0, 1, 0.2392157, 1,
-0.3274868, -2.0536, -3.068329, 0, 1, 0.2431373, 1,
-0.3249828, -0.506899, -3.12472, 0, 1, 0.2509804, 1,
-0.3240576, 0.6369405, 0.0645401, 0, 1, 0.254902, 1,
-0.3236986, -0.6620727, -3.1872, 0, 1, 0.2627451, 1,
-0.3198545, 0.0485392, -1.994475, 0, 1, 0.2666667, 1,
-0.3164841, 0.5712295, -0.3683214, 0, 1, 0.2745098, 1,
-0.314598, 0.5616493, 0.677323, 0, 1, 0.2784314, 1,
-0.3067855, 0.6668834, -0.003860669, 0, 1, 0.2862745, 1,
-0.3019913, 1.380196, 0.5632467, 0, 1, 0.2901961, 1,
-0.3004965, -0.920645, -2.490001, 0, 1, 0.2980392, 1,
-0.2975445, 0.01863195, -2.138287, 0, 1, 0.3058824, 1,
-0.2974609, 2.33086, 1.125107, 0, 1, 0.3098039, 1,
-0.2957816, -0.3545527, -2.997065, 0, 1, 0.3176471, 1,
-0.2948318, -1.616137, -2.577228, 0, 1, 0.3215686, 1,
-0.292983, -1.129893, -3.309621, 0, 1, 0.3294118, 1,
-0.2907354, -0.917942, -2.183185, 0, 1, 0.3333333, 1,
-0.2877283, 0.6982763, 1.74589, 0, 1, 0.3411765, 1,
-0.2859816, 0.7482477, -0.01857037, 0, 1, 0.345098, 1,
-0.2857614, -0.2448263, -2.041976, 0, 1, 0.3529412, 1,
-0.2815423, -0.3180871, -4.616185, 0, 1, 0.3568628, 1,
-0.2812092, 0.1560664, -0.8850132, 0, 1, 0.3647059, 1,
-0.2801684, -0.00366019, -1.739687, 0, 1, 0.3686275, 1,
-0.2786636, -0.1878369, -1.809105, 0, 1, 0.3764706, 1,
-0.2756483, 0.1901604, -0.2128507, 0, 1, 0.3803922, 1,
-0.2726821, 0.2921056, -3.153396, 0, 1, 0.3882353, 1,
-0.2701394, -1.87764, -3.268933, 0, 1, 0.3921569, 1,
-0.2663754, -1.134737, -1.976241, 0, 1, 0.4, 1,
-0.2663456, 1.623792, -1.186416, 0, 1, 0.4078431, 1,
-0.2663273, -0.8647562, -2.837899, 0, 1, 0.4117647, 1,
-0.2612448, -0.4822108, -3.830913, 0, 1, 0.4196078, 1,
-0.2594602, 0.4855572, -0.9987521, 0, 1, 0.4235294, 1,
-0.2510253, -0.3132849, -2.64825, 0, 1, 0.4313726, 1,
-0.2402514, 0.8193894, -1.720909, 0, 1, 0.4352941, 1,
-0.2400436, -1.192273, -3.013502, 0, 1, 0.4431373, 1,
-0.2384838, -1.687568, -1.962867, 0, 1, 0.4470588, 1,
-0.2381844, -0.7812617, -4.189191, 0, 1, 0.454902, 1,
-0.2337433, -0.4795598, -3.406257, 0, 1, 0.4588235, 1,
-0.2333809, -1.164074, -2.498556, 0, 1, 0.4666667, 1,
-0.2302186, -1.507943, -2.119081, 0, 1, 0.4705882, 1,
-0.2297066, 1.267051, -1.115545, 0, 1, 0.4784314, 1,
-0.2250467, 0.5989723, -2.441134, 0, 1, 0.4823529, 1,
-0.2203217, 0.7554063, -0.7342052, 0, 1, 0.4901961, 1,
-0.2156112, -0.730296, -3.961974, 0, 1, 0.4941176, 1,
-0.2141941, -0.4188729, -2.411015, 0, 1, 0.5019608, 1,
-0.2095082, 0.324914, -1.646576, 0, 1, 0.509804, 1,
-0.2084133, -0.496785, -1.656619, 0, 1, 0.5137255, 1,
-0.2020334, -2.116726, -3.203676, 0, 1, 0.5215687, 1,
-0.2015006, 2.016494, 0.6439221, 0, 1, 0.5254902, 1,
-0.1913624, 0.5957103, -1.485497, 0, 1, 0.5333334, 1,
-0.1859511, 0.3083069, -0.4444386, 0, 1, 0.5372549, 1,
-0.1793221, 2.338411, 0.4684907, 0, 1, 0.5450981, 1,
-0.1752102, 0.4201365, -0.6644669, 0, 1, 0.5490196, 1,
-0.1736827, 0.964124, -1.197494, 0, 1, 0.5568628, 1,
-0.1683245, -0.003165032, -1.388555, 0, 1, 0.5607843, 1,
-0.1642313, -0.06159938, -3.895921, 0, 1, 0.5686275, 1,
-0.1631334, 1.433403, 0.2242939, 0, 1, 0.572549, 1,
-0.1624065, 0.189688, -1.16147, 0, 1, 0.5803922, 1,
-0.1613637, 1.191268, -0.09203792, 0, 1, 0.5843138, 1,
-0.16008, -0.2469715, -2.505893, 0, 1, 0.5921569, 1,
-0.1574123, -0.7186151, -1.360083, 0, 1, 0.5960785, 1,
-0.1556183, 2.343049, 0.286598, 0, 1, 0.6039216, 1,
-0.1411504, 0.5928194, -0.4257137, 0, 1, 0.6117647, 1,
-0.1380216, -0.3053865, -3.224876, 0, 1, 0.6156863, 1,
-0.1331018, -1.836422, -2.687963, 0, 1, 0.6235294, 1,
-0.1325098, -1.239606, -2.31462, 0, 1, 0.627451, 1,
-0.1324411, 0.6036, -0.5497413, 0, 1, 0.6352941, 1,
-0.1312073, 1.477634, 0.6853223, 0, 1, 0.6392157, 1,
-0.1263258, 0.6562146, -0.3790603, 0, 1, 0.6470588, 1,
-0.1216679, -0.6689627, -2.527563, 0, 1, 0.6509804, 1,
-0.1208669, 0.2556426, -0.705072, 0, 1, 0.6588235, 1,
-0.1208028, 0.44492, -0.04427839, 0, 1, 0.6627451, 1,
-0.1194417, -0.8671447, -2.948669, 0, 1, 0.6705883, 1,
-0.1193341, -0.3263452, -1.367342, 0, 1, 0.6745098, 1,
-0.1179813, -0.7153251, -3.56043, 0, 1, 0.682353, 1,
-0.1168825, -0.8794876, -2.636636, 0, 1, 0.6862745, 1,
-0.111683, -1.30257, -3.160947, 0, 1, 0.6941177, 1,
-0.1087783, 1.884956, -0.08886624, 0, 1, 0.7019608, 1,
-0.1060071, 0.4607409, -1.704723, 0, 1, 0.7058824, 1,
-0.1054297, 0.4555217, -0.4324259, 0, 1, 0.7137255, 1,
-0.1028655, 0.2970045, -0.1952642, 0, 1, 0.7176471, 1,
-0.102788, -0.3557274, -2.534079, 0, 1, 0.7254902, 1,
-0.09963921, -0.05582133, -1.210917, 0, 1, 0.7294118, 1,
-0.09912187, -0.6237571, -1.047347, 0, 1, 0.7372549, 1,
-0.0910068, 0.667878, -0.1477979, 0, 1, 0.7411765, 1,
-0.09095501, 1.502527, 0.877716, 0, 1, 0.7490196, 1,
-0.08692312, 0.4045242, 0.2225632, 0, 1, 0.7529412, 1,
-0.08542348, -1.954891, -2.59338, 0, 1, 0.7607843, 1,
-0.08532786, 1.464724, 0.08218033, 0, 1, 0.7647059, 1,
-0.08482619, -0.07361996, -0.7945661, 0, 1, 0.772549, 1,
-0.08164302, 1.306538, 0.4719813, 0, 1, 0.7764706, 1,
-0.08090741, -0.8591145, -2.751136, 0, 1, 0.7843137, 1,
-0.07926094, 1.129133, 0.65149, 0, 1, 0.7882353, 1,
-0.07874665, -2.365982, -4.165422, 0, 1, 0.7960784, 1,
-0.07676565, 0.9764864, 0.2432829, 0, 1, 0.8039216, 1,
-0.07373057, -0.8316059, -3.824571, 0, 1, 0.8078431, 1,
-0.07371336, -0.9787317, -2.336219, 0, 1, 0.8156863, 1,
-0.07062742, -0.6370569, -3.305781, 0, 1, 0.8196079, 1,
-0.06916479, -1.480713, -0.664138, 0, 1, 0.827451, 1,
-0.06394126, 0.6219496, 2.597075, 0, 1, 0.8313726, 1,
-0.05911611, -0.2357512, -3.811182, 0, 1, 0.8392157, 1,
-0.05836014, -3.207057, -4.645225, 0, 1, 0.8431373, 1,
-0.05825536, 0.9878164, -1.482653, 0, 1, 0.8509804, 1,
-0.05800018, 0.3960966, -0.4795341, 0, 1, 0.854902, 1,
-0.05744915, -0.2956791, -2.745717, 0, 1, 0.8627451, 1,
-0.05305209, -0.5605358, -1.518424, 0, 1, 0.8666667, 1,
-0.04917307, 1.464288, 0.1589854, 0, 1, 0.8745098, 1,
-0.04891972, -0.8177885, -4.67682, 0, 1, 0.8784314, 1,
-0.04688102, 1.303396, -0.8596861, 0, 1, 0.8862745, 1,
-0.04636057, 0.5216967, 2.153095, 0, 1, 0.8901961, 1,
-0.04531286, -0.9025562, -2.852137, 0, 1, 0.8980392, 1,
-0.04477057, 1.88679, -1.652326, 0, 1, 0.9058824, 1,
-0.04375795, 1.38545, 0.5914553, 0, 1, 0.9098039, 1,
-0.04102701, -0.3018402, -3.518594, 0, 1, 0.9176471, 1,
-0.04038899, 0.2800258, -1.920377, 0, 1, 0.9215686, 1,
-0.03924196, 0.2404959, -0.7814688, 0, 1, 0.9294118, 1,
-0.03775273, 0.2306821, 0.1444605, 0, 1, 0.9333333, 1,
-0.03551795, 0.696148, 0.3377338, 0, 1, 0.9411765, 1,
-0.03302646, 0.1520214, 0.5635026, 0, 1, 0.945098, 1,
-0.03142255, 0.6369334, 1.017375, 0, 1, 0.9529412, 1,
-0.02128053, 1.575593, -0.1291743, 0, 1, 0.9568627, 1,
-0.020799, -0.2479, -2.921594, 0, 1, 0.9647059, 1,
-0.01952199, -0.6614949, -3.214082, 0, 1, 0.9686275, 1,
-0.01951152, 0.6812423, -0.3082075, 0, 1, 0.9764706, 1,
-0.01917102, -0.09884072, -2.670451, 0, 1, 0.9803922, 1,
-0.01887551, 1.132571, 0.9673765, 0, 1, 0.9882353, 1,
-0.01672794, 0.6439953, -0.5938012, 0, 1, 0.9921569, 1,
-0.01363398, 0.8077687, 0.2334112, 0, 1, 1, 1,
-0.00897151, -0.343637, -4.527415, 0, 0.9921569, 1, 1,
-0.008676302, -0.9416842, -2.383856, 0, 0.9882353, 1, 1,
-0.001221279, -1.686472, -4.831748, 0, 0.9803922, 1, 1,
0.003638786, 0.5406668, 1.20771, 0, 0.9764706, 1, 1,
0.009405939, -1.487955, 4.000491, 0, 0.9686275, 1, 1,
0.01114909, 0.5429649, 1.225165, 0, 0.9647059, 1, 1,
0.01206524, 0.4277092, 0.2579537, 0, 0.9568627, 1, 1,
0.01467767, -1.257912, 2.357216, 0, 0.9529412, 1, 1,
0.01573037, -0.5593639, 3.080642, 0, 0.945098, 1, 1,
0.01593679, -0.2533422, 3.536045, 0, 0.9411765, 1, 1,
0.01971686, 0.09228348, -1.874106, 0, 0.9333333, 1, 1,
0.0228825, 0.4877174, 1.007816, 0, 0.9294118, 1, 1,
0.02407929, -0.6667017, 4.036036, 0, 0.9215686, 1, 1,
0.0250233, -2.196649, 1.676224, 0, 0.9176471, 1, 1,
0.02741043, -0.2736853, 1.740471, 0, 0.9098039, 1, 1,
0.03483449, -0.1568798, 2.562621, 0, 0.9058824, 1, 1,
0.03508187, -0.6919299, 4.491908, 0, 0.8980392, 1, 1,
0.04430862, -1.988073, 4.467793, 0, 0.8901961, 1, 1,
0.04843928, 0.4996316, 1.351924, 0, 0.8862745, 1, 1,
0.05337182, 0.8173847, 1.08727, 0, 0.8784314, 1, 1,
0.05376368, -0.1309353, 3.413634, 0, 0.8745098, 1, 1,
0.05409783, 0.6487922, 0.1097927, 0, 0.8666667, 1, 1,
0.05578126, 1.025164, 2.056652, 0, 0.8627451, 1, 1,
0.06033122, 0.7093313, 0.09691741, 0, 0.854902, 1, 1,
0.0608109, 0.01937804, 1.197041, 0, 0.8509804, 1, 1,
0.06351741, 0.3920232, 0.1118029, 0, 0.8431373, 1, 1,
0.06507781, 1.012376, -0.7260956, 0, 0.8392157, 1, 1,
0.06866264, 0.2789501, 0.7724647, 0, 0.8313726, 1, 1,
0.06959429, 0.0672498, 0.09300639, 0, 0.827451, 1, 1,
0.07388611, -0.8650169, 2.461441, 0, 0.8196079, 1, 1,
0.07452707, -0.7011554, 3.814333, 0, 0.8156863, 1, 1,
0.07757588, -0.9149271, 4.204473, 0, 0.8078431, 1, 1,
0.07835626, 1.018717, 0.434268, 0, 0.8039216, 1, 1,
0.07842761, 2.784147, -1.76126, 0, 0.7960784, 1, 1,
0.08183143, 0.8694882, -0.0861488, 0, 0.7882353, 1, 1,
0.0853428, 2.0637, 1.618549, 0, 0.7843137, 1, 1,
0.08626732, 0.5434981, -0.7846217, 0, 0.7764706, 1, 1,
0.08701642, -0.7777287, 2.538221, 0, 0.772549, 1, 1,
0.0880736, -1.906321, 2.81614, 0, 0.7647059, 1, 1,
0.09107595, 0.6447381, 0.1103708, 0, 0.7607843, 1, 1,
0.09576176, -1.207813, 4.162467, 0, 0.7529412, 1, 1,
0.09624702, -0.8044473, 3.229396, 0, 0.7490196, 1, 1,
0.1005327, -0.3157601, 0.8126026, 0, 0.7411765, 1, 1,
0.1044025, -0.06763063, 1.984869, 0, 0.7372549, 1, 1,
0.1082195, 2.586446, -0.3502252, 0, 0.7294118, 1, 1,
0.1099024, -0.1266508, 2.968132, 0, 0.7254902, 1, 1,
0.1125922, 0.736298, 0.7077999, 0, 0.7176471, 1, 1,
0.1165684, -0.6694475, 3.781802, 0, 0.7137255, 1, 1,
0.1189561, -0.06850763, 1.55596, 0, 0.7058824, 1, 1,
0.1232793, 1.302262, 0.6958373, 0, 0.6980392, 1, 1,
0.1274835, 2.003856, -0.3523541, 0, 0.6941177, 1, 1,
0.1294293, -1.272264, 1.828722, 0, 0.6862745, 1, 1,
0.131099, -0.977838, 3.004776, 0, 0.682353, 1, 1,
0.1377816, 0.08633643, 0.9951499, 0, 0.6745098, 1, 1,
0.1409758, 0.1779986, 1.895626, 0, 0.6705883, 1, 1,
0.1431082, 0.3053127, 0.2176512, 0, 0.6627451, 1, 1,
0.1438591, -0.1347673, 1.831298, 0, 0.6588235, 1, 1,
0.1474706, 0.6440749, 1.150977, 0, 0.6509804, 1, 1,
0.14887, 0.5607482, 0.2969812, 0, 0.6470588, 1, 1,
0.1489843, -0.6146666, 2.920088, 0, 0.6392157, 1, 1,
0.1492099, -0.633419, 4.768586, 0, 0.6352941, 1, 1,
0.1499765, -1.127128, 3.766273, 0, 0.627451, 1, 1,
0.1504109, -0.3241521, 3.272578, 0, 0.6235294, 1, 1,
0.1535383, -0.04122853, 2.321347, 0, 0.6156863, 1, 1,
0.1566556, 0.1952529, 1.395334, 0, 0.6117647, 1, 1,
0.1623053, -2.271469, 3.485002, 0, 0.6039216, 1, 1,
0.1640557, -0.4390057, 1.196416, 0, 0.5960785, 1, 1,
0.1662694, 1.378713, 0.002604787, 0, 0.5921569, 1, 1,
0.166997, -1.722764, 0.9537147, 0, 0.5843138, 1, 1,
0.172979, -0.5392202, 2.668292, 0, 0.5803922, 1, 1,
0.1803761, 0.02528308, 2.492127, 0, 0.572549, 1, 1,
0.1809397, 0.1894253, 0.04155437, 0, 0.5686275, 1, 1,
0.1812608, 1.329153, 0.05111404, 0, 0.5607843, 1, 1,
0.181692, 0.9610842, -0.6538378, 0, 0.5568628, 1, 1,
0.1839472, -0.2895773, 2.901327, 0, 0.5490196, 1, 1,
0.1856405, 0.9551305, 0.5324796, 0, 0.5450981, 1, 1,
0.1875, 1.679053, 1.220147, 0, 0.5372549, 1, 1,
0.1889241, -0.5700493, 1.586336, 0, 0.5333334, 1, 1,
0.1947041, -2.082925, 6.091039, 0, 0.5254902, 1, 1,
0.1949625, -0.08674562, 2.01968, 0, 0.5215687, 1, 1,
0.1985007, -1.202529, 4.594625, 0, 0.5137255, 1, 1,
0.2007544, -0.02270615, 0.7520948, 0, 0.509804, 1, 1,
0.2043777, 0.6056746, 1.13413, 0, 0.5019608, 1, 1,
0.2043854, -1.547621, 2.928207, 0, 0.4941176, 1, 1,
0.206908, -1.363593, 2.836959, 0, 0.4901961, 1, 1,
0.2083147, 0.8619823, -0.4376397, 0, 0.4823529, 1, 1,
0.2128352, -0.07260345, 0.9604441, 0, 0.4784314, 1, 1,
0.2143139, 0.9338534, 0.1231987, 0, 0.4705882, 1, 1,
0.215804, -0.6676521, 2.31515, 0, 0.4666667, 1, 1,
0.2175206, -0.6776871, 2.548018, 0, 0.4588235, 1, 1,
0.2194111, 0.4831378, -0.702388, 0, 0.454902, 1, 1,
0.2205054, -1.913387, 2.860622, 0, 0.4470588, 1, 1,
0.2253431, -2.060222, 3.307261, 0, 0.4431373, 1, 1,
0.2264939, -0.9526381, 4.373646, 0, 0.4352941, 1, 1,
0.2270097, -0.2276874, 1.680822, 0, 0.4313726, 1, 1,
0.2297429, 2.034644, 0.09266815, 0, 0.4235294, 1, 1,
0.2492815, -1.220754, -0.2433403, 0, 0.4196078, 1, 1,
0.2515738, -2.419545, 2.428051, 0, 0.4117647, 1, 1,
0.253876, -1.607844, 3.13914, 0, 0.4078431, 1, 1,
0.2551808, -0.0682262, -0.8486643, 0, 0.4, 1, 1,
0.258183, -0.3026369, 0.9042339, 0, 0.3921569, 1, 1,
0.2589068, -1.61684, 3.666708, 0, 0.3882353, 1, 1,
0.2633471, 0.5637686, 1.79402, 0, 0.3803922, 1, 1,
0.2647747, -1.492787, 1.350569, 0, 0.3764706, 1, 1,
0.2718829, -1.075647, 1.264006, 0, 0.3686275, 1, 1,
0.2772663, -0.5250905, 2.881878, 0, 0.3647059, 1, 1,
0.2774901, -0.02693687, 3.379405, 0, 0.3568628, 1, 1,
0.278071, 2.244237, 0.779579, 0, 0.3529412, 1, 1,
0.2834896, 1.865305, 1.978054, 0, 0.345098, 1, 1,
0.2851017, -0.5083785, 3.849395, 0, 0.3411765, 1, 1,
0.286206, -0.04291113, 1.626596, 0, 0.3333333, 1, 1,
0.2964762, 0.5835069, 0.5437813, 0, 0.3294118, 1, 1,
0.297023, 1.104402, -0.03241995, 0, 0.3215686, 1, 1,
0.3078671, 0.3212608, 0.6279476, 0, 0.3176471, 1, 1,
0.3095742, -0.4912803, 4.239434, 0, 0.3098039, 1, 1,
0.3098253, 0.5799308, 0.7287154, 0, 0.3058824, 1, 1,
0.3136732, -0.794805, 3.704212, 0, 0.2980392, 1, 1,
0.314341, -0.01797126, -0.3491479, 0, 0.2901961, 1, 1,
0.3185277, 0.9649444, 0.6557967, 0, 0.2862745, 1, 1,
0.3223919, -0.5947134, 3.189788, 0, 0.2784314, 1, 1,
0.3262365, -1.216303, 3.365352, 0, 0.2745098, 1, 1,
0.3276317, -0.1619652, 3.178152, 0, 0.2666667, 1, 1,
0.3291847, 1.861215, -1.033671, 0, 0.2627451, 1, 1,
0.3293225, 0.5717293, 0.7713104, 0, 0.254902, 1, 1,
0.3332951, -0.5047516, 2.306717, 0, 0.2509804, 1, 1,
0.3338981, -1.285705, 2.076855, 0, 0.2431373, 1, 1,
0.3354309, -0.5930538, 3.705752, 0, 0.2392157, 1, 1,
0.3355963, -0.3948737, 3.015899, 0, 0.2313726, 1, 1,
0.3368964, 1.037786, 0.8306132, 0, 0.227451, 1, 1,
0.3394005, 1.397472, -0.2646322, 0, 0.2196078, 1, 1,
0.3403544, -1.229611, 3.704177, 0, 0.2156863, 1, 1,
0.3501261, -0.5711735, 2.990622, 0, 0.2078431, 1, 1,
0.3503647, -0.2655594, 1.55583, 0, 0.2039216, 1, 1,
0.3520919, 1.059921, -0.6890948, 0, 0.1960784, 1, 1,
0.3531525, -0.2948408, 2.171349, 0, 0.1882353, 1, 1,
0.3566362, 0.6808482, -0.5863876, 0, 0.1843137, 1, 1,
0.3568583, 0.5471098, 0.4925545, 0, 0.1764706, 1, 1,
0.3578142, 0.2237656, 1.099745, 0, 0.172549, 1, 1,
0.3656438, -1.522783, 3.057098, 0, 0.1647059, 1, 1,
0.3657381, 1.142602, -0.1378679, 0, 0.1607843, 1, 1,
0.3660927, -1.063532, 1.587556, 0, 0.1529412, 1, 1,
0.3687097, -1.952261, 2.926149, 0, 0.1490196, 1, 1,
0.3711518, 0.8957846, -1.475118, 0, 0.1411765, 1, 1,
0.3788396, -0.5391546, 1.207384, 0, 0.1372549, 1, 1,
0.3804979, -0.007586425, 2.470519, 0, 0.1294118, 1, 1,
0.3806076, -0.8044736, 1.872406, 0, 0.1254902, 1, 1,
0.3817511, 1.526866, 0.5963261, 0, 0.1176471, 1, 1,
0.3849612, -1.543072, 2.370478, 0, 0.1137255, 1, 1,
0.3902665, -0.9039415, 2.599052, 0, 0.1058824, 1, 1,
0.3904787, -2.782687, 2.480338, 0, 0.09803922, 1, 1,
0.3908081, 1.643268, 0.7258856, 0, 0.09411765, 1, 1,
0.395978, -1.805173, 1.112422, 0, 0.08627451, 1, 1,
0.3963275, -0.1614098, 1.505154, 0, 0.08235294, 1, 1,
0.3968128, 1.265306, 1.409019, 0, 0.07450981, 1, 1,
0.4023463, 2.092003, 0.7389092, 0, 0.07058824, 1, 1,
0.4033682, 0.905738, 1.354728, 0, 0.0627451, 1, 1,
0.4128982, -0.1925552, 2.649163, 0, 0.05882353, 1, 1,
0.4141908, -0.4532619, 2.969704, 0, 0.05098039, 1, 1,
0.4147063, 1.254952, -0.4918068, 0, 0.04705882, 1, 1,
0.4214568, 0.4500206, -0.05641948, 0, 0.03921569, 1, 1,
0.4264023, -0.599342, 1.288071, 0, 0.03529412, 1, 1,
0.426452, -0.9690021, 2.776604, 0, 0.02745098, 1, 1,
0.4286275, -1.140597, 3.234402, 0, 0.02352941, 1, 1,
0.4297428, -1.811741, 3.711353, 0, 0.01568628, 1, 1,
0.4316134, -0.347417, 1.435426, 0, 0.01176471, 1, 1,
0.436767, 0.7030208, -1.553791, 0, 0.003921569, 1, 1,
0.437599, -0.7038002, 2.135691, 0.003921569, 0, 1, 1,
0.4405043, 0.5062381, -0.1278191, 0.007843138, 0, 1, 1,
0.4418801, -0.546934, 2.901172, 0.01568628, 0, 1, 1,
0.4430514, -0.909445, 3.892453, 0.01960784, 0, 1, 1,
0.4468614, -0.4713939, 2.598482, 0.02745098, 0, 1, 1,
0.4479556, -0.2942965, 1.902704, 0.03137255, 0, 1, 1,
0.4504291, 0.2333897, 2.232078, 0.03921569, 0, 1, 1,
0.4586547, 0.5086144, 0.3455716, 0.04313726, 0, 1, 1,
0.460824, 0.04439767, 2.93697, 0.05098039, 0, 1, 1,
0.4620374, 0.1806708, 2.023335, 0.05490196, 0, 1, 1,
0.4623336, 0.8976715, 0.6179454, 0.0627451, 0, 1, 1,
0.4664803, -0.5764557, 2.590119, 0.06666667, 0, 1, 1,
0.4670494, 1.5891, -0.04325912, 0.07450981, 0, 1, 1,
0.4695873, 0.4292216, 1.152795, 0.07843138, 0, 1, 1,
0.4725718, -1.601568, 0.4666284, 0.08627451, 0, 1, 1,
0.4765114, 3.317265, 0.2916475, 0.09019608, 0, 1, 1,
0.4870067, -0.5358635, 1.554132, 0.09803922, 0, 1, 1,
0.4875983, -0.5361599, 2.707529, 0.1058824, 0, 1, 1,
0.4882628, 1.396744, 1.192845, 0.1098039, 0, 1, 1,
0.4890369, 1.503492, 0.8603482, 0.1176471, 0, 1, 1,
0.4915406, -0.6089184, 2.101691, 0.1215686, 0, 1, 1,
0.4989349, 0.5556381, 1.137705, 0.1294118, 0, 1, 1,
0.503721, 0.07089165, -0.1581113, 0.1333333, 0, 1, 1,
0.5075526, -0.5677792, 3.071906, 0.1411765, 0, 1, 1,
0.5085425, 0.1538472, 2.953982, 0.145098, 0, 1, 1,
0.5101277, 1.324757, 1.372671, 0.1529412, 0, 1, 1,
0.5101346, -0.1278552, 2.269419, 0.1568628, 0, 1, 1,
0.5122591, -1.228137, 4.016474, 0.1647059, 0, 1, 1,
0.5161279, -0.9316676, 4.985054, 0.1686275, 0, 1, 1,
0.5213854, 1.984193, 0.9809155, 0.1764706, 0, 1, 1,
0.5231524, -1.730208, 1.654739, 0.1803922, 0, 1, 1,
0.5260041, 2.079692, 0.3484741, 0.1882353, 0, 1, 1,
0.527553, 0.1056761, 2.37312, 0.1921569, 0, 1, 1,
0.5305948, 1.540666, -0.4432347, 0.2, 0, 1, 1,
0.5370446, 1.069252, 1.135269, 0.2078431, 0, 1, 1,
0.5414377, 0.80074, 0.6155024, 0.2117647, 0, 1, 1,
0.5464722, -0.7134302, 3.722401, 0.2196078, 0, 1, 1,
0.5470281, -0.5141761, 2.686714, 0.2235294, 0, 1, 1,
0.5479097, 1.281116, 1.697806, 0.2313726, 0, 1, 1,
0.5492696, -1.494266, 2.219996, 0.2352941, 0, 1, 1,
0.5509909, 1.378343, 0.3037302, 0.2431373, 0, 1, 1,
0.5510927, -0.1648393, 2.456294, 0.2470588, 0, 1, 1,
0.5566921, 0.2325687, 3.49695, 0.254902, 0, 1, 1,
0.5567975, -0.6159512, 4.303459, 0.2588235, 0, 1, 1,
0.5579946, -0.1847163, 2.683399, 0.2666667, 0, 1, 1,
0.5628985, -0.4445164, 2.789038, 0.2705882, 0, 1, 1,
0.5661333, -1.914026, 3.148968, 0.2784314, 0, 1, 1,
0.5670974, -0.07858405, 1.862516, 0.282353, 0, 1, 1,
0.5672844, 0.02739293, 1.263417, 0.2901961, 0, 1, 1,
0.5672915, 1.431644, 0.8960048, 0.2941177, 0, 1, 1,
0.571205, -0.4218594, 3.823347, 0.3019608, 0, 1, 1,
0.5747557, 0.4133673, 0.7375524, 0.3098039, 0, 1, 1,
0.5761954, -2.220684, 3.53933, 0.3137255, 0, 1, 1,
0.5780655, 0.2582753, 0.2268099, 0.3215686, 0, 1, 1,
0.580965, 0.8002593, 2.525653, 0.3254902, 0, 1, 1,
0.5882081, 0.4550443, 2.174398, 0.3333333, 0, 1, 1,
0.5911031, 0.3269058, 1.604415, 0.3372549, 0, 1, 1,
0.5943251, 2.469509, 0.2016786, 0.345098, 0, 1, 1,
0.5971524, 0.5988284, 1.933117, 0.3490196, 0, 1, 1,
0.5975686, -0.6186917, 4.076816, 0.3568628, 0, 1, 1,
0.598147, 0.5139141, 0.7393998, 0.3607843, 0, 1, 1,
0.6015231, -0.0383969, 1.106729, 0.3686275, 0, 1, 1,
0.6054177, 0.4550301, -1.336417, 0.372549, 0, 1, 1,
0.607414, 1.040884, 1.22109, 0.3803922, 0, 1, 1,
0.6121847, -0.8521004, 1.385682, 0.3843137, 0, 1, 1,
0.613309, -0.7410764, 2.653422, 0.3921569, 0, 1, 1,
0.615617, 3.387557, 0.7775738, 0.3960784, 0, 1, 1,
0.6157483, -0.2043997, 0.6527792, 0.4039216, 0, 1, 1,
0.6186948, 0.2036849, -0.4306369, 0.4117647, 0, 1, 1,
0.6193338, 0.4139753, -0.7475535, 0.4156863, 0, 1, 1,
0.6209701, -0.9854876, 3.151496, 0.4235294, 0, 1, 1,
0.6242102, 0.9128678, 0.8929589, 0.427451, 0, 1, 1,
0.6253486, -1.681027, 3.615308, 0.4352941, 0, 1, 1,
0.6271201, -0.8005434, 2.263371, 0.4392157, 0, 1, 1,
0.631717, -2.820339, 2.838943, 0.4470588, 0, 1, 1,
0.6334704, -0.2504065, 1.74143, 0.4509804, 0, 1, 1,
0.6341929, 0.8424187, 1.873223, 0.4588235, 0, 1, 1,
0.6460394, 0.532728, 2.181453, 0.4627451, 0, 1, 1,
0.6523093, -0.8020722, 1.73467, 0.4705882, 0, 1, 1,
0.6524487, 1.046881, -0.5600942, 0.4745098, 0, 1, 1,
0.6539355, -0.7881261, 3.456884, 0.4823529, 0, 1, 1,
0.6544982, 0.7589848, -0.1159174, 0.4862745, 0, 1, 1,
0.6547201, -0.5310173, 2.746383, 0.4941176, 0, 1, 1,
0.655987, -1.875967, 3.444678, 0.5019608, 0, 1, 1,
0.6607192, 0.4928714, 0.8475832, 0.5058824, 0, 1, 1,
0.6616306, -1.479086, 3.948574, 0.5137255, 0, 1, 1,
0.6632105, 1.46763, -0.250618, 0.5176471, 0, 1, 1,
0.6665962, -1.790265, 2.69839, 0.5254902, 0, 1, 1,
0.6705623, 1.712146, 0.1458382, 0.5294118, 0, 1, 1,
0.6807702, -0.4840609, 1.65524, 0.5372549, 0, 1, 1,
0.6846491, 0.4003821, 1.851458, 0.5411765, 0, 1, 1,
0.6911694, 0.2917882, 2.092212, 0.5490196, 0, 1, 1,
0.6923102, 0.615569, 0.5464784, 0.5529412, 0, 1, 1,
0.7005987, -0.7034255, 1.79511, 0.5607843, 0, 1, 1,
0.700828, -1.121692, 1.286875, 0.5647059, 0, 1, 1,
0.7018072, 0.2492124, 2.074224, 0.572549, 0, 1, 1,
0.7064564, -0.05010746, 0.9065408, 0.5764706, 0, 1, 1,
0.707548, -0.9554312, 2.886978, 0.5843138, 0, 1, 1,
0.7081117, -0.07786372, 2.477943, 0.5882353, 0, 1, 1,
0.7103778, -1.057157, 2.232603, 0.5960785, 0, 1, 1,
0.7119653, 0.3496332, 0.3983207, 0.6039216, 0, 1, 1,
0.7121083, 0.623684, 0.9920425, 0.6078432, 0, 1, 1,
0.7134926, 0.09200147, 0.3920734, 0.6156863, 0, 1, 1,
0.7149103, -1.550964, 3.775127, 0.6196079, 0, 1, 1,
0.7162336, -0.150469, 1.19761, 0.627451, 0, 1, 1,
0.7215217, 0.4110264, -0.2328395, 0.6313726, 0, 1, 1,
0.7220793, -0.8240028, 2.730889, 0.6392157, 0, 1, 1,
0.7231227, 0.1919962, 0.2082198, 0.6431373, 0, 1, 1,
0.7338744, 0.462633, 1.716176, 0.6509804, 0, 1, 1,
0.7341674, -0.3036895, 0.3450958, 0.654902, 0, 1, 1,
0.7364619, 0.8730586, 0.9389506, 0.6627451, 0, 1, 1,
0.7371261, 0.3760602, 1.064069, 0.6666667, 0, 1, 1,
0.7497226, -0.1948675, 2.850899, 0.6745098, 0, 1, 1,
0.7527111, -3.07847, 3.424971, 0.6784314, 0, 1, 1,
0.7576283, -0.8332637, 2.284874, 0.6862745, 0, 1, 1,
0.7613644, -0.1912164, -0.2478155, 0.6901961, 0, 1, 1,
0.7707143, 0.204539, 0.7737666, 0.6980392, 0, 1, 1,
0.7708852, 0.8953795, 0.5065406, 0.7058824, 0, 1, 1,
0.7743948, 0.758881, -0.8577856, 0.7098039, 0, 1, 1,
0.7744441, 0.2276019, 2.777753, 0.7176471, 0, 1, 1,
0.776346, -0.2597167, 1.188552, 0.7215686, 0, 1, 1,
0.7784408, -1.026956, 3.743866, 0.7294118, 0, 1, 1,
0.7799611, 0.2816485, 1.850378, 0.7333333, 0, 1, 1,
0.7803933, 0.6412628, 0.1108106, 0.7411765, 0, 1, 1,
0.7838808, 0.8985146, 0.592549, 0.7450981, 0, 1, 1,
0.7847891, 0.4116249, 1.076318, 0.7529412, 0, 1, 1,
0.7960036, 0.044587, 0.06247283, 0.7568628, 0, 1, 1,
0.8003508, 0.4702949, 1.74636, 0.7647059, 0, 1, 1,
0.8021384, -0.3790087, 0.4396362, 0.7686275, 0, 1, 1,
0.8048634, -0.8558062, 2.522697, 0.7764706, 0, 1, 1,
0.8065816, -1.190175, 2.238666, 0.7803922, 0, 1, 1,
0.8159478, -0.04680233, 1.203369, 0.7882353, 0, 1, 1,
0.8166029, -1.324278, 2.411267, 0.7921569, 0, 1, 1,
0.8181996, 0.3492296, 1.618469, 0.8, 0, 1, 1,
0.8206667, -1.026275, 2.844867, 0.8078431, 0, 1, 1,
0.8276039, -2.299767, 4.039444, 0.8117647, 0, 1, 1,
0.8288433, 1.012602, 0.6519455, 0.8196079, 0, 1, 1,
0.8315244, 1.046703, 1.691556, 0.8235294, 0, 1, 1,
0.8319397, 0.124672, 1.061507, 0.8313726, 0, 1, 1,
0.8324535, 0.80967, 0.6492897, 0.8352941, 0, 1, 1,
0.8324965, 2.189249, -0.1470144, 0.8431373, 0, 1, 1,
0.8459411, 0.01962481, 1.089556, 0.8470588, 0, 1, 1,
0.8465316, -0.4816322, 4.677819, 0.854902, 0, 1, 1,
0.8479013, 0.2438145, 2.234554, 0.8588235, 0, 1, 1,
0.8541684, -1.63824, 2.294516, 0.8666667, 0, 1, 1,
0.8561806, -0.06134747, 3.05176, 0.8705882, 0, 1, 1,
0.860114, -0.296064, 2.793744, 0.8784314, 0, 1, 1,
0.8621433, 0.1956658, 0.3444497, 0.8823529, 0, 1, 1,
0.8624748, 0.399947, 0.9583586, 0.8901961, 0, 1, 1,
0.8631296, -0.3636376, 1.538485, 0.8941177, 0, 1, 1,
0.8632024, -0.06762489, 1.667463, 0.9019608, 0, 1, 1,
0.8661782, -0.1855631, 2.633779, 0.9098039, 0, 1, 1,
0.8674766, -0.8505068, 0.501717, 0.9137255, 0, 1, 1,
0.8713615, 0.4988314, 2.278723, 0.9215686, 0, 1, 1,
0.8738562, 2.006106, 0.5571986, 0.9254902, 0, 1, 1,
0.877326, 1.469899, -2.031012, 0.9333333, 0, 1, 1,
0.8775092, -0.7399153, 1.591044, 0.9372549, 0, 1, 1,
0.8784057, -0.2965517, 2.239796, 0.945098, 0, 1, 1,
0.8796631, -0.5098819, 4.397213, 0.9490196, 0, 1, 1,
0.8807628, -2.678803, 2.683398, 0.9568627, 0, 1, 1,
0.8812585, -0.6253797, 2.887956, 0.9607843, 0, 1, 1,
0.8907314, -1.276821, 1.42207, 0.9686275, 0, 1, 1,
0.8985138, -0.936141, 0.7263817, 0.972549, 0, 1, 1,
0.9068528, -1.286849, 1.293257, 0.9803922, 0, 1, 1,
0.9078709, 0.2542507, 1.692694, 0.9843137, 0, 1, 1,
0.9090398, -0.5752053, 2.23119, 0.9921569, 0, 1, 1,
0.916255, -0.2200752, 2.117437, 0.9960784, 0, 1, 1,
0.9203892, -0.6987111, 2.400874, 1, 0, 0.9960784, 1,
0.9210057, -0.7429903, 3.500704, 1, 0, 0.9882353, 1,
0.9244254, 0.04734222, 2.097882, 1, 0, 0.9843137, 1,
0.93118, 0.535485, 1.981186, 1, 0, 0.9764706, 1,
0.9393049, -0.6565078, 1.588602, 1, 0, 0.972549, 1,
0.9415111, -0.3647465, 1.802216, 1, 0, 0.9647059, 1,
0.9469687, -1.103187, 2.279221, 1, 0, 0.9607843, 1,
0.9511737, -1.30311, 1.352376, 1, 0, 0.9529412, 1,
0.9525073, -0.3304409, 2.445041, 1, 0, 0.9490196, 1,
0.9542253, 0.2717894, 1.00176, 1, 0, 0.9411765, 1,
0.9645513, -0.9092581, 3.655336, 1, 0, 0.9372549, 1,
0.9716072, -0.6080629, 3.367346, 1, 0, 0.9294118, 1,
0.9781295, -1.08555, 2.511852, 1, 0, 0.9254902, 1,
0.9792344, -1.175172, 3.21357, 1, 0, 0.9176471, 1,
0.9821744, 0.3419589, 1.948833, 1, 0, 0.9137255, 1,
0.9967698, 0.06354538, 1.742898, 1, 0, 0.9058824, 1,
0.9980714, 0.3876789, 1.60498, 1, 0, 0.9019608, 1,
0.999408, -0.1332041, 0.07376517, 1, 0, 0.8941177, 1,
0.9999979, -0.6143727, 0.08778401, 1, 0, 0.8862745, 1,
1.004148, 0.7062777, 1.487447, 1, 0, 0.8823529, 1,
1.004944, -1.108596, 1.447742, 1, 0, 0.8745098, 1,
1.012091, -0.1281033, 0.9209545, 1, 0, 0.8705882, 1,
1.012196, 0.4073868, -0.1710881, 1, 0, 0.8627451, 1,
1.01288, -0.1948135, 2.201527, 1, 0, 0.8588235, 1,
1.015071, 2.145166, 0.6916571, 1, 0, 0.8509804, 1,
1.032545, -1.959644, 2.96823, 1, 0, 0.8470588, 1,
1.033399, 1.028994, 0.7441945, 1, 0, 0.8392157, 1,
1.033587, -1.123177, 2.54796, 1, 0, 0.8352941, 1,
1.050266, 1.737051, 0.6831967, 1, 0, 0.827451, 1,
1.051319, -1.607974, 1.378977, 1, 0, 0.8235294, 1,
1.061053, -2.062582, 2.624048, 1, 0, 0.8156863, 1,
1.070783, -1.728176, 2.473398, 1, 0, 0.8117647, 1,
1.085742, 0.7609903, 1.219266, 1, 0, 0.8039216, 1,
1.095442, 1.123209, -0.9219348, 1, 0, 0.7960784, 1,
1.100825, 0.4717387, 1.64374, 1, 0, 0.7921569, 1,
1.10238, 0.4891627, 1.792344, 1, 0, 0.7843137, 1,
1.109224, 0.1904516, 2.122009, 1, 0, 0.7803922, 1,
1.112735, -1.153705, 1.493915, 1, 0, 0.772549, 1,
1.112799, 1.060875, 1.151619, 1, 0, 0.7686275, 1,
1.114741, 0.8002645, 0.2761355, 1, 0, 0.7607843, 1,
1.120182, -0.9156967, 2.694886, 1, 0, 0.7568628, 1,
1.141278, 0.4721912, 0.600956, 1, 0, 0.7490196, 1,
1.147529, -0.04640652, 1.331602, 1, 0, 0.7450981, 1,
1.187388, 0.04191935, 1.633188, 1, 0, 0.7372549, 1,
1.194929, -0.2740804, 1.098362, 1, 0, 0.7333333, 1,
1.198851, 0.5318604, 1.171829, 1, 0, 0.7254902, 1,
1.203864, 0.5692287, 2.454592, 1, 0, 0.7215686, 1,
1.204321, 0.7779346, 1.553852, 1, 0, 0.7137255, 1,
1.20722, -1.28582, 2.83365, 1, 0, 0.7098039, 1,
1.208542, -0.08943859, 2.419541, 1, 0, 0.7019608, 1,
1.21148, -0.5944884, 2.689853, 1, 0, 0.6941177, 1,
1.217484, 0.1034979, 1.029372, 1, 0, 0.6901961, 1,
1.229958, -0.1232167, 0.4750554, 1, 0, 0.682353, 1,
1.230917, 0.8096566, -1.355177, 1, 0, 0.6784314, 1,
1.236711, 0.7871993, 0.8119577, 1, 0, 0.6705883, 1,
1.238689, -1.858103, 1.486858, 1, 0, 0.6666667, 1,
1.238947, -0.4316858, 1.413659, 1, 0, 0.6588235, 1,
1.239899, 0.1024563, 1.952676, 1, 0, 0.654902, 1,
1.240317, -0.7522646, 1.719294, 1, 0, 0.6470588, 1,
1.247213, -1.501763, 3.293065, 1, 0, 0.6431373, 1,
1.24953, -0.1463535, 5.03533, 1, 0, 0.6352941, 1,
1.255758, -1.069051, 3.957464, 1, 0, 0.6313726, 1,
1.255986, -0.4787471, 1.956165, 1, 0, 0.6235294, 1,
1.258477, 0.84555, -0.06463952, 1, 0, 0.6196079, 1,
1.267012, 1.896559, -1.443229, 1, 0, 0.6117647, 1,
1.267143, 0.7372356, -0.25888, 1, 0, 0.6078432, 1,
1.273126, 0.7490288, 0.7020513, 1, 0, 0.6, 1,
1.284071, -0.3677465, 2.465721, 1, 0, 0.5921569, 1,
1.290546, -0.1249391, 1.96202, 1, 0, 0.5882353, 1,
1.296028, 1.48578, -0.6568048, 1, 0, 0.5803922, 1,
1.306071, 0.7483379, 1.135463, 1, 0, 0.5764706, 1,
1.340718, -0.6753252, 1.411703, 1, 0, 0.5686275, 1,
1.343573, 2.038298, 0.5053574, 1, 0, 0.5647059, 1,
1.352325, -2.281159, 3.649943, 1, 0, 0.5568628, 1,
1.375826, -2.031957, 4.323671, 1, 0, 0.5529412, 1,
1.380371, 0.07957865, 0.9542771, 1, 0, 0.5450981, 1,
1.383045, 0.03432333, 1.357863, 1, 0, 0.5411765, 1,
1.399412, -1.792038, 0.9475146, 1, 0, 0.5333334, 1,
1.40781, 0.06349039, 3.314555, 1, 0, 0.5294118, 1,
1.41236, 0.1408476, 1.939464, 1, 0, 0.5215687, 1,
1.43099, -0.1659442, 1.983279, 1, 0, 0.5176471, 1,
1.436383, -3.344758, 3.735961, 1, 0, 0.509804, 1,
1.473248, -0.05082228, 2.332188, 1, 0, 0.5058824, 1,
1.477832, 0.5334993, 1.030626, 1, 0, 0.4980392, 1,
1.478913, -1.066642, 2.17023, 1, 0, 0.4901961, 1,
1.482408, 1.199808, 0.5237573, 1, 0, 0.4862745, 1,
1.490132, 0.69368, 0.1777451, 1, 0, 0.4784314, 1,
1.491868, -0.5836232, 2.710946, 1, 0, 0.4745098, 1,
1.499581, 0.04533213, 1.931196, 1, 0, 0.4666667, 1,
1.500801, 1.484172, -0.25953, 1, 0, 0.4627451, 1,
1.513237, -0.3215599, 2.112241, 1, 0, 0.454902, 1,
1.515534, -1.258532, 2.867743, 1, 0, 0.4509804, 1,
1.520428, 0.2980711, 2.382548, 1, 0, 0.4431373, 1,
1.524156, -1.118158, 2.453303, 1, 0, 0.4392157, 1,
1.533343, 0.8433381, 1.629965, 1, 0, 0.4313726, 1,
1.537736, -0.0888833, 0.7127367, 1, 0, 0.427451, 1,
1.543548, 1.002805, 1.379224, 1, 0, 0.4196078, 1,
1.551001, 2.150267, -0.0948831, 1, 0, 0.4156863, 1,
1.553794, -1.843435, 2.542216, 1, 0, 0.4078431, 1,
1.563847, -1.671949, 1.112587, 1, 0, 0.4039216, 1,
1.567874, 1.02369, 1.318589, 1, 0, 0.3960784, 1,
1.574116, -0.8664951, 1.202551, 1, 0, 0.3882353, 1,
1.588679, -0.04666903, 1.872072, 1, 0, 0.3843137, 1,
1.590541, 0.1518699, 1.868985, 1, 0, 0.3764706, 1,
1.600962, -0.5278592, 0.7765173, 1, 0, 0.372549, 1,
1.603215, 0.3346704, 3.586383, 1, 0, 0.3647059, 1,
1.603816, 0.03647159, 2.545659, 1, 0, 0.3607843, 1,
1.62123, -0.7072635, 2.410184, 1, 0, 0.3529412, 1,
1.639255, 0.4021527, 2.062813, 1, 0, 0.3490196, 1,
1.641862, 1.16473, 1.97163, 1, 0, 0.3411765, 1,
1.647104, 0.2675088, 0.6657415, 1, 0, 0.3372549, 1,
1.649756, 0.6040666, 0.2405774, 1, 0, 0.3294118, 1,
1.650543, 0.7342514, 0.7655397, 1, 0, 0.3254902, 1,
1.65571, -0.8389497, 0.2440151, 1, 0, 0.3176471, 1,
1.658638, 0.6717653, 1.247291, 1, 0, 0.3137255, 1,
1.659124, -0.5666345, 3.004384, 1, 0, 0.3058824, 1,
1.673754, -0.01139583, 0.08157264, 1, 0, 0.2980392, 1,
1.680336, -1.558337, 1.966656, 1, 0, 0.2941177, 1,
1.701536, 0.990837, 1.18913, 1, 0, 0.2862745, 1,
1.712985, -0.9878868, 2.05143, 1, 0, 0.282353, 1,
1.715638, -0.3810206, 0.1241711, 1, 0, 0.2745098, 1,
1.722016, -0.8804323, 2.896864, 1, 0, 0.2705882, 1,
1.731478, 0.7756788, 1.873332, 1, 0, 0.2627451, 1,
1.733696, -0.3554254, 0.3301877, 1, 0, 0.2588235, 1,
1.736639, -2.730734, 1.686553, 1, 0, 0.2509804, 1,
1.750029, -0.905314, 1.527154, 1, 0, 0.2470588, 1,
1.767227, -0.1783722, 2.175889, 1, 0, 0.2392157, 1,
1.788651, 0.4066313, 0.5740359, 1, 0, 0.2352941, 1,
1.798195, 0.1728275, 0.8855393, 1, 0, 0.227451, 1,
1.813851, -2.576991, 3.656329, 1, 0, 0.2235294, 1,
1.826589, -0.667755, 0.3280312, 1, 0, 0.2156863, 1,
1.829629, -0.5459284, 1.354604, 1, 0, 0.2117647, 1,
1.837066, -0.06494626, 3.253468, 1, 0, 0.2039216, 1,
1.839427, -2.297515, 1.499704, 1, 0, 0.1960784, 1,
1.842342, -1.530092, 1.912081, 1, 0, 0.1921569, 1,
1.84368, 0.8483192, 2.936977, 1, 0, 0.1843137, 1,
1.857014, 1.089572, 2.214272, 1, 0, 0.1803922, 1,
1.861803, 0.1199755, 1.554469, 1, 0, 0.172549, 1,
1.865148, 0.5004373, 1.72662, 1, 0, 0.1686275, 1,
1.886345, 0.09812985, 2.672275, 1, 0, 0.1607843, 1,
1.895474, -0.3527209, 2.457007, 1, 0, 0.1568628, 1,
1.909266, -1.464027, 1.851725, 1, 0, 0.1490196, 1,
1.911451, 0.2995544, 1.929228, 1, 0, 0.145098, 1,
1.933455, -0.7729688, 3.789211, 1, 0, 0.1372549, 1,
1.950341, 0.8551159, 0.9382433, 1, 0, 0.1333333, 1,
1.976464, -0.8739757, 2.357657, 1, 0, 0.1254902, 1,
1.980821, 1.64429, 0.3964967, 1, 0, 0.1215686, 1,
2.023996, 0.08404954, 1.682323, 1, 0, 0.1137255, 1,
2.032924, -0.7792951, -0.4006566, 1, 0, 0.1098039, 1,
2.047818, -0.8822631, 3.611612, 1, 0, 0.1019608, 1,
2.061279, 1.527759, 0.4832427, 1, 0, 0.09411765, 1,
2.064998, 0.5215134, 0.8147558, 1, 0, 0.09019608, 1,
2.100712, -0.3276947, 2.517965, 1, 0, 0.08235294, 1,
2.229131, -1.588349, 2.568352, 1, 0, 0.07843138, 1,
2.28256, -2.847914, 1.68322, 1, 0, 0.07058824, 1,
2.291532, -2.705522, 2.888392, 1, 0, 0.06666667, 1,
2.302837, -0.6132873, 2.695276, 1, 0, 0.05882353, 1,
2.319648, 0.3135377, 0.8127468, 1, 0, 0.05490196, 1,
2.352617, -0.1802662, 2.045394, 1, 0, 0.04705882, 1,
2.430362, -1.032593, 1.670994, 1, 0, 0.04313726, 1,
2.553117, 1.720744, 2.413812, 1, 0, 0.03529412, 1,
2.671945, -0.2977271, 0.2430288, 1, 0, 0.03137255, 1,
3.099359, -1.137825, 1.286104, 1, 0, 0.02352941, 1,
3.401224, -0.1950443, 2.733992, 1, 0, 0.01960784, 1,
3.967258, -1.043729, 2.373044, 1, 0, 0.01176471, 1,
4.888734, -0.04648499, 1.08322, 1, 0, 0.007843138, 1
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
0.7095658, -4.485885, -6.798759, 0, -0.5, 0.5, 0.5,
0.7095658, -4.485885, -6.798759, 1, -0.5, 0.5, 0.5,
0.7095658, -4.485885, -6.798759, 1, 1.5, 0.5, 0.5,
0.7095658, -4.485885, -6.798759, 0, 1.5, 0.5, 0.5
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
-4.886341, 0.0213995, -6.798759, 0, -0.5, 0.5, 0.5,
-4.886341, 0.0213995, -6.798759, 1, -0.5, 0.5, 0.5,
-4.886341, 0.0213995, -6.798759, 1, 1.5, 0.5, 0.5,
-4.886341, 0.0213995, -6.798759, 0, 1.5, 0.5, 0.5
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
-4.886341, -4.485885, 0.5802236, 0, -0.5, 0.5, 0.5,
-4.886341, -4.485885, 0.5802236, 1, -0.5, 0.5, 0.5,
-4.886341, -4.485885, 0.5802236, 1, 1.5, 0.5, 0.5,
-4.886341, -4.485885, 0.5802236, 0, 1.5, 0.5, 0.5
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
-2, -3.445743, -5.095917,
4, -3.445743, -5.095917,
-2, -3.445743, -5.095917,
-2, -3.6191, -5.379724,
0, -3.445743, -5.095917,
0, -3.6191, -5.379724,
2, -3.445743, -5.095917,
2, -3.6191, -5.379724,
4, -3.445743, -5.095917,
4, -3.6191, -5.379724
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
-2, -3.965814, -5.947338, 0, -0.5, 0.5, 0.5,
-2, -3.965814, -5.947338, 1, -0.5, 0.5, 0.5,
-2, -3.965814, -5.947338, 1, 1.5, 0.5, 0.5,
-2, -3.965814, -5.947338, 0, 1.5, 0.5, 0.5,
0, -3.965814, -5.947338, 0, -0.5, 0.5, 0.5,
0, -3.965814, -5.947338, 1, -0.5, 0.5, 0.5,
0, -3.965814, -5.947338, 1, 1.5, 0.5, 0.5,
0, -3.965814, -5.947338, 0, 1.5, 0.5, 0.5,
2, -3.965814, -5.947338, 0, -0.5, 0.5, 0.5,
2, -3.965814, -5.947338, 1, -0.5, 0.5, 0.5,
2, -3.965814, -5.947338, 1, 1.5, 0.5, 0.5,
2, -3.965814, -5.947338, 0, 1.5, 0.5, 0.5,
4, -3.965814, -5.947338, 0, -0.5, 0.5, 0.5,
4, -3.965814, -5.947338, 1, -0.5, 0.5, 0.5,
4, -3.965814, -5.947338, 1, 1.5, 0.5, 0.5,
4, -3.965814, -5.947338, 0, 1.5, 0.5, 0.5
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
-3.594978, -3, -5.095917,
-3.594978, 3, -5.095917,
-3.594978, -3, -5.095917,
-3.810205, -3, -5.379724,
-3.594978, -2, -5.095917,
-3.810205, -2, -5.379724,
-3.594978, -1, -5.095917,
-3.810205, -1, -5.379724,
-3.594978, 0, -5.095917,
-3.810205, 0, -5.379724,
-3.594978, 1, -5.095917,
-3.810205, 1, -5.379724,
-3.594978, 2, -5.095917,
-3.810205, 2, -5.379724,
-3.594978, 3, -5.095917,
-3.810205, 3, -5.379724
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
-4.240659, -3, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, -3, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, -3, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, -3, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, -2, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, -2, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, -2, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, -2, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, -1, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, -1, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, -1, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, -1, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, 0, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, 0, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, 0, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, 0, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, 1, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, 1, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, 1, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, 1, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, 2, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, 2, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, 2, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, 2, -5.947338, 0, 1.5, 0.5, 0.5,
-4.240659, 3, -5.947338, 0, -0.5, 0.5, 0.5,
-4.240659, 3, -5.947338, 1, -0.5, 0.5, 0.5,
-4.240659, 3, -5.947338, 1, 1.5, 0.5, 0.5,
-4.240659, 3, -5.947338, 0, 1.5, 0.5, 0.5
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
-3.594978, -3.445743, -4,
-3.594978, -3.445743, 6,
-3.594978, -3.445743, -4,
-3.810205, -3.6191, -4,
-3.594978, -3.445743, -2,
-3.810205, -3.6191, -2,
-3.594978, -3.445743, 0,
-3.810205, -3.6191, 0,
-3.594978, -3.445743, 2,
-3.810205, -3.6191, 2,
-3.594978, -3.445743, 4,
-3.810205, -3.6191, 4,
-3.594978, -3.445743, 6,
-3.810205, -3.6191, 6
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
-4.240659, -3.965814, -4, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, -4, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, -4, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, -4, 0, 1.5, 0.5, 0.5,
-4.240659, -3.965814, -2, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, -2, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, -2, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, -2, 0, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 0, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 0, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 0, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 0, 0, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 2, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 2, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 2, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 2, 0, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 4, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 4, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 4, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 4, 0, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 6, 0, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 6, 1, -0.5, 0.5, 0.5,
-4.240659, -3.965814, 6, 1, 1.5, 0.5, 0.5,
-4.240659, -3.965814, 6, 0, 1.5, 0.5, 0.5
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
-3.594978, -3.445743, -5.095917,
-3.594978, 3.488542, -5.095917,
-3.594978, -3.445743, 6.256364,
-3.594978, 3.488542, 6.256364,
-3.594978, -3.445743, -5.095917,
-3.594978, -3.445743, 6.256364,
-3.594978, 3.488542, -5.095917,
-3.594978, 3.488542, 6.256364,
-3.594978, -3.445743, -5.095917,
5.01411, -3.445743, -5.095917,
-3.594978, -3.445743, 6.256364,
5.01411, -3.445743, 6.256364,
-3.594978, 3.488542, -5.095917,
5.01411, 3.488542, -5.095917,
-3.594978, 3.488542, 6.256364,
5.01411, 3.488542, 6.256364,
5.01411, -3.445743, -5.095917,
5.01411, 3.488542, -5.095917,
5.01411, -3.445743, 6.256364,
5.01411, 3.488542, 6.256364,
5.01411, -3.445743, -5.095917,
5.01411, -3.445743, 6.256364,
5.01411, 3.488542, -5.095917,
5.01411, 3.488542, 6.256364
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
var radius = 8.461106;
var distance = 37.64442;
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
mvMatrix.translate( -0.7095658, -0.0213995, -0.5802236 );
mvMatrix.scale( 1.062635, 1.319287, 0.8058569 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.64442);
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
unden<-read.table("unden.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-unden$V2
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
```

```r
y<-unden$V3
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
```

```r
z<-unden$V4
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
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
-3.469603, -1.963777, -3.391281, 0, 0, 1, 1, 1,
-3.113056, 0.6095364, -2.233054, 1, 0, 0, 1, 1,
-2.770137, -0.5179319, -3.144299, 1, 0, 0, 1, 1,
-2.363405, 0.23152, -2.63609, 1, 0, 0, 1, 1,
-2.362581, -0.04951443, -0.1302801, 1, 0, 0, 1, 1,
-2.324683, -0.4929414, -2.925813, 1, 0, 0, 1, 1,
-2.312666, 0.453327, -3.451479, 0, 0, 0, 1, 1,
-2.285441, -1.131107, -2.813122, 0, 0, 0, 1, 1,
-2.244786, 1.978678, -1.429362, 0, 0, 0, 1, 1,
-2.237679, 0.09374961, -2.443821, 0, 0, 0, 1, 1,
-2.229516, 0.373073, -2.440708, 0, 0, 0, 1, 1,
-2.214942, 0.9373138, -3.009427, 0, 0, 0, 1, 1,
-2.20976, -0.1101775, -1.595008, 0, 0, 0, 1, 1,
-2.155428, 0.8111833, -0.5656646, 1, 1, 1, 1, 1,
-2.143481, 0.2729453, -0.5456417, 1, 1, 1, 1, 1,
-2.070698, -1.122748, -3.016595, 1, 1, 1, 1, 1,
-2.048257, -1.990492, -3.788803, 1, 1, 1, 1, 1,
-1.977379, 1.298572, -1.3839, 1, 1, 1, 1, 1,
-1.953744, 0.2410996, -2.70683, 1, 1, 1, 1, 1,
-1.930799, -1.302491, -2.416076, 1, 1, 1, 1, 1,
-1.858672, 0.04476627, -0.2792254, 1, 1, 1, 1, 1,
-1.85311, -1.097227, -2.637948, 1, 1, 1, 1, 1,
-1.820264, 1.715896, -1.084444, 1, 1, 1, 1, 1,
-1.805762, -0.1240996, -2.388383, 1, 1, 1, 1, 1,
-1.801293, -0.1732198, -3.591624, 1, 1, 1, 1, 1,
-1.770753, -0.2059076, 0.2455104, 1, 1, 1, 1, 1,
-1.765176, -0.1743487, -0.6633688, 1, 1, 1, 1, 1,
-1.741451, 0.5877597, -0.4342042, 1, 1, 1, 1, 1,
-1.733538, -0.6750571, 0.1032609, 0, 0, 1, 1, 1,
-1.733108, 2.125265, -1.895068, 1, 0, 0, 1, 1,
-1.729446, -0.9992798, -1.548661, 1, 0, 0, 1, 1,
-1.700481, 2.118177, -1.712789, 1, 0, 0, 1, 1,
-1.687846, 0.3104641, -1.594715, 1, 0, 0, 1, 1,
-1.685934, 0.7103742, 0.6262316, 1, 0, 0, 1, 1,
-1.683069, 0.2925847, -1.539427, 0, 0, 0, 1, 1,
-1.67513, -0.499334, -3.528968, 0, 0, 0, 1, 1,
-1.668417, 0.7810679, -0.2847234, 0, 0, 0, 1, 1,
-1.661219, -1.543501, -1.470592, 0, 0, 0, 1, 1,
-1.659806, 0.5453331, -0.3176894, 0, 0, 0, 1, 1,
-1.651051, 0.620314, -1.163782, 0, 0, 0, 1, 1,
-1.650327, 0.979216, -0.7432038, 0, 0, 0, 1, 1,
-1.641226, 0.9600996, -0.2828267, 1, 1, 1, 1, 1,
-1.637681, -0.6837961, -3.785402, 1, 1, 1, 1, 1,
-1.633185, -1.387266, -2.944028, 1, 1, 1, 1, 1,
-1.616508, 0.7818397, -2.155926, 1, 1, 1, 1, 1,
-1.611815, 0.8773072, -0.2492885, 1, 1, 1, 1, 1,
-1.598067, -0.4889207, -3.338123, 1, 1, 1, 1, 1,
-1.596656, 0.9499852, -1.10089, 1, 1, 1, 1, 1,
-1.593716, -0.7117313, -1.283472, 1, 1, 1, 1, 1,
-1.581668, -0.8100361, -0.7698457, 1, 1, 1, 1, 1,
-1.579206, -1.699431, -1.974664, 1, 1, 1, 1, 1,
-1.577275, -1.299949, -1.587024, 1, 1, 1, 1, 1,
-1.565293, 0.9213087, -2.159264, 1, 1, 1, 1, 1,
-1.549891, -0.5642354, -2.335826, 1, 1, 1, 1, 1,
-1.536306, 0.728028, -0.8049068, 1, 1, 1, 1, 1,
-1.535657, 0.2180033, -0.8065987, 1, 1, 1, 1, 1,
-1.506964, 1.121598, -0.6899463, 0, 0, 1, 1, 1,
-1.5036, 0.2221265, -0.6598208, 1, 0, 0, 1, 1,
-1.502141, 2.320463, -1.583538, 1, 0, 0, 1, 1,
-1.489632, -0.582741, -1.58505, 1, 0, 0, 1, 1,
-1.488877, 0.194436, -0.2896187, 1, 0, 0, 1, 1,
-1.486591, -0.2348511, -1.413484, 1, 0, 0, 1, 1,
-1.478821, 0.2172943, -3.081544, 0, 0, 0, 1, 1,
-1.476177, -0.9543399, -3.152765, 0, 0, 0, 1, 1,
-1.466803, 0.1398055, -0.6922686, 0, 0, 0, 1, 1,
-1.455657, -0.2631631, -2.852586, 0, 0, 0, 1, 1,
-1.452517, -0.1400625, -0.7246766, 0, 0, 0, 1, 1,
-1.448289, -1.87358, -2.399915, 0, 0, 0, 1, 1,
-1.442224, 0.1973151, -1.192693, 0, 0, 0, 1, 1,
-1.437898, -0.8071968, -2.849404, 1, 1, 1, 1, 1,
-1.407184, 1.600987, -0.5300743, 1, 1, 1, 1, 1,
-1.406261, 0.7153988, -0.8334633, 1, 1, 1, 1, 1,
-1.4019, -0.489811, -2.754073, 1, 1, 1, 1, 1,
-1.391881, -0.5205533, -3.134855, 1, 1, 1, 1, 1,
-1.38488, 1.600151, 1.134838, 1, 1, 1, 1, 1,
-1.38285, -1.44753, -0.7094537, 1, 1, 1, 1, 1,
-1.381091, 0.1531586, -0.7723448, 1, 1, 1, 1, 1,
-1.376486, -0.3583904, -3.883729, 1, 1, 1, 1, 1,
-1.373862, -0.02836736, -1.479317, 1, 1, 1, 1, 1,
-1.370548, 0.5180421, -2.484741, 1, 1, 1, 1, 1,
-1.370228, 1.134639, -0.3570773, 1, 1, 1, 1, 1,
-1.369943, -0.09756996, -0.4377707, 1, 1, 1, 1, 1,
-1.367666, 0.682312, 0.5111833, 1, 1, 1, 1, 1,
-1.362844, -0.05749914, -2.880224, 1, 1, 1, 1, 1,
-1.352761, 0.8156803, 1.6779, 0, 0, 1, 1, 1,
-1.350568, -1.109815, -1.869131, 1, 0, 0, 1, 1,
-1.325595, -0.122054, -0.6165626, 1, 0, 0, 1, 1,
-1.316845, 2.234657, -0.8721406, 1, 0, 0, 1, 1,
-1.31584, 0.342899, -1.64068, 1, 0, 0, 1, 1,
-1.311945, 2.114522, 0.6512856, 1, 0, 0, 1, 1,
-1.303179, -0.7612302, -1.471513, 0, 0, 0, 1, 1,
-1.30269, 1.463379, -1.315773, 0, 0, 0, 1, 1,
-1.295902, -1.33873, -1.717497, 0, 0, 0, 1, 1,
-1.283128, 0.7196542, -1.985479, 0, 0, 0, 1, 1,
-1.281053, 0.5497089, -2.150835, 0, 0, 0, 1, 1,
-1.278565, 1.769591, 0.1340955, 0, 0, 0, 1, 1,
-1.276889, -0.7810594, -2.217842, 0, 0, 0, 1, 1,
-1.268007, 0.06439514, -0.5144598, 1, 1, 1, 1, 1,
-1.25447, 0.9587953, 1.040629, 1, 1, 1, 1, 1,
-1.253308, 0.4155933, 0.9806458, 1, 1, 1, 1, 1,
-1.246625, 0.9499949, -1.26567, 1, 1, 1, 1, 1,
-1.233915, 2.011734, -0.7410153, 1, 1, 1, 1, 1,
-1.232527, -1.117025, -3.033039, 1, 1, 1, 1, 1,
-1.230988, 0.4918105, -0.3255394, 1, 1, 1, 1, 1,
-1.221325, 0.1639254, -1.434287, 1, 1, 1, 1, 1,
-1.221031, 0.9988692, -1.042922, 1, 1, 1, 1, 1,
-1.216457, 1.863188, -1.303621, 1, 1, 1, 1, 1,
-1.192968, -0.5982558, -2.454507, 1, 1, 1, 1, 1,
-1.191237, -0.7189746, -0.6787043, 1, 1, 1, 1, 1,
-1.189246, 0.2893324, 0.3160466, 1, 1, 1, 1, 1,
-1.184997, -0.6521703, -2.738878, 1, 1, 1, 1, 1,
-1.184616, -0.484006, -4.132858, 1, 1, 1, 1, 1,
-1.180527, -0.7297638, -1.599796, 0, 0, 1, 1, 1,
-1.17908, -0.6000701, -0.5715576, 1, 0, 0, 1, 1,
-1.17829, 1.592597, -1.12149, 1, 0, 0, 1, 1,
-1.174916, -0.8389944, -1.475786, 1, 0, 0, 1, 1,
-1.167498, 1.256026, -1.229768, 1, 0, 0, 1, 1,
-1.152162, 1.493283, 0.3895046, 1, 0, 0, 1, 1,
-1.140908, 0.9441752, -2.026527, 0, 0, 0, 1, 1,
-1.134166, 0.3264062, -0.7028662, 0, 0, 0, 1, 1,
-1.128937, -1.422983, -2.387026, 0, 0, 0, 1, 1,
-1.12839, 1.893302, -1.263361, 0, 0, 0, 1, 1,
-1.121301, -1.71946, -2.969712, 0, 0, 0, 1, 1,
-1.117693, -0.3060223, -2.014274, 0, 0, 0, 1, 1,
-1.107251, -0.4076767, -1.364458, 0, 0, 0, 1, 1,
-1.100143, -0.5466467, -1.403875, 1, 1, 1, 1, 1,
-1.095184, 1.636354, -1.03772, 1, 1, 1, 1, 1,
-1.093288, 0.5434698, -0.01870283, 1, 1, 1, 1, 1,
-1.090383, -1.098888, -1.676718, 1, 1, 1, 1, 1,
-1.089265, -0.7654579, -2.168718, 1, 1, 1, 1, 1,
-1.087873, 1.156631, 0.5655303, 1, 1, 1, 1, 1,
-1.079057, 0.2812728, -2.029164, 1, 1, 1, 1, 1,
-1.070329, -0.3949032, -3.264216, 1, 1, 1, 1, 1,
-1.068352, -0.2659676, -0.6227443, 1, 1, 1, 1, 1,
-1.060346, -0.02349391, -1.585598, 1, 1, 1, 1, 1,
-1.058138, 0.3340432, -0.8371799, 1, 1, 1, 1, 1,
-1.054353, 0.0851393, -3.49307, 1, 1, 1, 1, 1,
-1.049712, 0.09993461, -3.72288, 1, 1, 1, 1, 1,
-1.046677, -1.685151, -2.706252, 1, 1, 1, 1, 1,
-1.044065, 1.336409, -0.3323216, 1, 1, 1, 1, 1,
-1.043281, -1.267271, -2.311482, 0, 0, 1, 1, 1,
-1.032959, 0.08380752, -1.580678, 1, 0, 0, 1, 1,
-1.026768, 1.154568, 0.009310954, 1, 0, 0, 1, 1,
-1.026545, -0.7514803, -1.560989, 1, 0, 0, 1, 1,
-1.023357, 1.039995, -0.8356309, 1, 0, 0, 1, 1,
-1.016942, 2.284679, -2.031612, 1, 0, 0, 1, 1,
-1.01682, 1.775454, -2.091596, 0, 0, 0, 1, 1,
-1.006004, 0.9877292, 0.3632911, 0, 0, 0, 1, 1,
-0.9884592, -1.143426, -3.341466, 0, 0, 0, 1, 1,
-0.9873878, 1.277216, 0.8010314, 0, 0, 0, 1, 1,
-0.9867415, -1.851737, -2.495288, 0, 0, 0, 1, 1,
-0.9838983, -0.6920261, -1.614359, 0, 0, 0, 1, 1,
-0.9814306, 0.9715231, -0.07240357, 0, 0, 0, 1, 1,
-0.9771937, 0.9832142, -0.6629248, 1, 1, 1, 1, 1,
-0.9759182, -1.668476, -3.614306, 1, 1, 1, 1, 1,
-0.973364, -0.4818424, -1.030192, 1, 1, 1, 1, 1,
-0.9727385, -0.1590162, 0.4411647, 1, 1, 1, 1, 1,
-0.9670986, -0.9208101, -2.866031, 1, 1, 1, 1, 1,
-0.9636929, -0.2319297, -0.1870835, 1, 1, 1, 1, 1,
-0.9634014, -0.2589993, -2.099947, 1, 1, 1, 1, 1,
-0.9596449, 0.5715561, -1.639209, 1, 1, 1, 1, 1,
-0.9590541, -0.015469, -2.177788, 1, 1, 1, 1, 1,
-0.9578226, 1.777678, 1.309431, 1, 1, 1, 1, 1,
-0.9568086, 0.7091392, -0.1828454, 1, 1, 1, 1, 1,
-0.9560233, -0.06923901, -2.446144, 1, 1, 1, 1, 1,
-0.9555341, 0.5307973, -0.5488913, 1, 1, 1, 1, 1,
-0.9532238, -1.49238, -1.357341, 1, 1, 1, 1, 1,
-0.9519539, -0.7903128, -2.608186, 1, 1, 1, 1, 1,
-0.9507384, -1.120463, -2.183026, 0, 0, 1, 1, 1,
-0.9507316, 1.09164, -0.297171, 1, 0, 0, 1, 1,
-0.9507169, 0.4696828, -3.014737, 1, 0, 0, 1, 1,
-0.948755, 0.625273, -1.376188, 1, 0, 0, 1, 1,
-0.9454653, -0.4522494, -1.209525, 1, 0, 0, 1, 1,
-0.9405804, -1.057911, -2.199088, 1, 0, 0, 1, 1,
-0.9344491, -0.4455988, -1.38664, 0, 0, 0, 1, 1,
-0.9321374, -0.06088464, -0.1930666, 0, 0, 0, 1, 1,
-0.9297895, 0.7048419, 0.5553297, 0, 0, 0, 1, 1,
-0.9279216, -1.046799, -2.537788, 0, 0, 0, 1, 1,
-0.9275408, -1.421172, -2.257177, 0, 0, 0, 1, 1,
-0.9268075, 0.189937, -0.2369439, 0, 0, 0, 1, 1,
-0.9229375, -0.1573008, -1.627871, 0, 0, 0, 1, 1,
-0.9198559, 1.209676, -1.458024, 1, 1, 1, 1, 1,
-0.9134482, 0.5768888, -2.664001, 1, 1, 1, 1, 1,
-0.9090376, 0.7866162, -1.025938, 1, 1, 1, 1, 1,
-0.9025781, 0.2048128, -1.029644, 1, 1, 1, 1, 1,
-0.9013836, 0.7415183, -0.8531765, 1, 1, 1, 1, 1,
-0.8996051, -0.1558193, -0.9557377, 1, 1, 1, 1, 1,
-0.8964521, -1.827689, -1.454853, 1, 1, 1, 1, 1,
-0.8924119, -2.09624, -3.780374, 1, 1, 1, 1, 1,
-0.8891289, 0.3953133, -2.343355, 1, 1, 1, 1, 1,
-0.8891184, 0.4238481, -1.019707, 1, 1, 1, 1, 1,
-0.8845569, 0.5396712, -0.2517685, 1, 1, 1, 1, 1,
-0.8811963, -0.4235777, -2.808752, 1, 1, 1, 1, 1,
-0.8803487, 1.157642, -1.03285, 1, 1, 1, 1, 1,
-0.8799542, 0.04892509, -1.549683, 1, 1, 1, 1, 1,
-0.874702, -0.1249129, -1.942817, 1, 1, 1, 1, 1,
-0.8715823, 0.335462, -0.09573241, 0, 0, 1, 1, 1,
-0.8673306, 0.8720815, 0.07314018, 1, 0, 0, 1, 1,
-0.8644885, 0.6080702, -1.06822, 1, 0, 0, 1, 1,
-0.8610384, -1.054588, -1.798144, 1, 0, 0, 1, 1,
-0.8591257, 0.1228731, -0.8264553, 1, 0, 0, 1, 1,
-0.8562143, -1.202734, -2.41398, 1, 0, 0, 1, 1,
-0.8467208, -0.7359421, -3.443184, 0, 0, 0, 1, 1,
-0.8441415, -0.3672947, -1.279915, 0, 0, 0, 1, 1,
-0.8429875, -0.1258242, -0.4357062, 0, 0, 0, 1, 1,
-0.8426759, -1.709891, -1.30914, 0, 0, 0, 1, 1,
-0.8387175, 0.3694591, 0.162834, 0, 0, 0, 1, 1,
-0.8384969, 0.287891, -1.213902, 0, 0, 0, 1, 1,
-0.8359228, -0.9943669, -2.129205, 0, 0, 0, 1, 1,
-0.8267294, 0.5785373, -0.1141382, 1, 1, 1, 1, 1,
-0.8253196, -2.47158, -4.429513, 1, 1, 1, 1, 1,
-0.8243263, 1.663584, -2.45857, 1, 1, 1, 1, 1,
-0.8240498, 0.3473997, -2.2653, 1, 1, 1, 1, 1,
-0.8179781, 1.126237, -0.9149263, 1, 1, 1, 1, 1,
-0.8167607, -0.6235307, -1.771855, 1, 1, 1, 1, 1,
-0.816749, 0.6523353, -1.407533, 1, 1, 1, 1, 1,
-0.8150495, -1.397586, -1.540138, 1, 1, 1, 1, 1,
-0.8146504, -0.8894643, -2.348214, 1, 1, 1, 1, 1,
-0.8143825, 1.544868, 0.2366377, 1, 1, 1, 1, 1,
-0.8062947, 2.531431, -0.9286348, 1, 1, 1, 1, 1,
-0.8058022, -0.09207399, -2.964088, 1, 1, 1, 1, 1,
-0.8038843, -1.071659, -1.942132, 1, 1, 1, 1, 1,
-0.7931091, 0.4763034, -1.844521, 1, 1, 1, 1, 1,
-0.7912996, 0.09268807, -0.5042189, 1, 1, 1, 1, 1,
-0.7876638, 0.7531345, -1.99832, 0, 0, 1, 1, 1,
-0.7811587, 0.5357857, -0.6149879, 1, 0, 0, 1, 1,
-0.7800666, -0.492446, -0.9984369, 1, 0, 0, 1, 1,
-0.7771574, 0.04861893, 0.1039451, 1, 0, 0, 1, 1,
-0.768258, -0.06462571, -1.857123, 1, 0, 0, 1, 1,
-0.767643, 0.9067534, -1.156181, 1, 0, 0, 1, 1,
-0.7653674, 1.805204, 2.020315, 0, 0, 0, 1, 1,
-0.7629377, 1.125558, -0.1407831, 0, 0, 0, 1, 1,
-0.759929, 2.037512, 0.3475032, 0, 0, 0, 1, 1,
-0.7584696, 1.215768, -2.284001, 0, 0, 0, 1, 1,
-0.758252, 1.091388, -2.015229, 0, 0, 0, 1, 1,
-0.7581813, 0.6908306, -0.3517244, 0, 0, 0, 1, 1,
-0.7520652, -0.5153055, -2.313496, 0, 0, 0, 1, 1,
-0.7516043, -0.5857251, -1.202263, 1, 1, 1, 1, 1,
-0.7411571, 0.4193601, -1.45078, 1, 1, 1, 1, 1,
-0.7377643, 0.7349654, 0.03037905, 1, 1, 1, 1, 1,
-0.7351457, 1.178426, -0.5434273, 1, 1, 1, 1, 1,
-0.7342581, -0.7957417, -3.237525, 1, 1, 1, 1, 1,
-0.7337201, -1.512154, -1.689964, 1, 1, 1, 1, 1,
-0.7322414, 0.008929466, -1.747331, 1, 1, 1, 1, 1,
-0.7301581, 2.060253, -0.5189605, 1, 1, 1, 1, 1,
-0.7273349, -1.315088, -3.488743, 1, 1, 1, 1, 1,
-0.7216305, -0.5468348, -0.9552208, 1, 1, 1, 1, 1,
-0.7169687, 0.09853119, -2.429144, 1, 1, 1, 1, 1,
-0.7097992, -0.4832393, -4.136586, 1, 1, 1, 1, 1,
-0.7083562, -0.7873147, -1.327407, 1, 1, 1, 1, 1,
-0.7055733, -0.1461259, -2.20527, 1, 1, 1, 1, 1,
-0.6978211, 0.9382234, -1.572483, 1, 1, 1, 1, 1,
-0.6892047, 0.8611434, -1.403981, 0, 0, 1, 1, 1,
-0.6873016, 2.634657, 0.4211878, 1, 0, 0, 1, 1,
-0.6828595, 0.6296304, -0.9385303, 1, 0, 0, 1, 1,
-0.6802492, -1.060762, -0.6649808, 1, 0, 0, 1, 1,
-0.6761679, 0.4767333, -0.9976991, 1, 0, 0, 1, 1,
-0.6759895, -0.3480354, -1.68234, 1, 0, 0, 1, 1,
-0.6700953, -1.706655, -2.886936, 0, 0, 0, 1, 1,
-0.6693146, 0.5030727, 0.2668987, 0, 0, 0, 1, 1,
-0.6673927, -1.76642, -2.638896, 0, 0, 0, 1, 1,
-0.6660895, -0.367234, -0.7672437, 0, 0, 0, 1, 1,
-0.6660856, -0.3762861, -2.998427, 0, 0, 0, 1, 1,
-0.6655439, 0.5057625, 0.7779404, 0, 0, 0, 1, 1,
-0.6615142, 0.2911178, -2.657284, 0, 0, 0, 1, 1,
-0.6548073, -0.2473686, -2.675881, 1, 1, 1, 1, 1,
-0.6544247, 0.1224945, -0.2788936, 1, 1, 1, 1, 1,
-0.6534058, 0.4517354, -1.475338, 1, 1, 1, 1, 1,
-0.6422638, -0.4533522, -2.936741, 1, 1, 1, 1, 1,
-0.6356514, -0.3843981, -1.585989, 1, 1, 1, 1, 1,
-0.6279629, -1.974604, -1.865463, 1, 1, 1, 1, 1,
-0.6269019, -0.4733466, -2.602118, 1, 1, 1, 1, 1,
-0.6265669, 1.129971, 0.3441376, 1, 1, 1, 1, 1,
-0.6262465, -0.1588613, -1.022287, 1, 1, 1, 1, 1,
-0.6215725, -0.601781, -1.247957, 1, 1, 1, 1, 1,
-0.6204662, -0.2131208, -1.446276, 1, 1, 1, 1, 1,
-0.6191345, 0.3154048, -0.5328887, 1, 1, 1, 1, 1,
-0.6165984, -0.2316859, -2.05103, 1, 1, 1, 1, 1,
-0.6144935, 1.213774, -1.235573, 1, 1, 1, 1, 1,
-0.6129103, 0.8865055, 1.075972, 1, 1, 1, 1, 1,
-0.6124102, -0.3727737, -1.924009, 0, 0, 1, 1, 1,
-0.6121967, 1.002295, 0.9038595, 1, 0, 0, 1, 1,
-0.611123, 1.380323, -0.2104026, 1, 0, 0, 1, 1,
-0.607326, -0.0009820432, -1.553632, 1, 0, 0, 1, 1,
-0.5992022, 0.6534142, -0.4176995, 1, 0, 0, 1, 1,
-0.5938752, -0.4312849, -1.622065, 1, 0, 0, 1, 1,
-0.5923589, -1.108416, -2.975152, 0, 0, 0, 1, 1,
-0.5883155, -0.8373561, -2.515605, 0, 0, 0, 1, 1,
-0.5845128, -0.1535805, -2.632999, 0, 0, 0, 1, 1,
-0.5813655, -0.05861947, -2.34792, 0, 0, 0, 1, 1,
-0.5755777, 1.264854, -0.6898776, 0, 0, 0, 1, 1,
-0.574171, -0.3285857, -2.988773, 0, 0, 0, 1, 1,
-0.5694486, -2.199573, -3.49113, 0, 0, 0, 1, 1,
-0.5667465, 0.3181291, -0.5181333, 1, 1, 1, 1, 1,
-0.5617021, -0.4166191, -1.786349, 1, 1, 1, 1, 1,
-0.5559961, -1.086654, -2.958438, 1, 1, 1, 1, 1,
-0.5545829, -1.119426, -1.857113, 1, 1, 1, 1, 1,
-0.553193, -0.1045819, -1.439892, 1, 1, 1, 1, 1,
-0.5467721, -1.142334, -3.356329, 1, 1, 1, 1, 1,
-0.5439118, -0.3208838, -1.238274, 1, 1, 1, 1, 1,
-0.5435813, -0.578062, -2.806771, 1, 1, 1, 1, 1,
-0.5418742, -0.3971057, 0.09620323, 1, 1, 1, 1, 1,
-0.5394262, -0.9667161, -2.985521, 1, 1, 1, 1, 1,
-0.5377954, -0.7086564, -1.98647, 1, 1, 1, 1, 1,
-0.5337219, 0.7190123, 0.382654, 1, 1, 1, 1, 1,
-0.525767, -0.474811, -2.843639, 1, 1, 1, 1, 1,
-0.524515, 0.9141603, -0.812932, 1, 1, 1, 1, 1,
-0.521428, -1.631231, -2.684518, 1, 1, 1, 1, 1,
-0.5213639, -1.21637, -3.931157, 0, 0, 1, 1, 1,
-0.5204798, 0.1251061, -1.815436, 1, 0, 0, 1, 1,
-0.5178403, -1.576408, -3.934762, 1, 0, 0, 1, 1,
-0.5168802, -0.5365783, -2.410602, 1, 0, 0, 1, 1,
-0.5132182, -0.5798277, -2.68072, 1, 0, 0, 1, 1,
-0.5129853, 0.8403354, -0.2341483, 1, 0, 0, 1, 1,
-0.5116856, -0.6847459, -3.730169, 0, 0, 0, 1, 1,
-0.5114144, -1.630807, -4.930592, 0, 0, 0, 1, 1,
-0.5077856, 0.6933535, -0.9770097, 0, 0, 0, 1, 1,
-0.5055886, 0.6974988, -1.601117, 0, 0, 0, 1, 1,
-0.5044137, 1.544059, -1.752587, 0, 0, 0, 1, 1,
-0.5021162, -0.3042746, -2.834114, 0, 0, 0, 1, 1,
-0.5007049, 0.5599253, -0.9938533, 0, 0, 0, 1, 1,
-0.498469, 1.069726, -2.34107, 1, 1, 1, 1, 1,
-0.4975767, 1.049575, -1.421857, 1, 1, 1, 1, 1,
-0.4945783, -0.5775948, -3.9354, 1, 1, 1, 1, 1,
-0.4915057, -2.715693, -2.279329, 1, 1, 1, 1, 1,
-0.4883973, -0.6152658, -3.77514, 1, 1, 1, 1, 1,
-0.4880391, 1.214894, -0.6548454, 1, 1, 1, 1, 1,
-0.4856066, 0.1452181, -3.019736, 1, 1, 1, 1, 1,
-0.4793637, -0.5157737, -2.626611, 1, 1, 1, 1, 1,
-0.476831, -0.8859947, -0.4804878, 1, 1, 1, 1, 1,
-0.4766369, -0.944571, -2.71466, 1, 1, 1, 1, 1,
-0.471558, 0.6361136, 0.1976457, 1, 1, 1, 1, 1,
-0.4629158, 1.360336, -0.5980304, 1, 1, 1, 1, 1,
-0.4590747, -1.306135, -2.695748, 1, 1, 1, 1, 1,
-0.4563956, -0.4901526, -1.587377, 1, 1, 1, 1, 1,
-0.447487, -1.10365, -1.106248, 1, 1, 1, 1, 1,
-0.4473027, 0.3574732, -1.176217, 0, 0, 1, 1, 1,
-0.4470009, -1.635109, -4.154894, 1, 0, 0, 1, 1,
-0.4370478, -0.5023885, -2.91122, 1, 0, 0, 1, 1,
-0.4368689, -0.1718916, -2.802216, 1, 0, 0, 1, 1,
-0.4342551, 0.2862836, -1.243038, 1, 0, 0, 1, 1,
-0.4339615, -1.087713, -4.070199, 1, 0, 0, 1, 1,
-0.4337154, 2.262179, -0.5672262, 0, 0, 0, 1, 1,
-0.4312543, -1.912454, -2.691739, 0, 0, 0, 1, 1,
-0.4301801, 0.3990526, -0.7836772, 0, 0, 0, 1, 1,
-0.4295271, -0.8861445, -3.277083, 0, 0, 0, 1, 1,
-0.4286789, 0.7683393, -2.309963, 0, 0, 0, 1, 1,
-0.4258682, 0.6393475, -0.6124388, 0, 0, 0, 1, 1,
-0.4115971, -0.2767345, -0.7528949, 0, 0, 0, 1, 1,
-0.3993605, -0.2280496, -1.587738, 1, 1, 1, 1, 1,
-0.3985594, 1.253747, -2.631487, 1, 1, 1, 1, 1,
-0.3976133, 2.692842, -0.5827618, 1, 1, 1, 1, 1,
-0.396121, -1.005993, -0.5031925, 1, 1, 1, 1, 1,
-0.3908492, 0.5014375, -0.2906171, 1, 1, 1, 1, 1,
-0.3897589, -0.05856803, -2.073725, 1, 1, 1, 1, 1,
-0.3883966, -0.552319, -3.941906, 1, 1, 1, 1, 1,
-0.3855849, 0.9901752, 1.587539, 1, 1, 1, 1, 1,
-0.3854525, -0.313279, -2.693407, 1, 1, 1, 1, 1,
-0.3822252, 0.6156682, -0.4825191, 1, 1, 1, 1, 1,
-0.3821326, 0.1137998, 0.2909437, 1, 1, 1, 1, 1,
-0.3772562, -0.219769, -2.665392, 1, 1, 1, 1, 1,
-0.3755, -0.3867267, -2.547163, 1, 1, 1, 1, 1,
-0.3751238, 0.9691621, -0.8606911, 1, 1, 1, 1, 1,
-0.3707953, -2.023, -3.286141, 1, 1, 1, 1, 1,
-0.3642352, 0.5417361, -2.568249, 0, 0, 1, 1, 1,
-0.3589962, 1.515229, -0.7944977, 1, 0, 0, 1, 1,
-0.3505215, 1.733194, -0.7629928, 1, 0, 0, 1, 1,
-0.3499013, -0.5322505, -2.41566, 1, 0, 0, 1, 1,
-0.3423695, -0.1395466, -1.959351, 1, 0, 0, 1, 1,
-0.339716, -0.1010645, -2.633721, 1, 0, 0, 1, 1,
-0.3364542, 0.06109778, -0.4249671, 0, 0, 0, 1, 1,
-0.3356502, 0.05517932, -0.3702194, 0, 0, 0, 1, 1,
-0.3293444, 2.328972, -1.573478, 0, 0, 0, 1, 1,
-0.3278098, 1.325418, -1.05351, 0, 0, 0, 1, 1,
-0.3274868, -2.0536, -3.068329, 0, 0, 0, 1, 1,
-0.3249828, -0.506899, -3.12472, 0, 0, 0, 1, 1,
-0.3240576, 0.6369405, 0.0645401, 0, 0, 0, 1, 1,
-0.3236986, -0.6620727, -3.1872, 1, 1, 1, 1, 1,
-0.3198545, 0.0485392, -1.994475, 1, 1, 1, 1, 1,
-0.3164841, 0.5712295, -0.3683214, 1, 1, 1, 1, 1,
-0.314598, 0.5616493, 0.677323, 1, 1, 1, 1, 1,
-0.3067855, 0.6668834, -0.003860669, 1, 1, 1, 1, 1,
-0.3019913, 1.380196, 0.5632467, 1, 1, 1, 1, 1,
-0.3004965, -0.920645, -2.490001, 1, 1, 1, 1, 1,
-0.2975445, 0.01863195, -2.138287, 1, 1, 1, 1, 1,
-0.2974609, 2.33086, 1.125107, 1, 1, 1, 1, 1,
-0.2957816, -0.3545527, -2.997065, 1, 1, 1, 1, 1,
-0.2948318, -1.616137, -2.577228, 1, 1, 1, 1, 1,
-0.292983, -1.129893, -3.309621, 1, 1, 1, 1, 1,
-0.2907354, -0.917942, -2.183185, 1, 1, 1, 1, 1,
-0.2877283, 0.6982763, 1.74589, 1, 1, 1, 1, 1,
-0.2859816, 0.7482477, -0.01857037, 1, 1, 1, 1, 1,
-0.2857614, -0.2448263, -2.041976, 0, 0, 1, 1, 1,
-0.2815423, -0.3180871, -4.616185, 1, 0, 0, 1, 1,
-0.2812092, 0.1560664, -0.8850132, 1, 0, 0, 1, 1,
-0.2801684, -0.00366019, -1.739687, 1, 0, 0, 1, 1,
-0.2786636, -0.1878369, -1.809105, 1, 0, 0, 1, 1,
-0.2756483, 0.1901604, -0.2128507, 1, 0, 0, 1, 1,
-0.2726821, 0.2921056, -3.153396, 0, 0, 0, 1, 1,
-0.2701394, -1.87764, -3.268933, 0, 0, 0, 1, 1,
-0.2663754, -1.134737, -1.976241, 0, 0, 0, 1, 1,
-0.2663456, 1.623792, -1.186416, 0, 0, 0, 1, 1,
-0.2663273, -0.8647562, -2.837899, 0, 0, 0, 1, 1,
-0.2612448, -0.4822108, -3.830913, 0, 0, 0, 1, 1,
-0.2594602, 0.4855572, -0.9987521, 0, 0, 0, 1, 1,
-0.2510253, -0.3132849, -2.64825, 1, 1, 1, 1, 1,
-0.2402514, 0.8193894, -1.720909, 1, 1, 1, 1, 1,
-0.2400436, -1.192273, -3.013502, 1, 1, 1, 1, 1,
-0.2384838, -1.687568, -1.962867, 1, 1, 1, 1, 1,
-0.2381844, -0.7812617, -4.189191, 1, 1, 1, 1, 1,
-0.2337433, -0.4795598, -3.406257, 1, 1, 1, 1, 1,
-0.2333809, -1.164074, -2.498556, 1, 1, 1, 1, 1,
-0.2302186, -1.507943, -2.119081, 1, 1, 1, 1, 1,
-0.2297066, 1.267051, -1.115545, 1, 1, 1, 1, 1,
-0.2250467, 0.5989723, -2.441134, 1, 1, 1, 1, 1,
-0.2203217, 0.7554063, -0.7342052, 1, 1, 1, 1, 1,
-0.2156112, -0.730296, -3.961974, 1, 1, 1, 1, 1,
-0.2141941, -0.4188729, -2.411015, 1, 1, 1, 1, 1,
-0.2095082, 0.324914, -1.646576, 1, 1, 1, 1, 1,
-0.2084133, -0.496785, -1.656619, 1, 1, 1, 1, 1,
-0.2020334, -2.116726, -3.203676, 0, 0, 1, 1, 1,
-0.2015006, 2.016494, 0.6439221, 1, 0, 0, 1, 1,
-0.1913624, 0.5957103, -1.485497, 1, 0, 0, 1, 1,
-0.1859511, 0.3083069, -0.4444386, 1, 0, 0, 1, 1,
-0.1793221, 2.338411, 0.4684907, 1, 0, 0, 1, 1,
-0.1752102, 0.4201365, -0.6644669, 1, 0, 0, 1, 1,
-0.1736827, 0.964124, -1.197494, 0, 0, 0, 1, 1,
-0.1683245, -0.003165032, -1.388555, 0, 0, 0, 1, 1,
-0.1642313, -0.06159938, -3.895921, 0, 0, 0, 1, 1,
-0.1631334, 1.433403, 0.2242939, 0, 0, 0, 1, 1,
-0.1624065, 0.189688, -1.16147, 0, 0, 0, 1, 1,
-0.1613637, 1.191268, -0.09203792, 0, 0, 0, 1, 1,
-0.16008, -0.2469715, -2.505893, 0, 0, 0, 1, 1,
-0.1574123, -0.7186151, -1.360083, 1, 1, 1, 1, 1,
-0.1556183, 2.343049, 0.286598, 1, 1, 1, 1, 1,
-0.1411504, 0.5928194, -0.4257137, 1, 1, 1, 1, 1,
-0.1380216, -0.3053865, -3.224876, 1, 1, 1, 1, 1,
-0.1331018, -1.836422, -2.687963, 1, 1, 1, 1, 1,
-0.1325098, -1.239606, -2.31462, 1, 1, 1, 1, 1,
-0.1324411, 0.6036, -0.5497413, 1, 1, 1, 1, 1,
-0.1312073, 1.477634, 0.6853223, 1, 1, 1, 1, 1,
-0.1263258, 0.6562146, -0.3790603, 1, 1, 1, 1, 1,
-0.1216679, -0.6689627, -2.527563, 1, 1, 1, 1, 1,
-0.1208669, 0.2556426, -0.705072, 1, 1, 1, 1, 1,
-0.1208028, 0.44492, -0.04427839, 1, 1, 1, 1, 1,
-0.1194417, -0.8671447, -2.948669, 1, 1, 1, 1, 1,
-0.1193341, -0.3263452, -1.367342, 1, 1, 1, 1, 1,
-0.1179813, -0.7153251, -3.56043, 1, 1, 1, 1, 1,
-0.1168825, -0.8794876, -2.636636, 0, 0, 1, 1, 1,
-0.111683, -1.30257, -3.160947, 1, 0, 0, 1, 1,
-0.1087783, 1.884956, -0.08886624, 1, 0, 0, 1, 1,
-0.1060071, 0.4607409, -1.704723, 1, 0, 0, 1, 1,
-0.1054297, 0.4555217, -0.4324259, 1, 0, 0, 1, 1,
-0.1028655, 0.2970045, -0.1952642, 1, 0, 0, 1, 1,
-0.102788, -0.3557274, -2.534079, 0, 0, 0, 1, 1,
-0.09963921, -0.05582133, -1.210917, 0, 0, 0, 1, 1,
-0.09912187, -0.6237571, -1.047347, 0, 0, 0, 1, 1,
-0.0910068, 0.667878, -0.1477979, 0, 0, 0, 1, 1,
-0.09095501, 1.502527, 0.877716, 0, 0, 0, 1, 1,
-0.08692312, 0.4045242, 0.2225632, 0, 0, 0, 1, 1,
-0.08542348, -1.954891, -2.59338, 0, 0, 0, 1, 1,
-0.08532786, 1.464724, 0.08218033, 1, 1, 1, 1, 1,
-0.08482619, -0.07361996, -0.7945661, 1, 1, 1, 1, 1,
-0.08164302, 1.306538, 0.4719813, 1, 1, 1, 1, 1,
-0.08090741, -0.8591145, -2.751136, 1, 1, 1, 1, 1,
-0.07926094, 1.129133, 0.65149, 1, 1, 1, 1, 1,
-0.07874665, -2.365982, -4.165422, 1, 1, 1, 1, 1,
-0.07676565, 0.9764864, 0.2432829, 1, 1, 1, 1, 1,
-0.07373057, -0.8316059, -3.824571, 1, 1, 1, 1, 1,
-0.07371336, -0.9787317, -2.336219, 1, 1, 1, 1, 1,
-0.07062742, -0.6370569, -3.305781, 1, 1, 1, 1, 1,
-0.06916479, -1.480713, -0.664138, 1, 1, 1, 1, 1,
-0.06394126, 0.6219496, 2.597075, 1, 1, 1, 1, 1,
-0.05911611, -0.2357512, -3.811182, 1, 1, 1, 1, 1,
-0.05836014, -3.207057, -4.645225, 1, 1, 1, 1, 1,
-0.05825536, 0.9878164, -1.482653, 1, 1, 1, 1, 1,
-0.05800018, 0.3960966, -0.4795341, 0, 0, 1, 1, 1,
-0.05744915, -0.2956791, -2.745717, 1, 0, 0, 1, 1,
-0.05305209, -0.5605358, -1.518424, 1, 0, 0, 1, 1,
-0.04917307, 1.464288, 0.1589854, 1, 0, 0, 1, 1,
-0.04891972, -0.8177885, -4.67682, 1, 0, 0, 1, 1,
-0.04688102, 1.303396, -0.8596861, 1, 0, 0, 1, 1,
-0.04636057, 0.5216967, 2.153095, 0, 0, 0, 1, 1,
-0.04531286, -0.9025562, -2.852137, 0, 0, 0, 1, 1,
-0.04477057, 1.88679, -1.652326, 0, 0, 0, 1, 1,
-0.04375795, 1.38545, 0.5914553, 0, 0, 0, 1, 1,
-0.04102701, -0.3018402, -3.518594, 0, 0, 0, 1, 1,
-0.04038899, 0.2800258, -1.920377, 0, 0, 0, 1, 1,
-0.03924196, 0.2404959, -0.7814688, 0, 0, 0, 1, 1,
-0.03775273, 0.2306821, 0.1444605, 1, 1, 1, 1, 1,
-0.03551795, 0.696148, 0.3377338, 1, 1, 1, 1, 1,
-0.03302646, 0.1520214, 0.5635026, 1, 1, 1, 1, 1,
-0.03142255, 0.6369334, 1.017375, 1, 1, 1, 1, 1,
-0.02128053, 1.575593, -0.1291743, 1, 1, 1, 1, 1,
-0.020799, -0.2479, -2.921594, 1, 1, 1, 1, 1,
-0.01952199, -0.6614949, -3.214082, 1, 1, 1, 1, 1,
-0.01951152, 0.6812423, -0.3082075, 1, 1, 1, 1, 1,
-0.01917102, -0.09884072, -2.670451, 1, 1, 1, 1, 1,
-0.01887551, 1.132571, 0.9673765, 1, 1, 1, 1, 1,
-0.01672794, 0.6439953, -0.5938012, 1, 1, 1, 1, 1,
-0.01363398, 0.8077687, 0.2334112, 1, 1, 1, 1, 1,
-0.00897151, -0.343637, -4.527415, 1, 1, 1, 1, 1,
-0.008676302, -0.9416842, -2.383856, 1, 1, 1, 1, 1,
-0.001221279, -1.686472, -4.831748, 1, 1, 1, 1, 1,
0.003638786, 0.5406668, 1.20771, 0, 0, 1, 1, 1,
0.009405939, -1.487955, 4.000491, 1, 0, 0, 1, 1,
0.01114909, 0.5429649, 1.225165, 1, 0, 0, 1, 1,
0.01206524, 0.4277092, 0.2579537, 1, 0, 0, 1, 1,
0.01467767, -1.257912, 2.357216, 1, 0, 0, 1, 1,
0.01573037, -0.5593639, 3.080642, 1, 0, 0, 1, 1,
0.01593679, -0.2533422, 3.536045, 0, 0, 0, 1, 1,
0.01971686, 0.09228348, -1.874106, 0, 0, 0, 1, 1,
0.0228825, 0.4877174, 1.007816, 0, 0, 0, 1, 1,
0.02407929, -0.6667017, 4.036036, 0, 0, 0, 1, 1,
0.0250233, -2.196649, 1.676224, 0, 0, 0, 1, 1,
0.02741043, -0.2736853, 1.740471, 0, 0, 0, 1, 1,
0.03483449, -0.1568798, 2.562621, 0, 0, 0, 1, 1,
0.03508187, -0.6919299, 4.491908, 1, 1, 1, 1, 1,
0.04430862, -1.988073, 4.467793, 1, 1, 1, 1, 1,
0.04843928, 0.4996316, 1.351924, 1, 1, 1, 1, 1,
0.05337182, 0.8173847, 1.08727, 1, 1, 1, 1, 1,
0.05376368, -0.1309353, 3.413634, 1, 1, 1, 1, 1,
0.05409783, 0.6487922, 0.1097927, 1, 1, 1, 1, 1,
0.05578126, 1.025164, 2.056652, 1, 1, 1, 1, 1,
0.06033122, 0.7093313, 0.09691741, 1, 1, 1, 1, 1,
0.0608109, 0.01937804, 1.197041, 1, 1, 1, 1, 1,
0.06351741, 0.3920232, 0.1118029, 1, 1, 1, 1, 1,
0.06507781, 1.012376, -0.7260956, 1, 1, 1, 1, 1,
0.06866264, 0.2789501, 0.7724647, 1, 1, 1, 1, 1,
0.06959429, 0.0672498, 0.09300639, 1, 1, 1, 1, 1,
0.07388611, -0.8650169, 2.461441, 1, 1, 1, 1, 1,
0.07452707, -0.7011554, 3.814333, 1, 1, 1, 1, 1,
0.07757588, -0.9149271, 4.204473, 0, 0, 1, 1, 1,
0.07835626, 1.018717, 0.434268, 1, 0, 0, 1, 1,
0.07842761, 2.784147, -1.76126, 1, 0, 0, 1, 1,
0.08183143, 0.8694882, -0.0861488, 1, 0, 0, 1, 1,
0.0853428, 2.0637, 1.618549, 1, 0, 0, 1, 1,
0.08626732, 0.5434981, -0.7846217, 1, 0, 0, 1, 1,
0.08701642, -0.7777287, 2.538221, 0, 0, 0, 1, 1,
0.0880736, -1.906321, 2.81614, 0, 0, 0, 1, 1,
0.09107595, 0.6447381, 0.1103708, 0, 0, 0, 1, 1,
0.09576176, -1.207813, 4.162467, 0, 0, 0, 1, 1,
0.09624702, -0.8044473, 3.229396, 0, 0, 0, 1, 1,
0.1005327, -0.3157601, 0.8126026, 0, 0, 0, 1, 1,
0.1044025, -0.06763063, 1.984869, 0, 0, 0, 1, 1,
0.1082195, 2.586446, -0.3502252, 1, 1, 1, 1, 1,
0.1099024, -0.1266508, 2.968132, 1, 1, 1, 1, 1,
0.1125922, 0.736298, 0.7077999, 1, 1, 1, 1, 1,
0.1165684, -0.6694475, 3.781802, 1, 1, 1, 1, 1,
0.1189561, -0.06850763, 1.55596, 1, 1, 1, 1, 1,
0.1232793, 1.302262, 0.6958373, 1, 1, 1, 1, 1,
0.1274835, 2.003856, -0.3523541, 1, 1, 1, 1, 1,
0.1294293, -1.272264, 1.828722, 1, 1, 1, 1, 1,
0.131099, -0.977838, 3.004776, 1, 1, 1, 1, 1,
0.1377816, 0.08633643, 0.9951499, 1, 1, 1, 1, 1,
0.1409758, 0.1779986, 1.895626, 1, 1, 1, 1, 1,
0.1431082, 0.3053127, 0.2176512, 1, 1, 1, 1, 1,
0.1438591, -0.1347673, 1.831298, 1, 1, 1, 1, 1,
0.1474706, 0.6440749, 1.150977, 1, 1, 1, 1, 1,
0.14887, 0.5607482, 0.2969812, 1, 1, 1, 1, 1,
0.1489843, -0.6146666, 2.920088, 0, 0, 1, 1, 1,
0.1492099, -0.633419, 4.768586, 1, 0, 0, 1, 1,
0.1499765, -1.127128, 3.766273, 1, 0, 0, 1, 1,
0.1504109, -0.3241521, 3.272578, 1, 0, 0, 1, 1,
0.1535383, -0.04122853, 2.321347, 1, 0, 0, 1, 1,
0.1566556, 0.1952529, 1.395334, 1, 0, 0, 1, 1,
0.1623053, -2.271469, 3.485002, 0, 0, 0, 1, 1,
0.1640557, -0.4390057, 1.196416, 0, 0, 0, 1, 1,
0.1662694, 1.378713, 0.002604787, 0, 0, 0, 1, 1,
0.166997, -1.722764, 0.9537147, 0, 0, 0, 1, 1,
0.172979, -0.5392202, 2.668292, 0, 0, 0, 1, 1,
0.1803761, 0.02528308, 2.492127, 0, 0, 0, 1, 1,
0.1809397, 0.1894253, 0.04155437, 0, 0, 0, 1, 1,
0.1812608, 1.329153, 0.05111404, 1, 1, 1, 1, 1,
0.181692, 0.9610842, -0.6538378, 1, 1, 1, 1, 1,
0.1839472, -0.2895773, 2.901327, 1, 1, 1, 1, 1,
0.1856405, 0.9551305, 0.5324796, 1, 1, 1, 1, 1,
0.1875, 1.679053, 1.220147, 1, 1, 1, 1, 1,
0.1889241, -0.5700493, 1.586336, 1, 1, 1, 1, 1,
0.1947041, -2.082925, 6.091039, 1, 1, 1, 1, 1,
0.1949625, -0.08674562, 2.01968, 1, 1, 1, 1, 1,
0.1985007, -1.202529, 4.594625, 1, 1, 1, 1, 1,
0.2007544, -0.02270615, 0.7520948, 1, 1, 1, 1, 1,
0.2043777, 0.6056746, 1.13413, 1, 1, 1, 1, 1,
0.2043854, -1.547621, 2.928207, 1, 1, 1, 1, 1,
0.206908, -1.363593, 2.836959, 1, 1, 1, 1, 1,
0.2083147, 0.8619823, -0.4376397, 1, 1, 1, 1, 1,
0.2128352, -0.07260345, 0.9604441, 1, 1, 1, 1, 1,
0.2143139, 0.9338534, 0.1231987, 0, 0, 1, 1, 1,
0.215804, -0.6676521, 2.31515, 1, 0, 0, 1, 1,
0.2175206, -0.6776871, 2.548018, 1, 0, 0, 1, 1,
0.2194111, 0.4831378, -0.702388, 1, 0, 0, 1, 1,
0.2205054, -1.913387, 2.860622, 1, 0, 0, 1, 1,
0.2253431, -2.060222, 3.307261, 1, 0, 0, 1, 1,
0.2264939, -0.9526381, 4.373646, 0, 0, 0, 1, 1,
0.2270097, -0.2276874, 1.680822, 0, 0, 0, 1, 1,
0.2297429, 2.034644, 0.09266815, 0, 0, 0, 1, 1,
0.2492815, -1.220754, -0.2433403, 0, 0, 0, 1, 1,
0.2515738, -2.419545, 2.428051, 0, 0, 0, 1, 1,
0.253876, -1.607844, 3.13914, 0, 0, 0, 1, 1,
0.2551808, -0.0682262, -0.8486643, 0, 0, 0, 1, 1,
0.258183, -0.3026369, 0.9042339, 1, 1, 1, 1, 1,
0.2589068, -1.61684, 3.666708, 1, 1, 1, 1, 1,
0.2633471, 0.5637686, 1.79402, 1, 1, 1, 1, 1,
0.2647747, -1.492787, 1.350569, 1, 1, 1, 1, 1,
0.2718829, -1.075647, 1.264006, 1, 1, 1, 1, 1,
0.2772663, -0.5250905, 2.881878, 1, 1, 1, 1, 1,
0.2774901, -0.02693687, 3.379405, 1, 1, 1, 1, 1,
0.278071, 2.244237, 0.779579, 1, 1, 1, 1, 1,
0.2834896, 1.865305, 1.978054, 1, 1, 1, 1, 1,
0.2851017, -0.5083785, 3.849395, 1, 1, 1, 1, 1,
0.286206, -0.04291113, 1.626596, 1, 1, 1, 1, 1,
0.2964762, 0.5835069, 0.5437813, 1, 1, 1, 1, 1,
0.297023, 1.104402, -0.03241995, 1, 1, 1, 1, 1,
0.3078671, 0.3212608, 0.6279476, 1, 1, 1, 1, 1,
0.3095742, -0.4912803, 4.239434, 1, 1, 1, 1, 1,
0.3098253, 0.5799308, 0.7287154, 0, 0, 1, 1, 1,
0.3136732, -0.794805, 3.704212, 1, 0, 0, 1, 1,
0.314341, -0.01797126, -0.3491479, 1, 0, 0, 1, 1,
0.3185277, 0.9649444, 0.6557967, 1, 0, 0, 1, 1,
0.3223919, -0.5947134, 3.189788, 1, 0, 0, 1, 1,
0.3262365, -1.216303, 3.365352, 1, 0, 0, 1, 1,
0.3276317, -0.1619652, 3.178152, 0, 0, 0, 1, 1,
0.3291847, 1.861215, -1.033671, 0, 0, 0, 1, 1,
0.3293225, 0.5717293, 0.7713104, 0, 0, 0, 1, 1,
0.3332951, -0.5047516, 2.306717, 0, 0, 0, 1, 1,
0.3338981, -1.285705, 2.076855, 0, 0, 0, 1, 1,
0.3354309, -0.5930538, 3.705752, 0, 0, 0, 1, 1,
0.3355963, -0.3948737, 3.015899, 0, 0, 0, 1, 1,
0.3368964, 1.037786, 0.8306132, 1, 1, 1, 1, 1,
0.3394005, 1.397472, -0.2646322, 1, 1, 1, 1, 1,
0.3403544, -1.229611, 3.704177, 1, 1, 1, 1, 1,
0.3501261, -0.5711735, 2.990622, 1, 1, 1, 1, 1,
0.3503647, -0.2655594, 1.55583, 1, 1, 1, 1, 1,
0.3520919, 1.059921, -0.6890948, 1, 1, 1, 1, 1,
0.3531525, -0.2948408, 2.171349, 1, 1, 1, 1, 1,
0.3566362, 0.6808482, -0.5863876, 1, 1, 1, 1, 1,
0.3568583, 0.5471098, 0.4925545, 1, 1, 1, 1, 1,
0.3578142, 0.2237656, 1.099745, 1, 1, 1, 1, 1,
0.3656438, -1.522783, 3.057098, 1, 1, 1, 1, 1,
0.3657381, 1.142602, -0.1378679, 1, 1, 1, 1, 1,
0.3660927, -1.063532, 1.587556, 1, 1, 1, 1, 1,
0.3687097, -1.952261, 2.926149, 1, 1, 1, 1, 1,
0.3711518, 0.8957846, -1.475118, 1, 1, 1, 1, 1,
0.3788396, -0.5391546, 1.207384, 0, 0, 1, 1, 1,
0.3804979, -0.007586425, 2.470519, 1, 0, 0, 1, 1,
0.3806076, -0.8044736, 1.872406, 1, 0, 0, 1, 1,
0.3817511, 1.526866, 0.5963261, 1, 0, 0, 1, 1,
0.3849612, -1.543072, 2.370478, 1, 0, 0, 1, 1,
0.3902665, -0.9039415, 2.599052, 1, 0, 0, 1, 1,
0.3904787, -2.782687, 2.480338, 0, 0, 0, 1, 1,
0.3908081, 1.643268, 0.7258856, 0, 0, 0, 1, 1,
0.395978, -1.805173, 1.112422, 0, 0, 0, 1, 1,
0.3963275, -0.1614098, 1.505154, 0, 0, 0, 1, 1,
0.3968128, 1.265306, 1.409019, 0, 0, 0, 1, 1,
0.4023463, 2.092003, 0.7389092, 0, 0, 0, 1, 1,
0.4033682, 0.905738, 1.354728, 0, 0, 0, 1, 1,
0.4128982, -0.1925552, 2.649163, 1, 1, 1, 1, 1,
0.4141908, -0.4532619, 2.969704, 1, 1, 1, 1, 1,
0.4147063, 1.254952, -0.4918068, 1, 1, 1, 1, 1,
0.4214568, 0.4500206, -0.05641948, 1, 1, 1, 1, 1,
0.4264023, -0.599342, 1.288071, 1, 1, 1, 1, 1,
0.426452, -0.9690021, 2.776604, 1, 1, 1, 1, 1,
0.4286275, -1.140597, 3.234402, 1, 1, 1, 1, 1,
0.4297428, -1.811741, 3.711353, 1, 1, 1, 1, 1,
0.4316134, -0.347417, 1.435426, 1, 1, 1, 1, 1,
0.436767, 0.7030208, -1.553791, 1, 1, 1, 1, 1,
0.437599, -0.7038002, 2.135691, 1, 1, 1, 1, 1,
0.4405043, 0.5062381, -0.1278191, 1, 1, 1, 1, 1,
0.4418801, -0.546934, 2.901172, 1, 1, 1, 1, 1,
0.4430514, -0.909445, 3.892453, 1, 1, 1, 1, 1,
0.4468614, -0.4713939, 2.598482, 1, 1, 1, 1, 1,
0.4479556, -0.2942965, 1.902704, 0, 0, 1, 1, 1,
0.4504291, 0.2333897, 2.232078, 1, 0, 0, 1, 1,
0.4586547, 0.5086144, 0.3455716, 1, 0, 0, 1, 1,
0.460824, 0.04439767, 2.93697, 1, 0, 0, 1, 1,
0.4620374, 0.1806708, 2.023335, 1, 0, 0, 1, 1,
0.4623336, 0.8976715, 0.6179454, 1, 0, 0, 1, 1,
0.4664803, -0.5764557, 2.590119, 0, 0, 0, 1, 1,
0.4670494, 1.5891, -0.04325912, 0, 0, 0, 1, 1,
0.4695873, 0.4292216, 1.152795, 0, 0, 0, 1, 1,
0.4725718, -1.601568, 0.4666284, 0, 0, 0, 1, 1,
0.4765114, 3.317265, 0.2916475, 0, 0, 0, 1, 1,
0.4870067, -0.5358635, 1.554132, 0, 0, 0, 1, 1,
0.4875983, -0.5361599, 2.707529, 0, 0, 0, 1, 1,
0.4882628, 1.396744, 1.192845, 1, 1, 1, 1, 1,
0.4890369, 1.503492, 0.8603482, 1, 1, 1, 1, 1,
0.4915406, -0.6089184, 2.101691, 1, 1, 1, 1, 1,
0.4989349, 0.5556381, 1.137705, 1, 1, 1, 1, 1,
0.503721, 0.07089165, -0.1581113, 1, 1, 1, 1, 1,
0.5075526, -0.5677792, 3.071906, 1, 1, 1, 1, 1,
0.5085425, 0.1538472, 2.953982, 1, 1, 1, 1, 1,
0.5101277, 1.324757, 1.372671, 1, 1, 1, 1, 1,
0.5101346, -0.1278552, 2.269419, 1, 1, 1, 1, 1,
0.5122591, -1.228137, 4.016474, 1, 1, 1, 1, 1,
0.5161279, -0.9316676, 4.985054, 1, 1, 1, 1, 1,
0.5213854, 1.984193, 0.9809155, 1, 1, 1, 1, 1,
0.5231524, -1.730208, 1.654739, 1, 1, 1, 1, 1,
0.5260041, 2.079692, 0.3484741, 1, 1, 1, 1, 1,
0.527553, 0.1056761, 2.37312, 1, 1, 1, 1, 1,
0.5305948, 1.540666, -0.4432347, 0, 0, 1, 1, 1,
0.5370446, 1.069252, 1.135269, 1, 0, 0, 1, 1,
0.5414377, 0.80074, 0.6155024, 1, 0, 0, 1, 1,
0.5464722, -0.7134302, 3.722401, 1, 0, 0, 1, 1,
0.5470281, -0.5141761, 2.686714, 1, 0, 0, 1, 1,
0.5479097, 1.281116, 1.697806, 1, 0, 0, 1, 1,
0.5492696, -1.494266, 2.219996, 0, 0, 0, 1, 1,
0.5509909, 1.378343, 0.3037302, 0, 0, 0, 1, 1,
0.5510927, -0.1648393, 2.456294, 0, 0, 0, 1, 1,
0.5566921, 0.2325687, 3.49695, 0, 0, 0, 1, 1,
0.5567975, -0.6159512, 4.303459, 0, 0, 0, 1, 1,
0.5579946, -0.1847163, 2.683399, 0, 0, 0, 1, 1,
0.5628985, -0.4445164, 2.789038, 0, 0, 0, 1, 1,
0.5661333, -1.914026, 3.148968, 1, 1, 1, 1, 1,
0.5670974, -0.07858405, 1.862516, 1, 1, 1, 1, 1,
0.5672844, 0.02739293, 1.263417, 1, 1, 1, 1, 1,
0.5672915, 1.431644, 0.8960048, 1, 1, 1, 1, 1,
0.571205, -0.4218594, 3.823347, 1, 1, 1, 1, 1,
0.5747557, 0.4133673, 0.7375524, 1, 1, 1, 1, 1,
0.5761954, -2.220684, 3.53933, 1, 1, 1, 1, 1,
0.5780655, 0.2582753, 0.2268099, 1, 1, 1, 1, 1,
0.580965, 0.8002593, 2.525653, 1, 1, 1, 1, 1,
0.5882081, 0.4550443, 2.174398, 1, 1, 1, 1, 1,
0.5911031, 0.3269058, 1.604415, 1, 1, 1, 1, 1,
0.5943251, 2.469509, 0.2016786, 1, 1, 1, 1, 1,
0.5971524, 0.5988284, 1.933117, 1, 1, 1, 1, 1,
0.5975686, -0.6186917, 4.076816, 1, 1, 1, 1, 1,
0.598147, 0.5139141, 0.7393998, 1, 1, 1, 1, 1,
0.6015231, -0.0383969, 1.106729, 0, 0, 1, 1, 1,
0.6054177, 0.4550301, -1.336417, 1, 0, 0, 1, 1,
0.607414, 1.040884, 1.22109, 1, 0, 0, 1, 1,
0.6121847, -0.8521004, 1.385682, 1, 0, 0, 1, 1,
0.613309, -0.7410764, 2.653422, 1, 0, 0, 1, 1,
0.615617, 3.387557, 0.7775738, 1, 0, 0, 1, 1,
0.6157483, -0.2043997, 0.6527792, 0, 0, 0, 1, 1,
0.6186948, 0.2036849, -0.4306369, 0, 0, 0, 1, 1,
0.6193338, 0.4139753, -0.7475535, 0, 0, 0, 1, 1,
0.6209701, -0.9854876, 3.151496, 0, 0, 0, 1, 1,
0.6242102, 0.9128678, 0.8929589, 0, 0, 0, 1, 1,
0.6253486, -1.681027, 3.615308, 0, 0, 0, 1, 1,
0.6271201, -0.8005434, 2.263371, 0, 0, 0, 1, 1,
0.631717, -2.820339, 2.838943, 1, 1, 1, 1, 1,
0.6334704, -0.2504065, 1.74143, 1, 1, 1, 1, 1,
0.6341929, 0.8424187, 1.873223, 1, 1, 1, 1, 1,
0.6460394, 0.532728, 2.181453, 1, 1, 1, 1, 1,
0.6523093, -0.8020722, 1.73467, 1, 1, 1, 1, 1,
0.6524487, 1.046881, -0.5600942, 1, 1, 1, 1, 1,
0.6539355, -0.7881261, 3.456884, 1, 1, 1, 1, 1,
0.6544982, 0.7589848, -0.1159174, 1, 1, 1, 1, 1,
0.6547201, -0.5310173, 2.746383, 1, 1, 1, 1, 1,
0.655987, -1.875967, 3.444678, 1, 1, 1, 1, 1,
0.6607192, 0.4928714, 0.8475832, 1, 1, 1, 1, 1,
0.6616306, -1.479086, 3.948574, 1, 1, 1, 1, 1,
0.6632105, 1.46763, -0.250618, 1, 1, 1, 1, 1,
0.6665962, -1.790265, 2.69839, 1, 1, 1, 1, 1,
0.6705623, 1.712146, 0.1458382, 1, 1, 1, 1, 1,
0.6807702, -0.4840609, 1.65524, 0, 0, 1, 1, 1,
0.6846491, 0.4003821, 1.851458, 1, 0, 0, 1, 1,
0.6911694, 0.2917882, 2.092212, 1, 0, 0, 1, 1,
0.6923102, 0.615569, 0.5464784, 1, 0, 0, 1, 1,
0.7005987, -0.7034255, 1.79511, 1, 0, 0, 1, 1,
0.700828, -1.121692, 1.286875, 1, 0, 0, 1, 1,
0.7018072, 0.2492124, 2.074224, 0, 0, 0, 1, 1,
0.7064564, -0.05010746, 0.9065408, 0, 0, 0, 1, 1,
0.707548, -0.9554312, 2.886978, 0, 0, 0, 1, 1,
0.7081117, -0.07786372, 2.477943, 0, 0, 0, 1, 1,
0.7103778, -1.057157, 2.232603, 0, 0, 0, 1, 1,
0.7119653, 0.3496332, 0.3983207, 0, 0, 0, 1, 1,
0.7121083, 0.623684, 0.9920425, 0, 0, 0, 1, 1,
0.7134926, 0.09200147, 0.3920734, 1, 1, 1, 1, 1,
0.7149103, -1.550964, 3.775127, 1, 1, 1, 1, 1,
0.7162336, -0.150469, 1.19761, 1, 1, 1, 1, 1,
0.7215217, 0.4110264, -0.2328395, 1, 1, 1, 1, 1,
0.7220793, -0.8240028, 2.730889, 1, 1, 1, 1, 1,
0.7231227, 0.1919962, 0.2082198, 1, 1, 1, 1, 1,
0.7338744, 0.462633, 1.716176, 1, 1, 1, 1, 1,
0.7341674, -0.3036895, 0.3450958, 1, 1, 1, 1, 1,
0.7364619, 0.8730586, 0.9389506, 1, 1, 1, 1, 1,
0.7371261, 0.3760602, 1.064069, 1, 1, 1, 1, 1,
0.7497226, -0.1948675, 2.850899, 1, 1, 1, 1, 1,
0.7527111, -3.07847, 3.424971, 1, 1, 1, 1, 1,
0.7576283, -0.8332637, 2.284874, 1, 1, 1, 1, 1,
0.7613644, -0.1912164, -0.2478155, 1, 1, 1, 1, 1,
0.7707143, 0.204539, 0.7737666, 1, 1, 1, 1, 1,
0.7708852, 0.8953795, 0.5065406, 0, 0, 1, 1, 1,
0.7743948, 0.758881, -0.8577856, 1, 0, 0, 1, 1,
0.7744441, 0.2276019, 2.777753, 1, 0, 0, 1, 1,
0.776346, -0.2597167, 1.188552, 1, 0, 0, 1, 1,
0.7784408, -1.026956, 3.743866, 1, 0, 0, 1, 1,
0.7799611, 0.2816485, 1.850378, 1, 0, 0, 1, 1,
0.7803933, 0.6412628, 0.1108106, 0, 0, 0, 1, 1,
0.7838808, 0.8985146, 0.592549, 0, 0, 0, 1, 1,
0.7847891, 0.4116249, 1.076318, 0, 0, 0, 1, 1,
0.7960036, 0.044587, 0.06247283, 0, 0, 0, 1, 1,
0.8003508, 0.4702949, 1.74636, 0, 0, 0, 1, 1,
0.8021384, -0.3790087, 0.4396362, 0, 0, 0, 1, 1,
0.8048634, -0.8558062, 2.522697, 0, 0, 0, 1, 1,
0.8065816, -1.190175, 2.238666, 1, 1, 1, 1, 1,
0.8159478, -0.04680233, 1.203369, 1, 1, 1, 1, 1,
0.8166029, -1.324278, 2.411267, 1, 1, 1, 1, 1,
0.8181996, 0.3492296, 1.618469, 1, 1, 1, 1, 1,
0.8206667, -1.026275, 2.844867, 1, 1, 1, 1, 1,
0.8276039, -2.299767, 4.039444, 1, 1, 1, 1, 1,
0.8288433, 1.012602, 0.6519455, 1, 1, 1, 1, 1,
0.8315244, 1.046703, 1.691556, 1, 1, 1, 1, 1,
0.8319397, 0.124672, 1.061507, 1, 1, 1, 1, 1,
0.8324535, 0.80967, 0.6492897, 1, 1, 1, 1, 1,
0.8324965, 2.189249, -0.1470144, 1, 1, 1, 1, 1,
0.8459411, 0.01962481, 1.089556, 1, 1, 1, 1, 1,
0.8465316, -0.4816322, 4.677819, 1, 1, 1, 1, 1,
0.8479013, 0.2438145, 2.234554, 1, 1, 1, 1, 1,
0.8541684, -1.63824, 2.294516, 1, 1, 1, 1, 1,
0.8561806, -0.06134747, 3.05176, 0, 0, 1, 1, 1,
0.860114, -0.296064, 2.793744, 1, 0, 0, 1, 1,
0.8621433, 0.1956658, 0.3444497, 1, 0, 0, 1, 1,
0.8624748, 0.399947, 0.9583586, 1, 0, 0, 1, 1,
0.8631296, -0.3636376, 1.538485, 1, 0, 0, 1, 1,
0.8632024, -0.06762489, 1.667463, 1, 0, 0, 1, 1,
0.8661782, -0.1855631, 2.633779, 0, 0, 0, 1, 1,
0.8674766, -0.8505068, 0.501717, 0, 0, 0, 1, 1,
0.8713615, 0.4988314, 2.278723, 0, 0, 0, 1, 1,
0.8738562, 2.006106, 0.5571986, 0, 0, 0, 1, 1,
0.877326, 1.469899, -2.031012, 0, 0, 0, 1, 1,
0.8775092, -0.7399153, 1.591044, 0, 0, 0, 1, 1,
0.8784057, -0.2965517, 2.239796, 0, 0, 0, 1, 1,
0.8796631, -0.5098819, 4.397213, 1, 1, 1, 1, 1,
0.8807628, -2.678803, 2.683398, 1, 1, 1, 1, 1,
0.8812585, -0.6253797, 2.887956, 1, 1, 1, 1, 1,
0.8907314, -1.276821, 1.42207, 1, 1, 1, 1, 1,
0.8985138, -0.936141, 0.7263817, 1, 1, 1, 1, 1,
0.9068528, -1.286849, 1.293257, 1, 1, 1, 1, 1,
0.9078709, 0.2542507, 1.692694, 1, 1, 1, 1, 1,
0.9090398, -0.5752053, 2.23119, 1, 1, 1, 1, 1,
0.916255, -0.2200752, 2.117437, 1, 1, 1, 1, 1,
0.9203892, -0.6987111, 2.400874, 1, 1, 1, 1, 1,
0.9210057, -0.7429903, 3.500704, 1, 1, 1, 1, 1,
0.9244254, 0.04734222, 2.097882, 1, 1, 1, 1, 1,
0.93118, 0.535485, 1.981186, 1, 1, 1, 1, 1,
0.9393049, -0.6565078, 1.588602, 1, 1, 1, 1, 1,
0.9415111, -0.3647465, 1.802216, 1, 1, 1, 1, 1,
0.9469687, -1.103187, 2.279221, 0, 0, 1, 1, 1,
0.9511737, -1.30311, 1.352376, 1, 0, 0, 1, 1,
0.9525073, -0.3304409, 2.445041, 1, 0, 0, 1, 1,
0.9542253, 0.2717894, 1.00176, 1, 0, 0, 1, 1,
0.9645513, -0.9092581, 3.655336, 1, 0, 0, 1, 1,
0.9716072, -0.6080629, 3.367346, 1, 0, 0, 1, 1,
0.9781295, -1.08555, 2.511852, 0, 0, 0, 1, 1,
0.9792344, -1.175172, 3.21357, 0, 0, 0, 1, 1,
0.9821744, 0.3419589, 1.948833, 0, 0, 0, 1, 1,
0.9967698, 0.06354538, 1.742898, 0, 0, 0, 1, 1,
0.9980714, 0.3876789, 1.60498, 0, 0, 0, 1, 1,
0.999408, -0.1332041, 0.07376517, 0, 0, 0, 1, 1,
0.9999979, -0.6143727, 0.08778401, 0, 0, 0, 1, 1,
1.004148, 0.7062777, 1.487447, 1, 1, 1, 1, 1,
1.004944, -1.108596, 1.447742, 1, 1, 1, 1, 1,
1.012091, -0.1281033, 0.9209545, 1, 1, 1, 1, 1,
1.012196, 0.4073868, -0.1710881, 1, 1, 1, 1, 1,
1.01288, -0.1948135, 2.201527, 1, 1, 1, 1, 1,
1.015071, 2.145166, 0.6916571, 1, 1, 1, 1, 1,
1.032545, -1.959644, 2.96823, 1, 1, 1, 1, 1,
1.033399, 1.028994, 0.7441945, 1, 1, 1, 1, 1,
1.033587, -1.123177, 2.54796, 1, 1, 1, 1, 1,
1.050266, 1.737051, 0.6831967, 1, 1, 1, 1, 1,
1.051319, -1.607974, 1.378977, 1, 1, 1, 1, 1,
1.061053, -2.062582, 2.624048, 1, 1, 1, 1, 1,
1.070783, -1.728176, 2.473398, 1, 1, 1, 1, 1,
1.085742, 0.7609903, 1.219266, 1, 1, 1, 1, 1,
1.095442, 1.123209, -0.9219348, 1, 1, 1, 1, 1,
1.100825, 0.4717387, 1.64374, 0, 0, 1, 1, 1,
1.10238, 0.4891627, 1.792344, 1, 0, 0, 1, 1,
1.109224, 0.1904516, 2.122009, 1, 0, 0, 1, 1,
1.112735, -1.153705, 1.493915, 1, 0, 0, 1, 1,
1.112799, 1.060875, 1.151619, 1, 0, 0, 1, 1,
1.114741, 0.8002645, 0.2761355, 1, 0, 0, 1, 1,
1.120182, -0.9156967, 2.694886, 0, 0, 0, 1, 1,
1.141278, 0.4721912, 0.600956, 0, 0, 0, 1, 1,
1.147529, -0.04640652, 1.331602, 0, 0, 0, 1, 1,
1.187388, 0.04191935, 1.633188, 0, 0, 0, 1, 1,
1.194929, -0.2740804, 1.098362, 0, 0, 0, 1, 1,
1.198851, 0.5318604, 1.171829, 0, 0, 0, 1, 1,
1.203864, 0.5692287, 2.454592, 0, 0, 0, 1, 1,
1.204321, 0.7779346, 1.553852, 1, 1, 1, 1, 1,
1.20722, -1.28582, 2.83365, 1, 1, 1, 1, 1,
1.208542, -0.08943859, 2.419541, 1, 1, 1, 1, 1,
1.21148, -0.5944884, 2.689853, 1, 1, 1, 1, 1,
1.217484, 0.1034979, 1.029372, 1, 1, 1, 1, 1,
1.229958, -0.1232167, 0.4750554, 1, 1, 1, 1, 1,
1.230917, 0.8096566, -1.355177, 1, 1, 1, 1, 1,
1.236711, 0.7871993, 0.8119577, 1, 1, 1, 1, 1,
1.238689, -1.858103, 1.486858, 1, 1, 1, 1, 1,
1.238947, -0.4316858, 1.413659, 1, 1, 1, 1, 1,
1.239899, 0.1024563, 1.952676, 1, 1, 1, 1, 1,
1.240317, -0.7522646, 1.719294, 1, 1, 1, 1, 1,
1.247213, -1.501763, 3.293065, 1, 1, 1, 1, 1,
1.24953, -0.1463535, 5.03533, 1, 1, 1, 1, 1,
1.255758, -1.069051, 3.957464, 1, 1, 1, 1, 1,
1.255986, -0.4787471, 1.956165, 0, 0, 1, 1, 1,
1.258477, 0.84555, -0.06463952, 1, 0, 0, 1, 1,
1.267012, 1.896559, -1.443229, 1, 0, 0, 1, 1,
1.267143, 0.7372356, -0.25888, 1, 0, 0, 1, 1,
1.273126, 0.7490288, 0.7020513, 1, 0, 0, 1, 1,
1.284071, -0.3677465, 2.465721, 1, 0, 0, 1, 1,
1.290546, -0.1249391, 1.96202, 0, 0, 0, 1, 1,
1.296028, 1.48578, -0.6568048, 0, 0, 0, 1, 1,
1.306071, 0.7483379, 1.135463, 0, 0, 0, 1, 1,
1.340718, -0.6753252, 1.411703, 0, 0, 0, 1, 1,
1.343573, 2.038298, 0.5053574, 0, 0, 0, 1, 1,
1.352325, -2.281159, 3.649943, 0, 0, 0, 1, 1,
1.375826, -2.031957, 4.323671, 0, 0, 0, 1, 1,
1.380371, 0.07957865, 0.9542771, 1, 1, 1, 1, 1,
1.383045, 0.03432333, 1.357863, 1, 1, 1, 1, 1,
1.399412, -1.792038, 0.9475146, 1, 1, 1, 1, 1,
1.40781, 0.06349039, 3.314555, 1, 1, 1, 1, 1,
1.41236, 0.1408476, 1.939464, 1, 1, 1, 1, 1,
1.43099, -0.1659442, 1.983279, 1, 1, 1, 1, 1,
1.436383, -3.344758, 3.735961, 1, 1, 1, 1, 1,
1.473248, -0.05082228, 2.332188, 1, 1, 1, 1, 1,
1.477832, 0.5334993, 1.030626, 1, 1, 1, 1, 1,
1.478913, -1.066642, 2.17023, 1, 1, 1, 1, 1,
1.482408, 1.199808, 0.5237573, 1, 1, 1, 1, 1,
1.490132, 0.69368, 0.1777451, 1, 1, 1, 1, 1,
1.491868, -0.5836232, 2.710946, 1, 1, 1, 1, 1,
1.499581, 0.04533213, 1.931196, 1, 1, 1, 1, 1,
1.500801, 1.484172, -0.25953, 1, 1, 1, 1, 1,
1.513237, -0.3215599, 2.112241, 0, 0, 1, 1, 1,
1.515534, -1.258532, 2.867743, 1, 0, 0, 1, 1,
1.520428, 0.2980711, 2.382548, 1, 0, 0, 1, 1,
1.524156, -1.118158, 2.453303, 1, 0, 0, 1, 1,
1.533343, 0.8433381, 1.629965, 1, 0, 0, 1, 1,
1.537736, -0.0888833, 0.7127367, 1, 0, 0, 1, 1,
1.543548, 1.002805, 1.379224, 0, 0, 0, 1, 1,
1.551001, 2.150267, -0.0948831, 0, 0, 0, 1, 1,
1.553794, -1.843435, 2.542216, 0, 0, 0, 1, 1,
1.563847, -1.671949, 1.112587, 0, 0, 0, 1, 1,
1.567874, 1.02369, 1.318589, 0, 0, 0, 1, 1,
1.574116, -0.8664951, 1.202551, 0, 0, 0, 1, 1,
1.588679, -0.04666903, 1.872072, 0, 0, 0, 1, 1,
1.590541, 0.1518699, 1.868985, 1, 1, 1, 1, 1,
1.600962, -0.5278592, 0.7765173, 1, 1, 1, 1, 1,
1.603215, 0.3346704, 3.586383, 1, 1, 1, 1, 1,
1.603816, 0.03647159, 2.545659, 1, 1, 1, 1, 1,
1.62123, -0.7072635, 2.410184, 1, 1, 1, 1, 1,
1.639255, 0.4021527, 2.062813, 1, 1, 1, 1, 1,
1.641862, 1.16473, 1.97163, 1, 1, 1, 1, 1,
1.647104, 0.2675088, 0.6657415, 1, 1, 1, 1, 1,
1.649756, 0.6040666, 0.2405774, 1, 1, 1, 1, 1,
1.650543, 0.7342514, 0.7655397, 1, 1, 1, 1, 1,
1.65571, -0.8389497, 0.2440151, 1, 1, 1, 1, 1,
1.658638, 0.6717653, 1.247291, 1, 1, 1, 1, 1,
1.659124, -0.5666345, 3.004384, 1, 1, 1, 1, 1,
1.673754, -0.01139583, 0.08157264, 1, 1, 1, 1, 1,
1.680336, -1.558337, 1.966656, 1, 1, 1, 1, 1,
1.701536, 0.990837, 1.18913, 0, 0, 1, 1, 1,
1.712985, -0.9878868, 2.05143, 1, 0, 0, 1, 1,
1.715638, -0.3810206, 0.1241711, 1, 0, 0, 1, 1,
1.722016, -0.8804323, 2.896864, 1, 0, 0, 1, 1,
1.731478, 0.7756788, 1.873332, 1, 0, 0, 1, 1,
1.733696, -0.3554254, 0.3301877, 1, 0, 0, 1, 1,
1.736639, -2.730734, 1.686553, 0, 0, 0, 1, 1,
1.750029, -0.905314, 1.527154, 0, 0, 0, 1, 1,
1.767227, -0.1783722, 2.175889, 0, 0, 0, 1, 1,
1.788651, 0.4066313, 0.5740359, 0, 0, 0, 1, 1,
1.798195, 0.1728275, 0.8855393, 0, 0, 0, 1, 1,
1.813851, -2.576991, 3.656329, 0, 0, 0, 1, 1,
1.826589, -0.667755, 0.3280312, 0, 0, 0, 1, 1,
1.829629, -0.5459284, 1.354604, 1, 1, 1, 1, 1,
1.837066, -0.06494626, 3.253468, 1, 1, 1, 1, 1,
1.839427, -2.297515, 1.499704, 1, 1, 1, 1, 1,
1.842342, -1.530092, 1.912081, 1, 1, 1, 1, 1,
1.84368, 0.8483192, 2.936977, 1, 1, 1, 1, 1,
1.857014, 1.089572, 2.214272, 1, 1, 1, 1, 1,
1.861803, 0.1199755, 1.554469, 1, 1, 1, 1, 1,
1.865148, 0.5004373, 1.72662, 1, 1, 1, 1, 1,
1.886345, 0.09812985, 2.672275, 1, 1, 1, 1, 1,
1.895474, -0.3527209, 2.457007, 1, 1, 1, 1, 1,
1.909266, -1.464027, 1.851725, 1, 1, 1, 1, 1,
1.911451, 0.2995544, 1.929228, 1, 1, 1, 1, 1,
1.933455, -0.7729688, 3.789211, 1, 1, 1, 1, 1,
1.950341, 0.8551159, 0.9382433, 1, 1, 1, 1, 1,
1.976464, -0.8739757, 2.357657, 1, 1, 1, 1, 1,
1.980821, 1.64429, 0.3964967, 0, 0, 1, 1, 1,
2.023996, 0.08404954, 1.682323, 1, 0, 0, 1, 1,
2.032924, -0.7792951, -0.4006566, 1, 0, 0, 1, 1,
2.047818, -0.8822631, 3.611612, 1, 0, 0, 1, 1,
2.061279, 1.527759, 0.4832427, 1, 0, 0, 1, 1,
2.064998, 0.5215134, 0.8147558, 1, 0, 0, 1, 1,
2.100712, -0.3276947, 2.517965, 0, 0, 0, 1, 1,
2.229131, -1.588349, 2.568352, 0, 0, 0, 1, 1,
2.28256, -2.847914, 1.68322, 0, 0, 0, 1, 1,
2.291532, -2.705522, 2.888392, 0, 0, 0, 1, 1,
2.302837, -0.6132873, 2.695276, 0, 0, 0, 1, 1,
2.319648, 0.3135377, 0.8127468, 0, 0, 0, 1, 1,
2.352617, -0.1802662, 2.045394, 0, 0, 0, 1, 1,
2.430362, -1.032593, 1.670994, 1, 1, 1, 1, 1,
2.553117, 1.720744, 2.413812, 1, 1, 1, 1, 1,
2.671945, -0.2977271, 0.2430288, 1, 1, 1, 1, 1,
3.099359, -1.137825, 1.286104, 1, 1, 1, 1, 1,
3.401224, -0.1950443, 2.733992, 1, 1, 1, 1, 1,
3.967258, -1.043729, 2.373044, 1, 1, 1, 1, 1,
4.888734, -0.04648499, 1.08322, 1, 1, 1, 1, 1
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
var radius = 10.33519;
var distance = 36.30192;
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
mvMatrix.translate( -0.7095659, -0.0213995, -0.5802236 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.30192);
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
